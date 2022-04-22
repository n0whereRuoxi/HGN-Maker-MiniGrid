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
      ?auto_2456 - BLOCK
    )
    :vars
    (
      ?auto_2457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2456 ?auto_2457 ) ( CLEAR ?auto_2456 ) ( HAND-EMPTY ) ( not ( = ?auto_2456 ?auto_2457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2456 ?auto_2457 )
      ( !PUTDOWN ?auto_2456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2463 - BLOCK
      ?auto_2464 - BLOCK
    )
    :vars
    (
      ?auto_2465 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2463 ) ( ON ?auto_2464 ?auto_2465 ) ( CLEAR ?auto_2464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2463 ) ( not ( = ?auto_2463 ?auto_2464 ) ) ( not ( = ?auto_2463 ?auto_2465 ) ) ( not ( = ?auto_2464 ?auto_2465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2464 ?auto_2465 )
      ( !STACK ?auto_2464 ?auto_2463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2473 - BLOCK
      ?auto_2474 - BLOCK
    )
    :vars
    (
      ?auto_2475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2474 ?auto_2475 ) ( not ( = ?auto_2473 ?auto_2474 ) ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( not ( = ?auto_2474 ?auto_2475 ) ) ( ON ?auto_2473 ?auto_2474 ) ( CLEAR ?auto_2473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2473 )
      ( MAKE-2PILE ?auto_2473 ?auto_2474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2484 - BLOCK
      ?auto_2485 - BLOCK
      ?auto_2486 - BLOCK
    )
    :vars
    (
      ?auto_2487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2485 ) ( ON ?auto_2486 ?auto_2487 ) ( CLEAR ?auto_2486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2484 ) ( ON ?auto_2485 ?auto_2484 ) ( not ( = ?auto_2484 ?auto_2485 ) ) ( not ( = ?auto_2484 ?auto_2486 ) ) ( not ( = ?auto_2484 ?auto_2487 ) ) ( not ( = ?auto_2485 ?auto_2486 ) ) ( not ( = ?auto_2485 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2486 ?auto_2487 )
      ( !STACK ?auto_2486 ?auto_2485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2498 - BLOCK
      ?auto_2499 - BLOCK
      ?auto_2500 - BLOCK
    )
    :vars
    (
      ?auto_2501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2500 ?auto_2501 ) ( ON-TABLE ?auto_2498 ) ( not ( = ?auto_2498 ?auto_2499 ) ) ( not ( = ?auto_2498 ?auto_2500 ) ) ( not ( = ?auto_2498 ?auto_2501 ) ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2499 ?auto_2501 ) ) ( not ( = ?auto_2500 ?auto_2501 ) ) ( CLEAR ?auto_2498 ) ( ON ?auto_2499 ?auto_2500 ) ( CLEAR ?auto_2499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2498 ?auto_2499 )
      ( MAKE-3PILE ?auto_2498 ?auto_2499 ?auto_2500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2512 - BLOCK
      ?auto_2513 - BLOCK
      ?auto_2514 - BLOCK
    )
    :vars
    (
      ?auto_2515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2514 ?auto_2515 ) ( not ( = ?auto_2512 ?auto_2513 ) ) ( not ( = ?auto_2512 ?auto_2514 ) ) ( not ( = ?auto_2512 ?auto_2515 ) ) ( not ( = ?auto_2513 ?auto_2514 ) ) ( not ( = ?auto_2513 ?auto_2515 ) ) ( not ( = ?auto_2514 ?auto_2515 ) ) ( ON ?auto_2513 ?auto_2514 ) ( ON ?auto_2512 ?auto_2513 ) ( CLEAR ?auto_2512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2512 )
      ( MAKE-3PILE ?auto_2512 ?auto_2513 ?auto_2514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2527 - BLOCK
      ?auto_2528 - BLOCK
      ?auto_2529 - BLOCK
      ?auto_2530 - BLOCK
    )
    :vars
    (
      ?auto_2531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2529 ) ( ON ?auto_2530 ?auto_2531 ) ( CLEAR ?auto_2530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2527 ) ( ON ?auto_2528 ?auto_2527 ) ( ON ?auto_2529 ?auto_2528 ) ( not ( = ?auto_2527 ?auto_2528 ) ) ( not ( = ?auto_2527 ?auto_2529 ) ) ( not ( = ?auto_2527 ?auto_2530 ) ) ( not ( = ?auto_2527 ?auto_2531 ) ) ( not ( = ?auto_2528 ?auto_2529 ) ) ( not ( = ?auto_2528 ?auto_2530 ) ) ( not ( = ?auto_2528 ?auto_2531 ) ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( not ( = ?auto_2529 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2530 ?auto_2531 )
      ( !STACK ?auto_2530 ?auto_2529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2536 - BLOCK
      ?auto_2537 - BLOCK
      ?auto_2538 - BLOCK
      ?auto_2539 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2538 ) ( ON-TABLE ?auto_2539 ) ( CLEAR ?auto_2539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2536 ) ( ON ?auto_2537 ?auto_2536 ) ( ON ?auto_2538 ?auto_2537 ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( not ( = ?auto_2537 ?auto_2539 ) ) ( not ( = ?auto_2538 ?auto_2539 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2539 )
      ( !STACK ?auto_2539 ?auto_2538 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2544 - BLOCK
      ?auto_2545 - BLOCK
      ?auto_2546 - BLOCK
      ?auto_2547 - BLOCK
    )
    :vars
    (
      ?auto_2548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2547 ?auto_2548 ) ( ON-TABLE ?auto_2544 ) ( ON ?auto_2545 ?auto_2544 ) ( not ( = ?auto_2544 ?auto_2545 ) ) ( not ( = ?auto_2544 ?auto_2546 ) ) ( not ( = ?auto_2544 ?auto_2547 ) ) ( not ( = ?auto_2544 ?auto_2548 ) ) ( not ( = ?auto_2545 ?auto_2546 ) ) ( not ( = ?auto_2545 ?auto_2547 ) ) ( not ( = ?auto_2545 ?auto_2548 ) ) ( not ( = ?auto_2546 ?auto_2547 ) ) ( not ( = ?auto_2546 ?auto_2548 ) ) ( not ( = ?auto_2547 ?auto_2548 ) ) ( CLEAR ?auto_2545 ) ( ON ?auto_2546 ?auto_2547 ) ( CLEAR ?auto_2546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2544 ?auto_2545 ?auto_2546 )
      ( MAKE-4PILE ?auto_2544 ?auto_2545 ?auto_2546 ?auto_2547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2553 - BLOCK
      ?auto_2554 - BLOCK
      ?auto_2555 - BLOCK
      ?auto_2556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2556 ) ( ON-TABLE ?auto_2553 ) ( ON ?auto_2554 ?auto_2553 ) ( not ( = ?auto_2553 ?auto_2554 ) ) ( not ( = ?auto_2553 ?auto_2555 ) ) ( not ( = ?auto_2553 ?auto_2556 ) ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( CLEAR ?auto_2554 ) ( ON ?auto_2555 ?auto_2556 ) ( CLEAR ?auto_2555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2553 ?auto_2554 ?auto_2555 )
      ( MAKE-4PILE ?auto_2553 ?auto_2554 ?auto_2555 ?auto_2556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2561 - BLOCK
      ?auto_2562 - BLOCK
      ?auto_2563 - BLOCK
      ?auto_2564 - BLOCK
    )
    :vars
    (
      ?auto_2565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2564 ?auto_2565 ) ( ON-TABLE ?auto_2561 ) ( not ( = ?auto_2561 ?auto_2562 ) ) ( not ( = ?auto_2561 ?auto_2563 ) ) ( not ( = ?auto_2561 ?auto_2564 ) ) ( not ( = ?auto_2561 ?auto_2565 ) ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( not ( = ?auto_2562 ?auto_2564 ) ) ( not ( = ?auto_2562 ?auto_2565 ) ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( ON ?auto_2563 ?auto_2564 ) ( CLEAR ?auto_2561 ) ( ON ?auto_2562 ?auto_2563 ) ( CLEAR ?auto_2562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2561 ?auto_2562 )
      ( MAKE-4PILE ?auto_2561 ?auto_2562 ?auto_2563 ?auto_2564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2570 - BLOCK
      ?auto_2571 - BLOCK
      ?auto_2572 - BLOCK
      ?auto_2573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2573 ) ( ON-TABLE ?auto_2570 ) ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2572 ) ) ( not ( = ?auto_2570 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2572 ) ) ( not ( = ?auto_2571 ?auto_2573 ) ) ( not ( = ?auto_2572 ?auto_2573 ) ) ( ON ?auto_2572 ?auto_2573 ) ( CLEAR ?auto_2570 ) ( ON ?auto_2571 ?auto_2572 ) ( CLEAR ?auto_2571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2570 ?auto_2571 )
      ( MAKE-4PILE ?auto_2570 ?auto_2571 ?auto_2572 ?auto_2573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2578 - BLOCK
      ?auto_2579 - BLOCK
      ?auto_2580 - BLOCK
      ?auto_2581 - BLOCK
    )
    :vars
    (
      ?auto_2582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2581 ?auto_2582 ) ( not ( = ?auto_2578 ?auto_2579 ) ) ( not ( = ?auto_2578 ?auto_2580 ) ) ( not ( = ?auto_2578 ?auto_2581 ) ) ( not ( = ?auto_2578 ?auto_2582 ) ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( not ( = ?auto_2579 ?auto_2581 ) ) ( not ( = ?auto_2579 ?auto_2582 ) ) ( not ( = ?auto_2580 ?auto_2581 ) ) ( not ( = ?auto_2580 ?auto_2582 ) ) ( not ( = ?auto_2581 ?auto_2582 ) ) ( ON ?auto_2580 ?auto_2581 ) ( ON ?auto_2579 ?auto_2580 ) ( ON ?auto_2578 ?auto_2579 ) ( CLEAR ?auto_2578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2578 )
      ( MAKE-4PILE ?auto_2578 ?auto_2579 ?auto_2580 ?auto_2581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2587 - BLOCK
      ?auto_2588 - BLOCK
      ?auto_2589 - BLOCK
      ?auto_2590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2590 ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( not ( = ?auto_2587 ?auto_2589 ) ) ( not ( = ?auto_2587 ?auto_2590 ) ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( not ( = ?auto_2588 ?auto_2590 ) ) ( not ( = ?auto_2589 ?auto_2590 ) ) ( ON ?auto_2589 ?auto_2590 ) ( ON ?auto_2588 ?auto_2589 ) ( ON ?auto_2587 ?auto_2588 ) ( CLEAR ?auto_2587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2587 )
      ( MAKE-4PILE ?auto_2587 ?auto_2588 ?auto_2589 ?auto_2590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2595 - BLOCK
      ?auto_2596 - BLOCK
      ?auto_2597 - BLOCK
      ?auto_2598 - BLOCK
    )
    :vars
    (
      ?auto_2599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2595 ?auto_2596 ) ) ( not ( = ?auto_2595 ?auto_2597 ) ) ( not ( = ?auto_2595 ?auto_2598 ) ) ( not ( = ?auto_2596 ?auto_2597 ) ) ( not ( = ?auto_2596 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( ON ?auto_2595 ?auto_2599 ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2596 ?auto_2599 ) ) ( not ( = ?auto_2595 ?auto_2599 ) ) ( ON ?auto_2596 ?auto_2595 ) ( ON ?auto_2597 ?auto_2596 ) ( ON ?auto_2598 ?auto_2597 ) ( CLEAR ?auto_2598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2598 ?auto_2597 ?auto_2596 ?auto_2595 )
      ( MAKE-4PILE ?auto_2595 ?auto_2596 ?auto_2597 ?auto_2598 ) )
  )

)

