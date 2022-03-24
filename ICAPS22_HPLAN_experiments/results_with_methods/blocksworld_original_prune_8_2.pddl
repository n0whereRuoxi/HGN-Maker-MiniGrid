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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124390 - BLOCK
      ?auto_124391 - BLOCK
      ?auto_124392 - BLOCK
      ?auto_124393 - BLOCK
      ?auto_124394 - BLOCK
      ?auto_124395 - BLOCK
      ?auto_124396 - BLOCK
      ?auto_124397 - BLOCK
    )
    :vars
    (
      ?auto_124398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124398 ?auto_124397 ) ( CLEAR ?auto_124398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124390 ) ( ON ?auto_124391 ?auto_124390 ) ( ON ?auto_124392 ?auto_124391 ) ( ON ?auto_124393 ?auto_124392 ) ( ON ?auto_124394 ?auto_124393 ) ( ON ?auto_124395 ?auto_124394 ) ( ON ?auto_124396 ?auto_124395 ) ( ON ?auto_124397 ?auto_124396 ) ( not ( = ?auto_124390 ?auto_124391 ) ) ( not ( = ?auto_124390 ?auto_124392 ) ) ( not ( = ?auto_124390 ?auto_124393 ) ) ( not ( = ?auto_124390 ?auto_124394 ) ) ( not ( = ?auto_124390 ?auto_124395 ) ) ( not ( = ?auto_124390 ?auto_124396 ) ) ( not ( = ?auto_124390 ?auto_124397 ) ) ( not ( = ?auto_124390 ?auto_124398 ) ) ( not ( = ?auto_124391 ?auto_124392 ) ) ( not ( = ?auto_124391 ?auto_124393 ) ) ( not ( = ?auto_124391 ?auto_124394 ) ) ( not ( = ?auto_124391 ?auto_124395 ) ) ( not ( = ?auto_124391 ?auto_124396 ) ) ( not ( = ?auto_124391 ?auto_124397 ) ) ( not ( = ?auto_124391 ?auto_124398 ) ) ( not ( = ?auto_124392 ?auto_124393 ) ) ( not ( = ?auto_124392 ?auto_124394 ) ) ( not ( = ?auto_124392 ?auto_124395 ) ) ( not ( = ?auto_124392 ?auto_124396 ) ) ( not ( = ?auto_124392 ?auto_124397 ) ) ( not ( = ?auto_124392 ?auto_124398 ) ) ( not ( = ?auto_124393 ?auto_124394 ) ) ( not ( = ?auto_124393 ?auto_124395 ) ) ( not ( = ?auto_124393 ?auto_124396 ) ) ( not ( = ?auto_124393 ?auto_124397 ) ) ( not ( = ?auto_124393 ?auto_124398 ) ) ( not ( = ?auto_124394 ?auto_124395 ) ) ( not ( = ?auto_124394 ?auto_124396 ) ) ( not ( = ?auto_124394 ?auto_124397 ) ) ( not ( = ?auto_124394 ?auto_124398 ) ) ( not ( = ?auto_124395 ?auto_124396 ) ) ( not ( = ?auto_124395 ?auto_124397 ) ) ( not ( = ?auto_124395 ?auto_124398 ) ) ( not ( = ?auto_124396 ?auto_124397 ) ) ( not ( = ?auto_124396 ?auto_124398 ) ) ( not ( = ?auto_124397 ?auto_124398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124398 ?auto_124397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124400 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124400 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_124400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124401 - BLOCK
    )
    :vars
    (
      ?auto_124402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124401 ?auto_124402 ) ( CLEAR ?auto_124401 ) ( HAND-EMPTY ) ( not ( = ?auto_124401 ?auto_124402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124401 ?auto_124402 )
      ( MAKE-1PILE ?auto_124401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124410 - BLOCK
      ?auto_124411 - BLOCK
      ?auto_124412 - BLOCK
      ?auto_124413 - BLOCK
      ?auto_124414 - BLOCK
      ?auto_124415 - BLOCK
      ?auto_124416 - BLOCK
    )
    :vars
    (
      ?auto_124417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124417 ?auto_124416 ) ( CLEAR ?auto_124417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124410 ) ( ON ?auto_124411 ?auto_124410 ) ( ON ?auto_124412 ?auto_124411 ) ( ON ?auto_124413 ?auto_124412 ) ( ON ?auto_124414 ?auto_124413 ) ( ON ?auto_124415 ?auto_124414 ) ( ON ?auto_124416 ?auto_124415 ) ( not ( = ?auto_124410 ?auto_124411 ) ) ( not ( = ?auto_124410 ?auto_124412 ) ) ( not ( = ?auto_124410 ?auto_124413 ) ) ( not ( = ?auto_124410 ?auto_124414 ) ) ( not ( = ?auto_124410 ?auto_124415 ) ) ( not ( = ?auto_124410 ?auto_124416 ) ) ( not ( = ?auto_124410 ?auto_124417 ) ) ( not ( = ?auto_124411 ?auto_124412 ) ) ( not ( = ?auto_124411 ?auto_124413 ) ) ( not ( = ?auto_124411 ?auto_124414 ) ) ( not ( = ?auto_124411 ?auto_124415 ) ) ( not ( = ?auto_124411 ?auto_124416 ) ) ( not ( = ?auto_124411 ?auto_124417 ) ) ( not ( = ?auto_124412 ?auto_124413 ) ) ( not ( = ?auto_124412 ?auto_124414 ) ) ( not ( = ?auto_124412 ?auto_124415 ) ) ( not ( = ?auto_124412 ?auto_124416 ) ) ( not ( = ?auto_124412 ?auto_124417 ) ) ( not ( = ?auto_124413 ?auto_124414 ) ) ( not ( = ?auto_124413 ?auto_124415 ) ) ( not ( = ?auto_124413 ?auto_124416 ) ) ( not ( = ?auto_124413 ?auto_124417 ) ) ( not ( = ?auto_124414 ?auto_124415 ) ) ( not ( = ?auto_124414 ?auto_124416 ) ) ( not ( = ?auto_124414 ?auto_124417 ) ) ( not ( = ?auto_124415 ?auto_124416 ) ) ( not ( = ?auto_124415 ?auto_124417 ) ) ( not ( = ?auto_124416 ?auto_124417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124417 ?auto_124416 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124418 - BLOCK
      ?auto_124419 - BLOCK
      ?auto_124420 - BLOCK
      ?auto_124421 - BLOCK
      ?auto_124422 - BLOCK
      ?auto_124423 - BLOCK
      ?auto_124424 - BLOCK
    )
    :vars
    (
      ?auto_124425 - BLOCK
      ?auto_124426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124425 ?auto_124424 ) ( CLEAR ?auto_124425 ) ( ON-TABLE ?auto_124418 ) ( ON ?auto_124419 ?auto_124418 ) ( ON ?auto_124420 ?auto_124419 ) ( ON ?auto_124421 ?auto_124420 ) ( ON ?auto_124422 ?auto_124421 ) ( ON ?auto_124423 ?auto_124422 ) ( ON ?auto_124424 ?auto_124423 ) ( not ( = ?auto_124418 ?auto_124419 ) ) ( not ( = ?auto_124418 ?auto_124420 ) ) ( not ( = ?auto_124418 ?auto_124421 ) ) ( not ( = ?auto_124418 ?auto_124422 ) ) ( not ( = ?auto_124418 ?auto_124423 ) ) ( not ( = ?auto_124418 ?auto_124424 ) ) ( not ( = ?auto_124418 ?auto_124425 ) ) ( not ( = ?auto_124419 ?auto_124420 ) ) ( not ( = ?auto_124419 ?auto_124421 ) ) ( not ( = ?auto_124419 ?auto_124422 ) ) ( not ( = ?auto_124419 ?auto_124423 ) ) ( not ( = ?auto_124419 ?auto_124424 ) ) ( not ( = ?auto_124419 ?auto_124425 ) ) ( not ( = ?auto_124420 ?auto_124421 ) ) ( not ( = ?auto_124420 ?auto_124422 ) ) ( not ( = ?auto_124420 ?auto_124423 ) ) ( not ( = ?auto_124420 ?auto_124424 ) ) ( not ( = ?auto_124420 ?auto_124425 ) ) ( not ( = ?auto_124421 ?auto_124422 ) ) ( not ( = ?auto_124421 ?auto_124423 ) ) ( not ( = ?auto_124421 ?auto_124424 ) ) ( not ( = ?auto_124421 ?auto_124425 ) ) ( not ( = ?auto_124422 ?auto_124423 ) ) ( not ( = ?auto_124422 ?auto_124424 ) ) ( not ( = ?auto_124422 ?auto_124425 ) ) ( not ( = ?auto_124423 ?auto_124424 ) ) ( not ( = ?auto_124423 ?auto_124425 ) ) ( not ( = ?auto_124424 ?auto_124425 ) ) ( HOLDING ?auto_124426 ) ( not ( = ?auto_124418 ?auto_124426 ) ) ( not ( = ?auto_124419 ?auto_124426 ) ) ( not ( = ?auto_124420 ?auto_124426 ) ) ( not ( = ?auto_124421 ?auto_124426 ) ) ( not ( = ?auto_124422 ?auto_124426 ) ) ( not ( = ?auto_124423 ?auto_124426 ) ) ( not ( = ?auto_124424 ?auto_124426 ) ) ( not ( = ?auto_124425 ?auto_124426 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_124426 )
      ( MAKE-7PILE ?auto_124418 ?auto_124419 ?auto_124420 ?auto_124421 ?auto_124422 ?auto_124423 ?auto_124424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124427 - BLOCK
      ?auto_124428 - BLOCK
      ?auto_124429 - BLOCK
      ?auto_124430 - BLOCK
      ?auto_124431 - BLOCK
      ?auto_124432 - BLOCK
      ?auto_124433 - BLOCK
    )
    :vars
    (
      ?auto_124435 - BLOCK
      ?auto_124434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124435 ?auto_124433 ) ( ON-TABLE ?auto_124427 ) ( ON ?auto_124428 ?auto_124427 ) ( ON ?auto_124429 ?auto_124428 ) ( ON ?auto_124430 ?auto_124429 ) ( ON ?auto_124431 ?auto_124430 ) ( ON ?auto_124432 ?auto_124431 ) ( ON ?auto_124433 ?auto_124432 ) ( not ( = ?auto_124427 ?auto_124428 ) ) ( not ( = ?auto_124427 ?auto_124429 ) ) ( not ( = ?auto_124427 ?auto_124430 ) ) ( not ( = ?auto_124427 ?auto_124431 ) ) ( not ( = ?auto_124427 ?auto_124432 ) ) ( not ( = ?auto_124427 ?auto_124433 ) ) ( not ( = ?auto_124427 ?auto_124435 ) ) ( not ( = ?auto_124428 ?auto_124429 ) ) ( not ( = ?auto_124428 ?auto_124430 ) ) ( not ( = ?auto_124428 ?auto_124431 ) ) ( not ( = ?auto_124428 ?auto_124432 ) ) ( not ( = ?auto_124428 ?auto_124433 ) ) ( not ( = ?auto_124428 ?auto_124435 ) ) ( not ( = ?auto_124429 ?auto_124430 ) ) ( not ( = ?auto_124429 ?auto_124431 ) ) ( not ( = ?auto_124429 ?auto_124432 ) ) ( not ( = ?auto_124429 ?auto_124433 ) ) ( not ( = ?auto_124429 ?auto_124435 ) ) ( not ( = ?auto_124430 ?auto_124431 ) ) ( not ( = ?auto_124430 ?auto_124432 ) ) ( not ( = ?auto_124430 ?auto_124433 ) ) ( not ( = ?auto_124430 ?auto_124435 ) ) ( not ( = ?auto_124431 ?auto_124432 ) ) ( not ( = ?auto_124431 ?auto_124433 ) ) ( not ( = ?auto_124431 ?auto_124435 ) ) ( not ( = ?auto_124432 ?auto_124433 ) ) ( not ( = ?auto_124432 ?auto_124435 ) ) ( not ( = ?auto_124433 ?auto_124435 ) ) ( not ( = ?auto_124427 ?auto_124434 ) ) ( not ( = ?auto_124428 ?auto_124434 ) ) ( not ( = ?auto_124429 ?auto_124434 ) ) ( not ( = ?auto_124430 ?auto_124434 ) ) ( not ( = ?auto_124431 ?auto_124434 ) ) ( not ( = ?auto_124432 ?auto_124434 ) ) ( not ( = ?auto_124433 ?auto_124434 ) ) ( not ( = ?auto_124435 ?auto_124434 ) ) ( ON ?auto_124434 ?auto_124435 ) ( CLEAR ?auto_124434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124427 ?auto_124428 ?auto_124429 ?auto_124430 ?auto_124431 ?auto_124432 ?auto_124433 ?auto_124435 )
      ( MAKE-7PILE ?auto_124427 ?auto_124428 ?auto_124429 ?auto_124430 ?auto_124431 ?auto_124432 ?auto_124433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124438 - BLOCK
      ?auto_124439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124439 ) ( CLEAR ?auto_124438 ) ( ON-TABLE ?auto_124438 ) ( not ( = ?auto_124438 ?auto_124439 ) ) )
    :subtasks
    ( ( !STACK ?auto_124439 ?auto_124438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124440 - BLOCK
      ?auto_124441 - BLOCK
    )
    :vars
    (
      ?auto_124442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124440 ) ( ON-TABLE ?auto_124440 ) ( not ( = ?auto_124440 ?auto_124441 ) ) ( ON ?auto_124441 ?auto_124442 ) ( CLEAR ?auto_124441 ) ( HAND-EMPTY ) ( not ( = ?auto_124440 ?auto_124442 ) ) ( not ( = ?auto_124441 ?auto_124442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124441 ?auto_124442 )
      ( MAKE-2PILE ?auto_124440 ?auto_124441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124443 - BLOCK
      ?auto_124444 - BLOCK
    )
    :vars
    (
      ?auto_124445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124443 ?auto_124444 ) ) ( ON ?auto_124444 ?auto_124445 ) ( CLEAR ?auto_124444 ) ( not ( = ?auto_124443 ?auto_124445 ) ) ( not ( = ?auto_124444 ?auto_124445 ) ) ( HOLDING ?auto_124443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124443 )
      ( MAKE-2PILE ?auto_124443 ?auto_124444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124446 - BLOCK
      ?auto_124447 - BLOCK
    )
    :vars
    (
      ?auto_124448 - BLOCK
      ?auto_124453 - BLOCK
      ?auto_124452 - BLOCK
      ?auto_124450 - BLOCK
      ?auto_124451 - BLOCK
      ?auto_124449 - BLOCK
      ?auto_124454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124446 ?auto_124447 ) ) ( ON ?auto_124447 ?auto_124448 ) ( not ( = ?auto_124446 ?auto_124448 ) ) ( not ( = ?auto_124447 ?auto_124448 ) ) ( ON ?auto_124446 ?auto_124447 ) ( CLEAR ?auto_124446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124453 ) ( ON ?auto_124452 ?auto_124453 ) ( ON ?auto_124450 ?auto_124452 ) ( ON ?auto_124451 ?auto_124450 ) ( ON ?auto_124449 ?auto_124451 ) ( ON ?auto_124454 ?auto_124449 ) ( ON ?auto_124448 ?auto_124454 ) ( not ( = ?auto_124453 ?auto_124452 ) ) ( not ( = ?auto_124453 ?auto_124450 ) ) ( not ( = ?auto_124453 ?auto_124451 ) ) ( not ( = ?auto_124453 ?auto_124449 ) ) ( not ( = ?auto_124453 ?auto_124454 ) ) ( not ( = ?auto_124453 ?auto_124448 ) ) ( not ( = ?auto_124453 ?auto_124447 ) ) ( not ( = ?auto_124453 ?auto_124446 ) ) ( not ( = ?auto_124452 ?auto_124450 ) ) ( not ( = ?auto_124452 ?auto_124451 ) ) ( not ( = ?auto_124452 ?auto_124449 ) ) ( not ( = ?auto_124452 ?auto_124454 ) ) ( not ( = ?auto_124452 ?auto_124448 ) ) ( not ( = ?auto_124452 ?auto_124447 ) ) ( not ( = ?auto_124452 ?auto_124446 ) ) ( not ( = ?auto_124450 ?auto_124451 ) ) ( not ( = ?auto_124450 ?auto_124449 ) ) ( not ( = ?auto_124450 ?auto_124454 ) ) ( not ( = ?auto_124450 ?auto_124448 ) ) ( not ( = ?auto_124450 ?auto_124447 ) ) ( not ( = ?auto_124450 ?auto_124446 ) ) ( not ( = ?auto_124451 ?auto_124449 ) ) ( not ( = ?auto_124451 ?auto_124454 ) ) ( not ( = ?auto_124451 ?auto_124448 ) ) ( not ( = ?auto_124451 ?auto_124447 ) ) ( not ( = ?auto_124451 ?auto_124446 ) ) ( not ( = ?auto_124449 ?auto_124454 ) ) ( not ( = ?auto_124449 ?auto_124448 ) ) ( not ( = ?auto_124449 ?auto_124447 ) ) ( not ( = ?auto_124449 ?auto_124446 ) ) ( not ( = ?auto_124454 ?auto_124448 ) ) ( not ( = ?auto_124454 ?auto_124447 ) ) ( not ( = ?auto_124454 ?auto_124446 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124453 ?auto_124452 ?auto_124450 ?auto_124451 ?auto_124449 ?auto_124454 ?auto_124448 ?auto_124447 )
      ( MAKE-2PILE ?auto_124446 ?auto_124447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124461 - BLOCK
      ?auto_124462 - BLOCK
      ?auto_124463 - BLOCK
      ?auto_124464 - BLOCK
      ?auto_124465 - BLOCK
      ?auto_124466 - BLOCK
    )
    :vars
    (
      ?auto_124467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124467 ?auto_124466 ) ( CLEAR ?auto_124467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124461 ) ( ON ?auto_124462 ?auto_124461 ) ( ON ?auto_124463 ?auto_124462 ) ( ON ?auto_124464 ?auto_124463 ) ( ON ?auto_124465 ?auto_124464 ) ( ON ?auto_124466 ?auto_124465 ) ( not ( = ?auto_124461 ?auto_124462 ) ) ( not ( = ?auto_124461 ?auto_124463 ) ) ( not ( = ?auto_124461 ?auto_124464 ) ) ( not ( = ?auto_124461 ?auto_124465 ) ) ( not ( = ?auto_124461 ?auto_124466 ) ) ( not ( = ?auto_124461 ?auto_124467 ) ) ( not ( = ?auto_124462 ?auto_124463 ) ) ( not ( = ?auto_124462 ?auto_124464 ) ) ( not ( = ?auto_124462 ?auto_124465 ) ) ( not ( = ?auto_124462 ?auto_124466 ) ) ( not ( = ?auto_124462 ?auto_124467 ) ) ( not ( = ?auto_124463 ?auto_124464 ) ) ( not ( = ?auto_124463 ?auto_124465 ) ) ( not ( = ?auto_124463 ?auto_124466 ) ) ( not ( = ?auto_124463 ?auto_124467 ) ) ( not ( = ?auto_124464 ?auto_124465 ) ) ( not ( = ?auto_124464 ?auto_124466 ) ) ( not ( = ?auto_124464 ?auto_124467 ) ) ( not ( = ?auto_124465 ?auto_124466 ) ) ( not ( = ?auto_124465 ?auto_124467 ) ) ( not ( = ?auto_124466 ?auto_124467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124467 ?auto_124466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124468 - BLOCK
      ?auto_124469 - BLOCK
      ?auto_124470 - BLOCK
      ?auto_124471 - BLOCK
      ?auto_124472 - BLOCK
      ?auto_124473 - BLOCK
    )
    :vars
    (
      ?auto_124474 - BLOCK
      ?auto_124475 - BLOCK
      ?auto_124476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124474 ?auto_124473 ) ( CLEAR ?auto_124474 ) ( ON-TABLE ?auto_124468 ) ( ON ?auto_124469 ?auto_124468 ) ( ON ?auto_124470 ?auto_124469 ) ( ON ?auto_124471 ?auto_124470 ) ( ON ?auto_124472 ?auto_124471 ) ( ON ?auto_124473 ?auto_124472 ) ( not ( = ?auto_124468 ?auto_124469 ) ) ( not ( = ?auto_124468 ?auto_124470 ) ) ( not ( = ?auto_124468 ?auto_124471 ) ) ( not ( = ?auto_124468 ?auto_124472 ) ) ( not ( = ?auto_124468 ?auto_124473 ) ) ( not ( = ?auto_124468 ?auto_124474 ) ) ( not ( = ?auto_124469 ?auto_124470 ) ) ( not ( = ?auto_124469 ?auto_124471 ) ) ( not ( = ?auto_124469 ?auto_124472 ) ) ( not ( = ?auto_124469 ?auto_124473 ) ) ( not ( = ?auto_124469 ?auto_124474 ) ) ( not ( = ?auto_124470 ?auto_124471 ) ) ( not ( = ?auto_124470 ?auto_124472 ) ) ( not ( = ?auto_124470 ?auto_124473 ) ) ( not ( = ?auto_124470 ?auto_124474 ) ) ( not ( = ?auto_124471 ?auto_124472 ) ) ( not ( = ?auto_124471 ?auto_124473 ) ) ( not ( = ?auto_124471 ?auto_124474 ) ) ( not ( = ?auto_124472 ?auto_124473 ) ) ( not ( = ?auto_124472 ?auto_124474 ) ) ( not ( = ?auto_124473 ?auto_124474 ) ) ( HOLDING ?auto_124475 ) ( CLEAR ?auto_124476 ) ( not ( = ?auto_124468 ?auto_124475 ) ) ( not ( = ?auto_124468 ?auto_124476 ) ) ( not ( = ?auto_124469 ?auto_124475 ) ) ( not ( = ?auto_124469 ?auto_124476 ) ) ( not ( = ?auto_124470 ?auto_124475 ) ) ( not ( = ?auto_124470 ?auto_124476 ) ) ( not ( = ?auto_124471 ?auto_124475 ) ) ( not ( = ?auto_124471 ?auto_124476 ) ) ( not ( = ?auto_124472 ?auto_124475 ) ) ( not ( = ?auto_124472 ?auto_124476 ) ) ( not ( = ?auto_124473 ?auto_124475 ) ) ( not ( = ?auto_124473 ?auto_124476 ) ) ( not ( = ?auto_124474 ?auto_124475 ) ) ( not ( = ?auto_124474 ?auto_124476 ) ) ( not ( = ?auto_124475 ?auto_124476 ) ) )
    :subtasks
    ( ( !STACK ?auto_124475 ?auto_124476 )
      ( MAKE-6PILE ?auto_124468 ?auto_124469 ?auto_124470 ?auto_124471 ?auto_124472 ?auto_124473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125808 - BLOCK
      ?auto_125809 - BLOCK
      ?auto_125810 - BLOCK
      ?auto_125811 - BLOCK
      ?auto_125812 - BLOCK
      ?auto_125813 - BLOCK
    )
    :vars
    (
      ?auto_125815 - BLOCK
      ?auto_125814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125815 ?auto_125813 ) ( ON-TABLE ?auto_125808 ) ( ON ?auto_125809 ?auto_125808 ) ( ON ?auto_125810 ?auto_125809 ) ( ON ?auto_125811 ?auto_125810 ) ( ON ?auto_125812 ?auto_125811 ) ( ON ?auto_125813 ?auto_125812 ) ( not ( = ?auto_125808 ?auto_125809 ) ) ( not ( = ?auto_125808 ?auto_125810 ) ) ( not ( = ?auto_125808 ?auto_125811 ) ) ( not ( = ?auto_125808 ?auto_125812 ) ) ( not ( = ?auto_125808 ?auto_125813 ) ) ( not ( = ?auto_125808 ?auto_125815 ) ) ( not ( = ?auto_125809 ?auto_125810 ) ) ( not ( = ?auto_125809 ?auto_125811 ) ) ( not ( = ?auto_125809 ?auto_125812 ) ) ( not ( = ?auto_125809 ?auto_125813 ) ) ( not ( = ?auto_125809 ?auto_125815 ) ) ( not ( = ?auto_125810 ?auto_125811 ) ) ( not ( = ?auto_125810 ?auto_125812 ) ) ( not ( = ?auto_125810 ?auto_125813 ) ) ( not ( = ?auto_125810 ?auto_125815 ) ) ( not ( = ?auto_125811 ?auto_125812 ) ) ( not ( = ?auto_125811 ?auto_125813 ) ) ( not ( = ?auto_125811 ?auto_125815 ) ) ( not ( = ?auto_125812 ?auto_125813 ) ) ( not ( = ?auto_125812 ?auto_125815 ) ) ( not ( = ?auto_125813 ?auto_125815 ) ) ( not ( = ?auto_125808 ?auto_125814 ) ) ( not ( = ?auto_125809 ?auto_125814 ) ) ( not ( = ?auto_125810 ?auto_125814 ) ) ( not ( = ?auto_125811 ?auto_125814 ) ) ( not ( = ?auto_125812 ?auto_125814 ) ) ( not ( = ?auto_125813 ?auto_125814 ) ) ( not ( = ?auto_125815 ?auto_125814 ) ) ( ON ?auto_125814 ?auto_125815 ) ( CLEAR ?auto_125814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125808 ?auto_125809 ?auto_125810 ?auto_125811 ?auto_125812 ?auto_125813 ?auto_125815 )
      ( MAKE-6PILE ?auto_125808 ?auto_125809 ?auto_125810 ?auto_125811 ?auto_125812 ?auto_125813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124486 - BLOCK
      ?auto_124487 - BLOCK
      ?auto_124488 - BLOCK
      ?auto_124489 - BLOCK
      ?auto_124490 - BLOCK
      ?auto_124491 - BLOCK
    )
    :vars
    (
      ?auto_124493 - BLOCK
      ?auto_124494 - BLOCK
      ?auto_124492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124493 ?auto_124491 ) ( ON-TABLE ?auto_124486 ) ( ON ?auto_124487 ?auto_124486 ) ( ON ?auto_124488 ?auto_124487 ) ( ON ?auto_124489 ?auto_124488 ) ( ON ?auto_124490 ?auto_124489 ) ( ON ?auto_124491 ?auto_124490 ) ( not ( = ?auto_124486 ?auto_124487 ) ) ( not ( = ?auto_124486 ?auto_124488 ) ) ( not ( = ?auto_124486 ?auto_124489 ) ) ( not ( = ?auto_124486 ?auto_124490 ) ) ( not ( = ?auto_124486 ?auto_124491 ) ) ( not ( = ?auto_124486 ?auto_124493 ) ) ( not ( = ?auto_124487 ?auto_124488 ) ) ( not ( = ?auto_124487 ?auto_124489 ) ) ( not ( = ?auto_124487 ?auto_124490 ) ) ( not ( = ?auto_124487 ?auto_124491 ) ) ( not ( = ?auto_124487 ?auto_124493 ) ) ( not ( = ?auto_124488 ?auto_124489 ) ) ( not ( = ?auto_124488 ?auto_124490 ) ) ( not ( = ?auto_124488 ?auto_124491 ) ) ( not ( = ?auto_124488 ?auto_124493 ) ) ( not ( = ?auto_124489 ?auto_124490 ) ) ( not ( = ?auto_124489 ?auto_124491 ) ) ( not ( = ?auto_124489 ?auto_124493 ) ) ( not ( = ?auto_124490 ?auto_124491 ) ) ( not ( = ?auto_124490 ?auto_124493 ) ) ( not ( = ?auto_124491 ?auto_124493 ) ) ( not ( = ?auto_124486 ?auto_124494 ) ) ( not ( = ?auto_124486 ?auto_124492 ) ) ( not ( = ?auto_124487 ?auto_124494 ) ) ( not ( = ?auto_124487 ?auto_124492 ) ) ( not ( = ?auto_124488 ?auto_124494 ) ) ( not ( = ?auto_124488 ?auto_124492 ) ) ( not ( = ?auto_124489 ?auto_124494 ) ) ( not ( = ?auto_124489 ?auto_124492 ) ) ( not ( = ?auto_124490 ?auto_124494 ) ) ( not ( = ?auto_124490 ?auto_124492 ) ) ( not ( = ?auto_124491 ?auto_124494 ) ) ( not ( = ?auto_124491 ?auto_124492 ) ) ( not ( = ?auto_124493 ?auto_124494 ) ) ( not ( = ?auto_124493 ?auto_124492 ) ) ( not ( = ?auto_124494 ?auto_124492 ) ) ( ON ?auto_124494 ?auto_124493 ) ( CLEAR ?auto_124494 ) ( HOLDING ?auto_124492 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124492 )
      ( MAKE-6PILE ?auto_124486 ?auto_124487 ?auto_124488 ?auto_124489 ?auto_124490 ?auto_124491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124495 - BLOCK
      ?auto_124496 - BLOCK
      ?auto_124497 - BLOCK
      ?auto_124498 - BLOCK
      ?auto_124499 - BLOCK
      ?auto_124500 - BLOCK
    )
    :vars
    (
      ?auto_124503 - BLOCK
      ?auto_124501 - BLOCK
      ?auto_124502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124503 ?auto_124500 ) ( ON-TABLE ?auto_124495 ) ( ON ?auto_124496 ?auto_124495 ) ( ON ?auto_124497 ?auto_124496 ) ( ON ?auto_124498 ?auto_124497 ) ( ON ?auto_124499 ?auto_124498 ) ( ON ?auto_124500 ?auto_124499 ) ( not ( = ?auto_124495 ?auto_124496 ) ) ( not ( = ?auto_124495 ?auto_124497 ) ) ( not ( = ?auto_124495 ?auto_124498 ) ) ( not ( = ?auto_124495 ?auto_124499 ) ) ( not ( = ?auto_124495 ?auto_124500 ) ) ( not ( = ?auto_124495 ?auto_124503 ) ) ( not ( = ?auto_124496 ?auto_124497 ) ) ( not ( = ?auto_124496 ?auto_124498 ) ) ( not ( = ?auto_124496 ?auto_124499 ) ) ( not ( = ?auto_124496 ?auto_124500 ) ) ( not ( = ?auto_124496 ?auto_124503 ) ) ( not ( = ?auto_124497 ?auto_124498 ) ) ( not ( = ?auto_124497 ?auto_124499 ) ) ( not ( = ?auto_124497 ?auto_124500 ) ) ( not ( = ?auto_124497 ?auto_124503 ) ) ( not ( = ?auto_124498 ?auto_124499 ) ) ( not ( = ?auto_124498 ?auto_124500 ) ) ( not ( = ?auto_124498 ?auto_124503 ) ) ( not ( = ?auto_124499 ?auto_124500 ) ) ( not ( = ?auto_124499 ?auto_124503 ) ) ( not ( = ?auto_124500 ?auto_124503 ) ) ( not ( = ?auto_124495 ?auto_124501 ) ) ( not ( = ?auto_124495 ?auto_124502 ) ) ( not ( = ?auto_124496 ?auto_124501 ) ) ( not ( = ?auto_124496 ?auto_124502 ) ) ( not ( = ?auto_124497 ?auto_124501 ) ) ( not ( = ?auto_124497 ?auto_124502 ) ) ( not ( = ?auto_124498 ?auto_124501 ) ) ( not ( = ?auto_124498 ?auto_124502 ) ) ( not ( = ?auto_124499 ?auto_124501 ) ) ( not ( = ?auto_124499 ?auto_124502 ) ) ( not ( = ?auto_124500 ?auto_124501 ) ) ( not ( = ?auto_124500 ?auto_124502 ) ) ( not ( = ?auto_124503 ?auto_124501 ) ) ( not ( = ?auto_124503 ?auto_124502 ) ) ( not ( = ?auto_124501 ?auto_124502 ) ) ( ON ?auto_124501 ?auto_124503 ) ( ON ?auto_124502 ?auto_124501 ) ( CLEAR ?auto_124502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124495 ?auto_124496 ?auto_124497 ?auto_124498 ?auto_124499 ?auto_124500 ?auto_124503 ?auto_124501 )
      ( MAKE-6PILE ?auto_124495 ?auto_124496 ?auto_124497 ?auto_124498 ?auto_124499 ?auto_124500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124507 - BLOCK
      ?auto_124508 - BLOCK
      ?auto_124509 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124509 ) ( CLEAR ?auto_124508 ) ( ON-TABLE ?auto_124507 ) ( ON ?auto_124508 ?auto_124507 ) ( not ( = ?auto_124507 ?auto_124508 ) ) ( not ( = ?auto_124507 ?auto_124509 ) ) ( not ( = ?auto_124508 ?auto_124509 ) ) )
    :subtasks
    ( ( !STACK ?auto_124509 ?auto_124508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124510 - BLOCK
      ?auto_124511 - BLOCK
      ?auto_124512 - BLOCK
    )
    :vars
    (
      ?auto_124513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124511 ) ( ON-TABLE ?auto_124510 ) ( ON ?auto_124511 ?auto_124510 ) ( not ( = ?auto_124510 ?auto_124511 ) ) ( not ( = ?auto_124510 ?auto_124512 ) ) ( not ( = ?auto_124511 ?auto_124512 ) ) ( ON ?auto_124512 ?auto_124513 ) ( CLEAR ?auto_124512 ) ( HAND-EMPTY ) ( not ( = ?auto_124510 ?auto_124513 ) ) ( not ( = ?auto_124511 ?auto_124513 ) ) ( not ( = ?auto_124512 ?auto_124513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124512 ?auto_124513 )
      ( MAKE-3PILE ?auto_124510 ?auto_124511 ?auto_124512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124514 - BLOCK
      ?auto_124515 - BLOCK
      ?auto_124516 - BLOCK
    )
    :vars
    (
      ?auto_124517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124514 ) ( not ( = ?auto_124514 ?auto_124515 ) ) ( not ( = ?auto_124514 ?auto_124516 ) ) ( not ( = ?auto_124515 ?auto_124516 ) ) ( ON ?auto_124516 ?auto_124517 ) ( CLEAR ?auto_124516 ) ( not ( = ?auto_124514 ?auto_124517 ) ) ( not ( = ?auto_124515 ?auto_124517 ) ) ( not ( = ?auto_124516 ?auto_124517 ) ) ( HOLDING ?auto_124515 ) ( CLEAR ?auto_124514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124514 ?auto_124515 )
      ( MAKE-3PILE ?auto_124514 ?auto_124515 ?auto_124516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124518 - BLOCK
      ?auto_124519 - BLOCK
      ?auto_124520 - BLOCK
    )
    :vars
    (
      ?auto_124521 - BLOCK
      ?auto_124523 - BLOCK
      ?auto_124524 - BLOCK
      ?auto_124525 - BLOCK
      ?auto_124526 - BLOCK
      ?auto_124522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124518 ) ( not ( = ?auto_124518 ?auto_124519 ) ) ( not ( = ?auto_124518 ?auto_124520 ) ) ( not ( = ?auto_124519 ?auto_124520 ) ) ( ON ?auto_124520 ?auto_124521 ) ( not ( = ?auto_124518 ?auto_124521 ) ) ( not ( = ?auto_124519 ?auto_124521 ) ) ( not ( = ?auto_124520 ?auto_124521 ) ) ( CLEAR ?auto_124518 ) ( ON ?auto_124519 ?auto_124520 ) ( CLEAR ?auto_124519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124523 ) ( ON ?auto_124524 ?auto_124523 ) ( ON ?auto_124525 ?auto_124524 ) ( ON ?auto_124526 ?auto_124525 ) ( ON ?auto_124522 ?auto_124526 ) ( ON ?auto_124521 ?auto_124522 ) ( not ( = ?auto_124523 ?auto_124524 ) ) ( not ( = ?auto_124523 ?auto_124525 ) ) ( not ( = ?auto_124523 ?auto_124526 ) ) ( not ( = ?auto_124523 ?auto_124522 ) ) ( not ( = ?auto_124523 ?auto_124521 ) ) ( not ( = ?auto_124523 ?auto_124520 ) ) ( not ( = ?auto_124523 ?auto_124519 ) ) ( not ( = ?auto_124524 ?auto_124525 ) ) ( not ( = ?auto_124524 ?auto_124526 ) ) ( not ( = ?auto_124524 ?auto_124522 ) ) ( not ( = ?auto_124524 ?auto_124521 ) ) ( not ( = ?auto_124524 ?auto_124520 ) ) ( not ( = ?auto_124524 ?auto_124519 ) ) ( not ( = ?auto_124525 ?auto_124526 ) ) ( not ( = ?auto_124525 ?auto_124522 ) ) ( not ( = ?auto_124525 ?auto_124521 ) ) ( not ( = ?auto_124525 ?auto_124520 ) ) ( not ( = ?auto_124525 ?auto_124519 ) ) ( not ( = ?auto_124526 ?auto_124522 ) ) ( not ( = ?auto_124526 ?auto_124521 ) ) ( not ( = ?auto_124526 ?auto_124520 ) ) ( not ( = ?auto_124526 ?auto_124519 ) ) ( not ( = ?auto_124522 ?auto_124521 ) ) ( not ( = ?auto_124522 ?auto_124520 ) ) ( not ( = ?auto_124522 ?auto_124519 ) ) ( not ( = ?auto_124518 ?auto_124523 ) ) ( not ( = ?auto_124518 ?auto_124524 ) ) ( not ( = ?auto_124518 ?auto_124525 ) ) ( not ( = ?auto_124518 ?auto_124526 ) ) ( not ( = ?auto_124518 ?auto_124522 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124523 ?auto_124524 ?auto_124525 ?auto_124526 ?auto_124522 ?auto_124521 ?auto_124520 )
      ( MAKE-3PILE ?auto_124518 ?auto_124519 ?auto_124520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124527 - BLOCK
      ?auto_124528 - BLOCK
      ?auto_124529 - BLOCK
    )
    :vars
    (
      ?auto_124532 - BLOCK
      ?auto_124530 - BLOCK
      ?auto_124535 - BLOCK
      ?auto_124533 - BLOCK
      ?auto_124531 - BLOCK
      ?auto_124534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124527 ?auto_124528 ) ) ( not ( = ?auto_124527 ?auto_124529 ) ) ( not ( = ?auto_124528 ?auto_124529 ) ) ( ON ?auto_124529 ?auto_124532 ) ( not ( = ?auto_124527 ?auto_124532 ) ) ( not ( = ?auto_124528 ?auto_124532 ) ) ( not ( = ?auto_124529 ?auto_124532 ) ) ( ON ?auto_124528 ?auto_124529 ) ( CLEAR ?auto_124528 ) ( ON-TABLE ?auto_124530 ) ( ON ?auto_124535 ?auto_124530 ) ( ON ?auto_124533 ?auto_124535 ) ( ON ?auto_124531 ?auto_124533 ) ( ON ?auto_124534 ?auto_124531 ) ( ON ?auto_124532 ?auto_124534 ) ( not ( = ?auto_124530 ?auto_124535 ) ) ( not ( = ?auto_124530 ?auto_124533 ) ) ( not ( = ?auto_124530 ?auto_124531 ) ) ( not ( = ?auto_124530 ?auto_124534 ) ) ( not ( = ?auto_124530 ?auto_124532 ) ) ( not ( = ?auto_124530 ?auto_124529 ) ) ( not ( = ?auto_124530 ?auto_124528 ) ) ( not ( = ?auto_124535 ?auto_124533 ) ) ( not ( = ?auto_124535 ?auto_124531 ) ) ( not ( = ?auto_124535 ?auto_124534 ) ) ( not ( = ?auto_124535 ?auto_124532 ) ) ( not ( = ?auto_124535 ?auto_124529 ) ) ( not ( = ?auto_124535 ?auto_124528 ) ) ( not ( = ?auto_124533 ?auto_124531 ) ) ( not ( = ?auto_124533 ?auto_124534 ) ) ( not ( = ?auto_124533 ?auto_124532 ) ) ( not ( = ?auto_124533 ?auto_124529 ) ) ( not ( = ?auto_124533 ?auto_124528 ) ) ( not ( = ?auto_124531 ?auto_124534 ) ) ( not ( = ?auto_124531 ?auto_124532 ) ) ( not ( = ?auto_124531 ?auto_124529 ) ) ( not ( = ?auto_124531 ?auto_124528 ) ) ( not ( = ?auto_124534 ?auto_124532 ) ) ( not ( = ?auto_124534 ?auto_124529 ) ) ( not ( = ?auto_124534 ?auto_124528 ) ) ( not ( = ?auto_124527 ?auto_124530 ) ) ( not ( = ?auto_124527 ?auto_124535 ) ) ( not ( = ?auto_124527 ?auto_124533 ) ) ( not ( = ?auto_124527 ?auto_124531 ) ) ( not ( = ?auto_124527 ?auto_124534 ) ) ( HOLDING ?auto_124527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124527 )
      ( MAKE-3PILE ?auto_124527 ?auto_124528 ?auto_124529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124536 - BLOCK
      ?auto_124537 - BLOCK
      ?auto_124538 - BLOCK
    )
    :vars
    (
      ?auto_124543 - BLOCK
      ?auto_124540 - BLOCK
      ?auto_124542 - BLOCK
      ?auto_124539 - BLOCK
      ?auto_124541 - BLOCK
      ?auto_124544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124536 ?auto_124537 ) ) ( not ( = ?auto_124536 ?auto_124538 ) ) ( not ( = ?auto_124537 ?auto_124538 ) ) ( ON ?auto_124538 ?auto_124543 ) ( not ( = ?auto_124536 ?auto_124543 ) ) ( not ( = ?auto_124537 ?auto_124543 ) ) ( not ( = ?auto_124538 ?auto_124543 ) ) ( ON ?auto_124537 ?auto_124538 ) ( ON-TABLE ?auto_124540 ) ( ON ?auto_124542 ?auto_124540 ) ( ON ?auto_124539 ?auto_124542 ) ( ON ?auto_124541 ?auto_124539 ) ( ON ?auto_124544 ?auto_124541 ) ( ON ?auto_124543 ?auto_124544 ) ( not ( = ?auto_124540 ?auto_124542 ) ) ( not ( = ?auto_124540 ?auto_124539 ) ) ( not ( = ?auto_124540 ?auto_124541 ) ) ( not ( = ?auto_124540 ?auto_124544 ) ) ( not ( = ?auto_124540 ?auto_124543 ) ) ( not ( = ?auto_124540 ?auto_124538 ) ) ( not ( = ?auto_124540 ?auto_124537 ) ) ( not ( = ?auto_124542 ?auto_124539 ) ) ( not ( = ?auto_124542 ?auto_124541 ) ) ( not ( = ?auto_124542 ?auto_124544 ) ) ( not ( = ?auto_124542 ?auto_124543 ) ) ( not ( = ?auto_124542 ?auto_124538 ) ) ( not ( = ?auto_124542 ?auto_124537 ) ) ( not ( = ?auto_124539 ?auto_124541 ) ) ( not ( = ?auto_124539 ?auto_124544 ) ) ( not ( = ?auto_124539 ?auto_124543 ) ) ( not ( = ?auto_124539 ?auto_124538 ) ) ( not ( = ?auto_124539 ?auto_124537 ) ) ( not ( = ?auto_124541 ?auto_124544 ) ) ( not ( = ?auto_124541 ?auto_124543 ) ) ( not ( = ?auto_124541 ?auto_124538 ) ) ( not ( = ?auto_124541 ?auto_124537 ) ) ( not ( = ?auto_124544 ?auto_124543 ) ) ( not ( = ?auto_124544 ?auto_124538 ) ) ( not ( = ?auto_124544 ?auto_124537 ) ) ( not ( = ?auto_124536 ?auto_124540 ) ) ( not ( = ?auto_124536 ?auto_124542 ) ) ( not ( = ?auto_124536 ?auto_124539 ) ) ( not ( = ?auto_124536 ?auto_124541 ) ) ( not ( = ?auto_124536 ?auto_124544 ) ) ( ON ?auto_124536 ?auto_124537 ) ( CLEAR ?auto_124536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124540 ?auto_124542 ?auto_124539 ?auto_124541 ?auto_124544 ?auto_124543 ?auto_124538 ?auto_124537 )
      ( MAKE-3PILE ?auto_124536 ?auto_124537 ?auto_124538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124550 - BLOCK
      ?auto_124551 - BLOCK
      ?auto_124552 - BLOCK
      ?auto_124553 - BLOCK
      ?auto_124554 - BLOCK
    )
    :vars
    (
      ?auto_124555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124555 ?auto_124554 ) ( CLEAR ?auto_124555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124550 ) ( ON ?auto_124551 ?auto_124550 ) ( ON ?auto_124552 ?auto_124551 ) ( ON ?auto_124553 ?auto_124552 ) ( ON ?auto_124554 ?auto_124553 ) ( not ( = ?auto_124550 ?auto_124551 ) ) ( not ( = ?auto_124550 ?auto_124552 ) ) ( not ( = ?auto_124550 ?auto_124553 ) ) ( not ( = ?auto_124550 ?auto_124554 ) ) ( not ( = ?auto_124550 ?auto_124555 ) ) ( not ( = ?auto_124551 ?auto_124552 ) ) ( not ( = ?auto_124551 ?auto_124553 ) ) ( not ( = ?auto_124551 ?auto_124554 ) ) ( not ( = ?auto_124551 ?auto_124555 ) ) ( not ( = ?auto_124552 ?auto_124553 ) ) ( not ( = ?auto_124552 ?auto_124554 ) ) ( not ( = ?auto_124552 ?auto_124555 ) ) ( not ( = ?auto_124553 ?auto_124554 ) ) ( not ( = ?auto_124553 ?auto_124555 ) ) ( not ( = ?auto_124554 ?auto_124555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124555 ?auto_124554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124556 - BLOCK
      ?auto_124557 - BLOCK
      ?auto_124558 - BLOCK
      ?auto_124559 - BLOCK
      ?auto_124560 - BLOCK
    )
    :vars
    (
      ?auto_124561 - BLOCK
      ?auto_124562 - BLOCK
      ?auto_124563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124561 ?auto_124560 ) ( CLEAR ?auto_124561 ) ( ON-TABLE ?auto_124556 ) ( ON ?auto_124557 ?auto_124556 ) ( ON ?auto_124558 ?auto_124557 ) ( ON ?auto_124559 ?auto_124558 ) ( ON ?auto_124560 ?auto_124559 ) ( not ( = ?auto_124556 ?auto_124557 ) ) ( not ( = ?auto_124556 ?auto_124558 ) ) ( not ( = ?auto_124556 ?auto_124559 ) ) ( not ( = ?auto_124556 ?auto_124560 ) ) ( not ( = ?auto_124556 ?auto_124561 ) ) ( not ( = ?auto_124557 ?auto_124558 ) ) ( not ( = ?auto_124557 ?auto_124559 ) ) ( not ( = ?auto_124557 ?auto_124560 ) ) ( not ( = ?auto_124557 ?auto_124561 ) ) ( not ( = ?auto_124558 ?auto_124559 ) ) ( not ( = ?auto_124558 ?auto_124560 ) ) ( not ( = ?auto_124558 ?auto_124561 ) ) ( not ( = ?auto_124559 ?auto_124560 ) ) ( not ( = ?auto_124559 ?auto_124561 ) ) ( not ( = ?auto_124560 ?auto_124561 ) ) ( HOLDING ?auto_124562 ) ( CLEAR ?auto_124563 ) ( not ( = ?auto_124556 ?auto_124562 ) ) ( not ( = ?auto_124556 ?auto_124563 ) ) ( not ( = ?auto_124557 ?auto_124562 ) ) ( not ( = ?auto_124557 ?auto_124563 ) ) ( not ( = ?auto_124558 ?auto_124562 ) ) ( not ( = ?auto_124558 ?auto_124563 ) ) ( not ( = ?auto_124559 ?auto_124562 ) ) ( not ( = ?auto_124559 ?auto_124563 ) ) ( not ( = ?auto_124560 ?auto_124562 ) ) ( not ( = ?auto_124560 ?auto_124563 ) ) ( not ( = ?auto_124561 ?auto_124562 ) ) ( not ( = ?auto_124561 ?auto_124563 ) ) ( not ( = ?auto_124562 ?auto_124563 ) ) )
    :subtasks
    ( ( !STACK ?auto_124562 ?auto_124563 )
      ( MAKE-5PILE ?auto_124556 ?auto_124557 ?auto_124558 ?auto_124559 ?auto_124560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124564 - BLOCK
      ?auto_124565 - BLOCK
      ?auto_124566 - BLOCK
      ?auto_124567 - BLOCK
      ?auto_124568 - BLOCK
    )
    :vars
    (
      ?auto_124571 - BLOCK
      ?auto_124570 - BLOCK
      ?auto_124569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124571 ?auto_124568 ) ( ON-TABLE ?auto_124564 ) ( ON ?auto_124565 ?auto_124564 ) ( ON ?auto_124566 ?auto_124565 ) ( ON ?auto_124567 ?auto_124566 ) ( ON ?auto_124568 ?auto_124567 ) ( not ( = ?auto_124564 ?auto_124565 ) ) ( not ( = ?auto_124564 ?auto_124566 ) ) ( not ( = ?auto_124564 ?auto_124567 ) ) ( not ( = ?auto_124564 ?auto_124568 ) ) ( not ( = ?auto_124564 ?auto_124571 ) ) ( not ( = ?auto_124565 ?auto_124566 ) ) ( not ( = ?auto_124565 ?auto_124567 ) ) ( not ( = ?auto_124565 ?auto_124568 ) ) ( not ( = ?auto_124565 ?auto_124571 ) ) ( not ( = ?auto_124566 ?auto_124567 ) ) ( not ( = ?auto_124566 ?auto_124568 ) ) ( not ( = ?auto_124566 ?auto_124571 ) ) ( not ( = ?auto_124567 ?auto_124568 ) ) ( not ( = ?auto_124567 ?auto_124571 ) ) ( not ( = ?auto_124568 ?auto_124571 ) ) ( CLEAR ?auto_124570 ) ( not ( = ?auto_124564 ?auto_124569 ) ) ( not ( = ?auto_124564 ?auto_124570 ) ) ( not ( = ?auto_124565 ?auto_124569 ) ) ( not ( = ?auto_124565 ?auto_124570 ) ) ( not ( = ?auto_124566 ?auto_124569 ) ) ( not ( = ?auto_124566 ?auto_124570 ) ) ( not ( = ?auto_124567 ?auto_124569 ) ) ( not ( = ?auto_124567 ?auto_124570 ) ) ( not ( = ?auto_124568 ?auto_124569 ) ) ( not ( = ?auto_124568 ?auto_124570 ) ) ( not ( = ?auto_124571 ?auto_124569 ) ) ( not ( = ?auto_124571 ?auto_124570 ) ) ( not ( = ?auto_124569 ?auto_124570 ) ) ( ON ?auto_124569 ?auto_124571 ) ( CLEAR ?auto_124569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124564 ?auto_124565 ?auto_124566 ?auto_124567 ?auto_124568 ?auto_124571 )
      ( MAKE-5PILE ?auto_124564 ?auto_124565 ?auto_124566 ?auto_124567 ?auto_124568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124572 - BLOCK
      ?auto_124573 - BLOCK
      ?auto_124574 - BLOCK
      ?auto_124575 - BLOCK
      ?auto_124576 - BLOCK
    )
    :vars
    (
      ?auto_124577 - BLOCK
      ?auto_124578 - BLOCK
      ?auto_124579 - BLOCK
      ?auto_124580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124577 ?auto_124576 ) ( ON-TABLE ?auto_124572 ) ( ON ?auto_124573 ?auto_124572 ) ( ON ?auto_124574 ?auto_124573 ) ( ON ?auto_124575 ?auto_124574 ) ( ON ?auto_124576 ?auto_124575 ) ( not ( = ?auto_124572 ?auto_124573 ) ) ( not ( = ?auto_124572 ?auto_124574 ) ) ( not ( = ?auto_124572 ?auto_124575 ) ) ( not ( = ?auto_124572 ?auto_124576 ) ) ( not ( = ?auto_124572 ?auto_124577 ) ) ( not ( = ?auto_124573 ?auto_124574 ) ) ( not ( = ?auto_124573 ?auto_124575 ) ) ( not ( = ?auto_124573 ?auto_124576 ) ) ( not ( = ?auto_124573 ?auto_124577 ) ) ( not ( = ?auto_124574 ?auto_124575 ) ) ( not ( = ?auto_124574 ?auto_124576 ) ) ( not ( = ?auto_124574 ?auto_124577 ) ) ( not ( = ?auto_124575 ?auto_124576 ) ) ( not ( = ?auto_124575 ?auto_124577 ) ) ( not ( = ?auto_124576 ?auto_124577 ) ) ( not ( = ?auto_124572 ?auto_124578 ) ) ( not ( = ?auto_124572 ?auto_124579 ) ) ( not ( = ?auto_124573 ?auto_124578 ) ) ( not ( = ?auto_124573 ?auto_124579 ) ) ( not ( = ?auto_124574 ?auto_124578 ) ) ( not ( = ?auto_124574 ?auto_124579 ) ) ( not ( = ?auto_124575 ?auto_124578 ) ) ( not ( = ?auto_124575 ?auto_124579 ) ) ( not ( = ?auto_124576 ?auto_124578 ) ) ( not ( = ?auto_124576 ?auto_124579 ) ) ( not ( = ?auto_124577 ?auto_124578 ) ) ( not ( = ?auto_124577 ?auto_124579 ) ) ( not ( = ?auto_124578 ?auto_124579 ) ) ( ON ?auto_124578 ?auto_124577 ) ( CLEAR ?auto_124578 ) ( HOLDING ?auto_124579 ) ( CLEAR ?auto_124580 ) ( ON-TABLE ?auto_124580 ) ( not ( = ?auto_124580 ?auto_124579 ) ) ( not ( = ?auto_124572 ?auto_124580 ) ) ( not ( = ?auto_124573 ?auto_124580 ) ) ( not ( = ?auto_124574 ?auto_124580 ) ) ( not ( = ?auto_124575 ?auto_124580 ) ) ( not ( = ?auto_124576 ?auto_124580 ) ) ( not ( = ?auto_124577 ?auto_124580 ) ) ( not ( = ?auto_124578 ?auto_124580 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124580 ?auto_124579 )
      ( MAKE-5PILE ?auto_124572 ?auto_124573 ?auto_124574 ?auto_124575 ?auto_124576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126100 - BLOCK
      ?auto_126101 - BLOCK
      ?auto_126102 - BLOCK
      ?auto_126103 - BLOCK
      ?auto_126104 - BLOCK
    )
    :vars
    (
      ?auto_126105 - BLOCK
      ?auto_126107 - BLOCK
      ?auto_126106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126105 ?auto_126104 ) ( ON-TABLE ?auto_126100 ) ( ON ?auto_126101 ?auto_126100 ) ( ON ?auto_126102 ?auto_126101 ) ( ON ?auto_126103 ?auto_126102 ) ( ON ?auto_126104 ?auto_126103 ) ( not ( = ?auto_126100 ?auto_126101 ) ) ( not ( = ?auto_126100 ?auto_126102 ) ) ( not ( = ?auto_126100 ?auto_126103 ) ) ( not ( = ?auto_126100 ?auto_126104 ) ) ( not ( = ?auto_126100 ?auto_126105 ) ) ( not ( = ?auto_126101 ?auto_126102 ) ) ( not ( = ?auto_126101 ?auto_126103 ) ) ( not ( = ?auto_126101 ?auto_126104 ) ) ( not ( = ?auto_126101 ?auto_126105 ) ) ( not ( = ?auto_126102 ?auto_126103 ) ) ( not ( = ?auto_126102 ?auto_126104 ) ) ( not ( = ?auto_126102 ?auto_126105 ) ) ( not ( = ?auto_126103 ?auto_126104 ) ) ( not ( = ?auto_126103 ?auto_126105 ) ) ( not ( = ?auto_126104 ?auto_126105 ) ) ( not ( = ?auto_126100 ?auto_126107 ) ) ( not ( = ?auto_126100 ?auto_126106 ) ) ( not ( = ?auto_126101 ?auto_126107 ) ) ( not ( = ?auto_126101 ?auto_126106 ) ) ( not ( = ?auto_126102 ?auto_126107 ) ) ( not ( = ?auto_126102 ?auto_126106 ) ) ( not ( = ?auto_126103 ?auto_126107 ) ) ( not ( = ?auto_126103 ?auto_126106 ) ) ( not ( = ?auto_126104 ?auto_126107 ) ) ( not ( = ?auto_126104 ?auto_126106 ) ) ( not ( = ?auto_126105 ?auto_126107 ) ) ( not ( = ?auto_126105 ?auto_126106 ) ) ( not ( = ?auto_126107 ?auto_126106 ) ) ( ON ?auto_126107 ?auto_126105 ) ( ON ?auto_126106 ?auto_126107 ) ( CLEAR ?auto_126106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126100 ?auto_126101 ?auto_126102 ?auto_126103 ?auto_126104 ?auto_126105 ?auto_126107 )
      ( MAKE-5PILE ?auto_126100 ?auto_126101 ?auto_126102 ?auto_126103 ?auto_126104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124590 - BLOCK
      ?auto_124591 - BLOCK
      ?auto_124592 - BLOCK
      ?auto_124593 - BLOCK
      ?auto_124594 - BLOCK
    )
    :vars
    (
      ?auto_124598 - BLOCK
      ?auto_124596 - BLOCK
      ?auto_124597 - BLOCK
      ?auto_124595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124598 ?auto_124594 ) ( ON-TABLE ?auto_124590 ) ( ON ?auto_124591 ?auto_124590 ) ( ON ?auto_124592 ?auto_124591 ) ( ON ?auto_124593 ?auto_124592 ) ( ON ?auto_124594 ?auto_124593 ) ( not ( = ?auto_124590 ?auto_124591 ) ) ( not ( = ?auto_124590 ?auto_124592 ) ) ( not ( = ?auto_124590 ?auto_124593 ) ) ( not ( = ?auto_124590 ?auto_124594 ) ) ( not ( = ?auto_124590 ?auto_124598 ) ) ( not ( = ?auto_124591 ?auto_124592 ) ) ( not ( = ?auto_124591 ?auto_124593 ) ) ( not ( = ?auto_124591 ?auto_124594 ) ) ( not ( = ?auto_124591 ?auto_124598 ) ) ( not ( = ?auto_124592 ?auto_124593 ) ) ( not ( = ?auto_124592 ?auto_124594 ) ) ( not ( = ?auto_124592 ?auto_124598 ) ) ( not ( = ?auto_124593 ?auto_124594 ) ) ( not ( = ?auto_124593 ?auto_124598 ) ) ( not ( = ?auto_124594 ?auto_124598 ) ) ( not ( = ?auto_124590 ?auto_124596 ) ) ( not ( = ?auto_124590 ?auto_124597 ) ) ( not ( = ?auto_124591 ?auto_124596 ) ) ( not ( = ?auto_124591 ?auto_124597 ) ) ( not ( = ?auto_124592 ?auto_124596 ) ) ( not ( = ?auto_124592 ?auto_124597 ) ) ( not ( = ?auto_124593 ?auto_124596 ) ) ( not ( = ?auto_124593 ?auto_124597 ) ) ( not ( = ?auto_124594 ?auto_124596 ) ) ( not ( = ?auto_124594 ?auto_124597 ) ) ( not ( = ?auto_124598 ?auto_124596 ) ) ( not ( = ?auto_124598 ?auto_124597 ) ) ( not ( = ?auto_124596 ?auto_124597 ) ) ( ON ?auto_124596 ?auto_124598 ) ( not ( = ?auto_124595 ?auto_124597 ) ) ( not ( = ?auto_124590 ?auto_124595 ) ) ( not ( = ?auto_124591 ?auto_124595 ) ) ( not ( = ?auto_124592 ?auto_124595 ) ) ( not ( = ?auto_124593 ?auto_124595 ) ) ( not ( = ?auto_124594 ?auto_124595 ) ) ( not ( = ?auto_124598 ?auto_124595 ) ) ( not ( = ?auto_124596 ?auto_124595 ) ) ( ON ?auto_124597 ?auto_124596 ) ( CLEAR ?auto_124597 ) ( HOLDING ?auto_124595 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124595 )
      ( MAKE-5PILE ?auto_124590 ?auto_124591 ?auto_124592 ?auto_124593 ?auto_124594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124599 - BLOCK
      ?auto_124600 - BLOCK
      ?auto_124601 - BLOCK
      ?auto_124602 - BLOCK
      ?auto_124603 - BLOCK
    )
    :vars
    (
      ?auto_124606 - BLOCK
      ?auto_124607 - BLOCK
      ?auto_124605 - BLOCK
      ?auto_124604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124606 ?auto_124603 ) ( ON-TABLE ?auto_124599 ) ( ON ?auto_124600 ?auto_124599 ) ( ON ?auto_124601 ?auto_124600 ) ( ON ?auto_124602 ?auto_124601 ) ( ON ?auto_124603 ?auto_124602 ) ( not ( = ?auto_124599 ?auto_124600 ) ) ( not ( = ?auto_124599 ?auto_124601 ) ) ( not ( = ?auto_124599 ?auto_124602 ) ) ( not ( = ?auto_124599 ?auto_124603 ) ) ( not ( = ?auto_124599 ?auto_124606 ) ) ( not ( = ?auto_124600 ?auto_124601 ) ) ( not ( = ?auto_124600 ?auto_124602 ) ) ( not ( = ?auto_124600 ?auto_124603 ) ) ( not ( = ?auto_124600 ?auto_124606 ) ) ( not ( = ?auto_124601 ?auto_124602 ) ) ( not ( = ?auto_124601 ?auto_124603 ) ) ( not ( = ?auto_124601 ?auto_124606 ) ) ( not ( = ?auto_124602 ?auto_124603 ) ) ( not ( = ?auto_124602 ?auto_124606 ) ) ( not ( = ?auto_124603 ?auto_124606 ) ) ( not ( = ?auto_124599 ?auto_124607 ) ) ( not ( = ?auto_124599 ?auto_124605 ) ) ( not ( = ?auto_124600 ?auto_124607 ) ) ( not ( = ?auto_124600 ?auto_124605 ) ) ( not ( = ?auto_124601 ?auto_124607 ) ) ( not ( = ?auto_124601 ?auto_124605 ) ) ( not ( = ?auto_124602 ?auto_124607 ) ) ( not ( = ?auto_124602 ?auto_124605 ) ) ( not ( = ?auto_124603 ?auto_124607 ) ) ( not ( = ?auto_124603 ?auto_124605 ) ) ( not ( = ?auto_124606 ?auto_124607 ) ) ( not ( = ?auto_124606 ?auto_124605 ) ) ( not ( = ?auto_124607 ?auto_124605 ) ) ( ON ?auto_124607 ?auto_124606 ) ( not ( = ?auto_124604 ?auto_124605 ) ) ( not ( = ?auto_124599 ?auto_124604 ) ) ( not ( = ?auto_124600 ?auto_124604 ) ) ( not ( = ?auto_124601 ?auto_124604 ) ) ( not ( = ?auto_124602 ?auto_124604 ) ) ( not ( = ?auto_124603 ?auto_124604 ) ) ( not ( = ?auto_124606 ?auto_124604 ) ) ( not ( = ?auto_124607 ?auto_124604 ) ) ( ON ?auto_124605 ?auto_124607 ) ( ON ?auto_124604 ?auto_124605 ) ( CLEAR ?auto_124604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124599 ?auto_124600 ?auto_124601 ?auto_124602 ?auto_124603 ?auto_124606 ?auto_124607 ?auto_124605 )
      ( MAKE-5PILE ?auto_124599 ?auto_124600 ?auto_124601 ?auto_124602 ?auto_124603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124612 - BLOCK
      ?auto_124613 - BLOCK
      ?auto_124614 - BLOCK
      ?auto_124615 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124615 ) ( CLEAR ?auto_124614 ) ( ON-TABLE ?auto_124612 ) ( ON ?auto_124613 ?auto_124612 ) ( ON ?auto_124614 ?auto_124613 ) ( not ( = ?auto_124612 ?auto_124613 ) ) ( not ( = ?auto_124612 ?auto_124614 ) ) ( not ( = ?auto_124612 ?auto_124615 ) ) ( not ( = ?auto_124613 ?auto_124614 ) ) ( not ( = ?auto_124613 ?auto_124615 ) ) ( not ( = ?auto_124614 ?auto_124615 ) ) )
    :subtasks
    ( ( !STACK ?auto_124615 ?auto_124614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124616 - BLOCK
      ?auto_124617 - BLOCK
      ?auto_124618 - BLOCK
      ?auto_124619 - BLOCK
    )
    :vars
    (
      ?auto_124620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124618 ) ( ON-TABLE ?auto_124616 ) ( ON ?auto_124617 ?auto_124616 ) ( ON ?auto_124618 ?auto_124617 ) ( not ( = ?auto_124616 ?auto_124617 ) ) ( not ( = ?auto_124616 ?auto_124618 ) ) ( not ( = ?auto_124616 ?auto_124619 ) ) ( not ( = ?auto_124617 ?auto_124618 ) ) ( not ( = ?auto_124617 ?auto_124619 ) ) ( not ( = ?auto_124618 ?auto_124619 ) ) ( ON ?auto_124619 ?auto_124620 ) ( CLEAR ?auto_124619 ) ( HAND-EMPTY ) ( not ( = ?auto_124616 ?auto_124620 ) ) ( not ( = ?auto_124617 ?auto_124620 ) ) ( not ( = ?auto_124618 ?auto_124620 ) ) ( not ( = ?auto_124619 ?auto_124620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124619 ?auto_124620 )
      ( MAKE-4PILE ?auto_124616 ?auto_124617 ?auto_124618 ?auto_124619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124621 - BLOCK
      ?auto_124622 - BLOCK
      ?auto_124623 - BLOCK
      ?auto_124624 - BLOCK
    )
    :vars
    (
      ?auto_124625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124621 ) ( ON ?auto_124622 ?auto_124621 ) ( not ( = ?auto_124621 ?auto_124622 ) ) ( not ( = ?auto_124621 ?auto_124623 ) ) ( not ( = ?auto_124621 ?auto_124624 ) ) ( not ( = ?auto_124622 ?auto_124623 ) ) ( not ( = ?auto_124622 ?auto_124624 ) ) ( not ( = ?auto_124623 ?auto_124624 ) ) ( ON ?auto_124624 ?auto_124625 ) ( CLEAR ?auto_124624 ) ( not ( = ?auto_124621 ?auto_124625 ) ) ( not ( = ?auto_124622 ?auto_124625 ) ) ( not ( = ?auto_124623 ?auto_124625 ) ) ( not ( = ?auto_124624 ?auto_124625 ) ) ( HOLDING ?auto_124623 ) ( CLEAR ?auto_124622 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124621 ?auto_124622 ?auto_124623 )
      ( MAKE-4PILE ?auto_124621 ?auto_124622 ?auto_124623 ?auto_124624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124626 - BLOCK
      ?auto_124627 - BLOCK
      ?auto_124628 - BLOCK
      ?auto_124629 - BLOCK
    )
    :vars
    (
      ?auto_124630 - BLOCK
      ?auto_124633 - BLOCK
      ?auto_124632 - BLOCK
      ?auto_124634 - BLOCK
      ?auto_124631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124626 ) ( ON ?auto_124627 ?auto_124626 ) ( not ( = ?auto_124626 ?auto_124627 ) ) ( not ( = ?auto_124626 ?auto_124628 ) ) ( not ( = ?auto_124626 ?auto_124629 ) ) ( not ( = ?auto_124627 ?auto_124628 ) ) ( not ( = ?auto_124627 ?auto_124629 ) ) ( not ( = ?auto_124628 ?auto_124629 ) ) ( ON ?auto_124629 ?auto_124630 ) ( not ( = ?auto_124626 ?auto_124630 ) ) ( not ( = ?auto_124627 ?auto_124630 ) ) ( not ( = ?auto_124628 ?auto_124630 ) ) ( not ( = ?auto_124629 ?auto_124630 ) ) ( CLEAR ?auto_124627 ) ( ON ?auto_124628 ?auto_124629 ) ( CLEAR ?auto_124628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124633 ) ( ON ?auto_124632 ?auto_124633 ) ( ON ?auto_124634 ?auto_124632 ) ( ON ?auto_124631 ?auto_124634 ) ( ON ?auto_124630 ?auto_124631 ) ( not ( = ?auto_124633 ?auto_124632 ) ) ( not ( = ?auto_124633 ?auto_124634 ) ) ( not ( = ?auto_124633 ?auto_124631 ) ) ( not ( = ?auto_124633 ?auto_124630 ) ) ( not ( = ?auto_124633 ?auto_124629 ) ) ( not ( = ?auto_124633 ?auto_124628 ) ) ( not ( = ?auto_124632 ?auto_124634 ) ) ( not ( = ?auto_124632 ?auto_124631 ) ) ( not ( = ?auto_124632 ?auto_124630 ) ) ( not ( = ?auto_124632 ?auto_124629 ) ) ( not ( = ?auto_124632 ?auto_124628 ) ) ( not ( = ?auto_124634 ?auto_124631 ) ) ( not ( = ?auto_124634 ?auto_124630 ) ) ( not ( = ?auto_124634 ?auto_124629 ) ) ( not ( = ?auto_124634 ?auto_124628 ) ) ( not ( = ?auto_124631 ?auto_124630 ) ) ( not ( = ?auto_124631 ?auto_124629 ) ) ( not ( = ?auto_124631 ?auto_124628 ) ) ( not ( = ?auto_124626 ?auto_124633 ) ) ( not ( = ?auto_124626 ?auto_124632 ) ) ( not ( = ?auto_124626 ?auto_124634 ) ) ( not ( = ?auto_124626 ?auto_124631 ) ) ( not ( = ?auto_124627 ?auto_124633 ) ) ( not ( = ?auto_124627 ?auto_124632 ) ) ( not ( = ?auto_124627 ?auto_124634 ) ) ( not ( = ?auto_124627 ?auto_124631 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124633 ?auto_124632 ?auto_124634 ?auto_124631 ?auto_124630 ?auto_124629 )
      ( MAKE-4PILE ?auto_124626 ?auto_124627 ?auto_124628 ?auto_124629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124635 - BLOCK
      ?auto_124636 - BLOCK
      ?auto_124637 - BLOCK
      ?auto_124638 - BLOCK
    )
    :vars
    (
      ?auto_124640 - BLOCK
      ?auto_124642 - BLOCK
      ?auto_124639 - BLOCK
      ?auto_124643 - BLOCK
      ?auto_124641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124635 ) ( not ( = ?auto_124635 ?auto_124636 ) ) ( not ( = ?auto_124635 ?auto_124637 ) ) ( not ( = ?auto_124635 ?auto_124638 ) ) ( not ( = ?auto_124636 ?auto_124637 ) ) ( not ( = ?auto_124636 ?auto_124638 ) ) ( not ( = ?auto_124637 ?auto_124638 ) ) ( ON ?auto_124638 ?auto_124640 ) ( not ( = ?auto_124635 ?auto_124640 ) ) ( not ( = ?auto_124636 ?auto_124640 ) ) ( not ( = ?auto_124637 ?auto_124640 ) ) ( not ( = ?auto_124638 ?auto_124640 ) ) ( ON ?auto_124637 ?auto_124638 ) ( CLEAR ?auto_124637 ) ( ON-TABLE ?auto_124642 ) ( ON ?auto_124639 ?auto_124642 ) ( ON ?auto_124643 ?auto_124639 ) ( ON ?auto_124641 ?auto_124643 ) ( ON ?auto_124640 ?auto_124641 ) ( not ( = ?auto_124642 ?auto_124639 ) ) ( not ( = ?auto_124642 ?auto_124643 ) ) ( not ( = ?auto_124642 ?auto_124641 ) ) ( not ( = ?auto_124642 ?auto_124640 ) ) ( not ( = ?auto_124642 ?auto_124638 ) ) ( not ( = ?auto_124642 ?auto_124637 ) ) ( not ( = ?auto_124639 ?auto_124643 ) ) ( not ( = ?auto_124639 ?auto_124641 ) ) ( not ( = ?auto_124639 ?auto_124640 ) ) ( not ( = ?auto_124639 ?auto_124638 ) ) ( not ( = ?auto_124639 ?auto_124637 ) ) ( not ( = ?auto_124643 ?auto_124641 ) ) ( not ( = ?auto_124643 ?auto_124640 ) ) ( not ( = ?auto_124643 ?auto_124638 ) ) ( not ( = ?auto_124643 ?auto_124637 ) ) ( not ( = ?auto_124641 ?auto_124640 ) ) ( not ( = ?auto_124641 ?auto_124638 ) ) ( not ( = ?auto_124641 ?auto_124637 ) ) ( not ( = ?auto_124635 ?auto_124642 ) ) ( not ( = ?auto_124635 ?auto_124639 ) ) ( not ( = ?auto_124635 ?auto_124643 ) ) ( not ( = ?auto_124635 ?auto_124641 ) ) ( not ( = ?auto_124636 ?auto_124642 ) ) ( not ( = ?auto_124636 ?auto_124639 ) ) ( not ( = ?auto_124636 ?auto_124643 ) ) ( not ( = ?auto_124636 ?auto_124641 ) ) ( HOLDING ?auto_124636 ) ( CLEAR ?auto_124635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124635 ?auto_124636 )
      ( MAKE-4PILE ?auto_124635 ?auto_124636 ?auto_124637 ?auto_124638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124644 - BLOCK
      ?auto_124645 - BLOCK
      ?auto_124646 - BLOCK
      ?auto_124647 - BLOCK
    )
    :vars
    (
      ?auto_124652 - BLOCK
      ?auto_124648 - BLOCK
      ?auto_124651 - BLOCK
      ?auto_124650 - BLOCK
      ?auto_124649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124644 ) ( not ( = ?auto_124644 ?auto_124645 ) ) ( not ( = ?auto_124644 ?auto_124646 ) ) ( not ( = ?auto_124644 ?auto_124647 ) ) ( not ( = ?auto_124645 ?auto_124646 ) ) ( not ( = ?auto_124645 ?auto_124647 ) ) ( not ( = ?auto_124646 ?auto_124647 ) ) ( ON ?auto_124647 ?auto_124652 ) ( not ( = ?auto_124644 ?auto_124652 ) ) ( not ( = ?auto_124645 ?auto_124652 ) ) ( not ( = ?auto_124646 ?auto_124652 ) ) ( not ( = ?auto_124647 ?auto_124652 ) ) ( ON ?auto_124646 ?auto_124647 ) ( ON-TABLE ?auto_124648 ) ( ON ?auto_124651 ?auto_124648 ) ( ON ?auto_124650 ?auto_124651 ) ( ON ?auto_124649 ?auto_124650 ) ( ON ?auto_124652 ?auto_124649 ) ( not ( = ?auto_124648 ?auto_124651 ) ) ( not ( = ?auto_124648 ?auto_124650 ) ) ( not ( = ?auto_124648 ?auto_124649 ) ) ( not ( = ?auto_124648 ?auto_124652 ) ) ( not ( = ?auto_124648 ?auto_124647 ) ) ( not ( = ?auto_124648 ?auto_124646 ) ) ( not ( = ?auto_124651 ?auto_124650 ) ) ( not ( = ?auto_124651 ?auto_124649 ) ) ( not ( = ?auto_124651 ?auto_124652 ) ) ( not ( = ?auto_124651 ?auto_124647 ) ) ( not ( = ?auto_124651 ?auto_124646 ) ) ( not ( = ?auto_124650 ?auto_124649 ) ) ( not ( = ?auto_124650 ?auto_124652 ) ) ( not ( = ?auto_124650 ?auto_124647 ) ) ( not ( = ?auto_124650 ?auto_124646 ) ) ( not ( = ?auto_124649 ?auto_124652 ) ) ( not ( = ?auto_124649 ?auto_124647 ) ) ( not ( = ?auto_124649 ?auto_124646 ) ) ( not ( = ?auto_124644 ?auto_124648 ) ) ( not ( = ?auto_124644 ?auto_124651 ) ) ( not ( = ?auto_124644 ?auto_124650 ) ) ( not ( = ?auto_124644 ?auto_124649 ) ) ( not ( = ?auto_124645 ?auto_124648 ) ) ( not ( = ?auto_124645 ?auto_124651 ) ) ( not ( = ?auto_124645 ?auto_124650 ) ) ( not ( = ?auto_124645 ?auto_124649 ) ) ( CLEAR ?auto_124644 ) ( ON ?auto_124645 ?auto_124646 ) ( CLEAR ?auto_124645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124648 ?auto_124651 ?auto_124650 ?auto_124649 ?auto_124652 ?auto_124647 ?auto_124646 )
      ( MAKE-4PILE ?auto_124644 ?auto_124645 ?auto_124646 ?auto_124647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124653 - BLOCK
      ?auto_124654 - BLOCK
      ?auto_124655 - BLOCK
      ?auto_124656 - BLOCK
    )
    :vars
    (
      ?auto_124657 - BLOCK
      ?auto_124661 - BLOCK
      ?auto_124660 - BLOCK
      ?auto_124659 - BLOCK
      ?auto_124658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124653 ?auto_124654 ) ) ( not ( = ?auto_124653 ?auto_124655 ) ) ( not ( = ?auto_124653 ?auto_124656 ) ) ( not ( = ?auto_124654 ?auto_124655 ) ) ( not ( = ?auto_124654 ?auto_124656 ) ) ( not ( = ?auto_124655 ?auto_124656 ) ) ( ON ?auto_124656 ?auto_124657 ) ( not ( = ?auto_124653 ?auto_124657 ) ) ( not ( = ?auto_124654 ?auto_124657 ) ) ( not ( = ?auto_124655 ?auto_124657 ) ) ( not ( = ?auto_124656 ?auto_124657 ) ) ( ON ?auto_124655 ?auto_124656 ) ( ON-TABLE ?auto_124661 ) ( ON ?auto_124660 ?auto_124661 ) ( ON ?auto_124659 ?auto_124660 ) ( ON ?auto_124658 ?auto_124659 ) ( ON ?auto_124657 ?auto_124658 ) ( not ( = ?auto_124661 ?auto_124660 ) ) ( not ( = ?auto_124661 ?auto_124659 ) ) ( not ( = ?auto_124661 ?auto_124658 ) ) ( not ( = ?auto_124661 ?auto_124657 ) ) ( not ( = ?auto_124661 ?auto_124656 ) ) ( not ( = ?auto_124661 ?auto_124655 ) ) ( not ( = ?auto_124660 ?auto_124659 ) ) ( not ( = ?auto_124660 ?auto_124658 ) ) ( not ( = ?auto_124660 ?auto_124657 ) ) ( not ( = ?auto_124660 ?auto_124656 ) ) ( not ( = ?auto_124660 ?auto_124655 ) ) ( not ( = ?auto_124659 ?auto_124658 ) ) ( not ( = ?auto_124659 ?auto_124657 ) ) ( not ( = ?auto_124659 ?auto_124656 ) ) ( not ( = ?auto_124659 ?auto_124655 ) ) ( not ( = ?auto_124658 ?auto_124657 ) ) ( not ( = ?auto_124658 ?auto_124656 ) ) ( not ( = ?auto_124658 ?auto_124655 ) ) ( not ( = ?auto_124653 ?auto_124661 ) ) ( not ( = ?auto_124653 ?auto_124660 ) ) ( not ( = ?auto_124653 ?auto_124659 ) ) ( not ( = ?auto_124653 ?auto_124658 ) ) ( not ( = ?auto_124654 ?auto_124661 ) ) ( not ( = ?auto_124654 ?auto_124660 ) ) ( not ( = ?auto_124654 ?auto_124659 ) ) ( not ( = ?auto_124654 ?auto_124658 ) ) ( ON ?auto_124654 ?auto_124655 ) ( CLEAR ?auto_124654 ) ( HOLDING ?auto_124653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124653 )
      ( MAKE-4PILE ?auto_124653 ?auto_124654 ?auto_124655 ?auto_124656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124662 - BLOCK
      ?auto_124663 - BLOCK
      ?auto_124664 - BLOCK
      ?auto_124665 - BLOCK
    )
    :vars
    (
      ?auto_124668 - BLOCK
      ?auto_124667 - BLOCK
      ?auto_124669 - BLOCK
      ?auto_124666 - BLOCK
      ?auto_124670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124662 ?auto_124663 ) ) ( not ( = ?auto_124662 ?auto_124664 ) ) ( not ( = ?auto_124662 ?auto_124665 ) ) ( not ( = ?auto_124663 ?auto_124664 ) ) ( not ( = ?auto_124663 ?auto_124665 ) ) ( not ( = ?auto_124664 ?auto_124665 ) ) ( ON ?auto_124665 ?auto_124668 ) ( not ( = ?auto_124662 ?auto_124668 ) ) ( not ( = ?auto_124663 ?auto_124668 ) ) ( not ( = ?auto_124664 ?auto_124668 ) ) ( not ( = ?auto_124665 ?auto_124668 ) ) ( ON ?auto_124664 ?auto_124665 ) ( ON-TABLE ?auto_124667 ) ( ON ?auto_124669 ?auto_124667 ) ( ON ?auto_124666 ?auto_124669 ) ( ON ?auto_124670 ?auto_124666 ) ( ON ?auto_124668 ?auto_124670 ) ( not ( = ?auto_124667 ?auto_124669 ) ) ( not ( = ?auto_124667 ?auto_124666 ) ) ( not ( = ?auto_124667 ?auto_124670 ) ) ( not ( = ?auto_124667 ?auto_124668 ) ) ( not ( = ?auto_124667 ?auto_124665 ) ) ( not ( = ?auto_124667 ?auto_124664 ) ) ( not ( = ?auto_124669 ?auto_124666 ) ) ( not ( = ?auto_124669 ?auto_124670 ) ) ( not ( = ?auto_124669 ?auto_124668 ) ) ( not ( = ?auto_124669 ?auto_124665 ) ) ( not ( = ?auto_124669 ?auto_124664 ) ) ( not ( = ?auto_124666 ?auto_124670 ) ) ( not ( = ?auto_124666 ?auto_124668 ) ) ( not ( = ?auto_124666 ?auto_124665 ) ) ( not ( = ?auto_124666 ?auto_124664 ) ) ( not ( = ?auto_124670 ?auto_124668 ) ) ( not ( = ?auto_124670 ?auto_124665 ) ) ( not ( = ?auto_124670 ?auto_124664 ) ) ( not ( = ?auto_124662 ?auto_124667 ) ) ( not ( = ?auto_124662 ?auto_124669 ) ) ( not ( = ?auto_124662 ?auto_124666 ) ) ( not ( = ?auto_124662 ?auto_124670 ) ) ( not ( = ?auto_124663 ?auto_124667 ) ) ( not ( = ?auto_124663 ?auto_124669 ) ) ( not ( = ?auto_124663 ?auto_124666 ) ) ( not ( = ?auto_124663 ?auto_124670 ) ) ( ON ?auto_124663 ?auto_124664 ) ( ON ?auto_124662 ?auto_124663 ) ( CLEAR ?auto_124662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124667 ?auto_124669 ?auto_124666 ?auto_124670 ?auto_124668 ?auto_124665 ?auto_124664 ?auto_124663 )
      ( MAKE-4PILE ?auto_124662 ?auto_124663 ?auto_124664 ?auto_124665 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124675 - BLOCK
      ?auto_124676 - BLOCK
      ?auto_124677 - BLOCK
      ?auto_124678 - BLOCK
    )
    :vars
    (
      ?auto_124679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124679 ?auto_124678 ) ( CLEAR ?auto_124679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124675 ) ( ON ?auto_124676 ?auto_124675 ) ( ON ?auto_124677 ?auto_124676 ) ( ON ?auto_124678 ?auto_124677 ) ( not ( = ?auto_124675 ?auto_124676 ) ) ( not ( = ?auto_124675 ?auto_124677 ) ) ( not ( = ?auto_124675 ?auto_124678 ) ) ( not ( = ?auto_124675 ?auto_124679 ) ) ( not ( = ?auto_124676 ?auto_124677 ) ) ( not ( = ?auto_124676 ?auto_124678 ) ) ( not ( = ?auto_124676 ?auto_124679 ) ) ( not ( = ?auto_124677 ?auto_124678 ) ) ( not ( = ?auto_124677 ?auto_124679 ) ) ( not ( = ?auto_124678 ?auto_124679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124679 ?auto_124678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124680 - BLOCK
      ?auto_124681 - BLOCK
      ?auto_124682 - BLOCK
      ?auto_124683 - BLOCK
    )
    :vars
    (
      ?auto_124684 - BLOCK
      ?auto_124685 - BLOCK
      ?auto_124686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124684 ?auto_124683 ) ( CLEAR ?auto_124684 ) ( ON-TABLE ?auto_124680 ) ( ON ?auto_124681 ?auto_124680 ) ( ON ?auto_124682 ?auto_124681 ) ( ON ?auto_124683 ?auto_124682 ) ( not ( = ?auto_124680 ?auto_124681 ) ) ( not ( = ?auto_124680 ?auto_124682 ) ) ( not ( = ?auto_124680 ?auto_124683 ) ) ( not ( = ?auto_124680 ?auto_124684 ) ) ( not ( = ?auto_124681 ?auto_124682 ) ) ( not ( = ?auto_124681 ?auto_124683 ) ) ( not ( = ?auto_124681 ?auto_124684 ) ) ( not ( = ?auto_124682 ?auto_124683 ) ) ( not ( = ?auto_124682 ?auto_124684 ) ) ( not ( = ?auto_124683 ?auto_124684 ) ) ( HOLDING ?auto_124685 ) ( CLEAR ?auto_124686 ) ( not ( = ?auto_124680 ?auto_124685 ) ) ( not ( = ?auto_124680 ?auto_124686 ) ) ( not ( = ?auto_124681 ?auto_124685 ) ) ( not ( = ?auto_124681 ?auto_124686 ) ) ( not ( = ?auto_124682 ?auto_124685 ) ) ( not ( = ?auto_124682 ?auto_124686 ) ) ( not ( = ?auto_124683 ?auto_124685 ) ) ( not ( = ?auto_124683 ?auto_124686 ) ) ( not ( = ?auto_124684 ?auto_124685 ) ) ( not ( = ?auto_124684 ?auto_124686 ) ) ( not ( = ?auto_124685 ?auto_124686 ) ) )
    :subtasks
    ( ( !STACK ?auto_124685 ?auto_124686 )
      ( MAKE-4PILE ?auto_124680 ?auto_124681 ?auto_124682 ?auto_124683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124687 - BLOCK
      ?auto_124688 - BLOCK
      ?auto_124689 - BLOCK
      ?auto_124690 - BLOCK
    )
    :vars
    (
      ?auto_124693 - BLOCK
      ?auto_124691 - BLOCK
      ?auto_124692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124693 ?auto_124690 ) ( ON-TABLE ?auto_124687 ) ( ON ?auto_124688 ?auto_124687 ) ( ON ?auto_124689 ?auto_124688 ) ( ON ?auto_124690 ?auto_124689 ) ( not ( = ?auto_124687 ?auto_124688 ) ) ( not ( = ?auto_124687 ?auto_124689 ) ) ( not ( = ?auto_124687 ?auto_124690 ) ) ( not ( = ?auto_124687 ?auto_124693 ) ) ( not ( = ?auto_124688 ?auto_124689 ) ) ( not ( = ?auto_124688 ?auto_124690 ) ) ( not ( = ?auto_124688 ?auto_124693 ) ) ( not ( = ?auto_124689 ?auto_124690 ) ) ( not ( = ?auto_124689 ?auto_124693 ) ) ( not ( = ?auto_124690 ?auto_124693 ) ) ( CLEAR ?auto_124691 ) ( not ( = ?auto_124687 ?auto_124692 ) ) ( not ( = ?auto_124687 ?auto_124691 ) ) ( not ( = ?auto_124688 ?auto_124692 ) ) ( not ( = ?auto_124688 ?auto_124691 ) ) ( not ( = ?auto_124689 ?auto_124692 ) ) ( not ( = ?auto_124689 ?auto_124691 ) ) ( not ( = ?auto_124690 ?auto_124692 ) ) ( not ( = ?auto_124690 ?auto_124691 ) ) ( not ( = ?auto_124693 ?auto_124692 ) ) ( not ( = ?auto_124693 ?auto_124691 ) ) ( not ( = ?auto_124692 ?auto_124691 ) ) ( ON ?auto_124692 ?auto_124693 ) ( CLEAR ?auto_124692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124687 ?auto_124688 ?auto_124689 ?auto_124690 ?auto_124693 )
      ( MAKE-4PILE ?auto_124687 ?auto_124688 ?auto_124689 ?auto_124690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124694 - BLOCK
      ?auto_124695 - BLOCK
      ?auto_124696 - BLOCK
      ?auto_124697 - BLOCK
    )
    :vars
    (
      ?auto_124699 - BLOCK
      ?auto_124700 - BLOCK
      ?auto_124698 - BLOCK
      ?auto_124702 - BLOCK
      ?auto_124701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124699 ?auto_124697 ) ( ON-TABLE ?auto_124694 ) ( ON ?auto_124695 ?auto_124694 ) ( ON ?auto_124696 ?auto_124695 ) ( ON ?auto_124697 ?auto_124696 ) ( not ( = ?auto_124694 ?auto_124695 ) ) ( not ( = ?auto_124694 ?auto_124696 ) ) ( not ( = ?auto_124694 ?auto_124697 ) ) ( not ( = ?auto_124694 ?auto_124699 ) ) ( not ( = ?auto_124695 ?auto_124696 ) ) ( not ( = ?auto_124695 ?auto_124697 ) ) ( not ( = ?auto_124695 ?auto_124699 ) ) ( not ( = ?auto_124696 ?auto_124697 ) ) ( not ( = ?auto_124696 ?auto_124699 ) ) ( not ( = ?auto_124697 ?auto_124699 ) ) ( not ( = ?auto_124694 ?auto_124700 ) ) ( not ( = ?auto_124694 ?auto_124698 ) ) ( not ( = ?auto_124695 ?auto_124700 ) ) ( not ( = ?auto_124695 ?auto_124698 ) ) ( not ( = ?auto_124696 ?auto_124700 ) ) ( not ( = ?auto_124696 ?auto_124698 ) ) ( not ( = ?auto_124697 ?auto_124700 ) ) ( not ( = ?auto_124697 ?auto_124698 ) ) ( not ( = ?auto_124699 ?auto_124700 ) ) ( not ( = ?auto_124699 ?auto_124698 ) ) ( not ( = ?auto_124700 ?auto_124698 ) ) ( ON ?auto_124700 ?auto_124699 ) ( CLEAR ?auto_124700 ) ( HOLDING ?auto_124698 ) ( CLEAR ?auto_124702 ) ( ON-TABLE ?auto_124701 ) ( ON ?auto_124702 ?auto_124701 ) ( not ( = ?auto_124701 ?auto_124702 ) ) ( not ( = ?auto_124701 ?auto_124698 ) ) ( not ( = ?auto_124702 ?auto_124698 ) ) ( not ( = ?auto_124694 ?auto_124702 ) ) ( not ( = ?auto_124694 ?auto_124701 ) ) ( not ( = ?auto_124695 ?auto_124702 ) ) ( not ( = ?auto_124695 ?auto_124701 ) ) ( not ( = ?auto_124696 ?auto_124702 ) ) ( not ( = ?auto_124696 ?auto_124701 ) ) ( not ( = ?auto_124697 ?auto_124702 ) ) ( not ( = ?auto_124697 ?auto_124701 ) ) ( not ( = ?auto_124699 ?auto_124702 ) ) ( not ( = ?auto_124699 ?auto_124701 ) ) ( not ( = ?auto_124700 ?auto_124702 ) ) ( not ( = ?auto_124700 ?auto_124701 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124701 ?auto_124702 ?auto_124698 )
      ( MAKE-4PILE ?auto_124694 ?auto_124695 ?auto_124696 ?auto_124697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124703 - BLOCK
      ?auto_124704 - BLOCK
      ?auto_124705 - BLOCK
      ?auto_124706 - BLOCK
    )
    :vars
    (
      ?auto_124709 - BLOCK
      ?auto_124710 - BLOCK
      ?auto_124707 - BLOCK
      ?auto_124708 - BLOCK
      ?auto_124711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124709 ?auto_124706 ) ( ON-TABLE ?auto_124703 ) ( ON ?auto_124704 ?auto_124703 ) ( ON ?auto_124705 ?auto_124704 ) ( ON ?auto_124706 ?auto_124705 ) ( not ( = ?auto_124703 ?auto_124704 ) ) ( not ( = ?auto_124703 ?auto_124705 ) ) ( not ( = ?auto_124703 ?auto_124706 ) ) ( not ( = ?auto_124703 ?auto_124709 ) ) ( not ( = ?auto_124704 ?auto_124705 ) ) ( not ( = ?auto_124704 ?auto_124706 ) ) ( not ( = ?auto_124704 ?auto_124709 ) ) ( not ( = ?auto_124705 ?auto_124706 ) ) ( not ( = ?auto_124705 ?auto_124709 ) ) ( not ( = ?auto_124706 ?auto_124709 ) ) ( not ( = ?auto_124703 ?auto_124710 ) ) ( not ( = ?auto_124703 ?auto_124707 ) ) ( not ( = ?auto_124704 ?auto_124710 ) ) ( not ( = ?auto_124704 ?auto_124707 ) ) ( not ( = ?auto_124705 ?auto_124710 ) ) ( not ( = ?auto_124705 ?auto_124707 ) ) ( not ( = ?auto_124706 ?auto_124710 ) ) ( not ( = ?auto_124706 ?auto_124707 ) ) ( not ( = ?auto_124709 ?auto_124710 ) ) ( not ( = ?auto_124709 ?auto_124707 ) ) ( not ( = ?auto_124710 ?auto_124707 ) ) ( ON ?auto_124710 ?auto_124709 ) ( CLEAR ?auto_124708 ) ( ON-TABLE ?auto_124711 ) ( ON ?auto_124708 ?auto_124711 ) ( not ( = ?auto_124711 ?auto_124708 ) ) ( not ( = ?auto_124711 ?auto_124707 ) ) ( not ( = ?auto_124708 ?auto_124707 ) ) ( not ( = ?auto_124703 ?auto_124708 ) ) ( not ( = ?auto_124703 ?auto_124711 ) ) ( not ( = ?auto_124704 ?auto_124708 ) ) ( not ( = ?auto_124704 ?auto_124711 ) ) ( not ( = ?auto_124705 ?auto_124708 ) ) ( not ( = ?auto_124705 ?auto_124711 ) ) ( not ( = ?auto_124706 ?auto_124708 ) ) ( not ( = ?auto_124706 ?auto_124711 ) ) ( not ( = ?auto_124709 ?auto_124708 ) ) ( not ( = ?auto_124709 ?auto_124711 ) ) ( not ( = ?auto_124710 ?auto_124708 ) ) ( not ( = ?auto_124710 ?auto_124711 ) ) ( ON ?auto_124707 ?auto_124710 ) ( CLEAR ?auto_124707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124703 ?auto_124704 ?auto_124705 ?auto_124706 ?auto_124709 ?auto_124710 )
      ( MAKE-4PILE ?auto_124703 ?auto_124704 ?auto_124705 ?auto_124706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124712 - BLOCK
      ?auto_124713 - BLOCK
      ?auto_124714 - BLOCK
      ?auto_124715 - BLOCK
    )
    :vars
    (
      ?auto_124719 - BLOCK
      ?auto_124718 - BLOCK
      ?auto_124720 - BLOCK
      ?auto_124716 - BLOCK
      ?auto_124717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124719 ?auto_124715 ) ( ON-TABLE ?auto_124712 ) ( ON ?auto_124713 ?auto_124712 ) ( ON ?auto_124714 ?auto_124713 ) ( ON ?auto_124715 ?auto_124714 ) ( not ( = ?auto_124712 ?auto_124713 ) ) ( not ( = ?auto_124712 ?auto_124714 ) ) ( not ( = ?auto_124712 ?auto_124715 ) ) ( not ( = ?auto_124712 ?auto_124719 ) ) ( not ( = ?auto_124713 ?auto_124714 ) ) ( not ( = ?auto_124713 ?auto_124715 ) ) ( not ( = ?auto_124713 ?auto_124719 ) ) ( not ( = ?auto_124714 ?auto_124715 ) ) ( not ( = ?auto_124714 ?auto_124719 ) ) ( not ( = ?auto_124715 ?auto_124719 ) ) ( not ( = ?auto_124712 ?auto_124718 ) ) ( not ( = ?auto_124712 ?auto_124720 ) ) ( not ( = ?auto_124713 ?auto_124718 ) ) ( not ( = ?auto_124713 ?auto_124720 ) ) ( not ( = ?auto_124714 ?auto_124718 ) ) ( not ( = ?auto_124714 ?auto_124720 ) ) ( not ( = ?auto_124715 ?auto_124718 ) ) ( not ( = ?auto_124715 ?auto_124720 ) ) ( not ( = ?auto_124719 ?auto_124718 ) ) ( not ( = ?auto_124719 ?auto_124720 ) ) ( not ( = ?auto_124718 ?auto_124720 ) ) ( ON ?auto_124718 ?auto_124719 ) ( ON-TABLE ?auto_124716 ) ( not ( = ?auto_124716 ?auto_124717 ) ) ( not ( = ?auto_124716 ?auto_124720 ) ) ( not ( = ?auto_124717 ?auto_124720 ) ) ( not ( = ?auto_124712 ?auto_124717 ) ) ( not ( = ?auto_124712 ?auto_124716 ) ) ( not ( = ?auto_124713 ?auto_124717 ) ) ( not ( = ?auto_124713 ?auto_124716 ) ) ( not ( = ?auto_124714 ?auto_124717 ) ) ( not ( = ?auto_124714 ?auto_124716 ) ) ( not ( = ?auto_124715 ?auto_124717 ) ) ( not ( = ?auto_124715 ?auto_124716 ) ) ( not ( = ?auto_124719 ?auto_124717 ) ) ( not ( = ?auto_124719 ?auto_124716 ) ) ( not ( = ?auto_124718 ?auto_124717 ) ) ( not ( = ?auto_124718 ?auto_124716 ) ) ( ON ?auto_124720 ?auto_124718 ) ( CLEAR ?auto_124720 ) ( HOLDING ?auto_124717 ) ( CLEAR ?auto_124716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124716 ?auto_124717 )
      ( MAKE-4PILE ?auto_124712 ?auto_124713 ?auto_124714 ?auto_124715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126414 - BLOCK
      ?auto_126415 - BLOCK
      ?auto_126416 - BLOCK
      ?auto_126417 - BLOCK
    )
    :vars
    (
      ?auto_126419 - BLOCK
      ?auto_126421 - BLOCK
      ?auto_126420 - BLOCK
      ?auto_126418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126419 ?auto_126417 ) ( ON-TABLE ?auto_126414 ) ( ON ?auto_126415 ?auto_126414 ) ( ON ?auto_126416 ?auto_126415 ) ( ON ?auto_126417 ?auto_126416 ) ( not ( = ?auto_126414 ?auto_126415 ) ) ( not ( = ?auto_126414 ?auto_126416 ) ) ( not ( = ?auto_126414 ?auto_126417 ) ) ( not ( = ?auto_126414 ?auto_126419 ) ) ( not ( = ?auto_126415 ?auto_126416 ) ) ( not ( = ?auto_126415 ?auto_126417 ) ) ( not ( = ?auto_126415 ?auto_126419 ) ) ( not ( = ?auto_126416 ?auto_126417 ) ) ( not ( = ?auto_126416 ?auto_126419 ) ) ( not ( = ?auto_126417 ?auto_126419 ) ) ( not ( = ?auto_126414 ?auto_126421 ) ) ( not ( = ?auto_126414 ?auto_126420 ) ) ( not ( = ?auto_126415 ?auto_126421 ) ) ( not ( = ?auto_126415 ?auto_126420 ) ) ( not ( = ?auto_126416 ?auto_126421 ) ) ( not ( = ?auto_126416 ?auto_126420 ) ) ( not ( = ?auto_126417 ?auto_126421 ) ) ( not ( = ?auto_126417 ?auto_126420 ) ) ( not ( = ?auto_126419 ?auto_126421 ) ) ( not ( = ?auto_126419 ?auto_126420 ) ) ( not ( = ?auto_126421 ?auto_126420 ) ) ( ON ?auto_126421 ?auto_126419 ) ( not ( = ?auto_126418 ?auto_126420 ) ) ( not ( = ?auto_126414 ?auto_126418 ) ) ( not ( = ?auto_126415 ?auto_126418 ) ) ( not ( = ?auto_126416 ?auto_126418 ) ) ( not ( = ?auto_126417 ?auto_126418 ) ) ( not ( = ?auto_126419 ?auto_126418 ) ) ( not ( = ?auto_126421 ?auto_126418 ) ) ( ON ?auto_126420 ?auto_126421 ) ( ON ?auto_126418 ?auto_126420 ) ( CLEAR ?auto_126418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126414 ?auto_126415 ?auto_126416 ?auto_126417 ?auto_126419 ?auto_126421 ?auto_126420 )
      ( MAKE-4PILE ?auto_126414 ?auto_126415 ?auto_126416 ?auto_126417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124730 - BLOCK
      ?auto_124731 - BLOCK
      ?auto_124732 - BLOCK
      ?auto_124733 - BLOCK
    )
    :vars
    (
      ?auto_124736 - BLOCK
      ?auto_124738 - BLOCK
      ?auto_124737 - BLOCK
      ?auto_124734 - BLOCK
      ?auto_124735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124736 ?auto_124733 ) ( ON-TABLE ?auto_124730 ) ( ON ?auto_124731 ?auto_124730 ) ( ON ?auto_124732 ?auto_124731 ) ( ON ?auto_124733 ?auto_124732 ) ( not ( = ?auto_124730 ?auto_124731 ) ) ( not ( = ?auto_124730 ?auto_124732 ) ) ( not ( = ?auto_124730 ?auto_124733 ) ) ( not ( = ?auto_124730 ?auto_124736 ) ) ( not ( = ?auto_124731 ?auto_124732 ) ) ( not ( = ?auto_124731 ?auto_124733 ) ) ( not ( = ?auto_124731 ?auto_124736 ) ) ( not ( = ?auto_124732 ?auto_124733 ) ) ( not ( = ?auto_124732 ?auto_124736 ) ) ( not ( = ?auto_124733 ?auto_124736 ) ) ( not ( = ?auto_124730 ?auto_124738 ) ) ( not ( = ?auto_124730 ?auto_124737 ) ) ( not ( = ?auto_124731 ?auto_124738 ) ) ( not ( = ?auto_124731 ?auto_124737 ) ) ( not ( = ?auto_124732 ?auto_124738 ) ) ( not ( = ?auto_124732 ?auto_124737 ) ) ( not ( = ?auto_124733 ?auto_124738 ) ) ( not ( = ?auto_124733 ?auto_124737 ) ) ( not ( = ?auto_124736 ?auto_124738 ) ) ( not ( = ?auto_124736 ?auto_124737 ) ) ( not ( = ?auto_124738 ?auto_124737 ) ) ( ON ?auto_124738 ?auto_124736 ) ( not ( = ?auto_124734 ?auto_124735 ) ) ( not ( = ?auto_124734 ?auto_124737 ) ) ( not ( = ?auto_124735 ?auto_124737 ) ) ( not ( = ?auto_124730 ?auto_124735 ) ) ( not ( = ?auto_124730 ?auto_124734 ) ) ( not ( = ?auto_124731 ?auto_124735 ) ) ( not ( = ?auto_124731 ?auto_124734 ) ) ( not ( = ?auto_124732 ?auto_124735 ) ) ( not ( = ?auto_124732 ?auto_124734 ) ) ( not ( = ?auto_124733 ?auto_124735 ) ) ( not ( = ?auto_124733 ?auto_124734 ) ) ( not ( = ?auto_124736 ?auto_124735 ) ) ( not ( = ?auto_124736 ?auto_124734 ) ) ( not ( = ?auto_124738 ?auto_124735 ) ) ( not ( = ?auto_124738 ?auto_124734 ) ) ( ON ?auto_124737 ?auto_124738 ) ( ON ?auto_124735 ?auto_124737 ) ( CLEAR ?auto_124735 ) ( HOLDING ?auto_124734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124734 )
      ( MAKE-4PILE ?auto_124730 ?auto_124731 ?auto_124732 ?auto_124733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124739 - BLOCK
      ?auto_124740 - BLOCK
      ?auto_124741 - BLOCK
      ?auto_124742 - BLOCK
    )
    :vars
    (
      ?auto_124744 - BLOCK
      ?auto_124745 - BLOCK
      ?auto_124746 - BLOCK
      ?auto_124747 - BLOCK
      ?auto_124743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124744 ?auto_124742 ) ( ON-TABLE ?auto_124739 ) ( ON ?auto_124740 ?auto_124739 ) ( ON ?auto_124741 ?auto_124740 ) ( ON ?auto_124742 ?auto_124741 ) ( not ( = ?auto_124739 ?auto_124740 ) ) ( not ( = ?auto_124739 ?auto_124741 ) ) ( not ( = ?auto_124739 ?auto_124742 ) ) ( not ( = ?auto_124739 ?auto_124744 ) ) ( not ( = ?auto_124740 ?auto_124741 ) ) ( not ( = ?auto_124740 ?auto_124742 ) ) ( not ( = ?auto_124740 ?auto_124744 ) ) ( not ( = ?auto_124741 ?auto_124742 ) ) ( not ( = ?auto_124741 ?auto_124744 ) ) ( not ( = ?auto_124742 ?auto_124744 ) ) ( not ( = ?auto_124739 ?auto_124745 ) ) ( not ( = ?auto_124739 ?auto_124746 ) ) ( not ( = ?auto_124740 ?auto_124745 ) ) ( not ( = ?auto_124740 ?auto_124746 ) ) ( not ( = ?auto_124741 ?auto_124745 ) ) ( not ( = ?auto_124741 ?auto_124746 ) ) ( not ( = ?auto_124742 ?auto_124745 ) ) ( not ( = ?auto_124742 ?auto_124746 ) ) ( not ( = ?auto_124744 ?auto_124745 ) ) ( not ( = ?auto_124744 ?auto_124746 ) ) ( not ( = ?auto_124745 ?auto_124746 ) ) ( ON ?auto_124745 ?auto_124744 ) ( not ( = ?auto_124747 ?auto_124743 ) ) ( not ( = ?auto_124747 ?auto_124746 ) ) ( not ( = ?auto_124743 ?auto_124746 ) ) ( not ( = ?auto_124739 ?auto_124743 ) ) ( not ( = ?auto_124739 ?auto_124747 ) ) ( not ( = ?auto_124740 ?auto_124743 ) ) ( not ( = ?auto_124740 ?auto_124747 ) ) ( not ( = ?auto_124741 ?auto_124743 ) ) ( not ( = ?auto_124741 ?auto_124747 ) ) ( not ( = ?auto_124742 ?auto_124743 ) ) ( not ( = ?auto_124742 ?auto_124747 ) ) ( not ( = ?auto_124744 ?auto_124743 ) ) ( not ( = ?auto_124744 ?auto_124747 ) ) ( not ( = ?auto_124745 ?auto_124743 ) ) ( not ( = ?auto_124745 ?auto_124747 ) ) ( ON ?auto_124746 ?auto_124745 ) ( ON ?auto_124743 ?auto_124746 ) ( ON ?auto_124747 ?auto_124743 ) ( CLEAR ?auto_124747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124739 ?auto_124740 ?auto_124741 ?auto_124742 ?auto_124744 ?auto_124745 ?auto_124746 ?auto_124743 )
      ( MAKE-4PILE ?auto_124739 ?auto_124740 ?auto_124741 ?auto_124742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124753 - BLOCK
      ?auto_124754 - BLOCK
      ?auto_124755 - BLOCK
      ?auto_124756 - BLOCK
      ?auto_124757 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124757 ) ( CLEAR ?auto_124756 ) ( ON-TABLE ?auto_124753 ) ( ON ?auto_124754 ?auto_124753 ) ( ON ?auto_124755 ?auto_124754 ) ( ON ?auto_124756 ?auto_124755 ) ( not ( = ?auto_124753 ?auto_124754 ) ) ( not ( = ?auto_124753 ?auto_124755 ) ) ( not ( = ?auto_124753 ?auto_124756 ) ) ( not ( = ?auto_124753 ?auto_124757 ) ) ( not ( = ?auto_124754 ?auto_124755 ) ) ( not ( = ?auto_124754 ?auto_124756 ) ) ( not ( = ?auto_124754 ?auto_124757 ) ) ( not ( = ?auto_124755 ?auto_124756 ) ) ( not ( = ?auto_124755 ?auto_124757 ) ) ( not ( = ?auto_124756 ?auto_124757 ) ) )
    :subtasks
    ( ( !STACK ?auto_124757 ?auto_124756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124758 - BLOCK
      ?auto_124759 - BLOCK
      ?auto_124760 - BLOCK
      ?auto_124761 - BLOCK
      ?auto_124762 - BLOCK
    )
    :vars
    (
      ?auto_124763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124761 ) ( ON-TABLE ?auto_124758 ) ( ON ?auto_124759 ?auto_124758 ) ( ON ?auto_124760 ?auto_124759 ) ( ON ?auto_124761 ?auto_124760 ) ( not ( = ?auto_124758 ?auto_124759 ) ) ( not ( = ?auto_124758 ?auto_124760 ) ) ( not ( = ?auto_124758 ?auto_124761 ) ) ( not ( = ?auto_124758 ?auto_124762 ) ) ( not ( = ?auto_124759 ?auto_124760 ) ) ( not ( = ?auto_124759 ?auto_124761 ) ) ( not ( = ?auto_124759 ?auto_124762 ) ) ( not ( = ?auto_124760 ?auto_124761 ) ) ( not ( = ?auto_124760 ?auto_124762 ) ) ( not ( = ?auto_124761 ?auto_124762 ) ) ( ON ?auto_124762 ?auto_124763 ) ( CLEAR ?auto_124762 ) ( HAND-EMPTY ) ( not ( = ?auto_124758 ?auto_124763 ) ) ( not ( = ?auto_124759 ?auto_124763 ) ) ( not ( = ?auto_124760 ?auto_124763 ) ) ( not ( = ?auto_124761 ?auto_124763 ) ) ( not ( = ?auto_124762 ?auto_124763 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124762 ?auto_124763 )
      ( MAKE-5PILE ?auto_124758 ?auto_124759 ?auto_124760 ?auto_124761 ?auto_124762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124764 - BLOCK
      ?auto_124765 - BLOCK
      ?auto_124766 - BLOCK
      ?auto_124767 - BLOCK
      ?auto_124768 - BLOCK
    )
    :vars
    (
      ?auto_124769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124764 ) ( ON ?auto_124765 ?auto_124764 ) ( ON ?auto_124766 ?auto_124765 ) ( not ( = ?auto_124764 ?auto_124765 ) ) ( not ( = ?auto_124764 ?auto_124766 ) ) ( not ( = ?auto_124764 ?auto_124767 ) ) ( not ( = ?auto_124764 ?auto_124768 ) ) ( not ( = ?auto_124765 ?auto_124766 ) ) ( not ( = ?auto_124765 ?auto_124767 ) ) ( not ( = ?auto_124765 ?auto_124768 ) ) ( not ( = ?auto_124766 ?auto_124767 ) ) ( not ( = ?auto_124766 ?auto_124768 ) ) ( not ( = ?auto_124767 ?auto_124768 ) ) ( ON ?auto_124768 ?auto_124769 ) ( CLEAR ?auto_124768 ) ( not ( = ?auto_124764 ?auto_124769 ) ) ( not ( = ?auto_124765 ?auto_124769 ) ) ( not ( = ?auto_124766 ?auto_124769 ) ) ( not ( = ?auto_124767 ?auto_124769 ) ) ( not ( = ?auto_124768 ?auto_124769 ) ) ( HOLDING ?auto_124767 ) ( CLEAR ?auto_124766 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124764 ?auto_124765 ?auto_124766 ?auto_124767 )
      ( MAKE-5PILE ?auto_124764 ?auto_124765 ?auto_124766 ?auto_124767 ?auto_124768 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124770 - BLOCK
      ?auto_124771 - BLOCK
      ?auto_124772 - BLOCK
      ?auto_124773 - BLOCK
      ?auto_124774 - BLOCK
    )
    :vars
    (
      ?auto_124775 - BLOCK
      ?auto_124777 - BLOCK
      ?auto_124776 - BLOCK
      ?auto_124778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124770 ) ( ON ?auto_124771 ?auto_124770 ) ( ON ?auto_124772 ?auto_124771 ) ( not ( = ?auto_124770 ?auto_124771 ) ) ( not ( = ?auto_124770 ?auto_124772 ) ) ( not ( = ?auto_124770 ?auto_124773 ) ) ( not ( = ?auto_124770 ?auto_124774 ) ) ( not ( = ?auto_124771 ?auto_124772 ) ) ( not ( = ?auto_124771 ?auto_124773 ) ) ( not ( = ?auto_124771 ?auto_124774 ) ) ( not ( = ?auto_124772 ?auto_124773 ) ) ( not ( = ?auto_124772 ?auto_124774 ) ) ( not ( = ?auto_124773 ?auto_124774 ) ) ( ON ?auto_124774 ?auto_124775 ) ( not ( = ?auto_124770 ?auto_124775 ) ) ( not ( = ?auto_124771 ?auto_124775 ) ) ( not ( = ?auto_124772 ?auto_124775 ) ) ( not ( = ?auto_124773 ?auto_124775 ) ) ( not ( = ?auto_124774 ?auto_124775 ) ) ( CLEAR ?auto_124772 ) ( ON ?auto_124773 ?auto_124774 ) ( CLEAR ?auto_124773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124777 ) ( ON ?auto_124776 ?auto_124777 ) ( ON ?auto_124778 ?auto_124776 ) ( ON ?auto_124775 ?auto_124778 ) ( not ( = ?auto_124777 ?auto_124776 ) ) ( not ( = ?auto_124777 ?auto_124778 ) ) ( not ( = ?auto_124777 ?auto_124775 ) ) ( not ( = ?auto_124777 ?auto_124774 ) ) ( not ( = ?auto_124777 ?auto_124773 ) ) ( not ( = ?auto_124776 ?auto_124778 ) ) ( not ( = ?auto_124776 ?auto_124775 ) ) ( not ( = ?auto_124776 ?auto_124774 ) ) ( not ( = ?auto_124776 ?auto_124773 ) ) ( not ( = ?auto_124778 ?auto_124775 ) ) ( not ( = ?auto_124778 ?auto_124774 ) ) ( not ( = ?auto_124778 ?auto_124773 ) ) ( not ( = ?auto_124770 ?auto_124777 ) ) ( not ( = ?auto_124770 ?auto_124776 ) ) ( not ( = ?auto_124770 ?auto_124778 ) ) ( not ( = ?auto_124771 ?auto_124777 ) ) ( not ( = ?auto_124771 ?auto_124776 ) ) ( not ( = ?auto_124771 ?auto_124778 ) ) ( not ( = ?auto_124772 ?auto_124777 ) ) ( not ( = ?auto_124772 ?auto_124776 ) ) ( not ( = ?auto_124772 ?auto_124778 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124777 ?auto_124776 ?auto_124778 ?auto_124775 ?auto_124774 )
      ( MAKE-5PILE ?auto_124770 ?auto_124771 ?auto_124772 ?auto_124773 ?auto_124774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124779 - BLOCK
      ?auto_124780 - BLOCK
      ?auto_124781 - BLOCK
      ?auto_124782 - BLOCK
      ?auto_124783 - BLOCK
    )
    :vars
    (
      ?auto_124784 - BLOCK
      ?auto_124785 - BLOCK
      ?auto_124786 - BLOCK
      ?auto_124787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124779 ) ( ON ?auto_124780 ?auto_124779 ) ( not ( = ?auto_124779 ?auto_124780 ) ) ( not ( = ?auto_124779 ?auto_124781 ) ) ( not ( = ?auto_124779 ?auto_124782 ) ) ( not ( = ?auto_124779 ?auto_124783 ) ) ( not ( = ?auto_124780 ?auto_124781 ) ) ( not ( = ?auto_124780 ?auto_124782 ) ) ( not ( = ?auto_124780 ?auto_124783 ) ) ( not ( = ?auto_124781 ?auto_124782 ) ) ( not ( = ?auto_124781 ?auto_124783 ) ) ( not ( = ?auto_124782 ?auto_124783 ) ) ( ON ?auto_124783 ?auto_124784 ) ( not ( = ?auto_124779 ?auto_124784 ) ) ( not ( = ?auto_124780 ?auto_124784 ) ) ( not ( = ?auto_124781 ?auto_124784 ) ) ( not ( = ?auto_124782 ?auto_124784 ) ) ( not ( = ?auto_124783 ?auto_124784 ) ) ( ON ?auto_124782 ?auto_124783 ) ( CLEAR ?auto_124782 ) ( ON-TABLE ?auto_124785 ) ( ON ?auto_124786 ?auto_124785 ) ( ON ?auto_124787 ?auto_124786 ) ( ON ?auto_124784 ?auto_124787 ) ( not ( = ?auto_124785 ?auto_124786 ) ) ( not ( = ?auto_124785 ?auto_124787 ) ) ( not ( = ?auto_124785 ?auto_124784 ) ) ( not ( = ?auto_124785 ?auto_124783 ) ) ( not ( = ?auto_124785 ?auto_124782 ) ) ( not ( = ?auto_124786 ?auto_124787 ) ) ( not ( = ?auto_124786 ?auto_124784 ) ) ( not ( = ?auto_124786 ?auto_124783 ) ) ( not ( = ?auto_124786 ?auto_124782 ) ) ( not ( = ?auto_124787 ?auto_124784 ) ) ( not ( = ?auto_124787 ?auto_124783 ) ) ( not ( = ?auto_124787 ?auto_124782 ) ) ( not ( = ?auto_124779 ?auto_124785 ) ) ( not ( = ?auto_124779 ?auto_124786 ) ) ( not ( = ?auto_124779 ?auto_124787 ) ) ( not ( = ?auto_124780 ?auto_124785 ) ) ( not ( = ?auto_124780 ?auto_124786 ) ) ( not ( = ?auto_124780 ?auto_124787 ) ) ( not ( = ?auto_124781 ?auto_124785 ) ) ( not ( = ?auto_124781 ?auto_124786 ) ) ( not ( = ?auto_124781 ?auto_124787 ) ) ( HOLDING ?auto_124781 ) ( CLEAR ?auto_124780 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124779 ?auto_124780 ?auto_124781 )
      ( MAKE-5PILE ?auto_124779 ?auto_124780 ?auto_124781 ?auto_124782 ?auto_124783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124788 - BLOCK
      ?auto_124789 - BLOCK
      ?auto_124790 - BLOCK
      ?auto_124791 - BLOCK
      ?auto_124792 - BLOCK
    )
    :vars
    (
      ?auto_124795 - BLOCK
      ?auto_124794 - BLOCK
      ?auto_124796 - BLOCK
      ?auto_124793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124788 ) ( ON ?auto_124789 ?auto_124788 ) ( not ( = ?auto_124788 ?auto_124789 ) ) ( not ( = ?auto_124788 ?auto_124790 ) ) ( not ( = ?auto_124788 ?auto_124791 ) ) ( not ( = ?auto_124788 ?auto_124792 ) ) ( not ( = ?auto_124789 ?auto_124790 ) ) ( not ( = ?auto_124789 ?auto_124791 ) ) ( not ( = ?auto_124789 ?auto_124792 ) ) ( not ( = ?auto_124790 ?auto_124791 ) ) ( not ( = ?auto_124790 ?auto_124792 ) ) ( not ( = ?auto_124791 ?auto_124792 ) ) ( ON ?auto_124792 ?auto_124795 ) ( not ( = ?auto_124788 ?auto_124795 ) ) ( not ( = ?auto_124789 ?auto_124795 ) ) ( not ( = ?auto_124790 ?auto_124795 ) ) ( not ( = ?auto_124791 ?auto_124795 ) ) ( not ( = ?auto_124792 ?auto_124795 ) ) ( ON ?auto_124791 ?auto_124792 ) ( ON-TABLE ?auto_124794 ) ( ON ?auto_124796 ?auto_124794 ) ( ON ?auto_124793 ?auto_124796 ) ( ON ?auto_124795 ?auto_124793 ) ( not ( = ?auto_124794 ?auto_124796 ) ) ( not ( = ?auto_124794 ?auto_124793 ) ) ( not ( = ?auto_124794 ?auto_124795 ) ) ( not ( = ?auto_124794 ?auto_124792 ) ) ( not ( = ?auto_124794 ?auto_124791 ) ) ( not ( = ?auto_124796 ?auto_124793 ) ) ( not ( = ?auto_124796 ?auto_124795 ) ) ( not ( = ?auto_124796 ?auto_124792 ) ) ( not ( = ?auto_124796 ?auto_124791 ) ) ( not ( = ?auto_124793 ?auto_124795 ) ) ( not ( = ?auto_124793 ?auto_124792 ) ) ( not ( = ?auto_124793 ?auto_124791 ) ) ( not ( = ?auto_124788 ?auto_124794 ) ) ( not ( = ?auto_124788 ?auto_124796 ) ) ( not ( = ?auto_124788 ?auto_124793 ) ) ( not ( = ?auto_124789 ?auto_124794 ) ) ( not ( = ?auto_124789 ?auto_124796 ) ) ( not ( = ?auto_124789 ?auto_124793 ) ) ( not ( = ?auto_124790 ?auto_124794 ) ) ( not ( = ?auto_124790 ?auto_124796 ) ) ( not ( = ?auto_124790 ?auto_124793 ) ) ( CLEAR ?auto_124789 ) ( ON ?auto_124790 ?auto_124791 ) ( CLEAR ?auto_124790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124794 ?auto_124796 ?auto_124793 ?auto_124795 ?auto_124792 ?auto_124791 )
      ( MAKE-5PILE ?auto_124788 ?auto_124789 ?auto_124790 ?auto_124791 ?auto_124792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124797 - BLOCK
      ?auto_124798 - BLOCK
      ?auto_124799 - BLOCK
      ?auto_124800 - BLOCK
      ?auto_124801 - BLOCK
    )
    :vars
    (
      ?auto_124805 - BLOCK
      ?auto_124804 - BLOCK
      ?auto_124803 - BLOCK
      ?auto_124802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124797 ) ( not ( = ?auto_124797 ?auto_124798 ) ) ( not ( = ?auto_124797 ?auto_124799 ) ) ( not ( = ?auto_124797 ?auto_124800 ) ) ( not ( = ?auto_124797 ?auto_124801 ) ) ( not ( = ?auto_124798 ?auto_124799 ) ) ( not ( = ?auto_124798 ?auto_124800 ) ) ( not ( = ?auto_124798 ?auto_124801 ) ) ( not ( = ?auto_124799 ?auto_124800 ) ) ( not ( = ?auto_124799 ?auto_124801 ) ) ( not ( = ?auto_124800 ?auto_124801 ) ) ( ON ?auto_124801 ?auto_124805 ) ( not ( = ?auto_124797 ?auto_124805 ) ) ( not ( = ?auto_124798 ?auto_124805 ) ) ( not ( = ?auto_124799 ?auto_124805 ) ) ( not ( = ?auto_124800 ?auto_124805 ) ) ( not ( = ?auto_124801 ?auto_124805 ) ) ( ON ?auto_124800 ?auto_124801 ) ( ON-TABLE ?auto_124804 ) ( ON ?auto_124803 ?auto_124804 ) ( ON ?auto_124802 ?auto_124803 ) ( ON ?auto_124805 ?auto_124802 ) ( not ( = ?auto_124804 ?auto_124803 ) ) ( not ( = ?auto_124804 ?auto_124802 ) ) ( not ( = ?auto_124804 ?auto_124805 ) ) ( not ( = ?auto_124804 ?auto_124801 ) ) ( not ( = ?auto_124804 ?auto_124800 ) ) ( not ( = ?auto_124803 ?auto_124802 ) ) ( not ( = ?auto_124803 ?auto_124805 ) ) ( not ( = ?auto_124803 ?auto_124801 ) ) ( not ( = ?auto_124803 ?auto_124800 ) ) ( not ( = ?auto_124802 ?auto_124805 ) ) ( not ( = ?auto_124802 ?auto_124801 ) ) ( not ( = ?auto_124802 ?auto_124800 ) ) ( not ( = ?auto_124797 ?auto_124804 ) ) ( not ( = ?auto_124797 ?auto_124803 ) ) ( not ( = ?auto_124797 ?auto_124802 ) ) ( not ( = ?auto_124798 ?auto_124804 ) ) ( not ( = ?auto_124798 ?auto_124803 ) ) ( not ( = ?auto_124798 ?auto_124802 ) ) ( not ( = ?auto_124799 ?auto_124804 ) ) ( not ( = ?auto_124799 ?auto_124803 ) ) ( not ( = ?auto_124799 ?auto_124802 ) ) ( ON ?auto_124799 ?auto_124800 ) ( CLEAR ?auto_124799 ) ( HOLDING ?auto_124798 ) ( CLEAR ?auto_124797 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124797 ?auto_124798 )
      ( MAKE-5PILE ?auto_124797 ?auto_124798 ?auto_124799 ?auto_124800 ?auto_124801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124806 - BLOCK
      ?auto_124807 - BLOCK
      ?auto_124808 - BLOCK
      ?auto_124809 - BLOCK
      ?auto_124810 - BLOCK
    )
    :vars
    (
      ?auto_124814 - BLOCK
      ?auto_124811 - BLOCK
      ?auto_124812 - BLOCK
      ?auto_124813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124806 ) ( not ( = ?auto_124806 ?auto_124807 ) ) ( not ( = ?auto_124806 ?auto_124808 ) ) ( not ( = ?auto_124806 ?auto_124809 ) ) ( not ( = ?auto_124806 ?auto_124810 ) ) ( not ( = ?auto_124807 ?auto_124808 ) ) ( not ( = ?auto_124807 ?auto_124809 ) ) ( not ( = ?auto_124807 ?auto_124810 ) ) ( not ( = ?auto_124808 ?auto_124809 ) ) ( not ( = ?auto_124808 ?auto_124810 ) ) ( not ( = ?auto_124809 ?auto_124810 ) ) ( ON ?auto_124810 ?auto_124814 ) ( not ( = ?auto_124806 ?auto_124814 ) ) ( not ( = ?auto_124807 ?auto_124814 ) ) ( not ( = ?auto_124808 ?auto_124814 ) ) ( not ( = ?auto_124809 ?auto_124814 ) ) ( not ( = ?auto_124810 ?auto_124814 ) ) ( ON ?auto_124809 ?auto_124810 ) ( ON-TABLE ?auto_124811 ) ( ON ?auto_124812 ?auto_124811 ) ( ON ?auto_124813 ?auto_124812 ) ( ON ?auto_124814 ?auto_124813 ) ( not ( = ?auto_124811 ?auto_124812 ) ) ( not ( = ?auto_124811 ?auto_124813 ) ) ( not ( = ?auto_124811 ?auto_124814 ) ) ( not ( = ?auto_124811 ?auto_124810 ) ) ( not ( = ?auto_124811 ?auto_124809 ) ) ( not ( = ?auto_124812 ?auto_124813 ) ) ( not ( = ?auto_124812 ?auto_124814 ) ) ( not ( = ?auto_124812 ?auto_124810 ) ) ( not ( = ?auto_124812 ?auto_124809 ) ) ( not ( = ?auto_124813 ?auto_124814 ) ) ( not ( = ?auto_124813 ?auto_124810 ) ) ( not ( = ?auto_124813 ?auto_124809 ) ) ( not ( = ?auto_124806 ?auto_124811 ) ) ( not ( = ?auto_124806 ?auto_124812 ) ) ( not ( = ?auto_124806 ?auto_124813 ) ) ( not ( = ?auto_124807 ?auto_124811 ) ) ( not ( = ?auto_124807 ?auto_124812 ) ) ( not ( = ?auto_124807 ?auto_124813 ) ) ( not ( = ?auto_124808 ?auto_124811 ) ) ( not ( = ?auto_124808 ?auto_124812 ) ) ( not ( = ?auto_124808 ?auto_124813 ) ) ( ON ?auto_124808 ?auto_124809 ) ( CLEAR ?auto_124806 ) ( ON ?auto_124807 ?auto_124808 ) ( CLEAR ?auto_124807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124811 ?auto_124812 ?auto_124813 ?auto_124814 ?auto_124810 ?auto_124809 ?auto_124808 )
      ( MAKE-5PILE ?auto_124806 ?auto_124807 ?auto_124808 ?auto_124809 ?auto_124810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124815 - BLOCK
      ?auto_124816 - BLOCK
      ?auto_124817 - BLOCK
      ?auto_124818 - BLOCK
      ?auto_124819 - BLOCK
    )
    :vars
    (
      ?auto_124820 - BLOCK
      ?auto_124822 - BLOCK
      ?auto_124821 - BLOCK
      ?auto_124823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124815 ?auto_124816 ) ) ( not ( = ?auto_124815 ?auto_124817 ) ) ( not ( = ?auto_124815 ?auto_124818 ) ) ( not ( = ?auto_124815 ?auto_124819 ) ) ( not ( = ?auto_124816 ?auto_124817 ) ) ( not ( = ?auto_124816 ?auto_124818 ) ) ( not ( = ?auto_124816 ?auto_124819 ) ) ( not ( = ?auto_124817 ?auto_124818 ) ) ( not ( = ?auto_124817 ?auto_124819 ) ) ( not ( = ?auto_124818 ?auto_124819 ) ) ( ON ?auto_124819 ?auto_124820 ) ( not ( = ?auto_124815 ?auto_124820 ) ) ( not ( = ?auto_124816 ?auto_124820 ) ) ( not ( = ?auto_124817 ?auto_124820 ) ) ( not ( = ?auto_124818 ?auto_124820 ) ) ( not ( = ?auto_124819 ?auto_124820 ) ) ( ON ?auto_124818 ?auto_124819 ) ( ON-TABLE ?auto_124822 ) ( ON ?auto_124821 ?auto_124822 ) ( ON ?auto_124823 ?auto_124821 ) ( ON ?auto_124820 ?auto_124823 ) ( not ( = ?auto_124822 ?auto_124821 ) ) ( not ( = ?auto_124822 ?auto_124823 ) ) ( not ( = ?auto_124822 ?auto_124820 ) ) ( not ( = ?auto_124822 ?auto_124819 ) ) ( not ( = ?auto_124822 ?auto_124818 ) ) ( not ( = ?auto_124821 ?auto_124823 ) ) ( not ( = ?auto_124821 ?auto_124820 ) ) ( not ( = ?auto_124821 ?auto_124819 ) ) ( not ( = ?auto_124821 ?auto_124818 ) ) ( not ( = ?auto_124823 ?auto_124820 ) ) ( not ( = ?auto_124823 ?auto_124819 ) ) ( not ( = ?auto_124823 ?auto_124818 ) ) ( not ( = ?auto_124815 ?auto_124822 ) ) ( not ( = ?auto_124815 ?auto_124821 ) ) ( not ( = ?auto_124815 ?auto_124823 ) ) ( not ( = ?auto_124816 ?auto_124822 ) ) ( not ( = ?auto_124816 ?auto_124821 ) ) ( not ( = ?auto_124816 ?auto_124823 ) ) ( not ( = ?auto_124817 ?auto_124822 ) ) ( not ( = ?auto_124817 ?auto_124821 ) ) ( not ( = ?auto_124817 ?auto_124823 ) ) ( ON ?auto_124817 ?auto_124818 ) ( ON ?auto_124816 ?auto_124817 ) ( CLEAR ?auto_124816 ) ( HOLDING ?auto_124815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124815 )
      ( MAKE-5PILE ?auto_124815 ?auto_124816 ?auto_124817 ?auto_124818 ?auto_124819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124824 - BLOCK
      ?auto_124825 - BLOCK
      ?auto_124826 - BLOCK
      ?auto_124827 - BLOCK
      ?auto_124828 - BLOCK
    )
    :vars
    (
      ?auto_124829 - BLOCK
      ?auto_124832 - BLOCK
      ?auto_124831 - BLOCK
      ?auto_124830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124824 ?auto_124825 ) ) ( not ( = ?auto_124824 ?auto_124826 ) ) ( not ( = ?auto_124824 ?auto_124827 ) ) ( not ( = ?auto_124824 ?auto_124828 ) ) ( not ( = ?auto_124825 ?auto_124826 ) ) ( not ( = ?auto_124825 ?auto_124827 ) ) ( not ( = ?auto_124825 ?auto_124828 ) ) ( not ( = ?auto_124826 ?auto_124827 ) ) ( not ( = ?auto_124826 ?auto_124828 ) ) ( not ( = ?auto_124827 ?auto_124828 ) ) ( ON ?auto_124828 ?auto_124829 ) ( not ( = ?auto_124824 ?auto_124829 ) ) ( not ( = ?auto_124825 ?auto_124829 ) ) ( not ( = ?auto_124826 ?auto_124829 ) ) ( not ( = ?auto_124827 ?auto_124829 ) ) ( not ( = ?auto_124828 ?auto_124829 ) ) ( ON ?auto_124827 ?auto_124828 ) ( ON-TABLE ?auto_124832 ) ( ON ?auto_124831 ?auto_124832 ) ( ON ?auto_124830 ?auto_124831 ) ( ON ?auto_124829 ?auto_124830 ) ( not ( = ?auto_124832 ?auto_124831 ) ) ( not ( = ?auto_124832 ?auto_124830 ) ) ( not ( = ?auto_124832 ?auto_124829 ) ) ( not ( = ?auto_124832 ?auto_124828 ) ) ( not ( = ?auto_124832 ?auto_124827 ) ) ( not ( = ?auto_124831 ?auto_124830 ) ) ( not ( = ?auto_124831 ?auto_124829 ) ) ( not ( = ?auto_124831 ?auto_124828 ) ) ( not ( = ?auto_124831 ?auto_124827 ) ) ( not ( = ?auto_124830 ?auto_124829 ) ) ( not ( = ?auto_124830 ?auto_124828 ) ) ( not ( = ?auto_124830 ?auto_124827 ) ) ( not ( = ?auto_124824 ?auto_124832 ) ) ( not ( = ?auto_124824 ?auto_124831 ) ) ( not ( = ?auto_124824 ?auto_124830 ) ) ( not ( = ?auto_124825 ?auto_124832 ) ) ( not ( = ?auto_124825 ?auto_124831 ) ) ( not ( = ?auto_124825 ?auto_124830 ) ) ( not ( = ?auto_124826 ?auto_124832 ) ) ( not ( = ?auto_124826 ?auto_124831 ) ) ( not ( = ?auto_124826 ?auto_124830 ) ) ( ON ?auto_124826 ?auto_124827 ) ( ON ?auto_124825 ?auto_124826 ) ( ON ?auto_124824 ?auto_124825 ) ( CLEAR ?auto_124824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124832 ?auto_124831 ?auto_124830 ?auto_124829 ?auto_124828 ?auto_124827 ?auto_124826 ?auto_124825 )
      ( MAKE-5PILE ?auto_124824 ?auto_124825 ?auto_124826 ?auto_124827 ?auto_124828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124836 - BLOCK
      ?auto_124837 - BLOCK
      ?auto_124838 - BLOCK
    )
    :vars
    (
      ?auto_124839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124839 ?auto_124838 ) ( CLEAR ?auto_124839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124836 ) ( ON ?auto_124837 ?auto_124836 ) ( ON ?auto_124838 ?auto_124837 ) ( not ( = ?auto_124836 ?auto_124837 ) ) ( not ( = ?auto_124836 ?auto_124838 ) ) ( not ( = ?auto_124836 ?auto_124839 ) ) ( not ( = ?auto_124837 ?auto_124838 ) ) ( not ( = ?auto_124837 ?auto_124839 ) ) ( not ( = ?auto_124838 ?auto_124839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124839 ?auto_124838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124840 - BLOCK
      ?auto_124841 - BLOCK
      ?auto_124842 - BLOCK
    )
    :vars
    (
      ?auto_124843 - BLOCK
      ?auto_124844 - BLOCK
      ?auto_124845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124843 ?auto_124842 ) ( CLEAR ?auto_124843 ) ( ON-TABLE ?auto_124840 ) ( ON ?auto_124841 ?auto_124840 ) ( ON ?auto_124842 ?auto_124841 ) ( not ( = ?auto_124840 ?auto_124841 ) ) ( not ( = ?auto_124840 ?auto_124842 ) ) ( not ( = ?auto_124840 ?auto_124843 ) ) ( not ( = ?auto_124841 ?auto_124842 ) ) ( not ( = ?auto_124841 ?auto_124843 ) ) ( not ( = ?auto_124842 ?auto_124843 ) ) ( HOLDING ?auto_124844 ) ( CLEAR ?auto_124845 ) ( not ( = ?auto_124840 ?auto_124844 ) ) ( not ( = ?auto_124840 ?auto_124845 ) ) ( not ( = ?auto_124841 ?auto_124844 ) ) ( not ( = ?auto_124841 ?auto_124845 ) ) ( not ( = ?auto_124842 ?auto_124844 ) ) ( not ( = ?auto_124842 ?auto_124845 ) ) ( not ( = ?auto_124843 ?auto_124844 ) ) ( not ( = ?auto_124843 ?auto_124845 ) ) ( not ( = ?auto_124844 ?auto_124845 ) ) )
    :subtasks
    ( ( !STACK ?auto_124844 ?auto_124845 )
      ( MAKE-3PILE ?auto_124840 ?auto_124841 ?auto_124842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124846 - BLOCK
      ?auto_124847 - BLOCK
      ?auto_124848 - BLOCK
    )
    :vars
    (
      ?auto_124849 - BLOCK
      ?auto_124851 - BLOCK
      ?auto_124850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124849 ?auto_124848 ) ( ON-TABLE ?auto_124846 ) ( ON ?auto_124847 ?auto_124846 ) ( ON ?auto_124848 ?auto_124847 ) ( not ( = ?auto_124846 ?auto_124847 ) ) ( not ( = ?auto_124846 ?auto_124848 ) ) ( not ( = ?auto_124846 ?auto_124849 ) ) ( not ( = ?auto_124847 ?auto_124848 ) ) ( not ( = ?auto_124847 ?auto_124849 ) ) ( not ( = ?auto_124848 ?auto_124849 ) ) ( CLEAR ?auto_124851 ) ( not ( = ?auto_124846 ?auto_124850 ) ) ( not ( = ?auto_124846 ?auto_124851 ) ) ( not ( = ?auto_124847 ?auto_124850 ) ) ( not ( = ?auto_124847 ?auto_124851 ) ) ( not ( = ?auto_124848 ?auto_124850 ) ) ( not ( = ?auto_124848 ?auto_124851 ) ) ( not ( = ?auto_124849 ?auto_124850 ) ) ( not ( = ?auto_124849 ?auto_124851 ) ) ( not ( = ?auto_124850 ?auto_124851 ) ) ( ON ?auto_124850 ?auto_124849 ) ( CLEAR ?auto_124850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124846 ?auto_124847 ?auto_124848 ?auto_124849 )
      ( MAKE-3PILE ?auto_124846 ?auto_124847 ?auto_124848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124852 - BLOCK
      ?auto_124853 - BLOCK
      ?auto_124854 - BLOCK
    )
    :vars
    (
      ?auto_124857 - BLOCK
      ?auto_124856 - BLOCK
      ?auto_124855 - BLOCK
      ?auto_124858 - BLOCK
      ?auto_124860 - BLOCK
      ?auto_124859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124857 ?auto_124854 ) ( ON-TABLE ?auto_124852 ) ( ON ?auto_124853 ?auto_124852 ) ( ON ?auto_124854 ?auto_124853 ) ( not ( = ?auto_124852 ?auto_124853 ) ) ( not ( = ?auto_124852 ?auto_124854 ) ) ( not ( = ?auto_124852 ?auto_124857 ) ) ( not ( = ?auto_124853 ?auto_124854 ) ) ( not ( = ?auto_124853 ?auto_124857 ) ) ( not ( = ?auto_124854 ?auto_124857 ) ) ( not ( = ?auto_124852 ?auto_124856 ) ) ( not ( = ?auto_124852 ?auto_124855 ) ) ( not ( = ?auto_124853 ?auto_124856 ) ) ( not ( = ?auto_124853 ?auto_124855 ) ) ( not ( = ?auto_124854 ?auto_124856 ) ) ( not ( = ?auto_124854 ?auto_124855 ) ) ( not ( = ?auto_124857 ?auto_124856 ) ) ( not ( = ?auto_124857 ?auto_124855 ) ) ( not ( = ?auto_124856 ?auto_124855 ) ) ( ON ?auto_124856 ?auto_124857 ) ( CLEAR ?auto_124856 ) ( HOLDING ?auto_124855 ) ( CLEAR ?auto_124858 ) ( ON-TABLE ?auto_124860 ) ( ON ?auto_124859 ?auto_124860 ) ( ON ?auto_124858 ?auto_124859 ) ( not ( = ?auto_124860 ?auto_124859 ) ) ( not ( = ?auto_124860 ?auto_124858 ) ) ( not ( = ?auto_124860 ?auto_124855 ) ) ( not ( = ?auto_124859 ?auto_124858 ) ) ( not ( = ?auto_124859 ?auto_124855 ) ) ( not ( = ?auto_124858 ?auto_124855 ) ) ( not ( = ?auto_124852 ?auto_124858 ) ) ( not ( = ?auto_124852 ?auto_124860 ) ) ( not ( = ?auto_124852 ?auto_124859 ) ) ( not ( = ?auto_124853 ?auto_124858 ) ) ( not ( = ?auto_124853 ?auto_124860 ) ) ( not ( = ?auto_124853 ?auto_124859 ) ) ( not ( = ?auto_124854 ?auto_124858 ) ) ( not ( = ?auto_124854 ?auto_124860 ) ) ( not ( = ?auto_124854 ?auto_124859 ) ) ( not ( = ?auto_124857 ?auto_124858 ) ) ( not ( = ?auto_124857 ?auto_124860 ) ) ( not ( = ?auto_124857 ?auto_124859 ) ) ( not ( = ?auto_124856 ?auto_124858 ) ) ( not ( = ?auto_124856 ?auto_124860 ) ) ( not ( = ?auto_124856 ?auto_124859 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124860 ?auto_124859 ?auto_124858 ?auto_124855 )
      ( MAKE-3PILE ?auto_124852 ?auto_124853 ?auto_124854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124861 - BLOCK
      ?auto_124862 - BLOCK
      ?auto_124863 - BLOCK
    )
    :vars
    (
      ?auto_124867 - BLOCK
      ?auto_124866 - BLOCK
      ?auto_124865 - BLOCK
      ?auto_124868 - BLOCK
      ?auto_124864 - BLOCK
      ?auto_124869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124867 ?auto_124863 ) ( ON-TABLE ?auto_124861 ) ( ON ?auto_124862 ?auto_124861 ) ( ON ?auto_124863 ?auto_124862 ) ( not ( = ?auto_124861 ?auto_124862 ) ) ( not ( = ?auto_124861 ?auto_124863 ) ) ( not ( = ?auto_124861 ?auto_124867 ) ) ( not ( = ?auto_124862 ?auto_124863 ) ) ( not ( = ?auto_124862 ?auto_124867 ) ) ( not ( = ?auto_124863 ?auto_124867 ) ) ( not ( = ?auto_124861 ?auto_124866 ) ) ( not ( = ?auto_124861 ?auto_124865 ) ) ( not ( = ?auto_124862 ?auto_124866 ) ) ( not ( = ?auto_124862 ?auto_124865 ) ) ( not ( = ?auto_124863 ?auto_124866 ) ) ( not ( = ?auto_124863 ?auto_124865 ) ) ( not ( = ?auto_124867 ?auto_124866 ) ) ( not ( = ?auto_124867 ?auto_124865 ) ) ( not ( = ?auto_124866 ?auto_124865 ) ) ( ON ?auto_124866 ?auto_124867 ) ( CLEAR ?auto_124868 ) ( ON-TABLE ?auto_124864 ) ( ON ?auto_124869 ?auto_124864 ) ( ON ?auto_124868 ?auto_124869 ) ( not ( = ?auto_124864 ?auto_124869 ) ) ( not ( = ?auto_124864 ?auto_124868 ) ) ( not ( = ?auto_124864 ?auto_124865 ) ) ( not ( = ?auto_124869 ?auto_124868 ) ) ( not ( = ?auto_124869 ?auto_124865 ) ) ( not ( = ?auto_124868 ?auto_124865 ) ) ( not ( = ?auto_124861 ?auto_124868 ) ) ( not ( = ?auto_124861 ?auto_124864 ) ) ( not ( = ?auto_124861 ?auto_124869 ) ) ( not ( = ?auto_124862 ?auto_124868 ) ) ( not ( = ?auto_124862 ?auto_124864 ) ) ( not ( = ?auto_124862 ?auto_124869 ) ) ( not ( = ?auto_124863 ?auto_124868 ) ) ( not ( = ?auto_124863 ?auto_124864 ) ) ( not ( = ?auto_124863 ?auto_124869 ) ) ( not ( = ?auto_124867 ?auto_124868 ) ) ( not ( = ?auto_124867 ?auto_124864 ) ) ( not ( = ?auto_124867 ?auto_124869 ) ) ( not ( = ?auto_124866 ?auto_124868 ) ) ( not ( = ?auto_124866 ?auto_124864 ) ) ( not ( = ?auto_124866 ?auto_124869 ) ) ( ON ?auto_124865 ?auto_124866 ) ( CLEAR ?auto_124865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124861 ?auto_124862 ?auto_124863 ?auto_124867 ?auto_124866 )
      ( MAKE-3PILE ?auto_124861 ?auto_124862 ?auto_124863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124870 - BLOCK
      ?auto_124871 - BLOCK
      ?auto_124872 - BLOCK
    )
    :vars
    (
      ?auto_124877 - BLOCK
      ?auto_124874 - BLOCK
      ?auto_124876 - BLOCK
      ?auto_124878 - BLOCK
      ?auto_124873 - BLOCK
      ?auto_124875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124877 ?auto_124872 ) ( ON-TABLE ?auto_124870 ) ( ON ?auto_124871 ?auto_124870 ) ( ON ?auto_124872 ?auto_124871 ) ( not ( = ?auto_124870 ?auto_124871 ) ) ( not ( = ?auto_124870 ?auto_124872 ) ) ( not ( = ?auto_124870 ?auto_124877 ) ) ( not ( = ?auto_124871 ?auto_124872 ) ) ( not ( = ?auto_124871 ?auto_124877 ) ) ( not ( = ?auto_124872 ?auto_124877 ) ) ( not ( = ?auto_124870 ?auto_124874 ) ) ( not ( = ?auto_124870 ?auto_124876 ) ) ( not ( = ?auto_124871 ?auto_124874 ) ) ( not ( = ?auto_124871 ?auto_124876 ) ) ( not ( = ?auto_124872 ?auto_124874 ) ) ( not ( = ?auto_124872 ?auto_124876 ) ) ( not ( = ?auto_124877 ?auto_124874 ) ) ( not ( = ?auto_124877 ?auto_124876 ) ) ( not ( = ?auto_124874 ?auto_124876 ) ) ( ON ?auto_124874 ?auto_124877 ) ( ON-TABLE ?auto_124878 ) ( ON ?auto_124873 ?auto_124878 ) ( not ( = ?auto_124878 ?auto_124873 ) ) ( not ( = ?auto_124878 ?auto_124875 ) ) ( not ( = ?auto_124878 ?auto_124876 ) ) ( not ( = ?auto_124873 ?auto_124875 ) ) ( not ( = ?auto_124873 ?auto_124876 ) ) ( not ( = ?auto_124875 ?auto_124876 ) ) ( not ( = ?auto_124870 ?auto_124875 ) ) ( not ( = ?auto_124870 ?auto_124878 ) ) ( not ( = ?auto_124870 ?auto_124873 ) ) ( not ( = ?auto_124871 ?auto_124875 ) ) ( not ( = ?auto_124871 ?auto_124878 ) ) ( not ( = ?auto_124871 ?auto_124873 ) ) ( not ( = ?auto_124872 ?auto_124875 ) ) ( not ( = ?auto_124872 ?auto_124878 ) ) ( not ( = ?auto_124872 ?auto_124873 ) ) ( not ( = ?auto_124877 ?auto_124875 ) ) ( not ( = ?auto_124877 ?auto_124878 ) ) ( not ( = ?auto_124877 ?auto_124873 ) ) ( not ( = ?auto_124874 ?auto_124875 ) ) ( not ( = ?auto_124874 ?auto_124878 ) ) ( not ( = ?auto_124874 ?auto_124873 ) ) ( ON ?auto_124876 ?auto_124874 ) ( CLEAR ?auto_124876 ) ( HOLDING ?auto_124875 ) ( CLEAR ?auto_124873 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124878 ?auto_124873 ?auto_124875 )
      ( MAKE-3PILE ?auto_124870 ?auto_124871 ?auto_124872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124879 - BLOCK
      ?auto_124880 - BLOCK
      ?auto_124881 - BLOCK
    )
    :vars
    (
      ?auto_124885 - BLOCK
      ?auto_124883 - BLOCK
      ?auto_124884 - BLOCK
      ?auto_124886 - BLOCK
      ?auto_124887 - BLOCK
      ?auto_124882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124885 ?auto_124881 ) ( ON-TABLE ?auto_124879 ) ( ON ?auto_124880 ?auto_124879 ) ( ON ?auto_124881 ?auto_124880 ) ( not ( = ?auto_124879 ?auto_124880 ) ) ( not ( = ?auto_124879 ?auto_124881 ) ) ( not ( = ?auto_124879 ?auto_124885 ) ) ( not ( = ?auto_124880 ?auto_124881 ) ) ( not ( = ?auto_124880 ?auto_124885 ) ) ( not ( = ?auto_124881 ?auto_124885 ) ) ( not ( = ?auto_124879 ?auto_124883 ) ) ( not ( = ?auto_124879 ?auto_124884 ) ) ( not ( = ?auto_124880 ?auto_124883 ) ) ( not ( = ?auto_124880 ?auto_124884 ) ) ( not ( = ?auto_124881 ?auto_124883 ) ) ( not ( = ?auto_124881 ?auto_124884 ) ) ( not ( = ?auto_124885 ?auto_124883 ) ) ( not ( = ?auto_124885 ?auto_124884 ) ) ( not ( = ?auto_124883 ?auto_124884 ) ) ( ON ?auto_124883 ?auto_124885 ) ( ON-TABLE ?auto_124886 ) ( ON ?auto_124887 ?auto_124886 ) ( not ( = ?auto_124886 ?auto_124887 ) ) ( not ( = ?auto_124886 ?auto_124882 ) ) ( not ( = ?auto_124886 ?auto_124884 ) ) ( not ( = ?auto_124887 ?auto_124882 ) ) ( not ( = ?auto_124887 ?auto_124884 ) ) ( not ( = ?auto_124882 ?auto_124884 ) ) ( not ( = ?auto_124879 ?auto_124882 ) ) ( not ( = ?auto_124879 ?auto_124886 ) ) ( not ( = ?auto_124879 ?auto_124887 ) ) ( not ( = ?auto_124880 ?auto_124882 ) ) ( not ( = ?auto_124880 ?auto_124886 ) ) ( not ( = ?auto_124880 ?auto_124887 ) ) ( not ( = ?auto_124881 ?auto_124882 ) ) ( not ( = ?auto_124881 ?auto_124886 ) ) ( not ( = ?auto_124881 ?auto_124887 ) ) ( not ( = ?auto_124885 ?auto_124882 ) ) ( not ( = ?auto_124885 ?auto_124886 ) ) ( not ( = ?auto_124885 ?auto_124887 ) ) ( not ( = ?auto_124883 ?auto_124882 ) ) ( not ( = ?auto_124883 ?auto_124886 ) ) ( not ( = ?auto_124883 ?auto_124887 ) ) ( ON ?auto_124884 ?auto_124883 ) ( CLEAR ?auto_124887 ) ( ON ?auto_124882 ?auto_124884 ) ( CLEAR ?auto_124882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124879 ?auto_124880 ?auto_124881 ?auto_124885 ?auto_124883 ?auto_124884 )
      ( MAKE-3PILE ?auto_124879 ?auto_124880 ?auto_124881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124888 - BLOCK
      ?auto_124889 - BLOCK
      ?auto_124890 - BLOCK
    )
    :vars
    (
      ?auto_124892 - BLOCK
      ?auto_124891 - BLOCK
      ?auto_124893 - BLOCK
      ?auto_124896 - BLOCK
      ?auto_124895 - BLOCK
      ?auto_124894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124892 ?auto_124890 ) ( ON-TABLE ?auto_124888 ) ( ON ?auto_124889 ?auto_124888 ) ( ON ?auto_124890 ?auto_124889 ) ( not ( = ?auto_124888 ?auto_124889 ) ) ( not ( = ?auto_124888 ?auto_124890 ) ) ( not ( = ?auto_124888 ?auto_124892 ) ) ( not ( = ?auto_124889 ?auto_124890 ) ) ( not ( = ?auto_124889 ?auto_124892 ) ) ( not ( = ?auto_124890 ?auto_124892 ) ) ( not ( = ?auto_124888 ?auto_124891 ) ) ( not ( = ?auto_124888 ?auto_124893 ) ) ( not ( = ?auto_124889 ?auto_124891 ) ) ( not ( = ?auto_124889 ?auto_124893 ) ) ( not ( = ?auto_124890 ?auto_124891 ) ) ( not ( = ?auto_124890 ?auto_124893 ) ) ( not ( = ?auto_124892 ?auto_124891 ) ) ( not ( = ?auto_124892 ?auto_124893 ) ) ( not ( = ?auto_124891 ?auto_124893 ) ) ( ON ?auto_124891 ?auto_124892 ) ( ON-TABLE ?auto_124896 ) ( not ( = ?auto_124896 ?auto_124895 ) ) ( not ( = ?auto_124896 ?auto_124894 ) ) ( not ( = ?auto_124896 ?auto_124893 ) ) ( not ( = ?auto_124895 ?auto_124894 ) ) ( not ( = ?auto_124895 ?auto_124893 ) ) ( not ( = ?auto_124894 ?auto_124893 ) ) ( not ( = ?auto_124888 ?auto_124894 ) ) ( not ( = ?auto_124888 ?auto_124896 ) ) ( not ( = ?auto_124888 ?auto_124895 ) ) ( not ( = ?auto_124889 ?auto_124894 ) ) ( not ( = ?auto_124889 ?auto_124896 ) ) ( not ( = ?auto_124889 ?auto_124895 ) ) ( not ( = ?auto_124890 ?auto_124894 ) ) ( not ( = ?auto_124890 ?auto_124896 ) ) ( not ( = ?auto_124890 ?auto_124895 ) ) ( not ( = ?auto_124892 ?auto_124894 ) ) ( not ( = ?auto_124892 ?auto_124896 ) ) ( not ( = ?auto_124892 ?auto_124895 ) ) ( not ( = ?auto_124891 ?auto_124894 ) ) ( not ( = ?auto_124891 ?auto_124896 ) ) ( not ( = ?auto_124891 ?auto_124895 ) ) ( ON ?auto_124893 ?auto_124891 ) ( ON ?auto_124894 ?auto_124893 ) ( CLEAR ?auto_124894 ) ( HOLDING ?auto_124895 ) ( CLEAR ?auto_124896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124896 ?auto_124895 )
      ( MAKE-3PILE ?auto_124888 ?auto_124889 ?auto_124890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126755 - BLOCK
      ?auto_126756 - BLOCK
      ?auto_126757 - BLOCK
    )
    :vars
    (
      ?auto_126760 - BLOCK
      ?auto_126758 - BLOCK
      ?auto_126761 - BLOCK
      ?auto_126759 - BLOCK
      ?auto_126762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126760 ?auto_126757 ) ( ON-TABLE ?auto_126755 ) ( ON ?auto_126756 ?auto_126755 ) ( ON ?auto_126757 ?auto_126756 ) ( not ( = ?auto_126755 ?auto_126756 ) ) ( not ( = ?auto_126755 ?auto_126757 ) ) ( not ( = ?auto_126755 ?auto_126760 ) ) ( not ( = ?auto_126756 ?auto_126757 ) ) ( not ( = ?auto_126756 ?auto_126760 ) ) ( not ( = ?auto_126757 ?auto_126760 ) ) ( not ( = ?auto_126755 ?auto_126758 ) ) ( not ( = ?auto_126755 ?auto_126761 ) ) ( not ( = ?auto_126756 ?auto_126758 ) ) ( not ( = ?auto_126756 ?auto_126761 ) ) ( not ( = ?auto_126757 ?auto_126758 ) ) ( not ( = ?auto_126757 ?auto_126761 ) ) ( not ( = ?auto_126760 ?auto_126758 ) ) ( not ( = ?auto_126760 ?auto_126761 ) ) ( not ( = ?auto_126758 ?auto_126761 ) ) ( ON ?auto_126758 ?auto_126760 ) ( not ( = ?auto_126759 ?auto_126762 ) ) ( not ( = ?auto_126759 ?auto_126761 ) ) ( not ( = ?auto_126762 ?auto_126761 ) ) ( not ( = ?auto_126755 ?auto_126762 ) ) ( not ( = ?auto_126755 ?auto_126759 ) ) ( not ( = ?auto_126756 ?auto_126762 ) ) ( not ( = ?auto_126756 ?auto_126759 ) ) ( not ( = ?auto_126757 ?auto_126762 ) ) ( not ( = ?auto_126757 ?auto_126759 ) ) ( not ( = ?auto_126760 ?auto_126762 ) ) ( not ( = ?auto_126760 ?auto_126759 ) ) ( not ( = ?auto_126758 ?auto_126762 ) ) ( not ( = ?auto_126758 ?auto_126759 ) ) ( ON ?auto_126761 ?auto_126758 ) ( ON ?auto_126762 ?auto_126761 ) ( ON ?auto_126759 ?auto_126762 ) ( CLEAR ?auto_126759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126755 ?auto_126756 ?auto_126757 ?auto_126760 ?auto_126758 ?auto_126761 ?auto_126762 )
      ( MAKE-3PILE ?auto_126755 ?auto_126756 ?auto_126757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124906 - BLOCK
      ?auto_124907 - BLOCK
      ?auto_124908 - BLOCK
    )
    :vars
    (
      ?auto_124913 - BLOCK
      ?auto_124909 - BLOCK
      ?auto_124914 - BLOCK
      ?auto_124910 - BLOCK
      ?auto_124911 - BLOCK
      ?auto_124912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124913 ?auto_124908 ) ( ON-TABLE ?auto_124906 ) ( ON ?auto_124907 ?auto_124906 ) ( ON ?auto_124908 ?auto_124907 ) ( not ( = ?auto_124906 ?auto_124907 ) ) ( not ( = ?auto_124906 ?auto_124908 ) ) ( not ( = ?auto_124906 ?auto_124913 ) ) ( not ( = ?auto_124907 ?auto_124908 ) ) ( not ( = ?auto_124907 ?auto_124913 ) ) ( not ( = ?auto_124908 ?auto_124913 ) ) ( not ( = ?auto_124906 ?auto_124909 ) ) ( not ( = ?auto_124906 ?auto_124914 ) ) ( not ( = ?auto_124907 ?auto_124909 ) ) ( not ( = ?auto_124907 ?auto_124914 ) ) ( not ( = ?auto_124908 ?auto_124909 ) ) ( not ( = ?auto_124908 ?auto_124914 ) ) ( not ( = ?auto_124913 ?auto_124909 ) ) ( not ( = ?auto_124913 ?auto_124914 ) ) ( not ( = ?auto_124909 ?auto_124914 ) ) ( ON ?auto_124909 ?auto_124913 ) ( not ( = ?auto_124910 ?auto_124911 ) ) ( not ( = ?auto_124910 ?auto_124912 ) ) ( not ( = ?auto_124910 ?auto_124914 ) ) ( not ( = ?auto_124911 ?auto_124912 ) ) ( not ( = ?auto_124911 ?auto_124914 ) ) ( not ( = ?auto_124912 ?auto_124914 ) ) ( not ( = ?auto_124906 ?auto_124912 ) ) ( not ( = ?auto_124906 ?auto_124910 ) ) ( not ( = ?auto_124906 ?auto_124911 ) ) ( not ( = ?auto_124907 ?auto_124912 ) ) ( not ( = ?auto_124907 ?auto_124910 ) ) ( not ( = ?auto_124907 ?auto_124911 ) ) ( not ( = ?auto_124908 ?auto_124912 ) ) ( not ( = ?auto_124908 ?auto_124910 ) ) ( not ( = ?auto_124908 ?auto_124911 ) ) ( not ( = ?auto_124913 ?auto_124912 ) ) ( not ( = ?auto_124913 ?auto_124910 ) ) ( not ( = ?auto_124913 ?auto_124911 ) ) ( not ( = ?auto_124909 ?auto_124912 ) ) ( not ( = ?auto_124909 ?auto_124910 ) ) ( not ( = ?auto_124909 ?auto_124911 ) ) ( ON ?auto_124914 ?auto_124909 ) ( ON ?auto_124912 ?auto_124914 ) ( ON ?auto_124911 ?auto_124912 ) ( CLEAR ?auto_124911 ) ( HOLDING ?auto_124910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124910 )
      ( MAKE-3PILE ?auto_124906 ?auto_124907 ?auto_124908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124915 - BLOCK
      ?auto_124916 - BLOCK
      ?auto_124917 - BLOCK
    )
    :vars
    (
      ?auto_124918 - BLOCK
      ?auto_124919 - BLOCK
      ?auto_124920 - BLOCK
      ?auto_124922 - BLOCK
      ?auto_124923 - BLOCK
      ?auto_124921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124918 ?auto_124917 ) ( ON-TABLE ?auto_124915 ) ( ON ?auto_124916 ?auto_124915 ) ( ON ?auto_124917 ?auto_124916 ) ( not ( = ?auto_124915 ?auto_124916 ) ) ( not ( = ?auto_124915 ?auto_124917 ) ) ( not ( = ?auto_124915 ?auto_124918 ) ) ( not ( = ?auto_124916 ?auto_124917 ) ) ( not ( = ?auto_124916 ?auto_124918 ) ) ( not ( = ?auto_124917 ?auto_124918 ) ) ( not ( = ?auto_124915 ?auto_124919 ) ) ( not ( = ?auto_124915 ?auto_124920 ) ) ( not ( = ?auto_124916 ?auto_124919 ) ) ( not ( = ?auto_124916 ?auto_124920 ) ) ( not ( = ?auto_124917 ?auto_124919 ) ) ( not ( = ?auto_124917 ?auto_124920 ) ) ( not ( = ?auto_124918 ?auto_124919 ) ) ( not ( = ?auto_124918 ?auto_124920 ) ) ( not ( = ?auto_124919 ?auto_124920 ) ) ( ON ?auto_124919 ?auto_124918 ) ( not ( = ?auto_124922 ?auto_124923 ) ) ( not ( = ?auto_124922 ?auto_124921 ) ) ( not ( = ?auto_124922 ?auto_124920 ) ) ( not ( = ?auto_124923 ?auto_124921 ) ) ( not ( = ?auto_124923 ?auto_124920 ) ) ( not ( = ?auto_124921 ?auto_124920 ) ) ( not ( = ?auto_124915 ?auto_124921 ) ) ( not ( = ?auto_124915 ?auto_124922 ) ) ( not ( = ?auto_124915 ?auto_124923 ) ) ( not ( = ?auto_124916 ?auto_124921 ) ) ( not ( = ?auto_124916 ?auto_124922 ) ) ( not ( = ?auto_124916 ?auto_124923 ) ) ( not ( = ?auto_124917 ?auto_124921 ) ) ( not ( = ?auto_124917 ?auto_124922 ) ) ( not ( = ?auto_124917 ?auto_124923 ) ) ( not ( = ?auto_124918 ?auto_124921 ) ) ( not ( = ?auto_124918 ?auto_124922 ) ) ( not ( = ?auto_124918 ?auto_124923 ) ) ( not ( = ?auto_124919 ?auto_124921 ) ) ( not ( = ?auto_124919 ?auto_124922 ) ) ( not ( = ?auto_124919 ?auto_124923 ) ) ( ON ?auto_124920 ?auto_124919 ) ( ON ?auto_124921 ?auto_124920 ) ( ON ?auto_124923 ?auto_124921 ) ( ON ?auto_124922 ?auto_124923 ) ( CLEAR ?auto_124922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124915 ?auto_124916 ?auto_124917 ?auto_124918 ?auto_124919 ?auto_124920 ?auto_124921 ?auto_124923 )
      ( MAKE-3PILE ?auto_124915 ?auto_124916 ?auto_124917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124930 - BLOCK
      ?auto_124931 - BLOCK
      ?auto_124932 - BLOCK
      ?auto_124933 - BLOCK
      ?auto_124934 - BLOCK
      ?auto_124935 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124935 ) ( CLEAR ?auto_124934 ) ( ON-TABLE ?auto_124930 ) ( ON ?auto_124931 ?auto_124930 ) ( ON ?auto_124932 ?auto_124931 ) ( ON ?auto_124933 ?auto_124932 ) ( ON ?auto_124934 ?auto_124933 ) ( not ( = ?auto_124930 ?auto_124931 ) ) ( not ( = ?auto_124930 ?auto_124932 ) ) ( not ( = ?auto_124930 ?auto_124933 ) ) ( not ( = ?auto_124930 ?auto_124934 ) ) ( not ( = ?auto_124930 ?auto_124935 ) ) ( not ( = ?auto_124931 ?auto_124932 ) ) ( not ( = ?auto_124931 ?auto_124933 ) ) ( not ( = ?auto_124931 ?auto_124934 ) ) ( not ( = ?auto_124931 ?auto_124935 ) ) ( not ( = ?auto_124932 ?auto_124933 ) ) ( not ( = ?auto_124932 ?auto_124934 ) ) ( not ( = ?auto_124932 ?auto_124935 ) ) ( not ( = ?auto_124933 ?auto_124934 ) ) ( not ( = ?auto_124933 ?auto_124935 ) ) ( not ( = ?auto_124934 ?auto_124935 ) ) )
    :subtasks
    ( ( !STACK ?auto_124935 ?auto_124934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124936 - BLOCK
      ?auto_124937 - BLOCK
      ?auto_124938 - BLOCK
      ?auto_124939 - BLOCK
      ?auto_124940 - BLOCK
      ?auto_124941 - BLOCK
    )
    :vars
    (
      ?auto_124942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124940 ) ( ON-TABLE ?auto_124936 ) ( ON ?auto_124937 ?auto_124936 ) ( ON ?auto_124938 ?auto_124937 ) ( ON ?auto_124939 ?auto_124938 ) ( ON ?auto_124940 ?auto_124939 ) ( not ( = ?auto_124936 ?auto_124937 ) ) ( not ( = ?auto_124936 ?auto_124938 ) ) ( not ( = ?auto_124936 ?auto_124939 ) ) ( not ( = ?auto_124936 ?auto_124940 ) ) ( not ( = ?auto_124936 ?auto_124941 ) ) ( not ( = ?auto_124937 ?auto_124938 ) ) ( not ( = ?auto_124937 ?auto_124939 ) ) ( not ( = ?auto_124937 ?auto_124940 ) ) ( not ( = ?auto_124937 ?auto_124941 ) ) ( not ( = ?auto_124938 ?auto_124939 ) ) ( not ( = ?auto_124938 ?auto_124940 ) ) ( not ( = ?auto_124938 ?auto_124941 ) ) ( not ( = ?auto_124939 ?auto_124940 ) ) ( not ( = ?auto_124939 ?auto_124941 ) ) ( not ( = ?auto_124940 ?auto_124941 ) ) ( ON ?auto_124941 ?auto_124942 ) ( CLEAR ?auto_124941 ) ( HAND-EMPTY ) ( not ( = ?auto_124936 ?auto_124942 ) ) ( not ( = ?auto_124937 ?auto_124942 ) ) ( not ( = ?auto_124938 ?auto_124942 ) ) ( not ( = ?auto_124939 ?auto_124942 ) ) ( not ( = ?auto_124940 ?auto_124942 ) ) ( not ( = ?auto_124941 ?auto_124942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124941 ?auto_124942 )
      ( MAKE-6PILE ?auto_124936 ?auto_124937 ?auto_124938 ?auto_124939 ?auto_124940 ?auto_124941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124943 - BLOCK
      ?auto_124944 - BLOCK
      ?auto_124945 - BLOCK
      ?auto_124946 - BLOCK
      ?auto_124947 - BLOCK
      ?auto_124948 - BLOCK
    )
    :vars
    (
      ?auto_124949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124943 ) ( ON ?auto_124944 ?auto_124943 ) ( ON ?auto_124945 ?auto_124944 ) ( ON ?auto_124946 ?auto_124945 ) ( not ( = ?auto_124943 ?auto_124944 ) ) ( not ( = ?auto_124943 ?auto_124945 ) ) ( not ( = ?auto_124943 ?auto_124946 ) ) ( not ( = ?auto_124943 ?auto_124947 ) ) ( not ( = ?auto_124943 ?auto_124948 ) ) ( not ( = ?auto_124944 ?auto_124945 ) ) ( not ( = ?auto_124944 ?auto_124946 ) ) ( not ( = ?auto_124944 ?auto_124947 ) ) ( not ( = ?auto_124944 ?auto_124948 ) ) ( not ( = ?auto_124945 ?auto_124946 ) ) ( not ( = ?auto_124945 ?auto_124947 ) ) ( not ( = ?auto_124945 ?auto_124948 ) ) ( not ( = ?auto_124946 ?auto_124947 ) ) ( not ( = ?auto_124946 ?auto_124948 ) ) ( not ( = ?auto_124947 ?auto_124948 ) ) ( ON ?auto_124948 ?auto_124949 ) ( CLEAR ?auto_124948 ) ( not ( = ?auto_124943 ?auto_124949 ) ) ( not ( = ?auto_124944 ?auto_124949 ) ) ( not ( = ?auto_124945 ?auto_124949 ) ) ( not ( = ?auto_124946 ?auto_124949 ) ) ( not ( = ?auto_124947 ?auto_124949 ) ) ( not ( = ?auto_124948 ?auto_124949 ) ) ( HOLDING ?auto_124947 ) ( CLEAR ?auto_124946 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124943 ?auto_124944 ?auto_124945 ?auto_124946 ?auto_124947 )
      ( MAKE-6PILE ?auto_124943 ?auto_124944 ?auto_124945 ?auto_124946 ?auto_124947 ?auto_124948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124950 - BLOCK
      ?auto_124951 - BLOCK
      ?auto_124952 - BLOCK
      ?auto_124953 - BLOCK
      ?auto_124954 - BLOCK
      ?auto_124955 - BLOCK
    )
    :vars
    (
      ?auto_124956 - BLOCK
      ?auto_124958 - BLOCK
      ?auto_124957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124950 ) ( ON ?auto_124951 ?auto_124950 ) ( ON ?auto_124952 ?auto_124951 ) ( ON ?auto_124953 ?auto_124952 ) ( not ( = ?auto_124950 ?auto_124951 ) ) ( not ( = ?auto_124950 ?auto_124952 ) ) ( not ( = ?auto_124950 ?auto_124953 ) ) ( not ( = ?auto_124950 ?auto_124954 ) ) ( not ( = ?auto_124950 ?auto_124955 ) ) ( not ( = ?auto_124951 ?auto_124952 ) ) ( not ( = ?auto_124951 ?auto_124953 ) ) ( not ( = ?auto_124951 ?auto_124954 ) ) ( not ( = ?auto_124951 ?auto_124955 ) ) ( not ( = ?auto_124952 ?auto_124953 ) ) ( not ( = ?auto_124952 ?auto_124954 ) ) ( not ( = ?auto_124952 ?auto_124955 ) ) ( not ( = ?auto_124953 ?auto_124954 ) ) ( not ( = ?auto_124953 ?auto_124955 ) ) ( not ( = ?auto_124954 ?auto_124955 ) ) ( ON ?auto_124955 ?auto_124956 ) ( not ( = ?auto_124950 ?auto_124956 ) ) ( not ( = ?auto_124951 ?auto_124956 ) ) ( not ( = ?auto_124952 ?auto_124956 ) ) ( not ( = ?auto_124953 ?auto_124956 ) ) ( not ( = ?auto_124954 ?auto_124956 ) ) ( not ( = ?auto_124955 ?auto_124956 ) ) ( CLEAR ?auto_124953 ) ( ON ?auto_124954 ?auto_124955 ) ( CLEAR ?auto_124954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124958 ) ( ON ?auto_124957 ?auto_124958 ) ( ON ?auto_124956 ?auto_124957 ) ( not ( = ?auto_124958 ?auto_124957 ) ) ( not ( = ?auto_124958 ?auto_124956 ) ) ( not ( = ?auto_124958 ?auto_124955 ) ) ( not ( = ?auto_124958 ?auto_124954 ) ) ( not ( = ?auto_124957 ?auto_124956 ) ) ( not ( = ?auto_124957 ?auto_124955 ) ) ( not ( = ?auto_124957 ?auto_124954 ) ) ( not ( = ?auto_124950 ?auto_124958 ) ) ( not ( = ?auto_124950 ?auto_124957 ) ) ( not ( = ?auto_124951 ?auto_124958 ) ) ( not ( = ?auto_124951 ?auto_124957 ) ) ( not ( = ?auto_124952 ?auto_124958 ) ) ( not ( = ?auto_124952 ?auto_124957 ) ) ( not ( = ?auto_124953 ?auto_124958 ) ) ( not ( = ?auto_124953 ?auto_124957 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124958 ?auto_124957 ?auto_124956 ?auto_124955 )
      ( MAKE-6PILE ?auto_124950 ?auto_124951 ?auto_124952 ?auto_124953 ?auto_124954 ?auto_124955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124959 - BLOCK
      ?auto_124960 - BLOCK
      ?auto_124961 - BLOCK
      ?auto_124962 - BLOCK
      ?auto_124963 - BLOCK
      ?auto_124964 - BLOCK
    )
    :vars
    (
      ?auto_124966 - BLOCK
      ?auto_124967 - BLOCK
      ?auto_124965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124959 ) ( ON ?auto_124960 ?auto_124959 ) ( ON ?auto_124961 ?auto_124960 ) ( not ( = ?auto_124959 ?auto_124960 ) ) ( not ( = ?auto_124959 ?auto_124961 ) ) ( not ( = ?auto_124959 ?auto_124962 ) ) ( not ( = ?auto_124959 ?auto_124963 ) ) ( not ( = ?auto_124959 ?auto_124964 ) ) ( not ( = ?auto_124960 ?auto_124961 ) ) ( not ( = ?auto_124960 ?auto_124962 ) ) ( not ( = ?auto_124960 ?auto_124963 ) ) ( not ( = ?auto_124960 ?auto_124964 ) ) ( not ( = ?auto_124961 ?auto_124962 ) ) ( not ( = ?auto_124961 ?auto_124963 ) ) ( not ( = ?auto_124961 ?auto_124964 ) ) ( not ( = ?auto_124962 ?auto_124963 ) ) ( not ( = ?auto_124962 ?auto_124964 ) ) ( not ( = ?auto_124963 ?auto_124964 ) ) ( ON ?auto_124964 ?auto_124966 ) ( not ( = ?auto_124959 ?auto_124966 ) ) ( not ( = ?auto_124960 ?auto_124966 ) ) ( not ( = ?auto_124961 ?auto_124966 ) ) ( not ( = ?auto_124962 ?auto_124966 ) ) ( not ( = ?auto_124963 ?auto_124966 ) ) ( not ( = ?auto_124964 ?auto_124966 ) ) ( ON ?auto_124963 ?auto_124964 ) ( CLEAR ?auto_124963 ) ( ON-TABLE ?auto_124967 ) ( ON ?auto_124965 ?auto_124967 ) ( ON ?auto_124966 ?auto_124965 ) ( not ( = ?auto_124967 ?auto_124965 ) ) ( not ( = ?auto_124967 ?auto_124966 ) ) ( not ( = ?auto_124967 ?auto_124964 ) ) ( not ( = ?auto_124967 ?auto_124963 ) ) ( not ( = ?auto_124965 ?auto_124966 ) ) ( not ( = ?auto_124965 ?auto_124964 ) ) ( not ( = ?auto_124965 ?auto_124963 ) ) ( not ( = ?auto_124959 ?auto_124967 ) ) ( not ( = ?auto_124959 ?auto_124965 ) ) ( not ( = ?auto_124960 ?auto_124967 ) ) ( not ( = ?auto_124960 ?auto_124965 ) ) ( not ( = ?auto_124961 ?auto_124967 ) ) ( not ( = ?auto_124961 ?auto_124965 ) ) ( not ( = ?auto_124962 ?auto_124967 ) ) ( not ( = ?auto_124962 ?auto_124965 ) ) ( HOLDING ?auto_124962 ) ( CLEAR ?auto_124961 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124959 ?auto_124960 ?auto_124961 ?auto_124962 )
      ( MAKE-6PILE ?auto_124959 ?auto_124960 ?auto_124961 ?auto_124962 ?auto_124963 ?auto_124964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124968 - BLOCK
      ?auto_124969 - BLOCK
      ?auto_124970 - BLOCK
      ?auto_124971 - BLOCK
      ?auto_124972 - BLOCK
      ?auto_124973 - BLOCK
    )
    :vars
    (
      ?auto_124974 - BLOCK
      ?auto_124975 - BLOCK
      ?auto_124976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124968 ) ( ON ?auto_124969 ?auto_124968 ) ( ON ?auto_124970 ?auto_124969 ) ( not ( = ?auto_124968 ?auto_124969 ) ) ( not ( = ?auto_124968 ?auto_124970 ) ) ( not ( = ?auto_124968 ?auto_124971 ) ) ( not ( = ?auto_124968 ?auto_124972 ) ) ( not ( = ?auto_124968 ?auto_124973 ) ) ( not ( = ?auto_124969 ?auto_124970 ) ) ( not ( = ?auto_124969 ?auto_124971 ) ) ( not ( = ?auto_124969 ?auto_124972 ) ) ( not ( = ?auto_124969 ?auto_124973 ) ) ( not ( = ?auto_124970 ?auto_124971 ) ) ( not ( = ?auto_124970 ?auto_124972 ) ) ( not ( = ?auto_124970 ?auto_124973 ) ) ( not ( = ?auto_124971 ?auto_124972 ) ) ( not ( = ?auto_124971 ?auto_124973 ) ) ( not ( = ?auto_124972 ?auto_124973 ) ) ( ON ?auto_124973 ?auto_124974 ) ( not ( = ?auto_124968 ?auto_124974 ) ) ( not ( = ?auto_124969 ?auto_124974 ) ) ( not ( = ?auto_124970 ?auto_124974 ) ) ( not ( = ?auto_124971 ?auto_124974 ) ) ( not ( = ?auto_124972 ?auto_124974 ) ) ( not ( = ?auto_124973 ?auto_124974 ) ) ( ON ?auto_124972 ?auto_124973 ) ( ON-TABLE ?auto_124975 ) ( ON ?auto_124976 ?auto_124975 ) ( ON ?auto_124974 ?auto_124976 ) ( not ( = ?auto_124975 ?auto_124976 ) ) ( not ( = ?auto_124975 ?auto_124974 ) ) ( not ( = ?auto_124975 ?auto_124973 ) ) ( not ( = ?auto_124975 ?auto_124972 ) ) ( not ( = ?auto_124976 ?auto_124974 ) ) ( not ( = ?auto_124976 ?auto_124973 ) ) ( not ( = ?auto_124976 ?auto_124972 ) ) ( not ( = ?auto_124968 ?auto_124975 ) ) ( not ( = ?auto_124968 ?auto_124976 ) ) ( not ( = ?auto_124969 ?auto_124975 ) ) ( not ( = ?auto_124969 ?auto_124976 ) ) ( not ( = ?auto_124970 ?auto_124975 ) ) ( not ( = ?auto_124970 ?auto_124976 ) ) ( not ( = ?auto_124971 ?auto_124975 ) ) ( not ( = ?auto_124971 ?auto_124976 ) ) ( CLEAR ?auto_124970 ) ( ON ?auto_124971 ?auto_124972 ) ( CLEAR ?auto_124971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124975 ?auto_124976 ?auto_124974 ?auto_124973 ?auto_124972 )
      ( MAKE-6PILE ?auto_124968 ?auto_124969 ?auto_124970 ?auto_124971 ?auto_124972 ?auto_124973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124977 - BLOCK
      ?auto_124978 - BLOCK
      ?auto_124979 - BLOCK
      ?auto_124980 - BLOCK
      ?auto_124981 - BLOCK
      ?auto_124982 - BLOCK
    )
    :vars
    (
      ?auto_124985 - BLOCK
      ?auto_124984 - BLOCK
      ?auto_124983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124977 ) ( ON ?auto_124978 ?auto_124977 ) ( not ( = ?auto_124977 ?auto_124978 ) ) ( not ( = ?auto_124977 ?auto_124979 ) ) ( not ( = ?auto_124977 ?auto_124980 ) ) ( not ( = ?auto_124977 ?auto_124981 ) ) ( not ( = ?auto_124977 ?auto_124982 ) ) ( not ( = ?auto_124978 ?auto_124979 ) ) ( not ( = ?auto_124978 ?auto_124980 ) ) ( not ( = ?auto_124978 ?auto_124981 ) ) ( not ( = ?auto_124978 ?auto_124982 ) ) ( not ( = ?auto_124979 ?auto_124980 ) ) ( not ( = ?auto_124979 ?auto_124981 ) ) ( not ( = ?auto_124979 ?auto_124982 ) ) ( not ( = ?auto_124980 ?auto_124981 ) ) ( not ( = ?auto_124980 ?auto_124982 ) ) ( not ( = ?auto_124981 ?auto_124982 ) ) ( ON ?auto_124982 ?auto_124985 ) ( not ( = ?auto_124977 ?auto_124985 ) ) ( not ( = ?auto_124978 ?auto_124985 ) ) ( not ( = ?auto_124979 ?auto_124985 ) ) ( not ( = ?auto_124980 ?auto_124985 ) ) ( not ( = ?auto_124981 ?auto_124985 ) ) ( not ( = ?auto_124982 ?auto_124985 ) ) ( ON ?auto_124981 ?auto_124982 ) ( ON-TABLE ?auto_124984 ) ( ON ?auto_124983 ?auto_124984 ) ( ON ?auto_124985 ?auto_124983 ) ( not ( = ?auto_124984 ?auto_124983 ) ) ( not ( = ?auto_124984 ?auto_124985 ) ) ( not ( = ?auto_124984 ?auto_124982 ) ) ( not ( = ?auto_124984 ?auto_124981 ) ) ( not ( = ?auto_124983 ?auto_124985 ) ) ( not ( = ?auto_124983 ?auto_124982 ) ) ( not ( = ?auto_124983 ?auto_124981 ) ) ( not ( = ?auto_124977 ?auto_124984 ) ) ( not ( = ?auto_124977 ?auto_124983 ) ) ( not ( = ?auto_124978 ?auto_124984 ) ) ( not ( = ?auto_124978 ?auto_124983 ) ) ( not ( = ?auto_124979 ?auto_124984 ) ) ( not ( = ?auto_124979 ?auto_124983 ) ) ( not ( = ?auto_124980 ?auto_124984 ) ) ( not ( = ?auto_124980 ?auto_124983 ) ) ( ON ?auto_124980 ?auto_124981 ) ( CLEAR ?auto_124980 ) ( HOLDING ?auto_124979 ) ( CLEAR ?auto_124978 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124977 ?auto_124978 ?auto_124979 )
      ( MAKE-6PILE ?auto_124977 ?auto_124978 ?auto_124979 ?auto_124980 ?auto_124981 ?auto_124982 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124986 - BLOCK
      ?auto_124987 - BLOCK
      ?auto_124988 - BLOCK
      ?auto_124989 - BLOCK
      ?auto_124990 - BLOCK
      ?auto_124991 - BLOCK
    )
    :vars
    (
      ?auto_124994 - BLOCK
      ?auto_124993 - BLOCK
      ?auto_124992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124986 ) ( ON ?auto_124987 ?auto_124986 ) ( not ( = ?auto_124986 ?auto_124987 ) ) ( not ( = ?auto_124986 ?auto_124988 ) ) ( not ( = ?auto_124986 ?auto_124989 ) ) ( not ( = ?auto_124986 ?auto_124990 ) ) ( not ( = ?auto_124986 ?auto_124991 ) ) ( not ( = ?auto_124987 ?auto_124988 ) ) ( not ( = ?auto_124987 ?auto_124989 ) ) ( not ( = ?auto_124987 ?auto_124990 ) ) ( not ( = ?auto_124987 ?auto_124991 ) ) ( not ( = ?auto_124988 ?auto_124989 ) ) ( not ( = ?auto_124988 ?auto_124990 ) ) ( not ( = ?auto_124988 ?auto_124991 ) ) ( not ( = ?auto_124989 ?auto_124990 ) ) ( not ( = ?auto_124989 ?auto_124991 ) ) ( not ( = ?auto_124990 ?auto_124991 ) ) ( ON ?auto_124991 ?auto_124994 ) ( not ( = ?auto_124986 ?auto_124994 ) ) ( not ( = ?auto_124987 ?auto_124994 ) ) ( not ( = ?auto_124988 ?auto_124994 ) ) ( not ( = ?auto_124989 ?auto_124994 ) ) ( not ( = ?auto_124990 ?auto_124994 ) ) ( not ( = ?auto_124991 ?auto_124994 ) ) ( ON ?auto_124990 ?auto_124991 ) ( ON-TABLE ?auto_124993 ) ( ON ?auto_124992 ?auto_124993 ) ( ON ?auto_124994 ?auto_124992 ) ( not ( = ?auto_124993 ?auto_124992 ) ) ( not ( = ?auto_124993 ?auto_124994 ) ) ( not ( = ?auto_124993 ?auto_124991 ) ) ( not ( = ?auto_124993 ?auto_124990 ) ) ( not ( = ?auto_124992 ?auto_124994 ) ) ( not ( = ?auto_124992 ?auto_124991 ) ) ( not ( = ?auto_124992 ?auto_124990 ) ) ( not ( = ?auto_124986 ?auto_124993 ) ) ( not ( = ?auto_124986 ?auto_124992 ) ) ( not ( = ?auto_124987 ?auto_124993 ) ) ( not ( = ?auto_124987 ?auto_124992 ) ) ( not ( = ?auto_124988 ?auto_124993 ) ) ( not ( = ?auto_124988 ?auto_124992 ) ) ( not ( = ?auto_124989 ?auto_124993 ) ) ( not ( = ?auto_124989 ?auto_124992 ) ) ( ON ?auto_124989 ?auto_124990 ) ( CLEAR ?auto_124987 ) ( ON ?auto_124988 ?auto_124989 ) ( CLEAR ?auto_124988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124993 ?auto_124992 ?auto_124994 ?auto_124991 ?auto_124990 ?auto_124989 )
      ( MAKE-6PILE ?auto_124986 ?auto_124987 ?auto_124988 ?auto_124989 ?auto_124990 ?auto_124991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124995 - BLOCK
      ?auto_124996 - BLOCK
      ?auto_124997 - BLOCK
      ?auto_124998 - BLOCK
      ?auto_124999 - BLOCK
      ?auto_125000 - BLOCK
    )
    :vars
    (
      ?auto_125002 - BLOCK
      ?auto_125003 - BLOCK
      ?auto_125001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124995 ) ( not ( = ?auto_124995 ?auto_124996 ) ) ( not ( = ?auto_124995 ?auto_124997 ) ) ( not ( = ?auto_124995 ?auto_124998 ) ) ( not ( = ?auto_124995 ?auto_124999 ) ) ( not ( = ?auto_124995 ?auto_125000 ) ) ( not ( = ?auto_124996 ?auto_124997 ) ) ( not ( = ?auto_124996 ?auto_124998 ) ) ( not ( = ?auto_124996 ?auto_124999 ) ) ( not ( = ?auto_124996 ?auto_125000 ) ) ( not ( = ?auto_124997 ?auto_124998 ) ) ( not ( = ?auto_124997 ?auto_124999 ) ) ( not ( = ?auto_124997 ?auto_125000 ) ) ( not ( = ?auto_124998 ?auto_124999 ) ) ( not ( = ?auto_124998 ?auto_125000 ) ) ( not ( = ?auto_124999 ?auto_125000 ) ) ( ON ?auto_125000 ?auto_125002 ) ( not ( = ?auto_124995 ?auto_125002 ) ) ( not ( = ?auto_124996 ?auto_125002 ) ) ( not ( = ?auto_124997 ?auto_125002 ) ) ( not ( = ?auto_124998 ?auto_125002 ) ) ( not ( = ?auto_124999 ?auto_125002 ) ) ( not ( = ?auto_125000 ?auto_125002 ) ) ( ON ?auto_124999 ?auto_125000 ) ( ON-TABLE ?auto_125003 ) ( ON ?auto_125001 ?auto_125003 ) ( ON ?auto_125002 ?auto_125001 ) ( not ( = ?auto_125003 ?auto_125001 ) ) ( not ( = ?auto_125003 ?auto_125002 ) ) ( not ( = ?auto_125003 ?auto_125000 ) ) ( not ( = ?auto_125003 ?auto_124999 ) ) ( not ( = ?auto_125001 ?auto_125002 ) ) ( not ( = ?auto_125001 ?auto_125000 ) ) ( not ( = ?auto_125001 ?auto_124999 ) ) ( not ( = ?auto_124995 ?auto_125003 ) ) ( not ( = ?auto_124995 ?auto_125001 ) ) ( not ( = ?auto_124996 ?auto_125003 ) ) ( not ( = ?auto_124996 ?auto_125001 ) ) ( not ( = ?auto_124997 ?auto_125003 ) ) ( not ( = ?auto_124997 ?auto_125001 ) ) ( not ( = ?auto_124998 ?auto_125003 ) ) ( not ( = ?auto_124998 ?auto_125001 ) ) ( ON ?auto_124998 ?auto_124999 ) ( ON ?auto_124997 ?auto_124998 ) ( CLEAR ?auto_124997 ) ( HOLDING ?auto_124996 ) ( CLEAR ?auto_124995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124995 ?auto_124996 )
      ( MAKE-6PILE ?auto_124995 ?auto_124996 ?auto_124997 ?auto_124998 ?auto_124999 ?auto_125000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125004 - BLOCK
      ?auto_125005 - BLOCK
      ?auto_125006 - BLOCK
      ?auto_125007 - BLOCK
      ?auto_125008 - BLOCK
      ?auto_125009 - BLOCK
    )
    :vars
    (
      ?auto_125011 - BLOCK
      ?auto_125010 - BLOCK
      ?auto_125012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125004 ) ( not ( = ?auto_125004 ?auto_125005 ) ) ( not ( = ?auto_125004 ?auto_125006 ) ) ( not ( = ?auto_125004 ?auto_125007 ) ) ( not ( = ?auto_125004 ?auto_125008 ) ) ( not ( = ?auto_125004 ?auto_125009 ) ) ( not ( = ?auto_125005 ?auto_125006 ) ) ( not ( = ?auto_125005 ?auto_125007 ) ) ( not ( = ?auto_125005 ?auto_125008 ) ) ( not ( = ?auto_125005 ?auto_125009 ) ) ( not ( = ?auto_125006 ?auto_125007 ) ) ( not ( = ?auto_125006 ?auto_125008 ) ) ( not ( = ?auto_125006 ?auto_125009 ) ) ( not ( = ?auto_125007 ?auto_125008 ) ) ( not ( = ?auto_125007 ?auto_125009 ) ) ( not ( = ?auto_125008 ?auto_125009 ) ) ( ON ?auto_125009 ?auto_125011 ) ( not ( = ?auto_125004 ?auto_125011 ) ) ( not ( = ?auto_125005 ?auto_125011 ) ) ( not ( = ?auto_125006 ?auto_125011 ) ) ( not ( = ?auto_125007 ?auto_125011 ) ) ( not ( = ?auto_125008 ?auto_125011 ) ) ( not ( = ?auto_125009 ?auto_125011 ) ) ( ON ?auto_125008 ?auto_125009 ) ( ON-TABLE ?auto_125010 ) ( ON ?auto_125012 ?auto_125010 ) ( ON ?auto_125011 ?auto_125012 ) ( not ( = ?auto_125010 ?auto_125012 ) ) ( not ( = ?auto_125010 ?auto_125011 ) ) ( not ( = ?auto_125010 ?auto_125009 ) ) ( not ( = ?auto_125010 ?auto_125008 ) ) ( not ( = ?auto_125012 ?auto_125011 ) ) ( not ( = ?auto_125012 ?auto_125009 ) ) ( not ( = ?auto_125012 ?auto_125008 ) ) ( not ( = ?auto_125004 ?auto_125010 ) ) ( not ( = ?auto_125004 ?auto_125012 ) ) ( not ( = ?auto_125005 ?auto_125010 ) ) ( not ( = ?auto_125005 ?auto_125012 ) ) ( not ( = ?auto_125006 ?auto_125010 ) ) ( not ( = ?auto_125006 ?auto_125012 ) ) ( not ( = ?auto_125007 ?auto_125010 ) ) ( not ( = ?auto_125007 ?auto_125012 ) ) ( ON ?auto_125007 ?auto_125008 ) ( ON ?auto_125006 ?auto_125007 ) ( CLEAR ?auto_125004 ) ( ON ?auto_125005 ?auto_125006 ) ( CLEAR ?auto_125005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125010 ?auto_125012 ?auto_125011 ?auto_125009 ?auto_125008 ?auto_125007 ?auto_125006 )
      ( MAKE-6PILE ?auto_125004 ?auto_125005 ?auto_125006 ?auto_125007 ?auto_125008 ?auto_125009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125013 - BLOCK
      ?auto_125014 - BLOCK
      ?auto_125015 - BLOCK
      ?auto_125016 - BLOCK
      ?auto_125017 - BLOCK
      ?auto_125018 - BLOCK
    )
    :vars
    (
      ?auto_125019 - BLOCK
      ?auto_125021 - BLOCK
      ?auto_125020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125013 ?auto_125014 ) ) ( not ( = ?auto_125013 ?auto_125015 ) ) ( not ( = ?auto_125013 ?auto_125016 ) ) ( not ( = ?auto_125013 ?auto_125017 ) ) ( not ( = ?auto_125013 ?auto_125018 ) ) ( not ( = ?auto_125014 ?auto_125015 ) ) ( not ( = ?auto_125014 ?auto_125016 ) ) ( not ( = ?auto_125014 ?auto_125017 ) ) ( not ( = ?auto_125014 ?auto_125018 ) ) ( not ( = ?auto_125015 ?auto_125016 ) ) ( not ( = ?auto_125015 ?auto_125017 ) ) ( not ( = ?auto_125015 ?auto_125018 ) ) ( not ( = ?auto_125016 ?auto_125017 ) ) ( not ( = ?auto_125016 ?auto_125018 ) ) ( not ( = ?auto_125017 ?auto_125018 ) ) ( ON ?auto_125018 ?auto_125019 ) ( not ( = ?auto_125013 ?auto_125019 ) ) ( not ( = ?auto_125014 ?auto_125019 ) ) ( not ( = ?auto_125015 ?auto_125019 ) ) ( not ( = ?auto_125016 ?auto_125019 ) ) ( not ( = ?auto_125017 ?auto_125019 ) ) ( not ( = ?auto_125018 ?auto_125019 ) ) ( ON ?auto_125017 ?auto_125018 ) ( ON-TABLE ?auto_125021 ) ( ON ?auto_125020 ?auto_125021 ) ( ON ?auto_125019 ?auto_125020 ) ( not ( = ?auto_125021 ?auto_125020 ) ) ( not ( = ?auto_125021 ?auto_125019 ) ) ( not ( = ?auto_125021 ?auto_125018 ) ) ( not ( = ?auto_125021 ?auto_125017 ) ) ( not ( = ?auto_125020 ?auto_125019 ) ) ( not ( = ?auto_125020 ?auto_125018 ) ) ( not ( = ?auto_125020 ?auto_125017 ) ) ( not ( = ?auto_125013 ?auto_125021 ) ) ( not ( = ?auto_125013 ?auto_125020 ) ) ( not ( = ?auto_125014 ?auto_125021 ) ) ( not ( = ?auto_125014 ?auto_125020 ) ) ( not ( = ?auto_125015 ?auto_125021 ) ) ( not ( = ?auto_125015 ?auto_125020 ) ) ( not ( = ?auto_125016 ?auto_125021 ) ) ( not ( = ?auto_125016 ?auto_125020 ) ) ( ON ?auto_125016 ?auto_125017 ) ( ON ?auto_125015 ?auto_125016 ) ( ON ?auto_125014 ?auto_125015 ) ( CLEAR ?auto_125014 ) ( HOLDING ?auto_125013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125013 )
      ( MAKE-6PILE ?auto_125013 ?auto_125014 ?auto_125015 ?auto_125016 ?auto_125017 ?auto_125018 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125022 - BLOCK
      ?auto_125023 - BLOCK
      ?auto_125024 - BLOCK
      ?auto_125025 - BLOCK
      ?auto_125026 - BLOCK
      ?auto_125027 - BLOCK
    )
    :vars
    (
      ?auto_125028 - BLOCK
      ?auto_125030 - BLOCK
      ?auto_125029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125022 ?auto_125023 ) ) ( not ( = ?auto_125022 ?auto_125024 ) ) ( not ( = ?auto_125022 ?auto_125025 ) ) ( not ( = ?auto_125022 ?auto_125026 ) ) ( not ( = ?auto_125022 ?auto_125027 ) ) ( not ( = ?auto_125023 ?auto_125024 ) ) ( not ( = ?auto_125023 ?auto_125025 ) ) ( not ( = ?auto_125023 ?auto_125026 ) ) ( not ( = ?auto_125023 ?auto_125027 ) ) ( not ( = ?auto_125024 ?auto_125025 ) ) ( not ( = ?auto_125024 ?auto_125026 ) ) ( not ( = ?auto_125024 ?auto_125027 ) ) ( not ( = ?auto_125025 ?auto_125026 ) ) ( not ( = ?auto_125025 ?auto_125027 ) ) ( not ( = ?auto_125026 ?auto_125027 ) ) ( ON ?auto_125027 ?auto_125028 ) ( not ( = ?auto_125022 ?auto_125028 ) ) ( not ( = ?auto_125023 ?auto_125028 ) ) ( not ( = ?auto_125024 ?auto_125028 ) ) ( not ( = ?auto_125025 ?auto_125028 ) ) ( not ( = ?auto_125026 ?auto_125028 ) ) ( not ( = ?auto_125027 ?auto_125028 ) ) ( ON ?auto_125026 ?auto_125027 ) ( ON-TABLE ?auto_125030 ) ( ON ?auto_125029 ?auto_125030 ) ( ON ?auto_125028 ?auto_125029 ) ( not ( = ?auto_125030 ?auto_125029 ) ) ( not ( = ?auto_125030 ?auto_125028 ) ) ( not ( = ?auto_125030 ?auto_125027 ) ) ( not ( = ?auto_125030 ?auto_125026 ) ) ( not ( = ?auto_125029 ?auto_125028 ) ) ( not ( = ?auto_125029 ?auto_125027 ) ) ( not ( = ?auto_125029 ?auto_125026 ) ) ( not ( = ?auto_125022 ?auto_125030 ) ) ( not ( = ?auto_125022 ?auto_125029 ) ) ( not ( = ?auto_125023 ?auto_125030 ) ) ( not ( = ?auto_125023 ?auto_125029 ) ) ( not ( = ?auto_125024 ?auto_125030 ) ) ( not ( = ?auto_125024 ?auto_125029 ) ) ( not ( = ?auto_125025 ?auto_125030 ) ) ( not ( = ?auto_125025 ?auto_125029 ) ) ( ON ?auto_125025 ?auto_125026 ) ( ON ?auto_125024 ?auto_125025 ) ( ON ?auto_125023 ?auto_125024 ) ( ON ?auto_125022 ?auto_125023 ) ( CLEAR ?auto_125022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125030 ?auto_125029 ?auto_125028 ?auto_125027 ?auto_125026 ?auto_125025 ?auto_125024 ?auto_125023 )
      ( MAKE-6PILE ?auto_125022 ?auto_125023 ?auto_125024 ?auto_125025 ?auto_125026 ?auto_125027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125033 - BLOCK
      ?auto_125034 - BLOCK
    )
    :vars
    (
      ?auto_125035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125035 ?auto_125034 ) ( CLEAR ?auto_125035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125033 ) ( ON ?auto_125034 ?auto_125033 ) ( not ( = ?auto_125033 ?auto_125034 ) ) ( not ( = ?auto_125033 ?auto_125035 ) ) ( not ( = ?auto_125034 ?auto_125035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125035 ?auto_125034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125036 - BLOCK
      ?auto_125037 - BLOCK
    )
    :vars
    (
      ?auto_125038 - BLOCK
      ?auto_125039 - BLOCK
      ?auto_125040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125038 ?auto_125037 ) ( CLEAR ?auto_125038 ) ( ON-TABLE ?auto_125036 ) ( ON ?auto_125037 ?auto_125036 ) ( not ( = ?auto_125036 ?auto_125037 ) ) ( not ( = ?auto_125036 ?auto_125038 ) ) ( not ( = ?auto_125037 ?auto_125038 ) ) ( HOLDING ?auto_125039 ) ( CLEAR ?auto_125040 ) ( not ( = ?auto_125036 ?auto_125039 ) ) ( not ( = ?auto_125036 ?auto_125040 ) ) ( not ( = ?auto_125037 ?auto_125039 ) ) ( not ( = ?auto_125037 ?auto_125040 ) ) ( not ( = ?auto_125038 ?auto_125039 ) ) ( not ( = ?auto_125038 ?auto_125040 ) ) ( not ( = ?auto_125039 ?auto_125040 ) ) )
    :subtasks
    ( ( !STACK ?auto_125039 ?auto_125040 )
      ( MAKE-2PILE ?auto_125036 ?auto_125037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125041 - BLOCK
      ?auto_125042 - BLOCK
    )
    :vars
    (
      ?auto_125045 - BLOCK
      ?auto_125044 - BLOCK
      ?auto_125043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125045 ?auto_125042 ) ( ON-TABLE ?auto_125041 ) ( ON ?auto_125042 ?auto_125041 ) ( not ( = ?auto_125041 ?auto_125042 ) ) ( not ( = ?auto_125041 ?auto_125045 ) ) ( not ( = ?auto_125042 ?auto_125045 ) ) ( CLEAR ?auto_125044 ) ( not ( = ?auto_125041 ?auto_125043 ) ) ( not ( = ?auto_125041 ?auto_125044 ) ) ( not ( = ?auto_125042 ?auto_125043 ) ) ( not ( = ?auto_125042 ?auto_125044 ) ) ( not ( = ?auto_125045 ?auto_125043 ) ) ( not ( = ?auto_125045 ?auto_125044 ) ) ( not ( = ?auto_125043 ?auto_125044 ) ) ( ON ?auto_125043 ?auto_125045 ) ( CLEAR ?auto_125043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125041 ?auto_125042 ?auto_125045 )
      ( MAKE-2PILE ?auto_125041 ?auto_125042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125046 - BLOCK
      ?auto_125047 - BLOCK
    )
    :vars
    (
      ?auto_125050 - BLOCK
      ?auto_125048 - BLOCK
      ?auto_125049 - BLOCK
      ?auto_125052 - BLOCK
      ?auto_125051 - BLOCK
      ?auto_125053 - BLOCK
      ?auto_125054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125050 ?auto_125047 ) ( ON-TABLE ?auto_125046 ) ( ON ?auto_125047 ?auto_125046 ) ( not ( = ?auto_125046 ?auto_125047 ) ) ( not ( = ?auto_125046 ?auto_125050 ) ) ( not ( = ?auto_125047 ?auto_125050 ) ) ( not ( = ?auto_125046 ?auto_125048 ) ) ( not ( = ?auto_125046 ?auto_125049 ) ) ( not ( = ?auto_125047 ?auto_125048 ) ) ( not ( = ?auto_125047 ?auto_125049 ) ) ( not ( = ?auto_125050 ?auto_125048 ) ) ( not ( = ?auto_125050 ?auto_125049 ) ) ( not ( = ?auto_125048 ?auto_125049 ) ) ( ON ?auto_125048 ?auto_125050 ) ( CLEAR ?auto_125048 ) ( HOLDING ?auto_125049 ) ( CLEAR ?auto_125052 ) ( ON-TABLE ?auto_125051 ) ( ON ?auto_125053 ?auto_125051 ) ( ON ?auto_125054 ?auto_125053 ) ( ON ?auto_125052 ?auto_125054 ) ( not ( = ?auto_125051 ?auto_125053 ) ) ( not ( = ?auto_125051 ?auto_125054 ) ) ( not ( = ?auto_125051 ?auto_125052 ) ) ( not ( = ?auto_125051 ?auto_125049 ) ) ( not ( = ?auto_125053 ?auto_125054 ) ) ( not ( = ?auto_125053 ?auto_125052 ) ) ( not ( = ?auto_125053 ?auto_125049 ) ) ( not ( = ?auto_125054 ?auto_125052 ) ) ( not ( = ?auto_125054 ?auto_125049 ) ) ( not ( = ?auto_125052 ?auto_125049 ) ) ( not ( = ?auto_125046 ?auto_125052 ) ) ( not ( = ?auto_125046 ?auto_125051 ) ) ( not ( = ?auto_125046 ?auto_125053 ) ) ( not ( = ?auto_125046 ?auto_125054 ) ) ( not ( = ?auto_125047 ?auto_125052 ) ) ( not ( = ?auto_125047 ?auto_125051 ) ) ( not ( = ?auto_125047 ?auto_125053 ) ) ( not ( = ?auto_125047 ?auto_125054 ) ) ( not ( = ?auto_125050 ?auto_125052 ) ) ( not ( = ?auto_125050 ?auto_125051 ) ) ( not ( = ?auto_125050 ?auto_125053 ) ) ( not ( = ?auto_125050 ?auto_125054 ) ) ( not ( = ?auto_125048 ?auto_125052 ) ) ( not ( = ?auto_125048 ?auto_125051 ) ) ( not ( = ?auto_125048 ?auto_125053 ) ) ( not ( = ?auto_125048 ?auto_125054 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125051 ?auto_125053 ?auto_125054 ?auto_125052 ?auto_125049 )
      ( MAKE-2PILE ?auto_125046 ?auto_125047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125055 - BLOCK
      ?auto_125056 - BLOCK
    )
    :vars
    (
      ?auto_125063 - BLOCK
      ?auto_125059 - BLOCK
      ?auto_125058 - BLOCK
      ?auto_125061 - BLOCK
      ?auto_125057 - BLOCK
      ?auto_125062 - BLOCK
      ?auto_125060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125063 ?auto_125056 ) ( ON-TABLE ?auto_125055 ) ( ON ?auto_125056 ?auto_125055 ) ( not ( = ?auto_125055 ?auto_125056 ) ) ( not ( = ?auto_125055 ?auto_125063 ) ) ( not ( = ?auto_125056 ?auto_125063 ) ) ( not ( = ?auto_125055 ?auto_125059 ) ) ( not ( = ?auto_125055 ?auto_125058 ) ) ( not ( = ?auto_125056 ?auto_125059 ) ) ( not ( = ?auto_125056 ?auto_125058 ) ) ( not ( = ?auto_125063 ?auto_125059 ) ) ( not ( = ?auto_125063 ?auto_125058 ) ) ( not ( = ?auto_125059 ?auto_125058 ) ) ( ON ?auto_125059 ?auto_125063 ) ( CLEAR ?auto_125061 ) ( ON-TABLE ?auto_125057 ) ( ON ?auto_125062 ?auto_125057 ) ( ON ?auto_125060 ?auto_125062 ) ( ON ?auto_125061 ?auto_125060 ) ( not ( = ?auto_125057 ?auto_125062 ) ) ( not ( = ?auto_125057 ?auto_125060 ) ) ( not ( = ?auto_125057 ?auto_125061 ) ) ( not ( = ?auto_125057 ?auto_125058 ) ) ( not ( = ?auto_125062 ?auto_125060 ) ) ( not ( = ?auto_125062 ?auto_125061 ) ) ( not ( = ?auto_125062 ?auto_125058 ) ) ( not ( = ?auto_125060 ?auto_125061 ) ) ( not ( = ?auto_125060 ?auto_125058 ) ) ( not ( = ?auto_125061 ?auto_125058 ) ) ( not ( = ?auto_125055 ?auto_125061 ) ) ( not ( = ?auto_125055 ?auto_125057 ) ) ( not ( = ?auto_125055 ?auto_125062 ) ) ( not ( = ?auto_125055 ?auto_125060 ) ) ( not ( = ?auto_125056 ?auto_125061 ) ) ( not ( = ?auto_125056 ?auto_125057 ) ) ( not ( = ?auto_125056 ?auto_125062 ) ) ( not ( = ?auto_125056 ?auto_125060 ) ) ( not ( = ?auto_125063 ?auto_125061 ) ) ( not ( = ?auto_125063 ?auto_125057 ) ) ( not ( = ?auto_125063 ?auto_125062 ) ) ( not ( = ?auto_125063 ?auto_125060 ) ) ( not ( = ?auto_125059 ?auto_125061 ) ) ( not ( = ?auto_125059 ?auto_125057 ) ) ( not ( = ?auto_125059 ?auto_125062 ) ) ( not ( = ?auto_125059 ?auto_125060 ) ) ( ON ?auto_125058 ?auto_125059 ) ( CLEAR ?auto_125058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125055 ?auto_125056 ?auto_125063 ?auto_125059 )
      ( MAKE-2PILE ?auto_125055 ?auto_125056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125064 - BLOCK
      ?auto_125065 - BLOCK
    )
    :vars
    (
      ?auto_125070 - BLOCK
      ?auto_125068 - BLOCK
      ?auto_125069 - BLOCK
      ?auto_125072 - BLOCK
      ?auto_125071 - BLOCK
      ?auto_125067 - BLOCK
      ?auto_125066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125070 ?auto_125065 ) ( ON-TABLE ?auto_125064 ) ( ON ?auto_125065 ?auto_125064 ) ( not ( = ?auto_125064 ?auto_125065 ) ) ( not ( = ?auto_125064 ?auto_125070 ) ) ( not ( = ?auto_125065 ?auto_125070 ) ) ( not ( = ?auto_125064 ?auto_125068 ) ) ( not ( = ?auto_125064 ?auto_125069 ) ) ( not ( = ?auto_125065 ?auto_125068 ) ) ( not ( = ?auto_125065 ?auto_125069 ) ) ( not ( = ?auto_125070 ?auto_125068 ) ) ( not ( = ?auto_125070 ?auto_125069 ) ) ( not ( = ?auto_125068 ?auto_125069 ) ) ( ON ?auto_125068 ?auto_125070 ) ( ON-TABLE ?auto_125072 ) ( ON ?auto_125071 ?auto_125072 ) ( ON ?auto_125067 ?auto_125071 ) ( not ( = ?auto_125072 ?auto_125071 ) ) ( not ( = ?auto_125072 ?auto_125067 ) ) ( not ( = ?auto_125072 ?auto_125066 ) ) ( not ( = ?auto_125072 ?auto_125069 ) ) ( not ( = ?auto_125071 ?auto_125067 ) ) ( not ( = ?auto_125071 ?auto_125066 ) ) ( not ( = ?auto_125071 ?auto_125069 ) ) ( not ( = ?auto_125067 ?auto_125066 ) ) ( not ( = ?auto_125067 ?auto_125069 ) ) ( not ( = ?auto_125066 ?auto_125069 ) ) ( not ( = ?auto_125064 ?auto_125066 ) ) ( not ( = ?auto_125064 ?auto_125072 ) ) ( not ( = ?auto_125064 ?auto_125071 ) ) ( not ( = ?auto_125064 ?auto_125067 ) ) ( not ( = ?auto_125065 ?auto_125066 ) ) ( not ( = ?auto_125065 ?auto_125072 ) ) ( not ( = ?auto_125065 ?auto_125071 ) ) ( not ( = ?auto_125065 ?auto_125067 ) ) ( not ( = ?auto_125070 ?auto_125066 ) ) ( not ( = ?auto_125070 ?auto_125072 ) ) ( not ( = ?auto_125070 ?auto_125071 ) ) ( not ( = ?auto_125070 ?auto_125067 ) ) ( not ( = ?auto_125068 ?auto_125066 ) ) ( not ( = ?auto_125068 ?auto_125072 ) ) ( not ( = ?auto_125068 ?auto_125071 ) ) ( not ( = ?auto_125068 ?auto_125067 ) ) ( ON ?auto_125069 ?auto_125068 ) ( CLEAR ?auto_125069 ) ( HOLDING ?auto_125066 ) ( CLEAR ?auto_125067 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125072 ?auto_125071 ?auto_125067 ?auto_125066 )
      ( MAKE-2PILE ?auto_125064 ?auto_125065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125073 - BLOCK
      ?auto_125074 - BLOCK
    )
    :vars
    (
      ?auto_125075 - BLOCK
      ?auto_125081 - BLOCK
      ?auto_125078 - BLOCK
      ?auto_125076 - BLOCK
      ?auto_125079 - BLOCK
      ?auto_125077 - BLOCK
      ?auto_125080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125075 ?auto_125074 ) ( ON-TABLE ?auto_125073 ) ( ON ?auto_125074 ?auto_125073 ) ( not ( = ?auto_125073 ?auto_125074 ) ) ( not ( = ?auto_125073 ?auto_125075 ) ) ( not ( = ?auto_125074 ?auto_125075 ) ) ( not ( = ?auto_125073 ?auto_125081 ) ) ( not ( = ?auto_125073 ?auto_125078 ) ) ( not ( = ?auto_125074 ?auto_125081 ) ) ( not ( = ?auto_125074 ?auto_125078 ) ) ( not ( = ?auto_125075 ?auto_125081 ) ) ( not ( = ?auto_125075 ?auto_125078 ) ) ( not ( = ?auto_125081 ?auto_125078 ) ) ( ON ?auto_125081 ?auto_125075 ) ( ON-TABLE ?auto_125076 ) ( ON ?auto_125079 ?auto_125076 ) ( ON ?auto_125077 ?auto_125079 ) ( not ( = ?auto_125076 ?auto_125079 ) ) ( not ( = ?auto_125076 ?auto_125077 ) ) ( not ( = ?auto_125076 ?auto_125080 ) ) ( not ( = ?auto_125076 ?auto_125078 ) ) ( not ( = ?auto_125079 ?auto_125077 ) ) ( not ( = ?auto_125079 ?auto_125080 ) ) ( not ( = ?auto_125079 ?auto_125078 ) ) ( not ( = ?auto_125077 ?auto_125080 ) ) ( not ( = ?auto_125077 ?auto_125078 ) ) ( not ( = ?auto_125080 ?auto_125078 ) ) ( not ( = ?auto_125073 ?auto_125080 ) ) ( not ( = ?auto_125073 ?auto_125076 ) ) ( not ( = ?auto_125073 ?auto_125079 ) ) ( not ( = ?auto_125073 ?auto_125077 ) ) ( not ( = ?auto_125074 ?auto_125080 ) ) ( not ( = ?auto_125074 ?auto_125076 ) ) ( not ( = ?auto_125074 ?auto_125079 ) ) ( not ( = ?auto_125074 ?auto_125077 ) ) ( not ( = ?auto_125075 ?auto_125080 ) ) ( not ( = ?auto_125075 ?auto_125076 ) ) ( not ( = ?auto_125075 ?auto_125079 ) ) ( not ( = ?auto_125075 ?auto_125077 ) ) ( not ( = ?auto_125081 ?auto_125080 ) ) ( not ( = ?auto_125081 ?auto_125076 ) ) ( not ( = ?auto_125081 ?auto_125079 ) ) ( not ( = ?auto_125081 ?auto_125077 ) ) ( ON ?auto_125078 ?auto_125081 ) ( CLEAR ?auto_125077 ) ( ON ?auto_125080 ?auto_125078 ) ( CLEAR ?auto_125080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125073 ?auto_125074 ?auto_125075 ?auto_125081 ?auto_125078 )
      ( MAKE-2PILE ?auto_125073 ?auto_125074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125082 - BLOCK
      ?auto_125083 - BLOCK
    )
    :vars
    (
      ?auto_125090 - BLOCK
      ?auto_125089 - BLOCK
      ?auto_125085 - BLOCK
      ?auto_125088 - BLOCK
      ?auto_125086 - BLOCK
      ?auto_125084 - BLOCK
      ?auto_125087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125090 ?auto_125083 ) ( ON-TABLE ?auto_125082 ) ( ON ?auto_125083 ?auto_125082 ) ( not ( = ?auto_125082 ?auto_125083 ) ) ( not ( = ?auto_125082 ?auto_125090 ) ) ( not ( = ?auto_125083 ?auto_125090 ) ) ( not ( = ?auto_125082 ?auto_125089 ) ) ( not ( = ?auto_125082 ?auto_125085 ) ) ( not ( = ?auto_125083 ?auto_125089 ) ) ( not ( = ?auto_125083 ?auto_125085 ) ) ( not ( = ?auto_125090 ?auto_125089 ) ) ( not ( = ?auto_125090 ?auto_125085 ) ) ( not ( = ?auto_125089 ?auto_125085 ) ) ( ON ?auto_125089 ?auto_125090 ) ( ON-TABLE ?auto_125088 ) ( ON ?auto_125086 ?auto_125088 ) ( not ( = ?auto_125088 ?auto_125086 ) ) ( not ( = ?auto_125088 ?auto_125084 ) ) ( not ( = ?auto_125088 ?auto_125087 ) ) ( not ( = ?auto_125088 ?auto_125085 ) ) ( not ( = ?auto_125086 ?auto_125084 ) ) ( not ( = ?auto_125086 ?auto_125087 ) ) ( not ( = ?auto_125086 ?auto_125085 ) ) ( not ( = ?auto_125084 ?auto_125087 ) ) ( not ( = ?auto_125084 ?auto_125085 ) ) ( not ( = ?auto_125087 ?auto_125085 ) ) ( not ( = ?auto_125082 ?auto_125087 ) ) ( not ( = ?auto_125082 ?auto_125088 ) ) ( not ( = ?auto_125082 ?auto_125086 ) ) ( not ( = ?auto_125082 ?auto_125084 ) ) ( not ( = ?auto_125083 ?auto_125087 ) ) ( not ( = ?auto_125083 ?auto_125088 ) ) ( not ( = ?auto_125083 ?auto_125086 ) ) ( not ( = ?auto_125083 ?auto_125084 ) ) ( not ( = ?auto_125090 ?auto_125087 ) ) ( not ( = ?auto_125090 ?auto_125088 ) ) ( not ( = ?auto_125090 ?auto_125086 ) ) ( not ( = ?auto_125090 ?auto_125084 ) ) ( not ( = ?auto_125089 ?auto_125087 ) ) ( not ( = ?auto_125089 ?auto_125088 ) ) ( not ( = ?auto_125089 ?auto_125086 ) ) ( not ( = ?auto_125089 ?auto_125084 ) ) ( ON ?auto_125085 ?auto_125089 ) ( ON ?auto_125087 ?auto_125085 ) ( CLEAR ?auto_125087 ) ( HOLDING ?auto_125084 ) ( CLEAR ?auto_125086 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125088 ?auto_125086 ?auto_125084 )
      ( MAKE-2PILE ?auto_125082 ?auto_125083 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125091 - BLOCK
      ?auto_125092 - BLOCK
    )
    :vars
    (
      ?auto_125098 - BLOCK
      ?auto_125097 - BLOCK
      ?auto_125096 - BLOCK
      ?auto_125095 - BLOCK
      ?auto_125093 - BLOCK
      ?auto_125094 - BLOCK
      ?auto_125099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125098 ?auto_125092 ) ( ON-TABLE ?auto_125091 ) ( ON ?auto_125092 ?auto_125091 ) ( not ( = ?auto_125091 ?auto_125092 ) ) ( not ( = ?auto_125091 ?auto_125098 ) ) ( not ( = ?auto_125092 ?auto_125098 ) ) ( not ( = ?auto_125091 ?auto_125097 ) ) ( not ( = ?auto_125091 ?auto_125096 ) ) ( not ( = ?auto_125092 ?auto_125097 ) ) ( not ( = ?auto_125092 ?auto_125096 ) ) ( not ( = ?auto_125098 ?auto_125097 ) ) ( not ( = ?auto_125098 ?auto_125096 ) ) ( not ( = ?auto_125097 ?auto_125096 ) ) ( ON ?auto_125097 ?auto_125098 ) ( ON-TABLE ?auto_125095 ) ( ON ?auto_125093 ?auto_125095 ) ( not ( = ?auto_125095 ?auto_125093 ) ) ( not ( = ?auto_125095 ?auto_125094 ) ) ( not ( = ?auto_125095 ?auto_125099 ) ) ( not ( = ?auto_125095 ?auto_125096 ) ) ( not ( = ?auto_125093 ?auto_125094 ) ) ( not ( = ?auto_125093 ?auto_125099 ) ) ( not ( = ?auto_125093 ?auto_125096 ) ) ( not ( = ?auto_125094 ?auto_125099 ) ) ( not ( = ?auto_125094 ?auto_125096 ) ) ( not ( = ?auto_125099 ?auto_125096 ) ) ( not ( = ?auto_125091 ?auto_125099 ) ) ( not ( = ?auto_125091 ?auto_125095 ) ) ( not ( = ?auto_125091 ?auto_125093 ) ) ( not ( = ?auto_125091 ?auto_125094 ) ) ( not ( = ?auto_125092 ?auto_125099 ) ) ( not ( = ?auto_125092 ?auto_125095 ) ) ( not ( = ?auto_125092 ?auto_125093 ) ) ( not ( = ?auto_125092 ?auto_125094 ) ) ( not ( = ?auto_125098 ?auto_125099 ) ) ( not ( = ?auto_125098 ?auto_125095 ) ) ( not ( = ?auto_125098 ?auto_125093 ) ) ( not ( = ?auto_125098 ?auto_125094 ) ) ( not ( = ?auto_125097 ?auto_125099 ) ) ( not ( = ?auto_125097 ?auto_125095 ) ) ( not ( = ?auto_125097 ?auto_125093 ) ) ( not ( = ?auto_125097 ?auto_125094 ) ) ( ON ?auto_125096 ?auto_125097 ) ( ON ?auto_125099 ?auto_125096 ) ( CLEAR ?auto_125093 ) ( ON ?auto_125094 ?auto_125099 ) ( CLEAR ?auto_125094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125091 ?auto_125092 ?auto_125098 ?auto_125097 ?auto_125096 ?auto_125099 )
      ( MAKE-2PILE ?auto_125091 ?auto_125092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125100 - BLOCK
      ?auto_125101 - BLOCK
    )
    :vars
    (
      ?auto_125105 - BLOCK
      ?auto_125102 - BLOCK
      ?auto_125106 - BLOCK
      ?auto_125108 - BLOCK
      ?auto_125104 - BLOCK
      ?auto_125107 - BLOCK
      ?auto_125103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125105 ?auto_125101 ) ( ON-TABLE ?auto_125100 ) ( ON ?auto_125101 ?auto_125100 ) ( not ( = ?auto_125100 ?auto_125101 ) ) ( not ( = ?auto_125100 ?auto_125105 ) ) ( not ( = ?auto_125101 ?auto_125105 ) ) ( not ( = ?auto_125100 ?auto_125102 ) ) ( not ( = ?auto_125100 ?auto_125106 ) ) ( not ( = ?auto_125101 ?auto_125102 ) ) ( not ( = ?auto_125101 ?auto_125106 ) ) ( not ( = ?auto_125105 ?auto_125102 ) ) ( not ( = ?auto_125105 ?auto_125106 ) ) ( not ( = ?auto_125102 ?auto_125106 ) ) ( ON ?auto_125102 ?auto_125105 ) ( ON-TABLE ?auto_125108 ) ( not ( = ?auto_125108 ?auto_125104 ) ) ( not ( = ?auto_125108 ?auto_125107 ) ) ( not ( = ?auto_125108 ?auto_125103 ) ) ( not ( = ?auto_125108 ?auto_125106 ) ) ( not ( = ?auto_125104 ?auto_125107 ) ) ( not ( = ?auto_125104 ?auto_125103 ) ) ( not ( = ?auto_125104 ?auto_125106 ) ) ( not ( = ?auto_125107 ?auto_125103 ) ) ( not ( = ?auto_125107 ?auto_125106 ) ) ( not ( = ?auto_125103 ?auto_125106 ) ) ( not ( = ?auto_125100 ?auto_125103 ) ) ( not ( = ?auto_125100 ?auto_125108 ) ) ( not ( = ?auto_125100 ?auto_125104 ) ) ( not ( = ?auto_125100 ?auto_125107 ) ) ( not ( = ?auto_125101 ?auto_125103 ) ) ( not ( = ?auto_125101 ?auto_125108 ) ) ( not ( = ?auto_125101 ?auto_125104 ) ) ( not ( = ?auto_125101 ?auto_125107 ) ) ( not ( = ?auto_125105 ?auto_125103 ) ) ( not ( = ?auto_125105 ?auto_125108 ) ) ( not ( = ?auto_125105 ?auto_125104 ) ) ( not ( = ?auto_125105 ?auto_125107 ) ) ( not ( = ?auto_125102 ?auto_125103 ) ) ( not ( = ?auto_125102 ?auto_125108 ) ) ( not ( = ?auto_125102 ?auto_125104 ) ) ( not ( = ?auto_125102 ?auto_125107 ) ) ( ON ?auto_125106 ?auto_125102 ) ( ON ?auto_125103 ?auto_125106 ) ( ON ?auto_125107 ?auto_125103 ) ( CLEAR ?auto_125107 ) ( HOLDING ?auto_125104 ) ( CLEAR ?auto_125108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125108 ?auto_125104 )
      ( MAKE-2PILE ?auto_125100 ?auto_125101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127127 - BLOCK
      ?auto_127128 - BLOCK
    )
    :vars
    (
      ?auto_127131 - BLOCK
      ?auto_127134 - BLOCK
      ?auto_127133 - BLOCK
      ?auto_127130 - BLOCK
      ?auto_127129 - BLOCK
      ?auto_127132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127131 ?auto_127128 ) ( ON-TABLE ?auto_127127 ) ( ON ?auto_127128 ?auto_127127 ) ( not ( = ?auto_127127 ?auto_127128 ) ) ( not ( = ?auto_127127 ?auto_127131 ) ) ( not ( = ?auto_127128 ?auto_127131 ) ) ( not ( = ?auto_127127 ?auto_127134 ) ) ( not ( = ?auto_127127 ?auto_127133 ) ) ( not ( = ?auto_127128 ?auto_127134 ) ) ( not ( = ?auto_127128 ?auto_127133 ) ) ( not ( = ?auto_127131 ?auto_127134 ) ) ( not ( = ?auto_127131 ?auto_127133 ) ) ( not ( = ?auto_127134 ?auto_127133 ) ) ( ON ?auto_127134 ?auto_127131 ) ( not ( = ?auto_127130 ?auto_127129 ) ) ( not ( = ?auto_127130 ?auto_127132 ) ) ( not ( = ?auto_127130 ?auto_127133 ) ) ( not ( = ?auto_127129 ?auto_127132 ) ) ( not ( = ?auto_127129 ?auto_127133 ) ) ( not ( = ?auto_127132 ?auto_127133 ) ) ( not ( = ?auto_127127 ?auto_127132 ) ) ( not ( = ?auto_127127 ?auto_127130 ) ) ( not ( = ?auto_127127 ?auto_127129 ) ) ( not ( = ?auto_127128 ?auto_127132 ) ) ( not ( = ?auto_127128 ?auto_127130 ) ) ( not ( = ?auto_127128 ?auto_127129 ) ) ( not ( = ?auto_127131 ?auto_127132 ) ) ( not ( = ?auto_127131 ?auto_127130 ) ) ( not ( = ?auto_127131 ?auto_127129 ) ) ( not ( = ?auto_127134 ?auto_127132 ) ) ( not ( = ?auto_127134 ?auto_127130 ) ) ( not ( = ?auto_127134 ?auto_127129 ) ) ( ON ?auto_127133 ?auto_127134 ) ( ON ?auto_127132 ?auto_127133 ) ( ON ?auto_127129 ?auto_127132 ) ( ON ?auto_127130 ?auto_127129 ) ( CLEAR ?auto_127130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127127 ?auto_127128 ?auto_127131 ?auto_127134 ?auto_127133 ?auto_127132 ?auto_127129 )
      ( MAKE-2PILE ?auto_127127 ?auto_127128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125118 - BLOCK
      ?auto_125119 - BLOCK
    )
    :vars
    (
      ?auto_125124 - BLOCK
      ?auto_125121 - BLOCK
      ?auto_125126 - BLOCK
      ?auto_125120 - BLOCK
      ?auto_125125 - BLOCK
      ?auto_125122 - BLOCK
      ?auto_125123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125124 ?auto_125119 ) ( ON-TABLE ?auto_125118 ) ( ON ?auto_125119 ?auto_125118 ) ( not ( = ?auto_125118 ?auto_125119 ) ) ( not ( = ?auto_125118 ?auto_125124 ) ) ( not ( = ?auto_125119 ?auto_125124 ) ) ( not ( = ?auto_125118 ?auto_125121 ) ) ( not ( = ?auto_125118 ?auto_125126 ) ) ( not ( = ?auto_125119 ?auto_125121 ) ) ( not ( = ?auto_125119 ?auto_125126 ) ) ( not ( = ?auto_125124 ?auto_125121 ) ) ( not ( = ?auto_125124 ?auto_125126 ) ) ( not ( = ?auto_125121 ?auto_125126 ) ) ( ON ?auto_125121 ?auto_125124 ) ( not ( = ?auto_125120 ?auto_125125 ) ) ( not ( = ?auto_125120 ?auto_125122 ) ) ( not ( = ?auto_125120 ?auto_125123 ) ) ( not ( = ?auto_125120 ?auto_125126 ) ) ( not ( = ?auto_125125 ?auto_125122 ) ) ( not ( = ?auto_125125 ?auto_125123 ) ) ( not ( = ?auto_125125 ?auto_125126 ) ) ( not ( = ?auto_125122 ?auto_125123 ) ) ( not ( = ?auto_125122 ?auto_125126 ) ) ( not ( = ?auto_125123 ?auto_125126 ) ) ( not ( = ?auto_125118 ?auto_125123 ) ) ( not ( = ?auto_125118 ?auto_125120 ) ) ( not ( = ?auto_125118 ?auto_125125 ) ) ( not ( = ?auto_125118 ?auto_125122 ) ) ( not ( = ?auto_125119 ?auto_125123 ) ) ( not ( = ?auto_125119 ?auto_125120 ) ) ( not ( = ?auto_125119 ?auto_125125 ) ) ( not ( = ?auto_125119 ?auto_125122 ) ) ( not ( = ?auto_125124 ?auto_125123 ) ) ( not ( = ?auto_125124 ?auto_125120 ) ) ( not ( = ?auto_125124 ?auto_125125 ) ) ( not ( = ?auto_125124 ?auto_125122 ) ) ( not ( = ?auto_125121 ?auto_125123 ) ) ( not ( = ?auto_125121 ?auto_125120 ) ) ( not ( = ?auto_125121 ?auto_125125 ) ) ( not ( = ?auto_125121 ?auto_125122 ) ) ( ON ?auto_125126 ?auto_125121 ) ( ON ?auto_125123 ?auto_125126 ) ( ON ?auto_125122 ?auto_125123 ) ( ON ?auto_125125 ?auto_125122 ) ( CLEAR ?auto_125125 ) ( HOLDING ?auto_125120 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125120 )
      ( MAKE-2PILE ?auto_125118 ?auto_125119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125127 - BLOCK
      ?auto_125128 - BLOCK
    )
    :vars
    (
      ?auto_125130 - BLOCK
      ?auto_125132 - BLOCK
      ?auto_125131 - BLOCK
      ?auto_125133 - BLOCK
      ?auto_125129 - BLOCK
      ?auto_125134 - BLOCK
      ?auto_125135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125130 ?auto_125128 ) ( ON-TABLE ?auto_125127 ) ( ON ?auto_125128 ?auto_125127 ) ( not ( = ?auto_125127 ?auto_125128 ) ) ( not ( = ?auto_125127 ?auto_125130 ) ) ( not ( = ?auto_125128 ?auto_125130 ) ) ( not ( = ?auto_125127 ?auto_125132 ) ) ( not ( = ?auto_125127 ?auto_125131 ) ) ( not ( = ?auto_125128 ?auto_125132 ) ) ( not ( = ?auto_125128 ?auto_125131 ) ) ( not ( = ?auto_125130 ?auto_125132 ) ) ( not ( = ?auto_125130 ?auto_125131 ) ) ( not ( = ?auto_125132 ?auto_125131 ) ) ( ON ?auto_125132 ?auto_125130 ) ( not ( = ?auto_125133 ?auto_125129 ) ) ( not ( = ?auto_125133 ?auto_125134 ) ) ( not ( = ?auto_125133 ?auto_125135 ) ) ( not ( = ?auto_125133 ?auto_125131 ) ) ( not ( = ?auto_125129 ?auto_125134 ) ) ( not ( = ?auto_125129 ?auto_125135 ) ) ( not ( = ?auto_125129 ?auto_125131 ) ) ( not ( = ?auto_125134 ?auto_125135 ) ) ( not ( = ?auto_125134 ?auto_125131 ) ) ( not ( = ?auto_125135 ?auto_125131 ) ) ( not ( = ?auto_125127 ?auto_125135 ) ) ( not ( = ?auto_125127 ?auto_125133 ) ) ( not ( = ?auto_125127 ?auto_125129 ) ) ( not ( = ?auto_125127 ?auto_125134 ) ) ( not ( = ?auto_125128 ?auto_125135 ) ) ( not ( = ?auto_125128 ?auto_125133 ) ) ( not ( = ?auto_125128 ?auto_125129 ) ) ( not ( = ?auto_125128 ?auto_125134 ) ) ( not ( = ?auto_125130 ?auto_125135 ) ) ( not ( = ?auto_125130 ?auto_125133 ) ) ( not ( = ?auto_125130 ?auto_125129 ) ) ( not ( = ?auto_125130 ?auto_125134 ) ) ( not ( = ?auto_125132 ?auto_125135 ) ) ( not ( = ?auto_125132 ?auto_125133 ) ) ( not ( = ?auto_125132 ?auto_125129 ) ) ( not ( = ?auto_125132 ?auto_125134 ) ) ( ON ?auto_125131 ?auto_125132 ) ( ON ?auto_125135 ?auto_125131 ) ( ON ?auto_125134 ?auto_125135 ) ( ON ?auto_125129 ?auto_125134 ) ( ON ?auto_125133 ?auto_125129 ) ( CLEAR ?auto_125133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125127 ?auto_125128 ?auto_125130 ?auto_125132 ?auto_125131 ?auto_125135 ?auto_125134 ?auto_125129 )
      ( MAKE-2PILE ?auto_125127 ?auto_125128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125143 - BLOCK
      ?auto_125144 - BLOCK
      ?auto_125145 - BLOCK
      ?auto_125146 - BLOCK
      ?auto_125147 - BLOCK
      ?auto_125148 - BLOCK
      ?auto_125149 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_125149 ) ( CLEAR ?auto_125148 ) ( ON-TABLE ?auto_125143 ) ( ON ?auto_125144 ?auto_125143 ) ( ON ?auto_125145 ?auto_125144 ) ( ON ?auto_125146 ?auto_125145 ) ( ON ?auto_125147 ?auto_125146 ) ( ON ?auto_125148 ?auto_125147 ) ( not ( = ?auto_125143 ?auto_125144 ) ) ( not ( = ?auto_125143 ?auto_125145 ) ) ( not ( = ?auto_125143 ?auto_125146 ) ) ( not ( = ?auto_125143 ?auto_125147 ) ) ( not ( = ?auto_125143 ?auto_125148 ) ) ( not ( = ?auto_125143 ?auto_125149 ) ) ( not ( = ?auto_125144 ?auto_125145 ) ) ( not ( = ?auto_125144 ?auto_125146 ) ) ( not ( = ?auto_125144 ?auto_125147 ) ) ( not ( = ?auto_125144 ?auto_125148 ) ) ( not ( = ?auto_125144 ?auto_125149 ) ) ( not ( = ?auto_125145 ?auto_125146 ) ) ( not ( = ?auto_125145 ?auto_125147 ) ) ( not ( = ?auto_125145 ?auto_125148 ) ) ( not ( = ?auto_125145 ?auto_125149 ) ) ( not ( = ?auto_125146 ?auto_125147 ) ) ( not ( = ?auto_125146 ?auto_125148 ) ) ( not ( = ?auto_125146 ?auto_125149 ) ) ( not ( = ?auto_125147 ?auto_125148 ) ) ( not ( = ?auto_125147 ?auto_125149 ) ) ( not ( = ?auto_125148 ?auto_125149 ) ) )
    :subtasks
    ( ( !STACK ?auto_125149 ?auto_125148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125150 - BLOCK
      ?auto_125151 - BLOCK
      ?auto_125152 - BLOCK
      ?auto_125153 - BLOCK
      ?auto_125154 - BLOCK
      ?auto_125155 - BLOCK
      ?auto_125156 - BLOCK
    )
    :vars
    (
      ?auto_125157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125155 ) ( ON-TABLE ?auto_125150 ) ( ON ?auto_125151 ?auto_125150 ) ( ON ?auto_125152 ?auto_125151 ) ( ON ?auto_125153 ?auto_125152 ) ( ON ?auto_125154 ?auto_125153 ) ( ON ?auto_125155 ?auto_125154 ) ( not ( = ?auto_125150 ?auto_125151 ) ) ( not ( = ?auto_125150 ?auto_125152 ) ) ( not ( = ?auto_125150 ?auto_125153 ) ) ( not ( = ?auto_125150 ?auto_125154 ) ) ( not ( = ?auto_125150 ?auto_125155 ) ) ( not ( = ?auto_125150 ?auto_125156 ) ) ( not ( = ?auto_125151 ?auto_125152 ) ) ( not ( = ?auto_125151 ?auto_125153 ) ) ( not ( = ?auto_125151 ?auto_125154 ) ) ( not ( = ?auto_125151 ?auto_125155 ) ) ( not ( = ?auto_125151 ?auto_125156 ) ) ( not ( = ?auto_125152 ?auto_125153 ) ) ( not ( = ?auto_125152 ?auto_125154 ) ) ( not ( = ?auto_125152 ?auto_125155 ) ) ( not ( = ?auto_125152 ?auto_125156 ) ) ( not ( = ?auto_125153 ?auto_125154 ) ) ( not ( = ?auto_125153 ?auto_125155 ) ) ( not ( = ?auto_125153 ?auto_125156 ) ) ( not ( = ?auto_125154 ?auto_125155 ) ) ( not ( = ?auto_125154 ?auto_125156 ) ) ( not ( = ?auto_125155 ?auto_125156 ) ) ( ON ?auto_125156 ?auto_125157 ) ( CLEAR ?auto_125156 ) ( HAND-EMPTY ) ( not ( = ?auto_125150 ?auto_125157 ) ) ( not ( = ?auto_125151 ?auto_125157 ) ) ( not ( = ?auto_125152 ?auto_125157 ) ) ( not ( = ?auto_125153 ?auto_125157 ) ) ( not ( = ?auto_125154 ?auto_125157 ) ) ( not ( = ?auto_125155 ?auto_125157 ) ) ( not ( = ?auto_125156 ?auto_125157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125156 ?auto_125157 )
      ( MAKE-7PILE ?auto_125150 ?auto_125151 ?auto_125152 ?auto_125153 ?auto_125154 ?auto_125155 ?auto_125156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125158 - BLOCK
      ?auto_125159 - BLOCK
      ?auto_125160 - BLOCK
      ?auto_125161 - BLOCK
      ?auto_125162 - BLOCK
      ?auto_125163 - BLOCK
      ?auto_125164 - BLOCK
    )
    :vars
    (
      ?auto_125165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125158 ) ( ON ?auto_125159 ?auto_125158 ) ( ON ?auto_125160 ?auto_125159 ) ( ON ?auto_125161 ?auto_125160 ) ( ON ?auto_125162 ?auto_125161 ) ( not ( = ?auto_125158 ?auto_125159 ) ) ( not ( = ?auto_125158 ?auto_125160 ) ) ( not ( = ?auto_125158 ?auto_125161 ) ) ( not ( = ?auto_125158 ?auto_125162 ) ) ( not ( = ?auto_125158 ?auto_125163 ) ) ( not ( = ?auto_125158 ?auto_125164 ) ) ( not ( = ?auto_125159 ?auto_125160 ) ) ( not ( = ?auto_125159 ?auto_125161 ) ) ( not ( = ?auto_125159 ?auto_125162 ) ) ( not ( = ?auto_125159 ?auto_125163 ) ) ( not ( = ?auto_125159 ?auto_125164 ) ) ( not ( = ?auto_125160 ?auto_125161 ) ) ( not ( = ?auto_125160 ?auto_125162 ) ) ( not ( = ?auto_125160 ?auto_125163 ) ) ( not ( = ?auto_125160 ?auto_125164 ) ) ( not ( = ?auto_125161 ?auto_125162 ) ) ( not ( = ?auto_125161 ?auto_125163 ) ) ( not ( = ?auto_125161 ?auto_125164 ) ) ( not ( = ?auto_125162 ?auto_125163 ) ) ( not ( = ?auto_125162 ?auto_125164 ) ) ( not ( = ?auto_125163 ?auto_125164 ) ) ( ON ?auto_125164 ?auto_125165 ) ( CLEAR ?auto_125164 ) ( not ( = ?auto_125158 ?auto_125165 ) ) ( not ( = ?auto_125159 ?auto_125165 ) ) ( not ( = ?auto_125160 ?auto_125165 ) ) ( not ( = ?auto_125161 ?auto_125165 ) ) ( not ( = ?auto_125162 ?auto_125165 ) ) ( not ( = ?auto_125163 ?auto_125165 ) ) ( not ( = ?auto_125164 ?auto_125165 ) ) ( HOLDING ?auto_125163 ) ( CLEAR ?auto_125162 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125158 ?auto_125159 ?auto_125160 ?auto_125161 ?auto_125162 ?auto_125163 )
      ( MAKE-7PILE ?auto_125158 ?auto_125159 ?auto_125160 ?auto_125161 ?auto_125162 ?auto_125163 ?auto_125164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125166 - BLOCK
      ?auto_125167 - BLOCK
      ?auto_125168 - BLOCK
      ?auto_125169 - BLOCK
      ?auto_125170 - BLOCK
      ?auto_125171 - BLOCK
      ?auto_125172 - BLOCK
    )
    :vars
    (
      ?auto_125173 - BLOCK
      ?auto_125174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125166 ) ( ON ?auto_125167 ?auto_125166 ) ( ON ?auto_125168 ?auto_125167 ) ( ON ?auto_125169 ?auto_125168 ) ( ON ?auto_125170 ?auto_125169 ) ( not ( = ?auto_125166 ?auto_125167 ) ) ( not ( = ?auto_125166 ?auto_125168 ) ) ( not ( = ?auto_125166 ?auto_125169 ) ) ( not ( = ?auto_125166 ?auto_125170 ) ) ( not ( = ?auto_125166 ?auto_125171 ) ) ( not ( = ?auto_125166 ?auto_125172 ) ) ( not ( = ?auto_125167 ?auto_125168 ) ) ( not ( = ?auto_125167 ?auto_125169 ) ) ( not ( = ?auto_125167 ?auto_125170 ) ) ( not ( = ?auto_125167 ?auto_125171 ) ) ( not ( = ?auto_125167 ?auto_125172 ) ) ( not ( = ?auto_125168 ?auto_125169 ) ) ( not ( = ?auto_125168 ?auto_125170 ) ) ( not ( = ?auto_125168 ?auto_125171 ) ) ( not ( = ?auto_125168 ?auto_125172 ) ) ( not ( = ?auto_125169 ?auto_125170 ) ) ( not ( = ?auto_125169 ?auto_125171 ) ) ( not ( = ?auto_125169 ?auto_125172 ) ) ( not ( = ?auto_125170 ?auto_125171 ) ) ( not ( = ?auto_125170 ?auto_125172 ) ) ( not ( = ?auto_125171 ?auto_125172 ) ) ( ON ?auto_125172 ?auto_125173 ) ( not ( = ?auto_125166 ?auto_125173 ) ) ( not ( = ?auto_125167 ?auto_125173 ) ) ( not ( = ?auto_125168 ?auto_125173 ) ) ( not ( = ?auto_125169 ?auto_125173 ) ) ( not ( = ?auto_125170 ?auto_125173 ) ) ( not ( = ?auto_125171 ?auto_125173 ) ) ( not ( = ?auto_125172 ?auto_125173 ) ) ( CLEAR ?auto_125170 ) ( ON ?auto_125171 ?auto_125172 ) ( CLEAR ?auto_125171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125174 ) ( ON ?auto_125173 ?auto_125174 ) ( not ( = ?auto_125174 ?auto_125173 ) ) ( not ( = ?auto_125174 ?auto_125172 ) ) ( not ( = ?auto_125174 ?auto_125171 ) ) ( not ( = ?auto_125166 ?auto_125174 ) ) ( not ( = ?auto_125167 ?auto_125174 ) ) ( not ( = ?auto_125168 ?auto_125174 ) ) ( not ( = ?auto_125169 ?auto_125174 ) ) ( not ( = ?auto_125170 ?auto_125174 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125174 ?auto_125173 ?auto_125172 )
      ( MAKE-7PILE ?auto_125166 ?auto_125167 ?auto_125168 ?auto_125169 ?auto_125170 ?auto_125171 ?auto_125172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125175 - BLOCK
      ?auto_125176 - BLOCK
      ?auto_125177 - BLOCK
      ?auto_125178 - BLOCK
      ?auto_125179 - BLOCK
      ?auto_125180 - BLOCK
      ?auto_125181 - BLOCK
    )
    :vars
    (
      ?auto_125182 - BLOCK
      ?auto_125183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125175 ) ( ON ?auto_125176 ?auto_125175 ) ( ON ?auto_125177 ?auto_125176 ) ( ON ?auto_125178 ?auto_125177 ) ( not ( = ?auto_125175 ?auto_125176 ) ) ( not ( = ?auto_125175 ?auto_125177 ) ) ( not ( = ?auto_125175 ?auto_125178 ) ) ( not ( = ?auto_125175 ?auto_125179 ) ) ( not ( = ?auto_125175 ?auto_125180 ) ) ( not ( = ?auto_125175 ?auto_125181 ) ) ( not ( = ?auto_125176 ?auto_125177 ) ) ( not ( = ?auto_125176 ?auto_125178 ) ) ( not ( = ?auto_125176 ?auto_125179 ) ) ( not ( = ?auto_125176 ?auto_125180 ) ) ( not ( = ?auto_125176 ?auto_125181 ) ) ( not ( = ?auto_125177 ?auto_125178 ) ) ( not ( = ?auto_125177 ?auto_125179 ) ) ( not ( = ?auto_125177 ?auto_125180 ) ) ( not ( = ?auto_125177 ?auto_125181 ) ) ( not ( = ?auto_125178 ?auto_125179 ) ) ( not ( = ?auto_125178 ?auto_125180 ) ) ( not ( = ?auto_125178 ?auto_125181 ) ) ( not ( = ?auto_125179 ?auto_125180 ) ) ( not ( = ?auto_125179 ?auto_125181 ) ) ( not ( = ?auto_125180 ?auto_125181 ) ) ( ON ?auto_125181 ?auto_125182 ) ( not ( = ?auto_125175 ?auto_125182 ) ) ( not ( = ?auto_125176 ?auto_125182 ) ) ( not ( = ?auto_125177 ?auto_125182 ) ) ( not ( = ?auto_125178 ?auto_125182 ) ) ( not ( = ?auto_125179 ?auto_125182 ) ) ( not ( = ?auto_125180 ?auto_125182 ) ) ( not ( = ?auto_125181 ?auto_125182 ) ) ( ON ?auto_125180 ?auto_125181 ) ( CLEAR ?auto_125180 ) ( ON-TABLE ?auto_125183 ) ( ON ?auto_125182 ?auto_125183 ) ( not ( = ?auto_125183 ?auto_125182 ) ) ( not ( = ?auto_125183 ?auto_125181 ) ) ( not ( = ?auto_125183 ?auto_125180 ) ) ( not ( = ?auto_125175 ?auto_125183 ) ) ( not ( = ?auto_125176 ?auto_125183 ) ) ( not ( = ?auto_125177 ?auto_125183 ) ) ( not ( = ?auto_125178 ?auto_125183 ) ) ( not ( = ?auto_125179 ?auto_125183 ) ) ( HOLDING ?auto_125179 ) ( CLEAR ?auto_125178 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125175 ?auto_125176 ?auto_125177 ?auto_125178 ?auto_125179 )
      ( MAKE-7PILE ?auto_125175 ?auto_125176 ?auto_125177 ?auto_125178 ?auto_125179 ?auto_125180 ?auto_125181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125184 - BLOCK
      ?auto_125185 - BLOCK
      ?auto_125186 - BLOCK
      ?auto_125187 - BLOCK
      ?auto_125188 - BLOCK
      ?auto_125189 - BLOCK
      ?auto_125190 - BLOCK
    )
    :vars
    (
      ?auto_125191 - BLOCK
      ?auto_125192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125184 ) ( ON ?auto_125185 ?auto_125184 ) ( ON ?auto_125186 ?auto_125185 ) ( ON ?auto_125187 ?auto_125186 ) ( not ( = ?auto_125184 ?auto_125185 ) ) ( not ( = ?auto_125184 ?auto_125186 ) ) ( not ( = ?auto_125184 ?auto_125187 ) ) ( not ( = ?auto_125184 ?auto_125188 ) ) ( not ( = ?auto_125184 ?auto_125189 ) ) ( not ( = ?auto_125184 ?auto_125190 ) ) ( not ( = ?auto_125185 ?auto_125186 ) ) ( not ( = ?auto_125185 ?auto_125187 ) ) ( not ( = ?auto_125185 ?auto_125188 ) ) ( not ( = ?auto_125185 ?auto_125189 ) ) ( not ( = ?auto_125185 ?auto_125190 ) ) ( not ( = ?auto_125186 ?auto_125187 ) ) ( not ( = ?auto_125186 ?auto_125188 ) ) ( not ( = ?auto_125186 ?auto_125189 ) ) ( not ( = ?auto_125186 ?auto_125190 ) ) ( not ( = ?auto_125187 ?auto_125188 ) ) ( not ( = ?auto_125187 ?auto_125189 ) ) ( not ( = ?auto_125187 ?auto_125190 ) ) ( not ( = ?auto_125188 ?auto_125189 ) ) ( not ( = ?auto_125188 ?auto_125190 ) ) ( not ( = ?auto_125189 ?auto_125190 ) ) ( ON ?auto_125190 ?auto_125191 ) ( not ( = ?auto_125184 ?auto_125191 ) ) ( not ( = ?auto_125185 ?auto_125191 ) ) ( not ( = ?auto_125186 ?auto_125191 ) ) ( not ( = ?auto_125187 ?auto_125191 ) ) ( not ( = ?auto_125188 ?auto_125191 ) ) ( not ( = ?auto_125189 ?auto_125191 ) ) ( not ( = ?auto_125190 ?auto_125191 ) ) ( ON ?auto_125189 ?auto_125190 ) ( ON-TABLE ?auto_125192 ) ( ON ?auto_125191 ?auto_125192 ) ( not ( = ?auto_125192 ?auto_125191 ) ) ( not ( = ?auto_125192 ?auto_125190 ) ) ( not ( = ?auto_125192 ?auto_125189 ) ) ( not ( = ?auto_125184 ?auto_125192 ) ) ( not ( = ?auto_125185 ?auto_125192 ) ) ( not ( = ?auto_125186 ?auto_125192 ) ) ( not ( = ?auto_125187 ?auto_125192 ) ) ( not ( = ?auto_125188 ?auto_125192 ) ) ( CLEAR ?auto_125187 ) ( ON ?auto_125188 ?auto_125189 ) ( CLEAR ?auto_125188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125192 ?auto_125191 ?auto_125190 ?auto_125189 )
      ( MAKE-7PILE ?auto_125184 ?auto_125185 ?auto_125186 ?auto_125187 ?auto_125188 ?auto_125189 ?auto_125190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125193 - BLOCK
      ?auto_125194 - BLOCK
      ?auto_125195 - BLOCK
      ?auto_125196 - BLOCK
      ?auto_125197 - BLOCK
      ?auto_125198 - BLOCK
      ?auto_125199 - BLOCK
    )
    :vars
    (
      ?auto_125201 - BLOCK
      ?auto_125200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125193 ) ( ON ?auto_125194 ?auto_125193 ) ( ON ?auto_125195 ?auto_125194 ) ( not ( = ?auto_125193 ?auto_125194 ) ) ( not ( = ?auto_125193 ?auto_125195 ) ) ( not ( = ?auto_125193 ?auto_125196 ) ) ( not ( = ?auto_125193 ?auto_125197 ) ) ( not ( = ?auto_125193 ?auto_125198 ) ) ( not ( = ?auto_125193 ?auto_125199 ) ) ( not ( = ?auto_125194 ?auto_125195 ) ) ( not ( = ?auto_125194 ?auto_125196 ) ) ( not ( = ?auto_125194 ?auto_125197 ) ) ( not ( = ?auto_125194 ?auto_125198 ) ) ( not ( = ?auto_125194 ?auto_125199 ) ) ( not ( = ?auto_125195 ?auto_125196 ) ) ( not ( = ?auto_125195 ?auto_125197 ) ) ( not ( = ?auto_125195 ?auto_125198 ) ) ( not ( = ?auto_125195 ?auto_125199 ) ) ( not ( = ?auto_125196 ?auto_125197 ) ) ( not ( = ?auto_125196 ?auto_125198 ) ) ( not ( = ?auto_125196 ?auto_125199 ) ) ( not ( = ?auto_125197 ?auto_125198 ) ) ( not ( = ?auto_125197 ?auto_125199 ) ) ( not ( = ?auto_125198 ?auto_125199 ) ) ( ON ?auto_125199 ?auto_125201 ) ( not ( = ?auto_125193 ?auto_125201 ) ) ( not ( = ?auto_125194 ?auto_125201 ) ) ( not ( = ?auto_125195 ?auto_125201 ) ) ( not ( = ?auto_125196 ?auto_125201 ) ) ( not ( = ?auto_125197 ?auto_125201 ) ) ( not ( = ?auto_125198 ?auto_125201 ) ) ( not ( = ?auto_125199 ?auto_125201 ) ) ( ON ?auto_125198 ?auto_125199 ) ( ON-TABLE ?auto_125200 ) ( ON ?auto_125201 ?auto_125200 ) ( not ( = ?auto_125200 ?auto_125201 ) ) ( not ( = ?auto_125200 ?auto_125199 ) ) ( not ( = ?auto_125200 ?auto_125198 ) ) ( not ( = ?auto_125193 ?auto_125200 ) ) ( not ( = ?auto_125194 ?auto_125200 ) ) ( not ( = ?auto_125195 ?auto_125200 ) ) ( not ( = ?auto_125196 ?auto_125200 ) ) ( not ( = ?auto_125197 ?auto_125200 ) ) ( ON ?auto_125197 ?auto_125198 ) ( CLEAR ?auto_125197 ) ( HOLDING ?auto_125196 ) ( CLEAR ?auto_125195 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125193 ?auto_125194 ?auto_125195 ?auto_125196 )
      ( MAKE-7PILE ?auto_125193 ?auto_125194 ?auto_125195 ?auto_125196 ?auto_125197 ?auto_125198 ?auto_125199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125202 - BLOCK
      ?auto_125203 - BLOCK
      ?auto_125204 - BLOCK
      ?auto_125205 - BLOCK
      ?auto_125206 - BLOCK
      ?auto_125207 - BLOCK
      ?auto_125208 - BLOCK
    )
    :vars
    (
      ?auto_125210 - BLOCK
      ?auto_125209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125202 ) ( ON ?auto_125203 ?auto_125202 ) ( ON ?auto_125204 ?auto_125203 ) ( not ( = ?auto_125202 ?auto_125203 ) ) ( not ( = ?auto_125202 ?auto_125204 ) ) ( not ( = ?auto_125202 ?auto_125205 ) ) ( not ( = ?auto_125202 ?auto_125206 ) ) ( not ( = ?auto_125202 ?auto_125207 ) ) ( not ( = ?auto_125202 ?auto_125208 ) ) ( not ( = ?auto_125203 ?auto_125204 ) ) ( not ( = ?auto_125203 ?auto_125205 ) ) ( not ( = ?auto_125203 ?auto_125206 ) ) ( not ( = ?auto_125203 ?auto_125207 ) ) ( not ( = ?auto_125203 ?auto_125208 ) ) ( not ( = ?auto_125204 ?auto_125205 ) ) ( not ( = ?auto_125204 ?auto_125206 ) ) ( not ( = ?auto_125204 ?auto_125207 ) ) ( not ( = ?auto_125204 ?auto_125208 ) ) ( not ( = ?auto_125205 ?auto_125206 ) ) ( not ( = ?auto_125205 ?auto_125207 ) ) ( not ( = ?auto_125205 ?auto_125208 ) ) ( not ( = ?auto_125206 ?auto_125207 ) ) ( not ( = ?auto_125206 ?auto_125208 ) ) ( not ( = ?auto_125207 ?auto_125208 ) ) ( ON ?auto_125208 ?auto_125210 ) ( not ( = ?auto_125202 ?auto_125210 ) ) ( not ( = ?auto_125203 ?auto_125210 ) ) ( not ( = ?auto_125204 ?auto_125210 ) ) ( not ( = ?auto_125205 ?auto_125210 ) ) ( not ( = ?auto_125206 ?auto_125210 ) ) ( not ( = ?auto_125207 ?auto_125210 ) ) ( not ( = ?auto_125208 ?auto_125210 ) ) ( ON ?auto_125207 ?auto_125208 ) ( ON-TABLE ?auto_125209 ) ( ON ?auto_125210 ?auto_125209 ) ( not ( = ?auto_125209 ?auto_125210 ) ) ( not ( = ?auto_125209 ?auto_125208 ) ) ( not ( = ?auto_125209 ?auto_125207 ) ) ( not ( = ?auto_125202 ?auto_125209 ) ) ( not ( = ?auto_125203 ?auto_125209 ) ) ( not ( = ?auto_125204 ?auto_125209 ) ) ( not ( = ?auto_125205 ?auto_125209 ) ) ( not ( = ?auto_125206 ?auto_125209 ) ) ( ON ?auto_125206 ?auto_125207 ) ( CLEAR ?auto_125204 ) ( ON ?auto_125205 ?auto_125206 ) ( CLEAR ?auto_125205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125209 ?auto_125210 ?auto_125208 ?auto_125207 ?auto_125206 )
      ( MAKE-7PILE ?auto_125202 ?auto_125203 ?auto_125204 ?auto_125205 ?auto_125206 ?auto_125207 ?auto_125208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125211 - BLOCK
      ?auto_125212 - BLOCK
      ?auto_125213 - BLOCK
      ?auto_125214 - BLOCK
      ?auto_125215 - BLOCK
      ?auto_125216 - BLOCK
      ?auto_125217 - BLOCK
    )
    :vars
    (
      ?auto_125218 - BLOCK
      ?auto_125219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125211 ) ( ON ?auto_125212 ?auto_125211 ) ( not ( = ?auto_125211 ?auto_125212 ) ) ( not ( = ?auto_125211 ?auto_125213 ) ) ( not ( = ?auto_125211 ?auto_125214 ) ) ( not ( = ?auto_125211 ?auto_125215 ) ) ( not ( = ?auto_125211 ?auto_125216 ) ) ( not ( = ?auto_125211 ?auto_125217 ) ) ( not ( = ?auto_125212 ?auto_125213 ) ) ( not ( = ?auto_125212 ?auto_125214 ) ) ( not ( = ?auto_125212 ?auto_125215 ) ) ( not ( = ?auto_125212 ?auto_125216 ) ) ( not ( = ?auto_125212 ?auto_125217 ) ) ( not ( = ?auto_125213 ?auto_125214 ) ) ( not ( = ?auto_125213 ?auto_125215 ) ) ( not ( = ?auto_125213 ?auto_125216 ) ) ( not ( = ?auto_125213 ?auto_125217 ) ) ( not ( = ?auto_125214 ?auto_125215 ) ) ( not ( = ?auto_125214 ?auto_125216 ) ) ( not ( = ?auto_125214 ?auto_125217 ) ) ( not ( = ?auto_125215 ?auto_125216 ) ) ( not ( = ?auto_125215 ?auto_125217 ) ) ( not ( = ?auto_125216 ?auto_125217 ) ) ( ON ?auto_125217 ?auto_125218 ) ( not ( = ?auto_125211 ?auto_125218 ) ) ( not ( = ?auto_125212 ?auto_125218 ) ) ( not ( = ?auto_125213 ?auto_125218 ) ) ( not ( = ?auto_125214 ?auto_125218 ) ) ( not ( = ?auto_125215 ?auto_125218 ) ) ( not ( = ?auto_125216 ?auto_125218 ) ) ( not ( = ?auto_125217 ?auto_125218 ) ) ( ON ?auto_125216 ?auto_125217 ) ( ON-TABLE ?auto_125219 ) ( ON ?auto_125218 ?auto_125219 ) ( not ( = ?auto_125219 ?auto_125218 ) ) ( not ( = ?auto_125219 ?auto_125217 ) ) ( not ( = ?auto_125219 ?auto_125216 ) ) ( not ( = ?auto_125211 ?auto_125219 ) ) ( not ( = ?auto_125212 ?auto_125219 ) ) ( not ( = ?auto_125213 ?auto_125219 ) ) ( not ( = ?auto_125214 ?auto_125219 ) ) ( not ( = ?auto_125215 ?auto_125219 ) ) ( ON ?auto_125215 ?auto_125216 ) ( ON ?auto_125214 ?auto_125215 ) ( CLEAR ?auto_125214 ) ( HOLDING ?auto_125213 ) ( CLEAR ?auto_125212 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125211 ?auto_125212 ?auto_125213 )
      ( MAKE-7PILE ?auto_125211 ?auto_125212 ?auto_125213 ?auto_125214 ?auto_125215 ?auto_125216 ?auto_125217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125220 - BLOCK
      ?auto_125221 - BLOCK
      ?auto_125222 - BLOCK
      ?auto_125223 - BLOCK
      ?auto_125224 - BLOCK
      ?auto_125225 - BLOCK
      ?auto_125226 - BLOCK
    )
    :vars
    (
      ?auto_125227 - BLOCK
      ?auto_125228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125220 ) ( ON ?auto_125221 ?auto_125220 ) ( not ( = ?auto_125220 ?auto_125221 ) ) ( not ( = ?auto_125220 ?auto_125222 ) ) ( not ( = ?auto_125220 ?auto_125223 ) ) ( not ( = ?auto_125220 ?auto_125224 ) ) ( not ( = ?auto_125220 ?auto_125225 ) ) ( not ( = ?auto_125220 ?auto_125226 ) ) ( not ( = ?auto_125221 ?auto_125222 ) ) ( not ( = ?auto_125221 ?auto_125223 ) ) ( not ( = ?auto_125221 ?auto_125224 ) ) ( not ( = ?auto_125221 ?auto_125225 ) ) ( not ( = ?auto_125221 ?auto_125226 ) ) ( not ( = ?auto_125222 ?auto_125223 ) ) ( not ( = ?auto_125222 ?auto_125224 ) ) ( not ( = ?auto_125222 ?auto_125225 ) ) ( not ( = ?auto_125222 ?auto_125226 ) ) ( not ( = ?auto_125223 ?auto_125224 ) ) ( not ( = ?auto_125223 ?auto_125225 ) ) ( not ( = ?auto_125223 ?auto_125226 ) ) ( not ( = ?auto_125224 ?auto_125225 ) ) ( not ( = ?auto_125224 ?auto_125226 ) ) ( not ( = ?auto_125225 ?auto_125226 ) ) ( ON ?auto_125226 ?auto_125227 ) ( not ( = ?auto_125220 ?auto_125227 ) ) ( not ( = ?auto_125221 ?auto_125227 ) ) ( not ( = ?auto_125222 ?auto_125227 ) ) ( not ( = ?auto_125223 ?auto_125227 ) ) ( not ( = ?auto_125224 ?auto_125227 ) ) ( not ( = ?auto_125225 ?auto_125227 ) ) ( not ( = ?auto_125226 ?auto_125227 ) ) ( ON ?auto_125225 ?auto_125226 ) ( ON-TABLE ?auto_125228 ) ( ON ?auto_125227 ?auto_125228 ) ( not ( = ?auto_125228 ?auto_125227 ) ) ( not ( = ?auto_125228 ?auto_125226 ) ) ( not ( = ?auto_125228 ?auto_125225 ) ) ( not ( = ?auto_125220 ?auto_125228 ) ) ( not ( = ?auto_125221 ?auto_125228 ) ) ( not ( = ?auto_125222 ?auto_125228 ) ) ( not ( = ?auto_125223 ?auto_125228 ) ) ( not ( = ?auto_125224 ?auto_125228 ) ) ( ON ?auto_125224 ?auto_125225 ) ( ON ?auto_125223 ?auto_125224 ) ( CLEAR ?auto_125221 ) ( ON ?auto_125222 ?auto_125223 ) ( CLEAR ?auto_125222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125228 ?auto_125227 ?auto_125226 ?auto_125225 ?auto_125224 ?auto_125223 )
      ( MAKE-7PILE ?auto_125220 ?auto_125221 ?auto_125222 ?auto_125223 ?auto_125224 ?auto_125225 ?auto_125226 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125229 - BLOCK
      ?auto_125230 - BLOCK
      ?auto_125231 - BLOCK
      ?auto_125232 - BLOCK
      ?auto_125233 - BLOCK
      ?auto_125234 - BLOCK
      ?auto_125235 - BLOCK
    )
    :vars
    (
      ?auto_125236 - BLOCK
      ?auto_125237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125229 ) ( not ( = ?auto_125229 ?auto_125230 ) ) ( not ( = ?auto_125229 ?auto_125231 ) ) ( not ( = ?auto_125229 ?auto_125232 ) ) ( not ( = ?auto_125229 ?auto_125233 ) ) ( not ( = ?auto_125229 ?auto_125234 ) ) ( not ( = ?auto_125229 ?auto_125235 ) ) ( not ( = ?auto_125230 ?auto_125231 ) ) ( not ( = ?auto_125230 ?auto_125232 ) ) ( not ( = ?auto_125230 ?auto_125233 ) ) ( not ( = ?auto_125230 ?auto_125234 ) ) ( not ( = ?auto_125230 ?auto_125235 ) ) ( not ( = ?auto_125231 ?auto_125232 ) ) ( not ( = ?auto_125231 ?auto_125233 ) ) ( not ( = ?auto_125231 ?auto_125234 ) ) ( not ( = ?auto_125231 ?auto_125235 ) ) ( not ( = ?auto_125232 ?auto_125233 ) ) ( not ( = ?auto_125232 ?auto_125234 ) ) ( not ( = ?auto_125232 ?auto_125235 ) ) ( not ( = ?auto_125233 ?auto_125234 ) ) ( not ( = ?auto_125233 ?auto_125235 ) ) ( not ( = ?auto_125234 ?auto_125235 ) ) ( ON ?auto_125235 ?auto_125236 ) ( not ( = ?auto_125229 ?auto_125236 ) ) ( not ( = ?auto_125230 ?auto_125236 ) ) ( not ( = ?auto_125231 ?auto_125236 ) ) ( not ( = ?auto_125232 ?auto_125236 ) ) ( not ( = ?auto_125233 ?auto_125236 ) ) ( not ( = ?auto_125234 ?auto_125236 ) ) ( not ( = ?auto_125235 ?auto_125236 ) ) ( ON ?auto_125234 ?auto_125235 ) ( ON-TABLE ?auto_125237 ) ( ON ?auto_125236 ?auto_125237 ) ( not ( = ?auto_125237 ?auto_125236 ) ) ( not ( = ?auto_125237 ?auto_125235 ) ) ( not ( = ?auto_125237 ?auto_125234 ) ) ( not ( = ?auto_125229 ?auto_125237 ) ) ( not ( = ?auto_125230 ?auto_125237 ) ) ( not ( = ?auto_125231 ?auto_125237 ) ) ( not ( = ?auto_125232 ?auto_125237 ) ) ( not ( = ?auto_125233 ?auto_125237 ) ) ( ON ?auto_125233 ?auto_125234 ) ( ON ?auto_125232 ?auto_125233 ) ( ON ?auto_125231 ?auto_125232 ) ( CLEAR ?auto_125231 ) ( HOLDING ?auto_125230 ) ( CLEAR ?auto_125229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125229 ?auto_125230 )
      ( MAKE-7PILE ?auto_125229 ?auto_125230 ?auto_125231 ?auto_125232 ?auto_125233 ?auto_125234 ?auto_125235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125238 - BLOCK
      ?auto_125239 - BLOCK
      ?auto_125240 - BLOCK
      ?auto_125241 - BLOCK
      ?auto_125242 - BLOCK
      ?auto_125243 - BLOCK
      ?auto_125244 - BLOCK
    )
    :vars
    (
      ?auto_125246 - BLOCK
      ?auto_125245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125238 ) ( not ( = ?auto_125238 ?auto_125239 ) ) ( not ( = ?auto_125238 ?auto_125240 ) ) ( not ( = ?auto_125238 ?auto_125241 ) ) ( not ( = ?auto_125238 ?auto_125242 ) ) ( not ( = ?auto_125238 ?auto_125243 ) ) ( not ( = ?auto_125238 ?auto_125244 ) ) ( not ( = ?auto_125239 ?auto_125240 ) ) ( not ( = ?auto_125239 ?auto_125241 ) ) ( not ( = ?auto_125239 ?auto_125242 ) ) ( not ( = ?auto_125239 ?auto_125243 ) ) ( not ( = ?auto_125239 ?auto_125244 ) ) ( not ( = ?auto_125240 ?auto_125241 ) ) ( not ( = ?auto_125240 ?auto_125242 ) ) ( not ( = ?auto_125240 ?auto_125243 ) ) ( not ( = ?auto_125240 ?auto_125244 ) ) ( not ( = ?auto_125241 ?auto_125242 ) ) ( not ( = ?auto_125241 ?auto_125243 ) ) ( not ( = ?auto_125241 ?auto_125244 ) ) ( not ( = ?auto_125242 ?auto_125243 ) ) ( not ( = ?auto_125242 ?auto_125244 ) ) ( not ( = ?auto_125243 ?auto_125244 ) ) ( ON ?auto_125244 ?auto_125246 ) ( not ( = ?auto_125238 ?auto_125246 ) ) ( not ( = ?auto_125239 ?auto_125246 ) ) ( not ( = ?auto_125240 ?auto_125246 ) ) ( not ( = ?auto_125241 ?auto_125246 ) ) ( not ( = ?auto_125242 ?auto_125246 ) ) ( not ( = ?auto_125243 ?auto_125246 ) ) ( not ( = ?auto_125244 ?auto_125246 ) ) ( ON ?auto_125243 ?auto_125244 ) ( ON-TABLE ?auto_125245 ) ( ON ?auto_125246 ?auto_125245 ) ( not ( = ?auto_125245 ?auto_125246 ) ) ( not ( = ?auto_125245 ?auto_125244 ) ) ( not ( = ?auto_125245 ?auto_125243 ) ) ( not ( = ?auto_125238 ?auto_125245 ) ) ( not ( = ?auto_125239 ?auto_125245 ) ) ( not ( = ?auto_125240 ?auto_125245 ) ) ( not ( = ?auto_125241 ?auto_125245 ) ) ( not ( = ?auto_125242 ?auto_125245 ) ) ( ON ?auto_125242 ?auto_125243 ) ( ON ?auto_125241 ?auto_125242 ) ( ON ?auto_125240 ?auto_125241 ) ( CLEAR ?auto_125238 ) ( ON ?auto_125239 ?auto_125240 ) ( CLEAR ?auto_125239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125245 ?auto_125246 ?auto_125244 ?auto_125243 ?auto_125242 ?auto_125241 ?auto_125240 )
      ( MAKE-7PILE ?auto_125238 ?auto_125239 ?auto_125240 ?auto_125241 ?auto_125242 ?auto_125243 ?auto_125244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125247 - BLOCK
      ?auto_125248 - BLOCK
      ?auto_125249 - BLOCK
      ?auto_125250 - BLOCK
      ?auto_125251 - BLOCK
      ?auto_125252 - BLOCK
      ?auto_125253 - BLOCK
    )
    :vars
    (
      ?auto_125255 - BLOCK
      ?auto_125254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125247 ?auto_125248 ) ) ( not ( = ?auto_125247 ?auto_125249 ) ) ( not ( = ?auto_125247 ?auto_125250 ) ) ( not ( = ?auto_125247 ?auto_125251 ) ) ( not ( = ?auto_125247 ?auto_125252 ) ) ( not ( = ?auto_125247 ?auto_125253 ) ) ( not ( = ?auto_125248 ?auto_125249 ) ) ( not ( = ?auto_125248 ?auto_125250 ) ) ( not ( = ?auto_125248 ?auto_125251 ) ) ( not ( = ?auto_125248 ?auto_125252 ) ) ( not ( = ?auto_125248 ?auto_125253 ) ) ( not ( = ?auto_125249 ?auto_125250 ) ) ( not ( = ?auto_125249 ?auto_125251 ) ) ( not ( = ?auto_125249 ?auto_125252 ) ) ( not ( = ?auto_125249 ?auto_125253 ) ) ( not ( = ?auto_125250 ?auto_125251 ) ) ( not ( = ?auto_125250 ?auto_125252 ) ) ( not ( = ?auto_125250 ?auto_125253 ) ) ( not ( = ?auto_125251 ?auto_125252 ) ) ( not ( = ?auto_125251 ?auto_125253 ) ) ( not ( = ?auto_125252 ?auto_125253 ) ) ( ON ?auto_125253 ?auto_125255 ) ( not ( = ?auto_125247 ?auto_125255 ) ) ( not ( = ?auto_125248 ?auto_125255 ) ) ( not ( = ?auto_125249 ?auto_125255 ) ) ( not ( = ?auto_125250 ?auto_125255 ) ) ( not ( = ?auto_125251 ?auto_125255 ) ) ( not ( = ?auto_125252 ?auto_125255 ) ) ( not ( = ?auto_125253 ?auto_125255 ) ) ( ON ?auto_125252 ?auto_125253 ) ( ON-TABLE ?auto_125254 ) ( ON ?auto_125255 ?auto_125254 ) ( not ( = ?auto_125254 ?auto_125255 ) ) ( not ( = ?auto_125254 ?auto_125253 ) ) ( not ( = ?auto_125254 ?auto_125252 ) ) ( not ( = ?auto_125247 ?auto_125254 ) ) ( not ( = ?auto_125248 ?auto_125254 ) ) ( not ( = ?auto_125249 ?auto_125254 ) ) ( not ( = ?auto_125250 ?auto_125254 ) ) ( not ( = ?auto_125251 ?auto_125254 ) ) ( ON ?auto_125251 ?auto_125252 ) ( ON ?auto_125250 ?auto_125251 ) ( ON ?auto_125249 ?auto_125250 ) ( ON ?auto_125248 ?auto_125249 ) ( CLEAR ?auto_125248 ) ( HOLDING ?auto_125247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125247 )
      ( MAKE-7PILE ?auto_125247 ?auto_125248 ?auto_125249 ?auto_125250 ?auto_125251 ?auto_125252 ?auto_125253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125256 - BLOCK
      ?auto_125257 - BLOCK
      ?auto_125258 - BLOCK
      ?auto_125259 - BLOCK
      ?auto_125260 - BLOCK
      ?auto_125261 - BLOCK
      ?auto_125262 - BLOCK
    )
    :vars
    (
      ?auto_125264 - BLOCK
      ?auto_125263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125256 ?auto_125257 ) ) ( not ( = ?auto_125256 ?auto_125258 ) ) ( not ( = ?auto_125256 ?auto_125259 ) ) ( not ( = ?auto_125256 ?auto_125260 ) ) ( not ( = ?auto_125256 ?auto_125261 ) ) ( not ( = ?auto_125256 ?auto_125262 ) ) ( not ( = ?auto_125257 ?auto_125258 ) ) ( not ( = ?auto_125257 ?auto_125259 ) ) ( not ( = ?auto_125257 ?auto_125260 ) ) ( not ( = ?auto_125257 ?auto_125261 ) ) ( not ( = ?auto_125257 ?auto_125262 ) ) ( not ( = ?auto_125258 ?auto_125259 ) ) ( not ( = ?auto_125258 ?auto_125260 ) ) ( not ( = ?auto_125258 ?auto_125261 ) ) ( not ( = ?auto_125258 ?auto_125262 ) ) ( not ( = ?auto_125259 ?auto_125260 ) ) ( not ( = ?auto_125259 ?auto_125261 ) ) ( not ( = ?auto_125259 ?auto_125262 ) ) ( not ( = ?auto_125260 ?auto_125261 ) ) ( not ( = ?auto_125260 ?auto_125262 ) ) ( not ( = ?auto_125261 ?auto_125262 ) ) ( ON ?auto_125262 ?auto_125264 ) ( not ( = ?auto_125256 ?auto_125264 ) ) ( not ( = ?auto_125257 ?auto_125264 ) ) ( not ( = ?auto_125258 ?auto_125264 ) ) ( not ( = ?auto_125259 ?auto_125264 ) ) ( not ( = ?auto_125260 ?auto_125264 ) ) ( not ( = ?auto_125261 ?auto_125264 ) ) ( not ( = ?auto_125262 ?auto_125264 ) ) ( ON ?auto_125261 ?auto_125262 ) ( ON-TABLE ?auto_125263 ) ( ON ?auto_125264 ?auto_125263 ) ( not ( = ?auto_125263 ?auto_125264 ) ) ( not ( = ?auto_125263 ?auto_125262 ) ) ( not ( = ?auto_125263 ?auto_125261 ) ) ( not ( = ?auto_125256 ?auto_125263 ) ) ( not ( = ?auto_125257 ?auto_125263 ) ) ( not ( = ?auto_125258 ?auto_125263 ) ) ( not ( = ?auto_125259 ?auto_125263 ) ) ( not ( = ?auto_125260 ?auto_125263 ) ) ( ON ?auto_125260 ?auto_125261 ) ( ON ?auto_125259 ?auto_125260 ) ( ON ?auto_125258 ?auto_125259 ) ( ON ?auto_125257 ?auto_125258 ) ( ON ?auto_125256 ?auto_125257 ) ( CLEAR ?auto_125256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125263 ?auto_125264 ?auto_125262 ?auto_125261 ?auto_125260 ?auto_125259 ?auto_125258 ?auto_125257 )
      ( MAKE-7PILE ?auto_125256 ?auto_125257 ?auto_125258 ?auto_125259 ?auto_125260 ?auto_125261 ?auto_125262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125266 - BLOCK
    )
    :vars
    (
      ?auto_125267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125267 ?auto_125266 ) ( CLEAR ?auto_125267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125266 ) ( not ( = ?auto_125266 ?auto_125267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125267 ?auto_125266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125268 - BLOCK
    )
    :vars
    (
      ?auto_125269 - BLOCK
      ?auto_125270 - BLOCK
      ?auto_125271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125269 ?auto_125268 ) ( CLEAR ?auto_125269 ) ( ON-TABLE ?auto_125268 ) ( not ( = ?auto_125268 ?auto_125269 ) ) ( HOLDING ?auto_125270 ) ( CLEAR ?auto_125271 ) ( not ( = ?auto_125268 ?auto_125270 ) ) ( not ( = ?auto_125268 ?auto_125271 ) ) ( not ( = ?auto_125269 ?auto_125270 ) ) ( not ( = ?auto_125269 ?auto_125271 ) ) ( not ( = ?auto_125270 ?auto_125271 ) ) )
    :subtasks
    ( ( !STACK ?auto_125270 ?auto_125271 )
      ( MAKE-1PILE ?auto_125268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125272 - BLOCK
    )
    :vars
    (
      ?auto_125275 - BLOCK
      ?auto_125273 - BLOCK
      ?auto_125274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125275 ?auto_125272 ) ( ON-TABLE ?auto_125272 ) ( not ( = ?auto_125272 ?auto_125275 ) ) ( CLEAR ?auto_125273 ) ( not ( = ?auto_125272 ?auto_125274 ) ) ( not ( = ?auto_125272 ?auto_125273 ) ) ( not ( = ?auto_125275 ?auto_125274 ) ) ( not ( = ?auto_125275 ?auto_125273 ) ) ( not ( = ?auto_125274 ?auto_125273 ) ) ( ON ?auto_125274 ?auto_125275 ) ( CLEAR ?auto_125274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125272 ?auto_125275 )
      ( MAKE-1PILE ?auto_125272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125276 - BLOCK
    )
    :vars
    (
      ?auto_125279 - BLOCK
      ?auto_125278 - BLOCK
      ?auto_125277 - BLOCK
      ?auto_125284 - BLOCK
      ?auto_125282 - BLOCK
      ?auto_125280 - BLOCK
      ?auto_125281 - BLOCK
      ?auto_125283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125279 ?auto_125276 ) ( ON-TABLE ?auto_125276 ) ( not ( = ?auto_125276 ?auto_125279 ) ) ( not ( = ?auto_125276 ?auto_125278 ) ) ( not ( = ?auto_125276 ?auto_125277 ) ) ( not ( = ?auto_125279 ?auto_125278 ) ) ( not ( = ?auto_125279 ?auto_125277 ) ) ( not ( = ?auto_125278 ?auto_125277 ) ) ( ON ?auto_125278 ?auto_125279 ) ( CLEAR ?auto_125278 ) ( HOLDING ?auto_125277 ) ( CLEAR ?auto_125284 ) ( ON-TABLE ?auto_125282 ) ( ON ?auto_125280 ?auto_125282 ) ( ON ?auto_125281 ?auto_125280 ) ( ON ?auto_125283 ?auto_125281 ) ( ON ?auto_125284 ?auto_125283 ) ( not ( = ?auto_125282 ?auto_125280 ) ) ( not ( = ?auto_125282 ?auto_125281 ) ) ( not ( = ?auto_125282 ?auto_125283 ) ) ( not ( = ?auto_125282 ?auto_125284 ) ) ( not ( = ?auto_125282 ?auto_125277 ) ) ( not ( = ?auto_125280 ?auto_125281 ) ) ( not ( = ?auto_125280 ?auto_125283 ) ) ( not ( = ?auto_125280 ?auto_125284 ) ) ( not ( = ?auto_125280 ?auto_125277 ) ) ( not ( = ?auto_125281 ?auto_125283 ) ) ( not ( = ?auto_125281 ?auto_125284 ) ) ( not ( = ?auto_125281 ?auto_125277 ) ) ( not ( = ?auto_125283 ?auto_125284 ) ) ( not ( = ?auto_125283 ?auto_125277 ) ) ( not ( = ?auto_125284 ?auto_125277 ) ) ( not ( = ?auto_125276 ?auto_125284 ) ) ( not ( = ?auto_125276 ?auto_125282 ) ) ( not ( = ?auto_125276 ?auto_125280 ) ) ( not ( = ?auto_125276 ?auto_125281 ) ) ( not ( = ?auto_125276 ?auto_125283 ) ) ( not ( = ?auto_125279 ?auto_125284 ) ) ( not ( = ?auto_125279 ?auto_125282 ) ) ( not ( = ?auto_125279 ?auto_125280 ) ) ( not ( = ?auto_125279 ?auto_125281 ) ) ( not ( = ?auto_125279 ?auto_125283 ) ) ( not ( = ?auto_125278 ?auto_125284 ) ) ( not ( = ?auto_125278 ?auto_125282 ) ) ( not ( = ?auto_125278 ?auto_125280 ) ) ( not ( = ?auto_125278 ?auto_125281 ) ) ( not ( = ?auto_125278 ?auto_125283 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125282 ?auto_125280 ?auto_125281 ?auto_125283 ?auto_125284 ?auto_125277 )
      ( MAKE-1PILE ?auto_125276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125285 - BLOCK
    )
    :vars
    (
      ?auto_125287 - BLOCK
      ?auto_125292 - BLOCK
      ?auto_125288 - BLOCK
      ?auto_125293 - BLOCK
      ?auto_125291 - BLOCK
      ?auto_125286 - BLOCK
      ?auto_125290 - BLOCK
      ?auto_125289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125287 ?auto_125285 ) ( ON-TABLE ?auto_125285 ) ( not ( = ?auto_125285 ?auto_125287 ) ) ( not ( = ?auto_125285 ?auto_125292 ) ) ( not ( = ?auto_125285 ?auto_125288 ) ) ( not ( = ?auto_125287 ?auto_125292 ) ) ( not ( = ?auto_125287 ?auto_125288 ) ) ( not ( = ?auto_125292 ?auto_125288 ) ) ( ON ?auto_125292 ?auto_125287 ) ( CLEAR ?auto_125293 ) ( ON-TABLE ?auto_125291 ) ( ON ?auto_125286 ?auto_125291 ) ( ON ?auto_125290 ?auto_125286 ) ( ON ?auto_125289 ?auto_125290 ) ( ON ?auto_125293 ?auto_125289 ) ( not ( = ?auto_125291 ?auto_125286 ) ) ( not ( = ?auto_125291 ?auto_125290 ) ) ( not ( = ?auto_125291 ?auto_125289 ) ) ( not ( = ?auto_125291 ?auto_125293 ) ) ( not ( = ?auto_125291 ?auto_125288 ) ) ( not ( = ?auto_125286 ?auto_125290 ) ) ( not ( = ?auto_125286 ?auto_125289 ) ) ( not ( = ?auto_125286 ?auto_125293 ) ) ( not ( = ?auto_125286 ?auto_125288 ) ) ( not ( = ?auto_125290 ?auto_125289 ) ) ( not ( = ?auto_125290 ?auto_125293 ) ) ( not ( = ?auto_125290 ?auto_125288 ) ) ( not ( = ?auto_125289 ?auto_125293 ) ) ( not ( = ?auto_125289 ?auto_125288 ) ) ( not ( = ?auto_125293 ?auto_125288 ) ) ( not ( = ?auto_125285 ?auto_125293 ) ) ( not ( = ?auto_125285 ?auto_125291 ) ) ( not ( = ?auto_125285 ?auto_125286 ) ) ( not ( = ?auto_125285 ?auto_125290 ) ) ( not ( = ?auto_125285 ?auto_125289 ) ) ( not ( = ?auto_125287 ?auto_125293 ) ) ( not ( = ?auto_125287 ?auto_125291 ) ) ( not ( = ?auto_125287 ?auto_125286 ) ) ( not ( = ?auto_125287 ?auto_125290 ) ) ( not ( = ?auto_125287 ?auto_125289 ) ) ( not ( = ?auto_125292 ?auto_125293 ) ) ( not ( = ?auto_125292 ?auto_125291 ) ) ( not ( = ?auto_125292 ?auto_125286 ) ) ( not ( = ?auto_125292 ?auto_125290 ) ) ( not ( = ?auto_125292 ?auto_125289 ) ) ( ON ?auto_125288 ?auto_125292 ) ( CLEAR ?auto_125288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125285 ?auto_125287 ?auto_125292 )
      ( MAKE-1PILE ?auto_125285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125294 - BLOCK
    )
    :vars
    (
      ?auto_125299 - BLOCK
      ?auto_125295 - BLOCK
      ?auto_125298 - BLOCK
      ?auto_125300 - BLOCK
      ?auto_125302 - BLOCK
      ?auto_125301 - BLOCK
      ?auto_125296 - BLOCK
      ?auto_125297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125299 ?auto_125294 ) ( ON-TABLE ?auto_125294 ) ( not ( = ?auto_125294 ?auto_125299 ) ) ( not ( = ?auto_125294 ?auto_125295 ) ) ( not ( = ?auto_125294 ?auto_125298 ) ) ( not ( = ?auto_125299 ?auto_125295 ) ) ( not ( = ?auto_125299 ?auto_125298 ) ) ( not ( = ?auto_125295 ?auto_125298 ) ) ( ON ?auto_125295 ?auto_125299 ) ( ON-TABLE ?auto_125300 ) ( ON ?auto_125302 ?auto_125300 ) ( ON ?auto_125301 ?auto_125302 ) ( ON ?auto_125296 ?auto_125301 ) ( not ( = ?auto_125300 ?auto_125302 ) ) ( not ( = ?auto_125300 ?auto_125301 ) ) ( not ( = ?auto_125300 ?auto_125296 ) ) ( not ( = ?auto_125300 ?auto_125297 ) ) ( not ( = ?auto_125300 ?auto_125298 ) ) ( not ( = ?auto_125302 ?auto_125301 ) ) ( not ( = ?auto_125302 ?auto_125296 ) ) ( not ( = ?auto_125302 ?auto_125297 ) ) ( not ( = ?auto_125302 ?auto_125298 ) ) ( not ( = ?auto_125301 ?auto_125296 ) ) ( not ( = ?auto_125301 ?auto_125297 ) ) ( not ( = ?auto_125301 ?auto_125298 ) ) ( not ( = ?auto_125296 ?auto_125297 ) ) ( not ( = ?auto_125296 ?auto_125298 ) ) ( not ( = ?auto_125297 ?auto_125298 ) ) ( not ( = ?auto_125294 ?auto_125297 ) ) ( not ( = ?auto_125294 ?auto_125300 ) ) ( not ( = ?auto_125294 ?auto_125302 ) ) ( not ( = ?auto_125294 ?auto_125301 ) ) ( not ( = ?auto_125294 ?auto_125296 ) ) ( not ( = ?auto_125299 ?auto_125297 ) ) ( not ( = ?auto_125299 ?auto_125300 ) ) ( not ( = ?auto_125299 ?auto_125302 ) ) ( not ( = ?auto_125299 ?auto_125301 ) ) ( not ( = ?auto_125299 ?auto_125296 ) ) ( not ( = ?auto_125295 ?auto_125297 ) ) ( not ( = ?auto_125295 ?auto_125300 ) ) ( not ( = ?auto_125295 ?auto_125302 ) ) ( not ( = ?auto_125295 ?auto_125301 ) ) ( not ( = ?auto_125295 ?auto_125296 ) ) ( ON ?auto_125298 ?auto_125295 ) ( CLEAR ?auto_125298 ) ( HOLDING ?auto_125297 ) ( CLEAR ?auto_125296 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125300 ?auto_125302 ?auto_125301 ?auto_125296 ?auto_125297 )
      ( MAKE-1PILE ?auto_125294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125303 - BLOCK
    )
    :vars
    (
      ?auto_125305 - BLOCK
      ?auto_125306 - BLOCK
      ?auto_125311 - BLOCK
      ?auto_125304 - BLOCK
      ?auto_125308 - BLOCK
      ?auto_125310 - BLOCK
      ?auto_125309 - BLOCK
      ?auto_125307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125305 ?auto_125303 ) ( ON-TABLE ?auto_125303 ) ( not ( = ?auto_125303 ?auto_125305 ) ) ( not ( = ?auto_125303 ?auto_125306 ) ) ( not ( = ?auto_125303 ?auto_125311 ) ) ( not ( = ?auto_125305 ?auto_125306 ) ) ( not ( = ?auto_125305 ?auto_125311 ) ) ( not ( = ?auto_125306 ?auto_125311 ) ) ( ON ?auto_125306 ?auto_125305 ) ( ON-TABLE ?auto_125304 ) ( ON ?auto_125308 ?auto_125304 ) ( ON ?auto_125310 ?auto_125308 ) ( ON ?auto_125309 ?auto_125310 ) ( not ( = ?auto_125304 ?auto_125308 ) ) ( not ( = ?auto_125304 ?auto_125310 ) ) ( not ( = ?auto_125304 ?auto_125309 ) ) ( not ( = ?auto_125304 ?auto_125307 ) ) ( not ( = ?auto_125304 ?auto_125311 ) ) ( not ( = ?auto_125308 ?auto_125310 ) ) ( not ( = ?auto_125308 ?auto_125309 ) ) ( not ( = ?auto_125308 ?auto_125307 ) ) ( not ( = ?auto_125308 ?auto_125311 ) ) ( not ( = ?auto_125310 ?auto_125309 ) ) ( not ( = ?auto_125310 ?auto_125307 ) ) ( not ( = ?auto_125310 ?auto_125311 ) ) ( not ( = ?auto_125309 ?auto_125307 ) ) ( not ( = ?auto_125309 ?auto_125311 ) ) ( not ( = ?auto_125307 ?auto_125311 ) ) ( not ( = ?auto_125303 ?auto_125307 ) ) ( not ( = ?auto_125303 ?auto_125304 ) ) ( not ( = ?auto_125303 ?auto_125308 ) ) ( not ( = ?auto_125303 ?auto_125310 ) ) ( not ( = ?auto_125303 ?auto_125309 ) ) ( not ( = ?auto_125305 ?auto_125307 ) ) ( not ( = ?auto_125305 ?auto_125304 ) ) ( not ( = ?auto_125305 ?auto_125308 ) ) ( not ( = ?auto_125305 ?auto_125310 ) ) ( not ( = ?auto_125305 ?auto_125309 ) ) ( not ( = ?auto_125306 ?auto_125307 ) ) ( not ( = ?auto_125306 ?auto_125304 ) ) ( not ( = ?auto_125306 ?auto_125308 ) ) ( not ( = ?auto_125306 ?auto_125310 ) ) ( not ( = ?auto_125306 ?auto_125309 ) ) ( ON ?auto_125311 ?auto_125306 ) ( CLEAR ?auto_125309 ) ( ON ?auto_125307 ?auto_125311 ) ( CLEAR ?auto_125307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125303 ?auto_125305 ?auto_125306 ?auto_125311 )
      ( MAKE-1PILE ?auto_125303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125312 - BLOCK
    )
    :vars
    (
      ?auto_125319 - BLOCK
      ?auto_125313 - BLOCK
      ?auto_125320 - BLOCK
      ?auto_125317 - BLOCK
      ?auto_125318 - BLOCK
      ?auto_125314 - BLOCK
      ?auto_125316 - BLOCK
      ?auto_125315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125319 ?auto_125312 ) ( ON-TABLE ?auto_125312 ) ( not ( = ?auto_125312 ?auto_125319 ) ) ( not ( = ?auto_125312 ?auto_125313 ) ) ( not ( = ?auto_125312 ?auto_125320 ) ) ( not ( = ?auto_125319 ?auto_125313 ) ) ( not ( = ?auto_125319 ?auto_125320 ) ) ( not ( = ?auto_125313 ?auto_125320 ) ) ( ON ?auto_125313 ?auto_125319 ) ( ON-TABLE ?auto_125317 ) ( ON ?auto_125318 ?auto_125317 ) ( ON ?auto_125314 ?auto_125318 ) ( not ( = ?auto_125317 ?auto_125318 ) ) ( not ( = ?auto_125317 ?auto_125314 ) ) ( not ( = ?auto_125317 ?auto_125316 ) ) ( not ( = ?auto_125317 ?auto_125315 ) ) ( not ( = ?auto_125317 ?auto_125320 ) ) ( not ( = ?auto_125318 ?auto_125314 ) ) ( not ( = ?auto_125318 ?auto_125316 ) ) ( not ( = ?auto_125318 ?auto_125315 ) ) ( not ( = ?auto_125318 ?auto_125320 ) ) ( not ( = ?auto_125314 ?auto_125316 ) ) ( not ( = ?auto_125314 ?auto_125315 ) ) ( not ( = ?auto_125314 ?auto_125320 ) ) ( not ( = ?auto_125316 ?auto_125315 ) ) ( not ( = ?auto_125316 ?auto_125320 ) ) ( not ( = ?auto_125315 ?auto_125320 ) ) ( not ( = ?auto_125312 ?auto_125315 ) ) ( not ( = ?auto_125312 ?auto_125317 ) ) ( not ( = ?auto_125312 ?auto_125318 ) ) ( not ( = ?auto_125312 ?auto_125314 ) ) ( not ( = ?auto_125312 ?auto_125316 ) ) ( not ( = ?auto_125319 ?auto_125315 ) ) ( not ( = ?auto_125319 ?auto_125317 ) ) ( not ( = ?auto_125319 ?auto_125318 ) ) ( not ( = ?auto_125319 ?auto_125314 ) ) ( not ( = ?auto_125319 ?auto_125316 ) ) ( not ( = ?auto_125313 ?auto_125315 ) ) ( not ( = ?auto_125313 ?auto_125317 ) ) ( not ( = ?auto_125313 ?auto_125318 ) ) ( not ( = ?auto_125313 ?auto_125314 ) ) ( not ( = ?auto_125313 ?auto_125316 ) ) ( ON ?auto_125320 ?auto_125313 ) ( ON ?auto_125315 ?auto_125320 ) ( CLEAR ?auto_125315 ) ( HOLDING ?auto_125316 ) ( CLEAR ?auto_125314 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125317 ?auto_125318 ?auto_125314 ?auto_125316 )
      ( MAKE-1PILE ?auto_125312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125321 - BLOCK
    )
    :vars
    (
      ?auto_125322 - BLOCK
      ?auto_125326 - BLOCK
      ?auto_125327 - BLOCK
      ?auto_125324 - BLOCK
      ?auto_125328 - BLOCK
      ?auto_125329 - BLOCK
      ?auto_125325 - BLOCK
      ?auto_125323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125322 ?auto_125321 ) ( ON-TABLE ?auto_125321 ) ( not ( = ?auto_125321 ?auto_125322 ) ) ( not ( = ?auto_125321 ?auto_125326 ) ) ( not ( = ?auto_125321 ?auto_125327 ) ) ( not ( = ?auto_125322 ?auto_125326 ) ) ( not ( = ?auto_125322 ?auto_125327 ) ) ( not ( = ?auto_125326 ?auto_125327 ) ) ( ON ?auto_125326 ?auto_125322 ) ( ON-TABLE ?auto_125324 ) ( ON ?auto_125328 ?auto_125324 ) ( ON ?auto_125329 ?auto_125328 ) ( not ( = ?auto_125324 ?auto_125328 ) ) ( not ( = ?auto_125324 ?auto_125329 ) ) ( not ( = ?auto_125324 ?auto_125325 ) ) ( not ( = ?auto_125324 ?auto_125323 ) ) ( not ( = ?auto_125324 ?auto_125327 ) ) ( not ( = ?auto_125328 ?auto_125329 ) ) ( not ( = ?auto_125328 ?auto_125325 ) ) ( not ( = ?auto_125328 ?auto_125323 ) ) ( not ( = ?auto_125328 ?auto_125327 ) ) ( not ( = ?auto_125329 ?auto_125325 ) ) ( not ( = ?auto_125329 ?auto_125323 ) ) ( not ( = ?auto_125329 ?auto_125327 ) ) ( not ( = ?auto_125325 ?auto_125323 ) ) ( not ( = ?auto_125325 ?auto_125327 ) ) ( not ( = ?auto_125323 ?auto_125327 ) ) ( not ( = ?auto_125321 ?auto_125323 ) ) ( not ( = ?auto_125321 ?auto_125324 ) ) ( not ( = ?auto_125321 ?auto_125328 ) ) ( not ( = ?auto_125321 ?auto_125329 ) ) ( not ( = ?auto_125321 ?auto_125325 ) ) ( not ( = ?auto_125322 ?auto_125323 ) ) ( not ( = ?auto_125322 ?auto_125324 ) ) ( not ( = ?auto_125322 ?auto_125328 ) ) ( not ( = ?auto_125322 ?auto_125329 ) ) ( not ( = ?auto_125322 ?auto_125325 ) ) ( not ( = ?auto_125326 ?auto_125323 ) ) ( not ( = ?auto_125326 ?auto_125324 ) ) ( not ( = ?auto_125326 ?auto_125328 ) ) ( not ( = ?auto_125326 ?auto_125329 ) ) ( not ( = ?auto_125326 ?auto_125325 ) ) ( ON ?auto_125327 ?auto_125326 ) ( ON ?auto_125323 ?auto_125327 ) ( CLEAR ?auto_125329 ) ( ON ?auto_125325 ?auto_125323 ) ( CLEAR ?auto_125325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125321 ?auto_125322 ?auto_125326 ?auto_125327 ?auto_125323 )
      ( MAKE-1PILE ?auto_125321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125330 - BLOCK
    )
    :vars
    (
      ?auto_125335 - BLOCK
      ?auto_125333 - BLOCK
      ?auto_125336 - BLOCK
      ?auto_125332 - BLOCK
      ?auto_125331 - BLOCK
      ?auto_125334 - BLOCK
      ?auto_125337 - BLOCK
      ?auto_125338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125335 ?auto_125330 ) ( ON-TABLE ?auto_125330 ) ( not ( = ?auto_125330 ?auto_125335 ) ) ( not ( = ?auto_125330 ?auto_125333 ) ) ( not ( = ?auto_125330 ?auto_125336 ) ) ( not ( = ?auto_125335 ?auto_125333 ) ) ( not ( = ?auto_125335 ?auto_125336 ) ) ( not ( = ?auto_125333 ?auto_125336 ) ) ( ON ?auto_125333 ?auto_125335 ) ( ON-TABLE ?auto_125332 ) ( ON ?auto_125331 ?auto_125332 ) ( not ( = ?auto_125332 ?auto_125331 ) ) ( not ( = ?auto_125332 ?auto_125334 ) ) ( not ( = ?auto_125332 ?auto_125337 ) ) ( not ( = ?auto_125332 ?auto_125338 ) ) ( not ( = ?auto_125332 ?auto_125336 ) ) ( not ( = ?auto_125331 ?auto_125334 ) ) ( not ( = ?auto_125331 ?auto_125337 ) ) ( not ( = ?auto_125331 ?auto_125338 ) ) ( not ( = ?auto_125331 ?auto_125336 ) ) ( not ( = ?auto_125334 ?auto_125337 ) ) ( not ( = ?auto_125334 ?auto_125338 ) ) ( not ( = ?auto_125334 ?auto_125336 ) ) ( not ( = ?auto_125337 ?auto_125338 ) ) ( not ( = ?auto_125337 ?auto_125336 ) ) ( not ( = ?auto_125338 ?auto_125336 ) ) ( not ( = ?auto_125330 ?auto_125338 ) ) ( not ( = ?auto_125330 ?auto_125332 ) ) ( not ( = ?auto_125330 ?auto_125331 ) ) ( not ( = ?auto_125330 ?auto_125334 ) ) ( not ( = ?auto_125330 ?auto_125337 ) ) ( not ( = ?auto_125335 ?auto_125338 ) ) ( not ( = ?auto_125335 ?auto_125332 ) ) ( not ( = ?auto_125335 ?auto_125331 ) ) ( not ( = ?auto_125335 ?auto_125334 ) ) ( not ( = ?auto_125335 ?auto_125337 ) ) ( not ( = ?auto_125333 ?auto_125338 ) ) ( not ( = ?auto_125333 ?auto_125332 ) ) ( not ( = ?auto_125333 ?auto_125331 ) ) ( not ( = ?auto_125333 ?auto_125334 ) ) ( not ( = ?auto_125333 ?auto_125337 ) ) ( ON ?auto_125336 ?auto_125333 ) ( ON ?auto_125338 ?auto_125336 ) ( ON ?auto_125337 ?auto_125338 ) ( CLEAR ?auto_125337 ) ( HOLDING ?auto_125334 ) ( CLEAR ?auto_125331 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125332 ?auto_125331 ?auto_125334 )
      ( MAKE-1PILE ?auto_125330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125339 - BLOCK
    )
    :vars
    (
      ?auto_125344 - BLOCK
      ?auto_125346 - BLOCK
      ?auto_125341 - BLOCK
      ?auto_125343 - BLOCK
      ?auto_125340 - BLOCK
      ?auto_125342 - BLOCK
      ?auto_125345 - BLOCK
      ?auto_125347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125344 ?auto_125339 ) ( ON-TABLE ?auto_125339 ) ( not ( = ?auto_125339 ?auto_125344 ) ) ( not ( = ?auto_125339 ?auto_125346 ) ) ( not ( = ?auto_125339 ?auto_125341 ) ) ( not ( = ?auto_125344 ?auto_125346 ) ) ( not ( = ?auto_125344 ?auto_125341 ) ) ( not ( = ?auto_125346 ?auto_125341 ) ) ( ON ?auto_125346 ?auto_125344 ) ( ON-TABLE ?auto_125343 ) ( ON ?auto_125340 ?auto_125343 ) ( not ( = ?auto_125343 ?auto_125340 ) ) ( not ( = ?auto_125343 ?auto_125342 ) ) ( not ( = ?auto_125343 ?auto_125345 ) ) ( not ( = ?auto_125343 ?auto_125347 ) ) ( not ( = ?auto_125343 ?auto_125341 ) ) ( not ( = ?auto_125340 ?auto_125342 ) ) ( not ( = ?auto_125340 ?auto_125345 ) ) ( not ( = ?auto_125340 ?auto_125347 ) ) ( not ( = ?auto_125340 ?auto_125341 ) ) ( not ( = ?auto_125342 ?auto_125345 ) ) ( not ( = ?auto_125342 ?auto_125347 ) ) ( not ( = ?auto_125342 ?auto_125341 ) ) ( not ( = ?auto_125345 ?auto_125347 ) ) ( not ( = ?auto_125345 ?auto_125341 ) ) ( not ( = ?auto_125347 ?auto_125341 ) ) ( not ( = ?auto_125339 ?auto_125347 ) ) ( not ( = ?auto_125339 ?auto_125343 ) ) ( not ( = ?auto_125339 ?auto_125340 ) ) ( not ( = ?auto_125339 ?auto_125342 ) ) ( not ( = ?auto_125339 ?auto_125345 ) ) ( not ( = ?auto_125344 ?auto_125347 ) ) ( not ( = ?auto_125344 ?auto_125343 ) ) ( not ( = ?auto_125344 ?auto_125340 ) ) ( not ( = ?auto_125344 ?auto_125342 ) ) ( not ( = ?auto_125344 ?auto_125345 ) ) ( not ( = ?auto_125346 ?auto_125347 ) ) ( not ( = ?auto_125346 ?auto_125343 ) ) ( not ( = ?auto_125346 ?auto_125340 ) ) ( not ( = ?auto_125346 ?auto_125342 ) ) ( not ( = ?auto_125346 ?auto_125345 ) ) ( ON ?auto_125341 ?auto_125346 ) ( ON ?auto_125347 ?auto_125341 ) ( ON ?auto_125345 ?auto_125347 ) ( CLEAR ?auto_125340 ) ( ON ?auto_125342 ?auto_125345 ) ( CLEAR ?auto_125342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125339 ?auto_125344 ?auto_125346 ?auto_125341 ?auto_125347 ?auto_125345 )
      ( MAKE-1PILE ?auto_125339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125348 - BLOCK
    )
    :vars
    (
      ?auto_125351 - BLOCK
      ?auto_125353 - BLOCK
      ?auto_125349 - BLOCK
      ?auto_125352 - BLOCK
      ?auto_125356 - BLOCK
      ?auto_125354 - BLOCK
      ?auto_125355 - BLOCK
      ?auto_125350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125351 ?auto_125348 ) ( ON-TABLE ?auto_125348 ) ( not ( = ?auto_125348 ?auto_125351 ) ) ( not ( = ?auto_125348 ?auto_125353 ) ) ( not ( = ?auto_125348 ?auto_125349 ) ) ( not ( = ?auto_125351 ?auto_125353 ) ) ( not ( = ?auto_125351 ?auto_125349 ) ) ( not ( = ?auto_125353 ?auto_125349 ) ) ( ON ?auto_125353 ?auto_125351 ) ( ON-TABLE ?auto_125352 ) ( not ( = ?auto_125352 ?auto_125356 ) ) ( not ( = ?auto_125352 ?auto_125354 ) ) ( not ( = ?auto_125352 ?auto_125355 ) ) ( not ( = ?auto_125352 ?auto_125350 ) ) ( not ( = ?auto_125352 ?auto_125349 ) ) ( not ( = ?auto_125356 ?auto_125354 ) ) ( not ( = ?auto_125356 ?auto_125355 ) ) ( not ( = ?auto_125356 ?auto_125350 ) ) ( not ( = ?auto_125356 ?auto_125349 ) ) ( not ( = ?auto_125354 ?auto_125355 ) ) ( not ( = ?auto_125354 ?auto_125350 ) ) ( not ( = ?auto_125354 ?auto_125349 ) ) ( not ( = ?auto_125355 ?auto_125350 ) ) ( not ( = ?auto_125355 ?auto_125349 ) ) ( not ( = ?auto_125350 ?auto_125349 ) ) ( not ( = ?auto_125348 ?auto_125350 ) ) ( not ( = ?auto_125348 ?auto_125352 ) ) ( not ( = ?auto_125348 ?auto_125356 ) ) ( not ( = ?auto_125348 ?auto_125354 ) ) ( not ( = ?auto_125348 ?auto_125355 ) ) ( not ( = ?auto_125351 ?auto_125350 ) ) ( not ( = ?auto_125351 ?auto_125352 ) ) ( not ( = ?auto_125351 ?auto_125356 ) ) ( not ( = ?auto_125351 ?auto_125354 ) ) ( not ( = ?auto_125351 ?auto_125355 ) ) ( not ( = ?auto_125353 ?auto_125350 ) ) ( not ( = ?auto_125353 ?auto_125352 ) ) ( not ( = ?auto_125353 ?auto_125356 ) ) ( not ( = ?auto_125353 ?auto_125354 ) ) ( not ( = ?auto_125353 ?auto_125355 ) ) ( ON ?auto_125349 ?auto_125353 ) ( ON ?auto_125350 ?auto_125349 ) ( ON ?auto_125355 ?auto_125350 ) ( ON ?auto_125354 ?auto_125355 ) ( CLEAR ?auto_125354 ) ( HOLDING ?auto_125356 ) ( CLEAR ?auto_125352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125352 ?auto_125356 )
      ( MAKE-1PILE ?auto_125348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127527 - BLOCK
    )
    :vars
    (
      ?auto_127533 - BLOCK
      ?auto_127528 - BLOCK
      ?auto_127534 - BLOCK
      ?auto_127532 - BLOCK
      ?auto_127530 - BLOCK
      ?auto_127529 - BLOCK
      ?auto_127531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127533 ?auto_127527 ) ( ON-TABLE ?auto_127527 ) ( not ( = ?auto_127527 ?auto_127533 ) ) ( not ( = ?auto_127527 ?auto_127528 ) ) ( not ( = ?auto_127527 ?auto_127534 ) ) ( not ( = ?auto_127533 ?auto_127528 ) ) ( not ( = ?auto_127533 ?auto_127534 ) ) ( not ( = ?auto_127528 ?auto_127534 ) ) ( ON ?auto_127528 ?auto_127533 ) ( not ( = ?auto_127532 ?auto_127530 ) ) ( not ( = ?auto_127532 ?auto_127529 ) ) ( not ( = ?auto_127532 ?auto_127531 ) ) ( not ( = ?auto_127532 ?auto_127534 ) ) ( not ( = ?auto_127530 ?auto_127529 ) ) ( not ( = ?auto_127530 ?auto_127531 ) ) ( not ( = ?auto_127530 ?auto_127534 ) ) ( not ( = ?auto_127529 ?auto_127531 ) ) ( not ( = ?auto_127529 ?auto_127534 ) ) ( not ( = ?auto_127531 ?auto_127534 ) ) ( not ( = ?auto_127527 ?auto_127531 ) ) ( not ( = ?auto_127527 ?auto_127532 ) ) ( not ( = ?auto_127527 ?auto_127530 ) ) ( not ( = ?auto_127527 ?auto_127529 ) ) ( not ( = ?auto_127533 ?auto_127531 ) ) ( not ( = ?auto_127533 ?auto_127532 ) ) ( not ( = ?auto_127533 ?auto_127530 ) ) ( not ( = ?auto_127533 ?auto_127529 ) ) ( not ( = ?auto_127528 ?auto_127531 ) ) ( not ( = ?auto_127528 ?auto_127532 ) ) ( not ( = ?auto_127528 ?auto_127530 ) ) ( not ( = ?auto_127528 ?auto_127529 ) ) ( ON ?auto_127534 ?auto_127528 ) ( ON ?auto_127531 ?auto_127534 ) ( ON ?auto_127529 ?auto_127531 ) ( ON ?auto_127530 ?auto_127529 ) ( ON ?auto_127532 ?auto_127530 ) ( CLEAR ?auto_127532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127527 ?auto_127533 ?auto_127528 ?auto_127534 ?auto_127531 ?auto_127529 ?auto_127530 )
      ( MAKE-1PILE ?auto_127527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125366 - BLOCK
    )
    :vars
    (
      ?auto_125371 - BLOCK
      ?auto_125368 - BLOCK
      ?auto_125372 - BLOCK
      ?auto_125367 - BLOCK
      ?auto_125370 - BLOCK
      ?auto_125373 - BLOCK
      ?auto_125374 - BLOCK
      ?auto_125369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125371 ?auto_125366 ) ( ON-TABLE ?auto_125366 ) ( not ( = ?auto_125366 ?auto_125371 ) ) ( not ( = ?auto_125366 ?auto_125368 ) ) ( not ( = ?auto_125366 ?auto_125372 ) ) ( not ( = ?auto_125371 ?auto_125368 ) ) ( not ( = ?auto_125371 ?auto_125372 ) ) ( not ( = ?auto_125368 ?auto_125372 ) ) ( ON ?auto_125368 ?auto_125371 ) ( not ( = ?auto_125367 ?auto_125370 ) ) ( not ( = ?auto_125367 ?auto_125373 ) ) ( not ( = ?auto_125367 ?auto_125374 ) ) ( not ( = ?auto_125367 ?auto_125369 ) ) ( not ( = ?auto_125367 ?auto_125372 ) ) ( not ( = ?auto_125370 ?auto_125373 ) ) ( not ( = ?auto_125370 ?auto_125374 ) ) ( not ( = ?auto_125370 ?auto_125369 ) ) ( not ( = ?auto_125370 ?auto_125372 ) ) ( not ( = ?auto_125373 ?auto_125374 ) ) ( not ( = ?auto_125373 ?auto_125369 ) ) ( not ( = ?auto_125373 ?auto_125372 ) ) ( not ( = ?auto_125374 ?auto_125369 ) ) ( not ( = ?auto_125374 ?auto_125372 ) ) ( not ( = ?auto_125369 ?auto_125372 ) ) ( not ( = ?auto_125366 ?auto_125369 ) ) ( not ( = ?auto_125366 ?auto_125367 ) ) ( not ( = ?auto_125366 ?auto_125370 ) ) ( not ( = ?auto_125366 ?auto_125373 ) ) ( not ( = ?auto_125366 ?auto_125374 ) ) ( not ( = ?auto_125371 ?auto_125369 ) ) ( not ( = ?auto_125371 ?auto_125367 ) ) ( not ( = ?auto_125371 ?auto_125370 ) ) ( not ( = ?auto_125371 ?auto_125373 ) ) ( not ( = ?auto_125371 ?auto_125374 ) ) ( not ( = ?auto_125368 ?auto_125369 ) ) ( not ( = ?auto_125368 ?auto_125367 ) ) ( not ( = ?auto_125368 ?auto_125370 ) ) ( not ( = ?auto_125368 ?auto_125373 ) ) ( not ( = ?auto_125368 ?auto_125374 ) ) ( ON ?auto_125372 ?auto_125368 ) ( ON ?auto_125369 ?auto_125372 ) ( ON ?auto_125374 ?auto_125369 ) ( ON ?auto_125373 ?auto_125374 ) ( ON ?auto_125370 ?auto_125373 ) ( CLEAR ?auto_125370 ) ( HOLDING ?auto_125367 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125367 )
      ( MAKE-1PILE ?auto_125366 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125375 - BLOCK
    )
    :vars
    (
      ?auto_125376 - BLOCK
      ?auto_125382 - BLOCK
      ?auto_125377 - BLOCK
      ?auto_125378 - BLOCK
      ?auto_125379 - BLOCK
      ?auto_125380 - BLOCK
      ?auto_125383 - BLOCK
      ?auto_125381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125376 ?auto_125375 ) ( ON-TABLE ?auto_125375 ) ( not ( = ?auto_125375 ?auto_125376 ) ) ( not ( = ?auto_125375 ?auto_125382 ) ) ( not ( = ?auto_125375 ?auto_125377 ) ) ( not ( = ?auto_125376 ?auto_125382 ) ) ( not ( = ?auto_125376 ?auto_125377 ) ) ( not ( = ?auto_125382 ?auto_125377 ) ) ( ON ?auto_125382 ?auto_125376 ) ( not ( = ?auto_125378 ?auto_125379 ) ) ( not ( = ?auto_125378 ?auto_125380 ) ) ( not ( = ?auto_125378 ?auto_125383 ) ) ( not ( = ?auto_125378 ?auto_125381 ) ) ( not ( = ?auto_125378 ?auto_125377 ) ) ( not ( = ?auto_125379 ?auto_125380 ) ) ( not ( = ?auto_125379 ?auto_125383 ) ) ( not ( = ?auto_125379 ?auto_125381 ) ) ( not ( = ?auto_125379 ?auto_125377 ) ) ( not ( = ?auto_125380 ?auto_125383 ) ) ( not ( = ?auto_125380 ?auto_125381 ) ) ( not ( = ?auto_125380 ?auto_125377 ) ) ( not ( = ?auto_125383 ?auto_125381 ) ) ( not ( = ?auto_125383 ?auto_125377 ) ) ( not ( = ?auto_125381 ?auto_125377 ) ) ( not ( = ?auto_125375 ?auto_125381 ) ) ( not ( = ?auto_125375 ?auto_125378 ) ) ( not ( = ?auto_125375 ?auto_125379 ) ) ( not ( = ?auto_125375 ?auto_125380 ) ) ( not ( = ?auto_125375 ?auto_125383 ) ) ( not ( = ?auto_125376 ?auto_125381 ) ) ( not ( = ?auto_125376 ?auto_125378 ) ) ( not ( = ?auto_125376 ?auto_125379 ) ) ( not ( = ?auto_125376 ?auto_125380 ) ) ( not ( = ?auto_125376 ?auto_125383 ) ) ( not ( = ?auto_125382 ?auto_125381 ) ) ( not ( = ?auto_125382 ?auto_125378 ) ) ( not ( = ?auto_125382 ?auto_125379 ) ) ( not ( = ?auto_125382 ?auto_125380 ) ) ( not ( = ?auto_125382 ?auto_125383 ) ) ( ON ?auto_125377 ?auto_125382 ) ( ON ?auto_125381 ?auto_125377 ) ( ON ?auto_125383 ?auto_125381 ) ( ON ?auto_125380 ?auto_125383 ) ( ON ?auto_125379 ?auto_125380 ) ( ON ?auto_125378 ?auto_125379 ) ( CLEAR ?auto_125378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125375 ?auto_125376 ?auto_125382 ?auto_125377 ?auto_125381 ?auto_125383 ?auto_125380 ?auto_125379 )
      ( MAKE-1PILE ?auto_125375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125392 - BLOCK
      ?auto_125393 - BLOCK
      ?auto_125394 - BLOCK
      ?auto_125395 - BLOCK
      ?auto_125396 - BLOCK
      ?auto_125397 - BLOCK
      ?auto_125398 - BLOCK
      ?auto_125399 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_125399 ) ( CLEAR ?auto_125398 ) ( ON-TABLE ?auto_125392 ) ( ON ?auto_125393 ?auto_125392 ) ( ON ?auto_125394 ?auto_125393 ) ( ON ?auto_125395 ?auto_125394 ) ( ON ?auto_125396 ?auto_125395 ) ( ON ?auto_125397 ?auto_125396 ) ( ON ?auto_125398 ?auto_125397 ) ( not ( = ?auto_125392 ?auto_125393 ) ) ( not ( = ?auto_125392 ?auto_125394 ) ) ( not ( = ?auto_125392 ?auto_125395 ) ) ( not ( = ?auto_125392 ?auto_125396 ) ) ( not ( = ?auto_125392 ?auto_125397 ) ) ( not ( = ?auto_125392 ?auto_125398 ) ) ( not ( = ?auto_125392 ?auto_125399 ) ) ( not ( = ?auto_125393 ?auto_125394 ) ) ( not ( = ?auto_125393 ?auto_125395 ) ) ( not ( = ?auto_125393 ?auto_125396 ) ) ( not ( = ?auto_125393 ?auto_125397 ) ) ( not ( = ?auto_125393 ?auto_125398 ) ) ( not ( = ?auto_125393 ?auto_125399 ) ) ( not ( = ?auto_125394 ?auto_125395 ) ) ( not ( = ?auto_125394 ?auto_125396 ) ) ( not ( = ?auto_125394 ?auto_125397 ) ) ( not ( = ?auto_125394 ?auto_125398 ) ) ( not ( = ?auto_125394 ?auto_125399 ) ) ( not ( = ?auto_125395 ?auto_125396 ) ) ( not ( = ?auto_125395 ?auto_125397 ) ) ( not ( = ?auto_125395 ?auto_125398 ) ) ( not ( = ?auto_125395 ?auto_125399 ) ) ( not ( = ?auto_125396 ?auto_125397 ) ) ( not ( = ?auto_125396 ?auto_125398 ) ) ( not ( = ?auto_125396 ?auto_125399 ) ) ( not ( = ?auto_125397 ?auto_125398 ) ) ( not ( = ?auto_125397 ?auto_125399 ) ) ( not ( = ?auto_125398 ?auto_125399 ) ) )
    :subtasks
    ( ( !STACK ?auto_125399 ?auto_125398 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125400 - BLOCK
      ?auto_125401 - BLOCK
      ?auto_125402 - BLOCK
      ?auto_125403 - BLOCK
      ?auto_125404 - BLOCK
      ?auto_125405 - BLOCK
      ?auto_125406 - BLOCK
      ?auto_125407 - BLOCK
    )
    :vars
    (
      ?auto_125408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125406 ) ( ON-TABLE ?auto_125400 ) ( ON ?auto_125401 ?auto_125400 ) ( ON ?auto_125402 ?auto_125401 ) ( ON ?auto_125403 ?auto_125402 ) ( ON ?auto_125404 ?auto_125403 ) ( ON ?auto_125405 ?auto_125404 ) ( ON ?auto_125406 ?auto_125405 ) ( not ( = ?auto_125400 ?auto_125401 ) ) ( not ( = ?auto_125400 ?auto_125402 ) ) ( not ( = ?auto_125400 ?auto_125403 ) ) ( not ( = ?auto_125400 ?auto_125404 ) ) ( not ( = ?auto_125400 ?auto_125405 ) ) ( not ( = ?auto_125400 ?auto_125406 ) ) ( not ( = ?auto_125400 ?auto_125407 ) ) ( not ( = ?auto_125401 ?auto_125402 ) ) ( not ( = ?auto_125401 ?auto_125403 ) ) ( not ( = ?auto_125401 ?auto_125404 ) ) ( not ( = ?auto_125401 ?auto_125405 ) ) ( not ( = ?auto_125401 ?auto_125406 ) ) ( not ( = ?auto_125401 ?auto_125407 ) ) ( not ( = ?auto_125402 ?auto_125403 ) ) ( not ( = ?auto_125402 ?auto_125404 ) ) ( not ( = ?auto_125402 ?auto_125405 ) ) ( not ( = ?auto_125402 ?auto_125406 ) ) ( not ( = ?auto_125402 ?auto_125407 ) ) ( not ( = ?auto_125403 ?auto_125404 ) ) ( not ( = ?auto_125403 ?auto_125405 ) ) ( not ( = ?auto_125403 ?auto_125406 ) ) ( not ( = ?auto_125403 ?auto_125407 ) ) ( not ( = ?auto_125404 ?auto_125405 ) ) ( not ( = ?auto_125404 ?auto_125406 ) ) ( not ( = ?auto_125404 ?auto_125407 ) ) ( not ( = ?auto_125405 ?auto_125406 ) ) ( not ( = ?auto_125405 ?auto_125407 ) ) ( not ( = ?auto_125406 ?auto_125407 ) ) ( ON ?auto_125407 ?auto_125408 ) ( CLEAR ?auto_125407 ) ( HAND-EMPTY ) ( not ( = ?auto_125400 ?auto_125408 ) ) ( not ( = ?auto_125401 ?auto_125408 ) ) ( not ( = ?auto_125402 ?auto_125408 ) ) ( not ( = ?auto_125403 ?auto_125408 ) ) ( not ( = ?auto_125404 ?auto_125408 ) ) ( not ( = ?auto_125405 ?auto_125408 ) ) ( not ( = ?auto_125406 ?auto_125408 ) ) ( not ( = ?auto_125407 ?auto_125408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125407 ?auto_125408 )
      ( MAKE-8PILE ?auto_125400 ?auto_125401 ?auto_125402 ?auto_125403 ?auto_125404 ?auto_125405 ?auto_125406 ?auto_125407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125409 - BLOCK
      ?auto_125410 - BLOCK
      ?auto_125411 - BLOCK
      ?auto_125412 - BLOCK
      ?auto_125413 - BLOCK
      ?auto_125414 - BLOCK
      ?auto_125415 - BLOCK
      ?auto_125416 - BLOCK
    )
    :vars
    (
      ?auto_125417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125409 ) ( ON ?auto_125410 ?auto_125409 ) ( ON ?auto_125411 ?auto_125410 ) ( ON ?auto_125412 ?auto_125411 ) ( ON ?auto_125413 ?auto_125412 ) ( ON ?auto_125414 ?auto_125413 ) ( not ( = ?auto_125409 ?auto_125410 ) ) ( not ( = ?auto_125409 ?auto_125411 ) ) ( not ( = ?auto_125409 ?auto_125412 ) ) ( not ( = ?auto_125409 ?auto_125413 ) ) ( not ( = ?auto_125409 ?auto_125414 ) ) ( not ( = ?auto_125409 ?auto_125415 ) ) ( not ( = ?auto_125409 ?auto_125416 ) ) ( not ( = ?auto_125410 ?auto_125411 ) ) ( not ( = ?auto_125410 ?auto_125412 ) ) ( not ( = ?auto_125410 ?auto_125413 ) ) ( not ( = ?auto_125410 ?auto_125414 ) ) ( not ( = ?auto_125410 ?auto_125415 ) ) ( not ( = ?auto_125410 ?auto_125416 ) ) ( not ( = ?auto_125411 ?auto_125412 ) ) ( not ( = ?auto_125411 ?auto_125413 ) ) ( not ( = ?auto_125411 ?auto_125414 ) ) ( not ( = ?auto_125411 ?auto_125415 ) ) ( not ( = ?auto_125411 ?auto_125416 ) ) ( not ( = ?auto_125412 ?auto_125413 ) ) ( not ( = ?auto_125412 ?auto_125414 ) ) ( not ( = ?auto_125412 ?auto_125415 ) ) ( not ( = ?auto_125412 ?auto_125416 ) ) ( not ( = ?auto_125413 ?auto_125414 ) ) ( not ( = ?auto_125413 ?auto_125415 ) ) ( not ( = ?auto_125413 ?auto_125416 ) ) ( not ( = ?auto_125414 ?auto_125415 ) ) ( not ( = ?auto_125414 ?auto_125416 ) ) ( not ( = ?auto_125415 ?auto_125416 ) ) ( ON ?auto_125416 ?auto_125417 ) ( CLEAR ?auto_125416 ) ( not ( = ?auto_125409 ?auto_125417 ) ) ( not ( = ?auto_125410 ?auto_125417 ) ) ( not ( = ?auto_125411 ?auto_125417 ) ) ( not ( = ?auto_125412 ?auto_125417 ) ) ( not ( = ?auto_125413 ?auto_125417 ) ) ( not ( = ?auto_125414 ?auto_125417 ) ) ( not ( = ?auto_125415 ?auto_125417 ) ) ( not ( = ?auto_125416 ?auto_125417 ) ) ( HOLDING ?auto_125415 ) ( CLEAR ?auto_125414 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125409 ?auto_125410 ?auto_125411 ?auto_125412 ?auto_125413 ?auto_125414 ?auto_125415 )
      ( MAKE-8PILE ?auto_125409 ?auto_125410 ?auto_125411 ?auto_125412 ?auto_125413 ?auto_125414 ?auto_125415 ?auto_125416 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125418 - BLOCK
      ?auto_125419 - BLOCK
      ?auto_125420 - BLOCK
      ?auto_125421 - BLOCK
      ?auto_125422 - BLOCK
      ?auto_125423 - BLOCK
      ?auto_125424 - BLOCK
      ?auto_125425 - BLOCK
    )
    :vars
    (
      ?auto_125426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125418 ) ( ON ?auto_125419 ?auto_125418 ) ( ON ?auto_125420 ?auto_125419 ) ( ON ?auto_125421 ?auto_125420 ) ( ON ?auto_125422 ?auto_125421 ) ( ON ?auto_125423 ?auto_125422 ) ( not ( = ?auto_125418 ?auto_125419 ) ) ( not ( = ?auto_125418 ?auto_125420 ) ) ( not ( = ?auto_125418 ?auto_125421 ) ) ( not ( = ?auto_125418 ?auto_125422 ) ) ( not ( = ?auto_125418 ?auto_125423 ) ) ( not ( = ?auto_125418 ?auto_125424 ) ) ( not ( = ?auto_125418 ?auto_125425 ) ) ( not ( = ?auto_125419 ?auto_125420 ) ) ( not ( = ?auto_125419 ?auto_125421 ) ) ( not ( = ?auto_125419 ?auto_125422 ) ) ( not ( = ?auto_125419 ?auto_125423 ) ) ( not ( = ?auto_125419 ?auto_125424 ) ) ( not ( = ?auto_125419 ?auto_125425 ) ) ( not ( = ?auto_125420 ?auto_125421 ) ) ( not ( = ?auto_125420 ?auto_125422 ) ) ( not ( = ?auto_125420 ?auto_125423 ) ) ( not ( = ?auto_125420 ?auto_125424 ) ) ( not ( = ?auto_125420 ?auto_125425 ) ) ( not ( = ?auto_125421 ?auto_125422 ) ) ( not ( = ?auto_125421 ?auto_125423 ) ) ( not ( = ?auto_125421 ?auto_125424 ) ) ( not ( = ?auto_125421 ?auto_125425 ) ) ( not ( = ?auto_125422 ?auto_125423 ) ) ( not ( = ?auto_125422 ?auto_125424 ) ) ( not ( = ?auto_125422 ?auto_125425 ) ) ( not ( = ?auto_125423 ?auto_125424 ) ) ( not ( = ?auto_125423 ?auto_125425 ) ) ( not ( = ?auto_125424 ?auto_125425 ) ) ( ON ?auto_125425 ?auto_125426 ) ( not ( = ?auto_125418 ?auto_125426 ) ) ( not ( = ?auto_125419 ?auto_125426 ) ) ( not ( = ?auto_125420 ?auto_125426 ) ) ( not ( = ?auto_125421 ?auto_125426 ) ) ( not ( = ?auto_125422 ?auto_125426 ) ) ( not ( = ?auto_125423 ?auto_125426 ) ) ( not ( = ?auto_125424 ?auto_125426 ) ) ( not ( = ?auto_125425 ?auto_125426 ) ) ( CLEAR ?auto_125423 ) ( ON ?auto_125424 ?auto_125425 ) ( CLEAR ?auto_125424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125426 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125426 ?auto_125425 )
      ( MAKE-8PILE ?auto_125418 ?auto_125419 ?auto_125420 ?auto_125421 ?auto_125422 ?auto_125423 ?auto_125424 ?auto_125425 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125427 - BLOCK
      ?auto_125428 - BLOCK
      ?auto_125429 - BLOCK
      ?auto_125430 - BLOCK
      ?auto_125431 - BLOCK
      ?auto_125432 - BLOCK
      ?auto_125433 - BLOCK
      ?auto_125434 - BLOCK
    )
    :vars
    (
      ?auto_125435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125427 ) ( ON ?auto_125428 ?auto_125427 ) ( ON ?auto_125429 ?auto_125428 ) ( ON ?auto_125430 ?auto_125429 ) ( ON ?auto_125431 ?auto_125430 ) ( not ( = ?auto_125427 ?auto_125428 ) ) ( not ( = ?auto_125427 ?auto_125429 ) ) ( not ( = ?auto_125427 ?auto_125430 ) ) ( not ( = ?auto_125427 ?auto_125431 ) ) ( not ( = ?auto_125427 ?auto_125432 ) ) ( not ( = ?auto_125427 ?auto_125433 ) ) ( not ( = ?auto_125427 ?auto_125434 ) ) ( not ( = ?auto_125428 ?auto_125429 ) ) ( not ( = ?auto_125428 ?auto_125430 ) ) ( not ( = ?auto_125428 ?auto_125431 ) ) ( not ( = ?auto_125428 ?auto_125432 ) ) ( not ( = ?auto_125428 ?auto_125433 ) ) ( not ( = ?auto_125428 ?auto_125434 ) ) ( not ( = ?auto_125429 ?auto_125430 ) ) ( not ( = ?auto_125429 ?auto_125431 ) ) ( not ( = ?auto_125429 ?auto_125432 ) ) ( not ( = ?auto_125429 ?auto_125433 ) ) ( not ( = ?auto_125429 ?auto_125434 ) ) ( not ( = ?auto_125430 ?auto_125431 ) ) ( not ( = ?auto_125430 ?auto_125432 ) ) ( not ( = ?auto_125430 ?auto_125433 ) ) ( not ( = ?auto_125430 ?auto_125434 ) ) ( not ( = ?auto_125431 ?auto_125432 ) ) ( not ( = ?auto_125431 ?auto_125433 ) ) ( not ( = ?auto_125431 ?auto_125434 ) ) ( not ( = ?auto_125432 ?auto_125433 ) ) ( not ( = ?auto_125432 ?auto_125434 ) ) ( not ( = ?auto_125433 ?auto_125434 ) ) ( ON ?auto_125434 ?auto_125435 ) ( not ( = ?auto_125427 ?auto_125435 ) ) ( not ( = ?auto_125428 ?auto_125435 ) ) ( not ( = ?auto_125429 ?auto_125435 ) ) ( not ( = ?auto_125430 ?auto_125435 ) ) ( not ( = ?auto_125431 ?auto_125435 ) ) ( not ( = ?auto_125432 ?auto_125435 ) ) ( not ( = ?auto_125433 ?auto_125435 ) ) ( not ( = ?auto_125434 ?auto_125435 ) ) ( ON ?auto_125433 ?auto_125434 ) ( CLEAR ?auto_125433 ) ( ON-TABLE ?auto_125435 ) ( HOLDING ?auto_125432 ) ( CLEAR ?auto_125431 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125427 ?auto_125428 ?auto_125429 ?auto_125430 ?auto_125431 ?auto_125432 )
      ( MAKE-8PILE ?auto_125427 ?auto_125428 ?auto_125429 ?auto_125430 ?auto_125431 ?auto_125432 ?auto_125433 ?auto_125434 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125436 - BLOCK
      ?auto_125437 - BLOCK
      ?auto_125438 - BLOCK
      ?auto_125439 - BLOCK
      ?auto_125440 - BLOCK
      ?auto_125441 - BLOCK
      ?auto_125442 - BLOCK
      ?auto_125443 - BLOCK
    )
    :vars
    (
      ?auto_125444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125436 ) ( ON ?auto_125437 ?auto_125436 ) ( ON ?auto_125438 ?auto_125437 ) ( ON ?auto_125439 ?auto_125438 ) ( ON ?auto_125440 ?auto_125439 ) ( not ( = ?auto_125436 ?auto_125437 ) ) ( not ( = ?auto_125436 ?auto_125438 ) ) ( not ( = ?auto_125436 ?auto_125439 ) ) ( not ( = ?auto_125436 ?auto_125440 ) ) ( not ( = ?auto_125436 ?auto_125441 ) ) ( not ( = ?auto_125436 ?auto_125442 ) ) ( not ( = ?auto_125436 ?auto_125443 ) ) ( not ( = ?auto_125437 ?auto_125438 ) ) ( not ( = ?auto_125437 ?auto_125439 ) ) ( not ( = ?auto_125437 ?auto_125440 ) ) ( not ( = ?auto_125437 ?auto_125441 ) ) ( not ( = ?auto_125437 ?auto_125442 ) ) ( not ( = ?auto_125437 ?auto_125443 ) ) ( not ( = ?auto_125438 ?auto_125439 ) ) ( not ( = ?auto_125438 ?auto_125440 ) ) ( not ( = ?auto_125438 ?auto_125441 ) ) ( not ( = ?auto_125438 ?auto_125442 ) ) ( not ( = ?auto_125438 ?auto_125443 ) ) ( not ( = ?auto_125439 ?auto_125440 ) ) ( not ( = ?auto_125439 ?auto_125441 ) ) ( not ( = ?auto_125439 ?auto_125442 ) ) ( not ( = ?auto_125439 ?auto_125443 ) ) ( not ( = ?auto_125440 ?auto_125441 ) ) ( not ( = ?auto_125440 ?auto_125442 ) ) ( not ( = ?auto_125440 ?auto_125443 ) ) ( not ( = ?auto_125441 ?auto_125442 ) ) ( not ( = ?auto_125441 ?auto_125443 ) ) ( not ( = ?auto_125442 ?auto_125443 ) ) ( ON ?auto_125443 ?auto_125444 ) ( not ( = ?auto_125436 ?auto_125444 ) ) ( not ( = ?auto_125437 ?auto_125444 ) ) ( not ( = ?auto_125438 ?auto_125444 ) ) ( not ( = ?auto_125439 ?auto_125444 ) ) ( not ( = ?auto_125440 ?auto_125444 ) ) ( not ( = ?auto_125441 ?auto_125444 ) ) ( not ( = ?auto_125442 ?auto_125444 ) ) ( not ( = ?auto_125443 ?auto_125444 ) ) ( ON ?auto_125442 ?auto_125443 ) ( ON-TABLE ?auto_125444 ) ( CLEAR ?auto_125440 ) ( ON ?auto_125441 ?auto_125442 ) ( CLEAR ?auto_125441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125444 ?auto_125443 ?auto_125442 )
      ( MAKE-8PILE ?auto_125436 ?auto_125437 ?auto_125438 ?auto_125439 ?auto_125440 ?auto_125441 ?auto_125442 ?auto_125443 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125445 - BLOCK
      ?auto_125446 - BLOCK
      ?auto_125447 - BLOCK
      ?auto_125448 - BLOCK
      ?auto_125449 - BLOCK
      ?auto_125450 - BLOCK
      ?auto_125451 - BLOCK
      ?auto_125452 - BLOCK
    )
    :vars
    (
      ?auto_125453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125445 ) ( ON ?auto_125446 ?auto_125445 ) ( ON ?auto_125447 ?auto_125446 ) ( ON ?auto_125448 ?auto_125447 ) ( not ( = ?auto_125445 ?auto_125446 ) ) ( not ( = ?auto_125445 ?auto_125447 ) ) ( not ( = ?auto_125445 ?auto_125448 ) ) ( not ( = ?auto_125445 ?auto_125449 ) ) ( not ( = ?auto_125445 ?auto_125450 ) ) ( not ( = ?auto_125445 ?auto_125451 ) ) ( not ( = ?auto_125445 ?auto_125452 ) ) ( not ( = ?auto_125446 ?auto_125447 ) ) ( not ( = ?auto_125446 ?auto_125448 ) ) ( not ( = ?auto_125446 ?auto_125449 ) ) ( not ( = ?auto_125446 ?auto_125450 ) ) ( not ( = ?auto_125446 ?auto_125451 ) ) ( not ( = ?auto_125446 ?auto_125452 ) ) ( not ( = ?auto_125447 ?auto_125448 ) ) ( not ( = ?auto_125447 ?auto_125449 ) ) ( not ( = ?auto_125447 ?auto_125450 ) ) ( not ( = ?auto_125447 ?auto_125451 ) ) ( not ( = ?auto_125447 ?auto_125452 ) ) ( not ( = ?auto_125448 ?auto_125449 ) ) ( not ( = ?auto_125448 ?auto_125450 ) ) ( not ( = ?auto_125448 ?auto_125451 ) ) ( not ( = ?auto_125448 ?auto_125452 ) ) ( not ( = ?auto_125449 ?auto_125450 ) ) ( not ( = ?auto_125449 ?auto_125451 ) ) ( not ( = ?auto_125449 ?auto_125452 ) ) ( not ( = ?auto_125450 ?auto_125451 ) ) ( not ( = ?auto_125450 ?auto_125452 ) ) ( not ( = ?auto_125451 ?auto_125452 ) ) ( ON ?auto_125452 ?auto_125453 ) ( not ( = ?auto_125445 ?auto_125453 ) ) ( not ( = ?auto_125446 ?auto_125453 ) ) ( not ( = ?auto_125447 ?auto_125453 ) ) ( not ( = ?auto_125448 ?auto_125453 ) ) ( not ( = ?auto_125449 ?auto_125453 ) ) ( not ( = ?auto_125450 ?auto_125453 ) ) ( not ( = ?auto_125451 ?auto_125453 ) ) ( not ( = ?auto_125452 ?auto_125453 ) ) ( ON ?auto_125451 ?auto_125452 ) ( ON-TABLE ?auto_125453 ) ( ON ?auto_125450 ?auto_125451 ) ( CLEAR ?auto_125450 ) ( HOLDING ?auto_125449 ) ( CLEAR ?auto_125448 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125445 ?auto_125446 ?auto_125447 ?auto_125448 ?auto_125449 )
      ( MAKE-8PILE ?auto_125445 ?auto_125446 ?auto_125447 ?auto_125448 ?auto_125449 ?auto_125450 ?auto_125451 ?auto_125452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125454 - BLOCK
      ?auto_125455 - BLOCK
      ?auto_125456 - BLOCK
      ?auto_125457 - BLOCK
      ?auto_125458 - BLOCK
      ?auto_125459 - BLOCK
      ?auto_125460 - BLOCK
      ?auto_125461 - BLOCK
    )
    :vars
    (
      ?auto_125462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125454 ) ( ON ?auto_125455 ?auto_125454 ) ( ON ?auto_125456 ?auto_125455 ) ( ON ?auto_125457 ?auto_125456 ) ( not ( = ?auto_125454 ?auto_125455 ) ) ( not ( = ?auto_125454 ?auto_125456 ) ) ( not ( = ?auto_125454 ?auto_125457 ) ) ( not ( = ?auto_125454 ?auto_125458 ) ) ( not ( = ?auto_125454 ?auto_125459 ) ) ( not ( = ?auto_125454 ?auto_125460 ) ) ( not ( = ?auto_125454 ?auto_125461 ) ) ( not ( = ?auto_125455 ?auto_125456 ) ) ( not ( = ?auto_125455 ?auto_125457 ) ) ( not ( = ?auto_125455 ?auto_125458 ) ) ( not ( = ?auto_125455 ?auto_125459 ) ) ( not ( = ?auto_125455 ?auto_125460 ) ) ( not ( = ?auto_125455 ?auto_125461 ) ) ( not ( = ?auto_125456 ?auto_125457 ) ) ( not ( = ?auto_125456 ?auto_125458 ) ) ( not ( = ?auto_125456 ?auto_125459 ) ) ( not ( = ?auto_125456 ?auto_125460 ) ) ( not ( = ?auto_125456 ?auto_125461 ) ) ( not ( = ?auto_125457 ?auto_125458 ) ) ( not ( = ?auto_125457 ?auto_125459 ) ) ( not ( = ?auto_125457 ?auto_125460 ) ) ( not ( = ?auto_125457 ?auto_125461 ) ) ( not ( = ?auto_125458 ?auto_125459 ) ) ( not ( = ?auto_125458 ?auto_125460 ) ) ( not ( = ?auto_125458 ?auto_125461 ) ) ( not ( = ?auto_125459 ?auto_125460 ) ) ( not ( = ?auto_125459 ?auto_125461 ) ) ( not ( = ?auto_125460 ?auto_125461 ) ) ( ON ?auto_125461 ?auto_125462 ) ( not ( = ?auto_125454 ?auto_125462 ) ) ( not ( = ?auto_125455 ?auto_125462 ) ) ( not ( = ?auto_125456 ?auto_125462 ) ) ( not ( = ?auto_125457 ?auto_125462 ) ) ( not ( = ?auto_125458 ?auto_125462 ) ) ( not ( = ?auto_125459 ?auto_125462 ) ) ( not ( = ?auto_125460 ?auto_125462 ) ) ( not ( = ?auto_125461 ?auto_125462 ) ) ( ON ?auto_125460 ?auto_125461 ) ( ON-TABLE ?auto_125462 ) ( ON ?auto_125459 ?auto_125460 ) ( CLEAR ?auto_125457 ) ( ON ?auto_125458 ?auto_125459 ) ( CLEAR ?auto_125458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125462 ?auto_125461 ?auto_125460 ?auto_125459 )
      ( MAKE-8PILE ?auto_125454 ?auto_125455 ?auto_125456 ?auto_125457 ?auto_125458 ?auto_125459 ?auto_125460 ?auto_125461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125463 - BLOCK
      ?auto_125464 - BLOCK
      ?auto_125465 - BLOCK
      ?auto_125466 - BLOCK
      ?auto_125467 - BLOCK
      ?auto_125468 - BLOCK
      ?auto_125469 - BLOCK
      ?auto_125470 - BLOCK
    )
    :vars
    (
      ?auto_125471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125463 ) ( ON ?auto_125464 ?auto_125463 ) ( ON ?auto_125465 ?auto_125464 ) ( not ( = ?auto_125463 ?auto_125464 ) ) ( not ( = ?auto_125463 ?auto_125465 ) ) ( not ( = ?auto_125463 ?auto_125466 ) ) ( not ( = ?auto_125463 ?auto_125467 ) ) ( not ( = ?auto_125463 ?auto_125468 ) ) ( not ( = ?auto_125463 ?auto_125469 ) ) ( not ( = ?auto_125463 ?auto_125470 ) ) ( not ( = ?auto_125464 ?auto_125465 ) ) ( not ( = ?auto_125464 ?auto_125466 ) ) ( not ( = ?auto_125464 ?auto_125467 ) ) ( not ( = ?auto_125464 ?auto_125468 ) ) ( not ( = ?auto_125464 ?auto_125469 ) ) ( not ( = ?auto_125464 ?auto_125470 ) ) ( not ( = ?auto_125465 ?auto_125466 ) ) ( not ( = ?auto_125465 ?auto_125467 ) ) ( not ( = ?auto_125465 ?auto_125468 ) ) ( not ( = ?auto_125465 ?auto_125469 ) ) ( not ( = ?auto_125465 ?auto_125470 ) ) ( not ( = ?auto_125466 ?auto_125467 ) ) ( not ( = ?auto_125466 ?auto_125468 ) ) ( not ( = ?auto_125466 ?auto_125469 ) ) ( not ( = ?auto_125466 ?auto_125470 ) ) ( not ( = ?auto_125467 ?auto_125468 ) ) ( not ( = ?auto_125467 ?auto_125469 ) ) ( not ( = ?auto_125467 ?auto_125470 ) ) ( not ( = ?auto_125468 ?auto_125469 ) ) ( not ( = ?auto_125468 ?auto_125470 ) ) ( not ( = ?auto_125469 ?auto_125470 ) ) ( ON ?auto_125470 ?auto_125471 ) ( not ( = ?auto_125463 ?auto_125471 ) ) ( not ( = ?auto_125464 ?auto_125471 ) ) ( not ( = ?auto_125465 ?auto_125471 ) ) ( not ( = ?auto_125466 ?auto_125471 ) ) ( not ( = ?auto_125467 ?auto_125471 ) ) ( not ( = ?auto_125468 ?auto_125471 ) ) ( not ( = ?auto_125469 ?auto_125471 ) ) ( not ( = ?auto_125470 ?auto_125471 ) ) ( ON ?auto_125469 ?auto_125470 ) ( ON-TABLE ?auto_125471 ) ( ON ?auto_125468 ?auto_125469 ) ( ON ?auto_125467 ?auto_125468 ) ( CLEAR ?auto_125467 ) ( HOLDING ?auto_125466 ) ( CLEAR ?auto_125465 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125463 ?auto_125464 ?auto_125465 ?auto_125466 )
      ( MAKE-8PILE ?auto_125463 ?auto_125464 ?auto_125465 ?auto_125466 ?auto_125467 ?auto_125468 ?auto_125469 ?auto_125470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125472 - BLOCK
      ?auto_125473 - BLOCK
      ?auto_125474 - BLOCK
      ?auto_125475 - BLOCK
      ?auto_125476 - BLOCK
      ?auto_125477 - BLOCK
      ?auto_125478 - BLOCK
      ?auto_125479 - BLOCK
    )
    :vars
    (
      ?auto_125480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125472 ) ( ON ?auto_125473 ?auto_125472 ) ( ON ?auto_125474 ?auto_125473 ) ( not ( = ?auto_125472 ?auto_125473 ) ) ( not ( = ?auto_125472 ?auto_125474 ) ) ( not ( = ?auto_125472 ?auto_125475 ) ) ( not ( = ?auto_125472 ?auto_125476 ) ) ( not ( = ?auto_125472 ?auto_125477 ) ) ( not ( = ?auto_125472 ?auto_125478 ) ) ( not ( = ?auto_125472 ?auto_125479 ) ) ( not ( = ?auto_125473 ?auto_125474 ) ) ( not ( = ?auto_125473 ?auto_125475 ) ) ( not ( = ?auto_125473 ?auto_125476 ) ) ( not ( = ?auto_125473 ?auto_125477 ) ) ( not ( = ?auto_125473 ?auto_125478 ) ) ( not ( = ?auto_125473 ?auto_125479 ) ) ( not ( = ?auto_125474 ?auto_125475 ) ) ( not ( = ?auto_125474 ?auto_125476 ) ) ( not ( = ?auto_125474 ?auto_125477 ) ) ( not ( = ?auto_125474 ?auto_125478 ) ) ( not ( = ?auto_125474 ?auto_125479 ) ) ( not ( = ?auto_125475 ?auto_125476 ) ) ( not ( = ?auto_125475 ?auto_125477 ) ) ( not ( = ?auto_125475 ?auto_125478 ) ) ( not ( = ?auto_125475 ?auto_125479 ) ) ( not ( = ?auto_125476 ?auto_125477 ) ) ( not ( = ?auto_125476 ?auto_125478 ) ) ( not ( = ?auto_125476 ?auto_125479 ) ) ( not ( = ?auto_125477 ?auto_125478 ) ) ( not ( = ?auto_125477 ?auto_125479 ) ) ( not ( = ?auto_125478 ?auto_125479 ) ) ( ON ?auto_125479 ?auto_125480 ) ( not ( = ?auto_125472 ?auto_125480 ) ) ( not ( = ?auto_125473 ?auto_125480 ) ) ( not ( = ?auto_125474 ?auto_125480 ) ) ( not ( = ?auto_125475 ?auto_125480 ) ) ( not ( = ?auto_125476 ?auto_125480 ) ) ( not ( = ?auto_125477 ?auto_125480 ) ) ( not ( = ?auto_125478 ?auto_125480 ) ) ( not ( = ?auto_125479 ?auto_125480 ) ) ( ON ?auto_125478 ?auto_125479 ) ( ON-TABLE ?auto_125480 ) ( ON ?auto_125477 ?auto_125478 ) ( ON ?auto_125476 ?auto_125477 ) ( CLEAR ?auto_125474 ) ( ON ?auto_125475 ?auto_125476 ) ( CLEAR ?auto_125475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125480 ?auto_125479 ?auto_125478 ?auto_125477 ?auto_125476 )
      ( MAKE-8PILE ?auto_125472 ?auto_125473 ?auto_125474 ?auto_125475 ?auto_125476 ?auto_125477 ?auto_125478 ?auto_125479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125481 - BLOCK
      ?auto_125482 - BLOCK
      ?auto_125483 - BLOCK
      ?auto_125484 - BLOCK
      ?auto_125485 - BLOCK
      ?auto_125486 - BLOCK
      ?auto_125487 - BLOCK
      ?auto_125488 - BLOCK
    )
    :vars
    (
      ?auto_125489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125481 ) ( ON ?auto_125482 ?auto_125481 ) ( not ( = ?auto_125481 ?auto_125482 ) ) ( not ( = ?auto_125481 ?auto_125483 ) ) ( not ( = ?auto_125481 ?auto_125484 ) ) ( not ( = ?auto_125481 ?auto_125485 ) ) ( not ( = ?auto_125481 ?auto_125486 ) ) ( not ( = ?auto_125481 ?auto_125487 ) ) ( not ( = ?auto_125481 ?auto_125488 ) ) ( not ( = ?auto_125482 ?auto_125483 ) ) ( not ( = ?auto_125482 ?auto_125484 ) ) ( not ( = ?auto_125482 ?auto_125485 ) ) ( not ( = ?auto_125482 ?auto_125486 ) ) ( not ( = ?auto_125482 ?auto_125487 ) ) ( not ( = ?auto_125482 ?auto_125488 ) ) ( not ( = ?auto_125483 ?auto_125484 ) ) ( not ( = ?auto_125483 ?auto_125485 ) ) ( not ( = ?auto_125483 ?auto_125486 ) ) ( not ( = ?auto_125483 ?auto_125487 ) ) ( not ( = ?auto_125483 ?auto_125488 ) ) ( not ( = ?auto_125484 ?auto_125485 ) ) ( not ( = ?auto_125484 ?auto_125486 ) ) ( not ( = ?auto_125484 ?auto_125487 ) ) ( not ( = ?auto_125484 ?auto_125488 ) ) ( not ( = ?auto_125485 ?auto_125486 ) ) ( not ( = ?auto_125485 ?auto_125487 ) ) ( not ( = ?auto_125485 ?auto_125488 ) ) ( not ( = ?auto_125486 ?auto_125487 ) ) ( not ( = ?auto_125486 ?auto_125488 ) ) ( not ( = ?auto_125487 ?auto_125488 ) ) ( ON ?auto_125488 ?auto_125489 ) ( not ( = ?auto_125481 ?auto_125489 ) ) ( not ( = ?auto_125482 ?auto_125489 ) ) ( not ( = ?auto_125483 ?auto_125489 ) ) ( not ( = ?auto_125484 ?auto_125489 ) ) ( not ( = ?auto_125485 ?auto_125489 ) ) ( not ( = ?auto_125486 ?auto_125489 ) ) ( not ( = ?auto_125487 ?auto_125489 ) ) ( not ( = ?auto_125488 ?auto_125489 ) ) ( ON ?auto_125487 ?auto_125488 ) ( ON-TABLE ?auto_125489 ) ( ON ?auto_125486 ?auto_125487 ) ( ON ?auto_125485 ?auto_125486 ) ( ON ?auto_125484 ?auto_125485 ) ( CLEAR ?auto_125484 ) ( HOLDING ?auto_125483 ) ( CLEAR ?auto_125482 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125481 ?auto_125482 ?auto_125483 )
      ( MAKE-8PILE ?auto_125481 ?auto_125482 ?auto_125483 ?auto_125484 ?auto_125485 ?auto_125486 ?auto_125487 ?auto_125488 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125490 - BLOCK
      ?auto_125491 - BLOCK
      ?auto_125492 - BLOCK
      ?auto_125493 - BLOCK
      ?auto_125494 - BLOCK
      ?auto_125495 - BLOCK
      ?auto_125496 - BLOCK
      ?auto_125497 - BLOCK
    )
    :vars
    (
      ?auto_125498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125490 ) ( ON ?auto_125491 ?auto_125490 ) ( not ( = ?auto_125490 ?auto_125491 ) ) ( not ( = ?auto_125490 ?auto_125492 ) ) ( not ( = ?auto_125490 ?auto_125493 ) ) ( not ( = ?auto_125490 ?auto_125494 ) ) ( not ( = ?auto_125490 ?auto_125495 ) ) ( not ( = ?auto_125490 ?auto_125496 ) ) ( not ( = ?auto_125490 ?auto_125497 ) ) ( not ( = ?auto_125491 ?auto_125492 ) ) ( not ( = ?auto_125491 ?auto_125493 ) ) ( not ( = ?auto_125491 ?auto_125494 ) ) ( not ( = ?auto_125491 ?auto_125495 ) ) ( not ( = ?auto_125491 ?auto_125496 ) ) ( not ( = ?auto_125491 ?auto_125497 ) ) ( not ( = ?auto_125492 ?auto_125493 ) ) ( not ( = ?auto_125492 ?auto_125494 ) ) ( not ( = ?auto_125492 ?auto_125495 ) ) ( not ( = ?auto_125492 ?auto_125496 ) ) ( not ( = ?auto_125492 ?auto_125497 ) ) ( not ( = ?auto_125493 ?auto_125494 ) ) ( not ( = ?auto_125493 ?auto_125495 ) ) ( not ( = ?auto_125493 ?auto_125496 ) ) ( not ( = ?auto_125493 ?auto_125497 ) ) ( not ( = ?auto_125494 ?auto_125495 ) ) ( not ( = ?auto_125494 ?auto_125496 ) ) ( not ( = ?auto_125494 ?auto_125497 ) ) ( not ( = ?auto_125495 ?auto_125496 ) ) ( not ( = ?auto_125495 ?auto_125497 ) ) ( not ( = ?auto_125496 ?auto_125497 ) ) ( ON ?auto_125497 ?auto_125498 ) ( not ( = ?auto_125490 ?auto_125498 ) ) ( not ( = ?auto_125491 ?auto_125498 ) ) ( not ( = ?auto_125492 ?auto_125498 ) ) ( not ( = ?auto_125493 ?auto_125498 ) ) ( not ( = ?auto_125494 ?auto_125498 ) ) ( not ( = ?auto_125495 ?auto_125498 ) ) ( not ( = ?auto_125496 ?auto_125498 ) ) ( not ( = ?auto_125497 ?auto_125498 ) ) ( ON ?auto_125496 ?auto_125497 ) ( ON-TABLE ?auto_125498 ) ( ON ?auto_125495 ?auto_125496 ) ( ON ?auto_125494 ?auto_125495 ) ( ON ?auto_125493 ?auto_125494 ) ( CLEAR ?auto_125491 ) ( ON ?auto_125492 ?auto_125493 ) ( CLEAR ?auto_125492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125498 ?auto_125497 ?auto_125496 ?auto_125495 ?auto_125494 ?auto_125493 )
      ( MAKE-8PILE ?auto_125490 ?auto_125491 ?auto_125492 ?auto_125493 ?auto_125494 ?auto_125495 ?auto_125496 ?auto_125497 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125499 - BLOCK
      ?auto_125500 - BLOCK
      ?auto_125501 - BLOCK
      ?auto_125502 - BLOCK
      ?auto_125503 - BLOCK
      ?auto_125504 - BLOCK
      ?auto_125505 - BLOCK
      ?auto_125506 - BLOCK
    )
    :vars
    (
      ?auto_125507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125499 ) ( not ( = ?auto_125499 ?auto_125500 ) ) ( not ( = ?auto_125499 ?auto_125501 ) ) ( not ( = ?auto_125499 ?auto_125502 ) ) ( not ( = ?auto_125499 ?auto_125503 ) ) ( not ( = ?auto_125499 ?auto_125504 ) ) ( not ( = ?auto_125499 ?auto_125505 ) ) ( not ( = ?auto_125499 ?auto_125506 ) ) ( not ( = ?auto_125500 ?auto_125501 ) ) ( not ( = ?auto_125500 ?auto_125502 ) ) ( not ( = ?auto_125500 ?auto_125503 ) ) ( not ( = ?auto_125500 ?auto_125504 ) ) ( not ( = ?auto_125500 ?auto_125505 ) ) ( not ( = ?auto_125500 ?auto_125506 ) ) ( not ( = ?auto_125501 ?auto_125502 ) ) ( not ( = ?auto_125501 ?auto_125503 ) ) ( not ( = ?auto_125501 ?auto_125504 ) ) ( not ( = ?auto_125501 ?auto_125505 ) ) ( not ( = ?auto_125501 ?auto_125506 ) ) ( not ( = ?auto_125502 ?auto_125503 ) ) ( not ( = ?auto_125502 ?auto_125504 ) ) ( not ( = ?auto_125502 ?auto_125505 ) ) ( not ( = ?auto_125502 ?auto_125506 ) ) ( not ( = ?auto_125503 ?auto_125504 ) ) ( not ( = ?auto_125503 ?auto_125505 ) ) ( not ( = ?auto_125503 ?auto_125506 ) ) ( not ( = ?auto_125504 ?auto_125505 ) ) ( not ( = ?auto_125504 ?auto_125506 ) ) ( not ( = ?auto_125505 ?auto_125506 ) ) ( ON ?auto_125506 ?auto_125507 ) ( not ( = ?auto_125499 ?auto_125507 ) ) ( not ( = ?auto_125500 ?auto_125507 ) ) ( not ( = ?auto_125501 ?auto_125507 ) ) ( not ( = ?auto_125502 ?auto_125507 ) ) ( not ( = ?auto_125503 ?auto_125507 ) ) ( not ( = ?auto_125504 ?auto_125507 ) ) ( not ( = ?auto_125505 ?auto_125507 ) ) ( not ( = ?auto_125506 ?auto_125507 ) ) ( ON ?auto_125505 ?auto_125506 ) ( ON-TABLE ?auto_125507 ) ( ON ?auto_125504 ?auto_125505 ) ( ON ?auto_125503 ?auto_125504 ) ( ON ?auto_125502 ?auto_125503 ) ( ON ?auto_125501 ?auto_125502 ) ( CLEAR ?auto_125501 ) ( HOLDING ?auto_125500 ) ( CLEAR ?auto_125499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125499 ?auto_125500 )
      ( MAKE-8PILE ?auto_125499 ?auto_125500 ?auto_125501 ?auto_125502 ?auto_125503 ?auto_125504 ?auto_125505 ?auto_125506 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125508 - BLOCK
      ?auto_125509 - BLOCK
      ?auto_125510 - BLOCK
      ?auto_125511 - BLOCK
      ?auto_125512 - BLOCK
      ?auto_125513 - BLOCK
      ?auto_125514 - BLOCK
      ?auto_125515 - BLOCK
    )
    :vars
    (
      ?auto_125516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125508 ) ( not ( = ?auto_125508 ?auto_125509 ) ) ( not ( = ?auto_125508 ?auto_125510 ) ) ( not ( = ?auto_125508 ?auto_125511 ) ) ( not ( = ?auto_125508 ?auto_125512 ) ) ( not ( = ?auto_125508 ?auto_125513 ) ) ( not ( = ?auto_125508 ?auto_125514 ) ) ( not ( = ?auto_125508 ?auto_125515 ) ) ( not ( = ?auto_125509 ?auto_125510 ) ) ( not ( = ?auto_125509 ?auto_125511 ) ) ( not ( = ?auto_125509 ?auto_125512 ) ) ( not ( = ?auto_125509 ?auto_125513 ) ) ( not ( = ?auto_125509 ?auto_125514 ) ) ( not ( = ?auto_125509 ?auto_125515 ) ) ( not ( = ?auto_125510 ?auto_125511 ) ) ( not ( = ?auto_125510 ?auto_125512 ) ) ( not ( = ?auto_125510 ?auto_125513 ) ) ( not ( = ?auto_125510 ?auto_125514 ) ) ( not ( = ?auto_125510 ?auto_125515 ) ) ( not ( = ?auto_125511 ?auto_125512 ) ) ( not ( = ?auto_125511 ?auto_125513 ) ) ( not ( = ?auto_125511 ?auto_125514 ) ) ( not ( = ?auto_125511 ?auto_125515 ) ) ( not ( = ?auto_125512 ?auto_125513 ) ) ( not ( = ?auto_125512 ?auto_125514 ) ) ( not ( = ?auto_125512 ?auto_125515 ) ) ( not ( = ?auto_125513 ?auto_125514 ) ) ( not ( = ?auto_125513 ?auto_125515 ) ) ( not ( = ?auto_125514 ?auto_125515 ) ) ( ON ?auto_125515 ?auto_125516 ) ( not ( = ?auto_125508 ?auto_125516 ) ) ( not ( = ?auto_125509 ?auto_125516 ) ) ( not ( = ?auto_125510 ?auto_125516 ) ) ( not ( = ?auto_125511 ?auto_125516 ) ) ( not ( = ?auto_125512 ?auto_125516 ) ) ( not ( = ?auto_125513 ?auto_125516 ) ) ( not ( = ?auto_125514 ?auto_125516 ) ) ( not ( = ?auto_125515 ?auto_125516 ) ) ( ON ?auto_125514 ?auto_125515 ) ( ON-TABLE ?auto_125516 ) ( ON ?auto_125513 ?auto_125514 ) ( ON ?auto_125512 ?auto_125513 ) ( ON ?auto_125511 ?auto_125512 ) ( ON ?auto_125510 ?auto_125511 ) ( CLEAR ?auto_125508 ) ( ON ?auto_125509 ?auto_125510 ) ( CLEAR ?auto_125509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125516 ?auto_125515 ?auto_125514 ?auto_125513 ?auto_125512 ?auto_125511 ?auto_125510 )
      ( MAKE-8PILE ?auto_125508 ?auto_125509 ?auto_125510 ?auto_125511 ?auto_125512 ?auto_125513 ?auto_125514 ?auto_125515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125517 - BLOCK
      ?auto_125518 - BLOCK
      ?auto_125519 - BLOCK
      ?auto_125520 - BLOCK
      ?auto_125521 - BLOCK
      ?auto_125522 - BLOCK
      ?auto_125523 - BLOCK
      ?auto_125524 - BLOCK
    )
    :vars
    (
      ?auto_125525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125517 ?auto_125518 ) ) ( not ( = ?auto_125517 ?auto_125519 ) ) ( not ( = ?auto_125517 ?auto_125520 ) ) ( not ( = ?auto_125517 ?auto_125521 ) ) ( not ( = ?auto_125517 ?auto_125522 ) ) ( not ( = ?auto_125517 ?auto_125523 ) ) ( not ( = ?auto_125517 ?auto_125524 ) ) ( not ( = ?auto_125518 ?auto_125519 ) ) ( not ( = ?auto_125518 ?auto_125520 ) ) ( not ( = ?auto_125518 ?auto_125521 ) ) ( not ( = ?auto_125518 ?auto_125522 ) ) ( not ( = ?auto_125518 ?auto_125523 ) ) ( not ( = ?auto_125518 ?auto_125524 ) ) ( not ( = ?auto_125519 ?auto_125520 ) ) ( not ( = ?auto_125519 ?auto_125521 ) ) ( not ( = ?auto_125519 ?auto_125522 ) ) ( not ( = ?auto_125519 ?auto_125523 ) ) ( not ( = ?auto_125519 ?auto_125524 ) ) ( not ( = ?auto_125520 ?auto_125521 ) ) ( not ( = ?auto_125520 ?auto_125522 ) ) ( not ( = ?auto_125520 ?auto_125523 ) ) ( not ( = ?auto_125520 ?auto_125524 ) ) ( not ( = ?auto_125521 ?auto_125522 ) ) ( not ( = ?auto_125521 ?auto_125523 ) ) ( not ( = ?auto_125521 ?auto_125524 ) ) ( not ( = ?auto_125522 ?auto_125523 ) ) ( not ( = ?auto_125522 ?auto_125524 ) ) ( not ( = ?auto_125523 ?auto_125524 ) ) ( ON ?auto_125524 ?auto_125525 ) ( not ( = ?auto_125517 ?auto_125525 ) ) ( not ( = ?auto_125518 ?auto_125525 ) ) ( not ( = ?auto_125519 ?auto_125525 ) ) ( not ( = ?auto_125520 ?auto_125525 ) ) ( not ( = ?auto_125521 ?auto_125525 ) ) ( not ( = ?auto_125522 ?auto_125525 ) ) ( not ( = ?auto_125523 ?auto_125525 ) ) ( not ( = ?auto_125524 ?auto_125525 ) ) ( ON ?auto_125523 ?auto_125524 ) ( ON-TABLE ?auto_125525 ) ( ON ?auto_125522 ?auto_125523 ) ( ON ?auto_125521 ?auto_125522 ) ( ON ?auto_125520 ?auto_125521 ) ( ON ?auto_125519 ?auto_125520 ) ( ON ?auto_125518 ?auto_125519 ) ( CLEAR ?auto_125518 ) ( HOLDING ?auto_125517 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125517 )
      ( MAKE-8PILE ?auto_125517 ?auto_125518 ?auto_125519 ?auto_125520 ?auto_125521 ?auto_125522 ?auto_125523 ?auto_125524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_125526 - BLOCK
      ?auto_125527 - BLOCK
      ?auto_125528 - BLOCK
      ?auto_125529 - BLOCK
      ?auto_125530 - BLOCK
      ?auto_125531 - BLOCK
      ?auto_125532 - BLOCK
      ?auto_125533 - BLOCK
    )
    :vars
    (
      ?auto_125534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125526 ?auto_125527 ) ) ( not ( = ?auto_125526 ?auto_125528 ) ) ( not ( = ?auto_125526 ?auto_125529 ) ) ( not ( = ?auto_125526 ?auto_125530 ) ) ( not ( = ?auto_125526 ?auto_125531 ) ) ( not ( = ?auto_125526 ?auto_125532 ) ) ( not ( = ?auto_125526 ?auto_125533 ) ) ( not ( = ?auto_125527 ?auto_125528 ) ) ( not ( = ?auto_125527 ?auto_125529 ) ) ( not ( = ?auto_125527 ?auto_125530 ) ) ( not ( = ?auto_125527 ?auto_125531 ) ) ( not ( = ?auto_125527 ?auto_125532 ) ) ( not ( = ?auto_125527 ?auto_125533 ) ) ( not ( = ?auto_125528 ?auto_125529 ) ) ( not ( = ?auto_125528 ?auto_125530 ) ) ( not ( = ?auto_125528 ?auto_125531 ) ) ( not ( = ?auto_125528 ?auto_125532 ) ) ( not ( = ?auto_125528 ?auto_125533 ) ) ( not ( = ?auto_125529 ?auto_125530 ) ) ( not ( = ?auto_125529 ?auto_125531 ) ) ( not ( = ?auto_125529 ?auto_125532 ) ) ( not ( = ?auto_125529 ?auto_125533 ) ) ( not ( = ?auto_125530 ?auto_125531 ) ) ( not ( = ?auto_125530 ?auto_125532 ) ) ( not ( = ?auto_125530 ?auto_125533 ) ) ( not ( = ?auto_125531 ?auto_125532 ) ) ( not ( = ?auto_125531 ?auto_125533 ) ) ( not ( = ?auto_125532 ?auto_125533 ) ) ( ON ?auto_125533 ?auto_125534 ) ( not ( = ?auto_125526 ?auto_125534 ) ) ( not ( = ?auto_125527 ?auto_125534 ) ) ( not ( = ?auto_125528 ?auto_125534 ) ) ( not ( = ?auto_125529 ?auto_125534 ) ) ( not ( = ?auto_125530 ?auto_125534 ) ) ( not ( = ?auto_125531 ?auto_125534 ) ) ( not ( = ?auto_125532 ?auto_125534 ) ) ( not ( = ?auto_125533 ?auto_125534 ) ) ( ON ?auto_125532 ?auto_125533 ) ( ON-TABLE ?auto_125534 ) ( ON ?auto_125531 ?auto_125532 ) ( ON ?auto_125530 ?auto_125531 ) ( ON ?auto_125529 ?auto_125530 ) ( ON ?auto_125528 ?auto_125529 ) ( ON ?auto_125527 ?auto_125528 ) ( ON ?auto_125526 ?auto_125527 ) ( CLEAR ?auto_125526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125534 ?auto_125533 ?auto_125532 ?auto_125531 ?auto_125530 ?auto_125529 ?auto_125528 ?auto_125527 )
      ( MAKE-8PILE ?auto_125526 ?auto_125527 ?auto_125528 ?auto_125529 ?auto_125530 ?auto_125531 ?auto_125532 ?auto_125533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125671 - BLOCK
    )
    :vars
    (
      ?auto_125672 - BLOCK
      ?auto_125673 - BLOCK
      ?auto_125674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125671 ?auto_125672 ) ( CLEAR ?auto_125671 ) ( not ( = ?auto_125671 ?auto_125672 ) ) ( HOLDING ?auto_125673 ) ( CLEAR ?auto_125674 ) ( not ( = ?auto_125671 ?auto_125673 ) ) ( not ( = ?auto_125671 ?auto_125674 ) ) ( not ( = ?auto_125672 ?auto_125673 ) ) ( not ( = ?auto_125672 ?auto_125674 ) ) ( not ( = ?auto_125673 ?auto_125674 ) ) )
    :subtasks
    ( ( !STACK ?auto_125673 ?auto_125674 )
      ( MAKE-1PILE ?auto_125671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125675 - BLOCK
    )
    :vars
    (
      ?auto_125677 - BLOCK
      ?auto_125678 - BLOCK
      ?auto_125676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125675 ?auto_125677 ) ( not ( = ?auto_125675 ?auto_125677 ) ) ( CLEAR ?auto_125678 ) ( not ( = ?auto_125675 ?auto_125676 ) ) ( not ( = ?auto_125675 ?auto_125678 ) ) ( not ( = ?auto_125677 ?auto_125676 ) ) ( not ( = ?auto_125677 ?auto_125678 ) ) ( not ( = ?auto_125676 ?auto_125678 ) ) ( ON ?auto_125676 ?auto_125675 ) ( CLEAR ?auto_125676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125677 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125677 ?auto_125675 )
      ( MAKE-1PILE ?auto_125675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125679 - BLOCK
    )
    :vars
    (
      ?auto_125680 - BLOCK
      ?auto_125681 - BLOCK
      ?auto_125682 - BLOCK
      ?auto_125687 - BLOCK
      ?auto_125685 - BLOCK
      ?auto_125683 - BLOCK
      ?auto_125684 - BLOCK
      ?auto_125686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125679 ?auto_125680 ) ( not ( = ?auto_125679 ?auto_125680 ) ) ( not ( = ?auto_125679 ?auto_125681 ) ) ( not ( = ?auto_125679 ?auto_125682 ) ) ( not ( = ?auto_125680 ?auto_125681 ) ) ( not ( = ?auto_125680 ?auto_125682 ) ) ( not ( = ?auto_125681 ?auto_125682 ) ) ( ON ?auto_125681 ?auto_125679 ) ( CLEAR ?auto_125681 ) ( ON-TABLE ?auto_125680 ) ( HOLDING ?auto_125682 ) ( CLEAR ?auto_125687 ) ( ON-TABLE ?auto_125685 ) ( ON ?auto_125683 ?auto_125685 ) ( ON ?auto_125684 ?auto_125683 ) ( ON ?auto_125686 ?auto_125684 ) ( ON ?auto_125687 ?auto_125686 ) ( not ( = ?auto_125685 ?auto_125683 ) ) ( not ( = ?auto_125685 ?auto_125684 ) ) ( not ( = ?auto_125685 ?auto_125686 ) ) ( not ( = ?auto_125685 ?auto_125687 ) ) ( not ( = ?auto_125685 ?auto_125682 ) ) ( not ( = ?auto_125683 ?auto_125684 ) ) ( not ( = ?auto_125683 ?auto_125686 ) ) ( not ( = ?auto_125683 ?auto_125687 ) ) ( not ( = ?auto_125683 ?auto_125682 ) ) ( not ( = ?auto_125684 ?auto_125686 ) ) ( not ( = ?auto_125684 ?auto_125687 ) ) ( not ( = ?auto_125684 ?auto_125682 ) ) ( not ( = ?auto_125686 ?auto_125687 ) ) ( not ( = ?auto_125686 ?auto_125682 ) ) ( not ( = ?auto_125687 ?auto_125682 ) ) ( not ( = ?auto_125679 ?auto_125687 ) ) ( not ( = ?auto_125679 ?auto_125685 ) ) ( not ( = ?auto_125679 ?auto_125683 ) ) ( not ( = ?auto_125679 ?auto_125684 ) ) ( not ( = ?auto_125679 ?auto_125686 ) ) ( not ( = ?auto_125680 ?auto_125687 ) ) ( not ( = ?auto_125680 ?auto_125685 ) ) ( not ( = ?auto_125680 ?auto_125683 ) ) ( not ( = ?auto_125680 ?auto_125684 ) ) ( not ( = ?auto_125680 ?auto_125686 ) ) ( not ( = ?auto_125681 ?auto_125687 ) ) ( not ( = ?auto_125681 ?auto_125685 ) ) ( not ( = ?auto_125681 ?auto_125683 ) ) ( not ( = ?auto_125681 ?auto_125684 ) ) ( not ( = ?auto_125681 ?auto_125686 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125685 ?auto_125683 ?auto_125684 ?auto_125686 ?auto_125687 ?auto_125682 )
      ( MAKE-1PILE ?auto_125679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125688 - BLOCK
    )
    :vars
    (
      ?auto_125690 - BLOCK
      ?auto_125695 - BLOCK
      ?auto_125693 - BLOCK
      ?auto_125696 - BLOCK
      ?auto_125692 - BLOCK
      ?auto_125689 - BLOCK
      ?auto_125691 - BLOCK
      ?auto_125694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125688 ?auto_125690 ) ( not ( = ?auto_125688 ?auto_125690 ) ) ( not ( = ?auto_125688 ?auto_125695 ) ) ( not ( = ?auto_125688 ?auto_125693 ) ) ( not ( = ?auto_125690 ?auto_125695 ) ) ( not ( = ?auto_125690 ?auto_125693 ) ) ( not ( = ?auto_125695 ?auto_125693 ) ) ( ON ?auto_125695 ?auto_125688 ) ( ON-TABLE ?auto_125690 ) ( CLEAR ?auto_125696 ) ( ON-TABLE ?auto_125692 ) ( ON ?auto_125689 ?auto_125692 ) ( ON ?auto_125691 ?auto_125689 ) ( ON ?auto_125694 ?auto_125691 ) ( ON ?auto_125696 ?auto_125694 ) ( not ( = ?auto_125692 ?auto_125689 ) ) ( not ( = ?auto_125692 ?auto_125691 ) ) ( not ( = ?auto_125692 ?auto_125694 ) ) ( not ( = ?auto_125692 ?auto_125696 ) ) ( not ( = ?auto_125692 ?auto_125693 ) ) ( not ( = ?auto_125689 ?auto_125691 ) ) ( not ( = ?auto_125689 ?auto_125694 ) ) ( not ( = ?auto_125689 ?auto_125696 ) ) ( not ( = ?auto_125689 ?auto_125693 ) ) ( not ( = ?auto_125691 ?auto_125694 ) ) ( not ( = ?auto_125691 ?auto_125696 ) ) ( not ( = ?auto_125691 ?auto_125693 ) ) ( not ( = ?auto_125694 ?auto_125696 ) ) ( not ( = ?auto_125694 ?auto_125693 ) ) ( not ( = ?auto_125696 ?auto_125693 ) ) ( not ( = ?auto_125688 ?auto_125696 ) ) ( not ( = ?auto_125688 ?auto_125692 ) ) ( not ( = ?auto_125688 ?auto_125689 ) ) ( not ( = ?auto_125688 ?auto_125691 ) ) ( not ( = ?auto_125688 ?auto_125694 ) ) ( not ( = ?auto_125690 ?auto_125696 ) ) ( not ( = ?auto_125690 ?auto_125692 ) ) ( not ( = ?auto_125690 ?auto_125689 ) ) ( not ( = ?auto_125690 ?auto_125691 ) ) ( not ( = ?auto_125690 ?auto_125694 ) ) ( not ( = ?auto_125695 ?auto_125696 ) ) ( not ( = ?auto_125695 ?auto_125692 ) ) ( not ( = ?auto_125695 ?auto_125689 ) ) ( not ( = ?auto_125695 ?auto_125691 ) ) ( not ( = ?auto_125695 ?auto_125694 ) ) ( ON ?auto_125693 ?auto_125695 ) ( CLEAR ?auto_125693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125690 ?auto_125688 ?auto_125695 )
      ( MAKE-1PILE ?auto_125688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125697 - BLOCK
    )
    :vars
    (
      ?auto_125698 - BLOCK
      ?auto_125700 - BLOCK
      ?auto_125702 - BLOCK
      ?auto_125701 - BLOCK
      ?auto_125699 - BLOCK
      ?auto_125703 - BLOCK
      ?auto_125705 - BLOCK
      ?auto_125704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125697 ?auto_125698 ) ( not ( = ?auto_125697 ?auto_125698 ) ) ( not ( = ?auto_125697 ?auto_125700 ) ) ( not ( = ?auto_125697 ?auto_125702 ) ) ( not ( = ?auto_125698 ?auto_125700 ) ) ( not ( = ?auto_125698 ?auto_125702 ) ) ( not ( = ?auto_125700 ?auto_125702 ) ) ( ON ?auto_125700 ?auto_125697 ) ( ON-TABLE ?auto_125698 ) ( ON-TABLE ?auto_125701 ) ( ON ?auto_125699 ?auto_125701 ) ( ON ?auto_125703 ?auto_125699 ) ( ON ?auto_125705 ?auto_125703 ) ( not ( = ?auto_125701 ?auto_125699 ) ) ( not ( = ?auto_125701 ?auto_125703 ) ) ( not ( = ?auto_125701 ?auto_125705 ) ) ( not ( = ?auto_125701 ?auto_125704 ) ) ( not ( = ?auto_125701 ?auto_125702 ) ) ( not ( = ?auto_125699 ?auto_125703 ) ) ( not ( = ?auto_125699 ?auto_125705 ) ) ( not ( = ?auto_125699 ?auto_125704 ) ) ( not ( = ?auto_125699 ?auto_125702 ) ) ( not ( = ?auto_125703 ?auto_125705 ) ) ( not ( = ?auto_125703 ?auto_125704 ) ) ( not ( = ?auto_125703 ?auto_125702 ) ) ( not ( = ?auto_125705 ?auto_125704 ) ) ( not ( = ?auto_125705 ?auto_125702 ) ) ( not ( = ?auto_125704 ?auto_125702 ) ) ( not ( = ?auto_125697 ?auto_125704 ) ) ( not ( = ?auto_125697 ?auto_125701 ) ) ( not ( = ?auto_125697 ?auto_125699 ) ) ( not ( = ?auto_125697 ?auto_125703 ) ) ( not ( = ?auto_125697 ?auto_125705 ) ) ( not ( = ?auto_125698 ?auto_125704 ) ) ( not ( = ?auto_125698 ?auto_125701 ) ) ( not ( = ?auto_125698 ?auto_125699 ) ) ( not ( = ?auto_125698 ?auto_125703 ) ) ( not ( = ?auto_125698 ?auto_125705 ) ) ( not ( = ?auto_125700 ?auto_125704 ) ) ( not ( = ?auto_125700 ?auto_125701 ) ) ( not ( = ?auto_125700 ?auto_125699 ) ) ( not ( = ?auto_125700 ?auto_125703 ) ) ( not ( = ?auto_125700 ?auto_125705 ) ) ( ON ?auto_125702 ?auto_125700 ) ( CLEAR ?auto_125702 ) ( HOLDING ?auto_125704 ) ( CLEAR ?auto_125705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125701 ?auto_125699 ?auto_125703 ?auto_125705 ?auto_125704 )
      ( MAKE-1PILE ?auto_125697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125706 - BLOCK
    )
    :vars
    (
      ?auto_125710 - BLOCK
      ?auto_125711 - BLOCK
      ?auto_125714 - BLOCK
      ?auto_125713 - BLOCK
      ?auto_125707 - BLOCK
      ?auto_125709 - BLOCK
      ?auto_125708 - BLOCK
      ?auto_125712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125706 ?auto_125710 ) ( not ( = ?auto_125706 ?auto_125710 ) ) ( not ( = ?auto_125706 ?auto_125711 ) ) ( not ( = ?auto_125706 ?auto_125714 ) ) ( not ( = ?auto_125710 ?auto_125711 ) ) ( not ( = ?auto_125710 ?auto_125714 ) ) ( not ( = ?auto_125711 ?auto_125714 ) ) ( ON ?auto_125711 ?auto_125706 ) ( ON-TABLE ?auto_125710 ) ( ON-TABLE ?auto_125713 ) ( ON ?auto_125707 ?auto_125713 ) ( ON ?auto_125709 ?auto_125707 ) ( ON ?auto_125708 ?auto_125709 ) ( not ( = ?auto_125713 ?auto_125707 ) ) ( not ( = ?auto_125713 ?auto_125709 ) ) ( not ( = ?auto_125713 ?auto_125708 ) ) ( not ( = ?auto_125713 ?auto_125712 ) ) ( not ( = ?auto_125713 ?auto_125714 ) ) ( not ( = ?auto_125707 ?auto_125709 ) ) ( not ( = ?auto_125707 ?auto_125708 ) ) ( not ( = ?auto_125707 ?auto_125712 ) ) ( not ( = ?auto_125707 ?auto_125714 ) ) ( not ( = ?auto_125709 ?auto_125708 ) ) ( not ( = ?auto_125709 ?auto_125712 ) ) ( not ( = ?auto_125709 ?auto_125714 ) ) ( not ( = ?auto_125708 ?auto_125712 ) ) ( not ( = ?auto_125708 ?auto_125714 ) ) ( not ( = ?auto_125712 ?auto_125714 ) ) ( not ( = ?auto_125706 ?auto_125712 ) ) ( not ( = ?auto_125706 ?auto_125713 ) ) ( not ( = ?auto_125706 ?auto_125707 ) ) ( not ( = ?auto_125706 ?auto_125709 ) ) ( not ( = ?auto_125706 ?auto_125708 ) ) ( not ( = ?auto_125710 ?auto_125712 ) ) ( not ( = ?auto_125710 ?auto_125713 ) ) ( not ( = ?auto_125710 ?auto_125707 ) ) ( not ( = ?auto_125710 ?auto_125709 ) ) ( not ( = ?auto_125710 ?auto_125708 ) ) ( not ( = ?auto_125711 ?auto_125712 ) ) ( not ( = ?auto_125711 ?auto_125713 ) ) ( not ( = ?auto_125711 ?auto_125707 ) ) ( not ( = ?auto_125711 ?auto_125709 ) ) ( not ( = ?auto_125711 ?auto_125708 ) ) ( ON ?auto_125714 ?auto_125711 ) ( CLEAR ?auto_125708 ) ( ON ?auto_125712 ?auto_125714 ) ( CLEAR ?auto_125712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125710 ?auto_125706 ?auto_125711 ?auto_125714 )
      ( MAKE-1PILE ?auto_125706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125715 - BLOCK
    )
    :vars
    (
      ?auto_125723 - BLOCK
      ?auto_125716 - BLOCK
      ?auto_125717 - BLOCK
      ?auto_125718 - BLOCK
      ?auto_125719 - BLOCK
      ?auto_125722 - BLOCK
      ?auto_125720 - BLOCK
      ?auto_125721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125715 ?auto_125723 ) ( not ( = ?auto_125715 ?auto_125723 ) ) ( not ( = ?auto_125715 ?auto_125716 ) ) ( not ( = ?auto_125715 ?auto_125717 ) ) ( not ( = ?auto_125723 ?auto_125716 ) ) ( not ( = ?auto_125723 ?auto_125717 ) ) ( not ( = ?auto_125716 ?auto_125717 ) ) ( ON ?auto_125716 ?auto_125715 ) ( ON-TABLE ?auto_125723 ) ( ON-TABLE ?auto_125718 ) ( ON ?auto_125719 ?auto_125718 ) ( ON ?auto_125722 ?auto_125719 ) ( not ( = ?auto_125718 ?auto_125719 ) ) ( not ( = ?auto_125718 ?auto_125722 ) ) ( not ( = ?auto_125718 ?auto_125720 ) ) ( not ( = ?auto_125718 ?auto_125721 ) ) ( not ( = ?auto_125718 ?auto_125717 ) ) ( not ( = ?auto_125719 ?auto_125722 ) ) ( not ( = ?auto_125719 ?auto_125720 ) ) ( not ( = ?auto_125719 ?auto_125721 ) ) ( not ( = ?auto_125719 ?auto_125717 ) ) ( not ( = ?auto_125722 ?auto_125720 ) ) ( not ( = ?auto_125722 ?auto_125721 ) ) ( not ( = ?auto_125722 ?auto_125717 ) ) ( not ( = ?auto_125720 ?auto_125721 ) ) ( not ( = ?auto_125720 ?auto_125717 ) ) ( not ( = ?auto_125721 ?auto_125717 ) ) ( not ( = ?auto_125715 ?auto_125721 ) ) ( not ( = ?auto_125715 ?auto_125718 ) ) ( not ( = ?auto_125715 ?auto_125719 ) ) ( not ( = ?auto_125715 ?auto_125722 ) ) ( not ( = ?auto_125715 ?auto_125720 ) ) ( not ( = ?auto_125723 ?auto_125721 ) ) ( not ( = ?auto_125723 ?auto_125718 ) ) ( not ( = ?auto_125723 ?auto_125719 ) ) ( not ( = ?auto_125723 ?auto_125722 ) ) ( not ( = ?auto_125723 ?auto_125720 ) ) ( not ( = ?auto_125716 ?auto_125721 ) ) ( not ( = ?auto_125716 ?auto_125718 ) ) ( not ( = ?auto_125716 ?auto_125719 ) ) ( not ( = ?auto_125716 ?auto_125722 ) ) ( not ( = ?auto_125716 ?auto_125720 ) ) ( ON ?auto_125717 ?auto_125716 ) ( ON ?auto_125721 ?auto_125717 ) ( CLEAR ?auto_125721 ) ( HOLDING ?auto_125720 ) ( CLEAR ?auto_125722 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125718 ?auto_125719 ?auto_125722 ?auto_125720 )
      ( MAKE-1PILE ?auto_125715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125724 - BLOCK
    )
    :vars
    (
      ?auto_125729 - BLOCK
      ?auto_125725 - BLOCK
      ?auto_125732 - BLOCK
      ?auto_125730 - BLOCK
      ?auto_125726 - BLOCK
      ?auto_125728 - BLOCK
      ?auto_125731 - BLOCK
      ?auto_125727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125724 ?auto_125729 ) ( not ( = ?auto_125724 ?auto_125729 ) ) ( not ( = ?auto_125724 ?auto_125725 ) ) ( not ( = ?auto_125724 ?auto_125732 ) ) ( not ( = ?auto_125729 ?auto_125725 ) ) ( not ( = ?auto_125729 ?auto_125732 ) ) ( not ( = ?auto_125725 ?auto_125732 ) ) ( ON ?auto_125725 ?auto_125724 ) ( ON-TABLE ?auto_125729 ) ( ON-TABLE ?auto_125730 ) ( ON ?auto_125726 ?auto_125730 ) ( ON ?auto_125728 ?auto_125726 ) ( not ( = ?auto_125730 ?auto_125726 ) ) ( not ( = ?auto_125730 ?auto_125728 ) ) ( not ( = ?auto_125730 ?auto_125731 ) ) ( not ( = ?auto_125730 ?auto_125727 ) ) ( not ( = ?auto_125730 ?auto_125732 ) ) ( not ( = ?auto_125726 ?auto_125728 ) ) ( not ( = ?auto_125726 ?auto_125731 ) ) ( not ( = ?auto_125726 ?auto_125727 ) ) ( not ( = ?auto_125726 ?auto_125732 ) ) ( not ( = ?auto_125728 ?auto_125731 ) ) ( not ( = ?auto_125728 ?auto_125727 ) ) ( not ( = ?auto_125728 ?auto_125732 ) ) ( not ( = ?auto_125731 ?auto_125727 ) ) ( not ( = ?auto_125731 ?auto_125732 ) ) ( not ( = ?auto_125727 ?auto_125732 ) ) ( not ( = ?auto_125724 ?auto_125727 ) ) ( not ( = ?auto_125724 ?auto_125730 ) ) ( not ( = ?auto_125724 ?auto_125726 ) ) ( not ( = ?auto_125724 ?auto_125728 ) ) ( not ( = ?auto_125724 ?auto_125731 ) ) ( not ( = ?auto_125729 ?auto_125727 ) ) ( not ( = ?auto_125729 ?auto_125730 ) ) ( not ( = ?auto_125729 ?auto_125726 ) ) ( not ( = ?auto_125729 ?auto_125728 ) ) ( not ( = ?auto_125729 ?auto_125731 ) ) ( not ( = ?auto_125725 ?auto_125727 ) ) ( not ( = ?auto_125725 ?auto_125730 ) ) ( not ( = ?auto_125725 ?auto_125726 ) ) ( not ( = ?auto_125725 ?auto_125728 ) ) ( not ( = ?auto_125725 ?auto_125731 ) ) ( ON ?auto_125732 ?auto_125725 ) ( ON ?auto_125727 ?auto_125732 ) ( CLEAR ?auto_125728 ) ( ON ?auto_125731 ?auto_125727 ) ( CLEAR ?auto_125731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125729 ?auto_125724 ?auto_125725 ?auto_125732 ?auto_125727 )
      ( MAKE-1PILE ?auto_125724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125733 - BLOCK
    )
    :vars
    (
      ?auto_125735 - BLOCK
      ?auto_125737 - BLOCK
      ?auto_125740 - BLOCK
      ?auto_125734 - BLOCK
      ?auto_125738 - BLOCK
      ?auto_125739 - BLOCK
      ?auto_125736 - BLOCK
      ?auto_125741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125733 ?auto_125735 ) ( not ( = ?auto_125733 ?auto_125735 ) ) ( not ( = ?auto_125733 ?auto_125737 ) ) ( not ( = ?auto_125733 ?auto_125740 ) ) ( not ( = ?auto_125735 ?auto_125737 ) ) ( not ( = ?auto_125735 ?auto_125740 ) ) ( not ( = ?auto_125737 ?auto_125740 ) ) ( ON ?auto_125737 ?auto_125733 ) ( ON-TABLE ?auto_125735 ) ( ON-TABLE ?auto_125734 ) ( ON ?auto_125738 ?auto_125734 ) ( not ( = ?auto_125734 ?auto_125738 ) ) ( not ( = ?auto_125734 ?auto_125739 ) ) ( not ( = ?auto_125734 ?auto_125736 ) ) ( not ( = ?auto_125734 ?auto_125741 ) ) ( not ( = ?auto_125734 ?auto_125740 ) ) ( not ( = ?auto_125738 ?auto_125739 ) ) ( not ( = ?auto_125738 ?auto_125736 ) ) ( not ( = ?auto_125738 ?auto_125741 ) ) ( not ( = ?auto_125738 ?auto_125740 ) ) ( not ( = ?auto_125739 ?auto_125736 ) ) ( not ( = ?auto_125739 ?auto_125741 ) ) ( not ( = ?auto_125739 ?auto_125740 ) ) ( not ( = ?auto_125736 ?auto_125741 ) ) ( not ( = ?auto_125736 ?auto_125740 ) ) ( not ( = ?auto_125741 ?auto_125740 ) ) ( not ( = ?auto_125733 ?auto_125741 ) ) ( not ( = ?auto_125733 ?auto_125734 ) ) ( not ( = ?auto_125733 ?auto_125738 ) ) ( not ( = ?auto_125733 ?auto_125739 ) ) ( not ( = ?auto_125733 ?auto_125736 ) ) ( not ( = ?auto_125735 ?auto_125741 ) ) ( not ( = ?auto_125735 ?auto_125734 ) ) ( not ( = ?auto_125735 ?auto_125738 ) ) ( not ( = ?auto_125735 ?auto_125739 ) ) ( not ( = ?auto_125735 ?auto_125736 ) ) ( not ( = ?auto_125737 ?auto_125741 ) ) ( not ( = ?auto_125737 ?auto_125734 ) ) ( not ( = ?auto_125737 ?auto_125738 ) ) ( not ( = ?auto_125737 ?auto_125739 ) ) ( not ( = ?auto_125737 ?auto_125736 ) ) ( ON ?auto_125740 ?auto_125737 ) ( ON ?auto_125741 ?auto_125740 ) ( ON ?auto_125736 ?auto_125741 ) ( CLEAR ?auto_125736 ) ( HOLDING ?auto_125739 ) ( CLEAR ?auto_125738 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125734 ?auto_125738 ?auto_125739 )
      ( MAKE-1PILE ?auto_125733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125742 - BLOCK
    )
    :vars
    (
      ?auto_125745 - BLOCK
      ?auto_125749 - BLOCK
      ?auto_125747 - BLOCK
      ?auto_125744 - BLOCK
      ?auto_125743 - BLOCK
      ?auto_125750 - BLOCK
      ?auto_125748 - BLOCK
      ?auto_125746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125742 ?auto_125745 ) ( not ( = ?auto_125742 ?auto_125745 ) ) ( not ( = ?auto_125742 ?auto_125749 ) ) ( not ( = ?auto_125742 ?auto_125747 ) ) ( not ( = ?auto_125745 ?auto_125749 ) ) ( not ( = ?auto_125745 ?auto_125747 ) ) ( not ( = ?auto_125749 ?auto_125747 ) ) ( ON ?auto_125749 ?auto_125742 ) ( ON-TABLE ?auto_125745 ) ( ON-TABLE ?auto_125744 ) ( ON ?auto_125743 ?auto_125744 ) ( not ( = ?auto_125744 ?auto_125743 ) ) ( not ( = ?auto_125744 ?auto_125750 ) ) ( not ( = ?auto_125744 ?auto_125748 ) ) ( not ( = ?auto_125744 ?auto_125746 ) ) ( not ( = ?auto_125744 ?auto_125747 ) ) ( not ( = ?auto_125743 ?auto_125750 ) ) ( not ( = ?auto_125743 ?auto_125748 ) ) ( not ( = ?auto_125743 ?auto_125746 ) ) ( not ( = ?auto_125743 ?auto_125747 ) ) ( not ( = ?auto_125750 ?auto_125748 ) ) ( not ( = ?auto_125750 ?auto_125746 ) ) ( not ( = ?auto_125750 ?auto_125747 ) ) ( not ( = ?auto_125748 ?auto_125746 ) ) ( not ( = ?auto_125748 ?auto_125747 ) ) ( not ( = ?auto_125746 ?auto_125747 ) ) ( not ( = ?auto_125742 ?auto_125746 ) ) ( not ( = ?auto_125742 ?auto_125744 ) ) ( not ( = ?auto_125742 ?auto_125743 ) ) ( not ( = ?auto_125742 ?auto_125750 ) ) ( not ( = ?auto_125742 ?auto_125748 ) ) ( not ( = ?auto_125745 ?auto_125746 ) ) ( not ( = ?auto_125745 ?auto_125744 ) ) ( not ( = ?auto_125745 ?auto_125743 ) ) ( not ( = ?auto_125745 ?auto_125750 ) ) ( not ( = ?auto_125745 ?auto_125748 ) ) ( not ( = ?auto_125749 ?auto_125746 ) ) ( not ( = ?auto_125749 ?auto_125744 ) ) ( not ( = ?auto_125749 ?auto_125743 ) ) ( not ( = ?auto_125749 ?auto_125750 ) ) ( not ( = ?auto_125749 ?auto_125748 ) ) ( ON ?auto_125747 ?auto_125749 ) ( ON ?auto_125746 ?auto_125747 ) ( ON ?auto_125748 ?auto_125746 ) ( CLEAR ?auto_125743 ) ( ON ?auto_125750 ?auto_125748 ) ( CLEAR ?auto_125750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125745 ?auto_125742 ?auto_125749 ?auto_125747 ?auto_125746 ?auto_125748 )
      ( MAKE-1PILE ?auto_125742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125751 - BLOCK
    )
    :vars
    (
      ?auto_125753 - BLOCK
      ?auto_125752 - BLOCK
      ?auto_125759 - BLOCK
      ?auto_125758 - BLOCK
      ?auto_125754 - BLOCK
      ?auto_125756 - BLOCK
      ?auto_125755 - BLOCK
      ?auto_125757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125751 ?auto_125753 ) ( not ( = ?auto_125751 ?auto_125753 ) ) ( not ( = ?auto_125751 ?auto_125752 ) ) ( not ( = ?auto_125751 ?auto_125759 ) ) ( not ( = ?auto_125753 ?auto_125752 ) ) ( not ( = ?auto_125753 ?auto_125759 ) ) ( not ( = ?auto_125752 ?auto_125759 ) ) ( ON ?auto_125752 ?auto_125751 ) ( ON-TABLE ?auto_125753 ) ( ON-TABLE ?auto_125758 ) ( not ( = ?auto_125758 ?auto_125754 ) ) ( not ( = ?auto_125758 ?auto_125756 ) ) ( not ( = ?auto_125758 ?auto_125755 ) ) ( not ( = ?auto_125758 ?auto_125757 ) ) ( not ( = ?auto_125758 ?auto_125759 ) ) ( not ( = ?auto_125754 ?auto_125756 ) ) ( not ( = ?auto_125754 ?auto_125755 ) ) ( not ( = ?auto_125754 ?auto_125757 ) ) ( not ( = ?auto_125754 ?auto_125759 ) ) ( not ( = ?auto_125756 ?auto_125755 ) ) ( not ( = ?auto_125756 ?auto_125757 ) ) ( not ( = ?auto_125756 ?auto_125759 ) ) ( not ( = ?auto_125755 ?auto_125757 ) ) ( not ( = ?auto_125755 ?auto_125759 ) ) ( not ( = ?auto_125757 ?auto_125759 ) ) ( not ( = ?auto_125751 ?auto_125757 ) ) ( not ( = ?auto_125751 ?auto_125758 ) ) ( not ( = ?auto_125751 ?auto_125754 ) ) ( not ( = ?auto_125751 ?auto_125756 ) ) ( not ( = ?auto_125751 ?auto_125755 ) ) ( not ( = ?auto_125753 ?auto_125757 ) ) ( not ( = ?auto_125753 ?auto_125758 ) ) ( not ( = ?auto_125753 ?auto_125754 ) ) ( not ( = ?auto_125753 ?auto_125756 ) ) ( not ( = ?auto_125753 ?auto_125755 ) ) ( not ( = ?auto_125752 ?auto_125757 ) ) ( not ( = ?auto_125752 ?auto_125758 ) ) ( not ( = ?auto_125752 ?auto_125754 ) ) ( not ( = ?auto_125752 ?auto_125756 ) ) ( not ( = ?auto_125752 ?auto_125755 ) ) ( ON ?auto_125759 ?auto_125752 ) ( ON ?auto_125757 ?auto_125759 ) ( ON ?auto_125755 ?auto_125757 ) ( ON ?auto_125756 ?auto_125755 ) ( CLEAR ?auto_125756 ) ( HOLDING ?auto_125754 ) ( CLEAR ?auto_125758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125758 ?auto_125754 )
      ( MAKE-1PILE ?auto_125751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125760 - BLOCK
    )
    :vars
    (
      ?auto_125764 - BLOCK
      ?auto_125767 - BLOCK
      ?auto_125762 - BLOCK
      ?auto_125763 - BLOCK
      ?auto_125765 - BLOCK
      ?auto_125761 - BLOCK
      ?auto_125766 - BLOCK
      ?auto_125768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125760 ?auto_125764 ) ( not ( = ?auto_125760 ?auto_125764 ) ) ( not ( = ?auto_125760 ?auto_125767 ) ) ( not ( = ?auto_125760 ?auto_125762 ) ) ( not ( = ?auto_125764 ?auto_125767 ) ) ( not ( = ?auto_125764 ?auto_125762 ) ) ( not ( = ?auto_125767 ?auto_125762 ) ) ( ON ?auto_125767 ?auto_125760 ) ( ON-TABLE ?auto_125764 ) ( ON-TABLE ?auto_125763 ) ( not ( = ?auto_125763 ?auto_125765 ) ) ( not ( = ?auto_125763 ?auto_125761 ) ) ( not ( = ?auto_125763 ?auto_125766 ) ) ( not ( = ?auto_125763 ?auto_125768 ) ) ( not ( = ?auto_125763 ?auto_125762 ) ) ( not ( = ?auto_125765 ?auto_125761 ) ) ( not ( = ?auto_125765 ?auto_125766 ) ) ( not ( = ?auto_125765 ?auto_125768 ) ) ( not ( = ?auto_125765 ?auto_125762 ) ) ( not ( = ?auto_125761 ?auto_125766 ) ) ( not ( = ?auto_125761 ?auto_125768 ) ) ( not ( = ?auto_125761 ?auto_125762 ) ) ( not ( = ?auto_125766 ?auto_125768 ) ) ( not ( = ?auto_125766 ?auto_125762 ) ) ( not ( = ?auto_125768 ?auto_125762 ) ) ( not ( = ?auto_125760 ?auto_125768 ) ) ( not ( = ?auto_125760 ?auto_125763 ) ) ( not ( = ?auto_125760 ?auto_125765 ) ) ( not ( = ?auto_125760 ?auto_125761 ) ) ( not ( = ?auto_125760 ?auto_125766 ) ) ( not ( = ?auto_125764 ?auto_125768 ) ) ( not ( = ?auto_125764 ?auto_125763 ) ) ( not ( = ?auto_125764 ?auto_125765 ) ) ( not ( = ?auto_125764 ?auto_125761 ) ) ( not ( = ?auto_125764 ?auto_125766 ) ) ( not ( = ?auto_125767 ?auto_125768 ) ) ( not ( = ?auto_125767 ?auto_125763 ) ) ( not ( = ?auto_125767 ?auto_125765 ) ) ( not ( = ?auto_125767 ?auto_125761 ) ) ( not ( = ?auto_125767 ?auto_125766 ) ) ( ON ?auto_125762 ?auto_125767 ) ( ON ?auto_125768 ?auto_125762 ) ( ON ?auto_125766 ?auto_125768 ) ( ON ?auto_125761 ?auto_125766 ) ( CLEAR ?auto_125763 ) ( ON ?auto_125765 ?auto_125761 ) ( CLEAR ?auto_125765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125764 ?auto_125760 ?auto_125767 ?auto_125762 ?auto_125768 ?auto_125766 ?auto_125761 )
      ( MAKE-1PILE ?auto_125760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125769 - BLOCK
    )
    :vars
    (
      ?auto_125776 - BLOCK
      ?auto_125774 - BLOCK
      ?auto_125775 - BLOCK
      ?auto_125777 - BLOCK
      ?auto_125772 - BLOCK
      ?auto_125773 - BLOCK
      ?auto_125770 - BLOCK
      ?auto_125771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125769 ?auto_125776 ) ( not ( = ?auto_125769 ?auto_125776 ) ) ( not ( = ?auto_125769 ?auto_125774 ) ) ( not ( = ?auto_125769 ?auto_125775 ) ) ( not ( = ?auto_125776 ?auto_125774 ) ) ( not ( = ?auto_125776 ?auto_125775 ) ) ( not ( = ?auto_125774 ?auto_125775 ) ) ( ON ?auto_125774 ?auto_125769 ) ( ON-TABLE ?auto_125776 ) ( not ( = ?auto_125777 ?auto_125772 ) ) ( not ( = ?auto_125777 ?auto_125773 ) ) ( not ( = ?auto_125777 ?auto_125770 ) ) ( not ( = ?auto_125777 ?auto_125771 ) ) ( not ( = ?auto_125777 ?auto_125775 ) ) ( not ( = ?auto_125772 ?auto_125773 ) ) ( not ( = ?auto_125772 ?auto_125770 ) ) ( not ( = ?auto_125772 ?auto_125771 ) ) ( not ( = ?auto_125772 ?auto_125775 ) ) ( not ( = ?auto_125773 ?auto_125770 ) ) ( not ( = ?auto_125773 ?auto_125771 ) ) ( not ( = ?auto_125773 ?auto_125775 ) ) ( not ( = ?auto_125770 ?auto_125771 ) ) ( not ( = ?auto_125770 ?auto_125775 ) ) ( not ( = ?auto_125771 ?auto_125775 ) ) ( not ( = ?auto_125769 ?auto_125771 ) ) ( not ( = ?auto_125769 ?auto_125777 ) ) ( not ( = ?auto_125769 ?auto_125772 ) ) ( not ( = ?auto_125769 ?auto_125773 ) ) ( not ( = ?auto_125769 ?auto_125770 ) ) ( not ( = ?auto_125776 ?auto_125771 ) ) ( not ( = ?auto_125776 ?auto_125777 ) ) ( not ( = ?auto_125776 ?auto_125772 ) ) ( not ( = ?auto_125776 ?auto_125773 ) ) ( not ( = ?auto_125776 ?auto_125770 ) ) ( not ( = ?auto_125774 ?auto_125771 ) ) ( not ( = ?auto_125774 ?auto_125777 ) ) ( not ( = ?auto_125774 ?auto_125772 ) ) ( not ( = ?auto_125774 ?auto_125773 ) ) ( not ( = ?auto_125774 ?auto_125770 ) ) ( ON ?auto_125775 ?auto_125774 ) ( ON ?auto_125771 ?auto_125775 ) ( ON ?auto_125770 ?auto_125771 ) ( ON ?auto_125773 ?auto_125770 ) ( ON ?auto_125772 ?auto_125773 ) ( CLEAR ?auto_125772 ) ( HOLDING ?auto_125777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125777 )
      ( MAKE-1PILE ?auto_125769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125778 - BLOCK
    )
    :vars
    (
      ?auto_125783 - BLOCK
      ?auto_125780 - BLOCK
      ?auto_125781 - BLOCK
      ?auto_125779 - BLOCK
      ?auto_125784 - BLOCK
      ?auto_125786 - BLOCK
      ?auto_125785 - BLOCK
      ?auto_125782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125778 ?auto_125783 ) ( not ( = ?auto_125778 ?auto_125783 ) ) ( not ( = ?auto_125778 ?auto_125780 ) ) ( not ( = ?auto_125778 ?auto_125781 ) ) ( not ( = ?auto_125783 ?auto_125780 ) ) ( not ( = ?auto_125783 ?auto_125781 ) ) ( not ( = ?auto_125780 ?auto_125781 ) ) ( ON ?auto_125780 ?auto_125778 ) ( ON-TABLE ?auto_125783 ) ( not ( = ?auto_125779 ?auto_125784 ) ) ( not ( = ?auto_125779 ?auto_125786 ) ) ( not ( = ?auto_125779 ?auto_125785 ) ) ( not ( = ?auto_125779 ?auto_125782 ) ) ( not ( = ?auto_125779 ?auto_125781 ) ) ( not ( = ?auto_125784 ?auto_125786 ) ) ( not ( = ?auto_125784 ?auto_125785 ) ) ( not ( = ?auto_125784 ?auto_125782 ) ) ( not ( = ?auto_125784 ?auto_125781 ) ) ( not ( = ?auto_125786 ?auto_125785 ) ) ( not ( = ?auto_125786 ?auto_125782 ) ) ( not ( = ?auto_125786 ?auto_125781 ) ) ( not ( = ?auto_125785 ?auto_125782 ) ) ( not ( = ?auto_125785 ?auto_125781 ) ) ( not ( = ?auto_125782 ?auto_125781 ) ) ( not ( = ?auto_125778 ?auto_125782 ) ) ( not ( = ?auto_125778 ?auto_125779 ) ) ( not ( = ?auto_125778 ?auto_125784 ) ) ( not ( = ?auto_125778 ?auto_125786 ) ) ( not ( = ?auto_125778 ?auto_125785 ) ) ( not ( = ?auto_125783 ?auto_125782 ) ) ( not ( = ?auto_125783 ?auto_125779 ) ) ( not ( = ?auto_125783 ?auto_125784 ) ) ( not ( = ?auto_125783 ?auto_125786 ) ) ( not ( = ?auto_125783 ?auto_125785 ) ) ( not ( = ?auto_125780 ?auto_125782 ) ) ( not ( = ?auto_125780 ?auto_125779 ) ) ( not ( = ?auto_125780 ?auto_125784 ) ) ( not ( = ?auto_125780 ?auto_125786 ) ) ( not ( = ?auto_125780 ?auto_125785 ) ) ( ON ?auto_125781 ?auto_125780 ) ( ON ?auto_125782 ?auto_125781 ) ( ON ?auto_125785 ?auto_125782 ) ( ON ?auto_125786 ?auto_125785 ) ( ON ?auto_125784 ?auto_125786 ) ( ON ?auto_125779 ?auto_125784 ) ( CLEAR ?auto_125779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125783 ?auto_125778 ?auto_125780 ?auto_125781 ?auto_125782 ?auto_125785 ?auto_125786 ?auto_125784 )
      ( MAKE-1PILE ?auto_125778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125800 - BLOCK
      ?auto_125801 - BLOCK
      ?auto_125802 - BLOCK
      ?auto_125803 - BLOCK
      ?auto_125804 - BLOCK
      ?auto_125805 - BLOCK
    )
    :vars
    (
      ?auto_125806 - BLOCK
      ?auto_125807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125806 ?auto_125805 ) ( CLEAR ?auto_125806 ) ( ON-TABLE ?auto_125800 ) ( ON ?auto_125801 ?auto_125800 ) ( ON ?auto_125802 ?auto_125801 ) ( ON ?auto_125803 ?auto_125802 ) ( ON ?auto_125804 ?auto_125803 ) ( ON ?auto_125805 ?auto_125804 ) ( not ( = ?auto_125800 ?auto_125801 ) ) ( not ( = ?auto_125800 ?auto_125802 ) ) ( not ( = ?auto_125800 ?auto_125803 ) ) ( not ( = ?auto_125800 ?auto_125804 ) ) ( not ( = ?auto_125800 ?auto_125805 ) ) ( not ( = ?auto_125800 ?auto_125806 ) ) ( not ( = ?auto_125801 ?auto_125802 ) ) ( not ( = ?auto_125801 ?auto_125803 ) ) ( not ( = ?auto_125801 ?auto_125804 ) ) ( not ( = ?auto_125801 ?auto_125805 ) ) ( not ( = ?auto_125801 ?auto_125806 ) ) ( not ( = ?auto_125802 ?auto_125803 ) ) ( not ( = ?auto_125802 ?auto_125804 ) ) ( not ( = ?auto_125802 ?auto_125805 ) ) ( not ( = ?auto_125802 ?auto_125806 ) ) ( not ( = ?auto_125803 ?auto_125804 ) ) ( not ( = ?auto_125803 ?auto_125805 ) ) ( not ( = ?auto_125803 ?auto_125806 ) ) ( not ( = ?auto_125804 ?auto_125805 ) ) ( not ( = ?auto_125804 ?auto_125806 ) ) ( not ( = ?auto_125805 ?auto_125806 ) ) ( HOLDING ?auto_125807 ) ( not ( = ?auto_125800 ?auto_125807 ) ) ( not ( = ?auto_125801 ?auto_125807 ) ) ( not ( = ?auto_125802 ?auto_125807 ) ) ( not ( = ?auto_125803 ?auto_125807 ) ) ( not ( = ?auto_125804 ?auto_125807 ) ) ( not ( = ?auto_125805 ?auto_125807 ) ) ( not ( = ?auto_125806 ?auto_125807 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_125807 )
      ( MAKE-6PILE ?auto_125800 ?auto_125801 ?auto_125802 ?auto_125803 ?auto_125804 ?auto_125805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125925 - BLOCK
      ?auto_125926 - BLOCK
    )
    :vars
    (
      ?auto_125927 - BLOCK
      ?auto_125931 - BLOCK
      ?auto_125929 - BLOCK
      ?auto_125932 - BLOCK
      ?auto_125928 - BLOCK
      ?auto_125930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125925 ?auto_125926 ) ) ( ON ?auto_125926 ?auto_125927 ) ( not ( = ?auto_125925 ?auto_125927 ) ) ( not ( = ?auto_125926 ?auto_125927 ) ) ( ON ?auto_125925 ?auto_125926 ) ( CLEAR ?auto_125925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125931 ) ( ON ?auto_125929 ?auto_125931 ) ( ON ?auto_125932 ?auto_125929 ) ( ON ?auto_125928 ?auto_125932 ) ( ON ?auto_125930 ?auto_125928 ) ( ON ?auto_125927 ?auto_125930 ) ( not ( = ?auto_125931 ?auto_125929 ) ) ( not ( = ?auto_125931 ?auto_125932 ) ) ( not ( = ?auto_125931 ?auto_125928 ) ) ( not ( = ?auto_125931 ?auto_125930 ) ) ( not ( = ?auto_125931 ?auto_125927 ) ) ( not ( = ?auto_125931 ?auto_125926 ) ) ( not ( = ?auto_125931 ?auto_125925 ) ) ( not ( = ?auto_125929 ?auto_125932 ) ) ( not ( = ?auto_125929 ?auto_125928 ) ) ( not ( = ?auto_125929 ?auto_125930 ) ) ( not ( = ?auto_125929 ?auto_125927 ) ) ( not ( = ?auto_125929 ?auto_125926 ) ) ( not ( = ?auto_125929 ?auto_125925 ) ) ( not ( = ?auto_125932 ?auto_125928 ) ) ( not ( = ?auto_125932 ?auto_125930 ) ) ( not ( = ?auto_125932 ?auto_125927 ) ) ( not ( = ?auto_125932 ?auto_125926 ) ) ( not ( = ?auto_125932 ?auto_125925 ) ) ( not ( = ?auto_125928 ?auto_125930 ) ) ( not ( = ?auto_125928 ?auto_125927 ) ) ( not ( = ?auto_125928 ?auto_125926 ) ) ( not ( = ?auto_125928 ?auto_125925 ) ) ( not ( = ?auto_125930 ?auto_125927 ) ) ( not ( = ?auto_125930 ?auto_125926 ) ) ( not ( = ?auto_125930 ?auto_125925 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125931 ?auto_125929 ?auto_125932 ?auto_125928 ?auto_125930 ?auto_125927 ?auto_125926 )
      ( MAKE-2PILE ?auto_125925 ?auto_125926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125935 - BLOCK
      ?auto_125936 - BLOCK
    )
    :vars
    (
      ?auto_125937 - BLOCK
      ?auto_125938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125935 ?auto_125936 ) ) ( ON ?auto_125936 ?auto_125937 ) ( CLEAR ?auto_125936 ) ( not ( = ?auto_125935 ?auto_125937 ) ) ( not ( = ?auto_125936 ?auto_125937 ) ) ( ON ?auto_125935 ?auto_125938 ) ( CLEAR ?auto_125935 ) ( HAND-EMPTY ) ( not ( = ?auto_125935 ?auto_125938 ) ) ( not ( = ?auto_125936 ?auto_125938 ) ) ( not ( = ?auto_125937 ?auto_125938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125935 ?auto_125938 )
      ( MAKE-2PILE ?auto_125935 ?auto_125936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125939 - BLOCK
      ?auto_125940 - BLOCK
    )
    :vars
    (
      ?auto_125941 - BLOCK
      ?auto_125942 - BLOCK
      ?auto_125945 - BLOCK
      ?auto_125943 - BLOCK
      ?auto_125947 - BLOCK
      ?auto_125946 - BLOCK
      ?auto_125944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125939 ?auto_125940 ) ) ( not ( = ?auto_125939 ?auto_125941 ) ) ( not ( = ?auto_125940 ?auto_125941 ) ) ( ON ?auto_125939 ?auto_125942 ) ( CLEAR ?auto_125939 ) ( not ( = ?auto_125939 ?auto_125942 ) ) ( not ( = ?auto_125940 ?auto_125942 ) ) ( not ( = ?auto_125941 ?auto_125942 ) ) ( HOLDING ?auto_125940 ) ( CLEAR ?auto_125941 ) ( ON-TABLE ?auto_125945 ) ( ON ?auto_125943 ?auto_125945 ) ( ON ?auto_125947 ?auto_125943 ) ( ON ?auto_125946 ?auto_125947 ) ( ON ?auto_125944 ?auto_125946 ) ( ON ?auto_125941 ?auto_125944 ) ( not ( = ?auto_125945 ?auto_125943 ) ) ( not ( = ?auto_125945 ?auto_125947 ) ) ( not ( = ?auto_125945 ?auto_125946 ) ) ( not ( = ?auto_125945 ?auto_125944 ) ) ( not ( = ?auto_125945 ?auto_125941 ) ) ( not ( = ?auto_125945 ?auto_125940 ) ) ( not ( = ?auto_125943 ?auto_125947 ) ) ( not ( = ?auto_125943 ?auto_125946 ) ) ( not ( = ?auto_125943 ?auto_125944 ) ) ( not ( = ?auto_125943 ?auto_125941 ) ) ( not ( = ?auto_125943 ?auto_125940 ) ) ( not ( = ?auto_125947 ?auto_125946 ) ) ( not ( = ?auto_125947 ?auto_125944 ) ) ( not ( = ?auto_125947 ?auto_125941 ) ) ( not ( = ?auto_125947 ?auto_125940 ) ) ( not ( = ?auto_125946 ?auto_125944 ) ) ( not ( = ?auto_125946 ?auto_125941 ) ) ( not ( = ?auto_125946 ?auto_125940 ) ) ( not ( = ?auto_125944 ?auto_125941 ) ) ( not ( = ?auto_125944 ?auto_125940 ) ) ( not ( = ?auto_125939 ?auto_125945 ) ) ( not ( = ?auto_125939 ?auto_125943 ) ) ( not ( = ?auto_125939 ?auto_125947 ) ) ( not ( = ?auto_125939 ?auto_125946 ) ) ( not ( = ?auto_125939 ?auto_125944 ) ) ( not ( = ?auto_125942 ?auto_125945 ) ) ( not ( = ?auto_125942 ?auto_125943 ) ) ( not ( = ?auto_125942 ?auto_125947 ) ) ( not ( = ?auto_125942 ?auto_125946 ) ) ( not ( = ?auto_125942 ?auto_125944 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125945 ?auto_125943 ?auto_125947 ?auto_125946 ?auto_125944 ?auto_125941 ?auto_125940 )
      ( MAKE-2PILE ?auto_125939 ?auto_125940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125948 - BLOCK
      ?auto_125949 - BLOCK
    )
    :vars
    (
      ?auto_125952 - BLOCK
      ?auto_125954 - BLOCK
      ?auto_125956 - BLOCK
      ?auto_125951 - BLOCK
      ?auto_125950 - BLOCK
      ?auto_125953 - BLOCK
      ?auto_125955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125948 ?auto_125949 ) ) ( not ( = ?auto_125948 ?auto_125952 ) ) ( not ( = ?auto_125949 ?auto_125952 ) ) ( ON ?auto_125948 ?auto_125954 ) ( not ( = ?auto_125948 ?auto_125954 ) ) ( not ( = ?auto_125949 ?auto_125954 ) ) ( not ( = ?auto_125952 ?auto_125954 ) ) ( CLEAR ?auto_125952 ) ( ON-TABLE ?auto_125956 ) ( ON ?auto_125951 ?auto_125956 ) ( ON ?auto_125950 ?auto_125951 ) ( ON ?auto_125953 ?auto_125950 ) ( ON ?auto_125955 ?auto_125953 ) ( ON ?auto_125952 ?auto_125955 ) ( not ( = ?auto_125956 ?auto_125951 ) ) ( not ( = ?auto_125956 ?auto_125950 ) ) ( not ( = ?auto_125956 ?auto_125953 ) ) ( not ( = ?auto_125956 ?auto_125955 ) ) ( not ( = ?auto_125956 ?auto_125952 ) ) ( not ( = ?auto_125956 ?auto_125949 ) ) ( not ( = ?auto_125951 ?auto_125950 ) ) ( not ( = ?auto_125951 ?auto_125953 ) ) ( not ( = ?auto_125951 ?auto_125955 ) ) ( not ( = ?auto_125951 ?auto_125952 ) ) ( not ( = ?auto_125951 ?auto_125949 ) ) ( not ( = ?auto_125950 ?auto_125953 ) ) ( not ( = ?auto_125950 ?auto_125955 ) ) ( not ( = ?auto_125950 ?auto_125952 ) ) ( not ( = ?auto_125950 ?auto_125949 ) ) ( not ( = ?auto_125953 ?auto_125955 ) ) ( not ( = ?auto_125953 ?auto_125952 ) ) ( not ( = ?auto_125953 ?auto_125949 ) ) ( not ( = ?auto_125955 ?auto_125952 ) ) ( not ( = ?auto_125955 ?auto_125949 ) ) ( not ( = ?auto_125948 ?auto_125956 ) ) ( not ( = ?auto_125948 ?auto_125951 ) ) ( not ( = ?auto_125948 ?auto_125950 ) ) ( not ( = ?auto_125948 ?auto_125953 ) ) ( not ( = ?auto_125948 ?auto_125955 ) ) ( not ( = ?auto_125954 ?auto_125956 ) ) ( not ( = ?auto_125954 ?auto_125951 ) ) ( not ( = ?auto_125954 ?auto_125950 ) ) ( not ( = ?auto_125954 ?auto_125953 ) ) ( not ( = ?auto_125954 ?auto_125955 ) ) ( ON ?auto_125949 ?auto_125948 ) ( CLEAR ?auto_125949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125954 ?auto_125948 )
      ( MAKE-2PILE ?auto_125948 ?auto_125949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125957 - BLOCK
      ?auto_125958 - BLOCK
    )
    :vars
    (
      ?auto_125961 - BLOCK
      ?auto_125963 - BLOCK
      ?auto_125959 - BLOCK
      ?auto_125962 - BLOCK
      ?auto_125960 - BLOCK
      ?auto_125964 - BLOCK
      ?auto_125965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125957 ?auto_125958 ) ) ( not ( = ?auto_125957 ?auto_125961 ) ) ( not ( = ?auto_125958 ?auto_125961 ) ) ( ON ?auto_125957 ?auto_125963 ) ( not ( = ?auto_125957 ?auto_125963 ) ) ( not ( = ?auto_125958 ?auto_125963 ) ) ( not ( = ?auto_125961 ?auto_125963 ) ) ( ON-TABLE ?auto_125959 ) ( ON ?auto_125962 ?auto_125959 ) ( ON ?auto_125960 ?auto_125962 ) ( ON ?auto_125964 ?auto_125960 ) ( ON ?auto_125965 ?auto_125964 ) ( not ( = ?auto_125959 ?auto_125962 ) ) ( not ( = ?auto_125959 ?auto_125960 ) ) ( not ( = ?auto_125959 ?auto_125964 ) ) ( not ( = ?auto_125959 ?auto_125965 ) ) ( not ( = ?auto_125959 ?auto_125961 ) ) ( not ( = ?auto_125959 ?auto_125958 ) ) ( not ( = ?auto_125962 ?auto_125960 ) ) ( not ( = ?auto_125962 ?auto_125964 ) ) ( not ( = ?auto_125962 ?auto_125965 ) ) ( not ( = ?auto_125962 ?auto_125961 ) ) ( not ( = ?auto_125962 ?auto_125958 ) ) ( not ( = ?auto_125960 ?auto_125964 ) ) ( not ( = ?auto_125960 ?auto_125965 ) ) ( not ( = ?auto_125960 ?auto_125961 ) ) ( not ( = ?auto_125960 ?auto_125958 ) ) ( not ( = ?auto_125964 ?auto_125965 ) ) ( not ( = ?auto_125964 ?auto_125961 ) ) ( not ( = ?auto_125964 ?auto_125958 ) ) ( not ( = ?auto_125965 ?auto_125961 ) ) ( not ( = ?auto_125965 ?auto_125958 ) ) ( not ( = ?auto_125957 ?auto_125959 ) ) ( not ( = ?auto_125957 ?auto_125962 ) ) ( not ( = ?auto_125957 ?auto_125960 ) ) ( not ( = ?auto_125957 ?auto_125964 ) ) ( not ( = ?auto_125957 ?auto_125965 ) ) ( not ( = ?auto_125963 ?auto_125959 ) ) ( not ( = ?auto_125963 ?auto_125962 ) ) ( not ( = ?auto_125963 ?auto_125960 ) ) ( not ( = ?auto_125963 ?auto_125964 ) ) ( not ( = ?auto_125963 ?auto_125965 ) ) ( ON ?auto_125958 ?auto_125957 ) ( CLEAR ?auto_125958 ) ( ON-TABLE ?auto_125963 ) ( HOLDING ?auto_125961 ) ( CLEAR ?auto_125965 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125959 ?auto_125962 ?auto_125960 ?auto_125964 ?auto_125965 ?auto_125961 )
      ( MAKE-2PILE ?auto_125957 ?auto_125958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125966 - BLOCK
      ?auto_125967 - BLOCK
    )
    :vars
    (
      ?auto_125969 - BLOCK
      ?auto_125970 - BLOCK
      ?auto_125974 - BLOCK
      ?auto_125968 - BLOCK
      ?auto_125971 - BLOCK
      ?auto_125973 - BLOCK
      ?auto_125972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125966 ?auto_125967 ) ) ( not ( = ?auto_125966 ?auto_125969 ) ) ( not ( = ?auto_125967 ?auto_125969 ) ) ( ON ?auto_125966 ?auto_125970 ) ( not ( = ?auto_125966 ?auto_125970 ) ) ( not ( = ?auto_125967 ?auto_125970 ) ) ( not ( = ?auto_125969 ?auto_125970 ) ) ( ON-TABLE ?auto_125974 ) ( ON ?auto_125968 ?auto_125974 ) ( ON ?auto_125971 ?auto_125968 ) ( ON ?auto_125973 ?auto_125971 ) ( ON ?auto_125972 ?auto_125973 ) ( not ( = ?auto_125974 ?auto_125968 ) ) ( not ( = ?auto_125974 ?auto_125971 ) ) ( not ( = ?auto_125974 ?auto_125973 ) ) ( not ( = ?auto_125974 ?auto_125972 ) ) ( not ( = ?auto_125974 ?auto_125969 ) ) ( not ( = ?auto_125974 ?auto_125967 ) ) ( not ( = ?auto_125968 ?auto_125971 ) ) ( not ( = ?auto_125968 ?auto_125973 ) ) ( not ( = ?auto_125968 ?auto_125972 ) ) ( not ( = ?auto_125968 ?auto_125969 ) ) ( not ( = ?auto_125968 ?auto_125967 ) ) ( not ( = ?auto_125971 ?auto_125973 ) ) ( not ( = ?auto_125971 ?auto_125972 ) ) ( not ( = ?auto_125971 ?auto_125969 ) ) ( not ( = ?auto_125971 ?auto_125967 ) ) ( not ( = ?auto_125973 ?auto_125972 ) ) ( not ( = ?auto_125973 ?auto_125969 ) ) ( not ( = ?auto_125973 ?auto_125967 ) ) ( not ( = ?auto_125972 ?auto_125969 ) ) ( not ( = ?auto_125972 ?auto_125967 ) ) ( not ( = ?auto_125966 ?auto_125974 ) ) ( not ( = ?auto_125966 ?auto_125968 ) ) ( not ( = ?auto_125966 ?auto_125971 ) ) ( not ( = ?auto_125966 ?auto_125973 ) ) ( not ( = ?auto_125966 ?auto_125972 ) ) ( not ( = ?auto_125970 ?auto_125974 ) ) ( not ( = ?auto_125970 ?auto_125968 ) ) ( not ( = ?auto_125970 ?auto_125971 ) ) ( not ( = ?auto_125970 ?auto_125973 ) ) ( not ( = ?auto_125970 ?auto_125972 ) ) ( ON ?auto_125967 ?auto_125966 ) ( ON-TABLE ?auto_125970 ) ( CLEAR ?auto_125972 ) ( ON ?auto_125969 ?auto_125967 ) ( CLEAR ?auto_125969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125970 ?auto_125966 ?auto_125967 )
      ( MAKE-2PILE ?auto_125966 ?auto_125967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125975 - BLOCK
      ?auto_125976 - BLOCK
    )
    :vars
    (
      ?auto_125979 - BLOCK
      ?auto_125982 - BLOCK
      ?auto_125980 - BLOCK
      ?auto_125977 - BLOCK
      ?auto_125978 - BLOCK
      ?auto_125981 - BLOCK
      ?auto_125983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125975 ?auto_125976 ) ) ( not ( = ?auto_125975 ?auto_125979 ) ) ( not ( = ?auto_125976 ?auto_125979 ) ) ( ON ?auto_125975 ?auto_125982 ) ( not ( = ?auto_125975 ?auto_125982 ) ) ( not ( = ?auto_125976 ?auto_125982 ) ) ( not ( = ?auto_125979 ?auto_125982 ) ) ( ON-TABLE ?auto_125980 ) ( ON ?auto_125977 ?auto_125980 ) ( ON ?auto_125978 ?auto_125977 ) ( ON ?auto_125981 ?auto_125978 ) ( not ( = ?auto_125980 ?auto_125977 ) ) ( not ( = ?auto_125980 ?auto_125978 ) ) ( not ( = ?auto_125980 ?auto_125981 ) ) ( not ( = ?auto_125980 ?auto_125983 ) ) ( not ( = ?auto_125980 ?auto_125979 ) ) ( not ( = ?auto_125980 ?auto_125976 ) ) ( not ( = ?auto_125977 ?auto_125978 ) ) ( not ( = ?auto_125977 ?auto_125981 ) ) ( not ( = ?auto_125977 ?auto_125983 ) ) ( not ( = ?auto_125977 ?auto_125979 ) ) ( not ( = ?auto_125977 ?auto_125976 ) ) ( not ( = ?auto_125978 ?auto_125981 ) ) ( not ( = ?auto_125978 ?auto_125983 ) ) ( not ( = ?auto_125978 ?auto_125979 ) ) ( not ( = ?auto_125978 ?auto_125976 ) ) ( not ( = ?auto_125981 ?auto_125983 ) ) ( not ( = ?auto_125981 ?auto_125979 ) ) ( not ( = ?auto_125981 ?auto_125976 ) ) ( not ( = ?auto_125983 ?auto_125979 ) ) ( not ( = ?auto_125983 ?auto_125976 ) ) ( not ( = ?auto_125975 ?auto_125980 ) ) ( not ( = ?auto_125975 ?auto_125977 ) ) ( not ( = ?auto_125975 ?auto_125978 ) ) ( not ( = ?auto_125975 ?auto_125981 ) ) ( not ( = ?auto_125975 ?auto_125983 ) ) ( not ( = ?auto_125982 ?auto_125980 ) ) ( not ( = ?auto_125982 ?auto_125977 ) ) ( not ( = ?auto_125982 ?auto_125978 ) ) ( not ( = ?auto_125982 ?auto_125981 ) ) ( not ( = ?auto_125982 ?auto_125983 ) ) ( ON ?auto_125976 ?auto_125975 ) ( ON-TABLE ?auto_125982 ) ( ON ?auto_125979 ?auto_125976 ) ( CLEAR ?auto_125979 ) ( HOLDING ?auto_125983 ) ( CLEAR ?auto_125981 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125980 ?auto_125977 ?auto_125978 ?auto_125981 ?auto_125983 )
      ( MAKE-2PILE ?auto_125975 ?auto_125976 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125984 - BLOCK
      ?auto_125985 - BLOCK
    )
    :vars
    (
      ?auto_125990 - BLOCK
      ?auto_125992 - BLOCK
      ?auto_125986 - BLOCK
      ?auto_125991 - BLOCK
      ?auto_125989 - BLOCK
      ?auto_125987 - BLOCK
      ?auto_125988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125984 ?auto_125985 ) ) ( not ( = ?auto_125984 ?auto_125990 ) ) ( not ( = ?auto_125985 ?auto_125990 ) ) ( ON ?auto_125984 ?auto_125992 ) ( not ( = ?auto_125984 ?auto_125992 ) ) ( not ( = ?auto_125985 ?auto_125992 ) ) ( not ( = ?auto_125990 ?auto_125992 ) ) ( ON-TABLE ?auto_125986 ) ( ON ?auto_125991 ?auto_125986 ) ( ON ?auto_125989 ?auto_125991 ) ( ON ?auto_125987 ?auto_125989 ) ( not ( = ?auto_125986 ?auto_125991 ) ) ( not ( = ?auto_125986 ?auto_125989 ) ) ( not ( = ?auto_125986 ?auto_125987 ) ) ( not ( = ?auto_125986 ?auto_125988 ) ) ( not ( = ?auto_125986 ?auto_125990 ) ) ( not ( = ?auto_125986 ?auto_125985 ) ) ( not ( = ?auto_125991 ?auto_125989 ) ) ( not ( = ?auto_125991 ?auto_125987 ) ) ( not ( = ?auto_125991 ?auto_125988 ) ) ( not ( = ?auto_125991 ?auto_125990 ) ) ( not ( = ?auto_125991 ?auto_125985 ) ) ( not ( = ?auto_125989 ?auto_125987 ) ) ( not ( = ?auto_125989 ?auto_125988 ) ) ( not ( = ?auto_125989 ?auto_125990 ) ) ( not ( = ?auto_125989 ?auto_125985 ) ) ( not ( = ?auto_125987 ?auto_125988 ) ) ( not ( = ?auto_125987 ?auto_125990 ) ) ( not ( = ?auto_125987 ?auto_125985 ) ) ( not ( = ?auto_125988 ?auto_125990 ) ) ( not ( = ?auto_125988 ?auto_125985 ) ) ( not ( = ?auto_125984 ?auto_125986 ) ) ( not ( = ?auto_125984 ?auto_125991 ) ) ( not ( = ?auto_125984 ?auto_125989 ) ) ( not ( = ?auto_125984 ?auto_125987 ) ) ( not ( = ?auto_125984 ?auto_125988 ) ) ( not ( = ?auto_125992 ?auto_125986 ) ) ( not ( = ?auto_125992 ?auto_125991 ) ) ( not ( = ?auto_125992 ?auto_125989 ) ) ( not ( = ?auto_125992 ?auto_125987 ) ) ( not ( = ?auto_125992 ?auto_125988 ) ) ( ON ?auto_125985 ?auto_125984 ) ( ON-TABLE ?auto_125992 ) ( ON ?auto_125990 ?auto_125985 ) ( CLEAR ?auto_125987 ) ( ON ?auto_125988 ?auto_125990 ) ( CLEAR ?auto_125988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125992 ?auto_125984 ?auto_125985 ?auto_125990 )
      ( MAKE-2PILE ?auto_125984 ?auto_125985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125993 - BLOCK
      ?auto_125994 - BLOCK
    )
    :vars
    (
      ?auto_125996 - BLOCK
      ?auto_125998 - BLOCK
      ?auto_125997 - BLOCK
      ?auto_125995 - BLOCK
      ?auto_126000 - BLOCK
      ?auto_125999 - BLOCK
      ?auto_126001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125993 ?auto_125994 ) ) ( not ( = ?auto_125993 ?auto_125996 ) ) ( not ( = ?auto_125994 ?auto_125996 ) ) ( ON ?auto_125993 ?auto_125998 ) ( not ( = ?auto_125993 ?auto_125998 ) ) ( not ( = ?auto_125994 ?auto_125998 ) ) ( not ( = ?auto_125996 ?auto_125998 ) ) ( ON-TABLE ?auto_125997 ) ( ON ?auto_125995 ?auto_125997 ) ( ON ?auto_126000 ?auto_125995 ) ( not ( = ?auto_125997 ?auto_125995 ) ) ( not ( = ?auto_125997 ?auto_126000 ) ) ( not ( = ?auto_125997 ?auto_125999 ) ) ( not ( = ?auto_125997 ?auto_126001 ) ) ( not ( = ?auto_125997 ?auto_125996 ) ) ( not ( = ?auto_125997 ?auto_125994 ) ) ( not ( = ?auto_125995 ?auto_126000 ) ) ( not ( = ?auto_125995 ?auto_125999 ) ) ( not ( = ?auto_125995 ?auto_126001 ) ) ( not ( = ?auto_125995 ?auto_125996 ) ) ( not ( = ?auto_125995 ?auto_125994 ) ) ( not ( = ?auto_126000 ?auto_125999 ) ) ( not ( = ?auto_126000 ?auto_126001 ) ) ( not ( = ?auto_126000 ?auto_125996 ) ) ( not ( = ?auto_126000 ?auto_125994 ) ) ( not ( = ?auto_125999 ?auto_126001 ) ) ( not ( = ?auto_125999 ?auto_125996 ) ) ( not ( = ?auto_125999 ?auto_125994 ) ) ( not ( = ?auto_126001 ?auto_125996 ) ) ( not ( = ?auto_126001 ?auto_125994 ) ) ( not ( = ?auto_125993 ?auto_125997 ) ) ( not ( = ?auto_125993 ?auto_125995 ) ) ( not ( = ?auto_125993 ?auto_126000 ) ) ( not ( = ?auto_125993 ?auto_125999 ) ) ( not ( = ?auto_125993 ?auto_126001 ) ) ( not ( = ?auto_125998 ?auto_125997 ) ) ( not ( = ?auto_125998 ?auto_125995 ) ) ( not ( = ?auto_125998 ?auto_126000 ) ) ( not ( = ?auto_125998 ?auto_125999 ) ) ( not ( = ?auto_125998 ?auto_126001 ) ) ( ON ?auto_125994 ?auto_125993 ) ( ON-TABLE ?auto_125998 ) ( ON ?auto_125996 ?auto_125994 ) ( ON ?auto_126001 ?auto_125996 ) ( CLEAR ?auto_126001 ) ( HOLDING ?auto_125999 ) ( CLEAR ?auto_126000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125997 ?auto_125995 ?auto_126000 ?auto_125999 )
      ( MAKE-2PILE ?auto_125993 ?auto_125994 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126002 - BLOCK
      ?auto_126003 - BLOCK
    )
    :vars
    (
      ?auto_126009 - BLOCK
      ?auto_126008 - BLOCK
      ?auto_126005 - BLOCK
      ?auto_126010 - BLOCK
      ?auto_126006 - BLOCK
      ?auto_126007 - BLOCK
      ?auto_126004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126002 ?auto_126003 ) ) ( not ( = ?auto_126002 ?auto_126009 ) ) ( not ( = ?auto_126003 ?auto_126009 ) ) ( ON ?auto_126002 ?auto_126008 ) ( not ( = ?auto_126002 ?auto_126008 ) ) ( not ( = ?auto_126003 ?auto_126008 ) ) ( not ( = ?auto_126009 ?auto_126008 ) ) ( ON-TABLE ?auto_126005 ) ( ON ?auto_126010 ?auto_126005 ) ( ON ?auto_126006 ?auto_126010 ) ( not ( = ?auto_126005 ?auto_126010 ) ) ( not ( = ?auto_126005 ?auto_126006 ) ) ( not ( = ?auto_126005 ?auto_126007 ) ) ( not ( = ?auto_126005 ?auto_126004 ) ) ( not ( = ?auto_126005 ?auto_126009 ) ) ( not ( = ?auto_126005 ?auto_126003 ) ) ( not ( = ?auto_126010 ?auto_126006 ) ) ( not ( = ?auto_126010 ?auto_126007 ) ) ( not ( = ?auto_126010 ?auto_126004 ) ) ( not ( = ?auto_126010 ?auto_126009 ) ) ( not ( = ?auto_126010 ?auto_126003 ) ) ( not ( = ?auto_126006 ?auto_126007 ) ) ( not ( = ?auto_126006 ?auto_126004 ) ) ( not ( = ?auto_126006 ?auto_126009 ) ) ( not ( = ?auto_126006 ?auto_126003 ) ) ( not ( = ?auto_126007 ?auto_126004 ) ) ( not ( = ?auto_126007 ?auto_126009 ) ) ( not ( = ?auto_126007 ?auto_126003 ) ) ( not ( = ?auto_126004 ?auto_126009 ) ) ( not ( = ?auto_126004 ?auto_126003 ) ) ( not ( = ?auto_126002 ?auto_126005 ) ) ( not ( = ?auto_126002 ?auto_126010 ) ) ( not ( = ?auto_126002 ?auto_126006 ) ) ( not ( = ?auto_126002 ?auto_126007 ) ) ( not ( = ?auto_126002 ?auto_126004 ) ) ( not ( = ?auto_126008 ?auto_126005 ) ) ( not ( = ?auto_126008 ?auto_126010 ) ) ( not ( = ?auto_126008 ?auto_126006 ) ) ( not ( = ?auto_126008 ?auto_126007 ) ) ( not ( = ?auto_126008 ?auto_126004 ) ) ( ON ?auto_126003 ?auto_126002 ) ( ON-TABLE ?auto_126008 ) ( ON ?auto_126009 ?auto_126003 ) ( ON ?auto_126004 ?auto_126009 ) ( CLEAR ?auto_126006 ) ( ON ?auto_126007 ?auto_126004 ) ( CLEAR ?auto_126007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126008 ?auto_126002 ?auto_126003 ?auto_126009 ?auto_126004 )
      ( MAKE-2PILE ?auto_126002 ?auto_126003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126011 - BLOCK
      ?auto_126012 - BLOCK
    )
    :vars
    (
      ?auto_126018 - BLOCK
      ?auto_126019 - BLOCK
      ?auto_126013 - BLOCK
      ?auto_126015 - BLOCK
      ?auto_126014 - BLOCK
      ?auto_126017 - BLOCK
      ?auto_126016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126011 ?auto_126012 ) ) ( not ( = ?auto_126011 ?auto_126018 ) ) ( not ( = ?auto_126012 ?auto_126018 ) ) ( ON ?auto_126011 ?auto_126019 ) ( not ( = ?auto_126011 ?auto_126019 ) ) ( not ( = ?auto_126012 ?auto_126019 ) ) ( not ( = ?auto_126018 ?auto_126019 ) ) ( ON-TABLE ?auto_126013 ) ( ON ?auto_126015 ?auto_126013 ) ( not ( = ?auto_126013 ?auto_126015 ) ) ( not ( = ?auto_126013 ?auto_126014 ) ) ( not ( = ?auto_126013 ?auto_126017 ) ) ( not ( = ?auto_126013 ?auto_126016 ) ) ( not ( = ?auto_126013 ?auto_126018 ) ) ( not ( = ?auto_126013 ?auto_126012 ) ) ( not ( = ?auto_126015 ?auto_126014 ) ) ( not ( = ?auto_126015 ?auto_126017 ) ) ( not ( = ?auto_126015 ?auto_126016 ) ) ( not ( = ?auto_126015 ?auto_126018 ) ) ( not ( = ?auto_126015 ?auto_126012 ) ) ( not ( = ?auto_126014 ?auto_126017 ) ) ( not ( = ?auto_126014 ?auto_126016 ) ) ( not ( = ?auto_126014 ?auto_126018 ) ) ( not ( = ?auto_126014 ?auto_126012 ) ) ( not ( = ?auto_126017 ?auto_126016 ) ) ( not ( = ?auto_126017 ?auto_126018 ) ) ( not ( = ?auto_126017 ?auto_126012 ) ) ( not ( = ?auto_126016 ?auto_126018 ) ) ( not ( = ?auto_126016 ?auto_126012 ) ) ( not ( = ?auto_126011 ?auto_126013 ) ) ( not ( = ?auto_126011 ?auto_126015 ) ) ( not ( = ?auto_126011 ?auto_126014 ) ) ( not ( = ?auto_126011 ?auto_126017 ) ) ( not ( = ?auto_126011 ?auto_126016 ) ) ( not ( = ?auto_126019 ?auto_126013 ) ) ( not ( = ?auto_126019 ?auto_126015 ) ) ( not ( = ?auto_126019 ?auto_126014 ) ) ( not ( = ?auto_126019 ?auto_126017 ) ) ( not ( = ?auto_126019 ?auto_126016 ) ) ( ON ?auto_126012 ?auto_126011 ) ( ON-TABLE ?auto_126019 ) ( ON ?auto_126018 ?auto_126012 ) ( ON ?auto_126016 ?auto_126018 ) ( ON ?auto_126017 ?auto_126016 ) ( CLEAR ?auto_126017 ) ( HOLDING ?auto_126014 ) ( CLEAR ?auto_126015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126013 ?auto_126015 ?auto_126014 )
      ( MAKE-2PILE ?auto_126011 ?auto_126012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126020 - BLOCK
      ?auto_126021 - BLOCK
    )
    :vars
    (
      ?auto_126028 - BLOCK
      ?auto_126027 - BLOCK
      ?auto_126025 - BLOCK
      ?auto_126024 - BLOCK
      ?auto_126022 - BLOCK
      ?auto_126026 - BLOCK
      ?auto_126023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126020 ?auto_126021 ) ) ( not ( = ?auto_126020 ?auto_126028 ) ) ( not ( = ?auto_126021 ?auto_126028 ) ) ( ON ?auto_126020 ?auto_126027 ) ( not ( = ?auto_126020 ?auto_126027 ) ) ( not ( = ?auto_126021 ?auto_126027 ) ) ( not ( = ?auto_126028 ?auto_126027 ) ) ( ON-TABLE ?auto_126025 ) ( ON ?auto_126024 ?auto_126025 ) ( not ( = ?auto_126025 ?auto_126024 ) ) ( not ( = ?auto_126025 ?auto_126022 ) ) ( not ( = ?auto_126025 ?auto_126026 ) ) ( not ( = ?auto_126025 ?auto_126023 ) ) ( not ( = ?auto_126025 ?auto_126028 ) ) ( not ( = ?auto_126025 ?auto_126021 ) ) ( not ( = ?auto_126024 ?auto_126022 ) ) ( not ( = ?auto_126024 ?auto_126026 ) ) ( not ( = ?auto_126024 ?auto_126023 ) ) ( not ( = ?auto_126024 ?auto_126028 ) ) ( not ( = ?auto_126024 ?auto_126021 ) ) ( not ( = ?auto_126022 ?auto_126026 ) ) ( not ( = ?auto_126022 ?auto_126023 ) ) ( not ( = ?auto_126022 ?auto_126028 ) ) ( not ( = ?auto_126022 ?auto_126021 ) ) ( not ( = ?auto_126026 ?auto_126023 ) ) ( not ( = ?auto_126026 ?auto_126028 ) ) ( not ( = ?auto_126026 ?auto_126021 ) ) ( not ( = ?auto_126023 ?auto_126028 ) ) ( not ( = ?auto_126023 ?auto_126021 ) ) ( not ( = ?auto_126020 ?auto_126025 ) ) ( not ( = ?auto_126020 ?auto_126024 ) ) ( not ( = ?auto_126020 ?auto_126022 ) ) ( not ( = ?auto_126020 ?auto_126026 ) ) ( not ( = ?auto_126020 ?auto_126023 ) ) ( not ( = ?auto_126027 ?auto_126025 ) ) ( not ( = ?auto_126027 ?auto_126024 ) ) ( not ( = ?auto_126027 ?auto_126022 ) ) ( not ( = ?auto_126027 ?auto_126026 ) ) ( not ( = ?auto_126027 ?auto_126023 ) ) ( ON ?auto_126021 ?auto_126020 ) ( ON-TABLE ?auto_126027 ) ( ON ?auto_126028 ?auto_126021 ) ( ON ?auto_126023 ?auto_126028 ) ( ON ?auto_126026 ?auto_126023 ) ( CLEAR ?auto_126024 ) ( ON ?auto_126022 ?auto_126026 ) ( CLEAR ?auto_126022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126027 ?auto_126020 ?auto_126021 ?auto_126028 ?auto_126023 ?auto_126026 )
      ( MAKE-2PILE ?auto_126020 ?auto_126021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126029 - BLOCK
      ?auto_126030 - BLOCK
    )
    :vars
    (
      ?auto_126032 - BLOCK
      ?auto_126033 - BLOCK
      ?auto_126037 - BLOCK
      ?auto_126036 - BLOCK
      ?auto_126031 - BLOCK
      ?auto_126035 - BLOCK
      ?auto_126034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126029 ?auto_126030 ) ) ( not ( = ?auto_126029 ?auto_126032 ) ) ( not ( = ?auto_126030 ?auto_126032 ) ) ( ON ?auto_126029 ?auto_126033 ) ( not ( = ?auto_126029 ?auto_126033 ) ) ( not ( = ?auto_126030 ?auto_126033 ) ) ( not ( = ?auto_126032 ?auto_126033 ) ) ( ON-TABLE ?auto_126037 ) ( not ( = ?auto_126037 ?auto_126036 ) ) ( not ( = ?auto_126037 ?auto_126031 ) ) ( not ( = ?auto_126037 ?auto_126035 ) ) ( not ( = ?auto_126037 ?auto_126034 ) ) ( not ( = ?auto_126037 ?auto_126032 ) ) ( not ( = ?auto_126037 ?auto_126030 ) ) ( not ( = ?auto_126036 ?auto_126031 ) ) ( not ( = ?auto_126036 ?auto_126035 ) ) ( not ( = ?auto_126036 ?auto_126034 ) ) ( not ( = ?auto_126036 ?auto_126032 ) ) ( not ( = ?auto_126036 ?auto_126030 ) ) ( not ( = ?auto_126031 ?auto_126035 ) ) ( not ( = ?auto_126031 ?auto_126034 ) ) ( not ( = ?auto_126031 ?auto_126032 ) ) ( not ( = ?auto_126031 ?auto_126030 ) ) ( not ( = ?auto_126035 ?auto_126034 ) ) ( not ( = ?auto_126035 ?auto_126032 ) ) ( not ( = ?auto_126035 ?auto_126030 ) ) ( not ( = ?auto_126034 ?auto_126032 ) ) ( not ( = ?auto_126034 ?auto_126030 ) ) ( not ( = ?auto_126029 ?auto_126037 ) ) ( not ( = ?auto_126029 ?auto_126036 ) ) ( not ( = ?auto_126029 ?auto_126031 ) ) ( not ( = ?auto_126029 ?auto_126035 ) ) ( not ( = ?auto_126029 ?auto_126034 ) ) ( not ( = ?auto_126033 ?auto_126037 ) ) ( not ( = ?auto_126033 ?auto_126036 ) ) ( not ( = ?auto_126033 ?auto_126031 ) ) ( not ( = ?auto_126033 ?auto_126035 ) ) ( not ( = ?auto_126033 ?auto_126034 ) ) ( ON ?auto_126030 ?auto_126029 ) ( ON-TABLE ?auto_126033 ) ( ON ?auto_126032 ?auto_126030 ) ( ON ?auto_126034 ?auto_126032 ) ( ON ?auto_126035 ?auto_126034 ) ( ON ?auto_126031 ?auto_126035 ) ( CLEAR ?auto_126031 ) ( HOLDING ?auto_126036 ) ( CLEAR ?auto_126037 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126037 ?auto_126036 )
      ( MAKE-2PILE ?auto_126029 ?auto_126030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126038 - BLOCK
      ?auto_126039 - BLOCK
    )
    :vars
    (
      ?auto_126046 - BLOCK
      ?auto_126040 - BLOCK
      ?auto_126042 - BLOCK
      ?auto_126044 - BLOCK
      ?auto_126045 - BLOCK
      ?auto_126043 - BLOCK
      ?auto_126041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126038 ?auto_126039 ) ) ( not ( = ?auto_126038 ?auto_126046 ) ) ( not ( = ?auto_126039 ?auto_126046 ) ) ( ON ?auto_126038 ?auto_126040 ) ( not ( = ?auto_126038 ?auto_126040 ) ) ( not ( = ?auto_126039 ?auto_126040 ) ) ( not ( = ?auto_126046 ?auto_126040 ) ) ( ON-TABLE ?auto_126042 ) ( not ( = ?auto_126042 ?auto_126044 ) ) ( not ( = ?auto_126042 ?auto_126045 ) ) ( not ( = ?auto_126042 ?auto_126043 ) ) ( not ( = ?auto_126042 ?auto_126041 ) ) ( not ( = ?auto_126042 ?auto_126046 ) ) ( not ( = ?auto_126042 ?auto_126039 ) ) ( not ( = ?auto_126044 ?auto_126045 ) ) ( not ( = ?auto_126044 ?auto_126043 ) ) ( not ( = ?auto_126044 ?auto_126041 ) ) ( not ( = ?auto_126044 ?auto_126046 ) ) ( not ( = ?auto_126044 ?auto_126039 ) ) ( not ( = ?auto_126045 ?auto_126043 ) ) ( not ( = ?auto_126045 ?auto_126041 ) ) ( not ( = ?auto_126045 ?auto_126046 ) ) ( not ( = ?auto_126045 ?auto_126039 ) ) ( not ( = ?auto_126043 ?auto_126041 ) ) ( not ( = ?auto_126043 ?auto_126046 ) ) ( not ( = ?auto_126043 ?auto_126039 ) ) ( not ( = ?auto_126041 ?auto_126046 ) ) ( not ( = ?auto_126041 ?auto_126039 ) ) ( not ( = ?auto_126038 ?auto_126042 ) ) ( not ( = ?auto_126038 ?auto_126044 ) ) ( not ( = ?auto_126038 ?auto_126045 ) ) ( not ( = ?auto_126038 ?auto_126043 ) ) ( not ( = ?auto_126038 ?auto_126041 ) ) ( not ( = ?auto_126040 ?auto_126042 ) ) ( not ( = ?auto_126040 ?auto_126044 ) ) ( not ( = ?auto_126040 ?auto_126045 ) ) ( not ( = ?auto_126040 ?auto_126043 ) ) ( not ( = ?auto_126040 ?auto_126041 ) ) ( ON ?auto_126039 ?auto_126038 ) ( ON-TABLE ?auto_126040 ) ( ON ?auto_126046 ?auto_126039 ) ( ON ?auto_126041 ?auto_126046 ) ( ON ?auto_126043 ?auto_126041 ) ( ON ?auto_126045 ?auto_126043 ) ( CLEAR ?auto_126042 ) ( ON ?auto_126044 ?auto_126045 ) ( CLEAR ?auto_126044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126040 ?auto_126038 ?auto_126039 ?auto_126046 ?auto_126041 ?auto_126043 ?auto_126045 )
      ( MAKE-2PILE ?auto_126038 ?auto_126039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126047 - BLOCK
      ?auto_126048 - BLOCK
    )
    :vars
    (
      ?auto_126052 - BLOCK
      ?auto_126053 - BLOCK
      ?auto_126054 - BLOCK
      ?auto_126055 - BLOCK
      ?auto_126050 - BLOCK
      ?auto_126049 - BLOCK
      ?auto_126051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126047 ?auto_126048 ) ) ( not ( = ?auto_126047 ?auto_126052 ) ) ( not ( = ?auto_126048 ?auto_126052 ) ) ( ON ?auto_126047 ?auto_126053 ) ( not ( = ?auto_126047 ?auto_126053 ) ) ( not ( = ?auto_126048 ?auto_126053 ) ) ( not ( = ?auto_126052 ?auto_126053 ) ) ( not ( = ?auto_126054 ?auto_126055 ) ) ( not ( = ?auto_126054 ?auto_126050 ) ) ( not ( = ?auto_126054 ?auto_126049 ) ) ( not ( = ?auto_126054 ?auto_126051 ) ) ( not ( = ?auto_126054 ?auto_126052 ) ) ( not ( = ?auto_126054 ?auto_126048 ) ) ( not ( = ?auto_126055 ?auto_126050 ) ) ( not ( = ?auto_126055 ?auto_126049 ) ) ( not ( = ?auto_126055 ?auto_126051 ) ) ( not ( = ?auto_126055 ?auto_126052 ) ) ( not ( = ?auto_126055 ?auto_126048 ) ) ( not ( = ?auto_126050 ?auto_126049 ) ) ( not ( = ?auto_126050 ?auto_126051 ) ) ( not ( = ?auto_126050 ?auto_126052 ) ) ( not ( = ?auto_126050 ?auto_126048 ) ) ( not ( = ?auto_126049 ?auto_126051 ) ) ( not ( = ?auto_126049 ?auto_126052 ) ) ( not ( = ?auto_126049 ?auto_126048 ) ) ( not ( = ?auto_126051 ?auto_126052 ) ) ( not ( = ?auto_126051 ?auto_126048 ) ) ( not ( = ?auto_126047 ?auto_126054 ) ) ( not ( = ?auto_126047 ?auto_126055 ) ) ( not ( = ?auto_126047 ?auto_126050 ) ) ( not ( = ?auto_126047 ?auto_126049 ) ) ( not ( = ?auto_126047 ?auto_126051 ) ) ( not ( = ?auto_126053 ?auto_126054 ) ) ( not ( = ?auto_126053 ?auto_126055 ) ) ( not ( = ?auto_126053 ?auto_126050 ) ) ( not ( = ?auto_126053 ?auto_126049 ) ) ( not ( = ?auto_126053 ?auto_126051 ) ) ( ON ?auto_126048 ?auto_126047 ) ( ON-TABLE ?auto_126053 ) ( ON ?auto_126052 ?auto_126048 ) ( ON ?auto_126051 ?auto_126052 ) ( ON ?auto_126049 ?auto_126051 ) ( ON ?auto_126050 ?auto_126049 ) ( ON ?auto_126055 ?auto_126050 ) ( CLEAR ?auto_126055 ) ( HOLDING ?auto_126054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126054 )
      ( MAKE-2PILE ?auto_126047 ?auto_126048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126056 - BLOCK
      ?auto_126057 - BLOCK
    )
    :vars
    (
      ?auto_126058 - BLOCK
      ?auto_126062 - BLOCK
      ?auto_126059 - BLOCK
      ?auto_126060 - BLOCK
      ?auto_126061 - BLOCK
      ?auto_126063 - BLOCK
      ?auto_126064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126056 ?auto_126057 ) ) ( not ( = ?auto_126056 ?auto_126058 ) ) ( not ( = ?auto_126057 ?auto_126058 ) ) ( ON ?auto_126056 ?auto_126062 ) ( not ( = ?auto_126056 ?auto_126062 ) ) ( not ( = ?auto_126057 ?auto_126062 ) ) ( not ( = ?auto_126058 ?auto_126062 ) ) ( not ( = ?auto_126059 ?auto_126060 ) ) ( not ( = ?auto_126059 ?auto_126061 ) ) ( not ( = ?auto_126059 ?auto_126063 ) ) ( not ( = ?auto_126059 ?auto_126064 ) ) ( not ( = ?auto_126059 ?auto_126058 ) ) ( not ( = ?auto_126059 ?auto_126057 ) ) ( not ( = ?auto_126060 ?auto_126061 ) ) ( not ( = ?auto_126060 ?auto_126063 ) ) ( not ( = ?auto_126060 ?auto_126064 ) ) ( not ( = ?auto_126060 ?auto_126058 ) ) ( not ( = ?auto_126060 ?auto_126057 ) ) ( not ( = ?auto_126061 ?auto_126063 ) ) ( not ( = ?auto_126061 ?auto_126064 ) ) ( not ( = ?auto_126061 ?auto_126058 ) ) ( not ( = ?auto_126061 ?auto_126057 ) ) ( not ( = ?auto_126063 ?auto_126064 ) ) ( not ( = ?auto_126063 ?auto_126058 ) ) ( not ( = ?auto_126063 ?auto_126057 ) ) ( not ( = ?auto_126064 ?auto_126058 ) ) ( not ( = ?auto_126064 ?auto_126057 ) ) ( not ( = ?auto_126056 ?auto_126059 ) ) ( not ( = ?auto_126056 ?auto_126060 ) ) ( not ( = ?auto_126056 ?auto_126061 ) ) ( not ( = ?auto_126056 ?auto_126063 ) ) ( not ( = ?auto_126056 ?auto_126064 ) ) ( not ( = ?auto_126062 ?auto_126059 ) ) ( not ( = ?auto_126062 ?auto_126060 ) ) ( not ( = ?auto_126062 ?auto_126061 ) ) ( not ( = ?auto_126062 ?auto_126063 ) ) ( not ( = ?auto_126062 ?auto_126064 ) ) ( ON ?auto_126057 ?auto_126056 ) ( ON-TABLE ?auto_126062 ) ( ON ?auto_126058 ?auto_126057 ) ( ON ?auto_126064 ?auto_126058 ) ( ON ?auto_126063 ?auto_126064 ) ( ON ?auto_126061 ?auto_126063 ) ( ON ?auto_126060 ?auto_126061 ) ( ON ?auto_126059 ?auto_126060 ) ( CLEAR ?auto_126059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_126062 ?auto_126056 ?auto_126057 ?auto_126058 ?auto_126064 ?auto_126063 ?auto_126061 ?auto_126060 )
      ( MAKE-2PILE ?auto_126056 ?auto_126057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126092 - BLOCK
      ?auto_126093 - BLOCK
      ?auto_126094 - BLOCK
      ?auto_126095 - BLOCK
      ?auto_126096 - BLOCK
    )
    :vars
    (
      ?auto_126097 - BLOCK
      ?auto_126099 - BLOCK
      ?auto_126098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126097 ?auto_126096 ) ( ON-TABLE ?auto_126092 ) ( ON ?auto_126093 ?auto_126092 ) ( ON ?auto_126094 ?auto_126093 ) ( ON ?auto_126095 ?auto_126094 ) ( ON ?auto_126096 ?auto_126095 ) ( not ( = ?auto_126092 ?auto_126093 ) ) ( not ( = ?auto_126092 ?auto_126094 ) ) ( not ( = ?auto_126092 ?auto_126095 ) ) ( not ( = ?auto_126092 ?auto_126096 ) ) ( not ( = ?auto_126092 ?auto_126097 ) ) ( not ( = ?auto_126093 ?auto_126094 ) ) ( not ( = ?auto_126093 ?auto_126095 ) ) ( not ( = ?auto_126093 ?auto_126096 ) ) ( not ( = ?auto_126093 ?auto_126097 ) ) ( not ( = ?auto_126094 ?auto_126095 ) ) ( not ( = ?auto_126094 ?auto_126096 ) ) ( not ( = ?auto_126094 ?auto_126097 ) ) ( not ( = ?auto_126095 ?auto_126096 ) ) ( not ( = ?auto_126095 ?auto_126097 ) ) ( not ( = ?auto_126096 ?auto_126097 ) ) ( not ( = ?auto_126092 ?auto_126099 ) ) ( not ( = ?auto_126092 ?auto_126098 ) ) ( not ( = ?auto_126093 ?auto_126099 ) ) ( not ( = ?auto_126093 ?auto_126098 ) ) ( not ( = ?auto_126094 ?auto_126099 ) ) ( not ( = ?auto_126094 ?auto_126098 ) ) ( not ( = ?auto_126095 ?auto_126099 ) ) ( not ( = ?auto_126095 ?auto_126098 ) ) ( not ( = ?auto_126096 ?auto_126099 ) ) ( not ( = ?auto_126096 ?auto_126098 ) ) ( not ( = ?auto_126097 ?auto_126099 ) ) ( not ( = ?auto_126097 ?auto_126098 ) ) ( not ( = ?auto_126099 ?auto_126098 ) ) ( ON ?auto_126099 ?auto_126097 ) ( CLEAR ?auto_126099 ) ( HOLDING ?auto_126098 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126098 )
      ( MAKE-5PILE ?auto_126092 ?auto_126093 ?auto_126094 ?auto_126095 ?auto_126096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126205 - BLOCK
      ?auto_126206 - BLOCK
      ?auto_126207 - BLOCK
    )
    :vars
    (
      ?auto_126208 - BLOCK
      ?auto_126212 - BLOCK
      ?auto_126211 - BLOCK
      ?auto_126210 - BLOCK
      ?auto_126209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126205 ) ( not ( = ?auto_126205 ?auto_126206 ) ) ( not ( = ?auto_126205 ?auto_126207 ) ) ( not ( = ?auto_126206 ?auto_126207 ) ) ( ON ?auto_126207 ?auto_126208 ) ( not ( = ?auto_126205 ?auto_126208 ) ) ( not ( = ?auto_126206 ?auto_126208 ) ) ( not ( = ?auto_126207 ?auto_126208 ) ) ( CLEAR ?auto_126205 ) ( ON ?auto_126206 ?auto_126207 ) ( CLEAR ?auto_126206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126212 ) ( ON ?auto_126211 ?auto_126212 ) ( ON ?auto_126210 ?auto_126211 ) ( ON ?auto_126209 ?auto_126210 ) ( ON ?auto_126208 ?auto_126209 ) ( not ( = ?auto_126212 ?auto_126211 ) ) ( not ( = ?auto_126212 ?auto_126210 ) ) ( not ( = ?auto_126212 ?auto_126209 ) ) ( not ( = ?auto_126212 ?auto_126208 ) ) ( not ( = ?auto_126212 ?auto_126207 ) ) ( not ( = ?auto_126212 ?auto_126206 ) ) ( not ( = ?auto_126211 ?auto_126210 ) ) ( not ( = ?auto_126211 ?auto_126209 ) ) ( not ( = ?auto_126211 ?auto_126208 ) ) ( not ( = ?auto_126211 ?auto_126207 ) ) ( not ( = ?auto_126211 ?auto_126206 ) ) ( not ( = ?auto_126210 ?auto_126209 ) ) ( not ( = ?auto_126210 ?auto_126208 ) ) ( not ( = ?auto_126210 ?auto_126207 ) ) ( not ( = ?auto_126210 ?auto_126206 ) ) ( not ( = ?auto_126209 ?auto_126208 ) ) ( not ( = ?auto_126209 ?auto_126207 ) ) ( not ( = ?auto_126209 ?auto_126206 ) ) ( not ( = ?auto_126205 ?auto_126212 ) ) ( not ( = ?auto_126205 ?auto_126211 ) ) ( not ( = ?auto_126205 ?auto_126210 ) ) ( not ( = ?auto_126205 ?auto_126209 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126212 ?auto_126211 ?auto_126210 ?auto_126209 ?auto_126208 ?auto_126207 )
      ( MAKE-3PILE ?auto_126205 ?auto_126206 ?auto_126207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126213 - BLOCK
      ?auto_126214 - BLOCK
      ?auto_126215 - BLOCK
    )
    :vars
    (
      ?auto_126220 - BLOCK
      ?auto_126217 - BLOCK
      ?auto_126218 - BLOCK
      ?auto_126219 - BLOCK
      ?auto_126216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126213 ?auto_126214 ) ) ( not ( = ?auto_126213 ?auto_126215 ) ) ( not ( = ?auto_126214 ?auto_126215 ) ) ( ON ?auto_126215 ?auto_126220 ) ( not ( = ?auto_126213 ?auto_126220 ) ) ( not ( = ?auto_126214 ?auto_126220 ) ) ( not ( = ?auto_126215 ?auto_126220 ) ) ( ON ?auto_126214 ?auto_126215 ) ( CLEAR ?auto_126214 ) ( ON-TABLE ?auto_126217 ) ( ON ?auto_126218 ?auto_126217 ) ( ON ?auto_126219 ?auto_126218 ) ( ON ?auto_126216 ?auto_126219 ) ( ON ?auto_126220 ?auto_126216 ) ( not ( = ?auto_126217 ?auto_126218 ) ) ( not ( = ?auto_126217 ?auto_126219 ) ) ( not ( = ?auto_126217 ?auto_126216 ) ) ( not ( = ?auto_126217 ?auto_126220 ) ) ( not ( = ?auto_126217 ?auto_126215 ) ) ( not ( = ?auto_126217 ?auto_126214 ) ) ( not ( = ?auto_126218 ?auto_126219 ) ) ( not ( = ?auto_126218 ?auto_126216 ) ) ( not ( = ?auto_126218 ?auto_126220 ) ) ( not ( = ?auto_126218 ?auto_126215 ) ) ( not ( = ?auto_126218 ?auto_126214 ) ) ( not ( = ?auto_126219 ?auto_126216 ) ) ( not ( = ?auto_126219 ?auto_126220 ) ) ( not ( = ?auto_126219 ?auto_126215 ) ) ( not ( = ?auto_126219 ?auto_126214 ) ) ( not ( = ?auto_126216 ?auto_126220 ) ) ( not ( = ?auto_126216 ?auto_126215 ) ) ( not ( = ?auto_126216 ?auto_126214 ) ) ( not ( = ?auto_126213 ?auto_126217 ) ) ( not ( = ?auto_126213 ?auto_126218 ) ) ( not ( = ?auto_126213 ?auto_126219 ) ) ( not ( = ?auto_126213 ?auto_126216 ) ) ( HOLDING ?auto_126213 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126213 )
      ( MAKE-3PILE ?auto_126213 ?auto_126214 ?auto_126215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126221 - BLOCK
      ?auto_126222 - BLOCK
      ?auto_126223 - BLOCK
    )
    :vars
    (
      ?auto_126225 - BLOCK
      ?auto_126226 - BLOCK
      ?auto_126227 - BLOCK
      ?auto_126224 - BLOCK
      ?auto_126228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126221 ?auto_126222 ) ) ( not ( = ?auto_126221 ?auto_126223 ) ) ( not ( = ?auto_126222 ?auto_126223 ) ) ( ON ?auto_126223 ?auto_126225 ) ( not ( = ?auto_126221 ?auto_126225 ) ) ( not ( = ?auto_126222 ?auto_126225 ) ) ( not ( = ?auto_126223 ?auto_126225 ) ) ( ON ?auto_126222 ?auto_126223 ) ( ON-TABLE ?auto_126226 ) ( ON ?auto_126227 ?auto_126226 ) ( ON ?auto_126224 ?auto_126227 ) ( ON ?auto_126228 ?auto_126224 ) ( ON ?auto_126225 ?auto_126228 ) ( not ( = ?auto_126226 ?auto_126227 ) ) ( not ( = ?auto_126226 ?auto_126224 ) ) ( not ( = ?auto_126226 ?auto_126228 ) ) ( not ( = ?auto_126226 ?auto_126225 ) ) ( not ( = ?auto_126226 ?auto_126223 ) ) ( not ( = ?auto_126226 ?auto_126222 ) ) ( not ( = ?auto_126227 ?auto_126224 ) ) ( not ( = ?auto_126227 ?auto_126228 ) ) ( not ( = ?auto_126227 ?auto_126225 ) ) ( not ( = ?auto_126227 ?auto_126223 ) ) ( not ( = ?auto_126227 ?auto_126222 ) ) ( not ( = ?auto_126224 ?auto_126228 ) ) ( not ( = ?auto_126224 ?auto_126225 ) ) ( not ( = ?auto_126224 ?auto_126223 ) ) ( not ( = ?auto_126224 ?auto_126222 ) ) ( not ( = ?auto_126228 ?auto_126225 ) ) ( not ( = ?auto_126228 ?auto_126223 ) ) ( not ( = ?auto_126228 ?auto_126222 ) ) ( not ( = ?auto_126221 ?auto_126226 ) ) ( not ( = ?auto_126221 ?auto_126227 ) ) ( not ( = ?auto_126221 ?auto_126224 ) ) ( not ( = ?auto_126221 ?auto_126228 ) ) ( ON ?auto_126221 ?auto_126222 ) ( CLEAR ?auto_126221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126226 ?auto_126227 ?auto_126224 ?auto_126228 ?auto_126225 ?auto_126223 ?auto_126222 )
      ( MAKE-3PILE ?auto_126221 ?auto_126222 ?auto_126223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126232 - BLOCK
      ?auto_126233 - BLOCK
      ?auto_126234 - BLOCK
    )
    :vars
    (
      ?auto_126235 - BLOCK
      ?auto_126236 - BLOCK
      ?auto_126238 - BLOCK
      ?auto_126237 - BLOCK
      ?auto_126239 - BLOCK
      ?auto_126240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126232 ?auto_126233 ) ) ( not ( = ?auto_126232 ?auto_126234 ) ) ( not ( = ?auto_126233 ?auto_126234 ) ) ( ON ?auto_126234 ?auto_126235 ) ( not ( = ?auto_126232 ?auto_126235 ) ) ( not ( = ?auto_126233 ?auto_126235 ) ) ( not ( = ?auto_126234 ?auto_126235 ) ) ( ON ?auto_126233 ?auto_126234 ) ( CLEAR ?auto_126233 ) ( ON-TABLE ?auto_126236 ) ( ON ?auto_126238 ?auto_126236 ) ( ON ?auto_126237 ?auto_126238 ) ( ON ?auto_126239 ?auto_126237 ) ( ON ?auto_126235 ?auto_126239 ) ( not ( = ?auto_126236 ?auto_126238 ) ) ( not ( = ?auto_126236 ?auto_126237 ) ) ( not ( = ?auto_126236 ?auto_126239 ) ) ( not ( = ?auto_126236 ?auto_126235 ) ) ( not ( = ?auto_126236 ?auto_126234 ) ) ( not ( = ?auto_126236 ?auto_126233 ) ) ( not ( = ?auto_126238 ?auto_126237 ) ) ( not ( = ?auto_126238 ?auto_126239 ) ) ( not ( = ?auto_126238 ?auto_126235 ) ) ( not ( = ?auto_126238 ?auto_126234 ) ) ( not ( = ?auto_126238 ?auto_126233 ) ) ( not ( = ?auto_126237 ?auto_126239 ) ) ( not ( = ?auto_126237 ?auto_126235 ) ) ( not ( = ?auto_126237 ?auto_126234 ) ) ( not ( = ?auto_126237 ?auto_126233 ) ) ( not ( = ?auto_126239 ?auto_126235 ) ) ( not ( = ?auto_126239 ?auto_126234 ) ) ( not ( = ?auto_126239 ?auto_126233 ) ) ( not ( = ?auto_126232 ?auto_126236 ) ) ( not ( = ?auto_126232 ?auto_126238 ) ) ( not ( = ?auto_126232 ?auto_126237 ) ) ( not ( = ?auto_126232 ?auto_126239 ) ) ( ON ?auto_126232 ?auto_126240 ) ( CLEAR ?auto_126232 ) ( HAND-EMPTY ) ( not ( = ?auto_126232 ?auto_126240 ) ) ( not ( = ?auto_126233 ?auto_126240 ) ) ( not ( = ?auto_126234 ?auto_126240 ) ) ( not ( = ?auto_126235 ?auto_126240 ) ) ( not ( = ?auto_126236 ?auto_126240 ) ) ( not ( = ?auto_126238 ?auto_126240 ) ) ( not ( = ?auto_126237 ?auto_126240 ) ) ( not ( = ?auto_126239 ?auto_126240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126232 ?auto_126240 )
      ( MAKE-3PILE ?auto_126232 ?auto_126233 ?auto_126234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126241 - BLOCK
      ?auto_126242 - BLOCK
      ?auto_126243 - BLOCK
    )
    :vars
    (
      ?auto_126247 - BLOCK
      ?auto_126249 - BLOCK
      ?auto_126248 - BLOCK
      ?auto_126246 - BLOCK
      ?auto_126245 - BLOCK
      ?auto_126244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126241 ?auto_126242 ) ) ( not ( = ?auto_126241 ?auto_126243 ) ) ( not ( = ?auto_126242 ?auto_126243 ) ) ( ON ?auto_126243 ?auto_126247 ) ( not ( = ?auto_126241 ?auto_126247 ) ) ( not ( = ?auto_126242 ?auto_126247 ) ) ( not ( = ?auto_126243 ?auto_126247 ) ) ( ON-TABLE ?auto_126249 ) ( ON ?auto_126248 ?auto_126249 ) ( ON ?auto_126246 ?auto_126248 ) ( ON ?auto_126245 ?auto_126246 ) ( ON ?auto_126247 ?auto_126245 ) ( not ( = ?auto_126249 ?auto_126248 ) ) ( not ( = ?auto_126249 ?auto_126246 ) ) ( not ( = ?auto_126249 ?auto_126245 ) ) ( not ( = ?auto_126249 ?auto_126247 ) ) ( not ( = ?auto_126249 ?auto_126243 ) ) ( not ( = ?auto_126249 ?auto_126242 ) ) ( not ( = ?auto_126248 ?auto_126246 ) ) ( not ( = ?auto_126248 ?auto_126245 ) ) ( not ( = ?auto_126248 ?auto_126247 ) ) ( not ( = ?auto_126248 ?auto_126243 ) ) ( not ( = ?auto_126248 ?auto_126242 ) ) ( not ( = ?auto_126246 ?auto_126245 ) ) ( not ( = ?auto_126246 ?auto_126247 ) ) ( not ( = ?auto_126246 ?auto_126243 ) ) ( not ( = ?auto_126246 ?auto_126242 ) ) ( not ( = ?auto_126245 ?auto_126247 ) ) ( not ( = ?auto_126245 ?auto_126243 ) ) ( not ( = ?auto_126245 ?auto_126242 ) ) ( not ( = ?auto_126241 ?auto_126249 ) ) ( not ( = ?auto_126241 ?auto_126248 ) ) ( not ( = ?auto_126241 ?auto_126246 ) ) ( not ( = ?auto_126241 ?auto_126245 ) ) ( ON ?auto_126241 ?auto_126244 ) ( CLEAR ?auto_126241 ) ( not ( = ?auto_126241 ?auto_126244 ) ) ( not ( = ?auto_126242 ?auto_126244 ) ) ( not ( = ?auto_126243 ?auto_126244 ) ) ( not ( = ?auto_126247 ?auto_126244 ) ) ( not ( = ?auto_126249 ?auto_126244 ) ) ( not ( = ?auto_126248 ?auto_126244 ) ) ( not ( = ?auto_126246 ?auto_126244 ) ) ( not ( = ?auto_126245 ?auto_126244 ) ) ( HOLDING ?auto_126242 ) ( CLEAR ?auto_126243 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126249 ?auto_126248 ?auto_126246 ?auto_126245 ?auto_126247 ?auto_126243 ?auto_126242 )
      ( MAKE-3PILE ?auto_126241 ?auto_126242 ?auto_126243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126250 - BLOCK
      ?auto_126251 - BLOCK
      ?auto_126252 - BLOCK
    )
    :vars
    (
      ?auto_126254 - BLOCK
      ?auto_126258 - BLOCK
      ?auto_126255 - BLOCK
      ?auto_126257 - BLOCK
      ?auto_126256 - BLOCK
      ?auto_126253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126250 ?auto_126251 ) ) ( not ( = ?auto_126250 ?auto_126252 ) ) ( not ( = ?auto_126251 ?auto_126252 ) ) ( ON ?auto_126252 ?auto_126254 ) ( not ( = ?auto_126250 ?auto_126254 ) ) ( not ( = ?auto_126251 ?auto_126254 ) ) ( not ( = ?auto_126252 ?auto_126254 ) ) ( ON-TABLE ?auto_126258 ) ( ON ?auto_126255 ?auto_126258 ) ( ON ?auto_126257 ?auto_126255 ) ( ON ?auto_126256 ?auto_126257 ) ( ON ?auto_126254 ?auto_126256 ) ( not ( = ?auto_126258 ?auto_126255 ) ) ( not ( = ?auto_126258 ?auto_126257 ) ) ( not ( = ?auto_126258 ?auto_126256 ) ) ( not ( = ?auto_126258 ?auto_126254 ) ) ( not ( = ?auto_126258 ?auto_126252 ) ) ( not ( = ?auto_126258 ?auto_126251 ) ) ( not ( = ?auto_126255 ?auto_126257 ) ) ( not ( = ?auto_126255 ?auto_126256 ) ) ( not ( = ?auto_126255 ?auto_126254 ) ) ( not ( = ?auto_126255 ?auto_126252 ) ) ( not ( = ?auto_126255 ?auto_126251 ) ) ( not ( = ?auto_126257 ?auto_126256 ) ) ( not ( = ?auto_126257 ?auto_126254 ) ) ( not ( = ?auto_126257 ?auto_126252 ) ) ( not ( = ?auto_126257 ?auto_126251 ) ) ( not ( = ?auto_126256 ?auto_126254 ) ) ( not ( = ?auto_126256 ?auto_126252 ) ) ( not ( = ?auto_126256 ?auto_126251 ) ) ( not ( = ?auto_126250 ?auto_126258 ) ) ( not ( = ?auto_126250 ?auto_126255 ) ) ( not ( = ?auto_126250 ?auto_126257 ) ) ( not ( = ?auto_126250 ?auto_126256 ) ) ( ON ?auto_126250 ?auto_126253 ) ( not ( = ?auto_126250 ?auto_126253 ) ) ( not ( = ?auto_126251 ?auto_126253 ) ) ( not ( = ?auto_126252 ?auto_126253 ) ) ( not ( = ?auto_126254 ?auto_126253 ) ) ( not ( = ?auto_126258 ?auto_126253 ) ) ( not ( = ?auto_126255 ?auto_126253 ) ) ( not ( = ?auto_126257 ?auto_126253 ) ) ( not ( = ?auto_126256 ?auto_126253 ) ) ( CLEAR ?auto_126252 ) ( ON ?auto_126251 ?auto_126250 ) ( CLEAR ?auto_126251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126253 ?auto_126250 )
      ( MAKE-3PILE ?auto_126250 ?auto_126251 ?auto_126252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126259 - BLOCK
      ?auto_126260 - BLOCK
      ?auto_126261 - BLOCK
    )
    :vars
    (
      ?auto_126263 - BLOCK
      ?auto_126264 - BLOCK
      ?auto_126262 - BLOCK
      ?auto_126267 - BLOCK
      ?auto_126266 - BLOCK
      ?auto_126265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126259 ?auto_126260 ) ) ( not ( = ?auto_126259 ?auto_126261 ) ) ( not ( = ?auto_126260 ?auto_126261 ) ) ( not ( = ?auto_126259 ?auto_126263 ) ) ( not ( = ?auto_126260 ?auto_126263 ) ) ( not ( = ?auto_126261 ?auto_126263 ) ) ( ON-TABLE ?auto_126264 ) ( ON ?auto_126262 ?auto_126264 ) ( ON ?auto_126267 ?auto_126262 ) ( ON ?auto_126266 ?auto_126267 ) ( ON ?auto_126263 ?auto_126266 ) ( not ( = ?auto_126264 ?auto_126262 ) ) ( not ( = ?auto_126264 ?auto_126267 ) ) ( not ( = ?auto_126264 ?auto_126266 ) ) ( not ( = ?auto_126264 ?auto_126263 ) ) ( not ( = ?auto_126264 ?auto_126261 ) ) ( not ( = ?auto_126264 ?auto_126260 ) ) ( not ( = ?auto_126262 ?auto_126267 ) ) ( not ( = ?auto_126262 ?auto_126266 ) ) ( not ( = ?auto_126262 ?auto_126263 ) ) ( not ( = ?auto_126262 ?auto_126261 ) ) ( not ( = ?auto_126262 ?auto_126260 ) ) ( not ( = ?auto_126267 ?auto_126266 ) ) ( not ( = ?auto_126267 ?auto_126263 ) ) ( not ( = ?auto_126267 ?auto_126261 ) ) ( not ( = ?auto_126267 ?auto_126260 ) ) ( not ( = ?auto_126266 ?auto_126263 ) ) ( not ( = ?auto_126266 ?auto_126261 ) ) ( not ( = ?auto_126266 ?auto_126260 ) ) ( not ( = ?auto_126259 ?auto_126264 ) ) ( not ( = ?auto_126259 ?auto_126262 ) ) ( not ( = ?auto_126259 ?auto_126267 ) ) ( not ( = ?auto_126259 ?auto_126266 ) ) ( ON ?auto_126259 ?auto_126265 ) ( not ( = ?auto_126259 ?auto_126265 ) ) ( not ( = ?auto_126260 ?auto_126265 ) ) ( not ( = ?auto_126261 ?auto_126265 ) ) ( not ( = ?auto_126263 ?auto_126265 ) ) ( not ( = ?auto_126264 ?auto_126265 ) ) ( not ( = ?auto_126262 ?auto_126265 ) ) ( not ( = ?auto_126267 ?auto_126265 ) ) ( not ( = ?auto_126266 ?auto_126265 ) ) ( ON ?auto_126260 ?auto_126259 ) ( CLEAR ?auto_126260 ) ( ON-TABLE ?auto_126265 ) ( HOLDING ?auto_126261 ) ( CLEAR ?auto_126263 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126264 ?auto_126262 ?auto_126267 ?auto_126266 ?auto_126263 ?auto_126261 )
      ( MAKE-3PILE ?auto_126259 ?auto_126260 ?auto_126261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126268 - BLOCK
      ?auto_126269 - BLOCK
      ?auto_126270 - BLOCK
    )
    :vars
    (
      ?auto_126274 - BLOCK
      ?auto_126275 - BLOCK
      ?auto_126273 - BLOCK
      ?auto_126276 - BLOCK
      ?auto_126272 - BLOCK
      ?auto_126271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126268 ?auto_126269 ) ) ( not ( = ?auto_126268 ?auto_126270 ) ) ( not ( = ?auto_126269 ?auto_126270 ) ) ( not ( = ?auto_126268 ?auto_126274 ) ) ( not ( = ?auto_126269 ?auto_126274 ) ) ( not ( = ?auto_126270 ?auto_126274 ) ) ( ON-TABLE ?auto_126275 ) ( ON ?auto_126273 ?auto_126275 ) ( ON ?auto_126276 ?auto_126273 ) ( ON ?auto_126272 ?auto_126276 ) ( ON ?auto_126274 ?auto_126272 ) ( not ( = ?auto_126275 ?auto_126273 ) ) ( not ( = ?auto_126275 ?auto_126276 ) ) ( not ( = ?auto_126275 ?auto_126272 ) ) ( not ( = ?auto_126275 ?auto_126274 ) ) ( not ( = ?auto_126275 ?auto_126270 ) ) ( not ( = ?auto_126275 ?auto_126269 ) ) ( not ( = ?auto_126273 ?auto_126276 ) ) ( not ( = ?auto_126273 ?auto_126272 ) ) ( not ( = ?auto_126273 ?auto_126274 ) ) ( not ( = ?auto_126273 ?auto_126270 ) ) ( not ( = ?auto_126273 ?auto_126269 ) ) ( not ( = ?auto_126276 ?auto_126272 ) ) ( not ( = ?auto_126276 ?auto_126274 ) ) ( not ( = ?auto_126276 ?auto_126270 ) ) ( not ( = ?auto_126276 ?auto_126269 ) ) ( not ( = ?auto_126272 ?auto_126274 ) ) ( not ( = ?auto_126272 ?auto_126270 ) ) ( not ( = ?auto_126272 ?auto_126269 ) ) ( not ( = ?auto_126268 ?auto_126275 ) ) ( not ( = ?auto_126268 ?auto_126273 ) ) ( not ( = ?auto_126268 ?auto_126276 ) ) ( not ( = ?auto_126268 ?auto_126272 ) ) ( ON ?auto_126268 ?auto_126271 ) ( not ( = ?auto_126268 ?auto_126271 ) ) ( not ( = ?auto_126269 ?auto_126271 ) ) ( not ( = ?auto_126270 ?auto_126271 ) ) ( not ( = ?auto_126274 ?auto_126271 ) ) ( not ( = ?auto_126275 ?auto_126271 ) ) ( not ( = ?auto_126273 ?auto_126271 ) ) ( not ( = ?auto_126276 ?auto_126271 ) ) ( not ( = ?auto_126272 ?auto_126271 ) ) ( ON ?auto_126269 ?auto_126268 ) ( ON-TABLE ?auto_126271 ) ( CLEAR ?auto_126274 ) ( ON ?auto_126270 ?auto_126269 ) ( CLEAR ?auto_126270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126271 ?auto_126268 ?auto_126269 )
      ( MAKE-3PILE ?auto_126268 ?auto_126269 ?auto_126270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126277 - BLOCK
      ?auto_126278 - BLOCK
      ?auto_126279 - BLOCK
    )
    :vars
    (
      ?auto_126282 - BLOCK
      ?auto_126285 - BLOCK
      ?auto_126281 - BLOCK
      ?auto_126283 - BLOCK
      ?auto_126284 - BLOCK
      ?auto_126280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126277 ?auto_126278 ) ) ( not ( = ?auto_126277 ?auto_126279 ) ) ( not ( = ?auto_126278 ?auto_126279 ) ) ( not ( = ?auto_126277 ?auto_126282 ) ) ( not ( = ?auto_126278 ?auto_126282 ) ) ( not ( = ?auto_126279 ?auto_126282 ) ) ( ON-TABLE ?auto_126285 ) ( ON ?auto_126281 ?auto_126285 ) ( ON ?auto_126283 ?auto_126281 ) ( ON ?auto_126284 ?auto_126283 ) ( not ( = ?auto_126285 ?auto_126281 ) ) ( not ( = ?auto_126285 ?auto_126283 ) ) ( not ( = ?auto_126285 ?auto_126284 ) ) ( not ( = ?auto_126285 ?auto_126282 ) ) ( not ( = ?auto_126285 ?auto_126279 ) ) ( not ( = ?auto_126285 ?auto_126278 ) ) ( not ( = ?auto_126281 ?auto_126283 ) ) ( not ( = ?auto_126281 ?auto_126284 ) ) ( not ( = ?auto_126281 ?auto_126282 ) ) ( not ( = ?auto_126281 ?auto_126279 ) ) ( not ( = ?auto_126281 ?auto_126278 ) ) ( not ( = ?auto_126283 ?auto_126284 ) ) ( not ( = ?auto_126283 ?auto_126282 ) ) ( not ( = ?auto_126283 ?auto_126279 ) ) ( not ( = ?auto_126283 ?auto_126278 ) ) ( not ( = ?auto_126284 ?auto_126282 ) ) ( not ( = ?auto_126284 ?auto_126279 ) ) ( not ( = ?auto_126284 ?auto_126278 ) ) ( not ( = ?auto_126277 ?auto_126285 ) ) ( not ( = ?auto_126277 ?auto_126281 ) ) ( not ( = ?auto_126277 ?auto_126283 ) ) ( not ( = ?auto_126277 ?auto_126284 ) ) ( ON ?auto_126277 ?auto_126280 ) ( not ( = ?auto_126277 ?auto_126280 ) ) ( not ( = ?auto_126278 ?auto_126280 ) ) ( not ( = ?auto_126279 ?auto_126280 ) ) ( not ( = ?auto_126282 ?auto_126280 ) ) ( not ( = ?auto_126285 ?auto_126280 ) ) ( not ( = ?auto_126281 ?auto_126280 ) ) ( not ( = ?auto_126283 ?auto_126280 ) ) ( not ( = ?auto_126284 ?auto_126280 ) ) ( ON ?auto_126278 ?auto_126277 ) ( ON-TABLE ?auto_126280 ) ( ON ?auto_126279 ?auto_126278 ) ( CLEAR ?auto_126279 ) ( HOLDING ?auto_126282 ) ( CLEAR ?auto_126284 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126285 ?auto_126281 ?auto_126283 ?auto_126284 ?auto_126282 )
      ( MAKE-3PILE ?auto_126277 ?auto_126278 ?auto_126279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126286 - BLOCK
      ?auto_126287 - BLOCK
      ?auto_126288 - BLOCK
    )
    :vars
    (
      ?auto_126293 - BLOCK
      ?auto_126292 - BLOCK
      ?auto_126289 - BLOCK
      ?auto_126294 - BLOCK
      ?auto_126291 - BLOCK
      ?auto_126290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126286 ?auto_126287 ) ) ( not ( = ?auto_126286 ?auto_126288 ) ) ( not ( = ?auto_126287 ?auto_126288 ) ) ( not ( = ?auto_126286 ?auto_126293 ) ) ( not ( = ?auto_126287 ?auto_126293 ) ) ( not ( = ?auto_126288 ?auto_126293 ) ) ( ON-TABLE ?auto_126292 ) ( ON ?auto_126289 ?auto_126292 ) ( ON ?auto_126294 ?auto_126289 ) ( ON ?auto_126291 ?auto_126294 ) ( not ( = ?auto_126292 ?auto_126289 ) ) ( not ( = ?auto_126292 ?auto_126294 ) ) ( not ( = ?auto_126292 ?auto_126291 ) ) ( not ( = ?auto_126292 ?auto_126293 ) ) ( not ( = ?auto_126292 ?auto_126288 ) ) ( not ( = ?auto_126292 ?auto_126287 ) ) ( not ( = ?auto_126289 ?auto_126294 ) ) ( not ( = ?auto_126289 ?auto_126291 ) ) ( not ( = ?auto_126289 ?auto_126293 ) ) ( not ( = ?auto_126289 ?auto_126288 ) ) ( not ( = ?auto_126289 ?auto_126287 ) ) ( not ( = ?auto_126294 ?auto_126291 ) ) ( not ( = ?auto_126294 ?auto_126293 ) ) ( not ( = ?auto_126294 ?auto_126288 ) ) ( not ( = ?auto_126294 ?auto_126287 ) ) ( not ( = ?auto_126291 ?auto_126293 ) ) ( not ( = ?auto_126291 ?auto_126288 ) ) ( not ( = ?auto_126291 ?auto_126287 ) ) ( not ( = ?auto_126286 ?auto_126292 ) ) ( not ( = ?auto_126286 ?auto_126289 ) ) ( not ( = ?auto_126286 ?auto_126294 ) ) ( not ( = ?auto_126286 ?auto_126291 ) ) ( ON ?auto_126286 ?auto_126290 ) ( not ( = ?auto_126286 ?auto_126290 ) ) ( not ( = ?auto_126287 ?auto_126290 ) ) ( not ( = ?auto_126288 ?auto_126290 ) ) ( not ( = ?auto_126293 ?auto_126290 ) ) ( not ( = ?auto_126292 ?auto_126290 ) ) ( not ( = ?auto_126289 ?auto_126290 ) ) ( not ( = ?auto_126294 ?auto_126290 ) ) ( not ( = ?auto_126291 ?auto_126290 ) ) ( ON ?auto_126287 ?auto_126286 ) ( ON-TABLE ?auto_126290 ) ( ON ?auto_126288 ?auto_126287 ) ( CLEAR ?auto_126291 ) ( ON ?auto_126293 ?auto_126288 ) ( CLEAR ?auto_126293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126290 ?auto_126286 ?auto_126287 ?auto_126288 )
      ( MAKE-3PILE ?auto_126286 ?auto_126287 ?auto_126288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126295 - BLOCK
      ?auto_126296 - BLOCK
      ?auto_126297 - BLOCK
    )
    :vars
    (
      ?auto_126303 - BLOCK
      ?auto_126298 - BLOCK
      ?auto_126299 - BLOCK
      ?auto_126302 - BLOCK
      ?auto_126300 - BLOCK
      ?auto_126301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126295 ?auto_126296 ) ) ( not ( = ?auto_126295 ?auto_126297 ) ) ( not ( = ?auto_126296 ?auto_126297 ) ) ( not ( = ?auto_126295 ?auto_126303 ) ) ( not ( = ?auto_126296 ?auto_126303 ) ) ( not ( = ?auto_126297 ?auto_126303 ) ) ( ON-TABLE ?auto_126298 ) ( ON ?auto_126299 ?auto_126298 ) ( ON ?auto_126302 ?auto_126299 ) ( not ( = ?auto_126298 ?auto_126299 ) ) ( not ( = ?auto_126298 ?auto_126302 ) ) ( not ( = ?auto_126298 ?auto_126300 ) ) ( not ( = ?auto_126298 ?auto_126303 ) ) ( not ( = ?auto_126298 ?auto_126297 ) ) ( not ( = ?auto_126298 ?auto_126296 ) ) ( not ( = ?auto_126299 ?auto_126302 ) ) ( not ( = ?auto_126299 ?auto_126300 ) ) ( not ( = ?auto_126299 ?auto_126303 ) ) ( not ( = ?auto_126299 ?auto_126297 ) ) ( not ( = ?auto_126299 ?auto_126296 ) ) ( not ( = ?auto_126302 ?auto_126300 ) ) ( not ( = ?auto_126302 ?auto_126303 ) ) ( not ( = ?auto_126302 ?auto_126297 ) ) ( not ( = ?auto_126302 ?auto_126296 ) ) ( not ( = ?auto_126300 ?auto_126303 ) ) ( not ( = ?auto_126300 ?auto_126297 ) ) ( not ( = ?auto_126300 ?auto_126296 ) ) ( not ( = ?auto_126295 ?auto_126298 ) ) ( not ( = ?auto_126295 ?auto_126299 ) ) ( not ( = ?auto_126295 ?auto_126302 ) ) ( not ( = ?auto_126295 ?auto_126300 ) ) ( ON ?auto_126295 ?auto_126301 ) ( not ( = ?auto_126295 ?auto_126301 ) ) ( not ( = ?auto_126296 ?auto_126301 ) ) ( not ( = ?auto_126297 ?auto_126301 ) ) ( not ( = ?auto_126303 ?auto_126301 ) ) ( not ( = ?auto_126298 ?auto_126301 ) ) ( not ( = ?auto_126299 ?auto_126301 ) ) ( not ( = ?auto_126302 ?auto_126301 ) ) ( not ( = ?auto_126300 ?auto_126301 ) ) ( ON ?auto_126296 ?auto_126295 ) ( ON-TABLE ?auto_126301 ) ( ON ?auto_126297 ?auto_126296 ) ( ON ?auto_126303 ?auto_126297 ) ( CLEAR ?auto_126303 ) ( HOLDING ?auto_126300 ) ( CLEAR ?auto_126302 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126298 ?auto_126299 ?auto_126302 ?auto_126300 )
      ( MAKE-3PILE ?auto_126295 ?auto_126296 ?auto_126297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126304 - BLOCK
      ?auto_126305 - BLOCK
      ?auto_126306 - BLOCK
    )
    :vars
    (
      ?auto_126310 - BLOCK
      ?auto_126307 - BLOCK
      ?auto_126308 - BLOCK
      ?auto_126312 - BLOCK
      ?auto_126311 - BLOCK
      ?auto_126309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126304 ?auto_126305 ) ) ( not ( = ?auto_126304 ?auto_126306 ) ) ( not ( = ?auto_126305 ?auto_126306 ) ) ( not ( = ?auto_126304 ?auto_126310 ) ) ( not ( = ?auto_126305 ?auto_126310 ) ) ( not ( = ?auto_126306 ?auto_126310 ) ) ( ON-TABLE ?auto_126307 ) ( ON ?auto_126308 ?auto_126307 ) ( ON ?auto_126312 ?auto_126308 ) ( not ( = ?auto_126307 ?auto_126308 ) ) ( not ( = ?auto_126307 ?auto_126312 ) ) ( not ( = ?auto_126307 ?auto_126311 ) ) ( not ( = ?auto_126307 ?auto_126310 ) ) ( not ( = ?auto_126307 ?auto_126306 ) ) ( not ( = ?auto_126307 ?auto_126305 ) ) ( not ( = ?auto_126308 ?auto_126312 ) ) ( not ( = ?auto_126308 ?auto_126311 ) ) ( not ( = ?auto_126308 ?auto_126310 ) ) ( not ( = ?auto_126308 ?auto_126306 ) ) ( not ( = ?auto_126308 ?auto_126305 ) ) ( not ( = ?auto_126312 ?auto_126311 ) ) ( not ( = ?auto_126312 ?auto_126310 ) ) ( not ( = ?auto_126312 ?auto_126306 ) ) ( not ( = ?auto_126312 ?auto_126305 ) ) ( not ( = ?auto_126311 ?auto_126310 ) ) ( not ( = ?auto_126311 ?auto_126306 ) ) ( not ( = ?auto_126311 ?auto_126305 ) ) ( not ( = ?auto_126304 ?auto_126307 ) ) ( not ( = ?auto_126304 ?auto_126308 ) ) ( not ( = ?auto_126304 ?auto_126312 ) ) ( not ( = ?auto_126304 ?auto_126311 ) ) ( ON ?auto_126304 ?auto_126309 ) ( not ( = ?auto_126304 ?auto_126309 ) ) ( not ( = ?auto_126305 ?auto_126309 ) ) ( not ( = ?auto_126306 ?auto_126309 ) ) ( not ( = ?auto_126310 ?auto_126309 ) ) ( not ( = ?auto_126307 ?auto_126309 ) ) ( not ( = ?auto_126308 ?auto_126309 ) ) ( not ( = ?auto_126312 ?auto_126309 ) ) ( not ( = ?auto_126311 ?auto_126309 ) ) ( ON ?auto_126305 ?auto_126304 ) ( ON-TABLE ?auto_126309 ) ( ON ?auto_126306 ?auto_126305 ) ( ON ?auto_126310 ?auto_126306 ) ( CLEAR ?auto_126312 ) ( ON ?auto_126311 ?auto_126310 ) ( CLEAR ?auto_126311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126309 ?auto_126304 ?auto_126305 ?auto_126306 ?auto_126310 )
      ( MAKE-3PILE ?auto_126304 ?auto_126305 ?auto_126306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126313 - BLOCK
      ?auto_126314 - BLOCK
      ?auto_126315 - BLOCK
    )
    :vars
    (
      ?auto_126318 - BLOCK
      ?auto_126321 - BLOCK
      ?auto_126320 - BLOCK
      ?auto_126319 - BLOCK
      ?auto_126317 - BLOCK
      ?auto_126316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126313 ?auto_126314 ) ) ( not ( = ?auto_126313 ?auto_126315 ) ) ( not ( = ?auto_126314 ?auto_126315 ) ) ( not ( = ?auto_126313 ?auto_126318 ) ) ( not ( = ?auto_126314 ?auto_126318 ) ) ( not ( = ?auto_126315 ?auto_126318 ) ) ( ON-TABLE ?auto_126321 ) ( ON ?auto_126320 ?auto_126321 ) ( not ( = ?auto_126321 ?auto_126320 ) ) ( not ( = ?auto_126321 ?auto_126319 ) ) ( not ( = ?auto_126321 ?auto_126317 ) ) ( not ( = ?auto_126321 ?auto_126318 ) ) ( not ( = ?auto_126321 ?auto_126315 ) ) ( not ( = ?auto_126321 ?auto_126314 ) ) ( not ( = ?auto_126320 ?auto_126319 ) ) ( not ( = ?auto_126320 ?auto_126317 ) ) ( not ( = ?auto_126320 ?auto_126318 ) ) ( not ( = ?auto_126320 ?auto_126315 ) ) ( not ( = ?auto_126320 ?auto_126314 ) ) ( not ( = ?auto_126319 ?auto_126317 ) ) ( not ( = ?auto_126319 ?auto_126318 ) ) ( not ( = ?auto_126319 ?auto_126315 ) ) ( not ( = ?auto_126319 ?auto_126314 ) ) ( not ( = ?auto_126317 ?auto_126318 ) ) ( not ( = ?auto_126317 ?auto_126315 ) ) ( not ( = ?auto_126317 ?auto_126314 ) ) ( not ( = ?auto_126313 ?auto_126321 ) ) ( not ( = ?auto_126313 ?auto_126320 ) ) ( not ( = ?auto_126313 ?auto_126319 ) ) ( not ( = ?auto_126313 ?auto_126317 ) ) ( ON ?auto_126313 ?auto_126316 ) ( not ( = ?auto_126313 ?auto_126316 ) ) ( not ( = ?auto_126314 ?auto_126316 ) ) ( not ( = ?auto_126315 ?auto_126316 ) ) ( not ( = ?auto_126318 ?auto_126316 ) ) ( not ( = ?auto_126321 ?auto_126316 ) ) ( not ( = ?auto_126320 ?auto_126316 ) ) ( not ( = ?auto_126319 ?auto_126316 ) ) ( not ( = ?auto_126317 ?auto_126316 ) ) ( ON ?auto_126314 ?auto_126313 ) ( ON-TABLE ?auto_126316 ) ( ON ?auto_126315 ?auto_126314 ) ( ON ?auto_126318 ?auto_126315 ) ( ON ?auto_126317 ?auto_126318 ) ( CLEAR ?auto_126317 ) ( HOLDING ?auto_126319 ) ( CLEAR ?auto_126320 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126321 ?auto_126320 ?auto_126319 )
      ( MAKE-3PILE ?auto_126313 ?auto_126314 ?auto_126315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126322 - BLOCK
      ?auto_126323 - BLOCK
      ?auto_126324 - BLOCK
    )
    :vars
    (
      ?auto_126327 - BLOCK
      ?auto_126325 - BLOCK
      ?auto_126326 - BLOCK
      ?auto_126330 - BLOCK
      ?auto_126328 - BLOCK
      ?auto_126329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126322 ?auto_126323 ) ) ( not ( = ?auto_126322 ?auto_126324 ) ) ( not ( = ?auto_126323 ?auto_126324 ) ) ( not ( = ?auto_126322 ?auto_126327 ) ) ( not ( = ?auto_126323 ?auto_126327 ) ) ( not ( = ?auto_126324 ?auto_126327 ) ) ( ON-TABLE ?auto_126325 ) ( ON ?auto_126326 ?auto_126325 ) ( not ( = ?auto_126325 ?auto_126326 ) ) ( not ( = ?auto_126325 ?auto_126330 ) ) ( not ( = ?auto_126325 ?auto_126328 ) ) ( not ( = ?auto_126325 ?auto_126327 ) ) ( not ( = ?auto_126325 ?auto_126324 ) ) ( not ( = ?auto_126325 ?auto_126323 ) ) ( not ( = ?auto_126326 ?auto_126330 ) ) ( not ( = ?auto_126326 ?auto_126328 ) ) ( not ( = ?auto_126326 ?auto_126327 ) ) ( not ( = ?auto_126326 ?auto_126324 ) ) ( not ( = ?auto_126326 ?auto_126323 ) ) ( not ( = ?auto_126330 ?auto_126328 ) ) ( not ( = ?auto_126330 ?auto_126327 ) ) ( not ( = ?auto_126330 ?auto_126324 ) ) ( not ( = ?auto_126330 ?auto_126323 ) ) ( not ( = ?auto_126328 ?auto_126327 ) ) ( not ( = ?auto_126328 ?auto_126324 ) ) ( not ( = ?auto_126328 ?auto_126323 ) ) ( not ( = ?auto_126322 ?auto_126325 ) ) ( not ( = ?auto_126322 ?auto_126326 ) ) ( not ( = ?auto_126322 ?auto_126330 ) ) ( not ( = ?auto_126322 ?auto_126328 ) ) ( ON ?auto_126322 ?auto_126329 ) ( not ( = ?auto_126322 ?auto_126329 ) ) ( not ( = ?auto_126323 ?auto_126329 ) ) ( not ( = ?auto_126324 ?auto_126329 ) ) ( not ( = ?auto_126327 ?auto_126329 ) ) ( not ( = ?auto_126325 ?auto_126329 ) ) ( not ( = ?auto_126326 ?auto_126329 ) ) ( not ( = ?auto_126330 ?auto_126329 ) ) ( not ( = ?auto_126328 ?auto_126329 ) ) ( ON ?auto_126323 ?auto_126322 ) ( ON-TABLE ?auto_126329 ) ( ON ?auto_126324 ?auto_126323 ) ( ON ?auto_126327 ?auto_126324 ) ( ON ?auto_126328 ?auto_126327 ) ( CLEAR ?auto_126326 ) ( ON ?auto_126330 ?auto_126328 ) ( CLEAR ?auto_126330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126329 ?auto_126322 ?auto_126323 ?auto_126324 ?auto_126327 ?auto_126328 )
      ( MAKE-3PILE ?auto_126322 ?auto_126323 ?auto_126324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126331 - BLOCK
      ?auto_126332 - BLOCK
      ?auto_126333 - BLOCK
    )
    :vars
    (
      ?auto_126334 - BLOCK
      ?auto_126339 - BLOCK
      ?auto_126338 - BLOCK
      ?auto_126335 - BLOCK
      ?auto_126337 - BLOCK
      ?auto_126336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126331 ?auto_126332 ) ) ( not ( = ?auto_126331 ?auto_126333 ) ) ( not ( = ?auto_126332 ?auto_126333 ) ) ( not ( = ?auto_126331 ?auto_126334 ) ) ( not ( = ?auto_126332 ?auto_126334 ) ) ( not ( = ?auto_126333 ?auto_126334 ) ) ( ON-TABLE ?auto_126339 ) ( not ( = ?auto_126339 ?auto_126338 ) ) ( not ( = ?auto_126339 ?auto_126335 ) ) ( not ( = ?auto_126339 ?auto_126337 ) ) ( not ( = ?auto_126339 ?auto_126334 ) ) ( not ( = ?auto_126339 ?auto_126333 ) ) ( not ( = ?auto_126339 ?auto_126332 ) ) ( not ( = ?auto_126338 ?auto_126335 ) ) ( not ( = ?auto_126338 ?auto_126337 ) ) ( not ( = ?auto_126338 ?auto_126334 ) ) ( not ( = ?auto_126338 ?auto_126333 ) ) ( not ( = ?auto_126338 ?auto_126332 ) ) ( not ( = ?auto_126335 ?auto_126337 ) ) ( not ( = ?auto_126335 ?auto_126334 ) ) ( not ( = ?auto_126335 ?auto_126333 ) ) ( not ( = ?auto_126335 ?auto_126332 ) ) ( not ( = ?auto_126337 ?auto_126334 ) ) ( not ( = ?auto_126337 ?auto_126333 ) ) ( not ( = ?auto_126337 ?auto_126332 ) ) ( not ( = ?auto_126331 ?auto_126339 ) ) ( not ( = ?auto_126331 ?auto_126338 ) ) ( not ( = ?auto_126331 ?auto_126335 ) ) ( not ( = ?auto_126331 ?auto_126337 ) ) ( ON ?auto_126331 ?auto_126336 ) ( not ( = ?auto_126331 ?auto_126336 ) ) ( not ( = ?auto_126332 ?auto_126336 ) ) ( not ( = ?auto_126333 ?auto_126336 ) ) ( not ( = ?auto_126334 ?auto_126336 ) ) ( not ( = ?auto_126339 ?auto_126336 ) ) ( not ( = ?auto_126338 ?auto_126336 ) ) ( not ( = ?auto_126335 ?auto_126336 ) ) ( not ( = ?auto_126337 ?auto_126336 ) ) ( ON ?auto_126332 ?auto_126331 ) ( ON-TABLE ?auto_126336 ) ( ON ?auto_126333 ?auto_126332 ) ( ON ?auto_126334 ?auto_126333 ) ( ON ?auto_126337 ?auto_126334 ) ( ON ?auto_126335 ?auto_126337 ) ( CLEAR ?auto_126335 ) ( HOLDING ?auto_126338 ) ( CLEAR ?auto_126339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126339 ?auto_126338 )
      ( MAKE-3PILE ?auto_126331 ?auto_126332 ?auto_126333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126340 - BLOCK
      ?auto_126341 - BLOCK
      ?auto_126342 - BLOCK
    )
    :vars
    (
      ?auto_126347 - BLOCK
      ?auto_126345 - BLOCK
      ?auto_126344 - BLOCK
      ?auto_126343 - BLOCK
      ?auto_126346 - BLOCK
      ?auto_126348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126340 ?auto_126341 ) ) ( not ( = ?auto_126340 ?auto_126342 ) ) ( not ( = ?auto_126341 ?auto_126342 ) ) ( not ( = ?auto_126340 ?auto_126347 ) ) ( not ( = ?auto_126341 ?auto_126347 ) ) ( not ( = ?auto_126342 ?auto_126347 ) ) ( ON-TABLE ?auto_126345 ) ( not ( = ?auto_126345 ?auto_126344 ) ) ( not ( = ?auto_126345 ?auto_126343 ) ) ( not ( = ?auto_126345 ?auto_126346 ) ) ( not ( = ?auto_126345 ?auto_126347 ) ) ( not ( = ?auto_126345 ?auto_126342 ) ) ( not ( = ?auto_126345 ?auto_126341 ) ) ( not ( = ?auto_126344 ?auto_126343 ) ) ( not ( = ?auto_126344 ?auto_126346 ) ) ( not ( = ?auto_126344 ?auto_126347 ) ) ( not ( = ?auto_126344 ?auto_126342 ) ) ( not ( = ?auto_126344 ?auto_126341 ) ) ( not ( = ?auto_126343 ?auto_126346 ) ) ( not ( = ?auto_126343 ?auto_126347 ) ) ( not ( = ?auto_126343 ?auto_126342 ) ) ( not ( = ?auto_126343 ?auto_126341 ) ) ( not ( = ?auto_126346 ?auto_126347 ) ) ( not ( = ?auto_126346 ?auto_126342 ) ) ( not ( = ?auto_126346 ?auto_126341 ) ) ( not ( = ?auto_126340 ?auto_126345 ) ) ( not ( = ?auto_126340 ?auto_126344 ) ) ( not ( = ?auto_126340 ?auto_126343 ) ) ( not ( = ?auto_126340 ?auto_126346 ) ) ( ON ?auto_126340 ?auto_126348 ) ( not ( = ?auto_126340 ?auto_126348 ) ) ( not ( = ?auto_126341 ?auto_126348 ) ) ( not ( = ?auto_126342 ?auto_126348 ) ) ( not ( = ?auto_126347 ?auto_126348 ) ) ( not ( = ?auto_126345 ?auto_126348 ) ) ( not ( = ?auto_126344 ?auto_126348 ) ) ( not ( = ?auto_126343 ?auto_126348 ) ) ( not ( = ?auto_126346 ?auto_126348 ) ) ( ON ?auto_126341 ?auto_126340 ) ( ON-TABLE ?auto_126348 ) ( ON ?auto_126342 ?auto_126341 ) ( ON ?auto_126347 ?auto_126342 ) ( ON ?auto_126346 ?auto_126347 ) ( ON ?auto_126343 ?auto_126346 ) ( CLEAR ?auto_126345 ) ( ON ?auto_126344 ?auto_126343 ) ( CLEAR ?auto_126344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126348 ?auto_126340 ?auto_126341 ?auto_126342 ?auto_126347 ?auto_126346 ?auto_126343 )
      ( MAKE-3PILE ?auto_126340 ?auto_126341 ?auto_126342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126349 - BLOCK
      ?auto_126350 - BLOCK
      ?auto_126351 - BLOCK
    )
    :vars
    (
      ?auto_126352 - BLOCK
      ?auto_126357 - BLOCK
      ?auto_126356 - BLOCK
      ?auto_126353 - BLOCK
      ?auto_126354 - BLOCK
      ?auto_126355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126349 ?auto_126350 ) ) ( not ( = ?auto_126349 ?auto_126351 ) ) ( not ( = ?auto_126350 ?auto_126351 ) ) ( not ( = ?auto_126349 ?auto_126352 ) ) ( not ( = ?auto_126350 ?auto_126352 ) ) ( not ( = ?auto_126351 ?auto_126352 ) ) ( not ( = ?auto_126357 ?auto_126356 ) ) ( not ( = ?auto_126357 ?auto_126353 ) ) ( not ( = ?auto_126357 ?auto_126354 ) ) ( not ( = ?auto_126357 ?auto_126352 ) ) ( not ( = ?auto_126357 ?auto_126351 ) ) ( not ( = ?auto_126357 ?auto_126350 ) ) ( not ( = ?auto_126356 ?auto_126353 ) ) ( not ( = ?auto_126356 ?auto_126354 ) ) ( not ( = ?auto_126356 ?auto_126352 ) ) ( not ( = ?auto_126356 ?auto_126351 ) ) ( not ( = ?auto_126356 ?auto_126350 ) ) ( not ( = ?auto_126353 ?auto_126354 ) ) ( not ( = ?auto_126353 ?auto_126352 ) ) ( not ( = ?auto_126353 ?auto_126351 ) ) ( not ( = ?auto_126353 ?auto_126350 ) ) ( not ( = ?auto_126354 ?auto_126352 ) ) ( not ( = ?auto_126354 ?auto_126351 ) ) ( not ( = ?auto_126354 ?auto_126350 ) ) ( not ( = ?auto_126349 ?auto_126357 ) ) ( not ( = ?auto_126349 ?auto_126356 ) ) ( not ( = ?auto_126349 ?auto_126353 ) ) ( not ( = ?auto_126349 ?auto_126354 ) ) ( ON ?auto_126349 ?auto_126355 ) ( not ( = ?auto_126349 ?auto_126355 ) ) ( not ( = ?auto_126350 ?auto_126355 ) ) ( not ( = ?auto_126351 ?auto_126355 ) ) ( not ( = ?auto_126352 ?auto_126355 ) ) ( not ( = ?auto_126357 ?auto_126355 ) ) ( not ( = ?auto_126356 ?auto_126355 ) ) ( not ( = ?auto_126353 ?auto_126355 ) ) ( not ( = ?auto_126354 ?auto_126355 ) ) ( ON ?auto_126350 ?auto_126349 ) ( ON-TABLE ?auto_126355 ) ( ON ?auto_126351 ?auto_126350 ) ( ON ?auto_126352 ?auto_126351 ) ( ON ?auto_126354 ?auto_126352 ) ( ON ?auto_126353 ?auto_126354 ) ( ON ?auto_126356 ?auto_126353 ) ( CLEAR ?auto_126356 ) ( HOLDING ?auto_126357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126357 )
      ( MAKE-3PILE ?auto_126349 ?auto_126350 ?auto_126351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126358 - BLOCK
      ?auto_126359 - BLOCK
      ?auto_126360 - BLOCK
    )
    :vars
    (
      ?auto_126366 - BLOCK
      ?auto_126364 - BLOCK
      ?auto_126365 - BLOCK
      ?auto_126362 - BLOCK
      ?auto_126363 - BLOCK
      ?auto_126361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126358 ?auto_126359 ) ) ( not ( = ?auto_126358 ?auto_126360 ) ) ( not ( = ?auto_126359 ?auto_126360 ) ) ( not ( = ?auto_126358 ?auto_126366 ) ) ( not ( = ?auto_126359 ?auto_126366 ) ) ( not ( = ?auto_126360 ?auto_126366 ) ) ( not ( = ?auto_126364 ?auto_126365 ) ) ( not ( = ?auto_126364 ?auto_126362 ) ) ( not ( = ?auto_126364 ?auto_126363 ) ) ( not ( = ?auto_126364 ?auto_126366 ) ) ( not ( = ?auto_126364 ?auto_126360 ) ) ( not ( = ?auto_126364 ?auto_126359 ) ) ( not ( = ?auto_126365 ?auto_126362 ) ) ( not ( = ?auto_126365 ?auto_126363 ) ) ( not ( = ?auto_126365 ?auto_126366 ) ) ( not ( = ?auto_126365 ?auto_126360 ) ) ( not ( = ?auto_126365 ?auto_126359 ) ) ( not ( = ?auto_126362 ?auto_126363 ) ) ( not ( = ?auto_126362 ?auto_126366 ) ) ( not ( = ?auto_126362 ?auto_126360 ) ) ( not ( = ?auto_126362 ?auto_126359 ) ) ( not ( = ?auto_126363 ?auto_126366 ) ) ( not ( = ?auto_126363 ?auto_126360 ) ) ( not ( = ?auto_126363 ?auto_126359 ) ) ( not ( = ?auto_126358 ?auto_126364 ) ) ( not ( = ?auto_126358 ?auto_126365 ) ) ( not ( = ?auto_126358 ?auto_126362 ) ) ( not ( = ?auto_126358 ?auto_126363 ) ) ( ON ?auto_126358 ?auto_126361 ) ( not ( = ?auto_126358 ?auto_126361 ) ) ( not ( = ?auto_126359 ?auto_126361 ) ) ( not ( = ?auto_126360 ?auto_126361 ) ) ( not ( = ?auto_126366 ?auto_126361 ) ) ( not ( = ?auto_126364 ?auto_126361 ) ) ( not ( = ?auto_126365 ?auto_126361 ) ) ( not ( = ?auto_126362 ?auto_126361 ) ) ( not ( = ?auto_126363 ?auto_126361 ) ) ( ON ?auto_126359 ?auto_126358 ) ( ON-TABLE ?auto_126361 ) ( ON ?auto_126360 ?auto_126359 ) ( ON ?auto_126366 ?auto_126360 ) ( ON ?auto_126363 ?auto_126366 ) ( ON ?auto_126362 ?auto_126363 ) ( ON ?auto_126365 ?auto_126362 ) ( ON ?auto_126364 ?auto_126365 ) ( CLEAR ?auto_126364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_126361 ?auto_126358 ?auto_126359 ?auto_126360 ?auto_126366 ?auto_126363 ?auto_126362 ?auto_126365 )
      ( MAKE-3PILE ?auto_126358 ?auto_126359 ?auto_126360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126390 - BLOCK
      ?auto_126391 - BLOCK
      ?auto_126392 - BLOCK
      ?auto_126393 - BLOCK
    )
    :vars
    (
      ?auto_126396 - BLOCK
      ?auto_126394 - BLOCK
      ?auto_126395 - BLOCK
      ?auto_126397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126396 ?auto_126393 ) ( ON-TABLE ?auto_126390 ) ( ON ?auto_126391 ?auto_126390 ) ( ON ?auto_126392 ?auto_126391 ) ( ON ?auto_126393 ?auto_126392 ) ( not ( = ?auto_126390 ?auto_126391 ) ) ( not ( = ?auto_126390 ?auto_126392 ) ) ( not ( = ?auto_126390 ?auto_126393 ) ) ( not ( = ?auto_126390 ?auto_126396 ) ) ( not ( = ?auto_126391 ?auto_126392 ) ) ( not ( = ?auto_126391 ?auto_126393 ) ) ( not ( = ?auto_126391 ?auto_126396 ) ) ( not ( = ?auto_126392 ?auto_126393 ) ) ( not ( = ?auto_126392 ?auto_126396 ) ) ( not ( = ?auto_126393 ?auto_126396 ) ) ( not ( = ?auto_126390 ?auto_126394 ) ) ( not ( = ?auto_126390 ?auto_126395 ) ) ( not ( = ?auto_126391 ?auto_126394 ) ) ( not ( = ?auto_126391 ?auto_126395 ) ) ( not ( = ?auto_126392 ?auto_126394 ) ) ( not ( = ?auto_126392 ?auto_126395 ) ) ( not ( = ?auto_126393 ?auto_126394 ) ) ( not ( = ?auto_126393 ?auto_126395 ) ) ( not ( = ?auto_126396 ?auto_126394 ) ) ( not ( = ?auto_126396 ?auto_126395 ) ) ( not ( = ?auto_126394 ?auto_126395 ) ) ( ON ?auto_126394 ?auto_126396 ) ( CLEAR ?auto_126394 ) ( HOLDING ?auto_126395 ) ( CLEAR ?auto_126397 ) ( ON-TABLE ?auto_126397 ) ( not ( = ?auto_126397 ?auto_126395 ) ) ( not ( = ?auto_126390 ?auto_126397 ) ) ( not ( = ?auto_126391 ?auto_126397 ) ) ( not ( = ?auto_126392 ?auto_126397 ) ) ( not ( = ?auto_126393 ?auto_126397 ) ) ( not ( = ?auto_126396 ?auto_126397 ) ) ( not ( = ?auto_126394 ?auto_126397 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126397 ?auto_126395 )
      ( MAKE-4PILE ?auto_126390 ?auto_126391 ?auto_126392 ?auto_126393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126398 - BLOCK
      ?auto_126399 - BLOCK
      ?auto_126400 - BLOCK
      ?auto_126401 - BLOCK
    )
    :vars
    (
      ?auto_126404 - BLOCK
      ?auto_126405 - BLOCK
      ?auto_126403 - BLOCK
      ?auto_126402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126404 ?auto_126401 ) ( ON-TABLE ?auto_126398 ) ( ON ?auto_126399 ?auto_126398 ) ( ON ?auto_126400 ?auto_126399 ) ( ON ?auto_126401 ?auto_126400 ) ( not ( = ?auto_126398 ?auto_126399 ) ) ( not ( = ?auto_126398 ?auto_126400 ) ) ( not ( = ?auto_126398 ?auto_126401 ) ) ( not ( = ?auto_126398 ?auto_126404 ) ) ( not ( = ?auto_126399 ?auto_126400 ) ) ( not ( = ?auto_126399 ?auto_126401 ) ) ( not ( = ?auto_126399 ?auto_126404 ) ) ( not ( = ?auto_126400 ?auto_126401 ) ) ( not ( = ?auto_126400 ?auto_126404 ) ) ( not ( = ?auto_126401 ?auto_126404 ) ) ( not ( = ?auto_126398 ?auto_126405 ) ) ( not ( = ?auto_126398 ?auto_126403 ) ) ( not ( = ?auto_126399 ?auto_126405 ) ) ( not ( = ?auto_126399 ?auto_126403 ) ) ( not ( = ?auto_126400 ?auto_126405 ) ) ( not ( = ?auto_126400 ?auto_126403 ) ) ( not ( = ?auto_126401 ?auto_126405 ) ) ( not ( = ?auto_126401 ?auto_126403 ) ) ( not ( = ?auto_126404 ?auto_126405 ) ) ( not ( = ?auto_126404 ?auto_126403 ) ) ( not ( = ?auto_126405 ?auto_126403 ) ) ( ON ?auto_126405 ?auto_126404 ) ( CLEAR ?auto_126402 ) ( ON-TABLE ?auto_126402 ) ( not ( = ?auto_126402 ?auto_126403 ) ) ( not ( = ?auto_126398 ?auto_126402 ) ) ( not ( = ?auto_126399 ?auto_126402 ) ) ( not ( = ?auto_126400 ?auto_126402 ) ) ( not ( = ?auto_126401 ?auto_126402 ) ) ( not ( = ?auto_126404 ?auto_126402 ) ) ( not ( = ?auto_126405 ?auto_126402 ) ) ( ON ?auto_126403 ?auto_126405 ) ( CLEAR ?auto_126403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126398 ?auto_126399 ?auto_126400 ?auto_126401 ?auto_126404 ?auto_126405 )
      ( MAKE-4PILE ?auto_126398 ?auto_126399 ?auto_126400 ?auto_126401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126406 - BLOCK
      ?auto_126407 - BLOCK
      ?auto_126408 - BLOCK
      ?auto_126409 - BLOCK
    )
    :vars
    (
      ?auto_126413 - BLOCK
      ?auto_126412 - BLOCK
      ?auto_126410 - BLOCK
      ?auto_126411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126413 ?auto_126409 ) ( ON-TABLE ?auto_126406 ) ( ON ?auto_126407 ?auto_126406 ) ( ON ?auto_126408 ?auto_126407 ) ( ON ?auto_126409 ?auto_126408 ) ( not ( = ?auto_126406 ?auto_126407 ) ) ( not ( = ?auto_126406 ?auto_126408 ) ) ( not ( = ?auto_126406 ?auto_126409 ) ) ( not ( = ?auto_126406 ?auto_126413 ) ) ( not ( = ?auto_126407 ?auto_126408 ) ) ( not ( = ?auto_126407 ?auto_126409 ) ) ( not ( = ?auto_126407 ?auto_126413 ) ) ( not ( = ?auto_126408 ?auto_126409 ) ) ( not ( = ?auto_126408 ?auto_126413 ) ) ( not ( = ?auto_126409 ?auto_126413 ) ) ( not ( = ?auto_126406 ?auto_126412 ) ) ( not ( = ?auto_126406 ?auto_126410 ) ) ( not ( = ?auto_126407 ?auto_126412 ) ) ( not ( = ?auto_126407 ?auto_126410 ) ) ( not ( = ?auto_126408 ?auto_126412 ) ) ( not ( = ?auto_126408 ?auto_126410 ) ) ( not ( = ?auto_126409 ?auto_126412 ) ) ( not ( = ?auto_126409 ?auto_126410 ) ) ( not ( = ?auto_126413 ?auto_126412 ) ) ( not ( = ?auto_126413 ?auto_126410 ) ) ( not ( = ?auto_126412 ?auto_126410 ) ) ( ON ?auto_126412 ?auto_126413 ) ( not ( = ?auto_126411 ?auto_126410 ) ) ( not ( = ?auto_126406 ?auto_126411 ) ) ( not ( = ?auto_126407 ?auto_126411 ) ) ( not ( = ?auto_126408 ?auto_126411 ) ) ( not ( = ?auto_126409 ?auto_126411 ) ) ( not ( = ?auto_126413 ?auto_126411 ) ) ( not ( = ?auto_126412 ?auto_126411 ) ) ( ON ?auto_126410 ?auto_126412 ) ( CLEAR ?auto_126410 ) ( HOLDING ?auto_126411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126411 )
      ( MAKE-4PILE ?auto_126406 ?auto_126407 ?auto_126408 ?auto_126409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126426 - BLOCK
      ?auto_126427 - BLOCK
      ?auto_126428 - BLOCK
      ?auto_126429 - BLOCK
    )
    :vars
    (
      ?auto_126431 - BLOCK
      ?auto_126430 - BLOCK
      ?auto_126432 - BLOCK
      ?auto_126433 - BLOCK
      ?auto_126434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126431 ?auto_126429 ) ( ON-TABLE ?auto_126426 ) ( ON ?auto_126427 ?auto_126426 ) ( ON ?auto_126428 ?auto_126427 ) ( ON ?auto_126429 ?auto_126428 ) ( not ( = ?auto_126426 ?auto_126427 ) ) ( not ( = ?auto_126426 ?auto_126428 ) ) ( not ( = ?auto_126426 ?auto_126429 ) ) ( not ( = ?auto_126426 ?auto_126431 ) ) ( not ( = ?auto_126427 ?auto_126428 ) ) ( not ( = ?auto_126427 ?auto_126429 ) ) ( not ( = ?auto_126427 ?auto_126431 ) ) ( not ( = ?auto_126428 ?auto_126429 ) ) ( not ( = ?auto_126428 ?auto_126431 ) ) ( not ( = ?auto_126429 ?auto_126431 ) ) ( not ( = ?auto_126426 ?auto_126430 ) ) ( not ( = ?auto_126426 ?auto_126432 ) ) ( not ( = ?auto_126427 ?auto_126430 ) ) ( not ( = ?auto_126427 ?auto_126432 ) ) ( not ( = ?auto_126428 ?auto_126430 ) ) ( not ( = ?auto_126428 ?auto_126432 ) ) ( not ( = ?auto_126429 ?auto_126430 ) ) ( not ( = ?auto_126429 ?auto_126432 ) ) ( not ( = ?auto_126431 ?auto_126430 ) ) ( not ( = ?auto_126431 ?auto_126432 ) ) ( not ( = ?auto_126430 ?auto_126432 ) ) ( ON ?auto_126430 ?auto_126431 ) ( not ( = ?auto_126433 ?auto_126432 ) ) ( not ( = ?auto_126426 ?auto_126433 ) ) ( not ( = ?auto_126427 ?auto_126433 ) ) ( not ( = ?auto_126428 ?auto_126433 ) ) ( not ( = ?auto_126429 ?auto_126433 ) ) ( not ( = ?auto_126431 ?auto_126433 ) ) ( not ( = ?auto_126430 ?auto_126433 ) ) ( ON ?auto_126432 ?auto_126430 ) ( CLEAR ?auto_126432 ) ( ON ?auto_126433 ?auto_126434 ) ( CLEAR ?auto_126433 ) ( HAND-EMPTY ) ( not ( = ?auto_126426 ?auto_126434 ) ) ( not ( = ?auto_126427 ?auto_126434 ) ) ( not ( = ?auto_126428 ?auto_126434 ) ) ( not ( = ?auto_126429 ?auto_126434 ) ) ( not ( = ?auto_126431 ?auto_126434 ) ) ( not ( = ?auto_126430 ?auto_126434 ) ) ( not ( = ?auto_126432 ?auto_126434 ) ) ( not ( = ?auto_126433 ?auto_126434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126433 ?auto_126434 )
      ( MAKE-4PILE ?auto_126426 ?auto_126427 ?auto_126428 ?auto_126429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126435 - BLOCK
      ?auto_126436 - BLOCK
      ?auto_126437 - BLOCK
      ?auto_126438 - BLOCK
    )
    :vars
    (
      ?auto_126440 - BLOCK
      ?auto_126439 - BLOCK
      ?auto_126442 - BLOCK
      ?auto_126441 - BLOCK
      ?auto_126443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126440 ?auto_126438 ) ( ON-TABLE ?auto_126435 ) ( ON ?auto_126436 ?auto_126435 ) ( ON ?auto_126437 ?auto_126436 ) ( ON ?auto_126438 ?auto_126437 ) ( not ( = ?auto_126435 ?auto_126436 ) ) ( not ( = ?auto_126435 ?auto_126437 ) ) ( not ( = ?auto_126435 ?auto_126438 ) ) ( not ( = ?auto_126435 ?auto_126440 ) ) ( not ( = ?auto_126436 ?auto_126437 ) ) ( not ( = ?auto_126436 ?auto_126438 ) ) ( not ( = ?auto_126436 ?auto_126440 ) ) ( not ( = ?auto_126437 ?auto_126438 ) ) ( not ( = ?auto_126437 ?auto_126440 ) ) ( not ( = ?auto_126438 ?auto_126440 ) ) ( not ( = ?auto_126435 ?auto_126439 ) ) ( not ( = ?auto_126435 ?auto_126442 ) ) ( not ( = ?auto_126436 ?auto_126439 ) ) ( not ( = ?auto_126436 ?auto_126442 ) ) ( not ( = ?auto_126437 ?auto_126439 ) ) ( not ( = ?auto_126437 ?auto_126442 ) ) ( not ( = ?auto_126438 ?auto_126439 ) ) ( not ( = ?auto_126438 ?auto_126442 ) ) ( not ( = ?auto_126440 ?auto_126439 ) ) ( not ( = ?auto_126440 ?auto_126442 ) ) ( not ( = ?auto_126439 ?auto_126442 ) ) ( ON ?auto_126439 ?auto_126440 ) ( not ( = ?auto_126441 ?auto_126442 ) ) ( not ( = ?auto_126435 ?auto_126441 ) ) ( not ( = ?auto_126436 ?auto_126441 ) ) ( not ( = ?auto_126437 ?auto_126441 ) ) ( not ( = ?auto_126438 ?auto_126441 ) ) ( not ( = ?auto_126440 ?auto_126441 ) ) ( not ( = ?auto_126439 ?auto_126441 ) ) ( ON ?auto_126441 ?auto_126443 ) ( CLEAR ?auto_126441 ) ( not ( = ?auto_126435 ?auto_126443 ) ) ( not ( = ?auto_126436 ?auto_126443 ) ) ( not ( = ?auto_126437 ?auto_126443 ) ) ( not ( = ?auto_126438 ?auto_126443 ) ) ( not ( = ?auto_126440 ?auto_126443 ) ) ( not ( = ?auto_126439 ?auto_126443 ) ) ( not ( = ?auto_126442 ?auto_126443 ) ) ( not ( = ?auto_126441 ?auto_126443 ) ) ( HOLDING ?auto_126442 ) ( CLEAR ?auto_126439 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126435 ?auto_126436 ?auto_126437 ?auto_126438 ?auto_126440 ?auto_126439 ?auto_126442 )
      ( MAKE-4PILE ?auto_126435 ?auto_126436 ?auto_126437 ?auto_126438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126517 - BLOCK
      ?auto_126518 - BLOCK
      ?auto_126519 - BLOCK
      ?auto_126520 - BLOCK
    )
    :vars
    (
      ?auto_126521 - BLOCK
      ?auto_126524 - BLOCK
      ?auto_126522 - BLOCK
      ?auto_126523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126517 ) ( ON ?auto_126518 ?auto_126517 ) ( not ( = ?auto_126517 ?auto_126518 ) ) ( not ( = ?auto_126517 ?auto_126519 ) ) ( not ( = ?auto_126517 ?auto_126520 ) ) ( not ( = ?auto_126518 ?auto_126519 ) ) ( not ( = ?auto_126518 ?auto_126520 ) ) ( not ( = ?auto_126519 ?auto_126520 ) ) ( ON ?auto_126520 ?auto_126521 ) ( not ( = ?auto_126517 ?auto_126521 ) ) ( not ( = ?auto_126518 ?auto_126521 ) ) ( not ( = ?auto_126519 ?auto_126521 ) ) ( not ( = ?auto_126520 ?auto_126521 ) ) ( CLEAR ?auto_126518 ) ( ON ?auto_126519 ?auto_126520 ) ( CLEAR ?auto_126519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126524 ) ( ON ?auto_126522 ?auto_126524 ) ( ON ?auto_126523 ?auto_126522 ) ( ON ?auto_126521 ?auto_126523 ) ( not ( = ?auto_126524 ?auto_126522 ) ) ( not ( = ?auto_126524 ?auto_126523 ) ) ( not ( = ?auto_126524 ?auto_126521 ) ) ( not ( = ?auto_126524 ?auto_126520 ) ) ( not ( = ?auto_126524 ?auto_126519 ) ) ( not ( = ?auto_126522 ?auto_126523 ) ) ( not ( = ?auto_126522 ?auto_126521 ) ) ( not ( = ?auto_126522 ?auto_126520 ) ) ( not ( = ?auto_126522 ?auto_126519 ) ) ( not ( = ?auto_126523 ?auto_126521 ) ) ( not ( = ?auto_126523 ?auto_126520 ) ) ( not ( = ?auto_126523 ?auto_126519 ) ) ( not ( = ?auto_126517 ?auto_126524 ) ) ( not ( = ?auto_126517 ?auto_126522 ) ) ( not ( = ?auto_126517 ?auto_126523 ) ) ( not ( = ?auto_126518 ?auto_126524 ) ) ( not ( = ?auto_126518 ?auto_126522 ) ) ( not ( = ?auto_126518 ?auto_126523 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126524 ?auto_126522 ?auto_126523 ?auto_126521 ?auto_126520 )
      ( MAKE-4PILE ?auto_126517 ?auto_126518 ?auto_126519 ?auto_126520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126525 - BLOCK
      ?auto_126526 - BLOCK
      ?auto_126527 - BLOCK
      ?auto_126528 - BLOCK
    )
    :vars
    (
      ?auto_126530 - BLOCK
      ?auto_126532 - BLOCK
      ?auto_126529 - BLOCK
      ?auto_126531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126525 ) ( not ( = ?auto_126525 ?auto_126526 ) ) ( not ( = ?auto_126525 ?auto_126527 ) ) ( not ( = ?auto_126525 ?auto_126528 ) ) ( not ( = ?auto_126526 ?auto_126527 ) ) ( not ( = ?auto_126526 ?auto_126528 ) ) ( not ( = ?auto_126527 ?auto_126528 ) ) ( ON ?auto_126528 ?auto_126530 ) ( not ( = ?auto_126525 ?auto_126530 ) ) ( not ( = ?auto_126526 ?auto_126530 ) ) ( not ( = ?auto_126527 ?auto_126530 ) ) ( not ( = ?auto_126528 ?auto_126530 ) ) ( ON ?auto_126527 ?auto_126528 ) ( CLEAR ?auto_126527 ) ( ON-TABLE ?auto_126532 ) ( ON ?auto_126529 ?auto_126532 ) ( ON ?auto_126531 ?auto_126529 ) ( ON ?auto_126530 ?auto_126531 ) ( not ( = ?auto_126532 ?auto_126529 ) ) ( not ( = ?auto_126532 ?auto_126531 ) ) ( not ( = ?auto_126532 ?auto_126530 ) ) ( not ( = ?auto_126532 ?auto_126528 ) ) ( not ( = ?auto_126532 ?auto_126527 ) ) ( not ( = ?auto_126529 ?auto_126531 ) ) ( not ( = ?auto_126529 ?auto_126530 ) ) ( not ( = ?auto_126529 ?auto_126528 ) ) ( not ( = ?auto_126529 ?auto_126527 ) ) ( not ( = ?auto_126531 ?auto_126530 ) ) ( not ( = ?auto_126531 ?auto_126528 ) ) ( not ( = ?auto_126531 ?auto_126527 ) ) ( not ( = ?auto_126525 ?auto_126532 ) ) ( not ( = ?auto_126525 ?auto_126529 ) ) ( not ( = ?auto_126525 ?auto_126531 ) ) ( not ( = ?auto_126526 ?auto_126532 ) ) ( not ( = ?auto_126526 ?auto_126529 ) ) ( not ( = ?auto_126526 ?auto_126531 ) ) ( HOLDING ?auto_126526 ) ( CLEAR ?auto_126525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126525 ?auto_126526 )
      ( MAKE-4PILE ?auto_126525 ?auto_126526 ?auto_126527 ?auto_126528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126533 - BLOCK
      ?auto_126534 - BLOCK
      ?auto_126535 - BLOCK
      ?auto_126536 - BLOCK
    )
    :vars
    (
      ?auto_126540 - BLOCK
      ?auto_126539 - BLOCK
      ?auto_126537 - BLOCK
      ?auto_126538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126533 ) ( not ( = ?auto_126533 ?auto_126534 ) ) ( not ( = ?auto_126533 ?auto_126535 ) ) ( not ( = ?auto_126533 ?auto_126536 ) ) ( not ( = ?auto_126534 ?auto_126535 ) ) ( not ( = ?auto_126534 ?auto_126536 ) ) ( not ( = ?auto_126535 ?auto_126536 ) ) ( ON ?auto_126536 ?auto_126540 ) ( not ( = ?auto_126533 ?auto_126540 ) ) ( not ( = ?auto_126534 ?auto_126540 ) ) ( not ( = ?auto_126535 ?auto_126540 ) ) ( not ( = ?auto_126536 ?auto_126540 ) ) ( ON ?auto_126535 ?auto_126536 ) ( ON-TABLE ?auto_126539 ) ( ON ?auto_126537 ?auto_126539 ) ( ON ?auto_126538 ?auto_126537 ) ( ON ?auto_126540 ?auto_126538 ) ( not ( = ?auto_126539 ?auto_126537 ) ) ( not ( = ?auto_126539 ?auto_126538 ) ) ( not ( = ?auto_126539 ?auto_126540 ) ) ( not ( = ?auto_126539 ?auto_126536 ) ) ( not ( = ?auto_126539 ?auto_126535 ) ) ( not ( = ?auto_126537 ?auto_126538 ) ) ( not ( = ?auto_126537 ?auto_126540 ) ) ( not ( = ?auto_126537 ?auto_126536 ) ) ( not ( = ?auto_126537 ?auto_126535 ) ) ( not ( = ?auto_126538 ?auto_126540 ) ) ( not ( = ?auto_126538 ?auto_126536 ) ) ( not ( = ?auto_126538 ?auto_126535 ) ) ( not ( = ?auto_126533 ?auto_126539 ) ) ( not ( = ?auto_126533 ?auto_126537 ) ) ( not ( = ?auto_126533 ?auto_126538 ) ) ( not ( = ?auto_126534 ?auto_126539 ) ) ( not ( = ?auto_126534 ?auto_126537 ) ) ( not ( = ?auto_126534 ?auto_126538 ) ) ( CLEAR ?auto_126533 ) ( ON ?auto_126534 ?auto_126535 ) ( CLEAR ?auto_126534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126539 ?auto_126537 ?auto_126538 ?auto_126540 ?auto_126536 ?auto_126535 )
      ( MAKE-4PILE ?auto_126533 ?auto_126534 ?auto_126535 ?auto_126536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126541 - BLOCK
      ?auto_126542 - BLOCK
      ?auto_126543 - BLOCK
      ?auto_126544 - BLOCK
    )
    :vars
    (
      ?auto_126548 - BLOCK
      ?auto_126547 - BLOCK
      ?auto_126546 - BLOCK
      ?auto_126545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126541 ?auto_126542 ) ) ( not ( = ?auto_126541 ?auto_126543 ) ) ( not ( = ?auto_126541 ?auto_126544 ) ) ( not ( = ?auto_126542 ?auto_126543 ) ) ( not ( = ?auto_126542 ?auto_126544 ) ) ( not ( = ?auto_126543 ?auto_126544 ) ) ( ON ?auto_126544 ?auto_126548 ) ( not ( = ?auto_126541 ?auto_126548 ) ) ( not ( = ?auto_126542 ?auto_126548 ) ) ( not ( = ?auto_126543 ?auto_126548 ) ) ( not ( = ?auto_126544 ?auto_126548 ) ) ( ON ?auto_126543 ?auto_126544 ) ( ON-TABLE ?auto_126547 ) ( ON ?auto_126546 ?auto_126547 ) ( ON ?auto_126545 ?auto_126546 ) ( ON ?auto_126548 ?auto_126545 ) ( not ( = ?auto_126547 ?auto_126546 ) ) ( not ( = ?auto_126547 ?auto_126545 ) ) ( not ( = ?auto_126547 ?auto_126548 ) ) ( not ( = ?auto_126547 ?auto_126544 ) ) ( not ( = ?auto_126547 ?auto_126543 ) ) ( not ( = ?auto_126546 ?auto_126545 ) ) ( not ( = ?auto_126546 ?auto_126548 ) ) ( not ( = ?auto_126546 ?auto_126544 ) ) ( not ( = ?auto_126546 ?auto_126543 ) ) ( not ( = ?auto_126545 ?auto_126548 ) ) ( not ( = ?auto_126545 ?auto_126544 ) ) ( not ( = ?auto_126545 ?auto_126543 ) ) ( not ( = ?auto_126541 ?auto_126547 ) ) ( not ( = ?auto_126541 ?auto_126546 ) ) ( not ( = ?auto_126541 ?auto_126545 ) ) ( not ( = ?auto_126542 ?auto_126547 ) ) ( not ( = ?auto_126542 ?auto_126546 ) ) ( not ( = ?auto_126542 ?auto_126545 ) ) ( ON ?auto_126542 ?auto_126543 ) ( CLEAR ?auto_126542 ) ( HOLDING ?auto_126541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126541 )
      ( MAKE-4PILE ?auto_126541 ?auto_126542 ?auto_126543 ?auto_126544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126549 - BLOCK
      ?auto_126550 - BLOCK
      ?auto_126551 - BLOCK
      ?auto_126552 - BLOCK
    )
    :vars
    (
      ?auto_126554 - BLOCK
      ?auto_126553 - BLOCK
      ?auto_126556 - BLOCK
      ?auto_126555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126549 ?auto_126550 ) ) ( not ( = ?auto_126549 ?auto_126551 ) ) ( not ( = ?auto_126549 ?auto_126552 ) ) ( not ( = ?auto_126550 ?auto_126551 ) ) ( not ( = ?auto_126550 ?auto_126552 ) ) ( not ( = ?auto_126551 ?auto_126552 ) ) ( ON ?auto_126552 ?auto_126554 ) ( not ( = ?auto_126549 ?auto_126554 ) ) ( not ( = ?auto_126550 ?auto_126554 ) ) ( not ( = ?auto_126551 ?auto_126554 ) ) ( not ( = ?auto_126552 ?auto_126554 ) ) ( ON ?auto_126551 ?auto_126552 ) ( ON-TABLE ?auto_126553 ) ( ON ?auto_126556 ?auto_126553 ) ( ON ?auto_126555 ?auto_126556 ) ( ON ?auto_126554 ?auto_126555 ) ( not ( = ?auto_126553 ?auto_126556 ) ) ( not ( = ?auto_126553 ?auto_126555 ) ) ( not ( = ?auto_126553 ?auto_126554 ) ) ( not ( = ?auto_126553 ?auto_126552 ) ) ( not ( = ?auto_126553 ?auto_126551 ) ) ( not ( = ?auto_126556 ?auto_126555 ) ) ( not ( = ?auto_126556 ?auto_126554 ) ) ( not ( = ?auto_126556 ?auto_126552 ) ) ( not ( = ?auto_126556 ?auto_126551 ) ) ( not ( = ?auto_126555 ?auto_126554 ) ) ( not ( = ?auto_126555 ?auto_126552 ) ) ( not ( = ?auto_126555 ?auto_126551 ) ) ( not ( = ?auto_126549 ?auto_126553 ) ) ( not ( = ?auto_126549 ?auto_126556 ) ) ( not ( = ?auto_126549 ?auto_126555 ) ) ( not ( = ?auto_126550 ?auto_126553 ) ) ( not ( = ?auto_126550 ?auto_126556 ) ) ( not ( = ?auto_126550 ?auto_126555 ) ) ( ON ?auto_126550 ?auto_126551 ) ( ON ?auto_126549 ?auto_126550 ) ( CLEAR ?auto_126549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126553 ?auto_126556 ?auto_126555 ?auto_126554 ?auto_126552 ?auto_126551 ?auto_126550 )
      ( MAKE-4PILE ?auto_126549 ?auto_126550 ?auto_126551 ?auto_126552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126561 - BLOCK
      ?auto_126562 - BLOCK
      ?auto_126563 - BLOCK
      ?auto_126564 - BLOCK
    )
    :vars
    (
      ?auto_126568 - BLOCK
      ?auto_126567 - BLOCK
      ?auto_126565 - BLOCK
      ?auto_126566 - BLOCK
      ?auto_126569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126561 ?auto_126562 ) ) ( not ( = ?auto_126561 ?auto_126563 ) ) ( not ( = ?auto_126561 ?auto_126564 ) ) ( not ( = ?auto_126562 ?auto_126563 ) ) ( not ( = ?auto_126562 ?auto_126564 ) ) ( not ( = ?auto_126563 ?auto_126564 ) ) ( ON ?auto_126564 ?auto_126568 ) ( not ( = ?auto_126561 ?auto_126568 ) ) ( not ( = ?auto_126562 ?auto_126568 ) ) ( not ( = ?auto_126563 ?auto_126568 ) ) ( not ( = ?auto_126564 ?auto_126568 ) ) ( ON ?auto_126563 ?auto_126564 ) ( ON-TABLE ?auto_126567 ) ( ON ?auto_126565 ?auto_126567 ) ( ON ?auto_126566 ?auto_126565 ) ( ON ?auto_126568 ?auto_126566 ) ( not ( = ?auto_126567 ?auto_126565 ) ) ( not ( = ?auto_126567 ?auto_126566 ) ) ( not ( = ?auto_126567 ?auto_126568 ) ) ( not ( = ?auto_126567 ?auto_126564 ) ) ( not ( = ?auto_126567 ?auto_126563 ) ) ( not ( = ?auto_126565 ?auto_126566 ) ) ( not ( = ?auto_126565 ?auto_126568 ) ) ( not ( = ?auto_126565 ?auto_126564 ) ) ( not ( = ?auto_126565 ?auto_126563 ) ) ( not ( = ?auto_126566 ?auto_126568 ) ) ( not ( = ?auto_126566 ?auto_126564 ) ) ( not ( = ?auto_126566 ?auto_126563 ) ) ( not ( = ?auto_126561 ?auto_126567 ) ) ( not ( = ?auto_126561 ?auto_126565 ) ) ( not ( = ?auto_126561 ?auto_126566 ) ) ( not ( = ?auto_126562 ?auto_126567 ) ) ( not ( = ?auto_126562 ?auto_126565 ) ) ( not ( = ?auto_126562 ?auto_126566 ) ) ( ON ?auto_126562 ?auto_126563 ) ( CLEAR ?auto_126562 ) ( ON ?auto_126561 ?auto_126569 ) ( CLEAR ?auto_126561 ) ( HAND-EMPTY ) ( not ( = ?auto_126561 ?auto_126569 ) ) ( not ( = ?auto_126562 ?auto_126569 ) ) ( not ( = ?auto_126563 ?auto_126569 ) ) ( not ( = ?auto_126564 ?auto_126569 ) ) ( not ( = ?auto_126568 ?auto_126569 ) ) ( not ( = ?auto_126567 ?auto_126569 ) ) ( not ( = ?auto_126565 ?auto_126569 ) ) ( not ( = ?auto_126566 ?auto_126569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126561 ?auto_126569 )
      ( MAKE-4PILE ?auto_126561 ?auto_126562 ?auto_126563 ?auto_126564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126570 - BLOCK
      ?auto_126571 - BLOCK
      ?auto_126572 - BLOCK
      ?auto_126573 - BLOCK
    )
    :vars
    (
      ?auto_126577 - BLOCK
      ?auto_126576 - BLOCK
      ?auto_126575 - BLOCK
      ?auto_126578 - BLOCK
      ?auto_126574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126570 ?auto_126571 ) ) ( not ( = ?auto_126570 ?auto_126572 ) ) ( not ( = ?auto_126570 ?auto_126573 ) ) ( not ( = ?auto_126571 ?auto_126572 ) ) ( not ( = ?auto_126571 ?auto_126573 ) ) ( not ( = ?auto_126572 ?auto_126573 ) ) ( ON ?auto_126573 ?auto_126577 ) ( not ( = ?auto_126570 ?auto_126577 ) ) ( not ( = ?auto_126571 ?auto_126577 ) ) ( not ( = ?auto_126572 ?auto_126577 ) ) ( not ( = ?auto_126573 ?auto_126577 ) ) ( ON ?auto_126572 ?auto_126573 ) ( ON-TABLE ?auto_126576 ) ( ON ?auto_126575 ?auto_126576 ) ( ON ?auto_126578 ?auto_126575 ) ( ON ?auto_126577 ?auto_126578 ) ( not ( = ?auto_126576 ?auto_126575 ) ) ( not ( = ?auto_126576 ?auto_126578 ) ) ( not ( = ?auto_126576 ?auto_126577 ) ) ( not ( = ?auto_126576 ?auto_126573 ) ) ( not ( = ?auto_126576 ?auto_126572 ) ) ( not ( = ?auto_126575 ?auto_126578 ) ) ( not ( = ?auto_126575 ?auto_126577 ) ) ( not ( = ?auto_126575 ?auto_126573 ) ) ( not ( = ?auto_126575 ?auto_126572 ) ) ( not ( = ?auto_126578 ?auto_126577 ) ) ( not ( = ?auto_126578 ?auto_126573 ) ) ( not ( = ?auto_126578 ?auto_126572 ) ) ( not ( = ?auto_126570 ?auto_126576 ) ) ( not ( = ?auto_126570 ?auto_126575 ) ) ( not ( = ?auto_126570 ?auto_126578 ) ) ( not ( = ?auto_126571 ?auto_126576 ) ) ( not ( = ?auto_126571 ?auto_126575 ) ) ( not ( = ?auto_126571 ?auto_126578 ) ) ( ON ?auto_126570 ?auto_126574 ) ( CLEAR ?auto_126570 ) ( not ( = ?auto_126570 ?auto_126574 ) ) ( not ( = ?auto_126571 ?auto_126574 ) ) ( not ( = ?auto_126572 ?auto_126574 ) ) ( not ( = ?auto_126573 ?auto_126574 ) ) ( not ( = ?auto_126577 ?auto_126574 ) ) ( not ( = ?auto_126576 ?auto_126574 ) ) ( not ( = ?auto_126575 ?auto_126574 ) ) ( not ( = ?auto_126578 ?auto_126574 ) ) ( HOLDING ?auto_126571 ) ( CLEAR ?auto_126572 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126576 ?auto_126575 ?auto_126578 ?auto_126577 ?auto_126573 ?auto_126572 ?auto_126571 )
      ( MAKE-4PILE ?auto_126570 ?auto_126571 ?auto_126572 ?auto_126573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126579 - BLOCK
      ?auto_126580 - BLOCK
      ?auto_126581 - BLOCK
      ?auto_126582 - BLOCK
    )
    :vars
    (
      ?auto_126583 - BLOCK
      ?auto_126584 - BLOCK
      ?auto_126587 - BLOCK
      ?auto_126585 - BLOCK
      ?auto_126586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126579 ?auto_126580 ) ) ( not ( = ?auto_126579 ?auto_126581 ) ) ( not ( = ?auto_126579 ?auto_126582 ) ) ( not ( = ?auto_126580 ?auto_126581 ) ) ( not ( = ?auto_126580 ?auto_126582 ) ) ( not ( = ?auto_126581 ?auto_126582 ) ) ( ON ?auto_126582 ?auto_126583 ) ( not ( = ?auto_126579 ?auto_126583 ) ) ( not ( = ?auto_126580 ?auto_126583 ) ) ( not ( = ?auto_126581 ?auto_126583 ) ) ( not ( = ?auto_126582 ?auto_126583 ) ) ( ON ?auto_126581 ?auto_126582 ) ( ON-TABLE ?auto_126584 ) ( ON ?auto_126587 ?auto_126584 ) ( ON ?auto_126585 ?auto_126587 ) ( ON ?auto_126583 ?auto_126585 ) ( not ( = ?auto_126584 ?auto_126587 ) ) ( not ( = ?auto_126584 ?auto_126585 ) ) ( not ( = ?auto_126584 ?auto_126583 ) ) ( not ( = ?auto_126584 ?auto_126582 ) ) ( not ( = ?auto_126584 ?auto_126581 ) ) ( not ( = ?auto_126587 ?auto_126585 ) ) ( not ( = ?auto_126587 ?auto_126583 ) ) ( not ( = ?auto_126587 ?auto_126582 ) ) ( not ( = ?auto_126587 ?auto_126581 ) ) ( not ( = ?auto_126585 ?auto_126583 ) ) ( not ( = ?auto_126585 ?auto_126582 ) ) ( not ( = ?auto_126585 ?auto_126581 ) ) ( not ( = ?auto_126579 ?auto_126584 ) ) ( not ( = ?auto_126579 ?auto_126587 ) ) ( not ( = ?auto_126579 ?auto_126585 ) ) ( not ( = ?auto_126580 ?auto_126584 ) ) ( not ( = ?auto_126580 ?auto_126587 ) ) ( not ( = ?auto_126580 ?auto_126585 ) ) ( ON ?auto_126579 ?auto_126586 ) ( not ( = ?auto_126579 ?auto_126586 ) ) ( not ( = ?auto_126580 ?auto_126586 ) ) ( not ( = ?auto_126581 ?auto_126586 ) ) ( not ( = ?auto_126582 ?auto_126586 ) ) ( not ( = ?auto_126583 ?auto_126586 ) ) ( not ( = ?auto_126584 ?auto_126586 ) ) ( not ( = ?auto_126587 ?auto_126586 ) ) ( not ( = ?auto_126585 ?auto_126586 ) ) ( CLEAR ?auto_126581 ) ( ON ?auto_126580 ?auto_126579 ) ( CLEAR ?auto_126580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126586 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126586 ?auto_126579 )
      ( MAKE-4PILE ?auto_126579 ?auto_126580 ?auto_126581 ?auto_126582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126588 - BLOCK
      ?auto_126589 - BLOCK
      ?auto_126590 - BLOCK
      ?auto_126591 - BLOCK
    )
    :vars
    (
      ?auto_126593 - BLOCK
      ?auto_126592 - BLOCK
      ?auto_126594 - BLOCK
      ?auto_126595 - BLOCK
      ?auto_126596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126588 ?auto_126589 ) ) ( not ( = ?auto_126588 ?auto_126590 ) ) ( not ( = ?auto_126588 ?auto_126591 ) ) ( not ( = ?auto_126589 ?auto_126590 ) ) ( not ( = ?auto_126589 ?auto_126591 ) ) ( not ( = ?auto_126590 ?auto_126591 ) ) ( ON ?auto_126591 ?auto_126593 ) ( not ( = ?auto_126588 ?auto_126593 ) ) ( not ( = ?auto_126589 ?auto_126593 ) ) ( not ( = ?auto_126590 ?auto_126593 ) ) ( not ( = ?auto_126591 ?auto_126593 ) ) ( ON-TABLE ?auto_126592 ) ( ON ?auto_126594 ?auto_126592 ) ( ON ?auto_126595 ?auto_126594 ) ( ON ?auto_126593 ?auto_126595 ) ( not ( = ?auto_126592 ?auto_126594 ) ) ( not ( = ?auto_126592 ?auto_126595 ) ) ( not ( = ?auto_126592 ?auto_126593 ) ) ( not ( = ?auto_126592 ?auto_126591 ) ) ( not ( = ?auto_126592 ?auto_126590 ) ) ( not ( = ?auto_126594 ?auto_126595 ) ) ( not ( = ?auto_126594 ?auto_126593 ) ) ( not ( = ?auto_126594 ?auto_126591 ) ) ( not ( = ?auto_126594 ?auto_126590 ) ) ( not ( = ?auto_126595 ?auto_126593 ) ) ( not ( = ?auto_126595 ?auto_126591 ) ) ( not ( = ?auto_126595 ?auto_126590 ) ) ( not ( = ?auto_126588 ?auto_126592 ) ) ( not ( = ?auto_126588 ?auto_126594 ) ) ( not ( = ?auto_126588 ?auto_126595 ) ) ( not ( = ?auto_126589 ?auto_126592 ) ) ( not ( = ?auto_126589 ?auto_126594 ) ) ( not ( = ?auto_126589 ?auto_126595 ) ) ( ON ?auto_126588 ?auto_126596 ) ( not ( = ?auto_126588 ?auto_126596 ) ) ( not ( = ?auto_126589 ?auto_126596 ) ) ( not ( = ?auto_126590 ?auto_126596 ) ) ( not ( = ?auto_126591 ?auto_126596 ) ) ( not ( = ?auto_126593 ?auto_126596 ) ) ( not ( = ?auto_126592 ?auto_126596 ) ) ( not ( = ?auto_126594 ?auto_126596 ) ) ( not ( = ?auto_126595 ?auto_126596 ) ) ( ON ?auto_126589 ?auto_126588 ) ( CLEAR ?auto_126589 ) ( ON-TABLE ?auto_126596 ) ( HOLDING ?auto_126590 ) ( CLEAR ?auto_126591 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126592 ?auto_126594 ?auto_126595 ?auto_126593 ?auto_126591 ?auto_126590 )
      ( MAKE-4PILE ?auto_126588 ?auto_126589 ?auto_126590 ?auto_126591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126597 - BLOCK
      ?auto_126598 - BLOCK
      ?auto_126599 - BLOCK
      ?auto_126600 - BLOCK
    )
    :vars
    (
      ?auto_126601 - BLOCK
      ?auto_126603 - BLOCK
      ?auto_126605 - BLOCK
      ?auto_126602 - BLOCK
      ?auto_126604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126597 ?auto_126598 ) ) ( not ( = ?auto_126597 ?auto_126599 ) ) ( not ( = ?auto_126597 ?auto_126600 ) ) ( not ( = ?auto_126598 ?auto_126599 ) ) ( not ( = ?auto_126598 ?auto_126600 ) ) ( not ( = ?auto_126599 ?auto_126600 ) ) ( ON ?auto_126600 ?auto_126601 ) ( not ( = ?auto_126597 ?auto_126601 ) ) ( not ( = ?auto_126598 ?auto_126601 ) ) ( not ( = ?auto_126599 ?auto_126601 ) ) ( not ( = ?auto_126600 ?auto_126601 ) ) ( ON-TABLE ?auto_126603 ) ( ON ?auto_126605 ?auto_126603 ) ( ON ?auto_126602 ?auto_126605 ) ( ON ?auto_126601 ?auto_126602 ) ( not ( = ?auto_126603 ?auto_126605 ) ) ( not ( = ?auto_126603 ?auto_126602 ) ) ( not ( = ?auto_126603 ?auto_126601 ) ) ( not ( = ?auto_126603 ?auto_126600 ) ) ( not ( = ?auto_126603 ?auto_126599 ) ) ( not ( = ?auto_126605 ?auto_126602 ) ) ( not ( = ?auto_126605 ?auto_126601 ) ) ( not ( = ?auto_126605 ?auto_126600 ) ) ( not ( = ?auto_126605 ?auto_126599 ) ) ( not ( = ?auto_126602 ?auto_126601 ) ) ( not ( = ?auto_126602 ?auto_126600 ) ) ( not ( = ?auto_126602 ?auto_126599 ) ) ( not ( = ?auto_126597 ?auto_126603 ) ) ( not ( = ?auto_126597 ?auto_126605 ) ) ( not ( = ?auto_126597 ?auto_126602 ) ) ( not ( = ?auto_126598 ?auto_126603 ) ) ( not ( = ?auto_126598 ?auto_126605 ) ) ( not ( = ?auto_126598 ?auto_126602 ) ) ( ON ?auto_126597 ?auto_126604 ) ( not ( = ?auto_126597 ?auto_126604 ) ) ( not ( = ?auto_126598 ?auto_126604 ) ) ( not ( = ?auto_126599 ?auto_126604 ) ) ( not ( = ?auto_126600 ?auto_126604 ) ) ( not ( = ?auto_126601 ?auto_126604 ) ) ( not ( = ?auto_126603 ?auto_126604 ) ) ( not ( = ?auto_126605 ?auto_126604 ) ) ( not ( = ?auto_126602 ?auto_126604 ) ) ( ON ?auto_126598 ?auto_126597 ) ( ON-TABLE ?auto_126604 ) ( CLEAR ?auto_126600 ) ( ON ?auto_126599 ?auto_126598 ) ( CLEAR ?auto_126599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126604 ?auto_126597 ?auto_126598 )
      ( MAKE-4PILE ?auto_126597 ?auto_126598 ?auto_126599 ?auto_126600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126606 - BLOCK
      ?auto_126607 - BLOCK
      ?auto_126608 - BLOCK
      ?auto_126609 - BLOCK
    )
    :vars
    (
      ?auto_126614 - BLOCK
      ?auto_126613 - BLOCK
      ?auto_126610 - BLOCK
      ?auto_126612 - BLOCK
      ?auto_126611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126606 ?auto_126607 ) ) ( not ( = ?auto_126606 ?auto_126608 ) ) ( not ( = ?auto_126606 ?auto_126609 ) ) ( not ( = ?auto_126607 ?auto_126608 ) ) ( not ( = ?auto_126607 ?auto_126609 ) ) ( not ( = ?auto_126608 ?auto_126609 ) ) ( not ( = ?auto_126606 ?auto_126614 ) ) ( not ( = ?auto_126607 ?auto_126614 ) ) ( not ( = ?auto_126608 ?auto_126614 ) ) ( not ( = ?auto_126609 ?auto_126614 ) ) ( ON-TABLE ?auto_126613 ) ( ON ?auto_126610 ?auto_126613 ) ( ON ?auto_126612 ?auto_126610 ) ( ON ?auto_126614 ?auto_126612 ) ( not ( = ?auto_126613 ?auto_126610 ) ) ( not ( = ?auto_126613 ?auto_126612 ) ) ( not ( = ?auto_126613 ?auto_126614 ) ) ( not ( = ?auto_126613 ?auto_126609 ) ) ( not ( = ?auto_126613 ?auto_126608 ) ) ( not ( = ?auto_126610 ?auto_126612 ) ) ( not ( = ?auto_126610 ?auto_126614 ) ) ( not ( = ?auto_126610 ?auto_126609 ) ) ( not ( = ?auto_126610 ?auto_126608 ) ) ( not ( = ?auto_126612 ?auto_126614 ) ) ( not ( = ?auto_126612 ?auto_126609 ) ) ( not ( = ?auto_126612 ?auto_126608 ) ) ( not ( = ?auto_126606 ?auto_126613 ) ) ( not ( = ?auto_126606 ?auto_126610 ) ) ( not ( = ?auto_126606 ?auto_126612 ) ) ( not ( = ?auto_126607 ?auto_126613 ) ) ( not ( = ?auto_126607 ?auto_126610 ) ) ( not ( = ?auto_126607 ?auto_126612 ) ) ( ON ?auto_126606 ?auto_126611 ) ( not ( = ?auto_126606 ?auto_126611 ) ) ( not ( = ?auto_126607 ?auto_126611 ) ) ( not ( = ?auto_126608 ?auto_126611 ) ) ( not ( = ?auto_126609 ?auto_126611 ) ) ( not ( = ?auto_126614 ?auto_126611 ) ) ( not ( = ?auto_126613 ?auto_126611 ) ) ( not ( = ?auto_126610 ?auto_126611 ) ) ( not ( = ?auto_126612 ?auto_126611 ) ) ( ON ?auto_126607 ?auto_126606 ) ( ON-TABLE ?auto_126611 ) ( ON ?auto_126608 ?auto_126607 ) ( CLEAR ?auto_126608 ) ( HOLDING ?auto_126609 ) ( CLEAR ?auto_126614 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126613 ?auto_126610 ?auto_126612 ?auto_126614 ?auto_126609 )
      ( MAKE-4PILE ?auto_126606 ?auto_126607 ?auto_126608 ?auto_126609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126615 - BLOCK
      ?auto_126616 - BLOCK
      ?auto_126617 - BLOCK
      ?auto_126618 - BLOCK
    )
    :vars
    (
      ?auto_126620 - BLOCK
      ?auto_126621 - BLOCK
      ?auto_126623 - BLOCK
      ?auto_126622 - BLOCK
      ?auto_126619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126615 ?auto_126616 ) ) ( not ( = ?auto_126615 ?auto_126617 ) ) ( not ( = ?auto_126615 ?auto_126618 ) ) ( not ( = ?auto_126616 ?auto_126617 ) ) ( not ( = ?auto_126616 ?auto_126618 ) ) ( not ( = ?auto_126617 ?auto_126618 ) ) ( not ( = ?auto_126615 ?auto_126620 ) ) ( not ( = ?auto_126616 ?auto_126620 ) ) ( not ( = ?auto_126617 ?auto_126620 ) ) ( not ( = ?auto_126618 ?auto_126620 ) ) ( ON-TABLE ?auto_126621 ) ( ON ?auto_126623 ?auto_126621 ) ( ON ?auto_126622 ?auto_126623 ) ( ON ?auto_126620 ?auto_126622 ) ( not ( = ?auto_126621 ?auto_126623 ) ) ( not ( = ?auto_126621 ?auto_126622 ) ) ( not ( = ?auto_126621 ?auto_126620 ) ) ( not ( = ?auto_126621 ?auto_126618 ) ) ( not ( = ?auto_126621 ?auto_126617 ) ) ( not ( = ?auto_126623 ?auto_126622 ) ) ( not ( = ?auto_126623 ?auto_126620 ) ) ( not ( = ?auto_126623 ?auto_126618 ) ) ( not ( = ?auto_126623 ?auto_126617 ) ) ( not ( = ?auto_126622 ?auto_126620 ) ) ( not ( = ?auto_126622 ?auto_126618 ) ) ( not ( = ?auto_126622 ?auto_126617 ) ) ( not ( = ?auto_126615 ?auto_126621 ) ) ( not ( = ?auto_126615 ?auto_126623 ) ) ( not ( = ?auto_126615 ?auto_126622 ) ) ( not ( = ?auto_126616 ?auto_126621 ) ) ( not ( = ?auto_126616 ?auto_126623 ) ) ( not ( = ?auto_126616 ?auto_126622 ) ) ( ON ?auto_126615 ?auto_126619 ) ( not ( = ?auto_126615 ?auto_126619 ) ) ( not ( = ?auto_126616 ?auto_126619 ) ) ( not ( = ?auto_126617 ?auto_126619 ) ) ( not ( = ?auto_126618 ?auto_126619 ) ) ( not ( = ?auto_126620 ?auto_126619 ) ) ( not ( = ?auto_126621 ?auto_126619 ) ) ( not ( = ?auto_126623 ?auto_126619 ) ) ( not ( = ?auto_126622 ?auto_126619 ) ) ( ON ?auto_126616 ?auto_126615 ) ( ON-TABLE ?auto_126619 ) ( ON ?auto_126617 ?auto_126616 ) ( CLEAR ?auto_126620 ) ( ON ?auto_126618 ?auto_126617 ) ( CLEAR ?auto_126618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126619 ?auto_126615 ?auto_126616 ?auto_126617 )
      ( MAKE-4PILE ?auto_126615 ?auto_126616 ?auto_126617 ?auto_126618 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126624 - BLOCK
      ?auto_126625 - BLOCK
      ?auto_126626 - BLOCK
      ?auto_126627 - BLOCK
    )
    :vars
    (
      ?auto_126630 - BLOCK
      ?auto_126632 - BLOCK
      ?auto_126629 - BLOCK
      ?auto_126628 - BLOCK
      ?auto_126631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126624 ?auto_126625 ) ) ( not ( = ?auto_126624 ?auto_126626 ) ) ( not ( = ?auto_126624 ?auto_126627 ) ) ( not ( = ?auto_126625 ?auto_126626 ) ) ( not ( = ?auto_126625 ?auto_126627 ) ) ( not ( = ?auto_126626 ?auto_126627 ) ) ( not ( = ?auto_126624 ?auto_126630 ) ) ( not ( = ?auto_126625 ?auto_126630 ) ) ( not ( = ?auto_126626 ?auto_126630 ) ) ( not ( = ?auto_126627 ?auto_126630 ) ) ( ON-TABLE ?auto_126632 ) ( ON ?auto_126629 ?auto_126632 ) ( ON ?auto_126628 ?auto_126629 ) ( not ( = ?auto_126632 ?auto_126629 ) ) ( not ( = ?auto_126632 ?auto_126628 ) ) ( not ( = ?auto_126632 ?auto_126630 ) ) ( not ( = ?auto_126632 ?auto_126627 ) ) ( not ( = ?auto_126632 ?auto_126626 ) ) ( not ( = ?auto_126629 ?auto_126628 ) ) ( not ( = ?auto_126629 ?auto_126630 ) ) ( not ( = ?auto_126629 ?auto_126627 ) ) ( not ( = ?auto_126629 ?auto_126626 ) ) ( not ( = ?auto_126628 ?auto_126630 ) ) ( not ( = ?auto_126628 ?auto_126627 ) ) ( not ( = ?auto_126628 ?auto_126626 ) ) ( not ( = ?auto_126624 ?auto_126632 ) ) ( not ( = ?auto_126624 ?auto_126629 ) ) ( not ( = ?auto_126624 ?auto_126628 ) ) ( not ( = ?auto_126625 ?auto_126632 ) ) ( not ( = ?auto_126625 ?auto_126629 ) ) ( not ( = ?auto_126625 ?auto_126628 ) ) ( ON ?auto_126624 ?auto_126631 ) ( not ( = ?auto_126624 ?auto_126631 ) ) ( not ( = ?auto_126625 ?auto_126631 ) ) ( not ( = ?auto_126626 ?auto_126631 ) ) ( not ( = ?auto_126627 ?auto_126631 ) ) ( not ( = ?auto_126630 ?auto_126631 ) ) ( not ( = ?auto_126632 ?auto_126631 ) ) ( not ( = ?auto_126629 ?auto_126631 ) ) ( not ( = ?auto_126628 ?auto_126631 ) ) ( ON ?auto_126625 ?auto_126624 ) ( ON-TABLE ?auto_126631 ) ( ON ?auto_126626 ?auto_126625 ) ( ON ?auto_126627 ?auto_126626 ) ( CLEAR ?auto_126627 ) ( HOLDING ?auto_126630 ) ( CLEAR ?auto_126628 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126632 ?auto_126629 ?auto_126628 ?auto_126630 )
      ( MAKE-4PILE ?auto_126624 ?auto_126625 ?auto_126626 ?auto_126627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126633 - BLOCK
      ?auto_126634 - BLOCK
      ?auto_126635 - BLOCK
      ?auto_126636 - BLOCK
    )
    :vars
    (
      ?auto_126639 - BLOCK
      ?auto_126640 - BLOCK
      ?auto_126637 - BLOCK
      ?auto_126638 - BLOCK
      ?auto_126641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126633 ?auto_126634 ) ) ( not ( = ?auto_126633 ?auto_126635 ) ) ( not ( = ?auto_126633 ?auto_126636 ) ) ( not ( = ?auto_126634 ?auto_126635 ) ) ( not ( = ?auto_126634 ?auto_126636 ) ) ( not ( = ?auto_126635 ?auto_126636 ) ) ( not ( = ?auto_126633 ?auto_126639 ) ) ( not ( = ?auto_126634 ?auto_126639 ) ) ( not ( = ?auto_126635 ?auto_126639 ) ) ( not ( = ?auto_126636 ?auto_126639 ) ) ( ON-TABLE ?auto_126640 ) ( ON ?auto_126637 ?auto_126640 ) ( ON ?auto_126638 ?auto_126637 ) ( not ( = ?auto_126640 ?auto_126637 ) ) ( not ( = ?auto_126640 ?auto_126638 ) ) ( not ( = ?auto_126640 ?auto_126639 ) ) ( not ( = ?auto_126640 ?auto_126636 ) ) ( not ( = ?auto_126640 ?auto_126635 ) ) ( not ( = ?auto_126637 ?auto_126638 ) ) ( not ( = ?auto_126637 ?auto_126639 ) ) ( not ( = ?auto_126637 ?auto_126636 ) ) ( not ( = ?auto_126637 ?auto_126635 ) ) ( not ( = ?auto_126638 ?auto_126639 ) ) ( not ( = ?auto_126638 ?auto_126636 ) ) ( not ( = ?auto_126638 ?auto_126635 ) ) ( not ( = ?auto_126633 ?auto_126640 ) ) ( not ( = ?auto_126633 ?auto_126637 ) ) ( not ( = ?auto_126633 ?auto_126638 ) ) ( not ( = ?auto_126634 ?auto_126640 ) ) ( not ( = ?auto_126634 ?auto_126637 ) ) ( not ( = ?auto_126634 ?auto_126638 ) ) ( ON ?auto_126633 ?auto_126641 ) ( not ( = ?auto_126633 ?auto_126641 ) ) ( not ( = ?auto_126634 ?auto_126641 ) ) ( not ( = ?auto_126635 ?auto_126641 ) ) ( not ( = ?auto_126636 ?auto_126641 ) ) ( not ( = ?auto_126639 ?auto_126641 ) ) ( not ( = ?auto_126640 ?auto_126641 ) ) ( not ( = ?auto_126637 ?auto_126641 ) ) ( not ( = ?auto_126638 ?auto_126641 ) ) ( ON ?auto_126634 ?auto_126633 ) ( ON-TABLE ?auto_126641 ) ( ON ?auto_126635 ?auto_126634 ) ( ON ?auto_126636 ?auto_126635 ) ( CLEAR ?auto_126638 ) ( ON ?auto_126639 ?auto_126636 ) ( CLEAR ?auto_126639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126641 ?auto_126633 ?auto_126634 ?auto_126635 ?auto_126636 )
      ( MAKE-4PILE ?auto_126633 ?auto_126634 ?auto_126635 ?auto_126636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126642 - BLOCK
      ?auto_126643 - BLOCK
      ?auto_126644 - BLOCK
      ?auto_126645 - BLOCK
    )
    :vars
    (
      ?auto_126646 - BLOCK
      ?auto_126649 - BLOCK
      ?auto_126647 - BLOCK
      ?auto_126648 - BLOCK
      ?auto_126650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126642 ?auto_126643 ) ) ( not ( = ?auto_126642 ?auto_126644 ) ) ( not ( = ?auto_126642 ?auto_126645 ) ) ( not ( = ?auto_126643 ?auto_126644 ) ) ( not ( = ?auto_126643 ?auto_126645 ) ) ( not ( = ?auto_126644 ?auto_126645 ) ) ( not ( = ?auto_126642 ?auto_126646 ) ) ( not ( = ?auto_126643 ?auto_126646 ) ) ( not ( = ?auto_126644 ?auto_126646 ) ) ( not ( = ?auto_126645 ?auto_126646 ) ) ( ON-TABLE ?auto_126649 ) ( ON ?auto_126647 ?auto_126649 ) ( not ( = ?auto_126649 ?auto_126647 ) ) ( not ( = ?auto_126649 ?auto_126648 ) ) ( not ( = ?auto_126649 ?auto_126646 ) ) ( not ( = ?auto_126649 ?auto_126645 ) ) ( not ( = ?auto_126649 ?auto_126644 ) ) ( not ( = ?auto_126647 ?auto_126648 ) ) ( not ( = ?auto_126647 ?auto_126646 ) ) ( not ( = ?auto_126647 ?auto_126645 ) ) ( not ( = ?auto_126647 ?auto_126644 ) ) ( not ( = ?auto_126648 ?auto_126646 ) ) ( not ( = ?auto_126648 ?auto_126645 ) ) ( not ( = ?auto_126648 ?auto_126644 ) ) ( not ( = ?auto_126642 ?auto_126649 ) ) ( not ( = ?auto_126642 ?auto_126647 ) ) ( not ( = ?auto_126642 ?auto_126648 ) ) ( not ( = ?auto_126643 ?auto_126649 ) ) ( not ( = ?auto_126643 ?auto_126647 ) ) ( not ( = ?auto_126643 ?auto_126648 ) ) ( ON ?auto_126642 ?auto_126650 ) ( not ( = ?auto_126642 ?auto_126650 ) ) ( not ( = ?auto_126643 ?auto_126650 ) ) ( not ( = ?auto_126644 ?auto_126650 ) ) ( not ( = ?auto_126645 ?auto_126650 ) ) ( not ( = ?auto_126646 ?auto_126650 ) ) ( not ( = ?auto_126649 ?auto_126650 ) ) ( not ( = ?auto_126647 ?auto_126650 ) ) ( not ( = ?auto_126648 ?auto_126650 ) ) ( ON ?auto_126643 ?auto_126642 ) ( ON-TABLE ?auto_126650 ) ( ON ?auto_126644 ?auto_126643 ) ( ON ?auto_126645 ?auto_126644 ) ( ON ?auto_126646 ?auto_126645 ) ( CLEAR ?auto_126646 ) ( HOLDING ?auto_126648 ) ( CLEAR ?auto_126647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126649 ?auto_126647 ?auto_126648 )
      ( MAKE-4PILE ?auto_126642 ?auto_126643 ?auto_126644 ?auto_126645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126651 - BLOCK
      ?auto_126652 - BLOCK
      ?auto_126653 - BLOCK
      ?auto_126654 - BLOCK
    )
    :vars
    (
      ?auto_126659 - BLOCK
      ?auto_126655 - BLOCK
      ?auto_126656 - BLOCK
      ?auto_126658 - BLOCK
      ?auto_126657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126651 ?auto_126652 ) ) ( not ( = ?auto_126651 ?auto_126653 ) ) ( not ( = ?auto_126651 ?auto_126654 ) ) ( not ( = ?auto_126652 ?auto_126653 ) ) ( not ( = ?auto_126652 ?auto_126654 ) ) ( not ( = ?auto_126653 ?auto_126654 ) ) ( not ( = ?auto_126651 ?auto_126659 ) ) ( not ( = ?auto_126652 ?auto_126659 ) ) ( not ( = ?auto_126653 ?auto_126659 ) ) ( not ( = ?auto_126654 ?auto_126659 ) ) ( ON-TABLE ?auto_126655 ) ( ON ?auto_126656 ?auto_126655 ) ( not ( = ?auto_126655 ?auto_126656 ) ) ( not ( = ?auto_126655 ?auto_126658 ) ) ( not ( = ?auto_126655 ?auto_126659 ) ) ( not ( = ?auto_126655 ?auto_126654 ) ) ( not ( = ?auto_126655 ?auto_126653 ) ) ( not ( = ?auto_126656 ?auto_126658 ) ) ( not ( = ?auto_126656 ?auto_126659 ) ) ( not ( = ?auto_126656 ?auto_126654 ) ) ( not ( = ?auto_126656 ?auto_126653 ) ) ( not ( = ?auto_126658 ?auto_126659 ) ) ( not ( = ?auto_126658 ?auto_126654 ) ) ( not ( = ?auto_126658 ?auto_126653 ) ) ( not ( = ?auto_126651 ?auto_126655 ) ) ( not ( = ?auto_126651 ?auto_126656 ) ) ( not ( = ?auto_126651 ?auto_126658 ) ) ( not ( = ?auto_126652 ?auto_126655 ) ) ( not ( = ?auto_126652 ?auto_126656 ) ) ( not ( = ?auto_126652 ?auto_126658 ) ) ( ON ?auto_126651 ?auto_126657 ) ( not ( = ?auto_126651 ?auto_126657 ) ) ( not ( = ?auto_126652 ?auto_126657 ) ) ( not ( = ?auto_126653 ?auto_126657 ) ) ( not ( = ?auto_126654 ?auto_126657 ) ) ( not ( = ?auto_126659 ?auto_126657 ) ) ( not ( = ?auto_126655 ?auto_126657 ) ) ( not ( = ?auto_126656 ?auto_126657 ) ) ( not ( = ?auto_126658 ?auto_126657 ) ) ( ON ?auto_126652 ?auto_126651 ) ( ON-TABLE ?auto_126657 ) ( ON ?auto_126653 ?auto_126652 ) ( ON ?auto_126654 ?auto_126653 ) ( ON ?auto_126659 ?auto_126654 ) ( CLEAR ?auto_126656 ) ( ON ?auto_126658 ?auto_126659 ) ( CLEAR ?auto_126658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126657 ?auto_126651 ?auto_126652 ?auto_126653 ?auto_126654 ?auto_126659 )
      ( MAKE-4PILE ?auto_126651 ?auto_126652 ?auto_126653 ?auto_126654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126660 - BLOCK
      ?auto_126661 - BLOCK
      ?auto_126662 - BLOCK
      ?auto_126663 - BLOCK
    )
    :vars
    (
      ?auto_126665 - BLOCK
      ?auto_126668 - BLOCK
      ?auto_126666 - BLOCK
      ?auto_126667 - BLOCK
      ?auto_126664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126660 ?auto_126661 ) ) ( not ( = ?auto_126660 ?auto_126662 ) ) ( not ( = ?auto_126660 ?auto_126663 ) ) ( not ( = ?auto_126661 ?auto_126662 ) ) ( not ( = ?auto_126661 ?auto_126663 ) ) ( not ( = ?auto_126662 ?auto_126663 ) ) ( not ( = ?auto_126660 ?auto_126665 ) ) ( not ( = ?auto_126661 ?auto_126665 ) ) ( not ( = ?auto_126662 ?auto_126665 ) ) ( not ( = ?auto_126663 ?auto_126665 ) ) ( ON-TABLE ?auto_126668 ) ( not ( = ?auto_126668 ?auto_126666 ) ) ( not ( = ?auto_126668 ?auto_126667 ) ) ( not ( = ?auto_126668 ?auto_126665 ) ) ( not ( = ?auto_126668 ?auto_126663 ) ) ( not ( = ?auto_126668 ?auto_126662 ) ) ( not ( = ?auto_126666 ?auto_126667 ) ) ( not ( = ?auto_126666 ?auto_126665 ) ) ( not ( = ?auto_126666 ?auto_126663 ) ) ( not ( = ?auto_126666 ?auto_126662 ) ) ( not ( = ?auto_126667 ?auto_126665 ) ) ( not ( = ?auto_126667 ?auto_126663 ) ) ( not ( = ?auto_126667 ?auto_126662 ) ) ( not ( = ?auto_126660 ?auto_126668 ) ) ( not ( = ?auto_126660 ?auto_126666 ) ) ( not ( = ?auto_126660 ?auto_126667 ) ) ( not ( = ?auto_126661 ?auto_126668 ) ) ( not ( = ?auto_126661 ?auto_126666 ) ) ( not ( = ?auto_126661 ?auto_126667 ) ) ( ON ?auto_126660 ?auto_126664 ) ( not ( = ?auto_126660 ?auto_126664 ) ) ( not ( = ?auto_126661 ?auto_126664 ) ) ( not ( = ?auto_126662 ?auto_126664 ) ) ( not ( = ?auto_126663 ?auto_126664 ) ) ( not ( = ?auto_126665 ?auto_126664 ) ) ( not ( = ?auto_126668 ?auto_126664 ) ) ( not ( = ?auto_126666 ?auto_126664 ) ) ( not ( = ?auto_126667 ?auto_126664 ) ) ( ON ?auto_126661 ?auto_126660 ) ( ON-TABLE ?auto_126664 ) ( ON ?auto_126662 ?auto_126661 ) ( ON ?auto_126663 ?auto_126662 ) ( ON ?auto_126665 ?auto_126663 ) ( ON ?auto_126667 ?auto_126665 ) ( CLEAR ?auto_126667 ) ( HOLDING ?auto_126666 ) ( CLEAR ?auto_126668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126668 ?auto_126666 )
      ( MAKE-4PILE ?auto_126660 ?auto_126661 ?auto_126662 ?auto_126663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126669 - BLOCK
      ?auto_126670 - BLOCK
      ?auto_126671 - BLOCK
      ?auto_126672 - BLOCK
    )
    :vars
    (
      ?auto_126676 - BLOCK
      ?auto_126675 - BLOCK
      ?auto_126674 - BLOCK
      ?auto_126677 - BLOCK
      ?auto_126673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126669 ?auto_126670 ) ) ( not ( = ?auto_126669 ?auto_126671 ) ) ( not ( = ?auto_126669 ?auto_126672 ) ) ( not ( = ?auto_126670 ?auto_126671 ) ) ( not ( = ?auto_126670 ?auto_126672 ) ) ( not ( = ?auto_126671 ?auto_126672 ) ) ( not ( = ?auto_126669 ?auto_126676 ) ) ( not ( = ?auto_126670 ?auto_126676 ) ) ( not ( = ?auto_126671 ?auto_126676 ) ) ( not ( = ?auto_126672 ?auto_126676 ) ) ( ON-TABLE ?auto_126675 ) ( not ( = ?auto_126675 ?auto_126674 ) ) ( not ( = ?auto_126675 ?auto_126677 ) ) ( not ( = ?auto_126675 ?auto_126676 ) ) ( not ( = ?auto_126675 ?auto_126672 ) ) ( not ( = ?auto_126675 ?auto_126671 ) ) ( not ( = ?auto_126674 ?auto_126677 ) ) ( not ( = ?auto_126674 ?auto_126676 ) ) ( not ( = ?auto_126674 ?auto_126672 ) ) ( not ( = ?auto_126674 ?auto_126671 ) ) ( not ( = ?auto_126677 ?auto_126676 ) ) ( not ( = ?auto_126677 ?auto_126672 ) ) ( not ( = ?auto_126677 ?auto_126671 ) ) ( not ( = ?auto_126669 ?auto_126675 ) ) ( not ( = ?auto_126669 ?auto_126674 ) ) ( not ( = ?auto_126669 ?auto_126677 ) ) ( not ( = ?auto_126670 ?auto_126675 ) ) ( not ( = ?auto_126670 ?auto_126674 ) ) ( not ( = ?auto_126670 ?auto_126677 ) ) ( ON ?auto_126669 ?auto_126673 ) ( not ( = ?auto_126669 ?auto_126673 ) ) ( not ( = ?auto_126670 ?auto_126673 ) ) ( not ( = ?auto_126671 ?auto_126673 ) ) ( not ( = ?auto_126672 ?auto_126673 ) ) ( not ( = ?auto_126676 ?auto_126673 ) ) ( not ( = ?auto_126675 ?auto_126673 ) ) ( not ( = ?auto_126674 ?auto_126673 ) ) ( not ( = ?auto_126677 ?auto_126673 ) ) ( ON ?auto_126670 ?auto_126669 ) ( ON-TABLE ?auto_126673 ) ( ON ?auto_126671 ?auto_126670 ) ( ON ?auto_126672 ?auto_126671 ) ( ON ?auto_126676 ?auto_126672 ) ( ON ?auto_126677 ?auto_126676 ) ( CLEAR ?auto_126675 ) ( ON ?auto_126674 ?auto_126677 ) ( CLEAR ?auto_126674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126673 ?auto_126669 ?auto_126670 ?auto_126671 ?auto_126672 ?auto_126676 ?auto_126677 )
      ( MAKE-4PILE ?auto_126669 ?auto_126670 ?auto_126671 ?auto_126672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126678 - BLOCK
      ?auto_126679 - BLOCK
      ?auto_126680 - BLOCK
      ?auto_126681 - BLOCK
    )
    :vars
    (
      ?auto_126683 - BLOCK
      ?auto_126682 - BLOCK
      ?auto_126685 - BLOCK
      ?auto_126686 - BLOCK
      ?auto_126684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126678 ?auto_126679 ) ) ( not ( = ?auto_126678 ?auto_126680 ) ) ( not ( = ?auto_126678 ?auto_126681 ) ) ( not ( = ?auto_126679 ?auto_126680 ) ) ( not ( = ?auto_126679 ?auto_126681 ) ) ( not ( = ?auto_126680 ?auto_126681 ) ) ( not ( = ?auto_126678 ?auto_126683 ) ) ( not ( = ?auto_126679 ?auto_126683 ) ) ( not ( = ?auto_126680 ?auto_126683 ) ) ( not ( = ?auto_126681 ?auto_126683 ) ) ( not ( = ?auto_126682 ?auto_126685 ) ) ( not ( = ?auto_126682 ?auto_126686 ) ) ( not ( = ?auto_126682 ?auto_126683 ) ) ( not ( = ?auto_126682 ?auto_126681 ) ) ( not ( = ?auto_126682 ?auto_126680 ) ) ( not ( = ?auto_126685 ?auto_126686 ) ) ( not ( = ?auto_126685 ?auto_126683 ) ) ( not ( = ?auto_126685 ?auto_126681 ) ) ( not ( = ?auto_126685 ?auto_126680 ) ) ( not ( = ?auto_126686 ?auto_126683 ) ) ( not ( = ?auto_126686 ?auto_126681 ) ) ( not ( = ?auto_126686 ?auto_126680 ) ) ( not ( = ?auto_126678 ?auto_126682 ) ) ( not ( = ?auto_126678 ?auto_126685 ) ) ( not ( = ?auto_126678 ?auto_126686 ) ) ( not ( = ?auto_126679 ?auto_126682 ) ) ( not ( = ?auto_126679 ?auto_126685 ) ) ( not ( = ?auto_126679 ?auto_126686 ) ) ( ON ?auto_126678 ?auto_126684 ) ( not ( = ?auto_126678 ?auto_126684 ) ) ( not ( = ?auto_126679 ?auto_126684 ) ) ( not ( = ?auto_126680 ?auto_126684 ) ) ( not ( = ?auto_126681 ?auto_126684 ) ) ( not ( = ?auto_126683 ?auto_126684 ) ) ( not ( = ?auto_126682 ?auto_126684 ) ) ( not ( = ?auto_126685 ?auto_126684 ) ) ( not ( = ?auto_126686 ?auto_126684 ) ) ( ON ?auto_126679 ?auto_126678 ) ( ON-TABLE ?auto_126684 ) ( ON ?auto_126680 ?auto_126679 ) ( ON ?auto_126681 ?auto_126680 ) ( ON ?auto_126683 ?auto_126681 ) ( ON ?auto_126686 ?auto_126683 ) ( ON ?auto_126685 ?auto_126686 ) ( CLEAR ?auto_126685 ) ( HOLDING ?auto_126682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126682 )
      ( MAKE-4PILE ?auto_126678 ?auto_126679 ?auto_126680 ?auto_126681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126687 - BLOCK
      ?auto_126688 - BLOCK
      ?auto_126689 - BLOCK
      ?auto_126690 - BLOCK
    )
    :vars
    (
      ?auto_126694 - BLOCK
      ?auto_126693 - BLOCK
      ?auto_126695 - BLOCK
      ?auto_126692 - BLOCK
      ?auto_126691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126687 ?auto_126688 ) ) ( not ( = ?auto_126687 ?auto_126689 ) ) ( not ( = ?auto_126687 ?auto_126690 ) ) ( not ( = ?auto_126688 ?auto_126689 ) ) ( not ( = ?auto_126688 ?auto_126690 ) ) ( not ( = ?auto_126689 ?auto_126690 ) ) ( not ( = ?auto_126687 ?auto_126694 ) ) ( not ( = ?auto_126688 ?auto_126694 ) ) ( not ( = ?auto_126689 ?auto_126694 ) ) ( not ( = ?auto_126690 ?auto_126694 ) ) ( not ( = ?auto_126693 ?auto_126695 ) ) ( not ( = ?auto_126693 ?auto_126692 ) ) ( not ( = ?auto_126693 ?auto_126694 ) ) ( not ( = ?auto_126693 ?auto_126690 ) ) ( not ( = ?auto_126693 ?auto_126689 ) ) ( not ( = ?auto_126695 ?auto_126692 ) ) ( not ( = ?auto_126695 ?auto_126694 ) ) ( not ( = ?auto_126695 ?auto_126690 ) ) ( not ( = ?auto_126695 ?auto_126689 ) ) ( not ( = ?auto_126692 ?auto_126694 ) ) ( not ( = ?auto_126692 ?auto_126690 ) ) ( not ( = ?auto_126692 ?auto_126689 ) ) ( not ( = ?auto_126687 ?auto_126693 ) ) ( not ( = ?auto_126687 ?auto_126695 ) ) ( not ( = ?auto_126687 ?auto_126692 ) ) ( not ( = ?auto_126688 ?auto_126693 ) ) ( not ( = ?auto_126688 ?auto_126695 ) ) ( not ( = ?auto_126688 ?auto_126692 ) ) ( ON ?auto_126687 ?auto_126691 ) ( not ( = ?auto_126687 ?auto_126691 ) ) ( not ( = ?auto_126688 ?auto_126691 ) ) ( not ( = ?auto_126689 ?auto_126691 ) ) ( not ( = ?auto_126690 ?auto_126691 ) ) ( not ( = ?auto_126694 ?auto_126691 ) ) ( not ( = ?auto_126693 ?auto_126691 ) ) ( not ( = ?auto_126695 ?auto_126691 ) ) ( not ( = ?auto_126692 ?auto_126691 ) ) ( ON ?auto_126688 ?auto_126687 ) ( ON-TABLE ?auto_126691 ) ( ON ?auto_126689 ?auto_126688 ) ( ON ?auto_126690 ?auto_126689 ) ( ON ?auto_126694 ?auto_126690 ) ( ON ?auto_126692 ?auto_126694 ) ( ON ?auto_126695 ?auto_126692 ) ( ON ?auto_126693 ?auto_126695 ) ( CLEAR ?auto_126693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_126691 ?auto_126687 ?auto_126688 ?auto_126689 ?auto_126690 ?auto_126694 ?auto_126692 ?auto_126695 )
      ( MAKE-4PILE ?auto_126687 ?auto_126688 ?auto_126689 ?auto_126690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126715 - BLOCK
      ?auto_126716 - BLOCK
      ?auto_126717 - BLOCK
    )
    :vars
    (
      ?auto_126719 - BLOCK
      ?auto_126720 - BLOCK
      ?auto_126718 - BLOCK
      ?auto_126722 - BLOCK
      ?auto_126721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126719 ?auto_126717 ) ( ON-TABLE ?auto_126715 ) ( ON ?auto_126716 ?auto_126715 ) ( ON ?auto_126717 ?auto_126716 ) ( not ( = ?auto_126715 ?auto_126716 ) ) ( not ( = ?auto_126715 ?auto_126717 ) ) ( not ( = ?auto_126715 ?auto_126719 ) ) ( not ( = ?auto_126716 ?auto_126717 ) ) ( not ( = ?auto_126716 ?auto_126719 ) ) ( not ( = ?auto_126717 ?auto_126719 ) ) ( not ( = ?auto_126715 ?auto_126720 ) ) ( not ( = ?auto_126715 ?auto_126718 ) ) ( not ( = ?auto_126716 ?auto_126720 ) ) ( not ( = ?auto_126716 ?auto_126718 ) ) ( not ( = ?auto_126717 ?auto_126720 ) ) ( not ( = ?auto_126717 ?auto_126718 ) ) ( not ( = ?auto_126719 ?auto_126720 ) ) ( not ( = ?auto_126719 ?auto_126718 ) ) ( not ( = ?auto_126720 ?auto_126718 ) ) ( ON ?auto_126720 ?auto_126719 ) ( CLEAR ?auto_126720 ) ( HOLDING ?auto_126718 ) ( CLEAR ?auto_126722 ) ( ON-TABLE ?auto_126721 ) ( ON ?auto_126722 ?auto_126721 ) ( not ( = ?auto_126721 ?auto_126722 ) ) ( not ( = ?auto_126721 ?auto_126718 ) ) ( not ( = ?auto_126722 ?auto_126718 ) ) ( not ( = ?auto_126715 ?auto_126722 ) ) ( not ( = ?auto_126715 ?auto_126721 ) ) ( not ( = ?auto_126716 ?auto_126722 ) ) ( not ( = ?auto_126716 ?auto_126721 ) ) ( not ( = ?auto_126717 ?auto_126722 ) ) ( not ( = ?auto_126717 ?auto_126721 ) ) ( not ( = ?auto_126719 ?auto_126722 ) ) ( not ( = ?auto_126719 ?auto_126721 ) ) ( not ( = ?auto_126720 ?auto_126722 ) ) ( not ( = ?auto_126720 ?auto_126721 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126721 ?auto_126722 ?auto_126718 )
      ( MAKE-3PILE ?auto_126715 ?auto_126716 ?auto_126717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126723 - BLOCK
      ?auto_126724 - BLOCK
      ?auto_126725 - BLOCK
    )
    :vars
    (
      ?auto_126730 - BLOCK
      ?auto_126726 - BLOCK
      ?auto_126729 - BLOCK
      ?auto_126728 - BLOCK
      ?auto_126727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126730 ?auto_126725 ) ( ON-TABLE ?auto_126723 ) ( ON ?auto_126724 ?auto_126723 ) ( ON ?auto_126725 ?auto_126724 ) ( not ( = ?auto_126723 ?auto_126724 ) ) ( not ( = ?auto_126723 ?auto_126725 ) ) ( not ( = ?auto_126723 ?auto_126730 ) ) ( not ( = ?auto_126724 ?auto_126725 ) ) ( not ( = ?auto_126724 ?auto_126730 ) ) ( not ( = ?auto_126725 ?auto_126730 ) ) ( not ( = ?auto_126723 ?auto_126726 ) ) ( not ( = ?auto_126723 ?auto_126729 ) ) ( not ( = ?auto_126724 ?auto_126726 ) ) ( not ( = ?auto_126724 ?auto_126729 ) ) ( not ( = ?auto_126725 ?auto_126726 ) ) ( not ( = ?auto_126725 ?auto_126729 ) ) ( not ( = ?auto_126730 ?auto_126726 ) ) ( not ( = ?auto_126730 ?auto_126729 ) ) ( not ( = ?auto_126726 ?auto_126729 ) ) ( ON ?auto_126726 ?auto_126730 ) ( CLEAR ?auto_126728 ) ( ON-TABLE ?auto_126727 ) ( ON ?auto_126728 ?auto_126727 ) ( not ( = ?auto_126727 ?auto_126728 ) ) ( not ( = ?auto_126727 ?auto_126729 ) ) ( not ( = ?auto_126728 ?auto_126729 ) ) ( not ( = ?auto_126723 ?auto_126728 ) ) ( not ( = ?auto_126723 ?auto_126727 ) ) ( not ( = ?auto_126724 ?auto_126728 ) ) ( not ( = ?auto_126724 ?auto_126727 ) ) ( not ( = ?auto_126725 ?auto_126728 ) ) ( not ( = ?auto_126725 ?auto_126727 ) ) ( not ( = ?auto_126730 ?auto_126728 ) ) ( not ( = ?auto_126730 ?auto_126727 ) ) ( not ( = ?auto_126726 ?auto_126728 ) ) ( not ( = ?auto_126726 ?auto_126727 ) ) ( ON ?auto_126729 ?auto_126726 ) ( CLEAR ?auto_126729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126723 ?auto_126724 ?auto_126725 ?auto_126730 ?auto_126726 )
      ( MAKE-3PILE ?auto_126723 ?auto_126724 ?auto_126725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126731 - BLOCK
      ?auto_126732 - BLOCK
      ?auto_126733 - BLOCK
    )
    :vars
    (
      ?auto_126737 - BLOCK
      ?auto_126736 - BLOCK
      ?auto_126735 - BLOCK
      ?auto_126738 - BLOCK
      ?auto_126734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126737 ?auto_126733 ) ( ON-TABLE ?auto_126731 ) ( ON ?auto_126732 ?auto_126731 ) ( ON ?auto_126733 ?auto_126732 ) ( not ( = ?auto_126731 ?auto_126732 ) ) ( not ( = ?auto_126731 ?auto_126733 ) ) ( not ( = ?auto_126731 ?auto_126737 ) ) ( not ( = ?auto_126732 ?auto_126733 ) ) ( not ( = ?auto_126732 ?auto_126737 ) ) ( not ( = ?auto_126733 ?auto_126737 ) ) ( not ( = ?auto_126731 ?auto_126736 ) ) ( not ( = ?auto_126731 ?auto_126735 ) ) ( not ( = ?auto_126732 ?auto_126736 ) ) ( not ( = ?auto_126732 ?auto_126735 ) ) ( not ( = ?auto_126733 ?auto_126736 ) ) ( not ( = ?auto_126733 ?auto_126735 ) ) ( not ( = ?auto_126737 ?auto_126736 ) ) ( not ( = ?auto_126737 ?auto_126735 ) ) ( not ( = ?auto_126736 ?auto_126735 ) ) ( ON ?auto_126736 ?auto_126737 ) ( ON-TABLE ?auto_126738 ) ( not ( = ?auto_126738 ?auto_126734 ) ) ( not ( = ?auto_126738 ?auto_126735 ) ) ( not ( = ?auto_126734 ?auto_126735 ) ) ( not ( = ?auto_126731 ?auto_126734 ) ) ( not ( = ?auto_126731 ?auto_126738 ) ) ( not ( = ?auto_126732 ?auto_126734 ) ) ( not ( = ?auto_126732 ?auto_126738 ) ) ( not ( = ?auto_126733 ?auto_126734 ) ) ( not ( = ?auto_126733 ?auto_126738 ) ) ( not ( = ?auto_126737 ?auto_126734 ) ) ( not ( = ?auto_126737 ?auto_126738 ) ) ( not ( = ?auto_126736 ?auto_126734 ) ) ( not ( = ?auto_126736 ?auto_126738 ) ) ( ON ?auto_126735 ?auto_126736 ) ( CLEAR ?auto_126735 ) ( HOLDING ?auto_126734 ) ( CLEAR ?auto_126738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126738 ?auto_126734 )
      ( MAKE-3PILE ?auto_126731 ?auto_126732 ?auto_126733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126739 - BLOCK
      ?auto_126740 - BLOCK
      ?auto_126741 - BLOCK
    )
    :vars
    (
      ?auto_126742 - BLOCK
      ?auto_126744 - BLOCK
      ?auto_126745 - BLOCK
      ?auto_126743 - BLOCK
      ?auto_126746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126742 ?auto_126741 ) ( ON-TABLE ?auto_126739 ) ( ON ?auto_126740 ?auto_126739 ) ( ON ?auto_126741 ?auto_126740 ) ( not ( = ?auto_126739 ?auto_126740 ) ) ( not ( = ?auto_126739 ?auto_126741 ) ) ( not ( = ?auto_126739 ?auto_126742 ) ) ( not ( = ?auto_126740 ?auto_126741 ) ) ( not ( = ?auto_126740 ?auto_126742 ) ) ( not ( = ?auto_126741 ?auto_126742 ) ) ( not ( = ?auto_126739 ?auto_126744 ) ) ( not ( = ?auto_126739 ?auto_126745 ) ) ( not ( = ?auto_126740 ?auto_126744 ) ) ( not ( = ?auto_126740 ?auto_126745 ) ) ( not ( = ?auto_126741 ?auto_126744 ) ) ( not ( = ?auto_126741 ?auto_126745 ) ) ( not ( = ?auto_126742 ?auto_126744 ) ) ( not ( = ?auto_126742 ?auto_126745 ) ) ( not ( = ?auto_126744 ?auto_126745 ) ) ( ON ?auto_126744 ?auto_126742 ) ( ON-TABLE ?auto_126743 ) ( not ( = ?auto_126743 ?auto_126746 ) ) ( not ( = ?auto_126743 ?auto_126745 ) ) ( not ( = ?auto_126746 ?auto_126745 ) ) ( not ( = ?auto_126739 ?auto_126746 ) ) ( not ( = ?auto_126739 ?auto_126743 ) ) ( not ( = ?auto_126740 ?auto_126746 ) ) ( not ( = ?auto_126740 ?auto_126743 ) ) ( not ( = ?auto_126741 ?auto_126746 ) ) ( not ( = ?auto_126741 ?auto_126743 ) ) ( not ( = ?auto_126742 ?auto_126746 ) ) ( not ( = ?auto_126742 ?auto_126743 ) ) ( not ( = ?auto_126744 ?auto_126746 ) ) ( not ( = ?auto_126744 ?auto_126743 ) ) ( ON ?auto_126745 ?auto_126744 ) ( CLEAR ?auto_126743 ) ( ON ?auto_126746 ?auto_126745 ) ( CLEAR ?auto_126746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126739 ?auto_126740 ?auto_126741 ?auto_126742 ?auto_126744 ?auto_126745 )
      ( MAKE-3PILE ?auto_126739 ?auto_126740 ?auto_126741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126747 - BLOCK
      ?auto_126748 - BLOCK
      ?auto_126749 - BLOCK
    )
    :vars
    (
      ?auto_126752 - BLOCK
      ?auto_126750 - BLOCK
      ?auto_126754 - BLOCK
      ?auto_126751 - BLOCK
      ?auto_126753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126752 ?auto_126749 ) ( ON-TABLE ?auto_126747 ) ( ON ?auto_126748 ?auto_126747 ) ( ON ?auto_126749 ?auto_126748 ) ( not ( = ?auto_126747 ?auto_126748 ) ) ( not ( = ?auto_126747 ?auto_126749 ) ) ( not ( = ?auto_126747 ?auto_126752 ) ) ( not ( = ?auto_126748 ?auto_126749 ) ) ( not ( = ?auto_126748 ?auto_126752 ) ) ( not ( = ?auto_126749 ?auto_126752 ) ) ( not ( = ?auto_126747 ?auto_126750 ) ) ( not ( = ?auto_126747 ?auto_126754 ) ) ( not ( = ?auto_126748 ?auto_126750 ) ) ( not ( = ?auto_126748 ?auto_126754 ) ) ( not ( = ?auto_126749 ?auto_126750 ) ) ( not ( = ?auto_126749 ?auto_126754 ) ) ( not ( = ?auto_126752 ?auto_126750 ) ) ( not ( = ?auto_126752 ?auto_126754 ) ) ( not ( = ?auto_126750 ?auto_126754 ) ) ( ON ?auto_126750 ?auto_126752 ) ( not ( = ?auto_126751 ?auto_126753 ) ) ( not ( = ?auto_126751 ?auto_126754 ) ) ( not ( = ?auto_126753 ?auto_126754 ) ) ( not ( = ?auto_126747 ?auto_126753 ) ) ( not ( = ?auto_126747 ?auto_126751 ) ) ( not ( = ?auto_126748 ?auto_126753 ) ) ( not ( = ?auto_126748 ?auto_126751 ) ) ( not ( = ?auto_126749 ?auto_126753 ) ) ( not ( = ?auto_126749 ?auto_126751 ) ) ( not ( = ?auto_126752 ?auto_126753 ) ) ( not ( = ?auto_126752 ?auto_126751 ) ) ( not ( = ?auto_126750 ?auto_126753 ) ) ( not ( = ?auto_126750 ?auto_126751 ) ) ( ON ?auto_126754 ?auto_126750 ) ( ON ?auto_126753 ?auto_126754 ) ( CLEAR ?auto_126753 ) ( HOLDING ?auto_126751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126751 )
      ( MAKE-3PILE ?auto_126747 ?auto_126748 ?auto_126749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126766 - BLOCK
      ?auto_126767 - BLOCK
      ?auto_126768 - BLOCK
    )
    :vars
    (
      ?auto_126771 - BLOCK
      ?auto_126773 - BLOCK
      ?auto_126769 - BLOCK
      ?auto_126772 - BLOCK
      ?auto_126770 - BLOCK
      ?auto_126774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126771 ?auto_126768 ) ( ON-TABLE ?auto_126766 ) ( ON ?auto_126767 ?auto_126766 ) ( ON ?auto_126768 ?auto_126767 ) ( not ( = ?auto_126766 ?auto_126767 ) ) ( not ( = ?auto_126766 ?auto_126768 ) ) ( not ( = ?auto_126766 ?auto_126771 ) ) ( not ( = ?auto_126767 ?auto_126768 ) ) ( not ( = ?auto_126767 ?auto_126771 ) ) ( not ( = ?auto_126768 ?auto_126771 ) ) ( not ( = ?auto_126766 ?auto_126773 ) ) ( not ( = ?auto_126766 ?auto_126769 ) ) ( not ( = ?auto_126767 ?auto_126773 ) ) ( not ( = ?auto_126767 ?auto_126769 ) ) ( not ( = ?auto_126768 ?auto_126773 ) ) ( not ( = ?auto_126768 ?auto_126769 ) ) ( not ( = ?auto_126771 ?auto_126773 ) ) ( not ( = ?auto_126771 ?auto_126769 ) ) ( not ( = ?auto_126773 ?auto_126769 ) ) ( ON ?auto_126773 ?auto_126771 ) ( not ( = ?auto_126772 ?auto_126770 ) ) ( not ( = ?auto_126772 ?auto_126769 ) ) ( not ( = ?auto_126770 ?auto_126769 ) ) ( not ( = ?auto_126766 ?auto_126770 ) ) ( not ( = ?auto_126766 ?auto_126772 ) ) ( not ( = ?auto_126767 ?auto_126770 ) ) ( not ( = ?auto_126767 ?auto_126772 ) ) ( not ( = ?auto_126768 ?auto_126770 ) ) ( not ( = ?auto_126768 ?auto_126772 ) ) ( not ( = ?auto_126771 ?auto_126770 ) ) ( not ( = ?auto_126771 ?auto_126772 ) ) ( not ( = ?auto_126773 ?auto_126770 ) ) ( not ( = ?auto_126773 ?auto_126772 ) ) ( ON ?auto_126769 ?auto_126773 ) ( ON ?auto_126770 ?auto_126769 ) ( CLEAR ?auto_126770 ) ( ON ?auto_126772 ?auto_126774 ) ( CLEAR ?auto_126772 ) ( HAND-EMPTY ) ( not ( = ?auto_126766 ?auto_126774 ) ) ( not ( = ?auto_126767 ?auto_126774 ) ) ( not ( = ?auto_126768 ?auto_126774 ) ) ( not ( = ?auto_126771 ?auto_126774 ) ) ( not ( = ?auto_126773 ?auto_126774 ) ) ( not ( = ?auto_126769 ?auto_126774 ) ) ( not ( = ?auto_126772 ?auto_126774 ) ) ( not ( = ?auto_126770 ?auto_126774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126772 ?auto_126774 )
      ( MAKE-3PILE ?auto_126766 ?auto_126767 ?auto_126768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126775 - BLOCK
      ?auto_126776 - BLOCK
      ?auto_126777 - BLOCK
    )
    :vars
    (
      ?auto_126779 - BLOCK
      ?auto_126782 - BLOCK
      ?auto_126783 - BLOCK
      ?auto_126778 - BLOCK
      ?auto_126781 - BLOCK
      ?auto_126780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126779 ?auto_126777 ) ( ON-TABLE ?auto_126775 ) ( ON ?auto_126776 ?auto_126775 ) ( ON ?auto_126777 ?auto_126776 ) ( not ( = ?auto_126775 ?auto_126776 ) ) ( not ( = ?auto_126775 ?auto_126777 ) ) ( not ( = ?auto_126775 ?auto_126779 ) ) ( not ( = ?auto_126776 ?auto_126777 ) ) ( not ( = ?auto_126776 ?auto_126779 ) ) ( not ( = ?auto_126777 ?auto_126779 ) ) ( not ( = ?auto_126775 ?auto_126782 ) ) ( not ( = ?auto_126775 ?auto_126783 ) ) ( not ( = ?auto_126776 ?auto_126782 ) ) ( not ( = ?auto_126776 ?auto_126783 ) ) ( not ( = ?auto_126777 ?auto_126782 ) ) ( not ( = ?auto_126777 ?auto_126783 ) ) ( not ( = ?auto_126779 ?auto_126782 ) ) ( not ( = ?auto_126779 ?auto_126783 ) ) ( not ( = ?auto_126782 ?auto_126783 ) ) ( ON ?auto_126782 ?auto_126779 ) ( not ( = ?auto_126778 ?auto_126781 ) ) ( not ( = ?auto_126778 ?auto_126783 ) ) ( not ( = ?auto_126781 ?auto_126783 ) ) ( not ( = ?auto_126775 ?auto_126781 ) ) ( not ( = ?auto_126775 ?auto_126778 ) ) ( not ( = ?auto_126776 ?auto_126781 ) ) ( not ( = ?auto_126776 ?auto_126778 ) ) ( not ( = ?auto_126777 ?auto_126781 ) ) ( not ( = ?auto_126777 ?auto_126778 ) ) ( not ( = ?auto_126779 ?auto_126781 ) ) ( not ( = ?auto_126779 ?auto_126778 ) ) ( not ( = ?auto_126782 ?auto_126781 ) ) ( not ( = ?auto_126782 ?auto_126778 ) ) ( ON ?auto_126783 ?auto_126782 ) ( ON ?auto_126778 ?auto_126780 ) ( CLEAR ?auto_126778 ) ( not ( = ?auto_126775 ?auto_126780 ) ) ( not ( = ?auto_126776 ?auto_126780 ) ) ( not ( = ?auto_126777 ?auto_126780 ) ) ( not ( = ?auto_126779 ?auto_126780 ) ) ( not ( = ?auto_126782 ?auto_126780 ) ) ( not ( = ?auto_126783 ?auto_126780 ) ) ( not ( = ?auto_126778 ?auto_126780 ) ) ( not ( = ?auto_126781 ?auto_126780 ) ) ( HOLDING ?auto_126781 ) ( CLEAR ?auto_126783 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126775 ?auto_126776 ?auto_126777 ?auto_126779 ?auto_126782 ?auto_126783 ?auto_126781 )
      ( MAKE-3PILE ?auto_126775 ?auto_126776 ?auto_126777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126784 - BLOCK
      ?auto_126785 - BLOCK
      ?auto_126786 - BLOCK
    )
    :vars
    (
      ?auto_126791 - BLOCK
      ?auto_126790 - BLOCK
      ?auto_126788 - BLOCK
      ?auto_126792 - BLOCK
      ?auto_126789 - BLOCK
      ?auto_126787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126791 ?auto_126786 ) ( ON-TABLE ?auto_126784 ) ( ON ?auto_126785 ?auto_126784 ) ( ON ?auto_126786 ?auto_126785 ) ( not ( = ?auto_126784 ?auto_126785 ) ) ( not ( = ?auto_126784 ?auto_126786 ) ) ( not ( = ?auto_126784 ?auto_126791 ) ) ( not ( = ?auto_126785 ?auto_126786 ) ) ( not ( = ?auto_126785 ?auto_126791 ) ) ( not ( = ?auto_126786 ?auto_126791 ) ) ( not ( = ?auto_126784 ?auto_126790 ) ) ( not ( = ?auto_126784 ?auto_126788 ) ) ( not ( = ?auto_126785 ?auto_126790 ) ) ( not ( = ?auto_126785 ?auto_126788 ) ) ( not ( = ?auto_126786 ?auto_126790 ) ) ( not ( = ?auto_126786 ?auto_126788 ) ) ( not ( = ?auto_126791 ?auto_126790 ) ) ( not ( = ?auto_126791 ?auto_126788 ) ) ( not ( = ?auto_126790 ?auto_126788 ) ) ( ON ?auto_126790 ?auto_126791 ) ( not ( = ?auto_126792 ?auto_126789 ) ) ( not ( = ?auto_126792 ?auto_126788 ) ) ( not ( = ?auto_126789 ?auto_126788 ) ) ( not ( = ?auto_126784 ?auto_126789 ) ) ( not ( = ?auto_126784 ?auto_126792 ) ) ( not ( = ?auto_126785 ?auto_126789 ) ) ( not ( = ?auto_126785 ?auto_126792 ) ) ( not ( = ?auto_126786 ?auto_126789 ) ) ( not ( = ?auto_126786 ?auto_126792 ) ) ( not ( = ?auto_126791 ?auto_126789 ) ) ( not ( = ?auto_126791 ?auto_126792 ) ) ( not ( = ?auto_126790 ?auto_126789 ) ) ( not ( = ?auto_126790 ?auto_126792 ) ) ( ON ?auto_126788 ?auto_126790 ) ( ON ?auto_126792 ?auto_126787 ) ( not ( = ?auto_126784 ?auto_126787 ) ) ( not ( = ?auto_126785 ?auto_126787 ) ) ( not ( = ?auto_126786 ?auto_126787 ) ) ( not ( = ?auto_126791 ?auto_126787 ) ) ( not ( = ?auto_126790 ?auto_126787 ) ) ( not ( = ?auto_126788 ?auto_126787 ) ) ( not ( = ?auto_126792 ?auto_126787 ) ) ( not ( = ?auto_126789 ?auto_126787 ) ) ( CLEAR ?auto_126788 ) ( ON ?auto_126789 ?auto_126792 ) ( CLEAR ?auto_126789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126787 ?auto_126792 )
      ( MAKE-3PILE ?auto_126784 ?auto_126785 ?auto_126786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126793 - BLOCK
      ?auto_126794 - BLOCK
      ?auto_126795 - BLOCK
    )
    :vars
    (
      ?auto_126797 - BLOCK
      ?auto_126800 - BLOCK
      ?auto_126799 - BLOCK
      ?auto_126796 - BLOCK
      ?auto_126801 - BLOCK
      ?auto_126798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126797 ?auto_126795 ) ( ON-TABLE ?auto_126793 ) ( ON ?auto_126794 ?auto_126793 ) ( ON ?auto_126795 ?auto_126794 ) ( not ( = ?auto_126793 ?auto_126794 ) ) ( not ( = ?auto_126793 ?auto_126795 ) ) ( not ( = ?auto_126793 ?auto_126797 ) ) ( not ( = ?auto_126794 ?auto_126795 ) ) ( not ( = ?auto_126794 ?auto_126797 ) ) ( not ( = ?auto_126795 ?auto_126797 ) ) ( not ( = ?auto_126793 ?auto_126800 ) ) ( not ( = ?auto_126793 ?auto_126799 ) ) ( not ( = ?auto_126794 ?auto_126800 ) ) ( not ( = ?auto_126794 ?auto_126799 ) ) ( not ( = ?auto_126795 ?auto_126800 ) ) ( not ( = ?auto_126795 ?auto_126799 ) ) ( not ( = ?auto_126797 ?auto_126800 ) ) ( not ( = ?auto_126797 ?auto_126799 ) ) ( not ( = ?auto_126800 ?auto_126799 ) ) ( ON ?auto_126800 ?auto_126797 ) ( not ( = ?auto_126796 ?auto_126801 ) ) ( not ( = ?auto_126796 ?auto_126799 ) ) ( not ( = ?auto_126801 ?auto_126799 ) ) ( not ( = ?auto_126793 ?auto_126801 ) ) ( not ( = ?auto_126793 ?auto_126796 ) ) ( not ( = ?auto_126794 ?auto_126801 ) ) ( not ( = ?auto_126794 ?auto_126796 ) ) ( not ( = ?auto_126795 ?auto_126801 ) ) ( not ( = ?auto_126795 ?auto_126796 ) ) ( not ( = ?auto_126797 ?auto_126801 ) ) ( not ( = ?auto_126797 ?auto_126796 ) ) ( not ( = ?auto_126800 ?auto_126801 ) ) ( not ( = ?auto_126800 ?auto_126796 ) ) ( ON ?auto_126796 ?auto_126798 ) ( not ( = ?auto_126793 ?auto_126798 ) ) ( not ( = ?auto_126794 ?auto_126798 ) ) ( not ( = ?auto_126795 ?auto_126798 ) ) ( not ( = ?auto_126797 ?auto_126798 ) ) ( not ( = ?auto_126800 ?auto_126798 ) ) ( not ( = ?auto_126799 ?auto_126798 ) ) ( not ( = ?auto_126796 ?auto_126798 ) ) ( not ( = ?auto_126801 ?auto_126798 ) ) ( ON ?auto_126801 ?auto_126796 ) ( CLEAR ?auto_126801 ) ( ON-TABLE ?auto_126798 ) ( HOLDING ?auto_126799 ) ( CLEAR ?auto_126800 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126793 ?auto_126794 ?auto_126795 ?auto_126797 ?auto_126800 ?auto_126799 )
      ( MAKE-3PILE ?auto_126793 ?auto_126794 ?auto_126795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126860 - BLOCK
      ?auto_126861 - BLOCK
      ?auto_126862 - BLOCK
      ?auto_126863 - BLOCK
      ?auto_126864 - BLOCK
    )
    :vars
    (
      ?auto_126865 - BLOCK
      ?auto_126867 - BLOCK
      ?auto_126866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126860 ) ( ON ?auto_126861 ?auto_126860 ) ( ON ?auto_126862 ?auto_126861 ) ( not ( = ?auto_126860 ?auto_126861 ) ) ( not ( = ?auto_126860 ?auto_126862 ) ) ( not ( = ?auto_126860 ?auto_126863 ) ) ( not ( = ?auto_126860 ?auto_126864 ) ) ( not ( = ?auto_126861 ?auto_126862 ) ) ( not ( = ?auto_126861 ?auto_126863 ) ) ( not ( = ?auto_126861 ?auto_126864 ) ) ( not ( = ?auto_126862 ?auto_126863 ) ) ( not ( = ?auto_126862 ?auto_126864 ) ) ( not ( = ?auto_126863 ?auto_126864 ) ) ( ON ?auto_126864 ?auto_126865 ) ( not ( = ?auto_126860 ?auto_126865 ) ) ( not ( = ?auto_126861 ?auto_126865 ) ) ( not ( = ?auto_126862 ?auto_126865 ) ) ( not ( = ?auto_126863 ?auto_126865 ) ) ( not ( = ?auto_126864 ?auto_126865 ) ) ( CLEAR ?auto_126862 ) ( ON ?auto_126863 ?auto_126864 ) ( CLEAR ?auto_126863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126867 ) ( ON ?auto_126866 ?auto_126867 ) ( ON ?auto_126865 ?auto_126866 ) ( not ( = ?auto_126867 ?auto_126866 ) ) ( not ( = ?auto_126867 ?auto_126865 ) ) ( not ( = ?auto_126867 ?auto_126864 ) ) ( not ( = ?auto_126867 ?auto_126863 ) ) ( not ( = ?auto_126866 ?auto_126865 ) ) ( not ( = ?auto_126866 ?auto_126864 ) ) ( not ( = ?auto_126866 ?auto_126863 ) ) ( not ( = ?auto_126860 ?auto_126867 ) ) ( not ( = ?auto_126860 ?auto_126866 ) ) ( not ( = ?auto_126861 ?auto_126867 ) ) ( not ( = ?auto_126861 ?auto_126866 ) ) ( not ( = ?auto_126862 ?auto_126867 ) ) ( not ( = ?auto_126862 ?auto_126866 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126867 ?auto_126866 ?auto_126865 ?auto_126864 )
      ( MAKE-5PILE ?auto_126860 ?auto_126861 ?auto_126862 ?auto_126863 ?auto_126864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126868 - BLOCK
      ?auto_126869 - BLOCK
      ?auto_126870 - BLOCK
      ?auto_126871 - BLOCK
      ?auto_126872 - BLOCK
    )
    :vars
    (
      ?auto_126874 - BLOCK
      ?auto_126875 - BLOCK
      ?auto_126873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126868 ) ( ON ?auto_126869 ?auto_126868 ) ( not ( = ?auto_126868 ?auto_126869 ) ) ( not ( = ?auto_126868 ?auto_126870 ) ) ( not ( = ?auto_126868 ?auto_126871 ) ) ( not ( = ?auto_126868 ?auto_126872 ) ) ( not ( = ?auto_126869 ?auto_126870 ) ) ( not ( = ?auto_126869 ?auto_126871 ) ) ( not ( = ?auto_126869 ?auto_126872 ) ) ( not ( = ?auto_126870 ?auto_126871 ) ) ( not ( = ?auto_126870 ?auto_126872 ) ) ( not ( = ?auto_126871 ?auto_126872 ) ) ( ON ?auto_126872 ?auto_126874 ) ( not ( = ?auto_126868 ?auto_126874 ) ) ( not ( = ?auto_126869 ?auto_126874 ) ) ( not ( = ?auto_126870 ?auto_126874 ) ) ( not ( = ?auto_126871 ?auto_126874 ) ) ( not ( = ?auto_126872 ?auto_126874 ) ) ( ON ?auto_126871 ?auto_126872 ) ( CLEAR ?auto_126871 ) ( ON-TABLE ?auto_126875 ) ( ON ?auto_126873 ?auto_126875 ) ( ON ?auto_126874 ?auto_126873 ) ( not ( = ?auto_126875 ?auto_126873 ) ) ( not ( = ?auto_126875 ?auto_126874 ) ) ( not ( = ?auto_126875 ?auto_126872 ) ) ( not ( = ?auto_126875 ?auto_126871 ) ) ( not ( = ?auto_126873 ?auto_126874 ) ) ( not ( = ?auto_126873 ?auto_126872 ) ) ( not ( = ?auto_126873 ?auto_126871 ) ) ( not ( = ?auto_126868 ?auto_126875 ) ) ( not ( = ?auto_126868 ?auto_126873 ) ) ( not ( = ?auto_126869 ?auto_126875 ) ) ( not ( = ?auto_126869 ?auto_126873 ) ) ( not ( = ?auto_126870 ?auto_126875 ) ) ( not ( = ?auto_126870 ?auto_126873 ) ) ( HOLDING ?auto_126870 ) ( CLEAR ?auto_126869 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126868 ?auto_126869 ?auto_126870 )
      ( MAKE-5PILE ?auto_126868 ?auto_126869 ?auto_126870 ?auto_126871 ?auto_126872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126876 - BLOCK
      ?auto_126877 - BLOCK
      ?auto_126878 - BLOCK
      ?auto_126879 - BLOCK
      ?auto_126880 - BLOCK
    )
    :vars
    (
      ?auto_126883 - BLOCK
      ?auto_126882 - BLOCK
      ?auto_126881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126876 ) ( ON ?auto_126877 ?auto_126876 ) ( not ( = ?auto_126876 ?auto_126877 ) ) ( not ( = ?auto_126876 ?auto_126878 ) ) ( not ( = ?auto_126876 ?auto_126879 ) ) ( not ( = ?auto_126876 ?auto_126880 ) ) ( not ( = ?auto_126877 ?auto_126878 ) ) ( not ( = ?auto_126877 ?auto_126879 ) ) ( not ( = ?auto_126877 ?auto_126880 ) ) ( not ( = ?auto_126878 ?auto_126879 ) ) ( not ( = ?auto_126878 ?auto_126880 ) ) ( not ( = ?auto_126879 ?auto_126880 ) ) ( ON ?auto_126880 ?auto_126883 ) ( not ( = ?auto_126876 ?auto_126883 ) ) ( not ( = ?auto_126877 ?auto_126883 ) ) ( not ( = ?auto_126878 ?auto_126883 ) ) ( not ( = ?auto_126879 ?auto_126883 ) ) ( not ( = ?auto_126880 ?auto_126883 ) ) ( ON ?auto_126879 ?auto_126880 ) ( ON-TABLE ?auto_126882 ) ( ON ?auto_126881 ?auto_126882 ) ( ON ?auto_126883 ?auto_126881 ) ( not ( = ?auto_126882 ?auto_126881 ) ) ( not ( = ?auto_126882 ?auto_126883 ) ) ( not ( = ?auto_126882 ?auto_126880 ) ) ( not ( = ?auto_126882 ?auto_126879 ) ) ( not ( = ?auto_126881 ?auto_126883 ) ) ( not ( = ?auto_126881 ?auto_126880 ) ) ( not ( = ?auto_126881 ?auto_126879 ) ) ( not ( = ?auto_126876 ?auto_126882 ) ) ( not ( = ?auto_126876 ?auto_126881 ) ) ( not ( = ?auto_126877 ?auto_126882 ) ) ( not ( = ?auto_126877 ?auto_126881 ) ) ( not ( = ?auto_126878 ?auto_126882 ) ) ( not ( = ?auto_126878 ?auto_126881 ) ) ( CLEAR ?auto_126877 ) ( ON ?auto_126878 ?auto_126879 ) ( CLEAR ?auto_126878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126882 ?auto_126881 ?auto_126883 ?auto_126880 ?auto_126879 )
      ( MAKE-5PILE ?auto_126876 ?auto_126877 ?auto_126878 ?auto_126879 ?auto_126880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126884 - BLOCK
      ?auto_126885 - BLOCK
      ?auto_126886 - BLOCK
      ?auto_126887 - BLOCK
      ?auto_126888 - BLOCK
    )
    :vars
    (
      ?auto_126891 - BLOCK
      ?auto_126890 - BLOCK
      ?auto_126889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126884 ) ( not ( = ?auto_126884 ?auto_126885 ) ) ( not ( = ?auto_126884 ?auto_126886 ) ) ( not ( = ?auto_126884 ?auto_126887 ) ) ( not ( = ?auto_126884 ?auto_126888 ) ) ( not ( = ?auto_126885 ?auto_126886 ) ) ( not ( = ?auto_126885 ?auto_126887 ) ) ( not ( = ?auto_126885 ?auto_126888 ) ) ( not ( = ?auto_126886 ?auto_126887 ) ) ( not ( = ?auto_126886 ?auto_126888 ) ) ( not ( = ?auto_126887 ?auto_126888 ) ) ( ON ?auto_126888 ?auto_126891 ) ( not ( = ?auto_126884 ?auto_126891 ) ) ( not ( = ?auto_126885 ?auto_126891 ) ) ( not ( = ?auto_126886 ?auto_126891 ) ) ( not ( = ?auto_126887 ?auto_126891 ) ) ( not ( = ?auto_126888 ?auto_126891 ) ) ( ON ?auto_126887 ?auto_126888 ) ( ON-TABLE ?auto_126890 ) ( ON ?auto_126889 ?auto_126890 ) ( ON ?auto_126891 ?auto_126889 ) ( not ( = ?auto_126890 ?auto_126889 ) ) ( not ( = ?auto_126890 ?auto_126891 ) ) ( not ( = ?auto_126890 ?auto_126888 ) ) ( not ( = ?auto_126890 ?auto_126887 ) ) ( not ( = ?auto_126889 ?auto_126891 ) ) ( not ( = ?auto_126889 ?auto_126888 ) ) ( not ( = ?auto_126889 ?auto_126887 ) ) ( not ( = ?auto_126884 ?auto_126890 ) ) ( not ( = ?auto_126884 ?auto_126889 ) ) ( not ( = ?auto_126885 ?auto_126890 ) ) ( not ( = ?auto_126885 ?auto_126889 ) ) ( not ( = ?auto_126886 ?auto_126890 ) ) ( not ( = ?auto_126886 ?auto_126889 ) ) ( ON ?auto_126886 ?auto_126887 ) ( CLEAR ?auto_126886 ) ( HOLDING ?auto_126885 ) ( CLEAR ?auto_126884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126884 ?auto_126885 )
      ( MAKE-5PILE ?auto_126884 ?auto_126885 ?auto_126886 ?auto_126887 ?auto_126888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126892 - BLOCK
      ?auto_126893 - BLOCK
      ?auto_126894 - BLOCK
      ?auto_126895 - BLOCK
      ?auto_126896 - BLOCK
    )
    :vars
    (
      ?auto_126897 - BLOCK
      ?auto_126899 - BLOCK
      ?auto_126898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126892 ) ( not ( = ?auto_126892 ?auto_126893 ) ) ( not ( = ?auto_126892 ?auto_126894 ) ) ( not ( = ?auto_126892 ?auto_126895 ) ) ( not ( = ?auto_126892 ?auto_126896 ) ) ( not ( = ?auto_126893 ?auto_126894 ) ) ( not ( = ?auto_126893 ?auto_126895 ) ) ( not ( = ?auto_126893 ?auto_126896 ) ) ( not ( = ?auto_126894 ?auto_126895 ) ) ( not ( = ?auto_126894 ?auto_126896 ) ) ( not ( = ?auto_126895 ?auto_126896 ) ) ( ON ?auto_126896 ?auto_126897 ) ( not ( = ?auto_126892 ?auto_126897 ) ) ( not ( = ?auto_126893 ?auto_126897 ) ) ( not ( = ?auto_126894 ?auto_126897 ) ) ( not ( = ?auto_126895 ?auto_126897 ) ) ( not ( = ?auto_126896 ?auto_126897 ) ) ( ON ?auto_126895 ?auto_126896 ) ( ON-TABLE ?auto_126899 ) ( ON ?auto_126898 ?auto_126899 ) ( ON ?auto_126897 ?auto_126898 ) ( not ( = ?auto_126899 ?auto_126898 ) ) ( not ( = ?auto_126899 ?auto_126897 ) ) ( not ( = ?auto_126899 ?auto_126896 ) ) ( not ( = ?auto_126899 ?auto_126895 ) ) ( not ( = ?auto_126898 ?auto_126897 ) ) ( not ( = ?auto_126898 ?auto_126896 ) ) ( not ( = ?auto_126898 ?auto_126895 ) ) ( not ( = ?auto_126892 ?auto_126899 ) ) ( not ( = ?auto_126892 ?auto_126898 ) ) ( not ( = ?auto_126893 ?auto_126899 ) ) ( not ( = ?auto_126893 ?auto_126898 ) ) ( not ( = ?auto_126894 ?auto_126899 ) ) ( not ( = ?auto_126894 ?auto_126898 ) ) ( ON ?auto_126894 ?auto_126895 ) ( CLEAR ?auto_126892 ) ( ON ?auto_126893 ?auto_126894 ) ( CLEAR ?auto_126893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126899 ?auto_126898 ?auto_126897 ?auto_126896 ?auto_126895 ?auto_126894 )
      ( MAKE-5PILE ?auto_126892 ?auto_126893 ?auto_126894 ?auto_126895 ?auto_126896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126900 - BLOCK
      ?auto_126901 - BLOCK
      ?auto_126902 - BLOCK
      ?auto_126903 - BLOCK
      ?auto_126904 - BLOCK
    )
    :vars
    (
      ?auto_126907 - BLOCK
      ?auto_126905 - BLOCK
      ?auto_126906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126900 ?auto_126901 ) ) ( not ( = ?auto_126900 ?auto_126902 ) ) ( not ( = ?auto_126900 ?auto_126903 ) ) ( not ( = ?auto_126900 ?auto_126904 ) ) ( not ( = ?auto_126901 ?auto_126902 ) ) ( not ( = ?auto_126901 ?auto_126903 ) ) ( not ( = ?auto_126901 ?auto_126904 ) ) ( not ( = ?auto_126902 ?auto_126903 ) ) ( not ( = ?auto_126902 ?auto_126904 ) ) ( not ( = ?auto_126903 ?auto_126904 ) ) ( ON ?auto_126904 ?auto_126907 ) ( not ( = ?auto_126900 ?auto_126907 ) ) ( not ( = ?auto_126901 ?auto_126907 ) ) ( not ( = ?auto_126902 ?auto_126907 ) ) ( not ( = ?auto_126903 ?auto_126907 ) ) ( not ( = ?auto_126904 ?auto_126907 ) ) ( ON ?auto_126903 ?auto_126904 ) ( ON-TABLE ?auto_126905 ) ( ON ?auto_126906 ?auto_126905 ) ( ON ?auto_126907 ?auto_126906 ) ( not ( = ?auto_126905 ?auto_126906 ) ) ( not ( = ?auto_126905 ?auto_126907 ) ) ( not ( = ?auto_126905 ?auto_126904 ) ) ( not ( = ?auto_126905 ?auto_126903 ) ) ( not ( = ?auto_126906 ?auto_126907 ) ) ( not ( = ?auto_126906 ?auto_126904 ) ) ( not ( = ?auto_126906 ?auto_126903 ) ) ( not ( = ?auto_126900 ?auto_126905 ) ) ( not ( = ?auto_126900 ?auto_126906 ) ) ( not ( = ?auto_126901 ?auto_126905 ) ) ( not ( = ?auto_126901 ?auto_126906 ) ) ( not ( = ?auto_126902 ?auto_126905 ) ) ( not ( = ?auto_126902 ?auto_126906 ) ) ( ON ?auto_126902 ?auto_126903 ) ( ON ?auto_126901 ?auto_126902 ) ( CLEAR ?auto_126901 ) ( HOLDING ?auto_126900 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126900 )
      ( MAKE-5PILE ?auto_126900 ?auto_126901 ?auto_126902 ?auto_126903 ?auto_126904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126908 - BLOCK
      ?auto_126909 - BLOCK
      ?auto_126910 - BLOCK
      ?auto_126911 - BLOCK
      ?auto_126912 - BLOCK
    )
    :vars
    (
      ?auto_126915 - BLOCK
      ?auto_126913 - BLOCK
      ?auto_126914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126908 ?auto_126909 ) ) ( not ( = ?auto_126908 ?auto_126910 ) ) ( not ( = ?auto_126908 ?auto_126911 ) ) ( not ( = ?auto_126908 ?auto_126912 ) ) ( not ( = ?auto_126909 ?auto_126910 ) ) ( not ( = ?auto_126909 ?auto_126911 ) ) ( not ( = ?auto_126909 ?auto_126912 ) ) ( not ( = ?auto_126910 ?auto_126911 ) ) ( not ( = ?auto_126910 ?auto_126912 ) ) ( not ( = ?auto_126911 ?auto_126912 ) ) ( ON ?auto_126912 ?auto_126915 ) ( not ( = ?auto_126908 ?auto_126915 ) ) ( not ( = ?auto_126909 ?auto_126915 ) ) ( not ( = ?auto_126910 ?auto_126915 ) ) ( not ( = ?auto_126911 ?auto_126915 ) ) ( not ( = ?auto_126912 ?auto_126915 ) ) ( ON ?auto_126911 ?auto_126912 ) ( ON-TABLE ?auto_126913 ) ( ON ?auto_126914 ?auto_126913 ) ( ON ?auto_126915 ?auto_126914 ) ( not ( = ?auto_126913 ?auto_126914 ) ) ( not ( = ?auto_126913 ?auto_126915 ) ) ( not ( = ?auto_126913 ?auto_126912 ) ) ( not ( = ?auto_126913 ?auto_126911 ) ) ( not ( = ?auto_126914 ?auto_126915 ) ) ( not ( = ?auto_126914 ?auto_126912 ) ) ( not ( = ?auto_126914 ?auto_126911 ) ) ( not ( = ?auto_126908 ?auto_126913 ) ) ( not ( = ?auto_126908 ?auto_126914 ) ) ( not ( = ?auto_126909 ?auto_126913 ) ) ( not ( = ?auto_126909 ?auto_126914 ) ) ( not ( = ?auto_126910 ?auto_126913 ) ) ( not ( = ?auto_126910 ?auto_126914 ) ) ( ON ?auto_126910 ?auto_126911 ) ( ON ?auto_126909 ?auto_126910 ) ( ON ?auto_126908 ?auto_126909 ) ( CLEAR ?auto_126908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126913 ?auto_126914 ?auto_126915 ?auto_126912 ?auto_126911 ?auto_126910 ?auto_126909 )
      ( MAKE-5PILE ?auto_126908 ?auto_126909 ?auto_126910 ?auto_126911 ?auto_126912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126921 - BLOCK
      ?auto_126922 - BLOCK
      ?auto_126923 - BLOCK
      ?auto_126924 - BLOCK
      ?auto_126925 - BLOCK
    )
    :vars
    (
      ?auto_126926 - BLOCK
      ?auto_126927 - BLOCK
      ?auto_126928 - BLOCK
      ?auto_126929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126921 ?auto_126922 ) ) ( not ( = ?auto_126921 ?auto_126923 ) ) ( not ( = ?auto_126921 ?auto_126924 ) ) ( not ( = ?auto_126921 ?auto_126925 ) ) ( not ( = ?auto_126922 ?auto_126923 ) ) ( not ( = ?auto_126922 ?auto_126924 ) ) ( not ( = ?auto_126922 ?auto_126925 ) ) ( not ( = ?auto_126923 ?auto_126924 ) ) ( not ( = ?auto_126923 ?auto_126925 ) ) ( not ( = ?auto_126924 ?auto_126925 ) ) ( ON ?auto_126925 ?auto_126926 ) ( not ( = ?auto_126921 ?auto_126926 ) ) ( not ( = ?auto_126922 ?auto_126926 ) ) ( not ( = ?auto_126923 ?auto_126926 ) ) ( not ( = ?auto_126924 ?auto_126926 ) ) ( not ( = ?auto_126925 ?auto_126926 ) ) ( ON ?auto_126924 ?auto_126925 ) ( ON-TABLE ?auto_126927 ) ( ON ?auto_126928 ?auto_126927 ) ( ON ?auto_126926 ?auto_126928 ) ( not ( = ?auto_126927 ?auto_126928 ) ) ( not ( = ?auto_126927 ?auto_126926 ) ) ( not ( = ?auto_126927 ?auto_126925 ) ) ( not ( = ?auto_126927 ?auto_126924 ) ) ( not ( = ?auto_126928 ?auto_126926 ) ) ( not ( = ?auto_126928 ?auto_126925 ) ) ( not ( = ?auto_126928 ?auto_126924 ) ) ( not ( = ?auto_126921 ?auto_126927 ) ) ( not ( = ?auto_126921 ?auto_126928 ) ) ( not ( = ?auto_126922 ?auto_126927 ) ) ( not ( = ?auto_126922 ?auto_126928 ) ) ( not ( = ?auto_126923 ?auto_126927 ) ) ( not ( = ?auto_126923 ?auto_126928 ) ) ( ON ?auto_126923 ?auto_126924 ) ( ON ?auto_126922 ?auto_126923 ) ( CLEAR ?auto_126922 ) ( ON ?auto_126921 ?auto_126929 ) ( CLEAR ?auto_126921 ) ( HAND-EMPTY ) ( not ( = ?auto_126921 ?auto_126929 ) ) ( not ( = ?auto_126922 ?auto_126929 ) ) ( not ( = ?auto_126923 ?auto_126929 ) ) ( not ( = ?auto_126924 ?auto_126929 ) ) ( not ( = ?auto_126925 ?auto_126929 ) ) ( not ( = ?auto_126926 ?auto_126929 ) ) ( not ( = ?auto_126927 ?auto_126929 ) ) ( not ( = ?auto_126928 ?auto_126929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126921 ?auto_126929 )
      ( MAKE-5PILE ?auto_126921 ?auto_126922 ?auto_126923 ?auto_126924 ?auto_126925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126930 - BLOCK
      ?auto_126931 - BLOCK
      ?auto_126932 - BLOCK
      ?auto_126933 - BLOCK
      ?auto_126934 - BLOCK
    )
    :vars
    (
      ?auto_126937 - BLOCK
      ?auto_126935 - BLOCK
      ?auto_126936 - BLOCK
      ?auto_126938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126930 ?auto_126931 ) ) ( not ( = ?auto_126930 ?auto_126932 ) ) ( not ( = ?auto_126930 ?auto_126933 ) ) ( not ( = ?auto_126930 ?auto_126934 ) ) ( not ( = ?auto_126931 ?auto_126932 ) ) ( not ( = ?auto_126931 ?auto_126933 ) ) ( not ( = ?auto_126931 ?auto_126934 ) ) ( not ( = ?auto_126932 ?auto_126933 ) ) ( not ( = ?auto_126932 ?auto_126934 ) ) ( not ( = ?auto_126933 ?auto_126934 ) ) ( ON ?auto_126934 ?auto_126937 ) ( not ( = ?auto_126930 ?auto_126937 ) ) ( not ( = ?auto_126931 ?auto_126937 ) ) ( not ( = ?auto_126932 ?auto_126937 ) ) ( not ( = ?auto_126933 ?auto_126937 ) ) ( not ( = ?auto_126934 ?auto_126937 ) ) ( ON ?auto_126933 ?auto_126934 ) ( ON-TABLE ?auto_126935 ) ( ON ?auto_126936 ?auto_126935 ) ( ON ?auto_126937 ?auto_126936 ) ( not ( = ?auto_126935 ?auto_126936 ) ) ( not ( = ?auto_126935 ?auto_126937 ) ) ( not ( = ?auto_126935 ?auto_126934 ) ) ( not ( = ?auto_126935 ?auto_126933 ) ) ( not ( = ?auto_126936 ?auto_126937 ) ) ( not ( = ?auto_126936 ?auto_126934 ) ) ( not ( = ?auto_126936 ?auto_126933 ) ) ( not ( = ?auto_126930 ?auto_126935 ) ) ( not ( = ?auto_126930 ?auto_126936 ) ) ( not ( = ?auto_126931 ?auto_126935 ) ) ( not ( = ?auto_126931 ?auto_126936 ) ) ( not ( = ?auto_126932 ?auto_126935 ) ) ( not ( = ?auto_126932 ?auto_126936 ) ) ( ON ?auto_126932 ?auto_126933 ) ( ON ?auto_126930 ?auto_126938 ) ( CLEAR ?auto_126930 ) ( not ( = ?auto_126930 ?auto_126938 ) ) ( not ( = ?auto_126931 ?auto_126938 ) ) ( not ( = ?auto_126932 ?auto_126938 ) ) ( not ( = ?auto_126933 ?auto_126938 ) ) ( not ( = ?auto_126934 ?auto_126938 ) ) ( not ( = ?auto_126937 ?auto_126938 ) ) ( not ( = ?auto_126935 ?auto_126938 ) ) ( not ( = ?auto_126936 ?auto_126938 ) ) ( HOLDING ?auto_126931 ) ( CLEAR ?auto_126932 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126935 ?auto_126936 ?auto_126937 ?auto_126934 ?auto_126933 ?auto_126932 ?auto_126931 )
      ( MAKE-5PILE ?auto_126930 ?auto_126931 ?auto_126932 ?auto_126933 ?auto_126934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126939 - BLOCK
      ?auto_126940 - BLOCK
      ?auto_126941 - BLOCK
      ?auto_126942 - BLOCK
      ?auto_126943 - BLOCK
    )
    :vars
    (
      ?auto_126944 - BLOCK
      ?auto_126945 - BLOCK
      ?auto_126946 - BLOCK
      ?auto_126947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126939 ?auto_126940 ) ) ( not ( = ?auto_126939 ?auto_126941 ) ) ( not ( = ?auto_126939 ?auto_126942 ) ) ( not ( = ?auto_126939 ?auto_126943 ) ) ( not ( = ?auto_126940 ?auto_126941 ) ) ( not ( = ?auto_126940 ?auto_126942 ) ) ( not ( = ?auto_126940 ?auto_126943 ) ) ( not ( = ?auto_126941 ?auto_126942 ) ) ( not ( = ?auto_126941 ?auto_126943 ) ) ( not ( = ?auto_126942 ?auto_126943 ) ) ( ON ?auto_126943 ?auto_126944 ) ( not ( = ?auto_126939 ?auto_126944 ) ) ( not ( = ?auto_126940 ?auto_126944 ) ) ( not ( = ?auto_126941 ?auto_126944 ) ) ( not ( = ?auto_126942 ?auto_126944 ) ) ( not ( = ?auto_126943 ?auto_126944 ) ) ( ON ?auto_126942 ?auto_126943 ) ( ON-TABLE ?auto_126945 ) ( ON ?auto_126946 ?auto_126945 ) ( ON ?auto_126944 ?auto_126946 ) ( not ( = ?auto_126945 ?auto_126946 ) ) ( not ( = ?auto_126945 ?auto_126944 ) ) ( not ( = ?auto_126945 ?auto_126943 ) ) ( not ( = ?auto_126945 ?auto_126942 ) ) ( not ( = ?auto_126946 ?auto_126944 ) ) ( not ( = ?auto_126946 ?auto_126943 ) ) ( not ( = ?auto_126946 ?auto_126942 ) ) ( not ( = ?auto_126939 ?auto_126945 ) ) ( not ( = ?auto_126939 ?auto_126946 ) ) ( not ( = ?auto_126940 ?auto_126945 ) ) ( not ( = ?auto_126940 ?auto_126946 ) ) ( not ( = ?auto_126941 ?auto_126945 ) ) ( not ( = ?auto_126941 ?auto_126946 ) ) ( ON ?auto_126941 ?auto_126942 ) ( ON ?auto_126939 ?auto_126947 ) ( not ( = ?auto_126939 ?auto_126947 ) ) ( not ( = ?auto_126940 ?auto_126947 ) ) ( not ( = ?auto_126941 ?auto_126947 ) ) ( not ( = ?auto_126942 ?auto_126947 ) ) ( not ( = ?auto_126943 ?auto_126947 ) ) ( not ( = ?auto_126944 ?auto_126947 ) ) ( not ( = ?auto_126945 ?auto_126947 ) ) ( not ( = ?auto_126946 ?auto_126947 ) ) ( CLEAR ?auto_126941 ) ( ON ?auto_126940 ?auto_126939 ) ( CLEAR ?auto_126940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126947 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126947 ?auto_126939 )
      ( MAKE-5PILE ?auto_126939 ?auto_126940 ?auto_126941 ?auto_126942 ?auto_126943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126948 - BLOCK
      ?auto_126949 - BLOCK
      ?auto_126950 - BLOCK
      ?auto_126951 - BLOCK
      ?auto_126952 - BLOCK
    )
    :vars
    (
      ?auto_126953 - BLOCK
      ?auto_126956 - BLOCK
      ?auto_126954 - BLOCK
      ?auto_126955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126948 ?auto_126949 ) ) ( not ( = ?auto_126948 ?auto_126950 ) ) ( not ( = ?auto_126948 ?auto_126951 ) ) ( not ( = ?auto_126948 ?auto_126952 ) ) ( not ( = ?auto_126949 ?auto_126950 ) ) ( not ( = ?auto_126949 ?auto_126951 ) ) ( not ( = ?auto_126949 ?auto_126952 ) ) ( not ( = ?auto_126950 ?auto_126951 ) ) ( not ( = ?auto_126950 ?auto_126952 ) ) ( not ( = ?auto_126951 ?auto_126952 ) ) ( ON ?auto_126952 ?auto_126953 ) ( not ( = ?auto_126948 ?auto_126953 ) ) ( not ( = ?auto_126949 ?auto_126953 ) ) ( not ( = ?auto_126950 ?auto_126953 ) ) ( not ( = ?auto_126951 ?auto_126953 ) ) ( not ( = ?auto_126952 ?auto_126953 ) ) ( ON ?auto_126951 ?auto_126952 ) ( ON-TABLE ?auto_126956 ) ( ON ?auto_126954 ?auto_126956 ) ( ON ?auto_126953 ?auto_126954 ) ( not ( = ?auto_126956 ?auto_126954 ) ) ( not ( = ?auto_126956 ?auto_126953 ) ) ( not ( = ?auto_126956 ?auto_126952 ) ) ( not ( = ?auto_126956 ?auto_126951 ) ) ( not ( = ?auto_126954 ?auto_126953 ) ) ( not ( = ?auto_126954 ?auto_126952 ) ) ( not ( = ?auto_126954 ?auto_126951 ) ) ( not ( = ?auto_126948 ?auto_126956 ) ) ( not ( = ?auto_126948 ?auto_126954 ) ) ( not ( = ?auto_126949 ?auto_126956 ) ) ( not ( = ?auto_126949 ?auto_126954 ) ) ( not ( = ?auto_126950 ?auto_126956 ) ) ( not ( = ?auto_126950 ?auto_126954 ) ) ( ON ?auto_126948 ?auto_126955 ) ( not ( = ?auto_126948 ?auto_126955 ) ) ( not ( = ?auto_126949 ?auto_126955 ) ) ( not ( = ?auto_126950 ?auto_126955 ) ) ( not ( = ?auto_126951 ?auto_126955 ) ) ( not ( = ?auto_126952 ?auto_126955 ) ) ( not ( = ?auto_126953 ?auto_126955 ) ) ( not ( = ?auto_126956 ?auto_126955 ) ) ( not ( = ?auto_126954 ?auto_126955 ) ) ( ON ?auto_126949 ?auto_126948 ) ( CLEAR ?auto_126949 ) ( ON-TABLE ?auto_126955 ) ( HOLDING ?auto_126950 ) ( CLEAR ?auto_126951 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126956 ?auto_126954 ?auto_126953 ?auto_126952 ?auto_126951 ?auto_126950 )
      ( MAKE-5PILE ?auto_126948 ?auto_126949 ?auto_126950 ?auto_126951 ?auto_126952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126957 - BLOCK
      ?auto_126958 - BLOCK
      ?auto_126959 - BLOCK
      ?auto_126960 - BLOCK
      ?auto_126961 - BLOCK
    )
    :vars
    (
      ?auto_126964 - BLOCK
      ?auto_126965 - BLOCK
      ?auto_126962 - BLOCK
      ?auto_126963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126957 ?auto_126958 ) ) ( not ( = ?auto_126957 ?auto_126959 ) ) ( not ( = ?auto_126957 ?auto_126960 ) ) ( not ( = ?auto_126957 ?auto_126961 ) ) ( not ( = ?auto_126958 ?auto_126959 ) ) ( not ( = ?auto_126958 ?auto_126960 ) ) ( not ( = ?auto_126958 ?auto_126961 ) ) ( not ( = ?auto_126959 ?auto_126960 ) ) ( not ( = ?auto_126959 ?auto_126961 ) ) ( not ( = ?auto_126960 ?auto_126961 ) ) ( ON ?auto_126961 ?auto_126964 ) ( not ( = ?auto_126957 ?auto_126964 ) ) ( not ( = ?auto_126958 ?auto_126964 ) ) ( not ( = ?auto_126959 ?auto_126964 ) ) ( not ( = ?auto_126960 ?auto_126964 ) ) ( not ( = ?auto_126961 ?auto_126964 ) ) ( ON ?auto_126960 ?auto_126961 ) ( ON-TABLE ?auto_126965 ) ( ON ?auto_126962 ?auto_126965 ) ( ON ?auto_126964 ?auto_126962 ) ( not ( = ?auto_126965 ?auto_126962 ) ) ( not ( = ?auto_126965 ?auto_126964 ) ) ( not ( = ?auto_126965 ?auto_126961 ) ) ( not ( = ?auto_126965 ?auto_126960 ) ) ( not ( = ?auto_126962 ?auto_126964 ) ) ( not ( = ?auto_126962 ?auto_126961 ) ) ( not ( = ?auto_126962 ?auto_126960 ) ) ( not ( = ?auto_126957 ?auto_126965 ) ) ( not ( = ?auto_126957 ?auto_126962 ) ) ( not ( = ?auto_126958 ?auto_126965 ) ) ( not ( = ?auto_126958 ?auto_126962 ) ) ( not ( = ?auto_126959 ?auto_126965 ) ) ( not ( = ?auto_126959 ?auto_126962 ) ) ( ON ?auto_126957 ?auto_126963 ) ( not ( = ?auto_126957 ?auto_126963 ) ) ( not ( = ?auto_126958 ?auto_126963 ) ) ( not ( = ?auto_126959 ?auto_126963 ) ) ( not ( = ?auto_126960 ?auto_126963 ) ) ( not ( = ?auto_126961 ?auto_126963 ) ) ( not ( = ?auto_126964 ?auto_126963 ) ) ( not ( = ?auto_126965 ?auto_126963 ) ) ( not ( = ?auto_126962 ?auto_126963 ) ) ( ON ?auto_126958 ?auto_126957 ) ( ON-TABLE ?auto_126963 ) ( CLEAR ?auto_126960 ) ( ON ?auto_126959 ?auto_126958 ) ( CLEAR ?auto_126959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126963 ?auto_126957 ?auto_126958 )
      ( MAKE-5PILE ?auto_126957 ?auto_126958 ?auto_126959 ?auto_126960 ?auto_126961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126966 - BLOCK
      ?auto_126967 - BLOCK
      ?auto_126968 - BLOCK
      ?auto_126969 - BLOCK
      ?auto_126970 - BLOCK
    )
    :vars
    (
      ?auto_126972 - BLOCK
      ?auto_126971 - BLOCK
      ?auto_126973 - BLOCK
      ?auto_126974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126966 ?auto_126967 ) ) ( not ( = ?auto_126966 ?auto_126968 ) ) ( not ( = ?auto_126966 ?auto_126969 ) ) ( not ( = ?auto_126966 ?auto_126970 ) ) ( not ( = ?auto_126967 ?auto_126968 ) ) ( not ( = ?auto_126967 ?auto_126969 ) ) ( not ( = ?auto_126967 ?auto_126970 ) ) ( not ( = ?auto_126968 ?auto_126969 ) ) ( not ( = ?auto_126968 ?auto_126970 ) ) ( not ( = ?auto_126969 ?auto_126970 ) ) ( ON ?auto_126970 ?auto_126972 ) ( not ( = ?auto_126966 ?auto_126972 ) ) ( not ( = ?auto_126967 ?auto_126972 ) ) ( not ( = ?auto_126968 ?auto_126972 ) ) ( not ( = ?auto_126969 ?auto_126972 ) ) ( not ( = ?auto_126970 ?auto_126972 ) ) ( ON-TABLE ?auto_126971 ) ( ON ?auto_126973 ?auto_126971 ) ( ON ?auto_126972 ?auto_126973 ) ( not ( = ?auto_126971 ?auto_126973 ) ) ( not ( = ?auto_126971 ?auto_126972 ) ) ( not ( = ?auto_126971 ?auto_126970 ) ) ( not ( = ?auto_126971 ?auto_126969 ) ) ( not ( = ?auto_126973 ?auto_126972 ) ) ( not ( = ?auto_126973 ?auto_126970 ) ) ( not ( = ?auto_126973 ?auto_126969 ) ) ( not ( = ?auto_126966 ?auto_126971 ) ) ( not ( = ?auto_126966 ?auto_126973 ) ) ( not ( = ?auto_126967 ?auto_126971 ) ) ( not ( = ?auto_126967 ?auto_126973 ) ) ( not ( = ?auto_126968 ?auto_126971 ) ) ( not ( = ?auto_126968 ?auto_126973 ) ) ( ON ?auto_126966 ?auto_126974 ) ( not ( = ?auto_126966 ?auto_126974 ) ) ( not ( = ?auto_126967 ?auto_126974 ) ) ( not ( = ?auto_126968 ?auto_126974 ) ) ( not ( = ?auto_126969 ?auto_126974 ) ) ( not ( = ?auto_126970 ?auto_126974 ) ) ( not ( = ?auto_126972 ?auto_126974 ) ) ( not ( = ?auto_126971 ?auto_126974 ) ) ( not ( = ?auto_126973 ?auto_126974 ) ) ( ON ?auto_126967 ?auto_126966 ) ( ON-TABLE ?auto_126974 ) ( ON ?auto_126968 ?auto_126967 ) ( CLEAR ?auto_126968 ) ( HOLDING ?auto_126969 ) ( CLEAR ?auto_126970 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126971 ?auto_126973 ?auto_126972 ?auto_126970 ?auto_126969 )
      ( MAKE-5PILE ?auto_126966 ?auto_126967 ?auto_126968 ?auto_126969 ?auto_126970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126975 - BLOCK
      ?auto_126976 - BLOCK
      ?auto_126977 - BLOCK
      ?auto_126978 - BLOCK
      ?auto_126979 - BLOCK
    )
    :vars
    (
      ?auto_126982 - BLOCK
      ?auto_126980 - BLOCK
      ?auto_126981 - BLOCK
      ?auto_126983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126975 ?auto_126976 ) ) ( not ( = ?auto_126975 ?auto_126977 ) ) ( not ( = ?auto_126975 ?auto_126978 ) ) ( not ( = ?auto_126975 ?auto_126979 ) ) ( not ( = ?auto_126976 ?auto_126977 ) ) ( not ( = ?auto_126976 ?auto_126978 ) ) ( not ( = ?auto_126976 ?auto_126979 ) ) ( not ( = ?auto_126977 ?auto_126978 ) ) ( not ( = ?auto_126977 ?auto_126979 ) ) ( not ( = ?auto_126978 ?auto_126979 ) ) ( ON ?auto_126979 ?auto_126982 ) ( not ( = ?auto_126975 ?auto_126982 ) ) ( not ( = ?auto_126976 ?auto_126982 ) ) ( not ( = ?auto_126977 ?auto_126982 ) ) ( not ( = ?auto_126978 ?auto_126982 ) ) ( not ( = ?auto_126979 ?auto_126982 ) ) ( ON-TABLE ?auto_126980 ) ( ON ?auto_126981 ?auto_126980 ) ( ON ?auto_126982 ?auto_126981 ) ( not ( = ?auto_126980 ?auto_126981 ) ) ( not ( = ?auto_126980 ?auto_126982 ) ) ( not ( = ?auto_126980 ?auto_126979 ) ) ( not ( = ?auto_126980 ?auto_126978 ) ) ( not ( = ?auto_126981 ?auto_126982 ) ) ( not ( = ?auto_126981 ?auto_126979 ) ) ( not ( = ?auto_126981 ?auto_126978 ) ) ( not ( = ?auto_126975 ?auto_126980 ) ) ( not ( = ?auto_126975 ?auto_126981 ) ) ( not ( = ?auto_126976 ?auto_126980 ) ) ( not ( = ?auto_126976 ?auto_126981 ) ) ( not ( = ?auto_126977 ?auto_126980 ) ) ( not ( = ?auto_126977 ?auto_126981 ) ) ( ON ?auto_126975 ?auto_126983 ) ( not ( = ?auto_126975 ?auto_126983 ) ) ( not ( = ?auto_126976 ?auto_126983 ) ) ( not ( = ?auto_126977 ?auto_126983 ) ) ( not ( = ?auto_126978 ?auto_126983 ) ) ( not ( = ?auto_126979 ?auto_126983 ) ) ( not ( = ?auto_126982 ?auto_126983 ) ) ( not ( = ?auto_126980 ?auto_126983 ) ) ( not ( = ?auto_126981 ?auto_126983 ) ) ( ON ?auto_126976 ?auto_126975 ) ( ON-TABLE ?auto_126983 ) ( ON ?auto_126977 ?auto_126976 ) ( CLEAR ?auto_126979 ) ( ON ?auto_126978 ?auto_126977 ) ( CLEAR ?auto_126978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126983 ?auto_126975 ?auto_126976 ?auto_126977 )
      ( MAKE-5PILE ?auto_126975 ?auto_126976 ?auto_126977 ?auto_126978 ?auto_126979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126984 - BLOCK
      ?auto_126985 - BLOCK
      ?auto_126986 - BLOCK
      ?auto_126987 - BLOCK
      ?auto_126988 - BLOCK
    )
    :vars
    (
      ?auto_126991 - BLOCK
      ?auto_126989 - BLOCK
      ?auto_126990 - BLOCK
      ?auto_126992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126984 ?auto_126985 ) ) ( not ( = ?auto_126984 ?auto_126986 ) ) ( not ( = ?auto_126984 ?auto_126987 ) ) ( not ( = ?auto_126984 ?auto_126988 ) ) ( not ( = ?auto_126985 ?auto_126986 ) ) ( not ( = ?auto_126985 ?auto_126987 ) ) ( not ( = ?auto_126985 ?auto_126988 ) ) ( not ( = ?auto_126986 ?auto_126987 ) ) ( not ( = ?auto_126986 ?auto_126988 ) ) ( not ( = ?auto_126987 ?auto_126988 ) ) ( not ( = ?auto_126984 ?auto_126991 ) ) ( not ( = ?auto_126985 ?auto_126991 ) ) ( not ( = ?auto_126986 ?auto_126991 ) ) ( not ( = ?auto_126987 ?auto_126991 ) ) ( not ( = ?auto_126988 ?auto_126991 ) ) ( ON-TABLE ?auto_126989 ) ( ON ?auto_126990 ?auto_126989 ) ( ON ?auto_126991 ?auto_126990 ) ( not ( = ?auto_126989 ?auto_126990 ) ) ( not ( = ?auto_126989 ?auto_126991 ) ) ( not ( = ?auto_126989 ?auto_126988 ) ) ( not ( = ?auto_126989 ?auto_126987 ) ) ( not ( = ?auto_126990 ?auto_126991 ) ) ( not ( = ?auto_126990 ?auto_126988 ) ) ( not ( = ?auto_126990 ?auto_126987 ) ) ( not ( = ?auto_126984 ?auto_126989 ) ) ( not ( = ?auto_126984 ?auto_126990 ) ) ( not ( = ?auto_126985 ?auto_126989 ) ) ( not ( = ?auto_126985 ?auto_126990 ) ) ( not ( = ?auto_126986 ?auto_126989 ) ) ( not ( = ?auto_126986 ?auto_126990 ) ) ( ON ?auto_126984 ?auto_126992 ) ( not ( = ?auto_126984 ?auto_126992 ) ) ( not ( = ?auto_126985 ?auto_126992 ) ) ( not ( = ?auto_126986 ?auto_126992 ) ) ( not ( = ?auto_126987 ?auto_126992 ) ) ( not ( = ?auto_126988 ?auto_126992 ) ) ( not ( = ?auto_126991 ?auto_126992 ) ) ( not ( = ?auto_126989 ?auto_126992 ) ) ( not ( = ?auto_126990 ?auto_126992 ) ) ( ON ?auto_126985 ?auto_126984 ) ( ON-TABLE ?auto_126992 ) ( ON ?auto_126986 ?auto_126985 ) ( ON ?auto_126987 ?auto_126986 ) ( CLEAR ?auto_126987 ) ( HOLDING ?auto_126988 ) ( CLEAR ?auto_126991 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126989 ?auto_126990 ?auto_126991 ?auto_126988 )
      ( MAKE-5PILE ?auto_126984 ?auto_126985 ?auto_126986 ?auto_126987 ?auto_126988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126993 - BLOCK
      ?auto_126994 - BLOCK
      ?auto_126995 - BLOCK
      ?auto_126996 - BLOCK
      ?auto_126997 - BLOCK
    )
    :vars
    (
      ?auto_127000 - BLOCK
      ?auto_127001 - BLOCK
      ?auto_126999 - BLOCK
      ?auto_126998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126993 ?auto_126994 ) ) ( not ( = ?auto_126993 ?auto_126995 ) ) ( not ( = ?auto_126993 ?auto_126996 ) ) ( not ( = ?auto_126993 ?auto_126997 ) ) ( not ( = ?auto_126994 ?auto_126995 ) ) ( not ( = ?auto_126994 ?auto_126996 ) ) ( not ( = ?auto_126994 ?auto_126997 ) ) ( not ( = ?auto_126995 ?auto_126996 ) ) ( not ( = ?auto_126995 ?auto_126997 ) ) ( not ( = ?auto_126996 ?auto_126997 ) ) ( not ( = ?auto_126993 ?auto_127000 ) ) ( not ( = ?auto_126994 ?auto_127000 ) ) ( not ( = ?auto_126995 ?auto_127000 ) ) ( not ( = ?auto_126996 ?auto_127000 ) ) ( not ( = ?auto_126997 ?auto_127000 ) ) ( ON-TABLE ?auto_127001 ) ( ON ?auto_126999 ?auto_127001 ) ( ON ?auto_127000 ?auto_126999 ) ( not ( = ?auto_127001 ?auto_126999 ) ) ( not ( = ?auto_127001 ?auto_127000 ) ) ( not ( = ?auto_127001 ?auto_126997 ) ) ( not ( = ?auto_127001 ?auto_126996 ) ) ( not ( = ?auto_126999 ?auto_127000 ) ) ( not ( = ?auto_126999 ?auto_126997 ) ) ( not ( = ?auto_126999 ?auto_126996 ) ) ( not ( = ?auto_126993 ?auto_127001 ) ) ( not ( = ?auto_126993 ?auto_126999 ) ) ( not ( = ?auto_126994 ?auto_127001 ) ) ( not ( = ?auto_126994 ?auto_126999 ) ) ( not ( = ?auto_126995 ?auto_127001 ) ) ( not ( = ?auto_126995 ?auto_126999 ) ) ( ON ?auto_126993 ?auto_126998 ) ( not ( = ?auto_126993 ?auto_126998 ) ) ( not ( = ?auto_126994 ?auto_126998 ) ) ( not ( = ?auto_126995 ?auto_126998 ) ) ( not ( = ?auto_126996 ?auto_126998 ) ) ( not ( = ?auto_126997 ?auto_126998 ) ) ( not ( = ?auto_127000 ?auto_126998 ) ) ( not ( = ?auto_127001 ?auto_126998 ) ) ( not ( = ?auto_126999 ?auto_126998 ) ) ( ON ?auto_126994 ?auto_126993 ) ( ON-TABLE ?auto_126998 ) ( ON ?auto_126995 ?auto_126994 ) ( ON ?auto_126996 ?auto_126995 ) ( CLEAR ?auto_127000 ) ( ON ?auto_126997 ?auto_126996 ) ( CLEAR ?auto_126997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126998 ?auto_126993 ?auto_126994 ?auto_126995 ?auto_126996 )
      ( MAKE-5PILE ?auto_126993 ?auto_126994 ?auto_126995 ?auto_126996 ?auto_126997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127002 - BLOCK
      ?auto_127003 - BLOCK
      ?auto_127004 - BLOCK
      ?auto_127005 - BLOCK
      ?auto_127006 - BLOCK
    )
    :vars
    (
      ?auto_127009 - BLOCK
      ?auto_127008 - BLOCK
      ?auto_127010 - BLOCK
      ?auto_127007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127002 ?auto_127003 ) ) ( not ( = ?auto_127002 ?auto_127004 ) ) ( not ( = ?auto_127002 ?auto_127005 ) ) ( not ( = ?auto_127002 ?auto_127006 ) ) ( not ( = ?auto_127003 ?auto_127004 ) ) ( not ( = ?auto_127003 ?auto_127005 ) ) ( not ( = ?auto_127003 ?auto_127006 ) ) ( not ( = ?auto_127004 ?auto_127005 ) ) ( not ( = ?auto_127004 ?auto_127006 ) ) ( not ( = ?auto_127005 ?auto_127006 ) ) ( not ( = ?auto_127002 ?auto_127009 ) ) ( not ( = ?auto_127003 ?auto_127009 ) ) ( not ( = ?auto_127004 ?auto_127009 ) ) ( not ( = ?auto_127005 ?auto_127009 ) ) ( not ( = ?auto_127006 ?auto_127009 ) ) ( ON-TABLE ?auto_127008 ) ( ON ?auto_127010 ?auto_127008 ) ( not ( = ?auto_127008 ?auto_127010 ) ) ( not ( = ?auto_127008 ?auto_127009 ) ) ( not ( = ?auto_127008 ?auto_127006 ) ) ( not ( = ?auto_127008 ?auto_127005 ) ) ( not ( = ?auto_127010 ?auto_127009 ) ) ( not ( = ?auto_127010 ?auto_127006 ) ) ( not ( = ?auto_127010 ?auto_127005 ) ) ( not ( = ?auto_127002 ?auto_127008 ) ) ( not ( = ?auto_127002 ?auto_127010 ) ) ( not ( = ?auto_127003 ?auto_127008 ) ) ( not ( = ?auto_127003 ?auto_127010 ) ) ( not ( = ?auto_127004 ?auto_127008 ) ) ( not ( = ?auto_127004 ?auto_127010 ) ) ( ON ?auto_127002 ?auto_127007 ) ( not ( = ?auto_127002 ?auto_127007 ) ) ( not ( = ?auto_127003 ?auto_127007 ) ) ( not ( = ?auto_127004 ?auto_127007 ) ) ( not ( = ?auto_127005 ?auto_127007 ) ) ( not ( = ?auto_127006 ?auto_127007 ) ) ( not ( = ?auto_127009 ?auto_127007 ) ) ( not ( = ?auto_127008 ?auto_127007 ) ) ( not ( = ?auto_127010 ?auto_127007 ) ) ( ON ?auto_127003 ?auto_127002 ) ( ON-TABLE ?auto_127007 ) ( ON ?auto_127004 ?auto_127003 ) ( ON ?auto_127005 ?auto_127004 ) ( ON ?auto_127006 ?auto_127005 ) ( CLEAR ?auto_127006 ) ( HOLDING ?auto_127009 ) ( CLEAR ?auto_127010 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127008 ?auto_127010 ?auto_127009 )
      ( MAKE-5PILE ?auto_127002 ?auto_127003 ?auto_127004 ?auto_127005 ?auto_127006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127011 - BLOCK
      ?auto_127012 - BLOCK
      ?auto_127013 - BLOCK
      ?auto_127014 - BLOCK
      ?auto_127015 - BLOCK
    )
    :vars
    (
      ?auto_127016 - BLOCK
      ?auto_127019 - BLOCK
      ?auto_127018 - BLOCK
      ?auto_127017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127011 ?auto_127012 ) ) ( not ( = ?auto_127011 ?auto_127013 ) ) ( not ( = ?auto_127011 ?auto_127014 ) ) ( not ( = ?auto_127011 ?auto_127015 ) ) ( not ( = ?auto_127012 ?auto_127013 ) ) ( not ( = ?auto_127012 ?auto_127014 ) ) ( not ( = ?auto_127012 ?auto_127015 ) ) ( not ( = ?auto_127013 ?auto_127014 ) ) ( not ( = ?auto_127013 ?auto_127015 ) ) ( not ( = ?auto_127014 ?auto_127015 ) ) ( not ( = ?auto_127011 ?auto_127016 ) ) ( not ( = ?auto_127012 ?auto_127016 ) ) ( not ( = ?auto_127013 ?auto_127016 ) ) ( not ( = ?auto_127014 ?auto_127016 ) ) ( not ( = ?auto_127015 ?auto_127016 ) ) ( ON-TABLE ?auto_127019 ) ( ON ?auto_127018 ?auto_127019 ) ( not ( = ?auto_127019 ?auto_127018 ) ) ( not ( = ?auto_127019 ?auto_127016 ) ) ( not ( = ?auto_127019 ?auto_127015 ) ) ( not ( = ?auto_127019 ?auto_127014 ) ) ( not ( = ?auto_127018 ?auto_127016 ) ) ( not ( = ?auto_127018 ?auto_127015 ) ) ( not ( = ?auto_127018 ?auto_127014 ) ) ( not ( = ?auto_127011 ?auto_127019 ) ) ( not ( = ?auto_127011 ?auto_127018 ) ) ( not ( = ?auto_127012 ?auto_127019 ) ) ( not ( = ?auto_127012 ?auto_127018 ) ) ( not ( = ?auto_127013 ?auto_127019 ) ) ( not ( = ?auto_127013 ?auto_127018 ) ) ( ON ?auto_127011 ?auto_127017 ) ( not ( = ?auto_127011 ?auto_127017 ) ) ( not ( = ?auto_127012 ?auto_127017 ) ) ( not ( = ?auto_127013 ?auto_127017 ) ) ( not ( = ?auto_127014 ?auto_127017 ) ) ( not ( = ?auto_127015 ?auto_127017 ) ) ( not ( = ?auto_127016 ?auto_127017 ) ) ( not ( = ?auto_127019 ?auto_127017 ) ) ( not ( = ?auto_127018 ?auto_127017 ) ) ( ON ?auto_127012 ?auto_127011 ) ( ON-TABLE ?auto_127017 ) ( ON ?auto_127013 ?auto_127012 ) ( ON ?auto_127014 ?auto_127013 ) ( ON ?auto_127015 ?auto_127014 ) ( CLEAR ?auto_127018 ) ( ON ?auto_127016 ?auto_127015 ) ( CLEAR ?auto_127016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127017 ?auto_127011 ?auto_127012 ?auto_127013 ?auto_127014 ?auto_127015 )
      ( MAKE-5PILE ?auto_127011 ?auto_127012 ?auto_127013 ?auto_127014 ?auto_127015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127020 - BLOCK
      ?auto_127021 - BLOCK
      ?auto_127022 - BLOCK
      ?auto_127023 - BLOCK
      ?auto_127024 - BLOCK
    )
    :vars
    (
      ?auto_127026 - BLOCK
      ?auto_127027 - BLOCK
      ?auto_127028 - BLOCK
      ?auto_127025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127020 ?auto_127021 ) ) ( not ( = ?auto_127020 ?auto_127022 ) ) ( not ( = ?auto_127020 ?auto_127023 ) ) ( not ( = ?auto_127020 ?auto_127024 ) ) ( not ( = ?auto_127021 ?auto_127022 ) ) ( not ( = ?auto_127021 ?auto_127023 ) ) ( not ( = ?auto_127021 ?auto_127024 ) ) ( not ( = ?auto_127022 ?auto_127023 ) ) ( not ( = ?auto_127022 ?auto_127024 ) ) ( not ( = ?auto_127023 ?auto_127024 ) ) ( not ( = ?auto_127020 ?auto_127026 ) ) ( not ( = ?auto_127021 ?auto_127026 ) ) ( not ( = ?auto_127022 ?auto_127026 ) ) ( not ( = ?auto_127023 ?auto_127026 ) ) ( not ( = ?auto_127024 ?auto_127026 ) ) ( ON-TABLE ?auto_127027 ) ( not ( = ?auto_127027 ?auto_127028 ) ) ( not ( = ?auto_127027 ?auto_127026 ) ) ( not ( = ?auto_127027 ?auto_127024 ) ) ( not ( = ?auto_127027 ?auto_127023 ) ) ( not ( = ?auto_127028 ?auto_127026 ) ) ( not ( = ?auto_127028 ?auto_127024 ) ) ( not ( = ?auto_127028 ?auto_127023 ) ) ( not ( = ?auto_127020 ?auto_127027 ) ) ( not ( = ?auto_127020 ?auto_127028 ) ) ( not ( = ?auto_127021 ?auto_127027 ) ) ( not ( = ?auto_127021 ?auto_127028 ) ) ( not ( = ?auto_127022 ?auto_127027 ) ) ( not ( = ?auto_127022 ?auto_127028 ) ) ( ON ?auto_127020 ?auto_127025 ) ( not ( = ?auto_127020 ?auto_127025 ) ) ( not ( = ?auto_127021 ?auto_127025 ) ) ( not ( = ?auto_127022 ?auto_127025 ) ) ( not ( = ?auto_127023 ?auto_127025 ) ) ( not ( = ?auto_127024 ?auto_127025 ) ) ( not ( = ?auto_127026 ?auto_127025 ) ) ( not ( = ?auto_127027 ?auto_127025 ) ) ( not ( = ?auto_127028 ?auto_127025 ) ) ( ON ?auto_127021 ?auto_127020 ) ( ON-TABLE ?auto_127025 ) ( ON ?auto_127022 ?auto_127021 ) ( ON ?auto_127023 ?auto_127022 ) ( ON ?auto_127024 ?auto_127023 ) ( ON ?auto_127026 ?auto_127024 ) ( CLEAR ?auto_127026 ) ( HOLDING ?auto_127028 ) ( CLEAR ?auto_127027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127027 ?auto_127028 )
      ( MAKE-5PILE ?auto_127020 ?auto_127021 ?auto_127022 ?auto_127023 ?auto_127024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127029 - BLOCK
      ?auto_127030 - BLOCK
      ?auto_127031 - BLOCK
      ?auto_127032 - BLOCK
      ?auto_127033 - BLOCK
    )
    :vars
    (
      ?auto_127037 - BLOCK
      ?auto_127034 - BLOCK
      ?auto_127035 - BLOCK
      ?auto_127036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127029 ?auto_127030 ) ) ( not ( = ?auto_127029 ?auto_127031 ) ) ( not ( = ?auto_127029 ?auto_127032 ) ) ( not ( = ?auto_127029 ?auto_127033 ) ) ( not ( = ?auto_127030 ?auto_127031 ) ) ( not ( = ?auto_127030 ?auto_127032 ) ) ( not ( = ?auto_127030 ?auto_127033 ) ) ( not ( = ?auto_127031 ?auto_127032 ) ) ( not ( = ?auto_127031 ?auto_127033 ) ) ( not ( = ?auto_127032 ?auto_127033 ) ) ( not ( = ?auto_127029 ?auto_127037 ) ) ( not ( = ?auto_127030 ?auto_127037 ) ) ( not ( = ?auto_127031 ?auto_127037 ) ) ( not ( = ?auto_127032 ?auto_127037 ) ) ( not ( = ?auto_127033 ?auto_127037 ) ) ( ON-TABLE ?auto_127034 ) ( not ( = ?auto_127034 ?auto_127035 ) ) ( not ( = ?auto_127034 ?auto_127037 ) ) ( not ( = ?auto_127034 ?auto_127033 ) ) ( not ( = ?auto_127034 ?auto_127032 ) ) ( not ( = ?auto_127035 ?auto_127037 ) ) ( not ( = ?auto_127035 ?auto_127033 ) ) ( not ( = ?auto_127035 ?auto_127032 ) ) ( not ( = ?auto_127029 ?auto_127034 ) ) ( not ( = ?auto_127029 ?auto_127035 ) ) ( not ( = ?auto_127030 ?auto_127034 ) ) ( not ( = ?auto_127030 ?auto_127035 ) ) ( not ( = ?auto_127031 ?auto_127034 ) ) ( not ( = ?auto_127031 ?auto_127035 ) ) ( ON ?auto_127029 ?auto_127036 ) ( not ( = ?auto_127029 ?auto_127036 ) ) ( not ( = ?auto_127030 ?auto_127036 ) ) ( not ( = ?auto_127031 ?auto_127036 ) ) ( not ( = ?auto_127032 ?auto_127036 ) ) ( not ( = ?auto_127033 ?auto_127036 ) ) ( not ( = ?auto_127037 ?auto_127036 ) ) ( not ( = ?auto_127034 ?auto_127036 ) ) ( not ( = ?auto_127035 ?auto_127036 ) ) ( ON ?auto_127030 ?auto_127029 ) ( ON-TABLE ?auto_127036 ) ( ON ?auto_127031 ?auto_127030 ) ( ON ?auto_127032 ?auto_127031 ) ( ON ?auto_127033 ?auto_127032 ) ( ON ?auto_127037 ?auto_127033 ) ( CLEAR ?auto_127034 ) ( ON ?auto_127035 ?auto_127037 ) ( CLEAR ?auto_127035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127036 ?auto_127029 ?auto_127030 ?auto_127031 ?auto_127032 ?auto_127033 ?auto_127037 )
      ( MAKE-5PILE ?auto_127029 ?auto_127030 ?auto_127031 ?auto_127032 ?auto_127033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127038 - BLOCK
      ?auto_127039 - BLOCK
      ?auto_127040 - BLOCK
      ?auto_127041 - BLOCK
      ?auto_127042 - BLOCK
    )
    :vars
    (
      ?auto_127045 - BLOCK
      ?auto_127046 - BLOCK
      ?auto_127044 - BLOCK
      ?auto_127043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127038 ?auto_127039 ) ) ( not ( = ?auto_127038 ?auto_127040 ) ) ( not ( = ?auto_127038 ?auto_127041 ) ) ( not ( = ?auto_127038 ?auto_127042 ) ) ( not ( = ?auto_127039 ?auto_127040 ) ) ( not ( = ?auto_127039 ?auto_127041 ) ) ( not ( = ?auto_127039 ?auto_127042 ) ) ( not ( = ?auto_127040 ?auto_127041 ) ) ( not ( = ?auto_127040 ?auto_127042 ) ) ( not ( = ?auto_127041 ?auto_127042 ) ) ( not ( = ?auto_127038 ?auto_127045 ) ) ( not ( = ?auto_127039 ?auto_127045 ) ) ( not ( = ?auto_127040 ?auto_127045 ) ) ( not ( = ?auto_127041 ?auto_127045 ) ) ( not ( = ?auto_127042 ?auto_127045 ) ) ( not ( = ?auto_127046 ?auto_127044 ) ) ( not ( = ?auto_127046 ?auto_127045 ) ) ( not ( = ?auto_127046 ?auto_127042 ) ) ( not ( = ?auto_127046 ?auto_127041 ) ) ( not ( = ?auto_127044 ?auto_127045 ) ) ( not ( = ?auto_127044 ?auto_127042 ) ) ( not ( = ?auto_127044 ?auto_127041 ) ) ( not ( = ?auto_127038 ?auto_127046 ) ) ( not ( = ?auto_127038 ?auto_127044 ) ) ( not ( = ?auto_127039 ?auto_127046 ) ) ( not ( = ?auto_127039 ?auto_127044 ) ) ( not ( = ?auto_127040 ?auto_127046 ) ) ( not ( = ?auto_127040 ?auto_127044 ) ) ( ON ?auto_127038 ?auto_127043 ) ( not ( = ?auto_127038 ?auto_127043 ) ) ( not ( = ?auto_127039 ?auto_127043 ) ) ( not ( = ?auto_127040 ?auto_127043 ) ) ( not ( = ?auto_127041 ?auto_127043 ) ) ( not ( = ?auto_127042 ?auto_127043 ) ) ( not ( = ?auto_127045 ?auto_127043 ) ) ( not ( = ?auto_127046 ?auto_127043 ) ) ( not ( = ?auto_127044 ?auto_127043 ) ) ( ON ?auto_127039 ?auto_127038 ) ( ON-TABLE ?auto_127043 ) ( ON ?auto_127040 ?auto_127039 ) ( ON ?auto_127041 ?auto_127040 ) ( ON ?auto_127042 ?auto_127041 ) ( ON ?auto_127045 ?auto_127042 ) ( ON ?auto_127044 ?auto_127045 ) ( CLEAR ?auto_127044 ) ( HOLDING ?auto_127046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127046 )
      ( MAKE-5PILE ?auto_127038 ?auto_127039 ?auto_127040 ?auto_127041 ?auto_127042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127047 - BLOCK
      ?auto_127048 - BLOCK
      ?auto_127049 - BLOCK
      ?auto_127050 - BLOCK
      ?auto_127051 - BLOCK
    )
    :vars
    (
      ?auto_127054 - BLOCK
      ?auto_127055 - BLOCK
      ?auto_127053 - BLOCK
      ?auto_127052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127047 ?auto_127048 ) ) ( not ( = ?auto_127047 ?auto_127049 ) ) ( not ( = ?auto_127047 ?auto_127050 ) ) ( not ( = ?auto_127047 ?auto_127051 ) ) ( not ( = ?auto_127048 ?auto_127049 ) ) ( not ( = ?auto_127048 ?auto_127050 ) ) ( not ( = ?auto_127048 ?auto_127051 ) ) ( not ( = ?auto_127049 ?auto_127050 ) ) ( not ( = ?auto_127049 ?auto_127051 ) ) ( not ( = ?auto_127050 ?auto_127051 ) ) ( not ( = ?auto_127047 ?auto_127054 ) ) ( not ( = ?auto_127048 ?auto_127054 ) ) ( not ( = ?auto_127049 ?auto_127054 ) ) ( not ( = ?auto_127050 ?auto_127054 ) ) ( not ( = ?auto_127051 ?auto_127054 ) ) ( not ( = ?auto_127055 ?auto_127053 ) ) ( not ( = ?auto_127055 ?auto_127054 ) ) ( not ( = ?auto_127055 ?auto_127051 ) ) ( not ( = ?auto_127055 ?auto_127050 ) ) ( not ( = ?auto_127053 ?auto_127054 ) ) ( not ( = ?auto_127053 ?auto_127051 ) ) ( not ( = ?auto_127053 ?auto_127050 ) ) ( not ( = ?auto_127047 ?auto_127055 ) ) ( not ( = ?auto_127047 ?auto_127053 ) ) ( not ( = ?auto_127048 ?auto_127055 ) ) ( not ( = ?auto_127048 ?auto_127053 ) ) ( not ( = ?auto_127049 ?auto_127055 ) ) ( not ( = ?auto_127049 ?auto_127053 ) ) ( ON ?auto_127047 ?auto_127052 ) ( not ( = ?auto_127047 ?auto_127052 ) ) ( not ( = ?auto_127048 ?auto_127052 ) ) ( not ( = ?auto_127049 ?auto_127052 ) ) ( not ( = ?auto_127050 ?auto_127052 ) ) ( not ( = ?auto_127051 ?auto_127052 ) ) ( not ( = ?auto_127054 ?auto_127052 ) ) ( not ( = ?auto_127055 ?auto_127052 ) ) ( not ( = ?auto_127053 ?auto_127052 ) ) ( ON ?auto_127048 ?auto_127047 ) ( ON-TABLE ?auto_127052 ) ( ON ?auto_127049 ?auto_127048 ) ( ON ?auto_127050 ?auto_127049 ) ( ON ?auto_127051 ?auto_127050 ) ( ON ?auto_127054 ?auto_127051 ) ( ON ?auto_127053 ?auto_127054 ) ( ON ?auto_127055 ?auto_127053 ) ( CLEAR ?auto_127055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127052 ?auto_127047 ?auto_127048 ?auto_127049 ?auto_127050 ?auto_127051 ?auto_127054 ?auto_127053 )
      ( MAKE-5PILE ?auto_127047 ?auto_127048 ?auto_127049 ?auto_127050 ?auto_127051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127071 - BLOCK
      ?auto_127072 - BLOCK
    )
    :vars
    (
      ?auto_127074 - BLOCK
      ?auto_127073 - BLOCK
      ?auto_127075 - BLOCK
      ?auto_127078 - BLOCK
      ?auto_127076 - BLOCK
      ?auto_127077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127074 ?auto_127072 ) ( ON-TABLE ?auto_127071 ) ( ON ?auto_127072 ?auto_127071 ) ( not ( = ?auto_127071 ?auto_127072 ) ) ( not ( = ?auto_127071 ?auto_127074 ) ) ( not ( = ?auto_127072 ?auto_127074 ) ) ( not ( = ?auto_127071 ?auto_127073 ) ) ( not ( = ?auto_127071 ?auto_127075 ) ) ( not ( = ?auto_127072 ?auto_127073 ) ) ( not ( = ?auto_127072 ?auto_127075 ) ) ( not ( = ?auto_127074 ?auto_127073 ) ) ( not ( = ?auto_127074 ?auto_127075 ) ) ( not ( = ?auto_127073 ?auto_127075 ) ) ( ON ?auto_127073 ?auto_127074 ) ( CLEAR ?auto_127073 ) ( HOLDING ?auto_127075 ) ( CLEAR ?auto_127078 ) ( ON-TABLE ?auto_127076 ) ( ON ?auto_127077 ?auto_127076 ) ( ON ?auto_127078 ?auto_127077 ) ( not ( = ?auto_127076 ?auto_127077 ) ) ( not ( = ?auto_127076 ?auto_127078 ) ) ( not ( = ?auto_127076 ?auto_127075 ) ) ( not ( = ?auto_127077 ?auto_127078 ) ) ( not ( = ?auto_127077 ?auto_127075 ) ) ( not ( = ?auto_127078 ?auto_127075 ) ) ( not ( = ?auto_127071 ?auto_127078 ) ) ( not ( = ?auto_127071 ?auto_127076 ) ) ( not ( = ?auto_127071 ?auto_127077 ) ) ( not ( = ?auto_127072 ?auto_127078 ) ) ( not ( = ?auto_127072 ?auto_127076 ) ) ( not ( = ?auto_127072 ?auto_127077 ) ) ( not ( = ?auto_127074 ?auto_127078 ) ) ( not ( = ?auto_127074 ?auto_127076 ) ) ( not ( = ?auto_127074 ?auto_127077 ) ) ( not ( = ?auto_127073 ?auto_127078 ) ) ( not ( = ?auto_127073 ?auto_127076 ) ) ( not ( = ?auto_127073 ?auto_127077 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127076 ?auto_127077 ?auto_127078 ?auto_127075 )
      ( MAKE-2PILE ?auto_127071 ?auto_127072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127079 - BLOCK
      ?auto_127080 - BLOCK
    )
    :vars
    (
      ?auto_127086 - BLOCK
      ?auto_127082 - BLOCK
      ?auto_127085 - BLOCK
      ?auto_127083 - BLOCK
      ?auto_127081 - BLOCK
      ?auto_127084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127086 ?auto_127080 ) ( ON-TABLE ?auto_127079 ) ( ON ?auto_127080 ?auto_127079 ) ( not ( = ?auto_127079 ?auto_127080 ) ) ( not ( = ?auto_127079 ?auto_127086 ) ) ( not ( = ?auto_127080 ?auto_127086 ) ) ( not ( = ?auto_127079 ?auto_127082 ) ) ( not ( = ?auto_127079 ?auto_127085 ) ) ( not ( = ?auto_127080 ?auto_127082 ) ) ( not ( = ?auto_127080 ?auto_127085 ) ) ( not ( = ?auto_127086 ?auto_127082 ) ) ( not ( = ?auto_127086 ?auto_127085 ) ) ( not ( = ?auto_127082 ?auto_127085 ) ) ( ON ?auto_127082 ?auto_127086 ) ( CLEAR ?auto_127083 ) ( ON-TABLE ?auto_127081 ) ( ON ?auto_127084 ?auto_127081 ) ( ON ?auto_127083 ?auto_127084 ) ( not ( = ?auto_127081 ?auto_127084 ) ) ( not ( = ?auto_127081 ?auto_127083 ) ) ( not ( = ?auto_127081 ?auto_127085 ) ) ( not ( = ?auto_127084 ?auto_127083 ) ) ( not ( = ?auto_127084 ?auto_127085 ) ) ( not ( = ?auto_127083 ?auto_127085 ) ) ( not ( = ?auto_127079 ?auto_127083 ) ) ( not ( = ?auto_127079 ?auto_127081 ) ) ( not ( = ?auto_127079 ?auto_127084 ) ) ( not ( = ?auto_127080 ?auto_127083 ) ) ( not ( = ?auto_127080 ?auto_127081 ) ) ( not ( = ?auto_127080 ?auto_127084 ) ) ( not ( = ?auto_127086 ?auto_127083 ) ) ( not ( = ?auto_127086 ?auto_127081 ) ) ( not ( = ?auto_127086 ?auto_127084 ) ) ( not ( = ?auto_127082 ?auto_127083 ) ) ( not ( = ?auto_127082 ?auto_127081 ) ) ( not ( = ?auto_127082 ?auto_127084 ) ) ( ON ?auto_127085 ?auto_127082 ) ( CLEAR ?auto_127085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127079 ?auto_127080 ?auto_127086 ?auto_127082 )
      ( MAKE-2PILE ?auto_127079 ?auto_127080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127087 - BLOCK
      ?auto_127088 - BLOCK
    )
    :vars
    (
      ?auto_127089 - BLOCK
      ?auto_127090 - BLOCK
      ?auto_127093 - BLOCK
      ?auto_127092 - BLOCK
      ?auto_127091 - BLOCK
      ?auto_127094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127089 ?auto_127088 ) ( ON-TABLE ?auto_127087 ) ( ON ?auto_127088 ?auto_127087 ) ( not ( = ?auto_127087 ?auto_127088 ) ) ( not ( = ?auto_127087 ?auto_127089 ) ) ( not ( = ?auto_127088 ?auto_127089 ) ) ( not ( = ?auto_127087 ?auto_127090 ) ) ( not ( = ?auto_127087 ?auto_127093 ) ) ( not ( = ?auto_127088 ?auto_127090 ) ) ( not ( = ?auto_127088 ?auto_127093 ) ) ( not ( = ?auto_127089 ?auto_127090 ) ) ( not ( = ?auto_127089 ?auto_127093 ) ) ( not ( = ?auto_127090 ?auto_127093 ) ) ( ON ?auto_127090 ?auto_127089 ) ( ON-TABLE ?auto_127092 ) ( ON ?auto_127091 ?auto_127092 ) ( not ( = ?auto_127092 ?auto_127091 ) ) ( not ( = ?auto_127092 ?auto_127094 ) ) ( not ( = ?auto_127092 ?auto_127093 ) ) ( not ( = ?auto_127091 ?auto_127094 ) ) ( not ( = ?auto_127091 ?auto_127093 ) ) ( not ( = ?auto_127094 ?auto_127093 ) ) ( not ( = ?auto_127087 ?auto_127094 ) ) ( not ( = ?auto_127087 ?auto_127092 ) ) ( not ( = ?auto_127087 ?auto_127091 ) ) ( not ( = ?auto_127088 ?auto_127094 ) ) ( not ( = ?auto_127088 ?auto_127092 ) ) ( not ( = ?auto_127088 ?auto_127091 ) ) ( not ( = ?auto_127089 ?auto_127094 ) ) ( not ( = ?auto_127089 ?auto_127092 ) ) ( not ( = ?auto_127089 ?auto_127091 ) ) ( not ( = ?auto_127090 ?auto_127094 ) ) ( not ( = ?auto_127090 ?auto_127092 ) ) ( not ( = ?auto_127090 ?auto_127091 ) ) ( ON ?auto_127093 ?auto_127090 ) ( CLEAR ?auto_127093 ) ( HOLDING ?auto_127094 ) ( CLEAR ?auto_127091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127092 ?auto_127091 ?auto_127094 )
      ( MAKE-2PILE ?auto_127087 ?auto_127088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127095 - BLOCK
      ?auto_127096 - BLOCK
    )
    :vars
    (
      ?auto_127102 - BLOCK
      ?auto_127101 - BLOCK
      ?auto_127100 - BLOCK
      ?auto_127098 - BLOCK
      ?auto_127097 - BLOCK
      ?auto_127099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127102 ?auto_127096 ) ( ON-TABLE ?auto_127095 ) ( ON ?auto_127096 ?auto_127095 ) ( not ( = ?auto_127095 ?auto_127096 ) ) ( not ( = ?auto_127095 ?auto_127102 ) ) ( not ( = ?auto_127096 ?auto_127102 ) ) ( not ( = ?auto_127095 ?auto_127101 ) ) ( not ( = ?auto_127095 ?auto_127100 ) ) ( not ( = ?auto_127096 ?auto_127101 ) ) ( not ( = ?auto_127096 ?auto_127100 ) ) ( not ( = ?auto_127102 ?auto_127101 ) ) ( not ( = ?auto_127102 ?auto_127100 ) ) ( not ( = ?auto_127101 ?auto_127100 ) ) ( ON ?auto_127101 ?auto_127102 ) ( ON-TABLE ?auto_127098 ) ( ON ?auto_127097 ?auto_127098 ) ( not ( = ?auto_127098 ?auto_127097 ) ) ( not ( = ?auto_127098 ?auto_127099 ) ) ( not ( = ?auto_127098 ?auto_127100 ) ) ( not ( = ?auto_127097 ?auto_127099 ) ) ( not ( = ?auto_127097 ?auto_127100 ) ) ( not ( = ?auto_127099 ?auto_127100 ) ) ( not ( = ?auto_127095 ?auto_127099 ) ) ( not ( = ?auto_127095 ?auto_127098 ) ) ( not ( = ?auto_127095 ?auto_127097 ) ) ( not ( = ?auto_127096 ?auto_127099 ) ) ( not ( = ?auto_127096 ?auto_127098 ) ) ( not ( = ?auto_127096 ?auto_127097 ) ) ( not ( = ?auto_127102 ?auto_127099 ) ) ( not ( = ?auto_127102 ?auto_127098 ) ) ( not ( = ?auto_127102 ?auto_127097 ) ) ( not ( = ?auto_127101 ?auto_127099 ) ) ( not ( = ?auto_127101 ?auto_127098 ) ) ( not ( = ?auto_127101 ?auto_127097 ) ) ( ON ?auto_127100 ?auto_127101 ) ( CLEAR ?auto_127097 ) ( ON ?auto_127099 ?auto_127100 ) ( CLEAR ?auto_127099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127095 ?auto_127096 ?auto_127102 ?auto_127101 ?auto_127100 )
      ( MAKE-2PILE ?auto_127095 ?auto_127096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127103 - BLOCK
      ?auto_127104 - BLOCK
    )
    :vars
    (
      ?auto_127110 - BLOCK
      ?auto_127109 - BLOCK
      ?auto_127107 - BLOCK
      ?auto_127106 - BLOCK
      ?auto_127108 - BLOCK
      ?auto_127105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127110 ?auto_127104 ) ( ON-TABLE ?auto_127103 ) ( ON ?auto_127104 ?auto_127103 ) ( not ( = ?auto_127103 ?auto_127104 ) ) ( not ( = ?auto_127103 ?auto_127110 ) ) ( not ( = ?auto_127104 ?auto_127110 ) ) ( not ( = ?auto_127103 ?auto_127109 ) ) ( not ( = ?auto_127103 ?auto_127107 ) ) ( not ( = ?auto_127104 ?auto_127109 ) ) ( not ( = ?auto_127104 ?auto_127107 ) ) ( not ( = ?auto_127110 ?auto_127109 ) ) ( not ( = ?auto_127110 ?auto_127107 ) ) ( not ( = ?auto_127109 ?auto_127107 ) ) ( ON ?auto_127109 ?auto_127110 ) ( ON-TABLE ?auto_127106 ) ( not ( = ?auto_127106 ?auto_127108 ) ) ( not ( = ?auto_127106 ?auto_127105 ) ) ( not ( = ?auto_127106 ?auto_127107 ) ) ( not ( = ?auto_127108 ?auto_127105 ) ) ( not ( = ?auto_127108 ?auto_127107 ) ) ( not ( = ?auto_127105 ?auto_127107 ) ) ( not ( = ?auto_127103 ?auto_127105 ) ) ( not ( = ?auto_127103 ?auto_127106 ) ) ( not ( = ?auto_127103 ?auto_127108 ) ) ( not ( = ?auto_127104 ?auto_127105 ) ) ( not ( = ?auto_127104 ?auto_127106 ) ) ( not ( = ?auto_127104 ?auto_127108 ) ) ( not ( = ?auto_127110 ?auto_127105 ) ) ( not ( = ?auto_127110 ?auto_127106 ) ) ( not ( = ?auto_127110 ?auto_127108 ) ) ( not ( = ?auto_127109 ?auto_127105 ) ) ( not ( = ?auto_127109 ?auto_127106 ) ) ( not ( = ?auto_127109 ?auto_127108 ) ) ( ON ?auto_127107 ?auto_127109 ) ( ON ?auto_127105 ?auto_127107 ) ( CLEAR ?auto_127105 ) ( HOLDING ?auto_127108 ) ( CLEAR ?auto_127106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127106 ?auto_127108 )
      ( MAKE-2PILE ?auto_127103 ?auto_127104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127111 - BLOCK
      ?auto_127112 - BLOCK
    )
    :vars
    (
      ?auto_127115 - BLOCK
      ?auto_127114 - BLOCK
      ?auto_127113 - BLOCK
      ?auto_127118 - BLOCK
      ?auto_127117 - BLOCK
      ?auto_127116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127115 ?auto_127112 ) ( ON-TABLE ?auto_127111 ) ( ON ?auto_127112 ?auto_127111 ) ( not ( = ?auto_127111 ?auto_127112 ) ) ( not ( = ?auto_127111 ?auto_127115 ) ) ( not ( = ?auto_127112 ?auto_127115 ) ) ( not ( = ?auto_127111 ?auto_127114 ) ) ( not ( = ?auto_127111 ?auto_127113 ) ) ( not ( = ?auto_127112 ?auto_127114 ) ) ( not ( = ?auto_127112 ?auto_127113 ) ) ( not ( = ?auto_127115 ?auto_127114 ) ) ( not ( = ?auto_127115 ?auto_127113 ) ) ( not ( = ?auto_127114 ?auto_127113 ) ) ( ON ?auto_127114 ?auto_127115 ) ( ON-TABLE ?auto_127118 ) ( not ( = ?auto_127118 ?auto_127117 ) ) ( not ( = ?auto_127118 ?auto_127116 ) ) ( not ( = ?auto_127118 ?auto_127113 ) ) ( not ( = ?auto_127117 ?auto_127116 ) ) ( not ( = ?auto_127117 ?auto_127113 ) ) ( not ( = ?auto_127116 ?auto_127113 ) ) ( not ( = ?auto_127111 ?auto_127116 ) ) ( not ( = ?auto_127111 ?auto_127118 ) ) ( not ( = ?auto_127111 ?auto_127117 ) ) ( not ( = ?auto_127112 ?auto_127116 ) ) ( not ( = ?auto_127112 ?auto_127118 ) ) ( not ( = ?auto_127112 ?auto_127117 ) ) ( not ( = ?auto_127115 ?auto_127116 ) ) ( not ( = ?auto_127115 ?auto_127118 ) ) ( not ( = ?auto_127115 ?auto_127117 ) ) ( not ( = ?auto_127114 ?auto_127116 ) ) ( not ( = ?auto_127114 ?auto_127118 ) ) ( not ( = ?auto_127114 ?auto_127117 ) ) ( ON ?auto_127113 ?auto_127114 ) ( ON ?auto_127116 ?auto_127113 ) ( CLEAR ?auto_127118 ) ( ON ?auto_127117 ?auto_127116 ) ( CLEAR ?auto_127117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127111 ?auto_127112 ?auto_127115 ?auto_127114 ?auto_127113 ?auto_127116 )
      ( MAKE-2PILE ?auto_127111 ?auto_127112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127119 - BLOCK
      ?auto_127120 - BLOCK
    )
    :vars
    (
      ?auto_127126 - BLOCK
      ?auto_127125 - BLOCK
      ?auto_127123 - BLOCK
      ?auto_127124 - BLOCK
      ?auto_127121 - BLOCK
      ?auto_127122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127126 ?auto_127120 ) ( ON-TABLE ?auto_127119 ) ( ON ?auto_127120 ?auto_127119 ) ( not ( = ?auto_127119 ?auto_127120 ) ) ( not ( = ?auto_127119 ?auto_127126 ) ) ( not ( = ?auto_127120 ?auto_127126 ) ) ( not ( = ?auto_127119 ?auto_127125 ) ) ( not ( = ?auto_127119 ?auto_127123 ) ) ( not ( = ?auto_127120 ?auto_127125 ) ) ( not ( = ?auto_127120 ?auto_127123 ) ) ( not ( = ?auto_127126 ?auto_127125 ) ) ( not ( = ?auto_127126 ?auto_127123 ) ) ( not ( = ?auto_127125 ?auto_127123 ) ) ( ON ?auto_127125 ?auto_127126 ) ( not ( = ?auto_127124 ?auto_127121 ) ) ( not ( = ?auto_127124 ?auto_127122 ) ) ( not ( = ?auto_127124 ?auto_127123 ) ) ( not ( = ?auto_127121 ?auto_127122 ) ) ( not ( = ?auto_127121 ?auto_127123 ) ) ( not ( = ?auto_127122 ?auto_127123 ) ) ( not ( = ?auto_127119 ?auto_127122 ) ) ( not ( = ?auto_127119 ?auto_127124 ) ) ( not ( = ?auto_127119 ?auto_127121 ) ) ( not ( = ?auto_127120 ?auto_127122 ) ) ( not ( = ?auto_127120 ?auto_127124 ) ) ( not ( = ?auto_127120 ?auto_127121 ) ) ( not ( = ?auto_127126 ?auto_127122 ) ) ( not ( = ?auto_127126 ?auto_127124 ) ) ( not ( = ?auto_127126 ?auto_127121 ) ) ( not ( = ?auto_127125 ?auto_127122 ) ) ( not ( = ?auto_127125 ?auto_127124 ) ) ( not ( = ?auto_127125 ?auto_127121 ) ) ( ON ?auto_127123 ?auto_127125 ) ( ON ?auto_127122 ?auto_127123 ) ( ON ?auto_127121 ?auto_127122 ) ( CLEAR ?auto_127121 ) ( HOLDING ?auto_127124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127124 )
      ( MAKE-2PILE ?auto_127119 ?auto_127120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127137 - BLOCK
      ?auto_127138 - BLOCK
    )
    :vars
    (
      ?auto_127141 - BLOCK
      ?auto_127139 - BLOCK
      ?auto_127143 - BLOCK
      ?auto_127140 - BLOCK
      ?auto_127144 - BLOCK
      ?auto_127142 - BLOCK
      ?auto_127145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127141 ?auto_127138 ) ( ON-TABLE ?auto_127137 ) ( ON ?auto_127138 ?auto_127137 ) ( not ( = ?auto_127137 ?auto_127138 ) ) ( not ( = ?auto_127137 ?auto_127141 ) ) ( not ( = ?auto_127138 ?auto_127141 ) ) ( not ( = ?auto_127137 ?auto_127139 ) ) ( not ( = ?auto_127137 ?auto_127143 ) ) ( not ( = ?auto_127138 ?auto_127139 ) ) ( not ( = ?auto_127138 ?auto_127143 ) ) ( not ( = ?auto_127141 ?auto_127139 ) ) ( not ( = ?auto_127141 ?auto_127143 ) ) ( not ( = ?auto_127139 ?auto_127143 ) ) ( ON ?auto_127139 ?auto_127141 ) ( not ( = ?auto_127140 ?auto_127144 ) ) ( not ( = ?auto_127140 ?auto_127142 ) ) ( not ( = ?auto_127140 ?auto_127143 ) ) ( not ( = ?auto_127144 ?auto_127142 ) ) ( not ( = ?auto_127144 ?auto_127143 ) ) ( not ( = ?auto_127142 ?auto_127143 ) ) ( not ( = ?auto_127137 ?auto_127142 ) ) ( not ( = ?auto_127137 ?auto_127140 ) ) ( not ( = ?auto_127137 ?auto_127144 ) ) ( not ( = ?auto_127138 ?auto_127142 ) ) ( not ( = ?auto_127138 ?auto_127140 ) ) ( not ( = ?auto_127138 ?auto_127144 ) ) ( not ( = ?auto_127141 ?auto_127142 ) ) ( not ( = ?auto_127141 ?auto_127140 ) ) ( not ( = ?auto_127141 ?auto_127144 ) ) ( not ( = ?auto_127139 ?auto_127142 ) ) ( not ( = ?auto_127139 ?auto_127140 ) ) ( not ( = ?auto_127139 ?auto_127144 ) ) ( ON ?auto_127143 ?auto_127139 ) ( ON ?auto_127142 ?auto_127143 ) ( ON ?auto_127144 ?auto_127142 ) ( CLEAR ?auto_127144 ) ( ON ?auto_127140 ?auto_127145 ) ( CLEAR ?auto_127140 ) ( HAND-EMPTY ) ( not ( = ?auto_127137 ?auto_127145 ) ) ( not ( = ?auto_127138 ?auto_127145 ) ) ( not ( = ?auto_127141 ?auto_127145 ) ) ( not ( = ?auto_127139 ?auto_127145 ) ) ( not ( = ?auto_127143 ?auto_127145 ) ) ( not ( = ?auto_127140 ?auto_127145 ) ) ( not ( = ?auto_127144 ?auto_127145 ) ) ( not ( = ?auto_127142 ?auto_127145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127140 ?auto_127145 )
      ( MAKE-2PILE ?auto_127137 ?auto_127138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127146 - BLOCK
      ?auto_127147 - BLOCK
    )
    :vars
    (
      ?auto_127148 - BLOCK
      ?auto_127149 - BLOCK
      ?auto_127154 - BLOCK
      ?auto_127150 - BLOCK
      ?auto_127153 - BLOCK
      ?auto_127151 - BLOCK
      ?auto_127152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127148 ?auto_127147 ) ( ON-TABLE ?auto_127146 ) ( ON ?auto_127147 ?auto_127146 ) ( not ( = ?auto_127146 ?auto_127147 ) ) ( not ( = ?auto_127146 ?auto_127148 ) ) ( not ( = ?auto_127147 ?auto_127148 ) ) ( not ( = ?auto_127146 ?auto_127149 ) ) ( not ( = ?auto_127146 ?auto_127154 ) ) ( not ( = ?auto_127147 ?auto_127149 ) ) ( not ( = ?auto_127147 ?auto_127154 ) ) ( not ( = ?auto_127148 ?auto_127149 ) ) ( not ( = ?auto_127148 ?auto_127154 ) ) ( not ( = ?auto_127149 ?auto_127154 ) ) ( ON ?auto_127149 ?auto_127148 ) ( not ( = ?auto_127150 ?auto_127153 ) ) ( not ( = ?auto_127150 ?auto_127151 ) ) ( not ( = ?auto_127150 ?auto_127154 ) ) ( not ( = ?auto_127153 ?auto_127151 ) ) ( not ( = ?auto_127153 ?auto_127154 ) ) ( not ( = ?auto_127151 ?auto_127154 ) ) ( not ( = ?auto_127146 ?auto_127151 ) ) ( not ( = ?auto_127146 ?auto_127150 ) ) ( not ( = ?auto_127146 ?auto_127153 ) ) ( not ( = ?auto_127147 ?auto_127151 ) ) ( not ( = ?auto_127147 ?auto_127150 ) ) ( not ( = ?auto_127147 ?auto_127153 ) ) ( not ( = ?auto_127148 ?auto_127151 ) ) ( not ( = ?auto_127148 ?auto_127150 ) ) ( not ( = ?auto_127148 ?auto_127153 ) ) ( not ( = ?auto_127149 ?auto_127151 ) ) ( not ( = ?auto_127149 ?auto_127150 ) ) ( not ( = ?auto_127149 ?auto_127153 ) ) ( ON ?auto_127154 ?auto_127149 ) ( ON ?auto_127151 ?auto_127154 ) ( ON ?auto_127150 ?auto_127152 ) ( CLEAR ?auto_127150 ) ( not ( = ?auto_127146 ?auto_127152 ) ) ( not ( = ?auto_127147 ?auto_127152 ) ) ( not ( = ?auto_127148 ?auto_127152 ) ) ( not ( = ?auto_127149 ?auto_127152 ) ) ( not ( = ?auto_127154 ?auto_127152 ) ) ( not ( = ?auto_127150 ?auto_127152 ) ) ( not ( = ?auto_127153 ?auto_127152 ) ) ( not ( = ?auto_127151 ?auto_127152 ) ) ( HOLDING ?auto_127153 ) ( CLEAR ?auto_127151 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127146 ?auto_127147 ?auto_127148 ?auto_127149 ?auto_127154 ?auto_127151 ?auto_127153 )
      ( MAKE-2PILE ?auto_127146 ?auto_127147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127155 - BLOCK
      ?auto_127156 - BLOCK
    )
    :vars
    (
      ?auto_127163 - BLOCK
      ?auto_127157 - BLOCK
      ?auto_127162 - BLOCK
      ?auto_127158 - BLOCK
      ?auto_127161 - BLOCK
      ?auto_127160 - BLOCK
      ?auto_127159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127163 ?auto_127156 ) ( ON-TABLE ?auto_127155 ) ( ON ?auto_127156 ?auto_127155 ) ( not ( = ?auto_127155 ?auto_127156 ) ) ( not ( = ?auto_127155 ?auto_127163 ) ) ( not ( = ?auto_127156 ?auto_127163 ) ) ( not ( = ?auto_127155 ?auto_127157 ) ) ( not ( = ?auto_127155 ?auto_127162 ) ) ( not ( = ?auto_127156 ?auto_127157 ) ) ( not ( = ?auto_127156 ?auto_127162 ) ) ( not ( = ?auto_127163 ?auto_127157 ) ) ( not ( = ?auto_127163 ?auto_127162 ) ) ( not ( = ?auto_127157 ?auto_127162 ) ) ( ON ?auto_127157 ?auto_127163 ) ( not ( = ?auto_127158 ?auto_127161 ) ) ( not ( = ?auto_127158 ?auto_127160 ) ) ( not ( = ?auto_127158 ?auto_127162 ) ) ( not ( = ?auto_127161 ?auto_127160 ) ) ( not ( = ?auto_127161 ?auto_127162 ) ) ( not ( = ?auto_127160 ?auto_127162 ) ) ( not ( = ?auto_127155 ?auto_127160 ) ) ( not ( = ?auto_127155 ?auto_127158 ) ) ( not ( = ?auto_127155 ?auto_127161 ) ) ( not ( = ?auto_127156 ?auto_127160 ) ) ( not ( = ?auto_127156 ?auto_127158 ) ) ( not ( = ?auto_127156 ?auto_127161 ) ) ( not ( = ?auto_127163 ?auto_127160 ) ) ( not ( = ?auto_127163 ?auto_127158 ) ) ( not ( = ?auto_127163 ?auto_127161 ) ) ( not ( = ?auto_127157 ?auto_127160 ) ) ( not ( = ?auto_127157 ?auto_127158 ) ) ( not ( = ?auto_127157 ?auto_127161 ) ) ( ON ?auto_127162 ?auto_127157 ) ( ON ?auto_127160 ?auto_127162 ) ( ON ?auto_127158 ?auto_127159 ) ( not ( = ?auto_127155 ?auto_127159 ) ) ( not ( = ?auto_127156 ?auto_127159 ) ) ( not ( = ?auto_127163 ?auto_127159 ) ) ( not ( = ?auto_127157 ?auto_127159 ) ) ( not ( = ?auto_127162 ?auto_127159 ) ) ( not ( = ?auto_127158 ?auto_127159 ) ) ( not ( = ?auto_127161 ?auto_127159 ) ) ( not ( = ?auto_127160 ?auto_127159 ) ) ( CLEAR ?auto_127160 ) ( ON ?auto_127161 ?auto_127158 ) ( CLEAR ?auto_127161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127159 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127159 ?auto_127158 )
      ( MAKE-2PILE ?auto_127155 ?auto_127156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127164 - BLOCK
      ?auto_127165 - BLOCK
    )
    :vars
    (
      ?auto_127166 - BLOCK
      ?auto_127172 - BLOCK
      ?auto_127167 - BLOCK
      ?auto_127171 - BLOCK
      ?auto_127168 - BLOCK
      ?auto_127170 - BLOCK
      ?auto_127169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127166 ?auto_127165 ) ( ON-TABLE ?auto_127164 ) ( ON ?auto_127165 ?auto_127164 ) ( not ( = ?auto_127164 ?auto_127165 ) ) ( not ( = ?auto_127164 ?auto_127166 ) ) ( not ( = ?auto_127165 ?auto_127166 ) ) ( not ( = ?auto_127164 ?auto_127172 ) ) ( not ( = ?auto_127164 ?auto_127167 ) ) ( not ( = ?auto_127165 ?auto_127172 ) ) ( not ( = ?auto_127165 ?auto_127167 ) ) ( not ( = ?auto_127166 ?auto_127172 ) ) ( not ( = ?auto_127166 ?auto_127167 ) ) ( not ( = ?auto_127172 ?auto_127167 ) ) ( ON ?auto_127172 ?auto_127166 ) ( not ( = ?auto_127171 ?auto_127168 ) ) ( not ( = ?auto_127171 ?auto_127170 ) ) ( not ( = ?auto_127171 ?auto_127167 ) ) ( not ( = ?auto_127168 ?auto_127170 ) ) ( not ( = ?auto_127168 ?auto_127167 ) ) ( not ( = ?auto_127170 ?auto_127167 ) ) ( not ( = ?auto_127164 ?auto_127170 ) ) ( not ( = ?auto_127164 ?auto_127171 ) ) ( not ( = ?auto_127164 ?auto_127168 ) ) ( not ( = ?auto_127165 ?auto_127170 ) ) ( not ( = ?auto_127165 ?auto_127171 ) ) ( not ( = ?auto_127165 ?auto_127168 ) ) ( not ( = ?auto_127166 ?auto_127170 ) ) ( not ( = ?auto_127166 ?auto_127171 ) ) ( not ( = ?auto_127166 ?auto_127168 ) ) ( not ( = ?auto_127172 ?auto_127170 ) ) ( not ( = ?auto_127172 ?auto_127171 ) ) ( not ( = ?auto_127172 ?auto_127168 ) ) ( ON ?auto_127167 ?auto_127172 ) ( ON ?auto_127171 ?auto_127169 ) ( not ( = ?auto_127164 ?auto_127169 ) ) ( not ( = ?auto_127165 ?auto_127169 ) ) ( not ( = ?auto_127166 ?auto_127169 ) ) ( not ( = ?auto_127172 ?auto_127169 ) ) ( not ( = ?auto_127167 ?auto_127169 ) ) ( not ( = ?auto_127171 ?auto_127169 ) ) ( not ( = ?auto_127168 ?auto_127169 ) ) ( not ( = ?auto_127170 ?auto_127169 ) ) ( ON ?auto_127168 ?auto_127171 ) ( CLEAR ?auto_127168 ) ( ON-TABLE ?auto_127169 ) ( HOLDING ?auto_127170 ) ( CLEAR ?auto_127167 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127164 ?auto_127165 ?auto_127166 ?auto_127172 ?auto_127167 ?auto_127170 )
      ( MAKE-2PILE ?auto_127164 ?auto_127165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127173 - BLOCK
      ?auto_127174 - BLOCK
    )
    :vars
    (
      ?auto_127175 - BLOCK
      ?auto_127178 - BLOCK
      ?auto_127176 - BLOCK
      ?auto_127180 - BLOCK
      ?auto_127177 - BLOCK
      ?auto_127179 - BLOCK
      ?auto_127181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127175 ?auto_127174 ) ( ON-TABLE ?auto_127173 ) ( ON ?auto_127174 ?auto_127173 ) ( not ( = ?auto_127173 ?auto_127174 ) ) ( not ( = ?auto_127173 ?auto_127175 ) ) ( not ( = ?auto_127174 ?auto_127175 ) ) ( not ( = ?auto_127173 ?auto_127178 ) ) ( not ( = ?auto_127173 ?auto_127176 ) ) ( not ( = ?auto_127174 ?auto_127178 ) ) ( not ( = ?auto_127174 ?auto_127176 ) ) ( not ( = ?auto_127175 ?auto_127178 ) ) ( not ( = ?auto_127175 ?auto_127176 ) ) ( not ( = ?auto_127178 ?auto_127176 ) ) ( ON ?auto_127178 ?auto_127175 ) ( not ( = ?auto_127180 ?auto_127177 ) ) ( not ( = ?auto_127180 ?auto_127179 ) ) ( not ( = ?auto_127180 ?auto_127176 ) ) ( not ( = ?auto_127177 ?auto_127179 ) ) ( not ( = ?auto_127177 ?auto_127176 ) ) ( not ( = ?auto_127179 ?auto_127176 ) ) ( not ( = ?auto_127173 ?auto_127179 ) ) ( not ( = ?auto_127173 ?auto_127180 ) ) ( not ( = ?auto_127173 ?auto_127177 ) ) ( not ( = ?auto_127174 ?auto_127179 ) ) ( not ( = ?auto_127174 ?auto_127180 ) ) ( not ( = ?auto_127174 ?auto_127177 ) ) ( not ( = ?auto_127175 ?auto_127179 ) ) ( not ( = ?auto_127175 ?auto_127180 ) ) ( not ( = ?auto_127175 ?auto_127177 ) ) ( not ( = ?auto_127178 ?auto_127179 ) ) ( not ( = ?auto_127178 ?auto_127180 ) ) ( not ( = ?auto_127178 ?auto_127177 ) ) ( ON ?auto_127176 ?auto_127178 ) ( ON ?auto_127180 ?auto_127181 ) ( not ( = ?auto_127173 ?auto_127181 ) ) ( not ( = ?auto_127174 ?auto_127181 ) ) ( not ( = ?auto_127175 ?auto_127181 ) ) ( not ( = ?auto_127178 ?auto_127181 ) ) ( not ( = ?auto_127176 ?auto_127181 ) ) ( not ( = ?auto_127180 ?auto_127181 ) ) ( not ( = ?auto_127177 ?auto_127181 ) ) ( not ( = ?auto_127179 ?auto_127181 ) ) ( ON ?auto_127177 ?auto_127180 ) ( ON-TABLE ?auto_127181 ) ( CLEAR ?auto_127176 ) ( ON ?auto_127179 ?auto_127177 ) ( CLEAR ?auto_127179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127181 ?auto_127180 ?auto_127177 )
      ( MAKE-2PILE ?auto_127173 ?auto_127174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127231 - BLOCK
      ?auto_127232 - BLOCK
      ?auto_127233 - BLOCK
      ?auto_127234 - BLOCK
      ?auto_127235 - BLOCK
      ?auto_127236 - BLOCK
    )
    :vars
    (
      ?auto_127237 - BLOCK
      ?auto_127238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127231 ) ( ON ?auto_127232 ?auto_127231 ) ( ON ?auto_127233 ?auto_127232 ) ( ON ?auto_127234 ?auto_127233 ) ( not ( = ?auto_127231 ?auto_127232 ) ) ( not ( = ?auto_127231 ?auto_127233 ) ) ( not ( = ?auto_127231 ?auto_127234 ) ) ( not ( = ?auto_127231 ?auto_127235 ) ) ( not ( = ?auto_127231 ?auto_127236 ) ) ( not ( = ?auto_127232 ?auto_127233 ) ) ( not ( = ?auto_127232 ?auto_127234 ) ) ( not ( = ?auto_127232 ?auto_127235 ) ) ( not ( = ?auto_127232 ?auto_127236 ) ) ( not ( = ?auto_127233 ?auto_127234 ) ) ( not ( = ?auto_127233 ?auto_127235 ) ) ( not ( = ?auto_127233 ?auto_127236 ) ) ( not ( = ?auto_127234 ?auto_127235 ) ) ( not ( = ?auto_127234 ?auto_127236 ) ) ( not ( = ?auto_127235 ?auto_127236 ) ) ( ON ?auto_127236 ?auto_127237 ) ( not ( = ?auto_127231 ?auto_127237 ) ) ( not ( = ?auto_127232 ?auto_127237 ) ) ( not ( = ?auto_127233 ?auto_127237 ) ) ( not ( = ?auto_127234 ?auto_127237 ) ) ( not ( = ?auto_127235 ?auto_127237 ) ) ( not ( = ?auto_127236 ?auto_127237 ) ) ( CLEAR ?auto_127234 ) ( ON ?auto_127235 ?auto_127236 ) ( CLEAR ?auto_127235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127238 ) ( ON ?auto_127237 ?auto_127238 ) ( not ( = ?auto_127238 ?auto_127237 ) ) ( not ( = ?auto_127238 ?auto_127236 ) ) ( not ( = ?auto_127238 ?auto_127235 ) ) ( not ( = ?auto_127231 ?auto_127238 ) ) ( not ( = ?auto_127232 ?auto_127238 ) ) ( not ( = ?auto_127233 ?auto_127238 ) ) ( not ( = ?auto_127234 ?auto_127238 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127238 ?auto_127237 ?auto_127236 )
      ( MAKE-6PILE ?auto_127231 ?auto_127232 ?auto_127233 ?auto_127234 ?auto_127235 ?auto_127236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127239 - BLOCK
      ?auto_127240 - BLOCK
      ?auto_127241 - BLOCK
      ?auto_127242 - BLOCK
      ?auto_127243 - BLOCK
      ?auto_127244 - BLOCK
    )
    :vars
    (
      ?auto_127245 - BLOCK
      ?auto_127246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127239 ) ( ON ?auto_127240 ?auto_127239 ) ( ON ?auto_127241 ?auto_127240 ) ( not ( = ?auto_127239 ?auto_127240 ) ) ( not ( = ?auto_127239 ?auto_127241 ) ) ( not ( = ?auto_127239 ?auto_127242 ) ) ( not ( = ?auto_127239 ?auto_127243 ) ) ( not ( = ?auto_127239 ?auto_127244 ) ) ( not ( = ?auto_127240 ?auto_127241 ) ) ( not ( = ?auto_127240 ?auto_127242 ) ) ( not ( = ?auto_127240 ?auto_127243 ) ) ( not ( = ?auto_127240 ?auto_127244 ) ) ( not ( = ?auto_127241 ?auto_127242 ) ) ( not ( = ?auto_127241 ?auto_127243 ) ) ( not ( = ?auto_127241 ?auto_127244 ) ) ( not ( = ?auto_127242 ?auto_127243 ) ) ( not ( = ?auto_127242 ?auto_127244 ) ) ( not ( = ?auto_127243 ?auto_127244 ) ) ( ON ?auto_127244 ?auto_127245 ) ( not ( = ?auto_127239 ?auto_127245 ) ) ( not ( = ?auto_127240 ?auto_127245 ) ) ( not ( = ?auto_127241 ?auto_127245 ) ) ( not ( = ?auto_127242 ?auto_127245 ) ) ( not ( = ?auto_127243 ?auto_127245 ) ) ( not ( = ?auto_127244 ?auto_127245 ) ) ( ON ?auto_127243 ?auto_127244 ) ( CLEAR ?auto_127243 ) ( ON-TABLE ?auto_127246 ) ( ON ?auto_127245 ?auto_127246 ) ( not ( = ?auto_127246 ?auto_127245 ) ) ( not ( = ?auto_127246 ?auto_127244 ) ) ( not ( = ?auto_127246 ?auto_127243 ) ) ( not ( = ?auto_127239 ?auto_127246 ) ) ( not ( = ?auto_127240 ?auto_127246 ) ) ( not ( = ?auto_127241 ?auto_127246 ) ) ( not ( = ?auto_127242 ?auto_127246 ) ) ( HOLDING ?auto_127242 ) ( CLEAR ?auto_127241 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127239 ?auto_127240 ?auto_127241 ?auto_127242 )
      ( MAKE-6PILE ?auto_127239 ?auto_127240 ?auto_127241 ?auto_127242 ?auto_127243 ?auto_127244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127247 - BLOCK
      ?auto_127248 - BLOCK
      ?auto_127249 - BLOCK
      ?auto_127250 - BLOCK
      ?auto_127251 - BLOCK
      ?auto_127252 - BLOCK
    )
    :vars
    (
      ?auto_127253 - BLOCK
      ?auto_127254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127247 ) ( ON ?auto_127248 ?auto_127247 ) ( ON ?auto_127249 ?auto_127248 ) ( not ( = ?auto_127247 ?auto_127248 ) ) ( not ( = ?auto_127247 ?auto_127249 ) ) ( not ( = ?auto_127247 ?auto_127250 ) ) ( not ( = ?auto_127247 ?auto_127251 ) ) ( not ( = ?auto_127247 ?auto_127252 ) ) ( not ( = ?auto_127248 ?auto_127249 ) ) ( not ( = ?auto_127248 ?auto_127250 ) ) ( not ( = ?auto_127248 ?auto_127251 ) ) ( not ( = ?auto_127248 ?auto_127252 ) ) ( not ( = ?auto_127249 ?auto_127250 ) ) ( not ( = ?auto_127249 ?auto_127251 ) ) ( not ( = ?auto_127249 ?auto_127252 ) ) ( not ( = ?auto_127250 ?auto_127251 ) ) ( not ( = ?auto_127250 ?auto_127252 ) ) ( not ( = ?auto_127251 ?auto_127252 ) ) ( ON ?auto_127252 ?auto_127253 ) ( not ( = ?auto_127247 ?auto_127253 ) ) ( not ( = ?auto_127248 ?auto_127253 ) ) ( not ( = ?auto_127249 ?auto_127253 ) ) ( not ( = ?auto_127250 ?auto_127253 ) ) ( not ( = ?auto_127251 ?auto_127253 ) ) ( not ( = ?auto_127252 ?auto_127253 ) ) ( ON ?auto_127251 ?auto_127252 ) ( ON-TABLE ?auto_127254 ) ( ON ?auto_127253 ?auto_127254 ) ( not ( = ?auto_127254 ?auto_127253 ) ) ( not ( = ?auto_127254 ?auto_127252 ) ) ( not ( = ?auto_127254 ?auto_127251 ) ) ( not ( = ?auto_127247 ?auto_127254 ) ) ( not ( = ?auto_127248 ?auto_127254 ) ) ( not ( = ?auto_127249 ?auto_127254 ) ) ( not ( = ?auto_127250 ?auto_127254 ) ) ( CLEAR ?auto_127249 ) ( ON ?auto_127250 ?auto_127251 ) ( CLEAR ?auto_127250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127254 ?auto_127253 ?auto_127252 ?auto_127251 )
      ( MAKE-6PILE ?auto_127247 ?auto_127248 ?auto_127249 ?auto_127250 ?auto_127251 ?auto_127252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127255 - BLOCK
      ?auto_127256 - BLOCK
      ?auto_127257 - BLOCK
      ?auto_127258 - BLOCK
      ?auto_127259 - BLOCK
      ?auto_127260 - BLOCK
    )
    :vars
    (
      ?auto_127262 - BLOCK
      ?auto_127261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127255 ) ( ON ?auto_127256 ?auto_127255 ) ( not ( = ?auto_127255 ?auto_127256 ) ) ( not ( = ?auto_127255 ?auto_127257 ) ) ( not ( = ?auto_127255 ?auto_127258 ) ) ( not ( = ?auto_127255 ?auto_127259 ) ) ( not ( = ?auto_127255 ?auto_127260 ) ) ( not ( = ?auto_127256 ?auto_127257 ) ) ( not ( = ?auto_127256 ?auto_127258 ) ) ( not ( = ?auto_127256 ?auto_127259 ) ) ( not ( = ?auto_127256 ?auto_127260 ) ) ( not ( = ?auto_127257 ?auto_127258 ) ) ( not ( = ?auto_127257 ?auto_127259 ) ) ( not ( = ?auto_127257 ?auto_127260 ) ) ( not ( = ?auto_127258 ?auto_127259 ) ) ( not ( = ?auto_127258 ?auto_127260 ) ) ( not ( = ?auto_127259 ?auto_127260 ) ) ( ON ?auto_127260 ?auto_127262 ) ( not ( = ?auto_127255 ?auto_127262 ) ) ( not ( = ?auto_127256 ?auto_127262 ) ) ( not ( = ?auto_127257 ?auto_127262 ) ) ( not ( = ?auto_127258 ?auto_127262 ) ) ( not ( = ?auto_127259 ?auto_127262 ) ) ( not ( = ?auto_127260 ?auto_127262 ) ) ( ON ?auto_127259 ?auto_127260 ) ( ON-TABLE ?auto_127261 ) ( ON ?auto_127262 ?auto_127261 ) ( not ( = ?auto_127261 ?auto_127262 ) ) ( not ( = ?auto_127261 ?auto_127260 ) ) ( not ( = ?auto_127261 ?auto_127259 ) ) ( not ( = ?auto_127255 ?auto_127261 ) ) ( not ( = ?auto_127256 ?auto_127261 ) ) ( not ( = ?auto_127257 ?auto_127261 ) ) ( not ( = ?auto_127258 ?auto_127261 ) ) ( ON ?auto_127258 ?auto_127259 ) ( CLEAR ?auto_127258 ) ( HOLDING ?auto_127257 ) ( CLEAR ?auto_127256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127255 ?auto_127256 ?auto_127257 )
      ( MAKE-6PILE ?auto_127255 ?auto_127256 ?auto_127257 ?auto_127258 ?auto_127259 ?auto_127260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127263 - BLOCK
      ?auto_127264 - BLOCK
      ?auto_127265 - BLOCK
      ?auto_127266 - BLOCK
      ?auto_127267 - BLOCK
      ?auto_127268 - BLOCK
    )
    :vars
    (
      ?auto_127270 - BLOCK
      ?auto_127269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127263 ) ( ON ?auto_127264 ?auto_127263 ) ( not ( = ?auto_127263 ?auto_127264 ) ) ( not ( = ?auto_127263 ?auto_127265 ) ) ( not ( = ?auto_127263 ?auto_127266 ) ) ( not ( = ?auto_127263 ?auto_127267 ) ) ( not ( = ?auto_127263 ?auto_127268 ) ) ( not ( = ?auto_127264 ?auto_127265 ) ) ( not ( = ?auto_127264 ?auto_127266 ) ) ( not ( = ?auto_127264 ?auto_127267 ) ) ( not ( = ?auto_127264 ?auto_127268 ) ) ( not ( = ?auto_127265 ?auto_127266 ) ) ( not ( = ?auto_127265 ?auto_127267 ) ) ( not ( = ?auto_127265 ?auto_127268 ) ) ( not ( = ?auto_127266 ?auto_127267 ) ) ( not ( = ?auto_127266 ?auto_127268 ) ) ( not ( = ?auto_127267 ?auto_127268 ) ) ( ON ?auto_127268 ?auto_127270 ) ( not ( = ?auto_127263 ?auto_127270 ) ) ( not ( = ?auto_127264 ?auto_127270 ) ) ( not ( = ?auto_127265 ?auto_127270 ) ) ( not ( = ?auto_127266 ?auto_127270 ) ) ( not ( = ?auto_127267 ?auto_127270 ) ) ( not ( = ?auto_127268 ?auto_127270 ) ) ( ON ?auto_127267 ?auto_127268 ) ( ON-TABLE ?auto_127269 ) ( ON ?auto_127270 ?auto_127269 ) ( not ( = ?auto_127269 ?auto_127270 ) ) ( not ( = ?auto_127269 ?auto_127268 ) ) ( not ( = ?auto_127269 ?auto_127267 ) ) ( not ( = ?auto_127263 ?auto_127269 ) ) ( not ( = ?auto_127264 ?auto_127269 ) ) ( not ( = ?auto_127265 ?auto_127269 ) ) ( not ( = ?auto_127266 ?auto_127269 ) ) ( ON ?auto_127266 ?auto_127267 ) ( CLEAR ?auto_127264 ) ( ON ?auto_127265 ?auto_127266 ) ( CLEAR ?auto_127265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127269 ?auto_127270 ?auto_127268 ?auto_127267 ?auto_127266 )
      ( MAKE-6PILE ?auto_127263 ?auto_127264 ?auto_127265 ?auto_127266 ?auto_127267 ?auto_127268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127271 - BLOCK
      ?auto_127272 - BLOCK
      ?auto_127273 - BLOCK
      ?auto_127274 - BLOCK
      ?auto_127275 - BLOCK
      ?auto_127276 - BLOCK
    )
    :vars
    (
      ?auto_127278 - BLOCK
      ?auto_127277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127271 ) ( not ( = ?auto_127271 ?auto_127272 ) ) ( not ( = ?auto_127271 ?auto_127273 ) ) ( not ( = ?auto_127271 ?auto_127274 ) ) ( not ( = ?auto_127271 ?auto_127275 ) ) ( not ( = ?auto_127271 ?auto_127276 ) ) ( not ( = ?auto_127272 ?auto_127273 ) ) ( not ( = ?auto_127272 ?auto_127274 ) ) ( not ( = ?auto_127272 ?auto_127275 ) ) ( not ( = ?auto_127272 ?auto_127276 ) ) ( not ( = ?auto_127273 ?auto_127274 ) ) ( not ( = ?auto_127273 ?auto_127275 ) ) ( not ( = ?auto_127273 ?auto_127276 ) ) ( not ( = ?auto_127274 ?auto_127275 ) ) ( not ( = ?auto_127274 ?auto_127276 ) ) ( not ( = ?auto_127275 ?auto_127276 ) ) ( ON ?auto_127276 ?auto_127278 ) ( not ( = ?auto_127271 ?auto_127278 ) ) ( not ( = ?auto_127272 ?auto_127278 ) ) ( not ( = ?auto_127273 ?auto_127278 ) ) ( not ( = ?auto_127274 ?auto_127278 ) ) ( not ( = ?auto_127275 ?auto_127278 ) ) ( not ( = ?auto_127276 ?auto_127278 ) ) ( ON ?auto_127275 ?auto_127276 ) ( ON-TABLE ?auto_127277 ) ( ON ?auto_127278 ?auto_127277 ) ( not ( = ?auto_127277 ?auto_127278 ) ) ( not ( = ?auto_127277 ?auto_127276 ) ) ( not ( = ?auto_127277 ?auto_127275 ) ) ( not ( = ?auto_127271 ?auto_127277 ) ) ( not ( = ?auto_127272 ?auto_127277 ) ) ( not ( = ?auto_127273 ?auto_127277 ) ) ( not ( = ?auto_127274 ?auto_127277 ) ) ( ON ?auto_127274 ?auto_127275 ) ( ON ?auto_127273 ?auto_127274 ) ( CLEAR ?auto_127273 ) ( HOLDING ?auto_127272 ) ( CLEAR ?auto_127271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127271 ?auto_127272 )
      ( MAKE-6PILE ?auto_127271 ?auto_127272 ?auto_127273 ?auto_127274 ?auto_127275 ?auto_127276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127279 - BLOCK
      ?auto_127280 - BLOCK
      ?auto_127281 - BLOCK
      ?auto_127282 - BLOCK
      ?auto_127283 - BLOCK
      ?auto_127284 - BLOCK
    )
    :vars
    (
      ?auto_127286 - BLOCK
      ?auto_127285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127279 ) ( not ( = ?auto_127279 ?auto_127280 ) ) ( not ( = ?auto_127279 ?auto_127281 ) ) ( not ( = ?auto_127279 ?auto_127282 ) ) ( not ( = ?auto_127279 ?auto_127283 ) ) ( not ( = ?auto_127279 ?auto_127284 ) ) ( not ( = ?auto_127280 ?auto_127281 ) ) ( not ( = ?auto_127280 ?auto_127282 ) ) ( not ( = ?auto_127280 ?auto_127283 ) ) ( not ( = ?auto_127280 ?auto_127284 ) ) ( not ( = ?auto_127281 ?auto_127282 ) ) ( not ( = ?auto_127281 ?auto_127283 ) ) ( not ( = ?auto_127281 ?auto_127284 ) ) ( not ( = ?auto_127282 ?auto_127283 ) ) ( not ( = ?auto_127282 ?auto_127284 ) ) ( not ( = ?auto_127283 ?auto_127284 ) ) ( ON ?auto_127284 ?auto_127286 ) ( not ( = ?auto_127279 ?auto_127286 ) ) ( not ( = ?auto_127280 ?auto_127286 ) ) ( not ( = ?auto_127281 ?auto_127286 ) ) ( not ( = ?auto_127282 ?auto_127286 ) ) ( not ( = ?auto_127283 ?auto_127286 ) ) ( not ( = ?auto_127284 ?auto_127286 ) ) ( ON ?auto_127283 ?auto_127284 ) ( ON-TABLE ?auto_127285 ) ( ON ?auto_127286 ?auto_127285 ) ( not ( = ?auto_127285 ?auto_127286 ) ) ( not ( = ?auto_127285 ?auto_127284 ) ) ( not ( = ?auto_127285 ?auto_127283 ) ) ( not ( = ?auto_127279 ?auto_127285 ) ) ( not ( = ?auto_127280 ?auto_127285 ) ) ( not ( = ?auto_127281 ?auto_127285 ) ) ( not ( = ?auto_127282 ?auto_127285 ) ) ( ON ?auto_127282 ?auto_127283 ) ( ON ?auto_127281 ?auto_127282 ) ( CLEAR ?auto_127279 ) ( ON ?auto_127280 ?auto_127281 ) ( CLEAR ?auto_127280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127285 ?auto_127286 ?auto_127284 ?auto_127283 ?auto_127282 ?auto_127281 )
      ( MAKE-6PILE ?auto_127279 ?auto_127280 ?auto_127281 ?auto_127282 ?auto_127283 ?auto_127284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127287 - BLOCK
      ?auto_127288 - BLOCK
      ?auto_127289 - BLOCK
      ?auto_127290 - BLOCK
      ?auto_127291 - BLOCK
      ?auto_127292 - BLOCK
    )
    :vars
    (
      ?auto_127294 - BLOCK
      ?auto_127293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127287 ?auto_127288 ) ) ( not ( = ?auto_127287 ?auto_127289 ) ) ( not ( = ?auto_127287 ?auto_127290 ) ) ( not ( = ?auto_127287 ?auto_127291 ) ) ( not ( = ?auto_127287 ?auto_127292 ) ) ( not ( = ?auto_127288 ?auto_127289 ) ) ( not ( = ?auto_127288 ?auto_127290 ) ) ( not ( = ?auto_127288 ?auto_127291 ) ) ( not ( = ?auto_127288 ?auto_127292 ) ) ( not ( = ?auto_127289 ?auto_127290 ) ) ( not ( = ?auto_127289 ?auto_127291 ) ) ( not ( = ?auto_127289 ?auto_127292 ) ) ( not ( = ?auto_127290 ?auto_127291 ) ) ( not ( = ?auto_127290 ?auto_127292 ) ) ( not ( = ?auto_127291 ?auto_127292 ) ) ( ON ?auto_127292 ?auto_127294 ) ( not ( = ?auto_127287 ?auto_127294 ) ) ( not ( = ?auto_127288 ?auto_127294 ) ) ( not ( = ?auto_127289 ?auto_127294 ) ) ( not ( = ?auto_127290 ?auto_127294 ) ) ( not ( = ?auto_127291 ?auto_127294 ) ) ( not ( = ?auto_127292 ?auto_127294 ) ) ( ON ?auto_127291 ?auto_127292 ) ( ON-TABLE ?auto_127293 ) ( ON ?auto_127294 ?auto_127293 ) ( not ( = ?auto_127293 ?auto_127294 ) ) ( not ( = ?auto_127293 ?auto_127292 ) ) ( not ( = ?auto_127293 ?auto_127291 ) ) ( not ( = ?auto_127287 ?auto_127293 ) ) ( not ( = ?auto_127288 ?auto_127293 ) ) ( not ( = ?auto_127289 ?auto_127293 ) ) ( not ( = ?auto_127290 ?auto_127293 ) ) ( ON ?auto_127290 ?auto_127291 ) ( ON ?auto_127289 ?auto_127290 ) ( ON ?auto_127288 ?auto_127289 ) ( CLEAR ?auto_127288 ) ( HOLDING ?auto_127287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127287 )
      ( MAKE-6PILE ?auto_127287 ?auto_127288 ?auto_127289 ?auto_127290 ?auto_127291 ?auto_127292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127295 - BLOCK
      ?auto_127296 - BLOCK
      ?auto_127297 - BLOCK
      ?auto_127298 - BLOCK
      ?auto_127299 - BLOCK
      ?auto_127300 - BLOCK
    )
    :vars
    (
      ?auto_127301 - BLOCK
      ?auto_127302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127295 ?auto_127296 ) ) ( not ( = ?auto_127295 ?auto_127297 ) ) ( not ( = ?auto_127295 ?auto_127298 ) ) ( not ( = ?auto_127295 ?auto_127299 ) ) ( not ( = ?auto_127295 ?auto_127300 ) ) ( not ( = ?auto_127296 ?auto_127297 ) ) ( not ( = ?auto_127296 ?auto_127298 ) ) ( not ( = ?auto_127296 ?auto_127299 ) ) ( not ( = ?auto_127296 ?auto_127300 ) ) ( not ( = ?auto_127297 ?auto_127298 ) ) ( not ( = ?auto_127297 ?auto_127299 ) ) ( not ( = ?auto_127297 ?auto_127300 ) ) ( not ( = ?auto_127298 ?auto_127299 ) ) ( not ( = ?auto_127298 ?auto_127300 ) ) ( not ( = ?auto_127299 ?auto_127300 ) ) ( ON ?auto_127300 ?auto_127301 ) ( not ( = ?auto_127295 ?auto_127301 ) ) ( not ( = ?auto_127296 ?auto_127301 ) ) ( not ( = ?auto_127297 ?auto_127301 ) ) ( not ( = ?auto_127298 ?auto_127301 ) ) ( not ( = ?auto_127299 ?auto_127301 ) ) ( not ( = ?auto_127300 ?auto_127301 ) ) ( ON ?auto_127299 ?auto_127300 ) ( ON-TABLE ?auto_127302 ) ( ON ?auto_127301 ?auto_127302 ) ( not ( = ?auto_127302 ?auto_127301 ) ) ( not ( = ?auto_127302 ?auto_127300 ) ) ( not ( = ?auto_127302 ?auto_127299 ) ) ( not ( = ?auto_127295 ?auto_127302 ) ) ( not ( = ?auto_127296 ?auto_127302 ) ) ( not ( = ?auto_127297 ?auto_127302 ) ) ( not ( = ?auto_127298 ?auto_127302 ) ) ( ON ?auto_127298 ?auto_127299 ) ( ON ?auto_127297 ?auto_127298 ) ( ON ?auto_127296 ?auto_127297 ) ( ON ?auto_127295 ?auto_127296 ) ( CLEAR ?auto_127295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127302 ?auto_127301 ?auto_127300 ?auto_127299 ?auto_127298 ?auto_127297 ?auto_127296 )
      ( MAKE-6PILE ?auto_127295 ?auto_127296 ?auto_127297 ?auto_127298 ?auto_127299 ?auto_127300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127309 - BLOCK
      ?auto_127310 - BLOCK
      ?auto_127311 - BLOCK
      ?auto_127312 - BLOCK
      ?auto_127313 - BLOCK
      ?auto_127314 - BLOCK
    )
    :vars
    (
      ?auto_127315 - BLOCK
      ?auto_127316 - BLOCK
      ?auto_127317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127309 ?auto_127310 ) ) ( not ( = ?auto_127309 ?auto_127311 ) ) ( not ( = ?auto_127309 ?auto_127312 ) ) ( not ( = ?auto_127309 ?auto_127313 ) ) ( not ( = ?auto_127309 ?auto_127314 ) ) ( not ( = ?auto_127310 ?auto_127311 ) ) ( not ( = ?auto_127310 ?auto_127312 ) ) ( not ( = ?auto_127310 ?auto_127313 ) ) ( not ( = ?auto_127310 ?auto_127314 ) ) ( not ( = ?auto_127311 ?auto_127312 ) ) ( not ( = ?auto_127311 ?auto_127313 ) ) ( not ( = ?auto_127311 ?auto_127314 ) ) ( not ( = ?auto_127312 ?auto_127313 ) ) ( not ( = ?auto_127312 ?auto_127314 ) ) ( not ( = ?auto_127313 ?auto_127314 ) ) ( ON ?auto_127314 ?auto_127315 ) ( not ( = ?auto_127309 ?auto_127315 ) ) ( not ( = ?auto_127310 ?auto_127315 ) ) ( not ( = ?auto_127311 ?auto_127315 ) ) ( not ( = ?auto_127312 ?auto_127315 ) ) ( not ( = ?auto_127313 ?auto_127315 ) ) ( not ( = ?auto_127314 ?auto_127315 ) ) ( ON ?auto_127313 ?auto_127314 ) ( ON-TABLE ?auto_127316 ) ( ON ?auto_127315 ?auto_127316 ) ( not ( = ?auto_127316 ?auto_127315 ) ) ( not ( = ?auto_127316 ?auto_127314 ) ) ( not ( = ?auto_127316 ?auto_127313 ) ) ( not ( = ?auto_127309 ?auto_127316 ) ) ( not ( = ?auto_127310 ?auto_127316 ) ) ( not ( = ?auto_127311 ?auto_127316 ) ) ( not ( = ?auto_127312 ?auto_127316 ) ) ( ON ?auto_127312 ?auto_127313 ) ( ON ?auto_127311 ?auto_127312 ) ( ON ?auto_127310 ?auto_127311 ) ( CLEAR ?auto_127310 ) ( ON ?auto_127309 ?auto_127317 ) ( CLEAR ?auto_127309 ) ( HAND-EMPTY ) ( not ( = ?auto_127309 ?auto_127317 ) ) ( not ( = ?auto_127310 ?auto_127317 ) ) ( not ( = ?auto_127311 ?auto_127317 ) ) ( not ( = ?auto_127312 ?auto_127317 ) ) ( not ( = ?auto_127313 ?auto_127317 ) ) ( not ( = ?auto_127314 ?auto_127317 ) ) ( not ( = ?auto_127315 ?auto_127317 ) ) ( not ( = ?auto_127316 ?auto_127317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127309 ?auto_127317 )
      ( MAKE-6PILE ?auto_127309 ?auto_127310 ?auto_127311 ?auto_127312 ?auto_127313 ?auto_127314 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127318 - BLOCK
      ?auto_127319 - BLOCK
      ?auto_127320 - BLOCK
      ?auto_127321 - BLOCK
      ?auto_127322 - BLOCK
      ?auto_127323 - BLOCK
    )
    :vars
    (
      ?auto_127324 - BLOCK
      ?auto_127325 - BLOCK
      ?auto_127326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127318 ?auto_127319 ) ) ( not ( = ?auto_127318 ?auto_127320 ) ) ( not ( = ?auto_127318 ?auto_127321 ) ) ( not ( = ?auto_127318 ?auto_127322 ) ) ( not ( = ?auto_127318 ?auto_127323 ) ) ( not ( = ?auto_127319 ?auto_127320 ) ) ( not ( = ?auto_127319 ?auto_127321 ) ) ( not ( = ?auto_127319 ?auto_127322 ) ) ( not ( = ?auto_127319 ?auto_127323 ) ) ( not ( = ?auto_127320 ?auto_127321 ) ) ( not ( = ?auto_127320 ?auto_127322 ) ) ( not ( = ?auto_127320 ?auto_127323 ) ) ( not ( = ?auto_127321 ?auto_127322 ) ) ( not ( = ?auto_127321 ?auto_127323 ) ) ( not ( = ?auto_127322 ?auto_127323 ) ) ( ON ?auto_127323 ?auto_127324 ) ( not ( = ?auto_127318 ?auto_127324 ) ) ( not ( = ?auto_127319 ?auto_127324 ) ) ( not ( = ?auto_127320 ?auto_127324 ) ) ( not ( = ?auto_127321 ?auto_127324 ) ) ( not ( = ?auto_127322 ?auto_127324 ) ) ( not ( = ?auto_127323 ?auto_127324 ) ) ( ON ?auto_127322 ?auto_127323 ) ( ON-TABLE ?auto_127325 ) ( ON ?auto_127324 ?auto_127325 ) ( not ( = ?auto_127325 ?auto_127324 ) ) ( not ( = ?auto_127325 ?auto_127323 ) ) ( not ( = ?auto_127325 ?auto_127322 ) ) ( not ( = ?auto_127318 ?auto_127325 ) ) ( not ( = ?auto_127319 ?auto_127325 ) ) ( not ( = ?auto_127320 ?auto_127325 ) ) ( not ( = ?auto_127321 ?auto_127325 ) ) ( ON ?auto_127321 ?auto_127322 ) ( ON ?auto_127320 ?auto_127321 ) ( ON ?auto_127318 ?auto_127326 ) ( CLEAR ?auto_127318 ) ( not ( = ?auto_127318 ?auto_127326 ) ) ( not ( = ?auto_127319 ?auto_127326 ) ) ( not ( = ?auto_127320 ?auto_127326 ) ) ( not ( = ?auto_127321 ?auto_127326 ) ) ( not ( = ?auto_127322 ?auto_127326 ) ) ( not ( = ?auto_127323 ?auto_127326 ) ) ( not ( = ?auto_127324 ?auto_127326 ) ) ( not ( = ?auto_127325 ?auto_127326 ) ) ( HOLDING ?auto_127319 ) ( CLEAR ?auto_127320 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127325 ?auto_127324 ?auto_127323 ?auto_127322 ?auto_127321 ?auto_127320 ?auto_127319 )
      ( MAKE-6PILE ?auto_127318 ?auto_127319 ?auto_127320 ?auto_127321 ?auto_127322 ?auto_127323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127327 - BLOCK
      ?auto_127328 - BLOCK
      ?auto_127329 - BLOCK
      ?auto_127330 - BLOCK
      ?auto_127331 - BLOCK
      ?auto_127332 - BLOCK
    )
    :vars
    (
      ?auto_127335 - BLOCK
      ?auto_127334 - BLOCK
      ?auto_127333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127327 ?auto_127328 ) ) ( not ( = ?auto_127327 ?auto_127329 ) ) ( not ( = ?auto_127327 ?auto_127330 ) ) ( not ( = ?auto_127327 ?auto_127331 ) ) ( not ( = ?auto_127327 ?auto_127332 ) ) ( not ( = ?auto_127328 ?auto_127329 ) ) ( not ( = ?auto_127328 ?auto_127330 ) ) ( not ( = ?auto_127328 ?auto_127331 ) ) ( not ( = ?auto_127328 ?auto_127332 ) ) ( not ( = ?auto_127329 ?auto_127330 ) ) ( not ( = ?auto_127329 ?auto_127331 ) ) ( not ( = ?auto_127329 ?auto_127332 ) ) ( not ( = ?auto_127330 ?auto_127331 ) ) ( not ( = ?auto_127330 ?auto_127332 ) ) ( not ( = ?auto_127331 ?auto_127332 ) ) ( ON ?auto_127332 ?auto_127335 ) ( not ( = ?auto_127327 ?auto_127335 ) ) ( not ( = ?auto_127328 ?auto_127335 ) ) ( not ( = ?auto_127329 ?auto_127335 ) ) ( not ( = ?auto_127330 ?auto_127335 ) ) ( not ( = ?auto_127331 ?auto_127335 ) ) ( not ( = ?auto_127332 ?auto_127335 ) ) ( ON ?auto_127331 ?auto_127332 ) ( ON-TABLE ?auto_127334 ) ( ON ?auto_127335 ?auto_127334 ) ( not ( = ?auto_127334 ?auto_127335 ) ) ( not ( = ?auto_127334 ?auto_127332 ) ) ( not ( = ?auto_127334 ?auto_127331 ) ) ( not ( = ?auto_127327 ?auto_127334 ) ) ( not ( = ?auto_127328 ?auto_127334 ) ) ( not ( = ?auto_127329 ?auto_127334 ) ) ( not ( = ?auto_127330 ?auto_127334 ) ) ( ON ?auto_127330 ?auto_127331 ) ( ON ?auto_127329 ?auto_127330 ) ( ON ?auto_127327 ?auto_127333 ) ( not ( = ?auto_127327 ?auto_127333 ) ) ( not ( = ?auto_127328 ?auto_127333 ) ) ( not ( = ?auto_127329 ?auto_127333 ) ) ( not ( = ?auto_127330 ?auto_127333 ) ) ( not ( = ?auto_127331 ?auto_127333 ) ) ( not ( = ?auto_127332 ?auto_127333 ) ) ( not ( = ?auto_127335 ?auto_127333 ) ) ( not ( = ?auto_127334 ?auto_127333 ) ) ( CLEAR ?auto_127329 ) ( ON ?auto_127328 ?auto_127327 ) ( CLEAR ?auto_127328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127333 ?auto_127327 )
      ( MAKE-6PILE ?auto_127327 ?auto_127328 ?auto_127329 ?auto_127330 ?auto_127331 ?auto_127332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127336 - BLOCK
      ?auto_127337 - BLOCK
      ?auto_127338 - BLOCK
      ?auto_127339 - BLOCK
      ?auto_127340 - BLOCK
      ?auto_127341 - BLOCK
    )
    :vars
    (
      ?auto_127342 - BLOCK
      ?auto_127344 - BLOCK
      ?auto_127343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127336 ?auto_127337 ) ) ( not ( = ?auto_127336 ?auto_127338 ) ) ( not ( = ?auto_127336 ?auto_127339 ) ) ( not ( = ?auto_127336 ?auto_127340 ) ) ( not ( = ?auto_127336 ?auto_127341 ) ) ( not ( = ?auto_127337 ?auto_127338 ) ) ( not ( = ?auto_127337 ?auto_127339 ) ) ( not ( = ?auto_127337 ?auto_127340 ) ) ( not ( = ?auto_127337 ?auto_127341 ) ) ( not ( = ?auto_127338 ?auto_127339 ) ) ( not ( = ?auto_127338 ?auto_127340 ) ) ( not ( = ?auto_127338 ?auto_127341 ) ) ( not ( = ?auto_127339 ?auto_127340 ) ) ( not ( = ?auto_127339 ?auto_127341 ) ) ( not ( = ?auto_127340 ?auto_127341 ) ) ( ON ?auto_127341 ?auto_127342 ) ( not ( = ?auto_127336 ?auto_127342 ) ) ( not ( = ?auto_127337 ?auto_127342 ) ) ( not ( = ?auto_127338 ?auto_127342 ) ) ( not ( = ?auto_127339 ?auto_127342 ) ) ( not ( = ?auto_127340 ?auto_127342 ) ) ( not ( = ?auto_127341 ?auto_127342 ) ) ( ON ?auto_127340 ?auto_127341 ) ( ON-TABLE ?auto_127344 ) ( ON ?auto_127342 ?auto_127344 ) ( not ( = ?auto_127344 ?auto_127342 ) ) ( not ( = ?auto_127344 ?auto_127341 ) ) ( not ( = ?auto_127344 ?auto_127340 ) ) ( not ( = ?auto_127336 ?auto_127344 ) ) ( not ( = ?auto_127337 ?auto_127344 ) ) ( not ( = ?auto_127338 ?auto_127344 ) ) ( not ( = ?auto_127339 ?auto_127344 ) ) ( ON ?auto_127339 ?auto_127340 ) ( ON ?auto_127336 ?auto_127343 ) ( not ( = ?auto_127336 ?auto_127343 ) ) ( not ( = ?auto_127337 ?auto_127343 ) ) ( not ( = ?auto_127338 ?auto_127343 ) ) ( not ( = ?auto_127339 ?auto_127343 ) ) ( not ( = ?auto_127340 ?auto_127343 ) ) ( not ( = ?auto_127341 ?auto_127343 ) ) ( not ( = ?auto_127342 ?auto_127343 ) ) ( not ( = ?auto_127344 ?auto_127343 ) ) ( ON ?auto_127337 ?auto_127336 ) ( CLEAR ?auto_127337 ) ( ON-TABLE ?auto_127343 ) ( HOLDING ?auto_127338 ) ( CLEAR ?auto_127339 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127344 ?auto_127342 ?auto_127341 ?auto_127340 ?auto_127339 ?auto_127338 )
      ( MAKE-6PILE ?auto_127336 ?auto_127337 ?auto_127338 ?auto_127339 ?auto_127340 ?auto_127341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127345 - BLOCK
      ?auto_127346 - BLOCK
      ?auto_127347 - BLOCK
      ?auto_127348 - BLOCK
      ?auto_127349 - BLOCK
      ?auto_127350 - BLOCK
    )
    :vars
    (
      ?auto_127353 - BLOCK
      ?auto_127351 - BLOCK
      ?auto_127352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127345 ?auto_127346 ) ) ( not ( = ?auto_127345 ?auto_127347 ) ) ( not ( = ?auto_127345 ?auto_127348 ) ) ( not ( = ?auto_127345 ?auto_127349 ) ) ( not ( = ?auto_127345 ?auto_127350 ) ) ( not ( = ?auto_127346 ?auto_127347 ) ) ( not ( = ?auto_127346 ?auto_127348 ) ) ( not ( = ?auto_127346 ?auto_127349 ) ) ( not ( = ?auto_127346 ?auto_127350 ) ) ( not ( = ?auto_127347 ?auto_127348 ) ) ( not ( = ?auto_127347 ?auto_127349 ) ) ( not ( = ?auto_127347 ?auto_127350 ) ) ( not ( = ?auto_127348 ?auto_127349 ) ) ( not ( = ?auto_127348 ?auto_127350 ) ) ( not ( = ?auto_127349 ?auto_127350 ) ) ( ON ?auto_127350 ?auto_127353 ) ( not ( = ?auto_127345 ?auto_127353 ) ) ( not ( = ?auto_127346 ?auto_127353 ) ) ( not ( = ?auto_127347 ?auto_127353 ) ) ( not ( = ?auto_127348 ?auto_127353 ) ) ( not ( = ?auto_127349 ?auto_127353 ) ) ( not ( = ?auto_127350 ?auto_127353 ) ) ( ON ?auto_127349 ?auto_127350 ) ( ON-TABLE ?auto_127351 ) ( ON ?auto_127353 ?auto_127351 ) ( not ( = ?auto_127351 ?auto_127353 ) ) ( not ( = ?auto_127351 ?auto_127350 ) ) ( not ( = ?auto_127351 ?auto_127349 ) ) ( not ( = ?auto_127345 ?auto_127351 ) ) ( not ( = ?auto_127346 ?auto_127351 ) ) ( not ( = ?auto_127347 ?auto_127351 ) ) ( not ( = ?auto_127348 ?auto_127351 ) ) ( ON ?auto_127348 ?auto_127349 ) ( ON ?auto_127345 ?auto_127352 ) ( not ( = ?auto_127345 ?auto_127352 ) ) ( not ( = ?auto_127346 ?auto_127352 ) ) ( not ( = ?auto_127347 ?auto_127352 ) ) ( not ( = ?auto_127348 ?auto_127352 ) ) ( not ( = ?auto_127349 ?auto_127352 ) ) ( not ( = ?auto_127350 ?auto_127352 ) ) ( not ( = ?auto_127353 ?auto_127352 ) ) ( not ( = ?auto_127351 ?auto_127352 ) ) ( ON ?auto_127346 ?auto_127345 ) ( ON-TABLE ?auto_127352 ) ( CLEAR ?auto_127348 ) ( ON ?auto_127347 ?auto_127346 ) ( CLEAR ?auto_127347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127352 ?auto_127345 ?auto_127346 )
      ( MAKE-6PILE ?auto_127345 ?auto_127346 ?auto_127347 ?auto_127348 ?auto_127349 ?auto_127350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127354 - BLOCK
      ?auto_127355 - BLOCK
      ?auto_127356 - BLOCK
      ?auto_127357 - BLOCK
      ?auto_127358 - BLOCK
      ?auto_127359 - BLOCK
    )
    :vars
    (
      ?auto_127361 - BLOCK
      ?auto_127362 - BLOCK
      ?auto_127360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127354 ?auto_127355 ) ) ( not ( = ?auto_127354 ?auto_127356 ) ) ( not ( = ?auto_127354 ?auto_127357 ) ) ( not ( = ?auto_127354 ?auto_127358 ) ) ( not ( = ?auto_127354 ?auto_127359 ) ) ( not ( = ?auto_127355 ?auto_127356 ) ) ( not ( = ?auto_127355 ?auto_127357 ) ) ( not ( = ?auto_127355 ?auto_127358 ) ) ( not ( = ?auto_127355 ?auto_127359 ) ) ( not ( = ?auto_127356 ?auto_127357 ) ) ( not ( = ?auto_127356 ?auto_127358 ) ) ( not ( = ?auto_127356 ?auto_127359 ) ) ( not ( = ?auto_127357 ?auto_127358 ) ) ( not ( = ?auto_127357 ?auto_127359 ) ) ( not ( = ?auto_127358 ?auto_127359 ) ) ( ON ?auto_127359 ?auto_127361 ) ( not ( = ?auto_127354 ?auto_127361 ) ) ( not ( = ?auto_127355 ?auto_127361 ) ) ( not ( = ?auto_127356 ?auto_127361 ) ) ( not ( = ?auto_127357 ?auto_127361 ) ) ( not ( = ?auto_127358 ?auto_127361 ) ) ( not ( = ?auto_127359 ?auto_127361 ) ) ( ON ?auto_127358 ?auto_127359 ) ( ON-TABLE ?auto_127362 ) ( ON ?auto_127361 ?auto_127362 ) ( not ( = ?auto_127362 ?auto_127361 ) ) ( not ( = ?auto_127362 ?auto_127359 ) ) ( not ( = ?auto_127362 ?auto_127358 ) ) ( not ( = ?auto_127354 ?auto_127362 ) ) ( not ( = ?auto_127355 ?auto_127362 ) ) ( not ( = ?auto_127356 ?auto_127362 ) ) ( not ( = ?auto_127357 ?auto_127362 ) ) ( ON ?auto_127354 ?auto_127360 ) ( not ( = ?auto_127354 ?auto_127360 ) ) ( not ( = ?auto_127355 ?auto_127360 ) ) ( not ( = ?auto_127356 ?auto_127360 ) ) ( not ( = ?auto_127357 ?auto_127360 ) ) ( not ( = ?auto_127358 ?auto_127360 ) ) ( not ( = ?auto_127359 ?auto_127360 ) ) ( not ( = ?auto_127361 ?auto_127360 ) ) ( not ( = ?auto_127362 ?auto_127360 ) ) ( ON ?auto_127355 ?auto_127354 ) ( ON-TABLE ?auto_127360 ) ( ON ?auto_127356 ?auto_127355 ) ( CLEAR ?auto_127356 ) ( HOLDING ?auto_127357 ) ( CLEAR ?auto_127358 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127362 ?auto_127361 ?auto_127359 ?auto_127358 ?auto_127357 )
      ( MAKE-6PILE ?auto_127354 ?auto_127355 ?auto_127356 ?auto_127357 ?auto_127358 ?auto_127359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127363 - BLOCK
      ?auto_127364 - BLOCK
      ?auto_127365 - BLOCK
      ?auto_127366 - BLOCK
      ?auto_127367 - BLOCK
      ?auto_127368 - BLOCK
    )
    :vars
    (
      ?auto_127371 - BLOCK
      ?auto_127370 - BLOCK
      ?auto_127369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127363 ?auto_127364 ) ) ( not ( = ?auto_127363 ?auto_127365 ) ) ( not ( = ?auto_127363 ?auto_127366 ) ) ( not ( = ?auto_127363 ?auto_127367 ) ) ( not ( = ?auto_127363 ?auto_127368 ) ) ( not ( = ?auto_127364 ?auto_127365 ) ) ( not ( = ?auto_127364 ?auto_127366 ) ) ( not ( = ?auto_127364 ?auto_127367 ) ) ( not ( = ?auto_127364 ?auto_127368 ) ) ( not ( = ?auto_127365 ?auto_127366 ) ) ( not ( = ?auto_127365 ?auto_127367 ) ) ( not ( = ?auto_127365 ?auto_127368 ) ) ( not ( = ?auto_127366 ?auto_127367 ) ) ( not ( = ?auto_127366 ?auto_127368 ) ) ( not ( = ?auto_127367 ?auto_127368 ) ) ( ON ?auto_127368 ?auto_127371 ) ( not ( = ?auto_127363 ?auto_127371 ) ) ( not ( = ?auto_127364 ?auto_127371 ) ) ( not ( = ?auto_127365 ?auto_127371 ) ) ( not ( = ?auto_127366 ?auto_127371 ) ) ( not ( = ?auto_127367 ?auto_127371 ) ) ( not ( = ?auto_127368 ?auto_127371 ) ) ( ON ?auto_127367 ?auto_127368 ) ( ON-TABLE ?auto_127370 ) ( ON ?auto_127371 ?auto_127370 ) ( not ( = ?auto_127370 ?auto_127371 ) ) ( not ( = ?auto_127370 ?auto_127368 ) ) ( not ( = ?auto_127370 ?auto_127367 ) ) ( not ( = ?auto_127363 ?auto_127370 ) ) ( not ( = ?auto_127364 ?auto_127370 ) ) ( not ( = ?auto_127365 ?auto_127370 ) ) ( not ( = ?auto_127366 ?auto_127370 ) ) ( ON ?auto_127363 ?auto_127369 ) ( not ( = ?auto_127363 ?auto_127369 ) ) ( not ( = ?auto_127364 ?auto_127369 ) ) ( not ( = ?auto_127365 ?auto_127369 ) ) ( not ( = ?auto_127366 ?auto_127369 ) ) ( not ( = ?auto_127367 ?auto_127369 ) ) ( not ( = ?auto_127368 ?auto_127369 ) ) ( not ( = ?auto_127371 ?auto_127369 ) ) ( not ( = ?auto_127370 ?auto_127369 ) ) ( ON ?auto_127364 ?auto_127363 ) ( ON-TABLE ?auto_127369 ) ( ON ?auto_127365 ?auto_127364 ) ( CLEAR ?auto_127367 ) ( ON ?auto_127366 ?auto_127365 ) ( CLEAR ?auto_127366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127369 ?auto_127363 ?auto_127364 ?auto_127365 )
      ( MAKE-6PILE ?auto_127363 ?auto_127364 ?auto_127365 ?auto_127366 ?auto_127367 ?auto_127368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127372 - BLOCK
      ?auto_127373 - BLOCK
      ?auto_127374 - BLOCK
      ?auto_127375 - BLOCK
      ?auto_127376 - BLOCK
      ?auto_127377 - BLOCK
    )
    :vars
    (
      ?auto_127378 - BLOCK
      ?auto_127380 - BLOCK
      ?auto_127379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127372 ?auto_127373 ) ) ( not ( = ?auto_127372 ?auto_127374 ) ) ( not ( = ?auto_127372 ?auto_127375 ) ) ( not ( = ?auto_127372 ?auto_127376 ) ) ( not ( = ?auto_127372 ?auto_127377 ) ) ( not ( = ?auto_127373 ?auto_127374 ) ) ( not ( = ?auto_127373 ?auto_127375 ) ) ( not ( = ?auto_127373 ?auto_127376 ) ) ( not ( = ?auto_127373 ?auto_127377 ) ) ( not ( = ?auto_127374 ?auto_127375 ) ) ( not ( = ?auto_127374 ?auto_127376 ) ) ( not ( = ?auto_127374 ?auto_127377 ) ) ( not ( = ?auto_127375 ?auto_127376 ) ) ( not ( = ?auto_127375 ?auto_127377 ) ) ( not ( = ?auto_127376 ?auto_127377 ) ) ( ON ?auto_127377 ?auto_127378 ) ( not ( = ?auto_127372 ?auto_127378 ) ) ( not ( = ?auto_127373 ?auto_127378 ) ) ( not ( = ?auto_127374 ?auto_127378 ) ) ( not ( = ?auto_127375 ?auto_127378 ) ) ( not ( = ?auto_127376 ?auto_127378 ) ) ( not ( = ?auto_127377 ?auto_127378 ) ) ( ON-TABLE ?auto_127380 ) ( ON ?auto_127378 ?auto_127380 ) ( not ( = ?auto_127380 ?auto_127378 ) ) ( not ( = ?auto_127380 ?auto_127377 ) ) ( not ( = ?auto_127380 ?auto_127376 ) ) ( not ( = ?auto_127372 ?auto_127380 ) ) ( not ( = ?auto_127373 ?auto_127380 ) ) ( not ( = ?auto_127374 ?auto_127380 ) ) ( not ( = ?auto_127375 ?auto_127380 ) ) ( ON ?auto_127372 ?auto_127379 ) ( not ( = ?auto_127372 ?auto_127379 ) ) ( not ( = ?auto_127373 ?auto_127379 ) ) ( not ( = ?auto_127374 ?auto_127379 ) ) ( not ( = ?auto_127375 ?auto_127379 ) ) ( not ( = ?auto_127376 ?auto_127379 ) ) ( not ( = ?auto_127377 ?auto_127379 ) ) ( not ( = ?auto_127378 ?auto_127379 ) ) ( not ( = ?auto_127380 ?auto_127379 ) ) ( ON ?auto_127373 ?auto_127372 ) ( ON-TABLE ?auto_127379 ) ( ON ?auto_127374 ?auto_127373 ) ( ON ?auto_127375 ?auto_127374 ) ( CLEAR ?auto_127375 ) ( HOLDING ?auto_127376 ) ( CLEAR ?auto_127377 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127380 ?auto_127378 ?auto_127377 ?auto_127376 )
      ( MAKE-6PILE ?auto_127372 ?auto_127373 ?auto_127374 ?auto_127375 ?auto_127376 ?auto_127377 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127381 - BLOCK
      ?auto_127382 - BLOCK
      ?auto_127383 - BLOCK
      ?auto_127384 - BLOCK
      ?auto_127385 - BLOCK
      ?auto_127386 - BLOCK
    )
    :vars
    (
      ?auto_127387 - BLOCK
      ?auto_127389 - BLOCK
      ?auto_127388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127381 ?auto_127382 ) ) ( not ( = ?auto_127381 ?auto_127383 ) ) ( not ( = ?auto_127381 ?auto_127384 ) ) ( not ( = ?auto_127381 ?auto_127385 ) ) ( not ( = ?auto_127381 ?auto_127386 ) ) ( not ( = ?auto_127382 ?auto_127383 ) ) ( not ( = ?auto_127382 ?auto_127384 ) ) ( not ( = ?auto_127382 ?auto_127385 ) ) ( not ( = ?auto_127382 ?auto_127386 ) ) ( not ( = ?auto_127383 ?auto_127384 ) ) ( not ( = ?auto_127383 ?auto_127385 ) ) ( not ( = ?auto_127383 ?auto_127386 ) ) ( not ( = ?auto_127384 ?auto_127385 ) ) ( not ( = ?auto_127384 ?auto_127386 ) ) ( not ( = ?auto_127385 ?auto_127386 ) ) ( ON ?auto_127386 ?auto_127387 ) ( not ( = ?auto_127381 ?auto_127387 ) ) ( not ( = ?auto_127382 ?auto_127387 ) ) ( not ( = ?auto_127383 ?auto_127387 ) ) ( not ( = ?auto_127384 ?auto_127387 ) ) ( not ( = ?auto_127385 ?auto_127387 ) ) ( not ( = ?auto_127386 ?auto_127387 ) ) ( ON-TABLE ?auto_127389 ) ( ON ?auto_127387 ?auto_127389 ) ( not ( = ?auto_127389 ?auto_127387 ) ) ( not ( = ?auto_127389 ?auto_127386 ) ) ( not ( = ?auto_127389 ?auto_127385 ) ) ( not ( = ?auto_127381 ?auto_127389 ) ) ( not ( = ?auto_127382 ?auto_127389 ) ) ( not ( = ?auto_127383 ?auto_127389 ) ) ( not ( = ?auto_127384 ?auto_127389 ) ) ( ON ?auto_127381 ?auto_127388 ) ( not ( = ?auto_127381 ?auto_127388 ) ) ( not ( = ?auto_127382 ?auto_127388 ) ) ( not ( = ?auto_127383 ?auto_127388 ) ) ( not ( = ?auto_127384 ?auto_127388 ) ) ( not ( = ?auto_127385 ?auto_127388 ) ) ( not ( = ?auto_127386 ?auto_127388 ) ) ( not ( = ?auto_127387 ?auto_127388 ) ) ( not ( = ?auto_127389 ?auto_127388 ) ) ( ON ?auto_127382 ?auto_127381 ) ( ON-TABLE ?auto_127388 ) ( ON ?auto_127383 ?auto_127382 ) ( ON ?auto_127384 ?auto_127383 ) ( CLEAR ?auto_127386 ) ( ON ?auto_127385 ?auto_127384 ) ( CLEAR ?auto_127385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127388 ?auto_127381 ?auto_127382 ?auto_127383 ?auto_127384 )
      ( MAKE-6PILE ?auto_127381 ?auto_127382 ?auto_127383 ?auto_127384 ?auto_127385 ?auto_127386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127390 - BLOCK
      ?auto_127391 - BLOCK
      ?auto_127392 - BLOCK
      ?auto_127393 - BLOCK
      ?auto_127394 - BLOCK
      ?auto_127395 - BLOCK
    )
    :vars
    (
      ?auto_127398 - BLOCK
      ?auto_127397 - BLOCK
      ?auto_127396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127390 ?auto_127391 ) ) ( not ( = ?auto_127390 ?auto_127392 ) ) ( not ( = ?auto_127390 ?auto_127393 ) ) ( not ( = ?auto_127390 ?auto_127394 ) ) ( not ( = ?auto_127390 ?auto_127395 ) ) ( not ( = ?auto_127391 ?auto_127392 ) ) ( not ( = ?auto_127391 ?auto_127393 ) ) ( not ( = ?auto_127391 ?auto_127394 ) ) ( not ( = ?auto_127391 ?auto_127395 ) ) ( not ( = ?auto_127392 ?auto_127393 ) ) ( not ( = ?auto_127392 ?auto_127394 ) ) ( not ( = ?auto_127392 ?auto_127395 ) ) ( not ( = ?auto_127393 ?auto_127394 ) ) ( not ( = ?auto_127393 ?auto_127395 ) ) ( not ( = ?auto_127394 ?auto_127395 ) ) ( not ( = ?auto_127390 ?auto_127398 ) ) ( not ( = ?auto_127391 ?auto_127398 ) ) ( not ( = ?auto_127392 ?auto_127398 ) ) ( not ( = ?auto_127393 ?auto_127398 ) ) ( not ( = ?auto_127394 ?auto_127398 ) ) ( not ( = ?auto_127395 ?auto_127398 ) ) ( ON-TABLE ?auto_127397 ) ( ON ?auto_127398 ?auto_127397 ) ( not ( = ?auto_127397 ?auto_127398 ) ) ( not ( = ?auto_127397 ?auto_127395 ) ) ( not ( = ?auto_127397 ?auto_127394 ) ) ( not ( = ?auto_127390 ?auto_127397 ) ) ( not ( = ?auto_127391 ?auto_127397 ) ) ( not ( = ?auto_127392 ?auto_127397 ) ) ( not ( = ?auto_127393 ?auto_127397 ) ) ( ON ?auto_127390 ?auto_127396 ) ( not ( = ?auto_127390 ?auto_127396 ) ) ( not ( = ?auto_127391 ?auto_127396 ) ) ( not ( = ?auto_127392 ?auto_127396 ) ) ( not ( = ?auto_127393 ?auto_127396 ) ) ( not ( = ?auto_127394 ?auto_127396 ) ) ( not ( = ?auto_127395 ?auto_127396 ) ) ( not ( = ?auto_127398 ?auto_127396 ) ) ( not ( = ?auto_127397 ?auto_127396 ) ) ( ON ?auto_127391 ?auto_127390 ) ( ON-TABLE ?auto_127396 ) ( ON ?auto_127392 ?auto_127391 ) ( ON ?auto_127393 ?auto_127392 ) ( ON ?auto_127394 ?auto_127393 ) ( CLEAR ?auto_127394 ) ( HOLDING ?auto_127395 ) ( CLEAR ?auto_127398 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127397 ?auto_127398 ?auto_127395 )
      ( MAKE-6PILE ?auto_127390 ?auto_127391 ?auto_127392 ?auto_127393 ?auto_127394 ?auto_127395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127399 - BLOCK
      ?auto_127400 - BLOCK
      ?auto_127401 - BLOCK
      ?auto_127402 - BLOCK
      ?auto_127403 - BLOCK
      ?auto_127404 - BLOCK
    )
    :vars
    (
      ?auto_127405 - BLOCK
      ?auto_127407 - BLOCK
      ?auto_127406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127399 ?auto_127400 ) ) ( not ( = ?auto_127399 ?auto_127401 ) ) ( not ( = ?auto_127399 ?auto_127402 ) ) ( not ( = ?auto_127399 ?auto_127403 ) ) ( not ( = ?auto_127399 ?auto_127404 ) ) ( not ( = ?auto_127400 ?auto_127401 ) ) ( not ( = ?auto_127400 ?auto_127402 ) ) ( not ( = ?auto_127400 ?auto_127403 ) ) ( not ( = ?auto_127400 ?auto_127404 ) ) ( not ( = ?auto_127401 ?auto_127402 ) ) ( not ( = ?auto_127401 ?auto_127403 ) ) ( not ( = ?auto_127401 ?auto_127404 ) ) ( not ( = ?auto_127402 ?auto_127403 ) ) ( not ( = ?auto_127402 ?auto_127404 ) ) ( not ( = ?auto_127403 ?auto_127404 ) ) ( not ( = ?auto_127399 ?auto_127405 ) ) ( not ( = ?auto_127400 ?auto_127405 ) ) ( not ( = ?auto_127401 ?auto_127405 ) ) ( not ( = ?auto_127402 ?auto_127405 ) ) ( not ( = ?auto_127403 ?auto_127405 ) ) ( not ( = ?auto_127404 ?auto_127405 ) ) ( ON-TABLE ?auto_127407 ) ( ON ?auto_127405 ?auto_127407 ) ( not ( = ?auto_127407 ?auto_127405 ) ) ( not ( = ?auto_127407 ?auto_127404 ) ) ( not ( = ?auto_127407 ?auto_127403 ) ) ( not ( = ?auto_127399 ?auto_127407 ) ) ( not ( = ?auto_127400 ?auto_127407 ) ) ( not ( = ?auto_127401 ?auto_127407 ) ) ( not ( = ?auto_127402 ?auto_127407 ) ) ( ON ?auto_127399 ?auto_127406 ) ( not ( = ?auto_127399 ?auto_127406 ) ) ( not ( = ?auto_127400 ?auto_127406 ) ) ( not ( = ?auto_127401 ?auto_127406 ) ) ( not ( = ?auto_127402 ?auto_127406 ) ) ( not ( = ?auto_127403 ?auto_127406 ) ) ( not ( = ?auto_127404 ?auto_127406 ) ) ( not ( = ?auto_127405 ?auto_127406 ) ) ( not ( = ?auto_127407 ?auto_127406 ) ) ( ON ?auto_127400 ?auto_127399 ) ( ON-TABLE ?auto_127406 ) ( ON ?auto_127401 ?auto_127400 ) ( ON ?auto_127402 ?auto_127401 ) ( ON ?auto_127403 ?auto_127402 ) ( CLEAR ?auto_127405 ) ( ON ?auto_127404 ?auto_127403 ) ( CLEAR ?auto_127404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127406 ?auto_127399 ?auto_127400 ?auto_127401 ?auto_127402 ?auto_127403 )
      ( MAKE-6PILE ?auto_127399 ?auto_127400 ?auto_127401 ?auto_127402 ?auto_127403 ?auto_127404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127408 - BLOCK
      ?auto_127409 - BLOCK
      ?auto_127410 - BLOCK
      ?auto_127411 - BLOCK
      ?auto_127412 - BLOCK
      ?auto_127413 - BLOCK
    )
    :vars
    (
      ?auto_127415 - BLOCK
      ?auto_127416 - BLOCK
      ?auto_127414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127408 ?auto_127409 ) ) ( not ( = ?auto_127408 ?auto_127410 ) ) ( not ( = ?auto_127408 ?auto_127411 ) ) ( not ( = ?auto_127408 ?auto_127412 ) ) ( not ( = ?auto_127408 ?auto_127413 ) ) ( not ( = ?auto_127409 ?auto_127410 ) ) ( not ( = ?auto_127409 ?auto_127411 ) ) ( not ( = ?auto_127409 ?auto_127412 ) ) ( not ( = ?auto_127409 ?auto_127413 ) ) ( not ( = ?auto_127410 ?auto_127411 ) ) ( not ( = ?auto_127410 ?auto_127412 ) ) ( not ( = ?auto_127410 ?auto_127413 ) ) ( not ( = ?auto_127411 ?auto_127412 ) ) ( not ( = ?auto_127411 ?auto_127413 ) ) ( not ( = ?auto_127412 ?auto_127413 ) ) ( not ( = ?auto_127408 ?auto_127415 ) ) ( not ( = ?auto_127409 ?auto_127415 ) ) ( not ( = ?auto_127410 ?auto_127415 ) ) ( not ( = ?auto_127411 ?auto_127415 ) ) ( not ( = ?auto_127412 ?auto_127415 ) ) ( not ( = ?auto_127413 ?auto_127415 ) ) ( ON-TABLE ?auto_127416 ) ( not ( = ?auto_127416 ?auto_127415 ) ) ( not ( = ?auto_127416 ?auto_127413 ) ) ( not ( = ?auto_127416 ?auto_127412 ) ) ( not ( = ?auto_127408 ?auto_127416 ) ) ( not ( = ?auto_127409 ?auto_127416 ) ) ( not ( = ?auto_127410 ?auto_127416 ) ) ( not ( = ?auto_127411 ?auto_127416 ) ) ( ON ?auto_127408 ?auto_127414 ) ( not ( = ?auto_127408 ?auto_127414 ) ) ( not ( = ?auto_127409 ?auto_127414 ) ) ( not ( = ?auto_127410 ?auto_127414 ) ) ( not ( = ?auto_127411 ?auto_127414 ) ) ( not ( = ?auto_127412 ?auto_127414 ) ) ( not ( = ?auto_127413 ?auto_127414 ) ) ( not ( = ?auto_127415 ?auto_127414 ) ) ( not ( = ?auto_127416 ?auto_127414 ) ) ( ON ?auto_127409 ?auto_127408 ) ( ON-TABLE ?auto_127414 ) ( ON ?auto_127410 ?auto_127409 ) ( ON ?auto_127411 ?auto_127410 ) ( ON ?auto_127412 ?auto_127411 ) ( ON ?auto_127413 ?auto_127412 ) ( CLEAR ?auto_127413 ) ( HOLDING ?auto_127415 ) ( CLEAR ?auto_127416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127416 ?auto_127415 )
      ( MAKE-6PILE ?auto_127408 ?auto_127409 ?auto_127410 ?auto_127411 ?auto_127412 ?auto_127413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127417 - BLOCK
      ?auto_127418 - BLOCK
      ?auto_127419 - BLOCK
      ?auto_127420 - BLOCK
      ?auto_127421 - BLOCK
      ?auto_127422 - BLOCK
    )
    :vars
    (
      ?auto_127425 - BLOCK
      ?auto_127424 - BLOCK
      ?auto_127423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127417 ?auto_127418 ) ) ( not ( = ?auto_127417 ?auto_127419 ) ) ( not ( = ?auto_127417 ?auto_127420 ) ) ( not ( = ?auto_127417 ?auto_127421 ) ) ( not ( = ?auto_127417 ?auto_127422 ) ) ( not ( = ?auto_127418 ?auto_127419 ) ) ( not ( = ?auto_127418 ?auto_127420 ) ) ( not ( = ?auto_127418 ?auto_127421 ) ) ( not ( = ?auto_127418 ?auto_127422 ) ) ( not ( = ?auto_127419 ?auto_127420 ) ) ( not ( = ?auto_127419 ?auto_127421 ) ) ( not ( = ?auto_127419 ?auto_127422 ) ) ( not ( = ?auto_127420 ?auto_127421 ) ) ( not ( = ?auto_127420 ?auto_127422 ) ) ( not ( = ?auto_127421 ?auto_127422 ) ) ( not ( = ?auto_127417 ?auto_127425 ) ) ( not ( = ?auto_127418 ?auto_127425 ) ) ( not ( = ?auto_127419 ?auto_127425 ) ) ( not ( = ?auto_127420 ?auto_127425 ) ) ( not ( = ?auto_127421 ?auto_127425 ) ) ( not ( = ?auto_127422 ?auto_127425 ) ) ( ON-TABLE ?auto_127424 ) ( not ( = ?auto_127424 ?auto_127425 ) ) ( not ( = ?auto_127424 ?auto_127422 ) ) ( not ( = ?auto_127424 ?auto_127421 ) ) ( not ( = ?auto_127417 ?auto_127424 ) ) ( not ( = ?auto_127418 ?auto_127424 ) ) ( not ( = ?auto_127419 ?auto_127424 ) ) ( not ( = ?auto_127420 ?auto_127424 ) ) ( ON ?auto_127417 ?auto_127423 ) ( not ( = ?auto_127417 ?auto_127423 ) ) ( not ( = ?auto_127418 ?auto_127423 ) ) ( not ( = ?auto_127419 ?auto_127423 ) ) ( not ( = ?auto_127420 ?auto_127423 ) ) ( not ( = ?auto_127421 ?auto_127423 ) ) ( not ( = ?auto_127422 ?auto_127423 ) ) ( not ( = ?auto_127425 ?auto_127423 ) ) ( not ( = ?auto_127424 ?auto_127423 ) ) ( ON ?auto_127418 ?auto_127417 ) ( ON-TABLE ?auto_127423 ) ( ON ?auto_127419 ?auto_127418 ) ( ON ?auto_127420 ?auto_127419 ) ( ON ?auto_127421 ?auto_127420 ) ( ON ?auto_127422 ?auto_127421 ) ( CLEAR ?auto_127424 ) ( ON ?auto_127425 ?auto_127422 ) ( CLEAR ?auto_127425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127423 ?auto_127417 ?auto_127418 ?auto_127419 ?auto_127420 ?auto_127421 ?auto_127422 )
      ( MAKE-6PILE ?auto_127417 ?auto_127418 ?auto_127419 ?auto_127420 ?auto_127421 ?auto_127422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127426 - BLOCK
      ?auto_127427 - BLOCK
      ?auto_127428 - BLOCK
      ?auto_127429 - BLOCK
      ?auto_127430 - BLOCK
      ?auto_127431 - BLOCK
    )
    :vars
    (
      ?auto_127432 - BLOCK
      ?auto_127433 - BLOCK
      ?auto_127434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127426 ?auto_127427 ) ) ( not ( = ?auto_127426 ?auto_127428 ) ) ( not ( = ?auto_127426 ?auto_127429 ) ) ( not ( = ?auto_127426 ?auto_127430 ) ) ( not ( = ?auto_127426 ?auto_127431 ) ) ( not ( = ?auto_127427 ?auto_127428 ) ) ( not ( = ?auto_127427 ?auto_127429 ) ) ( not ( = ?auto_127427 ?auto_127430 ) ) ( not ( = ?auto_127427 ?auto_127431 ) ) ( not ( = ?auto_127428 ?auto_127429 ) ) ( not ( = ?auto_127428 ?auto_127430 ) ) ( not ( = ?auto_127428 ?auto_127431 ) ) ( not ( = ?auto_127429 ?auto_127430 ) ) ( not ( = ?auto_127429 ?auto_127431 ) ) ( not ( = ?auto_127430 ?auto_127431 ) ) ( not ( = ?auto_127426 ?auto_127432 ) ) ( not ( = ?auto_127427 ?auto_127432 ) ) ( not ( = ?auto_127428 ?auto_127432 ) ) ( not ( = ?auto_127429 ?auto_127432 ) ) ( not ( = ?auto_127430 ?auto_127432 ) ) ( not ( = ?auto_127431 ?auto_127432 ) ) ( not ( = ?auto_127433 ?auto_127432 ) ) ( not ( = ?auto_127433 ?auto_127431 ) ) ( not ( = ?auto_127433 ?auto_127430 ) ) ( not ( = ?auto_127426 ?auto_127433 ) ) ( not ( = ?auto_127427 ?auto_127433 ) ) ( not ( = ?auto_127428 ?auto_127433 ) ) ( not ( = ?auto_127429 ?auto_127433 ) ) ( ON ?auto_127426 ?auto_127434 ) ( not ( = ?auto_127426 ?auto_127434 ) ) ( not ( = ?auto_127427 ?auto_127434 ) ) ( not ( = ?auto_127428 ?auto_127434 ) ) ( not ( = ?auto_127429 ?auto_127434 ) ) ( not ( = ?auto_127430 ?auto_127434 ) ) ( not ( = ?auto_127431 ?auto_127434 ) ) ( not ( = ?auto_127432 ?auto_127434 ) ) ( not ( = ?auto_127433 ?auto_127434 ) ) ( ON ?auto_127427 ?auto_127426 ) ( ON-TABLE ?auto_127434 ) ( ON ?auto_127428 ?auto_127427 ) ( ON ?auto_127429 ?auto_127428 ) ( ON ?auto_127430 ?auto_127429 ) ( ON ?auto_127431 ?auto_127430 ) ( ON ?auto_127432 ?auto_127431 ) ( CLEAR ?auto_127432 ) ( HOLDING ?auto_127433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127433 )
      ( MAKE-6PILE ?auto_127426 ?auto_127427 ?auto_127428 ?auto_127429 ?auto_127430 ?auto_127431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127435 - BLOCK
      ?auto_127436 - BLOCK
      ?auto_127437 - BLOCK
      ?auto_127438 - BLOCK
      ?auto_127439 - BLOCK
      ?auto_127440 - BLOCK
    )
    :vars
    (
      ?auto_127441 - BLOCK
      ?auto_127443 - BLOCK
      ?auto_127442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127435 ?auto_127436 ) ) ( not ( = ?auto_127435 ?auto_127437 ) ) ( not ( = ?auto_127435 ?auto_127438 ) ) ( not ( = ?auto_127435 ?auto_127439 ) ) ( not ( = ?auto_127435 ?auto_127440 ) ) ( not ( = ?auto_127436 ?auto_127437 ) ) ( not ( = ?auto_127436 ?auto_127438 ) ) ( not ( = ?auto_127436 ?auto_127439 ) ) ( not ( = ?auto_127436 ?auto_127440 ) ) ( not ( = ?auto_127437 ?auto_127438 ) ) ( not ( = ?auto_127437 ?auto_127439 ) ) ( not ( = ?auto_127437 ?auto_127440 ) ) ( not ( = ?auto_127438 ?auto_127439 ) ) ( not ( = ?auto_127438 ?auto_127440 ) ) ( not ( = ?auto_127439 ?auto_127440 ) ) ( not ( = ?auto_127435 ?auto_127441 ) ) ( not ( = ?auto_127436 ?auto_127441 ) ) ( not ( = ?auto_127437 ?auto_127441 ) ) ( not ( = ?auto_127438 ?auto_127441 ) ) ( not ( = ?auto_127439 ?auto_127441 ) ) ( not ( = ?auto_127440 ?auto_127441 ) ) ( not ( = ?auto_127443 ?auto_127441 ) ) ( not ( = ?auto_127443 ?auto_127440 ) ) ( not ( = ?auto_127443 ?auto_127439 ) ) ( not ( = ?auto_127435 ?auto_127443 ) ) ( not ( = ?auto_127436 ?auto_127443 ) ) ( not ( = ?auto_127437 ?auto_127443 ) ) ( not ( = ?auto_127438 ?auto_127443 ) ) ( ON ?auto_127435 ?auto_127442 ) ( not ( = ?auto_127435 ?auto_127442 ) ) ( not ( = ?auto_127436 ?auto_127442 ) ) ( not ( = ?auto_127437 ?auto_127442 ) ) ( not ( = ?auto_127438 ?auto_127442 ) ) ( not ( = ?auto_127439 ?auto_127442 ) ) ( not ( = ?auto_127440 ?auto_127442 ) ) ( not ( = ?auto_127441 ?auto_127442 ) ) ( not ( = ?auto_127443 ?auto_127442 ) ) ( ON ?auto_127436 ?auto_127435 ) ( ON-TABLE ?auto_127442 ) ( ON ?auto_127437 ?auto_127436 ) ( ON ?auto_127438 ?auto_127437 ) ( ON ?auto_127439 ?auto_127438 ) ( ON ?auto_127440 ?auto_127439 ) ( ON ?auto_127441 ?auto_127440 ) ( ON ?auto_127443 ?auto_127441 ) ( CLEAR ?auto_127443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127442 ?auto_127435 ?auto_127436 ?auto_127437 ?auto_127438 ?auto_127439 ?auto_127440 ?auto_127441 )
      ( MAKE-6PILE ?auto_127435 ?auto_127436 ?auto_127437 ?auto_127438 ?auto_127439 ?auto_127440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127455 - BLOCK
    )
    :vars
    (
      ?auto_127456 - BLOCK
      ?auto_127458 - BLOCK
      ?auto_127457 - BLOCK
      ?auto_127461 - BLOCK
      ?auto_127462 - BLOCK
      ?auto_127459 - BLOCK
      ?auto_127460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127456 ?auto_127455 ) ( ON-TABLE ?auto_127455 ) ( not ( = ?auto_127455 ?auto_127456 ) ) ( not ( = ?auto_127455 ?auto_127458 ) ) ( not ( = ?auto_127455 ?auto_127457 ) ) ( not ( = ?auto_127456 ?auto_127458 ) ) ( not ( = ?auto_127456 ?auto_127457 ) ) ( not ( = ?auto_127458 ?auto_127457 ) ) ( ON ?auto_127458 ?auto_127456 ) ( CLEAR ?auto_127458 ) ( HOLDING ?auto_127457 ) ( CLEAR ?auto_127461 ) ( ON-TABLE ?auto_127462 ) ( ON ?auto_127459 ?auto_127462 ) ( ON ?auto_127460 ?auto_127459 ) ( ON ?auto_127461 ?auto_127460 ) ( not ( = ?auto_127462 ?auto_127459 ) ) ( not ( = ?auto_127462 ?auto_127460 ) ) ( not ( = ?auto_127462 ?auto_127461 ) ) ( not ( = ?auto_127462 ?auto_127457 ) ) ( not ( = ?auto_127459 ?auto_127460 ) ) ( not ( = ?auto_127459 ?auto_127461 ) ) ( not ( = ?auto_127459 ?auto_127457 ) ) ( not ( = ?auto_127460 ?auto_127461 ) ) ( not ( = ?auto_127460 ?auto_127457 ) ) ( not ( = ?auto_127461 ?auto_127457 ) ) ( not ( = ?auto_127455 ?auto_127461 ) ) ( not ( = ?auto_127455 ?auto_127462 ) ) ( not ( = ?auto_127455 ?auto_127459 ) ) ( not ( = ?auto_127455 ?auto_127460 ) ) ( not ( = ?auto_127456 ?auto_127461 ) ) ( not ( = ?auto_127456 ?auto_127462 ) ) ( not ( = ?auto_127456 ?auto_127459 ) ) ( not ( = ?auto_127456 ?auto_127460 ) ) ( not ( = ?auto_127458 ?auto_127461 ) ) ( not ( = ?auto_127458 ?auto_127462 ) ) ( not ( = ?auto_127458 ?auto_127459 ) ) ( not ( = ?auto_127458 ?auto_127460 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127462 ?auto_127459 ?auto_127460 ?auto_127461 ?auto_127457 )
      ( MAKE-1PILE ?auto_127455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127463 - BLOCK
    )
    :vars
    (
      ?auto_127465 - BLOCK
      ?auto_127466 - BLOCK
      ?auto_127468 - BLOCK
      ?auto_127464 - BLOCK
      ?auto_127467 - BLOCK
      ?auto_127469 - BLOCK
      ?auto_127470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127465 ?auto_127463 ) ( ON-TABLE ?auto_127463 ) ( not ( = ?auto_127463 ?auto_127465 ) ) ( not ( = ?auto_127463 ?auto_127466 ) ) ( not ( = ?auto_127463 ?auto_127468 ) ) ( not ( = ?auto_127465 ?auto_127466 ) ) ( not ( = ?auto_127465 ?auto_127468 ) ) ( not ( = ?auto_127466 ?auto_127468 ) ) ( ON ?auto_127466 ?auto_127465 ) ( CLEAR ?auto_127464 ) ( ON-TABLE ?auto_127467 ) ( ON ?auto_127469 ?auto_127467 ) ( ON ?auto_127470 ?auto_127469 ) ( ON ?auto_127464 ?auto_127470 ) ( not ( = ?auto_127467 ?auto_127469 ) ) ( not ( = ?auto_127467 ?auto_127470 ) ) ( not ( = ?auto_127467 ?auto_127464 ) ) ( not ( = ?auto_127467 ?auto_127468 ) ) ( not ( = ?auto_127469 ?auto_127470 ) ) ( not ( = ?auto_127469 ?auto_127464 ) ) ( not ( = ?auto_127469 ?auto_127468 ) ) ( not ( = ?auto_127470 ?auto_127464 ) ) ( not ( = ?auto_127470 ?auto_127468 ) ) ( not ( = ?auto_127464 ?auto_127468 ) ) ( not ( = ?auto_127463 ?auto_127464 ) ) ( not ( = ?auto_127463 ?auto_127467 ) ) ( not ( = ?auto_127463 ?auto_127469 ) ) ( not ( = ?auto_127463 ?auto_127470 ) ) ( not ( = ?auto_127465 ?auto_127464 ) ) ( not ( = ?auto_127465 ?auto_127467 ) ) ( not ( = ?auto_127465 ?auto_127469 ) ) ( not ( = ?auto_127465 ?auto_127470 ) ) ( not ( = ?auto_127466 ?auto_127464 ) ) ( not ( = ?auto_127466 ?auto_127467 ) ) ( not ( = ?auto_127466 ?auto_127469 ) ) ( not ( = ?auto_127466 ?auto_127470 ) ) ( ON ?auto_127468 ?auto_127466 ) ( CLEAR ?auto_127468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127463 ?auto_127465 ?auto_127466 )
      ( MAKE-1PILE ?auto_127463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127471 - BLOCK
    )
    :vars
    (
      ?auto_127478 - BLOCK
      ?auto_127473 - BLOCK
      ?auto_127474 - BLOCK
      ?auto_127472 - BLOCK
      ?auto_127477 - BLOCK
      ?auto_127475 - BLOCK
      ?auto_127476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127478 ?auto_127471 ) ( ON-TABLE ?auto_127471 ) ( not ( = ?auto_127471 ?auto_127478 ) ) ( not ( = ?auto_127471 ?auto_127473 ) ) ( not ( = ?auto_127471 ?auto_127474 ) ) ( not ( = ?auto_127478 ?auto_127473 ) ) ( not ( = ?auto_127478 ?auto_127474 ) ) ( not ( = ?auto_127473 ?auto_127474 ) ) ( ON ?auto_127473 ?auto_127478 ) ( ON-TABLE ?auto_127472 ) ( ON ?auto_127477 ?auto_127472 ) ( ON ?auto_127475 ?auto_127477 ) ( not ( = ?auto_127472 ?auto_127477 ) ) ( not ( = ?auto_127472 ?auto_127475 ) ) ( not ( = ?auto_127472 ?auto_127476 ) ) ( not ( = ?auto_127472 ?auto_127474 ) ) ( not ( = ?auto_127477 ?auto_127475 ) ) ( not ( = ?auto_127477 ?auto_127476 ) ) ( not ( = ?auto_127477 ?auto_127474 ) ) ( not ( = ?auto_127475 ?auto_127476 ) ) ( not ( = ?auto_127475 ?auto_127474 ) ) ( not ( = ?auto_127476 ?auto_127474 ) ) ( not ( = ?auto_127471 ?auto_127476 ) ) ( not ( = ?auto_127471 ?auto_127472 ) ) ( not ( = ?auto_127471 ?auto_127477 ) ) ( not ( = ?auto_127471 ?auto_127475 ) ) ( not ( = ?auto_127478 ?auto_127476 ) ) ( not ( = ?auto_127478 ?auto_127472 ) ) ( not ( = ?auto_127478 ?auto_127477 ) ) ( not ( = ?auto_127478 ?auto_127475 ) ) ( not ( = ?auto_127473 ?auto_127476 ) ) ( not ( = ?auto_127473 ?auto_127472 ) ) ( not ( = ?auto_127473 ?auto_127477 ) ) ( not ( = ?auto_127473 ?auto_127475 ) ) ( ON ?auto_127474 ?auto_127473 ) ( CLEAR ?auto_127474 ) ( HOLDING ?auto_127476 ) ( CLEAR ?auto_127475 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127472 ?auto_127477 ?auto_127475 ?auto_127476 )
      ( MAKE-1PILE ?auto_127471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127479 - BLOCK
    )
    :vars
    (
      ?auto_127483 - BLOCK
      ?auto_127481 - BLOCK
      ?auto_127480 - BLOCK
      ?auto_127482 - BLOCK
      ?auto_127485 - BLOCK
      ?auto_127484 - BLOCK
      ?auto_127486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127483 ?auto_127479 ) ( ON-TABLE ?auto_127479 ) ( not ( = ?auto_127479 ?auto_127483 ) ) ( not ( = ?auto_127479 ?auto_127481 ) ) ( not ( = ?auto_127479 ?auto_127480 ) ) ( not ( = ?auto_127483 ?auto_127481 ) ) ( not ( = ?auto_127483 ?auto_127480 ) ) ( not ( = ?auto_127481 ?auto_127480 ) ) ( ON ?auto_127481 ?auto_127483 ) ( ON-TABLE ?auto_127482 ) ( ON ?auto_127485 ?auto_127482 ) ( ON ?auto_127484 ?auto_127485 ) ( not ( = ?auto_127482 ?auto_127485 ) ) ( not ( = ?auto_127482 ?auto_127484 ) ) ( not ( = ?auto_127482 ?auto_127486 ) ) ( not ( = ?auto_127482 ?auto_127480 ) ) ( not ( = ?auto_127485 ?auto_127484 ) ) ( not ( = ?auto_127485 ?auto_127486 ) ) ( not ( = ?auto_127485 ?auto_127480 ) ) ( not ( = ?auto_127484 ?auto_127486 ) ) ( not ( = ?auto_127484 ?auto_127480 ) ) ( not ( = ?auto_127486 ?auto_127480 ) ) ( not ( = ?auto_127479 ?auto_127486 ) ) ( not ( = ?auto_127479 ?auto_127482 ) ) ( not ( = ?auto_127479 ?auto_127485 ) ) ( not ( = ?auto_127479 ?auto_127484 ) ) ( not ( = ?auto_127483 ?auto_127486 ) ) ( not ( = ?auto_127483 ?auto_127482 ) ) ( not ( = ?auto_127483 ?auto_127485 ) ) ( not ( = ?auto_127483 ?auto_127484 ) ) ( not ( = ?auto_127481 ?auto_127486 ) ) ( not ( = ?auto_127481 ?auto_127482 ) ) ( not ( = ?auto_127481 ?auto_127485 ) ) ( not ( = ?auto_127481 ?auto_127484 ) ) ( ON ?auto_127480 ?auto_127481 ) ( CLEAR ?auto_127484 ) ( ON ?auto_127486 ?auto_127480 ) ( CLEAR ?auto_127486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127479 ?auto_127483 ?auto_127481 ?auto_127480 )
      ( MAKE-1PILE ?auto_127479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127487 - BLOCK
    )
    :vars
    (
      ?auto_127493 - BLOCK
      ?auto_127490 - BLOCK
      ?auto_127491 - BLOCK
      ?auto_127492 - BLOCK
      ?auto_127489 - BLOCK
      ?auto_127494 - BLOCK
      ?auto_127488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127493 ?auto_127487 ) ( ON-TABLE ?auto_127487 ) ( not ( = ?auto_127487 ?auto_127493 ) ) ( not ( = ?auto_127487 ?auto_127490 ) ) ( not ( = ?auto_127487 ?auto_127491 ) ) ( not ( = ?auto_127493 ?auto_127490 ) ) ( not ( = ?auto_127493 ?auto_127491 ) ) ( not ( = ?auto_127490 ?auto_127491 ) ) ( ON ?auto_127490 ?auto_127493 ) ( ON-TABLE ?auto_127492 ) ( ON ?auto_127489 ?auto_127492 ) ( not ( = ?auto_127492 ?auto_127489 ) ) ( not ( = ?auto_127492 ?auto_127494 ) ) ( not ( = ?auto_127492 ?auto_127488 ) ) ( not ( = ?auto_127492 ?auto_127491 ) ) ( not ( = ?auto_127489 ?auto_127494 ) ) ( not ( = ?auto_127489 ?auto_127488 ) ) ( not ( = ?auto_127489 ?auto_127491 ) ) ( not ( = ?auto_127494 ?auto_127488 ) ) ( not ( = ?auto_127494 ?auto_127491 ) ) ( not ( = ?auto_127488 ?auto_127491 ) ) ( not ( = ?auto_127487 ?auto_127488 ) ) ( not ( = ?auto_127487 ?auto_127492 ) ) ( not ( = ?auto_127487 ?auto_127489 ) ) ( not ( = ?auto_127487 ?auto_127494 ) ) ( not ( = ?auto_127493 ?auto_127488 ) ) ( not ( = ?auto_127493 ?auto_127492 ) ) ( not ( = ?auto_127493 ?auto_127489 ) ) ( not ( = ?auto_127493 ?auto_127494 ) ) ( not ( = ?auto_127490 ?auto_127488 ) ) ( not ( = ?auto_127490 ?auto_127492 ) ) ( not ( = ?auto_127490 ?auto_127489 ) ) ( not ( = ?auto_127490 ?auto_127494 ) ) ( ON ?auto_127491 ?auto_127490 ) ( ON ?auto_127488 ?auto_127491 ) ( CLEAR ?auto_127488 ) ( HOLDING ?auto_127494 ) ( CLEAR ?auto_127489 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127492 ?auto_127489 ?auto_127494 )
      ( MAKE-1PILE ?auto_127487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127495 - BLOCK
    )
    :vars
    (
      ?auto_127502 - BLOCK
      ?auto_127498 - BLOCK
      ?auto_127501 - BLOCK
      ?auto_127499 - BLOCK
      ?auto_127496 - BLOCK
      ?auto_127497 - BLOCK
      ?auto_127500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127502 ?auto_127495 ) ( ON-TABLE ?auto_127495 ) ( not ( = ?auto_127495 ?auto_127502 ) ) ( not ( = ?auto_127495 ?auto_127498 ) ) ( not ( = ?auto_127495 ?auto_127501 ) ) ( not ( = ?auto_127502 ?auto_127498 ) ) ( not ( = ?auto_127502 ?auto_127501 ) ) ( not ( = ?auto_127498 ?auto_127501 ) ) ( ON ?auto_127498 ?auto_127502 ) ( ON-TABLE ?auto_127499 ) ( ON ?auto_127496 ?auto_127499 ) ( not ( = ?auto_127499 ?auto_127496 ) ) ( not ( = ?auto_127499 ?auto_127497 ) ) ( not ( = ?auto_127499 ?auto_127500 ) ) ( not ( = ?auto_127499 ?auto_127501 ) ) ( not ( = ?auto_127496 ?auto_127497 ) ) ( not ( = ?auto_127496 ?auto_127500 ) ) ( not ( = ?auto_127496 ?auto_127501 ) ) ( not ( = ?auto_127497 ?auto_127500 ) ) ( not ( = ?auto_127497 ?auto_127501 ) ) ( not ( = ?auto_127500 ?auto_127501 ) ) ( not ( = ?auto_127495 ?auto_127500 ) ) ( not ( = ?auto_127495 ?auto_127499 ) ) ( not ( = ?auto_127495 ?auto_127496 ) ) ( not ( = ?auto_127495 ?auto_127497 ) ) ( not ( = ?auto_127502 ?auto_127500 ) ) ( not ( = ?auto_127502 ?auto_127499 ) ) ( not ( = ?auto_127502 ?auto_127496 ) ) ( not ( = ?auto_127502 ?auto_127497 ) ) ( not ( = ?auto_127498 ?auto_127500 ) ) ( not ( = ?auto_127498 ?auto_127499 ) ) ( not ( = ?auto_127498 ?auto_127496 ) ) ( not ( = ?auto_127498 ?auto_127497 ) ) ( ON ?auto_127501 ?auto_127498 ) ( ON ?auto_127500 ?auto_127501 ) ( CLEAR ?auto_127496 ) ( ON ?auto_127497 ?auto_127500 ) ( CLEAR ?auto_127497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127495 ?auto_127502 ?auto_127498 ?auto_127501 ?auto_127500 )
      ( MAKE-1PILE ?auto_127495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127503 - BLOCK
    )
    :vars
    (
      ?auto_127507 - BLOCK
      ?auto_127509 - BLOCK
      ?auto_127504 - BLOCK
      ?auto_127508 - BLOCK
      ?auto_127505 - BLOCK
      ?auto_127510 - BLOCK
      ?auto_127506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127507 ?auto_127503 ) ( ON-TABLE ?auto_127503 ) ( not ( = ?auto_127503 ?auto_127507 ) ) ( not ( = ?auto_127503 ?auto_127509 ) ) ( not ( = ?auto_127503 ?auto_127504 ) ) ( not ( = ?auto_127507 ?auto_127509 ) ) ( not ( = ?auto_127507 ?auto_127504 ) ) ( not ( = ?auto_127509 ?auto_127504 ) ) ( ON ?auto_127509 ?auto_127507 ) ( ON-TABLE ?auto_127508 ) ( not ( = ?auto_127508 ?auto_127505 ) ) ( not ( = ?auto_127508 ?auto_127510 ) ) ( not ( = ?auto_127508 ?auto_127506 ) ) ( not ( = ?auto_127508 ?auto_127504 ) ) ( not ( = ?auto_127505 ?auto_127510 ) ) ( not ( = ?auto_127505 ?auto_127506 ) ) ( not ( = ?auto_127505 ?auto_127504 ) ) ( not ( = ?auto_127510 ?auto_127506 ) ) ( not ( = ?auto_127510 ?auto_127504 ) ) ( not ( = ?auto_127506 ?auto_127504 ) ) ( not ( = ?auto_127503 ?auto_127506 ) ) ( not ( = ?auto_127503 ?auto_127508 ) ) ( not ( = ?auto_127503 ?auto_127505 ) ) ( not ( = ?auto_127503 ?auto_127510 ) ) ( not ( = ?auto_127507 ?auto_127506 ) ) ( not ( = ?auto_127507 ?auto_127508 ) ) ( not ( = ?auto_127507 ?auto_127505 ) ) ( not ( = ?auto_127507 ?auto_127510 ) ) ( not ( = ?auto_127509 ?auto_127506 ) ) ( not ( = ?auto_127509 ?auto_127508 ) ) ( not ( = ?auto_127509 ?auto_127505 ) ) ( not ( = ?auto_127509 ?auto_127510 ) ) ( ON ?auto_127504 ?auto_127509 ) ( ON ?auto_127506 ?auto_127504 ) ( ON ?auto_127510 ?auto_127506 ) ( CLEAR ?auto_127510 ) ( HOLDING ?auto_127505 ) ( CLEAR ?auto_127508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127508 ?auto_127505 )
      ( MAKE-1PILE ?auto_127503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127511 - BLOCK
    )
    :vars
    (
      ?auto_127516 - BLOCK
      ?auto_127515 - BLOCK
      ?auto_127518 - BLOCK
      ?auto_127517 - BLOCK
      ?auto_127513 - BLOCK
      ?auto_127514 - BLOCK
      ?auto_127512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127516 ?auto_127511 ) ( ON-TABLE ?auto_127511 ) ( not ( = ?auto_127511 ?auto_127516 ) ) ( not ( = ?auto_127511 ?auto_127515 ) ) ( not ( = ?auto_127511 ?auto_127518 ) ) ( not ( = ?auto_127516 ?auto_127515 ) ) ( not ( = ?auto_127516 ?auto_127518 ) ) ( not ( = ?auto_127515 ?auto_127518 ) ) ( ON ?auto_127515 ?auto_127516 ) ( ON-TABLE ?auto_127517 ) ( not ( = ?auto_127517 ?auto_127513 ) ) ( not ( = ?auto_127517 ?auto_127514 ) ) ( not ( = ?auto_127517 ?auto_127512 ) ) ( not ( = ?auto_127517 ?auto_127518 ) ) ( not ( = ?auto_127513 ?auto_127514 ) ) ( not ( = ?auto_127513 ?auto_127512 ) ) ( not ( = ?auto_127513 ?auto_127518 ) ) ( not ( = ?auto_127514 ?auto_127512 ) ) ( not ( = ?auto_127514 ?auto_127518 ) ) ( not ( = ?auto_127512 ?auto_127518 ) ) ( not ( = ?auto_127511 ?auto_127512 ) ) ( not ( = ?auto_127511 ?auto_127517 ) ) ( not ( = ?auto_127511 ?auto_127513 ) ) ( not ( = ?auto_127511 ?auto_127514 ) ) ( not ( = ?auto_127516 ?auto_127512 ) ) ( not ( = ?auto_127516 ?auto_127517 ) ) ( not ( = ?auto_127516 ?auto_127513 ) ) ( not ( = ?auto_127516 ?auto_127514 ) ) ( not ( = ?auto_127515 ?auto_127512 ) ) ( not ( = ?auto_127515 ?auto_127517 ) ) ( not ( = ?auto_127515 ?auto_127513 ) ) ( not ( = ?auto_127515 ?auto_127514 ) ) ( ON ?auto_127518 ?auto_127515 ) ( ON ?auto_127512 ?auto_127518 ) ( ON ?auto_127514 ?auto_127512 ) ( CLEAR ?auto_127517 ) ( ON ?auto_127513 ?auto_127514 ) ( CLEAR ?auto_127513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127511 ?auto_127516 ?auto_127515 ?auto_127518 ?auto_127512 ?auto_127514 )
      ( MAKE-1PILE ?auto_127511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127519 - BLOCK
    )
    :vars
    (
      ?auto_127523 - BLOCK
      ?auto_127526 - BLOCK
      ?auto_127525 - BLOCK
      ?auto_127522 - BLOCK
      ?auto_127520 - BLOCK
      ?auto_127524 - BLOCK
      ?auto_127521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127523 ?auto_127519 ) ( ON-TABLE ?auto_127519 ) ( not ( = ?auto_127519 ?auto_127523 ) ) ( not ( = ?auto_127519 ?auto_127526 ) ) ( not ( = ?auto_127519 ?auto_127525 ) ) ( not ( = ?auto_127523 ?auto_127526 ) ) ( not ( = ?auto_127523 ?auto_127525 ) ) ( not ( = ?auto_127526 ?auto_127525 ) ) ( ON ?auto_127526 ?auto_127523 ) ( not ( = ?auto_127522 ?auto_127520 ) ) ( not ( = ?auto_127522 ?auto_127524 ) ) ( not ( = ?auto_127522 ?auto_127521 ) ) ( not ( = ?auto_127522 ?auto_127525 ) ) ( not ( = ?auto_127520 ?auto_127524 ) ) ( not ( = ?auto_127520 ?auto_127521 ) ) ( not ( = ?auto_127520 ?auto_127525 ) ) ( not ( = ?auto_127524 ?auto_127521 ) ) ( not ( = ?auto_127524 ?auto_127525 ) ) ( not ( = ?auto_127521 ?auto_127525 ) ) ( not ( = ?auto_127519 ?auto_127521 ) ) ( not ( = ?auto_127519 ?auto_127522 ) ) ( not ( = ?auto_127519 ?auto_127520 ) ) ( not ( = ?auto_127519 ?auto_127524 ) ) ( not ( = ?auto_127523 ?auto_127521 ) ) ( not ( = ?auto_127523 ?auto_127522 ) ) ( not ( = ?auto_127523 ?auto_127520 ) ) ( not ( = ?auto_127523 ?auto_127524 ) ) ( not ( = ?auto_127526 ?auto_127521 ) ) ( not ( = ?auto_127526 ?auto_127522 ) ) ( not ( = ?auto_127526 ?auto_127520 ) ) ( not ( = ?auto_127526 ?auto_127524 ) ) ( ON ?auto_127525 ?auto_127526 ) ( ON ?auto_127521 ?auto_127525 ) ( ON ?auto_127524 ?auto_127521 ) ( ON ?auto_127520 ?auto_127524 ) ( CLEAR ?auto_127520 ) ( HOLDING ?auto_127522 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127522 )
      ( MAKE-1PILE ?auto_127519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127536 - BLOCK
    )
    :vars
    (
      ?auto_127538 - BLOCK
      ?auto_127540 - BLOCK
      ?auto_127537 - BLOCK
      ?auto_127542 - BLOCK
      ?auto_127543 - BLOCK
      ?auto_127539 - BLOCK
      ?auto_127541 - BLOCK
      ?auto_127544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127538 ?auto_127536 ) ( ON-TABLE ?auto_127536 ) ( not ( = ?auto_127536 ?auto_127538 ) ) ( not ( = ?auto_127536 ?auto_127540 ) ) ( not ( = ?auto_127536 ?auto_127537 ) ) ( not ( = ?auto_127538 ?auto_127540 ) ) ( not ( = ?auto_127538 ?auto_127537 ) ) ( not ( = ?auto_127540 ?auto_127537 ) ) ( ON ?auto_127540 ?auto_127538 ) ( not ( = ?auto_127542 ?auto_127543 ) ) ( not ( = ?auto_127542 ?auto_127539 ) ) ( not ( = ?auto_127542 ?auto_127541 ) ) ( not ( = ?auto_127542 ?auto_127537 ) ) ( not ( = ?auto_127543 ?auto_127539 ) ) ( not ( = ?auto_127543 ?auto_127541 ) ) ( not ( = ?auto_127543 ?auto_127537 ) ) ( not ( = ?auto_127539 ?auto_127541 ) ) ( not ( = ?auto_127539 ?auto_127537 ) ) ( not ( = ?auto_127541 ?auto_127537 ) ) ( not ( = ?auto_127536 ?auto_127541 ) ) ( not ( = ?auto_127536 ?auto_127542 ) ) ( not ( = ?auto_127536 ?auto_127543 ) ) ( not ( = ?auto_127536 ?auto_127539 ) ) ( not ( = ?auto_127538 ?auto_127541 ) ) ( not ( = ?auto_127538 ?auto_127542 ) ) ( not ( = ?auto_127538 ?auto_127543 ) ) ( not ( = ?auto_127538 ?auto_127539 ) ) ( not ( = ?auto_127540 ?auto_127541 ) ) ( not ( = ?auto_127540 ?auto_127542 ) ) ( not ( = ?auto_127540 ?auto_127543 ) ) ( not ( = ?auto_127540 ?auto_127539 ) ) ( ON ?auto_127537 ?auto_127540 ) ( ON ?auto_127541 ?auto_127537 ) ( ON ?auto_127539 ?auto_127541 ) ( ON ?auto_127543 ?auto_127539 ) ( CLEAR ?auto_127543 ) ( ON ?auto_127542 ?auto_127544 ) ( CLEAR ?auto_127542 ) ( HAND-EMPTY ) ( not ( = ?auto_127536 ?auto_127544 ) ) ( not ( = ?auto_127538 ?auto_127544 ) ) ( not ( = ?auto_127540 ?auto_127544 ) ) ( not ( = ?auto_127537 ?auto_127544 ) ) ( not ( = ?auto_127542 ?auto_127544 ) ) ( not ( = ?auto_127543 ?auto_127544 ) ) ( not ( = ?auto_127539 ?auto_127544 ) ) ( not ( = ?auto_127541 ?auto_127544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127542 ?auto_127544 )
      ( MAKE-1PILE ?auto_127536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127545 - BLOCK
    )
    :vars
    (
      ?auto_127549 - BLOCK
      ?auto_127552 - BLOCK
      ?auto_127548 - BLOCK
      ?auto_127546 - BLOCK
      ?auto_127547 - BLOCK
      ?auto_127551 - BLOCK
      ?auto_127550 - BLOCK
      ?auto_127553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127549 ?auto_127545 ) ( ON-TABLE ?auto_127545 ) ( not ( = ?auto_127545 ?auto_127549 ) ) ( not ( = ?auto_127545 ?auto_127552 ) ) ( not ( = ?auto_127545 ?auto_127548 ) ) ( not ( = ?auto_127549 ?auto_127552 ) ) ( not ( = ?auto_127549 ?auto_127548 ) ) ( not ( = ?auto_127552 ?auto_127548 ) ) ( ON ?auto_127552 ?auto_127549 ) ( not ( = ?auto_127546 ?auto_127547 ) ) ( not ( = ?auto_127546 ?auto_127551 ) ) ( not ( = ?auto_127546 ?auto_127550 ) ) ( not ( = ?auto_127546 ?auto_127548 ) ) ( not ( = ?auto_127547 ?auto_127551 ) ) ( not ( = ?auto_127547 ?auto_127550 ) ) ( not ( = ?auto_127547 ?auto_127548 ) ) ( not ( = ?auto_127551 ?auto_127550 ) ) ( not ( = ?auto_127551 ?auto_127548 ) ) ( not ( = ?auto_127550 ?auto_127548 ) ) ( not ( = ?auto_127545 ?auto_127550 ) ) ( not ( = ?auto_127545 ?auto_127546 ) ) ( not ( = ?auto_127545 ?auto_127547 ) ) ( not ( = ?auto_127545 ?auto_127551 ) ) ( not ( = ?auto_127549 ?auto_127550 ) ) ( not ( = ?auto_127549 ?auto_127546 ) ) ( not ( = ?auto_127549 ?auto_127547 ) ) ( not ( = ?auto_127549 ?auto_127551 ) ) ( not ( = ?auto_127552 ?auto_127550 ) ) ( not ( = ?auto_127552 ?auto_127546 ) ) ( not ( = ?auto_127552 ?auto_127547 ) ) ( not ( = ?auto_127552 ?auto_127551 ) ) ( ON ?auto_127548 ?auto_127552 ) ( ON ?auto_127550 ?auto_127548 ) ( ON ?auto_127551 ?auto_127550 ) ( ON ?auto_127546 ?auto_127553 ) ( CLEAR ?auto_127546 ) ( not ( = ?auto_127545 ?auto_127553 ) ) ( not ( = ?auto_127549 ?auto_127553 ) ) ( not ( = ?auto_127552 ?auto_127553 ) ) ( not ( = ?auto_127548 ?auto_127553 ) ) ( not ( = ?auto_127546 ?auto_127553 ) ) ( not ( = ?auto_127547 ?auto_127553 ) ) ( not ( = ?auto_127551 ?auto_127553 ) ) ( not ( = ?auto_127550 ?auto_127553 ) ) ( HOLDING ?auto_127547 ) ( CLEAR ?auto_127551 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127545 ?auto_127549 ?auto_127552 ?auto_127548 ?auto_127550 ?auto_127551 ?auto_127547 )
      ( MAKE-1PILE ?auto_127545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127554 - BLOCK
    )
    :vars
    (
      ?auto_127562 - BLOCK
      ?auto_127557 - BLOCK
      ?auto_127555 - BLOCK
      ?auto_127556 - BLOCK
      ?auto_127560 - BLOCK
      ?auto_127561 - BLOCK
      ?auto_127558 - BLOCK
      ?auto_127559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127562 ?auto_127554 ) ( ON-TABLE ?auto_127554 ) ( not ( = ?auto_127554 ?auto_127562 ) ) ( not ( = ?auto_127554 ?auto_127557 ) ) ( not ( = ?auto_127554 ?auto_127555 ) ) ( not ( = ?auto_127562 ?auto_127557 ) ) ( not ( = ?auto_127562 ?auto_127555 ) ) ( not ( = ?auto_127557 ?auto_127555 ) ) ( ON ?auto_127557 ?auto_127562 ) ( not ( = ?auto_127556 ?auto_127560 ) ) ( not ( = ?auto_127556 ?auto_127561 ) ) ( not ( = ?auto_127556 ?auto_127558 ) ) ( not ( = ?auto_127556 ?auto_127555 ) ) ( not ( = ?auto_127560 ?auto_127561 ) ) ( not ( = ?auto_127560 ?auto_127558 ) ) ( not ( = ?auto_127560 ?auto_127555 ) ) ( not ( = ?auto_127561 ?auto_127558 ) ) ( not ( = ?auto_127561 ?auto_127555 ) ) ( not ( = ?auto_127558 ?auto_127555 ) ) ( not ( = ?auto_127554 ?auto_127558 ) ) ( not ( = ?auto_127554 ?auto_127556 ) ) ( not ( = ?auto_127554 ?auto_127560 ) ) ( not ( = ?auto_127554 ?auto_127561 ) ) ( not ( = ?auto_127562 ?auto_127558 ) ) ( not ( = ?auto_127562 ?auto_127556 ) ) ( not ( = ?auto_127562 ?auto_127560 ) ) ( not ( = ?auto_127562 ?auto_127561 ) ) ( not ( = ?auto_127557 ?auto_127558 ) ) ( not ( = ?auto_127557 ?auto_127556 ) ) ( not ( = ?auto_127557 ?auto_127560 ) ) ( not ( = ?auto_127557 ?auto_127561 ) ) ( ON ?auto_127555 ?auto_127557 ) ( ON ?auto_127558 ?auto_127555 ) ( ON ?auto_127561 ?auto_127558 ) ( ON ?auto_127556 ?auto_127559 ) ( not ( = ?auto_127554 ?auto_127559 ) ) ( not ( = ?auto_127562 ?auto_127559 ) ) ( not ( = ?auto_127557 ?auto_127559 ) ) ( not ( = ?auto_127555 ?auto_127559 ) ) ( not ( = ?auto_127556 ?auto_127559 ) ) ( not ( = ?auto_127560 ?auto_127559 ) ) ( not ( = ?auto_127561 ?auto_127559 ) ) ( not ( = ?auto_127558 ?auto_127559 ) ) ( CLEAR ?auto_127561 ) ( ON ?auto_127560 ?auto_127556 ) ( CLEAR ?auto_127560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127559 ?auto_127556 )
      ( MAKE-1PILE ?auto_127554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127563 - BLOCK
    )
    :vars
    (
      ?auto_127569 - BLOCK
      ?auto_127564 - BLOCK
      ?auto_127566 - BLOCK
      ?auto_127568 - BLOCK
      ?auto_127565 - BLOCK
      ?auto_127571 - BLOCK
      ?auto_127570 - BLOCK
      ?auto_127567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127569 ?auto_127563 ) ( ON-TABLE ?auto_127563 ) ( not ( = ?auto_127563 ?auto_127569 ) ) ( not ( = ?auto_127563 ?auto_127564 ) ) ( not ( = ?auto_127563 ?auto_127566 ) ) ( not ( = ?auto_127569 ?auto_127564 ) ) ( not ( = ?auto_127569 ?auto_127566 ) ) ( not ( = ?auto_127564 ?auto_127566 ) ) ( ON ?auto_127564 ?auto_127569 ) ( not ( = ?auto_127568 ?auto_127565 ) ) ( not ( = ?auto_127568 ?auto_127571 ) ) ( not ( = ?auto_127568 ?auto_127570 ) ) ( not ( = ?auto_127568 ?auto_127566 ) ) ( not ( = ?auto_127565 ?auto_127571 ) ) ( not ( = ?auto_127565 ?auto_127570 ) ) ( not ( = ?auto_127565 ?auto_127566 ) ) ( not ( = ?auto_127571 ?auto_127570 ) ) ( not ( = ?auto_127571 ?auto_127566 ) ) ( not ( = ?auto_127570 ?auto_127566 ) ) ( not ( = ?auto_127563 ?auto_127570 ) ) ( not ( = ?auto_127563 ?auto_127568 ) ) ( not ( = ?auto_127563 ?auto_127565 ) ) ( not ( = ?auto_127563 ?auto_127571 ) ) ( not ( = ?auto_127569 ?auto_127570 ) ) ( not ( = ?auto_127569 ?auto_127568 ) ) ( not ( = ?auto_127569 ?auto_127565 ) ) ( not ( = ?auto_127569 ?auto_127571 ) ) ( not ( = ?auto_127564 ?auto_127570 ) ) ( not ( = ?auto_127564 ?auto_127568 ) ) ( not ( = ?auto_127564 ?auto_127565 ) ) ( not ( = ?auto_127564 ?auto_127571 ) ) ( ON ?auto_127566 ?auto_127564 ) ( ON ?auto_127570 ?auto_127566 ) ( ON ?auto_127568 ?auto_127567 ) ( not ( = ?auto_127563 ?auto_127567 ) ) ( not ( = ?auto_127569 ?auto_127567 ) ) ( not ( = ?auto_127564 ?auto_127567 ) ) ( not ( = ?auto_127566 ?auto_127567 ) ) ( not ( = ?auto_127568 ?auto_127567 ) ) ( not ( = ?auto_127565 ?auto_127567 ) ) ( not ( = ?auto_127571 ?auto_127567 ) ) ( not ( = ?auto_127570 ?auto_127567 ) ) ( ON ?auto_127565 ?auto_127568 ) ( CLEAR ?auto_127565 ) ( ON-TABLE ?auto_127567 ) ( HOLDING ?auto_127571 ) ( CLEAR ?auto_127570 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127563 ?auto_127569 ?auto_127564 ?auto_127566 ?auto_127570 ?auto_127571 )
      ( MAKE-1PILE ?auto_127563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127572 - BLOCK
    )
    :vars
    (
      ?auto_127580 - BLOCK
      ?auto_127579 - BLOCK
      ?auto_127576 - BLOCK
      ?auto_127578 - BLOCK
      ?auto_127573 - BLOCK
      ?auto_127574 - BLOCK
      ?auto_127575 - BLOCK
      ?auto_127577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127580 ?auto_127572 ) ( ON-TABLE ?auto_127572 ) ( not ( = ?auto_127572 ?auto_127580 ) ) ( not ( = ?auto_127572 ?auto_127579 ) ) ( not ( = ?auto_127572 ?auto_127576 ) ) ( not ( = ?auto_127580 ?auto_127579 ) ) ( not ( = ?auto_127580 ?auto_127576 ) ) ( not ( = ?auto_127579 ?auto_127576 ) ) ( ON ?auto_127579 ?auto_127580 ) ( not ( = ?auto_127578 ?auto_127573 ) ) ( not ( = ?auto_127578 ?auto_127574 ) ) ( not ( = ?auto_127578 ?auto_127575 ) ) ( not ( = ?auto_127578 ?auto_127576 ) ) ( not ( = ?auto_127573 ?auto_127574 ) ) ( not ( = ?auto_127573 ?auto_127575 ) ) ( not ( = ?auto_127573 ?auto_127576 ) ) ( not ( = ?auto_127574 ?auto_127575 ) ) ( not ( = ?auto_127574 ?auto_127576 ) ) ( not ( = ?auto_127575 ?auto_127576 ) ) ( not ( = ?auto_127572 ?auto_127575 ) ) ( not ( = ?auto_127572 ?auto_127578 ) ) ( not ( = ?auto_127572 ?auto_127573 ) ) ( not ( = ?auto_127572 ?auto_127574 ) ) ( not ( = ?auto_127580 ?auto_127575 ) ) ( not ( = ?auto_127580 ?auto_127578 ) ) ( not ( = ?auto_127580 ?auto_127573 ) ) ( not ( = ?auto_127580 ?auto_127574 ) ) ( not ( = ?auto_127579 ?auto_127575 ) ) ( not ( = ?auto_127579 ?auto_127578 ) ) ( not ( = ?auto_127579 ?auto_127573 ) ) ( not ( = ?auto_127579 ?auto_127574 ) ) ( ON ?auto_127576 ?auto_127579 ) ( ON ?auto_127575 ?auto_127576 ) ( ON ?auto_127578 ?auto_127577 ) ( not ( = ?auto_127572 ?auto_127577 ) ) ( not ( = ?auto_127580 ?auto_127577 ) ) ( not ( = ?auto_127579 ?auto_127577 ) ) ( not ( = ?auto_127576 ?auto_127577 ) ) ( not ( = ?auto_127578 ?auto_127577 ) ) ( not ( = ?auto_127573 ?auto_127577 ) ) ( not ( = ?auto_127574 ?auto_127577 ) ) ( not ( = ?auto_127575 ?auto_127577 ) ) ( ON ?auto_127573 ?auto_127578 ) ( ON-TABLE ?auto_127577 ) ( CLEAR ?auto_127575 ) ( ON ?auto_127574 ?auto_127573 ) ( CLEAR ?auto_127574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127577 ?auto_127578 ?auto_127573 )
      ( MAKE-1PILE ?auto_127572 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127624 - BLOCK
      ?auto_127625 - BLOCK
      ?auto_127626 - BLOCK
      ?auto_127627 - BLOCK
      ?auto_127628 - BLOCK
      ?auto_127629 - BLOCK
      ?auto_127630 - BLOCK
    )
    :vars
    (
      ?auto_127631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127624 ) ( ON ?auto_127625 ?auto_127624 ) ( ON ?auto_127626 ?auto_127625 ) ( ON ?auto_127627 ?auto_127626 ) ( ON ?auto_127628 ?auto_127627 ) ( not ( = ?auto_127624 ?auto_127625 ) ) ( not ( = ?auto_127624 ?auto_127626 ) ) ( not ( = ?auto_127624 ?auto_127627 ) ) ( not ( = ?auto_127624 ?auto_127628 ) ) ( not ( = ?auto_127624 ?auto_127629 ) ) ( not ( = ?auto_127624 ?auto_127630 ) ) ( not ( = ?auto_127625 ?auto_127626 ) ) ( not ( = ?auto_127625 ?auto_127627 ) ) ( not ( = ?auto_127625 ?auto_127628 ) ) ( not ( = ?auto_127625 ?auto_127629 ) ) ( not ( = ?auto_127625 ?auto_127630 ) ) ( not ( = ?auto_127626 ?auto_127627 ) ) ( not ( = ?auto_127626 ?auto_127628 ) ) ( not ( = ?auto_127626 ?auto_127629 ) ) ( not ( = ?auto_127626 ?auto_127630 ) ) ( not ( = ?auto_127627 ?auto_127628 ) ) ( not ( = ?auto_127627 ?auto_127629 ) ) ( not ( = ?auto_127627 ?auto_127630 ) ) ( not ( = ?auto_127628 ?auto_127629 ) ) ( not ( = ?auto_127628 ?auto_127630 ) ) ( not ( = ?auto_127629 ?auto_127630 ) ) ( ON ?auto_127630 ?auto_127631 ) ( not ( = ?auto_127624 ?auto_127631 ) ) ( not ( = ?auto_127625 ?auto_127631 ) ) ( not ( = ?auto_127626 ?auto_127631 ) ) ( not ( = ?auto_127627 ?auto_127631 ) ) ( not ( = ?auto_127628 ?auto_127631 ) ) ( not ( = ?auto_127629 ?auto_127631 ) ) ( not ( = ?auto_127630 ?auto_127631 ) ) ( CLEAR ?auto_127628 ) ( ON ?auto_127629 ?auto_127630 ) ( CLEAR ?auto_127629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127631 ?auto_127630 )
      ( MAKE-7PILE ?auto_127624 ?auto_127625 ?auto_127626 ?auto_127627 ?auto_127628 ?auto_127629 ?auto_127630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127632 - BLOCK
      ?auto_127633 - BLOCK
      ?auto_127634 - BLOCK
      ?auto_127635 - BLOCK
      ?auto_127636 - BLOCK
      ?auto_127637 - BLOCK
      ?auto_127638 - BLOCK
    )
    :vars
    (
      ?auto_127639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127632 ) ( ON ?auto_127633 ?auto_127632 ) ( ON ?auto_127634 ?auto_127633 ) ( ON ?auto_127635 ?auto_127634 ) ( not ( = ?auto_127632 ?auto_127633 ) ) ( not ( = ?auto_127632 ?auto_127634 ) ) ( not ( = ?auto_127632 ?auto_127635 ) ) ( not ( = ?auto_127632 ?auto_127636 ) ) ( not ( = ?auto_127632 ?auto_127637 ) ) ( not ( = ?auto_127632 ?auto_127638 ) ) ( not ( = ?auto_127633 ?auto_127634 ) ) ( not ( = ?auto_127633 ?auto_127635 ) ) ( not ( = ?auto_127633 ?auto_127636 ) ) ( not ( = ?auto_127633 ?auto_127637 ) ) ( not ( = ?auto_127633 ?auto_127638 ) ) ( not ( = ?auto_127634 ?auto_127635 ) ) ( not ( = ?auto_127634 ?auto_127636 ) ) ( not ( = ?auto_127634 ?auto_127637 ) ) ( not ( = ?auto_127634 ?auto_127638 ) ) ( not ( = ?auto_127635 ?auto_127636 ) ) ( not ( = ?auto_127635 ?auto_127637 ) ) ( not ( = ?auto_127635 ?auto_127638 ) ) ( not ( = ?auto_127636 ?auto_127637 ) ) ( not ( = ?auto_127636 ?auto_127638 ) ) ( not ( = ?auto_127637 ?auto_127638 ) ) ( ON ?auto_127638 ?auto_127639 ) ( not ( = ?auto_127632 ?auto_127639 ) ) ( not ( = ?auto_127633 ?auto_127639 ) ) ( not ( = ?auto_127634 ?auto_127639 ) ) ( not ( = ?auto_127635 ?auto_127639 ) ) ( not ( = ?auto_127636 ?auto_127639 ) ) ( not ( = ?auto_127637 ?auto_127639 ) ) ( not ( = ?auto_127638 ?auto_127639 ) ) ( ON ?auto_127637 ?auto_127638 ) ( CLEAR ?auto_127637 ) ( ON-TABLE ?auto_127639 ) ( HOLDING ?auto_127636 ) ( CLEAR ?auto_127635 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127632 ?auto_127633 ?auto_127634 ?auto_127635 ?auto_127636 )
      ( MAKE-7PILE ?auto_127632 ?auto_127633 ?auto_127634 ?auto_127635 ?auto_127636 ?auto_127637 ?auto_127638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127640 - BLOCK
      ?auto_127641 - BLOCK
      ?auto_127642 - BLOCK
      ?auto_127643 - BLOCK
      ?auto_127644 - BLOCK
      ?auto_127645 - BLOCK
      ?auto_127646 - BLOCK
    )
    :vars
    (
      ?auto_127647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127640 ) ( ON ?auto_127641 ?auto_127640 ) ( ON ?auto_127642 ?auto_127641 ) ( ON ?auto_127643 ?auto_127642 ) ( not ( = ?auto_127640 ?auto_127641 ) ) ( not ( = ?auto_127640 ?auto_127642 ) ) ( not ( = ?auto_127640 ?auto_127643 ) ) ( not ( = ?auto_127640 ?auto_127644 ) ) ( not ( = ?auto_127640 ?auto_127645 ) ) ( not ( = ?auto_127640 ?auto_127646 ) ) ( not ( = ?auto_127641 ?auto_127642 ) ) ( not ( = ?auto_127641 ?auto_127643 ) ) ( not ( = ?auto_127641 ?auto_127644 ) ) ( not ( = ?auto_127641 ?auto_127645 ) ) ( not ( = ?auto_127641 ?auto_127646 ) ) ( not ( = ?auto_127642 ?auto_127643 ) ) ( not ( = ?auto_127642 ?auto_127644 ) ) ( not ( = ?auto_127642 ?auto_127645 ) ) ( not ( = ?auto_127642 ?auto_127646 ) ) ( not ( = ?auto_127643 ?auto_127644 ) ) ( not ( = ?auto_127643 ?auto_127645 ) ) ( not ( = ?auto_127643 ?auto_127646 ) ) ( not ( = ?auto_127644 ?auto_127645 ) ) ( not ( = ?auto_127644 ?auto_127646 ) ) ( not ( = ?auto_127645 ?auto_127646 ) ) ( ON ?auto_127646 ?auto_127647 ) ( not ( = ?auto_127640 ?auto_127647 ) ) ( not ( = ?auto_127641 ?auto_127647 ) ) ( not ( = ?auto_127642 ?auto_127647 ) ) ( not ( = ?auto_127643 ?auto_127647 ) ) ( not ( = ?auto_127644 ?auto_127647 ) ) ( not ( = ?auto_127645 ?auto_127647 ) ) ( not ( = ?auto_127646 ?auto_127647 ) ) ( ON ?auto_127645 ?auto_127646 ) ( ON-TABLE ?auto_127647 ) ( CLEAR ?auto_127643 ) ( ON ?auto_127644 ?auto_127645 ) ( CLEAR ?auto_127644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127647 ?auto_127646 ?auto_127645 )
      ( MAKE-7PILE ?auto_127640 ?auto_127641 ?auto_127642 ?auto_127643 ?auto_127644 ?auto_127645 ?auto_127646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127648 - BLOCK
      ?auto_127649 - BLOCK
      ?auto_127650 - BLOCK
      ?auto_127651 - BLOCK
      ?auto_127652 - BLOCK
      ?auto_127653 - BLOCK
      ?auto_127654 - BLOCK
    )
    :vars
    (
      ?auto_127655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127648 ) ( ON ?auto_127649 ?auto_127648 ) ( ON ?auto_127650 ?auto_127649 ) ( not ( = ?auto_127648 ?auto_127649 ) ) ( not ( = ?auto_127648 ?auto_127650 ) ) ( not ( = ?auto_127648 ?auto_127651 ) ) ( not ( = ?auto_127648 ?auto_127652 ) ) ( not ( = ?auto_127648 ?auto_127653 ) ) ( not ( = ?auto_127648 ?auto_127654 ) ) ( not ( = ?auto_127649 ?auto_127650 ) ) ( not ( = ?auto_127649 ?auto_127651 ) ) ( not ( = ?auto_127649 ?auto_127652 ) ) ( not ( = ?auto_127649 ?auto_127653 ) ) ( not ( = ?auto_127649 ?auto_127654 ) ) ( not ( = ?auto_127650 ?auto_127651 ) ) ( not ( = ?auto_127650 ?auto_127652 ) ) ( not ( = ?auto_127650 ?auto_127653 ) ) ( not ( = ?auto_127650 ?auto_127654 ) ) ( not ( = ?auto_127651 ?auto_127652 ) ) ( not ( = ?auto_127651 ?auto_127653 ) ) ( not ( = ?auto_127651 ?auto_127654 ) ) ( not ( = ?auto_127652 ?auto_127653 ) ) ( not ( = ?auto_127652 ?auto_127654 ) ) ( not ( = ?auto_127653 ?auto_127654 ) ) ( ON ?auto_127654 ?auto_127655 ) ( not ( = ?auto_127648 ?auto_127655 ) ) ( not ( = ?auto_127649 ?auto_127655 ) ) ( not ( = ?auto_127650 ?auto_127655 ) ) ( not ( = ?auto_127651 ?auto_127655 ) ) ( not ( = ?auto_127652 ?auto_127655 ) ) ( not ( = ?auto_127653 ?auto_127655 ) ) ( not ( = ?auto_127654 ?auto_127655 ) ) ( ON ?auto_127653 ?auto_127654 ) ( ON-TABLE ?auto_127655 ) ( ON ?auto_127652 ?auto_127653 ) ( CLEAR ?auto_127652 ) ( HOLDING ?auto_127651 ) ( CLEAR ?auto_127650 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127648 ?auto_127649 ?auto_127650 ?auto_127651 )
      ( MAKE-7PILE ?auto_127648 ?auto_127649 ?auto_127650 ?auto_127651 ?auto_127652 ?auto_127653 ?auto_127654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127656 - BLOCK
      ?auto_127657 - BLOCK
      ?auto_127658 - BLOCK
      ?auto_127659 - BLOCK
      ?auto_127660 - BLOCK
      ?auto_127661 - BLOCK
      ?auto_127662 - BLOCK
    )
    :vars
    (
      ?auto_127663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127656 ) ( ON ?auto_127657 ?auto_127656 ) ( ON ?auto_127658 ?auto_127657 ) ( not ( = ?auto_127656 ?auto_127657 ) ) ( not ( = ?auto_127656 ?auto_127658 ) ) ( not ( = ?auto_127656 ?auto_127659 ) ) ( not ( = ?auto_127656 ?auto_127660 ) ) ( not ( = ?auto_127656 ?auto_127661 ) ) ( not ( = ?auto_127656 ?auto_127662 ) ) ( not ( = ?auto_127657 ?auto_127658 ) ) ( not ( = ?auto_127657 ?auto_127659 ) ) ( not ( = ?auto_127657 ?auto_127660 ) ) ( not ( = ?auto_127657 ?auto_127661 ) ) ( not ( = ?auto_127657 ?auto_127662 ) ) ( not ( = ?auto_127658 ?auto_127659 ) ) ( not ( = ?auto_127658 ?auto_127660 ) ) ( not ( = ?auto_127658 ?auto_127661 ) ) ( not ( = ?auto_127658 ?auto_127662 ) ) ( not ( = ?auto_127659 ?auto_127660 ) ) ( not ( = ?auto_127659 ?auto_127661 ) ) ( not ( = ?auto_127659 ?auto_127662 ) ) ( not ( = ?auto_127660 ?auto_127661 ) ) ( not ( = ?auto_127660 ?auto_127662 ) ) ( not ( = ?auto_127661 ?auto_127662 ) ) ( ON ?auto_127662 ?auto_127663 ) ( not ( = ?auto_127656 ?auto_127663 ) ) ( not ( = ?auto_127657 ?auto_127663 ) ) ( not ( = ?auto_127658 ?auto_127663 ) ) ( not ( = ?auto_127659 ?auto_127663 ) ) ( not ( = ?auto_127660 ?auto_127663 ) ) ( not ( = ?auto_127661 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( ON ?auto_127661 ?auto_127662 ) ( ON-TABLE ?auto_127663 ) ( ON ?auto_127660 ?auto_127661 ) ( CLEAR ?auto_127658 ) ( ON ?auto_127659 ?auto_127660 ) ( CLEAR ?auto_127659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127663 ?auto_127662 ?auto_127661 ?auto_127660 )
      ( MAKE-7PILE ?auto_127656 ?auto_127657 ?auto_127658 ?auto_127659 ?auto_127660 ?auto_127661 ?auto_127662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127664 - BLOCK
      ?auto_127665 - BLOCK
      ?auto_127666 - BLOCK
      ?auto_127667 - BLOCK
      ?auto_127668 - BLOCK
      ?auto_127669 - BLOCK
      ?auto_127670 - BLOCK
    )
    :vars
    (
      ?auto_127671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127664 ) ( ON ?auto_127665 ?auto_127664 ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( not ( = ?auto_127664 ?auto_127666 ) ) ( not ( = ?auto_127664 ?auto_127667 ) ) ( not ( = ?auto_127664 ?auto_127668 ) ) ( not ( = ?auto_127664 ?auto_127669 ) ) ( not ( = ?auto_127664 ?auto_127670 ) ) ( not ( = ?auto_127665 ?auto_127666 ) ) ( not ( = ?auto_127665 ?auto_127667 ) ) ( not ( = ?auto_127665 ?auto_127668 ) ) ( not ( = ?auto_127665 ?auto_127669 ) ) ( not ( = ?auto_127665 ?auto_127670 ) ) ( not ( = ?auto_127666 ?auto_127667 ) ) ( not ( = ?auto_127666 ?auto_127668 ) ) ( not ( = ?auto_127666 ?auto_127669 ) ) ( not ( = ?auto_127666 ?auto_127670 ) ) ( not ( = ?auto_127667 ?auto_127668 ) ) ( not ( = ?auto_127667 ?auto_127669 ) ) ( not ( = ?auto_127667 ?auto_127670 ) ) ( not ( = ?auto_127668 ?auto_127669 ) ) ( not ( = ?auto_127668 ?auto_127670 ) ) ( not ( = ?auto_127669 ?auto_127670 ) ) ( ON ?auto_127670 ?auto_127671 ) ( not ( = ?auto_127664 ?auto_127671 ) ) ( not ( = ?auto_127665 ?auto_127671 ) ) ( not ( = ?auto_127666 ?auto_127671 ) ) ( not ( = ?auto_127667 ?auto_127671 ) ) ( not ( = ?auto_127668 ?auto_127671 ) ) ( not ( = ?auto_127669 ?auto_127671 ) ) ( not ( = ?auto_127670 ?auto_127671 ) ) ( ON ?auto_127669 ?auto_127670 ) ( ON-TABLE ?auto_127671 ) ( ON ?auto_127668 ?auto_127669 ) ( ON ?auto_127667 ?auto_127668 ) ( CLEAR ?auto_127667 ) ( HOLDING ?auto_127666 ) ( CLEAR ?auto_127665 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127664 ?auto_127665 ?auto_127666 )
      ( MAKE-7PILE ?auto_127664 ?auto_127665 ?auto_127666 ?auto_127667 ?auto_127668 ?auto_127669 ?auto_127670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127672 - BLOCK
      ?auto_127673 - BLOCK
      ?auto_127674 - BLOCK
      ?auto_127675 - BLOCK
      ?auto_127676 - BLOCK
      ?auto_127677 - BLOCK
      ?auto_127678 - BLOCK
    )
    :vars
    (
      ?auto_127679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127672 ) ( ON ?auto_127673 ?auto_127672 ) ( not ( = ?auto_127672 ?auto_127673 ) ) ( not ( = ?auto_127672 ?auto_127674 ) ) ( not ( = ?auto_127672 ?auto_127675 ) ) ( not ( = ?auto_127672 ?auto_127676 ) ) ( not ( = ?auto_127672 ?auto_127677 ) ) ( not ( = ?auto_127672 ?auto_127678 ) ) ( not ( = ?auto_127673 ?auto_127674 ) ) ( not ( = ?auto_127673 ?auto_127675 ) ) ( not ( = ?auto_127673 ?auto_127676 ) ) ( not ( = ?auto_127673 ?auto_127677 ) ) ( not ( = ?auto_127673 ?auto_127678 ) ) ( not ( = ?auto_127674 ?auto_127675 ) ) ( not ( = ?auto_127674 ?auto_127676 ) ) ( not ( = ?auto_127674 ?auto_127677 ) ) ( not ( = ?auto_127674 ?auto_127678 ) ) ( not ( = ?auto_127675 ?auto_127676 ) ) ( not ( = ?auto_127675 ?auto_127677 ) ) ( not ( = ?auto_127675 ?auto_127678 ) ) ( not ( = ?auto_127676 ?auto_127677 ) ) ( not ( = ?auto_127676 ?auto_127678 ) ) ( not ( = ?auto_127677 ?auto_127678 ) ) ( ON ?auto_127678 ?auto_127679 ) ( not ( = ?auto_127672 ?auto_127679 ) ) ( not ( = ?auto_127673 ?auto_127679 ) ) ( not ( = ?auto_127674 ?auto_127679 ) ) ( not ( = ?auto_127675 ?auto_127679 ) ) ( not ( = ?auto_127676 ?auto_127679 ) ) ( not ( = ?auto_127677 ?auto_127679 ) ) ( not ( = ?auto_127678 ?auto_127679 ) ) ( ON ?auto_127677 ?auto_127678 ) ( ON-TABLE ?auto_127679 ) ( ON ?auto_127676 ?auto_127677 ) ( ON ?auto_127675 ?auto_127676 ) ( CLEAR ?auto_127673 ) ( ON ?auto_127674 ?auto_127675 ) ( CLEAR ?auto_127674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127679 ?auto_127678 ?auto_127677 ?auto_127676 ?auto_127675 )
      ( MAKE-7PILE ?auto_127672 ?auto_127673 ?auto_127674 ?auto_127675 ?auto_127676 ?auto_127677 ?auto_127678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127680 - BLOCK
      ?auto_127681 - BLOCK
      ?auto_127682 - BLOCK
      ?auto_127683 - BLOCK
      ?auto_127684 - BLOCK
      ?auto_127685 - BLOCK
      ?auto_127686 - BLOCK
    )
    :vars
    (
      ?auto_127687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127680 ) ( not ( = ?auto_127680 ?auto_127681 ) ) ( not ( = ?auto_127680 ?auto_127682 ) ) ( not ( = ?auto_127680 ?auto_127683 ) ) ( not ( = ?auto_127680 ?auto_127684 ) ) ( not ( = ?auto_127680 ?auto_127685 ) ) ( not ( = ?auto_127680 ?auto_127686 ) ) ( not ( = ?auto_127681 ?auto_127682 ) ) ( not ( = ?auto_127681 ?auto_127683 ) ) ( not ( = ?auto_127681 ?auto_127684 ) ) ( not ( = ?auto_127681 ?auto_127685 ) ) ( not ( = ?auto_127681 ?auto_127686 ) ) ( not ( = ?auto_127682 ?auto_127683 ) ) ( not ( = ?auto_127682 ?auto_127684 ) ) ( not ( = ?auto_127682 ?auto_127685 ) ) ( not ( = ?auto_127682 ?auto_127686 ) ) ( not ( = ?auto_127683 ?auto_127684 ) ) ( not ( = ?auto_127683 ?auto_127685 ) ) ( not ( = ?auto_127683 ?auto_127686 ) ) ( not ( = ?auto_127684 ?auto_127685 ) ) ( not ( = ?auto_127684 ?auto_127686 ) ) ( not ( = ?auto_127685 ?auto_127686 ) ) ( ON ?auto_127686 ?auto_127687 ) ( not ( = ?auto_127680 ?auto_127687 ) ) ( not ( = ?auto_127681 ?auto_127687 ) ) ( not ( = ?auto_127682 ?auto_127687 ) ) ( not ( = ?auto_127683 ?auto_127687 ) ) ( not ( = ?auto_127684 ?auto_127687 ) ) ( not ( = ?auto_127685 ?auto_127687 ) ) ( not ( = ?auto_127686 ?auto_127687 ) ) ( ON ?auto_127685 ?auto_127686 ) ( ON-TABLE ?auto_127687 ) ( ON ?auto_127684 ?auto_127685 ) ( ON ?auto_127683 ?auto_127684 ) ( ON ?auto_127682 ?auto_127683 ) ( CLEAR ?auto_127682 ) ( HOLDING ?auto_127681 ) ( CLEAR ?auto_127680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127680 ?auto_127681 )
      ( MAKE-7PILE ?auto_127680 ?auto_127681 ?auto_127682 ?auto_127683 ?auto_127684 ?auto_127685 ?auto_127686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127688 - BLOCK
      ?auto_127689 - BLOCK
      ?auto_127690 - BLOCK
      ?auto_127691 - BLOCK
      ?auto_127692 - BLOCK
      ?auto_127693 - BLOCK
      ?auto_127694 - BLOCK
    )
    :vars
    (
      ?auto_127695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127688 ) ( not ( = ?auto_127688 ?auto_127689 ) ) ( not ( = ?auto_127688 ?auto_127690 ) ) ( not ( = ?auto_127688 ?auto_127691 ) ) ( not ( = ?auto_127688 ?auto_127692 ) ) ( not ( = ?auto_127688 ?auto_127693 ) ) ( not ( = ?auto_127688 ?auto_127694 ) ) ( not ( = ?auto_127689 ?auto_127690 ) ) ( not ( = ?auto_127689 ?auto_127691 ) ) ( not ( = ?auto_127689 ?auto_127692 ) ) ( not ( = ?auto_127689 ?auto_127693 ) ) ( not ( = ?auto_127689 ?auto_127694 ) ) ( not ( = ?auto_127690 ?auto_127691 ) ) ( not ( = ?auto_127690 ?auto_127692 ) ) ( not ( = ?auto_127690 ?auto_127693 ) ) ( not ( = ?auto_127690 ?auto_127694 ) ) ( not ( = ?auto_127691 ?auto_127692 ) ) ( not ( = ?auto_127691 ?auto_127693 ) ) ( not ( = ?auto_127691 ?auto_127694 ) ) ( not ( = ?auto_127692 ?auto_127693 ) ) ( not ( = ?auto_127692 ?auto_127694 ) ) ( not ( = ?auto_127693 ?auto_127694 ) ) ( ON ?auto_127694 ?auto_127695 ) ( not ( = ?auto_127688 ?auto_127695 ) ) ( not ( = ?auto_127689 ?auto_127695 ) ) ( not ( = ?auto_127690 ?auto_127695 ) ) ( not ( = ?auto_127691 ?auto_127695 ) ) ( not ( = ?auto_127692 ?auto_127695 ) ) ( not ( = ?auto_127693 ?auto_127695 ) ) ( not ( = ?auto_127694 ?auto_127695 ) ) ( ON ?auto_127693 ?auto_127694 ) ( ON-TABLE ?auto_127695 ) ( ON ?auto_127692 ?auto_127693 ) ( ON ?auto_127691 ?auto_127692 ) ( ON ?auto_127690 ?auto_127691 ) ( CLEAR ?auto_127688 ) ( ON ?auto_127689 ?auto_127690 ) ( CLEAR ?auto_127689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127695 ?auto_127694 ?auto_127693 ?auto_127692 ?auto_127691 ?auto_127690 )
      ( MAKE-7PILE ?auto_127688 ?auto_127689 ?auto_127690 ?auto_127691 ?auto_127692 ?auto_127693 ?auto_127694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127696 - BLOCK
      ?auto_127697 - BLOCK
      ?auto_127698 - BLOCK
      ?auto_127699 - BLOCK
      ?auto_127700 - BLOCK
      ?auto_127701 - BLOCK
      ?auto_127702 - BLOCK
    )
    :vars
    (
      ?auto_127703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127696 ?auto_127697 ) ) ( not ( = ?auto_127696 ?auto_127698 ) ) ( not ( = ?auto_127696 ?auto_127699 ) ) ( not ( = ?auto_127696 ?auto_127700 ) ) ( not ( = ?auto_127696 ?auto_127701 ) ) ( not ( = ?auto_127696 ?auto_127702 ) ) ( not ( = ?auto_127697 ?auto_127698 ) ) ( not ( = ?auto_127697 ?auto_127699 ) ) ( not ( = ?auto_127697 ?auto_127700 ) ) ( not ( = ?auto_127697 ?auto_127701 ) ) ( not ( = ?auto_127697 ?auto_127702 ) ) ( not ( = ?auto_127698 ?auto_127699 ) ) ( not ( = ?auto_127698 ?auto_127700 ) ) ( not ( = ?auto_127698 ?auto_127701 ) ) ( not ( = ?auto_127698 ?auto_127702 ) ) ( not ( = ?auto_127699 ?auto_127700 ) ) ( not ( = ?auto_127699 ?auto_127701 ) ) ( not ( = ?auto_127699 ?auto_127702 ) ) ( not ( = ?auto_127700 ?auto_127701 ) ) ( not ( = ?auto_127700 ?auto_127702 ) ) ( not ( = ?auto_127701 ?auto_127702 ) ) ( ON ?auto_127702 ?auto_127703 ) ( not ( = ?auto_127696 ?auto_127703 ) ) ( not ( = ?auto_127697 ?auto_127703 ) ) ( not ( = ?auto_127698 ?auto_127703 ) ) ( not ( = ?auto_127699 ?auto_127703 ) ) ( not ( = ?auto_127700 ?auto_127703 ) ) ( not ( = ?auto_127701 ?auto_127703 ) ) ( not ( = ?auto_127702 ?auto_127703 ) ) ( ON ?auto_127701 ?auto_127702 ) ( ON-TABLE ?auto_127703 ) ( ON ?auto_127700 ?auto_127701 ) ( ON ?auto_127699 ?auto_127700 ) ( ON ?auto_127698 ?auto_127699 ) ( ON ?auto_127697 ?auto_127698 ) ( CLEAR ?auto_127697 ) ( HOLDING ?auto_127696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127696 )
      ( MAKE-7PILE ?auto_127696 ?auto_127697 ?auto_127698 ?auto_127699 ?auto_127700 ?auto_127701 ?auto_127702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127704 - BLOCK
      ?auto_127705 - BLOCK
      ?auto_127706 - BLOCK
      ?auto_127707 - BLOCK
      ?auto_127708 - BLOCK
      ?auto_127709 - BLOCK
      ?auto_127710 - BLOCK
    )
    :vars
    (
      ?auto_127711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127704 ?auto_127705 ) ) ( not ( = ?auto_127704 ?auto_127706 ) ) ( not ( = ?auto_127704 ?auto_127707 ) ) ( not ( = ?auto_127704 ?auto_127708 ) ) ( not ( = ?auto_127704 ?auto_127709 ) ) ( not ( = ?auto_127704 ?auto_127710 ) ) ( not ( = ?auto_127705 ?auto_127706 ) ) ( not ( = ?auto_127705 ?auto_127707 ) ) ( not ( = ?auto_127705 ?auto_127708 ) ) ( not ( = ?auto_127705 ?auto_127709 ) ) ( not ( = ?auto_127705 ?auto_127710 ) ) ( not ( = ?auto_127706 ?auto_127707 ) ) ( not ( = ?auto_127706 ?auto_127708 ) ) ( not ( = ?auto_127706 ?auto_127709 ) ) ( not ( = ?auto_127706 ?auto_127710 ) ) ( not ( = ?auto_127707 ?auto_127708 ) ) ( not ( = ?auto_127707 ?auto_127709 ) ) ( not ( = ?auto_127707 ?auto_127710 ) ) ( not ( = ?auto_127708 ?auto_127709 ) ) ( not ( = ?auto_127708 ?auto_127710 ) ) ( not ( = ?auto_127709 ?auto_127710 ) ) ( ON ?auto_127710 ?auto_127711 ) ( not ( = ?auto_127704 ?auto_127711 ) ) ( not ( = ?auto_127705 ?auto_127711 ) ) ( not ( = ?auto_127706 ?auto_127711 ) ) ( not ( = ?auto_127707 ?auto_127711 ) ) ( not ( = ?auto_127708 ?auto_127711 ) ) ( not ( = ?auto_127709 ?auto_127711 ) ) ( not ( = ?auto_127710 ?auto_127711 ) ) ( ON ?auto_127709 ?auto_127710 ) ( ON-TABLE ?auto_127711 ) ( ON ?auto_127708 ?auto_127709 ) ( ON ?auto_127707 ?auto_127708 ) ( ON ?auto_127706 ?auto_127707 ) ( ON ?auto_127705 ?auto_127706 ) ( ON ?auto_127704 ?auto_127705 ) ( CLEAR ?auto_127704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127711 ?auto_127710 ?auto_127709 ?auto_127708 ?auto_127707 ?auto_127706 ?auto_127705 )
      ( MAKE-7PILE ?auto_127704 ?auto_127705 ?auto_127706 ?auto_127707 ?auto_127708 ?auto_127709 ?auto_127710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127719 - BLOCK
      ?auto_127720 - BLOCK
      ?auto_127721 - BLOCK
      ?auto_127722 - BLOCK
      ?auto_127723 - BLOCK
      ?auto_127724 - BLOCK
      ?auto_127725 - BLOCK
    )
    :vars
    (
      ?auto_127726 - BLOCK
      ?auto_127727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127719 ?auto_127720 ) ) ( not ( = ?auto_127719 ?auto_127721 ) ) ( not ( = ?auto_127719 ?auto_127722 ) ) ( not ( = ?auto_127719 ?auto_127723 ) ) ( not ( = ?auto_127719 ?auto_127724 ) ) ( not ( = ?auto_127719 ?auto_127725 ) ) ( not ( = ?auto_127720 ?auto_127721 ) ) ( not ( = ?auto_127720 ?auto_127722 ) ) ( not ( = ?auto_127720 ?auto_127723 ) ) ( not ( = ?auto_127720 ?auto_127724 ) ) ( not ( = ?auto_127720 ?auto_127725 ) ) ( not ( = ?auto_127721 ?auto_127722 ) ) ( not ( = ?auto_127721 ?auto_127723 ) ) ( not ( = ?auto_127721 ?auto_127724 ) ) ( not ( = ?auto_127721 ?auto_127725 ) ) ( not ( = ?auto_127722 ?auto_127723 ) ) ( not ( = ?auto_127722 ?auto_127724 ) ) ( not ( = ?auto_127722 ?auto_127725 ) ) ( not ( = ?auto_127723 ?auto_127724 ) ) ( not ( = ?auto_127723 ?auto_127725 ) ) ( not ( = ?auto_127724 ?auto_127725 ) ) ( ON ?auto_127725 ?auto_127726 ) ( not ( = ?auto_127719 ?auto_127726 ) ) ( not ( = ?auto_127720 ?auto_127726 ) ) ( not ( = ?auto_127721 ?auto_127726 ) ) ( not ( = ?auto_127722 ?auto_127726 ) ) ( not ( = ?auto_127723 ?auto_127726 ) ) ( not ( = ?auto_127724 ?auto_127726 ) ) ( not ( = ?auto_127725 ?auto_127726 ) ) ( ON ?auto_127724 ?auto_127725 ) ( ON-TABLE ?auto_127726 ) ( ON ?auto_127723 ?auto_127724 ) ( ON ?auto_127722 ?auto_127723 ) ( ON ?auto_127721 ?auto_127722 ) ( ON ?auto_127720 ?auto_127721 ) ( CLEAR ?auto_127720 ) ( ON ?auto_127719 ?auto_127727 ) ( CLEAR ?auto_127719 ) ( HAND-EMPTY ) ( not ( = ?auto_127719 ?auto_127727 ) ) ( not ( = ?auto_127720 ?auto_127727 ) ) ( not ( = ?auto_127721 ?auto_127727 ) ) ( not ( = ?auto_127722 ?auto_127727 ) ) ( not ( = ?auto_127723 ?auto_127727 ) ) ( not ( = ?auto_127724 ?auto_127727 ) ) ( not ( = ?auto_127725 ?auto_127727 ) ) ( not ( = ?auto_127726 ?auto_127727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127719 ?auto_127727 )
      ( MAKE-7PILE ?auto_127719 ?auto_127720 ?auto_127721 ?auto_127722 ?auto_127723 ?auto_127724 ?auto_127725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127728 - BLOCK
      ?auto_127729 - BLOCK
      ?auto_127730 - BLOCK
      ?auto_127731 - BLOCK
      ?auto_127732 - BLOCK
      ?auto_127733 - BLOCK
      ?auto_127734 - BLOCK
    )
    :vars
    (
      ?auto_127735 - BLOCK
      ?auto_127736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127728 ?auto_127729 ) ) ( not ( = ?auto_127728 ?auto_127730 ) ) ( not ( = ?auto_127728 ?auto_127731 ) ) ( not ( = ?auto_127728 ?auto_127732 ) ) ( not ( = ?auto_127728 ?auto_127733 ) ) ( not ( = ?auto_127728 ?auto_127734 ) ) ( not ( = ?auto_127729 ?auto_127730 ) ) ( not ( = ?auto_127729 ?auto_127731 ) ) ( not ( = ?auto_127729 ?auto_127732 ) ) ( not ( = ?auto_127729 ?auto_127733 ) ) ( not ( = ?auto_127729 ?auto_127734 ) ) ( not ( = ?auto_127730 ?auto_127731 ) ) ( not ( = ?auto_127730 ?auto_127732 ) ) ( not ( = ?auto_127730 ?auto_127733 ) ) ( not ( = ?auto_127730 ?auto_127734 ) ) ( not ( = ?auto_127731 ?auto_127732 ) ) ( not ( = ?auto_127731 ?auto_127733 ) ) ( not ( = ?auto_127731 ?auto_127734 ) ) ( not ( = ?auto_127732 ?auto_127733 ) ) ( not ( = ?auto_127732 ?auto_127734 ) ) ( not ( = ?auto_127733 ?auto_127734 ) ) ( ON ?auto_127734 ?auto_127735 ) ( not ( = ?auto_127728 ?auto_127735 ) ) ( not ( = ?auto_127729 ?auto_127735 ) ) ( not ( = ?auto_127730 ?auto_127735 ) ) ( not ( = ?auto_127731 ?auto_127735 ) ) ( not ( = ?auto_127732 ?auto_127735 ) ) ( not ( = ?auto_127733 ?auto_127735 ) ) ( not ( = ?auto_127734 ?auto_127735 ) ) ( ON ?auto_127733 ?auto_127734 ) ( ON-TABLE ?auto_127735 ) ( ON ?auto_127732 ?auto_127733 ) ( ON ?auto_127731 ?auto_127732 ) ( ON ?auto_127730 ?auto_127731 ) ( ON ?auto_127728 ?auto_127736 ) ( CLEAR ?auto_127728 ) ( not ( = ?auto_127728 ?auto_127736 ) ) ( not ( = ?auto_127729 ?auto_127736 ) ) ( not ( = ?auto_127730 ?auto_127736 ) ) ( not ( = ?auto_127731 ?auto_127736 ) ) ( not ( = ?auto_127732 ?auto_127736 ) ) ( not ( = ?auto_127733 ?auto_127736 ) ) ( not ( = ?auto_127734 ?auto_127736 ) ) ( not ( = ?auto_127735 ?auto_127736 ) ) ( HOLDING ?auto_127729 ) ( CLEAR ?auto_127730 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127735 ?auto_127734 ?auto_127733 ?auto_127732 ?auto_127731 ?auto_127730 ?auto_127729 )
      ( MAKE-7PILE ?auto_127728 ?auto_127729 ?auto_127730 ?auto_127731 ?auto_127732 ?auto_127733 ?auto_127734 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127737 - BLOCK
      ?auto_127738 - BLOCK
      ?auto_127739 - BLOCK
      ?auto_127740 - BLOCK
      ?auto_127741 - BLOCK
      ?auto_127742 - BLOCK
      ?auto_127743 - BLOCK
    )
    :vars
    (
      ?auto_127744 - BLOCK
      ?auto_127745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127737 ?auto_127738 ) ) ( not ( = ?auto_127737 ?auto_127739 ) ) ( not ( = ?auto_127737 ?auto_127740 ) ) ( not ( = ?auto_127737 ?auto_127741 ) ) ( not ( = ?auto_127737 ?auto_127742 ) ) ( not ( = ?auto_127737 ?auto_127743 ) ) ( not ( = ?auto_127738 ?auto_127739 ) ) ( not ( = ?auto_127738 ?auto_127740 ) ) ( not ( = ?auto_127738 ?auto_127741 ) ) ( not ( = ?auto_127738 ?auto_127742 ) ) ( not ( = ?auto_127738 ?auto_127743 ) ) ( not ( = ?auto_127739 ?auto_127740 ) ) ( not ( = ?auto_127739 ?auto_127741 ) ) ( not ( = ?auto_127739 ?auto_127742 ) ) ( not ( = ?auto_127739 ?auto_127743 ) ) ( not ( = ?auto_127740 ?auto_127741 ) ) ( not ( = ?auto_127740 ?auto_127742 ) ) ( not ( = ?auto_127740 ?auto_127743 ) ) ( not ( = ?auto_127741 ?auto_127742 ) ) ( not ( = ?auto_127741 ?auto_127743 ) ) ( not ( = ?auto_127742 ?auto_127743 ) ) ( ON ?auto_127743 ?auto_127744 ) ( not ( = ?auto_127737 ?auto_127744 ) ) ( not ( = ?auto_127738 ?auto_127744 ) ) ( not ( = ?auto_127739 ?auto_127744 ) ) ( not ( = ?auto_127740 ?auto_127744 ) ) ( not ( = ?auto_127741 ?auto_127744 ) ) ( not ( = ?auto_127742 ?auto_127744 ) ) ( not ( = ?auto_127743 ?auto_127744 ) ) ( ON ?auto_127742 ?auto_127743 ) ( ON-TABLE ?auto_127744 ) ( ON ?auto_127741 ?auto_127742 ) ( ON ?auto_127740 ?auto_127741 ) ( ON ?auto_127739 ?auto_127740 ) ( ON ?auto_127737 ?auto_127745 ) ( not ( = ?auto_127737 ?auto_127745 ) ) ( not ( = ?auto_127738 ?auto_127745 ) ) ( not ( = ?auto_127739 ?auto_127745 ) ) ( not ( = ?auto_127740 ?auto_127745 ) ) ( not ( = ?auto_127741 ?auto_127745 ) ) ( not ( = ?auto_127742 ?auto_127745 ) ) ( not ( = ?auto_127743 ?auto_127745 ) ) ( not ( = ?auto_127744 ?auto_127745 ) ) ( CLEAR ?auto_127739 ) ( ON ?auto_127738 ?auto_127737 ) ( CLEAR ?auto_127738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127745 ?auto_127737 )
      ( MAKE-7PILE ?auto_127737 ?auto_127738 ?auto_127739 ?auto_127740 ?auto_127741 ?auto_127742 ?auto_127743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127746 - BLOCK
      ?auto_127747 - BLOCK
      ?auto_127748 - BLOCK
      ?auto_127749 - BLOCK
      ?auto_127750 - BLOCK
      ?auto_127751 - BLOCK
      ?auto_127752 - BLOCK
    )
    :vars
    (
      ?auto_127753 - BLOCK
      ?auto_127754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127746 ?auto_127747 ) ) ( not ( = ?auto_127746 ?auto_127748 ) ) ( not ( = ?auto_127746 ?auto_127749 ) ) ( not ( = ?auto_127746 ?auto_127750 ) ) ( not ( = ?auto_127746 ?auto_127751 ) ) ( not ( = ?auto_127746 ?auto_127752 ) ) ( not ( = ?auto_127747 ?auto_127748 ) ) ( not ( = ?auto_127747 ?auto_127749 ) ) ( not ( = ?auto_127747 ?auto_127750 ) ) ( not ( = ?auto_127747 ?auto_127751 ) ) ( not ( = ?auto_127747 ?auto_127752 ) ) ( not ( = ?auto_127748 ?auto_127749 ) ) ( not ( = ?auto_127748 ?auto_127750 ) ) ( not ( = ?auto_127748 ?auto_127751 ) ) ( not ( = ?auto_127748 ?auto_127752 ) ) ( not ( = ?auto_127749 ?auto_127750 ) ) ( not ( = ?auto_127749 ?auto_127751 ) ) ( not ( = ?auto_127749 ?auto_127752 ) ) ( not ( = ?auto_127750 ?auto_127751 ) ) ( not ( = ?auto_127750 ?auto_127752 ) ) ( not ( = ?auto_127751 ?auto_127752 ) ) ( ON ?auto_127752 ?auto_127753 ) ( not ( = ?auto_127746 ?auto_127753 ) ) ( not ( = ?auto_127747 ?auto_127753 ) ) ( not ( = ?auto_127748 ?auto_127753 ) ) ( not ( = ?auto_127749 ?auto_127753 ) ) ( not ( = ?auto_127750 ?auto_127753 ) ) ( not ( = ?auto_127751 ?auto_127753 ) ) ( not ( = ?auto_127752 ?auto_127753 ) ) ( ON ?auto_127751 ?auto_127752 ) ( ON-TABLE ?auto_127753 ) ( ON ?auto_127750 ?auto_127751 ) ( ON ?auto_127749 ?auto_127750 ) ( ON ?auto_127746 ?auto_127754 ) ( not ( = ?auto_127746 ?auto_127754 ) ) ( not ( = ?auto_127747 ?auto_127754 ) ) ( not ( = ?auto_127748 ?auto_127754 ) ) ( not ( = ?auto_127749 ?auto_127754 ) ) ( not ( = ?auto_127750 ?auto_127754 ) ) ( not ( = ?auto_127751 ?auto_127754 ) ) ( not ( = ?auto_127752 ?auto_127754 ) ) ( not ( = ?auto_127753 ?auto_127754 ) ) ( ON ?auto_127747 ?auto_127746 ) ( CLEAR ?auto_127747 ) ( ON-TABLE ?auto_127754 ) ( HOLDING ?auto_127748 ) ( CLEAR ?auto_127749 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127753 ?auto_127752 ?auto_127751 ?auto_127750 ?auto_127749 ?auto_127748 )
      ( MAKE-7PILE ?auto_127746 ?auto_127747 ?auto_127748 ?auto_127749 ?auto_127750 ?auto_127751 ?auto_127752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127755 - BLOCK
      ?auto_127756 - BLOCK
      ?auto_127757 - BLOCK
      ?auto_127758 - BLOCK
      ?auto_127759 - BLOCK
      ?auto_127760 - BLOCK
      ?auto_127761 - BLOCK
    )
    :vars
    (
      ?auto_127762 - BLOCK
      ?auto_127763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127755 ?auto_127756 ) ) ( not ( = ?auto_127755 ?auto_127757 ) ) ( not ( = ?auto_127755 ?auto_127758 ) ) ( not ( = ?auto_127755 ?auto_127759 ) ) ( not ( = ?auto_127755 ?auto_127760 ) ) ( not ( = ?auto_127755 ?auto_127761 ) ) ( not ( = ?auto_127756 ?auto_127757 ) ) ( not ( = ?auto_127756 ?auto_127758 ) ) ( not ( = ?auto_127756 ?auto_127759 ) ) ( not ( = ?auto_127756 ?auto_127760 ) ) ( not ( = ?auto_127756 ?auto_127761 ) ) ( not ( = ?auto_127757 ?auto_127758 ) ) ( not ( = ?auto_127757 ?auto_127759 ) ) ( not ( = ?auto_127757 ?auto_127760 ) ) ( not ( = ?auto_127757 ?auto_127761 ) ) ( not ( = ?auto_127758 ?auto_127759 ) ) ( not ( = ?auto_127758 ?auto_127760 ) ) ( not ( = ?auto_127758 ?auto_127761 ) ) ( not ( = ?auto_127759 ?auto_127760 ) ) ( not ( = ?auto_127759 ?auto_127761 ) ) ( not ( = ?auto_127760 ?auto_127761 ) ) ( ON ?auto_127761 ?auto_127762 ) ( not ( = ?auto_127755 ?auto_127762 ) ) ( not ( = ?auto_127756 ?auto_127762 ) ) ( not ( = ?auto_127757 ?auto_127762 ) ) ( not ( = ?auto_127758 ?auto_127762 ) ) ( not ( = ?auto_127759 ?auto_127762 ) ) ( not ( = ?auto_127760 ?auto_127762 ) ) ( not ( = ?auto_127761 ?auto_127762 ) ) ( ON ?auto_127760 ?auto_127761 ) ( ON-TABLE ?auto_127762 ) ( ON ?auto_127759 ?auto_127760 ) ( ON ?auto_127758 ?auto_127759 ) ( ON ?auto_127755 ?auto_127763 ) ( not ( = ?auto_127755 ?auto_127763 ) ) ( not ( = ?auto_127756 ?auto_127763 ) ) ( not ( = ?auto_127757 ?auto_127763 ) ) ( not ( = ?auto_127758 ?auto_127763 ) ) ( not ( = ?auto_127759 ?auto_127763 ) ) ( not ( = ?auto_127760 ?auto_127763 ) ) ( not ( = ?auto_127761 ?auto_127763 ) ) ( not ( = ?auto_127762 ?auto_127763 ) ) ( ON ?auto_127756 ?auto_127755 ) ( ON-TABLE ?auto_127763 ) ( CLEAR ?auto_127758 ) ( ON ?auto_127757 ?auto_127756 ) ( CLEAR ?auto_127757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127763 ?auto_127755 ?auto_127756 )
      ( MAKE-7PILE ?auto_127755 ?auto_127756 ?auto_127757 ?auto_127758 ?auto_127759 ?auto_127760 ?auto_127761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127764 - BLOCK
      ?auto_127765 - BLOCK
      ?auto_127766 - BLOCK
      ?auto_127767 - BLOCK
      ?auto_127768 - BLOCK
      ?auto_127769 - BLOCK
      ?auto_127770 - BLOCK
    )
    :vars
    (
      ?auto_127771 - BLOCK
      ?auto_127772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127764 ?auto_127765 ) ) ( not ( = ?auto_127764 ?auto_127766 ) ) ( not ( = ?auto_127764 ?auto_127767 ) ) ( not ( = ?auto_127764 ?auto_127768 ) ) ( not ( = ?auto_127764 ?auto_127769 ) ) ( not ( = ?auto_127764 ?auto_127770 ) ) ( not ( = ?auto_127765 ?auto_127766 ) ) ( not ( = ?auto_127765 ?auto_127767 ) ) ( not ( = ?auto_127765 ?auto_127768 ) ) ( not ( = ?auto_127765 ?auto_127769 ) ) ( not ( = ?auto_127765 ?auto_127770 ) ) ( not ( = ?auto_127766 ?auto_127767 ) ) ( not ( = ?auto_127766 ?auto_127768 ) ) ( not ( = ?auto_127766 ?auto_127769 ) ) ( not ( = ?auto_127766 ?auto_127770 ) ) ( not ( = ?auto_127767 ?auto_127768 ) ) ( not ( = ?auto_127767 ?auto_127769 ) ) ( not ( = ?auto_127767 ?auto_127770 ) ) ( not ( = ?auto_127768 ?auto_127769 ) ) ( not ( = ?auto_127768 ?auto_127770 ) ) ( not ( = ?auto_127769 ?auto_127770 ) ) ( ON ?auto_127770 ?auto_127771 ) ( not ( = ?auto_127764 ?auto_127771 ) ) ( not ( = ?auto_127765 ?auto_127771 ) ) ( not ( = ?auto_127766 ?auto_127771 ) ) ( not ( = ?auto_127767 ?auto_127771 ) ) ( not ( = ?auto_127768 ?auto_127771 ) ) ( not ( = ?auto_127769 ?auto_127771 ) ) ( not ( = ?auto_127770 ?auto_127771 ) ) ( ON ?auto_127769 ?auto_127770 ) ( ON-TABLE ?auto_127771 ) ( ON ?auto_127768 ?auto_127769 ) ( ON ?auto_127764 ?auto_127772 ) ( not ( = ?auto_127764 ?auto_127772 ) ) ( not ( = ?auto_127765 ?auto_127772 ) ) ( not ( = ?auto_127766 ?auto_127772 ) ) ( not ( = ?auto_127767 ?auto_127772 ) ) ( not ( = ?auto_127768 ?auto_127772 ) ) ( not ( = ?auto_127769 ?auto_127772 ) ) ( not ( = ?auto_127770 ?auto_127772 ) ) ( not ( = ?auto_127771 ?auto_127772 ) ) ( ON ?auto_127765 ?auto_127764 ) ( ON-TABLE ?auto_127772 ) ( ON ?auto_127766 ?auto_127765 ) ( CLEAR ?auto_127766 ) ( HOLDING ?auto_127767 ) ( CLEAR ?auto_127768 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127771 ?auto_127770 ?auto_127769 ?auto_127768 ?auto_127767 )
      ( MAKE-7PILE ?auto_127764 ?auto_127765 ?auto_127766 ?auto_127767 ?auto_127768 ?auto_127769 ?auto_127770 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127773 - BLOCK
      ?auto_127774 - BLOCK
      ?auto_127775 - BLOCK
      ?auto_127776 - BLOCK
      ?auto_127777 - BLOCK
      ?auto_127778 - BLOCK
      ?auto_127779 - BLOCK
    )
    :vars
    (
      ?auto_127780 - BLOCK
      ?auto_127781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127773 ?auto_127774 ) ) ( not ( = ?auto_127773 ?auto_127775 ) ) ( not ( = ?auto_127773 ?auto_127776 ) ) ( not ( = ?auto_127773 ?auto_127777 ) ) ( not ( = ?auto_127773 ?auto_127778 ) ) ( not ( = ?auto_127773 ?auto_127779 ) ) ( not ( = ?auto_127774 ?auto_127775 ) ) ( not ( = ?auto_127774 ?auto_127776 ) ) ( not ( = ?auto_127774 ?auto_127777 ) ) ( not ( = ?auto_127774 ?auto_127778 ) ) ( not ( = ?auto_127774 ?auto_127779 ) ) ( not ( = ?auto_127775 ?auto_127776 ) ) ( not ( = ?auto_127775 ?auto_127777 ) ) ( not ( = ?auto_127775 ?auto_127778 ) ) ( not ( = ?auto_127775 ?auto_127779 ) ) ( not ( = ?auto_127776 ?auto_127777 ) ) ( not ( = ?auto_127776 ?auto_127778 ) ) ( not ( = ?auto_127776 ?auto_127779 ) ) ( not ( = ?auto_127777 ?auto_127778 ) ) ( not ( = ?auto_127777 ?auto_127779 ) ) ( not ( = ?auto_127778 ?auto_127779 ) ) ( ON ?auto_127779 ?auto_127780 ) ( not ( = ?auto_127773 ?auto_127780 ) ) ( not ( = ?auto_127774 ?auto_127780 ) ) ( not ( = ?auto_127775 ?auto_127780 ) ) ( not ( = ?auto_127776 ?auto_127780 ) ) ( not ( = ?auto_127777 ?auto_127780 ) ) ( not ( = ?auto_127778 ?auto_127780 ) ) ( not ( = ?auto_127779 ?auto_127780 ) ) ( ON ?auto_127778 ?auto_127779 ) ( ON-TABLE ?auto_127780 ) ( ON ?auto_127777 ?auto_127778 ) ( ON ?auto_127773 ?auto_127781 ) ( not ( = ?auto_127773 ?auto_127781 ) ) ( not ( = ?auto_127774 ?auto_127781 ) ) ( not ( = ?auto_127775 ?auto_127781 ) ) ( not ( = ?auto_127776 ?auto_127781 ) ) ( not ( = ?auto_127777 ?auto_127781 ) ) ( not ( = ?auto_127778 ?auto_127781 ) ) ( not ( = ?auto_127779 ?auto_127781 ) ) ( not ( = ?auto_127780 ?auto_127781 ) ) ( ON ?auto_127774 ?auto_127773 ) ( ON-TABLE ?auto_127781 ) ( ON ?auto_127775 ?auto_127774 ) ( CLEAR ?auto_127777 ) ( ON ?auto_127776 ?auto_127775 ) ( CLEAR ?auto_127776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127781 ?auto_127773 ?auto_127774 ?auto_127775 )
      ( MAKE-7PILE ?auto_127773 ?auto_127774 ?auto_127775 ?auto_127776 ?auto_127777 ?auto_127778 ?auto_127779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127782 - BLOCK
      ?auto_127783 - BLOCK
      ?auto_127784 - BLOCK
      ?auto_127785 - BLOCK
      ?auto_127786 - BLOCK
      ?auto_127787 - BLOCK
      ?auto_127788 - BLOCK
    )
    :vars
    (
      ?auto_127790 - BLOCK
      ?auto_127789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127782 ?auto_127783 ) ) ( not ( = ?auto_127782 ?auto_127784 ) ) ( not ( = ?auto_127782 ?auto_127785 ) ) ( not ( = ?auto_127782 ?auto_127786 ) ) ( not ( = ?auto_127782 ?auto_127787 ) ) ( not ( = ?auto_127782 ?auto_127788 ) ) ( not ( = ?auto_127783 ?auto_127784 ) ) ( not ( = ?auto_127783 ?auto_127785 ) ) ( not ( = ?auto_127783 ?auto_127786 ) ) ( not ( = ?auto_127783 ?auto_127787 ) ) ( not ( = ?auto_127783 ?auto_127788 ) ) ( not ( = ?auto_127784 ?auto_127785 ) ) ( not ( = ?auto_127784 ?auto_127786 ) ) ( not ( = ?auto_127784 ?auto_127787 ) ) ( not ( = ?auto_127784 ?auto_127788 ) ) ( not ( = ?auto_127785 ?auto_127786 ) ) ( not ( = ?auto_127785 ?auto_127787 ) ) ( not ( = ?auto_127785 ?auto_127788 ) ) ( not ( = ?auto_127786 ?auto_127787 ) ) ( not ( = ?auto_127786 ?auto_127788 ) ) ( not ( = ?auto_127787 ?auto_127788 ) ) ( ON ?auto_127788 ?auto_127790 ) ( not ( = ?auto_127782 ?auto_127790 ) ) ( not ( = ?auto_127783 ?auto_127790 ) ) ( not ( = ?auto_127784 ?auto_127790 ) ) ( not ( = ?auto_127785 ?auto_127790 ) ) ( not ( = ?auto_127786 ?auto_127790 ) ) ( not ( = ?auto_127787 ?auto_127790 ) ) ( not ( = ?auto_127788 ?auto_127790 ) ) ( ON ?auto_127787 ?auto_127788 ) ( ON-TABLE ?auto_127790 ) ( ON ?auto_127782 ?auto_127789 ) ( not ( = ?auto_127782 ?auto_127789 ) ) ( not ( = ?auto_127783 ?auto_127789 ) ) ( not ( = ?auto_127784 ?auto_127789 ) ) ( not ( = ?auto_127785 ?auto_127789 ) ) ( not ( = ?auto_127786 ?auto_127789 ) ) ( not ( = ?auto_127787 ?auto_127789 ) ) ( not ( = ?auto_127788 ?auto_127789 ) ) ( not ( = ?auto_127790 ?auto_127789 ) ) ( ON ?auto_127783 ?auto_127782 ) ( ON-TABLE ?auto_127789 ) ( ON ?auto_127784 ?auto_127783 ) ( ON ?auto_127785 ?auto_127784 ) ( CLEAR ?auto_127785 ) ( HOLDING ?auto_127786 ) ( CLEAR ?auto_127787 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127790 ?auto_127788 ?auto_127787 ?auto_127786 )
      ( MAKE-7PILE ?auto_127782 ?auto_127783 ?auto_127784 ?auto_127785 ?auto_127786 ?auto_127787 ?auto_127788 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127791 - BLOCK
      ?auto_127792 - BLOCK
      ?auto_127793 - BLOCK
      ?auto_127794 - BLOCK
      ?auto_127795 - BLOCK
      ?auto_127796 - BLOCK
      ?auto_127797 - BLOCK
    )
    :vars
    (
      ?auto_127798 - BLOCK
      ?auto_127799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127791 ?auto_127792 ) ) ( not ( = ?auto_127791 ?auto_127793 ) ) ( not ( = ?auto_127791 ?auto_127794 ) ) ( not ( = ?auto_127791 ?auto_127795 ) ) ( not ( = ?auto_127791 ?auto_127796 ) ) ( not ( = ?auto_127791 ?auto_127797 ) ) ( not ( = ?auto_127792 ?auto_127793 ) ) ( not ( = ?auto_127792 ?auto_127794 ) ) ( not ( = ?auto_127792 ?auto_127795 ) ) ( not ( = ?auto_127792 ?auto_127796 ) ) ( not ( = ?auto_127792 ?auto_127797 ) ) ( not ( = ?auto_127793 ?auto_127794 ) ) ( not ( = ?auto_127793 ?auto_127795 ) ) ( not ( = ?auto_127793 ?auto_127796 ) ) ( not ( = ?auto_127793 ?auto_127797 ) ) ( not ( = ?auto_127794 ?auto_127795 ) ) ( not ( = ?auto_127794 ?auto_127796 ) ) ( not ( = ?auto_127794 ?auto_127797 ) ) ( not ( = ?auto_127795 ?auto_127796 ) ) ( not ( = ?auto_127795 ?auto_127797 ) ) ( not ( = ?auto_127796 ?auto_127797 ) ) ( ON ?auto_127797 ?auto_127798 ) ( not ( = ?auto_127791 ?auto_127798 ) ) ( not ( = ?auto_127792 ?auto_127798 ) ) ( not ( = ?auto_127793 ?auto_127798 ) ) ( not ( = ?auto_127794 ?auto_127798 ) ) ( not ( = ?auto_127795 ?auto_127798 ) ) ( not ( = ?auto_127796 ?auto_127798 ) ) ( not ( = ?auto_127797 ?auto_127798 ) ) ( ON ?auto_127796 ?auto_127797 ) ( ON-TABLE ?auto_127798 ) ( ON ?auto_127791 ?auto_127799 ) ( not ( = ?auto_127791 ?auto_127799 ) ) ( not ( = ?auto_127792 ?auto_127799 ) ) ( not ( = ?auto_127793 ?auto_127799 ) ) ( not ( = ?auto_127794 ?auto_127799 ) ) ( not ( = ?auto_127795 ?auto_127799 ) ) ( not ( = ?auto_127796 ?auto_127799 ) ) ( not ( = ?auto_127797 ?auto_127799 ) ) ( not ( = ?auto_127798 ?auto_127799 ) ) ( ON ?auto_127792 ?auto_127791 ) ( ON-TABLE ?auto_127799 ) ( ON ?auto_127793 ?auto_127792 ) ( ON ?auto_127794 ?auto_127793 ) ( CLEAR ?auto_127796 ) ( ON ?auto_127795 ?auto_127794 ) ( CLEAR ?auto_127795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127799 ?auto_127791 ?auto_127792 ?auto_127793 ?auto_127794 )
      ( MAKE-7PILE ?auto_127791 ?auto_127792 ?auto_127793 ?auto_127794 ?auto_127795 ?auto_127796 ?auto_127797 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127800 - BLOCK
      ?auto_127801 - BLOCK
      ?auto_127802 - BLOCK
      ?auto_127803 - BLOCK
      ?auto_127804 - BLOCK
      ?auto_127805 - BLOCK
      ?auto_127806 - BLOCK
    )
    :vars
    (
      ?auto_127808 - BLOCK
      ?auto_127807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127800 ?auto_127801 ) ) ( not ( = ?auto_127800 ?auto_127802 ) ) ( not ( = ?auto_127800 ?auto_127803 ) ) ( not ( = ?auto_127800 ?auto_127804 ) ) ( not ( = ?auto_127800 ?auto_127805 ) ) ( not ( = ?auto_127800 ?auto_127806 ) ) ( not ( = ?auto_127801 ?auto_127802 ) ) ( not ( = ?auto_127801 ?auto_127803 ) ) ( not ( = ?auto_127801 ?auto_127804 ) ) ( not ( = ?auto_127801 ?auto_127805 ) ) ( not ( = ?auto_127801 ?auto_127806 ) ) ( not ( = ?auto_127802 ?auto_127803 ) ) ( not ( = ?auto_127802 ?auto_127804 ) ) ( not ( = ?auto_127802 ?auto_127805 ) ) ( not ( = ?auto_127802 ?auto_127806 ) ) ( not ( = ?auto_127803 ?auto_127804 ) ) ( not ( = ?auto_127803 ?auto_127805 ) ) ( not ( = ?auto_127803 ?auto_127806 ) ) ( not ( = ?auto_127804 ?auto_127805 ) ) ( not ( = ?auto_127804 ?auto_127806 ) ) ( not ( = ?auto_127805 ?auto_127806 ) ) ( ON ?auto_127806 ?auto_127808 ) ( not ( = ?auto_127800 ?auto_127808 ) ) ( not ( = ?auto_127801 ?auto_127808 ) ) ( not ( = ?auto_127802 ?auto_127808 ) ) ( not ( = ?auto_127803 ?auto_127808 ) ) ( not ( = ?auto_127804 ?auto_127808 ) ) ( not ( = ?auto_127805 ?auto_127808 ) ) ( not ( = ?auto_127806 ?auto_127808 ) ) ( ON-TABLE ?auto_127808 ) ( ON ?auto_127800 ?auto_127807 ) ( not ( = ?auto_127800 ?auto_127807 ) ) ( not ( = ?auto_127801 ?auto_127807 ) ) ( not ( = ?auto_127802 ?auto_127807 ) ) ( not ( = ?auto_127803 ?auto_127807 ) ) ( not ( = ?auto_127804 ?auto_127807 ) ) ( not ( = ?auto_127805 ?auto_127807 ) ) ( not ( = ?auto_127806 ?auto_127807 ) ) ( not ( = ?auto_127808 ?auto_127807 ) ) ( ON ?auto_127801 ?auto_127800 ) ( ON-TABLE ?auto_127807 ) ( ON ?auto_127802 ?auto_127801 ) ( ON ?auto_127803 ?auto_127802 ) ( ON ?auto_127804 ?auto_127803 ) ( CLEAR ?auto_127804 ) ( HOLDING ?auto_127805 ) ( CLEAR ?auto_127806 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127808 ?auto_127806 ?auto_127805 )
      ( MAKE-7PILE ?auto_127800 ?auto_127801 ?auto_127802 ?auto_127803 ?auto_127804 ?auto_127805 ?auto_127806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127809 - BLOCK
      ?auto_127810 - BLOCK
      ?auto_127811 - BLOCK
      ?auto_127812 - BLOCK
      ?auto_127813 - BLOCK
      ?auto_127814 - BLOCK
      ?auto_127815 - BLOCK
    )
    :vars
    (
      ?auto_127816 - BLOCK
      ?auto_127817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127809 ?auto_127810 ) ) ( not ( = ?auto_127809 ?auto_127811 ) ) ( not ( = ?auto_127809 ?auto_127812 ) ) ( not ( = ?auto_127809 ?auto_127813 ) ) ( not ( = ?auto_127809 ?auto_127814 ) ) ( not ( = ?auto_127809 ?auto_127815 ) ) ( not ( = ?auto_127810 ?auto_127811 ) ) ( not ( = ?auto_127810 ?auto_127812 ) ) ( not ( = ?auto_127810 ?auto_127813 ) ) ( not ( = ?auto_127810 ?auto_127814 ) ) ( not ( = ?auto_127810 ?auto_127815 ) ) ( not ( = ?auto_127811 ?auto_127812 ) ) ( not ( = ?auto_127811 ?auto_127813 ) ) ( not ( = ?auto_127811 ?auto_127814 ) ) ( not ( = ?auto_127811 ?auto_127815 ) ) ( not ( = ?auto_127812 ?auto_127813 ) ) ( not ( = ?auto_127812 ?auto_127814 ) ) ( not ( = ?auto_127812 ?auto_127815 ) ) ( not ( = ?auto_127813 ?auto_127814 ) ) ( not ( = ?auto_127813 ?auto_127815 ) ) ( not ( = ?auto_127814 ?auto_127815 ) ) ( ON ?auto_127815 ?auto_127816 ) ( not ( = ?auto_127809 ?auto_127816 ) ) ( not ( = ?auto_127810 ?auto_127816 ) ) ( not ( = ?auto_127811 ?auto_127816 ) ) ( not ( = ?auto_127812 ?auto_127816 ) ) ( not ( = ?auto_127813 ?auto_127816 ) ) ( not ( = ?auto_127814 ?auto_127816 ) ) ( not ( = ?auto_127815 ?auto_127816 ) ) ( ON-TABLE ?auto_127816 ) ( ON ?auto_127809 ?auto_127817 ) ( not ( = ?auto_127809 ?auto_127817 ) ) ( not ( = ?auto_127810 ?auto_127817 ) ) ( not ( = ?auto_127811 ?auto_127817 ) ) ( not ( = ?auto_127812 ?auto_127817 ) ) ( not ( = ?auto_127813 ?auto_127817 ) ) ( not ( = ?auto_127814 ?auto_127817 ) ) ( not ( = ?auto_127815 ?auto_127817 ) ) ( not ( = ?auto_127816 ?auto_127817 ) ) ( ON ?auto_127810 ?auto_127809 ) ( ON-TABLE ?auto_127817 ) ( ON ?auto_127811 ?auto_127810 ) ( ON ?auto_127812 ?auto_127811 ) ( ON ?auto_127813 ?auto_127812 ) ( CLEAR ?auto_127815 ) ( ON ?auto_127814 ?auto_127813 ) ( CLEAR ?auto_127814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127817 ?auto_127809 ?auto_127810 ?auto_127811 ?auto_127812 ?auto_127813 )
      ( MAKE-7PILE ?auto_127809 ?auto_127810 ?auto_127811 ?auto_127812 ?auto_127813 ?auto_127814 ?auto_127815 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127818 - BLOCK
      ?auto_127819 - BLOCK
      ?auto_127820 - BLOCK
      ?auto_127821 - BLOCK
      ?auto_127822 - BLOCK
      ?auto_127823 - BLOCK
      ?auto_127824 - BLOCK
    )
    :vars
    (
      ?auto_127825 - BLOCK
      ?auto_127826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127818 ?auto_127819 ) ) ( not ( = ?auto_127818 ?auto_127820 ) ) ( not ( = ?auto_127818 ?auto_127821 ) ) ( not ( = ?auto_127818 ?auto_127822 ) ) ( not ( = ?auto_127818 ?auto_127823 ) ) ( not ( = ?auto_127818 ?auto_127824 ) ) ( not ( = ?auto_127819 ?auto_127820 ) ) ( not ( = ?auto_127819 ?auto_127821 ) ) ( not ( = ?auto_127819 ?auto_127822 ) ) ( not ( = ?auto_127819 ?auto_127823 ) ) ( not ( = ?auto_127819 ?auto_127824 ) ) ( not ( = ?auto_127820 ?auto_127821 ) ) ( not ( = ?auto_127820 ?auto_127822 ) ) ( not ( = ?auto_127820 ?auto_127823 ) ) ( not ( = ?auto_127820 ?auto_127824 ) ) ( not ( = ?auto_127821 ?auto_127822 ) ) ( not ( = ?auto_127821 ?auto_127823 ) ) ( not ( = ?auto_127821 ?auto_127824 ) ) ( not ( = ?auto_127822 ?auto_127823 ) ) ( not ( = ?auto_127822 ?auto_127824 ) ) ( not ( = ?auto_127823 ?auto_127824 ) ) ( not ( = ?auto_127818 ?auto_127825 ) ) ( not ( = ?auto_127819 ?auto_127825 ) ) ( not ( = ?auto_127820 ?auto_127825 ) ) ( not ( = ?auto_127821 ?auto_127825 ) ) ( not ( = ?auto_127822 ?auto_127825 ) ) ( not ( = ?auto_127823 ?auto_127825 ) ) ( not ( = ?auto_127824 ?auto_127825 ) ) ( ON-TABLE ?auto_127825 ) ( ON ?auto_127818 ?auto_127826 ) ( not ( = ?auto_127818 ?auto_127826 ) ) ( not ( = ?auto_127819 ?auto_127826 ) ) ( not ( = ?auto_127820 ?auto_127826 ) ) ( not ( = ?auto_127821 ?auto_127826 ) ) ( not ( = ?auto_127822 ?auto_127826 ) ) ( not ( = ?auto_127823 ?auto_127826 ) ) ( not ( = ?auto_127824 ?auto_127826 ) ) ( not ( = ?auto_127825 ?auto_127826 ) ) ( ON ?auto_127819 ?auto_127818 ) ( ON-TABLE ?auto_127826 ) ( ON ?auto_127820 ?auto_127819 ) ( ON ?auto_127821 ?auto_127820 ) ( ON ?auto_127822 ?auto_127821 ) ( ON ?auto_127823 ?auto_127822 ) ( CLEAR ?auto_127823 ) ( HOLDING ?auto_127824 ) ( CLEAR ?auto_127825 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127825 ?auto_127824 )
      ( MAKE-7PILE ?auto_127818 ?auto_127819 ?auto_127820 ?auto_127821 ?auto_127822 ?auto_127823 ?auto_127824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127827 - BLOCK
      ?auto_127828 - BLOCK
      ?auto_127829 - BLOCK
      ?auto_127830 - BLOCK
      ?auto_127831 - BLOCK
      ?auto_127832 - BLOCK
      ?auto_127833 - BLOCK
    )
    :vars
    (
      ?auto_127834 - BLOCK
      ?auto_127835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127827 ?auto_127828 ) ) ( not ( = ?auto_127827 ?auto_127829 ) ) ( not ( = ?auto_127827 ?auto_127830 ) ) ( not ( = ?auto_127827 ?auto_127831 ) ) ( not ( = ?auto_127827 ?auto_127832 ) ) ( not ( = ?auto_127827 ?auto_127833 ) ) ( not ( = ?auto_127828 ?auto_127829 ) ) ( not ( = ?auto_127828 ?auto_127830 ) ) ( not ( = ?auto_127828 ?auto_127831 ) ) ( not ( = ?auto_127828 ?auto_127832 ) ) ( not ( = ?auto_127828 ?auto_127833 ) ) ( not ( = ?auto_127829 ?auto_127830 ) ) ( not ( = ?auto_127829 ?auto_127831 ) ) ( not ( = ?auto_127829 ?auto_127832 ) ) ( not ( = ?auto_127829 ?auto_127833 ) ) ( not ( = ?auto_127830 ?auto_127831 ) ) ( not ( = ?auto_127830 ?auto_127832 ) ) ( not ( = ?auto_127830 ?auto_127833 ) ) ( not ( = ?auto_127831 ?auto_127832 ) ) ( not ( = ?auto_127831 ?auto_127833 ) ) ( not ( = ?auto_127832 ?auto_127833 ) ) ( not ( = ?auto_127827 ?auto_127834 ) ) ( not ( = ?auto_127828 ?auto_127834 ) ) ( not ( = ?auto_127829 ?auto_127834 ) ) ( not ( = ?auto_127830 ?auto_127834 ) ) ( not ( = ?auto_127831 ?auto_127834 ) ) ( not ( = ?auto_127832 ?auto_127834 ) ) ( not ( = ?auto_127833 ?auto_127834 ) ) ( ON-TABLE ?auto_127834 ) ( ON ?auto_127827 ?auto_127835 ) ( not ( = ?auto_127827 ?auto_127835 ) ) ( not ( = ?auto_127828 ?auto_127835 ) ) ( not ( = ?auto_127829 ?auto_127835 ) ) ( not ( = ?auto_127830 ?auto_127835 ) ) ( not ( = ?auto_127831 ?auto_127835 ) ) ( not ( = ?auto_127832 ?auto_127835 ) ) ( not ( = ?auto_127833 ?auto_127835 ) ) ( not ( = ?auto_127834 ?auto_127835 ) ) ( ON ?auto_127828 ?auto_127827 ) ( ON-TABLE ?auto_127835 ) ( ON ?auto_127829 ?auto_127828 ) ( ON ?auto_127830 ?auto_127829 ) ( ON ?auto_127831 ?auto_127830 ) ( ON ?auto_127832 ?auto_127831 ) ( CLEAR ?auto_127834 ) ( ON ?auto_127833 ?auto_127832 ) ( CLEAR ?auto_127833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127835 ?auto_127827 ?auto_127828 ?auto_127829 ?auto_127830 ?auto_127831 ?auto_127832 )
      ( MAKE-7PILE ?auto_127827 ?auto_127828 ?auto_127829 ?auto_127830 ?auto_127831 ?auto_127832 ?auto_127833 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127836 - BLOCK
      ?auto_127837 - BLOCK
      ?auto_127838 - BLOCK
      ?auto_127839 - BLOCK
      ?auto_127840 - BLOCK
      ?auto_127841 - BLOCK
      ?auto_127842 - BLOCK
    )
    :vars
    (
      ?auto_127844 - BLOCK
      ?auto_127843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127836 ?auto_127837 ) ) ( not ( = ?auto_127836 ?auto_127838 ) ) ( not ( = ?auto_127836 ?auto_127839 ) ) ( not ( = ?auto_127836 ?auto_127840 ) ) ( not ( = ?auto_127836 ?auto_127841 ) ) ( not ( = ?auto_127836 ?auto_127842 ) ) ( not ( = ?auto_127837 ?auto_127838 ) ) ( not ( = ?auto_127837 ?auto_127839 ) ) ( not ( = ?auto_127837 ?auto_127840 ) ) ( not ( = ?auto_127837 ?auto_127841 ) ) ( not ( = ?auto_127837 ?auto_127842 ) ) ( not ( = ?auto_127838 ?auto_127839 ) ) ( not ( = ?auto_127838 ?auto_127840 ) ) ( not ( = ?auto_127838 ?auto_127841 ) ) ( not ( = ?auto_127838 ?auto_127842 ) ) ( not ( = ?auto_127839 ?auto_127840 ) ) ( not ( = ?auto_127839 ?auto_127841 ) ) ( not ( = ?auto_127839 ?auto_127842 ) ) ( not ( = ?auto_127840 ?auto_127841 ) ) ( not ( = ?auto_127840 ?auto_127842 ) ) ( not ( = ?auto_127841 ?auto_127842 ) ) ( not ( = ?auto_127836 ?auto_127844 ) ) ( not ( = ?auto_127837 ?auto_127844 ) ) ( not ( = ?auto_127838 ?auto_127844 ) ) ( not ( = ?auto_127839 ?auto_127844 ) ) ( not ( = ?auto_127840 ?auto_127844 ) ) ( not ( = ?auto_127841 ?auto_127844 ) ) ( not ( = ?auto_127842 ?auto_127844 ) ) ( ON ?auto_127836 ?auto_127843 ) ( not ( = ?auto_127836 ?auto_127843 ) ) ( not ( = ?auto_127837 ?auto_127843 ) ) ( not ( = ?auto_127838 ?auto_127843 ) ) ( not ( = ?auto_127839 ?auto_127843 ) ) ( not ( = ?auto_127840 ?auto_127843 ) ) ( not ( = ?auto_127841 ?auto_127843 ) ) ( not ( = ?auto_127842 ?auto_127843 ) ) ( not ( = ?auto_127844 ?auto_127843 ) ) ( ON ?auto_127837 ?auto_127836 ) ( ON-TABLE ?auto_127843 ) ( ON ?auto_127838 ?auto_127837 ) ( ON ?auto_127839 ?auto_127838 ) ( ON ?auto_127840 ?auto_127839 ) ( ON ?auto_127841 ?auto_127840 ) ( ON ?auto_127842 ?auto_127841 ) ( CLEAR ?auto_127842 ) ( HOLDING ?auto_127844 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127844 )
      ( MAKE-7PILE ?auto_127836 ?auto_127837 ?auto_127838 ?auto_127839 ?auto_127840 ?auto_127841 ?auto_127842 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127845 - BLOCK
      ?auto_127846 - BLOCK
      ?auto_127847 - BLOCK
      ?auto_127848 - BLOCK
      ?auto_127849 - BLOCK
      ?auto_127850 - BLOCK
      ?auto_127851 - BLOCK
    )
    :vars
    (
      ?auto_127853 - BLOCK
      ?auto_127852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127845 ?auto_127846 ) ) ( not ( = ?auto_127845 ?auto_127847 ) ) ( not ( = ?auto_127845 ?auto_127848 ) ) ( not ( = ?auto_127845 ?auto_127849 ) ) ( not ( = ?auto_127845 ?auto_127850 ) ) ( not ( = ?auto_127845 ?auto_127851 ) ) ( not ( = ?auto_127846 ?auto_127847 ) ) ( not ( = ?auto_127846 ?auto_127848 ) ) ( not ( = ?auto_127846 ?auto_127849 ) ) ( not ( = ?auto_127846 ?auto_127850 ) ) ( not ( = ?auto_127846 ?auto_127851 ) ) ( not ( = ?auto_127847 ?auto_127848 ) ) ( not ( = ?auto_127847 ?auto_127849 ) ) ( not ( = ?auto_127847 ?auto_127850 ) ) ( not ( = ?auto_127847 ?auto_127851 ) ) ( not ( = ?auto_127848 ?auto_127849 ) ) ( not ( = ?auto_127848 ?auto_127850 ) ) ( not ( = ?auto_127848 ?auto_127851 ) ) ( not ( = ?auto_127849 ?auto_127850 ) ) ( not ( = ?auto_127849 ?auto_127851 ) ) ( not ( = ?auto_127850 ?auto_127851 ) ) ( not ( = ?auto_127845 ?auto_127853 ) ) ( not ( = ?auto_127846 ?auto_127853 ) ) ( not ( = ?auto_127847 ?auto_127853 ) ) ( not ( = ?auto_127848 ?auto_127853 ) ) ( not ( = ?auto_127849 ?auto_127853 ) ) ( not ( = ?auto_127850 ?auto_127853 ) ) ( not ( = ?auto_127851 ?auto_127853 ) ) ( ON ?auto_127845 ?auto_127852 ) ( not ( = ?auto_127845 ?auto_127852 ) ) ( not ( = ?auto_127846 ?auto_127852 ) ) ( not ( = ?auto_127847 ?auto_127852 ) ) ( not ( = ?auto_127848 ?auto_127852 ) ) ( not ( = ?auto_127849 ?auto_127852 ) ) ( not ( = ?auto_127850 ?auto_127852 ) ) ( not ( = ?auto_127851 ?auto_127852 ) ) ( not ( = ?auto_127853 ?auto_127852 ) ) ( ON ?auto_127846 ?auto_127845 ) ( ON-TABLE ?auto_127852 ) ( ON ?auto_127847 ?auto_127846 ) ( ON ?auto_127848 ?auto_127847 ) ( ON ?auto_127849 ?auto_127848 ) ( ON ?auto_127850 ?auto_127849 ) ( ON ?auto_127851 ?auto_127850 ) ( ON ?auto_127853 ?auto_127851 ) ( CLEAR ?auto_127853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127852 ?auto_127845 ?auto_127846 ?auto_127847 ?auto_127848 ?auto_127849 ?auto_127850 ?auto_127851 )
      ( MAKE-7PILE ?auto_127845 ?auto_127846 ?auto_127847 ?auto_127848 ?auto_127849 ?auto_127850 ?auto_127851 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127870 - BLOCK
      ?auto_127871 - BLOCK
      ?auto_127872 - BLOCK
      ?auto_127873 - BLOCK
      ?auto_127874 - BLOCK
      ?auto_127875 - BLOCK
      ?auto_127876 - BLOCK
      ?auto_127877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127876 ) ( ON-TABLE ?auto_127870 ) ( ON ?auto_127871 ?auto_127870 ) ( ON ?auto_127872 ?auto_127871 ) ( ON ?auto_127873 ?auto_127872 ) ( ON ?auto_127874 ?auto_127873 ) ( ON ?auto_127875 ?auto_127874 ) ( ON ?auto_127876 ?auto_127875 ) ( not ( = ?auto_127870 ?auto_127871 ) ) ( not ( = ?auto_127870 ?auto_127872 ) ) ( not ( = ?auto_127870 ?auto_127873 ) ) ( not ( = ?auto_127870 ?auto_127874 ) ) ( not ( = ?auto_127870 ?auto_127875 ) ) ( not ( = ?auto_127870 ?auto_127876 ) ) ( not ( = ?auto_127870 ?auto_127877 ) ) ( not ( = ?auto_127871 ?auto_127872 ) ) ( not ( = ?auto_127871 ?auto_127873 ) ) ( not ( = ?auto_127871 ?auto_127874 ) ) ( not ( = ?auto_127871 ?auto_127875 ) ) ( not ( = ?auto_127871 ?auto_127876 ) ) ( not ( = ?auto_127871 ?auto_127877 ) ) ( not ( = ?auto_127872 ?auto_127873 ) ) ( not ( = ?auto_127872 ?auto_127874 ) ) ( not ( = ?auto_127872 ?auto_127875 ) ) ( not ( = ?auto_127872 ?auto_127876 ) ) ( not ( = ?auto_127872 ?auto_127877 ) ) ( not ( = ?auto_127873 ?auto_127874 ) ) ( not ( = ?auto_127873 ?auto_127875 ) ) ( not ( = ?auto_127873 ?auto_127876 ) ) ( not ( = ?auto_127873 ?auto_127877 ) ) ( not ( = ?auto_127874 ?auto_127875 ) ) ( not ( = ?auto_127874 ?auto_127876 ) ) ( not ( = ?auto_127874 ?auto_127877 ) ) ( not ( = ?auto_127875 ?auto_127876 ) ) ( not ( = ?auto_127875 ?auto_127877 ) ) ( not ( = ?auto_127876 ?auto_127877 ) ) ( ON-TABLE ?auto_127877 ) ( CLEAR ?auto_127877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_127877 )
      ( MAKE-8PILE ?auto_127870 ?auto_127871 ?auto_127872 ?auto_127873 ?auto_127874 ?auto_127875 ?auto_127876 ?auto_127877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127878 - BLOCK
      ?auto_127879 - BLOCK
      ?auto_127880 - BLOCK
      ?auto_127881 - BLOCK
      ?auto_127882 - BLOCK
      ?auto_127883 - BLOCK
      ?auto_127884 - BLOCK
      ?auto_127885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127878 ) ( ON ?auto_127879 ?auto_127878 ) ( ON ?auto_127880 ?auto_127879 ) ( ON ?auto_127881 ?auto_127880 ) ( ON ?auto_127882 ?auto_127881 ) ( ON ?auto_127883 ?auto_127882 ) ( not ( = ?auto_127878 ?auto_127879 ) ) ( not ( = ?auto_127878 ?auto_127880 ) ) ( not ( = ?auto_127878 ?auto_127881 ) ) ( not ( = ?auto_127878 ?auto_127882 ) ) ( not ( = ?auto_127878 ?auto_127883 ) ) ( not ( = ?auto_127878 ?auto_127884 ) ) ( not ( = ?auto_127878 ?auto_127885 ) ) ( not ( = ?auto_127879 ?auto_127880 ) ) ( not ( = ?auto_127879 ?auto_127881 ) ) ( not ( = ?auto_127879 ?auto_127882 ) ) ( not ( = ?auto_127879 ?auto_127883 ) ) ( not ( = ?auto_127879 ?auto_127884 ) ) ( not ( = ?auto_127879 ?auto_127885 ) ) ( not ( = ?auto_127880 ?auto_127881 ) ) ( not ( = ?auto_127880 ?auto_127882 ) ) ( not ( = ?auto_127880 ?auto_127883 ) ) ( not ( = ?auto_127880 ?auto_127884 ) ) ( not ( = ?auto_127880 ?auto_127885 ) ) ( not ( = ?auto_127881 ?auto_127882 ) ) ( not ( = ?auto_127881 ?auto_127883 ) ) ( not ( = ?auto_127881 ?auto_127884 ) ) ( not ( = ?auto_127881 ?auto_127885 ) ) ( not ( = ?auto_127882 ?auto_127883 ) ) ( not ( = ?auto_127882 ?auto_127884 ) ) ( not ( = ?auto_127882 ?auto_127885 ) ) ( not ( = ?auto_127883 ?auto_127884 ) ) ( not ( = ?auto_127883 ?auto_127885 ) ) ( not ( = ?auto_127884 ?auto_127885 ) ) ( ON-TABLE ?auto_127885 ) ( CLEAR ?auto_127885 ) ( HOLDING ?auto_127884 ) ( CLEAR ?auto_127883 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127878 ?auto_127879 ?auto_127880 ?auto_127881 ?auto_127882 ?auto_127883 ?auto_127884 )
      ( MAKE-8PILE ?auto_127878 ?auto_127879 ?auto_127880 ?auto_127881 ?auto_127882 ?auto_127883 ?auto_127884 ?auto_127885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127886 - BLOCK
      ?auto_127887 - BLOCK
      ?auto_127888 - BLOCK
      ?auto_127889 - BLOCK
      ?auto_127890 - BLOCK
      ?auto_127891 - BLOCK
      ?auto_127892 - BLOCK
      ?auto_127893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127886 ) ( ON ?auto_127887 ?auto_127886 ) ( ON ?auto_127888 ?auto_127887 ) ( ON ?auto_127889 ?auto_127888 ) ( ON ?auto_127890 ?auto_127889 ) ( ON ?auto_127891 ?auto_127890 ) ( not ( = ?auto_127886 ?auto_127887 ) ) ( not ( = ?auto_127886 ?auto_127888 ) ) ( not ( = ?auto_127886 ?auto_127889 ) ) ( not ( = ?auto_127886 ?auto_127890 ) ) ( not ( = ?auto_127886 ?auto_127891 ) ) ( not ( = ?auto_127886 ?auto_127892 ) ) ( not ( = ?auto_127886 ?auto_127893 ) ) ( not ( = ?auto_127887 ?auto_127888 ) ) ( not ( = ?auto_127887 ?auto_127889 ) ) ( not ( = ?auto_127887 ?auto_127890 ) ) ( not ( = ?auto_127887 ?auto_127891 ) ) ( not ( = ?auto_127887 ?auto_127892 ) ) ( not ( = ?auto_127887 ?auto_127893 ) ) ( not ( = ?auto_127888 ?auto_127889 ) ) ( not ( = ?auto_127888 ?auto_127890 ) ) ( not ( = ?auto_127888 ?auto_127891 ) ) ( not ( = ?auto_127888 ?auto_127892 ) ) ( not ( = ?auto_127888 ?auto_127893 ) ) ( not ( = ?auto_127889 ?auto_127890 ) ) ( not ( = ?auto_127889 ?auto_127891 ) ) ( not ( = ?auto_127889 ?auto_127892 ) ) ( not ( = ?auto_127889 ?auto_127893 ) ) ( not ( = ?auto_127890 ?auto_127891 ) ) ( not ( = ?auto_127890 ?auto_127892 ) ) ( not ( = ?auto_127890 ?auto_127893 ) ) ( not ( = ?auto_127891 ?auto_127892 ) ) ( not ( = ?auto_127891 ?auto_127893 ) ) ( not ( = ?auto_127892 ?auto_127893 ) ) ( ON-TABLE ?auto_127893 ) ( CLEAR ?auto_127891 ) ( ON ?auto_127892 ?auto_127893 ) ( CLEAR ?auto_127892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127893 )
      ( MAKE-8PILE ?auto_127886 ?auto_127887 ?auto_127888 ?auto_127889 ?auto_127890 ?auto_127891 ?auto_127892 ?auto_127893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127894 - BLOCK
      ?auto_127895 - BLOCK
      ?auto_127896 - BLOCK
      ?auto_127897 - BLOCK
      ?auto_127898 - BLOCK
      ?auto_127899 - BLOCK
      ?auto_127900 - BLOCK
      ?auto_127901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127894 ) ( ON ?auto_127895 ?auto_127894 ) ( ON ?auto_127896 ?auto_127895 ) ( ON ?auto_127897 ?auto_127896 ) ( ON ?auto_127898 ?auto_127897 ) ( not ( = ?auto_127894 ?auto_127895 ) ) ( not ( = ?auto_127894 ?auto_127896 ) ) ( not ( = ?auto_127894 ?auto_127897 ) ) ( not ( = ?auto_127894 ?auto_127898 ) ) ( not ( = ?auto_127894 ?auto_127899 ) ) ( not ( = ?auto_127894 ?auto_127900 ) ) ( not ( = ?auto_127894 ?auto_127901 ) ) ( not ( = ?auto_127895 ?auto_127896 ) ) ( not ( = ?auto_127895 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127898 ) ) ( not ( = ?auto_127895 ?auto_127899 ) ) ( not ( = ?auto_127895 ?auto_127900 ) ) ( not ( = ?auto_127895 ?auto_127901 ) ) ( not ( = ?auto_127896 ?auto_127897 ) ) ( not ( = ?auto_127896 ?auto_127898 ) ) ( not ( = ?auto_127896 ?auto_127899 ) ) ( not ( = ?auto_127896 ?auto_127900 ) ) ( not ( = ?auto_127896 ?auto_127901 ) ) ( not ( = ?auto_127897 ?auto_127898 ) ) ( not ( = ?auto_127897 ?auto_127899 ) ) ( not ( = ?auto_127897 ?auto_127900 ) ) ( not ( = ?auto_127897 ?auto_127901 ) ) ( not ( = ?auto_127898 ?auto_127899 ) ) ( not ( = ?auto_127898 ?auto_127900 ) ) ( not ( = ?auto_127898 ?auto_127901 ) ) ( not ( = ?auto_127899 ?auto_127900 ) ) ( not ( = ?auto_127899 ?auto_127901 ) ) ( not ( = ?auto_127900 ?auto_127901 ) ) ( ON-TABLE ?auto_127901 ) ( ON ?auto_127900 ?auto_127901 ) ( CLEAR ?auto_127900 ) ( HOLDING ?auto_127899 ) ( CLEAR ?auto_127898 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127894 ?auto_127895 ?auto_127896 ?auto_127897 ?auto_127898 ?auto_127899 )
      ( MAKE-8PILE ?auto_127894 ?auto_127895 ?auto_127896 ?auto_127897 ?auto_127898 ?auto_127899 ?auto_127900 ?auto_127901 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127902 - BLOCK
      ?auto_127903 - BLOCK
      ?auto_127904 - BLOCK
      ?auto_127905 - BLOCK
      ?auto_127906 - BLOCK
      ?auto_127907 - BLOCK
      ?auto_127908 - BLOCK
      ?auto_127909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127902 ) ( ON ?auto_127903 ?auto_127902 ) ( ON ?auto_127904 ?auto_127903 ) ( ON ?auto_127905 ?auto_127904 ) ( ON ?auto_127906 ?auto_127905 ) ( not ( = ?auto_127902 ?auto_127903 ) ) ( not ( = ?auto_127902 ?auto_127904 ) ) ( not ( = ?auto_127902 ?auto_127905 ) ) ( not ( = ?auto_127902 ?auto_127906 ) ) ( not ( = ?auto_127902 ?auto_127907 ) ) ( not ( = ?auto_127902 ?auto_127908 ) ) ( not ( = ?auto_127902 ?auto_127909 ) ) ( not ( = ?auto_127903 ?auto_127904 ) ) ( not ( = ?auto_127903 ?auto_127905 ) ) ( not ( = ?auto_127903 ?auto_127906 ) ) ( not ( = ?auto_127903 ?auto_127907 ) ) ( not ( = ?auto_127903 ?auto_127908 ) ) ( not ( = ?auto_127903 ?auto_127909 ) ) ( not ( = ?auto_127904 ?auto_127905 ) ) ( not ( = ?auto_127904 ?auto_127906 ) ) ( not ( = ?auto_127904 ?auto_127907 ) ) ( not ( = ?auto_127904 ?auto_127908 ) ) ( not ( = ?auto_127904 ?auto_127909 ) ) ( not ( = ?auto_127905 ?auto_127906 ) ) ( not ( = ?auto_127905 ?auto_127907 ) ) ( not ( = ?auto_127905 ?auto_127908 ) ) ( not ( = ?auto_127905 ?auto_127909 ) ) ( not ( = ?auto_127906 ?auto_127907 ) ) ( not ( = ?auto_127906 ?auto_127908 ) ) ( not ( = ?auto_127906 ?auto_127909 ) ) ( not ( = ?auto_127907 ?auto_127908 ) ) ( not ( = ?auto_127907 ?auto_127909 ) ) ( not ( = ?auto_127908 ?auto_127909 ) ) ( ON-TABLE ?auto_127909 ) ( ON ?auto_127908 ?auto_127909 ) ( CLEAR ?auto_127906 ) ( ON ?auto_127907 ?auto_127908 ) ( CLEAR ?auto_127907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127909 ?auto_127908 )
      ( MAKE-8PILE ?auto_127902 ?auto_127903 ?auto_127904 ?auto_127905 ?auto_127906 ?auto_127907 ?auto_127908 ?auto_127909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127910 - BLOCK
      ?auto_127911 - BLOCK
      ?auto_127912 - BLOCK
      ?auto_127913 - BLOCK
      ?auto_127914 - BLOCK
      ?auto_127915 - BLOCK
      ?auto_127916 - BLOCK
      ?auto_127917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127910 ) ( ON ?auto_127911 ?auto_127910 ) ( ON ?auto_127912 ?auto_127911 ) ( ON ?auto_127913 ?auto_127912 ) ( not ( = ?auto_127910 ?auto_127911 ) ) ( not ( = ?auto_127910 ?auto_127912 ) ) ( not ( = ?auto_127910 ?auto_127913 ) ) ( not ( = ?auto_127910 ?auto_127914 ) ) ( not ( = ?auto_127910 ?auto_127915 ) ) ( not ( = ?auto_127910 ?auto_127916 ) ) ( not ( = ?auto_127910 ?auto_127917 ) ) ( not ( = ?auto_127911 ?auto_127912 ) ) ( not ( = ?auto_127911 ?auto_127913 ) ) ( not ( = ?auto_127911 ?auto_127914 ) ) ( not ( = ?auto_127911 ?auto_127915 ) ) ( not ( = ?auto_127911 ?auto_127916 ) ) ( not ( = ?auto_127911 ?auto_127917 ) ) ( not ( = ?auto_127912 ?auto_127913 ) ) ( not ( = ?auto_127912 ?auto_127914 ) ) ( not ( = ?auto_127912 ?auto_127915 ) ) ( not ( = ?auto_127912 ?auto_127916 ) ) ( not ( = ?auto_127912 ?auto_127917 ) ) ( not ( = ?auto_127913 ?auto_127914 ) ) ( not ( = ?auto_127913 ?auto_127915 ) ) ( not ( = ?auto_127913 ?auto_127916 ) ) ( not ( = ?auto_127913 ?auto_127917 ) ) ( not ( = ?auto_127914 ?auto_127915 ) ) ( not ( = ?auto_127914 ?auto_127916 ) ) ( not ( = ?auto_127914 ?auto_127917 ) ) ( not ( = ?auto_127915 ?auto_127916 ) ) ( not ( = ?auto_127915 ?auto_127917 ) ) ( not ( = ?auto_127916 ?auto_127917 ) ) ( ON-TABLE ?auto_127917 ) ( ON ?auto_127916 ?auto_127917 ) ( ON ?auto_127915 ?auto_127916 ) ( CLEAR ?auto_127915 ) ( HOLDING ?auto_127914 ) ( CLEAR ?auto_127913 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127910 ?auto_127911 ?auto_127912 ?auto_127913 ?auto_127914 )
      ( MAKE-8PILE ?auto_127910 ?auto_127911 ?auto_127912 ?auto_127913 ?auto_127914 ?auto_127915 ?auto_127916 ?auto_127917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127918 - BLOCK
      ?auto_127919 - BLOCK
      ?auto_127920 - BLOCK
      ?auto_127921 - BLOCK
      ?auto_127922 - BLOCK
      ?auto_127923 - BLOCK
      ?auto_127924 - BLOCK
      ?auto_127925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127918 ) ( ON ?auto_127919 ?auto_127918 ) ( ON ?auto_127920 ?auto_127919 ) ( ON ?auto_127921 ?auto_127920 ) ( not ( = ?auto_127918 ?auto_127919 ) ) ( not ( = ?auto_127918 ?auto_127920 ) ) ( not ( = ?auto_127918 ?auto_127921 ) ) ( not ( = ?auto_127918 ?auto_127922 ) ) ( not ( = ?auto_127918 ?auto_127923 ) ) ( not ( = ?auto_127918 ?auto_127924 ) ) ( not ( = ?auto_127918 ?auto_127925 ) ) ( not ( = ?auto_127919 ?auto_127920 ) ) ( not ( = ?auto_127919 ?auto_127921 ) ) ( not ( = ?auto_127919 ?auto_127922 ) ) ( not ( = ?auto_127919 ?auto_127923 ) ) ( not ( = ?auto_127919 ?auto_127924 ) ) ( not ( = ?auto_127919 ?auto_127925 ) ) ( not ( = ?auto_127920 ?auto_127921 ) ) ( not ( = ?auto_127920 ?auto_127922 ) ) ( not ( = ?auto_127920 ?auto_127923 ) ) ( not ( = ?auto_127920 ?auto_127924 ) ) ( not ( = ?auto_127920 ?auto_127925 ) ) ( not ( = ?auto_127921 ?auto_127922 ) ) ( not ( = ?auto_127921 ?auto_127923 ) ) ( not ( = ?auto_127921 ?auto_127924 ) ) ( not ( = ?auto_127921 ?auto_127925 ) ) ( not ( = ?auto_127922 ?auto_127923 ) ) ( not ( = ?auto_127922 ?auto_127924 ) ) ( not ( = ?auto_127922 ?auto_127925 ) ) ( not ( = ?auto_127923 ?auto_127924 ) ) ( not ( = ?auto_127923 ?auto_127925 ) ) ( not ( = ?auto_127924 ?auto_127925 ) ) ( ON-TABLE ?auto_127925 ) ( ON ?auto_127924 ?auto_127925 ) ( ON ?auto_127923 ?auto_127924 ) ( CLEAR ?auto_127921 ) ( ON ?auto_127922 ?auto_127923 ) ( CLEAR ?auto_127922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127925 ?auto_127924 ?auto_127923 )
      ( MAKE-8PILE ?auto_127918 ?auto_127919 ?auto_127920 ?auto_127921 ?auto_127922 ?auto_127923 ?auto_127924 ?auto_127925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127926 - BLOCK
      ?auto_127927 - BLOCK
      ?auto_127928 - BLOCK
      ?auto_127929 - BLOCK
      ?auto_127930 - BLOCK
      ?auto_127931 - BLOCK
      ?auto_127932 - BLOCK
      ?auto_127933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127926 ) ( ON ?auto_127927 ?auto_127926 ) ( ON ?auto_127928 ?auto_127927 ) ( not ( = ?auto_127926 ?auto_127927 ) ) ( not ( = ?auto_127926 ?auto_127928 ) ) ( not ( = ?auto_127926 ?auto_127929 ) ) ( not ( = ?auto_127926 ?auto_127930 ) ) ( not ( = ?auto_127926 ?auto_127931 ) ) ( not ( = ?auto_127926 ?auto_127932 ) ) ( not ( = ?auto_127926 ?auto_127933 ) ) ( not ( = ?auto_127927 ?auto_127928 ) ) ( not ( = ?auto_127927 ?auto_127929 ) ) ( not ( = ?auto_127927 ?auto_127930 ) ) ( not ( = ?auto_127927 ?auto_127931 ) ) ( not ( = ?auto_127927 ?auto_127932 ) ) ( not ( = ?auto_127927 ?auto_127933 ) ) ( not ( = ?auto_127928 ?auto_127929 ) ) ( not ( = ?auto_127928 ?auto_127930 ) ) ( not ( = ?auto_127928 ?auto_127931 ) ) ( not ( = ?auto_127928 ?auto_127932 ) ) ( not ( = ?auto_127928 ?auto_127933 ) ) ( not ( = ?auto_127929 ?auto_127930 ) ) ( not ( = ?auto_127929 ?auto_127931 ) ) ( not ( = ?auto_127929 ?auto_127932 ) ) ( not ( = ?auto_127929 ?auto_127933 ) ) ( not ( = ?auto_127930 ?auto_127931 ) ) ( not ( = ?auto_127930 ?auto_127932 ) ) ( not ( = ?auto_127930 ?auto_127933 ) ) ( not ( = ?auto_127931 ?auto_127932 ) ) ( not ( = ?auto_127931 ?auto_127933 ) ) ( not ( = ?auto_127932 ?auto_127933 ) ) ( ON-TABLE ?auto_127933 ) ( ON ?auto_127932 ?auto_127933 ) ( ON ?auto_127931 ?auto_127932 ) ( ON ?auto_127930 ?auto_127931 ) ( CLEAR ?auto_127930 ) ( HOLDING ?auto_127929 ) ( CLEAR ?auto_127928 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127926 ?auto_127927 ?auto_127928 ?auto_127929 )
      ( MAKE-8PILE ?auto_127926 ?auto_127927 ?auto_127928 ?auto_127929 ?auto_127930 ?auto_127931 ?auto_127932 ?auto_127933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127934 - BLOCK
      ?auto_127935 - BLOCK
      ?auto_127936 - BLOCK
      ?auto_127937 - BLOCK
      ?auto_127938 - BLOCK
      ?auto_127939 - BLOCK
      ?auto_127940 - BLOCK
      ?auto_127941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127934 ) ( ON ?auto_127935 ?auto_127934 ) ( ON ?auto_127936 ?auto_127935 ) ( not ( = ?auto_127934 ?auto_127935 ) ) ( not ( = ?auto_127934 ?auto_127936 ) ) ( not ( = ?auto_127934 ?auto_127937 ) ) ( not ( = ?auto_127934 ?auto_127938 ) ) ( not ( = ?auto_127934 ?auto_127939 ) ) ( not ( = ?auto_127934 ?auto_127940 ) ) ( not ( = ?auto_127934 ?auto_127941 ) ) ( not ( = ?auto_127935 ?auto_127936 ) ) ( not ( = ?auto_127935 ?auto_127937 ) ) ( not ( = ?auto_127935 ?auto_127938 ) ) ( not ( = ?auto_127935 ?auto_127939 ) ) ( not ( = ?auto_127935 ?auto_127940 ) ) ( not ( = ?auto_127935 ?auto_127941 ) ) ( not ( = ?auto_127936 ?auto_127937 ) ) ( not ( = ?auto_127936 ?auto_127938 ) ) ( not ( = ?auto_127936 ?auto_127939 ) ) ( not ( = ?auto_127936 ?auto_127940 ) ) ( not ( = ?auto_127936 ?auto_127941 ) ) ( not ( = ?auto_127937 ?auto_127938 ) ) ( not ( = ?auto_127937 ?auto_127939 ) ) ( not ( = ?auto_127937 ?auto_127940 ) ) ( not ( = ?auto_127937 ?auto_127941 ) ) ( not ( = ?auto_127938 ?auto_127939 ) ) ( not ( = ?auto_127938 ?auto_127940 ) ) ( not ( = ?auto_127938 ?auto_127941 ) ) ( not ( = ?auto_127939 ?auto_127940 ) ) ( not ( = ?auto_127939 ?auto_127941 ) ) ( not ( = ?auto_127940 ?auto_127941 ) ) ( ON-TABLE ?auto_127941 ) ( ON ?auto_127940 ?auto_127941 ) ( ON ?auto_127939 ?auto_127940 ) ( ON ?auto_127938 ?auto_127939 ) ( CLEAR ?auto_127936 ) ( ON ?auto_127937 ?auto_127938 ) ( CLEAR ?auto_127937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127941 ?auto_127940 ?auto_127939 ?auto_127938 )
      ( MAKE-8PILE ?auto_127934 ?auto_127935 ?auto_127936 ?auto_127937 ?auto_127938 ?auto_127939 ?auto_127940 ?auto_127941 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127942 - BLOCK
      ?auto_127943 - BLOCK
      ?auto_127944 - BLOCK
      ?auto_127945 - BLOCK
      ?auto_127946 - BLOCK
      ?auto_127947 - BLOCK
      ?auto_127948 - BLOCK
      ?auto_127949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127942 ) ( ON ?auto_127943 ?auto_127942 ) ( not ( = ?auto_127942 ?auto_127943 ) ) ( not ( = ?auto_127942 ?auto_127944 ) ) ( not ( = ?auto_127942 ?auto_127945 ) ) ( not ( = ?auto_127942 ?auto_127946 ) ) ( not ( = ?auto_127942 ?auto_127947 ) ) ( not ( = ?auto_127942 ?auto_127948 ) ) ( not ( = ?auto_127942 ?auto_127949 ) ) ( not ( = ?auto_127943 ?auto_127944 ) ) ( not ( = ?auto_127943 ?auto_127945 ) ) ( not ( = ?auto_127943 ?auto_127946 ) ) ( not ( = ?auto_127943 ?auto_127947 ) ) ( not ( = ?auto_127943 ?auto_127948 ) ) ( not ( = ?auto_127943 ?auto_127949 ) ) ( not ( = ?auto_127944 ?auto_127945 ) ) ( not ( = ?auto_127944 ?auto_127946 ) ) ( not ( = ?auto_127944 ?auto_127947 ) ) ( not ( = ?auto_127944 ?auto_127948 ) ) ( not ( = ?auto_127944 ?auto_127949 ) ) ( not ( = ?auto_127945 ?auto_127946 ) ) ( not ( = ?auto_127945 ?auto_127947 ) ) ( not ( = ?auto_127945 ?auto_127948 ) ) ( not ( = ?auto_127945 ?auto_127949 ) ) ( not ( = ?auto_127946 ?auto_127947 ) ) ( not ( = ?auto_127946 ?auto_127948 ) ) ( not ( = ?auto_127946 ?auto_127949 ) ) ( not ( = ?auto_127947 ?auto_127948 ) ) ( not ( = ?auto_127947 ?auto_127949 ) ) ( not ( = ?auto_127948 ?auto_127949 ) ) ( ON-TABLE ?auto_127949 ) ( ON ?auto_127948 ?auto_127949 ) ( ON ?auto_127947 ?auto_127948 ) ( ON ?auto_127946 ?auto_127947 ) ( ON ?auto_127945 ?auto_127946 ) ( CLEAR ?auto_127945 ) ( HOLDING ?auto_127944 ) ( CLEAR ?auto_127943 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127942 ?auto_127943 ?auto_127944 )
      ( MAKE-8PILE ?auto_127942 ?auto_127943 ?auto_127944 ?auto_127945 ?auto_127946 ?auto_127947 ?auto_127948 ?auto_127949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127950 - BLOCK
      ?auto_127951 - BLOCK
      ?auto_127952 - BLOCK
      ?auto_127953 - BLOCK
      ?auto_127954 - BLOCK
      ?auto_127955 - BLOCK
      ?auto_127956 - BLOCK
      ?auto_127957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127950 ) ( ON ?auto_127951 ?auto_127950 ) ( not ( = ?auto_127950 ?auto_127951 ) ) ( not ( = ?auto_127950 ?auto_127952 ) ) ( not ( = ?auto_127950 ?auto_127953 ) ) ( not ( = ?auto_127950 ?auto_127954 ) ) ( not ( = ?auto_127950 ?auto_127955 ) ) ( not ( = ?auto_127950 ?auto_127956 ) ) ( not ( = ?auto_127950 ?auto_127957 ) ) ( not ( = ?auto_127951 ?auto_127952 ) ) ( not ( = ?auto_127951 ?auto_127953 ) ) ( not ( = ?auto_127951 ?auto_127954 ) ) ( not ( = ?auto_127951 ?auto_127955 ) ) ( not ( = ?auto_127951 ?auto_127956 ) ) ( not ( = ?auto_127951 ?auto_127957 ) ) ( not ( = ?auto_127952 ?auto_127953 ) ) ( not ( = ?auto_127952 ?auto_127954 ) ) ( not ( = ?auto_127952 ?auto_127955 ) ) ( not ( = ?auto_127952 ?auto_127956 ) ) ( not ( = ?auto_127952 ?auto_127957 ) ) ( not ( = ?auto_127953 ?auto_127954 ) ) ( not ( = ?auto_127953 ?auto_127955 ) ) ( not ( = ?auto_127953 ?auto_127956 ) ) ( not ( = ?auto_127953 ?auto_127957 ) ) ( not ( = ?auto_127954 ?auto_127955 ) ) ( not ( = ?auto_127954 ?auto_127956 ) ) ( not ( = ?auto_127954 ?auto_127957 ) ) ( not ( = ?auto_127955 ?auto_127956 ) ) ( not ( = ?auto_127955 ?auto_127957 ) ) ( not ( = ?auto_127956 ?auto_127957 ) ) ( ON-TABLE ?auto_127957 ) ( ON ?auto_127956 ?auto_127957 ) ( ON ?auto_127955 ?auto_127956 ) ( ON ?auto_127954 ?auto_127955 ) ( ON ?auto_127953 ?auto_127954 ) ( CLEAR ?auto_127951 ) ( ON ?auto_127952 ?auto_127953 ) ( CLEAR ?auto_127952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127957 ?auto_127956 ?auto_127955 ?auto_127954 ?auto_127953 )
      ( MAKE-8PILE ?auto_127950 ?auto_127951 ?auto_127952 ?auto_127953 ?auto_127954 ?auto_127955 ?auto_127956 ?auto_127957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127958 - BLOCK
      ?auto_127959 - BLOCK
      ?auto_127960 - BLOCK
      ?auto_127961 - BLOCK
      ?auto_127962 - BLOCK
      ?auto_127963 - BLOCK
      ?auto_127964 - BLOCK
      ?auto_127965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127958 ) ( not ( = ?auto_127958 ?auto_127959 ) ) ( not ( = ?auto_127958 ?auto_127960 ) ) ( not ( = ?auto_127958 ?auto_127961 ) ) ( not ( = ?auto_127958 ?auto_127962 ) ) ( not ( = ?auto_127958 ?auto_127963 ) ) ( not ( = ?auto_127958 ?auto_127964 ) ) ( not ( = ?auto_127958 ?auto_127965 ) ) ( not ( = ?auto_127959 ?auto_127960 ) ) ( not ( = ?auto_127959 ?auto_127961 ) ) ( not ( = ?auto_127959 ?auto_127962 ) ) ( not ( = ?auto_127959 ?auto_127963 ) ) ( not ( = ?auto_127959 ?auto_127964 ) ) ( not ( = ?auto_127959 ?auto_127965 ) ) ( not ( = ?auto_127960 ?auto_127961 ) ) ( not ( = ?auto_127960 ?auto_127962 ) ) ( not ( = ?auto_127960 ?auto_127963 ) ) ( not ( = ?auto_127960 ?auto_127964 ) ) ( not ( = ?auto_127960 ?auto_127965 ) ) ( not ( = ?auto_127961 ?auto_127962 ) ) ( not ( = ?auto_127961 ?auto_127963 ) ) ( not ( = ?auto_127961 ?auto_127964 ) ) ( not ( = ?auto_127961 ?auto_127965 ) ) ( not ( = ?auto_127962 ?auto_127963 ) ) ( not ( = ?auto_127962 ?auto_127964 ) ) ( not ( = ?auto_127962 ?auto_127965 ) ) ( not ( = ?auto_127963 ?auto_127964 ) ) ( not ( = ?auto_127963 ?auto_127965 ) ) ( not ( = ?auto_127964 ?auto_127965 ) ) ( ON-TABLE ?auto_127965 ) ( ON ?auto_127964 ?auto_127965 ) ( ON ?auto_127963 ?auto_127964 ) ( ON ?auto_127962 ?auto_127963 ) ( ON ?auto_127961 ?auto_127962 ) ( ON ?auto_127960 ?auto_127961 ) ( CLEAR ?auto_127960 ) ( HOLDING ?auto_127959 ) ( CLEAR ?auto_127958 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127958 ?auto_127959 )
      ( MAKE-8PILE ?auto_127958 ?auto_127959 ?auto_127960 ?auto_127961 ?auto_127962 ?auto_127963 ?auto_127964 ?auto_127965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127966 - BLOCK
      ?auto_127967 - BLOCK
      ?auto_127968 - BLOCK
      ?auto_127969 - BLOCK
      ?auto_127970 - BLOCK
      ?auto_127971 - BLOCK
      ?auto_127972 - BLOCK
      ?auto_127973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127966 ) ( not ( = ?auto_127966 ?auto_127967 ) ) ( not ( = ?auto_127966 ?auto_127968 ) ) ( not ( = ?auto_127966 ?auto_127969 ) ) ( not ( = ?auto_127966 ?auto_127970 ) ) ( not ( = ?auto_127966 ?auto_127971 ) ) ( not ( = ?auto_127966 ?auto_127972 ) ) ( not ( = ?auto_127966 ?auto_127973 ) ) ( not ( = ?auto_127967 ?auto_127968 ) ) ( not ( = ?auto_127967 ?auto_127969 ) ) ( not ( = ?auto_127967 ?auto_127970 ) ) ( not ( = ?auto_127967 ?auto_127971 ) ) ( not ( = ?auto_127967 ?auto_127972 ) ) ( not ( = ?auto_127967 ?auto_127973 ) ) ( not ( = ?auto_127968 ?auto_127969 ) ) ( not ( = ?auto_127968 ?auto_127970 ) ) ( not ( = ?auto_127968 ?auto_127971 ) ) ( not ( = ?auto_127968 ?auto_127972 ) ) ( not ( = ?auto_127968 ?auto_127973 ) ) ( not ( = ?auto_127969 ?auto_127970 ) ) ( not ( = ?auto_127969 ?auto_127971 ) ) ( not ( = ?auto_127969 ?auto_127972 ) ) ( not ( = ?auto_127969 ?auto_127973 ) ) ( not ( = ?auto_127970 ?auto_127971 ) ) ( not ( = ?auto_127970 ?auto_127972 ) ) ( not ( = ?auto_127970 ?auto_127973 ) ) ( not ( = ?auto_127971 ?auto_127972 ) ) ( not ( = ?auto_127971 ?auto_127973 ) ) ( not ( = ?auto_127972 ?auto_127973 ) ) ( ON-TABLE ?auto_127973 ) ( ON ?auto_127972 ?auto_127973 ) ( ON ?auto_127971 ?auto_127972 ) ( ON ?auto_127970 ?auto_127971 ) ( ON ?auto_127969 ?auto_127970 ) ( ON ?auto_127968 ?auto_127969 ) ( CLEAR ?auto_127966 ) ( ON ?auto_127967 ?auto_127968 ) ( CLEAR ?auto_127967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127973 ?auto_127972 ?auto_127971 ?auto_127970 ?auto_127969 ?auto_127968 )
      ( MAKE-8PILE ?auto_127966 ?auto_127967 ?auto_127968 ?auto_127969 ?auto_127970 ?auto_127971 ?auto_127972 ?auto_127973 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127974 - BLOCK
      ?auto_127975 - BLOCK
      ?auto_127976 - BLOCK
      ?auto_127977 - BLOCK
      ?auto_127978 - BLOCK
      ?auto_127979 - BLOCK
      ?auto_127980 - BLOCK
      ?auto_127981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127974 ?auto_127975 ) ) ( not ( = ?auto_127974 ?auto_127976 ) ) ( not ( = ?auto_127974 ?auto_127977 ) ) ( not ( = ?auto_127974 ?auto_127978 ) ) ( not ( = ?auto_127974 ?auto_127979 ) ) ( not ( = ?auto_127974 ?auto_127980 ) ) ( not ( = ?auto_127974 ?auto_127981 ) ) ( not ( = ?auto_127975 ?auto_127976 ) ) ( not ( = ?auto_127975 ?auto_127977 ) ) ( not ( = ?auto_127975 ?auto_127978 ) ) ( not ( = ?auto_127975 ?auto_127979 ) ) ( not ( = ?auto_127975 ?auto_127980 ) ) ( not ( = ?auto_127975 ?auto_127981 ) ) ( not ( = ?auto_127976 ?auto_127977 ) ) ( not ( = ?auto_127976 ?auto_127978 ) ) ( not ( = ?auto_127976 ?auto_127979 ) ) ( not ( = ?auto_127976 ?auto_127980 ) ) ( not ( = ?auto_127976 ?auto_127981 ) ) ( not ( = ?auto_127977 ?auto_127978 ) ) ( not ( = ?auto_127977 ?auto_127979 ) ) ( not ( = ?auto_127977 ?auto_127980 ) ) ( not ( = ?auto_127977 ?auto_127981 ) ) ( not ( = ?auto_127978 ?auto_127979 ) ) ( not ( = ?auto_127978 ?auto_127980 ) ) ( not ( = ?auto_127978 ?auto_127981 ) ) ( not ( = ?auto_127979 ?auto_127980 ) ) ( not ( = ?auto_127979 ?auto_127981 ) ) ( not ( = ?auto_127980 ?auto_127981 ) ) ( ON-TABLE ?auto_127981 ) ( ON ?auto_127980 ?auto_127981 ) ( ON ?auto_127979 ?auto_127980 ) ( ON ?auto_127978 ?auto_127979 ) ( ON ?auto_127977 ?auto_127978 ) ( ON ?auto_127976 ?auto_127977 ) ( ON ?auto_127975 ?auto_127976 ) ( CLEAR ?auto_127975 ) ( HOLDING ?auto_127974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127974 )
      ( MAKE-8PILE ?auto_127974 ?auto_127975 ?auto_127976 ?auto_127977 ?auto_127978 ?auto_127979 ?auto_127980 ?auto_127981 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127982 - BLOCK
      ?auto_127983 - BLOCK
      ?auto_127984 - BLOCK
      ?auto_127985 - BLOCK
      ?auto_127986 - BLOCK
      ?auto_127987 - BLOCK
      ?auto_127988 - BLOCK
      ?auto_127989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127982 ?auto_127983 ) ) ( not ( = ?auto_127982 ?auto_127984 ) ) ( not ( = ?auto_127982 ?auto_127985 ) ) ( not ( = ?auto_127982 ?auto_127986 ) ) ( not ( = ?auto_127982 ?auto_127987 ) ) ( not ( = ?auto_127982 ?auto_127988 ) ) ( not ( = ?auto_127982 ?auto_127989 ) ) ( not ( = ?auto_127983 ?auto_127984 ) ) ( not ( = ?auto_127983 ?auto_127985 ) ) ( not ( = ?auto_127983 ?auto_127986 ) ) ( not ( = ?auto_127983 ?auto_127987 ) ) ( not ( = ?auto_127983 ?auto_127988 ) ) ( not ( = ?auto_127983 ?auto_127989 ) ) ( not ( = ?auto_127984 ?auto_127985 ) ) ( not ( = ?auto_127984 ?auto_127986 ) ) ( not ( = ?auto_127984 ?auto_127987 ) ) ( not ( = ?auto_127984 ?auto_127988 ) ) ( not ( = ?auto_127984 ?auto_127989 ) ) ( not ( = ?auto_127985 ?auto_127986 ) ) ( not ( = ?auto_127985 ?auto_127987 ) ) ( not ( = ?auto_127985 ?auto_127988 ) ) ( not ( = ?auto_127985 ?auto_127989 ) ) ( not ( = ?auto_127986 ?auto_127987 ) ) ( not ( = ?auto_127986 ?auto_127988 ) ) ( not ( = ?auto_127986 ?auto_127989 ) ) ( not ( = ?auto_127987 ?auto_127988 ) ) ( not ( = ?auto_127987 ?auto_127989 ) ) ( not ( = ?auto_127988 ?auto_127989 ) ) ( ON-TABLE ?auto_127989 ) ( ON ?auto_127988 ?auto_127989 ) ( ON ?auto_127987 ?auto_127988 ) ( ON ?auto_127986 ?auto_127987 ) ( ON ?auto_127985 ?auto_127986 ) ( ON ?auto_127984 ?auto_127985 ) ( ON ?auto_127983 ?auto_127984 ) ( ON ?auto_127982 ?auto_127983 ) ( CLEAR ?auto_127982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127989 ?auto_127988 ?auto_127987 ?auto_127986 ?auto_127985 ?auto_127984 ?auto_127983 )
      ( MAKE-8PILE ?auto_127982 ?auto_127983 ?auto_127984 ?auto_127985 ?auto_127986 ?auto_127987 ?auto_127988 ?auto_127989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127998 - BLOCK
      ?auto_127999 - BLOCK
      ?auto_128000 - BLOCK
      ?auto_128001 - BLOCK
      ?auto_128002 - BLOCK
      ?auto_128003 - BLOCK
      ?auto_128004 - BLOCK
      ?auto_128005 - BLOCK
    )
    :vars
    (
      ?auto_128006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127998 ?auto_127999 ) ) ( not ( = ?auto_127998 ?auto_128000 ) ) ( not ( = ?auto_127998 ?auto_128001 ) ) ( not ( = ?auto_127998 ?auto_128002 ) ) ( not ( = ?auto_127998 ?auto_128003 ) ) ( not ( = ?auto_127998 ?auto_128004 ) ) ( not ( = ?auto_127998 ?auto_128005 ) ) ( not ( = ?auto_127999 ?auto_128000 ) ) ( not ( = ?auto_127999 ?auto_128001 ) ) ( not ( = ?auto_127999 ?auto_128002 ) ) ( not ( = ?auto_127999 ?auto_128003 ) ) ( not ( = ?auto_127999 ?auto_128004 ) ) ( not ( = ?auto_127999 ?auto_128005 ) ) ( not ( = ?auto_128000 ?auto_128001 ) ) ( not ( = ?auto_128000 ?auto_128002 ) ) ( not ( = ?auto_128000 ?auto_128003 ) ) ( not ( = ?auto_128000 ?auto_128004 ) ) ( not ( = ?auto_128000 ?auto_128005 ) ) ( not ( = ?auto_128001 ?auto_128002 ) ) ( not ( = ?auto_128001 ?auto_128003 ) ) ( not ( = ?auto_128001 ?auto_128004 ) ) ( not ( = ?auto_128001 ?auto_128005 ) ) ( not ( = ?auto_128002 ?auto_128003 ) ) ( not ( = ?auto_128002 ?auto_128004 ) ) ( not ( = ?auto_128002 ?auto_128005 ) ) ( not ( = ?auto_128003 ?auto_128004 ) ) ( not ( = ?auto_128003 ?auto_128005 ) ) ( not ( = ?auto_128004 ?auto_128005 ) ) ( ON-TABLE ?auto_128005 ) ( ON ?auto_128004 ?auto_128005 ) ( ON ?auto_128003 ?auto_128004 ) ( ON ?auto_128002 ?auto_128003 ) ( ON ?auto_128001 ?auto_128002 ) ( ON ?auto_128000 ?auto_128001 ) ( ON ?auto_127999 ?auto_128000 ) ( CLEAR ?auto_127999 ) ( ON ?auto_127998 ?auto_128006 ) ( CLEAR ?auto_127998 ) ( HAND-EMPTY ) ( not ( = ?auto_127998 ?auto_128006 ) ) ( not ( = ?auto_127999 ?auto_128006 ) ) ( not ( = ?auto_128000 ?auto_128006 ) ) ( not ( = ?auto_128001 ?auto_128006 ) ) ( not ( = ?auto_128002 ?auto_128006 ) ) ( not ( = ?auto_128003 ?auto_128006 ) ) ( not ( = ?auto_128004 ?auto_128006 ) ) ( not ( = ?auto_128005 ?auto_128006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127998 ?auto_128006 )
      ( MAKE-8PILE ?auto_127998 ?auto_127999 ?auto_128000 ?auto_128001 ?auto_128002 ?auto_128003 ?auto_128004 ?auto_128005 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128007 - BLOCK
      ?auto_128008 - BLOCK
      ?auto_128009 - BLOCK
      ?auto_128010 - BLOCK
      ?auto_128011 - BLOCK
      ?auto_128012 - BLOCK
      ?auto_128013 - BLOCK
      ?auto_128014 - BLOCK
    )
    :vars
    (
      ?auto_128015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128007 ?auto_128008 ) ) ( not ( = ?auto_128007 ?auto_128009 ) ) ( not ( = ?auto_128007 ?auto_128010 ) ) ( not ( = ?auto_128007 ?auto_128011 ) ) ( not ( = ?auto_128007 ?auto_128012 ) ) ( not ( = ?auto_128007 ?auto_128013 ) ) ( not ( = ?auto_128007 ?auto_128014 ) ) ( not ( = ?auto_128008 ?auto_128009 ) ) ( not ( = ?auto_128008 ?auto_128010 ) ) ( not ( = ?auto_128008 ?auto_128011 ) ) ( not ( = ?auto_128008 ?auto_128012 ) ) ( not ( = ?auto_128008 ?auto_128013 ) ) ( not ( = ?auto_128008 ?auto_128014 ) ) ( not ( = ?auto_128009 ?auto_128010 ) ) ( not ( = ?auto_128009 ?auto_128011 ) ) ( not ( = ?auto_128009 ?auto_128012 ) ) ( not ( = ?auto_128009 ?auto_128013 ) ) ( not ( = ?auto_128009 ?auto_128014 ) ) ( not ( = ?auto_128010 ?auto_128011 ) ) ( not ( = ?auto_128010 ?auto_128012 ) ) ( not ( = ?auto_128010 ?auto_128013 ) ) ( not ( = ?auto_128010 ?auto_128014 ) ) ( not ( = ?auto_128011 ?auto_128012 ) ) ( not ( = ?auto_128011 ?auto_128013 ) ) ( not ( = ?auto_128011 ?auto_128014 ) ) ( not ( = ?auto_128012 ?auto_128013 ) ) ( not ( = ?auto_128012 ?auto_128014 ) ) ( not ( = ?auto_128013 ?auto_128014 ) ) ( ON-TABLE ?auto_128014 ) ( ON ?auto_128013 ?auto_128014 ) ( ON ?auto_128012 ?auto_128013 ) ( ON ?auto_128011 ?auto_128012 ) ( ON ?auto_128010 ?auto_128011 ) ( ON ?auto_128009 ?auto_128010 ) ( ON ?auto_128007 ?auto_128015 ) ( CLEAR ?auto_128007 ) ( not ( = ?auto_128007 ?auto_128015 ) ) ( not ( = ?auto_128008 ?auto_128015 ) ) ( not ( = ?auto_128009 ?auto_128015 ) ) ( not ( = ?auto_128010 ?auto_128015 ) ) ( not ( = ?auto_128011 ?auto_128015 ) ) ( not ( = ?auto_128012 ?auto_128015 ) ) ( not ( = ?auto_128013 ?auto_128015 ) ) ( not ( = ?auto_128014 ?auto_128015 ) ) ( HOLDING ?auto_128008 ) ( CLEAR ?auto_128009 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128014 ?auto_128013 ?auto_128012 ?auto_128011 ?auto_128010 ?auto_128009 ?auto_128008 )
      ( MAKE-8PILE ?auto_128007 ?auto_128008 ?auto_128009 ?auto_128010 ?auto_128011 ?auto_128012 ?auto_128013 ?auto_128014 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128016 - BLOCK
      ?auto_128017 - BLOCK
      ?auto_128018 - BLOCK
      ?auto_128019 - BLOCK
      ?auto_128020 - BLOCK
      ?auto_128021 - BLOCK
      ?auto_128022 - BLOCK
      ?auto_128023 - BLOCK
    )
    :vars
    (
      ?auto_128024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128016 ?auto_128017 ) ) ( not ( = ?auto_128016 ?auto_128018 ) ) ( not ( = ?auto_128016 ?auto_128019 ) ) ( not ( = ?auto_128016 ?auto_128020 ) ) ( not ( = ?auto_128016 ?auto_128021 ) ) ( not ( = ?auto_128016 ?auto_128022 ) ) ( not ( = ?auto_128016 ?auto_128023 ) ) ( not ( = ?auto_128017 ?auto_128018 ) ) ( not ( = ?auto_128017 ?auto_128019 ) ) ( not ( = ?auto_128017 ?auto_128020 ) ) ( not ( = ?auto_128017 ?auto_128021 ) ) ( not ( = ?auto_128017 ?auto_128022 ) ) ( not ( = ?auto_128017 ?auto_128023 ) ) ( not ( = ?auto_128018 ?auto_128019 ) ) ( not ( = ?auto_128018 ?auto_128020 ) ) ( not ( = ?auto_128018 ?auto_128021 ) ) ( not ( = ?auto_128018 ?auto_128022 ) ) ( not ( = ?auto_128018 ?auto_128023 ) ) ( not ( = ?auto_128019 ?auto_128020 ) ) ( not ( = ?auto_128019 ?auto_128021 ) ) ( not ( = ?auto_128019 ?auto_128022 ) ) ( not ( = ?auto_128019 ?auto_128023 ) ) ( not ( = ?auto_128020 ?auto_128021 ) ) ( not ( = ?auto_128020 ?auto_128022 ) ) ( not ( = ?auto_128020 ?auto_128023 ) ) ( not ( = ?auto_128021 ?auto_128022 ) ) ( not ( = ?auto_128021 ?auto_128023 ) ) ( not ( = ?auto_128022 ?auto_128023 ) ) ( ON-TABLE ?auto_128023 ) ( ON ?auto_128022 ?auto_128023 ) ( ON ?auto_128021 ?auto_128022 ) ( ON ?auto_128020 ?auto_128021 ) ( ON ?auto_128019 ?auto_128020 ) ( ON ?auto_128018 ?auto_128019 ) ( ON ?auto_128016 ?auto_128024 ) ( not ( = ?auto_128016 ?auto_128024 ) ) ( not ( = ?auto_128017 ?auto_128024 ) ) ( not ( = ?auto_128018 ?auto_128024 ) ) ( not ( = ?auto_128019 ?auto_128024 ) ) ( not ( = ?auto_128020 ?auto_128024 ) ) ( not ( = ?auto_128021 ?auto_128024 ) ) ( not ( = ?auto_128022 ?auto_128024 ) ) ( not ( = ?auto_128023 ?auto_128024 ) ) ( CLEAR ?auto_128018 ) ( ON ?auto_128017 ?auto_128016 ) ( CLEAR ?auto_128017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128024 ?auto_128016 )
      ( MAKE-8PILE ?auto_128016 ?auto_128017 ?auto_128018 ?auto_128019 ?auto_128020 ?auto_128021 ?auto_128022 ?auto_128023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128025 - BLOCK
      ?auto_128026 - BLOCK
      ?auto_128027 - BLOCK
      ?auto_128028 - BLOCK
      ?auto_128029 - BLOCK
      ?auto_128030 - BLOCK
      ?auto_128031 - BLOCK
      ?auto_128032 - BLOCK
    )
    :vars
    (
      ?auto_128033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128025 ?auto_128026 ) ) ( not ( = ?auto_128025 ?auto_128027 ) ) ( not ( = ?auto_128025 ?auto_128028 ) ) ( not ( = ?auto_128025 ?auto_128029 ) ) ( not ( = ?auto_128025 ?auto_128030 ) ) ( not ( = ?auto_128025 ?auto_128031 ) ) ( not ( = ?auto_128025 ?auto_128032 ) ) ( not ( = ?auto_128026 ?auto_128027 ) ) ( not ( = ?auto_128026 ?auto_128028 ) ) ( not ( = ?auto_128026 ?auto_128029 ) ) ( not ( = ?auto_128026 ?auto_128030 ) ) ( not ( = ?auto_128026 ?auto_128031 ) ) ( not ( = ?auto_128026 ?auto_128032 ) ) ( not ( = ?auto_128027 ?auto_128028 ) ) ( not ( = ?auto_128027 ?auto_128029 ) ) ( not ( = ?auto_128027 ?auto_128030 ) ) ( not ( = ?auto_128027 ?auto_128031 ) ) ( not ( = ?auto_128027 ?auto_128032 ) ) ( not ( = ?auto_128028 ?auto_128029 ) ) ( not ( = ?auto_128028 ?auto_128030 ) ) ( not ( = ?auto_128028 ?auto_128031 ) ) ( not ( = ?auto_128028 ?auto_128032 ) ) ( not ( = ?auto_128029 ?auto_128030 ) ) ( not ( = ?auto_128029 ?auto_128031 ) ) ( not ( = ?auto_128029 ?auto_128032 ) ) ( not ( = ?auto_128030 ?auto_128031 ) ) ( not ( = ?auto_128030 ?auto_128032 ) ) ( not ( = ?auto_128031 ?auto_128032 ) ) ( ON-TABLE ?auto_128032 ) ( ON ?auto_128031 ?auto_128032 ) ( ON ?auto_128030 ?auto_128031 ) ( ON ?auto_128029 ?auto_128030 ) ( ON ?auto_128028 ?auto_128029 ) ( ON ?auto_128025 ?auto_128033 ) ( not ( = ?auto_128025 ?auto_128033 ) ) ( not ( = ?auto_128026 ?auto_128033 ) ) ( not ( = ?auto_128027 ?auto_128033 ) ) ( not ( = ?auto_128028 ?auto_128033 ) ) ( not ( = ?auto_128029 ?auto_128033 ) ) ( not ( = ?auto_128030 ?auto_128033 ) ) ( not ( = ?auto_128031 ?auto_128033 ) ) ( not ( = ?auto_128032 ?auto_128033 ) ) ( ON ?auto_128026 ?auto_128025 ) ( CLEAR ?auto_128026 ) ( ON-TABLE ?auto_128033 ) ( HOLDING ?auto_128027 ) ( CLEAR ?auto_128028 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128032 ?auto_128031 ?auto_128030 ?auto_128029 ?auto_128028 ?auto_128027 )
      ( MAKE-8PILE ?auto_128025 ?auto_128026 ?auto_128027 ?auto_128028 ?auto_128029 ?auto_128030 ?auto_128031 ?auto_128032 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128034 - BLOCK
      ?auto_128035 - BLOCK
      ?auto_128036 - BLOCK
      ?auto_128037 - BLOCK
      ?auto_128038 - BLOCK
      ?auto_128039 - BLOCK
      ?auto_128040 - BLOCK
      ?auto_128041 - BLOCK
    )
    :vars
    (
      ?auto_128042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128034 ?auto_128035 ) ) ( not ( = ?auto_128034 ?auto_128036 ) ) ( not ( = ?auto_128034 ?auto_128037 ) ) ( not ( = ?auto_128034 ?auto_128038 ) ) ( not ( = ?auto_128034 ?auto_128039 ) ) ( not ( = ?auto_128034 ?auto_128040 ) ) ( not ( = ?auto_128034 ?auto_128041 ) ) ( not ( = ?auto_128035 ?auto_128036 ) ) ( not ( = ?auto_128035 ?auto_128037 ) ) ( not ( = ?auto_128035 ?auto_128038 ) ) ( not ( = ?auto_128035 ?auto_128039 ) ) ( not ( = ?auto_128035 ?auto_128040 ) ) ( not ( = ?auto_128035 ?auto_128041 ) ) ( not ( = ?auto_128036 ?auto_128037 ) ) ( not ( = ?auto_128036 ?auto_128038 ) ) ( not ( = ?auto_128036 ?auto_128039 ) ) ( not ( = ?auto_128036 ?auto_128040 ) ) ( not ( = ?auto_128036 ?auto_128041 ) ) ( not ( = ?auto_128037 ?auto_128038 ) ) ( not ( = ?auto_128037 ?auto_128039 ) ) ( not ( = ?auto_128037 ?auto_128040 ) ) ( not ( = ?auto_128037 ?auto_128041 ) ) ( not ( = ?auto_128038 ?auto_128039 ) ) ( not ( = ?auto_128038 ?auto_128040 ) ) ( not ( = ?auto_128038 ?auto_128041 ) ) ( not ( = ?auto_128039 ?auto_128040 ) ) ( not ( = ?auto_128039 ?auto_128041 ) ) ( not ( = ?auto_128040 ?auto_128041 ) ) ( ON-TABLE ?auto_128041 ) ( ON ?auto_128040 ?auto_128041 ) ( ON ?auto_128039 ?auto_128040 ) ( ON ?auto_128038 ?auto_128039 ) ( ON ?auto_128037 ?auto_128038 ) ( ON ?auto_128034 ?auto_128042 ) ( not ( = ?auto_128034 ?auto_128042 ) ) ( not ( = ?auto_128035 ?auto_128042 ) ) ( not ( = ?auto_128036 ?auto_128042 ) ) ( not ( = ?auto_128037 ?auto_128042 ) ) ( not ( = ?auto_128038 ?auto_128042 ) ) ( not ( = ?auto_128039 ?auto_128042 ) ) ( not ( = ?auto_128040 ?auto_128042 ) ) ( not ( = ?auto_128041 ?auto_128042 ) ) ( ON ?auto_128035 ?auto_128034 ) ( ON-TABLE ?auto_128042 ) ( CLEAR ?auto_128037 ) ( ON ?auto_128036 ?auto_128035 ) ( CLEAR ?auto_128036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128042 ?auto_128034 ?auto_128035 )
      ( MAKE-8PILE ?auto_128034 ?auto_128035 ?auto_128036 ?auto_128037 ?auto_128038 ?auto_128039 ?auto_128040 ?auto_128041 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128043 - BLOCK
      ?auto_128044 - BLOCK
      ?auto_128045 - BLOCK
      ?auto_128046 - BLOCK
      ?auto_128047 - BLOCK
      ?auto_128048 - BLOCK
      ?auto_128049 - BLOCK
      ?auto_128050 - BLOCK
    )
    :vars
    (
      ?auto_128051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128043 ?auto_128044 ) ) ( not ( = ?auto_128043 ?auto_128045 ) ) ( not ( = ?auto_128043 ?auto_128046 ) ) ( not ( = ?auto_128043 ?auto_128047 ) ) ( not ( = ?auto_128043 ?auto_128048 ) ) ( not ( = ?auto_128043 ?auto_128049 ) ) ( not ( = ?auto_128043 ?auto_128050 ) ) ( not ( = ?auto_128044 ?auto_128045 ) ) ( not ( = ?auto_128044 ?auto_128046 ) ) ( not ( = ?auto_128044 ?auto_128047 ) ) ( not ( = ?auto_128044 ?auto_128048 ) ) ( not ( = ?auto_128044 ?auto_128049 ) ) ( not ( = ?auto_128044 ?auto_128050 ) ) ( not ( = ?auto_128045 ?auto_128046 ) ) ( not ( = ?auto_128045 ?auto_128047 ) ) ( not ( = ?auto_128045 ?auto_128048 ) ) ( not ( = ?auto_128045 ?auto_128049 ) ) ( not ( = ?auto_128045 ?auto_128050 ) ) ( not ( = ?auto_128046 ?auto_128047 ) ) ( not ( = ?auto_128046 ?auto_128048 ) ) ( not ( = ?auto_128046 ?auto_128049 ) ) ( not ( = ?auto_128046 ?auto_128050 ) ) ( not ( = ?auto_128047 ?auto_128048 ) ) ( not ( = ?auto_128047 ?auto_128049 ) ) ( not ( = ?auto_128047 ?auto_128050 ) ) ( not ( = ?auto_128048 ?auto_128049 ) ) ( not ( = ?auto_128048 ?auto_128050 ) ) ( not ( = ?auto_128049 ?auto_128050 ) ) ( ON-TABLE ?auto_128050 ) ( ON ?auto_128049 ?auto_128050 ) ( ON ?auto_128048 ?auto_128049 ) ( ON ?auto_128047 ?auto_128048 ) ( ON ?auto_128043 ?auto_128051 ) ( not ( = ?auto_128043 ?auto_128051 ) ) ( not ( = ?auto_128044 ?auto_128051 ) ) ( not ( = ?auto_128045 ?auto_128051 ) ) ( not ( = ?auto_128046 ?auto_128051 ) ) ( not ( = ?auto_128047 ?auto_128051 ) ) ( not ( = ?auto_128048 ?auto_128051 ) ) ( not ( = ?auto_128049 ?auto_128051 ) ) ( not ( = ?auto_128050 ?auto_128051 ) ) ( ON ?auto_128044 ?auto_128043 ) ( ON-TABLE ?auto_128051 ) ( ON ?auto_128045 ?auto_128044 ) ( CLEAR ?auto_128045 ) ( HOLDING ?auto_128046 ) ( CLEAR ?auto_128047 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128050 ?auto_128049 ?auto_128048 ?auto_128047 ?auto_128046 )
      ( MAKE-8PILE ?auto_128043 ?auto_128044 ?auto_128045 ?auto_128046 ?auto_128047 ?auto_128048 ?auto_128049 ?auto_128050 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128052 - BLOCK
      ?auto_128053 - BLOCK
      ?auto_128054 - BLOCK
      ?auto_128055 - BLOCK
      ?auto_128056 - BLOCK
      ?auto_128057 - BLOCK
      ?auto_128058 - BLOCK
      ?auto_128059 - BLOCK
    )
    :vars
    (
      ?auto_128060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128052 ?auto_128053 ) ) ( not ( = ?auto_128052 ?auto_128054 ) ) ( not ( = ?auto_128052 ?auto_128055 ) ) ( not ( = ?auto_128052 ?auto_128056 ) ) ( not ( = ?auto_128052 ?auto_128057 ) ) ( not ( = ?auto_128052 ?auto_128058 ) ) ( not ( = ?auto_128052 ?auto_128059 ) ) ( not ( = ?auto_128053 ?auto_128054 ) ) ( not ( = ?auto_128053 ?auto_128055 ) ) ( not ( = ?auto_128053 ?auto_128056 ) ) ( not ( = ?auto_128053 ?auto_128057 ) ) ( not ( = ?auto_128053 ?auto_128058 ) ) ( not ( = ?auto_128053 ?auto_128059 ) ) ( not ( = ?auto_128054 ?auto_128055 ) ) ( not ( = ?auto_128054 ?auto_128056 ) ) ( not ( = ?auto_128054 ?auto_128057 ) ) ( not ( = ?auto_128054 ?auto_128058 ) ) ( not ( = ?auto_128054 ?auto_128059 ) ) ( not ( = ?auto_128055 ?auto_128056 ) ) ( not ( = ?auto_128055 ?auto_128057 ) ) ( not ( = ?auto_128055 ?auto_128058 ) ) ( not ( = ?auto_128055 ?auto_128059 ) ) ( not ( = ?auto_128056 ?auto_128057 ) ) ( not ( = ?auto_128056 ?auto_128058 ) ) ( not ( = ?auto_128056 ?auto_128059 ) ) ( not ( = ?auto_128057 ?auto_128058 ) ) ( not ( = ?auto_128057 ?auto_128059 ) ) ( not ( = ?auto_128058 ?auto_128059 ) ) ( ON-TABLE ?auto_128059 ) ( ON ?auto_128058 ?auto_128059 ) ( ON ?auto_128057 ?auto_128058 ) ( ON ?auto_128056 ?auto_128057 ) ( ON ?auto_128052 ?auto_128060 ) ( not ( = ?auto_128052 ?auto_128060 ) ) ( not ( = ?auto_128053 ?auto_128060 ) ) ( not ( = ?auto_128054 ?auto_128060 ) ) ( not ( = ?auto_128055 ?auto_128060 ) ) ( not ( = ?auto_128056 ?auto_128060 ) ) ( not ( = ?auto_128057 ?auto_128060 ) ) ( not ( = ?auto_128058 ?auto_128060 ) ) ( not ( = ?auto_128059 ?auto_128060 ) ) ( ON ?auto_128053 ?auto_128052 ) ( ON-TABLE ?auto_128060 ) ( ON ?auto_128054 ?auto_128053 ) ( CLEAR ?auto_128056 ) ( ON ?auto_128055 ?auto_128054 ) ( CLEAR ?auto_128055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128060 ?auto_128052 ?auto_128053 ?auto_128054 )
      ( MAKE-8PILE ?auto_128052 ?auto_128053 ?auto_128054 ?auto_128055 ?auto_128056 ?auto_128057 ?auto_128058 ?auto_128059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128061 - BLOCK
      ?auto_128062 - BLOCK
      ?auto_128063 - BLOCK
      ?auto_128064 - BLOCK
      ?auto_128065 - BLOCK
      ?auto_128066 - BLOCK
      ?auto_128067 - BLOCK
      ?auto_128068 - BLOCK
    )
    :vars
    (
      ?auto_128069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128061 ?auto_128062 ) ) ( not ( = ?auto_128061 ?auto_128063 ) ) ( not ( = ?auto_128061 ?auto_128064 ) ) ( not ( = ?auto_128061 ?auto_128065 ) ) ( not ( = ?auto_128061 ?auto_128066 ) ) ( not ( = ?auto_128061 ?auto_128067 ) ) ( not ( = ?auto_128061 ?auto_128068 ) ) ( not ( = ?auto_128062 ?auto_128063 ) ) ( not ( = ?auto_128062 ?auto_128064 ) ) ( not ( = ?auto_128062 ?auto_128065 ) ) ( not ( = ?auto_128062 ?auto_128066 ) ) ( not ( = ?auto_128062 ?auto_128067 ) ) ( not ( = ?auto_128062 ?auto_128068 ) ) ( not ( = ?auto_128063 ?auto_128064 ) ) ( not ( = ?auto_128063 ?auto_128065 ) ) ( not ( = ?auto_128063 ?auto_128066 ) ) ( not ( = ?auto_128063 ?auto_128067 ) ) ( not ( = ?auto_128063 ?auto_128068 ) ) ( not ( = ?auto_128064 ?auto_128065 ) ) ( not ( = ?auto_128064 ?auto_128066 ) ) ( not ( = ?auto_128064 ?auto_128067 ) ) ( not ( = ?auto_128064 ?auto_128068 ) ) ( not ( = ?auto_128065 ?auto_128066 ) ) ( not ( = ?auto_128065 ?auto_128067 ) ) ( not ( = ?auto_128065 ?auto_128068 ) ) ( not ( = ?auto_128066 ?auto_128067 ) ) ( not ( = ?auto_128066 ?auto_128068 ) ) ( not ( = ?auto_128067 ?auto_128068 ) ) ( ON-TABLE ?auto_128068 ) ( ON ?auto_128067 ?auto_128068 ) ( ON ?auto_128066 ?auto_128067 ) ( ON ?auto_128061 ?auto_128069 ) ( not ( = ?auto_128061 ?auto_128069 ) ) ( not ( = ?auto_128062 ?auto_128069 ) ) ( not ( = ?auto_128063 ?auto_128069 ) ) ( not ( = ?auto_128064 ?auto_128069 ) ) ( not ( = ?auto_128065 ?auto_128069 ) ) ( not ( = ?auto_128066 ?auto_128069 ) ) ( not ( = ?auto_128067 ?auto_128069 ) ) ( not ( = ?auto_128068 ?auto_128069 ) ) ( ON ?auto_128062 ?auto_128061 ) ( ON-TABLE ?auto_128069 ) ( ON ?auto_128063 ?auto_128062 ) ( ON ?auto_128064 ?auto_128063 ) ( CLEAR ?auto_128064 ) ( HOLDING ?auto_128065 ) ( CLEAR ?auto_128066 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128068 ?auto_128067 ?auto_128066 ?auto_128065 )
      ( MAKE-8PILE ?auto_128061 ?auto_128062 ?auto_128063 ?auto_128064 ?auto_128065 ?auto_128066 ?auto_128067 ?auto_128068 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128070 - BLOCK
      ?auto_128071 - BLOCK
      ?auto_128072 - BLOCK
      ?auto_128073 - BLOCK
      ?auto_128074 - BLOCK
      ?auto_128075 - BLOCK
      ?auto_128076 - BLOCK
      ?auto_128077 - BLOCK
    )
    :vars
    (
      ?auto_128078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128070 ?auto_128071 ) ) ( not ( = ?auto_128070 ?auto_128072 ) ) ( not ( = ?auto_128070 ?auto_128073 ) ) ( not ( = ?auto_128070 ?auto_128074 ) ) ( not ( = ?auto_128070 ?auto_128075 ) ) ( not ( = ?auto_128070 ?auto_128076 ) ) ( not ( = ?auto_128070 ?auto_128077 ) ) ( not ( = ?auto_128071 ?auto_128072 ) ) ( not ( = ?auto_128071 ?auto_128073 ) ) ( not ( = ?auto_128071 ?auto_128074 ) ) ( not ( = ?auto_128071 ?auto_128075 ) ) ( not ( = ?auto_128071 ?auto_128076 ) ) ( not ( = ?auto_128071 ?auto_128077 ) ) ( not ( = ?auto_128072 ?auto_128073 ) ) ( not ( = ?auto_128072 ?auto_128074 ) ) ( not ( = ?auto_128072 ?auto_128075 ) ) ( not ( = ?auto_128072 ?auto_128076 ) ) ( not ( = ?auto_128072 ?auto_128077 ) ) ( not ( = ?auto_128073 ?auto_128074 ) ) ( not ( = ?auto_128073 ?auto_128075 ) ) ( not ( = ?auto_128073 ?auto_128076 ) ) ( not ( = ?auto_128073 ?auto_128077 ) ) ( not ( = ?auto_128074 ?auto_128075 ) ) ( not ( = ?auto_128074 ?auto_128076 ) ) ( not ( = ?auto_128074 ?auto_128077 ) ) ( not ( = ?auto_128075 ?auto_128076 ) ) ( not ( = ?auto_128075 ?auto_128077 ) ) ( not ( = ?auto_128076 ?auto_128077 ) ) ( ON-TABLE ?auto_128077 ) ( ON ?auto_128076 ?auto_128077 ) ( ON ?auto_128075 ?auto_128076 ) ( ON ?auto_128070 ?auto_128078 ) ( not ( = ?auto_128070 ?auto_128078 ) ) ( not ( = ?auto_128071 ?auto_128078 ) ) ( not ( = ?auto_128072 ?auto_128078 ) ) ( not ( = ?auto_128073 ?auto_128078 ) ) ( not ( = ?auto_128074 ?auto_128078 ) ) ( not ( = ?auto_128075 ?auto_128078 ) ) ( not ( = ?auto_128076 ?auto_128078 ) ) ( not ( = ?auto_128077 ?auto_128078 ) ) ( ON ?auto_128071 ?auto_128070 ) ( ON-TABLE ?auto_128078 ) ( ON ?auto_128072 ?auto_128071 ) ( ON ?auto_128073 ?auto_128072 ) ( CLEAR ?auto_128075 ) ( ON ?auto_128074 ?auto_128073 ) ( CLEAR ?auto_128074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128078 ?auto_128070 ?auto_128071 ?auto_128072 ?auto_128073 )
      ( MAKE-8PILE ?auto_128070 ?auto_128071 ?auto_128072 ?auto_128073 ?auto_128074 ?auto_128075 ?auto_128076 ?auto_128077 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128079 - BLOCK
      ?auto_128080 - BLOCK
      ?auto_128081 - BLOCK
      ?auto_128082 - BLOCK
      ?auto_128083 - BLOCK
      ?auto_128084 - BLOCK
      ?auto_128085 - BLOCK
      ?auto_128086 - BLOCK
    )
    :vars
    (
      ?auto_128087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128079 ?auto_128080 ) ) ( not ( = ?auto_128079 ?auto_128081 ) ) ( not ( = ?auto_128079 ?auto_128082 ) ) ( not ( = ?auto_128079 ?auto_128083 ) ) ( not ( = ?auto_128079 ?auto_128084 ) ) ( not ( = ?auto_128079 ?auto_128085 ) ) ( not ( = ?auto_128079 ?auto_128086 ) ) ( not ( = ?auto_128080 ?auto_128081 ) ) ( not ( = ?auto_128080 ?auto_128082 ) ) ( not ( = ?auto_128080 ?auto_128083 ) ) ( not ( = ?auto_128080 ?auto_128084 ) ) ( not ( = ?auto_128080 ?auto_128085 ) ) ( not ( = ?auto_128080 ?auto_128086 ) ) ( not ( = ?auto_128081 ?auto_128082 ) ) ( not ( = ?auto_128081 ?auto_128083 ) ) ( not ( = ?auto_128081 ?auto_128084 ) ) ( not ( = ?auto_128081 ?auto_128085 ) ) ( not ( = ?auto_128081 ?auto_128086 ) ) ( not ( = ?auto_128082 ?auto_128083 ) ) ( not ( = ?auto_128082 ?auto_128084 ) ) ( not ( = ?auto_128082 ?auto_128085 ) ) ( not ( = ?auto_128082 ?auto_128086 ) ) ( not ( = ?auto_128083 ?auto_128084 ) ) ( not ( = ?auto_128083 ?auto_128085 ) ) ( not ( = ?auto_128083 ?auto_128086 ) ) ( not ( = ?auto_128084 ?auto_128085 ) ) ( not ( = ?auto_128084 ?auto_128086 ) ) ( not ( = ?auto_128085 ?auto_128086 ) ) ( ON-TABLE ?auto_128086 ) ( ON ?auto_128085 ?auto_128086 ) ( ON ?auto_128079 ?auto_128087 ) ( not ( = ?auto_128079 ?auto_128087 ) ) ( not ( = ?auto_128080 ?auto_128087 ) ) ( not ( = ?auto_128081 ?auto_128087 ) ) ( not ( = ?auto_128082 ?auto_128087 ) ) ( not ( = ?auto_128083 ?auto_128087 ) ) ( not ( = ?auto_128084 ?auto_128087 ) ) ( not ( = ?auto_128085 ?auto_128087 ) ) ( not ( = ?auto_128086 ?auto_128087 ) ) ( ON ?auto_128080 ?auto_128079 ) ( ON-TABLE ?auto_128087 ) ( ON ?auto_128081 ?auto_128080 ) ( ON ?auto_128082 ?auto_128081 ) ( ON ?auto_128083 ?auto_128082 ) ( CLEAR ?auto_128083 ) ( HOLDING ?auto_128084 ) ( CLEAR ?auto_128085 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128086 ?auto_128085 ?auto_128084 )
      ( MAKE-8PILE ?auto_128079 ?auto_128080 ?auto_128081 ?auto_128082 ?auto_128083 ?auto_128084 ?auto_128085 ?auto_128086 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128088 - BLOCK
      ?auto_128089 - BLOCK
      ?auto_128090 - BLOCK
      ?auto_128091 - BLOCK
      ?auto_128092 - BLOCK
      ?auto_128093 - BLOCK
      ?auto_128094 - BLOCK
      ?auto_128095 - BLOCK
    )
    :vars
    (
      ?auto_128096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128088 ?auto_128089 ) ) ( not ( = ?auto_128088 ?auto_128090 ) ) ( not ( = ?auto_128088 ?auto_128091 ) ) ( not ( = ?auto_128088 ?auto_128092 ) ) ( not ( = ?auto_128088 ?auto_128093 ) ) ( not ( = ?auto_128088 ?auto_128094 ) ) ( not ( = ?auto_128088 ?auto_128095 ) ) ( not ( = ?auto_128089 ?auto_128090 ) ) ( not ( = ?auto_128089 ?auto_128091 ) ) ( not ( = ?auto_128089 ?auto_128092 ) ) ( not ( = ?auto_128089 ?auto_128093 ) ) ( not ( = ?auto_128089 ?auto_128094 ) ) ( not ( = ?auto_128089 ?auto_128095 ) ) ( not ( = ?auto_128090 ?auto_128091 ) ) ( not ( = ?auto_128090 ?auto_128092 ) ) ( not ( = ?auto_128090 ?auto_128093 ) ) ( not ( = ?auto_128090 ?auto_128094 ) ) ( not ( = ?auto_128090 ?auto_128095 ) ) ( not ( = ?auto_128091 ?auto_128092 ) ) ( not ( = ?auto_128091 ?auto_128093 ) ) ( not ( = ?auto_128091 ?auto_128094 ) ) ( not ( = ?auto_128091 ?auto_128095 ) ) ( not ( = ?auto_128092 ?auto_128093 ) ) ( not ( = ?auto_128092 ?auto_128094 ) ) ( not ( = ?auto_128092 ?auto_128095 ) ) ( not ( = ?auto_128093 ?auto_128094 ) ) ( not ( = ?auto_128093 ?auto_128095 ) ) ( not ( = ?auto_128094 ?auto_128095 ) ) ( ON-TABLE ?auto_128095 ) ( ON ?auto_128094 ?auto_128095 ) ( ON ?auto_128088 ?auto_128096 ) ( not ( = ?auto_128088 ?auto_128096 ) ) ( not ( = ?auto_128089 ?auto_128096 ) ) ( not ( = ?auto_128090 ?auto_128096 ) ) ( not ( = ?auto_128091 ?auto_128096 ) ) ( not ( = ?auto_128092 ?auto_128096 ) ) ( not ( = ?auto_128093 ?auto_128096 ) ) ( not ( = ?auto_128094 ?auto_128096 ) ) ( not ( = ?auto_128095 ?auto_128096 ) ) ( ON ?auto_128089 ?auto_128088 ) ( ON-TABLE ?auto_128096 ) ( ON ?auto_128090 ?auto_128089 ) ( ON ?auto_128091 ?auto_128090 ) ( ON ?auto_128092 ?auto_128091 ) ( CLEAR ?auto_128094 ) ( ON ?auto_128093 ?auto_128092 ) ( CLEAR ?auto_128093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128096 ?auto_128088 ?auto_128089 ?auto_128090 ?auto_128091 ?auto_128092 )
      ( MAKE-8PILE ?auto_128088 ?auto_128089 ?auto_128090 ?auto_128091 ?auto_128092 ?auto_128093 ?auto_128094 ?auto_128095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128097 - BLOCK
      ?auto_128098 - BLOCK
      ?auto_128099 - BLOCK
      ?auto_128100 - BLOCK
      ?auto_128101 - BLOCK
      ?auto_128102 - BLOCK
      ?auto_128103 - BLOCK
      ?auto_128104 - BLOCK
    )
    :vars
    (
      ?auto_128105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128097 ?auto_128098 ) ) ( not ( = ?auto_128097 ?auto_128099 ) ) ( not ( = ?auto_128097 ?auto_128100 ) ) ( not ( = ?auto_128097 ?auto_128101 ) ) ( not ( = ?auto_128097 ?auto_128102 ) ) ( not ( = ?auto_128097 ?auto_128103 ) ) ( not ( = ?auto_128097 ?auto_128104 ) ) ( not ( = ?auto_128098 ?auto_128099 ) ) ( not ( = ?auto_128098 ?auto_128100 ) ) ( not ( = ?auto_128098 ?auto_128101 ) ) ( not ( = ?auto_128098 ?auto_128102 ) ) ( not ( = ?auto_128098 ?auto_128103 ) ) ( not ( = ?auto_128098 ?auto_128104 ) ) ( not ( = ?auto_128099 ?auto_128100 ) ) ( not ( = ?auto_128099 ?auto_128101 ) ) ( not ( = ?auto_128099 ?auto_128102 ) ) ( not ( = ?auto_128099 ?auto_128103 ) ) ( not ( = ?auto_128099 ?auto_128104 ) ) ( not ( = ?auto_128100 ?auto_128101 ) ) ( not ( = ?auto_128100 ?auto_128102 ) ) ( not ( = ?auto_128100 ?auto_128103 ) ) ( not ( = ?auto_128100 ?auto_128104 ) ) ( not ( = ?auto_128101 ?auto_128102 ) ) ( not ( = ?auto_128101 ?auto_128103 ) ) ( not ( = ?auto_128101 ?auto_128104 ) ) ( not ( = ?auto_128102 ?auto_128103 ) ) ( not ( = ?auto_128102 ?auto_128104 ) ) ( not ( = ?auto_128103 ?auto_128104 ) ) ( ON-TABLE ?auto_128104 ) ( ON ?auto_128097 ?auto_128105 ) ( not ( = ?auto_128097 ?auto_128105 ) ) ( not ( = ?auto_128098 ?auto_128105 ) ) ( not ( = ?auto_128099 ?auto_128105 ) ) ( not ( = ?auto_128100 ?auto_128105 ) ) ( not ( = ?auto_128101 ?auto_128105 ) ) ( not ( = ?auto_128102 ?auto_128105 ) ) ( not ( = ?auto_128103 ?auto_128105 ) ) ( not ( = ?auto_128104 ?auto_128105 ) ) ( ON ?auto_128098 ?auto_128097 ) ( ON-TABLE ?auto_128105 ) ( ON ?auto_128099 ?auto_128098 ) ( ON ?auto_128100 ?auto_128099 ) ( ON ?auto_128101 ?auto_128100 ) ( ON ?auto_128102 ?auto_128101 ) ( CLEAR ?auto_128102 ) ( HOLDING ?auto_128103 ) ( CLEAR ?auto_128104 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128104 ?auto_128103 )
      ( MAKE-8PILE ?auto_128097 ?auto_128098 ?auto_128099 ?auto_128100 ?auto_128101 ?auto_128102 ?auto_128103 ?auto_128104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128106 - BLOCK
      ?auto_128107 - BLOCK
      ?auto_128108 - BLOCK
      ?auto_128109 - BLOCK
      ?auto_128110 - BLOCK
      ?auto_128111 - BLOCK
      ?auto_128112 - BLOCK
      ?auto_128113 - BLOCK
    )
    :vars
    (
      ?auto_128114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128106 ?auto_128107 ) ) ( not ( = ?auto_128106 ?auto_128108 ) ) ( not ( = ?auto_128106 ?auto_128109 ) ) ( not ( = ?auto_128106 ?auto_128110 ) ) ( not ( = ?auto_128106 ?auto_128111 ) ) ( not ( = ?auto_128106 ?auto_128112 ) ) ( not ( = ?auto_128106 ?auto_128113 ) ) ( not ( = ?auto_128107 ?auto_128108 ) ) ( not ( = ?auto_128107 ?auto_128109 ) ) ( not ( = ?auto_128107 ?auto_128110 ) ) ( not ( = ?auto_128107 ?auto_128111 ) ) ( not ( = ?auto_128107 ?auto_128112 ) ) ( not ( = ?auto_128107 ?auto_128113 ) ) ( not ( = ?auto_128108 ?auto_128109 ) ) ( not ( = ?auto_128108 ?auto_128110 ) ) ( not ( = ?auto_128108 ?auto_128111 ) ) ( not ( = ?auto_128108 ?auto_128112 ) ) ( not ( = ?auto_128108 ?auto_128113 ) ) ( not ( = ?auto_128109 ?auto_128110 ) ) ( not ( = ?auto_128109 ?auto_128111 ) ) ( not ( = ?auto_128109 ?auto_128112 ) ) ( not ( = ?auto_128109 ?auto_128113 ) ) ( not ( = ?auto_128110 ?auto_128111 ) ) ( not ( = ?auto_128110 ?auto_128112 ) ) ( not ( = ?auto_128110 ?auto_128113 ) ) ( not ( = ?auto_128111 ?auto_128112 ) ) ( not ( = ?auto_128111 ?auto_128113 ) ) ( not ( = ?auto_128112 ?auto_128113 ) ) ( ON-TABLE ?auto_128113 ) ( ON ?auto_128106 ?auto_128114 ) ( not ( = ?auto_128106 ?auto_128114 ) ) ( not ( = ?auto_128107 ?auto_128114 ) ) ( not ( = ?auto_128108 ?auto_128114 ) ) ( not ( = ?auto_128109 ?auto_128114 ) ) ( not ( = ?auto_128110 ?auto_128114 ) ) ( not ( = ?auto_128111 ?auto_128114 ) ) ( not ( = ?auto_128112 ?auto_128114 ) ) ( not ( = ?auto_128113 ?auto_128114 ) ) ( ON ?auto_128107 ?auto_128106 ) ( ON-TABLE ?auto_128114 ) ( ON ?auto_128108 ?auto_128107 ) ( ON ?auto_128109 ?auto_128108 ) ( ON ?auto_128110 ?auto_128109 ) ( ON ?auto_128111 ?auto_128110 ) ( CLEAR ?auto_128113 ) ( ON ?auto_128112 ?auto_128111 ) ( CLEAR ?auto_128112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128114 ?auto_128106 ?auto_128107 ?auto_128108 ?auto_128109 ?auto_128110 ?auto_128111 )
      ( MAKE-8PILE ?auto_128106 ?auto_128107 ?auto_128108 ?auto_128109 ?auto_128110 ?auto_128111 ?auto_128112 ?auto_128113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128115 - BLOCK
      ?auto_128116 - BLOCK
      ?auto_128117 - BLOCK
      ?auto_128118 - BLOCK
      ?auto_128119 - BLOCK
      ?auto_128120 - BLOCK
      ?auto_128121 - BLOCK
      ?auto_128122 - BLOCK
    )
    :vars
    (
      ?auto_128123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128115 ?auto_128116 ) ) ( not ( = ?auto_128115 ?auto_128117 ) ) ( not ( = ?auto_128115 ?auto_128118 ) ) ( not ( = ?auto_128115 ?auto_128119 ) ) ( not ( = ?auto_128115 ?auto_128120 ) ) ( not ( = ?auto_128115 ?auto_128121 ) ) ( not ( = ?auto_128115 ?auto_128122 ) ) ( not ( = ?auto_128116 ?auto_128117 ) ) ( not ( = ?auto_128116 ?auto_128118 ) ) ( not ( = ?auto_128116 ?auto_128119 ) ) ( not ( = ?auto_128116 ?auto_128120 ) ) ( not ( = ?auto_128116 ?auto_128121 ) ) ( not ( = ?auto_128116 ?auto_128122 ) ) ( not ( = ?auto_128117 ?auto_128118 ) ) ( not ( = ?auto_128117 ?auto_128119 ) ) ( not ( = ?auto_128117 ?auto_128120 ) ) ( not ( = ?auto_128117 ?auto_128121 ) ) ( not ( = ?auto_128117 ?auto_128122 ) ) ( not ( = ?auto_128118 ?auto_128119 ) ) ( not ( = ?auto_128118 ?auto_128120 ) ) ( not ( = ?auto_128118 ?auto_128121 ) ) ( not ( = ?auto_128118 ?auto_128122 ) ) ( not ( = ?auto_128119 ?auto_128120 ) ) ( not ( = ?auto_128119 ?auto_128121 ) ) ( not ( = ?auto_128119 ?auto_128122 ) ) ( not ( = ?auto_128120 ?auto_128121 ) ) ( not ( = ?auto_128120 ?auto_128122 ) ) ( not ( = ?auto_128121 ?auto_128122 ) ) ( ON ?auto_128115 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128123 ) ) ( not ( = ?auto_128116 ?auto_128123 ) ) ( not ( = ?auto_128117 ?auto_128123 ) ) ( not ( = ?auto_128118 ?auto_128123 ) ) ( not ( = ?auto_128119 ?auto_128123 ) ) ( not ( = ?auto_128120 ?auto_128123 ) ) ( not ( = ?auto_128121 ?auto_128123 ) ) ( not ( = ?auto_128122 ?auto_128123 ) ) ( ON ?auto_128116 ?auto_128115 ) ( ON-TABLE ?auto_128123 ) ( ON ?auto_128117 ?auto_128116 ) ( ON ?auto_128118 ?auto_128117 ) ( ON ?auto_128119 ?auto_128118 ) ( ON ?auto_128120 ?auto_128119 ) ( ON ?auto_128121 ?auto_128120 ) ( CLEAR ?auto_128121 ) ( HOLDING ?auto_128122 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128122 )
      ( MAKE-8PILE ?auto_128115 ?auto_128116 ?auto_128117 ?auto_128118 ?auto_128119 ?auto_128120 ?auto_128121 ?auto_128122 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_128124 - BLOCK
      ?auto_128125 - BLOCK
      ?auto_128126 - BLOCK
      ?auto_128127 - BLOCK
      ?auto_128128 - BLOCK
      ?auto_128129 - BLOCK
      ?auto_128130 - BLOCK
      ?auto_128131 - BLOCK
    )
    :vars
    (
      ?auto_128132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128124 ?auto_128125 ) ) ( not ( = ?auto_128124 ?auto_128126 ) ) ( not ( = ?auto_128124 ?auto_128127 ) ) ( not ( = ?auto_128124 ?auto_128128 ) ) ( not ( = ?auto_128124 ?auto_128129 ) ) ( not ( = ?auto_128124 ?auto_128130 ) ) ( not ( = ?auto_128124 ?auto_128131 ) ) ( not ( = ?auto_128125 ?auto_128126 ) ) ( not ( = ?auto_128125 ?auto_128127 ) ) ( not ( = ?auto_128125 ?auto_128128 ) ) ( not ( = ?auto_128125 ?auto_128129 ) ) ( not ( = ?auto_128125 ?auto_128130 ) ) ( not ( = ?auto_128125 ?auto_128131 ) ) ( not ( = ?auto_128126 ?auto_128127 ) ) ( not ( = ?auto_128126 ?auto_128128 ) ) ( not ( = ?auto_128126 ?auto_128129 ) ) ( not ( = ?auto_128126 ?auto_128130 ) ) ( not ( = ?auto_128126 ?auto_128131 ) ) ( not ( = ?auto_128127 ?auto_128128 ) ) ( not ( = ?auto_128127 ?auto_128129 ) ) ( not ( = ?auto_128127 ?auto_128130 ) ) ( not ( = ?auto_128127 ?auto_128131 ) ) ( not ( = ?auto_128128 ?auto_128129 ) ) ( not ( = ?auto_128128 ?auto_128130 ) ) ( not ( = ?auto_128128 ?auto_128131 ) ) ( not ( = ?auto_128129 ?auto_128130 ) ) ( not ( = ?auto_128129 ?auto_128131 ) ) ( not ( = ?auto_128130 ?auto_128131 ) ) ( ON ?auto_128124 ?auto_128132 ) ( not ( = ?auto_128124 ?auto_128132 ) ) ( not ( = ?auto_128125 ?auto_128132 ) ) ( not ( = ?auto_128126 ?auto_128132 ) ) ( not ( = ?auto_128127 ?auto_128132 ) ) ( not ( = ?auto_128128 ?auto_128132 ) ) ( not ( = ?auto_128129 ?auto_128132 ) ) ( not ( = ?auto_128130 ?auto_128132 ) ) ( not ( = ?auto_128131 ?auto_128132 ) ) ( ON ?auto_128125 ?auto_128124 ) ( ON-TABLE ?auto_128132 ) ( ON ?auto_128126 ?auto_128125 ) ( ON ?auto_128127 ?auto_128126 ) ( ON ?auto_128128 ?auto_128127 ) ( ON ?auto_128129 ?auto_128128 ) ( ON ?auto_128130 ?auto_128129 ) ( ON ?auto_128131 ?auto_128130 ) ( CLEAR ?auto_128131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128132 ?auto_128124 ?auto_128125 ?auto_128126 ?auto_128127 ?auto_128128 ?auto_128129 ?auto_128130 )
      ( MAKE-8PILE ?auto_128124 ?auto_128125 ?auto_128126 ?auto_128127 ?auto_128128 ?auto_128129 ?auto_128130 ?auto_128131 ) )
  )

)

