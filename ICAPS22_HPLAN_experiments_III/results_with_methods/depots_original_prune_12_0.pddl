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

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592321 - SURFACE
      ?auto_592322 - SURFACE
    )
    :vars
    (
      ?auto_592323 - HOIST
      ?auto_592324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592323 ?auto_592324 ) ( SURFACE-AT ?auto_592321 ?auto_592324 ) ( CLEAR ?auto_592321 ) ( LIFTING ?auto_592323 ?auto_592322 ) ( IS-CRATE ?auto_592322 ) ( not ( = ?auto_592321 ?auto_592322 ) ) )
    :subtasks
    ( ( !DROP ?auto_592323 ?auto_592322 ?auto_592321 ?auto_592324 )
      ( MAKE-1CRATE-VERIFY ?auto_592321 ?auto_592322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592325 - SURFACE
      ?auto_592326 - SURFACE
    )
    :vars
    (
      ?auto_592328 - HOIST
      ?auto_592327 - PLACE
      ?auto_592329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592328 ?auto_592327 ) ( SURFACE-AT ?auto_592325 ?auto_592327 ) ( CLEAR ?auto_592325 ) ( IS-CRATE ?auto_592326 ) ( not ( = ?auto_592325 ?auto_592326 ) ) ( TRUCK-AT ?auto_592329 ?auto_592327 ) ( AVAILABLE ?auto_592328 ) ( IN ?auto_592326 ?auto_592329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_592328 ?auto_592326 ?auto_592329 ?auto_592327 )
      ( MAKE-1CRATE ?auto_592325 ?auto_592326 )
      ( MAKE-1CRATE-VERIFY ?auto_592325 ?auto_592326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592330 - SURFACE
      ?auto_592331 - SURFACE
    )
    :vars
    (
      ?auto_592334 - HOIST
      ?auto_592332 - PLACE
      ?auto_592333 - TRUCK
      ?auto_592335 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592334 ?auto_592332 ) ( SURFACE-AT ?auto_592330 ?auto_592332 ) ( CLEAR ?auto_592330 ) ( IS-CRATE ?auto_592331 ) ( not ( = ?auto_592330 ?auto_592331 ) ) ( AVAILABLE ?auto_592334 ) ( IN ?auto_592331 ?auto_592333 ) ( TRUCK-AT ?auto_592333 ?auto_592335 ) ( not ( = ?auto_592335 ?auto_592332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592333 ?auto_592335 ?auto_592332 )
      ( MAKE-1CRATE ?auto_592330 ?auto_592331 )
      ( MAKE-1CRATE-VERIFY ?auto_592330 ?auto_592331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592336 - SURFACE
      ?auto_592337 - SURFACE
    )
    :vars
    (
      ?auto_592341 - HOIST
      ?auto_592339 - PLACE
      ?auto_592340 - TRUCK
      ?auto_592338 - PLACE
      ?auto_592342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592341 ?auto_592339 ) ( SURFACE-AT ?auto_592336 ?auto_592339 ) ( CLEAR ?auto_592336 ) ( IS-CRATE ?auto_592337 ) ( not ( = ?auto_592336 ?auto_592337 ) ) ( AVAILABLE ?auto_592341 ) ( TRUCK-AT ?auto_592340 ?auto_592338 ) ( not ( = ?auto_592338 ?auto_592339 ) ) ( HOIST-AT ?auto_592342 ?auto_592338 ) ( LIFTING ?auto_592342 ?auto_592337 ) ( not ( = ?auto_592341 ?auto_592342 ) ) )
    :subtasks
    ( ( !LOAD ?auto_592342 ?auto_592337 ?auto_592340 ?auto_592338 )
      ( MAKE-1CRATE ?auto_592336 ?auto_592337 )
      ( MAKE-1CRATE-VERIFY ?auto_592336 ?auto_592337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592343 - SURFACE
      ?auto_592344 - SURFACE
    )
    :vars
    (
      ?auto_592347 - HOIST
      ?auto_592348 - PLACE
      ?auto_592345 - TRUCK
      ?auto_592346 - PLACE
      ?auto_592349 - HOIST
      ?auto_592350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592347 ?auto_592348 ) ( SURFACE-AT ?auto_592343 ?auto_592348 ) ( CLEAR ?auto_592343 ) ( IS-CRATE ?auto_592344 ) ( not ( = ?auto_592343 ?auto_592344 ) ) ( AVAILABLE ?auto_592347 ) ( TRUCK-AT ?auto_592345 ?auto_592346 ) ( not ( = ?auto_592346 ?auto_592348 ) ) ( HOIST-AT ?auto_592349 ?auto_592346 ) ( not ( = ?auto_592347 ?auto_592349 ) ) ( AVAILABLE ?auto_592349 ) ( SURFACE-AT ?auto_592344 ?auto_592346 ) ( ON ?auto_592344 ?auto_592350 ) ( CLEAR ?auto_592344 ) ( not ( = ?auto_592343 ?auto_592350 ) ) ( not ( = ?auto_592344 ?auto_592350 ) ) )
    :subtasks
    ( ( !LIFT ?auto_592349 ?auto_592344 ?auto_592350 ?auto_592346 )
      ( MAKE-1CRATE ?auto_592343 ?auto_592344 )
      ( MAKE-1CRATE-VERIFY ?auto_592343 ?auto_592344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592351 - SURFACE
      ?auto_592352 - SURFACE
    )
    :vars
    (
      ?auto_592355 - HOIST
      ?auto_592354 - PLACE
      ?auto_592357 - PLACE
      ?auto_592358 - HOIST
      ?auto_592353 - SURFACE
      ?auto_592356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592355 ?auto_592354 ) ( SURFACE-AT ?auto_592351 ?auto_592354 ) ( CLEAR ?auto_592351 ) ( IS-CRATE ?auto_592352 ) ( not ( = ?auto_592351 ?auto_592352 ) ) ( AVAILABLE ?auto_592355 ) ( not ( = ?auto_592357 ?auto_592354 ) ) ( HOIST-AT ?auto_592358 ?auto_592357 ) ( not ( = ?auto_592355 ?auto_592358 ) ) ( AVAILABLE ?auto_592358 ) ( SURFACE-AT ?auto_592352 ?auto_592357 ) ( ON ?auto_592352 ?auto_592353 ) ( CLEAR ?auto_592352 ) ( not ( = ?auto_592351 ?auto_592353 ) ) ( not ( = ?auto_592352 ?auto_592353 ) ) ( TRUCK-AT ?auto_592356 ?auto_592354 ) )
    :subtasks
    ( ( !DRIVE ?auto_592356 ?auto_592354 ?auto_592357 )
      ( MAKE-1CRATE ?auto_592351 ?auto_592352 )
      ( MAKE-1CRATE-VERIFY ?auto_592351 ?auto_592352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592368 - SURFACE
      ?auto_592369 - SURFACE
      ?auto_592370 - SURFACE
    )
    :vars
    (
      ?auto_592371 - HOIST
      ?auto_592372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592371 ?auto_592372 ) ( SURFACE-AT ?auto_592369 ?auto_592372 ) ( CLEAR ?auto_592369 ) ( LIFTING ?auto_592371 ?auto_592370 ) ( IS-CRATE ?auto_592370 ) ( not ( = ?auto_592369 ?auto_592370 ) ) ( ON ?auto_592369 ?auto_592368 ) ( not ( = ?auto_592368 ?auto_592369 ) ) ( not ( = ?auto_592368 ?auto_592370 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592369 ?auto_592370 )
      ( MAKE-2CRATE-VERIFY ?auto_592368 ?auto_592369 ?auto_592370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592378 - SURFACE
      ?auto_592379 - SURFACE
      ?auto_592380 - SURFACE
    )
    :vars
    (
      ?auto_592383 - HOIST
      ?auto_592381 - PLACE
      ?auto_592382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592383 ?auto_592381 ) ( SURFACE-AT ?auto_592379 ?auto_592381 ) ( CLEAR ?auto_592379 ) ( IS-CRATE ?auto_592380 ) ( not ( = ?auto_592379 ?auto_592380 ) ) ( TRUCK-AT ?auto_592382 ?auto_592381 ) ( AVAILABLE ?auto_592383 ) ( IN ?auto_592380 ?auto_592382 ) ( ON ?auto_592379 ?auto_592378 ) ( not ( = ?auto_592378 ?auto_592379 ) ) ( not ( = ?auto_592378 ?auto_592380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592379 ?auto_592380 )
      ( MAKE-2CRATE-VERIFY ?auto_592378 ?auto_592379 ?auto_592380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592384 - SURFACE
      ?auto_592385 - SURFACE
    )
    :vars
    (
      ?auto_592386 - HOIST
      ?auto_592387 - PLACE
      ?auto_592388 - TRUCK
      ?auto_592389 - SURFACE
      ?auto_592390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592386 ?auto_592387 ) ( SURFACE-AT ?auto_592384 ?auto_592387 ) ( CLEAR ?auto_592384 ) ( IS-CRATE ?auto_592385 ) ( not ( = ?auto_592384 ?auto_592385 ) ) ( AVAILABLE ?auto_592386 ) ( IN ?auto_592385 ?auto_592388 ) ( ON ?auto_592384 ?auto_592389 ) ( not ( = ?auto_592389 ?auto_592384 ) ) ( not ( = ?auto_592389 ?auto_592385 ) ) ( TRUCK-AT ?auto_592388 ?auto_592390 ) ( not ( = ?auto_592390 ?auto_592387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592388 ?auto_592390 ?auto_592387 )
      ( MAKE-2CRATE ?auto_592389 ?auto_592384 ?auto_592385 )
      ( MAKE-1CRATE-VERIFY ?auto_592384 ?auto_592385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592391 - SURFACE
      ?auto_592392 - SURFACE
      ?auto_592393 - SURFACE
    )
    :vars
    (
      ?auto_592397 - HOIST
      ?auto_592396 - PLACE
      ?auto_592395 - TRUCK
      ?auto_592394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592397 ?auto_592396 ) ( SURFACE-AT ?auto_592392 ?auto_592396 ) ( CLEAR ?auto_592392 ) ( IS-CRATE ?auto_592393 ) ( not ( = ?auto_592392 ?auto_592393 ) ) ( AVAILABLE ?auto_592397 ) ( IN ?auto_592393 ?auto_592395 ) ( ON ?auto_592392 ?auto_592391 ) ( not ( = ?auto_592391 ?auto_592392 ) ) ( not ( = ?auto_592391 ?auto_592393 ) ) ( TRUCK-AT ?auto_592395 ?auto_592394 ) ( not ( = ?auto_592394 ?auto_592396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592392 ?auto_592393 )
      ( MAKE-2CRATE-VERIFY ?auto_592391 ?auto_592392 ?auto_592393 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592398 - SURFACE
      ?auto_592399 - SURFACE
    )
    :vars
    (
      ?auto_592401 - HOIST
      ?auto_592400 - PLACE
      ?auto_592404 - SURFACE
      ?auto_592403 - TRUCK
      ?auto_592402 - PLACE
      ?auto_592405 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592401 ?auto_592400 ) ( SURFACE-AT ?auto_592398 ?auto_592400 ) ( CLEAR ?auto_592398 ) ( IS-CRATE ?auto_592399 ) ( not ( = ?auto_592398 ?auto_592399 ) ) ( AVAILABLE ?auto_592401 ) ( ON ?auto_592398 ?auto_592404 ) ( not ( = ?auto_592404 ?auto_592398 ) ) ( not ( = ?auto_592404 ?auto_592399 ) ) ( TRUCK-AT ?auto_592403 ?auto_592402 ) ( not ( = ?auto_592402 ?auto_592400 ) ) ( HOIST-AT ?auto_592405 ?auto_592402 ) ( LIFTING ?auto_592405 ?auto_592399 ) ( not ( = ?auto_592401 ?auto_592405 ) ) )
    :subtasks
    ( ( !LOAD ?auto_592405 ?auto_592399 ?auto_592403 ?auto_592402 )
      ( MAKE-2CRATE ?auto_592404 ?auto_592398 ?auto_592399 )
      ( MAKE-1CRATE-VERIFY ?auto_592398 ?auto_592399 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592406 - SURFACE
      ?auto_592407 - SURFACE
      ?auto_592408 - SURFACE
    )
    :vars
    (
      ?auto_592411 - HOIST
      ?auto_592412 - PLACE
      ?auto_592413 - TRUCK
      ?auto_592410 - PLACE
      ?auto_592409 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592411 ?auto_592412 ) ( SURFACE-AT ?auto_592407 ?auto_592412 ) ( CLEAR ?auto_592407 ) ( IS-CRATE ?auto_592408 ) ( not ( = ?auto_592407 ?auto_592408 ) ) ( AVAILABLE ?auto_592411 ) ( ON ?auto_592407 ?auto_592406 ) ( not ( = ?auto_592406 ?auto_592407 ) ) ( not ( = ?auto_592406 ?auto_592408 ) ) ( TRUCK-AT ?auto_592413 ?auto_592410 ) ( not ( = ?auto_592410 ?auto_592412 ) ) ( HOIST-AT ?auto_592409 ?auto_592410 ) ( LIFTING ?auto_592409 ?auto_592408 ) ( not ( = ?auto_592411 ?auto_592409 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592407 ?auto_592408 )
      ( MAKE-2CRATE-VERIFY ?auto_592406 ?auto_592407 ?auto_592408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592414 - SURFACE
      ?auto_592415 - SURFACE
    )
    :vars
    (
      ?auto_592416 - HOIST
      ?auto_592420 - PLACE
      ?auto_592421 - SURFACE
      ?auto_592419 - TRUCK
      ?auto_592418 - PLACE
      ?auto_592417 - HOIST
      ?auto_592422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592416 ?auto_592420 ) ( SURFACE-AT ?auto_592414 ?auto_592420 ) ( CLEAR ?auto_592414 ) ( IS-CRATE ?auto_592415 ) ( not ( = ?auto_592414 ?auto_592415 ) ) ( AVAILABLE ?auto_592416 ) ( ON ?auto_592414 ?auto_592421 ) ( not ( = ?auto_592421 ?auto_592414 ) ) ( not ( = ?auto_592421 ?auto_592415 ) ) ( TRUCK-AT ?auto_592419 ?auto_592418 ) ( not ( = ?auto_592418 ?auto_592420 ) ) ( HOIST-AT ?auto_592417 ?auto_592418 ) ( not ( = ?auto_592416 ?auto_592417 ) ) ( AVAILABLE ?auto_592417 ) ( SURFACE-AT ?auto_592415 ?auto_592418 ) ( ON ?auto_592415 ?auto_592422 ) ( CLEAR ?auto_592415 ) ( not ( = ?auto_592414 ?auto_592422 ) ) ( not ( = ?auto_592415 ?auto_592422 ) ) ( not ( = ?auto_592421 ?auto_592422 ) ) )
    :subtasks
    ( ( !LIFT ?auto_592417 ?auto_592415 ?auto_592422 ?auto_592418 )
      ( MAKE-2CRATE ?auto_592421 ?auto_592414 ?auto_592415 )
      ( MAKE-1CRATE-VERIFY ?auto_592414 ?auto_592415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592423 - SURFACE
      ?auto_592424 - SURFACE
      ?auto_592425 - SURFACE
    )
    :vars
    (
      ?auto_592429 - HOIST
      ?auto_592430 - PLACE
      ?auto_592427 - TRUCK
      ?auto_592431 - PLACE
      ?auto_592426 - HOIST
      ?auto_592428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592429 ?auto_592430 ) ( SURFACE-AT ?auto_592424 ?auto_592430 ) ( CLEAR ?auto_592424 ) ( IS-CRATE ?auto_592425 ) ( not ( = ?auto_592424 ?auto_592425 ) ) ( AVAILABLE ?auto_592429 ) ( ON ?auto_592424 ?auto_592423 ) ( not ( = ?auto_592423 ?auto_592424 ) ) ( not ( = ?auto_592423 ?auto_592425 ) ) ( TRUCK-AT ?auto_592427 ?auto_592431 ) ( not ( = ?auto_592431 ?auto_592430 ) ) ( HOIST-AT ?auto_592426 ?auto_592431 ) ( not ( = ?auto_592429 ?auto_592426 ) ) ( AVAILABLE ?auto_592426 ) ( SURFACE-AT ?auto_592425 ?auto_592431 ) ( ON ?auto_592425 ?auto_592428 ) ( CLEAR ?auto_592425 ) ( not ( = ?auto_592424 ?auto_592428 ) ) ( not ( = ?auto_592425 ?auto_592428 ) ) ( not ( = ?auto_592423 ?auto_592428 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592424 ?auto_592425 )
      ( MAKE-2CRATE-VERIFY ?auto_592423 ?auto_592424 ?auto_592425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592432 - SURFACE
      ?auto_592433 - SURFACE
    )
    :vars
    (
      ?auto_592439 - HOIST
      ?auto_592437 - PLACE
      ?auto_592434 - SURFACE
      ?auto_592436 - PLACE
      ?auto_592438 - HOIST
      ?auto_592440 - SURFACE
      ?auto_592435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592439 ?auto_592437 ) ( SURFACE-AT ?auto_592432 ?auto_592437 ) ( CLEAR ?auto_592432 ) ( IS-CRATE ?auto_592433 ) ( not ( = ?auto_592432 ?auto_592433 ) ) ( AVAILABLE ?auto_592439 ) ( ON ?auto_592432 ?auto_592434 ) ( not ( = ?auto_592434 ?auto_592432 ) ) ( not ( = ?auto_592434 ?auto_592433 ) ) ( not ( = ?auto_592436 ?auto_592437 ) ) ( HOIST-AT ?auto_592438 ?auto_592436 ) ( not ( = ?auto_592439 ?auto_592438 ) ) ( AVAILABLE ?auto_592438 ) ( SURFACE-AT ?auto_592433 ?auto_592436 ) ( ON ?auto_592433 ?auto_592440 ) ( CLEAR ?auto_592433 ) ( not ( = ?auto_592432 ?auto_592440 ) ) ( not ( = ?auto_592433 ?auto_592440 ) ) ( not ( = ?auto_592434 ?auto_592440 ) ) ( TRUCK-AT ?auto_592435 ?auto_592437 ) )
    :subtasks
    ( ( !DRIVE ?auto_592435 ?auto_592437 ?auto_592436 )
      ( MAKE-2CRATE ?auto_592434 ?auto_592432 ?auto_592433 )
      ( MAKE-1CRATE-VERIFY ?auto_592432 ?auto_592433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592441 - SURFACE
      ?auto_592442 - SURFACE
      ?auto_592443 - SURFACE
    )
    :vars
    (
      ?auto_592444 - HOIST
      ?auto_592448 - PLACE
      ?auto_592445 - PLACE
      ?auto_592446 - HOIST
      ?auto_592447 - SURFACE
      ?auto_592449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592444 ?auto_592448 ) ( SURFACE-AT ?auto_592442 ?auto_592448 ) ( CLEAR ?auto_592442 ) ( IS-CRATE ?auto_592443 ) ( not ( = ?auto_592442 ?auto_592443 ) ) ( AVAILABLE ?auto_592444 ) ( ON ?auto_592442 ?auto_592441 ) ( not ( = ?auto_592441 ?auto_592442 ) ) ( not ( = ?auto_592441 ?auto_592443 ) ) ( not ( = ?auto_592445 ?auto_592448 ) ) ( HOIST-AT ?auto_592446 ?auto_592445 ) ( not ( = ?auto_592444 ?auto_592446 ) ) ( AVAILABLE ?auto_592446 ) ( SURFACE-AT ?auto_592443 ?auto_592445 ) ( ON ?auto_592443 ?auto_592447 ) ( CLEAR ?auto_592443 ) ( not ( = ?auto_592442 ?auto_592447 ) ) ( not ( = ?auto_592443 ?auto_592447 ) ) ( not ( = ?auto_592441 ?auto_592447 ) ) ( TRUCK-AT ?auto_592449 ?auto_592448 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592442 ?auto_592443 )
      ( MAKE-2CRATE-VERIFY ?auto_592441 ?auto_592442 ?auto_592443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592450 - SURFACE
      ?auto_592451 - SURFACE
    )
    :vars
    (
      ?auto_592452 - HOIST
      ?auto_592453 - PLACE
      ?auto_592455 - SURFACE
      ?auto_592456 - PLACE
      ?auto_592458 - HOIST
      ?auto_592457 - SURFACE
      ?auto_592454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592452 ?auto_592453 ) ( IS-CRATE ?auto_592451 ) ( not ( = ?auto_592450 ?auto_592451 ) ) ( not ( = ?auto_592455 ?auto_592450 ) ) ( not ( = ?auto_592455 ?auto_592451 ) ) ( not ( = ?auto_592456 ?auto_592453 ) ) ( HOIST-AT ?auto_592458 ?auto_592456 ) ( not ( = ?auto_592452 ?auto_592458 ) ) ( AVAILABLE ?auto_592458 ) ( SURFACE-AT ?auto_592451 ?auto_592456 ) ( ON ?auto_592451 ?auto_592457 ) ( CLEAR ?auto_592451 ) ( not ( = ?auto_592450 ?auto_592457 ) ) ( not ( = ?auto_592451 ?auto_592457 ) ) ( not ( = ?auto_592455 ?auto_592457 ) ) ( TRUCK-AT ?auto_592454 ?auto_592453 ) ( SURFACE-AT ?auto_592455 ?auto_592453 ) ( CLEAR ?auto_592455 ) ( LIFTING ?auto_592452 ?auto_592450 ) ( IS-CRATE ?auto_592450 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592455 ?auto_592450 )
      ( MAKE-2CRATE ?auto_592455 ?auto_592450 ?auto_592451 )
      ( MAKE-1CRATE-VERIFY ?auto_592450 ?auto_592451 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592459 - SURFACE
      ?auto_592460 - SURFACE
      ?auto_592461 - SURFACE
    )
    :vars
    (
      ?auto_592465 - HOIST
      ?auto_592464 - PLACE
      ?auto_592467 - PLACE
      ?auto_592462 - HOIST
      ?auto_592463 - SURFACE
      ?auto_592466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592465 ?auto_592464 ) ( IS-CRATE ?auto_592461 ) ( not ( = ?auto_592460 ?auto_592461 ) ) ( not ( = ?auto_592459 ?auto_592460 ) ) ( not ( = ?auto_592459 ?auto_592461 ) ) ( not ( = ?auto_592467 ?auto_592464 ) ) ( HOIST-AT ?auto_592462 ?auto_592467 ) ( not ( = ?auto_592465 ?auto_592462 ) ) ( AVAILABLE ?auto_592462 ) ( SURFACE-AT ?auto_592461 ?auto_592467 ) ( ON ?auto_592461 ?auto_592463 ) ( CLEAR ?auto_592461 ) ( not ( = ?auto_592460 ?auto_592463 ) ) ( not ( = ?auto_592461 ?auto_592463 ) ) ( not ( = ?auto_592459 ?auto_592463 ) ) ( TRUCK-AT ?auto_592466 ?auto_592464 ) ( SURFACE-AT ?auto_592459 ?auto_592464 ) ( CLEAR ?auto_592459 ) ( LIFTING ?auto_592465 ?auto_592460 ) ( IS-CRATE ?auto_592460 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592460 ?auto_592461 )
      ( MAKE-2CRATE-VERIFY ?auto_592459 ?auto_592460 ?auto_592461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592468 - SURFACE
      ?auto_592469 - SURFACE
    )
    :vars
    (
      ?auto_592475 - HOIST
      ?auto_592473 - PLACE
      ?auto_592476 - SURFACE
      ?auto_592472 - PLACE
      ?auto_592474 - HOIST
      ?auto_592471 - SURFACE
      ?auto_592470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592475 ?auto_592473 ) ( IS-CRATE ?auto_592469 ) ( not ( = ?auto_592468 ?auto_592469 ) ) ( not ( = ?auto_592476 ?auto_592468 ) ) ( not ( = ?auto_592476 ?auto_592469 ) ) ( not ( = ?auto_592472 ?auto_592473 ) ) ( HOIST-AT ?auto_592474 ?auto_592472 ) ( not ( = ?auto_592475 ?auto_592474 ) ) ( AVAILABLE ?auto_592474 ) ( SURFACE-AT ?auto_592469 ?auto_592472 ) ( ON ?auto_592469 ?auto_592471 ) ( CLEAR ?auto_592469 ) ( not ( = ?auto_592468 ?auto_592471 ) ) ( not ( = ?auto_592469 ?auto_592471 ) ) ( not ( = ?auto_592476 ?auto_592471 ) ) ( TRUCK-AT ?auto_592470 ?auto_592473 ) ( SURFACE-AT ?auto_592476 ?auto_592473 ) ( CLEAR ?auto_592476 ) ( IS-CRATE ?auto_592468 ) ( AVAILABLE ?auto_592475 ) ( IN ?auto_592468 ?auto_592470 ) )
    :subtasks
    ( ( !UNLOAD ?auto_592475 ?auto_592468 ?auto_592470 ?auto_592473 )
      ( MAKE-2CRATE ?auto_592476 ?auto_592468 ?auto_592469 )
      ( MAKE-1CRATE-VERIFY ?auto_592468 ?auto_592469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592477 - SURFACE
      ?auto_592478 - SURFACE
      ?auto_592479 - SURFACE
    )
    :vars
    (
      ?auto_592483 - HOIST
      ?auto_592481 - PLACE
      ?auto_592480 - PLACE
      ?auto_592485 - HOIST
      ?auto_592484 - SURFACE
      ?auto_592482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592483 ?auto_592481 ) ( IS-CRATE ?auto_592479 ) ( not ( = ?auto_592478 ?auto_592479 ) ) ( not ( = ?auto_592477 ?auto_592478 ) ) ( not ( = ?auto_592477 ?auto_592479 ) ) ( not ( = ?auto_592480 ?auto_592481 ) ) ( HOIST-AT ?auto_592485 ?auto_592480 ) ( not ( = ?auto_592483 ?auto_592485 ) ) ( AVAILABLE ?auto_592485 ) ( SURFACE-AT ?auto_592479 ?auto_592480 ) ( ON ?auto_592479 ?auto_592484 ) ( CLEAR ?auto_592479 ) ( not ( = ?auto_592478 ?auto_592484 ) ) ( not ( = ?auto_592479 ?auto_592484 ) ) ( not ( = ?auto_592477 ?auto_592484 ) ) ( TRUCK-AT ?auto_592482 ?auto_592481 ) ( SURFACE-AT ?auto_592477 ?auto_592481 ) ( CLEAR ?auto_592477 ) ( IS-CRATE ?auto_592478 ) ( AVAILABLE ?auto_592483 ) ( IN ?auto_592478 ?auto_592482 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592478 ?auto_592479 )
      ( MAKE-2CRATE-VERIFY ?auto_592477 ?auto_592478 ?auto_592479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592522 - SURFACE
      ?auto_592523 - SURFACE
    )
    :vars
    (
      ?auto_592529 - HOIST
      ?auto_592525 - PLACE
      ?auto_592524 - SURFACE
      ?auto_592528 - PLACE
      ?auto_592530 - HOIST
      ?auto_592526 - SURFACE
      ?auto_592527 - TRUCK
      ?auto_592531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592529 ?auto_592525 ) ( SURFACE-AT ?auto_592522 ?auto_592525 ) ( CLEAR ?auto_592522 ) ( IS-CRATE ?auto_592523 ) ( not ( = ?auto_592522 ?auto_592523 ) ) ( AVAILABLE ?auto_592529 ) ( ON ?auto_592522 ?auto_592524 ) ( not ( = ?auto_592524 ?auto_592522 ) ) ( not ( = ?auto_592524 ?auto_592523 ) ) ( not ( = ?auto_592528 ?auto_592525 ) ) ( HOIST-AT ?auto_592530 ?auto_592528 ) ( not ( = ?auto_592529 ?auto_592530 ) ) ( AVAILABLE ?auto_592530 ) ( SURFACE-AT ?auto_592523 ?auto_592528 ) ( ON ?auto_592523 ?auto_592526 ) ( CLEAR ?auto_592523 ) ( not ( = ?auto_592522 ?auto_592526 ) ) ( not ( = ?auto_592523 ?auto_592526 ) ) ( not ( = ?auto_592524 ?auto_592526 ) ) ( TRUCK-AT ?auto_592527 ?auto_592531 ) ( not ( = ?auto_592531 ?auto_592525 ) ) ( not ( = ?auto_592528 ?auto_592531 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592527 ?auto_592531 ?auto_592525 )
      ( MAKE-1CRATE ?auto_592522 ?auto_592523 )
      ( MAKE-1CRATE-VERIFY ?auto_592522 ?auto_592523 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592561 - SURFACE
      ?auto_592562 - SURFACE
      ?auto_592563 - SURFACE
      ?auto_592564 - SURFACE
    )
    :vars
    (
      ?auto_592565 - HOIST
      ?auto_592566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592565 ?auto_592566 ) ( SURFACE-AT ?auto_592563 ?auto_592566 ) ( CLEAR ?auto_592563 ) ( LIFTING ?auto_592565 ?auto_592564 ) ( IS-CRATE ?auto_592564 ) ( not ( = ?auto_592563 ?auto_592564 ) ) ( ON ?auto_592562 ?auto_592561 ) ( ON ?auto_592563 ?auto_592562 ) ( not ( = ?auto_592561 ?auto_592562 ) ) ( not ( = ?auto_592561 ?auto_592563 ) ) ( not ( = ?auto_592561 ?auto_592564 ) ) ( not ( = ?auto_592562 ?auto_592563 ) ) ( not ( = ?auto_592562 ?auto_592564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592563 ?auto_592564 )
      ( MAKE-3CRATE-VERIFY ?auto_592561 ?auto_592562 ?auto_592563 ?auto_592564 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592578 - SURFACE
      ?auto_592579 - SURFACE
      ?auto_592580 - SURFACE
      ?auto_592581 - SURFACE
    )
    :vars
    (
      ?auto_592582 - HOIST
      ?auto_592583 - PLACE
      ?auto_592584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592582 ?auto_592583 ) ( SURFACE-AT ?auto_592580 ?auto_592583 ) ( CLEAR ?auto_592580 ) ( IS-CRATE ?auto_592581 ) ( not ( = ?auto_592580 ?auto_592581 ) ) ( TRUCK-AT ?auto_592584 ?auto_592583 ) ( AVAILABLE ?auto_592582 ) ( IN ?auto_592581 ?auto_592584 ) ( ON ?auto_592580 ?auto_592579 ) ( not ( = ?auto_592579 ?auto_592580 ) ) ( not ( = ?auto_592579 ?auto_592581 ) ) ( ON ?auto_592579 ?auto_592578 ) ( not ( = ?auto_592578 ?auto_592579 ) ) ( not ( = ?auto_592578 ?auto_592580 ) ) ( not ( = ?auto_592578 ?auto_592581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592579 ?auto_592580 ?auto_592581 )
      ( MAKE-3CRATE-VERIFY ?auto_592578 ?auto_592579 ?auto_592580 ?auto_592581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592599 - SURFACE
      ?auto_592600 - SURFACE
      ?auto_592601 - SURFACE
      ?auto_592602 - SURFACE
    )
    :vars
    (
      ?auto_592606 - HOIST
      ?auto_592604 - PLACE
      ?auto_592605 - TRUCK
      ?auto_592603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592606 ?auto_592604 ) ( SURFACE-AT ?auto_592601 ?auto_592604 ) ( CLEAR ?auto_592601 ) ( IS-CRATE ?auto_592602 ) ( not ( = ?auto_592601 ?auto_592602 ) ) ( AVAILABLE ?auto_592606 ) ( IN ?auto_592602 ?auto_592605 ) ( ON ?auto_592601 ?auto_592600 ) ( not ( = ?auto_592600 ?auto_592601 ) ) ( not ( = ?auto_592600 ?auto_592602 ) ) ( TRUCK-AT ?auto_592605 ?auto_592603 ) ( not ( = ?auto_592603 ?auto_592604 ) ) ( ON ?auto_592600 ?auto_592599 ) ( not ( = ?auto_592599 ?auto_592600 ) ) ( not ( = ?auto_592599 ?auto_592601 ) ) ( not ( = ?auto_592599 ?auto_592602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592600 ?auto_592601 ?auto_592602 )
      ( MAKE-3CRATE-VERIFY ?auto_592599 ?auto_592600 ?auto_592601 ?auto_592602 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592623 - SURFACE
      ?auto_592624 - SURFACE
      ?auto_592625 - SURFACE
      ?auto_592626 - SURFACE
    )
    :vars
    (
      ?auto_592629 - HOIST
      ?auto_592630 - PLACE
      ?auto_592628 - TRUCK
      ?auto_592627 - PLACE
      ?auto_592631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592629 ?auto_592630 ) ( SURFACE-AT ?auto_592625 ?auto_592630 ) ( CLEAR ?auto_592625 ) ( IS-CRATE ?auto_592626 ) ( not ( = ?auto_592625 ?auto_592626 ) ) ( AVAILABLE ?auto_592629 ) ( ON ?auto_592625 ?auto_592624 ) ( not ( = ?auto_592624 ?auto_592625 ) ) ( not ( = ?auto_592624 ?auto_592626 ) ) ( TRUCK-AT ?auto_592628 ?auto_592627 ) ( not ( = ?auto_592627 ?auto_592630 ) ) ( HOIST-AT ?auto_592631 ?auto_592627 ) ( LIFTING ?auto_592631 ?auto_592626 ) ( not ( = ?auto_592629 ?auto_592631 ) ) ( ON ?auto_592624 ?auto_592623 ) ( not ( = ?auto_592623 ?auto_592624 ) ) ( not ( = ?auto_592623 ?auto_592625 ) ) ( not ( = ?auto_592623 ?auto_592626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592624 ?auto_592625 ?auto_592626 )
      ( MAKE-3CRATE-VERIFY ?auto_592623 ?auto_592624 ?auto_592625 ?auto_592626 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592650 - SURFACE
      ?auto_592651 - SURFACE
      ?auto_592652 - SURFACE
      ?auto_592653 - SURFACE
    )
    :vars
    (
      ?auto_592659 - HOIST
      ?auto_592658 - PLACE
      ?auto_592655 - TRUCK
      ?auto_592656 - PLACE
      ?auto_592657 - HOIST
      ?auto_592654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592659 ?auto_592658 ) ( SURFACE-AT ?auto_592652 ?auto_592658 ) ( CLEAR ?auto_592652 ) ( IS-CRATE ?auto_592653 ) ( not ( = ?auto_592652 ?auto_592653 ) ) ( AVAILABLE ?auto_592659 ) ( ON ?auto_592652 ?auto_592651 ) ( not ( = ?auto_592651 ?auto_592652 ) ) ( not ( = ?auto_592651 ?auto_592653 ) ) ( TRUCK-AT ?auto_592655 ?auto_592656 ) ( not ( = ?auto_592656 ?auto_592658 ) ) ( HOIST-AT ?auto_592657 ?auto_592656 ) ( not ( = ?auto_592659 ?auto_592657 ) ) ( AVAILABLE ?auto_592657 ) ( SURFACE-AT ?auto_592653 ?auto_592656 ) ( ON ?auto_592653 ?auto_592654 ) ( CLEAR ?auto_592653 ) ( not ( = ?auto_592652 ?auto_592654 ) ) ( not ( = ?auto_592653 ?auto_592654 ) ) ( not ( = ?auto_592651 ?auto_592654 ) ) ( ON ?auto_592651 ?auto_592650 ) ( not ( = ?auto_592650 ?auto_592651 ) ) ( not ( = ?auto_592650 ?auto_592652 ) ) ( not ( = ?auto_592650 ?auto_592653 ) ) ( not ( = ?auto_592650 ?auto_592654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592651 ?auto_592652 ?auto_592653 )
      ( MAKE-3CRATE-VERIFY ?auto_592650 ?auto_592651 ?auto_592652 ?auto_592653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592678 - SURFACE
      ?auto_592679 - SURFACE
      ?auto_592680 - SURFACE
      ?auto_592681 - SURFACE
    )
    :vars
    (
      ?auto_592683 - HOIST
      ?auto_592687 - PLACE
      ?auto_592682 - PLACE
      ?auto_592686 - HOIST
      ?auto_592685 - SURFACE
      ?auto_592684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592683 ?auto_592687 ) ( SURFACE-AT ?auto_592680 ?auto_592687 ) ( CLEAR ?auto_592680 ) ( IS-CRATE ?auto_592681 ) ( not ( = ?auto_592680 ?auto_592681 ) ) ( AVAILABLE ?auto_592683 ) ( ON ?auto_592680 ?auto_592679 ) ( not ( = ?auto_592679 ?auto_592680 ) ) ( not ( = ?auto_592679 ?auto_592681 ) ) ( not ( = ?auto_592682 ?auto_592687 ) ) ( HOIST-AT ?auto_592686 ?auto_592682 ) ( not ( = ?auto_592683 ?auto_592686 ) ) ( AVAILABLE ?auto_592686 ) ( SURFACE-AT ?auto_592681 ?auto_592682 ) ( ON ?auto_592681 ?auto_592685 ) ( CLEAR ?auto_592681 ) ( not ( = ?auto_592680 ?auto_592685 ) ) ( not ( = ?auto_592681 ?auto_592685 ) ) ( not ( = ?auto_592679 ?auto_592685 ) ) ( TRUCK-AT ?auto_592684 ?auto_592687 ) ( ON ?auto_592679 ?auto_592678 ) ( not ( = ?auto_592678 ?auto_592679 ) ) ( not ( = ?auto_592678 ?auto_592680 ) ) ( not ( = ?auto_592678 ?auto_592681 ) ) ( not ( = ?auto_592678 ?auto_592685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592679 ?auto_592680 ?auto_592681 )
      ( MAKE-3CRATE-VERIFY ?auto_592678 ?auto_592679 ?auto_592680 ?auto_592681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592706 - SURFACE
      ?auto_592707 - SURFACE
      ?auto_592708 - SURFACE
      ?auto_592709 - SURFACE
    )
    :vars
    (
      ?auto_592711 - HOIST
      ?auto_592712 - PLACE
      ?auto_592715 - PLACE
      ?auto_592713 - HOIST
      ?auto_592714 - SURFACE
      ?auto_592710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592711 ?auto_592712 ) ( IS-CRATE ?auto_592709 ) ( not ( = ?auto_592708 ?auto_592709 ) ) ( not ( = ?auto_592707 ?auto_592708 ) ) ( not ( = ?auto_592707 ?auto_592709 ) ) ( not ( = ?auto_592715 ?auto_592712 ) ) ( HOIST-AT ?auto_592713 ?auto_592715 ) ( not ( = ?auto_592711 ?auto_592713 ) ) ( AVAILABLE ?auto_592713 ) ( SURFACE-AT ?auto_592709 ?auto_592715 ) ( ON ?auto_592709 ?auto_592714 ) ( CLEAR ?auto_592709 ) ( not ( = ?auto_592708 ?auto_592714 ) ) ( not ( = ?auto_592709 ?auto_592714 ) ) ( not ( = ?auto_592707 ?auto_592714 ) ) ( TRUCK-AT ?auto_592710 ?auto_592712 ) ( SURFACE-AT ?auto_592707 ?auto_592712 ) ( CLEAR ?auto_592707 ) ( LIFTING ?auto_592711 ?auto_592708 ) ( IS-CRATE ?auto_592708 ) ( ON ?auto_592707 ?auto_592706 ) ( not ( = ?auto_592706 ?auto_592707 ) ) ( not ( = ?auto_592706 ?auto_592708 ) ) ( not ( = ?auto_592706 ?auto_592709 ) ) ( not ( = ?auto_592706 ?auto_592714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592707 ?auto_592708 ?auto_592709 )
      ( MAKE-3CRATE-VERIFY ?auto_592706 ?auto_592707 ?auto_592708 ?auto_592709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_592734 - SURFACE
      ?auto_592735 - SURFACE
      ?auto_592736 - SURFACE
      ?auto_592737 - SURFACE
    )
    :vars
    (
      ?auto_592738 - HOIST
      ?auto_592741 - PLACE
      ?auto_592742 - PLACE
      ?auto_592743 - HOIST
      ?auto_592739 - SURFACE
      ?auto_592740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592738 ?auto_592741 ) ( IS-CRATE ?auto_592737 ) ( not ( = ?auto_592736 ?auto_592737 ) ) ( not ( = ?auto_592735 ?auto_592736 ) ) ( not ( = ?auto_592735 ?auto_592737 ) ) ( not ( = ?auto_592742 ?auto_592741 ) ) ( HOIST-AT ?auto_592743 ?auto_592742 ) ( not ( = ?auto_592738 ?auto_592743 ) ) ( AVAILABLE ?auto_592743 ) ( SURFACE-AT ?auto_592737 ?auto_592742 ) ( ON ?auto_592737 ?auto_592739 ) ( CLEAR ?auto_592737 ) ( not ( = ?auto_592736 ?auto_592739 ) ) ( not ( = ?auto_592737 ?auto_592739 ) ) ( not ( = ?auto_592735 ?auto_592739 ) ) ( TRUCK-AT ?auto_592740 ?auto_592741 ) ( SURFACE-AT ?auto_592735 ?auto_592741 ) ( CLEAR ?auto_592735 ) ( IS-CRATE ?auto_592736 ) ( AVAILABLE ?auto_592738 ) ( IN ?auto_592736 ?auto_592740 ) ( ON ?auto_592735 ?auto_592734 ) ( not ( = ?auto_592734 ?auto_592735 ) ) ( not ( = ?auto_592734 ?auto_592736 ) ) ( not ( = ?auto_592734 ?auto_592737 ) ) ( not ( = ?auto_592734 ?auto_592739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_592735 ?auto_592736 ?auto_592737 )
      ( MAKE-3CRATE-VERIFY ?auto_592734 ?auto_592735 ?auto_592736 ?auto_592737 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593025 - SURFACE
      ?auto_593026 - SURFACE
      ?auto_593027 - SURFACE
      ?auto_593029 - SURFACE
      ?auto_593028 - SURFACE
    )
    :vars
    (
      ?auto_593030 - HOIST
      ?auto_593031 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593030 ?auto_593031 ) ( SURFACE-AT ?auto_593029 ?auto_593031 ) ( CLEAR ?auto_593029 ) ( LIFTING ?auto_593030 ?auto_593028 ) ( IS-CRATE ?auto_593028 ) ( not ( = ?auto_593029 ?auto_593028 ) ) ( ON ?auto_593026 ?auto_593025 ) ( ON ?auto_593027 ?auto_593026 ) ( ON ?auto_593029 ?auto_593027 ) ( not ( = ?auto_593025 ?auto_593026 ) ) ( not ( = ?auto_593025 ?auto_593027 ) ) ( not ( = ?auto_593025 ?auto_593029 ) ) ( not ( = ?auto_593025 ?auto_593028 ) ) ( not ( = ?auto_593026 ?auto_593027 ) ) ( not ( = ?auto_593026 ?auto_593029 ) ) ( not ( = ?auto_593026 ?auto_593028 ) ) ( not ( = ?auto_593027 ?auto_593029 ) ) ( not ( = ?auto_593027 ?auto_593028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593029 ?auto_593028 )
      ( MAKE-4CRATE-VERIFY ?auto_593025 ?auto_593026 ?auto_593027 ?auto_593029 ?auto_593028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593050 - SURFACE
      ?auto_593051 - SURFACE
      ?auto_593052 - SURFACE
      ?auto_593054 - SURFACE
      ?auto_593053 - SURFACE
    )
    :vars
    (
      ?auto_593055 - HOIST
      ?auto_593057 - PLACE
      ?auto_593056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593055 ?auto_593057 ) ( SURFACE-AT ?auto_593054 ?auto_593057 ) ( CLEAR ?auto_593054 ) ( IS-CRATE ?auto_593053 ) ( not ( = ?auto_593054 ?auto_593053 ) ) ( TRUCK-AT ?auto_593056 ?auto_593057 ) ( AVAILABLE ?auto_593055 ) ( IN ?auto_593053 ?auto_593056 ) ( ON ?auto_593054 ?auto_593052 ) ( not ( = ?auto_593052 ?auto_593054 ) ) ( not ( = ?auto_593052 ?auto_593053 ) ) ( ON ?auto_593051 ?auto_593050 ) ( ON ?auto_593052 ?auto_593051 ) ( not ( = ?auto_593050 ?auto_593051 ) ) ( not ( = ?auto_593050 ?auto_593052 ) ) ( not ( = ?auto_593050 ?auto_593054 ) ) ( not ( = ?auto_593050 ?auto_593053 ) ) ( not ( = ?auto_593051 ?auto_593052 ) ) ( not ( = ?auto_593051 ?auto_593054 ) ) ( not ( = ?auto_593051 ?auto_593053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593052 ?auto_593054 ?auto_593053 )
      ( MAKE-4CRATE-VERIFY ?auto_593050 ?auto_593051 ?auto_593052 ?auto_593054 ?auto_593053 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593080 - SURFACE
      ?auto_593081 - SURFACE
      ?auto_593082 - SURFACE
      ?auto_593084 - SURFACE
      ?auto_593083 - SURFACE
    )
    :vars
    (
      ?auto_593086 - HOIST
      ?auto_593087 - PLACE
      ?auto_593085 - TRUCK
      ?auto_593088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593086 ?auto_593087 ) ( SURFACE-AT ?auto_593084 ?auto_593087 ) ( CLEAR ?auto_593084 ) ( IS-CRATE ?auto_593083 ) ( not ( = ?auto_593084 ?auto_593083 ) ) ( AVAILABLE ?auto_593086 ) ( IN ?auto_593083 ?auto_593085 ) ( ON ?auto_593084 ?auto_593082 ) ( not ( = ?auto_593082 ?auto_593084 ) ) ( not ( = ?auto_593082 ?auto_593083 ) ) ( TRUCK-AT ?auto_593085 ?auto_593088 ) ( not ( = ?auto_593088 ?auto_593087 ) ) ( ON ?auto_593081 ?auto_593080 ) ( ON ?auto_593082 ?auto_593081 ) ( not ( = ?auto_593080 ?auto_593081 ) ) ( not ( = ?auto_593080 ?auto_593082 ) ) ( not ( = ?auto_593080 ?auto_593084 ) ) ( not ( = ?auto_593080 ?auto_593083 ) ) ( not ( = ?auto_593081 ?auto_593082 ) ) ( not ( = ?auto_593081 ?auto_593084 ) ) ( not ( = ?auto_593081 ?auto_593083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593082 ?auto_593084 ?auto_593083 )
      ( MAKE-4CRATE-VERIFY ?auto_593080 ?auto_593081 ?auto_593082 ?auto_593084 ?auto_593083 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593114 - SURFACE
      ?auto_593115 - SURFACE
      ?auto_593116 - SURFACE
      ?auto_593118 - SURFACE
      ?auto_593117 - SURFACE
    )
    :vars
    (
      ?auto_593121 - HOIST
      ?auto_593123 - PLACE
      ?auto_593122 - TRUCK
      ?auto_593119 - PLACE
      ?auto_593120 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593121 ?auto_593123 ) ( SURFACE-AT ?auto_593118 ?auto_593123 ) ( CLEAR ?auto_593118 ) ( IS-CRATE ?auto_593117 ) ( not ( = ?auto_593118 ?auto_593117 ) ) ( AVAILABLE ?auto_593121 ) ( ON ?auto_593118 ?auto_593116 ) ( not ( = ?auto_593116 ?auto_593118 ) ) ( not ( = ?auto_593116 ?auto_593117 ) ) ( TRUCK-AT ?auto_593122 ?auto_593119 ) ( not ( = ?auto_593119 ?auto_593123 ) ) ( HOIST-AT ?auto_593120 ?auto_593119 ) ( LIFTING ?auto_593120 ?auto_593117 ) ( not ( = ?auto_593121 ?auto_593120 ) ) ( ON ?auto_593115 ?auto_593114 ) ( ON ?auto_593116 ?auto_593115 ) ( not ( = ?auto_593114 ?auto_593115 ) ) ( not ( = ?auto_593114 ?auto_593116 ) ) ( not ( = ?auto_593114 ?auto_593118 ) ) ( not ( = ?auto_593114 ?auto_593117 ) ) ( not ( = ?auto_593115 ?auto_593116 ) ) ( not ( = ?auto_593115 ?auto_593118 ) ) ( not ( = ?auto_593115 ?auto_593117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593116 ?auto_593118 ?auto_593117 )
      ( MAKE-4CRATE-VERIFY ?auto_593114 ?auto_593115 ?auto_593116 ?auto_593118 ?auto_593117 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593152 - SURFACE
      ?auto_593153 - SURFACE
      ?auto_593154 - SURFACE
      ?auto_593156 - SURFACE
      ?auto_593155 - SURFACE
    )
    :vars
    (
      ?auto_593161 - HOIST
      ?auto_593157 - PLACE
      ?auto_593158 - TRUCK
      ?auto_593162 - PLACE
      ?auto_593159 - HOIST
      ?auto_593160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593161 ?auto_593157 ) ( SURFACE-AT ?auto_593156 ?auto_593157 ) ( CLEAR ?auto_593156 ) ( IS-CRATE ?auto_593155 ) ( not ( = ?auto_593156 ?auto_593155 ) ) ( AVAILABLE ?auto_593161 ) ( ON ?auto_593156 ?auto_593154 ) ( not ( = ?auto_593154 ?auto_593156 ) ) ( not ( = ?auto_593154 ?auto_593155 ) ) ( TRUCK-AT ?auto_593158 ?auto_593162 ) ( not ( = ?auto_593162 ?auto_593157 ) ) ( HOIST-AT ?auto_593159 ?auto_593162 ) ( not ( = ?auto_593161 ?auto_593159 ) ) ( AVAILABLE ?auto_593159 ) ( SURFACE-AT ?auto_593155 ?auto_593162 ) ( ON ?auto_593155 ?auto_593160 ) ( CLEAR ?auto_593155 ) ( not ( = ?auto_593156 ?auto_593160 ) ) ( not ( = ?auto_593155 ?auto_593160 ) ) ( not ( = ?auto_593154 ?auto_593160 ) ) ( ON ?auto_593153 ?auto_593152 ) ( ON ?auto_593154 ?auto_593153 ) ( not ( = ?auto_593152 ?auto_593153 ) ) ( not ( = ?auto_593152 ?auto_593154 ) ) ( not ( = ?auto_593152 ?auto_593156 ) ) ( not ( = ?auto_593152 ?auto_593155 ) ) ( not ( = ?auto_593152 ?auto_593160 ) ) ( not ( = ?auto_593153 ?auto_593154 ) ) ( not ( = ?auto_593153 ?auto_593156 ) ) ( not ( = ?auto_593153 ?auto_593155 ) ) ( not ( = ?auto_593153 ?auto_593160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593154 ?auto_593156 ?auto_593155 )
      ( MAKE-4CRATE-VERIFY ?auto_593152 ?auto_593153 ?auto_593154 ?auto_593156 ?auto_593155 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593191 - SURFACE
      ?auto_593192 - SURFACE
      ?auto_593193 - SURFACE
      ?auto_593195 - SURFACE
      ?auto_593194 - SURFACE
    )
    :vars
    (
      ?auto_593199 - HOIST
      ?auto_593201 - PLACE
      ?auto_593196 - PLACE
      ?auto_593198 - HOIST
      ?auto_593197 - SURFACE
      ?auto_593200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593199 ?auto_593201 ) ( SURFACE-AT ?auto_593195 ?auto_593201 ) ( CLEAR ?auto_593195 ) ( IS-CRATE ?auto_593194 ) ( not ( = ?auto_593195 ?auto_593194 ) ) ( AVAILABLE ?auto_593199 ) ( ON ?auto_593195 ?auto_593193 ) ( not ( = ?auto_593193 ?auto_593195 ) ) ( not ( = ?auto_593193 ?auto_593194 ) ) ( not ( = ?auto_593196 ?auto_593201 ) ) ( HOIST-AT ?auto_593198 ?auto_593196 ) ( not ( = ?auto_593199 ?auto_593198 ) ) ( AVAILABLE ?auto_593198 ) ( SURFACE-AT ?auto_593194 ?auto_593196 ) ( ON ?auto_593194 ?auto_593197 ) ( CLEAR ?auto_593194 ) ( not ( = ?auto_593195 ?auto_593197 ) ) ( not ( = ?auto_593194 ?auto_593197 ) ) ( not ( = ?auto_593193 ?auto_593197 ) ) ( TRUCK-AT ?auto_593200 ?auto_593201 ) ( ON ?auto_593192 ?auto_593191 ) ( ON ?auto_593193 ?auto_593192 ) ( not ( = ?auto_593191 ?auto_593192 ) ) ( not ( = ?auto_593191 ?auto_593193 ) ) ( not ( = ?auto_593191 ?auto_593195 ) ) ( not ( = ?auto_593191 ?auto_593194 ) ) ( not ( = ?auto_593191 ?auto_593197 ) ) ( not ( = ?auto_593192 ?auto_593193 ) ) ( not ( = ?auto_593192 ?auto_593195 ) ) ( not ( = ?auto_593192 ?auto_593194 ) ) ( not ( = ?auto_593192 ?auto_593197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593193 ?auto_593195 ?auto_593194 )
      ( MAKE-4CRATE-VERIFY ?auto_593191 ?auto_593192 ?auto_593193 ?auto_593195 ?auto_593194 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593230 - SURFACE
      ?auto_593231 - SURFACE
      ?auto_593232 - SURFACE
      ?auto_593234 - SURFACE
      ?auto_593233 - SURFACE
    )
    :vars
    (
      ?auto_593235 - HOIST
      ?auto_593237 - PLACE
      ?auto_593239 - PLACE
      ?auto_593236 - HOIST
      ?auto_593240 - SURFACE
      ?auto_593238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593235 ?auto_593237 ) ( IS-CRATE ?auto_593233 ) ( not ( = ?auto_593234 ?auto_593233 ) ) ( not ( = ?auto_593232 ?auto_593234 ) ) ( not ( = ?auto_593232 ?auto_593233 ) ) ( not ( = ?auto_593239 ?auto_593237 ) ) ( HOIST-AT ?auto_593236 ?auto_593239 ) ( not ( = ?auto_593235 ?auto_593236 ) ) ( AVAILABLE ?auto_593236 ) ( SURFACE-AT ?auto_593233 ?auto_593239 ) ( ON ?auto_593233 ?auto_593240 ) ( CLEAR ?auto_593233 ) ( not ( = ?auto_593234 ?auto_593240 ) ) ( not ( = ?auto_593233 ?auto_593240 ) ) ( not ( = ?auto_593232 ?auto_593240 ) ) ( TRUCK-AT ?auto_593238 ?auto_593237 ) ( SURFACE-AT ?auto_593232 ?auto_593237 ) ( CLEAR ?auto_593232 ) ( LIFTING ?auto_593235 ?auto_593234 ) ( IS-CRATE ?auto_593234 ) ( ON ?auto_593231 ?auto_593230 ) ( ON ?auto_593232 ?auto_593231 ) ( not ( = ?auto_593230 ?auto_593231 ) ) ( not ( = ?auto_593230 ?auto_593232 ) ) ( not ( = ?auto_593230 ?auto_593234 ) ) ( not ( = ?auto_593230 ?auto_593233 ) ) ( not ( = ?auto_593230 ?auto_593240 ) ) ( not ( = ?auto_593231 ?auto_593232 ) ) ( not ( = ?auto_593231 ?auto_593234 ) ) ( not ( = ?auto_593231 ?auto_593233 ) ) ( not ( = ?auto_593231 ?auto_593240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593232 ?auto_593234 ?auto_593233 )
      ( MAKE-4CRATE-VERIFY ?auto_593230 ?auto_593231 ?auto_593232 ?auto_593234 ?auto_593233 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593269 - SURFACE
      ?auto_593270 - SURFACE
      ?auto_593271 - SURFACE
      ?auto_593273 - SURFACE
      ?auto_593272 - SURFACE
    )
    :vars
    (
      ?auto_593279 - HOIST
      ?auto_593275 - PLACE
      ?auto_593278 - PLACE
      ?auto_593276 - HOIST
      ?auto_593274 - SURFACE
      ?auto_593277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593279 ?auto_593275 ) ( IS-CRATE ?auto_593272 ) ( not ( = ?auto_593273 ?auto_593272 ) ) ( not ( = ?auto_593271 ?auto_593273 ) ) ( not ( = ?auto_593271 ?auto_593272 ) ) ( not ( = ?auto_593278 ?auto_593275 ) ) ( HOIST-AT ?auto_593276 ?auto_593278 ) ( not ( = ?auto_593279 ?auto_593276 ) ) ( AVAILABLE ?auto_593276 ) ( SURFACE-AT ?auto_593272 ?auto_593278 ) ( ON ?auto_593272 ?auto_593274 ) ( CLEAR ?auto_593272 ) ( not ( = ?auto_593273 ?auto_593274 ) ) ( not ( = ?auto_593272 ?auto_593274 ) ) ( not ( = ?auto_593271 ?auto_593274 ) ) ( TRUCK-AT ?auto_593277 ?auto_593275 ) ( SURFACE-AT ?auto_593271 ?auto_593275 ) ( CLEAR ?auto_593271 ) ( IS-CRATE ?auto_593273 ) ( AVAILABLE ?auto_593279 ) ( IN ?auto_593273 ?auto_593277 ) ( ON ?auto_593270 ?auto_593269 ) ( ON ?auto_593271 ?auto_593270 ) ( not ( = ?auto_593269 ?auto_593270 ) ) ( not ( = ?auto_593269 ?auto_593271 ) ) ( not ( = ?auto_593269 ?auto_593273 ) ) ( not ( = ?auto_593269 ?auto_593272 ) ) ( not ( = ?auto_593269 ?auto_593274 ) ) ( not ( = ?auto_593270 ?auto_593271 ) ) ( not ( = ?auto_593270 ?auto_593273 ) ) ( not ( = ?auto_593270 ?auto_593272 ) ) ( not ( = ?auto_593270 ?auto_593274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593271 ?auto_593273 ?auto_593272 )
      ( MAKE-4CRATE-VERIFY ?auto_593269 ?auto_593270 ?auto_593271 ?auto_593273 ?auto_593272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_593929 - SURFACE
      ?auto_593930 - SURFACE
      ?auto_593931 - SURFACE
      ?auto_593933 - SURFACE
      ?auto_593932 - SURFACE
      ?auto_593934 - SURFACE
    )
    :vars
    (
      ?auto_593935 - HOIST
      ?auto_593936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593935 ?auto_593936 ) ( SURFACE-AT ?auto_593932 ?auto_593936 ) ( CLEAR ?auto_593932 ) ( LIFTING ?auto_593935 ?auto_593934 ) ( IS-CRATE ?auto_593934 ) ( not ( = ?auto_593932 ?auto_593934 ) ) ( ON ?auto_593930 ?auto_593929 ) ( ON ?auto_593931 ?auto_593930 ) ( ON ?auto_593933 ?auto_593931 ) ( ON ?auto_593932 ?auto_593933 ) ( not ( = ?auto_593929 ?auto_593930 ) ) ( not ( = ?auto_593929 ?auto_593931 ) ) ( not ( = ?auto_593929 ?auto_593933 ) ) ( not ( = ?auto_593929 ?auto_593932 ) ) ( not ( = ?auto_593929 ?auto_593934 ) ) ( not ( = ?auto_593930 ?auto_593931 ) ) ( not ( = ?auto_593930 ?auto_593933 ) ) ( not ( = ?auto_593930 ?auto_593932 ) ) ( not ( = ?auto_593930 ?auto_593934 ) ) ( not ( = ?auto_593931 ?auto_593933 ) ) ( not ( = ?auto_593931 ?auto_593932 ) ) ( not ( = ?auto_593931 ?auto_593934 ) ) ( not ( = ?auto_593933 ?auto_593932 ) ) ( not ( = ?auto_593933 ?auto_593934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593932 ?auto_593934 )
      ( MAKE-5CRATE-VERIFY ?auto_593929 ?auto_593930 ?auto_593931 ?auto_593933 ?auto_593932 ?auto_593934 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_593963 - SURFACE
      ?auto_593964 - SURFACE
      ?auto_593965 - SURFACE
      ?auto_593967 - SURFACE
      ?auto_593966 - SURFACE
      ?auto_593968 - SURFACE
    )
    :vars
    (
      ?auto_593971 - HOIST
      ?auto_593970 - PLACE
      ?auto_593969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593971 ?auto_593970 ) ( SURFACE-AT ?auto_593966 ?auto_593970 ) ( CLEAR ?auto_593966 ) ( IS-CRATE ?auto_593968 ) ( not ( = ?auto_593966 ?auto_593968 ) ) ( TRUCK-AT ?auto_593969 ?auto_593970 ) ( AVAILABLE ?auto_593971 ) ( IN ?auto_593968 ?auto_593969 ) ( ON ?auto_593966 ?auto_593967 ) ( not ( = ?auto_593967 ?auto_593966 ) ) ( not ( = ?auto_593967 ?auto_593968 ) ) ( ON ?auto_593964 ?auto_593963 ) ( ON ?auto_593965 ?auto_593964 ) ( ON ?auto_593967 ?auto_593965 ) ( not ( = ?auto_593963 ?auto_593964 ) ) ( not ( = ?auto_593963 ?auto_593965 ) ) ( not ( = ?auto_593963 ?auto_593967 ) ) ( not ( = ?auto_593963 ?auto_593966 ) ) ( not ( = ?auto_593963 ?auto_593968 ) ) ( not ( = ?auto_593964 ?auto_593965 ) ) ( not ( = ?auto_593964 ?auto_593967 ) ) ( not ( = ?auto_593964 ?auto_593966 ) ) ( not ( = ?auto_593964 ?auto_593968 ) ) ( not ( = ?auto_593965 ?auto_593967 ) ) ( not ( = ?auto_593965 ?auto_593966 ) ) ( not ( = ?auto_593965 ?auto_593968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593967 ?auto_593966 ?auto_593968 )
      ( MAKE-5CRATE-VERIFY ?auto_593963 ?auto_593964 ?auto_593965 ?auto_593967 ?auto_593966 ?auto_593968 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594003 - SURFACE
      ?auto_594004 - SURFACE
      ?auto_594005 - SURFACE
      ?auto_594007 - SURFACE
      ?auto_594006 - SURFACE
      ?auto_594008 - SURFACE
    )
    :vars
    (
      ?auto_594009 - HOIST
      ?auto_594010 - PLACE
      ?auto_594011 - TRUCK
      ?auto_594012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594009 ?auto_594010 ) ( SURFACE-AT ?auto_594006 ?auto_594010 ) ( CLEAR ?auto_594006 ) ( IS-CRATE ?auto_594008 ) ( not ( = ?auto_594006 ?auto_594008 ) ) ( AVAILABLE ?auto_594009 ) ( IN ?auto_594008 ?auto_594011 ) ( ON ?auto_594006 ?auto_594007 ) ( not ( = ?auto_594007 ?auto_594006 ) ) ( not ( = ?auto_594007 ?auto_594008 ) ) ( TRUCK-AT ?auto_594011 ?auto_594012 ) ( not ( = ?auto_594012 ?auto_594010 ) ) ( ON ?auto_594004 ?auto_594003 ) ( ON ?auto_594005 ?auto_594004 ) ( ON ?auto_594007 ?auto_594005 ) ( not ( = ?auto_594003 ?auto_594004 ) ) ( not ( = ?auto_594003 ?auto_594005 ) ) ( not ( = ?auto_594003 ?auto_594007 ) ) ( not ( = ?auto_594003 ?auto_594006 ) ) ( not ( = ?auto_594003 ?auto_594008 ) ) ( not ( = ?auto_594004 ?auto_594005 ) ) ( not ( = ?auto_594004 ?auto_594007 ) ) ( not ( = ?auto_594004 ?auto_594006 ) ) ( not ( = ?auto_594004 ?auto_594008 ) ) ( not ( = ?auto_594005 ?auto_594007 ) ) ( not ( = ?auto_594005 ?auto_594006 ) ) ( not ( = ?auto_594005 ?auto_594008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594007 ?auto_594006 ?auto_594008 )
      ( MAKE-5CRATE-VERIFY ?auto_594003 ?auto_594004 ?auto_594005 ?auto_594007 ?auto_594006 ?auto_594008 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594048 - SURFACE
      ?auto_594049 - SURFACE
      ?auto_594050 - SURFACE
      ?auto_594052 - SURFACE
      ?auto_594051 - SURFACE
      ?auto_594053 - SURFACE
    )
    :vars
    (
      ?auto_594055 - HOIST
      ?auto_594057 - PLACE
      ?auto_594058 - TRUCK
      ?auto_594056 - PLACE
      ?auto_594054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_594055 ?auto_594057 ) ( SURFACE-AT ?auto_594051 ?auto_594057 ) ( CLEAR ?auto_594051 ) ( IS-CRATE ?auto_594053 ) ( not ( = ?auto_594051 ?auto_594053 ) ) ( AVAILABLE ?auto_594055 ) ( ON ?auto_594051 ?auto_594052 ) ( not ( = ?auto_594052 ?auto_594051 ) ) ( not ( = ?auto_594052 ?auto_594053 ) ) ( TRUCK-AT ?auto_594058 ?auto_594056 ) ( not ( = ?auto_594056 ?auto_594057 ) ) ( HOIST-AT ?auto_594054 ?auto_594056 ) ( LIFTING ?auto_594054 ?auto_594053 ) ( not ( = ?auto_594055 ?auto_594054 ) ) ( ON ?auto_594049 ?auto_594048 ) ( ON ?auto_594050 ?auto_594049 ) ( ON ?auto_594052 ?auto_594050 ) ( not ( = ?auto_594048 ?auto_594049 ) ) ( not ( = ?auto_594048 ?auto_594050 ) ) ( not ( = ?auto_594048 ?auto_594052 ) ) ( not ( = ?auto_594048 ?auto_594051 ) ) ( not ( = ?auto_594048 ?auto_594053 ) ) ( not ( = ?auto_594049 ?auto_594050 ) ) ( not ( = ?auto_594049 ?auto_594052 ) ) ( not ( = ?auto_594049 ?auto_594051 ) ) ( not ( = ?auto_594049 ?auto_594053 ) ) ( not ( = ?auto_594050 ?auto_594052 ) ) ( not ( = ?auto_594050 ?auto_594051 ) ) ( not ( = ?auto_594050 ?auto_594053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594052 ?auto_594051 ?auto_594053 )
      ( MAKE-5CRATE-VERIFY ?auto_594048 ?auto_594049 ?auto_594050 ?auto_594052 ?auto_594051 ?auto_594053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594098 - SURFACE
      ?auto_594099 - SURFACE
      ?auto_594100 - SURFACE
      ?auto_594102 - SURFACE
      ?auto_594101 - SURFACE
      ?auto_594103 - SURFACE
    )
    :vars
    (
      ?auto_594109 - HOIST
      ?auto_594104 - PLACE
      ?auto_594105 - TRUCK
      ?auto_594106 - PLACE
      ?auto_594107 - HOIST
      ?auto_594108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594109 ?auto_594104 ) ( SURFACE-AT ?auto_594101 ?auto_594104 ) ( CLEAR ?auto_594101 ) ( IS-CRATE ?auto_594103 ) ( not ( = ?auto_594101 ?auto_594103 ) ) ( AVAILABLE ?auto_594109 ) ( ON ?auto_594101 ?auto_594102 ) ( not ( = ?auto_594102 ?auto_594101 ) ) ( not ( = ?auto_594102 ?auto_594103 ) ) ( TRUCK-AT ?auto_594105 ?auto_594106 ) ( not ( = ?auto_594106 ?auto_594104 ) ) ( HOIST-AT ?auto_594107 ?auto_594106 ) ( not ( = ?auto_594109 ?auto_594107 ) ) ( AVAILABLE ?auto_594107 ) ( SURFACE-AT ?auto_594103 ?auto_594106 ) ( ON ?auto_594103 ?auto_594108 ) ( CLEAR ?auto_594103 ) ( not ( = ?auto_594101 ?auto_594108 ) ) ( not ( = ?auto_594103 ?auto_594108 ) ) ( not ( = ?auto_594102 ?auto_594108 ) ) ( ON ?auto_594099 ?auto_594098 ) ( ON ?auto_594100 ?auto_594099 ) ( ON ?auto_594102 ?auto_594100 ) ( not ( = ?auto_594098 ?auto_594099 ) ) ( not ( = ?auto_594098 ?auto_594100 ) ) ( not ( = ?auto_594098 ?auto_594102 ) ) ( not ( = ?auto_594098 ?auto_594101 ) ) ( not ( = ?auto_594098 ?auto_594103 ) ) ( not ( = ?auto_594098 ?auto_594108 ) ) ( not ( = ?auto_594099 ?auto_594100 ) ) ( not ( = ?auto_594099 ?auto_594102 ) ) ( not ( = ?auto_594099 ?auto_594101 ) ) ( not ( = ?auto_594099 ?auto_594103 ) ) ( not ( = ?auto_594099 ?auto_594108 ) ) ( not ( = ?auto_594100 ?auto_594102 ) ) ( not ( = ?auto_594100 ?auto_594101 ) ) ( not ( = ?auto_594100 ?auto_594103 ) ) ( not ( = ?auto_594100 ?auto_594108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594102 ?auto_594101 ?auto_594103 )
      ( MAKE-5CRATE-VERIFY ?auto_594098 ?auto_594099 ?auto_594100 ?auto_594102 ?auto_594101 ?auto_594103 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594149 - SURFACE
      ?auto_594150 - SURFACE
      ?auto_594151 - SURFACE
      ?auto_594153 - SURFACE
      ?auto_594152 - SURFACE
      ?auto_594154 - SURFACE
    )
    :vars
    (
      ?auto_594159 - HOIST
      ?auto_594157 - PLACE
      ?auto_594160 - PLACE
      ?auto_594156 - HOIST
      ?auto_594158 - SURFACE
      ?auto_594155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594159 ?auto_594157 ) ( SURFACE-AT ?auto_594152 ?auto_594157 ) ( CLEAR ?auto_594152 ) ( IS-CRATE ?auto_594154 ) ( not ( = ?auto_594152 ?auto_594154 ) ) ( AVAILABLE ?auto_594159 ) ( ON ?auto_594152 ?auto_594153 ) ( not ( = ?auto_594153 ?auto_594152 ) ) ( not ( = ?auto_594153 ?auto_594154 ) ) ( not ( = ?auto_594160 ?auto_594157 ) ) ( HOIST-AT ?auto_594156 ?auto_594160 ) ( not ( = ?auto_594159 ?auto_594156 ) ) ( AVAILABLE ?auto_594156 ) ( SURFACE-AT ?auto_594154 ?auto_594160 ) ( ON ?auto_594154 ?auto_594158 ) ( CLEAR ?auto_594154 ) ( not ( = ?auto_594152 ?auto_594158 ) ) ( not ( = ?auto_594154 ?auto_594158 ) ) ( not ( = ?auto_594153 ?auto_594158 ) ) ( TRUCK-AT ?auto_594155 ?auto_594157 ) ( ON ?auto_594150 ?auto_594149 ) ( ON ?auto_594151 ?auto_594150 ) ( ON ?auto_594153 ?auto_594151 ) ( not ( = ?auto_594149 ?auto_594150 ) ) ( not ( = ?auto_594149 ?auto_594151 ) ) ( not ( = ?auto_594149 ?auto_594153 ) ) ( not ( = ?auto_594149 ?auto_594152 ) ) ( not ( = ?auto_594149 ?auto_594154 ) ) ( not ( = ?auto_594149 ?auto_594158 ) ) ( not ( = ?auto_594150 ?auto_594151 ) ) ( not ( = ?auto_594150 ?auto_594153 ) ) ( not ( = ?auto_594150 ?auto_594152 ) ) ( not ( = ?auto_594150 ?auto_594154 ) ) ( not ( = ?auto_594150 ?auto_594158 ) ) ( not ( = ?auto_594151 ?auto_594153 ) ) ( not ( = ?auto_594151 ?auto_594152 ) ) ( not ( = ?auto_594151 ?auto_594154 ) ) ( not ( = ?auto_594151 ?auto_594158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594153 ?auto_594152 ?auto_594154 )
      ( MAKE-5CRATE-VERIFY ?auto_594149 ?auto_594150 ?auto_594151 ?auto_594153 ?auto_594152 ?auto_594154 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594200 - SURFACE
      ?auto_594201 - SURFACE
      ?auto_594202 - SURFACE
      ?auto_594204 - SURFACE
      ?auto_594203 - SURFACE
      ?auto_594205 - SURFACE
    )
    :vars
    (
      ?auto_594206 - HOIST
      ?auto_594208 - PLACE
      ?auto_594210 - PLACE
      ?auto_594209 - HOIST
      ?auto_594207 - SURFACE
      ?auto_594211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594206 ?auto_594208 ) ( IS-CRATE ?auto_594205 ) ( not ( = ?auto_594203 ?auto_594205 ) ) ( not ( = ?auto_594204 ?auto_594203 ) ) ( not ( = ?auto_594204 ?auto_594205 ) ) ( not ( = ?auto_594210 ?auto_594208 ) ) ( HOIST-AT ?auto_594209 ?auto_594210 ) ( not ( = ?auto_594206 ?auto_594209 ) ) ( AVAILABLE ?auto_594209 ) ( SURFACE-AT ?auto_594205 ?auto_594210 ) ( ON ?auto_594205 ?auto_594207 ) ( CLEAR ?auto_594205 ) ( not ( = ?auto_594203 ?auto_594207 ) ) ( not ( = ?auto_594205 ?auto_594207 ) ) ( not ( = ?auto_594204 ?auto_594207 ) ) ( TRUCK-AT ?auto_594211 ?auto_594208 ) ( SURFACE-AT ?auto_594204 ?auto_594208 ) ( CLEAR ?auto_594204 ) ( LIFTING ?auto_594206 ?auto_594203 ) ( IS-CRATE ?auto_594203 ) ( ON ?auto_594201 ?auto_594200 ) ( ON ?auto_594202 ?auto_594201 ) ( ON ?auto_594204 ?auto_594202 ) ( not ( = ?auto_594200 ?auto_594201 ) ) ( not ( = ?auto_594200 ?auto_594202 ) ) ( not ( = ?auto_594200 ?auto_594204 ) ) ( not ( = ?auto_594200 ?auto_594203 ) ) ( not ( = ?auto_594200 ?auto_594205 ) ) ( not ( = ?auto_594200 ?auto_594207 ) ) ( not ( = ?auto_594201 ?auto_594202 ) ) ( not ( = ?auto_594201 ?auto_594204 ) ) ( not ( = ?auto_594201 ?auto_594203 ) ) ( not ( = ?auto_594201 ?auto_594205 ) ) ( not ( = ?auto_594201 ?auto_594207 ) ) ( not ( = ?auto_594202 ?auto_594204 ) ) ( not ( = ?auto_594202 ?auto_594203 ) ) ( not ( = ?auto_594202 ?auto_594205 ) ) ( not ( = ?auto_594202 ?auto_594207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594204 ?auto_594203 ?auto_594205 )
      ( MAKE-5CRATE-VERIFY ?auto_594200 ?auto_594201 ?auto_594202 ?auto_594204 ?auto_594203 ?auto_594205 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594251 - SURFACE
      ?auto_594252 - SURFACE
      ?auto_594253 - SURFACE
      ?auto_594255 - SURFACE
      ?auto_594254 - SURFACE
      ?auto_594256 - SURFACE
    )
    :vars
    (
      ?auto_594261 - HOIST
      ?auto_594258 - PLACE
      ?auto_594262 - PLACE
      ?auto_594257 - HOIST
      ?auto_594259 - SURFACE
      ?auto_594260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594261 ?auto_594258 ) ( IS-CRATE ?auto_594256 ) ( not ( = ?auto_594254 ?auto_594256 ) ) ( not ( = ?auto_594255 ?auto_594254 ) ) ( not ( = ?auto_594255 ?auto_594256 ) ) ( not ( = ?auto_594262 ?auto_594258 ) ) ( HOIST-AT ?auto_594257 ?auto_594262 ) ( not ( = ?auto_594261 ?auto_594257 ) ) ( AVAILABLE ?auto_594257 ) ( SURFACE-AT ?auto_594256 ?auto_594262 ) ( ON ?auto_594256 ?auto_594259 ) ( CLEAR ?auto_594256 ) ( not ( = ?auto_594254 ?auto_594259 ) ) ( not ( = ?auto_594256 ?auto_594259 ) ) ( not ( = ?auto_594255 ?auto_594259 ) ) ( TRUCK-AT ?auto_594260 ?auto_594258 ) ( SURFACE-AT ?auto_594255 ?auto_594258 ) ( CLEAR ?auto_594255 ) ( IS-CRATE ?auto_594254 ) ( AVAILABLE ?auto_594261 ) ( IN ?auto_594254 ?auto_594260 ) ( ON ?auto_594252 ?auto_594251 ) ( ON ?auto_594253 ?auto_594252 ) ( ON ?auto_594255 ?auto_594253 ) ( not ( = ?auto_594251 ?auto_594252 ) ) ( not ( = ?auto_594251 ?auto_594253 ) ) ( not ( = ?auto_594251 ?auto_594255 ) ) ( not ( = ?auto_594251 ?auto_594254 ) ) ( not ( = ?auto_594251 ?auto_594256 ) ) ( not ( = ?auto_594251 ?auto_594259 ) ) ( not ( = ?auto_594252 ?auto_594253 ) ) ( not ( = ?auto_594252 ?auto_594255 ) ) ( not ( = ?auto_594252 ?auto_594254 ) ) ( not ( = ?auto_594252 ?auto_594256 ) ) ( not ( = ?auto_594252 ?auto_594259 ) ) ( not ( = ?auto_594253 ?auto_594255 ) ) ( not ( = ?auto_594253 ?auto_594254 ) ) ( not ( = ?auto_594253 ?auto_594256 ) ) ( not ( = ?auto_594253 ?auto_594259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594255 ?auto_594254 ?auto_594256 )
      ( MAKE-5CRATE-VERIFY ?auto_594251 ?auto_594252 ?auto_594253 ?auto_594255 ?auto_594254 ?auto_594256 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595460 - SURFACE
      ?auto_595461 - SURFACE
      ?auto_595462 - SURFACE
      ?auto_595464 - SURFACE
      ?auto_595463 - SURFACE
      ?auto_595465 - SURFACE
      ?auto_595466 - SURFACE
    )
    :vars
    (
      ?auto_595468 - HOIST
      ?auto_595467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595468 ?auto_595467 ) ( SURFACE-AT ?auto_595465 ?auto_595467 ) ( CLEAR ?auto_595465 ) ( LIFTING ?auto_595468 ?auto_595466 ) ( IS-CRATE ?auto_595466 ) ( not ( = ?auto_595465 ?auto_595466 ) ) ( ON ?auto_595461 ?auto_595460 ) ( ON ?auto_595462 ?auto_595461 ) ( ON ?auto_595464 ?auto_595462 ) ( ON ?auto_595463 ?auto_595464 ) ( ON ?auto_595465 ?auto_595463 ) ( not ( = ?auto_595460 ?auto_595461 ) ) ( not ( = ?auto_595460 ?auto_595462 ) ) ( not ( = ?auto_595460 ?auto_595464 ) ) ( not ( = ?auto_595460 ?auto_595463 ) ) ( not ( = ?auto_595460 ?auto_595465 ) ) ( not ( = ?auto_595460 ?auto_595466 ) ) ( not ( = ?auto_595461 ?auto_595462 ) ) ( not ( = ?auto_595461 ?auto_595464 ) ) ( not ( = ?auto_595461 ?auto_595463 ) ) ( not ( = ?auto_595461 ?auto_595465 ) ) ( not ( = ?auto_595461 ?auto_595466 ) ) ( not ( = ?auto_595462 ?auto_595464 ) ) ( not ( = ?auto_595462 ?auto_595463 ) ) ( not ( = ?auto_595462 ?auto_595465 ) ) ( not ( = ?auto_595462 ?auto_595466 ) ) ( not ( = ?auto_595464 ?auto_595463 ) ) ( not ( = ?auto_595464 ?auto_595465 ) ) ( not ( = ?auto_595464 ?auto_595466 ) ) ( not ( = ?auto_595463 ?auto_595465 ) ) ( not ( = ?auto_595463 ?auto_595466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_595465 ?auto_595466 )
      ( MAKE-6CRATE-VERIFY ?auto_595460 ?auto_595461 ?auto_595462 ?auto_595464 ?auto_595463 ?auto_595465 ?auto_595466 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595504 - SURFACE
      ?auto_595505 - SURFACE
      ?auto_595506 - SURFACE
      ?auto_595508 - SURFACE
      ?auto_595507 - SURFACE
      ?auto_595509 - SURFACE
      ?auto_595510 - SURFACE
    )
    :vars
    (
      ?auto_595511 - HOIST
      ?auto_595512 - PLACE
      ?auto_595513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595511 ?auto_595512 ) ( SURFACE-AT ?auto_595509 ?auto_595512 ) ( CLEAR ?auto_595509 ) ( IS-CRATE ?auto_595510 ) ( not ( = ?auto_595509 ?auto_595510 ) ) ( TRUCK-AT ?auto_595513 ?auto_595512 ) ( AVAILABLE ?auto_595511 ) ( IN ?auto_595510 ?auto_595513 ) ( ON ?auto_595509 ?auto_595507 ) ( not ( = ?auto_595507 ?auto_595509 ) ) ( not ( = ?auto_595507 ?auto_595510 ) ) ( ON ?auto_595505 ?auto_595504 ) ( ON ?auto_595506 ?auto_595505 ) ( ON ?auto_595508 ?auto_595506 ) ( ON ?auto_595507 ?auto_595508 ) ( not ( = ?auto_595504 ?auto_595505 ) ) ( not ( = ?auto_595504 ?auto_595506 ) ) ( not ( = ?auto_595504 ?auto_595508 ) ) ( not ( = ?auto_595504 ?auto_595507 ) ) ( not ( = ?auto_595504 ?auto_595509 ) ) ( not ( = ?auto_595504 ?auto_595510 ) ) ( not ( = ?auto_595505 ?auto_595506 ) ) ( not ( = ?auto_595505 ?auto_595508 ) ) ( not ( = ?auto_595505 ?auto_595507 ) ) ( not ( = ?auto_595505 ?auto_595509 ) ) ( not ( = ?auto_595505 ?auto_595510 ) ) ( not ( = ?auto_595506 ?auto_595508 ) ) ( not ( = ?auto_595506 ?auto_595507 ) ) ( not ( = ?auto_595506 ?auto_595509 ) ) ( not ( = ?auto_595506 ?auto_595510 ) ) ( not ( = ?auto_595508 ?auto_595507 ) ) ( not ( = ?auto_595508 ?auto_595509 ) ) ( not ( = ?auto_595508 ?auto_595510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595507 ?auto_595509 ?auto_595510 )
      ( MAKE-6CRATE-VERIFY ?auto_595504 ?auto_595505 ?auto_595506 ?auto_595508 ?auto_595507 ?auto_595509 ?auto_595510 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595555 - SURFACE
      ?auto_595556 - SURFACE
      ?auto_595557 - SURFACE
      ?auto_595559 - SURFACE
      ?auto_595558 - SURFACE
      ?auto_595560 - SURFACE
      ?auto_595561 - SURFACE
    )
    :vars
    (
      ?auto_595563 - HOIST
      ?auto_595562 - PLACE
      ?auto_595564 - TRUCK
      ?auto_595565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595563 ?auto_595562 ) ( SURFACE-AT ?auto_595560 ?auto_595562 ) ( CLEAR ?auto_595560 ) ( IS-CRATE ?auto_595561 ) ( not ( = ?auto_595560 ?auto_595561 ) ) ( AVAILABLE ?auto_595563 ) ( IN ?auto_595561 ?auto_595564 ) ( ON ?auto_595560 ?auto_595558 ) ( not ( = ?auto_595558 ?auto_595560 ) ) ( not ( = ?auto_595558 ?auto_595561 ) ) ( TRUCK-AT ?auto_595564 ?auto_595565 ) ( not ( = ?auto_595565 ?auto_595562 ) ) ( ON ?auto_595556 ?auto_595555 ) ( ON ?auto_595557 ?auto_595556 ) ( ON ?auto_595559 ?auto_595557 ) ( ON ?auto_595558 ?auto_595559 ) ( not ( = ?auto_595555 ?auto_595556 ) ) ( not ( = ?auto_595555 ?auto_595557 ) ) ( not ( = ?auto_595555 ?auto_595559 ) ) ( not ( = ?auto_595555 ?auto_595558 ) ) ( not ( = ?auto_595555 ?auto_595560 ) ) ( not ( = ?auto_595555 ?auto_595561 ) ) ( not ( = ?auto_595556 ?auto_595557 ) ) ( not ( = ?auto_595556 ?auto_595559 ) ) ( not ( = ?auto_595556 ?auto_595558 ) ) ( not ( = ?auto_595556 ?auto_595560 ) ) ( not ( = ?auto_595556 ?auto_595561 ) ) ( not ( = ?auto_595557 ?auto_595559 ) ) ( not ( = ?auto_595557 ?auto_595558 ) ) ( not ( = ?auto_595557 ?auto_595560 ) ) ( not ( = ?auto_595557 ?auto_595561 ) ) ( not ( = ?auto_595559 ?auto_595558 ) ) ( not ( = ?auto_595559 ?auto_595560 ) ) ( not ( = ?auto_595559 ?auto_595561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595558 ?auto_595560 ?auto_595561 )
      ( MAKE-6CRATE-VERIFY ?auto_595555 ?auto_595556 ?auto_595557 ?auto_595559 ?auto_595558 ?auto_595560 ?auto_595561 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595612 - SURFACE
      ?auto_595613 - SURFACE
      ?auto_595614 - SURFACE
      ?auto_595616 - SURFACE
      ?auto_595615 - SURFACE
      ?auto_595617 - SURFACE
      ?auto_595618 - SURFACE
    )
    :vars
    (
      ?auto_595623 - HOIST
      ?auto_595622 - PLACE
      ?auto_595621 - TRUCK
      ?auto_595620 - PLACE
      ?auto_595619 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_595623 ?auto_595622 ) ( SURFACE-AT ?auto_595617 ?auto_595622 ) ( CLEAR ?auto_595617 ) ( IS-CRATE ?auto_595618 ) ( not ( = ?auto_595617 ?auto_595618 ) ) ( AVAILABLE ?auto_595623 ) ( ON ?auto_595617 ?auto_595615 ) ( not ( = ?auto_595615 ?auto_595617 ) ) ( not ( = ?auto_595615 ?auto_595618 ) ) ( TRUCK-AT ?auto_595621 ?auto_595620 ) ( not ( = ?auto_595620 ?auto_595622 ) ) ( HOIST-AT ?auto_595619 ?auto_595620 ) ( LIFTING ?auto_595619 ?auto_595618 ) ( not ( = ?auto_595623 ?auto_595619 ) ) ( ON ?auto_595613 ?auto_595612 ) ( ON ?auto_595614 ?auto_595613 ) ( ON ?auto_595616 ?auto_595614 ) ( ON ?auto_595615 ?auto_595616 ) ( not ( = ?auto_595612 ?auto_595613 ) ) ( not ( = ?auto_595612 ?auto_595614 ) ) ( not ( = ?auto_595612 ?auto_595616 ) ) ( not ( = ?auto_595612 ?auto_595615 ) ) ( not ( = ?auto_595612 ?auto_595617 ) ) ( not ( = ?auto_595612 ?auto_595618 ) ) ( not ( = ?auto_595613 ?auto_595614 ) ) ( not ( = ?auto_595613 ?auto_595616 ) ) ( not ( = ?auto_595613 ?auto_595615 ) ) ( not ( = ?auto_595613 ?auto_595617 ) ) ( not ( = ?auto_595613 ?auto_595618 ) ) ( not ( = ?auto_595614 ?auto_595616 ) ) ( not ( = ?auto_595614 ?auto_595615 ) ) ( not ( = ?auto_595614 ?auto_595617 ) ) ( not ( = ?auto_595614 ?auto_595618 ) ) ( not ( = ?auto_595616 ?auto_595615 ) ) ( not ( = ?auto_595616 ?auto_595617 ) ) ( not ( = ?auto_595616 ?auto_595618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595615 ?auto_595617 ?auto_595618 )
      ( MAKE-6CRATE-VERIFY ?auto_595612 ?auto_595613 ?auto_595614 ?auto_595616 ?auto_595615 ?auto_595617 ?auto_595618 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595675 - SURFACE
      ?auto_595676 - SURFACE
      ?auto_595677 - SURFACE
      ?auto_595679 - SURFACE
      ?auto_595678 - SURFACE
      ?auto_595680 - SURFACE
      ?auto_595681 - SURFACE
    )
    :vars
    (
      ?auto_595684 - HOIST
      ?auto_595687 - PLACE
      ?auto_595682 - TRUCK
      ?auto_595686 - PLACE
      ?auto_595683 - HOIST
      ?auto_595685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595684 ?auto_595687 ) ( SURFACE-AT ?auto_595680 ?auto_595687 ) ( CLEAR ?auto_595680 ) ( IS-CRATE ?auto_595681 ) ( not ( = ?auto_595680 ?auto_595681 ) ) ( AVAILABLE ?auto_595684 ) ( ON ?auto_595680 ?auto_595678 ) ( not ( = ?auto_595678 ?auto_595680 ) ) ( not ( = ?auto_595678 ?auto_595681 ) ) ( TRUCK-AT ?auto_595682 ?auto_595686 ) ( not ( = ?auto_595686 ?auto_595687 ) ) ( HOIST-AT ?auto_595683 ?auto_595686 ) ( not ( = ?auto_595684 ?auto_595683 ) ) ( AVAILABLE ?auto_595683 ) ( SURFACE-AT ?auto_595681 ?auto_595686 ) ( ON ?auto_595681 ?auto_595685 ) ( CLEAR ?auto_595681 ) ( not ( = ?auto_595680 ?auto_595685 ) ) ( not ( = ?auto_595681 ?auto_595685 ) ) ( not ( = ?auto_595678 ?auto_595685 ) ) ( ON ?auto_595676 ?auto_595675 ) ( ON ?auto_595677 ?auto_595676 ) ( ON ?auto_595679 ?auto_595677 ) ( ON ?auto_595678 ?auto_595679 ) ( not ( = ?auto_595675 ?auto_595676 ) ) ( not ( = ?auto_595675 ?auto_595677 ) ) ( not ( = ?auto_595675 ?auto_595679 ) ) ( not ( = ?auto_595675 ?auto_595678 ) ) ( not ( = ?auto_595675 ?auto_595680 ) ) ( not ( = ?auto_595675 ?auto_595681 ) ) ( not ( = ?auto_595675 ?auto_595685 ) ) ( not ( = ?auto_595676 ?auto_595677 ) ) ( not ( = ?auto_595676 ?auto_595679 ) ) ( not ( = ?auto_595676 ?auto_595678 ) ) ( not ( = ?auto_595676 ?auto_595680 ) ) ( not ( = ?auto_595676 ?auto_595681 ) ) ( not ( = ?auto_595676 ?auto_595685 ) ) ( not ( = ?auto_595677 ?auto_595679 ) ) ( not ( = ?auto_595677 ?auto_595678 ) ) ( not ( = ?auto_595677 ?auto_595680 ) ) ( not ( = ?auto_595677 ?auto_595681 ) ) ( not ( = ?auto_595677 ?auto_595685 ) ) ( not ( = ?auto_595679 ?auto_595678 ) ) ( not ( = ?auto_595679 ?auto_595680 ) ) ( not ( = ?auto_595679 ?auto_595681 ) ) ( not ( = ?auto_595679 ?auto_595685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595678 ?auto_595680 ?auto_595681 )
      ( MAKE-6CRATE-VERIFY ?auto_595675 ?auto_595676 ?auto_595677 ?auto_595679 ?auto_595678 ?auto_595680 ?auto_595681 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595739 - SURFACE
      ?auto_595740 - SURFACE
      ?auto_595741 - SURFACE
      ?auto_595743 - SURFACE
      ?auto_595742 - SURFACE
      ?auto_595744 - SURFACE
      ?auto_595745 - SURFACE
    )
    :vars
    (
      ?auto_595749 - HOIST
      ?auto_595746 - PLACE
      ?auto_595748 - PLACE
      ?auto_595751 - HOIST
      ?auto_595750 - SURFACE
      ?auto_595747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595749 ?auto_595746 ) ( SURFACE-AT ?auto_595744 ?auto_595746 ) ( CLEAR ?auto_595744 ) ( IS-CRATE ?auto_595745 ) ( not ( = ?auto_595744 ?auto_595745 ) ) ( AVAILABLE ?auto_595749 ) ( ON ?auto_595744 ?auto_595742 ) ( not ( = ?auto_595742 ?auto_595744 ) ) ( not ( = ?auto_595742 ?auto_595745 ) ) ( not ( = ?auto_595748 ?auto_595746 ) ) ( HOIST-AT ?auto_595751 ?auto_595748 ) ( not ( = ?auto_595749 ?auto_595751 ) ) ( AVAILABLE ?auto_595751 ) ( SURFACE-AT ?auto_595745 ?auto_595748 ) ( ON ?auto_595745 ?auto_595750 ) ( CLEAR ?auto_595745 ) ( not ( = ?auto_595744 ?auto_595750 ) ) ( not ( = ?auto_595745 ?auto_595750 ) ) ( not ( = ?auto_595742 ?auto_595750 ) ) ( TRUCK-AT ?auto_595747 ?auto_595746 ) ( ON ?auto_595740 ?auto_595739 ) ( ON ?auto_595741 ?auto_595740 ) ( ON ?auto_595743 ?auto_595741 ) ( ON ?auto_595742 ?auto_595743 ) ( not ( = ?auto_595739 ?auto_595740 ) ) ( not ( = ?auto_595739 ?auto_595741 ) ) ( not ( = ?auto_595739 ?auto_595743 ) ) ( not ( = ?auto_595739 ?auto_595742 ) ) ( not ( = ?auto_595739 ?auto_595744 ) ) ( not ( = ?auto_595739 ?auto_595745 ) ) ( not ( = ?auto_595739 ?auto_595750 ) ) ( not ( = ?auto_595740 ?auto_595741 ) ) ( not ( = ?auto_595740 ?auto_595743 ) ) ( not ( = ?auto_595740 ?auto_595742 ) ) ( not ( = ?auto_595740 ?auto_595744 ) ) ( not ( = ?auto_595740 ?auto_595745 ) ) ( not ( = ?auto_595740 ?auto_595750 ) ) ( not ( = ?auto_595741 ?auto_595743 ) ) ( not ( = ?auto_595741 ?auto_595742 ) ) ( not ( = ?auto_595741 ?auto_595744 ) ) ( not ( = ?auto_595741 ?auto_595745 ) ) ( not ( = ?auto_595741 ?auto_595750 ) ) ( not ( = ?auto_595743 ?auto_595742 ) ) ( not ( = ?auto_595743 ?auto_595744 ) ) ( not ( = ?auto_595743 ?auto_595745 ) ) ( not ( = ?auto_595743 ?auto_595750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595742 ?auto_595744 ?auto_595745 )
      ( MAKE-6CRATE-VERIFY ?auto_595739 ?auto_595740 ?auto_595741 ?auto_595743 ?auto_595742 ?auto_595744 ?auto_595745 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595803 - SURFACE
      ?auto_595804 - SURFACE
      ?auto_595805 - SURFACE
      ?auto_595807 - SURFACE
      ?auto_595806 - SURFACE
      ?auto_595808 - SURFACE
      ?auto_595809 - SURFACE
    )
    :vars
    (
      ?auto_595812 - HOIST
      ?auto_595811 - PLACE
      ?auto_595810 - PLACE
      ?auto_595813 - HOIST
      ?auto_595814 - SURFACE
      ?auto_595815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595812 ?auto_595811 ) ( IS-CRATE ?auto_595809 ) ( not ( = ?auto_595808 ?auto_595809 ) ) ( not ( = ?auto_595806 ?auto_595808 ) ) ( not ( = ?auto_595806 ?auto_595809 ) ) ( not ( = ?auto_595810 ?auto_595811 ) ) ( HOIST-AT ?auto_595813 ?auto_595810 ) ( not ( = ?auto_595812 ?auto_595813 ) ) ( AVAILABLE ?auto_595813 ) ( SURFACE-AT ?auto_595809 ?auto_595810 ) ( ON ?auto_595809 ?auto_595814 ) ( CLEAR ?auto_595809 ) ( not ( = ?auto_595808 ?auto_595814 ) ) ( not ( = ?auto_595809 ?auto_595814 ) ) ( not ( = ?auto_595806 ?auto_595814 ) ) ( TRUCK-AT ?auto_595815 ?auto_595811 ) ( SURFACE-AT ?auto_595806 ?auto_595811 ) ( CLEAR ?auto_595806 ) ( LIFTING ?auto_595812 ?auto_595808 ) ( IS-CRATE ?auto_595808 ) ( ON ?auto_595804 ?auto_595803 ) ( ON ?auto_595805 ?auto_595804 ) ( ON ?auto_595807 ?auto_595805 ) ( ON ?auto_595806 ?auto_595807 ) ( not ( = ?auto_595803 ?auto_595804 ) ) ( not ( = ?auto_595803 ?auto_595805 ) ) ( not ( = ?auto_595803 ?auto_595807 ) ) ( not ( = ?auto_595803 ?auto_595806 ) ) ( not ( = ?auto_595803 ?auto_595808 ) ) ( not ( = ?auto_595803 ?auto_595809 ) ) ( not ( = ?auto_595803 ?auto_595814 ) ) ( not ( = ?auto_595804 ?auto_595805 ) ) ( not ( = ?auto_595804 ?auto_595807 ) ) ( not ( = ?auto_595804 ?auto_595806 ) ) ( not ( = ?auto_595804 ?auto_595808 ) ) ( not ( = ?auto_595804 ?auto_595809 ) ) ( not ( = ?auto_595804 ?auto_595814 ) ) ( not ( = ?auto_595805 ?auto_595807 ) ) ( not ( = ?auto_595805 ?auto_595806 ) ) ( not ( = ?auto_595805 ?auto_595808 ) ) ( not ( = ?auto_595805 ?auto_595809 ) ) ( not ( = ?auto_595805 ?auto_595814 ) ) ( not ( = ?auto_595807 ?auto_595806 ) ) ( not ( = ?auto_595807 ?auto_595808 ) ) ( not ( = ?auto_595807 ?auto_595809 ) ) ( not ( = ?auto_595807 ?auto_595814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595806 ?auto_595808 ?auto_595809 )
      ( MAKE-6CRATE-VERIFY ?auto_595803 ?auto_595804 ?auto_595805 ?auto_595807 ?auto_595806 ?auto_595808 ?auto_595809 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_595867 - SURFACE
      ?auto_595868 - SURFACE
      ?auto_595869 - SURFACE
      ?auto_595871 - SURFACE
      ?auto_595870 - SURFACE
      ?auto_595872 - SURFACE
      ?auto_595873 - SURFACE
    )
    :vars
    (
      ?auto_595878 - HOIST
      ?auto_595879 - PLACE
      ?auto_595875 - PLACE
      ?auto_595877 - HOIST
      ?auto_595876 - SURFACE
      ?auto_595874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595878 ?auto_595879 ) ( IS-CRATE ?auto_595873 ) ( not ( = ?auto_595872 ?auto_595873 ) ) ( not ( = ?auto_595870 ?auto_595872 ) ) ( not ( = ?auto_595870 ?auto_595873 ) ) ( not ( = ?auto_595875 ?auto_595879 ) ) ( HOIST-AT ?auto_595877 ?auto_595875 ) ( not ( = ?auto_595878 ?auto_595877 ) ) ( AVAILABLE ?auto_595877 ) ( SURFACE-AT ?auto_595873 ?auto_595875 ) ( ON ?auto_595873 ?auto_595876 ) ( CLEAR ?auto_595873 ) ( not ( = ?auto_595872 ?auto_595876 ) ) ( not ( = ?auto_595873 ?auto_595876 ) ) ( not ( = ?auto_595870 ?auto_595876 ) ) ( TRUCK-AT ?auto_595874 ?auto_595879 ) ( SURFACE-AT ?auto_595870 ?auto_595879 ) ( CLEAR ?auto_595870 ) ( IS-CRATE ?auto_595872 ) ( AVAILABLE ?auto_595878 ) ( IN ?auto_595872 ?auto_595874 ) ( ON ?auto_595868 ?auto_595867 ) ( ON ?auto_595869 ?auto_595868 ) ( ON ?auto_595871 ?auto_595869 ) ( ON ?auto_595870 ?auto_595871 ) ( not ( = ?auto_595867 ?auto_595868 ) ) ( not ( = ?auto_595867 ?auto_595869 ) ) ( not ( = ?auto_595867 ?auto_595871 ) ) ( not ( = ?auto_595867 ?auto_595870 ) ) ( not ( = ?auto_595867 ?auto_595872 ) ) ( not ( = ?auto_595867 ?auto_595873 ) ) ( not ( = ?auto_595867 ?auto_595876 ) ) ( not ( = ?auto_595868 ?auto_595869 ) ) ( not ( = ?auto_595868 ?auto_595871 ) ) ( not ( = ?auto_595868 ?auto_595870 ) ) ( not ( = ?auto_595868 ?auto_595872 ) ) ( not ( = ?auto_595868 ?auto_595873 ) ) ( not ( = ?auto_595868 ?auto_595876 ) ) ( not ( = ?auto_595869 ?auto_595871 ) ) ( not ( = ?auto_595869 ?auto_595870 ) ) ( not ( = ?auto_595869 ?auto_595872 ) ) ( not ( = ?auto_595869 ?auto_595873 ) ) ( not ( = ?auto_595869 ?auto_595876 ) ) ( not ( = ?auto_595871 ?auto_595870 ) ) ( not ( = ?auto_595871 ?auto_595872 ) ) ( not ( = ?auto_595871 ?auto_595873 ) ) ( not ( = ?auto_595871 ?auto_595876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595870 ?auto_595872 ?auto_595873 )
      ( MAKE-6CRATE-VERIFY ?auto_595867 ?auto_595868 ?auto_595869 ?auto_595871 ?auto_595870 ?auto_595872 ?auto_595873 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_597823 - SURFACE
      ?auto_597824 - SURFACE
      ?auto_597825 - SURFACE
      ?auto_597827 - SURFACE
      ?auto_597826 - SURFACE
      ?auto_597828 - SURFACE
      ?auto_597829 - SURFACE
      ?auto_597830 - SURFACE
    )
    :vars
    (
      ?auto_597831 - HOIST
      ?auto_597832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_597831 ?auto_597832 ) ( SURFACE-AT ?auto_597829 ?auto_597832 ) ( CLEAR ?auto_597829 ) ( LIFTING ?auto_597831 ?auto_597830 ) ( IS-CRATE ?auto_597830 ) ( not ( = ?auto_597829 ?auto_597830 ) ) ( ON ?auto_597824 ?auto_597823 ) ( ON ?auto_597825 ?auto_597824 ) ( ON ?auto_597827 ?auto_597825 ) ( ON ?auto_597826 ?auto_597827 ) ( ON ?auto_597828 ?auto_597826 ) ( ON ?auto_597829 ?auto_597828 ) ( not ( = ?auto_597823 ?auto_597824 ) ) ( not ( = ?auto_597823 ?auto_597825 ) ) ( not ( = ?auto_597823 ?auto_597827 ) ) ( not ( = ?auto_597823 ?auto_597826 ) ) ( not ( = ?auto_597823 ?auto_597828 ) ) ( not ( = ?auto_597823 ?auto_597829 ) ) ( not ( = ?auto_597823 ?auto_597830 ) ) ( not ( = ?auto_597824 ?auto_597825 ) ) ( not ( = ?auto_597824 ?auto_597827 ) ) ( not ( = ?auto_597824 ?auto_597826 ) ) ( not ( = ?auto_597824 ?auto_597828 ) ) ( not ( = ?auto_597824 ?auto_597829 ) ) ( not ( = ?auto_597824 ?auto_597830 ) ) ( not ( = ?auto_597825 ?auto_597827 ) ) ( not ( = ?auto_597825 ?auto_597826 ) ) ( not ( = ?auto_597825 ?auto_597828 ) ) ( not ( = ?auto_597825 ?auto_597829 ) ) ( not ( = ?auto_597825 ?auto_597830 ) ) ( not ( = ?auto_597827 ?auto_597826 ) ) ( not ( = ?auto_597827 ?auto_597828 ) ) ( not ( = ?auto_597827 ?auto_597829 ) ) ( not ( = ?auto_597827 ?auto_597830 ) ) ( not ( = ?auto_597826 ?auto_597828 ) ) ( not ( = ?auto_597826 ?auto_597829 ) ) ( not ( = ?auto_597826 ?auto_597830 ) ) ( not ( = ?auto_597828 ?auto_597829 ) ) ( not ( = ?auto_597828 ?auto_597830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_597829 ?auto_597830 )
      ( MAKE-7CRATE-VERIFY ?auto_597823 ?auto_597824 ?auto_597825 ?auto_597827 ?auto_597826 ?auto_597828 ?auto_597829 ?auto_597830 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_597878 - SURFACE
      ?auto_597879 - SURFACE
      ?auto_597880 - SURFACE
      ?auto_597882 - SURFACE
      ?auto_597881 - SURFACE
      ?auto_597883 - SURFACE
      ?auto_597884 - SURFACE
      ?auto_597885 - SURFACE
    )
    :vars
    (
      ?auto_597886 - HOIST
      ?auto_597887 - PLACE
      ?auto_597888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_597886 ?auto_597887 ) ( SURFACE-AT ?auto_597884 ?auto_597887 ) ( CLEAR ?auto_597884 ) ( IS-CRATE ?auto_597885 ) ( not ( = ?auto_597884 ?auto_597885 ) ) ( TRUCK-AT ?auto_597888 ?auto_597887 ) ( AVAILABLE ?auto_597886 ) ( IN ?auto_597885 ?auto_597888 ) ( ON ?auto_597884 ?auto_597883 ) ( not ( = ?auto_597883 ?auto_597884 ) ) ( not ( = ?auto_597883 ?auto_597885 ) ) ( ON ?auto_597879 ?auto_597878 ) ( ON ?auto_597880 ?auto_597879 ) ( ON ?auto_597882 ?auto_597880 ) ( ON ?auto_597881 ?auto_597882 ) ( ON ?auto_597883 ?auto_597881 ) ( not ( = ?auto_597878 ?auto_597879 ) ) ( not ( = ?auto_597878 ?auto_597880 ) ) ( not ( = ?auto_597878 ?auto_597882 ) ) ( not ( = ?auto_597878 ?auto_597881 ) ) ( not ( = ?auto_597878 ?auto_597883 ) ) ( not ( = ?auto_597878 ?auto_597884 ) ) ( not ( = ?auto_597878 ?auto_597885 ) ) ( not ( = ?auto_597879 ?auto_597880 ) ) ( not ( = ?auto_597879 ?auto_597882 ) ) ( not ( = ?auto_597879 ?auto_597881 ) ) ( not ( = ?auto_597879 ?auto_597883 ) ) ( not ( = ?auto_597879 ?auto_597884 ) ) ( not ( = ?auto_597879 ?auto_597885 ) ) ( not ( = ?auto_597880 ?auto_597882 ) ) ( not ( = ?auto_597880 ?auto_597881 ) ) ( not ( = ?auto_597880 ?auto_597883 ) ) ( not ( = ?auto_597880 ?auto_597884 ) ) ( not ( = ?auto_597880 ?auto_597885 ) ) ( not ( = ?auto_597882 ?auto_597881 ) ) ( not ( = ?auto_597882 ?auto_597883 ) ) ( not ( = ?auto_597882 ?auto_597884 ) ) ( not ( = ?auto_597882 ?auto_597885 ) ) ( not ( = ?auto_597881 ?auto_597883 ) ) ( not ( = ?auto_597881 ?auto_597884 ) ) ( not ( = ?auto_597881 ?auto_597885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_597883 ?auto_597884 ?auto_597885 )
      ( MAKE-7CRATE-VERIFY ?auto_597878 ?auto_597879 ?auto_597880 ?auto_597882 ?auto_597881 ?auto_597883 ?auto_597884 ?auto_597885 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_597941 - SURFACE
      ?auto_597942 - SURFACE
      ?auto_597943 - SURFACE
      ?auto_597945 - SURFACE
      ?auto_597944 - SURFACE
      ?auto_597946 - SURFACE
      ?auto_597947 - SURFACE
      ?auto_597948 - SURFACE
    )
    :vars
    (
      ?auto_597951 - HOIST
      ?auto_597952 - PLACE
      ?auto_597950 - TRUCK
      ?auto_597949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_597951 ?auto_597952 ) ( SURFACE-AT ?auto_597947 ?auto_597952 ) ( CLEAR ?auto_597947 ) ( IS-CRATE ?auto_597948 ) ( not ( = ?auto_597947 ?auto_597948 ) ) ( AVAILABLE ?auto_597951 ) ( IN ?auto_597948 ?auto_597950 ) ( ON ?auto_597947 ?auto_597946 ) ( not ( = ?auto_597946 ?auto_597947 ) ) ( not ( = ?auto_597946 ?auto_597948 ) ) ( TRUCK-AT ?auto_597950 ?auto_597949 ) ( not ( = ?auto_597949 ?auto_597952 ) ) ( ON ?auto_597942 ?auto_597941 ) ( ON ?auto_597943 ?auto_597942 ) ( ON ?auto_597945 ?auto_597943 ) ( ON ?auto_597944 ?auto_597945 ) ( ON ?auto_597946 ?auto_597944 ) ( not ( = ?auto_597941 ?auto_597942 ) ) ( not ( = ?auto_597941 ?auto_597943 ) ) ( not ( = ?auto_597941 ?auto_597945 ) ) ( not ( = ?auto_597941 ?auto_597944 ) ) ( not ( = ?auto_597941 ?auto_597946 ) ) ( not ( = ?auto_597941 ?auto_597947 ) ) ( not ( = ?auto_597941 ?auto_597948 ) ) ( not ( = ?auto_597942 ?auto_597943 ) ) ( not ( = ?auto_597942 ?auto_597945 ) ) ( not ( = ?auto_597942 ?auto_597944 ) ) ( not ( = ?auto_597942 ?auto_597946 ) ) ( not ( = ?auto_597942 ?auto_597947 ) ) ( not ( = ?auto_597942 ?auto_597948 ) ) ( not ( = ?auto_597943 ?auto_597945 ) ) ( not ( = ?auto_597943 ?auto_597944 ) ) ( not ( = ?auto_597943 ?auto_597946 ) ) ( not ( = ?auto_597943 ?auto_597947 ) ) ( not ( = ?auto_597943 ?auto_597948 ) ) ( not ( = ?auto_597945 ?auto_597944 ) ) ( not ( = ?auto_597945 ?auto_597946 ) ) ( not ( = ?auto_597945 ?auto_597947 ) ) ( not ( = ?auto_597945 ?auto_597948 ) ) ( not ( = ?auto_597944 ?auto_597946 ) ) ( not ( = ?auto_597944 ?auto_597947 ) ) ( not ( = ?auto_597944 ?auto_597948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_597946 ?auto_597947 ?auto_597948 )
      ( MAKE-7CRATE-VERIFY ?auto_597941 ?auto_597942 ?auto_597943 ?auto_597945 ?auto_597944 ?auto_597946 ?auto_597947 ?auto_597948 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598011 - SURFACE
      ?auto_598012 - SURFACE
      ?auto_598013 - SURFACE
      ?auto_598015 - SURFACE
      ?auto_598014 - SURFACE
      ?auto_598016 - SURFACE
      ?auto_598017 - SURFACE
      ?auto_598018 - SURFACE
    )
    :vars
    (
      ?auto_598019 - HOIST
      ?auto_598020 - PLACE
      ?auto_598022 - TRUCK
      ?auto_598021 - PLACE
      ?auto_598023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_598019 ?auto_598020 ) ( SURFACE-AT ?auto_598017 ?auto_598020 ) ( CLEAR ?auto_598017 ) ( IS-CRATE ?auto_598018 ) ( not ( = ?auto_598017 ?auto_598018 ) ) ( AVAILABLE ?auto_598019 ) ( ON ?auto_598017 ?auto_598016 ) ( not ( = ?auto_598016 ?auto_598017 ) ) ( not ( = ?auto_598016 ?auto_598018 ) ) ( TRUCK-AT ?auto_598022 ?auto_598021 ) ( not ( = ?auto_598021 ?auto_598020 ) ) ( HOIST-AT ?auto_598023 ?auto_598021 ) ( LIFTING ?auto_598023 ?auto_598018 ) ( not ( = ?auto_598019 ?auto_598023 ) ) ( ON ?auto_598012 ?auto_598011 ) ( ON ?auto_598013 ?auto_598012 ) ( ON ?auto_598015 ?auto_598013 ) ( ON ?auto_598014 ?auto_598015 ) ( ON ?auto_598016 ?auto_598014 ) ( not ( = ?auto_598011 ?auto_598012 ) ) ( not ( = ?auto_598011 ?auto_598013 ) ) ( not ( = ?auto_598011 ?auto_598015 ) ) ( not ( = ?auto_598011 ?auto_598014 ) ) ( not ( = ?auto_598011 ?auto_598016 ) ) ( not ( = ?auto_598011 ?auto_598017 ) ) ( not ( = ?auto_598011 ?auto_598018 ) ) ( not ( = ?auto_598012 ?auto_598013 ) ) ( not ( = ?auto_598012 ?auto_598015 ) ) ( not ( = ?auto_598012 ?auto_598014 ) ) ( not ( = ?auto_598012 ?auto_598016 ) ) ( not ( = ?auto_598012 ?auto_598017 ) ) ( not ( = ?auto_598012 ?auto_598018 ) ) ( not ( = ?auto_598013 ?auto_598015 ) ) ( not ( = ?auto_598013 ?auto_598014 ) ) ( not ( = ?auto_598013 ?auto_598016 ) ) ( not ( = ?auto_598013 ?auto_598017 ) ) ( not ( = ?auto_598013 ?auto_598018 ) ) ( not ( = ?auto_598015 ?auto_598014 ) ) ( not ( = ?auto_598015 ?auto_598016 ) ) ( not ( = ?auto_598015 ?auto_598017 ) ) ( not ( = ?auto_598015 ?auto_598018 ) ) ( not ( = ?auto_598014 ?auto_598016 ) ) ( not ( = ?auto_598014 ?auto_598017 ) ) ( not ( = ?auto_598014 ?auto_598018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598016 ?auto_598017 ?auto_598018 )
      ( MAKE-7CRATE-VERIFY ?auto_598011 ?auto_598012 ?auto_598013 ?auto_598015 ?auto_598014 ?auto_598016 ?auto_598017 ?auto_598018 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598088 - SURFACE
      ?auto_598089 - SURFACE
      ?auto_598090 - SURFACE
      ?auto_598092 - SURFACE
      ?auto_598091 - SURFACE
      ?auto_598093 - SURFACE
      ?auto_598094 - SURFACE
      ?auto_598095 - SURFACE
    )
    :vars
    (
      ?auto_598098 - HOIST
      ?auto_598097 - PLACE
      ?auto_598100 - TRUCK
      ?auto_598099 - PLACE
      ?auto_598096 - HOIST
      ?auto_598101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598098 ?auto_598097 ) ( SURFACE-AT ?auto_598094 ?auto_598097 ) ( CLEAR ?auto_598094 ) ( IS-CRATE ?auto_598095 ) ( not ( = ?auto_598094 ?auto_598095 ) ) ( AVAILABLE ?auto_598098 ) ( ON ?auto_598094 ?auto_598093 ) ( not ( = ?auto_598093 ?auto_598094 ) ) ( not ( = ?auto_598093 ?auto_598095 ) ) ( TRUCK-AT ?auto_598100 ?auto_598099 ) ( not ( = ?auto_598099 ?auto_598097 ) ) ( HOIST-AT ?auto_598096 ?auto_598099 ) ( not ( = ?auto_598098 ?auto_598096 ) ) ( AVAILABLE ?auto_598096 ) ( SURFACE-AT ?auto_598095 ?auto_598099 ) ( ON ?auto_598095 ?auto_598101 ) ( CLEAR ?auto_598095 ) ( not ( = ?auto_598094 ?auto_598101 ) ) ( not ( = ?auto_598095 ?auto_598101 ) ) ( not ( = ?auto_598093 ?auto_598101 ) ) ( ON ?auto_598089 ?auto_598088 ) ( ON ?auto_598090 ?auto_598089 ) ( ON ?auto_598092 ?auto_598090 ) ( ON ?auto_598091 ?auto_598092 ) ( ON ?auto_598093 ?auto_598091 ) ( not ( = ?auto_598088 ?auto_598089 ) ) ( not ( = ?auto_598088 ?auto_598090 ) ) ( not ( = ?auto_598088 ?auto_598092 ) ) ( not ( = ?auto_598088 ?auto_598091 ) ) ( not ( = ?auto_598088 ?auto_598093 ) ) ( not ( = ?auto_598088 ?auto_598094 ) ) ( not ( = ?auto_598088 ?auto_598095 ) ) ( not ( = ?auto_598088 ?auto_598101 ) ) ( not ( = ?auto_598089 ?auto_598090 ) ) ( not ( = ?auto_598089 ?auto_598092 ) ) ( not ( = ?auto_598089 ?auto_598091 ) ) ( not ( = ?auto_598089 ?auto_598093 ) ) ( not ( = ?auto_598089 ?auto_598094 ) ) ( not ( = ?auto_598089 ?auto_598095 ) ) ( not ( = ?auto_598089 ?auto_598101 ) ) ( not ( = ?auto_598090 ?auto_598092 ) ) ( not ( = ?auto_598090 ?auto_598091 ) ) ( not ( = ?auto_598090 ?auto_598093 ) ) ( not ( = ?auto_598090 ?auto_598094 ) ) ( not ( = ?auto_598090 ?auto_598095 ) ) ( not ( = ?auto_598090 ?auto_598101 ) ) ( not ( = ?auto_598092 ?auto_598091 ) ) ( not ( = ?auto_598092 ?auto_598093 ) ) ( not ( = ?auto_598092 ?auto_598094 ) ) ( not ( = ?auto_598092 ?auto_598095 ) ) ( not ( = ?auto_598092 ?auto_598101 ) ) ( not ( = ?auto_598091 ?auto_598093 ) ) ( not ( = ?auto_598091 ?auto_598094 ) ) ( not ( = ?auto_598091 ?auto_598095 ) ) ( not ( = ?auto_598091 ?auto_598101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598093 ?auto_598094 ?auto_598095 )
      ( MAKE-7CRATE-VERIFY ?auto_598088 ?auto_598089 ?auto_598090 ?auto_598092 ?auto_598091 ?auto_598093 ?auto_598094 ?auto_598095 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598166 - SURFACE
      ?auto_598167 - SURFACE
      ?auto_598168 - SURFACE
      ?auto_598170 - SURFACE
      ?auto_598169 - SURFACE
      ?auto_598171 - SURFACE
      ?auto_598172 - SURFACE
      ?auto_598173 - SURFACE
    )
    :vars
    (
      ?auto_598174 - HOIST
      ?auto_598178 - PLACE
      ?auto_598176 - PLACE
      ?auto_598175 - HOIST
      ?auto_598177 - SURFACE
      ?auto_598179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598174 ?auto_598178 ) ( SURFACE-AT ?auto_598172 ?auto_598178 ) ( CLEAR ?auto_598172 ) ( IS-CRATE ?auto_598173 ) ( not ( = ?auto_598172 ?auto_598173 ) ) ( AVAILABLE ?auto_598174 ) ( ON ?auto_598172 ?auto_598171 ) ( not ( = ?auto_598171 ?auto_598172 ) ) ( not ( = ?auto_598171 ?auto_598173 ) ) ( not ( = ?auto_598176 ?auto_598178 ) ) ( HOIST-AT ?auto_598175 ?auto_598176 ) ( not ( = ?auto_598174 ?auto_598175 ) ) ( AVAILABLE ?auto_598175 ) ( SURFACE-AT ?auto_598173 ?auto_598176 ) ( ON ?auto_598173 ?auto_598177 ) ( CLEAR ?auto_598173 ) ( not ( = ?auto_598172 ?auto_598177 ) ) ( not ( = ?auto_598173 ?auto_598177 ) ) ( not ( = ?auto_598171 ?auto_598177 ) ) ( TRUCK-AT ?auto_598179 ?auto_598178 ) ( ON ?auto_598167 ?auto_598166 ) ( ON ?auto_598168 ?auto_598167 ) ( ON ?auto_598170 ?auto_598168 ) ( ON ?auto_598169 ?auto_598170 ) ( ON ?auto_598171 ?auto_598169 ) ( not ( = ?auto_598166 ?auto_598167 ) ) ( not ( = ?auto_598166 ?auto_598168 ) ) ( not ( = ?auto_598166 ?auto_598170 ) ) ( not ( = ?auto_598166 ?auto_598169 ) ) ( not ( = ?auto_598166 ?auto_598171 ) ) ( not ( = ?auto_598166 ?auto_598172 ) ) ( not ( = ?auto_598166 ?auto_598173 ) ) ( not ( = ?auto_598166 ?auto_598177 ) ) ( not ( = ?auto_598167 ?auto_598168 ) ) ( not ( = ?auto_598167 ?auto_598170 ) ) ( not ( = ?auto_598167 ?auto_598169 ) ) ( not ( = ?auto_598167 ?auto_598171 ) ) ( not ( = ?auto_598167 ?auto_598172 ) ) ( not ( = ?auto_598167 ?auto_598173 ) ) ( not ( = ?auto_598167 ?auto_598177 ) ) ( not ( = ?auto_598168 ?auto_598170 ) ) ( not ( = ?auto_598168 ?auto_598169 ) ) ( not ( = ?auto_598168 ?auto_598171 ) ) ( not ( = ?auto_598168 ?auto_598172 ) ) ( not ( = ?auto_598168 ?auto_598173 ) ) ( not ( = ?auto_598168 ?auto_598177 ) ) ( not ( = ?auto_598170 ?auto_598169 ) ) ( not ( = ?auto_598170 ?auto_598171 ) ) ( not ( = ?auto_598170 ?auto_598172 ) ) ( not ( = ?auto_598170 ?auto_598173 ) ) ( not ( = ?auto_598170 ?auto_598177 ) ) ( not ( = ?auto_598169 ?auto_598171 ) ) ( not ( = ?auto_598169 ?auto_598172 ) ) ( not ( = ?auto_598169 ?auto_598173 ) ) ( not ( = ?auto_598169 ?auto_598177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598171 ?auto_598172 ?auto_598173 )
      ( MAKE-7CRATE-VERIFY ?auto_598166 ?auto_598167 ?auto_598168 ?auto_598170 ?auto_598169 ?auto_598171 ?auto_598172 ?auto_598173 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598244 - SURFACE
      ?auto_598245 - SURFACE
      ?auto_598246 - SURFACE
      ?auto_598248 - SURFACE
      ?auto_598247 - SURFACE
      ?auto_598249 - SURFACE
      ?auto_598250 - SURFACE
      ?auto_598251 - SURFACE
    )
    :vars
    (
      ?auto_598255 - HOIST
      ?auto_598257 - PLACE
      ?auto_598252 - PLACE
      ?auto_598254 - HOIST
      ?auto_598253 - SURFACE
      ?auto_598256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598255 ?auto_598257 ) ( IS-CRATE ?auto_598251 ) ( not ( = ?auto_598250 ?auto_598251 ) ) ( not ( = ?auto_598249 ?auto_598250 ) ) ( not ( = ?auto_598249 ?auto_598251 ) ) ( not ( = ?auto_598252 ?auto_598257 ) ) ( HOIST-AT ?auto_598254 ?auto_598252 ) ( not ( = ?auto_598255 ?auto_598254 ) ) ( AVAILABLE ?auto_598254 ) ( SURFACE-AT ?auto_598251 ?auto_598252 ) ( ON ?auto_598251 ?auto_598253 ) ( CLEAR ?auto_598251 ) ( not ( = ?auto_598250 ?auto_598253 ) ) ( not ( = ?auto_598251 ?auto_598253 ) ) ( not ( = ?auto_598249 ?auto_598253 ) ) ( TRUCK-AT ?auto_598256 ?auto_598257 ) ( SURFACE-AT ?auto_598249 ?auto_598257 ) ( CLEAR ?auto_598249 ) ( LIFTING ?auto_598255 ?auto_598250 ) ( IS-CRATE ?auto_598250 ) ( ON ?auto_598245 ?auto_598244 ) ( ON ?auto_598246 ?auto_598245 ) ( ON ?auto_598248 ?auto_598246 ) ( ON ?auto_598247 ?auto_598248 ) ( ON ?auto_598249 ?auto_598247 ) ( not ( = ?auto_598244 ?auto_598245 ) ) ( not ( = ?auto_598244 ?auto_598246 ) ) ( not ( = ?auto_598244 ?auto_598248 ) ) ( not ( = ?auto_598244 ?auto_598247 ) ) ( not ( = ?auto_598244 ?auto_598249 ) ) ( not ( = ?auto_598244 ?auto_598250 ) ) ( not ( = ?auto_598244 ?auto_598251 ) ) ( not ( = ?auto_598244 ?auto_598253 ) ) ( not ( = ?auto_598245 ?auto_598246 ) ) ( not ( = ?auto_598245 ?auto_598248 ) ) ( not ( = ?auto_598245 ?auto_598247 ) ) ( not ( = ?auto_598245 ?auto_598249 ) ) ( not ( = ?auto_598245 ?auto_598250 ) ) ( not ( = ?auto_598245 ?auto_598251 ) ) ( not ( = ?auto_598245 ?auto_598253 ) ) ( not ( = ?auto_598246 ?auto_598248 ) ) ( not ( = ?auto_598246 ?auto_598247 ) ) ( not ( = ?auto_598246 ?auto_598249 ) ) ( not ( = ?auto_598246 ?auto_598250 ) ) ( not ( = ?auto_598246 ?auto_598251 ) ) ( not ( = ?auto_598246 ?auto_598253 ) ) ( not ( = ?auto_598248 ?auto_598247 ) ) ( not ( = ?auto_598248 ?auto_598249 ) ) ( not ( = ?auto_598248 ?auto_598250 ) ) ( not ( = ?auto_598248 ?auto_598251 ) ) ( not ( = ?auto_598248 ?auto_598253 ) ) ( not ( = ?auto_598247 ?auto_598249 ) ) ( not ( = ?auto_598247 ?auto_598250 ) ) ( not ( = ?auto_598247 ?auto_598251 ) ) ( not ( = ?auto_598247 ?auto_598253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598249 ?auto_598250 ?auto_598251 )
      ( MAKE-7CRATE-VERIFY ?auto_598244 ?auto_598245 ?auto_598246 ?auto_598248 ?auto_598247 ?auto_598249 ?auto_598250 ?auto_598251 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598322 - SURFACE
      ?auto_598323 - SURFACE
      ?auto_598324 - SURFACE
      ?auto_598326 - SURFACE
      ?auto_598325 - SURFACE
      ?auto_598327 - SURFACE
      ?auto_598328 - SURFACE
      ?auto_598329 - SURFACE
    )
    :vars
    (
      ?auto_598335 - HOIST
      ?auto_598333 - PLACE
      ?auto_598330 - PLACE
      ?auto_598331 - HOIST
      ?auto_598332 - SURFACE
      ?auto_598334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598335 ?auto_598333 ) ( IS-CRATE ?auto_598329 ) ( not ( = ?auto_598328 ?auto_598329 ) ) ( not ( = ?auto_598327 ?auto_598328 ) ) ( not ( = ?auto_598327 ?auto_598329 ) ) ( not ( = ?auto_598330 ?auto_598333 ) ) ( HOIST-AT ?auto_598331 ?auto_598330 ) ( not ( = ?auto_598335 ?auto_598331 ) ) ( AVAILABLE ?auto_598331 ) ( SURFACE-AT ?auto_598329 ?auto_598330 ) ( ON ?auto_598329 ?auto_598332 ) ( CLEAR ?auto_598329 ) ( not ( = ?auto_598328 ?auto_598332 ) ) ( not ( = ?auto_598329 ?auto_598332 ) ) ( not ( = ?auto_598327 ?auto_598332 ) ) ( TRUCK-AT ?auto_598334 ?auto_598333 ) ( SURFACE-AT ?auto_598327 ?auto_598333 ) ( CLEAR ?auto_598327 ) ( IS-CRATE ?auto_598328 ) ( AVAILABLE ?auto_598335 ) ( IN ?auto_598328 ?auto_598334 ) ( ON ?auto_598323 ?auto_598322 ) ( ON ?auto_598324 ?auto_598323 ) ( ON ?auto_598326 ?auto_598324 ) ( ON ?auto_598325 ?auto_598326 ) ( ON ?auto_598327 ?auto_598325 ) ( not ( = ?auto_598322 ?auto_598323 ) ) ( not ( = ?auto_598322 ?auto_598324 ) ) ( not ( = ?auto_598322 ?auto_598326 ) ) ( not ( = ?auto_598322 ?auto_598325 ) ) ( not ( = ?auto_598322 ?auto_598327 ) ) ( not ( = ?auto_598322 ?auto_598328 ) ) ( not ( = ?auto_598322 ?auto_598329 ) ) ( not ( = ?auto_598322 ?auto_598332 ) ) ( not ( = ?auto_598323 ?auto_598324 ) ) ( not ( = ?auto_598323 ?auto_598326 ) ) ( not ( = ?auto_598323 ?auto_598325 ) ) ( not ( = ?auto_598323 ?auto_598327 ) ) ( not ( = ?auto_598323 ?auto_598328 ) ) ( not ( = ?auto_598323 ?auto_598329 ) ) ( not ( = ?auto_598323 ?auto_598332 ) ) ( not ( = ?auto_598324 ?auto_598326 ) ) ( not ( = ?auto_598324 ?auto_598325 ) ) ( not ( = ?auto_598324 ?auto_598327 ) ) ( not ( = ?auto_598324 ?auto_598328 ) ) ( not ( = ?auto_598324 ?auto_598329 ) ) ( not ( = ?auto_598324 ?auto_598332 ) ) ( not ( = ?auto_598326 ?auto_598325 ) ) ( not ( = ?auto_598326 ?auto_598327 ) ) ( not ( = ?auto_598326 ?auto_598328 ) ) ( not ( = ?auto_598326 ?auto_598329 ) ) ( not ( = ?auto_598326 ?auto_598332 ) ) ( not ( = ?auto_598325 ?auto_598327 ) ) ( not ( = ?auto_598325 ?auto_598328 ) ) ( not ( = ?auto_598325 ?auto_598329 ) ) ( not ( = ?auto_598325 ?auto_598332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598327 ?auto_598328 ?auto_598329 )
      ( MAKE-7CRATE-VERIFY ?auto_598322 ?auto_598323 ?auto_598324 ?auto_598326 ?auto_598325 ?auto_598327 ?auto_598328 ?auto_598329 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601241 - SURFACE
      ?auto_601242 - SURFACE
      ?auto_601243 - SURFACE
      ?auto_601245 - SURFACE
      ?auto_601244 - SURFACE
      ?auto_601246 - SURFACE
      ?auto_601247 - SURFACE
      ?auto_601248 - SURFACE
      ?auto_601249 - SURFACE
    )
    :vars
    (
      ?auto_601251 - HOIST
      ?auto_601250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601251 ?auto_601250 ) ( SURFACE-AT ?auto_601248 ?auto_601250 ) ( CLEAR ?auto_601248 ) ( LIFTING ?auto_601251 ?auto_601249 ) ( IS-CRATE ?auto_601249 ) ( not ( = ?auto_601248 ?auto_601249 ) ) ( ON ?auto_601242 ?auto_601241 ) ( ON ?auto_601243 ?auto_601242 ) ( ON ?auto_601245 ?auto_601243 ) ( ON ?auto_601244 ?auto_601245 ) ( ON ?auto_601246 ?auto_601244 ) ( ON ?auto_601247 ?auto_601246 ) ( ON ?auto_601248 ?auto_601247 ) ( not ( = ?auto_601241 ?auto_601242 ) ) ( not ( = ?auto_601241 ?auto_601243 ) ) ( not ( = ?auto_601241 ?auto_601245 ) ) ( not ( = ?auto_601241 ?auto_601244 ) ) ( not ( = ?auto_601241 ?auto_601246 ) ) ( not ( = ?auto_601241 ?auto_601247 ) ) ( not ( = ?auto_601241 ?auto_601248 ) ) ( not ( = ?auto_601241 ?auto_601249 ) ) ( not ( = ?auto_601242 ?auto_601243 ) ) ( not ( = ?auto_601242 ?auto_601245 ) ) ( not ( = ?auto_601242 ?auto_601244 ) ) ( not ( = ?auto_601242 ?auto_601246 ) ) ( not ( = ?auto_601242 ?auto_601247 ) ) ( not ( = ?auto_601242 ?auto_601248 ) ) ( not ( = ?auto_601242 ?auto_601249 ) ) ( not ( = ?auto_601243 ?auto_601245 ) ) ( not ( = ?auto_601243 ?auto_601244 ) ) ( not ( = ?auto_601243 ?auto_601246 ) ) ( not ( = ?auto_601243 ?auto_601247 ) ) ( not ( = ?auto_601243 ?auto_601248 ) ) ( not ( = ?auto_601243 ?auto_601249 ) ) ( not ( = ?auto_601245 ?auto_601244 ) ) ( not ( = ?auto_601245 ?auto_601246 ) ) ( not ( = ?auto_601245 ?auto_601247 ) ) ( not ( = ?auto_601245 ?auto_601248 ) ) ( not ( = ?auto_601245 ?auto_601249 ) ) ( not ( = ?auto_601244 ?auto_601246 ) ) ( not ( = ?auto_601244 ?auto_601247 ) ) ( not ( = ?auto_601244 ?auto_601248 ) ) ( not ( = ?auto_601244 ?auto_601249 ) ) ( not ( = ?auto_601246 ?auto_601247 ) ) ( not ( = ?auto_601246 ?auto_601248 ) ) ( not ( = ?auto_601246 ?auto_601249 ) ) ( not ( = ?auto_601247 ?auto_601248 ) ) ( not ( = ?auto_601247 ?auto_601249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_601248 ?auto_601249 )
      ( MAKE-8CRATE-VERIFY ?auto_601241 ?auto_601242 ?auto_601243 ?auto_601245 ?auto_601244 ?auto_601246 ?auto_601247 ?auto_601248 ?auto_601249 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601308 - SURFACE
      ?auto_601309 - SURFACE
      ?auto_601310 - SURFACE
      ?auto_601312 - SURFACE
      ?auto_601311 - SURFACE
      ?auto_601313 - SURFACE
      ?auto_601314 - SURFACE
      ?auto_601315 - SURFACE
      ?auto_601316 - SURFACE
    )
    :vars
    (
      ?auto_601319 - HOIST
      ?auto_601317 - PLACE
      ?auto_601318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_601319 ?auto_601317 ) ( SURFACE-AT ?auto_601315 ?auto_601317 ) ( CLEAR ?auto_601315 ) ( IS-CRATE ?auto_601316 ) ( not ( = ?auto_601315 ?auto_601316 ) ) ( TRUCK-AT ?auto_601318 ?auto_601317 ) ( AVAILABLE ?auto_601319 ) ( IN ?auto_601316 ?auto_601318 ) ( ON ?auto_601315 ?auto_601314 ) ( not ( = ?auto_601314 ?auto_601315 ) ) ( not ( = ?auto_601314 ?auto_601316 ) ) ( ON ?auto_601309 ?auto_601308 ) ( ON ?auto_601310 ?auto_601309 ) ( ON ?auto_601312 ?auto_601310 ) ( ON ?auto_601311 ?auto_601312 ) ( ON ?auto_601313 ?auto_601311 ) ( ON ?auto_601314 ?auto_601313 ) ( not ( = ?auto_601308 ?auto_601309 ) ) ( not ( = ?auto_601308 ?auto_601310 ) ) ( not ( = ?auto_601308 ?auto_601312 ) ) ( not ( = ?auto_601308 ?auto_601311 ) ) ( not ( = ?auto_601308 ?auto_601313 ) ) ( not ( = ?auto_601308 ?auto_601314 ) ) ( not ( = ?auto_601308 ?auto_601315 ) ) ( not ( = ?auto_601308 ?auto_601316 ) ) ( not ( = ?auto_601309 ?auto_601310 ) ) ( not ( = ?auto_601309 ?auto_601312 ) ) ( not ( = ?auto_601309 ?auto_601311 ) ) ( not ( = ?auto_601309 ?auto_601313 ) ) ( not ( = ?auto_601309 ?auto_601314 ) ) ( not ( = ?auto_601309 ?auto_601315 ) ) ( not ( = ?auto_601309 ?auto_601316 ) ) ( not ( = ?auto_601310 ?auto_601312 ) ) ( not ( = ?auto_601310 ?auto_601311 ) ) ( not ( = ?auto_601310 ?auto_601313 ) ) ( not ( = ?auto_601310 ?auto_601314 ) ) ( not ( = ?auto_601310 ?auto_601315 ) ) ( not ( = ?auto_601310 ?auto_601316 ) ) ( not ( = ?auto_601312 ?auto_601311 ) ) ( not ( = ?auto_601312 ?auto_601313 ) ) ( not ( = ?auto_601312 ?auto_601314 ) ) ( not ( = ?auto_601312 ?auto_601315 ) ) ( not ( = ?auto_601312 ?auto_601316 ) ) ( not ( = ?auto_601311 ?auto_601313 ) ) ( not ( = ?auto_601311 ?auto_601314 ) ) ( not ( = ?auto_601311 ?auto_601315 ) ) ( not ( = ?auto_601311 ?auto_601316 ) ) ( not ( = ?auto_601313 ?auto_601314 ) ) ( not ( = ?auto_601313 ?auto_601315 ) ) ( not ( = ?auto_601313 ?auto_601316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601314 ?auto_601315 ?auto_601316 )
      ( MAKE-8CRATE-VERIFY ?auto_601308 ?auto_601309 ?auto_601310 ?auto_601312 ?auto_601311 ?auto_601313 ?auto_601314 ?auto_601315 ?auto_601316 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601384 - SURFACE
      ?auto_601385 - SURFACE
      ?auto_601386 - SURFACE
      ?auto_601388 - SURFACE
      ?auto_601387 - SURFACE
      ?auto_601389 - SURFACE
      ?auto_601390 - SURFACE
      ?auto_601391 - SURFACE
      ?auto_601392 - SURFACE
    )
    :vars
    (
      ?auto_601394 - HOIST
      ?auto_601393 - PLACE
      ?auto_601395 - TRUCK
      ?auto_601396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601394 ?auto_601393 ) ( SURFACE-AT ?auto_601391 ?auto_601393 ) ( CLEAR ?auto_601391 ) ( IS-CRATE ?auto_601392 ) ( not ( = ?auto_601391 ?auto_601392 ) ) ( AVAILABLE ?auto_601394 ) ( IN ?auto_601392 ?auto_601395 ) ( ON ?auto_601391 ?auto_601390 ) ( not ( = ?auto_601390 ?auto_601391 ) ) ( not ( = ?auto_601390 ?auto_601392 ) ) ( TRUCK-AT ?auto_601395 ?auto_601396 ) ( not ( = ?auto_601396 ?auto_601393 ) ) ( ON ?auto_601385 ?auto_601384 ) ( ON ?auto_601386 ?auto_601385 ) ( ON ?auto_601388 ?auto_601386 ) ( ON ?auto_601387 ?auto_601388 ) ( ON ?auto_601389 ?auto_601387 ) ( ON ?auto_601390 ?auto_601389 ) ( not ( = ?auto_601384 ?auto_601385 ) ) ( not ( = ?auto_601384 ?auto_601386 ) ) ( not ( = ?auto_601384 ?auto_601388 ) ) ( not ( = ?auto_601384 ?auto_601387 ) ) ( not ( = ?auto_601384 ?auto_601389 ) ) ( not ( = ?auto_601384 ?auto_601390 ) ) ( not ( = ?auto_601384 ?auto_601391 ) ) ( not ( = ?auto_601384 ?auto_601392 ) ) ( not ( = ?auto_601385 ?auto_601386 ) ) ( not ( = ?auto_601385 ?auto_601388 ) ) ( not ( = ?auto_601385 ?auto_601387 ) ) ( not ( = ?auto_601385 ?auto_601389 ) ) ( not ( = ?auto_601385 ?auto_601390 ) ) ( not ( = ?auto_601385 ?auto_601391 ) ) ( not ( = ?auto_601385 ?auto_601392 ) ) ( not ( = ?auto_601386 ?auto_601388 ) ) ( not ( = ?auto_601386 ?auto_601387 ) ) ( not ( = ?auto_601386 ?auto_601389 ) ) ( not ( = ?auto_601386 ?auto_601390 ) ) ( not ( = ?auto_601386 ?auto_601391 ) ) ( not ( = ?auto_601386 ?auto_601392 ) ) ( not ( = ?auto_601388 ?auto_601387 ) ) ( not ( = ?auto_601388 ?auto_601389 ) ) ( not ( = ?auto_601388 ?auto_601390 ) ) ( not ( = ?auto_601388 ?auto_601391 ) ) ( not ( = ?auto_601388 ?auto_601392 ) ) ( not ( = ?auto_601387 ?auto_601389 ) ) ( not ( = ?auto_601387 ?auto_601390 ) ) ( not ( = ?auto_601387 ?auto_601391 ) ) ( not ( = ?auto_601387 ?auto_601392 ) ) ( not ( = ?auto_601389 ?auto_601390 ) ) ( not ( = ?auto_601389 ?auto_601391 ) ) ( not ( = ?auto_601389 ?auto_601392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601390 ?auto_601391 ?auto_601392 )
      ( MAKE-8CRATE-VERIFY ?auto_601384 ?auto_601385 ?auto_601386 ?auto_601388 ?auto_601387 ?auto_601389 ?auto_601390 ?auto_601391 ?auto_601392 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601468 - SURFACE
      ?auto_601469 - SURFACE
      ?auto_601470 - SURFACE
      ?auto_601472 - SURFACE
      ?auto_601471 - SURFACE
      ?auto_601473 - SURFACE
      ?auto_601474 - SURFACE
      ?auto_601475 - SURFACE
      ?auto_601476 - SURFACE
    )
    :vars
    (
      ?auto_601479 - HOIST
      ?auto_601477 - PLACE
      ?auto_601481 - TRUCK
      ?auto_601480 - PLACE
      ?auto_601478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_601479 ?auto_601477 ) ( SURFACE-AT ?auto_601475 ?auto_601477 ) ( CLEAR ?auto_601475 ) ( IS-CRATE ?auto_601476 ) ( not ( = ?auto_601475 ?auto_601476 ) ) ( AVAILABLE ?auto_601479 ) ( ON ?auto_601475 ?auto_601474 ) ( not ( = ?auto_601474 ?auto_601475 ) ) ( not ( = ?auto_601474 ?auto_601476 ) ) ( TRUCK-AT ?auto_601481 ?auto_601480 ) ( not ( = ?auto_601480 ?auto_601477 ) ) ( HOIST-AT ?auto_601478 ?auto_601480 ) ( LIFTING ?auto_601478 ?auto_601476 ) ( not ( = ?auto_601479 ?auto_601478 ) ) ( ON ?auto_601469 ?auto_601468 ) ( ON ?auto_601470 ?auto_601469 ) ( ON ?auto_601472 ?auto_601470 ) ( ON ?auto_601471 ?auto_601472 ) ( ON ?auto_601473 ?auto_601471 ) ( ON ?auto_601474 ?auto_601473 ) ( not ( = ?auto_601468 ?auto_601469 ) ) ( not ( = ?auto_601468 ?auto_601470 ) ) ( not ( = ?auto_601468 ?auto_601472 ) ) ( not ( = ?auto_601468 ?auto_601471 ) ) ( not ( = ?auto_601468 ?auto_601473 ) ) ( not ( = ?auto_601468 ?auto_601474 ) ) ( not ( = ?auto_601468 ?auto_601475 ) ) ( not ( = ?auto_601468 ?auto_601476 ) ) ( not ( = ?auto_601469 ?auto_601470 ) ) ( not ( = ?auto_601469 ?auto_601472 ) ) ( not ( = ?auto_601469 ?auto_601471 ) ) ( not ( = ?auto_601469 ?auto_601473 ) ) ( not ( = ?auto_601469 ?auto_601474 ) ) ( not ( = ?auto_601469 ?auto_601475 ) ) ( not ( = ?auto_601469 ?auto_601476 ) ) ( not ( = ?auto_601470 ?auto_601472 ) ) ( not ( = ?auto_601470 ?auto_601471 ) ) ( not ( = ?auto_601470 ?auto_601473 ) ) ( not ( = ?auto_601470 ?auto_601474 ) ) ( not ( = ?auto_601470 ?auto_601475 ) ) ( not ( = ?auto_601470 ?auto_601476 ) ) ( not ( = ?auto_601472 ?auto_601471 ) ) ( not ( = ?auto_601472 ?auto_601473 ) ) ( not ( = ?auto_601472 ?auto_601474 ) ) ( not ( = ?auto_601472 ?auto_601475 ) ) ( not ( = ?auto_601472 ?auto_601476 ) ) ( not ( = ?auto_601471 ?auto_601473 ) ) ( not ( = ?auto_601471 ?auto_601474 ) ) ( not ( = ?auto_601471 ?auto_601475 ) ) ( not ( = ?auto_601471 ?auto_601476 ) ) ( not ( = ?auto_601473 ?auto_601474 ) ) ( not ( = ?auto_601473 ?auto_601475 ) ) ( not ( = ?auto_601473 ?auto_601476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601474 ?auto_601475 ?auto_601476 )
      ( MAKE-8CRATE-VERIFY ?auto_601468 ?auto_601469 ?auto_601470 ?auto_601472 ?auto_601471 ?auto_601473 ?auto_601474 ?auto_601475 ?auto_601476 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601560 - SURFACE
      ?auto_601561 - SURFACE
      ?auto_601562 - SURFACE
      ?auto_601564 - SURFACE
      ?auto_601563 - SURFACE
      ?auto_601565 - SURFACE
      ?auto_601566 - SURFACE
      ?auto_601567 - SURFACE
      ?auto_601568 - SURFACE
    )
    :vars
    (
      ?auto_601574 - HOIST
      ?auto_601569 - PLACE
      ?auto_601570 - TRUCK
      ?auto_601571 - PLACE
      ?auto_601572 - HOIST
      ?auto_601573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601574 ?auto_601569 ) ( SURFACE-AT ?auto_601567 ?auto_601569 ) ( CLEAR ?auto_601567 ) ( IS-CRATE ?auto_601568 ) ( not ( = ?auto_601567 ?auto_601568 ) ) ( AVAILABLE ?auto_601574 ) ( ON ?auto_601567 ?auto_601566 ) ( not ( = ?auto_601566 ?auto_601567 ) ) ( not ( = ?auto_601566 ?auto_601568 ) ) ( TRUCK-AT ?auto_601570 ?auto_601571 ) ( not ( = ?auto_601571 ?auto_601569 ) ) ( HOIST-AT ?auto_601572 ?auto_601571 ) ( not ( = ?auto_601574 ?auto_601572 ) ) ( AVAILABLE ?auto_601572 ) ( SURFACE-AT ?auto_601568 ?auto_601571 ) ( ON ?auto_601568 ?auto_601573 ) ( CLEAR ?auto_601568 ) ( not ( = ?auto_601567 ?auto_601573 ) ) ( not ( = ?auto_601568 ?auto_601573 ) ) ( not ( = ?auto_601566 ?auto_601573 ) ) ( ON ?auto_601561 ?auto_601560 ) ( ON ?auto_601562 ?auto_601561 ) ( ON ?auto_601564 ?auto_601562 ) ( ON ?auto_601563 ?auto_601564 ) ( ON ?auto_601565 ?auto_601563 ) ( ON ?auto_601566 ?auto_601565 ) ( not ( = ?auto_601560 ?auto_601561 ) ) ( not ( = ?auto_601560 ?auto_601562 ) ) ( not ( = ?auto_601560 ?auto_601564 ) ) ( not ( = ?auto_601560 ?auto_601563 ) ) ( not ( = ?auto_601560 ?auto_601565 ) ) ( not ( = ?auto_601560 ?auto_601566 ) ) ( not ( = ?auto_601560 ?auto_601567 ) ) ( not ( = ?auto_601560 ?auto_601568 ) ) ( not ( = ?auto_601560 ?auto_601573 ) ) ( not ( = ?auto_601561 ?auto_601562 ) ) ( not ( = ?auto_601561 ?auto_601564 ) ) ( not ( = ?auto_601561 ?auto_601563 ) ) ( not ( = ?auto_601561 ?auto_601565 ) ) ( not ( = ?auto_601561 ?auto_601566 ) ) ( not ( = ?auto_601561 ?auto_601567 ) ) ( not ( = ?auto_601561 ?auto_601568 ) ) ( not ( = ?auto_601561 ?auto_601573 ) ) ( not ( = ?auto_601562 ?auto_601564 ) ) ( not ( = ?auto_601562 ?auto_601563 ) ) ( not ( = ?auto_601562 ?auto_601565 ) ) ( not ( = ?auto_601562 ?auto_601566 ) ) ( not ( = ?auto_601562 ?auto_601567 ) ) ( not ( = ?auto_601562 ?auto_601568 ) ) ( not ( = ?auto_601562 ?auto_601573 ) ) ( not ( = ?auto_601564 ?auto_601563 ) ) ( not ( = ?auto_601564 ?auto_601565 ) ) ( not ( = ?auto_601564 ?auto_601566 ) ) ( not ( = ?auto_601564 ?auto_601567 ) ) ( not ( = ?auto_601564 ?auto_601568 ) ) ( not ( = ?auto_601564 ?auto_601573 ) ) ( not ( = ?auto_601563 ?auto_601565 ) ) ( not ( = ?auto_601563 ?auto_601566 ) ) ( not ( = ?auto_601563 ?auto_601567 ) ) ( not ( = ?auto_601563 ?auto_601568 ) ) ( not ( = ?auto_601563 ?auto_601573 ) ) ( not ( = ?auto_601565 ?auto_601566 ) ) ( not ( = ?auto_601565 ?auto_601567 ) ) ( not ( = ?auto_601565 ?auto_601568 ) ) ( not ( = ?auto_601565 ?auto_601573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601566 ?auto_601567 ?auto_601568 )
      ( MAKE-8CRATE-VERIFY ?auto_601560 ?auto_601561 ?auto_601562 ?auto_601564 ?auto_601563 ?auto_601565 ?auto_601566 ?auto_601567 ?auto_601568 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601653 - SURFACE
      ?auto_601654 - SURFACE
      ?auto_601655 - SURFACE
      ?auto_601657 - SURFACE
      ?auto_601656 - SURFACE
      ?auto_601658 - SURFACE
      ?auto_601659 - SURFACE
      ?auto_601660 - SURFACE
      ?auto_601661 - SURFACE
    )
    :vars
    (
      ?auto_601666 - HOIST
      ?auto_601664 - PLACE
      ?auto_601662 - PLACE
      ?auto_601667 - HOIST
      ?auto_601663 - SURFACE
      ?auto_601665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_601666 ?auto_601664 ) ( SURFACE-AT ?auto_601660 ?auto_601664 ) ( CLEAR ?auto_601660 ) ( IS-CRATE ?auto_601661 ) ( not ( = ?auto_601660 ?auto_601661 ) ) ( AVAILABLE ?auto_601666 ) ( ON ?auto_601660 ?auto_601659 ) ( not ( = ?auto_601659 ?auto_601660 ) ) ( not ( = ?auto_601659 ?auto_601661 ) ) ( not ( = ?auto_601662 ?auto_601664 ) ) ( HOIST-AT ?auto_601667 ?auto_601662 ) ( not ( = ?auto_601666 ?auto_601667 ) ) ( AVAILABLE ?auto_601667 ) ( SURFACE-AT ?auto_601661 ?auto_601662 ) ( ON ?auto_601661 ?auto_601663 ) ( CLEAR ?auto_601661 ) ( not ( = ?auto_601660 ?auto_601663 ) ) ( not ( = ?auto_601661 ?auto_601663 ) ) ( not ( = ?auto_601659 ?auto_601663 ) ) ( TRUCK-AT ?auto_601665 ?auto_601664 ) ( ON ?auto_601654 ?auto_601653 ) ( ON ?auto_601655 ?auto_601654 ) ( ON ?auto_601657 ?auto_601655 ) ( ON ?auto_601656 ?auto_601657 ) ( ON ?auto_601658 ?auto_601656 ) ( ON ?auto_601659 ?auto_601658 ) ( not ( = ?auto_601653 ?auto_601654 ) ) ( not ( = ?auto_601653 ?auto_601655 ) ) ( not ( = ?auto_601653 ?auto_601657 ) ) ( not ( = ?auto_601653 ?auto_601656 ) ) ( not ( = ?auto_601653 ?auto_601658 ) ) ( not ( = ?auto_601653 ?auto_601659 ) ) ( not ( = ?auto_601653 ?auto_601660 ) ) ( not ( = ?auto_601653 ?auto_601661 ) ) ( not ( = ?auto_601653 ?auto_601663 ) ) ( not ( = ?auto_601654 ?auto_601655 ) ) ( not ( = ?auto_601654 ?auto_601657 ) ) ( not ( = ?auto_601654 ?auto_601656 ) ) ( not ( = ?auto_601654 ?auto_601658 ) ) ( not ( = ?auto_601654 ?auto_601659 ) ) ( not ( = ?auto_601654 ?auto_601660 ) ) ( not ( = ?auto_601654 ?auto_601661 ) ) ( not ( = ?auto_601654 ?auto_601663 ) ) ( not ( = ?auto_601655 ?auto_601657 ) ) ( not ( = ?auto_601655 ?auto_601656 ) ) ( not ( = ?auto_601655 ?auto_601658 ) ) ( not ( = ?auto_601655 ?auto_601659 ) ) ( not ( = ?auto_601655 ?auto_601660 ) ) ( not ( = ?auto_601655 ?auto_601661 ) ) ( not ( = ?auto_601655 ?auto_601663 ) ) ( not ( = ?auto_601657 ?auto_601656 ) ) ( not ( = ?auto_601657 ?auto_601658 ) ) ( not ( = ?auto_601657 ?auto_601659 ) ) ( not ( = ?auto_601657 ?auto_601660 ) ) ( not ( = ?auto_601657 ?auto_601661 ) ) ( not ( = ?auto_601657 ?auto_601663 ) ) ( not ( = ?auto_601656 ?auto_601658 ) ) ( not ( = ?auto_601656 ?auto_601659 ) ) ( not ( = ?auto_601656 ?auto_601660 ) ) ( not ( = ?auto_601656 ?auto_601661 ) ) ( not ( = ?auto_601656 ?auto_601663 ) ) ( not ( = ?auto_601658 ?auto_601659 ) ) ( not ( = ?auto_601658 ?auto_601660 ) ) ( not ( = ?auto_601658 ?auto_601661 ) ) ( not ( = ?auto_601658 ?auto_601663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601659 ?auto_601660 ?auto_601661 )
      ( MAKE-8CRATE-VERIFY ?auto_601653 ?auto_601654 ?auto_601655 ?auto_601657 ?auto_601656 ?auto_601658 ?auto_601659 ?auto_601660 ?auto_601661 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601746 - SURFACE
      ?auto_601747 - SURFACE
      ?auto_601748 - SURFACE
      ?auto_601750 - SURFACE
      ?auto_601749 - SURFACE
      ?auto_601751 - SURFACE
      ?auto_601752 - SURFACE
      ?auto_601753 - SURFACE
      ?auto_601754 - SURFACE
    )
    :vars
    (
      ?auto_601756 - HOIST
      ?auto_601760 - PLACE
      ?auto_601755 - PLACE
      ?auto_601758 - HOIST
      ?auto_601757 - SURFACE
      ?auto_601759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_601756 ?auto_601760 ) ( IS-CRATE ?auto_601754 ) ( not ( = ?auto_601753 ?auto_601754 ) ) ( not ( = ?auto_601752 ?auto_601753 ) ) ( not ( = ?auto_601752 ?auto_601754 ) ) ( not ( = ?auto_601755 ?auto_601760 ) ) ( HOIST-AT ?auto_601758 ?auto_601755 ) ( not ( = ?auto_601756 ?auto_601758 ) ) ( AVAILABLE ?auto_601758 ) ( SURFACE-AT ?auto_601754 ?auto_601755 ) ( ON ?auto_601754 ?auto_601757 ) ( CLEAR ?auto_601754 ) ( not ( = ?auto_601753 ?auto_601757 ) ) ( not ( = ?auto_601754 ?auto_601757 ) ) ( not ( = ?auto_601752 ?auto_601757 ) ) ( TRUCK-AT ?auto_601759 ?auto_601760 ) ( SURFACE-AT ?auto_601752 ?auto_601760 ) ( CLEAR ?auto_601752 ) ( LIFTING ?auto_601756 ?auto_601753 ) ( IS-CRATE ?auto_601753 ) ( ON ?auto_601747 ?auto_601746 ) ( ON ?auto_601748 ?auto_601747 ) ( ON ?auto_601750 ?auto_601748 ) ( ON ?auto_601749 ?auto_601750 ) ( ON ?auto_601751 ?auto_601749 ) ( ON ?auto_601752 ?auto_601751 ) ( not ( = ?auto_601746 ?auto_601747 ) ) ( not ( = ?auto_601746 ?auto_601748 ) ) ( not ( = ?auto_601746 ?auto_601750 ) ) ( not ( = ?auto_601746 ?auto_601749 ) ) ( not ( = ?auto_601746 ?auto_601751 ) ) ( not ( = ?auto_601746 ?auto_601752 ) ) ( not ( = ?auto_601746 ?auto_601753 ) ) ( not ( = ?auto_601746 ?auto_601754 ) ) ( not ( = ?auto_601746 ?auto_601757 ) ) ( not ( = ?auto_601747 ?auto_601748 ) ) ( not ( = ?auto_601747 ?auto_601750 ) ) ( not ( = ?auto_601747 ?auto_601749 ) ) ( not ( = ?auto_601747 ?auto_601751 ) ) ( not ( = ?auto_601747 ?auto_601752 ) ) ( not ( = ?auto_601747 ?auto_601753 ) ) ( not ( = ?auto_601747 ?auto_601754 ) ) ( not ( = ?auto_601747 ?auto_601757 ) ) ( not ( = ?auto_601748 ?auto_601750 ) ) ( not ( = ?auto_601748 ?auto_601749 ) ) ( not ( = ?auto_601748 ?auto_601751 ) ) ( not ( = ?auto_601748 ?auto_601752 ) ) ( not ( = ?auto_601748 ?auto_601753 ) ) ( not ( = ?auto_601748 ?auto_601754 ) ) ( not ( = ?auto_601748 ?auto_601757 ) ) ( not ( = ?auto_601750 ?auto_601749 ) ) ( not ( = ?auto_601750 ?auto_601751 ) ) ( not ( = ?auto_601750 ?auto_601752 ) ) ( not ( = ?auto_601750 ?auto_601753 ) ) ( not ( = ?auto_601750 ?auto_601754 ) ) ( not ( = ?auto_601750 ?auto_601757 ) ) ( not ( = ?auto_601749 ?auto_601751 ) ) ( not ( = ?auto_601749 ?auto_601752 ) ) ( not ( = ?auto_601749 ?auto_601753 ) ) ( not ( = ?auto_601749 ?auto_601754 ) ) ( not ( = ?auto_601749 ?auto_601757 ) ) ( not ( = ?auto_601751 ?auto_601752 ) ) ( not ( = ?auto_601751 ?auto_601753 ) ) ( not ( = ?auto_601751 ?auto_601754 ) ) ( not ( = ?auto_601751 ?auto_601757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601752 ?auto_601753 ?auto_601754 )
      ( MAKE-8CRATE-VERIFY ?auto_601746 ?auto_601747 ?auto_601748 ?auto_601750 ?auto_601749 ?auto_601751 ?auto_601752 ?auto_601753 ?auto_601754 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601839 - SURFACE
      ?auto_601840 - SURFACE
      ?auto_601841 - SURFACE
      ?auto_601843 - SURFACE
      ?auto_601842 - SURFACE
      ?auto_601844 - SURFACE
      ?auto_601845 - SURFACE
      ?auto_601846 - SURFACE
      ?auto_601847 - SURFACE
    )
    :vars
    (
      ?auto_601852 - HOIST
      ?auto_601848 - PLACE
      ?auto_601849 - PLACE
      ?auto_601851 - HOIST
      ?auto_601853 - SURFACE
      ?auto_601850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_601852 ?auto_601848 ) ( IS-CRATE ?auto_601847 ) ( not ( = ?auto_601846 ?auto_601847 ) ) ( not ( = ?auto_601845 ?auto_601846 ) ) ( not ( = ?auto_601845 ?auto_601847 ) ) ( not ( = ?auto_601849 ?auto_601848 ) ) ( HOIST-AT ?auto_601851 ?auto_601849 ) ( not ( = ?auto_601852 ?auto_601851 ) ) ( AVAILABLE ?auto_601851 ) ( SURFACE-AT ?auto_601847 ?auto_601849 ) ( ON ?auto_601847 ?auto_601853 ) ( CLEAR ?auto_601847 ) ( not ( = ?auto_601846 ?auto_601853 ) ) ( not ( = ?auto_601847 ?auto_601853 ) ) ( not ( = ?auto_601845 ?auto_601853 ) ) ( TRUCK-AT ?auto_601850 ?auto_601848 ) ( SURFACE-AT ?auto_601845 ?auto_601848 ) ( CLEAR ?auto_601845 ) ( IS-CRATE ?auto_601846 ) ( AVAILABLE ?auto_601852 ) ( IN ?auto_601846 ?auto_601850 ) ( ON ?auto_601840 ?auto_601839 ) ( ON ?auto_601841 ?auto_601840 ) ( ON ?auto_601843 ?auto_601841 ) ( ON ?auto_601842 ?auto_601843 ) ( ON ?auto_601844 ?auto_601842 ) ( ON ?auto_601845 ?auto_601844 ) ( not ( = ?auto_601839 ?auto_601840 ) ) ( not ( = ?auto_601839 ?auto_601841 ) ) ( not ( = ?auto_601839 ?auto_601843 ) ) ( not ( = ?auto_601839 ?auto_601842 ) ) ( not ( = ?auto_601839 ?auto_601844 ) ) ( not ( = ?auto_601839 ?auto_601845 ) ) ( not ( = ?auto_601839 ?auto_601846 ) ) ( not ( = ?auto_601839 ?auto_601847 ) ) ( not ( = ?auto_601839 ?auto_601853 ) ) ( not ( = ?auto_601840 ?auto_601841 ) ) ( not ( = ?auto_601840 ?auto_601843 ) ) ( not ( = ?auto_601840 ?auto_601842 ) ) ( not ( = ?auto_601840 ?auto_601844 ) ) ( not ( = ?auto_601840 ?auto_601845 ) ) ( not ( = ?auto_601840 ?auto_601846 ) ) ( not ( = ?auto_601840 ?auto_601847 ) ) ( not ( = ?auto_601840 ?auto_601853 ) ) ( not ( = ?auto_601841 ?auto_601843 ) ) ( not ( = ?auto_601841 ?auto_601842 ) ) ( not ( = ?auto_601841 ?auto_601844 ) ) ( not ( = ?auto_601841 ?auto_601845 ) ) ( not ( = ?auto_601841 ?auto_601846 ) ) ( not ( = ?auto_601841 ?auto_601847 ) ) ( not ( = ?auto_601841 ?auto_601853 ) ) ( not ( = ?auto_601843 ?auto_601842 ) ) ( not ( = ?auto_601843 ?auto_601844 ) ) ( not ( = ?auto_601843 ?auto_601845 ) ) ( not ( = ?auto_601843 ?auto_601846 ) ) ( not ( = ?auto_601843 ?auto_601847 ) ) ( not ( = ?auto_601843 ?auto_601853 ) ) ( not ( = ?auto_601842 ?auto_601844 ) ) ( not ( = ?auto_601842 ?auto_601845 ) ) ( not ( = ?auto_601842 ?auto_601846 ) ) ( not ( = ?auto_601842 ?auto_601847 ) ) ( not ( = ?auto_601842 ?auto_601853 ) ) ( not ( = ?auto_601844 ?auto_601845 ) ) ( not ( = ?auto_601844 ?auto_601846 ) ) ( not ( = ?auto_601844 ?auto_601847 ) ) ( not ( = ?auto_601844 ?auto_601853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601845 ?auto_601846 ?auto_601847 )
      ( MAKE-8CRATE-VERIFY ?auto_601839 ?auto_601840 ?auto_601841 ?auto_601843 ?auto_601842 ?auto_601844 ?auto_601845 ?auto_601846 ?auto_601847 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_605955 - SURFACE
      ?auto_605956 - SURFACE
      ?auto_605957 - SURFACE
      ?auto_605959 - SURFACE
      ?auto_605958 - SURFACE
      ?auto_605960 - SURFACE
      ?auto_605961 - SURFACE
      ?auto_605962 - SURFACE
      ?auto_605963 - SURFACE
      ?auto_605964 - SURFACE
    )
    :vars
    (
      ?auto_605965 - HOIST
      ?auto_605966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_605965 ?auto_605966 ) ( SURFACE-AT ?auto_605963 ?auto_605966 ) ( CLEAR ?auto_605963 ) ( LIFTING ?auto_605965 ?auto_605964 ) ( IS-CRATE ?auto_605964 ) ( not ( = ?auto_605963 ?auto_605964 ) ) ( ON ?auto_605956 ?auto_605955 ) ( ON ?auto_605957 ?auto_605956 ) ( ON ?auto_605959 ?auto_605957 ) ( ON ?auto_605958 ?auto_605959 ) ( ON ?auto_605960 ?auto_605958 ) ( ON ?auto_605961 ?auto_605960 ) ( ON ?auto_605962 ?auto_605961 ) ( ON ?auto_605963 ?auto_605962 ) ( not ( = ?auto_605955 ?auto_605956 ) ) ( not ( = ?auto_605955 ?auto_605957 ) ) ( not ( = ?auto_605955 ?auto_605959 ) ) ( not ( = ?auto_605955 ?auto_605958 ) ) ( not ( = ?auto_605955 ?auto_605960 ) ) ( not ( = ?auto_605955 ?auto_605961 ) ) ( not ( = ?auto_605955 ?auto_605962 ) ) ( not ( = ?auto_605955 ?auto_605963 ) ) ( not ( = ?auto_605955 ?auto_605964 ) ) ( not ( = ?auto_605956 ?auto_605957 ) ) ( not ( = ?auto_605956 ?auto_605959 ) ) ( not ( = ?auto_605956 ?auto_605958 ) ) ( not ( = ?auto_605956 ?auto_605960 ) ) ( not ( = ?auto_605956 ?auto_605961 ) ) ( not ( = ?auto_605956 ?auto_605962 ) ) ( not ( = ?auto_605956 ?auto_605963 ) ) ( not ( = ?auto_605956 ?auto_605964 ) ) ( not ( = ?auto_605957 ?auto_605959 ) ) ( not ( = ?auto_605957 ?auto_605958 ) ) ( not ( = ?auto_605957 ?auto_605960 ) ) ( not ( = ?auto_605957 ?auto_605961 ) ) ( not ( = ?auto_605957 ?auto_605962 ) ) ( not ( = ?auto_605957 ?auto_605963 ) ) ( not ( = ?auto_605957 ?auto_605964 ) ) ( not ( = ?auto_605959 ?auto_605958 ) ) ( not ( = ?auto_605959 ?auto_605960 ) ) ( not ( = ?auto_605959 ?auto_605961 ) ) ( not ( = ?auto_605959 ?auto_605962 ) ) ( not ( = ?auto_605959 ?auto_605963 ) ) ( not ( = ?auto_605959 ?auto_605964 ) ) ( not ( = ?auto_605958 ?auto_605960 ) ) ( not ( = ?auto_605958 ?auto_605961 ) ) ( not ( = ?auto_605958 ?auto_605962 ) ) ( not ( = ?auto_605958 ?auto_605963 ) ) ( not ( = ?auto_605958 ?auto_605964 ) ) ( not ( = ?auto_605960 ?auto_605961 ) ) ( not ( = ?auto_605960 ?auto_605962 ) ) ( not ( = ?auto_605960 ?auto_605963 ) ) ( not ( = ?auto_605960 ?auto_605964 ) ) ( not ( = ?auto_605961 ?auto_605962 ) ) ( not ( = ?auto_605961 ?auto_605963 ) ) ( not ( = ?auto_605961 ?auto_605964 ) ) ( not ( = ?auto_605962 ?auto_605963 ) ) ( not ( = ?auto_605962 ?auto_605964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_605963 ?auto_605964 )
      ( MAKE-9CRATE-VERIFY ?auto_605955 ?auto_605956 ?auto_605957 ?auto_605959 ?auto_605958 ?auto_605960 ?auto_605961 ?auto_605962 ?auto_605963 ?auto_605964 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606035 - SURFACE
      ?auto_606036 - SURFACE
      ?auto_606037 - SURFACE
      ?auto_606039 - SURFACE
      ?auto_606038 - SURFACE
      ?auto_606040 - SURFACE
      ?auto_606041 - SURFACE
      ?auto_606042 - SURFACE
      ?auto_606043 - SURFACE
      ?auto_606044 - SURFACE
    )
    :vars
    (
      ?auto_606045 - HOIST
      ?auto_606047 - PLACE
      ?auto_606046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606045 ?auto_606047 ) ( SURFACE-AT ?auto_606043 ?auto_606047 ) ( CLEAR ?auto_606043 ) ( IS-CRATE ?auto_606044 ) ( not ( = ?auto_606043 ?auto_606044 ) ) ( TRUCK-AT ?auto_606046 ?auto_606047 ) ( AVAILABLE ?auto_606045 ) ( IN ?auto_606044 ?auto_606046 ) ( ON ?auto_606043 ?auto_606042 ) ( not ( = ?auto_606042 ?auto_606043 ) ) ( not ( = ?auto_606042 ?auto_606044 ) ) ( ON ?auto_606036 ?auto_606035 ) ( ON ?auto_606037 ?auto_606036 ) ( ON ?auto_606039 ?auto_606037 ) ( ON ?auto_606038 ?auto_606039 ) ( ON ?auto_606040 ?auto_606038 ) ( ON ?auto_606041 ?auto_606040 ) ( ON ?auto_606042 ?auto_606041 ) ( not ( = ?auto_606035 ?auto_606036 ) ) ( not ( = ?auto_606035 ?auto_606037 ) ) ( not ( = ?auto_606035 ?auto_606039 ) ) ( not ( = ?auto_606035 ?auto_606038 ) ) ( not ( = ?auto_606035 ?auto_606040 ) ) ( not ( = ?auto_606035 ?auto_606041 ) ) ( not ( = ?auto_606035 ?auto_606042 ) ) ( not ( = ?auto_606035 ?auto_606043 ) ) ( not ( = ?auto_606035 ?auto_606044 ) ) ( not ( = ?auto_606036 ?auto_606037 ) ) ( not ( = ?auto_606036 ?auto_606039 ) ) ( not ( = ?auto_606036 ?auto_606038 ) ) ( not ( = ?auto_606036 ?auto_606040 ) ) ( not ( = ?auto_606036 ?auto_606041 ) ) ( not ( = ?auto_606036 ?auto_606042 ) ) ( not ( = ?auto_606036 ?auto_606043 ) ) ( not ( = ?auto_606036 ?auto_606044 ) ) ( not ( = ?auto_606037 ?auto_606039 ) ) ( not ( = ?auto_606037 ?auto_606038 ) ) ( not ( = ?auto_606037 ?auto_606040 ) ) ( not ( = ?auto_606037 ?auto_606041 ) ) ( not ( = ?auto_606037 ?auto_606042 ) ) ( not ( = ?auto_606037 ?auto_606043 ) ) ( not ( = ?auto_606037 ?auto_606044 ) ) ( not ( = ?auto_606039 ?auto_606038 ) ) ( not ( = ?auto_606039 ?auto_606040 ) ) ( not ( = ?auto_606039 ?auto_606041 ) ) ( not ( = ?auto_606039 ?auto_606042 ) ) ( not ( = ?auto_606039 ?auto_606043 ) ) ( not ( = ?auto_606039 ?auto_606044 ) ) ( not ( = ?auto_606038 ?auto_606040 ) ) ( not ( = ?auto_606038 ?auto_606041 ) ) ( not ( = ?auto_606038 ?auto_606042 ) ) ( not ( = ?auto_606038 ?auto_606043 ) ) ( not ( = ?auto_606038 ?auto_606044 ) ) ( not ( = ?auto_606040 ?auto_606041 ) ) ( not ( = ?auto_606040 ?auto_606042 ) ) ( not ( = ?auto_606040 ?auto_606043 ) ) ( not ( = ?auto_606040 ?auto_606044 ) ) ( not ( = ?auto_606041 ?auto_606042 ) ) ( not ( = ?auto_606041 ?auto_606043 ) ) ( not ( = ?auto_606041 ?auto_606044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606042 ?auto_606043 ?auto_606044 )
      ( MAKE-9CRATE-VERIFY ?auto_606035 ?auto_606036 ?auto_606037 ?auto_606039 ?auto_606038 ?auto_606040 ?auto_606041 ?auto_606042 ?auto_606043 ?auto_606044 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606125 - SURFACE
      ?auto_606126 - SURFACE
      ?auto_606127 - SURFACE
      ?auto_606129 - SURFACE
      ?auto_606128 - SURFACE
      ?auto_606130 - SURFACE
      ?auto_606131 - SURFACE
      ?auto_606132 - SURFACE
      ?auto_606133 - SURFACE
      ?auto_606134 - SURFACE
    )
    :vars
    (
      ?auto_606138 - HOIST
      ?auto_606135 - PLACE
      ?auto_606137 - TRUCK
      ?auto_606136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606138 ?auto_606135 ) ( SURFACE-AT ?auto_606133 ?auto_606135 ) ( CLEAR ?auto_606133 ) ( IS-CRATE ?auto_606134 ) ( not ( = ?auto_606133 ?auto_606134 ) ) ( AVAILABLE ?auto_606138 ) ( IN ?auto_606134 ?auto_606137 ) ( ON ?auto_606133 ?auto_606132 ) ( not ( = ?auto_606132 ?auto_606133 ) ) ( not ( = ?auto_606132 ?auto_606134 ) ) ( TRUCK-AT ?auto_606137 ?auto_606136 ) ( not ( = ?auto_606136 ?auto_606135 ) ) ( ON ?auto_606126 ?auto_606125 ) ( ON ?auto_606127 ?auto_606126 ) ( ON ?auto_606129 ?auto_606127 ) ( ON ?auto_606128 ?auto_606129 ) ( ON ?auto_606130 ?auto_606128 ) ( ON ?auto_606131 ?auto_606130 ) ( ON ?auto_606132 ?auto_606131 ) ( not ( = ?auto_606125 ?auto_606126 ) ) ( not ( = ?auto_606125 ?auto_606127 ) ) ( not ( = ?auto_606125 ?auto_606129 ) ) ( not ( = ?auto_606125 ?auto_606128 ) ) ( not ( = ?auto_606125 ?auto_606130 ) ) ( not ( = ?auto_606125 ?auto_606131 ) ) ( not ( = ?auto_606125 ?auto_606132 ) ) ( not ( = ?auto_606125 ?auto_606133 ) ) ( not ( = ?auto_606125 ?auto_606134 ) ) ( not ( = ?auto_606126 ?auto_606127 ) ) ( not ( = ?auto_606126 ?auto_606129 ) ) ( not ( = ?auto_606126 ?auto_606128 ) ) ( not ( = ?auto_606126 ?auto_606130 ) ) ( not ( = ?auto_606126 ?auto_606131 ) ) ( not ( = ?auto_606126 ?auto_606132 ) ) ( not ( = ?auto_606126 ?auto_606133 ) ) ( not ( = ?auto_606126 ?auto_606134 ) ) ( not ( = ?auto_606127 ?auto_606129 ) ) ( not ( = ?auto_606127 ?auto_606128 ) ) ( not ( = ?auto_606127 ?auto_606130 ) ) ( not ( = ?auto_606127 ?auto_606131 ) ) ( not ( = ?auto_606127 ?auto_606132 ) ) ( not ( = ?auto_606127 ?auto_606133 ) ) ( not ( = ?auto_606127 ?auto_606134 ) ) ( not ( = ?auto_606129 ?auto_606128 ) ) ( not ( = ?auto_606129 ?auto_606130 ) ) ( not ( = ?auto_606129 ?auto_606131 ) ) ( not ( = ?auto_606129 ?auto_606132 ) ) ( not ( = ?auto_606129 ?auto_606133 ) ) ( not ( = ?auto_606129 ?auto_606134 ) ) ( not ( = ?auto_606128 ?auto_606130 ) ) ( not ( = ?auto_606128 ?auto_606131 ) ) ( not ( = ?auto_606128 ?auto_606132 ) ) ( not ( = ?auto_606128 ?auto_606133 ) ) ( not ( = ?auto_606128 ?auto_606134 ) ) ( not ( = ?auto_606130 ?auto_606131 ) ) ( not ( = ?auto_606130 ?auto_606132 ) ) ( not ( = ?auto_606130 ?auto_606133 ) ) ( not ( = ?auto_606130 ?auto_606134 ) ) ( not ( = ?auto_606131 ?auto_606132 ) ) ( not ( = ?auto_606131 ?auto_606133 ) ) ( not ( = ?auto_606131 ?auto_606134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606132 ?auto_606133 ?auto_606134 )
      ( MAKE-9CRATE-VERIFY ?auto_606125 ?auto_606126 ?auto_606127 ?auto_606129 ?auto_606128 ?auto_606130 ?auto_606131 ?auto_606132 ?auto_606133 ?auto_606134 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606224 - SURFACE
      ?auto_606225 - SURFACE
      ?auto_606226 - SURFACE
      ?auto_606228 - SURFACE
      ?auto_606227 - SURFACE
      ?auto_606229 - SURFACE
      ?auto_606230 - SURFACE
      ?auto_606231 - SURFACE
      ?auto_606232 - SURFACE
      ?auto_606233 - SURFACE
    )
    :vars
    (
      ?auto_606236 - HOIST
      ?auto_606235 - PLACE
      ?auto_606237 - TRUCK
      ?auto_606234 - PLACE
      ?auto_606238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_606236 ?auto_606235 ) ( SURFACE-AT ?auto_606232 ?auto_606235 ) ( CLEAR ?auto_606232 ) ( IS-CRATE ?auto_606233 ) ( not ( = ?auto_606232 ?auto_606233 ) ) ( AVAILABLE ?auto_606236 ) ( ON ?auto_606232 ?auto_606231 ) ( not ( = ?auto_606231 ?auto_606232 ) ) ( not ( = ?auto_606231 ?auto_606233 ) ) ( TRUCK-AT ?auto_606237 ?auto_606234 ) ( not ( = ?auto_606234 ?auto_606235 ) ) ( HOIST-AT ?auto_606238 ?auto_606234 ) ( LIFTING ?auto_606238 ?auto_606233 ) ( not ( = ?auto_606236 ?auto_606238 ) ) ( ON ?auto_606225 ?auto_606224 ) ( ON ?auto_606226 ?auto_606225 ) ( ON ?auto_606228 ?auto_606226 ) ( ON ?auto_606227 ?auto_606228 ) ( ON ?auto_606229 ?auto_606227 ) ( ON ?auto_606230 ?auto_606229 ) ( ON ?auto_606231 ?auto_606230 ) ( not ( = ?auto_606224 ?auto_606225 ) ) ( not ( = ?auto_606224 ?auto_606226 ) ) ( not ( = ?auto_606224 ?auto_606228 ) ) ( not ( = ?auto_606224 ?auto_606227 ) ) ( not ( = ?auto_606224 ?auto_606229 ) ) ( not ( = ?auto_606224 ?auto_606230 ) ) ( not ( = ?auto_606224 ?auto_606231 ) ) ( not ( = ?auto_606224 ?auto_606232 ) ) ( not ( = ?auto_606224 ?auto_606233 ) ) ( not ( = ?auto_606225 ?auto_606226 ) ) ( not ( = ?auto_606225 ?auto_606228 ) ) ( not ( = ?auto_606225 ?auto_606227 ) ) ( not ( = ?auto_606225 ?auto_606229 ) ) ( not ( = ?auto_606225 ?auto_606230 ) ) ( not ( = ?auto_606225 ?auto_606231 ) ) ( not ( = ?auto_606225 ?auto_606232 ) ) ( not ( = ?auto_606225 ?auto_606233 ) ) ( not ( = ?auto_606226 ?auto_606228 ) ) ( not ( = ?auto_606226 ?auto_606227 ) ) ( not ( = ?auto_606226 ?auto_606229 ) ) ( not ( = ?auto_606226 ?auto_606230 ) ) ( not ( = ?auto_606226 ?auto_606231 ) ) ( not ( = ?auto_606226 ?auto_606232 ) ) ( not ( = ?auto_606226 ?auto_606233 ) ) ( not ( = ?auto_606228 ?auto_606227 ) ) ( not ( = ?auto_606228 ?auto_606229 ) ) ( not ( = ?auto_606228 ?auto_606230 ) ) ( not ( = ?auto_606228 ?auto_606231 ) ) ( not ( = ?auto_606228 ?auto_606232 ) ) ( not ( = ?auto_606228 ?auto_606233 ) ) ( not ( = ?auto_606227 ?auto_606229 ) ) ( not ( = ?auto_606227 ?auto_606230 ) ) ( not ( = ?auto_606227 ?auto_606231 ) ) ( not ( = ?auto_606227 ?auto_606232 ) ) ( not ( = ?auto_606227 ?auto_606233 ) ) ( not ( = ?auto_606229 ?auto_606230 ) ) ( not ( = ?auto_606229 ?auto_606231 ) ) ( not ( = ?auto_606229 ?auto_606232 ) ) ( not ( = ?auto_606229 ?auto_606233 ) ) ( not ( = ?auto_606230 ?auto_606231 ) ) ( not ( = ?auto_606230 ?auto_606232 ) ) ( not ( = ?auto_606230 ?auto_606233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606231 ?auto_606232 ?auto_606233 )
      ( MAKE-9CRATE-VERIFY ?auto_606224 ?auto_606225 ?auto_606226 ?auto_606228 ?auto_606227 ?auto_606229 ?auto_606230 ?auto_606231 ?auto_606232 ?auto_606233 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606332 - SURFACE
      ?auto_606333 - SURFACE
      ?auto_606334 - SURFACE
      ?auto_606336 - SURFACE
      ?auto_606335 - SURFACE
      ?auto_606337 - SURFACE
      ?auto_606338 - SURFACE
      ?auto_606339 - SURFACE
      ?auto_606340 - SURFACE
      ?auto_606341 - SURFACE
    )
    :vars
    (
      ?auto_606347 - HOIST
      ?auto_606345 - PLACE
      ?auto_606343 - TRUCK
      ?auto_606346 - PLACE
      ?auto_606342 - HOIST
      ?auto_606344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606347 ?auto_606345 ) ( SURFACE-AT ?auto_606340 ?auto_606345 ) ( CLEAR ?auto_606340 ) ( IS-CRATE ?auto_606341 ) ( not ( = ?auto_606340 ?auto_606341 ) ) ( AVAILABLE ?auto_606347 ) ( ON ?auto_606340 ?auto_606339 ) ( not ( = ?auto_606339 ?auto_606340 ) ) ( not ( = ?auto_606339 ?auto_606341 ) ) ( TRUCK-AT ?auto_606343 ?auto_606346 ) ( not ( = ?auto_606346 ?auto_606345 ) ) ( HOIST-AT ?auto_606342 ?auto_606346 ) ( not ( = ?auto_606347 ?auto_606342 ) ) ( AVAILABLE ?auto_606342 ) ( SURFACE-AT ?auto_606341 ?auto_606346 ) ( ON ?auto_606341 ?auto_606344 ) ( CLEAR ?auto_606341 ) ( not ( = ?auto_606340 ?auto_606344 ) ) ( not ( = ?auto_606341 ?auto_606344 ) ) ( not ( = ?auto_606339 ?auto_606344 ) ) ( ON ?auto_606333 ?auto_606332 ) ( ON ?auto_606334 ?auto_606333 ) ( ON ?auto_606336 ?auto_606334 ) ( ON ?auto_606335 ?auto_606336 ) ( ON ?auto_606337 ?auto_606335 ) ( ON ?auto_606338 ?auto_606337 ) ( ON ?auto_606339 ?auto_606338 ) ( not ( = ?auto_606332 ?auto_606333 ) ) ( not ( = ?auto_606332 ?auto_606334 ) ) ( not ( = ?auto_606332 ?auto_606336 ) ) ( not ( = ?auto_606332 ?auto_606335 ) ) ( not ( = ?auto_606332 ?auto_606337 ) ) ( not ( = ?auto_606332 ?auto_606338 ) ) ( not ( = ?auto_606332 ?auto_606339 ) ) ( not ( = ?auto_606332 ?auto_606340 ) ) ( not ( = ?auto_606332 ?auto_606341 ) ) ( not ( = ?auto_606332 ?auto_606344 ) ) ( not ( = ?auto_606333 ?auto_606334 ) ) ( not ( = ?auto_606333 ?auto_606336 ) ) ( not ( = ?auto_606333 ?auto_606335 ) ) ( not ( = ?auto_606333 ?auto_606337 ) ) ( not ( = ?auto_606333 ?auto_606338 ) ) ( not ( = ?auto_606333 ?auto_606339 ) ) ( not ( = ?auto_606333 ?auto_606340 ) ) ( not ( = ?auto_606333 ?auto_606341 ) ) ( not ( = ?auto_606333 ?auto_606344 ) ) ( not ( = ?auto_606334 ?auto_606336 ) ) ( not ( = ?auto_606334 ?auto_606335 ) ) ( not ( = ?auto_606334 ?auto_606337 ) ) ( not ( = ?auto_606334 ?auto_606338 ) ) ( not ( = ?auto_606334 ?auto_606339 ) ) ( not ( = ?auto_606334 ?auto_606340 ) ) ( not ( = ?auto_606334 ?auto_606341 ) ) ( not ( = ?auto_606334 ?auto_606344 ) ) ( not ( = ?auto_606336 ?auto_606335 ) ) ( not ( = ?auto_606336 ?auto_606337 ) ) ( not ( = ?auto_606336 ?auto_606338 ) ) ( not ( = ?auto_606336 ?auto_606339 ) ) ( not ( = ?auto_606336 ?auto_606340 ) ) ( not ( = ?auto_606336 ?auto_606341 ) ) ( not ( = ?auto_606336 ?auto_606344 ) ) ( not ( = ?auto_606335 ?auto_606337 ) ) ( not ( = ?auto_606335 ?auto_606338 ) ) ( not ( = ?auto_606335 ?auto_606339 ) ) ( not ( = ?auto_606335 ?auto_606340 ) ) ( not ( = ?auto_606335 ?auto_606341 ) ) ( not ( = ?auto_606335 ?auto_606344 ) ) ( not ( = ?auto_606337 ?auto_606338 ) ) ( not ( = ?auto_606337 ?auto_606339 ) ) ( not ( = ?auto_606337 ?auto_606340 ) ) ( not ( = ?auto_606337 ?auto_606341 ) ) ( not ( = ?auto_606337 ?auto_606344 ) ) ( not ( = ?auto_606338 ?auto_606339 ) ) ( not ( = ?auto_606338 ?auto_606340 ) ) ( not ( = ?auto_606338 ?auto_606341 ) ) ( not ( = ?auto_606338 ?auto_606344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606339 ?auto_606340 ?auto_606341 )
      ( MAKE-9CRATE-VERIFY ?auto_606332 ?auto_606333 ?auto_606334 ?auto_606336 ?auto_606335 ?auto_606337 ?auto_606338 ?auto_606339 ?auto_606340 ?auto_606341 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606441 - SURFACE
      ?auto_606442 - SURFACE
      ?auto_606443 - SURFACE
      ?auto_606445 - SURFACE
      ?auto_606444 - SURFACE
      ?auto_606446 - SURFACE
      ?auto_606447 - SURFACE
      ?auto_606448 - SURFACE
      ?auto_606449 - SURFACE
      ?auto_606450 - SURFACE
    )
    :vars
    (
      ?auto_606452 - HOIST
      ?auto_606454 - PLACE
      ?auto_606456 - PLACE
      ?auto_606451 - HOIST
      ?auto_606455 - SURFACE
      ?auto_606453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606452 ?auto_606454 ) ( SURFACE-AT ?auto_606449 ?auto_606454 ) ( CLEAR ?auto_606449 ) ( IS-CRATE ?auto_606450 ) ( not ( = ?auto_606449 ?auto_606450 ) ) ( AVAILABLE ?auto_606452 ) ( ON ?auto_606449 ?auto_606448 ) ( not ( = ?auto_606448 ?auto_606449 ) ) ( not ( = ?auto_606448 ?auto_606450 ) ) ( not ( = ?auto_606456 ?auto_606454 ) ) ( HOIST-AT ?auto_606451 ?auto_606456 ) ( not ( = ?auto_606452 ?auto_606451 ) ) ( AVAILABLE ?auto_606451 ) ( SURFACE-AT ?auto_606450 ?auto_606456 ) ( ON ?auto_606450 ?auto_606455 ) ( CLEAR ?auto_606450 ) ( not ( = ?auto_606449 ?auto_606455 ) ) ( not ( = ?auto_606450 ?auto_606455 ) ) ( not ( = ?auto_606448 ?auto_606455 ) ) ( TRUCK-AT ?auto_606453 ?auto_606454 ) ( ON ?auto_606442 ?auto_606441 ) ( ON ?auto_606443 ?auto_606442 ) ( ON ?auto_606445 ?auto_606443 ) ( ON ?auto_606444 ?auto_606445 ) ( ON ?auto_606446 ?auto_606444 ) ( ON ?auto_606447 ?auto_606446 ) ( ON ?auto_606448 ?auto_606447 ) ( not ( = ?auto_606441 ?auto_606442 ) ) ( not ( = ?auto_606441 ?auto_606443 ) ) ( not ( = ?auto_606441 ?auto_606445 ) ) ( not ( = ?auto_606441 ?auto_606444 ) ) ( not ( = ?auto_606441 ?auto_606446 ) ) ( not ( = ?auto_606441 ?auto_606447 ) ) ( not ( = ?auto_606441 ?auto_606448 ) ) ( not ( = ?auto_606441 ?auto_606449 ) ) ( not ( = ?auto_606441 ?auto_606450 ) ) ( not ( = ?auto_606441 ?auto_606455 ) ) ( not ( = ?auto_606442 ?auto_606443 ) ) ( not ( = ?auto_606442 ?auto_606445 ) ) ( not ( = ?auto_606442 ?auto_606444 ) ) ( not ( = ?auto_606442 ?auto_606446 ) ) ( not ( = ?auto_606442 ?auto_606447 ) ) ( not ( = ?auto_606442 ?auto_606448 ) ) ( not ( = ?auto_606442 ?auto_606449 ) ) ( not ( = ?auto_606442 ?auto_606450 ) ) ( not ( = ?auto_606442 ?auto_606455 ) ) ( not ( = ?auto_606443 ?auto_606445 ) ) ( not ( = ?auto_606443 ?auto_606444 ) ) ( not ( = ?auto_606443 ?auto_606446 ) ) ( not ( = ?auto_606443 ?auto_606447 ) ) ( not ( = ?auto_606443 ?auto_606448 ) ) ( not ( = ?auto_606443 ?auto_606449 ) ) ( not ( = ?auto_606443 ?auto_606450 ) ) ( not ( = ?auto_606443 ?auto_606455 ) ) ( not ( = ?auto_606445 ?auto_606444 ) ) ( not ( = ?auto_606445 ?auto_606446 ) ) ( not ( = ?auto_606445 ?auto_606447 ) ) ( not ( = ?auto_606445 ?auto_606448 ) ) ( not ( = ?auto_606445 ?auto_606449 ) ) ( not ( = ?auto_606445 ?auto_606450 ) ) ( not ( = ?auto_606445 ?auto_606455 ) ) ( not ( = ?auto_606444 ?auto_606446 ) ) ( not ( = ?auto_606444 ?auto_606447 ) ) ( not ( = ?auto_606444 ?auto_606448 ) ) ( not ( = ?auto_606444 ?auto_606449 ) ) ( not ( = ?auto_606444 ?auto_606450 ) ) ( not ( = ?auto_606444 ?auto_606455 ) ) ( not ( = ?auto_606446 ?auto_606447 ) ) ( not ( = ?auto_606446 ?auto_606448 ) ) ( not ( = ?auto_606446 ?auto_606449 ) ) ( not ( = ?auto_606446 ?auto_606450 ) ) ( not ( = ?auto_606446 ?auto_606455 ) ) ( not ( = ?auto_606447 ?auto_606448 ) ) ( not ( = ?auto_606447 ?auto_606449 ) ) ( not ( = ?auto_606447 ?auto_606450 ) ) ( not ( = ?auto_606447 ?auto_606455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606448 ?auto_606449 ?auto_606450 )
      ( MAKE-9CRATE-VERIFY ?auto_606441 ?auto_606442 ?auto_606443 ?auto_606445 ?auto_606444 ?auto_606446 ?auto_606447 ?auto_606448 ?auto_606449 ?auto_606450 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606550 - SURFACE
      ?auto_606551 - SURFACE
      ?auto_606552 - SURFACE
      ?auto_606554 - SURFACE
      ?auto_606553 - SURFACE
      ?auto_606555 - SURFACE
      ?auto_606556 - SURFACE
      ?auto_606557 - SURFACE
      ?auto_606558 - SURFACE
      ?auto_606559 - SURFACE
    )
    :vars
    (
      ?auto_606561 - HOIST
      ?auto_606563 - PLACE
      ?auto_606564 - PLACE
      ?auto_606562 - HOIST
      ?auto_606565 - SURFACE
      ?auto_606560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606561 ?auto_606563 ) ( IS-CRATE ?auto_606559 ) ( not ( = ?auto_606558 ?auto_606559 ) ) ( not ( = ?auto_606557 ?auto_606558 ) ) ( not ( = ?auto_606557 ?auto_606559 ) ) ( not ( = ?auto_606564 ?auto_606563 ) ) ( HOIST-AT ?auto_606562 ?auto_606564 ) ( not ( = ?auto_606561 ?auto_606562 ) ) ( AVAILABLE ?auto_606562 ) ( SURFACE-AT ?auto_606559 ?auto_606564 ) ( ON ?auto_606559 ?auto_606565 ) ( CLEAR ?auto_606559 ) ( not ( = ?auto_606558 ?auto_606565 ) ) ( not ( = ?auto_606559 ?auto_606565 ) ) ( not ( = ?auto_606557 ?auto_606565 ) ) ( TRUCK-AT ?auto_606560 ?auto_606563 ) ( SURFACE-AT ?auto_606557 ?auto_606563 ) ( CLEAR ?auto_606557 ) ( LIFTING ?auto_606561 ?auto_606558 ) ( IS-CRATE ?auto_606558 ) ( ON ?auto_606551 ?auto_606550 ) ( ON ?auto_606552 ?auto_606551 ) ( ON ?auto_606554 ?auto_606552 ) ( ON ?auto_606553 ?auto_606554 ) ( ON ?auto_606555 ?auto_606553 ) ( ON ?auto_606556 ?auto_606555 ) ( ON ?auto_606557 ?auto_606556 ) ( not ( = ?auto_606550 ?auto_606551 ) ) ( not ( = ?auto_606550 ?auto_606552 ) ) ( not ( = ?auto_606550 ?auto_606554 ) ) ( not ( = ?auto_606550 ?auto_606553 ) ) ( not ( = ?auto_606550 ?auto_606555 ) ) ( not ( = ?auto_606550 ?auto_606556 ) ) ( not ( = ?auto_606550 ?auto_606557 ) ) ( not ( = ?auto_606550 ?auto_606558 ) ) ( not ( = ?auto_606550 ?auto_606559 ) ) ( not ( = ?auto_606550 ?auto_606565 ) ) ( not ( = ?auto_606551 ?auto_606552 ) ) ( not ( = ?auto_606551 ?auto_606554 ) ) ( not ( = ?auto_606551 ?auto_606553 ) ) ( not ( = ?auto_606551 ?auto_606555 ) ) ( not ( = ?auto_606551 ?auto_606556 ) ) ( not ( = ?auto_606551 ?auto_606557 ) ) ( not ( = ?auto_606551 ?auto_606558 ) ) ( not ( = ?auto_606551 ?auto_606559 ) ) ( not ( = ?auto_606551 ?auto_606565 ) ) ( not ( = ?auto_606552 ?auto_606554 ) ) ( not ( = ?auto_606552 ?auto_606553 ) ) ( not ( = ?auto_606552 ?auto_606555 ) ) ( not ( = ?auto_606552 ?auto_606556 ) ) ( not ( = ?auto_606552 ?auto_606557 ) ) ( not ( = ?auto_606552 ?auto_606558 ) ) ( not ( = ?auto_606552 ?auto_606559 ) ) ( not ( = ?auto_606552 ?auto_606565 ) ) ( not ( = ?auto_606554 ?auto_606553 ) ) ( not ( = ?auto_606554 ?auto_606555 ) ) ( not ( = ?auto_606554 ?auto_606556 ) ) ( not ( = ?auto_606554 ?auto_606557 ) ) ( not ( = ?auto_606554 ?auto_606558 ) ) ( not ( = ?auto_606554 ?auto_606559 ) ) ( not ( = ?auto_606554 ?auto_606565 ) ) ( not ( = ?auto_606553 ?auto_606555 ) ) ( not ( = ?auto_606553 ?auto_606556 ) ) ( not ( = ?auto_606553 ?auto_606557 ) ) ( not ( = ?auto_606553 ?auto_606558 ) ) ( not ( = ?auto_606553 ?auto_606559 ) ) ( not ( = ?auto_606553 ?auto_606565 ) ) ( not ( = ?auto_606555 ?auto_606556 ) ) ( not ( = ?auto_606555 ?auto_606557 ) ) ( not ( = ?auto_606555 ?auto_606558 ) ) ( not ( = ?auto_606555 ?auto_606559 ) ) ( not ( = ?auto_606555 ?auto_606565 ) ) ( not ( = ?auto_606556 ?auto_606557 ) ) ( not ( = ?auto_606556 ?auto_606558 ) ) ( not ( = ?auto_606556 ?auto_606559 ) ) ( not ( = ?auto_606556 ?auto_606565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606557 ?auto_606558 ?auto_606559 )
      ( MAKE-9CRATE-VERIFY ?auto_606550 ?auto_606551 ?auto_606552 ?auto_606554 ?auto_606553 ?auto_606555 ?auto_606556 ?auto_606557 ?auto_606558 ?auto_606559 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606659 - SURFACE
      ?auto_606660 - SURFACE
      ?auto_606661 - SURFACE
      ?auto_606663 - SURFACE
      ?auto_606662 - SURFACE
      ?auto_606664 - SURFACE
      ?auto_606665 - SURFACE
      ?auto_606666 - SURFACE
      ?auto_606667 - SURFACE
      ?auto_606668 - SURFACE
    )
    :vars
    (
      ?auto_606672 - HOIST
      ?auto_606674 - PLACE
      ?auto_606671 - PLACE
      ?auto_606669 - HOIST
      ?auto_606670 - SURFACE
      ?auto_606673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606672 ?auto_606674 ) ( IS-CRATE ?auto_606668 ) ( not ( = ?auto_606667 ?auto_606668 ) ) ( not ( = ?auto_606666 ?auto_606667 ) ) ( not ( = ?auto_606666 ?auto_606668 ) ) ( not ( = ?auto_606671 ?auto_606674 ) ) ( HOIST-AT ?auto_606669 ?auto_606671 ) ( not ( = ?auto_606672 ?auto_606669 ) ) ( AVAILABLE ?auto_606669 ) ( SURFACE-AT ?auto_606668 ?auto_606671 ) ( ON ?auto_606668 ?auto_606670 ) ( CLEAR ?auto_606668 ) ( not ( = ?auto_606667 ?auto_606670 ) ) ( not ( = ?auto_606668 ?auto_606670 ) ) ( not ( = ?auto_606666 ?auto_606670 ) ) ( TRUCK-AT ?auto_606673 ?auto_606674 ) ( SURFACE-AT ?auto_606666 ?auto_606674 ) ( CLEAR ?auto_606666 ) ( IS-CRATE ?auto_606667 ) ( AVAILABLE ?auto_606672 ) ( IN ?auto_606667 ?auto_606673 ) ( ON ?auto_606660 ?auto_606659 ) ( ON ?auto_606661 ?auto_606660 ) ( ON ?auto_606663 ?auto_606661 ) ( ON ?auto_606662 ?auto_606663 ) ( ON ?auto_606664 ?auto_606662 ) ( ON ?auto_606665 ?auto_606664 ) ( ON ?auto_606666 ?auto_606665 ) ( not ( = ?auto_606659 ?auto_606660 ) ) ( not ( = ?auto_606659 ?auto_606661 ) ) ( not ( = ?auto_606659 ?auto_606663 ) ) ( not ( = ?auto_606659 ?auto_606662 ) ) ( not ( = ?auto_606659 ?auto_606664 ) ) ( not ( = ?auto_606659 ?auto_606665 ) ) ( not ( = ?auto_606659 ?auto_606666 ) ) ( not ( = ?auto_606659 ?auto_606667 ) ) ( not ( = ?auto_606659 ?auto_606668 ) ) ( not ( = ?auto_606659 ?auto_606670 ) ) ( not ( = ?auto_606660 ?auto_606661 ) ) ( not ( = ?auto_606660 ?auto_606663 ) ) ( not ( = ?auto_606660 ?auto_606662 ) ) ( not ( = ?auto_606660 ?auto_606664 ) ) ( not ( = ?auto_606660 ?auto_606665 ) ) ( not ( = ?auto_606660 ?auto_606666 ) ) ( not ( = ?auto_606660 ?auto_606667 ) ) ( not ( = ?auto_606660 ?auto_606668 ) ) ( not ( = ?auto_606660 ?auto_606670 ) ) ( not ( = ?auto_606661 ?auto_606663 ) ) ( not ( = ?auto_606661 ?auto_606662 ) ) ( not ( = ?auto_606661 ?auto_606664 ) ) ( not ( = ?auto_606661 ?auto_606665 ) ) ( not ( = ?auto_606661 ?auto_606666 ) ) ( not ( = ?auto_606661 ?auto_606667 ) ) ( not ( = ?auto_606661 ?auto_606668 ) ) ( not ( = ?auto_606661 ?auto_606670 ) ) ( not ( = ?auto_606663 ?auto_606662 ) ) ( not ( = ?auto_606663 ?auto_606664 ) ) ( not ( = ?auto_606663 ?auto_606665 ) ) ( not ( = ?auto_606663 ?auto_606666 ) ) ( not ( = ?auto_606663 ?auto_606667 ) ) ( not ( = ?auto_606663 ?auto_606668 ) ) ( not ( = ?auto_606663 ?auto_606670 ) ) ( not ( = ?auto_606662 ?auto_606664 ) ) ( not ( = ?auto_606662 ?auto_606665 ) ) ( not ( = ?auto_606662 ?auto_606666 ) ) ( not ( = ?auto_606662 ?auto_606667 ) ) ( not ( = ?auto_606662 ?auto_606668 ) ) ( not ( = ?auto_606662 ?auto_606670 ) ) ( not ( = ?auto_606664 ?auto_606665 ) ) ( not ( = ?auto_606664 ?auto_606666 ) ) ( not ( = ?auto_606664 ?auto_606667 ) ) ( not ( = ?auto_606664 ?auto_606668 ) ) ( not ( = ?auto_606664 ?auto_606670 ) ) ( not ( = ?auto_606665 ?auto_606666 ) ) ( not ( = ?auto_606665 ?auto_606667 ) ) ( not ( = ?auto_606665 ?auto_606668 ) ) ( not ( = ?auto_606665 ?auto_606670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606666 ?auto_606667 ?auto_606668 )
      ( MAKE-9CRATE-VERIFY ?auto_606659 ?auto_606660 ?auto_606661 ?auto_606663 ?auto_606662 ?auto_606664 ?auto_606665 ?auto_606666 ?auto_606667 ?auto_606668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_608893 - SURFACE
      ?auto_608894 - SURFACE
    )
    :vars
    (
      ?auto_608896 - HOIST
      ?auto_608898 - PLACE
      ?auto_608895 - SURFACE
      ?auto_608897 - TRUCK
      ?auto_608899 - PLACE
      ?auto_608901 - HOIST
      ?auto_608900 - SURFACE
      ?auto_608902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_608896 ?auto_608898 ) ( SURFACE-AT ?auto_608893 ?auto_608898 ) ( CLEAR ?auto_608893 ) ( IS-CRATE ?auto_608894 ) ( not ( = ?auto_608893 ?auto_608894 ) ) ( AVAILABLE ?auto_608896 ) ( ON ?auto_608893 ?auto_608895 ) ( not ( = ?auto_608895 ?auto_608893 ) ) ( not ( = ?auto_608895 ?auto_608894 ) ) ( TRUCK-AT ?auto_608897 ?auto_608899 ) ( not ( = ?auto_608899 ?auto_608898 ) ) ( HOIST-AT ?auto_608901 ?auto_608899 ) ( not ( = ?auto_608896 ?auto_608901 ) ) ( SURFACE-AT ?auto_608894 ?auto_608899 ) ( ON ?auto_608894 ?auto_608900 ) ( CLEAR ?auto_608894 ) ( not ( = ?auto_608893 ?auto_608900 ) ) ( not ( = ?auto_608894 ?auto_608900 ) ) ( not ( = ?auto_608895 ?auto_608900 ) ) ( LIFTING ?auto_608901 ?auto_608902 ) ( IS-CRATE ?auto_608902 ) ( not ( = ?auto_608893 ?auto_608902 ) ) ( not ( = ?auto_608894 ?auto_608902 ) ) ( not ( = ?auto_608895 ?auto_608902 ) ) ( not ( = ?auto_608900 ?auto_608902 ) ) )
    :subtasks
    ( ( !LOAD ?auto_608901 ?auto_608902 ?auto_608897 ?auto_608899 )
      ( MAKE-1CRATE ?auto_608893 ?auto_608894 )
      ( MAKE-1CRATE-VERIFY ?auto_608893 ?auto_608894 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612210 - SURFACE
      ?auto_612211 - SURFACE
      ?auto_612212 - SURFACE
      ?auto_612214 - SURFACE
      ?auto_612213 - SURFACE
      ?auto_612215 - SURFACE
      ?auto_612216 - SURFACE
      ?auto_612217 - SURFACE
      ?auto_612218 - SURFACE
      ?auto_612219 - SURFACE
      ?auto_612220 - SURFACE
    )
    :vars
    (
      ?auto_612221 - HOIST
      ?auto_612222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612221 ?auto_612222 ) ( SURFACE-AT ?auto_612219 ?auto_612222 ) ( CLEAR ?auto_612219 ) ( LIFTING ?auto_612221 ?auto_612220 ) ( IS-CRATE ?auto_612220 ) ( not ( = ?auto_612219 ?auto_612220 ) ) ( ON ?auto_612211 ?auto_612210 ) ( ON ?auto_612212 ?auto_612211 ) ( ON ?auto_612214 ?auto_612212 ) ( ON ?auto_612213 ?auto_612214 ) ( ON ?auto_612215 ?auto_612213 ) ( ON ?auto_612216 ?auto_612215 ) ( ON ?auto_612217 ?auto_612216 ) ( ON ?auto_612218 ?auto_612217 ) ( ON ?auto_612219 ?auto_612218 ) ( not ( = ?auto_612210 ?auto_612211 ) ) ( not ( = ?auto_612210 ?auto_612212 ) ) ( not ( = ?auto_612210 ?auto_612214 ) ) ( not ( = ?auto_612210 ?auto_612213 ) ) ( not ( = ?auto_612210 ?auto_612215 ) ) ( not ( = ?auto_612210 ?auto_612216 ) ) ( not ( = ?auto_612210 ?auto_612217 ) ) ( not ( = ?auto_612210 ?auto_612218 ) ) ( not ( = ?auto_612210 ?auto_612219 ) ) ( not ( = ?auto_612210 ?auto_612220 ) ) ( not ( = ?auto_612211 ?auto_612212 ) ) ( not ( = ?auto_612211 ?auto_612214 ) ) ( not ( = ?auto_612211 ?auto_612213 ) ) ( not ( = ?auto_612211 ?auto_612215 ) ) ( not ( = ?auto_612211 ?auto_612216 ) ) ( not ( = ?auto_612211 ?auto_612217 ) ) ( not ( = ?auto_612211 ?auto_612218 ) ) ( not ( = ?auto_612211 ?auto_612219 ) ) ( not ( = ?auto_612211 ?auto_612220 ) ) ( not ( = ?auto_612212 ?auto_612214 ) ) ( not ( = ?auto_612212 ?auto_612213 ) ) ( not ( = ?auto_612212 ?auto_612215 ) ) ( not ( = ?auto_612212 ?auto_612216 ) ) ( not ( = ?auto_612212 ?auto_612217 ) ) ( not ( = ?auto_612212 ?auto_612218 ) ) ( not ( = ?auto_612212 ?auto_612219 ) ) ( not ( = ?auto_612212 ?auto_612220 ) ) ( not ( = ?auto_612214 ?auto_612213 ) ) ( not ( = ?auto_612214 ?auto_612215 ) ) ( not ( = ?auto_612214 ?auto_612216 ) ) ( not ( = ?auto_612214 ?auto_612217 ) ) ( not ( = ?auto_612214 ?auto_612218 ) ) ( not ( = ?auto_612214 ?auto_612219 ) ) ( not ( = ?auto_612214 ?auto_612220 ) ) ( not ( = ?auto_612213 ?auto_612215 ) ) ( not ( = ?auto_612213 ?auto_612216 ) ) ( not ( = ?auto_612213 ?auto_612217 ) ) ( not ( = ?auto_612213 ?auto_612218 ) ) ( not ( = ?auto_612213 ?auto_612219 ) ) ( not ( = ?auto_612213 ?auto_612220 ) ) ( not ( = ?auto_612215 ?auto_612216 ) ) ( not ( = ?auto_612215 ?auto_612217 ) ) ( not ( = ?auto_612215 ?auto_612218 ) ) ( not ( = ?auto_612215 ?auto_612219 ) ) ( not ( = ?auto_612215 ?auto_612220 ) ) ( not ( = ?auto_612216 ?auto_612217 ) ) ( not ( = ?auto_612216 ?auto_612218 ) ) ( not ( = ?auto_612216 ?auto_612219 ) ) ( not ( = ?auto_612216 ?auto_612220 ) ) ( not ( = ?auto_612217 ?auto_612218 ) ) ( not ( = ?auto_612217 ?auto_612219 ) ) ( not ( = ?auto_612217 ?auto_612220 ) ) ( not ( = ?auto_612218 ?auto_612219 ) ) ( not ( = ?auto_612218 ?auto_612220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_612219 ?auto_612220 )
      ( MAKE-10CRATE-VERIFY ?auto_612210 ?auto_612211 ?auto_612212 ?auto_612214 ?auto_612213 ?auto_612215 ?auto_612216 ?auto_612217 ?auto_612218 ?auto_612219 ?auto_612220 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612304 - SURFACE
      ?auto_612305 - SURFACE
      ?auto_612306 - SURFACE
      ?auto_612308 - SURFACE
      ?auto_612307 - SURFACE
      ?auto_612309 - SURFACE
      ?auto_612310 - SURFACE
      ?auto_612311 - SURFACE
      ?auto_612312 - SURFACE
      ?auto_612313 - SURFACE
      ?auto_612314 - SURFACE
    )
    :vars
    (
      ?auto_612316 - HOIST
      ?auto_612317 - PLACE
      ?auto_612315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612316 ?auto_612317 ) ( SURFACE-AT ?auto_612313 ?auto_612317 ) ( CLEAR ?auto_612313 ) ( IS-CRATE ?auto_612314 ) ( not ( = ?auto_612313 ?auto_612314 ) ) ( TRUCK-AT ?auto_612315 ?auto_612317 ) ( AVAILABLE ?auto_612316 ) ( IN ?auto_612314 ?auto_612315 ) ( ON ?auto_612313 ?auto_612312 ) ( not ( = ?auto_612312 ?auto_612313 ) ) ( not ( = ?auto_612312 ?auto_612314 ) ) ( ON ?auto_612305 ?auto_612304 ) ( ON ?auto_612306 ?auto_612305 ) ( ON ?auto_612308 ?auto_612306 ) ( ON ?auto_612307 ?auto_612308 ) ( ON ?auto_612309 ?auto_612307 ) ( ON ?auto_612310 ?auto_612309 ) ( ON ?auto_612311 ?auto_612310 ) ( ON ?auto_612312 ?auto_612311 ) ( not ( = ?auto_612304 ?auto_612305 ) ) ( not ( = ?auto_612304 ?auto_612306 ) ) ( not ( = ?auto_612304 ?auto_612308 ) ) ( not ( = ?auto_612304 ?auto_612307 ) ) ( not ( = ?auto_612304 ?auto_612309 ) ) ( not ( = ?auto_612304 ?auto_612310 ) ) ( not ( = ?auto_612304 ?auto_612311 ) ) ( not ( = ?auto_612304 ?auto_612312 ) ) ( not ( = ?auto_612304 ?auto_612313 ) ) ( not ( = ?auto_612304 ?auto_612314 ) ) ( not ( = ?auto_612305 ?auto_612306 ) ) ( not ( = ?auto_612305 ?auto_612308 ) ) ( not ( = ?auto_612305 ?auto_612307 ) ) ( not ( = ?auto_612305 ?auto_612309 ) ) ( not ( = ?auto_612305 ?auto_612310 ) ) ( not ( = ?auto_612305 ?auto_612311 ) ) ( not ( = ?auto_612305 ?auto_612312 ) ) ( not ( = ?auto_612305 ?auto_612313 ) ) ( not ( = ?auto_612305 ?auto_612314 ) ) ( not ( = ?auto_612306 ?auto_612308 ) ) ( not ( = ?auto_612306 ?auto_612307 ) ) ( not ( = ?auto_612306 ?auto_612309 ) ) ( not ( = ?auto_612306 ?auto_612310 ) ) ( not ( = ?auto_612306 ?auto_612311 ) ) ( not ( = ?auto_612306 ?auto_612312 ) ) ( not ( = ?auto_612306 ?auto_612313 ) ) ( not ( = ?auto_612306 ?auto_612314 ) ) ( not ( = ?auto_612308 ?auto_612307 ) ) ( not ( = ?auto_612308 ?auto_612309 ) ) ( not ( = ?auto_612308 ?auto_612310 ) ) ( not ( = ?auto_612308 ?auto_612311 ) ) ( not ( = ?auto_612308 ?auto_612312 ) ) ( not ( = ?auto_612308 ?auto_612313 ) ) ( not ( = ?auto_612308 ?auto_612314 ) ) ( not ( = ?auto_612307 ?auto_612309 ) ) ( not ( = ?auto_612307 ?auto_612310 ) ) ( not ( = ?auto_612307 ?auto_612311 ) ) ( not ( = ?auto_612307 ?auto_612312 ) ) ( not ( = ?auto_612307 ?auto_612313 ) ) ( not ( = ?auto_612307 ?auto_612314 ) ) ( not ( = ?auto_612309 ?auto_612310 ) ) ( not ( = ?auto_612309 ?auto_612311 ) ) ( not ( = ?auto_612309 ?auto_612312 ) ) ( not ( = ?auto_612309 ?auto_612313 ) ) ( not ( = ?auto_612309 ?auto_612314 ) ) ( not ( = ?auto_612310 ?auto_612311 ) ) ( not ( = ?auto_612310 ?auto_612312 ) ) ( not ( = ?auto_612310 ?auto_612313 ) ) ( not ( = ?auto_612310 ?auto_612314 ) ) ( not ( = ?auto_612311 ?auto_612312 ) ) ( not ( = ?auto_612311 ?auto_612313 ) ) ( not ( = ?auto_612311 ?auto_612314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612312 ?auto_612313 ?auto_612314 )
      ( MAKE-10CRATE-VERIFY ?auto_612304 ?auto_612305 ?auto_612306 ?auto_612308 ?auto_612307 ?auto_612309 ?auto_612310 ?auto_612311 ?auto_612312 ?auto_612313 ?auto_612314 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612409 - SURFACE
      ?auto_612410 - SURFACE
      ?auto_612411 - SURFACE
      ?auto_612413 - SURFACE
      ?auto_612412 - SURFACE
      ?auto_612414 - SURFACE
      ?auto_612415 - SURFACE
      ?auto_612416 - SURFACE
      ?auto_612417 - SURFACE
      ?auto_612418 - SURFACE
      ?auto_612419 - SURFACE
    )
    :vars
    (
      ?auto_612420 - HOIST
      ?auto_612421 - PLACE
      ?auto_612422 - TRUCK
      ?auto_612423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612420 ?auto_612421 ) ( SURFACE-AT ?auto_612418 ?auto_612421 ) ( CLEAR ?auto_612418 ) ( IS-CRATE ?auto_612419 ) ( not ( = ?auto_612418 ?auto_612419 ) ) ( AVAILABLE ?auto_612420 ) ( IN ?auto_612419 ?auto_612422 ) ( ON ?auto_612418 ?auto_612417 ) ( not ( = ?auto_612417 ?auto_612418 ) ) ( not ( = ?auto_612417 ?auto_612419 ) ) ( TRUCK-AT ?auto_612422 ?auto_612423 ) ( not ( = ?auto_612423 ?auto_612421 ) ) ( ON ?auto_612410 ?auto_612409 ) ( ON ?auto_612411 ?auto_612410 ) ( ON ?auto_612413 ?auto_612411 ) ( ON ?auto_612412 ?auto_612413 ) ( ON ?auto_612414 ?auto_612412 ) ( ON ?auto_612415 ?auto_612414 ) ( ON ?auto_612416 ?auto_612415 ) ( ON ?auto_612417 ?auto_612416 ) ( not ( = ?auto_612409 ?auto_612410 ) ) ( not ( = ?auto_612409 ?auto_612411 ) ) ( not ( = ?auto_612409 ?auto_612413 ) ) ( not ( = ?auto_612409 ?auto_612412 ) ) ( not ( = ?auto_612409 ?auto_612414 ) ) ( not ( = ?auto_612409 ?auto_612415 ) ) ( not ( = ?auto_612409 ?auto_612416 ) ) ( not ( = ?auto_612409 ?auto_612417 ) ) ( not ( = ?auto_612409 ?auto_612418 ) ) ( not ( = ?auto_612409 ?auto_612419 ) ) ( not ( = ?auto_612410 ?auto_612411 ) ) ( not ( = ?auto_612410 ?auto_612413 ) ) ( not ( = ?auto_612410 ?auto_612412 ) ) ( not ( = ?auto_612410 ?auto_612414 ) ) ( not ( = ?auto_612410 ?auto_612415 ) ) ( not ( = ?auto_612410 ?auto_612416 ) ) ( not ( = ?auto_612410 ?auto_612417 ) ) ( not ( = ?auto_612410 ?auto_612418 ) ) ( not ( = ?auto_612410 ?auto_612419 ) ) ( not ( = ?auto_612411 ?auto_612413 ) ) ( not ( = ?auto_612411 ?auto_612412 ) ) ( not ( = ?auto_612411 ?auto_612414 ) ) ( not ( = ?auto_612411 ?auto_612415 ) ) ( not ( = ?auto_612411 ?auto_612416 ) ) ( not ( = ?auto_612411 ?auto_612417 ) ) ( not ( = ?auto_612411 ?auto_612418 ) ) ( not ( = ?auto_612411 ?auto_612419 ) ) ( not ( = ?auto_612413 ?auto_612412 ) ) ( not ( = ?auto_612413 ?auto_612414 ) ) ( not ( = ?auto_612413 ?auto_612415 ) ) ( not ( = ?auto_612413 ?auto_612416 ) ) ( not ( = ?auto_612413 ?auto_612417 ) ) ( not ( = ?auto_612413 ?auto_612418 ) ) ( not ( = ?auto_612413 ?auto_612419 ) ) ( not ( = ?auto_612412 ?auto_612414 ) ) ( not ( = ?auto_612412 ?auto_612415 ) ) ( not ( = ?auto_612412 ?auto_612416 ) ) ( not ( = ?auto_612412 ?auto_612417 ) ) ( not ( = ?auto_612412 ?auto_612418 ) ) ( not ( = ?auto_612412 ?auto_612419 ) ) ( not ( = ?auto_612414 ?auto_612415 ) ) ( not ( = ?auto_612414 ?auto_612416 ) ) ( not ( = ?auto_612414 ?auto_612417 ) ) ( not ( = ?auto_612414 ?auto_612418 ) ) ( not ( = ?auto_612414 ?auto_612419 ) ) ( not ( = ?auto_612415 ?auto_612416 ) ) ( not ( = ?auto_612415 ?auto_612417 ) ) ( not ( = ?auto_612415 ?auto_612418 ) ) ( not ( = ?auto_612415 ?auto_612419 ) ) ( not ( = ?auto_612416 ?auto_612417 ) ) ( not ( = ?auto_612416 ?auto_612418 ) ) ( not ( = ?auto_612416 ?auto_612419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612417 ?auto_612418 ?auto_612419 )
      ( MAKE-10CRATE-VERIFY ?auto_612409 ?auto_612410 ?auto_612411 ?auto_612413 ?auto_612412 ?auto_612414 ?auto_612415 ?auto_612416 ?auto_612417 ?auto_612418 ?auto_612419 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612524 - SURFACE
      ?auto_612525 - SURFACE
      ?auto_612526 - SURFACE
      ?auto_612528 - SURFACE
      ?auto_612527 - SURFACE
      ?auto_612529 - SURFACE
      ?auto_612530 - SURFACE
      ?auto_612531 - SURFACE
      ?auto_612532 - SURFACE
      ?auto_612533 - SURFACE
      ?auto_612534 - SURFACE
    )
    :vars
    (
      ?auto_612535 - HOIST
      ?auto_612536 - PLACE
      ?auto_612537 - TRUCK
      ?auto_612538 - PLACE
      ?auto_612539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_612535 ?auto_612536 ) ( SURFACE-AT ?auto_612533 ?auto_612536 ) ( CLEAR ?auto_612533 ) ( IS-CRATE ?auto_612534 ) ( not ( = ?auto_612533 ?auto_612534 ) ) ( AVAILABLE ?auto_612535 ) ( ON ?auto_612533 ?auto_612532 ) ( not ( = ?auto_612532 ?auto_612533 ) ) ( not ( = ?auto_612532 ?auto_612534 ) ) ( TRUCK-AT ?auto_612537 ?auto_612538 ) ( not ( = ?auto_612538 ?auto_612536 ) ) ( HOIST-AT ?auto_612539 ?auto_612538 ) ( LIFTING ?auto_612539 ?auto_612534 ) ( not ( = ?auto_612535 ?auto_612539 ) ) ( ON ?auto_612525 ?auto_612524 ) ( ON ?auto_612526 ?auto_612525 ) ( ON ?auto_612528 ?auto_612526 ) ( ON ?auto_612527 ?auto_612528 ) ( ON ?auto_612529 ?auto_612527 ) ( ON ?auto_612530 ?auto_612529 ) ( ON ?auto_612531 ?auto_612530 ) ( ON ?auto_612532 ?auto_612531 ) ( not ( = ?auto_612524 ?auto_612525 ) ) ( not ( = ?auto_612524 ?auto_612526 ) ) ( not ( = ?auto_612524 ?auto_612528 ) ) ( not ( = ?auto_612524 ?auto_612527 ) ) ( not ( = ?auto_612524 ?auto_612529 ) ) ( not ( = ?auto_612524 ?auto_612530 ) ) ( not ( = ?auto_612524 ?auto_612531 ) ) ( not ( = ?auto_612524 ?auto_612532 ) ) ( not ( = ?auto_612524 ?auto_612533 ) ) ( not ( = ?auto_612524 ?auto_612534 ) ) ( not ( = ?auto_612525 ?auto_612526 ) ) ( not ( = ?auto_612525 ?auto_612528 ) ) ( not ( = ?auto_612525 ?auto_612527 ) ) ( not ( = ?auto_612525 ?auto_612529 ) ) ( not ( = ?auto_612525 ?auto_612530 ) ) ( not ( = ?auto_612525 ?auto_612531 ) ) ( not ( = ?auto_612525 ?auto_612532 ) ) ( not ( = ?auto_612525 ?auto_612533 ) ) ( not ( = ?auto_612525 ?auto_612534 ) ) ( not ( = ?auto_612526 ?auto_612528 ) ) ( not ( = ?auto_612526 ?auto_612527 ) ) ( not ( = ?auto_612526 ?auto_612529 ) ) ( not ( = ?auto_612526 ?auto_612530 ) ) ( not ( = ?auto_612526 ?auto_612531 ) ) ( not ( = ?auto_612526 ?auto_612532 ) ) ( not ( = ?auto_612526 ?auto_612533 ) ) ( not ( = ?auto_612526 ?auto_612534 ) ) ( not ( = ?auto_612528 ?auto_612527 ) ) ( not ( = ?auto_612528 ?auto_612529 ) ) ( not ( = ?auto_612528 ?auto_612530 ) ) ( not ( = ?auto_612528 ?auto_612531 ) ) ( not ( = ?auto_612528 ?auto_612532 ) ) ( not ( = ?auto_612528 ?auto_612533 ) ) ( not ( = ?auto_612528 ?auto_612534 ) ) ( not ( = ?auto_612527 ?auto_612529 ) ) ( not ( = ?auto_612527 ?auto_612530 ) ) ( not ( = ?auto_612527 ?auto_612531 ) ) ( not ( = ?auto_612527 ?auto_612532 ) ) ( not ( = ?auto_612527 ?auto_612533 ) ) ( not ( = ?auto_612527 ?auto_612534 ) ) ( not ( = ?auto_612529 ?auto_612530 ) ) ( not ( = ?auto_612529 ?auto_612531 ) ) ( not ( = ?auto_612529 ?auto_612532 ) ) ( not ( = ?auto_612529 ?auto_612533 ) ) ( not ( = ?auto_612529 ?auto_612534 ) ) ( not ( = ?auto_612530 ?auto_612531 ) ) ( not ( = ?auto_612530 ?auto_612532 ) ) ( not ( = ?auto_612530 ?auto_612533 ) ) ( not ( = ?auto_612530 ?auto_612534 ) ) ( not ( = ?auto_612531 ?auto_612532 ) ) ( not ( = ?auto_612531 ?auto_612533 ) ) ( not ( = ?auto_612531 ?auto_612534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612532 ?auto_612533 ?auto_612534 )
      ( MAKE-10CRATE-VERIFY ?auto_612524 ?auto_612525 ?auto_612526 ?auto_612528 ?auto_612527 ?auto_612529 ?auto_612530 ?auto_612531 ?auto_612532 ?auto_612533 ?auto_612534 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612649 - SURFACE
      ?auto_612650 - SURFACE
      ?auto_612651 - SURFACE
      ?auto_612653 - SURFACE
      ?auto_612652 - SURFACE
      ?auto_612654 - SURFACE
      ?auto_612655 - SURFACE
      ?auto_612656 - SURFACE
      ?auto_612657 - SURFACE
      ?auto_612658 - SURFACE
      ?auto_612659 - SURFACE
    )
    :vars
    (
      ?auto_612664 - HOIST
      ?auto_612665 - PLACE
      ?auto_612661 - TRUCK
      ?auto_612663 - PLACE
      ?auto_612660 - HOIST
      ?auto_612662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612664 ?auto_612665 ) ( SURFACE-AT ?auto_612658 ?auto_612665 ) ( CLEAR ?auto_612658 ) ( IS-CRATE ?auto_612659 ) ( not ( = ?auto_612658 ?auto_612659 ) ) ( AVAILABLE ?auto_612664 ) ( ON ?auto_612658 ?auto_612657 ) ( not ( = ?auto_612657 ?auto_612658 ) ) ( not ( = ?auto_612657 ?auto_612659 ) ) ( TRUCK-AT ?auto_612661 ?auto_612663 ) ( not ( = ?auto_612663 ?auto_612665 ) ) ( HOIST-AT ?auto_612660 ?auto_612663 ) ( not ( = ?auto_612664 ?auto_612660 ) ) ( AVAILABLE ?auto_612660 ) ( SURFACE-AT ?auto_612659 ?auto_612663 ) ( ON ?auto_612659 ?auto_612662 ) ( CLEAR ?auto_612659 ) ( not ( = ?auto_612658 ?auto_612662 ) ) ( not ( = ?auto_612659 ?auto_612662 ) ) ( not ( = ?auto_612657 ?auto_612662 ) ) ( ON ?auto_612650 ?auto_612649 ) ( ON ?auto_612651 ?auto_612650 ) ( ON ?auto_612653 ?auto_612651 ) ( ON ?auto_612652 ?auto_612653 ) ( ON ?auto_612654 ?auto_612652 ) ( ON ?auto_612655 ?auto_612654 ) ( ON ?auto_612656 ?auto_612655 ) ( ON ?auto_612657 ?auto_612656 ) ( not ( = ?auto_612649 ?auto_612650 ) ) ( not ( = ?auto_612649 ?auto_612651 ) ) ( not ( = ?auto_612649 ?auto_612653 ) ) ( not ( = ?auto_612649 ?auto_612652 ) ) ( not ( = ?auto_612649 ?auto_612654 ) ) ( not ( = ?auto_612649 ?auto_612655 ) ) ( not ( = ?auto_612649 ?auto_612656 ) ) ( not ( = ?auto_612649 ?auto_612657 ) ) ( not ( = ?auto_612649 ?auto_612658 ) ) ( not ( = ?auto_612649 ?auto_612659 ) ) ( not ( = ?auto_612649 ?auto_612662 ) ) ( not ( = ?auto_612650 ?auto_612651 ) ) ( not ( = ?auto_612650 ?auto_612653 ) ) ( not ( = ?auto_612650 ?auto_612652 ) ) ( not ( = ?auto_612650 ?auto_612654 ) ) ( not ( = ?auto_612650 ?auto_612655 ) ) ( not ( = ?auto_612650 ?auto_612656 ) ) ( not ( = ?auto_612650 ?auto_612657 ) ) ( not ( = ?auto_612650 ?auto_612658 ) ) ( not ( = ?auto_612650 ?auto_612659 ) ) ( not ( = ?auto_612650 ?auto_612662 ) ) ( not ( = ?auto_612651 ?auto_612653 ) ) ( not ( = ?auto_612651 ?auto_612652 ) ) ( not ( = ?auto_612651 ?auto_612654 ) ) ( not ( = ?auto_612651 ?auto_612655 ) ) ( not ( = ?auto_612651 ?auto_612656 ) ) ( not ( = ?auto_612651 ?auto_612657 ) ) ( not ( = ?auto_612651 ?auto_612658 ) ) ( not ( = ?auto_612651 ?auto_612659 ) ) ( not ( = ?auto_612651 ?auto_612662 ) ) ( not ( = ?auto_612653 ?auto_612652 ) ) ( not ( = ?auto_612653 ?auto_612654 ) ) ( not ( = ?auto_612653 ?auto_612655 ) ) ( not ( = ?auto_612653 ?auto_612656 ) ) ( not ( = ?auto_612653 ?auto_612657 ) ) ( not ( = ?auto_612653 ?auto_612658 ) ) ( not ( = ?auto_612653 ?auto_612659 ) ) ( not ( = ?auto_612653 ?auto_612662 ) ) ( not ( = ?auto_612652 ?auto_612654 ) ) ( not ( = ?auto_612652 ?auto_612655 ) ) ( not ( = ?auto_612652 ?auto_612656 ) ) ( not ( = ?auto_612652 ?auto_612657 ) ) ( not ( = ?auto_612652 ?auto_612658 ) ) ( not ( = ?auto_612652 ?auto_612659 ) ) ( not ( = ?auto_612652 ?auto_612662 ) ) ( not ( = ?auto_612654 ?auto_612655 ) ) ( not ( = ?auto_612654 ?auto_612656 ) ) ( not ( = ?auto_612654 ?auto_612657 ) ) ( not ( = ?auto_612654 ?auto_612658 ) ) ( not ( = ?auto_612654 ?auto_612659 ) ) ( not ( = ?auto_612654 ?auto_612662 ) ) ( not ( = ?auto_612655 ?auto_612656 ) ) ( not ( = ?auto_612655 ?auto_612657 ) ) ( not ( = ?auto_612655 ?auto_612658 ) ) ( not ( = ?auto_612655 ?auto_612659 ) ) ( not ( = ?auto_612655 ?auto_612662 ) ) ( not ( = ?auto_612656 ?auto_612657 ) ) ( not ( = ?auto_612656 ?auto_612658 ) ) ( not ( = ?auto_612656 ?auto_612659 ) ) ( not ( = ?auto_612656 ?auto_612662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612657 ?auto_612658 ?auto_612659 )
      ( MAKE-10CRATE-VERIFY ?auto_612649 ?auto_612650 ?auto_612651 ?auto_612653 ?auto_612652 ?auto_612654 ?auto_612655 ?auto_612656 ?auto_612657 ?auto_612658 ?auto_612659 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612775 - SURFACE
      ?auto_612776 - SURFACE
      ?auto_612777 - SURFACE
      ?auto_612779 - SURFACE
      ?auto_612778 - SURFACE
      ?auto_612780 - SURFACE
      ?auto_612781 - SURFACE
      ?auto_612782 - SURFACE
      ?auto_612783 - SURFACE
      ?auto_612784 - SURFACE
      ?auto_612785 - SURFACE
    )
    :vars
    (
      ?auto_612787 - HOIST
      ?auto_612788 - PLACE
      ?auto_612786 - PLACE
      ?auto_612791 - HOIST
      ?auto_612789 - SURFACE
      ?auto_612790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612787 ?auto_612788 ) ( SURFACE-AT ?auto_612784 ?auto_612788 ) ( CLEAR ?auto_612784 ) ( IS-CRATE ?auto_612785 ) ( not ( = ?auto_612784 ?auto_612785 ) ) ( AVAILABLE ?auto_612787 ) ( ON ?auto_612784 ?auto_612783 ) ( not ( = ?auto_612783 ?auto_612784 ) ) ( not ( = ?auto_612783 ?auto_612785 ) ) ( not ( = ?auto_612786 ?auto_612788 ) ) ( HOIST-AT ?auto_612791 ?auto_612786 ) ( not ( = ?auto_612787 ?auto_612791 ) ) ( AVAILABLE ?auto_612791 ) ( SURFACE-AT ?auto_612785 ?auto_612786 ) ( ON ?auto_612785 ?auto_612789 ) ( CLEAR ?auto_612785 ) ( not ( = ?auto_612784 ?auto_612789 ) ) ( not ( = ?auto_612785 ?auto_612789 ) ) ( not ( = ?auto_612783 ?auto_612789 ) ) ( TRUCK-AT ?auto_612790 ?auto_612788 ) ( ON ?auto_612776 ?auto_612775 ) ( ON ?auto_612777 ?auto_612776 ) ( ON ?auto_612779 ?auto_612777 ) ( ON ?auto_612778 ?auto_612779 ) ( ON ?auto_612780 ?auto_612778 ) ( ON ?auto_612781 ?auto_612780 ) ( ON ?auto_612782 ?auto_612781 ) ( ON ?auto_612783 ?auto_612782 ) ( not ( = ?auto_612775 ?auto_612776 ) ) ( not ( = ?auto_612775 ?auto_612777 ) ) ( not ( = ?auto_612775 ?auto_612779 ) ) ( not ( = ?auto_612775 ?auto_612778 ) ) ( not ( = ?auto_612775 ?auto_612780 ) ) ( not ( = ?auto_612775 ?auto_612781 ) ) ( not ( = ?auto_612775 ?auto_612782 ) ) ( not ( = ?auto_612775 ?auto_612783 ) ) ( not ( = ?auto_612775 ?auto_612784 ) ) ( not ( = ?auto_612775 ?auto_612785 ) ) ( not ( = ?auto_612775 ?auto_612789 ) ) ( not ( = ?auto_612776 ?auto_612777 ) ) ( not ( = ?auto_612776 ?auto_612779 ) ) ( not ( = ?auto_612776 ?auto_612778 ) ) ( not ( = ?auto_612776 ?auto_612780 ) ) ( not ( = ?auto_612776 ?auto_612781 ) ) ( not ( = ?auto_612776 ?auto_612782 ) ) ( not ( = ?auto_612776 ?auto_612783 ) ) ( not ( = ?auto_612776 ?auto_612784 ) ) ( not ( = ?auto_612776 ?auto_612785 ) ) ( not ( = ?auto_612776 ?auto_612789 ) ) ( not ( = ?auto_612777 ?auto_612779 ) ) ( not ( = ?auto_612777 ?auto_612778 ) ) ( not ( = ?auto_612777 ?auto_612780 ) ) ( not ( = ?auto_612777 ?auto_612781 ) ) ( not ( = ?auto_612777 ?auto_612782 ) ) ( not ( = ?auto_612777 ?auto_612783 ) ) ( not ( = ?auto_612777 ?auto_612784 ) ) ( not ( = ?auto_612777 ?auto_612785 ) ) ( not ( = ?auto_612777 ?auto_612789 ) ) ( not ( = ?auto_612779 ?auto_612778 ) ) ( not ( = ?auto_612779 ?auto_612780 ) ) ( not ( = ?auto_612779 ?auto_612781 ) ) ( not ( = ?auto_612779 ?auto_612782 ) ) ( not ( = ?auto_612779 ?auto_612783 ) ) ( not ( = ?auto_612779 ?auto_612784 ) ) ( not ( = ?auto_612779 ?auto_612785 ) ) ( not ( = ?auto_612779 ?auto_612789 ) ) ( not ( = ?auto_612778 ?auto_612780 ) ) ( not ( = ?auto_612778 ?auto_612781 ) ) ( not ( = ?auto_612778 ?auto_612782 ) ) ( not ( = ?auto_612778 ?auto_612783 ) ) ( not ( = ?auto_612778 ?auto_612784 ) ) ( not ( = ?auto_612778 ?auto_612785 ) ) ( not ( = ?auto_612778 ?auto_612789 ) ) ( not ( = ?auto_612780 ?auto_612781 ) ) ( not ( = ?auto_612780 ?auto_612782 ) ) ( not ( = ?auto_612780 ?auto_612783 ) ) ( not ( = ?auto_612780 ?auto_612784 ) ) ( not ( = ?auto_612780 ?auto_612785 ) ) ( not ( = ?auto_612780 ?auto_612789 ) ) ( not ( = ?auto_612781 ?auto_612782 ) ) ( not ( = ?auto_612781 ?auto_612783 ) ) ( not ( = ?auto_612781 ?auto_612784 ) ) ( not ( = ?auto_612781 ?auto_612785 ) ) ( not ( = ?auto_612781 ?auto_612789 ) ) ( not ( = ?auto_612782 ?auto_612783 ) ) ( not ( = ?auto_612782 ?auto_612784 ) ) ( not ( = ?auto_612782 ?auto_612785 ) ) ( not ( = ?auto_612782 ?auto_612789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612783 ?auto_612784 ?auto_612785 )
      ( MAKE-10CRATE-VERIFY ?auto_612775 ?auto_612776 ?auto_612777 ?auto_612779 ?auto_612778 ?auto_612780 ?auto_612781 ?auto_612782 ?auto_612783 ?auto_612784 ?auto_612785 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612901 - SURFACE
      ?auto_612902 - SURFACE
      ?auto_612903 - SURFACE
      ?auto_612905 - SURFACE
      ?auto_612904 - SURFACE
      ?auto_612906 - SURFACE
      ?auto_612907 - SURFACE
      ?auto_612908 - SURFACE
      ?auto_612909 - SURFACE
      ?auto_612910 - SURFACE
      ?auto_612911 - SURFACE
    )
    :vars
    (
      ?auto_612915 - HOIST
      ?auto_612913 - PLACE
      ?auto_612914 - PLACE
      ?auto_612916 - HOIST
      ?auto_612917 - SURFACE
      ?auto_612912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612915 ?auto_612913 ) ( IS-CRATE ?auto_612911 ) ( not ( = ?auto_612910 ?auto_612911 ) ) ( not ( = ?auto_612909 ?auto_612910 ) ) ( not ( = ?auto_612909 ?auto_612911 ) ) ( not ( = ?auto_612914 ?auto_612913 ) ) ( HOIST-AT ?auto_612916 ?auto_612914 ) ( not ( = ?auto_612915 ?auto_612916 ) ) ( AVAILABLE ?auto_612916 ) ( SURFACE-AT ?auto_612911 ?auto_612914 ) ( ON ?auto_612911 ?auto_612917 ) ( CLEAR ?auto_612911 ) ( not ( = ?auto_612910 ?auto_612917 ) ) ( not ( = ?auto_612911 ?auto_612917 ) ) ( not ( = ?auto_612909 ?auto_612917 ) ) ( TRUCK-AT ?auto_612912 ?auto_612913 ) ( SURFACE-AT ?auto_612909 ?auto_612913 ) ( CLEAR ?auto_612909 ) ( LIFTING ?auto_612915 ?auto_612910 ) ( IS-CRATE ?auto_612910 ) ( ON ?auto_612902 ?auto_612901 ) ( ON ?auto_612903 ?auto_612902 ) ( ON ?auto_612905 ?auto_612903 ) ( ON ?auto_612904 ?auto_612905 ) ( ON ?auto_612906 ?auto_612904 ) ( ON ?auto_612907 ?auto_612906 ) ( ON ?auto_612908 ?auto_612907 ) ( ON ?auto_612909 ?auto_612908 ) ( not ( = ?auto_612901 ?auto_612902 ) ) ( not ( = ?auto_612901 ?auto_612903 ) ) ( not ( = ?auto_612901 ?auto_612905 ) ) ( not ( = ?auto_612901 ?auto_612904 ) ) ( not ( = ?auto_612901 ?auto_612906 ) ) ( not ( = ?auto_612901 ?auto_612907 ) ) ( not ( = ?auto_612901 ?auto_612908 ) ) ( not ( = ?auto_612901 ?auto_612909 ) ) ( not ( = ?auto_612901 ?auto_612910 ) ) ( not ( = ?auto_612901 ?auto_612911 ) ) ( not ( = ?auto_612901 ?auto_612917 ) ) ( not ( = ?auto_612902 ?auto_612903 ) ) ( not ( = ?auto_612902 ?auto_612905 ) ) ( not ( = ?auto_612902 ?auto_612904 ) ) ( not ( = ?auto_612902 ?auto_612906 ) ) ( not ( = ?auto_612902 ?auto_612907 ) ) ( not ( = ?auto_612902 ?auto_612908 ) ) ( not ( = ?auto_612902 ?auto_612909 ) ) ( not ( = ?auto_612902 ?auto_612910 ) ) ( not ( = ?auto_612902 ?auto_612911 ) ) ( not ( = ?auto_612902 ?auto_612917 ) ) ( not ( = ?auto_612903 ?auto_612905 ) ) ( not ( = ?auto_612903 ?auto_612904 ) ) ( not ( = ?auto_612903 ?auto_612906 ) ) ( not ( = ?auto_612903 ?auto_612907 ) ) ( not ( = ?auto_612903 ?auto_612908 ) ) ( not ( = ?auto_612903 ?auto_612909 ) ) ( not ( = ?auto_612903 ?auto_612910 ) ) ( not ( = ?auto_612903 ?auto_612911 ) ) ( not ( = ?auto_612903 ?auto_612917 ) ) ( not ( = ?auto_612905 ?auto_612904 ) ) ( not ( = ?auto_612905 ?auto_612906 ) ) ( not ( = ?auto_612905 ?auto_612907 ) ) ( not ( = ?auto_612905 ?auto_612908 ) ) ( not ( = ?auto_612905 ?auto_612909 ) ) ( not ( = ?auto_612905 ?auto_612910 ) ) ( not ( = ?auto_612905 ?auto_612911 ) ) ( not ( = ?auto_612905 ?auto_612917 ) ) ( not ( = ?auto_612904 ?auto_612906 ) ) ( not ( = ?auto_612904 ?auto_612907 ) ) ( not ( = ?auto_612904 ?auto_612908 ) ) ( not ( = ?auto_612904 ?auto_612909 ) ) ( not ( = ?auto_612904 ?auto_612910 ) ) ( not ( = ?auto_612904 ?auto_612911 ) ) ( not ( = ?auto_612904 ?auto_612917 ) ) ( not ( = ?auto_612906 ?auto_612907 ) ) ( not ( = ?auto_612906 ?auto_612908 ) ) ( not ( = ?auto_612906 ?auto_612909 ) ) ( not ( = ?auto_612906 ?auto_612910 ) ) ( not ( = ?auto_612906 ?auto_612911 ) ) ( not ( = ?auto_612906 ?auto_612917 ) ) ( not ( = ?auto_612907 ?auto_612908 ) ) ( not ( = ?auto_612907 ?auto_612909 ) ) ( not ( = ?auto_612907 ?auto_612910 ) ) ( not ( = ?auto_612907 ?auto_612911 ) ) ( not ( = ?auto_612907 ?auto_612917 ) ) ( not ( = ?auto_612908 ?auto_612909 ) ) ( not ( = ?auto_612908 ?auto_612910 ) ) ( not ( = ?auto_612908 ?auto_612911 ) ) ( not ( = ?auto_612908 ?auto_612917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612909 ?auto_612910 ?auto_612911 )
      ( MAKE-10CRATE-VERIFY ?auto_612901 ?auto_612902 ?auto_612903 ?auto_612905 ?auto_612904 ?auto_612906 ?auto_612907 ?auto_612908 ?auto_612909 ?auto_612910 ?auto_612911 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613027 - SURFACE
      ?auto_613028 - SURFACE
      ?auto_613029 - SURFACE
      ?auto_613031 - SURFACE
      ?auto_613030 - SURFACE
      ?auto_613032 - SURFACE
      ?auto_613033 - SURFACE
      ?auto_613034 - SURFACE
      ?auto_613035 - SURFACE
      ?auto_613036 - SURFACE
      ?auto_613037 - SURFACE
    )
    :vars
    (
      ?auto_613042 - HOIST
      ?auto_613038 - PLACE
      ?auto_613039 - PLACE
      ?auto_613040 - HOIST
      ?auto_613041 - SURFACE
      ?auto_613043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613042 ?auto_613038 ) ( IS-CRATE ?auto_613037 ) ( not ( = ?auto_613036 ?auto_613037 ) ) ( not ( = ?auto_613035 ?auto_613036 ) ) ( not ( = ?auto_613035 ?auto_613037 ) ) ( not ( = ?auto_613039 ?auto_613038 ) ) ( HOIST-AT ?auto_613040 ?auto_613039 ) ( not ( = ?auto_613042 ?auto_613040 ) ) ( AVAILABLE ?auto_613040 ) ( SURFACE-AT ?auto_613037 ?auto_613039 ) ( ON ?auto_613037 ?auto_613041 ) ( CLEAR ?auto_613037 ) ( not ( = ?auto_613036 ?auto_613041 ) ) ( not ( = ?auto_613037 ?auto_613041 ) ) ( not ( = ?auto_613035 ?auto_613041 ) ) ( TRUCK-AT ?auto_613043 ?auto_613038 ) ( SURFACE-AT ?auto_613035 ?auto_613038 ) ( CLEAR ?auto_613035 ) ( IS-CRATE ?auto_613036 ) ( AVAILABLE ?auto_613042 ) ( IN ?auto_613036 ?auto_613043 ) ( ON ?auto_613028 ?auto_613027 ) ( ON ?auto_613029 ?auto_613028 ) ( ON ?auto_613031 ?auto_613029 ) ( ON ?auto_613030 ?auto_613031 ) ( ON ?auto_613032 ?auto_613030 ) ( ON ?auto_613033 ?auto_613032 ) ( ON ?auto_613034 ?auto_613033 ) ( ON ?auto_613035 ?auto_613034 ) ( not ( = ?auto_613027 ?auto_613028 ) ) ( not ( = ?auto_613027 ?auto_613029 ) ) ( not ( = ?auto_613027 ?auto_613031 ) ) ( not ( = ?auto_613027 ?auto_613030 ) ) ( not ( = ?auto_613027 ?auto_613032 ) ) ( not ( = ?auto_613027 ?auto_613033 ) ) ( not ( = ?auto_613027 ?auto_613034 ) ) ( not ( = ?auto_613027 ?auto_613035 ) ) ( not ( = ?auto_613027 ?auto_613036 ) ) ( not ( = ?auto_613027 ?auto_613037 ) ) ( not ( = ?auto_613027 ?auto_613041 ) ) ( not ( = ?auto_613028 ?auto_613029 ) ) ( not ( = ?auto_613028 ?auto_613031 ) ) ( not ( = ?auto_613028 ?auto_613030 ) ) ( not ( = ?auto_613028 ?auto_613032 ) ) ( not ( = ?auto_613028 ?auto_613033 ) ) ( not ( = ?auto_613028 ?auto_613034 ) ) ( not ( = ?auto_613028 ?auto_613035 ) ) ( not ( = ?auto_613028 ?auto_613036 ) ) ( not ( = ?auto_613028 ?auto_613037 ) ) ( not ( = ?auto_613028 ?auto_613041 ) ) ( not ( = ?auto_613029 ?auto_613031 ) ) ( not ( = ?auto_613029 ?auto_613030 ) ) ( not ( = ?auto_613029 ?auto_613032 ) ) ( not ( = ?auto_613029 ?auto_613033 ) ) ( not ( = ?auto_613029 ?auto_613034 ) ) ( not ( = ?auto_613029 ?auto_613035 ) ) ( not ( = ?auto_613029 ?auto_613036 ) ) ( not ( = ?auto_613029 ?auto_613037 ) ) ( not ( = ?auto_613029 ?auto_613041 ) ) ( not ( = ?auto_613031 ?auto_613030 ) ) ( not ( = ?auto_613031 ?auto_613032 ) ) ( not ( = ?auto_613031 ?auto_613033 ) ) ( not ( = ?auto_613031 ?auto_613034 ) ) ( not ( = ?auto_613031 ?auto_613035 ) ) ( not ( = ?auto_613031 ?auto_613036 ) ) ( not ( = ?auto_613031 ?auto_613037 ) ) ( not ( = ?auto_613031 ?auto_613041 ) ) ( not ( = ?auto_613030 ?auto_613032 ) ) ( not ( = ?auto_613030 ?auto_613033 ) ) ( not ( = ?auto_613030 ?auto_613034 ) ) ( not ( = ?auto_613030 ?auto_613035 ) ) ( not ( = ?auto_613030 ?auto_613036 ) ) ( not ( = ?auto_613030 ?auto_613037 ) ) ( not ( = ?auto_613030 ?auto_613041 ) ) ( not ( = ?auto_613032 ?auto_613033 ) ) ( not ( = ?auto_613032 ?auto_613034 ) ) ( not ( = ?auto_613032 ?auto_613035 ) ) ( not ( = ?auto_613032 ?auto_613036 ) ) ( not ( = ?auto_613032 ?auto_613037 ) ) ( not ( = ?auto_613032 ?auto_613041 ) ) ( not ( = ?auto_613033 ?auto_613034 ) ) ( not ( = ?auto_613033 ?auto_613035 ) ) ( not ( = ?auto_613033 ?auto_613036 ) ) ( not ( = ?auto_613033 ?auto_613037 ) ) ( not ( = ?auto_613033 ?auto_613041 ) ) ( not ( = ?auto_613034 ?auto_613035 ) ) ( not ( = ?auto_613034 ?auto_613036 ) ) ( not ( = ?auto_613034 ?auto_613037 ) ) ( not ( = ?auto_613034 ?auto_613041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613035 ?auto_613036 ?auto_613037 )
      ( MAKE-10CRATE-VERIFY ?auto_613027 ?auto_613028 ?auto_613029 ?auto_613031 ?auto_613030 ?auto_613032 ?auto_613033 ?auto_613034 ?auto_613035 ?auto_613036 ?auto_613037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_616441 - SURFACE
      ?auto_616442 - SURFACE
    )
    :vars
    (
      ?auto_616447 - HOIST
      ?auto_616449 - PLACE
      ?auto_616443 - SURFACE
      ?auto_616448 - PLACE
      ?auto_616446 - HOIST
      ?auto_616445 - SURFACE
      ?auto_616444 - TRUCK
      ?auto_616450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_616447 ?auto_616449 ) ( SURFACE-AT ?auto_616441 ?auto_616449 ) ( CLEAR ?auto_616441 ) ( IS-CRATE ?auto_616442 ) ( not ( = ?auto_616441 ?auto_616442 ) ) ( ON ?auto_616441 ?auto_616443 ) ( not ( = ?auto_616443 ?auto_616441 ) ) ( not ( = ?auto_616443 ?auto_616442 ) ) ( not ( = ?auto_616448 ?auto_616449 ) ) ( HOIST-AT ?auto_616446 ?auto_616448 ) ( not ( = ?auto_616447 ?auto_616446 ) ) ( AVAILABLE ?auto_616446 ) ( SURFACE-AT ?auto_616442 ?auto_616448 ) ( ON ?auto_616442 ?auto_616445 ) ( CLEAR ?auto_616442 ) ( not ( = ?auto_616441 ?auto_616445 ) ) ( not ( = ?auto_616442 ?auto_616445 ) ) ( not ( = ?auto_616443 ?auto_616445 ) ) ( TRUCK-AT ?auto_616444 ?auto_616449 ) ( LIFTING ?auto_616447 ?auto_616450 ) ( IS-CRATE ?auto_616450 ) ( not ( = ?auto_616441 ?auto_616450 ) ) ( not ( = ?auto_616442 ?auto_616450 ) ) ( not ( = ?auto_616443 ?auto_616450 ) ) ( not ( = ?auto_616445 ?auto_616450 ) ) )
    :subtasks
    ( ( !LOAD ?auto_616447 ?auto_616450 ?auto_616444 ?auto_616449 )
      ( MAKE-1CRATE ?auto_616441 ?auto_616442 )
      ( MAKE-1CRATE-VERIFY ?auto_616441 ?auto_616442 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620273 - SURFACE
      ?auto_620274 - SURFACE
      ?auto_620275 - SURFACE
      ?auto_620277 - SURFACE
      ?auto_620276 - SURFACE
      ?auto_620278 - SURFACE
      ?auto_620279 - SURFACE
      ?auto_620280 - SURFACE
      ?auto_620281 - SURFACE
      ?auto_620282 - SURFACE
      ?auto_620283 - SURFACE
      ?auto_620284 - SURFACE
    )
    :vars
    (
      ?auto_620285 - HOIST
      ?auto_620286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620285 ?auto_620286 ) ( SURFACE-AT ?auto_620283 ?auto_620286 ) ( CLEAR ?auto_620283 ) ( LIFTING ?auto_620285 ?auto_620284 ) ( IS-CRATE ?auto_620284 ) ( not ( = ?auto_620283 ?auto_620284 ) ) ( ON ?auto_620274 ?auto_620273 ) ( ON ?auto_620275 ?auto_620274 ) ( ON ?auto_620277 ?auto_620275 ) ( ON ?auto_620276 ?auto_620277 ) ( ON ?auto_620278 ?auto_620276 ) ( ON ?auto_620279 ?auto_620278 ) ( ON ?auto_620280 ?auto_620279 ) ( ON ?auto_620281 ?auto_620280 ) ( ON ?auto_620282 ?auto_620281 ) ( ON ?auto_620283 ?auto_620282 ) ( not ( = ?auto_620273 ?auto_620274 ) ) ( not ( = ?auto_620273 ?auto_620275 ) ) ( not ( = ?auto_620273 ?auto_620277 ) ) ( not ( = ?auto_620273 ?auto_620276 ) ) ( not ( = ?auto_620273 ?auto_620278 ) ) ( not ( = ?auto_620273 ?auto_620279 ) ) ( not ( = ?auto_620273 ?auto_620280 ) ) ( not ( = ?auto_620273 ?auto_620281 ) ) ( not ( = ?auto_620273 ?auto_620282 ) ) ( not ( = ?auto_620273 ?auto_620283 ) ) ( not ( = ?auto_620273 ?auto_620284 ) ) ( not ( = ?auto_620274 ?auto_620275 ) ) ( not ( = ?auto_620274 ?auto_620277 ) ) ( not ( = ?auto_620274 ?auto_620276 ) ) ( not ( = ?auto_620274 ?auto_620278 ) ) ( not ( = ?auto_620274 ?auto_620279 ) ) ( not ( = ?auto_620274 ?auto_620280 ) ) ( not ( = ?auto_620274 ?auto_620281 ) ) ( not ( = ?auto_620274 ?auto_620282 ) ) ( not ( = ?auto_620274 ?auto_620283 ) ) ( not ( = ?auto_620274 ?auto_620284 ) ) ( not ( = ?auto_620275 ?auto_620277 ) ) ( not ( = ?auto_620275 ?auto_620276 ) ) ( not ( = ?auto_620275 ?auto_620278 ) ) ( not ( = ?auto_620275 ?auto_620279 ) ) ( not ( = ?auto_620275 ?auto_620280 ) ) ( not ( = ?auto_620275 ?auto_620281 ) ) ( not ( = ?auto_620275 ?auto_620282 ) ) ( not ( = ?auto_620275 ?auto_620283 ) ) ( not ( = ?auto_620275 ?auto_620284 ) ) ( not ( = ?auto_620277 ?auto_620276 ) ) ( not ( = ?auto_620277 ?auto_620278 ) ) ( not ( = ?auto_620277 ?auto_620279 ) ) ( not ( = ?auto_620277 ?auto_620280 ) ) ( not ( = ?auto_620277 ?auto_620281 ) ) ( not ( = ?auto_620277 ?auto_620282 ) ) ( not ( = ?auto_620277 ?auto_620283 ) ) ( not ( = ?auto_620277 ?auto_620284 ) ) ( not ( = ?auto_620276 ?auto_620278 ) ) ( not ( = ?auto_620276 ?auto_620279 ) ) ( not ( = ?auto_620276 ?auto_620280 ) ) ( not ( = ?auto_620276 ?auto_620281 ) ) ( not ( = ?auto_620276 ?auto_620282 ) ) ( not ( = ?auto_620276 ?auto_620283 ) ) ( not ( = ?auto_620276 ?auto_620284 ) ) ( not ( = ?auto_620278 ?auto_620279 ) ) ( not ( = ?auto_620278 ?auto_620280 ) ) ( not ( = ?auto_620278 ?auto_620281 ) ) ( not ( = ?auto_620278 ?auto_620282 ) ) ( not ( = ?auto_620278 ?auto_620283 ) ) ( not ( = ?auto_620278 ?auto_620284 ) ) ( not ( = ?auto_620279 ?auto_620280 ) ) ( not ( = ?auto_620279 ?auto_620281 ) ) ( not ( = ?auto_620279 ?auto_620282 ) ) ( not ( = ?auto_620279 ?auto_620283 ) ) ( not ( = ?auto_620279 ?auto_620284 ) ) ( not ( = ?auto_620280 ?auto_620281 ) ) ( not ( = ?auto_620280 ?auto_620282 ) ) ( not ( = ?auto_620280 ?auto_620283 ) ) ( not ( = ?auto_620280 ?auto_620284 ) ) ( not ( = ?auto_620281 ?auto_620282 ) ) ( not ( = ?auto_620281 ?auto_620283 ) ) ( not ( = ?auto_620281 ?auto_620284 ) ) ( not ( = ?auto_620282 ?auto_620283 ) ) ( not ( = ?auto_620282 ?auto_620284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_620283 ?auto_620284 )
      ( MAKE-11CRATE-VERIFY ?auto_620273 ?auto_620274 ?auto_620275 ?auto_620277 ?auto_620276 ?auto_620278 ?auto_620279 ?auto_620280 ?auto_620281 ?auto_620282 ?auto_620283 ?auto_620284 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620382 - SURFACE
      ?auto_620383 - SURFACE
      ?auto_620384 - SURFACE
      ?auto_620386 - SURFACE
      ?auto_620385 - SURFACE
      ?auto_620387 - SURFACE
      ?auto_620388 - SURFACE
      ?auto_620389 - SURFACE
      ?auto_620390 - SURFACE
      ?auto_620391 - SURFACE
      ?auto_620392 - SURFACE
      ?auto_620393 - SURFACE
    )
    :vars
    (
      ?auto_620396 - HOIST
      ?auto_620394 - PLACE
      ?auto_620395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_620396 ?auto_620394 ) ( SURFACE-AT ?auto_620392 ?auto_620394 ) ( CLEAR ?auto_620392 ) ( IS-CRATE ?auto_620393 ) ( not ( = ?auto_620392 ?auto_620393 ) ) ( TRUCK-AT ?auto_620395 ?auto_620394 ) ( AVAILABLE ?auto_620396 ) ( IN ?auto_620393 ?auto_620395 ) ( ON ?auto_620392 ?auto_620391 ) ( not ( = ?auto_620391 ?auto_620392 ) ) ( not ( = ?auto_620391 ?auto_620393 ) ) ( ON ?auto_620383 ?auto_620382 ) ( ON ?auto_620384 ?auto_620383 ) ( ON ?auto_620386 ?auto_620384 ) ( ON ?auto_620385 ?auto_620386 ) ( ON ?auto_620387 ?auto_620385 ) ( ON ?auto_620388 ?auto_620387 ) ( ON ?auto_620389 ?auto_620388 ) ( ON ?auto_620390 ?auto_620389 ) ( ON ?auto_620391 ?auto_620390 ) ( not ( = ?auto_620382 ?auto_620383 ) ) ( not ( = ?auto_620382 ?auto_620384 ) ) ( not ( = ?auto_620382 ?auto_620386 ) ) ( not ( = ?auto_620382 ?auto_620385 ) ) ( not ( = ?auto_620382 ?auto_620387 ) ) ( not ( = ?auto_620382 ?auto_620388 ) ) ( not ( = ?auto_620382 ?auto_620389 ) ) ( not ( = ?auto_620382 ?auto_620390 ) ) ( not ( = ?auto_620382 ?auto_620391 ) ) ( not ( = ?auto_620382 ?auto_620392 ) ) ( not ( = ?auto_620382 ?auto_620393 ) ) ( not ( = ?auto_620383 ?auto_620384 ) ) ( not ( = ?auto_620383 ?auto_620386 ) ) ( not ( = ?auto_620383 ?auto_620385 ) ) ( not ( = ?auto_620383 ?auto_620387 ) ) ( not ( = ?auto_620383 ?auto_620388 ) ) ( not ( = ?auto_620383 ?auto_620389 ) ) ( not ( = ?auto_620383 ?auto_620390 ) ) ( not ( = ?auto_620383 ?auto_620391 ) ) ( not ( = ?auto_620383 ?auto_620392 ) ) ( not ( = ?auto_620383 ?auto_620393 ) ) ( not ( = ?auto_620384 ?auto_620386 ) ) ( not ( = ?auto_620384 ?auto_620385 ) ) ( not ( = ?auto_620384 ?auto_620387 ) ) ( not ( = ?auto_620384 ?auto_620388 ) ) ( not ( = ?auto_620384 ?auto_620389 ) ) ( not ( = ?auto_620384 ?auto_620390 ) ) ( not ( = ?auto_620384 ?auto_620391 ) ) ( not ( = ?auto_620384 ?auto_620392 ) ) ( not ( = ?auto_620384 ?auto_620393 ) ) ( not ( = ?auto_620386 ?auto_620385 ) ) ( not ( = ?auto_620386 ?auto_620387 ) ) ( not ( = ?auto_620386 ?auto_620388 ) ) ( not ( = ?auto_620386 ?auto_620389 ) ) ( not ( = ?auto_620386 ?auto_620390 ) ) ( not ( = ?auto_620386 ?auto_620391 ) ) ( not ( = ?auto_620386 ?auto_620392 ) ) ( not ( = ?auto_620386 ?auto_620393 ) ) ( not ( = ?auto_620385 ?auto_620387 ) ) ( not ( = ?auto_620385 ?auto_620388 ) ) ( not ( = ?auto_620385 ?auto_620389 ) ) ( not ( = ?auto_620385 ?auto_620390 ) ) ( not ( = ?auto_620385 ?auto_620391 ) ) ( not ( = ?auto_620385 ?auto_620392 ) ) ( not ( = ?auto_620385 ?auto_620393 ) ) ( not ( = ?auto_620387 ?auto_620388 ) ) ( not ( = ?auto_620387 ?auto_620389 ) ) ( not ( = ?auto_620387 ?auto_620390 ) ) ( not ( = ?auto_620387 ?auto_620391 ) ) ( not ( = ?auto_620387 ?auto_620392 ) ) ( not ( = ?auto_620387 ?auto_620393 ) ) ( not ( = ?auto_620388 ?auto_620389 ) ) ( not ( = ?auto_620388 ?auto_620390 ) ) ( not ( = ?auto_620388 ?auto_620391 ) ) ( not ( = ?auto_620388 ?auto_620392 ) ) ( not ( = ?auto_620388 ?auto_620393 ) ) ( not ( = ?auto_620389 ?auto_620390 ) ) ( not ( = ?auto_620389 ?auto_620391 ) ) ( not ( = ?auto_620389 ?auto_620392 ) ) ( not ( = ?auto_620389 ?auto_620393 ) ) ( not ( = ?auto_620390 ?auto_620391 ) ) ( not ( = ?auto_620390 ?auto_620392 ) ) ( not ( = ?auto_620390 ?auto_620393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620391 ?auto_620392 ?auto_620393 )
      ( MAKE-11CRATE-VERIFY ?auto_620382 ?auto_620383 ?auto_620384 ?auto_620386 ?auto_620385 ?auto_620387 ?auto_620388 ?auto_620389 ?auto_620390 ?auto_620391 ?auto_620392 ?auto_620393 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620503 - SURFACE
      ?auto_620504 - SURFACE
      ?auto_620505 - SURFACE
      ?auto_620507 - SURFACE
      ?auto_620506 - SURFACE
      ?auto_620508 - SURFACE
      ?auto_620509 - SURFACE
      ?auto_620510 - SURFACE
      ?auto_620511 - SURFACE
      ?auto_620512 - SURFACE
      ?auto_620513 - SURFACE
      ?auto_620514 - SURFACE
    )
    :vars
    (
      ?auto_620516 - HOIST
      ?auto_620517 - PLACE
      ?auto_620518 - TRUCK
      ?auto_620515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620516 ?auto_620517 ) ( SURFACE-AT ?auto_620513 ?auto_620517 ) ( CLEAR ?auto_620513 ) ( IS-CRATE ?auto_620514 ) ( not ( = ?auto_620513 ?auto_620514 ) ) ( AVAILABLE ?auto_620516 ) ( IN ?auto_620514 ?auto_620518 ) ( ON ?auto_620513 ?auto_620512 ) ( not ( = ?auto_620512 ?auto_620513 ) ) ( not ( = ?auto_620512 ?auto_620514 ) ) ( TRUCK-AT ?auto_620518 ?auto_620515 ) ( not ( = ?auto_620515 ?auto_620517 ) ) ( ON ?auto_620504 ?auto_620503 ) ( ON ?auto_620505 ?auto_620504 ) ( ON ?auto_620507 ?auto_620505 ) ( ON ?auto_620506 ?auto_620507 ) ( ON ?auto_620508 ?auto_620506 ) ( ON ?auto_620509 ?auto_620508 ) ( ON ?auto_620510 ?auto_620509 ) ( ON ?auto_620511 ?auto_620510 ) ( ON ?auto_620512 ?auto_620511 ) ( not ( = ?auto_620503 ?auto_620504 ) ) ( not ( = ?auto_620503 ?auto_620505 ) ) ( not ( = ?auto_620503 ?auto_620507 ) ) ( not ( = ?auto_620503 ?auto_620506 ) ) ( not ( = ?auto_620503 ?auto_620508 ) ) ( not ( = ?auto_620503 ?auto_620509 ) ) ( not ( = ?auto_620503 ?auto_620510 ) ) ( not ( = ?auto_620503 ?auto_620511 ) ) ( not ( = ?auto_620503 ?auto_620512 ) ) ( not ( = ?auto_620503 ?auto_620513 ) ) ( not ( = ?auto_620503 ?auto_620514 ) ) ( not ( = ?auto_620504 ?auto_620505 ) ) ( not ( = ?auto_620504 ?auto_620507 ) ) ( not ( = ?auto_620504 ?auto_620506 ) ) ( not ( = ?auto_620504 ?auto_620508 ) ) ( not ( = ?auto_620504 ?auto_620509 ) ) ( not ( = ?auto_620504 ?auto_620510 ) ) ( not ( = ?auto_620504 ?auto_620511 ) ) ( not ( = ?auto_620504 ?auto_620512 ) ) ( not ( = ?auto_620504 ?auto_620513 ) ) ( not ( = ?auto_620504 ?auto_620514 ) ) ( not ( = ?auto_620505 ?auto_620507 ) ) ( not ( = ?auto_620505 ?auto_620506 ) ) ( not ( = ?auto_620505 ?auto_620508 ) ) ( not ( = ?auto_620505 ?auto_620509 ) ) ( not ( = ?auto_620505 ?auto_620510 ) ) ( not ( = ?auto_620505 ?auto_620511 ) ) ( not ( = ?auto_620505 ?auto_620512 ) ) ( not ( = ?auto_620505 ?auto_620513 ) ) ( not ( = ?auto_620505 ?auto_620514 ) ) ( not ( = ?auto_620507 ?auto_620506 ) ) ( not ( = ?auto_620507 ?auto_620508 ) ) ( not ( = ?auto_620507 ?auto_620509 ) ) ( not ( = ?auto_620507 ?auto_620510 ) ) ( not ( = ?auto_620507 ?auto_620511 ) ) ( not ( = ?auto_620507 ?auto_620512 ) ) ( not ( = ?auto_620507 ?auto_620513 ) ) ( not ( = ?auto_620507 ?auto_620514 ) ) ( not ( = ?auto_620506 ?auto_620508 ) ) ( not ( = ?auto_620506 ?auto_620509 ) ) ( not ( = ?auto_620506 ?auto_620510 ) ) ( not ( = ?auto_620506 ?auto_620511 ) ) ( not ( = ?auto_620506 ?auto_620512 ) ) ( not ( = ?auto_620506 ?auto_620513 ) ) ( not ( = ?auto_620506 ?auto_620514 ) ) ( not ( = ?auto_620508 ?auto_620509 ) ) ( not ( = ?auto_620508 ?auto_620510 ) ) ( not ( = ?auto_620508 ?auto_620511 ) ) ( not ( = ?auto_620508 ?auto_620512 ) ) ( not ( = ?auto_620508 ?auto_620513 ) ) ( not ( = ?auto_620508 ?auto_620514 ) ) ( not ( = ?auto_620509 ?auto_620510 ) ) ( not ( = ?auto_620509 ?auto_620511 ) ) ( not ( = ?auto_620509 ?auto_620512 ) ) ( not ( = ?auto_620509 ?auto_620513 ) ) ( not ( = ?auto_620509 ?auto_620514 ) ) ( not ( = ?auto_620510 ?auto_620511 ) ) ( not ( = ?auto_620510 ?auto_620512 ) ) ( not ( = ?auto_620510 ?auto_620513 ) ) ( not ( = ?auto_620510 ?auto_620514 ) ) ( not ( = ?auto_620511 ?auto_620512 ) ) ( not ( = ?auto_620511 ?auto_620513 ) ) ( not ( = ?auto_620511 ?auto_620514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620512 ?auto_620513 ?auto_620514 )
      ( MAKE-11CRATE-VERIFY ?auto_620503 ?auto_620504 ?auto_620505 ?auto_620507 ?auto_620506 ?auto_620508 ?auto_620509 ?auto_620510 ?auto_620511 ?auto_620512 ?auto_620513 ?auto_620514 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620635 - SURFACE
      ?auto_620636 - SURFACE
      ?auto_620637 - SURFACE
      ?auto_620639 - SURFACE
      ?auto_620638 - SURFACE
      ?auto_620640 - SURFACE
      ?auto_620641 - SURFACE
      ?auto_620642 - SURFACE
      ?auto_620643 - SURFACE
      ?auto_620644 - SURFACE
      ?auto_620645 - SURFACE
      ?auto_620646 - SURFACE
    )
    :vars
    (
      ?auto_620650 - HOIST
      ?auto_620647 - PLACE
      ?auto_620648 - TRUCK
      ?auto_620649 - PLACE
      ?auto_620651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_620650 ?auto_620647 ) ( SURFACE-AT ?auto_620645 ?auto_620647 ) ( CLEAR ?auto_620645 ) ( IS-CRATE ?auto_620646 ) ( not ( = ?auto_620645 ?auto_620646 ) ) ( AVAILABLE ?auto_620650 ) ( ON ?auto_620645 ?auto_620644 ) ( not ( = ?auto_620644 ?auto_620645 ) ) ( not ( = ?auto_620644 ?auto_620646 ) ) ( TRUCK-AT ?auto_620648 ?auto_620649 ) ( not ( = ?auto_620649 ?auto_620647 ) ) ( HOIST-AT ?auto_620651 ?auto_620649 ) ( LIFTING ?auto_620651 ?auto_620646 ) ( not ( = ?auto_620650 ?auto_620651 ) ) ( ON ?auto_620636 ?auto_620635 ) ( ON ?auto_620637 ?auto_620636 ) ( ON ?auto_620639 ?auto_620637 ) ( ON ?auto_620638 ?auto_620639 ) ( ON ?auto_620640 ?auto_620638 ) ( ON ?auto_620641 ?auto_620640 ) ( ON ?auto_620642 ?auto_620641 ) ( ON ?auto_620643 ?auto_620642 ) ( ON ?auto_620644 ?auto_620643 ) ( not ( = ?auto_620635 ?auto_620636 ) ) ( not ( = ?auto_620635 ?auto_620637 ) ) ( not ( = ?auto_620635 ?auto_620639 ) ) ( not ( = ?auto_620635 ?auto_620638 ) ) ( not ( = ?auto_620635 ?auto_620640 ) ) ( not ( = ?auto_620635 ?auto_620641 ) ) ( not ( = ?auto_620635 ?auto_620642 ) ) ( not ( = ?auto_620635 ?auto_620643 ) ) ( not ( = ?auto_620635 ?auto_620644 ) ) ( not ( = ?auto_620635 ?auto_620645 ) ) ( not ( = ?auto_620635 ?auto_620646 ) ) ( not ( = ?auto_620636 ?auto_620637 ) ) ( not ( = ?auto_620636 ?auto_620639 ) ) ( not ( = ?auto_620636 ?auto_620638 ) ) ( not ( = ?auto_620636 ?auto_620640 ) ) ( not ( = ?auto_620636 ?auto_620641 ) ) ( not ( = ?auto_620636 ?auto_620642 ) ) ( not ( = ?auto_620636 ?auto_620643 ) ) ( not ( = ?auto_620636 ?auto_620644 ) ) ( not ( = ?auto_620636 ?auto_620645 ) ) ( not ( = ?auto_620636 ?auto_620646 ) ) ( not ( = ?auto_620637 ?auto_620639 ) ) ( not ( = ?auto_620637 ?auto_620638 ) ) ( not ( = ?auto_620637 ?auto_620640 ) ) ( not ( = ?auto_620637 ?auto_620641 ) ) ( not ( = ?auto_620637 ?auto_620642 ) ) ( not ( = ?auto_620637 ?auto_620643 ) ) ( not ( = ?auto_620637 ?auto_620644 ) ) ( not ( = ?auto_620637 ?auto_620645 ) ) ( not ( = ?auto_620637 ?auto_620646 ) ) ( not ( = ?auto_620639 ?auto_620638 ) ) ( not ( = ?auto_620639 ?auto_620640 ) ) ( not ( = ?auto_620639 ?auto_620641 ) ) ( not ( = ?auto_620639 ?auto_620642 ) ) ( not ( = ?auto_620639 ?auto_620643 ) ) ( not ( = ?auto_620639 ?auto_620644 ) ) ( not ( = ?auto_620639 ?auto_620645 ) ) ( not ( = ?auto_620639 ?auto_620646 ) ) ( not ( = ?auto_620638 ?auto_620640 ) ) ( not ( = ?auto_620638 ?auto_620641 ) ) ( not ( = ?auto_620638 ?auto_620642 ) ) ( not ( = ?auto_620638 ?auto_620643 ) ) ( not ( = ?auto_620638 ?auto_620644 ) ) ( not ( = ?auto_620638 ?auto_620645 ) ) ( not ( = ?auto_620638 ?auto_620646 ) ) ( not ( = ?auto_620640 ?auto_620641 ) ) ( not ( = ?auto_620640 ?auto_620642 ) ) ( not ( = ?auto_620640 ?auto_620643 ) ) ( not ( = ?auto_620640 ?auto_620644 ) ) ( not ( = ?auto_620640 ?auto_620645 ) ) ( not ( = ?auto_620640 ?auto_620646 ) ) ( not ( = ?auto_620641 ?auto_620642 ) ) ( not ( = ?auto_620641 ?auto_620643 ) ) ( not ( = ?auto_620641 ?auto_620644 ) ) ( not ( = ?auto_620641 ?auto_620645 ) ) ( not ( = ?auto_620641 ?auto_620646 ) ) ( not ( = ?auto_620642 ?auto_620643 ) ) ( not ( = ?auto_620642 ?auto_620644 ) ) ( not ( = ?auto_620642 ?auto_620645 ) ) ( not ( = ?auto_620642 ?auto_620646 ) ) ( not ( = ?auto_620643 ?auto_620644 ) ) ( not ( = ?auto_620643 ?auto_620645 ) ) ( not ( = ?auto_620643 ?auto_620646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620644 ?auto_620645 ?auto_620646 )
      ( MAKE-11CRATE-VERIFY ?auto_620635 ?auto_620636 ?auto_620637 ?auto_620639 ?auto_620638 ?auto_620640 ?auto_620641 ?auto_620642 ?auto_620643 ?auto_620644 ?auto_620645 ?auto_620646 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620778 - SURFACE
      ?auto_620779 - SURFACE
      ?auto_620780 - SURFACE
      ?auto_620782 - SURFACE
      ?auto_620781 - SURFACE
      ?auto_620783 - SURFACE
      ?auto_620784 - SURFACE
      ?auto_620785 - SURFACE
      ?auto_620786 - SURFACE
      ?auto_620787 - SURFACE
      ?auto_620788 - SURFACE
      ?auto_620789 - SURFACE
    )
    :vars
    (
      ?auto_620790 - HOIST
      ?auto_620791 - PLACE
      ?auto_620792 - TRUCK
      ?auto_620795 - PLACE
      ?auto_620794 - HOIST
      ?auto_620793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620790 ?auto_620791 ) ( SURFACE-AT ?auto_620788 ?auto_620791 ) ( CLEAR ?auto_620788 ) ( IS-CRATE ?auto_620789 ) ( not ( = ?auto_620788 ?auto_620789 ) ) ( AVAILABLE ?auto_620790 ) ( ON ?auto_620788 ?auto_620787 ) ( not ( = ?auto_620787 ?auto_620788 ) ) ( not ( = ?auto_620787 ?auto_620789 ) ) ( TRUCK-AT ?auto_620792 ?auto_620795 ) ( not ( = ?auto_620795 ?auto_620791 ) ) ( HOIST-AT ?auto_620794 ?auto_620795 ) ( not ( = ?auto_620790 ?auto_620794 ) ) ( AVAILABLE ?auto_620794 ) ( SURFACE-AT ?auto_620789 ?auto_620795 ) ( ON ?auto_620789 ?auto_620793 ) ( CLEAR ?auto_620789 ) ( not ( = ?auto_620788 ?auto_620793 ) ) ( not ( = ?auto_620789 ?auto_620793 ) ) ( not ( = ?auto_620787 ?auto_620793 ) ) ( ON ?auto_620779 ?auto_620778 ) ( ON ?auto_620780 ?auto_620779 ) ( ON ?auto_620782 ?auto_620780 ) ( ON ?auto_620781 ?auto_620782 ) ( ON ?auto_620783 ?auto_620781 ) ( ON ?auto_620784 ?auto_620783 ) ( ON ?auto_620785 ?auto_620784 ) ( ON ?auto_620786 ?auto_620785 ) ( ON ?auto_620787 ?auto_620786 ) ( not ( = ?auto_620778 ?auto_620779 ) ) ( not ( = ?auto_620778 ?auto_620780 ) ) ( not ( = ?auto_620778 ?auto_620782 ) ) ( not ( = ?auto_620778 ?auto_620781 ) ) ( not ( = ?auto_620778 ?auto_620783 ) ) ( not ( = ?auto_620778 ?auto_620784 ) ) ( not ( = ?auto_620778 ?auto_620785 ) ) ( not ( = ?auto_620778 ?auto_620786 ) ) ( not ( = ?auto_620778 ?auto_620787 ) ) ( not ( = ?auto_620778 ?auto_620788 ) ) ( not ( = ?auto_620778 ?auto_620789 ) ) ( not ( = ?auto_620778 ?auto_620793 ) ) ( not ( = ?auto_620779 ?auto_620780 ) ) ( not ( = ?auto_620779 ?auto_620782 ) ) ( not ( = ?auto_620779 ?auto_620781 ) ) ( not ( = ?auto_620779 ?auto_620783 ) ) ( not ( = ?auto_620779 ?auto_620784 ) ) ( not ( = ?auto_620779 ?auto_620785 ) ) ( not ( = ?auto_620779 ?auto_620786 ) ) ( not ( = ?auto_620779 ?auto_620787 ) ) ( not ( = ?auto_620779 ?auto_620788 ) ) ( not ( = ?auto_620779 ?auto_620789 ) ) ( not ( = ?auto_620779 ?auto_620793 ) ) ( not ( = ?auto_620780 ?auto_620782 ) ) ( not ( = ?auto_620780 ?auto_620781 ) ) ( not ( = ?auto_620780 ?auto_620783 ) ) ( not ( = ?auto_620780 ?auto_620784 ) ) ( not ( = ?auto_620780 ?auto_620785 ) ) ( not ( = ?auto_620780 ?auto_620786 ) ) ( not ( = ?auto_620780 ?auto_620787 ) ) ( not ( = ?auto_620780 ?auto_620788 ) ) ( not ( = ?auto_620780 ?auto_620789 ) ) ( not ( = ?auto_620780 ?auto_620793 ) ) ( not ( = ?auto_620782 ?auto_620781 ) ) ( not ( = ?auto_620782 ?auto_620783 ) ) ( not ( = ?auto_620782 ?auto_620784 ) ) ( not ( = ?auto_620782 ?auto_620785 ) ) ( not ( = ?auto_620782 ?auto_620786 ) ) ( not ( = ?auto_620782 ?auto_620787 ) ) ( not ( = ?auto_620782 ?auto_620788 ) ) ( not ( = ?auto_620782 ?auto_620789 ) ) ( not ( = ?auto_620782 ?auto_620793 ) ) ( not ( = ?auto_620781 ?auto_620783 ) ) ( not ( = ?auto_620781 ?auto_620784 ) ) ( not ( = ?auto_620781 ?auto_620785 ) ) ( not ( = ?auto_620781 ?auto_620786 ) ) ( not ( = ?auto_620781 ?auto_620787 ) ) ( not ( = ?auto_620781 ?auto_620788 ) ) ( not ( = ?auto_620781 ?auto_620789 ) ) ( not ( = ?auto_620781 ?auto_620793 ) ) ( not ( = ?auto_620783 ?auto_620784 ) ) ( not ( = ?auto_620783 ?auto_620785 ) ) ( not ( = ?auto_620783 ?auto_620786 ) ) ( not ( = ?auto_620783 ?auto_620787 ) ) ( not ( = ?auto_620783 ?auto_620788 ) ) ( not ( = ?auto_620783 ?auto_620789 ) ) ( not ( = ?auto_620783 ?auto_620793 ) ) ( not ( = ?auto_620784 ?auto_620785 ) ) ( not ( = ?auto_620784 ?auto_620786 ) ) ( not ( = ?auto_620784 ?auto_620787 ) ) ( not ( = ?auto_620784 ?auto_620788 ) ) ( not ( = ?auto_620784 ?auto_620789 ) ) ( not ( = ?auto_620784 ?auto_620793 ) ) ( not ( = ?auto_620785 ?auto_620786 ) ) ( not ( = ?auto_620785 ?auto_620787 ) ) ( not ( = ?auto_620785 ?auto_620788 ) ) ( not ( = ?auto_620785 ?auto_620789 ) ) ( not ( = ?auto_620785 ?auto_620793 ) ) ( not ( = ?auto_620786 ?auto_620787 ) ) ( not ( = ?auto_620786 ?auto_620788 ) ) ( not ( = ?auto_620786 ?auto_620789 ) ) ( not ( = ?auto_620786 ?auto_620793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620787 ?auto_620788 ?auto_620789 )
      ( MAKE-11CRATE-VERIFY ?auto_620778 ?auto_620779 ?auto_620780 ?auto_620782 ?auto_620781 ?auto_620783 ?auto_620784 ?auto_620785 ?auto_620786 ?auto_620787 ?auto_620788 ?auto_620789 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620922 - SURFACE
      ?auto_620923 - SURFACE
      ?auto_620924 - SURFACE
      ?auto_620926 - SURFACE
      ?auto_620925 - SURFACE
      ?auto_620927 - SURFACE
      ?auto_620928 - SURFACE
      ?auto_620929 - SURFACE
      ?auto_620930 - SURFACE
      ?auto_620931 - SURFACE
      ?auto_620932 - SURFACE
      ?auto_620933 - SURFACE
    )
    :vars
    (
      ?auto_620939 - HOIST
      ?auto_620938 - PLACE
      ?auto_620934 - PLACE
      ?auto_620936 - HOIST
      ?auto_620937 - SURFACE
      ?auto_620935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_620939 ?auto_620938 ) ( SURFACE-AT ?auto_620932 ?auto_620938 ) ( CLEAR ?auto_620932 ) ( IS-CRATE ?auto_620933 ) ( not ( = ?auto_620932 ?auto_620933 ) ) ( AVAILABLE ?auto_620939 ) ( ON ?auto_620932 ?auto_620931 ) ( not ( = ?auto_620931 ?auto_620932 ) ) ( not ( = ?auto_620931 ?auto_620933 ) ) ( not ( = ?auto_620934 ?auto_620938 ) ) ( HOIST-AT ?auto_620936 ?auto_620934 ) ( not ( = ?auto_620939 ?auto_620936 ) ) ( AVAILABLE ?auto_620936 ) ( SURFACE-AT ?auto_620933 ?auto_620934 ) ( ON ?auto_620933 ?auto_620937 ) ( CLEAR ?auto_620933 ) ( not ( = ?auto_620932 ?auto_620937 ) ) ( not ( = ?auto_620933 ?auto_620937 ) ) ( not ( = ?auto_620931 ?auto_620937 ) ) ( TRUCK-AT ?auto_620935 ?auto_620938 ) ( ON ?auto_620923 ?auto_620922 ) ( ON ?auto_620924 ?auto_620923 ) ( ON ?auto_620926 ?auto_620924 ) ( ON ?auto_620925 ?auto_620926 ) ( ON ?auto_620927 ?auto_620925 ) ( ON ?auto_620928 ?auto_620927 ) ( ON ?auto_620929 ?auto_620928 ) ( ON ?auto_620930 ?auto_620929 ) ( ON ?auto_620931 ?auto_620930 ) ( not ( = ?auto_620922 ?auto_620923 ) ) ( not ( = ?auto_620922 ?auto_620924 ) ) ( not ( = ?auto_620922 ?auto_620926 ) ) ( not ( = ?auto_620922 ?auto_620925 ) ) ( not ( = ?auto_620922 ?auto_620927 ) ) ( not ( = ?auto_620922 ?auto_620928 ) ) ( not ( = ?auto_620922 ?auto_620929 ) ) ( not ( = ?auto_620922 ?auto_620930 ) ) ( not ( = ?auto_620922 ?auto_620931 ) ) ( not ( = ?auto_620922 ?auto_620932 ) ) ( not ( = ?auto_620922 ?auto_620933 ) ) ( not ( = ?auto_620922 ?auto_620937 ) ) ( not ( = ?auto_620923 ?auto_620924 ) ) ( not ( = ?auto_620923 ?auto_620926 ) ) ( not ( = ?auto_620923 ?auto_620925 ) ) ( not ( = ?auto_620923 ?auto_620927 ) ) ( not ( = ?auto_620923 ?auto_620928 ) ) ( not ( = ?auto_620923 ?auto_620929 ) ) ( not ( = ?auto_620923 ?auto_620930 ) ) ( not ( = ?auto_620923 ?auto_620931 ) ) ( not ( = ?auto_620923 ?auto_620932 ) ) ( not ( = ?auto_620923 ?auto_620933 ) ) ( not ( = ?auto_620923 ?auto_620937 ) ) ( not ( = ?auto_620924 ?auto_620926 ) ) ( not ( = ?auto_620924 ?auto_620925 ) ) ( not ( = ?auto_620924 ?auto_620927 ) ) ( not ( = ?auto_620924 ?auto_620928 ) ) ( not ( = ?auto_620924 ?auto_620929 ) ) ( not ( = ?auto_620924 ?auto_620930 ) ) ( not ( = ?auto_620924 ?auto_620931 ) ) ( not ( = ?auto_620924 ?auto_620932 ) ) ( not ( = ?auto_620924 ?auto_620933 ) ) ( not ( = ?auto_620924 ?auto_620937 ) ) ( not ( = ?auto_620926 ?auto_620925 ) ) ( not ( = ?auto_620926 ?auto_620927 ) ) ( not ( = ?auto_620926 ?auto_620928 ) ) ( not ( = ?auto_620926 ?auto_620929 ) ) ( not ( = ?auto_620926 ?auto_620930 ) ) ( not ( = ?auto_620926 ?auto_620931 ) ) ( not ( = ?auto_620926 ?auto_620932 ) ) ( not ( = ?auto_620926 ?auto_620933 ) ) ( not ( = ?auto_620926 ?auto_620937 ) ) ( not ( = ?auto_620925 ?auto_620927 ) ) ( not ( = ?auto_620925 ?auto_620928 ) ) ( not ( = ?auto_620925 ?auto_620929 ) ) ( not ( = ?auto_620925 ?auto_620930 ) ) ( not ( = ?auto_620925 ?auto_620931 ) ) ( not ( = ?auto_620925 ?auto_620932 ) ) ( not ( = ?auto_620925 ?auto_620933 ) ) ( not ( = ?auto_620925 ?auto_620937 ) ) ( not ( = ?auto_620927 ?auto_620928 ) ) ( not ( = ?auto_620927 ?auto_620929 ) ) ( not ( = ?auto_620927 ?auto_620930 ) ) ( not ( = ?auto_620927 ?auto_620931 ) ) ( not ( = ?auto_620927 ?auto_620932 ) ) ( not ( = ?auto_620927 ?auto_620933 ) ) ( not ( = ?auto_620927 ?auto_620937 ) ) ( not ( = ?auto_620928 ?auto_620929 ) ) ( not ( = ?auto_620928 ?auto_620930 ) ) ( not ( = ?auto_620928 ?auto_620931 ) ) ( not ( = ?auto_620928 ?auto_620932 ) ) ( not ( = ?auto_620928 ?auto_620933 ) ) ( not ( = ?auto_620928 ?auto_620937 ) ) ( not ( = ?auto_620929 ?auto_620930 ) ) ( not ( = ?auto_620929 ?auto_620931 ) ) ( not ( = ?auto_620929 ?auto_620932 ) ) ( not ( = ?auto_620929 ?auto_620933 ) ) ( not ( = ?auto_620929 ?auto_620937 ) ) ( not ( = ?auto_620930 ?auto_620931 ) ) ( not ( = ?auto_620930 ?auto_620932 ) ) ( not ( = ?auto_620930 ?auto_620933 ) ) ( not ( = ?auto_620930 ?auto_620937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620931 ?auto_620932 ?auto_620933 )
      ( MAKE-11CRATE-VERIFY ?auto_620922 ?auto_620923 ?auto_620924 ?auto_620926 ?auto_620925 ?auto_620927 ?auto_620928 ?auto_620929 ?auto_620930 ?auto_620931 ?auto_620932 ?auto_620933 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621066 - SURFACE
      ?auto_621067 - SURFACE
      ?auto_621068 - SURFACE
      ?auto_621070 - SURFACE
      ?auto_621069 - SURFACE
      ?auto_621071 - SURFACE
      ?auto_621072 - SURFACE
      ?auto_621073 - SURFACE
      ?auto_621074 - SURFACE
      ?auto_621075 - SURFACE
      ?auto_621076 - SURFACE
      ?auto_621077 - SURFACE
    )
    :vars
    (
      ?auto_621082 - HOIST
      ?auto_621080 - PLACE
      ?auto_621081 - PLACE
      ?auto_621083 - HOIST
      ?auto_621079 - SURFACE
      ?auto_621078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621082 ?auto_621080 ) ( IS-CRATE ?auto_621077 ) ( not ( = ?auto_621076 ?auto_621077 ) ) ( not ( = ?auto_621075 ?auto_621076 ) ) ( not ( = ?auto_621075 ?auto_621077 ) ) ( not ( = ?auto_621081 ?auto_621080 ) ) ( HOIST-AT ?auto_621083 ?auto_621081 ) ( not ( = ?auto_621082 ?auto_621083 ) ) ( AVAILABLE ?auto_621083 ) ( SURFACE-AT ?auto_621077 ?auto_621081 ) ( ON ?auto_621077 ?auto_621079 ) ( CLEAR ?auto_621077 ) ( not ( = ?auto_621076 ?auto_621079 ) ) ( not ( = ?auto_621077 ?auto_621079 ) ) ( not ( = ?auto_621075 ?auto_621079 ) ) ( TRUCK-AT ?auto_621078 ?auto_621080 ) ( SURFACE-AT ?auto_621075 ?auto_621080 ) ( CLEAR ?auto_621075 ) ( LIFTING ?auto_621082 ?auto_621076 ) ( IS-CRATE ?auto_621076 ) ( ON ?auto_621067 ?auto_621066 ) ( ON ?auto_621068 ?auto_621067 ) ( ON ?auto_621070 ?auto_621068 ) ( ON ?auto_621069 ?auto_621070 ) ( ON ?auto_621071 ?auto_621069 ) ( ON ?auto_621072 ?auto_621071 ) ( ON ?auto_621073 ?auto_621072 ) ( ON ?auto_621074 ?auto_621073 ) ( ON ?auto_621075 ?auto_621074 ) ( not ( = ?auto_621066 ?auto_621067 ) ) ( not ( = ?auto_621066 ?auto_621068 ) ) ( not ( = ?auto_621066 ?auto_621070 ) ) ( not ( = ?auto_621066 ?auto_621069 ) ) ( not ( = ?auto_621066 ?auto_621071 ) ) ( not ( = ?auto_621066 ?auto_621072 ) ) ( not ( = ?auto_621066 ?auto_621073 ) ) ( not ( = ?auto_621066 ?auto_621074 ) ) ( not ( = ?auto_621066 ?auto_621075 ) ) ( not ( = ?auto_621066 ?auto_621076 ) ) ( not ( = ?auto_621066 ?auto_621077 ) ) ( not ( = ?auto_621066 ?auto_621079 ) ) ( not ( = ?auto_621067 ?auto_621068 ) ) ( not ( = ?auto_621067 ?auto_621070 ) ) ( not ( = ?auto_621067 ?auto_621069 ) ) ( not ( = ?auto_621067 ?auto_621071 ) ) ( not ( = ?auto_621067 ?auto_621072 ) ) ( not ( = ?auto_621067 ?auto_621073 ) ) ( not ( = ?auto_621067 ?auto_621074 ) ) ( not ( = ?auto_621067 ?auto_621075 ) ) ( not ( = ?auto_621067 ?auto_621076 ) ) ( not ( = ?auto_621067 ?auto_621077 ) ) ( not ( = ?auto_621067 ?auto_621079 ) ) ( not ( = ?auto_621068 ?auto_621070 ) ) ( not ( = ?auto_621068 ?auto_621069 ) ) ( not ( = ?auto_621068 ?auto_621071 ) ) ( not ( = ?auto_621068 ?auto_621072 ) ) ( not ( = ?auto_621068 ?auto_621073 ) ) ( not ( = ?auto_621068 ?auto_621074 ) ) ( not ( = ?auto_621068 ?auto_621075 ) ) ( not ( = ?auto_621068 ?auto_621076 ) ) ( not ( = ?auto_621068 ?auto_621077 ) ) ( not ( = ?auto_621068 ?auto_621079 ) ) ( not ( = ?auto_621070 ?auto_621069 ) ) ( not ( = ?auto_621070 ?auto_621071 ) ) ( not ( = ?auto_621070 ?auto_621072 ) ) ( not ( = ?auto_621070 ?auto_621073 ) ) ( not ( = ?auto_621070 ?auto_621074 ) ) ( not ( = ?auto_621070 ?auto_621075 ) ) ( not ( = ?auto_621070 ?auto_621076 ) ) ( not ( = ?auto_621070 ?auto_621077 ) ) ( not ( = ?auto_621070 ?auto_621079 ) ) ( not ( = ?auto_621069 ?auto_621071 ) ) ( not ( = ?auto_621069 ?auto_621072 ) ) ( not ( = ?auto_621069 ?auto_621073 ) ) ( not ( = ?auto_621069 ?auto_621074 ) ) ( not ( = ?auto_621069 ?auto_621075 ) ) ( not ( = ?auto_621069 ?auto_621076 ) ) ( not ( = ?auto_621069 ?auto_621077 ) ) ( not ( = ?auto_621069 ?auto_621079 ) ) ( not ( = ?auto_621071 ?auto_621072 ) ) ( not ( = ?auto_621071 ?auto_621073 ) ) ( not ( = ?auto_621071 ?auto_621074 ) ) ( not ( = ?auto_621071 ?auto_621075 ) ) ( not ( = ?auto_621071 ?auto_621076 ) ) ( not ( = ?auto_621071 ?auto_621077 ) ) ( not ( = ?auto_621071 ?auto_621079 ) ) ( not ( = ?auto_621072 ?auto_621073 ) ) ( not ( = ?auto_621072 ?auto_621074 ) ) ( not ( = ?auto_621072 ?auto_621075 ) ) ( not ( = ?auto_621072 ?auto_621076 ) ) ( not ( = ?auto_621072 ?auto_621077 ) ) ( not ( = ?auto_621072 ?auto_621079 ) ) ( not ( = ?auto_621073 ?auto_621074 ) ) ( not ( = ?auto_621073 ?auto_621075 ) ) ( not ( = ?auto_621073 ?auto_621076 ) ) ( not ( = ?auto_621073 ?auto_621077 ) ) ( not ( = ?auto_621073 ?auto_621079 ) ) ( not ( = ?auto_621074 ?auto_621075 ) ) ( not ( = ?auto_621074 ?auto_621076 ) ) ( not ( = ?auto_621074 ?auto_621077 ) ) ( not ( = ?auto_621074 ?auto_621079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621075 ?auto_621076 ?auto_621077 )
      ( MAKE-11CRATE-VERIFY ?auto_621066 ?auto_621067 ?auto_621068 ?auto_621070 ?auto_621069 ?auto_621071 ?auto_621072 ?auto_621073 ?auto_621074 ?auto_621075 ?auto_621076 ?auto_621077 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621210 - SURFACE
      ?auto_621211 - SURFACE
      ?auto_621212 - SURFACE
      ?auto_621214 - SURFACE
      ?auto_621213 - SURFACE
      ?auto_621215 - SURFACE
      ?auto_621216 - SURFACE
      ?auto_621217 - SURFACE
      ?auto_621218 - SURFACE
      ?auto_621219 - SURFACE
      ?auto_621220 - SURFACE
      ?auto_621221 - SURFACE
    )
    :vars
    (
      ?auto_621225 - HOIST
      ?auto_621222 - PLACE
      ?auto_621224 - PLACE
      ?auto_621227 - HOIST
      ?auto_621223 - SURFACE
      ?auto_621226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621225 ?auto_621222 ) ( IS-CRATE ?auto_621221 ) ( not ( = ?auto_621220 ?auto_621221 ) ) ( not ( = ?auto_621219 ?auto_621220 ) ) ( not ( = ?auto_621219 ?auto_621221 ) ) ( not ( = ?auto_621224 ?auto_621222 ) ) ( HOIST-AT ?auto_621227 ?auto_621224 ) ( not ( = ?auto_621225 ?auto_621227 ) ) ( AVAILABLE ?auto_621227 ) ( SURFACE-AT ?auto_621221 ?auto_621224 ) ( ON ?auto_621221 ?auto_621223 ) ( CLEAR ?auto_621221 ) ( not ( = ?auto_621220 ?auto_621223 ) ) ( not ( = ?auto_621221 ?auto_621223 ) ) ( not ( = ?auto_621219 ?auto_621223 ) ) ( TRUCK-AT ?auto_621226 ?auto_621222 ) ( SURFACE-AT ?auto_621219 ?auto_621222 ) ( CLEAR ?auto_621219 ) ( IS-CRATE ?auto_621220 ) ( AVAILABLE ?auto_621225 ) ( IN ?auto_621220 ?auto_621226 ) ( ON ?auto_621211 ?auto_621210 ) ( ON ?auto_621212 ?auto_621211 ) ( ON ?auto_621214 ?auto_621212 ) ( ON ?auto_621213 ?auto_621214 ) ( ON ?auto_621215 ?auto_621213 ) ( ON ?auto_621216 ?auto_621215 ) ( ON ?auto_621217 ?auto_621216 ) ( ON ?auto_621218 ?auto_621217 ) ( ON ?auto_621219 ?auto_621218 ) ( not ( = ?auto_621210 ?auto_621211 ) ) ( not ( = ?auto_621210 ?auto_621212 ) ) ( not ( = ?auto_621210 ?auto_621214 ) ) ( not ( = ?auto_621210 ?auto_621213 ) ) ( not ( = ?auto_621210 ?auto_621215 ) ) ( not ( = ?auto_621210 ?auto_621216 ) ) ( not ( = ?auto_621210 ?auto_621217 ) ) ( not ( = ?auto_621210 ?auto_621218 ) ) ( not ( = ?auto_621210 ?auto_621219 ) ) ( not ( = ?auto_621210 ?auto_621220 ) ) ( not ( = ?auto_621210 ?auto_621221 ) ) ( not ( = ?auto_621210 ?auto_621223 ) ) ( not ( = ?auto_621211 ?auto_621212 ) ) ( not ( = ?auto_621211 ?auto_621214 ) ) ( not ( = ?auto_621211 ?auto_621213 ) ) ( not ( = ?auto_621211 ?auto_621215 ) ) ( not ( = ?auto_621211 ?auto_621216 ) ) ( not ( = ?auto_621211 ?auto_621217 ) ) ( not ( = ?auto_621211 ?auto_621218 ) ) ( not ( = ?auto_621211 ?auto_621219 ) ) ( not ( = ?auto_621211 ?auto_621220 ) ) ( not ( = ?auto_621211 ?auto_621221 ) ) ( not ( = ?auto_621211 ?auto_621223 ) ) ( not ( = ?auto_621212 ?auto_621214 ) ) ( not ( = ?auto_621212 ?auto_621213 ) ) ( not ( = ?auto_621212 ?auto_621215 ) ) ( not ( = ?auto_621212 ?auto_621216 ) ) ( not ( = ?auto_621212 ?auto_621217 ) ) ( not ( = ?auto_621212 ?auto_621218 ) ) ( not ( = ?auto_621212 ?auto_621219 ) ) ( not ( = ?auto_621212 ?auto_621220 ) ) ( not ( = ?auto_621212 ?auto_621221 ) ) ( not ( = ?auto_621212 ?auto_621223 ) ) ( not ( = ?auto_621214 ?auto_621213 ) ) ( not ( = ?auto_621214 ?auto_621215 ) ) ( not ( = ?auto_621214 ?auto_621216 ) ) ( not ( = ?auto_621214 ?auto_621217 ) ) ( not ( = ?auto_621214 ?auto_621218 ) ) ( not ( = ?auto_621214 ?auto_621219 ) ) ( not ( = ?auto_621214 ?auto_621220 ) ) ( not ( = ?auto_621214 ?auto_621221 ) ) ( not ( = ?auto_621214 ?auto_621223 ) ) ( not ( = ?auto_621213 ?auto_621215 ) ) ( not ( = ?auto_621213 ?auto_621216 ) ) ( not ( = ?auto_621213 ?auto_621217 ) ) ( not ( = ?auto_621213 ?auto_621218 ) ) ( not ( = ?auto_621213 ?auto_621219 ) ) ( not ( = ?auto_621213 ?auto_621220 ) ) ( not ( = ?auto_621213 ?auto_621221 ) ) ( not ( = ?auto_621213 ?auto_621223 ) ) ( not ( = ?auto_621215 ?auto_621216 ) ) ( not ( = ?auto_621215 ?auto_621217 ) ) ( not ( = ?auto_621215 ?auto_621218 ) ) ( not ( = ?auto_621215 ?auto_621219 ) ) ( not ( = ?auto_621215 ?auto_621220 ) ) ( not ( = ?auto_621215 ?auto_621221 ) ) ( not ( = ?auto_621215 ?auto_621223 ) ) ( not ( = ?auto_621216 ?auto_621217 ) ) ( not ( = ?auto_621216 ?auto_621218 ) ) ( not ( = ?auto_621216 ?auto_621219 ) ) ( not ( = ?auto_621216 ?auto_621220 ) ) ( not ( = ?auto_621216 ?auto_621221 ) ) ( not ( = ?auto_621216 ?auto_621223 ) ) ( not ( = ?auto_621217 ?auto_621218 ) ) ( not ( = ?auto_621217 ?auto_621219 ) ) ( not ( = ?auto_621217 ?auto_621220 ) ) ( not ( = ?auto_621217 ?auto_621221 ) ) ( not ( = ?auto_621217 ?auto_621223 ) ) ( not ( = ?auto_621218 ?auto_621219 ) ) ( not ( = ?auto_621218 ?auto_621220 ) ) ( not ( = ?auto_621218 ?auto_621221 ) ) ( not ( = ?auto_621218 ?auto_621223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621219 ?auto_621220 ?auto_621221 )
      ( MAKE-11CRATE-VERIFY ?auto_621210 ?auto_621211 ?auto_621212 ?auto_621214 ?auto_621213 ?auto_621215 ?auto_621216 ?auto_621217 ?auto_621218 ?auto_621219 ?auto_621220 ?auto_621221 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630477 - SURFACE
      ?auto_630478 - SURFACE
      ?auto_630479 - SURFACE
      ?auto_630481 - SURFACE
      ?auto_630480 - SURFACE
      ?auto_630482 - SURFACE
      ?auto_630483 - SURFACE
      ?auto_630484 - SURFACE
      ?auto_630485 - SURFACE
      ?auto_630486 - SURFACE
      ?auto_630487 - SURFACE
      ?auto_630488 - SURFACE
      ?auto_630489 - SURFACE
    )
    :vars
    (
      ?auto_630490 - HOIST
      ?auto_630491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630490 ?auto_630491 ) ( SURFACE-AT ?auto_630488 ?auto_630491 ) ( CLEAR ?auto_630488 ) ( LIFTING ?auto_630490 ?auto_630489 ) ( IS-CRATE ?auto_630489 ) ( not ( = ?auto_630488 ?auto_630489 ) ) ( ON ?auto_630478 ?auto_630477 ) ( ON ?auto_630479 ?auto_630478 ) ( ON ?auto_630481 ?auto_630479 ) ( ON ?auto_630480 ?auto_630481 ) ( ON ?auto_630482 ?auto_630480 ) ( ON ?auto_630483 ?auto_630482 ) ( ON ?auto_630484 ?auto_630483 ) ( ON ?auto_630485 ?auto_630484 ) ( ON ?auto_630486 ?auto_630485 ) ( ON ?auto_630487 ?auto_630486 ) ( ON ?auto_630488 ?auto_630487 ) ( not ( = ?auto_630477 ?auto_630478 ) ) ( not ( = ?auto_630477 ?auto_630479 ) ) ( not ( = ?auto_630477 ?auto_630481 ) ) ( not ( = ?auto_630477 ?auto_630480 ) ) ( not ( = ?auto_630477 ?auto_630482 ) ) ( not ( = ?auto_630477 ?auto_630483 ) ) ( not ( = ?auto_630477 ?auto_630484 ) ) ( not ( = ?auto_630477 ?auto_630485 ) ) ( not ( = ?auto_630477 ?auto_630486 ) ) ( not ( = ?auto_630477 ?auto_630487 ) ) ( not ( = ?auto_630477 ?auto_630488 ) ) ( not ( = ?auto_630477 ?auto_630489 ) ) ( not ( = ?auto_630478 ?auto_630479 ) ) ( not ( = ?auto_630478 ?auto_630481 ) ) ( not ( = ?auto_630478 ?auto_630480 ) ) ( not ( = ?auto_630478 ?auto_630482 ) ) ( not ( = ?auto_630478 ?auto_630483 ) ) ( not ( = ?auto_630478 ?auto_630484 ) ) ( not ( = ?auto_630478 ?auto_630485 ) ) ( not ( = ?auto_630478 ?auto_630486 ) ) ( not ( = ?auto_630478 ?auto_630487 ) ) ( not ( = ?auto_630478 ?auto_630488 ) ) ( not ( = ?auto_630478 ?auto_630489 ) ) ( not ( = ?auto_630479 ?auto_630481 ) ) ( not ( = ?auto_630479 ?auto_630480 ) ) ( not ( = ?auto_630479 ?auto_630482 ) ) ( not ( = ?auto_630479 ?auto_630483 ) ) ( not ( = ?auto_630479 ?auto_630484 ) ) ( not ( = ?auto_630479 ?auto_630485 ) ) ( not ( = ?auto_630479 ?auto_630486 ) ) ( not ( = ?auto_630479 ?auto_630487 ) ) ( not ( = ?auto_630479 ?auto_630488 ) ) ( not ( = ?auto_630479 ?auto_630489 ) ) ( not ( = ?auto_630481 ?auto_630480 ) ) ( not ( = ?auto_630481 ?auto_630482 ) ) ( not ( = ?auto_630481 ?auto_630483 ) ) ( not ( = ?auto_630481 ?auto_630484 ) ) ( not ( = ?auto_630481 ?auto_630485 ) ) ( not ( = ?auto_630481 ?auto_630486 ) ) ( not ( = ?auto_630481 ?auto_630487 ) ) ( not ( = ?auto_630481 ?auto_630488 ) ) ( not ( = ?auto_630481 ?auto_630489 ) ) ( not ( = ?auto_630480 ?auto_630482 ) ) ( not ( = ?auto_630480 ?auto_630483 ) ) ( not ( = ?auto_630480 ?auto_630484 ) ) ( not ( = ?auto_630480 ?auto_630485 ) ) ( not ( = ?auto_630480 ?auto_630486 ) ) ( not ( = ?auto_630480 ?auto_630487 ) ) ( not ( = ?auto_630480 ?auto_630488 ) ) ( not ( = ?auto_630480 ?auto_630489 ) ) ( not ( = ?auto_630482 ?auto_630483 ) ) ( not ( = ?auto_630482 ?auto_630484 ) ) ( not ( = ?auto_630482 ?auto_630485 ) ) ( not ( = ?auto_630482 ?auto_630486 ) ) ( not ( = ?auto_630482 ?auto_630487 ) ) ( not ( = ?auto_630482 ?auto_630488 ) ) ( not ( = ?auto_630482 ?auto_630489 ) ) ( not ( = ?auto_630483 ?auto_630484 ) ) ( not ( = ?auto_630483 ?auto_630485 ) ) ( not ( = ?auto_630483 ?auto_630486 ) ) ( not ( = ?auto_630483 ?auto_630487 ) ) ( not ( = ?auto_630483 ?auto_630488 ) ) ( not ( = ?auto_630483 ?auto_630489 ) ) ( not ( = ?auto_630484 ?auto_630485 ) ) ( not ( = ?auto_630484 ?auto_630486 ) ) ( not ( = ?auto_630484 ?auto_630487 ) ) ( not ( = ?auto_630484 ?auto_630488 ) ) ( not ( = ?auto_630484 ?auto_630489 ) ) ( not ( = ?auto_630485 ?auto_630486 ) ) ( not ( = ?auto_630485 ?auto_630487 ) ) ( not ( = ?auto_630485 ?auto_630488 ) ) ( not ( = ?auto_630485 ?auto_630489 ) ) ( not ( = ?auto_630486 ?auto_630487 ) ) ( not ( = ?auto_630486 ?auto_630488 ) ) ( not ( = ?auto_630486 ?auto_630489 ) ) ( not ( = ?auto_630487 ?auto_630488 ) ) ( not ( = ?auto_630487 ?auto_630489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_630488 ?auto_630489 )
      ( MAKE-12CRATE-VERIFY ?auto_630477 ?auto_630478 ?auto_630479 ?auto_630481 ?auto_630480 ?auto_630482 ?auto_630483 ?auto_630484 ?auto_630485 ?auto_630486 ?auto_630487 ?auto_630488 ?auto_630489 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630602 - SURFACE
      ?auto_630603 - SURFACE
      ?auto_630604 - SURFACE
      ?auto_630606 - SURFACE
      ?auto_630605 - SURFACE
      ?auto_630607 - SURFACE
      ?auto_630608 - SURFACE
      ?auto_630609 - SURFACE
      ?auto_630610 - SURFACE
      ?auto_630611 - SURFACE
      ?auto_630612 - SURFACE
      ?auto_630613 - SURFACE
      ?auto_630614 - SURFACE
    )
    :vars
    (
      ?auto_630615 - HOIST
      ?auto_630616 - PLACE
      ?auto_630617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_630615 ?auto_630616 ) ( SURFACE-AT ?auto_630613 ?auto_630616 ) ( CLEAR ?auto_630613 ) ( IS-CRATE ?auto_630614 ) ( not ( = ?auto_630613 ?auto_630614 ) ) ( TRUCK-AT ?auto_630617 ?auto_630616 ) ( AVAILABLE ?auto_630615 ) ( IN ?auto_630614 ?auto_630617 ) ( ON ?auto_630613 ?auto_630612 ) ( not ( = ?auto_630612 ?auto_630613 ) ) ( not ( = ?auto_630612 ?auto_630614 ) ) ( ON ?auto_630603 ?auto_630602 ) ( ON ?auto_630604 ?auto_630603 ) ( ON ?auto_630606 ?auto_630604 ) ( ON ?auto_630605 ?auto_630606 ) ( ON ?auto_630607 ?auto_630605 ) ( ON ?auto_630608 ?auto_630607 ) ( ON ?auto_630609 ?auto_630608 ) ( ON ?auto_630610 ?auto_630609 ) ( ON ?auto_630611 ?auto_630610 ) ( ON ?auto_630612 ?auto_630611 ) ( not ( = ?auto_630602 ?auto_630603 ) ) ( not ( = ?auto_630602 ?auto_630604 ) ) ( not ( = ?auto_630602 ?auto_630606 ) ) ( not ( = ?auto_630602 ?auto_630605 ) ) ( not ( = ?auto_630602 ?auto_630607 ) ) ( not ( = ?auto_630602 ?auto_630608 ) ) ( not ( = ?auto_630602 ?auto_630609 ) ) ( not ( = ?auto_630602 ?auto_630610 ) ) ( not ( = ?auto_630602 ?auto_630611 ) ) ( not ( = ?auto_630602 ?auto_630612 ) ) ( not ( = ?auto_630602 ?auto_630613 ) ) ( not ( = ?auto_630602 ?auto_630614 ) ) ( not ( = ?auto_630603 ?auto_630604 ) ) ( not ( = ?auto_630603 ?auto_630606 ) ) ( not ( = ?auto_630603 ?auto_630605 ) ) ( not ( = ?auto_630603 ?auto_630607 ) ) ( not ( = ?auto_630603 ?auto_630608 ) ) ( not ( = ?auto_630603 ?auto_630609 ) ) ( not ( = ?auto_630603 ?auto_630610 ) ) ( not ( = ?auto_630603 ?auto_630611 ) ) ( not ( = ?auto_630603 ?auto_630612 ) ) ( not ( = ?auto_630603 ?auto_630613 ) ) ( not ( = ?auto_630603 ?auto_630614 ) ) ( not ( = ?auto_630604 ?auto_630606 ) ) ( not ( = ?auto_630604 ?auto_630605 ) ) ( not ( = ?auto_630604 ?auto_630607 ) ) ( not ( = ?auto_630604 ?auto_630608 ) ) ( not ( = ?auto_630604 ?auto_630609 ) ) ( not ( = ?auto_630604 ?auto_630610 ) ) ( not ( = ?auto_630604 ?auto_630611 ) ) ( not ( = ?auto_630604 ?auto_630612 ) ) ( not ( = ?auto_630604 ?auto_630613 ) ) ( not ( = ?auto_630604 ?auto_630614 ) ) ( not ( = ?auto_630606 ?auto_630605 ) ) ( not ( = ?auto_630606 ?auto_630607 ) ) ( not ( = ?auto_630606 ?auto_630608 ) ) ( not ( = ?auto_630606 ?auto_630609 ) ) ( not ( = ?auto_630606 ?auto_630610 ) ) ( not ( = ?auto_630606 ?auto_630611 ) ) ( not ( = ?auto_630606 ?auto_630612 ) ) ( not ( = ?auto_630606 ?auto_630613 ) ) ( not ( = ?auto_630606 ?auto_630614 ) ) ( not ( = ?auto_630605 ?auto_630607 ) ) ( not ( = ?auto_630605 ?auto_630608 ) ) ( not ( = ?auto_630605 ?auto_630609 ) ) ( not ( = ?auto_630605 ?auto_630610 ) ) ( not ( = ?auto_630605 ?auto_630611 ) ) ( not ( = ?auto_630605 ?auto_630612 ) ) ( not ( = ?auto_630605 ?auto_630613 ) ) ( not ( = ?auto_630605 ?auto_630614 ) ) ( not ( = ?auto_630607 ?auto_630608 ) ) ( not ( = ?auto_630607 ?auto_630609 ) ) ( not ( = ?auto_630607 ?auto_630610 ) ) ( not ( = ?auto_630607 ?auto_630611 ) ) ( not ( = ?auto_630607 ?auto_630612 ) ) ( not ( = ?auto_630607 ?auto_630613 ) ) ( not ( = ?auto_630607 ?auto_630614 ) ) ( not ( = ?auto_630608 ?auto_630609 ) ) ( not ( = ?auto_630608 ?auto_630610 ) ) ( not ( = ?auto_630608 ?auto_630611 ) ) ( not ( = ?auto_630608 ?auto_630612 ) ) ( not ( = ?auto_630608 ?auto_630613 ) ) ( not ( = ?auto_630608 ?auto_630614 ) ) ( not ( = ?auto_630609 ?auto_630610 ) ) ( not ( = ?auto_630609 ?auto_630611 ) ) ( not ( = ?auto_630609 ?auto_630612 ) ) ( not ( = ?auto_630609 ?auto_630613 ) ) ( not ( = ?auto_630609 ?auto_630614 ) ) ( not ( = ?auto_630610 ?auto_630611 ) ) ( not ( = ?auto_630610 ?auto_630612 ) ) ( not ( = ?auto_630610 ?auto_630613 ) ) ( not ( = ?auto_630610 ?auto_630614 ) ) ( not ( = ?auto_630611 ?auto_630612 ) ) ( not ( = ?auto_630611 ?auto_630613 ) ) ( not ( = ?auto_630611 ?auto_630614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_630612 ?auto_630613 ?auto_630614 )
      ( MAKE-12CRATE-VERIFY ?auto_630602 ?auto_630603 ?auto_630604 ?auto_630606 ?auto_630605 ?auto_630607 ?auto_630608 ?auto_630609 ?auto_630610 ?auto_630611 ?auto_630612 ?auto_630613 ?auto_630614 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630740 - SURFACE
      ?auto_630741 - SURFACE
      ?auto_630742 - SURFACE
      ?auto_630744 - SURFACE
      ?auto_630743 - SURFACE
      ?auto_630745 - SURFACE
      ?auto_630746 - SURFACE
      ?auto_630747 - SURFACE
      ?auto_630748 - SURFACE
      ?auto_630749 - SURFACE
      ?auto_630750 - SURFACE
      ?auto_630751 - SURFACE
      ?auto_630752 - SURFACE
    )
    :vars
    (
      ?auto_630753 - HOIST
      ?auto_630754 - PLACE
      ?auto_630755 - TRUCK
      ?auto_630756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630753 ?auto_630754 ) ( SURFACE-AT ?auto_630751 ?auto_630754 ) ( CLEAR ?auto_630751 ) ( IS-CRATE ?auto_630752 ) ( not ( = ?auto_630751 ?auto_630752 ) ) ( AVAILABLE ?auto_630753 ) ( IN ?auto_630752 ?auto_630755 ) ( ON ?auto_630751 ?auto_630750 ) ( not ( = ?auto_630750 ?auto_630751 ) ) ( not ( = ?auto_630750 ?auto_630752 ) ) ( TRUCK-AT ?auto_630755 ?auto_630756 ) ( not ( = ?auto_630756 ?auto_630754 ) ) ( ON ?auto_630741 ?auto_630740 ) ( ON ?auto_630742 ?auto_630741 ) ( ON ?auto_630744 ?auto_630742 ) ( ON ?auto_630743 ?auto_630744 ) ( ON ?auto_630745 ?auto_630743 ) ( ON ?auto_630746 ?auto_630745 ) ( ON ?auto_630747 ?auto_630746 ) ( ON ?auto_630748 ?auto_630747 ) ( ON ?auto_630749 ?auto_630748 ) ( ON ?auto_630750 ?auto_630749 ) ( not ( = ?auto_630740 ?auto_630741 ) ) ( not ( = ?auto_630740 ?auto_630742 ) ) ( not ( = ?auto_630740 ?auto_630744 ) ) ( not ( = ?auto_630740 ?auto_630743 ) ) ( not ( = ?auto_630740 ?auto_630745 ) ) ( not ( = ?auto_630740 ?auto_630746 ) ) ( not ( = ?auto_630740 ?auto_630747 ) ) ( not ( = ?auto_630740 ?auto_630748 ) ) ( not ( = ?auto_630740 ?auto_630749 ) ) ( not ( = ?auto_630740 ?auto_630750 ) ) ( not ( = ?auto_630740 ?auto_630751 ) ) ( not ( = ?auto_630740 ?auto_630752 ) ) ( not ( = ?auto_630741 ?auto_630742 ) ) ( not ( = ?auto_630741 ?auto_630744 ) ) ( not ( = ?auto_630741 ?auto_630743 ) ) ( not ( = ?auto_630741 ?auto_630745 ) ) ( not ( = ?auto_630741 ?auto_630746 ) ) ( not ( = ?auto_630741 ?auto_630747 ) ) ( not ( = ?auto_630741 ?auto_630748 ) ) ( not ( = ?auto_630741 ?auto_630749 ) ) ( not ( = ?auto_630741 ?auto_630750 ) ) ( not ( = ?auto_630741 ?auto_630751 ) ) ( not ( = ?auto_630741 ?auto_630752 ) ) ( not ( = ?auto_630742 ?auto_630744 ) ) ( not ( = ?auto_630742 ?auto_630743 ) ) ( not ( = ?auto_630742 ?auto_630745 ) ) ( not ( = ?auto_630742 ?auto_630746 ) ) ( not ( = ?auto_630742 ?auto_630747 ) ) ( not ( = ?auto_630742 ?auto_630748 ) ) ( not ( = ?auto_630742 ?auto_630749 ) ) ( not ( = ?auto_630742 ?auto_630750 ) ) ( not ( = ?auto_630742 ?auto_630751 ) ) ( not ( = ?auto_630742 ?auto_630752 ) ) ( not ( = ?auto_630744 ?auto_630743 ) ) ( not ( = ?auto_630744 ?auto_630745 ) ) ( not ( = ?auto_630744 ?auto_630746 ) ) ( not ( = ?auto_630744 ?auto_630747 ) ) ( not ( = ?auto_630744 ?auto_630748 ) ) ( not ( = ?auto_630744 ?auto_630749 ) ) ( not ( = ?auto_630744 ?auto_630750 ) ) ( not ( = ?auto_630744 ?auto_630751 ) ) ( not ( = ?auto_630744 ?auto_630752 ) ) ( not ( = ?auto_630743 ?auto_630745 ) ) ( not ( = ?auto_630743 ?auto_630746 ) ) ( not ( = ?auto_630743 ?auto_630747 ) ) ( not ( = ?auto_630743 ?auto_630748 ) ) ( not ( = ?auto_630743 ?auto_630749 ) ) ( not ( = ?auto_630743 ?auto_630750 ) ) ( not ( = ?auto_630743 ?auto_630751 ) ) ( not ( = ?auto_630743 ?auto_630752 ) ) ( not ( = ?auto_630745 ?auto_630746 ) ) ( not ( = ?auto_630745 ?auto_630747 ) ) ( not ( = ?auto_630745 ?auto_630748 ) ) ( not ( = ?auto_630745 ?auto_630749 ) ) ( not ( = ?auto_630745 ?auto_630750 ) ) ( not ( = ?auto_630745 ?auto_630751 ) ) ( not ( = ?auto_630745 ?auto_630752 ) ) ( not ( = ?auto_630746 ?auto_630747 ) ) ( not ( = ?auto_630746 ?auto_630748 ) ) ( not ( = ?auto_630746 ?auto_630749 ) ) ( not ( = ?auto_630746 ?auto_630750 ) ) ( not ( = ?auto_630746 ?auto_630751 ) ) ( not ( = ?auto_630746 ?auto_630752 ) ) ( not ( = ?auto_630747 ?auto_630748 ) ) ( not ( = ?auto_630747 ?auto_630749 ) ) ( not ( = ?auto_630747 ?auto_630750 ) ) ( not ( = ?auto_630747 ?auto_630751 ) ) ( not ( = ?auto_630747 ?auto_630752 ) ) ( not ( = ?auto_630748 ?auto_630749 ) ) ( not ( = ?auto_630748 ?auto_630750 ) ) ( not ( = ?auto_630748 ?auto_630751 ) ) ( not ( = ?auto_630748 ?auto_630752 ) ) ( not ( = ?auto_630749 ?auto_630750 ) ) ( not ( = ?auto_630749 ?auto_630751 ) ) ( not ( = ?auto_630749 ?auto_630752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_630750 ?auto_630751 ?auto_630752 )
      ( MAKE-12CRATE-VERIFY ?auto_630740 ?auto_630741 ?auto_630742 ?auto_630744 ?auto_630743 ?auto_630745 ?auto_630746 ?auto_630747 ?auto_630748 ?auto_630749 ?auto_630750 ?auto_630751 ?auto_630752 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630890 - SURFACE
      ?auto_630891 - SURFACE
      ?auto_630892 - SURFACE
      ?auto_630894 - SURFACE
      ?auto_630893 - SURFACE
      ?auto_630895 - SURFACE
      ?auto_630896 - SURFACE
      ?auto_630897 - SURFACE
      ?auto_630898 - SURFACE
      ?auto_630899 - SURFACE
      ?auto_630900 - SURFACE
      ?auto_630901 - SURFACE
      ?auto_630902 - SURFACE
    )
    :vars
    (
      ?auto_630905 - HOIST
      ?auto_630906 - PLACE
      ?auto_630907 - TRUCK
      ?auto_630904 - PLACE
      ?auto_630903 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_630905 ?auto_630906 ) ( SURFACE-AT ?auto_630901 ?auto_630906 ) ( CLEAR ?auto_630901 ) ( IS-CRATE ?auto_630902 ) ( not ( = ?auto_630901 ?auto_630902 ) ) ( AVAILABLE ?auto_630905 ) ( ON ?auto_630901 ?auto_630900 ) ( not ( = ?auto_630900 ?auto_630901 ) ) ( not ( = ?auto_630900 ?auto_630902 ) ) ( TRUCK-AT ?auto_630907 ?auto_630904 ) ( not ( = ?auto_630904 ?auto_630906 ) ) ( HOIST-AT ?auto_630903 ?auto_630904 ) ( LIFTING ?auto_630903 ?auto_630902 ) ( not ( = ?auto_630905 ?auto_630903 ) ) ( ON ?auto_630891 ?auto_630890 ) ( ON ?auto_630892 ?auto_630891 ) ( ON ?auto_630894 ?auto_630892 ) ( ON ?auto_630893 ?auto_630894 ) ( ON ?auto_630895 ?auto_630893 ) ( ON ?auto_630896 ?auto_630895 ) ( ON ?auto_630897 ?auto_630896 ) ( ON ?auto_630898 ?auto_630897 ) ( ON ?auto_630899 ?auto_630898 ) ( ON ?auto_630900 ?auto_630899 ) ( not ( = ?auto_630890 ?auto_630891 ) ) ( not ( = ?auto_630890 ?auto_630892 ) ) ( not ( = ?auto_630890 ?auto_630894 ) ) ( not ( = ?auto_630890 ?auto_630893 ) ) ( not ( = ?auto_630890 ?auto_630895 ) ) ( not ( = ?auto_630890 ?auto_630896 ) ) ( not ( = ?auto_630890 ?auto_630897 ) ) ( not ( = ?auto_630890 ?auto_630898 ) ) ( not ( = ?auto_630890 ?auto_630899 ) ) ( not ( = ?auto_630890 ?auto_630900 ) ) ( not ( = ?auto_630890 ?auto_630901 ) ) ( not ( = ?auto_630890 ?auto_630902 ) ) ( not ( = ?auto_630891 ?auto_630892 ) ) ( not ( = ?auto_630891 ?auto_630894 ) ) ( not ( = ?auto_630891 ?auto_630893 ) ) ( not ( = ?auto_630891 ?auto_630895 ) ) ( not ( = ?auto_630891 ?auto_630896 ) ) ( not ( = ?auto_630891 ?auto_630897 ) ) ( not ( = ?auto_630891 ?auto_630898 ) ) ( not ( = ?auto_630891 ?auto_630899 ) ) ( not ( = ?auto_630891 ?auto_630900 ) ) ( not ( = ?auto_630891 ?auto_630901 ) ) ( not ( = ?auto_630891 ?auto_630902 ) ) ( not ( = ?auto_630892 ?auto_630894 ) ) ( not ( = ?auto_630892 ?auto_630893 ) ) ( not ( = ?auto_630892 ?auto_630895 ) ) ( not ( = ?auto_630892 ?auto_630896 ) ) ( not ( = ?auto_630892 ?auto_630897 ) ) ( not ( = ?auto_630892 ?auto_630898 ) ) ( not ( = ?auto_630892 ?auto_630899 ) ) ( not ( = ?auto_630892 ?auto_630900 ) ) ( not ( = ?auto_630892 ?auto_630901 ) ) ( not ( = ?auto_630892 ?auto_630902 ) ) ( not ( = ?auto_630894 ?auto_630893 ) ) ( not ( = ?auto_630894 ?auto_630895 ) ) ( not ( = ?auto_630894 ?auto_630896 ) ) ( not ( = ?auto_630894 ?auto_630897 ) ) ( not ( = ?auto_630894 ?auto_630898 ) ) ( not ( = ?auto_630894 ?auto_630899 ) ) ( not ( = ?auto_630894 ?auto_630900 ) ) ( not ( = ?auto_630894 ?auto_630901 ) ) ( not ( = ?auto_630894 ?auto_630902 ) ) ( not ( = ?auto_630893 ?auto_630895 ) ) ( not ( = ?auto_630893 ?auto_630896 ) ) ( not ( = ?auto_630893 ?auto_630897 ) ) ( not ( = ?auto_630893 ?auto_630898 ) ) ( not ( = ?auto_630893 ?auto_630899 ) ) ( not ( = ?auto_630893 ?auto_630900 ) ) ( not ( = ?auto_630893 ?auto_630901 ) ) ( not ( = ?auto_630893 ?auto_630902 ) ) ( not ( = ?auto_630895 ?auto_630896 ) ) ( not ( = ?auto_630895 ?auto_630897 ) ) ( not ( = ?auto_630895 ?auto_630898 ) ) ( not ( = ?auto_630895 ?auto_630899 ) ) ( not ( = ?auto_630895 ?auto_630900 ) ) ( not ( = ?auto_630895 ?auto_630901 ) ) ( not ( = ?auto_630895 ?auto_630902 ) ) ( not ( = ?auto_630896 ?auto_630897 ) ) ( not ( = ?auto_630896 ?auto_630898 ) ) ( not ( = ?auto_630896 ?auto_630899 ) ) ( not ( = ?auto_630896 ?auto_630900 ) ) ( not ( = ?auto_630896 ?auto_630901 ) ) ( not ( = ?auto_630896 ?auto_630902 ) ) ( not ( = ?auto_630897 ?auto_630898 ) ) ( not ( = ?auto_630897 ?auto_630899 ) ) ( not ( = ?auto_630897 ?auto_630900 ) ) ( not ( = ?auto_630897 ?auto_630901 ) ) ( not ( = ?auto_630897 ?auto_630902 ) ) ( not ( = ?auto_630898 ?auto_630899 ) ) ( not ( = ?auto_630898 ?auto_630900 ) ) ( not ( = ?auto_630898 ?auto_630901 ) ) ( not ( = ?auto_630898 ?auto_630902 ) ) ( not ( = ?auto_630899 ?auto_630900 ) ) ( not ( = ?auto_630899 ?auto_630901 ) ) ( not ( = ?auto_630899 ?auto_630902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_630900 ?auto_630901 ?auto_630902 )
      ( MAKE-12CRATE-VERIFY ?auto_630890 ?auto_630891 ?auto_630892 ?auto_630894 ?auto_630893 ?auto_630895 ?auto_630896 ?auto_630897 ?auto_630898 ?auto_630899 ?auto_630900 ?auto_630901 ?auto_630902 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631052 - SURFACE
      ?auto_631053 - SURFACE
      ?auto_631054 - SURFACE
      ?auto_631056 - SURFACE
      ?auto_631055 - SURFACE
      ?auto_631057 - SURFACE
      ?auto_631058 - SURFACE
      ?auto_631059 - SURFACE
      ?auto_631060 - SURFACE
      ?auto_631061 - SURFACE
      ?auto_631062 - SURFACE
      ?auto_631063 - SURFACE
      ?auto_631064 - SURFACE
    )
    :vars
    (
      ?auto_631070 - HOIST
      ?auto_631067 - PLACE
      ?auto_631066 - TRUCK
      ?auto_631068 - PLACE
      ?auto_631069 - HOIST
      ?auto_631065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631070 ?auto_631067 ) ( SURFACE-AT ?auto_631063 ?auto_631067 ) ( CLEAR ?auto_631063 ) ( IS-CRATE ?auto_631064 ) ( not ( = ?auto_631063 ?auto_631064 ) ) ( AVAILABLE ?auto_631070 ) ( ON ?auto_631063 ?auto_631062 ) ( not ( = ?auto_631062 ?auto_631063 ) ) ( not ( = ?auto_631062 ?auto_631064 ) ) ( TRUCK-AT ?auto_631066 ?auto_631068 ) ( not ( = ?auto_631068 ?auto_631067 ) ) ( HOIST-AT ?auto_631069 ?auto_631068 ) ( not ( = ?auto_631070 ?auto_631069 ) ) ( AVAILABLE ?auto_631069 ) ( SURFACE-AT ?auto_631064 ?auto_631068 ) ( ON ?auto_631064 ?auto_631065 ) ( CLEAR ?auto_631064 ) ( not ( = ?auto_631063 ?auto_631065 ) ) ( not ( = ?auto_631064 ?auto_631065 ) ) ( not ( = ?auto_631062 ?auto_631065 ) ) ( ON ?auto_631053 ?auto_631052 ) ( ON ?auto_631054 ?auto_631053 ) ( ON ?auto_631056 ?auto_631054 ) ( ON ?auto_631055 ?auto_631056 ) ( ON ?auto_631057 ?auto_631055 ) ( ON ?auto_631058 ?auto_631057 ) ( ON ?auto_631059 ?auto_631058 ) ( ON ?auto_631060 ?auto_631059 ) ( ON ?auto_631061 ?auto_631060 ) ( ON ?auto_631062 ?auto_631061 ) ( not ( = ?auto_631052 ?auto_631053 ) ) ( not ( = ?auto_631052 ?auto_631054 ) ) ( not ( = ?auto_631052 ?auto_631056 ) ) ( not ( = ?auto_631052 ?auto_631055 ) ) ( not ( = ?auto_631052 ?auto_631057 ) ) ( not ( = ?auto_631052 ?auto_631058 ) ) ( not ( = ?auto_631052 ?auto_631059 ) ) ( not ( = ?auto_631052 ?auto_631060 ) ) ( not ( = ?auto_631052 ?auto_631061 ) ) ( not ( = ?auto_631052 ?auto_631062 ) ) ( not ( = ?auto_631052 ?auto_631063 ) ) ( not ( = ?auto_631052 ?auto_631064 ) ) ( not ( = ?auto_631052 ?auto_631065 ) ) ( not ( = ?auto_631053 ?auto_631054 ) ) ( not ( = ?auto_631053 ?auto_631056 ) ) ( not ( = ?auto_631053 ?auto_631055 ) ) ( not ( = ?auto_631053 ?auto_631057 ) ) ( not ( = ?auto_631053 ?auto_631058 ) ) ( not ( = ?auto_631053 ?auto_631059 ) ) ( not ( = ?auto_631053 ?auto_631060 ) ) ( not ( = ?auto_631053 ?auto_631061 ) ) ( not ( = ?auto_631053 ?auto_631062 ) ) ( not ( = ?auto_631053 ?auto_631063 ) ) ( not ( = ?auto_631053 ?auto_631064 ) ) ( not ( = ?auto_631053 ?auto_631065 ) ) ( not ( = ?auto_631054 ?auto_631056 ) ) ( not ( = ?auto_631054 ?auto_631055 ) ) ( not ( = ?auto_631054 ?auto_631057 ) ) ( not ( = ?auto_631054 ?auto_631058 ) ) ( not ( = ?auto_631054 ?auto_631059 ) ) ( not ( = ?auto_631054 ?auto_631060 ) ) ( not ( = ?auto_631054 ?auto_631061 ) ) ( not ( = ?auto_631054 ?auto_631062 ) ) ( not ( = ?auto_631054 ?auto_631063 ) ) ( not ( = ?auto_631054 ?auto_631064 ) ) ( not ( = ?auto_631054 ?auto_631065 ) ) ( not ( = ?auto_631056 ?auto_631055 ) ) ( not ( = ?auto_631056 ?auto_631057 ) ) ( not ( = ?auto_631056 ?auto_631058 ) ) ( not ( = ?auto_631056 ?auto_631059 ) ) ( not ( = ?auto_631056 ?auto_631060 ) ) ( not ( = ?auto_631056 ?auto_631061 ) ) ( not ( = ?auto_631056 ?auto_631062 ) ) ( not ( = ?auto_631056 ?auto_631063 ) ) ( not ( = ?auto_631056 ?auto_631064 ) ) ( not ( = ?auto_631056 ?auto_631065 ) ) ( not ( = ?auto_631055 ?auto_631057 ) ) ( not ( = ?auto_631055 ?auto_631058 ) ) ( not ( = ?auto_631055 ?auto_631059 ) ) ( not ( = ?auto_631055 ?auto_631060 ) ) ( not ( = ?auto_631055 ?auto_631061 ) ) ( not ( = ?auto_631055 ?auto_631062 ) ) ( not ( = ?auto_631055 ?auto_631063 ) ) ( not ( = ?auto_631055 ?auto_631064 ) ) ( not ( = ?auto_631055 ?auto_631065 ) ) ( not ( = ?auto_631057 ?auto_631058 ) ) ( not ( = ?auto_631057 ?auto_631059 ) ) ( not ( = ?auto_631057 ?auto_631060 ) ) ( not ( = ?auto_631057 ?auto_631061 ) ) ( not ( = ?auto_631057 ?auto_631062 ) ) ( not ( = ?auto_631057 ?auto_631063 ) ) ( not ( = ?auto_631057 ?auto_631064 ) ) ( not ( = ?auto_631057 ?auto_631065 ) ) ( not ( = ?auto_631058 ?auto_631059 ) ) ( not ( = ?auto_631058 ?auto_631060 ) ) ( not ( = ?auto_631058 ?auto_631061 ) ) ( not ( = ?auto_631058 ?auto_631062 ) ) ( not ( = ?auto_631058 ?auto_631063 ) ) ( not ( = ?auto_631058 ?auto_631064 ) ) ( not ( = ?auto_631058 ?auto_631065 ) ) ( not ( = ?auto_631059 ?auto_631060 ) ) ( not ( = ?auto_631059 ?auto_631061 ) ) ( not ( = ?auto_631059 ?auto_631062 ) ) ( not ( = ?auto_631059 ?auto_631063 ) ) ( not ( = ?auto_631059 ?auto_631064 ) ) ( not ( = ?auto_631059 ?auto_631065 ) ) ( not ( = ?auto_631060 ?auto_631061 ) ) ( not ( = ?auto_631060 ?auto_631062 ) ) ( not ( = ?auto_631060 ?auto_631063 ) ) ( not ( = ?auto_631060 ?auto_631064 ) ) ( not ( = ?auto_631060 ?auto_631065 ) ) ( not ( = ?auto_631061 ?auto_631062 ) ) ( not ( = ?auto_631061 ?auto_631063 ) ) ( not ( = ?auto_631061 ?auto_631064 ) ) ( not ( = ?auto_631061 ?auto_631065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631062 ?auto_631063 ?auto_631064 )
      ( MAKE-12CRATE-VERIFY ?auto_631052 ?auto_631053 ?auto_631054 ?auto_631056 ?auto_631055 ?auto_631057 ?auto_631058 ?auto_631059 ?auto_631060 ?auto_631061 ?auto_631062 ?auto_631063 ?auto_631064 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631215 - SURFACE
      ?auto_631216 - SURFACE
      ?auto_631217 - SURFACE
      ?auto_631219 - SURFACE
      ?auto_631218 - SURFACE
      ?auto_631220 - SURFACE
      ?auto_631221 - SURFACE
      ?auto_631222 - SURFACE
      ?auto_631223 - SURFACE
      ?auto_631224 - SURFACE
      ?auto_631225 - SURFACE
      ?auto_631226 - SURFACE
      ?auto_631227 - SURFACE
    )
    :vars
    (
      ?auto_631231 - HOIST
      ?auto_631229 - PLACE
      ?auto_631232 - PLACE
      ?auto_631230 - HOIST
      ?auto_631233 - SURFACE
      ?auto_631228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631231 ?auto_631229 ) ( SURFACE-AT ?auto_631226 ?auto_631229 ) ( CLEAR ?auto_631226 ) ( IS-CRATE ?auto_631227 ) ( not ( = ?auto_631226 ?auto_631227 ) ) ( AVAILABLE ?auto_631231 ) ( ON ?auto_631226 ?auto_631225 ) ( not ( = ?auto_631225 ?auto_631226 ) ) ( not ( = ?auto_631225 ?auto_631227 ) ) ( not ( = ?auto_631232 ?auto_631229 ) ) ( HOIST-AT ?auto_631230 ?auto_631232 ) ( not ( = ?auto_631231 ?auto_631230 ) ) ( AVAILABLE ?auto_631230 ) ( SURFACE-AT ?auto_631227 ?auto_631232 ) ( ON ?auto_631227 ?auto_631233 ) ( CLEAR ?auto_631227 ) ( not ( = ?auto_631226 ?auto_631233 ) ) ( not ( = ?auto_631227 ?auto_631233 ) ) ( not ( = ?auto_631225 ?auto_631233 ) ) ( TRUCK-AT ?auto_631228 ?auto_631229 ) ( ON ?auto_631216 ?auto_631215 ) ( ON ?auto_631217 ?auto_631216 ) ( ON ?auto_631219 ?auto_631217 ) ( ON ?auto_631218 ?auto_631219 ) ( ON ?auto_631220 ?auto_631218 ) ( ON ?auto_631221 ?auto_631220 ) ( ON ?auto_631222 ?auto_631221 ) ( ON ?auto_631223 ?auto_631222 ) ( ON ?auto_631224 ?auto_631223 ) ( ON ?auto_631225 ?auto_631224 ) ( not ( = ?auto_631215 ?auto_631216 ) ) ( not ( = ?auto_631215 ?auto_631217 ) ) ( not ( = ?auto_631215 ?auto_631219 ) ) ( not ( = ?auto_631215 ?auto_631218 ) ) ( not ( = ?auto_631215 ?auto_631220 ) ) ( not ( = ?auto_631215 ?auto_631221 ) ) ( not ( = ?auto_631215 ?auto_631222 ) ) ( not ( = ?auto_631215 ?auto_631223 ) ) ( not ( = ?auto_631215 ?auto_631224 ) ) ( not ( = ?auto_631215 ?auto_631225 ) ) ( not ( = ?auto_631215 ?auto_631226 ) ) ( not ( = ?auto_631215 ?auto_631227 ) ) ( not ( = ?auto_631215 ?auto_631233 ) ) ( not ( = ?auto_631216 ?auto_631217 ) ) ( not ( = ?auto_631216 ?auto_631219 ) ) ( not ( = ?auto_631216 ?auto_631218 ) ) ( not ( = ?auto_631216 ?auto_631220 ) ) ( not ( = ?auto_631216 ?auto_631221 ) ) ( not ( = ?auto_631216 ?auto_631222 ) ) ( not ( = ?auto_631216 ?auto_631223 ) ) ( not ( = ?auto_631216 ?auto_631224 ) ) ( not ( = ?auto_631216 ?auto_631225 ) ) ( not ( = ?auto_631216 ?auto_631226 ) ) ( not ( = ?auto_631216 ?auto_631227 ) ) ( not ( = ?auto_631216 ?auto_631233 ) ) ( not ( = ?auto_631217 ?auto_631219 ) ) ( not ( = ?auto_631217 ?auto_631218 ) ) ( not ( = ?auto_631217 ?auto_631220 ) ) ( not ( = ?auto_631217 ?auto_631221 ) ) ( not ( = ?auto_631217 ?auto_631222 ) ) ( not ( = ?auto_631217 ?auto_631223 ) ) ( not ( = ?auto_631217 ?auto_631224 ) ) ( not ( = ?auto_631217 ?auto_631225 ) ) ( not ( = ?auto_631217 ?auto_631226 ) ) ( not ( = ?auto_631217 ?auto_631227 ) ) ( not ( = ?auto_631217 ?auto_631233 ) ) ( not ( = ?auto_631219 ?auto_631218 ) ) ( not ( = ?auto_631219 ?auto_631220 ) ) ( not ( = ?auto_631219 ?auto_631221 ) ) ( not ( = ?auto_631219 ?auto_631222 ) ) ( not ( = ?auto_631219 ?auto_631223 ) ) ( not ( = ?auto_631219 ?auto_631224 ) ) ( not ( = ?auto_631219 ?auto_631225 ) ) ( not ( = ?auto_631219 ?auto_631226 ) ) ( not ( = ?auto_631219 ?auto_631227 ) ) ( not ( = ?auto_631219 ?auto_631233 ) ) ( not ( = ?auto_631218 ?auto_631220 ) ) ( not ( = ?auto_631218 ?auto_631221 ) ) ( not ( = ?auto_631218 ?auto_631222 ) ) ( not ( = ?auto_631218 ?auto_631223 ) ) ( not ( = ?auto_631218 ?auto_631224 ) ) ( not ( = ?auto_631218 ?auto_631225 ) ) ( not ( = ?auto_631218 ?auto_631226 ) ) ( not ( = ?auto_631218 ?auto_631227 ) ) ( not ( = ?auto_631218 ?auto_631233 ) ) ( not ( = ?auto_631220 ?auto_631221 ) ) ( not ( = ?auto_631220 ?auto_631222 ) ) ( not ( = ?auto_631220 ?auto_631223 ) ) ( not ( = ?auto_631220 ?auto_631224 ) ) ( not ( = ?auto_631220 ?auto_631225 ) ) ( not ( = ?auto_631220 ?auto_631226 ) ) ( not ( = ?auto_631220 ?auto_631227 ) ) ( not ( = ?auto_631220 ?auto_631233 ) ) ( not ( = ?auto_631221 ?auto_631222 ) ) ( not ( = ?auto_631221 ?auto_631223 ) ) ( not ( = ?auto_631221 ?auto_631224 ) ) ( not ( = ?auto_631221 ?auto_631225 ) ) ( not ( = ?auto_631221 ?auto_631226 ) ) ( not ( = ?auto_631221 ?auto_631227 ) ) ( not ( = ?auto_631221 ?auto_631233 ) ) ( not ( = ?auto_631222 ?auto_631223 ) ) ( not ( = ?auto_631222 ?auto_631224 ) ) ( not ( = ?auto_631222 ?auto_631225 ) ) ( not ( = ?auto_631222 ?auto_631226 ) ) ( not ( = ?auto_631222 ?auto_631227 ) ) ( not ( = ?auto_631222 ?auto_631233 ) ) ( not ( = ?auto_631223 ?auto_631224 ) ) ( not ( = ?auto_631223 ?auto_631225 ) ) ( not ( = ?auto_631223 ?auto_631226 ) ) ( not ( = ?auto_631223 ?auto_631227 ) ) ( not ( = ?auto_631223 ?auto_631233 ) ) ( not ( = ?auto_631224 ?auto_631225 ) ) ( not ( = ?auto_631224 ?auto_631226 ) ) ( not ( = ?auto_631224 ?auto_631227 ) ) ( not ( = ?auto_631224 ?auto_631233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631225 ?auto_631226 ?auto_631227 )
      ( MAKE-12CRATE-VERIFY ?auto_631215 ?auto_631216 ?auto_631217 ?auto_631219 ?auto_631218 ?auto_631220 ?auto_631221 ?auto_631222 ?auto_631223 ?auto_631224 ?auto_631225 ?auto_631226 ?auto_631227 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631378 - SURFACE
      ?auto_631379 - SURFACE
      ?auto_631380 - SURFACE
      ?auto_631382 - SURFACE
      ?auto_631381 - SURFACE
      ?auto_631383 - SURFACE
      ?auto_631384 - SURFACE
      ?auto_631385 - SURFACE
      ?auto_631386 - SURFACE
      ?auto_631387 - SURFACE
      ?auto_631388 - SURFACE
      ?auto_631389 - SURFACE
      ?auto_631390 - SURFACE
    )
    :vars
    (
      ?auto_631396 - HOIST
      ?auto_631394 - PLACE
      ?auto_631391 - PLACE
      ?auto_631392 - HOIST
      ?auto_631395 - SURFACE
      ?auto_631393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631396 ?auto_631394 ) ( IS-CRATE ?auto_631390 ) ( not ( = ?auto_631389 ?auto_631390 ) ) ( not ( = ?auto_631388 ?auto_631389 ) ) ( not ( = ?auto_631388 ?auto_631390 ) ) ( not ( = ?auto_631391 ?auto_631394 ) ) ( HOIST-AT ?auto_631392 ?auto_631391 ) ( not ( = ?auto_631396 ?auto_631392 ) ) ( AVAILABLE ?auto_631392 ) ( SURFACE-AT ?auto_631390 ?auto_631391 ) ( ON ?auto_631390 ?auto_631395 ) ( CLEAR ?auto_631390 ) ( not ( = ?auto_631389 ?auto_631395 ) ) ( not ( = ?auto_631390 ?auto_631395 ) ) ( not ( = ?auto_631388 ?auto_631395 ) ) ( TRUCK-AT ?auto_631393 ?auto_631394 ) ( SURFACE-AT ?auto_631388 ?auto_631394 ) ( CLEAR ?auto_631388 ) ( LIFTING ?auto_631396 ?auto_631389 ) ( IS-CRATE ?auto_631389 ) ( ON ?auto_631379 ?auto_631378 ) ( ON ?auto_631380 ?auto_631379 ) ( ON ?auto_631382 ?auto_631380 ) ( ON ?auto_631381 ?auto_631382 ) ( ON ?auto_631383 ?auto_631381 ) ( ON ?auto_631384 ?auto_631383 ) ( ON ?auto_631385 ?auto_631384 ) ( ON ?auto_631386 ?auto_631385 ) ( ON ?auto_631387 ?auto_631386 ) ( ON ?auto_631388 ?auto_631387 ) ( not ( = ?auto_631378 ?auto_631379 ) ) ( not ( = ?auto_631378 ?auto_631380 ) ) ( not ( = ?auto_631378 ?auto_631382 ) ) ( not ( = ?auto_631378 ?auto_631381 ) ) ( not ( = ?auto_631378 ?auto_631383 ) ) ( not ( = ?auto_631378 ?auto_631384 ) ) ( not ( = ?auto_631378 ?auto_631385 ) ) ( not ( = ?auto_631378 ?auto_631386 ) ) ( not ( = ?auto_631378 ?auto_631387 ) ) ( not ( = ?auto_631378 ?auto_631388 ) ) ( not ( = ?auto_631378 ?auto_631389 ) ) ( not ( = ?auto_631378 ?auto_631390 ) ) ( not ( = ?auto_631378 ?auto_631395 ) ) ( not ( = ?auto_631379 ?auto_631380 ) ) ( not ( = ?auto_631379 ?auto_631382 ) ) ( not ( = ?auto_631379 ?auto_631381 ) ) ( not ( = ?auto_631379 ?auto_631383 ) ) ( not ( = ?auto_631379 ?auto_631384 ) ) ( not ( = ?auto_631379 ?auto_631385 ) ) ( not ( = ?auto_631379 ?auto_631386 ) ) ( not ( = ?auto_631379 ?auto_631387 ) ) ( not ( = ?auto_631379 ?auto_631388 ) ) ( not ( = ?auto_631379 ?auto_631389 ) ) ( not ( = ?auto_631379 ?auto_631390 ) ) ( not ( = ?auto_631379 ?auto_631395 ) ) ( not ( = ?auto_631380 ?auto_631382 ) ) ( not ( = ?auto_631380 ?auto_631381 ) ) ( not ( = ?auto_631380 ?auto_631383 ) ) ( not ( = ?auto_631380 ?auto_631384 ) ) ( not ( = ?auto_631380 ?auto_631385 ) ) ( not ( = ?auto_631380 ?auto_631386 ) ) ( not ( = ?auto_631380 ?auto_631387 ) ) ( not ( = ?auto_631380 ?auto_631388 ) ) ( not ( = ?auto_631380 ?auto_631389 ) ) ( not ( = ?auto_631380 ?auto_631390 ) ) ( not ( = ?auto_631380 ?auto_631395 ) ) ( not ( = ?auto_631382 ?auto_631381 ) ) ( not ( = ?auto_631382 ?auto_631383 ) ) ( not ( = ?auto_631382 ?auto_631384 ) ) ( not ( = ?auto_631382 ?auto_631385 ) ) ( not ( = ?auto_631382 ?auto_631386 ) ) ( not ( = ?auto_631382 ?auto_631387 ) ) ( not ( = ?auto_631382 ?auto_631388 ) ) ( not ( = ?auto_631382 ?auto_631389 ) ) ( not ( = ?auto_631382 ?auto_631390 ) ) ( not ( = ?auto_631382 ?auto_631395 ) ) ( not ( = ?auto_631381 ?auto_631383 ) ) ( not ( = ?auto_631381 ?auto_631384 ) ) ( not ( = ?auto_631381 ?auto_631385 ) ) ( not ( = ?auto_631381 ?auto_631386 ) ) ( not ( = ?auto_631381 ?auto_631387 ) ) ( not ( = ?auto_631381 ?auto_631388 ) ) ( not ( = ?auto_631381 ?auto_631389 ) ) ( not ( = ?auto_631381 ?auto_631390 ) ) ( not ( = ?auto_631381 ?auto_631395 ) ) ( not ( = ?auto_631383 ?auto_631384 ) ) ( not ( = ?auto_631383 ?auto_631385 ) ) ( not ( = ?auto_631383 ?auto_631386 ) ) ( not ( = ?auto_631383 ?auto_631387 ) ) ( not ( = ?auto_631383 ?auto_631388 ) ) ( not ( = ?auto_631383 ?auto_631389 ) ) ( not ( = ?auto_631383 ?auto_631390 ) ) ( not ( = ?auto_631383 ?auto_631395 ) ) ( not ( = ?auto_631384 ?auto_631385 ) ) ( not ( = ?auto_631384 ?auto_631386 ) ) ( not ( = ?auto_631384 ?auto_631387 ) ) ( not ( = ?auto_631384 ?auto_631388 ) ) ( not ( = ?auto_631384 ?auto_631389 ) ) ( not ( = ?auto_631384 ?auto_631390 ) ) ( not ( = ?auto_631384 ?auto_631395 ) ) ( not ( = ?auto_631385 ?auto_631386 ) ) ( not ( = ?auto_631385 ?auto_631387 ) ) ( not ( = ?auto_631385 ?auto_631388 ) ) ( not ( = ?auto_631385 ?auto_631389 ) ) ( not ( = ?auto_631385 ?auto_631390 ) ) ( not ( = ?auto_631385 ?auto_631395 ) ) ( not ( = ?auto_631386 ?auto_631387 ) ) ( not ( = ?auto_631386 ?auto_631388 ) ) ( not ( = ?auto_631386 ?auto_631389 ) ) ( not ( = ?auto_631386 ?auto_631390 ) ) ( not ( = ?auto_631386 ?auto_631395 ) ) ( not ( = ?auto_631387 ?auto_631388 ) ) ( not ( = ?auto_631387 ?auto_631389 ) ) ( not ( = ?auto_631387 ?auto_631390 ) ) ( not ( = ?auto_631387 ?auto_631395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631388 ?auto_631389 ?auto_631390 )
      ( MAKE-12CRATE-VERIFY ?auto_631378 ?auto_631379 ?auto_631380 ?auto_631382 ?auto_631381 ?auto_631383 ?auto_631384 ?auto_631385 ?auto_631386 ?auto_631387 ?auto_631388 ?auto_631389 ?auto_631390 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631541 - SURFACE
      ?auto_631542 - SURFACE
      ?auto_631543 - SURFACE
      ?auto_631545 - SURFACE
      ?auto_631544 - SURFACE
      ?auto_631546 - SURFACE
      ?auto_631547 - SURFACE
      ?auto_631548 - SURFACE
      ?auto_631549 - SURFACE
      ?auto_631550 - SURFACE
      ?auto_631551 - SURFACE
      ?auto_631552 - SURFACE
      ?auto_631553 - SURFACE
    )
    :vars
    (
      ?auto_631559 - HOIST
      ?auto_631557 - PLACE
      ?auto_631556 - PLACE
      ?auto_631558 - HOIST
      ?auto_631555 - SURFACE
      ?auto_631554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631559 ?auto_631557 ) ( IS-CRATE ?auto_631553 ) ( not ( = ?auto_631552 ?auto_631553 ) ) ( not ( = ?auto_631551 ?auto_631552 ) ) ( not ( = ?auto_631551 ?auto_631553 ) ) ( not ( = ?auto_631556 ?auto_631557 ) ) ( HOIST-AT ?auto_631558 ?auto_631556 ) ( not ( = ?auto_631559 ?auto_631558 ) ) ( AVAILABLE ?auto_631558 ) ( SURFACE-AT ?auto_631553 ?auto_631556 ) ( ON ?auto_631553 ?auto_631555 ) ( CLEAR ?auto_631553 ) ( not ( = ?auto_631552 ?auto_631555 ) ) ( not ( = ?auto_631553 ?auto_631555 ) ) ( not ( = ?auto_631551 ?auto_631555 ) ) ( TRUCK-AT ?auto_631554 ?auto_631557 ) ( SURFACE-AT ?auto_631551 ?auto_631557 ) ( CLEAR ?auto_631551 ) ( IS-CRATE ?auto_631552 ) ( AVAILABLE ?auto_631559 ) ( IN ?auto_631552 ?auto_631554 ) ( ON ?auto_631542 ?auto_631541 ) ( ON ?auto_631543 ?auto_631542 ) ( ON ?auto_631545 ?auto_631543 ) ( ON ?auto_631544 ?auto_631545 ) ( ON ?auto_631546 ?auto_631544 ) ( ON ?auto_631547 ?auto_631546 ) ( ON ?auto_631548 ?auto_631547 ) ( ON ?auto_631549 ?auto_631548 ) ( ON ?auto_631550 ?auto_631549 ) ( ON ?auto_631551 ?auto_631550 ) ( not ( = ?auto_631541 ?auto_631542 ) ) ( not ( = ?auto_631541 ?auto_631543 ) ) ( not ( = ?auto_631541 ?auto_631545 ) ) ( not ( = ?auto_631541 ?auto_631544 ) ) ( not ( = ?auto_631541 ?auto_631546 ) ) ( not ( = ?auto_631541 ?auto_631547 ) ) ( not ( = ?auto_631541 ?auto_631548 ) ) ( not ( = ?auto_631541 ?auto_631549 ) ) ( not ( = ?auto_631541 ?auto_631550 ) ) ( not ( = ?auto_631541 ?auto_631551 ) ) ( not ( = ?auto_631541 ?auto_631552 ) ) ( not ( = ?auto_631541 ?auto_631553 ) ) ( not ( = ?auto_631541 ?auto_631555 ) ) ( not ( = ?auto_631542 ?auto_631543 ) ) ( not ( = ?auto_631542 ?auto_631545 ) ) ( not ( = ?auto_631542 ?auto_631544 ) ) ( not ( = ?auto_631542 ?auto_631546 ) ) ( not ( = ?auto_631542 ?auto_631547 ) ) ( not ( = ?auto_631542 ?auto_631548 ) ) ( not ( = ?auto_631542 ?auto_631549 ) ) ( not ( = ?auto_631542 ?auto_631550 ) ) ( not ( = ?auto_631542 ?auto_631551 ) ) ( not ( = ?auto_631542 ?auto_631552 ) ) ( not ( = ?auto_631542 ?auto_631553 ) ) ( not ( = ?auto_631542 ?auto_631555 ) ) ( not ( = ?auto_631543 ?auto_631545 ) ) ( not ( = ?auto_631543 ?auto_631544 ) ) ( not ( = ?auto_631543 ?auto_631546 ) ) ( not ( = ?auto_631543 ?auto_631547 ) ) ( not ( = ?auto_631543 ?auto_631548 ) ) ( not ( = ?auto_631543 ?auto_631549 ) ) ( not ( = ?auto_631543 ?auto_631550 ) ) ( not ( = ?auto_631543 ?auto_631551 ) ) ( not ( = ?auto_631543 ?auto_631552 ) ) ( not ( = ?auto_631543 ?auto_631553 ) ) ( not ( = ?auto_631543 ?auto_631555 ) ) ( not ( = ?auto_631545 ?auto_631544 ) ) ( not ( = ?auto_631545 ?auto_631546 ) ) ( not ( = ?auto_631545 ?auto_631547 ) ) ( not ( = ?auto_631545 ?auto_631548 ) ) ( not ( = ?auto_631545 ?auto_631549 ) ) ( not ( = ?auto_631545 ?auto_631550 ) ) ( not ( = ?auto_631545 ?auto_631551 ) ) ( not ( = ?auto_631545 ?auto_631552 ) ) ( not ( = ?auto_631545 ?auto_631553 ) ) ( not ( = ?auto_631545 ?auto_631555 ) ) ( not ( = ?auto_631544 ?auto_631546 ) ) ( not ( = ?auto_631544 ?auto_631547 ) ) ( not ( = ?auto_631544 ?auto_631548 ) ) ( not ( = ?auto_631544 ?auto_631549 ) ) ( not ( = ?auto_631544 ?auto_631550 ) ) ( not ( = ?auto_631544 ?auto_631551 ) ) ( not ( = ?auto_631544 ?auto_631552 ) ) ( not ( = ?auto_631544 ?auto_631553 ) ) ( not ( = ?auto_631544 ?auto_631555 ) ) ( not ( = ?auto_631546 ?auto_631547 ) ) ( not ( = ?auto_631546 ?auto_631548 ) ) ( not ( = ?auto_631546 ?auto_631549 ) ) ( not ( = ?auto_631546 ?auto_631550 ) ) ( not ( = ?auto_631546 ?auto_631551 ) ) ( not ( = ?auto_631546 ?auto_631552 ) ) ( not ( = ?auto_631546 ?auto_631553 ) ) ( not ( = ?auto_631546 ?auto_631555 ) ) ( not ( = ?auto_631547 ?auto_631548 ) ) ( not ( = ?auto_631547 ?auto_631549 ) ) ( not ( = ?auto_631547 ?auto_631550 ) ) ( not ( = ?auto_631547 ?auto_631551 ) ) ( not ( = ?auto_631547 ?auto_631552 ) ) ( not ( = ?auto_631547 ?auto_631553 ) ) ( not ( = ?auto_631547 ?auto_631555 ) ) ( not ( = ?auto_631548 ?auto_631549 ) ) ( not ( = ?auto_631548 ?auto_631550 ) ) ( not ( = ?auto_631548 ?auto_631551 ) ) ( not ( = ?auto_631548 ?auto_631552 ) ) ( not ( = ?auto_631548 ?auto_631553 ) ) ( not ( = ?auto_631548 ?auto_631555 ) ) ( not ( = ?auto_631549 ?auto_631550 ) ) ( not ( = ?auto_631549 ?auto_631551 ) ) ( not ( = ?auto_631549 ?auto_631552 ) ) ( not ( = ?auto_631549 ?auto_631553 ) ) ( not ( = ?auto_631549 ?auto_631555 ) ) ( not ( = ?auto_631550 ?auto_631551 ) ) ( not ( = ?auto_631550 ?auto_631552 ) ) ( not ( = ?auto_631550 ?auto_631553 ) ) ( not ( = ?auto_631550 ?auto_631555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631551 ?auto_631552 ?auto_631553 )
      ( MAKE-12CRATE-VERIFY ?auto_631541 ?auto_631542 ?auto_631543 ?auto_631545 ?auto_631544 ?auto_631546 ?auto_631547 ?auto_631548 ?auto_631549 ?auto_631550 ?auto_631551 ?auto_631552 ?auto_631553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_631560 - SURFACE
      ?auto_631561 - SURFACE
    )
    :vars
    (
      ?auto_631567 - HOIST
      ?auto_631565 - PLACE
      ?auto_631568 - SURFACE
      ?auto_631564 - PLACE
      ?auto_631566 - HOIST
      ?auto_631563 - SURFACE
      ?auto_631562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631567 ?auto_631565 ) ( IS-CRATE ?auto_631561 ) ( not ( = ?auto_631560 ?auto_631561 ) ) ( not ( = ?auto_631568 ?auto_631560 ) ) ( not ( = ?auto_631568 ?auto_631561 ) ) ( not ( = ?auto_631564 ?auto_631565 ) ) ( HOIST-AT ?auto_631566 ?auto_631564 ) ( not ( = ?auto_631567 ?auto_631566 ) ) ( AVAILABLE ?auto_631566 ) ( SURFACE-AT ?auto_631561 ?auto_631564 ) ( ON ?auto_631561 ?auto_631563 ) ( CLEAR ?auto_631561 ) ( not ( = ?auto_631560 ?auto_631563 ) ) ( not ( = ?auto_631561 ?auto_631563 ) ) ( not ( = ?auto_631568 ?auto_631563 ) ) ( SURFACE-AT ?auto_631568 ?auto_631565 ) ( CLEAR ?auto_631568 ) ( IS-CRATE ?auto_631560 ) ( AVAILABLE ?auto_631567 ) ( IN ?auto_631560 ?auto_631562 ) ( TRUCK-AT ?auto_631562 ?auto_631564 ) )
    :subtasks
    ( ( !DRIVE ?auto_631562 ?auto_631564 ?auto_631565 )
      ( MAKE-2CRATE ?auto_631568 ?auto_631560 ?auto_631561 )
      ( MAKE-1CRATE-VERIFY ?auto_631560 ?auto_631561 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_631569 - SURFACE
      ?auto_631570 - SURFACE
      ?auto_631571 - SURFACE
    )
    :vars
    (
      ?auto_631576 - HOIST
      ?auto_631577 - PLACE
      ?auto_631574 - PLACE
      ?auto_631573 - HOIST
      ?auto_631572 - SURFACE
      ?auto_631575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631576 ?auto_631577 ) ( IS-CRATE ?auto_631571 ) ( not ( = ?auto_631570 ?auto_631571 ) ) ( not ( = ?auto_631569 ?auto_631570 ) ) ( not ( = ?auto_631569 ?auto_631571 ) ) ( not ( = ?auto_631574 ?auto_631577 ) ) ( HOIST-AT ?auto_631573 ?auto_631574 ) ( not ( = ?auto_631576 ?auto_631573 ) ) ( AVAILABLE ?auto_631573 ) ( SURFACE-AT ?auto_631571 ?auto_631574 ) ( ON ?auto_631571 ?auto_631572 ) ( CLEAR ?auto_631571 ) ( not ( = ?auto_631570 ?auto_631572 ) ) ( not ( = ?auto_631571 ?auto_631572 ) ) ( not ( = ?auto_631569 ?auto_631572 ) ) ( SURFACE-AT ?auto_631569 ?auto_631577 ) ( CLEAR ?auto_631569 ) ( IS-CRATE ?auto_631570 ) ( AVAILABLE ?auto_631576 ) ( IN ?auto_631570 ?auto_631575 ) ( TRUCK-AT ?auto_631575 ?auto_631574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_631570 ?auto_631571 )
      ( MAKE-2CRATE-VERIFY ?auto_631569 ?auto_631570 ?auto_631571 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_631578 - SURFACE
      ?auto_631579 - SURFACE
      ?auto_631580 - SURFACE
      ?auto_631581 - SURFACE
    )
    :vars
    (
      ?auto_631587 - HOIST
      ?auto_631585 - PLACE
      ?auto_631583 - PLACE
      ?auto_631582 - HOIST
      ?auto_631586 - SURFACE
      ?auto_631584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631587 ?auto_631585 ) ( IS-CRATE ?auto_631581 ) ( not ( = ?auto_631580 ?auto_631581 ) ) ( not ( = ?auto_631579 ?auto_631580 ) ) ( not ( = ?auto_631579 ?auto_631581 ) ) ( not ( = ?auto_631583 ?auto_631585 ) ) ( HOIST-AT ?auto_631582 ?auto_631583 ) ( not ( = ?auto_631587 ?auto_631582 ) ) ( AVAILABLE ?auto_631582 ) ( SURFACE-AT ?auto_631581 ?auto_631583 ) ( ON ?auto_631581 ?auto_631586 ) ( CLEAR ?auto_631581 ) ( not ( = ?auto_631580 ?auto_631586 ) ) ( not ( = ?auto_631581 ?auto_631586 ) ) ( not ( = ?auto_631579 ?auto_631586 ) ) ( SURFACE-AT ?auto_631579 ?auto_631585 ) ( CLEAR ?auto_631579 ) ( IS-CRATE ?auto_631580 ) ( AVAILABLE ?auto_631587 ) ( IN ?auto_631580 ?auto_631584 ) ( TRUCK-AT ?auto_631584 ?auto_631583 ) ( ON ?auto_631579 ?auto_631578 ) ( not ( = ?auto_631578 ?auto_631579 ) ) ( not ( = ?auto_631578 ?auto_631580 ) ) ( not ( = ?auto_631578 ?auto_631581 ) ) ( not ( = ?auto_631578 ?auto_631586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631579 ?auto_631580 ?auto_631581 )
      ( MAKE-3CRATE-VERIFY ?auto_631578 ?auto_631579 ?auto_631580 ?auto_631581 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_631588 - SURFACE
      ?auto_631589 - SURFACE
      ?auto_631590 - SURFACE
      ?auto_631592 - SURFACE
      ?auto_631591 - SURFACE
    )
    :vars
    (
      ?auto_631598 - HOIST
      ?auto_631596 - PLACE
      ?auto_631594 - PLACE
      ?auto_631593 - HOIST
      ?auto_631597 - SURFACE
      ?auto_631595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631598 ?auto_631596 ) ( IS-CRATE ?auto_631591 ) ( not ( = ?auto_631592 ?auto_631591 ) ) ( not ( = ?auto_631590 ?auto_631592 ) ) ( not ( = ?auto_631590 ?auto_631591 ) ) ( not ( = ?auto_631594 ?auto_631596 ) ) ( HOIST-AT ?auto_631593 ?auto_631594 ) ( not ( = ?auto_631598 ?auto_631593 ) ) ( AVAILABLE ?auto_631593 ) ( SURFACE-AT ?auto_631591 ?auto_631594 ) ( ON ?auto_631591 ?auto_631597 ) ( CLEAR ?auto_631591 ) ( not ( = ?auto_631592 ?auto_631597 ) ) ( not ( = ?auto_631591 ?auto_631597 ) ) ( not ( = ?auto_631590 ?auto_631597 ) ) ( SURFACE-AT ?auto_631590 ?auto_631596 ) ( CLEAR ?auto_631590 ) ( IS-CRATE ?auto_631592 ) ( AVAILABLE ?auto_631598 ) ( IN ?auto_631592 ?auto_631595 ) ( TRUCK-AT ?auto_631595 ?auto_631594 ) ( ON ?auto_631589 ?auto_631588 ) ( ON ?auto_631590 ?auto_631589 ) ( not ( = ?auto_631588 ?auto_631589 ) ) ( not ( = ?auto_631588 ?auto_631590 ) ) ( not ( = ?auto_631588 ?auto_631592 ) ) ( not ( = ?auto_631588 ?auto_631591 ) ) ( not ( = ?auto_631588 ?auto_631597 ) ) ( not ( = ?auto_631589 ?auto_631590 ) ) ( not ( = ?auto_631589 ?auto_631592 ) ) ( not ( = ?auto_631589 ?auto_631591 ) ) ( not ( = ?auto_631589 ?auto_631597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631590 ?auto_631592 ?auto_631591 )
      ( MAKE-4CRATE-VERIFY ?auto_631588 ?auto_631589 ?auto_631590 ?auto_631592 ?auto_631591 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_631599 - SURFACE
      ?auto_631600 - SURFACE
      ?auto_631601 - SURFACE
      ?auto_631603 - SURFACE
      ?auto_631602 - SURFACE
      ?auto_631604 - SURFACE
    )
    :vars
    (
      ?auto_631610 - HOIST
      ?auto_631608 - PLACE
      ?auto_631606 - PLACE
      ?auto_631605 - HOIST
      ?auto_631609 - SURFACE
      ?auto_631607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631610 ?auto_631608 ) ( IS-CRATE ?auto_631604 ) ( not ( = ?auto_631602 ?auto_631604 ) ) ( not ( = ?auto_631603 ?auto_631602 ) ) ( not ( = ?auto_631603 ?auto_631604 ) ) ( not ( = ?auto_631606 ?auto_631608 ) ) ( HOIST-AT ?auto_631605 ?auto_631606 ) ( not ( = ?auto_631610 ?auto_631605 ) ) ( AVAILABLE ?auto_631605 ) ( SURFACE-AT ?auto_631604 ?auto_631606 ) ( ON ?auto_631604 ?auto_631609 ) ( CLEAR ?auto_631604 ) ( not ( = ?auto_631602 ?auto_631609 ) ) ( not ( = ?auto_631604 ?auto_631609 ) ) ( not ( = ?auto_631603 ?auto_631609 ) ) ( SURFACE-AT ?auto_631603 ?auto_631608 ) ( CLEAR ?auto_631603 ) ( IS-CRATE ?auto_631602 ) ( AVAILABLE ?auto_631610 ) ( IN ?auto_631602 ?auto_631607 ) ( TRUCK-AT ?auto_631607 ?auto_631606 ) ( ON ?auto_631600 ?auto_631599 ) ( ON ?auto_631601 ?auto_631600 ) ( ON ?auto_631603 ?auto_631601 ) ( not ( = ?auto_631599 ?auto_631600 ) ) ( not ( = ?auto_631599 ?auto_631601 ) ) ( not ( = ?auto_631599 ?auto_631603 ) ) ( not ( = ?auto_631599 ?auto_631602 ) ) ( not ( = ?auto_631599 ?auto_631604 ) ) ( not ( = ?auto_631599 ?auto_631609 ) ) ( not ( = ?auto_631600 ?auto_631601 ) ) ( not ( = ?auto_631600 ?auto_631603 ) ) ( not ( = ?auto_631600 ?auto_631602 ) ) ( not ( = ?auto_631600 ?auto_631604 ) ) ( not ( = ?auto_631600 ?auto_631609 ) ) ( not ( = ?auto_631601 ?auto_631603 ) ) ( not ( = ?auto_631601 ?auto_631602 ) ) ( not ( = ?auto_631601 ?auto_631604 ) ) ( not ( = ?auto_631601 ?auto_631609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631603 ?auto_631602 ?auto_631604 )
      ( MAKE-5CRATE-VERIFY ?auto_631599 ?auto_631600 ?auto_631601 ?auto_631603 ?auto_631602 ?auto_631604 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_631611 - SURFACE
      ?auto_631612 - SURFACE
      ?auto_631613 - SURFACE
      ?auto_631615 - SURFACE
      ?auto_631614 - SURFACE
      ?auto_631616 - SURFACE
      ?auto_631617 - SURFACE
    )
    :vars
    (
      ?auto_631623 - HOIST
      ?auto_631621 - PLACE
      ?auto_631619 - PLACE
      ?auto_631618 - HOIST
      ?auto_631622 - SURFACE
      ?auto_631620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631623 ?auto_631621 ) ( IS-CRATE ?auto_631617 ) ( not ( = ?auto_631616 ?auto_631617 ) ) ( not ( = ?auto_631614 ?auto_631616 ) ) ( not ( = ?auto_631614 ?auto_631617 ) ) ( not ( = ?auto_631619 ?auto_631621 ) ) ( HOIST-AT ?auto_631618 ?auto_631619 ) ( not ( = ?auto_631623 ?auto_631618 ) ) ( AVAILABLE ?auto_631618 ) ( SURFACE-AT ?auto_631617 ?auto_631619 ) ( ON ?auto_631617 ?auto_631622 ) ( CLEAR ?auto_631617 ) ( not ( = ?auto_631616 ?auto_631622 ) ) ( not ( = ?auto_631617 ?auto_631622 ) ) ( not ( = ?auto_631614 ?auto_631622 ) ) ( SURFACE-AT ?auto_631614 ?auto_631621 ) ( CLEAR ?auto_631614 ) ( IS-CRATE ?auto_631616 ) ( AVAILABLE ?auto_631623 ) ( IN ?auto_631616 ?auto_631620 ) ( TRUCK-AT ?auto_631620 ?auto_631619 ) ( ON ?auto_631612 ?auto_631611 ) ( ON ?auto_631613 ?auto_631612 ) ( ON ?auto_631615 ?auto_631613 ) ( ON ?auto_631614 ?auto_631615 ) ( not ( = ?auto_631611 ?auto_631612 ) ) ( not ( = ?auto_631611 ?auto_631613 ) ) ( not ( = ?auto_631611 ?auto_631615 ) ) ( not ( = ?auto_631611 ?auto_631614 ) ) ( not ( = ?auto_631611 ?auto_631616 ) ) ( not ( = ?auto_631611 ?auto_631617 ) ) ( not ( = ?auto_631611 ?auto_631622 ) ) ( not ( = ?auto_631612 ?auto_631613 ) ) ( not ( = ?auto_631612 ?auto_631615 ) ) ( not ( = ?auto_631612 ?auto_631614 ) ) ( not ( = ?auto_631612 ?auto_631616 ) ) ( not ( = ?auto_631612 ?auto_631617 ) ) ( not ( = ?auto_631612 ?auto_631622 ) ) ( not ( = ?auto_631613 ?auto_631615 ) ) ( not ( = ?auto_631613 ?auto_631614 ) ) ( not ( = ?auto_631613 ?auto_631616 ) ) ( not ( = ?auto_631613 ?auto_631617 ) ) ( not ( = ?auto_631613 ?auto_631622 ) ) ( not ( = ?auto_631615 ?auto_631614 ) ) ( not ( = ?auto_631615 ?auto_631616 ) ) ( not ( = ?auto_631615 ?auto_631617 ) ) ( not ( = ?auto_631615 ?auto_631622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631614 ?auto_631616 ?auto_631617 )
      ( MAKE-6CRATE-VERIFY ?auto_631611 ?auto_631612 ?auto_631613 ?auto_631615 ?auto_631614 ?auto_631616 ?auto_631617 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_631624 - SURFACE
      ?auto_631625 - SURFACE
      ?auto_631626 - SURFACE
      ?auto_631628 - SURFACE
      ?auto_631627 - SURFACE
      ?auto_631629 - SURFACE
      ?auto_631630 - SURFACE
      ?auto_631631 - SURFACE
    )
    :vars
    (
      ?auto_631637 - HOIST
      ?auto_631635 - PLACE
      ?auto_631633 - PLACE
      ?auto_631632 - HOIST
      ?auto_631636 - SURFACE
      ?auto_631634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631637 ?auto_631635 ) ( IS-CRATE ?auto_631631 ) ( not ( = ?auto_631630 ?auto_631631 ) ) ( not ( = ?auto_631629 ?auto_631630 ) ) ( not ( = ?auto_631629 ?auto_631631 ) ) ( not ( = ?auto_631633 ?auto_631635 ) ) ( HOIST-AT ?auto_631632 ?auto_631633 ) ( not ( = ?auto_631637 ?auto_631632 ) ) ( AVAILABLE ?auto_631632 ) ( SURFACE-AT ?auto_631631 ?auto_631633 ) ( ON ?auto_631631 ?auto_631636 ) ( CLEAR ?auto_631631 ) ( not ( = ?auto_631630 ?auto_631636 ) ) ( not ( = ?auto_631631 ?auto_631636 ) ) ( not ( = ?auto_631629 ?auto_631636 ) ) ( SURFACE-AT ?auto_631629 ?auto_631635 ) ( CLEAR ?auto_631629 ) ( IS-CRATE ?auto_631630 ) ( AVAILABLE ?auto_631637 ) ( IN ?auto_631630 ?auto_631634 ) ( TRUCK-AT ?auto_631634 ?auto_631633 ) ( ON ?auto_631625 ?auto_631624 ) ( ON ?auto_631626 ?auto_631625 ) ( ON ?auto_631628 ?auto_631626 ) ( ON ?auto_631627 ?auto_631628 ) ( ON ?auto_631629 ?auto_631627 ) ( not ( = ?auto_631624 ?auto_631625 ) ) ( not ( = ?auto_631624 ?auto_631626 ) ) ( not ( = ?auto_631624 ?auto_631628 ) ) ( not ( = ?auto_631624 ?auto_631627 ) ) ( not ( = ?auto_631624 ?auto_631629 ) ) ( not ( = ?auto_631624 ?auto_631630 ) ) ( not ( = ?auto_631624 ?auto_631631 ) ) ( not ( = ?auto_631624 ?auto_631636 ) ) ( not ( = ?auto_631625 ?auto_631626 ) ) ( not ( = ?auto_631625 ?auto_631628 ) ) ( not ( = ?auto_631625 ?auto_631627 ) ) ( not ( = ?auto_631625 ?auto_631629 ) ) ( not ( = ?auto_631625 ?auto_631630 ) ) ( not ( = ?auto_631625 ?auto_631631 ) ) ( not ( = ?auto_631625 ?auto_631636 ) ) ( not ( = ?auto_631626 ?auto_631628 ) ) ( not ( = ?auto_631626 ?auto_631627 ) ) ( not ( = ?auto_631626 ?auto_631629 ) ) ( not ( = ?auto_631626 ?auto_631630 ) ) ( not ( = ?auto_631626 ?auto_631631 ) ) ( not ( = ?auto_631626 ?auto_631636 ) ) ( not ( = ?auto_631628 ?auto_631627 ) ) ( not ( = ?auto_631628 ?auto_631629 ) ) ( not ( = ?auto_631628 ?auto_631630 ) ) ( not ( = ?auto_631628 ?auto_631631 ) ) ( not ( = ?auto_631628 ?auto_631636 ) ) ( not ( = ?auto_631627 ?auto_631629 ) ) ( not ( = ?auto_631627 ?auto_631630 ) ) ( not ( = ?auto_631627 ?auto_631631 ) ) ( not ( = ?auto_631627 ?auto_631636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631629 ?auto_631630 ?auto_631631 )
      ( MAKE-7CRATE-VERIFY ?auto_631624 ?auto_631625 ?auto_631626 ?auto_631628 ?auto_631627 ?auto_631629 ?auto_631630 ?auto_631631 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_631638 - SURFACE
      ?auto_631639 - SURFACE
      ?auto_631640 - SURFACE
      ?auto_631642 - SURFACE
      ?auto_631641 - SURFACE
      ?auto_631643 - SURFACE
      ?auto_631644 - SURFACE
      ?auto_631645 - SURFACE
      ?auto_631646 - SURFACE
    )
    :vars
    (
      ?auto_631652 - HOIST
      ?auto_631650 - PLACE
      ?auto_631648 - PLACE
      ?auto_631647 - HOIST
      ?auto_631651 - SURFACE
      ?auto_631649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631652 ?auto_631650 ) ( IS-CRATE ?auto_631646 ) ( not ( = ?auto_631645 ?auto_631646 ) ) ( not ( = ?auto_631644 ?auto_631645 ) ) ( not ( = ?auto_631644 ?auto_631646 ) ) ( not ( = ?auto_631648 ?auto_631650 ) ) ( HOIST-AT ?auto_631647 ?auto_631648 ) ( not ( = ?auto_631652 ?auto_631647 ) ) ( AVAILABLE ?auto_631647 ) ( SURFACE-AT ?auto_631646 ?auto_631648 ) ( ON ?auto_631646 ?auto_631651 ) ( CLEAR ?auto_631646 ) ( not ( = ?auto_631645 ?auto_631651 ) ) ( not ( = ?auto_631646 ?auto_631651 ) ) ( not ( = ?auto_631644 ?auto_631651 ) ) ( SURFACE-AT ?auto_631644 ?auto_631650 ) ( CLEAR ?auto_631644 ) ( IS-CRATE ?auto_631645 ) ( AVAILABLE ?auto_631652 ) ( IN ?auto_631645 ?auto_631649 ) ( TRUCK-AT ?auto_631649 ?auto_631648 ) ( ON ?auto_631639 ?auto_631638 ) ( ON ?auto_631640 ?auto_631639 ) ( ON ?auto_631642 ?auto_631640 ) ( ON ?auto_631641 ?auto_631642 ) ( ON ?auto_631643 ?auto_631641 ) ( ON ?auto_631644 ?auto_631643 ) ( not ( = ?auto_631638 ?auto_631639 ) ) ( not ( = ?auto_631638 ?auto_631640 ) ) ( not ( = ?auto_631638 ?auto_631642 ) ) ( not ( = ?auto_631638 ?auto_631641 ) ) ( not ( = ?auto_631638 ?auto_631643 ) ) ( not ( = ?auto_631638 ?auto_631644 ) ) ( not ( = ?auto_631638 ?auto_631645 ) ) ( not ( = ?auto_631638 ?auto_631646 ) ) ( not ( = ?auto_631638 ?auto_631651 ) ) ( not ( = ?auto_631639 ?auto_631640 ) ) ( not ( = ?auto_631639 ?auto_631642 ) ) ( not ( = ?auto_631639 ?auto_631641 ) ) ( not ( = ?auto_631639 ?auto_631643 ) ) ( not ( = ?auto_631639 ?auto_631644 ) ) ( not ( = ?auto_631639 ?auto_631645 ) ) ( not ( = ?auto_631639 ?auto_631646 ) ) ( not ( = ?auto_631639 ?auto_631651 ) ) ( not ( = ?auto_631640 ?auto_631642 ) ) ( not ( = ?auto_631640 ?auto_631641 ) ) ( not ( = ?auto_631640 ?auto_631643 ) ) ( not ( = ?auto_631640 ?auto_631644 ) ) ( not ( = ?auto_631640 ?auto_631645 ) ) ( not ( = ?auto_631640 ?auto_631646 ) ) ( not ( = ?auto_631640 ?auto_631651 ) ) ( not ( = ?auto_631642 ?auto_631641 ) ) ( not ( = ?auto_631642 ?auto_631643 ) ) ( not ( = ?auto_631642 ?auto_631644 ) ) ( not ( = ?auto_631642 ?auto_631645 ) ) ( not ( = ?auto_631642 ?auto_631646 ) ) ( not ( = ?auto_631642 ?auto_631651 ) ) ( not ( = ?auto_631641 ?auto_631643 ) ) ( not ( = ?auto_631641 ?auto_631644 ) ) ( not ( = ?auto_631641 ?auto_631645 ) ) ( not ( = ?auto_631641 ?auto_631646 ) ) ( not ( = ?auto_631641 ?auto_631651 ) ) ( not ( = ?auto_631643 ?auto_631644 ) ) ( not ( = ?auto_631643 ?auto_631645 ) ) ( not ( = ?auto_631643 ?auto_631646 ) ) ( not ( = ?auto_631643 ?auto_631651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631644 ?auto_631645 ?auto_631646 )
      ( MAKE-8CRATE-VERIFY ?auto_631638 ?auto_631639 ?auto_631640 ?auto_631642 ?auto_631641 ?auto_631643 ?auto_631644 ?auto_631645 ?auto_631646 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_631653 - SURFACE
      ?auto_631654 - SURFACE
      ?auto_631655 - SURFACE
      ?auto_631657 - SURFACE
      ?auto_631656 - SURFACE
      ?auto_631658 - SURFACE
      ?auto_631659 - SURFACE
      ?auto_631660 - SURFACE
      ?auto_631661 - SURFACE
      ?auto_631662 - SURFACE
    )
    :vars
    (
      ?auto_631668 - HOIST
      ?auto_631666 - PLACE
      ?auto_631664 - PLACE
      ?auto_631663 - HOIST
      ?auto_631667 - SURFACE
      ?auto_631665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631668 ?auto_631666 ) ( IS-CRATE ?auto_631662 ) ( not ( = ?auto_631661 ?auto_631662 ) ) ( not ( = ?auto_631660 ?auto_631661 ) ) ( not ( = ?auto_631660 ?auto_631662 ) ) ( not ( = ?auto_631664 ?auto_631666 ) ) ( HOIST-AT ?auto_631663 ?auto_631664 ) ( not ( = ?auto_631668 ?auto_631663 ) ) ( AVAILABLE ?auto_631663 ) ( SURFACE-AT ?auto_631662 ?auto_631664 ) ( ON ?auto_631662 ?auto_631667 ) ( CLEAR ?auto_631662 ) ( not ( = ?auto_631661 ?auto_631667 ) ) ( not ( = ?auto_631662 ?auto_631667 ) ) ( not ( = ?auto_631660 ?auto_631667 ) ) ( SURFACE-AT ?auto_631660 ?auto_631666 ) ( CLEAR ?auto_631660 ) ( IS-CRATE ?auto_631661 ) ( AVAILABLE ?auto_631668 ) ( IN ?auto_631661 ?auto_631665 ) ( TRUCK-AT ?auto_631665 ?auto_631664 ) ( ON ?auto_631654 ?auto_631653 ) ( ON ?auto_631655 ?auto_631654 ) ( ON ?auto_631657 ?auto_631655 ) ( ON ?auto_631656 ?auto_631657 ) ( ON ?auto_631658 ?auto_631656 ) ( ON ?auto_631659 ?auto_631658 ) ( ON ?auto_631660 ?auto_631659 ) ( not ( = ?auto_631653 ?auto_631654 ) ) ( not ( = ?auto_631653 ?auto_631655 ) ) ( not ( = ?auto_631653 ?auto_631657 ) ) ( not ( = ?auto_631653 ?auto_631656 ) ) ( not ( = ?auto_631653 ?auto_631658 ) ) ( not ( = ?auto_631653 ?auto_631659 ) ) ( not ( = ?auto_631653 ?auto_631660 ) ) ( not ( = ?auto_631653 ?auto_631661 ) ) ( not ( = ?auto_631653 ?auto_631662 ) ) ( not ( = ?auto_631653 ?auto_631667 ) ) ( not ( = ?auto_631654 ?auto_631655 ) ) ( not ( = ?auto_631654 ?auto_631657 ) ) ( not ( = ?auto_631654 ?auto_631656 ) ) ( not ( = ?auto_631654 ?auto_631658 ) ) ( not ( = ?auto_631654 ?auto_631659 ) ) ( not ( = ?auto_631654 ?auto_631660 ) ) ( not ( = ?auto_631654 ?auto_631661 ) ) ( not ( = ?auto_631654 ?auto_631662 ) ) ( not ( = ?auto_631654 ?auto_631667 ) ) ( not ( = ?auto_631655 ?auto_631657 ) ) ( not ( = ?auto_631655 ?auto_631656 ) ) ( not ( = ?auto_631655 ?auto_631658 ) ) ( not ( = ?auto_631655 ?auto_631659 ) ) ( not ( = ?auto_631655 ?auto_631660 ) ) ( not ( = ?auto_631655 ?auto_631661 ) ) ( not ( = ?auto_631655 ?auto_631662 ) ) ( not ( = ?auto_631655 ?auto_631667 ) ) ( not ( = ?auto_631657 ?auto_631656 ) ) ( not ( = ?auto_631657 ?auto_631658 ) ) ( not ( = ?auto_631657 ?auto_631659 ) ) ( not ( = ?auto_631657 ?auto_631660 ) ) ( not ( = ?auto_631657 ?auto_631661 ) ) ( not ( = ?auto_631657 ?auto_631662 ) ) ( not ( = ?auto_631657 ?auto_631667 ) ) ( not ( = ?auto_631656 ?auto_631658 ) ) ( not ( = ?auto_631656 ?auto_631659 ) ) ( not ( = ?auto_631656 ?auto_631660 ) ) ( not ( = ?auto_631656 ?auto_631661 ) ) ( not ( = ?auto_631656 ?auto_631662 ) ) ( not ( = ?auto_631656 ?auto_631667 ) ) ( not ( = ?auto_631658 ?auto_631659 ) ) ( not ( = ?auto_631658 ?auto_631660 ) ) ( not ( = ?auto_631658 ?auto_631661 ) ) ( not ( = ?auto_631658 ?auto_631662 ) ) ( not ( = ?auto_631658 ?auto_631667 ) ) ( not ( = ?auto_631659 ?auto_631660 ) ) ( not ( = ?auto_631659 ?auto_631661 ) ) ( not ( = ?auto_631659 ?auto_631662 ) ) ( not ( = ?auto_631659 ?auto_631667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631660 ?auto_631661 ?auto_631662 )
      ( MAKE-9CRATE-VERIFY ?auto_631653 ?auto_631654 ?auto_631655 ?auto_631657 ?auto_631656 ?auto_631658 ?auto_631659 ?auto_631660 ?auto_631661 ?auto_631662 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_631669 - SURFACE
      ?auto_631670 - SURFACE
      ?auto_631671 - SURFACE
      ?auto_631673 - SURFACE
      ?auto_631672 - SURFACE
      ?auto_631674 - SURFACE
      ?auto_631675 - SURFACE
      ?auto_631676 - SURFACE
      ?auto_631677 - SURFACE
      ?auto_631678 - SURFACE
      ?auto_631679 - SURFACE
    )
    :vars
    (
      ?auto_631685 - HOIST
      ?auto_631683 - PLACE
      ?auto_631681 - PLACE
      ?auto_631680 - HOIST
      ?auto_631684 - SURFACE
      ?auto_631682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631685 ?auto_631683 ) ( IS-CRATE ?auto_631679 ) ( not ( = ?auto_631678 ?auto_631679 ) ) ( not ( = ?auto_631677 ?auto_631678 ) ) ( not ( = ?auto_631677 ?auto_631679 ) ) ( not ( = ?auto_631681 ?auto_631683 ) ) ( HOIST-AT ?auto_631680 ?auto_631681 ) ( not ( = ?auto_631685 ?auto_631680 ) ) ( AVAILABLE ?auto_631680 ) ( SURFACE-AT ?auto_631679 ?auto_631681 ) ( ON ?auto_631679 ?auto_631684 ) ( CLEAR ?auto_631679 ) ( not ( = ?auto_631678 ?auto_631684 ) ) ( not ( = ?auto_631679 ?auto_631684 ) ) ( not ( = ?auto_631677 ?auto_631684 ) ) ( SURFACE-AT ?auto_631677 ?auto_631683 ) ( CLEAR ?auto_631677 ) ( IS-CRATE ?auto_631678 ) ( AVAILABLE ?auto_631685 ) ( IN ?auto_631678 ?auto_631682 ) ( TRUCK-AT ?auto_631682 ?auto_631681 ) ( ON ?auto_631670 ?auto_631669 ) ( ON ?auto_631671 ?auto_631670 ) ( ON ?auto_631673 ?auto_631671 ) ( ON ?auto_631672 ?auto_631673 ) ( ON ?auto_631674 ?auto_631672 ) ( ON ?auto_631675 ?auto_631674 ) ( ON ?auto_631676 ?auto_631675 ) ( ON ?auto_631677 ?auto_631676 ) ( not ( = ?auto_631669 ?auto_631670 ) ) ( not ( = ?auto_631669 ?auto_631671 ) ) ( not ( = ?auto_631669 ?auto_631673 ) ) ( not ( = ?auto_631669 ?auto_631672 ) ) ( not ( = ?auto_631669 ?auto_631674 ) ) ( not ( = ?auto_631669 ?auto_631675 ) ) ( not ( = ?auto_631669 ?auto_631676 ) ) ( not ( = ?auto_631669 ?auto_631677 ) ) ( not ( = ?auto_631669 ?auto_631678 ) ) ( not ( = ?auto_631669 ?auto_631679 ) ) ( not ( = ?auto_631669 ?auto_631684 ) ) ( not ( = ?auto_631670 ?auto_631671 ) ) ( not ( = ?auto_631670 ?auto_631673 ) ) ( not ( = ?auto_631670 ?auto_631672 ) ) ( not ( = ?auto_631670 ?auto_631674 ) ) ( not ( = ?auto_631670 ?auto_631675 ) ) ( not ( = ?auto_631670 ?auto_631676 ) ) ( not ( = ?auto_631670 ?auto_631677 ) ) ( not ( = ?auto_631670 ?auto_631678 ) ) ( not ( = ?auto_631670 ?auto_631679 ) ) ( not ( = ?auto_631670 ?auto_631684 ) ) ( not ( = ?auto_631671 ?auto_631673 ) ) ( not ( = ?auto_631671 ?auto_631672 ) ) ( not ( = ?auto_631671 ?auto_631674 ) ) ( not ( = ?auto_631671 ?auto_631675 ) ) ( not ( = ?auto_631671 ?auto_631676 ) ) ( not ( = ?auto_631671 ?auto_631677 ) ) ( not ( = ?auto_631671 ?auto_631678 ) ) ( not ( = ?auto_631671 ?auto_631679 ) ) ( not ( = ?auto_631671 ?auto_631684 ) ) ( not ( = ?auto_631673 ?auto_631672 ) ) ( not ( = ?auto_631673 ?auto_631674 ) ) ( not ( = ?auto_631673 ?auto_631675 ) ) ( not ( = ?auto_631673 ?auto_631676 ) ) ( not ( = ?auto_631673 ?auto_631677 ) ) ( not ( = ?auto_631673 ?auto_631678 ) ) ( not ( = ?auto_631673 ?auto_631679 ) ) ( not ( = ?auto_631673 ?auto_631684 ) ) ( not ( = ?auto_631672 ?auto_631674 ) ) ( not ( = ?auto_631672 ?auto_631675 ) ) ( not ( = ?auto_631672 ?auto_631676 ) ) ( not ( = ?auto_631672 ?auto_631677 ) ) ( not ( = ?auto_631672 ?auto_631678 ) ) ( not ( = ?auto_631672 ?auto_631679 ) ) ( not ( = ?auto_631672 ?auto_631684 ) ) ( not ( = ?auto_631674 ?auto_631675 ) ) ( not ( = ?auto_631674 ?auto_631676 ) ) ( not ( = ?auto_631674 ?auto_631677 ) ) ( not ( = ?auto_631674 ?auto_631678 ) ) ( not ( = ?auto_631674 ?auto_631679 ) ) ( not ( = ?auto_631674 ?auto_631684 ) ) ( not ( = ?auto_631675 ?auto_631676 ) ) ( not ( = ?auto_631675 ?auto_631677 ) ) ( not ( = ?auto_631675 ?auto_631678 ) ) ( not ( = ?auto_631675 ?auto_631679 ) ) ( not ( = ?auto_631675 ?auto_631684 ) ) ( not ( = ?auto_631676 ?auto_631677 ) ) ( not ( = ?auto_631676 ?auto_631678 ) ) ( not ( = ?auto_631676 ?auto_631679 ) ) ( not ( = ?auto_631676 ?auto_631684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631677 ?auto_631678 ?auto_631679 )
      ( MAKE-10CRATE-VERIFY ?auto_631669 ?auto_631670 ?auto_631671 ?auto_631673 ?auto_631672 ?auto_631674 ?auto_631675 ?auto_631676 ?auto_631677 ?auto_631678 ?auto_631679 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_631686 - SURFACE
      ?auto_631687 - SURFACE
      ?auto_631688 - SURFACE
      ?auto_631690 - SURFACE
      ?auto_631689 - SURFACE
      ?auto_631691 - SURFACE
      ?auto_631692 - SURFACE
      ?auto_631693 - SURFACE
      ?auto_631694 - SURFACE
      ?auto_631695 - SURFACE
      ?auto_631696 - SURFACE
      ?auto_631697 - SURFACE
    )
    :vars
    (
      ?auto_631703 - HOIST
      ?auto_631701 - PLACE
      ?auto_631699 - PLACE
      ?auto_631698 - HOIST
      ?auto_631702 - SURFACE
      ?auto_631700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631703 ?auto_631701 ) ( IS-CRATE ?auto_631697 ) ( not ( = ?auto_631696 ?auto_631697 ) ) ( not ( = ?auto_631695 ?auto_631696 ) ) ( not ( = ?auto_631695 ?auto_631697 ) ) ( not ( = ?auto_631699 ?auto_631701 ) ) ( HOIST-AT ?auto_631698 ?auto_631699 ) ( not ( = ?auto_631703 ?auto_631698 ) ) ( AVAILABLE ?auto_631698 ) ( SURFACE-AT ?auto_631697 ?auto_631699 ) ( ON ?auto_631697 ?auto_631702 ) ( CLEAR ?auto_631697 ) ( not ( = ?auto_631696 ?auto_631702 ) ) ( not ( = ?auto_631697 ?auto_631702 ) ) ( not ( = ?auto_631695 ?auto_631702 ) ) ( SURFACE-AT ?auto_631695 ?auto_631701 ) ( CLEAR ?auto_631695 ) ( IS-CRATE ?auto_631696 ) ( AVAILABLE ?auto_631703 ) ( IN ?auto_631696 ?auto_631700 ) ( TRUCK-AT ?auto_631700 ?auto_631699 ) ( ON ?auto_631687 ?auto_631686 ) ( ON ?auto_631688 ?auto_631687 ) ( ON ?auto_631690 ?auto_631688 ) ( ON ?auto_631689 ?auto_631690 ) ( ON ?auto_631691 ?auto_631689 ) ( ON ?auto_631692 ?auto_631691 ) ( ON ?auto_631693 ?auto_631692 ) ( ON ?auto_631694 ?auto_631693 ) ( ON ?auto_631695 ?auto_631694 ) ( not ( = ?auto_631686 ?auto_631687 ) ) ( not ( = ?auto_631686 ?auto_631688 ) ) ( not ( = ?auto_631686 ?auto_631690 ) ) ( not ( = ?auto_631686 ?auto_631689 ) ) ( not ( = ?auto_631686 ?auto_631691 ) ) ( not ( = ?auto_631686 ?auto_631692 ) ) ( not ( = ?auto_631686 ?auto_631693 ) ) ( not ( = ?auto_631686 ?auto_631694 ) ) ( not ( = ?auto_631686 ?auto_631695 ) ) ( not ( = ?auto_631686 ?auto_631696 ) ) ( not ( = ?auto_631686 ?auto_631697 ) ) ( not ( = ?auto_631686 ?auto_631702 ) ) ( not ( = ?auto_631687 ?auto_631688 ) ) ( not ( = ?auto_631687 ?auto_631690 ) ) ( not ( = ?auto_631687 ?auto_631689 ) ) ( not ( = ?auto_631687 ?auto_631691 ) ) ( not ( = ?auto_631687 ?auto_631692 ) ) ( not ( = ?auto_631687 ?auto_631693 ) ) ( not ( = ?auto_631687 ?auto_631694 ) ) ( not ( = ?auto_631687 ?auto_631695 ) ) ( not ( = ?auto_631687 ?auto_631696 ) ) ( not ( = ?auto_631687 ?auto_631697 ) ) ( not ( = ?auto_631687 ?auto_631702 ) ) ( not ( = ?auto_631688 ?auto_631690 ) ) ( not ( = ?auto_631688 ?auto_631689 ) ) ( not ( = ?auto_631688 ?auto_631691 ) ) ( not ( = ?auto_631688 ?auto_631692 ) ) ( not ( = ?auto_631688 ?auto_631693 ) ) ( not ( = ?auto_631688 ?auto_631694 ) ) ( not ( = ?auto_631688 ?auto_631695 ) ) ( not ( = ?auto_631688 ?auto_631696 ) ) ( not ( = ?auto_631688 ?auto_631697 ) ) ( not ( = ?auto_631688 ?auto_631702 ) ) ( not ( = ?auto_631690 ?auto_631689 ) ) ( not ( = ?auto_631690 ?auto_631691 ) ) ( not ( = ?auto_631690 ?auto_631692 ) ) ( not ( = ?auto_631690 ?auto_631693 ) ) ( not ( = ?auto_631690 ?auto_631694 ) ) ( not ( = ?auto_631690 ?auto_631695 ) ) ( not ( = ?auto_631690 ?auto_631696 ) ) ( not ( = ?auto_631690 ?auto_631697 ) ) ( not ( = ?auto_631690 ?auto_631702 ) ) ( not ( = ?auto_631689 ?auto_631691 ) ) ( not ( = ?auto_631689 ?auto_631692 ) ) ( not ( = ?auto_631689 ?auto_631693 ) ) ( not ( = ?auto_631689 ?auto_631694 ) ) ( not ( = ?auto_631689 ?auto_631695 ) ) ( not ( = ?auto_631689 ?auto_631696 ) ) ( not ( = ?auto_631689 ?auto_631697 ) ) ( not ( = ?auto_631689 ?auto_631702 ) ) ( not ( = ?auto_631691 ?auto_631692 ) ) ( not ( = ?auto_631691 ?auto_631693 ) ) ( not ( = ?auto_631691 ?auto_631694 ) ) ( not ( = ?auto_631691 ?auto_631695 ) ) ( not ( = ?auto_631691 ?auto_631696 ) ) ( not ( = ?auto_631691 ?auto_631697 ) ) ( not ( = ?auto_631691 ?auto_631702 ) ) ( not ( = ?auto_631692 ?auto_631693 ) ) ( not ( = ?auto_631692 ?auto_631694 ) ) ( not ( = ?auto_631692 ?auto_631695 ) ) ( not ( = ?auto_631692 ?auto_631696 ) ) ( not ( = ?auto_631692 ?auto_631697 ) ) ( not ( = ?auto_631692 ?auto_631702 ) ) ( not ( = ?auto_631693 ?auto_631694 ) ) ( not ( = ?auto_631693 ?auto_631695 ) ) ( not ( = ?auto_631693 ?auto_631696 ) ) ( not ( = ?auto_631693 ?auto_631697 ) ) ( not ( = ?auto_631693 ?auto_631702 ) ) ( not ( = ?auto_631694 ?auto_631695 ) ) ( not ( = ?auto_631694 ?auto_631696 ) ) ( not ( = ?auto_631694 ?auto_631697 ) ) ( not ( = ?auto_631694 ?auto_631702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631695 ?auto_631696 ?auto_631697 )
      ( MAKE-11CRATE-VERIFY ?auto_631686 ?auto_631687 ?auto_631688 ?auto_631690 ?auto_631689 ?auto_631691 ?auto_631692 ?auto_631693 ?auto_631694 ?auto_631695 ?auto_631696 ?auto_631697 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631704 - SURFACE
      ?auto_631705 - SURFACE
      ?auto_631706 - SURFACE
      ?auto_631708 - SURFACE
      ?auto_631707 - SURFACE
      ?auto_631709 - SURFACE
      ?auto_631710 - SURFACE
      ?auto_631711 - SURFACE
      ?auto_631712 - SURFACE
      ?auto_631713 - SURFACE
      ?auto_631714 - SURFACE
      ?auto_631715 - SURFACE
      ?auto_631716 - SURFACE
    )
    :vars
    (
      ?auto_631722 - HOIST
      ?auto_631720 - PLACE
      ?auto_631718 - PLACE
      ?auto_631717 - HOIST
      ?auto_631721 - SURFACE
      ?auto_631719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631722 ?auto_631720 ) ( IS-CRATE ?auto_631716 ) ( not ( = ?auto_631715 ?auto_631716 ) ) ( not ( = ?auto_631714 ?auto_631715 ) ) ( not ( = ?auto_631714 ?auto_631716 ) ) ( not ( = ?auto_631718 ?auto_631720 ) ) ( HOIST-AT ?auto_631717 ?auto_631718 ) ( not ( = ?auto_631722 ?auto_631717 ) ) ( AVAILABLE ?auto_631717 ) ( SURFACE-AT ?auto_631716 ?auto_631718 ) ( ON ?auto_631716 ?auto_631721 ) ( CLEAR ?auto_631716 ) ( not ( = ?auto_631715 ?auto_631721 ) ) ( not ( = ?auto_631716 ?auto_631721 ) ) ( not ( = ?auto_631714 ?auto_631721 ) ) ( SURFACE-AT ?auto_631714 ?auto_631720 ) ( CLEAR ?auto_631714 ) ( IS-CRATE ?auto_631715 ) ( AVAILABLE ?auto_631722 ) ( IN ?auto_631715 ?auto_631719 ) ( TRUCK-AT ?auto_631719 ?auto_631718 ) ( ON ?auto_631705 ?auto_631704 ) ( ON ?auto_631706 ?auto_631705 ) ( ON ?auto_631708 ?auto_631706 ) ( ON ?auto_631707 ?auto_631708 ) ( ON ?auto_631709 ?auto_631707 ) ( ON ?auto_631710 ?auto_631709 ) ( ON ?auto_631711 ?auto_631710 ) ( ON ?auto_631712 ?auto_631711 ) ( ON ?auto_631713 ?auto_631712 ) ( ON ?auto_631714 ?auto_631713 ) ( not ( = ?auto_631704 ?auto_631705 ) ) ( not ( = ?auto_631704 ?auto_631706 ) ) ( not ( = ?auto_631704 ?auto_631708 ) ) ( not ( = ?auto_631704 ?auto_631707 ) ) ( not ( = ?auto_631704 ?auto_631709 ) ) ( not ( = ?auto_631704 ?auto_631710 ) ) ( not ( = ?auto_631704 ?auto_631711 ) ) ( not ( = ?auto_631704 ?auto_631712 ) ) ( not ( = ?auto_631704 ?auto_631713 ) ) ( not ( = ?auto_631704 ?auto_631714 ) ) ( not ( = ?auto_631704 ?auto_631715 ) ) ( not ( = ?auto_631704 ?auto_631716 ) ) ( not ( = ?auto_631704 ?auto_631721 ) ) ( not ( = ?auto_631705 ?auto_631706 ) ) ( not ( = ?auto_631705 ?auto_631708 ) ) ( not ( = ?auto_631705 ?auto_631707 ) ) ( not ( = ?auto_631705 ?auto_631709 ) ) ( not ( = ?auto_631705 ?auto_631710 ) ) ( not ( = ?auto_631705 ?auto_631711 ) ) ( not ( = ?auto_631705 ?auto_631712 ) ) ( not ( = ?auto_631705 ?auto_631713 ) ) ( not ( = ?auto_631705 ?auto_631714 ) ) ( not ( = ?auto_631705 ?auto_631715 ) ) ( not ( = ?auto_631705 ?auto_631716 ) ) ( not ( = ?auto_631705 ?auto_631721 ) ) ( not ( = ?auto_631706 ?auto_631708 ) ) ( not ( = ?auto_631706 ?auto_631707 ) ) ( not ( = ?auto_631706 ?auto_631709 ) ) ( not ( = ?auto_631706 ?auto_631710 ) ) ( not ( = ?auto_631706 ?auto_631711 ) ) ( not ( = ?auto_631706 ?auto_631712 ) ) ( not ( = ?auto_631706 ?auto_631713 ) ) ( not ( = ?auto_631706 ?auto_631714 ) ) ( not ( = ?auto_631706 ?auto_631715 ) ) ( not ( = ?auto_631706 ?auto_631716 ) ) ( not ( = ?auto_631706 ?auto_631721 ) ) ( not ( = ?auto_631708 ?auto_631707 ) ) ( not ( = ?auto_631708 ?auto_631709 ) ) ( not ( = ?auto_631708 ?auto_631710 ) ) ( not ( = ?auto_631708 ?auto_631711 ) ) ( not ( = ?auto_631708 ?auto_631712 ) ) ( not ( = ?auto_631708 ?auto_631713 ) ) ( not ( = ?auto_631708 ?auto_631714 ) ) ( not ( = ?auto_631708 ?auto_631715 ) ) ( not ( = ?auto_631708 ?auto_631716 ) ) ( not ( = ?auto_631708 ?auto_631721 ) ) ( not ( = ?auto_631707 ?auto_631709 ) ) ( not ( = ?auto_631707 ?auto_631710 ) ) ( not ( = ?auto_631707 ?auto_631711 ) ) ( not ( = ?auto_631707 ?auto_631712 ) ) ( not ( = ?auto_631707 ?auto_631713 ) ) ( not ( = ?auto_631707 ?auto_631714 ) ) ( not ( = ?auto_631707 ?auto_631715 ) ) ( not ( = ?auto_631707 ?auto_631716 ) ) ( not ( = ?auto_631707 ?auto_631721 ) ) ( not ( = ?auto_631709 ?auto_631710 ) ) ( not ( = ?auto_631709 ?auto_631711 ) ) ( not ( = ?auto_631709 ?auto_631712 ) ) ( not ( = ?auto_631709 ?auto_631713 ) ) ( not ( = ?auto_631709 ?auto_631714 ) ) ( not ( = ?auto_631709 ?auto_631715 ) ) ( not ( = ?auto_631709 ?auto_631716 ) ) ( not ( = ?auto_631709 ?auto_631721 ) ) ( not ( = ?auto_631710 ?auto_631711 ) ) ( not ( = ?auto_631710 ?auto_631712 ) ) ( not ( = ?auto_631710 ?auto_631713 ) ) ( not ( = ?auto_631710 ?auto_631714 ) ) ( not ( = ?auto_631710 ?auto_631715 ) ) ( not ( = ?auto_631710 ?auto_631716 ) ) ( not ( = ?auto_631710 ?auto_631721 ) ) ( not ( = ?auto_631711 ?auto_631712 ) ) ( not ( = ?auto_631711 ?auto_631713 ) ) ( not ( = ?auto_631711 ?auto_631714 ) ) ( not ( = ?auto_631711 ?auto_631715 ) ) ( not ( = ?auto_631711 ?auto_631716 ) ) ( not ( = ?auto_631711 ?auto_631721 ) ) ( not ( = ?auto_631712 ?auto_631713 ) ) ( not ( = ?auto_631712 ?auto_631714 ) ) ( not ( = ?auto_631712 ?auto_631715 ) ) ( not ( = ?auto_631712 ?auto_631716 ) ) ( not ( = ?auto_631712 ?auto_631721 ) ) ( not ( = ?auto_631713 ?auto_631714 ) ) ( not ( = ?auto_631713 ?auto_631715 ) ) ( not ( = ?auto_631713 ?auto_631716 ) ) ( not ( = ?auto_631713 ?auto_631721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631714 ?auto_631715 ?auto_631716 )
      ( MAKE-12CRATE-VERIFY ?auto_631704 ?auto_631705 ?auto_631706 ?auto_631708 ?auto_631707 ?auto_631709 ?auto_631710 ?auto_631711 ?auto_631712 ?auto_631713 ?auto_631714 ?auto_631715 ?auto_631716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_631723 - SURFACE
      ?auto_631724 - SURFACE
    )
    :vars
    (
      ?auto_631731 - HOIST
      ?auto_631729 - PLACE
      ?auto_631728 - SURFACE
      ?auto_631726 - PLACE
      ?auto_631725 - HOIST
      ?auto_631730 - SURFACE
      ?auto_631727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631731 ?auto_631729 ) ( IS-CRATE ?auto_631724 ) ( not ( = ?auto_631723 ?auto_631724 ) ) ( not ( = ?auto_631728 ?auto_631723 ) ) ( not ( = ?auto_631728 ?auto_631724 ) ) ( not ( = ?auto_631726 ?auto_631729 ) ) ( HOIST-AT ?auto_631725 ?auto_631726 ) ( not ( = ?auto_631731 ?auto_631725 ) ) ( SURFACE-AT ?auto_631724 ?auto_631726 ) ( ON ?auto_631724 ?auto_631730 ) ( CLEAR ?auto_631724 ) ( not ( = ?auto_631723 ?auto_631730 ) ) ( not ( = ?auto_631724 ?auto_631730 ) ) ( not ( = ?auto_631728 ?auto_631730 ) ) ( SURFACE-AT ?auto_631728 ?auto_631729 ) ( CLEAR ?auto_631728 ) ( IS-CRATE ?auto_631723 ) ( AVAILABLE ?auto_631731 ) ( TRUCK-AT ?auto_631727 ?auto_631726 ) ( LIFTING ?auto_631725 ?auto_631723 ) )
    :subtasks
    ( ( !LOAD ?auto_631725 ?auto_631723 ?auto_631727 ?auto_631726 )
      ( MAKE-2CRATE ?auto_631728 ?auto_631723 ?auto_631724 )
      ( MAKE-1CRATE-VERIFY ?auto_631723 ?auto_631724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_631732 - SURFACE
      ?auto_631733 - SURFACE
      ?auto_631734 - SURFACE
    )
    :vars
    (
      ?auto_631739 - HOIST
      ?auto_631735 - PLACE
      ?auto_631737 - PLACE
      ?auto_631740 - HOIST
      ?auto_631736 - SURFACE
      ?auto_631738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631739 ?auto_631735 ) ( IS-CRATE ?auto_631734 ) ( not ( = ?auto_631733 ?auto_631734 ) ) ( not ( = ?auto_631732 ?auto_631733 ) ) ( not ( = ?auto_631732 ?auto_631734 ) ) ( not ( = ?auto_631737 ?auto_631735 ) ) ( HOIST-AT ?auto_631740 ?auto_631737 ) ( not ( = ?auto_631739 ?auto_631740 ) ) ( SURFACE-AT ?auto_631734 ?auto_631737 ) ( ON ?auto_631734 ?auto_631736 ) ( CLEAR ?auto_631734 ) ( not ( = ?auto_631733 ?auto_631736 ) ) ( not ( = ?auto_631734 ?auto_631736 ) ) ( not ( = ?auto_631732 ?auto_631736 ) ) ( SURFACE-AT ?auto_631732 ?auto_631735 ) ( CLEAR ?auto_631732 ) ( IS-CRATE ?auto_631733 ) ( AVAILABLE ?auto_631739 ) ( TRUCK-AT ?auto_631738 ?auto_631737 ) ( LIFTING ?auto_631740 ?auto_631733 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_631733 ?auto_631734 )
      ( MAKE-2CRATE-VERIFY ?auto_631732 ?auto_631733 ?auto_631734 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_631741 - SURFACE
      ?auto_631742 - SURFACE
      ?auto_631743 - SURFACE
      ?auto_631744 - SURFACE
    )
    :vars
    (
      ?auto_631749 - HOIST
      ?auto_631750 - PLACE
      ?auto_631748 - PLACE
      ?auto_631747 - HOIST
      ?auto_631746 - SURFACE
      ?auto_631745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631749 ?auto_631750 ) ( IS-CRATE ?auto_631744 ) ( not ( = ?auto_631743 ?auto_631744 ) ) ( not ( = ?auto_631742 ?auto_631743 ) ) ( not ( = ?auto_631742 ?auto_631744 ) ) ( not ( = ?auto_631748 ?auto_631750 ) ) ( HOIST-AT ?auto_631747 ?auto_631748 ) ( not ( = ?auto_631749 ?auto_631747 ) ) ( SURFACE-AT ?auto_631744 ?auto_631748 ) ( ON ?auto_631744 ?auto_631746 ) ( CLEAR ?auto_631744 ) ( not ( = ?auto_631743 ?auto_631746 ) ) ( not ( = ?auto_631744 ?auto_631746 ) ) ( not ( = ?auto_631742 ?auto_631746 ) ) ( SURFACE-AT ?auto_631742 ?auto_631750 ) ( CLEAR ?auto_631742 ) ( IS-CRATE ?auto_631743 ) ( AVAILABLE ?auto_631749 ) ( TRUCK-AT ?auto_631745 ?auto_631748 ) ( LIFTING ?auto_631747 ?auto_631743 ) ( ON ?auto_631742 ?auto_631741 ) ( not ( = ?auto_631741 ?auto_631742 ) ) ( not ( = ?auto_631741 ?auto_631743 ) ) ( not ( = ?auto_631741 ?auto_631744 ) ) ( not ( = ?auto_631741 ?auto_631746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631742 ?auto_631743 ?auto_631744 )
      ( MAKE-3CRATE-VERIFY ?auto_631741 ?auto_631742 ?auto_631743 ?auto_631744 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_631751 - SURFACE
      ?auto_631752 - SURFACE
      ?auto_631753 - SURFACE
      ?auto_631755 - SURFACE
      ?auto_631754 - SURFACE
    )
    :vars
    (
      ?auto_631760 - HOIST
      ?auto_631761 - PLACE
      ?auto_631759 - PLACE
      ?auto_631758 - HOIST
      ?auto_631757 - SURFACE
      ?auto_631756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631760 ?auto_631761 ) ( IS-CRATE ?auto_631754 ) ( not ( = ?auto_631755 ?auto_631754 ) ) ( not ( = ?auto_631753 ?auto_631755 ) ) ( not ( = ?auto_631753 ?auto_631754 ) ) ( not ( = ?auto_631759 ?auto_631761 ) ) ( HOIST-AT ?auto_631758 ?auto_631759 ) ( not ( = ?auto_631760 ?auto_631758 ) ) ( SURFACE-AT ?auto_631754 ?auto_631759 ) ( ON ?auto_631754 ?auto_631757 ) ( CLEAR ?auto_631754 ) ( not ( = ?auto_631755 ?auto_631757 ) ) ( not ( = ?auto_631754 ?auto_631757 ) ) ( not ( = ?auto_631753 ?auto_631757 ) ) ( SURFACE-AT ?auto_631753 ?auto_631761 ) ( CLEAR ?auto_631753 ) ( IS-CRATE ?auto_631755 ) ( AVAILABLE ?auto_631760 ) ( TRUCK-AT ?auto_631756 ?auto_631759 ) ( LIFTING ?auto_631758 ?auto_631755 ) ( ON ?auto_631752 ?auto_631751 ) ( ON ?auto_631753 ?auto_631752 ) ( not ( = ?auto_631751 ?auto_631752 ) ) ( not ( = ?auto_631751 ?auto_631753 ) ) ( not ( = ?auto_631751 ?auto_631755 ) ) ( not ( = ?auto_631751 ?auto_631754 ) ) ( not ( = ?auto_631751 ?auto_631757 ) ) ( not ( = ?auto_631752 ?auto_631753 ) ) ( not ( = ?auto_631752 ?auto_631755 ) ) ( not ( = ?auto_631752 ?auto_631754 ) ) ( not ( = ?auto_631752 ?auto_631757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631753 ?auto_631755 ?auto_631754 )
      ( MAKE-4CRATE-VERIFY ?auto_631751 ?auto_631752 ?auto_631753 ?auto_631755 ?auto_631754 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_631762 - SURFACE
      ?auto_631763 - SURFACE
      ?auto_631764 - SURFACE
      ?auto_631766 - SURFACE
      ?auto_631765 - SURFACE
      ?auto_631767 - SURFACE
    )
    :vars
    (
      ?auto_631772 - HOIST
      ?auto_631773 - PLACE
      ?auto_631771 - PLACE
      ?auto_631770 - HOIST
      ?auto_631769 - SURFACE
      ?auto_631768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631772 ?auto_631773 ) ( IS-CRATE ?auto_631767 ) ( not ( = ?auto_631765 ?auto_631767 ) ) ( not ( = ?auto_631766 ?auto_631765 ) ) ( not ( = ?auto_631766 ?auto_631767 ) ) ( not ( = ?auto_631771 ?auto_631773 ) ) ( HOIST-AT ?auto_631770 ?auto_631771 ) ( not ( = ?auto_631772 ?auto_631770 ) ) ( SURFACE-AT ?auto_631767 ?auto_631771 ) ( ON ?auto_631767 ?auto_631769 ) ( CLEAR ?auto_631767 ) ( not ( = ?auto_631765 ?auto_631769 ) ) ( not ( = ?auto_631767 ?auto_631769 ) ) ( not ( = ?auto_631766 ?auto_631769 ) ) ( SURFACE-AT ?auto_631766 ?auto_631773 ) ( CLEAR ?auto_631766 ) ( IS-CRATE ?auto_631765 ) ( AVAILABLE ?auto_631772 ) ( TRUCK-AT ?auto_631768 ?auto_631771 ) ( LIFTING ?auto_631770 ?auto_631765 ) ( ON ?auto_631763 ?auto_631762 ) ( ON ?auto_631764 ?auto_631763 ) ( ON ?auto_631766 ?auto_631764 ) ( not ( = ?auto_631762 ?auto_631763 ) ) ( not ( = ?auto_631762 ?auto_631764 ) ) ( not ( = ?auto_631762 ?auto_631766 ) ) ( not ( = ?auto_631762 ?auto_631765 ) ) ( not ( = ?auto_631762 ?auto_631767 ) ) ( not ( = ?auto_631762 ?auto_631769 ) ) ( not ( = ?auto_631763 ?auto_631764 ) ) ( not ( = ?auto_631763 ?auto_631766 ) ) ( not ( = ?auto_631763 ?auto_631765 ) ) ( not ( = ?auto_631763 ?auto_631767 ) ) ( not ( = ?auto_631763 ?auto_631769 ) ) ( not ( = ?auto_631764 ?auto_631766 ) ) ( not ( = ?auto_631764 ?auto_631765 ) ) ( not ( = ?auto_631764 ?auto_631767 ) ) ( not ( = ?auto_631764 ?auto_631769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631766 ?auto_631765 ?auto_631767 )
      ( MAKE-5CRATE-VERIFY ?auto_631762 ?auto_631763 ?auto_631764 ?auto_631766 ?auto_631765 ?auto_631767 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_631774 - SURFACE
      ?auto_631775 - SURFACE
      ?auto_631776 - SURFACE
      ?auto_631778 - SURFACE
      ?auto_631777 - SURFACE
      ?auto_631779 - SURFACE
      ?auto_631780 - SURFACE
    )
    :vars
    (
      ?auto_631785 - HOIST
      ?auto_631786 - PLACE
      ?auto_631784 - PLACE
      ?auto_631783 - HOIST
      ?auto_631782 - SURFACE
      ?auto_631781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631785 ?auto_631786 ) ( IS-CRATE ?auto_631780 ) ( not ( = ?auto_631779 ?auto_631780 ) ) ( not ( = ?auto_631777 ?auto_631779 ) ) ( not ( = ?auto_631777 ?auto_631780 ) ) ( not ( = ?auto_631784 ?auto_631786 ) ) ( HOIST-AT ?auto_631783 ?auto_631784 ) ( not ( = ?auto_631785 ?auto_631783 ) ) ( SURFACE-AT ?auto_631780 ?auto_631784 ) ( ON ?auto_631780 ?auto_631782 ) ( CLEAR ?auto_631780 ) ( not ( = ?auto_631779 ?auto_631782 ) ) ( not ( = ?auto_631780 ?auto_631782 ) ) ( not ( = ?auto_631777 ?auto_631782 ) ) ( SURFACE-AT ?auto_631777 ?auto_631786 ) ( CLEAR ?auto_631777 ) ( IS-CRATE ?auto_631779 ) ( AVAILABLE ?auto_631785 ) ( TRUCK-AT ?auto_631781 ?auto_631784 ) ( LIFTING ?auto_631783 ?auto_631779 ) ( ON ?auto_631775 ?auto_631774 ) ( ON ?auto_631776 ?auto_631775 ) ( ON ?auto_631778 ?auto_631776 ) ( ON ?auto_631777 ?auto_631778 ) ( not ( = ?auto_631774 ?auto_631775 ) ) ( not ( = ?auto_631774 ?auto_631776 ) ) ( not ( = ?auto_631774 ?auto_631778 ) ) ( not ( = ?auto_631774 ?auto_631777 ) ) ( not ( = ?auto_631774 ?auto_631779 ) ) ( not ( = ?auto_631774 ?auto_631780 ) ) ( not ( = ?auto_631774 ?auto_631782 ) ) ( not ( = ?auto_631775 ?auto_631776 ) ) ( not ( = ?auto_631775 ?auto_631778 ) ) ( not ( = ?auto_631775 ?auto_631777 ) ) ( not ( = ?auto_631775 ?auto_631779 ) ) ( not ( = ?auto_631775 ?auto_631780 ) ) ( not ( = ?auto_631775 ?auto_631782 ) ) ( not ( = ?auto_631776 ?auto_631778 ) ) ( not ( = ?auto_631776 ?auto_631777 ) ) ( not ( = ?auto_631776 ?auto_631779 ) ) ( not ( = ?auto_631776 ?auto_631780 ) ) ( not ( = ?auto_631776 ?auto_631782 ) ) ( not ( = ?auto_631778 ?auto_631777 ) ) ( not ( = ?auto_631778 ?auto_631779 ) ) ( not ( = ?auto_631778 ?auto_631780 ) ) ( not ( = ?auto_631778 ?auto_631782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631777 ?auto_631779 ?auto_631780 )
      ( MAKE-6CRATE-VERIFY ?auto_631774 ?auto_631775 ?auto_631776 ?auto_631778 ?auto_631777 ?auto_631779 ?auto_631780 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_631787 - SURFACE
      ?auto_631788 - SURFACE
      ?auto_631789 - SURFACE
      ?auto_631791 - SURFACE
      ?auto_631790 - SURFACE
      ?auto_631792 - SURFACE
      ?auto_631793 - SURFACE
      ?auto_631794 - SURFACE
    )
    :vars
    (
      ?auto_631799 - HOIST
      ?auto_631800 - PLACE
      ?auto_631798 - PLACE
      ?auto_631797 - HOIST
      ?auto_631796 - SURFACE
      ?auto_631795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631799 ?auto_631800 ) ( IS-CRATE ?auto_631794 ) ( not ( = ?auto_631793 ?auto_631794 ) ) ( not ( = ?auto_631792 ?auto_631793 ) ) ( not ( = ?auto_631792 ?auto_631794 ) ) ( not ( = ?auto_631798 ?auto_631800 ) ) ( HOIST-AT ?auto_631797 ?auto_631798 ) ( not ( = ?auto_631799 ?auto_631797 ) ) ( SURFACE-AT ?auto_631794 ?auto_631798 ) ( ON ?auto_631794 ?auto_631796 ) ( CLEAR ?auto_631794 ) ( not ( = ?auto_631793 ?auto_631796 ) ) ( not ( = ?auto_631794 ?auto_631796 ) ) ( not ( = ?auto_631792 ?auto_631796 ) ) ( SURFACE-AT ?auto_631792 ?auto_631800 ) ( CLEAR ?auto_631792 ) ( IS-CRATE ?auto_631793 ) ( AVAILABLE ?auto_631799 ) ( TRUCK-AT ?auto_631795 ?auto_631798 ) ( LIFTING ?auto_631797 ?auto_631793 ) ( ON ?auto_631788 ?auto_631787 ) ( ON ?auto_631789 ?auto_631788 ) ( ON ?auto_631791 ?auto_631789 ) ( ON ?auto_631790 ?auto_631791 ) ( ON ?auto_631792 ?auto_631790 ) ( not ( = ?auto_631787 ?auto_631788 ) ) ( not ( = ?auto_631787 ?auto_631789 ) ) ( not ( = ?auto_631787 ?auto_631791 ) ) ( not ( = ?auto_631787 ?auto_631790 ) ) ( not ( = ?auto_631787 ?auto_631792 ) ) ( not ( = ?auto_631787 ?auto_631793 ) ) ( not ( = ?auto_631787 ?auto_631794 ) ) ( not ( = ?auto_631787 ?auto_631796 ) ) ( not ( = ?auto_631788 ?auto_631789 ) ) ( not ( = ?auto_631788 ?auto_631791 ) ) ( not ( = ?auto_631788 ?auto_631790 ) ) ( not ( = ?auto_631788 ?auto_631792 ) ) ( not ( = ?auto_631788 ?auto_631793 ) ) ( not ( = ?auto_631788 ?auto_631794 ) ) ( not ( = ?auto_631788 ?auto_631796 ) ) ( not ( = ?auto_631789 ?auto_631791 ) ) ( not ( = ?auto_631789 ?auto_631790 ) ) ( not ( = ?auto_631789 ?auto_631792 ) ) ( not ( = ?auto_631789 ?auto_631793 ) ) ( not ( = ?auto_631789 ?auto_631794 ) ) ( not ( = ?auto_631789 ?auto_631796 ) ) ( not ( = ?auto_631791 ?auto_631790 ) ) ( not ( = ?auto_631791 ?auto_631792 ) ) ( not ( = ?auto_631791 ?auto_631793 ) ) ( not ( = ?auto_631791 ?auto_631794 ) ) ( not ( = ?auto_631791 ?auto_631796 ) ) ( not ( = ?auto_631790 ?auto_631792 ) ) ( not ( = ?auto_631790 ?auto_631793 ) ) ( not ( = ?auto_631790 ?auto_631794 ) ) ( not ( = ?auto_631790 ?auto_631796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631792 ?auto_631793 ?auto_631794 )
      ( MAKE-7CRATE-VERIFY ?auto_631787 ?auto_631788 ?auto_631789 ?auto_631791 ?auto_631790 ?auto_631792 ?auto_631793 ?auto_631794 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_631801 - SURFACE
      ?auto_631802 - SURFACE
      ?auto_631803 - SURFACE
      ?auto_631805 - SURFACE
      ?auto_631804 - SURFACE
      ?auto_631806 - SURFACE
      ?auto_631807 - SURFACE
      ?auto_631808 - SURFACE
      ?auto_631809 - SURFACE
    )
    :vars
    (
      ?auto_631814 - HOIST
      ?auto_631815 - PLACE
      ?auto_631813 - PLACE
      ?auto_631812 - HOIST
      ?auto_631811 - SURFACE
      ?auto_631810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631814 ?auto_631815 ) ( IS-CRATE ?auto_631809 ) ( not ( = ?auto_631808 ?auto_631809 ) ) ( not ( = ?auto_631807 ?auto_631808 ) ) ( not ( = ?auto_631807 ?auto_631809 ) ) ( not ( = ?auto_631813 ?auto_631815 ) ) ( HOIST-AT ?auto_631812 ?auto_631813 ) ( not ( = ?auto_631814 ?auto_631812 ) ) ( SURFACE-AT ?auto_631809 ?auto_631813 ) ( ON ?auto_631809 ?auto_631811 ) ( CLEAR ?auto_631809 ) ( not ( = ?auto_631808 ?auto_631811 ) ) ( not ( = ?auto_631809 ?auto_631811 ) ) ( not ( = ?auto_631807 ?auto_631811 ) ) ( SURFACE-AT ?auto_631807 ?auto_631815 ) ( CLEAR ?auto_631807 ) ( IS-CRATE ?auto_631808 ) ( AVAILABLE ?auto_631814 ) ( TRUCK-AT ?auto_631810 ?auto_631813 ) ( LIFTING ?auto_631812 ?auto_631808 ) ( ON ?auto_631802 ?auto_631801 ) ( ON ?auto_631803 ?auto_631802 ) ( ON ?auto_631805 ?auto_631803 ) ( ON ?auto_631804 ?auto_631805 ) ( ON ?auto_631806 ?auto_631804 ) ( ON ?auto_631807 ?auto_631806 ) ( not ( = ?auto_631801 ?auto_631802 ) ) ( not ( = ?auto_631801 ?auto_631803 ) ) ( not ( = ?auto_631801 ?auto_631805 ) ) ( not ( = ?auto_631801 ?auto_631804 ) ) ( not ( = ?auto_631801 ?auto_631806 ) ) ( not ( = ?auto_631801 ?auto_631807 ) ) ( not ( = ?auto_631801 ?auto_631808 ) ) ( not ( = ?auto_631801 ?auto_631809 ) ) ( not ( = ?auto_631801 ?auto_631811 ) ) ( not ( = ?auto_631802 ?auto_631803 ) ) ( not ( = ?auto_631802 ?auto_631805 ) ) ( not ( = ?auto_631802 ?auto_631804 ) ) ( not ( = ?auto_631802 ?auto_631806 ) ) ( not ( = ?auto_631802 ?auto_631807 ) ) ( not ( = ?auto_631802 ?auto_631808 ) ) ( not ( = ?auto_631802 ?auto_631809 ) ) ( not ( = ?auto_631802 ?auto_631811 ) ) ( not ( = ?auto_631803 ?auto_631805 ) ) ( not ( = ?auto_631803 ?auto_631804 ) ) ( not ( = ?auto_631803 ?auto_631806 ) ) ( not ( = ?auto_631803 ?auto_631807 ) ) ( not ( = ?auto_631803 ?auto_631808 ) ) ( not ( = ?auto_631803 ?auto_631809 ) ) ( not ( = ?auto_631803 ?auto_631811 ) ) ( not ( = ?auto_631805 ?auto_631804 ) ) ( not ( = ?auto_631805 ?auto_631806 ) ) ( not ( = ?auto_631805 ?auto_631807 ) ) ( not ( = ?auto_631805 ?auto_631808 ) ) ( not ( = ?auto_631805 ?auto_631809 ) ) ( not ( = ?auto_631805 ?auto_631811 ) ) ( not ( = ?auto_631804 ?auto_631806 ) ) ( not ( = ?auto_631804 ?auto_631807 ) ) ( not ( = ?auto_631804 ?auto_631808 ) ) ( not ( = ?auto_631804 ?auto_631809 ) ) ( not ( = ?auto_631804 ?auto_631811 ) ) ( not ( = ?auto_631806 ?auto_631807 ) ) ( not ( = ?auto_631806 ?auto_631808 ) ) ( not ( = ?auto_631806 ?auto_631809 ) ) ( not ( = ?auto_631806 ?auto_631811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631807 ?auto_631808 ?auto_631809 )
      ( MAKE-8CRATE-VERIFY ?auto_631801 ?auto_631802 ?auto_631803 ?auto_631805 ?auto_631804 ?auto_631806 ?auto_631807 ?auto_631808 ?auto_631809 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_631816 - SURFACE
      ?auto_631817 - SURFACE
      ?auto_631818 - SURFACE
      ?auto_631820 - SURFACE
      ?auto_631819 - SURFACE
      ?auto_631821 - SURFACE
      ?auto_631822 - SURFACE
      ?auto_631823 - SURFACE
      ?auto_631824 - SURFACE
      ?auto_631825 - SURFACE
    )
    :vars
    (
      ?auto_631830 - HOIST
      ?auto_631831 - PLACE
      ?auto_631829 - PLACE
      ?auto_631828 - HOIST
      ?auto_631827 - SURFACE
      ?auto_631826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631830 ?auto_631831 ) ( IS-CRATE ?auto_631825 ) ( not ( = ?auto_631824 ?auto_631825 ) ) ( not ( = ?auto_631823 ?auto_631824 ) ) ( not ( = ?auto_631823 ?auto_631825 ) ) ( not ( = ?auto_631829 ?auto_631831 ) ) ( HOIST-AT ?auto_631828 ?auto_631829 ) ( not ( = ?auto_631830 ?auto_631828 ) ) ( SURFACE-AT ?auto_631825 ?auto_631829 ) ( ON ?auto_631825 ?auto_631827 ) ( CLEAR ?auto_631825 ) ( not ( = ?auto_631824 ?auto_631827 ) ) ( not ( = ?auto_631825 ?auto_631827 ) ) ( not ( = ?auto_631823 ?auto_631827 ) ) ( SURFACE-AT ?auto_631823 ?auto_631831 ) ( CLEAR ?auto_631823 ) ( IS-CRATE ?auto_631824 ) ( AVAILABLE ?auto_631830 ) ( TRUCK-AT ?auto_631826 ?auto_631829 ) ( LIFTING ?auto_631828 ?auto_631824 ) ( ON ?auto_631817 ?auto_631816 ) ( ON ?auto_631818 ?auto_631817 ) ( ON ?auto_631820 ?auto_631818 ) ( ON ?auto_631819 ?auto_631820 ) ( ON ?auto_631821 ?auto_631819 ) ( ON ?auto_631822 ?auto_631821 ) ( ON ?auto_631823 ?auto_631822 ) ( not ( = ?auto_631816 ?auto_631817 ) ) ( not ( = ?auto_631816 ?auto_631818 ) ) ( not ( = ?auto_631816 ?auto_631820 ) ) ( not ( = ?auto_631816 ?auto_631819 ) ) ( not ( = ?auto_631816 ?auto_631821 ) ) ( not ( = ?auto_631816 ?auto_631822 ) ) ( not ( = ?auto_631816 ?auto_631823 ) ) ( not ( = ?auto_631816 ?auto_631824 ) ) ( not ( = ?auto_631816 ?auto_631825 ) ) ( not ( = ?auto_631816 ?auto_631827 ) ) ( not ( = ?auto_631817 ?auto_631818 ) ) ( not ( = ?auto_631817 ?auto_631820 ) ) ( not ( = ?auto_631817 ?auto_631819 ) ) ( not ( = ?auto_631817 ?auto_631821 ) ) ( not ( = ?auto_631817 ?auto_631822 ) ) ( not ( = ?auto_631817 ?auto_631823 ) ) ( not ( = ?auto_631817 ?auto_631824 ) ) ( not ( = ?auto_631817 ?auto_631825 ) ) ( not ( = ?auto_631817 ?auto_631827 ) ) ( not ( = ?auto_631818 ?auto_631820 ) ) ( not ( = ?auto_631818 ?auto_631819 ) ) ( not ( = ?auto_631818 ?auto_631821 ) ) ( not ( = ?auto_631818 ?auto_631822 ) ) ( not ( = ?auto_631818 ?auto_631823 ) ) ( not ( = ?auto_631818 ?auto_631824 ) ) ( not ( = ?auto_631818 ?auto_631825 ) ) ( not ( = ?auto_631818 ?auto_631827 ) ) ( not ( = ?auto_631820 ?auto_631819 ) ) ( not ( = ?auto_631820 ?auto_631821 ) ) ( not ( = ?auto_631820 ?auto_631822 ) ) ( not ( = ?auto_631820 ?auto_631823 ) ) ( not ( = ?auto_631820 ?auto_631824 ) ) ( not ( = ?auto_631820 ?auto_631825 ) ) ( not ( = ?auto_631820 ?auto_631827 ) ) ( not ( = ?auto_631819 ?auto_631821 ) ) ( not ( = ?auto_631819 ?auto_631822 ) ) ( not ( = ?auto_631819 ?auto_631823 ) ) ( not ( = ?auto_631819 ?auto_631824 ) ) ( not ( = ?auto_631819 ?auto_631825 ) ) ( not ( = ?auto_631819 ?auto_631827 ) ) ( not ( = ?auto_631821 ?auto_631822 ) ) ( not ( = ?auto_631821 ?auto_631823 ) ) ( not ( = ?auto_631821 ?auto_631824 ) ) ( not ( = ?auto_631821 ?auto_631825 ) ) ( not ( = ?auto_631821 ?auto_631827 ) ) ( not ( = ?auto_631822 ?auto_631823 ) ) ( not ( = ?auto_631822 ?auto_631824 ) ) ( not ( = ?auto_631822 ?auto_631825 ) ) ( not ( = ?auto_631822 ?auto_631827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631823 ?auto_631824 ?auto_631825 )
      ( MAKE-9CRATE-VERIFY ?auto_631816 ?auto_631817 ?auto_631818 ?auto_631820 ?auto_631819 ?auto_631821 ?auto_631822 ?auto_631823 ?auto_631824 ?auto_631825 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_631832 - SURFACE
      ?auto_631833 - SURFACE
      ?auto_631834 - SURFACE
      ?auto_631836 - SURFACE
      ?auto_631835 - SURFACE
      ?auto_631837 - SURFACE
      ?auto_631838 - SURFACE
      ?auto_631839 - SURFACE
      ?auto_631840 - SURFACE
      ?auto_631841 - SURFACE
      ?auto_631842 - SURFACE
    )
    :vars
    (
      ?auto_631847 - HOIST
      ?auto_631848 - PLACE
      ?auto_631846 - PLACE
      ?auto_631845 - HOIST
      ?auto_631844 - SURFACE
      ?auto_631843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631847 ?auto_631848 ) ( IS-CRATE ?auto_631842 ) ( not ( = ?auto_631841 ?auto_631842 ) ) ( not ( = ?auto_631840 ?auto_631841 ) ) ( not ( = ?auto_631840 ?auto_631842 ) ) ( not ( = ?auto_631846 ?auto_631848 ) ) ( HOIST-AT ?auto_631845 ?auto_631846 ) ( not ( = ?auto_631847 ?auto_631845 ) ) ( SURFACE-AT ?auto_631842 ?auto_631846 ) ( ON ?auto_631842 ?auto_631844 ) ( CLEAR ?auto_631842 ) ( not ( = ?auto_631841 ?auto_631844 ) ) ( not ( = ?auto_631842 ?auto_631844 ) ) ( not ( = ?auto_631840 ?auto_631844 ) ) ( SURFACE-AT ?auto_631840 ?auto_631848 ) ( CLEAR ?auto_631840 ) ( IS-CRATE ?auto_631841 ) ( AVAILABLE ?auto_631847 ) ( TRUCK-AT ?auto_631843 ?auto_631846 ) ( LIFTING ?auto_631845 ?auto_631841 ) ( ON ?auto_631833 ?auto_631832 ) ( ON ?auto_631834 ?auto_631833 ) ( ON ?auto_631836 ?auto_631834 ) ( ON ?auto_631835 ?auto_631836 ) ( ON ?auto_631837 ?auto_631835 ) ( ON ?auto_631838 ?auto_631837 ) ( ON ?auto_631839 ?auto_631838 ) ( ON ?auto_631840 ?auto_631839 ) ( not ( = ?auto_631832 ?auto_631833 ) ) ( not ( = ?auto_631832 ?auto_631834 ) ) ( not ( = ?auto_631832 ?auto_631836 ) ) ( not ( = ?auto_631832 ?auto_631835 ) ) ( not ( = ?auto_631832 ?auto_631837 ) ) ( not ( = ?auto_631832 ?auto_631838 ) ) ( not ( = ?auto_631832 ?auto_631839 ) ) ( not ( = ?auto_631832 ?auto_631840 ) ) ( not ( = ?auto_631832 ?auto_631841 ) ) ( not ( = ?auto_631832 ?auto_631842 ) ) ( not ( = ?auto_631832 ?auto_631844 ) ) ( not ( = ?auto_631833 ?auto_631834 ) ) ( not ( = ?auto_631833 ?auto_631836 ) ) ( not ( = ?auto_631833 ?auto_631835 ) ) ( not ( = ?auto_631833 ?auto_631837 ) ) ( not ( = ?auto_631833 ?auto_631838 ) ) ( not ( = ?auto_631833 ?auto_631839 ) ) ( not ( = ?auto_631833 ?auto_631840 ) ) ( not ( = ?auto_631833 ?auto_631841 ) ) ( not ( = ?auto_631833 ?auto_631842 ) ) ( not ( = ?auto_631833 ?auto_631844 ) ) ( not ( = ?auto_631834 ?auto_631836 ) ) ( not ( = ?auto_631834 ?auto_631835 ) ) ( not ( = ?auto_631834 ?auto_631837 ) ) ( not ( = ?auto_631834 ?auto_631838 ) ) ( not ( = ?auto_631834 ?auto_631839 ) ) ( not ( = ?auto_631834 ?auto_631840 ) ) ( not ( = ?auto_631834 ?auto_631841 ) ) ( not ( = ?auto_631834 ?auto_631842 ) ) ( not ( = ?auto_631834 ?auto_631844 ) ) ( not ( = ?auto_631836 ?auto_631835 ) ) ( not ( = ?auto_631836 ?auto_631837 ) ) ( not ( = ?auto_631836 ?auto_631838 ) ) ( not ( = ?auto_631836 ?auto_631839 ) ) ( not ( = ?auto_631836 ?auto_631840 ) ) ( not ( = ?auto_631836 ?auto_631841 ) ) ( not ( = ?auto_631836 ?auto_631842 ) ) ( not ( = ?auto_631836 ?auto_631844 ) ) ( not ( = ?auto_631835 ?auto_631837 ) ) ( not ( = ?auto_631835 ?auto_631838 ) ) ( not ( = ?auto_631835 ?auto_631839 ) ) ( not ( = ?auto_631835 ?auto_631840 ) ) ( not ( = ?auto_631835 ?auto_631841 ) ) ( not ( = ?auto_631835 ?auto_631842 ) ) ( not ( = ?auto_631835 ?auto_631844 ) ) ( not ( = ?auto_631837 ?auto_631838 ) ) ( not ( = ?auto_631837 ?auto_631839 ) ) ( not ( = ?auto_631837 ?auto_631840 ) ) ( not ( = ?auto_631837 ?auto_631841 ) ) ( not ( = ?auto_631837 ?auto_631842 ) ) ( not ( = ?auto_631837 ?auto_631844 ) ) ( not ( = ?auto_631838 ?auto_631839 ) ) ( not ( = ?auto_631838 ?auto_631840 ) ) ( not ( = ?auto_631838 ?auto_631841 ) ) ( not ( = ?auto_631838 ?auto_631842 ) ) ( not ( = ?auto_631838 ?auto_631844 ) ) ( not ( = ?auto_631839 ?auto_631840 ) ) ( not ( = ?auto_631839 ?auto_631841 ) ) ( not ( = ?auto_631839 ?auto_631842 ) ) ( not ( = ?auto_631839 ?auto_631844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631840 ?auto_631841 ?auto_631842 )
      ( MAKE-10CRATE-VERIFY ?auto_631832 ?auto_631833 ?auto_631834 ?auto_631836 ?auto_631835 ?auto_631837 ?auto_631838 ?auto_631839 ?auto_631840 ?auto_631841 ?auto_631842 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_631849 - SURFACE
      ?auto_631850 - SURFACE
      ?auto_631851 - SURFACE
      ?auto_631853 - SURFACE
      ?auto_631852 - SURFACE
      ?auto_631854 - SURFACE
      ?auto_631855 - SURFACE
      ?auto_631856 - SURFACE
      ?auto_631857 - SURFACE
      ?auto_631858 - SURFACE
      ?auto_631859 - SURFACE
      ?auto_631860 - SURFACE
    )
    :vars
    (
      ?auto_631865 - HOIST
      ?auto_631866 - PLACE
      ?auto_631864 - PLACE
      ?auto_631863 - HOIST
      ?auto_631862 - SURFACE
      ?auto_631861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631865 ?auto_631866 ) ( IS-CRATE ?auto_631860 ) ( not ( = ?auto_631859 ?auto_631860 ) ) ( not ( = ?auto_631858 ?auto_631859 ) ) ( not ( = ?auto_631858 ?auto_631860 ) ) ( not ( = ?auto_631864 ?auto_631866 ) ) ( HOIST-AT ?auto_631863 ?auto_631864 ) ( not ( = ?auto_631865 ?auto_631863 ) ) ( SURFACE-AT ?auto_631860 ?auto_631864 ) ( ON ?auto_631860 ?auto_631862 ) ( CLEAR ?auto_631860 ) ( not ( = ?auto_631859 ?auto_631862 ) ) ( not ( = ?auto_631860 ?auto_631862 ) ) ( not ( = ?auto_631858 ?auto_631862 ) ) ( SURFACE-AT ?auto_631858 ?auto_631866 ) ( CLEAR ?auto_631858 ) ( IS-CRATE ?auto_631859 ) ( AVAILABLE ?auto_631865 ) ( TRUCK-AT ?auto_631861 ?auto_631864 ) ( LIFTING ?auto_631863 ?auto_631859 ) ( ON ?auto_631850 ?auto_631849 ) ( ON ?auto_631851 ?auto_631850 ) ( ON ?auto_631853 ?auto_631851 ) ( ON ?auto_631852 ?auto_631853 ) ( ON ?auto_631854 ?auto_631852 ) ( ON ?auto_631855 ?auto_631854 ) ( ON ?auto_631856 ?auto_631855 ) ( ON ?auto_631857 ?auto_631856 ) ( ON ?auto_631858 ?auto_631857 ) ( not ( = ?auto_631849 ?auto_631850 ) ) ( not ( = ?auto_631849 ?auto_631851 ) ) ( not ( = ?auto_631849 ?auto_631853 ) ) ( not ( = ?auto_631849 ?auto_631852 ) ) ( not ( = ?auto_631849 ?auto_631854 ) ) ( not ( = ?auto_631849 ?auto_631855 ) ) ( not ( = ?auto_631849 ?auto_631856 ) ) ( not ( = ?auto_631849 ?auto_631857 ) ) ( not ( = ?auto_631849 ?auto_631858 ) ) ( not ( = ?auto_631849 ?auto_631859 ) ) ( not ( = ?auto_631849 ?auto_631860 ) ) ( not ( = ?auto_631849 ?auto_631862 ) ) ( not ( = ?auto_631850 ?auto_631851 ) ) ( not ( = ?auto_631850 ?auto_631853 ) ) ( not ( = ?auto_631850 ?auto_631852 ) ) ( not ( = ?auto_631850 ?auto_631854 ) ) ( not ( = ?auto_631850 ?auto_631855 ) ) ( not ( = ?auto_631850 ?auto_631856 ) ) ( not ( = ?auto_631850 ?auto_631857 ) ) ( not ( = ?auto_631850 ?auto_631858 ) ) ( not ( = ?auto_631850 ?auto_631859 ) ) ( not ( = ?auto_631850 ?auto_631860 ) ) ( not ( = ?auto_631850 ?auto_631862 ) ) ( not ( = ?auto_631851 ?auto_631853 ) ) ( not ( = ?auto_631851 ?auto_631852 ) ) ( not ( = ?auto_631851 ?auto_631854 ) ) ( not ( = ?auto_631851 ?auto_631855 ) ) ( not ( = ?auto_631851 ?auto_631856 ) ) ( not ( = ?auto_631851 ?auto_631857 ) ) ( not ( = ?auto_631851 ?auto_631858 ) ) ( not ( = ?auto_631851 ?auto_631859 ) ) ( not ( = ?auto_631851 ?auto_631860 ) ) ( not ( = ?auto_631851 ?auto_631862 ) ) ( not ( = ?auto_631853 ?auto_631852 ) ) ( not ( = ?auto_631853 ?auto_631854 ) ) ( not ( = ?auto_631853 ?auto_631855 ) ) ( not ( = ?auto_631853 ?auto_631856 ) ) ( not ( = ?auto_631853 ?auto_631857 ) ) ( not ( = ?auto_631853 ?auto_631858 ) ) ( not ( = ?auto_631853 ?auto_631859 ) ) ( not ( = ?auto_631853 ?auto_631860 ) ) ( not ( = ?auto_631853 ?auto_631862 ) ) ( not ( = ?auto_631852 ?auto_631854 ) ) ( not ( = ?auto_631852 ?auto_631855 ) ) ( not ( = ?auto_631852 ?auto_631856 ) ) ( not ( = ?auto_631852 ?auto_631857 ) ) ( not ( = ?auto_631852 ?auto_631858 ) ) ( not ( = ?auto_631852 ?auto_631859 ) ) ( not ( = ?auto_631852 ?auto_631860 ) ) ( not ( = ?auto_631852 ?auto_631862 ) ) ( not ( = ?auto_631854 ?auto_631855 ) ) ( not ( = ?auto_631854 ?auto_631856 ) ) ( not ( = ?auto_631854 ?auto_631857 ) ) ( not ( = ?auto_631854 ?auto_631858 ) ) ( not ( = ?auto_631854 ?auto_631859 ) ) ( not ( = ?auto_631854 ?auto_631860 ) ) ( not ( = ?auto_631854 ?auto_631862 ) ) ( not ( = ?auto_631855 ?auto_631856 ) ) ( not ( = ?auto_631855 ?auto_631857 ) ) ( not ( = ?auto_631855 ?auto_631858 ) ) ( not ( = ?auto_631855 ?auto_631859 ) ) ( not ( = ?auto_631855 ?auto_631860 ) ) ( not ( = ?auto_631855 ?auto_631862 ) ) ( not ( = ?auto_631856 ?auto_631857 ) ) ( not ( = ?auto_631856 ?auto_631858 ) ) ( not ( = ?auto_631856 ?auto_631859 ) ) ( not ( = ?auto_631856 ?auto_631860 ) ) ( not ( = ?auto_631856 ?auto_631862 ) ) ( not ( = ?auto_631857 ?auto_631858 ) ) ( not ( = ?auto_631857 ?auto_631859 ) ) ( not ( = ?auto_631857 ?auto_631860 ) ) ( not ( = ?auto_631857 ?auto_631862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631858 ?auto_631859 ?auto_631860 )
      ( MAKE-11CRATE-VERIFY ?auto_631849 ?auto_631850 ?auto_631851 ?auto_631853 ?auto_631852 ?auto_631854 ?auto_631855 ?auto_631856 ?auto_631857 ?auto_631858 ?auto_631859 ?auto_631860 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631867 - SURFACE
      ?auto_631868 - SURFACE
      ?auto_631869 - SURFACE
      ?auto_631871 - SURFACE
      ?auto_631870 - SURFACE
      ?auto_631872 - SURFACE
      ?auto_631873 - SURFACE
      ?auto_631874 - SURFACE
      ?auto_631875 - SURFACE
      ?auto_631876 - SURFACE
      ?auto_631877 - SURFACE
      ?auto_631878 - SURFACE
      ?auto_631879 - SURFACE
    )
    :vars
    (
      ?auto_631884 - HOIST
      ?auto_631885 - PLACE
      ?auto_631883 - PLACE
      ?auto_631882 - HOIST
      ?auto_631881 - SURFACE
      ?auto_631880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631884 ?auto_631885 ) ( IS-CRATE ?auto_631879 ) ( not ( = ?auto_631878 ?auto_631879 ) ) ( not ( = ?auto_631877 ?auto_631878 ) ) ( not ( = ?auto_631877 ?auto_631879 ) ) ( not ( = ?auto_631883 ?auto_631885 ) ) ( HOIST-AT ?auto_631882 ?auto_631883 ) ( not ( = ?auto_631884 ?auto_631882 ) ) ( SURFACE-AT ?auto_631879 ?auto_631883 ) ( ON ?auto_631879 ?auto_631881 ) ( CLEAR ?auto_631879 ) ( not ( = ?auto_631878 ?auto_631881 ) ) ( not ( = ?auto_631879 ?auto_631881 ) ) ( not ( = ?auto_631877 ?auto_631881 ) ) ( SURFACE-AT ?auto_631877 ?auto_631885 ) ( CLEAR ?auto_631877 ) ( IS-CRATE ?auto_631878 ) ( AVAILABLE ?auto_631884 ) ( TRUCK-AT ?auto_631880 ?auto_631883 ) ( LIFTING ?auto_631882 ?auto_631878 ) ( ON ?auto_631868 ?auto_631867 ) ( ON ?auto_631869 ?auto_631868 ) ( ON ?auto_631871 ?auto_631869 ) ( ON ?auto_631870 ?auto_631871 ) ( ON ?auto_631872 ?auto_631870 ) ( ON ?auto_631873 ?auto_631872 ) ( ON ?auto_631874 ?auto_631873 ) ( ON ?auto_631875 ?auto_631874 ) ( ON ?auto_631876 ?auto_631875 ) ( ON ?auto_631877 ?auto_631876 ) ( not ( = ?auto_631867 ?auto_631868 ) ) ( not ( = ?auto_631867 ?auto_631869 ) ) ( not ( = ?auto_631867 ?auto_631871 ) ) ( not ( = ?auto_631867 ?auto_631870 ) ) ( not ( = ?auto_631867 ?auto_631872 ) ) ( not ( = ?auto_631867 ?auto_631873 ) ) ( not ( = ?auto_631867 ?auto_631874 ) ) ( not ( = ?auto_631867 ?auto_631875 ) ) ( not ( = ?auto_631867 ?auto_631876 ) ) ( not ( = ?auto_631867 ?auto_631877 ) ) ( not ( = ?auto_631867 ?auto_631878 ) ) ( not ( = ?auto_631867 ?auto_631879 ) ) ( not ( = ?auto_631867 ?auto_631881 ) ) ( not ( = ?auto_631868 ?auto_631869 ) ) ( not ( = ?auto_631868 ?auto_631871 ) ) ( not ( = ?auto_631868 ?auto_631870 ) ) ( not ( = ?auto_631868 ?auto_631872 ) ) ( not ( = ?auto_631868 ?auto_631873 ) ) ( not ( = ?auto_631868 ?auto_631874 ) ) ( not ( = ?auto_631868 ?auto_631875 ) ) ( not ( = ?auto_631868 ?auto_631876 ) ) ( not ( = ?auto_631868 ?auto_631877 ) ) ( not ( = ?auto_631868 ?auto_631878 ) ) ( not ( = ?auto_631868 ?auto_631879 ) ) ( not ( = ?auto_631868 ?auto_631881 ) ) ( not ( = ?auto_631869 ?auto_631871 ) ) ( not ( = ?auto_631869 ?auto_631870 ) ) ( not ( = ?auto_631869 ?auto_631872 ) ) ( not ( = ?auto_631869 ?auto_631873 ) ) ( not ( = ?auto_631869 ?auto_631874 ) ) ( not ( = ?auto_631869 ?auto_631875 ) ) ( not ( = ?auto_631869 ?auto_631876 ) ) ( not ( = ?auto_631869 ?auto_631877 ) ) ( not ( = ?auto_631869 ?auto_631878 ) ) ( not ( = ?auto_631869 ?auto_631879 ) ) ( not ( = ?auto_631869 ?auto_631881 ) ) ( not ( = ?auto_631871 ?auto_631870 ) ) ( not ( = ?auto_631871 ?auto_631872 ) ) ( not ( = ?auto_631871 ?auto_631873 ) ) ( not ( = ?auto_631871 ?auto_631874 ) ) ( not ( = ?auto_631871 ?auto_631875 ) ) ( not ( = ?auto_631871 ?auto_631876 ) ) ( not ( = ?auto_631871 ?auto_631877 ) ) ( not ( = ?auto_631871 ?auto_631878 ) ) ( not ( = ?auto_631871 ?auto_631879 ) ) ( not ( = ?auto_631871 ?auto_631881 ) ) ( not ( = ?auto_631870 ?auto_631872 ) ) ( not ( = ?auto_631870 ?auto_631873 ) ) ( not ( = ?auto_631870 ?auto_631874 ) ) ( not ( = ?auto_631870 ?auto_631875 ) ) ( not ( = ?auto_631870 ?auto_631876 ) ) ( not ( = ?auto_631870 ?auto_631877 ) ) ( not ( = ?auto_631870 ?auto_631878 ) ) ( not ( = ?auto_631870 ?auto_631879 ) ) ( not ( = ?auto_631870 ?auto_631881 ) ) ( not ( = ?auto_631872 ?auto_631873 ) ) ( not ( = ?auto_631872 ?auto_631874 ) ) ( not ( = ?auto_631872 ?auto_631875 ) ) ( not ( = ?auto_631872 ?auto_631876 ) ) ( not ( = ?auto_631872 ?auto_631877 ) ) ( not ( = ?auto_631872 ?auto_631878 ) ) ( not ( = ?auto_631872 ?auto_631879 ) ) ( not ( = ?auto_631872 ?auto_631881 ) ) ( not ( = ?auto_631873 ?auto_631874 ) ) ( not ( = ?auto_631873 ?auto_631875 ) ) ( not ( = ?auto_631873 ?auto_631876 ) ) ( not ( = ?auto_631873 ?auto_631877 ) ) ( not ( = ?auto_631873 ?auto_631878 ) ) ( not ( = ?auto_631873 ?auto_631879 ) ) ( not ( = ?auto_631873 ?auto_631881 ) ) ( not ( = ?auto_631874 ?auto_631875 ) ) ( not ( = ?auto_631874 ?auto_631876 ) ) ( not ( = ?auto_631874 ?auto_631877 ) ) ( not ( = ?auto_631874 ?auto_631878 ) ) ( not ( = ?auto_631874 ?auto_631879 ) ) ( not ( = ?auto_631874 ?auto_631881 ) ) ( not ( = ?auto_631875 ?auto_631876 ) ) ( not ( = ?auto_631875 ?auto_631877 ) ) ( not ( = ?auto_631875 ?auto_631878 ) ) ( not ( = ?auto_631875 ?auto_631879 ) ) ( not ( = ?auto_631875 ?auto_631881 ) ) ( not ( = ?auto_631876 ?auto_631877 ) ) ( not ( = ?auto_631876 ?auto_631878 ) ) ( not ( = ?auto_631876 ?auto_631879 ) ) ( not ( = ?auto_631876 ?auto_631881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631877 ?auto_631878 ?auto_631879 )
      ( MAKE-12CRATE-VERIFY ?auto_631867 ?auto_631868 ?auto_631869 ?auto_631871 ?auto_631870 ?auto_631872 ?auto_631873 ?auto_631874 ?auto_631875 ?auto_631876 ?auto_631877 ?auto_631878 ?auto_631879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_631886 - SURFACE
      ?auto_631887 - SURFACE
    )
    :vars
    (
      ?auto_631892 - HOIST
      ?auto_631893 - PLACE
      ?auto_631894 - SURFACE
      ?auto_631891 - PLACE
      ?auto_631890 - HOIST
      ?auto_631889 - SURFACE
      ?auto_631888 - TRUCK
      ?auto_631895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631892 ?auto_631893 ) ( IS-CRATE ?auto_631887 ) ( not ( = ?auto_631886 ?auto_631887 ) ) ( not ( = ?auto_631894 ?auto_631886 ) ) ( not ( = ?auto_631894 ?auto_631887 ) ) ( not ( = ?auto_631891 ?auto_631893 ) ) ( HOIST-AT ?auto_631890 ?auto_631891 ) ( not ( = ?auto_631892 ?auto_631890 ) ) ( SURFACE-AT ?auto_631887 ?auto_631891 ) ( ON ?auto_631887 ?auto_631889 ) ( CLEAR ?auto_631887 ) ( not ( = ?auto_631886 ?auto_631889 ) ) ( not ( = ?auto_631887 ?auto_631889 ) ) ( not ( = ?auto_631894 ?auto_631889 ) ) ( SURFACE-AT ?auto_631894 ?auto_631893 ) ( CLEAR ?auto_631894 ) ( IS-CRATE ?auto_631886 ) ( AVAILABLE ?auto_631892 ) ( TRUCK-AT ?auto_631888 ?auto_631891 ) ( AVAILABLE ?auto_631890 ) ( SURFACE-AT ?auto_631886 ?auto_631891 ) ( ON ?auto_631886 ?auto_631895 ) ( CLEAR ?auto_631886 ) ( not ( = ?auto_631886 ?auto_631895 ) ) ( not ( = ?auto_631887 ?auto_631895 ) ) ( not ( = ?auto_631894 ?auto_631895 ) ) ( not ( = ?auto_631889 ?auto_631895 ) ) )
    :subtasks
    ( ( !LIFT ?auto_631890 ?auto_631886 ?auto_631895 ?auto_631891 )
      ( MAKE-2CRATE ?auto_631894 ?auto_631886 ?auto_631887 )
      ( MAKE-1CRATE-VERIFY ?auto_631886 ?auto_631887 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_631896 - SURFACE
      ?auto_631897 - SURFACE
      ?auto_631898 - SURFACE
    )
    :vars
    (
      ?auto_631900 - HOIST
      ?auto_631899 - PLACE
      ?auto_631904 - PLACE
      ?auto_631905 - HOIST
      ?auto_631902 - SURFACE
      ?auto_631901 - TRUCK
      ?auto_631903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631900 ?auto_631899 ) ( IS-CRATE ?auto_631898 ) ( not ( = ?auto_631897 ?auto_631898 ) ) ( not ( = ?auto_631896 ?auto_631897 ) ) ( not ( = ?auto_631896 ?auto_631898 ) ) ( not ( = ?auto_631904 ?auto_631899 ) ) ( HOIST-AT ?auto_631905 ?auto_631904 ) ( not ( = ?auto_631900 ?auto_631905 ) ) ( SURFACE-AT ?auto_631898 ?auto_631904 ) ( ON ?auto_631898 ?auto_631902 ) ( CLEAR ?auto_631898 ) ( not ( = ?auto_631897 ?auto_631902 ) ) ( not ( = ?auto_631898 ?auto_631902 ) ) ( not ( = ?auto_631896 ?auto_631902 ) ) ( SURFACE-AT ?auto_631896 ?auto_631899 ) ( CLEAR ?auto_631896 ) ( IS-CRATE ?auto_631897 ) ( AVAILABLE ?auto_631900 ) ( TRUCK-AT ?auto_631901 ?auto_631904 ) ( AVAILABLE ?auto_631905 ) ( SURFACE-AT ?auto_631897 ?auto_631904 ) ( ON ?auto_631897 ?auto_631903 ) ( CLEAR ?auto_631897 ) ( not ( = ?auto_631897 ?auto_631903 ) ) ( not ( = ?auto_631898 ?auto_631903 ) ) ( not ( = ?auto_631896 ?auto_631903 ) ) ( not ( = ?auto_631902 ?auto_631903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_631897 ?auto_631898 )
      ( MAKE-2CRATE-VERIFY ?auto_631896 ?auto_631897 ?auto_631898 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_631906 - SURFACE
      ?auto_631907 - SURFACE
      ?auto_631908 - SURFACE
      ?auto_631909 - SURFACE
    )
    :vars
    (
      ?auto_631914 - HOIST
      ?auto_631911 - PLACE
      ?auto_631915 - PLACE
      ?auto_631916 - HOIST
      ?auto_631913 - SURFACE
      ?auto_631912 - TRUCK
      ?auto_631910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631914 ?auto_631911 ) ( IS-CRATE ?auto_631909 ) ( not ( = ?auto_631908 ?auto_631909 ) ) ( not ( = ?auto_631907 ?auto_631908 ) ) ( not ( = ?auto_631907 ?auto_631909 ) ) ( not ( = ?auto_631915 ?auto_631911 ) ) ( HOIST-AT ?auto_631916 ?auto_631915 ) ( not ( = ?auto_631914 ?auto_631916 ) ) ( SURFACE-AT ?auto_631909 ?auto_631915 ) ( ON ?auto_631909 ?auto_631913 ) ( CLEAR ?auto_631909 ) ( not ( = ?auto_631908 ?auto_631913 ) ) ( not ( = ?auto_631909 ?auto_631913 ) ) ( not ( = ?auto_631907 ?auto_631913 ) ) ( SURFACE-AT ?auto_631907 ?auto_631911 ) ( CLEAR ?auto_631907 ) ( IS-CRATE ?auto_631908 ) ( AVAILABLE ?auto_631914 ) ( TRUCK-AT ?auto_631912 ?auto_631915 ) ( AVAILABLE ?auto_631916 ) ( SURFACE-AT ?auto_631908 ?auto_631915 ) ( ON ?auto_631908 ?auto_631910 ) ( CLEAR ?auto_631908 ) ( not ( = ?auto_631908 ?auto_631910 ) ) ( not ( = ?auto_631909 ?auto_631910 ) ) ( not ( = ?auto_631907 ?auto_631910 ) ) ( not ( = ?auto_631913 ?auto_631910 ) ) ( ON ?auto_631907 ?auto_631906 ) ( not ( = ?auto_631906 ?auto_631907 ) ) ( not ( = ?auto_631906 ?auto_631908 ) ) ( not ( = ?auto_631906 ?auto_631909 ) ) ( not ( = ?auto_631906 ?auto_631913 ) ) ( not ( = ?auto_631906 ?auto_631910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631907 ?auto_631908 ?auto_631909 )
      ( MAKE-3CRATE-VERIFY ?auto_631906 ?auto_631907 ?auto_631908 ?auto_631909 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_631917 - SURFACE
      ?auto_631918 - SURFACE
      ?auto_631919 - SURFACE
      ?auto_631921 - SURFACE
      ?auto_631920 - SURFACE
    )
    :vars
    (
      ?auto_631926 - HOIST
      ?auto_631923 - PLACE
      ?auto_631927 - PLACE
      ?auto_631928 - HOIST
      ?auto_631925 - SURFACE
      ?auto_631924 - TRUCK
      ?auto_631922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631926 ?auto_631923 ) ( IS-CRATE ?auto_631920 ) ( not ( = ?auto_631921 ?auto_631920 ) ) ( not ( = ?auto_631919 ?auto_631921 ) ) ( not ( = ?auto_631919 ?auto_631920 ) ) ( not ( = ?auto_631927 ?auto_631923 ) ) ( HOIST-AT ?auto_631928 ?auto_631927 ) ( not ( = ?auto_631926 ?auto_631928 ) ) ( SURFACE-AT ?auto_631920 ?auto_631927 ) ( ON ?auto_631920 ?auto_631925 ) ( CLEAR ?auto_631920 ) ( not ( = ?auto_631921 ?auto_631925 ) ) ( not ( = ?auto_631920 ?auto_631925 ) ) ( not ( = ?auto_631919 ?auto_631925 ) ) ( SURFACE-AT ?auto_631919 ?auto_631923 ) ( CLEAR ?auto_631919 ) ( IS-CRATE ?auto_631921 ) ( AVAILABLE ?auto_631926 ) ( TRUCK-AT ?auto_631924 ?auto_631927 ) ( AVAILABLE ?auto_631928 ) ( SURFACE-AT ?auto_631921 ?auto_631927 ) ( ON ?auto_631921 ?auto_631922 ) ( CLEAR ?auto_631921 ) ( not ( = ?auto_631921 ?auto_631922 ) ) ( not ( = ?auto_631920 ?auto_631922 ) ) ( not ( = ?auto_631919 ?auto_631922 ) ) ( not ( = ?auto_631925 ?auto_631922 ) ) ( ON ?auto_631918 ?auto_631917 ) ( ON ?auto_631919 ?auto_631918 ) ( not ( = ?auto_631917 ?auto_631918 ) ) ( not ( = ?auto_631917 ?auto_631919 ) ) ( not ( = ?auto_631917 ?auto_631921 ) ) ( not ( = ?auto_631917 ?auto_631920 ) ) ( not ( = ?auto_631917 ?auto_631925 ) ) ( not ( = ?auto_631917 ?auto_631922 ) ) ( not ( = ?auto_631918 ?auto_631919 ) ) ( not ( = ?auto_631918 ?auto_631921 ) ) ( not ( = ?auto_631918 ?auto_631920 ) ) ( not ( = ?auto_631918 ?auto_631925 ) ) ( not ( = ?auto_631918 ?auto_631922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631919 ?auto_631921 ?auto_631920 )
      ( MAKE-4CRATE-VERIFY ?auto_631917 ?auto_631918 ?auto_631919 ?auto_631921 ?auto_631920 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_631929 - SURFACE
      ?auto_631930 - SURFACE
      ?auto_631931 - SURFACE
      ?auto_631933 - SURFACE
      ?auto_631932 - SURFACE
      ?auto_631934 - SURFACE
    )
    :vars
    (
      ?auto_631939 - HOIST
      ?auto_631936 - PLACE
      ?auto_631940 - PLACE
      ?auto_631941 - HOIST
      ?auto_631938 - SURFACE
      ?auto_631937 - TRUCK
      ?auto_631935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631939 ?auto_631936 ) ( IS-CRATE ?auto_631934 ) ( not ( = ?auto_631932 ?auto_631934 ) ) ( not ( = ?auto_631933 ?auto_631932 ) ) ( not ( = ?auto_631933 ?auto_631934 ) ) ( not ( = ?auto_631940 ?auto_631936 ) ) ( HOIST-AT ?auto_631941 ?auto_631940 ) ( not ( = ?auto_631939 ?auto_631941 ) ) ( SURFACE-AT ?auto_631934 ?auto_631940 ) ( ON ?auto_631934 ?auto_631938 ) ( CLEAR ?auto_631934 ) ( not ( = ?auto_631932 ?auto_631938 ) ) ( not ( = ?auto_631934 ?auto_631938 ) ) ( not ( = ?auto_631933 ?auto_631938 ) ) ( SURFACE-AT ?auto_631933 ?auto_631936 ) ( CLEAR ?auto_631933 ) ( IS-CRATE ?auto_631932 ) ( AVAILABLE ?auto_631939 ) ( TRUCK-AT ?auto_631937 ?auto_631940 ) ( AVAILABLE ?auto_631941 ) ( SURFACE-AT ?auto_631932 ?auto_631940 ) ( ON ?auto_631932 ?auto_631935 ) ( CLEAR ?auto_631932 ) ( not ( = ?auto_631932 ?auto_631935 ) ) ( not ( = ?auto_631934 ?auto_631935 ) ) ( not ( = ?auto_631933 ?auto_631935 ) ) ( not ( = ?auto_631938 ?auto_631935 ) ) ( ON ?auto_631930 ?auto_631929 ) ( ON ?auto_631931 ?auto_631930 ) ( ON ?auto_631933 ?auto_631931 ) ( not ( = ?auto_631929 ?auto_631930 ) ) ( not ( = ?auto_631929 ?auto_631931 ) ) ( not ( = ?auto_631929 ?auto_631933 ) ) ( not ( = ?auto_631929 ?auto_631932 ) ) ( not ( = ?auto_631929 ?auto_631934 ) ) ( not ( = ?auto_631929 ?auto_631938 ) ) ( not ( = ?auto_631929 ?auto_631935 ) ) ( not ( = ?auto_631930 ?auto_631931 ) ) ( not ( = ?auto_631930 ?auto_631933 ) ) ( not ( = ?auto_631930 ?auto_631932 ) ) ( not ( = ?auto_631930 ?auto_631934 ) ) ( not ( = ?auto_631930 ?auto_631938 ) ) ( not ( = ?auto_631930 ?auto_631935 ) ) ( not ( = ?auto_631931 ?auto_631933 ) ) ( not ( = ?auto_631931 ?auto_631932 ) ) ( not ( = ?auto_631931 ?auto_631934 ) ) ( not ( = ?auto_631931 ?auto_631938 ) ) ( not ( = ?auto_631931 ?auto_631935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631933 ?auto_631932 ?auto_631934 )
      ( MAKE-5CRATE-VERIFY ?auto_631929 ?auto_631930 ?auto_631931 ?auto_631933 ?auto_631932 ?auto_631934 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_631942 - SURFACE
      ?auto_631943 - SURFACE
      ?auto_631944 - SURFACE
      ?auto_631946 - SURFACE
      ?auto_631945 - SURFACE
      ?auto_631947 - SURFACE
      ?auto_631948 - SURFACE
    )
    :vars
    (
      ?auto_631953 - HOIST
      ?auto_631950 - PLACE
      ?auto_631954 - PLACE
      ?auto_631955 - HOIST
      ?auto_631952 - SURFACE
      ?auto_631951 - TRUCK
      ?auto_631949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631953 ?auto_631950 ) ( IS-CRATE ?auto_631948 ) ( not ( = ?auto_631947 ?auto_631948 ) ) ( not ( = ?auto_631945 ?auto_631947 ) ) ( not ( = ?auto_631945 ?auto_631948 ) ) ( not ( = ?auto_631954 ?auto_631950 ) ) ( HOIST-AT ?auto_631955 ?auto_631954 ) ( not ( = ?auto_631953 ?auto_631955 ) ) ( SURFACE-AT ?auto_631948 ?auto_631954 ) ( ON ?auto_631948 ?auto_631952 ) ( CLEAR ?auto_631948 ) ( not ( = ?auto_631947 ?auto_631952 ) ) ( not ( = ?auto_631948 ?auto_631952 ) ) ( not ( = ?auto_631945 ?auto_631952 ) ) ( SURFACE-AT ?auto_631945 ?auto_631950 ) ( CLEAR ?auto_631945 ) ( IS-CRATE ?auto_631947 ) ( AVAILABLE ?auto_631953 ) ( TRUCK-AT ?auto_631951 ?auto_631954 ) ( AVAILABLE ?auto_631955 ) ( SURFACE-AT ?auto_631947 ?auto_631954 ) ( ON ?auto_631947 ?auto_631949 ) ( CLEAR ?auto_631947 ) ( not ( = ?auto_631947 ?auto_631949 ) ) ( not ( = ?auto_631948 ?auto_631949 ) ) ( not ( = ?auto_631945 ?auto_631949 ) ) ( not ( = ?auto_631952 ?auto_631949 ) ) ( ON ?auto_631943 ?auto_631942 ) ( ON ?auto_631944 ?auto_631943 ) ( ON ?auto_631946 ?auto_631944 ) ( ON ?auto_631945 ?auto_631946 ) ( not ( = ?auto_631942 ?auto_631943 ) ) ( not ( = ?auto_631942 ?auto_631944 ) ) ( not ( = ?auto_631942 ?auto_631946 ) ) ( not ( = ?auto_631942 ?auto_631945 ) ) ( not ( = ?auto_631942 ?auto_631947 ) ) ( not ( = ?auto_631942 ?auto_631948 ) ) ( not ( = ?auto_631942 ?auto_631952 ) ) ( not ( = ?auto_631942 ?auto_631949 ) ) ( not ( = ?auto_631943 ?auto_631944 ) ) ( not ( = ?auto_631943 ?auto_631946 ) ) ( not ( = ?auto_631943 ?auto_631945 ) ) ( not ( = ?auto_631943 ?auto_631947 ) ) ( not ( = ?auto_631943 ?auto_631948 ) ) ( not ( = ?auto_631943 ?auto_631952 ) ) ( not ( = ?auto_631943 ?auto_631949 ) ) ( not ( = ?auto_631944 ?auto_631946 ) ) ( not ( = ?auto_631944 ?auto_631945 ) ) ( not ( = ?auto_631944 ?auto_631947 ) ) ( not ( = ?auto_631944 ?auto_631948 ) ) ( not ( = ?auto_631944 ?auto_631952 ) ) ( not ( = ?auto_631944 ?auto_631949 ) ) ( not ( = ?auto_631946 ?auto_631945 ) ) ( not ( = ?auto_631946 ?auto_631947 ) ) ( not ( = ?auto_631946 ?auto_631948 ) ) ( not ( = ?auto_631946 ?auto_631952 ) ) ( not ( = ?auto_631946 ?auto_631949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631945 ?auto_631947 ?auto_631948 )
      ( MAKE-6CRATE-VERIFY ?auto_631942 ?auto_631943 ?auto_631944 ?auto_631946 ?auto_631945 ?auto_631947 ?auto_631948 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_631956 - SURFACE
      ?auto_631957 - SURFACE
      ?auto_631958 - SURFACE
      ?auto_631960 - SURFACE
      ?auto_631959 - SURFACE
      ?auto_631961 - SURFACE
      ?auto_631962 - SURFACE
      ?auto_631963 - SURFACE
    )
    :vars
    (
      ?auto_631968 - HOIST
      ?auto_631965 - PLACE
      ?auto_631969 - PLACE
      ?auto_631970 - HOIST
      ?auto_631967 - SURFACE
      ?auto_631966 - TRUCK
      ?auto_631964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631968 ?auto_631965 ) ( IS-CRATE ?auto_631963 ) ( not ( = ?auto_631962 ?auto_631963 ) ) ( not ( = ?auto_631961 ?auto_631962 ) ) ( not ( = ?auto_631961 ?auto_631963 ) ) ( not ( = ?auto_631969 ?auto_631965 ) ) ( HOIST-AT ?auto_631970 ?auto_631969 ) ( not ( = ?auto_631968 ?auto_631970 ) ) ( SURFACE-AT ?auto_631963 ?auto_631969 ) ( ON ?auto_631963 ?auto_631967 ) ( CLEAR ?auto_631963 ) ( not ( = ?auto_631962 ?auto_631967 ) ) ( not ( = ?auto_631963 ?auto_631967 ) ) ( not ( = ?auto_631961 ?auto_631967 ) ) ( SURFACE-AT ?auto_631961 ?auto_631965 ) ( CLEAR ?auto_631961 ) ( IS-CRATE ?auto_631962 ) ( AVAILABLE ?auto_631968 ) ( TRUCK-AT ?auto_631966 ?auto_631969 ) ( AVAILABLE ?auto_631970 ) ( SURFACE-AT ?auto_631962 ?auto_631969 ) ( ON ?auto_631962 ?auto_631964 ) ( CLEAR ?auto_631962 ) ( not ( = ?auto_631962 ?auto_631964 ) ) ( not ( = ?auto_631963 ?auto_631964 ) ) ( not ( = ?auto_631961 ?auto_631964 ) ) ( not ( = ?auto_631967 ?auto_631964 ) ) ( ON ?auto_631957 ?auto_631956 ) ( ON ?auto_631958 ?auto_631957 ) ( ON ?auto_631960 ?auto_631958 ) ( ON ?auto_631959 ?auto_631960 ) ( ON ?auto_631961 ?auto_631959 ) ( not ( = ?auto_631956 ?auto_631957 ) ) ( not ( = ?auto_631956 ?auto_631958 ) ) ( not ( = ?auto_631956 ?auto_631960 ) ) ( not ( = ?auto_631956 ?auto_631959 ) ) ( not ( = ?auto_631956 ?auto_631961 ) ) ( not ( = ?auto_631956 ?auto_631962 ) ) ( not ( = ?auto_631956 ?auto_631963 ) ) ( not ( = ?auto_631956 ?auto_631967 ) ) ( not ( = ?auto_631956 ?auto_631964 ) ) ( not ( = ?auto_631957 ?auto_631958 ) ) ( not ( = ?auto_631957 ?auto_631960 ) ) ( not ( = ?auto_631957 ?auto_631959 ) ) ( not ( = ?auto_631957 ?auto_631961 ) ) ( not ( = ?auto_631957 ?auto_631962 ) ) ( not ( = ?auto_631957 ?auto_631963 ) ) ( not ( = ?auto_631957 ?auto_631967 ) ) ( not ( = ?auto_631957 ?auto_631964 ) ) ( not ( = ?auto_631958 ?auto_631960 ) ) ( not ( = ?auto_631958 ?auto_631959 ) ) ( not ( = ?auto_631958 ?auto_631961 ) ) ( not ( = ?auto_631958 ?auto_631962 ) ) ( not ( = ?auto_631958 ?auto_631963 ) ) ( not ( = ?auto_631958 ?auto_631967 ) ) ( not ( = ?auto_631958 ?auto_631964 ) ) ( not ( = ?auto_631960 ?auto_631959 ) ) ( not ( = ?auto_631960 ?auto_631961 ) ) ( not ( = ?auto_631960 ?auto_631962 ) ) ( not ( = ?auto_631960 ?auto_631963 ) ) ( not ( = ?auto_631960 ?auto_631967 ) ) ( not ( = ?auto_631960 ?auto_631964 ) ) ( not ( = ?auto_631959 ?auto_631961 ) ) ( not ( = ?auto_631959 ?auto_631962 ) ) ( not ( = ?auto_631959 ?auto_631963 ) ) ( not ( = ?auto_631959 ?auto_631967 ) ) ( not ( = ?auto_631959 ?auto_631964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631961 ?auto_631962 ?auto_631963 )
      ( MAKE-7CRATE-VERIFY ?auto_631956 ?auto_631957 ?auto_631958 ?auto_631960 ?auto_631959 ?auto_631961 ?auto_631962 ?auto_631963 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_631971 - SURFACE
      ?auto_631972 - SURFACE
      ?auto_631973 - SURFACE
      ?auto_631975 - SURFACE
      ?auto_631974 - SURFACE
      ?auto_631976 - SURFACE
      ?auto_631977 - SURFACE
      ?auto_631978 - SURFACE
      ?auto_631979 - SURFACE
    )
    :vars
    (
      ?auto_631984 - HOIST
      ?auto_631981 - PLACE
      ?auto_631985 - PLACE
      ?auto_631986 - HOIST
      ?auto_631983 - SURFACE
      ?auto_631982 - TRUCK
      ?auto_631980 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631984 ?auto_631981 ) ( IS-CRATE ?auto_631979 ) ( not ( = ?auto_631978 ?auto_631979 ) ) ( not ( = ?auto_631977 ?auto_631978 ) ) ( not ( = ?auto_631977 ?auto_631979 ) ) ( not ( = ?auto_631985 ?auto_631981 ) ) ( HOIST-AT ?auto_631986 ?auto_631985 ) ( not ( = ?auto_631984 ?auto_631986 ) ) ( SURFACE-AT ?auto_631979 ?auto_631985 ) ( ON ?auto_631979 ?auto_631983 ) ( CLEAR ?auto_631979 ) ( not ( = ?auto_631978 ?auto_631983 ) ) ( not ( = ?auto_631979 ?auto_631983 ) ) ( not ( = ?auto_631977 ?auto_631983 ) ) ( SURFACE-AT ?auto_631977 ?auto_631981 ) ( CLEAR ?auto_631977 ) ( IS-CRATE ?auto_631978 ) ( AVAILABLE ?auto_631984 ) ( TRUCK-AT ?auto_631982 ?auto_631985 ) ( AVAILABLE ?auto_631986 ) ( SURFACE-AT ?auto_631978 ?auto_631985 ) ( ON ?auto_631978 ?auto_631980 ) ( CLEAR ?auto_631978 ) ( not ( = ?auto_631978 ?auto_631980 ) ) ( not ( = ?auto_631979 ?auto_631980 ) ) ( not ( = ?auto_631977 ?auto_631980 ) ) ( not ( = ?auto_631983 ?auto_631980 ) ) ( ON ?auto_631972 ?auto_631971 ) ( ON ?auto_631973 ?auto_631972 ) ( ON ?auto_631975 ?auto_631973 ) ( ON ?auto_631974 ?auto_631975 ) ( ON ?auto_631976 ?auto_631974 ) ( ON ?auto_631977 ?auto_631976 ) ( not ( = ?auto_631971 ?auto_631972 ) ) ( not ( = ?auto_631971 ?auto_631973 ) ) ( not ( = ?auto_631971 ?auto_631975 ) ) ( not ( = ?auto_631971 ?auto_631974 ) ) ( not ( = ?auto_631971 ?auto_631976 ) ) ( not ( = ?auto_631971 ?auto_631977 ) ) ( not ( = ?auto_631971 ?auto_631978 ) ) ( not ( = ?auto_631971 ?auto_631979 ) ) ( not ( = ?auto_631971 ?auto_631983 ) ) ( not ( = ?auto_631971 ?auto_631980 ) ) ( not ( = ?auto_631972 ?auto_631973 ) ) ( not ( = ?auto_631972 ?auto_631975 ) ) ( not ( = ?auto_631972 ?auto_631974 ) ) ( not ( = ?auto_631972 ?auto_631976 ) ) ( not ( = ?auto_631972 ?auto_631977 ) ) ( not ( = ?auto_631972 ?auto_631978 ) ) ( not ( = ?auto_631972 ?auto_631979 ) ) ( not ( = ?auto_631972 ?auto_631983 ) ) ( not ( = ?auto_631972 ?auto_631980 ) ) ( not ( = ?auto_631973 ?auto_631975 ) ) ( not ( = ?auto_631973 ?auto_631974 ) ) ( not ( = ?auto_631973 ?auto_631976 ) ) ( not ( = ?auto_631973 ?auto_631977 ) ) ( not ( = ?auto_631973 ?auto_631978 ) ) ( not ( = ?auto_631973 ?auto_631979 ) ) ( not ( = ?auto_631973 ?auto_631983 ) ) ( not ( = ?auto_631973 ?auto_631980 ) ) ( not ( = ?auto_631975 ?auto_631974 ) ) ( not ( = ?auto_631975 ?auto_631976 ) ) ( not ( = ?auto_631975 ?auto_631977 ) ) ( not ( = ?auto_631975 ?auto_631978 ) ) ( not ( = ?auto_631975 ?auto_631979 ) ) ( not ( = ?auto_631975 ?auto_631983 ) ) ( not ( = ?auto_631975 ?auto_631980 ) ) ( not ( = ?auto_631974 ?auto_631976 ) ) ( not ( = ?auto_631974 ?auto_631977 ) ) ( not ( = ?auto_631974 ?auto_631978 ) ) ( not ( = ?auto_631974 ?auto_631979 ) ) ( not ( = ?auto_631974 ?auto_631983 ) ) ( not ( = ?auto_631974 ?auto_631980 ) ) ( not ( = ?auto_631976 ?auto_631977 ) ) ( not ( = ?auto_631976 ?auto_631978 ) ) ( not ( = ?auto_631976 ?auto_631979 ) ) ( not ( = ?auto_631976 ?auto_631983 ) ) ( not ( = ?auto_631976 ?auto_631980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631977 ?auto_631978 ?auto_631979 )
      ( MAKE-8CRATE-VERIFY ?auto_631971 ?auto_631972 ?auto_631973 ?auto_631975 ?auto_631974 ?auto_631976 ?auto_631977 ?auto_631978 ?auto_631979 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_631987 - SURFACE
      ?auto_631988 - SURFACE
      ?auto_631989 - SURFACE
      ?auto_631991 - SURFACE
      ?auto_631990 - SURFACE
      ?auto_631992 - SURFACE
      ?auto_631993 - SURFACE
      ?auto_631994 - SURFACE
      ?auto_631995 - SURFACE
      ?auto_631996 - SURFACE
    )
    :vars
    (
      ?auto_632001 - HOIST
      ?auto_631998 - PLACE
      ?auto_632002 - PLACE
      ?auto_632003 - HOIST
      ?auto_632000 - SURFACE
      ?auto_631999 - TRUCK
      ?auto_631997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632001 ?auto_631998 ) ( IS-CRATE ?auto_631996 ) ( not ( = ?auto_631995 ?auto_631996 ) ) ( not ( = ?auto_631994 ?auto_631995 ) ) ( not ( = ?auto_631994 ?auto_631996 ) ) ( not ( = ?auto_632002 ?auto_631998 ) ) ( HOIST-AT ?auto_632003 ?auto_632002 ) ( not ( = ?auto_632001 ?auto_632003 ) ) ( SURFACE-AT ?auto_631996 ?auto_632002 ) ( ON ?auto_631996 ?auto_632000 ) ( CLEAR ?auto_631996 ) ( not ( = ?auto_631995 ?auto_632000 ) ) ( not ( = ?auto_631996 ?auto_632000 ) ) ( not ( = ?auto_631994 ?auto_632000 ) ) ( SURFACE-AT ?auto_631994 ?auto_631998 ) ( CLEAR ?auto_631994 ) ( IS-CRATE ?auto_631995 ) ( AVAILABLE ?auto_632001 ) ( TRUCK-AT ?auto_631999 ?auto_632002 ) ( AVAILABLE ?auto_632003 ) ( SURFACE-AT ?auto_631995 ?auto_632002 ) ( ON ?auto_631995 ?auto_631997 ) ( CLEAR ?auto_631995 ) ( not ( = ?auto_631995 ?auto_631997 ) ) ( not ( = ?auto_631996 ?auto_631997 ) ) ( not ( = ?auto_631994 ?auto_631997 ) ) ( not ( = ?auto_632000 ?auto_631997 ) ) ( ON ?auto_631988 ?auto_631987 ) ( ON ?auto_631989 ?auto_631988 ) ( ON ?auto_631991 ?auto_631989 ) ( ON ?auto_631990 ?auto_631991 ) ( ON ?auto_631992 ?auto_631990 ) ( ON ?auto_631993 ?auto_631992 ) ( ON ?auto_631994 ?auto_631993 ) ( not ( = ?auto_631987 ?auto_631988 ) ) ( not ( = ?auto_631987 ?auto_631989 ) ) ( not ( = ?auto_631987 ?auto_631991 ) ) ( not ( = ?auto_631987 ?auto_631990 ) ) ( not ( = ?auto_631987 ?auto_631992 ) ) ( not ( = ?auto_631987 ?auto_631993 ) ) ( not ( = ?auto_631987 ?auto_631994 ) ) ( not ( = ?auto_631987 ?auto_631995 ) ) ( not ( = ?auto_631987 ?auto_631996 ) ) ( not ( = ?auto_631987 ?auto_632000 ) ) ( not ( = ?auto_631987 ?auto_631997 ) ) ( not ( = ?auto_631988 ?auto_631989 ) ) ( not ( = ?auto_631988 ?auto_631991 ) ) ( not ( = ?auto_631988 ?auto_631990 ) ) ( not ( = ?auto_631988 ?auto_631992 ) ) ( not ( = ?auto_631988 ?auto_631993 ) ) ( not ( = ?auto_631988 ?auto_631994 ) ) ( not ( = ?auto_631988 ?auto_631995 ) ) ( not ( = ?auto_631988 ?auto_631996 ) ) ( not ( = ?auto_631988 ?auto_632000 ) ) ( not ( = ?auto_631988 ?auto_631997 ) ) ( not ( = ?auto_631989 ?auto_631991 ) ) ( not ( = ?auto_631989 ?auto_631990 ) ) ( not ( = ?auto_631989 ?auto_631992 ) ) ( not ( = ?auto_631989 ?auto_631993 ) ) ( not ( = ?auto_631989 ?auto_631994 ) ) ( not ( = ?auto_631989 ?auto_631995 ) ) ( not ( = ?auto_631989 ?auto_631996 ) ) ( not ( = ?auto_631989 ?auto_632000 ) ) ( not ( = ?auto_631989 ?auto_631997 ) ) ( not ( = ?auto_631991 ?auto_631990 ) ) ( not ( = ?auto_631991 ?auto_631992 ) ) ( not ( = ?auto_631991 ?auto_631993 ) ) ( not ( = ?auto_631991 ?auto_631994 ) ) ( not ( = ?auto_631991 ?auto_631995 ) ) ( not ( = ?auto_631991 ?auto_631996 ) ) ( not ( = ?auto_631991 ?auto_632000 ) ) ( not ( = ?auto_631991 ?auto_631997 ) ) ( not ( = ?auto_631990 ?auto_631992 ) ) ( not ( = ?auto_631990 ?auto_631993 ) ) ( not ( = ?auto_631990 ?auto_631994 ) ) ( not ( = ?auto_631990 ?auto_631995 ) ) ( not ( = ?auto_631990 ?auto_631996 ) ) ( not ( = ?auto_631990 ?auto_632000 ) ) ( not ( = ?auto_631990 ?auto_631997 ) ) ( not ( = ?auto_631992 ?auto_631993 ) ) ( not ( = ?auto_631992 ?auto_631994 ) ) ( not ( = ?auto_631992 ?auto_631995 ) ) ( not ( = ?auto_631992 ?auto_631996 ) ) ( not ( = ?auto_631992 ?auto_632000 ) ) ( not ( = ?auto_631992 ?auto_631997 ) ) ( not ( = ?auto_631993 ?auto_631994 ) ) ( not ( = ?auto_631993 ?auto_631995 ) ) ( not ( = ?auto_631993 ?auto_631996 ) ) ( not ( = ?auto_631993 ?auto_632000 ) ) ( not ( = ?auto_631993 ?auto_631997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631994 ?auto_631995 ?auto_631996 )
      ( MAKE-9CRATE-VERIFY ?auto_631987 ?auto_631988 ?auto_631989 ?auto_631991 ?auto_631990 ?auto_631992 ?auto_631993 ?auto_631994 ?auto_631995 ?auto_631996 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_632004 - SURFACE
      ?auto_632005 - SURFACE
      ?auto_632006 - SURFACE
      ?auto_632008 - SURFACE
      ?auto_632007 - SURFACE
      ?auto_632009 - SURFACE
      ?auto_632010 - SURFACE
      ?auto_632011 - SURFACE
      ?auto_632012 - SURFACE
      ?auto_632013 - SURFACE
      ?auto_632014 - SURFACE
    )
    :vars
    (
      ?auto_632019 - HOIST
      ?auto_632016 - PLACE
      ?auto_632020 - PLACE
      ?auto_632021 - HOIST
      ?auto_632018 - SURFACE
      ?auto_632017 - TRUCK
      ?auto_632015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632019 ?auto_632016 ) ( IS-CRATE ?auto_632014 ) ( not ( = ?auto_632013 ?auto_632014 ) ) ( not ( = ?auto_632012 ?auto_632013 ) ) ( not ( = ?auto_632012 ?auto_632014 ) ) ( not ( = ?auto_632020 ?auto_632016 ) ) ( HOIST-AT ?auto_632021 ?auto_632020 ) ( not ( = ?auto_632019 ?auto_632021 ) ) ( SURFACE-AT ?auto_632014 ?auto_632020 ) ( ON ?auto_632014 ?auto_632018 ) ( CLEAR ?auto_632014 ) ( not ( = ?auto_632013 ?auto_632018 ) ) ( not ( = ?auto_632014 ?auto_632018 ) ) ( not ( = ?auto_632012 ?auto_632018 ) ) ( SURFACE-AT ?auto_632012 ?auto_632016 ) ( CLEAR ?auto_632012 ) ( IS-CRATE ?auto_632013 ) ( AVAILABLE ?auto_632019 ) ( TRUCK-AT ?auto_632017 ?auto_632020 ) ( AVAILABLE ?auto_632021 ) ( SURFACE-AT ?auto_632013 ?auto_632020 ) ( ON ?auto_632013 ?auto_632015 ) ( CLEAR ?auto_632013 ) ( not ( = ?auto_632013 ?auto_632015 ) ) ( not ( = ?auto_632014 ?auto_632015 ) ) ( not ( = ?auto_632012 ?auto_632015 ) ) ( not ( = ?auto_632018 ?auto_632015 ) ) ( ON ?auto_632005 ?auto_632004 ) ( ON ?auto_632006 ?auto_632005 ) ( ON ?auto_632008 ?auto_632006 ) ( ON ?auto_632007 ?auto_632008 ) ( ON ?auto_632009 ?auto_632007 ) ( ON ?auto_632010 ?auto_632009 ) ( ON ?auto_632011 ?auto_632010 ) ( ON ?auto_632012 ?auto_632011 ) ( not ( = ?auto_632004 ?auto_632005 ) ) ( not ( = ?auto_632004 ?auto_632006 ) ) ( not ( = ?auto_632004 ?auto_632008 ) ) ( not ( = ?auto_632004 ?auto_632007 ) ) ( not ( = ?auto_632004 ?auto_632009 ) ) ( not ( = ?auto_632004 ?auto_632010 ) ) ( not ( = ?auto_632004 ?auto_632011 ) ) ( not ( = ?auto_632004 ?auto_632012 ) ) ( not ( = ?auto_632004 ?auto_632013 ) ) ( not ( = ?auto_632004 ?auto_632014 ) ) ( not ( = ?auto_632004 ?auto_632018 ) ) ( not ( = ?auto_632004 ?auto_632015 ) ) ( not ( = ?auto_632005 ?auto_632006 ) ) ( not ( = ?auto_632005 ?auto_632008 ) ) ( not ( = ?auto_632005 ?auto_632007 ) ) ( not ( = ?auto_632005 ?auto_632009 ) ) ( not ( = ?auto_632005 ?auto_632010 ) ) ( not ( = ?auto_632005 ?auto_632011 ) ) ( not ( = ?auto_632005 ?auto_632012 ) ) ( not ( = ?auto_632005 ?auto_632013 ) ) ( not ( = ?auto_632005 ?auto_632014 ) ) ( not ( = ?auto_632005 ?auto_632018 ) ) ( not ( = ?auto_632005 ?auto_632015 ) ) ( not ( = ?auto_632006 ?auto_632008 ) ) ( not ( = ?auto_632006 ?auto_632007 ) ) ( not ( = ?auto_632006 ?auto_632009 ) ) ( not ( = ?auto_632006 ?auto_632010 ) ) ( not ( = ?auto_632006 ?auto_632011 ) ) ( not ( = ?auto_632006 ?auto_632012 ) ) ( not ( = ?auto_632006 ?auto_632013 ) ) ( not ( = ?auto_632006 ?auto_632014 ) ) ( not ( = ?auto_632006 ?auto_632018 ) ) ( not ( = ?auto_632006 ?auto_632015 ) ) ( not ( = ?auto_632008 ?auto_632007 ) ) ( not ( = ?auto_632008 ?auto_632009 ) ) ( not ( = ?auto_632008 ?auto_632010 ) ) ( not ( = ?auto_632008 ?auto_632011 ) ) ( not ( = ?auto_632008 ?auto_632012 ) ) ( not ( = ?auto_632008 ?auto_632013 ) ) ( not ( = ?auto_632008 ?auto_632014 ) ) ( not ( = ?auto_632008 ?auto_632018 ) ) ( not ( = ?auto_632008 ?auto_632015 ) ) ( not ( = ?auto_632007 ?auto_632009 ) ) ( not ( = ?auto_632007 ?auto_632010 ) ) ( not ( = ?auto_632007 ?auto_632011 ) ) ( not ( = ?auto_632007 ?auto_632012 ) ) ( not ( = ?auto_632007 ?auto_632013 ) ) ( not ( = ?auto_632007 ?auto_632014 ) ) ( not ( = ?auto_632007 ?auto_632018 ) ) ( not ( = ?auto_632007 ?auto_632015 ) ) ( not ( = ?auto_632009 ?auto_632010 ) ) ( not ( = ?auto_632009 ?auto_632011 ) ) ( not ( = ?auto_632009 ?auto_632012 ) ) ( not ( = ?auto_632009 ?auto_632013 ) ) ( not ( = ?auto_632009 ?auto_632014 ) ) ( not ( = ?auto_632009 ?auto_632018 ) ) ( not ( = ?auto_632009 ?auto_632015 ) ) ( not ( = ?auto_632010 ?auto_632011 ) ) ( not ( = ?auto_632010 ?auto_632012 ) ) ( not ( = ?auto_632010 ?auto_632013 ) ) ( not ( = ?auto_632010 ?auto_632014 ) ) ( not ( = ?auto_632010 ?auto_632018 ) ) ( not ( = ?auto_632010 ?auto_632015 ) ) ( not ( = ?auto_632011 ?auto_632012 ) ) ( not ( = ?auto_632011 ?auto_632013 ) ) ( not ( = ?auto_632011 ?auto_632014 ) ) ( not ( = ?auto_632011 ?auto_632018 ) ) ( not ( = ?auto_632011 ?auto_632015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632012 ?auto_632013 ?auto_632014 )
      ( MAKE-10CRATE-VERIFY ?auto_632004 ?auto_632005 ?auto_632006 ?auto_632008 ?auto_632007 ?auto_632009 ?auto_632010 ?auto_632011 ?auto_632012 ?auto_632013 ?auto_632014 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_632022 - SURFACE
      ?auto_632023 - SURFACE
      ?auto_632024 - SURFACE
      ?auto_632026 - SURFACE
      ?auto_632025 - SURFACE
      ?auto_632027 - SURFACE
      ?auto_632028 - SURFACE
      ?auto_632029 - SURFACE
      ?auto_632030 - SURFACE
      ?auto_632031 - SURFACE
      ?auto_632032 - SURFACE
      ?auto_632033 - SURFACE
    )
    :vars
    (
      ?auto_632038 - HOIST
      ?auto_632035 - PLACE
      ?auto_632039 - PLACE
      ?auto_632040 - HOIST
      ?auto_632037 - SURFACE
      ?auto_632036 - TRUCK
      ?auto_632034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632038 ?auto_632035 ) ( IS-CRATE ?auto_632033 ) ( not ( = ?auto_632032 ?auto_632033 ) ) ( not ( = ?auto_632031 ?auto_632032 ) ) ( not ( = ?auto_632031 ?auto_632033 ) ) ( not ( = ?auto_632039 ?auto_632035 ) ) ( HOIST-AT ?auto_632040 ?auto_632039 ) ( not ( = ?auto_632038 ?auto_632040 ) ) ( SURFACE-AT ?auto_632033 ?auto_632039 ) ( ON ?auto_632033 ?auto_632037 ) ( CLEAR ?auto_632033 ) ( not ( = ?auto_632032 ?auto_632037 ) ) ( not ( = ?auto_632033 ?auto_632037 ) ) ( not ( = ?auto_632031 ?auto_632037 ) ) ( SURFACE-AT ?auto_632031 ?auto_632035 ) ( CLEAR ?auto_632031 ) ( IS-CRATE ?auto_632032 ) ( AVAILABLE ?auto_632038 ) ( TRUCK-AT ?auto_632036 ?auto_632039 ) ( AVAILABLE ?auto_632040 ) ( SURFACE-AT ?auto_632032 ?auto_632039 ) ( ON ?auto_632032 ?auto_632034 ) ( CLEAR ?auto_632032 ) ( not ( = ?auto_632032 ?auto_632034 ) ) ( not ( = ?auto_632033 ?auto_632034 ) ) ( not ( = ?auto_632031 ?auto_632034 ) ) ( not ( = ?auto_632037 ?auto_632034 ) ) ( ON ?auto_632023 ?auto_632022 ) ( ON ?auto_632024 ?auto_632023 ) ( ON ?auto_632026 ?auto_632024 ) ( ON ?auto_632025 ?auto_632026 ) ( ON ?auto_632027 ?auto_632025 ) ( ON ?auto_632028 ?auto_632027 ) ( ON ?auto_632029 ?auto_632028 ) ( ON ?auto_632030 ?auto_632029 ) ( ON ?auto_632031 ?auto_632030 ) ( not ( = ?auto_632022 ?auto_632023 ) ) ( not ( = ?auto_632022 ?auto_632024 ) ) ( not ( = ?auto_632022 ?auto_632026 ) ) ( not ( = ?auto_632022 ?auto_632025 ) ) ( not ( = ?auto_632022 ?auto_632027 ) ) ( not ( = ?auto_632022 ?auto_632028 ) ) ( not ( = ?auto_632022 ?auto_632029 ) ) ( not ( = ?auto_632022 ?auto_632030 ) ) ( not ( = ?auto_632022 ?auto_632031 ) ) ( not ( = ?auto_632022 ?auto_632032 ) ) ( not ( = ?auto_632022 ?auto_632033 ) ) ( not ( = ?auto_632022 ?auto_632037 ) ) ( not ( = ?auto_632022 ?auto_632034 ) ) ( not ( = ?auto_632023 ?auto_632024 ) ) ( not ( = ?auto_632023 ?auto_632026 ) ) ( not ( = ?auto_632023 ?auto_632025 ) ) ( not ( = ?auto_632023 ?auto_632027 ) ) ( not ( = ?auto_632023 ?auto_632028 ) ) ( not ( = ?auto_632023 ?auto_632029 ) ) ( not ( = ?auto_632023 ?auto_632030 ) ) ( not ( = ?auto_632023 ?auto_632031 ) ) ( not ( = ?auto_632023 ?auto_632032 ) ) ( not ( = ?auto_632023 ?auto_632033 ) ) ( not ( = ?auto_632023 ?auto_632037 ) ) ( not ( = ?auto_632023 ?auto_632034 ) ) ( not ( = ?auto_632024 ?auto_632026 ) ) ( not ( = ?auto_632024 ?auto_632025 ) ) ( not ( = ?auto_632024 ?auto_632027 ) ) ( not ( = ?auto_632024 ?auto_632028 ) ) ( not ( = ?auto_632024 ?auto_632029 ) ) ( not ( = ?auto_632024 ?auto_632030 ) ) ( not ( = ?auto_632024 ?auto_632031 ) ) ( not ( = ?auto_632024 ?auto_632032 ) ) ( not ( = ?auto_632024 ?auto_632033 ) ) ( not ( = ?auto_632024 ?auto_632037 ) ) ( not ( = ?auto_632024 ?auto_632034 ) ) ( not ( = ?auto_632026 ?auto_632025 ) ) ( not ( = ?auto_632026 ?auto_632027 ) ) ( not ( = ?auto_632026 ?auto_632028 ) ) ( not ( = ?auto_632026 ?auto_632029 ) ) ( not ( = ?auto_632026 ?auto_632030 ) ) ( not ( = ?auto_632026 ?auto_632031 ) ) ( not ( = ?auto_632026 ?auto_632032 ) ) ( not ( = ?auto_632026 ?auto_632033 ) ) ( not ( = ?auto_632026 ?auto_632037 ) ) ( not ( = ?auto_632026 ?auto_632034 ) ) ( not ( = ?auto_632025 ?auto_632027 ) ) ( not ( = ?auto_632025 ?auto_632028 ) ) ( not ( = ?auto_632025 ?auto_632029 ) ) ( not ( = ?auto_632025 ?auto_632030 ) ) ( not ( = ?auto_632025 ?auto_632031 ) ) ( not ( = ?auto_632025 ?auto_632032 ) ) ( not ( = ?auto_632025 ?auto_632033 ) ) ( not ( = ?auto_632025 ?auto_632037 ) ) ( not ( = ?auto_632025 ?auto_632034 ) ) ( not ( = ?auto_632027 ?auto_632028 ) ) ( not ( = ?auto_632027 ?auto_632029 ) ) ( not ( = ?auto_632027 ?auto_632030 ) ) ( not ( = ?auto_632027 ?auto_632031 ) ) ( not ( = ?auto_632027 ?auto_632032 ) ) ( not ( = ?auto_632027 ?auto_632033 ) ) ( not ( = ?auto_632027 ?auto_632037 ) ) ( not ( = ?auto_632027 ?auto_632034 ) ) ( not ( = ?auto_632028 ?auto_632029 ) ) ( not ( = ?auto_632028 ?auto_632030 ) ) ( not ( = ?auto_632028 ?auto_632031 ) ) ( not ( = ?auto_632028 ?auto_632032 ) ) ( not ( = ?auto_632028 ?auto_632033 ) ) ( not ( = ?auto_632028 ?auto_632037 ) ) ( not ( = ?auto_632028 ?auto_632034 ) ) ( not ( = ?auto_632029 ?auto_632030 ) ) ( not ( = ?auto_632029 ?auto_632031 ) ) ( not ( = ?auto_632029 ?auto_632032 ) ) ( not ( = ?auto_632029 ?auto_632033 ) ) ( not ( = ?auto_632029 ?auto_632037 ) ) ( not ( = ?auto_632029 ?auto_632034 ) ) ( not ( = ?auto_632030 ?auto_632031 ) ) ( not ( = ?auto_632030 ?auto_632032 ) ) ( not ( = ?auto_632030 ?auto_632033 ) ) ( not ( = ?auto_632030 ?auto_632037 ) ) ( not ( = ?auto_632030 ?auto_632034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632031 ?auto_632032 ?auto_632033 )
      ( MAKE-11CRATE-VERIFY ?auto_632022 ?auto_632023 ?auto_632024 ?auto_632026 ?auto_632025 ?auto_632027 ?auto_632028 ?auto_632029 ?auto_632030 ?auto_632031 ?auto_632032 ?auto_632033 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_632041 - SURFACE
      ?auto_632042 - SURFACE
      ?auto_632043 - SURFACE
      ?auto_632045 - SURFACE
      ?auto_632044 - SURFACE
      ?auto_632046 - SURFACE
      ?auto_632047 - SURFACE
      ?auto_632048 - SURFACE
      ?auto_632049 - SURFACE
      ?auto_632050 - SURFACE
      ?auto_632051 - SURFACE
      ?auto_632052 - SURFACE
      ?auto_632053 - SURFACE
    )
    :vars
    (
      ?auto_632058 - HOIST
      ?auto_632055 - PLACE
      ?auto_632059 - PLACE
      ?auto_632060 - HOIST
      ?auto_632057 - SURFACE
      ?auto_632056 - TRUCK
      ?auto_632054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632058 ?auto_632055 ) ( IS-CRATE ?auto_632053 ) ( not ( = ?auto_632052 ?auto_632053 ) ) ( not ( = ?auto_632051 ?auto_632052 ) ) ( not ( = ?auto_632051 ?auto_632053 ) ) ( not ( = ?auto_632059 ?auto_632055 ) ) ( HOIST-AT ?auto_632060 ?auto_632059 ) ( not ( = ?auto_632058 ?auto_632060 ) ) ( SURFACE-AT ?auto_632053 ?auto_632059 ) ( ON ?auto_632053 ?auto_632057 ) ( CLEAR ?auto_632053 ) ( not ( = ?auto_632052 ?auto_632057 ) ) ( not ( = ?auto_632053 ?auto_632057 ) ) ( not ( = ?auto_632051 ?auto_632057 ) ) ( SURFACE-AT ?auto_632051 ?auto_632055 ) ( CLEAR ?auto_632051 ) ( IS-CRATE ?auto_632052 ) ( AVAILABLE ?auto_632058 ) ( TRUCK-AT ?auto_632056 ?auto_632059 ) ( AVAILABLE ?auto_632060 ) ( SURFACE-AT ?auto_632052 ?auto_632059 ) ( ON ?auto_632052 ?auto_632054 ) ( CLEAR ?auto_632052 ) ( not ( = ?auto_632052 ?auto_632054 ) ) ( not ( = ?auto_632053 ?auto_632054 ) ) ( not ( = ?auto_632051 ?auto_632054 ) ) ( not ( = ?auto_632057 ?auto_632054 ) ) ( ON ?auto_632042 ?auto_632041 ) ( ON ?auto_632043 ?auto_632042 ) ( ON ?auto_632045 ?auto_632043 ) ( ON ?auto_632044 ?auto_632045 ) ( ON ?auto_632046 ?auto_632044 ) ( ON ?auto_632047 ?auto_632046 ) ( ON ?auto_632048 ?auto_632047 ) ( ON ?auto_632049 ?auto_632048 ) ( ON ?auto_632050 ?auto_632049 ) ( ON ?auto_632051 ?auto_632050 ) ( not ( = ?auto_632041 ?auto_632042 ) ) ( not ( = ?auto_632041 ?auto_632043 ) ) ( not ( = ?auto_632041 ?auto_632045 ) ) ( not ( = ?auto_632041 ?auto_632044 ) ) ( not ( = ?auto_632041 ?auto_632046 ) ) ( not ( = ?auto_632041 ?auto_632047 ) ) ( not ( = ?auto_632041 ?auto_632048 ) ) ( not ( = ?auto_632041 ?auto_632049 ) ) ( not ( = ?auto_632041 ?auto_632050 ) ) ( not ( = ?auto_632041 ?auto_632051 ) ) ( not ( = ?auto_632041 ?auto_632052 ) ) ( not ( = ?auto_632041 ?auto_632053 ) ) ( not ( = ?auto_632041 ?auto_632057 ) ) ( not ( = ?auto_632041 ?auto_632054 ) ) ( not ( = ?auto_632042 ?auto_632043 ) ) ( not ( = ?auto_632042 ?auto_632045 ) ) ( not ( = ?auto_632042 ?auto_632044 ) ) ( not ( = ?auto_632042 ?auto_632046 ) ) ( not ( = ?auto_632042 ?auto_632047 ) ) ( not ( = ?auto_632042 ?auto_632048 ) ) ( not ( = ?auto_632042 ?auto_632049 ) ) ( not ( = ?auto_632042 ?auto_632050 ) ) ( not ( = ?auto_632042 ?auto_632051 ) ) ( not ( = ?auto_632042 ?auto_632052 ) ) ( not ( = ?auto_632042 ?auto_632053 ) ) ( not ( = ?auto_632042 ?auto_632057 ) ) ( not ( = ?auto_632042 ?auto_632054 ) ) ( not ( = ?auto_632043 ?auto_632045 ) ) ( not ( = ?auto_632043 ?auto_632044 ) ) ( not ( = ?auto_632043 ?auto_632046 ) ) ( not ( = ?auto_632043 ?auto_632047 ) ) ( not ( = ?auto_632043 ?auto_632048 ) ) ( not ( = ?auto_632043 ?auto_632049 ) ) ( not ( = ?auto_632043 ?auto_632050 ) ) ( not ( = ?auto_632043 ?auto_632051 ) ) ( not ( = ?auto_632043 ?auto_632052 ) ) ( not ( = ?auto_632043 ?auto_632053 ) ) ( not ( = ?auto_632043 ?auto_632057 ) ) ( not ( = ?auto_632043 ?auto_632054 ) ) ( not ( = ?auto_632045 ?auto_632044 ) ) ( not ( = ?auto_632045 ?auto_632046 ) ) ( not ( = ?auto_632045 ?auto_632047 ) ) ( not ( = ?auto_632045 ?auto_632048 ) ) ( not ( = ?auto_632045 ?auto_632049 ) ) ( not ( = ?auto_632045 ?auto_632050 ) ) ( not ( = ?auto_632045 ?auto_632051 ) ) ( not ( = ?auto_632045 ?auto_632052 ) ) ( not ( = ?auto_632045 ?auto_632053 ) ) ( not ( = ?auto_632045 ?auto_632057 ) ) ( not ( = ?auto_632045 ?auto_632054 ) ) ( not ( = ?auto_632044 ?auto_632046 ) ) ( not ( = ?auto_632044 ?auto_632047 ) ) ( not ( = ?auto_632044 ?auto_632048 ) ) ( not ( = ?auto_632044 ?auto_632049 ) ) ( not ( = ?auto_632044 ?auto_632050 ) ) ( not ( = ?auto_632044 ?auto_632051 ) ) ( not ( = ?auto_632044 ?auto_632052 ) ) ( not ( = ?auto_632044 ?auto_632053 ) ) ( not ( = ?auto_632044 ?auto_632057 ) ) ( not ( = ?auto_632044 ?auto_632054 ) ) ( not ( = ?auto_632046 ?auto_632047 ) ) ( not ( = ?auto_632046 ?auto_632048 ) ) ( not ( = ?auto_632046 ?auto_632049 ) ) ( not ( = ?auto_632046 ?auto_632050 ) ) ( not ( = ?auto_632046 ?auto_632051 ) ) ( not ( = ?auto_632046 ?auto_632052 ) ) ( not ( = ?auto_632046 ?auto_632053 ) ) ( not ( = ?auto_632046 ?auto_632057 ) ) ( not ( = ?auto_632046 ?auto_632054 ) ) ( not ( = ?auto_632047 ?auto_632048 ) ) ( not ( = ?auto_632047 ?auto_632049 ) ) ( not ( = ?auto_632047 ?auto_632050 ) ) ( not ( = ?auto_632047 ?auto_632051 ) ) ( not ( = ?auto_632047 ?auto_632052 ) ) ( not ( = ?auto_632047 ?auto_632053 ) ) ( not ( = ?auto_632047 ?auto_632057 ) ) ( not ( = ?auto_632047 ?auto_632054 ) ) ( not ( = ?auto_632048 ?auto_632049 ) ) ( not ( = ?auto_632048 ?auto_632050 ) ) ( not ( = ?auto_632048 ?auto_632051 ) ) ( not ( = ?auto_632048 ?auto_632052 ) ) ( not ( = ?auto_632048 ?auto_632053 ) ) ( not ( = ?auto_632048 ?auto_632057 ) ) ( not ( = ?auto_632048 ?auto_632054 ) ) ( not ( = ?auto_632049 ?auto_632050 ) ) ( not ( = ?auto_632049 ?auto_632051 ) ) ( not ( = ?auto_632049 ?auto_632052 ) ) ( not ( = ?auto_632049 ?auto_632053 ) ) ( not ( = ?auto_632049 ?auto_632057 ) ) ( not ( = ?auto_632049 ?auto_632054 ) ) ( not ( = ?auto_632050 ?auto_632051 ) ) ( not ( = ?auto_632050 ?auto_632052 ) ) ( not ( = ?auto_632050 ?auto_632053 ) ) ( not ( = ?auto_632050 ?auto_632057 ) ) ( not ( = ?auto_632050 ?auto_632054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632051 ?auto_632052 ?auto_632053 )
      ( MAKE-12CRATE-VERIFY ?auto_632041 ?auto_632042 ?auto_632043 ?auto_632045 ?auto_632044 ?auto_632046 ?auto_632047 ?auto_632048 ?auto_632049 ?auto_632050 ?auto_632051 ?auto_632052 ?auto_632053 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_632061 - SURFACE
      ?auto_632062 - SURFACE
    )
    :vars
    (
      ?auto_632067 - HOIST
      ?auto_632064 - PLACE
      ?auto_632069 - SURFACE
      ?auto_632068 - PLACE
      ?auto_632070 - HOIST
      ?auto_632066 - SURFACE
      ?auto_632063 - SURFACE
      ?auto_632065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632067 ?auto_632064 ) ( IS-CRATE ?auto_632062 ) ( not ( = ?auto_632061 ?auto_632062 ) ) ( not ( = ?auto_632069 ?auto_632061 ) ) ( not ( = ?auto_632069 ?auto_632062 ) ) ( not ( = ?auto_632068 ?auto_632064 ) ) ( HOIST-AT ?auto_632070 ?auto_632068 ) ( not ( = ?auto_632067 ?auto_632070 ) ) ( SURFACE-AT ?auto_632062 ?auto_632068 ) ( ON ?auto_632062 ?auto_632066 ) ( CLEAR ?auto_632062 ) ( not ( = ?auto_632061 ?auto_632066 ) ) ( not ( = ?auto_632062 ?auto_632066 ) ) ( not ( = ?auto_632069 ?auto_632066 ) ) ( SURFACE-AT ?auto_632069 ?auto_632064 ) ( CLEAR ?auto_632069 ) ( IS-CRATE ?auto_632061 ) ( AVAILABLE ?auto_632067 ) ( AVAILABLE ?auto_632070 ) ( SURFACE-AT ?auto_632061 ?auto_632068 ) ( ON ?auto_632061 ?auto_632063 ) ( CLEAR ?auto_632061 ) ( not ( = ?auto_632061 ?auto_632063 ) ) ( not ( = ?auto_632062 ?auto_632063 ) ) ( not ( = ?auto_632069 ?auto_632063 ) ) ( not ( = ?auto_632066 ?auto_632063 ) ) ( TRUCK-AT ?auto_632065 ?auto_632064 ) )
    :subtasks
    ( ( !DRIVE ?auto_632065 ?auto_632064 ?auto_632068 )
      ( MAKE-2CRATE ?auto_632069 ?auto_632061 ?auto_632062 )
      ( MAKE-1CRATE-VERIFY ?auto_632061 ?auto_632062 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_632071 - SURFACE
      ?auto_632072 - SURFACE
      ?auto_632073 - SURFACE
    )
    :vars
    (
      ?auto_632079 - HOIST
      ?auto_632080 - PLACE
      ?auto_632077 - PLACE
      ?auto_632075 - HOIST
      ?auto_632078 - SURFACE
      ?auto_632076 - SURFACE
      ?auto_632074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632079 ?auto_632080 ) ( IS-CRATE ?auto_632073 ) ( not ( = ?auto_632072 ?auto_632073 ) ) ( not ( = ?auto_632071 ?auto_632072 ) ) ( not ( = ?auto_632071 ?auto_632073 ) ) ( not ( = ?auto_632077 ?auto_632080 ) ) ( HOIST-AT ?auto_632075 ?auto_632077 ) ( not ( = ?auto_632079 ?auto_632075 ) ) ( SURFACE-AT ?auto_632073 ?auto_632077 ) ( ON ?auto_632073 ?auto_632078 ) ( CLEAR ?auto_632073 ) ( not ( = ?auto_632072 ?auto_632078 ) ) ( not ( = ?auto_632073 ?auto_632078 ) ) ( not ( = ?auto_632071 ?auto_632078 ) ) ( SURFACE-AT ?auto_632071 ?auto_632080 ) ( CLEAR ?auto_632071 ) ( IS-CRATE ?auto_632072 ) ( AVAILABLE ?auto_632079 ) ( AVAILABLE ?auto_632075 ) ( SURFACE-AT ?auto_632072 ?auto_632077 ) ( ON ?auto_632072 ?auto_632076 ) ( CLEAR ?auto_632072 ) ( not ( = ?auto_632072 ?auto_632076 ) ) ( not ( = ?auto_632073 ?auto_632076 ) ) ( not ( = ?auto_632071 ?auto_632076 ) ) ( not ( = ?auto_632078 ?auto_632076 ) ) ( TRUCK-AT ?auto_632074 ?auto_632080 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_632072 ?auto_632073 )
      ( MAKE-2CRATE-VERIFY ?auto_632071 ?auto_632072 ?auto_632073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_632081 - SURFACE
      ?auto_632082 - SURFACE
      ?auto_632083 - SURFACE
      ?auto_632084 - SURFACE
    )
    :vars
    (
      ?auto_632088 - HOIST
      ?auto_632089 - PLACE
      ?auto_632087 - PLACE
      ?auto_632090 - HOIST
      ?auto_632086 - SURFACE
      ?auto_632091 - SURFACE
      ?auto_632085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632088 ?auto_632089 ) ( IS-CRATE ?auto_632084 ) ( not ( = ?auto_632083 ?auto_632084 ) ) ( not ( = ?auto_632082 ?auto_632083 ) ) ( not ( = ?auto_632082 ?auto_632084 ) ) ( not ( = ?auto_632087 ?auto_632089 ) ) ( HOIST-AT ?auto_632090 ?auto_632087 ) ( not ( = ?auto_632088 ?auto_632090 ) ) ( SURFACE-AT ?auto_632084 ?auto_632087 ) ( ON ?auto_632084 ?auto_632086 ) ( CLEAR ?auto_632084 ) ( not ( = ?auto_632083 ?auto_632086 ) ) ( not ( = ?auto_632084 ?auto_632086 ) ) ( not ( = ?auto_632082 ?auto_632086 ) ) ( SURFACE-AT ?auto_632082 ?auto_632089 ) ( CLEAR ?auto_632082 ) ( IS-CRATE ?auto_632083 ) ( AVAILABLE ?auto_632088 ) ( AVAILABLE ?auto_632090 ) ( SURFACE-AT ?auto_632083 ?auto_632087 ) ( ON ?auto_632083 ?auto_632091 ) ( CLEAR ?auto_632083 ) ( not ( = ?auto_632083 ?auto_632091 ) ) ( not ( = ?auto_632084 ?auto_632091 ) ) ( not ( = ?auto_632082 ?auto_632091 ) ) ( not ( = ?auto_632086 ?auto_632091 ) ) ( TRUCK-AT ?auto_632085 ?auto_632089 ) ( ON ?auto_632082 ?auto_632081 ) ( not ( = ?auto_632081 ?auto_632082 ) ) ( not ( = ?auto_632081 ?auto_632083 ) ) ( not ( = ?auto_632081 ?auto_632084 ) ) ( not ( = ?auto_632081 ?auto_632086 ) ) ( not ( = ?auto_632081 ?auto_632091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632082 ?auto_632083 ?auto_632084 )
      ( MAKE-3CRATE-VERIFY ?auto_632081 ?auto_632082 ?auto_632083 ?auto_632084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_632092 - SURFACE
      ?auto_632093 - SURFACE
      ?auto_632094 - SURFACE
      ?auto_632096 - SURFACE
      ?auto_632095 - SURFACE
    )
    :vars
    (
      ?auto_632100 - HOIST
      ?auto_632101 - PLACE
      ?auto_632099 - PLACE
      ?auto_632102 - HOIST
      ?auto_632098 - SURFACE
      ?auto_632103 - SURFACE
      ?auto_632097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632100 ?auto_632101 ) ( IS-CRATE ?auto_632095 ) ( not ( = ?auto_632096 ?auto_632095 ) ) ( not ( = ?auto_632094 ?auto_632096 ) ) ( not ( = ?auto_632094 ?auto_632095 ) ) ( not ( = ?auto_632099 ?auto_632101 ) ) ( HOIST-AT ?auto_632102 ?auto_632099 ) ( not ( = ?auto_632100 ?auto_632102 ) ) ( SURFACE-AT ?auto_632095 ?auto_632099 ) ( ON ?auto_632095 ?auto_632098 ) ( CLEAR ?auto_632095 ) ( not ( = ?auto_632096 ?auto_632098 ) ) ( not ( = ?auto_632095 ?auto_632098 ) ) ( not ( = ?auto_632094 ?auto_632098 ) ) ( SURFACE-AT ?auto_632094 ?auto_632101 ) ( CLEAR ?auto_632094 ) ( IS-CRATE ?auto_632096 ) ( AVAILABLE ?auto_632100 ) ( AVAILABLE ?auto_632102 ) ( SURFACE-AT ?auto_632096 ?auto_632099 ) ( ON ?auto_632096 ?auto_632103 ) ( CLEAR ?auto_632096 ) ( not ( = ?auto_632096 ?auto_632103 ) ) ( not ( = ?auto_632095 ?auto_632103 ) ) ( not ( = ?auto_632094 ?auto_632103 ) ) ( not ( = ?auto_632098 ?auto_632103 ) ) ( TRUCK-AT ?auto_632097 ?auto_632101 ) ( ON ?auto_632093 ?auto_632092 ) ( ON ?auto_632094 ?auto_632093 ) ( not ( = ?auto_632092 ?auto_632093 ) ) ( not ( = ?auto_632092 ?auto_632094 ) ) ( not ( = ?auto_632092 ?auto_632096 ) ) ( not ( = ?auto_632092 ?auto_632095 ) ) ( not ( = ?auto_632092 ?auto_632098 ) ) ( not ( = ?auto_632092 ?auto_632103 ) ) ( not ( = ?auto_632093 ?auto_632094 ) ) ( not ( = ?auto_632093 ?auto_632096 ) ) ( not ( = ?auto_632093 ?auto_632095 ) ) ( not ( = ?auto_632093 ?auto_632098 ) ) ( not ( = ?auto_632093 ?auto_632103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632094 ?auto_632096 ?auto_632095 )
      ( MAKE-4CRATE-VERIFY ?auto_632092 ?auto_632093 ?auto_632094 ?auto_632096 ?auto_632095 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_632104 - SURFACE
      ?auto_632105 - SURFACE
      ?auto_632106 - SURFACE
      ?auto_632108 - SURFACE
      ?auto_632107 - SURFACE
      ?auto_632109 - SURFACE
    )
    :vars
    (
      ?auto_632113 - HOIST
      ?auto_632114 - PLACE
      ?auto_632112 - PLACE
      ?auto_632115 - HOIST
      ?auto_632111 - SURFACE
      ?auto_632116 - SURFACE
      ?auto_632110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632113 ?auto_632114 ) ( IS-CRATE ?auto_632109 ) ( not ( = ?auto_632107 ?auto_632109 ) ) ( not ( = ?auto_632108 ?auto_632107 ) ) ( not ( = ?auto_632108 ?auto_632109 ) ) ( not ( = ?auto_632112 ?auto_632114 ) ) ( HOIST-AT ?auto_632115 ?auto_632112 ) ( not ( = ?auto_632113 ?auto_632115 ) ) ( SURFACE-AT ?auto_632109 ?auto_632112 ) ( ON ?auto_632109 ?auto_632111 ) ( CLEAR ?auto_632109 ) ( not ( = ?auto_632107 ?auto_632111 ) ) ( not ( = ?auto_632109 ?auto_632111 ) ) ( not ( = ?auto_632108 ?auto_632111 ) ) ( SURFACE-AT ?auto_632108 ?auto_632114 ) ( CLEAR ?auto_632108 ) ( IS-CRATE ?auto_632107 ) ( AVAILABLE ?auto_632113 ) ( AVAILABLE ?auto_632115 ) ( SURFACE-AT ?auto_632107 ?auto_632112 ) ( ON ?auto_632107 ?auto_632116 ) ( CLEAR ?auto_632107 ) ( not ( = ?auto_632107 ?auto_632116 ) ) ( not ( = ?auto_632109 ?auto_632116 ) ) ( not ( = ?auto_632108 ?auto_632116 ) ) ( not ( = ?auto_632111 ?auto_632116 ) ) ( TRUCK-AT ?auto_632110 ?auto_632114 ) ( ON ?auto_632105 ?auto_632104 ) ( ON ?auto_632106 ?auto_632105 ) ( ON ?auto_632108 ?auto_632106 ) ( not ( = ?auto_632104 ?auto_632105 ) ) ( not ( = ?auto_632104 ?auto_632106 ) ) ( not ( = ?auto_632104 ?auto_632108 ) ) ( not ( = ?auto_632104 ?auto_632107 ) ) ( not ( = ?auto_632104 ?auto_632109 ) ) ( not ( = ?auto_632104 ?auto_632111 ) ) ( not ( = ?auto_632104 ?auto_632116 ) ) ( not ( = ?auto_632105 ?auto_632106 ) ) ( not ( = ?auto_632105 ?auto_632108 ) ) ( not ( = ?auto_632105 ?auto_632107 ) ) ( not ( = ?auto_632105 ?auto_632109 ) ) ( not ( = ?auto_632105 ?auto_632111 ) ) ( not ( = ?auto_632105 ?auto_632116 ) ) ( not ( = ?auto_632106 ?auto_632108 ) ) ( not ( = ?auto_632106 ?auto_632107 ) ) ( not ( = ?auto_632106 ?auto_632109 ) ) ( not ( = ?auto_632106 ?auto_632111 ) ) ( not ( = ?auto_632106 ?auto_632116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632108 ?auto_632107 ?auto_632109 )
      ( MAKE-5CRATE-VERIFY ?auto_632104 ?auto_632105 ?auto_632106 ?auto_632108 ?auto_632107 ?auto_632109 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_632117 - SURFACE
      ?auto_632118 - SURFACE
      ?auto_632119 - SURFACE
      ?auto_632121 - SURFACE
      ?auto_632120 - SURFACE
      ?auto_632122 - SURFACE
      ?auto_632123 - SURFACE
    )
    :vars
    (
      ?auto_632127 - HOIST
      ?auto_632128 - PLACE
      ?auto_632126 - PLACE
      ?auto_632129 - HOIST
      ?auto_632125 - SURFACE
      ?auto_632130 - SURFACE
      ?auto_632124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632127 ?auto_632128 ) ( IS-CRATE ?auto_632123 ) ( not ( = ?auto_632122 ?auto_632123 ) ) ( not ( = ?auto_632120 ?auto_632122 ) ) ( not ( = ?auto_632120 ?auto_632123 ) ) ( not ( = ?auto_632126 ?auto_632128 ) ) ( HOIST-AT ?auto_632129 ?auto_632126 ) ( not ( = ?auto_632127 ?auto_632129 ) ) ( SURFACE-AT ?auto_632123 ?auto_632126 ) ( ON ?auto_632123 ?auto_632125 ) ( CLEAR ?auto_632123 ) ( not ( = ?auto_632122 ?auto_632125 ) ) ( not ( = ?auto_632123 ?auto_632125 ) ) ( not ( = ?auto_632120 ?auto_632125 ) ) ( SURFACE-AT ?auto_632120 ?auto_632128 ) ( CLEAR ?auto_632120 ) ( IS-CRATE ?auto_632122 ) ( AVAILABLE ?auto_632127 ) ( AVAILABLE ?auto_632129 ) ( SURFACE-AT ?auto_632122 ?auto_632126 ) ( ON ?auto_632122 ?auto_632130 ) ( CLEAR ?auto_632122 ) ( not ( = ?auto_632122 ?auto_632130 ) ) ( not ( = ?auto_632123 ?auto_632130 ) ) ( not ( = ?auto_632120 ?auto_632130 ) ) ( not ( = ?auto_632125 ?auto_632130 ) ) ( TRUCK-AT ?auto_632124 ?auto_632128 ) ( ON ?auto_632118 ?auto_632117 ) ( ON ?auto_632119 ?auto_632118 ) ( ON ?auto_632121 ?auto_632119 ) ( ON ?auto_632120 ?auto_632121 ) ( not ( = ?auto_632117 ?auto_632118 ) ) ( not ( = ?auto_632117 ?auto_632119 ) ) ( not ( = ?auto_632117 ?auto_632121 ) ) ( not ( = ?auto_632117 ?auto_632120 ) ) ( not ( = ?auto_632117 ?auto_632122 ) ) ( not ( = ?auto_632117 ?auto_632123 ) ) ( not ( = ?auto_632117 ?auto_632125 ) ) ( not ( = ?auto_632117 ?auto_632130 ) ) ( not ( = ?auto_632118 ?auto_632119 ) ) ( not ( = ?auto_632118 ?auto_632121 ) ) ( not ( = ?auto_632118 ?auto_632120 ) ) ( not ( = ?auto_632118 ?auto_632122 ) ) ( not ( = ?auto_632118 ?auto_632123 ) ) ( not ( = ?auto_632118 ?auto_632125 ) ) ( not ( = ?auto_632118 ?auto_632130 ) ) ( not ( = ?auto_632119 ?auto_632121 ) ) ( not ( = ?auto_632119 ?auto_632120 ) ) ( not ( = ?auto_632119 ?auto_632122 ) ) ( not ( = ?auto_632119 ?auto_632123 ) ) ( not ( = ?auto_632119 ?auto_632125 ) ) ( not ( = ?auto_632119 ?auto_632130 ) ) ( not ( = ?auto_632121 ?auto_632120 ) ) ( not ( = ?auto_632121 ?auto_632122 ) ) ( not ( = ?auto_632121 ?auto_632123 ) ) ( not ( = ?auto_632121 ?auto_632125 ) ) ( not ( = ?auto_632121 ?auto_632130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632120 ?auto_632122 ?auto_632123 )
      ( MAKE-6CRATE-VERIFY ?auto_632117 ?auto_632118 ?auto_632119 ?auto_632121 ?auto_632120 ?auto_632122 ?auto_632123 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_632131 - SURFACE
      ?auto_632132 - SURFACE
      ?auto_632133 - SURFACE
      ?auto_632135 - SURFACE
      ?auto_632134 - SURFACE
      ?auto_632136 - SURFACE
      ?auto_632137 - SURFACE
      ?auto_632138 - SURFACE
    )
    :vars
    (
      ?auto_632142 - HOIST
      ?auto_632143 - PLACE
      ?auto_632141 - PLACE
      ?auto_632144 - HOIST
      ?auto_632140 - SURFACE
      ?auto_632145 - SURFACE
      ?auto_632139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632142 ?auto_632143 ) ( IS-CRATE ?auto_632138 ) ( not ( = ?auto_632137 ?auto_632138 ) ) ( not ( = ?auto_632136 ?auto_632137 ) ) ( not ( = ?auto_632136 ?auto_632138 ) ) ( not ( = ?auto_632141 ?auto_632143 ) ) ( HOIST-AT ?auto_632144 ?auto_632141 ) ( not ( = ?auto_632142 ?auto_632144 ) ) ( SURFACE-AT ?auto_632138 ?auto_632141 ) ( ON ?auto_632138 ?auto_632140 ) ( CLEAR ?auto_632138 ) ( not ( = ?auto_632137 ?auto_632140 ) ) ( not ( = ?auto_632138 ?auto_632140 ) ) ( not ( = ?auto_632136 ?auto_632140 ) ) ( SURFACE-AT ?auto_632136 ?auto_632143 ) ( CLEAR ?auto_632136 ) ( IS-CRATE ?auto_632137 ) ( AVAILABLE ?auto_632142 ) ( AVAILABLE ?auto_632144 ) ( SURFACE-AT ?auto_632137 ?auto_632141 ) ( ON ?auto_632137 ?auto_632145 ) ( CLEAR ?auto_632137 ) ( not ( = ?auto_632137 ?auto_632145 ) ) ( not ( = ?auto_632138 ?auto_632145 ) ) ( not ( = ?auto_632136 ?auto_632145 ) ) ( not ( = ?auto_632140 ?auto_632145 ) ) ( TRUCK-AT ?auto_632139 ?auto_632143 ) ( ON ?auto_632132 ?auto_632131 ) ( ON ?auto_632133 ?auto_632132 ) ( ON ?auto_632135 ?auto_632133 ) ( ON ?auto_632134 ?auto_632135 ) ( ON ?auto_632136 ?auto_632134 ) ( not ( = ?auto_632131 ?auto_632132 ) ) ( not ( = ?auto_632131 ?auto_632133 ) ) ( not ( = ?auto_632131 ?auto_632135 ) ) ( not ( = ?auto_632131 ?auto_632134 ) ) ( not ( = ?auto_632131 ?auto_632136 ) ) ( not ( = ?auto_632131 ?auto_632137 ) ) ( not ( = ?auto_632131 ?auto_632138 ) ) ( not ( = ?auto_632131 ?auto_632140 ) ) ( not ( = ?auto_632131 ?auto_632145 ) ) ( not ( = ?auto_632132 ?auto_632133 ) ) ( not ( = ?auto_632132 ?auto_632135 ) ) ( not ( = ?auto_632132 ?auto_632134 ) ) ( not ( = ?auto_632132 ?auto_632136 ) ) ( not ( = ?auto_632132 ?auto_632137 ) ) ( not ( = ?auto_632132 ?auto_632138 ) ) ( not ( = ?auto_632132 ?auto_632140 ) ) ( not ( = ?auto_632132 ?auto_632145 ) ) ( not ( = ?auto_632133 ?auto_632135 ) ) ( not ( = ?auto_632133 ?auto_632134 ) ) ( not ( = ?auto_632133 ?auto_632136 ) ) ( not ( = ?auto_632133 ?auto_632137 ) ) ( not ( = ?auto_632133 ?auto_632138 ) ) ( not ( = ?auto_632133 ?auto_632140 ) ) ( not ( = ?auto_632133 ?auto_632145 ) ) ( not ( = ?auto_632135 ?auto_632134 ) ) ( not ( = ?auto_632135 ?auto_632136 ) ) ( not ( = ?auto_632135 ?auto_632137 ) ) ( not ( = ?auto_632135 ?auto_632138 ) ) ( not ( = ?auto_632135 ?auto_632140 ) ) ( not ( = ?auto_632135 ?auto_632145 ) ) ( not ( = ?auto_632134 ?auto_632136 ) ) ( not ( = ?auto_632134 ?auto_632137 ) ) ( not ( = ?auto_632134 ?auto_632138 ) ) ( not ( = ?auto_632134 ?auto_632140 ) ) ( not ( = ?auto_632134 ?auto_632145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632136 ?auto_632137 ?auto_632138 )
      ( MAKE-7CRATE-VERIFY ?auto_632131 ?auto_632132 ?auto_632133 ?auto_632135 ?auto_632134 ?auto_632136 ?auto_632137 ?auto_632138 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_632146 - SURFACE
      ?auto_632147 - SURFACE
      ?auto_632148 - SURFACE
      ?auto_632150 - SURFACE
      ?auto_632149 - SURFACE
      ?auto_632151 - SURFACE
      ?auto_632152 - SURFACE
      ?auto_632153 - SURFACE
      ?auto_632154 - SURFACE
    )
    :vars
    (
      ?auto_632158 - HOIST
      ?auto_632159 - PLACE
      ?auto_632157 - PLACE
      ?auto_632160 - HOIST
      ?auto_632156 - SURFACE
      ?auto_632161 - SURFACE
      ?auto_632155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632158 ?auto_632159 ) ( IS-CRATE ?auto_632154 ) ( not ( = ?auto_632153 ?auto_632154 ) ) ( not ( = ?auto_632152 ?auto_632153 ) ) ( not ( = ?auto_632152 ?auto_632154 ) ) ( not ( = ?auto_632157 ?auto_632159 ) ) ( HOIST-AT ?auto_632160 ?auto_632157 ) ( not ( = ?auto_632158 ?auto_632160 ) ) ( SURFACE-AT ?auto_632154 ?auto_632157 ) ( ON ?auto_632154 ?auto_632156 ) ( CLEAR ?auto_632154 ) ( not ( = ?auto_632153 ?auto_632156 ) ) ( not ( = ?auto_632154 ?auto_632156 ) ) ( not ( = ?auto_632152 ?auto_632156 ) ) ( SURFACE-AT ?auto_632152 ?auto_632159 ) ( CLEAR ?auto_632152 ) ( IS-CRATE ?auto_632153 ) ( AVAILABLE ?auto_632158 ) ( AVAILABLE ?auto_632160 ) ( SURFACE-AT ?auto_632153 ?auto_632157 ) ( ON ?auto_632153 ?auto_632161 ) ( CLEAR ?auto_632153 ) ( not ( = ?auto_632153 ?auto_632161 ) ) ( not ( = ?auto_632154 ?auto_632161 ) ) ( not ( = ?auto_632152 ?auto_632161 ) ) ( not ( = ?auto_632156 ?auto_632161 ) ) ( TRUCK-AT ?auto_632155 ?auto_632159 ) ( ON ?auto_632147 ?auto_632146 ) ( ON ?auto_632148 ?auto_632147 ) ( ON ?auto_632150 ?auto_632148 ) ( ON ?auto_632149 ?auto_632150 ) ( ON ?auto_632151 ?auto_632149 ) ( ON ?auto_632152 ?auto_632151 ) ( not ( = ?auto_632146 ?auto_632147 ) ) ( not ( = ?auto_632146 ?auto_632148 ) ) ( not ( = ?auto_632146 ?auto_632150 ) ) ( not ( = ?auto_632146 ?auto_632149 ) ) ( not ( = ?auto_632146 ?auto_632151 ) ) ( not ( = ?auto_632146 ?auto_632152 ) ) ( not ( = ?auto_632146 ?auto_632153 ) ) ( not ( = ?auto_632146 ?auto_632154 ) ) ( not ( = ?auto_632146 ?auto_632156 ) ) ( not ( = ?auto_632146 ?auto_632161 ) ) ( not ( = ?auto_632147 ?auto_632148 ) ) ( not ( = ?auto_632147 ?auto_632150 ) ) ( not ( = ?auto_632147 ?auto_632149 ) ) ( not ( = ?auto_632147 ?auto_632151 ) ) ( not ( = ?auto_632147 ?auto_632152 ) ) ( not ( = ?auto_632147 ?auto_632153 ) ) ( not ( = ?auto_632147 ?auto_632154 ) ) ( not ( = ?auto_632147 ?auto_632156 ) ) ( not ( = ?auto_632147 ?auto_632161 ) ) ( not ( = ?auto_632148 ?auto_632150 ) ) ( not ( = ?auto_632148 ?auto_632149 ) ) ( not ( = ?auto_632148 ?auto_632151 ) ) ( not ( = ?auto_632148 ?auto_632152 ) ) ( not ( = ?auto_632148 ?auto_632153 ) ) ( not ( = ?auto_632148 ?auto_632154 ) ) ( not ( = ?auto_632148 ?auto_632156 ) ) ( not ( = ?auto_632148 ?auto_632161 ) ) ( not ( = ?auto_632150 ?auto_632149 ) ) ( not ( = ?auto_632150 ?auto_632151 ) ) ( not ( = ?auto_632150 ?auto_632152 ) ) ( not ( = ?auto_632150 ?auto_632153 ) ) ( not ( = ?auto_632150 ?auto_632154 ) ) ( not ( = ?auto_632150 ?auto_632156 ) ) ( not ( = ?auto_632150 ?auto_632161 ) ) ( not ( = ?auto_632149 ?auto_632151 ) ) ( not ( = ?auto_632149 ?auto_632152 ) ) ( not ( = ?auto_632149 ?auto_632153 ) ) ( not ( = ?auto_632149 ?auto_632154 ) ) ( not ( = ?auto_632149 ?auto_632156 ) ) ( not ( = ?auto_632149 ?auto_632161 ) ) ( not ( = ?auto_632151 ?auto_632152 ) ) ( not ( = ?auto_632151 ?auto_632153 ) ) ( not ( = ?auto_632151 ?auto_632154 ) ) ( not ( = ?auto_632151 ?auto_632156 ) ) ( not ( = ?auto_632151 ?auto_632161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632152 ?auto_632153 ?auto_632154 )
      ( MAKE-8CRATE-VERIFY ?auto_632146 ?auto_632147 ?auto_632148 ?auto_632150 ?auto_632149 ?auto_632151 ?auto_632152 ?auto_632153 ?auto_632154 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_632162 - SURFACE
      ?auto_632163 - SURFACE
      ?auto_632164 - SURFACE
      ?auto_632166 - SURFACE
      ?auto_632165 - SURFACE
      ?auto_632167 - SURFACE
      ?auto_632168 - SURFACE
      ?auto_632169 - SURFACE
      ?auto_632170 - SURFACE
      ?auto_632171 - SURFACE
    )
    :vars
    (
      ?auto_632175 - HOIST
      ?auto_632176 - PLACE
      ?auto_632174 - PLACE
      ?auto_632177 - HOIST
      ?auto_632173 - SURFACE
      ?auto_632178 - SURFACE
      ?auto_632172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632175 ?auto_632176 ) ( IS-CRATE ?auto_632171 ) ( not ( = ?auto_632170 ?auto_632171 ) ) ( not ( = ?auto_632169 ?auto_632170 ) ) ( not ( = ?auto_632169 ?auto_632171 ) ) ( not ( = ?auto_632174 ?auto_632176 ) ) ( HOIST-AT ?auto_632177 ?auto_632174 ) ( not ( = ?auto_632175 ?auto_632177 ) ) ( SURFACE-AT ?auto_632171 ?auto_632174 ) ( ON ?auto_632171 ?auto_632173 ) ( CLEAR ?auto_632171 ) ( not ( = ?auto_632170 ?auto_632173 ) ) ( not ( = ?auto_632171 ?auto_632173 ) ) ( not ( = ?auto_632169 ?auto_632173 ) ) ( SURFACE-AT ?auto_632169 ?auto_632176 ) ( CLEAR ?auto_632169 ) ( IS-CRATE ?auto_632170 ) ( AVAILABLE ?auto_632175 ) ( AVAILABLE ?auto_632177 ) ( SURFACE-AT ?auto_632170 ?auto_632174 ) ( ON ?auto_632170 ?auto_632178 ) ( CLEAR ?auto_632170 ) ( not ( = ?auto_632170 ?auto_632178 ) ) ( not ( = ?auto_632171 ?auto_632178 ) ) ( not ( = ?auto_632169 ?auto_632178 ) ) ( not ( = ?auto_632173 ?auto_632178 ) ) ( TRUCK-AT ?auto_632172 ?auto_632176 ) ( ON ?auto_632163 ?auto_632162 ) ( ON ?auto_632164 ?auto_632163 ) ( ON ?auto_632166 ?auto_632164 ) ( ON ?auto_632165 ?auto_632166 ) ( ON ?auto_632167 ?auto_632165 ) ( ON ?auto_632168 ?auto_632167 ) ( ON ?auto_632169 ?auto_632168 ) ( not ( = ?auto_632162 ?auto_632163 ) ) ( not ( = ?auto_632162 ?auto_632164 ) ) ( not ( = ?auto_632162 ?auto_632166 ) ) ( not ( = ?auto_632162 ?auto_632165 ) ) ( not ( = ?auto_632162 ?auto_632167 ) ) ( not ( = ?auto_632162 ?auto_632168 ) ) ( not ( = ?auto_632162 ?auto_632169 ) ) ( not ( = ?auto_632162 ?auto_632170 ) ) ( not ( = ?auto_632162 ?auto_632171 ) ) ( not ( = ?auto_632162 ?auto_632173 ) ) ( not ( = ?auto_632162 ?auto_632178 ) ) ( not ( = ?auto_632163 ?auto_632164 ) ) ( not ( = ?auto_632163 ?auto_632166 ) ) ( not ( = ?auto_632163 ?auto_632165 ) ) ( not ( = ?auto_632163 ?auto_632167 ) ) ( not ( = ?auto_632163 ?auto_632168 ) ) ( not ( = ?auto_632163 ?auto_632169 ) ) ( not ( = ?auto_632163 ?auto_632170 ) ) ( not ( = ?auto_632163 ?auto_632171 ) ) ( not ( = ?auto_632163 ?auto_632173 ) ) ( not ( = ?auto_632163 ?auto_632178 ) ) ( not ( = ?auto_632164 ?auto_632166 ) ) ( not ( = ?auto_632164 ?auto_632165 ) ) ( not ( = ?auto_632164 ?auto_632167 ) ) ( not ( = ?auto_632164 ?auto_632168 ) ) ( not ( = ?auto_632164 ?auto_632169 ) ) ( not ( = ?auto_632164 ?auto_632170 ) ) ( not ( = ?auto_632164 ?auto_632171 ) ) ( not ( = ?auto_632164 ?auto_632173 ) ) ( not ( = ?auto_632164 ?auto_632178 ) ) ( not ( = ?auto_632166 ?auto_632165 ) ) ( not ( = ?auto_632166 ?auto_632167 ) ) ( not ( = ?auto_632166 ?auto_632168 ) ) ( not ( = ?auto_632166 ?auto_632169 ) ) ( not ( = ?auto_632166 ?auto_632170 ) ) ( not ( = ?auto_632166 ?auto_632171 ) ) ( not ( = ?auto_632166 ?auto_632173 ) ) ( not ( = ?auto_632166 ?auto_632178 ) ) ( not ( = ?auto_632165 ?auto_632167 ) ) ( not ( = ?auto_632165 ?auto_632168 ) ) ( not ( = ?auto_632165 ?auto_632169 ) ) ( not ( = ?auto_632165 ?auto_632170 ) ) ( not ( = ?auto_632165 ?auto_632171 ) ) ( not ( = ?auto_632165 ?auto_632173 ) ) ( not ( = ?auto_632165 ?auto_632178 ) ) ( not ( = ?auto_632167 ?auto_632168 ) ) ( not ( = ?auto_632167 ?auto_632169 ) ) ( not ( = ?auto_632167 ?auto_632170 ) ) ( not ( = ?auto_632167 ?auto_632171 ) ) ( not ( = ?auto_632167 ?auto_632173 ) ) ( not ( = ?auto_632167 ?auto_632178 ) ) ( not ( = ?auto_632168 ?auto_632169 ) ) ( not ( = ?auto_632168 ?auto_632170 ) ) ( not ( = ?auto_632168 ?auto_632171 ) ) ( not ( = ?auto_632168 ?auto_632173 ) ) ( not ( = ?auto_632168 ?auto_632178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632169 ?auto_632170 ?auto_632171 )
      ( MAKE-9CRATE-VERIFY ?auto_632162 ?auto_632163 ?auto_632164 ?auto_632166 ?auto_632165 ?auto_632167 ?auto_632168 ?auto_632169 ?auto_632170 ?auto_632171 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_632179 - SURFACE
      ?auto_632180 - SURFACE
      ?auto_632181 - SURFACE
      ?auto_632183 - SURFACE
      ?auto_632182 - SURFACE
      ?auto_632184 - SURFACE
      ?auto_632185 - SURFACE
      ?auto_632186 - SURFACE
      ?auto_632187 - SURFACE
      ?auto_632188 - SURFACE
      ?auto_632189 - SURFACE
    )
    :vars
    (
      ?auto_632193 - HOIST
      ?auto_632194 - PLACE
      ?auto_632192 - PLACE
      ?auto_632195 - HOIST
      ?auto_632191 - SURFACE
      ?auto_632196 - SURFACE
      ?auto_632190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632193 ?auto_632194 ) ( IS-CRATE ?auto_632189 ) ( not ( = ?auto_632188 ?auto_632189 ) ) ( not ( = ?auto_632187 ?auto_632188 ) ) ( not ( = ?auto_632187 ?auto_632189 ) ) ( not ( = ?auto_632192 ?auto_632194 ) ) ( HOIST-AT ?auto_632195 ?auto_632192 ) ( not ( = ?auto_632193 ?auto_632195 ) ) ( SURFACE-AT ?auto_632189 ?auto_632192 ) ( ON ?auto_632189 ?auto_632191 ) ( CLEAR ?auto_632189 ) ( not ( = ?auto_632188 ?auto_632191 ) ) ( not ( = ?auto_632189 ?auto_632191 ) ) ( not ( = ?auto_632187 ?auto_632191 ) ) ( SURFACE-AT ?auto_632187 ?auto_632194 ) ( CLEAR ?auto_632187 ) ( IS-CRATE ?auto_632188 ) ( AVAILABLE ?auto_632193 ) ( AVAILABLE ?auto_632195 ) ( SURFACE-AT ?auto_632188 ?auto_632192 ) ( ON ?auto_632188 ?auto_632196 ) ( CLEAR ?auto_632188 ) ( not ( = ?auto_632188 ?auto_632196 ) ) ( not ( = ?auto_632189 ?auto_632196 ) ) ( not ( = ?auto_632187 ?auto_632196 ) ) ( not ( = ?auto_632191 ?auto_632196 ) ) ( TRUCK-AT ?auto_632190 ?auto_632194 ) ( ON ?auto_632180 ?auto_632179 ) ( ON ?auto_632181 ?auto_632180 ) ( ON ?auto_632183 ?auto_632181 ) ( ON ?auto_632182 ?auto_632183 ) ( ON ?auto_632184 ?auto_632182 ) ( ON ?auto_632185 ?auto_632184 ) ( ON ?auto_632186 ?auto_632185 ) ( ON ?auto_632187 ?auto_632186 ) ( not ( = ?auto_632179 ?auto_632180 ) ) ( not ( = ?auto_632179 ?auto_632181 ) ) ( not ( = ?auto_632179 ?auto_632183 ) ) ( not ( = ?auto_632179 ?auto_632182 ) ) ( not ( = ?auto_632179 ?auto_632184 ) ) ( not ( = ?auto_632179 ?auto_632185 ) ) ( not ( = ?auto_632179 ?auto_632186 ) ) ( not ( = ?auto_632179 ?auto_632187 ) ) ( not ( = ?auto_632179 ?auto_632188 ) ) ( not ( = ?auto_632179 ?auto_632189 ) ) ( not ( = ?auto_632179 ?auto_632191 ) ) ( not ( = ?auto_632179 ?auto_632196 ) ) ( not ( = ?auto_632180 ?auto_632181 ) ) ( not ( = ?auto_632180 ?auto_632183 ) ) ( not ( = ?auto_632180 ?auto_632182 ) ) ( not ( = ?auto_632180 ?auto_632184 ) ) ( not ( = ?auto_632180 ?auto_632185 ) ) ( not ( = ?auto_632180 ?auto_632186 ) ) ( not ( = ?auto_632180 ?auto_632187 ) ) ( not ( = ?auto_632180 ?auto_632188 ) ) ( not ( = ?auto_632180 ?auto_632189 ) ) ( not ( = ?auto_632180 ?auto_632191 ) ) ( not ( = ?auto_632180 ?auto_632196 ) ) ( not ( = ?auto_632181 ?auto_632183 ) ) ( not ( = ?auto_632181 ?auto_632182 ) ) ( not ( = ?auto_632181 ?auto_632184 ) ) ( not ( = ?auto_632181 ?auto_632185 ) ) ( not ( = ?auto_632181 ?auto_632186 ) ) ( not ( = ?auto_632181 ?auto_632187 ) ) ( not ( = ?auto_632181 ?auto_632188 ) ) ( not ( = ?auto_632181 ?auto_632189 ) ) ( not ( = ?auto_632181 ?auto_632191 ) ) ( not ( = ?auto_632181 ?auto_632196 ) ) ( not ( = ?auto_632183 ?auto_632182 ) ) ( not ( = ?auto_632183 ?auto_632184 ) ) ( not ( = ?auto_632183 ?auto_632185 ) ) ( not ( = ?auto_632183 ?auto_632186 ) ) ( not ( = ?auto_632183 ?auto_632187 ) ) ( not ( = ?auto_632183 ?auto_632188 ) ) ( not ( = ?auto_632183 ?auto_632189 ) ) ( not ( = ?auto_632183 ?auto_632191 ) ) ( not ( = ?auto_632183 ?auto_632196 ) ) ( not ( = ?auto_632182 ?auto_632184 ) ) ( not ( = ?auto_632182 ?auto_632185 ) ) ( not ( = ?auto_632182 ?auto_632186 ) ) ( not ( = ?auto_632182 ?auto_632187 ) ) ( not ( = ?auto_632182 ?auto_632188 ) ) ( not ( = ?auto_632182 ?auto_632189 ) ) ( not ( = ?auto_632182 ?auto_632191 ) ) ( not ( = ?auto_632182 ?auto_632196 ) ) ( not ( = ?auto_632184 ?auto_632185 ) ) ( not ( = ?auto_632184 ?auto_632186 ) ) ( not ( = ?auto_632184 ?auto_632187 ) ) ( not ( = ?auto_632184 ?auto_632188 ) ) ( not ( = ?auto_632184 ?auto_632189 ) ) ( not ( = ?auto_632184 ?auto_632191 ) ) ( not ( = ?auto_632184 ?auto_632196 ) ) ( not ( = ?auto_632185 ?auto_632186 ) ) ( not ( = ?auto_632185 ?auto_632187 ) ) ( not ( = ?auto_632185 ?auto_632188 ) ) ( not ( = ?auto_632185 ?auto_632189 ) ) ( not ( = ?auto_632185 ?auto_632191 ) ) ( not ( = ?auto_632185 ?auto_632196 ) ) ( not ( = ?auto_632186 ?auto_632187 ) ) ( not ( = ?auto_632186 ?auto_632188 ) ) ( not ( = ?auto_632186 ?auto_632189 ) ) ( not ( = ?auto_632186 ?auto_632191 ) ) ( not ( = ?auto_632186 ?auto_632196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632187 ?auto_632188 ?auto_632189 )
      ( MAKE-10CRATE-VERIFY ?auto_632179 ?auto_632180 ?auto_632181 ?auto_632183 ?auto_632182 ?auto_632184 ?auto_632185 ?auto_632186 ?auto_632187 ?auto_632188 ?auto_632189 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_632197 - SURFACE
      ?auto_632198 - SURFACE
      ?auto_632199 - SURFACE
      ?auto_632201 - SURFACE
      ?auto_632200 - SURFACE
      ?auto_632202 - SURFACE
      ?auto_632203 - SURFACE
      ?auto_632204 - SURFACE
      ?auto_632205 - SURFACE
      ?auto_632206 - SURFACE
      ?auto_632207 - SURFACE
      ?auto_632208 - SURFACE
    )
    :vars
    (
      ?auto_632212 - HOIST
      ?auto_632213 - PLACE
      ?auto_632211 - PLACE
      ?auto_632214 - HOIST
      ?auto_632210 - SURFACE
      ?auto_632215 - SURFACE
      ?auto_632209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632212 ?auto_632213 ) ( IS-CRATE ?auto_632208 ) ( not ( = ?auto_632207 ?auto_632208 ) ) ( not ( = ?auto_632206 ?auto_632207 ) ) ( not ( = ?auto_632206 ?auto_632208 ) ) ( not ( = ?auto_632211 ?auto_632213 ) ) ( HOIST-AT ?auto_632214 ?auto_632211 ) ( not ( = ?auto_632212 ?auto_632214 ) ) ( SURFACE-AT ?auto_632208 ?auto_632211 ) ( ON ?auto_632208 ?auto_632210 ) ( CLEAR ?auto_632208 ) ( not ( = ?auto_632207 ?auto_632210 ) ) ( not ( = ?auto_632208 ?auto_632210 ) ) ( not ( = ?auto_632206 ?auto_632210 ) ) ( SURFACE-AT ?auto_632206 ?auto_632213 ) ( CLEAR ?auto_632206 ) ( IS-CRATE ?auto_632207 ) ( AVAILABLE ?auto_632212 ) ( AVAILABLE ?auto_632214 ) ( SURFACE-AT ?auto_632207 ?auto_632211 ) ( ON ?auto_632207 ?auto_632215 ) ( CLEAR ?auto_632207 ) ( not ( = ?auto_632207 ?auto_632215 ) ) ( not ( = ?auto_632208 ?auto_632215 ) ) ( not ( = ?auto_632206 ?auto_632215 ) ) ( not ( = ?auto_632210 ?auto_632215 ) ) ( TRUCK-AT ?auto_632209 ?auto_632213 ) ( ON ?auto_632198 ?auto_632197 ) ( ON ?auto_632199 ?auto_632198 ) ( ON ?auto_632201 ?auto_632199 ) ( ON ?auto_632200 ?auto_632201 ) ( ON ?auto_632202 ?auto_632200 ) ( ON ?auto_632203 ?auto_632202 ) ( ON ?auto_632204 ?auto_632203 ) ( ON ?auto_632205 ?auto_632204 ) ( ON ?auto_632206 ?auto_632205 ) ( not ( = ?auto_632197 ?auto_632198 ) ) ( not ( = ?auto_632197 ?auto_632199 ) ) ( not ( = ?auto_632197 ?auto_632201 ) ) ( not ( = ?auto_632197 ?auto_632200 ) ) ( not ( = ?auto_632197 ?auto_632202 ) ) ( not ( = ?auto_632197 ?auto_632203 ) ) ( not ( = ?auto_632197 ?auto_632204 ) ) ( not ( = ?auto_632197 ?auto_632205 ) ) ( not ( = ?auto_632197 ?auto_632206 ) ) ( not ( = ?auto_632197 ?auto_632207 ) ) ( not ( = ?auto_632197 ?auto_632208 ) ) ( not ( = ?auto_632197 ?auto_632210 ) ) ( not ( = ?auto_632197 ?auto_632215 ) ) ( not ( = ?auto_632198 ?auto_632199 ) ) ( not ( = ?auto_632198 ?auto_632201 ) ) ( not ( = ?auto_632198 ?auto_632200 ) ) ( not ( = ?auto_632198 ?auto_632202 ) ) ( not ( = ?auto_632198 ?auto_632203 ) ) ( not ( = ?auto_632198 ?auto_632204 ) ) ( not ( = ?auto_632198 ?auto_632205 ) ) ( not ( = ?auto_632198 ?auto_632206 ) ) ( not ( = ?auto_632198 ?auto_632207 ) ) ( not ( = ?auto_632198 ?auto_632208 ) ) ( not ( = ?auto_632198 ?auto_632210 ) ) ( not ( = ?auto_632198 ?auto_632215 ) ) ( not ( = ?auto_632199 ?auto_632201 ) ) ( not ( = ?auto_632199 ?auto_632200 ) ) ( not ( = ?auto_632199 ?auto_632202 ) ) ( not ( = ?auto_632199 ?auto_632203 ) ) ( not ( = ?auto_632199 ?auto_632204 ) ) ( not ( = ?auto_632199 ?auto_632205 ) ) ( not ( = ?auto_632199 ?auto_632206 ) ) ( not ( = ?auto_632199 ?auto_632207 ) ) ( not ( = ?auto_632199 ?auto_632208 ) ) ( not ( = ?auto_632199 ?auto_632210 ) ) ( not ( = ?auto_632199 ?auto_632215 ) ) ( not ( = ?auto_632201 ?auto_632200 ) ) ( not ( = ?auto_632201 ?auto_632202 ) ) ( not ( = ?auto_632201 ?auto_632203 ) ) ( not ( = ?auto_632201 ?auto_632204 ) ) ( not ( = ?auto_632201 ?auto_632205 ) ) ( not ( = ?auto_632201 ?auto_632206 ) ) ( not ( = ?auto_632201 ?auto_632207 ) ) ( not ( = ?auto_632201 ?auto_632208 ) ) ( not ( = ?auto_632201 ?auto_632210 ) ) ( not ( = ?auto_632201 ?auto_632215 ) ) ( not ( = ?auto_632200 ?auto_632202 ) ) ( not ( = ?auto_632200 ?auto_632203 ) ) ( not ( = ?auto_632200 ?auto_632204 ) ) ( not ( = ?auto_632200 ?auto_632205 ) ) ( not ( = ?auto_632200 ?auto_632206 ) ) ( not ( = ?auto_632200 ?auto_632207 ) ) ( not ( = ?auto_632200 ?auto_632208 ) ) ( not ( = ?auto_632200 ?auto_632210 ) ) ( not ( = ?auto_632200 ?auto_632215 ) ) ( not ( = ?auto_632202 ?auto_632203 ) ) ( not ( = ?auto_632202 ?auto_632204 ) ) ( not ( = ?auto_632202 ?auto_632205 ) ) ( not ( = ?auto_632202 ?auto_632206 ) ) ( not ( = ?auto_632202 ?auto_632207 ) ) ( not ( = ?auto_632202 ?auto_632208 ) ) ( not ( = ?auto_632202 ?auto_632210 ) ) ( not ( = ?auto_632202 ?auto_632215 ) ) ( not ( = ?auto_632203 ?auto_632204 ) ) ( not ( = ?auto_632203 ?auto_632205 ) ) ( not ( = ?auto_632203 ?auto_632206 ) ) ( not ( = ?auto_632203 ?auto_632207 ) ) ( not ( = ?auto_632203 ?auto_632208 ) ) ( not ( = ?auto_632203 ?auto_632210 ) ) ( not ( = ?auto_632203 ?auto_632215 ) ) ( not ( = ?auto_632204 ?auto_632205 ) ) ( not ( = ?auto_632204 ?auto_632206 ) ) ( not ( = ?auto_632204 ?auto_632207 ) ) ( not ( = ?auto_632204 ?auto_632208 ) ) ( not ( = ?auto_632204 ?auto_632210 ) ) ( not ( = ?auto_632204 ?auto_632215 ) ) ( not ( = ?auto_632205 ?auto_632206 ) ) ( not ( = ?auto_632205 ?auto_632207 ) ) ( not ( = ?auto_632205 ?auto_632208 ) ) ( not ( = ?auto_632205 ?auto_632210 ) ) ( not ( = ?auto_632205 ?auto_632215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632206 ?auto_632207 ?auto_632208 )
      ( MAKE-11CRATE-VERIFY ?auto_632197 ?auto_632198 ?auto_632199 ?auto_632201 ?auto_632200 ?auto_632202 ?auto_632203 ?auto_632204 ?auto_632205 ?auto_632206 ?auto_632207 ?auto_632208 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_632216 - SURFACE
      ?auto_632217 - SURFACE
      ?auto_632218 - SURFACE
      ?auto_632220 - SURFACE
      ?auto_632219 - SURFACE
      ?auto_632221 - SURFACE
      ?auto_632222 - SURFACE
      ?auto_632223 - SURFACE
      ?auto_632224 - SURFACE
      ?auto_632225 - SURFACE
      ?auto_632226 - SURFACE
      ?auto_632227 - SURFACE
      ?auto_632228 - SURFACE
    )
    :vars
    (
      ?auto_632232 - HOIST
      ?auto_632233 - PLACE
      ?auto_632231 - PLACE
      ?auto_632234 - HOIST
      ?auto_632230 - SURFACE
      ?auto_632235 - SURFACE
      ?auto_632229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632232 ?auto_632233 ) ( IS-CRATE ?auto_632228 ) ( not ( = ?auto_632227 ?auto_632228 ) ) ( not ( = ?auto_632226 ?auto_632227 ) ) ( not ( = ?auto_632226 ?auto_632228 ) ) ( not ( = ?auto_632231 ?auto_632233 ) ) ( HOIST-AT ?auto_632234 ?auto_632231 ) ( not ( = ?auto_632232 ?auto_632234 ) ) ( SURFACE-AT ?auto_632228 ?auto_632231 ) ( ON ?auto_632228 ?auto_632230 ) ( CLEAR ?auto_632228 ) ( not ( = ?auto_632227 ?auto_632230 ) ) ( not ( = ?auto_632228 ?auto_632230 ) ) ( not ( = ?auto_632226 ?auto_632230 ) ) ( SURFACE-AT ?auto_632226 ?auto_632233 ) ( CLEAR ?auto_632226 ) ( IS-CRATE ?auto_632227 ) ( AVAILABLE ?auto_632232 ) ( AVAILABLE ?auto_632234 ) ( SURFACE-AT ?auto_632227 ?auto_632231 ) ( ON ?auto_632227 ?auto_632235 ) ( CLEAR ?auto_632227 ) ( not ( = ?auto_632227 ?auto_632235 ) ) ( not ( = ?auto_632228 ?auto_632235 ) ) ( not ( = ?auto_632226 ?auto_632235 ) ) ( not ( = ?auto_632230 ?auto_632235 ) ) ( TRUCK-AT ?auto_632229 ?auto_632233 ) ( ON ?auto_632217 ?auto_632216 ) ( ON ?auto_632218 ?auto_632217 ) ( ON ?auto_632220 ?auto_632218 ) ( ON ?auto_632219 ?auto_632220 ) ( ON ?auto_632221 ?auto_632219 ) ( ON ?auto_632222 ?auto_632221 ) ( ON ?auto_632223 ?auto_632222 ) ( ON ?auto_632224 ?auto_632223 ) ( ON ?auto_632225 ?auto_632224 ) ( ON ?auto_632226 ?auto_632225 ) ( not ( = ?auto_632216 ?auto_632217 ) ) ( not ( = ?auto_632216 ?auto_632218 ) ) ( not ( = ?auto_632216 ?auto_632220 ) ) ( not ( = ?auto_632216 ?auto_632219 ) ) ( not ( = ?auto_632216 ?auto_632221 ) ) ( not ( = ?auto_632216 ?auto_632222 ) ) ( not ( = ?auto_632216 ?auto_632223 ) ) ( not ( = ?auto_632216 ?auto_632224 ) ) ( not ( = ?auto_632216 ?auto_632225 ) ) ( not ( = ?auto_632216 ?auto_632226 ) ) ( not ( = ?auto_632216 ?auto_632227 ) ) ( not ( = ?auto_632216 ?auto_632228 ) ) ( not ( = ?auto_632216 ?auto_632230 ) ) ( not ( = ?auto_632216 ?auto_632235 ) ) ( not ( = ?auto_632217 ?auto_632218 ) ) ( not ( = ?auto_632217 ?auto_632220 ) ) ( not ( = ?auto_632217 ?auto_632219 ) ) ( not ( = ?auto_632217 ?auto_632221 ) ) ( not ( = ?auto_632217 ?auto_632222 ) ) ( not ( = ?auto_632217 ?auto_632223 ) ) ( not ( = ?auto_632217 ?auto_632224 ) ) ( not ( = ?auto_632217 ?auto_632225 ) ) ( not ( = ?auto_632217 ?auto_632226 ) ) ( not ( = ?auto_632217 ?auto_632227 ) ) ( not ( = ?auto_632217 ?auto_632228 ) ) ( not ( = ?auto_632217 ?auto_632230 ) ) ( not ( = ?auto_632217 ?auto_632235 ) ) ( not ( = ?auto_632218 ?auto_632220 ) ) ( not ( = ?auto_632218 ?auto_632219 ) ) ( not ( = ?auto_632218 ?auto_632221 ) ) ( not ( = ?auto_632218 ?auto_632222 ) ) ( not ( = ?auto_632218 ?auto_632223 ) ) ( not ( = ?auto_632218 ?auto_632224 ) ) ( not ( = ?auto_632218 ?auto_632225 ) ) ( not ( = ?auto_632218 ?auto_632226 ) ) ( not ( = ?auto_632218 ?auto_632227 ) ) ( not ( = ?auto_632218 ?auto_632228 ) ) ( not ( = ?auto_632218 ?auto_632230 ) ) ( not ( = ?auto_632218 ?auto_632235 ) ) ( not ( = ?auto_632220 ?auto_632219 ) ) ( not ( = ?auto_632220 ?auto_632221 ) ) ( not ( = ?auto_632220 ?auto_632222 ) ) ( not ( = ?auto_632220 ?auto_632223 ) ) ( not ( = ?auto_632220 ?auto_632224 ) ) ( not ( = ?auto_632220 ?auto_632225 ) ) ( not ( = ?auto_632220 ?auto_632226 ) ) ( not ( = ?auto_632220 ?auto_632227 ) ) ( not ( = ?auto_632220 ?auto_632228 ) ) ( not ( = ?auto_632220 ?auto_632230 ) ) ( not ( = ?auto_632220 ?auto_632235 ) ) ( not ( = ?auto_632219 ?auto_632221 ) ) ( not ( = ?auto_632219 ?auto_632222 ) ) ( not ( = ?auto_632219 ?auto_632223 ) ) ( not ( = ?auto_632219 ?auto_632224 ) ) ( not ( = ?auto_632219 ?auto_632225 ) ) ( not ( = ?auto_632219 ?auto_632226 ) ) ( not ( = ?auto_632219 ?auto_632227 ) ) ( not ( = ?auto_632219 ?auto_632228 ) ) ( not ( = ?auto_632219 ?auto_632230 ) ) ( not ( = ?auto_632219 ?auto_632235 ) ) ( not ( = ?auto_632221 ?auto_632222 ) ) ( not ( = ?auto_632221 ?auto_632223 ) ) ( not ( = ?auto_632221 ?auto_632224 ) ) ( not ( = ?auto_632221 ?auto_632225 ) ) ( not ( = ?auto_632221 ?auto_632226 ) ) ( not ( = ?auto_632221 ?auto_632227 ) ) ( not ( = ?auto_632221 ?auto_632228 ) ) ( not ( = ?auto_632221 ?auto_632230 ) ) ( not ( = ?auto_632221 ?auto_632235 ) ) ( not ( = ?auto_632222 ?auto_632223 ) ) ( not ( = ?auto_632222 ?auto_632224 ) ) ( not ( = ?auto_632222 ?auto_632225 ) ) ( not ( = ?auto_632222 ?auto_632226 ) ) ( not ( = ?auto_632222 ?auto_632227 ) ) ( not ( = ?auto_632222 ?auto_632228 ) ) ( not ( = ?auto_632222 ?auto_632230 ) ) ( not ( = ?auto_632222 ?auto_632235 ) ) ( not ( = ?auto_632223 ?auto_632224 ) ) ( not ( = ?auto_632223 ?auto_632225 ) ) ( not ( = ?auto_632223 ?auto_632226 ) ) ( not ( = ?auto_632223 ?auto_632227 ) ) ( not ( = ?auto_632223 ?auto_632228 ) ) ( not ( = ?auto_632223 ?auto_632230 ) ) ( not ( = ?auto_632223 ?auto_632235 ) ) ( not ( = ?auto_632224 ?auto_632225 ) ) ( not ( = ?auto_632224 ?auto_632226 ) ) ( not ( = ?auto_632224 ?auto_632227 ) ) ( not ( = ?auto_632224 ?auto_632228 ) ) ( not ( = ?auto_632224 ?auto_632230 ) ) ( not ( = ?auto_632224 ?auto_632235 ) ) ( not ( = ?auto_632225 ?auto_632226 ) ) ( not ( = ?auto_632225 ?auto_632227 ) ) ( not ( = ?auto_632225 ?auto_632228 ) ) ( not ( = ?auto_632225 ?auto_632230 ) ) ( not ( = ?auto_632225 ?auto_632235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632226 ?auto_632227 ?auto_632228 )
      ( MAKE-12CRATE-VERIFY ?auto_632216 ?auto_632217 ?auto_632218 ?auto_632220 ?auto_632219 ?auto_632221 ?auto_632222 ?auto_632223 ?auto_632224 ?auto_632225 ?auto_632226 ?auto_632227 ?auto_632228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_632236 - SURFACE
      ?auto_632237 - SURFACE
    )
    :vars
    (
      ?auto_632241 - HOIST
      ?auto_632242 - PLACE
      ?auto_632245 - SURFACE
      ?auto_632240 - PLACE
      ?auto_632243 - HOIST
      ?auto_632239 - SURFACE
      ?auto_632244 - SURFACE
      ?auto_632238 - TRUCK
      ?auto_632246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632241 ?auto_632242 ) ( IS-CRATE ?auto_632237 ) ( not ( = ?auto_632236 ?auto_632237 ) ) ( not ( = ?auto_632245 ?auto_632236 ) ) ( not ( = ?auto_632245 ?auto_632237 ) ) ( not ( = ?auto_632240 ?auto_632242 ) ) ( HOIST-AT ?auto_632243 ?auto_632240 ) ( not ( = ?auto_632241 ?auto_632243 ) ) ( SURFACE-AT ?auto_632237 ?auto_632240 ) ( ON ?auto_632237 ?auto_632239 ) ( CLEAR ?auto_632237 ) ( not ( = ?auto_632236 ?auto_632239 ) ) ( not ( = ?auto_632237 ?auto_632239 ) ) ( not ( = ?auto_632245 ?auto_632239 ) ) ( IS-CRATE ?auto_632236 ) ( AVAILABLE ?auto_632243 ) ( SURFACE-AT ?auto_632236 ?auto_632240 ) ( ON ?auto_632236 ?auto_632244 ) ( CLEAR ?auto_632236 ) ( not ( = ?auto_632236 ?auto_632244 ) ) ( not ( = ?auto_632237 ?auto_632244 ) ) ( not ( = ?auto_632245 ?auto_632244 ) ) ( not ( = ?auto_632239 ?auto_632244 ) ) ( TRUCK-AT ?auto_632238 ?auto_632242 ) ( SURFACE-AT ?auto_632246 ?auto_632242 ) ( CLEAR ?auto_632246 ) ( LIFTING ?auto_632241 ?auto_632245 ) ( IS-CRATE ?auto_632245 ) ( not ( = ?auto_632246 ?auto_632245 ) ) ( not ( = ?auto_632236 ?auto_632246 ) ) ( not ( = ?auto_632237 ?auto_632246 ) ) ( not ( = ?auto_632239 ?auto_632246 ) ) ( not ( = ?auto_632244 ?auto_632246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_632246 ?auto_632245 )
      ( MAKE-2CRATE ?auto_632245 ?auto_632236 ?auto_632237 )
      ( MAKE-1CRATE-VERIFY ?auto_632236 ?auto_632237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_632247 - SURFACE
      ?auto_632248 - SURFACE
      ?auto_632249 - SURFACE
    )
    :vars
    (
      ?auto_632250 - HOIST
      ?auto_632252 - PLACE
      ?auto_632251 - PLACE
      ?auto_632253 - HOIST
      ?auto_632256 - SURFACE
      ?auto_632254 - SURFACE
      ?auto_632257 - TRUCK
      ?auto_632255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_632250 ?auto_632252 ) ( IS-CRATE ?auto_632249 ) ( not ( = ?auto_632248 ?auto_632249 ) ) ( not ( = ?auto_632247 ?auto_632248 ) ) ( not ( = ?auto_632247 ?auto_632249 ) ) ( not ( = ?auto_632251 ?auto_632252 ) ) ( HOIST-AT ?auto_632253 ?auto_632251 ) ( not ( = ?auto_632250 ?auto_632253 ) ) ( SURFACE-AT ?auto_632249 ?auto_632251 ) ( ON ?auto_632249 ?auto_632256 ) ( CLEAR ?auto_632249 ) ( not ( = ?auto_632248 ?auto_632256 ) ) ( not ( = ?auto_632249 ?auto_632256 ) ) ( not ( = ?auto_632247 ?auto_632256 ) ) ( IS-CRATE ?auto_632248 ) ( AVAILABLE ?auto_632253 ) ( SURFACE-AT ?auto_632248 ?auto_632251 ) ( ON ?auto_632248 ?auto_632254 ) ( CLEAR ?auto_632248 ) ( not ( = ?auto_632248 ?auto_632254 ) ) ( not ( = ?auto_632249 ?auto_632254 ) ) ( not ( = ?auto_632247 ?auto_632254 ) ) ( not ( = ?auto_632256 ?auto_632254 ) ) ( TRUCK-AT ?auto_632257 ?auto_632252 ) ( SURFACE-AT ?auto_632255 ?auto_632252 ) ( CLEAR ?auto_632255 ) ( LIFTING ?auto_632250 ?auto_632247 ) ( IS-CRATE ?auto_632247 ) ( not ( = ?auto_632255 ?auto_632247 ) ) ( not ( = ?auto_632248 ?auto_632255 ) ) ( not ( = ?auto_632249 ?auto_632255 ) ) ( not ( = ?auto_632256 ?auto_632255 ) ) ( not ( = ?auto_632254 ?auto_632255 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_632248 ?auto_632249 )
      ( MAKE-2CRATE-VERIFY ?auto_632247 ?auto_632248 ?auto_632249 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_632258 - SURFACE
      ?auto_632259 - SURFACE
      ?auto_632260 - SURFACE
      ?auto_632261 - SURFACE
    )
    :vars
    (
      ?auto_632263 - HOIST
      ?auto_632268 - PLACE
      ?auto_632264 - PLACE
      ?auto_632267 - HOIST
      ?auto_632265 - SURFACE
      ?auto_632266 - SURFACE
      ?auto_632262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632263 ?auto_632268 ) ( IS-CRATE ?auto_632261 ) ( not ( = ?auto_632260 ?auto_632261 ) ) ( not ( = ?auto_632259 ?auto_632260 ) ) ( not ( = ?auto_632259 ?auto_632261 ) ) ( not ( = ?auto_632264 ?auto_632268 ) ) ( HOIST-AT ?auto_632267 ?auto_632264 ) ( not ( = ?auto_632263 ?auto_632267 ) ) ( SURFACE-AT ?auto_632261 ?auto_632264 ) ( ON ?auto_632261 ?auto_632265 ) ( CLEAR ?auto_632261 ) ( not ( = ?auto_632260 ?auto_632265 ) ) ( not ( = ?auto_632261 ?auto_632265 ) ) ( not ( = ?auto_632259 ?auto_632265 ) ) ( IS-CRATE ?auto_632260 ) ( AVAILABLE ?auto_632267 ) ( SURFACE-AT ?auto_632260 ?auto_632264 ) ( ON ?auto_632260 ?auto_632266 ) ( CLEAR ?auto_632260 ) ( not ( = ?auto_632260 ?auto_632266 ) ) ( not ( = ?auto_632261 ?auto_632266 ) ) ( not ( = ?auto_632259 ?auto_632266 ) ) ( not ( = ?auto_632265 ?auto_632266 ) ) ( TRUCK-AT ?auto_632262 ?auto_632268 ) ( SURFACE-AT ?auto_632258 ?auto_632268 ) ( CLEAR ?auto_632258 ) ( LIFTING ?auto_632263 ?auto_632259 ) ( IS-CRATE ?auto_632259 ) ( not ( = ?auto_632258 ?auto_632259 ) ) ( not ( = ?auto_632260 ?auto_632258 ) ) ( not ( = ?auto_632261 ?auto_632258 ) ) ( not ( = ?auto_632265 ?auto_632258 ) ) ( not ( = ?auto_632266 ?auto_632258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632259 ?auto_632260 ?auto_632261 )
      ( MAKE-3CRATE-VERIFY ?auto_632258 ?auto_632259 ?auto_632260 ?auto_632261 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_632269 - SURFACE
      ?auto_632270 - SURFACE
      ?auto_632271 - SURFACE
      ?auto_632273 - SURFACE
      ?auto_632272 - SURFACE
    )
    :vars
    (
      ?auto_632275 - HOIST
      ?auto_632280 - PLACE
      ?auto_632276 - PLACE
      ?auto_632279 - HOIST
      ?auto_632277 - SURFACE
      ?auto_632278 - SURFACE
      ?auto_632274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632275 ?auto_632280 ) ( IS-CRATE ?auto_632272 ) ( not ( = ?auto_632273 ?auto_632272 ) ) ( not ( = ?auto_632271 ?auto_632273 ) ) ( not ( = ?auto_632271 ?auto_632272 ) ) ( not ( = ?auto_632276 ?auto_632280 ) ) ( HOIST-AT ?auto_632279 ?auto_632276 ) ( not ( = ?auto_632275 ?auto_632279 ) ) ( SURFACE-AT ?auto_632272 ?auto_632276 ) ( ON ?auto_632272 ?auto_632277 ) ( CLEAR ?auto_632272 ) ( not ( = ?auto_632273 ?auto_632277 ) ) ( not ( = ?auto_632272 ?auto_632277 ) ) ( not ( = ?auto_632271 ?auto_632277 ) ) ( IS-CRATE ?auto_632273 ) ( AVAILABLE ?auto_632279 ) ( SURFACE-AT ?auto_632273 ?auto_632276 ) ( ON ?auto_632273 ?auto_632278 ) ( CLEAR ?auto_632273 ) ( not ( = ?auto_632273 ?auto_632278 ) ) ( not ( = ?auto_632272 ?auto_632278 ) ) ( not ( = ?auto_632271 ?auto_632278 ) ) ( not ( = ?auto_632277 ?auto_632278 ) ) ( TRUCK-AT ?auto_632274 ?auto_632280 ) ( SURFACE-AT ?auto_632270 ?auto_632280 ) ( CLEAR ?auto_632270 ) ( LIFTING ?auto_632275 ?auto_632271 ) ( IS-CRATE ?auto_632271 ) ( not ( = ?auto_632270 ?auto_632271 ) ) ( not ( = ?auto_632273 ?auto_632270 ) ) ( not ( = ?auto_632272 ?auto_632270 ) ) ( not ( = ?auto_632277 ?auto_632270 ) ) ( not ( = ?auto_632278 ?auto_632270 ) ) ( ON ?auto_632270 ?auto_632269 ) ( not ( = ?auto_632269 ?auto_632270 ) ) ( not ( = ?auto_632269 ?auto_632271 ) ) ( not ( = ?auto_632269 ?auto_632273 ) ) ( not ( = ?auto_632269 ?auto_632272 ) ) ( not ( = ?auto_632269 ?auto_632277 ) ) ( not ( = ?auto_632269 ?auto_632278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632271 ?auto_632273 ?auto_632272 )
      ( MAKE-4CRATE-VERIFY ?auto_632269 ?auto_632270 ?auto_632271 ?auto_632273 ?auto_632272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_632281 - SURFACE
      ?auto_632282 - SURFACE
      ?auto_632283 - SURFACE
      ?auto_632285 - SURFACE
      ?auto_632284 - SURFACE
      ?auto_632286 - SURFACE
    )
    :vars
    (
      ?auto_632288 - HOIST
      ?auto_632293 - PLACE
      ?auto_632289 - PLACE
      ?auto_632292 - HOIST
      ?auto_632290 - SURFACE
      ?auto_632291 - SURFACE
      ?auto_632287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632288 ?auto_632293 ) ( IS-CRATE ?auto_632286 ) ( not ( = ?auto_632284 ?auto_632286 ) ) ( not ( = ?auto_632285 ?auto_632284 ) ) ( not ( = ?auto_632285 ?auto_632286 ) ) ( not ( = ?auto_632289 ?auto_632293 ) ) ( HOIST-AT ?auto_632292 ?auto_632289 ) ( not ( = ?auto_632288 ?auto_632292 ) ) ( SURFACE-AT ?auto_632286 ?auto_632289 ) ( ON ?auto_632286 ?auto_632290 ) ( CLEAR ?auto_632286 ) ( not ( = ?auto_632284 ?auto_632290 ) ) ( not ( = ?auto_632286 ?auto_632290 ) ) ( not ( = ?auto_632285 ?auto_632290 ) ) ( IS-CRATE ?auto_632284 ) ( AVAILABLE ?auto_632292 ) ( SURFACE-AT ?auto_632284 ?auto_632289 ) ( ON ?auto_632284 ?auto_632291 ) ( CLEAR ?auto_632284 ) ( not ( = ?auto_632284 ?auto_632291 ) ) ( not ( = ?auto_632286 ?auto_632291 ) ) ( not ( = ?auto_632285 ?auto_632291 ) ) ( not ( = ?auto_632290 ?auto_632291 ) ) ( TRUCK-AT ?auto_632287 ?auto_632293 ) ( SURFACE-AT ?auto_632283 ?auto_632293 ) ( CLEAR ?auto_632283 ) ( LIFTING ?auto_632288 ?auto_632285 ) ( IS-CRATE ?auto_632285 ) ( not ( = ?auto_632283 ?auto_632285 ) ) ( not ( = ?auto_632284 ?auto_632283 ) ) ( not ( = ?auto_632286 ?auto_632283 ) ) ( not ( = ?auto_632290 ?auto_632283 ) ) ( not ( = ?auto_632291 ?auto_632283 ) ) ( ON ?auto_632282 ?auto_632281 ) ( ON ?auto_632283 ?auto_632282 ) ( not ( = ?auto_632281 ?auto_632282 ) ) ( not ( = ?auto_632281 ?auto_632283 ) ) ( not ( = ?auto_632281 ?auto_632285 ) ) ( not ( = ?auto_632281 ?auto_632284 ) ) ( not ( = ?auto_632281 ?auto_632286 ) ) ( not ( = ?auto_632281 ?auto_632290 ) ) ( not ( = ?auto_632281 ?auto_632291 ) ) ( not ( = ?auto_632282 ?auto_632283 ) ) ( not ( = ?auto_632282 ?auto_632285 ) ) ( not ( = ?auto_632282 ?auto_632284 ) ) ( not ( = ?auto_632282 ?auto_632286 ) ) ( not ( = ?auto_632282 ?auto_632290 ) ) ( not ( = ?auto_632282 ?auto_632291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632285 ?auto_632284 ?auto_632286 )
      ( MAKE-5CRATE-VERIFY ?auto_632281 ?auto_632282 ?auto_632283 ?auto_632285 ?auto_632284 ?auto_632286 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_632294 - SURFACE
      ?auto_632295 - SURFACE
      ?auto_632296 - SURFACE
      ?auto_632298 - SURFACE
      ?auto_632297 - SURFACE
      ?auto_632299 - SURFACE
      ?auto_632300 - SURFACE
    )
    :vars
    (
      ?auto_632302 - HOIST
      ?auto_632307 - PLACE
      ?auto_632303 - PLACE
      ?auto_632306 - HOIST
      ?auto_632304 - SURFACE
      ?auto_632305 - SURFACE
      ?auto_632301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632302 ?auto_632307 ) ( IS-CRATE ?auto_632300 ) ( not ( = ?auto_632299 ?auto_632300 ) ) ( not ( = ?auto_632297 ?auto_632299 ) ) ( not ( = ?auto_632297 ?auto_632300 ) ) ( not ( = ?auto_632303 ?auto_632307 ) ) ( HOIST-AT ?auto_632306 ?auto_632303 ) ( not ( = ?auto_632302 ?auto_632306 ) ) ( SURFACE-AT ?auto_632300 ?auto_632303 ) ( ON ?auto_632300 ?auto_632304 ) ( CLEAR ?auto_632300 ) ( not ( = ?auto_632299 ?auto_632304 ) ) ( not ( = ?auto_632300 ?auto_632304 ) ) ( not ( = ?auto_632297 ?auto_632304 ) ) ( IS-CRATE ?auto_632299 ) ( AVAILABLE ?auto_632306 ) ( SURFACE-AT ?auto_632299 ?auto_632303 ) ( ON ?auto_632299 ?auto_632305 ) ( CLEAR ?auto_632299 ) ( not ( = ?auto_632299 ?auto_632305 ) ) ( not ( = ?auto_632300 ?auto_632305 ) ) ( not ( = ?auto_632297 ?auto_632305 ) ) ( not ( = ?auto_632304 ?auto_632305 ) ) ( TRUCK-AT ?auto_632301 ?auto_632307 ) ( SURFACE-AT ?auto_632298 ?auto_632307 ) ( CLEAR ?auto_632298 ) ( LIFTING ?auto_632302 ?auto_632297 ) ( IS-CRATE ?auto_632297 ) ( not ( = ?auto_632298 ?auto_632297 ) ) ( not ( = ?auto_632299 ?auto_632298 ) ) ( not ( = ?auto_632300 ?auto_632298 ) ) ( not ( = ?auto_632304 ?auto_632298 ) ) ( not ( = ?auto_632305 ?auto_632298 ) ) ( ON ?auto_632295 ?auto_632294 ) ( ON ?auto_632296 ?auto_632295 ) ( ON ?auto_632298 ?auto_632296 ) ( not ( = ?auto_632294 ?auto_632295 ) ) ( not ( = ?auto_632294 ?auto_632296 ) ) ( not ( = ?auto_632294 ?auto_632298 ) ) ( not ( = ?auto_632294 ?auto_632297 ) ) ( not ( = ?auto_632294 ?auto_632299 ) ) ( not ( = ?auto_632294 ?auto_632300 ) ) ( not ( = ?auto_632294 ?auto_632304 ) ) ( not ( = ?auto_632294 ?auto_632305 ) ) ( not ( = ?auto_632295 ?auto_632296 ) ) ( not ( = ?auto_632295 ?auto_632298 ) ) ( not ( = ?auto_632295 ?auto_632297 ) ) ( not ( = ?auto_632295 ?auto_632299 ) ) ( not ( = ?auto_632295 ?auto_632300 ) ) ( not ( = ?auto_632295 ?auto_632304 ) ) ( not ( = ?auto_632295 ?auto_632305 ) ) ( not ( = ?auto_632296 ?auto_632298 ) ) ( not ( = ?auto_632296 ?auto_632297 ) ) ( not ( = ?auto_632296 ?auto_632299 ) ) ( not ( = ?auto_632296 ?auto_632300 ) ) ( not ( = ?auto_632296 ?auto_632304 ) ) ( not ( = ?auto_632296 ?auto_632305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632297 ?auto_632299 ?auto_632300 )
      ( MAKE-6CRATE-VERIFY ?auto_632294 ?auto_632295 ?auto_632296 ?auto_632298 ?auto_632297 ?auto_632299 ?auto_632300 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_632308 - SURFACE
      ?auto_632309 - SURFACE
      ?auto_632310 - SURFACE
      ?auto_632312 - SURFACE
      ?auto_632311 - SURFACE
      ?auto_632313 - SURFACE
      ?auto_632314 - SURFACE
      ?auto_632315 - SURFACE
    )
    :vars
    (
      ?auto_632317 - HOIST
      ?auto_632322 - PLACE
      ?auto_632318 - PLACE
      ?auto_632321 - HOIST
      ?auto_632319 - SURFACE
      ?auto_632320 - SURFACE
      ?auto_632316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632317 ?auto_632322 ) ( IS-CRATE ?auto_632315 ) ( not ( = ?auto_632314 ?auto_632315 ) ) ( not ( = ?auto_632313 ?auto_632314 ) ) ( not ( = ?auto_632313 ?auto_632315 ) ) ( not ( = ?auto_632318 ?auto_632322 ) ) ( HOIST-AT ?auto_632321 ?auto_632318 ) ( not ( = ?auto_632317 ?auto_632321 ) ) ( SURFACE-AT ?auto_632315 ?auto_632318 ) ( ON ?auto_632315 ?auto_632319 ) ( CLEAR ?auto_632315 ) ( not ( = ?auto_632314 ?auto_632319 ) ) ( not ( = ?auto_632315 ?auto_632319 ) ) ( not ( = ?auto_632313 ?auto_632319 ) ) ( IS-CRATE ?auto_632314 ) ( AVAILABLE ?auto_632321 ) ( SURFACE-AT ?auto_632314 ?auto_632318 ) ( ON ?auto_632314 ?auto_632320 ) ( CLEAR ?auto_632314 ) ( not ( = ?auto_632314 ?auto_632320 ) ) ( not ( = ?auto_632315 ?auto_632320 ) ) ( not ( = ?auto_632313 ?auto_632320 ) ) ( not ( = ?auto_632319 ?auto_632320 ) ) ( TRUCK-AT ?auto_632316 ?auto_632322 ) ( SURFACE-AT ?auto_632311 ?auto_632322 ) ( CLEAR ?auto_632311 ) ( LIFTING ?auto_632317 ?auto_632313 ) ( IS-CRATE ?auto_632313 ) ( not ( = ?auto_632311 ?auto_632313 ) ) ( not ( = ?auto_632314 ?auto_632311 ) ) ( not ( = ?auto_632315 ?auto_632311 ) ) ( not ( = ?auto_632319 ?auto_632311 ) ) ( not ( = ?auto_632320 ?auto_632311 ) ) ( ON ?auto_632309 ?auto_632308 ) ( ON ?auto_632310 ?auto_632309 ) ( ON ?auto_632312 ?auto_632310 ) ( ON ?auto_632311 ?auto_632312 ) ( not ( = ?auto_632308 ?auto_632309 ) ) ( not ( = ?auto_632308 ?auto_632310 ) ) ( not ( = ?auto_632308 ?auto_632312 ) ) ( not ( = ?auto_632308 ?auto_632311 ) ) ( not ( = ?auto_632308 ?auto_632313 ) ) ( not ( = ?auto_632308 ?auto_632314 ) ) ( not ( = ?auto_632308 ?auto_632315 ) ) ( not ( = ?auto_632308 ?auto_632319 ) ) ( not ( = ?auto_632308 ?auto_632320 ) ) ( not ( = ?auto_632309 ?auto_632310 ) ) ( not ( = ?auto_632309 ?auto_632312 ) ) ( not ( = ?auto_632309 ?auto_632311 ) ) ( not ( = ?auto_632309 ?auto_632313 ) ) ( not ( = ?auto_632309 ?auto_632314 ) ) ( not ( = ?auto_632309 ?auto_632315 ) ) ( not ( = ?auto_632309 ?auto_632319 ) ) ( not ( = ?auto_632309 ?auto_632320 ) ) ( not ( = ?auto_632310 ?auto_632312 ) ) ( not ( = ?auto_632310 ?auto_632311 ) ) ( not ( = ?auto_632310 ?auto_632313 ) ) ( not ( = ?auto_632310 ?auto_632314 ) ) ( not ( = ?auto_632310 ?auto_632315 ) ) ( not ( = ?auto_632310 ?auto_632319 ) ) ( not ( = ?auto_632310 ?auto_632320 ) ) ( not ( = ?auto_632312 ?auto_632311 ) ) ( not ( = ?auto_632312 ?auto_632313 ) ) ( not ( = ?auto_632312 ?auto_632314 ) ) ( not ( = ?auto_632312 ?auto_632315 ) ) ( not ( = ?auto_632312 ?auto_632319 ) ) ( not ( = ?auto_632312 ?auto_632320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632313 ?auto_632314 ?auto_632315 )
      ( MAKE-7CRATE-VERIFY ?auto_632308 ?auto_632309 ?auto_632310 ?auto_632312 ?auto_632311 ?auto_632313 ?auto_632314 ?auto_632315 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_632323 - SURFACE
      ?auto_632324 - SURFACE
      ?auto_632325 - SURFACE
      ?auto_632327 - SURFACE
      ?auto_632326 - SURFACE
      ?auto_632328 - SURFACE
      ?auto_632329 - SURFACE
      ?auto_632330 - SURFACE
      ?auto_632331 - SURFACE
    )
    :vars
    (
      ?auto_632333 - HOIST
      ?auto_632338 - PLACE
      ?auto_632334 - PLACE
      ?auto_632337 - HOIST
      ?auto_632335 - SURFACE
      ?auto_632336 - SURFACE
      ?auto_632332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632333 ?auto_632338 ) ( IS-CRATE ?auto_632331 ) ( not ( = ?auto_632330 ?auto_632331 ) ) ( not ( = ?auto_632329 ?auto_632330 ) ) ( not ( = ?auto_632329 ?auto_632331 ) ) ( not ( = ?auto_632334 ?auto_632338 ) ) ( HOIST-AT ?auto_632337 ?auto_632334 ) ( not ( = ?auto_632333 ?auto_632337 ) ) ( SURFACE-AT ?auto_632331 ?auto_632334 ) ( ON ?auto_632331 ?auto_632335 ) ( CLEAR ?auto_632331 ) ( not ( = ?auto_632330 ?auto_632335 ) ) ( not ( = ?auto_632331 ?auto_632335 ) ) ( not ( = ?auto_632329 ?auto_632335 ) ) ( IS-CRATE ?auto_632330 ) ( AVAILABLE ?auto_632337 ) ( SURFACE-AT ?auto_632330 ?auto_632334 ) ( ON ?auto_632330 ?auto_632336 ) ( CLEAR ?auto_632330 ) ( not ( = ?auto_632330 ?auto_632336 ) ) ( not ( = ?auto_632331 ?auto_632336 ) ) ( not ( = ?auto_632329 ?auto_632336 ) ) ( not ( = ?auto_632335 ?auto_632336 ) ) ( TRUCK-AT ?auto_632332 ?auto_632338 ) ( SURFACE-AT ?auto_632328 ?auto_632338 ) ( CLEAR ?auto_632328 ) ( LIFTING ?auto_632333 ?auto_632329 ) ( IS-CRATE ?auto_632329 ) ( not ( = ?auto_632328 ?auto_632329 ) ) ( not ( = ?auto_632330 ?auto_632328 ) ) ( not ( = ?auto_632331 ?auto_632328 ) ) ( not ( = ?auto_632335 ?auto_632328 ) ) ( not ( = ?auto_632336 ?auto_632328 ) ) ( ON ?auto_632324 ?auto_632323 ) ( ON ?auto_632325 ?auto_632324 ) ( ON ?auto_632327 ?auto_632325 ) ( ON ?auto_632326 ?auto_632327 ) ( ON ?auto_632328 ?auto_632326 ) ( not ( = ?auto_632323 ?auto_632324 ) ) ( not ( = ?auto_632323 ?auto_632325 ) ) ( not ( = ?auto_632323 ?auto_632327 ) ) ( not ( = ?auto_632323 ?auto_632326 ) ) ( not ( = ?auto_632323 ?auto_632328 ) ) ( not ( = ?auto_632323 ?auto_632329 ) ) ( not ( = ?auto_632323 ?auto_632330 ) ) ( not ( = ?auto_632323 ?auto_632331 ) ) ( not ( = ?auto_632323 ?auto_632335 ) ) ( not ( = ?auto_632323 ?auto_632336 ) ) ( not ( = ?auto_632324 ?auto_632325 ) ) ( not ( = ?auto_632324 ?auto_632327 ) ) ( not ( = ?auto_632324 ?auto_632326 ) ) ( not ( = ?auto_632324 ?auto_632328 ) ) ( not ( = ?auto_632324 ?auto_632329 ) ) ( not ( = ?auto_632324 ?auto_632330 ) ) ( not ( = ?auto_632324 ?auto_632331 ) ) ( not ( = ?auto_632324 ?auto_632335 ) ) ( not ( = ?auto_632324 ?auto_632336 ) ) ( not ( = ?auto_632325 ?auto_632327 ) ) ( not ( = ?auto_632325 ?auto_632326 ) ) ( not ( = ?auto_632325 ?auto_632328 ) ) ( not ( = ?auto_632325 ?auto_632329 ) ) ( not ( = ?auto_632325 ?auto_632330 ) ) ( not ( = ?auto_632325 ?auto_632331 ) ) ( not ( = ?auto_632325 ?auto_632335 ) ) ( not ( = ?auto_632325 ?auto_632336 ) ) ( not ( = ?auto_632327 ?auto_632326 ) ) ( not ( = ?auto_632327 ?auto_632328 ) ) ( not ( = ?auto_632327 ?auto_632329 ) ) ( not ( = ?auto_632327 ?auto_632330 ) ) ( not ( = ?auto_632327 ?auto_632331 ) ) ( not ( = ?auto_632327 ?auto_632335 ) ) ( not ( = ?auto_632327 ?auto_632336 ) ) ( not ( = ?auto_632326 ?auto_632328 ) ) ( not ( = ?auto_632326 ?auto_632329 ) ) ( not ( = ?auto_632326 ?auto_632330 ) ) ( not ( = ?auto_632326 ?auto_632331 ) ) ( not ( = ?auto_632326 ?auto_632335 ) ) ( not ( = ?auto_632326 ?auto_632336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632329 ?auto_632330 ?auto_632331 )
      ( MAKE-8CRATE-VERIFY ?auto_632323 ?auto_632324 ?auto_632325 ?auto_632327 ?auto_632326 ?auto_632328 ?auto_632329 ?auto_632330 ?auto_632331 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_632339 - SURFACE
      ?auto_632340 - SURFACE
      ?auto_632341 - SURFACE
      ?auto_632343 - SURFACE
      ?auto_632342 - SURFACE
      ?auto_632344 - SURFACE
      ?auto_632345 - SURFACE
      ?auto_632346 - SURFACE
      ?auto_632347 - SURFACE
      ?auto_632348 - SURFACE
    )
    :vars
    (
      ?auto_632350 - HOIST
      ?auto_632355 - PLACE
      ?auto_632351 - PLACE
      ?auto_632354 - HOIST
      ?auto_632352 - SURFACE
      ?auto_632353 - SURFACE
      ?auto_632349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632350 ?auto_632355 ) ( IS-CRATE ?auto_632348 ) ( not ( = ?auto_632347 ?auto_632348 ) ) ( not ( = ?auto_632346 ?auto_632347 ) ) ( not ( = ?auto_632346 ?auto_632348 ) ) ( not ( = ?auto_632351 ?auto_632355 ) ) ( HOIST-AT ?auto_632354 ?auto_632351 ) ( not ( = ?auto_632350 ?auto_632354 ) ) ( SURFACE-AT ?auto_632348 ?auto_632351 ) ( ON ?auto_632348 ?auto_632352 ) ( CLEAR ?auto_632348 ) ( not ( = ?auto_632347 ?auto_632352 ) ) ( not ( = ?auto_632348 ?auto_632352 ) ) ( not ( = ?auto_632346 ?auto_632352 ) ) ( IS-CRATE ?auto_632347 ) ( AVAILABLE ?auto_632354 ) ( SURFACE-AT ?auto_632347 ?auto_632351 ) ( ON ?auto_632347 ?auto_632353 ) ( CLEAR ?auto_632347 ) ( not ( = ?auto_632347 ?auto_632353 ) ) ( not ( = ?auto_632348 ?auto_632353 ) ) ( not ( = ?auto_632346 ?auto_632353 ) ) ( not ( = ?auto_632352 ?auto_632353 ) ) ( TRUCK-AT ?auto_632349 ?auto_632355 ) ( SURFACE-AT ?auto_632345 ?auto_632355 ) ( CLEAR ?auto_632345 ) ( LIFTING ?auto_632350 ?auto_632346 ) ( IS-CRATE ?auto_632346 ) ( not ( = ?auto_632345 ?auto_632346 ) ) ( not ( = ?auto_632347 ?auto_632345 ) ) ( not ( = ?auto_632348 ?auto_632345 ) ) ( not ( = ?auto_632352 ?auto_632345 ) ) ( not ( = ?auto_632353 ?auto_632345 ) ) ( ON ?auto_632340 ?auto_632339 ) ( ON ?auto_632341 ?auto_632340 ) ( ON ?auto_632343 ?auto_632341 ) ( ON ?auto_632342 ?auto_632343 ) ( ON ?auto_632344 ?auto_632342 ) ( ON ?auto_632345 ?auto_632344 ) ( not ( = ?auto_632339 ?auto_632340 ) ) ( not ( = ?auto_632339 ?auto_632341 ) ) ( not ( = ?auto_632339 ?auto_632343 ) ) ( not ( = ?auto_632339 ?auto_632342 ) ) ( not ( = ?auto_632339 ?auto_632344 ) ) ( not ( = ?auto_632339 ?auto_632345 ) ) ( not ( = ?auto_632339 ?auto_632346 ) ) ( not ( = ?auto_632339 ?auto_632347 ) ) ( not ( = ?auto_632339 ?auto_632348 ) ) ( not ( = ?auto_632339 ?auto_632352 ) ) ( not ( = ?auto_632339 ?auto_632353 ) ) ( not ( = ?auto_632340 ?auto_632341 ) ) ( not ( = ?auto_632340 ?auto_632343 ) ) ( not ( = ?auto_632340 ?auto_632342 ) ) ( not ( = ?auto_632340 ?auto_632344 ) ) ( not ( = ?auto_632340 ?auto_632345 ) ) ( not ( = ?auto_632340 ?auto_632346 ) ) ( not ( = ?auto_632340 ?auto_632347 ) ) ( not ( = ?auto_632340 ?auto_632348 ) ) ( not ( = ?auto_632340 ?auto_632352 ) ) ( not ( = ?auto_632340 ?auto_632353 ) ) ( not ( = ?auto_632341 ?auto_632343 ) ) ( not ( = ?auto_632341 ?auto_632342 ) ) ( not ( = ?auto_632341 ?auto_632344 ) ) ( not ( = ?auto_632341 ?auto_632345 ) ) ( not ( = ?auto_632341 ?auto_632346 ) ) ( not ( = ?auto_632341 ?auto_632347 ) ) ( not ( = ?auto_632341 ?auto_632348 ) ) ( not ( = ?auto_632341 ?auto_632352 ) ) ( not ( = ?auto_632341 ?auto_632353 ) ) ( not ( = ?auto_632343 ?auto_632342 ) ) ( not ( = ?auto_632343 ?auto_632344 ) ) ( not ( = ?auto_632343 ?auto_632345 ) ) ( not ( = ?auto_632343 ?auto_632346 ) ) ( not ( = ?auto_632343 ?auto_632347 ) ) ( not ( = ?auto_632343 ?auto_632348 ) ) ( not ( = ?auto_632343 ?auto_632352 ) ) ( not ( = ?auto_632343 ?auto_632353 ) ) ( not ( = ?auto_632342 ?auto_632344 ) ) ( not ( = ?auto_632342 ?auto_632345 ) ) ( not ( = ?auto_632342 ?auto_632346 ) ) ( not ( = ?auto_632342 ?auto_632347 ) ) ( not ( = ?auto_632342 ?auto_632348 ) ) ( not ( = ?auto_632342 ?auto_632352 ) ) ( not ( = ?auto_632342 ?auto_632353 ) ) ( not ( = ?auto_632344 ?auto_632345 ) ) ( not ( = ?auto_632344 ?auto_632346 ) ) ( not ( = ?auto_632344 ?auto_632347 ) ) ( not ( = ?auto_632344 ?auto_632348 ) ) ( not ( = ?auto_632344 ?auto_632352 ) ) ( not ( = ?auto_632344 ?auto_632353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632346 ?auto_632347 ?auto_632348 )
      ( MAKE-9CRATE-VERIFY ?auto_632339 ?auto_632340 ?auto_632341 ?auto_632343 ?auto_632342 ?auto_632344 ?auto_632345 ?auto_632346 ?auto_632347 ?auto_632348 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_632356 - SURFACE
      ?auto_632357 - SURFACE
      ?auto_632358 - SURFACE
      ?auto_632360 - SURFACE
      ?auto_632359 - SURFACE
      ?auto_632361 - SURFACE
      ?auto_632362 - SURFACE
      ?auto_632363 - SURFACE
      ?auto_632364 - SURFACE
      ?auto_632365 - SURFACE
      ?auto_632366 - SURFACE
    )
    :vars
    (
      ?auto_632368 - HOIST
      ?auto_632373 - PLACE
      ?auto_632369 - PLACE
      ?auto_632372 - HOIST
      ?auto_632370 - SURFACE
      ?auto_632371 - SURFACE
      ?auto_632367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632368 ?auto_632373 ) ( IS-CRATE ?auto_632366 ) ( not ( = ?auto_632365 ?auto_632366 ) ) ( not ( = ?auto_632364 ?auto_632365 ) ) ( not ( = ?auto_632364 ?auto_632366 ) ) ( not ( = ?auto_632369 ?auto_632373 ) ) ( HOIST-AT ?auto_632372 ?auto_632369 ) ( not ( = ?auto_632368 ?auto_632372 ) ) ( SURFACE-AT ?auto_632366 ?auto_632369 ) ( ON ?auto_632366 ?auto_632370 ) ( CLEAR ?auto_632366 ) ( not ( = ?auto_632365 ?auto_632370 ) ) ( not ( = ?auto_632366 ?auto_632370 ) ) ( not ( = ?auto_632364 ?auto_632370 ) ) ( IS-CRATE ?auto_632365 ) ( AVAILABLE ?auto_632372 ) ( SURFACE-AT ?auto_632365 ?auto_632369 ) ( ON ?auto_632365 ?auto_632371 ) ( CLEAR ?auto_632365 ) ( not ( = ?auto_632365 ?auto_632371 ) ) ( not ( = ?auto_632366 ?auto_632371 ) ) ( not ( = ?auto_632364 ?auto_632371 ) ) ( not ( = ?auto_632370 ?auto_632371 ) ) ( TRUCK-AT ?auto_632367 ?auto_632373 ) ( SURFACE-AT ?auto_632363 ?auto_632373 ) ( CLEAR ?auto_632363 ) ( LIFTING ?auto_632368 ?auto_632364 ) ( IS-CRATE ?auto_632364 ) ( not ( = ?auto_632363 ?auto_632364 ) ) ( not ( = ?auto_632365 ?auto_632363 ) ) ( not ( = ?auto_632366 ?auto_632363 ) ) ( not ( = ?auto_632370 ?auto_632363 ) ) ( not ( = ?auto_632371 ?auto_632363 ) ) ( ON ?auto_632357 ?auto_632356 ) ( ON ?auto_632358 ?auto_632357 ) ( ON ?auto_632360 ?auto_632358 ) ( ON ?auto_632359 ?auto_632360 ) ( ON ?auto_632361 ?auto_632359 ) ( ON ?auto_632362 ?auto_632361 ) ( ON ?auto_632363 ?auto_632362 ) ( not ( = ?auto_632356 ?auto_632357 ) ) ( not ( = ?auto_632356 ?auto_632358 ) ) ( not ( = ?auto_632356 ?auto_632360 ) ) ( not ( = ?auto_632356 ?auto_632359 ) ) ( not ( = ?auto_632356 ?auto_632361 ) ) ( not ( = ?auto_632356 ?auto_632362 ) ) ( not ( = ?auto_632356 ?auto_632363 ) ) ( not ( = ?auto_632356 ?auto_632364 ) ) ( not ( = ?auto_632356 ?auto_632365 ) ) ( not ( = ?auto_632356 ?auto_632366 ) ) ( not ( = ?auto_632356 ?auto_632370 ) ) ( not ( = ?auto_632356 ?auto_632371 ) ) ( not ( = ?auto_632357 ?auto_632358 ) ) ( not ( = ?auto_632357 ?auto_632360 ) ) ( not ( = ?auto_632357 ?auto_632359 ) ) ( not ( = ?auto_632357 ?auto_632361 ) ) ( not ( = ?auto_632357 ?auto_632362 ) ) ( not ( = ?auto_632357 ?auto_632363 ) ) ( not ( = ?auto_632357 ?auto_632364 ) ) ( not ( = ?auto_632357 ?auto_632365 ) ) ( not ( = ?auto_632357 ?auto_632366 ) ) ( not ( = ?auto_632357 ?auto_632370 ) ) ( not ( = ?auto_632357 ?auto_632371 ) ) ( not ( = ?auto_632358 ?auto_632360 ) ) ( not ( = ?auto_632358 ?auto_632359 ) ) ( not ( = ?auto_632358 ?auto_632361 ) ) ( not ( = ?auto_632358 ?auto_632362 ) ) ( not ( = ?auto_632358 ?auto_632363 ) ) ( not ( = ?auto_632358 ?auto_632364 ) ) ( not ( = ?auto_632358 ?auto_632365 ) ) ( not ( = ?auto_632358 ?auto_632366 ) ) ( not ( = ?auto_632358 ?auto_632370 ) ) ( not ( = ?auto_632358 ?auto_632371 ) ) ( not ( = ?auto_632360 ?auto_632359 ) ) ( not ( = ?auto_632360 ?auto_632361 ) ) ( not ( = ?auto_632360 ?auto_632362 ) ) ( not ( = ?auto_632360 ?auto_632363 ) ) ( not ( = ?auto_632360 ?auto_632364 ) ) ( not ( = ?auto_632360 ?auto_632365 ) ) ( not ( = ?auto_632360 ?auto_632366 ) ) ( not ( = ?auto_632360 ?auto_632370 ) ) ( not ( = ?auto_632360 ?auto_632371 ) ) ( not ( = ?auto_632359 ?auto_632361 ) ) ( not ( = ?auto_632359 ?auto_632362 ) ) ( not ( = ?auto_632359 ?auto_632363 ) ) ( not ( = ?auto_632359 ?auto_632364 ) ) ( not ( = ?auto_632359 ?auto_632365 ) ) ( not ( = ?auto_632359 ?auto_632366 ) ) ( not ( = ?auto_632359 ?auto_632370 ) ) ( not ( = ?auto_632359 ?auto_632371 ) ) ( not ( = ?auto_632361 ?auto_632362 ) ) ( not ( = ?auto_632361 ?auto_632363 ) ) ( not ( = ?auto_632361 ?auto_632364 ) ) ( not ( = ?auto_632361 ?auto_632365 ) ) ( not ( = ?auto_632361 ?auto_632366 ) ) ( not ( = ?auto_632361 ?auto_632370 ) ) ( not ( = ?auto_632361 ?auto_632371 ) ) ( not ( = ?auto_632362 ?auto_632363 ) ) ( not ( = ?auto_632362 ?auto_632364 ) ) ( not ( = ?auto_632362 ?auto_632365 ) ) ( not ( = ?auto_632362 ?auto_632366 ) ) ( not ( = ?auto_632362 ?auto_632370 ) ) ( not ( = ?auto_632362 ?auto_632371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632364 ?auto_632365 ?auto_632366 )
      ( MAKE-10CRATE-VERIFY ?auto_632356 ?auto_632357 ?auto_632358 ?auto_632360 ?auto_632359 ?auto_632361 ?auto_632362 ?auto_632363 ?auto_632364 ?auto_632365 ?auto_632366 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_632374 - SURFACE
      ?auto_632375 - SURFACE
      ?auto_632376 - SURFACE
      ?auto_632378 - SURFACE
      ?auto_632377 - SURFACE
      ?auto_632379 - SURFACE
      ?auto_632380 - SURFACE
      ?auto_632381 - SURFACE
      ?auto_632382 - SURFACE
      ?auto_632383 - SURFACE
      ?auto_632384 - SURFACE
      ?auto_632385 - SURFACE
    )
    :vars
    (
      ?auto_632387 - HOIST
      ?auto_632392 - PLACE
      ?auto_632388 - PLACE
      ?auto_632391 - HOIST
      ?auto_632389 - SURFACE
      ?auto_632390 - SURFACE
      ?auto_632386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632387 ?auto_632392 ) ( IS-CRATE ?auto_632385 ) ( not ( = ?auto_632384 ?auto_632385 ) ) ( not ( = ?auto_632383 ?auto_632384 ) ) ( not ( = ?auto_632383 ?auto_632385 ) ) ( not ( = ?auto_632388 ?auto_632392 ) ) ( HOIST-AT ?auto_632391 ?auto_632388 ) ( not ( = ?auto_632387 ?auto_632391 ) ) ( SURFACE-AT ?auto_632385 ?auto_632388 ) ( ON ?auto_632385 ?auto_632389 ) ( CLEAR ?auto_632385 ) ( not ( = ?auto_632384 ?auto_632389 ) ) ( not ( = ?auto_632385 ?auto_632389 ) ) ( not ( = ?auto_632383 ?auto_632389 ) ) ( IS-CRATE ?auto_632384 ) ( AVAILABLE ?auto_632391 ) ( SURFACE-AT ?auto_632384 ?auto_632388 ) ( ON ?auto_632384 ?auto_632390 ) ( CLEAR ?auto_632384 ) ( not ( = ?auto_632384 ?auto_632390 ) ) ( not ( = ?auto_632385 ?auto_632390 ) ) ( not ( = ?auto_632383 ?auto_632390 ) ) ( not ( = ?auto_632389 ?auto_632390 ) ) ( TRUCK-AT ?auto_632386 ?auto_632392 ) ( SURFACE-AT ?auto_632382 ?auto_632392 ) ( CLEAR ?auto_632382 ) ( LIFTING ?auto_632387 ?auto_632383 ) ( IS-CRATE ?auto_632383 ) ( not ( = ?auto_632382 ?auto_632383 ) ) ( not ( = ?auto_632384 ?auto_632382 ) ) ( not ( = ?auto_632385 ?auto_632382 ) ) ( not ( = ?auto_632389 ?auto_632382 ) ) ( not ( = ?auto_632390 ?auto_632382 ) ) ( ON ?auto_632375 ?auto_632374 ) ( ON ?auto_632376 ?auto_632375 ) ( ON ?auto_632378 ?auto_632376 ) ( ON ?auto_632377 ?auto_632378 ) ( ON ?auto_632379 ?auto_632377 ) ( ON ?auto_632380 ?auto_632379 ) ( ON ?auto_632381 ?auto_632380 ) ( ON ?auto_632382 ?auto_632381 ) ( not ( = ?auto_632374 ?auto_632375 ) ) ( not ( = ?auto_632374 ?auto_632376 ) ) ( not ( = ?auto_632374 ?auto_632378 ) ) ( not ( = ?auto_632374 ?auto_632377 ) ) ( not ( = ?auto_632374 ?auto_632379 ) ) ( not ( = ?auto_632374 ?auto_632380 ) ) ( not ( = ?auto_632374 ?auto_632381 ) ) ( not ( = ?auto_632374 ?auto_632382 ) ) ( not ( = ?auto_632374 ?auto_632383 ) ) ( not ( = ?auto_632374 ?auto_632384 ) ) ( not ( = ?auto_632374 ?auto_632385 ) ) ( not ( = ?auto_632374 ?auto_632389 ) ) ( not ( = ?auto_632374 ?auto_632390 ) ) ( not ( = ?auto_632375 ?auto_632376 ) ) ( not ( = ?auto_632375 ?auto_632378 ) ) ( not ( = ?auto_632375 ?auto_632377 ) ) ( not ( = ?auto_632375 ?auto_632379 ) ) ( not ( = ?auto_632375 ?auto_632380 ) ) ( not ( = ?auto_632375 ?auto_632381 ) ) ( not ( = ?auto_632375 ?auto_632382 ) ) ( not ( = ?auto_632375 ?auto_632383 ) ) ( not ( = ?auto_632375 ?auto_632384 ) ) ( not ( = ?auto_632375 ?auto_632385 ) ) ( not ( = ?auto_632375 ?auto_632389 ) ) ( not ( = ?auto_632375 ?auto_632390 ) ) ( not ( = ?auto_632376 ?auto_632378 ) ) ( not ( = ?auto_632376 ?auto_632377 ) ) ( not ( = ?auto_632376 ?auto_632379 ) ) ( not ( = ?auto_632376 ?auto_632380 ) ) ( not ( = ?auto_632376 ?auto_632381 ) ) ( not ( = ?auto_632376 ?auto_632382 ) ) ( not ( = ?auto_632376 ?auto_632383 ) ) ( not ( = ?auto_632376 ?auto_632384 ) ) ( not ( = ?auto_632376 ?auto_632385 ) ) ( not ( = ?auto_632376 ?auto_632389 ) ) ( not ( = ?auto_632376 ?auto_632390 ) ) ( not ( = ?auto_632378 ?auto_632377 ) ) ( not ( = ?auto_632378 ?auto_632379 ) ) ( not ( = ?auto_632378 ?auto_632380 ) ) ( not ( = ?auto_632378 ?auto_632381 ) ) ( not ( = ?auto_632378 ?auto_632382 ) ) ( not ( = ?auto_632378 ?auto_632383 ) ) ( not ( = ?auto_632378 ?auto_632384 ) ) ( not ( = ?auto_632378 ?auto_632385 ) ) ( not ( = ?auto_632378 ?auto_632389 ) ) ( not ( = ?auto_632378 ?auto_632390 ) ) ( not ( = ?auto_632377 ?auto_632379 ) ) ( not ( = ?auto_632377 ?auto_632380 ) ) ( not ( = ?auto_632377 ?auto_632381 ) ) ( not ( = ?auto_632377 ?auto_632382 ) ) ( not ( = ?auto_632377 ?auto_632383 ) ) ( not ( = ?auto_632377 ?auto_632384 ) ) ( not ( = ?auto_632377 ?auto_632385 ) ) ( not ( = ?auto_632377 ?auto_632389 ) ) ( not ( = ?auto_632377 ?auto_632390 ) ) ( not ( = ?auto_632379 ?auto_632380 ) ) ( not ( = ?auto_632379 ?auto_632381 ) ) ( not ( = ?auto_632379 ?auto_632382 ) ) ( not ( = ?auto_632379 ?auto_632383 ) ) ( not ( = ?auto_632379 ?auto_632384 ) ) ( not ( = ?auto_632379 ?auto_632385 ) ) ( not ( = ?auto_632379 ?auto_632389 ) ) ( not ( = ?auto_632379 ?auto_632390 ) ) ( not ( = ?auto_632380 ?auto_632381 ) ) ( not ( = ?auto_632380 ?auto_632382 ) ) ( not ( = ?auto_632380 ?auto_632383 ) ) ( not ( = ?auto_632380 ?auto_632384 ) ) ( not ( = ?auto_632380 ?auto_632385 ) ) ( not ( = ?auto_632380 ?auto_632389 ) ) ( not ( = ?auto_632380 ?auto_632390 ) ) ( not ( = ?auto_632381 ?auto_632382 ) ) ( not ( = ?auto_632381 ?auto_632383 ) ) ( not ( = ?auto_632381 ?auto_632384 ) ) ( not ( = ?auto_632381 ?auto_632385 ) ) ( not ( = ?auto_632381 ?auto_632389 ) ) ( not ( = ?auto_632381 ?auto_632390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632383 ?auto_632384 ?auto_632385 )
      ( MAKE-11CRATE-VERIFY ?auto_632374 ?auto_632375 ?auto_632376 ?auto_632378 ?auto_632377 ?auto_632379 ?auto_632380 ?auto_632381 ?auto_632382 ?auto_632383 ?auto_632384 ?auto_632385 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_632393 - SURFACE
      ?auto_632394 - SURFACE
      ?auto_632395 - SURFACE
      ?auto_632397 - SURFACE
      ?auto_632396 - SURFACE
      ?auto_632398 - SURFACE
      ?auto_632399 - SURFACE
      ?auto_632400 - SURFACE
      ?auto_632401 - SURFACE
      ?auto_632402 - SURFACE
      ?auto_632403 - SURFACE
      ?auto_632404 - SURFACE
      ?auto_632405 - SURFACE
    )
    :vars
    (
      ?auto_632407 - HOIST
      ?auto_632412 - PLACE
      ?auto_632408 - PLACE
      ?auto_632411 - HOIST
      ?auto_632409 - SURFACE
      ?auto_632410 - SURFACE
      ?auto_632406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632407 ?auto_632412 ) ( IS-CRATE ?auto_632405 ) ( not ( = ?auto_632404 ?auto_632405 ) ) ( not ( = ?auto_632403 ?auto_632404 ) ) ( not ( = ?auto_632403 ?auto_632405 ) ) ( not ( = ?auto_632408 ?auto_632412 ) ) ( HOIST-AT ?auto_632411 ?auto_632408 ) ( not ( = ?auto_632407 ?auto_632411 ) ) ( SURFACE-AT ?auto_632405 ?auto_632408 ) ( ON ?auto_632405 ?auto_632409 ) ( CLEAR ?auto_632405 ) ( not ( = ?auto_632404 ?auto_632409 ) ) ( not ( = ?auto_632405 ?auto_632409 ) ) ( not ( = ?auto_632403 ?auto_632409 ) ) ( IS-CRATE ?auto_632404 ) ( AVAILABLE ?auto_632411 ) ( SURFACE-AT ?auto_632404 ?auto_632408 ) ( ON ?auto_632404 ?auto_632410 ) ( CLEAR ?auto_632404 ) ( not ( = ?auto_632404 ?auto_632410 ) ) ( not ( = ?auto_632405 ?auto_632410 ) ) ( not ( = ?auto_632403 ?auto_632410 ) ) ( not ( = ?auto_632409 ?auto_632410 ) ) ( TRUCK-AT ?auto_632406 ?auto_632412 ) ( SURFACE-AT ?auto_632402 ?auto_632412 ) ( CLEAR ?auto_632402 ) ( LIFTING ?auto_632407 ?auto_632403 ) ( IS-CRATE ?auto_632403 ) ( not ( = ?auto_632402 ?auto_632403 ) ) ( not ( = ?auto_632404 ?auto_632402 ) ) ( not ( = ?auto_632405 ?auto_632402 ) ) ( not ( = ?auto_632409 ?auto_632402 ) ) ( not ( = ?auto_632410 ?auto_632402 ) ) ( ON ?auto_632394 ?auto_632393 ) ( ON ?auto_632395 ?auto_632394 ) ( ON ?auto_632397 ?auto_632395 ) ( ON ?auto_632396 ?auto_632397 ) ( ON ?auto_632398 ?auto_632396 ) ( ON ?auto_632399 ?auto_632398 ) ( ON ?auto_632400 ?auto_632399 ) ( ON ?auto_632401 ?auto_632400 ) ( ON ?auto_632402 ?auto_632401 ) ( not ( = ?auto_632393 ?auto_632394 ) ) ( not ( = ?auto_632393 ?auto_632395 ) ) ( not ( = ?auto_632393 ?auto_632397 ) ) ( not ( = ?auto_632393 ?auto_632396 ) ) ( not ( = ?auto_632393 ?auto_632398 ) ) ( not ( = ?auto_632393 ?auto_632399 ) ) ( not ( = ?auto_632393 ?auto_632400 ) ) ( not ( = ?auto_632393 ?auto_632401 ) ) ( not ( = ?auto_632393 ?auto_632402 ) ) ( not ( = ?auto_632393 ?auto_632403 ) ) ( not ( = ?auto_632393 ?auto_632404 ) ) ( not ( = ?auto_632393 ?auto_632405 ) ) ( not ( = ?auto_632393 ?auto_632409 ) ) ( not ( = ?auto_632393 ?auto_632410 ) ) ( not ( = ?auto_632394 ?auto_632395 ) ) ( not ( = ?auto_632394 ?auto_632397 ) ) ( not ( = ?auto_632394 ?auto_632396 ) ) ( not ( = ?auto_632394 ?auto_632398 ) ) ( not ( = ?auto_632394 ?auto_632399 ) ) ( not ( = ?auto_632394 ?auto_632400 ) ) ( not ( = ?auto_632394 ?auto_632401 ) ) ( not ( = ?auto_632394 ?auto_632402 ) ) ( not ( = ?auto_632394 ?auto_632403 ) ) ( not ( = ?auto_632394 ?auto_632404 ) ) ( not ( = ?auto_632394 ?auto_632405 ) ) ( not ( = ?auto_632394 ?auto_632409 ) ) ( not ( = ?auto_632394 ?auto_632410 ) ) ( not ( = ?auto_632395 ?auto_632397 ) ) ( not ( = ?auto_632395 ?auto_632396 ) ) ( not ( = ?auto_632395 ?auto_632398 ) ) ( not ( = ?auto_632395 ?auto_632399 ) ) ( not ( = ?auto_632395 ?auto_632400 ) ) ( not ( = ?auto_632395 ?auto_632401 ) ) ( not ( = ?auto_632395 ?auto_632402 ) ) ( not ( = ?auto_632395 ?auto_632403 ) ) ( not ( = ?auto_632395 ?auto_632404 ) ) ( not ( = ?auto_632395 ?auto_632405 ) ) ( not ( = ?auto_632395 ?auto_632409 ) ) ( not ( = ?auto_632395 ?auto_632410 ) ) ( not ( = ?auto_632397 ?auto_632396 ) ) ( not ( = ?auto_632397 ?auto_632398 ) ) ( not ( = ?auto_632397 ?auto_632399 ) ) ( not ( = ?auto_632397 ?auto_632400 ) ) ( not ( = ?auto_632397 ?auto_632401 ) ) ( not ( = ?auto_632397 ?auto_632402 ) ) ( not ( = ?auto_632397 ?auto_632403 ) ) ( not ( = ?auto_632397 ?auto_632404 ) ) ( not ( = ?auto_632397 ?auto_632405 ) ) ( not ( = ?auto_632397 ?auto_632409 ) ) ( not ( = ?auto_632397 ?auto_632410 ) ) ( not ( = ?auto_632396 ?auto_632398 ) ) ( not ( = ?auto_632396 ?auto_632399 ) ) ( not ( = ?auto_632396 ?auto_632400 ) ) ( not ( = ?auto_632396 ?auto_632401 ) ) ( not ( = ?auto_632396 ?auto_632402 ) ) ( not ( = ?auto_632396 ?auto_632403 ) ) ( not ( = ?auto_632396 ?auto_632404 ) ) ( not ( = ?auto_632396 ?auto_632405 ) ) ( not ( = ?auto_632396 ?auto_632409 ) ) ( not ( = ?auto_632396 ?auto_632410 ) ) ( not ( = ?auto_632398 ?auto_632399 ) ) ( not ( = ?auto_632398 ?auto_632400 ) ) ( not ( = ?auto_632398 ?auto_632401 ) ) ( not ( = ?auto_632398 ?auto_632402 ) ) ( not ( = ?auto_632398 ?auto_632403 ) ) ( not ( = ?auto_632398 ?auto_632404 ) ) ( not ( = ?auto_632398 ?auto_632405 ) ) ( not ( = ?auto_632398 ?auto_632409 ) ) ( not ( = ?auto_632398 ?auto_632410 ) ) ( not ( = ?auto_632399 ?auto_632400 ) ) ( not ( = ?auto_632399 ?auto_632401 ) ) ( not ( = ?auto_632399 ?auto_632402 ) ) ( not ( = ?auto_632399 ?auto_632403 ) ) ( not ( = ?auto_632399 ?auto_632404 ) ) ( not ( = ?auto_632399 ?auto_632405 ) ) ( not ( = ?auto_632399 ?auto_632409 ) ) ( not ( = ?auto_632399 ?auto_632410 ) ) ( not ( = ?auto_632400 ?auto_632401 ) ) ( not ( = ?auto_632400 ?auto_632402 ) ) ( not ( = ?auto_632400 ?auto_632403 ) ) ( not ( = ?auto_632400 ?auto_632404 ) ) ( not ( = ?auto_632400 ?auto_632405 ) ) ( not ( = ?auto_632400 ?auto_632409 ) ) ( not ( = ?auto_632400 ?auto_632410 ) ) ( not ( = ?auto_632401 ?auto_632402 ) ) ( not ( = ?auto_632401 ?auto_632403 ) ) ( not ( = ?auto_632401 ?auto_632404 ) ) ( not ( = ?auto_632401 ?auto_632405 ) ) ( not ( = ?auto_632401 ?auto_632409 ) ) ( not ( = ?auto_632401 ?auto_632410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_632403 ?auto_632404 ?auto_632405 )
      ( MAKE-12CRATE-VERIFY ?auto_632393 ?auto_632394 ?auto_632395 ?auto_632397 ?auto_632396 ?auto_632398 ?auto_632399 ?auto_632400 ?auto_632401 ?auto_632402 ?auto_632403 ?auto_632404 ?auto_632405 ) )
  )

)

