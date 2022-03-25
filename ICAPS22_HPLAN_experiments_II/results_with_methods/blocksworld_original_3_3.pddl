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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2373 - BLOCK
      ?auto_2374 - BLOCK
      ?auto_2375 - BLOCK
    )
    :vars
    (
      ?auto_2376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2376 ?auto_2375 ) ( CLEAR ?auto_2376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2373 ) ( ON ?auto_2374 ?auto_2373 ) ( ON ?auto_2375 ?auto_2374 ) ( not ( = ?auto_2373 ?auto_2374 ) ) ( not ( = ?auto_2373 ?auto_2375 ) ) ( not ( = ?auto_2373 ?auto_2376 ) ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( not ( = ?auto_2374 ?auto_2376 ) ) ( not ( = ?auto_2375 ?auto_2376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2376 ?auto_2375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2378 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2379 - BLOCK
    )
    :vars
    (
      ?auto_2380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2379 ?auto_2380 ) ( CLEAR ?auto_2379 ) ( HAND-EMPTY ) ( not ( = ?auto_2379 ?auto_2380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2379 ?auto_2380 )
      ( MAKE-1PILE ?auto_2379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2383 - BLOCK
      ?auto_2384 - BLOCK
    )
    :vars
    (
      ?auto_2385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2385 ?auto_2384 ) ( CLEAR ?auto_2385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2383 ) ( ON ?auto_2384 ?auto_2383 ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2383 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2385 ?auto_2384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2386 - BLOCK
      ?auto_2387 - BLOCK
    )
    :vars
    (
      ?auto_2388 - BLOCK
      ?auto_2389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2388 ?auto_2387 ) ( CLEAR ?auto_2388 ) ( ON-TABLE ?auto_2386 ) ( ON ?auto_2387 ?auto_2386 ) ( not ( = ?auto_2386 ?auto_2387 ) ) ( not ( = ?auto_2386 ?auto_2388 ) ) ( not ( = ?auto_2387 ?auto_2388 ) ) ( HOLDING ?auto_2389 ) ( not ( = ?auto_2386 ?auto_2389 ) ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( not ( = ?auto_2388 ?auto_2389 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2389 )
      ( MAKE-2PILE ?auto_2386 ?auto_2387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2390 - BLOCK
      ?auto_2391 - BLOCK
    )
    :vars
    (
      ?auto_2393 - BLOCK
      ?auto_2392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2393 ?auto_2391 ) ( ON-TABLE ?auto_2390 ) ( ON ?auto_2391 ?auto_2390 ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( not ( = ?auto_2391 ?auto_2393 ) ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( not ( = ?auto_2391 ?auto_2392 ) ) ( not ( = ?auto_2393 ?auto_2392 ) ) ( ON ?auto_2392 ?auto_2393 ) ( CLEAR ?auto_2392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2390 ?auto_2391 ?auto_2393 )
      ( MAKE-2PILE ?auto_2390 ?auto_2391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2396 - BLOCK
      ?auto_2397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2397 ) ( CLEAR ?auto_2396 ) ( ON-TABLE ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2397 ) ) )
    :subtasks
    ( ( !STACK ?auto_2397 ?auto_2396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2398 - BLOCK
      ?auto_2399 - BLOCK
    )
    :vars
    (
      ?auto_2400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2398 ) ( ON-TABLE ?auto_2398 ) ( not ( = ?auto_2398 ?auto_2399 ) ) ( ON ?auto_2399 ?auto_2400 ) ( CLEAR ?auto_2399 ) ( HAND-EMPTY ) ( not ( = ?auto_2398 ?auto_2400 ) ) ( not ( = ?auto_2399 ?auto_2400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2399 ?auto_2400 )
      ( MAKE-2PILE ?auto_2398 ?auto_2399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2401 - BLOCK
      ?auto_2402 - BLOCK
    )
    :vars
    (
      ?auto_2403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2401 ?auto_2402 ) ) ( ON ?auto_2402 ?auto_2403 ) ( CLEAR ?auto_2402 ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( HOLDING ?auto_2401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2401 )
      ( MAKE-2PILE ?auto_2401 ?auto_2402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2404 - BLOCK
      ?auto_2405 - BLOCK
    )
    :vars
    (
      ?auto_2406 - BLOCK
      ?auto_2407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2404 ?auto_2405 ) ) ( ON ?auto_2405 ?auto_2406 ) ( not ( = ?auto_2404 ?auto_2406 ) ) ( not ( = ?auto_2405 ?auto_2406 ) ) ( ON ?auto_2404 ?auto_2405 ) ( CLEAR ?auto_2404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2407 ) ( ON ?auto_2406 ?auto_2407 ) ( not ( = ?auto_2407 ?auto_2406 ) ) ( not ( = ?auto_2407 ?auto_2405 ) ) ( not ( = ?auto_2407 ?auto_2404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2407 ?auto_2406 ?auto_2405 )
      ( MAKE-2PILE ?auto_2404 ?auto_2405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2409 - BLOCK
    )
    :vars
    (
      ?auto_2410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2410 ?auto_2409 ) ( CLEAR ?auto_2410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2409 ) ( not ( = ?auto_2409 ?auto_2410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2410 ?auto_2409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2411 - BLOCK
    )
    :vars
    (
      ?auto_2412 - BLOCK
      ?auto_2413 - BLOCK
      ?auto_2414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2412 ?auto_2411 ) ( CLEAR ?auto_2412 ) ( ON-TABLE ?auto_2411 ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( HOLDING ?auto_2413 ) ( CLEAR ?auto_2414 ) ( not ( = ?auto_2411 ?auto_2413 ) ) ( not ( = ?auto_2411 ?auto_2414 ) ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( not ( = ?auto_2412 ?auto_2414 ) ) ( not ( = ?auto_2413 ?auto_2414 ) ) )
    :subtasks
    ( ( !STACK ?auto_2413 ?auto_2414 )
      ( MAKE-1PILE ?auto_2411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2415 - BLOCK
    )
    :vars
    (
      ?auto_2418 - BLOCK
      ?auto_2417 - BLOCK
      ?auto_2416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2418 ?auto_2415 ) ( ON-TABLE ?auto_2415 ) ( not ( = ?auto_2415 ?auto_2418 ) ) ( CLEAR ?auto_2417 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( not ( = ?auto_2415 ?auto_2417 ) ) ( not ( = ?auto_2418 ?auto_2416 ) ) ( not ( = ?auto_2418 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( ON ?auto_2416 ?auto_2418 ) ( CLEAR ?auto_2416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2415 ?auto_2418 )
      ( MAKE-1PILE ?auto_2415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2419 - BLOCK
    )
    :vars
    (
      ?auto_2420 - BLOCK
      ?auto_2422 - BLOCK
      ?auto_2421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2420 ?auto_2419 ) ( ON-TABLE ?auto_2419 ) ( not ( = ?auto_2419 ?auto_2420 ) ) ( not ( = ?auto_2419 ?auto_2422 ) ) ( not ( = ?auto_2419 ?auto_2421 ) ) ( not ( = ?auto_2420 ?auto_2422 ) ) ( not ( = ?auto_2420 ?auto_2421 ) ) ( not ( = ?auto_2422 ?auto_2421 ) ) ( ON ?auto_2422 ?auto_2420 ) ( CLEAR ?auto_2422 ) ( HOLDING ?auto_2421 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2421 )
      ( MAKE-1PILE ?auto_2419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2423 - BLOCK
    )
    :vars
    (
      ?auto_2424 - BLOCK
      ?auto_2426 - BLOCK
      ?auto_2425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2424 ?auto_2423 ) ( ON-TABLE ?auto_2423 ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2423 ?auto_2426 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) ( not ( = ?auto_2424 ?auto_2426 ) ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( not ( = ?auto_2426 ?auto_2425 ) ) ( ON ?auto_2426 ?auto_2424 ) ( ON ?auto_2425 ?auto_2426 ) ( CLEAR ?auto_2425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2423 ?auto_2424 ?auto_2426 )
      ( MAKE-1PILE ?auto_2423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2430 - BLOCK
      ?auto_2431 - BLOCK
      ?auto_2432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2432 ) ( CLEAR ?auto_2431 ) ( ON-TABLE ?auto_2430 ) ( ON ?auto_2431 ?auto_2430 ) ( not ( = ?auto_2430 ?auto_2431 ) ) ( not ( = ?auto_2430 ?auto_2432 ) ) ( not ( = ?auto_2431 ?auto_2432 ) ) )
    :subtasks
    ( ( !STACK ?auto_2432 ?auto_2431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2433 - BLOCK
      ?auto_2434 - BLOCK
      ?auto_2435 - BLOCK
    )
    :vars
    (
      ?auto_2436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2434 ) ( ON-TABLE ?auto_2433 ) ( ON ?auto_2434 ?auto_2433 ) ( not ( = ?auto_2433 ?auto_2434 ) ) ( not ( = ?auto_2433 ?auto_2435 ) ) ( not ( = ?auto_2434 ?auto_2435 ) ) ( ON ?auto_2435 ?auto_2436 ) ( CLEAR ?auto_2435 ) ( HAND-EMPTY ) ( not ( = ?auto_2433 ?auto_2436 ) ) ( not ( = ?auto_2434 ?auto_2436 ) ) ( not ( = ?auto_2435 ?auto_2436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2435 ?auto_2436 )
      ( MAKE-3PILE ?auto_2433 ?auto_2434 ?auto_2435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2437 - BLOCK
      ?auto_2438 - BLOCK
      ?auto_2439 - BLOCK
    )
    :vars
    (
      ?auto_2440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2437 ) ( not ( = ?auto_2437 ?auto_2438 ) ) ( not ( = ?auto_2437 ?auto_2439 ) ) ( not ( = ?auto_2438 ?auto_2439 ) ) ( ON ?auto_2439 ?auto_2440 ) ( CLEAR ?auto_2439 ) ( not ( = ?auto_2437 ?auto_2440 ) ) ( not ( = ?auto_2438 ?auto_2440 ) ) ( not ( = ?auto_2439 ?auto_2440 ) ) ( HOLDING ?auto_2438 ) ( CLEAR ?auto_2437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2437 ?auto_2438 )
      ( MAKE-3PILE ?auto_2437 ?auto_2438 ?auto_2439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2441 - BLOCK
      ?auto_2442 - BLOCK
      ?auto_2443 - BLOCK
    )
    :vars
    (
      ?auto_2444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2441 ) ( not ( = ?auto_2441 ?auto_2442 ) ) ( not ( = ?auto_2441 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( ON ?auto_2443 ?auto_2444 ) ( not ( = ?auto_2441 ?auto_2444 ) ) ( not ( = ?auto_2442 ?auto_2444 ) ) ( not ( = ?auto_2443 ?auto_2444 ) ) ( CLEAR ?auto_2441 ) ( ON ?auto_2442 ?auto_2443 ) ( CLEAR ?auto_2442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2444 ?auto_2443 )
      ( MAKE-3PILE ?auto_2441 ?auto_2442 ?auto_2443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2445 - BLOCK
      ?auto_2446 - BLOCK
      ?auto_2447 - BLOCK
    )
    :vars
    (
      ?auto_2448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2445 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( ON ?auto_2447 ?auto_2448 ) ( not ( = ?auto_2445 ?auto_2448 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) ( not ( = ?auto_2447 ?auto_2448 ) ) ( ON ?auto_2446 ?auto_2447 ) ( CLEAR ?auto_2446 ) ( ON-TABLE ?auto_2448 ) ( HOLDING ?auto_2445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2445 )
      ( MAKE-3PILE ?auto_2445 ?auto_2446 ?auto_2447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2449 - BLOCK
      ?auto_2450 - BLOCK
      ?auto_2451 - BLOCK
    )
    :vars
    (
      ?auto_2452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2449 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2451 ) ) ( not ( = ?auto_2450 ?auto_2451 ) ) ( ON ?auto_2451 ?auto_2452 ) ( not ( = ?auto_2449 ?auto_2452 ) ) ( not ( = ?auto_2450 ?auto_2452 ) ) ( not ( = ?auto_2451 ?auto_2452 ) ) ( ON ?auto_2450 ?auto_2451 ) ( ON-TABLE ?auto_2452 ) ( ON ?auto_2449 ?auto_2450 ) ( CLEAR ?auto_2449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2452 ?auto_2451 ?auto_2450 )
      ( MAKE-3PILE ?auto_2449 ?auto_2450 ?auto_2451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2455 - BLOCK
      ?auto_2456 - BLOCK
    )
    :vars
    (
      ?auto_2457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2457 ?auto_2456 ) ( CLEAR ?auto_2457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2455 ) ( ON ?auto_2456 ?auto_2455 ) ( not ( = ?auto_2455 ?auto_2456 ) ) ( not ( = ?auto_2455 ?auto_2457 ) ) ( not ( = ?auto_2456 ?auto_2457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2457 ?auto_2456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2465 - BLOCK
      ?auto_2466 - BLOCK
    )
    :vars
    (
      ?auto_2467 - BLOCK
      ?auto_2468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2465 ) ( not ( = ?auto_2465 ?auto_2466 ) ) ( not ( = ?auto_2465 ?auto_2467 ) ) ( not ( = ?auto_2466 ?auto_2467 ) ) ( ON ?auto_2467 ?auto_2468 ) ( CLEAR ?auto_2467 ) ( not ( = ?auto_2465 ?auto_2468 ) ) ( not ( = ?auto_2466 ?auto_2468 ) ) ( not ( = ?auto_2467 ?auto_2468 ) ) ( HOLDING ?auto_2466 ) ( CLEAR ?auto_2465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2465 ?auto_2466 ?auto_2467 )
      ( MAKE-2PILE ?auto_2465 ?auto_2466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2469 - BLOCK
      ?auto_2470 - BLOCK
    )
    :vars
    (
      ?auto_2471 - BLOCK
      ?auto_2472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2469 ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( not ( = ?auto_2469 ?auto_2471 ) ) ( not ( = ?auto_2470 ?auto_2471 ) ) ( ON ?auto_2471 ?auto_2472 ) ( not ( = ?auto_2469 ?auto_2472 ) ) ( not ( = ?auto_2470 ?auto_2472 ) ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( CLEAR ?auto_2469 ) ( ON ?auto_2470 ?auto_2471 ) ( CLEAR ?auto_2470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2472 ?auto_2471 )
      ( MAKE-2PILE ?auto_2469 ?auto_2470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2473 - BLOCK
      ?auto_2474 - BLOCK
    )
    :vars
    (
      ?auto_2476 - BLOCK
      ?auto_2475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2473 ?auto_2474 ) ) ( not ( = ?auto_2473 ?auto_2476 ) ) ( not ( = ?auto_2474 ?auto_2476 ) ) ( ON ?auto_2476 ?auto_2475 ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( not ( = ?auto_2474 ?auto_2475 ) ) ( not ( = ?auto_2476 ?auto_2475 ) ) ( ON ?auto_2474 ?auto_2476 ) ( CLEAR ?auto_2474 ) ( ON-TABLE ?auto_2475 ) ( HOLDING ?auto_2473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2473 )
      ( MAKE-2PILE ?auto_2473 ?auto_2474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2477 - BLOCK
      ?auto_2478 - BLOCK
    )
    :vars
    (
      ?auto_2479 - BLOCK
      ?auto_2480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2477 ?auto_2478 ) ) ( not ( = ?auto_2477 ?auto_2479 ) ) ( not ( = ?auto_2478 ?auto_2479 ) ) ( ON ?auto_2479 ?auto_2480 ) ( not ( = ?auto_2477 ?auto_2480 ) ) ( not ( = ?auto_2478 ?auto_2480 ) ) ( not ( = ?auto_2479 ?auto_2480 ) ) ( ON ?auto_2478 ?auto_2479 ) ( ON-TABLE ?auto_2480 ) ( ON ?auto_2477 ?auto_2478 ) ( CLEAR ?auto_2477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2480 ?auto_2479 ?auto_2478 )
      ( MAKE-2PILE ?auto_2477 ?auto_2478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2483 - BLOCK
    )
    :vars
    (
      ?auto_2484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2483 ?auto_2484 ) ( CLEAR ?auto_2483 ) ( HAND-EMPTY ) ( not ( = ?auto_2483 ?auto_2484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2483 ?auto_2484 )
      ( MAKE-1PILE ?auto_2483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2485 - BLOCK
    )
    :vars
    (
      ?auto_2486 - BLOCK
      ?auto_2487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2485 ?auto_2486 ) ) ( HOLDING ?auto_2485 ) ( CLEAR ?auto_2486 ) ( ON-TABLE ?auto_2487 ) ( ON ?auto_2486 ?auto_2487 ) ( not ( = ?auto_2487 ?auto_2486 ) ) ( not ( = ?auto_2487 ?auto_2485 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2487 ?auto_2486 ?auto_2485 )
      ( MAKE-1PILE ?auto_2485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2488 - BLOCK
    )
    :vars
    (
      ?auto_2489 - BLOCK
      ?auto_2490 - BLOCK
      ?auto_2491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2488 ?auto_2489 ) ) ( CLEAR ?auto_2489 ) ( ON-TABLE ?auto_2490 ) ( ON ?auto_2489 ?auto_2490 ) ( not ( = ?auto_2490 ?auto_2489 ) ) ( not ( = ?auto_2490 ?auto_2488 ) ) ( ON ?auto_2488 ?auto_2491 ) ( CLEAR ?auto_2488 ) ( HAND-EMPTY ) ( not ( = ?auto_2488 ?auto_2491 ) ) ( not ( = ?auto_2489 ?auto_2491 ) ) ( not ( = ?auto_2490 ?auto_2491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2488 ?auto_2491 )
      ( MAKE-1PILE ?auto_2488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2492 - BLOCK
    )
    :vars
    (
      ?auto_2493 - BLOCK
      ?auto_2495 - BLOCK
      ?auto_2494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2492 ?auto_2493 ) ) ( ON-TABLE ?auto_2495 ) ( not ( = ?auto_2495 ?auto_2493 ) ) ( not ( = ?auto_2495 ?auto_2492 ) ) ( ON ?auto_2492 ?auto_2494 ) ( CLEAR ?auto_2492 ) ( not ( = ?auto_2492 ?auto_2494 ) ) ( not ( = ?auto_2493 ?auto_2494 ) ) ( not ( = ?auto_2495 ?auto_2494 ) ) ( HOLDING ?auto_2493 ) ( CLEAR ?auto_2495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2495 ?auto_2493 )
      ( MAKE-1PILE ?auto_2492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2496 - BLOCK
    )
    :vars
    (
      ?auto_2497 - BLOCK
      ?auto_2499 - BLOCK
      ?auto_2498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2496 ?auto_2497 ) ) ( ON-TABLE ?auto_2499 ) ( not ( = ?auto_2499 ?auto_2497 ) ) ( not ( = ?auto_2499 ?auto_2496 ) ) ( ON ?auto_2496 ?auto_2498 ) ( not ( = ?auto_2496 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( not ( = ?auto_2499 ?auto_2498 ) ) ( CLEAR ?auto_2499 ) ( ON ?auto_2497 ?auto_2496 ) ( CLEAR ?auto_2497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2498 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2498 ?auto_2496 )
      ( MAKE-1PILE ?auto_2496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2500 - BLOCK
    )
    :vars
    (
      ?auto_2501 - BLOCK
      ?auto_2503 - BLOCK
      ?auto_2502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2500 ?auto_2501 ) ) ( not ( = ?auto_2503 ?auto_2501 ) ) ( not ( = ?auto_2503 ?auto_2500 ) ) ( ON ?auto_2500 ?auto_2502 ) ( not ( = ?auto_2500 ?auto_2502 ) ) ( not ( = ?auto_2501 ?auto_2502 ) ) ( not ( = ?auto_2503 ?auto_2502 ) ) ( ON ?auto_2501 ?auto_2500 ) ( CLEAR ?auto_2501 ) ( ON-TABLE ?auto_2502 ) ( HOLDING ?auto_2503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2503 )
      ( MAKE-1PILE ?auto_2500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2504 - BLOCK
    )
    :vars
    (
      ?auto_2505 - BLOCK
      ?auto_2506 - BLOCK
      ?auto_2507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2504 ?auto_2505 ) ) ( not ( = ?auto_2506 ?auto_2505 ) ) ( not ( = ?auto_2506 ?auto_2504 ) ) ( ON ?auto_2504 ?auto_2507 ) ( not ( = ?auto_2504 ?auto_2507 ) ) ( not ( = ?auto_2505 ?auto_2507 ) ) ( not ( = ?auto_2506 ?auto_2507 ) ) ( ON ?auto_2505 ?auto_2504 ) ( ON-TABLE ?auto_2507 ) ( ON ?auto_2506 ?auto_2505 ) ( CLEAR ?auto_2506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2507 ?auto_2504 ?auto_2505 )
      ( MAKE-1PILE ?auto_2504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2509 - BLOCK
    )
    :vars
    (
      ?auto_2510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2510 ?auto_2509 ) ( CLEAR ?auto_2510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2509 ) ( not ( = ?auto_2509 ?auto_2510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2510 ?auto_2509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2511 - BLOCK
    )
    :vars
    (
      ?auto_2512 - BLOCK
      ?auto_2513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2512 ?auto_2511 ) ( CLEAR ?auto_2512 ) ( ON-TABLE ?auto_2511 ) ( not ( = ?auto_2511 ?auto_2512 ) ) ( HOLDING ?auto_2513 ) ( not ( = ?auto_2511 ?auto_2513 ) ) ( not ( = ?auto_2512 ?auto_2513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2513 )
      ( MAKE-1PILE ?auto_2511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2514 - BLOCK
    )
    :vars
    (
      ?auto_2515 - BLOCK
      ?auto_2516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2515 ?auto_2514 ) ( ON-TABLE ?auto_2514 ) ( not ( = ?auto_2514 ?auto_2515 ) ) ( not ( = ?auto_2514 ?auto_2516 ) ) ( not ( = ?auto_2515 ?auto_2516 ) ) ( ON ?auto_2516 ?auto_2515 ) ( CLEAR ?auto_2516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2514 ?auto_2515 )
      ( MAKE-1PILE ?auto_2514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2517 - BLOCK
    )
    :vars
    (
      ?auto_2519 - BLOCK
      ?auto_2518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2519 ?auto_2517 ) ( ON-TABLE ?auto_2517 ) ( not ( = ?auto_2517 ?auto_2519 ) ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2519 ?auto_2518 ) ) ( HOLDING ?auto_2518 ) ( CLEAR ?auto_2519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2517 ?auto_2519 ?auto_2518 )
      ( MAKE-1PILE ?auto_2517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2520 - BLOCK
    )
    :vars
    (
      ?auto_2522 - BLOCK
      ?auto_2521 - BLOCK
      ?auto_2523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2522 ?auto_2520 ) ( ON-TABLE ?auto_2520 ) ( not ( = ?auto_2520 ?auto_2522 ) ) ( not ( = ?auto_2520 ?auto_2521 ) ) ( not ( = ?auto_2522 ?auto_2521 ) ) ( CLEAR ?auto_2522 ) ( ON ?auto_2521 ?auto_2523 ) ( CLEAR ?auto_2521 ) ( HAND-EMPTY ) ( not ( = ?auto_2520 ?auto_2523 ) ) ( not ( = ?auto_2522 ?auto_2523 ) ) ( not ( = ?auto_2521 ?auto_2523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2521 ?auto_2523 )
      ( MAKE-1PILE ?auto_2520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2532 - BLOCK
    )
    :vars
    (
      ?auto_2535 - BLOCK
      ?auto_2533 - BLOCK
      ?auto_2534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2532 ?auto_2535 ) ) ( not ( = ?auto_2532 ?auto_2533 ) ) ( not ( = ?auto_2535 ?auto_2533 ) ) ( ON ?auto_2533 ?auto_2534 ) ( not ( = ?auto_2532 ?auto_2534 ) ) ( not ( = ?auto_2535 ?auto_2534 ) ) ( not ( = ?auto_2533 ?auto_2534 ) ) ( ON ?auto_2535 ?auto_2533 ) ( CLEAR ?auto_2535 ) ( HOLDING ?auto_2532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2532 ?auto_2535 )
      ( MAKE-1PILE ?auto_2532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2536 - BLOCK
    )
    :vars
    (
      ?auto_2539 - BLOCK
      ?auto_2537 - BLOCK
      ?auto_2538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( not ( = ?auto_2539 ?auto_2537 ) ) ( ON ?auto_2537 ?auto_2538 ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2539 ?auto_2538 ) ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( ON ?auto_2539 ?auto_2537 ) ( ON ?auto_2536 ?auto_2539 ) ( CLEAR ?auto_2536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2538 ?auto_2537 ?auto_2539 )
      ( MAKE-1PILE ?auto_2536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2542 - BLOCK
      ?auto_2543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2543 ) ( CLEAR ?auto_2542 ) ( ON-TABLE ?auto_2542 ) ( not ( = ?auto_2542 ?auto_2543 ) ) )
    :subtasks
    ( ( !STACK ?auto_2543 ?auto_2542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2544 - BLOCK
      ?auto_2545 - BLOCK
    )
    :vars
    (
      ?auto_2546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2544 ) ( ON-TABLE ?auto_2544 ) ( not ( = ?auto_2544 ?auto_2545 ) ) ( ON ?auto_2545 ?auto_2546 ) ( CLEAR ?auto_2545 ) ( HAND-EMPTY ) ( not ( = ?auto_2544 ?auto_2546 ) ) ( not ( = ?auto_2545 ?auto_2546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2545 ?auto_2546 )
      ( MAKE-2PILE ?auto_2544 ?auto_2545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2547 - BLOCK
      ?auto_2548 - BLOCK
    )
    :vars
    (
      ?auto_2549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2547 ?auto_2548 ) ) ( ON ?auto_2548 ?auto_2549 ) ( CLEAR ?auto_2548 ) ( not ( = ?auto_2547 ?auto_2549 ) ) ( not ( = ?auto_2548 ?auto_2549 ) ) ( HOLDING ?auto_2547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2547 )
      ( MAKE-2PILE ?auto_2547 ?auto_2548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2550 - BLOCK
      ?auto_2551 - BLOCK
    )
    :vars
    (
      ?auto_2552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2550 ?auto_2551 ) ) ( ON ?auto_2551 ?auto_2552 ) ( not ( = ?auto_2550 ?auto_2552 ) ) ( not ( = ?auto_2551 ?auto_2552 ) ) ( ON ?auto_2550 ?auto_2551 ) ( CLEAR ?auto_2550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2552 ?auto_2551 )
      ( MAKE-2PILE ?auto_2550 ?auto_2551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2553 - BLOCK
      ?auto_2554 - BLOCK
    )
    :vars
    (
      ?auto_2555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2553 ?auto_2554 ) ) ( ON ?auto_2554 ?auto_2555 ) ( not ( = ?auto_2553 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( ON-TABLE ?auto_2555 ) ( HOLDING ?auto_2553 ) ( CLEAR ?auto_2554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2555 ?auto_2554 ?auto_2553 )
      ( MAKE-2PILE ?auto_2553 ?auto_2554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2556 - BLOCK
      ?auto_2557 - BLOCK
    )
    :vars
    (
      ?auto_2558 - BLOCK
      ?auto_2559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2556 ?auto_2557 ) ) ( ON ?auto_2557 ?auto_2558 ) ( not ( = ?auto_2556 ?auto_2558 ) ) ( not ( = ?auto_2557 ?auto_2558 ) ) ( ON-TABLE ?auto_2558 ) ( CLEAR ?auto_2557 ) ( ON ?auto_2556 ?auto_2559 ) ( CLEAR ?auto_2556 ) ( HAND-EMPTY ) ( not ( = ?auto_2556 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2559 ) ) ( not ( = ?auto_2558 ?auto_2559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2556 ?auto_2559 )
      ( MAKE-2PILE ?auto_2556 ?auto_2557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2560 - BLOCK
      ?auto_2561 - BLOCK
    )
    :vars
    (
      ?auto_2562 - BLOCK
      ?auto_2563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2560 ?auto_2561 ) ) ( not ( = ?auto_2560 ?auto_2562 ) ) ( not ( = ?auto_2561 ?auto_2562 ) ) ( ON-TABLE ?auto_2562 ) ( ON ?auto_2560 ?auto_2563 ) ( CLEAR ?auto_2560 ) ( not ( = ?auto_2560 ?auto_2563 ) ) ( not ( = ?auto_2561 ?auto_2563 ) ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( HOLDING ?auto_2561 ) ( CLEAR ?auto_2562 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2562 ?auto_2561 )
      ( MAKE-2PILE ?auto_2560 ?auto_2561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2564 - BLOCK
      ?auto_2565 - BLOCK
    )
    :vars
    (
      ?auto_2566 - BLOCK
      ?auto_2567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( not ( = ?auto_2565 ?auto_2566 ) ) ( ON-TABLE ?auto_2566 ) ( ON ?auto_2564 ?auto_2567 ) ( not ( = ?auto_2564 ?auto_2567 ) ) ( not ( = ?auto_2565 ?auto_2567 ) ) ( not ( = ?auto_2566 ?auto_2567 ) ) ( CLEAR ?auto_2566 ) ( ON ?auto_2565 ?auto_2564 ) ( CLEAR ?auto_2565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2567 ?auto_2564 )
      ( MAKE-2PILE ?auto_2564 ?auto_2565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2568 - BLOCK
      ?auto_2569 - BLOCK
    )
    :vars
    (
      ?auto_2571 - BLOCK
      ?auto_2570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2568 ?auto_2569 ) ) ( not ( = ?auto_2568 ?auto_2571 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( ON ?auto_2568 ?auto_2570 ) ( not ( = ?auto_2568 ?auto_2570 ) ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2571 ?auto_2570 ) ) ( ON ?auto_2569 ?auto_2568 ) ( CLEAR ?auto_2569 ) ( ON-TABLE ?auto_2570 ) ( HOLDING ?auto_2571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2571 )
      ( MAKE-2PILE ?auto_2568 ?auto_2569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2572 - BLOCK
      ?auto_2573 - BLOCK
    )
    :vars
    (
      ?auto_2575 - BLOCK
      ?auto_2574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2572 ?auto_2573 ) ) ( not ( = ?auto_2572 ?auto_2575 ) ) ( not ( = ?auto_2573 ?auto_2575 ) ) ( ON ?auto_2572 ?auto_2574 ) ( not ( = ?auto_2572 ?auto_2574 ) ) ( not ( = ?auto_2573 ?auto_2574 ) ) ( not ( = ?auto_2575 ?auto_2574 ) ) ( ON ?auto_2573 ?auto_2572 ) ( ON-TABLE ?auto_2574 ) ( ON ?auto_2575 ?auto_2573 ) ( CLEAR ?auto_2575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2574 ?auto_2572 ?auto_2573 )
      ( MAKE-2PILE ?auto_2572 ?auto_2573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2579 - BLOCK
      ?auto_2580 - BLOCK
      ?auto_2581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2581 ) ( CLEAR ?auto_2580 ) ( ON-TABLE ?auto_2579 ) ( ON ?auto_2580 ?auto_2579 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( not ( = ?auto_2579 ?auto_2581 ) ) ( not ( = ?auto_2580 ?auto_2581 ) ) )
    :subtasks
    ( ( !STACK ?auto_2581 ?auto_2580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2582 - BLOCK
      ?auto_2583 - BLOCK
      ?auto_2584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2583 ) ( ON-TABLE ?auto_2582 ) ( ON ?auto_2583 ?auto_2582 ) ( not ( = ?auto_2582 ?auto_2583 ) ) ( not ( = ?auto_2582 ?auto_2584 ) ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( ON-TABLE ?auto_2584 ) ( CLEAR ?auto_2584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2584 )
      ( MAKE-3PILE ?auto_2582 ?auto_2583 ?auto_2584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2585 - BLOCK
      ?auto_2586 - BLOCK
      ?auto_2587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2585 ) ( not ( = ?auto_2585 ?auto_2586 ) ) ( not ( = ?auto_2585 ?auto_2587 ) ) ( not ( = ?auto_2586 ?auto_2587 ) ) ( ON-TABLE ?auto_2587 ) ( CLEAR ?auto_2587 ) ( HOLDING ?auto_2586 ) ( CLEAR ?auto_2585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2585 ?auto_2586 )
      ( MAKE-3PILE ?auto_2585 ?auto_2586 ?auto_2587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2588 - BLOCK
      ?auto_2589 - BLOCK
      ?auto_2590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2588 ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( not ( = ?auto_2588 ?auto_2590 ) ) ( not ( = ?auto_2589 ?auto_2590 ) ) ( ON-TABLE ?auto_2590 ) ( CLEAR ?auto_2588 ) ( ON ?auto_2589 ?auto_2590 ) ( CLEAR ?auto_2589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2590 )
      ( MAKE-3PILE ?auto_2588 ?auto_2589 ?auto_2590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2591 - BLOCK
      ?auto_2592 - BLOCK
      ?auto_2593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2591 ?auto_2592 ) ) ( not ( = ?auto_2591 ?auto_2593 ) ) ( not ( = ?auto_2592 ?auto_2593 ) ) ( ON-TABLE ?auto_2593 ) ( ON ?auto_2592 ?auto_2593 ) ( CLEAR ?auto_2592 ) ( HOLDING ?auto_2591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2591 )
      ( MAKE-3PILE ?auto_2591 ?auto_2592 ?auto_2593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2594 - BLOCK
      ?auto_2595 - BLOCK
      ?auto_2596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2594 ?auto_2595 ) ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2595 ?auto_2596 ) ) ( ON-TABLE ?auto_2596 ) ( ON ?auto_2595 ?auto_2596 ) ( ON ?auto_2594 ?auto_2595 ) ( CLEAR ?auto_2594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2596 ?auto_2595 )
      ( MAKE-3PILE ?auto_2594 ?auto_2595 ?auto_2596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2597 - BLOCK
      ?auto_2598 - BLOCK
      ?auto_2599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( ON-TABLE ?auto_2599 ) ( ON ?auto_2598 ?auto_2599 ) ( HOLDING ?auto_2597 ) ( CLEAR ?auto_2598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2599 ?auto_2598 ?auto_2597 )
      ( MAKE-3PILE ?auto_2597 ?auto_2598 ?auto_2599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2600 - BLOCK
      ?auto_2601 - BLOCK
      ?auto_2602 - BLOCK
    )
    :vars
    (
      ?auto_2603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2600 ?auto_2601 ) ) ( not ( = ?auto_2600 ?auto_2602 ) ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( ON-TABLE ?auto_2602 ) ( ON ?auto_2601 ?auto_2602 ) ( CLEAR ?auto_2601 ) ( ON ?auto_2600 ?auto_2603 ) ( CLEAR ?auto_2600 ) ( HAND-EMPTY ) ( not ( = ?auto_2600 ?auto_2603 ) ) ( not ( = ?auto_2601 ?auto_2603 ) ) ( not ( = ?auto_2602 ?auto_2603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2600 ?auto_2603 )
      ( MAKE-3PILE ?auto_2600 ?auto_2601 ?auto_2602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2604 - BLOCK
      ?auto_2605 - BLOCK
      ?auto_2606 - BLOCK
    )
    :vars
    (
      ?auto_2607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2604 ?auto_2605 ) ) ( not ( = ?auto_2604 ?auto_2606 ) ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( ON-TABLE ?auto_2606 ) ( ON ?auto_2604 ?auto_2607 ) ( CLEAR ?auto_2604 ) ( not ( = ?auto_2604 ?auto_2607 ) ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( HOLDING ?auto_2605 ) ( CLEAR ?auto_2606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2606 ?auto_2605 )
      ( MAKE-3PILE ?auto_2604 ?auto_2605 ?auto_2606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2608 - BLOCK
      ?auto_2609 - BLOCK
      ?auto_2610 - BLOCK
    )
    :vars
    (
      ?auto_2611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2608 ?auto_2609 ) ) ( not ( = ?auto_2608 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( ON-TABLE ?auto_2610 ) ( ON ?auto_2608 ?auto_2611 ) ( not ( = ?auto_2608 ?auto_2611 ) ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( not ( = ?auto_2610 ?auto_2611 ) ) ( CLEAR ?auto_2610 ) ( ON ?auto_2609 ?auto_2608 ) ( CLEAR ?auto_2609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2611 ?auto_2608 )
      ( MAKE-3PILE ?auto_2608 ?auto_2609 ?auto_2610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2612 - BLOCK
      ?auto_2613 - BLOCK
      ?auto_2614 - BLOCK
    )
    :vars
    (
      ?auto_2615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2612 ?auto_2613 ) ) ( not ( = ?auto_2612 ?auto_2614 ) ) ( not ( = ?auto_2613 ?auto_2614 ) ) ( ON ?auto_2612 ?auto_2615 ) ( not ( = ?auto_2612 ?auto_2615 ) ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( not ( = ?auto_2614 ?auto_2615 ) ) ( ON ?auto_2613 ?auto_2612 ) ( CLEAR ?auto_2613 ) ( ON-TABLE ?auto_2615 ) ( HOLDING ?auto_2614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2614 )
      ( MAKE-3PILE ?auto_2612 ?auto_2613 ?auto_2614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2616 - BLOCK
      ?auto_2617 - BLOCK
      ?auto_2618 - BLOCK
    )
    :vars
    (
      ?auto_2619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2616 ?auto_2618 ) ) ( not ( = ?auto_2617 ?auto_2618 ) ) ( ON ?auto_2616 ?auto_2619 ) ( not ( = ?auto_2616 ?auto_2619 ) ) ( not ( = ?auto_2617 ?auto_2619 ) ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( ON ?auto_2617 ?auto_2616 ) ( ON-TABLE ?auto_2619 ) ( ON ?auto_2618 ?auto_2617 ) ( CLEAR ?auto_2618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2619 ?auto_2616 ?auto_2617 )
      ( MAKE-3PILE ?auto_2616 ?auto_2617 ?auto_2618 ) )
  )

)

