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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20450 - BLOCK
      ?auto_20451 - BLOCK
      ?auto_20452 - BLOCK
      ?auto_20453 - BLOCK
      ?auto_20454 - BLOCK
    )
    :vars
    (
      ?auto_20455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20455 ?auto_20454 ) ( CLEAR ?auto_20455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20450 ) ( ON ?auto_20451 ?auto_20450 ) ( ON ?auto_20452 ?auto_20451 ) ( ON ?auto_20453 ?auto_20452 ) ( ON ?auto_20454 ?auto_20453 ) ( not ( = ?auto_20450 ?auto_20451 ) ) ( not ( = ?auto_20450 ?auto_20452 ) ) ( not ( = ?auto_20450 ?auto_20453 ) ) ( not ( = ?auto_20450 ?auto_20454 ) ) ( not ( = ?auto_20450 ?auto_20455 ) ) ( not ( = ?auto_20451 ?auto_20452 ) ) ( not ( = ?auto_20451 ?auto_20453 ) ) ( not ( = ?auto_20451 ?auto_20454 ) ) ( not ( = ?auto_20451 ?auto_20455 ) ) ( not ( = ?auto_20452 ?auto_20453 ) ) ( not ( = ?auto_20452 ?auto_20454 ) ) ( not ( = ?auto_20452 ?auto_20455 ) ) ( not ( = ?auto_20453 ?auto_20454 ) ) ( not ( = ?auto_20453 ?auto_20455 ) ) ( not ( = ?auto_20454 ?auto_20455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20455 ?auto_20454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20457 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20457 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20458 - BLOCK
    )
    :vars
    (
      ?auto_20459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20458 ?auto_20459 ) ( CLEAR ?auto_20458 ) ( HAND-EMPTY ) ( not ( = ?auto_20458 ?auto_20459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20458 ?auto_20459 )
      ( MAKE-1PILE ?auto_20458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20464 - BLOCK
      ?auto_20465 - BLOCK
      ?auto_20466 - BLOCK
      ?auto_20467 - BLOCK
    )
    :vars
    (
      ?auto_20468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20468 ?auto_20467 ) ( CLEAR ?auto_20468 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20464 ) ( ON ?auto_20465 ?auto_20464 ) ( ON ?auto_20466 ?auto_20465 ) ( ON ?auto_20467 ?auto_20466 ) ( not ( = ?auto_20464 ?auto_20465 ) ) ( not ( = ?auto_20464 ?auto_20466 ) ) ( not ( = ?auto_20464 ?auto_20467 ) ) ( not ( = ?auto_20464 ?auto_20468 ) ) ( not ( = ?auto_20465 ?auto_20466 ) ) ( not ( = ?auto_20465 ?auto_20467 ) ) ( not ( = ?auto_20465 ?auto_20468 ) ) ( not ( = ?auto_20466 ?auto_20467 ) ) ( not ( = ?auto_20466 ?auto_20468 ) ) ( not ( = ?auto_20467 ?auto_20468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20468 ?auto_20467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20469 - BLOCK
      ?auto_20470 - BLOCK
      ?auto_20471 - BLOCK
      ?auto_20472 - BLOCK
    )
    :vars
    (
      ?auto_20473 - BLOCK
      ?auto_20474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20473 ?auto_20472 ) ( CLEAR ?auto_20473 ) ( ON-TABLE ?auto_20469 ) ( ON ?auto_20470 ?auto_20469 ) ( ON ?auto_20471 ?auto_20470 ) ( ON ?auto_20472 ?auto_20471 ) ( not ( = ?auto_20469 ?auto_20470 ) ) ( not ( = ?auto_20469 ?auto_20471 ) ) ( not ( = ?auto_20469 ?auto_20472 ) ) ( not ( = ?auto_20469 ?auto_20473 ) ) ( not ( = ?auto_20470 ?auto_20471 ) ) ( not ( = ?auto_20470 ?auto_20472 ) ) ( not ( = ?auto_20470 ?auto_20473 ) ) ( not ( = ?auto_20471 ?auto_20472 ) ) ( not ( = ?auto_20471 ?auto_20473 ) ) ( not ( = ?auto_20472 ?auto_20473 ) ) ( HOLDING ?auto_20474 ) ( not ( = ?auto_20469 ?auto_20474 ) ) ( not ( = ?auto_20470 ?auto_20474 ) ) ( not ( = ?auto_20471 ?auto_20474 ) ) ( not ( = ?auto_20472 ?auto_20474 ) ) ( not ( = ?auto_20473 ?auto_20474 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20474 )
      ( MAKE-4PILE ?auto_20469 ?auto_20470 ?auto_20471 ?auto_20472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20475 - BLOCK
      ?auto_20476 - BLOCK
      ?auto_20477 - BLOCK
      ?auto_20478 - BLOCK
    )
    :vars
    (
      ?auto_20479 - BLOCK
      ?auto_20480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20479 ?auto_20478 ) ( ON-TABLE ?auto_20475 ) ( ON ?auto_20476 ?auto_20475 ) ( ON ?auto_20477 ?auto_20476 ) ( ON ?auto_20478 ?auto_20477 ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20478 ) ) ( not ( = ?auto_20475 ?auto_20479 ) ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( not ( = ?auto_20476 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( not ( = ?auto_20478 ?auto_20479 ) ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20477 ?auto_20480 ) ) ( not ( = ?auto_20478 ?auto_20480 ) ) ( not ( = ?auto_20479 ?auto_20480 ) ) ( ON ?auto_20480 ?auto_20479 ) ( CLEAR ?auto_20480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ?auto_20479 )
      ( MAKE-4PILE ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20483 - BLOCK
      ?auto_20484 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20484 ) ( CLEAR ?auto_20483 ) ( ON-TABLE ?auto_20483 ) ( not ( = ?auto_20483 ?auto_20484 ) ) )
    :subtasks
    ( ( !STACK ?auto_20484 ?auto_20483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20485 - BLOCK
      ?auto_20486 - BLOCK
    )
    :vars
    (
      ?auto_20487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20485 ) ( ON-TABLE ?auto_20485 ) ( not ( = ?auto_20485 ?auto_20486 ) ) ( ON ?auto_20486 ?auto_20487 ) ( CLEAR ?auto_20486 ) ( HAND-EMPTY ) ( not ( = ?auto_20485 ?auto_20487 ) ) ( not ( = ?auto_20486 ?auto_20487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20486 ?auto_20487 )
      ( MAKE-2PILE ?auto_20485 ?auto_20486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20488 - BLOCK
      ?auto_20489 - BLOCK
    )
    :vars
    (
      ?auto_20490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20488 ?auto_20489 ) ) ( ON ?auto_20489 ?auto_20490 ) ( CLEAR ?auto_20489 ) ( not ( = ?auto_20488 ?auto_20490 ) ) ( not ( = ?auto_20489 ?auto_20490 ) ) ( HOLDING ?auto_20488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20488 )
      ( MAKE-2PILE ?auto_20488 ?auto_20489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20491 - BLOCK
      ?auto_20492 - BLOCK
    )
    :vars
    (
      ?auto_20493 - BLOCK
      ?auto_20496 - BLOCK
      ?auto_20494 - BLOCK
      ?auto_20495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20491 ?auto_20492 ) ) ( ON ?auto_20492 ?auto_20493 ) ( not ( = ?auto_20491 ?auto_20493 ) ) ( not ( = ?auto_20492 ?auto_20493 ) ) ( ON ?auto_20491 ?auto_20492 ) ( CLEAR ?auto_20491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20496 ) ( ON ?auto_20494 ?auto_20496 ) ( ON ?auto_20495 ?auto_20494 ) ( ON ?auto_20493 ?auto_20495 ) ( not ( = ?auto_20496 ?auto_20494 ) ) ( not ( = ?auto_20496 ?auto_20495 ) ) ( not ( = ?auto_20496 ?auto_20493 ) ) ( not ( = ?auto_20496 ?auto_20492 ) ) ( not ( = ?auto_20496 ?auto_20491 ) ) ( not ( = ?auto_20494 ?auto_20495 ) ) ( not ( = ?auto_20494 ?auto_20493 ) ) ( not ( = ?auto_20494 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20491 ) ) ( not ( = ?auto_20495 ?auto_20493 ) ) ( not ( = ?auto_20495 ?auto_20492 ) ) ( not ( = ?auto_20495 ?auto_20491 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20496 ?auto_20494 ?auto_20495 ?auto_20493 ?auto_20492 )
      ( MAKE-2PILE ?auto_20491 ?auto_20492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20500 - BLOCK
      ?auto_20501 - BLOCK
      ?auto_20502 - BLOCK
    )
    :vars
    (
      ?auto_20503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20503 ?auto_20502 ) ( CLEAR ?auto_20503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20500 ) ( ON ?auto_20501 ?auto_20500 ) ( ON ?auto_20502 ?auto_20501 ) ( not ( = ?auto_20500 ?auto_20501 ) ) ( not ( = ?auto_20500 ?auto_20502 ) ) ( not ( = ?auto_20500 ?auto_20503 ) ) ( not ( = ?auto_20501 ?auto_20502 ) ) ( not ( = ?auto_20501 ?auto_20503 ) ) ( not ( = ?auto_20502 ?auto_20503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20503 ?auto_20502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20504 - BLOCK
      ?auto_20505 - BLOCK
      ?auto_20506 - BLOCK
    )
    :vars
    (
      ?auto_20507 - BLOCK
      ?auto_20508 - BLOCK
      ?auto_20509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20507 ?auto_20506 ) ( CLEAR ?auto_20507 ) ( ON-TABLE ?auto_20504 ) ( ON ?auto_20505 ?auto_20504 ) ( ON ?auto_20506 ?auto_20505 ) ( not ( = ?auto_20504 ?auto_20505 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( not ( = ?auto_20504 ?auto_20507 ) ) ( not ( = ?auto_20505 ?auto_20506 ) ) ( not ( = ?auto_20505 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( HOLDING ?auto_20508 ) ( CLEAR ?auto_20509 ) ( not ( = ?auto_20504 ?auto_20508 ) ) ( not ( = ?auto_20504 ?auto_20509 ) ) ( not ( = ?auto_20505 ?auto_20508 ) ) ( not ( = ?auto_20505 ?auto_20509 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20509 ) ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20509 ) ) ( not ( = ?auto_20508 ?auto_20509 ) ) )
    :subtasks
    ( ( !STACK ?auto_20508 ?auto_20509 )
      ( MAKE-3PILE ?auto_20504 ?auto_20505 ?auto_20506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20872 - BLOCK
      ?auto_20873 - BLOCK
      ?auto_20874 - BLOCK
    )
    :vars
    (
      ?auto_20876 - BLOCK
      ?auto_20875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20876 ?auto_20874 ) ( ON-TABLE ?auto_20872 ) ( ON ?auto_20873 ?auto_20872 ) ( ON ?auto_20874 ?auto_20873 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20872 ?auto_20876 ) ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20876 ) ) ( not ( = ?auto_20874 ?auto_20876 ) ) ( not ( = ?auto_20872 ?auto_20875 ) ) ( not ( = ?auto_20873 ?auto_20875 ) ) ( not ( = ?auto_20874 ?auto_20875 ) ) ( not ( = ?auto_20876 ?auto_20875 ) ) ( ON ?auto_20875 ?auto_20876 ) ( CLEAR ?auto_20875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20872 ?auto_20873 ?auto_20874 ?auto_20876 )
      ( MAKE-3PILE ?auto_20872 ?auto_20873 ?auto_20874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20516 - BLOCK
      ?auto_20517 - BLOCK
      ?auto_20518 - BLOCK
    )
    :vars
    (
      ?auto_20520 - BLOCK
      ?auto_20519 - BLOCK
      ?auto_20521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20520 ?auto_20518 ) ( ON-TABLE ?auto_20516 ) ( ON ?auto_20517 ?auto_20516 ) ( ON ?auto_20518 ?auto_20517 ) ( not ( = ?auto_20516 ?auto_20517 ) ) ( not ( = ?auto_20516 ?auto_20518 ) ) ( not ( = ?auto_20516 ?auto_20520 ) ) ( not ( = ?auto_20517 ?auto_20518 ) ) ( not ( = ?auto_20517 ?auto_20520 ) ) ( not ( = ?auto_20518 ?auto_20520 ) ) ( not ( = ?auto_20516 ?auto_20519 ) ) ( not ( = ?auto_20516 ?auto_20521 ) ) ( not ( = ?auto_20517 ?auto_20519 ) ) ( not ( = ?auto_20517 ?auto_20521 ) ) ( not ( = ?auto_20518 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20521 ) ) ( not ( = ?auto_20520 ?auto_20519 ) ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( not ( = ?auto_20519 ?auto_20521 ) ) ( ON ?auto_20519 ?auto_20520 ) ( CLEAR ?auto_20519 ) ( HOLDING ?auto_20521 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20521 )
      ( MAKE-3PILE ?auto_20516 ?auto_20517 ?auto_20518 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20522 - BLOCK
      ?auto_20523 - BLOCK
      ?auto_20524 - BLOCK
    )
    :vars
    (
      ?auto_20526 - BLOCK
      ?auto_20525 - BLOCK
      ?auto_20527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20526 ?auto_20524 ) ( ON-TABLE ?auto_20522 ) ( ON ?auto_20523 ?auto_20522 ) ( ON ?auto_20524 ?auto_20523 ) ( not ( = ?auto_20522 ?auto_20523 ) ) ( not ( = ?auto_20522 ?auto_20524 ) ) ( not ( = ?auto_20522 ?auto_20526 ) ) ( not ( = ?auto_20523 ?auto_20524 ) ) ( not ( = ?auto_20523 ?auto_20526 ) ) ( not ( = ?auto_20524 ?auto_20526 ) ) ( not ( = ?auto_20522 ?auto_20525 ) ) ( not ( = ?auto_20522 ?auto_20527 ) ) ( not ( = ?auto_20523 ?auto_20525 ) ) ( not ( = ?auto_20523 ?auto_20527 ) ) ( not ( = ?auto_20524 ?auto_20525 ) ) ( not ( = ?auto_20524 ?auto_20527 ) ) ( not ( = ?auto_20526 ?auto_20525 ) ) ( not ( = ?auto_20526 ?auto_20527 ) ) ( not ( = ?auto_20525 ?auto_20527 ) ) ( ON ?auto_20525 ?auto_20526 ) ( ON ?auto_20527 ?auto_20525 ) ( CLEAR ?auto_20527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20522 ?auto_20523 ?auto_20524 ?auto_20526 ?auto_20525 )
      ( MAKE-3PILE ?auto_20522 ?auto_20523 ?auto_20524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20531 - BLOCK
      ?auto_20532 - BLOCK
      ?auto_20533 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20533 ) ( CLEAR ?auto_20532 ) ( ON-TABLE ?auto_20531 ) ( ON ?auto_20532 ?auto_20531 ) ( not ( = ?auto_20531 ?auto_20532 ) ) ( not ( = ?auto_20531 ?auto_20533 ) ) ( not ( = ?auto_20532 ?auto_20533 ) ) )
    :subtasks
    ( ( !STACK ?auto_20533 ?auto_20532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20534 - BLOCK
      ?auto_20535 - BLOCK
      ?auto_20536 - BLOCK
    )
    :vars
    (
      ?auto_20537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20535 ) ( ON-TABLE ?auto_20534 ) ( ON ?auto_20535 ?auto_20534 ) ( not ( = ?auto_20534 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20536 ) ) ( ON ?auto_20536 ?auto_20537 ) ( CLEAR ?auto_20536 ) ( HAND-EMPTY ) ( not ( = ?auto_20534 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) ( not ( = ?auto_20536 ?auto_20537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20536 ?auto_20537 )
      ( MAKE-3PILE ?auto_20534 ?auto_20535 ?auto_20536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20538 - BLOCK
      ?auto_20539 - BLOCK
      ?auto_20540 - BLOCK
    )
    :vars
    (
      ?auto_20541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20538 ) ( not ( = ?auto_20538 ?auto_20539 ) ) ( not ( = ?auto_20538 ?auto_20540 ) ) ( not ( = ?auto_20539 ?auto_20540 ) ) ( ON ?auto_20540 ?auto_20541 ) ( CLEAR ?auto_20540 ) ( not ( = ?auto_20538 ?auto_20541 ) ) ( not ( = ?auto_20539 ?auto_20541 ) ) ( not ( = ?auto_20540 ?auto_20541 ) ) ( HOLDING ?auto_20539 ) ( CLEAR ?auto_20538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20538 ?auto_20539 )
      ( MAKE-3PILE ?auto_20538 ?auto_20539 ?auto_20540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20542 - BLOCK
      ?auto_20543 - BLOCK
      ?auto_20544 - BLOCK
    )
    :vars
    (
      ?auto_20545 - BLOCK
      ?auto_20547 - BLOCK
      ?auto_20546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20542 ) ( not ( = ?auto_20542 ?auto_20543 ) ) ( not ( = ?auto_20542 ?auto_20544 ) ) ( not ( = ?auto_20543 ?auto_20544 ) ) ( ON ?auto_20544 ?auto_20545 ) ( not ( = ?auto_20542 ?auto_20545 ) ) ( not ( = ?auto_20543 ?auto_20545 ) ) ( not ( = ?auto_20544 ?auto_20545 ) ) ( CLEAR ?auto_20542 ) ( ON ?auto_20543 ?auto_20544 ) ( CLEAR ?auto_20543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20547 ) ( ON ?auto_20546 ?auto_20547 ) ( ON ?auto_20545 ?auto_20546 ) ( not ( = ?auto_20547 ?auto_20546 ) ) ( not ( = ?auto_20547 ?auto_20545 ) ) ( not ( = ?auto_20547 ?auto_20544 ) ) ( not ( = ?auto_20547 ?auto_20543 ) ) ( not ( = ?auto_20546 ?auto_20545 ) ) ( not ( = ?auto_20546 ?auto_20544 ) ) ( not ( = ?auto_20546 ?auto_20543 ) ) ( not ( = ?auto_20542 ?auto_20547 ) ) ( not ( = ?auto_20542 ?auto_20546 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20547 ?auto_20546 ?auto_20545 ?auto_20544 )
      ( MAKE-3PILE ?auto_20542 ?auto_20543 ?auto_20544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20548 - BLOCK
      ?auto_20549 - BLOCK
      ?auto_20550 - BLOCK
    )
    :vars
    (
      ?auto_20551 - BLOCK
      ?auto_20553 - BLOCK
      ?auto_20552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20550 ) ) ( not ( = ?auto_20549 ?auto_20550 ) ) ( ON ?auto_20550 ?auto_20551 ) ( not ( = ?auto_20548 ?auto_20551 ) ) ( not ( = ?auto_20549 ?auto_20551 ) ) ( not ( = ?auto_20550 ?auto_20551 ) ) ( ON ?auto_20549 ?auto_20550 ) ( CLEAR ?auto_20549 ) ( ON-TABLE ?auto_20553 ) ( ON ?auto_20552 ?auto_20553 ) ( ON ?auto_20551 ?auto_20552 ) ( not ( = ?auto_20553 ?auto_20552 ) ) ( not ( = ?auto_20553 ?auto_20551 ) ) ( not ( = ?auto_20553 ?auto_20550 ) ) ( not ( = ?auto_20553 ?auto_20549 ) ) ( not ( = ?auto_20552 ?auto_20551 ) ) ( not ( = ?auto_20552 ?auto_20550 ) ) ( not ( = ?auto_20552 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20553 ) ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( HOLDING ?auto_20548 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20548 )
      ( MAKE-3PILE ?auto_20548 ?auto_20549 ?auto_20550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20554 - BLOCK
      ?auto_20555 - BLOCK
      ?auto_20556 - BLOCK
    )
    :vars
    (
      ?auto_20557 - BLOCK
      ?auto_20559 - BLOCK
      ?auto_20558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( ON ?auto_20556 ?auto_20557 ) ( not ( = ?auto_20554 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( ON ?auto_20555 ?auto_20556 ) ( ON-TABLE ?auto_20559 ) ( ON ?auto_20558 ?auto_20559 ) ( ON ?auto_20557 ?auto_20558 ) ( not ( = ?auto_20559 ?auto_20558 ) ) ( not ( = ?auto_20559 ?auto_20557 ) ) ( not ( = ?auto_20559 ?auto_20556 ) ) ( not ( = ?auto_20559 ?auto_20555 ) ) ( not ( = ?auto_20558 ?auto_20557 ) ) ( not ( = ?auto_20558 ?auto_20556 ) ) ( not ( = ?auto_20558 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20559 ) ) ( not ( = ?auto_20554 ?auto_20558 ) ) ( ON ?auto_20554 ?auto_20555 ) ( CLEAR ?auto_20554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20559 ?auto_20558 ?auto_20557 ?auto_20556 ?auto_20555 )
      ( MAKE-3PILE ?auto_20554 ?auto_20555 ?auto_20556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20562 - BLOCK
      ?auto_20563 - BLOCK
    )
    :vars
    (
      ?auto_20564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20564 ?auto_20563 ) ( CLEAR ?auto_20564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20562 ) ( ON ?auto_20563 ?auto_20562 ) ( not ( = ?auto_20562 ?auto_20563 ) ) ( not ( = ?auto_20562 ?auto_20564 ) ) ( not ( = ?auto_20563 ?auto_20564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20564 ?auto_20563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20565 - BLOCK
      ?auto_20566 - BLOCK
    )
    :vars
    (
      ?auto_20567 - BLOCK
      ?auto_20568 - BLOCK
      ?auto_20569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20567 ?auto_20566 ) ( CLEAR ?auto_20567 ) ( ON-TABLE ?auto_20565 ) ( ON ?auto_20566 ?auto_20565 ) ( not ( = ?auto_20565 ?auto_20566 ) ) ( not ( = ?auto_20565 ?auto_20567 ) ) ( not ( = ?auto_20566 ?auto_20567 ) ) ( HOLDING ?auto_20568 ) ( CLEAR ?auto_20569 ) ( not ( = ?auto_20565 ?auto_20568 ) ) ( not ( = ?auto_20565 ?auto_20569 ) ) ( not ( = ?auto_20566 ?auto_20568 ) ) ( not ( = ?auto_20566 ?auto_20569 ) ) ( not ( = ?auto_20567 ?auto_20568 ) ) ( not ( = ?auto_20567 ?auto_20569 ) ) ( not ( = ?auto_20568 ?auto_20569 ) ) )
    :subtasks
    ( ( !STACK ?auto_20568 ?auto_20569 )
      ( MAKE-2PILE ?auto_20565 ?auto_20566 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20570 - BLOCK
      ?auto_20571 - BLOCK
    )
    :vars
    (
      ?auto_20574 - BLOCK
      ?auto_20573 - BLOCK
      ?auto_20572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20574 ?auto_20571 ) ( ON-TABLE ?auto_20570 ) ( ON ?auto_20571 ?auto_20570 ) ( not ( = ?auto_20570 ?auto_20571 ) ) ( not ( = ?auto_20570 ?auto_20574 ) ) ( not ( = ?auto_20571 ?auto_20574 ) ) ( CLEAR ?auto_20573 ) ( not ( = ?auto_20570 ?auto_20572 ) ) ( not ( = ?auto_20570 ?auto_20573 ) ) ( not ( = ?auto_20571 ?auto_20572 ) ) ( not ( = ?auto_20571 ?auto_20573 ) ) ( not ( = ?auto_20574 ?auto_20572 ) ) ( not ( = ?auto_20574 ?auto_20573 ) ) ( not ( = ?auto_20572 ?auto_20573 ) ) ( ON ?auto_20572 ?auto_20574 ) ( CLEAR ?auto_20572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20570 ?auto_20571 ?auto_20574 )
      ( MAKE-2PILE ?auto_20570 ?auto_20571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20575 - BLOCK
      ?auto_20576 - BLOCK
    )
    :vars
    (
      ?auto_20578 - BLOCK
      ?auto_20577 - BLOCK
      ?auto_20579 - BLOCK
      ?auto_20580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20578 ?auto_20576 ) ( ON-TABLE ?auto_20575 ) ( ON ?auto_20576 ?auto_20575 ) ( not ( = ?auto_20575 ?auto_20576 ) ) ( not ( = ?auto_20575 ?auto_20578 ) ) ( not ( = ?auto_20576 ?auto_20578 ) ) ( not ( = ?auto_20575 ?auto_20577 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20576 ?auto_20579 ) ) ( not ( = ?auto_20578 ?auto_20577 ) ) ( not ( = ?auto_20578 ?auto_20579 ) ) ( not ( = ?auto_20577 ?auto_20579 ) ) ( ON ?auto_20577 ?auto_20578 ) ( CLEAR ?auto_20577 ) ( HOLDING ?auto_20579 ) ( CLEAR ?auto_20580 ) ( ON-TABLE ?auto_20580 ) ( not ( = ?auto_20580 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20580 ) ) ( not ( = ?auto_20576 ?auto_20580 ) ) ( not ( = ?auto_20578 ?auto_20580 ) ) ( not ( = ?auto_20577 ?auto_20580 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20580 ?auto_20579 )
      ( MAKE-2PILE ?auto_20575 ?auto_20576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20999 - BLOCK
      ?auto_21000 - BLOCK
    )
    :vars
    (
      ?auto_21003 - BLOCK
      ?auto_21001 - BLOCK
      ?auto_21002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21003 ?auto_21000 ) ( ON-TABLE ?auto_20999 ) ( ON ?auto_21000 ?auto_20999 ) ( not ( = ?auto_20999 ?auto_21000 ) ) ( not ( = ?auto_20999 ?auto_21003 ) ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21002 ) ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21002 ) ) ( not ( = ?auto_21003 ?auto_21001 ) ) ( not ( = ?auto_21003 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( ON ?auto_21001 ?auto_21003 ) ( ON ?auto_21002 ?auto_21001 ) ( CLEAR ?auto_21002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20999 ?auto_21000 ?auto_21003 ?auto_21001 )
      ( MAKE-2PILE ?auto_20999 ?auto_21000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20587 - BLOCK
      ?auto_20588 - BLOCK
    )
    :vars
    (
      ?auto_20591 - BLOCK
      ?auto_20589 - BLOCK
      ?auto_20590 - BLOCK
      ?auto_20592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20591 ?auto_20588 ) ( ON-TABLE ?auto_20587 ) ( ON ?auto_20588 ?auto_20587 ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( not ( = ?auto_20588 ?auto_20591 ) ) ( not ( = ?auto_20587 ?auto_20589 ) ) ( not ( = ?auto_20587 ?auto_20590 ) ) ( not ( = ?auto_20588 ?auto_20589 ) ) ( not ( = ?auto_20588 ?auto_20590 ) ) ( not ( = ?auto_20591 ?auto_20589 ) ) ( not ( = ?auto_20591 ?auto_20590 ) ) ( not ( = ?auto_20589 ?auto_20590 ) ) ( ON ?auto_20589 ?auto_20591 ) ( not ( = ?auto_20592 ?auto_20590 ) ) ( not ( = ?auto_20587 ?auto_20592 ) ) ( not ( = ?auto_20588 ?auto_20592 ) ) ( not ( = ?auto_20591 ?auto_20592 ) ) ( not ( = ?auto_20589 ?auto_20592 ) ) ( ON ?auto_20590 ?auto_20589 ) ( CLEAR ?auto_20590 ) ( HOLDING ?auto_20592 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20592 )
      ( MAKE-2PILE ?auto_20587 ?auto_20588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20593 - BLOCK
      ?auto_20594 - BLOCK
    )
    :vars
    (
      ?auto_20596 - BLOCK
      ?auto_20598 - BLOCK
      ?auto_20597 - BLOCK
      ?auto_20595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20596 ?auto_20594 ) ( ON-TABLE ?auto_20593 ) ( ON ?auto_20594 ?auto_20593 ) ( not ( = ?auto_20593 ?auto_20594 ) ) ( not ( = ?auto_20593 ?auto_20596 ) ) ( not ( = ?auto_20594 ?auto_20596 ) ) ( not ( = ?auto_20593 ?auto_20598 ) ) ( not ( = ?auto_20593 ?auto_20597 ) ) ( not ( = ?auto_20594 ?auto_20598 ) ) ( not ( = ?auto_20594 ?auto_20597 ) ) ( not ( = ?auto_20596 ?auto_20598 ) ) ( not ( = ?auto_20596 ?auto_20597 ) ) ( not ( = ?auto_20598 ?auto_20597 ) ) ( ON ?auto_20598 ?auto_20596 ) ( not ( = ?auto_20595 ?auto_20597 ) ) ( not ( = ?auto_20593 ?auto_20595 ) ) ( not ( = ?auto_20594 ?auto_20595 ) ) ( not ( = ?auto_20596 ?auto_20595 ) ) ( not ( = ?auto_20598 ?auto_20595 ) ) ( ON ?auto_20597 ?auto_20598 ) ( ON ?auto_20595 ?auto_20597 ) ( CLEAR ?auto_20595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20593 ?auto_20594 ?auto_20596 ?auto_20598 ?auto_20597 )
      ( MAKE-2PILE ?auto_20593 ?auto_20594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20603 - BLOCK
      ?auto_20604 - BLOCK
      ?auto_20605 - BLOCK
      ?auto_20606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20606 ) ( CLEAR ?auto_20605 ) ( ON-TABLE ?auto_20603 ) ( ON ?auto_20604 ?auto_20603 ) ( ON ?auto_20605 ?auto_20604 ) ( not ( = ?auto_20603 ?auto_20604 ) ) ( not ( = ?auto_20603 ?auto_20605 ) ) ( not ( = ?auto_20603 ?auto_20606 ) ) ( not ( = ?auto_20604 ?auto_20605 ) ) ( not ( = ?auto_20604 ?auto_20606 ) ) ( not ( = ?auto_20605 ?auto_20606 ) ) )
    :subtasks
    ( ( !STACK ?auto_20606 ?auto_20605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20607 - BLOCK
      ?auto_20608 - BLOCK
      ?auto_20609 - BLOCK
      ?auto_20610 - BLOCK
    )
    :vars
    (
      ?auto_20611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20609 ) ( ON-TABLE ?auto_20607 ) ( ON ?auto_20608 ?auto_20607 ) ( ON ?auto_20609 ?auto_20608 ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( not ( = ?auto_20607 ?auto_20609 ) ) ( not ( = ?auto_20607 ?auto_20610 ) ) ( not ( = ?auto_20608 ?auto_20609 ) ) ( not ( = ?auto_20608 ?auto_20610 ) ) ( not ( = ?auto_20609 ?auto_20610 ) ) ( ON ?auto_20610 ?auto_20611 ) ( CLEAR ?auto_20610 ) ( HAND-EMPTY ) ( not ( = ?auto_20607 ?auto_20611 ) ) ( not ( = ?auto_20608 ?auto_20611 ) ) ( not ( = ?auto_20609 ?auto_20611 ) ) ( not ( = ?auto_20610 ?auto_20611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20610 ?auto_20611 )
      ( MAKE-4PILE ?auto_20607 ?auto_20608 ?auto_20609 ?auto_20610 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20612 - BLOCK
      ?auto_20613 - BLOCK
      ?auto_20614 - BLOCK
      ?auto_20615 - BLOCK
    )
    :vars
    (
      ?auto_20616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20612 ) ( ON ?auto_20613 ?auto_20612 ) ( not ( = ?auto_20612 ?auto_20613 ) ) ( not ( = ?auto_20612 ?auto_20614 ) ) ( not ( = ?auto_20612 ?auto_20615 ) ) ( not ( = ?auto_20613 ?auto_20614 ) ) ( not ( = ?auto_20613 ?auto_20615 ) ) ( not ( = ?auto_20614 ?auto_20615 ) ) ( ON ?auto_20615 ?auto_20616 ) ( CLEAR ?auto_20615 ) ( not ( = ?auto_20612 ?auto_20616 ) ) ( not ( = ?auto_20613 ?auto_20616 ) ) ( not ( = ?auto_20614 ?auto_20616 ) ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( HOLDING ?auto_20614 ) ( CLEAR ?auto_20613 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20612 ?auto_20613 ?auto_20614 )
      ( MAKE-4PILE ?auto_20612 ?auto_20613 ?auto_20614 ?auto_20615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20617 - BLOCK
      ?auto_20618 - BLOCK
      ?auto_20619 - BLOCK
      ?auto_20620 - BLOCK
    )
    :vars
    (
      ?auto_20621 - BLOCK
      ?auto_20622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20617 ) ( ON ?auto_20618 ?auto_20617 ) ( not ( = ?auto_20617 ?auto_20618 ) ) ( not ( = ?auto_20617 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( ON ?auto_20620 ?auto_20621 ) ( not ( = ?auto_20617 ?auto_20621 ) ) ( not ( = ?auto_20618 ?auto_20621 ) ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( not ( = ?auto_20620 ?auto_20621 ) ) ( CLEAR ?auto_20618 ) ( ON ?auto_20619 ?auto_20620 ) ( CLEAR ?auto_20619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20622 ) ( ON ?auto_20621 ?auto_20622 ) ( not ( = ?auto_20622 ?auto_20621 ) ) ( not ( = ?auto_20622 ?auto_20620 ) ) ( not ( = ?auto_20622 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20618 ?auto_20622 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20622 ?auto_20621 ?auto_20620 )
      ( MAKE-4PILE ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20623 - BLOCK
      ?auto_20624 - BLOCK
      ?auto_20625 - BLOCK
      ?auto_20626 - BLOCK
    )
    :vars
    (
      ?auto_20628 - BLOCK
      ?auto_20627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20623 ) ( not ( = ?auto_20623 ?auto_20624 ) ) ( not ( = ?auto_20623 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20626 ) ) ( not ( = ?auto_20624 ?auto_20625 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( ON ?auto_20626 ?auto_20628 ) ( not ( = ?auto_20623 ?auto_20628 ) ) ( not ( = ?auto_20624 ?auto_20628 ) ) ( not ( = ?auto_20625 ?auto_20628 ) ) ( not ( = ?auto_20626 ?auto_20628 ) ) ( ON ?auto_20625 ?auto_20626 ) ( CLEAR ?auto_20625 ) ( ON-TABLE ?auto_20627 ) ( ON ?auto_20628 ?auto_20627 ) ( not ( = ?auto_20627 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20626 ) ) ( not ( = ?auto_20627 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20627 ) ) ( not ( = ?auto_20624 ?auto_20627 ) ) ( HOLDING ?auto_20624 ) ( CLEAR ?auto_20623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20623 ?auto_20624 )
      ( MAKE-4PILE ?auto_20623 ?auto_20624 ?auto_20625 ?auto_20626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20629 - BLOCK
      ?auto_20630 - BLOCK
      ?auto_20631 - BLOCK
      ?auto_20632 - BLOCK
    )
    :vars
    (
      ?auto_20634 - BLOCK
      ?auto_20633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20629 ) ( not ( = ?auto_20629 ?auto_20630 ) ) ( not ( = ?auto_20629 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20632 ) ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20630 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( ON ?auto_20632 ?auto_20634 ) ( not ( = ?auto_20629 ?auto_20634 ) ) ( not ( = ?auto_20630 ?auto_20634 ) ) ( not ( = ?auto_20631 ?auto_20634 ) ) ( not ( = ?auto_20632 ?auto_20634 ) ) ( ON ?auto_20631 ?auto_20632 ) ( ON-TABLE ?auto_20633 ) ( ON ?auto_20634 ?auto_20633 ) ( not ( = ?auto_20633 ?auto_20634 ) ) ( not ( = ?auto_20633 ?auto_20632 ) ) ( not ( = ?auto_20633 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20633 ) ) ( not ( = ?auto_20630 ?auto_20633 ) ) ( CLEAR ?auto_20629 ) ( ON ?auto_20630 ?auto_20631 ) ( CLEAR ?auto_20630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20633 ?auto_20634 ?auto_20632 ?auto_20631 )
      ( MAKE-4PILE ?auto_20629 ?auto_20630 ?auto_20631 ?auto_20632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20635 - BLOCK
      ?auto_20636 - BLOCK
      ?auto_20637 - BLOCK
      ?auto_20638 - BLOCK
    )
    :vars
    (
      ?auto_20639 - BLOCK
      ?auto_20640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20635 ?auto_20636 ) ) ( not ( = ?auto_20635 ?auto_20637 ) ) ( not ( = ?auto_20635 ?auto_20638 ) ) ( not ( = ?auto_20636 ?auto_20637 ) ) ( not ( = ?auto_20636 ?auto_20638 ) ) ( not ( = ?auto_20637 ?auto_20638 ) ) ( ON ?auto_20638 ?auto_20639 ) ( not ( = ?auto_20635 ?auto_20639 ) ) ( not ( = ?auto_20636 ?auto_20639 ) ) ( not ( = ?auto_20637 ?auto_20639 ) ) ( not ( = ?auto_20638 ?auto_20639 ) ) ( ON ?auto_20637 ?auto_20638 ) ( ON-TABLE ?auto_20640 ) ( ON ?auto_20639 ?auto_20640 ) ( not ( = ?auto_20640 ?auto_20639 ) ) ( not ( = ?auto_20640 ?auto_20638 ) ) ( not ( = ?auto_20640 ?auto_20637 ) ) ( not ( = ?auto_20635 ?auto_20640 ) ) ( not ( = ?auto_20636 ?auto_20640 ) ) ( ON ?auto_20636 ?auto_20637 ) ( CLEAR ?auto_20636 ) ( HOLDING ?auto_20635 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20635 )
      ( MAKE-4PILE ?auto_20635 ?auto_20636 ?auto_20637 ?auto_20638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20641 - BLOCK
      ?auto_20642 - BLOCK
      ?auto_20643 - BLOCK
      ?auto_20644 - BLOCK
    )
    :vars
    (
      ?auto_20646 - BLOCK
      ?auto_20645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20641 ?auto_20642 ) ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20644 ) ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( ON ?auto_20644 ?auto_20646 ) ( not ( = ?auto_20641 ?auto_20646 ) ) ( not ( = ?auto_20642 ?auto_20646 ) ) ( not ( = ?auto_20643 ?auto_20646 ) ) ( not ( = ?auto_20644 ?auto_20646 ) ) ( ON ?auto_20643 ?auto_20644 ) ( ON-TABLE ?auto_20645 ) ( ON ?auto_20646 ?auto_20645 ) ( not ( = ?auto_20645 ?auto_20646 ) ) ( not ( = ?auto_20645 ?auto_20644 ) ) ( not ( = ?auto_20645 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( not ( = ?auto_20642 ?auto_20645 ) ) ( ON ?auto_20642 ?auto_20643 ) ( ON ?auto_20641 ?auto_20642 ) ( CLEAR ?auto_20641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20645 ?auto_20646 ?auto_20644 ?auto_20643 ?auto_20642 )
      ( MAKE-4PILE ?auto_20641 ?auto_20642 ?auto_20643 ?auto_20644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20648 - BLOCK
    )
    :vars
    (
      ?auto_20649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20649 ?auto_20648 ) ( CLEAR ?auto_20649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20648 ) ( not ( = ?auto_20648 ?auto_20649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20649 ?auto_20648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20650 - BLOCK
    )
    :vars
    (
      ?auto_20651 - BLOCK
      ?auto_20652 - BLOCK
      ?auto_20653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20651 ?auto_20650 ) ( CLEAR ?auto_20651 ) ( ON-TABLE ?auto_20650 ) ( not ( = ?auto_20650 ?auto_20651 ) ) ( HOLDING ?auto_20652 ) ( CLEAR ?auto_20653 ) ( not ( = ?auto_20650 ?auto_20652 ) ) ( not ( = ?auto_20650 ?auto_20653 ) ) ( not ( = ?auto_20651 ?auto_20652 ) ) ( not ( = ?auto_20651 ?auto_20653 ) ) ( not ( = ?auto_20652 ?auto_20653 ) ) )
    :subtasks
    ( ( !STACK ?auto_20652 ?auto_20653 )
      ( MAKE-1PILE ?auto_20650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20654 - BLOCK
    )
    :vars
    (
      ?auto_20655 - BLOCK
      ?auto_20657 - BLOCK
      ?auto_20656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20655 ?auto_20654 ) ( ON-TABLE ?auto_20654 ) ( not ( = ?auto_20654 ?auto_20655 ) ) ( CLEAR ?auto_20657 ) ( not ( = ?auto_20654 ?auto_20656 ) ) ( not ( = ?auto_20654 ?auto_20657 ) ) ( not ( = ?auto_20655 ?auto_20656 ) ) ( not ( = ?auto_20655 ?auto_20657 ) ) ( not ( = ?auto_20656 ?auto_20657 ) ) ( ON ?auto_20656 ?auto_20655 ) ( CLEAR ?auto_20656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20654 ?auto_20655 )
      ( MAKE-1PILE ?auto_20654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20658 - BLOCK
    )
    :vars
    (
      ?auto_20660 - BLOCK
      ?auto_20661 - BLOCK
      ?auto_20659 - BLOCK
      ?auto_20662 - BLOCK
      ?auto_20663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20660 ?auto_20658 ) ( ON-TABLE ?auto_20658 ) ( not ( = ?auto_20658 ?auto_20660 ) ) ( not ( = ?auto_20658 ?auto_20661 ) ) ( not ( = ?auto_20658 ?auto_20659 ) ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20659 ) ) ( not ( = ?auto_20661 ?auto_20659 ) ) ( ON ?auto_20661 ?auto_20660 ) ( CLEAR ?auto_20661 ) ( HOLDING ?auto_20659 ) ( CLEAR ?auto_20662 ) ( ON-TABLE ?auto_20663 ) ( ON ?auto_20662 ?auto_20663 ) ( not ( = ?auto_20663 ?auto_20662 ) ) ( not ( = ?auto_20663 ?auto_20659 ) ) ( not ( = ?auto_20662 ?auto_20659 ) ) ( not ( = ?auto_20658 ?auto_20662 ) ) ( not ( = ?auto_20658 ?auto_20663 ) ) ( not ( = ?auto_20660 ?auto_20662 ) ) ( not ( = ?auto_20660 ?auto_20663 ) ) ( not ( = ?auto_20661 ?auto_20662 ) ) ( not ( = ?auto_20661 ?auto_20663 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20663 ?auto_20662 ?auto_20659 )
      ( MAKE-1PILE ?auto_20658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20664 - BLOCK
    )
    :vars
    (
      ?auto_20665 - BLOCK
      ?auto_20668 - BLOCK
      ?auto_20666 - BLOCK
      ?auto_20667 - BLOCK
      ?auto_20669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20665 ?auto_20664 ) ( ON-TABLE ?auto_20664 ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( not ( = ?auto_20664 ?auto_20668 ) ) ( not ( = ?auto_20664 ?auto_20666 ) ) ( not ( = ?auto_20665 ?auto_20668 ) ) ( not ( = ?auto_20665 ?auto_20666 ) ) ( not ( = ?auto_20668 ?auto_20666 ) ) ( ON ?auto_20668 ?auto_20665 ) ( CLEAR ?auto_20667 ) ( ON-TABLE ?auto_20669 ) ( ON ?auto_20667 ?auto_20669 ) ( not ( = ?auto_20669 ?auto_20667 ) ) ( not ( = ?auto_20669 ?auto_20666 ) ) ( not ( = ?auto_20667 ?auto_20666 ) ) ( not ( = ?auto_20664 ?auto_20667 ) ) ( not ( = ?auto_20664 ?auto_20669 ) ) ( not ( = ?auto_20665 ?auto_20667 ) ) ( not ( = ?auto_20665 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20667 ) ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( ON ?auto_20666 ?auto_20668 ) ( CLEAR ?auto_20666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20664 ?auto_20665 ?auto_20668 )
      ( MAKE-1PILE ?auto_20664 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20670 - BLOCK
    )
    :vars
    (
      ?auto_20671 - BLOCK
      ?auto_20672 - BLOCK
      ?auto_20675 - BLOCK
      ?auto_20674 - BLOCK
      ?auto_20673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20671 ?auto_20670 ) ( ON-TABLE ?auto_20670 ) ( not ( = ?auto_20670 ?auto_20671 ) ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( not ( = ?auto_20670 ?auto_20675 ) ) ( not ( = ?auto_20671 ?auto_20672 ) ) ( not ( = ?auto_20671 ?auto_20675 ) ) ( not ( = ?auto_20672 ?auto_20675 ) ) ( ON ?auto_20672 ?auto_20671 ) ( ON-TABLE ?auto_20674 ) ( not ( = ?auto_20674 ?auto_20673 ) ) ( not ( = ?auto_20674 ?auto_20675 ) ) ( not ( = ?auto_20673 ?auto_20675 ) ) ( not ( = ?auto_20670 ?auto_20673 ) ) ( not ( = ?auto_20670 ?auto_20674 ) ) ( not ( = ?auto_20671 ?auto_20673 ) ) ( not ( = ?auto_20671 ?auto_20674 ) ) ( not ( = ?auto_20672 ?auto_20673 ) ) ( not ( = ?auto_20672 ?auto_20674 ) ) ( ON ?auto_20675 ?auto_20672 ) ( CLEAR ?auto_20675 ) ( HOLDING ?auto_20673 ) ( CLEAR ?auto_20674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20674 ?auto_20673 )
      ( MAKE-1PILE ?auto_20670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21139 - BLOCK
    )
    :vars
    (
      ?auto_21141 - BLOCK
      ?auto_21140 - BLOCK
      ?auto_21142 - BLOCK
      ?auto_21143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21141 ?auto_21139 ) ( ON-TABLE ?auto_21139 ) ( not ( = ?auto_21139 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21140 ) ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( ON ?auto_21140 ?auto_21141 ) ( not ( = ?auto_21143 ?auto_21142 ) ) ( not ( = ?auto_21139 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21140 ?auto_21143 ) ) ( ON ?auto_21142 ?auto_21140 ) ( ON ?auto_21143 ?auto_21142 ) ( CLEAR ?auto_21143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21139 ?auto_21141 ?auto_21140 ?auto_21142 )
      ( MAKE-1PILE ?auto_21139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20682 - BLOCK
    )
    :vars
    (
      ?auto_20686 - BLOCK
      ?auto_20685 - BLOCK
      ?auto_20684 - BLOCK
      ?auto_20683 - BLOCK
      ?auto_20687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20686 ?auto_20682 ) ( ON-TABLE ?auto_20682 ) ( not ( = ?auto_20682 ?auto_20686 ) ) ( not ( = ?auto_20682 ?auto_20685 ) ) ( not ( = ?auto_20682 ?auto_20684 ) ) ( not ( = ?auto_20686 ?auto_20685 ) ) ( not ( = ?auto_20686 ?auto_20684 ) ) ( not ( = ?auto_20685 ?auto_20684 ) ) ( ON ?auto_20685 ?auto_20686 ) ( not ( = ?auto_20683 ?auto_20687 ) ) ( not ( = ?auto_20683 ?auto_20684 ) ) ( not ( = ?auto_20687 ?auto_20684 ) ) ( not ( = ?auto_20682 ?auto_20687 ) ) ( not ( = ?auto_20682 ?auto_20683 ) ) ( not ( = ?auto_20686 ?auto_20687 ) ) ( not ( = ?auto_20686 ?auto_20683 ) ) ( not ( = ?auto_20685 ?auto_20687 ) ) ( not ( = ?auto_20685 ?auto_20683 ) ) ( ON ?auto_20684 ?auto_20685 ) ( ON ?auto_20687 ?auto_20684 ) ( CLEAR ?auto_20687 ) ( HOLDING ?auto_20683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20683 )
      ( MAKE-1PILE ?auto_20682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20688 - BLOCK
    )
    :vars
    (
      ?auto_20690 - BLOCK
      ?auto_20693 - BLOCK
      ?auto_20692 - BLOCK
      ?auto_20691 - BLOCK
      ?auto_20689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20690 ?auto_20688 ) ( ON-TABLE ?auto_20688 ) ( not ( = ?auto_20688 ?auto_20690 ) ) ( not ( = ?auto_20688 ?auto_20693 ) ) ( not ( = ?auto_20688 ?auto_20692 ) ) ( not ( = ?auto_20690 ?auto_20693 ) ) ( not ( = ?auto_20690 ?auto_20692 ) ) ( not ( = ?auto_20693 ?auto_20692 ) ) ( ON ?auto_20693 ?auto_20690 ) ( not ( = ?auto_20691 ?auto_20689 ) ) ( not ( = ?auto_20691 ?auto_20692 ) ) ( not ( = ?auto_20689 ?auto_20692 ) ) ( not ( = ?auto_20688 ?auto_20689 ) ) ( not ( = ?auto_20688 ?auto_20691 ) ) ( not ( = ?auto_20690 ?auto_20689 ) ) ( not ( = ?auto_20690 ?auto_20691 ) ) ( not ( = ?auto_20693 ?auto_20689 ) ) ( not ( = ?auto_20693 ?auto_20691 ) ) ( ON ?auto_20692 ?auto_20693 ) ( ON ?auto_20689 ?auto_20692 ) ( ON ?auto_20691 ?auto_20689 ) ( CLEAR ?auto_20691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20688 ?auto_20690 ?auto_20693 ?auto_20692 ?auto_20689 )
      ( MAKE-1PILE ?auto_20688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20699 - BLOCK
      ?auto_20700 - BLOCK
      ?auto_20701 - BLOCK
      ?auto_20702 - BLOCK
      ?auto_20703 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20703 ) ( CLEAR ?auto_20702 ) ( ON-TABLE ?auto_20699 ) ( ON ?auto_20700 ?auto_20699 ) ( ON ?auto_20701 ?auto_20700 ) ( ON ?auto_20702 ?auto_20701 ) ( not ( = ?auto_20699 ?auto_20700 ) ) ( not ( = ?auto_20699 ?auto_20701 ) ) ( not ( = ?auto_20699 ?auto_20702 ) ) ( not ( = ?auto_20699 ?auto_20703 ) ) ( not ( = ?auto_20700 ?auto_20701 ) ) ( not ( = ?auto_20700 ?auto_20702 ) ) ( not ( = ?auto_20700 ?auto_20703 ) ) ( not ( = ?auto_20701 ?auto_20702 ) ) ( not ( = ?auto_20701 ?auto_20703 ) ) ( not ( = ?auto_20702 ?auto_20703 ) ) )
    :subtasks
    ( ( !STACK ?auto_20703 ?auto_20702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20704 - BLOCK
      ?auto_20705 - BLOCK
      ?auto_20706 - BLOCK
      ?auto_20707 - BLOCK
      ?auto_20708 - BLOCK
    )
    :vars
    (
      ?auto_20709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20707 ) ( ON-TABLE ?auto_20704 ) ( ON ?auto_20705 ?auto_20704 ) ( ON ?auto_20706 ?auto_20705 ) ( ON ?auto_20707 ?auto_20706 ) ( not ( = ?auto_20704 ?auto_20705 ) ) ( not ( = ?auto_20704 ?auto_20706 ) ) ( not ( = ?auto_20704 ?auto_20707 ) ) ( not ( = ?auto_20704 ?auto_20708 ) ) ( not ( = ?auto_20705 ?auto_20706 ) ) ( not ( = ?auto_20705 ?auto_20707 ) ) ( not ( = ?auto_20705 ?auto_20708 ) ) ( not ( = ?auto_20706 ?auto_20707 ) ) ( not ( = ?auto_20706 ?auto_20708 ) ) ( not ( = ?auto_20707 ?auto_20708 ) ) ( ON ?auto_20708 ?auto_20709 ) ( CLEAR ?auto_20708 ) ( HAND-EMPTY ) ( not ( = ?auto_20704 ?auto_20709 ) ) ( not ( = ?auto_20705 ?auto_20709 ) ) ( not ( = ?auto_20706 ?auto_20709 ) ) ( not ( = ?auto_20707 ?auto_20709 ) ) ( not ( = ?auto_20708 ?auto_20709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20708 ?auto_20709 )
      ( MAKE-5PILE ?auto_20704 ?auto_20705 ?auto_20706 ?auto_20707 ?auto_20708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20710 - BLOCK
      ?auto_20711 - BLOCK
      ?auto_20712 - BLOCK
      ?auto_20713 - BLOCK
      ?auto_20714 - BLOCK
    )
    :vars
    (
      ?auto_20715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20710 ) ( ON ?auto_20711 ?auto_20710 ) ( ON ?auto_20712 ?auto_20711 ) ( not ( = ?auto_20710 ?auto_20711 ) ) ( not ( = ?auto_20710 ?auto_20712 ) ) ( not ( = ?auto_20710 ?auto_20713 ) ) ( not ( = ?auto_20710 ?auto_20714 ) ) ( not ( = ?auto_20711 ?auto_20712 ) ) ( not ( = ?auto_20711 ?auto_20713 ) ) ( not ( = ?auto_20711 ?auto_20714 ) ) ( not ( = ?auto_20712 ?auto_20713 ) ) ( not ( = ?auto_20712 ?auto_20714 ) ) ( not ( = ?auto_20713 ?auto_20714 ) ) ( ON ?auto_20714 ?auto_20715 ) ( CLEAR ?auto_20714 ) ( not ( = ?auto_20710 ?auto_20715 ) ) ( not ( = ?auto_20711 ?auto_20715 ) ) ( not ( = ?auto_20712 ?auto_20715 ) ) ( not ( = ?auto_20713 ?auto_20715 ) ) ( not ( = ?auto_20714 ?auto_20715 ) ) ( HOLDING ?auto_20713 ) ( CLEAR ?auto_20712 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20710 ?auto_20711 ?auto_20712 ?auto_20713 )
      ( MAKE-5PILE ?auto_20710 ?auto_20711 ?auto_20712 ?auto_20713 ?auto_20714 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20716 - BLOCK
      ?auto_20717 - BLOCK
      ?auto_20718 - BLOCK
      ?auto_20719 - BLOCK
      ?auto_20720 - BLOCK
    )
    :vars
    (
      ?auto_20721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20716 ) ( ON ?auto_20717 ?auto_20716 ) ( ON ?auto_20718 ?auto_20717 ) ( not ( = ?auto_20716 ?auto_20717 ) ) ( not ( = ?auto_20716 ?auto_20718 ) ) ( not ( = ?auto_20716 ?auto_20719 ) ) ( not ( = ?auto_20716 ?auto_20720 ) ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20719 ) ) ( not ( = ?auto_20717 ?auto_20720 ) ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( not ( = ?auto_20718 ?auto_20720 ) ) ( not ( = ?auto_20719 ?auto_20720 ) ) ( ON ?auto_20720 ?auto_20721 ) ( not ( = ?auto_20716 ?auto_20721 ) ) ( not ( = ?auto_20717 ?auto_20721 ) ) ( not ( = ?auto_20718 ?auto_20721 ) ) ( not ( = ?auto_20719 ?auto_20721 ) ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( CLEAR ?auto_20718 ) ( ON ?auto_20719 ?auto_20720 ) ( CLEAR ?auto_20719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20721 ?auto_20720 )
      ( MAKE-5PILE ?auto_20716 ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20722 - BLOCK
      ?auto_20723 - BLOCK
      ?auto_20724 - BLOCK
      ?auto_20725 - BLOCK
      ?auto_20726 - BLOCK
    )
    :vars
    (
      ?auto_20727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20722 ) ( ON ?auto_20723 ?auto_20722 ) ( not ( = ?auto_20722 ?auto_20723 ) ) ( not ( = ?auto_20722 ?auto_20724 ) ) ( not ( = ?auto_20722 ?auto_20725 ) ) ( not ( = ?auto_20722 ?auto_20726 ) ) ( not ( = ?auto_20723 ?auto_20724 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20726 ) ) ( not ( = ?auto_20724 ?auto_20725 ) ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( not ( = ?auto_20725 ?auto_20726 ) ) ( ON ?auto_20726 ?auto_20727 ) ( not ( = ?auto_20722 ?auto_20727 ) ) ( not ( = ?auto_20723 ?auto_20727 ) ) ( not ( = ?auto_20724 ?auto_20727 ) ) ( not ( = ?auto_20725 ?auto_20727 ) ) ( not ( = ?auto_20726 ?auto_20727 ) ) ( ON ?auto_20725 ?auto_20726 ) ( CLEAR ?auto_20725 ) ( ON-TABLE ?auto_20727 ) ( HOLDING ?auto_20724 ) ( CLEAR ?auto_20723 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20722 ?auto_20723 ?auto_20724 )
      ( MAKE-5PILE ?auto_20722 ?auto_20723 ?auto_20724 ?auto_20725 ?auto_20726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20728 - BLOCK
      ?auto_20729 - BLOCK
      ?auto_20730 - BLOCK
      ?auto_20731 - BLOCK
      ?auto_20732 - BLOCK
    )
    :vars
    (
      ?auto_20733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20728 ) ( ON ?auto_20729 ?auto_20728 ) ( not ( = ?auto_20728 ?auto_20729 ) ) ( not ( = ?auto_20728 ?auto_20730 ) ) ( not ( = ?auto_20728 ?auto_20731 ) ) ( not ( = ?auto_20728 ?auto_20732 ) ) ( not ( = ?auto_20729 ?auto_20730 ) ) ( not ( = ?auto_20729 ?auto_20731 ) ) ( not ( = ?auto_20729 ?auto_20732 ) ) ( not ( = ?auto_20730 ?auto_20731 ) ) ( not ( = ?auto_20730 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( ON ?auto_20732 ?auto_20733 ) ( not ( = ?auto_20728 ?auto_20733 ) ) ( not ( = ?auto_20729 ?auto_20733 ) ) ( not ( = ?auto_20730 ?auto_20733 ) ) ( not ( = ?auto_20731 ?auto_20733 ) ) ( not ( = ?auto_20732 ?auto_20733 ) ) ( ON ?auto_20731 ?auto_20732 ) ( ON-TABLE ?auto_20733 ) ( CLEAR ?auto_20729 ) ( ON ?auto_20730 ?auto_20731 ) ( CLEAR ?auto_20730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20733 ?auto_20732 ?auto_20731 )
      ( MAKE-5PILE ?auto_20728 ?auto_20729 ?auto_20730 ?auto_20731 ?auto_20732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20734 - BLOCK
      ?auto_20735 - BLOCK
      ?auto_20736 - BLOCK
      ?auto_20737 - BLOCK
      ?auto_20738 - BLOCK
    )
    :vars
    (
      ?auto_20739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20734 ) ( not ( = ?auto_20734 ?auto_20735 ) ) ( not ( = ?auto_20734 ?auto_20736 ) ) ( not ( = ?auto_20734 ?auto_20737 ) ) ( not ( = ?auto_20734 ?auto_20738 ) ) ( not ( = ?auto_20735 ?auto_20736 ) ) ( not ( = ?auto_20735 ?auto_20737 ) ) ( not ( = ?auto_20735 ?auto_20738 ) ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( not ( = ?auto_20736 ?auto_20738 ) ) ( not ( = ?auto_20737 ?auto_20738 ) ) ( ON ?auto_20738 ?auto_20739 ) ( not ( = ?auto_20734 ?auto_20739 ) ) ( not ( = ?auto_20735 ?auto_20739 ) ) ( not ( = ?auto_20736 ?auto_20739 ) ) ( not ( = ?auto_20737 ?auto_20739 ) ) ( not ( = ?auto_20738 ?auto_20739 ) ) ( ON ?auto_20737 ?auto_20738 ) ( ON-TABLE ?auto_20739 ) ( ON ?auto_20736 ?auto_20737 ) ( CLEAR ?auto_20736 ) ( HOLDING ?auto_20735 ) ( CLEAR ?auto_20734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20734 ?auto_20735 )
      ( MAKE-5PILE ?auto_20734 ?auto_20735 ?auto_20736 ?auto_20737 ?auto_20738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20740 - BLOCK
      ?auto_20741 - BLOCK
      ?auto_20742 - BLOCK
      ?auto_20743 - BLOCK
      ?auto_20744 - BLOCK
    )
    :vars
    (
      ?auto_20745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20740 ) ( not ( = ?auto_20740 ?auto_20741 ) ) ( not ( = ?auto_20740 ?auto_20742 ) ) ( not ( = ?auto_20740 ?auto_20743 ) ) ( not ( = ?auto_20740 ?auto_20744 ) ) ( not ( = ?auto_20741 ?auto_20742 ) ) ( not ( = ?auto_20741 ?auto_20743 ) ) ( not ( = ?auto_20741 ?auto_20744 ) ) ( not ( = ?auto_20742 ?auto_20743 ) ) ( not ( = ?auto_20742 ?auto_20744 ) ) ( not ( = ?auto_20743 ?auto_20744 ) ) ( ON ?auto_20744 ?auto_20745 ) ( not ( = ?auto_20740 ?auto_20745 ) ) ( not ( = ?auto_20741 ?auto_20745 ) ) ( not ( = ?auto_20742 ?auto_20745 ) ) ( not ( = ?auto_20743 ?auto_20745 ) ) ( not ( = ?auto_20744 ?auto_20745 ) ) ( ON ?auto_20743 ?auto_20744 ) ( ON-TABLE ?auto_20745 ) ( ON ?auto_20742 ?auto_20743 ) ( CLEAR ?auto_20740 ) ( ON ?auto_20741 ?auto_20742 ) ( CLEAR ?auto_20741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20745 ?auto_20744 ?auto_20743 ?auto_20742 )
      ( MAKE-5PILE ?auto_20740 ?auto_20741 ?auto_20742 ?auto_20743 ?auto_20744 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20746 - BLOCK
      ?auto_20747 - BLOCK
      ?auto_20748 - BLOCK
      ?auto_20749 - BLOCK
      ?auto_20750 - BLOCK
    )
    :vars
    (
      ?auto_20751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20746 ?auto_20747 ) ) ( not ( = ?auto_20746 ?auto_20748 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20746 ?auto_20750 ) ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20749 ) ) ( not ( = ?auto_20747 ?auto_20750 ) ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( ON ?auto_20750 ?auto_20751 ) ( not ( = ?auto_20746 ?auto_20751 ) ) ( not ( = ?auto_20747 ?auto_20751 ) ) ( not ( = ?auto_20748 ?auto_20751 ) ) ( not ( = ?auto_20749 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20751 ) ) ( ON ?auto_20749 ?auto_20750 ) ( ON-TABLE ?auto_20751 ) ( ON ?auto_20748 ?auto_20749 ) ( ON ?auto_20747 ?auto_20748 ) ( CLEAR ?auto_20747 ) ( HOLDING ?auto_20746 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20746 )
      ( MAKE-5PILE ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20752 - BLOCK
      ?auto_20753 - BLOCK
      ?auto_20754 - BLOCK
      ?auto_20755 - BLOCK
      ?auto_20756 - BLOCK
    )
    :vars
    (
      ?auto_20757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20752 ?auto_20753 ) ) ( not ( = ?auto_20752 ?auto_20754 ) ) ( not ( = ?auto_20752 ?auto_20755 ) ) ( not ( = ?auto_20752 ?auto_20756 ) ) ( not ( = ?auto_20753 ?auto_20754 ) ) ( not ( = ?auto_20753 ?auto_20755 ) ) ( not ( = ?auto_20753 ?auto_20756 ) ) ( not ( = ?auto_20754 ?auto_20755 ) ) ( not ( = ?auto_20754 ?auto_20756 ) ) ( not ( = ?auto_20755 ?auto_20756 ) ) ( ON ?auto_20756 ?auto_20757 ) ( not ( = ?auto_20752 ?auto_20757 ) ) ( not ( = ?auto_20753 ?auto_20757 ) ) ( not ( = ?auto_20754 ?auto_20757 ) ) ( not ( = ?auto_20755 ?auto_20757 ) ) ( not ( = ?auto_20756 ?auto_20757 ) ) ( ON ?auto_20755 ?auto_20756 ) ( ON-TABLE ?auto_20757 ) ( ON ?auto_20754 ?auto_20755 ) ( ON ?auto_20753 ?auto_20754 ) ( ON ?auto_20752 ?auto_20753 ) ( CLEAR ?auto_20752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20757 ?auto_20756 ?auto_20755 ?auto_20754 ?auto_20753 )
      ( MAKE-5PILE ?auto_20752 ?auto_20753 ?auto_20754 ?auto_20755 ?auto_20756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20816 - BLOCK
    )
    :vars
    (
      ?auto_20817 - BLOCK
      ?auto_20818 - BLOCK
      ?auto_20819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20816 ?auto_20817 ) ( CLEAR ?auto_20816 ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( HOLDING ?auto_20818 ) ( CLEAR ?auto_20819 ) ( not ( = ?auto_20816 ?auto_20818 ) ) ( not ( = ?auto_20816 ?auto_20819 ) ) ( not ( = ?auto_20817 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20819 ) ) )
    :subtasks
    ( ( !STACK ?auto_20818 ?auto_20819 )
      ( MAKE-1PILE ?auto_20816 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20820 - BLOCK
    )
    :vars
    (
      ?auto_20823 - BLOCK
      ?auto_20821 - BLOCK
      ?auto_20822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20820 ?auto_20823 ) ( not ( = ?auto_20820 ?auto_20823 ) ) ( CLEAR ?auto_20821 ) ( not ( = ?auto_20820 ?auto_20822 ) ) ( not ( = ?auto_20820 ?auto_20821 ) ) ( not ( = ?auto_20823 ?auto_20822 ) ) ( not ( = ?auto_20823 ?auto_20821 ) ) ( not ( = ?auto_20822 ?auto_20821 ) ) ( ON ?auto_20822 ?auto_20820 ) ( CLEAR ?auto_20822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20823 ?auto_20820 )
      ( MAKE-1PILE ?auto_20820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20824 - BLOCK
    )
    :vars
    (
      ?auto_20827 - BLOCK
      ?auto_20825 - BLOCK
      ?auto_20826 - BLOCK
      ?auto_20828 - BLOCK
      ?auto_20829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20824 ?auto_20827 ) ( not ( = ?auto_20824 ?auto_20827 ) ) ( not ( = ?auto_20824 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20826 ) ) ( not ( = ?auto_20827 ?auto_20825 ) ) ( not ( = ?auto_20827 ?auto_20826 ) ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( ON ?auto_20825 ?auto_20824 ) ( CLEAR ?auto_20825 ) ( ON-TABLE ?auto_20827 ) ( HOLDING ?auto_20826 ) ( CLEAR ?auto_20828 ) ( ON-TABLE ?auto_20829 ) ( ON ?auto_20828 ?auto_20829 ) ( not ( = ?auto_20829 ?auto_20828 ) ) ( not ( = ?auto_20829 ?auto_20826 ) ) ( not ( = ?auto_20828 ?auto_20826 ) ) ( not ( = ?auto_20824 ?auto_20828 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( not ( = ?auto_20827 ?auto_20828 ) ) ( not ( = ?auto_20827 ?auto_20829 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20825 ?auto_20829 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20829 ?auto_20828 ?auto_20826 )
      ( MAKE-1PILE ?auto_20824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20830 - BLOCK
    )
    :vars
    (
      ?auto_20832 - BLOCK
      ?auto_20835 - BLOCK
      ?auto_20831 - BLOCK
      ?auto_20833 - BLOCK
      ?auto_20834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20830 ?auto_20832 ) ( not ( = ?auto_20830 ?auto_20832 ) ) ( not ( = ?auto_20830 ?auto_20835 ) ) ( not ( = ?auto_20830 ?auto_20831 ) ) ( not ( = ?auto_20832 ?auto_20835 ) ) ( not ( = ?auto_20832 ?auto_20831 ) ) ( not ( = ?auto_20835 ?auto_20831 ) ) ( ON ?auto_20835 ?auto_20830 ) ( ON-TABLE ?auto_20832 ) ( CLEAR ?auto_20833 ) ( ON-TABLE ?auto_20834 ) ( ON ?auto_20833 ?auto_20834 ) ( not ( = ?auto_20834 ?auto_20833 ) ) ( not ( = ?auto_20834 ?auto_20831 ) ) ( not ( = ?auto_20833 ?auto_20831 ) ) ( not ( = ?auto_20830 ?auto_20833 ) ) ( not ( = ?auto_20830 ?auto_20834 ) ) ( not ( = ?auto_20832 ?auto_20833 ) ) ( not ( = ?auto_20832 ?auto_20834 ) ) ( not ( = ?auto_20835 ?auto_20833 ) ) ( not ( = ?auto_20835 ?auto_20834 ) ) ( ON ?auto_20831 ?auto_20835 ) ( CLEAR ?auto_20831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20832 ?auto_20830 ?auto_20835 )
      ( MAKE-1PILE ?auto_20830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20836 - BLOCK
    )
    :vars
    (
      ?auto_20838 - BLOCK
      ?auto_20839 - BLOCK
      ?auto_20841 - BLOCK
      ?auto_20837 - BLOCK
      ?auto_20840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20836 ?auto_20838 ) ( not ( = ?auto_20836 ?auto_20838 ) ) ( not ( = ?auto_20836 ?auto_20839 ) ) ( not ( = ?auto_20836 ?auto_20841 ) ) ( not ( = ?auto_20838 ?auto_20839 ) ) ( not ( = ?auto_20838 ?auto_20841 ) ) ( not ( = ?auto_20839 ?auto_20841 ) ) ( ON ?auto_20839 ?auto_20836 ) ( ON-TABLE ?auto_20838 ) ( ON-TABLE ?auto_20837 ) ( not ( = ?auto_20837 ?auto_20840 ) ) ( not ( = ?auto_20837 ?auto_20841 ) ) ( not ( = ?auto_20840 ?auto_20841 ) ) ( not ( = ?auto_20836 ?auto_20840 ) ) ( not ( = ?auto_20836 ?auto_20837 ) ) ( not ( = ?auto_20838 ?auto_20840 ) ) ( not ( = ?auto_20838 ?auto_20837 ) ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20839 ?auto_20837 ) ) ( ON ?auto_20841 ?auto_20839 ) ( CLEAR ?auto_20841 ) ( HOLDING ?auto_20840 ) ( CLEAR ?auto_20837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20837 ?auto_20840 )
      ( MAKE-1PILE ?auto_20836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20842 - BLOCK
    )
    :vars
    (
      ?auto_20846 - BLOCK
      ?auto_20845 - BLOCK
      ?auto_20844 - BLOCK
      ?auto_20843 - BLOCK
      ?auto_20847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20842 ?auto_20846 ) ( not ( = ?auto_20842 ?auto_20846 ) ) ( not ( = ?auto_20842 ?auto_20845 ) ) ( not ( = ?auto_20842 ?auto_20844 ) ) ( not ( = ?auto_20846 ?auto_20845 ) ) ( not ( = ?auto_20846 ?auto_20844 ) ) ( not ( = ?auto_20845 ?auto_20844 ) ) ( ON ?auto_20845 ?auto_20842 ) ( ON-TABLE ?auto_20846 ) ( ON-TABLE ?auto_20843 ) ( not ( = ?auto_20843 ?auto_20847 ) ) ( not ( = ?auto_20843 ?auto_20844 ) ) ( not ( = ?auto_20847 ?auto_20844 ) ) ( not ( = ?auto_20842 ?auto_20847 ) ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20843 ) ) ( not ( = ?auto_20845 ?auto_20847 ) ) ( not ( = ?auto_20845 ?auto_20843 ) ) ( ON ?auto_20844 ?auto_20845 ) ( CLEAR ?auto_20843 ) ( ON ?auto_20847 ?auto_20844 ) ( CLEAR ?auto_20847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20846 ?auto_20842 ?auto_20845 ?auto_20844 )
      ( MAKE-1PILE ?auto_20842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20848 - BLOCK
    )
    :vars
    (
      ?auto_20851 - BLOCK
      ?auto_20849 - BLOCK
      ?auto_20852 - BLOCK
      ?auto_20853 - BLOCK
      ?auto_20850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20848 ?auto_20851 ) ( not ( = ?auto_20848 ?auto_20851 ) ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( not ( = ?auto_20848 ?auto_20852 ) ) ( not ( = ?auto_20851 ?auto_20849 ) ) ( not ( = ?auto_20851 ?auto_20852 ) ) ( not ( = ?auto_20849 ?auto_20852 ) ) ( ON ?auto_20849 ?auto_20848 ) ( ON-TABLE ?auto_20851 ) ( not ( = ?auto_20853 ?auto_20850 ) ) ( not ( = ?auto_20853 ?auto_20852 ) ) ( not ( = ?auto_20850 ?auto_20852 ) ) ( not ( = ?auto_20848 ?auto_20850 ) ) ( not ( = ?auto_20848 ?auto_20853 ) ) ( not ( = ?auto_20851 ?auto_20850 ) ) ( not ( = ?auto_20851 ?auto_20853 ) ) ( not ( = ?auto_20849 ?auto_20850 ) ) ( not ( = ?auto_20849 ?auto_20853 ) ) ( ON ?auto_20852 ?auto_20849 ) ( ON ?auto_20850 ?auto_20852 ) ( CLEAR ?auto_20850 ) ( HOLDING ?auto_20853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20853 )
      ( MAKE-1PILE ?auto_20848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20854 - BLOCK
    )
    :vars
    (
      ?auto_20859 - BLOCK
      ?auto_20858 - BLOCK
      ?auto_20857 - BLOCK
      ?auto_20856 - BLOCK
      ?auto_20855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20854 ?auto_20859 ) ( not ( = ?auto_20854 ?auto_20859 ) ) ( not ( = ?auto_20854 ?auto_20858 ) ) ( not ( = ?auto_20854 ?auto_20857 ) ) ( not ( = ?auto_20859 ?auto_20858 ) ) ( not ( = ?auto_20859 ?auto_20857 ) ) ( not ( = ?auto_20858 ?auto_20857 ) ) ( ON ?auto_20858 ?auto_20854 ) ( ON-TABLE ?auto_20859 ) ( not ( = ?auto_20856 ?auto_20855 ) ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( not ( = ?auto_20854 ?auto_20855 ) ) ( not ( = ?auto_20854 ?auto_20856 ) ) ( not ( = ?auto_20859 ?auto_20855 ) ) ( not ( = ?auto_20859 ?auto_20856 ) ) ( not ( = ?auto_20858 ?auto_20855 ) ) ( not ( = ?auto_20858 ?auto_20856 ) ) ( ON ?auto_20857 ?auto_20858 ) ( ON ?auto_20855 ?auto_20857 ) ( ON ?auto_20856 ?auto_20855 ) ( CLEAR ?auto_20856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20859 ?auto_20854 ?auto_20858 ?auto_20857 ?auto_20855 )
      ( MAKE-1PILE ?auto_20854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20867 - BLOCK
      ?auto_20868 - BLOCK
      ?auto_20869 - BLOCK
    )
    :vars
    (
      ?auto_20870 - BLOCK
      ?auto_20871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20870 ?auto_20869 ) ( CLEAR ?auto_20870 ) ( ON-TABLE ?auto_20867 ) ( ON ?auto_20868 ?auto_20867 ) ( ON ?auto_20869 ?auto_20868 ) ( not ( = ?auto_20867 ?auto_20868 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) ( not ( = ?auto_20867 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( HOLDING ?auto_20871 ) ( not ( = ?auto_20867 ?auto_20871 ) ) ( not ( = ?auto_20868 ?auto_20871 ) ) ( not ( = ?auto_20869 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20871 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20871 )
      ( MAKE-3PILE ?auto_20867 ?auto_20868 ?auto_20869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20920 - BLOCK
      ?auto_20921 - BLOCK
    )
    :vars
    (
      ?auto_20922 - BLOCK
      ?auto_20923 - BLOCK
      ?auto_20924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20920 ?auto_20921 ) ) ( ON ?auto_20921 ?auto_20922 ) ( not ( = ?auto_20920 ?auto_20922 ) ) ( not ( = ?auto_20921 ?auto_20922 ) ) ( ON ?auto_20920 ?auto_20921 ) ( CLEAR ?auto_20920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20923 ) ( ON ?auto_20924 ?auto_20923 ) ( ON ?auto_20922 ?auto_20924 ) ( not ( = ?auto_20923 ?auto_20924 ) ) ( not ( = ?auto_20923 ?auto_20922 ) ) ( not ( = ?auto_20923 ?auto_20921 ) ) ( not ( = ?auto_20923 ?auto_20920 ) ) ( not ( = ?auto_20924 ?auto_20922 ) ) ( not ( = ?auto_20924 ?auto_20921 ) ) ( not ( = ?auto_20924 ?auto_20920 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20923 ?auto_20924 ?auto_20922 ?auto_20921 )
      ( MAKE-2PILE ?auto_20920 ?auto_20921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20927 - BLOCK
      ?auto_20928 - BLOCK
    )
    :vars
    (
      ?auto_20929 - BLOCK
      ?auto_20930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20927 ?auto_20928 ) ) ( ON ?auto_20928 ?auto_20929 ) ( CLEAR ?auto_20928 ) ( not ( = ?auto_20927 ?auto_20929 ) ) ( not ( = ?auto_20928 ?auto_20929 ) ) ( ON ?auto_20927 ?auto_20930 ) ( CLEAR ?auto_20927 ) ( HAND-EMPTY ) ( not ( = ?auto_20927 ?auto_20930 ) ) ( not ( = ?auto_20928 ?auto_20930 ) ) ( not ( = ?auto_20929 ?auto_20930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20927 ?auto_20930 )
      ( MAKE-2PILE ?auto_20927 ?auto_20928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20931 - BLOCK
      ?auto_20932 - BLOCK
    )
    :vars
    (
      ?auto_20934 - BLOCK
      ?auto_20933 - BLOCK
      ?auto_20936 - BLOCK
      ?auto_20935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( ON ?auto_20931 ?auto_20933 ) ( CLEAR ?auto_20931 ) ( not ( = ?auto_20931 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20934 ?auto_20933 ) ) ( HOLDING ?auto_20932 ) ( CLEAR ?auto_20934 ) ( ON-TABLE ?auto_20936 ) ( ON ?auto_20935 ?auto_20936 ) ( ON ?auto_20934 ?auto_20935 ) ( not ( = ?auto_20936 ?auto_20935 ) ) ( not ( = ?auto_20936 ?auto_20934 ) ) ( not ( = ?auto_20936 ?auto_20932 ) ) ( not ( = ?auto_20935 ?auto_20934 ) ) ( not ( = ?auto_20935 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20936 ) ) ( not ( = ?auto_20931 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20936 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20936 ?auto_20935 ?auto_20934 ?auto_20932 )
      ( MAKE-2PILE ?auto_20931 ?auto_20932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20937 - BLOCK
      ?auto_20938 - BLOCK
    )
    :vars
    (
      ?auto_20941 - BLOCK
      ?auto_20939 - BLOCK
      ?auto_20942 - BLOCK
      ?auto_20940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20937 ?auto_20938 ) ) ( not ( = ?auto_20937 ?auto_20941 ) ) ( not ( = ?auto_20938 ?auto_20941 ) ) ( ON ?auto_20937 ?auto_20939 ) ( not ( = ?auto_20937 ?auto_20939 ) ) ( not ( = ?auto_20938 ?auto_20939 ) ) ( not ( = ?auto_20941 ?auto_20939 ) ) ( CLEAR ?auto_20941 ) ( ON-TABLE ?auto_20942 ) ( ON ?auto_20940 ?auto_20942 ) ( ON ?auto_20941 ?auto_20940 ) ( not ( = ?auto_20942 ?auto_20940 ) ) ( not ( = ?auto_20942 ?auto_20941 ) ) ( not ( = ?auto_20942 ?auto_20938 ) ) ( not ( = ?auto_20940 ?auto_20941 ) ) ( not ( = ?auto_20940 ?auto_20938 ) ) ( not ( = ?auto_20937 ?auto_20942 ) ) ( not ( = ?auto_20937 ?auto_20940 ) ) ( not ( = ?auto_20939 ?auto_20942 ) ) ( not ( = ?auto_20939 ?auto_20940 ) ) ( ON ?auto_20938 ?auto_20937 ) ( CLEAR ?auto_20938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20939 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20939 ?auto_20937 )
      ( MAKE-2PILE ?auto_20937 ?auto_20938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20943 - BLOCK
      ?auto_20944 - BLOCK
    )
    :vars
    (
      ?auto_20945 - BLOCK
      ?auto_20947 - BLOCK
      ?auto_20948 - BLOCK
      ?auto_20946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20943 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( not ( = ?auto_20944 ?auto_20945 ) ) ( ON ?auto_20943 ?auto_20947 ) ( not ( = ?auto_20943 ?auto_20947 ) ) ( not ( = ?auto_20944 ?auto_20947 ) ) ( not ( = ?auto_20945 ?auto_20947 ) ) ( ON-TABLE ?auto_20948 ) ( ON ?auto_20946 ?auto_20948 ) ( not ( = ?auto_20948 ?auto_20946 ) ) ( not ( = ?auto_20948 ?auto_20945 ) ) ( not ( = ?auto_20948 ?auto_20944 ) ) ( not ( = ?auto_20946 ?auto_20945 ) ) ( not ( = ?auto_20946 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20948 ) ) ( not ( = ?auto_20943 ?auto_20946 ) ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( not ( = ?auto_20947 ?auto_20946 ) ) ( ON ?auto_20944 ?auto_20943 ) ( CLEAR ?auto_20944 ) ( ON-TABLE ?auto_20947 ) ( HOLDING ?auto_20945 ) ( CLEAR ?auto_20946 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20948 ?auto_20946 ?auto_20945 )
      ( MAKE-2PILE ?auto_20943 ?auto_20944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20949 - BLOCK
      ?auto_20950 - BLOCK
    )
    :vars
    (
      ?auto_20951 - BLOCK
      ?auto_20953 - BLOCK
      ?auto_20954 - BLOCK
      ?auto_20952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20949 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20951 ) ) ( not ( = ?auto_20950 ?auto_20951 ) ) ( ON ?auto_20949 ?auto_20953 ) ( not ( = ?auto_20949 ?auto_20953 ) ) ( not ( = ?auto_20950 ?auto_20953 ) ) ( not ( = ?auto_20951 ?auto_20953 ) ) ( ON-TABLE ?auto_20954 ) ( ON ?auto_20952 ?auto_20954 ) ( not ( = ?auto_20954 ?auto_20952 ) ) ( not ( = ?auto_20954 ?auto_20951 ) ) ( not ( = ?auto_20954 ?auto_20950 ) ) ( not ( = ?auto_20952 ?auto_20951 ) ) ( not ( = ?auto_20952 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20954 ) ) ( not ( = ?auto_20949 ?auto_20952 ) ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20952 ) ) ( ON ?auto_20950 ?auto_20949 ) ( ON-TABLE ?auto_20953 ) ( CLEAR ?auto_20952 ) ( ON ?auto_20951 ?auto_20950 ) ( CLEAR ?auto_20951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20953 ?auto_20949 ?auto_20950 )
      ( MAKE-2PILE ?auto_20949 ?auto_20950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20955 - BLOCK
      ?auto_20956 - BLOCK
    )
    :vars
    (
      ?auto_20958 - BLOCK
      ?auto_20957 - BLOCK
      ?auto_20959 - BLOCK
      ?auto_20960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20955 ?auto_20956 ) ) ( not ( = ?auto_20955 ?auto_20958 ) ) ( not ( = ?auto_20956 ?auto_20958 ) ) ( ON ?auto_20955 ?auto_20957 ) ( not ( = ?auto_20955 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20957 ) ) ( not ( = ?auto_20958 ?auto_20957 ) ) ( ON-TABLE ?auto_20959 ) ( not ( = ?auto_20959 ?auto_20960 ) ) ( not ( = ?auto_20959 ?auto_20958 ) ) ( not ( = ?auto_20959 ?auto_20956 ) ) ( not ( = ?auto_20960 ?auto_20958 ) ) ( not ( = ?auto_20960 ?auto_20956 ) ) ( not ( = ?auto_20955 ?auto_20959 ) ) ( not ( = ?auto_20955 ?auto_20960 ) ) ( not ( = ?auto_20957 ?auto_20959 ) ) ( not ( = ?auto_20957 ?auto_20960 ) ) ( ON ?auto_20956 ?auto_20955 ) ( ON-TABLE ?auto_20957 ) ( ON ?auto_20958 ?auto_20956 ) ( CLEAR ?auto_20958 ) ( HOLDING ?auto_20960 ) ( CLEAR ?auto_20959 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20959 ?auto_20960 )
      ( MAKE-2PILE ?auto_20955 ?auto_20956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20961 - BLOCK
      ?auto_20962 - BLOCK
    )
    :vars
    (
      ?auto_20965 - BLOCK
      ?auto_20966 - BLOCK
      ?auto_20963 - BLOCK
      ?auto_20964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20961 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20965 ) ) ( ON ?auto_20961 ?auto_20966 ) ( not ( = ?auto_20961 ?auto_20966 ) ) ( not ( = ?auto_20962 ?auto_20966 ) ) ( not ( = ?auto_20965 ?auto_20966 ) ) ( ON-TABLE ?auto_20963 ) ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20963 ?auto_20965 ) ) ( not ( = ?auto_20963 ?auto_20962 ) ) ( not ( = ?auto_20964 ?auto_20965 ) ) ( not ( = ?auto_20964 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20963 ) ) ( not ( = ?auto_20961 ?auto_20964 ) ) ( not ( = ?auto_20966 ?auto_20963 ) ) ( not ( = ?auto_20966 ?auto_20964 ) ) ( ON ?auto_20962 ?auto_20961 ) ( ON-TABLE ?auto_20966 ) ( ON ?auto_20965 ?auto_20962 ) ( CLEAR ?auto_20963 ) ( ON ?auto_20964 ?auto_20965 ) ( CLEAR ?auto_20964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20966 ?auto_20961 ?auto_20962 ?auto_20965 )
      ( MAKE-2PILE ?auto_20961 ?auto_20962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20967 - BLOCK
      ?auto_20968 - BLOCK
    )
    :vars
    (
      ?auto_20969 - BLOCK
      ?auto_20971 - BLOCK
      ?auto_20970 - BLOCK
      ?auto_20972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20967 ?auto_20968 ) ) ( not ( = ?auto_20967 ?auto_20969 ) ) ( not ( = ?auto_20968 ?auto_20969 ) ) ( ON ?auto_20967 ?auto_20971 ) ( not ( = ?auto_20967 ?auto_20971 ) ) ( not ( = ?auto_20968 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( not ( = ?auto_20970 ?auto_20972 ) ) ( not ( = ?auto_20970 ?auto_20969 ) ) ( not ( = ?auto_20970 ?auto_20968 ) ) ( not ( = ?auto_20972 ?auto_20969 ) ) ( not ( = ?auto_20972 ?auto_20968 ) ) ( not ( = ?auto_20967 ?auto_20970 ) ) ( not ( = ?auto_20967 ?auto_20972 ) ) ( not ( = ?auto_20971 ?auto_20970 ) ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( ON ?auto_20968 ?auto_20967 ) ( ON-TABLE ?auto_20971 ) ( ON ?auto_20969 ?auto_20968 ) ( ON ?auto_20972 ?auto_20969 ) ( CLEAR ?auto_20972 ) ( HOLDING ?auto_20970 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20970 )
      ( MAKE-2PILE ?auto_20967 ?auto_20968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20973 - BLOCK
      ?auto_20974 - BLOCK
    )
    :vars
    (
      ?auto_20975 - BLOCK
      ?auto_20977 - BLOCK
      ?auto_20978 - BLOCK
      ?auto_20976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20973 ?auto_20974 ) ) ( not ( = ?auto_20973 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( ON ?auto_20973 ?auto_20977 ) ( not ( = ?auto_20973 ?auto_20977 ) ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20975 ?auto_20977 ) ) ( not ( = ?auto_20978 ?auto_20976 ) ) ( not ( = ?auto_20978 ?auto_20975 ) ) ( not ( = ?auto_20978 ?auto_20974 ) ) ( not ( = ?auto_20976 ?auto_20975 ) ) ( not ( = ?auto_20976 ?auto_20974 ) ) ( not ( = ?auto_20973 ?auto_20978 ) ) ( not ( = ?auto_20973 ?auto_20976 ) ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20977 ?auto_20976 ) ) ( ON ?auto_20974 ?auto_20973 ) ( ON-TABLE ?auto_20977 ) ( ON ?auto_20975 ?auto_20974 ) ( ON ?auto_20976 ?auto_20975 ) ( ON ?auto_20978 ?auto_20976 ) ( CLEAR ?auto_20978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20977 ?auto_20973 ?auto_20974 ?auto_20975 ?auto_20976 )
      ( MAKE-2PILE ?auto_20973 ?auto_20974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20994 - BLOCK
      ?auto_20995 - BLOCK
    )
    :vars
    (
      ?auto_20998 - BLOCK
      ?auto_20997 - BLOCK
      ?auto_20996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20998 ?auto_20995 ) ( ON-TABLE ?auto_20994 ) ( ON ?auto_20995 ?auto_20994 ) ( not ( = ?auto_20994 ?auto_20995 ) ) ( not ( = ?auto_20994 ?auto_20998 ) ) ( not ( = ?auto_20995 ?auto_20998 ) ) ( not ( = ?auto_20994 ?auto_20997 ) ) ( not ( = ?auto_20994 ?auto_20996 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( not ( = ?auto_20995 ?auto_20996 ) ) ( not ( = ?auto_20998 ?auto_20997 ) ) ( not ( = ?auto_20998 ?auto_20996 ) ) ( not ( = ?auto_20997 ?auto_20996 ) ) ( ON ?auto_20997 ?auto_20998 ) ( CLEAR ?auto_20997 ) ( HOLDING ?auto_20996 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20996 )
      ( MAKE-2PILE ?auto_20994 ?auto_20995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21041 - BLOCK
      ?auto_21042 - BLOCK
      ?auto_21043 - BLOCK
    )
    :vars
    (
      ?auto_21044 - BLOCK
      ?auto_21045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21041 ) ( not ( = ?auto_21041 ?auto_21042 ) ) ( not ( = ?auto_21041 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( ON ?auto_21043 ?auto_21044 ) ( not ( = ?auto_21041 ?auto_21044 ) ) ( not ( = ?auto_21042 ?auto_21044 ) ) ( not ( = ?auto_21043 ?auto_21044 ) ) ( CLEAR ?auto_21041 ) ( ON ?auto_21042 ?auto_21043 ) ( CLEAR ?auto_21042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21045 ) ( ON ?auto_21044 ?auto_21045 ) ( not ( = ?auto_21045 ?auto_21044 ) ) ( not ( = ?auto_21045 ?auto_21043 ) ) ( not ( = ?auto_21045 ?auto_21042 ) ) ( not ( = ?auto_21041 ?auto_21045 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21045 ?auto_21044 ?auto_21043 )
      ( MAKE-3PILE ?auto_21041 ?auto_21042 ?auto_21043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21046 - BLOCK
      ?auto_21047 - BLOCK
      ?auto_21048 - BLOCK
    )
    :vars
    (
      ?auto_21049 - BLOCK
      ?auto_21050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21046 ?auto_21047 ) ) ( not ( = ?auto_21046 ?auto_21048 ) ) ( not ( = ?auto_21047 ?auto_21048 ) ) ( ON ?auto_21048 ?auto_21049 ) ( not ( = ?auto_21046 ?auto_21049 ) ) ( not ( = ?auto_21047 ?auto_21049 ) ) ( not ( = ?auto_21048 ?auto_21049 ) ) ( ON ?auto_21047 ?auto_21048 ) ( CLEAR ?auto_21047 ) ( ON-TABLE ?auto_21050 ) ( ON ?auto_21049 ?auto_21050 ) ( not ( = ?auto_21050 ?auto_21049 ) ) ( not ( = ?auto_21050 ?auto_21048 ) ) ( not ( = ?auto_21050 ?auto_21047 ) ) ( not ( = ?auto_21046 ?auto_21050 ) ) ( HOLDING ?auto_21046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21046 )
      ( MAKE-3PILE ?auto_21046 ?auto_21047 ?auto_21048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21051 - BLOCK
      ?auto_21052 - BLOCK
      ?auto_21053 - BLOCK
    )
    :vars
    (
      ?auto_21054 - BLOCK
      ?auto_21055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21051 ?auto_21052 ) ) ( not ( = ?auto_21051 ?auto_21053 ) ) ( not ( = ?auto_21052 ?auto_21053 ) ) ( ON ?auto_21053 ?auto_21054 ) ( not ( = ?auto_21051 ?auto_21054 ) ) ( not ( = ?auto_21052 ?auto_21054 ) ) ( not ( = ?auto_21053 ?auto_21054 ) ) ( ON ?auto_21052 ?auto_21053 ) ( ON-TABLE ?auto_21055 ) ( ON ?auto_21054 ?auto_21055 ) ( not ( = ?auto_21055 ?auto_21054 ) ) ( not ( = ?auto_21055 ?auto_21053 ) ) ( not ( = ?auto_21055 ?auto_21052 ) ) ( not ( = ?auto_21051 ?auto_21055 ) ) ( ON ?auto_21051 ?auto_21052 ) ( CLEAR ?auto_21051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21055 ?auto_21054 ?auto_21053 ?auto_21052 )
      ( MAKE-3PILE ?auto_21051 ?auto_21052 ?auto_21053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21059 - BLOCK
      ?auto_21060 - BLOCK
      ?auto_21061 - BLOCK
    )
    :vars
    (
      ?auto_21062 - BLOCK
      ?auto_21063 - BLOCK
      ?auto_21064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21059 ?auto_21060 ) ) ( not ( = ?auto_21059 ?auto_21061 ) ) ( not ( = ?auto_21060 ?auto_21061 ) ) ( ON ?auto_21061 ?auto_21062 ) ( not ( = ?auto_21059 ?auto_21062 ) ) ( not ( = ?auto_21060 ?auto_21062 ) ) ( not ( = ?auto_21061 ?auto_21062 ) ) ( ON ?auto_21060 ?auto_21061 ) ( CLEAR ?auto_21060 ) ( ON-TABLE ?auto_21063 ) ( ON ?auto_21062 ?auto_21063 ) ( not ( = ?auto_21063 ?auto_21062 ) ) ( not ( = ?auto_21063 ?auto_21061 ) ) ( not ( = ?auto_21063 ?auto_21060 ) ) ( not ( = ?auto_21059 ?auto_21063 ) ) ( ON ?auto_21059 ?auto_21064 ) ( CLEAR ?auto_21059 ) ( HAND-EMPTY ) ( not ( = ?auto_21059 ?auto_21064 ) ) ( not ( = ?auto_21060 ?auto_21064 ) ) ( not ( = ?auto_21061 ?auto_21064 ) ) ( not ( = ?auto_21062 ?auto_21064 ) ) ( not ( = ?auto_21063 ?auto_21064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21059 ?auto_21064 )
      ( MAKE-3PILE ?auto_21059 ?auto_21060 ?auto_21061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21065 - BLOCK
      ?auto_21066 - BLOCK
      ?auto_21067 - BLOCK
    )
    :vars
    (
      ?auto_21068 - BLOCK
      ?auto_21070 - BLOCK
      ?auto_21069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21065 ?auto_21066 ) ) ( not ( = ?auto_21065 ?auto_21067 ) ) ( not ( = ?auto_21066 ?auto_21067 ) ) ( ON ?auto_21067 ?auto_21068 ) ( not ( = ?auto_21065 ?auto_21068 ) ) ( not ( = ?auto_21066 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( ON-TABLE ?auto_21070 ) ( ON ?auto_21068 ?auto_21070 ) ( not ( = ?auto_21070 ?auto_21068 ) ) ( not ( = ?auto_21070 ?auto_21067 ) ) ( not ( = ?auto_21070 ?auto_21066 ) ) ( not ( = ?auto_21065 ?auto_21070 ) ) ( ON ?auto_21065 ?auto_21069 ) ( CLEAR ?auto_21065 ) ( not ( = ?auto_21065 ?auto_21069 ) ) ( not ( = ?auto_21066 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21069 ) ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( not ( = ?auto_21070 ?auto_21069 ) ) ( HOLDING ?auto_21066 ) ( CLEAR ?auto_21067 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21070 ?auto_21068 ?auto_21067 ?auto_21066 )
      ( MAKE-3PILE ?auto_21065 ?auto_21066 ?auto_21067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21071 - BLOCK
      ?auto_21072 - BLOCK
      ?auto_21073 - BLOCK
    )
    :vars
    (
      ?auto_21076 - BLOCK
      ?auto_21075 - BLOCK
      ?auto_21074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21071 ?auto_21072 ) ) ( not ( = ?auto_21071 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( ON ?auto_21073 ?auto_21076 ) ( not ( = ?auto_21071 ?auto_21076 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( ON-TABLE ?auto_21075 ) ( ON ?auto_21076 ?auto_21075 ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( not ( = ?auto_21075 ?auto_21073 ) ) ( not ( = ?auto_21075 ?auto_21072 ) ) ( not ( = ?auto_21071 ?auto_21075 ) ) ( ON ?auto_21071 ?auto_21074 ) ( not ( = ?auto_21071 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21076 ?auto_21074 ) ) ( not ( = ?auto_21075 ?auto_21074 ) ) ( CLEAR ?auto_21073 ) ( ON ?auto_21072 ?auto_21071 ) ( CLEAR ?auto_21072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21074 ?auto_21071 )
      ( MAKE-3PILE ?auto_21071 ?auto_21072 ?auto_21073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21077 - BLOCK
      ?auto_21078 - BLOCK
      ?auto_21079 - BLOCK
    )
    :vars
    (
      ?auto_21080 - BLOCK
      ?auto_21082 - BLOCK
      ?auto_21081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21077 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21079 ) ) ( not ( = ?auto_21078 ?auto_21079 ) ) ( not ( = ?auto_21077 ?auto_21080 ) ) ( not ( = ?auto_21078 ?auto_21080 ) ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( ON-TABLE ?auto_21082 ) ( ON ?auto_21080 ?auto_21082 ) ( not ( = ?auto_21082 ?auto_21080 ) ) ( not ( = ?auto_21082 ?auto_21079 ) ) ( not ( = ?auto_21082 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21082 ) ) ( ON ?auto_21077 ?auto_21081 ) ( not ( = ?auto_21077 ?auto_21081 ) ) ( not ( = ?auto_21078 ?auto_21081 ) ) ( not ( = ?auto_21079 ?auto_21081 ) ) ( not ( = ?auto_21080 ?auto_21081 ) ) ( not ( = ?auto_21082 ?auto_21081 ) ) ( ON ?auto_21078 ?auto_21077 ) ( CLEAR ?auto_21078 ) ( ON-TABLE ?auto_21081 ) ( HOLDING ?auto_21079 ) ( CLEAR ?auto_21080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21082 ?auto_21080 ?auto_21079 )
      ( MAKE-3PILE ?auto_21077 ?auto_21078 ?auto_21079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21083 - BLOCK
      ?auto_21084 - BLOCK
      ?auto_21085 - BLOCK
    )
    :vars
    (
      ?auto_21086 - BLOCK
      ?auto_21087 - BLOCK
      ?auto_21088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21083 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( not ( = ?auto_21083 ?auto_21086 ) ) ( not ( = ?auto_21084 ?auto_21086 ) ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( ON-TABLE ?auto_21087 ) ( ON ?auto_21086 ?auto_21087 ) ( not ( = ?auto_21087 ?auto_21086 ) ) ( not ( = ?auto_21087 ?auto_21085 ) ) ( not ( = ?auto_21087 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21087 ) ) ( ON ?auto_21083 ?auto_21088 ) ( not ( = ?auto_21083 ?auto_21088 ) ) ( not ( = ?auto_21084 ?auto_21088 ) ) ( not ( = ?auto_21085 ?auto_21088 ) ) ( not ( = ?auto_21086 ?auto_21088 ) ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( ON ?auto_21084 ?auto_21083 ) ( ON-TABLE ?auto_21088 ) ( CLEAR ?auto_21086 ) ( ON ?auto_21085 ?auto_21084 ) ( CLEAR ?auto_21085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21088 ?auto_21083 ?auto_21084 )
      ( MAKE-3PILE ?auto_21083 ?auto_21084 ?auto_21085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21089 - BLOCK
      ?auto_21090 - BLOCK
      ?auto_21091 - BLOCK
    )
    :vars
    (
      ?auto_21092 - BLOCK
      ?auto_21094 - BLOCK
      ?auto_21093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21089 ?auto_21090 ) ) ( not ( = ?auto_21089 ?auto_21091 ) ) ( not ( = ?auto_21090 ?auto_21091 ) ) ( not ( = ?auto_21089 ?auto_21092 ) ) ( not ( = ?auto_21090 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( ON-TABLE ?auto_21094 ) ( not ( = ?auto_21094 ?auto_21092 ) ) ( not ( = ?auto_21094 ?auto_21091 ) ) ( not ( = ?auto_21094 ?auto_21090 ) ) ( not ( = ?auto_21089 ?auto_21094 ) ) ( ON ?auto_21089 ?auto_21093 ) ( not ( = ?auto_21089 ?auto_21093 ) ) ( not ( = ?auto_21090 ?auto_21093 ) ) ( not ( = ?auto_21091 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21093 ) ) ( not ( = ?auto_21094 ?auto_21093 ) ) ( ON ?auto_21090 ?auto_21089 ) ( ON-TABLE ?auto_21093 ) ( ON ?auto_21091 ?auto_21090 ) ( CLEAR ?auto_21091 ) ( HOLDING ?auto_21092 ) ( CLEAR ?auto_21094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21094 ?auto_21092 )
      ( MAKE-3PILE ?auto_21089 ?auto_21090 ?auto_21091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21095 - BLOCK
      ?auto_21096 - BLOCK
      ?auto_21097 - BLOCK
    )
    :vars
    (
      ?auto_21099 - BLOCK
      ?auto_21100 - BLOCK
      ?auto_21098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21095 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21097 ) ) ( not ( = ?auto_21096 ?auto_21097 ) ) ( not ( = ?auto_21095 ?auto_21099 ) ) ( not ( = ?auto_21096 ?auto_21099 ) ) ( not ( = ?auto_21097 ?auto_21099 ) ) ( ON-TABLE ?auto_21100 ) ( not ( = ?auto_21100 ?auto_21099 ) ) ( not ( = ?auto_21100 ?auto_21097 ) ) ( not ( = ?auto_21100 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21100 ) ) ( ON ?auto_21095 ?auto_21098 ) ( not ( = ?auto_21095 ?auto_21098 ) ) ( not ( = ?auto_21096 ?auto_21098 ) ) ( not ( = ?auto_21097 ?auto_21098 ) ) ( not ( = ?auto_21099 ?auto_21098 ) ) ( not ( = ?auto_21100 ?auto_21098 ) ) ( ON ?auto_21096 ?auto_21095 ) ( ON-TABLE ?auto_21098 ) ( ON ?auto_21097 ?auto_21096 ) ( CLEAR ?auto_21100 ) ( ON ?auto_21099 ?auto_21097 ) ( CLEAR ?auto_21099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21098 ?auto_21095 ?auto_21096 ?auto_21097 )
      ( MAKE-3PILE ?auto_21095 ?auto_21096 ?auto_21097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21101 - BLOCK
      ?auto_21102 - BLOCK
      ?auto_21103 - BLOCK
    )
    :vars
    (
      ?auto_21104 - BLOCK
      ?auto_21105 - BLOCK
      ?auto_21106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21102 ?auto_21104 ) ) ( not ( = ?auto_21103 ?auto_21104 ) ) ( not ( = ?auto_21105 ?auto_21104 ) ) ( not ( = ?auto_21105 ?auto_21103 ) ) ( not ( = ?auto_21105 ?auto_21102 ) ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( ON ?auto_21101 ?auto_21106 ) ( not ( = ?auto_21101 ?auto_21106 ) ) ( not ( = ?auto_21102 ?auto_21106 ) ) ( not ( = ?auto_21103 ?auto_21106 ) ) ( not ( = ?auto_21104 ?auto_21106 ) ) ( not ( = ?auto_21105 ?auto_21106 ) ) ( ON ?auto_21102 ?auto_21101 ) ( ON-TABLE ?auto_21106 ) ( ON ?auto_21103 ?auto_21102 ) ( ON ?auto_21104 ?auto_21103 ) ( CLEAR ?auto_21104 ) ( HOLDING ?auto_21105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21105 )
      ( MAKE-3PILE ?auto_21101 ?auto_21102 ?auto_21103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21107 - BLOCK
      ?auto_21108 - BLOCK
      ?auto_21109 - BLOCK
    )
    :vars
    (
      ?auto_21110 - BLOCK
      ?auto_21111 - BLOCK
      ?auto_21112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21109 ) ) ( not ( = ?auto_21107 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( not ( = ?auto_21111 ?auto_21110 ) ) ( not ( = ?auto_21111 ?auto_21109 ) ) ( not ( = ?auto_21111 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21111 ) ) ( ON ?auto_21107 ?auto_21112 ) ( not ( = ?auto_21107 ?auto_21112 ) ) ( not ( = ?auto_21108 ?auto_21112 ) ) ( not ( = ?auto_21109 ?auto_21112 ) ) ( not ( = ?auto_21110 ?auto_21112 ) ) ( not ( = ?auto_21111 ?auto_21112 ) ) ( ON ?auto_21108 ?auto_21107 ) ( ON-TABLE ?auto_21112 ) ( ON ?auto_21109 ?auto_21108 ) ( ON ?auto_21110 ?auto_21109 ) ( ON ?auto_21111 ?auto_21110 ) ( CLEAR ?auto_21111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21112 ?auto_21107 ?auto_21108 ?auto_21109 ?auto_21110 )
      ( MAKE-3PILE ?auto_21107 ?auto_21108 ?auto_21109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21124 - BLOCK
    )
    :vars
    (
      ?auto_21125 - BLOCK
      ?auto_21126 - BLOCK
      ?auto_21127 - BLOCK
      ?auto_21128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21125 ?auto_21124 ) ( ON-TABLE ?auto_21124 ) ( not ( = ?auto_21124 ?auto_21125 ) ) ( not ( = ?auto_21124 ?auto_21126 ) ) ( not ( = ?auto_21124 ?auto_21127 ) ) ( not ( = ?auto_21125 ?auto_21126 ) ) ( not ( = ?auto_21125 ?auto_21127 ) ) ( not ( = ?auto_21126 ?auto_21127 ) ) ( ON ?auto_21126 ?auto_21125 ) ( CLEAR ?auto_21126 ) ( HOLDING ?auto_21127 ) ( CLEAR ?auto_21128 ) ( ON-TABLE ?auto_21128 ) ( not ( = ?auto_21128 ?auto_21127 ) ) ( not ( = ?auto_21124 ?auto_21128 ) ) ( not ( = ?auto_21125 ?auto_21128 ) ) ( not ( = ?auto_21126 ?auto_21128 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21128 ?auto_21127 )
      ( MAKE-1PILE ?auto_21124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21129 - BLOCK
    )
    :vars
    (
      ?auto_21133 - BLOCK
      ?auto_21131 - BLOCK
      ?auto_21132 - BLOCK
      ?auto_21130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21133 ?auto_21129 ) ( ON-TABLE ?auto_21129 ) ( not ( = ?auto_21129 ?auto_21133 ) ) ( not ( = ?auto_21129 ?auto_21131 ) ) ( not ( = ?auto_21129 ?auto_21132 ) ) ( not ( = ?auto_21133 ?auto_21131 ) ) ( not ( = ?auto_21133 ?auto_21132 ) ) ( not ( = ?auto_21131 ?auto_21132 ) ) ( ON ?auto_21131 ?auto_21133 ) ( CLEAR ?auto_21130 ) ( ON-TABLE ?auto_21130 ) ( not ( = ?auto_21130 ?auto_21132 ) ) ( not ( = ?auto_21129 ?auto_21130 ) ) ( not ( = ?auto_21133 ?auto_21130 ) ) ( not ( = ?auto_21131 ?auto_21130 ) ) ( ON ?auto_21132 ?auto_21131 ) ( CLEAR ?auto_21132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21129 ?auto_21133 ?auto_21131 )
      ( MAKE-1PILE ?auto_21129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21134 - BLOCK
    )
    :vars
    (
      ?auto_21135 - BLOCK
      ?auto_21137 - BLOCK
      ?auto_21136 - BLOCK
      ?auto_21138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21135 ?auto_21134 ) ( ON-TABLE ?auto_21134 ) ( not ( = ?auto_21134 ?auto_21135 ) ) ( not ( = ?auto_21134 ?auto_21137 ) ) ( not ( = ?auto_21134 ?auto_21136 ) ) ( not ( = ?auto_21135 ?auto_21137 ) ) ( not ( = ?auto_21135 ?auto_21136 ) ) ( not ( = ?auto_21137 ?auto_21136 ) ) ( ON ?auto_21137 ?auto_21135 ) ( not ( = ?auto_21138 ?auto_21136 ) ) ( not ( = ?auto_21134 ?auto_21138 ) ) ( not ( = ?auto_21135 ?auto_21138 ) ) ( not ( = ?auto_21137 ?auto_21138 ) ) ( ON ?auto_21136 ?auto_21137 ) ( CLEAR ?auto_21136 ) ( HOLDING ?auto_21138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21138 )
      ( MAKE-1PILE ?auto_21134 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21145 - BLOCK
    )
    :vars
    (
      ?auto_21146 - BLOCK
      ?auto_21147 - BLOCK
      ?auto_21149 - BLOCK
      ?auto_21148 - BLOCK
      ?auto_21150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21146 ?auto_21145 ) ( ON-TABLE ?auto_21145 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( ON ?auto_21147 ?auto_21146 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( ON ?auto_21149 ?auto_21147 ) ( CLEAR ?auto_21149 ) ( ON ?auto_21148 ?auto_21150 ) ( CLEAR ?auto_21148 ) ( HAND-EMPTY ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21149 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21148 ?auto_21150 )
      ( MAKE-1PILE ?auto_21145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21151 - BLOCK
    )
    :vars
    (
      ?auto_21152 - BLOCK
      ?auto_21154 - BLOCK
      ?auto_21153 - BLOCK
      ?auto_21155 - BLOCK
      ?auto_21156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21152 ?auto_21151 ) ( ON-TABLE ?auto_21151 ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21154 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21152 ?auto_21154 ) ) ( not ( = ?auto_21152 ?auto_21153 ) ) ( not ( = ?auto_21154 ?auto_21153 ) ) ( ON ?auto_21154 ?auto_21152 ) ( not ( = ?auto_21155 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21155 ) ) ( not ( = ?auto_21152 ?auto_21155 ) ) ( not ( = ?auto_21154 ?auto_21155 ) ) ( ON ?auto_21155 ?auto_21156 ) ( CLEAR ?auto_21155 ) ( not ( = ?auto_21151 ?auto_21156 ) ) ( not ( = ?auto_21152 ?auto_21156 ) ) ( not ( = ?auto_21154 ?auto_21156 ) ) ( not ( = ?auto_21153 ?auto_21156 ) ) ( not ( = ?auto_21155 ?auto_21156 ) ) ( HOLDING ?auto_21153 ) ( CLEAR ?auto_21154 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21151 ?auto_21152 ?auto_21154 ?auto_21153 )
      ( MAKE-1PILE ?auto_21151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21185 - BLOCK
      ?auto_21186 - BLOCK
      ?auto_21187 - BLOCK
      ?auto_21188 - BLOCK
    )
    :vars
    (
      ?auto_21189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21185 ) ( ON ?auto_21186 ?auto_21185 ) ( not ( = ?auto_21185 ?auto_21186 ) ) ( not ( = ?auto_21185 ?auto_21187 ) ) ( not ( = ?auto_21185 ?auto_21188 ) ) ( not ( = ?auto_21186 ?auto_21187 ) ) ( not ( = ?auto_21186 ?auto_21188 ) ) ( not ( = ?auto_21187 ?auto_21188 ) ) ( ON ?auto_21188 ?auto_21189 ) ( not ( = ?auto_21185 ?auto_21189 ) ) ( not ( = ?auto_21186 ?auto_21189 ) ) ( not ( = ?auto_21187 ?auto_21189 ) ) ( not ( = ?auto_21188 ?auto_21189 ) ) ( CLEAR ?auto_21186 ) ( ON ?auto_21187 ?auto_21188 ) ( CLEAR ?auto_21187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21189 ?auto_21188 )
      ( MAKE-4PILE ?auto_21185 ?auto_21186 ?auto_21187 ?auto_21188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21190 - BLOCK
      ?auto_21191 - BLOCK
      ?auto_21192 - BLOCK
      ?auto_21193 - BLOCK
    )
    :vars
    (
      ?auto_21194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21190 ) ( not ( = ?auto_21190 ?auto_21191 ) ) ( not ( = ?auto_21190 ?auto_21192 ) ) ( not ( = ?auto_21190 ?auto_21193 ) ) ( not ( = ?auto_21191 ?auto_21192 ) ) ( not ( = ?auto_21191 ?auto_21193 ) ) ( not ( = ?auto_21192 ?auto_21193 ) ) ( ON ?auto_21193 ?auto_21194 ) ( not ( = ?auto_21190 ?auto_21194 ) ) ( not ( = ?auto_21191 ?auto_21194 ) ) ( not ( = ?auto_21192 ?auto_21194 ) ) ( not ( = ?auto_21193 ?auto_21194 ) ) ( ON ?auto_21192 ?auto_21193 ) ( CLEAR ?auto_21192 ) ( ON-TABLE ?auto_21194 ) ( HOLDING ?auto_21191 ) ( CLEAR ?auto_21190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21190 ?auto_21191 )
      ( MAKE-4PILE ?auto_21190 ?auto_21191 ?auto_21192 ?auto_21193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21195 - BLOCK
      ?auto_21196 - BLOCK
      ?auto_21197 - BLOCK
      ?auto_21198 - BLOCK
    )
    :vars
    (
      ?auto_21199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21195 ) ( not ( = ?auto_21195 ?auto_21196 ) ) ( not ( = ?auto_21195 ?auto_21197 ) ) ( not ( = ?auto_21195 ?auto_21198 ) ) ( not ( = ?auto_21196 ?auto_21197 ) ) ( not ( = ?auto_21196 ?auto_21198 ) ) ( not ( = ?auto_21197 ?auto_21198 ) ) ( ON ?auto_21198 ?auto_21199 ) ( not ( = ?auto_21195 ?auto_21199 ) ) ( not ( = ?auto_21196 ?auto_21199 ) ) ( not ( = ?auto_21197 ?auto_21199 ) ) ( not ( = ?auto_21198 ?auto_21199 ) ) ( ON ?auto_21197 ?auto_21198 ) ( ON-TABLE ?auto_21199 ) ( CLEAR ?auto_21195 ) ( ON ?auto_21196 ?auto_21197 ) ( CLEAR ?auto_21196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21199 ?auto_21198 ?auto_21197 )
      ( MAKE-4PILE ?auto_21195 ?auto_21196 ?auto_21197 ?auto_21198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21200 - BLOCK
      ?auto_21201 - BLOCK
      ?auto_21202 - BLOCK
      ?auto_21203 - BLOCK
    )
    :vars
    (
      ?auto_21204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21200 ?auto_21201 ) ) ( not ( = ?auto_21200 ?auto_21202 ) ) ( not ( = ?auto_21200 ?auto_21203 ) ) ( not ( = ?auto_21201 ?auto_21202 ) ) ( not ( = ?auto_21201 ?auto_21203 ) ) ( not ( = ?auto_21202 ?auto_21203 ) ) ( ON ?auto_21203 ?auto_21204 ) ( not ( = ?auto_21200 ?auto_21204 ) ) ( not ( = ?auto_21201 ?auto_21204 ) ) ( not ( = ?auto_21202 ?auto_21204 ) ) ( not ( = ?auto_21203 ?auto_21204 ) ) ( ON ?auto_21202 ?auto_21203 ) ( ON-TABLE ?auto_21204 ) ( ON ?auto_21201 ?auto_21202 ) ( CLEAR ?auto_21201 ) ( HOLDING ?auto_21200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21200 )
      ( MAKE-4PILE ?auto_21200 ?auto_21201 ?auto_21202 ?auto_21203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21205 - BLOCK
      ?auto_21206 - BLOCK
      ?auto_21207 - BLOCK
      ?auto_21208 - BLOCK
    )
    :vars
    (
      ?auto_21209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21205 ?auto_21206 ) ) ( not ( = ?auto_21205 ?auto_21207 ) ) ( not ( = ?auto_21205 ?auto_21208 ) ) ( not ( = ?auto_21206 ?auto_21207 ) ) ( not ( = ?auto_21206 ?auto_21208 ) ) ( not ( = ?auto_21207 ?auto_21208 ) ) ( ON ?auto_21208 ?auto_21209 ) ( not ( = ?auto_21205 ?auto_21209 ) ) ( not ( = ?auto_21206 ?auto_21209 ) ) ( not ( = ?auto_21207 ?auto_21209 ) ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( ON ?auto_21207 ?auto_21208 ) ( ON-TABLE ?auto_21209 ) ( ON ?auto_21206 ?auto_21207 ) ( ON ?auto_21205 ?auto_21206 ) ( CLEAR ?auto_21205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21209 ?auto_21208 ?auto_21207 ?auto_21206 )
      ( MAKE-4PILE ?auto_21205 ?auto_21206 ?auto_21207 ?auto_21208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21214 - BLOCK
      ?auto_21215 - BLOCK
      ?auto_21216 - BLOCK
      ?auto_21217 - BLOCK
    )
    :vars
    (
      ?auto_21218 - BLOCK
      ?auto_21219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( ON ?auto_21217 ?auto_21218 ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( ON ?auto_21216 ?auto_21217 ) ( ON-TABLE ?auto_21218 ) ( ON ?auto_21215 ?auto_21216 ) ( CLEAR ?auto_21215 ) ( ON ?auto_21214 ?auto_21219 ) ( CLEAR ?auto_21214 ) ( HAND-EMPTY ) ( not ( = ?auto_21214 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21214 ?auto_21219 )
      ( MAKE-4PILE ?auto_21214 ?auto_21215 ?auto_21216 ?auto_21217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21220 - BLOCK
      ?auto_21221 - BLOCK
      ?auto_21222 - BLOCK
      ?auto_21223 - BLOCK
    )
    :vars
    (
      ?auto_21224 - BLOCK
      ?auto_21225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21223 ) ) ( not ( = ?auto_21221 ?auto_21222 ) ) ( not ( = ?auto_21221 ?auto_21223 ) ) ( not ( = ?auto_21222 ?auto_21223 ) ) ( ON ?auto_21223 ?auto_21224 ) ( not ( = ?auto_21220 ?auto_21224 ) ) ( not ( = ?auto_21221 ?auto_21224 ) ) ( not ( = ?auto_21222 ?auto_21224 ) ) ( not ( = ?auto_21223 ?auto_21224 ) ) ( ON ?auto_21222 ?auto_21223 ) ( ON-TABLE ?auto_21224 ) ( ON ?auto_21220 ?auto_21225 ) ( CLEAR ?auto_21220 ) ( not ( = ?auto_21220 ?auto_21225 ) ) ( not ( = ?auto_21221 ?auto_21225 ) ) ( not ( = ?auto_21222 ?auto_21225 ) ) ( not ( = ?auto_21223 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( HOLDING ?auto_21221 ) ( CLEAR ?auto_21222 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21224 ?auto_21223 ?auto_21222 ?auto_21221 )
      ( MAKE-4PILE ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21226 - BLOCK
      ?auto_21227 - BLOCK
      ?auto_21228 - BLOCK
      ?auto_21229 - BLOCK
    )
    :vars
    (
      ?auto_21231 - BLOCK
      ?auto_21230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21226 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( not ( = ?auto_21226 ?auto_21229 ) ) ( not ( = ?auto_21227 ?auto_21228 ) ) ( not ( = ?auto_21227 ?auto_21229 ) ) ( not ( = ?auto_21228 ?auto_21229 ) ) ( ON ?auto_21229 ?auto_21231 ) ( not ( = ?auto_21226 ?auto_21231 ) ) ( not ( = ?auto_21227 ?auto_21231 ) ) ( not ( = ?auto_21228 ?auto_21231 ) ) ( not ( = ?auto_21229 ?auto_21231 ) ) ( ON ?auto_21228 ?auto_21229 ) ( ON-TABLE ?auto_21231 ) ( ON ?auto_21226 ?auto_21230 ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21230 ) ) ( not ( = ?auto_21231 ?auto_21230 ) ) ( CLEAR ?auto_21228 ) ( ON ?auto_21227 ?auto_21226 ) ( CLEAR ?auto_21227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21230 ?auto_21226 )
      ( MAKE-4PILE ?auto_21226 ?auto_21227 ?auto_21228 ?auto_21229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21232 - BLOCK
      ?auto_21233 - BLOCK
      ?auto_21234 - BLOCK
      ?auto_21235 - BLOCK
    )
    :vars
    (
      ?auto_21237 - BLOCK
      ?auto_21236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21232 ?auto_21233 ) ) ( not ( = ?auto_21232 ?auto_21234 ) ) ( not ( = ?auto_21232 ?auto_21235 ) ) ( not ( = ?auto_21233 ?auto_21234 ) ) ( not ( = ?auto_21233 ?auto_21235 ) ) ( not ( = ?auto_21234 ?auto_21235 ) ) ( ON ?auto_21235 ?auto_21237 ) ( not ( = ?auto_21232 ?auto_21237 ) ) ( not ( = ?auto_21233 ?auto_21237 ) ) ( not ( = ?auto_21234 ?auto_21237 ) ) ( not ( = ?auto_21235 ?auto_21237 ) ) ( ON-TABLE ?auto_21237 ) ( ON ?auto_21232 ?auto_21236 ) ( not ( = ?auto_21232 ?auto_21236 ) ) ( not ( = ?auto_21233 ?auto_21236 ) ) ( not ( = ?auto_21234 ?auto_21236 ) ) ( not ( = ?auto_21235 ?auto_21236 ) ) ( not ( = ?auto_21237 ?auto_21236 ) ) ( ON ?auto_21233 ?auto_21232 ) ( CLEAR ?auto_21233 ) ( ON-TABLE ?auto_21236 ) ( HOLDING ?auto_21234 ) ( CLEAR ?auto_21235 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21237 ?auto_21235 ?auto_21234 )
      ( MAKE-4PILE ?auto_21232 ?auto_21233 ?auto_21234 ?auto_21235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21238 - BLOCK
      ?auto_21239 - BLOCK
      ?auto_21240 - BLOCK
      ?auto_21241 - BLOCK
    )
    :vars
    (
      ?auto_21242 - BLOCK
      ?auto_21243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21238 ?auto_21239 ) ) ( not ( = ?auto_21238 ?auto_21240 ) ) ( not ( = ?auto_21238 ?auto_21241 ) ) ( not ( = ?auto_21239 ?auto_21240 ) ) ( not ( = ?auto_21239 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( ON ?auto_21241 ?auto_21242 ) ( not ( = ?auto_21238 ?auto_21242 ) ) ( not ( = ?auto_21239 ?auto_21242 ) ) ( not ( = ?auto_21240 ?auto_21242 ) ) ( not ( = ?auto_21241 ?auto_21242 ) ) ( ON-TABLE ?auto_21242 ) ( ON ?auto_21238 ?auto_21243 ) ( not ( = ?auto_21238 ?auto_21243 ) ) ( not ( = ?auto_21239 ?auto_21243 ) ) ( not ( = ?auto_21240 ?auto_21243 ) ) ( not ( = ?auto_21241 ?auto_21243 ) ) ( not ( = ?auto_21242 ?auto_21243 ) ) ( ON ?auto_21239 ?auto_21238 ) ( ON-TABLE ?auto_21243 ) ( CLEAR ?auto_21241 ) ( ON ?auto_21240 ?auto_21239 ) ( CLEAR ?auto_21240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21243 ?auto_21238 ?auto_21239 )
      ( MAKE-4PILE ?auto_21238 ?auto_21239 ?auto_21240 ?auto_21241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21244 - BLOCK
      ?auto_21245 - BLOCK
      ?auto_21246 - BLOCK
      ?auto_21247 - BLOCK
    )
    :vars
    (
      ?auto_21248 - BLOCK
      ?auto_21249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21244 ?auto_21245 ) ) ( not ( = ?auto_21244 ?auto_21246 ) ) ( not ( = ?auto_21244 ?auto_21247 ) ) ( not ( = ?auto_21245 ?auto_21246 ) ) ( not ( = ?auto_21245 ?auto_21247 ) ) ( not ( = ?auto_21246 ?auto_21247 ) ) ( not ( = ?auto_21244 ?auto_21248 ) ) ( not ( = ?auto_21245 ?auto_21248 ) ) ( not ( = ?auto_21246 ?auto_21248 ) ) ( not ( = ?auto_21247 ?auto_21248 ) ) ( ON-TABLE ?auto_21248 ) ( ON ?auto_21244 ?auto_21249 ) ( not ( = ?auto_21244 ?auto_21249 ) ) ( not ( = ?auto_21245 ?auto_21249 ) ) ( not ( = ?auto_21246 ?auto_21249 ) ) ( not ( = ?auto_21247 ?auto_21249 ) ) ( not ( = ?auto_21248 ?auto_21249 ) ) ( ON ?auto_21245 ?auto_21244 ) ( ON-TABLE ?auto_21249 ) ( ON ?auto_21246 ?auto_21245 ) ( CLEAR ?auto_21246 ) ( HOLDING ?auto_21247 ) ( CLEAR ?auto_21248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21248 ?auto_21247 )
      ( MAKE-4PILE ?auto_21244 ?auto_21245 ?auto_21246 ?auto_21247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21250 - BLOCK
      ?auto_21251 - BLOCK
      ?auto_21252 - BLOCK
      ?auto_21253 - BLOCK
    )
    :vars
    (
      ?auto_21254 - BLOCK
      ?auto_21255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21250 ?auto_21251 ) ) ( not ( = ?auto_21250 ?auto_21252 ) ) ( not ( = ?auto_21250 ?auto_21253 ) ) ( not ( = ?auto_21251 ?auto_21252 ) ) ( not ( = ?auto_21251 ?auto_21253 ) ) ( not ( = ?auto_21252 ?auto_21253 ) ) ( not ( = ?auto_21250 ?auto_21254 ) ) ( not ( = ?auto_21251 ?auto_21254 ) ) ( not ( = ?auto_21252 ?auto_21254 ) ) ( not ( = ?auto_21253 ?auto_21254 ) ) ( ON-TABLE ?auto_21254 ) ( ON ?auto_21250 ?auto_21255 ) ( not ( = ?auto_21250 ?auto_21255 ) ) ( not ( = ?auto_21251 ?auto_21255 ) ) ( not ( = ?auto_21252 ?auto_21255 ) ) ( not ( = ?auto_21253 ?auto_21255 ) ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( ON ?auto_21251 ?auto_21250 ) ( ON-TABLE ?auto_21255 ) ( ON ?auto_21252 ?auto_21251 ) ( CLEAR ?auto_21254 ) ( ON ?auto_21253 ?auto_21252 ) ( CLEAR ?auto_21253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21255 ?auto_21250 ?auto_21251 ?auto_21252 )
      ( MAKE-4PILE ?auto_21250 ?auto_21251 ?auto_21252 ?auto_21253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21256 - BLOCK
      ?auto_21257 - BLOCK
      ?auto_21258 - BLOCK
      ?auto_21259 - BLOCK
    )
    :vars
    (
      ?auto_21260 - BLOCK
      ?auto_21261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21256 ?auto_21257 ) ) ( not ( = ?auto_21256 ?auto_21258 ) ) ( not ( = ?auto_21256 ?auto_21259 ) ) ( not ( = ?auto_21257 ?auto_21258 ) ) ( not ( = ?auto_21257 ?auto_21259 ) ) ( not ( = ?auto_21258 ?auto_21259 ) ) ( not ( = ?auto_21256 ?auto_21260 ) ) ( not ( = ?auto_21257 ?auto_21260 ) ) ( not ( = ?auto_21258 ?auto_21260 ) ) ( not ( = ?auto_21259 ?auto_21260 ) ) ( ON ?auto_21256 ?auto_21261 ) ( not ( = ?auto_21256 ?auto_21261 ) ) ( not ( = ?auto_21257 ?auto_21261 ) ) ( not ( = ?auto_21258 ?auto_21261 ) ) ( not ( = ?auto_21259 ?auto_21261 ) ) ( not ( = ?auto_21260 ?auto_21261 ) ) ( ON ?auto_21257 ?auto_21256 ) ( ON-TABLE ?auto_21261 ) ( ON ?auto_21258 ?auto_21257 ) ( ON ?auto_21259 ?auto_21258 ) ( CLEAR ?auto_21259 ) ( HOLDING ?auto_21260 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21260 )
      ( MAKE-4PILE ?auto_21256 ?auto_21257 ?auto_21258 ?auto_21259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21262 - BLOCK
      ?auto_21263 - BLOCK
      ?auto_21264 - BLOCK
      ?auto_21265 - BLOCK
    )
    :vars
    (
      ?auto_21266 - BLOCK
      ?auto_21267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21262 ?auto_21263 ) ) ( not ( = ?auto_21262 ?auto_21264 ) ) ( not ( = ?auto_21262 ?auto_21265 ) ) ( not ( = ?auto_21263 ?auto_21264 ) ) ( not ( = ?auto_21263 ?auto_21265 ) ) ( not ( = ?auto_21264 ?auto_21265 ) ) ( not ( = ?auto_21262 ?auto_21266 ) ) ( not ( = ?auto_21263 ?auto_21266 ) ) ( not ( = ?auto_21264 ?auto_21266 ) ) ( not ( = ?auto_21265 ?auto_21266 ) ) ( ON ?auto_21262 ?auto_21267 ) ( not ( = ?auto_21262 ?auto_21267 ) ) ( not ( = ?auto_21263 ?auto_21267 ) ) ( not ( = ?auto_21264 ?auto_21267 ) ) ( not ( = ?auto_21265 ?auto_21267 ) ) ( not ( = ?auto_21266 ?auto_21267 ) ) ( ON ?auto_21263 ?auto_21262 ) ( ON-TABLE ?auto_21267 ) ( ON ?auto_21264 ?auto_21263 ) ( ON ?auto_21265 ?auto_21264 ) ( ON ?auto_21266 ?auto_21265 ) ( CLEAR ?auto_21266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21267 ?auto_21262 ?auto_21263 ?auto_21264 ?auto_21265 )
      ( MAKE-4PILE ?auto_21262 ?auto_21263 ?auto_21264 ?auto_21265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21278 - BLOCK
      ?auto_21279 - BLOCK
      ?auto_21280 - BLOCK
      ?auto_21281 - BLOCK
      ?auto_21282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21281 ) ( ON-TABLE ?auto_21278 ) ( ON ?auto_21279 ?auto_21278 ) ( ON ?auto_21280 ?auto_21279 ) ( ON ?auto_21281 ?auto_21280 ) ( not ( = ?auto_21278 ?auto_21279 ) ) ( not ( = ?auto_21278 ?auto_21280 ) ) ( not ( = ?auto_21278 ?auto_21281 ) ) ( not ( = ?auto_21278 ?auto_21282 ) ) ( not ( = ?auto_21279 ?auto_21280 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) ( not ( = ?auto_21279 ?auto_21282 ) ) ( not ( = ?auto_21280 ?auto_21281 ) ) ( not ( = ?auto_21280 ?auto_21282 ) ) ( not ( = ?auto_21281 ?auto_21282 ) ) ( ON-TABLE ?auto_21282 ) ( CLEAR ?auto_21282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_21282 )
      ( MAKE-5PILE ?auto_21278 ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21283 - BLOCK
      ?auto_21284 - BLOCK
      ?auto_21285 - BLOCK
      ?auto_21286 - BLOCK
      ?auto_21287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21283 ) ( ON ?auto_21284 ?auto_21283 ) ( ON ?auto_21285 ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( ON-TABLE ?auto_21287 ) ( CLEAR ?auto_21287 ) ( HOLDING ?auto_21286 ) ( CLEAR ?auto_21285 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 )
      ( MAKE-5PILE ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21288 - BLOCK
      ?auto_21289 - BLOCK
      ?auto_21290 - BLOCK
      ?auto_21291 - BLOCK
      ?auto_21292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21288 ) ( ON ?auto_21289 ?auto_21288 ) ( ON ?auto_21290 ?auto_21289 ) ( not ( = ?auto_21288 ?auto_21289 ) ) ( not ( = ?auto_21288 ?auto_21290 ) ) ( not ( = ?auto_21288 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21292 ) ) ( not ( = ?auto_21289 ?auto_21290 ) ) ( not ( = ?auto_21289 ?auto_21291 ) ) ( not ( = ?auto_21289 ?auto_21292 ) ) ( not ( = ?auto_21290 ?auto_21291 ) ) ( not ( = ?auto_21290 ?auto_21292 ) ) ( not ( = ?auto_21291 ?auto_21292 ) ) ( ON-TABLE ?auto_21292 ) ( CLEAR ?auto_21290 ) ( ON ?auto_21291 ?auto_21292 ) ( CLEAR ?auto_21291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21292 )
      ( MAKE-5PILE ?auto_21288 ?auto_21289 ?auto_21290 ?auto_21291 ?auto_21292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21293 - BLOCK
      ?auto_21294 - BLOCK
      ?auto_21295 - BLOCK
      ?auto_21296 - BLOCK
      ?auto_21297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21293 ) ( ON ?auto_21294 ?auto_21293 ) ( not ( = ?auto_21293 ?auto_21294 ) ) ( not ( = ?auto_21293 ?auto_21295 ) ) ( not ( = ?auto_21293 ?auto_21296 ) ) ( not ( = ?auto_21293 ?auto_21297 ) ) ( not ( = ?auto_21294 ?auto_21295 ) ) ( not ( = ?auto_21294 ?auto_21296 ) ) ( not ( = ?auto_21294 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21296 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( ON-TABLE ?auto_21297 ) ( ON ?auto_21296 ?auto_21297 ) ( CLEAR ?auto_21296 ) ( HOLDING ?auto_21295 ) ( CLEAR ?auto_21294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21293 ?auto_21294 ?auto_21295 )
      ( MAKE-5PILE ?auto_21293 ?auto_21294 ?auto_21295 ?auto_21296 ?auto_21297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21298 - BLOCK
      ?auto_21299 - BLOCK
      ?auto_21300 - BLOCK
      ?auto_21301 - BLOCK
      ?auto_21302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21298 ) ( ON ?auto_21299 ?auto_21298 ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21301 ?auto_21302 ) ) ( ON-TABLE ?auto_21302 ) ( ON ?auto_21301 ?auto_21302 ) ( CLEAR ?auto_21299 ) ( ON ?auto_21300 ?auto_21301 ) ( CLEAR ?auto_21300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21302 ?auto_21301 )
      ( MAKE-5PILE ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21301 ?auto_21302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21303 - BLOCK
      ?auto_21304 - BLOCK
      ?auto_21305 - BLOCK
      ?auto_21306 - BLOCK
      ?auto_21307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21303 ) ( not ( = ?auto_21303 ?auto_21304 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21306 ) ) ( not ( = ?auto_21303 ?auto_21307 ) ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21304 ?auto_21306 ) ) ( not ( = ?auto_21304 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21306 ) ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21306 ?auto_21307 ) ) ( ON-TABLE ?auto_21307 ) ( ON ?auto_21306 ?auto_21307 ) ( ON ?auto_21305 ?auto_21306 ) ( CLEAR ?auto_21305 ) ( HOLDING ?auto_21304 ) ( CLEAR ?auto_21303 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21303 ?auto_21304 )
      ( MAKE-5PILE ?auto_21303 ?auto_21304 ?auto_21305 ?auto_21306 ?auto_21307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21308 - BLOCK
      ?auto_21309 - BLOCK
      ?auto_21310 - BLOCK
      ?auto_21311 - BLOCK
      ?auto_21312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21308 ) ( not ( = ?auto_21308 ?auto_21309 ) ) ( not ( = ?auto_21308 ?auto_21310 ) ) ( not ( = ?auto_21308 ?auto_21311 ) ) ( not ( = ?auto_21308 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21310 ) ) ( not ( = ?auto_21309 ?auto_21311 ) ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21311 ) ) ( not ( = ?auto_21310 ?auto_21312 ) ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( ON-TABLE ?auto_21312 ) ( ON ?auto_21311 ?auto_21312 ) ( ON ?auto_21310 ?auto_21311 ) ( CLEAR ?auto_21308 ) ( ON ?auto_21309 ?auto_21310 ) ( CLEAR ?auto_21309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21312 ?auto_21311 ?auto_21310 )
      ( MAKE-5PILE ?auto_21308 ?auto_21309 ?auto_21310 ?auto_21311 ?auto_21312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21313 - BLOCK
      ?auto_21314 - BLOCK
      ?auto_21315 - BLOCK
      ?auto_21316 - BLOCK
      ?auto_21317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21313 ?auto_21314 ) ) ( not ( = ?auto_21313 ?auto_21315 ) ) ( not ( = ?auto_21313 ?auto_21316 ) ) ( not ( = ?auto_21313 ?auto_21317 ) ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( not ( = ?auto_21314 ?auto_21316 ) ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( ON-TABLE ?auto_21317 ) ( ON ?auto_21316 ?auto_21317 ) ( ON ?auto_21315 ?auto_21316 ) ( ON ?auto_21314 ?auto_21315 ) ( CLEAR ?auto_21314 ) ( HOLDING ?auto_21313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21313 )
      ( MAKE-5PILE ?auto_21313 ?auto_21314 ?auto_21315 ?auto_21316 ?auto_21317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21318 - BLOCK
      ?auto_21319 - BLOCK
      ?auto_21320 - BLOCK
      ?auto_21321 - BLOCK
      ?auto_21322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21318 ?auto_21319 ) ) ( not ( = ?auto_21318 ?auto_21320 ) ) ( not ( = ?auto_21318 ?auto_21321 ) ) ( not ( = ?auto_21318 ?auto_21322 ) ) ( not ( = ?auto_21319 ?auto_21320 ) ) ( not ( = ?auto_21319 ?auto_21321 ) ) ( not ( = ?auto_21319 ?auto_21322 ) ) ( not ( = ?auto_21320 ?auto_21321 ) ) ( not ( = ?auto_21320 ?auto_21322 ) ) ( not ( = ?auto_21321 ?auto_21322 ) ) ( ON-TABLE ?auto_21322 ) ( ON ?auto_21321 ?auto_21322 ) ( ON ?auto_21320 ?auto_21321 ) ( ON ?auto_21319 ?auto_21320 ) ( ON ?auto_21318 ?auto_21319 ) ( CLEAR ?auto_21318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21322 ?auto_21321 ?auto_21320 ?auto_21319 )
      ( MAKE-5PILE ?auto_21318 ?auto_21319 ?auto_21320 ?auto_21321 ?auto_21322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21328 - BLOCK
      ?auto_21329 - BLOCK
      ?auto_21330 - BLOCK
      ?auto_21331 - BLOCK
      ?auto_21332 - BLOCK
    )
    :vars
    (
      ?auto_21333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21328 ?auto_21329 ) ) ( not ( = ?auto_21328 ?auto_21330 ) ) ( not ( = ?auto_21328 ?auto_21331 ) ) ( not ( = ?auto_21328 ?auto_21332 ) ) ( not ( = ?auto_21329 ?auto_21330 ) ) ( not ( = ?auto_21329 ?auto_21331 ) ) ( not ( = ?auto_21329 ?auto_21332 ) ) ( not ( = ?auto_21330 ?auto_21331 ) ) ( not ( = ?auto_21330 ?auto_21332 ) ) ( not ( = ?auto_21331 ?auto_21332 ) ) ( ON-TABLE ?auto_21332 ) ( ON ?auto_21331 ?auto_21332 ) ( ON ?auto_21330 ?auto_21331 ) ( ON ?auto_21329 ?auto_21330 ) ( CLEAR ?auto_21329 ) ( ON ?auto_21328 ?auto_21333 ) ( CLEAR ?auto_21328 ) ( HAND-EMPTY ) ( not ( = ?auto_21328 ?auto_21333 ) ) ( not ( = ?auto_21329 ?auto_21333 ) ) ( not ( = ?auto_21330 ?auto_21333 ) ) ( not ( = ?auto_21331 ?auto_21333 ) ) ( not ( = ?auto_21332 ?auto_21333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21328 ?auto_21333 )
      ( MAKE-5PILE ?auto_21328 ?auto_21329 ?auto_21330 ?auto_21331 ?auto_21332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21334 - BLOCK
      ?auto_21335 - BLOCK
      ?auto_21336 - BLOCK
      ?auto_21337 - BLOCK
      ?auto_21338 - BLOCK
    )
    :vars
    (
      ?auto_21339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21334 ?auto_21335 ) ) ( not ( = ?auto_21334 ?auto_21336 ) ) ( not ( = ?auto_21334 ?auto_21337 ) ) ( not ( = ?auto_21334 ?auto_21338 ) ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21337 ) ) ( not ( = ?auto_21335 ?auto_21338 ) ) ( not ( = ?auto_21336 ?auto_21337 ) ) ( not ( = ?auto_21336 ?auto_21338 ) ) ( not ( = ?auto_21337 ?auto_21338 ) ) ( ON-TABLE ?auto_21338 ) ( ON ?auto_21337 ?auto_21338 ) ( ON ?auto_21336 ?auto_21337 ) ( ON ?auto_21334 ?auto_21339 ) ( CLEAR ?auto_21334 ) ( not ( = ?auto_21334 ?auto_21339 ) ) ( not ( = ?auto_21335 ?auto_21339 ) ) ( not ( = ?auto_21336 ?auto_21339 ) ) ( not ( = ?auto_21337 ?auto_21339 ) ) ( not ( = ?auto_21338 ?auto_21339 ) ) ( HOLDING ?auto_21335 ) ( CLEAR ?auto_21336 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21338 ?auto_21337 ?auto_21336 ?auto_21335 )
      ( MAKE-5PILE ?auto_21334 ?auto_21335 ?auto_21336 ?auto_21337 ?auto_21338 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21340 - BLOCK
      ?auto_21341 - BLOCK
      ?auto_21342 - BLOCK
      ?auto_21343 - BLOCK
      ?auto_21344 - BLOCK
    )
    :vars
    (
      ?auto_21345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21340 ?auto_21341 ) ) ( not ( = ?auto_21340 ?auto_21342 ) ) ( not ( = ?auto_21340 ?auto_21343 ) ) ( not ( = ?auto_21340 ?auto_21344 ) ) ( not ( = ?auto_21341 ?auto_21342 ) ) ( not ( = ?auto_21341 ?auto_21343 ) ) ( not ( = ?auto_21341 ?auto_21344 ) ) ( not ( = ?auto_21342 ?auto_21343 ) ) ( not ( = ?auto_21342 ?auto_21344 ) ) ( not ( = ?auto_21343 ?auto_21344 ) ) ( ON-TABLE ?auto_21344 ) ( ON ?auto_21343 ?auto_21344 ) ( ON ?auto_21342 ?auto_21343 ) ( ON ?auto_21340 ?auto_21345 ) ( not ( = ?auto_21340 ?auto_21345 ) ) ( not ( = ?auto_21341 ?auto_21345 ) ) ( not ( = ?auto_21342 ?auto_21345 ) ) ( not ( = ?auto_21343 ?auto_21345 ) ) ( not ( = ?auto_21344 ?auto_21345 ) ) ( CLEAR ?auto_21342 ) ( ON ?auto_21341 ?auto_21340 ) ( CLEAR ?auto_21341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21345 ?auto_21340 )
      ( MAKE-5PILE ?auto_21340 ?auto_21341 ?auto_21342 ?auto_21343 ?auto_21344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21346 - BLOCK
      ?auto_21347 - BLOCK
      ?auto_21348 - BLOCK
      ?auto_21349 - BLOCK
      ?auto_21350 - BLOCK
    )
    :vars
    (
      ?auto_21351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21346 ?auto_21347 ) ) ( not ( = ?auto_21346 ?auto_21348 ) ) ( not ( = ?auto_21346 ?auto_21349 ) ) ( not ( = ?auto_21346 ?auto_21350 ) ) ( not ( = ?auto_21347 ?auto_21348 ) ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( not ( = ?auto_21347 ?auto_21350 ) ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21348 ?auto_21350 ) ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( ON-TABLE ?auto_21350 ) ( ON ?auto_21349 ?auto_21350 ) ( ON ?auto_21346 ?auto_21351 ) ( not ( = ?auto_21346 ?auto_21351 ) ) ( not ( = ?auto_21347 ?auto_21351 ) ) ( not ( = ?auto_21348 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( not ( = ?auto_21350 ?auto_21351 ) ) ( ON ?auto_21347 ?auto_21346 ) ( CLEAR ?auto_21347 ) ( ON-TABLE ?auto_21351 ) ( HOLDING ?auto_21348 ) ( CLEAR ?auto_21349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21350 ?auto_21349 ?auto_21348 )
      ( MAKE-5PILE ?auto_21346 ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21352 - BLOCK
      ?auto_21353 - BLOCK
      ?auto_21354 - BLOCK
      ?auto_21355 - BLOCK
      ?auto_21356 - BLOCK
    )
    :vars
    (
      ?auto_21357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21352 ?auto_21353 ) ) ( not ( = ?auto_21352 ?auto_21354 ) ) ( not ( = ?auto_21352 ?auto_21355 ) ) ( not ( = ?auto_21352 ?auto_21356 ) ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21355 ) ) ( not ( = ?auto_21353 ?auto_21356 ) ) ( not ( = ?auto_21354 ?auto_21355 ) ) ( not ( = ?auto_21354 ?auto_21356 ) ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( ON-TABLE ?auto_21356 ) ( ON ?auto_21355 ?auto_21356 ) ( ON ?auto_21352 ?auto_21357 ) ( not ( = ?auto_21352 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21357 ) ) ( not ( = ?auto_21354 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( ON ?auto_21353 ?auto_21352 ) ( ON-TABLE ?auto_21357 ) ( CLEAR ?auto_21355 ) ( ON ?auto_21354 ?auto_21353 ) ( CLEAR ?auto_21354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21357 ?auto_21352 ?auto_21353 )
      ( MAKE-5PILE ?auto_21352 ?auto_21353 ?auto_21354 ?auto_21355 ?auto_21356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21358 - BLOCK
      ?auto_21359 - BLOCK
      ?auto_21360 - BLOCK
      ?auto_21361 - BLOCK
      ?auto_21362 - BLOCK
    )
    :vars
    (
      ?auto_21363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21361 ) ) ( not ( = ?auto_21358 ?auto_21362 ) ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( not ( = ?auto_21359 ?auto_21361 ) ) ( not ( = ?auto_21359 ?auto_21362 ) ) ( not ( = ?auto_21360 ?auto_21361 ) ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( ON-TABLE ?auto_21362 ) ( ON ?auto_21358 ?auto_21363 ) ( not ( = ?auto_21358 ?auto_21363 ) ) ( not ( = ?auto_21359 ?auto_21363 ) ) ( not ( = ?auto_21360 ?auto_21363 ) ) ( not ( = ?auto_21361 ?auto_21363 ) ) ( not ( = ?auto_21362 ?auto_21363 ) ) ( ON ?auto_21359 ?auto_21358 ) ( ON-TABLE ?auto_21363 ) ( ON ?auto_21360 ?auto_21359 ) ( CLEAR ?auto_21360 ) ( HOLDING ?auto_21361 ) ( CLEAR ?auto_21362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21362 ?auto_21361 )
      ( MAKE-5PILE ?auto_21358 ?auto_21359 ?auto_21360 ?auto_21361 ?auto_21362 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21364 - BLOCK
      ?auto_21365 - BLOCK
      ?auto_21366 - BLOCK
      ?auto_21367 - BLOCK
      ?auto_21368 - BLOCK
    )
    :vars
    (
      ?auto_21369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21364 ?auto_21365 ) ) ( not ( = ?auto_21364 ?auto_21366 ) ) ( not ( = ?auto_21364 ?auto_21367 ) ) ( not ( = ?auto_21364 ?auto_21368 ) ) ( not ( = ?auto_21365 ?auto_21366 ) ) ( not ( = ?auto_21365 ?auto_21367 ) ) ( not ( = ?auto_21365 ?auto_21368 ) ) ( not ( = ?auto_21366 ?auto_21367 ) ) ( not ( = ?auto_21366 ?auto_21368 ) ) ( not ( = ?auto_21367 ?auto_21368 ) ) ( ON-TABLE ?auto_21368 ) ( ON ?auto_21364 ?auto_21369 ) ( not ( = ?auto_21364 ?auto_21369 ) ) ( not ( = ?auto_21365 ?auto_21369 ) ) ( not ( = ?auto_21366 ?auto_21369 ) ) ( not ( = ?auto_21367 ?auto_21369 ) ) ( not ( = ?auto_21368 ?auto_21369 ) ) ( ON ?auto_21365 ?auto_21364 ) ( ON-TABLE ?auto_21369 ) ( ON ?auto_21366 ?auto_21365 ) ( CLEAR ?auto_21368 ) ( ON ?auto_21367 ?auto_21366 ) ( CLEAR ?auto_21367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21369 ?auto_21364 ?auto_21365 ?auto_21366 )
      ( MAKE-5PILE ?auto_21364 ?auto_21365 ?auto_21366 ?auto_21367 ?auto_21368 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21370 - BLOCK
      ?auto_21371 - BLOCK
      ?auto_21372 - BLOCK
      ?auto_21373 - BLOCK
      ?auto_21374 - BLOCK
    )
    :vars
    (
      ?auto_21375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21370 ?auto_21372 ) ) ( not ( = ?auto_21370 ?auto_21373 ) ) ( not ( = ?auto_21370 ?auto_21374 ) ) ( not ( = ?auto_21371 ?auto_21372 ) ) ( not ( = ?auto_21371 ?auto_21373 ) ) ( not ( = ?auto_21371 ?auto_21374 ) ) ( not ( = ?auto_21372 ?auto_21373 ) ) ( not ( = ?auto_21372 ?auto_21374 ) ) ( not ( = ?auto_21373 ?auto_21374 ) ) ( ON ?auto_21370 ?auto_21375 ) ( not ( = ?auto_21370 ?auto_21375 ) ) ( not ( = ?auto_21371 ?auto_21375 ) ) ( not ( = ?auto_21372 ?auto_21375 ) ) ( not ( = ?auto_21373 ?auto_21375 ) ) ( not ( = ?auto_21374 ?auto_21375 ) ) ( ON ?auto_21371 ?auto_21370 ) ( ON-TABLE ?auto_21375 ) ( ON ?auto_21372 ?auto_21371 ) ( ON ?auto_21373 ?auto_21372 ) ( CLEAR ?auto_21373 ) ( HOLDING ?auto_21374 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21374 )
      ( MAKE-5PILE ?auto_21370 ?auto_21371 ?auto_21372 ?auto_21373 ?auto_21374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21376 - BLOCK
      ?auto_21377 - BLOCK
      ?auto_21378 - BLOCK
      ?auto_21379 - BLOCK
      ?auto_21380 - BLOCK
    )
    :vars
    (
      ?auto_21381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21376 ?auto_21377 ) ) ( not ( = ?auto_21376 ?auto_21378 ) ) ( not ( = ?auto_21376 ?auto_21379 ) ) ( not ( = ?auto_21376 ?auto_21380 ) ) ( not ( = ?auto_21377 ?auto_21378 ) ) ( not ( = ?auto_21377 ?auto_21379 ) ) ( not ( = ?auto_21377 ?auto_21380 ) ) ( not ( = ?auto_21378 ?auto_21379 ) ) ( not ( = ?auto_21378 ?auto_21380 ) ) ( not ( = ?auto_21379 ?auto_21380 ) ) ( ON ?auto_21376 ?auto_21381 ) ( not ( = ?auto_21376 ?auto_21381 ) ) ( not ( = ?auto_21377 ?auto_21381 ) ) ( not ( = ?auto_21378 ?auto_21381 ) ) ( not ( = ?auto_21379 ?auto_21381 ) ) ( not ( = ?auto_21380 ?auto_21381 ) ) ( ON ?auto_21377 ?auto_21376 ) ( ON-TABLE ?auto_21381 ) ( ON ?auto_21378 ?auto_21377 ) ( ON ?auto_21379 ?auto_21378 ) ( ON ?auto_21380 ?auto_21379 ) ( CLEAR ?auto_21380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21381 ?auto_21376 ?auto_21377 ?auto_21378 ?auto_21379 )
      ( MAKE-5PILE ?auto_21376 ?auto_21377 ?auto_21378 ?auto_21379 ?auto_21380 ) )
  )

)

