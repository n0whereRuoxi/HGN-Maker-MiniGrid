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
      ?auto_103419 - BLOCK
    )
    :vars
    (
      ?auto_103420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103419 ?auto_103420 ) ( CLEAR ?auto_103419 ) ( HAND-EMPTY ) ( not ( = ?auto_103419 ?auto_103420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103419 ?auto_103420 )
      ( !PUTDOWN ?auto_103419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103422 - BLOCK
    )
    :vars
    (
      ?auto_103423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103422 ?auto_103423 ) ( CLEAR ?auto_103422 ) ( HAND-EMPTY ) ( not ( = ?auto_103422 ?auto_103423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103422 ?auto_103423 )
      ( !PUTDOWN ?auto_103422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103426 - BLOCK
      ?auto_103427 - BLOCK
    )
    :vars
    (
      ?auto_103428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103426 ) ( ON ?auto_103427 ?auto_103428 ) ( CLEAR ?auto_103427 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103426 ) ( not ( = ?auto_103426 ?auto_103427 ) ) ( not ( = ?auto_103426 ?auto_103428 ) ) ( not ( = ?auto_103427 ?auto_103428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103427 ?auto_103428 )
      ( !STACK ?auto_103427 ?auto_103426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103431 - BLOCK
      ?auto_103432 - BLOCK
    )
    :vars
    (
      ?auto_103433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103431 ) ( ON ?auto_103432 ?auto_103433 ) ( CLEAR ?auto_103432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103431 ) ( not ( = ?auto_103431 ?auto_103432 ) ) ( not ( = ?auto_103431 ?auto_103433 ) ) ( not ( = ?auto_103432 ?auto_103433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103432 ?auto_103433 )
      ( !STACK ?auto_103432 ?auto_103431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103436 - BLOCK
      ?auto_103437 - BLOCK
    )
    :vars
    (
      ?auto_103438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103437 ?auto_103438 ) ( not ( = ?auto_103436 ?auto_103437 ) ) ( not ( = ?auto_103436 ?auto_103438 ) ) ( not ( = ?auto_103437 ?auto_103438 ) ) ( ON ?auto_103436 ?auto_103437 ) ( CLEAR ?auto_103436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103436 )
      ( MAKE-2PILE ?auto_103436 ?auto_103437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103441 - BLOCK
      ?auto_103442 - BLOCK
    )
    :vars
    (
      ?auto_103443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103442 ?auto_103443 ) ( not ( = ?auto_103441 ?auto_103442 ) ) ( not ( = ?auto_103441 ?auto_103443 ) ) ( not ( = ?auto_103442 ?auto_103443 ) ) ( ON ?auto_103441 ?auto_103442 ) ( CLEAR ?auto_103441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103441 )
      ( MAKE-2PILE ?auto_103441 ?auto_103442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103447 - BLOCK
      ?auto_103448 - BLOCK
      ?auto_103449 - BLOCK
    )
    :vars
    (
      ?auto_103450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103448 ) ( ON ?auto_103449 ?auto_103450 ) ( CLEAR ?auto_103449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103447 ) ( ON ?auto_103448 ?auto_103447 ) ( not ( = ?auto_103447 ?auto_103448 ) ) ( not ( = ?auto_103447 ?auto_103449 ) ) ( not ( = ?auto_103447 ?auto_103450 ) ) ( not ( = ?auto_103448 ?auto_103449 ) ) ( not ( = ?auto_103448 ?auto_103450 ) ) ( not ( = ?auto_103449 ?auto_103450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103449 ?auto_103450 )
      ( !STACK ?auto_103449 ?auto_103448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103454 - BLOCK
      ?auto_103455 - BLOCK
      ?auto_103456 - BLOCK
    )
    :vars
    (
      ?auto_103457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103455 ) ( ON ?auto_103456 ?auto_103457 ) ( CLEAR ?auto_103456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103454 ) ( ON ?auto_103455 ?auto_103454 ) ( not ( = ?auto_103454 ?auto_103455 ) ) ( not ( = ?auto_103454 ?auto_103456 ) ) ( not ( = ?auto_103454 ?auto_103457 ) ) ( not ( = ?auto_103455 ?auto_103456 ) ) ( not ( = ?auto_103455 ?auto_103457 ) ) ( not ( = ?auto_103456 ?auto_103457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103456 ?auto_103457 )
      ( !STACK ?auto_103456 ?auto_103455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103461 - BLOCK
      ?auto_103462 - BLOCK
      ?auto_103463 - BLOCK
    )
    :vars
    (
      ?auto_103464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103463 ?auto_103464 ) ( ON-TABLE ?auto_103461 ) ( not ( = ?auto_103461 ?auto_103462 ) ) ( not ( = ?auto_103461 ?auto_103463 ) ) ( not ( = ?auto_103461 ?auto_103464 ) ) ( not ( = ?auto_103462 ?auto_103463 ) ) ( not ( = ?auto_103462 ?auto_103464 ) ) ( not ( = ?auto_103463 ?auto_103464 ) ) ( CLEAR ?auto_103461 ) ( ON ?auto_103462 ?auto_103463 ) ( CLEAR ?auto_103462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103461 ?auto_103462 )
      ( MAKE-3PILE ?auto_103461 ?auto_103462 ?auto_103463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103468 - BLOCK
      ?auto_103469 - BLOCK
      ?auto_103470 - BLOCK
    )
    :vars
    (
      ?auto_103471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103470 ?auto_103471 ) ( ON-TABLE ?auto_103468 ) ( not ( = ?auto_103468 ?auto_103469 ) ) ( not ( = ?auto_103468 ?auto_103470 ) ) ( not ( = ?auto_103468 ?auto_103471 ) ) ( not ( = ?auto_103469 ?auto_103470 ) ) ( not ( = ?auto_103469 ?auto_103471 ) ) ( not ( = ?auto_103470 ?auto_103471 ) ) ( CLEAR ?auto_103468 ) ( ON ?auto_103469 ?auto_103470 ) ( CLEAR ?auto_103469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103468 ?auto_103469 )
      ( MAKE-3PILE ?auto_103468 ?auto_103469 ?auto_103470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103475 - BLOCK
      ?auto_103476 - BLOCK
      ?auto_103477 - BLOCK
    )
    :vars
    (
      ?auto_103478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103477 ?auto_103478 ) ( not ( = ?auto_103475 ?auto_103476 ) ) ( not ( = ?auto_103475 ?auto_103477 ) ) ( not ( = ?auto_103475 ?auto_103478 ) ) ( not ( = ?auto_103476 ?auto_103477 ) ) ( not ( = ?auto_103476 ?auto_103478 ) ) ( not ( = ?auto_103477 ?auto_103478 ) ) ( ON ?auto_103476 ?auto_103477 ) ( ON ?auto_103475 ?auto_103476 ) ( CLEAR ?auto_103475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103475 )
      ( MAKE-3PILE ?auto_103475 ?auto_103476 ?auto_103477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103482 - BLOCK
      ?auto_103483 - BLOCK
      ?auto_103484 - BLOCK
    )
    :vars
    (
      ?auto_103485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103484 ?auto_103485 ) ( not ( = ?auto_103482 ?auto_103483 ) ) ( not ( = ?auto_103482 ?auto_103484 ) ) ( not ( = ?auto_103482 ?auto_103485 ) ) ( not ( = ?auto_103483 ?auto_103484 ) ) ( not ( = ?auto_103483 ?auto_103485 ) ) ( not ( = ?auto_103484 ?auto_103485 ) ) ( ON ?auto_103483 ?auto_103484 ) ( ON ?auto_103482 ?auto_103483 ) ( CLEAR ?auto_103482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103482 )
      ( MAKE-3PILE ?auto_103482 ?auto_103483 ?auto_103484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103490 - BLOCK
      ?auto_103491 - BLOCK
      ?auto_103492 - BLOCK
      ?auto_103493 - BLOCK
    )
    :vars
    (
      ?auto_103494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103492 ) ( ON ?auto_103493 ?auto_103494 ) ( CLEAR ?auto_103493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103490 ) ( ON ?auto_103491 ?auto_103490 ) ( ON ?auto_103492 ?auto_103491 ) ( not ( = ?auto_103490 ?auto_103491 ) ) ( not ( = ?auto_103490 ?auto_103492 ) ) ( not ( = ?auto_103490 ?auto_103493 ) ) ( not ( = ?auto_103490 ?auto_103494 ) ) ( not ( = ?auto_103491 ?auto_103492 ) ) ( not ( = ?auto_103491 ?auto_103493 ) ) ( not ( = ?auto_103491 ?auto_103494 ) ) ( not ( = ?auto_103492 ?auto_103493 ) ) ( not ( = ?auto_103492 ?auto_103494 ) ) ( not ( = ?auto_103493 ?auto_103494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103493 ?auto_103494 )
      ( !STACK ?auto_103493 ?auto_103492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103499 - BLOCK
      ?auto_103500 - BLOCK
      ?auto_103501 - BLOCK
      ?auto_103502 - BLOCK
    )
    :vars
    (
      ?auto_103503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103501 ) ( ON ?auto_103502 ?auto_103503 ) ( CLEAR ?auto_103502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103499 ) ( ON ?auto_103500 ?auto_103499 ) ( ON ?auto_103501 ?auto_103500 ) ( not ( = ?auto_103499 ?auto_103500 ) ) ( not ( = ?auto_103499 ?auto_103501 ) ) ( not ( = ?auto_103499 ?auto_103502 ) ) ( not ( = ?auto_103499 ?auto_103503 ) ) ( not ( = ?auto_103500 ?auto_103501 ) ) ( not ( = ?auto_103500 ?auto_103502 ) ) ( not ( = ?auto_103500 ?auto_103503 ) ) ( not ( = ?auto_103501 ?auto_103502 ) ) ( not ( = ?auto_103501 ?auto_103503 ) ) ( not ( = ?auto_103502 ?auto_103503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103502 ?auto_103503 )
      ( !STACK ?auto_103502 ?auto_103501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103508 - BLOCK
      ?auto_103509 - BLOCK
      ?auto_103510 - BLOCK
      ?auto_103511 - BLOCK
    )
    :vars
    (
      ?auto_103512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103511 ?auto_103512 ) ( ON-TABLE ?auto_103508 ) ( ON ?auto_103509 ?auto_103508 ) ( not ( = ?auto_103508 ?auto_103509 ) ) ( not ( = ?auto_103508 ?auto_103510 ) ) ( not ( = ?auto_103508 ?auto_103511 ) ) ( not ( = ?auto_103508 ?auto_103512 ) ) ( not ( = ?auto_103509 ?auto_103510 ) ) ( not ( = ?auto_103509 ?auto_103511 ) ) ( not ( = ?auto_103509 ?auto_103512 ) ) ( not ( = ?auto_103510 ?auto_103511 ) ) ( not ( = ?auto_103510 ?auto_103512 ) ) ( not ( = ?auto_103511 ?auto_103512 ) ) ( CLEAR ?auto_103509 ) ( ON ?auto_103510 ?auto_103511 ) ( CLEAR ?auto_103510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103508 ?auto_103509 ?auto_103510 )
      ( MAKE-4PILE ?auto_103508 ?auto_103509 ?auto_103510 ?auto_103511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103517 - BLOCK
      ?auto_103518 - BLOCK
      ?auto_103519 - BLOCK
      ?auto_103520 - BLOCK
    )
    :vars
    (
      ?auto_103521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103520 ?auto_103521 ) ( ON-TABLE ?auto_103517 ) ( ON ?auto_103518 ?auto_103517 ) ( not ( = ?auto_103517 ?auto_103518 ) ) ( not ( = ?auto_103517 ?auto_103519 ) ) ( not ( = ?auto_103517 ?auto_103520 ) ) ( not ( = ?auto_103517 ?auto_103521 ) ) ( not ( = ?auto_103518 ?auto_103519 ) ) ( not ( = ?auto_103518 ?auto_103520 ) ) ( not ( = ?auto_103518 ?auto_103521 ) ) ( not ( = ?auto_103519 ?auto_103520 ) ) ( not ( = ?auto_103519 ?auto_103521 ) ) ( not ( = ?auto_103520 ?auto_103521 ) ) ( CLEAR ?auto_103518 ) ( ON ?auto_103519 ?auto_103520 ) ( CLEAR ?auto_103519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103517 ?auto_103518 ?auto_103519 )
      ( MAKE-4PILE ?auto_103517 ?auto_103518 ?auto_103519 ?auto_103520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103526 - BLOCK
      ?auto_103527 - BLOCK
      ?auto_103528 - BLOCK
      ?auto_103529 - BLOCK
    )
    :vars
    (
      ?auto_103530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103529 ?auto_103530 ) ( ON-TABLE ?auto_103526 ) ( not ( = ?auto_103526 ?auto_103527 ) ) ( not ( = ?auto_103526 ?auto_103528 ) ) ( not ( = ?auto_103526 ?auto_103529 ) ) ( not ( = ?auto_103526 ?auto_103530 ) ) ( not ( = ?auto_103527 ?auto_103528 ) ) ( not ( = ?auto_103527 ?auto_103529 ) ) ( not ( = ?auto_103527 ?auto_103530 ) ) ( not ( = ?auto_103528 ?auto_103529 ) ) ( not ( = ?auto_103528 ?auto_103530 ) ) ( not ( = ?auto_103529 ?auto_103530 ) ) ( ON ?auto_103528 ?auto_103529 ) ( CLEAR ?auto_103526 ) ( ON ?auto_103527 ?auto_103528 ) ( CLEAR ?auto_103527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103526 ?auto_103527 )
      ( MAKE-4PILE ?auto_103526 ?auto_103527 ?auto_103528 ?auto_103529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103535 - BLOCK
      ?auto_103536 - BLOCK
      ?auto_103537 - BLOCK
      ?auto_103538 - BLOCK
    )
    :vars
    (
      ?auto_103539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103538 ?auto_103539 ) ( ON-TABLE ?auto_103535 ) ( not ( = ?auto_103535 ?auto_103536 ) ) ( not ( = ?auto_103535 ?auto_103537 ) ) ( not ( = ?auto_103535 ?auto_103538 ) ) ( not ( = ?auto_103535 ?auto_103539 ) ) ( not ( = ?auto_103536 ?auto_103537 ) ) ( not ( = ?auto_103536 ?auto_103538 ) ) ( not ( = ?auto_103536 ?auto_103539 ) ) ( not ( = ?auto_103537 ?auto_103538 ) ) ( not ( = ?auto_103537 ?auto_103539 ) ) ( not ( = ?auto_103538 ?auto_103539 ) ) ( ON ?auto_103537 ?auto_103538 ) ( CLEAR ?auto_103535 ) ( ON ?auto_103536 ?auto_103537 ) ( CLEAR ?auto_103536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103535 ?auto_103536 )
      ( MAKE-4PILE ?auto_103535 ?auto_103536 ?auto_103537 ?auto_103538 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103544 - BLOCK
      ?auto_103545 - BLOCK
      ?auto_103546 - BLOCK
      ?auto_103547 - BLOCK
    )
    :vars
    (
      ?auto_103548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103547 ?auto_103548 ) ( not ( = ?auto_103544 ?auto_103545 ) ) ( not ( = ?auto_103544 ?auto_103546 ) ) ( not ( = ?auto_103544 ?auto_103547 ) ) ( not ( = ?auto_103544 ?auto_103548 ) ) ( not ( = ?auto_103545 ?auto_103546 ) ) ( not ( = ?auto_103545 ?auto_103547 ) ) ( not ( = ?auto_103545 ?auto_103548 ) ) ( not ( = ?auto_103546 ?auto_103547 ) ) ( not ( = ?auto_103546 ?auto_103548 ) ) ( not ( = ?auto_103547 ?auto_103548 ) ) ( ON ?auto_103546 ?auto_103547 ) ( ON ?auto_103545 ?auto_103546 ) ( ON ?auto_103544 ?auto_103545 ) ( CLEAR ?auto_103544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103544 )
      ( MAKE-4PILE ?auto_103544 ?auto_103545 ?auto_103546 ?auto_103547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103553 - BLOCK
      ?auto_103554 - BLOCK
      ?auto_103555 - BLOCK
      ?auto_103556 - BLOCK
    )
    :vars
    (
      ?auto_103557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103556 ?auto_103557 ) ( not ( = ?auto_103553 ?auto_103554 ) ) ( not ( = ?auto_103553 ?auto_103555 ) ) ( not ( = ?auto_103553 ?auto_103556 ) ) ( not ( = ?auto_103553 ?auto_103557 ) ) ( not ( = ?auto_103554 ?auto_103555 ) ) ( not ( = ?auto_103554 ?auto_103556 ) ) ( not ( = ?auto_103554 ?auto_103557 ) ) ( not ( = ?auto_103555 ?auto_103556 ) ) ( not ( = ?auto_103555 ?auto_103557 ) ) ( not ( = ?auto_103556 ?auto_103557 ) ) ( ON ?auto_103555 ?auto_103556 ) ( ON ?auto_103554 ?auto_103555 ) ( ON ?auto_103553 ?auto_103554 ) ( CLEAR ?auto_103553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103553 )
      ( MAKE-4PILE ?auto_103553 ?auto_103554 ?auto_103555 ?auto_103556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103563 - BLOCK
      ?auto_103564 - BLOCK
      ?auto_103565 - BLOCK
      ?auto_103566 - BLOCK
      ?auto_103567 - BLOCK
    )
    :vars
    (
      ?auto_103568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103566 ) ( ON ?auto_103567 ?auto_103568 ) ( CLEAR ?auto_103567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103563 ) ( ON ?auto_103564 ?auto_103563 ) ( ON ?auto_103565 ?auto_103564 ) ( ON ?auto_103566 ?auto_103565 ) ( not ( = ?auto_103563 ?auto_103564 ) ) ( not ( = ?auto_103563 ?auto_103565 ) ) ( not ( = ?auto_103563 ?auto_103566 ) ) ( not ( = ?auto_103563 ?auto_103567 ) ) ( not ( = ?auto_103563 ?auto_103568 ) ) ( not ( = ?auto_103564 ?auto_103565 ) ) ( not ( = ?auto_103564 ?auto_103566 ) ) ( not ( = ?auto_103564 ?auto_103567 ) ) ( not ( = ?auto_103564 ?auto_103568 ) ) ( not ( = ?auto_103565 ?auto_103566 ) ) ( not ( = ?auto_103565 ?auto_103567 ) ) ( not ( = ?auto_103565 ?auto_103568 ) ) ( not ( = ?auto_103566 ?auto_103567 ) ) ( not ( = ?auto_103566 ?auto_103568 ) ) ( not ( = ?auto_103567 ?auto_103568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103567 ?auto_103568 )
      ( !STACK ?auto_103567 ?auto_103566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103574 - BLOCK
      ?auto_103575 - BLOCK
      ?auto_103576 - BLOCK
      ?auto_103577 - BLOCK
      ?auto_103578 - BLOCK
    )
    :vars
    (
      ?auto_103579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103577 ) ( ON ?auto_103578 ?auto_103579 ) ( CLEAR ?auto_103578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103574 ) ( ON ?auto_103575 ?auto_103574 ) ( ON ?auto_103576 ?auto_103575 ) ( ON ?auto_103577 ?auto_103576 ) ( not ( = ?auto_103574 ?auto_103575 ) ) ( not ( = ?auto_103574 ?auto_103576 ) ) ( not ( = ?auto_103574 ?auto_103577 ) ) ( not ( = ?auto_103574 ?auto_103578 ) ) ( not ( = ?auto_103574 ?auto_103579 ) ) ( not ( = ?auto_103575 ?auto_103576 ) ) ( not ( = ?auto_103575 ?auto_103577 ) ) ( not ( = ?auto_103575 ?auto_103578 ) ) ( not ( = ?auto_103575 ?auto_103579 ) ) ( not ( = ?auto_103576 ?auto_103577 ) ) ( not ( = ?auto_103576 ?auto_103578 ) ) ( not ( = ?auto_103576 ?auto_103579 ) ) ( not ( = ?auto_103577 ?auto_103578 ) ) ( not ( = ?auto_103577 ?auto_103579 ) ) ( not ( = ?auto_103578 ?auto_103579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103578 ?auto_103579 )
      ( !STACK ?auto_103578 ?auto_103577 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103585 - BLOCK
      ?auto_103586 - BLOCK
      ?auto_103587 - BLOCK
      ?auto_103588 - BLOCK
      ?auto_103589 - BLOCK
    )
    :vars
    (
      ?auto_103590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103589 ?auto_103590 ) ( ON-TABLE ?auto_103585 ) ( ON ?auto_103586 ?auto_103585 ) ( ON ?auto_103587 ?auto_103586 ) ( not ( = ?auto_103585 ?auto_103586 ) ) ( not ( = ?auto_103585 ?auto_103587 ) ) ( not ( = ?auto_103585 ?auto_103588 ) ) ( not ( = ?auto_103585 ?auto_103589 ) ) ( not ( = ?auto_103585 ?auto_103590 ) ) ( not ( = ?auto_103586 ?auto_103587 ) ) ( not ( = ?auto_103586 ?auto_103588 ) ) ( not ( = ?auto_103586 ?auto_103589 ) ) ( not ( = ?auto_103586 ?auto_103590 ) ) ( not ( = ?auto_103587 ?auto_103588 ) ) ( not ( = ?auto_103587 ?auto_103589 ) ) ( not ( = ?auto_103587 ?auto_103590 ) ) ( not ( = ?auto_103588 ?auto_103589 ) ) ( not ( = ?auto_103588 ?auto_103590 ) ) ( not ( = ?auto_103589 ?auto_103590 ) ) ( CLEAR ?auto_103587 ) ( ON ?auto_103588 ?auto_103589 ) ( CLEAR ?auto_103588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103585 ?auto_103586 ?auto_103587 ?auto_103588 )
      ( MAKE-5PILE ?auto_103585 ?auto_103586 ?auto_103587 ?auto_103588 ?auto_103589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103596 - BLOCK
      ?auto_103597 - BLOCK
      ?auto_103598 - BLOCK
      ?auto_103599 - BLOCK
      ?auto_103600 - BLOCK
    )
    :vars
    (
      ?auto_103601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103600 ?auto_103601 ) ( ON-TABLE ?auto_103596 ) ( ON ?auto_103597 ?auto_103596 ) ( ON ?auto_103598 ?auto_103597 ) ( not ( = ?auto_103596 ?auto_103597 ) ) ( not ( = ?auto_103596 ?auto_103598 ) ) ( not ( = ?auto_103596 ?auto_103599 ) ) ( not ( = ?auto_103596 ?auto_103600 ) ) ( not ( = ?auto_103596 ?auto_103601 ) ) ( not ( = ?auto_103597 ?auto_103598 ) ) ( not ( = ?auto_103597 ?auto_103599 ) ) ( not ( = ?auto_103597 ?auto_103600 ) ) ( not ( = ?auto_103597 ?auto_103601 ) ) ( not ( = ?auto_103598 ?auto_103599 ) ) ( not ( = ?auto_103598 ?auto_103600 ) ) ( not ( = ?auto_103598 ?auto_103601 ) ) ( not ( = ?auto_103599 ?auto_103600 ) ) ( not ( = ?auto_103599 ?auto_103601 ) ) ( not ( = ?auto_103600 ?auto_103601 ) ) ( CLEAR ?auto_103598 ) ( ON ?auto_103599 ?auto_103600 ) ( CLEAR ?auto_103599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103596 ?auto_103597 ?auto_103598 ?auto_103599 )
      ( MAKE-5PILE ?auto_103596 ?auto_103597 ?auto_103598 ?auto_103599 ?auto_103600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103607 - BLOCK
      ?auto_103608 - BLOCK
      ?auto_103609 - BLOCK
      ?auto_103610 - BLOCK
      ?auto_103611 - BLOCK
    )
    :vars
    (
      ?auto_103612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103611 ?auto_103612 ) ( ON-TABLE ?auto_103607 ) ( ON ?auto_103608 ?auto_103607 ) ( not ( = ?auto_103607 ?auto_103608 ) ) ( not ( = ?auto_103607 ?auto_103609 ) ) ( not ( = ?auto_103607 ?auto_103610 ) ) ( not ( = ?auto_103607 ?auto_103611 ) ) ( not ( = ?auto_103607 ?auto_103612 ) ) ( not ( = ?auto_103608 ?auto_103609 ) ) ( not ( = ?auto_103608 ?auto_103610 ) ) ( not ( = ?auto_103608 ?auto_103611 ) ) ( not ( = ?auto_103608 ?auto_103612 ) ) ( not ( = ?auto_103609 ?auto_103610 ) ) ( not ( = ?auto_103609 ?auto_103611 ) ) ( not ( = ?auto_103609 ?auto_103612 ) ) ( not ( = ?auto_103610 ?auto_103611 ) ) ( not ( = ?auto_103610 ?auto_103612 ) ) ( not ( = ?auto_103611 ?auto_103612 ) ) ( ON ?auto_103610 ?auto_103611 ) ( CLEAR ?auto_103608 ) ( ON ?auto_103609 ?auto_103610 ) ( CLEAR ?auto_103609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103607 ?auto_103608 ?auto_103609 )
      ( MAKE-5PILE ?auto_103607 ?auto_103608 ?auto_103609 ?auto_103610 ?auto_103611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103618 - BLOCK
      ?auto_103619 - BLOCK
      ?auto_103620 - BLOCK
      ?auto_103621 - BLOCK
      ?auto_103622 - BLOCK
    )
    :vars
    (
      ?auto_103623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103622 ?auto_103623 ) ( ON-TABLE ?auto_103618 ) ( ON ?auto_103619 ?auto_103618 ) ( not ( = ?auto_103618 ?auto_103619 ) ) ( not ( = ?auto_103618 ?auto_103620 ) ) ( not ( = ?auto_103618 ?auto_103621 ) ) ( not ( = ?auto_103618 ?auto_103622 ) ) ( not ( = ?auto_103618 ?auto_103623 ) ) ( not ( = ?auto_103619 ?auto_103620 ) ) ( not ( = ?auto_103619 ?auto_103621 ) ) ( not ( = ?auto_103619 ?auto_103622 ) ) ( not ( = ?auto_103619 ?auto_103623 ) ) ( not ( = ?auto_103620 ?auto_103621 ) ) ( not ( = ?auto_103620 ?auto_103622 ) ) ( not ( = ?auto_103620 ?auto_103623 ) ) ( not ( = ?auto_103621 ?auto_103622 ) ) ( not ( = ?auto_103621 ?auto_103623 ) ) ( not ( = ?auto_103622 ?auto_103623 ) ) ( ON ?auto_103621 ?auto_103622 ) ( CLEAR ?auto_103619 ) ( ON ?auto_103620 ?auto_103621 ) ( CLEAR ?auto_103620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103618 ?auto_103619 ?auto_103620 )
      ( MAKE-5PILE ?auto_103618 ?auto_103619 ?auto_103620 ?auto_103621 ?auto_103622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103629 - BLOCK
      ?auto_103630 - BLOCK
      ?auto_103631 - BLOCK
      ?auto_103632 - BLOCK
      ?auto_103633 - BLOCK
    )
    :vars
    (
      ?auto_103634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103633 ?auto_103634 ) ( ON-TABLE ?auto_103629 ) ( not ( = ?auto_103629 ?auto_103630 ) ) ( not ( = ?auto_103629 ?auto_103631 ) ) ( not ( = ?auto_103629 ?auto_103632 ) ) ( not ( = ?auto_103629 ?auto_103633 ) ) ( not ( = ?auto_103629 ?auto_103634 ) ) ( not ( = ?auto_103630 ?auto_103631 ) ) ( not ( = ?auto_103630 ?auto_103632 ) ) ( not ( = ?auto_103630 ?auto_103633 ) ) ( not ( = ?auto_103630 ?auto_103634 ) ) ( not ( = ?auto_103631 ?auto_103632 ) ) ( not ( = ?auto_103631 ?auto_103633 ) ) ( not ( = ?auto_103631 ?auto_103634 ) ) ( not ( = ?auto_103632 ?auto_103633 ) ) ( not ( = ?auto_103632 ?auto_103634 ) ) ( not ( = ?auto_103633 ?auto_103634 ) ) ( ON ?auto_103632 ?auto_103633 ) ( ON ?auto_103631 ?auto_103632 ) ( CLEAR ?auto_103629 ) ( ON ?auto_103630 ?auto_103631 ) ( CLEAR ?auto_103630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103629 ?auto_103630 )
      ( MAKE-5PILE ?auto_103629 ?auto_103630 ?auto_103631 ?auto_103632 ?auto_103633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103640 - BLOCK
      ?auto_103641 - BLOCK
      ?auto_103642 - BLOCK
      ?auto_103643 - BLOCK
      ?auto_103644 - BLOCK
    )
    :vars
    (
      ?auto_103645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103644 ?auto_103645 ) ( ON-TABLE ?auto_103640 ) ( not ( = ?auto_103640 ?auto_103641 ) ) ( not ( = ?auto_103640 ?auto_103642 ) ) ( not ( = ?auto_103640 ?auto_103643 ) ) ( not ( = ?auto_103640 ?auto_103644 ) ) ( not ( = ?auto_103640 ?auto_103645 ) ) ( not ( = ?auto_103641 ?auto_103642 ) ) ( not ( = ?auto_103641 ?auto_103643 ) ) ( not ( = ?auto_103641 ?auto_103644 ) ) ( not ( = ?auto_103641 ?auto_103645 ) ) ( not ( = ?auto_103642 ?auto_103643 ) ) ( not ( = ?auto_103642 ?auto_103644 ) ) ( not ( = ?auto_103642 ?auto_103645 ) ) ( not ( = ?auto_103643 ?auto_103644 ) ) ( not ( = ?auto_103643 ?auto_103645 ) ) ( not ( = ?auto_103644 ?auto_103645 ) ) ( ON ?auto_103643 ?auto_103644 ) ( ON ?auto_103642 ?auto_103643 ) ( CLEAR ?auto_103640 ) ( ON ?auto_103641 ?auto_103642 ) ( CLEAR ?auto_103641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103640 ?auto_103641 )
      ( MAKE-5PILE ?auto_103640 ?auto_103641 ?auto_103642 ?auto_103643 ?auto_103644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103651 - BLOCK
      ?auto_103652 - BLOCK
      ?auto_103653 - BLOCK
      ?auto_103654 - BLOCK
      ?auto_103655 - BLOCK
    )
    :vars
    (
      ?auto_103656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103655 ?auto_103656 ) ( not ( = ?auto_103651 ?auto_103652 ) ) ( not ( = ?auto_103651 ?auto_103653 ) ) ( not ( = ?auto_103651 ?auto_103654 ) ) ( not ( = ?auto_103651 ?auto_103655 ) ) ( not ( = ?auto_103651 ?auto_103656 ) ) ( not ( = ?auto_103652 ?auto_103653 ) ) ( not ( = ?auto_103652 ?auto_103654 ) ) ( not ( = ?auto_103652 ?auto_103655 ) ) ( not ( = ?auto_103652 ?auto_103656 ) ) ( not ( = ?auto_103653 ?auto_103654 ) ) ( not ( = ?auto_103653 ?auto_103655 ) ) ( not ( = ?auto_103653 ?auto_103656 ) ) ( not ( = ?auto_103654 ?auto_103655 ) ) ( not ( = ?auto_103654 ?auto_103656 ) ) ( not ( = ?auto_103655 ?auto_103656 ) ) ( ON ?auto_103654 ?auto_103655 ) ( ON ?auto_103653 ?auto_103654 ) ( ON ?auto_103652 ?auto_103653 ) ( ON ?auto_103651 ?auto_103652 ) ( CLEAR ?auto_103651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103651 )
      ( MAKE-5PILE ?auto_103651 ?auto_103652 ?auto_103653 ?auto_103654 ?auto_103655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103662 - BLOCK
      ?auto_103663 - BLOCK
      ?auto_103664 - BLOCK
      ?auto_103665 - BLOCK
      ?auto_103666 - BLOCK
    )
    :vars
    (
      ?auto_103667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103666 ?auto_103667 ) ( not ( = ?auto_103662 ?auto_103663 ) ) ( not ( = ?auto_103662 ?auto_103664 ) ) ( not ( = ?auto_103662 ?auto_103665 ) ) ( not ( = ?auto_103662 ?auto_103666 ) ) ( not ( = ?auto_103662 ?auto_103667 ) ) ( not ( = ?auto_103663 ?auto_103664 ) ) ( not ( = ?auto_103663 ?auto_103665 ) ) ( not ( = ?auto_103663 ?auto_103666 ) ) ( not ( = ?auto_103663 ?auto_103667 ) ) ( not ( = ?auto_103664 ?auto_103665 ) ) ( not ( = ?auto_103664 ?auto_103666 ) ) ( not ( = ?auto_103664 ?auto_103667 ) ) ( not ( = ?auto_103665 ?auto_103666 ) ) ( not ( = ?auto_103665 ?auto_103667 ) ) ( not ( = ?auto_103666 ?auto_103667 ) ) ( ON ?auto_103665 ?auto_103666 ) ( ON ?auto_103664 ?auto_103665 ) ( ON ?auto_103663 ?auto_103664 ) ( ON ?auto_103662 ?auto_103663 ) ( CLEAR ?auto_103662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103662 )
      ( MAKE-5PILE ?auto_103662 ?auto_103663 ?auto_103664 ?auto_103665 ?auto_103666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103674 - BLOCK
      ?auto_103675 - BLOCK
      ?auto_103676 - BLOCK
      ?auto_103677 - BLOCK
      ?auto_103678 - BLOCK
      ?auto_103679 - BLOCK
    )
    :vars
    (
      ?auto_103680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103678 ) ( ON ?auto_103679 ?auto_103680 ) ( CLEAR ?auto_103679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103674 ) ( ON ?auto_103675 ?auto_103674 ) ( ON ?auto_103676 ?auto_103675 ) ( ON ?auto_103677 ?auto_103676 ) ( ON ?auto_103678 ?auto_103677 ) ( not ( = ?auto_103674 ?auto_103675 ) ) ( not ( = ?auto_103674 ?auto_103676 ) ) ( not ( = ?auto_103674 ?auto_103677 ) ) ( not ( = ?auto_103674 ?auto_103678 ) ) ( not ( = ?auto_103674 ?auto_103679 ) ) ( not ( = ?auto_103674 ?auto_103680 ) ) ( not ( = ?auto_103675 ?auto_103676 ) ) ( not ( = ?auto_103675 ?auto_103677 ) ) ( not ( = ?auto_103675 ?auto_103678 ) ) ( not ( = ?auto_103675 ?auto_103679 ) ) ( not ( = ?auto_103675 ?auto_103680 ) ) ( not ( = ?auto_103676 ?auto_103677 ) ) ( not ( = ?auto_103676 ?auto_103678 ) ) ( not ( = ?auto_103676 ?auto_103679 ) ) ( not ( = ?auto_103676 ?auto_103680 ) ) ( not ( = ?auto_103677 ?auto_103678 ) ) ( not ( = ?auto_103677 ?auto_103679 ) ) ( not ( = ?auto_103677 ?auto_103680 ) ) ( not ( = ?auto_103678 ?auto_103679 ) ) ( not ( = ?auto_103678 ?auto_103680 ) ) ( not ( = ?auto_103679 ?auto_103680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103679 ?auto_103680 )
      ( !STACK ?auto_103679 ?auto_103678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103687 - BLOCK
      ?auto_103688 - BLOCK
      ?auto_103689 - BLOCK
      ?auto_103690 - BLOCK
      ?auto_103691 - BLOCK
      ?auto_103692 - BLOCK
    )
    :vars
    (
      ?auto_103693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103691 ) ( ON ?auto_103692 ?auto_103693 ) ( CLEAR ?auto_103692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103687 ) ( ON ?auto_103688 ?auto_103687 ) ( ON ?auto_103689 ?auto_103688 ) ( ON ?auto_103690 ?auto_103689 ) ( ON ?auto_103691 ?auto_103690 ) ( not ( = ?auto_103687 ?auto_103688 ) ) ( not ( = ?auto_103687 ?auto_103689 ) ) ( not ( = ?auto_103687 ?auto_103690 ) ) ( not ( = ?auto_103687 ?auto_103691 ) ) ( not ( = ?auto_103687 ?auto_103692 ) ) ( not ( = ?auto_103687 ?auto_103693 ) ) ( not ( = ?auto_103688 ?auto_103689 ) ) ( not ( = ?auto_103688 ?auto_103690 ) ) ( not ( = ?auto_103688 ?auto_103691 ) ) ( not ( = ?auto_103688 ?auto_103692 ) ) ( not ( = ?auto_103688 ?auto_103693 ) ) ( not ( = ?auto_103689 ?auto_103690 ) ) ( not ( = ?auto_103689 ?auto_103691 ) ) ( not ( = ?auto_103689 ?auto_103692 ) ) ( not ( = ?auto_103689 ?auto_103693 ) ) ( not ( = ?auto_103690 ?auto_103691 ) ) ( not ( = ?auto_103690 ?auto_103692 ) ) ( not ( = ?auto_103690 ?auto_103693 ) ) ( not ( = ?auto_103691 ?auto_103692 ) ) ( not ( = ?auto_103691 ?auto_103693 ) ) ( not ( = ?auto_103692 ?auto_103693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103692 ?auto_103693 )
      ( !STACK ?auto_103692 ?auto_103691 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103700 - BLOCK
      ?auto_103701 - BLOCK
      ?auto_103702 - BLOCK
      ?auto_103703 - BLOCK
      ?auto_103704 - BLOCK
      ?auto_103705 - BLOCK
    )
    :vars
    (
      ?auto_103706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103705 ?auto_103706 ) ( ON-TABLE ?auto_103700 ) ( ON ?auto_103701 ?auto_103700 ) ( ON ?auto_103702 ?auto_103701 ) ( ON ?auto_103703 ?auto_103702 ) ( not ( = ?auto_103700 ?auto_103701 ) ) ( not ( = ?auto_103700 ?auto_103702 ) ) ( not ( = ?auto_103700 ?auto_103703 ) ) ( not ( = ?auto_103700 ?auto_103704 ) ) ( not ( = ?auto_103700 ?auto_103705 ) ) ( not ( = ?auto_103700 ?auto_103706 ) ) ( not ( = ?auto_103701 ?auto_103702 ) ) ( not ( = ?auto_103701 ?auto_103703 ) ) ( not ( = ?auto_103701 ?auto_103704 ) ) ( not ( = ?auto_103701 ?auto_103705 ) ) ( not ( = ?auto_103701 ?auto_103706 ) ) ( not ( = ?auto_103702 ?auto_103703 ) ) ( not ( = ?auto_103702 ?auto_103704 ) ) ( not ( = ?auto_103702 ?auto_103705 ) ) ( not ( = ?auto_103702 ?auto_103706 ) ) ( not ( = ?auto_103703 ?auto_103704 ) ) ( not ( = ?auto_103703 ?auto_103705 ) ) ( not ( = ?auto_103703 ?auto_103706 ) ) ( not ( = ?auto_103704 ?auto_103705 ) ) ( not ( = ?auto_103704 ?auto_103706 ) ) ( not ( = ?auto_103705 ?auto_103706 ) ) ( CLEAR ?auto_103703 ) ( ON ?auto_103704 ?auto_103705 ) ( CLEAR ?auto_103704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103700 ?auto_103701 ?auto_103702 ?auto_103703 ?auto_103704 )
      ( MAKE-6PILE ?auto_103700 ?auto_103701 ?auto_103702 ?auto_103703 ?auto_103704 ?auto_103705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103713 - BLOCK
      ?auto_103714 - BLOCK
      ?auto_103715 - BLOCK
      ?auto_103716 - BLOCK
      ?auto_103717 - BLOCK
      ?auto_103718 - BLOCK
    )
    :vars
    (
      ?auto_103719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103718 ?auto_103719 ) ( ON-TABLE ?auto_103713 ) ( ON ?auto_103714 ?auto_103713 ) ( ON ?auto_103715 ?auto_103714 ) ( ON ?auto_103716 ?auto_103715 ) ( not ( = ?auto_103713 ?auto_103714 ) ) ( not ( = ?auto_103713 ?auto_103715 ) ) ( not ( = ?auto_103713 ?auto_103716 ) ) ( not ( = ?auto_103713 ?auto_103717 ) ) ( not ( = ?auto_103713 ?auto_103718 ) ) ( not ( = ?auto_103713 ?auto_103719 ) ) ( not ( = ?auto_103714 ?auto_103715 ) ) ( not ( = ?auto_103714 ?auto_103716 ) ) ( not ( = ?auto_103714 ?auto_103717 ) ) ( not ( = ?auto_103714 ?auto_103718 ) ) ( not ( = ?auto_103714 ?auto_103719 ) ) ( not ( = ?auto_103715 ?auto_103716 ) ) ( not ( = ?auto_103715 ?auto_103717 ) ) ( not ( = ?auto_103715 ?auto_103718 ) ) ( not ( = ?auto_103715 ?auto_103719 ) ) ( not ( = ?auto_103716 ?auto_103717 ) ) ( not ( = ?auto_103716 ?auto_103718 ) ) ( not ( = ?auto_103716 ?auto_103719 ) ) ( not ( = ?auto_103717 ?auto_103718 ) ) ( not ( = ?auto_103717 ?auto_103719 ) ) ( not ( = ?auto_103718 ?auto_103719 ) ) ( CLEAR ?auto_103716 ) ( ON ?auto_103717 ?auto_103718 ) ( CLEAR ?auto_103717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103713 ?auto_103714 ?auto_103715 ?auto_103716 ?auto_103717 )
      ( MAKE-6PILE ?auto_103713 ?auto_103714 ?auto_103715 ?auto_103716 ?auto_103717 ?auto_103718 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103726 - BLOCK
      ?auto_103727 - BLOCK
      ?auto_103728 - BLOCK
      ?auto_103729 - BLOCK
      ?auto_103730 - BLOCK
      ?auto_103731 - BLOCK
    )
    :vars
    (
      ?auto_103732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103731 ?auto_103732 ) ( ON-TABLE ?auto_103726 ) ( ON ?auto_103727 ?auto_103726 ) ( ON ?auto_103728 ?auto_103727 ) ( not ( = ?auto_103726 ?auto_103727 ) ) ( not ( = ?auto_103726 ?auto_103728 ) ) ( not ( = ?auto_103726 ?auto_103729 ) ) ( not ( = ?auto_103726 ?auto_103730 ) ) ( not ( = ?auto_103726 ?auto_103731 ) ) ( not ( = ?auto_103726 ?auto_103732 ) ) ( not ( = ?auto_103727 ?auto_103728 ) ) ( not ( = ?auto_103727 ?auto_103729 ) ) ( not ( = ?auto_103727 ?auto_103730 ) ) ( not ( = ?auto_103727 ?auto_103731 ) ) ( not ( = ?auto_103727 ?auto_103732 ) ) ( not ( = ?auto_103728 ?auto_103729 ) ) ( not ( = ?auto_103728 ?auto_103730 ) ) ( not ( = ?auto_103728 ?auto_103731 ) ) ( not ( = ?auto_103728 ?auto_103732 ) ) ( not ( = ?auto_103729 ?auto_103730 ) ) ( not ( = ?auto_103729 ?auto_103731 ) ) ( not ( = ?auto_103729 ?auto_103732 ) ) ( not ( = ?auto_103730 ?auto_103731 ) ) ( not ( = ?auto_103730 ?auto_103732 ) ) ( not ( = ?auto_103731 ?auto_103732 ) ) ( ON ?auto_103730 ?auto_103731 ) ( CLEAR ?auto_103728 ) ( ON ?auto_103729 ?auto_103730 ) ( CLEAR ?auto_103729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103726 ?auto_103727 ?auto_103728 ?auto_103729 )
      ( MAKE-6PILE ?auto_103726 ?auto_103727 ?auto_103728 ?auto_103729 ?auto_103730 ?auto_103731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103739 - BLOCK
      ?auto_103740 - BLOCK
      ?auto_103741 - BLOCK
      ?auto_103742 - BLOCK
      ?auto_103743 - BLOCK
      ?auto_103744 - BLOCK
    )
    :vars
    (
      ?auto_103745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103744 ?auto_103745 ) ( ON-TABLE ?auto_103739 ) ( ON ?auto_103740 ?auto_103739 ) ( ON ?auto_103741 ?auto_103740 ) ( not ( = ?auto_103739 ?auto_103740 ) ) ( not ( = ?auto_103739 ?auto_103741 ) ) ( not ( = ?auto_103739 ?auto_103742 ) ) ( not ( = ?auto_103739 ?auto_103743 ) ) ( not ( = ?auto_103739 ?auto_103744 ) ) ( not ( = ?auto_103739 ?auto_103745 ) ) ( not ( = ?auto_103740 ?auto_103741 ) ) ( not ( = ?auto_103740 ?auto_103742 ) ) ( not ( = ?auto_103740 ?auto_103743 ) ) ( not ( = ?auto_103740 ?auto_103744 ) ) ( not ( = ?auto_103740 ?auto_103745 ) ) ( not ( = ?auto_103741 ?auto_103742 ) ) ( not ( = ?auto_103741 ?auto_103743 ) ) ( not ( = ?auto_103741 ?auto_103744 ) ) ( not ( = ?auto_103741 ?auto_103745 ) ) ( not ( = ?auto_103742 ?auto_103743 ) ) ( not ( = ?auto_103742 ?auto_103744 ) ) ( not ( = ?auto_103742 ?auto_103745 ) ) ( not ( = ?auto_103743 ?auto_103744 ) ) ( not ( = ?auto_103743 ?auto_103745 ) ) ( not ( = ?auto_103744 ?auto_103745 ) ) ( ON ?auto_103743 ?auto_103744 ) ( CLEAR ?auto_103741 ) ( ON ?auto_103742 ?auto_103743 ) ( CLEAR ?auto_103742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103739 ?auto_103740 ?auto_103741 ?auto_103742 )
      ( MAKE-6PILE ?auto_103739 ?auto_103740 ?auto_103741 ?auto_103742 ?auto_103743 ?auto_103744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103752 - BLOCK
      ?auto_103753 - BLOCK
      ?auto_103754 - BLOCK
      ?auto_103755 - BLOCK
      ?auto_103756 - BLOCK
      ?auto_103757 - BLOCK
    )
    :vars
    (
      ?auto_103758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103757 ?auto_103758 ) ( ON-TABLE ?auto_103752 ) ( ON ?auto_103753 ?auto_103752 ) ( not ( = ?auto_103752 ?auto_103753 ) ) ( not ( = ?auto_103752 ?auto_103754 ) ) ( not ( = ?auto_103752 ?auto_103755 ) ) ( not ( = ?auto_103752 ?auto_103756 ) ) ( not ( = ?auto_103752 ?auto_103757 ) ) ( not ( = ?auto_103752 ?auto_103758 ) ) ( not ( = ?auto_103753 ?auto_103754 ) ) ( not ( = ?auto_103753 ?auto_103755 ) ) ( not ( = ?auto_103753 ?auto_103756 ) ) ( not ( = ?auto_103753 ?auto_103757 ) ) ( not ( = ?auto_103753 ?auto_103758 ) ) ( not ( = ?auto_103754 ?auto_103755 ) ) ( not ( = ?auto_103754 ?auto_103756 ) ) ( not ( = ?auto_103754 ?auto_103757 ) ) ( not ( = ?auto_103754 ?auto_103758 ) ) ( not ( = ?auto_103755 ?auto_103756 ) ) ( not ( = ?auto_103755 ?auto_103757 ) ) ( not ( = ?auto_103755 ?auto_103758 ) ) ( not ( = ?auto_103756 ?auto_103757 ) ) ( not ( = ?auto_103756 ?auto_103758 ) ) ( not ( = ?auto_103757 ?auto_103758 ) ) ( ON ?auto_103756 ?auto_103757 ) ( ON ?auto_103755 ?auto_103756 ) ( CLEAR ?auto_103753 ) ( ON ?auto_103754 ?auto_103755 ) ( CLEAR ?auto_103754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103752 ?auto_103753 ?auto_103754 )
      ( MAKE-6PILE ?auto_103752 ?auto_103753 ?auto_103754 ?auto_103755 ?auto_103756 ?auto_103757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103765 - BLOCK
      ?auto_103766 - BLOCK
      ?auto_103767 - BLOCK
      ?auto_103768 - BLOCK
      ?auto_103769 - BLOCK
      ?auto_103770 - BLOCK
    )
    :vars
    (
      ?auto_103771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103770 ?auto_103771 ) ( ON-TABLE ?auto_103765 ) ( ON ?auto_103766 ?auto_103765 ) ( not ( = ?auto_103765 ?auto_103766 ) ) ( not ( = ?auto_103765 ?auto_103767 ) ) ( not ( = ?auto_103765 ?auto_103768 ) ) ( not ( = ?auto_103765 ?auto_103769 ) ) ( not ( = ?auto_103765 ?auto_103770 ) ) ( not ( = ?auto_103765 ?auto_103771 ) ) ( not ( = ?auto_103766 ?auto_103767 ) ) ( not ( = ?auto_103766 ?auto_103768 ) ) ( not ( = ?auto_103766 ?auto_103769 ) ) ( not ( = ?auto_103766 ?auto_103770 ) ) ( not ( = ?auto_103766 ?auto_103771 ) ) ( not ( = ?auto_103767 ?auto_103768 ) ) ( not ( = ?auto_103767 ?auto_103769 ) ) ( not ( = ?auto_103767 ?auto_103770 ) ) ( not ( = ?auto_103767 ?auto_103771 ) ) ( not ( = ?auto_103768 ?auto_103769 ) ) ( not ( = ?auto_103768 ?auto_103770 ) ) ( not ( = ?auto_103768 ?auto_103771 ) ) ( not ( = ?auto_103769 ?auto_103770 ) ) ( not ( = ?auto_103769 ?auto_103771 ) ) ( not ( = ?auto_103770 ?auto_103771 ) ) ( ON ?auto_103769 ?auto_103770 ) ( ON ?auto_103768 ?auto_103769 ) ( CLEAR ?auto_103766 ) ( ON ?auto_103767 ?auto_103768 ) ( CLEAR ?auto_103767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103765 ?auto_103766 ?auto_103767 )
      ( MAKE-6PILE ?auto_103765 ?auto_103766 ?auto_103767 ?auto_103768 ?auto_103769 ?auto_103770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103778 - BLOCK
      ?auto_103779 - BLOCK
      ?auto_103780 - BLOCK
      ?auto_103781 - BLOCK
      ?auto_103782 - BLOCK
      ?auto_103783 - BLOCK
    )
    :vars
    (
      ?auto_103784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103783 ?auto_103784 ) ( ON-TABLE ?auto_103778 ) ( not ( = ?auto_103778 ?auto_103779 ) ) ( not ( = ?auto_103778 ?auto_103780 ) ) ( not ( = ?auto_103778 ?auto_103781 ) ) ( not ( = ?auto_103778 ?auto_103782 ) ) ( not ( = ?auto_103778 ?auto_103783 ) ) ( not ( = ?auto_103778 ?auto_103784 ) ) ( not ( = ?auto_103779 ?auto_103780 ) ) ( not ( = ?auto_103779 ?auto_103781 ) ) ( not ( = ?auto_103779 ?auto_103782 ) ) ( not ( = ?auto_103779 ?auto_103783 ) ) ( not ( = ?auto_103779 ?auto_103784 ) ) ( not ( = ?auto_103780 ?auto_103781 ) ) ( not ( = ?auto_103780 ?auto_103782 ) ) ( not ( = ?auto_103780 ?auto_103783 ) ) ( not ( = ?auto_103780 ?auto_103784 ) ) ( not ( = ?auto_103781 ?auto_103782 ) ) ( not ( = ?auto_103781 ?auto_103783 ) ) ( not ( = ?auto_103781 ?auto_103784 ) ) ( not ( = ?auto_103782 ?auto_103783 ) ) ( not ( = ?auto_103782 ?auto_103784 ) ) ( not ( = ?auto_103783 ?auto_103784 ) ) ( ON ?auto_103782 ?auto_103783 ) ( ON ?auto_103781 ?auto_103782 ) ( ON ?auto_103780 ?auto_103781 ) ( CLEAR ?auto_103778 ) ( ON ?auto_103779 ?auto_103780 ) ( CLEAR ?auto_103779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103778 ?auto_103779 )
      ( MAKE-6PILE ?auto_103778 ?auto_103779 ?auto_103780 ?auto_103781 ?auto_103782 ?auto_103783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103791 - BLOCK
      ?auto_103792 - BLOCK
      ?auto_103793 - BLOCK
      ?auto_103794 - BLOCK
      ?auto_103795 - BLOCK
      ?auto_103796 - BLOCK
    )
    :vars
    (
      ?auto_103797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103796 ?auto_103797 ) ( ON-TABLE ?auto_103791 ) ( not ( = ?auto_103791 ?auto_103792 ) ) ( not ( = ?auto_103791 ?auto_103793 ) ) ( not ( = ?auto_103791 ?auto_103794 ) ) ( not ( = ?auto_103791 ?auto_103795 ) ) ( not ( = ?auto_103791 ?auto_103796 ) ) ( not ( = ?auto_103791 ?auto_103797 ) ) ( not ( = ?auto_103792 ?auto_103793 ) ) ( not ( = ?auto_103792 ?auto_103794 ) ) ( not ( = ?auto_103792 ?auto_103795 ) ) ( not ( = ?auto_103792 ?auto_103796 ) ) ( not ( = ?auto_103792 ?auto_103797 ) ) ( not ( = ?auto_103793 ?auto_103794 ) ) ( not ( = ?auto_103793 ?auto_103795 ) ) ( not ( = ?auto_103793 ?auto_103796 ) ) ( not ( = ?auto_103793 ?auto_103797 ) ) ( not ( = ?auto_103794 ?auto_103795 ) ) ( not ( = ?auto_103794 ?auto_103796 ) ) ( not ( = ?auto_103794 ?auto_103797 ) ) ( not ( = ?auto_103795 ?auto_103796 ) ) ( not ( = ?auto_103795 ?auto_103797 ) ) ( not ( = ?auto_103796 ?auto_103797 ) ) ( ON ?auto_103795 ?auto_103796 ) ( ON ?auto_103794 ?auto_103795 ) ( ON ?auto_103793 ?auto_103794 ) ( CLEAR ?auto_103791 ) ( ON ?auto_103792 ?auto_103793 ) ( CLEAR ?auto_103792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103791 ?auto_103792 )
      ( MAKE-6PILE ?auto_103791 ?auto_103792 ?auto_103793 ?auto_103794 ?auto_103795 ?auto_103796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103804 - BLOCK
      ?auto_103805 - BLOCK
      ?auto_103806 - BLOCK
      ?auto_103807 - BLOCK
      ?auto_103808 - BLOCK
      ?auto_103809 - BLOCK
    )
    :vars
    (
      ?auto_103810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103809 ?auto_103810 ) ( not ( = ?auto_103804 ?auto_103805 ) ) ( not ( = ?auto_103804 ?auto_103806 ) ) ( not ( = ?auto_103804 ?auto_103807 ) ) ( not ( = ?auto_103804 ?auto_103808 ) ) ( not ( = ?auto_103804 ?auto_103809 ) ) ( not ( = ?auto_103804 ?auto_103810 ) ) ( not ( = ?auto_103805 ?auto_103806 ) ) ( not ( = ?auto_103805 ?auto_103807 ) ) ( not ( = ?auto_103805 ?auto_103808 ) ) ( not ( = ?auto_103805 ?auto_103809 ) ) ( not ( = ?auto_103805 ?auto_103810 ) ) ( not ( = ?auto_103806 ?auto_103807 ) ) ( not ( = ?auto_103806 ?auto_103808 ) ) ( not ( = ?auto_103806 ?auto_103809 ) ) ( not ( = ?auto_103806 ?auto_103810 ) ) ( not ( = ?auto_103807 ?auto_103808 ) ) ( not ( = ?auto_103807 ?auto_103809 ) ) ( not ( = ?auto_103807 ?auto_103810 ) ) ( not ( = ?auto_103808 ?auto_103809 ) ) ( not ( = ?auto_103808 ?auto_103810 ) ) ( not ( = ?auto_103809 ?auto_103810 ) ) ( ON ?auto_103808 ?auto_103809 ) ( ON ?auto_103807 ?auto_103808 ) ( ON ?auto_103806 ?auto_103807 ) ( ON ?auto_103805 ?auto_103806 ) ( ON ?auto_103804 ?auto_103805 ) ( CLEAR ?auto_103804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103804 )
      ( MAKE-6PILE ?auto_103804 ?auto_103805 ?auto_103806 ?auto_103807 ?auto_103808 ?auto_103809 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103817 - BLOCK
      ?auto_103818 - BLOCK
      ?auto_103819 - BLOCK
      ?auto_103820 - BLOCK
      ?auto_103821 - BLOCK
      ?auto_103822 - BLOCK
    )
    :vars
    (
      ?auto_103823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103822 ?auto_103823 ) ( not ( = ?auto_103817 ?auto_103818 ) ) ( not ( = ?auto_103817 ?auto_103819 ) ) ( not ( = ?auto_103817 ?auto_103820 ) ) ( not ( = ?auto_103817 ?auto_103821 ) ) ( not ( = ?auto_103817 ?auto_103822 ) ) ( not ( = ?auto_103817 ?auto_103823 ) ) ( not ( = ?auto_103818 ?auto_103819 ) ) ( not ( = ?auto_103818 ?auto_103820 ) ) ( not ( = ?auto_103818 ?auto_103821 ) ) ( not ( = ?auto_103818 ?auto_103822 ) ) ( not ( = ?auto_103818 ?auto_103823 ) ) ( not ( = ?auto_103819 ?auto_103820 ) ) ( not ( = ?auto_103819 ?auto_103821 ) ) ( not ( = ?auto_103819 ?auto_103822 ) ) ( not ( = ?auto_103819 ?auto_103823 ) ) ( not ( = ?auto_103820 ?auto_103821 ) ) ( not ( = ?auto_103820 ?auto_103822 ) ) ( not ( = ?auto_103820 ?auto_103823 ) ) ( not ( = ?auto_103821 ?auto_103822 ) ) ( not ( = ?auto_103821 ?auto_103823 ) ) ( not ( = ?auto_103822 ?auto_103823 ) ) ( ON ?auto_103821 ?auto_103822 ) ( ON ?auto_103820 ?auto_103821 ) ( ON ?auto_103819 ?auto_103820 ) ( ON ?auto_103818 ?auto_103819 ) ( ON ?auto_103817 ?auto_103818 ) ( CLEAR ?auto_103817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103817 )
      ( MAKE-6PILE ?auto_103817 ?auto_103818 ?auto_103819 ?auto_103820 ?auto_103821 ?auto_103822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103831 - BLOCK
      ?auto_103832 - BLOCK
      ?auto_103833 - BLOCK
      ?auto_103834 - BLOCK
      ?auto_103835 - BLOCK
      ?auto_103836 - BLOCK
      ?auto_103837 - BLOCK
    )
    :vars
    (
      ?auto_103838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103836 ) ( ON ?auto_103837 ?auto_103838 ) ( CLEAR ?auto_103837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103831 ) ( ON ?auto_103832 ?auto_103831 ) ( ON ?auto_103833 ?auto_103832 ) ( ON ?auto_103834 ?auto_103833 ) ( ON ?auto_103835 ?auto_103834 ) ( ON ?auto_103836 ?auto_103835 ) ( not ( = ?auto_103831 ?auto_103832 ) ) ( not ( = ?auto_103831 ?auto_103833 ) ) ( not ( = ?auto_103831 ?auto_103834 ) ) ( not ( = ?auto_103831 ?auto_103835 ) ) ( not ( = ?auto_103831 ?auto_103836 ) ) ( not ( = ?auto_103831 ?auto_103837 ) ) ( not ( = ?auto_103831 ?auto_103838 ) ) ( not ( = ?auto_103832 ?auto_103833 ) ) ( not ( = ?auto_103832 ?auto_103834 ) ) ( not ( = ?auto_103832 ?auto_103835 ) ) ( not ( = ?auto_103832 ?auto_103836 ) ) ( not ( = ?auto_103832 ?auto_103837 ) ) ( not ( = ?auto_103832 ?auto_103838 ) ) ( not ( = ?auto_103833 ?auto_103834 ) ) ( not ( = ?auto_103833 ?auto_103835 ) ) ( not ( = ?auto_103833 ?auto_103836 ) ) ( not ( = ?auto_103833 ?auto_103837 ) ) ( not ( = ?auto_103833 ?auto_103838 ) ) ( not ( = ?auto_103834 ?auto_103835 ) ) ( not ( = ?auto_103834 ?auto_103836 ) ) ( not ( = ?auto_103834 ?auto_103837 ) ) ( not ( = ?auto_103834 ?auto_103838 ) ) ( not ( = ?auto_103835 ?auto_103836 ) ) ( not ( = ?auto_103835 ?auto_103837 ) ) ( not ( = ?auto_103835 ?auto_103838 ) ) ( not ( = ?auto_103836 ?auto_103837 ) ) ( not ( = ?auto_103836 ?auto_103838 ) ) ( not ( = ?auto_103837 ?auto_103838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103837 ?auto_103838 )
      ( !STACK ?auto_103837 ?auto_103836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103846 - BLOCK
      ?auto_103847 - BLOCK
      ?auto_103848 - BLOCK
      ?auto_103849 - BLOCK
      ?auto_103850 - BLOCK
      ?auto_103851 - BLOCK
      ?auto_103852 - BLOCK
    )
    :vars
    (
      ?auto_103853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103851 ) ( ON ?auto_103852 ?auto_103853 ) ( CLEAR ?auto_103852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103846 ) ( ON ?auto_103847 ?auto_103846 ) ( ON ?auto_103848 ?auto_103847 ) ( ON ?auto_103849 ?auto_103848 ) ( ON ?auto_103850 ?auto_103849 ) ( ON ?auto_103851 ?auto_103850 ) ( not ( = ?auto_103846 ?auto_103847 ) ) ( not ( = ?auto_103846 ?auto_103848 ) ) ( not ( = ?auto_103846 ?auto_103849 ) ) ( not ( = ?auto_103846 ?auto_103850 ) ) ( not ( = ?auto_103846 ?auto_103851 ) ) ( not ( = ?auto_103846 ?auto_103852 ) ) ( not ( = ?auto_103846 ?auto_103853 ) ) ( not ( = ?auto_103847 ?auto_103848 ) ) ( not ( = ?auto_103847 ?auto_103849 ) ) ( not ( = ?auto_103847 ?auto_103850 ) ) ( not ( = ?auto_103847 ?auto_103851 ) ) ( not ( = ?auto_103847 ?auto_103852 ) ) ( not ( = ?auto_103847 ?auto_103853 ) ) ( not ( = ?auto_103848 ?auto_103849 ) ) ( not ( = ?auto_103848 ?auto_103850 ) ) ( not ( = ?auto_103848 ?auto_103851 ) ) ( not ( = ?auto_103848 ?auto_103852 ) ) ( not ( = ?auto_103848 ?auto_103853 ) ) ( not ( = ?auto_103849 ?auto_103850 ) ) ( not ( = ?auto_103849 ?auto_103851 ) ) ( not ( = ?auto_103849 ?auto_103852 ) ) ( not ( = ?auto_103849 ?auto_103853 ) ) ( not ( = ?auto_103850 ?auto_103851 ) ) ( not ( = ?auto_103850 ?auto_103852 ) ) ( not ( = ?auto_103850 ?auto_103853 ) ) ( not ( = ?auto_103851 ?auto_103852 ) ) ( not ( = ?auto_103851 ?auto_103853 ) ) ( not ( = ?auto_103852 ?auto_103853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103852 ?auto_103853 )
      ( !STACK ?auto_103852 ?auto_103851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103861 - BLOCK
      ?auto_103862 - BLOCK
      ?auto_103863 - BLOCK
      ?auto_103864 - BLOCK
      ?auto_103865 - BLOCK
      ?auto_103866 - BLOCK
      ?auto_103867 - BLOCK
    )
    :vars
    (
      ?auto_103868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103867 ?auto_103868 ) ( ON-TABLE ?auto_103861 ) ( ON ?auto_103862 ?auto_103861 ) ( ON ?auto_103863 ?auto_103862 ) ( ON ?auto_103864 ?auto_103863 ) ( ON ?auto_103865 ?auto_103864 ) ( not ( = ?auto_103861 ?auto_103862 ) ) ( not ( = ?auto_103861 ?auto_103863 ) ) ( not ( = ?auto_103861 ?auto_103864 ) ) ( not ( = ?auto_103861 ?auto_103865 ) ) ( not ( = ?auto_103861 ?auto_103866 ) ) ( not ( = ?auto_103861 ?auto_103867 ) ) ( not ( = ?auto_103861 ?auto_103868 ) ) ( not ( = ?auto_103862 ?auto_103863 ) ) ( not ( = ?auto_103862 ?auto_103864 ) ) ( not ( = ?auto_103862 ?auto_103865 ) ) ( not ( = ?auto_103862 ?auto_103866 ) ) ( not ( = ?auto_103862 ?auto_103867 ) ) ( not ( = ?auto_103862 ?auto_103868 ) ) ( not ( = ?auto_103863 ?auto_103864 ) ) ( not ( = ?auto_103863 ?auto_103865 ) ) ( not ( = ?auto_103863 ?auto_103866 ) ) ( not ( = ?auto_103863 ?auto_103867 ) ) ( not ( = ?auto_103863 ?auto_103868 ) ) ( not ( = ?auto_103864 ?auto_103865 ) ) ( not ( = ?auto_103864 ?auto_103866 ) ) ( not ( = ?auto_103864 ?auto_103867 ) ) ( not ( = ?auto_103864 ?auto_103868 ) ) ( not ( = ?auto_103865 ?auto_103866 ) ) ( not ( = ?auto_103865 ?auto_103867 ) ) ( not ( = ?auto_103865 ?auto_103868 ) ) ( not ( = ?auto_103866 ?auto_103867 ) ) ( not ( = ?auto_103866 ?auto_103868 ) ) ( not ( = ?auto_103867 ?auto_103868 ) ) ( CLEAR ?auto_103865 ) ( ON ?auto_103866 ?auto_103867 ) ( CLEAR ?auto_103866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103861 ?auto_103862 ?auto_103863 ?auto_103864 ?auto_103865 ?auto_103866 )
      ( MAKE-7PILE ?auto_103861 ?auto_103862 ?auto_103863 ?auto_103864 ?auto_103865 ?auto_103866 ?auto_103867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103876 - BLOCK
      ?auto_103877 - BLOCK
      ?auto_103878 - BLOCK
      ?auto_103879 - BLOCK
      ?auto_103880 - BLOCK
      ?auto_103881 - BLOCK
      ?auto_103882 - BLOCK
    )
    :vars
    (
      ?auto_103883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103882 ?auto_103883 ) ( ON-TABLE ?auto_103876 ) ( ON ?auto_103877 ?auto_103876 ) ( ON ?auto_103878 ?auto_103877 ) ( ON ?auto_103879 ?auto_103878 ) ( ON ?auto_103880 ?auto_103879 ) ( not ( = ?auto_103876 ?auto_103877 ) ) ( not ( = ?auto_103876 ?auto_103878 ) ) ( not ( = ?auto_103876 ?auto_103879 ) ) ( not ( = ?auto_103876 ?auto_103880 ) ) ( not ( = ?auto_103876 ?auto_103881 ) ) ( not ( = ?auto_103876 ?auto_103882 ) ) ( not ( = ?auto_103876 ?auto_103883 ) ) ( not ( = ?auto_103877 ?auto_103878 ) ) ( not ( = ?auto_103877 ?auto_103879 ) ) ( not ( = ?auto_103877 ?auto_103880 ) ) ( not ( = ?auto_103877 ?auto_103881 ) ) ( not ( = ?auto_103877 ?auto_103882 ) ) ( not ( = ?auto_103877 ?auto_103883 ) ) ( not ( = ?auto_103878 ?auto_103879 ) ) ( not ( = ?auto_103878 ?auto_103880 ) ) ( not ( = ?auto_103878 ?auto_103881 ) ) ( not ( = ?auto_103878 ?auto_103882 ) ) ( not ( = ?auto_103878 ?auto_103883 ) ) ( not ( = ?auto_103879 ?auto_103880 ) ) ( not ( = ?auto_103879 ?auto_103881 ) ) ( not ( = ?auto_103879 ?auto_103882 ) ) ( not ( = ?auto_103879 ?auto_103883 ) ) ( not ( = ?auto_103880 ?auto_103881 ) ) ( not ( = ?auto_103880 ?auto_103882 ) ) ( not ( = ?auto_103880 ?auto_103883 ) ) ( not ( = ?auto_103881 ?auto_103882 ) ) ( not ( = ?auto_103881 ?auto_103883 ) ) ( not ( = ?auto_103882 ?auto_103883 ) ) ( CLEAR ?auto_103880 ) ( ON ?auto_103881 ?auto_103882 ) ( CLEAR ?auto_103881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103876 ?auto_103877 ?auto_103878 ?auto_103879 ?auto_103880 ?auto_103881 )
      ( MAKE-7PILE ?auto_103876 ?auto_103877 ?auto_103878 ?auto_103879 ?auto_103880 ?auto_103881 ?auto_103882 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103891 - BLOCK
      ?auto_103892 - BLOCK
      ?auto_103893 - BLOCK
      ?auto_103894 - BLOCK
      ?auto_103895 - BLOCK
      ?auto_103896 - BLOCK
      ?auto_103897 - BLOCK
    )
    :vars
    (
      ?auto_103898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103897 ?auto_103898 ) ( ON-TABLE ?auto_103891 ) ( ON ?auto_103892 ?auto_103891 ) ( ON ?auto_103893 ?auto_103892 ) ( ON ?auto_103894 ?auto_103893 ) ( not ( = ?auto_103891 ?auto_103892 ) ) ( not ( = ?auto_103891 ?auto_103893 ) ) ( not ( = ?auto_103891 ?auto_103894 ) ) ( not ( = ?auto_103891 ?auto_103895 ) ) ( not ( = ?auto_103891 ?auto_103896 ) ) ( not ( = ?auto_103891 ?auto_103897 ) ) ( not ( = ?auto_103891 ?auto_103898 ) ) ( not ( = ?auto_103892 ?auto_103893 ) ) ( not ( = ?auto_103892 ?auto_103894 ) ) ( not ( = ?auto_103892 ?auto_103895 ) ) ( not ( = ?auto_103892 ?auto_103896 ) ) ( not ( = ?auto_103892 ?auto_103897 ) ) ( not ( = ?auto_103892 ?auto_103898 ) ) ( not ( = ?auto_103893 ?auto_103894 ) ) ( not ( = ?auto_103893 ?auto_103895 ) ) ( not ( = ?auto_103893 ?auto_103896 ) ) ( not ( = ?auto_103893 ?auto_103897 ) ) ( not ( = ?auto_103893 ?auto_103898 ) ) ( not ( = ?auto_103894 ?auto_103895 ) ) ( not ( = ?auto_103894 ?auto_103896 ) ) ( not ( = ?auto_103894 ?auto_103897 ) ) ( not ( = ?auto_103894 ?auto_103898 ) ) ( not ( = ?auto_103895 ?auto_103896 ) ) ( not ( = ?auto_103895 ?auto_103897 ) ) ( not ( = ?auto_103895 ?auto_103898 ) ) ( not ( = ?auto_103896 ?auto_103897 ) ) ( not ( = ?auto_103896 ?auto_103898 ) ) ( not ( = ?auto_103897 ?auto_103898 ) ) ( ON ?auto_103896 ?auto_103897 ) ( CLEAR ?auto_103894 ) ( ON ?auto_103895 ?auto_103896 ) ( CLEAR ?auto_103895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103891 ?auto_103892 ?auto_103893 ?auto_103894 ?auto_103895 )
      ( MAKE-7PILE ?auto_103891 ?auto_103892 ?auto_103893 ?auto_103894 ?auto_103895 ?auto_103896 ?auto_103897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103906 - BLOCK
      ?auto_103907 - BLOCK
      ?auto_103908 - BLOCK
      ?auto_103909 - BLOCK
      ?auto_103910 - BLOCK
      ?auto_103911 - BLOCK
      ?auto_103912 - BLOCK
    )
    :vars
    (
      ?auto_103913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103912 ?auto_103913 ) ( ON-TABLE ?auto_103906 ) ( ON ?auto_103907 ?auto_103906 ) ( ON ?auto_103908 ?auto_103907 ) ( ON ?auto_103909 ?auto_103908 ) ( not ( = ?auto_103906 ?auto_103907 ) ) ( not ( = ?auto_103906 ?auto_103908 ) ) ( not ( = ?auto_103906 ?auto_103909 ) ) ( not ( = ?auto_103906 ?auto_103910 ) ) ( not ( = ?auto_103906 ?auto_103911 ) ) ( not ( = ?auto_103906 ?auto_103912 ) ) ( not ( = ?auto_103906 ?auto_103913 ) ) ( not ( = ?auto_103907 ?auto_103908 ) ) ( not ( = ?auto_103907 ?auto_103909 ) ) ( not ( = ?auto_103907 ?auto_103910 ) ) ( not ( = ?auto_103907 ?auto_103911 ) ) ( not ( = ?auto_103907 ?auto_103912 ) ) ( not ( = ?auto_103907 ?auto_103913 ) ) ( not ( = ?auto_103908 ?auto_103909 ) ) ( not ( = ?auto_103908 ?auto_103910 ) ) ( not ( = ?auto_103908 ?auto_103911 ) ) ( not ( = ?auto_103908 ?auto_103912 ) ) ( not ( = ?auto_103908 ?auto_103913 ) ) ( not ( = ?auto_103909 ?auto_103910 ) ) ( not ( = ?auto_103909 ?auto_103911 ) ) ( not ( = ?auto_103909 ?auto_103912 ) ) ( not ( = ?auto_103909 ?auto_103913 ) ) ( not ( = ?auto_103910 ?auto_103911 ) ) ( not ( = ?auto_103910 ?auto_103912 ) ) ( not ( = ?auto_103910 ?auto_103913 ) ) ( not ( = ?auto_103911 ?auto_103912 ) ) ( not ( = ?auto_103911 ?auto_103913 ) ) ( not ( = ?auto_103912 ?auto_103913 ) ) ( ON ?auto_103911 ?auto_103912 ) ( CLEAR ?auto_103909 ) ( ON ?auto_103910 ?auto_103911 ) ( CLEAR ?auto_103910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103906 ?auto_103907 ?auto_103908 ?auto_103909 ?auto_103910 )
      ( MAKE-7PILE ?auto_103906 ?auto_103907 ?auto_103908 ?auto_103909 ?auto_103910 ?auto_103911 ?auto_103912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103921 - BLOCK
      ?auto_103922 - BLOCK
      ?auto_103923 - BLOCK
      ?auto_103924 - BLOCK
      ?auto_103925 - BLOCK
      ?auto_103926 - BLOCK
      ?auto_103927 - BLOCK
    )
    :vars
    (
      ?auto_103928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103927 ?auto_103928 ) ( ON-TABLE ?auto_103921 ) ( ON ?auto_103922 ?auto_103921 ) ( ON ?auto_103923 ?auto_103922 ) ( not ( = ?auto_103921 ?auto_103922 ) ) ( not ( = ?auto_103921 ?auto_103923 ) ) ( not ( = ?auto_103921 ?auto_103924 ) ) ( not ( = ?auto_103921 ?auto_103925 ) ) ( not ( = ?auto_103921 ?auto_103926 ) ) ( not ( = ?auto_103921 ?auto_103927 ) ) ( not ( = ?auto_103921 ?auto_103928 ) ) ( not ( = ?auto_103922 ?auto_103923 ) ) ( not ( = ?auto_103922 ?auto_103924 ) ) ( not ( = ?auto_103922 ?auto_103925 ) ) ( not ( = ?auto_103922 ?auto_103926 ) ) ( not ( = ?auto_103922 ?auto_103927 ) ) ( not ( = ?auto_103922 ?auto_103928 ) ) ( not ( = ?auto_103923 ?auto_103924 ) ) ( not ( = ?auto_103923 ?auto_103925 ) ) ( not ( = ?auto_103923 ?auto_103926 ) ) ( not ( = ?auto_103923 ?auto_103927 ) ) ( not ( = ?auto_103923 ?auto_103928 ) ) ( not ( = ?auto_103924 ?auto_103925 ) ) ( not ( = ?auto_103924 ?auto_103926 ) ) ( not ( = ?auto_103924 ?auto_103927 ) ) ( not ( = ?auto_103924 ?auto_103928 ) ) ( not ( = ?auto_103925 ?auto_103926 ) ) ( not ( = ?auto_103925 ?auto_103927 ) ) ( not ( = ?auto_103925 ?auto_103928 ) ) ( not ( = ?auto_103926 ?auto_103927 ) ) ( not ( = ?auto_103926 ?auto_103928 ) ) ( not ( = ?auto_103927 ?auto_103928 ) ) ( ON ?auto_103926 ?auto_103927 ) ( ON ?auto_103925 ?auto_103926 ) ( CLEAR ?auto_103923 ) ( ON ?auto_103924 ?auto_103925 ) ( CLEAR ?auto_103924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103921 ?auto_103922 ?auto_103923 ?auto_103924 )
      ( MAKE-7PILE ?auto_103921 ?auto_103922 ?auto_103923 ?auto_103924 ?auto_103925 ?auto_103926 ?auto_103927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103936 - BLOCK
      ?auto_103937 - BLOCK
      ?auto_103938 - BLOCK
      ?auto_103939 - BLOCK
      ?auto_103940 - BLOCK
      ?auto_103941 - BLOCK
      ?auto_103942 - BLOCK
    )
    :vars
    (
      ?auto_103943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103942 ?auto_103943 ) ( ON-TABLE ?auto_103936 ) ( ON ?auto_103937 ?auto_103936 ) ( ON ?auto_103938 ?auto_103937 ) ( not ( = ?auto_103936 ?auto_103937 ) ) ( not ( = ?auto_103936 ?auto_103938 ) ) ( not ( = ?auto_103936 ?auto_103939 ) ) ( not ( = ?auto_103936 ?auto_103940 ) ) ( not ( = ?auto_103936 ?auto_103941 ) ) ( not ( = ?auto_103936 ?auto_103942 ) ) ( not ( = ?auto_103936 ?auto_103943 ) ) ( not ( = ?auto_103937 ?auto_103938 ) ) ( not ( = ?auto_103937 ?auto_103939 ) ) ( not ( = ?auto_103937 ?auto_103940 ) ) ( not ( = ?auto_103937 ?auto_103941 ) ) ( not ( = ?auto_103937 ?auto_103942 ) ) ( not ( = ?auto_103937 ?auto_103943 ) ) ( not ( = ?auto_103938 ?auto_103939 ) ) ( not ( = ?auto_103938 ?auto_103940 ) ) ( not ( = ?auto_103938 ?auto_103941 ) ) ( not ( = ?auto_103938 ?auto_103942 ) ) ( not ( = ?auto_103938 ?auto_103943 ) ) ( not ( = ?auto_103939 ?auto_103940 ) ) ( not ( = ?auto_103939 ?auto_103941 ) ) ( not ( = ?auto_103939 ?auto_103942 ) ) ( not ( = ?auto_103939 ?auto_103943 ) ) ( not ( = ?auto_103940 ?auto_103941 ) ) ( not ( = ?auto_103940 ?auto_103942 ) ) ( not ( = ?auto_103940 ?auto_103943 ) ) ( not ( = ?auto_103941 ?auto_103942 ) ) ( not ( = ?auto_103941 ?auto_103943 ) ) ( not ( = ?auto_103942 ?auto_103943 ) ) ( ON ?auto_103941 ?auto_103942 ) ( ON ?auto_103940 ?auto_103941 ) ( CLEAR ?auto_103938 ) ( ON ?auto_103939 ?auto_103940 ) ( CLEAR ?auto_103939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103936 ?auto_103937 ?auto_103938 ?auto_103939 )
      ( MAKE-7PILE ?auto_103936 ?auto_103937 ?auto_103938 ?auto_103939 ?auto_103940 ?auto_103941 ?auto_103942 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103951 - BLOCK
      ?auto_103952 - BLOCK
      ?auto_103953 - BLOCK
      ?auto_103954 - BLOCK
      ?auto_103955 - BLOCK
      ?auto_103956 - BLOCK
      ?auto_103957 - BLOCK
    )
    :vars
    (
      ?auto_103958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103957 ?auto_103958 ) ( ON-TABLE ?auto_103951 ) ( ON ?auto_103952 ?auto_103951 ) ( not ( = ?auto_103951 ?auto_103952 ) ) ( not ( = ?auto_103951 ?auto_103953 ) ) ( not ( = ?auto_103951 ?auto_103954 ) ) ( not ( = ?auto_103951 ?auto_103955 ) ) ( not ( = ?auto_103951 ?auto_103956 ) ) ( not ( = ?auto_103951 ?auto_103957 ) ) ( not ( = ?auto_103951 ?auto_103958 ) ) ( not ( = ?auto_103952 ?auto_103953 ) ) ( not ( = ?auto_103952 ?auto_103954 ) ) ( not ( = ?auto_103952 ?auto_103955 ) ) ( not ( = ?auto_103952 ?auto_103956 ) ) ( not ( = ?auto_103952 ?auto_103957 ) ) ( not ( = ?auto_103952 ?auto_103958 ) ) ( not ( = ?auto_103953 ?auto_103954 ) ) ( not ( = ?auto_103953 ?auto_103955 ) ) ( not ( = ?auto_103953 ?auto_103956 ) ) ( not ( = ?auto_103953 ?auto_103957 ) ) ( not ( = ?auto_103953 ?auto_103958 ) ) ( not ( = ?auto_103954 ?auto_103955 ) ) ( not ( = ?auto_103954 ?auto_103956 ) ) ( not ( = ?auto_103954 ?auto_103957 ) ) ( not ( = ?auto_103954 ?auto_103958 ) ) ( not ( = ?auto_103955 ?auto_103956 ) ) ( not ( = ?auto_103955 ?auto_103957 ) ) ( not ( = ?auto_103955 ?auto_103958 ) ) ( not ( = ?auto_103956 ?auto_103957 ) ) ( not ( = ?auto_103956 ?auto_103958 ) ) ( not ( = ?auto_103957 ?auto_103958 ) ) ( ON ?auto_103956 ?auto_103957 ) ( ON ?auto_103955 ?auto_103956 ) ( ON ?auto_103954 ?auto_103955 ) ( CLEAR ?auto_103952 ) ( ON ?auto_103953 ?auto_103954 ) ( CLEAR ?auto_103953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103951 ?auto_103952 ?auto_103953 )
      ( MAKE-7PILE ?auto_103951 ?auto_103952 ?auto_103953 ?auto_103954 ?auto_103955 ?auto_103956 ?auto_103957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103966 - BLOCK
      ?auto_103967 - BLOCK
      ?auto_103968 - BLOCK
      ?auto_103969 - BLOCK
      ?auto_103970 - BLOCK
      ?auto_103971 - BLOCK
      ?auto_103972 - BLOCK
    )
    :vars
    (
      ?auto_103973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103972 ?auto_103973 ) ( ON-TABLE ?auto_103966 ) ( ON ?auto_103967 ?auto_103966 ) ( not ( = ?auto_103966 ?auto_103967 ) ) ( not ( = ?auto_103966 ?auto_103968 ) ) ( not ( = ?auto_103966 ?auto_103969 ) ) ( not ( = ?auto_103966 ?auto_103970 ) ) ( not ( = ?auto_103966 ?auto_103971 ) ) ( not ( = ?auto_103966 ?auto_103972 ) ) ( not ( = ?auto_103966 ?auto_103973 ) ) ( not ( = ?auto_103967 ?auto_103968 ) ) ( not ( = ?auto_103967 ?auto_103969 ) ) ( not ( = ?auto_103967 ?auto_103970 ) ) ( not ( = ?auto_103967 ?auto_103971 ) ) ( not ( = ?auto_103967 ?auto_103972 ) ) ( not ( = ?auto_103967 ?auto_103973 ) ) ( not ( = ?auto_103968 ?auto_103969 ) ) ( not ( = ?auto_103968 ?auto_103970 ) ) ( not ( = ?auto_103968 ?auto_103971 ) ) ( not ( = ?auto_103968 ?auto_103972 ) ) ( not ( = ?auto_103968 ?auto_103973 ) ) ( not ( = ?auto_103969 ?auto_103970 ) ) ( not ( = ?auto_103969 ?auto_103971 ) ) ( not ( = ?auto_103969 ?auto_103972 ) ) ( not ( = ?auto_103969 ?auto_103973 ) ) ( not ( = ?auto_103970 ?auto_103971 ) ) ( not ( = ?auto_103970 ?auto_103972 ) ) ( not ( = ?auto_103970 ?auto_103973 ) ) ( not ( = ?auto_103971 ?auto_103972 ) ) ( not ( = ?auto_103971 ?auto_103973 ) ) ( not ( = ?auto_103972 ?auto_103973 ) ) ( ON ?auto_103971 ?auto_103972 ) ( ON ?auto_103970 ?auto_103971 ) ( ON ?auto_103969 ?auto_103970 ) ( CLEAR ?auto_103967 ) ( ON ?auto_103968 ?auto_103969 ) ( CLEAR ?auto_103968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103966 ?auto_103967 ?auto_103968 )
      ( MAKE-7PILE ?auto_103966 ?auto_103967 ?auto_103968 ?auto_103969 ?auto_103970 ?auto_103971 ?auto_103972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103981 - BLOCK
      ?auto_103982 - BLOCK
      ?auto_103983 - BLOCK
      ?auto_103984 - BLOCK
      ?auto_103985 - BLOCK
      ?auto_103986 - BLOCK
      ?auto_103987 - BLOCK
    )
    :vars
    (
      ?auto_103988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103987 ?auto_103988 ) ( ON-TABLE ?auto_103981 ) ( not ( = ?auto_103981 ?auto_103982 ) ) ( not ( = ?auto_103981 ?auto_103983 ) ) ( not ( = ?auto_103981 ?auto_103984 ) ) ( not ( = ?auto_103981 ?auto_103985 ) ) ( not ( = ?auto_103981 ?auto_103986 ) ) ( not ( = ?auto_103981 ?auto_103987 ) ) ( not ( = ?auto_103981 ?auto_103988 ) ) ( not ( = ?auto_103982 ?auto_103983 ) ) ( not ( = ?auto_103982 ?auto_103984 ) ) ( not ( = ?auto_103982 ?auto_103985 ) ) ( not ( = ?auto_103982 ?auto_103986 ) ) ( not ( = ?auto_103982 ?auto_103987 ) ) ( not ( = ?auto_103982 ?auto_103988 ) ) ( not ( = ?auto_103983 ?auto_103984 ) ) ( not ( = ?auto_103983 ?auto_103985 ) ) ( not ( = ?auto_103983 ?auto_103986 ) ) ( not ( = ?auto_103983 ?auto_103987 ) ) ( not ( = ?auto_103983 ?auto_103988 ) ) ( not ( = ?auto_103984 ?auto_103985 ) ) ( not ( = ?auto_103984 ?auto_103986 ) ) ( not ( = ?auto_103984 ?auto_103987 ) ) ( not ( = ?auto_103984 ?auto_103988 ) ) ( not ( = ?auto_103985 ?auto_103986 ) ) ( not ( = ?auto_103985 ?auto_103987 ) ) ( not ( = ?auto_103985 ?auto_103988 ) ) ( not ( = ?auto_103986 ?auto_103987 ) ) ( not ( = ?auto_103986 ?auto_103988 ) ) ( not ( = ?auto_103987 ?auto_103988 ) ) ( ON ?auto_103986 ?auto_103987 ) ( ON ?auto_103985 ?auto_103986 ) ( ON ?auto_103984 ?auto_103985 ) ( ON ?auto_103983 ?auto_103984 ) ( CLEAR ?auto_103981 ) ( ON ?auto_103982 ?auto_103983 ) ( CLEAR ?auto_103982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103981 ?auto_103982 )
      ( MAKE-7PILE ?auto_103981 ?auto_103982 ?auto_103983 ?auto_103984 ?auto_103985 ?auto_103986 ?auto_103987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_103996 - BLOCK
      ?auto_103997 - BLOCK
      ?auto_103998 - BLOCK
      ?auto_103999 - BLOCK
      ?auto_104000 - BLOCK
      ?auto_104001 - BLOCK
      ?auto_104002 - BLOCK
    )
    :vars
    (
      ?auto_104003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104002 ?auto_104003 ) ( ON-TABLE ?auto_103996 ) ( not ( = ?auto_103996 ?auto_103997 ) ) ( not ( = ?auto_103996 ?auto_103998 ) ) ( not ( = ?auto_103996 ?auto_103999 ) ) ( not ( = ?auto_103996 ?auto_104000 ) ) ( not ( = ?auto_103996 ?auto_104001 ) ) ( not ( = ?auto_103996 ?auto_104002 ) ) ( not ( = ?auto_103996 ?auto_104003 ) ) ( not ( = ?auto_103997 ?auto_103998 ) ) ( not ( = ?auto_103997 ?auto_103999 ) ) ( not ( = ?auto_103997 ?auto_104000 ) ) ( not ( = ?auto_103997 ?auto_104001 ) ) ( not ( = ?auto_103997 ?auto_104002 ) ) ( not ( = ?auto_103997 ?auto_104003 ) ) ( not ( = ?auto_103998 ?auto_103999 ) ) ( not ( = ?auto_103998 ?auto_104000 ) ) ( not ( = ?auto_103998 ?auto_104001 ) ) ( not ( = ?auto_103998 ?auto_104002 ) ) ( not ( = ?auto_103998 ?auto_104003 ) ) ( not ( = ?auto_103999 ?auto_104000 ) ) ( not ( = ?auto_103999 ?auto_104001 ) ) ( not ( = ?auto_103999 ?auto_104002 ) ) ( not ( = ?auto_103999 ?auto_104003 ) ) ( not ( = ?auto_104000 ?auto_104001 ) ) ( not ( = ?auto_104000 ?auto_104002 ) ) ( not ( = ?auto_104000 ?auto_104003 ) ) ( not ( = ?auto_104001 ?auto_104002 ) ) ( not ( = ?auto_104001 ?auto_104003 ) ) ( not ( = ?auto_104002 ?auto_104003 ) ) ( ON ?auto_104001 ?auto_104002 ) ( ON ?auto_104000 ?auto_104001 ) ( ON ?auto_103999 ?auto_104000 ) ( ON ?auto_103998 ?auto_103999 ) ( CLEAR ?auto_103996 ) ( ON ?auto_103997 ?auto_103998 ) ( CLEAR ?auto_103997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103996 ?auto_103997 )
      ( MAKE-7PILE ?auto_103996 ?auto_103997 ?auto_103998 ?auto_103999 ?auto_104000 ?auto_104001 ?auto_104002 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104011 - BLOCK
      ?auto_104012 - BLOCK
      ?auto_104013 - BLOCK
      ?auto_104014 - BLOCK
      ?auto_104015 - BLOCK
      ?auto_104016 - BLOCK
      ?auto_104017 - BLOCK
    )
    :vars
    (
      ?auto_104018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104017 ?auto_104018 ) ( not ( = ?auto_104011 ?auto_104012 ) ) ( not ( = ?auto_104011 ?auto_104013 ) ) ( not ( = ?auto_104011 ?auto_104014 ) ) ( not ( = ?auto_104011 ?auto_104015 ) ) ( not ( = ?auto_104011 ?auto_104016 ) ) ( not ( = ?auto_104011 ?auto_104017 ) ) ( not ( = ?auto_104011 ?auto_104018 ) ) ( not ( = ?auto_104012 ?auto_104013 ) ) ( not ( = ?auto_104012 ?auto_104014 ) ) ( not ( = ?auto_104012 ?auto_104015 ) ) ( not ( = ?auto_104012 ?auto_104016 ) ) ( not ( = ?auto_104012 ?auto_104017 ) ) ( not ( = ?auto_104012 ?auto_104018 ) ) ( not ( = ?auto_104013 ?auto_104014 ) ) ( not ( = ?auto_104013 ?auto_104015 ) ) ( not ( = ?auto_104013 ?auto_104016 ) ) ( not ( = ?auto_104013 ?auto_104017 ) ) ( not ( = ?auto_104013 ?auto_104018 ) ) ( not ( = ?auto_104014 ?auto_104015 ) ) ( not ( = ?auto_104014 ?auto_104016 ) ) ( not ( = ?auto_104014 ?auto_104017 ) ) ( not ( = ?auto_104014 ?auto_104018 ) ) ( not ( = ?auto_104015 ?auto_104016 ) ) ( not ( = ?auto_104015 ?auto_104017 ) ) ( not ( = ?auto_104015 ?auto_104018 ) ) ( not ( = ?auto_104016 ?auto_104017 ) ) ( not ( = ?auto_104016 ?auto_104018 ) ) ( not ( = ?auto_104017 ?auto_104018 ) ) ( ON ?auto_104016 ?auto_104017 ) ( ON ?auto_104015 ?auto_104016 ) ( ON ?auto_104014 ?auto_104015 ) ( ON ?auto_104013 ?auto_104014 ) ( ON ?auto_104012 ?auto_104013 ) ( ON ?auto_104011 ?auto_104012 ) ( CLEAR ?auto_104011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104011 )
      ( MAKE-7PILE ?auto_104011 ?auto_104012 ?auto_104013 ?auto_104014 ?auto_104015 ?auto_104016 ?auto_104017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104026 - BLOCK
      ?auto_104027 - BLOCK
      ?auto_104028 - BLOCK
      ?auto_104029 - BLOCK
      ?auto_104030 - BLOCK
      ?auto_104031 - BLOCK
      ?auto_104032 - BLOCK
    )
    :vars
    (
      ?auto_104033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104032 ?auto_104033 ) ( not ( = ?auto_104026 ?auto_104027 ) ) ( not ( = ?auto_104026 ?auto_104028 ) ) ( not ( = ?auto_104026 ?auto_104029 ) ) ( not ( = ?auto_104026 ?auto_104030 ) ) ( not ( = ?auto_104026 ?auto_104031 ) ) ( not ( = ?auto_104026 ?auto_104032 ) ) ( not ( = ?auto_104026 ?auto_104033 ) ) ( not ( = ?auto_104027 ?auto_104028 ) ) ( not ( = ?auto_104027 ?auto_104029 ) ) ( not ( = ?auto_104027 ?auto_104030 ) ) ( not ( = ?auto_104027 ?auto_104031 ) ) ( not ( = ?auto_104027 ?auto_104032 ) ) ( not ( = ?auto_104027 ?auto_104033 ) ) ( not ( = ?auto_104028 ?auto_104029 ) ) ( not ( = ?auto_104028 ?auto_104030 ) ) ( not ( = ?auto_104028 ?auto_104031 ) ) ( not ( = ?auto_104028 ?auto_104032 ) ) ( not ( = ?auto_104028 ?auto_104033 ) ) ( not ( = ?auto_104029 ?auto_104030 ) ) ( not ( = ?auto_104029 ?auto_104031 ) ) ( not ( = ?auto_104029 ?auto_104032 ) ) ( not ( = ?auto_104029 ?auto_104033 ) ) ( not ( = ?auto_104030 ?auto_104031 ) ) ( not ( = ?auto_104030 ?auto_104032 ) ) ( not ( = ?auto_104030 ?auto_104033 ) ) ( not ( = ?auto_104031 ?auto_104032 ) ) ( not ( = ?auto_104031 ?auto_104033 ) ) ( not ( = ?auto_104032 ?auto_104033 ) ) ( ON ?auto_104031 ?auto_104032 ) ( ON ?auto_104030 ?auto_104031 ) ( ON ?auto_104029 ?auto_104030 ) ( ON ?auto_104028 ?auto_104029 ) ( ON ?auto_104027 ?auto_104028 ) ( ON ?auto_104026 ?auto_104027 ) ( CLEAR ?auto_104026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104026 )
      ( MAKE-7PILE ?auto_104026 ?auto_104027 ?auto_104028 ?auto_104029 ?auto_104030 ?auto_104031 ?auto_104032 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104042 - BLOCK
      ?auto_104043 - BLOCK
      ?auto_104044 - BLOCK
      ?auto_104045 - BLOCK
      ?auto_104046 - BLOCK
      ?auto_104047 - BLOCK
      ?auto_104048 - BLOCK
      ?auto_104049 - BLOCK
    )
    :vars
    (
      ?auto_104050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104048 ) ( ON ?auto_104049 ?auto_104050 ) ( CLEAR ?auto_104049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104042 ) ( ON ?auto_104043 ?auto_104042 ) ( ON ?auto_104044 ?auto_104043 ) ( ON ?auto_104045 ?auto_104044 ) ( ON ?auto_104046 ?auto_104045 ) ( ON ?auto_104047 ?auto_104046 ) ( ON ?auto_104048 ?auto_104047 ) ( not ( = ?auto_104042 ?auto_104043 ) ) ( not ( = ?auto_104042 ?auto_104044 ) ) ( not ( = ?auto_104042 ?auto_104045 ) ) ( not ( = ?auto_104042 ?auto_104046 ) ) ( not ( = ?auto_104042 ?auto_104047 ) ) ( not ( = ?auto_104042 ?auto_104048 ) ) ( not ( = ?auto_104042 ?auto_104049 ) ) ( not ( = ?auto_104042 ?auto_104050 ) ) ( not ( = ?auto_104043 ?auto_104044 ) ) ( not ( = ?auto_104043 ?auto_104045 ) ) ( not ( = ?auto_104043 ?auto_104046 ) ) ( not ( = ?auto_104043 ?auto_104047 ) ) ( not ( = ?auto_104043 ?auto_104048 ) ) ( not ( = ?auto_104043 ?auto_104049 ) ) ( not ( = ?auto_104043 ?auto_104050 ) ) ( not ( = ?auto_104044 ?auto_104045 ) ) ( not ( = ?auto_104044 ?auto_104046 ) ) ( not ( = ?auto_104044 ?auto_104047 ) ) ( not ( = ?auto_104044 ?auto_104048 ) ) ( not ( = ?auto_104044 ?auto_104049 ) ) ( not ( = ?auto_104044 ?auto_104050 ) ) ( not ( = ?auto_104045 ?auto_104046 ) ) ( not ( = ?auto_104045 ?auto_104047 ) ) ( not ( = ?auto_104045 ?auto_104048 ) ) ( not ( = ?auto_104045 ?auto_104049 ) ) ( not ( = ?auto_104045 ?auto_104050 ) ) ( not ( = ?auto_104046 ?auto_104047 ) ) ( not ( = ?auto_104046 ?auto_104048 ) ) ( not ( = ?auto_104046 ?auto_104049 ) ) ( not ( = ?auto_104046 ?auto_104050 ) ) ( not ( = ?auto_104047 ?auto_104048 ) ) ( not ( = ?auto_104047 ?auto_104049 ) ) ( not ( = ?auto_104047 ?auto_104050 ) ) ( not ( = ?auto_104048 ?auto_104049 ) ) ( not ( = ?auto_104048 ?auto_104050 ) ) ( not ( = ?auto_104049 ?auto_104050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104049 ?auto_104050 )
      ( !STACK ?auto_104049 ?auto_104048 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104059 - BLOCK
      ?auto_104060 - BLOCK
      ?auto_104061 - BLOCK
      ?auto_104062 - BLOCK
      ?auto_104063 - BLOCK
      ?auto_104064 - BLOCK
      ?auto_104065 - BLOCK
      ?auto_104066 - BLOCK
    )
    :vars
    (
      ?auto_104067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104065 ) ( ON ?auto_104066 ?auto_104067 ) ( CLEAR ?auto_104066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104059 ) ( ON ?auto_104060 ?auto_104059 ) ( ON ?auto_104061 ?auto_104060 ) ( ON ?auto_104062 ?auto_104061 ) ( ON ?auto_104063 ?auto_104062 ) ( ON ?auto_104064 ?auto_104063 ) ( ON ?auto_104065 ?auto_104064 ) ( not ( = ?auto_104059 ?auto_104060 ) ) ( not ( = ?auto_104059 ?auto_104061 ) ) ( not ( = ?auto_104059 ?auto_104062 ) ) ( not ( = ?auto_104059 ?auto_104063 ) ) ( not ( = ?auto_104059 ?auto_104064 ) ) ( not ( = ?auto_104059 ?auto_104065 ) ) ( not ( = ?auto_104059 ?auto_104066 ) ) ( not ( = ?auto_104059 ?auto_104067 ) ) ( not ( = ?auto_104060 ?auto_104061 ) ) ( not ( = ?auto_104060 ?auto_104062 ) ) ( not ( = ?auto_104060 ?auto_104063 ) ) ( not ( = ?auto_104060 ?auto_104064 ) ) ( not ( = ?auto_104060 ?auto_104065 ) ) ( not ( = ?auto_104060 ?auto_104066 ) ) ( not ( = ?auto_104060 ?auto_104067 ) ) ( not ( = ?auto_104061 ?auto_104062 ) ) ( not ( = ?auto_104061 ?auto_104063 ) ) ( not ( = ?auto_104061 ?auto_104064 ) ) ( not ( = ?auto_104061 ?auto_104065 ) ) ( not ( = ?auto_104061 ?auto_104066 ) ) ( not ( = ?auto_104061 ?auto_104067 ) ) ( not ( = ?auto_104062 ?auto_104063 ) ) ( not ( = ?auto_104062 ?auto_104064 ) ) ( not ( = ?auto_104062 ?auto_104065 ) ) ( not ( = ?auto_104062 ?auto_104066 ) ) ( not ( = ?auto_104062 ?auto_104067 ) ) ( not ( = ?auto_104063 ?auto_104064 ) ) ( not ( = ?auto_104063 ?auto_104065 ) ) ( not ( = ?auto_104063 ?auto_104066 ) ) ( not ( = ?auto_104063 ?auto_104067 ) ) ( not ( = ?auto_104064 ?auto_104065 ) ) ( not ( = ?auto_104064 ?auto_104066 ) ) ( not ( = ?auto_104064 ?auto_104067 ) ) ( not ( = ?auto_104065 ?auto_104066 ) ) ( not ( = ?auto_104065 ?auto_104067 ) ) ( not ( = ?auto_104066 ?auto_104067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104066 ?auto_104067 )
      ( !STACK ?auto_104066 ?auto_104065 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104076 - BLOCK
      ?auto_104077 - BLOCK
      ?auto_104078 - BLOCK
      ?auto_104079 - BLOCK
      ?auto_104080 - BLOCK
      ?auto_104081 - BLOCK
      ?auto_104082 - BLOCK
      ?auto_104083 - BLOCK
    )
    :vars
    (
      ?auto_104084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104083 ?auto_104084 ) ( ON-TABLE ?auto_104076 ) ( ON ?auto_104077 ?auto_104076 ) ( ON ?auto_104078 ?auto_104077 ) ( ON ?auto_104079 ?auto_104078 ) ( ON ?auto_104080 ?auto_104079 ) ( ON ?auto_104081 ?auto_104080 ) ( not ( = ?auto_104076 ?auto_104077 ) ) ( not ( = ?auto_104076 ?auto_104078 ) ) ( not ( = ?auto_104076 ?auto_104079 ) ) ( not ( = ?auto_104076 ?auto_104080 ) ) ( not ( = ?auto_104076 ?auto_104081 ) ) ( not ( = ?auto_104076 ?auto_104082 ) ) ( not ( = ?auto_104076 ?auto_104083 ) ) ( not ( = ?auto_104076 ?auto_104084 ) ) ( not ( = ?auto_104077 ?auto_104078 ) ) ( not ( = ?auto_104077 ?auto_104079 ) ) ( not ( = ?auto_104077 ?auto_104080 ) ) ( not ( = ?auto_104077 ?auto_104081 ) ) ( not ( = ?auto_104077 ?auto_104082 ) ) ( not ( = ?auto_104077 ?auto_104083 ) ) ( not ( = ?auto_104077 ?auto_104084 ) ) ( not ( = ?auto_104078 ?auto_104079 ) ) ( not ( = ?auto_104078 ?auto_104080 ) ) ( not ( = ?auto_104078 ?auto_104081 ) ) ( not ( = ?auto_104078 ?auto_104082 ) ) ( not ( = ?auto_104078 ?auto_104083 ) ) ( not ( = ?auto_104078 ?auto_104084 ) ) ( not ( = ?auto_104079 ?auto_104080 ) ) ( not ( = ?auto_104079 ?auto_104081 ) ) ( not ( = ?auto_104079 ?auto_104082 ) ) ( not ( = ?auto_104079 ?auto_104083 ) ) ( not ( = ?auto_104079 ?auto_104084 ) ) ( not ( = ?auto_104080 ?auto_104081 ) ) ( not ( = ?auto_104080 ?auto_104082 ) ) ( not ( = ?auto_104080 ?auto_104083 ) ) ( not ( = ?auto_104080 ?auto_104084 ) ) ( not ( = ?auto_104081 ?auto_104082 ) ) ( not ( = ?auto_104081 ?auto_104083 ) ) ( not ( = ?auto_104081 ?auto_104084 ) ) ( not ( = ?auto_104082 ?auto_104083 ) ) ( not ( = ?auto_104082 ?auto_104084 ) ) ( not ( = ?auto_104083 ?auto_104084 ) ) ( CLEAR ?auto_104081 ) ( ON ?auto_104082 ?auto_104083 ) ( CLEAR ?auto_104082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104076 ?auto_104077 ?auto_104078 ?auto_104079 ?auto_104080 ?auto_104081 ?auto_104082 )
      ( MAKE-8PILE ?auto_104076 ?auto_104077 ?auto_104078 ?auto_104079 ?auto_104080 ?auto_104081 ?auto_104082 ?auto_104083 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104093 - BLOCK
      ?auto_104094 - BLOCK
      ?auto_104095 - BLOCK
      ?auto_104096 - BLOCK
      ?auto_104097 - BLOCK
      ?auto_104098 - BLOCK
      ?auto_104099 - BLOCK
      ?auto_104100 - BLOCK
    )
    :vars
    (
      ?auto_104101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104100 ?auto_104101 ) ( ON-TABLE ?auto_104093 ) ( ON ?auto_104094 ?auto_104093 ) ( ON ?auto_104095 ?auto_104094 ) ( ON ?auto_104096 ?auto_104095 ) ( ON ?auto_104097 ?auto_104096 ) ( ON ?auto_104098 ?auto_104097 ) ( not ( = ?auto_104093 ?auto_104094 ) ) ( not ( = ?auto_104093 ?auto_104095 ) ) ( not ( = ?auto_104093 ?auto_104096 ) ) ( not ( = ?auto_104093 ?auto_104097 ) ) ( not ( = ?auto_104093 ?auto_104098 ) ) ( not ( = ?auto_104093 ?auto_104099 ) ) ( not ( = ?auto_104093 ?auto_104100 ) ) ( not ( = ?auto_104093 ?auto_104101 ) ) ( not ( = ?auto_104094 ?auto_104095 ) ) ( not ( = ?auto_104094 ?auto_104096 ) ) ( not ( = ?auto_104094 ?auto_104097 ) ) ( not ( = ?auto_104094 ?auto_104098 ) ) ( not ( = ?auto_104094 ?auto_104099 ) ) ( not ( = ?auto_104094 ?auto_104100 ) ) ( not ( = ?auto_104094 ?auto_104101 ) ) ( not ( = ?auto_104095 ?auto_104096 ) ) ( not ( = ?auto_104095 ?auto_104097 ) ) ( not ( = ?auto_104095 ?auto_104098 ) ) ( not ( = ?auto_104095 ?auto_104099 ) ) ( not ( = ?auto_104095 ?auto_104100 ) ) ( not ( = ?auto_104095 ?auto_104101 ) ) ( not ( = ?auto_104096 ?auto_104097 ) ) ( not ( = ?auto_104096 ?auto_104098 ) ) ( not ( = ?auto_104096 ?auto_104099 ) ) ( not ( = ?auto_104096 ?auto_104100 ) ) ( not ( = ?auto_104096 ?auto_104101 ) ) ( not ( = ?auto_104097 ?auto_104098 ) ) ( not ( = ?auto_104097 ?auto_104099 ) ) ( not ( = ?auto_104097 ?auto_104100 ) ) ( not ( = ?auto_104097 ?auto_104101 ) ) ( not ( = ?auto_104098 ?auto_104099 ) ) ( not ( = ?auto_104098 ?auto_104100 ) ) ( not ( = ?auto_104098 ?auto_104101 ) ) ( not ( = ?auto_104099 ?auto_104100 ) ) ( not ( = ?auto_104099 ?auto_104101 ) ) ( not ( = ?auto_104100 ?auto_104101 ) ) ( CLEAR ?auto_104098 ) ( ON ?auto_104099 ?auto_104100 ) ( CLEAR ?auto_104099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104093 ?auto_104094 ?auto_104095 ?auto_104096 ?auto_104097 ?auto_104098 ?auto_104099 )
      ( MAKE-8PILE ?auto_104093 ?auto_104094 ?auto_104095 ?auto_104096 ?auto_104097 ?auto_104098 ?auto_104099 ?auto_104100 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104110 - BLOCK
      ?auto_104111 - BLOCK
      ?auto_104112 - BLOCK
      ?auto_104113 - BLOCK
      ?auto_104114 - BLOCK
      ?auto_104115 - BLOCK
      ?auto_104116 - BLOCK
      ?auto_104117 - BLOCK
    )
    :vars
    (
      ?auto_104118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104117 ?auto_104118 ) ( ON-TABLE ?auto_104110 ) ( ON ?auto_104111 ?auto_104110 ) ( ON ?auto_104112 ?auto_104111 ) ( ON ?auto_104113 ?auto_104112 ) ( ON ?auto_104114 ?auto_104113 ) ( not ( = ?auto_104110 ?auto_104111 ) ) ( not ( = ?auto_104110 ?auto_104112 ) ) ( not ( = ?auto_104110 ?auto_104113 ) ) ( not ( = ?auto_104110 ?auto_104114 ) ) ( not ( = ?auto_104110 ?auto_104115 ) ) ( not ( = ?auto_104110 ?auto_104116 ) ) ( not ( = ?auto_104110 ?auto_104117 ) ) ( not ( = ?auto_104110 ?auto_104118 ) ) ( not ( = ?auto_104111 ?auto_104112 ) ) ( not ( = ?auto_104111 ?auto_104113 ) ) ( not ( = ?auto_104111 ?auto_104114 ) ) ( not ( = ?auto_104111 ?auto_104115 ) ) ( not ( = ?auto_104111 ?auto_104116 ) ) ( not ( = ?auto_104111 ?auto_104117 ) ) ( not ( = ?auto_104111 ?auto_104118 ) ) ( not ( = ?auto_104112 ?auto_104113 ) ) ( not ( = ?auto_104112 ?auto_104114 ) ) ( not ( = ?auto_104112 ?auto_104115 ) ) ( not ( = ?auto_104112 ?auto_104116 ) ) ( not ( = ?auto_104112 ?auto_104117 ) ) ( not ( = ?auto_104112 ?auto_104118 ) ) ( not ( = ?auto_104113 ?auto_104114 ) ) ( not ( = ?auto_104113 ?auto_104115 ) ) ( not ( = ?auto_104113 ?auto_104116 ) ) ( not ( = ?auto_104113 ?auto_104117 ) ) ( not ( = ?auto_104113 ?auto_104118 ) ) ( not ( = ?auto_104114 ?auto_104115 ) ) ( not ( = ?auto_104114 ?auto_104116 ) ) ( not ( = ?auto_104114 ?auto_104117 ) ) ( not ( = ?auto_104114 ?auto_104118 ) ) ( not ( = ?auto_104115 ?auto_104116 ) ) ( not ( = ?auto_104115 ?auto_104117 ) ) ( not ( = ?auto_104115 ?auto_104118 ) ) ( not ( = ?auto_104116 ?auto_104117 ) ) ( not ( = ?auto_104116 ?auto_104118 ) ) ( not ( = ?auto_104117 ?auto_104118 ) ) ( ON ?auto_104116 ?auto_104117 ) ( CLEAR ?auto_104114 ) ( ON ?auto_104115 ?auto_104116 ) ( CLEAR ?auto_104115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104110 ?auto_104111 ?auto_104112 ?auto_104113 ?auto_104114 ?auto_104115 )
      ( MAKE-8PILE ?auto_104110 ?auto_104111 ?auto_104112 ?auto_104113 ?auto_104114 ?auto_104115 ?auto_104116 ?auto_104117 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104127 - BLOCK
      ?auto_104128 - BLOCK
      ?auto_104129 - BLOCK
      ?auto_104130 - BLOCK
      ?auto_104131 - BLOCK
      ?auto_104132 - BLOCK
      ?auto_104133 - BLOCK
      ?auto_104134 - BLOCK
    )
    :vars
    (
      ?auto_104135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104134 ?auto_104135 ) ( ON-TABLE ?auto_104127 ) ( ON ?auto_104128 ?auto_104127 ) ( ON ?auto_104129 ?auto_104128 ) ( ON ?auto_104130 ?auto_104129 ) ( ON ?auto_104131 ?auto_104130 ) ( not ( = ?auto_104127 ?auto_104128 ) ) ( not ( = ?auto_104127 ?auto_104129 ) ) ( not ( = ?auto_104127 ?auto_104130 ) ) ( not ( = ?auto_104127 ?auto_104131 ) ) ( not ( = ?auto_104127 ?auto_104132 ) ) ( not ( = ?auto_104127 ?auto_104133 ) ) ( not ( = ?auto_104127 ?auto_104134 ) ) ( not ( = ?auto_104127 ?auto_104135 ) ) ( not ( = ?auto_104128 ?auto_104129 ) ) ( not ( = ?auto_104128 ?auto_104130 ) ) ( not ( = ?auto_104128 ?auto_104131 ) ) ( not ( = ?auto_104128 ?auto_104132 ) ) ( not ( = ?auto_104128 ?auto_104133 ) ) ( not ( = ?auto_104128 ?auto_104134 ) ) ( not ( = ?auto_104128 ?auto_104135 ) ) ( not ( = ?auto_104129 ?auto_104130 ) ) ( not ( = ?auto_104129 ?auto_104131 ) ) ( not ( = ?auto_104129 ?auto_104132 ) ) ( not ( = ?auto_104129 ?auto_104133 ) ) ( not ( = ?auto_104129 ?auto_104134 ) ) ( not ( = ?auto_104129 ?auto_104135 ) ) ( not ( = ?auto_104130 ?auto_104131 ) ) ( not ( = ?auto_104130 ?auto_104132 ) ) ( not ( = ?auto_104130 ?auto_104133 ) ) ( not ( = ?auto_104130 ?auto_104134 ) ) ( not ( = ?auto_104130 ?auto_104135 ) ) ( not ( = ?auto_104131 ?auto_104132 ) ) ( not ( = ?auto_104131 ?auto_104133 ) ) ( not ( = ?auto_104131 ?auto_104134 ) ) ( not ( = ?auto_104131 ?auto_104135 ) ) ( not ( = ?auto_104132 ?auto_104133 ) ) ( not ( = ?auto_104132 ?auto_104134 ) ) ( not ( = ?auto_104132 ?auto_104135 ) ) ( not ( = ?auto_104133 ?auto_104134 ) ) ( not ( = ?auto_104133 ?auto_104135 ) ) ( not ( = ?auto_104134 ?auto_104135 ) ) ( ON ?auto_104133 ?auto_104134 ) ( CLEAR ?auto_104131 ) ( ON ?auto_104132 ?auto_104133 ) ( CLEAR ?auto_104132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104127 ?auto_104128 ?auto_104129 ?auto_104130 ?auto_104131 ?auto_104132 )
      ( MAKE-8PILE ?auto_104127 ?auto_104128 ?auto_104129 ?auto_104130 ?auto_104131 ?auto_104132 ?auto_104133 ?auto_104134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104144 - BLOCK
      ?auto_104145 - BLOCK
      ?auto_104146 - BLOCK
      ?auto_104147 - BLOCK
      ?auto_104148 - BLOCK
      ?auto_104149 - BLOCK
      ?auto_104150 - BLOCK
      ?auto_104151 - BLOCK
    )
    :vars
    (
      ?auto_104152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104151 ?auto_104152 ) ( ON-TABLE ?auto_104144 ) ( ON ?auto_104145 ?auto_104144 ) ( ON ?auto_104146 ?auto_104145 ) ( ON ?auto_104147 ?auto_104146 ) ( not ( = ?auto_104144 ?auto_104145 ) ) ( not ( = ?auto_104144 ?auto_104146 ) ) ( not ( = ?auto_104144 ?auto_104147 ) ) ( not ( = ?auto_104144 ?auto_104148 ) ) ( not ( = ?auto_104144 ?auto_104149 ) ) ( not ( = ?auto_104144 ?auto_104150 ) ) ( not ( = ?auto_104144 ?auto_104151 ) ) ( not ( = ?auto_104144 ?auto_104152 ) ) ( not ( = ?auto_104145 ?auto_104146 ) ) ( not ( = ?auto_104145 ?auto_104147 ) ) ( not ( = ?auto_104145 ?auto_104148 ) ) ( not ( = ?auto_104145 ?auto_104149 ) ) ( not ( = ?auto_104145 ?auto_104150 ) ) ( not ( = ?auto_104145 ?auto_104151 ) ) ( not ( = ?auto_104145 ?auto_104152 ) ) ( not ( = ?auto_104146 ?auto_104147 ) ) ( not ( = ?auto_104146 ?auto_104148 ) ) ( not ( = ?auto_104146 ?auto_104149 ) ) ( not ( = ?auto_104146 ?auto_104150 ) ) ( not ( = ?auto_104146 ?auto_104151 ) ) ( not ( = ?auto_104146 ?auto_104152 ) ) ( not ( = ?auto_104147 ?auto_104148 ) ) ( not ( = ?auto_104147 ?auto_104149 ) ) ( not ( = ?auto_104147 ?auto_104150 ) ) ( not ( = ?auto_104147 ?auto_104151 ) ) ( not ( = ?auto_104147 ?auto_104152 ) ) ( not ( = ?auto_104148 ?auto_104149 ) ) ( not ( = ?auto_104148 ?auto_104150 ) ) ( not ( = ?auto_104148 ?auto_104151 ) ) ( not ( = ?auto_104148 ?auto_104152 ) ) ( not ( = ?auto_104149 ?auto_104150 ) ) ( not ( = ?auto_104149 ?auto_104151 ) ) ( not ( = ?auto_104149 ?auto_104152 ) ) ( not ( = ?auto_104150 ?auto_104151 ) ) ( not ( = ?auto_104150 ?auto_104152 ) ) ( not ( = ?auto_104151 ?auto_104152 ) ) ( ON ?auto_104150 ?auto_104151 ) ( ON ?auto_104149 ?auto_104150 ) ( CLEAR ?auto_104147 ) ( ON ?auto_104148 ?auto_104149 ) ( CLEAR ?auto_104148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104144 ?auto_104145 ?auto_104146 ?auto_104147 ?auto_104148 )
      ( MAKE-8PILE ?auto_104144 ?auto_104145 ?auto_104146 ?auto_104147 ?auto_104148 ?auto_104149 ?auto_104150 ?auto_104151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104161 - BLOCK
      ?auto_104162 - BLOCK
      ?auto_104163 - BLOCK
      ?auto_104164 - BLOCK
      ?auto_104165 - BLOCK
      ?auto_104166 - BLOCK
      ?auto_104167 - BLOCK
      ?auto_104168 - BLOCK
    )
    :vars
    (
      ?auto_104169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104168 ?auto_104169 ) ( ON-TABLE ?auto_104161 ) ( ON ?auto_104162 ?auto_104161 ) ( ON ?auto_104163 ?auto_104162 ) ( ON ?auto_104164 ?auto_104163 ) ( not ( = ?auto_104161 ?auto_104162 ) ) ( not ( = ?auto_104161 ?auto_104163 ) ) ( not ( = ?auto_104161 ?auto_104164 ) ) ( not ( = ?auto_104161 ?auto_104165 ) ) ( not ( = ?auto_104161 ?auto_104166 ) ) ( not ( = ?auto_104161 ?auto_104167 ) ) ( not ( = ?auto_104161 ?auto_104168 ) ) ( not ( = ?auto_104161 ?auto_104169 ) ) ( not ( = ?auto_104162 ?auto_104163 ) ) ( not ( = ?auto_104162 ?auto_104164 ) ) ( not ( = ?auto_104162 ?auto_104165 ) ) ( not ( = ?auto_104162 ?auto_104166 ) ) ( not ( = ?auto_104162 ?auto_104167 ) ) ( not ( = ?auto_104162 ?auto_104168 ) ) ( not ( = ?auto_104162 ?auto_104169 ) ) ( not ( = ?auto_104163 ?auto_104164 ) ) ( not ( = ?auto_104163 ?auto_104165 ) ) ( not ( = ?auto_104163 ?auto_104166 ) ) ( not ( = ?auto_104163 ?auto_104167 ) ) ( not ( = ?auto_104163 ?auto_104168 ) ) ( not ( = ?auto_104163 ?auto_104169 ) ) ( not ( = ?auto_104164 ?auto_104165 ) ) ( not ( = ?auto_104164 ?auto_104166 ) ) ( not ( = ?auto_104164 ?auto_104167 ) ) ( not ( = ?auto_104164 ?auto_104168 ) ) ( not ( = ?auto_104164 ?auto_104169 ) ) ( not ( = ?auto_104165 ?auto_104166 ) ) ( not ( = ?auto_104165 ?auto_104167 ) ) ( not ( = ?auto_104165 ?auto_104168 ) ) ( not ( = ?auto_104165 ?auto_104169 ) ) ( not ( = ?auto_104166 ?auto_104167 ) ) ( not ( = ?auto_104166 ?auto_104168 ) ) ( not ( = ?auto_104166 ?auto_104169 ) ) ( not ( = ?auto_104167 ?auto_104168 ) ) ( not ( = ?auto_104167 ?auto_104169 ) ) ( not ( = ?auto_104168 ?auto_104169 ) ) ( ON ?auto_104167 ?auto_104168 ) ( ON ?auto_104166 ?auto_104167 ) ( CLEAR ?auto_104164 ) ( ON ?auto_104165 ?auto_104166 ) ( CLEAR ?auto_104165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104161 ?auto_104162 ?auto_104163 ?auto_104164 ?auto_104165 )
      ( MAKE-8PILE ?auto_104161 ?auto_104162 ?auto_104163 ?auto_104164 ?auto_104165 ?auto_104166 ?auto_104167 ?auto_104168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104178 - BLOCK
      ?auto_104179 - BLOCK
      ?auto_104180 - BLOCK
      ?auto_104181 - BLOCK
      ?auto_104182 - BLOCK
      ?auto_104183 - BLOCK
      ?auto_104184 - BLOCK
      ?auto_104185 - BLOCK
    )
    :vars
    (
      ?auto_104186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104185 ?auto_104186 ) ( ON-TABLE ?auto_104178 ) ( ON ?auto_104179 ?auto_104178 ) ( ON ?auto_104180 ?auto_104179 ) ( not ( = ?auto_104178 ?auto_104179 ) ) ( not ( = ?auto_104178 ?auto_104180 ) ) ( not ( = ?auto_104178 ?auto_104181 ) ) ( not ( = ?auto_104178 ?auto_104182 ) ) ( not ( = ?auto_104178 ?auto_104183 ) ) ( not ( = ?auto_104178 ?auto_104184 ) ) ( not ( = ?auto_104178 ?auto_104185 ) ) ( not ( = ?auto_104178 ?auto_104186 ) ) ( not ( = ?auto_104179 ?auto_104180 ) ) ( not ( = ?auto_104179 ?auto_104181 ) ) ( not ( = ?auto_104179 ?auto_104182 ) ) ( not ( = ?auto_104179 ?auto_104183 ) ) ( not ( = ?auto_104179 ?auto_104184 ) ) ( not ( = ?auto_104179 ?auto_104185 ) ) ( not ( = ?auto_104179 ?auto_104186 ) ) ( not ( = ?auto_104180 ?auto_104181 ) ) ( not ( = ?auto_104180 ?auto_104182 ) ) ( not ( = ?auto_104180 ?auto_104183 ) ) ( not ( = ?auto_104180 ?auto_104184 ) ) ( not ( = ?auto_104180 ?auto_104185 ) ) ( not ( = ?auto_104180 ?auto_104186 ) ) ( not ( = ?auto_104181 ?auto_104182 ) ) ( not ( = ?auto_104181 ?auto_104183 ) ) ( not ( = ?auto_104181 ?auto_104184 ) ) ( not ( = ?auto_104181 ?auto_104185 ) ) ( not ( = ?auto_104181 ?auto_104186 ) ) ( not ( = ?auto_104182 ?auto_104183 ) ) ( not ( = ?auto_104182 ?auto_104184 ) ) ( not ( = ?auto_104182 ?auto_104185 ) ) ( not ( = ?auto_104182 ?auto_104186 ) ) ( not ( = ?auto_104183 ?auto_104184 ) ) ( not ( = ?auto_104183 ?auto_104185 ) ) ( not ( = ?auto_104183 ?auto_104186 ) ) ( not ( = ?auto_104184 ?auto_104185 ) ) ( not ( = ?auto_104184 ?auto_104186 ) ) ( not ( = ?auto_104185 ?auto_104186 ) ) ( ON ?auto_104184 ?auto_104185 ) ( ON ?auto_104183 ?auto_104184 ) ( ON ?auto_104182 ?auto_104183 ) ( CLEAR ?auto_104180 ) ( ON ?auto_104181 ?auto_104182 ) ( CLEAR ?auto_104181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104178 ?auto_104179 ?auto_104180 ?auto_104181 )
      ( MAKE-8PILE ?auto_104178 ?auto_104179 ?auto_104180 ?auto_104181 ?auto_104182 ?auto_104183 ?auto_104184 ?auto_104185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104195 - BLOCK
      ?auto_104196 - BLOCK
      ?auto_104197 - BLOCK
      ?auto_104198 - BLOCK
      ?auto_104199 - BLOCK
      ?auto_104200 - BLOCK
      ?auto_104201 - BLOCK
      ?auto_104202 - BLOCK
    )
    :vars
    (
      ?auto_104203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104202 ?auto_104203 ) ( ON-TABLE ?auto_104195 ) ( ON ?auto_104196 ?auto_104195 ) ( ON ?auto_104197 ?auto_104196 ) ( not ( = ?auto_104195 ?auto_104196 ) ) ( not ( = ?auto_104195 ?auto_104197 ) ) ( not ( = ?auto_104195 ?auto_104198 ) ) ( not ( = ?auto_104195 ?auto_104199 ) ) ( not ( = ?auto_104195 ?auto_104200 ) ) ( not ( = ?auto_104195 ?auto_104201 ) ) ( not ( = ?auto_104195 ?auto_104202 ) ) ( not ( = ?auto_104195 ?auto_104203 ) ) ( not ( = ?auto_104196 ?auto_104197 ) ) ( not ( = ?auto_104196 ?auto_104198 ) ) ( not ( = ?auto_104196 ?auto_104199 ) ) ( not ( = ?auto_104196 ?auto_104200 ) ) ( not ( = ?auto_104196 ?auto_104201 ) ) ( not ( = ?auto_104196 ?auto_104202 ) ) ( not ( = ?auto_104196 ?auto_104203 ) ) ( not ( = ?auto_104197 ?auto_104198 ) ) ( not ( = ?auto_104197 ?auto_104199 ) ) ( not ( = ?auto_104197 ?auto_104200 ) ) ( not ( = ?auto_104197 ?auto_104201 ) ) ( not ( = ?auto_104197 ?auto_104202 ) ) ( not ( = ?auto_104197 ?auto_104203 ) ) ( not ( = ?auto_104198 ?auto_104199 ) ) ( not ( = ?auto_104198 ?auto_104200 ) ) ( not ( = ?auto_104198 ?auto_104201 ) ) ( not ( = ?auto_104198 ?auto_104202 ) ) ( not ( = ?auto_104198 ?auto_104203 ) ) ( not ( = ?auto_104199 ?auto_104200 ) ) ( not ( = ?auto_104199 ?auto_104201 ) ) ( not ( = ?auto_104199 ?auto_104202 ) ) ( not ( = ?auto_104199 ?auto_104203 ) ) ( not ( = ?auto_104200 ?auto_104201 ) ) ( not ( = ?auto_104200 ?auto_104202 ) ) ( not ( = ?auto_104200 ?auto_104203 ) ) ( not ( = ?auto_104201 ?auto_104202 ) ) ( not ( = ?auto_104201 ?auto_104203 ) ) ( not ( = ?auto_104202 ?auto_104203 ) ) ( ON ?auto_104201 ?auto_104202 ) ( ON ?auto_104200 ?auto_104201 ) ( ON ?auto_104199 ?auto_104200 ) ( CLEAR ?auto_104197 ) ( ON ?auto_104198 ?auto_104199 ) ( CLEAR ?auto_104198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104195 ?auto_104196 ?auto_104197 ?auto_104198 )
      ( MAKE-8PILE ?auto_104195 ?auto_104196 ?auto_104197 ?auto_104198 ?auto_104199 ?auto_104200 ?auto_104201 ?auto_104202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104212 - BLOCK
      ?auto_104213 - BLOCK
      ?auto_104214 - BLOCK
      ?auto_104215 - BLOCK
      ?auto_104216 - BLOCK
      ?auto_104217 - BLOCK
      ?auto_104218 - BLOCK
      ?auto_104219 - BLOCK
    )
    :vars
    (
      ?auto_104220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104219 ?auto_104220 ) ( ON-TABLE ?auto_104212 ) ( ON ?auto_104213 ?auto_104212 ) ( not ( = ?auto_104212 ?auto_104213 ) ) ( not ( = ?auto_104212 ?auto_104214 ) ) ( not ( = ?auto_104212 ?auto_104215 ) ) ( not ( = ?auto_104212 ?auto_104216 ) ) ( not ( = ?auto_104212 ?auto_104217 ) ) ( not ( = ?auto_104212 ?auto_104218 ) ) ( not ( = ?auto_104212 ?auto_104219 ) ) ( not ( = ?auto_104212 ?auto_104220 ) ) ( not ( = ?auto_104213 ?auto_104214 ) ) ( not ( = ?auto_104213 ?auto_104215 ) ) ( not ( = ?auto_104213 ?auto_104216 ) ) ( not ( = ?auto_104213 ?auto_104217 ) ) ( not ( = ?auto_104213 ?auto_104218 ) ) ( not ( = ?auto_104213 ?auto_104219 ) ) ( not ( = ?auto_104213 ?auto_104220 ) ) ( not ( = ?auto_104214 ?auto_104215 ) ) ( not ( = ?auto_104214 ?auto_104216 ) ) ( not ( = ?auto_104214 ?auto_104217 ) ) ( not ( = ?auto_104214 ?auto_104218 ) ) ( not ( = ?auto_104214 ?auto_104219 ) ) ( not ( = ?auto_104214 ?auto_104220 ) ) ( not ( = ?auto_104215 ?auto_104216 ) ) ( not ( = ?auto_104215 ?auto_104217 ) ) ( not ( = ?auto_104215 ?auto_104218 ) ) ( not ( = ?auto_104215 ?auto_104219 ) ) ( not ( = ?auto_104215 ?auto_104220 ) ) ( not ( = ?auto_104216 ?auto_104217 ) ) ( not ( = ?auto_104216 ?auto_104218 ) ) ( not ( = ?auto_104216 ?auto_104219 ) ) ( not ( = ?auto_104216 ?auto_104220 ) ) ( not ( = ?auto_104217 ?auto_104218 ) ) ( not ( = ?auto_104217 ?auto_104219 ) ) ( not ( = ?auto_104217 ?auto_104220 ) ) ( not ( = ?auto_104218 ?auto_104219 ) ) ( not ( = ?auto_104218 ?auto_104220 ) ) ( not ( = ?auto_104219 ?auto_104220 ) ) ( ON ?auto_104218 ?auto_104219 ) ( ON ?auto_104217 ?auto_104218 ) ( ON ?auto_104216 ?auto_104217 ) ( ON ?auto_104215 ?auto_104216 ) ( CLEAR ?auto_104213 ) ( ON ?auto_104214 ?auto_104215 ) ( CLEAR ?auto_104214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104212 ?auto_104213 ?auto_104214 )
      ( MAKE-8PILE ?auto_104212 ?auto_104213 ?auto_104214 ?auto_104215 ?auto_104216 ?auto_104217 ?auto_104218 ?auto_104219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104229 - BLOCK
      ?auto_104230 - BLOCK
      ?auto_104231 - BLOCK
      ?auto_104232 - BLOCK
      ?auto_104233 - BLOCK
      ?auto_104234 - BLOCK
      ?auto_104235 - BLOCK
      ?auto_104236 - BLOCK
    )
    :vars
    (
      ?auto_104237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104236 ?auto_104237 ) ( ON-TABLE ?auto_104229 ) ( ON ?auto_104230 ?auto_104229 ) ( not ( = ?auto_104229 ?auto_104230 ) ) ( not ( = ?auto_104229 ?auto_104231 ) ) ( not ( = ?auto_104229 ?auto_104232 ) ) ( not ( = ?auto_104229 ?auto_104233 ) ) ( not ( = ?auto_104229 ?auto_104234 ) ) ( not ( = ?auto_104229 ?auto_104235 ) ) ( not ( = ?auto_104229 ?auto_104236 ) ) ( not ( = ?auto_104229 ?auto_104237 ) ) ( not ( = ?auto_104230 ?auto_104231 ) ) ( not ( = ?auto_104230 ?auto_104232 ) ) ( not ( = ?auto_104230 ?auto_104233 ) ) ( not ( = ?auto_104230 ?auto_104234 ) ) ( not ( = ?auto_104230 ?auto_104235 ) ) ( not ( = ?auto_104230 ?auto_104236 ) ) ( not ( = ?auto_104230 ?auto_104237 ) ) ( not ( = ?auto_104231 ?auto_104232 ) ) ( not ( = ?auto_104231 ?auto_104233 ) ) ( not ( = ?auto_104231 ?auto_104234 ) ) ( not ( = ?auto_104231 ?auto_104235 ) ) ( not ( = ?auto_104231 ?auto_104236 ) ) ( not ( = ?auto_104231 ?auto_104237 ) ) ( not ( = ?auto_104232 ?auto_104233 ) ) ( not ( = ?auto_104232 ?auto_104234 ) ) ( not ( = ?auto_104232 ?auto_104235 ) ) ( not ( = ?auto_104232 ?auto_104236 ) ) ( not ( = ?auto_104232 ?auto_104237 ) ) ( not ( = ?auto_104233 ?auto_104234 ) ) ( not ( = ?auto_104233 ?auto_104235 ) ) ( not ( = ?auto_104233 ?auto_104236 ) ) ( not ( = ?auto_104233 ?auto_104237 ) ) ( not ( = ?auto_104234 ?auto_104235 ) ) ( not ( = ?auto_104234 ?auto_104236 ) ) ( not ( = ?auto_104234 ?auto_104237 ) ) ( not ( = ?auto_104235 ?auto_104236 ) ) ( not ( = ?auto_104235 ?auto_104237 ) ) ( not ( = ?auto_104236 ?auto_104237 ) ) ( ON ?auto_104235 ?auto_104236 ) ( ON ?auto_104234 ?auto_104235 ) ( ON ?auto_104233 ?auto_104234 ) ( ON ?auto_104232 ?auto_104233 ) ( CLEAR ?auto_104230 ) ( ON ?auto_104231 ?auto_104232 ) ( CLEAR ?auto_104231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104229 ?auto_104230 ?auto_104231 )
      ( MAKE-8PILE ?auto_104229 ?auto_104230 ?auto_104231 ?auto_104232 ?auto_104233 ?auto_104234 ?auto_104235 ?auto_104236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104246 - BLOCK
      ?auto_104247 - BLOCK
      ?auto_104248 - BLOCK
      ?auto_104249 - BLOCK
      ?auto_104250 - BLOCK
      ?auto_104251 - BLOCK
      ?auto_104252 - BLOCK
      ?auto_104253 - BLOCK
    )
    :vars
    (
      ?auto_104254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104253 ?auto_104254 ) ( ON-TABLE ?auto_104246 ) ( not ( = ?auto_104246 ?auto_104247 ) ) ( not ( = ?auto_104246 ?auto_104248 ) ) ( not ( = ?auto_104246 ?auto_104249 ) ) ( not ( = ?auto_104246 ?auto_104250 ) ) ( not ( = ?auto_104246 ?auto_104251 ) ) ( not ( = ?auto_104246 ?auto_104252 ) ) ( not ( = ?auto_104246 ?auto_104253 ) ) ( not ( = ?auto_104246 ?auto_104254 ) ) ( not ( = ?auto_104247 ?auto_104248 ) ) ( not ( = ?auto_104247 ?auto_104249 ) ) ( not ( = ?auto_104247 ?auto_104250 ) ) ( not ( = ?auto_104247 ?auto_104251 ) ) ( not ( = ?auto_104247 ?auto_104252 ) ) ( not ( = ?auto_104247 ?auto_104253 ) ) ( not ( = ?auto_104247 ?auto_104254 ) ) ( not ( = ?auto_104248 ?auto_104249 ) ) ( not ( = ?auto_104248 ?auto_104250 ) ) ( not ( = ?auto_104248 ?auto_104251 ) ) ( not ( = ?auto_104248 ?auto_104252 ) ) ( not ( = ?auto_104248 ?auto_104253 ) ) ( not ( = ?auto_104248 ?auto_104254 ) ) ( not ( = ?auto_104249 ?auto_104250 ) ) ( not ( = ?auto_104249 ?auto_104251 ) ) ( not ( = ?auto_104249 ?auto_104252 ) ) ( not ( = ?auto_104249 ?auto_104253 ) ) ( not ( = ?auto_104249 ?auto_104254 ) ) ( not ( = ?auto_104250 ?auto_104251 ) ) ( not ( = ?auto_104250 ?auto_104252 ) ) ( not ( = ?auto_104250 ?auto_104253 ) ) ( not ( = ?auto_104250 ?auto_104254 ) ) ( not ( = ?auto_104251 ?auto_104252 ) ) ( not ( = ?auto_104251 ?auto_104253 ) ) ( not ( = ?auto_104251 ?auto_104254 ) ) ( not ( = ?auto_104252 ?auto_104253 ) ) ( not ( = ?auto_104252 ?auto_104254 ) ) ( not ( = ?auto_104253 ?auto_104254 ) ) ( ON ?auto_104252 ?auto_104253 ) ( ON ?auto_104251 ?auto_104252 ) ( ON ?auto_104250 ?auto_104251 ) ( ON ?auto_104249 ?auto_104250 ) ( ON ?auto_104248 ?auto_104249 ) ( CLEAR ?auto_104246 ) ( ON ?auto_104247 ?auto_104248 ) ( CLEAR ?auto_104247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104246 ?auto_104247 )
      ( MAKE-8PILE ?auto_104246 ?auto_104247 ?auto_104248 ?auto_104249 ?auto_104250 ?auto_104251 ?auto_104252 ?auto_104253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104263 - BLOCK
      ?auto_104264 - BLOCK
      ?auto_104265 - BLOCK
      ?auto_104266 - BLOCK
      ?auto_104267 - BLOCK
      ?auto_104268 - BLOCK
      ?auto_104269 - BLOCK
      ?auto_104270 - BLOCK
    )
    :vars
    (
      ?auto_104271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104270 ?auto_104271 ) ( ON-TABLE ?auto_104263 ) ( not ( = ?auto_104263 ?auto_104264 ) ) ( not ( = ?auto_104263 ?auto_104265 ) ) ( not ( = ?auto_104263 ?auto_104266 ) ) ( not ( = ?auto_104263 ?auto_104267 ) ) ( not ( = ?auto_104263 ?auto_104268 ) ) ( not ( = ?auto_104263 ?auto_104269 ) ) ( not ( = ?auto_104263 ?auto_104270 ) ) ( not ( = ?auto_104263 ?auto_104271 ) ) ( not ( = ?auto_104264 ?auto_104265 ) ) ( not ( = ?auto_104264 ?auto_104266 ) ) ( not ( = ?auto_104264 ?auto_104267 ) ) ( not ( = ?auto_104264 ?auto_104268 ) ) ( not ( = ?auto_104264 ?auto_104269 ) ) ( not ( = ?auto_104264 ?auto_104270 ) ) ( not ( = ?auto_104264 ?auto_104271 ) ) ( not ( = ?auto_104265 ?auto_104266 ) ) ( not ( = ?auto_104265 ?auto_104267 ) ) ( not ( = ?auto_104265 ?auto_104268 ) ) ( not ( = ?auto_104265 ?auto_104269 ) ) ( not ( = ?auto_104265 ?auto_104270 ) ) ( not ( = ?auto_104265 ?auto_104271 ) ) ( not ( = ?auto_104266 ?auto_104267 ) ) ( not ( = ?auto_104266 ?auto_104268 ) ) ( not ( = ?auto_104266 ?auto_104269 ) ) ( not ( = ?auto_104266 ?auto_104270 ) ) ( not ( = ?auto_104266 ?auto_104271 ) ) ( not ( = ?auto_104267 ?auto_104268 ) ) ( not ( = ?auto_104267 ?auto_104269 ) ) ( not ( = ?auto_104267 ?auto_104270 ) ) ( not ( = ?auto_104267 ?auto_104271 ) ) ( not ( = ?auto_104268 ?auto_104269 ) ) ( not ( = ?auto_104268 ?auto_104270 ) ) ( not ( = ?auto_104268 ?auto_104271 ) ) ( not ( = ?auto_104269 ?auto_104270 ) ) ( not ( = ?auto_104269 ?auto_104271 ) ) ( not ( = ?auto_104270 ?auto_104271 ) ) ( ON ?auto_104269 ?auto_104270 ) ( ON ?auto_104268 ?auto_104269 ) ( ON ?auto_104267 ?auto_104268 ) ( ON ?auto_104266 ?auto_104267 ) ( ON ?auto_104265 ?auto_104266 ) ( CLEAR ?auto_104263 ) ( ON ?auto_104264 ?auto_104265 ) ( CLEAR ?auto_104264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104263 ?auto_104264 )
      ( MAKE-8PILE ?auto_104263 ?auto_104264 ?auto_104265 ?auto_104266 ?auto_104267 ?auto_104268 ?auto_104269 ?auto_104270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104280 - BLOCK
      ?auto_104281 - BLOCK
      ?auto_104282 - BLOCK
      ?auto_104283 - BLOCK
      ?auto_104284 - BLOCK
      ?auto_104285 - BLOCK
      ?auto_104286 - BLOCK
      ?auto_104287 - BLOCK
    )
    :vars
    (
      ?auto_104288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104287 ?auto_104288 ) ( not ( = ?auto_104280 ?auto_104281 ) ) ( not ( = ?auto_104280 ?auto_104282 ) ) ( not ( = ?auto_104280 ?auto_104283 ) ) ( not ( = ?auto_104280 ?auto_104284 ) ) ( not ( = ?auto_104280 ?auto_104285 ) ) ( not ( = ?auto_104280 ?auto_104286 ) ) ( not ( = ?auto_104280 ?auto_104287 ) ) ( not ( = ?auto_104280 ?auto_104288 ) ) ( not ( = ?auto_104281 ?auto_104282 ) ) ( not ( = ?auto_104281 ?auto_104283 ) ) ( not ( = ?auto_104281 ?auto_104284 ) ) ( not ( = ?auto_104281 ?auto_104285 ) ) ( not ( = ?auto_104281 ?auto_104286 ) ) ( not ( = ?auto_104281 ?auto_104287 ) ) ( not ( = ?auto_104281 ?auto_104288 ) ) ( not ( = ?auto_104282 ?auto_104283 ) ) ( not ( = ?auto_104282 ?auto_104284 ) ) ( not ( = ?auto_104282 ?auto_104285 ) ) ( not ( = ?auto_104282 ?auto_104286 ) ) ( not ( = ?auto_104282 ?auto_104287 ) ) ( not ( = ?auto_104282 ?auto_104288 ) ) ( not ( = ?auto_104283 ?auto_104284 ) ) ( not ( = ?auto_104283 ?auto_104285 ) ) ( not ( = ?auto_104283 ?auto_104286 ) ) ( not ( = ?auto_104283 ?auto_104287 ) ) ( not ( = ?auto_104283 ?auto_104288 ) ) ( not ( = ?auto_104284 ?auto_104285 ) ) ( not ( = ?auto_104284 ?auto_104286 ) ) ( not ( = ?auto_104284 ?auto_104287 ) ) ( not ( = ?auto_104284 ?auto_104288 ) ) ( not ( = ?auto_104285 ?auto_104286 ) ) ( not ( = ?auto_104285 ?auto_104287 ) ) ( not ( = ?auto_104285 ?auto_104288 ) ) ( not ( = ?auto_104286 ?auto_104287 ) ) ( not ( = ?auto_104286 ?auto_104288 ) ) ( not ( = ?auto_104287 ?auto_104288 ) ) ( ON ?auto_104286 ?auto_104287 ) ( ON ?auto_104285 ?auto_104286 ) ( ON ?auto_104284 ?auto_104285 ) ( ON ?auto_104283 ?auto_104284 ) ( ON ?auto_104282 ?auto_104283 ) ( ON ?auto_104281 ?auto_104282 ) ( ON ?auto_104280 ?auto_104281 ) ( CLEAR ?auto_104280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104280 )
      ( MAKE-8PILE ?auto_104280 ?auto_104281 ?auto_104282 ?auto_104283 ?auto_104284 ?auto_104285 ?auto_104286 ?auto_104287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_104297 - BLOCK
      ?auto_104298 - BLOCK
      ?auto_104299 - BLOCK
      ?auto_104300 - BLOCK
      ?auto_104301 - BLOCK
      ?auto_104302 - BLOCK
      ?auto_104303 - BLOCK
      ?auto_104304 - BLOCK
    )
    :vars
    (
      ?auto_104305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104304 ?auto_104305 ) ( not ( = ?auto_104297 ?auto_104298 ) ) ( not ( = ?auto_104297 ?auto_104299 ) ) ( not ( = ?auto_104297 ?auto_104300 ) ) ( not ( = ?auto_104297 ?auto_104301 ) ) ( not ( = ?auto_104297 ?auto_104302 ) ) ( not ( = ?auto_104297 ?auto_104303 ) ) ( not ( = ?auto_104297 ?auto_104304 ) ) ( not ( = ?auto_104297 ?auto_104305 ) ) ( not ( = ?auto_104298 ?auto_104299 ) ) ( not ( = ?auto_104298 ?auto_104300 ) ) ( not ( = ?auto_104298 ?auto_104301 ) ) ( not ( = ?auto_104298 ?auto_104302 ) ) ( not ( = ?auto_104298 ?auto_104303 ) ) ( not ( = ?auto_104298 ?auto_104304 ) ) ( not ( = ?auto_104298 ?auto_104305 ) ) ( not ( = ?auto_104299 ?auto_104300 ) ) ( not ( = ?auto_104299 ?auto_104301 ) ) ( not ( = ?auto_104299 ?auto_104302 ) ) ( not ( = ?auto_104299 ?auto_104303 ) ) ( not ( = ?auto_104299 ?auto_104304 ) ) ( not ( = ?auto_104299 ?auto_104305 ) ) ( not ( = ?auto_104300 ?auto_104301 ) ) ( not ( = ?auto_104300 ?auto_104302 ) ) ( not ( = ?auto_104300 ?auto_104303 ) ) ( not ( = ?auto_104300 ?auto_104304 ) ) ( not ( = ?auto_104300 ?auto_104305 ) ) ( not ( = ?auto_104301 ?auto_104302 ) ) ( not ( = ?auto_104301 ?auto_104303 ) ) ( not ( = ?auto_104301 ?auto_104304 ) ) ( not ( = ?auto_104301 ?auto_104305 ) ) ( not ( = ?auto_104302 ?auto_104303 ) ) ( not ( = ?auto_104302 ?auto_104304 ) ) ( not ( = ?auto_104302 ?auto_104305 ) ) ( not ( = ?auto_104303 ?auto_104304 ) ) ( not ( = ?auto_104303 ?auto_104305 ) ) ( not ( = ?auto_104304 ?auto_104305 ) ) ( ON ?auto_104303 ?auto_104304 ) ( ON ?auto_104302 ?auto_104303 ) ( ON ?auto_104301 ?auto_104302 ) ( ON ?auto_104300 ?auto_104301 ) ( ON ?auto_104299 ?auto_104300 ) ( ON ?auto_104298 ?auto_104299 ) ( ON ?auto_104297 ?auto_104298 ) ( CLEAR ?auto_104297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104297 )
      ( MAKE-8PILE ?auto_104297 ?auto_104298 ?auto_104299 ?auto_104300 ?auto_104301 ?auto_104302 ?auto_104303 ?auto_104304 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104315 - BLOCK
      ?auto_104316 - BLOCK
      ?auto_104317 - BLOCK
      ?auto_104318 - BLOCK
      ?auto_104319 - BLOCK
      ?auto_104320 - BLOCK
      ?auto_104321 - BLOCK
      ?auto_104322 - BLOCK
      ?auto_104323 - BLOCK
    )
    :vars
    (
      ?auto_104324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104322 ) ( ON ?auto_104323 ?auto_104324 ) ( CLEAR ?auto_104323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104315 ) ( ON ?auto_104316 ?auto_104315 ) ( ON ?auto_104317 ?auto_104316 ) ( ON ?auto_104318 ?auto_104317 ) ( ON ?auto_104319 ?auto_104318 ) ( ON ?auto_104320 ?auto_104319 ) ( ON ?auto_104321 ?auto_104320 ) ( ON ?auto_104322 ?auto_104321 ) ( not ( = ?auto_104315 ?auto_104316 ) ) ( not ( = ?auto_104315 ?auto_104317 ) ) ( not ( = ?auto_104315 ?auto_104318 ) ) ( not ( = ?auto_104315 ?auto_104319 ) ) ( not ( = ?auto_104315 ?auto_104320 ) ) ( not ( = ?auto_104315 ?auto_104321 ) ) ( not ( = ?auto_104315 ?auto_104322 ) ) ( not ( = ?auto_104315 ?auto_104323 ) ) ( not ( = ?auto_104315 ?auto_104324 ) ) ( not ( = ?auto_104316 ?auto_104317 ) ) ( not ( = ?auto_104316 ?auto_104318 ) ) ( not ( = ?auto_104316 ?auto_104319 ) ) ( not ( = ?auto_104316 ?auto_104320 ) ) ( not ( = ?auto_104316 ?auto_104321 ) ) ( not ( = ?auto_104316 ?auto_104322 ) ) ( not ( = ?auto_104316 ?auto_104323 ) ) ( not ( = ?auto_104316 ?auto_104324 ) ) ( not ( = ?auto_104317 ?auto_104318 ) ) ( not ( = ?auto_104317 ?auto_104319 ) ) ( not ( = ?auto_104317 ?auto_104320 ) ) ( not ( = ?auto_104317 ?auto_104321 ) ) ( not ( = ?auto_104317 ?auto_104322 ) ) ( not ( = ?auto_104317 ?auto_104323 ) ) ( not ( = ?auto_104317 ?auto_104324 ) ) ( not ( = ?auto_104318 ?auto_104319 ) ) ( not ( = ?auto_104318 ?auto_104320 ) ) ( not ( = ?auto_104318 ?auto_104321 ) ) ( not ( = ?auto_104318 ?auto_104322 ) ) ( not ( = ?auto_104318 ?auto_104323 ) ) ( not ( = ?auto_104318 ?auto_104324 ) ) ( not ( = ?auto_104319 ?auto_104320 ) ) ( not ( = ?auto_104319 ?auto_104321 ) ) ( not ( = ?auto_104319 ?auto_104322 ) ) ( not ( = ?auto_104319 ?auto_104323 ) ) ( not ( = ?auto_104319 ?auto_104324 ) ) ( not ( = ?auto_104320 ?auto_104321 ) ) ( not ( = ?auto_104320 ?auto_104322 ) ) ( not ( = ?auto_104320 ?auto_104323 ) ) ( not ( = ?auto_104320 ?auto_104324 ) ) ( not ( = ?auto_104321 ?auto_104322 ) ) ( not ( = ?auto_104321 ?auto_104323 ) ) ( not ( = ?auto_104321 ?auto_104324 ) ) ( not ( = ?auto_104322 ?auto_104323 ) ) ( not ( = ?auto_104322 ?auto_104324 ) ) ( not ( = ?auto_104323 ?auto_104324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104323 ?auto_104324 )
      ( !STACK ?auto_104323 ?auto_104322 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104334 - BLOCK
      ?auto_104335 - BLOCK
      ?auto_104336 - BLOCK
      ?auto_104337 - BLOCK
      ?auto_104338 - BLOCK
      ?auto_104339 - BLOCK
      ?auto_104340 - BLOCK
      ?auto_104341 - BLOCK
      ?auto_104342 - BLOCK
    )
    :vars
    (
      ?auto_104343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104341 ) ( ON ?auto_104342 ?auto_104343 ) ( CLEAR ?auto_104342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104334 ) ( ON ?auto_104335 ?auto_104334 ) ( ON ?auto_104336 ?auto_104335 ) ( ON ?auto_104337 ?auto_104336 ) ( ON ?auto_104338 ?auto_104337 ) ( ON ?auto_104339 ?auto_104338 ) ( ON ?auto_104340 ?auto_104339 ) ( ON ?auto_104341 ?auto_104340 ) ( not ( = ?auto_104334 ?auto_104335 ) ) ( not ( = ?auto_104334 ?auto_104336 ) ) ( not ( = ?auto_104334 ?auto_104337 ) ) ( not ( = ?auto_104334 ?auto_104338 ) ) ( not ( = ?auto_104334 ?auto_104339 ) ) ( not ( = ?auto_104334 ?auto_104340 ) ) ( not ( = ?auto_104334 ?auto_104341 ) ) ( not ( = ?auto_104334 ?auto_104342 ) ) ( not ( = ?auto_104334 ?auto_104343 ) ) ( not ( = ?auto_104335 ?auto_104336 ) ) ( not ( = ?auto_104335 ?auto_104337 ) ) ( not ( = ?auto_104335 ?auto_104338 ) ) ( not ( = ?auto_104335 ?auto_104339 ) ) ( not ( = ?auto_104335 ?auto_104340 ) ) ( not ( = ?auto_104335 ?auto_104341 ) ) ( not ( = ?auto_104335 ?auto_104342 ) ) ( not ( = ?auto_104335 ?auto_104343 ) ) ( not ( = ?auto_104336 ?auto_104337 ) ) ( not ( = ?auto_104336 ?auto_104338 ) ) ( not ( = ?auto_104336 ?auto_104339 ) ) ( not ( = ?auto_104336 ?auto_104340 ) ) ( not ( = ?auto_104336 ?auto_104341 ) ) ( not ( = ?auto_104336 ?auto_104342 ) ) ( not ( = ?auto_104336 ?auto_104343 ) ) ( not ( = ?auto_104337 ?auto_104338 ) ) ( not ( = ?auto_104337 ?auto_104339 ) ) ( not ( = ?auto_104337 ?auto_104340 ) ) ( not ( = ?auto_104337 ?auto_104341 ) ) ( not ( = ?auto_104337 ?auto_104342 ) ) ( not ( = ?auto_104337 ?auto_104343 ) ) ( not ( = ?auto_104338 ?auto_104339 ) ) ( not ( = ?auto_104338 ?auto_104340 ) ) ( not ( = ?auto_104338 ?auto_104341 ) ) ( not ( = ?auto_104338 ?auto_104342 ) ) ( not ( = ?auto_104338 ?auto_104343 ) ) ( not ( = ?auto_104339 ?auto_104340 ) ) ( not ( = ?auto_104339 ?auto_104341 ) ) ( not ( = ?auto_104339 ?auto_104342 ) ) ( not ( = ?auto_104339 ?auto_104343 ) ) ( not ( = ?auto_104340 ?auto_104341 ) ) ( not ( = ?auto_104340 ?auto_104342 ) ) ( not ( = ?auto_104340 ?auto_104343 ) ) ( not ( = ?auto_104341 ?auto_104342 ) ) ( not ( = ?auto_104341 ?auto_104343 ) ) ( not ( = ?auto_104342 ?auto_104343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104342 ?auto_104343 )
      ( !STACK ?auto_104342 ?auto_104341 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104353 - BLOCK
      ?auto_104354 - BLOCK
      ?auto_104355 - BLOCK
      ?auto_104356 - BLOCK
      ?auto_104357 - BLOCK
      ?auto_104358 - BLOCK
      ?auto_104359 - BLOCK
      ?auto_104360 - BLOCK
      ?auto_104361 - BLOCK
    )
    :vars
    (
      ?auto_104362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104361 ?auto_104362 ) ( ON-TABLE ?auto_104353 ) ( ON ?auto_104354 ?auto_104353 ) ( ON ?auto_104355 ?auto_104354 ) ( ON ?auto_104356 ?auto_104355 ) ( ON ?auto_104357 ?auto_104356 ) ( ON ?auto_104358 ?auto_104357 ) ( ON ?auto_104359 ?auto_104358 ) ( not ( = ?auto_104353 ?auto_104354 ) ) ( not ( = ?auto_104353 ?auto_104355 ) ) ( not ( = ?auto_104353 ?auto_104356 ) ) ( not ( = ?auto_104353 ?auto_104357 ) ) ( not ( = ?auto_104353 ?auto_104358 ) ) ( not ( = ?auto_104353 ?auto_104359 ) ) ( not ( = ?auto_104353 ?auto_104360 ) ) ( not ( = ?auto_104353 ?auto_104361 ) ) ( not ( = ?auto_104353 ?auto_104362 ) ) ( not ( = ?auto_104354 ?auto_104355 ) ) ( not ( = ?auto_104354 ?auto_104356 ) ) ( not ( = ?auto_104354 ?auto_104357 ) ) ( not ( = ?auto_104354 ?auto_104358 ) ) ( not ( = ?auto_104354 ?auto_104359 ) ) ( not ( = ?auto_104354 ?auto_104360 ) ) ( not ( = ?auto_104354 ?auto_104361 ) ) ( not ( = ?auto_104354 ?auto_104362 ) ) ( not ( = ?auto_104355 ?auto_104356 ) ) ( not ( = ?auto_104355 ?auto_104357 ) ) ( not ( = ?auto_104355 ?auto_104358 ) ) ( not ( = ?auto_104355 ?auto_104359 ) ) ( not ( = ?auto_104355 ?auto_104360 ) ) ( not ( = ?auto_104355 ?auto_104361 ) ) ( not ( = ?auto_104355 ?auto_104362 ) ) ( not ( = ?auto_104356 ?auto_104357 ) ) ( not ( = ?auto_104356 ?auto_104358 ) ) ( not ( = ?auto_104356 ?auto_104359 ) ) ( not ( = ?auto_104356 ?auto_104360 ) ) ( not ( = ?auto_104356 ?auto_104361 ) ) ( not ( = ?auto_104356 ?auto_104362 ) ) ( not ( = ?auto_104357 ?auto_104358 ) ) ( not ( = ?auto_104357 ?auto_104359 ) ) ( not ( = ?auto_104357 ?auto_104360 ) ) ( not ( = ?auto_104357 ?auto_104361 ) ) ( not ( = ?auto_104357 ?auto_104362 ) ) ( not ( = ?auto_104358 ?auto_104359 ) ) ( not ( = ?auto_104358 ?auto_104360 ) ) ( not ( = ?auto_104358 ?auto_104361 ) ) ( not ( = ?auto_104358 ?auto_104362 ) ) ( not ( = ?auto_104359 ?auto_104360 ) ) ( not ( = ?auto_104359 ?auto_104361 ) ) ( not ( = ?auto_104359 ?auto_104362 ) ) ( not ( = ?auto_104360 ?auto_104361 ) ) ( not ( = ?auto_104360 ?auto_104362 ) ) ( not ( = ?auto_104361 ?auto_104362 ) ) ( CLEAR ?auto_104359 ) ( ON ?auto_104360 ?auto_104361 ) ( CLEAR ?auto_104360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_104353 ?auto_104354 ?auto_104355 ?auto_104356 ?auto_104357 ?auto_104358 ?auto_104359 ?auto_104360 )
      ( MAKE-9PILE ?auto_104353 ?auto_104354 ?auto_104355 ?auto_104356 ?auto_104357 ?auto_104358 ?auto_104359 ?auto_104360 ?auto_104361 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104372 - BLOCK
      ?auto_104373 - BLOCK
      ?auto_104374 - BLOCK
      ?auto_104375 - BLOCK
      ?auto_104376 - BLOCK
      ?auto_104377 - BLOCK
      ?auto_104378 - BLOCK
      ?auto_104379 - BLOCK
      ?auto_104380 - BLOCK
    )
    :vars
    (
      ?auto_104381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104380 ?auto_104381 ) ( ON-TABLE ?auto_104372 ) ( ON ?auto_104373 ?auto_104372 ) ( ON ?auto_104374 ?auto_104373 ) ( ON ?auto_104375 ?auto_104374 ) ( ON ?auto_104376 ?auto_104375 ) ( ON ?auto_104377 ?auto_104376 ) ( ON ?auto_104378 ?auto_104377 ) ( not ( = ?auto_104372 ?auto_104373 ) ) ( not ( = ?auto_104372 ?auto_104374 ) ) ( not ( = ?auto_104372 ?auto_104375 ) ) ( not ( = ?auto_104372 ?auto_104376 ) ) ( not ( = ?auto_104372 ?auto_104377 ) ) ( not ( = ?auto_104372 ?auto_104378 ) ) ( not ( = ?auto_104372 ?auto_104379 ) ) ( not ( = ?auto_104372 ?auto_104380 ) ) ( not ( = ?auto_104372 ?auto_104381 ) ) ( not ( = ?auto_104373 ?auto_104374 ) ) ( not ( = ?auto_104373 ?auto_104375 ) ) ( not ( = ?auto_104373 ?auto_104376 ) ) ( not ( = ?auto_104373 ?auto_104377 ) ) ( not ( = ?auto_104373 ?auto_104378 ) ) ( not ( = ?auto_104373 ?auto_104379 ) ) ( not ( = ?auto_104373 ?auto_104380 ) ) ( not ( = ?auto_104373 ?auto_104381 ) ) ( not ( = ?auto_104374 ?auto_104375 ) ) ( not ( = ?auto_104374 ?auto_104376 ) ) ( not ( = ?auto_104374 ?auto_104377 ) ) ( not ( = ?auto_104374 ?auto_104378 ) ) ( not ( = ?auto_104374 ?auto_104379 ) ) ( not ( = ?auto_104374 ?auto_104380 ) ) ( not ( = ?auto_104374 ?auto_104381 ) ) ( not ( = ?auto_104375 ?auto_104376 ) ) ( not ( = ?auto_104375 ?auto_104377 ) ) ( not ( = ?auto_104375 ?auto_104378 ) ) ( not ( = ?auto_104375 ?auto_104379 ) ) ( not ( = ?auto_104375 ?auto_104380 ) ) ( not ( = ?auto_104375 ?auto_104381 ) ) ( not ( = ?auto_104376 ?auto_104377 ) ) ( not ( = ?auto_104376 ?auto_104378 ) ) ( not ( = ?auto_104376 ?auto_104379 ) ) ( not ( = ?auto_104376 ?auto_104380 ) ) ( not ( = ?auto_104376 ?auto_104381 ) ) ( not ( = ?auto_104377 ?auto_104378 ) ) ( not ( = ?auto_104377 ?auto_104379 ) ) ( not ( = ?auto_104377 ?auto_104380 ) ) ( not ( = ?auto_104377 ?auto_104381 ) ) ( not ( = ?auto_104378 ?auto_104379 ) ) ( not ( = ?auto_104378 ?auto_104380 ) ) ( not ( = ?auto_104378 ?auto_104381 ) ) ( not ( = ?auto_104379 ?auto_104380 ) ) ( not ( = ?auto_104379 ?auto_104381 ) ) ( not ( = ?auto_104380 ?auto_104381 ) ) ( CLEAR ?auto_104378 ) ( ON ?auto_104379 ?auto_104380 ) ( CLEAR ?auto_104379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_104372 ?auto_104373 ?auto_104374 ?auto_104375 ?auto_104376 ?auto_104377 ?auto_104378 ?auto_104379 )
      ( MAKE-9PILE ?auto_104372 ?auto_104373 ?auto_104374 ?auto_104375 ?auto_104376 ?auto_104377 ?auto_104378 ?auto_104379 ?auto_104380 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104391 - BLOCK
      ?auto_104392 - BLOCK
      ?auto_104393 - BLOCK
      ?auto_104394 - BLOCK
      ?auto_104395 - BLOCK
      ?auto_104396 - BLOCK
      ?auto_104397 - BLOCK
      ?auto_104398 - BLOCK
      ?auto_104399 - BLOCK
    )
    :vars
    (
      ?auto_104400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104399 ?auto_104400 ) ( ON-TABLE ?auto_104391 ) ( ON ?auto_104392 ?auto_104391 ) ( ON ?auto_104393 ?auto_104392 ) ( ON ?auto_104394 ?auto_104393 ) ( ON ?auto_104395 ?auto_104394 ) ( ON ?auto_104396 ?auto_104395 ) ( not ( = ?auto_104391 ?auto_104392 ) ) ( not ( = ?auto_104391 ?auto_104393 ) ) ( not ( = ?auto_104391 ?auto_104394 ) ) ( not ( = ?auto_104391 ?auto_104395 ) ) ( not ( = ?auto_104391 ?auto_104396 ) ) ( not ( = ?auto_104391 ?auto_104397 ) ) ( not ( = ?auto_104391 ?auto_104398 ) ) ( not ( = ?auto_104391 ?auto_104399 ) ) ( not ( = ?auto_104391 ?auto_104400 ) ) ( not ( = ?auto_104392 ?auto_104393 ) ) ( not ( = ?auto_104392 ?auto_104394 ) ) ( not ( = ?auto_104392 ?auto_104395 ) ) ( not ( = ?auto_104392 ?auto_104396 ) ) ( not ( = ?auto_104392 ?auto_104397 ) ) ( not ( = ?auto_104392 ?auto_104398 ) ) ( not ( = ?auto_104392 ?auto_104399 ) ) ( not ( = ?auto_104392 ?auto_104400 ) ) ( not ( = ?auto_104393 ?auto_104394 ) ) ( not ( = ?auto_104393 ?auto_104395 ) ) ( not ( = ?auto_104393 ?auto_104396 ) ) ( not ( = ?auto_104393 ?auto_104397 ) ) ( not ( = ?auto_104393 ?auto_104398 ) ) ( not ( = ?auto_104393 ?auto_104399 ) ) ( not ( = ?auto_104393 ?auto_104400 ) ) ( not ( = ?auto_104394 ?auto_104395 ) ) ( not ( = ?auto_104394 ?auto_104396 ) ) ( not ( = ?auto_104394 ?auto_104397 ) ) ( not ( = ?auto_104394 ?auto_104398 ) ) ( not ( = ?auto_104394 ?auto_104399 ) ) ( not ( = ?auto_104394 ?auto_104400 ) ) ( not ( = ?auto_104395 ?auto_104396 ) ) ( not ( = ?auto_104395 ?auto_104397 ) ) ( not ( = ?auto_104395 ?auto_104398 ) ) ( not ( = ?auto_104395 ?auto_104399 ) ) ( not ( = ?auto_104395 ?auto_104400 ) ) ( not ( = ?auto_104396 ?auto_104397 ) ) ( not ( = ?auto_104396 ?auto_104398 ) ) ( not ( = ?auto_104396 ?auto_104399 ) ) ( not ( = ?auto_104396 ?auto_104400 ) ) ( not ( = ?auto_104397 ?auto_104398 ) ) ( not ( = ?auto_104397 ?auto_104399 ) ) ( not ( = ?auto_104397 ?auto_104400 ) ) ( not ( = ?auto_104398 ?auto_104399 ) ) ( not ( = ?auto_104398 ?auto_104400 ) ) ( not ( = ?auto_104399 ?auto_104400 ) ) ( ON ?auto_104398 ?auto_104399 ) ( CLEAR ?auto_104396 ) ( ON ?auto_104397 ?auto_104398 ) ( CLEAR ?auto_104397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104391 ?auto_104392 ?auto_104393 ?auto_104394 ?auto_104395 ?auto_104396 ?auto_104397 )
      ( MAKE-9PILE ?auto_104391 ?auto_104392 ?auto_104393 ?auto_104394 ?auto_104395 ?auto_104396 ?auto_104397 ?auto_104398 ?auto_104399 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104410 - BLOCK
      ?auto_104411 - BLOCK
      ?auto_104412 - BLOCK
      ?auto_104413 - BLOCK
      ?auto_104414 - BLOCK
      ?auto_104415 - BLOCK
      ?auto_104416 - BLOCK
      ?auto_104417 - BLOCK
      ?auto_104418 - BLOCK
    )
    :vars
    (
      ?auto_104419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104418 ?auto_104419 ) ( ON-TABLE ?auto_104410 ) ( ON ?auto_104411 ?auto_104410 ) ( ON ?auto_104412 ?auto_104411 ) ( ON ?auto_104413 ?auto_104412 ) ( ON ?auto_104414 ?auto_104413 ) ( ON ?auto_104415 ?auto_104414 ) ( not ( = ?auto_104410 ?auto_104411 ) ) ( not ( = ?auto_104410 ?auto_104412 ) ) ( not ( = ?auto_104410 ?auto_104413 ) ) ( not ( = ?auto_104410 ?auto_104414 ) ) ( not ( = ?auto_104410 ?auto_104415 ) ) ( not ( = ?auto_104410 ?auto_104416 ) ) ( not ( = ?auto_104410 ?auto_104417 ) ) ( not ( = ?auto_104410 ?auto_104418 ) ) ( not ( = ?auto_104410 ?auto_104419 ) ) ( not ( = ?auto_104411 ?auto_104412 ) ) ( not ( = ?auto_104411 ?auto_104413 ) ) ( not ( = ?auto_104411 ?auto_104414 ) ) ( not ( = ?auto_104411 ?auto_104415 ) ) ( not ( = ?auto_104411 ?auto_104416 ) ) ( not ( = ?auto_104411 ?auto_104417 ) ) ( not ( = ?auto_104411 ?auto_104418 ) ) ( not ( = ?auto_104411 ?auto_104419 ) ) ( not ( = ?auto_104412 ?auto_104413 ) ) ( not ( = ?auto_104412 ?auto_104414 ) ) ( not ( = ?auto_104412 ?auto_104415 ) ) ( not ( = ?auto_104412 ?auto_104416 ) ) ( not ( = ?auto_104412 ?auto_104417 ) ) ( not ( = ?auto_104412 ?auto_104418 ) ) ( not ( = ?auto_104412 ?auto_104419 ) ) ( not ( = ?auto_104413 ?auto_104414 ) ) ( not ( = ?auto_104413 ?auto_104415 ) ) ( not ( = ?auto_104413 ?auto_104416 ) ) ( not ( = ?auto_104413 ?auto_104417 ) ) ( not ( = ?auto_104413 ?auto_104418 ) ) ( not ( = ?auto_104413 ?auto_104419 ) ) ( not ( = ?auto_104414 ?auto_104415 ) ) ( not ( = ?auto_104414 ?auto_104416 ) ) ( not ( = ?auto_104414 ?auto_104417 ) ) ( not ( = ?auto_104414 ?auto_104418 ) ) ( not ( = ?auto_104414 ?auto_104419 ) ) ( not ( = ?auto_104415 ?auto_104416 ) ) ( not ( = ?auto_104415 ?auto_104417 ) ) ( not ( = ?auto_104415 ?auto_104418 ) ) ( not ( = ?auto_104415 ?auto_104419 ) ) ( not ( = ?auto_104416 ?auto_104417 ) ) ( not ( = ?auto_104416 ?auto_104418 ) ) ( not ( = ?auto_104416 ?auto_104419 ) ) ( not ( = ?auto_104417 ?auto_104418 ) ) ( not ( = ?auto_104417 ?auto_104419 ) ) ( not ( = ?auto_104418 ?auto_104419 ) ) ( ON ?auto_104417 ?auto_104418 ) ( CLEAR ?auto_104415 ) ( ON ?auto_104416 ?auto_104417 ) ( CLEAR ?auto_104416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104410 ?auto_104411 ?auto_104412 ?auto_104413 ?auto_104414 ?auto_104415 ?auto_104416 )
      ( MAKE-9PILE ?auto_104410 ?auto_104411 ?auto_104412 ?auto_104413 ?auto_104414 ?auto_104415 ?auto_104416 ?auto_104417 ?auto_104418 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104429 - BLOCK
      ?auto_104430 - BLOCK
      ?auto_104431 - BLOCK
      ?auto_104432 - BLOCK
      ?auto_104433 - BLOCK
      ?auto_104434 - BLOCK
      ?auto_104435 - BLOCK
      ?auto_104436 - BLOCK
      ?auto_104437 - BLOCK
    )
    :vars
    (
      ?auto_104438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104437 ?auto_104438 ) ( ON-TABLE ?auto_104429 ) ( ON ?auto_104430 ?auto_104429 ) ( ON ?auto_104431 ?auto_104430 ) ( ON ?auto_104432 ?auto_104431 ) ( ON ?auto_104433 ?auto_104432 ) ( not ( = ?auto_104429 ?auto_104430 ) ) ( not ( = ?auto_104429 ?auto_104431 ) ) ( not ( = ?auto_104429 ?auto_104432 ) ) ( not ( = ?auto_104429 ?auto_104433 ) ) ( not ( = ?auto_104429 ?auto_104434 ) ) ( not ( = ?auto_104429 ?auto_104435 ) ) ( not ( = ?auto_104429 ?auto_104436 ) ) ( not ( = ?auto_104429 ?auto_104437 ) ) ( not ( = ?auto_104429 ?auto_104438 ) ) ( not ( = ?auto_104430 ?auto_104431 ) ) ( not ( = ?auto_104430 ?auto_104432 ) ) ( not ( = ?auto_104430 ?auto_104433 ) ) ( not ( = ?auto_104430 ?auto_104434 ) ) ( not ( = ?auto_104430 ?auto_104435 ) ) ( not ( = ?auto_104430 ?auto_104436 ) ) ( not ( = ?auto_104430 ?auto_104437 ) ) ( not ( = ?auto_104430 ?auto_104438 ) ) ( not ( = ?auto_104431 ?auto_104432 ) ) ( not ( = ?auto_104431 ?auto_104433 ) ) ( not ( = ?auto_104431 ?auto_104434 ) ) ( not ( = ?auto_104431 ?auto_104435 ) ) ( not ( = ?auto_104431 ?auto_104436 ) ) ( not ( = ?auto_104431 ?auto_104437 ) ) ( not ( = ?auto_104431 ?auto_104438 ) ) ( not ( = ?auto_104432 ?auto_104433 ) ) ( not ( = ?auto_104432 ?auto_104434 ) ) ( not ( = ?auto_104432 ?auto_104435 ) ) ( not ( = ?auto_104432 ?auto_104436 ) ) ( not ( = ?auto_104432 ?auto_104437 ) ) ( not ( = ?auto_104432 ?auto_104438 ) ) ( not ( = ?auto_104433 ?auto_104434 ) ) ( not ( = ?auto_104433 ?auto_104435 ) ) ( not ( = ?auto_104433 ?auto_104436 ) ) ( not ( = ?auto_104433 ?auto_104437 ) ) ( not ( = ?auto_104433 ?auto_104438 ) ) ( not ( = ?auto_104434 ?auto_104435 ) ) ( not ( = ?auto_104434 ?auto_104436 ) ) ( not ( = ?auto_104434 ?auto_104437 ) ) ( not ( = ?auto_104434 ?auto_104438 ) ) ( not ( = ?auto_104435 ?auto_104436 ) ) ( not ( = ?auto_104435 ?auto_104437 ) ) ( not ( = ?auto_104435 ?auto_104438 ) ) ( not ( = ?auto_104436 ?auto_104437 ) ) ( not ( = ?auto_104436 ?auto_104438 ) ) ( not ( = ?auto_104437 ?auto_104438 ) ) ( ON ?auto_104436 ?auto_104437 ) ( ON ?auto_104435 ?auto_104436 ) ( CLEAR ?auto_104433 ) ( ON ?auto_104434 ?auto_104435 ) ( CLEAR ?auto_104434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104429 ?auto_104430 ?auto_104431 ?auto_104432 ?auto_104433 ?auto_104434 )
      ( MAKE-9PILE ?auto_104429 ?auto_104430 ?auto_104431 ?auto_104432 ?auto_104433 ?auto_104434 ?auto_104435 ?auto_104436 ?auto_104437 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104448 - BLOCK
      ?auto_104449 - BLOCK
      ?auto_104450 - BLOCK
      ?auto_104451 - BLOCK
      ?auto_104452 - BLOCK
      ?auto_104453 - BLOCK
      ?auto_104454 - BLOCK
      ?auto_104455 - BLOCK
      ?auto_104456 - BLOCK
    )
    :vars
    (
      ?auto_104457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104456 ?auto_104457 ) ( ON-TABLE ?auto_104448 ) ( ON ?auto_104449 ?auto_104448 ) ( ON ?auto_104450 ?auto_104449 ) ( ON ?auto_104451 ?auto_104450 ) ( ON ?auto_104452 ?auto_104451 ) ( not ( = ?auto_104448 ?auto_104449 ) ) ( not ( = ?auto_104448 ?auto_104450 ) ) ( not ( = ?auto_104448 ?auto_104451 ) ) ( not ( = ?auto_104448 ?auto_104452 ) ) ( not ( = ?auto_104448 ?auto_104453 ) ) ( not ( = ?auto_104448 ?auto_104454 ) ) ( not ( = ?auto_104448 ?auto_104455 ) ) ( not ( = ?auto_104448 ?auto_104456 ) ) ( not ( = ?auto_104448 ?auto_104457 ) ) ( not ( = ?auto_104449 ?auto_104450 ) ) ( not ( = ?auto_104449 ?auto_104451 ) ) ( not ( = ?auto_104449 ?auto_104452 ) ) ( not ( = ?auto_104449 ?auto_104453 ) ) ( not ( = ?auto_104449 ?auto_104454 ) ) ( not ( = ?auto_104449 ?auto_104455 ) ) ( not ( = ?auto_104449 ?auto_104456 ) ) ( not ( = ?auto_104449 ?auto_104457 ) ) ( not ( = ?auto_104450 ?auto_104451 ) ) ( not ( = ?auto_104450 ?auto_104452 ) ) ( not ( = ?auto_104450 ?auto_104453 ) ) ( not ( = ?auto_104450 ?auto_104454 ) ) ( not ( = ?auto_104450 ?auto_104455 ) ) ( not ( = ?auto_104450 ?auto_104456 ) ) ( not ( = ?auto_104450 ?auto_104457 ) ) ( not ( = ?auto_104451 ?auto_104452 ) ) ( not ( = ?auto_104451 ?auto_104453 ) ) ( not ( = ?auto_104451 ?auto_104454 ) ) ( not ( = ?auto_104451 ?auto_104455 ) ) ( not ( = ?auto_104451 ?auto_104456 ) ) ( not ( = ?auto_104451 ?auto_104457 ) ) ( not ( = ?auto_104452 ?auto_104453 ) ) ( not ( = ?auto_104452 ?auto_104454 ) ) ( not ( = ?auto_104452 ?auto_104455 ) ) ( not ( = ?auto_104452 ?auto_104456 ) ) ( not ( = ?auto_104452 ?auto_104457 ) ) ( not ( = ?auto_104453 ?auto_104454 ) ) ( not ( = ?auto_104453 ?auto_104455 ) ) ( not ( = ?auto_104453 ?auto_104456 ) ) ( not ( = ?auto_104453 ?auto_104457 ) ) ( not ( = ?auto_104454 ?auto_104455 ) ) ( not ( = ?auto_104454 ?auto_104456 ) ) ( not ( = ?auto_104454 ?auto_104457 ) ) ( not ( = ?auto_104455 ?auto_104456 ) ) ( not ( = ?auto_104455 ?auto_104457 ) ) ( not ( = ?auto_104456 ?auto_104457 ) ) ( ON ?auto_104455 ?auto_104456 ) ( ON ?auto_104454 ?auto_104455 ) ( CLEAR ?auto_104452 ) ( ON ?auto_104453 ?auto_104454 ) ( CLEAR ?auto_104453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104448 ?auto_104449 ?auto_104450 ?auto_104451 ?auto_104452 ?auto_104453 )
      ( MAKE-9PILE ?auto_104448 ?auto_104449 ?auto_104450 ?auto_104451 ?auto_104452 ?auto_104453 ?auto_104454 ?auto_104455 ?auto_104456 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104467 - BLOCK
      ?auto_104468 - BLOCK
      ?auto_104469 - BLOCK
      ?auto_104470 - BLOCK
      ?auto_104471 - BLOCK
      ?auto_104472 - BLOCK
      ?auto_104473 - BLOCK
      ?auto_104474 - BLOCK
      ?auto_104475 - BLOCK
    )
    :vars
    (
      ?auto_104476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104475 ?auto_104476 ) ( ON-TABLE ?auto_104467 ) ( ON ?auto_104468 ?auto_104467 ) ( ON ?auto_104469 ?auto_104468 ) ( ON ?auto_104470 ?auto_104469 ) ( not ( = ?auto_104467 ?auto_104468 ) ) ( not ( = ?auto_104467 ?auto_104469 ) ) ( not ( = ?auto_104467 ?auto_104470 ) ) ( not ( = ?auto_104467 ?auto_104471 ) ) ( not ( = ?auto_104467 ?auto_104472 ) ) ( not ( = ?auto_104467 ?auto_104473 ) ) ( not ( = ?auto_104467 ?auto_104474 ) ) ( not ( = ?auto_104467 ?auto_104475 ) ) ( not ( = ?auto_104467 ?auto_104476 ) ) ( not ( = ?auto_104468 ?auto_104469 ) ) ( not ( = ?auto_104468 ?auto_104470 ) ) ( not ( = ?auto_104468 ?auto_104471 ) ) ( not ( = ?auto_104468 ?auto_104472 ) ) ( not ( = ?auto_104468 ?auto_104473 ) ) ( not ( = ?auto_104468 ?auto_104474 ) ) ( not ( = ?auto_104468 ?auto_104475 ) ) ( not ( = ?auto_104468 ?auto_104476 ) ) ( not ( = ?auto_104469 ?auto_104470 ) ) ( not ( = ?auto_104469 ?auto_104471 ) ) ( not ( = ?auto_104469 ?auto_104472 ) ) ( not ( = ?auto_104469 ?auto_104473 ) ) ( not ( = ?auto_104469 ?auto_104474 ) ) ( not ( = ?auto_104469 ?auto_104475 ) ) ( not ( = ?auto_104469 ?auto_104476 ) ) ( not ( = ?auto_104470 ?auto_104471 ) ) ( not ( = ?auto_104470 ?auto_104472 ) ) ( not ( = ?auto_104470 ?auto_104473 ) ) ( not ( = ?auto_104470 ?auto_104474 ) ) ( not ( = ?auto_104470 ?auto_104475 ) ) ( not ( = ?auto_104470 ?auto_104476 ) ) ( not ( = ?auto_104471 ?auto_104472 ) ) ( not ( = ?auto_104471 ?auto_104473 ) ) ( not ( = ?auto_104471 ?auto_104474 ) ) ( not ( = ?auto_104471 ?auto_104475 ) ) ( not ( = ?auto_104471 ?auto_104476 ) ) ( not ( = ?auto_104472 ?auto_104473 ) ) ( not ( = ?auto_104472 ?auto_104474 ) ) ( not ( = ?auto_104472 ?auto_104475 ) ) ( not ( = ?auto_104472 ?auto_104476 ) ) ( not ( = ?auto_104473 ?auto_104474 ) ) ( not ( = ?auto_104473 ?auto_104475 ) ) ( not ( = ?auto_104473 ?auto_104476 ) ) ( not ( = ?auto_104474 ?auto_104475 ) ) ( not ( = ?auto_104474 ?auto_104476 ) ) ( not ( = ?auto_104475 ?auto_104476 ) ) ( ON ?auto_104474 ?auto_104475 ) ( ON ?auto_104473 ?auto_104474 ) ( ON ?auto_104472 ?auto_104473 ) ( CLEAR ?auto_104470 ) ( ON ?auto_104471 ?auto_104472 ) ( CLEAR ?auto_104471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104467 ?auto_104468 ?auto_104469 ?auto_104470 ?auto_104471 )
      ( MAKE-9PILE ?auto_104467 ?auto_104468 ?auto_104469 ?auto_104470 ?auto_104471 ?auto_104472 ?auto_104473 ?auto_104474 ?auto_104475 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104486 - BLOCK
      ?auto_104487 - BLOCK
      ?auto_104488 - BLOCK
      ?auto_104489 - BLOCK
      ?auto_104490 - BLOCK
      ?auto_104491 - BLOCK
      ?auto_104492 - BLOCK
      ?auto_104493 - BLOCK
      ?auto_104494 - BLOCK
    )
    :vars
    (
      ?auto_104495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104494 ?auto_104495 ) ( ON-TABLE ?auto_104486 ) ( ON ?auto_104487 ?auto_104486 ) ( ON ?auto_104488 ?auto_104487 ) ( ON ?auto_104489 ?auto_104488 ) ( not ( = ?auto_104486 ?auto_104487 ) ) ( not ( = ?auto_104486 ?auto_104488 ) ) ( not ( = ?auto_104486 ?auto_104489 ) ) ( not ( = ?auto_104486 ?auto_104490 ) ) ( not ( = ?auto_104486 ?auto_104491 ) ) ( not ( = ?auto_104486 ?auto_104492 ) ) ( not ( = ?auto_104486 ?auto_104493 ) ) ( not ( = ?auto_104486 ?auto_104494 ) ) ( not ( = ?auto_104486 ?auto_104495 ) ) ( not ( = ?auto_104487 ?auto_104488 ) ) ( not ( = ?auto_104487 ?auto_104489 ) ) ( not ( = ?auto_104487 ?auto_104490 ) ) ( not ( = ?auto_104487 ?auto_104491 ) ) ( not ( = ?auto_104487 ?auto_104492 ) ) ( not ( = ?auto_104487 ?auto_104493 ) ) ( not ( = ?auto_104487 ?auto_104494 ) ) ( not ( = ?auto_104487 ?auto_104495 ) ) ( not ( = ?auto_104488 ?auto_104489 ) ) ( not ( = ?auto_104488 ?auto_104490 ) ) ( not ( = ?auto_104488 ?auto_104491 ) ) ( not ( = ?auto_104488 ?auto_104492 ) ) ( not ( = ?auto_104488 ?auto_104493 ) ) ( not ( = ?auto_104488 ?auto_104494 ) ) ( not ( = ?auto_104488 ?auto_104495 ) ) ( not ( = ?auto_104489 ?auto_104490 ) ) ( not ( = ?auto_104489 ?auto_104491 ) ) ( not ( = ?auto_104489 ?auto_104492 ) ) ( not ( = ?auto_104489 ?auto_104493 ) ) ( not ( = ?auto_104489 ?auto_104494 ) ) ( not ( = ?auto_104489 ?auto_104495 ) ) ( not ( = ?auto_104490 ?auto_104491 ) ) ( not ( = ?auto_104490 ?auto_104492 ) ) ( not ( = ?auto_104490 ?auto_104493 ) ) ( not ( = ?auto_104490 ?auto_104494 ) ) ( not ( = ?auto_104490 ?auto_104495 ) ) ( not ( = ?auto_104491 ?auto_104492 ) ) ( not ( = ?auto_104491 ?auto_104493 ) ) ( not ( = ?auto_104491 ?auto_104494 ) ) ( not ( = ?auto_104491 ?auto_104495 ) ) ( not ( = ?auto_104492 ?auto_104493 ) ) ( not ( = ?auto_104492 ?auto_104494 ) ) ( not ( = ?auto_104492 ?auto_104495 ) ) ( not ( = ?auto_104493 ?auto_104494 ) ) ( not ( = ?auto_104493 ?auto_104495 ) ) ( not ( = ?auto_104494 ?auto_104495 ) ) ( ON ?auto_104493 ?auto_104494 ) ( ON ?auto_104492 ?auto_104493 ) ( ON ?auto_104491 ?auto_104492 ) ( CLEAR ?auto_104489 ) ( ON ?auto_104490 ?auto_104491 ) ( CLEAR ?auto_104490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104486 ?auto_104487 ?auto_104488 ?auto_104489 ?auto_104490 )
      ( MAKE-9PILE ?auto_104486 ?auto_104487 ?auto_104488 ?auto_104489 ?auto_104490 ?auto_104491 ?auto_104492 ?auto_104493 ?auto_104494 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104505 - BLOCK
      ?auto_104506 - BLOCK
      ?auto_104507 - BLOCK
      ?auto_104508 - BLOCK
      ?auto_104509 - BLOCK
      ?auto_104510 - BLOCK
      ?auto_104511 - BLOCK
      ?auto_104512 - BLOCK
      ?auto_104513 - BLOCK
    )
    :vars
    (
      ?auto_104514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104513 ?auto_104514 ) ( ON-TABLE ?auto_104505 ) ( ON ?auto_104506 ?auto_104505 ) ( ON ?auto_104507 ?auto_104506 ) ( not ( = ?auto_104505 ?auto_104506 ) ) ( not ( = ?auto_104505 ?auto_104507 ) ) ( not ( = ?auto_104505 ?auto_104508 ) ) ( not ( = ?auto_104505 ?auto_104509 ) ) ( not ( = ?auto_104505 ?auto_104510 ) ) ( not ( = ?auto_104505 ?auto_104511 ) ) ( not ( = ?auto_104505 ?auto_104512 ) ) ( not ( = ?auto_104505 ?auto_104513 ) ) ( not ( = ?auto_104505 ?auto_104514 ) ) ( not ( = ?auto_104506 ?auto_104507 ) ) ( not ( = ?auto_104506 ?auto_104508 ) ) ( not ( = ?auto_104506 ?auto_104509 ) ) ( not ( = ?auto_104506 ?auto_104510 ) ) ( not ( = ?auto_104506 ?auto_104511 ) ) ( not ( = ?auto_104506 ?auto_104512 ) ) ( not ( = ?auto_104506 ?auto_104513 ) ) ( not ( = ?auto_104506 ?auto_104514 ) ) ( not ( = ?auto_104507 ?auto_104508 ) ) ( not ( = ?auto_104507 ?auto_104509 ) ) ( not ( = ?auto_104507 ?auto_104510 ) ) ( not ( = ?auto_104507 ?auto_104511 ) ) ( not ( = ?auto_104507 ?auto_104512 ) ) ( not ( = ?auto_104507 ?auto_104513 ) ) ( not ( = ?auto_104507 ?auto_104514 ) ) ( not ( = ?auto_104508 ?auto_104509 ) ) ( not ( = ?auto_104508 ?auto_104510 ) ) ( not ( = ?auto_104508 ?auto_104511 ) ) ( not ( = ?auto_104508 ?auto_104512 ) ) ( not ( = ?auto_104508 ?auto_104513 ) ) ( not ( = ?auto_104508 ?auto_104514 ) ) ( not ( = ?auto_104509 ?auto_104510 ) ) ( not ( = ?auto_104509 ?auto_104511 ) ) ( not ( = ?auto_104509 ?auto_104512 ) ) ( not ( = ?auto_104509 ?auto_104513 ) ) ( not ( = ?auto_104509 ?auto_104514 ) ) ( not ( = ?auto_104510 ?auto_104511 ) ) ( not ( = ?auto_104510 ?auto_104512 ) ) ( not ( = ?auto_104510 ?auto_104513 ) ) ( not ( = ?auto_104510 ?auto_104514 ) ) ( not ( = ?auto_104511 ?auto_104512 ) ) ( not ( = ?auto_104511 ?auto_104513 ) ) ( not ( = ?auto_104511 ?auto_104514 ) ) ( not ( = ?auto_104512 ?auto_104513 ) ) ( not ( = ?auto_104512 ?auto_104514 ) ) ( not ( = ?auto_104513 ?auto_104514 ) ) ( ON ?auto_104512 ?auto_104513 ) ( ON ?auto_104511 ?auto_104512 ) ( ON ?auto_104510 ?auto_104511 ) ( ON ?auto_104509 ?auto_104510 ) ( CLEAR ?auto_104507 ) ( ON ?auto_104508 ?auto_104509 ) ( CLEAR ?auto_104508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104505 ?auto_104506 ?auto_104507 ?auto_104508 )
      ( MAKE-9PILE ?auto_104505 ?auto_104506 ?auto_104507 ?auto_104508 ?auto_104509 ?auto_104510 ?auto_104511 ?auto_104512 ?auto_104513 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104524 - BLOCK
      ?auto_104525 - BLOCK
      ?auto_104526 - BLOCK
      ?auto_104527 - BLOCK
      ?auto_104528 - BLOCK
      ?auto_104529 - BLOCK
      ?auto_104530 - BLOCK
      ?auto_104531 - BLOCK
      ?auto_104532 - BLOCK
    )
    :vars
    (
      ?auto_104533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104532 ?auto_104533 ) ( ON-TABLE ?auto_104524 ) ( ON ?auto_104525 ?auto_104524 ) ( ON ?auto_104526 ?auto_104525 ) ( not ( = ?auto_104524 ?auto_104525 ) ) ( not ( = ?auto_104524 ?auto_104526 ) ) ( not ( = ?auto_104524 ?auto_104527 ) ) ( not ( = ?auto_104524 ?auto_104528 ) ) ( not ( = ?auto_104524 ?auto_104529 ) ) ( not ( = ?auto_104524 ?auto_104530 ) ) ( not ( = ?auto_104524 ?auto_104531 ) ) ( not ( = ?auto_104524 ?auto_104532 ) ) ( not ( = ?auto_104524 ?auto_104533 ) ) ( not ( = ?auto_104525 ?auto_104526 ) ) ( not ( = ?auto_104525 ?auto_104527 ) ) ( not ( = ?auto_104525 ?auto_104528 ) ) ( not ( = ?auto_104525 ?auto_104529 ) ) ( not ( = ?auto_104525 ?auto_104530 ) ) ( not ( = ?auto_104525 ?auto_104531 ) ) ( not ( = ?auto_104525 ?auto_104532 ) ) ( not ( = ?auto_104525 ?auto_104533 ) ) ( not ( = ?auto_104526 ?auto_104527 ) ) ( not ( = ?auto_104526 ?auto_104528 ) ) ( not ( = ?auto_104526 ?auto_104529 ) ) ( not ( = ?auto_104526 ?auto_104530 ) ) ( not ( = ?auto_104526 ?auto_104531 ) ) ( not ( = ?auto_104526 ?auto_104532 ) ) ( not ( = ?auto_104526 ?auto_104533 ) ) ( not ( = ?auto_104527 ?auto_104528 ) ) ( not ( = ?auto_104527 ?auto_104529 ) ) ( not ( = ?auto_104527 ?auto_104530 ) ) ( not ( = ?auto_104527 ?auto_104531 ) ) ( not ( = ?auto_104527 ?auto_104532 ) ) ( not ( = ?auto_104527 ?auto_104533 ) ) ( not ( = ?auto_104528 ?auto_104529 ) ) ( not ( = ?auto_104528 ?auto_104530 ) ) ( not ( = ?auto_104528 ?auto_104531 ) ) ( not ( = ?auto_104528 ?auto_104532 ) ) ( not ( = ?auto_104528 ?auto_104533 ) ) ( not ( = ?auto_104529 ?auto_104530 ) ) ( not ( = ?auto_104529 ?auto_104531 ) ) ( not ( = ?auto_104529 ?auto_104532 ) ) ( not ( = ?auto_104529 ?auto_104533 ) ) ( not ( = ?auto_104530 ?auto_104531 ) ) ( not ( = ?auto_104530 ?auto_104532 ) ) ( not ( = ?auto_104530 ?auto_104533 ) ) ( not ( = ?auto_104531 ?auto_104532 ) ) ( not ( = ?auto_104531 ?auto_104533 ) ) ( not ( = ?auto_104532 ?auto_104533 ) ) ( ON ?auto_104531 ?auto_104532 ) ( ON ?auto_104530 ?auto_104531 ) ( ON ?auto_104529 ?auto_104530 ) ( ON ?auto_104528 ?auto_104529 ) ( CLEAR ?auto_104526 ) ( ON ?auto_104527 ?auto_104528 ) ( CLEAR ?auto_104527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104524 ?auto_104525 ?auto_104526 ?auto_104527 )
      ( MAKE-9PILE ?auto_104524 ?auto_104525 ?auto_104526 ?auto_104527 ?auto_104528 ?auto_104529 ?auto_104530 ?auto_104531 ?auto_104532 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104543 - BLOCK
      ?auto_104544 - BLOCK
      ?auto_104545 - BLOCK
      ?auto_104546 - BLOCK
      ?auto_104547 - BLOCK
      ?auto_104548 - BLOCK
      ?auto_104549 - BLOCK
      ?auto_104550 - BLOCK
      ?auto_104551 - BLOCK
    )
    :vars
    (
      ?auto_104552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104551 ?auto_104552 ) ( ON-TABLE ?auto_104543 ) ( ON ?auto_104544 ?auto_104543 ) ( not ( = ?auto_104543 ?auto_104544 ) ) ( not ( = ?auto_104543 ?auto_104545 ) ) ( not ( = ?auto_104543 ?auto_104546 ) ) ( not ( = ?auto_104543 ?auto_104547 ) ) ( not ( = ?auto_104543 ?auto_104548 ) ) ( not ( = ?auto_104543 ?auto_104549 ) ) ( not ( = ?auto_104543 ?auto_104550 ) ) ( not ( = ?auto_104543 ?auto_104551 ) ) ( not ( = ?auto_104543 ?auto_104552 ) ) ( not ( = ?auto_104544 ?auto_104545 ) ) ( not ( = ?auto_104544 ?auto_104546 ) ) ( not ( = ?auto_104544 ?auto_104547 ) ) ( not ( = ?auto_104544 ?auto_104548 ) ) ( not ( = ?auto_104544 ?auto_104549 ) ) ( not ( = ?auto_104544 ?auto_104550 ) ) ( not ( = ?auto_104544 ?auto_104551 ) ) ( not ( = ?auto_104544 ?auto_104552 ) ) ( not ( = ?auto_104545 ?auto_104546 ) ) ( not ( = ?auto_104545 ?auto_104547 ) ) ( not ( = ?auto_104545 ?auto_104548 ) ) ( not ( = ?auto_104545 ?auto_104549 ) ) ( not ( = ?auto_104545 ?auto_104550 ) ) ( not ( = ?auto_104545 ?auto_104551 ) ) ( not ( = ?auto_104545 ?auto_104552 ) ) ( not ( = ?auto_104546 ?auto_104547 ) ) ( not ( = ?auto_104546 ?auto_104548 ) ) ( not ( = ?auto_104546 ?auto_104549 ) ) ( not ( = ?auto_104546 ?auto_104550 ) ) ( not ( = ?auto_104546 ?auto_104551 ) ) ( not ( = ?auto_104546 ?auto_104552 ) ) ( not ( = ?auto_104547 ?auto_104548 ) ) ( not ( = ?auto_104547 ?auto_104549 ) ) ( not ( = ?auto_104547 ?auto_104550 ) ) ( not ( = ?auto_104547 ?auto_104551 ) ) ( not ( = ?auto_104547 ?auto_104552 ) ) ( not ( = ?auto_104548 ?auto_104549 ) ) ( not ( = ?auto_104548 ?auto_104550 ) ) ( not ( = ?auto_104548 ?auto_104551 ) ) ( not ( = ?auto_104548 ?auto_104552 ) ) ( not ( = ?auto_104549 ?auto_104550 ) ) ( not ( = ?auto_104549 ?auto_104551 ) ) ( not ( = ?auto_104549 ?auto_104552 ) ) ( not ( = ?auto_104550 ?auto_104551 ) ) ( not ( = ?auto_104550 ?auto_104552 ) ) ( not ( = ?auto_104551 ?auto_104552 ) ) ( ON ?auto_104550 ?auto_104551 ) ( ON ?auto_104549 ?auto_104550 ) ( ON ?auto_104548 ?auto_104549 ) ( ON ?auto_104547 ?auto_104548 ) ( ON ?auto_104546 ?auto_104547 ) ( CLEAR ?auto_104544 ) ( ON ?auto_104545 ?auto_104546 ) ( CLEAR ?auto_104545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104543 ?auto_104544 ?auto_104545 )
      ( MAKE-9PILE ?auto_104543 ?auto_104544 ?auto_104545 ?auto_104546 ?auto_104547 ?auto_104548 ?auto_104549 ?auto_104550 ?auto_104551 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104562 - BLOCK
      ?auto_104563 - BLOCK
      ?auto_104564 - BLOCK
      ?auto_104565 - BLOCK
      ?auto_104566 - BLOCK
      ?auto_104567 - BLOCK
      ?auto_104568 - BLOCK
      ?auto_104569 - BLOCK
      ?auto_104570 - BLOCK
    )
    :vars
    (
      ?auto_104571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104570 ?auto_104571 ) ( ON-TABLE ?auto_104562 ) ( ON ?auto_104563 ?auto_104562 ) ( not ( = ?auto_104562 ?auto_104563 ) ) ( not ( = ?auto_104562 ?auto_104564 ) ) ( not ( = ?auto_104562 ?auto_104565 ) ) ( not ( = ?auto_104562 ?auto_104566 ) ) ( not ( = ?auto_104562 ?auto_104567 ) ) ( not ( = ?auto_104562 ?auto_104568 ) ) ( not ( = ?auto_104562 ?auto_104569 ) ) ( not ( = ?auto_104562 ?auto_104570 ) ) ( not ( = ?auto_104562 ?auto_104571 ) ) ( not ( = ?auto_104563 ?auto_104564 ) ) ( not ( = ?auto_104563 ?auto_104565 ) ) ( not ( = ?auto_104563 ?auto_104566 ) ) ( not ( = ?auto_104563 ?auto_104567 ) ) ( not ( = ?auto_104563 ?auto_104568 ) ) ( not ( = ?auto_104563 ?auto_104569 ) ) ( not ( = ?auto_104563 ?auto_104570 ) ) ( not ( = ?auto_104563 ?auto_104571 ) ) ( not ( = ?auto_104564 ?auto_104565 ) ) ( not ( = ?auto_104564 ?auto_104566 ) ) ( not ( = ?auto_104564 ?auto_104567 ) ) ( not ( = ?auto_104564 ?auto_104568 ) ) ( not ( = ?auto_104564 ?auto_104569 ) ) ( not ( = ?auto_104564 ?auto_104570 ) ) ( not ( = ?auto_104564 ?auto_104571 ) ) ( not ( = ?auto_104565 ?auto_104566 ) ) ( not ( = ?auto_104565 ?auto_104567 ) ) ( not ( = ?auto_104565 ?auto_104568 ) ) ( not ( = ?auto_104565 ?auto_104569 ) ) ( not ( = ?auto_104565 ?auto_104570 ) ) ( not ( = ?auto_104565 ?auto_104571 ) ) ( not ( = ?auto_104566 ?auto_104567 ) ) ( not ( = ?auto_104566 ?auto_104568 ) ) ( not ( = ?auto_104566 ?auto_104569 ) ) ( not ( = ?auto_104566 ?auto_104570 ) ) ( not ( = ?auto_104566 ?auto_104571 ) ) ( not ( = ?auto_104567 ?auto_104568 ) ) ( not ( = ?auto_104567 ?auto_104569 ) ) ( not ( = ?auto_104567 ?auto_104570 ) ) ( not ( = ?auto_104567 ?auto_104571 ) ) ( not ( = ?auto_104568 ?auto_104569 ) ) ( not ( = ?auto_104568 ?auto_104570 ) ) ( not ( = ?auto_104568 ?auto_104571 ) ) ( not ( = ?auto_104569 ?auto_104570 ) ) ( not ( = ?auto_104569 ?auto_104571 ) ) ( not ( = ?auto_104570 ?auto_104571 ) ) ( ON ?auto_104569 ?auto_104570 ) ( ON ?auto_104568 ?auto_104569 ) ( ON ?auto_104567 ?auto_104568 ) ( ON ?auto_104566 ?auto_104567 ) ( ON ?auto_104565 ?auto_104566 ) ( CLEAR ?auto_104563 ) ( ON ?auto_104564 ?auto_104565 ) ( CLEAR ?auto_104564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104562 ?auto_104563 ?auto_104564 )
      ( MAKE-9PILE ?auto_104562 ?auto_104563 ?auto_104564 ?auto_104565 ?auto_104566 ?auto_104567 ?auto_104568 ?auto_104569 ?auto_104570 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104581 - BLOCK
      ?auto_104582 - BLOCK
      ?auto_104583 - BLOCK
      ?auto_104584 - BLOCK
      ?auto_104585 - BLOCK
      ?auto_104586 - BLOCK
      ?auto_104587 - BLOCK
      ?auto_104588 - BLOCK
      ?auto_104589 - BLOCK
    )
    :vars
    (
      ?auto_104590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104589 ?auto_104590 ) ( ON-TABLE ?auto_104581 ) ( not ( = ?auto_104581 ?auto_104582 ) ) ( not ( = ?auto_104581 ?auto_104583 ) ) ( not ( = ?auto_104581 ?auto_104584 ) ) ( not ( = ?auto_104581 ?auto_104585 ) ) ( not ( = ?auto_104581 ?auto_104586 ) ) ( not ( = ?auto_104581 ?auto_104587 ) ) ( not ( = ?auto_104581 ?auto_104588 ) ) ( not ( = ?auto_104581 ?auto_104589 ) ) ( not ( = ?auto_104581 ?auto_104590 ) ) ( not ( = ?auto_104582 ?auto_104583 ) ) ( not ( = ?auto_104582 ?auto_104584 ) ) ( not ( = ?auto_104582 ?auto_104585 ) ) ( not ( = ?auto_104582 ?auto_104586 ) ) ( not ( = ?auto_104582 ?auto_104587 ) ) ( not ( = ?auto_104582 ?auto_104588 ) ) ( not ( = ?auto_104582 ?auto_104589 ) ) ( not ( = ?auto_104582 ?auto_104590 ) ) ( not ( = ?auto_104583 ?auto_104584 ) ) ( not ( = ?auto_104583 ?auto_104585 ) ) ( not ( = ?auto_104583 ?auto_104586 ) ) ( not ( = ?auto_104583 ?auto_104587 ) ) ( not ( = ?auto_104583 ?auto_104588 ) ) ( not ( = ?auto_104583 ?auto_104589 ) ) ( not ( = ?auto_104583 ?auto_104590 ) ) ( not ( = ?auto_104584 ?auto_104585 ) ) ( not ( = ?auto_104584 ?auto_104586 ) ) ( not ( = ?auto_104584 ?auto_104587 ) ) ( not ( = ?auto_104584 ?auto_104588 ) ) ( not ( = ?auto_104584 ?auto_104589 ) ) ( not ( = ?auto_104584 ?auto_104590 ) ) ( not ( = ?auto_104585 ?auto_104586 ) ) ( not ( = ?auto_104585 ?auto_104587 ) ) ( not ( = ?auto_104585 ?auto_104588 ) ) ( not ( = ?auto_104585 ?auto_104589 ) ) ( not ( = ?auto_104585 ?auto_104590 ) ) ( not ( = ?auto_104586 ?auto_104587 ) ) ( not ( = ?auto_104586 ?auto_104588 ) ) ( not ( = ?auto_104586 ?auto_104589 ) ) ( not ( = ?auto_104586 ?auto_104590 ) ) ( not ( = ?auto_104587 ?auto_104588 ) ) ( not ( = ?auto_104587 ?auto_104589 ) ) ( not ( = ?auto_104587 ?auto_104590 ) ) ( not ( = ?auto_104588 ?auto_104589 ) ) ( not ( = ?auto_104588 ?auto_104590 ) ) ( not ( = ?auto_104589 ?auto_104590 ) ) ( ON ?auto_104588 ?auto_104589 ) ( ON ?auto_104587 ?auto_104588 ) ( ON ?auto_104586 ?auto_104587 ) ( ON ?auto_104585 ?auto_104586 ) ( ON ?auto_104584 ?auto_104585 ) ( ON ?auto_104583 ?auto_104584 ) ( CLEAR ?auto_104581 ) ( ON ?auto_104582 ?auto_104583 ) ( CLEAR ?auto_104582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104581 ?auto_104582 )
      ( MAKE-9PILE ?auto_104581 ?auto_104582 ?auto_104583 ?auto_104584 ?auto_104585 ?auto_104586 ?auto_104587 ?auto_104588 ?auto_104589 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104600 - BLOCK
      ?auto_104601 - BLOCK
      ?auto_104602 - BLOCK
      ?auto_104603 - BLOCK
      ?auto_104604 - BLOCK
      ?auto_104605 - BLOCK
      ?auto_104606 - BLOCK
      ?auto_104607 - BLOCK
      ?auto_104608 - BLOCK
    )
    :vars
    (
      ?auto_104609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104608 ?auto_104609 ) ( ON-TABLE ?auto_104600 ) ( not ( = ?auto_104600 ?auto_104601 ) ) ( not ( = ?auto_104600 ?auto_104602 ) ) ( not ( = ?auto_104600 ?auto_104603 ) ) ( not ( = ?auto_104600 ?auto_104604 ) ) ( not ( = ?auto_104600 ?auto_104605 ) ) ( not ( = ?auto_104600 ?auto_104606 ) ) ( not ( = ?auto_104600 ?auto_104607 ) ) ( not ( = ?auto_104600 ?auto_104608 ) ) ( not ( = ?auto_104600 ?auto_104609 ) ) ( not ( = ?auto_104601 ?auto_104602 ) ) ( not ( = ?auto_104601 ?auto_104603 ) ) ( not ( = ?auto_104601 ?auto_104604 ) ) ( not ( = ?auto_104601 ?auto_104605 ) ) ( not ( = ?auto_104601 ?auto_104606 ) ) ( not ( = ?auto_104601 ?auto_104607 ) ) ( not ( = ?auto_104601 ?auto_104608 ) ) ( not ( = ?auto_104601 ?auto_104609 ) ) ( not ( = ?auto_104602 ?auto_104603 ) ) ( not ( = ?auto_104602 ?auto_104604 ) ) ( not ( = ?auto_104602 ?auto_104605 ) ) ( not ( = ?auto_104602 ?auto_104606 ) ) ( not ( = ?auto_104602 ?auto_104607 ) ) ( not ( = ?auto_104602 ?auto_104608 ) ) ( not ( = ?auto_104602 ?auto_104609 ) ) ( not ( = ?auto_104603 ?auto_104604 ) ) ( not ( = ?auto_104603 ?auto_104605 ) ) ( not ( = ?auto_104603 ?auto_104606 ) ) ( not ( = ?auto_104603 ?auto_104607 ) ) ( not ( = ?auto_104603 ?auto_104608 ) ) ( not ( = ?auto_104603 ?auto_104609 ) ) ( not ( = ?auto_104604 ?auto_104605 ) ) ( not ( = ?auto_104604 ?auto_104606 ) ) ( not ( = ?auto_104604 ?auto_104607 ) ) ( not ( = ?auto_104604 ?auto_104608 ) ) ( not ( = ?auto_104604 ?auto_104609 ) ) ( not ( = ?auto_104605 ?auto_104606 ) ) ( not ( = ?auto_104605 ?auto_104607 ) ) ( not ( = ?auto_104605 ?auto_104608 ) ) ( not ( = ?auto_104605 ?auto_104609 ) ) ( not ( = ?auto_104606 ?auto_104607 ) ) ( not ( = ?auto_104606 ?auto_104608 ) ) ( not ( = ?auto_104606 ?auto_104609 ) ) ( not ( = ?auto_104607 ?auto_104608 ) ) ( not ( = ?auto_104607 ?auto_104609 ) ) ( not ( = ?auto_104608 ?auto_104609 ) ) ( ON ?auto_104607 ?auto_104608 ) ( ON ?auto_104606 ?auto_104607 ) ( ON ?auto_104605 ?auto_104606 ) ( ON ?auto_104604 ?auto_104605 ) ( ON ?auto_104603 ?auto_104604 ) ( ON ?auto_104602 ?auto_104603 ) ( CLEAR ?auto_104600 ) ( ON ?auto_104601 ?auto_104602 ) ( CLEAR ?auto_104601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104600 ?auto_104601 )
      ( MAKE-9PILE ?auto_104600 ?auto_104601 ?auto_104602 ?auto_104603 ?auto_104604 ?auto_104605 ?auto_104606 ?auto_104607 ?auto_104608 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104619 - BLOCK
      ?auto_104620 - BLOCK
      ?auto_104621 - BLOCK
      ?auto_104622 - BLOCK
      ?auto_104623 - BLOCK
      ?auto_104624 - BLOCK
      ?auto_104625 - BLOCK
      ?auto_104626 - BLOCK
      ?auto_104627 - BLOCK
    )
    :vars
    (
      ?auto_104628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104627 ?auto_104628 ) ( not ( = ?auto_104619 ?auto_104620 ) ) ( not ( = ?auto_104619 ?auto_104621 ) ) ( not ( = ?auto_104619 ?auto_104622 ) ) ( not ( = ?auto_104619 ?auto_104623 ) ) ( not ( = ?auto_104619 ?auto_104624 ) ) ( not ( = ?auto_104619 ?auto_104625 ) ) ( not ( = ?auto_104619 ?auto_104626 ) ) ( not ( = ?auto_104619 ?auto_104627 ) ) ( not ( = ?auto_104619 ?auto_104628 ) ) ( not ( = ?auto_104620 ?auto_104621 ) ) ( not ( = ?auto_104620 ?auto_104622 ) ) ( not ( = ?auto_104620 ?auto_104623 ) ) ( not ( = ?auto_104620 ?auto_104624 ) ) ( not ( = ?auto_104620 ?auto_104625 ) ) ( not ( = ?auto_104620 ?auto_104626 ) ) ( not ( = ?auto_104620 ?auto_104627 ) ) ( not ( = ?auto_104620 ?auto_104628 ) ) ( not ( = ?auto_104621 ?auto_104622 ) ) ( not ( = ?auto_104621 ?auto_104623 ) ) ( not ( = ?auto_104621 ?auto_104624 ) ) ( not ( = ?auto_104621 ?auto_104625 ) ) ( not ( = ?auto_104621 ?auto_104626 ) ) ( not ( = ?auto_104621 ?auto_104627 ) ) ( not ( = ?auto_104621 ?auto_104628 ) ) ( not ( = ?auto_104622 ?auto_104623 ) ) ( not ( = ?auto_104622 ?auto_104624 ) ) ( not ( = ?auto_104622 ?auto_104625 ) ) ( not ( = ?auto_104622 ?auto_104626 ) ) ( not ( = ?auto_104622 ?auto_104627 ) ) ( not ( = ?auto_104622 ?auto_104628 ) ) ( not ( = ?auto_104623 ?auto_104624 ) ) ( not ( = ?auto_104623 ?auto_104625 ) ) ( not ( = ?auto_104623 ?auto_104626 ) ) ( not ( = ?auto_104623 ?auto_104627 ) ) ( not ( = ?auto_104623 ?auto_104628 ) ) ( not ( = ?auto_104624 ?auto_104625 ) ) ( not ( = ?auto_104624 ?auto_104626 ) ) ( not ( = ?auto_104624 ?auto_104627 ) ) ( not ( = ?auto_104624 ?auto_104628 ) ) ( not ( = ?auto_104625 ?auto_104626 ) ) ( not ( = ?auto_104625 ?auto_104627 ) ) ( not ( = ?auto_104625 ?auto_104628 ) ) ( not ( = ?auto_104626 ?auto_104627 ) ) ( not ( = ?auto_104626 ?auto_104628 ) ) ( not ( = ?auto_104627 ?auto_104628 ) ) ( ON ?auto_104626 ?auto_104627 ) ( ON ?auto_104625 ?auto_104626 ) ( ON ?auto_104624 ?auto_104625 ) ( ON ?auto_104623 ?auto_104624 ) ( ON ?auto_104622 ?auto_104623 ) ( ON ?auto_104621 ?auto_104622 ) ( ON ?auto_104620 ?auto_104621 ) ( ON ?auto_104619 ?auto_104620 ) ( CLEAR ?auto_104619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104619 )
      ( MAKE-9PILE ?auto_104619 ?auto_104620 ?auto_104621 ?auto_104622 ?auto_104623 ?auto_104624 ?auto_104625 ?auto_104626 ?auto_104627 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_104638 - BLOCK
      ?auto_104639 - BLOCK
      ?auto_104640 - BLOCK
      ?auto_104641 - BLOCK
      ?auto_104642 - BLOCK
      ?auto_104643 - BLOCK
      ?auto_104644 - BLOCK
      ?auto_104645 - BLOCK
      ?auto_104646 - BLOCK
    )
    :vars
    (
      ?auto_104647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104646 ?auto_104647 ) ( not ( = ?auto_104638 ?auto_104639 ) ) ( not ( = ?auto_104638 ?auto_104640 ) ) ( not ( = ?auto_104638 ?auto_104641 ) ) ( not ( = ?auto_104638 ?auto_104642 ) ) ( not ( = ?auto_104638 ?auto_104643 ) ) ( not ( = ?auto_104638 ?auto_104644 ) ) ( not ( = ?auto_104638 ?auto_104645 ) ) ( not ( = ?auto_104638 ?auto_104646 ) ) ( not ( = ?auto_104638 ?auto_104647 ) ) ( not ( = ?auto_104639 ?auto_104640 ) ) ( not ( = ?auto_104639 ?auto_104641 ) ) ( not ( = ?auto_104639 ?auto_104642 ) ) ( not ( = ?auto_104639 ?auto_104643 ) ) ( not ( = ?auto_104639 ?auto_104644 ) ) ( not ( = ?auto_104639 ?auto_104645 ) ) ( not ( = ?auto_104639 ?auto_104646 ) ) ( not ( = ?auto_104639 ?auto_104647 ) ) ( not ( = ?auto_104640 ?auto_104641 ) ) ( not ( = ?auto_104640 ?auto_104642 ) ) ( not ( = ?auto_104640 ?auto_104643 ) ) ( not ( = ?auto_104640 ?auto_104644 ) ) ( not ( = ?auto_104640 ?auto_104645 ) ) ( not ( = ?auto_104640 ?auto_104646 ) ) ( not ( = ?auto_104640 ?auto_104647 ) ) ( not ( = ?auto_104641 ?auto_104642 ) ) ( not ( = ?auto_104641 ?auto_104643 ) ) ( not ( = ?auto_104641 ?auto_104644 ) ) ( not ( = ?auto_104641 ?auto_104645 ) ) ( not ( = ?auto_104641 ?auto_104646 ) ) ( not ( = ?auto_104641 ?auto_104647 ) ) ( not ( = ?auto_104642 ?auto_104643 ) ) ( not ( = ?auto_104642 ?auto_104644 ) ) ( not ( = ?auto_104642 ?auto_104645 ) ) ( not ( = ?auto_104642 ?auto_104646 ) ) ( not ( = ?auto_104642 ?auto_104647 ) ) ( not ( = ?auto_104643 ?auto_104644 ) ) ( not ( = ?auto_104643 ?auto_104645 ) ) ( not ( = ?auto_104643 ?auto_104646 ) ) ( not ( = ?auto_104643 ?auto_104647 ) ) ( not ( = ?auto_104644 ?auto_104645 ) ) ( not ( = ?auto_104644 ?auto_104646 ) ) ( not ( = ?auto_104644 ?auto_104647 ) ) ( not ( = ?auto_104645 ?auto_104646 ) ) ( not ( = ?auto_104645 ?auto_104647 ) ) ( not ( = ?auto_104646 ?auto_104647 ) ) ( ON ?auto_104645 ?auto_104646 ) ( ON ?auto_104644 ?auto_104645 ) ( ON ?auto_104643 ?auto_104644 ) ( ON ?auto_104642 ?auto_104643 ) ( ON ?auto_104641 ?auto_104642 ) ( ON ?auto_104640 ?auto_104641 ) ( ON ?auto_104639 ?auto_104640 ) ( ON ?auto_104638 ?auto_104639 ) ( CLEAR ?auto_104638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104638 )
      ( MAKE-9PILE ?auto_104638 ?auto_104639 ?auto_104640 ?auto_104641 ?auto_104642 ?auto_104643 ?auto_104644 ?auto_104645 ?auto_104646 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104658 - BLOCK
      ?auto_104659 - BLOCK
      ?auto_104660 - BLOCK
      ?auto_104661 - BLOCK
      ?auto_104662 - BLOCK
      ?auto_104663 - BLOCK
      ?auto_104664 - BLOCK
      ?auto_104665 - BLOCK
      ?auto_104666 - BLOCK
      ?auto_104667 - BLOCK
    )
    :vars
    (
      ?auto_104668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104666 ) ( ON ?auto_104667 ?auto_104668 ) ( CLEAR ?auto_104667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104658 ) ( ON ?auto_104659 ?auto_104658 ) ( ON ?auto_104660 ?auto_104659 ) ( ON ?auto_104661 ?auto_104660 ) ( ON ?auto_104662 ?auto_104661 ) ( ON ?auto_104663 ?auto_104662 ) ( ON ?auto_104664 ?auto_104663 ) ( ON ?auto_104665 ?auto_104664 ) ( ON ?auto_104666 ?auto_104665 ) ( not ( = ?auto_104658 ?auto_104659 ) ) ( not ( = ?auto_104658 ?auto_104660 ) ) ( not ( = ?auto_104658 ?auto_104661 ) ) ( not ( = ?auto_104658 ?auto_104662 ) ) ( not ( = ?auto_104658 ?auto_104663 ) ) ( not ( = ?auto_104658 ?auto_104664 ) ) ( not ( = ?auto_104658 ?auto_104665 ) ) ( not ( = ?auto_104658 ?auto_104666 ) ) ( not ( = ?auto_104658 ?auto_104667 ) ) ( not ( = ?auto_104658 ?auto_104668 ) ) ( not ( = ?auto_104659 ?auto_104660 ) ) ( not ( = ?auto_104659 ?auto_104661 ) ) ( not ( = ?auto_104659 ?auto_104662 ) ) ( not ( = ?auto_104659 ?auto_104663 ) ) ( not ( = ?auto_104659 ?auto_104664 ) ) ( not ( = ?auto_104659 ?auto_104665 ) ) ( not ( = ?auto_104659 ?auto_104666 ) ) ( not ( = ?auto_104659 ?auto_104667 ) ) ( not ( = ?auto_104659 ?auto_104668 ) ) ( not ( = ?auto_104660 ?auto_104661 ) ) ( not ( = ?auto_104660 ?auto_104662 ) ) ( not ( = ?auto_104660 ?auto_104663 ) ) ( not ( = ?auto_104660 ?auto_104664 ) ) ( not ( = ?auto_104660 ?auto_104665 ) ) ( not ( = ?auto_104660 ?auto_104666 ) ) ( not ( = ?auto_104660 ?auto_104667 ) ) ( not ( = ?auto_104660 ?auto_104668 ) ) ( not ( = ?auto_104661 ?auto_104662 ) ) ( not ( = ?auto_104661 ?auto_104663 ) ) ( not ( = ?auto_104661 ?auto_104664 ) ) ( not ( = ?auto_104661 ?auto_104665 ) ) ( not ( = ?auto_104661 ?auto_104666 ) ) ( not ( = ?auto_104661 ?auto_104667 ) ) ( not ( = ?auto_104661 ?auto_104668 ) ) ( not ( = ?auto_104662 ?auto_104663 ) ) ( not ( = ?auto_104662 ?auto_104664 ) ) ( not ( = ?auto_104662 ?auto_104665 ) ) ( not ( = ?auto_104662 ?auto_104666 ) ) ( not ( = ?auto_104662 ?auto_104667 ) ) ( not ( = ?auto_104662 ?auto_104668 ) ) ( not ( = ?auto_104663 ?auto_104664 ) ) ( not ( = ?auto_104663 ?auto_104665 ) ) ( not ( = ?auto_104663 ?auto_104666 ) ) ( not ( = ?auto_104663 ?auto_104667 ) ) ( not ( = ?auto_104663 ?auto_104668 ) ) ( not ( = ?auto_104664 ?auto_104665 ) ) ( not ( = ?auto_104664 ?auto_104666 ) ) ( not ( = ?auto_104664 ?auto_104667 ) ) ( not ( = ?auto_104664 ?auto_104668 ) ) ( not ( = ?auto_104665 ?auto_104666 ) ) ( not ( = ?auto_104665 ?auto_104667 ) ) ( not ( = ?auto_104665 ?auto_104668 ) ) ( not ( = ?auto_104666 ?auto_104667 ) ) ( not ( = ?auto_104666 ?auto_104668 ) ) ( not ( = ?auto_104667 ?auto_104668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104667 ?auto_104668 )
      ( !STACK ?auto_104667 ?auto_104666 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104679 - BLOCK
      ?auto_104680 - BLOCK
      ?auto_104681 - BLOCK
      ?auto_104682 - BLOCK
      ?auto_104683 - BLOCK
      ?auto_104684 - BLOCK
      ?auto_104685 - BLOCK
      ?auto_104686 - BLOCK
      ?auto_104687 - BLOCK
      ?auto_104688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104687 ) ( ON-TABLE ?auto_104688 ) ( CLEAR ?auto_104688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104679 ) ( ON ?auto_104680 ?auto_104679 ) ( ON ?auto_104681 ?auto_104680 ) ( ON ?auto_104682 ?auto_104681 ) ( ON ?auto_104683 ?auto_104682 ) ( ON ?auto_104684 ?auto_104683 ) ( ON ?auto_104685 ?auto_104684 ) ( ON ?auto_104686 ?auto_104685 ) ( ON ?auto_104687 ?auto_104686 ) ( not ( = ?auto_104679 ?auto_104680 ) ) ( not ( = ?auto_104679 ?auto_104681 ) ) ( not ( = ?auto_104679 ?auto_104682 ) ) ( not ( = ?auto_104679 ?auto_104683 ) ) ( not ( = ?auto_104679 ?auto_104684 ) ) ( not ( = ?auto_104679 ?auto_104685 ) ) ( not ( = ?auto_104679 ?auto_104686 ) ) ( not ( = ?auto_104679 ?auto_104687 ) ) ( not ( = ?auto_104679 ?auto_104688 ) ) ( not ( = ?auto_104680 ?auto_104681 ) ) ( not ( = ?auto_104680 ?auto_104682 ) ) ( not ( = ?auto_104680 ?auto_104683 ) ) ( not ( = ?auto_104680 ?auto_104684 ) ) ( not ( = ?auto_104680 ?auto_104685 ) ) ( not ( = ?auto_104680 ?auto_104686 ) ) ( not ( = ?auto_104680 ?auto_104687 ) ) ( not ( = ?auto_104680 ?auto_104688 ) ) ( not ( = ?auto_104681 ?auto_104682 ) ) ( not ( = ?auto_104681 ?auto_104683 ) ) ( not ( = ?auto_104681 ?auto_104684 ) ) ( not ( = ?auto_104681 ?auto_104685 ) ) ( not ( = ?auto_104681 ?auto_104686 ) ) ( not ( = ?auto_104681 ?auto_104687 ) ) ( not ( = ?auto_104681 ?auto_104688 ) ) ( not ( = ?auto_104682 ?auto_104683 ) ) ( not ( = ?auto_104682 ?auto_104684 ) ) ( not ( = ?auto_104682 ?auto_104685 ) ) ( not ( = ?auto_104682 ?auto_104686 ) ) ( not ( = ?auto_104682 ?auto_104687 ) ) ( not ( = ?auto_104682 ?auto_104688 ) ) ( not ( = ?auto_104683 ?auto_104684 ) ) ( not ( = ?auto_104683 ?auto_104685 ) ) ( not ( = ?auto_104683 ?auto_104686 ) ) ( not ( = ?auto_104683 ?auto_104687 ) ) ( not ( = ?auto_104683 ?auto_104688 ) ) ( not ( = ?auto_104684 ?auto_104685 ) ) ( not ( = ?auto_104684 ?auto_104686 ) ) ( not ( = ?auto_104684 ?auto_104687 ) ) ( not ( = ?auto_104684 ?auto_104688 ) ) ( not ( = ?auto_104685 ?auto_104686 ) ) ( not ( = ?auto_104685 ?auto_104687 ) ) ( not ( = ?auto_104685 ?auto_104688 ) ) ( not ( = ?auto_104686 ?auto_104687 ) ) ( not ( = ?auto_104686 ?auto_104688 ) ) ( not ( = ?auto_104687 ?auto_104688 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_104688 )
      ( !STACK ?auto_104688 ?auto_104687 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104699 - BLOCK
      ?auto_104700 - BLOCK
      ?auto_104701 - BLOCK
      ?auto_104702 - BLOCK
      ?auto_104703 - BLOCK
      ?auto_104704 - BLOCK
      ?auto_104705 - BLOCK
      ?auto_104706 - BLOCK
      ?auto_104707 - BLOCK
      ?auto_104708 - BLOCK
    )
    :vars
    (
      ?auto_104709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104708 ?auto_104709 ) ( ON-TABLE ?auto_104699 ) ( ON ?auto_104700 ?auto_104699 ) ( ON ?auto_104701 ?auto_104700 ) ( ON ?auto_104702 ?auto_104701 ) ( ON ?auto_104703 ?auto_104702 ) ( ON ?auto_104704 ?auto_104703 ) ( ON ?auto_104705 ?auto_104704 ) ( ON ?auto_104706 ?auto_104705 ) ( not ( = ?auto_104699 ?auto_104700 ) ) ( not ( = ?auto_104699 ?auto_104701 ) ) ( not ( = ?auto_104699 ?auto_104702 ) ) ( not ( = ?auto_104699 ?auto_104703 ) ) ( not ( = ?auto_104699 ?auto_104704 ) ) ( not ( = ?auto_104699 ?auto_104705 ) ) ( not ( = ?auto_104699 ?auto_104706 ) ) ( not ( = ?auto_104699 ?auto_104707 ) ) ( not ( = ?auto_104699 ?auto_104708 ) ) ( not ( = ?auto_104699 ?auto_104709 ) ) ( not ( = ?auto_104700 ?auto_104701 ) ) ( not ( = ?auto_104700 ?auto_104702 ) ) ( not ( = ?auto_104700 ?auto_104703 ) ) ( not ( = ?auto_104700 ?auto_104704 ) ) ( not ( = ?auto_104700 ?auto_104705 ) ) ( not ( = ?auto_104700 ?auto_104706 ) ) ( not ( = ?auto_104700 ?auto_104707 ) ) ( not ( = ?auto_104700 ?auto_104708 ) ) ( not ( = ?auto_104700 ?auto_104709 ) ) ( not ( = ?auto_104701 ?auto_104702 ) ) ( not ( = ?auto_104701 ?auto_104703 ) ) ( not ( = ?auto_104701 ?auto_104704 ) ) ( not ( = ?auto_104701 ?auto_104705 ) ) ( not ( = ?auto_104701 ?auto_104706 ) ) ( not ( = ?auto_104701 ?auto_104707 ) ) ( not ( = ?auto_104701 ?auto_104708 ) ) ( not ( = ?auto_104701 ?auto_104709 ) ) ( not ( = ?auto_104702 ?auto_104703 ) ) ( not ( = ?auto_104702 ?auto_104704 ) ) ( not ( = ?auto_104702 ?auto_104705 ) ) ( not ( = ?auto_104702 ?auto_104706 ) ) ( not ( = ?auto_104702 ?auto_104707 ) ) ( not ( = ?auto_104702 ?auto_104708 ) ) ( not ( = ?auto_104702 ?auto_104709 ) ) ( not ( = ?auto_104703 ?auto_104704 ) ) ( not ( = ?auto_104703 ?auto_104705 ) ) ( not ( = ?auto_104703 ?auto_104706 ) ) ( not ( = ?auto_104703 ?auto_104707 ) ) ( not ( = ?auto_104703 ?auto_104708 ) ) ( not ( = ?auto_104703 ?auto_104709 ) ) ( not ( = ?auto_104704 ?auto_104705 ) ) ( not ( = ?auto_104704 ?auto_104706 ) ) ( not ( = ?auto_104704 ?auto_104707 ) ) ( not ( = ?auto_104704 ?auto_104708 ) ) ( not ( = ?auto_104704 ?auto_104709 ) ) ( not ( = ?auto_104705 ?auto_104706 ) ) ( not ( = ?auto_104705 ?auto_104707 ) ) ( not ( = ?auto_104705 ?auto_104708 ) ) ( not ( = ?auto_104705 ?auto_104709 ) ) ( not ( = ?auto_104706 ?auto_104707 ) ) ( not ( = ?auto_104706 ?auto_104708 ) ) ( not ( = ?auto_104706 ?auto_104709 ) ) ( not ( = ?auto_104707 ?auto_104708 ) ) ( not ( = ?auto_104707 ?auto_104709 ) ) ( not ( = ?auto_104708 ?auto_104709 ) ) ( CLEAR ?auto_104706 ) ( ON ?auto_104707 ?auto_104708 ) ( CLEAR ?auto_104707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_104699 ?auto_104700 ?auto_104701 ?auto_104702 ?auto_104703 ?auto_104704 ?auto_104705 ?auto_104706 ?auto_104707 )
      ( MAKE-10PILE ?auto_104699 ?auto_104700 ?auto_104701 ?auto_104702 ?auto_104703 ?auto_104704 ?auto_104705 ?auto_104706 ?auto_104707 ?auto_104708 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104720 - BLOCK
      ?auto_104721 - BLOCK
      ?auto_104722 - BLOCK
      ?auto_104723 - BLOCK
      ?auto_104724 - BLOCK
      ?auto_104725 - BLOCK
      ?auto_104726 - BLOCK
      ?auto_104727 - BLOCK
      ?auto_104728 - BLOCK
      ?auto_104729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104729 ) ( ON-TABLE ?auto_104720 ) ( ON ?auto_104721 ?auto_104720 ) ( ON ?auto_104722 ?auto_104721 ) ( ON ?auto_104723 ?auto_104722 ) ( ON ?auto_104724 ?auto_104723 ) ( ON ?auto_104725 ?auto_104724 ) ( ON ?auto_104726 ?auto_104725 ) ( ON ?auto_104727 ?auto_104726 ) ( not ( = ?auto_104720 ?auto_104721 ) ) ( not ( = ?auto_104720 ?auto_104722 ) ) ( not ( = ?auto_104720 ?auto_104723 ) ) ( not ( = ?auto_104720 ?auto_104724 ) ) ( not ( = ?auto_104720 ?auto_104725 ) ) ( not ( = ?auto_104720 ?auto_104726 ) ) ( not ( = ?auto_104720 ?auto_104727 ) ) ( not ( = ?auto_104720 ?auto_104728 ) ) ( not ( = ?auto_104720 ?auto_104729 ) ) ( not ( = ?auto_104721 ?auto_104722 ) ) ( not ( = ?auto_104721 ?auto_104723 ) ) ( not ( = ?auto_104721 ?auto_104724 ) ) ( not ( = ?auto_104721 ?auto_104725 ) ) ( not ( = ?auto_104721 ?auto_104726 ) ) ( not ( = ?auto_104721 ?auto_104727 ) ) ( not ( = ?auto_104721 ?auto_104728 ) ) ( not ( = ?auto_104721 ?auto_104729 ) ) ( not ( = ?auto_104722 ?auto_104723 ) ) ( not ( = ?auto_104722 ?auto_104724 ) ) ( not ( = ?auto_104722 ?auto_104725 ) ) ( not ( = ?auto_104722 ?auto_104726 ) ) ( not ( = ?auto_104722 ?auto_104727 ) ) ( not ( = ?auto_104722 ?auto_104728 ) ) ( not ( = ?auto_104722 ?auto_104729 ) ) ( not ( = ?auto_104723 ?auto_104724 ) ) ( not ( = ?auto_104723 ?auto_104725 ) ) ( not ( = ?auto_104723 ?auto_104726 ) ) ( not ( = ?auto_104723 ?auto_104727 ) ) ( not ( = ?auto_104723 ?auto_104728 ) ) ( not ( = ?auto_104723 ?auto_104729 ) ) ( not ( = ?auto_104724 ?auto_104725 ) ) ( not ( = ?auto_104724 ?auto_104726 ) ) ( not ( = ?auto_104724 ?auto_104727 ) ) ( not ( = ?auto_104724 ?auto_104728 ) ) ( not ( = ?auto_104724 ?auto_104729 ) ) ( not ( = ?auto_104725 ?auto_104726 ) ) ( not ( = ?auto_104725 ?auto_104727 ) ) ( not ( = ?auto_104725 ?auto_104728 ) ) ( not ( = ?auto_104725 ?auto_104729 ) ) ( not ( = ?auto_104726 ?auto_104727 ) ) ( not ( = ?auto_104726 ?auto_104728 ) ) ( not ( = ?auto_104726 ?auto_104729 ) ) ( not ( = ?auto_104727 ?auto_104728 ) ) ( not ( = ?auto_104727 ?auto_104729 ) ) ( not ( = ?auto_104728 ?auto_104729 ) ) ( CLEAR ?auto_104727 ) ( ON ?auto_104728 ?auto_104729 ) ( CLEAR ?auto_104728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_104720 ?auto_104721 ?auto_104722 ?auto_104723 ?auto_104724 ?auto_104725 ?auto_104726 ?auto_104727 ?auto_104728 )
      ( MAKE-10PILE ?auto_104720 ?auto_104721 ?auto_104722 ?auto_104723 ?auto_104724 ?auto_104725 ?auto_104726 ?auto_104727 ?auto_104728 ?auto_104729 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104740 - BLOCK
      ?auto_104741 - BLOCK
      ?auto_104742 - BLOCK
      ?auto_104743 - BLOCK
      ?auto_104744 - BLOCK
      ?auto_104745 - BLOCK
      ?auto_104746 - BLOCK
      ?auto_104747 - BLOCK
      ?auto_104748 - BLOCK
      ?auto_104749 - BLOCK
    )
    :vars
    (
      ?auto_104750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104749 ?auto_104750 ) ( ON-TABLE ?auto_104740 ) ( ON ?auto_104741 ?auto_104740 ) ( ON ?auto_104742 ?auto_104741 ) ( ON ?auto_104743 ?auto_104742 ) ( ON ?auto_104744 ?auto_104743 ) ( ON ?auto_104745 ?auto_104744 ) ( ON ?auto_104746 ?auto_104745 ) ( not ( = ?auto_104740 ?auto_104741 ) ) ( not ( = ?auto_104740 ?auto_104742 ) ) ( not ( = ?auto_104740 ?auto_104743 ) ) ( not ( = ?auto_104740 ?auto_104744 ) ) ( not ( = ?auto_104740 ?auto_104745 ) ) ( not ( = ?auto_104740 ?auto_104746 ) ) ( not ( = ?auto_104740 ?auto_104747 ) ) ( not ( = ?auto_104740 ?auto_104748 ) ) ( not ( = ?auto_104740 ?auto_104749 ) ) ( not ( = ?auto_104740 ?auto_104750 ) ) ( not ( = ?auto_104741 ?auto_104742 ) ) ( not ( = ?auto_104741 ?auto_104743 ) ) ( not ( = ?auto_104741 ?auto_104744 ) ) ( not ( = ?auto_104741 ?auto_104745 ) ) ( not ( = ?auto_104741 ?auto_104746 ) ) ( not ( = ?auto_104741 ?auto_104747 ) ) ( not ( = ?auto_104741 ?auto_104748 ) ) ( not ( = ?auto_104741 ?auto_104749 ) ) ( not ( = ?auto_104741 ?auto_104750 ) ) ( not ( = ?auto_104742 ?auto_104743 ) ) ( not ( = ?auto_104742 ?auto_104744 ) ) ( not ( = ?auto_104742 ?auto_104745 ) ) ( not ( = ?auto_104742 ?auto_104746 ) ) ( not ( = ?auto_104742 ?auto_104747 ) ) ( not ( = ?auto_104742 ?auto_104748 ) ) ( not ( = ?auto_104742 ?auto_104749 ) ) ( not ( = ?auto_104742 ?auto_104750 ) ) ( not ( = ?auto_104743 ?auto_104744 ) ) ( not ( = ?auto_104743 ?auto_104745 ) ) ( not ( = ?auto_104743 ?auto_104746 ) ) ( not ( = ?auto_104743 ?auto_104747 ) ) ( not ( = ?auto_104743 ?auto_104748 ) ) ( not ( = ?auto_104743 ?auto_104749 ) ) ( not ( = ?auto_104743 ?auto_104750 ) ) ( not ( = ?auto_104744 ?auto_104745 ) ) ( not ( = ?auto_104744 ?auto_104746 ) ) ( not ( = ?auto_104744 ?auto_104747 ) ) ( not ( = ?auto_104744 ?auto_104748 ) ) ( not ( = ?auto_104744 ?auto_104749 ) ) ( not ( = ?auto_104744 ?auto_104750 ) ) ( not ( = ?auto_104745 ?auto_104746 ) ) ( not ( = ?auto_104745 ?auto_104747 ) ) ( not ( = ?auto_104745 ?auto_104748 ) ) ( not ( = ?auto_104745 ?auto_104749 ) ) ( not ( = ?auto_104745 ?auto_104750 ) ) ( not ( = ?auto_104746 ?auto_104747 ) ) ( not ( = ?auto_104746 ?auto_104748 ) ) ( not ( = ?auto_104746 ?auto_104749 ) ) ( not ( = ?auto_104746 ?auto_104750 ) ) ( not ( = ?auto_104747 ?auto_104748 ) ) ( not ( = ?auto_104747 ?auto_104749 ) ) ( not ( = ?auto_104747 ?auto_104750 ) ) ( not ( = ?auto_104748 ?auto_104749 ) ) ( not ( = ?auto_104748 ?auto_104750 ) ) ( not ( = ?auto_104749 ?auto_104750 ) ) ( ON ?auto_104748 ?auto_104749 ) ( CLEAR ?auto_104746 ) ( ON ?auto_104747 ?auto_104748 ) ( CLEAR ?auto_104747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_104740 ?auto_104741 ?auto_104742 ?auto_104743 ?auto_104744 ?auto_104745 ?auto_104746 ?auto_104747 )
      ( MAKE-10PILE ?auto_104740 ?auto_104741 ?auto_104742 ?auto_104743 ?auto_104744 ?auto_104745 ?auto_104746 ?auto_104747 ?auto_104748 ?auto_104749 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104761 - BLOCK
      ?auto_104762 - BLOCK
      ?auto_104763 - BLOCK
      ?auto_104764 - BLOCK
      ?auto_104765 - BLOCK
      ?auto_104766 - BLOCK
      ?auto_104767 - BLOCK
      ?auto_104768 - BLOCK
      ?auto_104769 - BLOCK
      ?auto_104770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104770 ) ( ON-TABLE ?auto_104761 ) ( ON ?auto_104762 ?auto_104761 ) ( ON ?auto_104763 ?auto_104762 ) ( ON ?auto_104764 ?auto_104763 ) ( ON ?auto_104765 ?auto_104764 ) ( ON ?auto_104766 ?auto_104765 ) ( ON ?auto_104767 ?auto_104766 ) ( not ( = ?auto_104761 ?auto_104762 ) ) ( not ( = ?auto_104761 ?auto_104763 ) ) ( not ( = ?auto_104761 ?auto_104764 ) ) ( not ( = ?auto_104761 ?auto_104765 ) ) ( not ( = ?auto_104761 ?auto_104766 ) ) ( not ( = ?auto_104761 ?auto_104767 ) ) ( not ( = ?auto_104761 ?auto_104768 ) ) ( not ( = ?auto_104761 ?auto_104769 ) ) ( not ( = ?auto_104761 ?auto_104770 ) ) ( not ( = ?auto_104762 ?auto_104763 ) ) ( not ( = ?auto_104762 ?auto_104764 ) ) ( not ( = ?auto_104762 ?auto_104765 ) ) ( not ( = ?auto_104762 ?auto_104766 ) ) ( not ( = ?auto_104762 ?auto_104767 ) ) ( not ( = ?auto_104762 ?auto_104768 ) ) ( not ( = ?auto_104762 ?auto_104769 ) ) ( not ( = ?auto_104762 ?auto_104770 ) ) ( not ( = ?auto_104763 ?auto_104764 ) ) ( not ( = ?auto_104763 ?auto_104765 ) ) ( not ( = ?auto_104763 ?auto_104766 ) ) ( not ( = ?auto_104763 ?auto_104767 ) ) ( not ( = ?auto_104763 ?auto_104768 ) ) ( not ( = ?auto_104763 ?auto_104769 ) ) ( not ( = ?auto_104763 ?auto_104770 ) ) ( not ( = ?auto_104764 ?auto_104765 ) ) ( not ( = ?auto_104764 ?auto_104766 ) ) ( not ( = ?auto_104764 ?auto_104767 ) ) ( not ( = ?auto_104764 ?auto_104768 ) ) ( not ( = ?auto_104764 ?auto_104769 ) ) ( not ( = ?auto_104764 ?auto_104770 ) ) ( not ( = ?auto_104765 ?auto_104766 ) ) ( not ( = ?auto_104765 ?auto_104767 ) ) ( not ( = ?auto_104765 ?auto_104768 ) ) ( not ( = ?auto_104765 ?auto_104769 ) ) ( not ( = ?auto_104765 ?auto_104770 ) ) ( not ( = ?auto_104766 ?auto_104767 ) ) ( not ( = ?auto_104766 ?auto_104768 ) ) ( not ( = ?auto_104766 ?auto_104769 ) ) ( not ( = ?auto_104766 ?auto_104770 ) ) ( not ( = ?auto_104767 ?auto_104768 ) ) ( not ( = ?auto_104767 ?auto_104769 ) ) ( not ( = ?auto_104767 ?auto_104770 ) ) ( not ( = ?auto_104768 ?auto_104769 ) ) ( not ( = ?auto_104768 ?auto_104770 ) ) ( not ( = ?auto_104769 ?auto_104770 ) ) ( ON ?auto_104769 ?auto_104770 ) ( CLEAR ?auto_104767 ) ( ON ?auto_104768 ?auto_104769 ) ( CLEAR ?auto_104768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_104761 ?auto_104762 ?auto_104763 ?auto_104764 ?auto_104765 ?auto_104766 ?auto_104767 ?auto_104768 )
      ( MAKE-10PILE ?auto_104761 ?auto_104762 ?auto_104763 ?auto_104764 ?auto_104765 ?auto_104766 ?auto_104767 ?auto_104768 ?auto_104769 ?auto_104770 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104781 - BLOCK
      ?auto_104782 - BLOCK
      ?auto_104783 - BLOCK
      ?auto_104784 - BLOCK
      ?auto_104785 - BLOCK
      ?auto_104786 - BLOCK
      ?auto_104787 - BLOCK
      ?auto_104788 - BLOCK
      ?auto_104789 - BLOCK
      ?auto_104790 - BLOCK
    )
    :vars
    (
      ?auto_104791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104790 ?auto_104791 ) ( ON-TABLE ?auto_104781 ) ( ON ?auto_104782 ?auto_104781 ) ( ON ?auto_104783 ?auto_104782 ) ( ON ?auto_104784 ?auto_104783 ) ( ON ?auto_104785 ?auto_104784 ) ( ON ?auto_104786 ?auto_104785 ) ( not ( = ?auto_104781 ?auto_104782 ) ) ( not ( = ?auto_104781 ?auto_104783 ) ) ( not ( = ?auto_104781 ?auto_104784 ) ) ( not ( = ?auto_104781 ?auto_104785 ) ) ( not ( = ?auto_104781 ?auto_104786 ) ) ( not ( = ?auto_104781 ?auto_104787 ) ) ( not ( = ?auto_104781 ?auto_104788 ) ) ( not ( = ?auto_104781 ?auto_104789 ) ) ( not ( = ?auto_104781 ?auto_104790 ) ) ( not ( = ?auto_104781 ?auto_104791 ) ) ( not ( = ?auto_104782 ?auto_104783 ) ) ( not ( = ?auto_104782 ?auto_104784 ) ) ( not ( = ?auto_104782 ?auto_104785 ) ) ( not ( = ?auto_104782 ?auto_104786 ) ) ( not ( = ?auto_104782 ?auto_104787 ) ) ( not ( = ?auto_104782 ?auto_104788 ) ) ( not ( = ?auto_104782 ?auto_104789 ) ) ( not ( = ?auto_104782 ?auto_104790 ) ) ( not ( = ?auto_104782 ?auto_104791 ) ) ( not ( = ?auto_104783 ?auto_104784 ) ) ( not ( = ?auto_104783 ?auto_104785 ) ) ( not ( = ?auto_104783 ?auto_104786 ) ) ( not ( = ?auto_104783 ?auto_104787 ) ) ( not ( = ?auto_104783 ?auto_104788 ) ) ( not ( = ?auto_104783 ?auto_104789 ) ) ( not ( = ?auto_104783 ?auto_104790 ) ) ( not ( = ?auto_104783 ?auto_104791 ) ) ( not ( = ?auto_104784 ?auto_104785 ) ) ( not ( = ?auto_104784 ?auto_104786 ) ) ( not ( = ?auto_104784 ?auto_104787 ) ) ( not ( = ?auto_104784 ?auto_104788 ) ) ( not ( = ?auto_104784 ?auto_104789 ) ) ( not ( = ?auto_104784 ?auto_104790 ) ) ( not ( = ?auto_104784 ?auto_104791 ) ) ( not ( = ?auto_104785 ?auto_104786 ) ) ( not ( = ?auto_104785 ?auto_104787 ) ) ( not ( = ?auto_104785 ?auto_104788 ) ) ( not ( = ?auto_104785 ?auto_104789 ) ) ( not ( = ?auto_104785 ?auto_104790 ) ) ( not ( = ?auto_104785 ?auto_104791 ) ) ( not ( = ?auto_104786 ?auto_104787 ) ) ( not ( = ?auto_104786 ?auto_104788 ) ) ( not ( = ?auto_104786 ?auto_104789 ) ) ( not ( = ?auto_104786 ?auto_104790 ) ) ( not ( = ?auto_104786 ?auto_104791 ) ) ( not ( = ?auto_104787 ?auto_104788 ) ) ( not ( = ?auto_104787 ?auto_104789 ) ) ( not ( = ?auto_104787 ?auto_104790 ) ) ( not ( = ?auto_104787 ?auto_104791 ) ) ( not ( = ?auto_104788 ?auto_104789 ) ) ( not ( = ?auto_104788 ?auto_104790 ) ) ( not ( = ?auto_104788 ?auto_104791 ) ) ( not ( = ?auto_104789 ?auto_104790 ) ) ( not ( = ?auto_104789 ?auto_104791 ) ) ( not ( = ?auto_104790 ?auto_104791 ) ) ( ON ?auto_104789 ?auto_104790 ) ( ON ?auto_104788 ?auto_104789 ) ( CLEAR ?auto_104786 ) ( ON ?auto_104787 ?auto_104788 ) ( CLEAR ?auto_104787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104781 ?auto_104782 ?auto_104783 ?auto_104784 ?auto_104785 ?auto_104786 ?auto_104787 )
      ( MAKE-10PILE ?auto_104781 ?auto_104782 ?auto_104783 ?auto_104784 ?auto_104785 ?auto_104786 ?auto_104787 ?auto_104788 ?auto_104789 ?auto_104790 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104802 - BLOCK
      ?auto_104803 - BLOCK
      ?auto_104804 - BLOCK
      ?auto_104805 - BLOCK
      ?auto_104806 - BLOCK
      ?auto_104807 - BLOCK
      ?auto_104808 - BLOCK
      ?auto_104809 - BLOCK
      ?auto_104810 - BLOCK
      ?auto_104811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104811 ) ( ON-TABLE ?auto_104802 ) ( ON ?auto_104803 ?auto_104802 ) ( ON ?auto_104804 ?auto_104803 ) ( ON ?auto_104805 ?auto_104804 ) ( ON ?auto_104806 ?auto_104805 ) ( ON ?auto_104807 ?auto_104806 ) ( not ( = ?auto_104802 ?auto_104803 ) ) ( not ( = ?auto_104802 ?auto_104804 ) ) ( not ( = ?auto_104802 ?auto_104805 ) ) ( not ( = ?auto_104802 ?auto_104806 ) ) ( not ( = ?auto_104802 ?auto_104807 ) ) ( not ( = ?auto_104802 ?auto_104808 ) ) ( not ( = ?auto_104802 ?auto_104809 ) ) ( not ( = ?auto_104802 ?auto_104810 ) ) ( not ( = ?auto_104802 ?auto_104811 ) ) ( not ( = ?auto_104803 ?auto_104804 ) ) ( not ( = ?auto_104803 ?auto_104805 ) ) ( not ( = ?auto_104803 ?auto_104806 ) ) ( not ( = ?auto_104803 ?auto_104807 ) ) ( not ( = ?auto_104803 ?auto_104808 ) ) ( not ( = ?auto_104803 ?auto_104809 ) ) ( not ( = ?auto_104803 ?auto_104810 ) ) ( not ( = ?auto_104803 ?auto_104811 ) ) ( not ( = ?auto_104804 ?auto_104805 ) ) ( not ( = ?auto_104804 ?auto_104806 ) ) ( not ( = ?auto_104804 ?auto_104807 ) ) ( not ( = ?auto_104804 ?auto_104808 ) ) ( not ( = ?auto_104804 ?auto_104809 ) ) ( not ( = ?auto_104804 ?auto_104810 ) ) ( not ( = ?auto_104804 ?auto_104811 ) ) ( not ( = ?auto_104805 ?auto_104806 ) ) ( not ( = ?auto_104805 ?auto_104807 ) ) ( not ( = ?auto_104805 ?auto_104808 ) ) ( not ( = ?auto_104805 ?auto_104809 ) ) ( not ( = ?auto_104805 ?auto_104810 ) ) ( not ( = ?auto_104805 ?auto_104811 ) ) ( not ( = ?auto_104806 ?auto_104807 ) ) ( not ( = ?auto_104806 ?auto_104808 ) ) ( not ( = ?auto_104806 ?auto_104809 ) ) ( not ( = ?auto_104806 ?auto_104810 ) ) ( not ( = ?auto_104806 ?auto_104811 ) ) ( not ( = ?auto_104807 ?auto_104808 ) ) ( not ( = ?auto_104807 ?auto_104809 ) ) ( not ( = ?auto_104807 ?auto_104810 ) ) ( not ( = ?auto_104807 ?auto_104811 ) ) ( not ( = ?auto_104808 ?auto_104809 ) ) ( not ( = ?auto_104808 ?auto_104810 ) ) ( not ( = ?auto_104808 ?auto_104811 ) ) ( not ( = ?auto_104809 ?auto_104810 ) ) ( not ( = ?auto_104809 ?auto_104811 ) ) ( not ( = ?auto_104810 ?auto_104811 ) ) ( ON ?auto_104810 ?auto_104811 ) ( ON ?auto_104809 ?auto_104810 ) ( CLEAR ?auto_104807 ) ( ON ?auto_104808 ?auto_104809 ) ( CLEAR ?auto_104808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104802 ?auto_104803 ?auto_104804 ?auto_104805 ?auto_104806 ?auto_104807 ?auto_104808 )
      ( MAKE-10PILE ?auto_104802 ?auto_104803 ?auto_104804 ?auto_104805 ?auto_104806 ?auto_104807 ?auto_104808 ?auto_104809 ?auto_104810 ?auto_104811 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104822 - BLOCK
      ?auto_104823 - BLOCK
      ?auto_104824 - BLOCK
      ?auto_104825 - BLOCK
      ?auto_104826 - BLOCK
      ?auto_104827 - BLOCK
      ?auto_104828 - BLOCK
      ?auto_104829 - BLOCK
      ?auto_104830 - BLOCK
      ?auto_104831 - BLOCK
    )
    :vars
    (
      ?auto_104832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104831 ?auto_104832 ) ( ON-TABLE ?auto_104822 ) ( ON ?auto_104823 ?auto_104822 ) ( ON ?auto_104824 ?auto_104823 ) ( ON ?auto_104825 ?auto_104824 ) ( ON ?auto_104826 ?auto_104825 ) ( not ( = ?auto_104822 ?auto_104823 ) ) ( not ( = ?auto_104822 ?auto_104824 ) ) ( not ( = ?auto_104822 ?auto_104825 ) ) ( not ( = ?auto_104822 ?auto_104826 ) ) ( not ( = ?auto_104822 ?auto_104827 ) ) ( not ( = ?auto_104822 ?auto_104828 ) ) ( not ( = ?auto_104822 ?auto_104829 ) ) ( not ( = ?auto_104822 ?auto_104830 ) ) ( not ( = ?auto_104822 ?auto_104831 ) ) ( not ( = ?auto_104822 ?auto_104832 ) ) ( not ( = ?auto_104823 ?auto_104824 ) ) ( not ( = ?auto_104823 ?auto_104825 ) ) ( not ( = ?auto_104823 ?auto_104826 ) ) ( not ( = ?auto_104823 ?auto_104827 ) ) ( not ( = ?auto_104823 ?auto_104828 ) ) ( not ( = ?auto_104823 ?auto_104829 ) ) ( not ( = ?auto_104823 ?auto_104830 ) ) ( not ( = ?auto_104823 ?auto_104831 ) ) ( not ( = ?auto_104823 ?auto_104832 ) ) ( not ( = ?auto_104824 ?auto_104825 ) ) ( not ( = ?auto_104824 ?auto_104826 ) ) ( not ( = ?auto_104824 ?auto_104827 ) ) ( not ( = ?auto_104824 ?auto_104828 ) ) ( not ( = ?auto_104824 ?auto_104829 ) ) ( not ( = ?auto_104824 ?auto_104830 ) ) ( not ( = ?auto_104824 ?auto_104831 ) ) ( not ( = ?auto_104824 ?auto_104832 ) ) ( not ( = ?auto_104825 ?auto_104826 ) ) ( not ( = ?auto_104825 ?auto_104827 ) ) ( not ( = ?auto_104825 ?auto_104828 ) ) ( not ( = ?auto_104825 ?auto_104829 ) ) ( not ( = ?auto_104825 ?auto_104830 ) ) ( not ( = ?auto_104825 ?auto_104831 ) ) ( not ( = ?auto_104825 ?auto_104832 ) ) ( not ( = ?auto_104826 ?auto_104827 ) ) ( not ( = ?auto_104826 ?auto_104828 ) ) ( not ( = ?auto_104826 ?auto_104829 ) ) ( not ( = ?auto_104826 ?auto_104830 ) ) ( not ( = ?auto_104826 ?auto_104831 ) ) ( not ( = ?auto_104826 ?auto_104832 ) ) ( not ( = ?auto_104827 ?auto_104828 ) ) ( not ( = ?auto_104827 ?auto_104829 ) ) ( not ( = ?auto_104827 ?auto_104830 ) ) ( not ( = ?auto_104827 ?auto_104831 ) ) ( not ( = ?auto_104827 ?auto_104832 ) ) ( not ( = ?auto_104828 ?auto_104829 ) ) ( not ( = ?auto_104828 ?auto_104830 ) ) ( not ( = ?auto_104828 ?auto_104831 ) ) ( not ( = ?auto_104828 ?auto_104832 ) ) ( not ( = ?auto_104829 ?auto_104830 ) ) ( not ( = ?auto_104829 ?auto_104831 ) ) ( not ( = ?auto_104829 ?auto_104832 ) ) ( not ( = ?auto_104830 ?auto_104831 ) ) ( not ( = ?auto_104830 ?auto_104832 ) ) ( not ( = ?auto_104831 ?auto_104832 ) ) ( ON ?auto_104830 ?auto_104831 ) ( ON ?auto_104829 ?auto_104830 ) ( ON ?auto_104828 ?auto_104829 ) ( CLEAR ?auto_104826 ) ( ON ?auto_104827 ?auto_104828 ) ( CLEAR ?auto_104827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104822 ?auto_104823 ?auto_104824 ?auto_104825 ?auto_104826 ?auto_104827 )
      ( MAKE-10PILE ?auto_104822 ?auto_104823 ?auto_104824 ?auto_104825 ?auto_104826 ?auto_104827 ?auto_104828 ?auto_104829 ?auto_104830 ?auto_104831 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104843 - BLOCK
      ?auto_104844 - BLOCK
      ?auto_104845 - BLOCK
      ?auto_104846 - BLOCK
      ?auto_104847 - BLOCK
      ?auto_104848 - BLOCK
      ?auto_104849 - BLOCK
      ?auto_104850 - BLOCK
      ?auto_104851 - BLOCK
      ?auto_104852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104852 ) ( ON-TABLE ?auto_104843 ) ( ON ?auto_104844 ?auto_104843 ) ( ON ?auto_104845 ?auto_104844 ) ( ON ?auto_104846 ?auto_104845 ) ( ON ?auto_104847 ?auto_104846 ) ( not ( = ?auto_104843 ?auto_104844 ) ) ( not ( = ?auto_104843 ?auto_104845 ) ) ( not ( = ?auto_104843 ?auto_104846 ) ) ( not ( = ?auto_104843 ?auto_104847 ) ) ( not ( = ?auto_104843 ?auto_104848 ) ) ( not ( = ?auto_104843 ?auto_104849 ) ) ( not ( = ?auto_104843 ?auto_104850 ) ) ( not ( = ?auto_104843 ?auto_104851 ) ) ( not ( = ?auto_104843 ?auto_104852 ) ) ( not ( = ?auto_104844 ?auto_104845 ) ) ( not ( = ?auto_104844 ?auto_104846 ) ) ( not ( = ?auto_104844 ?auto_104847 ) ) ( not ( = ?auto_104844 ?auto_104848 ) ) ( not ( = ?auto_104844 ?auto_104849 ) ) ( not ( = ?auto_104844 ?auto_104850 ) ) ( not ( = ?auto_104844 ?auto_104851 ) ) ( not ( = ?auto_104844 ?auto_104852 ) ) ( not ( = ?auto_104845 ?auto_104846 ) ) ( not ( = ?auto_104845 ?auto_104847 ) ) ( not ( = ?auto_104845 ?auto_104848 ) ) ( not ( = ?auto_104845 ?auto_104849 ) ) ( not ( = ?auto_104845 ?auto_104850 ) ) ( not ( = ?auto_104845 ?auto_104851 ) ) ( not ( = ?auto_104845 ?auto_104852 ) ) ( not ( = ?auto_104846 ?auto_104847 ) ) ( not ( = ?auto_104846 ?auto_104848 ) ) ( not ( = ?auto_104846 ?auto_104849 ) ) ( not ( = ?auto_104846 ?auto_104850 ) ) ( not ( = ?auto_104846 ?auto_104851 ) ) ( not ( = ?auto_104846 ?auto_104852 ) ) ( not ( = ?auto_104847 ?auto_104848 ) ) ( not ( = ?auto_104847 ?auto_104849 ) ) ( not ( = ?auto_104847 ?auto_104850 ) ) ( not ( = ?auto_104847 ?auto_104851 ) ) ( not ( = ?auto_104847 ?auto_104852 ) ) ( not ( = ?auto_104848 ?auto_104849 ) ) ( not ( = ?auto_104848 ?auto_104850 ) ) ( not ( = ?auto_104848 ?auto_104851 ) ) ( not ( = ?auto_104848 ?auto_104852 ) ) ( not ( = ?auto_104849 ?auto_104850 ) ) ( not ( = ?auto_104849 ?auto_104851 ) ) ( not ( = ?auto_104849 ?auto_104852 ) ) ( not ( = ?auto_104850 ?auto_104851 ) ) ( not ( = ?auto_104850 ?auto_104852 ) ) ( not ( = ?auto_104851 ?auto_104852 ) ) ( ON ?auto_104851 ?auto_104852 ) ( ON ?auto_104850 ?auto_104851 ) ( ON ?auto_104849 ?auto_104850 ) ( CLEAR ?auto_104847 ) ( ON ?auto_104848 ?auto_104849 ) ( CLEAR ?auto_104848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104843 ?auto_104844 ?auto_104845 ?auto_104846 ?auto_104847 ?auto_104848 )
      ( MAKE-10PILE ?auto_104843 ?auto_104844 ?auto_104845 ?auto_104846 ?auto_104847 ?auto_104848 ?auto_104849 ?auto_104850 ?auto_104851 ?auto_104852 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104863 - BLOCK
      ?auto_104864 - BLOCK
      ?auto_104865 - BLOCK
      ?auto_104866 - BLOCK
      ?auto_104867 - BLOCK
      ?auto_104868 - BLOCK
      ?auto_104869 - BLOCK
      ?auto_104870 - BLOCK
      ?auto_104871 - BLOCK
      ?auto_104872 - BLOCK
    )
    :vars
    (
      ?auto_104873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104872 ?auto_104873 ) ( ON-TABLE ?auto_104863 ) ( ON ?auto_104864 ?auto_104863 ) ( ON ?auto_104865 ?auto_104864 ) ( ON ?auto_104866 ?auto_104865 ) ( not ( = ?auto_104863 ?auto_104864 ) ) ( not ( = ?auto_104863 ?auto_104865 ) ) ( not ( = ?auto_104863 ?auto_104866 ) ) ( not ( = ?auto_104863 ?auto_104867 ) ) ( not ( = ?auto_104863 ?auto_104868 ) ) ( not ( = ?auto_104863 ?auto_104869 ) ) ( not ( = ?auto_104863 ?auto_104870 ) ) ( not ( = ?auto_104863 ?auto_104871 ) ) ( not ( = ?auto_104863 ?auto_104872 ) ) ( not ( = ?auto_104863 ?auto_104873 ) ) ( not ( = ?auto_104864 ?auto_104865 ) ) ( not ( = ?auto_104864 ?auto_104866 ) ) ( not ( = ?auto_104864 ?auto_104867 ) ) ( not ( = ?auto_104864 ?auto_104868 ) ) ( not ( = ?auto_104864 ?auto_104869 ) ) ( not ( = ?auto_104864 ?auto_104870 ) ) ( not ( = ?auto_104864 ?auto_104871 ) ) ( not ( = ?auto_104864 ?auto_104872 ) ) ( not ( = ?auto_104864 ?auto_104873 ) ) ( not ( = ?auto_104865 ?auto_104866 ) ) ( not ( = ?auto_104865 ?auto_104867 ) ) ( not ( = ?auto_104865 ?auto_104868 ) ) ( not ( = ?auto_104865 ?auto_104869 ) ) ( not ( = ?auto_104865 ?auto_104870 ) ) ( not ( = ?auto_104865 ?auto_104871 ) ) ( not ( = ?auto_104865 ?auto_104872 ) ) ( not ( = ?auto_104865 ?auto_104873 ) ) ( not ( = ?auto_104866 ?auto_104867 ) ) ( not ( = ?auto_104866 ?auto_104868 ) ) ( not ( = ?auto_104866 ?auto_104869 ) ) ( not ( = ?auto_104866 ?auto_104870 ) ) ( not ( = ?auto_104866 ?auto_104871 ) ) ( not ( = ?auto_104866 ?auto_104872 ) ) ( not ( = ?auto_104866 ?auto_104873 ) ) ( not ( = ?auto_104867 ?auto_104868 ) ) ( not ( = ?auto_104867 ?auto_104869 ) ) ( not ( = ?auto_104867 ?auto_104870 ) ) ( not ( = ?auto_104867 ?auto_104871 ) ) ( not ( = ?auto_104867 ?auto_104872 ) ) ( not ( = ?auto_104867 ?auto_104873 ) ) ( not ( = ?auto_104868 ?auto_104869 ) ) ( not ( = ?auto_104868 ?auto_104870 ) ) ( not ( = ?auto_104868 ?auto_104871 ) ) ( not ( = ?auto_104868 ?auto_104872 ) ) ( not ( = ?auto_104868 ?auto_104873 ) ) ( not ( = ?auto_104869 ?auto_104870 ) ) ( not ( = ?auto_104869 ?auto_104871 ) ) ( not ( = ?auto_104869 ?auto_104872 ) ) ( not ( = ?auto_104869 ?auto_104873 ) ) ( not ( = ?auto_104870 ?auto_104871 ) ) ( not ( = ?auto_104870 ?auto_104872 ) ) ( not ( = ?auto_104870 ?auto_104873 ) ) ( not ( = ?auto_104871 ?auto_104872 ) ) ( not ( = ?auto_104871 ?auto_104873 ) ) ( not ( = ?auto_104872 ?auto_104873 ) ) ( ON ?auto_104871 ?auto_104872 ) ( ON ?auto_104870 ?auto_104871 ) ( ON ?auto_104869 ?auto_104870 ) ( ON ?auto_104868 ?auto_104869 ) ( CLEAR ?auto_104866 ) ( ON ?auto_104867 ?auto_104868 ) ( CLEAR ?auto_104867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104863 ?auto_104864 ?auto_104865 ?auto_104866 ?auto_104867 )
      ( MAKE-10PILE ?auto_104863 ?auto_104864 ?auto_104865 ?auto_104866 ?auto_104867 ?auto_104868 ?auto_104869 ?auto_104870 ?auto_104871 ?auto_104872 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104884 - BLOCK
      ?auto_104885 - BLOCK
      ?auto_104886 - BLOCK
      ?auto_104887 - BLOCK
      ?auto_104888 - BLOCK
      ?auto_104889 - BLOCK
      ?auto_104890 - BLOCK
      ?auto_104891 - BLOCK
      ?auto_104892 - BLOCK
      ?auto_104893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104893 ) ( ON-TABLE ?auto_104884 ) ( ON ?auto_104885 ?auto_104884 ) ( ON ?auto_104886 ?auto_104885 ) ( ON ?auto_104887 ?auto_104886 ) ( not ( = ?auto_104884 ?auto_104885 ) ) ( not ( = ?auto_104884 ?auto_104886 ) ) ( not ( = ?auto_104884 ?auto_104887 ) ) ( not ( = ?auto_104884 ?auto_104888 ) ) ( not ( = ?auto_104884 ?auto_104889 ) ) ( not ( = ?auto_104884 ?auto_104890 ) ) ( not ( = ?auto_104884 ?auto_104891 ) ) ( not ( = ?auto_104884 ?auto_104892 ) ) ( not ( = ?auto_104884 ?auto_104893 ) ) ( not ( = ?auto_104885 ?auto_104886 ) ) ( not ( = ?auto_104885 ?auto_104887 ) ) ( not ( = ?auto_104885 ?auto_104888 ) ) ( not ( = ?auto_104885 ?auto_104889 ) ) ( not ( = ?auto_104885 ?auto_104890 ) ) ( not ( = ?auto_104885 ?auto_104891 ) ) ( not ( = ?auto_104885 ?auto_104892 ) ) ( not ( = ?auto_104885 ?auto_104893 ) ) ( not ( = ?auto_104886 ?auto_104887 ) ) ( not ( = ?auto_104886 ?auto_104888 ) ) ( not ( = ?auto_104886 ?auto_104889 ) ) ( not ( = ?auto_104886 ?auto_104890 ) ) ( not ( = ?auto_104886 ?auto_104891 ) ) ( not ( = ?auto_104886 ?auto_104892 ) ) ( not ( = ?auto_104886 ?auto_104893 ) ) ( not ( = ?auto_104887 ?auto_104888 ) ) ( not ( = ?auto_104887 ?auto_104889 ) ) ( not ( = ?auto_104887 ?auto_104890 ) ) ( not ( = ?auto_104887 ?auto_104891 ) ) ( not ( = ?auto_104887 ?auto_104892 ) ) ( not ( = ?auto_104887 ?auto_104893 ) ) ( not ( = ?auto_104888 ?auto_104889 ) ) ( not ( = ?auto_104888 ?auto_104890 ) ) ( not ( = ?auto_104888 ?auto_104891 ) ) ( not ( = ?auto_104888 ?auto_104892 ) ) ( not ( = ?auto_104888 ?auto_104893 ) ) ( not ( = ?auto_104889 ?auto_104890 ) ) ( not ( = ?auto_104889 ?auto_104891 ) ) ( not ( = ?auto_104889 ?auto_104892 ) ) ( not ( = ?auto_104889 ?auto_104893 ) ) ( not ( = ?auto_104890 ?auto_104891 ) ) ( not ( = ?auto_104890 ?auto_104892 ) ) ( not ( = ?auto_104890 ?auto_104893 ) ) ( not ( = ?auto_104891 ?auto_104892 ) ) ( not ( = ?auto_104891 ?auto_104893 ) ) ( not ( = ?auto_104892 ?auto_104893 ) ) ( ON ?auto_104892 ?auto_104893 ) ( ON ?auto_104891 ?auto_104892 ) ( ON ?auto_104890 ?auto_104891 ) ( ON ?auto_104889 ?auto_104890 ) ( CLEAR ?auto_104887 ) ( ON ?auto_104888 ?auto_104889 ) ( CLEAR ?auto_104888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104884 ?auto_104885 ?auto_104886 ?auto_104887 ?auto_104888 )
      ( MAKE-10PILE ?auto_104884 ?auto_104885 ?auto_104886 ?auto_104887 ?auto_104888 ?auto_104889 ?auto_104890 ?auto_104891 ?auto_104892 ?auto_104893 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104904 - BLOCK
      ?auto_104905 - BLOCK
      ?auto_104906 - BLOCK
      ?auto_104907 - BLOCK
      ?auto_104908 - BLOCK
      ?auto_104909 - BLOCK
      ?auto_104910 - BLOCK
      ?auto_104911 - BLOCK
      ?auto_104912 - BLOCK
      ?auto_104913 - BLOCK
    )
    :vars
    (
      ?auto_104914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104913 ?auto_104914 ) ( ON-TABLE ?auto_104904 ) ( ON ?auto_104905 ?auto_104904 ) ( ON ?auto_104906 ?auto_104905 ) ( not ( = ?auto_104904 ?auto_104905 ) ) ( not ( = ?auto_104904 ?auto_104906 ) ) ( not ( = ?auto_104904 ?auto_104907 ) ) ( not ( = ?auto_104904 ?auto_104908 ) ) ( not ( = ?auto_104904 ?auto_104909 ) ) ( not ( = ?auto_104904 ?auto_104910 ) ) ( not ( = ?auto_104904 ?auto_104911 ) ) ( not ( = ?auto_104904 ?auto_104912 ) ) ( not ( = ?auto_104904 ?auto_104913 ) ) ( not ( = ?auto_104904 ?auto_104914 ) ) ( not ( = ?auto_104905 ?auto_104906 ) ) ( not ( = ?auto_104905 ?auto_104907 ) ) ( not ( = ?auto_104905 ?auto_104908 ) ) ( not ( = ?auto_104905 ?auto_104909 ) ) ( not ( = ?auto_104905 ?auto_104910 ) ) ( not ( = ?auto_104905 ?auto_104911 ) ) ( not ( = ?auto_104905 ?auto_104912 ) ) ( not ( = ?auto_104905 ?auto_104913 ) ) ( not ( = ?auto_104905 ?auto_104914 ) ) ( not ( = ?auto_104906 ?auto_104907 ) ) ( not ( = ?auto_104906 ?auto_104908 ) ) ( not ( = ?auto_104906 ?auto_104909 ) ) ( not ( = ?auto_104906 ?auto_104910 ) ) ( not ( = ?auto_104906 ?auto_104911 ) ) ( not ( = ?auto_104906 ?auto_104912 ) ) ( not ( = ?auto_104906 ?auto_104913 ) ) ( not ( = ?auto_104906 ?auto_104914 ) ) ( not ( = ?auto_104907 ?auto_104908 ) ) ( not ( = ?auto_104907 ?auto_104909 ) ) ( not ( = ?auto_104907 ?auto_104910 ) ) ( not ( = ?auto_104907 ?auto_104911 ) ) ( not ( = ?auto_104907 ?auto_104912 ) ) ( not ( = ?auto_104907 ?auto_104913 ) ) ( not ( = ?auto_104907 ?auto_104914 ) ) ( not ( = ?auto_104908 ?auto_104909 ) ) ( not ( = ?auto_104908 ?auto_104910 ) ) ( not ( = ?auto_104908 ?auto_104911 ) ) ( not ( = ?auto_104908 ?auto_104912 ) ) ( not ( = ?auto_104908 ?auto_104913 ) ) ( not ( = ?auto_104908 ?auto_104914 ) ) ( not ( = ?auto_104909 ?auto_104910 ) ) ( not ( = ?auto_104909 ?auto_104911 ) ) ( not ( = ?auto_104909 ?auto_104912 ) ) ( not ( = ?auto_104909 ?auto_104913 ) ) ( not ( = ?auto_104909 ?auto_104914 ) ) ( not ( = ?auto_104910 ?auto_104911 ) ) ( not ( = ?auto_104910 ?auto_104912 ) ) ( not ( = ?auto_104910 ?auto_104913 ) ) ( not ( = ?auto_104910 ?auto_104914 ) ) ( not ( = ?auto_104911 ?auto_104912 ) ) ( not ( = ?auto_104911 ?auto_104913 ) ) ( not ( = ?auto_104911 ?auto_104914 ) ) ( not ( = ?auto_104912 ?auto_104913 ) ) ( not ( = ?auto_104912 ?auto_104914 ) ) ( not ( = ?auto_104913 ?auto_104914 ) ) ( ON ?auto_104912 ?auto_104913 ) ( ON ?auto_104911 ?auto_104912 ) ( ON ?auto_104910 ?auto_104911 ) ( ON ?auto_104909 ?auto_104910 ) ( ON ?auto_104908 ?auto_104909 ) ( CLEAR ?auto_104906 ) ( ON ?auto_104907 ?auto_104908 ) ( CLEAR ?auto_104907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104904 ?auto_104905 ?auto_104906 ?auto_104907 )
      ( MAKE-10PILE ?auto_104904 ?auto_104905 ?auto_104906 ?auto_104907 ?auto_104908 ?auto_104909 ?auto_104910 ?auto_104911 ?auto_104912 ?auto_104913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104925 - BLOCK
      ?auto_104926 - BLOCK
      ?auto_104927 - BLOCK
      ?auto_104928 - BLOCK
      ?auto_104929 - BLOCK
      ?auto_104930 - BLOCK
      ?auto_104931 - BLOCK
      ?auto_104932 - BLOCK
      ?auto_104933 - BLOCK
      ?auto_104934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104934 ) ( ON-TABLE ?auto_104925 ) ( ON ?auto_104926 ?auto_104925 ) ( ON ?auto_104927 ?auto_104926 ) ( not ( = ?auto_104925 ?auto_104926 ) ) ( not ( = ?auto_104925 ?auto_104927 ) ) ( not ( = ?auto_104925 ?auto_104928 ) ) ( not ( = ?auto_104925 ?auto_104929 ) ) ( not ( = ?auto_104925 ?auto_104930 ) ) ( not ( = ?auto_104925 ?auto_104931 ) ) ( not ( = ?auto_104925 ?auto_104932 ) ) ( not ( = ?auto_104925 ?auto_104933 ) ) ( not ( = ?auto_104925 ?auto_104934 ) ) ( not ( = ?auto_104926 ?auto_104927 ) ) ( not ( = ?auto_104926 ?auto_104928 ) ) ( not ( = ?auto_104926 ?auto_104929 ) ) ( not ( = ?auto_104926 ?auto_104930 ) ) ( not ( = ?auto_104926 ?auto_104931 ) ) ( not ( = ?auto_104926 ?auto_104932 ) ) ( not ( = ?auto_104926 ?auto_104933 ) ) ( not ( = ?auto_104926 ?auto_104934 ) ) ( not ( = ?auto_104927 ?auto_104928 ) ) ( not ( = ?auto_104927 ?auto_104929 ) ) ( not ( = ?auto_104927 ?auto_104930 ) ) ( not ( = ?auto_104927 ?auto_104931 ) ) ( not ( = ?auto_104927 ?auto_104932 ) ) ( not ( = ?auto_104927 ?auto_104933 ) ) ( not ( = ?auto_104927 ?auto_104934 ) ) ( not ( = ?auto_104928 ?auto_104929 ) ) ( not ( = ?auto_104928 ?auto_104930 ) ) ( not ( = ?auto_104928 ?auto_104931 ) ) ( not ( = ?auto_104928 ?auto_104932 ) ) ( not ( = ?auto_104928 ?auto_104933 ) ) ( not ( = ?auto_104928 ?auto_104934 ) ) ( not ( = ?auto_104929 ?auto_104930 ) ) ( not ( = ?auto_104929 ?auto_104931 ) ) ( not ( = ?auto_104929 ?auto_104932 ) ) ( not ( = ?auto_104929 ?auto_104933 ) ) ( not ( = ?auto_104929 ?auto_104934 ) ) ( not ( = ?auto_104930 ?auto_104931 ) ) ( not ( = ?auto_104930 ?auto_104932 ) ) ( not ( = ?auto_104930 ?auto_104933 ) ) ( not ( = ?auto_104930 ?auto_104934 ) ) ( not ( = ?auto_104931 ?auto_104932 ) ) ( not ( = ?auto_104931 ?auto_104933 ) ) ( not ( = ?auto_104931 ?auto_104934 ) ) ( not ( = ?auto_104932 ?auto_104933 ) ) ( not ( = ?auto_104932 ?auto_104934 ) ) ( not ( = ?auto_104933 ?auto_104934 ) ) ( ON ?auto_104933 ?auto_104934 ) ( ON ?auto_104932 ?auto_104933 ) ( ON ?auto_104931 ?auto_104932 ) ( ON ?auto_104930 ?auto_104931 ) ( ON ?auto_104929 ?auto_104930 ) ( CLEAR ?auto_104927 ) ( ON ?auto_104928 ?auto_104929 ) ( CLEAR ?auto_104928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104925 ?auto_104926 ?auto_104927 ?auto_104928 )
      ( MAKE-10PILE ?auto_104925 ?auto_104926 ?auto_104927 ?auto_104928 ?auto_104929 ?auto_104930 ?auto_104931 ?auto_104932 ?auto_104933 ?auto_104934 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104945 - BLOCK
      ?auto_104946 - BLOCK
      ?auto_104947 - BLOCK
      ?auto_104948 - BLOCK
      ?auto_104949 - BLOCK
      ?auto_104950 - BLOCK
      ?auto_104951 - BLOCK
      ?auto_104952 - BLOCK
      ?auto_104953 - BLOCK
      ?auto_104954 - BLOCK
    )
    :vars
    (
      ?auto_104955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104954 ?auto_104955 ) ( ON-TABLE ?auto_104945 ) ( ON ?auto_104946 ?auto_104945 ) ( not ( = ?auto_104945 ?auto_104946 ) ) ( not ( = ?auto_104945 ?auto_104947 ) ) ( not ( = ?auto_104945 ?auto_104948 ) ) ( not ( = ?auto_104945 ?auto_104949 ) ) ( not ( = ?auto_104945 ?auto_104950 ) ) ( not ( = ?auto_104945 ?auto_104951 ) ) ( not ( = ?auto_104945 ?auto_104952 ) ) ( not ( = ?auto_104945 ?auto_104953 ) ) ( not ( = ?auto_104945 ?auto_104954 ) ) ( not ( = ?auto_104945 ?auto_104955 ) ) ( not ( = ?auto_104946 ?auto_104947 ) ) ( not ( = ?auto_104946 ?auto_104948 ) ) ( not ( = ?auto_104946 ?auto_104949 ) ) ( not ( = ?auto_104946 ?auto_104950 ) ) ( not ( = ?auto_104946 ?auto_104951 ) ) ( not ( = ?auto_104946 ?auto_104952 ) ) ( not ( = ?auto_104946 ?auto_104953 ) ) ( not ( = ?auto_104946 ?auto_104954 ) ) ( not ( = ?auto_104946 ?auto_104955 ) ) ( not ( = ?auto_104947 ?auto_104948 ) ) ( not ( = ?auto_104947 ?auto_104949 ) ) ( not ( = ?auto_104947 ?auto_104950 ) ) ( not ( = ?auto_104947 ?auto_104951 ) ) ( not ( = ?auto_104947 ?auto_104952 ) ) ( not ( = ?auto_104947 ?auto_104953 ) ) ( not ( = ?auto_104947 ?auto_104954 ) ) ( not ( = ?auto_104947 ?auto_104955 ) ) ( not ( = ?auto_104948 ?auto_104949 ) ) ( not ( = ?auto_104948 ?auto_104950 ) ) ( not ( = ?auto_104948 ?auto_104951 ) ) ( not ( = ?auto_104948 ?auto_104952 ) ) ( not ( = ?auto_104948 ?auto_104953 ) ) ( not ( = ?auto_104948 ?auto_104954 ) ) ( not ( = ?auto_104948 ?auto_104955 ) ) ( not ( = ?auto_104949 ?auto_104950 ) ) ( not ( = ?auto_104949 ?auto_104951 ) ) ( not ( = ?auto_104949 ?auto_104952 ) ) ( not ( = ?auto_104949 ?auto_104953 ) ) ( not ( = ?auto_104949 ?auto_104954 ) ) ( not ( = ?auto_104949 ?auto_104955 ) ) ( not ( = ?auto_104950 ?auto_104951 ) ) ( not ( = ?auto_104950 ?auto_104952 ) ) ( not ( = ?auto_104950 ?auto_104953 ) ) ( not ( = ?auto_104950 ?auto_104954 ) ) ( not ( = ?auto_104950 ?auto_104955 ) ) ( not ( = ?auto_104951 ?auto_104952 ) ) ( not ( = ?auto_104951 ?auto_104953 ) ) ( not ( = ?auto_104951 ?auto_104954 ) ) ( not ( = ?auto_104951 ?auto_104955 ) ) ( not ( = ?auto_104952 ?auto_104953 ) ) ( not ( = ?auto_104952 ?auto_104954 ) ) ( not ( = ?auto_104952 ?auto_104955 ) ) ( not ( = ?auto_104953 ?auto_104954 ) ) ( not ( = ?auto_104953 ?auto_104955 ) ) ( not ( = ?auto_104954 ?auto_104955 ) ) ( ON ?auto_104953 ?auto_104954 ) ( ON ?auto_104952 ?auto_104953 ) ( ON ?auto_104951 ?auto_104952 ) ( ON ?auto_104950 ?auto_104951 ) ( ON ?auto_104949 ?auto_104950 ) ( ON ?auto_104948 ?auto_104949 ) ( CLEAR ?auto_104946 ) ( ON ?auto_104947 ?auto_104948 ) ( CLEAR ?auto_104947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104945 ?auto_104946 ?auto_104947 )
      ( MAKE-10PILE ?auto_104945 ?auto_104946 ?auto_104947 ?auto_104948 ?auto_104949 ?auto_104950 ?auto_104951 ?auto_104952 ?auto_104953 ?auto_104954 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104966 - BLOCK
      ?auto_104967 - BLOCK
      ?auto_104968 - BLOCK
      ?auto_104969 - BLOCK
      ?auto_104970 - BLOCK
      ?auto_104971 - BLOCK
      ?auto_104972 - BLOCK
      ?auto_104973 - BLOCK
      ?auto_104974 - BLOCK
      ?auto_104975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104975 ) ( ON-TABLE ?auto_104966 ) ( ON ?auto_104967 ?auto_104966 ) ( not ( = ?auto_104966 ?auto_104967 ) ) ( not ( = ?auto_104966 ?auto_104968 ) ) ( not ( = ?auto_104966 ?auto_104969 ) ) ( not ( = ?auto_104966 ?auto_104970 ) ) ( not ( = ?auto_104966 ?auto_104971 ) ) ( not ( = ?auto_104966 ?auto_104972 ) ) ( not ( = ?auto_104966 ?auto_104973 ) ) ( not ( = ?auto_104966 ?auto_104974 ) ) ( not ( = ?auto_104966 ?auto_104975 ) ) ( not ( = ?auto_104967 ?auto_104968 ) ) ( not ( = ?auto_104967 ?auto_104969 ) ) ( not ( = ?auto_104967 ?auto_104970 ) ) ( not ( = ?auto_104967 ?auto_104971 ) ) ( not ( = ?auto_104967 ?auto_104972 ) ) ( not ( = ?auto_104967 ?auto_104973 ) ) ( not ( = ?auto_104967 ?auto_104974 ) ) ( not ( = ?auto_104967 ?auto_104975 ) ) ( not ( = ?auto_104968 ?auto_104969 ) ) ( not ( = ?auto_104968 ?auto_104970 ) ) ( not ( = ?auto_104968 ?auto_104971 ) ) ( not ( = ?auto_104968 ?auto_104972 ) ) ( not ( = ?auto_104968 ?auto_104973 ) ) ( not ( = ?auto_104968 ?auto_104974 ) ) ( not ( = ?auto_104968 ?auto_104975 ) ) ( not ( = ?auto_104969 ?auto_104970 ) ) ( not ( = ?auto_104969 ?auto_104971 ) ) ( not ( = ?auto_104969 ?auto_104972 ) ) ( not ( = ?auto_104969 ?auto_104973 ) ) ( not ( = ?auto_104969 ?auto_104974 ) ) ( not ( = ?auto_104969 ?auto_104975 ) ) ( not ( = ?auto_104970 ?auto_104971 ) ) ( not ( = ?auto_104970 ?auto_104972 ) ) ( not ( = ?auto_104970 ?auto_104973 ) ) ( not ( = ?auto_104970 ?auto_104974 ) ) ( not ( = ?auto_104970 ?auto_104975 ) ) ( not ( = ?auto_104971 ?auto_104972 ) ) ( not ( = ?auto_104971 ?auto_104973 ) ) ( not ( = ?auto_104971 ?auto_104974 ) ) ( not ( = ?auto_104971 ?auto_104975 ) ) ( not ( = ?auto_104972 ?auto_104973 ) ) ( not ( = ?auto_104972 ?auto_104974 ) ) ( not ( = ?auto_104972 ?auto_104975 ) ) ( not ( = ?auto_104973 ?auto_104974 ) ) ( not ( = ?auto_104973 ?auto_104975 ) ) ( not ( = ?auto_104974 ?auto_104975 ) ) ( ON ?auto_104974 ?auto_104975 ) ( ON ?auto_104973 ?auto_104974 ) ( ON ?auto_104972 ?auto_104973 ) ( ON ?auto_104971 ?auto_104972 ) ( ON ?auto_104970 ?auto_104971 ) ( ON ?auto_104969 ?auto_104970 ) ( CLEAR ?auto_104967 ) ( ON ?auto_104968 ?auto_104969 ) ( CLEAR ?auto_104968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104966 ?auto_104967 ?auto_104968 )
      ( MAKE-10PILE ?auto_104966 ?auto_104967 ?auto_104968 ?auto_104969 ?auto_104970 ?auto_104971 ?auto_104972 ?auto_104973 ?auto_104974 ?auto_104975 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_104986 - BLOCK
      ?auto_104987 - BLOCK
      ?auto_104988 - BLOCK
      ?auto_104989 - BLOCK
      ?auto_104990 - BLOCK
      ?auto_104991 - BLOCK
      ?auto_104992 - BLOCK
      ?auto_104993 - BLOCK
      ?auto_104994 - BLOCK
      ?auto_104995 - BLOCK
    )
    :vars
    (
      ?auto_104996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104995 ?auto_104996 ) ( ON-TABLE ?auto_104986 ) ( not ( = ?auto_104986 ?auto_104987 ) ) ( not ( = ?auto_104986 ?auto_104988 ) ) ( not ( = ?auto_104986 ?auto_104989 ) ) ( not ( = ?auto_104986 ?auto_104990 ) ) ( not ( = ?auto_104986 ?auto_104991 ) ) ( not ( = ?auto_104986 ?auto_104992 ) ) ( not ( = ?auto_104986 ?auto_104993 ) ) ( not ( = ?auto_104986 ?auto_104994 ) ) ( not ( = ?auto_104986 ?auto_104995 ) ) ( not ( = ?auto_104986 ?auto_104996 ) ) ( not ( = ?auto_104987 ?auto_104988 ) ) ( not ( = ?auto_104987 ?auto_104989 ) ) ( not ( = ?auto_104987 ?auto_104990 ) ) ( not ( = ?auto_104987 ?auto_104991 ) ) ( not ( = ?auto_104987 ?auto_104992 ) ) ( not ( = ?auto_104987 ?auto_104993 ) ) ( not ( = ?auto_104987 ?auto_104994 ) ) ( not ( = ?auto_104987 ?auto_104995 ) ) ( not ( = ?auto_104987 ?auto_104996 ) ) ( not ( = ?auto_104988 ?auto_104989 ) ) ( not ( = ?auto_104988 ?auto_104990 ) ) ( not ( = ?auto_104988 ?auto_104991 ) ) ( not ( = ?auto_104988 ?auto_104992 ) ) ( not ( = ?auto_104988 ?auto_104993 ) ) ( not ( = ?auto_104988 ?auto_104994 ) ) ( not ( = ?auto_104988 ?auto_104995 ) ) ( not ( = ?auto_104988 ?auto_104996 ) ) ( not ( = ?auto_104989 ?auto_104990 ) ) ( not ( = ?auto_104989 ?auto_104991 ) ) ( not ( = ?auto_104989 ?auto_104992 ) ) ( not ( = ?auto_104989 ?auto_104993 ) ) ( not ( = ?auto_104989 ?auto_104994 ) ) ( not ( = ?auto_104989 ?auto_104995 ) ) ( not ( = ?auto_104989 ?auto_104996 ) ) ( not ( = ?auto_104990 ?auto_104991 ) ) ( not ( = ?auto_104990 ?auto_104992 ) ) ( not ( = ?auto_104990 ?auto_104993 ) ) ( not ( = ?auto_104990 ?auto_104994 ) ) ( not ( = ?auto_104990 ?auto_104995 ) ) ( not ( = ?auto_104990 ?auto_104996 ) ) ( not ( = ?auto_104991 ?auto_104992 ) ) ( not ( = ?auto_104991 ?auto_104993 ) ) ( not ( = ?auto_104991 ?auto_104994 ) ) ( not ( = ?auto_104991 ?auto_104995 ) ) ( not ( = ?auto_104991 ?auto_104996 ) ) ( not ( = ?auto_104992 ?auto_104993 ) ) ( not ( = ?auto_104992 ?auto_104994 ) ) ( not ( = ?auto_104992 ?auto_104995 ) ) ( not ( = ?auto_104992 ?auto_104996 ) ) ( not ( = ?auto_104993 ?auto_104994 ) ) ( not ( = ?auto_104993 ?auto_104995 ) ) ( not ( = ?auto_104993 ?auto_104996 ) ) ( not ( = ?auto_104994 ?auto_104995 ) ) ( not ( = ?auto_104994 ?auto_104996 ) ) ( not ( = ?auto_104995 ?auto_104996 ) ) ( ON ?auto_104994 ?auto_104995 ) ( ON ?auto_104993 ?auto_104994 ) ( ON ?auto_104992 ?auto_104993 ) ( ON ?auto_104991 ?auto_104992 ) ( ON ?auto_104990 ?auto_104991 ) ( ON ?auto_104989 ?auto_104990 ) ( ON ?auto_104988 ?auto_104989 ) ( CLEAR ?auto_104986 ) ( ON ?auto_104987 ?auto_104988 ) ( CLEAR ?auto_104987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104986 ?auto_104987 )
      ( MAKE-10PILE ?auto_104986 ?auto_104987 ?auto_104988 ?auto_104989 ?auto_104990 ?auto_104991 ?auto_104992 ?auto_104993 ?auto_104994 ?auto_104995 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_105007 - BLOCK
      ?auto_105008 - BLOCK
      ?auto_105009 - BLOCK
      ?auto_105010 - BLOCK
      ?auto_105011 - BLOCK
      ?auto_105012 - BLOCK
      ?auto_105013 - BLOCK
      ?auto_105014 - BLOCK
      ?auto_105015 - BLOCK
      ?auto_105016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105016 ) ( ON-TABLE ?auto_105007 ) ( not ( = ?auto_105007 ?auto_105008 ) ) ( not ( = ?auto_105007 ?auto_105009 ) ) ( not ( = ?auto_105007 ?auto_105010 ) ) ( not ( = ?auto_105007 ?auto_105011 ) ) ( not ( = ?auto_105007 ?auto_105012 ) ) ( not ( = ?auto_105007 ?auto_105013 ) ) ( not ( = ?auto_105007 ?auto_105014 ) ) ( not ( = ?auto_105007 ?auto_105015 ) ) ( not ( = ?auto_105007 ?auto_105016 ) ) ( not ( = ?auto_105008 ?auto_105009 ) ) ( not ( = ?auto_105008 ?auto_105010 ) ) ( not ( = ?auto_105008 ?auto_105011 ) ) ( not ( = ?auto_105008 ?auto_105012 ) ) ( not ( = ?auto_105008 ?auto_105013 ) ) ( not ( = ?auto_105008 ?auto_105014 ) ) ( not ( = ?auto_105008 ?auto_105015 ) ) ( not ( = ?auto_105008 ?auto_105016 ) ) ( not ( = ?auto_105009 ?auto_105010 ) ) ( not ( = ?auto_105009 ?auto_105011 ) ) ( not ( = ?auto_105009 ?auto_105012 ) ) ( not ( = ?auto_105009 ?auto_105013 ) ) ( not ( = ?auto_105009 ?auto_105014 ) ) ( not ( = ?auto_105009 ?auto_105015 ) ) ( not ( = ?auto_105009 ?auto_105016 ) ) ( not ( = ?auto_105010 ?auto_105011 ) ) ( not ( = ?auto_105010 ?auto_105012 ) ) ( not ( = ?auto_105010 ?auto_105013 ) ) ( not ( = ?auto_105010 ?auto_105014 ) ) ( not ( = ?auto_105010 ?auto_105015 ) ) ( not ( = ?auto_105010 ?auto_105016 ) ) ( not ( = ?auto_105011 ?auto_105012 ) ) ( not ( = ?auto_105011 ?auto_105013 ) ) ( not ( = ?auto_105011 ?auto_105014 ) ) ( not ( = ?auto_105011 ?auto_105015 ) ) ( not ( = ?auto_105011 ?auto_105016 ) ) ( not ( = ?auto_105012 ?auto_105013 ) ) ( not ( = ?auto_105012 ?auto_105014 ) ) ( not ( = ?auto_105012 ?auto_105015 ) ) ( not ( = ?auto_105012 ?auto_105016 ) ) ( not ( = ?auto_105013 ?auto_105014 ) ) ( not ( = ?auto_105013 ?auto_105015 ) ) ( not ( = ?auto_105013 ?auto_105016 ) ) ( not ( = ?auto_105014 ?auto_105015 ) ) ( not ( = ?auto_105014 ?auto_105016 ) ) ( not ( = ?auto_105015 ?auto_105016 ) ) ( ON ?auto_105015 ?auto_105016 ) ( ON ?auto_105014 ?auto_105015 ) ( ON ?auto_105013 ?auto_105014 ) ( ON ?auto_105012 ?auto_105013 ) ( ON ?auto_105011 ?auto_105012 ) ( ON ?auto_105010 ?auto_105011 ) ( ON ?auto_105009 ?auto_105010 ) ( CLEAR ?auto_105007 ) ( ON ?auto_105008 ?auto_105009 ) ( CLEAR ?auto_105008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105007 ?auto_105008 )
      ( MAKE-10PILE ?auto_105007 ?auto_105008 ?auto_105009 ?auto_105010 ?auto_105011 ?auto_105012 ?auto_105013 ?auto_105014 ?auto_105015 ?auto_105016 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_105027 - BLOCK
      ?auto_105028 - BLOCK
      ?auto_105029 - BLOCK
      ?auto_105030 - BLOCK
      ?auto_105031 - BLOCK
      ?auto_105032 - BLOCK
      ?auto_105033 - BLOCK
      ?auto_105034 - BLOCK
      ?auto_105035 - BLOCK
      ?auto_105036 - BLOCK
    )
    :vars
    (
      ?auto_105037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105036 ?auto_105037 ) ( not ( = ?auto_105027 ?auto_105028 ) ) ( not ( = ?auto_105027 ?auto_105029 ) ) ( not ( = ?auto_105027 ?auto_105030 ) ) ( not ( = ?auto_105027 ?auto_105031 ) ) ( not ( = ?auto_105027 ?auto_105032 ) ) ( not ( = ?auto_105027 ?auto_105033 ) ) ( not ( = ?auto_105027 ?auto_105034 ) ) ( not ( = ?auto_105027 ?auto_105035 ) ) ( not ( = ?auto_105027 ?auto_105036 ) ) ( not ( = ?auto_105027 ?auto_105037 ) ) ( not ( = ?auto_105028 ?auto_105029 ) ) ( not ( = ?auto_105028 ?auto_105030 ) ) ( not ( = ?auto_105028 ?auto_105031 ) ) ( not ( = ?auto_105028 ?auto_105032 ) ) ( not ( = ?auto_105028 ?auto_105033 ) ) ( not ( = ?auto_105028 ?auto_105034 ) ) ( not ( = ?auto_105028 ?auto_105035 ) ) ( not ( = ?auto_105028 ?auto_105036 ) ) ( not ( = ?auto_105028 ?auto_105037 ) ) ( not ( = ?auto_105029 ?auto_105030 ) ) ( not ( = ?auto_105029 ?auto_105031 ) ) ( not ( = ?auto_105029 ?auto_105032 ) ) ( not ( = ?auto_105029 ?auto_105033 ) ) ( not ( = ?auto_105029 ?auto_105034 ) ) ( not ( = ?auto_105029 ?auto_105035 ) ) ( not ( = ?auto_105029 ?auto_105036 ) ) ( not ( = ?auto_105029 ?auto_105037 ) ) ( not ( = ?auto_105030 ?auto_105031 ) ) ( not ( = ?auto_105030 ?auto_105032 ) ) ( not ( = ?auto_105030 ?auto_105033 ) ) ( not ( = ?auto_105030 ?auto_105034 ) ) ( not ( = ?auto_105030 ?auto_105035 ) ) ( not ( = ?auto_105030 ?auto_105036 ) ) ( not ( = ?auto_105030 ?auto_105037 ) ) ( not ( = ?auto_105031 ?auto_105032 ) ) ( not ( = ?auto_105031 ?auto_105033 ) ) ( not ( = ?auto_105031 ?auto_105034 ) ) ( not ( = ?auto_105031 ?auto_105035 ) ) ( not ( = ?auto_105031 ?auto_105036 ) ) ( not ( = ?auto_105031 ?auto_105037 ) ) ( not ( = ?auto_105032 ?auto_105033 ) ) ( not ( = ?auto_105032 ?auto_105034 ) ) ( not ( = ?auto_105032 ?auto_105035 ) ) ( not ( = ?auto_105032 ?auto_105036 ) ) ( not ( = ?auto_105032 ?auto_105037 ) ) ( not ( = ?auto_105033 ?auto_105034 ) ) ( not ( = ?auto_105033 ?auto_105035 ) ) ( not ( = ?auto_105033 ?auto_105036 ) ) ( not ( = ?auto_105033 ?auto_105037 ) ) ( not ( = ?auto_105034 ?auto_105035 ) ) ( not ( = ?auto_105034 ?auto_105036 ) ) ( not ( = ?auto_105034 ?auto_105037 ) ) ( not ( = ?auto_105035 ?auto_105036 ) ) ( not ( = ?auto_105035 ?auto_105037 ) ) ( not ( = ?auto_105036 ?auto_105037 ) ) ( ON ?auto_105035 ?auto_105036 ) ( ON ?auto_105034 ?auto_105035 ) ( ON ?auto_105033 ?auto_105034 ) ( ON ?auto_105032 ?auto_105033 ) ( ON ?auto_105031 ?auto_105032 ) ( ON ?auto_105030 ?auto_105031 ) ( ON ?auto_105029 ?auto_105030 ) ( ON ?auto_105028 ?auto_105029 ) ( ON ?auto_105027 ?auto_105028 ) ( CLEAR ?auto_105027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105027 )
      ( MAKE-10PILE ?auto_105027 ?auto_105028 ?auto_105029 ?auto_105030 ?auto_105031 ?auto_105032 ?auto_105033 ?auto_105034 ?auto_105035 ?auto_105036 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_105048 - BLOCK
      ?auto_105049 - BLOCK
      ?auto_105050 - BLOCK
      ?auto_105051 - BLOCK
      ?auto_105052 - BLOCK
      ?auto_105053 - BLOCK
      ?auto_105054 - BLOCK
      ?auto_105055 - BLOCK
      ?auto_105056 - BLOCK
      ?auto_105057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105057 ) ( not ( = ?auto_105048 ?auto_105049 ) ) ( not ( = ?auto_105048 ?auto_105050 ) ) ( not ( = ?auto_105048 ?auto_105051 ) ) ( not ( = ?auto_105048 ?auto_105052 ) ) ( not ( = ?auto_105048 ?auto_105053 ) ) ( not ( = ?auto_105048 ?auto_105054 ) ) ( not ( = ?auto_105048 ?auto_105055 ) ) ( not ( = ?auto_105048 ?auto_105056 ) ) ( not ( = ?auto_105048 ?auto_105057 ) ) ( not ( = ?auto_105049 ?auto_105050 ) ) ( not ( = ?auto_105049 ?auto_105051 ) ) ( not ( = ?auto_105049 ?auto_105052 ) ) ( not ( = ?auto_105049 ?auto_105053 ) ) ( not ( = ?auto_105049 ?auto_105054 ) ) ( not ( = ?auto_105049 ?auto_105055 ) ) ( not ( = ?auto_105049 ?auto_105056 ) ) ( not ( = ?auto_105049 ?auto_105057 ) ) ( not ( = ?auto_105050 ?auto_105051 ) ) ( not ( = ?auto_105050 ?auto_105052 ) ) ( not ( = ?auto_105050 ?auto_105053 ) ) ( not ( = ?auto_105050 ?auto_105054 ) ) ( not ( = ?auto_105050 ?auto_105055 ) ) ( not ( = ?auto_105050 ?auto_105056 ) ) ( not ( = ?auto_105050 ?auto_105057 ) ) ( not ( = ?auto_105051 ?auto_105052 ) ) ( not ( = ?auto_105051 ?auto_105053 ) ) ( not ( = ?auto_105051 ?auto_105054 ) ) ( not ( = ?auto_105051 ?auto_105055 ) ) ( not ( = ?auto_105051 ?auto_105056 ) ) ( not ( = ?auto_105051 ?auto_105057 ) ) ( not ( = ?auto_105052 ?auto_105053 ) ) ( not ( = ?auto_105052 ?auto_105054 ) ) ( not ( = ?auto_105052 ?auto_105055 ) ) ( not ( = ?auto_105052 ?auto_105056 ) ) ( not ( = ?auto_105052 ?auto_105057 ) ) ( not ( = ?auto_105053 ?auto_105054 ) ) ( not ( = ?auto_105053 ?auto_105055 ) ) ( not ( = ?auto_105053 ?auto_105056 ) ) ( not ( = ?auto_105053 ?auto_105057 ) ) ( not ( = ?auto_105054 ?auto_105055 ) ) ( not ( = ?auto_105054 ?auto_105056 ) ) ( not ( = ?auto_105054 ?auto_105057 ) ) ( not ( = ?auto_105055 ?auto_105056 ) ) ( not ( = ?auto_105055 ?auto_105057 ) ) ( not ( = ?auto_105056 ?auto_105057 ) ) ( ON ?auto_105056 ?auto_105057 ) ( ON ?auto_105055 ?auto_105056 ) ( ON ?auto_105054 ?auto_105055 ) ( ON ?auto_105053 ?auto_105054 ) ( ON ?auto_105052 ?auto_105053 ) ( ON ?auto_105051 ?auto_105052 ) ( ON ?auto_105050 ?auto_105051 ) ( ON ?auto_105049 ?auto_105050 ) ( ON ?auto_105048 ?auto_105049 ) ( CLEAR ?auto_105048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105048 )
      ( MAKE-10PILE ?auto_105048 ?auto_105049 ?auto_105050 ?auto_105051 ?auto_105052 ?auto_105053 ?auto_105054 ?auto_105055 ?auto_105056 ?auto_105057 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_105068 - BLOCK
      ?auto_105069 - BLOCK
      ?auto_105070 - BLOCK
      ?auto_105071 - BLOCK
      ?auto_105072 - BLOCK
      ?auto_105073 - BLOCK
      ?auto_105074 - BLOCK
      ?auto_105075 - BLOCK
      ?auto_105076 - BLOCK
      ?auto_105077 - BLOCK
    )
    :vars
    (
      ?auto_105078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105068 ?auto_105069 ) ) ( not ( = ?auto_105068 ?auto_105070 ) ) ( not ( = ?auto_105068 ?auto_105071 ) ) ( not ( = ?auto_105068 ?auto_105072 ) ) ( not ( = ?auto_105068 ?auto_105073 ) ) ( not ( = ?auto_105068 ?auto_105074 ) ) ( not ( = ?auto_105068 ?auto_105075 ) ) ( not ( = ?auto_105068 ?auto_105076 ) ) ( not ( = ?auto_105068 ?auto_105077 ) ) ( not ( = ?auto_105069 ?auto_105070 ) ) ( not ( = ?auto_105069 ?auto_105071 ) ) ( not ( = ?auto_105069 ?auto_105072 ) ) ( not ( = ?auto_105069 ?auto_105073 ) ) ( not ( = ?auto_105069 ?auto_105074 ) ) ( not ( = ?auto_105069 ?auto_105075 ) ) ( not ( = ?auto_105069 ?auto_105076 ) ) ( not ( = ?auto_105069 ?auto_105077 ) ) ( not ( = ?auto_105070 ?auto_105071 ) ) ( not ( = ?auto_105070 ?auto_105072 ) ) ( not ( = ?auto_105070 ?auto_105073 ) ) ( not ( = ?auto_105070 ?auto_105074 ) ) ( not ( = ?auto_105070 ?auto_105075 ) ) ( not ( = ?auto_105070 ?auto_105076 ) ) ( not ( = ?auto_105070 ?auto_105077 ) ) ( not ( = ?auto_105071 ?auto_105072 ) ) ( not ( = ?auto_105071 ?auto_105073 ) ) ( not ( = ?auto_105071 ?auto_105074 ) ) ( not ( = ?auto_105071 ?auto_105075 ) ) ( not ( = ?auto_105071 ?auto_105076 ) ) ( not ( = ?auto_105071 ?auto_105077 ) ) ( not ( = ?auto_105072 ?auto_105073 ) ) ( not ( = ?auto_105072 ?auto_105074 ) ) ( not ( = ?auto_105072 ?auto_105075 ) ) ( not ( = ?auto_105072 ?auto_105076 ) ) ( not ( = ?auto_105072 ?auto_105077 ) ) ( not ( = ?auto_105073 ?auto_105074 ) ) ( not ( = ?auto_105073 ?auto_105075 ) ) ( not ( = ?auto_105073 ?auto_105076 ) ) ( not ( = ?auto_105073 ?auto_105077 ) ) ( not ( = ?auto_105074 ?auto_105075 ) ) ( not ( = ?auto_105074 ?auto_105076 ) ) ( not ( = ?auto_105074 ?auto_105077 ) ) ( not ( = ?auto_105075 ?auto_105076 ) ) ( not ( = ?auto_105075 ?auto_105077 ) ) ( not ( = ?auto_105076 ?auto_105077 ) ) ( ON ?auto_105068 ?auto_105078 ) ( not ( = ?auto_105077 ?auto_105078 ) ) ( not ( = ?auto_105076 ?auto_105078 ) ) ( not ( = ?auto_105075 ?auto_105078 ) ) ( not ( = ?auto_105074 ?auto_105078 ) ) ( not ( = ?auto_105073 ?auto_105078 ) ) ( not ( = ?auto_105072 ?auto_105078 ) ) ( not ( = ?auto_105071 ?auto_105078 ) ) ( not ( = ?auto_105070 ?auto_105078 ) ) ( not ( = ?auto_105069 ?auto_105078 ) ) ( not ( = ?auto_105068 ?auto_105078 ) ) ( ON ?auto_105069 ?auto_105068 ) ( ON ?auto_105070 ?auto_105069 ) ( ON ?auto_105071 ?auto_105070 ) ( ON ?auto_105072 ?auto_105071 ) ( ON ?auto_105073 ?auto_105072 ) ( ON ?auto_105074 ?auto_105073 ) ( ON ?auto_105075 ?auto_105074 ) ( ON ?auto_105076 ?auto_105075 ) ( ON ?auto_105077 ?auto_105076 ) ( CLEAR ?auto_105077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_105077 ?auto_105076 ?auto_105075 ?auto_105074 ?auto_105073 ?auto_105072 ?auto_105071 ?auto_105070 ?auto_105069 ?auto_105068 )
      ( MAKE-10PILE ?auto_105068 ?auto_105069 ?auto_105070 ?auto_105071 ?auto_105072 ?auto_105073 ?auto_105074 ?auto_105075 ?auto_105076 ?auto_105077 ) )
  )

)

