( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2342 - SURFACE
      ?auto_2343 - SURFACE
    )
    :vars
    (
      ?auto_2344 - HOIST
      ?auto_2345 - PLACE
      ?auto_2347 - PLACE
      ?auto_2348 - HOIST
      ?auto_2349 - SURFACE
      ?auto_2346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344 ?auto_2345 ) ( SURFACE-AT ?auto_2342 ?auto_2345 ) ( CLEAR ?auto_2342 ) ( IS-CRATE ?auto_2343 ) ( AVAILABLE ?auto_2344 ) ( not ( = ?auto_2347 ?auto_2345 ) ) ( HOIST-AT ?auto_2348 ?auto_2347 ) ( AVAILABLE ?auto_2348 ) ( SURFACE-AT ?auto_2343 ?auto_2347 ) ( ON ?auto_2343 ?auto_2349 ) ( CLEAR ?auto_2343 ) ( TRUCK-AT ?auto_2346 ?auto_2345 ) ( not ( = ?auto_2342 ?auto_2343 ) ) ( not ( = ?auto_2342 ?auto_2349 ) ) ( not ( = ?auto_2343 ?auto_2349 ) ) ( not ( = ?auto_2344 ?auto_2348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2346 ?auto_2345 ?auto_2347 )
      ( !LIFT ?auto_2348 ?auto_2343 ?auto_2349 ?auto_2347 )
      ( !LOAD ?auto_2348 ?auto_2343 ?auto_2346 ?auto_2347 )
      ( !DRIVE ?auto_2346 ?auto_2347 ?auto_2345 )
      ( !UNLOAD ?auto_2344 ?auto_2343 ?auto_2346 ?auto_2345 )
      ( !DROP ?auto_2344 ?auto_2343 ?auto_2342 ?auto_2345 )
      ( MAKE-1CRATE-VERIFY ?auto_2342 ?auto_2343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2363 - SURFACE
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
    )
    :vars
    (
      ?auto_2368 - HOIST
      ?auto_2371 - PLACE
      ?auto_2370 - PLACE
      ?auto_2369 - HOIST
      ?auto_2367 - SURFACE
      ?auto_2374 - PLACE
      ?auto_2373 - HOIST
      ?auto_2372 - SURFACE
      ?auto_2366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368 ?auto_2371 ) ( IS-CRATE ?auto_2365 ) ( not ( = ?auto_2370 ?auto_2371 ) ) ( HOIST-AT ?auto_2369 ?auto_2370 ) ( AVAILABLE ?auto_2369 ) ( SURFACE-AT ?auto_2365 ?auto_2370 ) ( ON ?auto_2365 ?auto_2367 ) ( CLEAR ?auto_2365 ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2367 ) ) ( not ( = ?auto_2365 ?auto_2367 ) ) ( not ( = ?auto_2368 ?auto_2369 ) ) ( SURFACE-AT ?auto_2363 ?auto_2371 ) ( CLEAR ?auto_2363 ) ( IS-CRATE ?auto_2364 ) ( AVAILABLE ?auto_2368 ) ( not ( = ?auto_2374 ?auto_2371 ) ) ( HOIST-AT ?auto_2373 ?auto_2374 ) ( AVAILABLE ?auto_2373 ) ( SURFACE-AT ?auto_2364 ?auto_2374 ) ( ON ?auto_2364 ?auto_2372 ) ( CLEAR ?auto_2364 ) ( TRUCK-AT ?auto_2366 ?auto_2371 ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2372 ) ) ( not ( = ?auto_2364 ?auto_2372 ) ) ( not ( = ?auto_2368 ?auto_2373 ) ) ( not ( = ?auto_2363 ?auto_2365 ) ) ( not ( = ?auto_2363 ?auto_2367 ) ) ( not ( = ?auto_2365 ?auto_2372 ) ) ( not ( = ?auto_2370 ?auto_2374 ) ) ( not ( = ?auto_2369 ?auto_2373 ) ) ( not ( = ?auto_2367 ?auto_2372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2363 ?auto_2364 )
      ( MAKE-1CRATE ?auto_2364 ?auto_2365 )
      ( MAKE-2CRATE-VERIFY ?auto_2363 ?auto_2364 ?auto_2365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2389 - SURFACE
      ?auto_2390 - SURFACE
      ?auto_2391 - SURFACE
      ?auto_2392 - SURFACE
    )
    :vars
    (
      ?auto_2397 - HOIST
      ?auto_2396 - PLACE
      ?auto_2393 - PLACE
      ?auto_2394 - HOIST
      ?auto_2398 - SURFACE
      ?auto_2400 - PLACE
      ?auto_2401 - HOIST
      ?auto_2402 - SURFACE
      ?auto_2404 - PLACE
      ?auto_2403 - HOIST
      ?auto_2399 - SURFACE
      ?auto_2395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397 ?auto_2396 ) ( IS-CRATE ?auto_2392 ) ( not ( = ?auto_2393 ?auto_2396 ) ) ( HOIST-AT ?auto_2394 ?auto_2393 ) ( AVAILABLE ?auto_2394 ) ( SURFACE-AT ?auto_2392 ?auto_2393 ) ( ON ?auto_2392 ?auto_2398 ) ( CLEAR ?auto_2392 ) ( not ( = ?auto_2391 ?auto_2392 ) ) ( not ( = ?auto_2391 ?auto_2398 ) ) ( not ( = ?auto_2392 ?auto_2398 ) ) ( not ( = ?auto_2397 ?auto_2394 ) ) ( IS-CRATE ?auto_2391 ) ( not ( = ?auto_2400 ?auto_2396 ) ) ( HOIST-AT ?auto_2401 ?auto_2400 ) ( AVAILABLE ?auto_2401 ) ( SURFACE-AT ?auto_2391 ?auto_2400 ) ( ON ?auto_2391 ?auto_2402 ) ( CLEAR ?auto_2391 ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( not ( = ?auto_2390 ?auto_2402 ) ) ( not ( = ?auto_2391 ?auto_2402 ) ) ( not ( = ?auto_2397 ?auto_2401 ) ) ( SURFACE-AT ?auto_2389 ?auto_2396 ) ( CLEAR ?auto_2389 ) ( IS-CRATE ?auto_2390 ) ( AVAILABLE ?auto_2397 ) ( not ( = ?auto_2404 ?auto_2396 ) ) ( HOIST-AT ?auto_2403 ?auto_2404 ) ( AVAILABLE ?auto_2403 ) ( SURFACE-AT ?auto_2390 ?auto_2404 ) ( ON ?auto_2390 ?auto_2399 ) ( CLEAR ?auto_2390 ) ( TRUCK-AT ?auto_2395 ?auto_2396 ) ( not ( = ?auto_2389 ?auto_2390 ) ) ( not ( = ?auto_2389 ?auto_2399 ) ) ( not ( = ?auto_2390 ?auto_2399 ) ) ( not ( = ?auto_2397 ?auto_2403 ) ) ( not ( = ?auto_2389 ?auto_2391 ) ) ( not ( = ?auto_2389 ?auto_2402 ) ) ( not ( = ?auto_2391 ?auto_2399 ) ) ( not ( = ?auto_2400 ?auto_2404 ) ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2399 ) ) ( not ( = ?auto_2389 ?auto_2392 ) ) ( not ( = ?auto_2389 ?auto_2398 ) ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( not ( = ?auto_2390 ?auto_2398 ) ) ( not ( = ?auto_2392 ?auto_2402 ) ) ( not ( = ?auto_2392 ?auto_2399 ) ) ( not ( = ?auto_2393 ?auto_2400 ) ) ( not ( = ?auto_2393 ?auto_2404 ) ) ( not ( = ?auto_2394 ?auto_2401 ) ) ( not ( = ?auto_2394 ?auto_2403 ) ) ( not ( = ?auto_2398 ?auto_2402 ) ) ( not ( = ?auto_2398 ?auto_2399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2389 ?auto_2390 ?auto_2391 )
      ( MAKE-1CRATE ?auto_2391 ?auto_2392 )
      ( MAKE-3CRATE-VERIFY ?auto_2389 ?auto_2390 ?auto_2391 ?auto_2392 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2420 - SURFACE
      ?auto_2421 - SURFACE
      ?auto_2422 - SURFACE
      ?auto_2423 - SURFACE
      ?auto_2424 - SURFACE
    )
    :vars
    (
      ?auto_2426 - HOIST
      ?auto_2429 - PLACE
      ?auto_2425 - PLACE
      ?auto_2427 - HOIST
      ?auto_2428 - SURFACE
      ?auto_2431 - PLACE
      ?auto_2432 - HOIST
      ?auto_2433 - SURFACE
      ?auto_2439 - PLACE
      ?auto_2435 - HOIST
      ?auto_2437 - SURFACE
      ?auto_2434 - PLACE
      ?auto_2436 - HOIST
      ?auto_2438 - SURFACE
      ?auto_2430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2426 ?auto_2429 ) ( IS-CRATE ?auto_2424 ) ( not ( = ?auto_2425 ?auto_2429 ) ) ( HOIST-AT ?auto_2427 ?auto_2425 ) ( AVAILABLE ?auto_2427 ) ( SURFACE-AT ?auto_2424 ?auto_2425 ) ( ON ?auto_2424 ?auto_2428 ) ( CLEAR ?auto_2424 ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2423 ?auto_2428 ) ) ( not ( = ?auto_2424 ?auto_2428 ) ) ( not ( = ?auto_2426 ?auto_2427 ) ) ( IS-CRATE ?auto_2423 ) ( not ( = ?auto_2431 ?auto_2429 ) ) ( HOIST-AT ?auto_2432 ?auto_2431 ) ( AVAILABLE ?auto_2432 ) ( SURFACE-AT ?auto_2423 ?auto_2431 ) ( ON ?auto_2423 ?auto_2433 ) ( CLEAR ?auto_2423 ) ( not ( = ?auto_2422 ?auto_2423 ) ) ( not ( = ?auto_2422 ?auto_2433 ) ) ( not ( = ?auto_2423 ?auto_2433 ) ) ( not ( = ?auto_2426 ?auto_2432 ) ) ( IS-CRATE ?auto_2422 ) ( not ( = ?auto_2439 ?auto_2429 ) ) ( HOIST-AT ?auto_2435 ?auto_2439 ) ( AVAILABLE ?auto_2435 ) ( SURFACE-AT ?auto_2422 ?auto_2439 ) ( ON ?auto_2422 ?auto_2437 ) ( CLEAR ?auto_2422 ) ( not ( = ?auto_2421 ?auto_2422 ) ) ( not ( = ?auto_2421 ?auto_2437 ) ) ( not ( = ?auto_2422 ?auto_2437 ) ) ( not ( = ?auto_2426 ?auto_2435 ) ) ( SURFACE-AT ?auto_2420 ?auto_2429 ) ( CLEAR ?auto_2420 ) ( IS-CRATE ?auto_2421 ) ( AVAILABLE ?auto_2426 ) ( not ( = ?auto_2434 ?auto_2429 ) ) ( HOIST-AT ?auto_2436 ?auto_2434 ) ( AVAILABLE ?auto_2436 ) ( SURFACE-AT ?auto_2421 ?auto_2434 ) ( ON ?auto_2421 ?auto_2438 ) ( CLEAR ?auto_2421 ) ( TRUCK-AT ?auto_2430 ?auto_2429 ) ( not ( = ?auto_2420 ?auto_2421 ) ) ( not ( = ?auto_2420 ?auto_2438 ) ) ( not ( = ?auto_2421 ?auto_2438 ) ) ( not ( = ?auto_2426 ?auto_2436 ) ) ( not ( = ?auto_2420 ?auto_2422 ) ) ( not ( = ?auto_2420 ?auto_2437 ) ) ( not ( = ?auto_2422 ?auto_2438 ) ) ( not ( = ?auto_2439 ?auto_2434 ) ) ( not ( = ?auto_2435 ?auto_2436 ) ) ( not ( = ?auto_2437 ?auto_2438 ) ) ( not ( = ?auto_2420 ?auto_2423 ) ) ( not ( = ?auto_2420 ?auto_2433 ) ) ( not ( = ?auto_2421 ?auto_2423 ) ) ( not ( = ?auto_2421 ?auto_2433 ) ) ( not ( = ?auto_2423 ?auto_2437 ) ) ( not ( = ?auto_2423 ?auto_2438 ) ) ( not ( = ?auto_2431 ?auto_2439 ) ) ( not ( = ?auto_2431 ?auto_2434 ) ) ( not ( = ?auto_2432 ?auto_2435 ) ) ( not ( = ?auto_2432 ?auto_2436 ) ) ( not ( = ?auto_2433 ?auto_2437 ) ) ( not ( = ?auto_2433 ?auto_2438 ) ) ( not ( = ?auto_2420 ?auto_2424 ) ) ( not ( = ?auto_2420 ?auto_2428 ) ) ( not ( = ?auto_2421 ?auto_2424 ) ) ( not ( = ?auto_2421 ?auto_2428 ) ) ( not ( = ?auto_2422 ?auto_2424 ) ) ( not ( = ?auto_2422 ?auto_2428 ) ) ( not ( = ?auto_2424 ?auto_2433 ) ) ( not ( = ?auto_2424 ?auto_2437 ) ) ( not ( = ?auto_2424 ?auto_2438 ) ) ( not ( = ?auto_2425 ?auto_2431 ) ) ( not ( = ?auto_2425 ?auto_2439 ) ) ( not ( = ?auto_2425 ?auto_2434 ) ) ( not ( = ?auto_2427 ?auto_2432 ) ) ( not ( = ?auto_2427 ?auto_2435 ) ) ( not ( = ?auto_2427 ?auto_2436 ) ) ( not ( = ?auto_2428 ?auto_2433 ) ) ( not ( = ?auto_2428 ?auto_2437 ) ) ( not ( = ?auto_2428 ?auto_2438 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2420 ?auto_2421 ?auto_2422 ?auto_2423 )
      ( MAKE-1CRATE ?auto_2423 ?auto_2424 )
      ( MAKE-4CRATE-VERIFY ?auto_2420 ?auto_2421 ?auto_2422 ?auto_2423 ?auto_2424 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2456 - SURFACE
      ?auto_2457 - SURFACE
      ?auto_2458 - SURFACE
      ?auto_2459 - SURFACE
      ?auto_2460 - SURFACE
      ?auto_2461 - SURFACE
    )
    :vars
    (
      ?auto_2467 - HOIST
      ?auto_2463 - PLACE
      ?auto_2466 - PLACE
      ?auto_2465 - HOIST
      ?auto_2462 - SURFACE
      ?auto_2474 - PLACE
      ?auto_2477 - HOIST
      ?auto_2476 - SURFACE
      ?auto_2469 - PLACE
      ?auto_2471 - HOIST
      ?auto_2470 - SURFACE
      ?auto_2473 - SURFACE
      ?auto_2468 - PLACE
      ?auto_2472 - HOIST
      ?auto_2475 - SURFACE
      ?auto_2464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2467 ?auto_2463 ) ( IS-CRATE ?auto_2461 ) ( not ( = ?auto_2466 ?auto_2463 ) ) ( HOIST-AT ?auto_2465 ?auto_2466 ) ( SURFACE-AT ?auto_2461 ?auto_2466 ) ( ON ?auto_2461 ?auto_2462 ) ( CLEAR ?auto_2461 ) ( not ( = ?auto_2460 ?auto_2461 ) ) ( not ( = ?auto_2460 ?auto_2462 ) ) ( not ( = ?auto_2461 ?auto_2462 ) ) ( not ( = ?auto_2467 ?auto_2465 ) ) ( IS-CRATE ?auto_2460 ) ( not ( = ?auto_2474 ?auto_2463 ) ) ( HOIST-AT ?auto_2477 ?auto_2474 ) ( AVAILABLE ?auto_2477 ) ( SURFACE-AT ?auto_2460 ?auto_2474 ) ( ON ?auto_2460 ?auto_2476 ) ( CLEAR ?auto_2460 ) ( not ( = ?auto_2459 ?auto_2460 ) ) ( not ( = ?auto_2459 ?auto_2476 ) ) ( not ( = ?auto_2460 ?auto_2476 ) ) ( not ( = ?auto_2467 ?auto_2477 ) ) ( IS-CRATE ?auto_2459 ) ( not ( = ?auto_2469 ?auto_2463 ) ) ( HOIST-AT ?auto_2471 ?auto_2469 ) ( AVAILABLE ?auto_2471 ) ( SURFACE-AT ?auto_2459 ?auto_2469 ) ( ON ?auto_2459 ?auto_2470 ) ( CLEAR ?auto_2459 ) ( not ( = ?auto_2458 ?auto_2459 ) ) ( not ( = ?auto_2458 ?auto_2470 ) ) ( not ( = ?auto_2459 ?auto_2470 ) ) ( not ( = ?auto_2467 ?auto_2471 ) ) ( IS-CRATE ?auto_2458 ) ( AVAILABLE ?auto_2465 ) ( SURFACE-AT ?auto_2458 ?auto_2466 ) ( ON ?auto_2458 ?auto_2473 ) ( CLEAR ?auto_2458 ) ( not ( = ?auto_2457 ?auto_2458 ) ) ( not ( = ?auto_2457 ?auto_2473 ) ) ( not ( = ?auto_2458 ?auto_2473 ) ) ( SURFACE-AT ?auto_2456 ?auto_2463 ) ( CLEAR ?auto_2456 ) ( IS-CRATE ?auto_2457 ) ( AVAILABLE ?auto_2467 ) ( not ( = ?auto_2468 ?auto_2463 ) ) ( HOIST-AT ?auto_2472 ?auto_2468 ) ( AVAILABLE ?auto_2472 ) ( SURFACE-AT ?auto_2457 ?auto_2468 ) ( ON ?auto_2457 ?auto_2475 ) ( CLEAR ?auto_2457 ) ( TRUCK-AT ?auto_2464 ?auto_2463 ) ( not ( = ?auto_2456 ?auto_2457 ) ) ( not ( = ?auto_2456 ?auto_2475 ) ) ( not ( = ?auto_2457 ?auto_2475 ) ) ( not ( = ?auto_2467 ?auto_2472 ) ) ( not ( = ?auto_2456 ?auto_2458 ) ) ( not ( = ?auto_2456 ?auto_2473 ) ) ( not ( = ?auto_2458 ?auto_2475 ) ) ( not ( = ?auto_2466 ?auto_2468 ) ) ( not ( = ?auto_2465 ?auto_2472 ) ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( not ( = ?auto_2456 ?auto_2459 ) ) ( not ( = ?auto_2456 ?auto_2470 ) ) ( not ( = ?auto_2457 ?auto_2459 ) ) ( not ( = ?auto_2457 ?auto_2470 ) ) ( not ( = ?auto_2459 ?auto_2473 ) ) ( not ( = ?auto_2459 ?auto_2475 ) ) ( not ( = ?auto_2469 ?auto_2466 ) ) ( not ( = ?auto_2469 ?auto_2468 ) ) ( not ( = ?auto_2471 ?auto_2465 ) ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( not ( = ?auto_2470 ?auto_2473 ) ) ( not ( = ?auto_2470 ?auto_2475 ) ) ( not ( = ?auto_2456 ?auto_2460 ) ) ( not ( = ?auto_2456 ?auto_2476 ) ) ( not ( = ?auto_2457 ?auto_2460 ) ) ( not ( = ?auto_2457 ?auto_2476 ) ) ( not ( = ?auto_2458 ?auto_2460 ) ) ( not ( = ?auto_2458 ?auto_2476 ) ) ( not ( = ?auto_2460 ?auto_2470 ) ) ( not ( = ?auto_2460 ?auto_2473 ) ) ( not ( = ?auto_2460 ?auto_2475 ) ) ( not ( = ?auto_2474 ?auto_2469 ) ) ( not ( = ?auto_2474 ?auto_2466 ) ) ( not ( = ?auto_2474 ?auto_2468 ) ) ( not ( = ?auto_2477 ?auto_2471 ) ) ( not ( = ?auto_2477 ?auto_2465 ) ) ( not ( = ?auto_2477 ?auto_2472 ) ) ( not ( = ?auto_2476 ?auto_2470 ) ) ( not ( = ?auto_2476 ?auto_2473 ) ) ( not ( = ?auto_2476 ?auto_2475 ) ) ( not ( = ?auto_2456 ?auto_2461 ) ) ( not ( = ?auto_2456 ?auto_2462 ) ) ( not ( = ?auto_2457 ?auto_2461 ) ) ( not ( = ?auto_2457 ?auto_2462 ) ) ( not ( = ?auto_2458 ?auto_2461 ) ) ( not ( = ?auto_2458 ?auto_2462 ) ) ( not ( = ?auto_2459 ?auto_2461 ) ) ( not ( = ?auto_2459 ?auto_2462 ) ) ( not ( = ?auto_2461 ?auto_2476 ) ) ( not ( = ?auto_2461 ?auto_2470 ) ) ( not ( = ?auto_2461 ?auto_2473 ) ) ( not ( = ?auto_2461 ?auto_2475 ) ) ( not ( = ?auto_2462 ?auto_2476 ) ) ( not ( = ?auto_2462 ?auto_2470 ) ) ( not ( = ?auto_2462 ?auto_2473 ) ) ( not ( = ?auto_2462 ?auto_2475 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2456 ?auto_2457 ?auto_2458 ?auto_2459 ?auto_2460 )
      ( MAKE-1CRATE ?auto_2460 ?auto_2461 )
      ( MAKE-5CRATE-VERIFY ?auto_2456 ?auto_2457 ?auto_2458 ?auto_2459 ?auto_2460 ?auto_2461 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2495 - SURFACE
      ?auto_2496 - SURFACE
      ?auto_2497 - SURFACE
      ?auto_2498 - SURFACE
      ?auto_2499 - SURFACE
      ?auto_2500 - SURFACE
      ?auto_2501 - SURFACE
    )
    :vars
    (
      ?auto_2504 - HOIST
      ?auto_2503 - PLACE
      ?auto_2505 - PLACE
      ?auto_2506 - HOIST
      ?auto_2507 - SURFACE
      ?auto_2508 - PLACE
      ?auto_2515 - HOIST
      ?auto_2516 - SURFACE
      ?auto_2517 - SURFACE
      ?auto_2513 - PLACE
      ?auto_2512 - HOIST
      ?auto_2514 - SURFACE
      ?auto_2510 - SURFACE
      ?auto_2511 - PLACE
      ?auto_2509 - HOIST
      ?auto_2518 - SURFACE
      ?auto_2502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2504 ?auto_2503 ) ( IS-CRATE ?auto_2501 ) ( not ( = ?auto_2505 ?auto_2503 ) ) ( HOIST-AT ?auto_2506 ?auto_2505 ) ( SURFACE-AT ?auto_2501 ?auto_2505 ) ( ON ?auto_2501 ?auto_2507 ) ( CLEAR ?auto_2501 ) ( not ( = ?auto_2500 ?auto_2501 ) ) ( not ( = ?auto_2500 ?auto_2507 ) ) ( not ( = ?auto_2501 ?auto_2507 ) ) ( not ( = ?auto_2504 ?auto_2506 ) ) ( IS-CRATE ?auto_2500 ) ( not ( = ?auto_2508 ?auto_2503 ) ) ( HOIST-AT ?auto_2515 ?auto_2508 ) ( SURFACE-AT ?auto_2500 ?auto_2508 ) ( ON ?auto_2500 ?auto_2516 ) ( CLEAR ?auto_2500 ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2499 ?auto_2516 ) ) ( not ( = ?auto_2500 ?auto_2516 ) ) ( not ( = ?auto_2504 ?auto_2515 ) ) ( IS-CRATE ?auto_2499 ) ( AVAILABLE ?auto_2506 ) ( SURFACE-AT ?auto_2499 ?auto_2505 ) ( ON ?auto_2499 ?auto_2517 ) ( CLEAR ?auto_2499 ) ( not ( = ?auto_2498 ?auto_2499 ) ) ( not ( = ?auto_2498 ?auto_2517 ) ) ( not ( = ?auto_2499 ?auto_2517 ) ) ( IS-CRATE ?auto_2498 ) ( not ( = ?auto_2513 ?auto_2503 ) ) ( HOIST-AT ?auto_2512 ?auto_2513 ) ( AVAILABLE ?auto_2512 ) ( SURFACE-AT ?auto_2498 ?auto_2513 ) ( ON ?auto_2498 ?auto_2514 ) ( CLEAR ?auto_2498 ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2514 ) ) ( not ( = ?auto_2498 ?auto_2514 ) ) ( not ( = ?auto_2504 ?auto_2512 ) ) ( IS-CRATE ?auto_2497 ) ( AVAILABLE ?auto_2515 ) ( SURFACE-AT ?auto_2497 ?auto_2508 ) ( ON ?auto_2497 ?auto_2510 ) ( CLEAR ?auto_2497 ) ( not ( = ?auto_2496 ?auto_2497 ) ) ( not ( = ?auto_2496 ?auto_2510 ) ) ( not ( = ?auto_2497 ?auto_2510 ) ) ( SURFACE-AT ?auto_2495 ?auto_2503 ) ( CLEAR ?auto_2495 ) ( IS-CRATE ?auto_2496 ) ( AVAILABLE ?auto_2504 ) ( not ( = ?auto_2511 ?auto_2503 ) ) ( HOIST-AT ?auto_2509 ?auto_2511 ) ( AVAILABLE ?auto_2509 ) ( SURFACE-AT ?auto_2496 ?auto_2511 ) ( ON ?auto_2496 ?auto_2518 ) ( CLEAR ?auto_2496 ) ( TRUCK-AT ?auto_2502 ?auto_2503 ) ( not ( = ?auto_2495 ?auto_2496 ) ) ( not ( = ?auto_2495 ?auto_2518 ) ) ( not ( = ?auto_2496 ?auto_2518 ) ) ( not ( = ?auto_2504 ?auto_2509 ) ) ( not ( = ?auto_2495 ?auto_2497 ) ) ( not ( = ?auto_2495 ?auto_2510 ) ) ( not ( = ?auto_2497 ?auto_2518 ) ) ( not ( = ?auto_2508 ?auto_2511 ) ) ( not ( = ?auto_2515 ?auto_2509 ) ) ( not ( = ?auto_2510 ?auto_2518 ) ) ( not ( = ?auto_2495 ?auto_2498 ) ) ( not ( = ?auto_2495 ?auto_2514 ) ) ( not ( = ?auto_2496 ?auto_2498 ) ) ( not ( = ?auto_2496 ?auto_2514 ) ) ( not ( = ?auto_2498 ?auto_2510 ) ) ( not ( = ?auto_2498 ?auto_2518 ) ) ( not ( = ?auto_2513 ?auto_2508 ) ) ( not ( = ?auto_2513 ?auto_2511 ) ) ( not ( = ?auto_2512 ?auto_2515 ) ) ( not ( = ?auto_2512 ?auto_2509 ) ) ( not ( = ?auto_2514 ?auto_2510 ) ) ( not ( = ?auto_2514 ?auto_2518 ) ) ( not ( = ?auto_2495 ?auto_2499 ) ) ( not ( = ?auto_2495 ?auto_2517 ) ) ( not ( = ?auto_2496 ?auto_2499 ) ) ( not ( = ?auto_2496 ?auto_2517 ) ) ( not ( = ?auto_2497 ?auto_2499 ) ) ( not ( = ?auto_2497 ?auto_2517 ) ) ( not ( = ?auto_2499 ?auto_2514 ) ) ( not ( = ?auto_2499 ?auto_2510 ) ) ( not ( = ?auto_2499 ?auto_2518 ) ) ( not ( = ?auto_2505 ?auto_2513 ) ) ( not ( = ?auto_2505 ?auto_2508 ) ) ( not ( = ?auto_2505 ?auto_2511 ) ) ( not ( = ?auto_2506 ?auto_2512 ) ) ( not ( = ?auto_2506 ?auto_2515 ) ) ( not ( = ?auto_2506 ?auto_2509 ) ) ( not ( = ?auto_2517 ?auto_2514 ) ) ( not ( = ?auto_2517 ?auto_2510 ) ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2495 ?auto_2500 ) ) ( not ( = ?auto_2495 ?auto_2516 ) ) ( not ( = ?auto_2496 ?auto_2500 ) ) ( not ( = ?auto_2496 ?auto_2516 ) ) ( not ( = ?auto_2497 ?auto_2500 ) ) ( not ( = ?auto_2497 ?auto_2516 ) ) ( not ( = ?auto_2498 ?auto_2500 ) ) ( not ( = ?auto_2498 ?auto_2516 ) ) ( not ( = ?auto_2500 ?auto_2517 ) ) ( not ( = ?auto_2500 ?auto_2514 ) ) ( not ( = ?auto_2500 ?auto_2510 ) ) ( not ( = ?auto_2500 ?auto_2518 ) ) ( not ( = ?auto_2516 ?auto_2517 ) ) ( not ( = ?auto_2516 ?auto_2514 ) ) ( not ( = ?auto_2516 ?auto_2510 ) ) ( not ( = ?auto_2516 ?auto_2518 ) ) ( not ( = ?auto_2495 ?auto_2501 ) ) ( not ( = ?auto_2495 ?auto_2507 ) ) ( not ( = ?auto_2496 ?auto_2501 ) ) ( not ( = ?auto_2496 ?auto_2507 ) ) ( not ( = ?auto_2497 ?auto_2501 ) ) ( not ( = ?auto_2497 ?auto_2507 ) ) ( not ( = ?auto_2498 ?auto_2501 ) ) ( not ( = ?auto_2498 ?auto_2507 ) ) ( not ( = ?auto_2499 ?auto_2501 ) ) ( not ( = ?auto_2499 ?auto_2507 ) ) ( not ( = ?auto_2501 ?auto_2516 ) ) ( not ( = ?auto_2501 ?auto_2517 ) ) ( not ( = ?auto_2501 ?auto_2514 ) ) ( not ( = ?auto_2501 ?auto_2510 ) ) ( not ( = ?auto_2501 ?auto_2518 ) ) ( not ( = ?auto_2507 ?auto_2516 ) ) ( not ( = ?auto_2507 ?auto_2517 ) ) ( not ( = ?auto_2507 ?auto_2514 ) ) ( not ( = ?auto_2507 ?auto_2510 ) ) ( not ( = ?auto_2507 ?auto_2518 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2495 ?auto_2496 ?auto_2497 ?auto_2498 ?auto_2499 ?auto_2500 )
      ( MAKE-1CRATE ?auto_2500 ?auto_2501 )
      ( MAKE-6CRATE-VERIFY ?auto_2495 ?auto_2496 ?auto_2497 ?auto_2498 ?auto_2499 ?auto_2500 ?auto_2501 ) )
  )

)
