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
      ?auto_48461 - BLOCK
      ?auto_48462 - BLOCK
      ?auto_48463 - BLOCK
      ?auto_48464 - BLOCK
      ?auto_48465 - BLOCK
      ?auto_48466 - BLOCK
    )
    :vars
    (
      ?auto_48467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48467 ?auto_48466 ) ( CLEAR ?auto_48467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48461 ) ( ON ?auto_48462 ?auto_48461 ) ( ON ?auto_48463 ?auto_48462 ) ( ON ?auto_48464 ?auto_48463 ) ( ON ?auto_48465 ?auto_48464 ) ( ON ?auto_48466 ?auto_48465 ) ( not ( = ?auto_48461 ?auto_48462 ) ) ( not ( = ?auto_48461 ?auto_48463 ) ) ( not ( = ?auto_48461 ?auto_48464 ) ) ( not ( = ?auto_48461 ?auto_48465 ) ) ( not ( = ?auto_48461 ?auto_48466 ) ) ( not ( = ?auto_48461 ?auto_48467 ) ) ( not ( = ?auto_48462 ?auto_48463 ) ) ( not ( = ?auto_48462 ?auto_48464 ) ) ( not ( = ?auto_48462 ?auto_48465 ) ) ( not ( = ?auto_48462 ?auto_48466 ) ) ( not ( = ?auto_48462 ?auto_48467 ) ) ( not ( = ?auto_48463 ?auto_48464 ) ) ( not ( = ?auto_48463 ?auto_48465 ) ) ( not ( = ?auto_48463 ?auto_48466 ) ) ( not ( = ?auto_48463 ?auto_48467 ) ) ( not ( = ?auto_48464 ?auto_48465 ) ) ( not ( = ?auto_48464 ?auto_48466 ) ) ( not ( = ?auto_48464 ?auto_48467 ) ) ( not ( = ?auto_48465 ?auto_48466 ) ) ( not ( = ?auto_48465 ?auto_48467 ) ) ( not ( = ?auto_48466 ?auto_48467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48467 ?auto_48466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48469 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48469 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_48469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48470 - BLOCK
    )
    :vars
    (
      ?auto_48471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48470 ?auto_48471 ) ( CLEAR ?auto_48470 ) ( HAND-EMPTY ) ( not ( = ?auto_48470 ?auto_48471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48470 ?auto_48471 )
      ( MAKE-1PILE ?auto_48470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48477 - BLOCK
      ?auto_48478 - BLOCK
      ?auto_48479 - BLOCK
      ?auto_48480 - BLOCK
      ?auto_48481 - BLOCK
    )
    :vars
    (
      ?auto_48482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48482 ?auto_48481 ) ( CLEAR ?auto_48482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48477 ) ( ON ?auto_48478 ?auto_48477 ) ( ON ?auto_48479 ?auto_48478 ) ( ON ?auto_48480 ?auto_48479 ) ( ON ?auto_48481 ?auto_48480 ) ( not ( = ?auto_48477 ?auto_48478 ) ) ( not ( = ?auto_48477 ?auto_48479 ) ) ( not ( = ?auto_48477 ?auto_48480 ) ) ( not ( = ?auto_48477 ?auto_48481 ) ) ( not ( = ?auto_48477 ?auto_48482 ) ) ( not ( = ?auto_48478 ?auto_48479 ) ) ( not ( = ?auto_48478 ?auto_48480 ) ) ( not ( = ?auto_48478 ?auto_48481 ) ) ( not ( = ?auto_48478 ?auto_48482 ) ) ( not ( = ?auto_48479 ?auto_48480 ) ) ( not ( = ?auto_48479 ?auto_48481 ) ) ( not ( = ?auto_48479 ?auto_48482 ) ) ( not ( = ?auto_48480 ?auto_48481 ) ) ( not ( = ?auto_48480 ?auto_48482 ) ) ( not ( = ?auto_48481 ?auto_48482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48482 ?auto_48481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48483 - BLOCK
      ?auto_48484 - BLOCK
      ?auto_48485 - BLOCK
      ?auto_48486 - BLOCK
      ?auto_48487 - BLOCK
    )
    :vars
    (
      ?auto_48488 - BLOCK
      ?auto_48489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48488 ?auto_48487 ) ( CLEAR ?auto_48488 ) ( ON-TABLE ?auto_48483 ) ( ON ?auto_48484 ?auto_48483 ) ( ON ?auto_48485 ?auto_48484 ) ( ON ?auto_48486 ?auto_48485 ) ( ON ?auto_48487 ?auto_48486 ) ( not ( = ?auto_48483 ?auto_48484 ) ) ( not ( = ?auto_48483 ?auto_48485 ) ) ( not ( = ?auto_48483 ?auto_48486 ) ) ( not ( = ?auto_48483 ?auto_48487 ) ) ( not ( = ?auto_48483 ?auto_48488 ) ) ( not ( = ?auto_48484 ?auto_48485 ) ) ( not ( = ?auto_48484 ?auto_48486 ) ) ( not ( = ?auto_48484 ?auto_48487 ) ) ( not ( = ?auto_48484 ?auto_48488 ) ) ( not ( = ?auto_48485 ?auto_48486 ) ) ( not ( = ?auto_48485 ?auto_48487 ) ) ( not ( = ?auto_48485 ?auto_48488 ) ) ( not ( = ?auto_48486 ?auto_48487 ) ) ( not ( = ?auto_48486 ?auto_48488 ) ) ( not ( = ?auto_48487 ?auto_48488 ) ) ( HOLDING ?auto_48489 ) ( not ( = ?auto_48483 ?auto_48489 ) ) ( not ( = ?auto_48484 ?auto_48489 ) ) ( not ( = ?auto_48485 ?auto_48489 ) ) ( not ( = ?auto_48486 ?auto_48489 ) ) ( not ( = ?auto_48487 ?auto_48489 ) ) ( not ( = ?auto_48488 ?auto_48489 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_48489 )
      ( MAKE-5PILE ?auto_48483 ?auto_48484 ?auto_48485 ?auto_48486 ?auto_48487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48490 - BLOCK
      ?auto_48491 - BLOCK
      ?auto_48492 - BLOCK
      ?auto_48493 - BLOCK
      ?auto_48494 - BLOCK
    )
    :vars
    (
      ?auto_48496 - BLOCK
      ?auto_48495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48496 ?auto_48494 ) ( ON-TABLE ?auto_48490 ) ( ON ?auto_48491 ?auto_48490 ) ( ON ?auto_48492 ?auto_48491 ) ( ON ?auto_48493 ?auto_48492 ) ( ON ?auto_48494 ?auto_48493 ) ( not ( = ?auto_48490 ?auto_48491 ) ) ( not ( = ?auto_48490 ?auto_48492 ) ) ( not ( = ?auto_48490 ?auto_48493 ) ) ( not ( = ?auto_48490 ?auto_48494 ) ) ( not ( = ?auto_48490 ?auto_48496 ) ) ( not ( = ?auto_48491 ?auto_48492 ) ) ( not ( = ?auto_48491 ?auto_48493 ) ) ( not ( = ?auto_48491 ?auto_48494 ) ) ( not ( = ?auto_48491 ?auto_48496 ) ) ( not ( = ?auto_48492 ?auto_48493 ) ) ( not ( = ?auto_48492 ?auto_48494 ) ) ( not ( = ?auto_48492 ?auto_48496 ) ) ( not ( = ?auto_48493 ?auto_48494 ) ) ( not ( = ?auto_48493 ?auto_48496 ) ) ( not ( = ?auto_48494 ?auto_48496 ) ) ( not ( = ?auto_48490 ?auto_48495 ) ) ( not ( = ?auto_48491 ?auto_48495 ) ) ( not ( = ?auto_48492 ?auto_48495 ) ) ( not ( = ?auto_48493 ?auto_48495 ) ) ( not ( = ?auto_48494 ?auto_48495 ) ) ( not ( = ?auto_48496 ?auto_48495 ) ) ( ON ?auto_48495 ?auto_48496 ) ( CLEAR ?auto_48495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48490 ?auto_48491 ?auto_48492 ?auto_48493 ?auto_48494 ?auto_48496 )
      ( MAKE-5PILE ?auto_48490 ?auto_48491 ?auto_48492 ?auto_48493 ?auto_48494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48499 - BLOCK
      ?auto_48500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48500 ) ( CLEAR ?auto_48499 ) ( ON-TABLE ?auto_48499 ) ( not ( = ?auto_48499 ?auto_48500 ) ) )
    :subtasks
    ( ( !STACK ?auto_48500 ?auto_48499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48501 - BLOCK
      ?auto_48502 - BLOCK
    )
    :vars
    (
      ?auto_48503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48501 ) ( ON-TABLE ?auto_48501 ) ( not ( = ?auto_48501 ?auto_48502 ) ) ( ON ?auto_48502 ?auto_48503 ) ( CLEAR ?auto_48502 ) ( HAND-EMPTY ) ( not ( = ?auto_48501 ?auto_48503 ) ) ( not ( = ?auto_48502 ?auto_48503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48502 ?auto_48503 )
      ( MAKE-2PILE ?auto_48501 ?auto_48502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48504 - BLOCK
      ?auto_48505 - BLOCK
    )
    :vars
    (
      ?auto_48506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48504 ?auto_48505 ) ) ( ON ?auto_48505 ?auto_48506 ) ( CLEAR ?auto_48505 ) ( not ( = ?auto_48504 ?auto_48506 ) ) ( not ( = ?auto_48505 ?auto_48506 ) ) ( HOLDING ?auto_48504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48504 )
      ( MAKE-2PILE ?auto_48504 ?auto_48505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48507 - BLOCK
      ?auto_48508 - BLOCK
    )
    :vars
    (
      ?auto_48509 - BLOCK
      ?auto_48512 - BLOCK
      ?auto_48513 - BLOCK
      ?auto_48510 - BLOCK
      ?auto_48511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48507 ?auto_48508 ) ) ( ON ?auto_48508 ?auto_48509 ) ( not ( = ?auto_48507 ?auto_48509 ) ) ( not ( = ?auto_48508 ?auto_48509 ) ) ( ON ?auto_48507 ?auto_48508 ) ( CLEAR ?auto_48507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48512 ) ( ON ?auto_48513 ?auto_48512 ) ( ON ?auto_48510 ?auto_48513 ) ( ON ?auto_48511 ?auto_48510 ) ( ON ?auto_48509 ?auto_48511 ) ( not ( = ?auto_48512 ?auto_48513 ) ) ( not ( = ?auto_48512 ?auto_48510 ) ) ( not ( = ?auto_48512 ?auto_48511 ) ) ( not ( = ?auto_48512 ?auto_48509 ) ) ( not ( = ?auto_48512 ?auto_48508 ) ) ( not ( = ?auto_48512 ?auto_48507 ) ) ( not ( = ?auto_48513 ?auto_48510 ) ) ( not ( = ?auto_48513 ?auto_48511 ) ) ( not ( = ?auto_48513 ?auto_48509 ) ) ( not ( = ?auto_48513 ?auto_48508 ) ) ( not ( = ?auto_48513 ?auto_48507 ) ) ( not ( = ?auto_48510 ?auto_48511 ) ) ( not ( = ?auto_48510 ?auto_48509 ) ) ( not ( = ?auto_48510 ?auto_48508 ) ) ( not ( = ?auto_48510 ?auto_48507 ) ) ( not ( = ?auto_48511 ?auto_48509 ) ) ( not ( = ?auto_48511 ?auto_48508 ) ) ( not ( = ?auto_48511 ?auto_48507 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48512 ?auto_48513 ?auto_48510 ?auto_48511 ?auto_48509 ?auto_48508 )
      ( MAKE-2PILE ?auto_48507 ?auto_48508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48518 - BLOCK
      ?auto_48519 - BLOCK
      ?auto_48520 - BLOCK
      ?auto_48521 - BLOCK
    )
    :vars
    (
      ?auto_48522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48522 ?auto_48521 ) ( CLEAR ?auto_48522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48518 ) ( ON ?auto_48519 ?auto_48518 ) ( ON ?auto_48520 ?auto_48519 ) ( ON ?auto_48521 ?auto_48520 ) ( not ( = ?auto_48518 ?auto_48519 ) ) ( not ( = ?auto_48518 ?auto_48520 ) ) ( not ( = ?auto_48518 ?auto_48521 ) ) ( not ( = ?auto_48518 ?auto_48522 ) ) ( not ( = ?auto_48519 ?auto_48520 ) ) ( not ( = ?auto_48519 ?auto_48521 ) ) ( not ( = ?auto_48519 ?auto_48522 ) ) ( not ( = ?auto_48520 ?auto_48521 ) ) ( not ( = ?auto_48520 ?auto_48522 ) ) ( not ( = ?auto_48521 ?auto_48522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48522 ?auto_48521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48523 - BLOCK
      ?auto_48524 - BLOCK
      ?auto_48525 - BLOCK
      ?auto_48526 - BLOCK
    )
    :vars
    (
      ?auto_48527 - BLOCK
      ?auto_48528 - BLOCK
      ?auto_48529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48527 ?auto_48526 ) ( CLEAR ?auto_48527 ) ( ON-TABLE ?auto_48523 ) ( ON ?auto_48524 ?auto_48523 ) ( ON ?auto_48525 ?auto_48524 ) ( ON ?auto_48526 ?auto_48525 ) ( not ( = ?auto_48523 ?auto_48524 ) ) ( not ( = ?auto_48523 ?auto_48525 ) ) ( not ( = ?auto_48523 ?auto_48526 ) ) ( not ( = ?auto_48523 ?auto_48527 ) ) ( not ( = ?auto_48524 ?auto_48525 ) ) ( not ( = ?auto_48524 ?auto_48526 ) ) ( not ( = ?auto_48524 ?auto_48527 ) ) ( not ( = ?auto_48525 ?auto_48526 ) ) ( not ( = ?auto_48525 ?auto_48527 ) ) ( not ( = ?auto_48526 ?auto_48527 ) ) ( HOLDING ?auto_48528 ) ( CLEAR ?auto_48529 ) ( not ( = ?auto_48523 ?auto_48528 ) ) ( not ( = ?auto_48523 ?auto_48529 ) ) ( not ( = ?auto_48524 ?auto_48528 ) ) ( not ( = ?auto_48524 ?auto_48529 ) ) ( not ( = ?auto_48525 ?auto_48528 ) ) ( not ( = ?auto_48525 ?auto_48529 ) ) ( not ( = ?auto_48526 ?auto_48528 ) ) ( not ( = ?auto_48526 ?auto_48529 ) ) ( not ( = ?auto_48527 ?auto_48528 ) ) ( not ( = ?auto_48527 ?auto_48529 ) ) ( not ( = ?auto_48528 ?auto_48529 ) ) )
    :subtasks
    ( ( !STACK ?auto_48528 ?auto_48529 )
      ( MAKE-4PILE ?auto_48523 ?auto_48524 ?auto_48525 ?auto_48526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48530 - BLOCK
      ?auto_48531 - BLOCK
      ?auto_48532 - BLOCK
      ?auto_48533 - BLOCK
    )
    :vars
    (
      ?auto_48534 - BLOCK
      ?auto_48535 - BLOCK
      ?auto_48536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48534 ?auto_48533 ) ( ON-TABLE ?auto_48530 ) ( ON ?auto_48531 ?auto_48530 ) ( ON ?auto_48532 ?auto_48531 ) ( ON ?auto_48533 ?auto_48532 ) ( not ( = ?auto_48530 ?auto_48531 ) ) ( not ( = ?auto_48530 ?auto_48532 ) ) ( not ( = ?auto_48530 ?auto_48533 ) ) ( not ( = ?auto_48530 ?auto_48534 ) ) ( not ( = ?auto_48531 ?auto_48532 ) ) ( not ( = ?auto_48531 ?auto_48533 ) ) ( not ( = ?auto_48531 ?auto_48534 ) ) ( not ( = ?auto_48532 ?auto_48533 ) ) ( not ( = ?auto_48532 ?auto_48534 ) ) ( not ( = ?auto_48533 ?auto_48534 ) ) ( CLEAR ?auto_48535 ) ( not ( = ?auto_48530 ?auto_48536 ) ) ( not ( = ?auto_48530 ?auto_48535 ) ) ( not ( = ?auto_48531 ?auto_48536 ) ) ( not ( = ?auto_48531 ?auto_48535 ) ) ( not ( = ?auto_48532 ?auto_48536 ) ) ( not ( = ?auto_48532 ?auto_48535 ) ) ( not ( = ?auto_48533 ?auto_48536 ) ) ( not ( = ?auto_48533 ?auto_48535 ) ) ( not ( = ?auto_48534 ?auto_48536 ) ) ( not ( = ?auto_48534 ?auto_48535 ) ) ( not ( = ?auto_48536 ?auto_48535 ) ) ( ON ?auto_48536 ?auto_48534 ) ( CLEAR ?auto_48536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ?auto_48534 )
      ( MAKE-4PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48537 - BLOCK
      ?auto_48538 - BLOCK
      ?auto_48539 - BLOCK
      ?auto_48540 - BLOCK
    )
    :vars
    (
      ?auto_48542 - BLOCK
      ?auto_48541 - BLOCK
      ?auto_48543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48542 ?auto_48540 ) ( ON-TABLE ?auto_48537 ) ( ON ?auto_48538 ?auto_48537 ) ( ON ?auto_48539 ?auto_48538 ) ( ON ?auto_48540 ?auto_48539 ) ( not ( = ?auto_48537 ?auto_48538 ) ) ( not ( = ?auto_48537 ?auto_48539 ) ) ( not ( = ?auto_48537 ?auto_48540 ) ) ( not ( = ?auto_48537 ?auto_48542 ) ) ( not ( = ?auto_48538 ?auto_48539 ) ) ( not ( = ?auto_48538 ?auto_48540 ) ) ( not ( = ?auto_48538 ?auto_48542 ) ) ( not ( = ?auto_48539 ?auto_48540 ) ) ( not ( = ?auto_48539 ?auto_48542 ) ) ( not ( = ?auto_48540 ?auto_48542 ) ) ( not ( = ?auto_48537 ?auto_48541 ) ) ( not ( = ?auto_48537 ?auto_48543 ) ) ( not ( = ?auto_48538 ?auto_48541 ) ) ( not ( = ?auto_48538 ?auto_48543 ) ) ( not ( = ?auto_48539 ?auto_48541 ) ) ( not ( = ?auto_48539 ?auto_48543 ) ) ( not ( = ?auto_48540 ?auto_48541 ) ) ( not ( = ?auto_48540 ?auto_48543 ) ) ( not ( = ?auto_48542 ?auto_48541 ) ) ( not ( = ?auto_48542 ?auto_48543 ) ) ( not ( = ?auto_48541 ?auto_48543 ) ) ( ON ?auto_48541 ?auto_48542 ) ( CLEAR ?auto_48541 ) ( HOLDING ?auto_48543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48543 )
      ( MAKE-4PILE ?auto_48537 ?auto_48538 ?auto_48539 ?auto_48540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48544 - BLOCK
      ?auto_48545 - BLOCK
      ?auto_48546 - BLOCK
      ?auto_48547 - BLOCK
    )
    :vars
    (
      ?auto_48548 - BLOCK
      ?auto_48550 - BLOCK
      ?auto_48549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48548 ?auto_48547 ) ( ON-TABLE ?auto_48544 ) ( ON ?auto_48545 ?auto_48544 ) ( ON ?auto_48546 ?auto_48545 ) ( ON ?auto_48547 ?auto_48546 ) ( not ( = ?auto_48544 ?auto_48545 ) ) ( not ( = ?auto_48544 ?auto_48546 ) ) ( not ( = ?auto_48544 ?auto_48547 ) ) ( not ( = ?auto_48544 ?auto_48548 ) ) ( not ( = ?auto_48545 ?auto_48546 ) ) ( not ( = ?auto_48545 ?auto_48547 ) ) ( not ( = ?auto_48545 ?auto_48548 ) ) ( not ( = ?auto_48546 ?auto_48547 ) ) ( not ( = ?auto_48546 ?auto_48548 ) ) ( not ( = ?auto_48547 ?auto_48548 ) ) ( not ( = ?auto_48544 ?auto_48550 ) ) ( not ( = ?auto_48544 ?auto_48549 ) ) ( not ( = ?auto_48545 ?auto_48550 ) ) ( not ( = ?auto_48545 ?auto_48549 ) ) ( not ( = ?auto_48546 ?auto_48550 ) ) ( not ( = ?auto_48546 ?auto_48549 ) ) ( not ( = ?auto_48547 ?auto_48550 ) ) ( not ( = ?auto_48547 ?auto_48549 ) ) ( not ( = ?auto_48548 ?auto_48550 ) ) ( not ( = ?auto_48548 ?auto_48549 ) ) ( not ( = ?auto_48550 ?auto_48549 ) ) ( ON ?auto_48550 ?auto_48548 ) ( ON ?auto_48549 ?auto_48550 ) ( CLEAR ?auto_48549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48544 ?auto_48545 ?auto_48546 ?auto_48547 ?auto_48548 ?auto_48550 )
      ( MAKE-4PILE ?auto_48544 ?auto_48545 ?auto_48546 ?auto_48547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48554 - BLOCK
      ?auto_48555 - BLOCK
      ?auto_48556 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48556 ) ( CLEAR ?auto_48555 ) ( ON-TABLE ?auto_48554 ) ( ON ?auto_48555 ?auto_48554 ) ( not ( = ?auto_48554 ?auto_48555 ) ) ( not ( = ?auto_48554 ?auto_48556 ) ) ( not ( = ?auto_48555 ?auto_48556 ) ) )
    :subtasks
    ( ( !STACK ?auto_48556 ?auto_48555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48557 - BLOCK
      ?auto_48558 - BLOCK
      ?auto_48559 - BLOCK
    )
    :vars
    (
      ?auto_48560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48558 ) ( ON-TABLE ?auto_48557 ) ( ON ?auto_48558 ?auto_48557 ) ( not ( = ?auto_48557 ?auto_48558 ) ) ( not ( = ?auto_48557 ?auto_48559 ) ) ( not ( = ?auto_48558 ?auto_48559 ) ) ( ON ?auto_48559 ?auto_48560 ) ( CLEAR ?auto_48559 ) ( HAND-EMPTY ) ( not ( = ?auto_48557 ?auto_48560 ) ) ( not ( = ?auto_48558 ?auto_48560 ) ) ( not ( = ?auto_48559 ?auto_48560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48559 ?auto_48560 )
      ( MAKE-3PILE ?auto_48557 ?auto_48558 ?auto_48559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48561 - BLOCK
      ?auto_48562 - BLOCK
      ?auto_48563 - BLOCK
    )
    :vars
    (
      ?auto_48564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48561 ) ( not ( = ?auto_48561 ?auto_48562 ) ) ( not ( = ?auto_48561 ?auto_48563 ) ) ( not ( = ?auto_48562 ?auto_48563 ) ) ( ON ?auto_48563 ?auto_48564 ) ( CLEAR ?auto_48563 ) ( not ( = ?auto_48561 ?auto_48564 ) ) ( not ( = ?auto_48562 ?auto_48564 ) ) ( not ( = ?auto_48563 ?auto_48564 ) ) ( HOLDING ?auto_48562 ) ( CLEAR ?auto_48561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48561 ?auto_48562 )
      ( MAKE-3PILE ?auto_48561 ?auto_48562 ?auto_48563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48565 - BLOCK
      ?auto_48566 - BLOCK
      ?auto_48567 - BLOCK
    )
    :vars
    (
      ?auto_48568 - BLOCK
      ?auto_48571 - BLOCK
      ?auto_48569 - BLOCK
      ?auto_48570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48565 ) ( not ( = ?auto_48565 ?auto_48566 ) ) ( not ( = ?auto_48565 ?auto_48567 ) ) ( not ( = ?auto_48566 ?auto_48567 ) ) ( ON ?auto_48567 ?auto_48568 ) ( not ( = ?auto_48565 ?auto_48568 ) ) ( not ( = ?auto_48566 ?auto_48568 ) ) ( not ( = ?auto_48567 ?auto_48568 ) ) ( CLEAR ?auto_48565 ) ( ON ?auto_48566 ?auto_48567 ) ( CLEAR ?auto_48566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48571 ) ( ON ?auto_48569 ?auto_48571 ) ( ON ?auto_48570 ?auto_48569 ) ( ON ?auto_48568 ?auto_48570 ) ( not ( = ?auto_48571 ?auto_48569 ) ) ( not ( = ?auto_48571 ?auto_48570 ) ) ( not ( = ?auto_48571 ?auto_48568 ) ) ( not ( = ?auto_48571 ?auto_48567 ) ) ( not ( = ?auto_48571 ?auto_48566 ) ) ( not ( = ?auto_48569 ?auto_48570 ) ) ( not ( = ?auto_48569 ?auto_48568 ) ) ( not ( = ?auto_48569 ?auto_48567 ) ) ( not ( = ?auto_48569 ?auto_48566 ) ) ( not ( = ?auto_48570 ?auto_48568 ) ) ( not ( = ?auto_48570 ?auto_48567 ) ) ( not ( = ?auto_48570 ?auto_48566 ) ) ( not ( = ?auto_48565 ?auto_48571 ) ) ( not ( = ?auto_48565 ?auto_48569 ) ) ( not ( = ?auto_48565 ?auto_48570 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48571 ?auto_48569 ?auto_48570 ?auto_48568 ?auto_48567 )
      ( MAKE-3PILE ?auto_48565 ?auto_48566 ?auto_48567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48572 - BLOCK
      ?auto_48573 - BLOCK
      ?auto_48574 - BLOCK
    )
    :vars
    (
      ?auto_48578 - BLOCK
      ?auto_48577 - BLOCK
      ?auto_48576 - BLOCK
      ?auto_48575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48572 ?auto_48573 ) ) ( not ( = ?auto_48572 ?auto_48574 ) ) ( not ( = ?auto_48573 ?auto_48574 ) ) ( ON ?auto_48574 ?auto_48578 ) ( not ( = ?auto_48572 ?auto_48578 ) ) ( not ( = ?auto_48573 ?auto_48578 ) ) ( not ( = ?auto_48574 ?auto_48578 ) ) ( ON ?auto_48573 ?auto_48574 ) ( CLEAR ?auto_48573 ) ( ON-TABLE ?auto_48577 ) ( ON ?auto_48576 ?auto_48577 ) ( ON ?auto_48575 ?auto_48576 ) ( ON ?auto_48578 ?auto_48575 ) ( not ( = ?auto_48577 ?auto_48576 ) ) ( not ( = ?auto_48577 ?auto_48575 ) ) ( not ( = ?auto_48577 ?auto_48578 ) ) ( not ( = ?auto_48577 ?auto_48574 ) ) ( not ( = ?auto_48577 ?auto_48573 ) ) ( not ( = ?auto_48576 ?auto_48575 ) ) ( not ( = ?auto_48576 ?auto_48578 ) ) ( not ( = ?auto_48576 ?auto_48574 ) ) ( not ( = ?auto_48576 ?auto_48573 ) ) ( not ( = ?auto_48575 ?auto_48578 ) ) ( not ( = ?auto_48575 ?auto_48574 ) ) ( not ( = ?auto_48575 ?auto_48573 ) ) ( not ( = ?auto_48572 ?auto_48577 ) ) ( not ( = ?auto_48572 ?auto_48576 ) ) ( not ( = ?auto_48572 ?auto_48575 ) ) ( HOLDING ?auto_48572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48572 )
      ( MAKE-3PILE ?auto_48572 ?auto_48573 ?auto_48574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48579 - BLOCK
      ?auto_48580 - BLOCK
      ?auto_48581 - BLOCK
    )
    :vars
    (
      ?auto_48585 - BLOCK
      ?auto_48582 - BLOCK
      ?auto_48583 - BLOCK
      ?auto_48584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48579 ?auto_48580 ) ) ( not ( = ?auto_48579 ?auto_48581 ) ) ( not ( = ?auto_48580 ?auto_48581 ) ) ( ON ?auto_48581 ?auto_48585 ) ( not ( = ?auto_48579 ?auto_48585 ) ) ( not ( = ?auto_48580 ?auto_48585 ) ) ( not ( = ?auto_48581 ?auto_48585 ) ) ( ON ?auto_48580 ?auto_48581 ) ( ON-TABLE ?auto_48582 ) ( ON ?auto_48583 ?auto_48582 ) ( ON ?auto_48584 ?auto_48583 ) ( ON ?auto_48585 ?auto_48584 ) ( not ( = ?auto_48582 ?auto_48583 ) ) ( not ( = ?auto_48582 ?auto_48584 ) ) ( not ( = ?auto_48582 ?auto_48585 ) ) ( not ( = ?auto_48582 ?auto_48581 ) ) ( not ( = ?auto_48582 ?auto_48580 ) ) ( not ( = ?auto_48583 ?auto_48584 ) ) ( not ( = ?auto_48583 ?auto_48585 ) ) ( not ( = ?auto_48583 ?auto_48581 ) ) ( not ( = ?auto_48583 ?auto_48580 ) ) ( not ( = ?auto_48584 ?auto_48585 ) ) ( not ( = ?auto_48584 ?auto_48581 ) ) ( not ( = ?auto_48584 ?auto_48580 ) ) ( not ( = ?auto_48579 ?auto_48582 ) ) ( not ( = ?auto_48579 ?auto_48583 ) ) ( not ( = ?auto_48579 ?auto_48584 ) ) ( ON ?auto_48579 ?auto_48580 ) ( CLEAR ?auto_48579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48582 ?auto_48583 ?auto_48584 ?auto_48585 ?auto_48581 ?auto_48580 )
      ( MAKE-3PILE ?auto_48579 ?auto_48580 ?auto_48581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48589 - BLOCK
      ?auto_48590 - BLOCK
      ?auto_48591 - BLOCK
    )
    :vars
    (
      ?auto_48592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48592 ?auto_48591 ) ( CLEAR ?auto_48592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48589 ) ( ON ?auto_48590 ?auto_48589 ) ( ON ?auto_48591 ?auto_48590 ) ( not ( = ?auto_48589 ?auto_48590 ) ) ( not ( = ?auto_48589 ?auto_48591 ) ) ( not ( = ?auto_48589 ?auto_48592 ) ) ( not ( = ?auto_48590 ?auto_48591 ) ) ( not ( = ?auto_48590 ?auto_48592 ) ) ( not ( = ?auto_48591 ?auto_48592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48592 ?auto_48591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48593 - BLOCK
      ?auto_48594 - BLOCK
      ?auto_48595 - BLOCK
    )
    :vars
    (
      ?auto_48596 - BLOCK
      ?auto_48597 - BLOCK
      ?auto_48598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48596 ?auto_48595 ) ( CLEAR ?auto_48596 ) ( ON-TABLE ?auto_48593 ) ( ON ?auto_48594 ?auto_48593 ) ( ON ?auto_48595 ?auto_48594 ) ( not ( = ?auto_48593 ?auto_48594 ) ) ( not ( = ?auto_48593 ?auto_48595 ) ) ( not ( = ?auto_48593 ?auto_48596 ) ) ( not ( = ?auto_48594 ?auto_48595 ) ) ( not ( = ?auto_48594 ?auto_48596 ) ) ( not ( = ?auto_48595 ?auto_48596 ) ) ( HOLDING ?auto_48597 ) ( CLEAR ?auto_48598 ) ( not ( = ?auto_48593 ?auto_48597 ) ) ( not ( = ?auto_48593 ?auto_48598 ) ) ( not ( = ?auto_48594 ?auto_48597 ) ) ( not ( = ?auto_48594 ?auto_48598 ) ) ( not ( = ?auto_48595 ?auto_48597 ) ) ( not ( = ?auto_48595 ?auto_48598 ) ) ( not ( = ?auto_48596 ?auto_48597 ) ) ( not ( = ?auto_48596 ?auto_48598 ) ) ( not ( = ?auto_48597 ?auto_48598 ) ) )
    :subtasks
    ( ( !STACK ?auto_48597 ?auto_48598 )
      ( MAKE-3PILE ?auto_48593 ?auto_48594 ?auto_48595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48599 - BLOCK
      ?auto_48600 - BLOCK
      ?auto_48601 - BLOCK
    )
    :vars
    (
      ?auto_48604 - BLOCK
      ?auto_48602 - BLOCK
      ?auto_48603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48604 ?auto_48601 ) ( ON-TABLE ?auto_48599 ) ( ON ?auto_48600 ?auto_48599 ) ( ON ?auto_48601 ?auto_48600 ) ( not ( = ?auto_48599 ?auto_48600 ) ) ( not ( = ?auto_48599 ?auto_48601 ) ) ( not ( = ?auto_48599 ?auto_48604 ) ) ( not ( = ?auto_48600 ?auto_48601 ) ) ( not ( = ?auto_48600 ?auto_48604 ) ) ( not ( = ?auto_48601 ?auto_48604 ) ) ( CLEAR ?auto_48602 ) ( not ( = ?auto_48599 ?auto_48603 ) ) ( not ( = ?auto_48599 ?auto_48602 ) ) ( not ( = ?auto_48600 ?auto_48603 ) ) ( not ( = ?auto_48600 ?auto_48602 ) ) ( not ( = ?auto_48601 ?auto_48603 ) ) ( not ( = ?auto_48601 ?auto_48602 ) ) ( not ( = ?auto_48604 ?auto_48603 ) ) ( not ( = ?auto_48604 ?auto_48602 ) ) ( not ( = ?auto_48603 ?auto_48602 ) ) ( ON ?auto_48603 ?auto_48604 ) ( CLEAR ?auto_48603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48599 ?auto_48600 ?auto_48601 ?auto_48604 )
      ( MAKE-3PILE ?auto_48599 ?auto_48600 ?auto_48601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48605 - BLOCK
      ?auto_48606 - BLOCK
      ?auto_48607 - BLOCK
    )
    :vars
    (
      ?auto_48608 - BLOCK
      ?auto_48610 - BLOCK
      ?auto_48609 - BLOCK
      ?auto_48611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48608 ?auto_48607 ) ( ON-TABLE ?auto_48605 ) ( ON ?auto_48606 ?auto_48605 ) ( ON ?auto_48607 ?auto_48606 ) ( not ( = ?auto_48605 ?auto_48606 ) ) ( not ( = ?auto_48605 ?auto_48607 ) ) ( not ( = ?auto_48605 ?auto_48608 ) ) ( not ( = ?auto_48606 ?auto_48607 ) ) ( not ( = ?auto_48606 ?auto_48608 ) ) ( not ( = ?auto_48607 ?auto_48608 ) ) ( not ( = ?auto_48605 ?auto_48610 ) ) ( not ( = ?auto_48605 ?auto_48609 ) ) ( not ( = ?auto_48606 ?auto_48610 ) ) ( not ( = ?auto_48606 ?auto_48609 ) ) ( not ( = ?auto_48607 ?auto_48610 ) ) ( not ( = ?auto_48607 ?auto_48609 ) ) ( not ( = ?auto_48608 ?auto_48610 ) ) ( not ( = ?auto_48608 ?auto_48609 ) ) ( not ( = ?auto_48610 ?auto_48609 ) ) ( ON ?auto_48610 ?auto_48608 ) ( CLEAR ?auto_48610 ) ( HOLDING ?auto_48609 ) ( CLEAR ?auto_48611 ) ( ON-TABLE ?auto_48611 ) ( not ( = ?auto_48611 ?auto_48609 ) ) ( not ( = ?auto_48605 ?auto_48611 ) ) ( not ( = ?auto_48606 ?auto_48611 ) ) ( not ( = ?auto_48607 ?auto_48611 ) ) ( not ( = ?auto_48608 ?auto_48611 ) ) ( not ( = ?auto_48610 ?auto_48611 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48611 ?auto_48609 )
      ( MAKE-3PILE ?auto_48605 ?auto_48606 ?auto_48607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48612 - BLOCK
      ?auto_48613 - BLOCK
      ?auto_48614 - BLOCK
    )
    :vars
    (
      ?auto_48617 - BLOCK
      ?auto_48618 - BLOCK
      ?auto_48616 - BLOCK
      ?auto_48615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48617 ?auto_48614 ) ( ON-TABLE ?auto_48612 ) ( ON ?auto_48613 ?auto_48612 ) ( ON ?auto_48614 ?auto_48613 ) ( not ( = ?auto_48612 ?auto_48613 ) ) ( not ( = ?auto_48612 ?auto_48614 ) ) ( not ( = ?auto_48612 ?auto_48617 ) ) ( not ( = ?auto_48613 ?auto_48614 ) ) ( not ( = ?auto_48613 ?auto_48617 ) ) ( not ( = ?auto_48614 ?auto_48617 ) ) ( not ( = ?auto_48612 ?auto_48618 ) ) ( not ( = ?auto_48612 ?auto_48616 ) ) ( not ( = ?auto_48613 ?auto_48618 ) ) ( not ( = ?auto_48613 ?auto_48616 ) ) ( not ( = ?auto_48614 ?auto_48618 ) ) ( not ( = ?auto_48614 ?auto_48616 ) ) ( not ( = ?auto_48617 ?auto_48618 ) ) ( not ( = ?auto_48617 ?auto_48616 ) ) ( not ( = ?auto_48618 ?auto_48616 ) ) ( ON ?auto_48618 ?auto_48617 ) ( CLEAR ?auto_48615 ) ( ON-TABLE ?auto_48615 ) ( not ( = ?auto_48615 ?auto_48616 ) ) ( not ( = ?auto_48612 ?auto_48615 ) ) ( not ( = ?auto_48613 ?auto_48615 ) ) ( not ( = ?auto_48614 ?auto_48615 ) ) ( not ( = ?auto_48617 ?auto_48615 ) ) ( not ( = ?auto_48618 ?auto_48615 ) ) ( ON ?auto_48616 ?auto_48618 ) ( CLEAR ?auto_48616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48612 ?auto_48613 ?auto_48614 ?auto_48617 ?auto_48618 )
      ( MAKE-3PILE ?auto_48612 ?auto_48613 ?auto_48614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48619 - BLOCK
      ?auto_48620 - BLOCK
      ?auto_48621 - BLOCK
    )
    :vars
    (
      ?auto_48622 - BLOCK
      ?auto_48623 - BLOCK
      ?auto_48625 - BLOCK
      ?auto_48624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48622 ?auto_48621 ) ( ON-TABLE ?auto_48619 ) ( ON ?auto_48620 ?auto_48619 ) ( ON ?auto_48621 ?auto_48620 ) ( not ( = ?auto_48619 ?auto_48620 ) ) ( not ( = ?auto_48619 ?auto_48621 ) ) ( not ( = ?auto_48619 ?auto_48622 ) ) ( not ( = ?auto_48620 ?auto_48621 ) ) ( not ( = ?auto_48620 ?auto_48622 ) ) ( not ( = ?auto_48621 ?auto_48622 ) ) ( not ( = ?auto_48619 ?auto_48623 ) ) ( not ( = ?auto_48619 ?auto_48625 ) ) ( not ( = ?auto_48620 ?auto_48623 ) ) ( not ( = ?auto_48620 ?auto_48625 ) ) ( not ( = ?auto_48621 ?auto_48623 ) ) ( not ( = ?auto_48621 ?auto_48625 ) ) ( not ( = ?auto_48622 ?auto_48623 ) ) ( not ( = ?auto_48622 ?auto_48625 ) ) ( not ( = ?auto_48623 ?auto_48625 ) ) ( ON ?auto_48623 ?auto_48622 ) ( not ( = ?auto_48624 ?auto_48625 ) ) ( not ( = ?auto_48619 ?auto_48624 ) ) ( not ( = ?auto_48620 ?auto_48624 ) ) ( not ( = ?auto_48621 ?auto_48624 ) ) ( not ( = ?auto_48622 ?auto_48624 ) ) ( not ( = ?auto_48623 ?auto_48624 ) ) ( ON ?auto_48625 ?auto_48623 ) ( CLEAR ?auto_48625 ) ( HOLDING ?auto_48624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48624 )
      ( MAKE-3PILE ?auto_48619 ?auto_48620 ?auto_48621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48626 - BLOCK
      ?auto_48627 - BLOCK
      ?auto_48628 - BLOCK
    )
    :vars
    (
      ?auto_48629 - BLOCK
      ?auto_48632 - BLOCK
      ?auto_48630 - BLOCK
      ?auto_48631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48629 ?auto_48628 ) ( ON-TABLE ?auto_48626 ) ( ON ?auto_48627 ?auto_48626 ) ( ON ?auto_48628 ?auto_48627 ) ( not ( = ?auto_48626 ?auto_48627 ) ) ( not ( = ?auto_48626 ?auto_48628 ) ) ( not ( = ?auto_48626 ?auto_48629 ) ) ( not ( = ?auto_48627 ?auto_48628 ) ) ( not ( = ?auto_48627 ?auto_48629 ) ) ( not ( = ?auto_48628 ?auto_48629 ) ) ( not ( = ?auto_48626 ?auto_48632 ) ) ( not ( = ?auto_48626 ?auto_48630 ) ) ( not ( = ?auto_48627 ?auto_48632 ) ) ( not ( = ?auto_48627 ?auto_48630 ) ) ( not ( = ?auto_48628 ?auto_48632 ) ) ( not ( = ?auto_48628 ?auto_48630 ) ) ( not ( = ?auto_48629 ?auto_48632 ) ) ( not ( = ?auto_48629 ?auto_48630 ) ) ( not ( = ?auto_48632 ?auto_48630 ) ) ( ON ?auto_48632 ?auto_48629 ) ( not ( = ?auto_48631 ?auto_48630 ) ) ( not ( = ?auto_48626 ?auto_48631 ) ) ( not ( = ?auto_48627 ?auto_48631 ) ) ( not ( = ?auto_48628 ?auto_48631 ) ) ( not ( = ?auto_48629 ?auto_48631 ) ) ( not ( = ?auto_48632 ?auto_48631 ) ) ( ON ?auto_48630 ?auto_48632 ) ( ON ?auto_48631 ?auto_48630 ) ( CLEAR ?auto_48631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48626 ?auto_48627 ?auto_48628 ?auto_48629 ?auto_48632 ?auto_48630 )
      ( MAKE-3PILE ?auto_48626 ?auto_48627 ?auto_48628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48637 - BLOCK
      ?auto_48638 - BLOCK
      ?auto_48639 - BLOCK
      ?auto_48640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48640 ) ( CLEAR ?auto_48639 ) ( ON-TABLE ?auto_48637 ) ( ON ?auto_48638 ?auto_48637 ) ( ON ?auto_48639 ?auto_48638 ) ( not ( = ?auto_48637 ?auto_48638 ) ) ( not ( = ?auto_48637 ?auto_48639 ) ) ( not ( = ?auto_48637 ?auto_48640 ) ) ( not ( = ?auto_48638 ?auto_48639 ) ) ( not ( = ?auto_48638 ?auto_48640 ) ) ( not ( = ?auto_48639 ?auto_48640 ) ) )
    :subtasks
    ( ( !STACK ?auto_48640 ?auto_48639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48641 - BLOCK
      ?auto_48642 - BLOCK
      ?auto_48643 - BLOCK
      ?auto_48644 - BLOCK
    )
    :vars
    (
      ?auto_48645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48643 ) ( ON-TABLE ?auto_48641 ) ( ON ?auto_48642 ?auto_48641 ) ( ON ?auto_48643 ?auto_48642 ) ( not ( = ?auto_48641 ?auto_48642 ) ) ( not ( = ?auto_48641 ?auto_48643 ) ) ( not ( = ?auto_48641 ?auto_48644 ) ) ( not ( = ?auto_48642 ?auto_48643 ) ) ( not ( = ?auto_48642 ?auto_48644 ) ) ( not ( = ?auto_48643 ?auto_48644 ) ) ( ON ?auto_48644 ?auto_48645 ) ( CLEAR ?auto_48644 ) ( HAND-EMPTY ) ( not ( = ?auto_48641 ?auto_48645 ) ) ( not ( = ?auto_48642 ?auto_48645 ) ) ( not ( = ?auto_48643 ?auto_48645 ) ) ( not ( = ?auto_48644 ?auto_48645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48644 ?auto_48645 )
      ( MAKE-4PILE ?auto_48641 ?auto_48642 ?auto_48643 ?auto_48644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48646 - BLOCK
      ?auto_48647 - BLOCK
      ?auto_48648 - BLOCK
      ?auto_48649 - BLOCK
    )
    :vars
    (
      ?auto_48650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48646 ) ( ON ?auto_48647 ?auto_48646 ) ( not ( = ?auto_48646 ?auto_48647 ) ) ( not ( = ?auto_48646 ?auto_48648 ) ) ( not ( = ?auto_48646 ?auto_48649 ) ) ( not ( = ?auto_48647 ?auto_48648 ) ) ( not ( = ?auto_48647 ?auto_48649 ) ) ( not ( = ?auto_48648 ?auto_48649 ) ) ( ON ?auto_48649 ?auto_48650 ) ( CLEAR ?auto_48649 ) ( not ( = ?auto_48646 ?auto_48650 ) ) ( not ( = ?auto_48647 ?auto_48650 ) ) ( not ( = ?auto_48648 ?auto_48650 ) ) ( not ( = ?auto_48649 ?auto_48650 ) ) ( HOLDING ?auto_48648 ) ( CLEAR ?auto_48647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48646 ?auto_48647 ?auto_48648 )
      ( MAKE-4PILE ?auto_48646 ?auto_48647 ?auto_48648 ?auto_48649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48651 - BLOCK
      ?auto_48652 - BLOCK
      ?auto_48653 - BLOCK
      ?auto_48654 - BLOCK
    )
    :vars
    (
      ?auto_48655 - BLOCK
      ?auto_48657 - BLOCK
      ?auto_48656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48651 ) ( ON ?auto_48652 ?auto_48651 ) ( not ( = ?auto_48651 ?auto_48652 ) ) ( not ( = ?auto_48651 ?auto_48653 ) ) ( not ( = ?auto_48651 ?auto_48654 ) ) ( not ( = ?auto_48652 ?auto_48653 ) ) ( not ( = ?auto_48652 ?auto_48654 ) ) ( not ( = ?auto_48653 ?auto_48654 ) ) ( ON ?auto_48654 ?auto_48655 ) ( not ( = ?auto_48651 ?auto_48655 ) ) ( not ( = ?auto_48652 ?auto_48655 ) ) ( not ( = ?auto_48653 ?auto_48655 ) ) ( not ( = ?auto_48654 ?auto_48655 ) ) ( CLEAR ?auto_48652 ) ( ON ?auto_48653 ?auto_48654 ) ( CLEAR ?auto_48653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48657 ) ( ON ?auto_48656 ?auto_48657 ) ( ON ?auto_48655 ?auto_48656 ) ( not ( = ?auto_48657 ?auto_48656 ) ) ( not ( = ?auto_48657 ?auto_48655 ) ) ( not ( = ?auto_48657 ?auto_48654 ) ) ( not ( = ?auto_48657 ?auto_48653 ) ) ( not ( = ?auto_48656 ?auto_48655 ) ) ( not ( = ?auto_48656 ?auto_48654 ) ) ( not ( = ?auto_48656 ?auto_48653 ) ) ( not ( = ?auto_48651 ?auto_48657 ) ) ( not ( = ?auto_48651 ?auto_48656 ) ) ( not ( = ?auto_48652 ?auto_48657 ) ) ( not ( = ?auto_48652 ?auto_48656 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48657 ?auto_48656 ?auto_48655 ?auto_48654 )
      ( MAKE-4PILE ?auto_48651 ?auto_48652 ?auto_48653 ?auto_48654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48658 - BLOCK
      ?auto_48659 - BLOCK
      ?auto_48660 - BLOCK
      ?auto_48661 - BLOCK
    )
    :vars
    (
      ?auto_48663 - BLOCK
      ?auto_48662 - BLOCK
      ?auto_48664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48658 ) ( not ( = ?auto_48658 ?auto_48659 ) ) ( not ( = ?auto_48658 ?auto_48660 ) ) ( not ( = ?auto_48658 ?auto_48661 ) ) ( not ( = ?auto_48659 ?auto_48660 ) ) ( not ( = ?auto_48659 ?auto_48661 ) ) ( not ( = ?auto_48660 ?auto_48661 ) ) ( ON ?auto_48661 ?auto_48663 ) ( not ( = ?auto_48658 ?auto_48663 ) ) ( not ( = ?auto_48659 ?auto_48663 ) ) ( not ( = ?auto_48660 ?auto_48663 ) ) ( not ( = ?auto_48661 ?auto_48663 ) ) ( ON ?auto_48660 ?auto_48661 ) ( CLEAR ?auto_48660 ) ( ON-TABLE ?auto_48662 ) ( ON ?auto_48664 ?auto_48662 ) ( ON ?auto_48663 ?auto_48664 ) ( not ( = ?auto_48662 ?auto_48664 ) ) ( not ( = ?auto_48662 ?auto_48663 ) ) ( not ( = ?auto_48662 ?auto_48661 ) ) ( not ( = ?auto_48662 ?auto_48660 ) ) ( not ( = ?auto_48664 ?auto_48663 ) ) ( not ( = ?auto_48664 ?auto_48661 ) ) ( not ( = ?auto_48664 ?auto_48660 ) ) ( not ( = ?auto_48658 ?auto_48662 ) ) ( not ( = ?auto_48658 ?auto_48664 ) ) ( not ( = ?auto_48659 ?auto_48662 ) ) ( not ( = ?auto_48659 ?auto_48664 ) ) ( HOLDING ?auto_48659 ) ( CLEAR ?auto_48658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48658 ?auto_48659 )
      ( MAKE-4PILE ?auto_48658 ?auto_48659 ?auto_48660 ?auto_48661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48665 - BLOCK
      ?auto_48666 - BLOCK
      ?auto_48667 - BLOCK
      ?auto_48668 - BLOCK
    )
    :vars
    (
      ?auto_48671 - BLOCK
      ?auto_48670 - BLOCK
      ?auto_48669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48665 ) ( not ( = ?auto_48665 ?auto_48666 ) ) ( not ( = ?auto_48665 ?auto_48667 ) ) ( not ( = ?auto_48665 ?auto_48668 ) ) ( not ( = ?auto_48666 ?auto_48667 ) ) ( not ( = ?auto_48666 ?auto_48668 ) ) ( not ( = ?auto_48667 ?auto_48668 ) ) ( ON ?auto_48668 ?auto_48671 ) ( not ( = ?auto_48665 ?auto_48671 ) ) ( not ( = ?auto_48666 ?auto_48671 ) ) ( not ( = ?auto_48667 ?auto_48671 ) ) ( not ( = ?auto_48668 ?auto_48671 ) ) ( ON ?auto_48667 ?auto_48668 ) ( ON-TABLE ?auto_48670 ) ( ON ?auto_48669 ?auto_48670 ) ( ON ?auto_48671 ?auto_48669 ) ( not ( = ?auto_48670 ?auto_48669 ) ) ( not ( = ?auto_48670 ?auto_48671 ) ) ( not ( = ?auto_48670 ?auto_48668 ) ) ( not ( = ?auto_48670 ?auto_48667 ) ) ( not ( = ?auto_48669 ?auto_48671 ) ) ( not ( = ?auto_48669 ?auto_48668 ) ) ( not ( = ?auto_48669 ?auto_48667 ) ) ( not ( = ?auto_48665 ?auto_48670 ) ) ( not ( = ?auto_48665 ?auto_48669 ) ) ( not ( = ?auto_48666 ?auto_48670 ) ) ( not ( = ?auto_48666 ?auto_48669 ) ) ( CLEAR ?auto_48665 ) ( ON ?auto_48666 ?auto_48667 ) ( CLEAR ?auto_48666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48670 ?auto_48669 ?auto_48671 ?auto_48668 ?auto_48667 )
      ( MAKE-4PILE ?auto_48665 ?auto_48666 ?auto_48667 ?auto_48668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48672 - BLOCK
      ?auto_48673 - BLOCK
      ?auto_48674 - BLOCK
      ?auto_48675 - BLOCK
    )
    :vars
    (
      ?auto_48678 - BLOCK
      ?auto_48677 - BLOCK
      ?auto_48676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48672 ?auto_48673 ) ) ( not ( = ?auto_48672 ?auto_48674 ) ) ( not ( = ?auto_48672 ?auto_48675 ) ) ( not ( = ?auto_48673 ?auto_48674 ) ) ( not ( = ?auto_48673 ?auto_48675 ) ) ( not ( = ?auto_48674 ?auto_48675 ) ) ( ON ?auto_48675 ?auto_48678 ) ( not ( = ?auto_48672 ?auto_48678 ) ) ( not ( = ?auto_48673 ?auto_48678 ) ) ( not ( = ?auto_48674 ?auto_48678 ) ) ( not ( = ?auto_48675 ?auto_48678 ) ) ( ON ?auto_48674 ?auto_48675 ) ( ON-TABLE ?auto_48677 ) ( ON ?auto_48676 ?auto_48677 ) ( ON ?auto_48678 ?auto_48676 ) ( not ( = ?auto_48677 ?auto_48676 ) ) ( not ( = ?auto_48677 ?auto_48678 ) ) ( not ( = ?auto_48677 ?auto_48675 ) ) ( not ( = ?auto_48677 ?auto_48674 ) ) ( not ( = ?auto_48676 ?auto_48678 ) ) ( not ( = ?auto_48676 ?auto_48675 ) ) ( not ( = ?auto_48676 ?auto_48674 ) ) ( not ( = ?auto_48672 ?auto_48677 ) ) ( not ( = ?auto_48672 ?auto_48676 ) ) ( not ( = ?auto_48673 ?auto_48677 ) ) ( not ( = ?auto_48673 ?auto_48676 ) ) ( ON ?auto_48673 ?auto_48674 ) ( CLEAR ?auto_48673 ) ( HOLDING ?auto_48672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48672 )
      ( MAKE-4PILE ?auto_48672 ?auto_48673 ?auto_48674 ?auto_48675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48679 - BLOCK
      ?auto_48680 - BLOCK
      ?auto_48681 - BLOCK
      ?auto_48682 - BLOCK
    )
    :vars
    (
      ?auto_48683 - BLOCK
      ?auto_48685 - BLOCK
      ?auto_48684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48679 ?auto_48680 ) ) ( not ( = ?auto_48679 ?auto_48681 ) ) ( not ( = ?auto_48679 ?auto_48682 ) ) ( not ( = ?auto_48680 ?auto_48681 ) ) ( not ( = ?auto_48680 ?auto_48682 ) ) ( not ( = ?auto_48681 ?auto_48682 ) ) ( ON ?auto_48682 ?auto_48683 ) ( not ( = ?auto_48679 ?auto_48683 ) ) ( not ( = ?auto_48680 ?auto_48683 ) ) ( not ( = ?auto_48681 ?auto_48683 ) ) ( not ( = ?auto_48682 ?auto_48683 ) ) ( ON ?auto_48681 ?auto_48682 ) ( ON-TABLE ?auto_48685 ) ( ON ?auto_48684 ?auto_48685 ) ( ON ?auto_48683 ?auto_48684 ) ( not ( = ?auto_48685 ?auto_48684 ) ) ( not ( = ?auto_48685 ?auto_48683 ) ) ( not ( = ?auto_48685 ?auto_48682 ) ) ( not ( = ?auto_48685 ?auto_48681 ) ) ( not ( = ?auto_48684 ?auto_48683 ) ) ( not ( = ?auto_48684 ?auto_48682 ) ) ( not ( = ?auto_48684 ?auto_48681 ) ) ( not ( = ?auto_48679 ?auto_48685 ) ) ( not ( = ?auto_48679 ?auto_48684 ) ) ( not ( = ?auto_48680 ?auto_48685 ) ) ( not ( = ?auto_48680 ?auto_48684 ) ) ( ON ?auto_48680 ?auto_48681 ) ( ON ?auto_48679 ?auto_48680 ) ( CLEAR ?auto_48679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48685 ?auto_48684 ?auto_48683 ?auto_48682 ?auto_48681 ?auto_48680 )
      ( MAKE-4PILE ?auto_48679 ?auto_48680 ?auto_48681 ?auto_48682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48688 - BLOCK
      ?auto_48689 - BLOCK
    )
    :vars
    (
      ?auto_48690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48690 ?auto_48689 ) ( CLEAR ?auto_48690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48688 ) ( ON ?auto_48689 ?auto_48688 ) ( not ( = ?auto_48688 ?auto_48689 ) ) ( not ( = ?auto_48688 ?auto_48690 ) ) ( not ( = ?auto_48689 ?auto_48690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48690 ?auto_48689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48691 - BLOCK
      ?auto_48692 - BLOCK
    )
    :vars
    (
      ?auto_48693 - BLOCK
      ?auto_48694 - BLOCK
      ?auto_48695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48693 ?auto_48692 ) ( CLEAR ?auto_48693 ) ( ON-TABLE ?auto_48691 ) ( ON ?auto_48692 ?auto_48691 ) ( not ( = ?auto_48691 ?auto_48692 ) ) ( not ( = ?auto_48691 ?auto_48693 ) ) ( not ( = ?auto_48692 ?auto_48693 ) ) ( HOLDING ?auto_48694 ) ( CLEAR ?auto_48695 ) ( not ( = ?auto_48691 ?auto_48694 ) ) ( not ( = ?auto_48691 ?auto_48695 ) ) ( not ( = ?auto_48692 ?auto_48694 ) ) ( not ( = ?auto_48692 ?auto_48695 ) ) ( not ( = ?auto_48693 ?auto_48694 ) ) ( not ( = ?auto_48693 ?auto_48695 ) ) ( not ( = ?auto_48694 ?auto_48695 ) ) )
    :subtasks
    ( ( !STACK ?auto_48694 ?auto_48695 )
      ( MAKE-2PILE ?auto_48691 ?auto_48692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48696 - BLOCK
      ?auto_48697 - BLOCK
    )
    :vars
    (
      ?auto_48700 - BLOCK
      ?auto_48698 - BLOCK
      ?auto_48699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48700 ?auto_48697 ) ( ON-TABLE ?auto_48696 ) ( ON ?auto_48697 ?auto_48696 ) ( not ( = ?auto_48696 ?auto_48697 ) ) ( not ( = ?auto_48696 ?auto_48700 ) ) ( not ( = ?auto_48697 ?auto_48700 ) ) ( CLEAR ?auto_48698 ) ( not ( = ?auto_48696 ?auto_48699 ) ) ( not ( = ?auto_48696 ?auto_48698 ) ) ( not ( = ?auto_48697 ?auto_48699 ) ) ( not ( = ?auto_48697 ?auto_48698 ) ) ( not ( = ?auto_48700 ?auto_48699 ) ) ( not ( = ?auto_48700 ?auto_48698 ) ) ( not ( = ?auto_48699 ?auto_48698 ) ) ( ON ?auto_48699 ?auto_48700 ) ( CLEAR ?auto_48699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48696 ?auto_48697 ?auto_48700 )
      ( MAKE-2PILE ?auto_48696 ?auto_48697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48701 - BLOCK
      ?auto_48702 - BLOCK
    )
    :vars
    (
      ?auto_48704 - BLOCK
      ?auto_48703 - BLOCK
      ?auto_48705 - BLOCK
      ?auto_48706 - BLOCK
      ?auto_48707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48704 ?auto_48702 ) ( ON-TABLE ?auto_48701 ) ( ON ?auto_48702 ?auto_48701 ) ( not ( = ?auto_48701 ?auto_48702 ) ) ( not ( = ?auto_48701 ?auto_48704 ) ) ( not ( = ?auto_48702 ?auto_48704 ) ) ( not ( = ?auto_48701 ?auto_48703 ) ) ( not ( = ?auto_48701 ?auto_48705 ) ) ( not ( = ?auto_48702 ?auto_48703 ) ) ( not ( = ?auto_48702 ?auto_48705 ) ) ( not ( = ?auto_48704 ?auto_48703 ) ) ( not ( = ?auto_48704 ?auto_48705 ) ) ( not ( = ?auto_48703 ?auto_48705 ) ) ( ON ?auto_48703 ?auto_48704 ) ( CLEAR ?auto_48703 ) ( HOLDING ?auto_48705 ) ( CLEAR ?auto_48706 ) ( ON-TABLE ?auto_48707 ) ( ON ?auto_48706 ?auto_48707 ) ( not ( = ?auto_48707 ?auto_48706 ) ) ( not ( = ?auto_48707 ?auto_48705 ) ) ( not ( = ?auto_48706 ?auto_48705 ) ) ( not ( = ?auto_48701 ?auto_48706 ) ) ( not ( = ?auto_48701 ?auto_48707 ) ) ( not ( = ?auto_48702 ?auto_48706 ) ) ( not ( = ?auto_48702 ?auto_48707 ) ) ( not ( = ?auto_48704 ?auto_48706 ) ) ( not ( = ?auto_48704 ?auto_48707 ) ) ( not ( = ?auto_48703 ?auto_48706 ) ) ( not ( = ?auto_48703 ?auto_48707 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48707 ?auto_48706 ?auto_48705 )
      ( MAKE-2PILE ?auto_48701 ?auto_48702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48708 - BLOCK
      ?auto_48709 - BLOCK
    )
    :vars
    (
      ?auto_48711 - BLOCK
      ?auto_48713 - BLOCK
      ?auto_48712 - BLOCK
      ?auto_48710 - BLOCK
      ?auto_48714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48711 ?auto_48709 ) ( ON-TABLE ?auto_48708 ) ( ON ?auto_48709 ?auto_48708 ) ( not ( = ?auto_48708 ?auto_48709 ) ) ( not ( = ?auto_48708 ?auto_48711 ) ) ( not ( = ?auto_48709 ?auto_48711 ) ) ( not ( = ?auto_48708 ?auto_48713 ) ) ( not ( = ?auto_48708 ?auto_48712 ) ) ( not ( = ?auto_48709 ?auto_48713 ) ) ( not ( = ?auto_48709 ?auto_48712 ) ) ( not ( = ?auto_48711 ?auto_48713 ) ) ( not ( = ?auto_48711 ?auto_48712 ) ) ( not ( = ?auto_48713 ?auto_48712 ) ) ( ON ?auto_48713 ?auto_48711 ) ( CLEAR ?auto_48710 ) ( ON-TABLE ?auto_48714 ) ( ON ?auto_48710 ?auto_48714 ) ( not ( = ?auto_48714 ?auto_48710 ) ) ( not ( = ?auto_48714 ?auto_48712 ) ) ( not ( = ?auto_48710 ?auto_48712 ) ) ( not ( = ?auto_48708 ?auto_48710 ) ) ( not ( = ?auto_48708 ?auto_48714 ) ) ( not ( = ?auto_48709 ?auto_48710 ) ) ( not ( = ?auto_48709 ?auto_48714 ) ) ( not ( = ?auto_48711 ?auto_48710 ) ) ( not ( = ?auto_48711 ?auto_48714 ) ) ( not ( = ?auto_48713 ?auto_48710 ) ) ( not ( = ?auto_48713 ?auto_48714 ) ) ( ON ?auto_48712 ?auto_48713 ) ( CLEAR ?auto_48712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48708 ?auto_48709 ?auto_48711 ?auto_48713 )
      ( MAKE-2PILE ?auto_48708 ?auto_48709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48715 - BLOCK
      ?auto_48716 - BLOCK
    )
    :vars
    (
      ?auto_48719 - BLOCK
      ?auto_48717 - BLOCK
      ?auto_48721 - BLOCK
      ?auto_48718 - BLOCK
      ?auto_48720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48719 ?auto_48716 ) ( ON-TABLE ?auto_48715 ) ( ON ?auto_48716 ?auto_48715 ) ( not ( = ?auto_48715 ?auto_48716 ) ) ( not ( = ?auto_48715 ?auto_48719 ) ) ( not ( = ?auto_48716 ?auto_48719 ) ) ( not ( = ?auto_48715 ?auto_48717 ) ) ( not ( = ?auto_48715 ?auto_48721 ) ) ( not ( = ?auto_48716 ?auto_48717 ) ) ( not ( = ?auto_48716 ?auto_48721 ) ) ( not ( = ?auto_48719 ?auto_48717 ) ) ( not ( = ?auto_48719 ?auto_48721 ) ) ( not ( = ?auto_48717 ?auto_48721 ) ) ( ON ?auto_48717 ?auto_48719 ) ( ON-TABLE ?auto_48718 ) ( not ( = ?auto_48718 ?auto_48720 ) ) ( not ( = ?auto_48718 ?auto_48721 ) ) ( not ( = ?auto_48720 ?auto_48721 ) ) ( not ( = ?auto_48715 ?auto_48720 ) ) ( not ( = ?auto_48715 ?auto_48718 ) ) ( not ( = ?auto_48716 ?auto_48720 ) ) ( not ( = ?auto_48716 ?auto_48718 ) ) ( not ( = ?auto_48719 ?auto_48720 ) ) ( not ( = ?auto_48719 ?auto_48718 ) ) ( not ( = ?auto_48717 ?auto_48720 ) ) ( not ( = ?auto_48717 ?auto_48718 ) ) ( ON ?auto_48721 ?auto_48717 ) ( CLEAR ?auto_48721 ) ( HOLDING ?auto_48720 ) ( CLEAR ?auto_48718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48718 ?auto_48720 )
      ( MAKE-2PILE ?auto_48715 ?auto_48716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48722 - BLOCK
      ?auto_48723 - BLOCK
    )
    :vars
    (
      ?auto_48726 - BLOCK
      ?auto_48728 - BLOCK
      ?auto_48725 - BLOCK
      ?auto_48724 - BLOCK
      ?auto_48727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48726 ?auto_48723 ) ( ON-TABLE ?auto_48722 ) ( ON ?auto_48723 ?auto_48722 ) ( not ( = ?auto_48722 ?auto_48723 ) ) ( not ( = ?auto_48722 ?auto_48726 ) ) ( not ( = ?auto_48723 ?auto_48726 ) ) ( not ( = ?auto_48722 ?auto_48728 ) ) ( not ( = ?auto_48722 ?auto_48725 ) ) ( not ( = ?auto_48723 ?auto_48728 ) ) ( not ( = ?auto_48723 ?auto_48725 ) ) ( not ( = ?auto_48726 ?auto_48728 ) ) ( not ( = ?auto_48726 ?auto_48725 ) ) ( not ( = ?auto_48728 ?auto_48725 ) ) ( ON ?auto_48728 ?auto_48726 ) ( ON-TABLE ?auto_48724 ) ( not ( = ?auto_48724 ?auto_48727 ) ) ( not ( = ?auto_48724 ?auto_48725 ) ) ( not ( = ?auto_48727 ?auto_48725 ) ) ( not ( = ?auto_48722 ?auto_48727 ) ) ( not ( = ?auto_48722 ?auto_48724 ) ) ( not ( = ?auto_48723 ?auto_48727 ) ) ( not ( = ?auto_48723 ?auto_48724 ) ) ( not ( = ?auto_48726 ?auto_48727 ) ) ( not ( = ?auto_48726 ?auto_48724 ) ) ( not ( = ?auto_48728 ?auto_48727 ) ) ( not ( = ?auto_48728 ?auto_48724 ) ) ( ON ?auto_48725 ?auto_48728 ) ( CLEAR ?auto_48724 ) ( ON ?auto_48727 ?auto_48725 ) ( CLEAR ?auto_48727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48722 ?auto_48723 ?auto_48726 ?auto_48728 ?auto_48725 )
      ( MAKE-2PILE ?auto_48722 ?auto_48723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48729 - BLOCK
      ?auto_48730 - BLOCK
    )
    :vars
    (
      ?auto_48735 - BLOCK
      ?auto_48731 - BLOCK
      ?auto_48732 - BLOCK
      ?auto_48734 - BLOCK
      ?auto_48733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48735 ?auto_48730 ) ( ON-TABLE ?auto_48729 ) ( ON ?auto_48730 ?auto_48729 ) ( not ( = ?auto_48729 ?auto_48730 ) ) ( not ( = ?auto_48729 ?auto_48735 ) ) ( not ( = ?auto_48730 ?auto_48735 ) ) ( not ( = ?auto_48729 ?auto_48731 ) ) ( not ( = ?auto_48729 ?auto_48732 ) ) ( not ( = ?auto_48730 ?auto_48731 ) ) ( not ( = ?auto_48730 ?auto_48732 ) ) ( not ( = ?auto_48735 ?auto_48731 ) ) ( not ( = ?auto_48735 ?auto_48732 ) ) ( not ( = ?auto_48731 ?auto_48732 ) ) ( ON ?auto_48731 ?auto_48735 ) ( not ( = ?auto_48734 ?auto_48733 ) ) ( not ( = ?auto_48734 ?auto_48732 ) ) ( not ( = ?auto_48733 ?auto_48732 ) ) ( not ( = ?auto_48729 ?auto_48733 ) ) ( not ( = ?auto_48729 ?auto_48734 ) ) ( not ( = ?auto_48730 ?auto_48733 ) ) ( not ( = ?auto_48730 ?auto_48734 ) ) ( not ( = ?auto_48735 ?auto_48733 ) ) ( not ( = ?auto_48735 ?auto_48734 ) ) ( not ( = ?auto_48731 ?auto_48733 ) ) ( not ( = ?auto_48731 ?auto_48734 ) ) ( ON ?auto_48732 ?auto_48731 ) ( ON ?auto_48733 ?auto_48732 ) ( CLEAR ?auto_48733 ) ( HOLDING ?auto_48734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48734 )
      ( MAKE-2PILE ?auto_48729 ?auto_48730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48736 - BLOCK
      ?auto_48737 - BLOCK
    )
    :vars
    (
      ?auto_48738 - BLOCK
      ?auto_48740 - BLOCK
      ?auto_48741 - BLOCK
      ?auto_48739 - BLOCK
      ?auto_48742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48738 ?auto_48737 ) ( ON-TABLE ?auto_48736 ) ( ON ?auto_48737 ?auto_48736 ) ( not ( = ?auto_48736 ?auto_48737 ) ) ( not ( = ?auto_48736 ?auto_48738 ) ) ( not ( = ?auto_48737 ?auto_48738 ) ) ( not ( = ?auto_48736 ?auto_48740 ) ) ( not ( = ?auto_48736 ?auto_48741 ) ) ( not ( = ?auto_48737 ?auto_48740 ) ) ( not ( = ?auto_48737 ?auto_48741 ) ) ( not ( = ?auto_48738 ?auto_48740 ) ) ( not ( = ?auto_48738 ?auto_48741 ) ) ( not ( = ?auto_48740 ?auto_48741 ) ) ( ON ?auto_48740 ?auto_48738 ) ( not ( = ?auto_48739 ?auto_48742 ) ) ( not ( = ?auto_48739 ?auto_48741 ) ) ( not ( = ?auto_48742 ?auto_48741 ) ) ( not ( = ?auto_48736 ?auto_48742 ) ) ( not ( = ?auto_48736 ?auto_48739 ) ) ( not ( = ?auto_48737 ?auto_48742 ) ) ( not ( = ?auto_48737 ?auto_48739 ) ) ( not ( = ?auto_48738 ?auto_48742 ) ) ( not ( = ?auto_48738 ?auto_48739 ) ) ( not ( = ?auto_48740 ?auto_48742 ) ) ( not ( = ?auto_48740 ?auto_48739 ) ) ( ON ?auto_48741 ?auto_48740 ) ( ON ?auto_48742 ?auto_48741 ) ( ON ?auto_48739 ?auto_48742 ) ( CLEAR ?auto_48739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48736 ?auto_48737 ?auto_48738 ?auto_48740 ?auto_48741 ?auto_48742 )
      ( MAKE-2PILE ?auto_48736 ?auto_48737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48748 - BLOCK
      ?auto_48749 - BLOCK
      ?auto_48750 - BLOCK
      ?auto_48751 - BLOCK
      ?auto_48752 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48752 ) ( CLEAR ?auto_48751 ) ( ON-TABLE ?auto_48748 ) ( ON ?auto_48749 ?auto_48748 ) ( ON ?auto_48750 ?auto_48749 ) ( ON ?auto_48751 ?auto_48750 ) ( not ( = ?auto_48748 ?auto_48749 ) ) ( not ( = ?auto_48748 ?auto_48750 ) ) ( not ( = ?auto_48748 ?auto_48751 ) ) ( not ( = ?auto_48748 ?auto_48752 ) ) ( not ( = ?auto_48749 ?auto_48750 ) ) ( not ( = ?auto_48749 ?auto_48751 ) ) ( not ( = ?auto_48749 ?auto_48752 ) ) ( not ( = ?auto_48750 ?auto_48751 ) ) ( not ( = ?auto_48750 ?auto_48752 ) ) ( not ( = ?auto_48751 ?auto_48752 ) ) )
    :subtasks
    ( ( !STACK ?auto_48752 ?auto_48751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48753 - BLOCK
      ?auto_48754 - BLOCK
      ?auto_48755 - BLOCK
      ?auto_48756 - BLOCK
      ?auto_48757 - BLOCK
    )
    :vars
    (
      ?auto_48758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48756 ) ( ON-TABLE ?auto_48753 ) ( ON ?auto_48754 ?auto_48753 ) ( ON ?auto_48755 ?auto_48754 ) ( ON ?auto_48756 ?auto_48755 ) ( not ( = ?auto_48753 ?auto_48754 ) ) ( not ( = ?auto_48753 ?auto_48755 ) ) ( not ( = ?auto_48753 ?auto_48756 ) ) ( not ( = ?auto_48753 ?auto_48757 ) ) ( not ( = ?auto_48754 ?auto_48755 ) ) ( not ( = ?auto_48754 ?auto_48756 ) ) ( not ( = ?auto_48754 ?auto_48757 ) ) ( not ( = ?auto_48755 ?auto_48756 ) ) ( not ( = ?auto_48755 ?auto_48757 ) ) ( not ( = ?auto_48756 ?auto_48757 ) ) ( ON ?auto_48757 ?auto_48758 ) ( CLEAR ?auto_48757 ) ( HAND-EMPTY ) ( not ( = ?auto_48753 ?auto_48758 ) ) ( not ( = ?auto_48754 ?auto_48758 ) ) ( not ( = ?auto_48755 ?auto_48758 ) ) ( not ( = ?auto_48756 ?auto_48758 ) ) ( not ( = ?auto_48757 ?auto_48758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48757 ?auto_48758 )
      ( MAKE-5PILE ?auto_48753 ?auto_48754 ?auto_48755 ?auto_48756 ?auto_48757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48759 - BLOCK
      ?auto_48760 - BLOCK
      ?auto_48761 - BLOCK
      ?auto_48762 - BLOCK
      ?auto_48763 - BLOCK
    )
    :vars
    (
      ?auto_48764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48759 ) ( ON ?auto_48760 ?auto_48759 ) ( ON ?auto_48761 ?auto_48760 ) ( not ( = ?auto_48759 ?auto_48760 ) ) ( not ( = ?auto_48759 ?auto_48761 ) ) ( not ( = ?auto_48759 ?auto_48762 ) ) ( not ( = ?auto_48759 ?auto_48763 ) ) ( not ( = ?auto_48760 ?auto_48761 ) ) ( not ( = ?auto_48760 ?auto_48762 ) ) ( not ( = ?auto_48760 ?auto_48763 ) ) ( not ( = ?auto_48761 ?auto_48762 ) ) ( not ( = ?auto_48761 ?auto_48763 ) ) ( not ( = ?auto_48762 ?auto_48763 ) ) ( ON ?auto_48763 ?auto_48764 ) ( CLEAR ?auto_48763 ) ( not ( = ?auto_48759 ?auto_48764 ) ) ( not ( = ?auto_48760 ?auto_48764 ) ) ( not ( = ?auto_48761 ?auto_48764 ) ) ( not ( = ?auto_48762 ?auto_48764 ) ) ( not ( = ?auto_48763 ?auto_48764 ) ) ( HOLDING ?auto_48762 ) ( CLEAR ?auto_48761 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48759 ?auto_48760 ?auto_48761 ?auto_48762 )
      ( MAKE-5PILE ?auto_48759 ?auto_48760 ?auto_48761 ?auto_48762 ?auto_48763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48765 - BLOCK
      ?auto_48766 - BLOCK
      ?auto_48767 - BLOCK
      ?auto_48768 - BLOCK
      ?auto_48769 - BLOCK
    )
    :vars
    (
      ?auto_48770 - BLOCK
      ?auto_48771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48765 ) ( ON ?auto_48766 ?auto_48765 ) ( ON ?auto_48767 ?auto_48766 ) ( not ( = ?auto_48765 ?auto_48766 ) ) ( not ( = ?auto_48765 ?auto_48767 ) ) ( not ( = ?auto_48765 ?auto_48768 ) ) ( not ( = ?auto_48765 ?auto_48769 ) ) ( not ( = ?auto_48766 ?auto_48767 ) ) ( not ( = ?auto_48766 ?auto_48768 ) ) ( not ( = ?auto_48766 ?auto_48769 ) ) ( not ( = ?auto_48767 ?auto_48768 ) ) ( not ( = ?auto_48767 ?auto_48769 ) ) ( not ( = ?auto_48768 ?auto_48769 ) ) ( ON ?auto_48769 ?auto_48770 ) ( not ( = ?auto_48765 ?auto_48770 ) ) ( not ( = ?auto_48766 ?auto_48770 ) ) ( not ( = ?auto_48767 ?auto_48770 ) ) ( not ( = ?auto_48768 ?auto_48770 ) ) ( not ( = ?auto_48769 ?auto_48770 ) ) ( CLEAR ?auto_48767 ) ( ON ?auto_48768 ?auto_48769 ) ( CLEAR ?auto_48768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48771 ) ( ON ?auto_48770 ?auto_48771 ) ( not ( = ?auto_48771 ?auto_48770 ) ) ( not ( = ?auto_48771 ?auto_48769 ) ) ( not ( = ?auto_48771 ?auto_48768 ) ) ( not ( = ?auto_48765 ?auto_48771 ) ) ( not ( = ?auto_48766 ?auto_48771 ) ) ( not ( = ?auto_48767 ?auto_48771 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48771 ?auto_48770 ?auto_48769 )
      ( MAKE-5PILE ?auto_48765 ?auto_48766 ?auto_48767 ?auto_48768 ?auto_48769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48772 - BLOCK
      ?auto_48773 - BLOCK
      ?auto_48774 - BLOCK
      ?auto_48775 - BLOCK
      ?auto_48776 - BLOCK
    )
    :vars
    (
      ?auto_48778 - BLOCK
      ?auto_48777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48772 ) ( ON ?auto_48773 ?auto_48772 ) ( not ( = ?auto_48772 ?auto_48773 ) ) ( not ( = ?auto_48772 ?auto_48774 ) ) ( not ( = ?auto_48772 ?auto_48775 ) ) ( not ( = ?auto_48772 ?auto_48776 ) ) ( not ( = ?auto_48773 ?auto_48774 ) ) ( not ( = ?auto_48773 ?auto_48775 ) ) ( not ( = ?auto_48773 ?auto_48776 ) ) ( not ( = ?auto_48774 ?auto_48775 ) ) ( not ( = ?auto_48774 ?auto_48776 ) ) ( not ( = ?auto_48775 ?auto_48776 ) ) ( ON ?auto_48776 ?auto_48778 ) ( not ( = ?auto_48772 ?auto_48778 ) ) ( not ( = ?auto_48773 ?auto_48778 ) ) ( not ( = ?auto_48774 ?auto_48778 ) ) ( not ( = ?auto_48775 ?auto_48778 ) ) ( not ( = ?auto_48776 ?auto_48778 ) ) ( ON ?auto_48775 ?auto_48776 ) ( CLEAR ?auto_48775 ) ( ON-TABLE ?auto_48777 ) ( ON ?auto_48778 ?auto_48777 ) ( not ( = ?auto_48777 ?auto_48778 ) ) ( not ( = ?auto_48777 ?auto_48776 ) ) ( not ( = ?auto_48777 ?auto_48775 ) ) ( not ( = ?auto_48772 ?auto_48777 ) ) ( not ( = ?auto_48773 ?auto_48777 ) ) ( not ( = ?auto_48774 ?auto_48777 ) ) ( HOLDING ?auto_48774 ) ( CLEAR ?auto_48773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48772 ?auto_48773 ?auto_48774 )
      ( MAKE-5PILE ?auto_48772 ?auto_48773 ?auto_48774 ?auto_48775 ?auto_48776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48779 - BLOCK
      ?auto_48780 - BLOCK
      ?auto_48781 - BLOCK
      ?auto_48782 - BLOCK
      ?auto_48783 - BLOCK
    )
    :vars
    (
      ?auto_48785 - BLOCK
      ?auto_48784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48779 ) ( ON ?auto_48780 ?auto_48779 ) ( not ( = ?auto_48779 ?auto_48780 ) ) ( not ( = ?auto_48779 ?auto_48781 ) ) ( not ( = ?auto_48779 ?auto_48782 ) ) ( not ( = ?auto_48779 ?auto_48783 ) ) ( not ( = ?auto_48780 ?auto_48781 ) ) ( not ( = ?auto_48780 ?auto_48782 ) ) ( not ( = ?auto_48780 ?auto_48783 ) ) ( not ( = ?auto_48781 ?auto_48782 ) ) ( not ( = ?auto_48781 ?auto_48783 ) ) ( not ( = ?auto_48782 ?auto_48783 ) ) ( ON ?auto_48783 ?auto_48785 ) ( not ( = ?auto_48779 ?auto_48785 ) ) ( not ( = ?auto_48780 ?auto_48785 ) ) ( not ( = ?auto_48781 ?auto_48785 ) ) ( not ( = ?auto_48782 ?auto_48785 ) ) ( not ( = ?auto_48783 ?auto_48785 ) ) ( ON ?auto_48782 ?auto_48783 ) ( ON-TABLE ?auto_48784 ) ( ON ?auto_48785 ?auto_48784 ) ( not ( = ?auto_48784 ?auto_48785 ) ) ( not ( = ?auto_48784 ?auto_48783 ) ) ( not ( = ?auto_48784 ?auto_48782 ) ) ( not ( = ?auto_48779 ?auto_48784 ) ) ( not ( = ?auto_48780 ?auto_48784 ) ) ( not ( = ?auto_48781 ?auto_48784 ) ) ( CLEAR ?auto_48780 ) ( ON ?auto_48781 ?auto_48782 ) ( CLEAR ?auto_48781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48784 ?auto_48785 ?auto_48783 ?auto_48782 )
      ( MAKE-5PILE ?auto_48779 ?auto_48780 ?auto_48781 ?auto_48782 ?auto_48783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48786 - BLOCK
      ?auto_48787 - BLOCK
      ?auto_48788 - BLOCK
      ?auto_48789 - BLOCK
      ?auto_48790 - BLOCK
    )
    :vars
    (
      ?auto_48792 - BLOCK
      ?auto_48791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48786 ) ( not ( = ?auto_48786 ?auto_48787 ) ) ( not ( = ?auto_48786 ?auto_48788 ) ) ( not ( = ?auto_48786 ?auto_48789 ) ) ( not ( = ?auto_48786 ?auto_48790 ) ) ( not ( = ?auto_48787 ?auto_48788 ) ) ( not ( = ?auto_48787 ?auto_48789 ) ) ( not ( = ?auto_48787 ?auto_48790 ) ) ( not ( = ?auto_48788 ?auto_48789 ) ) ( not ( = ?auto_48788 ?auto_48790 ) ) ( not ( = ?auto_48789 ?auto_48790 ) ) ( ON ?auto_48790 ?auto_48792 ) ( not ( = ?auto_48786 ?auto_48792 ) ) ( not ( = ?auto_48787 ?auto_48792 ) ) ( not ( = ?auto_48788 ?auto_48792 ) ) ( not ( = ?auto_48789 ?auto_48792 ) ) ( not ( = ?auto_48790 ?auto_48792 ) ) ( ON ?auto_48789 ?auto_48790 ) ( ON-TABLE ?auto_48791 ) ( ON ?auto_48792 ?auto_48791 ) ( not ( = ?auto_48791 ?auto_48792 ) ) ( not ( = ?auto_48791 ?auto_48790 ) ) ( not ( = ?auto_48791 ?auto_48789 ) ) ( not ( = ?auto_48786 ?auto_48791 ) ) ( not ( = ?auto_48787 ?auto_48791 ) ) ( not ( = ?auto_48788 ?auto_48791 ) ) ( ON ?auto_48788 ?auto_48789 ) ( CLEAR ?auto_48788 ) ( HOLDING ?auto_48787 ) ( CLEAR ?auto_48786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48786 ?auto_48787 )
      ( MAKE-5PILE ?auto_48786 ?auto_48787 ?auto_48788 ?auto_48789 ?auto_48790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48793 - BLOCK
      ?auto_48794 - BLOCK
      ?auto_48795 - BLOCK
      ?auto_48796 - BLOCK
      ?auto_48797 - BLOCK
    )
    :vars
    (
      ?auto_48798 - BLOCK
      ?auto_48799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48793 ) ( not ( = ?auto_48793 ?auto_48794 ) ) ( not ( = ?auto_48793 ?auto_48795 ) ) ( not ( = ?auto_48793 ?auto_48796 ) ) ( not ( = ?auto_48793 ?auto_48797 ) ) ( not ( = ?auto_48794 ?auto_48795 ) ) ( not ( = ?auto_48794 ?auto_48796 ) ) ( not ( = ?auto_48794 ?auto_48797 ) ) ( not ( = ?auto_48795 ?auto_48796 ) ) ( not ( = ?auto_48795 ?auto_48797 ) ) ( not ( = ?auto_48796 ?auto_48797 ) ) ( ON ?auto_48797 ?auto_48798 ) ( not ( = ?auto_48793 ?auto_48798 ) ) ( not ( = ?auto_48794 ?auto_48798 ) ) ( not ( = ?auto_48795 ?auto_48798 ) ) ( not ( = ?auto_48796 ?auto_48798 ) ) ( not ( = ?auto_48797 ?auto_48798 ) ) ( ON ?auto_48796 ?auto_48797 ) ( ON-TABLE ?auto_48799 ) ( ON ?auto_48798 ?auto_48799 ) ( not ( = ?auto_48799 ?auto_48798 ) ) ( not ( = ?auto_48799 ?auto_48797 ) ) ( not ( = ?auto_48799 ?auto_48796 ) ) ( not ( = ?auto_48793 ?auto_48799 ) ) ( not ( = ?auto_48794 ?auto_48799 ) ) ( not ( = ?auto_48795 ?auto_48799 ) ) ( ON ?auto_48795 ?auto_48796 ) ( CLEAR ?auto_48793 ) ( ON ?auto_48794 ?auto_48795 ) ( CLEAR ?auto_48794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48799 ?auto_48798 ?auto_48797 ?auto_48796 ?auto_48795 )
      ( MAKE-5PILE ?auto_48793 ?auto_48794 ?auto_48795 ?auto_48796 ?auto_48797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48800 - BLOCK
      ?auto_48801 - BLOCK
      ?auto_48802 - BLOCK
      ?auto_48803 - BLOCK
      ?auto_48804 - BLOCK
    )
    :vars
    (
      ?auto_48806 - BLOCK
      ?auto_48805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48800 ?auto_48801 ) ) ( not ( = ?auto_48800 ?auto_48802 ) ) ( not ( = ?auto_48800 ?auto_48803 ) ) ( not ( = ?auto_48800 ?auto_48804 ) ) ( not ( = ?auto_48801 ?auto_48802 ) ) ( not ( = ?auto_48801 ?auto_48803 ) ) ( not ( = ?auto_48801 ?auto_48804 ) ) ( not ( = ?auto_48802 ?auto_48803 ) ) ( not ( = ?auto_48802 ?auto_48804 ) ) ( not ( = ?auto_48803 ?auto_48804 ) ) ( ON ?auto_48804 ?auto_48806 ) ( not ( = ?auto_48800 ?auto_48806 ) ) ( not ( = ?auto_48801 ?auto_48806 ) ) ( not ( = ?auto_48802 ?auto_48806 ) ) ( not ( = ?auto_48803 ?auto_48806 ) ) ( not ( = ?auto_48804 ?auto_48806 ) ) ( ON ?auto_48803 ?auto_48804 ) ( ON-TABLE ?auto_48805 ) ( ON ?auto_48806 ?auto_48805 ) ( not ( = ?auto_48805 ?auto_48806 ) ) ( not ( = ?auto_48805 ?auto_48804 ) ) ( not ( = ?auto_48805 ?auto_48803 ) ) ( not ( = ?auto_48800 ?auto_48805 ) ) ( not ( = ?auto_48801 ?auto_48805 ) ) ( not ( = ?auto_48802 ?auto_48805 ) ) ( ON ?auto_48802 ?auto_48803 ) ( ON ?auto_48801 ?auto_48802 ) ( CLEAR ?auto_48801 ) ( HOLDING ?auto_48800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48800 )
      ( MAKE-5PILE ?auto_48800 ?auto_48801 ?auto_48802 ?auto_48803 ?auto_48804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48807 - BLOCK
      ?auto_48808 - BLOCK
      ?auto_48809 - BLOCK
      ?auto_48810 - BLOCK
      ?auto_48811 - BLOCK
    )
    :vars
    (
      ?auto_48812 - BLOCK
      ?auto_48813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48807 ?auto_48808 ) ) ( not ( = ?auto_48807 ?auto_48809 ) ) ( not ( = ?auto_48807 ?auto_48810 ) ) ( not ( = ?auto_48807 ?auto_48811 ) ) ( not ( = ?auto_48808 ?auto_48809 ) ) ( not ( = ?auto_48808 ?auto_48810 ) ) ( not ( = ?auto_48808 ?auto_48811 ) ) ( not ( = ?auto_48809 ?auto_48810 ) ) ( not ( = ?auto_48809 ?auto_48811 ) ) ( not ( = ?auto_48810 ?auto_48811 ) ) ( ON ?auto_48811 ?auto_48812 ) ( not ( = ?auto_48807 ?auto_48812 ) ) ( not ( = ?auto_48808 ?auto_48812 ) ) ( not ( = ?auto_48809 ?auto_48812 ) ) ( not ( = ?auto_48810 ?auto_48812 ) ) ( not ( = ?auto_48811 ?auto_48812 ) ) ( ON ?auto_48810 ?auto_48811 ) ( ON-TABLE ?auto_48813 ) ( ON ?auto_48812 ?auto_48813 ) ( not ( = ?auto_48813 ?auto_48812 ) ) ( not ( = ?auto_48813 ?auto_48811 ) ) ( not ( = ?auto_48813 ?auto_48810 ) ) ( not ( = ?auto_48807 ?auto_48813 ) ) ( not ( = ?auto_48808 ?auto_48813 ) ) ( not ( = ?auto_48809 ?auto_48813 ) ) ( ON ?auto_48809 ?auto_48810 ) ( ON ?auto_48808 ?auto_48809 ) ( ON ?auto_48807 ?auto_48808 ) ( CLEAR ?auto_48807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48813 ?auto_48812 ?auto_48811 ?auto_48810 ?auto_48809 ?auto_48808 )
      ( MAKE-5PILE ?auto_48807 ?auto_48808 ?auto_48809 ?auto_48810 ?auto_48811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48815 - BLOCK
    )
    :vars
    (
      ?auto_48816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48816 ?auto_48815 ) ( CLEAR ?auto_48816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48815 ) ( not ( = ?auto_48815 ?auto_48816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48816 ?auto_48815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48817 - BLOCK
    )
    :vars
    (
      ?auto_48818 - BLOCK
      ?auto_48819 - BLOCK
      ?auto_48820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48818 ?auto_48817 ) ( CLEAR ?auto_48818 ) ( ON-TABLE ?auto_48817 ) ( not ( = ?auto_48817 ?auto_48818 ) ) ( HOLDING ?auto_48819 ) ( CLEAR ?auto_48820 ) ( not ( = ?auto_48817 ?auto_48819 ) ) ( not ( = ?auto_48817 ?auto_48820 ) ) ( not ( = ?auto_48818 ?auto_48819 ) ) ( not ( = ?auto_48818 ?auto_48820 ) ) ( not ( = ?auto_48819 ?auto_48820 ) ) )
    :subtasks
    ( ( !STACK ?auto_48819 ?auto_48820 )
      ( MAKE-1PILE ?auto_48817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48821 - BLOCK
    )
    :vars
    (
      ?auto_48824 - BLOCK
      ?auto_48823 - BLOCK
      ?auto_48822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48824 ?auto_48821 ) ( ON-TABLE ?auto_48821 ) ( not ( = ?auto_48821 ?auto_48824 ) ) ( CLEAR ?auto_48823 ) ( not ( = ?auto_48821 ?auto_48822 ) ) ( not ( = ?auto_48821 ?auto_48823 ) ) ( not ( = ?auto_48824 ?auto_48822 ) ) ( not ( = ?auto_48824 ?auto_48823 ) ) ( not ( = ?auto_48822 ?auto_48823 ) ) ( ON ?auto_48822 ?auto_48824 ) ( CLEAR ?auto_48822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48821 ?auto_48824 )
      ( MAKE-1PILE ?auto_48821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48825 - BLOCK
    )
    :vars
    (
      ?auto_48827 - BLOCK
      ?auto_48828 - BLOCK
      ?auto_48826 - BLOCK
      ?auto_48829 - BLOCK
      ?auto_48830 - BLOCK
      ?auto_48831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48827 ?auto_48825 ) ( ON-TABLE ?auto_48825 ) ( not ( = ?auto_48825 ?auto_48827 ) ) ( not ( = ?auto_48825 ?auto_48828 ) ) ( not ( = ?auto_48825 ?auto_48826 ) ) ( not ( = ?auto_48827 ?auto_48828 ) ) ( not ( = ?auto_48827 ?auto_48826 ) ) ( not ( = ?auto_48828 ?auto_48826 ) ) ( ON ?auto_48828 ?auto_48827 ) ( CLEAR ?auto_48828 ) ( HOLDING ?auto_48826 ) ( CLEAR ?auto_48829 ) ( ON-TABLE ?auto_48830 ) ( ON ?auto_48831 ?auto_48830 ) ( ON ?auto_48829 ?auto_48831 ) ( not ( = ?auto_48830 ?auto_48831 ) ) ( not ( = ?auto_48830 ?auto_48829 ) ) ( not ( = ?auto_48830 ?auto_48826 ) ) ( not ( = ?auto_48831 ?auto_48829 ) ) ( not ( = ?auto_48831 ?auto_48826 ) ) ( not ( = ?auto_48829 ?auto_48826 ) ) ( not ( = ?auto_48825 ?auto_48829 ) ) ( not ( = ?auto_48825 ?auto_48830 ) ) ( not ( = ?auto_48825 ?auto_48831 ) ) ( not ( = ?auto_48827 ?auto_48829 ) ) ( not ( = ?auto_48827 ?auto_48830 ) ) ( not ( = ?auto_48827 ?auto_48831 ) ) ( not ( = ?auto_48828 ?auto_48829 ) ) ( not ( = ?auto_48828 ?auto_48830 ) ) ( not ( = ?auto_48828 ?auto_48831 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48830 ?auto_48831 ?auto_48829 ?auto_48826 )
      ( MAKE-1PILE ?auto_48825 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48832 - BLOCK
    )
    :vars
    (
      ?auto_48834 - BLOCK
      ?auto_48835 - BLOCK
      ?auto_48837 - BLOCK
      ?auto_48833 - BLOCK
      ?auto_48838 - BLOCK
      ?auto_48836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48834 ?auto_48832 ) ( ON-TABLE ?auto_48832 ) ( not ( = ?auto_48832 ?auto_48834 ) ) ( not ( = ?auto_48832 ?auto_48835 ) ) ( not ( = ?auto_48832 ?auto_48837 ) ) ( not ( = ?auto_48834 ?auto_48835 ) ) ( not ( = ?auto_48834 ?auto_48837 ) ) ( not ( = ?auto_48835 ?auto_48837 ) ) ( ON ?auto_48835 ?auto_48834 ) ( CLEAR ?auto_48833 ) ( ON-TABLE ?auto_48838 ) ( ON ?auto_48836 ?auto_48838 ) ( ON ?auto_48833 ?auto_48836 ) ( not ( = ?auto_48838 ?auto_48836 ) ) ( not ( = ?auto_48838 ?auto_48833 ) ) ( not ( = ?auto_48838 ?auto_48837 ) ) ( not ( = ?auto_48836 ?auto_48833 ) ) ( not ( = ?auto_48836 ?auto_48837 ) ) ( not ( = ?auto_48833 ?auto_48837 ) ) ( not ( = ?auto_48832 ?auto_48833 ) ) ( not ( = ?auto_48832 ?auto_48838 ) ) ( not ( = ?auto_48832 ?auto_48836 ) ) ( not ( = ?auto_48834 ?auto_48833 ) ) ( not ( = ?auto_48834 ?auto_48838 ) ) ( not ( = ?auto_48834 ?auto_48836 ) ) ( not ( = ?auto_48835 ?auto_48833 ) ) ( not ( = ?auto_48835 ?auto_48838 ) ) ( not ( = ?auto_48835 ?auto_48836 ) ) ( ON ?auto_48837 ?auto_48835 ) ( CLEAR ?auto_48837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48832 ?auto_48834 ?auto_48835 )
      ( MAKE-1PILE ?auto_48832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48839 - BLOCK
    )
    :vars
    (
      ?auto_48843 - BLOCK
      ?auto_48841 - BLOCK
      ?auto_48842 - BLOCK
      ?auto_48844 - BLOCK
      ?auto_48840 - BLOCK
      ?auto_48845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48843 ?auto_48839 ) ( ON-TABLE ?auto_48839 ) ( not ( = ?auto_48839 ?auto_48843 ) ) ( not ( = ?auto_48839 ?auto_48841 ) ) ( not ( = ?auto_48839 ?auto_48842 ) ) ( not ( = ?auto_48843 ?auto_48841 ) ) ( not ( = ?auto_48843 ?auto_48842 ) ) ( not ( = ?auto_48841 ?auto_48842 ) ) ( ON ?auto_48841 ?auto_48843 ) ( ON-TABLE ?auto_48844 ) ( ON ?auto_48840 ?auto_48844 ) ( not ( = ?auto_48844 ?auto_48840 ) ) ( not ( = ?auto_48844 ?auto_48845 ) ) ( not ( = ?auto_48844 ?auto_48842 ) ) ( not ( = ?auto_48840 ?auto_48845 ) ) ( not ( = ?auto_48840 ?auto_48842 ) ) ( not ( = ?auto_48845 ?auto_48842 ) ) ( not ( = ?auto_48839 ?auto_48845 ) ) ( not ( = ?auto_48839 ?auto_48844 ) ) ( not ( = ?auto_48839 ?auto_48840 ) ) ( not ( = ?auto_48843 ?auto_48845 ) ) ( not ( = ?auto_48843 ?auto_48844 ) ) ( not ( = ?auto_48843 ?auto_48840 ) ) ( not ( = ?auto_48841 ?auto_48845 ) ) ( not ( = ?auto_48841 ?auto_48844 ) ) ( not ( = ?auto_48841 ?auto_48840 ) ) ( ON ?auto_48842 ?auto_48841 ) ( CLEAR ?auto_48842 ) ( HOLDING ?auto_48845 ) ( CLEAR ?auto_48840 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48844 ?auto_48840 ?auto_48845 )
      ( MAKE-1PILE ?auto_48839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48846 - BLOCK
    )
    :vars
    (
      ?auto_48848 - BLOCK
      ?auto_48851 - BLOCK
      ?auto_48850 - BLOCK
      ?auto_48849 - BLOCK
      ?auto_48847 - BLOCK
      ?auto_48852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48848 ?auto_48846 ) ( ON-TABLE ?auto_48846 ) ( not ( = ?auto_48846 ?auto_48848 ) ) ( not ( = ?auto_48846 ?auto_48851 ) ) ( not ( = ?auto_48846 ?auto_48850 ) ) ( not ( = ?auto_48848 ?auto_48851 ) ) ( not ( = ?auto_48848 ?auto_48850 ) ) ( not ( = ?auto_48851 ?auto_48850 ) ) ( ON ?auto_48851 ?auto_48848 ) ( ON-TABLE ?auto_48849 ) ( ON ?auto_48847 ?auto_48849 ) ( not ( = ?auto_48849 ?auto_48847 ) ) ( not ( = ?auto_48849 ?auto_48852 ) ) ( not ( = ?auto_48849 ?auto_48850 ) ) ( not ( = ?auto_48847 ?auto_48852 ) ) ( not ( = ?auto_48847 ?auto_48850 ) ) ( not ( = ?auto_48852 ?auto_48850 ) ) ( not ( = ?auto_48846 ?auto_48852 ) ) ( not ( = ?auto_48846 ?auto_48849 ) ) ( not ( = ?auto_48846 ?auto_48847 ) ) ( not ( = ?auto_48848 ?auto_48852 ) ) ( not ( = ?auto_48848 ?auto_48849 ) ) ( not ( = ?auto_48848 ?auto_48847 ) ) ( not ( = ?auto_48851 ?auto_48852 ) ) ( not ( = ?auto_48851 ?auto_48849 ) ) ( not ( = ?auto_48851 ?auto_48847 ) ) ( ON ?auto_48850 ?auto_48851 ) ( CLEAR ?auto_48847 ) ( ON ?auto_48852 ?auto_48850 ) ( CLEAR ?auto_48852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48846 ?auto_48848 ?auto_48851 ?auto_48850 )
      ( MAKE-1PILE ?auto_48846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48853 - BLOCK
    )
    :vars
    (
      ?auto_48858 - BLOCK
      ?auto_48859 - BLOCK
      ?auto_48856 - BLOCK
      ?auto_48854 - BLOCK
      ?auto_48857 - BLOCK
      ?auto_48855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48858 ?auto_48853 ) ( ON-TABLE ?auto_48853 ) ( not ( = ?auto_48853 ?auto_48858 ) ) ( not ( = ?auto_48853 ?auto_48859 ) ) ( not ( = ?auto_48853 ?auto_48856 ) ) ( not ( = ?auto_48858 ?auto_48859 ) ) ( not ( = ?auto_48858 ?auto_48856 ) ) ( not ( = ?auto_48859 ?auto_48856 ) ) ( ON ?auto_48859 ?auto_48858 ) ( ON-TABLE ?auto_48854 ) ( not ( = ?auto_48854 ?auto_48857 ) ) ( not ( = ?auto_48854 ?auto_48855 ) ) ( not ( = ?auto_48854 ?auto_48856 ) ) ( not ( = ?auto_48857 ?auto_48855 ) ) ( not ( = ?auto_48857 ?auto_48856 ) ) ( not ( = ?auto_48855 ?auto_48856 ) ) ( not ( = ?auto_48853 ?auto_48855 ) ) ( not ( = ?auto_48853 ?auto_48854 ) ) ( not ( = ?auto_48853 ?auto_48857 ) ) ( not ( = ?auto_48858 ?auto_48855 ) ) ( not ( = ?auto_48858 ?auto_48854 ) ) ( not ( = ?auto_48858 ?auto_48857 ) ) ( not ( = ?auto_48859 ?auto_48855 ) ) ( not ( = ?auto_48859 ?auto_48854 ) ) ( not ( = ?auto_48859 ?auto_48857 ) ) ( ON ?auto_48856 ?auto_48859 ) ( ON ?auto_48855 ?auto_48856 ) ( CLEAR ?auto_48855 ) ( HOLDING ?auto_48857 ) ( CLEAR ?auto_48854 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48854 ?auto_48857 )
      ( MAKE-1PILE ?auto_48853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48860 - BLOCK
    )
    :vars
    (
      ?auto_48866 - BLOCK
      ?auto_48863 - BLOCK
      ?auto_48861 - BLOCK
      ?auto_48864 - BLOCK
      ?auto_48865 - BLOCK
      ?auto_48862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48866 ?auto_48860 ) ( ON-TABLE ?auto_48860 ) ( not ( = ?auto_48860 ?auto_48866 ) ) ( not ( = ?auto_48860 ?auto_48863 ) ) ( not ( = ?auto_48860 ?auto_48861 ) ) ( not ( = ?auto_48866 ?auto_48863 ) ) ( not ( = ?auto_48866 ?auto_48861 ) ) ( not ( = ?auto_48863 ?auto_48861 ) ) ( ON ?auto_48863 ?auto_48866 ) ( ON-TABLE ?auto_48864 ) ( not ( = ?auto_48864 ?auto_48865 ) ) ( not ( = ?auto_48864 ?auto_48862 ) ) ( not ( = ?auto_48864 ?auto_48861 ) ) ( not ( = ?auto_48865 ?auto_48862 ) ) ( not ( = ?auto_48865 ?auto_48861 ) ) ( not ( = ?auto_48862 ?auto_48861 ) ) ( not ( = ?auto_48860 ?auto_48862 ) ) ( not ( = ?auto_48860 ?auto_48864 ) ) ( not ( = ?auto_48860 ?auto_48865 ) ) ( not ( = ?auto_48866 ?auto_48862 ) ) ( not ( = ?auto_48866 ?auto_48864 ) ) ( not ( = ?auto_48866 ?auto_48865 ) ) ( not ( = ?auto_48863 ?auto_48862 ) ) ( not ( = ?auto_48863 ?auto_48864 ) ) ( not ( = ?auto_48863 ?auto_48865 ) ) ( ON ?auto_48861 ?auto_48863 ) ( ON ?auto_48862 ?auto_48861 ) ( CLEAR ?auto_48864 ) ( ON ?auto_48865 ?auto_48862 ) ( CLEAR ?auto_48865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48860 ?auto_48866 ?auto_48863 ?auto_48861 ?auto_48862 )
      ( MAKE-1PILE ?auto_48860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48867 - BLOCK
    )
    :vars
    (
      ?auto_48869 - BLOCK
      ?auto_48872 - BLOCK
      ?auto_48870 - BLOCK
      ?auto_48873 - BLOCK
      ?auto_48868 - BLOCK
      ?auto_48871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48869 ?auto_48867 ) ( ON-TABLE ?auto_48867 ) ( not ( = ?auto_48867 ?auto_48869 ) ) ( not ( = ?auto_48867 ?auto_48872 ) ) ( not ( = ?auto_48867 ?auto_48870 ) ) ( not ( = ?auto_48869 ?auto_48872 ) ) ( not ( = ?auto_48869 ?auto_48870 ) ) ( not ( = ?auto_48872 ?auto_48870 ) ) ( ON ?auto_48872 ?auto_48869 ) ( not ( = ?auto_48873 ?auto_48868 ) ) ( not ( = ?auto_48873 ?auto_48871 ) ) ( not ( = ?auto_48873 ?auto_48870 ) ) ( not ( = ?auto_48868 ?auto_48871 ) ) ( not ( = ?auto_48868 ?auto_48870 ) ) ( not ( = ?auto_48871 ?auto_48870 ) ) ( not ( = ?auto_48867 ?auto_48871 ) ) ( not ( = ?auto_48867 ?auto_48873 ) ) ( not ( = ?auto_48867 ?auto_48868 ) ) ( not ( = ?auto_48869 ?auto_48871 ) ) ( not ( = ?auto_48869 ?auto_48873 ) ) ( not ( = ?auto_48869 ?auto_48868 ) ) ( not ( = ?auto_48872 ?auto_48871 ) ) ( not ( = ?auto_48872 ?auto_48873 ) ) ( not ( = ?auto_48872 ?auto_48868 ) ) ( ON ?auto_48870 ?auto_48872 ) ( ON ?auto_48871 ?auto_48870 ) ( ON ?auto_48868 ?auto_48871 ) ( CLEAR ?auto_48868 ) ( HOLDING ?auto_48873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48873 )
      ( MAKE-1PILE ?auto_48867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48874 - BLOCK
    )
    :vars
    (
      ?auto_48876 - BLOCK
      ?auto_48877 - BLOCK
      ?auto_48879 - BLOCK
      ?auto_48878 - BLOCK
      ?auto_48880 - BLOCK
      ?auto_48875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48876 ?auto_48874 ) ( ON-TABLE ?auto_48874 ) ( not ( = ?auto_48874 ?auto_48876 ) ) ( not ( = ?auto_48874 ?auto_48877 ) ) ( not ( = ?auto_48874 ?auto_48879 ) ) ( not ( = ?auto_48876 ?auto_48877 ) ) ( not ( = ?auto_48876 ?auto_48879 ) ) ( not ( = ?auto_48877 ?auto_48879 ) ) ( ON ?auto_48877 ?auto_48876 ) ( not ( = ?auto_48878 ?auto_48880 ) ) ( not ( = ?auto_48878 ?auto_48875 ) ) ( not ( = ?auto_48878 ?auto_48879 ) ) ( not ( = ?auto_48880 ?auto_48875 ) ) ( not ( = ?auto_48880 ?auto_48879 ) ) ( not ( = ?auto_48875 ?auto_48879 ) ) ( not ( = ?auto_48874 ?auto_48875 ) ) ( not ( = ?auto_48874 ?auto_48878 ) ) ( not ( = ?auto_48874 ?auto_48880 ) ) ( not ( = ?auto_48876 ?auto_48875 ) ) ( not ( = ?auto_48876 ?auto_48878 ) ) ( not ( = ?auto_48876 ?auto_48880 ) ) ( not ( = ?auto_48877 ?auto_48875 ) ) ( not ( = ?auto_48877 ?auto_48878 ) ) ( not ( = ?auto_48877 ?auto_48880 ) ) ( ON ?auto_48879 ?auto_48877 ) ( ON ?auto_48875 ?auto_48879 ) ( ON ?auto_48880 ?auto_48875 ) ( ON ?auto_48878 ?auto_48880 ) ( CLEAR ?auto_48878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48874 ?auto_48876 ?auto_48877 ?auto_48879 ?auto_48875 ?auto_48880 )
      ( MAKE-1PILE ?auto_48874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48887 - BLOCK
      ?auto_48888 - BLOCK
      ?auto_48889 - BLOCK
      ?auto_48890 - BLOCK
      ?auto_48891 - BLOCK
      ?auto_48892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48892 ) ( CLEAR ?auto_48891 ) ( ON-TABLE ?auto_48887 ) ( ON ?auto_48888 ?auto_48887 ) ( ON ?auto_48889 ?auto_48888 ) ( ON ?auto_48890 ?auto_48889 ) ( ON ?auto_48891 ?auto_48890 ) ( not ( = ?auto_48887 ?auto_48888 ) ) ( not ( = ?auto_48887 ?auto_48889 ) ) ( not ( = ?auto_48887 ?auto_48890 ) ) ( not ( = ?auto_48887 ?auto_48891 ) ) ( not ( = ?auto_48887 ?auto_48892 ) ) ( not ( = ?auto_48888 ?auto_48889 ) ) ( not ( = ?auto_48888 ?auto_48890 ) ) ( not ( = ?auto_48888 ?auto_48891 ) ) ( not ( = ?auto_48888 ?auto_48892 ) ) ( not ( = ?auto_48889 ?auto_48890 ) ) ( not ( = ?auto_48889 ?auto_48891 ) ) ( not ( = ?auto_48889 ?auto_48892 ) ) ( not ( = ?auto_48890 ?auto_48891 ) ) ( not ( = ?auto_48890 ?auto_48892 ) ) ( not ( = ?auto_48891 ?auto_48892 ) ) )
    :subtasks
    ( ( !STACK ?auto_48892 ?auto_48891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48893 - BLOCK
      ?auto_48894 - BLOCK
      ?auto_48895 - BLOCK
      ?auto_48896 - BLOCK
      ?auto_48897 - BLOCK
      ?auto_48898 - BLOCK
    )
    :vars
    (
      ?auto_48899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48897 ) ( ON-TABLE ?auto_48893 ) ( ON ?auto_48894 ?auto_48893 ) ( ON ?auto_48895 ?auto_48894 ) ( ON ?auto_48896 ?auto_48895 ) ( ON ?auto_48897 ?auto_48896 ) ( not ( = ?auto_48893 ?auto_48894 ) ) ( not ( = ?auto_48893 ?auto_48895 ) ) ( not ( = ?auto_48893 ?auto_48896 ) ) ( not ( = ?auto_48893 ?auto_48897 ) ) ( not ( = ?auto_48893 ?auto_48898 ) ) ( not ( = ?auto_48894 ?auto_48895 ) ) ( not ( = ?auto_48894 ?auto_48896 ) ) ( not ( = ?auto_48894 ?auto_48897 ) ) ( not ( = ?auto_48894 ?auto_48898 ) ) ( not ( = ?auto_48895 ?auto_48896 ) ) ( not ( = ?auto_48895 ?auto_48897 ) ) ( not ( = ?auto_48895 ?auto_48898 ) ) ( not ( = ?auto_48896 ?auto_48897 ) ) ( not ( = ?auto_48896 ?auto_48898 ) ) ( not ( = ?auto_48897 ?auto_48898 ) ) ( ON ?auto_48898 ?auto_48899 ) ( CLEAR ?auto_48898 ) ( HAND-EMPTY ) ( not ( = ?auto_48893 ?auto_48899 ) ) ( not ( = ?auto_48894 ?auto_48899 ) ) ( not ( = ?auto_48895 ?auto_48899 ) ) ( not ( = ?auto_48896 ?auto_48899 ) ) ( not ( = ?auto_48897 ?auto_48899 ) ) ( not ( = ?auto_48898 ?auto_48899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48898 ?auto_48899 )
      ( MAKE-6PILE ?auto_48893 ?auto_48894 ?auto_48895 ?auto_48896 ?auto_48897 ?auto_48898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48900 - BLOCK
      ?auto_48901 - BLOCK
      ?auto_48902 - BLOCK
      ?auto_48903 - BLOCK
      ?auto_48904 - BLOCK
      ?auto_48905 - BLOCK
    )
    :vars
    (
      ?auto_48906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48900 ) ( ON ?auto_48901 ?auto_48900 ) ( ON ?auto_48902 ?auto_48901 ) ( ON ?auto_48903 ?auto_48902 ) ( not ( = ?auto_48900 ?auto_48901 ) ) ( not ( = ?auto_48900 ?auto_48902 ) ) ( not ( = ?auto_48900 ?auto_48903 ) ) ( not ( = ?auto_48900 ?auto_48904 ) ) ( not ( = ?auto_48900 ?auto_48905 ) ) ( not ( = ?auto_48901 ?auto_48902 ) ) ( not ( = ?auto_48901 ?auto_48903 ) ) ( not ( = ?auto_48901 ?auto_48904 ) ) ( not ( = ?auto_48901 ?auto_48905 ) ) ( not ( = ?auto_48902 ?auto_48903 ) ) ( not ( = ?auto_48902 ?auto_48904 ) ) ( not ( = ?auto_48902 ?auto_48905 ) ) ( not ( = ?auto_48903 ?auto_48904 ) ) ( not ( = ?auto_48903 ?auto_48905 ) ) ( not ( = ?auto_48904 ?auto_48905 ) ) ( ON ?auto_48905 ?auto_48906 ) ( CLEAR ?auto_48905 ) ( not ( = ?auto_48900 ?auto_48906 ) ) ( not ( = ?auto_48901 ?auto_48906 ) ) ( not ( = ?auto_48902 ?auto_48906 ) ) ( not ( = ?auto_48903 ?auto_48906 ) ) ( not ( = ?auto_48904 ?auto_48906 ) ) ( not ( = ?auto_48905 ?auto_48906 ) ) ( HOLDING ?auto_48904 ) ( CLEAR ?auto_48903 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48900 ?auto_48901 ?auto_48902 ?auto_48903 ?auto_48904 )
      ( MAKE-6PILE ?auto_48900 ?auto_48901 ?auto_48902 ?auto_48903 ?auto_48904 ?auto_48905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48907 - BLOCK
      ?auto_48908 - BLOCK
      ?auto_48909 - BLOCK
      ?auto_48910 - BLOCK
      ?auto_48911 - BLOCK
      ?auto_48912 - BLOCK
    )
    :vars
    (
      ?auto_48913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48907 ) ( ON ?auto_48908 ?auto_48907 ) ( ON ?auto_48909 ?auto_48908 ) ( ON ?auto_48910 ?auto_48909 ) ( not ( = ?auto_48907 ?auto_48908 ) ) ( not ( = ?auto_48907 ?auto_48909 ) ) ( not ( = ?auto_48907 ?auto_48910 ) ) ( not ( = ?auto_48907 ?auto_48911 ) ) ( not ( = ?auto_48907 ?auto_48912 ) ) ( not ( = ?auto_48908 ?auto_48909 ) ) ( not ( = ?auto_48908 ?auto_48910 ) ) ( not ( = ?auto_48908 ?auto_48911 ) ) ( not ( = ?auto_48908 ?auto_48912 ) ) ( not ( = ?auto_48909 ?auto_48910 ) ) ( not ( = ?auto_48909 ?auto_48911 ) ) ( not ( = ?auto_48909 ?auto_48912 ) ) ( not ( = ?auto_48910 ?auto_48911 ) ) ( not ( = ?auto_48910 ?auto_48912 ) ) ( not ( = ?auto_48911 ?auto_48912 ) ) ( ON ?auto_48912 ?auto_48913 ) ( not ( = ?auto_48907 ?auto_48913 ) ) ( not ( = ?auto_48908 ?auto_48913 ) ) ( not ( = ?auto_48909 ?auto_48913 ) ) ( not ( = ?auto_48910 ?auto_48913 ) ) ( not ( = ?auto_48911 ?auto_48913 ) ) ( not ( = ?auto_48912 ?auto_48913 ) ) ( CLEAR ?auto_48910 ) ( ON ?auto_48911 ?auto_48912 ) ( CLEAR ?auto_48911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48913 ?auto_48912 )
      ( MAKE-6PILE ?auto_48907 ?auto_48908 ?auto_48909 ?auto_48910 ?auto_48911 ?auto_48912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48914 - BLOCK
      ?auto_48915 - BLOCK
      ?auto_48916 - BLOCK
      ?auto_48917 - BLOCK
      ?auto_48918 - BLOCK
      ?auto_48919 - BLOCK
    )
    :vars
    (
      ?auto_48920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48914 ) ( ON ?auto_48915 ?auto_48914 ) ( ON ?auto_48916 ?auto_48915 ) ( not ( = ?auto_48914 ?auto_48915 ) ) ( not ( = ?auto_48914 ?auto_48916 ) ) ( not ( = ?auto_48914 ?auto_48917 ) ) ( not ( = ?auto_48914 ?auto_48918 ) ) ( not ( = ?auto_48914 ?auto_48919 ) ) ( not ( = ?auto_48915 ?auto_48916 ) ) ( not ( = ?auto_48915 ?auto_48917 ) ) ( not ( = ?auto_48915 ?auto_48918 ) ) ( not ( = ?auto_48915 ?auto_48919 ) ) ( not ( = ?auto_48916 ?auto_48917 ) ) ( not ( = ?auto_48916 ?auto_48918 ) ) ( not ( = ?auto_48916 ?auto_48919 ) ) ( not ( = ?auto_48917 ?auto_48918 ) ) ( not ( = ?auto_48917 ?auto_48919 ) ) ( not ( = ?auto_48918 ?auto_48919 ) ) ( ON ?auto_48919 ?auto_48920 ) ( not ( = ?auto_48914 ?auto_48920 ) ) ( not ( = ?auto_48915 ?auto_48920 ) ) ( not ( = ?auto_48916 ?auto_48920 ) ) ( not ( = ?auto_48917 ?auto_48920 ) ) ( not ( = ?auto_48918 ?auto_48920 ) ) ( not ( = ?auto_48919 ?auto_48920 ) ) ( ON ?auto_48918 ?auto_48919 ) ( CLEAR ?auto_48918 ) ( ON-TABLE ?auto_48920 ) ( HOLDING ?auto_48917 ) ( CLEAR ?auto_48916 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48914 ?auto_48915 ?auto_48916 ?auto_48917 )
      ( MAKE-6PILE ?auto_48914 ?auto_48915 ?auto_48916 ?auto_48917 ?auto_48918 ?auto_48919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48921 - BLOCK
      ?auto_48922 - BLOCK
      ?auto_48923 - BLOCK
      ?auto_48924 - BLOCK
      ?auto_48925 - BLOCK
      ?auto_48926 - BLOCK
    )
    :vars
    (
      ?auto_48927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48921 ) ( ON ?auto_48922 ?auto_48921 ) ( ON ?auto_48923 ?auto_48922 ) ( not ( = ?auto_48921 ?auto_48922 ) ) ( not ( = ?auto_48921 ?auto_48923 ) ) ( not ( = ?auto_48921 ?auto_48924 ) ) ( not ( = ?auto_48921 ?auto_48925 ) ) ( not ( = ?auto_48921 ?auto_48926 ) ) ( not ( = ?auto_48922 ?auto_48923 ) ) ( not ( = ?auto_48922 ?auto_48924 ) ) ( not ( = ?auto_48922 ?auto_48925 ) ) ( not ( = ?auto_48922 ?auto_48926 ) ) ( not ( = ?auto_48923 ?auto_48924 ) ) ( not ( = ?auto_48923 ?auto_48925 ) ) ( not ( = ?auto_48923 ?auto_48926 ) ) ( not ( = ?auto_48924 ?auto_48925 ) ) ( not ( = ?auto_48924 ?auto_48926 ) ) ( not ( = ?auto_48925 ?auto_48926 ) ) ( ON ?auto_48926 ?auto_48927 ) ( not ( = ?auto_48921 ?auto_48927 ) ) ( not ( = ?auto_48922 ?auto_48927 ) ) ( not ( = ?auto_48923 ?auto_48927 ) ) ( not ( = ?auto_48924 ?auto_48927 ) ) ( not ( = ?auto_48925 ?auto_48927 ) ) ( not ( = ?auto_48926 ?auto_48927 ) ) ( ON ?auto_48925 ?auto_48926 ) ( ON-TABLE ?auto_48927 ) ( CLEAR ?auto_48923 ) ( ON ?auto_48924 ?auto_48925 ) ( CLEAR ?auto_48924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48927 ?auto_48926 ?auto_48925 )
      ( MAKE-6PILE ?auto_48921 ?auto_48922 ?auto_48923 ?auto_48924 ?auto_48925 ?auto_48926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48928 - BLOCK
      ?auto_48929 - BLOCK
      ?auto_48930 - BLOCK
      ?auto_48931 - BLOCK
      ?auto_48932 - BLOCK
      ?auto_48933 - BLOCK
    )
    :vars
    (
      ?auto_48934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48928 ) ( ON ?auto_48929 ?auto_48928 ) ( not ( = ?auto_48928 ?auto_48929 ) ) ( not ( = ?auto_48928 ?auto_48930 ) ) ( not ( = ?auto_48928 ?auto_48931 ) ) ( not ( = ?auto_48928 ?auto_48932 ) ) ( not ( = ?auto_48928 ?auto_48933 ) ) ( not ( = ?auto_48929 ?auto_48930 ) ) ( not ( = ?auto_48929 ?auto_48931 ) ) ( not ( = ?auto_48929 ?auto_48932 ) ) ( not ( = ?auto_48929 ?auto_48933 ) ) ( not ( = ?auto_48930 ?auto_48931 ) ) ( not ( = ?auto_48930 ?auto_48932 ) ) ( not ( = ?auto_48930 ?auto_48933 ) ) ( not ( = ?auto_48931 ?auto_48932 ) ) ( not ( = ?auto_48931 ?auto_48933 ) ) ( not ( = ?auto_48932 ?auto_48933 ) ) ( ON ?auto_48933 ?auto_48934 ) ( not ( = ?auto_48928 ?auto_48934 ) ) ( not ( = ?auto_48929 ?auto_48934 ) ) ( not ( = ?auto_48930 ?auto_48934 ) ) ( not ( = ?auto_48931 ?auto_48934 ) ) ( not ( = ?auto_48932 ?auto_48934 ) ) ( not ( = ?auto_48933 ?auto_48934 ) ) ( ON ?auto_48932 ?auto_48933 ) ( ON-TABLE ?auto_48934 ) ( ON ?auto_48931 ?auto_48932 ) ( CLEAR ?auto_48931 ) ( HOLDING ?auto_48930 ) ( CLEAR ?auto_48929 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48928 ?auto_48929 ?auto_48930 )
      ( MAKE-6PILE ?auto_48928 ?auto_48929 ?auto_48930 ?auto_48931 ?auto_48932 ?auto_48933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48935 - BLOCK
      ?auto_48936 - BLOCK
      ?auto_48937 - BLOCK
      ?auto_48938 - BLOCK
      ?auto_48939 - BLOCK
      ?auto_48940 - BLOCK
    )
    :vars
    (
      ?auto_48941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48935 ) ( ON ?auto_48936 ?auto_48935 ) ( not ( = ?auto_48935 ?auto_48936 ) ) ( not ( = ?auto_48935 ?auto_48937 ) ) ( not ( = ?auto_48935 ?auto_48938 ) ) ( not ( = ?auto_48935 ?auto_48939 ) ) ( not ( = ?auto_48935 ?auto_48940 ) ) ( not ( = ?auto_48936 ?auto_48937 ) ) ( not ( = ?auto_48936 ?auto_48938 ) ) ( not ( = ?auto_48936 ?auto_48939 ) ) ( not ( = ?auto_48936 ?auto_48940 ) ) ( not ( = ?auto_48937 ?auto_48938 ) ) ( not ( = ?auto_48937 ?auto_48939 ) ) ( not ( = ?auto_48937 ?auto_48940 ) ) ( not ( = ?auto_48938 ?auto_48939 ) ) ( not ( = ?auto_48938 ?auto_48940 ) ) ( not ( = ?auto_48939 ?auto_48940 ) ) ( ON ?auto_48940 ?auto_48941 ) ( not ( = ?auto_48935 ?auto_48941 ) ) ( not ( = ?auto_48936 ?auto_48941 ) ) ( not ( = ?auto_48937 ?auto_48941 ) ) ( not ( = ?auto_48938 ?auto_48941 ) ) ( not ( = ?auto_48939 ?auto_48941 ) ) ( not ( = ?auto_48940 ?auto_48941 ) ) ( ON ?auto_48939 ?auto_48940 ) ( ON-TABLE ?auto_48941 ) ( ON ?auto_48938 ?auto_48939 ) ( CLEAR ?auto_48936 ) ( ON ?auto_48937 ?auto_48938 ) ( CLEAR ?auto_48937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48941 ?auto_48940 ?auto_48939 ?auto_48938 )
      ( MAKE-6PILE ?auto_48935 ?auto_48936 ?auto_48937 ?auto_48938 ?auto_48939 ?auto_48940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48942 - BLOCK
      ?auto_48943 - BLOCK
      ?auto_48944 - BLOCK
      ?auto_48945 - BLOCK
      ?auto_48946 - BLOCK
      ?auto_48947 - BLOCK
    )
    :vars
    (
      ?auto_48948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48942 ) ( not ( = ?auto_48942 ?auto_48943 ) ) ( not ( = ?auto_48942 ?auto_48944 ) ) ( not ( = ?auto_48942 ?auto_48945 ) ) ( not ( = ?auto_48942 ?auto_48946 ) ) ( not ( = ?auto_48942 ?auto_48947 ) ) ( not ( = ?auto_48943 ?auto_48944 ) ) ( not ( = ?auto_48943 ?auto_48945 ) ) ( not ( = ?auto_48943 ?auto_48946 ) ) ( not ( = ?auto_48943 ?auto_48947 ) ) ( not ( = ?auto_48944 ?auto_48945 ) ) ( not ( = ?auto_48944 ?auto_48946 ) ) ( not ( = ?auto_48944 ?auto_48947 ) ) ( not ( = ?auto_48945 ?auto_48946 ) ) ( not ( = ?auto_48945 ?auto_48947 ) ) ( not ( = ?auto_48946 ?auto_48947 ) ) ( ON ?auto_48947 ?auto_48948 ) ( not ( = ?auto_48942 ?auto_48948 ) ) ( not ( = ?auto_48943 ?auto_48948 ) ) ( not ( = ?auto_48944 ?auto_48948 ) ) ( not ( = ?auto_48945 ?auto_48948 ) ) ( not ( = ?auto_48946 ?auto_48948 ) ) ( not ( = ?auto_48947 ?auto_48948 ) ) ( ON ?auto_48946 ?auto_48947 ) ( ON-TABLE ?auto_48948 ) ( ON ?auto_48945 ?auto_48946 ) ( ON ?auto_48944 ?auto_48945 ) ( CLEAR ?auto_48944 ) ( HOLDING ?auto_48943 ) ( CLEAR ?auto_48942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48942 ?auto_48943 )
      ( MAKE-6PILE ?auto_48942 ?auto_48943 ?auto_48944 ?auto_48945 ?auto_48946 ?auto_48947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48949 - BLOCK
      ?auto_48950 - BLOCK
      ?auto_48951 - BLOCK
      ?auto_48952 - BLOCK
      ?auto_48953 - BLOCK
      ?auto_48954 - BLOCK
    )
    :vars
    (
      ?auto_48955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48949 ) ( not ( = ?auto_48949 ?auto_48950 ) ) ( not ( = ?auto_48949 ?auto_48951 ) ) ( not ( = ?auto_48949 ?auto_48952 ) ) ( not ( = ?auto_48949 ?auto_48953 ) ) ( not ( = ?auto_48949 ?auto_48954 ) ) ( not ( = ?auto_48950 ?auto_48951 ) ) ( not ( = ?auto_48950 ?auto_48952 ) ) ( not ( = ?auto_48950 ?auto_48953 ) ) ( not ( = ?auto_48950 ?auto_48954 ) ) ( not ( = ?auto_48951 ?auto_48952 ) ) ( not ( = ?auto_48951 ?auto_48953 ) ) ( not ( = ?auto_48951 ?auto_48954 ) ) ( not ( = ?auto_48952 ?auto_48953 ) ) ( not ( = ?auto_48952 ?auto_48954 ) ) ( not ( = ?auto_48953 ?auto_48954 ) ) ( ON ?auto_48954 ?auto_48955 ) ( not ( = ?auto_48949 ?auto_48955 ) ) ( not ( = ?auto_48950 ?auto_48955 ) ) ( not ( = ?auto_48951 ?auto_48955 ) ) ( not ( = ?auto_48952 ?auto_48955 ) ) ( not ( = ?auto_48953 ?auto_48955 ) ) ( not ( = ?auto_48954 ?auto_48955 ) ) ( ON ?auto_48953 ?auto_48954 ) ( ON-TABLE ?auto_48955 ) ( ON ?auto_48952 ?auto_48953 ) ( ON ?auto_48951 ?auto_48952 ) ( CLEAR ?auto_48949 ) ( ON ?auto_48950 ?auto_48951 ) ( CLEAR ?auto_48950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48955 ?auto_48954 ?auto_48953 ?auto_48952 ?auto_48951 )
      ( MAKE-6PILE ?auto_48949 ?auto_48950 ?auto_48951 ?auto_48952 ?auto_48953 ?auto_48954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48956 - BLOCK
      ?auto_48957 - BLOCK
      ?auto_48958 - BLOCK
      ?auto_48959 - BLOCK
      ?auto_48960 - BLOCK
      ?auto_48961 - BLOCK
    )
    :vars
    (
      ?auto_48962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48956 ?auto_48957 ) ) ( not ( = ?auto_48956 ?auto_48958 ) ) ( not ( = ?auto_48956 ?auto_48959 ) ) ( not ( = ?auto_48956 ?auto_48960 ) ) ( not ( = ?auto_48956 ?auto_48961 ) ) ( not ( = ?auto_48957 ?auto_48958 ) ) ( not ( = ?auto_48957 ?auto_48959 ) ) ( not ( = ?auto_48957 ?auto_48960 ) ) ( not ( = ?auto_48957 ?auto_48961 ) ) ( not ( = ?auto_48958 ?auto_48959 ) ) ( not ( = ?auto_48958 ?auto_48960 ) ) ( not ( = ?auto_48958 ?auto_48961 ) ) ( not ( = ?auto_48959 ?auto_48960 ) ) ( not ( = ?auto_48959 ?auto_48961 ) ) ( not ( = ?auto_48960 ?auto_48961 ) ) ( ON ?auto_48961 ?auto_48962 ) ( not ( = ?auto_48956 ?auto_48962 ) ) ( not ( = ?auto_48957 ?auto_48962 ) ) ( not ( = ?auto_48958 ?auto_48962 ) ) ( not ( = ?auto_48959 ?auto_48962 ) ) ( not ( = ?auto_48960 ?auto_48962 ) ) ( not ( = ?auto_48961 ?auto_48962 ) ) ( ON ?auto_48960 ?auto_48961 ) ( ON-TABLE ?auto_48962 ) ( ON ?auto_48959 ?auto_48960 ) ( ON ?auto_48958 ?auto_48959 ) ( ON ?auto_48957 ?auto_48958 ) ( CLEAR ?auto_48957 ) ( HOLDING ?auto_48956 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48956 )
      ( MAKE-6PILE ?auto_48956 ?auto_48957 ?auto_48958 ?auto_48959 ?auto_48960 ?auto_48961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48963 - BLOCK
      ?auto_48964 - BLOCK
      ?auto_48965 - BLOCK
      ?auto_48966 - BLOCK
      ?auto_48967 - BLOCK
      ?auto_48968 - BLOCK
    )
    :vars
    (
      ?auto_48969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48963 ?auto_48964 ) ) ( not ( = ?auto_48963 ?auto_48965 ) ) ( not ( = ?auto_48963 ?auto_48966 ) ) ( not ( = ?auto_48963 ?auto_48967 ) ) ( not ( = ?auto_48963 ?auto_48968 ) ) ( not ( = ?auto_48964 ?auto_48965 ) ) ( not ( = ?auto_48964 ?auto_48966 ) ) ( not ( = ?auto_48964 ?auto_48967 ) ) ( not ( = ?auto_48964 ?auto_48968 ) ) ( not ( = ?auto_48965 ?auto_48966 ) ) ( not ( = ?auto_48965 ?auto_48967 ) ) ( not ( = ?auto_48965 ?auto_48968 ) ) ( not ( = ?auto_48966 ?auto_48967 ) ) ( not ( = ?auto_48966 ?auto_48968 ) ) ( not ( = ?auto_48967 ?auto_48968 ) ) ( ON ?auto_48968 ?auto_48969 ) ( not ( = ?auto_48963 ?auto_48969 ) ) ( not ( = ?auto_48964 ?auto_48969 ) ) ( not ( = ?auto_48965 ?auto_48969 ) ) ( not ( = ?auto_48966 ?auto_48969 ) ) ( not ( = ?auto_48967 ?auto_48969 ) ) ( not ( = ?auto_48968 ?auto_48969 ) ) ( ON ?auto_48967 ?auto_48968 ) ( ON-TABLE ?auto_48969 ) ( ON ?auto_48966 ?auto_48967 ) ( ON ?auto_48965 ?auto_48966 ) ( ON ?auto_48964 ?auto_48965 ) ( ON ?auto_48963 ?auto_48964 ) ( CLEAR ?auto_48963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48969 ?auto_48968 ?auto_48967 ?auto_48966 ?auto_48965 ?auto_48964 )
      ( MAKE-6PILE ?auto_48963 ?auto_48964 ?auto_48965 ?auto_48966 ?auto_48967 ?auto_48968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48975 - BLOCK
      ?auto_48976 - BLOCK
      ?auto_48977 - BLOCK
      ?auto_48978 - BLOCK
      ?auto_48979 - BLOCK
    )
    :vars
    (
      ?auto_48980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48980 ?auto_48979 ) ( CLEAR ?auto_48980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48975 ) ( ON ?auto_48976 ?auto_48975 ) ( ON ?auto_48977 ?auto_48976 ) ( ON ?auto_48978 ?auto_48977 ) ( ON ?auto_48979 ?auto_48978 ) ( not ( = ?auto_48975 ?auto_48976 ) ) ( not ( = ?auto_48975 ?auto_48977 ) ) ( not ( = ?auto_48975 ?auto_48978 ) ) ( not ( = ?auto_48975 ?auto_48979 ) ) ( not ( = ?auto_48975 ?auto_48980 ) ) ( not ( = ?auto_48976 ?auto_48977 ) ) ( not ( = ?auto_48976 ?auto_48978 ) ) ( not ( = ?auto_48976 ?auto_48979 ) ) ( not ( = ?auto_48976 ?auto_48980 ) ) ( not ( = ?auto_48977 ?auto_48978 ) ) ( not ( = ?auto_48977 ?auto_48979 ) ) ( not ( = ?auto_48977 ?auto_48980 ) ) ( not ( = ?auto_48978 ?auto_48979 ) ) ( not ( = ?auto_48978 ?auto_48980 ) ) ( not ( = ?auto_48979 ?auto_48980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48980 ?auto_48979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48994 - BLOCK
      ?auto_48995 - BLOCK
      ?auto_48996 - BLOCK
      ?auto_48997 - BLOCK
      ?auto_48998 - BLOCK
    )
    :vars
    (
      ?auto_48999 - BLOCK
      ?auto_49000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48994 ) ( ON ?auto_48995 ?auto_48994 ) ( ON ?auto_48996 ?auto_48995 ) ( ON ?auto_48997 ?auto_48996 ) ( not ( = ?auto_48994 ?auto_48995 ) ) ( not ( = ?auto_48994 ?auto_48996 ) ) ( not ( = ?auto_48994 ?auto_48997 ) ) ( not ( = ?auto_48994 ?auto_48998 ) ) ( not ( = ?auto_48994 ?auto_48999 ) ) ( not ( = ?auto_48995 ?auto_48996 ) ) ( not ( = ?auto_48995 ?auto_48997 ) ) ( not ( = ?auto_48995 ?auto_48998 ) ) ( not ( = ?auto_48995 ?auto_48999 ) ) ( not ( = ?auto_48996 ?auto_48997 ) ) ( not ( = ?auto_48996 ?auto_48998 ) ) ( not ( = ?auto_48996 ?auto_48999 ) ) ( not ( = ?auto_48997 ?auto_48998 ) ) ( not ( = ?auto_48997 ?auto_48999 ) ) ( not ( = ?auto_48998 ?auto_48999 ) ) ( ON ?auto_48999 ?auto_49000 ) ( CLEAR ?auto_48999 ) ( not ( = ?auto_48994 ?auto_49000 ) ) ( not ( = ?auto_48995 ?auto_49000 ) ) ( not ( = ?auto_48996 ?auto_49000 ) ) ( not ( = ?auto_48997 ?auto_49000 ) ) ( not ( = ?auto_48998 ?auto_49000 ) ) ( not ( = ?auto_48999 ?auto_49000 ) ) ( HOLDING ?auto_48998 ) ( CLEAR ?auto_48997 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48994 ?auto_48995 ?auto_48996 ?auto_48997 ?auto_48998 ?auto_48999 )
      ( MAKE-5PILE ?auto_48994 ?auto_48995 ?auto_48996 ?auto_48997 ?auto_48998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49001 - BLOCK
      ?auto_49002 - BLOCK
      ?auto_49003 - BLOCK
      ?auto_49004 - BLOCK
      ?auto_49005 - BLOCK
    )
    :vars
    (
      ?auto_49007 - BLOCK
      ?auto_49006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49001 ) ( ON ?auto_49002 ?auto_49001 ) ( ON ?auto_49003 ?auto_49002 ) ( ON ?auto_49004 ?auto_49003 ) ( not ( = ?auto_49001 ?auto_49002 ) ) ( not ( = ?auto_49001 ?auto_49003 ) ) ( not ( = ?auto_49001 ?auto_49004 ) ) ( not ( = ?auto_49001 ?auto_49005 ) ) ( not ( = ?auto_49001 ?auto_49007 ) ) ( not ( = ?auto_49002 ?auto_49003 ) ) ( not ( = ?auto_49002 ?auto_49004 ) ) ( not ( = ?auto_49002 ?auto_49005 ) ) ( not ( = ?auto_49002 ?auto_49007 ) ) ( not ( = ?auto_49003 ?auto_49004 ) ) ( not ( = ?auto_49003 ?auto_49005 ) ) ( not ( = ?auto_49003 ?auto_49007 ) ) ( not ( = ?auto_49004 ?auto_49005 ) ) ( not ( = ?auto_49004 ?auto_49007 ) ) ( not ( = ?auto_49005 ?auto_49007 ) ) ( ON ?auto_49007 ?auto_49006 ) ( not ( = ?auto_49001 ?auto_49006 ) ) ( not ( = ?auto_49002 ?auto_49006 ) ) ( not ( = ?auto_49003 ?auto_49006 ) ) ( not ( = ?auto_49004 ?auto_49006 ) ) ( not ( = ?auto_49005 ?auto_49006 ) ) ( not ( = ?auto_49007 ?auto_49006 ) ) ( CLEAR ?auto_49004 ) ( ON ?auto_49005 ?auto_49007 ) ( CLEAR ?auto_49005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49006 ?auto_49007 )
      ( MAKE-5PILE ?auto_49001 ?auto_49002 ?auto_49003 ?auto_49004 ?auto_49005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49008 - BLOCK
      ?auto_49009 - BLOCK
      ?auto_49010 - BLOCK
      ?auto_49011 - BLOCK
      ?auto_49012 - BLOCK
    )
    :vars
    (
      ?auto_49013 - BLOCK
      ?auto_49014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49008 ) ( ON ?auto_49009 ?auto_49008 ) ( ON ?auto_49010 ?auto_49009 ) ( not ( = ?auto_49008 ?auto_49009 ) ) ( not ( = ?auto_49008 ?auto_49010 ) ) ( not ( = ?auto_49008 ?auto_49011 ) ) ( not ( = ?auto_49008 ?auto_49012 ) ) ( not ( = ?auto_49008 ?auto_49013 ) ) ( not ( = ?auto_49009 ?auto_49010 ) ) ( not ( = ?auto_49009 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_49012 ) ) ( not ( = ?auto_49009 ?auto_49013 ) ) ( not ( = ?auto_49010 ?auto_49011 ) ) ( not ( = ?auto_49010 ?auto_49012 ) ) ( not ( = ?auto_49010 ?auto_49013 ) ) ( not ( = ?auto_49011 ?auto_49012 ) ) ( not ( = ?auto_49011 ?auto_49013 ) ) ( not ( = ?auto_49012 ?auto_49013 ) ) ( ON ?auto_49013 ?auto_49014 ) ( not ( = ?auto_49008 ?auto_49014 ) ) ( not ( = ?auto_49009 ?auto_49014 ) ) ( not ( = ?auto_49010 ?auto_49014 ) ) ( not ( = ?auto_49011 ?auto_49014 ) ) ( not ( = ?auto_49012 ?auto_49014 ) ) ( not ( = ?auto_49013 ?auto_49014 ) ) ( ON ?auto_49012 ?auto_49013 ) ( CLEAR ?auto_49012 ) ( ON-TABLE ?auto_49014 ) ( HOLDING ?auto_49011 ) ( CLEAR ?auto_49010 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49008 ?auto_49009 ?auto_49010 ?auto_49011 )
      ( MAKE-5PILE ?auto_49008 ?auto_49009 ?auto_49010 ?auto_49011 ?auto_49012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49015 - BLOCK
      ?auto_49016 - BLOCK
      ?auto_49017 - BLOCK
      ?auto_49018 - BLOCK
      ?auto_49019 - BLOCK
    )
    :vars
    (
      ?auto_49021 - BLOCK
      ?auto_49020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49015 ) ( ON ?auto_49016 ?auto_49015 ) ( ON ?auto_49017 ?auto_49016 ) ( not ( = ?auto_49015 ?auto_49016 ) ) ( not ( = ?auto_49015 ?auto_49017 ) ) ( not ( = ?auto_49015 ?auto_49018 ) ) ( not ( = ?auto_49015 ?auto_49019 ) ) ( not ( = ?auto_49015 ?auto_49021 ) ) ( not ( = ?auto_49016 ?auto_49017 ) ) ( not ( = ?auto_49016 ?auto_49018 ) ) ( not ( = ?auto_49016 ?auto_49019 ) ) ( not ( = ?auto_49016 ?auto_49021 ) ) ( not ( = ?auto_49017 ?auto_49018 ) ) ( not ( = ?auto_49017 ?auto_49019 ) ) ( not ( = ?auto_49017 ?auto_49021 ) ) ( not ( = ?auto_49018 ?auto_49019 ) ) ( not ( = ?auto_49018 ?auto_49021 ) ) ( not ( = ?auto_49019 ?auto_49021 ) ) ( ON ?auto_49021 ?auto_49020 ) ( not ( = ?auto_49015 ?auto_49020 ) ) ( not ( = ?auto_49016 ?auto_49020 ) ) ( not ( = ?auto_49017 ?auto_49020 ) ) ( not ( = ?auto_49018 ?auto_49020 ) ) ( not ( = ?auto_49019 ?auto_49020 ) ) ( not ( = ?auto_49021 ?auto_49020 ) ) ( ON ?auto_49019 ?auto_49021 ) ( ON-TABLE ?auto_49020 ) ( CLEAR ?auto_49017 ) ( ON ?auto_49018 ?auto_49019 ) ( CLEAR ?auto_49018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49020 ?auto_49021 ?auto_49019 )
      ( MAKE-5PILE ?auto_49015 ?auto_49016 ?auto_49017 ?auto_49018 ?auto_49019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49022 - BLOCK
      ?auto_49023 - BLOCK
      ?auto_49024 - BLOCK
      ?auto_49025 - BLOCK
      ?auto_49026 - BLOCK
    )
    :vars
    (
      ?auto_49028 - BLOCK
      ?auto_49027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49022 ) ( ON ?auto_49023 ?auto_49022 ) ( not ( = ?auto_49022 ?auto_49023 ) ) ( not ( = ?auto_49022 ?auto_49024 ) ) ( not ( = ?auto_49022 ?auto_49025 ) ) ( not ( = ?auto_49022 ?auto_49026 ) ) ( not ( = ?auto_49022 ?auto_49028 ) ) ( not ( = ?auto_49023 ?auto_49024 ) ) ( not ( = ?auto_49023 ?auto_49025 ) ) ( not ( = ?auto_49023 ?auto_49026 ) ) ( not ( = ?auto_49023 ?auto_49028 ) ) ( not ( = ?auto_49024 ?auto_49025 ) ) ( not ( = ?auto_49024 ?auto_49026 ) ) ( not ( = ?auto_49024 ?auto_49028 ) ) ( not ( = ?auto_49025 ?auto_49026 ) ) ( not ( = ?auto_49025 ?auto_49028 ) ) ( not ( = ?auto_49026 ?auto_49028 ) ) ( ON ?auto_49028 ?auto_49027 ) ( not ( = ?auto_49022 ?auto_49027 ) ) ( not ( = ?auto_49023 ?auto_49027 ) ) ( not ( = ?auto_49024 ?auto_49027 ) ) ( not ( = ?auto_49025 ?auto_49027 ) ) ( not ( = ?auto_49026 ?auto_49027 ) ) ( not ( = ?auto_49028 ?auto_49027 ) ) ( ON ?auto_49026 ?auto_49028 ) ( ON-TABLE ?auto_49027 ) ( ON ?auto_49025 ?auto_49026 ) ( CLEAR ?auto_49025 ) ( HOLDING ?auto_49024 ) ( CLEAR ?auto_49023 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49022 ?auto_49023 ?auto_49024 )
      ( MAKE-5PILE ?auto_49022 ?auto_49023 ?auto_49024 ?auto_49025 ?auto_49026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49029 - BLOCK
      ?auto_49030 - BLOCK
      ?auto_49031 - BLOCK
      ?auto_49032 - BLOCK
      ?auto_49033 - BLOCK
    )
    :vars
    (
      ?auto_49035 - BLOCK
      ?auto_49034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49029 ) ( ON ?auto_49030 ?auto_49029 ) ( not ( = ?auto_49029 ?auto_49030 ) ) ( not ( = ?auto_49029 ?auto_49031 ) ) ( not ( = ?auto_49029 ?auto_49032 ) ) ( not ( = ?auto_49029 ?auto_49033 ) ) ( not ( = ?auto_49029 ?auto_49035 ) ) ( not ( = ?auto_49030 ?auto_49031 ) ) ( not ( = ?auto_49030 ?auto_49032 ) ) ( not ( = ?auto_49030 ?auto_49033 ) ) ( not ( = ?auto_49030 ?auto_49035 ) ) ( not ( = ?auto_49031 ?auto_49032 ) ) ( not ( = ?auto_49031 ?auto_49033 ) ) ( not ( = ?auto_49031 ?auto_49035 ) ) ( not ( = ?auto_49032 ?auto_49033 ) ) ( not ( = ?auto_49032 ?auto_49035 ) ) ( not ( = ?auto_49033 ?auto_49035 ) ) ( ON ?auto_49035 ?auto_49034 ) ( not ( = ?auto_49029 ?auto_49034 ) ) ( not ( = ?auto_49030 ?auto_49034 ) ) ( not ( = ?auto_49031 ?auto_49034 ) ) ( not ( = ?auto_49032 ?auto_49034 ) ) ( not ( = ?auto_49033 ?auto_49034 ) ) ( not ( = ?auto_49035 ?auto_49034 ) ) ( ON ?auto_49033 ?auto_49035 ) ( ON-TABLE ?auto_49034 ) ( ON ?auto_49032 ?auto_49033 ) ( CLEAR ?auto_49030 ) ( ON ?auto_49031 ?auto_49032 ) ( CLEAR ?auto_49031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49034 ?auto_49035 ?auto_49033 ?auto_49032 )
      ( MAKE-5PILE ?auto_49029 ?auto_49030 ?auto_49031 ?auto_49032 ?auto_49033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49036 - BLOCK
      ?auto_49037 - BLOCK
      ?auto_49038 - BLOCK
      ?auto_49039 - BLOCK
      ?auto_49040 - BLOCK
    )
    :vars
    (
      ?auto_49041 - BLOCK
      ?auto_49042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49036 ) ( not ( = ?auto_49036 ?auto_49037 ) ) ( not ( = ?auto_49036 ?auto_49038 ) ) ( not ( = ?auto_49036 ?auto_49039 ) ) ( not ( = ?auto_49036 ?auto_49040 ) ) ( not ( = ?auto_49036 ?auto_49041 ) ) ( not ( = ?auto_49037 ?auto_49038 ) ) ( not ( = ?auto_49037 ?auto_49039 ) ) ( not ( = ?auto_49037 ?auto_49040 ) ) ( not ( = ?auto_49037 ?auto_49041 ) ) ( not ( = ?auto_49038 ?auto_49039 ) ) ( not ( = ?auto_49038 ?auto_49040 ) ) ( not ( = ?auto_49038 ?auto_49041 ) ) ( not ( = ?auto_49039 ?auto_49040 ) ) ( not ( = ?auto_49039 ?auto_49041 ) ) ( not ( = ?auto_49040 ?auto_49041 ) ) ( ON ?auto_49041 ?auto_49042 ) ( not ( = ?auto_49036 ?auto_49042 ) ) ( not ( = ?auto_49037 ?auto_49042 ) ) ( not ( = ?auto_49038 ?auto_49042 ) ) ( not ( = ?auto_49039 ?auto_49042 ) ) ( not ( = ?auto_49040 ?auto_49042 ) ) ( not ( = ?auto_49041 ?auto_49042 ) ) ( ON ?auto_49040 ?auto_49041 ) ( ON-TABLE ?auto_49042 ) ( ON ?auto_49039 ?auto_49040 ) ( ON ?auto_49038 ?auto_49039 ) ( CLEAR ?auto_49038 ) ( HOLDING ?auto_49037 ) ( CLEAR ?auto_49036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49036 ?auto_49037 )
      ( MAKE-5PILE ?auto_49036 ?auto_49037 ?auto_49038 ?auto_49039 ?auto_49040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49043 - BLOCK
      ?auto_49044 - BLOCK
      ?auto_49045 - BLOCK
      ?auto_49046 - BLOCK
      ?auto_49047 - BLOCK
    )
    :vars
    (
      ?auto_49048 - BLOCK
      ?auto_49049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49043 ) ( not ( = ?auto_49043 ?auto_49044 ) ) ( not ( = ?auto_49043 ?auto_49045 ) ) ( not ( = ?auto_49043 ?auto_49046 ) ) ( not ( = ?auto_49043 ?auto_49047 ) ) ( not ( = ?auto_49043 ?auto_49048 ) ) ( not ( = ?auto_49044 ?auto_49045 ) ) ( not ( = ?auto_49044 ?auto_49046 ) ) ( not ( = ?auto_49044 ?auto_49047 ) ) ( not ( = ?auto_49044 ?auto_49048 ) ) ( not ( = ?auto_49045 ?auto_49046 ) ) ( not ( = ?auto_49045 ?auto_49047 ) ) ( not ( = ?auto_49045 ?auto_49048 ) ) ( not ( = ?auto_49046 ?auto_49047 ) ) ( not ( = ?auto_49046 ?auto_49048 ) ) ( not ( = ?auto_49047 ?auto_49048 ) ) ( ON ?auto_49048 ?auto_49049 ) ( not ( = ?auto_49043 ?auto_49049 ) ) ( not ( = ?auto_49044 ?auto_49049 ) ) ( not ( = ?auto_49045 ?auto_49049 ) ) ( not ( = ?auto_49046 ?auto_49049 ) ) ( not ( = ?auto_49047 ?auto_49049 ) ) ( not ( = ?auto_49048 ?auto_49049 ) ) ( ON ?auto_49047 ?auto_49048 ) ( ON-TABLE ?auto_49049 ) ( ON ?auto_49046 ?auto_49047 ) ( ON ?auto_49045 ?auto_49046 ) ( CLEAR ?auto_49043 ) ( ON ?auto_49044 ?auto_49045 ) ( CLEAR ?auto_49044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49049 ?auto_49048 ?auto_49047 ?auto_49046 ?auto_49045 )
      ( MAKE-5PILE ?auto_49043 ?auto_49044 ?auto_49045 ?auto_49046 ?auto_49047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49050 - BLOCK
      ?auto_49051 - BLOCK
      ?auto_49052 - BLOCK
      ?auto_49053 - BLOCK
      ?auto_49054 - BLOCK
    )
    :vars
    (
      ?auto_49055 - BLOCK
      ?auto_49056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49050 ?auto_49051 ) ) ( not ( = ?auto_49050 ?auto_49052 ) ) ( not ( = ?auto_49050 ?auto_49053 ) ) ( not ( = ?auto_49050 ?auto_49054 ) ) ( not ( = ?auto_49050 ?auto_49055 ) ) ( not ( = ?auto_49051 ?auto_49052 ) ) ( not ( = ?auto_49051 ?auto_49053 ) ) ( not ( = ?auto_49051 ?auto_49054 ) ) ( not ( = ?auto_49051 ?auto_49055 ) ) ( not ( = ?auto_49052 ?auto_49053 ) ) ( not ( = ?auto_49052 ?auto_49054 ) ) ( not ( = ?auto_49052 ?auto_49055 ) ) ( not ( = ?auto_49053 ?auto_49054 ) ) ( not ( = ?auto_49053 ?auto_49055 ) ) ( not ( = ?auto_49054 ?auto_49055 ) ) ( ON ?auto_49055 ?auto_49056 ) ( not ( = ?auto_49050 ?auto_49056 ) ) ( not ( = ?auto_49051 ?auto_49056 ) ) ( not ( = ?auto_49052 ?auto_49056 ) ) ( not ( = ?auto_49053 ?auto_49056 ) ) ( not ( = ?auto_49054 ?auto_49056 ) ) ( not ( = ?auto_49055 ?auto_49056 ) ) ( ON ?auto_49054 ?auto_49055 ) ( ON-TABLE ?auto_49056 ) ( ON ?auto_49053 ?auto_49054 ) ( ON ?auto_49052 ?auto_49053 ) ( ON ?auto_49051 ?auto_49052 ) ( CLEAR ?auto_49051 ) ( HOLDING ?auto_49050 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49050 )
      ( MAKE-5PILE ?auto_49050 ?auto_49051 ?auto_49052 ?auto_49053 ?auto_49054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49057 - BLOCK
      ?auto_49058 - BLOCK
      ?auto_49059 - BLOCK
      ?auto_49060 - BLOCK
      ?auto_49061 - BLOCK
    )
    :vars
    (
      ?auto_49062 - BLOCK
      ?auto_49063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49057 ?auto_49058 ) ) ( not ( = ?auto_49057 ?auto_49059 ) ) ( not ( = ?auto_49057 ?auto_49060 ) ) ( not ( = ?auto_49057 ?auto_49061 ) ) ( not ( = ?auto_49057 ?auto_49062 ) ) ( not ( = ?auto_49058 ?auto_49059 ) ) ( not ( = ?auto_49058 ?auto_49060 ) ) ( not ( = ?auto_49058 ?auto_49061 ) ) ( not ( = ?auto_49058 ?auto_49062 ) ) ( not ( = ?auto_49059 ?auto_49060 ) ) ( not ( = ?auto_49059 ?auto_49061 ) ) ( not ( = ?auto_49059 ?auto_49062 ) ) ( not ( = ?auto_49060 ?auto_49061 ) ) ( not ( = ?auto_49060 ?auto_49062 ) ) ( not ( = ?auto_49061 ?auto_49062 ) ) ( ON ?auto_49062 ?auto_49063 ) ( not ( = ?auto_49057 ?auto_49063 ) ) ( not ( = ?auto_49058 ?auto_49063 ) ) ( not ( = ?auto_49059 ?auto_49063 ) ) ( not ( = ?auto_49060 ?auto_49063 ) ) ( not ( = ?auto_49061 ?auto_49063 ) ) ( not ( = ?auto_49062 ?auto_49063 ) ) ( ON ?auto_49061 ?auto_49062 ) ( ON-TABLE ?auto_49063 ) ( ON ?auto_49060 ?auto_49061 ) ( ON ?auto_49059 ?auto_49060 ) ( ON ?auto_49058 ?auto_49059 ) ( ON ?auto_49057 ?auto_49058 ) ( CLEAR ?auto_49057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49063 ?auto_49062 ?auto_49061 ?auto_49060 ?auto_49059 ?auto_49058 )
      ( MAKE-5PILE ?auto_49057 ?auto_49058 ?auto_49059 ?auto_49060 ?auto_49061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49065 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49065 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_49065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49066 - BLOCK
    )
    :vars
    (
      ?auto_49067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49066 ?auto_49067 ) ( CLEAR ?auto_49066 ) ( HAND-EMPTY ) ( not ( = ?auto_49066 ?auto_49067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49066 ?auto_49067 )
      ( MAKE-1PILE ?auto_49066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49068 - BLOCK
    )
    :vars
    (
      ?auto_49069 - BLOCK
      ?auto_49073 - BLOCK
      ?auto_49071 - BLOCK
      ?auto_49070 - BLOCK
      ?auto_49072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49068 ?auto_49069 ) ) ( HOLDING ?auto_49068 ) ( CLEAR ?auto_49069 ) ( ON-TABLE ?auto_49073 ) ( ON ?auto_49071 ?auto_49073 ) ( ON ?auto_49070 ?auto_49071 ) ( ON ?auto_49072 ?auto_49070 ) ( ON ?auto_49069 ?auto_49072 ) ( not ( = ?auto_49073 ?auto_49071 ) ) ( not ( = ?auto_49073 ?auto_49070 ) ) ( not ( = ?auto_49073 ?auto_49072 ) ) ( not ( = ?auto_49073 ?auto_49069 ) ) ( not ( = ?auto_49073 ?auto_49068 ) ) ( not ( = ?auto_49071 ?auto_49070 ) ) ( not ( = ?auto_49071 ?auto_49072 ) ) ( not ( = ?auto_49071 ?auto_49069 ) ) ( not ( = ?auto_49071 ?auto_49068 ) ) ( not ( = ?auto_49070 ?auto_49072 ) ) ( not ( = ?auto_49070 ?auto_49069 ) ) ( not ( = ?auto_49070 ?auto_49068 ) ) ( not ( = ?auto_49072 ?auto_49069 ) ) ( not ( = ?auto_49072 ?auto_49068 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49073 ?auto_49071 ?auto_49070 ?auto_49072 ?auto_49069 ?auto_49068 )
      ( MAKE-1PILE ?auto_49068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49074 - BLOCK
    )
    :vars
    (
      ?auto_49075 - BLOCK
      ?auto_49077 - BLOCK
      ?auto_49079 - BLOCK
      ?auto_49078 - BLOCK
      ?auto_49076 - BLOCK
      ?auto_49080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49074 ?auto_49075 ) ) ( CLEAR ?auto_49075 ) ( ON-TABLE ?auto_49077 ) ( ON ?auto_49079 ?auto_49077 ) ( ON ?auto_49078 ?auto_49079 ) ( ON ?auto_49076 ?auto_49078 ) ( ON ?auto_49075 ?auto_49076 ) ( not ( = ?auto_49077 ?auto_49079 ) ) ( not ( = ?auto_49077 ?auto_49078 ) ) ( not ( = ?auto_49077 ?auto_49076 ) ) ( not ( = ?auto_49077 ?auto_49075 ) ) ( not ( = ?auto_49077 ?auto_49074 ) ) ( not ( = ?auto_49079 ?auto_49078 ) ) ( not ( = ?auto_49079 ?auto_49076 ) ) ( not ( = ?auto_49079 ?auto_49075 ) ) ( not ( = ?auto_49079 ?auto_49074 ) ) ( not ( = ?auto_49078 ?auto_49076 ) ) ( not ( = ?auto_49078 ?auto_49075 ) ) ( not ( = ?auto_49078 ?auto_49074 ) ) ( not ( = ?auto_49076 ?auto_49075 ) ) ( not ( = ?auto_49076 ?auto_49074 ) ) ( ON ?auto_49074 ?auto_49080 ) ( CLEAR ?auto_49074 ) ( HAND-EMPTY ) ( not ( = ?auto_49074 ?auto_49080 ) ) ( not ( = ?auto_49075 ?auto_49080 ) ) ( not ( = ?auto_49077 ?auto_49080 ) ) ( not ( = ?auto_49079 ?auto_49080 ) ) ( not ( = ?auto_49078 ?auto_49080 ) ) ( not ( = ?auto_49076 ?auto_49080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49074 ?auto_49080 )
      ( MAKE-1PILE ?auto_49074 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49081 - BLOCK
    )
    :vars
    (
      ?auto_49082 - BLOCK
      ?auto_49087 - BLOCK
      ?auto_49085 - BLOCK
      ?auto_49084 - BLOCK
      ?auto_49086 - BLOCK
      ?auto_49083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49081 ?auto_49082 ) ) ( ON-TABLE ?auto_49087 ) ( ON ?auto_49085 ?auto_49087 ) ( ON ?auto_49084 ?auto_49085 ) ( ON ?auto_49086 ?auto_49084 ) ( not ( = ?auto_49087 ?auto_49085 ) ) ( not ( = ?auto_49087 ?auto_49084 ) ) ( not ( = ?auto_49087 ?auto_49086 ) ) ( not ( = ?auto_49087 ?auto_49082 ) ) ( not ( = ?auto_49087 ?auto_49081 ) ) ( not ( = ?auto_49085 ?auto_49084 ) ) ( not ( = ?auto_49085 ?auto_49086 ) ) ( not ( = ?auto_49085 ?auto_49082 ) ) ( not ( = ?auto_49085 ?auto_49081 ) ) ( not ( = ?auto_49084 ?auto_49086 ) ) ( not ( = ?auto_49084 ?auto_49082 ) ) ( not ( = ?auto_49084 ?auto_49081 ) ) ( not ( = ?auto_49086 ?auto_49082 ) ) ( not ( = ?auto_49086 ?auto_49081 ) ) ( ON ?auto_49081 ?auto_49083 ) ( CLEAR ?auto_49081 ) ( not ( = ?auto_49081 ?auto_49083 ) ) ( not ( = ?auto_49082 ?auto_49083 ) ) ( not ( = ?auto_49087 ?auto_49083 ) ) ( not ( = ?auto_49085 ?auto_49083 ) ) ( not ( = ?auto_49084 ?auto_49083 ) ) ( not ( = ?auto_49086 ?auto_49083 ) ) ( HOLDING ?auto_49082 ) ( CLEAR ?auto_49086 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49087 ?auto_49085 ?auto_49084 ?auto_49086 ?auto_49082 )
      ( MAKE-1PILE ?auto_49081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49088 - BLOCK
    )
    :vars
    (
      ?auto_49094 - BLOCK
      ?auto_49093 - BLOCK
      ?auto_49092 - BLOCK
      ?auto_49091 - BLOCK
      ?auto_49090 - BLOCK
      ?auto_49089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49088 ?auto_49094 ) ) ( ON-TABLE ?auto_49093 ) ( ON ?auto_49092 ?auto_49093 ) ( ON ?auto_49091 ?auto_49092 ) ( ON ?auto_49090 ?auto_49091 ) ( not ( = ?auto_49093 ?auto_49092 ) ) ( not ( = ?auto_49093 ?auto_49091 ) ) ( not ( = ?auto_49093 ?auto_49090 ) ) ( not ( = ?auto_49093 ?auto_49094 ) ) ( not ( = ?auto_49093 ?auto_49088 ) ) ( not ( = ?auto_49092 ?auto_49091 ) ) ( not ( = ?auto_49092 ?auto_49090 ) ) ( not ( = ?auto_49092 ?auto_49094 ) ) ( not ( = ?auto_49092 ?auto_49088 ) ) ( not ( = ?auto_49091 ?auto_49090 ) ) ( not ( = ?auto_49091 ?auto_49094 ) ) ( not ( = ?auto_49091 ?auto_49088 ) ) ( not ( = ?auto_49090 ?auto_49094 ) ) ( not ( = ?auto_49090 ?auto_49088 ) ) ( ON ?auto_49088 ?auto_49089 ) ( not ( = ?auto_49088 ?auto_49089 ) ) ( not ( = ?auto_49094 ?auto_49089 ) ) ( not ( = ?auto_49093 ?auto_49089 ) ) ( not ( = ?auto_49092 ?auto_49089 ) ) ( not ( = ?auto_49091 ?auto_49089 ) ) ( not ( = ?auto_49090 ?auto_49089 ) ) ( CLEAR ?auto_49090 ) ( ON ?auto_49094 ?auto_49088 ) ( CLEAR ?auto_49094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49089 ?auto_49088 )
      ( MAKE-1PILE ?auto_49088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49095 - BLOCK
    )
    :vars
    (
      ?auto_49096 - BLOCK
      ?auto_49099 - BLOCK
      ?auto_49098 - BLOCK
      ?auto_49101 - BLOCK
      ?auto_49097 - BLOCK
      ?auto_49100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49095 ?auto_49096 ) ) ( ON-TABLE ?auto_49099 ) ( ON ?auto_49098 ?auto_49099 ) ( ON ?auto_49101 ?auto_49098 ) ( not ( = ?auto_49099 ?auto_49098 ) ) ( not ( = ?auto_49099 ?auto_49101 ) ) ( not ( = ?auto_49099 ?auto_49097 ) ) ( not ( = ?auto_49099 ?auto_49096 ) ) ( not ( = ?auto_49099 ?auto_49095 ) ) ( not ( = ?auto_49098 ?auto_49101 ) ) ( not ( = ?auto_49098 ?auto_49097 ) ) ( not ( = ?auto_49098 ?auto_49096 ) ) ( not ( = ?auto_49098 ?auto_49095 ) ) ( not ( = ?auto_49101 ?auto_49097 ) ) ( not ( = ?auto_49101 ?auto_49096 ) ) ( not ( = ?auto_49101 ?auto_49095 ) ) ( not ( = ?auto_49097 ?auto_49096 ) ) ( not ( = ?auto_49097 ?auto_49095 ) ) ( ON ?auto_49095 ?auto_49100 ) ( not ( = ?auto_49095 ?auto_49100 ) ) ( not ( = ?auto_49096 ?auto_49100 ) ) ( not ( = ?auto_49099 ?auto_49100 ) ) ( not ( = ?auto_49098 ?auto_49100 ) ) ( not ( = ?auto_49101 ?auto_49100 ) ) ( not ( = ?auto_49097 ?auto_49100 ) ) ( ON ?auto_49096 ?auto_49095 ) ( CLEAR ?auto_49096 ) ( ON-TABLE ?auto_49100 ) ( HOLDING ?auto_49097 ) ( CLEAR ?auto_49101 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49099 ?auto_49098 ?auto_49101 ?auto_49097 )
      ( MAKE-1PILE ?auto_49095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49102 - BLOCK
    )
    :vars
    (
      ?auto_49107 - BLOCK
      ?auto_49105 - BLOCK
      ?auto_49103 - BLOCK
      ?auto_49104 - BLOCK
      ?auto_49108 - BLOCK
      ?auto_49106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49102 ?auto_49107 ) ) ( ON-TABLE ?auto_49105 ) ( ON ?auto_49103 ?auto_49105 ) ( ON ?auto_49104 ?auto_49103 ) ( not ( = ?auto_49105 ?auto_49103 ) ) ( not ( = ?auto_49105 ?auto_49104 ) ) ( not ( = ?auto_49105 ?auto_49108 ) ) ( not ( = ?auto_49105 ?auto_49107 ) ) ( not ( = ?auto_49105 ?auto_49102 ) ) ( not ( = ?auto_49103 ?auto_49104 ) ) ( not ( = ?auto_49103 ?auto_49108 ) ) ( not ( = ?auto_49103 ?auto_49107 ) ) ( not ( = ?auto_49103 ?auto_49102 ) ) ( not ( = ?auto_49104 ?auto_49108 ) ) ( not ( = ?auto_49104 ?auto_49107 ) ) ( not ( = ?auto_49104 ?auto_49102 ) ) ( not ( = ?auto_49108 ?auto_49107 ) ) ( not ( = ?auto_49108 ?auto_49102 ) ) ( ON ?auto_49102 ?auto_49106 ) ( not ( = ?auto_49102 ?auto_49106 ) ) ( not ( = ?auto_49107 ?auto_49106 ) ) ( not ( = ?auto_49105 ?auto_49106 ) ) ( not ( = ?auto_49103 ?auto_49106 ) ) ( not ( = ?auto_49104 ?auto_49106 ) ) ( not ( = ?auto_49108 ?auto_49106 ) ) ( ON ?auto_49107 ?auto_49102 ) ( ON-TABLE ?auto_49106 ) ( CLEAR ?auto_49104 ) ( ON ?auto_49108 ?auto_49107 ) ( CLEAR ?auto_49108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49106 ?auto_49102 ?auto_49107 )
      ( MAKE-1PILE ?auto_49102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49109 - BLOCK
    )
    :vars
    (
      ?auto_49114 - BLOCK
      ?auto_49113 - BLOCK
      ?auto_49111 - BLOCK
      ?auto_49112 - BLOCK
      ?auto_49115 - BLOCK
      ?auto_49110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49109 ?auto_49114 ) ) ( ON-TABLE ?auto_49113 ) ( ON ?auto_49111 ?auto_49113 ) ( not ( = ?auto_49113 ?auto_49111 ) ) ( not ( = ?auto_49113 ?auto_49112 ) ) ( not ( = ?auto_49113 ?auto_49115 ) ) ( not ( = ?auto_49113 ?auto_49114 ) ) ( not ( = ?auto_49113 ?auto_49109 ) ) ( not ( = ?auto_49111 ?auto_49112 ) ) ( not ( = ?auto_49111 ?auto_49115 ) ) ( not ( = ?auto_49111 ?auto_49114 ) ) ( not ( = ?auto_49111 ?auto_49109 ) ) ( not ( = ?auto_49112 ?auto_49115 ) ) ( not ( = ?auto_49112 ?auto_49114 ) ) ( not ( = ?auto_49112 ?auto_49109 ) ) ( not ( = ?auto_49115 ?auto_49114 ) ) ( not ( = ?auto_49115 ?auto_49109 ) ) ( ON ?auto_49109 ?auto_49110 ) ( not ( = ?auto_49109 ?auto_49110 ) ) ( not ( = ?auto_49114 ?auto_49110 ) ) ( not ( = ?auto_49113 ?auto_49110 ) ) ( not ( = ?auto_49111 ?auto_49110 ) ) ( not ( = ?auto_49112 ?auto_49110 ) ) ( not ( = ?auto_49115 ?auto_49110 ) ) ( ON ?auto_49114 ?auto_49109 ) ( ON-TABLE ?auto_49110 ) ( ON ?auto_49115 ?auto_49114 ) ( CLEAR ?auto_49115 ) ( HOLDING ?auto_49112 ) ( CLEAR ?auto_49111 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49113 ?auto_49111 ?auto_49112 )
      ( MAKE-1PILE ?auto_49109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49116 - BLOCK
    )
    :vars
    (
      ?auto_49121 - BLOCK
      ?auto_49119 - BLOCK
      ?auto_49122 - BLOCK
      ?auto_49118 - BLOCK
      ?auto_49120 - BLOCK
      ?auto_49117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49116 ?auto_49121 ) ) ( ON-TABLE ?auto_49119 ) ( ON ?auto_49122 ?auto_49119 ) ( not ( = ?auto_49119 ?auto_49122 ) ) ( not ( = ?auto_49119 ?auto_49118 ) ) ( not ( = ?auto_49119 ?auto_49120 ) ) ( not ( = ?auto_49119 ?auto_49121 ) ) ( not ( = ?auto_49119 ?auto_49116 ) ) ( not ( = ?auto_49122 ?auto_49118 ) ) ( not ( = ?auto_49122 ?auto_49120 ) ) ( not ( = ?auto_49122 ?auto_49121 ) ) ( not ( = ?auto_49122 ?auto_49116 ) ) ( not ( = ?auto_49118 ?auto_49120 ) ) ( not ( = ?auto_49118 ?auto_49121 ) ) ( not ( = ?auto_49118 ?auto_49116 ) ) ( not ( = ?auto_49120 ?auto_49121 ) ) ( not ( = ?auto_49120 ?auto_49116 ) ) ( ON ?auto_49116 ?auto_49117 ) ( not ( = ?auto_49116 ?auto_49117 ) ) ( not ( = ?auto_49121 ?auto_49117 ) ) ( not ( = ?auto_49119 ?auto_49117 ) ) ( not ( = ?auto_49122 ?auto_49117 ) ) ( not ( = ?auto_49118 ?auto_49117 ) ) ( not ( = ?auto_49120 ?auto_49117 ) ) ( ON ?auto_49121 ?auto_49116 ) ( ON-TABLE ?auto_49117 ) ( ON ?auto_49120 ?auto_49121 ) ( CLEAR ?auto_49122 ) ( ON ?auto_49118 ?auto_49120 ) ( CLEAR ?auto_49118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49117 ?auto_49116 ?auto_49121 ?auto_49120 )
      ( MAKE-1PILE ?auto_49116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49123 - BLOCK
    )
    :vars
    (
      ?auto_49125 - BLOCK
      ?auto_49124 - BLOCK
      ?auto_49129 - BLOCK
      ?auto_49126 - BLOCK
      ?auto_49127 - BLOCK
      ?auto_49128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49123 ?auto_49125 ) ) ( ON-TABLE ?auto_49124 ) ( not ( = ?auto_49124 ?auto_49129 ) ) ( not ( = ?auto_49124 ?auto_49126 ) ) ( not ( = ?auto_49124 ?auto_49127 ) ) ( not ( = ?auto_49124 ?auto_49125 ) ) ( not ( = ?auto_49124 ?auto_49123 ) ) ( not ( = ?auto_49129 ?auto_49126 ) ) ( not ( = ?auto_49129 ?auto_49127 ) ) ( not ( = ?auto_49129 ?auto_49125 ) ) ( not ( = ?auto_49129 ?auto_49123 ) ) ( not ( = ?auto_49126 ?auto_49127 ) ) ( not ( = ?auto_49126 ?auto_49125 ) ) ( not ( = ?auto_49126 ?auto_49123 ) ) ( not ( = ?auto_49127 ?auto_49125 ) ) ( not ( = ?auto_49127 ?auto_49123 ) ) ( ON ?auto_49123 ?auto_49128 ) ( not ( = ?auto_49123 ?auto_49128 ) ) ( not ( = ?auto_49125 ?auto_49128 ) ) ( not ( = ?auto_49124 ?auto_49128 ) ) ( not ( = ?auto_49129 ?auto_49128 ) ) ( not ( = ?auto_49126 ?auto_49128 ) ) ( not ( = ?auto_49127 ?auto_49128 ) ) ( ON ?auto_49125 ?auto_49123 ) ( ON-TABLE ?auto_49128 ) ( ON ?auto_49127 ?auto_49125 ) ( ON ?auto_49126 ?auto_49127 ) ( CLEAR ?auto_49126 ) ( HOLDING ?auto_49129 ) ( CLEAR ?auto_49124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49124 ?auto_49129 )
      ( MAKE-1PILE ?auto_49123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49130 - BLOCK
    )
    :vars
    (
      ?auto_49134 - BLOCK
      ?auto_49133 - BLOCK
      ?auto_49131 - BLOCK
      ?auto_49135 - BLOCK
      ?auto_49132 - BLOCK
      ?auto_49136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49130 ?auto_49134 ) ) ( ON-TABLE ?auto_49133 ) ( not ( = ?auto_49133 ?auto_49131 ) ) ( not ( = ?auto_49133 ?auto_49135 ) ) ( not ( = ?auto_49133 ?auto_49132 ) ) ( not ( = ?auto_49133 ?auto_49134 ) ) ( not ( = ?auto_49133 ?auto_49130 ) ) ( not ( = ?auto_49131 ?auto_49135 ) ) ( not ( = ?auto_49131 ?auto_49132 ) ) ( not ( = ?auto_49131 ?auto_49134 ) ) ( not ( = ?auto_49131 ?auto_49130 ) ) ( not ( = ?auto_49135 ?auto_49132 ) ) ( not ( = ?auto_49135 ?auto_49134 ) ) ( not ( = ?auto_49135 ?auto_49130 ) ) ( not ( = ?auto_49132 ?auto_49134 ) ) ( not ( = ?auto_49132 ?auto_49130 ) ) ( ON ?auto_49130 ?auto_49136 ) ( not ( = ?auto_49130 ?auto_49136 ) ) ( not ( = ?auto_49134 ?auto_49136 ) ) ( not ( = ?auto_49133 ?auto_49136 ) ) ( not ( = ?auto_49131 ?auto_49136 ) ) ( not ( = ?auto_49135 ?auto_49136 ) ) ( not ( = ?auto_49132 ?auto_49136 ) ) ( ON ?auto_49134 ?auto_49130 ) ( ON-TABLE ?auto_49136 ) ( ON ?auto_49132 ?auto_49134 ) ( ON ?auto_49135 ?auto_49132 ) ( CLEAR ?auto_49133 ) ( ON ?auto_49131 ?auto_49135 ) ( CLEAR ?auto_49131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49136 ?auto_49130 ?auto_49134 ?auto_49132 ?auto_49135 )
      ( MAKE-1PILE ?auto_49130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49137 - BLOCK
    )
    :vars
    (
      ?auto_49138 - BLOCK
      ?auto_49141 - BLOCK
      ?auto_49143 - BLOCK
      ?auto_49142 - BLOCK
      ?auto_49140 - BLOCK
      ?auto_49139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49137 ?auto_49138 ) ) ( not ( = ?auto_49141 ?auto_49143 ) ) ( not ( = ?auto_49141 ?auto_49142 ) ) ( not ( = ?auto_49141 ?auto_49140 ) ) ( not ( = ?auto_49141 ?auto_49138 ) ) ( not ( = ?auto_49141 ?auto_49137 ) ) ( not ( = ?auto_49143 ?auto_49142 ) ) ( not ( = ?auto_49143 ?auto_49140 ) ) ( not ( = ?auto_49143 ?auto_49138 ) ) ( not ( = ?auto_49143 ?auto_49137 ) ) ( not ( = ?auto_49142 ?auto_49140 ) ) ( not ( = ?auto_49142 ?auto_49138 ) ) ( not ( = ?auto_49142 ?auto_49137 ) ) ( not ( = ?auto_49140 ?auto_49138 ) ) ( not ( = ?auto_49140 ?auto_49137 ) ) ( ON ?auto_49137 ?auto_49139 ) ( not ( = ?auto_49137 ?auto_49139 ) ) ( not ( = ?auto_49138 ?auto_49139 ) ) ( not ( = ?auto_49141 ?auto_49139 ) ) ( not ( = ?auto_49143 ?auto_49139 ) ) ( not ( = ?auto_49142 ?auto_49139 ) ) ( not ( = ?auto_49140 ?auto_49139 ) ) ( ON ?auto_49138 ?auto_49137 ) ( ON-TABLE ?auto_49139 ) ( ON ?auto_49140 ?auto_49138 ) ( ON ?auto_49142 ?auto_49140 ) ( ON ?auto_49143 ?auto_49142 ) ( CLEAR ?auto_49143 ) ( HOLDING ?auto_49141 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49141 )
      ( MAKE-1PILE ?auto_49137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49144 - BLOCK
    )
    :vars
    (
      ?auto_49145 - BLOCK
      ?auto_49149 - BLOCK
      ?auto_49150 - BLOCK
      ?auto_49147 - BLOCK
      ?auto_49146 - BLOCK
      ?auto_49148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49144 ?auto_49145 ) ) ( not ( = ?auto_49149 ?auto_49150 ) ) ( not ( = ?auto_49149 ?auto_49147 ) ) ( not ( = ?auto_49149 ?auto_49146 ) ) ( not ( = ?auto_49149 ?auto_49145 ) ) ( not ( = ?auto_49149 ?auto_49144 ) ) ( not ( = ?auto_49150 ?auto_49147 ) ) ( not ( = ?auto_49150 ?auto_49146 ) ) ( not ( = ?auto_49150 ?auto_49145 ) ) ( not ( = ?auto_49150 ?auto_49144 ) ) ( not ( = ?auto_49147 ?auto_49146 ) ) ( not ( = ?auto_49147 ?auto_49145 ) ) ( not ( = ?auto_49147 ?auto_49144 ) ) ( not ( = ?auto_49146 ?auto_49145 ) ) ( not ( = ?auto_49146 ?auto_49144 ) ) ( ON ?auto_49144 ?auto_49148 ) ( not ( = ?auto_49144 ?auto_49148 ) ) ( not ( = ?auto_49145 ?auto_49148 ) ) ( not ( = ?auto_49149 ?auto_49148 ) ) ( not ( = ?auto_49150 ?auto_49148 ) ) ( not ( = ?auto_49147 ?auto_49148 ) ) ( not ( = ?auto_49146 ?auto_49148 ) ) ( ON ?auto_49145 ?auto_49144 ) ( ON-TABLE ?auto_49148 ) ( ON ?auto_49146 ?auto_49145 ) ( ON ?auto_49147 ?auto_49146 ) ( ON ?auto_49150 ?auto_49147 ) ( ON ?auto_49149 ?auto_49150 ) ( CLEAR ?auto_49149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49148 ?auto_49144 ?auto_49145 ?auto_49146 ?auto_49147 ?auto_49150 )
      ( MAKE-1PILE ?auto_49144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49155 - BLOCK
      ?auto_49156 - BLOCK
      ?auto_49157 - BLOCK
      ?auto_49158 - BLOCK
    )
    :vars
    (
      ?auto_49159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49159 ?auto_49158 ) ( CLEAR ?auto_49159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49155 ) ( ON ?auto_49156 ?auto_49155 ) ( ON ?auto_49157 ?auto_49156 ) ( ON ?auto_49158 ?auto_49157 ) ( not ( = ?auto_49155 ?auto_49156 ) ) ( not ( = ?auto_49155 ?auto_49157 ) ) ( not ( = ?auto_49155 ?auto_49158 ) ) ( not ( = ?auto_49155 ?auto_49159 ) ) ( not ( = ?auto_49156 ?auto_49157 ) ) ( not ( = ?auto_49156 ?auto_49158 ) ) ( not ( = ?auto_49156 ?auto_49159 ) ) ( not ( = ?auto_49157 ?auto_49158 ) ) ( not ( = ?auto_49157 ?auto_49159 ) ) ( not ( = ?auto_49158 ?auto_49159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49159 ?auto_49158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49160 - BLOCK
      ?auto_49161 - BLOCK
      ?auto_49162 - BLOCK
      ?auto_49163 - BLOCK
    )
    :vars
    (
      ?auto_49164 - BLOCK
      ?auto_49165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49164 ?auto_49163 ) ( CLEAR ?auto_49164 ) ( ON-TABLE ?auto_49160 ) ( ON ?auto_49161 ?auto_49160 ) ( ON ?auto_49162 ?auto_49161 ) ( ON ?auto_49163 ?auto_49162 ) ( not ( = ?auto_49160 ?auto_49161 ) ) ( not ( = ?auto_49160 ?auto_49162 ) ) ( not ( = ?auto_49160 ?auto_49163 ) ) ( not ( = ?auto_49160 ?auto_49164 ) ) ( not ( = ?auto_49161 ?auto_49162 ) ) ( not ( = ?auto_49161 ?auto_49163 ) ) ( not ( = ?auto_49161 ?auto_49164 ) ) ( not ( = ?auto_49162 ?auto_49163 ) ) ( not ( = ?auto_49162 ?auto_49164 ) ) ( not ( = ?auto_49163 ?auto_49164 ) ) ( HOLDING ?auto_49165 ) ( not ( = ?auto_49160 ?auto_49165 ) ) ( not ( = ?auto_49161 ?auto_49165 ) ) ( not ( = ?auto_49162 ?auto_49165 ) ) ( not ( = ?auto_49163 ?auto_49165 ) ) ( not ( = ?auto_49164 ?auto_49165 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_49165 )
      ( MAKE-4PILE ?auto_49160 ?auto_49161 ?auto_49162 ?auto_49163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49166 - BLOCK
      ?auto_49167 - BLOCK
      ?auto_49168 - BLOCK
      ?auto_49169 - BLOCK
    )
    :vars
    (
      ?auto_49171 - BLOCK
      ?auto_49170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49171 ?auto_49169 ) ( ON-TABLE ?auto_49166 ) ( ON ?auto_49167 ?auto_49166 ) ( ON ?auto_49168 ?auto_49167 ) ( ON ?auto_49169 ?auto_49168 ) ( not ( = ?auto_49166 ?auto_49167 ) ) ( not ( = ?auto_49166 ?auto_49168 ) ) ( not ( = ?auto_49166 ?auto_49169 ) ) ( not ( = ?auto_49166 ?auto_49171 ) ) ( not ( = ?auto_49167 ?auto_49168 ) ) ( not ( = ?auto_49167 ?auto_49169 ) ) ( not ( = ?auto_49167 ?auto_49171 ) ) ( not ( = ?auto_49168 ?auto_49169 ) ) ( not ( = ?auto_49168 ?auto_49171 ) ) ( not ( = ?auto_49169 ?auto_49171 ) ) ( not ( = ?auto_49166 ?auto_49170 ) ) ( not ( = ?auto_49167 ?auto_49170 ) ) ( not ( = ?auto_49168 ?auto_49170 ) ) ( not ( = ?auto_49169 ?auto_49170 ) ) ( not ( = ?auto_49171 ?auto_49170 ) ) ( ON ?auto_49170 ?auto_49171 ) ( CLEAR ?auto_49170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49166 ?auto_49167 ?auto_49168 ?auto_49169 ?auto_49171 )
      ( MAKE-4PILE ?auto_49166 ?auto_49167 ?auto_49168 ?auto_49169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49172 - BLOCK
      ?auto_49173 - BLOCK
      ?auto_49174 - BLOCK
      ?auto_49175 - BLOCK
    )
    :vars
    (
      ?auto_49176 - BLOCK
      ?auto_49177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49176 ?auto_49175 ) ( ON-TABLE ?auto_49172 ) ( ON ?auto_49173 ?auto_49172 ) ( ON ?auto_49174 ?auto_49173 ) ( ON ?auto_49175 ?auto_49174 ) ( not ( = ?auto_49172 ?auto_49173 ) ) ( not ( = ?auto_49172 ?auto_49174 ) ) ( not ( = ?auto_49172 ?auto_49175 ) ) ( not ( = ?auto_49172 ?auto_49176 ) ) ( not ( = ?auto_49173 ?auto_49174 ) ) ( not ( = ?auto_49173 ?auto_49175 ) ) ( not ( = ?auto_49173 ?auto_49176 ) ) ( not ( = ?auto_49174 ?auto_49175 ) ) ( not ( = ?auto_49174 ?auto_49176 ) ) ( not ( = ?auto_49175 ?auto_49176 ) ) ( not ( = ?auto_49172 ?auto_49177 ) ) ( not ( = ?auto_49173 ?auto_49177 ) ) ( not ( = ?auto_49174 ?auto_49177 ) ) ( not ( = ?auto_49175 ?auto_49177 ) ) ( not ( = ?auto_49176 ?auto_49177 ) ) ( HOLDING ?auto_49177 ) ( CLEAR ?auto_49176 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49172 ?auto_49173 ?auto_49174 ?auto_49175 ?auto_49176 ?auto_49177 )
      ( MAKE-4PILE ?auto_49172 ?auto_49173 ?auto_49174 ?auto_49175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49178 - BLOCK
      ?auto_49179 - BLOCK
      ?auto_49180 - BLOCK
      ?auto_49181 - BLOCK
    )
    :vars
    (
      ?auto_49183 - BLOCK
      ?auto_49182 - BLOCK
      ?auto_49184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49183 ?auto_49181 ) ( ON-TABLE ?auto_49178 ) ( ON ?auto_49179 ?auto_49178 ) ( ON ?auto_49180 ?auto_49179 ) ( ON ?auto_49181 ?auto_49180 ) ( not ( = ?auto_49178 ?auto_49179 ) ) ( not ( = ?auto_49178 ?auto_49180 ) ) ( not ( = ?auto_49178 ?auto_49181 ) ) ( not ( = ?auto_49178 ?auto_49183 ) ) ( not ( = ?auto_49179 ?auto_49180 ) ) ( not ( = ?auto_49179 ?auto_49181 ) ) ( not ( = ?auto_49179 ?auto_49183 ) ) ( not ( = ?auto_49180 ?auto_49181 ) ) ( not ( = ?auto_49180 ?auto_49183 ) ) ( not ( = ?auto_49181 ?auto_49183 ) ) ( not ( = ?auto_49178 ?auto_49182 ) ) ( not ( = ?auto_49179 ?auto_49182 ) ) ( not ( = ?auto_49180 ?auto_49182 ) ) ( not ( = ?auto_49181 ?auto_49182 ) ) ( not ( = ?auto_49183 ?auto_49182 ) ) ( CLEAR ?auto_49183 ) ( ON ?auto_49182 ?auto_49184 ) ( CLEAR ?auto_49182 ) ( HAND-EMPTY ) ( not ( = ?auto_49178 ?auto_49184 ) ) ( not ( = ?auto_49179 ?auto_49184 ) ) ( not ( = ?auto_49180 ?auto_49184 ) ) ( not ( = ?auto_49181 ?auto_49184 ) ) ( not ( = ?auto_49183 ?auto_49184 ) ) ( not ( = ?auto_49182 ?auto_49184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49182 ?auto_49184 )
      ( MAKE-4PILE ?auto_49178 ?auto_49179 ?auto_49180 ?auto_49181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49199 - BLOCK
      ?auto_49200 - BLOCK
      ?auto_49201 - BLOCK
      ?auto_49202 - BLOCK
    )
    :vars
    (
      ?auto_49205 - BLOCK
      ?auto_49203 - BLOCK
      ?auto_49204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49199 ) ( ON ?auto_49200 ?auto_49199 ) ( ON ?auto_49201 ?auto_49200 ) ( not ( = ?auto_49199 ?auto_49200 ) ) ( not ( = ?auto_49199 ?auto_49201 ) ) ( not ( = ?auto_49199 ?auto_49202 ) ) ( not ( = ?auto_49199 ?auto_49205 ) ) ( not ( = ?auto_49200 ?auto_49201 ) ) ( not ( = ?auto_49200 ?auto_49202 ) ) ( not ( = ?auto_49200 ?auto_49205 ) ) ( not ( = ?auto_49201 ?auto_49202 ) ) ( not ( = ?auto_49201 ?auto_49205 ) ) ( not ( = ?auto_49202 ?auto_49205 ) ) ( not ( = ?auto_49199 ?auto_49203 ) ) ( not ( = ?auto_49200 ?auto_49203 ) ) ( not ( = ?auto_49201 ?auto_49203 ) ) ( not ( = ?auto_49202 ?auto_49203 ) ) ( not ( = ?auto_49205 ?auto_49203 ) ) ( ON ?auto_49203 ?auto_49204 ) ( not ( = ?auto_49199 ?auto_49204 ) ) ( not ( = ?auto_49200 ?auto_49204 ) ) ( not ( = ?auto_49201 ?auto_49204 ) ) ( not ( = ?auto_49202 ?auto_49204 ) ) ( not ( = ?auto_49205 ?auto_49204 ) ) ( not ( = ?auto_49203 ?auto_49204 ) ) ( ON ?auto_49205 ?auto_49203 ) ( CLEAR ?auto_49205 ) ( HOLDING ?auto_49202 ) ( CLEAR ?auto_49201 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49199 ?auto_49200 ?auto_49201 ?auto_49202 ?auto_49205 )
      ( MAKE-4PILE ?auto_49199 ?auto_49200 ?auto_49201 ?auto_49202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49206 - BLOCK
      ?auto_49207 - BLOCK
      ?auto_49208 - BLOCK
      ?auto_49209 - BLOCK
    )
    :vars
    (
      ?auto_49212 - BLOCK
      ?auto_49210 - BLOCK
      ?auto_49211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49206 ) ( ON ?auto_49207 ?auto_49206 ) ( ON ?auto_49208 ?auto_49207 ) ( not ( = ?auto_49206 ?auto_49207 ) ) ( not ( = ?auto_49206 ?auto_49208 ) ) ( not ( = ?auto_49206 ?auto_49209 ) ) ( not ( = ?auto_49206 ?auto_49212 ) ) ( not ( = ?auto_49207 ?auto_49208 ) ) ( not ( = ?auto_49207 ?auto_49209 ) ) ( not ( = ?auto_49207 ?auto_49212 ) ) ( not ( = ?auto_49208 ?auto_49209 ) ) ( not ( = ?auto_49208 ?auto_49212 ) ) ( not ( = ?auto_49209 ?auto_49212 ) ) ( not ( = ?auto_49206 ?auto_49210 ) ) ( not ( = ?auto_49207 ?auto_49210 ) ) ( not ( = ?auto_49208 ?auto_49210 ) ) ( not ( = ?auto_49209 ?auto_49210 ) ) ( not ( = ?auto_49212 ?auto_49210 ) ) ( ON ?auto_49210 ?auto_49211 ) ( not ( = ?auto_49206 ?auto_49211 ) ) ( not ( = ?auto_49207 ?auto_49211 ) ) ( not ( = ?auto_49208 ?auto_49211 ) ) ( not ( = ?auto_49209 ?auto_49211 ) ) ( not ( = ?auto_49212 ?auto_49211 ) ) ( not ( = ?auto_49210 ?auto_49211 ) ) ( ON ?auto_49212 ?auto_49210 ) ( CLEAR ?auto_49208 ) ( ON ?auto_49209 ?auto_49212 ) ( CLEAR ?auto_49209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49211 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49211 ?auto_49210 ?auto_49212 )
      ( MAKE-4PILE ?auto_49206 ?auto_49207 ?auto_49208 ?auto_49209 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49213 - BLOCK
      ?auto_49214 - BLOCK
      ?auto_49215 - BLOCK
      ?auto_49216 - BLOCK
    )
    :vars
    (
      ?auto_49218 - BLOCK
      ?auto_49217 - BLOCK
      ?auto_49219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49213 ) ( ON ?auto_49214 ?auto_49213 ) ( not ( = ?auto_49213 ?auto_49214 ) ) ( not ( = ?auto_49213 ?auto_49215 ) ) ( not ( = ?auto_49213 ?auto_49216 ) ) ( not ( = ?auto_49213 ?auto_49218 ) ) ( not ( = ?auto_49214 ?auto_49215 ) ) ( not ( = ?auto_49214 ?auto_49216 ) ) ( not ( = ?auto_49214 ?auto_49218 ) ) ( not ( = ?auto_49215 ?auto_49216 ) ) ( not ( = ?auto_49215 ?auto_49218 ) ) ( not ( = ?auto_49216 ?auto_49218 ) ) ( not ( = ?auto_49213 ?auto_49217 ) ) ( not ( = ?auto_49214 ?auto_49217 ) ) ( not ( = ?auto_49215 ?auto_49217 ) ) ( not ( = ?auto_49216 ?auto_49217 ) ) ( not ( = ?auto_49218 ?auto_49217 ) ) ( ON ?auto_49217 ?auto_49219 ) ( not ( = ?auto_49213 ?auto_49219 ) ) ( not ( = ?auto_49214 ?auto_49219 ) ) ( not ( = ?auto_49215 ?auto_49219 ) ) ( not ( = ?auto_49216 ?auto_49219 ) ) ( not ( = ?auto_49218 ?auto_49219 ) ) ( not ( = ?auto_49217 ?auto_49219 ) ) ( ON ?auto_49218 ?auto_49217 ) ( ON ?auto_49216 ?auto_49218 ) ( CLEAR ?auto_49216 ) ( ON-TABLE ?auto_49219 ) ( HOLDING ?auto_49215 ) ( CLEAR ?auto_49214 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49213 ?auto_49214 ?auto_49215 )
      ( MAKE-4PILE ?auto_49213 ?auto_49214 ?auto_49215 ?auto_49216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49220 - BLOCK
      ?auto_49221 - BLOCK
      ?auto_49222 - BLOCK
      ?auto_49223 - BLOCK
    )
    :vars
    (
      ?auto_49224 - BLOCK
      ?auto_49226 - BLOCK
      ?auto_49225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49220 ) ( ON ?auto_49221 ?auto_49220 ) ( not ( = ?auto_49220 ?auto_49221 ) ) ( not ( = ?auto_49220 ?auto_49222 ) ) ( not ( = ?auto_49220 ?auto_49223 ) ) ( not ( = ?auto_49220 ?auto_49224 ) ) ( not ( = ?auto_49221 ?auto_49222 ) ) ( not ( = ?auto_49221 ?auto_49223 ) ) ( not ( = ?auto_49221 ?auto_49224 ) ) ( not ( = ?auto_49222 ?auto_49223 ) ) ( not ( = ?auto_49222 ?auto_49224 ) ) ( not ( = ?auto_49223 ?auto_49224 ) ) ( not ( = ?auto_49220 ?auto_49226 ) ) ( not ( = ?auto_49221 ?auto_49226 ) ) ( not ( = ?auto_49222 ?auto_49226 ) ) ( not ( = ?auto_49223 ?auto_49226 ) ) ( not ( = ?auto_49224 ?auto_49226 ) ) ( ON ?auto_49226 ?auto_49225 ) ( not ( = ?auto_49220 ?auto_49225 ) ) ( not ( = ?auto_49221 ?auto_49225 ) ) ( not ( = ?auto_49222 ?auto_49225 ) ) ( not ( = ?auto_49223 ?auto_49225 ) ) ( not ( = ?auto_49224 ?auto_49225 ) ) ( not ( = ?auto_49226 ?auto_49225 ) ) ( ON ?auto_49224 ?auto_49226 ) ( ON ?auto_49223 ?auto_49224 ) ( ON-TABLE ?auto_49225 ) ( CLEAR ?auto_49221 ) ( ON ?auto_49222 ?auto_49223 ) ( CLEAR ?auto_49222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49225 ?auto_49226 ?auto_49224 ?auto_49223 )
      ( MAKE-4PILE ?auto_49220 ?auto_49221 ?auto_49222 ?auto_49223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49227 - BLOCK
      ?auto_49228 - BLOCK
      ?auto_49229 - BLOCK
      ?auto_49230 - BLOCK
    )
    :vars
    (
      ?auto_49231 - BLOCK
      ?auto_49232 - BLOCK
      ?auto_49233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49227 ) ( not ( = ?auto_49227 ?auto_49228 ) ) ( not ( = ?auto_49227 ?auto_49229 ) ) ( not ( = ?auto_49227 ?auto_49230 ) ) ( not ( = ?auto_49227 ?auto_49231 ) ) ( not ( = ?auto_49228 ?auto_49229 ) ) ( not ( = ?auto_49228 ?auto_49230 ) ) ( not ( = ?auto_49228 ?auto_49231 ) ) ( not ( = ?auto_49229 ?auto_49230 ) ) ( not ( = ?auto_49229 ?auto_49231 ) ) ( not ( = ?auto_49230 ?auto_49231 ) ) ( not ( = ?auto_49227 ?auto_49232 ) ) ( not ( = ?auto_49228 ?auto_49232 ) ) ( not ( = ?auto_49229 ?auto_49232 ) ) ( not ( = ?auto_49230 ?auto_49232 ) ) ( not ( = ?auto_49231 ?auto_49232 ) ) ( ON ?auto_49232 ?auto_49233 ) ( not ( = ?auto_49227 ?auto_49233 ) ) ( not ( = ?auto_49228 ?auto_49233 ) ) ( not ( = ?auto_49229 ?auto_49233 ) ) ( not ( = ?auto_49230 ?auto_49233 ) ) ( not ( = ?auto_49231 ?auto_49233 ) ) ( not ( = ?auto_49232 ?auto_49233 ) ) ( ON ?auto_49231 ?auto_49232 ) ( ON ?auto_49230 ?auto_49231 ) ( ON-TABLE ?auto_49233 ) ( ON ?auto_49229 ?auto_49230 ) ( CLEAR ?auto_49229 ) ( HOLDING ?auto_49228 ) ( CLEAR ?auto_49227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49227 ?auto_49228 )
      ( MAKE-4PILE ?auto_49227 ?auto_49228 ?auto_49229 ?auto_49230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49234 - BLOCK
      ?auto_49235 - BLOCK
      ?auto_49236 - BLOCK
      ?auto_49237 - BLOCK
    )
    :vars
    (
      ?auto_49238 - BLOCK
      ?auto_49240 - BLOCK
      ?auto_49239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49234 ) ( not ( = ?auto_49234 ?auto_49235 ) ) ( not ( = ?auto_49234 ?auto_49236 ) ) ( not ( = ?auto_49234 ?auto_49237 ) ) ( not ( = ?auto_49234 ?auto_49238 ) ) ( not ( = ?auto_49235 ?auto_49236 ) ) ( not ( = ?auto_49235 ?auto_49237 ) ) ( not ( = ?auto_49235 ?auto_49238 ) ) ( not ( = ?auto_49236 ?auto_49237 ) ) ( not ( = ?auto_49236 ?auto_49238 ) ) ( not ( = ?auto_49237 ?auto_49238 ) ) ( not ( = ?auto_49234 ?auto_49240 ) ) ( not ( = ?auto_49235 ?auto_49240 ) ) ( not ( = ?auto_49236 ?auto_49240 ) ) ( not ( = ?auto_49237 ?auto_49240 ) ) ( not ( = ?auto_49238 ?auto_49240 ) ) ( ON ?auto_49240 ?auto_49239 ) ( not ( = ?auto_49234 ?auto_49239 ) ) ( not ( = ?auto_49235 ?auto_49239 ) ) ( not ( = ?auto_49236 ?auto_49239 ) ) ( not ( = ?auto_49237 ?auto_49239 ) ) ( not ( = ?auto_49238 ?auto_49239 ) ) ( not ( = ?auto_49240 ?auto_49239 ) ) ( ON ?auto_49238 ?auto_49240 ) ( ON ?auto_49237 ?auto_49238 ) ( ON-TABLE ?auto_49239 ) ( ON ?auto_49236 ?auto_49237 ) ( CLEAR ?auto_49234 ) ( ON ?auto_49235 ?auto_49236 ) ( CLEAR ?auto_49235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49239 ?auto_49240 ?auto_49238 ?auto_49237 ?auto_49236 )
      ( MAKE-4PILE ?auto_49234 ?auto_49235 ?auto_49236 ?auto_49237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49241 - BLOCK
      ?auto_49242 - BLOCK
      ?auto_49243 - BLOCK
      ?auto_49244 - BLOCK
    )
    :vars
    (
      ?auto_49245 - BLOCK
      ?auto_49246 - BLOCK
      ?auto_49247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49241 ?auto_49242 ) ) ( not ( = ?auto_49241 ?auto_49243 ) ) ( not ( = ?auto_49241 ?auto_49244 ) ) ( not ( = ?auto_49241 ?auto_49245 ) ) ( not ( = ?auto_49242 ?auto_49243 ) ) ( not ( = ?auto_49242 ?auto_49244 ) ) ( not ( = ?auto_49242 ?auto_49245 ) ) ( not ( = ?auto_49243 ?auto_49244 ) ) ( not ( = ?auto_49243 ?auto_49245 ) ) ( not ( = ?auto_49244 ?auto_49245 ) ) ( not ( = ?auto_49241 ?auto_49246 ) ) ( not ( = ?auto_49242 ?auto_49246 ) ) ( not ( = ?auto_49243 ?auto_49246 ) ) ( not ( = ?auto_49244 ?auto_49246 ) ) ( not ( = ?auto_49245 ?auto_49246 ) ) ( ON ?auto_49246 ?auto_49247 ) ( not ( = ?auto_49241 ?auto_49247 ) ) ( not ( = ?auto_49242 ?auto_49247 ) ) ( not ( = ?auto_49243 ?auto_49247 ) ) ( not ( = ?auto_49244 ?auto_49247 ) ) ( not ( = ?auto_49245 ?auto_49247 ) ) ( not ( = ?auto_49246 ?auto_49247 ) ) ( ON ?auto_49245 ?auto_49246 ) ( ON ?auto_49244 ?auto_49245 ) ( ON-TABLE ?auto_49247 ) ( ON ?auto_49243 ?auto_49244 ) ( ON ?auto_49242 ?auto_49243 ) ( CLEAR ?auto_49242 ) ( HOLDING ?auto_49241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49241 )
      ( MAKE-4PILE ?auto_49241 ?auto_49242 ?auto_49243 ?auto_49244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49248 - BLOCK
      ?auto_49249 - BLOCK
      ?auto_49250 - BLOCK
      ?auto_49251 - BLOCK
    )
    :vars
    (
      ?auto_49254 - BLOCK
      ?auto_49252 - BLOCK
      ?auto_49253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49248 ?auto_49249 ) ) ( not ( = ?auto_49248 ?auto_49250 ) ) ( not ( = ?auto_49248 ?auto_49251 ) ) ( not ( = ?auto_49248 ?auto_49254 ) ) ( not ( = ?auto_49249 ?auto_49250 ) ) ( not ( = ?auto_49249 ?auto_49251 ) ) ( not ( = ?auto_49249 ?auto_49254 ) ) ( not ( = ?auto_49250 ?auto_49251 ) ) ( not ( = ?auto_49250 ?auto_49254 ) ) ( not ( = ?auto_49251 ?auto_49254 ) ) ( not ( = ?auto_49248 ?auto_49252 ) ) ( not ( = ?auto_49249 ?auto_49252 ) ) ( not ( = ?auto_49250 ?auto_49252 ) ) ( not ( = ?auto_49251 ?auto_49252 ) ) ( not ( = ?auto_49254 ?auto_49252 ) ) ( ON ?auto_49252 ?auto_49253 ) ( not ( = ?auto_49248 ?auto_49253 ) ) ( not ( = ?auto_49249 ?auto_49253 ) ) ( not ( = ?auto_49250 ?auto_49253 ) ) ( not ( = ?auto_49251 ?auto_49253 ) ) ( not ( = ?auto_49254 ?auto_49253 ) ) ( not ( = ?auto_49252 ?auto_49253 ) ) ( ON ?auto_49254 ?auto_49252 ) ( ON ?auto_49251 ?auto_49254 ) ( ON-TABLE ?auto_49253 ) ( ON ?auto_49250 ?auto_49251 ) ( ON ?auto_49249 ?auto_49250 ) ( ON ?auto_49248 ?auto_49249 ) ( CLEAR ?auto_49248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49253 ?auto_49252 ?auto_49254 ?auto_49251 ?auto_49250 ?auto_49249 )
      ( MAKE-4PILE ?auto_49248 ?auto_49249 ?auto_49250 ?auto_49251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49257 - BLOCK
      ?auto_49258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49258 ) ( CLEAR ?auto_49257 ) ( ON-TABLE ?auto_49257 ) ( not ( = ?auto_49257 ?auto_49258 ) ) )
    :subtasks
    ( ( !STACK ?auto_49258 ?auto_49257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49259 - BLOCK
      ?auto_49260 - BLOCK
    )
    :vars
    (
      ?auto_49261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49259 ) ( ON-TABLE ?auto_49259 ) ( not ( = ?auto_49259 ?auto_49260 ) ) ( ON ?auto_49260 ?auto_49261 ) ( CLEAR ?auto_49260 ) ( HAND-EMPTY ) ( not ( = ?auto_49259 ?auto_49261 ) ) ( not ( = ?auto_49260 ?auto_49261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49260 ?auto_49261 )
      ( MAKE-2PILE ?auto_49259 ?auto_49260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49262 - BLOCK
      ?auto_49263 - BLOCK
    )
    :vars
    (
      ?auto_49264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49262 ?auto_49263 ) ) ( ON ?auto_49263 ?auto_49264 ) ( CLEAR ?auto_49263 ) ( not ( = ?auto_49262 ?auto_49264 ) ) ( not ( = ?auto_49263 ?auto_49264 ) ) ( HOLDING ?auto_49262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49262 )
      ( MAKE-2PILE ?auto_49262 ?auto_49263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49265 - BLOCK
      ?auto_49266 - BLOCK
    )
    :vars
    (
      ?auto_49267 - BLOCK
      ?auto_49268 - BLOCK
      ?auto_49269 - BLOCK
      ?auto_49270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49265 ?auto_49266 ) ) ( ON ?auto_49266 ?auto_49267 ) ( not ( = ?auto_49265 ?auto_49267 ) ) ( not ( = ?auto_49266 ?auto_49267 ) ) ( ON ?auto_49265 ?auto_49266 ) ( CLEAR ?auto_49265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49268 ) ( ON ?auto_49269 ?auto_49268 ) ( ON ?auto_49270 ?auto_49269 ) ( ON ?auto_49267 ?auto_49270 ) ( not ( = ?auto_49268 ?auto_49269 ) ) ( not ( = ?auto_49268 ?auto_49270 ) ) ( not ( = ?auto_49268 ?auto_49267 ) ) ( not ( = ?auto_49268 ?auto_49266 ) ) ( not ( = ?auto_49268 ?auto_49265 ) ) ( not ( = ?auto_49269 ?auto_49270 ) ) ( not ( = ?auto_49269 ?auto_49267 ) ) ( not ( = ?auto_49269 ?auto_49266 ) ) ( not ( = ?auto_49269 ?auto_49265 ) ) ( not ( = ?auto_49270 ?auto_49267 ) ) ( not ( = ?auto_49270 ?auto_49266 ) ) ( not ( = ?auto_49270 ?auto_49265 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49268 ?auto_49269 ?auto_49270 ?auto_49267 ?auto_49266 )
      ( MAKE-2PILE ?auto_49265 ?auto_49266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49271 - BLOCK
      ?auto_49272 - BLOCK
    )
    :vars
    (
      ?auto_49274 - BLOCK
      ?auto_49275 - BLOCK
      ?auto_49276 - BLOCK
      ?auto_49273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49271 ?auto_49272 ) ) ( ON ?auto_49272 ?auto_49274 ) ( not ( = ?auto_49271 ?auto_49274 ) ) ( not ( = ?auto_49272 ?auto_49274 ) ) ( ON-TABLE ?auto_49275 ) ( ON ?auto_49276 ?auto_49275 ) ( ON ?auto_49273 ?auto_49276 ) ( ON ?auto_49274 ?auto_49273 ) ( not ( = ?auto_49275 ?auto_49276 ) ) ( not ( = ?auto_49275 ?auto_49273 ) ) ( not ( = ?auto_49275 ?auto_49274 ) ) ( not ( = ?auto_49275 ?auto_49272 ) ) ( not ( = ?auto_49275 ?auto_49271 ) ) ( not ( = ?auto_49276 ?auto_49273 ) ) ( not ( = ?auto_49276 ?auto_49274 ) ) ( not ( = ?auto_49276 ?auto_49272 ) ) ( not ( = ?auto_49276 ?auto_49271 ) ) ( not ( = ?auto_49273 ?auto_49274 ) ) ( not ( = ?auto_49273 ?auto_49272 ) ) ( not ( = ?auto_49273 ?auto_49271 ) ) ( HOLDING ?auto_49271 ) ( CLEAR ?auto_49272 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49275 ?auto_49276 ?auto_49273 ?auto_49274 ?auto_49272 ?auto_49271 )
      ( MAKE-2PILE ?auto_49271 ?auto_49272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49277 - BLOCK
      ?auto_49278 - BLOCK
    )
    :vars
    (
      ?auto_49282 - BLOCK
      ?auto_49279 - BLOCK
      ?auto_49281 - BLOCK
      ?auto_49280 - BLOCK
      ?auto_49283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49277 ?auto_49278 ) ) ( ON ?auto_49278 ?auto_49282 ) ( not ( = ?auto_49277 ?auto_49282 ) ) ( not ( = ?auto_49278 ?auto_49282 ) ) ( ON-TABLE ?auto_49279 ) ( ON ?auto_49281 ?auto_49279 ) ( ON ?auto_49280 ?auto_49281 ) ( ON ?auto_49282 ?auto_49280 ) ( not ( = ?auto_49279 ?auto_49281 ) ) ( not ( = ?auto_49279 ?auto_49280 ) ) ( not ( = ?auto_49279 ?auto_49282 ) ) ( not ( = ?auto_49279 ?auto_49278 ) ) ( not ( = ?auto_49279 ?auto_49277 ) ) ( not ( = ?auto_49281 ?auto_49280 ) ) ( not ( = ?auto_49281 ?auto_49282 ) ) ( not ( = ?auto_49281 ?auto_49278 ) ) ( not ( = ?auto_49281 ?auto_49277 ) ) ( not ( = ?auto_49280 ?auto_49282 ) ) ( not ( = ?auto_49280 ?auto_49278 ) ) ( not ( = ?auto_49280 ?auto_49277 ) ) ( CLEAR ?auto_49278 ) ( ON ?auto_49277 ?auto_49283 ) ( CLEAR ?auto_49277 ) ( HAND-EMPTY ) ( not ( = ?auto_49277 ?auto_49283 ) ) ( not ( = ?auto_49278 ?auto_49283 ) ) ( not ( = ?auto_49282 ?auto_49283 ) ) ( not ( = ?auto_49279 ?auto_49283 ) ) ( not ( = ?auto_49281 ?auto_49283 ) ) ( not ( = ?auto_49280 ?auto_49283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49277 ?auto_49283 )
      ( MAKE-2PILE ?auto_49277 ?auto_49278 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49284 - BLOCK
      ?auto_49285 - BLOCK
    )
    :vars
    (
      ?auto_49287 - BLOCK
      ?auto_49288 - BLOCK
      ?auto_49290 - BLOCK
      ?auto_49289 - BLOCK
      ?auto_49286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49284 ?auto_49285 ) ) ( not ( = ?auto_49284 ?auto_49287 ) ) ( not ( = ?auto_49285 ?auto_49287 ) ) ( ON-TABLE ?auto_49288 ) ( ON ?auto_49290 ?auto_49288 ) ( ON ?auto_49289 ?auto_49290 ) ( ON ?auto_49287 ?auto_49289 ) ( not ( = ?auto_49288 ?auto_49290 ) ) ( not ( = ?auto_49288 ?auto_49289 ) ) ( not ( = ?auto_49288 ?auto_49287 ) ) ( not ( = ?auto_49288 ?auto_49285 ) ) ( not ( = ?auto_49288 ?auto_49284 ) ) ( not ( = ?auto_49290 ?auto_49289 ) ) ( not ( = ?auto_49290 ?auto_49287 ) ) ( not ( = ?auto_49290 ?auto_49285 ) ) ( not ( = ?auto_49290 ?auto_49284 ) ) ( not ( = ?auto_49289 ?auto_49287 ) ) ( not ( = ?auto_49289 ?auto_49285 ) ) ( not ( = ?auto_49289 ?auto_49284 ) ) ( ON ?auto_49284 ?auto_49286 ) ( CLEAR ?auto_49284 ) ( not ( = ?auto_49284 ?auto_49286 ) ) ( not ( = ?auto_49285 ?auto_49286 ) ) ( not ( = ?auto_49287 ?auto_49286 ) ) ( not ( = ?auto_49288 ?auto_49286 ) ) ( not ( = ?auto_49290 ?auto_49286 ) ) ( not ( = ?auto_49289 ?auto_49286 ) ) ( HOLDING ?auto_49285 ) ( CLEAR ?auto_49287 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49288 ?auto_49290 ?auto_49289 ?auto_49287 ?auto_49285 )
      ( MAKE-2PILE ?auto_49284 ?auto_49285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49291 - BLOCK
      ?auto_49292 - BLOCK
    )
    :vars
    (
      ?auto_49296 - BLOCK
      ?auto_49294 - BLOCK
      ?auto_49293 - BLOCK
      ?auto_49295 - BLOCK
      ?auto_49297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49291 ?auto_49292 ) ) ( not ( = ?auto_49291 ?auto_49296 ) ) ( not ( = ?auto_49292 ?auto_49296 ) ) ( ON-TABLE ?auto_49294 ) ( ON ?auto_49293 ?auto_49294 ) ( ON ?auto_49295 ?auto_49293 ) ( ON ?auto_49296 ?auto_49295 ) ( not ( = ?auto_49294 ?auto_49293 ) ) ( not ( = ?auto_49294 ?auto_49295 ) ) ( not ( = ?auto_49294 ?auto_49296 ) ) ( not ( = ?auto_49294 ?auto_49292 ) ) ( not ( = ?auto_49294 ?auto_49291 ) ) ( not ( = ?auto_49293 ?auto_49295 ) ) ( not ( = ?auto_49293 ?auto_49296 ) ) ( not ( = ?auto_49293 ?auto_49292 ) ) ( not ( = ?auto_49293 ?auto_49291 ) ) ( not ( = ?auto_49295 ?auto_49296 ) ) ( not ( = ?auto_49295 ?auto_49292 ) ) ( not ( = ?auto_49295 ?auto_49291 ) ) ( ON ?auto_49291 ?auto_49297 ) ( not ( = ?auto_49291 ?auto_49297 ) ) ( not ( = ?auto_49292 ?auto_49297 ) ) ( not ( = ?auto_49296 ?auto_49297 ) ) ( not ( = ?auto_49294 ?auto_49297 ) ) ( not ( = ?auto_49293 ?auto_49297 ) ) ( not ( = ?auto_49295 ?auto_49297 ) ) ( CLEAR ?auto_49296 ) ( ON ?auto_49292 ?auto_49291 ) ( CLEAR ?auto_49292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49297 ?auto_49291 )
      ( MAKE-2PILE ?auto_49291 ?auto_49292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49298 - BLOCK
      ?auto_49299 - BLOCK
    )
    :vars
    (
      ?auto_49301 - BLOCK
      ?auto_49303 - BLOCK
      ?auto_49304 - BLOCK
      ?auto_49300 - BLOCK
      ?auto_49302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49298 ?auto_49299 ) ) ( not ( = ?auto_49298 ?auto_49301 ) ) ( not ( = ?auto_49299 ?auto_49301 ) ) ( ON-TABLE ?auto_49303 ) ( ON ?auto_49304 ?auto_49303 ) ( ON ?auto_49300 ?auto_49304 ) ( not ( = ?auto_49303 ?auto_49304 ) ) ( not ( = ?auto_49303 ?auto_49300 ) ) ( not ( = ?auto_49303 ?auto_49301 ) ) ( not ( = ?auto_49303 ?auto_49299 ) ) ( not ( = ?auto_49303 ?auto_49298 ) ) ( not ( = ?auto_49304 ?auto_49300 ) ) ( not ( = ?auto_49304 ?auto_49301 ) ) ( not ( = ?auto_49304 ?auto_49299 ) ) ( not ( = ?auto_49304 ?auto_49298 ) ) ( not ( = ?auto_49300 ?auto_49301 ) ) ( not ( = ?auto_49300 ?auto_49299 ) ) ( not ( = ?auto_49300 ?auto_49298 ) ) ( ON ?auto_49298 ?auto_49302 ) ( not ( = ?auto_49298 ?auto_49302 ) ) ( not ( = ?auto_49299 ?auto_49302 ) ) ( not ( = ?auto_49301 ?auto_49302 ) ) ( not ( = ?auto_49303 ?auto_49302 ) ) ( not ( = ?auto_49304 ?auto_49302 ) ) ( not ( = ?auto_49300 ?auto_49302 ) ) ( ON ?auto_49299 ?auto_49298 ) ( CLEAR ?auto_49299 ) ( ON-TABLE ?auto_49302 ) ( HOLDING ?auto_49301 ) ( CLEAR ?auto_49300 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49303 ?auto_49304 ?auto_49300 ?auto_49301 )
      ( MAKE-2PILE ?auto_49298 ?auto_49299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49305 - BLOCK
      ?auto_49306 - BLOCK
    )
    :vars
    (
      ?auto_49311 - BLOCK
      ?auto_49308 - BLOCK
      ?auto_49309 - BLOCK
      ?auto_49310 - BLOCK
      ?auto_49307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49305 ?auto_49306 ) ) ( not ( = ?auto_49305 ?auto_49311 ) ) ( not ( = ?auto_49306 ?auto_49311 ) ) ( ON-TABLE ?auto_49308 ) ( ON ?auto_49309 ?auto_49308 ) ( ON ?auto_49310 ?auto_49309 ) ( not ( = ?auto_49308 ?auto_49309 ) ) ( not ( = ?auto_49308 ?auto_49310 ) ) ( not ( = ?auto_49308 ?auto_49311 ) ) ( not ( = ?auto_49308 ?auto_49306 ) ) ( not ( = ?auto_49308 ?auto_49305 ) ) ( not ( = ?auto_49309 ?auto_49310 ) ) ( not ( = ?auto_49309 ?auto_49311 ) ) ( not ( = ?auto_49309 ?auto_49306 ) ) ( not ( = ?auto_49309 ?auto_49305 ) ) ( not ( = ?auto_49310 ?auto_49311 ) ) ( not ( = ?auto_49310 ?auto_49306 ) ) ( not ( = ?auto_49310 ?auto_49305 ) ) ( ON ?auto_49305 ?auto_49307 ) ( not ( = ?auto_49305 ?auto_49307 ) ) ( not ( = ?auto_49306 ?auto_49307 ) ) ( not ( = ?auto_49311 ?auto_49307 ) ) ( not ( = ?auto_49308 ?auto_49307 ) ) ( not ( = ?auto_49309 ?auto_49307 ) ) ( not ( = ?auto_49310 ?auto_49307 ) ) ( ON ?auto_49306 ?auto_49305 ) ( ON-TABLE ?auto_49307 ) ( CLEAR ?auto_49310 ) ( ON ?auto_49311 ?auto_49306 ) ( CLEAR ?auto_49311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49307 ?auto_49305 ?auto_49306 )
      ( MAKE-2PILE ?auto_49305 ?auto_49306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49312 - BLOCK
      ?auto_49313 - BLOCK
    )
    :vars
    (
      ?auto_49317 - BLOCK
      ?auto_49316 - BLOCK
      ?auto_49314 - BLOCK
      ?auto_49315 - BLOCK
      ?auto_49318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49312 ?auto_49313 ) ) ( not ( = ?auto_49312 ?auto_49317 ) ) ( not ( = ?auto_49313 ?auto_49317 ) ) ( ON-TABLE ?auto_49316 ) ( ON ?auto_49314 ?auto_49316 ) ( not ( = ?auto_49316 ?auto_49314 ) ) ( not ( = ?auto_49316 ?auto_49315 ) ) ( not ( = ?auto_49316 ?auto_49317 ) ) ( not ( = ?auto_49316 ?auto_49313 ) ) ( not ( = ?auto_49316 ?auto_49312 ) ) ( not ( = ?auto_49314 ?auto_49315 ) ) ( not ( = ?auto_49314 ?auto_49317 ) ) ( not ( = ?auto_49314 ?auto_49313 ) ) ( not ( = ?auto_49314 ?auto_49312 ) ) ( not ( = ?auto_49315 ?auto_49317 ) ) ( not ( = ?auto_49315 ?auto_49313 ) ) ( not ( = ?auto_49315 ?auto_49312 ) ) ( ON ?auto_49312 ?auto_49318 ) ( not ( = ?auto_49312 ?auto_49318 ) ) ( not ( = ?auto_49313 ?auto_49318 ) ) ( not ( = ?auto_49317 ?auto_49318 ) ) ( not ( = ?auto_49316 ?auto_49318 ) ) ( not ( = ?auto_49314 ?auto_49318 ) ) ( not ( = ?auto_49315 ?auto_49318 ) ) ( ON ?auto_49313 ?auto_49312 ) ( ON-TABLE ?auto_49318 ) ( ON ?auto_49317 ?auto_49313 ) ( CLEAR ?auto_49317 ) ( HOLDING ?auto_49315 ) ( CLEAR ?auto_49314 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49316 ?auto_49314 ?auto_49315 )
      ( MAKE-2PILE ?auto_49312 ?auto_49313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49319 - BLOCK
      ?auto_49320 - BLOCK
    )
    :vars
    (
      ?auto_49321 - BLOCK
      ?auto_49323 - BLOCK
      ?auto_49322 - BLOCK
      ?auto_49324 - BLOCK
      ?auto_49325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49319 ?auto_49320 ) ) ( not ( = ?auto_49319 ?auto_49321 ) ) ( not ( = ?auto_49320 ?auto_49321 ) ) ( ON-TABLE ?auto_49323 ) ( ON ?auto_49322 ?auto_49323 ) ( not ( = ?auto_49323 ?auto_49322 ) ) ( not ( = ?auto_49323 ?auto_49324 ) ) ( not ( = ?auto_49323 ?auto_49321 ) ) ( not ( = ?auto_49323 ?auto_49320 ) ) ( not ( = ?auto_49323 ?auto_49319 ) ) ( not ( = ?auto_49322 ?auto_49324 ) ) ( not ( = ?auto_49322 ?auto_49321 ) ) ( not ( = ?auto_49322 ?auto_49320 ) ) ( not ( = ?auto_49322 ?auto_49319 ) ) ( not ( = ?auto_49324 ?auto_49321 ) ) ( not ( = ?auto_49324 ?auto_49320 ) ) ( not ( = ?auto_49324 ?auto_49319 ) ) ( ON ?auto_49319 ?auto_49325 ) ( not ( = ?auto_49319 ?auto_49325 ) ) ( not ( = ?auto_49320 ?auto_49325 ) ) ( not ( = ?auto_49321 ?auto_49325 ) ) ( not ( = ?auto_49323 ?auto_49325 ) ) ( not ( = ?auto_49322 ?auto_49325 ) ) ( not ( = ?auto_49324 ?auto_49325 ) ) ( ON ?auto_49320 ?auto_49319 ) ( ON-TABLE ?auto_49325 ) ( ON ?auto_49321 ?auto_49320 ) ( CLEAR ?auto_49322 ) ( ON ?auto_49324 ?auto_49321 ) ( CLEAR ?auto_49324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49325 ?auto_49319 ?auto_49320 ?auto_49321 )
      ( MAKE-2PILE ?auto_49319 ?auto_49320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49326 - BLOCK
      ?auto_49327 - BLOCK
    )
    :vars
    (
      ?auto_49329 - BLOCK
      ?auto_49332 - BLOCK
      ?auto_49328 - BLOCK
      ?auto_49331 - BLOCK
      ?auto_49330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49326 ?auto_49327 ) ) ( not ( = ?auto_49326 ?auto_49329 ) ) ( not ( = ?auto_49327 ?auto_49329 ) ) ( ON-TABLE ?auto_49332 ) ( not ( = ?auto_49332 ?auto_49328 ) ) ( not ( = ?auto_49332 ?auto_49331 ) ) ( not ( = ?auto_49332 ?auto_49329 ) ) ( not ( = ?auto_49332 ?auto_49327 ) ) ( not ( = ?auto_49332 ?auto_49326 ) ) ( not ( = ?auto_49328 ?auto_49331 ) ) ( not ( = ?auto_49328 ?auto_49329 ) ) ( not ( = ?auto_49328 ?auto_49327 ) ) ( not ( = ?auto_49328 ?auto_49326 ) ) ( not ( = ?auto_49331 ?auto_49329 ) ) ( not ( = ?auto_49331 ?auto_49327 ) ) ( not ( = ?auto_49331 ?auto_49326 ) ) ( ON ?auto_49326 ?auto_49330 ) ( not ( = ?auto_49326 ?auto_49330 ) ) ( not ( = ?auto_49327 ?auto_49330 ) ) ( not ( = ?auto_49329 ?auto_49330 ) ) ( not ( = ?auto_49332 ?auto_49330 ) ) ( not ( = ?auto_49328 ?auto_49330 ) ) ( not ( = ?auto_49331 ?auto_49330 ) ) ( ON ?auto_49327 ?auto_49326 ) ( ON-TABLE ?auto_49330 ) ( ON ?auto_49329 ?auto_49327 ) ( ON ?auto_49331 ?auto_49329 ) ( CLEAR ?auto_49331 ) ( HOLDING ?auto_49328 ) ( CLEAR ?auto_49332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49332 ?auto_49328 )
      ( MAKE-2PILE ?auto_49326 ?auto_49327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49333 - BLOCK
      ?auto_49334 - BLOCK
    )
    :vars
    (
      ?auto_49338 - BLOCK
      ?auto_49335 - BLOCK
      ?auto_49336 - BLOCK
      ?auto_49339 - BLOCK
      ?auto_49337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49333 ?auto_49334 ) ) ( not ( = ?auto_49333 ?auto_49338 ) ) ( not ( = ?auto_49334 ?auto_49338 ) ) ( ON-TABLE ?auto_49335 ) ( not ( = ?auto_49335 ?auto_49336 ) ) ( not ( = ?auto_49335 ?auto_49339 ) ) ( not ( = ?auto_49335 ?auto_49338 ) ) ( not ( = ?auto_49335 ?auto_49334 ) ) ( not ( = ?auto_49335 ?auto_49333 ) ) ( not ( = ?auto_49336 ?auto_49339 ) ) ( not ( = ?auto_49336 ?auto_49338 ) ) ( not ( = ?auto_49336 ?auto_49334 ) ) ( not ( = ?auto_49336 ?auto_49333 ) ) ( not ( = ?auto_49339 ?auto_49338 ) ) ( not ( = ?auto_49339 ?auto_49334 ) ) ( not ( = ?auto_49339 ?auto_49333 ) ) ( ON ?auto_49333 ?auto_49337 ) ( not ( = ?auto_49333 ?auto_49337 ) ) ( not ( = ?auto_49334 ?auto_49337 ) ) ( not ( = ?auto_49338 ?auto_49337 ) ) ( not ( = ?auto_49335 ?auto_49337 ) ) ( not ( = ?auto_49336 ?auto_49337 ) ) ( not ( = ?auto_49339 ?auto_49337 ) ) ( ON ?auto_49334 ?auto_49333 ) ( ON-TABLE ?auto_49337 ) ( ON ?auto_49338 ?auto_49334 ) ( ON ?auto_49339 ?auto_49338 ) ( CLEAR ?auto_49335 ) ( ON ?auto_49336 ?auto_49339 ) ( CLEAR ?auto_49336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49337 ?auto_49333 ?auto_49334 ?auto_49338 ?auto_49339 )
      ( MAKE-2PILE ?auto_49333 ?auto_49334 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49340 - BLOCK
      ?auto_49341 - BLOCK
    )
    :vars
    (
      ?auto_49346 - BLOCK
      ?auto_49342 - BLOCK
      ?auto_49344 - BLOCK
      ?auto_49343 - BLOCK
      ?auto_49345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49340 ?auto_49341 ) ) ( not ( = ?auto_49340 ?auto_49346 ) ) ( not ( = ?auto_49341 ?auto_49346 ) ) ( not ( = ?auto_49342 ?auto_49344 ) ) ( not ( = ?auto_49342 ?auto_49343 ) ) ( not ( = ?auto_49342 ?auto_49346 ) ) ( not ( = ?auto_49342 ?auto_49341 ) ) ( not ( = ?auto_49342 ?auto_49340 ) ) ( not ( = ?auto_49344 ?auto_49343 ) ) ( not ( = ?auto_49344 ?auto_49346 ) ) ( not ( = ?auto_49344 ?auto_49341 ) ) ( not ( = ?auto_49344 ?auto_49340 ) ) ( not ( = ?auto_49343 ?auto_49346 ) ) ( not ( = ?auto_49343 ?auto_49341 ) ) ( not ( = ?auto_49343 ?auto_49340 ) ) ( ON ?auto_49340 ?auto_49345 ) ( not ( = ?auto_49340 ?auto_49345 ) ) ( not ( = ?auto_49341 ?auto_49345 ) ) ( not ( = ?auto_49346 ?auto_49345 ) ) ( not ( = ?auto_49342 ?auto_49345 ) ) ( not ( = ?auto_49344 ?auto_49345 ) ) ( not ( = ?auto_49343 ?auto_49345 ) ) ( ON ?auto_49341 ?auto_49340 ) ( ON-TABLE ?auto_49345 ) ( ON ?auto_49346 ?auto_49341 ) ( ON ?auto_49343 ?auto_49346 ) ( ON ?auto_49344 ?auto_49343 ) ( CLEAR ?auto_49344 ) ( HOLDING ?auto_49342 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49342 )
      ( MAKE-2PILE ?auto_49340 ?auto_49341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49347 - BLOCK
      ?auto_49348 - BLOCK
    )
    :vars
    (
      ?auto_49349 - BLOCK
      ?auto_49351 - BLOCK
      ?auto_49353 - BLOCK
      ?auto_49350 - BLOCK
      ?auto_49352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49347 ?auto_49348 ) ) ( not ( = ?auto_49347 ?auto_49349 ) ) ( not ( = ?auto_49348 ?auto_49349 ) ) ( not ( = ?auto_49351 ?auto_49353 ) ) ( not ( = ?auto_49351 ?auto_49350 ) ) ( not ( = ?auto_49351 ?auto_49349 ) ) ( not ( = ?auto_49351 ?auto_49348 ) ) ( not ( = ?auto_49351 ?auto_49347 ) ) ( not ( = ?auto_49353 ?auto_49350 ) ) ( not ( = ?auto_49353 ?auto_49349 ) ) ( not ( = ?auto_49353 ?auto_49348 ) ) ( not ( = ?auto_49353 ?auto_49347 ) ) ( not ( = ?auto_49350 ?auto_49349 ) ) ( not ( = ?auto_49350 ?auto_49348 ) ) ( not ( = ?auto_49350 ?auto_49347 ) ) ( ON ?auto_49347 ?auto_49352 ) ( not ( = ?auto_49347 ?auto_49352 ) ) ( not ( = ?auto_49348 ?auto_49352 ) ) ( not ( = ?auto_49349 ?auto_49352 ) ) ( not ( = ?auto_49351 ?auto_49352 ) ) ( not ( = ?auto_49353 ?auto_49352 ) ) ( not ( = ?auto_49350 ?auto_49352 ) ) ( ON ?auto_49348 ?auto_49347 ) ( ON-TABLE ?auto_49352 ) ( ON ?auto_49349 ?auto_49348 ) ( ON ?auto_49350 ?auto_49349 ) ( ON ?auto_49353 ?auto_49350 ) ( ON ?auto_49351 ?auto_49353 ) ( CLEAR ?auto_49351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49352 ?auto_49347 ?auto_49348 ?auto_49349 ?auto_49350 ?auto_49353 )
      ( MAKE-2PILE ?auto_49347 ?auto_49348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49357 - BLOCK
      ?auto_49358 - BLOCK
      ?auto_49359 - BLOCK
    )
    :vars
    (
      ?auto_49360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49360 ?auto_49359 ) ( CLEAR ?auto_49360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49357 ) ( ON ?auto_49358 ?auto_49357 ) ( ON ?auto_49359 ?auto_49358 ) ( not ( = ?auto_49357 ?auto_49358 ) ) ( not ( = ?auto_49357 ?auto_49359 ) ) ( not ( = ?auto_49357 ?auto_49360 ) ) ( not ( = ?auto_49358 ?auto_49359 ) ) ( not ( = ?auto_49358 ?auto_49360 ) ) ( not ( = ?auto_49359 ?auto_49360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49360 ?auto_49359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49361 - BLOCK
      ?auto_49362 - BLOCK
      ?auto_49363 - BLOCK
    )
    :vars
    (
      ?auto_49364 - BLOCK
      ?auto_49365 - BLOCK
      ?auto_49366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49364 ?auto_49363 ) ( CLEAR ?auto_49364 ) ( ON-TABLE ?auto_49361 ) ( ON ?auto_49362 ?auto_49361 ) ( ON ?auto_49363 ?auto_49362 ) ( not ( = ?auto_49361 ?auto_49362 ) ) ( not ( = ?auto_49361 ?auto_49363 ) ) ( not ( = ?auto_49361 ?auto_49364 ) ) ( not ( = ?auto_49362 ?auto_49363 ) ) ( not ( = ?auto_49362 ?auto_49364 ) ) ( not ( = ?auto_49363 ?auto_49364 ) ) ( HOLDING ?auto_49365 ) ( CLEAR ?auto_49366 ) ( not ( = ?auto_49361 ?auto_49365 ) ) ( not ( = ?auto_49361 ?auto_49366 ) ) ( not ( = ?auto_49362 ?auto_49365 ) ) ( not ( = ?auto_49362 ?auto_49366 ) ) ( not ( = ?auto_49363 ?auto_49365 ) ) ( not ( = ?auto_49363 ?auto_49366 ) ) ( not ( = ?auto_49364 ?auto_49365 ) ) ( not ( = ?auto_49364 ?auto_49366 ) ) ( not ( = ?auto_49365 ?auto_49366 ) ) )
    :subtasks
    ( ( !STACK ?auto_49365 ?auto_49366 )
      ( MAKE-3PILE ?auto_49361 ?auto_49362 ?auto_49363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49367 - BLOCK
      ?auto_49368 - BLOCK
      ?auto_49369 - BLOCK
    )
    :vars
    (
      ?auto_49372 - BLOCK
      ?auto_49370 - BLOCK
      ?auto_49371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49372 ?auto_49369 ) ( ON-TABLE ?auto_49367 ) ( ON ?auto_49368 ?auto_49367 ) ( ON ?auto_49369 ?auto_49368 ) ( not ( = ?auto_49367 ?auto_49368 ) ) ( not ( = ?auto_49367 ?auto_49369 ) ) ( not ( = ?auto_49367 ?auto_49372 ) ) ( not ( = ?auto_49368 ?auto_49369 ) ) ( not ( = ?auto_49368 ?auto_49372 ) ) ( not ( = ?auto_49369 ?auto_49372 ) ) ( CLEAR ?auto_49370 ) ( not ( = ?auto_49367 ?auto_49371 ) ) ( not ( = ?auto_49367 ?auto_49370 ) ) ( not ( = ?auto_49368 ?auto_49371 ) ) ( not ( = ?auto_49368 ?auto_49370 ) ) ( not ( = ?auto_49369 ?auto_49371 ) ) ( not ( = ?auto_49369 ?auto_49370 ) ) ( not ( = ?auto_49372 ?auto_49371 ) ) ( not ( = ?auto_49372 ?auto_49370 ) ) ( not ( = ?auto_49371 ?auto_49370 ) ) ( ON ?auto_49371 ?auto_49372 ) ( CLEAR ?auto_49371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49367 ?auto_49368 ?auto_49369 ?auto_49372 )
      ( MAKE-3PILE ?auto_49367 ?auto_49368 ?auto_49369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49373 - BLOCK
      ?auto_49374 - BLOCK
      ?auto_49375 - BLOCK
    )
    :vars
    (
      ?auto_49377 - BLOCK
      ?auto_49378 - BLOCK
      ?auto_49376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49377 ?auto_49375 ) ( ON-TABLE ?auto_49373 ) ( ON ?auto_49374 ?auto_49373 ) ( ON ?auto_49375 ?auto_49374 ) ( not ( = ?auto_49373 ?auto_49374 ) ) ( not ( = ?auto_49373 ?auto_49375 ) ) ( not ( = ?auto_49373 ?auto_49377 ) ) ( not ( = ?auto_49374 ?auto_49375 ) ) ( not ( = ?auto_49374 ?auto_49377 ) ) ( not ( = ?auto_49375 ?auto_49377 ) ) ( not ( = ?auto_49373 ?auto_49378 ) ) ( not ( = ?auto_49373 ?auto_49376 ) ) ( not ( = ?auto_49374 ?auto_49378 ) ) ( not ( = ?auto_49374 ?auto_49376 ) ) ( not ( = ?auto_49375 ?auto_49378 ) ) ( not ( = ?auto_49375 ?auto_49376 ) ) ( not ( = ?auto_49377 ?auto_49378 ) ) ( not ( = ?auto_49377 ?auto_49376 ) ) ( not ( = ?auto_49378 ?auto_49376 ) ) ( ON ?auto_49378 ?auto_49377 ) ( CLEAR ?auto_49378 ) ( HOLDING ?auto_49376 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49376 )
      ( MAKE-3PILE ?auto_49373 ?auto_49374 ?auto_49375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49379 - BLOCK
      ?auto_49380 - BLOCK
      ?auto_49381 - BLOCK
    )
    :vars
    (
      ?auto_49382 - BLOCK
      ?auto_49384 - BLOCK
      ?auto_49383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49382 ?auto_49381 ) ( ON-TABLE ?auto_49379 ) ( ON ?auto_49380 ?auto_49379 ) ( ON ?auto_49381 ?auto_49380 ) ( not ( = ?auto_49379 ?auto_49380 ) ) ( not ( = ?auto_49379 ?auto_49381 ) ) ( not ( = ?auto_49379 ?auto_49382 ) ) ( not ( = ?auto_49380 ?auto_49381 ) ) ( not ( = ?auto_49380 ?auto_49382 ) ) ( not ( = ?auto_49381 ?auto_49382 ) ) ( not ( = ?auto_49379 ?auto_49384 ) ) ( not ( = ?auto_49379 ?auto_49383 ) ) ( not ( = ?auto_49380 ?auto_49384 ) ) ( not ( = ?auto_49380 ?auto_49383 ) ) ( not ( = ?auto_49381 ?auto_49384 ) ) ( not ( = ?auto_49381 ?auto_49383 ) ) ( not ( = ?auto_49382 ?auto_49384 ) ) ( not ( = ?auto_49382 ?auto_49383 ) ) ( not ( = ?auto_49384 ?auto_49383 ) ) ( ON ?auto_49384 ?auto_49382 ) ( ON ?auto_49383 ?auto_49384 ) ( CLEAR ?auto_49383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49379 ?auto_49380 ?auto_49381 ?auto_49382 ?auto_49384 )
      ( MAKE-3PILE ?auto_49379 ?auto_49380 ?auto_49381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49385 - BLOCK
      ?auto_49386 - BLOCK
      ?auto_49387 - BLOCK
    )
    :vars
    (
      ?auto_49389 - BLOCK
      ?auto_49388 - BLOCK
      ?auto_49390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49389 ?auto_49387 ) ( ON-TABLE ?auto_49385 ) ( ON ?auto_49386 ?auto_49385 ) ( ON ?auto_49387 ?auto_49386 ) ( not ( = ?auto_49385 ?auto_49386 ) ) ( not ( = ?auto_49385 ?auto_49387 ) ) ( not ( = ?auto_49385 ?auto_49389 ) ) ( not ( = ?auto_49386 ?auto_49387 ) ) ( not ( = ?auto_49386 ?auto_49389 ) ) ( not ( = ?auto_49387 ?auto_49389 ) ) ( not ( = ?auto_49385 ?auto_49388 ) ) ( not ( = ?auto_49385 ?auto_49390 ) ) ( not ( = ?auto_49386 ?auto_49388 ) ) ( not ( = ?auto_49386 ?auto_49390 ) ) ( not ( = ?auto_49387 ?auto_49388 ) ) ( not ( = ?auto_49387 ?auto_49390 ) ) ( not ( = ?auto_49389 ?auto_49388 ) ) ( not ( = ?auto_49389 ?auto_49390 ) ) ( not ( = ?auto_49388 ?auto_49390 ) ) ( ON ?auto_49388 ?auto_49389 ) ( HOLDING ?auto_49390 ) ( CLEAR ?auto_49388 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49385 ?auto_49386 ?auto_49387 ?auto_49389 ?auto_49388 ?auto_49390 )
      ( MAKE-3PILE ?auto_49385 ?auto_49386 ?auto_49387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49391 - BLOCK
      ?auto_49392 - BLOCK
      ?auto_49393 - BLOCK
    )
    :vars
    (
      ?auto_49394 - BLOCK
      ?auto_49396 - BLOCK
      ?auto_49395 - BLOCK
      ?auto_49397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49394 ?auto_49393 ) ( ON-TABLE ?auto_49391 ) ( ON ?auto_49392 ?auto_49391 ) ( ON ?auto_49393 ?auto_49392 ) ( not ( = ?auto_49391 ?auto_49392 ) ) ( not ( = ?auto_49391 ?auto_49393 ) ) ( not ( = ?auto_49391 ?auto_49394 ) ) ( not ( = ?auto_49392 ?auto_49393 ) ) ( not ( = ?auto_49392 ?auto_49394 ) ) ( not ( = ?auto_49393 ?auto_49394 ) ) ( not ( = ?auto_49391 ?auto_49396 ) ) ( not ( = ?auto_49391 ?auto_49395 ) ) ( not ( = ?auto_49392 ?auto_49396 ) ) ( not ( = ?auto_49392 ?auto_49395 ) ) ( not ( = ?auto_49393 ?auto_49396 ) ) ( not ( = ?auto_49393 ?auto_49395 ) ) ( not ( = ?auto_49394 ?auto_49396 ) ) ( not ( = ?auto_49394 ?auto_49395 ) ) ( not ( = ?auto_49396 ?auto_49395 ) ) ( ON ?auto_49396 ?auto_49394 ) ( CLEAR ?auto_49396 ) ( ON ?auto_49395 ?auto_49397 ) ( CLEAR ?auto_49395 ) ( HAND-EMPTY ) ( not ( = ?auto_49391 ?auto_49397 ) ) ( not ( = ?auto_49392 ?auto_49397 ) ) ( not ( = ?auto_49393 ?auto_49397 ) ) ( not ( = ?auto_49394 ?auto_49397 ) ) ( not ( = ?auto_49396 ?auto_49397 ) ) ( not ( = ?auto_49395 ?auto_49397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49395 ?auto_49397 )
      ( MAKE-3PILE ?auto_49391 ?auto_49392 ?auto_49393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49398 - BLOCK
      ?auto_49399 - BLOCK
      ?auto_49400 - BLOCK
    )
    :vars
    (
      ?auto_49401 - BLOCK
      ?auto_49402 - BLOCK
      ?auto_49404 - BLOCK
      ?auto_49403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49401 ?auto_49400 ) ( ON-TABLE ?auto_49398 ) ( ON ?auto_49399 ?auto_49398 ) ( ON ?auto_49400 ?auto_49399 ) ( not ( = ?auto_49398 ?auto_49399 ) ) ( not ( = ?auto_49398 ?auto_49400 ) ) ( not ( = ?auto_49398 ?auto_49401 ) ) ( not ( = ?auto_49399 ?auto_49400 ) ) ( not ( = ?auto_49399 ?auto_49401 ) ) ( not ( = ?auto_49400 ?auto_49401 ) ) ( not ( = ?auto_49398 ?auto_49402 ) ) ( not ( = ?auto_49398 ?auto_49404 ) ) ( not ( = ?auto_49399 ?auto_49402 ) ) ( not ( = ?auto_49399 ?auto_49404 ) ) ( not ( = ?auto_49400 ?auto_49402 ) ) ( not ( = ?auto_49400 ?auto_49404 ) ) ( not ( = ?auto_49401 ?auto_49402 ) ) ( not ( = ?auto_49401 ?auto_49404 ) ) ( not ( = ?auto_49402 ?auto_49404 ) ) ( ON ?auto_49404 ?auto_49403 ) ( CLEAR ?auto_49404 ) ( not ( = ?auto_49398 ?auto_49403 ) ) ( not ( = ?auto_49399 ?auto_49403 ) ) ( not ( = ?auto_49400 ?auto_49403 ) ) ( not ( = ?auto_49401 ?auto_49403 ) ) ( not ( = ?auto_49402 ?auto_49403 ) ) ( not ( = ?auto_49404 ?auto_49403 ) ) ( HOLDING ?auto_49402 ) ( CLEAR ?auto_49401 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49398 ?auto_49399 ?auto_49400 ?auto_49401 ?auto_49402 )
      ( MAKE-3PILE ?auto_49398 ?auto_49399 ?auto_49400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49405 - BLOCK
      ?auto_49406 - BLOCK
      ?auto_49407 - BLOCK
    )
    :vars
    (
      ?auto_49411 - BLOCK
      ?auto_49409 - BLOCK
      ?auto_49408 - BLOCK
      ?auto_49410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49411 ?auto_49407 ) ( ON-TABLE ?auto_49405 ) ( ON ?auto_49406 ?auto_49405 ) ( ON ?auto_49407 ?auto_49406 ) ( not ( = ?auto_49405 ?auto_49406 ) ) ( not ( = ?auto_49405 ?auto_49407 ) ) ( not ( = ?auto_49405 ?auto_49411 ) ) ( not ( = ?auto_49406 ?auto_49407 ) ) ( not ( = ?auto_49406 ?auto_49411 ) ) ( not ( = ?auto_49407 ?auto_49411 ) ) ( not ( = ?auto_49405 ?auto_49409 ) ) ( not ( = ?auto_49405 ?auto_49408 ) ) ( not ( = ?auto_49406 ?auto_49409 ) ) ( not ( = ?auto_49406 ?auto_49408 ) ) ( not ( = ?auto_49407 ?auto_49409 ) ) ( not ( = ?auto_49407 ?auto_49408 ) ) ( not ( = ?auto_49411 ?auto_49409 ) ) ( not ( = ?auto_49411 ?auto_49408 ) ) ( not ( = ?auto_49409 ?auto_49408 ) ) ( ON ?auto_49408 ?auto_49410 ) ( not ( = ?auto_49405 ?auto_49410 ) ) ( not ( = ?auto_49406 ?auto_49410 ) ) ( not ( = ?auto_49407 ?auto_49410 ) ) ( not ( = ?auto_49411 ?auto_49410 ) ) ( not ( = ?auto_49409 ?auto_49410 ) ) ( not ( = ?auto_49408 ?auto_49410 ) ) ( CLEAR ?auto_49411 ) ( ON ?auto_49409 ?auto_49408 ) ( CLEAR ?auto_49409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49410 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49410 ?auto_49408 )
      ( MAKE-3PILE ?auto_49405 ?auto_49406 ?auto_49407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49426 - BLOCK
      ?auto_49427 - BLOCK
      ?auto_49428 - BLOCK
    )
    :vars
    (
      ?auto_49429 - BLOCK
      ?auto_49431 - BLOCK
      ?auto_49432 - BLOCK
      ?auto_49430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49426 ) ( ON ?auto_49427 ?auto_49426 ) ( not ( = ?auto_49426 ?auto_49427 ) ) ( not ( = ?auto_49426 ?auto_49428 ) ) ( not ( = ?auto_49426 ?auto_49429 ) ) ( not ( = ?auto_49427 ?auto_49428 ) ) ( not ( = ?auto_49427 ?auto_49429 ) ) ( not ( = ?auto_49428 ?auto_49429 ) ) ( not ( = ?auto_49426 ?auto_49431 ) ) ( not ( = ?auto_49426 ?auto_49432 ) ) ( not ( = ?auto_49427 ?auto_49431 ) ) ( not ( = ?auto_49427 ?auto_49432 ) ) ( not ( = ?auto_49428 ?auto_49431 ) ) ( not ( = ?auto_49428 ?auto_49432 ) ) ( not ( = ?auto_49429 ?auto_49431 ) ) ( not ( = ?auto_49429 ?auto_49432 ) ) ( not ( = ?auto_49431 ?auto_49432 ) ) ( ON ?auto_49432 ?auto_49430 ) ( not ( = ?auto_49426 ?auto_49430 ) ) ( not ( = ?auto_49427 ?auto_49430 ) ) ( not ( = ?auto_49428 ?auto_49430 ) ) ( not ( = ?auto_49429 ?auto_49430 ) ) ( not ( = ?auto_49431 ?auto_49430 ) ) ( not ( = ?auto_49432 ?auto_49430 ) ) ( ON ?auto_49431 ?auto_49432 ) ( ON-TABLE ?auto_49430 ) ( ON ?auto_49429 ?auto_49431 ) ( CLEAR ?auto_49429 ) ( HOLDING ?auto_49428 ) ( CLEAR ?auto_49427 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49426 ?auto_49427 ?auto_49428 ?auto_49429 )
      ( MAKE-3PILE ?auto_49426 ?auto_49427 ?auto_49428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49433 - BLOCK
      ?auto_49434 - BLOCK
      ?auto_49435 - BLOCK
    )
    :vars
    (
      ?auto_49438 - BLOCK
      ?auto_49436 - BLOCK
      ?auto_49439 - BLOCK
      ?auto_49437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49433 ) ( ON ?auto_49434 ?auto_49433 ) ( not ( = ?auto_49433 ?auto_49434 ) ) ( not ( = ?auto_49433 ?auto_49435 ) ) ( not ( = ?auto_49433 ?auto_49438 ) ) ( not ( = ?auto_49434 ?auto_49435 ) ) ( not ( = ?auto_49434 ?auto_49438 ) ) ( not ( = ?auto_49435 ?auto_49438 ) ) ( not ( = ?auto_49433 ?auto_49436 ) ) ( not ( = ?auto_49433 ?auto_49439 ) ) ( not ( = ?auto_49434 ?auto_49436 ) ) ( not ( = ?auto_49434 ?auto_49439 ) ) ( not ( = ?auto_49435 ?auto_49436 ) ) ( not ( = ?auto_49435 ?auto_49439 ) ) ( not ( = ?auto_49438 ?auto_49436 ) ) ( not ( = ?auto_49438 ?auto_49439 ) ) ( not ( = ?auto_49436 ?auto_49439 ) ) ( ON ?auto_49439 ?auto_49437 ) ( not ( = ?auto_49433 ?auto_49437 ) ) ( not ( = ?auto_49434 ?auto_49437 ) ) ( not ( = ?auto_49435 ?auto_49437 ) ) ( not ( = ?auto_49438 ?auto_49437 ) ) ( not ( = ?auto_49436 ?auto_49437 ) ) ( not ( = ?auto_49439 ?auto_49437 ) ) ( ON ?auto_49436 ?auto_49439 ) ( ON-TABLE ?auto_49437 ) ( ON ?auto_49438 ?auto_49436 ) ( CLEAR ?auto_49434 ) ( ON ?auto_49435 ?auto_49438 ) ( CLEAR ?auto_49435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49437 ?auto_49439 ?auto_49436 ?auto_49438 )
      ( MAKE-3PILE ?auto_49433 ?auto_49434 ?auto_49435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49440 - BLOCK
      ?auto_49441 - BLOCK
      ?auto_49442 - BLOCK
    )
    :vars
    (
      ?auto_49444 - BLOCK
      ?auto_49445 - BLOCK
      ?auto_49443 - BLOCK
      ?auto_49446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49440 ) ( not ( = ?auto_49440 ?auto_49441 ) ) ( not ( = ?auto_49440 ?auto_49442 ) ) ( not ( = ?auto_49440 ?auto_49444 ) ) ( not ( = ?auto_49441 ?auto_49442 ) ) ( not ( = ?auto_49441 ?auto_49444 ) ) ( not ( = ?auto_49442 ?auto_49444 ) ) ( not ( = ?auto_49440 ?auto_49445 ) ) ( not ( = ?auto_49440 ?auto_49443 ) ) ( not ( = ?auto_49441 ?auto_49445 ) ) ( not ( = ?auto_49441 ?auto_49443 ) ) ( not ( = ?auto_49442 ?auto_49445 ) ) ( not ( = ?auto_49442 ?auto_49443 ) ) ( not ( = ?auto_49444 ?auto_49445 ) ) ( not ( = ?auto_49444 ?auto_49443 ) ) ( not ( = ?auto_49445 ?auto_49443 ) ) ( ON ?auto_49443 ?auto_49446 ) ( not ( = ?auto_49440 ?auto_49446 ) ) ( not ( = ?auto_49441 ?auto_49446 ) ) ( not ( = ?auto_49442 ?auto_49446 ) ) ( not ( = ?auto_49444 ?auto_49446 ) ) ( not ( = ?auto_49445 ?auto_49446 ) ) ( not ( = ?auto_49443 ?auto_49446 ) ) ( ON ?auto_49445 ?auto_49443 ) ( ON-TABLE ?auto_49446 ) ( ON ?auto_49444 ?auto_49445 ) ( ON ?auto_49442 ?auto_49444 ) ( CLEAR ?auto_49442 ) ( HOLDING ?auto_49441 ) ( CLEAR ?auto_49440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49440 ?auto_49441 )
      ( MAKE-3PILE ?auto_49440 ?auto_49441 ?auto_49442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49447 - BLOCK
      ?auto_49448 - BLOCK
      ?auto_49449 - BLOCK
    )
    :vars
    (
      ?auto_49453 - BLOCK
      ?auto_49452 - BLOCK
      ?auto_49450 - BLOCK
      ?auto_49451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49447 ) ( not ( = ?auto_49447 ?auto_49448 ) ) ( not ( = ?auto_49447 ?auto_49449 ) ) ( not ( = ?auto_49447 ?auto_49453 ) ) ( not ( = ?auto_49448 ?auto_49449 ) ) ( not ( = ?auto_49448 ?auto_49453 ) ) ( not ( = ?auto_49449 ?auto_49453 ) ) ( not ( = ?auto_49447 ?auto_49452 ) ) ( not ( = ?auto_49447 ?auto_49450 ) ) ( not ( = ?auto_49448 ?auto_49452 ) ) ( not ( = ?auto_49448 ?auto_49450 ) ) ( not ( = ?auto_49449 ?auto_49452 ) ) ( not ( = ?auto_49449 ?auto_49450 ) ) ( not ( = ?auto_49453 ?auto_49452 ) ) ( not ( = ?auto_49453 ?auto_49450 ) ) ( not ( = ?auto_49452 ?auto_49450 ) ) ( ON ?auto_49450 ?auto_49451 ) ( not ( = ?auto_49447 ?auto_49451 ) ) ( not ( = ?auto_49448 ?auto_49451 ) ) ( not ( = ?auto_49449 ?auto_49451 ) ) ( not ( = ?auto_49453 ?auto_49451 ) ) ( not ( = ?auto_49452 ?auto_49451 ) ) ( not ( = ?auto_49450 ?auto_49451 ) ) ( ON ?auto_49452 ?auto_49450 ) ( ON-TABLE ?auto_49451 ) ( ON ?auto_49453 ?auto_49452 ) ( ON ?auto_49449 ?auto_49453 ) ( CLEAR ?auto_49447 ) ( ON ?auto_49448 ?auto_49449 ) ( CLEAR ?auto_49448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49451 ?auto_49450 ?auto_49452 ?auto_49453 ?auto_49449 )
      ( MAKE-3PILE ?auto_49447 ?auto_49448 ?auto_49449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49454 - BLOCK
      ?auto_49455 - BLOCK
      ?auto_49456 - BLOCK
    )
    :vars
    (
      ?auto_49457 - BLOCK
      ?auto_49458 - BLOCK
      ?auto_49460 - BLOCK
      ?auto_49459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49454 ?auto_49455 ) ) ( not ( = ?auto_49454 ?auto_49456 ) ) ( not ( = ?auto_49454 ?auto_49457 ) ) ( not ( = ?auto_49455 ?auto_49456 ) ) ( not ( = ?auto_49455 ?auto_49457 ) ) ( not ( = ?auto_49456 ?auto_49457 ) ) ( not ( = ?auto_49454 ?auto_49458 ) ) ( not ( = ?auto_49454 ?auto_49460 ) ) ( not ( = ?auto_49455 ?auto_49458 ) ) ( not ( = ?auto_49455 ?auto_49460 ) ) ( not ( = ?auto_49456 ?auto_49458 ) ) ( not ( = ?auto_49456 ?auto_49460 ) ) ( not ( = ?auto_49457 ?auto_49458 ) ) ( not ( = ?auto_49457 ?auto_49460 ) ) ( not ( = ?auto_49458 ?auto_49460 ) ) ( ON ?auto_49460 ?auto_49459 ) ( not ( = ?auto_49454 ?auto_49459 ) ) ( not ( = ?auto_49455 ?auto_49459 ) ) ( not ( = ?auto_49456 ?auto_49459 ) ) ( not ( = ?auto_49457 ?auto_49459 ) ) ( not ( = ?auto_49458 ?auto_49459 ) ) ( not ( = ?auto_49460 ?auto_49459 ) ) ( ON ?auto_49458 ?auto_49460 ) ( ON-TABLE ?auto_49459 ) ( ON ?auto_49457 ?auto_49458 ) ( ON ?auto_49456 ?auto_49457 ) ( ON ?auto_49455 ?auto_49456 ) ( CLEAR ?auto_49455 ) ( HOLDING ?auto_49454 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49454 )
      ( MAKE-3PILE ?auto_49454 ?auto_49455 ?auto_49456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49461 - BLOCK
      ?auto_49462 - BLOCK
      ?auto_49463 - BLOCK
    )
    :vars
    (
      ?auto_49466 - BLOCK
      ?auto_49465 - BLOCK
      ?auto_49464 - BLOCK
      ?auto_49467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49461 ?auto_49462 ) ) ( not ( = ?auto_49461 ?auto_49463 ) ) ( not ( = ?auto_49461 ?auto_49466 ) ) ( not ( = ?auto_49462 ?auto_49463 ) ) ( not ( = ?auto_49462 ?auto_49466 ) ) ( not ( = ?auto_49463 ?auto_49466 ) ) ( not ( = ?auto_49461 ?auto_49465 ) ) ( not ( = ?auto_49461 ?auto_49464 ) ) ( not ( = ?auto_49462 ?auto_49465 ) ) ( not ( = ?auto_49462 ?auto_49464 ) ) ( not ( = ?auto_49463 ?auto_49465 ) ) ( not ( = ?auto_49463 ?auto_49464 ) ) ( not ( = ?auto_49466 ?auto_49465 ) ) ( not ( = ?auto_49466 ?auto_49464 ) ) ( not ( = ?auto_49465 ?auto_49464 ) ) ( ON ?auto_49464 ?auto_49467 ) ( not ( = ?auto_49461 ?auto_49467 ) ) ( not ( = ?auto_49462 ?auto_49467 ) ) ( not ( = ?auto_49463 ?auto_49467 ) ) ( not ( = ?auto_49466 ?auto_49467 ) ) ( not ( = ?auto_49465 ?auto_49467 ) ) ( not ( = ?auto_49464 ?auto_49467 ) ) ( ON ?auto_49465 ?auto_49464 ) ( ON-TABLE ?auto_49467 ) ( ON ?auto_49466 ?auto_49465 ) ( ON ?auto_49463 ?auto_49466 ) ( ON ?auto_49462 ?auto_49463 ) ( ON ?auto_49461 ?auto_49462 ) ( CLEAR ?auto_49461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49467 ?auto_49464 ?auto_49465 ?auto_49466 ?auto_49463 ?auto_49462 )
      ( MAKE-3PILE ?auto_49461 ?auto_49462 ?auto_49463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49471 - BLOCK
      ?auto_49472 - BLOCK
      ?auto_49473 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49473 ) ( CLEAR ?auto_49472 ) ( ON-TABLE ?auto_49471 ) ( ON ?auto_49472 ?auto_49471 ) ( not ( = ?auto_49471 ?auto_49472 ) ) ( not ( = ?auto_49471 ?auto_49473 ) ) ( not ( = ?auto_49472 ?auto_49473 ) ) )
    :subtasks
    ( ( !STACK ?auto_49473 ?auto_49472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49474 - BLOCK
      ?auto_49475 - BLOCK
      ?auto_49476 - BLOCK
    )
    :vars
    (
      ?auto_49477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49475 ) ( ON-TABLE ?auto_49474 ) ( ON ?auto_49475 ?auto_49474 ) ( not ( = ?auto_49474 ?auto_49475 ) ) ( not ( = ?auto_49474 ?auto_49476 ) ) ( not ( = ?auto_49475 ?auto_49476 ) ) ( ON ?auto_49476 ?auto_49477 ) ( CLEAR ?auto_49476 ) ( HAND-EMPTY ) ( not ( = ?auto_49474 ?auto_49477 ) ) ( not ( = ?auto_49475 ?auto_49477 ) ) ( not ( = ?auto_49476 ?auto_49477 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49476 ?auto_49477 )
      ( MAKE-3PILE ?auto_49474 ?auto_49475 ?auto_49476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49478 - BLOCK
      ?auto_49479 - BLOCK
      ?auto_49480 - BLOCK
    )
    :vars
    (
      ?auto_49481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49478 ) ( not ( = ?auto_49478 ?auto_49479 ) ) ( not ( = ?auto_49478 ?auto_49480 ) ) ( not ( = ?auto_49479 ?auto_49480 ) ) ( ON ?auto_49480 ?auto_49481 ) ( CLEAR ?auto_49480 ) ( not ( = ?auto_49478 ?auto_49481 ) ) ( not ( = ?auto_49479 ?auto_49481 ) ) ( not ( = ?auto_49480 ?auto_49481 ) ) ( HOLDING ?auto_49479 ) ( CLEAR ?auto_49478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49478 ?auto_49479 )
      ( MAKE-3PILE ?auto_49478 ?auto_49479 ?auto_49480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49482 - BLOCK
      ?auto_49483 - BLOCK
      ?auto_49484 - BLOCK
    )
    :vars
    (
      ?auto_49485 - BLOCK
      ?auto_49486 - BLOCK
      ?auto_49487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49482 ) ( not ( = ?auto_49482 ?auto_49483 ) ) ( not ( = ?auto_49482 ?auto_49484 ) ) ( not ( = ?auto_49483 ?auto_49484 ) ) ( ON ?auto_49484 ?auto_49485 ) ( not ( = ?auto_49482 ?auto_49485 ) ) ( not ( = ?auto_49483 ?auto_49485 ) ) ( not ( = ?auto_49484 ?auto_49485 ) ) ( CLEAR ?auto_49482 ) ( ON ?auto_49483 ?auto_49484 ) ( CLEAR ?auto_49483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49486 ) ( ON ?auto_49487 ?auto_49486 ) ( ON ?auto_49485 ?auto_49487 ) ( not ( = ?auto_49486 ?auto_49487 ) ) ( not ( = ?auto_49486 ?auto_49485 ) ) ( not ( = ?auto_49486 ?auto_49484 ) ) ( not ( = ?auto_49486 ?auto_49483 ) ) ( not ( = ?auto_49487 ?auto_49485 ) ) ( not ( = ?auto_49487 ?auto_49484 ) ) ( not ( = ?auto_49487 ?auto_49483 ) ) ( not ( = ?auto_49482 ?auto_49486 ) ) ( not ( = ?auto_49482 ?auto_49487 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49486 ?auto_49487 ?auto_49485 ?auto_49484 )
      ( MAKE-3PILE ?auto_49482 ?auto_49483 ?auto_49484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49488 - BLOCK
      ?auto_49489 - BLOCK
      ?auto_49490 - BLOCK
    )
    :vars
    (
      ?auto_49493 - BLOCK
      ?auto_49491 - BLOCK
      ?auto_49492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49488 ?auto_49489 ) ) ( not ( = ?auto_49488 ?auto_49490 ) ) ( not ( = ?auto_49489 ?auto_49490 ) ) ( ON ?auto_49490 ?auto_49493 ) ( not ( = ?auto_49488 ?auto_49493 ) ) ( not ( = ?auto_49489 ?auto_49493 ) ) ( not ( = ?auto_49490 ?auto_49493 ) ) ( ON ?auto_49489 ?auto_49490 ) ( CLEAR ?auto_49489 ) ( ON-TABLE ?auto_49491 ) ( ON ?auto_49492 ?auto_49491 ) ( ON ?auto_49493 ?auto_49492 ) ( not ( = ?auto_49491 ?auto_49492 ) ) ( not ( = ?auto_49491 ?auto_49493 ) ) ( not ( = ?auto_49491 ?auto_49490 ) ) ( not ( = ?auto_49491 ?auto_49489 ) ) ( not ( = ?auto_49492 ?auto_49493 ) ) ( not ( = ?auto_49492 ?auto_49490 ) ) ( not ( = ?auto_49492 ?auto_49489 ) ) ( not ( = ?auto_49488 ?auto_49491 ) ) ( not ( = ?auto_49488 ?auto_49492 ) ) ( HOLDING ?auto_49488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49488 )
      ( MAKE-3PILE ?auto_49488 ?auto_49489 ?auto_49490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49494 - BLOCK
      ?auto_49495 - BLOCK
      ?auto_49496 - BLOCK
    )
    :vars
    (
      ?auto_49497 - BLOCK
      ?auto_49499 - BLOCK
      ?auto_49498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49494 ?auto_49495 ) ) ( not ( = ?auto_49494 ?auto_49496 ) ) ( not ( = ?auto_49495 ?auto_49496 ) ) ( ON ?auto_49496 ?auto_49497 ) ( not ( = ?auto_49494 ?auto_49497 ) ) ( not ( = ?auto_49495 ?auto_49497 ) ) ( not ( = ?auto_49496 ?auto_49497 ) ) ( ON ?auto_49495 ?auto_49496 ) ( ON-TABLE ?auto_49499 ) ( ON ?auto_49498 ?auto_49499 ) ( ON ?auto_49497 ?auto_49498 ) ( not ( = ?auto_49499 ?auto_49498 ) ) ( not ( = ?auto_49499 ?auto_49497 ) ) ( not ( = ?auto_49499 ?auto_49496 ) ) ( not ( = ?auto_49499 ?auto_49495 ) ) ( not ( = ?auto_49498 ?auto_49497 ) ) ( not ( = ?auto_49498 ?auto_49496 ) ) ( not ( = ?auto_49498 ?auto_49495 ) ) ( not ( = ?auto_49494 ?auto_49499 ) ) ( not ( = ?auto_49494 ?auto_49498 ) ) ( ON ?auto_49494 ?auto_49495 ) ( CLEAR ?auto_49494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49499 ?auto_49498 ?auto_49497 ?auto_49496 ?auto_49495 )
      ( MAKE-3PILE ?auto_49494 ?auto_49495 ?auto_49496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49500 - BLOCK
      ?auto_49501 - BLOCK
      ?auto_49502 - BLOCK
    )
    :vars
    (
      ?auto_49503 - BLOCK
      ?auto_49504 - BLOCK
      ?auto_49505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49500 ?auto_49501 ) ) ( not ( = ?auto_49500 ?auto_49502 ) ) ( not ( = ?auto_49501 ?auto_49502 ) ) ( ON ?auto_49502 ?auto_49503 ) ( not ( = ?auto_49500 ?auto_49503 ) ) ( not ( = ?auto_49501 ?auto_49503 ) ) ( not ( = ?auto_49502 ?auto_49503 ) ) ( ON ?auto_49501 ?auto_49502 ) ( ON-TABLE ?auto_49504 ) ( ON ?auto_49505 ?auto_49504 ) ( ON ?auto_49503 ?auto_49505 ) ( not ( = ?auto_49504 ?auto_49505 ) ) ( not ( = ?auto_49504 ?auto_49503 ) ) ( not ( = ?auto_49504 ?auto_49502 ) ) ( not ( = ?auto_49504 ?auto_49501 ) ) ( not ( = ?auto_49505 ?auto_49503 ) ) ( not ( = ?auto_49505 ?auto_49502 ) ) ( not ( = ?auto_49505 ?auto_49501 ) ) ( not ( = ?auto_49500 ?auto_49504 ) ) ( not ( = ?auto_49500 ?auto_49505 ) ) ( HOLDING ?auto_49500 ) ( CLEAR ?auto_49501 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49504 ?auto_49505 ?auto_49503 ?auto_49502 ?auto_49501 ?auto_49500 )
      ( MAKE-3PILE ?auto_49500 ?auto_49501 ?auto_49502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49506 - BLOCK
      ?auto_49507 - BLOCK
      ?auto_49508 - BLOCK
    )
    :vars
    (
      ?auto_49509 - BLOCK
      ?auto_49510 - BLOCK
      ?auto_49511 - BLOCK
      ?auto_49512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49506 ?auto_49507 ) ) ( not ( = ?auto_49506 ?auto_49508 ) ) ( not ( = ?auto_49507 ?auto_49508 ) ) ( ON ?auto_49508 ?auto_49509 ) ( not ( = ?auto_49506 ?auto_49509 ) ) ( not ( = ?auto_49507 ?auto_49509 ) ) ( not ( = ?auto_49508 ?auto_49509 ) ) ( ON ?auto_49507 ?auto_49508 ) ( ON-TABLE ?auto_49510 ) ( ON ?auto_49511 ?auto_49510 ) ( ON ?auto_49509 ?auto_49511 ) ( not ( = ?auto_49510 ?auto_49511 ) ) ( not ( = ?auto_49510 ?auto_49509 ) ) ( not ( = ?auto_49510 ?auto_49508 ) ) ( not ( = ?auto_49510 ?auto_49507 ) ) ( not ( = ?auto_49511 ?auto_49509 ) ) ( not ( = ?auto_49511 ?auto_49508 ) ) ( not ( = ?auto_49511 ?auto_49507 ) ) ( not ( = ?auto_49506 ?auto_49510 ) ) ( not ( = ?auto_49506 ?auto_49511 ) ) ( CLEAR ?auto_49507 ) ( ON ?auto_49506 ?auto_49512 ) ( CLEAR ?auto_49506 ) ( HAND-EMPTY ) ( not ( = ?auto_49506 ?auto_49512 ) ) ( not ( = ?auto_49507 ?auto_49512 ) ) ( not ( = ?auto_49508 ?auto_49512 ) ) ( not ( = ?auto_49509 ?auto_49512 ) ) ( not ( = ?auto_49510 ?auto_49512 ) ) ( not ( = ?auto_49511 ?auto_49512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49506 ?auto_49512 )
      ( MAKE-3PILE ?auto_49506 ?auto_49507 ?auto_49508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49513 - BLOCK
      ?auto_49514 - BLOCK
      ?auto_49515 - BLOCK
    )
    :vars
    (
      ?auto_49518 - BLOCK
      ?auto_49517 - BLOCK
      ?auto_49519 - BLOCK
      ?auto_49516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49513 ?auto_49514 ) ) ( not ( = ?auto_49513 ?auto_49515 ) ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( ON ?auto_49515 ?auto_49518 ) ( not ( = ?auto_49513 ?auto_49518 ) ) ( not ( = ?auto_49514 ?auto_49518 ) ) ( not ( = ?auto_49515 ?auto_49518 ) ) ( ON-TABLE ?auto_49517 ) ( ON ?auto_49519 ?auto_49517 ) ( ON ?auto_49518 ?auto_49519 ) ( not ( = ?auto_49517 ?auto_49519 ) ) ( not ( = ?auto_49517 ?auto_49518 ) ) ( not ( = ?auto_49517 ?auto_49515 ) ) ( not ( = ?auto_49517 ?auto_49514 ) ) ( not ( = ?auto_49519 ?auto_49518 ) ) ( not ( = ?auto_49519 ?auto_49515 ) ) ( not ( = ?auto_49519 ?auto_49514 ) ) ( not ( = ?auto_49513 ?auto_49517 ) ) ( not ( = ?auto_49513 ?auto_49519 ) ) ( ON ?auto_49513 ?auto_49516 ) ( CLEAR ?auto_49513 ) ( not ( = ?auto_49513 ?auto_49516 ) ) ( not ( = ?auto_49514 ?auto_49516 ) ) ( not ( = ?auto_49515 ?auto_49516 ) ) ( not ( = ?auto_49518 ?auto_49516 ) ) ( not ( = ?auto_49517 ?auto_49516 ) ) ( not ( = ?auto_49519 ?auto_49516 ) ) ( HOLDING ?auto_49514 ) ( CLEAR ?auto_49515 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49517 ?auto_49519 ?auto_49518 ?auto_49515 ?auto_49514 )
      ( MAKE-3PILE ?auto_49513 ?auto_49514 ?auto_49515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49520 - BLOCK
      ?auto_49521 - BLOCK
      ?auto_49522 - BLOCK
    )
    :vars
    (
      ?auto_49524 - BLOCK
      ?auto_49525 - BLOCK
      ?auto_49523 - BLOCK
      ?auto_49526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49520 ?auto_49521 ) ) ( not ( = ?auto_49520 ?auto_49522 ) ) ( not ( = ?auto_49521 ?auto_49522 ) ) ( ON ?auto_49522 ?auto_49524 ) ( not ( = ?auto_49520 ?auto_49524 ) ) ( not ( = ?auto_49521 ?auto_49524 ) ) ( not ( = ?auto_49522 ?auto_49524 ) ) ( ON-TABLE ?auto_49525 ) ( ON ?auto_49523 ?auto_49525 ) ( ON ?auto_49524 ?auto_49523 ) ( not ( = ?auto_49525 ?auto_49523 ) ) ( not ( = ?auto_49525 ?auto_49524 ) ) ( not ( = ?auto_49525 ?auto_49522 ) ) ( not ( = ?auto_49525 ?auto_49521 ) ) ( not ( = ?auto_49523 ?auto_49524 ) ) ( not ( = ?auto_49523 ?auto_49522 ) ) ( not ( = ?auto_49523 ?auto_49521 ) ) ( not ( = ?auto_49520 ?auto_49525 ) ) ( not ( = ?auto_49520 ?auto_49523 ) ) ( ON ?auto_49520 ?auto_49526 ) ( not ( = ?auto_49520 ?auto_49526 ) ) ( not ( = ?auto_49521 ?auto_49526 ) ) ( not ( = ?auto_49522 ?auto_49526 ) ) ( not ( = ?auto_49524 ?auto_49526 ) ) ( not ( = ?auto_49525 ?auto_49526 ) ) ( not ( = ?auto_49523 ?auto_49526 ) ) ( CLEAR ?auto_49522 ) ( ON ?auto_49521 ?auto_49520 ) ( CLEAR ?auto_49521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49526 ?auto_49520 )
      ( MAKE-3PILE ?auto_49520 ?auto_49521 ?auto_49522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49527 - BLOCK
      ?auto_49528 - BLOCK
      ?auto_49529 - BLOCK
    )
    :vars
    (
      ?auto_49530 - BLOCK
      ?auto_49533 - BLOCK
      ?auto_49532 - BLOCK
      ?auto_49531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49527 ?auto_49528 ) ) ( not ( = ?auto_49527 ?auto_49529 ) ) ( not ( = ?auto_49528 ?auto_49529 ) ) ( not ( = ?auto_49527 ?auto_49530 ) ) ( not ( = ?auto_49528 ?auto_49530 ) ) ( not ( = ?auto_49529 ?auto_49530 ) ) ( ON-TABLE ?auto_49533 ) ( ON ?auto_49532 ?auto_49533 ) ( ON ?auto_49530 ?auto_49532 ) ( not ( = ?auto_49533 ?auto_49532 ) ) ( not ( = ?auto_49533 ?auto_49530 ) ) ( not ( = ?auto_49533 ?auto_49529 ) ) ( not ( = ?auto_49533 ?auto_49528 ) ) ( not ( = ?auto_49532 ?auto_49530 ) ) ( not ( = ?auto_49532 ?auto_49529 ) ) ( not ( = ?auto_49532 ?auto_49528 ) ) ( not ( = ?auto_49527 ?auto_49533 ) ) ( not ( = ?auto_49527 ?auto_49532 ) ) ( ON ?auto_49527 ?auto_49531 ) ( not ( = ?auto_49527 ?auto_49531 ) ) ( not ( = ?auto_49528 ?auto_49531 ) ) ( not ( = ?auto_49529 ?auto_49531 ) ) ( not ( = ?auto_49530 ?auto_49531 ) ) ( not ( = ?auto_49533 ?auto_49531 ) ) ( not ( = ?auto_49532 ?auto_49531 ) ) ( ON ?auto_49528 ?auto_49527 ) ( CLEAR ?auto_49528 ) ( ON-TABLE ?auto_49531 ) ( HOLDING ?auto_49529 ) ( CLEAR ?auto_49530 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49533 ?auto_49532 ?auto_49530 ?auto_49529 )
      ( MAKE-3PILE ?auto_49527 ?auto_49528 ?auto_49529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49534 - BLOCK
      ?auto_49535 - BLOCK
      ?auto_49536 - BLOCK
    )
    :vars
    (
      ?auto_49540 - BLOCK
      ?auto_49538 - BLOCK
      ?auto_49539 - BLOCK
      ?auto_49537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49534 ?auto_49535 ) ) ( not ( = ?auto_49534 ?auto_49536 ) ) ( not ( = ?auto_49535 ?auto_49536 ) ) ( not ( = ?auto_49534 ?auto_49540 ) ) ( not ( = ?auto_49535 ?auto_49540 ) ) ( not ( = ?auto_49536 ?auto_49540 ) ) ( ON-TABLE ?auto_49538 ) ( ON ?auto_49539 ?auto_49538 ) ( ON ?auto_49540 ?auto_49539 ) ( not ( = ?auto_49538 ?auto_49539 ) ) ( not ( = ?auto_49538 ?auto_49540 ) ) ( not ( = ?auto_49538 ?auto_49536 ) ) ( not ( = ?auto_49538 ?auto_49535 ) ) ( not ( = ?auto_49539 ?auto_49540 ) ) ( not ( = ?auto_49539 ?auto_49536 ) ) ( not ( = ?auto_49539 ?auto_49535 ) ) ( not ( = ?auto_49534 ?auto_49538 ) ) ( not ( = ?auto_49534 ?auto_49539 ) ) ( ON ?auto_49534 ?auto_49537 ) ( not ( = ?auto_49534 ?auto_49537 ) ) ( not ( = ?auto_49535 ?auto_49537 ) ) ( not ( = ?auto_49536 ?auto_49537 ) ) ( not ( = ?auto_49540 ?auto_49537 ) ) ( not ( = ?auto_49538 ?auto_49537 ) ) ( not ( = ?auto_49539 ?auto_49537 ) ) ( ON ?auto_49535 ?auto_49534 ) ( ON-TABLE ?auto_49537 ) ( CLEAR ?auto_49540 ) ( ON ?auto_49536 ?auto_49535 ) ( CLEAR ?auto_49536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49537 ?auto_49534 ?auto_49535 )
      ( MAKE-3PILE ?auto_49534 ?auto_49535 ?auto_49536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49541 - BLOCK
      ?auto_49542 - BLOCK
      ?auto_49543 - BLOCK
    )
    :vars
    (
      ?auto_49545 - BLOCK
      ?auto_49546 - BLOCK
      ?auto_49547 - BLOCK
      ?auto_49544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49541 ?auto_49542 ) ) ( not ( = ?auto_49541 ?auto_49543 ) ) ( not ( = ?auto_49542 ?auto_49543 ) ) ( not ( = ?auto_49541 ?auto_49545 ) ) ( not ( = ?auto_49542 ?auto_49545 ) ) ( not ( = ?auto_49543 ?auto_49545 ) ) ( ON-TABLE ?auto_49546 ) ( ON ?auto_49547 ?auto_49546 ) ( not ( = ?auto_49546 ?auto_49547 ) ) ( not ( = ?auto_49546 ?auto_49545 ) ) ( not ( = ?auto_49546 ?auto_49543 ) ) ( not ( = ?auto_49546 ?auto_49542 ) ) ( not ( = ?auto_49547 ?auto_49545 ) ) ( not ( = ?auto_49547 ?auto_49543 ) ) ( not ( = ?auto_49547 ?auto_49542 ) ) ( not ( = ?auto_49541 ?auto_49546 ) ) ( not ( = ?auto_49541 ?auto_49547 ) ) ( ON ?auto_49541 ?auto_49544 ) ( not ( = ?auto_49541 ?auto_49544 ) ) ( not ( = ?auto_49542 ?auto_49544 ) ) ( not ( = ?auto_49543 ?auto_49544 ) ) ( not ( = ?auto_49545 ?auto_49544 ) ) ( not ( = ?auto_49546 ?auto_49544 ) ) ( not ( = ?auto_49547 ?auto_49544 ) ) ( ON ?auto_49542 ?auto_49541 ) ( ON-TABLE ?auto_49544 ) ( ON ?auto_49543 ?auto_49542 ) ( CLEAR ?auto_49543 ) ( HOLDING ?auto_49545 ) ( CLEAR ?auto_49547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49546 ?auto_49547 ?auto_49545 )
      ( MAKE-3PILE ?auto_49541 ?auto_49542 ?auto_49543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49548 - BLOCK
      ?auto_49549 - BLOCK
      ?auto_49550 - BLOCK
    )
    :vars
    (
      ?auto_49554 - BLOCK
      ?auto_49552 - BLOCK
      ?auto_49551 - BLOCK
      ?auto_49553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49548 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49550 ) ) ( not ( = ?auto_49549 ?auto_49550 ) ) ( not ( = ?auto_49548 ?auto_49554 ) ) ( not ( = ?auto_49549 ?auto_49554 ) ) ( not ( = ?auto_49550 ?auto_49554 ) ) ( ON-TABLE ?auto_49552 ) ( ON ?auto_49551 ?auto_49552 ) ( not ( = ?auto_49552 ?auto_49551 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) ( not ( = ?auto_49552 ?auto_49550 ) ) ( not ( = ?auto_49552 ?auto_49549 ) ) ( not ( = ?auto_49551 ?auto_49554 ) ) ( not ( = ?auto_49551 ?auto_49550 ) ) ( not ( = ?auto_49551 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49552 ) ) ( not ( = ?auto_49548 ?auto_49551 ) ) ( ON ?auto_49548 ?auto_49553 ) ( not ( = ?auto_49548 ?auto_49553 ) ) ( not ( = ?auto_49549 ?auto_49553 ) ) ( not ( = ?auto_49550 ?auto_49553 ) ) ( not ( = ?auto_49554 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49551 ?auto_49553 ) ) ( ON ?auto_49549 ?auto_49548 ) ( ON-TABLE ?auto_49553 ) ( ON ?auto_49550 ?auto_49549 ) ( CLEAR ?auto_49551 ) ( ON ?auto_49554 ?auto_49550 ) ( CLEAR ?auto_49554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49553 ?auto_49548 ?auto_49549 ?auto_49550 )
      ( MAKE-3PILE ?auto_49548 ?auto_49549 ?auto_49550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49555 - BLOCK
      ?auto_49556 - BLOCK
      ?auto_49557 - BLOCK
    )
    :vars
    (
      ?auto_49559 - BLOCK
      ?auto_49561 - BLOCK
      ?auto_49560 - BLOCK
      ?auto_49558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49555 ?auto_49556 ) ) ( not ( = ?auto_49555 ?auto_49557 ) ) ( not ( = ?auto_49556 ?auto_49557 ) ) ( not ( = ?auto_49555 ?auto_49559 ) ) ( not ( = ?auto_49556 ?auto_49559 ) ) ( not ( = ?auto_49557 ?auto_49559 ) ) ( ON-TABLE ?auto_49561 ) ( not ( = ?auto_49561 ?auto_49560 ) ) ( not ( = ?auto_49561 ?auto_49559 ) ) ( not ( = ?auto_49561 ?auto_49557 ) ) ( not ( = ?auto_49561 ?auto_49556 ) ) ( not ( = ?auto_49560 ?auto_49559 ) ) ( not ( = ?auto_49560 ?auto_49557 ) ) ( not ( = ?auto_49560 ?auto_49556 ) ) ( not ( = ?auto_49555 ?auto_49561 ) ) ( not ( = ?auto_49555 ?auto_49560 ) ) ( ON ?auto_49555 ?auto_49558 ) ( not ( = ?auto_49555 ?auto_49558 ) ) ( not ( = ?auto_49556 ?auto_49558 ) ) ( not ( = ?auto_49557 ?auto_49558 ) ) ( not ( = ?auto_49559 ?auto_49558 ) ) ( not ( = ?auto_49561 ?auto_49558 ) ) ( not ( = ?auto_49560 ?auto_49558 ) ) ( ON ?auto_49556 ?auto_49555 ) ( ON-TABLE ?auto_49558 ) ( ON ?auto_49557 ?auto_49556 ) ( ON ?auto_49559 ?auto_49557 ) ( CLEAR ?auto_49559 ) ( HOLDING ?auto_49560 ) ( CLEAR ?auto_49561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49561 ?auto_49560 )
      ( MAKE-3PILE ?auto_49555 ?auto_49556 ?auto_49557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49562 - BLOCK
      ?auto_49563 - BLOCK
      ?auto_49564 - BLOCK
    )
    :vars
    (
      ?auto_49567 - BLOCK
      ?auto_49566 - BLOCK
      ?auto_49568 - BLOCK
      ?auto_49565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49562 ?auto_49563 ) ) ( not ( = ?auto_49562 ?auto_49564 ) ) ( not ( = ?auto_49563 ?auto_49564 ) ) ( not ( = ?auto_49562 ?auto_49567 ) ) ( not ( = ?auto_49563 ?auto_49567 ) ) ( not ( = ?auto_49564 ?auto_49567 ) ) ( ON-TABLE ?auto_49566 ) ( not ( = ?auto_49566 ?auto_49568 ) ) ( not ( = ?auto_49566 ?auto_49567 ) ) ( not ( = ?auto_49566 ?auto_49564 ) ) ( not ( = ?auto_49566 ?auto_49563 ) ) ( not ( = ?auto_49568 ?auto_49567 ) ) ( not ( = ?auto_49568 ?auto_49564 ) ) ( not ( = ?auto_49568 ?auto_49563 ) ) ( not ( = ?auto_49562 ?auto_49566 ) ) ( not ( = ?auto_49562 ?auto_49568 ) ) ( ON ?auto_49562 ?auto_49565 ) ( not ( = ?auto_49562 ?auto_49565 ) ) ( not ( = ?auto_49563 ?auto_49565 ) ) ( not ( = ?auto_49564 ?auto_49565 ) ) ( not ( = ?auto_49567 ?auto_49565 ) ) ( not ( = ?auto_49566 ?auto_49565 ) ) ( not ( = ?auto_49568 ?auto_49565 ) ) ( ON ?auto_49563 ?auto_49562 ) ( ON-TABLE ?auto_49565 ) ( ON ?auto_49564 ?auto_49563 ) ( ON ?auto_49567 ?auto_49564 ) ( CLEAR ?auto_49566 ) ( ON ?auto_49568 ?auto_49567 ) ( CLEAR ?auto_49568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49565 ?auto_49562 ?auto_49563 ?auto_49564 ?auto_49567 )
      ( MAKE-3PILE ?auto_49562 ?auto_49563 ?auto_49564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49569 - BLOCK
      ?auto_49570 - BLOCK
      ?auto_49571 - BLOCK
    )
    :vars
    (
      ?auto_49572 - BLOCK
      ?auto_49575 - BLOCK
      ?auto_49573 - BLOCK
      ?auto_49574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49569 ?auto_49570 ) ) ( not ( = ?auto_49569 ?auto_49571 ) ) ( not ( = ?auto_49570 ?auto_49571 ) ) ( not ( = ?auto_49569 ?auto_49572 ) ) ( not ( = ?auto_49570 ?auto_49572 ) ) ( not ( = ?auto_49571 ?auto_49572 ) ) ( not ( = ?auto_49575 ?auto_49573 ) ) ( not ( = ?auto_49575 ?auto_49572 ) ) ( not ( = ?auto_49575 ?auto_49571 ) ) ( not ( = ?auto_49575 ?auto_49570 ) ) ( not ( = ?auto_49573 ?auto_49572 ) ) ( not ( = ?auto_49573 ?auto_49571 ) ) ( not ( = ?auto_49573 ?auto_49570 ) ) ( not ( = ?auto_49569 ?auto_49575 ) ) ( not ( = ?auto_49569 ?auto_49573 ) ) ( ON ?auto_49569 ?auto_49574 ) ( not ( = ?auto_49569 ?auto_49574 ) ) ( not ( = ?auto_49570 ?auto_49574 ) ) ( not ( = ?auto_49571 ?auto_49574 ) ) ( not ( = ?auto_49572 ?auto_49574 ) ) ( not ( = ?auto_49575 ?auto_49574 ) ) ( not ( = ?auto_49573 ?auto_49574 ) ) ( ON ?auto_49570 ?auto_49569 ) ( ON-TABLE ?auto_49574 ) ( ON ?auto_49571 ?auto_49570 ) ( ON ?auto_49572 ?auto_49571 ) ( ON ?auto_49573 ?auto_49572 ) ( CLEAR ?auto_49573 ) ( HOLDING ?auto_49575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49575 )
      ( MAKE-3PILE ?auto_49569 ?auto_49570 ?auto_49571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49576 - BLOCK
      ?auto_49577 - BLOCK
      ?auto_49578 - BLOCK
    )
    :vars
    (
      ?auto_49582 - BLOCK
      ?auto_49580 - BLOCK
      ?auto_49581 - BLOCK
      ?auto_49579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49576 ?auto_49577 ) ) ( not ( = ?auto_49576 ?auto_49578 ) ) ( not ( = ?auto_49577 ?auto_49578 ) ) ( not ( = ?auto_49576 ?auto_49582 ) ) ( not ( = ?auto_49577 ?auto_49582 ) ) ( not ( = ?auto_49578 ?auto_49582 ) ) ( not ( = ?auto_49580 ?auto_49581 ) ) ( not ( = ?auto_49580 ?auto_49582 ) ) ( not ( = ?auto_49580 ?auto_49578 ) ) ( not ( = ?auto_49580 ?auto_49577 ) ) ( not ( = ?auto_49581 ?auto_49582 ) ) ( not ( = ?auto_49581 ?auto_49578 ) ) ( not ( = ?auto_49581 ?auto_49577 ) ) ( not ( = ?auto_49576 ?auto_49580 ) ) ( not ( = ?auto_49576 ?auto_49581 ) ) ( ON ?auto_49576 ?auto_49579 ) ( not ( = ?auto_49576 ?auto_49579 ) ) ( not ( = ?auto_49577 ?auto_49579 ) ) ( not ( = ?auto_49578 ?auto_49579 ) ) ( not ( = ?auto_49582 ?auto_49579 ) ) ( not ( = ?auto_49580 ?auto_49579 ) ) ( not ( = ?auto_49581 ?auto_49579 ) ) ( ON ?auto_49577 ?auto_49576 ) ( ON-TABLE ?auto_49579 ) ( ON ?auto_49578 ?auto_49577 ) ( ON ?auto_49582 ?auto_49578 ) ( ON ?auto_49581 ?auto_49582 ) ( ON ?auto_49580 ?auto_49581 ) ( CLEAR ?auto_49580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49579 ?auto_49576 ?auto_49577 ?auto_49578 ?auto_49582 ?auto_49581 )
      ( MAKE-3PILE ?auto_49576 ?auto_49577 ?auto_49578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49585 - BLOCK
      ?auto_49586 - BLOCK
    )
    :vars
    (
      ?auto_49587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49587 ?auto_49586 ) ( CLEAR ?auto_49587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49585 ) ( ON ?auto_49586 ?auto_49585 ) ( not ( = ?auto_49585 ?auto_49586 ) ) ( not ( = ?auto_49585 ?auto_49587 ) ) ( not ( = ?auto_49586 ?auto_49587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49587 ?auto_49586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49588 - BLOCK
      ?auto_49589 - BLOCK
    )
    :vars
    (
      ?auto_49590 - BLOCK
      ?auto_49591 - BLOCK
      ?auto_49592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49590 ?auto_49589 ) ( CLEAR ?auto_49590 ) ( ON-TABLE ?auto_49588 ) ( ON ?auto_49589 ?auto_49588 ) ( not ( = ?auto_49588 ?auto_49589 ) ) ( not ( = ?auto_49588 ?auto_49590 ) ) ( not ( = ?auto_49589 ?auto_49590 ) ) ( HOLDING ?auto_49591 ) ( CLEAR ?auto_49592 ) ( not ( = ?auto_49588 ?auto_49591 ) ) ( not ( = ?auto_49588 ?auto_49592 ) ) ( not ( = ?auto_49589 ?auto_49591 ) ) ( not ( = ?auto_49589 ?auto_49592 ) ) ( not ( = ?auto_49590 ?auto_49591 ) ) ( not ( = ?auto_49590 ?auto_49592 ) ) ( not ( = ?auto_49591 ?auto_49592 ) ) )
    :subtasks
    ( ( !STACK ?auto_49591 ?auto_49592 )
      ( MAKE-2PILE ?auto_49588 ?auto_49589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49593 - BLOCK
      ?auto_49594 - BLOCK
    )
    :vars
    (
      ?auto_49595 - BLOCK
      ?auto_49597 - BLOCK
      ?auto_49596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49595 ?auto_49594 ) ( ON-TABLE ?auto_49593 ) ( ON ?auto_49594 ?auto_49593 ) ( not ( = ?auto_49593 ?auto_49594 ) ) ( not ( = ?auto_49593 ?auto_49595 ) ) ( not ( = ?auto_49594 ?auto_49595 ) ) ( CLEAR ?auto_49597 ) ( not ( = ?auto_49593 ?auto_49596 ) ) ( not ( = ?auto_49593 ?auto_49597 ) ) ( not ( = ?auto_49594 ?auto_49596 ) ) ( not ( = ?auto_49594 ?auto_49597 ) ) ( not ( = ?auto_49595 ?auto_49596 ) ) ( not ( = ?auto_49595 ?auto_49597 ) ) ( not ( = ?auto_49596 ?auto_49597 ) ) ( ON ?auto_49596 ?auto_49595 ) ( CLEAR ?auto_49596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49593 ?auto_49594 ?auto_49595 )
      ( MAKE-2PILE ?auto_49593 ?auto_49594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49598 - BLOCK
      ?auto_49599 - BLOCK
    )
    :vars
    (
      ?auto_49602 - BLOCK
      ?auto_49600 - BLOCK
      ?auto_49601 - BLOCK
      ?auto_49603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49602 ?auto_49599 ) ( ON-TABLE ?auto_49598 ) ( ON ?auto_49599 ?auto_49598 ) ( not ( = ?auto_49598 ?auto_49599 ) ) ( not ( = ?auto_49598 ?auto_49602 ) ) ( not ( = ?auto_49599 ?auto_49602 ) ) ( not ( = ?auto_49598 ?auto_49600 ) ) ( not ( = ?auto_49598 ?auto_49601 ) ) ( not ( = ?auto_49599 ?auto_49600 ) ) ( not ( = ?auto_49599 ?auto_49601 ) ) ( not ( = ?auto_49602 ?auto_49600 ) ) ( not ( = ?auto_49602 ?auto_49601 ) ) ( not ( = ?auto_49600 ?auto_49601 ) ) ( ON ?auto_49600 ?auto_49602 ) ( CLEAR ?auto_49600 ) ( HOLDING ?auto_49601 ) ( CLEAR ?auto_49603 ) ( ON-TABLE ?auto_49603 ) ( not ( = ?auto_49603 ?auto_49601 ) ) ( not ( = ?auto_49598 ?auto_49603 ) ) ( not ( = ?auto_49599 ?auto_49603 ) ) ( not ( = ?auto_49602 ?auto_49603 ) ) ( not ( = ?auto_49600 ?auto_49603 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49603 ?auto_49601 )
      ( MAKE-2PILE ?auto_49598 ?auto_49599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49604 - BLOCK
      ?auto_49605 - BLOCK
    )
    :vars
    (
      ?auto_49606 - BLOCK
      ?auto_49609 - BLOCK
      ?auto_49608 - BLOCK
      ?auto_49607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49606 ?auto_49605 ) ( ON-TABLE ?auto_49604 ) ( ON ?auto_49605 ?auto_49604 ) ( not ( = ?auto_49604 ?auto_49605 ) ) ( not ( = ?auto_49604 ?auto_49606 ) ) ( not ( = ?auto_49605 ?auto_49606 ) ) ( not ( = ?auto_49604 ?auto_49609 ) ) ( not ( = ?auto_49604 ?auto_49608 ) ) ( not ( = ?auto_49605 ?auto_49609 ) ) ( not ( = ?auto_49605 ?auto_49608 ) ) ( not ( = ?auto_49606 ?auto_49609 ) ) ( not ( = ?auto_49606 ?auto_49608 ) ) ( not ( = ?auto_49609 ?auto_49608 ) ) ( ON ?auto_49609 ?auto_49606 ) ( CLEAR ?auto_49607 ) ( ON-TABLE ?auto_49607 ) ( not ( = ?auto_49607 ?auto_49608 ) ) ( not ( = ?auto_49604 ?auto_49607 ) ) ( not ( = ?auto_49605 ?auto_49607 ) ) ( not ( = ?auto_49606 ?auto_49607 ) ) ( not ( = ?auto_49609 ?auto_49607 ) ) ( ON ?auto_49608 ?auto_49609 ) ( CLEAR ?auto_49608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49604 ?auto_49605 ?auto_49606 ?auto_49609 )
      ( MAKE-2PILE ?auto_49604 ?auto_49605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49610 - BLOCK
      ?auto_49611 - BLOCK
    )
    :vars
    (
      ?auto_49615 - BLOCK
      ?auto_49612 - BLOCK
      ?auto_49613 - BLOCK
      ?auto_49614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49615 ?auto_49611 ) ( ON-TABLE ?auto_49610 ) ( ON ?auto_49611 ?auto_49610 ) ( not ( = ?auto_49610 ?auto_49611 ) ) ( not ( = ?auto_49610 ?auto_49615 ) ) ( not ( = ?auto_49611 ?auto_49615 ) ) ( not ( = ?auto_49610 ?auto_49612 ) ) ( not ( = ?auto_49610 ?auto_49613 ) ) ( not ( = ?auto_49611 ?auto_49612 ) ) ( not ( = ?auto_49611 ?auto_49613 ) ) ( not ( = ?auto_49615 ?auto_49612 ) ) ( not ( = ?auto_49615 ?auto_49613 ) ) ( not ( = ?auto_49612 ?auto_49613 ) ) ( ON ?auto_49612 ?auto_49615 ) ( not ( = ?auto_49614 ?auto_49613 ) ) ( not ( = ?auto_49610 ?auto_49614 ) ) ( not ( = ?auto_49611 ?auto_49614 ) ) ( not ( = ?auto_49615 ?auto_49614 ) ) ( not ( = ?auto_49612 ?auto_49614 ) ) ( ON ?auto_49613 ?auto_49612 ) ( CLEAR ?auto_49613 ) ( HOLDING ?auto_49614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49614 )
      ( MAKE-2PILE ?auto_49610 ?auto_49611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49616 - BLOCK
      ?auto_49617 - BLOCK
    )
    :vars
    (
      ?auto_49618 - BLOCK
      ?auto_49619 - BLOCK
      ?auto_49621 - BLOCK
      ?auto_49620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49618 ?auto_49617 ) ( ON-TABLE ?auto_49616 ) ( ON ?auto_49617 ?auto_49616 ) ( not ( = ?auto_49616 ?auto_49617 ) ) ( not ( = ?auto_49616 ?auto_49618 ) ) ( not ( = ?auto_49617 ?auto_49618 ) ) ( not ( = ?auto_49616 ?auto_49619 ) ) ( not ( = ?auto_49616 ?auto_49621 ) ) ( not ( = ?auto_49617 ?auto_49619 ) ) ( not ( = ?auto_49617 ?auto_49621 ) ) ( not ( = ?auto_49618 ?auto_49619 ) ) ( not ( = ?auto_49618 ?auto_49621 ) ) ( not ( = ?auto_49619 ?auto_49621 ) ) ( ON ?auto_49619 ?auto_49618 ) ( not ( = ?auto_49620 ?auto_49621 ) ) ( not ( = ?auto_49616 ?auto_49620 ) ) ( not ( = ?auto_49617 ?auto_49620 ) ) ( not ( = ?auto_49618 ?auto_49620 ) ) ( not ( = ?auto_49619 ?auto_49620 ) ) ( ON ?auto_49621 ?auto_49619 ) ( ON ?auto_49620 ?auto_49621 ) ( CLEAR ?auto_49620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49616 ?auto_49617 ?auto_49618 ?auto_49619 ?auto_49621 )
      ( MAKE-2PILE ?auto_49616 ?auto_49617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49622 - BLOCK
      ?auto_49623 - BLOCK
    )
    :vars
    (
      ?auto_49626 - BLOCK
      ?auto_49624 - BLOCK
      ?auto_49625 - BLOCK
      ?auto_49627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49626 ?auto_49623 ) ( ON-TABLE ?auto_49622 ) ( ON ?auto_49623 ?auto_49622 ) ( not ( = ?auto_49622 ?auto_49623 ) ) ( not ( = ?auto_49622 ?auto_49626 ) ) ( not ( = ?auto_49623 ?auto_49626 ) ) ( not ( = ?auto_49622 ?auto_49624 ) ) ( not ( = ?auto_49622 ?auto_49625 ) ) ( not ( = ?auto_49623 ?auto_49624 ) ) ( not ( = ?auto_49623 ?auto_49625 ) ) ( not ( = ?auto_49626 ?auto_49624 ) ) ( not ( = ?auto_49626 ?auto_49625 ) ) ( not ( = ?auto_49624 ?auto_49625 ) ) ( ON ?auto_49624 ?auto_49626 ) ( not ( = ?auto_49627 ?auto_49625 ) ) ( not ( = ?auto_49622 ?auto_49627 ) ) ( not ( = ?auto_49623 ?auto_49627 ) ) ( not ( = ?auto_49626 ?auto_49627 ) ) ( not ( = ?auto_49624 ?auto_49627 ) ) ( ON ?auto_49625 ?auto_49624 ) ( HOLDING ?auto_49627 ) ( CLEAR ?auto_49625 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49622 ?auto_49623 ?auto_49626 ?auto_49624 ?auto_49625 ?auto_49627 )
      ( MAKE-2PILE ?auto_49622 ?auto_49623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49628 - BLOCK
      ?auto_49629 - BLOCK
    )
    :vars
    (
      ?auto_49630 - BLOCK
      ?auto_49631 - BLOCK
      ?auto_49633 - BLOCK
      ?auto_49632 - BLOCK
      ?auto_49634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49630 ?auto_49629 ) ( ON-TABLE ?auto_49628 ) ( ON ?auto_49629 ?auto_49628 ) ( not ( = ?auto_49628 ?auto_49629 ) ) ( not ( = ?auto_49628 ?auto_49630 ) ) ( not ( = ?auto_49629 ?auto_49630 ) ) ( not ( = ?auto_49628 ?auto_49631 ) ) ( not ( = ?auto_49628 ?auto_49633 ) ) ( not ( = ?auto_49629 ?auto_49631 ) ) ( not ( = ?auto_49629 ?auto_49633 ) ) ( not ( = ?auto_49630 ?auto_49631 ) ) ( not ( = ?auto_49630 ?auto_49633 ) ) ( not ( = ?auto_49631 ?auto_49633 ) ) ( ON ?auto_49631 ?auto_49630 ) ( not ( = ?auto_49632 ?auto_49633 ) ) ( not ( = ?auto_49628 ?auto_49632 ) ) ( not ( = ?auto_49629 ?auto_49632 ) ) ( not ( = ?auto_49630 ?auto_49632 ) ) ( not ( = ?auto_49631 ?auto_49632 ) ) ( ON ?auto_49633 ?auto_49631 ) ( CLEAR ?auto_49633 ) ( ON ?auto_49632 ?auto_49634 ) ( CLEAR ?auto_49632 ) ( HAND-EMPTY ) ( not ( = ?auto_49628 ?auto_49634 ) ) ( not ( = ?auto_49629 ?auto_49634 ) ) ( not ( = ?auto_49630 ?auto_49634 ) ) ( not ( = ?auto_49631 ?auto_49634 ) ) ( not ( = ?auto_49633 ?auto_49634 ) ) ( not ( = ?auto_49632 ?auto_49634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49632 ?auto_49634 )
      ( MAKE-2PILE ?auto_49628 ?auto_49629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49635 - BLOCK
      ?auto_49636 - BLOCK
    )
    :vars
    (
      ?auto_49641 - BLOCK
      ?auto_49638 - BLOCK
      ?auto_49637 - BLOCK
      ?auto_49639 - BLOCK
      ?auto_49640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49641 ?auto_49636 ) ( ON-TABLE ?auto_49635 ) ( ON ?auto_49636 ?auto_49635 ) ( not ( = ?auto_49635 ?auto_49636 ) ) ( not ( = ?auto_49635 ?auto_49641 ) ) ( not ( = ?auto_49636 ?auto_49641 ) ) ( not ( = ?auto_49635 ?auto_49638 ) ) ( not ( = ?auto_49635 ?auto_49637 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49637 ) ) ( not ( = ?auto_49641 ?auto_49638 ) ) ( not ( = ?auto_49641 ?auto_49637 ) ) ( not ( = ?auto_49638 ?auto_49637 ) ) ( ON ?auto_49638 ?auto_49641 ) ( not ( = ?auto_49639 ?auto_49637 ) ) ( not ( = ?auto_49635 ?auto_49639 ) ) ( not ( = ?auto_49636 ?auto_49639 ) ) ( not ( = ?auto_49641 ?auto_49639 ) ) ( not ( = ?auto_49638 ?auto_49639 ) ) ( ON ?auto_49639 ?auto_49640 ) ( CLEAR ?auto_49639 ) ( not ( = ?auto_49635 ?auto_49640 ) ) ( not ( = ?auto_49636 ?auto_49640 ) ) ( not ( = ?auto_49641 ?auto_49640 ) ) ( not ( = ?auto_49638 ?auto_49640 ) ) ( not ( = ?auto_49637 ?auto_49640 ) ) ( not ( = ?auto_49639 ?auto_49640 ) ) ( HOLDING ?auto_49637 ) ( CLEAR ?auto_49638 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49635 ?auto_49636 ?auto_49641 ?auto_49638 ?auto_49637 )
      ( MAKE-2PILE ?auto_49635 ?auto_49636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49642 - BLOCK
      ?auto_49643 - BLOCK
    )
    :vars
    (
      ?auto_49645 - BLOCK
      ?auto_49647 - BLOCK
      ?auto_49646 - BLOCK
      ?auto_49644 - BLOCK
      ?auto_49648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49645 ?auto_49643 ) ( ON-TABLE ?auto_49642 ) ( ON ?auto_49643 ?auto_49642 ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49642 ?auto_49645 ) ) ( not ( = ?auto_49643 ?auto_49645 ) ) ( not ( = ?auto_49642 ?auto_49647 ) ) ( not ( = ?auto_49642 ?auto_49646 ) ) ( not ( = ?auto_49643 ?auto_49647 ) ) ( not ( = ?auto_49643 ?auto_49646 ) ) ( not ( = ?auto_49645 ?auto_49647 ) ) ( not ( = ?auto_49645 ?auto_49646 ) ) ( not ( = ?auto_49647 ?auto_49646 ) ) ( ON ?auto_49647 ?auto_49645 ) ( not ( = ?auto_49644 ?auto_49646 ) ) ( not ( = ?auto_49642 ?auto_49644 ) ) ( not ( = ?auto_49643 ?auto_49644 ) ) ( not ( = ?auto_49645 ?auto_49644 ) ) ( not ( = ?auto_49647 ?auto_49644 ) ) ( ON ?auto_49644 ?auto_49648 ) ( not ( = ?auto_49642 ?auto_49648 ) ) ( not ( = ?auto_49643 ?auto_49648 ) ) ( not ( = ?auto_49645 ?auto_49648 ) ) ( not ( = ?auto_49647 ?auto_49648 ) ) ( not ( = ?auto_49646 ?auto_49648 ) ) ( not ( = ?auto_49644 ?auto_49648 ) ) ( CLEAR ?auto_49647 ) ( ON ?auto_49646 ?auto_49644 ) ( CLEAR ?auto_49646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49648 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49648 ?auto_49644 )
      ( MAKE-2PILE ?auto_49642 ?auto_49643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49649 - BLOCK
      ?auto_49650 - BLOCK
    )
    :vars
    (
      ?auto_49653 - BLOCK
      ?auto_49652 - BLOCK
      ?auto_49654 - BLOCK
      ?auto_49651 - BLOCK
      ?auto_49655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49653 ?auto_49650 ) ( ON-TABLE ?auto_49649 ) ( ON ?auto_49650 ?auto_49649 ) ( not ( = ?auto_49649 ?auto_49650 ) ) ( not ( = ?auto_49649 ?auto_49653 ) ) ( not ( = ?auto_49650 ?auto_49653 ) ) ( not ( = ?auto_49649 ?auto_49652 ) ) ( not ( = ?auto_49649 ?auto_49654 ) ) ( not ( = ?auto_49650 ?auto_49652 ) ) ( not ( = ?auto_49650 ?auto_49654 ) ) ( not ( = ?auto_49653 ?auto_49652 ) ) ( not ( = ?auto_49653 ?auto_49654 ) ) ( not ( = ?auto_49652 ?auto_49654 ) ) ( not ( = ?auto_49651 ?auto_49654 ) ) ( not ( = ?auto_49649 ?auto_49651 ) ) ( not ( = ?auto_49650 ?auto_49651 ) ) ( not ( = ?auto_49653 ?auto_49651 ) ) ( not ( = ?auto_49652 ?auto_49651 ) ) ( ON ?auto_49651 ?auto_49655 ) ( not ( = ?auto_49649 ?auto_49655 ) ) ( not ( = ?auto_49650 ?auto_49655 ) ) ( not ( = ?auto_49653 ?auto_49655 ) ) ( not ( = ?auto_49652 ?auto_49655 ) ) ( not ( = ?auto_49654 ?auto_49655 ) ) ( not ( = ?auto_49651 ?auto_49655 ) ) ( ON ?auto_49654 ?auto_49651 ) ( CLEAR ?auto_49654 ) ( ON-TABLE ?auto_49655 ) ( HOLDING ?auto_49652 ) ( CLEAR ?auto_49653 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49649 ?auto_49650 ?auto_49653 ?auto_49652 )
      ( MAKE-2PILE ?auto_49649 ?auto_49650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49656 - BLOCK
      ?auto_49657 - BLOCK
    )
    :vars
    (
      ?auto_49659 - BLOCK
      ?auto_49660 - BLOCK
      ?auto_49658 - BLOCK
      ?auto_49662 - BLOCK
      ?auto_49661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49659 ?auto_49657 ) ( ON-TABLE ?auto_49656 ) ( ON ?auto_49657 ?auto_49656 ) ( not ( = ?auto_49656 ?auto_49657 ) ) ( not ( = ?auto_49656 ?auto_49659 ) ) ( not ( = ?auto_49657 ?auto_49659 ) ) ( not ( = ?auto_49656 ?auto_49660 ) ) ( not ( = ?auto_49656 ?auto_49658 ) ) ( not ( = ?auto_49657 ?auto_49660 ) ) ( not ( = ?auto_49657 ?auto_49658 ) ) ( not ( = ?auto_49659 ?auto_49660 ) ) ( not ( = ?auto_49659 ?auto_49658 ) ) ( not ( = ?auto_49660 ?auto_49658 ) ) ( not ( = ?auto_49662 ?auto_49658 ) ) ( not ( = ?auto_49656 ?auto_49662 ) ) ( not ( = ?auto_49657 ?auto_49662 ) ) ( not ( = ?auto_49659 ?auto_49662 ) ) ( not ( = ?auto_49660 ?auto_49662 ) ) ( ON ?auto_49662 ?auto_49661 ) ( not ( = ?auto_49656 ?auto_49661 ) ) ( not ( = ?auto_49657 ?auto_49661 ) ) ( not ( = ?auto_49659 ?auto_49661 ) ) ( not ( = ?auto_49660 ?auto_49661 ) ) ( not ( = ?auto_49658 ?auto_49661 ) ) ( not ( = ?auto_49662 ?auto_49661 ) ) ( ON ?auto_49658 ?auto_49662 ) ( ON-TABLE ?auto_49661 ) ( CLEAR ?auto_49659 ) ( ON ?auto_49660 ?auto_49658 ) ( CLEAR ?auto_49660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49661 ?auto_49662 ?auto_49658 )
      ( MAKE-2PILE ?auto_49656 ?auto_49657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49677 - BLOCK
      ?auto_49678 - BLOCK
    )
    :vars
    (
      ?auto_49680 - BLOCK
      ?auto_49681 - BLOCK
      ?auto_49679 - BLOCK
      ?auto_49682 - BLOCK
      ?auto_49683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49677 ) ( not ( = ?auto_49677 ?auto_49678 ) ) ( not ( = ?auto_49677 ?auto_49680 ) ) ( not ( = ?auto_49678 ?auto_49680 ) ) ( not ( = ?auto_49677 ?auto_49681 ) ) ( not ( = ?auto_49677 ?auto_49679 ) ) ( not ( = ?auto_49678 ?auto_49681 ) ) ( not ( = ?auto_49678 ?auto_49679 ) ) ( not ( = ?auto_49680 ?auto_49681 ) ) ( not ( = ?auto_49680 ?auto_49679 ) ) ( not ( = ?auto_49681 ?auto_49679 ) ) ( not ( = ?auto_49682 ?auto_49679 ) ) ( not ( = ?auto_49677 ?auto_49682 ) ) ( not ( = ?auto_49678 ?auto_49682 ) ) ( not ( = ?auto_49680 ?auto_49682 ) ) ( not ( = ?auto_49681 ?auto_49682 ) ) ( ON ?auto_49682 ?auto_49683 ) ( not ( = ?auto_49677 ?auto_49683 ) ) ( not ( = ?auto_49678 ?auto_49683 ) ) ( not ( = ?auto_49680 ?auto_49683 ) ) ( not ( = ?auto_49681 ?auto_49683 ) ) ( not ( = ?auto_49679 ?auto_49683 ) ) ( not ( = ?auto_49682 ?auto_49683 ) ) ( ON ?auto_49679 ?auto_49682 ) ( ON-TABLE ?auto_49683 ) ( ON ?auto_49681 ?auto_49679 ) ( ON ?auto_49680 ?auto_49681 ) ( CLEAR ?auto_49680 ) ( HOLDING ?auto_49678 ) ( CLEAR ?auto_49677 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49677 ?auto_49678 ?auto_49680 )
      ( MAKE-2PILE ?auto_49677 ?auto_49678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49684 - BLOCK
      ?auto_49685 - BLOCK
    )
    :vars
    (
      ?auto_49687 - BLOCK
      ?auto_49690 - BLOCK
      ?auto_49686 - BLOCK
      ?auto_49689 - BLOCK
      ?auto_49688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49684 ) ( not ( = ?auto_49684 ?auto_49685 ) ) ( not ( = ?auto_49684 ?auto_49687 ) ) ( not ( = ?auto_49685 ?auto_49687 ) ) ( not ( = ?auto_49684 ?auto_49690 ) ) ( not ( = ?auto_49684 ?auto_49686 ) ) ( not ( = ?auto_49685 ?auto_49690 ) ) ( not ( = ?auto_49685 ?auto_49686 ) ) ( not ( = ?auto_49687 ?auto_49690 ) ) ( not ( = ?auto_49687 ?auto_49686 ) ) ( not ( = ?auto_49690 ?auto_49686 ) ) ( not ( = ?auto_49689 ?auto_49686 ) ) ( not ( = ?auto_49684 ?auto_49689 ) ) ( not ( = ?auto_49685 ?auto_49689 ) ) ( not ( = ?auto_49687 ?auto_49689 ) ) ( not ( = ?auto_49690 ?auto_49689 ) ) ( ON ?auto_49689 ?auto_49688 ) ( not ( = ?auto_49684 ?auto_49688 ) ) ( not ( = ?auto_49685 ?auto_49688 ) ) ( not ( = ?auto_49687 ?auto_49688 ) ) ( not ( = ?auto_49690 ?auto_49688 ) ) ( not ( = ?auto_49686 ?auto_49688 ) ) ( not ( = ?auto_49689 ?auto_49688 ) ) ( ON ?auto_49686 ?auto_49689 ) ( ON-TABLE ?auto_49688 ) ( ON ?auto_49690 ?auto_49686 ) ( ON ?auto_49687 ?auto_49690 ) ( CLEAR ?auto_49684 ) ( ON ?auto_49685 ?auto_49687 ) ( CLEAR ?auto_49685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49688 ?auto_49689 ?auto_49686 ?auto_49690 ?auto_49687 )
      ( MAKE-2PILE ?auto_49684 ?auto_49685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49691 - BLOCK
      ?auto_49692 - BLOCK
    )
    :vars
    (
      ?auto_49697 - BLOCK
      ?auto_49694 - BLOCK
      ?auto_49696 - BLOCK
      ?auto_49695 - BLOCK
      ?auto_49693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49691 ?auto_49692 ) ) ( not ( = ?auto_49691 ?auto_49697 ) ) ( not ( = ?auto_49692 ?auto_49697 ) ) ( not ( = ?auto_49691 ?auto_49694 ) ) ( not ( = ?auto_49691 ?auto_49696 ) ) ( not ( = ?auto_49692 ?auto_49694 ) ) ( not ( = ?auto_49692 ?auto_49696 ) ) ( not ( = ?auto_49697 ?auto_49694 ) ) ( not ( = ?auto_49697 ?auto_49696 ) ) ( not ( = ?auto_49694 ?auto_49696 ) ) ( not ( = ?auto_49695 ?auto_49696 ) ) ( not ( = ?auto_49691 ?auto_49695 ) ) ( not ( = ?auto_49692 ?auto_49695 ) ) ( not ( = ?auto_49697 ?auto_49695 ) ) ( not ( = ?auto_49694 ?auto_49695 ) ) ( ON ?auto_49695 ?auto_49693 ) ( not ( = ?auto_49691 ?auto_49693 ) ) ( not ( = ?auto_49692 ?auto_49693 ) ) ( not ( = ?auto_49697 ?auto_49693 ) ) ( not ( = ?auto_49694 ?auto_49693 ) ) ( not ( = ?auto_49696 ?auto_49693 ) ) ( not ( = ?auto_49695 ?auto_49693 ) ) ( ON ?auto_49696 ?auto_49695 ) ( ON-TABLE ?auto_49693 ) ( ON ?auto_49694 ?auto_49696 ) ( ON ?auto_49697 ?auto_49694 ) ( ON ?auto_49692 ?auto_49697 ) ( CLEAR ?auto_49692 ) ( HOLDING ?auto_49691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49691 )
      ( MAKE-2PILE ?auto_49691 ?auto_49692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49698 - BLOCK
      ?auto_49699 - BLOCK
    )
    :vars
    (
      ?auto_49703 - BLOCK
      ?auto_49701 - BLOCK
      ?auto_49702 - BLOCK
      ?auto_49700 - BLOCK
      ?auto_49704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49698 ?auto_49699 ) ) ( not ( = ?auto_49698 ?auto_49703 ) ) ( not ( = ?auto_49699 ?auto_49703 ) ) ( not ( = ?auto_49698 ?auto_49701 ) ) ( not ( = ?auto_49698 ?auto_49702 ) ) ( not ( = ?auto_49699 ?auto_49701 ) ) ( not ( = ?auto_49699 ?auto_49702 ) ) ( not ( = ?auto_49703 ?auto_49701 ) ) ( not ( = ?auto_49703 ?auto_49702 ) ) ( not ( = ?auto_49701 ?auto_49702 ) ) ( not ( = ?auto_49700 ?auto_49702 ) ) ( not ( = ?auto_49698 ?auto_49700 ) ) ( not ( = ?auto_49699 ?auto_49700 ) ) ( not ( = ?auto_49703 ?auto_49700 ) ) ( not ( = ?auto_49701 ?auto_49700 ) ) ( ON ?auto_49700 ?auto_49704 ) ( not ( = ?auto_49698 ?auto_49704 ) ) ( not ( = ?auto_49699 ?auto_49704 ) ) ( not ( = ?auto_49703 ?auto_49704 ) ) ( not ( = ?auto_49701 ?auto_49704 ) ) ( not ( = ?auto_49702 ?auto_49704 ) ) ( not ( = ?auto_49700 ?auto_49704 ) ) ( ON ?auto_49702 ?auto_49700 ) ( ON-TABLE ?auto_49704 ) ( ON ?auto_49701 ?auto_49702 ) ( ON ?auto_49703 ?auto_49701 ) ( ON ?auto_49699 ?auto_49703 ) ( ON ?auto_49698 ?auto_49699 ) ( CLEAR ?auto_49698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49704 ?auto_49700 ?auto_49702 ?auto_49701 ?auto_49703 ?auto_49699 )
      ( MAKE-2PILE ?auto_49698 ?auto_49699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49709 - BLOCK
      ?auto_49710 - BLOCK
      ?auto_49711 - BLOCK
      ?auto_49712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49712 ) ( CLEAR ?auto_49711 ) ( ON-TABLE ?auto_49709 ) ( ON ?auto_49710 ?auto_49709 ) ( ON ?auto_49711 ?auto_49710 ) ( not ( = ?auto_49709 ?auto_49710 ) ) ( not ( = ?auto_49709 ?auto_49711 ) ) ( not ( = ?auto_49709 ?auto_49712 ) ) ( not ( = ?auto_49710 ?auto_49711 ) ) ( not ( = ?auto_49710 ?auto_49712 ) ) ( not ( = ?auto_49711 ?auto_49712 ) ) )
    :subtasks
    ( ( !STACK ?auto_49712 ?auto_49711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49713 - BLOCK
      ?auto_49714 - BLOCK
      ?auto_49715 - BLOCK
      ?auto_49716 - BLOCK
    )
    :vars
    (
      ?auto_49717 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49715 ) ( ON-TABLE ?auto_49713 ) ( ON ?auto_49714 ?auto_49713 ) ( ON ?auto_49715 ?auto_49714 ) ( not ( = ?auto_49713 ?auto_49714 ) ) ( not ( = ?auto_49713 ?auto_49715 ) ) ( not ( = ?auto_49713 ?auto_49716 ) ) ( not ( = ?auto_49714 ?auto_49715 ) ) ( not ( = ?auto_49714 ?auto_49716 ) ) ( not ( = ?auto_49715 ?auto_49716 ) ) ( ON ?auto_49716 ?auto_49717 ) ( CLEAR ?auto_49716 ) ( HAND-EMPTY ) ( not ( = ?auto_49713 ?auto_49717 ) ) ( not ( = ?auto_49714 ?auto_49717 ) ) ( not ( = ?auto_49715 ?auto_49717 ) ) ( not ( = ?auto_49716 ?auto_49717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49716 ?auto_49717 )
      ( MAKE-4PILE ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49718 - BLOCK
      ?auto_49719 - BLOCK
      ?auto_49720 - BLOCK
      ?auto_49721 - BLOCK
    )
    :vars
    (
      ?auto_49722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49718 ) ( ON ?auto_49719 ?auto_49718 ) ( not ( = ?auto_49718 ?auto_49719 ) ) ( not ( = ?auto_49718 ?auto_49720 ) ) ( not ( = ?auto_49718 ?auto_49721 ) ) ( not ( = ?auto_49719 ?auto_49720 ) ) ( not ( = ?auto_49719 ?auto_49721 ) ) ( not ( = ?auto_49720 ?auto_49721 ) ) ( ON ?auto_49721 ?auto_49722 ) ( CLEAR ?auto_49721 ) ( not ( = ?auto_49718 ?auto_49722 ) ) ( not ( = ?auto_49719 ?auto_49722 ) ) ( not ( = ?auto_49720 ?auto_49722 ) ) ( not ( = ?auto_49721 ?auto_49722 ) ) ( HOLDING ?auto_49720 ) ( CLEAR ?auto_49719 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49718 ?auto_49719 ?auto_49720 )
      ( MAKE-4PILE ?auto_49718 ?auto_49719 ?auto_49720 ?auto_49721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49723 - BLOCK
      ?auto_49724 - BLOCK
      ?auto_49725 - BLOCK
      ?auto_49726 - BLOCK
    )
    :vars
    (
      ?auto_49727 - BLOCK
      ?auto_49728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49723 ) ( ON ?auto_49724 ?auto_49723 ) ( not ( = ?auto_49723 ?auto_49724 ) ) ( not ( = ?auto_49723 ?auto_49725 ) ) ( not ( = ?auto_49723 ?auto_49726 ) ) ( not ( = ?auto_49724 ?auto_49725 ) ) ( not ( = ?auto_49724 ?auto_49726 ) ) ( not ( = ?auto_49725 ?auto_49726 ) ) ( ON ?auto_49726 ?auto_49727 ) ( not ( = ?auto_49723 ?auto_49727 ) ) ( not ( = ?auto_49724 ?auto_49727 ) ) ( not ( = ?auto_49725 ?auto_49727 ) ) ( not ( = ?auto_49726 ?auto_49727 ) ) ( CLEAR ?auto_49724 ) ( ON ?auto_49725 ?auto_49726 ) ( CLEAR ?auto_49725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49728 ) ( ON ?auto_49727 ?auto_49728 ) ( not ( = ?auto_49728 ?auto_49727 ) ) ( not ( = ?auto_49728 ?auto_49726 ) ) ( not ( = ?auto_49728 ?auto_49725 ) ) ( not ( = ?auto_49723 ?auto_49728 ) ) ( not ( = ?auto_49724 ?auto_49728 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49728 ?auto_49727 ?auto_49726 )
      ( MAKE-4PILE ?auto_49723 ?auto_49724 ?auto_49725 ?auto_49726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49729 - BLOCK
      ?auto_49730 - BLOCK
      ?auto_49731 - BLOCK
      ?auto_49732 - BLOCK
    )
    :vars
    (
      ?auto_49733 - BLOCK
      ?auto_49734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49729 ) ( not ( = ?auto_49729 ?auto_49730 ) ) ( not ( = ?auto_49729 ?auto_49731 ) ) ( not ( = ?auto_49729 ?auto_49732 ) ) ( not ( = ?auto_49730 ?auto_49731 ) ) ( not ( = ?auto_49730 ?auto_49732 ) ) ( not ( = ?auto_49731 ?auto_49732 ) ) ( ON ?auto_49732 ?auto_49733 ) ( not ( = ?auto_49729 ?auto_49733 ) ) ( not ( = ?auto_49730 ?auto_49733 ) ) ( not ( = ?auto_49731 ?auto_49733 ) ) ( not ( = ?auto_49732 ?auto_49733 ) ) ( ON ?auto_49731 ?auto_49732 ) ( CLEAR ?auto_49731 ) ( ON-TABLE ?auto_49734 ) ( ON ?auto_49733 ?auto_49734 ) ( not ( = ?auto_49734 ?auto_49733 ) ) ( not ( = ?auto_49734 ?auto_49732 ) ) ( not ( = ?auto_49734 ?auto_49731 ) ) ( not ( = ?auto_49729 ?auto_49734 ) ) ( not ( = ?auto_49730 ?auto_49734 ) ) ( HOLDING ?auto_49730 ) ( CLEAR ?auto_49729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49729 ?auto_49730 )
      ( MAKE-4PILE ?auto_49729 ?auto_49730 ?auto_49731 ?auto_49732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49735 - BLOCK
      ?auto_49736 - BLOCK
      ?auto_49737 - BLOCK
      ?auto_49738 - BLOCK
    )
    :vars
    (
      ?auto_49739 - BLOCK
      ?auto_49740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49735 ) ( not ( = ?auto_49735 ?auto_49736 ) ) ( not ( = ?auto_49735 ?auto_49737 ) ) ( not ( = ?auto_49735 ?auto_49738 ) ) ( not ( = ?auto_49736 ?auto_49737 ) ) ( not ( = ?auto_49736 ?auto_49738 ) ) ( not ( = ?auto_49737 ?auto_49738 ) ) ( ON ?auto_49738 ?auto_49739 ) ( not ( = ?auto_49735 ?auto_49739 ) ) ( not ( = ?auto_49736 ?auto_49739 ) ) ( not ( = ?auto_49737 ?auto_49739 ) ) ( not ( = ?auto_49738 ?auto_49739 ) ) ( ON ?auto_49737 ?auto_49738 ) ( ON-TABLE ?auto_49740 ) ( ON ?auto_49739 ?auto_49740 ) ( not ( = ?auto_49740 ?auto_49739 ) ) ( not ( = ?auto_49740 ?auto_49738 ) ) ( not ( = ?auto_49740 ?auto_49737 ) ) ( not ( = ?auto_49735 ?auto_49740 ) ) ( not ( = ?auto_49736 ?auto_49740 ) ) ( CLEAR ?auto_49735 ) ( ON ?auto_49736 ?auto_49737 ) ( CLEAR ?auto_49736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49740 ?auto_49739 ?auto_49738 ?auto_49737 )
      ( MAKE-4PILE ?auto_49735 ?auto_49736 ?auto_49737 ?auto_49738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49741 - BLOCK
      ?auto_49742 - BLOCK
      ?auto_49743 - BLOCK
      ?auto_49744 - BLOCK
    )
    :vars
    (
      ?auto_49746 - BLOCK
      ?auto_49745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49741 ?auto_49742 ) ) ( not ( = ?auto_49741 ?auto_49743 ) ) ( not ( = ?auto_49741 ?auto_49744 ) ) ( not ( = ?auto_49742 ?auto_49743 ) ) ( not ( = ?auto_49742 ?auto_49744 ) ) ( not ( = ?auto_49743 ?auto_49744 ) ) ( ON ?auto_49744 ?auto_49746 ) ( not ( = ?auto_49741 ?auto_49746 ) ) ( not ( = ?auto_49742 ?auto_49746 ) ) ( not ( = ?auto_49743 ?auto_49746 ) ) ( not ( = ?auto_49744 ?auto_49746 ) ) ( ON ?auto_49743 ?auto_49744 ) ( ON-TABLE ?auto_49745 ) ( ON ?auto_49746 ?auto_49745 ) ( not ( = ?auto_49745 ?auto_49746 ) ) ( not ( = ?auto_49745 ?auto_49744 ) ) ( not ( = ?auto_49745 ?auto_49743 ) ) ( not ( = ?auto_49741 ?auto_49745 ) ) ( not ( = ?auto_49742 ?auto_49745 ) ) ( ON ?auto_49742 ?auto_49743 ) ( CLEAR ?auto_49742 ) ( HOLDING ?auto_49741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49741 )
      ( MAKE-4PILE ?auto_49741 ?auto_49742 ?auto_49743 ?auto_49744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49747 - BLOCK
      ?auto_49748 - BLOCK
      ?auto_49749 - BLOCK
      ?auto_49750 - BLOCK
    )
    :vars
    (
      ?auto_49751 - BLOCK
      ?auto_49752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49747 ?auto_49748 ) ) ( not ( = ?auto_49747 ?auto_49749 ) ) ( not ( = ?auto_49747 ?auto_49750 ) ) ( not ( = ?auto_49748 ?auto_49749 ) ) ( not ( = ?auto_49748 ?auto_49750 ) ) ( not ( = ?auto_49749 ?auto_49750 ) ) ( ON ?auto_49750 ?auto_49751 ) ( not ( = ?auto_49747 ?auto_49751 ) ) ( not ( = ?auto_49748 ?auto_49751 ) ) ( not ( = ?auto_49749 ?auto_49751 ) ) ( not ( = ?auto_49750 ?auto_49751 ) ) ( ON ?auto_49749 ?auto_49750 ) ( ON-TABLE ?auto_49752 ) ( ON ?auto_49751 ?auto_49752 ) ( not ( = ?auto_49752 ?auto_49751 ) ) ( not ( = ?auto_49752 ?auto_49750 ) ) ( not ( = ?auto_49752 ?auto_49749 ) ) ( not ( = ?auto_49747 ?auto_49752 ) ) ( not ( = ?auto_49748 ?auto_49752 ) ) ( ON ?auto_49748 ?auto_49749 ) ( ON ?auto_49747 ?auto_49748 ) ( CLEAR ?auto_49747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49752 ?auto_49751 ?auto_49750 ?auto_49749 ?auto_49748 )
      ( MAKE-4PILE ?auto_49747 ?auto_49748 ?auto_49749 ?auto_49750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49753 - BLOCK
      ?auto_49754 - BLOCK
      ?auto_49755 - BLOCK
      ?auto_49756 - BLOCK
    )
    :vars
    (
      ?auto_49758 - BLOCK
      ?auto_49757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49753 ?auto_49754 ) ) ( not ( = ?auto_49753 ?auto_49755 ) ) ( not ( = ?auto_49753 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49755 ) ) ( not ( = ?auto_49754 ?auto_49756 ) ) ( not ( = ?auto_49755 ?auto_49756 ) ) ( ON ?auto_49756 ?auto_49758 ) ( not ( = ?auto_49753 ?auto_49758 ) ) ( not ( = ?auto_49754 ?auto_49758 ) ) ( not ( = ?auto_49755 ?auto_49758 ) ) ( not ( = ?auto_49756 ?auto_49758 ) ) ( ON ?auto_49755 ?auto_49756 ) ( ON-TABLE ?auto_49757 ) ( ON ?auto_49758 ?auto_49757 ) ( not ( = ?auto_49757 ?auto_49758 ) ) ( not ( = ?auto_49757 ?auto_49756 ) ) ( not ( = ?auto_49757 ?auto_49755 ) ) ( not ( = ?auto_49753 ?auto_49757 ) ) ( not ( = ?auto_49754 ?auto_49757 ) ) ( ON ?auto_49754 ?auto_49755 ) ( HOLDING ?auto_49753 ) ( CLEAR ?auto_49754 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49757 ?auto_49758 ?auto_49756 ?auto_49755 ?auto_49754 ?auto_49753 )
      ( MAKE-4PILE ?auto_49753 ?auto_49754 ?auto_49755 ?auto_49756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49759 - BLOCK
      ?auto_49760 - BLOCK
      ?auto_49761 - BLOCK
      ?auto_49762 - BLOCK
    )
    :vars
    (
      ?auto_49764 - BLOCK
      ?auto_49763 - BLOCK
      ?auto_49765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49759 ?auto_49760 ) ) ( not ( = ?auto_49759 ?auto_49761 ) ) ( not ( = ?auto_49759 ?auto_49762 ) ) ( not ( = ?auto_49760 ?auto_49761 ) ) ( not ( = ?auto_49760 ?auto_49762 ) ) ( not ( = ?auto_49761 ?auto_49762 ) ) ( ON ?auto_49762 ?auto_49764 ) ( not ( = ?auto_49759 ?auto_49764 ) ) ( not ( = ?auto_49760 ?auto_49764 ) ) ( not ( = ?auto_49761 ?auto_49764 ) ) ( not ( = ?auto_49762 ?auto_49764 ) ) ( ON ?auto_49761 ?auto_49762 ) ( ON-TABLE ?auto_49763 ) ( ON ?auto_49764 ?auto_49763 ) ( not ( = ?auto_49763 ?auto_49764 ) ) ( not ( = ?auto_49763 ?auto_49762 ) ) ( not ( = ?auto_49763 ?auto_49761 ) ) ( not ( = ?auto_49759 ?auto_49763 ) ) ( not ( = ?auto_49760 ?auto_49763 ) ) ( ON ?auto_49760 ?auto_49761 ) ( CLEAR ?auto_49760 ) ( ON ?auto_49759 ?auto_49765 ) ( CLEAR ?auto_49759 ) ( HAND-EMPTY ) ( not ( = ?auto_49759 ?auto_49765 ) ) ( not ( = ?auto_49760 ?auto_49765 ) ) ( not ( = ?auto_49761 ?auto_49765 ) ) ( not ( = ?auto_49762 ?auto_49765 ) ) ( not ( = ?auto_49764 ?auto_49765 ) ) ( not ( = ?auto_49763 ?auto_49765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49759 ?auto_49765 )
      ( MAKE-4PILE ?auto_49759 ?auto_49760 ?auto_49761 ?auto_49762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49766 - BLOCK
      ?auto_49767 - BLOCK
      ?auto_49768 - BLOCK
      ?auto_49769 - BLOCK
    )
    :vars
    (
      ?auto_49771 - BLOCK
      ?auto_49770 - BLOCK
      ?auto_49772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49766 ?auto_49767 ) ) ( not ( = ?auto_49766 ?auto_49768 ) ) ( not ( = ?auto_49766 ?auto_49769 ) ) ( not ( = ?auto_49767 ?auto_49768 ) ) ( not ( = ?auto_49767 ?auto_49769 ) ) ( not ( = ?auto_49768 ?auto_49769 ) ) ( ON ?auto_49769 ?auto_49771 ) ( not ( = ?auto_49766 ?auto_49771 ) ) ( not ( = ?auto_49767 ?auto_49771 ) ) ( not ( = ?auto_49768 ?auto_49771 ) ) ( not ( = ?auto_49769 ?auto_49771 ) ) ( ON ?auto_49768 ?auto_49769 ) ( ON-TABLE ?auto_49770 ) ( ON ?auto_49771 ?auto_49770 ) ( not ( = ?auto_49770 ?auto_49771 ) ) ( not ( = ?auto_49770 ?auto_49769 ) ) ( not ( = ?auto_49770 ?auto_49768 ) ) ( not ( = ?auto_49766 ?auto_49770 ) ) ( not ( = ?auto_49767 ?auto_49770 ) ) ( ON ?auto_49766 ?auto_49772 ) ( CLEAR ?auto_49766 ) ( not ( = ?auto_49766 ?auto_49772 ) ) ( not ( = ?auto_49767 ?auto_49772 ) ) ( not ( = ?auto_49768 ?auto_49772 ) ) ( not ( = ?auto_49769 ?auto_49772 ) ) ( not ( = ?auto_49771 ?auto_49772 ) ) ( not ( = ?auto_49770 ?auto_49772 ) ) ( HOLDING ?auto_49767 ) ( CLEAR ?auto_49768 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49770 ?auto_49771 ?auto_49769 ?auto_49768 ?auto_49767 )
      ( MAKE-4PILE ?auto_49766 ?auto_49767 ?auto_49768 ?auto_49769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49773 - BLOCK
      ?auto_49774 - BLOCK
      ?auto_49775 - BLOCK
      ?auto_49776 - BLOCK
    )
    :vars
    (
      ?auto_49778 - BLOCK
      ?auto_49779 - BLOCK
      ?auto_49777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49773 ?auto_49774 ) ) ( not ( = ?auto_49773 ?auto_49775 ) ) ( not ( = ?auto_49773 ?auto_49776 ) ) ( not ( = ?auto_49774 ?auto_49775 ) ) ( not ( = ?auto_49774 ?auto_49776 ) ) ( not ( = ?auto_49775 ?auto_49776 ) ) ( ON ?auto_49776 ?auto_49778 ) ( not ( = ?auto_49773 ?auto_49778 ) ) ( not ( = ?auto_49774 ?auto_49778 ) ) ( not ( = ?auto_49775 ?auto_49778 ) ) ( not ( = ?auto_49776 ?auto_49778 ) ) ( ON ?auto_49775 ?auto_49776 ) ( ON-TABLE ?auto_49779 ) ( ON ?auto_49778 ?auto_49779 ) ( not ( = ?auto_49779 ?auto_49778 ) ) ( not ( = ?auto_49779 ?auto_49776 ) ) ( not ( = ?auto_49779 ?auto_49775 ) ) ( not ( = ?auto_49773 ?auto_49779 ) ) ( not ( = ?auto_49774 ?auto_49779 ) ) ( ON ?auto_49773 ?auto_49777 ) ( not ( = ?auto_49773 ?auto_49777 ) ) ( not ( = ?auto_49774 ?auto_49777 ) ) ( not ( = ?auto_49775 ?auto_49777 ) ) ( not ( = ?auto_49776 ?auto_49777 ) ) ( not ( = ?auto_49778 ?auto_49777 ) ) ( not ( = ?auto_49779 ?auto_49777 ) ) ( CLEAR ?auto_49775 ) ( ON ?auto_49774 ?auto_49773 ) ( CLEAR ?auto_49774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49777 ?auto_49773 )
      ( MAKE-4PILE ?auto_49773 ?auto_49774 ?auto_49775 ?auto_49776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49780 - BLOCK
      ?auto_49781 - BLOCK
      ?auto_49782 - BLOCK
      ?auto_49783 - BLOCK
    )
    :vars
    (
      ?auto_49784 - BLOCK
      ?auto_49785 - BLOCK
      ?auto_49786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49780 ?auto_49781 ) ) ( not ( = ?auto_49780 ?auto_49782 ) ) ( not ( = ?auto_49780 ?auto_49783 ) ) ( not ( = ?auto_49781 ?auto_49782 ) ) ( not ( = ?auto_49781 ?auto_49783 ) ) ( not ( = ?auto_49782 ?auto_49783 ) ) ( ON ?auto_49783 ?auto_49784 ) ( not ( = ?auto_49780 ?auto_49784 ) ) ( not ( = ?auto_49781 ?auto_49784 ) ) ( not ( = ?auto_49782 ?auto_49784 ) ) ( not ( = ?auto_49783 ?auto_49784 ) ) ( ON-TABLE ?auto_49785 ) ( ON ?auto_49784 ?auto_49785 ) ( not ( = ?auto_49785 ?auto_49784 ) ) ( not ( = ?auto_49785 ?auto_49783 ) ) ( not ( = ?auto_49785 ?auto_49782 ) ) ( not ( = ?auto_49780 ?auto_49785 ) ) ( not ( = ?auto_49781 ?auto_49785 ) ) ( ON ?auto_49780 ?auto_49786 ) ( not ( = ?auto_49780 ?auto_49786 ) ) ( not ( = ?auto_49781 ?auto_49786 ) ) ( not ( = ?auto_49782 ?auto_49786 ) ) ( not ( = ?auto_49783 ?auto_49786 ) ) ( not ( = ?auto_49784 ?auto_49786 ) ) ( not ( = ?auto_49785 ?auto_49786 ) ) ( ON ?auto_49781 ?auto_49780 ) ( CLEAR ?auto_49781 ) ( ON-TABLE ?auto_49786 ) ( HOLDING ?auto_49782 ) ( CLEAR ?auto_49783 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49785 ?auto_49784 ?auto_49783 ?auto_49782 )
      ( MAKE-4PILE ?auto_49780 ?auto_49781 ?auto_49782 ?auto_49783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49787 - BLOCK
      ?auto_49788 - BLOCK
      ?auto_49789 - BLOCK
      ?auto_49790 - BLOCK
    )
    :vars
    (
      ?auto_49791 - BLOCK
      ?auto_49792 - BLOCK
      ?auto_49793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49787 ?auto_49788 ) ) ( not ( = ?auto_49787 ?auto_49789 ) ) ( not ( = ?auto_49787 ?auto_49790 ) ) ( not ( = ?auto_49788 ?auto_49789 ) ) ( not ( = ?auto_49788 ?auto_49790 ) ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( ON ?auto_49790 ?auto_49791 ) ( not ( = ?auto_49787 ?auto_49791 ) ) ( not ( = ?auto_49788 ?auto_49791 ) ) ( not ( = ?auto_49789 ?auto_49791 ) ) ( not ( = ?auto_49790 ?auto_49791 ) ) ( ON-TABLE ?auto_49792 ) ( ON ?auto_49791 ?auto_49792 ) ( not ( = ?auto_49792 ?auto_49791 ) ) ( not ( = ?auto_49792 ?auto_49790 ) ) ( not ( = ?auto_49792 ?auto_49789 ) ) ( not ( = ?auto_49787 ?auto_49792 ) ) ( not ( = ?auto_49788 ?auto_49792 ) ) ( ON ?auto_49787 ?auto_49793 ) ( not ( = ?auto_49787 ?auto_49793 ) ) ( not ( = ?auto_49788 ?auto_49793 ) ) ( not ( = ?auto_49789 ?auto_49793 ) ) ( not ( = ?auto_49790 ?auto_49793 ) ) ( not ( = ?auto_49791 ?auto_49793 ) ) ( not ( = ?auto_49792 ?auto_49793 ) ) ( ON ?auto_49788 ?auto_49787 ) ( ON-TABLE ?auto_49793 ) ( CLEAR ?auto_49790 ) ( ON ?auto_49789 ?auto_49788 ) ( CLEAR ?auto_49789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49793 ?auto_49787 ?auto_49788 )
      ( MAKE-4PILE ?auto_49787 ?auto_49788 ?auto_49789 ?auto_49790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49794 - BLOCK
      ?auto_49795 - BLOCK
      ?auto_49796 - BLOCK
      ?auto_49797 - BLOCK
    )
    :vars
    (
      ?auto_49798 - BLOCK
      ?auto_49799 - BLOCK
      ?auto_49800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49794 ?auto_49795 ) ) ( not ( = ?auto_49794 ?auto_49796 ) ) ( not ( = ?auto_49794 ?auto_49797 ) ) ( not ( = ?auto_49795 ?auto_49796 ) ) ( not ( = ?auto_49795 ?auto_49797 ) ) ( not ( = ?auto_49796 ?auto_49797 ) ) ( not ( = ?auto_49794 ?auto_49798 ) ) ( not ( = ?auto_49795 ?auto_49798 ) ) ( not ( = ?auto_49796 ?auto_49798 ) ) ( not ( = ?auto_49797 ?auto_49798 ) ) ( ON-TABLE ?auto_49799 ) ( ON ?auto_49798 ?auto_49799 ) ( not ( = ?auto_49799 ?auto_49798 ) ) ( not ( = ?auto_49799 ?auto_49797 ) ) ( not ( = ?auto_49799 ?auto_49796 ) ) ( not ( = ?auto_49794 ?auto_49799 ) ) ( not ( = ?auto_49795 ?auto_49799 ) ) ( ON ?auto_49794 ?auto_49800 ) ( not ( = ?auto_49794 ?auto_49800 ) ) ( not ( = ?auto_49795 ?auto_49800 ) ) ( not ( = ?auto_49796 ?auto_49800 ) ) ( not ( = ?auto_49797 ?auto_49800 ) ) ( not ( = ?auto_49798 ?auto_49800 ) ) ( not ( = ?auto_49799 ?auto_49800 ) ) ( ON ?auto_49795 ?auto_49794 ) ( ON-TABLE ?auto_49800 ) ( ON ?auto_49796 ?auto_49795 ) ( CLEAR ?auto_49796 ) ( HOLDING ?auto_49797 ) ( CLEAR ?auto_49798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49799 ?auto_49798 ?auto_49797 )
      ( MAKE-4PILE ?auto_49794 ?auto_49795 ?auto_49796 ?auto_49797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49801 - BLOCK
      ?auto_49802 - BLOCK
      ?auto_49803 - BLOCK
      ?auto_49804 - BLOCK
    )
    :vars
    (
      ?auto_49806 - BLOCK
      ?auto_49807 - BLOCK
      ?auto_49805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49801 ?auto_49802 ) ) ( not ( = ?auto_49801 ?auto_49803 ) ) ( not ( = ?auto_49801 ?auto_49804 ) ) ( not ( = ?auto_49802 ?auto_49803 ) ) ( not ( = ?auto_49802 ?auto_49804 ) ) ( not ( = ?auto_49803 ?auto_49804 ) ) ( not ( = ?auto_49801 ?auto_49806 ) ) ( not ( = ?auto_49802 ?auto_49806 ) ) ( not ( = ?auto_49803 ?auto_49806 ) ) ( not ( = ?auto_49804 ?auto_49806 ) ) ( ON-TABLE ?auto_49807 ) ( ON ?auto_49806 ?auto_49807 ) ( not ( = ?auto_49807 ?auto_49806 ) ) ( not ( = ?auto_49807 ?auto_49804 ) ) ( not ( = ?auto_49807 ?auto_49803 ) ) ( not ( = ?auto_49801 ?auto_49807 ) ) ( not ( = ?auto_49802 ?auto_49807 ) ) ( ON ?auto_49801 ?auto_49805 ) ( not ( = ?auto_49801 ?auto_49805 ) ) ( not ( = ?auto_49802 ?auto_49805 ) ) ( not ( = ?auto_49803 ?auto_49805 ) ) ( not ( = ?auto_49804 ?auto_49805 ) ) ( not ( = ?auto_49806 ?auto_49805 ) ) ( not ( = ?auto_49807 ?auto_49805 ) ) ( ON ?auto_49802 ?auto_49801 ) ( ON-TABLE ?auto_49805 ) ( ON ?auto_49803 ?auto_49802 ) ( CLEAR ?auto_49806 ) ( ON ?auto_49804 ?auto_49803 ) ( CLEAR ?auto_49804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49805 ?auto_49801 ?auto_49802 ?auto_49803 )
      ( MAKE-4PILE ?auto_49801 ?auto_49802 ?auto_49803 ?auto_49804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49808 - BLOCK
      ?auto_49809 - BLOCK
      ?auto_49810 - BLOCK
      ?auto_49811 - BLOCK
    )
    :vars
    (
      ?auto_49813 - BLOCK
      ?auto_49812 - BLOCK
      ?auto_49814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49808 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49810 ) ) ( not ( = ?auto_49808 ?auto_49811 ) ) ( not ( = ?auto_49809 ?auto_49810 ) ) ( not ( = ?auto_49809 ?auto_49811 ) ) ( not ( = ?auto_49810 ?auto_49811 ) ) ( not ( = ?auto_49808 ?auto_49813 ) ) ( not ( = ?auto_49809 ?auto_49813 ) ) ( not ( = ?auto_49810 ?auto_49813 ) ) ( not ( = ?auto_49811 ?auto_49813 ) ) ( ON-TABLE ?auto_49812 ) ( not ( = ?auto_49812 ?auto_49813 ) ) ( not ( = ?auto_49812 ?auto_49811 ) ) ( not ( = ?auto_49812 ?auto_49810 ) ) ( not ( = ?auto_49808 ?auto_49812 ) ) ( not ( = ?auto_49809 ?auto_49812 ) ) ( ON ?auto_49808 ?auto_49814 ) ( not ( = ?auto_49808 ?auto_49814 ) ) ( not ( = ?auto_49809 ?auto_49814 ) ) ( not ( = ?auto_49810 ?auto_49814 ) ) ( not ( = ?auto_49811 ?auto_49814 ) ) ( not ( = ?auto_49813 ?auto_49814 ) ) ( not ( = ?auto_49812 ?auto_49814 ) ) ( ON ?auto_49809 ?auto_49808 ) ( ON-TABLE ?auto_49814 ) ( ON ?auto_49810 ?auto_49809 ) ( ON ?auto_49811 ?auto_49810 ) ( CLEAR ?auto_49811 ) ( HOLDING ?auto_49813 ) ( CLEAR ?auto_49812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49812 ?auto_49813 )
      ( MAKE-4PILE ?auto_49808 ?auto_49809 ?auto_49810 ?auto_49811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49815 - BLOCK
      ?auto_49816 - BLOCK
      ?auto_49817 - BLOCK
      ?auto_49818 - BLOCK
    )
    :vars
    (
      ?auto_49821 - BLOCK
      ?auto_49819 - BLOCK
      ?auto_49820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49815 ?auto_49816 ) ) ( not ( = ?auto_49815 ?auto_49817 ) ) ( not ( = ?auto_49815 ?auto_49818 ) ) ( not ( = ?auto_49816 ?auto_49817 ) ) ( not ( = ?auto_49816 ?auto_49818 ) ) ( not ( = ?auto_49817 ?auto_49818 ) ) ( not ( = ?auto_49815 ?auto_49821 ) ) ( not ( = ?auto_49816 ?auto_49821 ) ) ( not ( = ?auto_49817 ?auto_49821 ) ) ( not ( = ?auto_49818 ?auto_49821 ) ) ( ON-TABLE ?auto_49819 ) ( not ( = ?auto_49819 ?auto_49821 ) ) ( not ( = ?auto_49819 ?auto_49818 ) ) ( not ( = ?auto_49819 ?auto_49817 ) ) ( not ( = ?auto_49815 ?auto_49819 ) ) ( not ( = ?auto_49816 ?auto_49819 ) ) ( ON ?auto_49815 ?auto_49820 ) ( not ( = ?auto_49815 ?auto_49820 ) ) ( not ( = ?auto_49816 ?auto_49820 ) ) ( not ( = ?auto_49817 ?auto_49820 ) ) ( not ( = ?auto_49818 ?auto_49820 ) ) ( not ( = ?auto_49821 ?auto_49820 ) ) ( not ( = ?auto_49819 ?auto_49820 ) ) ( ON ?auto_49816 ?auto_49815 ) ( ON-TABLE ?auto_49820 ) ( ON ?auto_49817 ?auto_49816 ) ( ON ?auto_49818 ?auto_49817 ) ( CLEAR ?auto_49819 ) ( ON ?auto_49821 ?auto_49818 ) ( CLEAR ?auto_49821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49820 ?auto_49815 ?auto_49816 ?auto_49817 ?auto_49818 )
      ( MAKE-4PILE ?auto_49815 ?auto_49816 ?auto_49817 ?auto_49818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49822 - BLOCK
      ?auto_49823 - BLOCK
      ?auto_49824 - BLOCK
      ?auto_49825 - BLOCK
    )
    :vars
    (
      ?auto_49826 - BLOCK
      ?auto_49828 - BLOCK
      ?auto_49827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49822 ?auto_49823 ) ) ( not ( = ?auto_49822 ?auto_49824 ) ) ( not ( = ?auto_49822 ?auto_49825 ) ) ( not ( = ?auto_49823 ?auto_49824 ) ) ( not ( = ?auto_49823 ?auto_49825 ) ) ( not ( = ?auto_49824 ?auto_49825 ) ) ( not ( = ?auto_49822 ?auto_49826 ) ) ( not ( = ?auto_49823 ?auto_49826 ) ) ( not ( = ?auto_49824 ?auto_49826 ) ) ( not ( = ?auto_49825 ?auto_49826 ) ) ( not ( = ?auto_49828 ?auto_49826 ) ) ( not ( = ?auto_49828 ?auto_49825 ) ) ( not ( = ?auto_49828 ?auto_49824 ) ) ( not ( = ?auto_49822 ?auto_49828 ) ) ( not ( = ?auto_49823 ?auto_49828 ) ) ( ON ?auto_49822 ?auto_49827 ) ( not ( = ?auto_49822 ?auto_49827 ) ) ( not ( = ?auto_49823 ?auto_49827 ) ) ( not ( = ?auto_49824 ?auto_49827 ) ) ( not ( = ?auto_49825 ?auto_49827 ) ) ( not ( = ?auto_49826 ?auto_49827 ) ) ( not ( = ?auto_49828 ?auto_49827 ) ) ( ON ?auto_49823 ?auto_49822 ) ( ON-TABLE ?auto_49827 ) ( ON ?auto_49824 ?auto_49823 ) ( ON ?auto_49825 ?auto_49824 ) ( ON ?auto_49826 ?auto_49825 ) ( CLEAR ?auto_49826 ) ( HOLDING ?auto_49828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49828 )
      ( MAKE-4PILE ?auto_49822 ?auto_49823 ?auto_49824 ?auto_49825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49829 - BLOCK
      ?auto_49830 - BLOCK
      ?auto_49831 - BLOCK
      ?auto_49832 - BLOCK
    )
    :vars
    (
      ?auto_49835 - BLOCK
      ?auto_49833 - BLOCK
      ?auto_49834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49829 ?auto_49830 ) ) ( not ( = ?auto_49829 ?auto_49831 ) ) ( not ( = ?auto_49829 ?auto_49832 ) ) ( not ( = ?auto_49830 ?auto_49831 ) ) ( not ( = ?auto_49830 ?auto_49832 ) ) ( not ( = ?auto_49831 ?auto_49832 ) ) ( not ( = ?auto_49829 ?auto_49835 ) ) ( not ( = ?auto_49830 ?auto_49835 ) ) ( not ( = ?auto_49831 ?auto_49835 ) ) ( not ( = ?auto_49832 ?auto_49835 ) ) ( not ( = ?auto_49833 ?auto_49835 ) ) ( not ( = ?auto_49833 ?auto_49832 ) ) ( not ( = ?auto_49833 ?auto_49831 ) ) ( not ( = ?auto_49829 ?auto_49833 ) ) ( not ( = ?auto_49830 ?auto_49833 ) ) ( ON ?auto_49829 ?auto_49834 ) ( not ( = ?auto_49829 ?auto_49834 ) ) ( not ( = ?auto_49830 ?auto_49834 ) ) ( not ( = ?auto_49831 ?auto_49834 ) ) ( not ( = ?auto_49832 ?auto_49834 ) ) ( not ( = ?auto_49835 ?auto_49834 ) ) ( not ( = ?auto_49833 ?auto_49834 ) ) ( ON ?auto_49830 ?auto_49829 ) ( ON-TABLE ?auto_49834 ) ( ON ?auto_49831 ?auto_49830 ) ( ON ?auto_49832 ?auto_49831 ) ( ON ?auto_49835 ?auto_49832 ) ( ON ?auto_49833 ?auto_49835 ) ( CLEAR ?auto_49833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49834 ?auto_49829 ?auto_49830 ?auto_49831 ?auto_49832 ?auto_49835 )
      ( MAKE-4PILE ?auto_49829 ?auto_49830 ?auto_49831 ?auto_49832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49837 - BLOCK
    )
    :vars
    (
      ?auto_49838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49838 ?auto_49837 ) ( CLEAR ?auto_49838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49837 ) ( not ( = ?auto_49837 ?auto_49838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49838 ?auto_49837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49839 - BLOCK
    )
    :vars
    (
      ?auto_49840 - BLOCK
      ?auto_49841 - BLOCK
      ?auto_49842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49840 ?auto_49839 ) ( CLEAR ?auto_49840 ) ( ON-TABLE ?auto_49839 ) ( not ( = ?auto_49839 ?auto_49840 ) ) ( HOLDING ?auto_49841 ) ( CLEAR ?auto_49842 ) ( not ( = ?auto_49839 ?auto_49841 ) ) ( not ( = ?auto_49839 ?auto_49842 ) ) ( not ( = ?auto_49840 ?auto_49841 ) ) ( not ( = ?auto_49840 ?auto_49842 ) ) ( not ( = ?auto_49841 ?auto_49842 ) ) )
    :subtasks
    ( ( !STACK ?auto_49841 ?auto_49842 )
      ( MAKE-1PILE ?auto_49839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49843 - BLOCK
    )
    :vars
    (
      ?auto_49846 - BLOCK
      ?auto_49844 - BLOCK
      ?auto_49845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49846 ?auto_49843 ) ( ON-TABLE ?auto_49843 ) ( not ( = ?auto_49843 ?auto_49846 ) ) ( CLEAR ?auto_49844 ) ( not ( = ?auto_49843 ?auto_49845 ) ) ( not ( = ?auto_49843 ?auto_49844 ) ) ( not ( = ?auto_49846 ?auto_49845 ) ) ( not ( = ?auto_49846 ?auto_49844 ) ) ( not ( = ?auto_49845 ?auto_49844 ) ) ( ON ?auto_49845 ?auto_49846 ) ( CLEAR ?auto_49845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49843 ?auto_49846 )
      ( MAKE-1PILE ?auto_49843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49847 - BLOCK
    )
    :vars
    (
      ?auto_49850 - BLOCK
      ?auto_49849 - BLOCK
      ?auto_49848 - BLOCK
      ?auto_49852 - BLOCK
      ?auto_49851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49850 ?auto_49847 ) ( ON-TABLE ?auto_49847 ) ( not ( = ?auto_49847 ?auto_49850 ) ) ( not ( = ?auto_49847 ?auto_49849 ) ) ( not ( = ?auto_49847 ?auto_49848 ) ) ( not ( = ?auto_49850 ?auto_49849 ) ) ( not ( = ?auto_49850 ?auto_49848 ) ) ( not ( = ?auto_49849 ?auto_49848 ) ) ( ON ?auto_49849 ?auto_49850 ) ( CLEAR ?auto_49849 ) ( HOLDING ?auto_49848 ) ( CLEAR ?auto_49852 ) ( ON-TABLE ?auto_49851 ) ( ON ?auto_49852 ?auto_49851 ) ( not ( = ?auto_49851 ?auto_49852 ) ) ( not ( = ?auto_49851 ?auto_49848 ) ) ( not ( = ?auto_49852 ?auto_49848 ) ) ( not ( = ?auto_49847 ?auto_49852 ) ) ( not ( = ?auto_49847 ?auto_49851 ) ) ( not ( = ?auto_49850 ?auto_49852 ) ) ( not ( = ?auto_49850 ?auto_49851 ) ) ( not ( = ?auto_49849 ?auto_49852 ) ) ( not ( = ?auto_49849 ?auto_49851 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49851 ?auto_49852 ?auto_49848 )
      ( MAKE-1PILE ?auto_49847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49853 - BLOCK
    )
    :vars
    (
      ?auto_49856 - BLOCK
      ?auto_49855 - BLOCK
      ?auto_49857 - BLOCK
      ?auto_49854 - BLOCK
      ?auto_49858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49856 ?auto_49853 ) ( ON-TABLE ?auto_49853 ) ( not ( = ?auto_49853 ?auto_49856 ) ) ( not ( = ?auto_49853 ?auto_49855 ) ) ( not ( = ?auto_49853 ?auto_49857 ) ) ( not ( = ?auto_49856 ?auto_49855 ) ) ( not ( = ?auto_49856 ?auto_49857 ) ) ( not ( = ?auto_49855 ?auto_49857 ) ) ( ON ?auto_49855 ?auto_49856 ) ( CLEAR ?auto_49854 ) ( ON-TABLE ?auto_49858 ) ( ON ?auto_49854 ?auto_49858 ) ( not ( = ?auto_49858 ?auto_49854 ) ) ( not ( = ?auto_49858 ?auto_49857 ) ) ( not ( = ?auto_49854 ?auto_49857 ) ) ( not ( = ?auto_49853 ?auto_49854 ) ) ( not ( = ?auto_49853 ?auto_49858 ) ) ( not ( = ?auto_49856 ?auto_49854 ) ) ( not ( = ?auto_49856 ?auto_49858 ) ) ( not ( = ?auto_49855 ?auto_49854 ) ) ( not ( = ?auto_49855 ?auto_49858 ) ) ( ON ?auto_49857 ?auto_49855 ) ( CLEAR ?auto_49857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49853 ?auto_49856 ?auto_49855 )
      ( MAKE-1PILE ?auto_49853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49859 - BLOCK
    )
    :vars
    (
      ?auto_49860 - BLOCK
      ?auto_49862 - BLOCK
      ?auto_49863 - BLOCK
      ?auto_49864 - BLOCK
      ?auto_49861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49860 ?auto_49859 ) ( ON-TABLE ?auto_49859 ) ( not ( = ?auto_49859 ?auto_49860 ) ) ( not ( = ?auto_49859 ?auto_49862 ) ) ( not ( = ?auto_49859 ?auto_49863 ) ) ( not ( = ?auto_49860 ?auto_49862 ) ) ( not ( = ?auto_49860 ?auto_49863 ) ) ( not ( = ?auto_49862 ?auto_49863 ) ) ( ON ?auto_49862 ?auto_49860 ) ( ON-TABLE ?auto_49864 ) ( not ( = ?auto_49864 ?auto_49861 ) ) ( not ( = ?auto_49864 ?auto_49863 ) ) ( not ( = ?auto_49861 ?auto_49863 ) ) ( not ( = ?auto_49859 ?auto_49861 ) ) ( not ( = ?auto_49859 ?auto_49864 ) ) ( not ( = ?auto_49860 ?auto_49861 ) ) ( not ( = ?auto_49860 ?auto_49864 ) ) ( not ( = ?auto_49862 ?auto_49861 ) ) ( not ( = ?auto_49862 ?auto_49864 ) ) ( ON ?auto_49863 ?auto_49862 ) ( CLEAR ?auto_49863 ) ( HOLDING ?auto_49861 ) ( CLEAR ?auto_49864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49864 ?auto_49861 )
      ( MAKE-1PILE ?auto_49859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49865 - BLOCK
    )
    :vars
    (
      ?auto_49868 - BLOCK
      ?auto_49870 - BLOCK
      ?auto_49866 - BLOCK
      ?auto_49867 - BLOCK
      ?auto_49869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49868 ?auto_49865 ) ( ON-TABLE ?auto_49865 ) ( not ( = ?auto_49865 ?auto_49868 ) ) ( not ( = ?auto_49865 ?auto_49870 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( not ( = ?auto_49868 ?auto_49870 ) ) ( not ( = ?auto_49868 ?auto_49866 ) ) ( not ( = ?auto_49870 ?auto_49866 ) ) ( ON ?auto_49870 ?auto_49868 ) ( ON-TABLE ?auto_49867 ) ( not ( = ?auto_49867 ?auto_49869 ) ) ( not ( = ?auto_49867 ?auto_49866 ) ) ( not ( = ?auto_49869 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49869 ) ) ( not ( = ?auto_49865 ?auto_49867 ) ) ( not ( = ?auto_49868 ?auto_49869 ) ) ( not ( = ?auto_49868 ?auto_49867 ) ) ( not ( = ?auto_49870 ?auto_49869 ) ) ( not ( = ?auto_49870 ?auto_49867 ) ) ( ON ?auto_49866 ?auto_49870 ) ( CLEAR ?auto_49867 ) ( ON ?auto_49869 ?auto_49866 ) ( CLEAR ?auto_49869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49865 ?auto_49868 ?auto_49870 ?auto_49866 )
      ( MAKE-1PILE ?auto_49865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49871 - BLOCK
    )
    :vars
    (
      ?auto_49874 - BLOCK
      ?auto_49873 - BLOCK
      ?auto_49872 - BLOCK
      ?auto_49876 - BLOCK
      ?auto_49875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49874 ?auto_49871 ) ( ON-TABLE ?auto_49871 ) ( not ( = ?auto_49871 ?auto_49874 ) ) ( not ( = ?auto_49871 ?auto_49873 ) ) ( not ( = ?auto_49871 ?auto_49872 ) ) ( not ( = ?auto_49874 ?auto_49873 ) ) ( not ( = ?auto_49874 ?auto_49872 ) ) ( not ( = ?auto_49873 ?auto_49872 ) ) ( ON ?auto_49873 ?auto_49874 ) ( not ( = ?auto_49876 ?auto_49875 ) ) ( not ( = ?auto_49876 ?auto_49872 ) ) ( not ( = ?auto_49875 ?auto_49872 ) ) ( not ( = ?auto_49871 ?auto_49875 ) ) ( not ( = ?auto_49871 ?auto_49876 ) ) ( not ( = ?auto_49874 ?auto_49875 ) ) ( not ( = ?auto_49874 ?auto_49876 ) ) ( not ( = ?auto_49873 ?auto_49875 ) ) ( not ( = ?auto_49873 ?auto_49876 ) ) ( ON ?auto_49872 ?auto_49873 ) ( ON ?auto_49875 ?auto_49872 ) ( CLEAR ?auto_49875 ) ( HOLDING ?auto_49876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49876 )
      ( MAKE-1PILE ?auto_49871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49877 - BLOCK
    )
    :vars
    (
      ?auto_49878 - BLOCK
      ?auto_49879 - BLOCK
      ?auto_49882 - BLOCK
      ?auto_49881 - BLOCK
      ?auto_49880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49878 ?auto_49877 ) ( ON-TABLE ?auto_49877 ) ( not ( = ?auto_49877 ?auto_49878 ) ) ( not ( = ?auto_49877 ?auto_49879 ) ) ( not ( = ?auto_49877 ?auto_49882 ) ) ( not ( = ?auto_49878 ?auto_49879 ) ) ( not ( = ?auto_49878 ?auto_49882 ) ) ( not ( = ?auto_49879 ?auto_49882 ) ) ( ON ?auto_49879 ?auto_49878 ) ( not ( = ?auto_49881 ?auto_49880 ) ) ( not ( = ?auto_49881 ?auto_49882 ) ) ( not ( = ?auto_49880 ?auto_49882 ) ) ( not ( = ?auto_49877 ?auto_49880 ) ) ( not ( = ?auto_49877 ?auto_49881 ) ) ( not ( = ?auto_49878 ?auto_49880 ) ) ( not ( = ?auto_49878 ?auto_49881 ) ) ( not ( = ?auto_49879 ?auto_49880 ) ) ( not ( = ?auto_49879 ?auto_49881 ) ) ( ON ?auto_49882 ?auto_49879 ) ( ON ?auto_49880 ?auto_49882 ) ( ON ?auto_49881 ?auto_49880 ) ( CLEAR ?auto_49881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49877 ?auto_49878 ?auto_49879 ?auto_49882 ?auto_49880 )
      ( MAKE-1PILE ?auto_49877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49883 - BLOCK
    )
    :vars
    (
      ?auto_49888 - BLOCK
      ?auto_49887 - BLOCK
      ?auto_49884 - BLOCK
      ?auto_49886 - BLOCK
      ?auto_49885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49888 ?auto_49883 ) ( ON-TABLE ?auto_49883 ) ( not ( = ?auto_49883 ?auto_49888 ) ) ( not ( = ?auto_49883 ?auto_49887 ) ) ( not ( = ?auto_49883 ?auto_49884 ) ) ( not ( = ?auto_49888 ?auto_49887 ) ) ( not ( = ?auto_49888 ?auto_49884 ) ) ( not ( = ?auto_49887 ?auto_49884 ) ) ( ON ?auto_49887 ?auto_49888 ) ( not ( = ?auto_49886 ?auto_49885 ) ) ( not ( = ?auto_49886 ?auto_49884 ) ) ( not ( = ?auto_49885 ?auto_49884 ) ) ( not ( = ?auto_49883 ?auto_49885 ) ) ( not ( = ?auto_49883 ?auto_49886 ) ) ( not ( = ?auto_49888 ?auto_49885 ) ) ( not ( = ?auto_49888 ?auto_49886 ) ) ( not ( = ?auto_49887 ?auto_49885 ) ) ( not ( = ?auto_49887 ?auto_49886 ) ) ( ON ?auto_49884 ?auto_49887 ) ( ON ?auto_49885 ?auto_49884 ) ( HOLDING ?auto_49886 ) ( CLEAR ?auto_49885 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49883 ?auto_49888 ?auto_49887 ?auto_49884 ?auto_49885 ?auto_49886 )
      ( MAKE-1PILE ?auto_49883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49889 - BLOCK
    )
    :vars
    (
      ?auto_49894 - BLOCK
      ?auto_49893 - BLOCK
      ?auto_49890 - BLOCK
      ?auto_49891 - BLOCK
      ?auto_49892 - BLOCK
      ?auto_49895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49894 ?auto_49889 ) ( ON-TABLE ?auto_49889 ) ( not ( = ?auto_49889 ?auto_49894 ) ) ( not ( = ?auto_49889 ?auto_49893 ) ) ( not ( = ?auto_49889 ?auto_49890 ) ) ( not ( = ?auto_49894 ?auto_49893 ) ) ( not ( = ?auto_49894 ?auto_49890 ) ) ( not ( = ?auto_49893 ?auto_49890 ) ) ( ON ?auto_49893 ?auto_49894 ) ( not ( = ?auto_49891 ?auto_49892 ) ) ( not ( = ?auto_49891 ?auto_49890 ) ) ( not ( = ?auto_49892 ?auto_49890 ) ) ( not ( = ?auto_49889 ?auto_49892 ) ) ( not ( = ?auto_49889 ?auto_49891 ) ) ( not ( = ?auto_49894 ?auto_49892 ) ) ( not ( = ?auto_49894 ?auto_49891 ) ) ( not ( = ?auto_49893 ?auto_49892 ) ) ( not ( = ?auto_49893 ?auto_49891 ) ) ( ON ?auto_49890 ?auto_49893 ) ( ON ?auto_49892 ?auto_49890 ) ( CLEAR ?auto_49892 ) ( ON ?auto_49891 ?auto_49895 ) ( CLEAR ?auto_49891 ) ( HAND-EMPTY ) ( not ( = ?auto_49889 ?auto_49895 ) ) ( not ( = ?auto_49894 ?auto_49895 ) ) ( not ( = ?auto_49893 ?auto_49895 ) ) ( not ( = ?auto_49890 ?auto_49895 ) ) ( not ( = ?auto_49891 ?auto_49895 ) ) ( not ( = ?auto_49892 ?auto_49895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49891 ?auto_49895 )
      ( MAKE-1PILE ?auto_49889 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49896 - BLOCK
    )
    :vars
    (
      ?auto_49902 - BLOCK
      ?auto_49901 - BLOCK
      ?auto_49900 - BLOCK
      ?auto_49899 - BLOCK
      ?auto_49897 - BLOCK
      ?auto_49898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49902 ?auto_49896 ) ( ON-TABLE ?auto_49896 ) ( not ( = ?auto_49896 ?auto_49902 ) ) ( not ( = ?auto_49896 ?auto_49901 ) ) ( not ( = ?auto_49896 ?auto_49900 ) ) ( not ( = ?auto_49902 ?auto_49901 ) ) ( not ( = ?auto_49902 ?auto_49900 ) ) ( not ( = ?auto_49901 ?auto_49900 ) ) ( ON ?auto_49901 ?auto_49902 ) ( not ( = ?auto_49899 ?auto_49897 ) ) ( not ( = ?auto_49899 ?auto_49900 ) ) ( not ( = ?auto_49897 ?auto_49900 ) ) ( not ( = ?auto_49896 ?auto_49897 ) ) ( not ( = ?auto_49896 ?auto_49899 ) ) ( not ( = ?auto_49902 ?auto_49897 ) ) ( not ( = ?auto_49902 ?auto_49899 ) ) ( not ( = ?auto_49901 ?auto_49897 ) ) ( not ( = ?auto_49901 ?auto_49899 ) ) ( ON ?auto_49900 ?auto_49901 ) ( ON ?auto_49899 ?auto_49898 ) ( CLEAR ?auto_49899 ) ( not ( = ?auto_49896 ?auto_49898 ) ) ( not ( = ?auto_49902 ?auto_49898 ) ) ( not ( = ?auto_49901 ?auto_49898 ) ) ( not ( = ?auto_49900 ?auto_49898 ) ) ( not ( = ?auto_49899 ?auto_49898 ) ) ( not ( = ?auto_49897 ?auto_49898 ) ) ( HOLDING ?auto_49897 ) ( CLEAR ?auto_49900 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49896 ?auto_49902 ?auto_49901 ?auto_49900 ?auto_49897 )
      ( MAKE-1PILE ?auto_49896 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49903 - BLOCK
    )
    :vars
    (
      ?auto_49906 - BLOCK
      ?auto_49909 - BLOCK
      ?auto_49908 - BLOCK
      ?auto_49907 - BLOCK
      ?auto_49904 - BLOCK
      ?auto_49905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49906 ?auto_49903 ) ( ON-TABLE ?auto_49903 ) ( not ( = ?auto_49903 ?auto_49906 ) ) ( not ( = ?auto_49903 ?auto_49909 ) ) ( not ( = ?auto_49903 ?auto_49908 ) ) ( not ( = ?auto_49906 ?auto_49909 ) ) ( not ( = ?auto_49906 ?auto_49908 ) ) ( not ( = ?auto_49909 ?auto_49908 ) ) ( ON ?auto_49909 ?auto_49906 ) ( not ( = ?auto_49907 ?auto_49904 ) ) ( not ( = ?auto_49907 ?auto_49908 ) ) ( not ( = ?auto_49904 ?auto_49908 ) ) ( not ( = ?auto_49903 ?auto_49904 ) ) ( not ( = ?auto_49903 ?auto_49907 ) ) ( not ( = ?auto_49906 ?auto_49904 ) ) ( not ( = ?auto_49906 ?auto_49907 ) ) ( not ( = ?auto_49909 ?auto_49904 ) ) ( not ( = ?auto_49909 ?auto_49907 ) ) ( ON ?auto_49908 ?auto_49909 ) ( ON ?auto_49907 ?auto_49905 ) ( not ( = ?auto_49903 ?auto_49905 ) ) ( not ( = ?auto_49906 ?auto_49905 ) ) ( not ( = ?auto_49909 ?auto_49905 ) ) ( not ( = ?auto_49908 ?auto_49905 ) ) ( not ( = ?auto_49907 ?auto_49905 ) ) ( not ( = ?auto_49904 ?auto_49905 ) ) ( CLEAR ?auto_49908 ) ( ON ?auto_49904 ?auto_49907 ) ( CLEAR ?auto_49904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49905 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49905 ?auto_49907 )
      ( MAKE-1PILE ?auto_49903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49910 - BLOCK
    )
    :vars
    (
      ?auto_49911 - BLOCK
      ?auto_49915 - BLOCK
      ?auto_49916 - BLOCK
      ?auto_49913 - BLOCK
      ?auto_49914 - BLOCK
      ?auto_49912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49911 ?auto_49910 ) ( ON-TABLE ?auto_49910 ) ( not ( = ?auto_49910 ?auto_49911 ) ) ( not ( = ?auto_49910 ?auto_49915 ) ) ( not ( = ?auto_49910 ?auto_49916 ) ) ( not ( = ?auto_49911 ?auto_49915 ) ) ( not ( = ?auto_49911 ?auto_49916 ) ) ( not ( = ?auto_49915 ?auto_49916 ) ) ( ON ?auto_49915 ?auto_49911 ) ( not ( = ?auto_49913 ?auto_49914 ) ) ( not ( = ?auto_49913 ?auto_49916 ) ) ( not ( = ?auto_49914 ?auto_49916 ) ) ( not ( = ?auto_49910 ?auto_49914 ) ) ( not ( = ?auto_49910 ?auto_49913 ) ) ( not ( = ?auto_49911 ?auto_49914 ) ) ( not ( = ?auto_49911 ?auto_49913 ) ) ( not ( = ?auto_49915 ?auto_49914 ) ) ( not ( = ?auto_49915 ?auto_49913 ) ) ( ON ?auto_49913 ?auto_49912 ) ( not ( = ?auto_49910 ?auto_49912 ) ) ( not ( = ?auto_49911 ?auto_49912 ) ) ( not ( = ?auto_49915 ?auto_49912 ) ) ( not ( = ?auto_49916 ?auto_49912 ) ) ( not ( = ?auto_49913 ?auto_49912 ) ) ( not ( = ?auto_49914 ?auto_49912 ) ) ( ON ?auto_49914 ?auto_49913 ) ( CLEAR ?auto_49914 ) ( ON-TABLE ?auto_49912 ) ( HOLDING ?auto_49916 ) ( CLEAR ?auto_49915 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49910 ?auto_49911 ?auto_49915 ?auto_49916 )
      ( MAKE-1PILE ?auto_49910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49917 - BLOCK
    )
    :vars
    (
      ?auto_49922 - BLOCK
      ?auto_49923 - BLOCK
      ?auto_49918 - BLOCK
      ?auto_49920 - BLOCK
      ?auto_49921 - BLOCK
      ?auto_49919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49922 ?auto_49917 ) ( ON-TABLE ?auto_49917 ) ( not ( = ?auto_49917 ?auto_49922 ) ) ( not ( = ?auto_49917 ?auto_49923 ) ) ( not ( = ?auto_49917 ?auto_49918 ) ) ( not ( = ?auto_49922 ?auto_49923 ) ) ( not ( = ?auto_49922 ?auto_49918 ) ) ( not ( = ?auto_49923 ?auto_49918 ) ) ( ON ?auto_49923 ?auto_49922 ) ( not ( = ?auto_49920 ?auto_49921 ) ) ( not ( = ?auto_49920 ?auto_49918 ) ) ( not ( = ?auto_49921 ?auto_49918 ) ) ( not ( = ?auto_49917 ?auto_49921 ) ) ( not ( = ?auto_49917 ?auto_49920 ) ) ( not ( = ?auto_49922 ?auto_49921 ) ) ( not ( = ?auto_49922 ?auto_49920 ) ) ( not ( = ?auto_49923 ?auto_49921 ) ) ( not ( = ?auto_49923 ?auto_49920 ) ) ( ON ?auto_49920 ?auto_49919 ) ( not ( = ?auto_49917 ?auto_49919 ) ) ( not ( = ?auto_49922 ?auto_49919 ) ) ( not ( = ?auto_49923 ?auto_49919 ) ) ( not ( = ?auto_49918 ?auto_49919 ) ) ( not ( = ?auto_49920 ?auto_49919 ) ) ( not ( = ?auto_49921 ?auto_49919 ) ) ( ON ?auto_49921 ?auto_49920 ) ( ON-TABLE ?auto_49919 ) ( CLEAR ?auto_49923 ) ( ON ?auto_49918 ?auto_49921 ) ( CLEAR ?auto_49918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49919 ?auto_49920 ?auto_49921 )
      ( MAKE-1PILE ?auto_49917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49924 - BLOCK
    )
    :vars
    (
      ?auto_49930 - BLOCK
      ?auto_49927 - BLOCK
      ?auto_49929 - BLOCK
      ?auto_49928 - BLOCK
      ?auto_49926 - BLOCK
      ?auto_49925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49930 ?auto_49924 ) ( ON-TABLE ?auto_49924 ) ( not ( = ?auto_49924 ?auto_49930 ) ) ( not ( = ?auto_49924 ?auto_49927 ) ) ( not ( = ?auto_49924 ?auto_49929 ) ) ( not ( = ?auto_49930 ?auto_49927 ) ) ( not ( = ?auto_49930 ?auto_49929 ) ) ( not ( = ?auto_49927 ?auto_49929 ) ) ( not ( = ?auto_49928 ?auto_49926 ) ) ( not ( = ?auto_49928 ?auto_49929 ) ) ( not ( = ?auto_49926 ?auto_49929 ) ) ( not ( = ?auto_49924 ?auto_49926 ) ) ( not ( = ?auto_49924 ?auto_49928 ) ) ( not ( = ?auto_49930 ?auto_49926 ) ) ( not ( = ?auto_49930 ?auto_49928 ) ) ( not ( = ?auto_49927 ?auto_49926 ) ) ( not ( = ?auto_49927 ?auto_49928 ) ) ( ON ?auto_49928 ?auto_49925 ) ( not ( = ?auto_49924 ?auto_49925 ) ) ( not ( = ?auto_49930 ?auto_49925 ) ) ( not ( = ?auto_49927 ?auto_49925 ) ) ( not ( = ?auto_49929 ?auto_49925 ) ) ( not ( = ?auto_49928 ?auto_49925 ) ) ( not ( = ?auto_49926 ?auto_49925 ) ) ( ON ?auto_49926 ?auto_49928 ) ( ON-TABLE ?auto_49925 ) ( ON ?auto_49929 ?auto_49926 ) ( CLEAR ?auto_49929 ) ( HOLDING ?auto_49927 ) ( CLEAR ?auto_49930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49924 ?auto_49930 ?auto_49927 )
      ( MAKE-1PILE ?auto_49924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49931 - BLOCK
    )
    :vars
    (
      ?auto_49937 - BLOCK
      ?auto_49934 - BLOCK
      ?auto_49935 - BLOCK
      ?auto_49933 - BLOCK
      ?auto_49932 - BLOCK
      ?auto_49936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49937 ?auto_49931 ) ( ON-TABLE ?auto_49931 ) ( not ( = ?auto_49931 ?auto_49937 ) ) ( not ( = ?auto_49931 ?auto_49934 ) ) ( not ( = ?auto_49931 ?auto_49935 ) ) ( not ( = ?auto_49937 ?auto_49934 ) ) ( not ( = ?auto_49937 ?auto_49935 ) ) ( not ( = ?auto_49934 ?auto_49935 ) ) ( not ( = ?auto_49933 ?auto_49932 ) ) ( not ( = ?auto_49933 ?auto_49935 ) ) ( not ( = ?auto_49932 ?auto_49935 ) ) ( not ( = ?auto_49931 ?auto_49932 ) ) ( not ( = ?auto_49931 ?auto_49933 ) ) ( not ( = ?auto_49937 ?auto_49932 ) ) ( not ( = ?auto_49937 ?auto_49933 ) ) ( not ( = ?auto_49934 ?auto_49932 ) ) ( not ( = ?auto_49934 ?auto_49933 ) ) ( ON ?auto_49933 ?auto_49936 ) ( not ( = ?auto_49931 ?auto_49936 ) ) ( not ( = ?auto_49937 ?auto_49936 ) ) ( not ( = ?auto_49934 ?auto_49936 ) ) ( not ( = ?auto_49935 ?auto_49936 ) ) ( not ( = ?auto_49933 ?auto_49936 ) ) ( not ( = ?auto_49932 ?auto_49936 ) ) ( ON ?auto_49932 ?auto_49933 ) ( ON-TABLE ?auto_49936 ) ( ON ?auto_49935 ?auto_49932 ) ( CLEAR ?auto_49937 ) ( ON ?auto_49934 ?auto_49935 ) ( CLEAR ?auto_49934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49936 ?auto_49933 ?auto_49932 ?auto_49935 )
      ( MAKE-1PILE ?auto_49931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49952 - BLOCK
    )
    :vars
    (
      ?auto_49956 - BLOCK
      ?auto_49953 - BLOCK
      ?auto_49954 - BLOCK
      ?auto_49957 - BLOCK
      ?auto_49958 - BLOCK
      ?auto_49955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49952 ?auto_49956 ) ) ( not ( = ?auto_49952 ?auto_49953 ) ) ( not ( = ?auto_49952 ?auto_49954 ) ) ( not ( = ?auto_49956 ?auto_49953 ) ) ( not ( = ?auto_49956 ?auto_49954 ) ) ( not ( = ?auto_49953 ?auto_49954 ) ) ( not ( = ?auto_49957 ?auto_49958 ) ) ( not ( = ?auto_49957 ?auto_49954 ) ) ( not ( = ?auto_49958 ?auto_49954 ) ) ( not ( = ?auto_49952 ?auto_49958 ) ) ( not ( = ?auto_49952 ?auto_49957 ) ) ( not ( = ?auto_49956 ?auto_49958 ) ) ( not ( = ?auto_49956 ?auto_49957 ) ) ( not ( = ?auto_49953 ?auto_49958 ) ) ( not ( = ?auto_49953 ?auto_49957 ) ) ( ON ?auto_49957 ?auto_49955 ) ( not ( = ?auto_49952 ?auto_49955 ) ) ( not ( = ?auto_49956 ?auto_49955 ) ) ( not ( = ?auto_49953 ?auto_49955 ) ) ( not ( = ?auto_49954 ?auto_49955 ) ) ( not ( = ?auto_49957 ?auto_49955 ) ) ( not ( = ?auto_49958 ?auto_49955 ) ) ( ON ?auto_49958 ?auto_49957 ) ( ON-TABLE ?auto_49955 ) ( ON ?auto_49954 ?auto_49958 ) ( ON ?auto_49953 ?auto_49954 ) ( ON ?auto_49956 ?auto_49953 ) ( CLEAR ?auto_49956 ) ( HOLDING ?auto_49952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49952 ?auto_49956 )
      ( MAKE-1PILE ?auto_49952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49959 - BLOCK
    )
    :vars
    (
      ?auto_49962 - BLOCK
      ?auto_49961 - BLOCK
      ?auto_49963 - BLOCK
      ?auto_49964 - BLOCK
      ?auto_49965 - BLOCK
      ?auto_49960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49959 ?auto_49962 ) ) ( not ( = ?auto_49959 ?auto_49961 ) ) ( not ( = ?auto_49959 ?auto_49963 ) ) ( not ( = ?auto_49962 ?auto_49961 ) ) ( not ( = ?auto_49962 ?auto_49963 ) ) ( not ( = ?auto_49961 ?auto_49963 ) ) ( not ( = ?auto_49964 ?auto_49965 ) ) ( not ( = ?auto_49964 ?auto_49963 ) ) ( not ( = ?auto_49965 ?auto_49963 ) ) ( not ( = ?auto_49959 ?auto_49965 ) ) ( not ( = ?auto_49959 ?auto_49964 ) ) ( not ( = ?auto_49962 ?auto_49965 ) ) ( not ( = ?auto_49962 ?auto_49964 ) ) ( not ( = ?auto_49961 ?auto_49965 ) ) ( not ( = ?auto_49961 ?auto_49964 ) ) ( ON ?auto_49964 ?auto_49960 ) ( not ( = ?auto_49959 ?auto_49960 ) ) ( not ( = ?auto_49962 ?auto_49960 ) ) ( not ( = ?auto_49961 ?auto_49960 ) ) ( not ( = ?auto_49963 ?auto_49960 ) ) ( not ( = ?auto_49964 ?auto_49960 ) ) ( not ( = ?auto_49965 ?auto_49960 ) ) ( ON ?auto_49965 ?auto_49964 ) ( ON-TABLE ?auto_49960 ) ( ON ?auto_49963 ?auto_49965 ) ( ON ?auto_49961 ?auto_49963 ) ( ON ?auto_49962 ?auto_49961 ) ( ON ?auto_49959 ?auto_49962 ) ( CLEAR ?auto_49959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49960 ?auto_49964 ?auto_49965 ?auto_49963 ?auto_49961 ?auto_49962 )
      ( MAKE-1PILE ?auto_49959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49971 - BLOCK
      ?auto_49972 - BLOCK
      ?auto_49973 - BLOCK
      ?auto_49974 - BLOCK
      ?auto_49975 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49975 ) ( CLEAR ?auto_49974 ) ( ON-TABLE ?auto_49971 ) ( ON ?auto_49972 ?auto_49971 ) ( ON ?auto_49973 ?auto_49972 ) ( ON ?auto_49974 ?auto_49973 ) ( not ( = ?auto_49971 ?auto_49972 ) ) ( not ( = ?auto_49971 ?auto_49973 ) ) ( not ( = ?auto_49971 ?auto_49974 ) ) ( not ( = ?auto_49971 ?auto_49975 ) ) ( not ( = ?auto_49972 ?auto_49973 ) ) ( not ( = ?auto_49972 ?auto_49974 ) ) ( not ( = ?auto_49972 ?auto_49975 ) ) ( not ( = ?auto_49973 ?auto_49974 ) ) ( not ( = ?auto_49973 ?auto_49975 ) ) ( not ( = ?auto_49974 ?auto_49975 ) ) )
    :subtasks
    ( ( !STACK ?auto_49975 ?auto_49974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49976 - BLOCK
      ?auto_49977 - BLOCK
      ?auto_49978 - BLOCK
      ?auto_49979 - BLOCK
      ?auto_49980 - BLOCK
    )
    :vars
    (
      ?auto_49981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49979 ) ( ON-TABLE ?auto_49976 ) ( ON ?auto_49977 ?auto_49976 ) ( ON ?auto_49978 ?auto_49977 ) ( ON ?auto_49979 ?auto_49978 ) ( not ( = ?auto_49976 ?auto_49977 ) ) ( not ( = ?auto_49976 ?auto_49978 ) ) ( not ( = ?auto_49976 ?auto_49979 ) ) ( not ( = ?auto_49976 ?auto_49980 ) ) ( not ( = ?auto_49977 ?auto_49978 ) ) ( not ( = ?auto_49977 ?auto_49979 ) ) ( not ( = ?auto_49977 ?auto_49980 ) ) ( not ( = ?auto_49978 ?auto_49979 ) ) ( not ( = ?auto_49978 ?auto_49980 ) ) ( not ( = ?auto_49979 ?auto_49980 ) ) ( ON ?auto_49980 ?auto_49981 ) ( CLEAR ?auto_49980 ) ( HAND-EMPTY ) ( not ( = ?auto_49976 ?auto_49981 ) ) ( not ( = ?auto_49977 ?auto_49981 ) ) ( not ( = ?auto_49978 ?auto_49981 ) ) ( not ( = ?auto_49979 ?auto_49981 ) ) ( not ( = ?auto_49980 ?auto_49981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49980 ?auto_49981 )
      ( MAKE-5PILE ?auto_49976 ?auto_49977 ?auto_49978 ?auto_49979 ?auto_49980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49982 - BLOCK
      ?auto_49983 - BLOCK
      ?auto_49984 - BLOCK
      ?auto_49985 - BLOCK
      ?auto_49986 - BLOCK
    )
    :vars
    (
      ?auto_49987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49982 ) ( ON ?auto_49983 ?auto_49982 ) ( ON ?auto_49984 ?auto_49983 ) ( not ( = ?auto_49982 ?auto_49983 ) ) ( not ( = ?auto_49982 ?auto_49984 ) ) ( not ( = ?auto_49982 ?auto_49985 ) ) ( not ( = ?auto_49982 ?auto_49986 ) ) ( not ( = ?auto_49983 ?auto_49984 ) ) ( not ( = ?auto_49983 ?auto_49985 ) ) ( not ( = ?auto_49983 ?auto_49986 ) ) ( not ( = ?auto_49984 ?auto_49985 ) ) ( not ( = ?auto_49984 ?auto_49986 ) ) ( not ( = ?auto_49985 ?auto_49986 ) ) ( ON ?auto_49986 ?auto_49987 ) ( CLEAR ?auto_49986 ) ( not ( = ?auto_49982 ?auto_49987 ) ) ( not ( = ?auto_49983 ?auto_49987 ) ) ( not ( = ?auto_49984 ?auto_49987 ) ) ( not ( = ?auto_49985 ?auto_49987 ) ) ( not ( = ?auto_49986 ?auto_49987 ) ) ( HOLDING ?auto_49985 ) ( CLEAR ?auto_49984 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49982 ?auto_49983 ?auto_49984 ?auto_49985 )
      ( MAKE-5PILE ?auto_49982 ?auto_49983 ?auto_49984 ?auto_49985 ?auto_49986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49988 - BLOCK
      ?auto_49989 - BLOCK
      ?auto_49990 - BLOCK
      ?auto_49991 - BLOCK
      ?auto_49992 - BLOCK
    )
    :vars
    (
      ?auto_49993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49988 ) ( ON ?auto_49989 ?auto_49988 ) ( ON ?auto_49990 ?auto_49989 ) ( not ( = ?auto_49988 ?auto_49989 ) ) ( not ( = ?auto_49988 ?auto_49990 ) ) ( not ( = ?auto_49988 ?auto_49991 ) ) ( not ( = ?auto_49988 ?auto_49992 ) ) ( not ( = ?auto_49989 ?auto_49990 ) ) ( not ( = ?auto_49989 ?auto_49991 ) ) ( not ( = ?auto_49989 ?auto_49992 ) ) ( not ( = ?auto_49990 ?auto_49991 ) ) ( not ( = ?auto_49990 ?auto_49992 ) ) ( not ( = ?auto_49991 ?auto_49992 ) ) ( ON ?auto_49992 ?auto_49993 ) ( not ( = ?auto_49988 ?auto_49993 ) ) ( not ( = ?auto_49989 ?auto_49993 ) ) ( not ( = ?auto_49990 ?auto_49993 ) ) ( not ( = ?auto_49991 ?auto_49993 ) ) ( not ( = ?auto_49992 ?auto_49993 ) ) ( CLEAR ?auto_49990 ) ( ON ?auto_49991 ?auto_49992 ) ( CLEAR ?auto_49991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49993 ?auto_49992 )
      ( MAKE-5PILE ?auto_49988 ?auto_49989 ?auto_49990 ?auto_49991 ?auto_49992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49994 - BLOCK
      ?auto_49995 - BLOCK
      ?auto_49996 - BLOCK
      ?auto_49997 - BLOCK
      ?auto_49998 - BLOCK
    )
    :vars
    (
      ?auto_49999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49994 ) ( ON ?auto_49995 ?auto_49994 ) ( not ( = ?auto_49994 ?auto_49995 ) ) ( not ( = ?auto_49994 ?auto_49996 ) ) ( not ( = ?auto_49994 ?auto_49997 ) ) ( not ( = ?auto_49994 ?auto_49998 ) ) ( not ( = ?auto_49995 ?auto_49996 ) ) ( not ( = ?auto_49995 ?auto_49997 ) ) ( not ( = ?auto_49995 ?auto_49998 ) ) ( not ( = ?auto_49996 ?auto_49997 ) ) ( not ( = ?auto_49996 ?auto_49998 ) ) ( not ( = ?auto_49997 ?auto_49998 ) ) ( ON ?auto_49998 ?auto_49999 ) ( not ( = ?auto_49994 ?auto_49999 ) ) ( not ( = ?auto_49995 ?auto_49999 ) ) ( not ( = ?auto_49996 ?auto_49999 ) ) ( not ( = ?auto_49997 ?auto_49999 ) ) ( not ( = ?auto_49998 ?auto_49999 ) ) ( ON ?auto_49997 ?auto_49998 ) ( CLEAR ?auto_49997 ) ( ON-TABLE ?auto_49999 ) ( HOLDING ?auto_49996 ) ( CLEAR ?auto_49995 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49994 ?auto_49995 ?auto_49996 )
      ( MAKE-5PILE ?auto_49994 ?auto_49995 ?auto_49996 ?auto_49997 ?auto_49998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50000 - BLOCK
      ?auto_50001 - BLOCK
      ?auto_50002 - BLOCK
      ?auto_50003 - BLOCK
      ?auto_50004 - BLOCK
    )
    :vars
    (
      ?auto_50005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50000 ) ( ON ?auto_50001 ?auto_50000 ) ( not ( = ?auto_50000 ?auto_50001 ) ) ( not ( = ?auto_50000 ?auto_50002 ) ) ( not ( = ?auto_50000 ?auto_50003 ) ) ( not ( = ?auto_50000 ?auto_50004 ) ) ( not ( = ?auto_50001 ?auto_50002 ) ) ( not ( = ?auto_50001 ?auto_50003 ) ) ( not ( = ?auto_50001 ?auto_50004 ) ) ( not ( = ?auto_50002 ?auto_50003 ) ) ( not ( = ?auto_50002 ?auto_50004 ) ) ( not ( = ?auto_50003 ?auto_50004 ) ) ( ON ?auto_50004 ?auto_50005 ) ( not ( = ?auto_50000 ?auto_50005 ) ) ( not ( = ?auto_50001 ?auto_50005 ) ) ( not ( = ?auto_50002 ?auto_50005 ) ) ( not ( = ?auto_50003 ?auto_50005 ) ) ( not ( = ?auto_50004 ?auto_50005 ) ) ( ON ?auto_50003 ?auto_50004 ) ( ON-TABLE ?auto_50005 ) ( CLEAR ?auto_50001 ) ( ON ?auto_50002 ?auto_50003 ) ( CLEAR ?auto_50002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50005 ?auto_50004 ?auto_50003 )
      ( MAKE-5PILE ?auto_50000 ?auto_50001 ?auto_50002 ?auto_50003 ?auto_50004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50006 - BLOCK
      ?auto_50007 - BLOCK
      ?auto_50008 - BLOCK
      ?auto_50009 - BLOCK
      ?auto_50010 - BLOCK
    )
    :vars
    (
      ?auto_50011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50006 ) ( not ( = ?auto_50006 ?auto_50007 ) ) ( not ( = ?auto_50006 ?auto_50008 ) ) ( not ( = ?auto_50006 ?auto_50009 ) ) ( not ( = ?auto_50006 ?auto_50010 ) ) ( not ( = ?auto_50007 ?auto_50008 ) ) ( not ( = ?auto_50007 ?auto_50009 ) ) ( not ( = ?auto_50007 ?auto_50010 ) ) ( not ( = ?auto_50008 ?auto_50009 ) ) ( not ( = ?auto_50008 ?auto_50010 ) ) ( not ( = ?auto_50009 ?auto_50010 ) ) ( ON ?auto_50010 ?auto_50011 ) ( not ( = ?auto_50006 ?auto_50011 ) ) ( not ( = ?auto_50007 ?auto_50011 ) ) ( not ( = ?auto_50008 ?auto_50011 ) ) ( not ( = ?auto_50009 ?auto_50011 ) ) ( not ( = ?auto_50010 ?auto_50011 ) ) ( ON ?auto_50009 ?auto_50010 ) ( ON-TABLE ?auto_50011 ) ( ON ?auto_50008 ?auto_50009 ) ( CLEAR ?auto_50008 ) ( HOLDING ?auto_50007 ) ( CLEAR ?auto_50006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50006 ?auto_50007 )
      ( MAKE-5PILE ?auto_50006 ?auto_50007 ?auto_50008 ?auto_50009 ?auto_50010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50012 - BLOCK
      ?auto_50013 - BLOCK
      ?auto_50014 - BLOCK
      ?auto_50015 - BLOCK
      ?auto_50016 - BLOCK
    )
    :vars
    (
      ?auto_50017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50012 ) ( not ( = ?auto_50012 ?auto_50013 ) ) ( not ( = ?auto_50012 ?auto_50014 ) ) ( not ( = ?auto_50012 ?auto_50015 ) ) ( not ( = ?auto_50012 ?auto_50016 ) ) ( not ( = ?auto_50013 ?auto_50014 ) ) ( not ( = ?auto_50013 ?auto_50015 ) ) ( not ( = ?auto_50013 ?auto_50016 ) ) ( not ( = ?auto_50014 ?auto_50015 ) ) ( not ( = ?auto_50014 ?auto_50016 ) ) ( not ( = ?auto_50015 ?auto_50016 ) ) ( ON ?auto_50016 ?auto_50017 ) ( not ( = ?auto_50012 ?auto_50017 ) ) ( not ( = ?auto_50013 ?auto_50017 ) ) ( not ( = ?auto_50014 ?auto_50017 ) ) ( not ( = ?auto_50015 ?auto_50017 ) ) ( not ( = ?auto_50016 ?auto_50017 ) ) ( ON ?auto_50015 ?auto_50016 ) ( ON-TABLE ?auto_50017 ) ( ON ?auto_50014 ?auto_50015 ) ( CLEAR ?auto_50012 ) ( ON ?auto_50013 ?auto_50014 ) ( CLEAR ?auto_50013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50017 ?auto_50016 ?auto_50015 ?auto_50014 )
      ( MAKE-5PILE ?auto_50012 ?auto_50013 ?auto_50014 ?auto_50015 ?auto_50016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50018 - BLOCK
      ?auto_50019 - BLOCK
      ?auto_50020 - BLOCK
      ?auto_50021 - BLOCK
      ?auto_50022 - BLOCK
    )
    :vars
    (
      ?auto_50023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50018 ?auto_50019 ) ) ( not ( = ?auto_50018 ?auto_50020 ) ) ( not ( = ?auto_50018 ?auto_50021 ) ) ( not ( = ?auto_50018 ?auto_50022 ) ) ( not ( = ?auto_50019 ?auto_50020 ) ) ( not ( = ?auto_50019 ?auto_50021 ) ) ( not ( = ?auto_50019 ?auto_50022 ) ) ( not ( = ?auto_50020 ?auto_50021 ) ) ( not ( = ?auto_50020 ?auto_50022 ) ) ( not ( = ?auto_50021 ?auto_50022 ) ) ( ON ?auto_50022 ?auto_50023 ) ( not ( = ?auto_50018 ?auto_50023 ) ) ( not ( = ?auto_50019 ?auto_50023 ) ) ( not ( = ?auto_50020 ?auto_50023 ) ) ( not ( = ?auto_50021 ?auto_50023 ) ) ( not ( = ?auto_50022 ?auto_50023 ) ) ( ON ?auto_50021 ?auto_50022 ) ( ON-TABLE ?auto_50023 ) ( ON ?auto_50020 ?auto_50021 ) ( ON ?auto_50019 ?auto_50020 ) ( CLEAR ?auto_50019 ) ( HOLDING ?auto_50018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50018 )
      ( MAKE-5PILE ?auto_50018 ?auto_50019 ?auto_50020 ?auto_50021 ?auto_50022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50024 - BLOCK
      ?auto_50025 - BLOCK
      ?auto_50026 - BLOCK
      ?auto_50027 - BLOCK
      ?auto_50028 - BLOCK
    )
    :vars
    (
      ?auto_50029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50024 ?auto_50025 ) ) ( not ( = ?auto_50024 ?auto_50026 ) ) ( not ( = ?auto_50024 ?auto_50027 ) ) ( not ( = ?auto_50024 ?auto_50028 ) ) ( not ( = ?auto_50025 ?auto_50026 ) ) ( not ( = ?auto_50025 ?auto_50027 ) ) ( not ( = ?auto_50025 ?auto_50028 ) ) ( not ( = ?auto_50026 ?auto_50027 ) ) ( not ( = ?auto_50026 ?auto_50028 ) ) ( not ( = ?auto_50027 ?auto_50028 ) ) ( ON ?auto_50028 ?auto_50029 ) ( not ( = ?auto_50024 ?auto_50029 ) ) ( not ( = ?auto_50025 ?auto_50029 ) ) ( not ( = ?auto_50026 ?auto_50029 ) ) ( not ( = ?auto_50027 ?auto_50029 ) ) ( not ( = ?auto_50028 ?auto_50029 ) ) ( ON ?auto_50027 ?auto_50028 ) ( ON-TABLE ?auto_50029 ) ( ON ?auto_50026 ?auto_50027 ) ( ON ?auto_50025 ?auto_50026 ) ( ON ?auto_50024 ?auto_50025 ) ( CLEAR ?auto_50024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50029 ?auto_50028 ?auto_50027 ?auto_50026 ?auto_50025 )
      ( MAKE-5PILE ?auto_50024 ?auto_50025 ?auto_50026 ?auto_50027 ?auto_50028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50030 - BLOCK
      ?auto_50031 - BLOCK
      ?auto_50032 - BLOCK
      ?auto_50033 - BLOCK
      ?auto_50034 - BLOCK
    )
    :vars
    (
      ?auto_50035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50030 ?auto_50031 ) ) ( not ( = ?auto_50030 ?auto_50032 ) ) ( not ( = ?auto_50030 ?auto_50033 ) ) ( not ( = ?auto_50030 ?auto_50034 ) ) ( not ( = ?auto_50031 ?auto_50032 ) ) ( not ( = ?auto_50031 ?auto_50033 ) ) ( not ( = ?auto_50031 ?auto_50034 ) ) ( not ( = ?auto_50032 ?auto_50033 ) ) ( not ( = ?auto_50032 ?auto_50034 ) ) ( not ( = ?auto_50033 ?auto_50034 ) ) ( ON ?auto_50034 ?auto_50035 ) ( not ( = ?auto_50030 ?auto_50035 ) ) ( not ( = ?auto_50031 ?auto_50035 ) ) ( not ( = ?auto_50032 ?auto_50035 ) ) ( not ( = ?auto_50033 ?auto_50035 ) ) ( not ( = ?auto_50034 ?auto_50035 ) ) ( ON ?auto_50033 ?auto_50034 ) ( ON-TABLE ?auto_50035 ) ( ON ?auto_50032 ?auto_50033 ) ( ON ?auto_50031 ?auto_50032 ) ( HOLDING ?auto_50030 ) ( CLEAR ?auto_50031 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50035 ?auto_50034 ?auto_50033 ?auto_50032 ?auto_50031 ?auto_50030 )
      ( MAKE-5PILE ?auto_50030 ?auto_50031 ?auto_50032 ?auto_50033 ?auto_50034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50036 - BLOCK
      ?auto_50037 - BLOCK
      ?auto_50038 - BLOCK
      ?auto_50039 - BLOCK
      ?auto_50040 - BLOCK
    )
    :vars
    (
      ?auto_50041 - BLOCK
      ?auto_50042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50036 ?auto_50037 ) ) ( not ( = ?auto_50036 ?auto_50038 ) ) ( not ( = ?auto_50036 ?auto_50039 ) ) ( not ( = ?auto_50036 ?auto_50040 ) ) ( not ( = ?auto_50037 ?auto_50038 ) ) ( not ( = ?auto_50037 ?auto_50039 ) ) ( not ( = ?auto_50037 ?auto_50040 ) ) ( not ( = ?auto_50038 ?auto_50039 ) ) ( not ( = ?auto_50038 ?auto_50040 ) ) ( not ( = ?auto_50039 ?auto_50040 ) ) ( ON ?auto_50040 ?auto_50041 ) ( not ( = ?auto_50036 ?auto_50041 ) ) ( not ( = ?auto_50037 ?auto_50041 ) ) ( not ( = ?auto_50038 ?auto_50041 ) ) ( not ( = ?auto_50039 ?auto_50041 ) ) ( not ( = ?auto_50040 ?auto_50041 ) ) ( ON ?auto_50039 ?auto_50040 ) ( ON-TABLE ?auto_50041 ) ( ON ?auto_50038 ?auto_50039 ) ( ON ?auto_50037 ?auto_50038 ) ( CLEAR ?auto_50037 ) ( ON ?auto_50036 ?auto_50042 ) ( CLEAR ?auto_50036 ) ( HAND-EMPTY ) ( not ( = ?auto_50036 ?auto_50042 ) ) ( not ( = ?auto_50037 ?auto_50042 ) ) ( not ( = ?auto_50038 ?auto_50042 ) ) ( not ( = ?auto_50039 ?auto_50042 ) ) ( not ( = ?auto_50040 ?auto_50042 ) ) ( not ( = ?auto_50041 ?auto_50042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50036 ?auto_50042 )
      ( MAKE-5PILE ?auto_50036 ?auto_50037 ?auto_50038 ?auto_50039 ?auto_50040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50043 - BLOCK
      ?auto_50044 - BLOCK
      ?auto_50045 - BLOCK
      ?auto_50046 - BLOCK
      ?auto_50047 - BLOCK
    )
    :vars
    (
      ?auto_50049 - BLOCK
      ?auto_50048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50043 ?auto_50044 ) ) ( not ( = ?auto_50043 ?auto_50045 ) ) ( not ( = ?auto_50043 ?auto_50046 ) ) ( not ( = ?auto_50043 ?auto_50047 ) ) ( not ( = ?auto_50044 ?auto_50045 ) ) ( not ( = ?auto_50044 ?auto_50046 ) ) ( not ( = ?auto_50044 ?auto_50047 ) ) ( not ( = ?auto_50045 ?auto_50046 ) ) ( not ( = ?auto_50045 ?auto_50047 ) ) ( not ( = ?auto_50046 ?auto_50047 ) ) ( ON ?auto_50047 ?auto_50049 ) ( not ( = ?auto_50043 ?auto_50049 ) ) ( not ( = ?auto_50044 ?auto_50049 ) ) ( not ( = ?auto_50045 ?auto_50049 ) ) ( not ( = ?auto_50046 ?auto_50049 ) ) ( not ( = ?auto_50047 ?auto_50049 ) ) ( ON ?auto_50046 ?auto_50047 ) ( ON-TABLE ?auto_50049 ) ( ON ?auto_50045 ?auto_50046 ) ( ON ?auto_50043 ?auto_50048 ) ( CLEAR ?auto_50043 ) ( not ( = ?auto_50043 ?auto_50048 ) ) ( not ( = ?auto_50044 ?auto_50048 ) ) ( not ( = ?auto_50045 ?auto_50048 ) ) ( not ( = ?auto_50046 ?auto_50048 ) ) ( not ( = ?auto_50047 ?auto_50048 ) ) ( not ( = ?auto_50049 ?auto_50048 ) ) ( HOLDING ?auto_50044 ) ( CLEAR ?auto_50045 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50049 ?auto_50047 ?auto_50046 ?auto_50045 ?auto_50044 )
      ( MAKE-5PILE ?auto_50043 ?auto_50044 ?auto_50045 ?auto_50046 ?auto_50047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50050 - BLOCK
      ?auto_50051 - BLOCK
      ?auto_50052 - BLOCK
      ?auto_50053 - BLOCK
      ?auto_50054 - BLOCK
    )
    :vars
    (
      ?auto_50055 - BLOCK
      ?auto_50056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50050 ?auto_50051 ) ) ( not ( = ?auto_50050 ?auto_50052 ) ) ( not ( = ?auto_50050 ?auto_50053 ) ) ( not ( = ?auto_50050 ?auto_50054 ) ) ( not ( = ?auto_50051 ?auto_50052 ) ) ( not ( = ?auto_50051 ?auto_50053 ) ) ( not ( = ?auto_50051 ?auto_50054 ) ) ( not ( = ?auto_50052 ?auto_50053 ) ) ( not ( = ?auto_50052 ?auto_50054 ) ) ( not ( = ?auto_50053 ?auto_50054 ) ) ( ON ?auto_50054 ?auto_50055 ) ( not ( = ?auto_50050 ?auto_50055 ) ) ( not ( = ?auto_50051 ?auto_50055 ) ) ( not ( = ?auto_50052 ?auto_50055 ) ) ( not ( = ?auto_50053 ?auto_50055 ) ) ( not ( = ?auto_50054 ?auto_50055 ) ) ( ON ?auto_50053 ?auto_50054 ) ( ON-TABLE ?auto_50055 ) ( ON ?auto_50052 ?auto_50053 ) ( ON ?auto_50050 ?auto_50056 ) ( not ( = ?auto_50050 ?auto_50056 ) ) ( not ( = ?auto_50051 ?auto_50056 ) ) ( not ( = ?auto_50052 ?auto_50056 ) ) ( not ( = ?auto_50053 ?auto_50056 ) ) ( not ( = ?auto_50054 ?auto_50056 ) ) ( not ( = ?auto_50055 ?auto_50056 ) ) ( CLEAR ?auto_50052 ) ( ON ?auto_50051 ?auto_50050 ) ( CLEAR ?auto_50051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50056 ?auto_50050 )
      ( MAKE-5PILE ?auto_50050 ?auto_50051 ?auto_50052 ?auto_50053 ?auto_50054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50057 - BLOCK
      ?auto_50058 - BLOCK
      ?auto_50059 - BLOCK
      ?auto_50060 - BLOCK
      ?auto_50061 - BLOCK
    )
    :vars
    (
      ?auto_50062 - BLOCK
      ?auto_50063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50057 ?auto_50058 ) ) ( not ( = ?auto_50057 ?auto_50059 ) ) ( not ( = ?auto_50057 ?auto_50060 ) ) ( not ( = ?auto_50057 ?auto_50061 ) ) ( not ( = ?auto_50058 ?auto_50059 ) ) ( not ( = ?auto_50058 ?auto_50060 ) ) ( not ( = ?auto_50058 ?auto_50061 ) ) ( not ( = ?auto_50059 ?auto_50060 ) ) ( not ( = ?auto_50059 ?auto_50061 ) ) ( not ( = ?auto_50060 ?auto_50061 ) ) ( ON ?auto_50061 ?auto_50062 ) ( not ( = ?auto_50057 ?auto_50062 ) ) ( not ( = ?auto_50058 ?auto_50062 ) ) ( not ( = ?auto_50059 ?auto_50062 ) ) ( not ( = ?auto_50060 ?auto_50062 ) ) ( not ( = ?auto_50061 ?auto_50062 ) ) ( ON ?auto_50060 ?auto_50061 ) ( ON-TABLE ?auto_50062 ) ( ON ?auto_50057 ?auto_50063 ) ( not ( = ?auto_50057 ?auto_50063 ) ) ( not ( = ?auto_50058 ?auto_50063 ) ) ( not ( = ?auto_50059 ?auto_50063 ) ) ( not ( = ?auto_50060 ?auto_50063 ) ) ( not ( = ?auto_50061 ?auto_50063 ) ) ( not ( = ?auto_50062 ?auto_50063 ) ) ( ON ?auto_50058 ?auto_50057 ) ( CLEAR ?auto_50058 ) ( ON-TABLE ?auto_50063 ) ( HOLDING ?auto_50059 ) ( CLEAR ?auto_50060 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50062 ?auto_50061 ?auto_50060 ?auto_50059 )
      ( MAKE-5PILE ?auto_50057 ?auto_50058 ?auto_50059 ?auto_50060 ?auto_50061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50064 - BLOCK
      ?auto_50065 - BLOCK
      ?auto_50066 - BLOCK
      ?auto_50067 - BLOCK
      ?auto_50068 - BLOCK
    )
    :vars
    (
      ?auto_50069 - BLOCK
      ?auto_50070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50064 ?auto_50065 ) ) ( not ( = ?auto_50064 ?auto_50066 ) ) ( not ( = ?auto_50064 ?auto_50067 ) ) ( not ( = ?auto_50064 ?auto_50068 ) ) ( not ( = ?auto_50065 ?auto_50066 ) ) ( not ( = ?auto_50065 ?auto_50067 ) ) ( not ( = ?auto_50065 ?auto_50068 ) ) ( not ( = ?auto_50066 ?auto_50067 ) ) ( not ( = ?auto_50066 ?auto_50068 ) ) ( not ( = ?auto_50067 ?auto_50068 ) ) ( ON ?auto_50068 ?auto_50069 ) ( not ( = ?auto_50064 ?auto_50069 ) ) ( not ( = ?auto_50065 ?auto_50069 ) ) ( not ( = ?auto_50066 ?auto_50069 ) ) ( not ( = ?auto_50067 ?auto_50069 ) ) ( not ( = ?auto_50068 ?auto_50069 ) ) ( ON ?auto_50067 ?auto_50068 ) ( ON-TABLE ?auto_50069 ) ( ON ?auto_50064 ?auto_50070 ) ( not ( = ?auto_50064 ?auto_50070 ) ) ( not ( = ?auto_50065 ?auto_50070 ) ) ( not ( = ?auto_50066 ?auto_50070 ) ) ( not ( = ?auto_50067 ?auto_50070 ) ) ( not ( = ?auto_50068 ?auto_50070 ) ) ( not ( = ?auto_50069 ?auto_50070 ) ) ( ON ?auto_50065 ?auto_50064 ) ( ON-TABLE ?auto_50070 ) ( CLEAR ?auto_50067 ) ( ON ?auto_50066 ?auto_50065 ) ( CLEAR ?auto_50066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50070 ?auto_50064 ?auto_50065 )
      ( MAKE-5PILE ?auto_50064 ?auto_50065 ?auto_50066 ?auto_50067 ?auto_50068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50071 - BLOCK
      ?auto_50072 - BLOCK
      ?auto_50073 - BLOCK
      ?auto_50074 - BLOCK
      ?auto_50075 - BLOCK
    )
    :vars
    (
      ?auto_50076 - BLOCK
      ?auto_50077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50071 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50073 ) ) ( not ( = ?auto_50071 ?auto_50074 ) ) ( not ( = ?auto_50071 ?auto_50075 ) ) ( not ( = ?auto_50072 ?auto_50073 ) ) ( not ( = ?auto_50072 ?auto_50074 ) ) ( not ( = ?auto_50072 ?auto_50075 ) ) ( not ( = ?auto_50073 ?auto_50074 ) ) ( not ( = ?auto_50073 ?auto_50075 ) ) ( not ( = ?auto_50074 ?auto_50075 ) ) ( ON ?auto_50075 ?auto_50076 ) ( not ( = ?auto_50071 ?auto_50076 ) ) ( not ( = ?auto_50072 ?auto_50076 ) ) ( not ( = ?auto_50073 ?auto_50076 ) ) ( not ( = ?auto_50074 ?auto_50076 ) ) ( not ( = ?auto_50075 ?auto_50076 ) ) ( ON-TABLE ?auto_50076 ) ( ON ?auto_50071 ?auto_50077 ) ( not ( = ?auto_50071 ?auto_50077 ) ) ( not ( = ?auto_50072 ?auto_50077 ) ) ( not ( = ?auto_50073 ?auto_50077 ) ) ( not ( = ?auto_50074 ?auto_50077 ) ) ( not ( = ?auto_50075 ?auto_50077 ) ) ( not ( = ?auto_50076 ?auto_50077 ) ) ( ON ?auto_50072 ?auto_50071 ) ( ON-TABLE ?auto_50077 ) ( ON ?auto_50073 ?auto_50072 ) ( CLEAR ?auto_50073 ) ( HOLDING ?auto_50074 ) ( CLEAR ?auto_50075 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50076 ?auto_50075 ?auto_50074 )
      ( MAKE-5PILE ?auto_50071 ?auto_50072 ?auto_50073 ?auto_50074 ?auto_50075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50078 - BLOCK
      ?auto_50079 - BLOCK
      ?auto_50080 - BLOCK
      ?auto_50081 - BLOCK
      ?auto_50082 - BLOCK
    )
    :vars
    (
      ?auto_50083 - BLOCK
      ?auto_50084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50078 ?auto_50079 ) ) ( not ( = ?auto_50078 ?auto_50080 ) ) ( not ( = ?auto_50078 ?auto_50081 ) ) ( not ( = ?auto_50078 ?auto_50082 ) ) ( not ( = ?auto_50079 ?auto_50080 ) ) ( not ( = ?auto_50079 ?auto_50081 ) ) ( not ( = ?auto_50079 ?auto_50082 ) ) ( not ( = ?auto_50080 ?auto_50081 ) ) ( not ( = ?auto_50080 ?auto_50082 ) ) ( not ( = ?auto_50081 ?auto_50082 ) ) ( ON ?auto_50082 ?auto_50083 ) ( not ( = ?auto_50078 ?auto_50083 ) ) ( not ( = ?auto_50079 ?auto_50083 ) ) ( not ( = ?auto_50080 ?auto_50083 ) ) ( not ( = ?auto_50081 ?auto_50083 ) ) ( not ( = ?auto_50082 ?auto_50083 ) ) ( ON-TABLE ?auto_50083 ) ( ON ?auto_50078 ?auto_50084 ) ( not ( = ?auto_50078 ?auto_50084 ) ) ( not ( = ?auto_50079 ?auto_50084 ) ) ( not ( = ?auto_50080 ?auto_50084 ) ) ( not ( = ?auto_50081 ?auto_50084 ) ) ( not ( = ?auto_50082 ?auto_50084 ) ) ( not ( = ?auto_50083 ?auto_50084 ) ) ( ON ?auto_50079 ?auto_50078 ) ( ON-TABLE ?auto_50084 ) ( ON ?auto_50080 ?auto_50079 ) ( CLEAR ?auto_50082 ) ( ON ?auto_50081 ?auto_50080 ) ( CLEAR ?auto_50081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50084 ?auto_50078 ?auto_50079 ?auto_50080 )
      ( MAKE-5PILE ?auto_50078 ?auto_50079 ?auto_50080 ?auto_50081 ?auto_50082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50085 - BLOCK
      ?auto_50086 - BLOCK
      ?auto_50087 - BLOCK
      ?auto_50088 - BLOCK
      ?auto_50089 - BLOCK
    )
    :vars
    (
      ?auto_50090 - BLOCK
      ?auto_50091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50085 ?auto_50086 ) ) ( not ( = ?auto_50085 ?auto_50087 ) ) ( not ( = ?auto_50085 ?auto_50088 ) ) ( not ( = ?auto_50085 ?auto_50089 ) ) ( not ( = ?auto_50086 ?auto_50087 ) ) ( not ( = ?auto_50086 ?auto_50088 ) ) ( not ( = ?auto_50086 ?auto_50089 ) ) ( not ( = ?auto_50087 ?auto_50088 ) ) ( not ( = ?auto_50087 ?auto_50089 ) ) ( not ( = ?auto_50088 ?auto_50089 ) ) ( not ( = ?auto_50085 ?auto_50090 ) ) ( not ( = ?auto_50086 ?auto_50090 ) ) ( not ( = ?auto_50087 ?auto_50090 ) ) ( not ( = ?auto_50088 ?auto_50090 ) ) ( not ( = ?auto_50089 ?auto_50090 ) ) ( ON-TABLE ?auto_50090 ) ( ON ?auto_50085 ?auto_50091 ) ( not ( = ?auto_50085 ?auto_50091 ) ) ( not ( = ?auto_50086 ?auto_50091 ) ) ( not ( = ?auto_50087 ?auto_50091 ) ) ( not ( = ?auto_50088 ?auto_50091 ) ) ( not ( = ?auto_50089 ?auto_50091 ) ) ( not ( = ?auto_50090 ?auto_50091 ) ) ( ON ?auto_50086 ?auto_50085 ) ( ON-TABLE ?auto_50091 ) ( ON ?auto_50087 ?auto_50086 ) ( ON ?auto_50088 ?auto_50087 ) ( CLEAR ?auto_50088 ) ( HOLDING ?auto_50089 ) ( CLEAR ?auto_50090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50090 ?auto_50089 )
      ( MAKE-5PILE ?auto_50085 ?auto_50086 ?auto_50087 ?auto_50088 ?auto_50089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50092 - BLOCK
      ?auto_50093 - BLOCK
      ?auto_50094 - BLOCK
      ?auto_50095 - BLOCK
      ?auto_50096 - BLOCK
    )
    :vars
    (
      ?auto_50097 - BLOCK
      ?auto_50098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50092 ?auto_50093 ) ) ( not ( = ?auto_50092 ?auto_50094 ) ) ( not ( = ?auto_50092 ?auto_50095 ) ) ( not ( = ?auto_50092 ?auto_50096 ) ) ( not ( = ?auto_50093 ?auto_50094 ) ) ( not ( = ?auto_50093 ?auto_50095 ) ) ( not ( = ?auto_50093 ?auto_50096 ) ) ( not ( = ?auto_50094 ?auto_50095 ) ) ( not ( = ?auto_50094 ?auto_50096 ) ) ( not ( = ?auto_50095 ?auto_50096 ) ) ( not ( = ?auto_50092 ?auto_50097 ) ) ( not ( = ?auto_50093 ?auto_50097 ) ) ( not ( = ?auto_50094 ?auto_50097 ) ) ( not ( = ?auto_50095 ?auto_50097 ) ) ( not ( = ?auto_50096 ?auto_50097 ) ) ( ON-TABLE ?auto_50097 ) ( ON ?auto_50092 ?auto_50098 ) ( not ( = ?auto_50092 ?auto_50098 ) ) ( not ( = ?auto_50093 ?auto_50098 ) ) ( not ( = ?auto_50094 ?auto_50098 ) ) ( not ( = ?auto_50095 ?auto_50098 ) ) ( not ( = ?auto_50096 ?auto_50098 ) ) ( not ( = ?auto_50097 ?auto_50098 ) ) ( ON ?auto_50093 ?auto_50092 ) ( ON-TABLE ?auto_50098 ) ( ON ?auto_50094 ?auto_50093 ) ( ON ?auto_50095 ?auto_50094 ) ( CLEAR ?auto_50097 ) ( ON ?auto_50096 ?auto_50095 ) ( CLEAR ?auto_50096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50098 ?auto_50092 ?auto_50093 ?auto_50094 ?auto_50095 )
      ( MAKE-5PILE ?auto_50092 ?auto_50093 ?auto_50094 ?auto_50095 ?auto_50096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50099 - BLOCK
      ?auto_50100 - BLOCK
      ?auto_50101 - BLOCK
      ?auto_50102 - BLOCK
      ?auto_50103 - BLOCK
    )
    :vars
    (
      ?auto_50104 - BLOCK
      ?auto_50105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50099 ?auto_50100 ) ) ( not ( = ?auto_50099 ?auto_50101 ) ) ( not ( = ?auto_50099 ?auto_50102 ) ) ( not ( = ?auto_50099 ?auto_50103 ) ) ( not ( = ?auto_50100 ?auto_50101 ) ) ( not ( = ?auto_50100 ?auto_50102 ) ) ( not ( = ?auto_50100 ?auto_50103 ) ) ( not ( = ?auto_50101 ?auto_50102 ) ) ( not ( = ?auto_50101 ?auto_50103 ) ) ( not ( = ?auto_50102 ?auto_50103 ) ) ( not ( = ?auto_50099 ?auto_50104 ) ) ( not ( = ?auto_50100 ?auto_50104 ) ) ( not ( = ?auto_50101 ?auto_50104 ) ) ( not ( = ?auto_50102 ?auto_50104 ) ) ( not ( = ?auto_50103 ?auto_50104 ) ) ( ON ?auto_50099 ?auto_50105 ) ( not ( = ?auto_50099 ?auto_50105 ) ) ( not ( = ?auto_50100 ?auto_50105 ) ) ( not ( = ?auto_50101 ?auto_50105 ) ) ( not ( = ?auto_50102 ?auto_50105 ) ) ( not ( = ?auto_50103 ?auto_50105 ) ) ( not ( = ?auto_50104 ?auto_50105 ) ) ( ON ?auto_50100 ?auto_50099 ) ( ON-TABLE ?auto_50105 ) ( ON ?auto_50101 ?auto_50100 ) ( ON ?auto_50102 ?auto_50101 ) ( ON ?auto_50103 ?auto_50102 ) ( CLEAR ?auto_50103 ) ( HOLDING ?auto_50104 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50104 )
      ( MAKE-5PILE ?auto_50099 ?auto_50100 ?auto_50101 ?auto_50102 ?auto_50103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50106 - BLOCK
      ?auto_50107 - BLOCK
      ?auto_50108 - BLOCK
      ?auto_50109 - BLOCK
      ?auto_50110 - BLOCK
    )
    :vars
    (
      ?auto_50111 - BLOCK
      ?auto_50112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50106 ?auto_50107 ) ) ( not ( = ?auto_50106 ?auto_50108 ) ) ( not ( = ?auto_50106 ?auto_50109 ) ) ( not ( = ?auto_50106 ?auto_50110 ) ) ( not ( = ?auto_50107 ?auto_50108 ) ) ( not ( = ?auto_50107 ?auto_50109 ) ) ( not ( = ?auto_50107 ?auto_50110 ) ) ( not ( = ?auto_50108 ?auto_50109 ) ) ( not ( = ?auto_50108 ?auto_50110 ) ) ( not ( = ?auto_50109 ?auto_50110 ) ) ( not ( = ?auto_50106 ?auto_50111 ) ) ( not ( = ?auto_50107 ?auto_50111 ) ) ( not ( = ?auto_50108 ?auto_50111 ) ) ( not ( = ?auto_50109 ?auto_50111 ) ) ( not ( = ?auto_50110 ?auto_50111 ) ) ( ON ?auto_50106 ?auto_50112 ) ( not ( = ?auto_50106 ?auto_50112 ) ) ( not ( = ?auto_50107 ?auto_50112 ) ) ( not ( = ?auto_50108 ?auto_50112 ) ) ( not ( = ?auto_50109 ?auto_50112 ) ) ( not ( = ?auto_50110 ?auto_50112 ) ) ( not ( = ?auto_50111 ?auto_50112 ) ) ( ON ?auto_50107 ?auto_50106 ) ( ON-TABLE ?auto_50112 ) ( ON ?auto_50108 ?auto_50107 ) ( ON ?auto_50109 ?auto_50108 ) ( ON ?auto_50110 ?auto_50109 ) ( ON ?auto_50111 ?auto_50110 ) ( CLEAR ?auto_50111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50112 ?auto_50106 ?auto_50107 ?auto_50108 ?auto_50109 ?auto_50110 )
      ( MAKE-5PILE ?auto_50106 ?auto_50107 ?auto_50108 ?auto_50109 ?auto_50110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50119 - BLOCK
      ?auto_50120 - BLOCK
      ?auto_50121 - BLOCK
      ?auto_50122 - BLOCK
      ?auto_50123 - BLOCK
      ?auto_50124 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50124 ) ( CLEAR ?auto_50123 ) ( ON-TABLE ?auto_50119 ) ( ON ?auto_50120 ?auto_50119 ) ( ON ?auto_50121 ?auto_50120 ) ( ON ?auto_50122 ?auto_50121 ) ( ON ?auto_50123 ?auto_50122 ) ( not ( = ?auto_50119 ?auto_50120 ) ) ( not ( = ?auto_50119 ?auto_50121 ) ) ( not ( = ?auto_50119 ?auto_50122 ) ) ( not ( = ?auto_50119 ?auto_50123 ) ) ( not ( = ?auto_50119 ?auto_50124 ) ) ( not ( = ?auto_50120 ?auto_50121 ) ) ( not ( = ?auto_50120 ?auto_50122 ) ) ( not ( = ?auto_50120 ?auto_50123 ) ) ( not ( = ?auto_50120 ?auto_50124 ) ) ( not ( = ?auto_50121 ?auto_50122 ) ) ( not ( = ?auto_50121 ?auto_50123 ) ) ( not ( = ?auto_50121 ?auto_50124 ) ) ( not ( = ?auto_50122 ?auto_50123 ) ) ( not ( = ?auto_50122 ?auto_50124 ) ) ( not ( = ?auto_50123 ?auto_50124 ) ) )
    :subtasks
    ( ( !STACK ?auto_50124 ?auto_50123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50125 - BLOCK
      ?auto_50126 - BLOCK
      ?auto_50127 - BLOCK
      ?auto_50128 - BLOCK
      ?auto_50129 - BLOCK
      ?auto_50130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50129 ) ( ON-TABLE ?auto_50125 ) ( ON ?auto_50126 ?auto_50125 ) ( ON ?auto_50127 ?auto_50126 ) ( ON ?auto_50128 ?auto_50127 ) ( ON ?auto_50129 ?auto_50128 ) ( not ( = ?auto_50125 ?auto_50126 ) ) ( not ( = ?auto_50125 ?auto_50127 ) ) ( not ( = ?auto_50125 ?auto_50128 ) ) ( not ( = ?auto_50125 ?auto_50129 ) ) ( not ( = ?auto_50125 ?auto_50130 ) ) ( not ( = ?auto_50126 ?auto_50127 ) ) ( not ( = ?auto_50126 ?auto_50128 ) ) ( not ( = ?auto_50126 ?auto_50129 ) ) ( not ( = ?auto_50126 ?auto_50130 ) ) ( not ( = ?auto_50127 ?auto_50128 ) ) ( not ( = ?auto_50127 ?auto_50129 ) ) ( not ( = ?auto_50127 ?auto_50130 ) ) ( not ( = ?auto_50128 ?auto_50129 ) ) ( not ( = ?auto_50128 ?auto_50130 ) ) ( not ( = ?auto_50129 ?auto_50130 ) ) ( ON-TABLE ?auto_50130 ) ( CLEAR ?auto_50130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_50130 )
      ( MAKE-6PILE ?auto_50125 ?auto_50126 ?auto_50127 ?auto_50128 ?auto_50129 ?auto_50130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50131 - BLOCK
      ?auto_50132 - BLOCK
      ?auto_50133 - BLOCK
      ?auto_50134 - BLOCK
      ?auto_50135 - BLOCK
      ?auto_50136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50131 ) ( ON ?auto_50132 ?auto_50131 ) ( ON ?auto_50133 ?auto_50132 ) ( ON ?auto_50134 ?auto_50133 ) ( not ( = ?auto_50131 ?auto_50132 ) ) ( not ( = ?auto_50131 ?auto_50133 ) ) ( not ( = ?auto_50131 ?auto_50134 ) ) ( not ( = ?auto_50131 ?auto_50135 ) ) ( not ( = ?auto_50131 ?auto_50136 ) ) ( not ( = ?auto_50132 ?auto_50133 ) ) ( not ( = ?auto_50132 ?auto_50134 ) ) ( not ( = ?auto_50132 ?auto_50135 ) ) ( not ( = ?auto_50132 ?auto_50136 ) ) ( not ( = ?auto_50133 ?auto_50134 ) ) ( not ( = ?auto_50133 ?auto_50135 ) ) ( not ( = ?auto_50133 ?auto_50136 ) ) ( not ( = ?auto_50134 ?auto_50135 ) ) ( not ( = ?auto_50134 ?auto_50136 ) ) ( not ( = ?auto_50135 ?auto_50136 ) ) ( ON-TABLE ?auto_50136 ) ( CLEAR ?auto_50136 ) ( HOLDING ?auto_50135 ) ( CLEAR ?auto_50134 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50131 ?auto_50132 ?auto_50133 ?auto_50134 ?auto_50135 )
      ( MAKE-6PILE ?auto_50131 ?auto_50132 ?auto_50133 ?auto_50134 ?auto_50135 ?auto_50136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50137 - BLOCK
      ?auto_50138 - BLOCK
      ?auto_50139 - BLOCK
      ?auto_50140 - BLOCK
      ?auto_50141 - BLOCK
      ?auto_50142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50137 ) ( ON ?auto_50138 ?auto_50137 ) ( ON ?auto_50139 ?auto_50138 ) ( ON ?auto_50140 ?auto_50139 ) ( not ( = ?auto_50137 ?auto_50138 ) ) ( not ( = ?auto_50137 ?auto_50139 ) ) ( not ( = ?auto_50137 ?auto_50140 ) ) ( not ( = ?auto_50137 ?auto_50141 ) ) ( not ( = ?auto_50137 ?auto_50142 ) ) ( not ( = ?auto_50138 ?auto_50139 ) ) ( not ( = ?auto_50138 ?auto_50140 ) ) ( not ( = ?auto_50138 ?auto_50141 ) ) ( not ( = ?auto_50138 ?auto_50142 ) ) ( not ( = ?auto_50139 ?auto_50140 ) ) ( not ( = ?auto_50139 ?auto_50141 ) ) ( not ( = ?auto_50139 ?auto_50142 ) ) ( not ( = ?auto_50140 ?auto_50141 ) ) ( not ( = ?auto_50140 ?auto_50142 ) ) ( not ( = ?auto_50141 ?auto_50142 ) ) ( ON-TABLE ?auto_50142 ) ( CLEAR ?auto_50140 ) ( ON ?auto_50141 ?auto_50142 ) ( CLEAR ?auto_50141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50142 )
      ( MAKE-6PILE ?auto_50137 ?auto_50138 ?auto_50139 ?auto_50140 ?auto_50141 ?auto_50142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50143 - BLOCK
      ?auto_50144 - BLOCK
      ?auto_50145 - BLOCK
      ?auto_50146 - BLOCK
      ?auto_50147 - BLOCK
      ?auto_50148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50143 ) ( ON ?auto_50144 ?auto_50143 ) ( ON ?auto_50145 ?auto_50144 ) ( not ( = ?auto_50143 ?auto_50144 ) ) ( not ( = ?auto_50143 ?auto_50145 ) ) ( not ( = ?auto_50143 ?auto_50146 ) ) ( not ( = ?auto_50143 ?auto_50147 ) ) ( not ( = ?auto_50143 ?auto_50148 ) ) ( not ( = ?auto_50144 ?auto_50145 ) ) ( not ( = ?auto_50144 ?auto_50146 ) ) ( not ( = ?auto_50144 ?auto_50147 ) ) ( not ( = ?auto_50144 ?auto_50148 ) ) ( not ( = ?auto_50145 ?auto_50146 ) ) ( not ( = ?auto_50145 ?auto_50147 ) ) ( not ( = ?auto_50145 ?auto_50148 ) ) ( not ( = ?auto_50146 ?auto_50147 ) ) ( not ( = ?auto_50146 ?auto_50148 ) ) ( not ( = ?auto_50147 ?auto_50148 ) ) ( ON-TABLE ?auto_50148 ) ( ON ?auto_50147 ?auto_50148 ) ( CLEAR ?auto_50147 ) ( HOLDING ?auto_50146 ) ( CLEAR ?auto_50145 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50143 ?auto_50144 ?auto_50145 ?auto_50146 )
      ( MAKE-6PILE ?auto_50143 ?auto_50144 ?auto_50145 ?auto_50146 ?auto_50147 ?auto_50148 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50149 - BLOCK
      ?auto_50150 - BLOCK
      ?auto_50151 - BLOCK
      ?auto_50152 - BLOCK
      ?auto_50153 - BLOCK
      ?auto_50154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50149 ) ( ON ?auto_50150 ?auto_50149 ) ( ON ?auto_50151 ?auto_50150 ) ( not ( = ?auto_50149 ?auto_50150 ) ) ( not ( = ?auto_50149 ?auto_50151 ) ) ( not ( = ?auto_50149 ?auto_50152 ) ) ( not ( = ?auto_50149 ?auto_50153 ) ) ( not ( = ?auto_50149 ?auto_50154 ) ) ( not ( = ?auto_50150 ?auto_50151 ) ) ( not ( = ?auto_50150 ?auto_50152 ) ) ( not ( = ?auto_50150 ?auto_50153 ) ) ( not ( = ?auto_50150 ?auto_50154 ) ) ( not ( = ?auto_50151 ?auto_50152 ) ) ( not ( = ?auto_50151 ?auto_50153 ) ) ( not ( = ?auto_50151 ?auto_50154 ) ) ( not ( = ?auto_50152 ?auto_50153 ) ) ( not ( = ?auto_50152 ?auto_50154 ) ) ( not ( = ?auto_50153 ?auto_50154 ) ) ( ON-TABLE ?auto_50154 ) ( ON ?auto_50153 ?auto_50154 ) ( CLEAR ?auto_50151 ) ( ON ?auto_50152 ?auto_50153 ) ( CLEAR ?auto_50152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50154 ?auto_50153 )
      ( MAKE-6PILE ?auto_50149 ?auto_50150 ?auto_50151 ?auto_50152 ?auto_50153 ?auto_50154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50155 - BLOCK
      ?auto_50156 - BLOCK
      ?auto_50157 - BLOCK
      ?auto_50158 - BLOCK
      ?auto_50159 - BLOCK
      ?auto_50160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50155 ) ( ON ?auto_50156 ?auto_50155 ) ( not ( = ?auto_50155 ?auto_50156 ) ) ( not ( = ?auto_50155 ?auto_50157 ) ) ( not ( = ?auto_50155 ?auto_50158 ) ) ( not ( = ?auto_50155 ?auto_50159 ) ) ( not ( = ?auto_50155 ?auto_50160 ) ) ( not ( = ?auto_50156 ?auto_50157 ) ) ( not ( = ?auto_50156 ?auto_50158 ) ) ( not ( = ?auto_50156 ?auto_50159 ) ) ( not ( = ?auto_50156 ?auto_50160 ) ) ( not ( = ?auto_50157 ?auto_50158 ) ) ( not ( = ?auto_50157 ?auto_50159 ) ) ( not ( = ?auto_50157 ?auto_50160 ) ) ( not ( = ?auto_50158 ?auto_50159 ) ) ( not ( = ?auto_50158 ?auto_50160 ) ) ( not ( = ?auto_50159 ?auto_50160 ) ) ( ON-TABLE ?auto_50160 ) ( ON ?auto_50159 ?auto_50160 ) ( ON ?auto_50158 ?auto_50159 ) ( CLEAR ?auto_50158 ) ( HOLDING ?auto_50157 ) ( CLEAR ?auto_50156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50155 ?auto_50156 ?auto_50157 )
      ( MAKE-6PILE ?auto_50155 ?auto_50156 ?auto_50157 ?auto_50158 ?auto_50159 ?auto_50160 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50161 - BLOCK
      ?auto_50162 - BLOCK
      ?auto_50163 - BLOCK
      ?auto_50164 - BLOCK
      ?auto_50165 - BLOCK
      ?auto_50166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50161 ) ( ON ?auto_50162 ?auto_50161 ) ( not ( = ?auto_50161 ?auto_50162 ) ) ( not ( = ?auto_50161 ?auto_50163 ) ) ( not ( = ?auto_50161 ?auto_50164 ) ) ( not ( = ?auto_50161 ?auto_50165 ) ) ( not ( = ?auto_50161 ?auto_50166 ) ) ( not ( = ?auto_50162 ?auto_50163 ) ) ( not ( = ?auto_50162 ?auto_50164 ) ) ( not ( = ?auto_50162 ?auto_50165 ) ) ( not ( = ?auto_50162 ?auto_50166 ) ) ( not ( = ?auto_50163 ?auto_50164 ) ) ( not ( = ?auto_50163 ?auto_50165 ) ) ( not ( = ?auto_50163 ?auto_50166 ) ) ( not ( = ?auto_50164 ?auto_50165 ) ) ( not ( = ?auto_50164 ?auto_50166 ) ) ( not ( = ?auto_50165 ?auto_50166 ) ) ( ON-TABLE ?auto_50166 ) ( ON ?auto_50165 ?auto_50166 ) ( ON ?auto_50164 ?auto_50165 ) ( CLEAR ?auto_50162 ) ( ON ?auto_50163 ?auto_50164 ) ( CLEAR ?auto_50163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50166 ?auto_50165 ?auto_50164 )
      ( MAKE-6PILE ?auto_50161 ?auto_50162 ?auto_50163 ?auto_50164 ?auto_50165 ?auto_50166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50167 - BLOCK
      ?auto_50168 - BLOCK
      ?auto_50169 - BLOCK
      ?auto_50170 - BLOCK
      ?auto_50171 - BLOCK
      ?auto_50172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50167 ) ( not ( = ?auto_50167 ?auto_50168 ) ) ( not ( = ?auto_50167 ?auto_50169 ) ) ( not ( = ?auto_50167 ?auto_50170 ) ) ( not ( = ?auto_50167 ?auto_50171 ) ) ( not ( = ?auto_50167 ?auto_50172 ) ) ( not ( = ?auto_50168 ?auto_50169 ) ) ( not ( = ?auto_50168 ?auto_50170 ) ) ( not ( = ?auto_50168 ?auto_50171 ) ) ( not ( = ?auto_50168 ?auto_50172 ) ) ( not ( = ?auto_50169 ?auto_50170 ) ) ( not ( = ?auto_50169 ?auto_50171 ) ) ( not ( = ?auto_50169 ?auto_50172 ) ) ( not ( = ?auto_50170 ?auto_50171 ) ) ( not ( = ?auto_50170 ?auto_50172 ) ) ( not ( = ?auto_50171 ?auto_50172 ) ) ( ON-TABLE ?auto_50172 ) ( ON ?auto_50171 ?auto_50172 ) ( ON ?auto_50170 ?auto_50171 ) ( ON ?auto_50169 ?auto_50170 ) ( CLEAR ?auto_50169 ) ( HOLDING ?auto_50168 ) ( CLEAR ?auto_50167 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50167 ?auto_50168 )
      ( MAKE-6PILE ?auto_50167 ?auto_50168 ?auto_50169 ?auto_50170 ?auto_50171 ?auto_50172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50173 - BLOCK
      ?auto_50174 - BLOCK
      ?auto_50175 - BLOCK
      ?auto_50176 - BLOCK
      ?auto_50177 - BLOCK
      ?auto_50178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50173 ) ( not ( = ?auto_50173 ?auto_50174 ) ) ( not ( = ?auto_50173 ?auto_50175 ) ) ( not ( = ?auto_50173 ?auto_50176 ) ) ( not ( = ?auto_50173 ?auto_50177 ) ) ( not ( = ?auto_50173 ?auto_50178 ) ) ( not ( = ?auto_50174 ?auto_50175 ) ) ( not ( = ?auto_50174 ?auto_50176 ) ) ( not ( = ?auto_50174 ?auto_50177 ) ) ( not ( = ?auto_50174 ?auto_50178 ) ) ( not ( = ?auto_50175 ?auto_50176 ) ) ( not ( = ?auto_50175 ?auto_50177 ) ) ( not ( = ?auto_50175 ?auto_50178 ) ) ( not ( = ?auto_50176 ?auto_50177 ) ) ( not ( = ?auto_50176 ?auto_50178 ) ) ( not ( = ?auto_50177 ?auto_50178 ) ) ( ON-TABLE ?auto_50178 ) ( ON ?auto_50177 ?auto_50178 ) ( ON ?auto_50176 ?auto_50177 ) ( ON ?auto_50175 ?auto_50176 ) ( CLEAR ?auto_50173 ) ( ON ?auto_50174 ?auto_50175 ) ( CLEAR ?auto_50174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50178 ?auto_50177 ?auto_50176 ?auto_50175 )
      ( MAKE-6PILE ?auto_50173 ?auto_50174 ?auto_50175 ?auto_50176 ?auto_50177 ?auto_50178 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50179 - BLOCK
      ?auto_50180 - BLOCK
      ?auto_50181 - BLOCK
      ?auto_50182 - BLOCK
      ?auto_50183 - BLOCK
      ?auto_50184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50179 ?auto_50180 ) ) ( not ( = ?auto_50179 ?auto_50181 ) ) ( not ( = ?auto_50179 ?auto_50182 ) ) ( not ( = ?auto_50179 ?auto_50183 ) ) ( not ( = ?auto_50179 ?auto_50184 ) ) ( not ( = ?auto_50180 ?auto_50181 ) ) ( not ( = ?auto_50180 ?auto_50182 ) ) ( not ( = ?auto_50180 ?auto_50183 ) ) ( not ( = ?auto_50180 ?auto_50184 ) ) ( not ( = ?auto_50181 ?auto_50182 ) ) ( not ( = ?auto_50181 ?auto_50183 ) ) ( not ( = ?auto_50181 ?auto_50184 ) ) ( not ( = ?auto_50182 ?auto_50183 ) ) ( not ( = ?auto_50182 ?auto_50184 ) ) ( not ( = ?auto_50183 ?auto_50184 ) ) ( ON-TABLE ?auto_50184 ) ( ON ?auto_50183 ?auto_50184 ) ( ON ?auto_50182 ?auto_50183 ) ( ON ?auto_50181 ?auto_50182 ) ( ON ?auto_50180 ?auto_50181 ) ( CLEAR ?auto_50180 ) ( HOLDING ?auto_50179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50179 )
      ( MAKE-6PILE ?auto_50179 ?auto_50180 ?auto_50181 ?auto_50182 ?auto_50183 ?auto_50184 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50185 - BLOCK
      ?auto_50186 - BLOCK
      ?auto_50187 - BLOCK
      ?auto_50188 - BLOCK
      ?auto_50189 - BLOCK
      ?auto_50190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50185 ?auto_50186 ) ) ( not ( = ?auto_50185 ?auto_50187 ) ) ( not ( = ?auto_50185 ?auto_50188 ) ) ( not ( = ?auto_50185 ?auto_50189 ) ) ( not ( = ?auto_50185 ?auto_50190 ) ) ( not ( = ?auto_50186 ?auto_50187 ) ) ( not ( = ?auto_50186 ?auto_50188 ) ) ( not ( = ?auto_50186 ?auto_50189 ) ) ( not ( = ?auto_50186 ?auto_50190 ) ) ( not ( = ?auto_50187 ?auto_50188 ) ) ( not ( = ?auto_50187 ?auto_50189 ) ) ( not ( = ?auto_50187 ?auto_50190 ) ) ( not ( = ?auto_50188 ?auto_50189 ) ) ( not ( = ?auto_50188 ?auto_50190 ) ) ( not ( = ?auto_50189 ?auto_50190 ) ) ( ON-TABLE ?auto_50190 ) ( ON ?auto_50189 ?auto_50190 ) ( ON ?auto_50188 ?auto_50189 ) ( ON ?auto_50187 ?auto_50188 ) ( ON ?auto_50186 ?auto_50187 ) ( ON ?auto_50185 ?auto_50186 ) ( CLEAR ?auto_50185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50190 ?auto_50189 ?auto_50188 ?auto_50187 ?auto_50186 )
      ( MAKE-6PILE ?auto_50185 ?auto_50186 ?auto_50187 ?auto_50188 ?auto_50189 ?auto_50190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50191 - BLOCK
      ?auto_50192 - BLOCK
      ?auto_50193 - BLOCK
      ?auto_50194 - BLOCK
      ?auto_50195 - BLOCK
      ?auto_50196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50191 ?auto_50192 ) ) ( not ( = ?auto_50191 ?auto_50193 ) ) ( not ( = ?auto_50191 ?auto_50194 ) ) ( not ( = ?auto_50191 ?auto_50195 ) ) ( not ( = ?auto_50191 ?auto_50196 ) ) ( not ( = ?auto_50192 ?auto_50193 ) ) ( not ( = ?auto_50192 ?auto_50194 ) ) ( not ( = ?auto_50192 ?auto_50195 ) ) ( not ( = ?auto_50192 ?auto_50196 ) ) ( not ( = ?auto_50193 ?auto_50194 ) ) ( not ( = ?auto_50193 ?auto_50195 ) ) ( not ( = ?auto_50193 ?auto_50196 ) ) ( not ( = ?auto_50194 ?auto_50195 ) ) ( not ( = ?auto_50194 ?auto_50196 ) ) ( not ( = ?auto_50195 ?auto_50196 ) ) ( ON-TABLE ?auto_50196 ) ( ON ?auto_50195 ?auto_50196 ) ( ON ?auto_50194 ?auto_50195 ) ( ON ?auto_50193 ?auto_50194 ) ( ON ?auto_50192 ?auto_50193 ) ( HOLDING ?auto_50191 ) ( CLEAR ?auto_50192 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50196 ?auto_50195 ?auto_50194 ?auto_50193 ?auto_50192 ?auto_50191 )
      ( MAKE-6PILE ?auto_50191 ?auto_50192 ?auto_50193 ?auto_50194 ?auto_50195 ?auto_50196 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50197 - BLOCK
      ?auto_50198 - BLOCK
      ?auto_50199 - BLOCK
      ?auto_50200 - BLOCK
      ?auto_50201 - BLOCK
      ?auto_50202 - BLOCK
    )
    :vars
    (
      ?auto_50203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50197 ?auto_50198 ) ) ( not ( = ?auto_50197 ?auto_50199 ) ) ( not ( = ?auto_50197 ?auto_50200 ) ) ( not ( = ?auto_50197 ?auto_50201 ) ) ( not ( = ?auto_50197 ?auto_50202 ) ) ( not ( = ?auto_50198 ?auto_50199 ) ) ( not ( = ?auto_50198 ?auto_50200 ) ) ( not ( = ?auto_50198 ?auto_50201 ) ) ( not ( = ?auto_50198 ?auto_50202 ) ) ( not ( = ?auto_50199 ?auto_50200 ) ) ( not ( = ?auto_50199 ?auto_50201 ) ) ( not ( = ?auto_50199 ?auto_50202 ) ) ( not ( = ?auto_50200 ?auto_50201 ) ) ( not ( = ?auto_50200 ?auto_50202 ) ) ( not ( = ?auto_50201 ?auto_50202 ) ) ( ON-TABLE ?auto_50202 ) ( ON ?auto_50201 ?auto_50202 ) ( ON ?auto_50200 ?auto_50201 ) ( ON ?auto_50199 ?auto_50200 ) ( ON ?auto_50198 ?auto_50199 ) ( CLEAR ?auto_50198 ) ( ON ?auto_50197 ?auto_50203 ) ( CLEAR ?auto_50197 ) ( HAND-EMPTY ) ( not ( = ?auto_50197 ?auto_50203 ) ) ( not ( = ?auto_50198 ?auto_50203 ) ) ( not ( = ?auto_50199 ?auto_50203 ) ) ( not ( = ?auto_50200 ?auto_50203 ) ) ( not ( = ?auto_50201 ?auto_50203 ) ) ( not ( = ?auto_50202 ?auto_50203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50197 ?auto_50203 )
      ( MAKE-6PILE ?auto_50197 ?auto_50198 ?auto_50199 ?auto_50200 ?auto_50201 ?auto_50202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50204 - BLOCK
      ?auto_50205 - BLOCK
      ?auto_50206 - BLOCK
      ?auto_50207 - BLOCK
      ?auto_50208 - BLOCK
      ?auto_50209 - BLOCK
    )
    :vars
    (
      ?auto_50210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50204 ?auto_50205 ) ) ( not ( = ?auto_50204 ?auto_50206 ) ) ( not ( = ?auto_50204 ?auto_50207 ) ) ( not ( = ?auto_50204 ?auto_50208 ) ) ( not ( = ?auto_50204 ?auto_50209 ) ) ( not ( = ?auto_50205 ?auto_50206 ) ) ( not ( = ?auto_50205 ?auto_50207 ) ) ( not ( = ?auto_50205 ?auto_50208 ) ) ( not ( = ?auto_50205 ?auto_50209 ) ) ( not ( = ?auto_50206 ?auto_50207 ) ) ( not ( = ?auto_50206 ?auto_50208 ) ) ( not ( = ?auto_50206 ?auto_50209 ) ) ( not ( = ?auto_50207 ?auto_50208 ) ) ( not ( = ?auto_50207 ?auto_50209 ) ) ( not ( = ?auto_50208 ?auto_50209 ) ) ( ON-TABLE ?auto_50209 ) ( ON ?auto_50208 ?auto_50209 ) ( ON ?auto_50207 ?auto_50208 ) ( ON ?auto_50206 ?auto_50207 ) ( ON ?auto_50204 ?auto_50210 ) ( CLEAR ?auto_50204 ) ( not ( = ?auto_50204 ?auto_50210 ) ) ( not ( = ?auto_50205 ?auto_50210 ) ) ( not ( = ?auto_50206 ?auto_50210 ) ) ( not ( = ?auto_50207 ?auto_50210 ) ) ( not ( = ?auto_50208 ?auto_50210 ) ) ( not ( = ?auto_50209 ?auto_50210 ) ) ( HOLDING ?auto_50205 ) ( CLEAR ?auto_50206 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50209 ?auto_50208 ?auto_50207 ?auto_50206 ?auto_50205 )
      ( MAKE-6PILE ?auto_50204 ?auto_50205 ?auto_50206 ?auto_50207 ?auto_50208 ?auto_50209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50211 - BLOCK
      ?auto_50212 - BLOCK
      ?auto_50213 - BLOCK
      ?auto_50214 - BLOCK
      ?auto_50215 - BLOCK
      ?auto_50216 - BLOCK
    )
    :vars
    (
      ?auto_50217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50211 ?auto_50212 ) ) ( not ( = ?auto_50211 ?auto_50213 ) ) ( not ( = ?auto_50211 ?auto_50214 ) ) ( not ( = ?auto_50211 ?auto_50215 ) ) ( not ( = ?auto_50211 ?auto_50216 ) ) ( not ( = ?auto_50212 ?auto_50213 ) ) ( not ( = ?auto_50212 ?auto_50214 ) ) ( not ( = ?auto_50212 ?auto_50215 ) ) ( not ( = ?auto_50212 ?auto_50216 ) ) ( not ( = ?auto_50213 ?auto_50214 ) ) ( not ( = ?auto_50213 ?auto_50215 ) ) ( not ( = ?auto_50213 ?auto_50216 ) ) ( not ( = ?auto_50214 ?auto_50215 ) ) ( not ( = ?auto_50214 ?auto_50216 ) ) ( not ( = ?auto_50215 ?auto_50216 ) ) ( ON-TABLE ?auto_50216 ) ( ON ?auto_50215 ?auto_50216 ) ( ON ?auto_50214 ?auto_50215 ) ( ON ?auto_50213 ?auto_50214 ) ( ON ?auto_50211 ?auto_50217 ) ( not ( = ?auto_50211 ?auto_50217 ) ) ( not ( = ?auto_50212 ?auto_50217 ) ) ( not ( = ?auto_50213 ?auto_50217 ) ) ( not ( = ?auto_50214 ?auto_50217 ) ) ( not ( = ?auto_50215 ?auto_50217 ) ) ( not ( = ?auto_50216 ?auto_50217 ) ) ( CLEAR ?auto_50213 ) ( ON ?auto_50212 ?auto_50211 ) ( CLEAR ?auto_50212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50217 ?auto_50211 )
      ( MAKE-6PILE ?auto_50211 ?auto_50212 ?auto_50213 ?auto_50214 ?auto_50215 ?auto_50216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50218 - BLOCK
      ?auto_50219 - BLOCK
      ?auto_50220 - BLOCK
      ?auto_50221 - BLOCK
      ?auto_50222 - BLOCK
      ?auto_50223 - BLOCK
    )
    :vars
    (
      ?auto_50224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50218 ?auto_50219 ) ) ( not ( = ?auto_50218 ?auto_50220 ) ) ( not ( = ?auto_50218 ?auto_50221 ) ) ( not ( = ?auto_50218 ?auto_50222 ) ) ( not ( = ?auto_50218 ?auto_50223 ) ) ( not ( = ?auto_50219 ?auto_50220 ) ) ( not ( = ?auto_50219 ?auto_50221 ) ) ( not ( = ?auto_50219 ?auto_50222 ) ) ( not ( = ?auto_50219 ?auto_50223 ) ) ( not ( = ?auto_50220 ?auto_50221 ) ) ( not ( = ?auto_50220 ?auto_50222 ) ) ( not ( = ?auto_50220 ?auto_50223 ) ) ( not ( = ?auto_50221 ?auto_50222 ) ) ( not ( = ?auto_50221 ?auto_50223 ) ) ( not ( = ?auto_50222 ?auto_50223 ) ) ( ON-TABLE ?auto_50223 ) ( ON ?auto_50222 ?auto_50223 ) ( ON ?auto_50221 ?auto_50222 ) ( ON ?auto_50218 ?auto_50224 ) ( not ( = ?auto_50218 ?auto_50224 ) ) ( not ( = ?auto_50219 ?auto_50224 ) ) ( not ( = ?auto_50220 ?auto_50224 ) ) ( not ( = ?auto_50221 ?auto_50224 ) ) ( not ( = ?auto_50222 ?auto_50224 ) ) ( not ( = ?auto_50223 ?auto_50224 ) ) ( ON ?auto_50219 ?auto_50218 ) ( CLEAR ?auto_50219 ) ( ON-TABLE ?auto_50224 ) ( HOLDING ?auto_50220 ) ( CLEAR ?auto_50221 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50223 ?auto_50222 ?auto_50221 ?auto_50220 )
      ( MAKE-6PILE ?auto_50218 ?auto_50219 ?auto_50220 ?auto_50221 ?auto_50222 ?auto_50223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50225 - BLOCK
      ?auto_50226 - BLOCK
      ?auto_50227 - BLOCK
      ?auto_50228 - BLOCK
      ?auto_50229 - BLOCK
      ?auto_50230 - BLOCK
    )
    :vars
    (
      ?auto_50231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50225 ?auto_50226 ) ) ( not ( = ?auto_50225 ?auto_50227 ) ) ( not ( = ?auto_50225 ?auto_50228 ) ) ( not ( = ?auto_50225 ?auto_50229 ) ) ( not ( = ?auto_50225 ?auto_50230 ) ) ( not ( = ?auto_50226 ?auto_50227 ) ) ( not ( = ?auto_50226 ?auto_50228 ) ) ( not ( = ?auto_50226 ?auto_50229 ) ) ( not ( = ?auto_50226 ?auto_50230 ) ) ( not ( = ?auto_50227 ?auto_50228 ) ) ( not ( = ?auto_50227 ?auto_50229 ) ) ( not ( = ?auto_50227 ?auto_50230 ) ) ( not ( = ?auto_50228 ?auto_50229 ) ) ( not ( = ?auto_50228 ?auto_50230 ) ) ( not ( = ?auto_50229 ?auto_50230 ) ) ( ON-TABLE ?auto_50230 ) ( ON ?auto_50229 ?auto_50230 ) ( ON ?auto_50228 ?auto_50229 ) ( ON ?auto_50225 ?auto_50231 ) ( not ( = ?auto_50225 ?auto_50231 ) ) ( not ( = ?auto_50226 ?auto_50231 ) ) ( not ( = ?auto_50227 ?auto_50231 ) ) ( not ( = ?auto_50228 ?auto_50231 ) ) ( not ( = ?auto_50229 ?auto_50231 ) ) ( not ( = ?auto_50230 ?auto_50231 ) ) ( ON ?auto_50226 ?auto_50225 ) ( ON-TABLE ?auto_50231 ) ( CLEAR ?auto_50228 ) ( ON ?auto_50227 ?auto_50226 ) ( CLEAR ?auto_50227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50231 ?auto_50225 ?auto_50226 )
      ( MAKE-6PILE ?auto_50225 ?auto_50226 ?auto_50227 ?auto_50228 ?auto_50229 ?auto_50230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50232 - BLOCK
      ?auto_50233 - BLOCK
      ?auto_50234 - BLOCK
      ?auto_50235 - BLOCK
      ?auto_50236 - BLOCK
      ?auto_50237 - BLOCK
    )
    :vars
    (
      ?auto_50238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50232 ?auto_50233 ) ) ( not ( = ?auto_50232 ?auto_50234 ) ) ( not ( = ?auto_50232 ?auto_50235 ) ) ( not ( = ?auto_50232 ?auto_50236 ) ) ( not ( = ?auto_50232 ?auto_50237 ) ) ( not ( = ?auto_50233 ?auto_50234 ) ) ( not ( = ?auto_50233 ?auto_50235 ) ) ( not ( = ?auto_50233 ?auto_50236 ) ) ( not ( = ?auto_50233 ?auto_50237 ) ) ( not ( = ?auto_50234 ?auto_50235 ) ) ( not ( = ?auto_50234 ?auto_50236 ) ) ( not ( = ?auto_50234 ?auto_50237 ) ) ( not ( = ?auto_50235 ?auto_50236 ) ) ( not ( = ?auto_50235 ?auto_50237 ) ) ( not ( = ?auto_50236 ?auto_50237 ) ) ( ON-TABLE ?auto_50237 ) ( ON ?auto_50236 ?auto_50237 ) ( ON ?auto_50232 ?auto_50238 ) ( not ( = ?auto_50232 ?auto_50238 ) ) ( not ( = ?auto_50233 ?auto_50238 ) ) ( not ( = ?auto_50234 ?auto_50238 ) ) ( not ( = ?auto_50235 ?auto_50238 ) ) ( not ( = ?auto_50236 ?auto_50238 ) ) ( not ( = ?auto_50237 ?auto_50238 ) ) ( ON ?auto_50233 ?auto_50232 ) ( ON-TABLE ?auto_50238 ) ( ON ?auto_50234 ?auto_50233 ) ( CLEAR ?auto_50234 ) ( HOLDING ?auto_50235 ) ( CLEAR ?auto_50236 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50237 ?auto_50236 ?auto_50235 )
      ( MAKE-6PILE ?auto_50232 ?auto_50233 ?auto_50234 ?auto_50235 ?auto_50236 ?auto_50237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50239 - BLOCK
      ?auto_50240 - BLOCK
      ?auto_50241 - BLOCK
      ?auto_50242 - BLOCK
      ?auto_50243 - BLOCK
      ?auto_50244 - BLOCK
    )
    :vars
    (
      ?auto_50245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50239 ?auto_50240 ) ) ( not ( = ?auto_50239 ?auto_50241 ) ) ( not ( = ?auto_50239 ?auto_50242 ) ) ( not ( = ?auto_50239 ?auto_50243 ) ) ( not ( = ?auto_50239 ?auto_50244 ) ) ( not ( = ?auto_50240 ?auto_50241 ) ) ( not ( = ?auto_50240 ?auto_50242 ) ) ( not ( = ?auto_50240 ?auto_50243 ) ) ( not ( = ?auto_50240 ?auto_50244 ) ) ( not ( = ?auto_50241 ?auto_50242 ) ) ( not ( = ?auto_50241 ?auto_50243 ) ) ( not ( = ?auto_50241 ?auto_50244 ) ) ( not ( = ?auto_50242 ?auto_50243 ) ) ( not ( = ?auto_50242 ?auto_50244 ) ) ( not ( = ?auto_50243 ?auto_50244 ) ) ( ON-TABLE ?auto_50244 ) ( ON ?auto_50243 ?auto_50244 ) ( ON ?auto_50239 ?auto_50245 ) ( not ( = ?auto_50239 ?auto_50245 ) ) ( not ( = ?auto_50240 ?auto_50245 ) ) ( not ( = ?auto_50241 ?auto_50245 ) ) ( not ( = ?auto_50242 ?auto_50245 ) ) ( not ( = ?auto_50243 ?auto_50245 ) ) ( not ( = ?auto_50244 ?auto_50245 ) ) ( ON ?auto_50240 ?auto_50239 ) ( ON-TABLE ?auto_50245 ) ( ON ?auto_50241 ?auto_50240 ) ( CLEAR ?auto_50243 ) ( ON ?auto_50242 ?auto_50241 ) ( CLEAR ?auto_50242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50245 ?auto_50239 ?auto_50240 ?auto_50241 )
      ( MAKE-6PILE ?auto_50239 ?auto_50240 ?auto_50241 ?auto_50242 ?auto_50243 ?auto_50244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50246 - BLOCK
      ?auto_50247 - BLOCK
      ?auto_50248 - BLOCK
      ?auto_50249 - BLOCK
      ?auto_50250 - BLOCK
      ?auto_50251 - BLOCK
    )
    :vars
    (
      ?auto_50252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50246 ?auto_50247 ) ) ( not ( = ?auto_50246 ?auto_50248 ) ) ( not ( = ?auto_50246 ?auto_50249 ) ) ( not ( = ?auto_50246 ?auto_50250 ) ) ( not ( = ?auto_50246 ?auto_50251 ) ) ( not ( = ?auto_50247 ?auto_50248 ) ) ( not ( = ?auto_50247 ?auto_50249 ) ) ( not ( = ?auto_50247 ?auto_50250 ) ) ( not ( = ?auto_50247 ?auto_50251 ) ) ( not ( = ?auto_50248 ?auto_50249 ) ) ( not ( = ?auto_50248 ?auto_50250 ) ) ( not ( = ?auto_50248 ?auto_50251 ) ) ( not ( = ?auto_50249 ?auto_50250 ) ) ( not ( = ?auto_50249 ?auto_50251 ) ) ( not ( = ?auto_50250 ?auto_50251 ) ) ( ON-TABLE ?auto_50251 ) ( ON ?auto_50246 ?auto_50252 ) ( not ( = ?auto_50246 ?auto_50252 ) ) ( not ( = ?auto_50247 ?auto_50252 ) ) ( not ( = ?auto_50248 ?auto_50252 ) ) ( not ( = ?auto_50249 ?auto_50252 ) ) ( not ( = ?auto_50250 ?auto_50252 ) ) ( not ( = ?auto_50251 ?auto_50252 ) ) ( ON ?auto_50247 ?auto_50246 ) ( ON-TABLE ?auto_50252 ) ( ON ?auto_50248 ?auto_50247 ) ( ON ?auto_50249 ?auto_50248 ) ( CLEAR ?auto_50249 ) ( HOLDING ?auto_50250 ) ( CLEAR ?auto_50251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50251 ?auto_50250 )
      ( MAKE-6PILE ?auto_50246 ?auto_50247 ?auto_50248 ?auto_50249 ?auto_50250 ?auto_50251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50253 - BLOCK
      ?auto_50254 - BLOCK
      ?auto_50255 - BLOCK
      ?auto_50256 - BLOCK
      ?auto_50257 - BLOCK
      ?auto_50258 - BLOCK
    )
    :vars
    (
      ?auto_50259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50253 ?auto_50254 ) ) ( not ( = ?auto_50253 ?auto_50255 ) ) ( not ( = ?auto_50253 ?auto_50256 ) ) ( not ( = ?auto_50253 ?auto_50257 ) ) ( not ( = ?auto_50253 ?auto_50258 ) ) ( not ( = ?auto_50254 ?auto_50255 ) ) ( not ( = ?auto_50254 ?auto_50256 ) ) ( not ( = ?auto_50254 ?auto_50257 ) ) ( not ( = ?auto_50254 ?auto_50258 ) ) ( not ( = ?auto_50255 ?auto_50256 ) ) ( not ( = ?auto_50255 ?auto_50257 ) ) ( not ( = ?auto_50255 ?auto_50258 ) ) ( not ( = ?auto_50256 ?auto_50257 ) ) ( not ( = ?auto_50256 ?auto_50258 ) ) ( not ( = ?auto_50257 ?auto_50258 ) ) ( ON-TABLE ?auto_50258 ) ( ON ?auto_50253 ?auto_50259 ) ( not ( = ?auto_50253 ?auto_50259 ) ) ( not ( = ?auto_50254 ?auto_50259 ) ) ( not ( = ?auto_50255 ?auto_50259 ) ) ( not ( = ?auto_50256 ?auto_50259 ) ) ( not ( = ?auto_50257 ?auto_50259 ) ) ( not ( = ?auto_50258 ?auto_50259 ) ) ( ON ?auto_50254 ?auto_50253 ) ( ON-TABLE ?auto_50259 ) ( ON ?auto_50255 ?auto_50254 ) ( ON ?auto_50256 ?auto_50255 ) ( CLEAR ?auto_50258 ) ( ON ?auto_50257 ?auto_50256 ) ( CLEAR ?auto_50257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50259 ?auto_50253 ?auto_50254 ?auto_50255 ?auto_50256 )
      ( MAKE-6PILE ?auto_50253 ?auto_50254 ?auto_50255 ?auto_50256 ?auto_50257 ?auto_50258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50260 - BLOCK
      ?auto_50261 - BLOCK
      ?auto_50262 - BLOCK
      ?auto_50263 - BLOCK
      ?auto_50264 - BLOCK
      ?auto_50265 - BLOCK
    )
    :vars
    (
      ?auto_50266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50260 ?auto_50261 ) ) ( not ( = ?auto_50260 ?auto_50262 ) ) ( not ( = ?auto_50260 ?auto_50263 ) ) ( not ( = ?auto_50260 ?auto_50264 ) ) ( not ( = ?auto_50260 ?auto_50265 ) ) ( not ( = ?auto_50261 ?auto_50262 ) ) ( not ( = ?auto_50261 ?auto_50263 ) ) ( not ( = ?auto_50261 ?auto_50264 ) ) ( not ( = ?auto_50261 ?auto_50265 ) ) ( not ( = ?auto_50262 ?auto_50263 ) ) ( not ( = ?auto_50262 ?auto_50264 ) ) ( not ( = ?auto_50262 ?auto_50265 ) ) ( not ( = ?auto_50263 ?auto_50264 ) ) ( not ( = ?auto_50263 ?auto_50265 ) ) ( not ( = ?auto_50264 ?auto_50265 ) ) ( ON ?auto_50260 ?auto_50266 ) ( not ( = ?auto_50260 ?auto_50266 ) ) ( not ( = ?auto_50261 ?auto_50266 ) ) ( not ( = ?auto_50262 ?auto_50266 ) ) ( not ( = ?auto_50263 ?auto_50266 ) ) ( not ( = ?auto_50264 ?auto_50266 ) ) ( not ( = ?auto_50265 ?auto_50266 ) ) ( ON ?auto_50261 ?auto_50260 ) ( ON-TABLE ?auto_50266 ) ( ON ?auto_50262 ?auto_50261 ) ( ON ?auto_50263 ?auto_50262 ) ( ON ?auto_50264 ?auto_50263 ) ( CLEAR ?auto_50264 ) ( HOLDING ?auto_50265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50265 )
      ( MAKE-6PILE ?auto_50260 ?auto_50261 ?auto_50262 ?auto_50263 ?auto_50264 ?auto_50265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50267 - BLOCK
      ?auto_50268 - BLOCK
      ?auto_50269 - BLOCK
      ?auto_50270 - BLOCK
      ?auto_50271 - BLOCK
      ?auto_50272 - BLOCK
    )
    :vars
    (
      ?auto_50273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50267 ?auto_50268 ) ) ( not ( = ?auto_50267 ?auto_50269 ) ) ( not ( = ?auto_50267 ?auto_50270 ) ) ( not ( = ?auto_50267 ?auto_50271 ) ) ( not ( = ?auto_50267 ?auto_50272 ) ) ( not ( = ?auto_50268 ?auto_50269 ) ) ( not ( = ?auto_50268 ?auto_50270 ) ) ( not ( = ?auto_50268 ?auto_50271 ) ) ( not ( = ?auto_50268 ?auto_50272 ) ) ( not ( = ?auto_50269 ?auto_50270 ) ) ( not ( = ?auto_50269 ?auto_50271 ) ) ( not ( = ?auto_50269 ?auto_50272 ) ) ( not ( = ?auto_50270 ?auto_50271 ) ) ( not ( = ?auto_50270 ?auto_50272 ) ) ( not ( = ?auto_50271 ?auto_50272 ) ) ( ON ?auto_50267 ?auto_50273 ) ( not ( = ?auto_50267 ?auto_50273 ) ) ( not ( = ?auto_50268 ?auto_50273 ) ) ( not ( = ?auto_50269 ?auto_50273 ) ) ( not ( = ?auto_50270 ?auto_50273 ) ) ( not ( = ?auto_50271 ?auto_50273 ) ) ( not ( = ?auto_50272 ?auto_50273 ) ) ( ON ?auto_50268 ?auto_50267 ) ( ON-TABLE ?auto_50273 ) ( ON ?auto_50269 ?auto_50268 ) ( ON ?auto_50270 ?auto_50269 ) ( ON ?auto_50271 ?auto_50270 ) ( ON ?auto_50272 ?auto_50271 ) ( CLEAR ?auto_50272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50273 ?auto_50267 ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50271 )
      ( MAKE-6PILE ?auto_50267 ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50271 ?auto_50272 ) )
  )

)

