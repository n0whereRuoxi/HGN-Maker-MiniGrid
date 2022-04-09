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
      ?auto_2336 - SURFACE
      ?auto_2337 - SURFACE
    )
    :vars
    (
      ?auto_2338 - HOIST
      ?auto_2339 - PLACE
      ?auto_2341 - PLACE
      ?auto_2342 - HOIST
      ?auto_2343 - SURFACE
      ?auto_2340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2338 ?auto_2339 ) ( SURFACE-AT ?auto_2336 ?auto_2339 ) ( CLEAR ?auto_2336 ) ( IS-CRATE ?auto_2337 ) ( AVAILABLE ?auto_2338 ) ( not ( = ?auto_2341 ?auto_2339 ) ) ( HOIST-AT ?auto_2342 ?auto_2341 ) ( AVAILABLE ?auto_2342 ) ( SURFACE-AT ?auto_2337 ?auto_2341 ) ( ON ?auto_2337 ?auto_2343 ) ( CLEAR ?auto_2337 ) ( TRUCK-AT ?auto_2340 ?auto_2339 ) ( not ( = ?auto_2336 ?auto_2337 ) ) ( not ( = ?auto_2336 ?auto_2343 ) ) ( not ( = ?auto_2337 ?auto_2343 ) ) ( not ( = ?auto_2338 ?auto_2342 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2340 ?auto_2339 ?auto_2341 )
      ( !LIFT ?auto_2342 ?auto_2337 ?auto_2343 ?auto_2341 )
      ( !LOAD ?auto_2342 ?auto_2337 ?auto_2340 ?auto_2341 )
      ( !DRIVE ?auto_2340 ?auto_2341 ?auto_2339 )
      ( !UNLOAD ?auto_2338 ?auto_2337 ?auto_2340 ?auto_2339 )
      ( !DROP ?auto_2338 ?auto_2337 ?auto_2336 ?auto_2339 )
      ( MAKE-1CRATE-VERIFY ?auto_2336 ?auto_2337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2346 - SURFACE
      ?auto_2347 - SURFACE
    )
    :vars
    (
      ?auto_2348 - HOIST
      ?auto_2349 - PLACE
      ?auto_2351 - PLACE
      ?auto_2352 - HOIST
      ?auto_2353 - SURFACE
      ?auto_2350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2348 ?auto_2349 ) ( SURFACE-AT ?auto_2346 ?auto_2349 ) ( CLEAR ?auto_2346 ) ( IS-CRATE ?auto_2347 ) ( AVAILABLE ?auto_2348 ) ( not ( = ?auto_2351 ?auto_2349 ) ) ( HOIST-AT ?auto_2352 ?auto_2351 ) ( AVAILABLE ?auto_2352 ) ( SURFACE-AT ?auto_2347 ?auto_2351 ) ( ON ?auto_2347 ?auto_2353 ) ( CLEAR ?auto_2347 ) ( TRUCK-AT ?auto_2350 ?auto_2349 ) ( not ( = ?auto_2346 ?auto_2347 ) ) ( not ( = ?auto_2346 ?auto_2353 ) ) ( not ( = ?auto_2347 ?auto_2353 ) ) ( not ( = ?auto_2348 ?auto_2352 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2350 ?auto_2349 ?auto_2351 )
      ( !LIFT ?auto_2352 ?auto_2347 ?auto_2353 ?auto_2351 )
      ( !LOAD ?auto_2352 ?auto_2347 ?auto_2350 ?auto_2351 )
      ( !DRIVE ?auto_2350 ?auto_2351 ?auto_2349 )
      ( !UNLOAD ?auto_2348 ?auto_2347 ?auto_2350 ?auto_2349 )
      ( !DROP ?auto_2348 ?auto_2347 ?auto_2346 ?auto_2349 )
      ( MAKE-1CRATE-VERIFY ?auto_2346 ?auto_2347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2357 - SURFACE
      ?auto_2358 - SURFACE
      ?auto_2359 - SURFACE
    )
    :vars
    (
      ?auto_2365 - HOIST
      ?auto_2361 - PLACE
      ?auto_2362 - PLACE
      ?auto_2360 - HOIST
      ?auto_2363 - SURFACE
      ?auto_2367 - PLACE
      ?auto_2368 - HOIST
      ?auto_2366 - SURFACE
      ?auto_2364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365 ?auto_2361 ) ( IS-CRATE ?auto_2359 ) ( not ( = ?auto_2362 ?auto_2361 ) ) ( HOIST-AT ?auto_2360 ?auto_2362 ) ( AVAILABLE ?auto_2360 ) ( SURFACE-AT ?auto_2359 ?auto_2362 ) ( ON ?auto_2359 ?auto_2363 ) ( CLEAR ?auto_2359 ) ( not ( = ?auto_2358 ?auto_2359 ) ) ( not ( = ?auto_2358 ?auto_2363 ) ) ( not ( = ?auto_2359 ?auto_2363 ) ) ( not ( = ?auto_2365 ?auto_2360 ) ) ( SURFACE-AT ?auto_2357 ?auto_2361 ) ( CLEAR ?auto_2357 ) ( IS-CRATE ?auto_2358 ) ( AVAILABLE ?auto_2365 ) ( not ( = ?auto_2367 ?auto_2361 ) ) ( HOIST-AT ?auto_2368 ?auto_2367 ) ( AVAILABLE ?auto_2368 ) ( SURFACE-AT ?auto_2358 ?auto_2367 ) ( ON ?auto_2358 ?auto_2366 ) ( CLEAR ?auto_2358 ) ( TRUCK-AT ?auto_2364 ?auto_2361 ) ( not ( = ?auto_2357 ?auto_2358 ) ) ( not ( = ?auto_2357 ?auto_2366 ) ) ( not ( = ?auto_2358 ?auto_2366 ) ) ( not ( = ?auto_2365 ?auto_2368 ) ) ( not ( = ?auto_2357 ?auto_2359 ) ) ( not ( = ?auto_2357 ?auto_2363 ) ) ( not ( = ?auto_2359 ?auto_2366 ) ) ( not ( = ?auto_2362 ?auto_2367 ) ) ( not ( = ?auto_2360 ?auto_2368 ) ) ( not ( = ?auto_2363 ?auto_2366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2357 ?auto_2358 )
      ( MAKE-1CRATE ?auto_2358 ?auto_2359 )
      ( MAKE-2CRATE-VERIFY ?auto_2357 ?auto_2358 ?auto_2359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2371 - SURFACE
      ?auto_2372 - SURFACE
    )
    :vars
    (
      ?auto_2373 - HOIST
      ?auto_2374 - PLACE
      ?auto_2376 - PLACE
      ?auto_2377 - HOIST
      ?auto_2378 - SURFACE
      ?auto_2375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2373 ?auto_2374 ) ( SURFACE-AT ?auto_2371 ?auto_2374 ) ( CLEAR ?auto_2371 ) ( IS-CRATE ?auto_2372 ) ( AVAILABLE ?auto_2373 ) ( not ( = ?auto_2376 ?auto_2374 ) ) ( HOIST-AT ?auto_2377 ?auto_2376 ) ( AVAILABLE ?auto_2377 ) ( SURFACE-AT ?auto_2372 ?auto_2376 ) ( ON ?auto_2372 ?auto_2378 ) ( CLEAR ?auto_2372 ) ( TRUCK-AT ?auto_2375 ?auto_2374 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( not ( = ?auto_2371 ?auto_2378 ) ) ( not ( = ?auto_2372 ?auto_2378 ) ) ( not ( = ?auto_2373 ?auto_2377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2375 ?auto_2374 ?auto_2376 )
      ( !LIFT ?auto_2377 ?auto_2372 ?auto_2378 ?auto_2376 )
      ( !LOAD ?auto_2377 ?auto_2372 ?auto_2375 ?auto_2376 )
      ( !DRIVE ?auto_2375 ?auto_2376 ?auto_2374 )
      ( !UNLOAD ?auto_2373 ?auto_2372 ?auto_2375 ?auto_2374 )
      ( !DROP ?auto_2373 ?auto_2372 ?auto_2371 ?auto_2374 )
      ( MAKE-1CRATE-VERIFY ?auto_2371 ?auto_2372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2383 - SURFACE
      ?auto_2384 - SURFACE
      ?auto_2385 - SURFACE
      ?auto_2386 - SURFACE
    )
    :vars
    (
      ?auto_2389 - HOIST
      ?auto_2392 - PLACE
      ?auto_2390 - PLACE
      ?auto_2387 - HOIST
      ?auto_2388 - SURFACE
      ?auto_2396 - SURFACE
      ?auto_2393 - PLACE
      ?auto_2394 - HOIST
      ?auto_2395 - SURFACE
      ?auto_2391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2389 ?auto_2392 ) ( IS-CRATE ?auto_2386 ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( HOIST-AT ?auto_2387 ?auto_2390 ) ( SURFACE-AT ?auto_2386 ?auto_2390 ) ( ON ?auto_2386 ?auto_2388 ) ( CLEAR ?auto_2386 ) ( not ( = ?auto_2385 ?auto_2386 ) ) ( not ( = ?auto_2385 ?auto_2388 ) ) ( not ( = ?auto_2386 ?auto_2388 ) ) ( not ( = ?auto_2389 ?auto_2387 ) ) ( IS-CRATE ?auto_2385 ) ( AVAILABLE ?auto_2387 ) ( SURFACE-AT ?auto_2385 ?auto_2390 ) ( ON ?auto_2385 ?auto_2396 ) ( CLEAR ?auto_2385 ) ( not ( = ?auto_2384 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2396 ) ) ( not ( = ?auto_2385 ?auto_2396 ) ) ( SURFACE-AT ?auto_2383 ?auto_2392 ) ( CLEAR ?auto_2383 ) ( IS-CRATE ?auto_2384 ) ( AVAILABLE ?auto_2389 ) ( not ( = ?auto_2393 ?auto_2392 ) ) ( HOIST-AT ?auto_2394 ?auto_2393 ) ( AVAILABLE ?auto_2394 ) ( SURFACE-AT ?auto_2384 ?auto_2393 ) ( ON ?auto_2384 ?auto_2395 ) ( CLEAR ?auto_2384 ) ( TRUCK-AT ?auto_2391 ?auto_2392 ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2383 ?auto_2395 ) ) ( not ( = ?auto_2384 ?auto_2395 ) ) ( not ( = ?auto_2389 ?auto_2394 ) ) ( not ( = ?auto_2383 ?auto_2385 ) ) ( not ( = ?auto_2383 ?auto_2396 ) ) ( not ( = ?auto_2385 ?auto_2395 ) ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( not ( = ?auto_2387 ?auto_2394 ) ) ( not ( = ?auto_2396 ?auto_2395 ) ) ( not ( = ?auto_2383 ?auto_2386 ) ) ( not ( = ?auto_2383 ?auto_2388 ) ) ( not ( = ?auto_2384 ?auto_2386 ) ) ( not ( = ?auto_2384 ?auto_2388 ) ) ( not ( = ?auto_2386 ?auto_2396 ) ) ( not ( = ?auto_2386 ?auto_2395 ) ) ( not ( = ?auto_2388 ?auto_2396 ) ) ( not ( = ?auto_2388 ?auto_2395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2383 ?auto_2384 ?auto_2385 )
      ( MAKE-1CRATE ?auto_2385 ?auto_2386 )
      ( MAKE-3CRATE-VERIFY ?auto_2383 ?auto_2384 ?auto_2385 ?auto_2386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2399 - SURFACE
      ?auto_2400 - SURFACE
    )
    :vars
    (
      ?auto_2401 - HOIST
      ?auto_2402 - PLACE
      ?auto_2404 - PLACE
      ?auto_2405 - HOIST
      ?auto_2406 - SURFACE
      ?auto_2403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401 ?auto_2402 ) ( SURFACE-AT ?auto_2399 ?auto_2402 ) ( CLEAR ?auto_2399 ) ( IS-CRATE ?auto_2400 ) ( AVAILABLE ?auto_2401 ) ( not ( = ?auto_2404 ?auto_2402 ) ) ( HOIST-AT ?auto_2405 ?auto_2404 ) ( AVAILABLE ?auto_2405 ) ( SURFACE-AT ?auto_2400 ?auto_2404 ) ( ON ?auto_2400 ?auto_2406 ) ( CLEAR ?auto_2400 ) ( TRUCK-AT ?auto_2403 ?auto_2402 ) ( not ( = ?auto_2399 ?auto_2400 ) ) ( not ( = ?auto_2399 ?auto_2406 ) ) ( not ( = ?auto_2400 ?auto_2406 ) ) ( not ( = ?auto_2401 ?auto_2405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2403 ?auto_2402 ?auto_2404 )
      ( !LIFT ?auto_2405 ?auto_2400 ?auto_2406 ?auto_2404 )
      ( !LOAD ?auto_2405 ?auto_2400 ?auto_2403 ?auto_2404 )
      ( !DRIVE ?auto_2403 ?auto_2404 ?auto_2402 )
      ( !UNLOAD ?auto_2401 ?auto_2400 ?auto_2403 ?auto_2402 )
      ( !DROP ?auto_2401 ?auto_2400 ?auto_2399 ?auto_2402 )
      ( MAKE-1CRATE-VERIFY ?auto_2399 ?auto_2400 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2412 - SURFACE
      ?auto_2413 - SURFACE
      ?auto_2414 - SURFACE
      ?auto_2415 - SURFACE
      ?auto_2416 - SURFACE
    )
    :vars
    (
      ?auto_2422 - HOIST
      ?auto_2419 - PLACE
      ?auto_2420 - PLACE
      ?auto_2418 - HOIST
      ?auto_2417 - SURFACE
      ?auto_2429 - PLACE
      ?auto_2426 - HOIST
      ?auto_2427 - SURFACE
      ?auto_2424 - SURFACE
      ?auto_2423 - PLACE
      ?auto_2428 - HOIST
      ?auto_2425 - SURFACE
      ?auto_2421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2422 ?auto_2419 ) ( IS-CRATE ?auto_2416 ) ( not ( = ?auto_2420 ?auto_2419 ) ) ( HOIST-AT ?auto_2418 ?auto_2420 ) ( AVAILABLE ?auto_2418 ) ( SURFACE-AT ?auto_2416 ?auto_2420 ) ( ON ?auto_2416 ?auto_2417 ) ( CLEAR ?auto_2416 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( not ( = ?auto_2415 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2422 ?auto_2418 ) ) ( IS-CRATE ?auto_2415 ) ( not ( = ?auto_2429 ?auto_2419 ) ) ( HOIST-AT ?auto_2426 ?auto_2429 ) ( SURFACE-AT ?auto_2415 ?auto_2429 ) ( ON ?auto_2415 ?auto_2427 ) ( CLEAR ?auto_2415 ) ( not ( = ?auto_2414 ?auto_2415 ) ) ( not ( = ?auto_2414 ?auto_2427 ) ) ( not ( = ?auto_2415 ?auto_2427 ) ) ( not ( = ?auto_2422 ?auto_2426 ) ) ( IS-CRATE ?auto_2414 ) ( AVAILABLE ?auto_2426 ) ( SURFACE-AT ?auto_2414 ?auto_2429 ) ( ON ?auto_2414 ?auto_2424 ) ( CLEAR ?auto_2414 ) ( not ( = ?auto_2413 ?auto_2414 ) ) ( not ( = ?auto_2413 ?auto_2424 ) ) ( not ( = ?auto_2414 ?auto_2424 ) ) ( SURFACE-AT ?auto_2412 ?auto_2419 ) ( CLEAR ?auto_2412 ) ( IS-CRATE ?auto_2413 ) ( AVAILABLE ?auto_2422 ) ( not ( = ?auto_2423 ?auto_2419 ) ) ( HOIST-AT ?auto_2428 ?auto_2423 ) ( AVAILABLE ?auto_2428 ) ( SURFACE-AT ?auto_2413 ?auto_2423 ) ( ON ?auto_2413 ?auto_2425 ) ( CLEAR ?auto_2413 ) ( TRUCK-AT ?auto_2421 ?auto_2419 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( not ( = ?auto_2412 ?auto_2425 ) ) ( not ( = ?auto_2413 ?auto_2425 ) ) ( not ( = ?auto_2422 ?auto_2428 ) ) ( not ( = ?auto_2412 ?auto_2414 ) ) ( not ( = ?auto_2412 ?auto_2424 ) ) ( not ( = ?auto_2414 ?auto_2425 ) ) ( not ( = ?auto_2429 ?auto_2423 ) ) ( not ( = ?auto_2426 ?auto_2428 ) ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( not ( = ?auto_2412 ?auto_2415 ) ) ( not ( = ?auto_2412 ?auto_2427 ) ) ( not ( = ?auto_2413 ?auto_2415 ) ) ( not ( = ?auto_2413 ?auto_2427 ) ) ( not ( = ?auto_2415 ?auto_2424 ) ) ( not ( = ?auto_2415 ?auto_2425 ) ) ( not ( = ?auto_2427 ?auto_2424 ) ) ( not ( = ?auto_2427 ?auto_2425 ) ) ( not ( = ?auto_2412 ?auto_2416 ) ) ( not ( = ?auto_2412 ?auto_2417 ) ) ( not ( = ?auto_2413 ?auto_2416 ) ) ( not ( = ?auto_2413 ?auto_2417 ) ) ( not ( = ?auto_2414 ?auto_2416 ) ) ( not ( = ?auto_2414 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2427 ) ) ( not ( = ?auto_2416 ?auto_2424 ) ) ( not ( = ?auto_2416 ?auto_2425 ) ) ( not ( = ?auto_2420 ?auto_2429 ) ) ( not ( = ?auto_2420 ?auto_2423 ) ) ( not ( = ?auto_2418 ?auto_2426 ) ) ( not ( = ?auto_2418 ?auto_2428 ) ) ( not ( = ?auto_2417 ?auto_2427 ) ) ( not ( = ?auto_2417 ?auto_2424 ) ) ( not ( = ?auto_2417 ?auto_2425 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2412 ?auto_2413 ?auto_2414 ?auto_2415 )
      ( MAKE-1CRATE ?auto_2415 ?auto_2416 )
      ( MAKE-4CRATE-VERIFY ?auto_2412 ?auto_2413 ?auto_2414 ?auto_2415 ?auto_2416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2432 - SURFACE
      ?auto_2433 - SURFACE
    )
    :vars
    (
      ?auto_2434 - HOIST
      ?auto_2435 - PLACE
      ?auto_2437 - PLACE
      ?auto_2438 - HOIST
      ?auto_2439 - SURFACE
      ?auto_2436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2434 ?auto_2435 ) ( SURFACE-AT ?auto_2432 ?auto_2435 ) ( CLEAR ?auto_2432 ) ( IS-CRATE ?auto_2433 ) ( AVAILABLE ?auto_2434 ) ( not ( = ?auto_2437 ?auto_2435 ) ) ( HOIST-AT ?auto_2438 ?auto_2437 ) ( AVAILABLE ?auto_2438 ) ( SURFACE-AT ?auto_2433 ?auto_2437 ) ( ON ?auto_2433 ?auto_2439 ) ( CLEAR ?auto_2433 ) ( TRUCK-AT ?auto_2436 ?auto_2435 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( not ( = ?auto_2432 ?auto_2439 ) ) ( not ( = ?auto_2433 ?auto_2439 ) ) ( not ( = ?auto_2434 ?auto_2438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2436 ?auto_2435 ?auto_2437 )
      ( !LIFT ?auto_2438 ?auto_2433 ?auto_2439 ?auto_2437 )
      ( !LOAD ?auto_2438 ?auto_2433 ?auto_2436 ?auto_2437 )
      ( !DRIVE ?auto_2436 ?auto_2437 ?auto_2435 )
      ( !UNLOAD ?auto_2434 ?auto_2433 ?auto_2436 ?auto_2435 )
      ( !DROP ?auto_2434 ?auto_2433 ?auto_2432 ?auto_2435 )
      ( MAKE-1CRATE-VERIFY ?auto_2432 ?auto_2433 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2446 - SURFACE
      ?auto_2447 - SURFACE
      ?auto_2448 - SURFACE
      ?auto_2449 - SURFACE
      ?auto_2450 - SURFACE
      ?auto_2451 - SURFACE
    )
    :vars
    (
      ?auto_2456 - HOIST
      ?auto_2457 - PLACE
      ?auto_2455 - PLACE
      ?auto_2454 - HOIST
      ?auto_2453 - SURFACE
      ?auto_2463 - PLACE
      ?auto_2458 - HOIST
      ?auto_2462 - SURFACE
      ?auto_2461 - SURFACE
      ?auto_2459 - SURFACE
      ?auto_2464 - PLACE
      ?auto_2460 - HOIST
      ?auto_2465 - SURFACE
      ?auto_2452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2456 ?auto_2457 ) ( IS-CRATE ?auto_2451 ) ( not ( = ?auto_2455 ?auto_2457 ) ) ( HOIST-AT ?auto_2454 ?auto_2455 ) ( SURFACE-AT ?auto_2451 ?auto_2455 ) ( ON ?auto_2451 ?auto_2453 ) ( CLEAR ?auto_2451 ) ( not ( = ?auto_2450 ?auto_2451 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) ( not ( = ?auto_2451 ?auto_2453 ) ) ( not ( = ?auto_2456 ?auto_2454 ) ) ( IS-CRATE ?auto_2450 ) ( not ( = ?auto_2463 ?auto_2457 ) ) ( HOIST-AT ?auto_2458 ?auto_2463 ) ( AVAILABLE ?auto_2458 ) ( SURFACE-AT ?auto_2450 ?auto_2463 ) ( ON ?auto_2450 ?auto_2462 ) ( CLEAR ?auto_2450 ) ( not ( = ?auto_2449 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2462 ) ) ( not ( = ?auto_2450 ?auto_2462 ) ) ( not ( = ?auto_2456 ?auto_2458 ) ) ( IS-CRATE ?auto_2449 ) ( SURFACE-AT ?auto_2449 ?auto_2455 ) ( ON ?auto_2449 ?auto_2461 ) ( CLEAR ?auto_2449 ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2461 ) ) ( not ( = ?auto_2449 ?auto_2461 ) ) ( IS-CRATE ?auto_2448 ) ( AVAILABLE ?auto_2454 ) ( SURFACE-AT ?auto_2448 ?auto_2455 ) ( ON ?auto_2448 ?auto_2459 ) ( CLEAR ?auto_2448 ) ( not ( = ?auto_2447 ?auto_2448 ) ) ( not ( = ?auto_2447 ?auto_2459 ) ) ( not ( = ?auto_2448 ?auto_2459 ) ) ( SURFACE-AT ?auto_2446 ?auto_2457 ) ( CLEAR ?auto_2446 ) ( IS-CRATE ?auto_2447 ) ( AVAILABLE ?auto_2456 ) ( not ( = ?auto_2464 ?auto_2457 ) ) ( HOIST-AT ?auto_2460 ?auto_2464 ) ( AVAILABLE ?auto_2460 ) ( SURFACE-AT ?auto_2447 ?auto_2464 ) ( ON ?auto_2447 ?auto_2465 ) ( CLEAR ?auto_2447 ) ( TRUCK-AT ?auto_2452 ?auto_2457 ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2465 ) ) ( not ( = ?auto_2447 ?auto_2465 ) ) ( not ( = ?auto_2456 ?auto_2460 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) ( not ( = ?auto_2446 ?auto_2459 ) ) ( not ( = ?auto_2448 ?auto_2465 ) ) ( not ( = ?auto_2455 ?auto_2464 ) ) ( not ( = ?auto_2454 ?auto_2460 ) ) ( not ( = ?auto_2459 ?auto_2465 ) ) ( not ( = ?auto_2446 ?auto_2449 ) ) ( not ( = ?auto_2446 ?auto_2461 ) ) ( not ( = ?auto_2447 ?auto_2449 ) ) ( not ( = ?auto_2447 ?auto_2461 ) ) ( not ( = ?auto_2449 ?auto_2459 ) ) ( not ( = ?auto_2449 ?auto_2465 ) ) ( not ( = ?auto_2461 ?auto_2459 ) ) ( not ( = ?auto_2461 ?auto_2465 ) ) ( not ( = ?auto_2446 ?auto_2450 ) ) ( not ( = ?auto_2446 ?auto_2462 ) ) ( not ( = ?auto_2447 ?auto_2450 ) ) ( not ( = ?auto_2447 ?auto_2462 ) ) ( not ( = ?auto_2448 ?auto_2450 ) ) ( not ( = ?auto_2448 ?auto_2462 ) ) ( not ( = ?auto_2450 ?auto_2461 ) ) ( not ( = ?auto_2450 ?auto_2459 ) ) ( not ( = ?auto_2450 ?auto_2465 ) ) ( not ( = ?auto_2463 ?auto_2455 ) ) ( not ( = ?auto_2463 ?auto_2464 ) ) ( not ( = ?auto_2458 ?auto_2454 ) ) ( not ( = ?auto_2458 ?auto_2460 ) ) ( not ( = ?auto_2462 ?auto_2461 ) ) ( not ( = ?auto_2462 ?auto_2459 ) ) ( not ( = ?auto_2462 ?auto_2465 ) ) ( not ( = ?auto_2446 ?auto_2451 ) ) ( not ( = ?auto_2446 ?auto_2453 ) ) ( not ( = ?auto_2447 ?auto_2451 ) ) ( not ( = ?auto_2447 ?auto_2453 ) ) ( not ( = ?auto_2448 ?auto_2451 ) ) ( not ( = ?auto_2448 ?auto_2453 ) ) ( not ( = ?auto_2449 ?auto_2451 ) ) ( not ( = ?auto_2449 ?auto_2453 ) ) ( not ( = ?auto_2451 ?auto_2462 ) ) ( not ( = ?auto_2451 ?auto_2461 ) ) ( not ( = ?auto_2451 ?auto_2459 ) ) ( not ( = ?auto_2451 ?auto_2465 ) ) ( not ( = ?auto_2453 ?auto_2462 ) ) ( not ( = ?auto_2453 ?auto_2461 ) ) ( not ( = ?auto_2453 ?auto_2459 ) ) ( not ( = ?auto_2453 ?auto_2465 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2449 ?auto_2450 )
      ( MAKE-1CRATE ?auto_2450 ?auto_2451 )
      ( MAKE-5CRATE-VERIFY ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2449 ?auto_2450 ?auto_2451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2468 - SURFACE
      ?auto_2469 - SURFACE
    )
    :vars
    (
      ?auto_2470 - HOIST
      ?auto_2471 - PLACE
      ?auto_2473 - PLACE
      ?auto_2474 - HOIST
      ?auto_2475 - SURFACE
      ?auto_2472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2470 ?auto_2471 ) ( SURFACE-AT ?auto_2468 ?auto_2471 ) ( CLEAR ?auto_2468 ) ( IS-CRATE ?auto_2469 ) ( AVAILABLE ?auto_2470 ) ( not ( = ?auto_2473 ?auto_2471 ) ) ( HOIST-AT ?auto_2474 ?auto_2473 ) ( AVAILABLE ?auto_2474 ) ( SURFACE-AT ?auto_2469 ?auto_2473 ) ( ON ?auto_2469 ?auto_2475 ) ( CLEAR ?auto_2469 ) ( TRUCK-AT ?auto_2472 ?auto_2471 ) ( not ( = ?auto_2468 ?auto_2469 ) ) ( not ( = ?auto_2468 ?auto_2475 ) ) ( not ( = ?auto_2469 ?auto_2475 ) ) ( not ( = ?auto_2470 ?auto_2474 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2472 ?auto_2471 ?auto_2473 )
      ( !LIFT ?auto_2474 ?auto_2469 ?auto_2475 ?auto_2473 )
      ( !LOAD ?auto_2474 ?auto_2469 ?auto_2472 ?auto_2473 )
      ( !DRIVE ?auto_2472 ?auto_2473 ?auto_2471 )
      ( !UNLOAD ?auto_2470 ?auto_2469 ?auto_2472 ?auto_2471 )
      ( !DROP ?auto_2470 ?auto_2469 ?auto_2468 ?auto_2471 )
      ( MAKE-1CRATE-VERIFY ?auto_2468 ?auto_2469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2483 - SURFACE
      ?auto_2484 - SURFACE
      ?auto_2485 - SURFACE
      ?auto_2486 - SURFACE
      ?auto_2487 - SURFACE
      ?auto_2488 - SURFACE
      ?auto_2489 - SURFACE
    )
    :vars
    (
      ?auto_2492 - HOIST
      ?auto_2495 - PLACE
      ?auto_2494 - PLACE
      ?auto_2491 - HOIST
      ?auto_2493 - SURFACE
      ?auto_2497 - PLACE
      ?auto_2503 - HOIST
      ?auto_2496 - SURFACE
      ?auto_2502 - SURFACE
      ?auto_2499 - SURFACE
      ?auto_2504 - SURFACE
      ?auto_2501 - PLACE
      ?auto_2498 - HOIST
      ?auto_2500 - SURFACE
      ?auto_2490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2492 ?auto_2495 ) ( IS-CRATE ?auto_2489 ) ( not ( = ?auto_2494 ?auto_2495 ) ) ( HOIST-AT ?auto_2491 ?auto_2494 ) ( SURFACE-AT ?auto_2489 ?auto_2494 ) ( ON ?auto_2489 ?auto_2493 ) ( CLEAR ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2489 ) ) ( not ( = ?auto_2488 ?auto_2493 ) ) ( not ( = ?auto_2489 ?auto_2493 ) ) ( not ( = ?auto_2492 ?auto_2491 ) ) ( IS-CRATE ?auto_2488 ) ( not ( = ?auto_2497 ?auto_2495 ) ) ( HOIST-AT ?auto_2503 ?auto_2497 ) ( SURFACE-AT ?auto_2488 ?auto_2497 ) ( ON ?auto_2488 ?auto_2496 ) ( CLEAR ?auto_2488 ) ( not ( = ?auto_2487 ?auto_2488 ) ) ( not ( = ?auto_2487 ?auto_2496 ) ) ( not ( = ?auto_2488 ?auto_2496 ) ) ( not ( = ?auto_2492 ?auto_2503 ) ) ( IS-CRATE ?auto_2487 ) ( AVAILABLE ?auto_2491 ) ( SURFACE-AT ?auto_2487 ?auto_2494 ) ( ON ?auto_2487 ?auto_2502 ) ( CLEAR ?auto_2487 ) ( not ( = ?auto_2486 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2502 ) ) ( not ( = ?auto_2487 ?auto_2502 ) ) ( IS-CRATE ?auto_2486 ) ( SURFACE-AT ?auto_2486 ?auto_2497 ) ( ON ?auto_2486 ?auto_2499 ) ( CLEAR ?auto_2486 ) ( not ( = ?auto_2485 ?auto_2486 ) ) ( not ( = ?auto_2485 ?auto_2499 ) ) ( not ( = ?auto_2486 ?auto_2499 ) ) ( IS-CRATE ?auto_2485 ) ( AVAILABLE ?auto_2503 ) ( SURFACE-AT ?auto_2485 ?auto_2497 ) ( ON ?auto_2485 ?auto_2504 ) ( CLEAR ?auto_2485 ) ( not ( = ?auto_2484 ?auto_2485 ) ) ( not ( = ?auto_2484 ?auto_2504 ) ) ( not ( = ?auto_2485 ?auto_2504 ) ) ( SURFACE-AT ?auto_2483 ?auto_2495 ) ( CLEAR ?auto_2483 ) ( IS-CRATE ?auto_2484 ) ( AVAILABLE ?auto_2492 ) ( not ( = ?auto_2501 ?auto_2495 ) ) ( HOIST-AT ?auto_2498 ?auto_2501 ) ( AVAILABLE ?auto_2498 ) ( SURFACE-AT ?auto_2484 ?auto_2501 ) ( ON ?auto_2484 ?auto_2500 ) ( CLEAR ?auto_2484 ) ( TRUCK-AT ?auto_2490 ?auto_2495 ) ( not ( = ?auto_2483 ?auto_2484 ) ) ( not ( = ?auto_2483 ?auto_2500 ) ) ( not ( = ?auto_2484 ?auto_2500 ) ) ( not ( = ?auto_2492 ?auto_2498 ) ) ( not ( = ?auto_2483 ?auto_2485 ) ) ( not ( = ?auto_2483 ?auto_2504 ) ) ( not ( = ?auto_2485 ?auto_2500 ) ) ( not ( = ?auto_2497 ?auto_2501 ) ) ( not ( = ?auto_2503 ?auto_2498 ) ) ( not ( = ?auto_2504 ?auto_2500 ) ) ( not ( = ?auto_2483 ?auto_2486 ) ) ( not ( = ?auto_2483 ?auto_2499 ) ) ( not ( = ?auto_2484 ?auto_2486 ) ) ( not ( = ?auto_2484 ?auto_2499 ) ) ( not ( = ?auto_2486 ?auto_2504 ) ) ( not ( = ?auto_2486 ?auto_2500 ) ) ( not ( = ?auto_2499 ?auto_2504 ) ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2483 ?auto_2487 ) ) ( not ( = ?auto_2483 ?auto_2502 ) ) ( not ( = ?auto_2484 ?auto_2487 ) ) ( not ( = ?auto_2484 ?auto_2502 ) ) ( not ( = ?auto_2485 ?auto_2487 ) ) ( not ( = ?auto_2485 ?auto_2502 ) ) ( not ( = ?auto_2487 ?auto_2499 ) ) ( not ( = ?auto_2487 ?auto_2504 ) ) ( not ( = ?auto_2487 ?auto_2500 ) ) ( not ( = ?auto_2494 ?auto_2497 ) ) ( not ( = ?auto_2494 ?auto_2501 ) ) ( not ( = ?auto_2491 ?auto_2503 ) ) ( not ( = ?auto_2491 ?auto_2498 ) ) ( not ( = ?auto_2502 ?auto_2499 ) ) ( not ( = ?auto_2502 ?auto_2504 ) ) ( not ( = ?auto_2502 ?auto_2500 ) ) ( not ( = ?auto_2483 ?auto_2488 ) ) ( not ( = ?auto_2483 ?auto_2496 ) ) ( not ( = ?auto_2484 ?auto_2488 ) ) ( not ( = ?auto_2484 ?auto_2496 ) ) ( not ( = ?auto_2485 ?auto_2488 ) ) ( not ( = ?auto_2485 ?auto_2496 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2496 ) ) ( not ( = ?auto_2488 ?auto_2502 ) ) ( not ( = ?auto_2488 ?auto_2499 ) ) ( not ( = ?auto_2488 ?auto_2504 ) ) ( not ( = ?auto_2488 ?auto_2500 ) ) ( not ( = ?auto_2496 ?auto_2502 ) ) ( not ( = ?auto_2496 ?auto_2499 ) ) ( not ( = ?auto_2496 ?auto_2504 ) ) ( not ( = ?auto_2496 ?auto_2500 ) ) ( not ( = ?auto_2483 ?auto_2489 ) ) ( not ( = ?auto_2483 ?auto_2493 ) ) ( not ( = ?auto_2484 ?auto_2489 ) ) ( not ( = ?auto_2484 ?auto_2493 ) ) ( not ( = ?auto_2485 ?auto_2489 ) ) ( not ( = ?auto_2485 ?auto_2493 ) ) ( not ( = ?auto_2486 ?auto_2489 ) ) ( not ( = ?auto_2486 ?auto_2493 ) ) ( not ( = ?auto_2487 ?auto_2489 ) ) ( not ( = ?auto_2487 ?auto_2493 ) ) ( not ( = ?auto_2489 ?auto_2496 ) ) ( not ( = ?auto_2489 ?auto_2502 ) ) ( not ( = ?auto_2489 ?auto_2499 ) ) ( not ( = ?auto_2489 ?auto_2504 ) ) ( not ( = ?auto_2489 ?auto_2500 ) ) ( not ( = ?auto_2493 ?auto_2496 ) ) ( not ( = ?auto_2493 ?auto_2502 ) ) ( not ( = ?auto_2493 ?auto_2499 ) ) ( not ( = ?auto_2493 ?auto_2504 ) ) ( not ( = ?auto_2493 ?auto_2500 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2488 )
      ( MAKE-1CRATE ?auto_2488 ?auto_2489 )
      ( MAKE-6CRATE-VERIFY ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2488 ?auto_2489 ) )
  )

)

