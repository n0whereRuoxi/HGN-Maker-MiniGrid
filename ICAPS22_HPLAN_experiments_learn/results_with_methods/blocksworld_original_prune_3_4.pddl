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
      ?auto_2371 - BLOCK
      ?auto_2372 - BLOCK
      ?auto_2373 - BLOCK
    )
    :vars
    (
      ?auto_2374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2374 ?auto_2373 ) ( CLEAR ?auto_2374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2371 ) ( ON ?auto_2372 ?auto_2371 ) ( ON ?auto_2373 ?auto_2372 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( not ( = ?auto_2371 ?auto_2373 ) ) ( not ( = ?auto_2371 ?auto_2374 ) ) ( not ( = ?auto_2372 ?auto_2373 ) ) ( not ( = ?auto_2372 ?auto_2374 ) ) ( not ( = ?auto_2373 ?auto_2374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2374 ?auto_2373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2376 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2377 - BLOCK
    )
    :vars
    (
      ?auto_2378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2377 ?auto_2378 ) ( CLEAR ?auto_2377 ) ( HAND-EMPTY ) ( not ( = ?auto_2377 ?auto_2378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2377 ?auto_2378 )
      ( MAKE-1PILE ?auto_2377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2381 - BLOCK
      ?auto_2382 - BLOCK
    )
    :vars
    (
      ?auto_2383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2383 ?auto_2382 ) ( CLEAR ?auto_2383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2381 ) ( ON ?auto_2382 ?auto_2381 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( not ( = ?auto_2381 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2383 ?auto_2382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2384 - BLOCK
      ?auto_2385 - BLOCK
    )
    :vars
    (
      ?auto_2386 - BLOCK
      ?auto_2387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2386 ?auto_2385 ) ( CLEAR ?auto_2386 ) ( ON-TABLE ?auto_2384 ) ( ON ?auto_2385 ?auto_2384 ) ( not ( = ?auto_2384 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2386 ) ) ( not ( = ?auto_2385 ?auto_2386 ) ) ( HOLDING ?auto_2387 ) ( not ( = ?auto_2384 ?auto_2387 ) ) ( not ( = ?auto_2385 ?auto_2387 ) ) ( not ( = ?auto_2386 ?auto_2387 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2387 )
      ( MAKE-2PILE ?auto_2384 ?auto_2385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2388 - BLOCK
      ?auto_2389 - BLOCK
    )
    :vars
    (
      ?auto_2391 - BLOCK
      ?auto_2390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2391 ?auto_2389 ) ( ON-TABLE ?auto_2388 ) ( ON ?auto_2389 ?auto_2388 ) ( not ( = ?auto_2388 ?auto_2389 ) ) ( not ( = ?auto_2388 ?auto_2391 ) ) ( not ( = ?auto_2389 ?auto_2391 ) ) ( not ( = ?auto_2388 ?auto_2390 ) ) ( not ( = ?auto_2389 ?auto_2390 ) ) ( not ( = ?auto_2391 ?auto_2390 ) ) ( ON ?auto_2390 ?auto_2391 ) ( CLEAR ?auto_2390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2388 ?auto_2389 ?auto_2391 )
      ( MAKE-2PILE ?auto_2388 ?auto_2389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2394 - BLOCK
      ?auto_2395 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2395 ) ( CLEAR ?auto_2394 ) ( ON-TABLE ?auto_2394 ) ( not ( = ?auto_2394 ?auto_2395 ) ) )
    :subtasks
    ( ( !STACK ?auto_2395 ?auto_2394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2396 - BLOCK
      ?auto_2397 - BLOCK
    )
    :vars
    (
      ?auto_2398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2396 ) ( ON-TABLE ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2397 ) ) ( ON ?auto_2397 ?auto_2398 ) ( CLEAR ?auto_2397 ) ( HAND-EMPTY ) ( not ( = ?auto_2396 ?auto_2398 ) ) ( not ( = ?auto_2397 ?auto_2398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2397 ?auto_2398 )
      ( MAKE-2PILE ?auto_2396 ?auto_2397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2399 - BLOCK
      ?auto_2400 - BLOCK
    )
    :vars
    (
      ?auto_2401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2399 ?auto_2400 ) ) ( ON ?auto_2400 ?auto_2401 ) ( CLEAR ?auto_2400 ) ( not ( = ?auto_2399 ?auto_2401 ) ) ( not ( = ?auto_2400 ?auto_2401 ) ) ( HOLDING ?auto_2399 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2399 )
      ( MAKE-2PILE ?auto_2399 ?auto_2400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2402 - BLOCK
      ?auto_2403 - BLOCK
    )
    :vars
    (
      ?auto_2404 - BLOCK
      ?auto_2405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2402 ?auto_2403 ) ) ( ON ?auto_2403 ?auto_2404 ) ( not ( = ?auto_2402 ?auto_2404 ) ) ( not ( = ?auto_2403 ?auto_2404 ) ) ( ON ?auto_2402 ?auto_2403 ) ( CLEAR ?auto_2402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2405 ) ( ON ?auto_2404 ?auto_2405 ) ( not ( = ?auto_2405 ?auto_2404 ) ) ( not ( = ?auto_2405 ?auto_2403 ) ) ( not ( = ?auto_2405 ?auto_2402 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2405 ?auto_2404 ?auto_2403 )
      ( MAKE-2PILE ?auto_2402 ?auto_2403 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2407 - BLOCK
    )
    :vars
    (
      ?auto_2408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2408 ?auto_2407 ) ( CLEAR ?auto_2408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2407 ) ( not ( = ?auto_2407 ?auto_2408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2408 ?auto_2407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2409 - BLOCK
    )
    :vars
    (
      ?auto_2410 - BLOCK
      ?auto_2411 - BLOCK
      ?auto_2412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2410 ?auto_2409 ) ( CLEAR ?auto_2410 ) ( ON-TABLE ?auto_2409 ) ( not ( = ?auto_2409 ?auto_2410 ) ) ( HOLDING ?auto_2411 ) ( CLEAR ?auto_2412 ) ( not ( = ?auto_2409 ?auto_2411 ) ) ( not ( = ?auto_2409 ?auto_2412 ) ) ( not ( = ?auto_2410 ?auto_2411 ) ) ( not ( = ?auto_2410 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2412 ) ) )
    :subtasks
    ( ( !STACK ?auto_2411 ?auto_2412 )
      ( MAKE-1PILE ?auto_2409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2499 - BLOCK
    )
    :vars
    (
      ?auto_2500 - BLOCK
      ?auto_2501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2500 ?auto_2499 ) ( ON-TABLE ?auto_2499 ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2499 ?auto_2501 ) ) ( not ( = ?auto_2500 ?auto_2501 ) ) ( ON ?auto_2501 ?auto_2500 ) ( CLEAR ?auto_2501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2499 ?auto_2500 )
      ( MAKE-1PILE ?auto_2499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2417 - BLOCK
    )
    :vars
    (
      ?auto_2420 - BLOCK
      ?auto_2419 - BLOCK
      ?auto_2418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2420 ?auto_2417 ) ( ON-TABLE ?auto_2417 ) ( not ( = ?auto_2417 ?auto_2420 ) ) ( not ( = ?auto_2417 ?auto_2419 ) ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( not ( = ?auto_2420 ?auto_2419 ) ) ( not ( = ?auto_2420 ?auto_2418 ) ) ( not ( = ?auto_2419 ?auto_2418 ) ) ( ON ?auto_2419 ?auto_2420 ) ( CLEAR ?auto_2419 ) ( HOLDING ?auto_2418 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2418 )
      ( MAKE-1PILE ?auto_2417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2421 - BLOCK
    )
    :vars
    (
      ?auto_2424 - BLOCK
      ?auto_2423 - BLOCK
      ?auto_2422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2424 ?auto_2421 ) ( ON-TABLE ?auto_2421 ) ( not ( = ?auto_2421 ?auto_2424 ) ) ( not ( = ?auto_2421 ?auto_2423 ) ) ( not ( = ?auto_2421 ?auto_2422 ) ) ( not ( = ?auto_2424 ?auto_2423 ) ) ( not ( = ?auto_2424 ?auto_2422 ) ) ( not ( = ?auto_2423 ?auto_2422 ) ) ( ON ?auto_2423 ?auto_2424 ) ( ON ?auto_2422 ?auto_2423 ) ( CLEAR ?auto_2422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2421 ?auto_2424 ?auto_2423 )
      ( MAKE-1PILE ?auto_2421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2428 - BLOCK
      ?auto_2429 - BLOCK
      ?auto_2430 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2430 ) ( CLEAR ?auto_2429 ) ( ON-TABLE ?auto_2428 ) ( ON ?auto_2429 ?auto_2428 ) ( not ( = ?auto_2428 ?auto_2429 ) ) ( not ( = ?auto_2428 ?auto_2430 ) ) ( not ( = ?auto_2429 ?auto_2430 ) ) )
    :subtasks
    ( ( !STACK ?auto_2430 ?auto_2429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2431 - BLOCK
      ?auto_2432 - BLOCK
      ?auto_2433 - BLOCK
    )
    :vars
    (
      ?auto_2434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2432 ) ( ON-TABLE ?auto_2431 ) ( ON ?auto_2432 ?auto_2431 ) ( not ( = ?auto_2431 ?auto_2432 ) ) ( not ( = ?auto_2431 ?auto_2433 ) ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( ON ?auto_2433 ?auto_2434 ) ( CLEAR ?auto_2433 ) ( HAND-EMPTY ) ( not ( = ?auto_2431 ?auto_2434 ) ) ( not ( = ?auto_2432 ?auto_2434 ) ) ( not ( = ?auto_2433 ?auto_2434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2433 ?auto_2434 )
      ( MAKE-3PILE ?auto_2431 ?auto_2432 ?auto_2433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2435 - BLOCK
      ?auto_2436 - BLOCK
      ?auto_2437 - BLOCK
    )
    :vars
    (
      ?auto_2438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2435 ) ( not ( = ?auto_2435 ?auto_2436 ) ) ( not ( = ?auto_2435 ?auto_2437 ) ) ( not ( = ?auto_2436 ?auto_2437 ) ) ( ON ?auto_2437 ?auto_2438 ) ( CLEAR ?auto_2437 ) ( not ( = ?auto_2435 ?auto_2438 ) ) ( not ( = ?auto_2436 ?auto_2438 ) ) ( not ( = ?auto_2437 ?auto_2438 ) ) ( HOLDING ?auto_2436 ) ( CLEAR ?auto_2435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2435 ?auto_2436 )
      ( MAKE-3PILE ?auto_2435 ?auto_2436 ?auto_2437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2439 - BLOCK
      ?auto_2440 - BLOCK
      ?auto_2441 - BLOCK
    )
    :vars
    (
      ?auto_2442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2439 ) ( not ( = ?auto_2439 ?auto_2440 ) ) ( not ( = ?auto_2439 ?auto_2441 ) ) ( not ( = ?auto_2440 ?auto_2441 ) ) ( ON ?auto_2441 ?auto_2442 ) ( not ( = ?auto_2439 ?auto_2442 ) ) ( not ( = ?auto_2440 ?auto_2442 ) ) ( not ( = ?auto_2441 ?auto_2442 ) ) ( CLEAR ?auto_2439 ) ( ON ?auto_2440 ?auto_2441 ) ( CLEAR ?auto_2440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2442 ?auto_2441 )
      ( MAKE-3PILE ?auto_2439 ?auto_2440 ?auto_2441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2443 - BLOCK
      ?auto_2444 - BLOCK
      ?auto_2445 - BLOCK
    )
    :vars
    (
      ?auto_2446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2443 ?auto_2444 ) ) ( not ( = ?auto_2443 ?auto_2445 ) ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( ON ?auto_2445 ?auto_2446 ) ( not ( = ?auto_2443 ?auto_2446 ) ) ( not ( = ?auto_2444 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2446 ) ) ( ON ?auto_2444 ?auto_2445 ) ( CLEAR ?auto_2444 ) ( ON-TABLE ?auto_2446 ) ( HOLDING ?auto_2443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2443 )
      ( MAKE-3PILE ?auto_2443 ?auto_2444 ?auto_2445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2447 - BLOCK
      ?auto_2448 - BLOCK
      ?auto_2449 - BLOCK
    )
    :vars
    (
      ?auto_2450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2447 ?auto_2448 ) ) ( not ( = ?auto_2447 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( ON ?auto_2449 ?auto_2450 ) ( not ( = ?auto_2447 ?auto_2450 ) ) ( not ( = ?auto_2448 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2450 ) ) ( ON ?auto_2448 ?auto_2449 ) ( ON-TABLE ?auto_2450 ) ( ON ?auto_2447 ?auto_2448 ) ( CLEAR ?auto_2447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2450 ?auto_2449 ?auto_2448 )
      ( MAKE-3PILE ?auto_2447 ?auto_2448 ?auto_2449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2477 - BLOCK
    )
    :vars
    (
      ?auto_2478 - BLOCK
      ?auto_2479 - BLOCK
      ?auto_2480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2477 ?auto_2478 ) ( CLEAR ?auto_2477 ) ( not ( = ?auto_2477 ?auto_2478 ) ) ( HOLDING ?auto_2479 ) ( CLEAR ?auto_2480 ) ( not ( = ?auto_2477 ?auto_2479 ) ) ( not ( = ?auto_2477 ?auto_2480 ) ) ( not ( = ?auto_2478 ?auto_2479 ) ) ( not ( = ?auto_2478 ?auto_2480 ) ) ( not ( = ?auto_2479 ?auto_2480 ) ) )
    :subtasks
    ( ( !STACK ?auto_2479 ?auto_2480 )
      ( MAKE-1PILE ?auto_2477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2481 - BLOCK
    )
    :vars
    (
      ?auto_2484 - BLOCK
      ?auto_2483 - BLOCK
      ?auto_2482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2481 ?auto_2484 ) ( not ( = ?auto_2481 ?auto_2484 ) ) ( CLEAR ?auto_2483 ) ( not ( = ?auto_2481 ?auto_2482 ) ) ( not ( = ?auto_2481 ?auto_2483 ) ) ( not ( = ?auto_2484 ?auto_2482 ) ) ( not ( = ?auto_2484 ?auto_2483 ) ) ( not ( = ?auto_2482 ?auto_2483 ) ) ( ON ?auto_2482 ?auto_2481 ) ( CLEAR ?auto_2482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2484 ?auto_2481 )
      ( MAKE-1PILE ?auto_2481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2485 - BLOCK
    )
    :vars
    (
      ?auto_2486 - BLOCK
      ?auto_2488 - BLOCK
      ?auto_2487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2485 ?auto_2486 ) ( not ( = ?auto_2485 ?auto_2486 ) ) ( not ( = ?auto_2485 ?auto_2488 ) ) ( not ( = ?auto_2485 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2487 ) ) ( not ( = ?auto_2488 ?auto_2487 ) ) ( ON ?auto_2488 ?auto_2485 ) ( CLEAR ?auto_2488 ) ( ON-TABLE ?auto_2486 ) ( HOLDING ?auto_2487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2487 )
      ( MAKE-1PILE ?auto_2485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2489 - BLOCK
    )
    :vars
    (
      ?auto_2491 - BLOCK
      ?auto_2492 - BLOCK
      ?auto_2490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2489 ?auto_2491 ) ( not ( = ?auto_2489 ?auto_2491 ) ) ( not ( = ?auto_2489 ?auto_2492 ) ) ( not ( = ?auto_2489 ?auto_2490 ) ) ( not ( = ?auto_2491 ?auto_2492 ) ) ( not ( = ?auto_2491 ?auto_2490 ) ) ( not ( = ?auto_2492 ?auto_2490 ) ) ( ON ?auto_2492 ?auto_2489 ) ( ON-TABLE ?auto_2491 ) ( ON ?auto_2490 ?auto_2492 ) ( CLEAR ?auto_2490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2491 ?auto_2489 ?auto_2492 )
      ( MAKE-1PILE ?auto_2489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2496 - BLOCK
    )
    :vars
    (
      ?auto_2497 - BLOCK
      ?auto_2498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2497 ?auto_2496 ) ( CLEAR ?auto_2497 ) ( ON-TABLE ?auto_2496 ) ( not ( = ?auto_2496 ?auto_2497 ) ) ( HOLDING ?auto_2498 ) ( not ( = ?auto_2496 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2498 )
      ( MAKE-1PILE ?auto_2496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2521 - BLOCK
      ?auto_2522 - BLOCK
    )
    :vars
    (
      ?auto_2523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2521 ?auto_2522 ) ) ( ON ?auto_2522 ?auto_2523 ) ( not ( = ?auto_2521 ?auto_2523 ) ) ( not ( = ?auto_2522 ?auto_2523 ) ) ( ON ?auto_2521 ?auto_2522 ) ( CLEAR ?auto_2521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2523 ?auto_2522 )
      ( MAKE-2PILE ?auto_2521 ?auto_2522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2526 - BLOCK
      ?auto_2527 - BLOCK
    )
    :vars
    (
      ?auto_2528 - BLOCK
      ?auto_2529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2526 ?auto_2527 ) ) ( ON ?auto_2527 ?auto_2528 ) ( CLEAR ?auto_2527 ) ( not ( = ?auto_2526 ?auto_2528 ) ) ( not ( = ?auto_2527 ?auto_2528 ) ) ( ON ?auto_2526 ?auto_2529 ) ( CLEAR ?auto_2526 ) ( HAND-EMPTY ) ( not ( = ?auto_2526 ?auto_2529 ) ) ( not ( = ?auto_2527 ?auto_2529 ) ) ( not ( = ?auto_2528 ?auto_2529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2526 ?auto_2529 )
      ( MAKE-2PILE ?auto_2526 ?auto_2527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2530 - BLOCK
      ?auto_2531 - BLOCK
    )
    :vars
    (
      ?auto_2532 - BLOCK
      ?auto_2533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2530 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2532 ) ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( ON ?auto_2530 ?auto_2533 ) ( CLEAR ?auto_2530 ) ( not ( = ?auto_2530 ?auto_2533 ) ) ( not ( = ?auto_2531 ?auto_2533 ) ) ( not ( = ?auto_2532 ?auto_2533 ) ) ( HOLDING ?auto_2531 ) ( CLEAR ?auto_2532 ) ( ON-TABLE ?auto_2532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2532 ?auto_2531 )
      ( MAKE-2PILE ?auto_2530 ?auto_2531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2534 - BLOCK
      ?auto_2535 - BLOCK
    )
    :vars
    (
      ?auto_2537 - BLOCK
      ?auto_2536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2534 ?auto_2535 ) ) ( not ( = ?auto_2534 ?auto_2537 ) ) ( not ( = ?auto_2535 ?auto_2537 ) ) ( ON ?auto_2534 ?auto_2536 ) ( not ( = ?auto_2534 ?auto_2536 ) ) ( not ( = ?auto_2535 ?auto_2536 ) ) ( not ( = ?auto_2537 ?auto_2536 ) ) ( CLEAR ?auto_2537 ) ( ON-TABLE ?auto_2537 ) ( ON ?auto_2535 ?auto_2534 ) ( CLEAR ?auto_2535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2536 ?auto_2534 )
      ( MAKE-2PILE ?auto_2534 ?auto_2535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2538 - BLOCK
      ?auto_2539 - BLOCK
    )
    :vars
    (
      ?auto_2540 - BLOCK
      ?auto_2541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2538 ?auto_2539 ) ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( not ( = ?auto_2539 ?auto_2540 ) ) ( ON ?auto_2538 ?auto_2541 ) ( not ( = ?auto_2538 ?auto_2541 ) ) ( not ( = ?auto_2539 ?auto_2541 ) ) ( not ( = ?auto_2540 ?auto_2541 ) ) ( ON ?auto_2539 ?auto_2538 ) ( CLEAR ?auto_2539 ) ( ON-TABLE ?auto_2541 ) ( HOLDING ?auto_2540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2540 )
      ( MAKE-2PILE ?auto_2538 ?auto_2539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2542 - BLOCK
      ?auto_2543 - BLOCK
    )
    :vars
    (
      ?auto_2545 - BLOCK
      ?auto_2544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2545 ) ) ( not ( = ?auto_2543 ?auto_2545 ) ) ( ON ?auto_2542 ?auto_2544 ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( not ( = ?auto_2543 ?auto_2544 ) ) ( not ( = ?auto_2545 ?auto_2544 ) ) ( ON ?auto_2543 ?auto_2542 ) ( ON-TABLE ?auto_2544 ) ( ON ?auto_2545 ?auto_2543 ) ( CLEAR ?auto_2545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2544 ?auto_2542 ?auto_2543 )
      ( MAKE-2PILE ?auto_2542 ?auto_2543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2552 - BLOCK
      ?auto_2553 - BLOCK
      ?auto_2554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2553 ) ( ON-TABLE ?auto_2552 ) ( ON ?auto_2553 ?auto_2552 ) ( not ( = ?auto_2552 ?auto_2553 ) ) ( not ( = ?auto_2552 ?auto_2554 ) ) ( not ( = ?auto_2553 ?auto_2554 ) ) ( ON-TABLE ?auto_2554 ) ( CLEAR ?auto_2554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2554 )
      ( MAKE-3PILE ?auto_2552 ?auto_2553 ?auto_2554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2555 - BLOCK
      ?auto_2556 - BLOCK
      ?auto_2557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2555 ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( ON-TABLE ?auto_2557 ) ( CLEAR ?auto_2557 ) ( HOLDING ?auto_2556 ) ( CLEAR ?auto_2555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2555 ?auto_2556 )
      ( MAKE-3PILE ?auto_2555 ?auto_2556 ?auto_2557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2558 - BLOCK
      ?auto_2559 - BLOCK
      ?auto_2560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2558 ) ( not ( = ?auto_2558 ?auto_2559 ) ) ( not ( = ?auto_2558 ?auto_2560 ) ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( ON-TABLE ?auto_2560 ) ( CLEAR ?auto_2558 ) ( ON ?auto_2559 ?auto_2560 ) ( CLEAR ?auto_2559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2560 )
      ( MAKE-3PILE ?auto_2558 ?auto_2559 ?auto_2560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2561 - BLOCK
      ?auto_2562 - BLOCK
      ?auto_2563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2561 ?auto_2562 ) ) ( not ( = ?auto_2561 ?auto_2563 ) ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( ON-TABLE ?auto_2563 ) ( ON ?auto_2562 ?auto_2563 ) ( CLEAR ?auto_2562 ) ( HOLDING ?auto_2561 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2561 )
      ( MAKE-3PILE ?auto_2561 ?auto_2562 ?auto_2563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2564 - BLOCK
      ?auto_2565 - BLOCK
      ?auto_2566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( not ( = ?auto_2565 ?auto_2566 ) ) ( ON-TABLE ?auto_2566 ) ( ON ?auto_2565 ?auto_2566 ) ( ON ?auto_2564 ?auto_2565 ) ( CLEAR ?auto_2564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2566 ?auto_2565 )
      ( MAKE-3PILE ?auto_2564 ?auto_2565 ?auto_2566 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2570 - BLOCK
      ?auto_2571 - BLOCK
      ?auto_2572 - BLOCK
    )
    :vars
    (
      ?auto_2573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2572 ) ) ( not ( = ?auto_2571 ?auto_2572 ) ) ( ON-TABLE ?auto_2572 ) ( ON ?auto_2571 ?auto_2572 ) ( CLEAR ?auto_2571 ) ( ON ?auto_2570 ?auto_2573 ) ( CLEAR ?auto_2570 ) ( HAND-EMPTY ) ( not ( = ?auto_2570 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2573 ) ) ( not ( = ?auto_2572 ?auto_2573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2570 ?auto_2573 )
      ( MAKE-3PILE ?auto_2570 ?auto_2571 ?auto_2572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2574 - BLOCK
      ?auto_2575 - BLOCK
      ?auto_2576 - BLOCK
    )
    :vars
    (
      ?auto_2577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2574 ?auto_2575 ) ) ( not ( = ?auto_2574 ?auto_2576 ) ) ( not ( = ?auto_2575 ?auto_2576 ) ) ( ON-TABLE ?auto_2576 ) ( ON ?auto_2574 ?auto_2577 ) ( CLEAR ?auto_2574 ) ( not ( = ?auto_2574 ?auto_2577 ) ) ( not ( = ?auto_2575 ?auto_2577 ) ) ( not ( = ?auto_2576 ?auto_2577 ) ) ( HOLDING ?auto_2575 ) ( CLEAR ?auto_2576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2576 ?auto_2575 )
      ( MAKE-3PILE ?auto_2574 ?auto_2575 ?auto_2576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2578 - BLOCK
      ?auto_2579 - BLOCK
      ?auto_2580 - BLOCK
    )
    :vars
    (
      ?auto_2581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2578 ?auto_2579 ) ) ( not ( = ?auto_2578 ?auto_2580 ) ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( ON-TABLE ?auto_2580 ) ( ON ?auto_2578 ?auto_2581 ) ( not ( = ?auto_2578 ?auto_2581 ) ) ( not ( = ?auto_2579 ?auto_2581 ) ) ( not ( = ?auto_2580 ?auto_2581 ) ) ( CLEAR ?auto_2580 ) ( ON ?auto_2579 ?auto_2578 ) ( CLEAR ?auto_2579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2581 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2581 ?auto_2578 )
      ( MAKE-3PILE ?auto_2578 ?auto_2579 ?auto_2580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2582 - BLOCK
      ?auto_2583 - BLOCK
      ?auto_2584 - BLOCK
    )
    :vars
    (
      ?auto_2585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2582 ?auto_2583 ) ) ( not ( = ?auto_2582 ?auto_2584 ) ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( ON ?auto_2582 ?auto_2585 ) ( not ( = ?auto_2582 ?auto_2585 ) ) ( not ( = ?auto_2583 ?auto_2585 ) ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( ON ?auto_2583 ?auto_2582 ) ( CLEAR ?auto_2583 ) ( ON-TABLE ?auto_2585 ) ( HOLDING ?auto_2584 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2584 )
      ( MAKE-3PILE ?auto_2582 ?auto_2583 ?auto_2584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2586 - BLOCK
      ?auto_2587 - BLOCK
      ?auto_2588 - BLOCK
    )
    :vars
    (
      ?auto_2589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2586 ?auto_2587 ) ) ( not ( = ?auto_2586 ?auto_2588 ) ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( ON ?auto_2586 ?auto_2589 ) ( not ( = ?auto_2586 ?auto_2589 ) ) ( not ( = ?auto_2587 ?auto_2589 ) ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( ON ?auto_2587 ?auto_2586 ) ( ON-TABLE ?auto_2589 ) ( ON ?auto_2588 ?auto_2587 ) ( CLEAR ?auto_2588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2589 ?auto_2586 ?auto_2587 )
      ( MAKE-3PILE ?auto_2586 ?auto_2587 ?auto_2588 ) )
  )

)

