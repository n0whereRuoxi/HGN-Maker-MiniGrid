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
      ?auto_57401 - BLOCK
    )
    :vars
    (
      ?auto_57402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57401 ?auto_57402 ) ( CLEAR ?auto_57401 ) ( HAND-EMPTY ) ( not ( = ?auto_57401 ?auto_57402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57401 ?auto_57402 )
      ( !PUTDOWN ?auto_57401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57404 - BLOCK
    )
    :vars
    (
      ?auto_57405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57404 ?auto_57405 ) ( CLEAR ?auto_57404 ) ( HAND-EMPTY ) ( not ( = ?auto_57404 ?auto_57405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57404 ?auto_57405 )
      ( !PUTDOWN ?auto_57404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57408 - BLOCK
      ?auto_57409 - BLOCK
    )
    :vars
    (
      ?auto_57410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57408 ) ( ON ?auto_57409 ?auto_57410 ) ( CLEAR ?auto_57409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57408 ) ( not ( = ?auto_57408 ?auto_57409 ) ) ( not ( = ?auto_57408 ?auto_57410 ) ) ( not ( = ?auto_57409 ?auto_57410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57409 ?auto_57410 )
      ( !STACK ?auto_57409 ?auto_57408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57413 - BLOCK
      ?auto_57414 - BLOCK
    )
    :vars
    (
      ?auto_57415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57413 ) ( ON ?auto_57414 ?auto_57415 ) ( CLEAR ?auto_57414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57413 ) ( not ( = ?auto_57413 ?auto_57414 ) ) ( not ( = ?auto_57413 ?auto_57415 ) ) ( not ( = ?auto_57414 ?auto_57415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57414 ?auto_57415 )
      ( !STACK ?auto_57414 ?auto_57413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57418 - BLOCK
      ?auto_57419 - BLOCK
    )
    :vars
    (
      ?auto_57420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57419 ?auto_57420 ) ( not ( = ?auto_57418 ?auto_57419 ) ) ( not ( = ?auto_57418 ?auto_57420 ) ) ( not ( = ?auto_57419 ?auto_57420 ) ) ( ON ?auto_57418 ?auto_57419 ) ( CLEAR ?auto_57418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57418 )
      ( MAKE-2PILE ?auto_57418 ?auto_57419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57423 - BLOCK
      ?auto_57424 - BLOCK
    )
    :vars
    (
      ?auto_57425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57424 ?auto_57425 ) ( not ( = ?auto_57423 ?auto_57424 ) ) ( not ( = ?auto_57423 ?auto_57425 ) ) ( not ( = ?auto_57424 ?auto_57425 ) ) ( ON ?auto_57423 ?auto_57424 ) ( CLEAR ?auto_57423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57423 )
      ( MAKE-2PILE ?auto_57423 ?auto_57424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57429 - BLOCK
      ?auto_57430 - BLOCK
      ?auto_57431 - BLOCK
    )
    :vars
    (
      ?auto_57432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57430 ) ( ON ?auto_57431 ?auto_57432 ) ( CLEAR ?auto_57431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57429 ) ( ON ?auto_57430 ?auto_57429 ) ( not ( = ?auto_57429 ?auto_57430 ) ) ( not ( = ?auto_57429 ?auto_57431 ) ) ( not ( = ?auto_57429 ?auto_57432 ) ) ( not ( = ?auto_57430 ?auto_57431 ) ) ( not ( = ?auto_57430 ?auto_57432 ) ) ( not ( = ?auto_57431 ?auto_57432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57431 ?auto_57432 )
      ( !STACK ?auto_57431 ?auto_57430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57436 - BLOCK
      ?auto_57437 - BLOCK
      ?auto_57438 - BLOCK
    )
    :vars
    (
      ?auto_57439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57437 ) ( ON ?auto_57438 ?auto_57439 ) ( CLEAR ?auto_57438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57436 ) ( ON ?auto_57437 ?auto_57436 ) ( not ( = ?auto_57436 ?auto_57437 ) ) ( not ( = ?auto_57436 ?auto_57438 ) ) ( not ( = ?auto_57436 ?auto_57439 ) ) ( not ( = ?auto_57437 ?auto_57438 ) ) ( not ( = ?auto_57437 ?auto_57439 ) ) ( not ( = ?auto_57438 ?auto_57439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57438 ?auto_57439 )
      ( !STACK ?auto_57438 ?auto_57437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57443 - BLOCK
      ?auto_57444 - BLOCK
      ?auto_57445 - BLOCK
    )
    :vars
    (
      ?auto_57446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57445 ?auto_57446 ) ( ON-TABLE ?auto_57443 ) ( not ( = ?auto_57443 ?auto_57444 ) ) ( not ( = ?auto_57443 ?auto_57445 ) ) ( not ( = ?auto_57443 ?auto_57446 ) ) ( not ( = ?auto_57444 ?auto_57445 ) ) ( not ( = ?auto_57444 ?auto_57446 ) ) ( not ( = ?auto_57445 ?auto_57446 ) ) ( CLEAR ?auto_57443 ) ( ON ?auto_57444 ?auto_57445 ) ( CLEAR ?auto_57444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57443 ?auto_57444 )
      ( MAKE-3PILE ?auto_57443 ?auto_57444 ?auto_57445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57450 - BLOCK
      ?auto_57451 - BLOCK
      ?auto_57452 - BLOCK
    )
    :vars
    (
      ?auto_57453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57452 ?auto_57453 ) ( ON-TABLE ?auto_57450 ) ( not ( = ?auto_57450 ?auto_57451 ) ) ( not ( = ?auto_57450 ?auto_57452 ) ) ( not ( = ?auto_57450 ?auto_57453 ) ) ( not ( = ?auto_57451 ?auto_57452 ) ) ( not ( = ?auto_57451 ?auto_57453 ) ) ( not ( = ?auto_57452 ?auto_57453 ) ) ( CLEAR ?auto_57450 ) ( ON ?auto_57451 ?auto_57452 ) ( CLEAR ?auto_57451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57450 ?auto_57451 )
      ( MAKE-3PILE ?auto_57450 ?auto_57451 ?auto_57452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57457 - BLOCK
      ?auto_57458 - BLOCK
      ?auto_57459 - BLOCK
    )
    :vars
    (
      ?auto_57460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57459 ?auto_57460 ) ( not ( = ?auto_57457 ?auto_57458 ) ) ( not ( = ?auto_57457 ?auto_57459 ) ) ( not ( = ?auto_57457 ?auto_57460 ) ) ( not ( = ?auto_57458 ?auto_57459 ) ) ( not ( = ?auto_57458 ?auto_57460 ) ) ( not ( = ?auto_57459 ?auto_57460 ) ) ( ON ?auto_57458 ?auto_57459 ) ( ON ?auto_57457 ?auto_57458 ) ( CLEAR ?auto_57457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57457 )
      ( MAKE-3PILE ?auto_57457 ?auto_57458 ?auto_57459 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57464 - BLOCK
      ?auto_57465 - BLOCK
      ?auto_57466 - BLOCK
    )
    :vars
    (
      ?auto_57467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57466 ?auto_57467 ) ( not ( = ?auto_57464 ?auto_57465 ) ) ( not ( = ?auto_57464 ?auto_57466 ) ) ( not ( = ?auto_57464 ?auto_57467 ) ) ( not ( = ?auto_57465 ?auto_57466 ) ) ( not ( = ?auto_57465 ?auto_57467 ) ) ( not ( = ?auto_57466 ?auto_57467 ) ) ( ON ?auto_57465 ?auto_57466 ) ( ON ?auto_57464 ?auto_57465 ) ( CLEAR ?auto_57464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57464 )
      ( MAKE-3PILE ?auto_57464 ?auto_57465 ?auto_57466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57472 - BLOCK
      ?auto_57473 - BLOCK
      ?auto_57474 - BLOCK
      ?auto_57475 - BLOCK
    )
    :vars
    (
      ?auto_57476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57474 ) ( ON ?auto_57475 ?auto_57476 ) ( CLEAR ?auto_57475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57472 ) ( ON ?auto_57473 ?auto_57472 ) ( ON ?auto_57474 ?auto_57473 ) ( not ( = ?auto_57472 ?auto_57473 ) ) ( not ( = ?auto_57472 ?auto_57474 ) ) ( not ( = ?auto_57472 ?auto_57475 ) ) ( not ( = ?auto_57472 ?auto_57476 ) ) ( not ( = ?auto_57473 ?auto_57474 ) ) ( not ( = ?auto_57473 ?auto_57475 ) ) ( not ( = ?auto_57473 ?auto_57476 ) ) ( not ( = ?auto_57474 ?auto_57475 ) ) ( not ( = ?auto_57474 ?auto_57476 ) ) ( not ( = ?auto_57475 ?auto_57476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57475 ?auto_57476 )
      ( !STACK ?auto_57475 ?auto_57474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57481 - BLOCK
      ?auto_57482 - BLOCK
      ?auto_57483 - BLOCK
      ?auto_57484 - BLOCK
    )
    :vars
    (
      ?auto_57485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57483 ) ( ON ?auto_57484 ?auto_57485 ) ( CLEAR ?auto_57484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57481 ) ( ON ?auto_57482 ?auto_57481 ) ( ON ?auto_57483 ?auto_57482 ) ( not ( = ?auto_57481 ?auto_57482 ) ) ( not ( = ?auto_57481 ?auto_57483 ) ) ( not ( = ?auto_57481 ?auto_57484 ) ) ( not ( = ?auto_57481 ?auto_57485 ) ) ( not ( = ?auto_57482 ?auto_57483 ) ) ( not ( = ?auto_57482 ?auto_57484 ) ) ( not ( = ?auto_57482 ?auto_57485 ) ) ( not ( = ?auto_57483 ?auto_57484 ) ) ( not ( = ?auto_57483 ?auto_57485 ) ) ( not ( = ?auto_57484 ?auto_57485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57484 ?auto_57485 )
      ( !STACK ?auto_57484 ?auto_57483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57490 - BLOCK
      ?auto_57491 - BLOCK
      ?auto_57492 - BLOCK
      ?auto_57493 - BLOCK
    )
    :vars
    (
      ?auto_57494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57493 ?auto_57494 ) ( ON-TABLE ?auto_57490 ) ( ON ?auto_57491 ?auto_57490 ) ( not ( = ?auto_57490 ?auto_57491 ) ) ( not ( = ?auto_57490 ?auto_57492 ) ) ( not ( = ?auto_57490 ?auto_57493 ) ) ( not ( = ?auto_57490 ?auto_57494 ) ) ( not ( = ?auto_57491 ?auto_57492 ) ) ( not ( = ?auto_57491 ?auto_57493 ) ) ( not ( = ?auto_57491 ?auto_57494 ) ) ( not ( = ?auto_57492 ?auto_57493 ) ) ( not ( = ?auto_57492 ?auto_57494 ) ) ( not ( = ?auto_57493 ?auto_57494 ) ) ( CLEAR ?auto_57491 ) ( ON ?auto_57492 ?auto_57493 ) ( CLEAR ?auto_57492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57490 ?auto_57491 ?auto_57492 )
      ( MAKE-4PILE ?auto_57490 ?auto_57491 ?auto_57492 ?auto_57493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57499 - BLOCK
      ?auto_57500 - BLOCK
      ?auto_57501 - BLOCK
      ?auto_57502 - BLOCK
    )
    :vars
    (
      ?auto_57503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57502 ?auto_57503 ) ( ON-TABLE ?auto_57499 ) ( ON ?auto_57500 ?auto_57499 ) ( not ( = ?auto_57499 ?auto_57500 ) ) ( not ( = ?auto_57499 ?auto_57501 ) ) ( not ( = ?auto_57499 ?auto_57502 ) ) ( not ( = ?auto_57499 ?auto_57503 ) ) ( not ( = ?auto_57500 ?auto_57501 ) ) ( not ( = ?auto_57500 ?auto_57502 ) ) ( not ( = ?auto_57500 ?auto_57503 ) ) ( not ( = ?auto_57501 ?auto_57502 ) ) ( not ( = ?auto_57501 ?auto_57503 ) ) ( not ( = ?auto_57502 ?auto_57503 ) ) ( CLEAR ?auto_57500 ) ( ON ?auto_57501 ?auto_57502 ) ( CLEAR ?auto_57501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57499 ?auto_57500 ?auto_57501 )
      ( MAKE-4PILE ?auto_57499 ?auto_57500 ?auto_57501 ?auto_57502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57508 - BLOCK
      ?auto_57509 - BLOCK
      ?auto_57510 - BLOCK
      ?auto_57511 - BLOCK
    )
    :vars
    (
      ?auto_57512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57511 ?auto_57512 ) ( ON-TABLE ?auto_57508 ) ( not ( = ?auto_57508 ?auto_57509 ) ) ( not ( = ?auto_57508 ?auto_57510 ) ) ( not ( = ?auto_57508 ?auto_57511 ) ) ( not ( = ?auto_57508 ?auto_57512 ) ) ( not ( = ?auto_57509 ?auto_57510 ) ) ( not ( = ?auto_57509 ?auto_57511 ) ) ( not ( = ?auto_57509 ?auto_57512 ) ) ( not ( = ?auto_57510 ?auto_57511 ) ) ( not ( = ?auto_57510 ?auto_57512 ) ) ( not ( = ?auto_57511 ?auto_57512 ) ) ( ON ?auto_57510 ?auto_57511 ) ( CLEAR ?auto_57508 ) ( ON ?auto_57509 ?auto_57510 ) ( CLEAR ?auto_57509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57508 ?auto_57509 )
      ( MAKE-4PILE ?auto_57508 ?auto_57509 ?auto_57510 ?auto_57511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57517 - BLOCK
      ?auto_57518 - BLOCK
      ?auto_57519 - BLOCK
      ?auto_57520 - BLOCK
    )
    :vars
    (
      ?auto_57521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57520 ?auto_57521 ) ( ON-TABLE ?auto_57517 ) ( not ( = ?auto_57517 ?auto_57518 ) ) ( not ( = ?auto_57517 ?auto_57519 ) ) ( not ( = ?auto_57517 ?auto_57520 ) ) ( not ( = ?auto_57517 ?auto_57521 ) ) ( not ( = ?auto_57518 ?auto_57519 ) ) ( not ( = ?auto_57518 ?auto_57520 ) ) ( not ( = ?auto_57518 ?auto_57521 ) ) ( not ( = ?auto_57519 ?auto_57520 ) ) ( not ( = ?auto_57519 ?auto_57521 ) ) ( not ( = ?auto_57520 ?auto_57521 ) ) ( ON ?auto_57519 ?auto_57520 ) ( CLEAR ?auto_57517 ) ( ON ?auto_57518 ?auto_57519 ) ( CLEAR ?auto_57518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57517 ?auto_57518 )
      ( MAKE-4PILE ?auto_57517 ?auto_57518 ?auto_57519 ?auto_57520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57526 - BLOCK
      ?auto_57527 - BLOCK
      ?auto_57528 - BLOCK
      ?auto_57529 - BLOCK
    )
    :vars
    (
      ?auto_57530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57529 ?auto_57530 ) ( not ( = ?auto_57526 ?auto_57527 ) ) ( not ( = ?auto_57526 ?auto_57528 ) ) ( not ( = ?auto_57526 ?auto_57529 ) ) ( not ( = ?auto_57526 ?auto_57530 ) ) ( not ( = ?auto_57527 ?auto_57528 ) ) ( not ( = ?auto_57527 ?auto_57529 ) ) ( not ( = ?auto_57527 ?auto_57530 ) ) ( not ( = ?auto_57528 ?auto_57529 ) ) ( not ( = ?auto_57528 ?auto_57530 ) ) ( not ( = ?auto_57529 ?auto_57530 ) ) ( ON ?auto_57528 ?auto_57529 ) ( ON ?auto_57527 ?auto_57528 ) ( ON ?auto_57526 ?auto_57527 ) ( CLEAR ?auto_57526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57526 )
      ( MAKE-4PILE ?auto_57526 ?auto_57527 ?auto_57528 ?auto_57529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57535 - BLOCK
      ?auto_57536 - BLOCK
      ?auto_57537 - BLOCK
      ?auto_57538 - BLOCK
    )
    :vars
    (
      ?auto_57539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57538 ?auto_57539 ) ( not ( = ?auto_57535 ?auto_57536 ) ) ( not ( = ?auto_57535 ?auto_57537 ) ) ( not ( = ?auto_57535 ?auto_57538 ) ) ( not ( = ?auto_57535 ?auto_57539 ) ) ( not ( = ?auto_57536 ?auto_57537 ) ) ( not ( = ?auto_57536 ?auto_57538 ) ) ( not ( = ?auto_57536 ?auto_57539 ) ) ( not ( = ?auto_57537 ?auto_57538 ) ) ( not ( = ?auto_57537 ?auto_57539 ) ) ( not ( = ?auto_57538 ?auto_57539 ) ) ( ON ?auto_57537 ?auto_57538 ) ( ON ?auto_57536 ?auto_57537 ) ( ON ?auto_57535 ?auto_57536 ) ( CLEAR ?auto_57535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57535 )
      ( MAKE-4PILE ?auto_57535 ?auto_57536 ?auto_57537 ?auto_57538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57545 - BLOCK
      ?auto_57546 - BLOCK
      ?auto_57547 - BLOCK
      ?auto_57548 - BLOCK
      ?auto_57549 - BLOCK
    )
    :vars
    (
      ?auto_57550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57548 ) ( ON ?auto_57549 ?auto_57550 ) ( CLEAR ?auto_57549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57545 ) ( ON ?auto_57546 ?auto_57545 ) ( ON ?auto_57547 ?auto_57546 ) ( ON ?auto_57548 ?auto_57547 ) ( not ( = ?auto_57545 ?auto_57546 ) ) ( not ( = ?auto_57545 ?auto_57547 ) ) ( not ( = ?auto_57545 ?auto_57548 ) ) ( not ( = ?auto_57545 ?auto_57549 ) ) ( not ( = ?auto_57545 ?auto_57550 ) ) ( not ( = ?auto_57546 ?auto_57547 ) ) ( not ( = ?auto_57546 ?auto_57548 ) ) ( not ( = ?auto_57546 ?auto_57549 ) ) ( not ( = ?auto_57546 ?auto_57550 ) ) ( not ( = ?auto_57547 ?auto_57548 ) ) ( not ( = ?auto_57547 ?auto_57549 ) ) ( not ( = ?auto_57547 ?auto_57550 ) ) ( not ( = ?auto_57548 ?auto_57549 ) ) ( not ( = ?auto_57548 ?auto_57550 ) ) ( not ( = ?auto_57549 ?auto_57550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57549 ?auto_57550 )
      ( !STACK ?auto_57549 ?auto_57548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57556 - BLOCK
      ?auto_57557 - BLOCK
      ?auto_57558 - BLOCK
      ?auto_57559 - BLOCK
      ?auto_57560 - BLOCK
    )
    :vars
    (
      ?auto_57561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57559 ) ( ON ?auto_57560 ?auto_57561 ) ( CLEAR ?auto_57560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57556 ) ( ON ?auto_57557 ?auto_57556 ) ( ON ?auto_57558 ?auto_57557 ) ( ON ?auto_57559 ?auto_57558 ) ( not ( = ?auto_57556 ?auto_57557 ) ) ( not ( = ?auto_57556 ?auto_57558 ) ) ( not ( = ?auto_57556 ?auto_57559 ) ) ( not ( = ?auto_57556 ?auto_57560 ) ) ( not ( = ?auto_57556 ?auto_57561 ) ) ( not ( = ?auto_57557 ?auto_57558 ) ) ( not ( = ?auto_57557 ?auto_57559 ) ) ( not ( = ?auto_57557 ?auto_57560 ) ) ( not ( = ?auto_57557 ?auto_57561 ) ) ( not ( = ?auto_57558 ?auto_57559 ) ) ( not ( = ?auto_57558 ?auto_57560 ) ) ( not ( = ?auto_57558 ?auto_57561 ) ) ( not ( = ?auto_57559 ?auto_57560 ) ) ( not ( = ?auto_57559 ?auto_57561 ) ) ( not ( = ?auto_57560 ?auto_57561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57560 ?auto_57561 )
      ( !STACK ?auto_57560 ?auto_57559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57567 - BLOCK
      ?auto_57568 - BLOCK
      ?auto_57569 - BLOCK
      ?auto_57570 - BLOCK
      ?auto_57571 - BLOCK
    )
    :vars
    (
      ?auto_57572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57571 ?auto_57572 ) ( ON-TABLE ?auto_57567 ) ( ON ?auto_57568 ?auto_57567 ) ( ON ?auto_57569 ?auto_57568 ) ( not ( = ?auto_57567 ?auto_57568 ) ) ( not ( = ?auto_57567 ?auto_57569 ) ) ( not ( = ?auto_57567 ?auto_57570 ) ) ( not ( = ?auto_57567 ?auto_57571 ) ) ( not ( = ?auto_57567 ?auto_57572 ) ) ( not ( = ?auto_57568 ?auto_57569 ) ) ( not ( = ?auto_57568 ?auto_57570 ) ) ( not ( = ?auto_57568 ?auto_57571 ) ) ( not ( = ?auto_57568 ?auto_57572 ) ) ( not ( = ?auto_57569 ?auto_57570 ) ) ( not ( = ?auto_57569 ?auto_57571 ) ) ( not ( = ?auto_57569 ?auto_57572 ) ) ( not ( = ?auto_57570 ?auto_57571 ) ) ( not ( = ?auto_57570 ?auto_57572 ) ) ( not ( = ?auto_57571 ?auto_57572 ) ) ( CLEAR ?auto_57569 ) ( ON ?auto_57570 ?auto_57571 ) ( CLEAR ?auto_57570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57567 ?auto_57568 ?auto_57569 ?auto_57570 )
      ( MAKE-5PILE ?auto_57567 ?auto_57568 ?auto_57569 ?auto_57570 ?auto_57571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57578 - BLOCK
      ?auto_57579 - BLOCK
      ?auto_57580 - BLOCK
      ?auto_57581 - BLOCK
      ?auto_57582 - BLOCK
    )
    :vars
    (
      ?auto_57583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57582 ?auto_57583 ) ( ON-TABLE ?auto_57578 ) ( ON ?auto_57579 ?auto_57578 ) ( ON ?auto_57580 ?auto_57579 ) ( not ( = ?auto_57578 ?auto_57579 ) ) ( not ( = ?auto_57578 ?auto_57580 ) ) ( not ( = ?auto_57578 ?auto_57581 ) ) ( not ( = ?auto_57578 ?auto_57582 ) ) ( not ( = ?auto_57578 ?auto_57583 ) ) ( not ( = ?auto_57579 ?auto_57580 ) ) ( not ( = ?auto_57579 ?auto_57581 ) ) ( not ( = ?auto_57579 ?auto_57582 ) ) ( not ( = ?auto_57579 ?auto_57583 ) ) ( not ( = ?auto_57580 ?auto_57581 ) ) ( not ( = ?auto_57580 ?auto_57582 ) ) ( not ( = ?auto_57580 ?auto_57583 ) ) ( not ( = ?auto_57581 ?auto_57582 ) ) ( not ( = ?auto_57581 ?auto_57583 ) ) ( not ( = ?auto_57582 ?auto_57583 ) ) ( CLEAR ?auto_57580 ) ( ON ?auto_57581 ?auto_57582 ) ( CLEAR ?auto_57581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57578 ?auto_57579 ?auto_57580 ?auto_57581 )
      ( MAKE-5PILE ?auto_57578 ?auto_57579 ?auto_57580 ?auto_57581 ?auto_57582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57589 - BLOCK
      ?auto_57590 - BLOCK
      ?auto_57591 - BLOCK
      ?auto_57592 - BLOCK
      ?auto_57593 - BLOCK
    )
    :vars
    (
      ?auto_57594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57593 ?auto_57594 ) ( ON-TABLE ?auto_57589 ) ( ON ?auto_57590 ?auto_57589 ) ( not ( = ?auto_57589 ?auto_57590 ) ) ( not ( = ?auto_57589 ?auto_57591 ) ) ( not ( = ?auto_57589 ?auto_57592 ) ) ( not ( = ?auto_57589 ?auto_57593 ) ) ( not ( = ?auto_57589 ?auto_57594 ) ) ( not ( = ?auto_57590 ?auto_57591 ) ) ( not ( = ?auto_57590 ?auto_57592 ) ) ( not ( = ?auto_57590 ?auto_57593 ) ) ( not ( = ?auto_57590 ?auto_57594 ) ) ( not ( = ?auto_57591 ?auto_57592 ) ) ( not ( = ?auto_57591 ?auto_57593 ) ) ( not ( = ?auto_57591 ?auto_57594 ) ) ( not ( = ?auto_57592 ?auto_57593 ) ) ( not ( = ?auto_57592 ?auto_57594 ) ) ( not ( = ?auto_57593 ?auto_57594 ) ) ( ON ?auto_57592 ?auto_57593 ) ( CLEAR ?auto_57590 ) ( ON ?auto_57591 ?auto_57592 ) ( CLEAR ?auto_57591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57589 ?auto_57590 ?auto_57591 )
      ( MAKE-5PILE ?auto_57589 ?auto_57590 ?auto_57591 ?auto_57592 ?auto_57593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57600 - BLOCK
      ?auto_57601 - BLOCK
      ?auto_57602 - BLOCK
      ?auto_57603 - BLOCK
      ?auto_57604 - BLOCK
    )
    :vars
    (
      ?auto_57605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57604 ?auto_57605 ) ( ON-TABLE ?auto_57600 ) ( ON ?auto_57601 ?auto_57600 ) ( not ( = ?auto_57600 ?auto_57601 ) ) ( not ( = ?auto_57600 ?auto_57602 ) ) ( not ( = ?auto_57600 ?auto_57603 ) ) ( not ( = ?auto_57600 ?auto_57604 ) ) ( not ( = ?auto_57600 ?auto_57605 ) ) ( not ( = ?auto_57601 ?auto_57602 ) ) ( not ( = ?auto_57601 ?auto_57603 ) ) ( not ( = ?auto_57601 ?auto_57604 ) ) ( not ( = ?auto_57601 ?auto_57605 ) ) ( not ( = ?auto_57602 ?auto_57603 ) ) ( not ( = ?auto_57602 ?auto_57604 ) ) ( not ( = ?auto_57602 ?auto_57605 ) ) ( not ( = ?auto_57603 ?auto_57604 ) ) ( not ( = ?auto_57603 ?auto_57605 ) ) ( not ( = ?auto_57604 ?auto_57605 ) ) ( ON ?auto_57603 ?auto_57604 ) ( CLEAR ?auto_57601 ) ( ON ?auto_57602 ?auto_57603 ) ( CLEAR ?auto_57602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57600 ?auto_57601 ?auto_57602 )
      ( MAKE-5PILE ?auto_57600 ?auto_57601 ?auto_57602 ?auto_57603 ?auto_57604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57611 - BLOCK
      ?auto_57612 - BLOCK
      ?auto_57613 - BLOCK
      ?auto_57614 - BLOCK
      ?auto_57615 - BLOCK
    )
    :vars
    (
      ?auto_57616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57615 ?auto_57616 ) ( ON-TABLE ?auto_57611 ) ( not ( = ?auto_57611 ?auto_57612 ) ) ( not ( = ?auto_57611 ?auto_57613 ) ) ( not ( = ?auto_57611 ?auto_57614 ) ) ( not ( = ?auto_57611 ?auto_57615 ) ) ( not ( = ?auto_57611 ?auto_57616 ) ) ( not ( = ?auto_57612 ?auto_57613 ) ) ( not ( = ?auto_57612 ?auto_57614 ) ) ( not ( = ?auto_57612 ?auto_57615 ) ) ( not ( = ?auto_57612 ?auto_57616 ) ) ( not ( = ?auto_57613 ?auto_57614 ) ) ( not ( = ?auto_57613 ?auto_57615 ) ) ( not ( = ?auto_57613 ?auto_57616 ) ) ( not ( = ?auto_57614 ?auto_57615 ) ) ( not ( = ?auto_57614 ?auto_57616 ) ) ( not ( = ?auto_57615 ?auto_57616 ) ) ( ON ?auto_57614 ?auto_57615 ) ( ON ?auto_57613 ?auto_57614 ) ( CLEAR ?auto_57611 ) ( ON ?auto_57612 ?auto_57613 ) ( CLEAR ?auto_57612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57611 ?auto_57612 )
      ( MAKE-5PILE ?auto_57611 ?auto_57612 ?auto_57613 ?auto_57614 ?auto_57615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57622 - BLOCK
      ?auto_57623 - BLOCK
      ?auto_57624 - BLOCK
      ?auto_57625 - BLOCK
      ?auto_57626 - BLOCK
    )
    :vars
    (
      ?auto_57627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57626 ?auto_57627 ) ( ON-TABLE ?auto_57622 ) ( not ( = ?auto_57622 ?auto_57623 ) ) ( not ( = ?auto_57622 ?auto_57624 ) ) ( not ( = ?auto_57622 ?auto_57625 ) ) ( not ( = ?auto_57622 ?auto_57626 ) ) ( not ( = ?auto_57622 ?auto_57627 ) ) ( not ( = ?auto_57623 ?auto_57624 ) ) ( not ( = ?auto_57623 ?auto_57625 ) ) ( not ( = ?auto_57623 ?auto_57626 ) ) ( not ( = ?auto_57623 ?auto_57627 ) ) ( not ( = ?auto_57624 ?auto_57625 ) ) ( not ( = ?auto_57624 ?auto_57626 ) ) ( not ( = ?auto_57624 ?auto_57627 ) ) ( not ( = ?auto_57625 ?auto_57626 ) ) ( not ( = ?auto_57625 ?auto_57627 ) ) ( not ( = ?auto_57626 ?auto_57627 ) ) ( ON ?auto_57625 ?auto_57626 ) ( ON ?auto_57624 ?auto_57625 ) ( CLEAR ?auto_57622 ) ( ON ?auto_57623 ?auto_57624 ) ( CLEAR ?auto_57623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57622 ?auto_57623 )
      ( MAKE-5PILE ?auto_57622 ?auto_57623 ?auto_57624 ?auto_57625 ?auto_57626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57633 - BLOCK
      ?auto_57634 - BLOCK
      ?auto_57635 - BLOCK
      ?auto_57636 - BLOCK
      ?auto_57637 - BLOCK
    )
    :vars
    (
      ?auto_57638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57637 ?auto_57638 ) ( not ( = ?auto_57633 ?auto_57634 ) ) ( not ( = ?auto_57633 ?auto_57635 ) ) ( not ( = ?auto_57633 ?auto_57636 ) ) ( not ( = ?auto_57633 ?auto_57637 ) ) ( not ( = ?auto_57633 ?auto_57638 ) ) ( not ( = ?auto_57634 ?auto_57635 ) ) ( not ( = ?auto_57634 ?auto_57636 ) ) ( not ( = ?auto_57634 ?auto_57637 ) ) ( not ( = ?auto_57634 ?auto_57638 ) ) ( not ( = ?auto_57635 ?auto_57636 ) ) ( not ( = ?auto_57635 ?auto_57637 ) ) ( not ( = ?auto_57635 ?auto_57638 ) ) ( not ( = ?auto_57636 ?auto_57637 ) ) ( not ( = ?auto_57636 ?auto_57638 ) ) ( not ( = ?auto_57637 ?auto_57638 ) ) ( ON ?auto_57636 ?auto_57637 ) ( ON ?auto_57635 ?auto_57636 ) ( ON ?auto_57634 ?auto_57635 ) ( ON ?auto_57633 ?auto_57634 ) ( CLEAR ?auto_57633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57633 )
      ( MAKE-5PILE ?auto_57633 ?auto_57634 ?auto_57635 ?auto_57636 ?auto_57637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57644 - BLOCK
      ?auto_57645 - BLOCK
      ?auto_57646 - BLOCK
      ?auto_57647 - BLOCK
      ?auto_57648 - BLOCK
    )
    :vars
    (
      ?auto_57649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57648 ?auto_57649 ) ( not ( = ?auto_57644 ?auto_57645 ) ) ( not ( = ?auto_57644 ?auto_57646 ) ) ( not ( = ?auto_57644 ?auto_57647 ) ) ( not ( = ?auto_57644 ?auto_57648 ) ) ( not ( = ?auto_57644 ?auto_57649 ) ) ( not ( = ?auto_57645 ?auto_57646 ) ) ( not ( = ?auto_57645 ?auto_57647 ) ) ( not ( = ?auto_57645 ?auto_57648 ) ) ( not ( = ?auto_57645 ?auto_57649 ) ) ( not ( = ?auto_57646 ?auto_57647 ) ) ( not ( = ?auto_57646 ?auto_57648 ) ) ( not ( = ?auto_57646 ?auto_57649 ) ) ( not ( = ?auto_57647 ?auto_57648 ) ) ( not ( = ?auto_57647 ?auto_57649 ) ) ( not ( = ?auto_57648 ?auto_57649 ) ) ( ON ?auto_57647 ?auto_57648 ) ( ON ?auto_57646 ?auto_57647 ) ( ON ?auto_57645 ?auto_57646 ) ( ON ?auto_57644 ?auto_57645 ) ( CLEAR ?auto_57644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57644 )
      ( MAKE-5PILE ?auto_57644 ?auto_57645 ?auto_57646 ?auto_57647 ?auto_57648 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57656 - BLOCK
      ?auto_57657 - BLOCK
      ?auto_57658 - BLOCK
      ?auto_57659 - BLOCK
      ?auto_57660 - BLOCK
      ?auto_57661 - BLOCK
    )
    :vars
    (
      ?auto_57662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57660 ) ( ON ?auto_57661 ?auto_57662 ) ( CLEAR ?auto_57661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57656 ) ( ON ?auto_57657 ?auto_57656 ) ( ON ?auto_57658 ?auto_57657 ) ( ON ?auto_57659 ?auto_57658 ) ( ON ?auto_57660 ?auto_57659 ) ( not ( = ?auto_57656 ?auto_57657 ) ) ( not ( = ?auto_57656 ?auto_57658 ) ) ( not ( = ?auto_57656 ?auto_57659 ) ) ( not ( = ?auto_57656 ?auto_57660 ) ) ( not ( = ?auto_57656 ?auto_57661 ) ) ( not ( = ?auto_57656 ?auto_57662 ) ) ( not ( = ?auto_57657 ?auto_57658 ) ) ( not ( = ?auto_57657 ?auto_57659 ) ) ( not ( = ?auto_57657 ?auto_57660 ) ) ( not ( = ?auto_57657 ?auto_57661 ) ) ( not ( = ?auto_57657 ?auto_57662 ) ) ( not ( = ?auto_57658 ?auto_57659 ) ) ( not ( = ?auto_57658 ?auto_57660 ) ) ( not ( = ?auto_57658 ?auto_57661 ) ) ( not ( = ?auto_57658 ?auto_57662 ) ) ( not ( = ?auto_57659 ?auto_57660 ) ) ( not ( = ?auto_57659 ?auto_57661 ) ) ( not ( = ?auto_57659 ?auto_57662 ) ) ( not ( = ?auto_57660 ?auto_57661 ) ) ( not ( = ?auto_57660 ?auto_57662 ) ) ( not ( = ?auto_57661 ?auto_57662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57661 ?auto_57662 )
      ( !STACK ?auto_57661 ?auto_57660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57669 - BLOCK
      ?auto_57670 - BLOCK
      ?auto_57671 - BLOCK
      ?auto_57672 - BLOCK
      ?auto_57673 - BLOCK
      ?auto_57674 - BLOCK
    )
    :vars
    (
      ?auto_57675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57673 ) ( ON ?auto_57674 ?auto_57675 ) ( CLEAR ?auto_57674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57669 ) ( ON ?auto_57670 ?auto_57669 ) ( ON ?auto_57671 ?auto_57670 ) ( ON ?auto_57672 ?auto_57671 ) ( ON ?auto_57673 ?auto_57672 ) ( not ( = ?auto_57669 ?auto_57670 ) ) ( not ( = ?auto_57669 ?auto_57671 ) ) ( not ( = ?auto_57669 ?auto_57672 ) ) ( not ( = ?auto_57669 ?auto_57673 ) ) ( not ( = ?auto_57669 ?auto_57674 ) ) ( not ( = ?auto_57669 ?auto_57675 ) ) ( not ( = ?auto_57670 ?auto_57671 ) ) ( not ( = ?auto_57670 ?auto_57672 ) ) ( not ( = ?auto_57670 ?auto_57673 ) ) ( not ( = ?auto_57670 ?auto_57674 ) ) ( not ( = ?auto_57670 ?auto_57675 ) ) ( not ( = ?auto_57671 ?auto_57672 ) ) ( not ( = ?auto_57671 ?auto_57673 ) ) ( not ( = ?auto_57671 ?auto_57674 ) ) ( not ( = ?auto_57671 ?auto_57675 ) ) ( not ( = ?auto_57672 ?auto_57673 ) ) ( not ( = ?auto_57672 ?auto_57674 ) ) ( not ( = ?auto_57672 ?auto_57675 ) ) ( not ( = ?auto_57673 ?auto_57674 ) ) ( not ( = ?auto_57673 ?auto_57675 ) ) ( not ( = ?auto_57674 ?auto_57675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57674 ?auto_57675 )
      ( !STACK ?auto_57674 ?auto_57673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57682 - BLOCK
      ?auto_57683 - BLOCK
      ?auto_57684 - BLOCK
      ?auto_57685 - BLOCK
      ?auto_57686 - BLOCK
      ?auto_57687 - BLOCK
    )
    :vars
    (
      ?auto_57688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57687 ?auto_57688 ) ( ON-TABLE ?auto_57682 ) ( ON ?auto_57683 ?auto_57682 ) ( ON ?auto_57684 ?auto_57683 ) ( ON ?auto_57685 ?auto_57684 ) ( not ( = ?auto_57682 ?auto_57683 ) ) ( not ( = ?auto_57682 ?auto_57684 ) ) ( not ( = ?auto_57682 ?auto_57685 ) ) ( not ( = ?auto_57682 ?auto_57686 ) ) ( not ( = ?auto_57682 ?auto_57687 ) ) ( not ( = ?auto_57682 ?auto_57688 ) ) ( not ( = ?auto_57683 ?auto_57684 ) ) ( not ( = ?auto_57683 ?auto_57685 ) ) ( not ( = ?auto_57683 ?auto_57686 ) ) ( not ( = ?auto_57683 ?auto_57687 ) ) ( not ( = ?auto_57683 ?auto_57688 ) ) ( not ( = ?auto_57684 ?auto_57685 ) ) ( not ( = ?auto_57684 ?auto_57686 ) ) ( not ( = ?auto_57684 ?auto_57687 ) ) ( not ( = ?auto_57684 ?auto_57688 ) ) ( not ( = ?auto_57685 ?auto_57686 ) ) ( not ( = ?auto_57685 ?auto_57687 ) ) ( not ( = ?auto_57685 ?auto_57688 ) ) ( not ( = ?auto_57686 ?auto_57687 ) ) ( not ( = ?auto_57686 ?auto_57688 ) ) ( not ( = ?auto_57687 ?auto_57688 ) ) ( CLEAR ?auto_57685 ) ( ON ?auto_57686 ?auto_57687 ) ( CLEAR ?auto_57686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57682 ?auto_57683 ?auto_57684 ?auto_57685 ?auto_57686 )
      ( MAKE-6PILE ?auto_57682 ?auto_57683 ?auto_57684 ?auto_57685 ?auto_57686 ?auto_57687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57695 - BLOCK
      ?auto_57696 - BLOCK
      ?auto_57697 - BLOCK
      ?auto_57698 - BLOCK
      ?auto_57699 - BLOCK
      ?auto_57700 - BLOCK
    )
    :vars
    (
      ?auto_57701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57700 ?auto_57701 ) ( ON-TABLE ?auto_57695 ) ( ON ?auto_57696 ?auto_57695 ) ( ON ?auto_57697 ?auto_57696 ) ( ON ?auto_57698 ?auto_57697 ) ( not ( = ?auto_57695 ?auto_57696 ) ) ( not ( = ?auto_57695 ?auto_57697 ) ) ( not ( = ?auto_57695 ?auto_57698 ) ) ( not ( = ?auto_57695 ?auto_57699 ) ) ( not ( = ?auto_57695 ?auto_57700 ) ) ( not ( = ?auto_57695 ?auto_57701 ) ) ( not ( = ?auto_57696 ?auto_57697 ) ) ( not ( = ?auto_57696 ?auto_57698 ) ) ( not ( = ?auto_57696 ?auto_57699 ) ) ( not ( = ?auto_57696 ?auto_57700 ) ) ( not ( = ?auto_57696 ?auto_57701 ) ) ( not ( = ?auto_57697 ?auto_57698 ) ) ( not ( = ?auto_57697 ?auto_57699 ) ) ( not ( = ?auto_57697 ?auto_57700 ) ) ( not ( = ?auto_57697 ?auto_57701 ) ) ( not ( = ?auto_57698 ?auto_57699 ) ) ( not ( = ?auto_57698 ?auto_57700 ) ) ( not ( = ?auto_57698 ?auto_57701 ) ) ( not ( = ?auto_57699 ?auto_57700 ) ) ( not ( = ?auto_57699 ?auto_57701 ) ) ( not ( = ?auto_57700 ?auto_57701 ) ) ( CLEAR ?auto_57698 ) ( ON ?auto_57699 ?auto_57700 ) ( CLEAR ?auto_57699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57695 ?auto_57696 ?auto_57697 ?auto_57698 ?auto_57699 )
      ( MAKE-6PILE ?auto_57695 ?auto_57696 ?auto_57697 ?auto_57698 ?auto_57699 ?auto_57700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57708 - BLOCK
      ?auto_57709 - BLOCK
      ?auto_57710 - BLOCK
      ?auto_57711 - BLOCK
      ?auto_57712 - BLOCK
      ?auto_57713 - BLOCK
    )
    :vars
    (
      ?auto_57714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57713 ?auto_57714 ) ( ON-TABLE ?auto_57708 ) ( ON ?auto_57709 ?auto_57708 ) ( ON ?auto_57710 ?auto_57709 ) ( not ( = ?auto_57708 ?auto_57709 ) ) ( not ( = ?auto_57708 ?auto_57710 ) ) ( not ( = ?auto_57708 ?auto_57711 ) ) ( not ( = ?auto_57708 ?auto_57712 ) ) ( not ( = ?auto_57708 ?auto_57713 ) ) ( not ( = ?auto_57708 ?auto_57714 ) ) ( not ( = ?auto_57709 ?auto_57710 ) ) ( not ( = ?auto_57709 ?auto_57711 ) ) ( not ( = ?auto_57709 ?auto_57712 ) ) ( not ( = ?auto_57709 ?auto_57713 ) ) ( not ( = ?auto_57709 ?auto_57714 ) ) ( not ( = ?auto_57710 ?auto_57711 ) ) ( not ( = ?auto_57710 ?auto_57712 ) ) ( not ( = ?auto_57710 ?auto_57713 ) ) ( not ( = ?auto_57710 ?auto_57714 ) ) ( not ( = ?auto_57711 ?auto_57712 ) ) ( not ( = ?auto_57711 ?auto_57713 ) ) ( not ( = ?auto_57711 ?auto_57714 ) ) ( not ( = ?auto_57712 ?auto_57713 ) ) ( not ( = ?auto_57712 ?auto_57714 ) ) ( not ( = ?auto_57713 ?auto_57714 ) ) ( ON ?auto_57712 ?auto_57713 ) ( CLEAR ?auto_57710 ) ( ON ?auto_57711 ?auto_57712 ) ( CLEAR ?auto_57711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57708 ?auto_57709 ?auto_57710 ?auto_57711 )
      ( MAKE-6PILE ?auto_57708 ?auto_57709 ?auto_57710 ?auto_57711 ?auto_57712 ?auto_57713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57721 - BLOCK
      ?auto_57722 - BLOCK
      ?auto_57723 - BLOCK
      ?auto_57724 - BLOCK
      ?auto_57725 - BLOCK
      ?auto_57726 - BLOCK
    )
    :vars
    (
      ?auto_57727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57726 ?auto_57727 ) ( ON-TABLE ?auto_57721 ) ( ON ?auto_57722 ?auto_57721 ) ( ON ?auto_57723 ?auto_57722 ) ( not ( = ?auto_57721 ?auto_57722 ) ) ( not ( = ?auto_57721 ?auto_57723 ) ) ( not ( = ?auto_57721 ?auto_57724 ) ) ( not ( = ?auto_57721 ?auto_57725 ) ) ( not ( = ?auto_57721 ?auto_57726 ) ) ( not ( = ?auto_57721 ?auto_57727 ) ) ( not ( = ?auto_57722 ?auto_57723 ) ) ( not ( = ?auto_57722 ?auto_57724 ) ) ( not ( = ?auto_57722 ?auto_57725 ) ) ( not ( = ?auto_57722 ?auto_57726 ) ) ( not ( = ?auto_57722 ?auto_57727 ) ) ( not ( = ?auto_57723 ?auto_57724 ) ) ( not ( = ?auto_57723 ?auto_57725 ) ) ( not ( = ?auto_57723 ?auto_57726 ) ) ( not ( = ?auto_57723 ?auto_57727 ) ) ( not ( = ?auto_57724 ?auto_57725 ) ) ( not ( = ?auto_57724 ?auto_57726 ) ) ( not ( = ?auto_57724 ?auto_57727 ) ) ( not ( = ?auto_57725 ?auto_57726 ) ) ( not ( = ?auto_57725 ?auto_57727 ) ) ( not ( = ?auto_57726 ?auto_57727 ) ) ( ON ?auto_57725 ?auto_57726 ) ( CLEAR ?auto_57723 ) ( ON ?auto_57724 ?auto_57725 ) ( CLEAR ?auto_57724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57721 ?auto_57722 ?auto_57723 ?auto_57724 )
      ( MAKE-6PILE ?auto_57721 ?auto_57722 ?auto_57723 ?auto_57724 ?auto_57725 ?auto_57726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57734 - BLOCK
      ?auto_57735 - BLOCK
      ?auto_57736 - BLOCK
      ?auto_57737 - BLOCK
      ?auto_57738 - BLOCK
      ?auto_57739 - BLOCK
    )
    :vars
    (
      ?auto_57740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57739 ?auto_57740 ) ( ON-TABLE ?auto_57734 ) ( ON ?auto_57735 ?auto_57734 ) ( not ( = ?auto_57734 ?auto_57735 ) ) ( not ( = ?auto_57734 ?auto_57736 ) ) ( not ( = ?auto_57734 ?auto_57737 ) ) ( not ( = ?auto_57734 ?auto_57738 ) ) ( not ( = ?auto_57734 ?auto_57739 ) ) ( not ( = ?auto_57734 ?auto_57740 ) ) ( not ( = ?auto_57735 ?auto_57736 ) ) ( not ( = ?auto_57735 ?auto_57737 ) ) ( not ( = ?auto_57735 ?auto_57738 ) ) ( not ( = ?auto_57735 ?auto_57739 ) ) ( not ( = ?auto_57735 ?auto_57740 ) ) ( not ( = ?auto_57736 ?auto_57737 ) ) ( not ( = ?auto_57736 ?auto_57738 ) ) ( not ( = ?auto_57736 ?auto_57739 ) ) ( not ( = ?auto_57736 ?auto_57740 ) ) ( not ( = ?auto_57737 ?auto_57738 ) ) ( not ( = ?auto_57737 ?auto_57739 ) ) ( not ( = ?auto_57737 ?auto_57740 ) ) ( not ( = ?auto_57738 ?auto_57739 ) ) ( not ( = ?auto_57738 ?auto_57740 ) ) ( not ( = ?auto_57739 ?auto_57740 ) ) ( ON ?auto_57738 ?auto_57739 ) ( ON ?auto_57737 ?auto_57738 ) ( CLEAR ?auto_57735 ) ( ON ?auto_57736 ?auto_57737 ) ( CLEAR ?auto_57736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57734 ?auto_57735 ?auto_57736 )
      ( MAKE-6PILE ?auto_57734 ?auto_57735 ?auto_57736 ?auto_57737 ?auto_57738 ?auto_57739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57747 - BLOCK
      ?auto_57748 - BLOCK
      ?auto_57749 - BLOCK
      ?auto_57750 - BLOCK
      ?auto_57751 - BLOCK
      ?auto_57752 - BLOCK
    )
    :vars
    (
      ?auto_57753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57752 ?auto_57753 ) ( ON-TABLE ?auto_57747 ) ( ON ?auto_57748 ?auto_57747 ) ( not ( = ?auto_57747 ?auto_57748 ) ) ( not ( = ?auto_57747 ?auto_57749 ) ) ( not ( = ?auto_57747 ?auto_57750 ) ) ( not ( = ?auto_57747 ?auto_57751 ) ) ( not ( = ?auto_57747 ?auto_57752 ) ) ( not ( = ?auto_57747 ?auto_57753 ) ) ( not ( = ?auto_57748 ?auto_57749 ) ) ( not ( = ?auto_57748 ?auto_57750 ) ) ( not ( = ?auto_57748 ?auto_57751 ) ) ( not ( = ?auto_57748 ?auto_57752 ) ) ( not ( = ?auto_57748 ?auto_57753 ) ) ( not ( = ?auto_57749 ?auto_57750 ) ) ( not ( = ?auto_57749 ?auto_57751 ) ) ( not ( = ?auto_57749 ?auto_57752 ) ) ( not ( = ?auto_57749 ?auto_57753 ) ) ( not ( = ?auto_57750 ?auto_57751 ) ) ( not ( = ?auto_57750 ?auto_57752 ) ) ( not ( = ?auto_57750 ?auto_57753 ) ) ( not ( = ?auto_57751 ?auto_57752 ) ) ( not ( = ?auto_57751 ?auto_57753 ) ) ( not ( = ?auto_57752 ?auto_57753 ) ) ( ON ?auto_57751 ?auto_57752 ) ( ON ?auto_57750 ?auto_57751 ) ( CLEAR ?auto_57748 ) ( ON ?auto_57749 ?auto_57750 ) ( CLEAR ?auto_57749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57747 ?auto_57748 ?auto_57749 )
      ( MAKE-6PILE ?auto_57747 ?auto_57748 ?auto_57749 ?auto_57750 ?auto_57751 ?auto_57752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57760 - BLOCK
      ?auto_57761 - BLOCK
      ?auto_57762 - BLOCK
      ?auto_57763 - BLOCK
      ?auto_57764 - BLOCK
      ?auto_57765 - BLOCK
    )
    :vars
    (
      ?auto_57766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57765 ?auto_57766 ) ( ON-TABLE ?auto_57760 ) ( not ( = ?auto_57760 ?auto_57761 ) ) ( not ( = ?auto_57760 ?auto_57762 ) ) ( not ( = ?auto_57760 ?auto_57763 ) ) ( not ( = ?auto_57760 ?auto_57764 ) ) ( not ( = ?auto_57760 ?auto_57765 ) ) ( not ( = ?auto_57760 ?auto_57766 ) ) ( not ( = ?auto_57761 ?auto_57762 ) ) ( not ( = ?auto_57761 ?auto_57763 ) ) ( not ( = ?auto_57761 ?auto_57764 ) ) ( not ( = ?auto_57761 ?auto_57765 ) ) ( not ( = ?auto_57761 ?auto_57766 ) ) ( not ( = ?auto_57762 ?auto_57763 ) ) ( not ( = ?auto_57762 ?auto_57764 ) ) ( not ( = ?auto_57762 ?auto_57765 ) ) ( not ( = ?auto_57762 ?auto_57766 ) ) ( not ( = ?auto_57763 ?auto_57764 ) ) ( not ( = ?auto_57763 ?auto_57765 ) ) ( not ( = ?auto_57763 ?auto_57766 ) ) ( not ( = ?auto_57764 ?auto_57765 ) ) ( not ( = ?auto_57764 ?auto_57766 ) ) ( not ( = ?auto_57765 ?auto_57766 ) ) ( ON ?auto_57764 ?auto_57765 ) ( ON ?auto_57763 ?auto_57764 ) ( ON ?auto_57762 ?auto_57763 ) ( CLEAR ?auto_57760 ) ( ON ?auto_57761 ?auto_57762 ) ( CLEAR ?auto_57761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57760 ?auto_57761 )
      ( MAKE-6PILE ?auto_57760 ?auto_57761 ?auto_57762 ?auto_57763 ?auto_57764 ?auto_57765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57773 - BLOCK
      ?auto_57774 - BLOCK
      ?auto_57775 - BLOCK
      ?auto_57776 - BLOCK
      ?auto_57777 - BLOCK
      ?auto_57778 - BLOCK
    )
    :vars
    (
      ?auto_57779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57778 ?auto_57779 ) ( ON-TABLE ?auto_57773 ) ( not ( = ?auto_57773 ?auto_57774 ) ) ( not ( = ?auto_57773 ?auto_57775 ) ) ( not ( = ?auto_57773 ?auto_57776 ) ) ( not ( = ?auto_57773 ?auto_57777 ) ) ( not ( = ?auto_57773 ?auto_57778 ) ) ( not ( = ?auto_57773 ?auto_57779 ) ) ( not ( = ?auto_57774 ?auto_57775 ) ) ( not ( = ?auto_57774 ?auto_57776 ) ) ( not ( = ?auto_57774 ?auto_57777 ) ) ( not ( = ?auto_57774 ?auto_57778 ) ) ( not ( = ?auto_57774 ?auto_57779 ) ) ( not ( = ?auto_57775 ?auto_57776 ) ) ( not ( = ?auto_57775 ?auto_57777 ) ) ( not ( = ?auto_57775 ?auto_57778 ) ) ( not ( = ?auto_57775 ?auto_57779 ) ) ( not ( = ?auto_57776 ?auto_57777 ) ) ( not ( = ?auto_57776 ?auto_57778 ) ) ( not ( = ?auto_57776 ?auto_57779 ) ) ( not ( = ?auto_57777 ?auto_57778 ) ) ( not ( = ?auto_57777 ?auto_57779 ) ) ( not ( = ?auto_57778 ?auto_57779 ) ) ( ON ?auto_57777 ?auto_57778 ) ( ON ?auto_57776 ?auto_57777 ) ( ON ?auto_57775 ?auto_57776 ) ( CLEAR ?auto_57773 ) ( ON ?auto_57774 ?auto_57775 ) ( CLEAR ?auto_57774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57773 ?auto_57774 )
      ( MAKE-6PILE ?auto_57773 ?auto_57774 ?auto_57775 ?auto_57776 ?auto_57777 ?auto_57778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57786 - BLOCK
      ?auto_57787 - BLOCK
      ?auto_57788 - BLOCK
      ?auto_57789 - BLOCK
      ?auto_57790 - BLOCK
      ?auto_57791 - BLOCK
    )
    :vars
    (
      ?auto_57792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57791 ?auto_57792 ) ( not ( = ?auto_57786 ?auto_57787 ) ) ( not ( = ?auto_57786 ?auto_57788 ) ) ( not ( = ?auto_57786 ?auto_57789 ) ) ( not ( = ?auto_57786 ?auto_57790 ) ) ( not ( = ?auto_57786 ?auto_57791 ) ) ( not ( = ?auto_57786 ?auto_57792 ) ) ( not ( = ?auto_57787 ?auto_57788 ) ) ( not ( = ?auto_57787 ?auto_57789 ) ) ( not ( = ?auto_57787 ?auto_57790 ) ) ( not ( = ?auto_57787 ?auto_57791 ) ) ( not ( = ?auto_57787 ?auto_57792 ) ) ( not ( = ?auto_57788 ?auto_57789 ) ) ( not ( = ?auto_57788 ?auto_57790 ) ) ( not ( = ?auto_57788 ?auto_57791 ) ) ( not ( = ?auto_57788 ?auto_57792 ) ) ( not ( = ?auto_57789 ?auto_57790 ) ) ( not ( = ?auto_57789 ?auto_57791 ) ) ( not ( = ?auto_57789 ?auto_57792 ) ) ( not ( = ?auto_57790 ?auto_57791 ) ) ( not ( = ?auto_57790 ?auto_57792 ) ) ( not ( = ?auto_57791 ?auto_57792 ) ) ( ON ?auto_57790 ?auto_57791 ) ( ON ?auto_57789 ?auto_57790 ) ( ON ?auto_57788 ?auto_57789 ) ( ON ?auto_57787 ?auto_57788 ) ( ON ?auto_57786 ?auto_57787 ) ( CLEAR ?auto_57786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57786 )
      ( MAKE-6PILE ?auto_57786 ?auto_57787 ?auto_57788 ?auto_57789 ?auto_57790 ?auto_57791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57799 - BLOCK
      ?auto_57800 - BLOCK
      ?auto_57801 - BLOCK
      ?auto_57802 - BLOCK
      ?auto_57803 - BLOCK
      ?auto_57804 - BLOCK
    )
    :vars
    (
      ?auto_57805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57804 ?auto_57805 ) ( not ( = ?auto_57799 ?auto_57800 ) ) ( not ( = ?auto_57799 ?auto_57801 ) ) ( not ( = ?auto_57799 ?auto_57802 ) ) ( not ( = ?auto_57799 ?auto_57803 ) ) ( not ( = ?auto_57799 ?auto_57804 ) ) ( not ( = ?auto_57799 ?auto_57805 ) ) ( not ( = ?auto_57800 ?auto_57801 ) ) ( not ( = ?auto_57800 ?auto_57802 ) ) ( not ( = ?auto_57800 ?auto_57803 ) ) ( not ( = ?auto_57800 ?auto_57804 ) ) ( not ( = ?auto_57800 ?auto_57805 ) ) ( not ( = ?auto_57801 ?auto_57802 ) ) ( not ( = ?auto_57801 ?auto_57803 ) ) ( not ( = ?auto_57801 ?auto_57804 ) ) ( not ( = ?auto_57801 ?auto_57805 ) ) ( not ( = ?auto_57802 ?auto_57803 ) ) ( not ( = ?auto_57802 ?auto_57804 ) ) ( not ( = ?auto_57802 ?auto_57805 ) ) ( not ( = ?auto_57803 ?auto_57804 ) ) ( not ( = ?auto_57803 ?auto_57805 ) ) ( not ( = ?auto_57804 ?auto_57805 ) ) ( ON ?auto_57803 ?auto_57804 ) ( ON ?auto_57802 ?auto_57803 ) ( ON ?auto_57801 ?auto_57802 ) ( ON ?auto_57800 ?auto_57801 ) ( ON ?auto_57799 ?auto_57800 ) ( CLEAR ?auto_57799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57799 )
      ( MAKE-6PILE ?auto_57799 ?auto_57800 ?auto_57801 ?auto_57802 ?auto_57803 ?auto_57804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57813 - BLOCK
      ?auto_57814 - BLOCK
      ?auto_57815 - BLOCK
      ?auto_57816 - BLOCK
      ?auto_57817 - BLOCK
      ?auto_57818 - BLOCK
      ?auto_57819 - BLOCK
    )
    :vars
    (
      ?auto_57820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57818 ) ( ON ?auto_57819 ?auto_57820 ) ( CLEAR ?auto_57819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57813 ) ( ON ?auto_57814 ?auto_57813 ) ( ON ?auto_57815 ?auto_57814 ) ( ON ?auto_57816 ?auto_57815 ) ( ON ?auto_57817 ?auto_57816 ) ( ON ?auto_57818 ?auto_57817 ) ( not ( = ?auto_57813 ?auto_57814 ) ) ( not ( = ?auto_57813 ?auto_57815 ) ) ( not ( = ?auto_57813 ?auto_57816 ) ) ( not ( = ?auto_57813 ?auto_57817 ) ) ( not ( = ?auto_57813 ?auto_57818 ) ) ( not ( = ?auto_57813 ?auto_57819 ) ) ( not ( = ?auto_57813 ?auto_57820 ) ) ( not ( = ?auto_57814 ?auto_57815 ) ) ( not ( = ?auto_57814 ?auto_57816 ) ) ( not ( = ?auto_57814 ?auto_57817 ) ) ( not ( = ?auto_57814 ?auto_57818 ) ) ( not ( = ?auto_57814 ?auto_57819 ) ) ( not ( = ?auto_57814 ?auto_57820 ) ) ( not ( = ?auto_57815 ?auto_57816 ) ) ( not ( = ?auto_57815 ?auto_57817 ) ) ( not ( = ?auto_57815 ?auto_57818 ) ) ( not ( = ?auto_57815 ?auto_57819 ) ) ( not ( = ?auto_57815 ?auto_57820 ) ) ( not ( = ?auto_57816 ?auto_57817 ) ) ( not ( = ?auto_57816 ?auto_57818 ) ) ( not ( = ?auto_57816 ?auto_57819 ) ) ( not ( = ?auto_57816 ?auto_57820 ) ) ( not ( = ?auto_57817 ?auto_57818 ) ) ( not ( = ?auto_57817 ?auto_57819 ) ) ( not ( = ?auto_57817 ?auto_57820 ) ) ( not ( = ?auto_57818 ?auto_57819 ) ) ( not ( = ?auto_57818 ?auto_57820 ) ) ( not ( = ?auto_57819 ?auto_57820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57819 ?auto_57820 )
      ( !STACK ?auto_57819 ?auto_57818 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57828 - BLOCK
      ?auto_57829 - BLOCK
      ?auto_57830 - BLOCK
      ?auto_57831 - BLOCK
      ?auto_57832 - BLOCK
      ?auto_57833 - BLOCK
      ?auto_57834 - BLOCK
    )
    :vars
    (
      ?auto_57835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57833 ) ( ON ?auto_57834 ?auto_57835 ) ( CLEAR ?auto_57834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57828 ) ( ON ?auto_57829 ?auto_57828 ) ( ON ?auto_57830 ?auto_57829 ) ( ON ?auto_57831 ?auto_57830 ) ( ON ?auto_57832 ?auto_57831 ) ( ON ?auto_57833 ?auto_57832 ) ( not ( = ?auto_57828 ?auto_57829 ) ) ( not ( = ?auto_57828 ?auto_57830 ) ) ( not ( = ?auto_57828 ?auto_57831 ) ) ( not ( = ?auto_57828 ?auto_57832 ) ) ( not ( = ?auto_57828 ?auto_57833 ) ) ( not ( = ?auto_57828 ?auto_57834 ) ) ( not ( = ?auto_57828 ?auto_57835 ) ) ( not ( = ?auto_57829 ?auto_57830 ) ) ( not ( = ?auto_57829 ?auto_57831 ) ) ( not ( = ?auto_57829 ?auto_57832 ) ) ( not ( = ?auto_57829 ?auto_57833 ) ) ( not ( = ?auto_57829 ?auto_57834 ) ) ( not ( = ?auto_57829 ?auto_57835 ) ) ( not ( = ?auto_57830 ?auto_57831 ) ) ( not ( = ?auto_57830 ?auto_57832 ) ) ( not ( = ?auto_57830 ?auto_57833 ) ) ( not ( = ?auto_57830 ?auto_57834 ) ) ( not ( = ?auto_57830 ?auto_57835 ) ) ( not ( = ?auto_57831 ?auto_57832 ) ) ( not ( = ?auto_57831 ?auto_57833 ) ) ( not ( = ?auto_57831 ?auto_57834 ) ) ( not ( = ?auto_57831 ?auto_57835 ) ) ( not ( = ?auto_57832 ?auto_57833 ) ) ( not ( = ?auto_57832 ?auto_57834 ) ) ( not ( = ?auto_57832 ?auto_57835 ) ) ( not ( = ?auto_57833 ?auto_57834 ) ) ( not ( = ?auto_57833 ?auto_57835 ) ) ( not ( = ?auto_57834 ?auto_57835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57834 ?auto_57835 )
      ( !STACK ?auto_57834 ?auto_57833 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57843 - BLOCK
      ?auto_57844 - BLOCK
      ?auto_57845 - BLOCK
      ?auto_57846 - BLOCK
      ?auto_57847 - BLOCK
      ?auto_57848 - BLOCK
      ?auto_57849 - BLOCK
    )
    :vars
    (
      ?auto_57850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57849 ?auto_57850 ) ( ON-TABLE ?auto_57843 ) ( ON ?auto_57844 ?auto_57843 ) ( ON ?auto_57845 ?auto_57844 ) ( ON ?auto_57846 ?auto_57845 ) ( ON ?auto_57847 ?auto_57846 ) ( not ( = ?auto_57843 ?auto_57844 ) ) ( not ( = ?auto_57843 ?auto_57845 ) ) ( not ( = ?auto_57843 ?auto_57846 ) ) ( not ( = ?auto_57843 ?auto_57847 ) ) ( not ( = ?auto_57843 ?auto_57848 ) ) ( not ( = ?auto_57843 ?auto_57849 ) ) ( not ( = ?auto_57843 ?auto_57850 ) ) ( not ( = ?auto_57844 ?auto_57845 ) ) ( not ( = ?auto_57844 ?auto_57846 ) ) ( not ( = ?auto_57844 ?auto_57847 ) ) ( not ( = ?auto_57844 ?auto_57848 ) ) ( not ( = ?auto_57844 ?auto_57849 ) ) ( not ( = ?auto_57844 ?auto_57850 ) ) ( not ( = ?auto_57845 ?auto_57846 ) ) ( not ( = ?auto_57845 ?auto_57847 ) ) ( not ( = ?auto_57845 ?auto_57848 ) ) ( not ( = ?auto_57845 ?auto_57849 ) ) ( not ( = ?auto_57845 ?auto_57850 ) ) ( not ( = ?auto_57846 ?auto_57847 ) ) ( not ( = ?auto_57846 ?auto_57848 ) ) ( not ( = ?auto_57846 ?auto_57849 ) ) ( not ( = ?auto_57846 ?auto_57850 ) ) ( not ( = ?auto_57847 ?auto_57848 ) ) ( not ( = ?auto_57847 ?auto_57849 ) ) ( not ( = ?auto_57847 ?auto_57850 ) ) ( not ( = ?auto_57848 ?auto_57849 ) ) ( not ( = ?auto_57848 ?auto_57850 ) ) ( not ( = ?auto_57849 ?auto_57850 ) ) ( CLEAR ?auto_57847 ) ( ON ?auto_57848 ?auto_57849 ) ( CLEAR ?auto_57848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57843 ?auto_57844 ?auto_57845 ?auto_57846 ?auto_57847 ?auto_57848 )
      ( MAKE-7PILE ?auto_57843 ?auto_57844 ?auto_57845 ?auto_57846 ?auto_57847 ?auto_57848 ?auto_57849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57858 - BLOCK
      ?auto_57859 - BLOCK
      ?auto_57860 - BLOCK
      ?auto_57861 - BLOCK
      ?auto_57862 - BLOCK
      ?auto_57863 - BLOCK
      ?auto_57864 - BLOCK
    )
    :vars
    (
      ?auto_57865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57864 ?auto_57865 ) ( ON-TABLE ?auto_57858 ) ( ON ?auto_57859 ?auto_57858 ) ( ON ?auto_57860 ?auto_57859 ) ( ON ?auto_57861 ?auto_57860 ) ( ON ?auto_57862 ?auto_57861 ) ( not ( = ?auto_57858 ?auto_57859 ) ) ( not ( = ?auto_57858 ?auto_57860 ) ) ( not ( = ?auto_57858 ?auto_57861 ) ) ( not ( = ?auto_57858 ?auto_57862 ) ) ( not ( = ?auto_57858 ?auto_57863 ) ) ( not ( = ?auto_57858 ?auto_57864 ) ) ( not ( = ?auto_57858 ?auto_57865 ) ) ( not ( = ?auto_57859 ?auto_57860 ) ) ( not ( = ?auto_57859 ?auto_57861 ) ) ( not ( = ?auto_57859 ?auto_57862 ) ) ( not ( = ?auto_57859 ?auto_57863 ) ) ( not ( = ?auto_57859 ?auto_57864 ) ) ( not ( = ?auto_57859 ?auto_57865 ) ) ( not ( = ?auto_57860 ?auto_57861 ) ) ( not ( = ?auto_57860 ?auto_57862 ) ) ( not ( = ?auto_57860 ?auto_57863 ) ) ( not ( = ?auto_57860 ?auto_57864 ) ) ( not ( = ?auto_57860 ?auto_57865 ) ) ( not ( = ?auto_57861 ?auto_57862 ) ) ( not ( = ?auto_57861 ?auto_57863 ) ) ( not ( = ?auto_57861 ?auto_57864 ) ) ( not ( = ?auto_57861 ?auto_57865 ) ) ( not ( = ?auto_57862 ?auto_57863 ) ) ( not ( = ?auto_57862 ?auto_57864 ) ) ( not ( = ?auto_57862 ?auto_57865 ) ) ( not ( = ?auto_57863 ?auto_57864 ) ) ( not ( = ?auto_57863 ?auto_57865 ) ) ( not ( = ?auto_57864 ?auto_57865 ) ) ( CLEAR ?auto_57862 ) ( ON ?auto_57863 ?auto_57864 ) ( CLEAR ?auto_57863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57858 ?auto_57859 ?auto_57860 ?auto_57861 ?auto_57862 ?auto_57863 )
      ( MAKE-7PILE ?auto_57858 ?auto_57859 ?auto_57860 ?auto_57861 ?auto_57862 ?auto_57863 ?auto_57864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57873 - BLOCK
      ?auto_57874 - BLOCK
      ?auto_57875 - BLOCK
      ?auto_57876 - BLOCK
      ?auto_57877 - BLOCK
      ?auto_57878 - BLOCK
      ?auto_57879 - BLOCK
    )
    :vars
    (
      ?auto_57880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57879 ?auto_57880 ) ( ON-TABLE ?auto_57873 ) ( ON ?auto_57874 ?auto_57873 ) ( ON ?auto_57875 ?auto_57874 ) ( ON ?auto_57876 ?auto_57875 ) ( not ( = ?auto_57873 ?auto_57874 ) ) ( not ( = ?auto_57873 ?auto_57875 ) ) ( not ( = ?auto_57873 ?auto_57876 ) ) ( not ( = ?auto_57873 ?auto_57877 ) ) ( not ( = ?auto_57873 ?auto_57878 ) ) ( not ( = ?auto_57873 ?auto_57879 ) ) ( not ( = ?auto_57873 ?auto_57880 ) ) ( not ( = ?auto_57874 ?auto_57875 ) ) ( not ( = ?auto_57874 ?auto_57876 ) ) ( not ( = ?auto_57874 ?auto_57877 ) ) ( not ( = ?auto_57874 ?auto_57878 ) ) ( not ( = ?auto_57874 ?auto_57879 ) ) ( not ( = ?auto_57874 ?auto_57880 ) ) ( not ( = ?auto_57875 ?auto_57876 ) ) ( not ( = ?auto_57875 ?auto_57877 ) ) ( not ( = ?auto_57875 ?auto_57878 ) ) ( not ( = ?auto_57875 ?auto_57879 ) ) ( not ( = ?auto_57875 ?auto_57880 ) ) ( not ( = ?auto_57876 ?auto_57877 ) ) ( not ( = ?auto_57876 ?auto_57878 ) ) ( not ( = ?auto_57876 ?auto_57879 ) ) ( not ( = ?auto_57876 ?auto_57880 ) ) ( not ( = ?auto_57877 ?auto_57878 ) ) ( not ( = ?auto_57877 ?auto_57879 ) ) ( not ( = ?auto_57877 ?auto_57880 ) ) ( not ( = ?auto_57878 ?auto_57879 ) ) ( not ( = ?auto_57878 ?auto_57880 ) ) ( not ( = ?auto_57879 ?auto_57880 ) ) ( ON ?auto_57878 ?auto_57879 ) ( CLEAR ?auto_57876 ) ( ON ?auto_57877 ?auto_57878 ) ( CLEAR ?auto_57877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57873 ?auto_57874 ?auto_57875 ?auto_57876 ?auto_57877 )
      ( MAKE-7PILE ?auto_57873 ?auto_57874 ?auto_57875 ?auto_57876 ?auto_57877 ?auto_57878 ?auto_57879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57888 - BLOCK
      ?auto_57889 - BLOCK
      ?auto_57890 - BLOCK
      ?auto_57891 - BLOCK
      ?auto_57892 - BLOCK
      ?auto_57893 - BLOCK
      ?auto_57894 - BLOCK
    )
    :vars
    (
      ?auto_57895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57894 ?auto_57895 ) ( ON-TABLE ?auto_57888 ) ( ON ?auto_57889 ?auto_57888 ) ( ON ?auto_57890 ?auto_57889 ) ( ON ?auto_57891 ?auto_57890 ) ( not ( = ?auto_57888 ?auto_57889 ) ) ( not ( = ?auto_57888 ?auto_57890 ) ) ( not ( = ?auto_57888 ?auto_57891 ) ) ( not ( = ?auto_57888 ?auto_57892 ) ) ( not ( = ?auto_57888 ?auto_57893 ) ) ( not ( = ?auto_57888 ?auto_57894 ) ) ( not ( = ?auto_57888 ?auto_57895 ) ) ( not ( = ?auto_57889 ?auto_57890 ) ) ( not ( = ?auto_57889 ?auto_57891 ) ) ( not ( = ?auto_57889 ?auto_57892 ) ) ( not ( = ?auto_57889 ?auto_57893 ) ) ( not ( = ?auto_57889 ?auto_57894 ) ) ( not ( = ?auto_57889 ?auto_57895 ) ) ( not ( = ?auto_57890 ?auto_57891 ) ) ( not ( = ?auto_57890 ?auto_57892 ) ) ( not ( = ?auto_57890 ?auto_57893 ) ) ( not ( = ?auto_57890 ?auto_57894 ) ) ( not ( = ?auto_57890 ?auto_57895 ) ) ( not ( = ?auto_57891 ?auto_57892 ) ) ( not ( = ?auto_57891 ?auto_57893 ) ) ( not ( = ?auto_57891 ?auto_57894 ) ) ( not ( = ?auto_57891 ?auto_57895 ) ) ( not ( = ?auto_57892 ?auto_57893 ) ) ( not ( = ?auto_57892 ?auto_57894 ) ) ( not ( = ?auto_57892 ?auto_57895 ) ) ( not ( = ?auto_57893 ?auto_57894 ) ) ( not ( = ?auto_57893 ?auto_57895 ) ) ( not ( = ?auto_57894 ?auto_57895 ) ) ( ON ?auto_57893 ?auto_57894 ) ( CLEAR ?auto_57891 ) ( ON ?auto_57892 ?auto_57893 ) ( CLEAR ?auto_57892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57888 ?auto_57889 ?auto_57890 ?auto_57891 ?auto_57892 )
      ( MAKE-7PILE ?auto_57888 ?auto_57889 ?auto_57890 ?auto_57891 ?auto_57892 ?auto_57893 ?auto_57894 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57903 - BLOCK
      ?auto_57904 - BLOCK
      ?auto_57905 - BLOCK
      ?auto_57906 - BLOCK
      ?auto_57907 - BLOCK
      ?auto_57908 - BLOCK
      ?auto_57909 - BLOCK
    )
    :vars
    (
      ?auto_57910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57909 ?auto_57910 ) ( ON-TABLE ?auto_57903 ) ( ON ?auto_57904 ?auto_57903 ) ( ON ?auto_57905 ?auto_57904 ) ( not ( = ?auto_57903 ?auto_57904 ) ) ( not ( = ?auto_57903 ?auto_57905 ) ) ( not ( = ?auto_57903 ?auto_57906 ) ) ( not ( = ?auto_57903 ?auto_57907 ) ) ( not ( = ?auto_57903 ?auto_57908 ) ) ( not ( = ?auto_57903 ?auto_57909 ) ) ( not ( = ?auto_57903 ?auto_57910 ) ) ( not ( = ?auto_57904 ?auto_57905 ) ) ( not ( = ?auto_57904 ?auto_57906 ) ) ( not ( = ?auto_57904 ?auto_57907 ) ) ( not ( = ?auto_57904 ?auto_57908 ) ) ( not ( = ?auto_57904 ?auto_57909 ) ) ( not ( = ?auto_57904 ?auto_57910 ) ) ( not ( = ?auto_57905 ?auto_57906 ) ) ( not ( = ?auto_57905 ?auto_57907 ) ) ( not ( = ?auto_57905 ?auto_57908 ) ) ( not ( = ?auto_57905 ?auto_57909 ) ) ( not ( = ?auto_57905 ?auto_57910 ) ) ( not ( = ?auto_57906 ?auto_57907 ) ) ( not ( = ?auto_57906 ?auto_57908 ) ) ( not ( = ?auto_57906 ?auto_57909 ) ) ( not ( = ?auto_57906 ?auto_57910 ) ) ( not ( = ?auto_57907 ?auto_57908 ) ) ( not ( = ?auto_57907 ?auto_57909 ) ) ( not ( = ?auto_57907 ?auto_57910 ) ) ( not ( = ?auto_57908 ?auto_57909 ) ) ( not ( = ?auto_57908 ?auto_57910 ) ) ( not ( = ?auto_57909 ?auto_57910 ) ) ( ON ?auto_57908 ?auto_57909 ) ( ON ?auto_57907 ?auto_57908 ) ( CLEAR ?auto_57905 ) ( ON ?auto_57906 ?auto_57907 ) ( CLEAR ?auto_57906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57903 ?auto_57904 ?auto_57905 ?auto_57906 )
      ( MAKE-7PILE ?auto_57903 ?auto_57904 ?auto_57905 ?auto_57906 ?auto_57907 ?auto_57908 ?auto_57909 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57918 - BLOCK
      ?auto_57919 - BLOCK
      ?auto_57920 - BLOCK
      ?auto_57921 - BLOCK
      ?auto_57922 - BLOCK
      ?auto_57923 - BLOCK
      ?auto_57924 - BLOCK
    )
    :vars
    (
      ?auto_57925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57924 ?auto_57925 ) ( ON-TABLE ?auto_57918 ) ( ON ?auto_57919 ?auto_57918 ) ( ON ?auto_57920 ?auto_57919 ) ( not ( = ?auto_57918 ?auto_57919 ) ) ( not ( = ?auto_57918 ?auto_57920 ) ) ( not ( = ?auto_57918 ?auto_57921 ) ) ( not ( = ?auto_57918 ?auto_57922 ) ) ( not ( = ?auto_57918 ?auto_57923 ) ) ( not ( = ?auto_57918 ?auto_57924 ) ) ( not ( = ?auto_57918 ?auto_57925 ) ) ( not ( = ?auto_57919 ?auto_57920 ) ) ( not ( = ?auto_57919 ?auto_57921 ) ) ( not ( = ?auto_57919 ?auto_57922 ) ) ( not ( = ?auto_57919 ?auto_57923 ) ) ( not ( = ?auto_57919 ?auto_57924 ) ) ( not ( = ?auto_57919 ?auto_57925 ) ) ( not ( = ?auto_57920 ?auto_57921 ) ) ( not ( = ?auto_57920 ?auto_57922 ) ) ( not ( = ?auto_57920 ?auto_57923 ) ) ( not ( = ?auto_57920 ?auto_57924 ) ) ( not ( = ?auto_57920 ?auto_57925 ) ) ( not ( = ?auto_57921 ?auto_57922 ) ) ( not ( = ?auto_57921 ?auto_57923 ) ) ( not ( = ?auto_57921 ?auto_57924 ) ) ( not ( = ?auto_57921 ?auto_57925 ) ) ( not ( = ?auto_57922 ?auto_57923 ) ) ( not ( = ?auto_57922 ?auto_57924 ) ) ( not ( = ?auto_57922 ?auto_57925 ) ) ( not ( = ?auto_57923 ?auto_57924 ) ) ( not ( = ?auto_57923 ?auto_57925 ) ) ( not ( = ?auto_57924 ?auto_57925 ) ) ( ON ?auto_57923 ?auto_57924 ) ( ON ?auto_57922 ?auto_57923 ) ( CLEAR ?auto_57920 ) ( ON ?auto_57921 ?auto_57922 ) ( CLEAR ?auto_57921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57918 ?auto_57919 ?auto_57920 ?auto_57921 )
      ( MAKE-7PILE ?auto_57918 ?auto_57919 ?auto_57920 ?auto_57921 ?auto_57922 ?auto_57923 ?auto_57924 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57933 - BLOCK
      ?auto_57934 - BLOCK
      ?auto_57935 - BLOCK
      ?auto_57936 - BLOCK
      ?auto_57937 - BLOCK
      ?auto_57938 - BLOCK
      ?auto_57939 - BLOCK
    )
    :vars
    (
      ?auto_57940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57939 ?auto_57940 ) ( ON-TABLE ?auto_57933 ) ( ON ?auto_57934 ?auto_57933 ) ( not ( = ?auto_57933 ?auto_57934 ) ) ( not ( = ?auto_57933 ?auto_57935 ) ) ( not ( = ?auto_57933 ?auto_57936 ) ) ( not ( = ?auto_57933 ?auto_57937 ) ) ( not ( = ?auto_57933 ?auto_57938 ) ) ( not ( = ?auto_57933 ?auto_57939 ) ) ( not ( = ?auto_57933 ?auto_57940 ) ) ( not ( = ?auto_57934 ?auto_57935 ) ) ( not ( = ?auto_57934 ?auto_57936 ) ) ( not ( = ?auto_57934 ?auto_57937 ) ) ( not ( = ?auto_57934 ?auto_57938 ) ) ( not ( = ?auto_57934 ?auto_57939 ) ) ( not ( = ?auto_57934 ?auto_57940 ) ) ( not ( = ?auto_57935 ?auto_57936 ) ) ( not ( = ?auto_57935 ?auto_57937 ) ) ( not ( = ?auto_57935 ?auto_57938 ) ) ( not ( = ?auto_57935 ?auto_57939 ) ) ( not ( = ?auto_57935 ?auto_57940 ) ) ( not ( = ?auto_57936 ?auto_57937 ) ) ( not ( = ?auto_57936 ?auto_57938 ) ) ( not ( = ?auto_57936 ?auto_57939 ) ) ( not ( = ?auto_57936 ?auto_57940 ) ) ( not ( = ?auto_57937 ?auto_57938 ) ) ( not ( = ?auto_57937 ?auto_57939 ) ) ( not ( = ?auto_57937 ?auto_57940 ) ) ( not ( = ?auto_57938 ?auto_57939 ) ) ( not ( = ?auto_57938 ?auto_57940 ) ) ( not ( = ?auto_57939 ?auto_57940 ) ) ( ON ?auto_57938 ?auto_57939 ) ( ON ?auto_57937 ?auto_57938 ) ( ON ?auto_57936 ?auto_57937 ) ( CLEAR ?auto_57934 ) ( ON ?auto_57935 ?auto_57936 ) ( CLEAR ?auto_57935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57933 ?auto_57934 ?auto_57935 )
      ( MAKE-7PILE ?auto_57933 ?auto_57934 ?auto_57935 ?auto_57936 ?auto_57937 ?auto_57938 ?auto_57939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57948 - BLOCK
      ?auto_57949 - BLOCK
      ?auto_57950 - BLOCK
      ?auto_57951 - BLOCK
      ?auto_57952 - BLOCK
      ?auto_57953 - BLOCK
      ?auto_57954 - BLOCK
    )
    :vars
    (
      ?auto_57955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57954 ?auto_57955 ) ( ON-TABLE ?auto_57948 ) ( ON ?auto_57949 ?auto_57948 ) ( not ( = ?auto_57948 ?auto_57949 ) ) ( not ( = ?auto_57948 ?auto_57950 ) ) ( not ( = ?auto_57948 ?auto_57951 ) ) ( not ( = ?auto_57948 ?auto_57952 ) ) ( not ( = ?auto_57948 ?auto_57953 ) ) ( not ( = ?auto_57948 ?auto_57954 ) ) ( not ( = ?auto_57948 ?auto_57955 ) ) ( not ( = ?auto_57949 ?auto_57950 ) ) ( not ( = ?auto_57949 ?auto_57951 ) ) ( not ( = ?auto_57949 ?auto_57952 ) ) ( not ( = ?auto_57949 ?auto_57953 ) ) ( not ( = ?auto_57949 ?auto_57954 ) ) ( not ( = ?auto_57949 ?auto_57955 ) ) ( not ( = ?auto_57950 ?auto_57951 ) ) ( not ( = ?auto_57950 ?auto_57952 ) ) ( not ( = ?auto_57950 ?auto_57953 ) ) ( not ( = ?auto_57950 ?auto_57954 ) ) ( not ( = ?auto_57950 ?auto_57955 ) ) ( not ( = ?auto_57951 ?auto_57952 ) ) ( not ( = ?auto_57951 ?auto_57953 ) ) ( not ( = ?auto_57951 ?auto_57954 ) ) ( not ( = ?auto_57951 ?auto_57955 ) ) ( not ( = ?auto_57952 ?auto_57953 ) ) ( not ( = ?auto_57952 ?auto_57954 ) ) ( not ( = ?auto_57952 ?auto_57955 ) ) ( not ( = ?auto_57953 ?auto_57954 ) ) ( not ( = ?auto_57953 ?auto_57955 ) ) ( not ( = ?auto_57954 ?auto_57955 ) ) ( ON ?auto_57953 ?auto_57954 ) ( ON ?auto_57952 ?auto_57953 ) ( ON ?auto_57951 ?auto_57952 ) ( CLEAR ?auto_57949 ) ( ON ?auto_57950 ?auto_57951 ) ( CLEAR ?auto_57950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57948 ?auto_57949 ?auto_57950 )
      ( MAKE-7PILE ?auto_57948 ?auto_57949 ?auto_57950 ?auto_57951 ?auto_57952 ?auto_57953 ?auto_57954 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57963 - BLOCK
      ?auto_57964 - BLOCK
      ?auto_57965 - BLOCK
      ?auto_57966 - BLOCK
      ?auto_57967 - BLOCK
      ?auto_57968 - BLOCK
      ?auto_57969 - BLOCK
    )
    :vars
    (
      ?auto_57970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57969 ?auto_57970 ) ( ON-TABLE ?auto_57963 ) ( not ( = ?auto_57963 ?auto_57964 ) ) ( not ( = ?auto_57963 ?auto_57965 ) ) ( not ( = ?auto_57963 ?auto_57966 ) ) ( not ( = ?auto_57963 ?auto_57967 ) ) ( not ( = ?auto_57963 ?auto_57968 ) ) ( not ( = ?auto_57963 ?auto_57969 ) ) ( not ( = ?auto_57963 ?auto_57970 ) ) ( not ( = ?auto_57964 ?auto_57965 ) ) ( not ( = ?auto_57964 ?auto_57966 ) ) ( not ( = ?auto_57964 ?auto_57967 ) ) ( not ( = ?auto_57964 ?auto_57968 ) ) ( not ( = ?auto_57964 ?auto_57969 ) ) ( not ( = ?auto_57964 ?auto_57970 ) ) ( not ( = ?auto_57965 ?auto_57966 ) ) ( not ( = ?auto_57965 ?auto_57967 ) ) ( not ( = ?auto_57965 ?auto_57968 ) ) ( not ( = ?auto_57965 ?auto_57969 ) ) ( not ( = ?auto_57965 ?auto_57970 ) ) ( not ( = ?auto_57966 ?auto_57967 ) ) ( not ( = ?auto_57966 ?auto_57968 ) ) ( not ( = ?auto_57966 ?auto_57969 ) ) ( not ( = ?auto_57966 ?auto_57970 ) ) ( not ( = ?auto_57967 ?auto_57968 ) ) ( not ( = ?auto_57967 ?auto_57969 ) ) ( not ( = ?auto_57967 ?auto_57970 ) ) ( not ( = ?auto_57968 ?auto_57969 ) ) ( not ( = ?auto_57968 ?auto_57970 ) ) ( not ( = ?auto_57969 ?auto_57970 ) ) ( ON ?auto_57968 ?auto_57969 ) ( ON ?auto_57967 ?auto_57968 ) ( ON ?auto_57966 ?auto_57967 ) ( ON ?auto_57965 ?auto_57966 ) ( CLEAR ?auto_57963 ) ( ON ?auto_57964 ?auto_57965 ) ( CLEAR ?auto_57964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57963 ?auto_57964 )
      ( MAKE-7PILE ?auto_57963 ?auto_57964 ?auto_57965 ?auto_57966 ?auto_57967 ?auto_57968 ?auto_57969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57978 - BLOCK
      ?auto_57979 - BLOCK
      ?auto_57980 - BLOCK
      ?auto_57981 - BLOCK
      ?auto_57982 - BLOCK
      ?auto_57983 - BLOCK
      ?auto_57984 - BLOCK
    )
    :vars
    (
      ?auto_57985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57984 ?auto_57985 ) ( ON-TABLE ?auto_57978 ) ( not ( = ?auto_57978 ?auto_57979 ) ) ( not ( = ?auto_57978 ?auto_57980 ) ) ( not ( = ?auto_57978 ?auto_57981 ) ) ( not ( = ?auto_57978 ?auto_57982 ) ) ( not ( = ?auto_57978 ?auto_57983 ) ) ( not ( = ?auto_57978 ?auto_57984 ) ) ( not ( = ?auto_57978 ?auto_57985 ) ) ( not ( = ?auto_57979 ?auto_57980 ) ) ( not ( = ?auto_57979 ?auto_57981 ) ) ( not ( = ?auto_57979 ?auto_57982 ) ) ( not ( = ?auto_57979 ?auto_57983 ) ) ( not ( = ?auto_57979 ?auto_57984 ) ) ( not ( = ?auto_57979 ?auto_57985 ) ) ( not ( = ?auto_57980 ?auto_57981 ) ) ( not ( = ?auto_57980 ?auto_57982 ) ) ( not ( = ?auto_57980 ?auto_57983 ) ) ( not ( = ?auto_57980 ?auto_57984 ) ) ( not ( = ?auto_57980 ?auto_57985 ) ) ( not ( = ?auto_57981 ?auto_57982 ) ) ( not ( = ?auto_57981 ?auto_57983 ) ) ( not ( = ?auto_57981 ?auto_57984 ) ) ( not ( = ?auto_57981 ?auto_57985 ) ) ( not ( = ?auto_57982 ?auto_57983 ) ) ( not ( = ?auto_57982 ?auto_57984 ) ) ( not ( = ?auto_57982 ?auto_57985 ) ) ( not ( = ?auto_57983 ?auto_57984 ) ) ( not ( = ?auto_57983 ?auto_57985 ) ) ( not ( = ?auto_57984 ?auto_57985 ) ) ( ON ?auto_57983 ?auto_57984 ) ( ON ?auto_57982 ?auto_57983 ) ( ON ?auto_57981 ?auto_57982 ) ( ON ?auto_57980 ?auto_57981 ) ( CLEAR ?auto_57978 ) ( ON ?auto_57979 ?auto_57980 ) ( CLEAR ?auto_57979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57978 ?auto_57979 )
      ( MAKE-7PILE ?auto_57978 ?auto_57979 ?auto_57980 ?auto_57981 ?auto_57982 ?auto_57983 ?auto_57984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_57993 - BLOCK
      ?auto_57994 - BLOCK
      ?auto_57995 - BLOCK
      ?auto_57996 - BLOCK
      ?auto_57997 - BLOCK
      ?auto_57998 - BLOCK
      ?auto_57999 - BLOCK
    )
    :vars
    (
      ?auto_58000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57999 ?auto_58000 ) ( not ( = ?auto_57993 ?auto_57994 ) ) ( not ( = ?auto_57993 ?auto_57995 ) ) ( not ( = ?auto_57993 ?auto_57996 ) ) ( not ( = ?auto_57993 ?auto_57997 ) ) ( not ( = ?auto_57993 ?auto_57998 ) ) ( not ( = ?auto_57993 ?auto_57999 ) ) ( not ( = ?auto_57993 ?auto_58000 ) ) ( not ( = ?auto_57994 ?auto_57995 ) ) ( not ( = ?auto_57994 ?auto_57996 ) ) ( not ( = ?auto_57994 ?auto_57997 ) ) ( not ( = ?auto_57994 ?auto_57998 ) ) ( not ( = ?auto_57994 ?auto_57999 ) ) ( not ( = ?auto_57994 ?auto_58000 ) ) ( not ( = ?auto_57995 ?auto_57996 ) ) ( not ( = ?auto_57995 ?auto_57997 ) ) ( not ( = ?auto_57995 ?auto_57998 ) ) ( not ( = ?auto_57995 ?auto_57999 ) ) ( not ( = ?auto_57995 ?auto_58000 ) ) ( not ( = ?auto_57996 ?auto_57997 ) ) ( not ( = ?auto_57996 ?auto_57998 ) ) ( not ( = ?auto_57996 ?auto_57999 ) ) ( not ( = ?auto_57996 ?auto_58000 ) ) ( not ( = ?auto_57997 ?auto_57998 ) ) ( not ( = ?auto_57997 ?auto_57999 ) ) ( not ( = ?auto_57997 ?auto_58000 ) ) ( not ( = ?auto_57998 ?auto_57999 ) ) ( not ( = ?auto_57998 ?auto_58000 ) ) ( not ( = ?auto_57999 ?auto_58000 ) ) ( ON ?auto_57998 ?auto_57999 ) ( ON ?auto_57997 ?auto_57998 ) ( ON ?auto_57996 ?auto_57997 ) ( ON ?auto_57995 ?auto_57996 ) ( ON ?auto_57994 ?auto_57995 ) ( ON ?auto_57993 ?auto_57994 ) ( CLEAR ?auto_57993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57993 )
      ( MAKE-7PILE ?auto_57993 ?auto_57994 ?auto_57995 ?auto_57996 ?auto_57997 ?auto_57998 ?auto_57999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_58008 - BLOCK
      ?auto_58009 - BLOCK
      ?auto_58010 - BLOCK
      ?auto_58011 - BLOCK
      ?auto_58012 - BLOCK
      ?auto_58013 - BLOCK
      ?auto_58014 - BLOCK
    )
    :vars
    (
      ?auto_58015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58014 ?auto_58015 ) ( not ( = ?auto_58008 ?auto_58009 ) ) ( not ( = ?auto_58008 ?auto_58010 ) ) ( not ( = ?auto_58008 ?auto_58011 ) ) ( not ( = ?auto_58008 ?auto_58012 ) ) ( not ( = ?auto_58008 ?auto_58013 ) ) ( not ( = ?auto_58008 ?auto_58014 ) ) ( not ( = ?auto_58008 ?auto_58015 ) ) ( not ( = ?auto_58009 ?auto_58010 ) ) ( not ( = ?auto_58009 ?auto_58011 ) ) ( not ( = ?auto_58009 ?auto_58012 ) ) ( not ( = ?auto_58009 ?auto_58013 ) ) ( not ( = ?auto_58009 ?auto_58014 ) ) ( not ( = ?auto_58009 ?auto_58015 ) ) ( not ( = ?auto_58010 ?auto_58011 ) ) ( not ( = ?auto_58010 ?auto_58012 ) ) ( not ( = ?auto_58010 ?auto_58013 ) ) ( not ( = ?auto_58010 ?auto_58014 ) ) ( not ( = ?auto_58010 ?auto_58015 ) ) ( not ( = ?auto_58011 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58013 ) ) ( not ( = ?auto_58011 ?auto_58014 ) ) ( not ( = ?auto_58011 ?auto_58015 ) ) ( not ( = ?auto_58012 ?auto_58013 ) ) ( not ( = ?auto_58012 ?auto_58014 ) ) ( not ( = ?auto_58012 ?auto_58015 ) ) ( not ( = ?auto_58013 ?auto_58014 ) ) ( not ( = ?auto_58013 ?auto_58015 ) ) ( not ( = ?auto_58014 ?auto_58015 ) ) ( ON ?auto_58013 ?auto_58014 ) ( ON ?auto_58012 ?auto_58013 ) ( ON ?auto_58011 ?auto_58012 ) ( ON ?auto_58010 ?auto_58011 ) ( ON ?auto_58009 ?auto_58010 ) ( ON ?auto_58008 ?auto_58009 ) ( CLEAR ?auto_58008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58008 )
      ( MAKE-7PILE ?auto_58008 ?auto_58009 ?auto_58010 ?auto_58011 ?auto_58012 ?auto_58013 ?auto_58014 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58024 - BLOCK
      ?auto_58025 - BLOCK
      ?auto_58026 - BLOCK
      ?auto_58027 - BLOCK
      ?auto_58028 - BLOCK
      ?auto_58029 - BLOCK
      ?auto_58030 - BLOCK
      ?auto_58031 - BLOCK
    )
    :vars
    (
      ?auto_58032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58030 ) ( ON ?auto_58031 ?auto_58032 ) ( CLEAR ?auto_58031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58024 ) ( ON ?auto_58025 ?auto_58024 ) ( ON ?auto_58026 ?auto_58025 ) ( ON ?auto_58027 ?auto_58026 ) ( ON ?auto_58028 ?auto_58027 ) ( ON ?auto_58029 ?auto_58028 ) ( ON ?auto_58030 ?auto_58029 ) ( not ( = ?auto_58024 ?auto_58025 ) ) ( not ( = ?auto_58024 ?auto_58026 ) ) ( not ( = ?auto_58024 ?auto_58027 ) ) ( not ( = ?auto_58024 ?auto_58028 ) ) ( not ( = ?auto_58024 ?auto_58029 ) ) ( not ( = ?auto_58024 ?auto_58030 ) ) ( not ( = ?auto_58024 ?auto_58031 ) ) ( not ( = ?auto_58024 ?auto_58032 ) ) ( not ( = ?auto_58025 ?auto_58026 ) ) ( not ( = ?auto_58025 ?auto_58027 ) ) ( not ( = ?auto_58025 ?auto_58028 ) ) ( not ( = ?auto_58025 ?auto_58029 ) ) ( not ( = ?auto_58025 ?auto_58030 ) ) ( not ( = ?auto_58025 ?auto_58031 ) ) ( not ( = ?auto_58025 ?auto_58032 ) ) ( not ( = ?auto_58026 ?auto_58027 ) ) ( not ( = ?auto_58026 ?auto_58028 ) ) ( not ( = ?auto_58026 ?auto_58029 ) ) ( not ( = ?auto_58026 ?auto_58030 ) ) ( not ( = ?auto_58026 ?auto_58031 ) ) ( not ( = ?auto_58026 ?auto_58032 ) ) ( not ( = ?auto_58027 ?auto_58028 ) ) ( not ( = ?auto_58027 ?auto_58029 ) ) ( not ( = ?auto_58027 ?auto_58030 ) ) ( not ( = ?auto_58027 ?auto_58031 ) ) ( not ( = ?auto_58027 ?auto_58032 ) ) ( not ( = ?auto_58028 ?auto_58029 ) ) ( not ( = ?auto_58028 ?auto_58030 ) ) ( not ( = ?auto_58028 ?auto_58031 ) ) ( not ( = ?auto_58028 ?auto_58032 ) ) ( not ( = ?auto_58029 ?auto_58030 ) ) ( not ( = ?auto_58029 ?auto_58031 ) ) ( not ( = ?auto_58029 ?auto_58032 ) ) ( not ( = ?auto_58030 ?auto_58031 ) ) ( not ( = ?auto_58030 ?auto_58032 ) ) ( not ( = ?auto_58031 ?auto_58032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58031 ?auto_58032 )
      ( !STACK ?auto_58031 ?auto_58030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58041 - BLOCK
      ?auto_58042 - BLOCK
      ?auto_58043 - BLOCK
      ?auto_58044 - BLOCK
      ?auto_58045 - BLOCK
      ?auto_58046 - BLOCK
      ?auto_58047 - BLOCK
      ?auto_58048 - BLOCK
    )
    :vars
    (
      ?auto_58049 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58047 ) ( ON ?auto_58048 ?auto_58049 ) ( CLEAR ?auto_58048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58041 ) ( ON ?auto_58042 ?auto_58041 ) ( ON ?auto_58043 ?auto_58042 ) ( ON ?auto_58044 ?auto_58043 ) ( ON ?auto_58045 ?auto_58044 ) ( ON ?auto_58046 ?auto_58045 ) ( ON ?auto_58047 ?auto_58046 ) ( not ( = ?auto_58041 ?auto_58042 ) ) ( not ( = ?auto_58041 ?auto_58043 ) ) ( not ( = ?auto_58041 ?auto_58044 ) ) ( not ( = ?auto_58041 ?auto_58045 ) ) ( not ( = ?auto_58041 ?auto_58046 ) ) ( not ( = ?auto_58041 ?auto_58047 ) ) ( not ( = ?auto_58041 ?auto_58048 ) ) ( not ( = ?auto_58041 ?auto_58049 ) ) ( not ( = ?auto_58042 ?auto_58043 ) ) ( not ( = ?auto_58042 ?auto_58044 ) ) ( not ( = ?auto_58042 ?auto_58045 ) ) ( not ( = ?auto_58042 ?auto_58046 ) ) ( not ( = ?auto_58042 ?auto_58047 ) ) ( not ( = ?auto_58042 ?auto_58048 ) ) ( not ( = ?auto_58042 ?auto_58049 ) ) ( not ( = ?auto_58043 ?auto_58044 ) ) ( not ( = ?auto_58043 ?auto_58045 ) ) ( not ( = ?auto_58043 ?auto_58046 ) ) ( not ( = ?auto_58043 ?auto_58047 ) ) ( not ( = ?auto_58043 ?auto_58048 ) ) ( not ( = ?auto_58043 ?auto_58049 ) ) ( not ( = ?auto_58044 ?auto_58045 ) ) ( not ( = ?auto_58044 ?auto_58046 ) ) ( not ( = ?auto_58044 ?auto_58047 ) ) ( not ( = ?auto_58044 ?auto_58048 ) ) ( not ( = ?auto_58044 ?auto_58049 ) ) ( not ( = ?auto_58045 ?auto_58046 ) ) ( not ( = ?auto_58045 ?auto_58047 ) ) ( not ( = ?auto_58045 ?auto_58048 ) ) ( not ( = ?auto_58045 ?auto_58049 ) ) ( not ( = ?auto_58046 ?auto_58047 ) ) ( not ( = ?auto_58046 ?auto_58048 ) ) ( not ( = ?auto_58046 ?auto_58049 ) ) ( not ( = ?auto_58047 ?auto_58048 ) ) ( not ( = ?auto_58047 ?auto_58049 ) ) ( not ( = ?auto_58048 ?auto_58049 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58048 ?auto_58049 )
      ( !STACK ?auto_58048 ?auto_58047 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58058 - BLOCK
      ?auto_58059 - BLOCK
      ?auto_58060 - BLOCK
      ?auto_58061 - BLOCK
      ?auto_58062 - BLOCK
      ?auto_58063 - BLOCK
      ?auto_58064 - BLOCK
      ?auto_58065 - BLOCK
    )
    :vars
    (
      ?auto_58066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58065 ?auto_58066 ) ( ON-TABLE ?auto_58058 ) ( ON ?auto_58059 ?auto_58058 ) ( ON ?auto_58060 ?auto_58059 ) ( ON ?auto_58061 ?auto_58060 ) ( ON ?auto_58062 ?auto_58061 ) ( ON ?auto_58063 ?auto_58062 ) ( not ( = ?auto_58058 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( not ( = ?auto_58058 ?auto_58061 ) ) ( not ( = ?auto_58058 ?auto_58062 ) ) ( not ( = ?auto_58058 ?auto_58063 ) ) ( not ( = ?auto_58058 ?auto_58064 ) ) ( not ( = ?auto_58058 ?auto_58065 ) ) ( not ( = ?auto_58058 ?auto_58066 ) ) ( not ( = ?auto_58059 ?auto_58060 ) ) ( not ( = ?auto_58059 ?auto_58061 ) ) ( not ( = ?auto_58059 ?auto_58062 ) ) ( not ( = ?auto_58059 ?auto_58063 ) ) ( not ( = ?auto_58059 ?auto_58064 ) ) ( not ( = ?auto_58059 ?auto_58065 ) ) ( not ( = ?auto_58059 ?auto_58066 ) ) ( not ( = ?auto_58060 ?auto_58061 ) ) ( not ( = ?auto_58060 ?auto_58062 ) ) ( not ( = ?auto_58060 ?auto_58063 ) ) ( not ( = ?auto_58060 ?auto_58064 ) ) ( not ( = ?auto_58060 ?auto_58065 ) ) ( not ( = ?auto_58060 ?auto_58066 ) ) ( not ( = ?auto_58061 ?auto_58062 ) ) ( not ( = ?auto_58061 ?auto_58063 ) ) ( not ( = ?auto_58061 ?auto_58064 ) ) ( not ( = ?auto_58061 ?auto_58065 ) ) ( not ( = ?auto_58061 ?auto_58066 ) ) ( not ( = ?auto_58062 ?auto_58063 ) ) ( not ( = ?auto_58062 ?auto_58064 ) ) ( not ( = ?auto_58062 ?auto_58065 ) ) ( not ( = ?auto_58062 ?auto_58066 ) ) ( not ( = ?auto_58063 ?auto_58064 ) ) ( not ( = ?auto_58063 ?auto_58065 ) ) ( not ( = ?auto_58063 ?auto_58066 ) ) ( not ( = ?auto_58064 ?auto_58065 ) ) ( not ( = ?auto_58064 ?auto_58066 ) ) ( not ( = ?auto_58065 ?auto_58066 ) ) ( CLEAR ?auto_58063 ) ( ON ?auto_58064 ?auto_58065 ) ( CLEAR ?auto_58064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_58058 ?auto_58059 ?auto_58060 ?auto_58061 ?auto_58062 ?auto_58063 ?auto_58064 )
      ( MAKE-8PILE ?auto_58058 ?auto_58059 ?auto_58060 ?auto_58061 ?auto_58062 ?auto_58063 ?auto_58064 ?auto_58065 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58075 - BLOCK
      ?auto_58076 - BLOCK
      ?auto_58077 - BLOCK
      ?auto_58078 - BLOCK
      ?auto_58079 - BLOCK
      ?auto_58080 - BLOCK
      ?auto_58081 - BLOCK
      ?auto_58082 - BLOCK
    )
    :vars
    (
      ?auto_58083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58082 ?auto_58083 ) ( ON-TABLE ?auto_58075 ) ( ON ?auto_58076 ?auto_58075 ) ( ON ?auto_58077 ?auto_58076 ) ( ON ?auto_58078 ?auto_58077 ) ( ON ?auto_58079 ?auto_58078 ) ( ON ?auto_58080 ?auto_58079 ) ( not ( = ?auto_58075 ?auto_58076 ) ) ( not ( = ?auto_58075 ?auto_58077 ) ) ( not ( = ?auto_58075 ?auto_58078 ) ) ( not ( = ?auto_58075 ?auto_58079 ) ) ( not ( = ?auto_58075 ?auto_58080 ) ) ( not ( = ?auto_58075 ?auto_58081 ) ) ( not ( = ?auto_58075 ?auto_58082 ) ) ( not ( = ?auto_58075 ?auto_58083 ) ) ( not ( = ?auto_58076 ?auto_58077 ) ) ( not ( = ?auto_58076 ?auto_58078 ) ) ( not ( = ?auto_58076 ?auto_58079 ) ) ( not ( = ?auto_58076 ?auto_58080 ) ) ( not ( = ?auto_58076 ?auto_58081 ) ) ( not ( = ?auto_58076 ?auto_58082 ) ) ( not ( = ?auto_58076 ?auto_58083 ) ) ( not ( = ?auto_58077 ?auto_58078 ) ) ( not ( = ?auto_58077 ?auto_58079 ) ) ( not ( = ?auto_58077 ?auto_58080 ) ) ( not ( = ?auto_58077 ?auto_58081 ) ) ( not ( = ?auto_58077 ?auto_58082 ) ) ( not ( = ?auto_58077 ?auto_58083 ) ) ( not ( = ?auto_58078 ?auto_58079 ) ) ( not ( = ?auto_58078 ?auto_58080 ) ) ( not ( = ?auto_58078 ?auto_58081 ) ) ( not ( = ?auto_58078 ?auto_58082 ) ) ( not ( = ?auto_58078 ?auto_58083 ) ) ( not ( = ?auto_58079 ?auto_58080 ) ) ( not ( = ?auto_58079 ?auto_58081 ) ) ( not ( = ?auto_58079 ?auto_58082 ) ) ( not ( = ?auto_58079 ?auto_58083 ) ) ( not ( = ?auto_58080 ?auto_58081 ) ) ( not ( = ?auto_58080 ?auto_58082 ) ) ( not ( = ?auto_58080 ?auto_58083 ) ) ( not ( = ?auto_58081 ?auto_58082 ) ) ( not ( = ?auto_58081 ?auto_58083 ) ) ( not ( = ?auto_58082 ?auto_58083 ) ) ( CLEAR ?auto_58080 ) ( ON ?auto_58081 ?auto_58082 ) ( CLEAR ?auto_58081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_58075 ?auto_58076 ?auto_58077 ?auto_58078 ?auto_58079 ?auto_58080 ?auto_58081 )
      ( MAKE-8PILE ?auto_58075 ?auto_58076 ?auto_58077 ?auto_58078 ?auto_58079 ?auto_58080 ?auto_58081 ?auto_58082 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58092 - BLOCK
      ?auto_58093 - BLOCK
      ?auto_58094 - BLOCK
      ?auto_58095 - BLOCK
      ?auto_58096 - BLOCK
      ?auto_58097 - BLOCK
      ?auto_58098 - BLOCK
      ?auto_58099 - BLOCK
    )
    :vars
    (
      ?auto_58100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58099 ?auto_58100 ) ( ON-TABLE ?auto_58092 ) ( ON ?auto_58093 ?auto_58092 ) ( ON ?auto_58094 ?auto_58093 ) ( ON ?auto_58095 ?auto_58094 ) ( ON ?auto_58096 ?auto_58095 ) ( not ( = ?auto_58092 ?auto_58093 ) ) ( not ( = ?auto_58092 ?auto_58094 ) ) ( not ( = ?auto_58092 ?auto_58095 ) ) ( not ( = ?auto_58092 ?auto_58096 ) ) ( not ( = ?auto_58092 ?auto_58097 ) ) ( not ( = ?auto_58092 ?auto_58098 ) ) ( not ( = ?auto_58092 ?auto_58099 ) ) ( not ( = ?auto_58092 ?auto_58100 ) ) ( not ( = ?auto_58093 ?auto_58094 ) ) ( not ( = ?auto_58093 ?auto_58095 ) ) ( not ( = ?auto_58093 ?auto_58096 ) ) ( not ( = ?auto_58093 ?auto_58097 ) ) ( not ( = ?auto_58093 ?auto_58098 ) ) ( not ( = ?auto_58093 ?auto_58099 ) ) ( not ( = ?auto_58093 ?auto_58100 ) ) ( not ( = ?auto_58094 ?auto_58095 ) ) ( not ( = ?auto_58094 ?auto_58096 ) ) ( not ( = ?auto_58094 ?auto_58097 ) ) ( not ( = ?auto_58094 ?auto_58098 ) ) ( not ( = ?auto_58094 ?auto_58099 ) ) ( not ( = ?auto_58094 ?auto_58100 ) ) ( not ( = ?auto_58095 ?auto_58096 ) ) ( not ( = ?auto_58095 ?auto_58097 ) ) ( not ( = ?auto_58095 ?auto_58098 ) ) ( not ( = ?auto_58095 ?auto_58099 ) ) ( not ( = ?auto_58095 ?auto_58100 ) ) ( not ( = ?auto_58096 ?auto_58097 ) ) ( not ( = ?auto_58096 ?auto_58098 ) ) ( not ( = ?auto_58096 ?auto_58099 ) ) ( not ( = ?auto_58096 ?auto_58100 ) ) ( not ( = ?auto_58097 ?auto_58098 ) ) ( not ( = ?auto_58097 ?auto_58099 ) ) ( not ( = ?auto_58097 ?auto_58100 ) ) ( not ( = ?auto_58098 ?auto_58099 ) ) ( not ( = ?auto_58098 ?auto_58100 ) ) ( not ( = ?auto_58099 ?auto_58100 ) ) ( ON ?auto_58098 ?auto_58099 ) ( CLEAR ?auto_58096 ) ( ON ?auto_58097 ?auto_58098 ) ( CLEAR ?auto_58097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58092 ?auto_58093 ?auto_58094 ?auto_58095 ?auto_58096 ?auto_58097 )
      ( MAKE-8PILE ?auto_58092 ?auto_58093 ?auto_58094 ?auto_58095 ?auto_58096 ?auto_58097 ?auto_58098 ?auto_58099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58109 - BLOCK
      ?auto_58110 - BLOCK
      ?auto_58111 - BLOCK
      ?auto_58112 - BLOCK
      ?auto_58113 - BLOCK
      ?auto_58114 - BLOCK
      ?auto_58115 - BLOCK
      ?auto_58116 - BLOCK
    )
    :vars
    (
      ?auto_58117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58116 ?auto_58117 ) ( ON-TABLE ?auto_58109 ) ( ON ?auto_58110 ?auto_58109 ) ( ON ?auto_58111 ?auto_58110 ) ( ON ?auto_58112 ?auto_58111 ) ( ON ?auto_58113 ?auto_58112 ) ( not ( = ?auto_58109 ?auto_58110 ) ) ( not ( = ?auto_58109 ?auto_58111 ) ) ( not ( = ?auto_58109 ?auto_58112 ) ) ( not ( = ?auto_58109 ?auto_58113 ) ) ( not ( = ?auto_58109 ?auto_58114 ) ) ( not ( = ?auto_58109 ?auto_58115 ) ) ( not ( = ?auto_58109 ?auto_58116 ) ) ( not ( = ?auto_58109 ?auto_58117 ) ) ( not ( = ?auto_58110 ?auto_58111 ) ) ( not ( = ?auto_58110 ?auto_58112 ) ) ( not ( = ?auto_58110 ?auto_58113 ) ) ( not ( = ?auto_58110 ?auto_58114 ) ) ( not ( = ?auto_58110 ?auto_58115 ) ) ( not ( = ?auto_58110 ?auto_58116 ) ) ( not ( = ?auto_58110 ?auto_58117 ) ) ( not ( = ?auto_58111 ?auto_58112 ) ) ( not ( = ?auto_58111 ?auto_58113 ) ) ( not ( = ?auto_58111 ?auto_58114 ) ) ( not ( = ?auto_58111 ?auto_58115 ) ) ( not ( = ?auto_58111 ?auto_58116 ) ) ( not ( = ?auto_58111 ?auto_58117 ) ) ( not ( = ?auto_58112 ?auto_58113 ) ) ( not ( = ?auto_58112 ?auto_58114 ) ) ( not ( = ?auto_58112 ?auto_58115 ) ) ( not ( = ?auto_58112 ?auto_58116 ) ) ( not ( = ?auto_58112 ?auto_58117 ) ) ( not ( = ?auto_58113 ?auto_58114 ) ) ( not ( = ?auto_58113 ?auto_58115 ) ) ( not ( = ?auto_58113 ?auto_58116 ) ) ( not ( = ?auto_58113 ?auto_58117 ) ) ( not ( = ?auto_58114 ?auto_58115 ) ) ( not ( = ?auto_58114 ?auto_58116 ) ) ( not ( = ?auto_58114 ?auto_58117 ) ) ( not ( = ?auto_58115 ?auto_58116 ) ) ( not ( = ?auto_58115 ?auto_58117 ) ) ( not ( = ?auto_58116 ?auto_58117 ) ) ( ON ?auto_58115 ?auto_58116 ) ( CLEAR ?auto_58113 ) ( ON ?auto_58114 ?auto_58115 ) ( CLEAR ?auto_58114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58109 ?auto_58110 ?auto_58111 ?auto_58112 ?auto_58113 ?auto_58114 )
      ( MAKE-8PILE ?auto_58109 ?auto_58110 ?auto_58111 ?auto_58112 ?auto_58113 ?auto_58114 ?auto_58115 ?auto_58116 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58126 - BLOCK
      ?auto_58127 - BLOCK
      ?auto_58128 - BLOCK
      ?auto_58129 - BLOCK
      ?auto_58130 - BLOCK
      ?auto_58131 - BLOCK
      ?auto_58132 - BLOCK
      ?auto_58133 - BLOCK
    )
    :vars
    (
      ?auto_58134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58133 ?auto_58134 ) ( ON-TABLE ?auto_58126 ) ( ON ?auto_58127 ?auto_58126 ) ( ON ?auto_58128 ?auto_58127 ) ( ON ?auto_58129 ?auto_58128 ) ( not ( = ?auto_58126 ?auto_58127 ) ) ( not ( = ?auto_58126 ?auto_58128 ) ) ( not ( = ?auto_58126 ?auto_58129 ) ) ( not ( = ?auto_58126 ?auto_58130 ) ) ( not ( = ?auto_58126 ?auto_58131 ) ) ( not ( = ?auto_58126 ?auto_58132 ) ) ( not ( = ?auto_58126 ?auto_58133 ) ) ( not ( = ?auto_58126 ?auto_58134 ) ) ( not ( = ?auto_58127 ?auto_58128 ) ) ( not ( = ?auto_58127 ?auto_58129 ) ) ( not ( = ?auto_58127 ?auto_58130 ) ) ( not ( = ?auto_58127 ?auto_58131 ) ) ( not ( = ?auto_58127 ?auto_58132 ) ) ( not ( = ?auto_58127 ?auto_58133 ) ) ( not ( = ?auto_58127 ?auto_58134 ) ) ( not ( = ?auto_58128 ?auto_58129 ) ) ( not ( = ?auto_58128 ?auto_58130 ) ) ( not ( = ?auto_58128 ?auto_58131 ) ) ( not ( = ?auto_58128 ?auto_58132 ) ) ( not ( = ?auto_58128 ?auto_58133 ) ) ( not ( = ?auto_58128 ?auto_58134 ) ) ( not ( = ?auto_58129 ?auto_58130 ) ) ( not ( = ?auto_58129 ?auto_58131 ) ) ( not ( = ?auto_58129 ?auto_58132 ) ) ( not ( = ?auto_58129 ?auto_58133 ) ) ( not ( = ?auto_58129 ?auto_58134 ) ) ( not ( = ?auto_58130 ?auto_58131 ) ) ( not ( = ?auto_58130 ?auto_58132 ) ) ( not ( = ?auto_58130 ?auto_58133 ) ) ( not ( = ?auto_58130 ?auto_58134 ) ) ( not ( = ?auto_58131 ?auto_58132 ) ) ( not ( = ?auto_58131 ?auto_58133 ) ) ( not ( = ?auto_58131 ?auto_58134 ) ) ( not ( = ?auto_58132 ?auto_58133 ) ) ( not ( = ?auto_58132 ?auto_58134 ) ) ( not ( = ?auto_58133 ?auto_58134 ) ) ( ON ?auto_58132 ?auto_58133 ) ( ON ?auto_58131 ?auto_58132 ) ( CLEAR ?auto_58129 ) ( ON ?auto_58130 ?auto_58131 ) ( CLEAR ?auto_58130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58126 ?auto_58127 ?auto_58128 ?auto_58129 ?auto_58130 )
      ( MAKE-8PILE ?auto_58126 ?auto_58127 ?auto_58128 ?auto_58129 ?auto_58130 ?auto_58131 ?auto_58132 ?auto_58133 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58143 - BLOCK
      ?auto_58144 - BLOCK
      ?auto_58145 - BLOCK
      ?auto_58146 - BLOCK
      ?auto_58147 - BLOCK
      ?auto_58148 - BLOCK
      ?auto_58149 - BLOCK
      ?auto_58150 - BLOCK
    )
    :vars
    (
      ?auto_58151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58150 ?auto_58151 ) ( ON-TABLE ?auto_58143 ) ( ON ?auto_58144 ?auto_58143 ) ( ON ?auto_58145 ?auto_58144 ) ( ON ?auto_58146 ?auto_58145 ) ( not ( = ?auto_58143 ?auto_58144 ) ) ( not ( = ?auto_58143 ?auto_58145 ) ) ( not ( = ?auto_58143 ?auto_58146 ) ) ( not ( = ?auto_58143 ?auto_58147 ) ) ( not ( = ?auto_58143 ?auto_58148 ) ) ( not ( = ?auto_58143 ?auto_58149 ) ) ( not ( = ?auto_58143 ?auto_58150 ) ) ( not ( = ?auto_58143 ?auto_58151 ) ) ( not ( = ?auto_58144 ?auto_58145 ) ) ( not ( = ?auto_58144 ?auto_58146 ) ) ( not ( = ?auto_58144 ?auto_58147 ) ) ( not ( = ?auto_58144 ?auto_58148 ) ) ( not ( = ?auto_58144 ?auto_58149 ) ) ( not ( = ?auto_58144 ?auto_58150 ) ) ( not ( = ?auto_58144 ?auto_58151 ) ) ( not ( = ?auto_58145 ?auto_58146 ) ) ( not ( = ?auto_58145 ?auto_58147 ) ) ( not ( = ?auto_58145 ?auto_58148 ) ) ( not ( = ?auto_58145 ?auto_58149 ) ) ( not ( = ?auto_58145 ?auto_58150 ) ) ( not ( = ?auto_58145 ?auto_58151 ) ) ( not ( = ?auto_58146 ?auto_58147 ) ) ( not ( = ?auto_58146 ?auto_58148 ) ) ( not ( = ?auto_58146 ?auto_58149 ) ) ( not ( = ?auto_58146 ?auto_58150 ) ) ( not ( = ?auto_58146 ?auto_58151 ) ) ( not ( = ?auto_58147 ?auto_58148 ) ) ( not ( = ?auto_58147 ?auto_58149 ) ) ( not ( = ?auto_58147 ?auto_58150 ) ) ( not ( = ?auto_58147 ?auto_58151 ) ) ( not ( = ?auto_58148 ?auto_58149 ) ) ( not ( = ?auto_58148 ?auto_58150 ) ) ( not ( = ?auto_58148 ?auto_58151 ) ) ( not ( = ?auto_58149 ?auto_58150 ) ) ( not ( = ?auto_58149 ?auto_58151 ) ) ( not ( = ?auto_58150 ?auto_58151 ) ) ( ON ?auto_58149 ?auto_58150 ) ( ON ?auto_58148 ?auto_58149 ) ( CLEAR ?auto_58146 ) ( ON ?auto_58147 ?auto_58148 ) ( CLEAR ?auto_58147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58143 ?auto_58144 ?auto_58145 ?auto_58146 ?auto_58147 )
      ( MAKE-8PILE ?auto_58143 ?auto_58144 ?auto_58145 ?auto_58146 ?auto_58147 ?auto_58148 ?auto_58149 ?auto_58150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58160 - BLOCK
      ?auto_58161 - BLOCK
      ?auto_58162 - BLOCK
      ?auto_58163 - BLOCK
      ?auto_58164 - BLOCK
      ?auto_58165 - BLOCK
      ?auto_58166 - BLOCK
      ?auto_58167 - BLOCK
    )
    :vars
    (
      ?auto_58168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58167 ?auto_58168 ) ( ON-TABLE ?auto_58160 ) ( ON ?auto_58161 ?auto_58160 ) ( ON ?auto_58162 ?auto_58161 ) ( not ( = ?auto_58160 ?auto_58161 ) ) ( not ( = ?auto_58160 ?auto_58162 ) ) ( not ( = ?auto_58160 ?auto_58163 ) ) ( not ( = ?auto_58160 ?auto_58164 ) ) ( not ( = ?auto_58160 ?auto_58165 ) ) ( not ( = ?auto_58160 ?auto_58166 ) ) ( not ( = ?auto_58160 ?auto_58167 ) ) ( not ( = ?auto_58160 ?auto_58168 ) ) ( not ( = ?auto_58161 ?auto_58162 ) ) ( not ( = ?auto_58161 ?auto_58163 ) ) ( not ( = ?auto_58161 ?auto_58164 ) ) ( not ( = ?auto_58161 ?auto_58165 ) ) ( not ( = ?auto_58161 ?auto_58166 ) ) ( not ( = ?auto_58161 ?auto_58167 ) ) ( not ( = ?auto_58161 ?auto_58168 ) ) ( not ( = ?auto_58162 ?auto_58163 ) ) ( not ( = ?auto_58162 ?auto_58164 ) ) ( not ( = ?auto_58162 ?auto_58165 ) ) ( not ( = ?auto_58162 ?auto_58166 ) ) ( not ( = ?auto_58162 ?auto_58167 ) ) ( not ( = ?auto_58162 ?auto_58168 ) ) ( not ( = ?auto_58163 ?auto_58164 ) ) ( not ( = ?auto_58163 ?auto_58165 ) ) ( not ( = ?auto_58163 ?auto_58166 ) ) ( not ( = ?auto_58163 ?auto_58167 ) ) ( not ( = ?auto_58163 ?auto_58168 ) ) ( not ( = ?auto_58164 ?auto_58165 ) ) ( not ( = ?auto_58164 ?auto_58166 ) ) ( not ( = ?auto_58164 ?auto_58167 ) ) ( not ( = ?auto_58164 ?auto_58168 ) ) ( not ( = ?auto_58165 ?auto_58166 ) ) ( not ( = ?auto_58165 ?auto_58167 ) ) ( not ( = ?auto_58165 ?auto_58168 ) ) ( not ( = ?auto_58166 ?auto_58167 ) ) ( not ( = ?auto_58166 ?auto_58168 ) ) ( not ( = ?auto_58167 ?auto_58168 ) ) ( ON ?auto_58166 ?auto_58167 ) ( ON ?auto_58165 ?auto_58166 ) ( ON ?auto_58164 ?auto_58165 ) ( CLEAR ?auto_58162 ) ( ON ?auto_58163 ?auto_58164 ) ( CLEAR ?auto_58163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58160 ?auto_58161 ?auto_58162 ?auto_58163 )
      ( MAKE-8PILE ?auto_58160 ?auto_58161 ?auto_58162 ?auto_58163 ?auto_58164 ?auto_58165 ?auto_58166 ?auto_58167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58177 - BLOCK
      ?auto_58178 - BLOCK
      ?auto_58179 - BLOCK
      ?auto_58180 - BLOCK
      ?auto_58181 - BLOCK
      ?auto_58182 - BLOCK
      ?auto_58183 - BLOCK
      ?auto_58184 - BLOCK
    )
    :vars
    (
      ?auto_58185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58184 ?auto_58185 ) ( ON-TABLE ?auto_58177 ) ( ON ?auto_58178 ?auto_58177 ) ( ON ?auto_58179 ?auto_58178 ) ( not ( = ?auto_58177 ?auto_58178 ) ) ( not ( = ?auto_58177 ?auto_58179 ) ) ( not ( = ?auto_58177 ?auto_58180 ) ) ( not ( = ?auto_58177 ?auto_58181 ) ) ( not ( = ?auto_58177 ?auto_58182 ) ) ( not ( = ?auto_58177 ?auto_58183 ) ) ( not ( = ?auto_58177 ?auto_58184 ) ) ( not ( = ?auto_58177 ?auto_58185 ) ) ( not ( = ?auto_58178 ?auto_58179 ) ) ( not ( = ?auto_58178 ?auto_58180 ) ) ( not ( = ?auto_58178 ?auto_58181 ) ) ( not ( = ?auto_58178 ?auto_58182 ) ) ( not ( = ?auto_58178 ?auto_58183 ) ) ( not ( = ?auto_58178 ?auto_58184 ) ) ( not ( = ?auto_58178 ?auto_58185 ) ) ( not ( = ?auto_58179 ?auto_58180 ) ) ( not ( = ?auto_58179 ?auto_58181 ) ) ( not ( = ?auto_58179 ?auto_58182 ) ) ( not ( = ?auto_58179 ?auto_58183 ) ) ( not ( = ?auto_58179 ?auto_58184 ) ) ( not ( = ?auto_58179 ?auto_58185 ) ) ( not ( = ?auto_58180 ?auto_58181 ) ) ( not ( = ?auto_58180 ?auto_58182 ) ) ( not ( = ?auto_58180 ?auto_58183 ) ) ( not ( = ?auto_58180 ?auto_58184 ) ) ( not ( = ?auto_58180 ?auto_58185 ) ) ( not ( = ?auto_58181 ?auto_58182 ) ) ( not ( = ?auto_58181 ?auto_58183 ) ) ( not ( = ?auto_58181 ?auto_58184 ) ) ( not ( = ?auto_58181 ?auto_58185 ) ) ( not ( = ?auto_58182 ?auto_58183 ) ) ( not ( = ?auto_58182 ?auto_58184 ) ) ( not ( = ?auto_58182 ?auto_58185 ) ) ( not ( = ?auto_58183 ?auto_58184 ) ) ( not ( = ?auto_58183 ?auto_58185 ) ) ( not ( = ?auto_58184 ?auto_58185 ) ) ( ON ?auto_58183 ?auto_58184 ) ( ON ?auto_58182 ?auto_58183 ) ( ON ?auto_58181 ?auto_58182 ) ( CLEAR ?auto_58179 ) ( ON ?auto_58180 ?auto_58181 ) ( CLEAR ?auto_58180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58177 ?auto_58178 ?auto_58179 ?auto_58180 )
      ( MAKE-8PILE ?auto_58177 ?auto_58178 ?auto_58179 ?auto_58180 ?auto_58181 ?auto_58182 ?auto_58183 ?auto_58184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58194 - BLOCK
      ?auto_58195 - BLOCK
      ?auto_58196 - BLOCK
      ?auto_58197 - BLOCK
      ?auto_58198 - BLOCK
      ?auto_58199 - BLOCK
      ?auto_58200 - BLOCK
      ?auto_58201 - BLOCK
    )
    :vars
    (
      ?auto_58202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58201 ?auto_58202 ) ( ON-TABLE ?auto_58194 ) ( ON ?auto_58195 ?auto_58194 ) ( not ( = ?auto_58194 ?auto_58195 ) ) ( not ( = ?auto_58194 ?auto_58196 ) ) ( not ( = ?auto_58194 ?auto_58197 ) ) ( not ( = ?auto_58194 ?auto_58198 ) ) ( not ( = ?auto_58194 ?auto_58199 ) ) ( not ( = ?auto_58194 ?auto_58200 ) ) ( not ( = ?auto_58194 ?auto_58201 ) ) ( not ( = ?auto_58194 ?auto_58202 ) ) ( not ( = ?auto_58195 ?auto_58196 ) ) ( not ( = ?auto_58195 ?auto_58197 ) ) ( not ( = ?auto_58195 ?auto_58198 ) ) ( not ( = ?auto_58195 ?auto_58199 ) ) ( not ( = ?auto_58195 ?auto_58200 ) ) ( not ( = ?auto_58195 ?auto_58201 ) ) ( not ( = ?auto_58195 ?auto_58202 ) ) ( not ( = ?auto_58196 ?auto_58197 ) ) ( not ( = ?auto_58196 ?auto_58198 ) ) ( not ( = ?auto_58196 ?auto_58199 ) ) ( not ( = ?auto_58196 ?auto_58200 ) ) ( not ( = ?auto_58196 ?auto_58201 ) ) ( not ( = ?auto_58196 ?auto_58202 ) ) ( not ( = ?auto_58197 ?auto_58198 ) ) ( not ( = ?auto_58197 ?auto_58199 ) ) ( not ( = ?auto_58197 ?auto_58200 ) ) ( not ( = ?auto_58197 ?auto_58201 ) ) ( not ( = ?auto_58197 ?auto_58202 ) ) ( not ( = ?auto_58198 ?auto_58199 ) ) ( not ( = ?auto_58198 ?auto_58200 ) ) ( not ( = ?auto_58198 ?auto_58201 ) ) ( not ( = ?auto_58198 ?auto_58202 ) ) ( not ( = ?auto_58199 ?auto_58200 ) ) ( not ( = ?auto_58199 ?auto_58201 ) ) ( not ( = ?auto_58199 ?auto_58202 ) ) ( not ( = ?auto_58200 ?auto_58201 ) ) ( not ( = ?auto_58200 ?auto_58202 ) ) ( not ( = ?auto_58201 ?auto_58202 ) ) ( ON ?auto_58200 ?auto_58201 ) ( ON ?auto_58199 ?auto_58200 ) ( ON ?auto_58198 ?auto_58199 ) ( ON ?auto_58197 ?auto_58198 ) ( CLEAR ?auto_58195 ) ( ON ?auto_58196 ?auto_58197 ) ( CLEAR ?auto_58196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58194 ?auto_58195 ?auto_58196 )
      ( MAKE-8PILE ?auto_58194 ?auto_58195 ?auto_58196 ?auto_58197 ?auto_58198 ?auto_58199 ?auto_58200 ?auto_58201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58211 - BLOCK
      ?auto_58212 - BLOCK
      ?auto_58213 - BLOCK
      ?auto_58214 - BLOCK
      ?auto_58215 - BLOCK
      ?auto_58216 - BLOCK
      ?auto_58217 - BLOCK
      ?auto_58218 - BLOCK
    )
    :vars
    (
      ?auto_58219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58218 ?auto_58219 ) ( ON-TABLE ?auto_58211 ) ( ON ?auto_58212 ?auto_58211 ) ( not ( = ?auto_58211 ?auto_58212 ) ) ( not ( = ?auto_58211 ?auto_58213 ) ) ( not ( = ?auto_58211 ?auto_58214 ) ) ( not ( = ?auto_58211 ?auto_58215 ) ) ( not ( = ?auto_58211 ?auto_58216 ) ) ( not ( = ?auto_58211 ?auto_58217 ) ) ( not ( = ?auto_58211 ?auto_58218 ) ) ( not ( = ?auto_58211 ?auto_58219 ) ) ( not ( = ?auto_58212 ?auto_58213 ) ) ( not ( = ?auto_58212 ?auto_58214 ) ) ( not ( = ?auto_58212 ?auto_58215 ) ) ( not ( = ?auto_58212 ?auto_58216 ) ) ( not ( = ?auto_58212 ?auto_58217 ) ) ( not ( = ?auto_58212 ?auto_58218 ) ) ( not ( = ?auto_58212 ?auto_58219 ) ) ( not ( = ?auto_58213 ?auto_58214 ) ) ( not ( = ?auto_58213 ?auto_58215 ) ) ( not ( = ?auto_58213 ?auto_58216 ) ) ( not ( = ?auto_58213 ?auto_58217 ) ) ( not ( = ?auto_58213 ?auto_58218 ) ) ( not ( = ?auto_58213 ?auto_58219 ) ) ( not ( = ?auto_58214 ?auto_58215 ) ) ( not ( = ?auto_58214 ?auto_58216 ) ) ( not ( = ?auto_58214 ?auto_58217 ) ) ( not ( = ?auto_58214 ?auto_58218 ) ) ( not ( = ?auto_58214 ?auto_58219 ) ) ( not ( = ?auto_58215 ?auto_58216 ) ) ( not ( = ?auto_58215 ?auto_58217 ) ) ( not ( = ?auto_58215 ?auto_58218 ) ) ( not ( = ?auto_58215 ?auto_58219 ) ) ( not ( = ?auto_58216 ?auto_58217 ) ) ( not ( = ?auto_58216 ?auto_58218 ) ) ( not ( = ?auto_58216 ?auto_58219 ) ) ( not ( = ?auto_58217 ?auto_58218 ) ) ( not ( = ?auto_58217 ?auto_58219 ) ) ( not ( = ?auto_58218 ?auto_58219 ) ) ( ON ?auto_58217 ?auto_58218 ) ( ON ?auto_58216 ?auto_58217 ) ( ON ?auto_58215 ?auto_58216 ) ( ON ?auto_58214 ?auto_58215 ) ( CLEAR ?auto_58212 ) ( ON ?auto_58213 ?auto_58214 ) ( CLEAR ?auto_58213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58211 ?auto_58212 ?auto_58213 )
      ( MAKE-8PILE ?auto_58211 ?auto_58212 ?auto_58213 ?auto_58214 ?auto_58215 ?auto_58216 ?auto_58217 ?auto_58218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58228 - BLOCK
      ?auto_58229 - BLOCK
      ?auto_58230 - BLOCK
      ?auto_58231 - BLOCK
      ?auto_58232 - BLOCK
      ?auto_58233 - BLOCK
      ?auto_58234 - BLOCK
      ?auto_58235 - BLOCK
    )
    :vars
    (
      ?auto_58236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58235 ?auto_58236 ) ( ON-TABLE ?auto_58228 ) ( not ( = ?auto_58228 ?auto_58229 ) ) ( not ( = ?auto_58228 ?auto_58230 ) ) ( not ( = ?auto_58228 ?auto_58231 ) ) ( not ( = ?auto_58228 ?auto_58232 ) ) ( not ( = ?auto_58228 ?auto_58233 ) ) ( not ( = ?auto_58228 ?auto_58234 ) ) ( not ( = ?auto_58228 ?auto_58235 ) ) ( not ( = ?auto_58228 ?auto_58236 ) ) ( not ( = ?auto_58229 ?auto_58230 ) ) ( not ( = ?auto_58229 ?auto_58231 ) ) ( not ( = ?auto_58229 ?auto_58232 ) ) ( not ( = ?auto_58229 ?auto_58233 ) ) ( not ( = ?auto_58229 ?auto_58234 ) ) ( not ( = ?auto_58229 ?auto_58235 ) ) ( not ( = ?auto_58229 ?auto_58236 ) ) ( not ( = ?auto_58230 ?auto_58231 ) ) ( not ( = ?auto_58230 ?auto_58232 ) ) ( not ( = ?auto_58230 ?auto_58233 ) ) ( not ( = ?auto_58230 ?auto_58234 ) ) ( not ( = ?auto_58230 ?auto_58235 ) ) ( not ( = ?auto_58230 ?auto_58236 ) ) ( not ( = ?auto_58231 ?auto_58232 ) ) ( not ( = ?auto_58231 ?auto_58233 ) ) ( not ( = ?auto_58231 ?auto_58234 ) ) ( not ( = ?auto_58231 ?auto_58235 ) ) ( not ( = ?auto_58231 ?auto_58236 ) ) ( not ( = ?auto_58232 ?auto_58233 ) ) ( not ( = ?auto_58232 ?auto_58234 ) ) ( not ( = ?auto_58232 ?auto_58235 ) ) ( not ( = ?auto_58232 ?auto_58236 ) ) ( not ( = ?auto_58233 ?auto_58234 ) ) ( not ( = ?auto_58233 ?auto_58235 ) ) ( not ( = ?auto_58233 ?auto_58236 ) ) ( not ( = ?auto_58234 ?auto_58235 ) ) ( not ( = ?auto_58234 ?auto_58236 ) ) ( not ( = ?auto_58235 ?auto_58236 ) ) ( ON ?auto_58234 ?auto_58235 ) ( ON ?auto_58233 ?auto_58234 ) ( ON ?auto_58232 ?auto_58233 ) ( ON ?auto_58231 ?auto_58232 ) ( ON ?auto_58230 ?auto_58231 ) ( CLEAR ?auto_58228 ) ( ON ?auto_58229 ?auto_58230 ) ( CLEAR ?auto_58229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58228 ?auto_58229 )
      ( MAKE-8PILE ?auto_58228 ?auto_58229 ?auto_58230 ?auto_58231 ?auto_58232 ?auto_58233 ?auto_58234 ?auto_58235 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58245 - BLOCK
      ?auto_58246 - BLOCK
      ?auto_58247 - BLOCK
      ?auto_58248 - BLOCK
      ?auto_58249 - BLOCK
      ?auto_58250 - BLOCK
      ?auto_58251 - BLOCK
      ?auto_58252 - BLOCK
    )
    :vars
    (
      ?auto_58253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58252 ?auto_58253 ) ( ON-TABLE ?auto_58245 ) ( not ( = ?auto_58245 ?auto_58246 ) ) ( not ( = ?auto_58245 ?auto_58247 ) ) ( not ( = ?auto_58245 ?auto_58248 ) ) ( not ( = ?auto_58245 ?auto_58249 ) ) ( not ( = ?auto_58245 ?auto_58250 ) ) ( not ( = ?auto_58245 ?auto_58251 ) ) ( not ( = ?auto_58245 ?auto_58252 ) ) ( not ( = ?auto_58245 ?auto_58253 ) ) ( not ( = ?auto_58246 ?auto_58247 ) ) ( not ( = ?auto_58246 ?auto_58248 ) ) ( not ( = ?auto_58246 ?auto_58249 ) ) ( not ( = ?auto_58246 ?auto_58250 ) ) ( not ( = ?auto_58246 ?auto_58251 ) ) ( not ( = ?auto_58246 ?auto_58252 ) ) ( not ( = ?auto_58246 ?auto_58253 ) ) ( not ( = ?auto_58247 ?auto_58248 ) ) ( not ( = ?auto_58247 ?auto_58249 ) ) ( not ( = ?auto_58247 ?auto_58250 ) ) ( not ( = ?auto_58247 ?auto_58251 ) ) ( not ( = ?auto_58247 ?auto_58252 ) ) ( not ( = ?auto_58247 ?auto_58253 ) ) ( not ( = ?auto_58248 ?auto_58249 ) ) ( not ( = ?auto_58248 ?auto_58250 ) ) ( not ( = ?auto_58248 ?auto_58251 ) ) ( not ( = ?auto_58248 ?auto_58252 ) ) ( not ( = ?auto_58248 ?auto_58253 ) ) ( not ( = ?auto_58249 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58252 ) ) ( not ( = ?auto_58249 ?auto_58253 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58252 ) ) ( not ( = ?auto_58250 ?auto_58253 ) ) ( not ( = ?auto_58251 ?auto_58252 ) ) ( not ( = ?auto_58251 ?auto_58253 ) ) ( not ( = ?auto_58252 ?auto_58253 ) ) ( ON ?auto_58251 ?auto_58252 ) ( ON ?auto_58250 ?auto_58251 ) ( ON ?auto_58249 ?auto_58250 ) ( ON ?auto_58248 ?auto_58249 ) ( ON ?auto_58247 ?auto_58248 ) ( CLEAR ?auto_58245 ) ( ON ?auto_58246 ?auto_58247 ) ( CLEAR ?auto_58246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58245 ?auto_58246 )
      ( MAKE-8PILE ?auto_58245 ?auto_58246 ?auto_58247 ?auto_58248 ?auto_58249 ?auto_58250 ?auto_58251 ?auto_58252 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58262 - BLOCK
      ?auto_58263 - BLOCK
      ?auto_58264 - BLOCK
      ?auto_58265 - BLOCK
      ?auto_58266 - BLOCK
      ?auto_58267 - BLOCK
      ?auto_58268 - BLOCK
      ?auto_58269 - BLOCK
    )
    :vars
    (
      ?auto_58270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58269 ?auto_58270 ) ( not ( = ?auto_58262 ?auto_58263 ) ) ( not ( = ?auto_58262 ?auto_58264 ) ) ( not ( = ?auto_58262 ?auto_58265 ) ) ( not ( = ?auto_58262 ?auto_58266 ) ) ( not ( = ?auto_58262 ?auto_58267 ) ) ( not ( = ?auto_58262 ?auto_58268 ) ) ( not ( = ?auto_58262 ?auto_58269 ) ) ( not ( = ?auto_58262 ?auto_58270 ) ) ( not ( = ?auto_58263 ?auto_58264 ) ) ( not ( = ?auto_58263 ?auto_58265 ) ) ( not ( = ?auto_58263 ?auto_58266 ) ) ( not ( = ?auto_58263 ?auto_58267 ) ) ( not ( = ?auto_58263 ?auto_58268 ) ) ( not ( = ?auto_58263 ?auto_58269 ) ) ( not ( = ?auto_58263 ?auto_58270 ) ) ( not ( = ?auto_58264 ?auto_58265 ) ) ( not ( = ?auto_58264 ?auto_58266 ) ) ( not ( = ?auto_58264 ?auto_58267 ) ) ( not ( = ?auto_58264 ?auto_58268 ) ) ( not ( = ?auto_58264 ?auto_58269 ) ) ( not ( = ?auto_58264 ?auto_58270 ) ) ( not ( = ?auto_58265 ?auto_58266 ) ) ( not ( = ?auto_58265 ?auto_58267 ) ) ( not ( = ?auto_58265 ?auto_58268 ) ) ( not ( = ?auto_58265 ?auto_58269 ) ) ( not ( = ?auto_58265 ?auto_58270 ) ) ( not ( = ?auto_58266 ?auto_58267 ) ) ( not ( = ?auto_58266 ?auto_58268 ) ) ( not ( = ?auto_58266 ?auto_58269 ) ) ( not ( = ?auto_58266 ?auto_58270 ) ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( not ( = ?auto_58267 ?auto_58269 ) ) ( not ( = ?auto_58267 ?auto_58270 ) ) ( not ( = ?auto_58268 ?auto_58269 ) ) ( not ( = ?auto_58268 ?auto_58270 ) ) ( not ( = ?auto_58269 ?auto_58270 ) ) ( ON ?auto_58268 ?auto_58269 ) ( ON ?auto_58267 ?auto_58268 ) ( ON ?auto_58266 ?auto_58267 ) ( ON ?auto_58265 ?auto_58266 ) ( ON ?auto_58264 ?auto_58265 ) ( ON ?auto_58263 ?auto_58264 ) ( ON ?auto_58262 ?auto_58263 ) ( CLEAR ?auto_58262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58262 )
      ( MAKE-8PILE ?auto_58262 ?auto_58263 ?auto_58264 ?auto_58265 ?auto_58266 ?auto_58267 ?auto_58268 ?auto_58269 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_58279 - BLOCK
      ?auto_58280 - BLOCK
      ?auto_58281 - BLOCK
      ?auto_58282 - BLOCK
      ?auto_58283 - BLOCK
      ?auto_58284 - BLOCK
      ?auto_58285 - BLOCK
      ?auto_58286 - BLOCK
    )
    :vars
    (
      ?auto_58287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58286 ?auto_58287 ) ( not ( = ?auto_58279 ?auto_58280 ) ) ( not ( = ?auto_58279 ?auto_58281 ) ) ( not ( = ?auto_58279 ?auto_58282 ) ) ( not ( = ?auto_58279 ?auto_58283 ) ) ( not ( = ?auto_58279 ?auto_58284 ) ) ( not ( = ?auto_58279 ?auto_58285 ) ) ( not ( = ?auto_58279 ?auto_58286 ) ) ( not ( = ?auto_58279 ?auto_58287 ) ) ( not ( = ?auto_58280 ?auto_58281 ) ) ( not ( = ?auto_58280 ?auto_58282 ) ) ( not ( = ?auto_58280 ?auto_58283 ) ) ( not ( = ?auto_58280 ?auto_58284 ) ) ( not ( = ?auto_58280 ?auto_58285 ) ) ( not ( = ?auto_58280 ?auto_58286 ) ) ( not ( = ?auto_58280 ?auto_58287 ) ) ( not ( = ?auto_58281 ?auto_58282 ) ) ( not ( = ?auto_58281 ?auto_58283 ) ) ( not ( = ?auto_58281 ?auto_58284 ) ) ( not ( = ?auto_58281 ?auto_58285 ) ) ( not ( = ?auto_58281 ?auto_58286 ) ) ( not ( = ?auto_58281 ?auto_58287 ) ) ( not ( = ?auto_58282 ?auto_58283 ) ) ( not ( = ?auto_58282 ?auto_58284 ) ) ( not ( = ?auto_58282 ?auto_58285 ) ) ( not ( = ?auto_58282 ?auto_58286 ) ) ( not ( = ?auto_58282 ?auto_58287 ) ) ( not ( = ?auto_58283 ?auto_58284 ) ) ( not ( = ?auto_58283 ?auto_58285 ) ) ( not ( = ?auto_58283 ?auto_58286 ) ) ( not ( = ?auto_58283 ?auto_58287 ) ) ( not ( = ?auto_58284 ?auto_58285 ) ) ( not ( = ?auto_58284 ?auto_58286 ) ) ( not ( = ?auto_58284 ?auto_58287 ) ) ( not ( = ?auto_58285 ?auto_58286 ) ) ( not ( = ?auto_58285 ?auto_58287 ) ) ( not ( = ?auto_58286 ?auto_58287 ) ) ( ON ?auto_58285 ?auto_58286 ) ( ON ?auto_58284 ?auto_58285 ) ( ON ?auto_58283 ?auto_58284 ) ( ON ?auto_58282 ?auto_58283 ) ( ON ?auto_58281 ?auto_58282 ) ( ON ?auto_58280 ?auto_58281 ) ( ON ?auto_58279 ?auto_58280 ) ( CLEAR ?auto_58279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58279 )
      ( MAKE-8PILE ?auto_58279 ?auto_58280 ?auto_58281 ?auto_58282 ?auto_58283 ?auto_58284 ?auto_58285 ?auto_58286 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58297 - BLOCK
      ?auto_58298 - BLOCK
      ?auto_58299 - BLOCK
      ?auto_58300 - BLOCK
      ?auto_58301 - BLOCK
      ?auto_58302 - BLOCK
      ?auto_58303 - BLOCK
      ?auto_58304 - BLOCK
      ?auto_58305 - BLOCK
    )
    :vars
    (
      ?auto_58306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58304 ) ( ON ?auto_58305 ?auto_58306 ) ( CLEAR ?auto_58305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58297 ) ( ON ?auto_58298 ?auto_58297 ) ( ON ?auto_58299 ?auto_58298 ) ( ON ?auto_58300 ?auto_58299 ) ( ON ?auto_58301 ?auto_58300 ) ( ON ?auto_58302 ?auto_58301 ) ( ON ?auto_58303 ?auto_58302 ) ( ON ?auto_58304 ?auto_58303 ) ( not ( = ?auto_58297 ?auto_58298 ) ) ( not ( = ?auto_58297 ?auto_58299 ) ) ( not ( = ?auto_58297 ?auto_58300 ) ) ( not ( = ?auto_58297 ?auto_58301 ) ) ( not ( = ?auto_58297 ?auto_58302 ) ) ( not ( = ?auto_58297 ?auto_58303 ) ) ( not ( = ?auto_58297 ?auto_58304 ) ) ( not ( = ?auto_58297 ?auto_58305 ) ) ( not ( = ?auto_58297 ?auto_58306 ) ) ( not ( = ?auto_58298 ?auto_58299 ) ) ( not ( = ?auto_58298 ?auto_58300 ) ) ( not ( = ?auto_58298 ?auto_58301 ) ) ( not ( = ?auto_58298 ?auto_58302 ) ) ( not ( = ?auto_58298 ?auto_58303 ) ) ( not ( = ?auto_58298 ?auto_58304 ) ) ( not ( = ?auto_58298 ?auto_58305 ) ) ( not ( = ?auto_58298 ?auto_58306 ) ) ( not ( = ?auto_58299 ?auto_58300 ) ) ( not ( = ?auto_58299 ?auto_58301 ) ) ( not ( = ?auto_58299 ?auto_58302 ) ) ( not ( = ?auto_58299 ?auto_58303 ) ) ( not ( = ?auto_58299 ?auto_58304 ) ) ( not ( = ?auto_58299 ?auto_58305 ) ) ( not ( = ?auto_58299 ?auto_58306 ) ) ( not ( = ?auto_58300 ?auto_58301 ) ) ( not ( = ?auto_58300 ?auto_58302 ) ) ( not ( = ?auto_58300 ?auto_58303 ) ) ( not ( = ?auto_58300 ?auto_58304 ) ) ( not ( = ?auto_58300 ?auto_58305 ) ) ( not ( = ?auto_58300 ?auto_58306 ) ) ( not ( = ?auto_58301 ?auto_58302 ) ) ( not ( = ?auto_58301 ?auto_58303 ) ) ( not ( = ?auto_58301 ?auto_58304 ) ) ( not ( = ?auto_58301 ?auto_58305 ) ) ( not ( = ?auto_58301 ?auto_58306 ) ) ( not ( = ?auto_58302 ?auto_58303 ) ) ( not ( = ?auto_58302 ?auto_58304 ) ) ( not ( = ?auto_58302 ?auto_58305 ) ) ( not ( = ?auto_58302 ?auto_58306 ) ) ( not ( = ?auto_58303 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58305 ) ) ( not ( = ?auto_58303 ?auto_58306 ) ) ( not ( = ?auto_58304 ?auto_58305 ) ) ( not ( = ?auto_58304 ?auto_58306 ) ) ( not ( = ?auto_58305 ?auto_58306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58305 ?auto_58306 )
      ( !STACK ?auto_58305 ?auto_58304 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58316 - BLOCK
      ?auto_58317 - BLOCK
      ?auto_58318 - BLOCK
      ?auto_58319 - BLOCK
      ?auto_58320 - BLOCK
      ?auto_58321 - BLOCK
      ?auto_58322 - BLOCK
      ?auto_58323 - BLOCK
      ?auto_58324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58323 ) ( ON-TABLE ?auto_58324 ) ( CLEAR ?auto_58324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58316 ) ( ON ?auto_58317 ?auto_58316 ) ( ON ?auto_58318 ?auto_58317 ) ( ON ?auto_58319 ?auto_58318 ) ( ON ?auto_58320 ?auto_58319 ) ( ON ?auto_58321 ?auto_58320 ) ( ON ?auto_58322 ?auto_58321 ) ( ON ?auto_58323 ?auto_58322 ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58316 ?auto_58318 ) ) ( not ( = ?auto_58316 ?auto_58319 ) ) ( not ( = ?auto_58316 ?auto_58320 ) ) ( not ( = ?auto_58316 ?auto_58321 ) ) ( not ( = ?auto_58316 ?auto_58322 ) ) ( not ( = ?auto_58316 ?auto_58323 ) ) ( not ( = ?auto_58316 ?auto_58324 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) ( not ( = ?auto_58317 ?auto_58320 ) ) ( not ( = ?auto_58317 ?auto_58321 ) ) ( not ( = ?auto_58317 ?auto_58322 ) ) ( not ( = ?auto_58317 ?auto_58323 ) ) ( not ( = ?auto_58317 ?auto_58324 ) ) ( not ( = ?auto_58318 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58320 ) ) ( not ( = ?auto_58318 ?auto_58321 ) ) ( not ( = ?auto_58318 ?auto_58322 ) ) ( not ( = ?auto_58318 ?auto_58323 ) ) ( not ( = ?auto_58318 ?auto_58324 ) ) ( not ( = ?auto_58319 ?auto_58320 ) ) ( not ( = ?auto_58319 ?auto_58321 ) ) ( not ( = ?auto_58319 ?auto_58322 ) ) ( not ( = ?auto_58319 ?auto_58323 ) ) ( not ( = ?auto_58319 ?auto_58324 ) ) ( not ( = ?auto_58320 ?auto_58321 ) ) ( not ( = ?auto_58320 ?auto_58322 ) ) ( not ( = ?auto_58320 ?auto_58323 ) ) ( not ( = ?auto_58320 ?auto_58324 ) ) ( not ( = ?auto_58321 ?auto_58322 ) ) ( not ( = ?auto_58321 ?auto_58323 ) ) ( not ( = ?auto_58321 ?auto_58324 ) ) ( not ( = ?auto_58322 ?auto_58323 ) ) ( not ( = ?auto_58322 ?auto_58324 ) ) ( not ( = ?auto_58323 ?auto_58324 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_58324 )
      ( !STACK ?auto_58324 ?auto_58323 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58334 - BLOCK
      ?auto_58335 - BLOCK
      ?auto_58336 - BLOCK
      ?auto_58337 - BLOCK
      ?auto_58338 - BLOCK
      ?auto_58339 - BLOCK
      ?auto_58340 - BLOCK
      ?auto_58341 - BLOCK
      ?auto_58342 - BLOCK
    )
    :vars
    (
      ?auto_58343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58342 ?auto_58343 ) ( ON-TABLE ?auto_58334 ) ( ON ?auto_58335 ?auto_58334 ) ( ON ?auto_58336 ?auto_58335 ) ( ON ?auto_58337 ?auto_58336 ) ( ON ?auto_58338 ?auto_58337 ) ( ON ?auto_58339 ?auto_58338 ) ( ON ?auto_58340 ?auto_58339 ) ( not ( = ?auto_58334 ?auto_58335 ) ) ( not ( = ?auto_58334 ?auto_58336 ) ) ( not ( = ?auto_58334 ?auto_58337 ) ) ( not ( = ?auto_58334 ?auto_58338 ) ) ( not ( = ?auto_58334 ?auto_58339 ) ) ( not ( = ?auto_58334 ?auto_58340 ) ) ( not ( = ?auto_58334 ?auto_58341 ) ) ( not ( = ?auto_58334 ?auto_58342 ) ) ( not ( = ?auto_58334 ?auto_58343 ) ) ( not ( = ?auto_58335 ?auto_58336 ) ) ( not ( = ?auto_58335 ?auto_58337 ) ) ( not ( = ?auto_58335 ?auto_58338 ) ) ( not ( = ?auto_58335 ?auto_58339 ) ) ( not ( = ?auto_58335 ?auto_58340 ) ) ( not ( = ?auto_58335 ?auto_58341 ) ) ( not ( = ?auto_58335 ?auto_58342 ) ) ( not ( = ?auto_58335 ?auto_58343 ) ) ( not ( = ?auto_58336 ?auto_58337 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58339 ) ) ( not ( = ?auto_58336 ?auto_58340 ) ) ( not ( = ?auto_58336 ?auto_58341 ) ) ( not ( = ?auto_58336 ?auto_58342 ) ) ( not ( = ?auto_58336 ?auto_58343 ) ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( not ( = ?auto_58337 ?auto_58339 ) ) ( not ( = ?auto_58337 ?auto_58340 ) ) ( not ( = ?auto_58337 ?auto_58341 ) ) ( not ( = ?auto_58337 ?auto_58342 ) ) ( not ( = ?auto_58337 ?auto_58343 ) ) ( not ( = ?auto_58338 ?auto_58339 ) ) ( not ( = ?auto_58338 ?auto_58340 ) ) ( not ( = ?auto_58338 ?auto_58341 ) ) ( not ( = ?auto_58338 ?auto_58342 ) ) ( not ( = ?auto_58338 ?auto_58343 ) ) ( not ( = ?auto_58339 ?auto_58340 ) ) ( not ( = ?auto_58339 ?auto_58341 ) ) ( not ( = ?auto_58339 ?auto_58342 ) ) ( not ( = ?auto_58339 ?auto_58343 ) ) ( not ( = ?auto_58340 ?auto_58341 ) ) ( not ( = ?auto_58340 ?auto_58342 ) ) ( not ( = ?auto_58340 ?auto_58343 ) ) ( not ( = ?auto_58341 ?auto_58342 ) ) ( not ( = ?auto_58341 ?auto_58343 ) ) ( not ( = ?auto_58342 ?auto_58343 ) ) ( CLEAR ?auto_58340 ) ( ON ?auto_58341 ?auto_58342 ) ( CLEAR ?auto_58341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_58334 ?auto_58335 ?auto_58336 ?auto_58337 ?auto_58338 ?auto_58339 ?auto_58340 ?auto_58341 )
      ( MAKE-9PILE ?auto_58334 ?auto_58335 ?auto_58336 ?auto_58337 ?auto_58338 ?auto_58339 ?auto_58340 ?auto_58341 ?auto_58342 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58353 - BLOCK
      ?auto_58354 - BLOCK
      ?auto_58355 - BLOCK
      ?auto_58356 - BLOCK
      ?auto_58357 - BLOCK
      ?auto_58358 - BLOCK
      ?auto_58359 - BLOCK
      ?auto_58360 - BLOCK
      ?auto_58361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58361 ) ( ON-TABLE ?auto_58353 ) ( ON ?auto_58354 ?auto_58353 ) ( ON ?auto_58355 ?auto_58354 ) ( ON ?auto_58356 ?auto_58355 ) ( ON ?auto_58357 ?auto_58356 ) ( ON ?auto_58358 ?auto_58357 ) ( ON ?auto_58359 ?auto_58358 ) ( not ( = ?auto_58353 ?auto_58354 ) ) ( not ( = ?auto_58353 ?auto_58355 ) ) ( not ( = ?auto_58353 ?auto_58356 ) ) ( not ( = ?auto_58353 ?auto_58357 ) ) ( not ( = ?auto_58353 ?auto_58358 ) ) ( not ( = ?auto_58353 ?auto_58359 ) ) ( not ( = ?auto_58353 ?auto_58360 ) ) ( not ( = ?auto_58353 ?auto_58361 ) ) ( not ( = ?auto_58354 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58356 ) ) ( not ( = ?auto_58354 ?auto_58357 ) ) ( not ( = ?auto_58354 ?auto_58358 ) ) ( not ( = ?auto_58354 ?auto_58359 ) ) ( not ( = ?auto_58354 ?auto_58360 ) ) ( not ( = ?auto_58354 ?auto_58361 ) ) ( not ( = ?auto_58355 ?auto_58356 ) ) ( not ( = ?auto_58355 ?auto_58357 ) ) ( not ( = ?auto_58355 ?auto_58358 ) ) ( not ( = ?auto_58355 ?auto_58359 ) ) ( not ( = ?auto_58355 ?auto_58360 ) ) ( not ( = ?auto_58355 ?auto_58361 ) ) ( not ( = ?auto_58356 ?auto_58357 ) ) ( not ( = ?auto_58356 ?auto_58358 ) ) ( not ( = ?auto_58356 ?auto_58359 ) ) ( not ( = ?auto_58356 ?auto_58360 ) ) ( not ( = ?auto_58356 ?auto_58361 ) ) ( not ( = ?auto_58357 ?auto_58358 ) ) ( not ( = ?auto_58357 ?auto_58359 ) ) ( not ( = ?auto_58357 ?auto_58360 ) ) ( not ( = ?auto_58357 ?auto_58361 ) ) ( not ( = ?auto_58358 ?auto_58359 ) ) ( not ( = ?auto_58358 ?auto_58360 ) ) ( not ( = ?auto_58358 ?auto_58361 ) ) ( not ( = ?auto_58359 ?auto_58360 ) ) ( not ( = ?auto_58359 ?auto_58361 ) ) ( not ( = ?auto_58360 ?auto_58361 ) ) ( CLEAR ?auto_58359 ) ( ON ?auto_58360 ?auto_58361 ) ( CLEAR ?auto_58360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_58353 ?auto_58354 ?auto_58355 ?auto_58356 ?auto_58357 ?auto_58358 ?auto_58359 ?auto_58360 )
      ( MAKE-9PILE ?auto_58353 ?auto_58354 ?auto_58355 ?auto_58356 ?auto_58357 ?auto_58358 ?auto_58359 ?auto_58360 ?auto_58361 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58371 - BLOCK
      ?auto_58372 - BLOCK
      ?auto_58373 - BLOCK
      ?auto_58374 - BLOCK
      ?auto_58375 - BLOCK
      ?auto_58376 - BLOCK
      ?auto_58377 - BLOCK
      ?auto_58378 - BLOCK
      ?auto_58379 - BLOCK
    )
    :vars
    (
      ?auto_58380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58379 ?auto_58380 ) ( ON-TABLE ?auto_58371 ) ( ON ?auto_58372 ?auto_58371 ) ( ON ?auto_58373 ?auto_58372 ) ( ON ?auto_58374 ?auto_58373 ) ( ON ?auto_58375 ?auto_58374 ) ( ON ?auto_58376 ?auto_58375 ) ( not ( = ?auto_58371 ?auto_58372 ) ) ( not ( = ?auto_58371 ?auto_58373 ) ) ( not ( = ?auto_58371 ?auto_58374 ) ) ( not ( = ?auto_58371 ?auto_58375 ) ) ( not ( = ?auto_58371 ?auto_58376 ) ) ( not ( = ?auto_58371 ?auto_58377 ) ) ( not ( = ?auto_58371 ?auto_58378 ) ) ( not ( = ?auto_58371 ?auto_58379 ) ) ( not ( = ?auto_58371 ?auto_58380 ) ) ( not ( = ?auto_58372 ?auto_58373 ) ) ( not ( = ?auto_58372 ?auto_58374 ) ) ( not ( = ?auto_58372 ?auto_58375 ) ) ( not ( = ?auto_58372 ?auto_58376 ) ) ( not ( = ?auto_58372 ?auto_58377 ) ) ( not ( = ?auto_58372 ?auto_58378 ) ) ( not ( = ?auto_58372 ?auto_58379 ) ) ( not ( = ?auto_58372 ?auto_58380 ) ) ( not ( = ?auto_58373 ?auto_58374 ) ) ( not ( = ?auto_58373 ?auto_58375 ) ) ( not ( = ?auto_58373 ?auto_58376 ) ) ( not ( = ?auto_58373 ?auto_58377 ) ) ( not ( = ?auto_58373 ?auto_58378 ) ) ( not ( = ?auto_58373 ?auto_58379 ) ) ( not ( = ?auto_58373 ?auto_58380 ) ) ( not ( = ?auto_58374 ?auto_58375 ) ) ( not ( = ?auto_58374 ?auto_58376 ) ) ( not ( = ?auto_58374 ?auto_58377 ) ) ( not ( = ?auto_58374 ?auto_58378 ) ) ( not ( = ?auto_58374 ?auto_58379 ) ) ( not ( = ?auto_58374 ?auto_58380 ) ) ( not ( = ?auto_58375 ?auto_58376 ) ) ( not ( = ?auto_58375 ?auto_58377 ) ) ( not ( = ?auto_58375 ?auto_58378 ) ) ( not ( = ?auto_58375 ?auto_58379 ) ) ( not ( = ?auto_58375 ?auto_58380 ) ) ( not ( = ?auto_58376 ?auto_58377 ) ) ( not ( = ?auto_58376 ?auto_58378 ) ) ( not ( = ?auto_58376 ?auto_58379 ) ) ( not ( = ?auto_58376 ?auto_58380 ) ) ( not ( = ?auto_58377 ?auto_58378 ) ) ( not ( = ?auto_58377 ?auto_58379 ) ) ( not ( = ?auto_58377 ?auto_58380 ) ) ( not ( = ?auto_58378 ?auto_58379 ) ) ( not ( = ?auto_58378 ?auto_58380 ) ) ( not ( = ?auto_58379 ?auto_58380 ) ) ( ON ?auto_58378 ?auto_58379 ) ( CLEAR ?auto_58376 ) ( ON ?auto_58377 ?auto_58378 ) ( CLEAR ?auto_58377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_58371 ?auto_58372 ?auto_58373 ?auto_58374 ?auto_58375 ?auto_58376 ?auto_58377 )
      ( MAKE-9PILE ?auto_58371 ?auto_58372 ?auto_58373 ?auto_58374 ?auto_58375 ?auto_58376 ?auto_58377 ?auto_58378 ?auto_58379 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58390 - BLOCK
      ?auto_58391 - BLOCK
      ?auto_58392 - BLOCK
      ?auto_58393 - BLOCK
      ?auto_58394 - BLOCK
      ?auto_58395 - BLOCK
      ?auto_58396 - BLOCK
      ?auto_58397 - BLOCK
      ?auto_58398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58398 ) ( ON-TABLE ?auto_58390 ) ( ON ?auto_58391 ?auto_58390 ) ( ON ?auto_58392 ?auto_58391 ) ( ON ?auto_58393 ?auto_58392 ) ( ON ?auto_58394 ?auto_58393 ) ( ON ?auto_58395 ?auto_58394 ) ( not ( = ?auto_58390 ?auto_58391 ) ) ( not ( = ?auto_58390 ?auto_58392 ) ) ( not ( = ?auto_58390 ?auto_58393 ) ) ( not ( = ?auto_58390 ?auto_58394 ) ) ( not ( = ?auto_58390 ?auto_58395 ) ) ( not ( = ?auto_58390 ?auto_58396 ) ) ( not ( = ?auto_58390 ?auto_58397 ) ) ( not ( = ?auto_58390 ?auto_58398 ) ) ( not ( = ?auto_58391 ?auto_58392 ) ) ( not ( = ?auto_58391 ?auto_58393 ) ) ( not ( = ?auto_58391 ?auto_58394 ) ) ( not ( = ?auto_58391 ?auto_58395 ) ) ( not ( = ?auto_58391 ?auto_58396 ) ) ( not ( = ?auto_58391 ?auto_58397 ) ) ( not ( = ?auto_58391 ?auto_58398 ) ) ( not ( = ?auto_58392 ?auto_58393 ) ) ( not ( = ?auto_58392 ?auto_58394 ) ) ( not ( = ?auto_58392 ?auto_58395 ) ) ( not ( = ?auto_58392 ?auto_58396 ) ) ( not ( = ?auto_58392 ?auto_58397 ) ) ( not ( = ?auto_58392 ?auto_58398 ) ) ( not ( = ?auto_58393 ?auto_58394 ) ) ( not ( = ?auto_58393 ?auto_58395 ) ) ( not ( = ?auto_58393 ?auto_58396 ) ) ( not ( = ?auto_58393 ?auto_58397 ) ) ( not ( = ?auto_58393 ?auto_58398 ) ) ( not ( = ?auto_58394 ?auto_58395 ) ) ( not ( = ?auto_58394 ?auto_58396 ) ) ( not ( = ?auto_58394 ?auto_58397 ) ) ( not ( = ?auto_58394 ?auto_58398 ) ) ( not ( = ?auto_58395 ?auto_58396 ) ) ( not ( = ?auto_58395 ?auto_58397 ) ) ( not ( = ?auto_58395 ?auto_58398 ) ) ( not ( = ?auto_58396 ?auto_58397 ) ) ( not ( = ?auto_58396 ?auto_58398 ) ) ( not ( = ?auto_58397 ?auto_58398 ) ) ( ON ?auto_58397 ?auto_58398 ) ( CLEAR ?auto_58395 ) ( ON ?auto_58396 ?auto_58397 ) ( CLEAR ?auto_58396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_58390 ?auto_58391 ?auto_58392 ?auto_58393 ?auto_58394 ?auto_58395 ?auto_58396 )
      ( MAKE-9PILE ?auto_58390 ?auto_58391 ?auto_58392 ?auto_58393 ?auto_58394 ?auto_58395 ?auto_58396 ?auto_58397 ?auto_58398 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58408 - BLOCK
      ?auto_58409 - BLOCK
      ?auto_58410 - BLOCK
      ?auto_58411 - BLOCK
      ?auto_58412 - BLOCK
      ?auto_58413 - BLOCK
      ?auto_58414 - BLOCK
      ?auto_58415 - BLOCK
      ?auto_58416 - BLOCK
    )
    :vars
    (
      ?auto_58417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58416 ?auto_58417 ) ( ON-TABLE ?auto_58408 ) ( ON ?auto_58409 ?auto_58408 ) ( ON ?auto_58410 ?auto_58409 ) ( ON ?auto_58411 ?auto_58410 ) ( ON ?auto_58412 ?auto_58411 ) ( not ( = ?auto_58408 ?auto_58409 ) ) ( not ( = ?auto_58408 ?auto_58410 ) ) ( not ( = ?auto_58408 ?auto_58411 ) ) ( not ( = ?auto_58408 ?auto_58412 ) ) ( not ( = ?auto_58408 ?auto_58413 ) ) ( not ( = ?auto_58408 ?auto_58414 ) ) ( not ( = ?auto_58408 ?auto_58415 ) ) ( not ( = ?auto_58408 ?auto_58416 ) ) ( not ( = ?auto_58408 ?auto_58417 ) ) ( not ( = ?auto_58409 ?auto_58410 ) ) ( not ( = ?auto_58409 ?auto_58411 ) ) ( not ( = ?auto_58409 ?auto_58412 ) ) ( not ( = ?auto_58409 ?auto_58413 ) ) ( not ( = ?auto_58409 ?auto_58414 ) ) ( not ( = ?auto_58409 ?auto_58415 ) ) ( not ( = ?auto_58409 ?auto_58416 ) ) ( not ( = ?auto_58409 ?auto_58417 ) ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58412 ) ) ( not ( = ?auto_58410 ?auto_58413 ) ) ( not ( = ?auto_58410 ?auto_58414 ) ) ( not ( = ?auto_58410 ?auto_58415 ) ) ( not ( = ?auto_58410 ?auto_58416 ) ) ( not ( = ?auto_58410 ?auto_58417 ) ) ( not ( = ?auto_58411 ?auto_58412 ) ) ( not ( = ?auto_58411 ?auto_58413 ) ) ( not ( = ?auto_58411 ?auto_58414 ) ) ( not ( = ?auto_58411 ?auto_58415 ) ) ( not ( = ?auto_58411 ?auto_58416 ) ) ( not ( = ?auto_58411 ?auto_58417 ) ) ( not ( = ?auto_58412 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58414 ) ) ( not ( = ?auto_58412 ?auto_58415 ) ) ( not ( = ?auto_58412 ?auto_58416 ) ) ( not ( = ?auto_58412 ?auto_58417 ) ) ( not ( = ?auto_58413 ?auto_58414 ) ) ( not ( = ?auto_58413 ?auto_58415 ) ) ( not ( = ?auto_58413 ?auto_58416 ) ) ( not ( = ?auto_58413 ?auto_58417 ) ) ( not ( = ?auto_58414 ?auto_58415 ) ) ( not ( = ?auto_58414 ?auto_58416 ) ) ( not ( = ?auto_58414 ?auto_58417 ) ) ( not ( = ?auto_58415 ?auto_58416 ) ) ( not ( = ?auto_58415 ?auto_58417 ) ) ( not ( = ?auto_58416 ?auto_58417 ) ) ( ON ?auto_58415 ?auto_58416 ) ( ON ?auto_58414 ?auto_58415 ) ( CLEAR ?auto_58412 ) ( ON ?auto_58413 ?auto_58414 ) ( CLEAR ?auto_58413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58408 ?auto_58409 ?auto_58410 ?auto_58411 ?auto_58412 ?auto_58413 )
      ( MAKE-9PILE ?auto_58408 ?auto_58409 ?auto_58410 ?auto_58411 ?auto_58412 ?auto_58413 ?auto_58414 ?auto_58415 ?auto_58416 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58427 - BLOCK
      ?auto_58428 - BLOCK
      ?auto_58429 - BLOCK
      ?auto_58430 - BLOCK
      ?auto_58431 - BLOCK
      ?auto_58432 - BLOCK
      ?auto_58433 - BLOCK
      ?auto_58434 - BLOCK
      ?auto_58435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58435 ) ( ON-TABLE ?auto_58427 ) ( ON ?auto_58428 ?auto_58427 ) ( ON ?auto_58429 ?auto_58428 ) ( ON ?auto_58430 ?auto_58429 ) ( ON ?auto_58431 ?auto_58430 ) ( not ( = ?auto_58427 ?auto_58428 ) ) ( not ( = ?auto_58427 ?auto_58429 ) ) ( not ( = ?auto_58427 ?auto_58430 ) ) ( not ( = ?auto_58427 ?auto_58431 ) ) ( not ( = ?auto_58427 ?auto_58432 ) ) ( not ( = ?auto_58427 ?auto_58433 ) ) ( not ( = ?auto_58427 ?auto_58434 ) ) ( not ( = ?auto_58427 ?auto_58435 ) ) ( not ( = ?auto_58428 ?auto_58429 ) ) ( not ( = ?auto_58428 ?auto_58430 ) ) ( not ( = ?auto_58428 ?auto_58431 ) ) ( not ( = ?auto_58428 ?auto_58432 ) ) ( not ( = ?auto_58428 ?auto_58433 ) ) ( not ( = ?auto_58428 ?auto_58434 ) ) ( not ( = ?auto_58428 ?auto_58435 ) ) ( not ( = ?auto_58429 ?auto_58430 ) ) ( not ( = ?auto_58429 ?auto_58431 ) ) ( not ( = ?auto_58429 ?auto_58432 ) ) ( not ( = ?auto_58429 ?auto_58433 ) ) ( not ( = ?auto_58429 ?auto_58434 ) ) ( not ( = ?auto_58429 ?auto_58435 ) ) ( not ( = ?auto_58430 ?auto_58431 ) ) ( not ( = ?auto_58430 ?auto_58432 ) ) ( not ( = ?auto_58430 ?auto_58433 ) ) ( not ( = ?auto_58430 ?auto_58434 ) ) ( not ( = ?auto_58430 ?auto_58435 ) ) ( not ( = ?auto_58431 ?auto_58432 ) ) ( not ( = ?auto_58431 ?auto_58433 ) ) ( not ( = ?auto_58431 ?auto_58434 ) ) ( not ( = ?auto_58431 ?auto_58435 ) ) ( not ( = ?auto_58432 ?auto_58433 ) ) ( not ( = ?auto_58432 ?auto_58434 ) ) ( not ( = ?auto_58432 ?auto_58435 ) ) ( not ( = ?auto_58433 ?auto_58434 ) ) ( not ( = ?auto_58433 ?auto_58435 ) ) ( not ( = ?auto_58434 ?auto_58435 ) ) ( ON ?auto_58434 ?auto_58435 ) ( ON ?auto_58433 ?auto_58434 ) ( CLEAR ?auto_58431 ) ( ON ?auto_58432 ?auto_58433 ) ( CLEAR ?auto_58432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58427 ?auto_58428 ?auto_58429 ?auto_58430 ?auto_58431 ?auto_58432 )
      ( MAKE-9PILE ?auto_58427 ?auto_58428 ?auto_58429 ?auto_58430 ?auto_58431 ?auto_58432 ?auto_58433 ?auto_58434 ?auto_58435 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58445 - BLOCK
      ?auto_58446 - BLOCK
      ?auto_58447 - BLOCK
      ?auto_58448 - BLOCK
      ?auto_58449 - BLOCK
      ?auto_58450 - BLOCK
      ?auto_58451 - BLOCK
      ?auto_58452 - BLOCK
      ?auto_58453 - BLOCK
    )
    :vars
    (
      ?auto_58454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58453 ?auto_58454 ) ( ON-TABLE ?auto_58445 ) ( ON ?auto_58446 ?auto_58445 ) ( ON ?auto_58447 ?auto_58446 ) ( ON ?auto_58448 ?auto_58447 ) ( not ( = ?auto_58445 ?auto_58446 ) ) ( not ( = ?auto_58445 ?auto_58447 ) ) ( not ( = ?auto_58445 ?auto_58448 ) ) ( not ( = ?auto_58445 ?auto_58449 ) ) ( not ( = ?auto_58445 ?auto_58450 ) ) ( not ( = ?auto_58445 ?auto_58451 ) ) ( not ( = ?auto_58445 ?auto_58452 ) ) ( not ( = ?auto_58445 ?auto_58453 ) ) ( not ( = ?auto_58445 ?auto_58454 ) ) ( not ( = ?auto_58446 ?auto_58447 ) ) ( not ( = ?auto_58446 ?auto_58448 ) ) ( not ( = ?auto_58446 ?auto_58449 ) ) ( not ( = ?auto_58446 ?auto_58450 ) ) ( not ( = ?auto_58446 ?auto_58451 ) ) ( not ( = ?auto_58446 ?auto_58452 ) ) ( not ( = ?auto_58446 ?auto_58453 ) ) ( not ( = ?auto_58446 ?auto_58454 ) ) ( not ( = ?auto_58447 ?auto_58448 ) ) ( not ( = ?auto_58447 ?auto_58449 ) ) ( not ( = ?auto_58447 ?auto_58450 ) ) ( not ( = ?auto_58447 ?auto_58451 ) ) ( not ( = ?auto_58447 ?auto_58452 ) ) ( not ( = ?auto_58447 ?auto_58453 ) ) ( not ( = ?auto_58447 ?auto_58454 ) ) ( not ( = ?auto_58448 ?auto_58449 ) ) ( not ( = ?auto_58448 ?auto_58450 ) ) ( not ( = ?auto_58448 ?auto_58451 ) ) ( not ( = ?auto_58448 ?auto_58452 ) ) ( not ( = ?auto_58448 ?auto_58453 ) ) ( not ( = ?auto_58448 ?auto_58454 ) ) ( not ( = ?auto_58449 ?auto_58450 ) ) ( not ( = ?auto_58449 ?auto_58451 ) ) ( not ( = ?auto_58449 ?auto_58452 ) ) ( not ( = ?auto_58449 ?auto_58453 ) ) ( not ( = ?auto_58449 ?auto_58454 ) ) ( not ( = ?auto_58450 ?auto_58451 ) ) ( not ( = ?auto_58450 ?auto_58452 ) ) ( not ( = ?auto_58450 ?auto_58453 ) ) ( not ( = ?auto_58450 ?auto_58454 ) ) ( not ( = ?auto_58451 ?auto_58452 ) ) ( not ( = ?auto_58451 ?auto_58453 ) ) ( not ( = ?auto_58451 ?auto_58454 ) ) ( not ( = ?auto_58452 ?auto_58453 ) ) ( not ( = ?auto_58452 ?auto_58454 ) ) ( not ( = ?auto_58453 ?auto_58454 ) ) ( ON ?auto_58452 ?auto_58453 ) ( ON ?auto_58451 ?auto_58452 ) ( ON ?auto_58450 ?auto_58451 ) ( CLEAR ?auto_58448 ) ( ON ?auto_58449 ?auto_58450 ) ( CLEAR ?auto_58449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58445 ?auto_58446 ?auto_58447 ?auto_58448 ?auto_58449 )
      ( MAKE-9PILE ?auto_58445 ?auto_58446 ?auto_58447 ?auto_58448 ?auto_58449 ?auto_58450 ?auto_58451 ?auto_58452 ?auto_58453 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58464 - BLOCK
      ?auto_58465 - BLOCK
      ?auto_58466 - BLOCK
      ?auto_58467 - BLOCK
      ?auto_58468 - BLOCK
      ?auto_58469 - BLOCK
      ?auto_58470 - BLOCK
      ?auto_58471 - BLOCK
      ?auto_58472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58472 ) ( ON-TABLE ?auto_58464 ) ( ON ?auto_58465 ?auto_58464 ) ( ON ?auto_58466 ?auto_58465 ) ( ON ?auto_58467 ?auto_58466 ) ( not ( = ?auto_58464 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58466 ) ) ( not ( = ?auto_58464 ?auto_58467 ) ) ( not ( = ?auto_58464 ?auto_58468 ) ) ( not ( = ?auto_58464 ?auto_58469 ) ) ( not ( = ?auto_58464 ?auto_58470 ) ) ( not ( = ?auto_58464 ?auto_58471 ) ) ( not ( = ?auto_58464 ?auto_58472 ) ) ( not ( = ?auto_58465 ?auto_58466 ) ) ( not ( = ?auto_58465 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58468 ) ) ( not ( = ?auto_58465 ?auto_58469 ) ) ( not ( = ?auto_58465 ?auto_58470 ) ) ( not ( = ?auto_58465 ?auto_58471 ) ) ( not ( = ?auto_58465 ?auto_58472 ) ) ( not ( = ?auto_58466 ?auto_58467 ) ) ( not ( = ?auto_58466 ?auto_58468 ) ) ( not ( = ?auto_58466 ?auto_58469 ) ) ( not ( = ?auto_58466 ?auto_58470 ) ) ( not ( = ?auto_58466 ?auto_58471 ) ) ( not ( = ?auto_58466 ?auto_58472 ) ) ( not ( = ?auto_58467 ?auto_58468 ) ) ( not ( = ?auto_58467 ?auto_58469 ) ) ( not ( = ?auto_58467 ?auto_58470 ) ) ( not ( = ?auto_58467 ?auto_58471 ) ) ( not ( = ?auto_58467 ?auto_58472 ) ) ( not ( = ?auto_58468 ?auto_58469 ) ) ( not ( = ?auto_58468 ?auto_58470 ) ) ( not ( = ?auto_58468 ?auto_58471 ) ) ( not ( = ?auto_58468 ?auto_58472 ) ) ( not ( = ?auto_58469 ?auto_58470 ) ) ( not ( = ?auto_58469 ?auto_58471 ) ) ( not ( = ?auto_58469 ?auto_58472 ) ) ( not ( = ?auto_58470 ?auto_58471 ) ) ( not ( = ?auto_58470 ?auto_58472 ) ) ( not ( = ?auto_58471 ?auto_58472 ) ) ( ON ?auto_58471 ?auto_58472 ) ( ON ?auto_58470 ?auto_58471 ) ( ON ?auto_58469 ?auto_58470 ) ( CLEAR ?auto_58467 ) ( ON ?auto_58468 ?auto_58469 ) ( CLEAR ?auto_58468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58464 ?auto_58465 ?auto_58466 ?auto_58467 ?auto_58468 )
      ( MAKE-9PILE ?auto_58464 ?auto_58465 ?auto_58466 ?auto_58467 ?auto_58468 ?auto_58469 ?auto_58470 ?auto_58471 ?auto_58472 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58482 - BLOCK
      ?auto_58483 - BLOCK
      ?auto_58484 - BLOCK
      ?auto_58485 - BLOCK
      ?auto_58486 - BLOCK
      ?auto_58487 - BLOCK
      ?auto_58488 - BLOCK
      ?auto_58489 - BLOCK
      ?auto_58490 - BLOCK
    )
    :vars
    (
      ?auto_58491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58490 ?auto_58491 ) ( ON-TABLE ?auto_58482 ) ( ON ?auto_58483 ?auto_58482 ) ( ON ?auto_58484 ?auto_58483 ) ( not ( = ?auto_58482 ?auto_58483 ) ) ( not ( = ?auto_58482 ?auto_58484 ) ) ( not ( = ?auto_58482 ?auto_58485 ) ) ( not ( = ?auto_58482 ?auto_58486 ) ) ( not ( = ?auto_58482 ?auto_58487 ) ) ( not ( = ?auto_58482 ?auto_58488 ) ) ( not ( = ?auto_58482 ?auto_58489 ) ) ( not ( = ?auto_58482 ?auto_58490 ) ) ( not ( = ?auto_58482 ?auto_58491 ) ) ( not ( = ?auto_58483 ?auto_58484 ) ) ( not ( = ?auto_58483 ?auto_58485 ) ) ( not ( = ?auto_58483 ?auto_58486 ) ) ( not ( = ?auto_58483 ?auto_58487 ) ) ( not ( = ?auto_58483 ?auto_58488 ) ) ( not ( = ?auto_58483 ?auto_58489 ) ) ( not ( = ?auto_58483 ?auto_58490 ) ) ( not ( = ?auto_58483 ?auto_58491 ) ) ( not ( = ?auto_58484 ?auto_58485 ) ) ( not ( = ?auto_58484 ?auto_58486 ) ) ( not ( = ?auto_58484 ?auto_58487 ) ) ( not ( = ?auto_58484 ?auto_58488 ) ) ( not ( = ?auto_58484 ?auto_58489 ) ) ( not ( = ?auto_58484 ?auto_58490 ) ) ( not ( = ?auto_58484 ?auto_58491 ) ) ( not ( = ?auto_58485 ?auto_58486 ) ) ( not ( = ?auto_58485 ?auto_58487 ) ) ( not ( = ?auto_58485 ?auto_58488 ) ) ( not ( = ?auto_58485 ?auto_58489 ) ) ( not ( = ?auto_58485 ?auto_58490 ) ) ( not ( = ?auto_58485 ?auto_58491 ) ) ( not ( = ?auto_58486 ?auto_58487 ) ) ( not ( = ?auto_58486 ?auto_58488 ) ) ( not ( = ?auto_58486 ?auto_58489 ) ) ( not ( = ?auto_58486 ?auto_58490 ) ) ( not ( = ?auto_58486 ?auto_58491 ) ) ( not ( = ?auto_58487 ?auto_58488 ) ) ( not ( = ?auto_58487 ?auto_58489 ) ) ( not ( = ?auto_58487 ?auto_58490 ) ) ( not ( = ?auto_58487 ?auto_58491 ) ) ( not ( = ?auto_58488 ?auto_58489 ) ) ( not ( = ?auto_58488 ?auto_58490 ) ) ( not ( = ?auto_58488 ?auto_58491 ) ) ( not ( = ?auto_58489 ?auto_58490 ) ) ( not ( = ?auto_58489 ?auto_58491 ) ) ( not ( = ?auto_58490 ?auto_58491 ) ) ( ON ?auto_58489 ?auto_58490 ) ( ON ?auto_58488 ?auto_58489 ) ( ON ?auto_58487 ?auto_58488 ) ( ON ?auto_58486 ?auto_58487 ) ( CLEAR ?auto_58484 ) ( ON ?auto_58485 ?auto_58486 ) ( CLEAR ?auto_58485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58482 ?auto_58483 ?auto_58484 ?auto_58485 )
      ( MAKE-9PILE ?auto_58482 ?auto_58483 ?auto_58484 ?auto_58485 ?auto_58486 ?auto_58487 ?auto_58488 ?auto_58489 ?auto_58490 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58501 - BLOCK
      ?auto_58502 - BLOCK
      ?auto_58503 - BLOCK
      ?auto_58504 - BLOCK
      ?auto_58505 - BLOCK
      ?auto_58506 - BLOCK
      ?auto_58507 - BLOCK
      ?auto_58508 - BLOCK
      ?auto_58509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58509 ) ( ON-TABLE ?auto_58501 ) ( ON ?auto_58502 ?auto_58501 ) ( ON ?auto_58503 ?auto_58502 ) ( not ( = ?auto_58501 ?auto_58502 ) ) ( not ( = ?auto_58501 ?auto_58503 ) ) ( not ( = ?auto_58501 ?auto_58504 ) ) ( not ( = ?auto_58501 ?auto_58505 ) ) ( not ( = ?auto_58501 ?auto_58506 ) ) ( not ( = ?auto_58501 ?auto_58507 ) ) ( not ( = ?auto_58501 ?auto_58508 ) ) ( not ( = ?auto_58501 ?auto_58509 ) ) ( not ( = ?auto_58502 ?auto_58503 ) ) ( not ( = ?auto_58502 ?auto_58504 ) ) ( not ( = ?auto_58502 ?auto_58505 ) ) ( not ( = ?auto_58502 ?auto_58506 ) ) ( not ( = ?auto_58502 ?auto_58507 ) ) ( not ( = ?auto_58502 ?auto_58508 ) ) ( not ( = ?auto_58502 ?auto_58509 ) ) ( not ( = ?auto_58503 ?auto_58504 ) ) ( not ( = ?auto_58503 ?auto_58505 ) ) ( not ( = ?auto_58503 ?auto_58506 ) ) ( not ( = ?auto_58503 ?auto_58507 ) ) ( not ( = ?auto_58503 ?auto_58508 ) ) ( not ( = ?auto_58503 ?auto_58509 ) ) ( not ( = ?auto_58504 ?auto_58505 ) ) ( not ( = ?auto_58504 ?auto_58506 ) ) ( not ( = ?auto_58504 ?auto_58507 ) ) ( not ( = ?auto_58504 ?auto_58508 ) ) ( not ( = ?auto_58504 ?auto_58509 ) ) ( not ( = ?auto_58505 ?auto_58506 ) ) ( not ( = ?auto_58505 ?auto_58507 ) ) ( not ( = ?auto_58505 ?auto_58508 ) ) ( not ( = ?auto_58505 ?auto_58509 ) ) ( not ( = ?auto_58506 ?auto_58507 ) ) ( not ( = ?auto_58506 ?auto_58508 ) ) ( not ( = ?auto_58506 ?auto_58509 ) ) ( not ( = ?auto_58507 ?auto_58508 ) ) ( not ( = ?auto_58507 ?auto_58509 ) ) ( not ( = ?auto_58508 ?auto_58509 ) ) ( ON ?auto_58508 ?auto_58509 ) ( ON ?auto_58507 ?auto_58508 ) ( ON ?auto_58506 ?auto_58507 ) ( ON ?auto_58505 ?auto_58506 ) ( CLEAR ?auto_58503 ) ( ON ?auto_58504 ?auto_58505 ) ( CLEAR ?auto_58504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58501 ?auto_58502 ?auto_58503 ?auto_58504 )
      ( MAKE-9PILE ?auto_58501 ?auto_58502 ?auto_58503 ?auto_58504 ?auto_58505 ?auto_58506 ?auto_58507 ?auto_58508 ?auto_58509 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58519 - BLOCK
      ?auto_58520 - BLOCK
      ?auto_58521 - BLOCK
      ?auto_58522 - BLOCK
      ?auto_58523 - BLOCK
      ?auto_58524 - BLOCK
      ?auto_58525 - BLOCK
      ?auto_58526 - BLOCK
      ?auto_58527 - BLOCK
    )
    :vars
    (
      ?auto_58528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58527 ?auto_58528 ) ( ON-TABLE ?auto_58519 ) ( ON ?auto_58520 ?auto_58519 ) ( not ( = ?auto_58519 ?auto_58520 ) ) ( not ( = ?auto_58519 ?auto_58521 ) ) ( not ( = ?auto_58519 ?auto_58522 ) ) ( not ( = ?auto_58519 ?auto_58523 ) ) ( not ( = ?auto_58519 ?auto_58524 ) ) ( not ( = ?auto_58519 ?auto_58525 ) ) ( not ( = ?auto_58519 ?auto_58526 ) ) ( not ( = ?auto_58519 ?auto_58527 ) ) ( not ( = ?auto_58519 ?auto_58528 ) ) ( not ( = ?auto_58520 ?auto_58521 ) ) ( not ( = ?auto_58520 ?auto_58522 ) ) ( not ( = ?auto_58520 ?auto_58523 ) ) ( not ( = ?auto_58520 ?auto_58524 ) ) ( not ( = ?auto_58520 ?auto_58525 ) ) ( not ( = ?auto_58520 ?auto_58526 ) ) ( not ( = ?auto_58520 ?auto_58527 ) ) ( not ( = ?auto_58520 ?auto_58528 ) ) ( not ( = ?auto_58521 ?auto_58522 ) ) ( not ( = ?auto_58521 ?auto_58523 ) ) ( not ( = ?auto_58521 ?auto_58524 ) ) ( not ( = ?auto_58521 ?auto_58525 ) ) ( not ( = ?auto_58521 ?auto_58526 ) ) ( not ( = ?auto_58521 ?auto_58527 ) ) ( not ( = ?auto_58521 ?auto_58528 ) ) ( not ( = ?auto_58522 ?auto_58523 ) ) ( not ( = ?auto_58522 ?auto_58524 ) ) ( not ( = ?auto_58522 ?auto_58525 ) ) ( not ( = ?auto_58522 ?auto_58526 ) ) ( not ( = ?auto_58522 ?auto_58527 ) ) ( not ( = ?auto_58522 ?auto_58528 ) ) ( not ( = ?auto_58523 ?auto_58524 ) ) ( not ( = ?auto_58523 ?auto_58525 ) ) ( not ( = ?auto_58523 ?auto_58526 ) ) ( not ( = ?auto_58523 ?auto_58527 ) ) ( not ( = ?auto_58523 ?auto_58528 ) ) ( not ( = ?auto_58524 ?auto_58525 ) ) ( not ( = ?auto_58524 ?auto_58526 ) ) ( not ( = ?auto_58524 ?auto_58527 ) ) ( not ( = ?auto_58524 ?auto_58528 ) ) ( not ( = ?auto_58525 ?auto_58526 ) ) ( not ( = ?auto_58525 ?auto_58527 ) ) ( not ( = ?auto_58525 ?auto_58528 ) ) ( not ( = ?auto_58526 ?auto_58527 ) ) ( not ( = ?auto_58526 ?auto_58528 ) ) ( not ( = ?auto_58527 ?auto_58528 ) ) ( ON ?auto_58526 ?auto_58527 ) ( ON ?auto_58525 ?auto_58526 ) ( ON ?auto_58524 ?auto_58525 ) ( ON ?auto_58523 ?auto_58524 ) ( ON ?auto_58522 ?auto_58523 ) ( CLEAR ?auto_58520 ) ( ON ?auto_58521 ?auto_58522 ) ( CLEAR ?auto_58521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58519 ?auto_58520 ?auto_58521 )
      ( MAKE-9PILE ?auto_58519 ?auto_58520 ?auto_58521 ?auto_58522 ?auto_58523 ?auto_58524 ?auto_58525 ?auto_58526 ?auto_58527 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58538 - BLOCK
      ?auto_58539 - BLOCK
      ?auto_58540 - BLOCK
      ?auto_58541 - BLOCK
      ?auto_58542 - BLOCK
      ?auto_58543 - BLOCK
      ?auto_58544 - BLOCK
      ?auto_58545 - BLOCK
      ?auto_58546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58546 ) ( ON-TABLE ?auto_58538 ) ( ON ?auto_58539 ?auto_58538 ) ( not ( = ?auto_58538 ?auto_58539 ) ) ( not ( = ?auto_58538 ?auto_58540 ) ) ( not ( = ?auto_58538 ?auto_58541 ) ) ( not ( = ?auto_58538 ?auto_58542 ) ) ( not ( = ?auto_58538 ?auto_58543 ) ) ( not ( = ?auto_58538 ?auto_58544 ) ) ( not ( = ?auto_58538 ?auto_58545 ) ) ( not ( = ?auto_58538 ?auto_58546 ) ) ( not ( = ?auto_58539 ?auto_58540 ) ) ( not ( = ?auto_58539 ?auto_58541 ) ) ( not ( = ?auto_58539 ?auto_58542 ) ) ( not ( = ?auto_58539 ?auto_58543 ) ) ( not ( = ?auto_58539 ?auto_58544 ) ) ( not ( = ?auto_58539 ?auto_58545 ) ) ( not ( = ?auto_58539 ?auto_58546 ) ) ( not ( = ?auto_58540 ?auto_58541 ) ) ( not ( = ?auto_58540 ?auto_58542 ) ) ( not ( = ?auto_58540 ?auto_58543 ) ) ( not ( = ?auto_58540 ?auto_58544 ) ) ( not ( = ?auto_58540 ?auto_58545 ) ) ( not ( = ?auto_58540 ?auto_58546 ) ) ( not ( = ?auto_58541 ?auto_58542 ) ) ( not ( = ?auto_58541 ?auto_58543 ) ) ( not ( = ?auto_58541 ?auto_58544 ) ) ( not ( = ?auto_58541 ?auto_58545 ) ) ( not ( = ?auto_58541 ?auto_58546 ) ) ( not ( = ?auto_58542 ?auto_58543 ) ) ( not ( = ?auto_58542 ?auto_58544 ) ) ( not ( = ?auto_58542 ?auto_58545 ) ) ( not ( = ?auto_58542 ?auto_58546 ) ) ( not ( = ?auto_58543 ?auto_58544 ) ) ( not ( = ?auto_58543 ?auto_58545 ) ) ( not ( = ?auto_58543 ?auto_58546 ) ) ( not ( = ?auto_58544 ?auto_58545 ) ) ( not ( = ?auto_58544 ?auto_58546 ) ) ( not ( = ?auto_58545 ?auto_58546 ) ) ( ON ?auto_58545 ?auto_58546 ) ( ON ?auto_58544 ?auto_58545 ) ( ON ?auto_58543 ?auto_58544 ) ( ON ?auto_58542 ?auto_58543 ) ( ON ?auto_58541 ?auto_58542 ) ( CLEAR ?auto_58539 ) ( ON ?auto_58540 ?auto_58541 ) ( CLEAR ?auto_58540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58538 ?auto_58539 ?auto_58540 )
      ( MAKE-9PILE ?auto_58538 ?auto_58539 ?auto_58540 ?auto_58541 ?auto_58542 ?auto_58543 ?auto_58544 ?auto_58545 ?auto_58546 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58556 - BLOCK
      ?auto_58557 - BLOCK
      ?auto_58558 - BLOCK
      ?auto_58559 - BLOCK
      ?auto_58560 - BLOCK
      ?auto_58561 - BLOCK
      ?auto_58562 - BLOCK
      ?auto_58563 - BLOCK
      ?auto_58564 - BLOCK
    )
    :vars
    (
      ?auto_58565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58564 ?auto_58565 ) ( ON-TABLE ?auto_58556 ) ( not ( = ?auto_58556 ?auto_58557 ) ) ( not ( = ?auto_58556 ?auto_58558 ) ) ( not ( = ?auto_58556 ?auto_58559 ) ) ( not ( = ?auto_58556 ?auto_58560 ) ) ( not ( = ?auto_58556 ?auto_58561 ) ) ( not ( = ?auto_58556 ?auto_58562 ) ) ( not ( = ?auto_58556 ?auto_58563 ) ) ( not ( = ?auto_58556 ?auto_58564 ) ) ( not ( = ?auto_58556 ?auto_58565 ) ) ( not ( = ?auto_58557 ?auto_58558 ) ) ( not ( = ?auto_58557 ?auto_58559 ) ) ( not ( = ?auto_58557 ?auto_58560 ) ) ( not ( = ?auto_58557 ?auto_58561 ) ) ( not ( = ?auto_58557 ?auto_58562 ) ) ( not ( = ?auto_58557 ?auto_58563 ) ) ( not ( = ?auto_58557 ?auto_58564 ) ) ( not ( = ?auto_58557 ?auto_58565 ) ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( not ( = ?auto_58558 ?auto_58562 ) ) ( not ( = ?auto_58558 ?auto_58563 ) ) ( not ( = ?auto_58558 ?auto_58564 ) ) ( not ( = ?auto_58558 ?auto_58565 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58562 ) ) ( not ( = ?auto_58559 ?auto_58563 ) ) ( not ( = ?auto_58559 ?auto_58564 ) ) ( not ( = ?auto_58559 ?auto_58565 ) ) ( not ( = ?auto_58560 ?auto_58561 ) ) ( not ( = ?auto_58560 ?auto_58562 ) ) ( not ( = ?auto_58560 ?auto_58563 ) ) ( not ( = ?auto_58560 ?auto_58564 ) ) ( not ( = ?auto_58560 ?auto_58565 ) ) ( not ( = ?auto_58561 ?auto_58562 ) ) ( not ( = ?auto_58561 ?auto_58563 ) ) ( not ( = ?auto_58561 ?auto_58564 ) ) ( not ( = ?auto_58561 ?auto_58565 ) ) ( not ( = ?auto_58562 ?auto_58563 ) ) ( not ( = ?auto_58562 ?auto_58564 ) ) ( not ( = ?auto_58562 ?auto_58565 ) ) ( not ( = ?auto_58563 ?auto_58564 ) ) ( not ( = ?auto_58563 ?auto_58565 ) ) ( not ( = ?auto_58564 ?auto_58565 ) ) ( ON ?auto_58563 ?auto_58564 ) ( ON ?auto_58562 ?auto_58563 ) ( ON ?auto_58561 ?auto_58562 ) ( ON ?auto_58560 ?auto_58561 ) ( ON ?auto_58559 ?auto_58560 ) ( ON ?auto_58558 ?auto_58559 ) ( CLEAR ?auto_58556 ) ( ON ?auto_58557 ?auto_58558 ) ( CLEAR ?auto_58557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58556 ?auto_58557 )
      ( MAKE-9PILE ?auto_58556 ?auto_58557 ?auto_58558 ?auto_58559 ?auto_58560 ?auto_58561 ?auto_58562 ?auto_58563 ?auto_58564 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58575 - BLOCK
      ?auto_58576 - BLOCK
      ?auto_58577 - BLOCK
      ?auto_58578 - BLOCK
      ?auto_58579 - BLOCK
      ?auto_58580 - BLOCK
      ?auto_58581 - BLOCK
      ?auto_58582 - BLOCK
      ?auto_58583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58583 ) ( ON-TABLE ?auto_58575 ) ( not ( = ?auto_58575 ?auto_58576 ) ) ( not ( = ?auto_58575 ?auto_58577 ) ) ( not ( = ?auto_58575 ?auto_58578 ) ) ( not ( = ?auto_58575 ?auto_58579 ) ) ( not ( = ?auto_58575 ?auto_58580 ) ) ( not ( = ?auto_58575 ?auto_58581 ) ) ( not ( = ?auto_58575 ?auto_58582 ) ) ( not ( = ?auto_58575 ?auto_58583 ) ) ( not ( = ?auto_58576 ?auto_58577 ) ) ( not ( = ?auto_58576 ?auto_58578 ) ) ( not ( = ?auto_58576 ?auto_58579 ) ) ( not ( = ?auto_58576 ?auto_58580 ) ) ( not ( = ?auto_58576 ?auto_58581 ) ) ( not ( = ?auto_58576 ?auto_58582 ) ) ( not ( = ?auto_58576 ?auto_58583 ) ) ( not ( = ?auto_58577 ?auto_58578 ) ) ( not ( = ?auto_58577 ?auto_58579 ) ) ( not ( = ?auto_58577 ?auto_58580 ) ) ( not ( = ?auto_58577 ?auto_58581 ) ) ( not ( = ?auto_58577 ?auto_58582 ) ) ( not ( = ?auto_58577 ?auto_58583 ) ) ( not ( = ?auto_58578 ?auto_58579 ) ) ( not ( = ?auto_58578 ?auto_58580 ) ) ( not ( = ?auto_58578 ?auto_58581 ) ) ( not ( = ?auto_58578 ?auto_58582 ) ) ( not ( = ?auto_58578 ?auto_58583 ) ) ( not ( = ?auto_58579 ?auto_58580 ) ) ( not ( = ?auto_58579 ?auto_58581 ) ) ( not ( = ?auto_58579 ?auto_58582 ) ) ( not ( = ?auto_58579 ?auto_58583 ) ) ( not ( = ?auto_58580 ?auto_58581 ) ) ( not ( = ?auto_58580 ?auto_58582 ) ) ( not ( = ?auto_58580 ?auto_58583 ) ) ( not ( = ?auto_58581 ?auto_58582 ) ) ( not ( = ?auto_58581 ?auto_58583 ) ) ( not ( = ?auto_58582 ?auto_58583 ) ) ( ON ?auto_58582 ?auto_58583 ) ( ON ?auto_58581 ?auto_58582 ) ( ON ?auto_58580 ?auto_58581 ) ( ON ?auto_58579 ?auto_58580 ) ( ON ?auto_58578 ?auto_58579 ) ( ON ?auto_58577 ?auto_58578 ) ( CLEAR ?auto_58575 ) ( ON ?auto_58576 ?auto_58577 ) ( CLEAR ?auto_58576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58575 ?auto_58576 )
      ( MAKE-9PILE ?auto_58575 ?auto_58576 ?auto_58577 ?auto_58578 ?auto_58579 ?auto_58580 ?auto_58581 ?auto_58582 ?auto_58583 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58593 - BLOCK
      ?auto_58594 - BLOCK
      ?auto_58595 - BLOCK
      ?auto_58596 - BLOCK
      ?auto_58597 - BLOCK
      ?auto_58598 - BLOCK
      ?auto_58599 - BLOCK
      ?auto_58600 - BLOCK
      ?auto_58601 - BLOCK
    )
    :vars
    (
      ?auto_58602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58601 ?auto_58602 ) ( not ( = ?auto_58593 ?auto_58594 ) ) ( not ( = ?auto_58593 ?auto_58595 ) ) ( not ( = ?auto_58593 ?auto_58596 ) ) ( not ( = ?auto_58593 ?auto_58597 ) ) ( not ( = ?auto_58593 ?auto_58598 ) ) ( not ( = ?auto_58593 ?auto_58599 ) ) ( not ( = ?auto_58593 ?auto_58600 ) ) ( not ( = ?auto_58593 ?auto_58601 ) ) ( not ( = ?auto_58593 ?auto_58602 ) ) ( not ( = ?auto_58594 ?auto_58595 ) ) ( not ( = ?auto_58594 ?auto_58596 ) ) ( not ( = ?auto_58594 ?auto_58597 ) ) ( not ( = ?auto_58594 ?auto_58598 ) ) ( not ( = ?auto_58594 ?auto_58599 ) ) ( not ( = ?auto_58594 ?auto_58600 ) ) ( not ( = ?auto_58594 ?auto_58601 ) ) ( not ( = ?auto_58594 ?auto_58602 ) ) ( not ( = ?auto_58595 ?auto_58596 ) ) ( not ( = ?auto_58595 ?auto_58597 ) ) ( not ( = ?auto_58595 ?auto_58598 ) ) ( not ( = ?auto_58595 ?auto_58599 ) ) ( not ( = ?auto_58595 ?auto_58600 ) ) ( not ( = ?auto_58595 ?auto_58601 ) ) ( not ( = ?auto_58595 ?auto_58602 ) ) ( not ( = ?auto_58596 ?auto_58597 ) ) ( not ( = ?auto_58596 ?auto_58598 ) ) ( not ( = ?auto_58596 ?auto_58599 ) ) ( not ( = ?auto_58596 ?auto_58600 ) ) ( not ( = ?auto_58596 ?auto_58601 ) ) ( not ( = ?auto_58596 ?auto_58602 ) ) ( not ( = ?auto_58597 ?auto_58598 ) ) ( not ( = ?auto_58597 ?auto_58599 ) ) ( not ( = ?auto_58597 ?auto_58600 ) ) ( not ( = ?auto_58597 ?auto_58601 ) ) ( not ( = ?auto_58597 ?auto_58602 ) ) ( not ( = ?auto_58598 ?auto_58599 ) ) ( not ( = ?auto_58598 ?auto_58600 ) ) ( not ( = ?auto_58598 ?auto_58601 ) ) ( not ( = ?auto_58598 ?auto_58602 ) ) ( not ( = ?auto_58599 ?auto_58600 ) ) ( not ( = ?auto_58599 ?auto_58601 ) ) ( not ( = ?auto_58599 ?auto_58602 ) ) ( not ( = ?auto_58600 ?auto_58601 ) ) ( not ( = ?auto_58600 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58602 ) ) ( ON ?auto_58600 ?auto_58601 ) ( ON ?auto_58599 ?auto_58600 ) ( ON ?auto_58598 ?auto_58599 ) ( ON ?auto_58597 ?auto_58598 ) ( ON ?auto_58596 ?auto_58597 ) ( ON ?auto_58595 ?auto_58596 ) ( ON ?auto_58594 ?auto_58595 ) ( ON ?auto_58593 ?auto_58594 ) ( CLEAR ?auto_58593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58593 )
      ( MAKE-9PILE ?auto_58593 ?auto_58594 ?auto_58595 ?auto_58596 ?auto_58597 ?auto_58598 ?auto_58599 ?auto_58600 ?auto_58601 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58612 - BLOCK
      ?auto_58613 - BLOCK
      ?auto_58614 - BLOCK
      ?auto_58615 - BLOCK
      ?auto_58616 - BLOCK
      ?auto_58617 - BLOCK
      ?auto_58618 - BLOCK
      ?auto_58619 - BLOCK
      ?auto_58620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58620 ) ( not ( = ?auto_58612 ?auto_58613 ) ) ( not ( = ?auto_58612 ?auto_58614 ) ) ( not ( = ?auto_58612 ?auto_58615 ) ) ( not ( = ?auto_58612 ?auto_58616 ) ) ( not ( = ?auto_58612 ?auto_58617 ) ) ( not ( = ?auto_58612 ?auto_58618 ) ) ( not ( = ?auto_58612 ?auto_58619 ) ) ( not ( = ?auto_58612 ?auto_58620 ) ) ( not ( = ?auto_58613 ?auto_58614 ) ) ( not ( = ?auto_58613 ?auto_58615 ) ) ( not ( = ?auto_58613 ?auto_58616 ) ) ( not ( = ?auto_58613 ?auto_58617 ) ) ( not ( = ?auto_58613 ?auto_58618 ) ) ( not ( = ?auto_58613 ?auto_58619 ) ) ( not ( = ?auto_58613 ?auto_58620 ) ) ( not ( = ?auto_58614 ?auto_58615 ) ) ( not ( = ?auto_58614 ?auto_58616 ) ) ( not ( = ?auto_58614 ?auto_58617 ) ) ( not ( = ?auto_58614 ?auto_58618 ) ) ( not ( = ?auto_58614 ?auto_58619 ) ) ( not ( = ?auto_58614 ?auto_58620 ) ) ( not ( = ?auto_58615 ?auto_58616 ) ) ( not ( = ?auto_58615 ?auto_58617 ) ) ( not ( = ?auto_58615 ?auto_58618 ) ) ( not ( = ?auto_58615 ?auto_58619 ) ) ( not ( = ?auto_58615 ?auto_58620 ) ) ( not ( = ?auto_58616 ?auto_58617 ) ) ( not ( = ?auto_58616 ?auto_58618 ) ) ( not ( = ?auto_58616 ?auto_58619 ) ) ( not ( = ?auto_58616 ?auto_58620 ) ) ( not ( = ?auto_58617 ?auto_58618 ) ) ( not ( = ?auto_58617 ?auto_58619 ) ) ( not ( = ?auto_58617 ?auto_58620 ) ) ( not ( = ?auto_58618 ?auto_58619 ) ) ( not ( = ?auto_58618 ?auto_58620 ) ) ( not ( = ?auto_58619 ?auto_58620 ) ) ( ON ?auto_58619 ?auto_58620 ) ( ON ?auto_58618 ?auto_58619 ) ( ON ?auto_58617 ?auto_58618 ) ( ON ?auto_58616 ?auto_58617 ) ( ON ?auto_58615 ?auto_58616 ) ( ON ?auto_58614 ?auto_58615 ) ( ON ?auto_58613 ?auto_58614 ) ( ON ?auto_58612 ?auto_58613 ) ( CLEAR ?auto_58612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58612 )
      ( MAKE-9PILE ?auto_58612 ?auto_58613 ?auto_58614 ?auto_58615 ?auto_58616 ?auto_58617 ?auto_58618 ?auto_58619 ?auto_58620 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_58630 - BLOCK
      ?auto_58631 - BLOCK
      ?auto_58632 - BLOCK
      ?auto_58633 - BLOCK
      ?auto_58634 - BLOCK
      ?auto_58635 - BLOCK
      ?auto_58636 - BLOCK
      ?auto_58637 - BLOCK
      ?auto_58638 - BLOCK
    )
    :vars
    (
      ?auto_58639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58630 ?auto_58631 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( not ( = ?auto_58630 ?auto_58633 ) ) ( not ( = ?auto_58630 ?auto_58634 ) ) ( not ( = ?auto_58630 ?auto_58635 ) ) ( not ( = ?auto_58630 ?auto_58636 ) ) ( not ( = ?auto_58630 ?auto_58637 ) ) ( not ( = ?auto_58630 ?auto_58638 ) ) ( not ( = ?auto_58631 ?auto_58632 ) ) ( not ( = ?auto_58631 ?auto_58633 ) ) ( not ( = ?auto_58631 ?auto_58634 ) ) ( not ( = ?auto_58631 ?auto_58635 ) ) ( not ( = ?auto_58631 ?auto_58636 ) ) ( not ( = ?auto_58631 ?auto_58637 ) ) ( not ( = ?auto_58631 ?auto_58638 ) ) ( not ( = ?auto_58632 ?auto_58633 ) ) ( not ( = ?auto_58632 ?auto_58634 ) ) ( not ( = ?auto_58632 ?auto_58635 ) ) ( not ( = ?auto_58632 ?auto_58636 ) ) ( not ( = ?auto_58632 ?auto_58637 ) ) ( not ( = ?auto_58632 ?auto_58638 ) ) ( not ( = ?auto_58633 ?auto_58634 ) ) ( not ( = ?auto_58633 ?auto_58635 ) ) ( not ( = ?auto_58633 ?auto_58636 ) ) ( not ( = ?auto_58633 ?auto_58637 ) ) ( not ( = ?auto_58633 ?auto_58638 ) ) ( not ( = ?auto_58634 ?auto_58635 ) ) ( not ( = ?auto_58634 ?auto_58636 ) ) ( not ( = ?auto_58634 ?auto_58637 ) ) ( not ( = ?auto_58634 ?auto_58638 ) ) ( not ( = ?auto_58635 ?auto_58636 ) ) ( not ( = ?auto_58635 ?auto_58637 ) ) ( not ( = ?auto_58635 ?auto_58638 ) ) ( not ( = ?auto_58636 ?auto_58637 ) ) ( not ( = ?auto_58636 ?auto_58638 ) ) ( not ( = ?auto_58637 ?auto_58638 ) ) ( ON ?auto_58630 ?auto_58639 ) ( not ( = ?auto_58638 ?auto_58639 ) ) ( not ( = ?auto_58637 ?auto_58639 ) ) ( not ( = ?auto_58636 ?auto_58639 ) ) ( not ( = ?auto_58635 ?auto_58639 ) ) ( not ( = ?auto_58634 ?auto_58639 ) ) ( not ( = ?auto_58633 ?auto_58639 ) ) ( not ( = ?auto_58632 ?auto_58639 ) ) ( not ( = ?auto_58631 ?auto_58639 ) ) ( not ( = ?auto_58630 ?auto_58639 ) ) ( ON ?auto_58631 ?auto_58630 ) ( ON ?auto_58632 ?auto_58631 ) ( ON ?auto_58633 ?auto_58632 ) ( ON ?auto_58634 ?auto_58633 ) ( ON ?auto_58635 ?auto_58634 ) ( ON ?auto_58636 ?auto_58635 ) ( ON ?auto_58637 ?auto_58636 ) ( ON ?auto_58638 ?auto_58637 ) ( CLEAR ?auto_58638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_58638 ?auto_58637 ?auto_58636 ?auto_58635 ?auto_58634 ?auto_58633 ?auto_58632 ?auto_58631 ?auto_58630 )
      ( MAKE-9PILE ?auto_58630 ?auto_58631 ?auto_58632 ?auto_58633 ?auto_58634 ?auto_58635 ?auto_58636 ?auto_58637 ?auto_58638 ) )
  )

)

