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
      ?auto_2311 - BLOCK
    )
    :vars
    (
      ?auto_2312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2311 ?auto_2312 ) ( CLEAR ?auto_2311 ) ( HAND-EMPTY ) ( not ( = ?auto_2311 ?auto_2312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2311 ?auto_2312 )
      ( !PUTDOWN ?auto_2311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2314 - BLOCK
    )
    :vars
    (
      ?auto_2315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2314 ?auto_2315 ) ( CLEAR ?auto_2314 ) ( HAND-EMPTY ) ( not ( = ?auto_2314 ?auto_2315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2314 ?auto_2315 )
      ( !PUTDOWN ?auto_2314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2318 - BLOCK
      ?auto_2319 - BLOCK
    )
    :vars
    (
      ?auto_2320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2318 ) ( ON ?auto_2319 ?auto_2320 ) ( CLEAR ?auto_2319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2318 ) ( not ( = ?auto_2318 ?auto_2319 ) ) ( not ( = ?auto_2318 ?auto_2320 ) ) ( not ( = ?auto_2319 ?auto_2320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2319 ?auto_2320 )
      ( !STACK ?auto_2319 ?auto_2318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2323 - BLOCK
      ?auto_2324 - BLOCK
    )
    :vars
    (
      ?auto_2325 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2323 ) ( ON ?auto_2324 ?auto_2325 ) ( CLEAR ?auto_2324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2323 ) ( not ( = ?auto_2323 ?auto_2324 ) ) ( not ( = ?auto_2323 ?auto_2325 ) ) ( not ( = ?auto_2324 ?auto_2325 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2324 ?auto_2325 )
      ( !STACK ?auto_2324 ?auto_2323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2328 - BLOCK
      ?auto_2329 - BLOCK
    )
    :vars
    (
      ?auto_2330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2329 ?auto_2330 ) ( not ( = ?auto_2328 ?auto_2329 ) ) ( not ( = ?auto_2328 ?auto_2330 ) ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( ON ?auto_2328 ?auto_2329 ) ( CLEAR ?auto_2328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2328 )
      ( MAKE-2PILE ?auto_2328 ?auto_2329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2333 - BLOCK
      ?auto_2334 - BLOCK
    )
    :vars
    (
      ?auto_2335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2334 ?auto_2335 ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( not ( = ?auto_2333 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( ON ?auto_2333 ?auto_2334 ) ( CLEAR ?auto_2333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2333 )
      ( MAKE-2PILE ?auto_2333 ?auto_2334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2339 - BLOCK
      ?auto_2340 - BLOCK
      ?auto_2341 - BLOCK
    )
    :vars
    (
      ?auto_2342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2340 ) ( ON ?auto_2341 ?auto_2342 ) ( CLEAR ?auto_2341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2339 ) ( ON ?auto_2340 ?auto_2339 ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2341 ) ) ( not ( = ?auto_2339 ?auto_2342 ) ) ( not ( = ?auto_2340 ?auto_2341 ) ) ( not ( = ?auto_2340 ?auto_2342 ) ) ( not ( = ?auto_2341 ?auto_2342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2341 ?auto_2342 )
      ( !STACK ?auto_2341 ?auto_2340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2346 - BLOCK
      ?auto_2347 - BLOCK
      ?auto_2348 - BLOCK
    )
    :vars
    (
      ?auto_2349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2347 ) ( ON ?auto_2348 ?auto_2349 ) ( CLEAR ?auto_2348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2346 ) ( ON ?auto_2347 ?auto_2346 ) ( not ( = ?auto_2346 ?auto_2347 ) ) ( not ( = ?auto_2346 ?auto_2348 ) ) ( not ( = ?auto_2346 ?auto_2349 ) ) ( not ( = ?auto_2347 ?auto_2348 ) ) ( not ( = ?auto_2347 ?auto_2349 ) ) ( not ( = ?auto_2348 ?auto_2349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2348 ?auto_2349 )
      ( !STACK ?auto_2348 ?auto_2347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2353 - BLOCK
      ?auto_2354 - BLOCK
      ?auto_2355 - BLOCK
    )
    :vars
    (
      ?auto_2356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2355 ?auto_2356 ) ( ON-TABLE ?auto_2353 ) ( not ( = ?auto_2353 ?auto_2354 ) ) ( not ( = ?auto_2353 ?auto_2355 ) ) ( not ( = ?auto_2353 ?auto_2356 ) ) ( not ( = ?auto_2354 ?auto_2355 ) ) ( not ( = ?auto_2354 ?auto_2356 ) ) ( not ( = ?auto_2355 ?auto_2356 ) ) ( CLEAR ?auto_2353 ) ( ON ?auto_2354 ?auto_2355 ) ( CLEAR ?auto_2354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2353 ?auto_2354 )
      ( MAKE-3PILE ?auto_2353 ?auto_2354 ?auto_2355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2360 - BLOCK
      ?auto_2361 - BLOCK
      ?auto_2362 - BLOCK
    )
    :vars
    (
      ?auto_2363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2362 ?auto_2363 ) ( ON-TABLE ?auto_2360 ) ( not ( = ?auto_2360 ?auto_2361 ) ) ( not ( = ?auto_2360 ?auto_2362 ) ) ( not ( = ?auto_2360 ?auto_2363 ) ) ( not ( = ?auto_2361 ?auto_2362 ) ) ( not ( = ?auto_2361 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( CLEAR ?auto_2360 ) ( ON ?auto_2361 ?auto_2362 ) ( CLEAR ?auto_2361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2360 ?auto_2361 )
      ( MAKE-3PILE ?auto_2360 ?auto_2361 ?auto_2362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2367 - BLOCK
      ?auto_2368 - BLOCK
      ?auto_2369 - BLOCK
    )
    :vars
    (
      ?auto_2370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2369 ?auto_2370 ) ( not ( = ?auto_2367 ?auto_2368 ) ) ( not ( = ?auto_2367 ?auto_2369 ) ) ( not ( = ?auto_2367 ?auto_2370 ) ) ( not ( = ?auto_2368 ?auto_2369 ) ) ( not ( = ?auto_2368 ?auto_2370 ) ) ( not ( = ?auto_2369 ?auto_2370 ) ) ( ON ?auto_2368 ?auto_2369 ) ( ON ?auto_2367 ?auto_2368 ) ( CLEAR ?auto_2367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2367 )
      ( MAKE-3PILE ?auto_2367 ?auto_2368 ?auto_2369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2374 - BLOCK
      ?auto_2375 - BLOCK
      ?auto_2376 - BLOCK
    )
    :vars
    (
      ?auto_2377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2376 ?auto_2377 ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( not ( = ?auto_2374 ?auto_2376 ) ) ( not ( = ?auto_2374 ?auto_2377 ) ) ( not ( = ?auto_2375 ?auto_2376 ) ) ( not ( = ?auto_2375 ?auto_2377 ) ) ( not ( = ?auto_2376 ?auto_2377 ) ) ( ON ?auto_2375 ?auto_2376 ) ( ON ?auto_2374 ?auto_2375 ) ( CLEAR ?auto_2374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2374 )
      ( MAKE-3PILE ?auto_2374 ?auto_2375 ?auto_2376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2382 - BLOCK
      ?auto_2383 - BLOCK
      ?auto_2384 - BLOCK
      ?auto_2385 - BLOCK
    )
    :vars
    (
      ?auto_2386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2384 ) ( ON ?auto_2385 ?auto_2386 ) ( CLEAR ?auto_2385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2382 ) ( ON ?auto_2383 ?auto_2382 ) ( ON ?auto_2384 ?auto_2383 ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( not ( = ?auto_2382 ?auto_2385 ) ) ( not ( = ?auto_2382 ?auto_2386 ) ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2383 ?auto_2385 ) ) ( not ( = ?auto_2383 ?auto_2386 ) ) ( not ( = ?auto_2384 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2386 ) ) ( not ( = ?auto_2385 ?auto_2386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2385 ?auto_2386 )
      ( !STACK ?auto_2385 ?auto_2384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2391 - BLOCK
      ?auto_2392 - BLOCK
      ?auto_2393 - BLOCK
      ?auto_2394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2393 ) ( ON-TABLE ?auto_2394 ) ( CLEAR ?auto_2394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2391 ) ( ON ?auto_2392 ?auto_2391 ) ( ON ?auto_2393 ?auto_2392 ) ( not ( = ?auto_2391 ?auto_2392 ) ) ( not ( = ?auto_2391 ?auto_2393 ) ) ( not ( = ?auto_2391 ?auto_2394 ) ) ( not ( = ?auto_2392 ?auto_2393 ) ) ( not ( = ?auto_2392 ?auto_2394 ) ) ( not ( = ?auto_2393 ?auto_2394 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2394 )
      ( !STACK ?auto_2394 ?auto_2393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2399 - BLOCK
      ?auto_2400 - BLOCK
      ?auto_2401 - BLOCK
      ?auto_2402 - BLOCK
    )
    :vars
    (
      ?auto_2403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2402 ?auto_2403 ) ( ON-TABLE ?auto_2399 ) ( ON ?auto_2400 ?auto_2399 ) ( not ( = ?auto_2399 ?auto_2400 ) ) ( not ( = ?auto_2399 ?auto_2401 ) ) ( not ( = ?auto_2399 ?auto_2402 ) ) ( not ( = ?auto_2399 ?auto_2403 ) ) ( not ( = ?auto_2400 ?auto_2401 ) ) ( not ( = ?auto_2400 ?auto_2402 ) ) ( not ( = ?auto_2400 ?auto_2403 ) ) ( not ( = ?auto_2401 ?auto_2402 ) ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( CLEAR ?auto_2400 ) ( ON ?auto_2401 ?auto_2402 ) ( CLEAR ?auto_2401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2399 ?auto_2400 ?auto_2401 )
      ( MAKE-4PILE ?auto_2399 ?auto_2400 ?auto_2401 ?auto_2402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2408 - BLOCK
      ?auto_2409 - BLOCK
      ?auto_2410 - BLOCK
      ?auto_2411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2411 ) ( ON-TABLE ?auto_2408 ) ( ON ?auto_2409 ?auto_2408 ) ( not ( = ?auto_2408 ?auto_2409 ) ) ( not ( = ?auto_2408 ?auto_2410 ) ) ( not ( = ?auto_2408 ?auto_2411 ) ) ( not ( = ?auto_2409 ?auto_2410 ) ) ( not ( = ?auto_2409 ?auto_2411 ) ) ( not ( = ?auto_2410 ?auto_2411 ) ) ( CLEAR ?auto_2409 ) ( ON ?auto_2410 ?auto_2411 ) ( CLEAR ?auto_2410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2408 ?auto_2409 ?auto_2410 )
      ( MAKE-4PILE ?auto_2408 ?auto_2409 ?auto_2410 ?auto_2411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2416 - BLOCK
      ?auto_2417 - BLOCK
      ?auto_2418 - BLOCK
      ?auto_2419 - BLOCK
    )
    :vars
    (
      ?auto_2420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2419 ?auto_2420 ) ( ON-TABLE ?auto_2416 ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2418 ) ) ( not ( = ?auto_2416 ?auto_2419 ) ) ( not ( = ?auto_2416 ?auto_2420 ) ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( not ( = ?auto_2417 ?auto_2419 ) ) ( not ( = ?auto_2417 ?auto_2420 ) ) ( not ( = ?auto_2418 ?auto_2419 ) ) ( not ( = ?auto_2418 ?auto_2420 ) ) ( not ( = ?auto_2419 ?auto_2420 ) ) ( ON ?auto_2418 ?auto_2419 ) ( CLEAR ?auto_2416 ) ( ON ?auto_2417 ?auto_2418 ) ( CLEAR ?auto_2417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2416 ?auto_2417 )
      ( MAKE-4PILE ?auto_2416 ?auto_2417 ?auto_2418 ?auto_2419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2425 - BLOCK
      ?auto_2426 - BLOCK
      ?auto_2427 - BLOCK
      ?auto_2428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2428 ) ( ON-TABLE ?auto_2425 ) ( not ( = ?auto_2425 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2427 ) ) ( not ( = ?auto_2425 ?auto_2428 ) ) ( not ( = ?auto_2426 ?auto_2427 ) ) ( not ( = ?auto_2426 ?auto_2428 ) ) ( not ( = ?auto_2427 ?auto_2428 ) ) ( ON ?auto_2427 ?auto_2428 ) ( CLEAR ?auto_2425 ) ( ON ?auto_2426 ?auto_2427 ) ( CLEAR ?auto_2426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2425 ?auto_2426 )
      ( MAKE-4PILE ?auto_2425 ?auto_2426 ?auto_2427 ?auto_2428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2433 - BLOCK
      ?auto_2434 - BLOCK
      ?auto_2435 - BLOCK
      ?auto_2436 - BLOCK
    )
    :vars
    (
      ?auto_2437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2436 ?auto_2437 ) ( not ( = ?auto_2433 ?auto_2434 ) ) ( not ( = ?auto_2433 ?auto_2435 ) ) ( not ( = ?auto_2433 ?auto_2436 ) ) ( not ( = ?auto_2433 ?auto_2437 ) ) ( not ( = ?auto_2434 ?auto_2435 ) ) ( not ( = ?auto_2434 ?auto_2436 ) ) ( not ( = ?auto_2434 ?auto_2437 ) ) ( not ( = ?auto_2435 ?auto_2436 ) ) ( not ( = ?auto_2435 ?auto_2437 ) ) ( not ( = ?auto_2436 ?auto_2437 ) ) ( ON ?auto_2435 ?auto_2436 ) ( ON ?auto_2434 ?auto_2435 ) ( ON ?auto_2433 ?auto_2434 ) ( CLEAR ?auto_2433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2433 )
      ( MAKE-4PILE ?auto_2433 ?auto_2434 ?auto_2435 ?auto_2436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2442 - BLOCK
      ?auto_2443 - BLOCK
      ?auto_2444 - BLOCK
      ?auto_2445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2445 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2444 ) ) ( not ( = ?auto_2442 ?auto_2445 ) ) ( not ( = ?auto_2443 ?auto_2444 ) ) ( not ( = ?auto_2443 ?auto_2445 ) ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( ON ?auto_2444 ?auto_2445 ) ( ON ?auto_2443 ?auto_2444 ) ( ON ?auto_2442 ?auto_2443 ) ( CLEAR ?auto_2442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2442 )
      ( MAKE-4PILE ?auto_2442 ?auto_2443 ?auto_2444 ?auto_2445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2450 - BLOCK
      ?auto_2451 - BLOCK
      ?auto_2452 - BLOCK
      ?auto_2453 - BLOCK
    )
    :vars
    (
      ?auto_2454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2450 ?auto_2451 ) ) ( not ( = ?auto_2450 ?auto_2452 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) ( not ( = ?auto_2451 ?auto_2452 ) ) ( not ( = ?auto_2451 ?auto_2453 ) ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( ON ?auto_2450 ?auto_2454 ) ( not ( = ?auto_2453 ?auto_2454 ) ) ( not ( = ?auto_2452 ?auto_2454 ) ) ( not ( = ?auto_2451 ?auto_2454 ) ) ( not ( = ?auto_2450 ?auto_2454 ) ) ( ON ?auto_2451 ?auto_2450 ) ( ON ?auto_2452 ?auto_2451 ) ( ON ?auto_2453 ?auto_2452 ) ( CLEAR ?auto_2453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2453 ?auto_2452 ?auto_2451 ?auto_2450 )
      ( MAKE-4PILE ?auto_2450 ?auto_2451 ?auto_2452 ?auto_2453 ) )
  )

)

