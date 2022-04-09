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
      ?auto_643294 - SURFACE
      ?auto_643295 - SURFACE
    )
    :vars
    (
      ?auto_643296 - HOIST
      ?auto_643297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643296 ?auto_643297 ) ( SURFACE-AT ?auto_643294 ?auto_643297 ) ( CLEAR ?auto_643294 ) ( LIFTING ?auto_643296 ?auto_643295 ) ( IS-CRATE ?auto_643295 ) ( not ( = ?auto_643294 ?auto_643295 ) ) )
    :subtasks
    ( ( !DROP ?auto_643296 ?auto_643295 ?auto_643294 ?auto_643297 )
      ( MAKE-1CRATE-VERIFY ?auto_643294 ?auto_643295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643298 - SURFACE
      ?auto_643299 - SURFACE
    )
    :vars
    (
      ?auto_643301 - HOIST
      ?auto_643300 - PLACE
      ?auto_643302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643301 ?auto_643300 ) ( SURFACE-AT ?auto_643298 ?auto_643300 ) ( CLEAR ?auto_643298 ) ( IS-CRATE ?auto_643299 ) ( not ( = ?auto_643298 ?auto_643299 ) ) ( TRUCK-AT ?auto_643302 ?auto_643300 ) ( AVAILABLE ?auto_643301 ) ( IN ?auto_643299 ?auto_643302 ) )
    :subtasks
    ( ( !UNLOAD ?auto_643301 ?auto_643299 ?auto_643302 ?auto_643300 )
      ( MAKE-1CRATE ?auto_643298 ?auto_643299 )
      ( MAKE-1CRATE-VERIFY ?auto_643298 ?auto_643299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643303 - SURFACE
      ?auto_643304 - SURFACE
    )
    :vars
    (
      ?auto_643307 - HOIST
      ?auto_643305 - PLACE
      ?auto_643306 - TRUCK
      ?auto_643308 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643307 ?auto_643305 ) ( SURFACE-AT ?auto_643303 ?auto_643305 ) ( CLEAR ?auto_643303 ) ( IS-CRATE ?auto_643304 ) ( not ( = ?auto_643303 ?auto_643304 ) ) ( AVAILABLE ?auto_643307 ) ( IN ?auto_643304 ?auto_643306 ) ( TRUCK-AT ?auto_643306 ?auto_643308 ) ( not ( = ?auto_643308 ?auto_643305 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643306 ?auto_643308 ?auto_643305 )
      ( MAKE-1CRATE ?auto_643303 ?auto_643304 )
      ( MAKE-1CRATE-VERIFY ?auto_643303 ?auto_643304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643309 - SURFACE
      ?auto_643310 - SURFACE
    )
    :vars
    (
      ?auto_643314 - HOIST
      ?auto_643311 - PLACE
      ?auto_643312 - TRUCK
      ?auto_643313 - PLACE
      ?auto_643315 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643314 ?auto_643311 ) ( SURFACE-AT ?auto_643309 ?auto_643311 ) ( CLEAR ?auto_643309 ) ( IS-CRATE ?auto_643310 ) ( not ( = ?auto_643309 ?auto_643310 ) ) ( AVAILABLE ?auto_643314 ) ( TRUCK-AT ?auto_643312 ?auto_643313 ) ( not ( = ?auto_643313 ?auto_643311 ) ) ( HOIST-AT ?auto_643315 ?auto_643313 ) ( LIFTING ?auto_643315 ?auto_643310 ) ( not ( = ?auto_643314 ?auto_643315 ) ) )
    :subtasks
    ( ( !LOAD ?auto_643315 ?auto_643310 ?auto_643312 ?auto_643313 )
      ( MAKE-1CRATE ?auto_643309 ?auto_643310 )
      ( MAKE-1CRATE-VERIFY ?auto_643309 ?auto_643310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643316 - SURFACE
      ?auto_643317 - SURFACE
    )
    :vars
    (
      ?auto_643319 - HOIST
      ?auto_643318 - PLACE
      ?auto_643322 - TRUCK
      ?auto_643320 - PLACE
      ?auto_643321 - HOIST
      ?auto_643323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643319 ?auto_643318 ) ( SURFACE-AT ?auto_643316 ?auto_643318 ) ( CLEAR ?auto_643316 ) ( IS-CRATE ?auto_643317 ) ( not ( = ?auto_643316 ?auto_643317 ) ) ( AVAILABLE ?auto_643319 ) ( TRUCK-AT ?auto_643322 ?auto_643320 ) ( not ( = ?auto_643320 ?auto_643318 ) ) ( HOIST-AT ?auto_643321 ?auto_643320 ) ( not ( = ?auto_643319 ?auto_643321 ) ) ( AVAILABLE ?auto_643321 ) ( SURFACE-AT ?auto_643317 ?auto_643320 ) ( ON ?auto_643317 ?auto_643323 ) ( CLEAR ?auto_643317 ) ( not ( = ?auto_643316 ?auto_643323 ) ) ( not ( = ?auto_643317 ?auto_643323 ) ) )
    :subtasks
    ( ( !LIFT ?auto_643321 ?auto_643317 ?auto_643323 ?auto_643320 )
      ( MAKE-1CRATE ?auto_643316 ?auto_643317 )
      ( MAKE-1CRATE-VERIFY ?auto_643316 ?auto_643317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643324 - SURFACE
      ?auto_643325 - SURFACE
    )
    :vars
    (
      ?auto_643326 - HOIST
      ?auto_643329 - PLACE
      ?auto_643330 - PLACE
      ?auto_643331 - HOIST
      ?auto_643328 - SURFACE
      ?auto_643327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643326 ?auto_643329 ) ( SURFACE-AT ?auto_643324 ?auto_643329 ) ( CLEAR ?auto_643324 ) ( IS-CRATE ?auto_643325 ) ( not ( = ?auto_643324 ?auto_643325 ) ) ( AVAILABLE ?auto_643326 ) ( not ( = ?auto_643330 ?auto_643329 ) ) ( HOIST-AT ?auto_643331 ?auto_643330 ) ( not ( = ?auto_643326 ?auto_643331 ) ) ( AVAILABLE ?auto_643331 ) ( SURFACE-AT ?auto_643325 ?auto_643330 ) ( ON ?auto_643325 ?auto_643328 ) ( CLEAR ?auto_643325 ) ( not ( = ?auto_643324 ?auto_643328 ) ) ( not ( = ?auto_643325 ?auto_643328 ) ) ( TRUCK-AT ?auto_643327 ?auto_643329 ) )
    :subtasks
    ( ( !DRIVE ?auto_643327 ?auto_643329 ?auto_643330 )
      ( MAKE-1CRATE ?auto_643324 ?auto_643325 )
      ( MAKE-1CRATE-VERIFY ?auto_643324 ?auto_643325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643341 - SURFACE
      ?auto_643342 - SURFACE
      ?auto_643343 - SURFACE
    )
    :vars
    (
      ?auto_643344 - HOIST
      ?auto_643345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643344 ?auto_643345 ) ( SURFACE-AT ?auto_643342 ?auto_643345 ) ( CLEAR ?auto_643342 ) ( LIFTING ?auto_643344 ?auto_643343 ) ( IS-CRATE ?auto_643343 ) ( not ( = ?auto_643342 ?auto_643343 ) ) ( ON ?auto_643342 ?auto_643341 ) ( not ( = ?auto_643341 ?auto_643342 ) ) ( not ( = ?auto_643341 ?auto_643343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643342 ?auto_643343 )
      ( MAKE-2CRATE-VERIFY ?auto_643341 ?auto_643342 ?auto_643343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643351 - SURFACE
      ?auto_643352 - SURFACE
      ?auto_643353 - SURFACE
    )
    :vars
    (
      ?auto_643354 - HOIST
      ?auto_643356 - PLACE
      ?auto_643355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643354 ?auto_643356 ) ( SURFACE-AT ?auto_643352 ?auto_643356 ) ( CLEAR ?auto_643352 ) ( IS-CRATE ?auto_643353 ) ( not ( = ?auto_643352 ?auto_643353 ) ) ( TRUCK-AT ?auto_643355 ?auto_643356 ) ( AVAILABLE ?auto_643354 ) ( IN ?auto_643353 ?auto_643355 ) ( ON ?auto_643352 ?auto_643351 ) ( not ( = ?auto_643351 ?auto_643352 ) ) ( not ( = ?auto_643351 ?auto_643353 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643352 ?auto_643353 )
      ( MAKE-2CRATE-VERIFY ?auto_643351 ?auto_643352 ?auto_643353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643357 - SURFACE
      ?auto_643358 - SURFACE
    )
    :vars
    (
      ?auto_643362 - HOIST
      ?auto_643359 - PLACE
      ?auto_643360 - TRUCK
      ?auto_643361 - SURFACE
      ?auto_643363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643362 ?auto_643359 ) ( SURFACE-AT ?auto_643357 ?auto_643359 ) ( CLEAR ?auto_643357 ) ( IS-CRATE ?auto_643358 ) ( not ( = ?auto_643357 ?auto_643358 ) ) ( AVAILABLE ?auto_643362 ) ( IN ?auto_643358 ?auto_643360 ) ( ON ?auto_643357 ?auto_643361 ) ( not ( = ?auto_643361 ?auto_643357 ) ) ( not ( = ?auto_643361 ?auto_643358 ) ) ( TRUCK-AT ?auto_643360 ?auto_643363 ) ( not ( = ?auto_643363 ?auto_643359 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643360 ?auto_643363 ?auto_643359 )
      ( MAKE-2CRATE ?auto_643361 ?auto_643357 ?auto_643358 )
      ( MAKE-1CRATE-VERIFY ?auto_643357 ?auto_643358 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643364 - SURFACE
      ?auto_643365 - SURFACE
      ?auto_643366 - SURFACE
    )
    :vars
    (
      ?auto_643368 - HOIST
      ?auto_643370 - PLACE
      ?auto_643367 - TRUCK
      ?auto_643369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643368 ?auto_643370 ) ( SURFACE-AT ?auto_643365 ?auto_643370 ) ( CLEAR ?auto_643365 ) ( IS-CRATE ?auto_643366 ) ( not ( = ?auto_643365 ?auto_643366 ) ) ( AVAILABLE ?auto_643368 ) ( IN ?auto_643366 ?auto_643367 ) ( ON ?auto_643365 ?auto_643364 ) ( not ( = ?auto_643364 ?auto_643365 ) ) ( not ( = ?auto_643364 ?auto_643366 ) ) ( TRUCK-AT ?auto_643367 ?auto_643369 ) ( not ( = ?auto_643369 ?auto_643370 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643365 ?auto_643366 )
      ( MAKE-2CRATE-VERIFY ?auto_643364 ?auto_643365 ?auto_643366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643371 - SURFACE
      ?auto_643372 - SURFACE
    )
    :vars
    (
      ?auto_643375 - HOIST
      ?auto_643373 - PLACE
      ?auto_643377 - SURFACE
      ?auto_643374 - TRUCK
      ?auto_643376 - PLACE
      ?auto_643378 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643375 ?auto_643373 ) ( SURFACE-AT ?auto_643371 ?auto_643373 ) ( CLEAR ?auto_643371 ) ( IS-CRATE ?auto_643372 ) ( not ( = ?auto_643371 ?auto_643372 ) ) ( AVAILABLE ?auto_643375 ) ( ON ?auto_643371 ?auto_643377 ) ( not ( = ?auto_643377 ?auto_643371 ) ) ( not ( = ?auto_643377 ?auto_643372 ) ) ( TRUCK-AT ?auto_643374 ?auto_643376 ) ( not ( = ?auto_643376 ?auto_643373 ) ) ( HOIST-AT ?auto_643378 ?auto_643376 ) ( LIFTING ?auto_643378 ?auto_643372 ) ( not ( = ?auto_643375 ?auto_643378 ) ) )
    :subtasks
    ( ( !LOAD ?auto_643378 ?auto_643372 ?auto_643374 ?auto_643376 )
      ( MAKE-2CRATE ?auto_643377 ?auto_643371 ?auto_643372 )
      ( MAKE-1CRATE-VERIFY ?auto_643371 ?auto_643372 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643379 - SURFACE
      ?auto_643380 - SURFACE
      ?auto_643381 - SURFACE
    )
    :vars
    (
      ?auto_643383 - HOIST
      ?auto_643386 - PLACE
      ?auto_643384 - TRUCK
      ?auto_643385 - PLACE
      ?auto_643382 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643383 ?auto_643386 ) ( SURFACE-AT ?auto_643380 ?auto_643386 ) ( CLEAR ?auto_643380 ) ( IS-CRATE ?auto_643381 ) ( not ( = ?auto_643380 ?auto_643381 ) ) ( AVAILABLE ?auto_643383 ) ( ON ?auto_643380 ?auto_643379 ) ( not ( = ?auto_643379 ?auto_643380 ) ) ( not ( = ?auto_643379 ?auto_643381 ) ) ( TRUCK-AT ?auto_643384 ?auto_643385 ) ( not ( = ?auto_643385 ?auto_643386 ) ) ( HOIST-AT ?auto_643382 ?auto_643385 ) ( LIFTING ?auto_643382 ?auto_643381 ) ( not ( = ?auto_643383 ?auto_643382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643380 ?auto_643381 )
      ( MAKE-2CRATE-VERIFY ?auto_643379 ?auto_643380 ?auto_643381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643387 - SURFACE
      ?auto_643388 - SURFACE
    )
    :vars
    (
      ?auto_643391 - HOIST
      ?auto_643392 - PLACE
      ?auto_643394 - SURFACE
      ?auto_643389 - TRUCK
      ?auto_643390 - PLACE
      ?auto_643393 - HOIST
      ?auto_643395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643391 ?auto_643392 ) ( SURFACE-AT ?auto_643387 ?auto_643392 ) ( CLEAR ?auto_643387 ) ( IS-CRATE ?auto_643388 ) ( not ( = ?auto_643387 ?auto_643388 ) ) ( AVAILABLE ?auto_643391 ) ( ON ?auto_643387 ?auto_643394 ) ( not ( = ?auto_643394 ?auto_643387 ) ) ( not ( = ?auto_643394 ?auto_643388 ) ) ( TRUCK-AT ?auto_643389 ?auto_643390 ) ( not ( = ?auto_643390 ?auto_643392 ) ) ( HOIST-AT ?auto_643393 ?auto_643390 ) ( not ( = ?auto_643391 ?auto_643393 ) ) ( AVAILABLE ?auto_643393 ) ( SURFACE-AT ?auto_643388 ?auto_643390 ) ( ON ?auto_643388 ?auto_643395 ) ( CLEAR ?auto_643388 ) ( not ( = ?auto_643387 ?auto_643395 ) ) ( not ( = ?auto_643388 ?auto_643395 ) ) ( not ( = ?auto_643394 ?auto_643395 ) ) )
    :subtasks
    ( ( !LIFT ?auto_643393 ?auto_643388 ?auto_643395 ?auto_643390 )
      ( MAKE-2CRATE ?auto_643394 ?auto_643387 ?auto_643388 )
      ( MAKE-1CRATE-VERIFY ?auto_643387 ?auto_643388 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643396 - SURFACE
      ?auto_643397 - SURFACE
      ?auto_643398 - SURFACE
    )
    :vars
    (
      ?auto_643402 - HOIST
      ?auto_643399 - PLACE
      ?auto_643403 - TRUCK
      ?auto_643404 - PLACE
      ?auto_643401 - HOIST
      ?auto_643400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643402 ?auto_643399 ) ( SURFACE-AT ?auto_643397 ?auto_643399 ) ( CLEAR ?auto_643397 ) ( IS-CRATE ?auto_643398 ) ( not ( = ?auto_643397 ?auto_643398 ) ) ( AVAILABLE ?auto_643402 ) ( ON ?auto_643397 ?auto_643396 ) ( not ( = ?auto_643396 ?auto_643397 ) ) ( not ( = ?auto_643396 ?auto_643398 ) ) ( TRUCK-AT ?auto_643403 ?auto_643404 ) ( not ( = ?auto_643404 ?auto_643399 ) ) ( HOIST-AT ?auto_643401 ?auto_643404 ) ( not ( = ?auto_643402 ?auto_643401 ) ) ( AVAILABLE ?auto_643401 ) ( SURFACE-AT ?auto_643398 ?auto_643404 ) ( ON ?auto_643398 ?auto_643400 ) ( CLEAR ?auto_643398 ) ( not ( = ?auto_643397 ?auto_643400 ) ) ( not ( = ?auto_643398 ?auto_643400 ) ) ( not ( = ?auto_643396 ?auto_643400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643397 ?auto_643398 )
      ( MAKE-2CRATE-VERIFY ?auto_643396 ?auto_643397 ?auto_643398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643405 - SURFACE
      ?auto_643406 - SURFACE
    )
    :vars
    (
      ?auto_643413 - HOIST
      ?auto_643409 - PLACE
      ?auto_643407 - SURFACE
      ?auto_643411 - PLACE
      ?auto_643410 - HOIST
      ?auto_643412 - SURFACE
      ?auto_643408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643413 ?auto_643409 ) ( SURFACE-AT ?auto_643405 ?auto_643409 ) ( CLEAR ?auto_643405 ) ( IS-CRATE ?auto_643406 ) ( not ( = ?auto_643405 ?auto_643406 ) ) ( AVAILABLE ?auto_643413 ) ( ON ?auto_643405 ?auto_643407 ) ( not ( = ?auto_643407 ?auto_643405 ) ) ( not ( = ?auto_643407 ?auto_643406 ) ) ( not ( = ?auto_643411 ?auto_643409 ) ) ( HOIST-AT ?auto_643410 ?auto_643411 ) ( not ( = ?auto_643413 ?auto_643410 ) ) ( AVAILABLE ?auto_643410 ) ( SURFACE-AT ?auto_643406 ?auto_643411 ) ( ON ?auto_643406 ?auto_643412 ) ( CLEAR ?auto_643406 ) ( not ( = ?auto_643405 ?auto_643412 ) ) ( not ( = ?auto_643406 ?auto_643412 ) ) ( not ( = ?auto_643407 ?auto_643412 ) ) ( TRUCK-AT ?auto_643408 ?auto_643409 ) )
    :subtasks
    ( ( !DRIVE ?auto_643408 ?auto_643409 ?auto_643411 )
      ( MAKE-2CRATE ?auto_643407 ?auto_643405 ?auto_643406 )
      ( MAKE-1CRATE-VERIFY ?auto_643405 ?auto_643406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643414 - SURFACE
      ?auto_643415 - SURFACE
      ?auto_643416 - SURFACE
    )
    :vars
    (
      ?auto_643421 - HOIST
      ?auto_643419 - PLACE
      ?auto_643417 - PLACE
      ?auto_643420 - HOIST
      ?auto_643418 - SURFACE
      ?auto_643422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643421 ?auto_643419 ) ( SURFACE-AT ?auto_643415 ?auto_643419 ) ( CLEAR ?auto_643415 ) ( IS-CRATE ?auto_643416 ) ( not ( = ?auto_643415 ?auto_643416 ) ) ( AVAILABLE ?auto_643421 ) ( ON ?auto_643415 ?auto_643414 ) ( not ( = ?auto_643414 ?auto_643415 ) ) ( not ( = ?auto_643414 ?auto_643416 ) ) ( not ( = ?auto_643417 ?auto_643419 ) ) ( HOIST-AT ?auto_643420 ?auto_643417 ) ( not ( = ?auto_643421 ?auto_643420 ) ) ( AVAILABLE ?auto_643420 ) ( SURFACE-AT ?auto_643416 ?auto_643417 ) ( ON ?auto_643416 ?auto_643418 ) ( CLEAR ?auto_643416 ) ( not ( = ?auto_643415 ?auto_643418 ) ) ( not ( = ?auto_643416 ?auto_643418 ) ) ( not ( = ?auto_643414 ?auto_643418 ) ) ( TRUCK-AT ?auto_643422 ?auto_643419 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643415 ?auto_643416 )
      ( MAKE-2CRATE-VERIFY ?auto_643414 ?auto_643415 ?auto_643416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643423 - SURFACE
      ?auto_643424 - SURFACE
    )
    :vars
    (
      ?auto_643427 - HOIST
      ?auto_643426 - PLACE
      ?auto_643430 - SURFACE
      ?auto_643429 - PLACE
      ?auto_643431 - HOIST
      ?auto_643428 - SURFACE
      ?auto_643425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643427 ?auto_643426 ) ( IS-CRATE ?auto_643424 ) ( not ( = ?auto_643423 ?auto_643424 ) ) ( not ( = ?auto_643430 ?auto_643423 ) ) ( not ( = ?auto_643430 ?auto_643424 ) ) ( not ( = ?auto_643429 ?auto_643426 ) ) ( HOIST-AT ?auto_643431 ?auto_643429 ) ( not ( = ?auto_643427 ?auto_643431 ) ) ( AVAILABLE ?auto_643431 ) ( SURFACE-AT ?auto_643424 ?auto_643429 ) ( ON ?auto_643424 ?auto_643428 ) ( CLEAR ?auto_643424 ) ( not ( = ?auto_643423 ?auto_643428 ) ) ( not ( = ?auto_643424 ?auto_643428 ) ) ( not ( = ?auto_643430 ?auto_643428 ) ) ( TRUCK-AT ?auto_643425 ?auto_643426 ) ( SURFACE-AT ?auto_643430 ?auto_643426 ) ( CLEAR ?auto_643430 ) ( LIFTING ?auto_643427 ?auto_643423 ) ( IS-CRATE ?auto_643423 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643430 ?auto_643423 )
      ( MAKE-2CRATE ?auto_643430 ?auto_643423 ?auto_643424 )
      ( MAKE-1CRATE-VERIFY ?auto_643423 ?auto_643424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643432 - SURFACE
      ?auto_643433 - SURFACE
      ?auto_643434 - SURFACE
    )
    :vars
    (
      ?auto_643439 - HOIST
      ?auto_643438 - PLACE
      ?auto_643440 - PLACE
      ?auto_643436 - HOIST
      ?auto_643437 - SURFACE
      ?auto_643435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643439 ?auto_643438 ) ( IS-CRATE ?auto_643434 ) ( not ( = ?auto_643433 ?auto_643434 ) ) ( not ( = ?auto_643432 ?auto_643433 ) ) ( not ( = ?auto_643432 ?auto_643434 ) ) ( not ( = ?auto_643440 ?auto_643438 ) ) ( HOIST-AT ?auto_643436 ?auto_643440 ) ( not ( = ?auto_643439 ?auto_643436 ) ) ( AVAILABLE ?auto_643436 ) ( SURFACE-AT ?auto_643434 ?auto_643440 ) ( ON ?auto_643434 ?auto_643437 ) ( CLEAR ?auto_643434 ) ( not ( = ?auto_643433 ?auto_643437 ) ) ( not ( = ?auto_643434 ?auto_643437 ) ) ( not ( = ?auto_643432 ?auto_643437 ) ) ( TRUCK-AT ?auto_643435 ?auto_643438 ) ( SURFACE-AT ?auto_643432 ?auto_643438 ) ( CLEAR ?auto_643432 ) ( LIFTING ?auto_643439 ?auto_643433 ) ( IS-CRATE ?auto_643433 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643433 ?auto_643434 )
      ( MAKE-2CRATE-VERIFY ?auto_643432 ?auto_643433 ?auto_643434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643441 - SURFACE
      ?auto_643442 - SURFACE
    )
    :vars
    (
      ?auto_643444 - HOIST
      ?auto_643446 - PLACE
      ?auto_643445 - SURFACE
      ?auto_643443 - PLACE
      ?auto_643447 - HOIST
      ?auto_643449 - SURFACE
      ?auto_643448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643444 ?auto_643446 ) ( IS-CRATE ?auto_643442 ) ( not ( = ?auto_643441 ?auto_643442 ) ) ( not ( = ?auto_643445 ?auto_643441 ) ) ( not ( = ?auto_643445 ?auto_643442 ) ) ( not ( = ?auto_643443 ?auto_643446 ) ) ( HOIST-AT ?auto_643447 ?auto_643443 ) ( not ( = ?auto_643444 ?auto_643447 ) ) ( AVAILABLE ?auto_643447 ) ( SURFACE-AT ?auto_643442 ?auto_643443 ) ( ON ?auto_643442 ?auto_643449 ) ( CLEAR ?auto_643442 ) ( not ( = ?auto_643441 ?auto_643449 ) ) ( not ( = ?auto_643442 ?auto_643449 ) ) ( not ( = ?auto_643445 ?auto_643449 ) ) ( TRUCK-AT ?auto_643448 ?auto_643446 ) ( SURFACE-AT ?auto_643445 ?auto_643446 ) ( CLEAR ?auto_643445 ) ( IS-CRATE ?auto_643441 ) ( AVAILABLE ?auto_643444 ) ( IN ?auto_643441 ?auto_643448 ) )
    :subtasks
    ( ( !UNLOAD ?auto_643444 ?auto_643441 ?auto_643448 ?auto_643446 )
      ( MAKE-2CRATE ?auto_643445 ?auto_643441 ?auto_643442 )
      ( MAKE-1CRATE-VERIFY ?auto_643441 ?auto_643442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643450 - SURFACE
      ?auto_643451 - SURFACE
      ?auto_643452 - SURFACE
    )
    :vars
    (
      ?auto_643454 - HOIST
      ?auto_643453 - PLACE
      ?auto_643456 - PLACE
      ?auto_643455 - HOIST
      ?auto_643458 - SURFACE
      ?auto_643457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643454 ?auto_643453 ) ( IS-CRATE ?auto_643452 ) ( not ( = ?auto_643451 ?auto_643452 ) ) ( not ( = ?auto_643450 ?auto_643451 ) ) ( not ( = ?auto_643450 ?auto_643452 ) ) ( not ( = ?auto_643456 ?auto_643453 ) ) ( HOIST-AT ?auto_643455 ?auto_643456 ) ( not ( = ?auto_643454 ?auto_643455 ) ) ( AVAILABLE ?auto_643455 ) ( SURFACE-AT ?auto_643452 ?auto_643456 ) ( ON ?auto_643452 ?auto_643458 ) ( CLEAR ?auto_643452 ) ( not ( = ?auto_643451 ?auto_643458 ) ) ( not ( = ?auto_643452 ?auto_643458 ) ) ( not ( = ?auto_643450 ?auto_643458 ) ) ( TRUCK-AT ?auto_643457 ?auto_643453 ) ( SURFACE-AT ?auto_643450 ?auto_643453 ) ( CLEAR ?auto_643450 ) ( IS-CRATE ?auto_643451 ) ( AVAILABLE ?auto_643454 ) ( IN ?auto_643451 ?auto_643457 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643451 ?auto_643452 )
      ( MAKE-2CRATE-VERIFY ?auto_643450 ?auto_643451 ?auto_643452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643495 - SURFACE
      ?auto_643496 - SURFACE
    )
    :vars
    (
      ?auto_643498 - HOIST
      ?auto_643501 - PLACE
      ?auto_643503 - SURFACE
      ?auto_643499 - PLACE
      ?auto_643502 - HOIST
      ?auto_643497 - SURFACE
      ?auto_643500 - TRUCK
      ?auto_643504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643498 ?auto_643501 ) ( SURFACE-AT ?auto_643495 ?auto_643501 ) ( CLEAR ?auto_643495 ) ( IS-CRATE ?auto_643496 ) ( not ( = ?auto_643495 ?auto_643496 ) ) ( AVAILABLE ?auto_643498 ) ( ON ?auto_643495 ?auto_643503 ) ( not ( = ?auto_643503 ?auto_643495 ) ) ( not ( = ?auto_643503 ?auto_643496 ) ) ( not ( = ?auto_643499 ?auto_643501 ) ) ( HOIST-AT ?auto_643502 ?auto_643499 ) ( not ( = ?auto_643498 ?auto_643502 ) ) ( AVAILABLE ?auto_643502 ) ( SURFACE-AT ?auto_643496 ?auto_643499 ) ( ON ?auto_643496 ?auto_643497 ) ( CLEAR ?auto_643496 ) ( not ( = ?auto_643495 ?auto_643497 ) ) ( not ( = ?auto_643496 ?auto_643497 ) ) ( not ( = ?auto_643503 ?auto_643497 ) ) ( TRUCK-AT ?auto_643500 ?auto_643504 ) ( not ( = ?auto_643504 ?auto_643501 ) ) ( not ( = ?auto_643499 ?auto_643504 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643500 ?auto_643504 ?auto_643501 )
      ( MAKE-1CRATE ?auto_643495 ?auto_643496 )
      ( MAKE-1CRATE-VERIFY ?auto_643495 ?auto_643496 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643534 - SURFACE
      ?auto_643535 - SURFACE
      ?auto_643536 - SURFACE
      ?auto_643537 - SURFACE
    )
    :vars
    (
      ?auto_643538 - HOIST
      ?auto_643539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643538 ?auto_643539 ) ( SURFACE-AT ?auto_643536 ?auto_643539 ) ( CLEAR ?auto_643536 ) ( LIFTING ?auto_643538 ?auto_643537 ) ( IS-CRATE ?auto_643537 ) ( not ( = ?auto_643536 ?auto_643537 ) ) ( ON ?auto_643535 ?auto_643534 ) ( ON ?auto_643536 ?auto_643535 ) ( not ( = ?auto_643534 ?auto_643535 ) ) ( not ( = ?auto_643534 ?auto_643536 ) ) ( not ( = ?auto_643534 ?auto_643537 ) ) ( not ( = ?auto_643535 ?auto_643536 ) ) ( not ( = ?auto_643535 ?auto_643537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643536 ?auto_643537 )
      ( MAKE-3CRATE-VERIFY ?auto_643534 ?auto_643535 ?auto_643536 ?auto_643537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643551 - SURFACE
      ?auto_643552 - SURFACE
      ?auto_643553 - SURFACE
      ?auto_643554 - SURFACE
    )
    :vars
    (
      ?auto_643556 - HOIST
      ?auto_643557 - PLACE
      ?auto_643555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643556 ?auto_643557 ) ( SURFACE-AT ?auto_643553 ?auto_643557 ) ( CLEAR ?auto_643553 ) ( IS-CRATE ?auto_643554 ) ( not ( = ?auto_643553 ?auto_643554 ) ) ( TRUCK-AT ?auto_643555 ?auto_643557 ) ( AVAILABLE ?auto_643556 ) ( IN ?auto_643554 ?auto_643555 ) ( ON ?auto_643553 ?auto_643552 ) ( not ( = ?auto_643552 ?auto_643553 ) ) ( not ( = ?auto_643552 ?auto_643554 ) ) ( ON ?auto_643552 ?auto_643551 ) ( not ( = ?auto_643551 ?auto_643552 ) ) ( not ( = ?auto_643551 ?auto_643553 ) ) ( not ( = ?auto_643551 ?auto_643554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643552 ?auto_643553 ?auto_643554 )
      ( MAKE-3CRATE-VERIFY ?auto_643551 ?auto_643552 ?auto_643553 ?auto_643554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643572 - SURFACE
      ?auto_643573 - SURFACE
      ?auto_643574 - SURFACE
      ?auto_643575 - SURFACE
    )
    :vars
    (
      ?auto_643576 - HOIST
      ?auto_643577 - PLACE
      ?auto_643578 - TRUCK
      ?auto_643579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643576 ?auto_643577 ) ( SURFACE-AT ?auto_643574 ?auto_643577 ) ( CLEAR ?auto_643574 ) ( IS-CRATE ?auto_643575 ) ( not ( = ?auto_643574 ?auto_643575 ) ) ( AVAILABLE ?auto_643576 ) ( IN ?auto_643575 ?auto_643578 ) ( ON ?auto_643574 ?auto_643573 ) ( not ( = ?auto_643573 ?auto_643574 ) ) ( not ( = ?auto_643573 ?auto_643575 ) ) ( TRUCK-AT ?auto_643578 ?auto_643579 ) ( not ( = ?auto_643579 ?auto_643577 ) ) ( ON ?auto_643573 ?auto_643572 ) ( not ( = ?auto_643572 ?auto_643573 ) ) ( not ( = ?auto_643572 ?auto_643574 ) ) ( not ( = ?auto_643572 ?auto_643575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643573 ?auto_643574 ?auto_643575 )
      ( MAKE-3CRATE-VERIFY ?auto_643572 ?auto_643573 ?auto_643574 ?auto_643575 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643596 - SURFACE
      ?auto_643597 - SURFACE
      ?auto_643598 - SURFACE
      ?auto_643599 - SURFACE
    )
    :vars
    (
      ?auto_643602 - HOIST
      ?auto_643603 - PLACE
      ?auto_643604 - TRUCK
      ?auto_643600 - PLACE
      ?auto_643601 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643602 ?auto_643603 ) ( SURFACE-AT ?auto_643598 ?auto_643603 ) ( CLEAR ?auto_643598 ) ( IS-CRATE ?auto_643599 ) ( not ( = ?auto_643598 ?auto_643599 ) ) ( AVAILABLE ?auto_643602 ) ( ON ?auto_643598 ?auto_643597 ) ( not ( = ?auto_643597 ?auto_643598 ) ) ( not ( = ?auto_643597 ?auto_643599 ) ) ( TRUCK-AT ?auto_643604 ?auto_643600 ) ( not ( = ?auto_643600 ?auto_643603 ) ) ( HOIST-AT ?auto_643601 ?auto_643600 ) ( LIFTING ?auto_643601 ?auto_643599 ) ( not ( = ?auto_643602 ?auto_643601 ) ) ( ON ?auto_643597 ?auto_643596 ) ( not ( = ?auto_643596 ?auto_643597 ) ) ( not ( = ?auto_643596 ?auto_643598 ) ) ( not ( = ?auto_643596 ?auto_643599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643597 ?auto_643598 ?auto_643599 )
      ( MAKE-3CRATE-VERIFY ?auto_643596 ?auto_643597 ?auto_643598 ?auto_643599 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643623 - SURFACE
      ?auto_643624 - SURFACE
      ?auto_643625 - SURFACE
      ?auto_643626 - SURFACE
    )
    :vars
    (
      ?auto_643630 - HOIST
      ?auto_643632 - PLACE
      ?auto_643628 - TRUCK
      ?auto_643631 - PLACE
      ?auto_643627 - HOIST
      ?auto_643629 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643630 ?auto_643632 ) ( SURFACE-AT ?auto_643625 ?auto_643632 ) ( CLEAR ?auto_643625 ) ( IS-CRATE ?auto_643626 ) ( not ( = ?auto_643625 ?auto_643626 ) ) ( AVAILABLE ?auto_643630 ) ( ON ?auto_643625 ?auto_643624 ) ( not ( = ?auto_643624 ?auto_643625 ) ) ( not ( = ?auto_643624 ?auto_643626 ) ) ( TRUCK-AT ?auto_643628 ?auto_643631 ) ( not ( = ?auto_643631 ?auto_643632 ) ) ( HOIST-AT ?auto_643627 ?auto_643631 ) ( not ( = ?auto_643630 ?auto_643627 ) ) ( AVAILABLE ?auto_643627 ) ( SURFACE-AT ?auto_643626 ?auto_643631 ) ( ON ?auto_643626 ?auto_643629 ) ( CLEAR ?auto_643626 ) ( not ( = ?auto_643625 ?auto_643629 ) ) ( not ( = ?auto_643626 ?auto_643629 ) ) ( not ( = ?auto_643624 ?auto_643629 ) ) ( ON ?auto_643624 ?auto_643623 ) ( not ( = ?auto_643623 ?auto_643624 ) ) ( not ( = ?auto_643623 ?auto_643625 ) ) ( not ( = ?auto_643623 ?auto_643626 ) ) ( not ( = ?auto_643623 ?auto_643629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643624 ?auto_643625 ?auto_643626 )
      ( MAKE-3CRATE-VERIFY ?auto_643623 ?auto_643624 ?auto_643625 ?auto_643626 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643651 - SURFACE
      ?auto_643652 - SURFACE
      ?auto_643653 - SURFACE
      ?auto_643654 - SURFACE
    )
    :vars
    (
      ?auto_643659 - HOIST
      ?auto_643657 - PLACE
      ?auto_643655 - PLACE
      ?auto_643658 - HOIST
      ?auto_643660 - SURFACE
      ?auto_643656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643659 ?auto_643657 ) ( SURFACE-AT ?auto_643653 ?auto_643657 ) ( CLEAR ?auto_643653 ) ( IS-CRATE ?auto_643654 ) ( not ( = ?auto_643653 ?auto_643654 ) ) ( AVAILABLE ?auto_643659 ) ( ON ?auto_643653 ?auto_643652 ) ( not ( = ?auto_643652 ?auto_643653 ) ) ( not ( = ?auto_643652 ?auto_643654 ) ) ( not ( = ?auto_643655 ?auto_643657 ) ) ( HOIST-AT ?auto_643658 ?auto_643655 ) ( not ( = ?auto_643659 ?auto_643658 ) ) ( AVAILABLE ?auto_643658 ) ( SURFACE-AT ?auto_643654 ?auto_643655 ) ( ON ?auto_643654 ?auto_643660 ) ( CLEAR ?auto_643654 ) ( not ( = ?auto_643653 ?auto_643660 ) ) ( not ( = ?auto_643654 ?auto_643660 ) ) ( not ( = ?auto_643652 ?auto_643660 ) ) ( TRUCK-AT ?auto_643656 ?auto_643657 ) ( ON ?auto_643652 ?auto_643651 ) ( not ( = ?auto_643651 ?auto_643652 ) ) ( not ( = ?auto_643651 ?auto_643653 ) ) ( not ( = ?auto_643651 ?auto_643654 ) ) ( not ( = ?auto_643651 ?auto_643660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643652 ?auto_643653 ?auto_643654 )
      ( MAKE-3CRATE-VERIFY ?auto_643651 ?auto_643652 ?auto_643653 ?auto_643654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643679 - SURFACE
      ?auto_643680 - SURFACE
      ?auto_643681 - SURFACE
      ?auto_643682 - SURFACE
    )
    :vars
    (
      ?auto_643688 - HOIST
      ?auto_643683 - PLACE
      ?auto_643686 - PLACE
      ?auto_643685 - HOIST
      ?auto_643687 - SURFACE
      ?auto_643684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643688 ?auto_643683 ) ( IS-CRATE ?auto_643682 ) ( not ( = ?auto_643681 ?auto_643682 ) ) ( not ( = ?auto_643680 ?auto_643681 ) ) ( not ( = ?auto_643680 ?auto_643682 ) ) ( not ( = ?auto_643686 ?auto_643683 ) ) ( HOIST-AT ?auto_643685 ?auto_643686 ) ( not ( = ?auto_643688 ?auto_643685 ) ) ( AVAILABLE ?auto_643685 ) ( SURFACE-AT ?auto_643682 ?auto_643686 ) ( ON ?auto_643682 ?auto_643687 ) ( CLEAR ?auto_643682 ) ( not ( = ?auto_643681 ?auto_643687 ) ) ( not ( = ?auto_643682 ?auto_643687 ) ) ( not ( = ?auto_643680 ?auto_643687 ) ) ( TRUCK-AT ?auto_643684 ?auto_643683 ) ( SURFACE-AT ?auto_643680 ?auto_643683 ) ( CLEAR ?auto_643680 ) ( LIFTING ?auto_643688 ?auto_643681 ) ( IS-CRATE ?auto_643681 ) ( ON ?auto_643680 ?auto_643679 ) ( not ( = ?auto_643679 ?auto_643680 ) ) ( not ( = ?auto_643679 ?auto_643681 ) ) ( not ( = ?auto_643679 ?auto_643682 ) ) ( not ( = ?auto_643679 ?auto_643687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643680 ?auto_643681 ?auto_643682 )
      ( MAKE-3CRATE-VERIFY ?auto_643679 ?auto_643680 ?auto_643681 ?auto_643682 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643707 - SURFACE
      ?auto_643708 - SURFACE
      ?auto_643709 - SURFACE
      ?auto_643710 - SURFACE
    )
    :vars
    (
      ?auto_643714 - HOIST
      ?auto_643711 - PLACE
      ?auto_643712 - PLACE
      ?auto_643713 - HOIST
      ?auto_643715 - SURFACE
      ?auto_643716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643714 ?auto_643711 ) ( IS-CRATE ?auto_643710 ) ( not ( = ?auto_643709 ?auto_643710 ) ) ( not ( = ?auto_643708 ?auto_643709 ) ) ( not ( = ?auto_643708 ?auto_643710 ) ) ( not ( = ?auto_643712 ?auto_643711 ) ) ( HOIST-AT ?auto_643713 ?auto_643712 ) ( not ( = ?auto_643714 ?auto_643713 ) ) ( AVAILABLE ?auto_643713 ) ( SURFACE-AT ?auto_643710 ?auto_643712 ) ( ON ?auto_643710 ?auto_643715 ) ( CLEAR ?auto_643710 ) ( not ( = ?auto_643709 ?auto_643715 ) ) ( not ( = ?auto_643710 ?auto_643715 ) ) ( not ( = ?auto_643708 ?auto_643715 ) ) ( TRUCK-AT ?auto_643716 ?auto_643711 ) ( SURFACE-AT ?auto_643708 ?auto_643711 ) ( CLEAR ?auto_643708 ) ( IS-CRATE ?auto_643709 ) ( AVAILABLE ?auto_643714 ) ( IN ?auto_643709 ?auto_643716 ) ( ON ?auto_643708 ?auto_643707 ) ( not ( = ?auto_643707 ?auto_643708 ) ) ( not ( = ?auto_643707 ?auto_643709 ) ) ( not ( = ?auto_643707 ?auto_643710 ) ) ( not ( = ?auto_643707 ?auto_643715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643708 ?auto_643709 ?auto_643710 )
      ( MAKE-3CRATE-VERIFY ?auto_643707 ?auto_643708 ?auto_643709 ?auto_643710 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643998 - SURFACE
      ?auto_643999 - SURFACE
      ?auto_644000 - SURFACE
      ?auto_644001 - SURFACE
      ?auto_644002 - SURFACE
    )
    :vars
    (
      ?auto_644004 - HOIST
      ?auto_644003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644004 ?auto_644003 ) ( SURFACE-AT ?auto_644001 ?auto_644003 ) ( CLEAR ?auto_644001 ) ( LIFTING ?auto_644004 ?auto_644002 ) ( IS-CRATE ?auto_644002 ) ( not ( = ?auto_644001 ?auto_644002 ) ) ( ON ?auto_643999 ?auto_643998 ) ( ON ?auto_644000 ?auto_643999 ) ( ON ?auto_644001 ?auto_644000 ) ( not ( = ?auto_643998 ?auto_643999 ) ) ( not ( = ?auto_643998 ?auto_644000 ) ) ( not ( = ?auto_643998 ?auto_644001 ) ) ( not ( = ?auto_643998 ?auto_644002 ) ) ( not ( = ?auto_643999 ?auto_644000 ) ) ( not ( = ?auto_643999 ?auto_644001 ) ) ( not ( = ?auto_643999 ?auto_644002 ) ) ( not ( = ?auto_644000 ?auto_644001 ) ) ( not ( = ?auto_644000 ?auto_644002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_644001 ?auto_644002 )
      ( MAKE-4CRATE-VERIFY ?auto_643998 ?auto_643999 ?auto_644000 ?auto_644001 ?auto_644002 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644023 - SURFACE
      ?auto_644024 - SURFACE
      ?auto_644025 - SURFACE
      ?auto_644026 - SURFACE
      ?auto_644027 - SURFACE
    )
    :vars
    (
      ?auto_644030 - HOIST
      ?auto_644029 - PLACE
      ?auto_644028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644030 ?auto_644029 ) ( SURFACE-AT ?auto_644026 ?auto_644029 ) ( CLEAR ?auto_644026 ) ( IS-CRATE ?auto_644027 ) ( not ( = ?auto_644026 ?auto_644027 ) ) ( TRUCK-AT ?auto_644028 ?auto_644029 ) ( AVAILABLE ?auto_644030 ) ( IN ?auto_644027 ?auto_644028 ) ( ON ?auto_644026 ?auto_644025 ) ( not ( = ?auto_644025 ?auto_644026 ) ) ( not ( = ?auto_644025 ?auto_644027 ) ) ( ON ?auto_644024 ?auto_644023 ) ( ON ?auto_644025 ?auto_644024 ) ( not ( = ?auto_644023 ?auto_644024 ) ) ( not ( = ?auto_644023 ?auto_644025 ) ) ( not ( = ?auto_644023 ?auto_644026 ) ) ( not ( = ?auto_644023 ?auto_644027 ) ) ( not ( = ?auto_644024 ?auto_644025 ) ) ( not ( = ?auto_644024 ?auto_644026 ) ) ( not ( = ?auto_644024 ?auto_644027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644025 ?auto_644026 ?auto_644027 )
      ( MAKE-4CRATE-VERIFY ?auto_644023 ?auto_644024 ?auto_644025 ?auto_644026 ?auto_644027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644053 - SURFACE
      ?auto_644054 - SURFACE
      ?auto_644055 - SURFACE
      ?auto_644056 - SURFACE
      ?auto_644057 - SURFACE
    )
    :vars
    (
      ?auto_644061 - HOIST
      ?auto_644059 - PLACE
      ?auto_644058 - TRUCK
      ?auto_644060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644061 ?auto_644059 ) ( SURFACE-AT ?auto_644056 ?auto_644059 ) ( CLEAR ?auto_644056 ) ( IS-CRATE ?auto_644057 ) ( not ( = ?auto_644056 ?auto_644057 ) ) ( AVAILABLE ?auto_644061 ) ( IN ?auto_644057 ?auto_644058 ) ( ON ?auto_644056 ?auto_644055 ) ( not ( = ?auto_644055 ?auto_644056 ) ) ( not ( = ?auto_644055 ?auto_644057 ) ) ( TRUCK-AT ?auto_644058 ?auto_644060 ) ( not ( = ?auto_644060 ?auto_644059 ) ) ( ON ?auto_644054 ?auto_644053 ) ( ON ?auto_644055 ?auto_644054 ) ( not ( = ?auto_644053 ?auto_644054 ) ) ( not ( = ?auto_644053 ?auto_644055 ) ) ( not ( = ?auto_644053 ?auto_644056 ) ) ( not ( = ?auto_644053 ?auto_644057 ) ) ( not ( = ?auto_644054 ?auto_644055 ) ) ( not ( = ?auto_644054 ?auto_644056 ) ) ( not ( = ?auto_644054 ?auto_644057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644055 ?auto_644056 ?auto_644057 )
      ( MAKE-4CRATE-VERIFY ?auto_644053 ?auto_644054 ?auto_644055 ?auto_644056 ?auto_644057 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644087 - SURFACE
      ?auto_644088 - SURFACE
      ?auto_644089 - SURFACE
      ?auto_644090 - SURFACE
      ?auto_644091 - SURFACE
    )
    :vars
    (
      ?auto_644093 - HOIST
      ?auto_644096 - PLACE
      ?auto_644094 - TRUCK
      ?auto_644092 - PLACE
      ?auto_644095 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_644093 ?auto_644096 ) ( SURFACE-AT ?auto_644090 ?auto_644096 ) ( CLEAR ?auto_644090 ) ( IS-CRATE ?auto_644091 ) ( not ( = ?auto_644090 ?auto_644091 ) ) ( AVAILABLE ?auto_644093 ) ( ON ?auto_644090 ?auto_644089 ) ( not ( = ?auto_644089 ?auto_644090 ) ) ( not ( = ?auto_644089 ?auto_644091 ) ) ( TRUCK-AT ?auto_644094 ?auto_644092 ) ( not ( = ?auto_644092 ?auto_644096 ) ) ( HOIST-AT ?auto_644095 ?auto_644092 ) ( LIFTING ?auto_644095 ?auto_644091 ) ( not ( = ?auto_644093 ?auto_644095 ) ) ( ON ?auto_644088 ?auto_644087 ) ( ON ?auto_644089 ?auto_644088 ) ( not ( = ?auto_644087 ?auto_644088 ) ) ( not ( = ?auto_644087 ?auto_644089 ) ) ( not ( = ?auto_644087 ?auto_644090 ) ) ( not ( = ?auto_644087 ?auto_644091 ) ) ( not ( = ?auto_644088 ?auto_644089 ) ) ( not ( = ?auto_644088 ?auto_644090 ) ) ( not ( = ?auto_644088 ?auto_644091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644089 ?auto_644090 ?auto_644091 )
      ( MAKE-4CRATE-VERIFY ?auto_644087 ?auto_644088 ?auto_644089 ?auto_644090 ?auto_644091 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644125 - SURFACE
      ?auto_644126 - SURFACE
      ?auto_644127 - SURFACE
      ?auto_644128 - SURFACE
      ?auto_644129 - SURFACE
    )
    :vars
    (
      ?auto_644134 - HOIST
      ?auto_644131 - PLACE
      ?auto_644135 - TRUCK
      ?auto_644130 - PLACE
      ?auto_644133 - HOIST
      ?auto_644132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644134 ?auto_644131 ) ( SURFACE-AT ?auto_644128 ?auto_644131 ) ( CLEAR ?auto_644128 ) ( IS-CRATE ?auto_644129 ) ( not ( = ?auto_644128 ?auto_644129 ) ) ( AVAILABLE ?auto_644134 ) ( ON ?auto_644128 ?auto_644127 ) ( not ( = ?auto_644127 ?auto_644128 ) ) ( not ( = ?auto_644127 ?auto_644129 ) ) ( TRUCK-AT ?auto_644135 ?auto_644130 ) ( not ( = ?auto_644130 ?auto_644131 ) ) ( HOIST-AT ?auto_644133 ?auto_644130 ) ( not ( = ?auto_644134 ?auto_644133 ) ) ( AVAILABLE ?auto_644133 ) ( SURFACE-AT ?auto_644129 ?auto_644130 ) ( ON ?auto_644129 ?auto_644132 ) ( CLEAR ?auto_644129 ) ( not ( = ?auto_644128 ?auto_644132 ) ) ( not ( = ?auto_644129 ?auto_644132 ) ) ( not ( = ?auto_644127 ?auto_644132 ) ) ( ON ?auto_644126 ?auto_644125 ) ( ON ?auto_644127 ?auto_644126 ) ( not ( = ?auto_644125 ?auto_644126 ) ) ( not ( = ?auto_644125 ?auto_644127 ) ) ( not ( = ?auto_644125 ?auto_644128 ) ) ( not ( = ?auto_644125 ?auto_644129 ) ) ( not ( = ?auto_644125 ?auto_644132 ) ) ( not ( = ?auto_644126 ?auto_644127 ) ) ( not ( = ?auto_644126 ?auto_644128 ) ) ( not ( = ?auto_644126 ?auto_644129 ) ) ( not ( = ?auto_644126 ?auto_644132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644127 ?auto_644128 ?auto_644129 )
      ( MAKE-4CRATE-VERIFY ?auto_644125 ?auto_644126 ?auto_644127 ?auto_644128 ?auto_644129 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644164 - SURFACE
      ?auto_644165 - SURFACE
      ?auto_644166 - SURFACE
      ?auto_644167 - SURFACE
      ?auto_644168 - SURFACE
    )
    :vars
    (
      ?auto_644171 - HOIST
      ?auto_644172 - PLACE
      ?auto_644174 - PLACE
      ?auto_644173 - HOIST
      ?auto_644170 - SURFACE
      ?auto_644169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644171 ?auto_644172 ) ( SURFACE-AT ?auto_644167 ?auto_644172 ) ( CLEAR ?auto_644167 ) ( IS-CRATE ?auto_644168 ) ( not ( = ?auto_644167 ?auto_644168 ) ) ( AVAILABLE ?auto_644171 ) ( ON ?auto_644167 ?auto_644166 ) ( not ( = ?auto_644166 ?auto_644167 ) ) ( not ( = ?auto_644166 ?auto_644168 ) ) ( not ( = ?auto_644174 ?auto_644172 ) ) ( HOIST-AT ?auto_644173 ?auto_644174 ) ( not ( = ?auto_644171 ?auto_644173 ) ) ( AVAILABLE ?auto_644173 ) ( SURFACE-AT ?auto_644168 ?auto_644174 ) ( ON ?auto_644168 ?auto_644170 ) ( CLEAR ?auto_644168 ) ( not ( = ?auto_644167 ?auto_644170 ) ) ( not ( = ?auto_644168 ?auto_644170 ) ) ( not ( = ?auto_644166 ?auto_644170 ) ) ( TRUCK-AT ?auto_644169 ?auto_644172 ) ( ON ?auto_644165 ?auto_644164 ) ( ON ?auto_644166 ?auto_644165 ) ( not ( = ?auto_644164 ?auto_644165 ) ) ( not ( = ?auto_644164 ?auto_644166 ) ) ( not ( = ?auto_644164 ?auto_644167 ) ) ( not ( = ?auto_644164 ?auto_644168 ) ) ( not ( = ?auto_644164 ?auto_644170 ) ) ( not ( = ?auto_644165 ?auto_644166 ) ) ( not ( = ?auto_644165 ?auto_644167 ) ) ( not ( = ?auto_644165 ?auto_644168 ) ) ( not ( = ?auto_644165 ?auto_644170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644166 ?auto_644167 ?auto_644168 )
      ( MAKE-4CRATE-VERIFY ?auto_644164 ?auto_644165 ?auto_644166 ?auto_644167 ?auto_644168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644203 - SURFACE
      ?auto_644204 - SURFACE
      ?auto_644205 - SURFACE
      ?auto_644206 - SURFACE
      ?auto_644207 - SURFACE
    )
    :vars
    (
      ?auto_644213 - HOIST
      ?auto_644208 - PLACE
      ?auto_644210 - PLACE
      ?auto_644212 - HOIST
      ?auto_644211 - SURFACE
      ?auto_644209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644213 ?auto_644208 ) ( IS-CRATE ?auto_644207 ) ( not ( = ?auto_644206 ?auto_644207 ) ) ( not ( = ?auto_644205 ?auto_644206 ) ) ( not ( = ?auto_644205 ?auto_644207 ) ) ( not ( = ?auto_644210 ?auto_644208 ) ) ( HOIST-AT ?auto_644212 ?auto_644210 ) ( not ( = ?auto_644213 ?auto_644212 ) ) ( AVAILABLE ?auto_644212 ) ( SURFACE-AT ?auto_644207 ?auto_644210 ) ( ON ?auto_644207 ?auto_644211 ) ( CLEAR ?auto_644207 ) ( not ( = ?auto_644206 ?auto_644211 ) ) ( not ( = ?auto_644207 ?auto_644211 ) ) ( not ( = ?auto_644205 ?auto_644211 ) ) ( TRUCK-AT ?auto_644209 ?auto_644208 ) ( SURFACE-AT ?auto_644205 ?auto_644208 ) ( CLEAR ?auto_644205 ) ( LIFTING ?auto_644213 ?auto_644206 ) ( IS-CRATE ?auto_644206 ) ( ON ?auto_644204 ?auto_644203 ) ( ON ?auto_644205 ?auto_644204 ) ( not ( = ?auto_644203 ?auto_644204 ) ) ( not ( = ?auto_644203 ?auto_644205 ) ) ( not ( = ?auto_644203 ?auto_644206 ) ) ( not ( = ?auto_644203 ?auto_644207 ) ) ( not ( = ?auto_644203 ?auto_644211 ) ) ( not ( = ?auto_644204 ?auto_644205 ) ) ( not ( = ?auto_644204 ?auto_644206 ) ) ( not ( = ?auto_644204 ?auto_644207 ) ) ( not ( = ?auto_644204 ?auto_644211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644205 ?auto_644206 ?auto_644207 )
      ( MAKE-4CRATE-VERIFY ?auto_644203 ?auto_644204 ?auto_644205 ?auto_644206 ?auto_644207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_644242 - SURFACE
      ?auto_644243 - SURFACE
      ?auto_644244 - SURFACE
      ?auto_644245 - SURFACE
      ?auto_644246 - SURFACE
    )
    :vars
    (
      ?auto_644252 - HOIST
      ?auto_644249 - PLACE
      ?auto_644247 - PLACE
      ?auto_644251 - HOIST
      ?auto_644250 - SURFACE
      ?auto_644248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644252 ?auto_644249 ) ( IS-CRATE ?auto_644246 ) ( not ( = ?auto_644245 ?auto_644246 ) ) ( not ( = ?auto_644244 ?auto_644245 ) ) ( not ( = ?auto_644244 ?auto_644246 ) ) ( not ( = ?auto_644247 ?auto_644249 ) ) ( HOIST-AT ?auto_644251 ?auto_644247 ) ( not ( = ?auto_644252 ?auto_644251 ) ) ( AVAILABLE ?auto_644251 ) ( SURFACE-AT ?auto_644246 ?auto_644247 ) ( ON ?auto_644246 ?auto_644250 ) ( CLEAR ?auto_644246 ) ( not ( = ?auto_644245 ?auto_644250 ) ) ( not ( = ?auto_644246 ?auto_644250 ) ) ( not ( = ?auto_644244 ?auto_644250 ) ) ( TRUCK-AT ?auto_644248 ?auto_644249 ) ( SURFACE-AT ?auto_644244 ?auto_644249 ) ( CLEAR ?auto_644244 ) ( IS-CRATE ?auto_644245 ) ( AVAILABLE ?auto_644252 ) ( IN ?auto_644245 ?auto_644248 ) ( ON ?auto_644243 ?auto_644242 ) ( ON ?auto_644244 ?auto_644243 ) ( not ( = ?auto_644242 ?auto_644243 ) ) ( not ( = ?auto_644242 ?auto_644244 ) ) ( not ( = ?auto_644242 ?auto_644245 ) ) ( not ( = ?auto_644242 ?auto_644246 ) ) ( not ( = ?auto_644242 ?auto_644250 ) ) ( not ( = ?auto_644243 ?auto_644244 ) ) ( not ( = ?auto_644243 ?auto_644245 ) ) ( not ( = ?auto_644243 ?auto_644246 ) ) ( not ( = ?auto_644243 ?auto_644250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644244 ?auto_644245 ?auto_644246 )
      ( MAKE-4CRATE-VERIFY ?auto_644242 ?auto_644243 ?auto_644244 ?auto_644245 ?auto_644246 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644902 - SURFACE
      ?auto_644903 - SURFACE
      ?auto_644904 - SURFACE
      ?auto_644905 - SURFACE
      ?auto_644906 - SURFACE
      ?auto_644907 - SURFACE
    )
    :vars
    (
      ?auto_644909 - HOIST
      ?auto_644908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644909 ?auto_644908 ) ( SURFACE-AT ?auto_644906 ?auto_644908 ) ( CLEAR ?auto_644906 ) ( LIFTING ?auto_644909 ?auto_644907 ) ( IS-CRATE ?auto_644907 ) ( not ( = ?auto_644906 ?auto_644907 ) ) ( ON ?auto_644903 ?auto_644902 ) ( ON ?auto_644904 ?auto_644903 ) ( ON ?auto_644905 ?auto_644904 ) ( ON ?auto_644906 ?auto_644905 ) ( not ( = ?auto_644902 ?auto_644903 ) ) ( not ( = ?auto_644902 ?auto_644904 ) ) ( not ( = ?auto_644902 ?auto_644905 ) ) ( not ( = ?auto_644902 ?auto_644906 ) ) ( not ( = ?auto_644902 ?auto_644907 ) ) ( not ( = ?auto_644903 ?auto_644904 ) ) ( not ( = ?auto_644903 ?auto_644905 ) ) ( not ( = ?auto_644903 ?auto_644906 ) ) ( not ( = ?auto_644903 ?auto_644907 ) ) ( not ( = ?auto_644904 ?auto_644905 ) ) ( not ( = ?auto_644904 ?auto_644906 ) ) ( not ( = ?auto_644904 ?auto_644907 ) ) ( not ( = ?auto_644905 ?auto_644906 ) ) ( not ( = ?auto_644905 ?auto_644907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_644906 ?auto_644907 )
      ( MAKE-5CRATE-VERIFY ?auto_644902 ?auto_644903 ?auto_644904 ?auto_644905 ?auto_644906 ?auto_644907 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644936 - SURFACE
      ?auto_644937 - SURFACE
      ?auto_644938 - SURFACE
      ?auto_644939 - SURFACE
      ?auto_644940 - SURFACE
      ?auto_644941 - SURFACE
    )
    :vars
    (
      ?auto_644942 - HOIST
      ?auto_644944 - PLACE
      ?auto_644943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644942 ?auto_644944 ) ( SURFACE-AT ?auto_644940 ?auto_644944 ) ( CLEAR ?auto_644940 ) ( IS-CRATE ?auto_644941 ) ( not ( = ?auto_644940 ?auto_644941 ) ) ( TRUCK-AT ?auto_644943 ?auto_644944 ) ( AVAILABLE ?auto_644942 ) ( IN ?auto_644941 ?auto_644943 ) ( ON ?auto_644940 ?auto_644939 ) ( not ( = ?auto_644939 ?auto_644940 ) ) ( not ( = ?auto_644939 ?auto_644941 ) ) ( ON ?auto_644937 ?auto_644936 ) ( ON ?auto_644938 ?auto_644937 ) ( ON ?auto_644939 ?auto_644938 ) ( not ( = ?auto_644936 ?auto_644937 ) ) ( not ( = ?auto_644936 ?auto_644938 ) ) ( not ( = ?auto_644936 ?auto_644939 ) ) ( not ( = ?auto_644936 ?auto_644940 ) ) ( not ( = ?auto_644936 ?auto_644941 ) ) ( not ( = ?auto_644937 ?auto_644938 ) ) ( not ( = ?auto_644937 ?auto_644939 ) ) ( not ( = ?auto_644937 ?auto_644940 ) ) ( not ( = ?auto_644937 ?auto_644941 ) ) ( not ( = ?auto_644938 ?auto_644939 ) ) ( not ( = ?auto_644938 ?auto_644940 ) ) ( not ( = ?auto_644938 ?auto_644941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644939 ?auto_644940 ?auto_644941 )
      ( MAKE-5CRATE-VERIFY ?auto_644936 ?auto_644937 ?auto_644938 ?auto_644939 ?auto_644940 ?auto_644941 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644976 - SURFACE
      ?auto_644977 - SURFACE
      ?auto_644978 - SURFACE
      ?auto_644979 - SURFACE
      ?auto_644980 - SURFACE
      ?auto_644981 - SURFACE
    )
    :vars
    (
      ?auto_644983 - HOIST
      ?auto_644982 - PLACE
      ?auto_644984 - TRUCK
      ?auto_644985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644983 ?auto_644982 ) ( SURFACE-AT ?auto_644980 ?auto_644982 ) ( CLEAR ?auto_644980 ) ( IS-CRATE ?auto_644981 ) ( not ( = ?auto_644980 ?auto_644981 ) ) ( AVAILABLE ?auto_644983 ) ( IN ?auto_644981 ?auto_644984 ) ( ON ?auto_644980 ?auto_644979 ) ( not ( = ?auto_644979 ?auto_644980 ) ) ( not ( = ?auto_644979 ?auto_644981 ) ) ( TRUCK-AT ?auto_644984 ?auto_644985 ) ( not ( = ?auto_644985 ?auto_644982 ) ) ( ON ?auto_644977 ?auto_644976 ) ( ON ?auto_644978 ?auto_644977 ) ( ON ?auto_644979 ?auto_644978 ) ( not ( = ?auto_644976 ?auto_644977 ) ) ( not ( = ?auto_644976 ?auto_644978 ) ) ( not ( = ?auto_644976 ?auto_644979 ) ) ( not ( = ?auto_644976 ?auto_644980 ) ) ( not ( = ?auto_644976 ?auto_644981 ) ) ( not ( = ?auto_644977 ?auto_644978 ) ) ( not ( = ?auto_644977 ?auto_644979 ) ) ( not ( = ?auto_644977 ?auto_644980 ) ) ( not ( = ?auto_644977 ?auto_644981 ) ) ( not ( = ?auto_644978 ?auto_644979 ) ) ( not ( = ?auto_644978 ?auto_644980 ) ) ( not ( = ?auto_644978 ?auto_644981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644979 ?auto_644980 ?auto_644981 )
      ( MAKE-5CRATE-VERIFY ?auto_644976 ?auto_644977 ?auto_644978 ?auto_644979 ?auto_644980 ?auto_644981 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645021 - SURFACE
      ?auto_645022 - SURFACE
      ?auto_645023 - SURFACE
      ?auto_645024 - SURFACE
      ?auto_645025 - SURFACE
      ?auto_645026 - SURFACE
    )
    :vars
    (
      ?auto_645028 - HOIST
      ?auto_645029 - PLACE
      ?auto_645030 - TRUCK
      ?auto_645027 - PLACE
      ?auto_645031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_645028 ?auto_645029 ) ( SURFACE-AT ?auto_645025 ?auto_645029 ) ( CLEAR ?auto_645025 ) ( IS-CRATE ?auto_645026 ) ( not ( = ?auto_645025 ?auto_645026 ) ) ( AVAILABLE ?auto_645028 ) ( ON ?auto_645025 ?auto_645024 ) ( not ( = ?auto_645024 ?auto_645025 ) ) ( not ( = ?auto_645024 ?auto_645026 ) ) ( TRUCK-AT ?auto_645030 ?auto_645027 ) ( not ( = ?auto_645027 ?auto_645029 ) ) ( HOIST-AT ?auto_645031 ?auto_645027 ) ( LIFTING ?auto_645031 ?auto_645026 ) ( not ( = ?auto_645028 ?auto_645031 ) ) ( ON ?auto_645022 ?auto_645021 ) ( ON ?auto_645023 ?auto_645022 ) ( ON ?auto_645024 ?auto_645023 ) ( not ( = ?auto_645021 ?auto_645022 ) ) ( not ( = ?auto_645021 ?auto_645023 ) ) ( not ( = ?auto_645021 ?auto_645024 ) ) ( not ( = ?auto_645021 ?auto_645025 ) ) ( not ( = ?auto_645021 ?auto_645026 ) ) ( not ( = ?auto_645022 ?auto_645023 ) ) ( not ( = ?auto_645022 ?auto_645024 ) ) ( not ( = ?auto_645022 ?auto_645025 ) ) ( not ( = ?auto_645022 ?auto_645026 ) ) ( not ( = ?auto_645023 ?auto_645024 ) ) ( not ( = ?auto_645023 ?auto_645025 ) ) ( not ( = ?auto_645023 ?auto_645026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645024 ?auto_645025 ?auto_645026 )
      ( MAKE-5CRATE-VERIFY ?auto_645021 ?auto_645022 ?auto_645023 ?auto_645024 ?auto_645025 ?auto_645026 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645071 - SURFACE
      ?auto_645072 - SURFACE
      ?auto_645073 - SURFACE
      ?auto_645074 - SURFACE
      ?auto_645075 - SURFACE
      ?auto_645076 - SURFACE
    )
    :vars
    (
      ?auto_645077 - HOIST
      ?auto_645079 - PLACE
      ?auto_645081 - TRUCK
      ?auto_645080 - PLACE
      ?auto_645078 - HOIST
      ?auto_645082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645077 ?auto_645079 ) ( SURFACE-AT ?auto_645075 ?auto_645079 ) ( CLEAR ?auto_645075 ) ( IS-CRATE ?auto_645076 ) ( not ( = ?auto_645075 ?auto_645076 ) ) ( AVAILABLE ?auto_645077 ) ( ON ?auto_645075 ?auto_645074 ) ( not ( = ?auto_645074 ?auto_645075 ) ) ( not ( = ?auto_645074 ?auto_645076 ) ) ( TRUCK-AT ?auto_645081 ?auto_645080 ) ( not ( = ?auto_645080 ?auto_645079 ) ) ( HOIST-AT ?auto_645078 ?auto_645080 ) ( not ( = ?auto_645077 ?auto_645078 ) ) ( AVAILABLE ?auto_645078 ) ( SURFACE-AT ?auto_645076 ?auto_645080 ) ( ON ?auto_645076 ?auto_645082 ) ( CLEAR ?auto_645076 ) ( not ( = ?auto_645075 ?auto_645082 ) ) ( not ( = ?auto_645076 ?auto_645082 ) ) ( not ( = ?auto_645074 ?auto_645082 ) ) ( ON ?auto_645072 ?auto_645071 ) ( ON ?auto_645073 ?auto_645072 ) ( ON ?auto_645074 ?auto_645073 ) ( not ( = ?auto_645071 ?auto_645072 ) ) ( not ( = ?auto_645071 ?auto_645073 ) ) ( not ( = ?auto_645071 ?auto_645074 ) ) ( not ( = ?auto_645071 ?auto_645075 ) ) ( not ( = ?auto_645071 ?auto_645076 ) ) ( not ( = ?auto_645071 ?auto_645082 ) ) ( not ( = ?auto_645072 ?auto_645073 ) ) ( not ( = ?auto_645072 ?auto_645074 ) ) ( not ( = ?auto_645072 ?auto_645075 ) ) ( not ( = ?auto_645072 ?auto_645076 ) ) ( not ( = ?auto_645072 ?auto_645082 ) ) ( not ( = ?auto_645073 ?auto_645074 ) ) ( not ( = ?auto_645073 ?auto_645075 ) ) ( not ( = ?auto_645073 ?auto_645076 ) ) ( not ( = ?auto_645073 ?auto_645082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645074 ?auto_645075 ?auto_645076 )
      ( MAKE-5CRATE-VERIFY ?auto_645071 ?auto_645072 ?auto_645073 ?auto_645074 ?auto_645075 ?auto_645076 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645122 - SURFACE
      ?auto_645123 - SURFACE
      ?auto_645124 - SURFACE
      ?auto_645125 - SURFACE
      ?auto_645126 - SURFACE
      ?auto_645127 - SURFACE
    )
    :vars
    (
      ?auto_645130 - HOIST
      ?auto_645131 - PLACE
      ?auto_645132 - PLACE
      ?auto_645128 - HOIST
      ?auto_645129 - SURFACE
      ?auto_645133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645130 ?auto_645131 ) ( SURFACE-AT ?auto_645126 ?auto_645131 ) ( CLEAR ?auto_645126 ) ( IS-CRATE ?auto_645127 ) ( not ( = ?auto_645126 ?auto_645127 ) ) ( AVAILABLE ?auto_645130 ) ( ON ?auto_645126 ?auto_645125 ) ( not ( = ?auto_645125 ?auto_645126 ) ) ( not ( = ?auto_645125 ?auto_645127 ) ) ( not ( = ?auto_645132 ?auto_645131 ) ) ( HOIST-AT ?auto_645128 ?auto_645132 ) ( not ( = ?auto_645130 ?auto_645128 ) ) ( AVAILABLE ?auto_645128 ) ( SURFACE-AT ?auto_645127 ?auto_645132 ) ( ON ?auto_645127 ?auto_645129 ) ( CLEAR ?auto_645127 ) ( not ( = ?auto_645126 ?auto_645129 ) ) ( not ( = ?auto_645127 ?auto_645129 ) ) ( not ( = ?auto_645125 ?auto_645129 ) ) ( TRUCK-AT ?auto_645133 ?auto_645131 ) ( ON ?auto_645123 ?auto_645122 ) ( ON ?auto_645124 ?auto_645123 ) ( ON ?auto_645125 ?auto_645124 ) ( not ( = ?auto_645122 ?auto_645123 ) ) ( not ( = ?auto_645122 ?auto_645124 ) ) ( not ( = ?auto_645122 ?auto_645125 ) ) ( not ( = ?auto_645122 ?auto_645126 ) ) ( not ( = ?auto_645122 ?auto_645127 ) ) ( not ( = ?auto_645122 ?auto_645129 ) ) ( not ( = ?auto_645123 ?auto_645124 ) ) ( not ( = ?auto_645123 ?auto_645125 ) ) ( not ( = ?auto_645123 ?auto_645126 ) ) ( not ( = ?auto_645123 ?auto_645127 ) ) ( not ( = ?auto_645123 ?auto_645129 ) ) ( not ( = ?auto_645124 ?auto_645125 ) ) ( not ( = ?auto_645124 ?auto_645126 ) ) ( not ( = ?auto_645124 ?auto_645127 ) ) ( not ( = ?auto_645124 ?auto_645129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645125 ?auto_645126 ?auto_645127 )
      ( MAKE-5CRATE-VERIFY ?auto_645122 ?auto_645123 ?auto_645124 ?auto_645125 ?auto_645126 ?auto_645127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645173 - SURFACE
      ?auto_645174 - SURFACE
      ?auto_645175 - SURFACE
      ?auto_645176 - SURFACE
      ?auto_645177 - SURFACE
      ?auto_645178 - SURFACE
    )
    :vars
    (
      ?auto_645180 - HOIST
      ?auto_645184 - PLACE
      ?auto_645181 - PLACE
      ?auto_645179 - HOIST
      ?auto_645182 - SURFACE
      ?auto_645183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645180 ?auto_645184 ) ( IS-CRATE ?auto_645178 ) ( not ( = ?auto_645177 ?auto_645178 ) ) ( not ( = ?auto_645176 ?auto_645177 ) ) ( not ( = ?auto_645176 ?auto_645178 ) ) ( not ( = ?auto_645181 ?auto_645184 ) ) ( HOIST-AT ?auto_645179 ?auto_645181 ) ( not ( = ?auto_645180 ?auto_645179 ) ) ( AVAILABLE ?auto_645179 ) ( SURFACE-AT ?auto_645178 ?auto_645181 ) ( ON ?auto_645178 ?auto_645182 ) ( CLEAR ?auto_645178 ) ( not ( = ?auto_645177 ?auto_645182 ) ) ( not ( = ?auto_645178 ?auto_645182 ) ) ( not ( = ?auto_645176 ?auto_645182 ) ) ( TRUCK-AT ?auto_645183 ?auto_645184 ) ( SURFACE-AT ?auto_645176 ?auto_645184 ) ( CLEAR ?auto_645176 ) ( LIFTING ?auto_645180 ?auto_645177 ) ( IS-CRATE ?auto_645177 ) ( ON ?auto_645174 ?auto_645173 ) ( ON ?auto_645175 ?auto_645174 ) ( ON ?auto_645176 ?auto_645175 ) ( not ( = ?auto_645173 ?auto_645174 ) ) ( not ( = ?auto_645173 ?auto_645175 ) ) ( not ( = ?auto_645173 ?auto_645176 ) ) ( not ( = ?auto_645173 ?auto_645177 ) ) ( not ( = ?auto_645173 ?auto_645178 ) ) ( not ( = ?auto_645173 ?auto_645182 ) ) ( not ( = ?auto_645174 ?auto_645175 ) ) ( not ( = ?auto_645174 ?auto_645176 ) ) ( not ( = ?auto_645174 ?auto_645177 ) ) ( not ( = ?auto_645174 ?auto_645178 ) ) ( not ( = ?auto_645174 ?auto_645182 ) ) ( not ( = ?auto_645175 ?auto_645176 ) ) ( not ( = ?auto_645175 ?auto_645177 ) ) ( not ( = ?auto_645175 ?auto_645178 ) ) ( not ( = ?auto_645175 ?auto_645182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645176 ?auto_645177 ?auto_645178 )
      ( MAKE-5CRATE-VERIFY ?auto_645173 ?auto_645174 ?auto_645175 ?auto_645176 ?auto_645177 ?auto_645178 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645224 - SURFACE
      ?auto_645225 - SURFACE
      ?auto_645226 - SURFACE
      ?auto_645227 - SURFACE
      ?auto_645228 - SURFACE
      ?auto_645229 - SURFACE
    )
    :vars
    (
      ?auto_645232 - HOIST
      ?auto_645231 - PLACE
      ?auto_645235 - PLACE
      ?auto_645230 - HOIST
      ?auto_645234 - SURFACE
      ?auto_645233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645232 ?auto_645231 ) ( IS-CRATE ?auto_645229 ) ( not ( = ?auto_645228 ?auto_645229 ) ) ( not ( = ?auto_645227 ?auto_645228 ) ) ( not ( = ?auto_645227 ?auto_645229 ) ) ( not ( = ?auto_645235 ?auto_645231 ) ) ( HOIST-AT ?auto_645230 ?auto_645235 ) ( not ( = ?auto_645232 ?auto_645230 ) ) ( AVAILABLE ?auto_645230 ) ( SURFACE-AT ?auto_645229 ?auto_645235 ) ( ON ?auto_645229 ?auto_645234 ) ( CLEAR ?auto_645229 ) ( not ( = ?auto_645228 ?auto_645234 ) ) ( not ( = ?auto_645229 ?auto_645234 ) ) ( not ( = ?auto_645227 ?auto_645234 ) ) ( TRUCK-AT ?auto_645233 ?auto_645231 ) ( SURFACE-AT ?auto_645227 ?auto_645231 ) ( CLEAR ?auto_645227 ) ( IS-CRATE ?auto_645228 ) ( AVAILABLE ?auto_645232 ) ( IN ?auto_645228 ?auto_645233 ) ( ON ?auto_645225 ?auto_645224 ) ( ON ?auto_645226 ?auto_645225 ) ( ON ?auto_645227 ?auto_645226 ) ( not ( = ?auto_645224 ?auto_645225 ) ) ( not ( = ?auto_645224 ?auto_645226 ) ) ( not ( = ?auto_645224 ?auto_645227 ) ) ( not ( = ?auto_645224 ?auto_645228 ) ) ( not ( = ?auto_645224 ?auto_645229 ) ) ( not ( = ?auto_645224 ?auto_645234 ) ) ( not ( = ?auto_645225 ?auto_645226 ) ) ( not ( = ?auto_645225 ?auto_645227 ) ) ( not ( = ?auto_645225 ?auto_645228 ) ) ( not ( = ?auto_645225 ?auto_645229 ) ) ( not ( = ?auto_645225 ?auto_645234 ) ) ( not ( = ?auto_645226 ?auto_645227 ) ) ( not ( = ?auto_645226 ?auto_645228 ) ) ( not ( = ?auto_645226 ?auto_645229 ) ) ( not ( = ?auto_645226 ?auto_645234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645227 ?auto_645228 ?auto_645229 )
      ( MAKE-5CRATE-VERIFY ?auto_645224 ?auto_645225 ?auto_645226 ?auto_645227 ?auto_645228 ?auto_645229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645236 - SURFACE
      ?auto_645237 - SURFACE
    )
    :vars
    (
      ?auto_645241 - HOIST
      ?auto_645239 - PLACE
      ?auto_645240 - SURFACE
      ?auto_645244 - PLACE
      ?auto_645238 - HOIST
      ?auto_645243 - SURFACE
      ?auto_645242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645241 ?auto_645239 ) ( IS-CRATE ?auto_645237 ) ( not ( = ?auto_645236 ?auto_645237 ) ) ( not ( = ?auto_645240 ?auto_645236 ) ) ( not ( = ?auto_645240 ?auto_645237 ) ) ( not ( = ?auto_645244 ?auto_645239 ) ) ( HOIST-AT ?auto_645238 ?auto_645244 ) ( not ( = ?auto_645241 ?auto_645238 ) ) ( AVAILABLE ?auto_645238 ) ( SURFACE-AT ?auto_645237 ?auto_645244 ) ( ON ?auto_645237 ?auto_645243 ) ( CLEAR ?auto_645237 ) ( not ( = ?auto_645236 ?auto_645243 ) ) ( not ( = ?auto_645237 ?auto_645243 ) ) ( not ( = ?auto_645240 ?auto_645243 ) ) ( SURFACE-AT ?auto_645240 ?auto_645239 ) ( CLEAR ?auto_645240 ) ( IS-CRATE ?auto_645236 ) ( AVAILABLE ?auto_645241 ) ( IN ?auto_645236 ?auto_645242 ) ( TRUCK-AT ?auto_645242 ?auto_645244 ) )
    :subtasks
    ( ( !DRIVE ?auto_645242 ?auto_645244 ?auto_645239 )
      ( MAKE-2CRATE ?auto_645240 ?auto_645236 ?auto_645237 )
      ( MAKE-1CRATE-VERIFY ?auto_645236 ?auto_645237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_645245 - SURFACE
      ?auto_645246 - SURFACE
      ?auto_645247 - SURFACE
    )
    :vars
    (
      ?auto_645253 - HOIST
      ?auto_645250 - PLACE
      ?auto_645249 - PLACE
      ?auto_645248 - HOIST
      ?auto_645251 - SURFACE
      ?auto_645252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645253 ?auto_645250 ) ( IS-CRATE ?auto_645247 ) ( not ( = ?auto_645246 ?auto_645247 ) ) ( not ( = ?auto_645245 ?auto_645246 ) ) ( not ( = ?auto_645245 ?auto_645247 ) ) ( not ( = ?auto_645249 ?auto_645250 ) ) ( HOIST-AT ?auto_645248 ?auto_645249 ) ( not ( = ?auto_645253 ?auto_645248 ) ) ( AVAILABLE ?auto_645248 ) ( SURFACE-AT ?auto_645247 ?auto_645249 ) ( ON ?auto_645247 ?auto_645251 ) ( CLEAR ?auto_645247 ) ( not ( = ?auto_645246 ?auto_645251 ) ) ( not ( = ?auto_645247 ?auto_645251 ) ) ( not ( = ?auto_645245 ?auto_645251 ) ) ( SURFACE-AT ?auto_645245 ?auto_645250 ) ( CLEAR ?auto_645245 ) ( IS-CRATE ?auto_645246 ) ( AVAILABLE ?auto_645253 ) ( IN ?auto_645246 ?auto_645252 ) ( TRUCK-AT ?auto_645252 ?auto_645249 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645246 ?auto_645247 )
      ( MAKE-2CRATE-VERIFY ?auto_645245 ?auto_645246 ?auto_645247 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_645254 - SURFACE
      ?auto_645255 - SURFACE
      ?auto_645256 - SURFACE
      ?auto_645257 - SURFACE
    )
    :vars
    (
      ?auto_645259 - HOIST
      ?auto_645263 - PLACE
      ?auto_645261 - PLACE
      ?auto_645262 - HOIST
      ?auto_645258 - SURFACE
      ?auto_645260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645259 ?auto_645263 ) ( IS-CRATE ?auto_645257 ) ( not ( = ?auto_645256 ?auto_645257 ) ) ( not ( = ?auto_645255 ?auto_645256 ) ) ( not ( = ?auto_645255 ?auto_645257 ) ) ( not ( = ?auto_645261 ?auto_645263 ) ) ( HOIST-AT ?auto_645262 ?auto_645261 ) ( not ( = ?auto_645259 ?auto_645262 ) ) ( AVAILABLE ?auto_645262 ) ( SURFACE-AT ?auto_645257 ?auto_645261 ) ( ON ?auto_645257 ?auto_645258 ) ( CLEAR ?auto_645257 ) ( not ( = ?auto_645256 ?auto_645258 ) ) ( not ( = ?auto_645257 ?auto_645258 ) ) ( not ( = ?auto_645255 ?auto_645258 ) ) ( SURFACE-AT ?auto_645255 ?auto_645263 ) ( CLEAR ?auto_645255 ) ( IS-CRATE ?auto_645256 ) ( AVAILABLE ?auto_645259 ) ( IN ?auto_645256 ?auto_645260 ) ( TRUCK-AT ?auto_645260 ?auto_645261 ) ( ON ?auto_645255 ?auto_645254 ) ( not ( = ?auto_645254 ?auto_645255 ) ) ( not ( = ?auto_645254 ?auto_645256 ) ) ( not ( = ?auto_645254 ?auto_645257 ) ) ( not ( = ?auto_645254 ?auto_645258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645255 ?auto_645256 ?auto_645257 )
      ( MAKE-3CRATE-VERIFY ?auto_645254 ?auto_645255 ?auto_645256 ?auto_645257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_645264 - SURFACE
      ?auto_645265 - SURFACE
      ?auto_645266 - SURFACE
      ?auto_645267 - SURFACE
      ?auto_645268 - SURFACE
    )
    :vars
    (
      ?auto_645270 - HOIST
      ?auto_645274 - PLACE
      ?auto_645272 - PLACE
      ?auto_645273 - HOIST
      ?auto_645269 - SURFACE
      ?auto_645271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645270 ?auto_645274 ) ( IS-CRATE ?auto_645268 ) ( not ( = ?auto_645267 ?auto_645268 ) ) ( not ( = ?auto_645266 ?auto_645267 ) ) ( not ( = ?auto_645266 ?auto_645268 ) ) ( not ( = ?auto_645272 ?auto_645274 ) ) ( HOIST-AT ?auto_645273 ?auto_645272 ) ( not ( = ?auto_645270 ?auto_645273 ) ) ( AVAILABLE ?auto_645273 ) ( SURFACE-AT ?auto_645268 ?auto_645272 ) ( ON ?auto_645268 ?auto_645269 ) ( CLEAR ?auto_645268 ) ( not ( = ?auto_645267 ?auto_645269 ) ) ( not ( = ?auto_645268 ?auto_645269 ) ) ( not ( = ?auto_645266 ?auto_645269 ) ) ( SURFACE-AT ?auto_645266 ?auto_645274 ) ( CLEAR ?auto_645266 ) ( IS-CRATE ?auto_645267 ) ( AVAILABLE ?auto_645270 ) ( IN ?auto_645267 ?auto_645271 ) ( TRUCK-AT ?auto_645271 ?auto_645272 ) ( ON ?auto_645265 ?auto_645264 ) ( ON ?auto_645266 ?auto_645265 ) ( not ( = ?auto_645264 ?auto_645265 ) ) ( not ( = ?auto_645264 ?auto_645266 ) ) ( not ( = ?auto_645264 ?auto_645267 ) ) ( not ( = ?auto_645264 ?auto_645268 ) ) ( not ( = ?auto_645264 ?auto_645269 ) ) ( not ( = ?auto_645265 ?auto_645266 ) ) ( not ( = ?auto_645265 ?auto_645267 ) ) ( not ( = ?auto_645265 ?auto_645268 ) ) ( not ( = ?auto_645265 ?auto_645269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645266 ?auto_645267 ?auto_645268 )
      ( MAKE-4CRATE-VERIFY ?auto_645264 ?auto_645265 ?auto_645266 ?auto_645267 ?auto_645268 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645275 - SURFACE
      ?auto_645276 - SURFACE
      ?auto_645277 - SURFACE
      ?auto_645278 - SURFACE
      ?auto_645279 - SURFACE
      ?auto_645280 - SURFACE
    )
    :vars
    (
      ?auto_645282 - HOIST
      ?auto_645286 - PLACE
      ?auto_645284 - PLACE
      ?auto_645285 - HOIST
      ?auto_645281 - SURFACE
      ?auto_645283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645282 ?auto_645286 ) ( IS-CRATE ?auto_645280 ) ( not ( = ?auto_645279 ?auto_645280 ) ) ( not ( = ?auto_645278 ?auto_645279 ) ) ( not ( = ?auto_645278 ?auto_645280 ) ) ( not ( = ?auto_645284 ?auto_645286 ) ) ( HOIST-AT ?auto_645285 ?auto_645284 ) ( not ( = ?auto_645282 ?auto_645285 ) ) ( AVAILABLE ?auto_645285 ) ( SURFACE-AT ?auto_645280 ?auto_645284 ) ( ON ?auto_645280 ?auto_645281 ) ( CLEAR ?auto_645280 ) ( not ( = ?auto_645279 ?auto_645281 ) ) ( not ( = ?auto_645280 ?auto_645281 ) ) ( not ( = ?auto_645278 ?auto_645281 ) ) ( SURFACE-AT ?auto_645278 ?auto_645286 ) ( CLEAR ?auto_645278 ) ( IS-CRATE ?auto_645279 ) ( AVAILABLE ?auto_645282 ) ( IN ?auto_645279 ?auto_645283 ) ( TRUCK-AT ?auto_645283 ?auto_645284 ) ( ON ?auto_645276 ?auto_645275 ) ( ON ?auto_645277 ?auto_645276 ) ( ON ?auto_645278 ?auto_645277 ) ( not ( = ?auto_645275 ?auto_645276 ) ) ( not ( = ?auto_645275 ?auto_645277 ) ) ( not ( = ?auto_645275 ?auto_645278 ) ) ( not ( = ?auto_645275 ?auto_645279 ) ) ( not ( = ?auto_645275 ?auto_645280 ) ) ( not ( = ?auto_645275 ?auto_645281 ) ) ( not ( = ?auto_645276 ?auto_645277 ) ) ( not ( = ?auto_645276 ?auto_645278 ) ) ( not ( = ?auto_645276 ?auto_645279 ) ) ( not ( = ?auto_645276 ?auto_645280 ) ) ( not ( = ?auto_645276 ?auto_645281 ) ) ( not ( = ?auto_645277 ?auto_645278 ) ) ( not ( = ?auto_645277 ?auto_645279 ) ) ( not ( = ?auto_645277 ?auto_645280 ) ) ( not ( = ?auto_645277 ?auto_645281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645278 ?auto_645279 ?auto_645280 )
      ( MAKE-5CRATE-VERIFY ?auto_645275 ?auto_645276 ?auto_645277 ?auto_645278 ?auto_645279 ?auto_645280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645287 - SURFACE
      ?auto_645288 - SURFACE
    )
    :vars
    (
      ?auto_645291 - HOIST
      ?auto_645295 - PLACE
      ?auto_645290 - SURFACE
      ?auto_645293 - PLACE
      ?auto_645294 - HOIST
      ?auto_645289 - SURFACE
      ?auto_645292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645291 ?auto_645295 ) ( IS-CRATE ?auto_645288 ) ( not ( = ?auto_645287 ?auto_645288 ) ) ( not ( = ?auto_645290 ?auto_645287 ) ) ( not ( = ?auto_645290 ?auto_645288 ) ) ( not ( = ?auto_645293 ?auto_645295 ) ) ( HOIST-AT ?auto_645294 ?auto_645293 ) ( not ( = ?auto_645291 ?auto_645294 ) ) ( SURFACE-AT ?auto_645288 ?auto_645293 ) ( ON ?auto_645288 ?auto_645289 ) ( CLEAR ?auto_645288 ) ( not ( = ?auto_645287 ?auto_645289 ) ) ( not ( = ?auto_645288 ?auto_645289 ) ) ( not ( = ?auto_645290 ?auto_645289 ) ) ( SURFACE-AT ?auto_645290 ?auto_645295 ) ( CLEAR ?auto_645290 ) ( IS-CRATE ?auto_645287 ) ( AVAILABLE ?auto_645291 ) ( TRUCK-AT ?auto_645292 ?auto_645293 ) ( LIFTING ?auto_645294 ?auto_645287 ) )
    :subtasks
    ( ( !LOAD ?auto_645294 ?auto_645287 ?auto_645292 ?auto_645293 )
      ( MAKE-2CRATE ?auto_645290 ?auto_645287 ?auto_645288 )
      ( MAKE-1CRATE-VERIFY ?auto_645287 ?auto_645288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_645296 - SURFACE
      ?auto_645297 - SURFACE
      ?auto_645298 - SURFACE
    )
    :vars
    (
      ?auto_645302 - HOIST
      ?auto_645304 - PLACE
      ?auto_645303 - PLACE
      ?auto_645301 - HOIST
      ?auto_645299 - SURFACE
      ?auto_645300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645302 ?auto_645304 ) ( IS-CRATE ?auto_645298 ) ( not ( = ?auto_645297 ?auto_645298 ) ) ( not ( = ?auto_645296 ?auto_645297 ) ) ( not ( = ?auto_645296 ?auto_645298 ) ) ( not ( = ?auto_645303 ?auto_645304 ) ) ( HOIST-AT ?auto_645301 ?auto_645303 ) ( not ( = ?auto_645302 ?auto_645301 ) ) ( SURFACE-AT ?auto_645298 ?auto_645303 ) ( ON ?auto_645298 ?auto_645299 ) ( CLEAR ?auto_645298 ) ( not ( = ?auto_645297 ?auto_645299 ) ) ( not ( = ?auto_645298 ?auto_645299 ) ) ( not ( = ?auto_645296 ?auto_645299 ) ) ( SURFACE-AT ?auto_645296 ?auto_645304 ) ( CLEAR ?auto_645296 ) ( IS-CRATE ?auto_645297 ) ( AVAILABLE ?auto_645302 ) ( TRUCK-AT ?auto_645300 ?auto_645303 ) ( LIFTING ?auto_645301 ?auto_645297 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645297 ?auto_645298 )
      ( MAKE-2CRATE-VERIFY ?auto_645296 ?auto_645297 ?auto_645298 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_645305 - SURFACE
      ?auto_645306 - SURFACE
      ?auto_645307 - SURFACE
      ?auto_645308 - SURFACE
    )
    :vars
    (
      ?auto_645314 - HOIST
      ?auto_645309 - PLACE
      ?auto_645311 - PLACE
      ?auto_645310 - HOIST
      ?auto_645313 - SURFACE
      ?auto_645312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645314 ?auto_645309 ) ( IS-CRATE ?auto_645308 ) ( not ( = ?auto_645307 ?auto_645308 ) ) ( not ( = ?auto_645306 ?auto_645307 ) ) ( not ( = ?auto_645306 ?auto_645308 ) ) ( not ( = ?auto_645311 ?auto_645309 ) ) ( HOIST-AT ?auto_645310 ?auto_645311 ) ( not ( = ?auto_645314 ?auto_645310 ) ) ( SURFACE-AT ?auto_645308 ?auto_645311 ) ( ON ?auto_645308 ?auto_645313 ) ( CLEAR ?auto_645308 ) ( not ( = ?auto_645307 ?auto_645313 ) ) ( not ( = ?auto_645308 ?auto_645313 ) ) ( not ( = ?auto_645306 ?auto_645313 ) ) ( SURFACE-AT ?auto_645306 ?auto_645309 ) ( CLEAR ?auto_645306 ) ( IS-CRATE ?auto_645307 ) ( AVAILABLE ?auto_645314 ) ( TRUCK-AT ?auto_645312 ?auto_645311 ) ( LIFTING ?auto_645310 ?auto_645307 ) ( ON ?auto_645306 ?auto_645305 ) ( not ( = ?auto_645305 ?auto_645306 ) ) ( not ( = ?auto_645305 ?auto_645307 ) ) ( not ( = ?auto_645305 ?auto_645308 ) ) ( not ( = ?auto_645305 ?auto_645313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645306 ?auto_645307 ?auto_645308 )
      ( MAKE-3CRATE-VERIFY ?auto_645305 ?auto_645306 ?auto_645307 ?auto_645308 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_645315 - SURFACE
      ?auto_645316 - SURFACE
      ?auto_645317 - SURFACE
      ?auto_645318 - SURFACE
      ?auto_645319 - SURFACE
    )
    :vars
    (
      ?auto_645325 - HOIST
      ?auto_645320 - PLACE
      ?auto_645322 - PLACE
      ?auto_645321 - HOIST
      ?auto_645324 - SURFACE
      ?auto_645323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645325 ?auto_645320 ) ( IS-CRATE ?auto_645319 ) ( not ( = ?auto_645318 ?auto_645319 ) ) ( not ( = ?auto_645317 ?auto_645318 ) ) ( not ( = ?auto_645317 ?auto_645319 ) ) ( not ( = ?auto_645322 ?auto_645320 ) ) ( HOIST-AT ?auto_645321 ?auto_645322 ) ( not ( = ?auto_645325 ?auto_645321 ) ) ( SURFACE-AT ?auto_645319 ?auto_645322 ) ( ON ?auto_645319 ?auto_645324 ) ( CLEAR ?auto_645319 ) ( not ( = ?auto_645318 ?auto_645324 ) ) ( not ( = ?auto_645319 ?auto_645324 ) ) ( not ( = ?auto_645317 ?auto_645324 ) ) ( SURFACE-AT ?auto_645317 ?auto_645320 ) ( CLEAR ?auto_645317 ) ( IS-CRATE ?auto_645318 ) ( AVAILABLE ?auto_645325 ) ( TRUCK-AT ?auto_645323 ?auto_645322 ) ( LIFTING ?auto_645321 ?auto_645318 ) ( ON ?auto_645316 ?auto_645315 ) ( ON ?auto_645317 ?auto_645316 ) ( not ( = ?auto_645315 ?auto_645316 ) ) ( not ( = ?auto_645315 ?auto_645317 ) ) ( not ( = ?auto_645315 ?auto_645318 ) ) ( not ( = ?auto_645315 ?auto_645319 ) ) ( not ( = ?auto_645315 ?auto_645324 ) ) ( not ( = ?auto_645316 ?auto_645317 ) ) ( not ( = ?auto_645316 ?auto_645318 ) ) ( not ( = ?auto_645316 ?auto_645319 ) ) ( not ( = ?auto_645316 ?auto_645324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645317 ?auto_645318 ?auto_645319 )
      ( MAKE-4CRATE-VERIFY ?auto_645315 ?auto_645316 ?auto_645317 ?auto_645318 ?auto_645319 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645326 - SURFACE
      ?auto_645327 - SURFACE
      ?auto_645328 - SURFACE
      ?auto_645329 - SURFACE
      ?auto_645330 - SURFACE
      ?auto_645331 - SURFACE
    )
    :vars
    (
      ?auto_645337 - HOIST
      ?auto_645332 - PLACE
      ?auto_645334 - PLACE
      ?auto_645333 - HOIST
      ?auto_645336 - SURFACE
      ?auto_645335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645337 ?auto_645332 ) ( IS-CRATE ?auto_645331 ) ( not ( = ?auto_645330 ?auto_645331 ) ) ( not ( = ?auto_645329 ?auto_645330 ) ) ( not ( = ?auto_645329 ?auto_645331 ) ) ( not ( = ?auto_645334 ?auto_645332 ) ) ( HOIST-AT ?auto_645333 ?auto_645334 ) ( not ( = ?auto_645337 ?auto_645333 ) ) ( SURFACE-AT ?auto_645331 ?auto_645334 ) ( ON ?auto_645331 ?auto_645336 ) ( CLEAR ?auto_645331 ) ( not ( = ?auto_645330 ?auto_645336 ) ) ( not ( = ?auto_645331 ?auto_645336 ) ) ( not ( = ?auto_645329 ?auto_645336 ) ) ( SURFACE-AT ?auto_645329 ?auto_645332 ) ( CLEAR ?auto_645329 ) ( IS-CRATE ?auto_645330 ) ( AVAILABLE ?auto_645337 ) ( TRUCK-AT ?auto_645335 ?auto_645334 ) ( LIFTING ?auto_645333 ?auto_645330 ) ( ON ?auto_645327 ?auto_645326 ) ( ON ?auto_645328 ?auto_645327 ) ( ON ?auto_645329 ?auto_645328 ) ( not ( = ?auto_645326 ?auto_645327 ) ) ( not ( = ?auto_645326 ?auto_645328 ) ) ( not ( = ?auto_645326 ?auto_645329 ) ) ( not ( = ?auto_645326 ?auto_645330 ) ) ( not ( = ?auto_645326 ?auto_645331 ) ) ( not ( = ?auto_645326 ?auto_645336 ) ) ( not ( = ?auto_645327 ?auto_645328 ) ) ( not ( = ?auto_645327 ?auto_645329 ) ) ( not ( = ?auto_645327 ?auto_645330 ) ) ( not ( = ?auto_645327 ?auto_645331 ) ) ( not ( = ?auto_645327 ?auto_645336 ) ) ( not ( = ?auto_645328 ?auto_645329 ) ) ( not ( = ?auto_645328 ?auto_645330 ) ) ( not ( = ?auto_645328 ?auto_645331 ) ) ( not ( = ?auto_645328 ?auto_645336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645329 ?auto_645330 ?auto_645331 )
      ( MAKE-5CRATE-VERIFY ?auto_645326 ?auto_645327 ?auto_645328 ?auto_645329 ?auto_645330 ?auto_645331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645338 - SURFACE
      ?auto_645339 - SURFACE
    )
    :vars
    (
      ?auto_645346 - HOIST
      ?auto_645341 - PLACE
      ?auto_645340 - SURFACE
      ?auto_645343 - PLACE
      ?auto_645342 - HOIST
      ?auto_645345 - SURFACE
      ?auto_645344 - TRUCK
      ?auto_645347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645346 ?auto_645341 ) ( IS-CRATE ?auto_645339 ) ( not ( = ?auto_645338 ?auto_645339 ) ) ( not ( = ?auto_645340 ?auto_645338 ) ) ( not ( = ?auto_645340 ?auto_645339 ) ) ( not ( = ?auto_645343 ?auto_645341 ) ) ( HOIST-AT ?auto_645342 ?auto_645343 ) ( not ( = ?auto_645346 ?auto_645342 ) ) ( SURFACE-AT ?auto_645339 ?auto_645343 ) ( ON ?auto_645339 ?auto_645345 ) ( CLEAR ?auto_645339 ) ( not ( = ?auto_645338 ?auto_645345 ) ) ( not ( = ?auto_645339 ?auto_645345 ) ) ( not ( = ?auto_645340 ?auto_645345 ) ) ( SURFACE-AT ?auto_645340 ?auto_645341 ) ( CLEAR ?auto_645340 ) ( IS-CRATE ?auto_645338 ) ( AVAILABLE ?auto_645346 ) ( TRUCK-AT ?auto_645344 ?auto_645343 ) ( AVAILABLE ?auto_645342 ) ( SURFACE-AT ?auto_645338 ?auto_645343 ) ( ON ?auto_645338 ?auto_645347 ) ( CLEAR ?auto_645338 ) ( not ( = ?auto_645338 ?auto_645347 ) ) ( not ( = ?auto_645339 ?auto_645347 ) ) ( not ( = ?auto_645340 ?auto_645347 ) ) ( not ( = ?auto_645345 ?auto_645347 ) ) )
    :subtasks
    ( ( !LIFT ?auto_645342 ?auto_645338 ?auto_645347 ?auto_645343 )
      ( MAKE-2CRATE ?auto_645340 ?auto_645338 ?auto_645339 )
      ( MAKE-1CRATE-VERIFY ?auto_645338 ?auto_645339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_645348 - SURFACE
      ?auto_645349 - SURFACE
      ?auto_645350 - SURFACE
    )
    :vars
    (
      ?auto_645354 - HOIST
      ?auto_645353 - PLACE
      ?auto_645356 - PLACE
      ?auto_645352 - HOIST
      ?auto_645357 - SURFACE
      ?auto_645355 - TRUCK
      ?auto_645351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645354 ?auto_645353 ) ( IS-CRATE ?auto_645350 ) ( not ( = ?auto_645349 ?auto_645350 ) ) ( not ( = ?auto_645348 ?auto_645349 ) ) ( not ( = ?auto_645348 ?auto_645350 ) ) ( not ( = ?auto_645356 ?auto_645353 ) ) ( HOIST-AT ?auto_645352 ?auto_645356 ) ( not ( = ?auto_645354 ?auto_645352 ) ) ( SURFACE-AT ?auto_645350 ?auto_645356 ) ( ON ?auto_645350 ?auto_645357 ) ( CLEAR ?auto_645350 ) ( not ( = ?auto_645349 ?auto_645357 ) ) ( not ( = ?auto_645350 ?auto_645357 ) ) ( not ( = ?auto_645348 ?auto_645357 ) ) ( SURFACE-AT ?auto_645348 ?auto_645353 ) ( CLEAR ?auto_645348 ) ( IS-CRATE ?auto_645349 ) ( AVAILABLE ?auto_645354 ) ( TRUCK-AT ?auto_645355 ?auto_645356 ) ( AVAILABLE ?auto_645352 ) ( SURFACE-AT ?auto_645349 ?auto_645356 ) ( ON ?auto_645349 ?auto_645351 ) ( CLEAR ?auto_645349 ) ( not ( = ?auto_645349 ?auto_645351 ) ) ( not ( = ?auto_645350 ?auto_645351 ) ) ( not ( = ?auto_645348 ?auto_645351 ) ) ( not ( = ?auto_645357 ?auto_645351 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645349 ?auto_645350 )
      ( MAKE-2CRATE-VERIFY ?auto_645348 ?auto_645349 ?auto_645350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_645358 - SURFACE
      ?auto_645359 - SURFACE
      ?auto_645360 - SURFACE
      ?auto_645361 - SURFACE
    )
    :vars
    (
      ?auto_645367 - HOIST
      ?auto_645368 - PLACE
      ?auto_645364 - PLACE
      ?auto_645363 - HOIST
      ?auto_645365 - SURFACE
      ?auto_645366 - TRUCK
      ?auto_645362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645367 ?auto_645368 ) ( IS-CRATE ?auto_645361 ) ( not ( = ?auto_645360 ?auto_645361 ) ) ( not ( = ?auto_645359 ?auto_645360 ) ) ( not ( = ?auto_645359 ?auto_645361 ) ) ( not ( = ?auto_645364 ?auto_645368 ) ) ( HOIST-AT ?auto_645363 ?auto_645364 ) ( not ( = ?auto_645367 ?auto_645363 ) ) ( SURFACE-AT ?auto_645361 ?auto_645364 ) ( ON ?auto_645361 ?auto_645365 ) ( CLEAR ?auto_645361 ) ( not ( = ?auto_645360 ?auto_645365 ) ) ( not ( = ?auto_645361 ?auto_645365 ) ) ( not ( = ?auto_645359 ?auto_645365 ) ) ( SURFACE-AT ?auto_645359 ?auto_645368 ) ( CLEAR ?auto_645359 ) ( IS-CRATE ?auto_645360 ) ( AVAILABLE ?auto_645367 ) ( TRUCK-AT ?auto_645366 ?auto_645364 ) ( AVAILABLE ?auto_645363 ) ( SURFACE-AT ?auto_645360 ?auto_645364 ) ( ON ?auto_645360 ?auto_645362 ) ( CLEAR ?auto_645360 ) ( not ( = ?auto_645360 ?auto_645362 ) ) ( not ( = ?auto_645361 ?auto_645362 ) ) ( not ( = ?auto_645359 ?auto_645362 ) ) ( not ( = ?auto_645365 ?auto_645362 ) ) ( ON ?auto_645359 ?auto_645358 ) ( not ( = ?auto_645358 ?auto_645359 ) ) ( not ( = ?auto_645358 ?auto_645360 ) ) ( not ( = ?auto_645358 ?auto_645361 ) ) ( not ( = ?auto_645358 ?auto_645365 ) ) ( not ( = ?auto_645358 ?auto_645362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645359 ?auto_645360 ?auto_645361 )
      ( MAKE-3CRATE-VERIFY ?auto_645358 ?auto_645359 ?auto_645360 ?auto_645361 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_645369 - SURFACE
      ?auto_645370 - SURFACE
      ?auto_645371 - SURFACE
      ?auto_645372 - SURFACE
      ?auto_645373 - SURFACE
    )
    :vars
    (
      ?auto_645379 - HOIST
      ?auto_645380 - PLACE
      ?auto_645376 - PLACE
      ?auto_645375 - HOIST
      ?auto_645377 - SURFACE
      ?auto_645378 - TRUCK
      ?auto_645374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645379 ?auto_645380 ) ( IS-CRATE ?auto_645373 ) ( not ( = ?auto_645372 ?auto_645373 ) ) ( not ( = ?auto_645371 ?auto_645372 ) ) ( not ( = ?auto_645371 ?auto_645373 ) ) ( not ( = ?auto_645376 ?auto_645380 ) ) ( HOIST-AT ?auto_645375 ?auto_645376 ) ( not ( = ?auto_645379 ?auto_645375 ) ) ( SURFACE-AT ?auto_645373 ?auto_645376 ) ( ON ?auto_645373 ?auto_645377 ) ( CLEAR ?auto_645373 ) ( not ( = ?auto_645372 ?auto_645377 ) ) ( not ( = ?auto_645373 ?auto_645377 ) ) ( not ( = ?auto_645371 ?auto_645377 ) ) ( SURFACE-AT ?auto_645371 ?auto_645380 ) ( CLEAR ?auto_645371 ) ( IS-CRATE ?auto_645372 ) ( AVAILABLE ?auto_645379 ) ( TRUCK-AT ?auto_645378 ?auto_645376 ) ( AVAILABLE ?auto_645375 ) ( SURFACE-AT ?auto_645372 ?auto_645376 ) ( ON ?auto_645372 ?auto_645374 ) ( CLEAR ?auto_645372 ) ( not ( = ?auto_645372 ?auto_645374 ) ) ( not ( = ?auto_645373 ?auto_645374 ) ) ( not ( = ?auto_645371 ?auto_645374 ) ) ( not ( = ?auto_645377 ?auto_645374 ) ) ( ON ?auto_645370 ?auto_645369 ) ( ON ?auto_645371 ?auto_645370 ) ( not ( = ?auto_645369 ?auto_645370 ) ) ( not ( = ?auto_645369 ?auto_645371 ) ) ( not ( = ?auto_645369 ?auto_645372 ) ) ( not ( = ?auto_645369 ?auto_645373 ) ) ( not ( = ?auto_645369 ?auto_645377 ) ) ( not ( = ?auto_645369 ?auto_645374 ) ) ( not ( = ?auto_645370 ?auto_645371 ) ) ( not ( = ?auto_645370 ?auto_645372 ) ) ( not ( = ?auto_645370 ?auto_645373 ) ) ( not ( = ?auto_645370 ?auto_645377 ) ) ( not ( = ?auto_645370 ?auto_645374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645371 ?auto_645372 ?auto_645373 )
      ( MAKE-4CRATE-VERIFY ?auto_645369 ?auto_645370 ?auto_645371 ?auto_645372 ?auto_645373 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645381 - SURFACE
      ?auto_645382 - SURFACE
      ?auto_645383 - SURFACE
      ?auto_645384 - SURFACE
      ?auto_645385 - SURFACE
      ?auto_645386 - SURFACE
    )
    :vars
    (
      ?auto_645392 - HOIST
      ?auto_645393 - PLACE
      ?auto_645389 - PLACE
      ?auto_645388 - HOIST
      ?auto_645390 - SURFACE
      ?auto_645391 - TRUCK
      ?auto_645387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645392 ?auto_645393 ) ( IS-CRATE ?auto_645386 ) ( not ( = ?auto_645385 ?auto_645386 ) ) ( not ( = ?auto_645384 ?auto_645385 ) ) ( not ( = ?auto_645384 ?auto_645386 ) ) ( not ( = ?auto_645389 ?auto_645393 ) ) ( HOIST-AT ?auto_645388 ?auto_645389 ) ( not ( = ?auto_645392 ?auto_645388 ) ) ( SURFACE-AT ?auto_645386 ?auto_645389 ) ( ON ?auto_645386 ?auto_645390 ) ( CLEAR ?auto_645386 ) ( not ( = ?auto_645385 ?auto_645390 ) ) ( not ( = ?auto_645386 ?auto_645390 ) ) ( not ( = ?auto_645384 ?auto_645390 ) ) ( SURFACE-AT ?auto_645384 ?auto_645393 ) ( CLEAR ?auto_645384 ) ( IS-CRATE ?auto_645385 ) ( AVAILABLE ?auto_645392 ) ( TRUCK-AT ?auto_645391 ?auto_645389 ) ( AVAILABLE ?auto_645388 ) ( SURFACE-AT ?auto_645385 ?auto_645389 ) ( ON ?auto_645385 ?auto_645387 ) ( CLEAR ?auto_645385 ) ( not ( = ?auto_645385 ?auto_645387 ) ) ( not ( = ?auto_645386 ?auto_645387 ) ) ( not ( = ?auto_645384 ?auto_645387 ) ) ( not ( = ?auto_645390 ?auto_645387 ) ) ( ON ?auto_645382 ?auto_645381 ) ( ON ?auto_645383 ?auto_645382 ) ( ON ?auto_645384 ?auto_645383 ) ( not ( = ?auto_645381 ?auto_645382 ) ) ( not ( = ?auto_645381 ?auto_645383 ) ) ( not ( = ?auto_645381 ?auto_645384 ) ) ( not ( = ?auto_645381 ?auto_645385 ) ) ( not ( = ?auto_645381 ?auto_645386 ) ) ( not ( = ?auto_645381 ?auto_645390 ) ) ( not ( = ?auto_645381 ?auto_645387 ) ) ( not ( = ?auto_645382 ?auto_645383 ) ) ( not ( = ?auto_645382 ?auto_645384 ) ) ( not ( = ?auto_645382 ?auto_645385 ) ) ( not ( = ?auto_645382 ?auto_645386 ) ) ( not ( = ?auto_645382 ?auto_645390 ) ) ( not ( = ?auto_645382 ?auto_645387 ) ) ( not ( = ?auto_645383 ?auto_645384 ) ) ( not ( = ?auto_645383 ?auto_645385 ) ) ( not ( = ?auto_645383 ?auto_645386 ) ) ( not ( = ?auto_645383 ?auto_645390 ) ) ( not ( = ?auto_645383 ?auto_645387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645384 ?auto_645385 ?auto_645386 )
      ( MAKE-5CRATE-VERIFY ?auto_645381 ?auto_645382 ?auto_645383 ?auto_645384 ?auto_645385 ?auto_645386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645394 - SURFACE
      ?auto_645395 - SURFACE
    )
    :vars
    (
      ?auto_645402 - HOIST
      ?auto_645403 - PLACE
      ?auto_645400 - SURFACE
      ?auto_645398 - PLACE
      ?auto_645397 - HOIST
      ?auto_645399 - SURFACE
      ?auto_645396 - SURFACE
      ?auto_645401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645402 ?auto_645403 ) ( IS-CRATE ?auto_645395 ) ( not ( = ?auto_645394 ?auto_645395 ) ) ( not ( = ?auto_645400 ?auto_645394 ) ) ( not ( = ?auto_645400 ?auto_645395 ) ) ( not ( = ?auto_645398 ?auto_645403 ) ) ( HOIST-AT ?auto_645397 ?auto_645398 ) ( not ( = ?auto_645402 ?auto_645397 ) ) ( SURFACE-AT ?auto_645395 ?auto_645398 ) ( ON ?auto_645395 ?auto_645399 ) ( CLEAR ?auto_645395 ) ( not ( = ?auto_645394 ?auto_645399 ) ) ( not ( = ?auto_645395 ?auto_645399 ) ) ( not ( = ?auto_645400 ?auto_645399 ) ) ( SURFACE-AT ?auto_645400 ?auto_645403 ) ( CLEAR ?auto_645400 ) ( IS-CRATE ?auto_645394 ) ( AVAILABLE ?auto_645402 ) ( AVAILABLE ?auto_645397 ) ( SURFACE-AT ?auto_645394 ?auto_645398 ) ( ON ?auto_645394 ?auto_645396 ) ( CLEAR ?auto_645394 ) ( not ( = ?auto_645394 ?auto_645396 ) ) ( not ( = ?auto_645395 ?auto_645396 ) ) ( not ( = ?auto_645400 ?auto_645396 ) ) ( not ( = ?auto_645399 ?auto_645396 ) ) ( TRUCK-AT ?auto_645401 ?auto_645403 ) )
    :subtasks
    ( ( !DRIVE ?auto_645401 ?auto_645403 ?auto_645398 )
      ( MAKE-2CRATE ?auto_645400 ?auto_645394 ?auto_645395 )
      ( MAKE-1CRATE-VERIFY ?auto_645394 ?auto_645395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_645404 - SURFACE
      ?auto_645405 - SURFACE
      ?auto_645406 - SURFACE
    )
    :vars
    (
      ?auto_645408 - HOIST
      ?auto_645413 - PLACE
      ?auto_645412 - PLACE
      ?auto_645407 - HOIST
      ?auto_645410 - SURFACE
      ?auto_645409 - SURFACE
      ?auto_645411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645408 ?auto_645413 ) ( IS-CRATE ?auto_645406 ) ( not ( = ?auto_645405 ?auto_645406 ) ) ( not ( = ?auto_645404 ?auto_645405 ) ) ( not ( = ?auto_645404 ?auto_645406 ) ) ( not ( = ?auto_645412 ?auto_645413 ) ) ( HOIST-AT ?auto_645407 ?auto_645412 ) ( not ( = ?auto_645408 ?auto_645407 ) ) ( SURFACE-AT ?auto_645406 ?auto_645412 ) ( ON ?auto_645406 ?auto_645410 ) ( CLEAR ?auto_645406 ) ( not ( = ?auto_645405 ?auto_645410 ) ) ( not ( = ?auto_645406 ?auto_645410 ) ) ( not ( = ?auto_645404 ?auto_645410 ) ) ( SURFACE-AT ?auto_645404 ?auto_645413 ) ( CLEAR ?auto_645404 ) ( IS-CRATE ?auto_645405 ) ( AVAILABLE ?auto_645408 ) ( AVAILABLE ?auto_645407 ) ( SURFACE-AT ?auto_645405 ?auto_645412 ) ( ON ?auto_645405 ?auto_645409 ) ( CLEAR ?auto_645405 ) ( not ( = ?auto_645405 ?auto_645409 ) ) ( not ( = ?auto_645406 ?auto_645409 ) ) ( not ( = ?auto_645404 ?auto_645409 ) ) ( not ( = ?auto_645410 ?auto_645409 ) ) ( TRUCK-AT ?auto_645411 ?auto_645413 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645405 ?auto_645406 )
      ( MAKE-2CRATE-VERIFY ?auto_645404 ?auto_645405 ?auto_645406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_645414 - SURFACE
      ?auto_645415 - SURFACE
      ?auto_645416 - SURFACE
      ?auto_645417 - SURFACE
    )
    :vars
    (
      ?auto_645421 - HOIST
      ?auto_645422 - PLACE
      ?auto_645420 - PLACE
      ?auto_645419 - HOIST
      ?auto_645418 - SURFACE
      ?auto_645423 - SURFACE
      ?auto_645424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645421 ?auto_645422 ) ( IS-CRATE ?auto_645417 ) ( not ( = ?auto_645416 ?auto_645417 ) ) ( not ( = ?auto_645415 ?auto_645416 ) ) ( not ( = ?auto_645415 ?auto_645417 ) ) ( not ( = ?auto_645420 ?auto_645422 ) ) ( HOIST-AT ?auto_645419 ?auto_645420 ) ( not ( = ?auto_645421 ?auto_645419 ) ) ( SURFACE-AT ?auto_645417 ?auto_645420 ) ( ON ?auto_645417 ?auto_645418 ) ( CLEAR ?auto_645417 ) ( not ( = ?auto_645416 ?auto_645418 ) ) ( not ( = ?auto_645417 ?auto_645418 ) ) ( not ( = ?auto_645415 ?auto_645418 ) ) ( SURFACE-AT ?auto_645415 ?auto_645422 ) ( CLEAR ?auto_645415 ) ( IS-CRATE ?auto_645416 ) ( AVAILABLE ?auto_645421 ) ( AVAILABLE ?auto_645419 ) ( SURFACE-AT ?auto_645416 ?auto_645420 ) ( ON ?auto_645416 ?auto_645423 ) ( CLEAR ?auto_645416 ) ( not ( = ?auto_645416 ?auto_645423 ) ) ( not ( = ?auto_645417 ?auto_645423 ) ) ( not ( = ?auto_645415 ?auto_645423 ) ) ( not ( = ?auto_645418 ?auto_645423 ) ) ( TRUCK-AT ?auto_645424 ?auto_645422 ) ( ON ?auto_645415 ?auto_645414 ) ( not ( = ?auto_645414 ?auto_645415 ) ) ( not ( = ?auto_645414 ?auto_645416 ) ) ( not ( = ?auto_645414 ?auto_645417 ) ) ( not ( = ?auto_645414 ?auto_645418 ) ) ( not ( = ?auto_645414 ?auto_645423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645415 ?auto_645416 ?auto_645417 )
      ( MAKE-3CRATE-VERIFY ?auto_645414 ?auto_645415 ?auto_645416 ?auto_645417 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_645425 - SURFACE
      ?auto_645426 - SURFACE
      ?auto_645427 - SURFACE
      ?auto_645428 - SURFACE
      ?auto_645429 - SURFACE
    )
    :vars
    (
      ?auto_645433 - HOIST
      ?auto_645434 - PLACE
      ?auto_645432 - PLACE
      ?auto_645431 - HOIST
      ?auto_645430 - SURFACE
      ?auto_645435 - SURFACE
      ?auto_645436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645433 ?auto_645434 ) ( IS-CRATE ?auto_645429 ) ( not ( = ?auto_645428 ?auto_645429 ) ) ( not ( = ?auto_645427 ?auto_645428 ) ) ( not ( = ?auto_645427 ?auto_645429 ) ) ( not ( = ?auto_645432 ?auto_645434 ) ) ( HOIST-AT ?auto_645431 ?auto_645432 ) ( not ( = ?auto_645433 ?auto_645431 ) ) ( SURFACE-AT ?auto_645429 ?auto_645432 ) ( ON ?auto_645429 ?auto_645430 ) ( CLEAR ?auto_645429 ) ( not ( = ?auto_645428 ?auto_645430 ) ) ( not ( = ?auto_645429 ?auto_645430 ) ) ( not ( = ?auto_645427 ?auto_645430 ) ) ( SURFACE-AT ?auto_645427 ?auto_645434 ) ( CLEAR ?auto_645427 ) ( IS-CRATE ?auto_645428 ) ( AVAILABLE ?auto_645433 ) ( AVAILABLE ?auto_645431 ) ( SURFACE-AT ?auto_645428 ?auto_645432 ) ( ON ?auto_645428 ?auto_645435 ) ( CLEAR ?auto_645428 ) ( not ( = ?auto_645428 ?auto_645435 ) ) ( not ( = ?auto_645429 ?auto_645435 ) ) ( not ( = ?auto_645427 ?auto_645435 ) ) ( not ( = ?auto_645430 ?auto_645435 ) ) ( TRUCK-AT ?auto_645436 ?auto_645434 ) ( ON ?auto_645426 ?auto_645425 ) ( ON ?auto_645427 ?auto_645426 ) ( not ( = ?auto_645425 ?auto_645426 ) ) ( not ( = ?auto_645425 ?auto_645427 ) ) ( not ( = ?auto_645425 ?auto_645428 ) ) ( not ( = ?auto_645425 ?auto_645429 ) ) ( not ( = ?auto_645425 ?auto_645430 ) ) ( not ( = ?auto_645425 ?auto_645435 ) ) ( not ( = ?auto_645426 ?auto_645427 ) ) ( not ( = ?auto_645426 ?auto_645428 ) ) ( not ( = ?auto_645426 ?auto_645429 ) ) ( not ( = ?auto_645426 ?auto_645430 ) ) ( not ( = ?auto_645426 ?auto_645435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645427 ?auto_645428 ?auto_645429 )
      ( MAKE-4CRATE-VERIFY ?auto_645425 ?auto_645426 ?auto_645427 ?auto_645428 ?auto_645429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645437 - SURFACE
      ?auto_645438 - SURFACE
      ?auto_645439 - SURFACE
      ?auto_645440 - SURFACE
      ?auto_645441 - SURFACE
      ?auto_645442 - SURFACE
    )
    :vars
    (
      ?auto_645446 - HOIST
      ?auto_645447 - PLACE
      ?auto_645445 - PLACE
      ?auto_645444 - HOIST
      ?auto_645443 - SURFACE
      ?auto_645448 - SURFACE
      ?auto_645449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645446 ?auto_645447 ) ( IS-CRATE ?auto_645442 ) ( not ( = ?auto_645441 ?auto_645442 ) ) ( not ( = ?auto_645440 ?auto_645441 ) ) ( not ( = ?auto_645440 ?auto_645442 ) ) ( not ( = ?auto_645445 ?auto_645447 ) ) ( HOIST-AT ?auto_645444 ?auto_645445 ) ( not ( = ?auto_645446 ?auto_645444 ) ) ( SURFACE-AT ?auto_645442 ?auto_645445 ) ( ON ?auto_645442 ?auto_645443 ) ( CLEAR ?auto_645442 ) ( not ( = ?auto_645441 ?auto_645443 ) ) ( not ( = ?auto_645442 ?auto_645443 ) ) ( not ( = ?auto_645440 ?auto_645443 ) ) ( SURFACE-AT ?auto_645440 ?auto_645447 ) ( CLEAR ?auto_645440 ) ( IS-CRATE ?auto_645441 ) ( AVAILABLE ?auto_645446 ) ( AVAILABLE ?auto_645444 ) ( SURFACE-AT ?auto_645441 ?auto_645445 ) ( ON ?auto_645441 ?auto_645448 ) ( CLEAR ?auto_645441 ) ( not ( = ?auto_645441 ?auto_645448 ) ) ( not ( = ?auto_645442 ?auto_645448 ) ) ( not ( = ?auto_645440 ?auto_645448 ) ) ( not ( = ?auto_645443 ?auto_645448 ) ) ( TRUCK-AT ?auto_645449 ?auto_645447 ) ( ON ?auto_645438 ?auto_645437 ) ( ON ?auto_645439 ?auto_645438 ) ( ON ?auto_645440 ?auto_645439 ) ( not ( = ?auto_645437 ?auto_645438 ) ) ( not ( = ?auto_645437 ?auto_645439 ) ) ( not ( = ?auto_645437 ?auto_645440 ) ) ( not ( = ?auto_645437 ?auto_645441 ) ) ( not ( = ?auto_645437 ?auto_645442 ) ) ( not ( = ?auto_645437 ?auto_645443 ) ) ( not ( = ?auto_645437 ?auto_645448 ) ) ( not ( = ?auto_645438 ?auto_645439 ) ) ( not ( = ?auto_645438 ?auto_645440 ) ) ( not ( = ?auto_645438 ?auto_645441 ) ) ( not ( = ?auto_645438 ?auto_645442 ) ) ( not ( = ?auto_645438 ?auto_645443 ) ) ( not ( = ?auto_645438 ?auto_645448 ) ) ( not ( = ?auto_645439 ?auto_645440 ) ) ( not ( = ?auto_645439 ?auto_645441 ) ) ( not ( = ?auto_645439 ?auto_645442 ) ) ( not ( = ?auto_645439 ?auto_645443 ) ) ( not ( = ?auto_645439 ?auto_645448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645440 ?auto_645441 ?auto_645442 )
      ( MAKE-5CRATE-VERIFY ?auto_645437 ?auto_645438 ?auto_645439 ?auto_645440 ?auto_645441 ?auto_645442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645450 - SURFACE
      ?auto_645451 - SURFACE
    )
    :vars
    (
      ?auto_645456 - HOIST
      ?auto_645457 - PLACE
      ?auto_645453 - SURFACE
      ?auto_645455 - PLACE
      ?auto_645454 - HOIST
      ?auto_645452 - SURFACE
      ?auto_645458 - SURFACE
      ?auto_645459 - TRUCK
      ?auto_645460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645456 ?auto_645457 ) ( IS-CRATE ?auto_645451 ) ( not ( = ?auto_645450 ?auto_645451 ) ) ( not ( = ?auto_645453 ?auto_645450 ) ) ( not ( = ?auto_645453 ?auto_645451 ) ) ( not ( = ?auto_645455 ?auto_645457 ) ) ( HOIST-AT ?auto_645454 ?auto_645455 ) ( not ( = ?auto_645456 ?auto_645454 ) ) ( SURFACE-AT ?auto_645451 ?auto_645455 ) ( ON ?auto_645451 ?auto_645452 ) ( CLEAR ?auto_645451 ) ( not ( = ?auto_645450 ?auto_645452 ) ) ( not ( = ?auto_645451 ?auto_645452 ) ) ( not ( = ?auto_645453 ?auto_645452 ) ) ( IS-CRATE ?auto_645450 ) ( AVAILABLE ?auto_645454 ) ( SURFACE-AT ?auto_645450 ?auto_645455 ) ( ON ?auto_645450 ?auto_645458 ) ( CLEAR ?auto_645450 ) ( not ( = ?auto_645450 ?auto_645458 ) ) ( not ( = ?auto_645451 ?auto_645458 ) ) ( not ( = ?auto_645453 ?auto_645458 ) ) ( not ( = ?auto_645452 ?auto_645458 ) ) ( TRUCK-AT ?auto_645459 ?auto_645457 ) ( SURFACE-AT ?auto_645460 ?auto_645457 ) ( CLEAR ?auto_645460 ) ( LIFTING ?auto_645456 ?auto_645453 ) ( IS-CRATE ?auto_645453 ) ( not ( = ?auto_645460 ?auto_645453 ) ) ( not ( = ?auto_645450 ?auto_645460 ) ) ( not ( = ?auto_645451 ?auto_645460 ) ) ( not ( = ?auto_645452 ?auto_645460 ) ) ( not ( = ?auto_645458 ?auto_645460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645460 ?auto_645453 )
      ( MAKE-2CRATE ?auto_645453 ?auto_645450 ?auto_645451 )
      ( MAKE-1CRATE-VERIFY ?auto_645450 ?auto_645451 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_645461 - SURFACE
      ?auto_645462 - SURFACE
      ?auto_645463 - SURFACE
    )
    :vars
    (
      ?auto_645470 - HOIST
      ?auto_645467 - PLACE
      ?auto_645464 - PLACE
      ?auto_645465 - HOIST
      ?auto_645468 - SURFACE
      ?auto_645469 - SURFACE
      ?auto_645471 - TRUCK
      ?auto_645466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645470 ?auto_645467 ) ( IS-CRATE ?auto_645463 ) ( not ( = ?auto_645462 ?auto_645463 ) ) ( not ( = ?auto_645461 ?auto_645462 ) ) ( not ( = ?auto_645461 ?auto_645463 ) ) ( not ( = ?auto_645464 ?auto_645467 ) ) ( HOIST-AT ?auto_645465 ?auto_645464 ) ( not ( = ?auto_645470 ?auto_645465 ) ) ( SURFACE-AT ?auto_645463 ?auto_645464 ) ( ON ?auto_645463 ?auto_645468 ) ( CLEAR ?auto_645463 ) ( not ( = ?auto_645462 ?auto_645468 ) ) ( not ( = ?auto_645463 ?auto_645468 ) ) ( not ( = ?auto_645461 ?auto_645468 ) ) ( IS-CRATE ?auto_645462 ) ( AVAILABLE ?auto_645465 ) ( SURFACE-AT ?auto_645462 ?auto_645464 ) ( ON ?auto_645462 ?auto_645469 ) ( CLEAR ?auto_645462 ) ( not ( = ?auto_645462 ?auto_645469 ) ) ( not ( = ?auto_645463 ?auto_645469 ) ) ( not ( = ?auto_645461 ?auto_645469 ) ) ( not ( = ?auto_645468 ?auto_645469 ) ) ( TRUCK-AT ?auto_645471 ?auto_645467 ) ( SURFACE-AT ?auto_645466 ?auto_645467 ) ( CLEAR ?auto_645466 ) ( LIFTING ?auto_645470 ?auto_645461 ) ( IS-CRATE ?auto_645461 ) ( not ( = ?auto_645466 ?auto_645461 ) ) ( not ( = ?auto_645462 ?auto_645466 ) ) ( not ( = ?auto_645463 ?auto_645466 ) ) ( not ( = ?auto_645468 ?auto_645466 ) ) ( not ( = ?auto_645469 ?auto_645466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645462 ?auto_645463 )
      ( MAKE-2CRATE-VERIFY ?auto_645461 ?auto_645462 ?auto_645463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_645472 - SURFACE
      ?auto_645473 - SURFACE
      ?auto_645474 - SURFACE
      ?auto_645475 - SURFACE
    )
    :vars
    (
      ?auto_645479 - HOIST
      ?auto_645477 - PLACE
      ?auto_645478 - PLACE
      ?auto_645480 - HOIST
      ?auto_645482 - SURFACE
      ?auto_645481 - SURFACE
      ?auto_645476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645479 ?auto_645477 ) ( IS-CRATE ?auto_645475 ) ( not ( = ?auto_645474 ?auto_645475 ) ) ( not ( = ?auto_645473 ?auto_645474 ) ) ( not ( = ?auto_645473 ?auto_645475 ) ) ( not ( = ?auto_645478 ?auto_645477 ) ) ( HOIST-AT ?auto_645480 ?auto_645478 ) ( not ( = ?auto_645479 ?auto_645480 ) ) ( SURFACE-AT ?auto_645475 ?auto_645478 ) ( ON ?auto_645475 ?auto_645482 ) ( CLEAR ?auto_645475 ) ( not ( = ?auto_645474 ?auto_645482 ) ) ( not ( = ?auto_645475 ?auto_645482 ) ) ( not ( = ?auto_645473 ?auto_645482 ) ) ( IS-CRATE ?auto_645474 ) ( AVAILABLE ?auto_645480 ) ( SURFACE-AT ?auto_645474 ?auto_645478 ) ( ON ?auto_645474 ?auto_645481 ) ( CLEAR ?auto_645474 ) ( not ( = ?auto_645474 ?auto_645481 ) ) ( not ( = ?auto_645475 ?auto_645481 ) ) ( not ( = ?auto_645473 ?auto_645481 ) ) ( not ( = ?auto_645482 ?auto_645481 ) ) ( TRUCK-AT ?auto_645476 ?auto_645477 ) ( SURFACE-AT ?auto_645472 ?auto_645477 ) ( CLEAR ?auto_645472 ) ( LIFTING ?auto_645479 ?auto_645473 ) ( IS-CRATE ?auto_645473 ) ( not ( = ?auto_645472 ?auto_645473 ) ) ( not ( = ?auto_645474 ?auto_645472 ) ) ( not ( = ?auto_645475 ?auto_645472 ) ) ( not ( = ?auto_645482 ?auto_645472 ) ) ( not ( = ?auto_645481 ?auto_645472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645473 ?auto_645474 ?auto_645475 )
      ( MAKE-3CRATE-VERIFY ?auto_645472 ?auto_645473 ?auto_645474 ?auto_645475 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_645483 - SURFACE
      ?auto_645484 - SURFACE
      ?auto_645485 - SURFACE
      ?auto_645486 - SURFACE
      ?auto_645487 - SURFACE
    )
    :vars
    (
      ?auto_645491 - HOIST
      ?auto_645489 - PLACE
      ?auto_645490 - PLACE
      ?auto_645492 - HOIST
      ?auto_645494 - SURFACE
      ?auto_645493 - SURFACE
      ?auto_645488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645491 ?auto_645489 ) ( IS-CRATE ?auto_645487 ) ( not ( = ?auto_645486 ?auto_645487 ) ) ( not ( = ?auto_645485 ?auto_645486 ) ) ( not ( = ?auto_645485 ?auto_645487 ) ) ( not ( = ?auto_645490 ?auto_645489 ) ) ( HOIST-AT ?auto_645492 ?auto_645490 ) ( not ( = ?auto_645491 ?auto_645492 ) ) ( SURFACE-AT ?auto_645487 ?auto_645490 ) ( ON ?auto_645487 ?auto_645494 ) ( CLEAR ?auto_645487 ) ( not ( = ?auto_645486 ?auto_645494 ) ) ( not ( = ?auto_645487 ?auto_645494 ) ) ( not ( = ?auto_645485 ?auto_645494 ) ) ( IS-CRATE ?auto_645486 ) ( AVAILABLE ?auto_645492 ) ( SURFACE-AT ?auto_645486 ?auto_645490 ) ( ON ?auto_645486 ?auto_645493 ) ( CLEAR ?auto_645486 ) ( not ( = ?auto_645486 ?auto_645493 ) ) ( not ( = ?auto_645487 ?auto_645493 ) ) ( not ( = ?auto_645485 ?auto_645493 ) ) ( not ( = ?auto_645494 ?auto_645493 ) ) ( TRUCK-AT ?auto_645488 ?auto_645489 ) ( SURFACE-AT ?auto_645484 ?auto_645489 ) ( CLEAR ?auto_645484 ) ( LIFTING ?auto_645491 ?auto_645485 ) ( IS-CRATE ?auto_645485 ) ( not ( = ?auto_645484 ?auto_645485 ) ) ( not ( = ?auto_645486 ?auto_645484 ) ) ( not ( = ?auto_645487 ?auto_645484 ) ) ( not ( = ?auto_645494 ?auto_645484 ) ) ( not ( = ?auto_645493 ?auto_645484 ) ) ( ON ?auto_645484 ?auto_645483 ) ( not ( = ?auto_645483 ?auto_645484 ) ) ( not ( = ?auto_645483 ?auto_645485 ) ) ( not ( = ?auto_645483 ?auto_645486 ) ) ( not ( = ?auto_645483 ?auto_645487 ) ) ( not ( = ?auto_645483 ?auto_645494 ) ) ( not ( = ?auto_645483 ?auto_645493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645485 ?auto_645486 ?auto_645487 )
      ( MAKE-4CRATE-VERIFY ?auto_645483 ?auto_645484 ?auto_645485 ?auto_645486 ?auto_645487 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_645495 - SURFACE
      ?auto_645496 - SURFACE
      ?auto_645497 - SURFACE
      ?auto_645498 - SURFACE
      ?auto_645499 - SURFACE
      ?auto_645500 - SURFACE
    )
    :vars
    (
      ?auto_645504 - HOIST
      ?auto_645502 - PLACE
      ?auto_645503 - PLACE
      ?auto_645505 - HOIST
      ?auto_645507 - SURFACE
      ?auto_645506 - SURFACE
      ?auto_645501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645504 ?auto_645502 ) ( IS-CRATE ?auto_645500 ) ( not ( = ?auto_645499 ?auto_645500 ) ) ( not ( = ?auto_645498 ?auto_645499 ) ) ( not ( = ?auto_645498 ?auto_645500 ) ) ( not ( = ?auto_645503 ?auto_645502 ) ) ( HOIST-AT ?auto_645505 ?auto_645503 ) ( not ( = ?auto_645504 ?auto_645505 ) ) ( SURFACE-AT ?auto_645500 ?auto_645503 ) ( ON ?auto_645500 ?auto_645507 ) ( CLEAR ?auto_645500 ) ( not ( = ?auto_645499 ?auto_645507 ) ) ( not ( = ?auto_645500 ?auto_645507 ) ) ( not ( = ?auto_645498 ?auto_645507 ) ) ( IS-CRATE ?auto_645499 ) ( AVAILABLE ?auto_645505 ) ( SURFACE-AT ?auto_645499 ?auto_645503 ) ( ON ?auto_645499 ?auto_645506 ) ( CLEAR ?auto_645499 ) ( not ( = ?auto_645499 ?auto_645506 ) ) ( not ( = ?auto_645500 ?auto_645506 ) ) ( not ( = ?auto_645498 ?auto_645506 ) ) ( not ( = ?auto_645507 ?auto_645506 ) ) ( TRUCK-AT ?auto_645501 ?auto_645502 ) ( SURFACE-AT ?auto_645497 ?auto_645502 ) ( CLEAR ?auto_645497 ) ( LIFTING ?auto_645504 ?auto_645498 ) ( IS-CRATE ?auto_645498 ) ( not ( = ?auto_645497 ?auto_645498 ) ) ( not ( = ?auto_645499 ?auto_645497 ) ) ( not ( = ?auto_645500 ?auto_645497 ) ) ( not ( = ?auto_645507 ?auto_645497 ) ) ( not ( = ?auto_645506 ?auto_645497 ) ) ( ON ?auto_645496 ?auto_645495 ) ( ON ?auto_645497 ?auto_645496 ) ( not ( = ?auto_645495 ?auto_645496 ) ) ( not ( = ?auto_645495 ?auto_645497 ) ) ( not ( = ?auto_645495 ?auto_645498 ) ) ( not ( = ?auto_645495 ?auto_645499 ) ) ( not ( = ?auto_645495 ?auto_645500 ) ) ( not ( = ?auto_645495 ?auto_645507 ) ) ( not ( = ?auto_645495 ?auto_645506 ) ) ( not ( = ?auto_645496 ?auto_645497 ) ) ( not ( = ?auto_645496 ?auto_645498 ) ) ( not ( = ?auto_645496 ?auto_645499 ) ) ( not ( = ?auto_645496 ?auto_645500 ) ) ( not ( = ?auto_645496 ?auto_645507 ) ) ( not ( = ?auto_645496 ?auto_645506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645498 ?auto_645499 ?auto_645500 )
      ( MAKE-5CRATE-VERIFY ?auto_645495 ?auto_645496 ?auto_645497 ?auto_645498 ?auto_645499 ?auto_645500 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646416 - SURFACE
      ?auto_646417 - SURFACE
      ?auto_646418 - SURFACE
      ?auto_646419 - SURFACE
      ?auto_646420 - SURFACE
      ?auto_646421 - SURFACE
      ?auto_646422 - SURFACE
    )
    :vars
    (
      ?auto_646423 - HOIST
      ?auto_646424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646423 ?auto_646424 ) ( SURFACE-AT ?auto_646421 ?auto_646424 ) ( CLEAR ?auto_646421 ) ( LIFTING ?auto_646423 ?auto_646422 ) ( IS-CRATE ?auto_646422 ) ( not ( = ?auto_646421 ?auto_646422 ) ) ( ON ?auto_646417 ?auto_646416 ) ( ON ?auto_646418 ?auto_646417 ) ( ON ?auto_646419 ?auto_646418 ) ( ON ?auto_646420 ?auto_646419 ) ( ON ?auto_646421 ?auto_646420 ) ( not ( = ?auto_646416 ?auto_646417 ) ) ( not ( = ?auto_646416 ?auto_646418 ) ) ( not ( = ?auto_646416 ?auto_646419 ) ) ( not ( = ?auto_646416 ?auto_646420 ) ) ( not ( = ?auto_646416 ?auto_646421 ) ) ( not ( = ?auto_646416 ?auto_646422 ) ) ( not ( = ?auto_646417 ?auto_646418 ) ) ( not ( = ?auto_646417 ?auto_646419 ) ) ( not ( = ?auto_646417 ?auto_646420 ) ) ( not ( = ?auto_646417 ?auto_646421 ) ) ( not ( = ?auto_646417 ?auto_646422 ) ) ( not ( = ?auto_646418 ?auto_646419 ) ) ( not ( = ?auto_646418 ?auto_646420 ) ) ( not ( = ?auto_646418 ?auto_646421 ) ) ( not ( = ?auto_646418 ?auto_646422 ) ) ( not ( = ?auto_646419 ?auto_646420 ) ) ( not ( = ?auto_646419 ?auto_646421 ) ) ( not ( = ?auto_646419 ?auto_646422 ) ) ( not ( = ?auto_646420 ?auto_646421 ) ) ( not ( = ?auto_646420 ?auto_646422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_646421 ?auto_646422 )
      ( MAKE-6CRATE-VERIFY ?auto_646416 ?auto_646417 ?auto_646418 ?auto_646419 ?auto_646420 ?auto_646421 ?auto_646422 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646460 - SURFACE
      ?auto_646461 - SURFACE
      ?auto_646462 - SURFACE
      ?auto_646463 - SURFACE
      ?auto_646464 - SURFACE
      ?auto_646465 - SURFACE
      ?auto_646466 - SURFACE
    )
    :vars
    (
      ?auto_646468 - HOIST
      ?auto_646467 - PLACE
      ?auto_646469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646468 ?auto_646467 ) ( SURFACE-AT ?auto_646465 ?auto_646467 ) ( CLEAR ?auto_646465 ) ( IS-CRATE ?auto_646466 ) ( not ( = ?auto_646465 ?auto_646466 ) ) ( TRUCK-AT ?auto_646469 ?auto_646467 ) ( AVAILABLE ?auto_646468 ) ( IN ?auto_646466 ?auto_646469 ) ( ON ?auto_646465 ?auto_646464 ) ( not ( = ?auto_646464 ?auto_646465 ) ) ( not ( = ?auto_646464 ?auto_646466 ) ) ( ON ?auto_646461 ?auto_646460 ) ( ON ?auto_646462 ?auto_646461 ) ( ON ?auto_646463 ?auto_646462 ) ( ON ?auto_646464 ?auto_646463 ) ( not ( = ?auto_646460 ?auto_646461 ) ) ( not ( = ?auto_646460 ?auto_646462 ) ) ( not ( = ?auto_646460 ?auto_646463 ) ) ( not ( = ?auto_646460 ?auto_646464 ) ) ( not ( = ?auto_646460 ?auto_646465 ) ) ( not ( = ?auto_646460 ?auto_646466 ) ) ( not ( = ?auto_646461 ?auto_646462 ) ) ( not ( = ?auto_646461 ?auto_646463 ) ) ( not ( = ?auto_646461 ?auto_646464 ) ) ( not ( = ?auto_646461 ?auto_646465 ) ) ( not ( = ?auto_646461 ?auto_646466 ) ) ( not ( = ?auto_646462 ?auto_646463 ) ) ( not ( = ?auto_646462 ?auto_646464 ) ) ( not ( = ?auto_646462 ?auto_646465 ) ) ( not ( = ?auto_646462 ?auto_646466 ) ) ( not ( = ?auto_646463 ?auto_646464 ) ) ( not ( = ?auto_646463 ?auto_646465 ) ) ( not ( = ?auto_646463 ?auto_646466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646464 ?auto_646465 ?auto_646466 )
      ( MAKE-6CRATE-VERIFY ?auto_646460 ?auto_646461 ?auto_646462 ?auto_646463 ?auto_646464 ?auto_646465 ?auto_646466 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646511 - SURFACE
      ?auto_646512 - SURFACE
      ?auto_646513 - SURFACE
      ?auto_646514 - SURFACE
      ?auto_646515 - SURFACE
      ?auto_646516 - SURFACE
      ?auto_646517 - SURFACE
    )
    :vars
    (
      ?auto_646518 - HOIST
      ?auto_646519 - PLACE
      ?auto_646521 - TRUCK
      ?auto_646520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646518 ?auto_646519 ) ( SURFACE-AT ?auto_646516 ?auto_646519 ) ( CLEAR ?auto_646516 ) ( IS-CRATE ?auto_646517 ) ( not ( = ?auto_646516 ?auto_646517 ) ) ( AVAILABLE ?auto_646518 ) ( IN ?auto_646517 ?auto_646521 ) ( ON ?auto_646516 ?auto_646515 ) ( not ( = ?auto_646515 ?auto_646516 ) ) ( not ( = ?auto_646515 ?auto_646517 ) ) ( TRUCK-AT ?auto_646521 ?auto_646520 ) ( not ( = ?auto_646520 ?auto_646519 ) ) ( ON ?auto_646512 ?auto_646511 ) ( ON ?auto_646513 ?auto_646512 ) ( ON ?auto_646514 ?auto_646513 ) ( ON ?auto_646515 ?auto_646514 ) ( not ( = ?auto_646511 ?auto_646512 ) ) ( not ( = ?auto_646511 ?auto_646513 ) ) ( not ( = ?auto_646511 ?auto_646514 ) ) ( not ( = ?auto_646511 ?auto_646515 ) ) ( not ( = ?auto_646511 ?auto_646516 ) ) ( not ( = ?auto_646511 ?auto_646517 ) ) ( not ( = ?auto_646512 ?auto_646513 ) ) ( not ( = ?auto_646512 ?auto_646514 ) ) ( not ( = ?auto_646512 ?auto_646515 ) ) ( not ( = ?auto_646512 ?auto_646516 ) ) ( not ( = ?auto_646512 ?auto_646517 ) ) ( not ( = ?auto_646513 ?auto_646514 ) ) ( not ( = ?auto_646513 ?auto_646515 ) ) ( not ( = ?auto_646513 ?auto_646516 ) ) ( not ( = ?auto_646513 ?auto_646517 ) ) ( not ( = ?auto_646514 ?auto_646515 ) ) ( not ( = ?auto_646514 ?auto_646516 ) ) ( not ( = ?auto_646514 ?auto_646517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646515 ?auto_646516 ?auto_646517 )
      ( MAKE-6CRATE-VERIFY ?auto_646511 ?auto_646512 ?auto_646513 ?auto_646514 ?auto_646515 ?auto_646516 ?auto_646517 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646568 - SURFACE
      ?auto_646569 - SURFACE
      ?auto_646570 - SURFACE
      ?auto_646571 - SURFACE
      ?auto_646572 - SURFACE
      ?auto_646573 - SURFACE
      ?auto_646574 - SURFACE
    )
    :vars
    (
      ?auto_646575 - HOIST
      ?auto_646578 - PLACE
      ?auto_646577 - TRUCK
      ?auto_646579 - PLACE
      ?auto_646576 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_646575 ?auto_646578 ) ( SURFACE-AT ?auto_646573 ?auto_646578 ) ( CLEAR ?auto_646573 ) ( IS-CRATE ?auto_646574 ) ( not ( = ?auto_646573 ?auto_646574 ) ) ( AVAILABLE ?auto_646575 ) ( ON ?auto_646573 ?auto_646572 ) ( not ( = ?auto_646572 ?auto_646573 ) ) ( not ( = ?auto_646572 ?auto_646574 ) ) ( TRUCK-AT ?auto_646577 ?auto_646579 ) ( not ( = ?auto_646579 ?auto_646578 ) ) ( HOIST-AT ?auto_646576 ?auto_646579 ) ( LIFTING ?auto_646576 ?auto_646574 ) ( not ( = ?auto_646575 ?auto_646576 ) ) ( ON ?auto_646569 ?auto_646568 ) ( ON ?auto_646570 ?auto_646569 ) ( ON ?auto_646571 ?auto_646570 ) ( ON ?auto_646572 ?auto_646571 ) ( not ( = ?auto_646568 ?auto_646569 ) ) ( not ( = ?auto_646568 ?auto_646570 ) ) ( not ( = ?auto_646568 ?auto_646571 ) ) ( not ( = ?auto_646568 ?auto_646572 ) ) ( not ( = ?auto_646568 ?auto_646573 ) ) ( not ( = ?auto_646568 ?auto_646574 ) ) ( not ( = ?auto_646569 ?auto_646570 ) ) ( not ( = ?auto_646569 ?auto_646571 ) ) ( not ( = ?auto_646569 ?auto_646572 ) ) ( not ( = ?auto_646569 ?auto_646573 ) ) ( not ( = ?auto_646569 ?auto_646574 ) ) ( not ( = ?auto_646570 ?auto_646571 ) ) ( not ( = ?auto_646570 ?auto_646572 ) ) ( not ( = ?auto_646570 ?auto_646573 ) ) ( not ( = ?auto_646570 ?auto_646574 ) ) ( not ( = ?auto_646571 ?auto_646572 ) ) ( not ( = ?auto_646571 ?auto_646573 ) ) ( not ( = ?auto_646571 ?auto_646574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646572 ?auto_646573 ?auto_646574 )
      ( MAKE-6CRATE-VERIFY ?auto_646568 ?auto_646569 ?auto_646570 ?auto_646571 ?auto_646572 ?auto_646573 ?auto_646574 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646631 - SURFACE
      ?auto_646632 - SURFACE
      ?auto_646633 - SURFACE
      ?auto_646634 - SURFACE
      ?auto_646635 - SURFACE
      ?auto_646636 - SURFACE
      ?auto_646637 - SURFACE
    )
    :vars
    (
      ?auto_646643 - HOIST
      ?auto_646640 - PLACE
      ?auto_646638 - TRUCK
      ?auto_646642 - PLACE
      ?auto_646639 - HOIST
      ?auto_646641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646643 ?auto_646640 ) ( SURFACE-AT ?auto_646636 ?auto_646640 ) ( CLEAR ?auto_646636 ) ( IS-CRATE ?auto_646637 ) ( not ( = ?auto_646636 ?auto_646637 ) ) ( AVAILABLE ?auto_646643 ) ( ON ?auto_646636 ?auto_646635 ) ( not ( = ?auto_646635 ?auto_646636 ) ) ( not ( = ?auto_646635 ?auto_646637 ) ) ( TRUCK-AT ?auto_646638 ?auto_646642 ) ( not ( = ?auto_646642 ?auto_646640 ) ) ( HOIST-AT ?auto_646639 ?auto_646642 ) ( not ( = ?auto_646643 ?auto_646639 ) ) ( AVAILABLE ?auto_646639 ) ( SURFACE-AT ?auto_646637 ?auto_646642 ) ( ON ?auto_646637 ?auto_646641 ) ( CLEAR ?auto_646637 ) ( not ( = ?auto_646636 ?auto_646641 ) ) ( not ( = ?auto_646637 ?auto_646641 ) ) ( not ( = ?auto_646635 ?auto_646641 ) ) ( ON ?auto_646632 ?auto_646631 ) ( ON ?auto_646633 ?auto_646632 ) ( ON ?auto_646634 ?auto_646633 ) ( ON ?auto_646635 ?auto_646634 ) ( not ( = ?auto_646631 ?auto_646632 ) ) ( not ( = ?auto_646631 ?auto_646633 ) ) ( not ( = ?auto_646631 ?auto_646634 ) ) ( not ( = ?auto_646631 ?auto_646635 ) ) ( not ( = ?auto_646631 ?auto_646636 ) ) ( not ( = ?auto_646631 ?auto_646637 ) ) ( not ( = ?auto_646631 ?auto_646641 ) ) ( not ( = ?auto_646632 ?auto_646633 ) ) ( not ( = ?auto_646632 ?auto_646634 ) ) ( not ( = ?auto_646632 ?auto_646635 ) ) ( not ( = ?auto_646632 ?auto_646636 ) ) ( not ( = ?auto_646632 ?auto_646637 ) ) ( not ( = ?auto_646632 ?auto_646641 ) ) ( not ( = ?auto_646633 ?auto_646634 ) ) ( not ( = ?auto_646633 ?auto_646635 ) ) ( not ( = ?auto_646633 ?auto_646636 ) ) ( not ( = ?auto_646633 ?auto_646637 ) ) ( not ( = ?auto_646633 ?auto_646641 ) ) ( not ( = ?auto_646634 ?auto_646635 ) ) ( not ( = ?auto_646634 ?auto_646636 ) ) ( not ( = ?auto_646634 ?auto_646637 ) ) ( not ( = ?auto_646634 ?auto_646641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646635 ?auto_646636 ?auto_646637 )
      ( MAKE-6CRATE-VERIFY ?auto_646631 ?auto_646632 ?auto_646633 ?auto_646634 ?auto_646635 ?auto_646636 ?auto_646637 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646695 - SURFACE
      ?auto_646696 - SURFACE
      ?auto_646697 - SURFACE
      ?auto_646698 - SURFACE
      ?auto_646699 - SURFACE
      ?auto_646700 - SURFACE
      ?auto_646701 - SURFACE
    )
    :vars
    (
      ?auto_646702 - HOIST
      ?auto_646705 - PLACE
      ?auto_646703 - PLACE
      ?auto_646704 - HOIST
      ?auto_646706 - SURFACE
      ?auto_646707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646702 ?auto_646705 ) ( SURFACE-AT ?auto_646700 ?auto_646705 ) ( CLEAR ?auto_646700 ) ( IS-CRATE ?auto_646701 ) ( not ( = ?auto_646700 ?auto_646701 ) ) ( AVAILABLE ?auto_646702 ) ( ON ?auto_646700 ?auto_646699 ) ( not ( = ?auto_646699 ?auto_646700 ) ) ( not ( = ?auto_646699 ?auto_646701 ) ) ( not ( = ?auto_646703 ?auto_646705 ) ) ( HOIST-AT ?auto_646704 ?auto_646703 ) ( not ( = ?auto_646702 ?auto_646704 ) ) ( AVAILABLE ?auto_646704 ) ( SURFACE-AT ?auto_646701 ?auto_646703 ) ( ON ?auto_646701 ?auto_646706 ) ( CLEAR ?auto_646701 ) ( not ( = ?auto_646700 ?auto_646706 ) ) ( not ( = ?auto_646701 ?auto_646706 ) ) ( not ( = ?auto_646699 ?auto_646706 ) ) ( TRUCK-AT ?auto_646707 ?auto_646705 ) ( ON ?auto_646696 ?auto_646695 ) ( ON ?auto_646697 ?auto_646696 ) ( ON ?auto_646698 ?auto_646697 ) ( ON ?auto_646699 ?auto_646698 ) ( not ( = ?auto_646695 ?auto_646696 ) ) ( not ( = ?auto_646695 ?auto_646697 ) ) ( not ( = ?auto_646695 ?auto_646698 ) ) ( not ( = ?auto_646695 ?auto_646699 ) ) ( not ( = ?auto_646695 ?auto_646700 ) ) ( not ( = ?auto_646695 ?auto_646701 ) ) ( not ( = ?auto_646695 ?auto_646706 ) ) ( not ( = ?auto_646696 ?auto_646697 ) ) ( not ( = ?auto_646696 ?auto_646698 ) ) ( not ( = ?auto_646696 ?auto_646699 ) ) ( not ( = ?auto_646696 ?auto_646700 ) ) ( not ( = ?auto_646696 ?auto_646701 ) ) ( not ( = ?auto_646696 ?auto_646706 ) ) ( not ( = ?auto_646697 ?auto_646698 ) ) ( not ( = ?auto_646697 ?auto_646699 ) ) ( not ( = ?auto_646697 ?auto_646700 ) ) ( not ( = ?auto_646697 ?auto_646701 ) ) ( not ( = ?auto_646697 ?auto_646706 ) ) ( not ( = ?auto_646698 ?auto_646699 ) ) ( not ( = ?auto_646698 ?auto_646700 ) ) ( not ( = ?auto_646698 ?auto_646701 ) ) ( not ( = ?auto_646698 ?auto_646706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646699 ?auto_646700 ?auto_646701 )
      ( MAKE-6CRATE-VERIFY ?auto_646695 ?auto_646696 ?auto_646697 ?auto_646698 ?auto_646699 ?auto_646700 ?auto_646701 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646759 - SURFACE
      ?auto_646760 - SURFACE
      ?auto_646761 - SURFACE
      ?auto_646762 - SURFACE
      ?auto_646763 - SURFACE
      ?auto_646764 - SURFACE
      ?auto_646765 - SURFACE
    )
    :vars
    (
      ?auto_646768 - HOIST
      ?auto_646767 - PLACE
      ?auto_646771 - PLACE
      ?auto_646769 - HOIST
      ?auto_646766 - SURFACE
      ?auto_646770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646768 ?auto_646767 ) ( IS-CRATE ?auto_646765 ) ( not ( = ?auto_646764 ?auto_646765 ) ) ( not ( = ?auto_646763 ?auto_646764 ) ) ( not ( = ?auto_646763 ?auto_646765 ) ) ( not ( = ?auto_646771 ?auto_646767 ) ) ( HOIST-AT ?auto_646769 ?auto_646771 ) ( not ( = ?auto_646768 ?auto_646769 ) ) ( AVAILABLE ?auto_646769 ) ( SURFACE-AT ?auto_646765 ?auto_646771 ) ( ON ?auto_646765 ?auto_646766 ) ( CLEAR ?auto_646765 ) ( not ( = ?auto_646764 ?auto_646766 ) ) ( not ( = ?auto_646765 ?auto_646766 ) ) ( not ( = ?auto_646763 ?auto_646766 ) ) ( TRUCK-AT ?auto_646770 ?auto_646767 ) ( SURFACE-AT ?auto_646763 ?auto_646767 ) ( CLEAR ?auto_646763 ) ( LIFTING ?auto_646768 ?auto_646764 ) ( IS-CRATE ?auto_646764 ) ( ON ?auto_646760 ?auto_646759 ) ( ON ?auto_646761 ?auto_646760 ) ( ON ?auto_646762 ?auto_646761 ) ( ON ?auto_646763 ?auto_646762 ) ( not ( = ?auto_646759 ?auto_646760 ) ) ( not ( = ?auto_646759 ?auto_646761 ) ) ( not ( = ?auto_646759 ?auto_646762 ) ) ( not ( = ?auto_646759 ?auto_646763 ) ) ( not ( = ?auto_646759 ?auto_646764 ) ) ( not ( = ?auto_646759 ?auto_646765 ) ) ( not ( = ?auto_646759 ?auto_646766 ) ) ( not ( = ?auto_646760 ?auto_646761 ) ) ( not ( = ?auto_646760 ?auto_646762 ) ) ( not ( = ?auto_646760 ?auto_646763 ) ) ( not ( = ?auto_646760 ?auto_646764 ) ) ( not ( = ?auto_646760 ?auto_646765 ) ) ( not ( = ?auto_646760 ?auto_646766 ) ) ( not ( = ?auto_646761 ?auto_646762 ) ) ( not ( = ?auto_646761 ?auto_646763 ) ) ( not ( = ?auto_646761 ?auto_646764 ) ) ( not ( = ?auto_646761 ?auto_646765 ) ) ( not ( = ?auto_646761 ?auto_646766 ) ) ( not ( = ?auto_646762 ?auto_646763 ) ) ( not ( = ?auto_646762 ?auto_646764 ) ) ( not ( = ?auto_646762 ?auto_646765 ) ) ( not ( = ?auto_646762 ?auto_646766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646763 ?auto_646764 ?auto_646765 )
      ( MAKE-6CRATE-VERIFY ?auto_646759 ?auto_646760 ?auto_646761 ?auto_646762 ?auto_646763 ?auto_646764 ?auto_646765 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646823 - SURFACE
      ?auto_646824 - SURFACE
      ?auto_646825 - SURFACE
      ?auto_646826 - SURFACE
      ?auto_646827 - SURFACE
      ?auto_646828 - SURFACE
      ?auto_646829 - SURFACE
    )
    :vars
    (
      ?auto_646832 - HOIST
      ?auto_646831 - PLACE
      ?auto_646834 - PLACE
      ?auto_646833 - HOIST
      ?auto_646835 - SURFACE
      ?auto_646830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646832 ?auto_646831 ) ( IS-CRATE ?auto_646829 ) ( not ( = ?auto_646828 ?auto_646829 ) ) ( not ( = ?auto_646827 ?auto_646828 ) ) ( not ( = ?auto_646827 ?auto_646829 ) ) ( not ( = ?auto_646834 ?auto_646831 ) ) ( HOIST-AT ?auto_646833 ?auto_646834 ) ( not ( = ?auto_646832 ?auto_646833 ) ) ( AVAILABLE ?auto_646833 ) ( SURFACE-AT ?auto_646829 ?auto_646834 ) ( ON ?auto_646829 ?auto_646835 ) ( CLEAR ?auto_646829 ) ( not ( = ?auto_646828 ?auto_646835 ) ) ( not ( = ?auto_646829 ?auto_646835 ) ) ( not ( = ?auto_646827 ?auto_646835 ) ) ( TRUCK-AT ?auto_646830 ?auto_646831 ) ( SURFACE-AT ?auto_646827 ?auto_646831 ) ( CLEAR ?auto_646827 ) ( IS-CRATE ?auto_646828 ) ( AVAILABLE ?auto_646832 ) ( IN ?auto_646828 ?auto_646830 ) ( ON ?auto_646824 ?auto_646823 ) ( ON ?auto_646825 ?auto_646824 ) ( ON ?auto_646826 ?auto_646825 ) ( ON ?auto_646827 ?auto_646826 ) ( not ( = ?auto_646823 ?auto_646824 ) ) ( not ( = ?auto_646823 ?auto_646825 ) ) ( not ( = ?auto_646823 ?auto_646826 ) ) ( not ( = ?auto_646823 ?auto_646827 ) ) ( not ( = ?auto_646823 ?auto_646828 ) ) ( not ( = ?auto_646823 ?auto_646829 ) ) ( not ( = ?auto_646823 ?auto_646835 ) ) ( not ( = ?auto_646824 ?auto_646825 ) ) ( not ( = ?auto_646824 ?auto_646826 ) ) ( not ( = ?auto_646824 ?auto_646827 ) ) ( not ( = ?auto_646824 ?auto_646828 ) ) ( not ( = ?auto_646824 ?auto_646829 ) ) ( not ( = ?auto_646824 ?auto_646835 ) ) ( not ( = ?auto_646825 ?auto_646826 ) ) ( not ( = ?auto_646825 ?auto_646827 ) ) ( not ( = ?auto_646825 ?auto_646828 ) ) ( not ( = ?auto_646825 ?auto_646829 ) ) ( not ( = ?auto_646825 ?auto_646835 ) ) ( not ( = ?auto_646826 ?auto_646827 ) ) ( not ( = ?auto_646826 ?auto_646828 ) ) ( not ( = ?auto_646826 ?auto_646829 ) ) ( not ( = ?auto_646826 ?auto_646835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646827 ?auto_646828 ?auto_646829 )
      ( MAKE-6CRATE-VERIFY ?auto_646823 ?auto_646824 ?auto_646825 ?auto_646826 ?auto_646827 ?auto_646828 ?auto_646829 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646887 - SURFACE
      ?auto_646888 - SURFACE
      ?auto_646889 - SURFACE
      ?auto_646890 - SURFACE
      ?auto_646891 - SURFACE
      ?auto_646892 - SURFACE
      ?auto_646893 - SURFACE
    )
    :vars
    (
      ?auto_646896 - HOIST
      ?auto_646895 - PLACE
      ?auto_646898 - PLACE
      ?auto_646897 - HOIST
      ?auto_646894 - SURFACE
      ?auto_646899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646896 ?auto_646895 ) ( IS-CRATE ?auto_646893 ) ( not ( = ?auto_646892 ?auto_646893 ) ) ( not ( = ?auto_646891 ?auto_646892 ) ) ( not ( = ?auto_646891 ?auto_646893 ) ) ( not ( = ?auto_646898 ?auto_646895 ) ) ( HOIST-AT ?auto_646897 ?auto_646898 ) ( not ( = ?auto_646896 ?auto_646897 ) ) ( AVAILABLE ?auto_646897 ) ( SURFACE-AT ?auto_646893 ?auto_646898 ) ( ON ?auto_646893 ?auto_646894 ) ( CLEAR ?auto_646893 ) ( not ( = ?auto_646892 ?auto_646894 ) ) ( not ( = ?auto_646893 ?auto_646894 ) ) ( not ( = ?auto_646891 ?auto_646894 ) ) ( SURFACE-AT ?auto_646891 ?auto_646895 ) ( CLEAR ?auto_646891 ) ( IS-CRATE ?auto_646892 ) ( AVAILABLE ?auto_646896 ) ( IN ?auto_646892 ?auto_646899 ) ( TRUCK-AT ?auto_646899 ?auto_646898 ) ( ON ?auto_646888 ?auto_646887 ) ( ON ?auto_646889 ?auto_646888 ) ( ON ?auto_646890 ?auto_646889 ) ( ON ?auto_646891 ?auto_646890 ) ( not ( = ?auto_646887 ?auto_646888 ) ) ( not ( = ?auto_646887 ?auto_646889 ) ) ( not ( = ?auto_646887 ?auto_646890 ) ) ( not ( = ?auto_646887 ?auto_646891 ) ) ( not ( = ?auto_646887 ?auto_646892 ) ) ( not ( = ?auto_646887 ?auto_646893 ) ) ( not ( = ?auto_646887 ?auto_646894 ) ) ( not ( = ?auto_646888 ?auto_646889 ) ) ( not ( = ?auto_646888 ?auto_646890 ) ) ( not ( = ?auto_646888 ?auto_646891 ) ) ( not ( = ?auto_646888 ?auto_646892 ) ) ( not ( = ?auto_646888 ?auto_646893 ) ) ( not ( = ?auto_646888 ?auto_646894 ) ) ( not ( = ?auto_646889 ?auto_646890 ) ) ( not ( = ?auto_646889 ?auto_646891 ) ) ( not ( = ?auto_646889 ?auto_646892 ) ) ( not ( = ?auto_646889 ?auto_646893 ) ) ( not ( = ?auto_646889 ?auto_646894 ) ) ( not ( = ?auto_646890 ?auto_646891 ) ) ( not ( = ?auto_646890 ?auto_646892 ) ) ( not ( = ?auto_646890 ?auto_646893 ) ) ( not ( = ?auto_646890 ?auto_646894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646891 ?auto_646892 ?auto_646893 )
      ( MAKE-6CRATE-VERIFY ?auto_646887 ?auto_646888 ?auto_646889 ?auto_646890 ?auto_646891 ?auto_646892 ?auto_646893 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646951 - SURFACE
      ?auto_646952 - SURFACE
      ?auto_646953 - SURFACE
      ?auto_646954 - SURFACE
      ?auto_646955 - SURFACE
      ?auto_646956 - SURFACE
      ?auto_646957 - SURFACE
    )
    :vars
    (
      ?auto_646959 - HOIST
      ?auto_646960 - PLACE
      ?auto_646962 - PLACE
      ?auto_646961 - HOIST
      ?auto_646963 - SURFACE
      ?auto_646958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646959 ?auto_646960 ) ( IS-CRATE ?auto_646957 ) ( not ( = ?auto_646956 ?auto_646957 ) ) ( not ( = ?auto_646955 ?auto_646956 ) ) ( not ( = ?auto_646955 ?auto_646957 ) ) ( not ( = ?auto_646962 ?auto_646960 ) ) ( HOIST-AT ?auto_646961 ?auto_646962 ) ( not ( = ?auto_646959 ?auto_646961 ) ) ( SURFACE-AT ?auto_646957 ?auto_646962 ) ( ON ?auto_646957 ?auto_646963 ) ( CLEAR ?auto_646957 ) ( not ( = ?auto_646956 ?auto_646963 ) ) ( not ( = ?auto_646957 ?auto_646963 ) ) ( not ( = ?auto_646955 ?auto_646963 ) ) ( SURFACE-AT ?auto_646955 ?auto_646960 ) ( CLEAR ?auto_646955 ) ( IS-CRATE ?auto_646956 ) ( AVAILABLE ?auto_646959 ) ( TRUCK-AT ?auto_646958 ?auto_646962 ) ( LIFTING ?auto_646961 ?auto_646956 ) ( ON ?auto_646952 ?auto_646951 ) ( ON ?auto_646953 ?auto_646952 ) ( ON ?auto_646954 ?auto_646953 ) ( ON ?auto_646955 ?auto_646954 ) ( not ( = ?auto_646951 ?auto_646952 ) ) ( not ( = ?auto_646951 ?auto_646953 ) ) ( not ( = ?auto_646951 ?auto_646954 ) ) ( not ( = ?auto_646951 ?auto_646955 ) ) ( not ( = ?auto_646951 ?auto_646956 ) ) ( not ( = ?auto_646951 ?auto_646957 ) ) ( not ( = ?auto_646951 ?auto_646963 ) ) ( not ( = ?auto_646952 ?auto_646953 ) ) ( not ( = ?auto_646952 ?auto_646954 ) ) ( not ( = ?auto_646952 ?auto_646955 ) ) ( not ( = ?auto_646952 ?auto_646956 ) ) ( not ( = ?auto_646952 ?auto_646957 ) ) ( not ( = ?auto_646952 ?auto_646963 ) ) ( not ( = ?auto_646953 ?auto_646954 ) ) ( not ( = ?auto_646953 ?auto_646955 ) ) ( not ( = ?auto_646953 ?auto_646956 ) ) ( not ( = ?auto_646953 ?auto_646957 ) ) ( not ( = ?auto_646953 ?auto_646963 ) ) ( not ( = ?auto_646954 ?auto_646955 ) ) ( not ( = ?auto_646954 ?auto_646956 ) ) ( not ( = ?auto_646954 ?auto_646957 ) ) ( not ( = ?auto_646954 ?auto_646963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646955 ?auto_646956 ?auto_646957 )
      ( MAKE-6CRATE-VERIFY ?auto_646951 ?auto_646952 ?auto_646953 ?auto_646954 ?auto_646955 ?auto_646956 ?auto_646957 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_647020 - SURFACE
      ?auto_647021 - SURFACE
      ?auto_647022 - SURFACE
      ?auto_647023 - SURFACE
      ?auto_647024 - SURFACE
      ?auto_647025 - SURFACE
      ?auto_647026 - SURFACE
    )
    :vars
    (
      ?auto_647027 - HOIST
      ?auto_647032 - PLACE
      ?auto_647031 - PLACE
      ?auto_647033 - HOIST
      ?auto_647028 - SURFACE
      ?auto_647030 - TRUCK
      ?auto_647029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_647027 ?auto_647032 ) ( IS-CRATE ?auto_647026 ) ( not ( = ?auto_647025 ?auto_647026 ) ) ( not ( = ?auto_647024 ?auto_647025 ) ) ( not ( = ?auto_647024 ?auto_647026 ) ) ( not ( = ?auto_647031 ?auto_647032 ) ) ( HOIST-AT ?auto_647033 ?auto_647031 ) ( not ( = ?auto_647027 ?auto_647033 ) ) ( SURFACE-AT ?auto_647026 ?auto_647031 ) ( ON ?auto_647026 ?auto_647028 ) ( CLEAR ?auto_647026 ) ( not ( = ?auto_647025 ?auto_647028 ) ) ( not ( = ?auto_647026 ?auto_647028 ) ) ( not ( = ?auto_647024 ?auto_647028 ) ) ( SURFACE-AT ?auto_647024 ?auto_647032 ) ( CLEAR ?auto_647024 ) ( IS-CRATE ?auto_647025 ) ( AVAILABLE ?auto_647027 ) ( TRUCK-AT ?auto_647030 ?auto_647031 ) ( AVAILABLE ?auto_647033 ) ( SURFACE-AT ?auto_647025 ?auto_647031 ) ( ON ?auto_647025 ?auto_647029 ) ( CLEAR ?auto_647025 ) ( not ( = ?auto_647025 ?auto_647029 ) ) ( not ( = ?auto_647026 ?auto_647029 ) ) ( not ( = ?auto_647024 ?auto_647029 ) ) ( not ( = ?auto_647028 ?auto_647029 ) ) ( ON ?auto_647021 ?auto_647020 ) ( ON ?auto_647022 ?auto_647021 ) ( ON ?auto_647023 ?auto_647022 ) ( ON ?auto_647024 ?auto_647023 ) ( not ( = ?auto_647020 ?auto_647021 ) ) ( not ( = ?auto_647020 ?auto_647022 ) ) ( not ( = ?auto_647020 ?auto_647023 ) ) ( not ( = ?auto_647020 ?auto_647024 ) ) ( not ( = ?auto_647020 ?auto_647025 ) ) ( not ( = ?auto_647020 ?auto_647026 ) ) ( not ( = ?auto_647020 ?auto_647028 ) ) ( not ( = ?auto_647020 ?auto_647029 ) ) ( not ( = ?auto_647021 ?auto_647022 ) ) ( not ( = ?auto_647021 ?auto_647023 ) ) ( not ( = ?auto_647021 ?auto_647024 ) ) ( not ( = ?auto_647021 ?auto_647025 ) ) ( not ( = ?auto_647021 ?auto_647026 ) ) ( not ( = ?auto_647021 ?auto_647028 ) ) ( not ( = ?auto_647021 ?auto_647029 ) ) ( not ( = ?auto_647022 ?auto_647023 ) ) ( not ( = ?auto_647022 ?auto_647024 ) ) ( not ( = ?auto_647022 ?auto_647025 ) ) ( not ( = ?auto_647022 ?auto_647026 ) ) ( not ( = ?auto_647022 ?auto_647028 ) ) ( not ( = ?auto_647022 ?auto_647029 ) ) ( not ( = ?auto_647023 ?auto_647024 ) ) ( not ( = ?auto_647023 ?auto_647025 ) ) ( not ( = ?auto_647023 ?auto_647026 ) ) ( not ( = ?auto_647023 ?auto_647028 ) ) ( not ( = ?auto_647023 ?auto_647029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_647024 ?auto_647025 ?auto_647026 )
      ( MAKE-6CRATE-VERIFY ?auto_647020 ?auto_647021 ?auto_647022 ?auto_647023 ?auto_647024 ?auto_647025 ?auto_647026 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_647090 - SURFACE
      ?auto_647091 - SURFACE
      ?auto_647092 - SURFACE
      ?auto_647093 - SURFACE
      ?auto_647094 - SURFACE
      ?auto_647095 - SURFACE
      ?auto_647096 - SURFACE
    )
    :vars
    (
      ?auto_647100 - HOIST
      ?auto_647102 - PLACE
      ?auto_647101 - PLACE
      ?auto_647103 - HOIST
      ?auto_647099 - SURFACE
      ?auto_647098 - SURFACE
      ?auto_647097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_647100 ?auto_647102 ) ( IS-CRATE ?auto_647096 ) ( not ( = ?auto_647095 ?auto_647096 ) ) ( not ( = ?auto_647094 ?auto_647095 ) ) ( not ( = ?auto_647094 ?auto_647096 ) ) ( not ( = ?auto_647101 ?auto_647102 ) ) ( HOIST-AT ?auto_647103 ?auto_647101 ) ( not ( = ?auto_647100 ?auto_647103 ) ) ( SURFACE-AT ?auto_647096 ?auto_647101 ) ( ON ?auto_647096 ?auto_647099 ) ( CLEAR ?auto_647096 ) ( not ( = ?auto_647095 ?auto_647099 ) ) ( not ( = ?auto_647096 ?auto_647099 ) ) ( not ( = ?auto_647094 ?auto_647099 ) ) ( SURFACE-AT ?auto_647094 ?auto_647102 ) ( CLEAR ?auto_647094 ) ( IS-CRATE ?auto_647095 ) ( AVAILABLE ?auto_647100 ) ( AVAILABLE ?auto_647103 ) ( SURFACE-AT ?auto_647095 ?auto_647101 ) ( ON ?auto_647095 ?auto_647098 ) ( CLEAR ?auto_647095 ) ( not ( = ?auto_647095 ?auto_647098 ) ) ( not ( = ?auto_647096 ?auto_647098 ) ) ( not ( = ?auto_647094 ?auto_647098 ) ) ( not ( = ?auto_647099 ?auto_647098 ) ) ( TRUCK-AT ?auto_647097 ?auto_647102 ) ( ON ?auto_647091 ?auto_647090 ) ( ON ?auto_647092 ?auto_647091 ) ( ON ?auto_647093 ?auto_647092 ) ( ON ?auto_647094 ?auto_647093 ) ( not ( = ?auto_647090 ?auto_647091 ) ) ( not ( = ?auto_647090 ?auto_647092 ) ) ( not ( = ?auto_647090 ?auto_647093 ) ) ( not ( = ?auto_647090 ?auto_647094 ) ) ( not ( = ?auto_647090 ?auto_647095 ) ) ( not ( = ?auto_647090 ?auto_647096 ) ) ( not ( = ?auto_647090 ?auto_647099 ) ) ( not ( = ?auto_647090 ?auto_647098 ) ) ( not ( = ?auto_647091 ?auto_647092 ) ) ( not ( = ?auto_647091 ?auto_647093 ) ) ( not ( = ?auto_647091 ?auto_647094 ) ) ( not ( = ?auto_647091 ?auto_647095 ) ) ( not ( = ?auto_647091 ?auto_647096 ) ) ( not ( = ?auto_647091 ?auto_647099 ) ) ( not ( = ?auto_647091 ?auto_647098 ) ) ( not ( = ?auto_647092 ?auto_647093 ) ) ( not ( = ?auto_647092 ?auto_647094 ) ) ( not ( = ?auto_647092 ?auto_647095 ) ) ( not ( = ?auto_647092 ?auto_647096 ) ) ( not ( = ?auto_647092 ?auto_647099 ) ) ( not ( = ?auto_647092 ?auto_647098 ) ) ( not ( = ?auto_647093 ?auto_647094 ) ) ( not ( = ?auto_647093 ?auto_647095 ) ) ( not ( = ?auto_647093 ?auto_647096 ) ) ( not ( = ?auto_647093 ?auto_647099 ) ) ( not ( = ?auto_647093 ?auto_647098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_647094 ?auto_647095 ?auto_647096 )
      ( MAKE-6CRATE-VERIFY ?auto_647090 ?auto_647091 ?auto_647092 ?auto_647093 ?auto_647094 ?auto_647095 ?auto_647096 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_647162 - SURFACE
      ?auto_647163 - SURFACE
      ?auto_647164 - SURFACE
      ?auto_647165 - SURFACE
      ?auto_647166 - SURFACE
      ?auto_647167 - SURFACE
      ?auto_647168 - SURFACE
    )
    :vars
    (
      ?auto_647173 - HOIST
      ?auto_647170 - PLACE
      ?auto_647171 - PLACE
      ?auto_647172 - HOIST
      ?auto_647174 - SURFACE
      ?auto_647175 - SURFACE
      ?auto_647169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_647173 ?auto_647170 ) ( IS-CRATE ?auto_647168 ) ( not ( = ?auto_647167 ?auto_647168 ) ) ( not ( = ?auto_647166 ?auto_647167 ) ) ( not ( = ?auto_647166 ?auto_647168 ) ) ( not ( = ?auto_647171 ?auto_647170 ) ) ( HOIST-AT ?auto_647172 ?auto_647171 ) ( not ( = ?auto_647173 ?auto_647172 ) ) ( SURFACE-AT ?auto_647168 ?auto_647171 ) ( ON ?auto_647168 ?auto_647174 ) ( CLEAR ?auto_647168 ) ( not ( = ?auto_647167 ?auto_647174 ) ) ( not ( = ?auto_647168 ?auto_647174 ) ) ( not ( = ?auto_647166 ?auto_647174 ) ) ( IS-CRATE ?auto_647167 ) ( AVAILABLE ?auto_647172 ) ( SURFACE-AT ?auto_647167 ?auto_647171 ) ( ON ?auto_647167 ?auto_647175 ) ( CLEAR ?auto_647167 ) ( not ( = ?auto_647167 ?auto_647175 ) ) ( not ( = ?auto_647168 ?auto_647175 ) ) ( not ( = ?auto_647166 ?auto_647175 ) ) ( not ( = ?auto_647174 ?auto_647175 ) ) ( TRUCK-AT ?auto_647169 ?auto_647170 ) ( SURFACE-AT ?auto_647165 ?auto_647170 ) ( CLEAR ?auto_647165 ) ( LIFTING ?auto_647173 ?auto_647166 ) ( IS-CRATE ?auto_647166 ) ( not ( = ?auto_647165 ?auto_647166 ) ) ( not ( = ?auto_647167 ?auto_647165 ) ) ( not ( = ?auto_647168 ?auto_647165 ) ) ( not ( = ?auto_647174 ?auto_647165 ) ) ( not ( = ?auto_647175 ?auto_647165 ) ) ( ON ?auto_647163 ?auto_647162 ) ( ON ?auto_647164 ?auto_647163 ) ( ON ?auto_647165 ?auto_647164 ) ( not ( = ?auto_647162 ?auto_647163 ) ) ( not ( = ?auto_647162 ?auto_647164 ) ) ( not ( = ?auto_647162 ?auto_647165 ) ) ( not ( = ?auto_647162 ?auto_647166 ) ) ( not ( = ?auto_647162 ?auto_647167 ) ) ( not ( = ?auto_647162 ?auto_647168 ) ) ( not ( = ?auto_647162 ?auto_647174 ) ) ( not ( = ?auto_647162 ?auto_647175 ) ) ( not ( = ?auto_647163 ?auto_647164 ) ) ( not ( = ?auto_647163 ?auto_647165 ) ) ( not ( = ?auto_647163 ?auto_647166 ) ) ( not ( = ?auto_647163 ?auto_647167 ) ) ( not ( = ?auto_647163 ?auto_647168 ) ) ( not ( = ?auto_647163 ?auto_647174 ) ) ( not ( = ?auto_647163 ?auto_647175 ) ) ( not ( = ?auto_647164 ?auto_647165 ) ) ( not ( = ?auto_647164 ?auto_647166 ) ) ( not ( = ?auto_647164 ?auto_647167 ) ) ( not ( = ?auto_647164 ?auto_647168 ) ) ( not ( = ?auto_647164 ?auto_647174 ) ) ( not ( = ?auto_647164 ?auto_647175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_647166 ?auto_647167 ?auto_647168 )
      ( MAKE-6CRATE-VERIFY ?auto_647162 ?auto_647163 ?auto_647164 ?auto_647165 ?auto_647166 ?auto_647167 ?auto_647168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_647306 - SURFACE
      ?auto_647307 - SURFACE
    )
    :vars
    (
      ?auto_647308 - HOIST
      ?auto_647310 - PLACE
      ?auto_647309 - SURFACE
      ?auto_647314 - PLACE
      ?auto_647313 - HOIST
      ?auto_647312 - SURFACE
      ?auto_647315 - TRUCK
      ?auto_647311 - SURFACE
      ?auto_647316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_647308 ?auto_647310 ) ( IS-CRATE ?auto_647307 ) ( not ( = ?auto_647306 ?auto_647307 ) ) ( not ( = ?auto_647309 ?auto_647306 ) ) ( not ( = ?auto_647309 ?auto_647307 ) ) ( not ( = ?auto_647314 ?auto_647310 ) ) ( HOIST-AT ?auto_647313 ?auto_647314 ) ( not ( = ?auto_647308 ?auto_647313 ) ) ( SURFACE-AT ?auto_647307 ?auto_647314 ) ( ON ?auto_647307 ?auto_647312 ) ( CLEAR ?auto_647307 ) ( not ( = ?auto_647306 ?auto_647312 ) ) ( not ( = ?auto_647307 ?auto_647312 ) ) ( not ( = ?auto_647309 ?auto_647312 ) ) ( SURFACE-AT ?auto_647309 ?auto_647310 ) ( CLEAR ?auto_647309 ) ( IS-CRATE ?auto_647306 ) ( AVAILABLE ?auto_647308 ) ( TRUCK-AT ?auto_647315 ?auto_647314 ) ( SURFACE-AT ?auto_647306 ?auto_647314 ) ( ON ?auto_647306 ?auto_647311 ) ( CLEAR ?auto_647306 ) ( not ( = ?auto_647306 ?auto_647311 ) ) ( not ( = ?auto_647307 ?auto_647311 ) ) ( not ( = ?auto_647309 ?auto_647311 ) ) ( not ( = ?auto_647312 ?auto_647311 ) ) ( LIFTING ?auto_647313 ?auto_647316 ) ( IS-CRATE ?auto_647316 ) ( not ( = ?auto_647306 ?auto_647316 ) ) ( not ( = ?auto_647307 ?auto_647316 ) ) ( not ( = ?auto_647309 ?auto_647316 ) ) ( not ( = ?auto_647312 ?auto_647316 ) ) ( not ( = ?auto_647311 ?auto_647316 ) ) )
    :subtasks
    ( ( !LOAD ?auto_647313 ?auto_647316 ?auto_647315 ?auto_647314 )
      ( MAKE-1CRATE ?auto_647306 ?auto_647307 )
      ( MAKE-1CRATE-VERIFY ?auto_647306 ?auto_647307 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648777 - SURFACE
      ?auto_648778 - SURFACE
      ?auto_648779 - SURFACE
      ?auto_648780 - SURFACE
      ?auto_648781 - SURFACE
      ?auto_648782 - SURFACE
      ?auto_648783 - SURFACE
      ?auto_648784 - SURFACE
    )
    :vars
    (
      ?auto_648786 - HOIST
      ?auto_648785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648786 ?auto_648785 ) ( SURFACE-AT ?auto_648783 ?auto_648785 ) ( CLEAR ?auto_648783 ) ( LIFTING ?auto_648786 ?auto_648784 ) ( IS-CRATE ?auto_648784 ) ( not ( = ?auto_648783 ?auto_648784 ) ) ( ON ?auto_648778 ?auto_648777 ) ( ON ?auto_648779 ?auto_648778 ) ( ON ?auto_648780 ?auto_648779 ) ( ON ?auto_648781 ?auto_648780 ) ( ON ?auto_648782 ?auto_648781 ) ( ON ?auto_648783 ?auto_648782 ) ( not ( = ?auto_648777 ?auto_648778 ) ) ( not ( = ?auto_648777 ?auto_648779 ) ) ( not ( = ?auto_648777 ?auto_648780 ) ) ( not ( = ?auto_648777 ?auto_648781 ) ) ( not ( = ?auto_648777 ?auto_648782 ) ) ( not ( = ?auto_648777 ?auto_648783 ) ) ( not ( = ?auto_648777 ?auto_648784 ) ) ( not ( = ?auto_648778 ?auto_648779 ) ) ( not ( = ?auto_648778 ?auto_648780 ) ) ( not ( = ?auto_648778 ?auto_648781 ) ) ( not ( = ?auto_648778 ?auto_648782 ) ) ( not ( = ?auto_648778 ?auto_648783 ) ) ( not ( = ?auto_648778 ?auto_648784 ) ) ( not ( = ?auto_648779 ?auto_648780 ) ) ( not ( = ?auto_648779 ?auto_648781 ) ) ( not ( = ?auto_648779 ?auto_648782 ) ) ( not ( = ?auto_648779 ?auto_648783 ) ) ( not ( = ?auto_648779 ?auto_648784 ) ) ( not ( = ?auto_648780 ?auto_648781 ) ) ( not ( = ?auto_648780 ?auto_648782 ) ) ( not ( = ?auto_648780 ?auto_648783 ) ) ( not ( = ?auto_648780 ?auto_648784 ) ) ( not ( = ?auto_648781 ?auto_648782 ) ) ( not ( = ?auto_648781 ?auto_648783 ) ) ( not ( = ?auto_648781 ?auto_648784 ) ) ( not ( = ?auto_648782 ?auto_648783 ) ) ( not ( = ?auto_648782 ?auto_648784 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_648783 ?auto_648784 )
      ( MAKE-7CRATE-VERIFY ?auto_648777 ?auto_648778 ?auto_648779 ?auto_648780 ?auto_648781 ?auto_648782 ?auto_648783 ?auto_648784 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648832 - SURFACE
      ?auto_648833 - SURFACE
      ?auto_648834 - SURFACE
      ?auto_648835 - SURFACE
      ?auto_648836 - SURFACE
      ?auto_648837 - SURFACE
      ?auto_648838 - SURFACE
      ?auto_648839 - SURFACE
    )
    :vars
    (
      ?auto_648842 - HOIST
      ?auto_648840 - PLACE
      ?auto_648841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648842 ?auto_648840 ) ( SURFACE-AT ?auto_648838 ?auto_648840 ) ( CLEAR ?auto_648838 ) ( IS-CRATE ?auto_648839 ) ( not ( = ?auto_648838 ?auto_648839 ) ) ( TRUCK-AT ?auto_648841 ?auto_648840 ) ( AVAILABLE ?auto_648842 ) ( IN ?auto_648839 ?auto_648841 ) ( ON ?auto_648838 ?auto_648837 ) ( not ( = ?auto_648837 ?auto_648838 ) ) ( not ( = ?auto_648837 ?auto_648839 ) ) ( ON ?auto_648833 ?auto_648832 ) ( ON ?auto_648834 ?auto_648833 ) ( ON ?auto_648835 ?auto_648834 ) ( ON ?auto_648836 ?auto_648835 ) ( ON ?auto_648837 ?auto_648836 ) ( not ( = ?auto_648832 ?auto_648833 ) ) ( not ( = ?auto_648832 ?auto_648834 ) ) ( not ( = ?auto_648832 ?auto_648835 ) ) ( not ( = ?auto_648832 ?auto_648836 ) ) ( not ( = ?auto_648832 ?auto_648837 ) ) ( not ( = ?auto_648832 ?auto_648838 ) ) ( not ( = ?auto_648832 ?auto_648839 ) ) ( not ( = ?auto_648833 ?auto_648834 ) ) ( not ( = ?auto_648833 ?auto_648835 ) ) ( not ( = ?auto_648833 ?auto_648836 ) ) ( not ( = ?auto_648833 ?auto_648837 ) ) ( not ( = ?auto_648833 ?auto_648838 ) ) ( not ( = ?auto_648833 ?auto_648839 ) ) ( not ( = ?auto_648834 ?auto_648835 ) ) ( not ( = ?auto_648834 ?auto_648836 ) ) ( not ( = ?auto_648834 ?auto_648837 ) ) ( not ( = ?auto_648834 ?auto_648838 ) ) ( not ( = ?auto_648834 ?auto_648839 ) ) ( not ( = ?auto_648835 ?auto_648836 ) ) ( not ( = ?auto_648835 ?auto_648837 ) ) ( not ( = ?auto_648835 ?auto_648838 ) ) ( not ( = ?auto_648835 ?auto_648839 ) ) ( not ( = ?auto_648836 ?auto_648837 ) ) ( not ( = ?auto_648836 ?auto_648838 ) ) ( not ( = ?auto_648836 ?auto_648839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648837 ?auto_648838 ?auto_648839 )
      ( MAKE-7CRATE-VERIFY ?auto_648832 ?auto_648833 ?auto_648834 ?auto_648835 ?auto_648836 ?auto_648837 ?auto_648838 ?auto_648839 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648895 - SURFACE
      ?auto_648896 - SURFACE
      ?auto_648897 - SURFACE
      ?auto_648898 - SURFACE
      ?auto_648899 - SURFACE
      ?auto_648900 - SURFACE
      ?auto_648901 - SURFACE
      ?auto_648902 - SURFACE
    )
    :vars
    (
      ?auto_648903 - HOIST
      ?auto_648905 - PLACE
      ?auto_648906 - TRUCK
      ?auto_648904 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648903 ?auto_648905 ) ( SURFACE-AT ?auto_648901 ?auto_648905 ) ( CLEAR ?auto_648901 ) ( IS-CRATE ?auto_648902 ) ( not ( = ?auto_648901 ?auto_648902 ) ) ( AVAILABLE ?auto_648903 ) ( IN ?auto_648902 ?auto_648906 ) ( ON ?auto_648901 ?auto_648900 ) ( not ( = ?auto_648900 ?auto_648901 ) ) ( not ( = ?auto_648900 ?auto_648902 ) ) ( TRUCK-AT ?auto_648906 ?auto_648904 ) ( not ( = ?auto_648904 ?auto_648905 ) ) ( ON ?auto_648896 ?auto_648895 ) ( ON ?auto_648897 ?auto_648896 ) ( ON ?auto_648898 ?auto_648897 ) ( ON ?auto_648899 ?auto_648898 ) ( ON ?auto_648900 ?auto_648899 ) ( not ( = ?auto_648895 ?auto_648896 ) ) ( not ( = ?auto_648895 ?auto_648897 ) ) ( not ( = ?auto_648895 ?auto_648898 ) ) ( not ( = ?auto_648895 ?auto_648899 ) ) ( not ( = ?auto_648895 ?auto_648900 ) ) ( not ( = ?auto_648895 ?auto_648901 ) ) ( not ( = ?auto_648895 ?auto_648902 ) ) ( not ( = ?auto_648896 ?auto_648897 ) ) ( not ( = ?auto_648896 ?auto_648898 ) ) ( not ( = ?auto_648896 ?auto_648899 ) ) ( not ( = ?auto_648896 ?auto_648900 ) ) ( not ( = ?auto_648896 ?auto_648901 ) ) ( not ( = ?auto_648896 ?auto_648902 ) ) ( not ( = ?auto_648897 ?auto_648898 ) ) ( not ( = ?auto_648897 ?auto_648899 ) ) ( not ( = ?auto_648897 ?auto_648900 ) ) ( not ( = ?auto_648897 ?auto_648901 ) ) ( not ( = ?auto_648897 ?auto_648902 ) ) ( not ( = ?auto_648898 ?auto_648899 ) ) ( not ( = ?auto_648898 ?auto_648900 ) ) ( not ( = ?auto_648898 ?auto_648901 ) ) ( not ( = ?auto_648898 ?auto_648902 ) ) ( not ( = ?auto_648899 ?auto_648900 ) ) ( not ( = ?auto_648899 ?auto_648901 ) ) ( not ( = ?auto_648899 ?auto_648902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648900 ?auto_648901 ?auto_648902 )
      ( MAKE-7CRATE-VERIFY ?auto_648895 ?auto_648896 ?auto_648897 ?auto_648898 ?auto_648899 ?auto_648900 ?auto_648901 ?auto_648902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648965 - SURFACE
      ?auto_648966 - SURFACE
      ?auto_648967 - SURFACE
      ?auto_648968 - SURFACE
      ?auto_648969 - SURFACE
      ?auto_648970 - SURFACE
      ?auto_648971 - SURFACE
      ?auto_648972 - SURFACE
    )
    :vars
    (
      ?auto_648974 - HOIST
      ?auto_648973 - PLACE
      ?auto_648976 - TRUCK
      ?auto_648977 - PLACE
      ?auto_648975 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_648974 ?auto_648973 ) ( SURFACE-AT ?auto_648971 ?auto_648973 ) ( CLEAR ?auto_648971 ) ( IS-CRATE ?auto_648972 ) ( not ( = ?auto_648971 ?auto_648972 ) ) ( AVAILABLE ?auto_648974 ) ( ON ?auto_648971 ?auto_648970 ) ( not ( = ?auto_648970 ?auto_648971 ) ) ( not ( = ?auto_648970 ?auto_648972 ) ) ( TRUCK-AT ?auto_648976 ?auto_648977 ) ( not ( = ?auto_648977 ?auto_648973 ) ) ( HOIST-AT ?auto_648975 ?auto_648977 ) ( LIFTING ?auto_648975 ?auto_648972 ) ( not ( = ?auto_648974 ?auto_648975 ) ) ( ON ?auto_648966 ?auto_648965 ) ( ON ?auto_648967 ?auto_648966 ) ( ON ?auto_648968 ?auto_648967 ) ( ON ?auto_648969 ?auto_648968 ) ( ON ?auto_648970 ?auto_648969 ) ( not ( = ?auto_648965 ?auto_648966 ) ) ( not ( = ?auto_648965 ?auto_648967 ) ) ( not ( = ?auto_648965 ?auto_648968 ) ) ( not ( = ?auto_648965 ?auto_648969 ) ) ( not ( = ?auto_648965 ?auto_648970 ) ) ( not ( = ?auto_648965 ?auto_648971 ) ) ( not ( = ?auto_648965 ?auto_648972 ) ) ( not ( = ?auto_648966 ?auto_648967 ) ) ( not ( = ?auto_648966 ?auto_648968 ) ) ( not ( = ?auto_648966 ?auto_648969 ) ) ( not ( = ?auto_648966 ?auto_648970 ) ) ( not ( = ?auto_648966 ?auto_648971 ) ) ( not ( = ?auto_648966 ?auto_648972 ) ) ( not ( = ?auto_648967 ?auto_648968 ) ) ( not ( = ?auto_648967 ?auto_648969 ) ) ( not ( = ?auto_648967 ?auto_648970 ) ) ( not ( = ?auto_648967 ?auto_648971 ) ) ( not ( = ?auto_648967 ?auto_648972 ) ) ( not ( = ?auto_648968 ?auto_648969 ) ) ( not ( = ?auto_648968 ?auto_648970 ) ) ( not ( = ?auto_648968 ?auto_648971 ) ) ( not ( = ?auto_648968 ?auto_648972 ) ) ( not ( = ?auto_648969 ?auto_648970 ) ) ( not ( = ?auto_648969 ?auto_648971 ) ) ( not ( = ?auto_648969 ?auto_648972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648970 ?auto_648971 ?auto_648972 )
      ( MAKE-7CRATE-VERIFY ?auto_648965 ?auto_648966 ?auto_648967 ?auto_648968 ?auto_648969 ?auto_648970 ?auto_648971 ?auto_648972 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649042 - SURFACE
      ?auto_649043 - SURFACE
      ?auto_649044 - SURFACE
      ?auto_649045 - SURFACE
      ?auto_649046 - SURFACE
      ?auto_649047 - SURFACE
      ?auto_649048 - SURFACE
      ?auto_649049 - SURFACE
    )
    :vars
    (
      ?auto_649055 - HOIST
      ?auto_649054 - PLACE
      ?auto_649050 - TRUCK
      ?auto_649052 - PLACE
      ?auto_649051 - HOIST
      ?auto_649053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_649055 ?auto_649054 ) ( SURFACE-AT ?auto_649048 ?auto_649054 ) ( CLEAR ?auto_649048 ) ( IS-CRATE ?auto_649049 ) ( not ( = ?auto_649048 ?auto_649049 ) ) ( AVAILABLE ?auto_649055 ) ( ON ?auto_649048 ?auto_649047 ) ( not ( = ?auto_649047 ?auto_649048 ) ) ( not ( = ?auto_649047 ?auto_649049 ) ) ( TRUCK-AT ?auto_649050 ?auto_649052 ) ( not ( = ?auto_649052 ?auto_649054 ) ) ( HOIST-AT ?auto_649051 ?auto_649052 ) ( not ( = ?auto_649055 ?auto_649051 ) ) ( AVAILABLE ?auto_649051 ) ( SURFACE-AT ?auto_649049 ?auto_649052 ) ( ON ?auto_649049 ?auto_649053 ) ( CLEAR ?auto_649049 ) ( not ( = ?auto_649048 ?auto_649053 ) ) ( not ( = ?auto_649049 ?auto_649053 ) ) ( not ( = ?auto_649047 ?auto_649053 ) ) ( ON ?auto_649043 ?auto_649042 ) ( ON ?auto_649044 ?auto_649043 ) ( ON ?auto_649045 ?auto_649044 ) ( ON ?auto_649046 ?auto_649045 ) ( ON ?auto_649047 ?auto_649046 ) ( not ( = ?auto_649042 ?auto_649043 ) ) ( not ( = ?auto_649042 ?auto_649044 ) ) ( not ( = ?auto_649042 ?auto_649045 ) ) ( not ( = ?auto_649042 ?auto_649046 ) ) ( not ( = ?auto_649042 ?auto_649047 ) ) ( not ( = ?auto_649042 ?auto_649048 ) ) ( not ( = ?auto_649042 ?auto_649049 ) ) ( not ( = ?auto_649042 ?auto_649053 ) ) ( not ( = ?auto_649043 ?auto_649044 ) ) ( not ( = ?auto_649043 ?auto_649045 ) ) ( not ( = ?auto_649043 ?auto_649046 ) ) ( not ( = ?auto_649043 ?auto_649047 ) ) ( not ( = ?auto_649043 ?auto_649048 ) ) ( not ( = ?auto_649043 ?auto_649049 ) ) ( not ( = ?auto_649043 ?auto_649053 ) ) ( not ( = ?auto_649044 ?auto_649045 ) ) ( not ( = ?auto_649044 ?auto_649046 ) ) ( not ( = ?auto_649044 ?auto_649047 ) ) ( not ( = ?auto_649044 ?auto_649048 ) ) ( not ( = ?auto_649044 ?auto_649049 ) ) ( not ( = ?auto_649044 ?auto_649053 ) ) ( not ( = ?auto_649045 ?auto_649046 ) ) ( not ( = ?auto_649045 ?auto_649047 ) ) ( not ( = ?auto_649045 ?auto_649048 ) ) ( not ( = ?auto_649045 ?auto_649049 ) ) ( not ( = ?auto_649045 ?auto_649053 ) ) ( not ( = ?auto_649046 ?auto_649047 ) ) ( not ( = ?auto_649046 ?auto_649048 ) ) ( not ( = ?auto_649046 ?auto_649049 ) ) ( not ( = ?auto_649046 ?auto_649053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649047 ?auto_649048 ?auto_649049 )
      ( MAKE-7CRATE-VERIFY ?auto_649042 ?auto_649043 ?auto_649044 ?auto_649045 ?auto_649046 ?auto_649047 ?auto_649048 ?auto_649049 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649120 - SURFACE
      ?auto_649121 - SURFACE
      ?auto_649122 - SURFACE
      ?auto_649123 - SURFACE
      ?auto_649124 - SURFACE
      ?auto_649125 - SURFACE
      ?auto_649126 - SURFACE
      ?auto_649127 - SURFACE
    )
    :vars
    (
      ?auto_649133 - HOIST
      ?auto_649128 - PLACE
      ?auto_649130 - PLACE
      ?auto_649129 - HOIST
      ?auto_649131 - SURFACE
      ?auto_649132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649133 ?auto_649128 ) ( SURFACE-AT ?auto_649126 ?auto_649128 ) ( CLEAR ?auto_649126 ) ( IS-CRATE ?auto_649127 ) ( not ( = ?auto_649126 ?auto_649127 ) ) ( AVAILABLE ?auto_649133 ) ( ON ?auto_649126 ?auto_649125 ) ( not ( = ?auto_649125 ?auto_649126 ) ) ( not ( = ?auto_649125 ?auto_649127 ) ) ( not ( = ?auto_649130 ?auto_649128 ) ) ( HOIST-AT ?auto_649129 ?auto_649130 ) ( not ( = ?auto_649133 ?auto_649129 ) ) ( AVAILABLE ?auto_649129 ) ( SURFACE-AT ?auto_649127 ?auto_649130 ) ( ON ?auto_649127 ?auto_649131 ) ( CLEAR ?auto_649127 ) ( not ( = ?auto_649126 ?auto_649131 ) ) ( not ( = ?auto_649127 ?auto_649131 ) ) ( not ( = ?auto_649125 ?auto_649131 ) ) ( TRUCK-AT ?auto_649132 ?auto_649128 ) ( ON ?auto_649121 ?auto_649120 ) ( ON ?auto_649122 ?auto_649121 ) ( ON ?auto_649123 ?auto_649122 ) ( ON ?auto_649124 ?auto_649123 ) ( ON ?auto_649125 ?auto_649124 ) ( not ( = ?auto_649120 ?auto_649121 ) ) ( not ( = ?auto_649120 ?auto_649122 ) ) ( not ( = ?auto_649120 ?auto_649123 ) ) ( not ( = ?auto_649120 ?auto_649124 ) ) ( not ( = ?auto_649120 ?auto_649125 ) ) ( not ( = ?auto_649120 ?auto_649126 ) ) ( not ( = ?auto_649120 ?auto_649127 ) ) ( not ( = ?auto_649120 ?auto_649131 ) ) ( not ( = ?auto_649121 ?auto_649122 ) ) ( not ( = ?auto_649121 ?auto_649123 ) ) ( not ( = ?auto_649121 ?auto_649124 ) ) ( not ( = ?auto_649121 ?auto_649125 ) ) ( not ( = ?auto_649121 ?auto_649126 ) ) ( not ( = ?auto_649121 ?auto_649127 ) ) ( not ( = ?auto_649121 ?auto_649131 ) ) ( not ( = ?auto_649122 ?auto_649123 ) ) ( not ( = ?auto_649122 ?auto_649124 ) ) ( not ( = ?auto_649122 ?auto_649125 ) ) ( not ( = ?auto_649122 ?auto_649126 ) ) ( not ( = ?auto_649122 ?auto_649127 ) ) ( not ( = ?auto_649122 ?auto_649131 ) ) ( not ( = ?auto_649123 ?auto_649124 ) ) ( not ( = ?auto_649123 ?auto_649125 ) ) ( not ( = ?auto_649123 ?auto_649126 ) ) ( not ( = ?auto_649123 ?auto_649127 ) ) ( not ( = ?auto_649123 ?auto_649131 ) ) ( not ( = ?auto_649124 ?auto_649125 ) ) ( not ( = ?auto_649124 ?auto_649126 ) ) ( not ( = ?auto_649124 ?auto_649127 ) ) ( not ( = ?auto_649124 ?auto_649131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649125 ?auto_649126 ?auto_649127 )
      ( MAKE-7CRATE-VERIFY ?auto_649120 ?auto_649121 ?auto_649122 ?auto_649123 ?auto_649124 ?auto_649125 ?auto_649126 ?auto_649127 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649198 - SURFACE
      ?auto_649199 - SURFACE
      ?auto_649200 - SURFACE
      ?auto_649201 - SURFACE
      ?auto_649202 - SURFACE
      ?auto_649203 - SURFACE
      ?auto_649204 - SURFACE
      ?auto_649205 - SURFACE
    )
    :vars
    (
      ?auto_649209 - HOIST
      ?auto_649206 - PLACE
      ?auto_649208 - PLACE
      ?auto_649211 - HOIST
      ?auto_649210 - SURFACE
      ?auto_649207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649209 ?auto_649206 ) ( IS-CRATE ?auto_649205 ) ( not ( = ?auto_649204 ?auto_649205 ) ) ( not ( = ?auto_649203 ?auto_649204 ) ) ( not ( = ?auto_649203 ?auto_649205 ) ) ( not ( = ?auto_649208 ?auto_649206 ) ) ( HOIST-AT ?auto_649211 ?auto_649208 ) ( not ( = ?auto_649209 ?auto_649211 ) ) ( AVAILABLE ?auto_649211 ) ( SURFACE-AT ?auto_649205 ?auto_649208 ) ( ON ?auto_649205 ?auto_649210 ) ( CLEAR ?auto_649205 ) ( not ( = ?auto_649204 ?auto_649210 ) ) ( not ( = ?auto_649205 ?auto_649210 ) ) ( not ( = ?auto_649203 ?auto_649210 ) ) ( TRUCK-AT ?auto_649207 ?auto_649206 ) ( SURFACE-AT ?auto_649203 ?auto_649206 ) ( CLEAR ?auto_649203 ) ( LIFTING ?auto_649209 ?auto_649204 ) ( IS-CRATE ?auto_649204 ) ( ON ?auto_649199 ?auto_649198 ) ( ON ?auto_649200 ?auto_649199 ) ( ON ?auto_649201 ?auto_649200 ) ( ON ?auto_649202 ?auto_649201 ) ( ON ?auto_649203 ?auto_649202 ) ( not ( = ?auto_649198 ?auto_649199 ) ) ( not ( = ?auto_649198 ?auto_649200 ) ) ( not ( = ?auto_649198 ?auto_649201 ) ) ( not ( = ?auto_649198 ?auto_649202 ) ) ( not ( = ?auto_649198 ?auto_649203 ) ) ( not ( = ?auto_649198 ?auto_649204 ) ) ( not ( = ?auto_649198 ?auto_649205 ) ) ( not ( = ?auto_649198 ?auto_649210 ) ) ( not ( = ?auto_649199 ?auto_649200 ) ) ( not ( = ?auto_649199 ?auto_649201 ) ) ( not ( = ?auto_649199 ?auto_649202 ) ) ( not ( = ?auto_649199 ?auto_649203 ) ) ( not ( = ?auto_649199 ?auto_649204 ) ) ( not ( = ?auto_649199 ?auto_649205 ) ) ( not ( = ?auto_649199 ?auto_649210 ) ) ( not ( = ?auto_649200 ?auto_649201 ) ) ( not ( = ?auto_649200 ?auto_649202 ) ) ( not ( = ?auto_649200 ?auto_649203 ) ) ( not ( = ?auto_649200 ?auto_649204 ) ) ( not ( = ?auto_649200 ?auto_649205 ) ) ( not ( = ?auto_649200 ?auto_649210 ) ) ( not ( = ?auto_649201 ?auto_649202 ) ) ( not ( = ?auto_649201 ?auto_649203 ) ) ( not ( = ?auto_649201 ?auto_649204 ) ) ( not ( = ?auto_649201 ?auto_649205 ) ) ( not ( = ?auto_649201 ?auto_649210 ) ) ( not ( = ?auto_649202 ?auto_649203 ) ) ( not ( = ?auto_649202 ?auto_649204 ) ) ( not ( = ?auto_649202 ?auto_649205 ) ) ( not ( = ?auto_649202 ?auto_649210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649203 ?auto_649204 ?auto_649205 )
      ( MAKE-7CRATE-VERIFY ?auto_649198 ?auto_649199 ?auto_649200 ?auto_649201 ?auto_649202 ?auto_649203 ?auto_649204 ?auto_649205 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_649276 - SURFACE
      ?auto_649277 - SURFACE
      ?auto_649278 - SURFACE
      ?auto_649279 - SURFACE
      ?auto_649280 - SURFACE
      ?auto_649281 - SURFACE
      ?auto_649282 - SURFACE
      ?auto_649283 - SURFACE
    )
    :vars
    (
      ?auto_649286 - HOIST
      ?auto_649287 - PLACE
      ?auto_649285 - PLACE
      ?auto_649289 - HOIST
      ?auto_649284 - SURFACE
      ?auto_649288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649286 ?auto_649287 ) ( IS-CRATE ?auto_649283 ) ( not ( = ?auto_649282 ?auto_649283 ) ) ( not ( = ?auto_649281 ?auto_649282 ) ) ( not ( = ?auto_649281 ?auto_649283 ) ) ( not ( = ?auto_649285 ?auto_649287 ) ) ( HOIST-AT ?auto_649289 ?auto_649285 ) ( not ( = ?auto_649286 ?auto_649289 ) ) ( AVAILABLE ?auto_649289 ) ( SURFACE-AT ?auto_649283 ?auto_649285 ) ( ON ?auto_649283 ?auto_649284 ) ( CLEAR ?auto_649283 ) ( not ( = ?auto_649282 ?auto_649284 ) ) ( not ( = ?auto_649283 ?auto_649284 ) ) ( not ( = ?auto_649281 ?auto_649284 ) ) ( TRUCK-AT ?auto_649288 ?auto_649287 ) ( SURFACE-AT ?auto_649281 ?auto_649287 ) ( CLEAR ?auto_649281 ) ( IS-CRATE ?auto_649282 ) ( AVAILABLE ?auto_649286 ) ( IN ?auto_649282 ?auto_649288 ) ( ON ?auto_649277 ?auto_649276 ) ( ON ?auto_649278 ?auto_649277 ) ( ON ?auto_649279 ?auto_649278 ) ( ON ?auto_649280 ?auto_649279 ) ( ON ?auto_649281 ?auto_649280 ) ( not ( = ?auto_649276 ?auto_649277 ) ) ( not ( = ?auto_649276 ?auto_649278 ) ) ( not ( = ?auto_649276 ?auto_649279 ) ) ( not ( = ?auto_649276 ?auto_649280 ) ) ( not ( = ?auto_649276 ?auto_649281 ) ) ( not ( = ?auto_649276 ?auto_649282 ) ) ( not ( = ?auto_649276 ?auto_649283 ) ) ( not ( = ?auto_649276 ?auto_649284 ) ) ( not ( = ?auto_649277 ?auto_649278 ) ) ( not ( = ?auto_649277 ?auto_649279 ) ) ( not ( = ?auto_649277 ?auto_649280 ) ) ( not ( = ?auto_649277 ?auto_649281 ) ) ( not ( = ?auto_649277 ?auto_649282 ) ) ( not ( = ?auto_649277 ?auto_649283 ) ) ( not ( = ?auto_649277 ?auto_649284 ) ) ( not ( = ?auto_649278 ?auto_649279 ) ) ( not ( = ?auto_649278 ?auto_649280 ) ) ( not ( = ?auto_649278 ?auto_649281 ) ) ( not ( = ?auto_649278 ?auto_649282 ) ) ( not ( = ?auto_649278 ?auto_649283 ) ) ( not ( = ?auto_649278 ?auto_649284 ) ) ( not ( = ?auto_649279 ?auto_649280 ) ) ( not ( = ?auto_649279 ?auto_649281 ) ) ( not ( = ?auto_649279 ?auto_649282 ) ) ( not ( = ?auto_649279 ?auto_649283 ) ) ( not ( = ?auto_649279 ?auto_649284 ) ) ( not ( = ?auto_649280 ?auto_649281 ) ) ( not ( = ?auto_649280 ?auto_649282 ) ) ( not ( = ?auto_649280 ?auto_649283 ) ) ( not ( = ?auto_649280 ?auto_649284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_649281 ?auto_649282 ?auto_649283 )
      ( MAKE-7CRATE-VERIFY ?auto_649276 ?auto_649277 ?auto_649278 ?auto_649279 ?auto_649280 ?auto_649281 ?auto_649282 ?auto_649283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_649855 - SURFACE
      ?auto_649856 - SURFACE
    )
    :vars
    (
      ?auto_649859 - HOIST
      ?auto_649863 - PLACE
      ?auto_649862 - SURFACE
      ?auto_649861 - PLACE
      ?auto_649858 - HOIST
      ?auto_649857 - SURFACE
      ?auto_649860 - TRUCK
      ?auto_649864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_649859 ?auto_649863 ) ( SURFACE-AT ?auto_649855 ?auto_649863 ) ( CLEAR ?auto_649855 ) ( IS-CRATE ?auto_649856 ) ( not ( = ?auto_649855 ?auto_649856 ) ) ( ON ?auto_649855 ?auto_649862 ) ( not ( = ?auto_649862 ?auto_649855 ) ) ( not ( = ?auto_649862 ?auto_649856 ) ) ( not ( = ?auto_649861 ?auto_649863 ) ) ( HOIST-AT ?auto_649858 ?auto_649861 ) ( not ( = ?auto_649859 ?auto_649858 ) ) ( AVAILABLE ?auto_649858 ) ( SURFACE-AT ?auto_649856 ?auto_649861 ) ( ON ?auto_649856 ?auto_649857 ) ( CLEAR ?auto_649856 ) ( not ( = ?auto_649855 ?auto_649857 ) ) ( not ( = ?auto_649856 ?auto_649857 ) ) ( not ( = ?auto_649862 ?auto_649857 ) ) ( TRUCK-AT ?auto_649860 ?auto_649863 ) ( LIFTING ?auto_649859 ?auto_649864 ) ( IS-CRATE ?auto_649864 ) ( not ( = ?auto_649855 ?auto_649864 ) ) ( not ( = ?auto_649856 ?auto_649864 ) ) ( not ( = ?auto_649862 ?auto_649864 ) ) ( not ( = ?auto_649857 ?auto_649864 ) ) )
    :subtasks
    ( ( !LOAD ?auto_649859 ?auto_649864 ?auto_649860 ?auto_649863 )
      ( MAKE-1CRATE ?auto_649855 ?auto_649856 )
      ( MAKE-1CRATE-VERIFY ?auto_649855 ?auto_649856 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652168 - SURFACE
      ?auto_652169 - SURFACE
      ?auto_652170 - SURFACE
      ?auto_652171 - SURFACE
      ?auto_652172 - SURFACE
      ?auto_652173 - SURFACE
      ?auto_652174 - SURFACE
      ?auto_652175 - SURFACE
      ?auto_652176 - SURFACE
    )
    :vars
    (
      ?auto_652178 - HOIST
      ?auto_652177 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652178 ?auto_652177 ) ( SURFACE-AT ?auto_652175 ?auto_652177 ) ( CLEAR ?auto_652175 ) ( LIFTING ?auto_652178 ?auto_652176 ) ( IS-CRATE ?auto_652176 ) ( not ( = ?auto_652175 ?auto_652176 ) ) ( ON ?auto_652169 ?auto_652168 ) ( ON ?auto_652170 ?auto_652169 ) ( ON ?auto_652171 ?auto_652170 ) ( ON ?auto_652172 ?auto_652171 ) ( ON ?auto_652173 ?auto_652172 ) ( ON ?auto_652174 ?auto_652173 ) ( ON ?auto_652175 ?auto_652174 ) ( not ( = ?auto_652168 ?auto_652169 ) ) ( not ( = ?auto_652168 ?auto_652170 ) ) ( not ( = ?auto_652168 ?auto_652171 ) ) ( not ( = ?auto_652168 ?auto_652172 ) ) ( not ( = ?auto_652168 ?auto_652173 ) ) ( not ( = ?auto_652168 ?auto_652174 ) ) ( not ( = ?auto_652168 ?auto_652175 ) ) ( not ( = ?auto_652168 ?auto_652176 ) ) ( not ( = ?auto_652169 ?auto_652170 ) ) ( not ( = ?auto_652169 ?auto_652171 ) ) ( not ( = ?auto_652169 ?auto_652172 ) ) ( not ( = ?auto_652169 ?auto_652173 ) ) ( not ( = ?auto_652169 ?auto_652174 ) ) ( not ( = ?auto_652169 ?auto_652175 ) ) ( not ( = ?auto_652169 ?auto_652176 ) ) ( not ( = ?auto_652170 ?auto_652171 ) ) ( not ( = ?auto_652170 ?auto_652172 ) ) ( not ( = ?auto_652170 ?auto_652173 ) ) ( not ( = ?auto_652170 ?auto_652174 ) ) ( not ( = ?auto_652170 ?auto_652175 ) ) ( not ( = ?auto_652170 ?auto_652176 ) ) ( not ( = ?auto_652171 ?auto_652172 ) ) ( not ( = ?auto_652171 ?auto_652173 ) ) ( not ( = ?auto_652171 ?auto_652174 ) ) ( not ( = ?auto_652171 ?auto_652175 ) ) ( not ( = ?auto_652171 ?auto_652176 ) ) ( not ( = ?auto_652172 ?auto_652173 ) ) ( not ( = ?auto_652172 ?auto_652174 ) ) ( not ( = ?auto_652172 ?auto_652175 ) ) ( not ( = ?auto_652172 ?auto_652176 ) ) ( not ( = ?auto_652173 ?auto_652174 ) ) ( not ( = ?auto_652173 ?auto_652175 ) ) ( not ( = ?auto_652173 ?auto_652176 ) ) ( not ( = ?auto_652174 ?auto_652175 ) ) ( not ( = ?auto_652174 ?auto_652176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_652175 ?auto_652176 )
      ( MAKE-8CRATE-VERIFY ?auto_652168 ?auto_652169 ?auto_652170 ?auto_652171 ?auto_652172 ?auto_652173 ?auto_652174 ?auto_652175 ?auto_652176 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652235 - SURFACE
      ?auto_652236 - SURFACE
      ?auto_652237 - SURFACE
      ?auto_652238 - SURFACE
      ?auto_652239 - SURFACE
      ?auto_652240 - SURFACE
      ?auto_652241 - SURFACE
      ?auto_652242 - SURFACE
      ?auto_652243 - SURFACE
    )
    :vars
    (
      ?auto_652245 - HOIST
      ?auto_652246 - PLACE
      ?auto_652244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652245 ?auto_652246 ) ( SURFACE-AT ?auto_652242 ?auto_652246 ) ( CLEAR ?auto_652242 ) ( IS-CRATE ?auto_652243 ) ( not ( = ?auto_652242 ?auto_652243 ) ) ( TRUCK-AT ?auto_652244 ?auto_652246 ) ( AVAILABLE ?auto_652245 ) ( IN ?auto_652243 ?auto_652244 ) ( ON ?auto_652242 ?auto_652241 ) ( not ( = ?auto_652241 ?auto_652242 ) ) ( not ( = ?auto_652241 ?auto_652243 ) ) ( ON ?auto_652236 ?auto_652235 ) ( ON ?auto_652237 ?auto_652236 ) ( ON ?auto_652238 ?auto_652237 ) ( ON ?auto_652239 ?auto_652238 ) ( ON ?auto_652240 ?auto_652239 ) ( ON ?auto_652241 ?auto_652240 ) ( not ( = ?auto_652235 ?auto_652236 ) ) ( not ( = ?auto_652235 ?auto_652237 ) ) ( not ( = ?auto_652235 ?auto_652238 ) ) ( not ( = ?auto_652235 ?auto_652239 ) ) ( not ( = ?auto_652235 ?auto_652240 ) ) ( not ( = ?auto_652235 ?auto_652241 ) ) ( not ( = ?auto_652235 ?auto_652242 ) ) ( not ( = ?auto_652235 ?auto_652243 ) ) ( not ( = ?auto_652236 ?auto_652237 ) ) ( not ( = ?auto_652236 ?auto_652238 ) ) ( not ( = ?auto_652236 ?auto_652239 ) ) ( not ( = ?auto_652236 ?auto_652240 ) ) ( not ( = ?auto_652236 ?auto_652241 ) ) ( not ( = ?auto_652236 ?auto_652242 ) ) ( not ( = ?auto_652236 ?auto_652243 ) ) ( not ( = ?auto_652237 ?auto_652238 ) ) ( not ( = ?auto_652237 ?auto_652239 ) ) ( not ( = ?auto_652237 ?auto_652240 ) ) ( not ( = ?auto_652237 ?auto_652241 ) ) ( not ( = ?auto_652237 ?auto_652242 ) ) ( not ( = ?auto_652237 ?auto_652243 ) ) ( not ( = ?auto_652238 ?auto_652239 ) ) ( not ( = ?auto_652238 ?auto_652240 ) ) ( not ( = ?auto_652238 ?auto_652241 ) ) ( not ( = ?auto_652238 ?auto_652242 ) ) ( not ( = ?auto_652238 ?auto_652243 ) ) ( not ( = ?auto_652239 ?auto_652240 ) ) ( not ( = ?auto_652239 ?auto_652241 ) ) ( not ( = ?auto_652239 ?auto_652242 ) ) ( not ( = ?auto_652239 ?auto_652243 ) ) ( not ( = ?auto_652240 ?auto_652241 ) ) ( not ( = ?auto_652240 ?auto_652242 ) ) ( not ( = ?auto_652240 ?auto_652243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652241 ?auto_652242 ?auto_652243 )
      ( MAKE-8CRATE-VERIFY ?auto_652235 ?auto_652236 ?auto_652237 ?auto_652238 ?auto_652239 ?auto_652240 ?auto_652241 ?auto_652242 ?auto_652243 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652311 - SURFACE
      ?auto_652312 - SURFACE
      ?auto_652313 - SURFACE
      ?auto_652314 - SURFACE
      ?auto_652315 - SURFACE
      ?auto_652316 - SURFACE
      ?auto_652317 - SURFACE
      ?auto_652318 - SURFACE
      ?auto_652319 - SURFACE
    )
    :vars
    (
      ?auto_652323 - HOIST
      ?auto_652321 - PLACE
      ?auto_652320 - TRUCK
      ?auto_652322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652323 ?auto_652321 ) ( SURFACE-AT ?auto_652318 ?auto_652321 ) ( CLEAR ?auto_652318 ) ( IS-CRATE ?auto_652319 ) ( not ( = ?auto_652318 ?auto_652319 ) ) ( AVAILABLE ?auto_652323 ) ( IN ?auto_652319 ?auto_652320 ) ( ON ?auto_652318 ?auto_652317 ) ( not ( = ?auto_652317 ?auto_652318 ) ) ( not ( = ?auto_652317 ?auto_652319 ) ) ( TRUCK-AT ?auto_652320 ?auto_652322 ) ( not ( = ?auto_652322 ?auto_652321 ) ) ( ON ?auto_652312 ?auto_652311 ) ( ON ?auto_652313 ?auto_652312 ) ( ON ?auto_652314 ?auto_652313 ) ( ON ?auto_652315 ?auto_652314 ) ( ON ?auto_652316 ?auto_652315 ) ( ON ?auto_652317 ?auto_652316 ) ( not ( = ?auto_652311 ?auto_652312 ) ) ( not ( = ?auto_652311 ?auto_652313 ) ) ( not ( = ?auto_652311 ?auto_652314 ) ) ( not ( = ?auto_652311 ?auto_652315 ) ) ( not ( = ?auto_652311 ?auto_652316 ) ) ( not ( = ?auto_652311 ?auto_652317 ) ) ( not ( = ?auto_652311 ?auto_652318 ) ) ( not ( = ?auto_652311 ?auto_652319 ) ) ( not ( = ?auto_652312 ?auto_652313 ) ) ( not ( = ?auto_652312 ?auto_652314 ) ) ( not ( = ?auto_652312 ?auto_652315 ) ) ( not ( = ?auto_652312 ?auto_652316 ) ) ( not ( = ?auto_652312 ?auto_652317 ) ) ( not ( = ?auto_652312 ?auto_652318 ) ) ( not ( = ?auto_652312 ?auto_652319 ) ) ( not ( = ?auto_652313 ?auto_652314 ) ) ( not ( = ?auto_652313 ?auto_652315 ) ) ( not ( = ?auto_652313 ?auto_652316 ) ) ( not ( = ?auto_652313 ?auto_652317 ) ) ( not ( = ?auto_652313 ?auto_652318 ) ) ( not ( = ?auto_652313 ?auto_652319 ) ) ( not ( = ?auto_652314 ?auto_652315 ) ) ( not ( = ?auto_652314 ?auto_652316 ) ) ( not ( = ?auto_652314 ?auto_652317 ) ) ( not ( = ?auto_652314 ?auto_652318 ) ) ( not ( = ?auto_652314 ?auto_652319 ) ) ( not ( = ?auto_652315 ?auto_652316 ) ) ( not ( = ?auto_652315 ?auto_652317 ) ) ( not ( = ?auto_652315 ?auto_652318 ) ) ( not ( = ?auto_652315 ?auto_652319 ) ) ( not ( = ?auto_652316 ?auto_652317 ) ) ( not ( = ?auto_652316 ?auto_652318 ) ) ( not ( = ?auto_652316 ?auto_652319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652317 ?auto_652318 ?auto_652319 )
      ( MAKE-8CRATE-VERIFY ?auto_652311 ?auto_652312 ?auto_652313 ?auto_652314 ?auto_652315 ?auto_652316 ?auto_652317 ?auto_652318 ?auto_652319 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652395 - SURFACE
      ?auto_652396 - SURFACE
      ?auto_652397 - SURFACE
      ?auto_652398 - SURFACE
      ?auto_652399 - SURFACE
      ?auto_652400 - SURFACE
      ?auto_652401 - SURFACE
      ?auto_652402 - SURFACE
      ?auto_652403 - SURFACE
    )
    :vars
    (
      ?auto_652404 - HOIST
      ?auto_652407 - PLACE
      ?auto_652405 - TRUCK
      ?auto_652408 - PLACE
      ?auto_652406 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_652404 ?auto_652407 ) ( SURFACE-AT ?auto_652402 ?auto_652407 ) ( CLEAR ?auto_652402 ) ( IS-CRATE ?auto_652403 ) ( not ( = ?auto_652402 ?auto_652403 ) ) ( AVAILABLE ?auto_652404 ) ( ON ?auto_652402 ?auto_652401 ) ( not ( = ?auto_652401 ?auto_652402 ) ) ( not ( = ?auto_652401 ?auto_652403 ) ) ( TRUCK-AT ?auto_652405 ?auto_652408 ) ( not ( = ?auto_652408 ?auto_652407 ) ) ( HOIST-AT ?auto_652406 ?auto_652408 ) ( LIFTING ?auto_652406 ?auto_652403 ) ( not ( = ?auto_652404 ?auto_652406 ) ) ( ON ?auto_652396 ?auto_652395 ) ( ON ?auto_652397 ?auto_652396 ) ( ON ?auto_652398 ?auto_652397 ) ( ON ?auto_652399 ?auto_652398 ) ( ON ?auto_652400 ?auto_652399 ) ( ON ?auto_652401 ?auto_652400 ) ( not ( = ?auto_652395 ?auto_652396 ) ) ( not ( = ?auto_652395 ?auto_652397 ) ) ( not ( = ?auto_652395 ?auto_652398 ) ) ( not ( = ?auto_652395 ?auto_652399 ) ) ( not ( = ?auto_652395 ?auto_652400 ) ) ( not ( = ?auto_652395 ?auto_652401 ) ) ( not ( = ?auto_652395 ?auto_652402 ) ) ( not ( = ?auto_652395 ?auto_652403 ) ) ( not ( = ?auto_652396 ?auto_652397 ) ) ( not ( = ?auto_652396 ?auto_652398 ) ) ( not ( = ?auto_652396 ?auto_652399 ) ) ( not ( = ?auto_652396 ?auto_652400 ) ) ( not ( = ?auto_652396 ?auto_652401 ) ) ( not ( = ?auto_652396 ?auto_652402 ) ) ( not ( = ?auto_652396 ?auto_652403 ) ) ( not ( = ?auto_652397 ?auto_652398 ) ) ( not ( = ?auto_652397 ?auto_652399 ) ) ( not ( = ?auto_652397 ?auto_652400 ) ) ( not ( = ?auto_652397 ?auto_652401 ) ) ( not ( = ?auto_652397 ?auto_652402 ) ) ( not ( = ?auto_652397 ?auto_652403 ) ) ( not ( = ?auto_652398 ?auto_652399 ) ) ( not ( = ?auto_652398 ?auto_652400 ) ) ( not ( = ?auto_652398 ?auto_652401 ) ) ( not ( = ?auto_652398 ?auto_652402 ) ) ( not ( = ?auto_652398 ?auto_652403 ) ) ( not ( = ?auto_652399 ?auto_652400 ) ) ( not ( = ?auto_652399 ?auto_652401 ) ) ( not ( = ?auto_652399 ?auto_652402 ) ) ( not ( = ?auto_652399 ?auto_652403 ) ) ( not ( = ?auto_652400 ?auto_652401 ) ) ( not ( = ?auto_652400 ?auto_652402 ) ) ( not ( = ?auto_652400 ?auto_652403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652401 ?auto_652402 ?auto_652403 )
      ( MAKE-8CRATE-VERIFY ?auto_652395 ?auto_652396 ?auto_652397 ?auto_652398 ?auto_652399 ?auto_652400 ?auto_652401 ?auto_652402 ?auto_652403 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652487 - SURFACE
      ?auto_652488 - SURFACE
      ?auto_652489 - SURFACE
      ?auto_652490 - SURFACE
      ?auto_652491 - SURFACE
      ?auto_652492 - SURFACE
      ?auto_652493 - SURFACE
      ?auto_652494 - SURFACE
      ?auto_652495 - SURFACE
    )
    :vars
    (
      ?auto_652496 - HOIST
      ?auto_652499 - PLACE
      ?auto_652498 - TRUCK
      ?auto_652497 - PLACE
      ?auto_652500 - HOIST
      ?auto_652501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652496 ?auto_652499 ) ( SURFACE-AT ?auto_652494 ?auto_652499 ) ( CLEAR ?auto_652494 ) ( IS-CRATE ?auto_652495 ) ( not ( = ?auto_652494 ?auto_652495 ) ) ( AVAILABLE ?auto_652496 ) ( ON ?auto_652494 ?auto_652493 ) ( not ( = ?auto_652493 ?auto_652494 ) ) ( not ( = ?auto_652493 ?auto_652495 ) ) ( TRUCK-AT ?auto_652498 ?auto_652497 ) ( not ( = ?auto_652497 ?auto_652499 ) ) ( HOIST-AT ?auto_652500 ?auto_652497 ) ( not ( = ?auto_652496 ?auto_652500 ) ) ( AVAILABLE ?auto_652500 ) ( SURFACE-AT ?auto_652495 ?auto_652497 ) ( ON ?auto_652495 ?auto_652501 ) ( CLEAR ?auto_652495 ) ( not ( = ?auto_652494 ?auto_652501 ) ) ( not ( = ?auto_652495 ?auto_652501 ) ) ( not ( = ?auto_652493 ?auto_652501 ) ) ( ON ?auto_652488 ?auto_652487 ) ( ON ?auto_652489 ?auto_652488 ) ( ON ?auto_652490 ?auto_652489 ) ( ON ?auto_652491 ?auto_652490 ) ( ON ?auto_652492 ?auto_652491 ) ( ON ?auto_652493 ?auto_652492 ) ( not ( = ?auto_652487 ?auto_652488 ) ) ( not ( = ?auto_652487 ?auto_652489 ) ) ( not ( = ?auto_652487 ?auto_652490 ) ) ( not ( = ?auto_652487 ?auto_652491 ) ) ( not ( = ?auto_652487 ?auto_652492 ) ) ( not ( = ?auto_652487 ?auto_652493 ) ) ( not ( = ?auto_652487 ?auto_652494 ) ) ( not ( = ?auto_652487 ?auto_652495 ) ) ( not ( = ?auto_652487 ?auto_652501 ) ) ( not ( = ?auto_652488 ?auto_652489 ) ) ( not ( = ?auto_652488 ?auto_652490 ) ) ( not ( = ?auto_652488 ?auto_652491 ) ) ( not ( = ?auto_652488 ?auto_652492 ) ) ( not ( = ?auto_652488 ?auto_652493 ) ) ( not ( = ?auto_652488 ?auto_652494 ) ) ( not ( = ?auto_652488 ?auto_652495 ) ) ( not ( = ?auto_652488 ?auto_652501 ) ) ( not ( = ?auto_652489 ?auto_652490 ) ) ( not ( = ?auto_652489 ?auto_652491 ) ) ( not ( = ?auto_652489 ?auto_652492 ) ) ( not ( = ?auto_652489 ?auto_652493 ) ) ( not ( = ?auto_652489 ?auto_652494 ) ) ( not ( = ?auto_652489 ?auto_652495 ) ) ( not ( = ?auto_652489 ?auto_652501 ) ) ( not ( = ?auto_652490 ?auto_652491 ) ) ( not ( = ?auto_652490 ?auto_652492 ) ) ( not ( = ?auto_652490 ?auto_652493 ) ) ( not ( = ?auto_652490 ?auto_652494 ) ) ( not ( = ?auto_652490 ?auto_652495 ) ) ( not ( = ?auto_652490 ?auto_652501 ) ) ( not ( = ?auto_652491 ?auto_652492 ) ) ( not ( = ?auto_652491 ?auto_652493 ) ) ( not ( = ?auto_652491 ?auto_652494 ) ) ( not ( = ?auto_652491 ?auto_652495 ) ) ( not ( = ?auto_652491 ?auto_652501 ) ) ( not ( = ?auto_652492 ?auto_652493 ) ) ( not ( = ?auto_652492 ?auto_652494 ) ) ( not ( = ?auto_652492 ?auto_652495 ) ) ( not ( = ?auto_652492 ?auto_652501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652493 ?auto_652494 ?auto_652495 )
      ( MAKE-8CRATE-VERIFY ?auto_652487 ?auto_652488 ?auto_652489 ?auto_652490 ?auto_652491 ?auto_652492 ?auto_652493 ?auto_652494 ?auto_652495 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652580 - SURFACE
      ?auto_652581 - SURFACE
      ?auto_652582 - SURFACE
      ?auto_652583 - SURFACE
      ?auto_652584 - SURFACE
      ?auto_652585 - SURFACE
      ?auto_652586 - SURFACE
      ?auto_652587 - SURFACE
      ?auto_652588 - SURFACE
    )
    :vars
    (
      ?auto_652593 - HOIST
      ?auto_652594 - PLACE
      ?auto_652592 - PLACE
      ?auto_652591 - HOIST
      ?auto_652589 - SURFACE
      ?auto_652590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652593 ?auto_652594 ) ( SURFACE-AT ?auto_652587 ?auto_652594 ) ( CLEAR ?auto_652587 ) ( IS-CRATE ?auto_652588 ) ( not ( = ?auto_652587 ?auto_652588 ) ) ( AVAILABLE ?auto_652593 ) ( ON ?auto_652587 ?auto_652586 ) ( not ( = ?auto_652586 ?auto_652587 ) ) ( not ( = ?auto_652586 ?auto_652588 ) ) ( not ( = ?auto_652592 ?auto_652594 ) ) ( HOIST-AT ?auto_652591 ?auto_652592 ) ( not ( = ?auto_652593 ?auto_652591 ) ) ( AVAILABLE ?auto_652591 ) ( SURFACE-AT ?auto_652588 ?auto_652592 ) ( ON ?auto_652588 ?auto_652589 ) ( CLEAR ?auto_652588 ) ( not ( = ?auto_652587 ?auto_652589 ) ) ( not ( = ?auto_652588 ?auto_652589 ) ) ( not ( = ?auto_652586 ?auto_652589 ) ) ( TRUCK-AT ?auto_652590 ?auto_652594 ) ( ON ?auto_652581 ?auto_652580 ) ( ON ?auto_652582 ?auto_652581 ) ( ON ?auto_652583 ?auto_652582 ) ( ON ?auto_652584 ?auto_652583 ) ( ON ?auto_652585 ?auto_652584 ) ( ON ?auto_652586 ?auto_652585 ) ( not ( = ?auto_652580 ?auto_652581 ) ) ( not ( = ?auto_652580 ?auto_652582 ) ) ( not ( = ?auto_652580 ?auto_652583 ) ) ( not ( = ?auto_652580 ?auto_652584 ) ) ( not ( = ?auto_652580 ?auto_652585 ) ) ( not ( = ?auto_652580 ?auto_652586 ) ) ( not ( = ?auto_652580 ?auto_652587 ) ) ( not ( = ?auto_652580 ?auto_652588 ) ) ( not ( = ?auto_652580 ?auto_652589 ) ) ( not ( = ?auto_652581 ?auto_652582 ) ) ( not ( = ?auto_652581 ?auto_652583 ) ) ( not ( = ?auto_652581 ?auto_652584 ) ) ( not ( = ?auto_652581 ?auto_652585 ) ) ( not ( = ?auto_652581 ?auto_652586 ) ) ( not ( = ?auto_652581 ?auto_652587 ) ) ( not ( = ?auto_652581 ?auto_652588 ) ) ( not ( = ?auto_652581 ?auto_652589 ) ) ( not ( = ?auto_652582 ?auto_652583 ) ) ( not ( = ?auto_652582 ?auto_652584 ) ) ( not ( = ?auto_652582 ?auto_652585 ) ) ( not ( = ?auto_652582 ?auto_652586 ) ) ( not ( = ?auto_652582 ?auto_652587 ) ) ( not ( = ?auto_652582 ?auto_652588 ) ) ( not ( = ?auto_652582 ?auto_652589 ) ) ( not ( = ?auto_652583 ?auto_652584 ) ) ( not ( = ?auto_652583 ?auto_652585 ) ) ( not ( = ?auto_652583 ?auto_652586 ) ) ( not ( = ?auto_652583 ?auto_652587 ) ) ( not ( = ?auto_652583 ?auto_652588 ) ) ( not ( = ?auto_652583 ?auto_652589 ) ) ( not ( = ?auto_652584 ?auto_652585 ) ) ( not ( = ?auto_652584 ?auto_652586 ) ) ( not ( = ?auto_652584 ?auto_652587 ) ) ( not ( = ?auto_652584 ?auto_652588 ) ) ( not ( = ?auto_652584 ?auto_652589 ) ) ( not ( = ?auto_652585 ?auto_652586 ) ) ( not ( = ?auto_652585 ?auto_652587 ) ) ( not ( = ?auto_652585 ?auto_652588 ) ) ( not ( = ?auto_652585 ?auto_652589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652586 ?auto_652587 ?auto_652588 )
      ( MAKE-8CRATE-VERIFY ?auto_652580 ?auto_652581 ?auto_652582 ?auto_652583 ?auto_652584 ?auto_652585 ?auto_652586 ?auto_652587 ?auto_652588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652673 - SURFACE
      ?auto_652674 - SURFACE
      ?auto_652675 - SURFACE
      ?auto_652676 - SURFACE
      ?auto_652677 - SURFACE
      ?auto_652678 - SURFACE
      ?auto_652679 - SURFACE
      ?auto_652680 - SURFACE
      ?auto_652681 - SURFACE
    )
    :vars
    (
      ?auto_652682 - HOIST
      ?auto_652687 - PLACE
      ?auto_652685 - PLACE
      ?auto_652686 - HOIST
      ?auto_652683 - SURFACE
      ?auto_652684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652682 ?auto_652687 ) ( IS-CRATE ?auto_652681 ) ( not ( = ?auto_652680 ?auto_652681 ) ) ( not ( = ?auto_652679 ?auto_652680 ) ) ( not ( = ?auto_652679 ?auto_652681 ) ) ( not ( = ?auto_652685 ?auto_652687 ) ) ( HOIST-AT ?auto_652686 ?auto_652685 ) ( not ( = ?auto_652682 ?auto_652686 ) ) ( AVAILABLE ?auto_652686 ) ( SURFACE-AT ?auto_652681 ?auto_652685 ) ( ON ?auto_652681 ?auto_652683 ) ( CLEAR ?auto_652681 ) ( not ( = ?auto_652680 ?auto_652683 ) ) ( not ( = ?auto_652681 ?auto_652683 ) ) ( not ( = ?auto_652679 ?auto_652683 ) ) ( TRUCK-AT ?auto_652684 ?auto_652687 ) ( SURFACE-AT ?auto_652679 ?auto_652687 ) ( CLEAR ?auto_652679 ) ( LIFTING ?auto_652682 ?auto_652680 ) ( IS-CRATE ?auto_652680 ) ( ON ?auto_652674 ?auto_652673 ) ( ON ?auto_652675 ?auto_652674 ) ( ON ?auto_652676 ?auto_652675 ) ( ON ?auto_652677 ?auto_652676 ) ( ON ?auto_652678 ?auto_652677 ) ( ON ?auto_652679 ?auto_652678 ) ( not ( = ?auto_652673 ?auto_652674 ) ) ( not ( = ?auto_652673 ?auto_652675 ) ) ( not ( = ?auto_652673 ?auto_652676 ) ) ( not ( = ?auto_652673 ?auto_652677 ) ) ( not ( = ?auto_652673 ?auto_652678 ) ) ( not ( = ?auto_652673 ?auto_652679 ) ) ( not ( = ?auto_652673 ?auto_652680 ) ) ( not ( = ?auto_652673 ?auto_652681 ) ) ( not ( = ?auto_652673 ?auto_652683 ) ) ( not ( = ?auto_652674 ?auto_652675 ) ) ( not ( = ?auto_652674 ?auto_652676 ) ) ( not ( = ?auto_652674 ?auto_652677 ) ) ( not ( = ?auto_652674 ?auto_652678 ) ) ( not ( = ?auto_652674 ?auto_652679 ) ) ( not ( = ?auto_652674 ?auto_652680 ) ) ( not ( = ?auto_652674 ?auto_652681 ) ) ( not ( = ?auto_652674 ?auto_652683 ) ) ( not ( = ?auto_652675 ?auto_652676 ) ) ( not ( = ?auto_652675 ?auto_652677 ) ) ( not ( = ?auto_652675 ?auto_652678 ) ) ( not ( = ?auto_652675 ?auto_652679 ) ) ( not ( = ?auto_652675 ?auto_652680 ) ) ( not ( = ?auto_652675 ?auto_652681 ) ) ( not ( = ?auto_652675 ?auto_652683 ) ) ( not ( = ?auto_652676 ?auto_652677 ) ) ( not ( = ?auto_652676 ?auto_652678 ) ) ( not ( = ?auto_652676 ?auto_652679 ) ) ( not ( = ?auto_652676 ?auto_652680 ) ) ( not ( = ?auto_652676 ?auto_652681 ) ) ( not ( = ?auto_652676 ?auto_652683 ) ) ( not ( = ?auto_652677 ?auto_652678 ) ) ( not ( = ?auto_652677 ?auto_652679 ) ) ( not ( = ?auto_652677 ?auto_652680 ) ) ( not ( = ?auto_652677 ?auto_652681 ) ) ( not ( = ?auto_652677 ?auto_652683 ) ) ( not ( = ?auto_652678 ?auto_652679 ) ) ( not ( = ?auto_652678 ?auto_652680 ) ) ( not ( = ?auto_652678 ?auto_652681 ) ) ( not ( = ?auto_652678 ?auto_652683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652679 ?auto_652680 ?auto_652681 )
      ( MAKE-8CRATE-VERIFY ?auto_652673 ?auto_652674 ?auto_652675 ?auto_652676 ?auto_652677 ?auto_652678 ?auto_652679 ?auto_652680 ?auto_652681 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652766 - SURFACE
      ?auto_652767 - SURFACE
      ?auto_652768 - SURFACE
      ?auto_652769 - SURFACE
      ?auto_652770 - SURFACE
      ?auto_652771 - SURFACE
      ?auto_652772 - SURFACE
      ?auto_652773 - SURFACE
      ?auto_652774 - SURFACE
    )
    :vars
    (
      ?auto_652780 - HOIST
      ?auto_652775 - PLACE
      ?auto_652776 - PLACE
      ?auto_652778 - HOIST
      ?auto_652777 - SURFACE
      ?auto_652779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652780 ?auto_652775 ) ( IS-CRATE ?auto_652774 ) ( not ( = ?auto_652773 ?auto_652774 ) ) ( not ( = ?auto_652772 ?auto_652773 ) ) ( not ( = ?auto_652772 ?auto_652774 ) ) ( not ( = ?auto_652776 ?auto_652775 ) ) ( HOIST-AT ?auto_652778 ?auto_652776 ) ( not ( = ?auto_652780 ?auto_652778 ) ) ( AVAILABLE ?auto_652778 ) ( SURFACE-AT ?auto_652774 ?auto_652776 ) ( ON ?auto_652774 ?auto_652777 ) ( CLEAR ?auto_652774 ) ( not ( = ?auto_652773 ?auto_652777 ) ) ( not ( = ?auto_652774 ?auto_652777 ) ) ( not ( = ?auto_652772 ?auto_652777 ) ) ( TRUCK-AT ?auto_652779 ?auto_652775 ) ( SURFACE-AT ?auto_652772 ?auto_652775 ) ( CLEAR ?auto_652772 ) ( IS-CRATE ?auto_652773 ) ( AVAILABLE ?auto_652780 ) ( IN ?auto_652773 ?auto_652779 ) ( ON ?auto_652767 ?auto_652766 ) ( ON ?auto_652768 ?auto_652767 ) ( ON ?auto_652769 ?auto_652768 ) ( ON ?auto_652770 ?auto_652769 ) ( ON ?auto_652771 ?auto_652770 ) ( ON ?auto_652772 ?auto_652771 ) ( not ( = ?auto_652766 ?auto_652767 ) ) ( not ( = ?auto_652766 ?auto_652768 ) ) ( not ( = ?auto_652766 ?auto_652769 ) ) ( not ( = ?auto_652766 ?auto_652770 ) ) ( not ( = ?auto_652766 ?auto_652771 ) ) ( not ( = ?auto_652766 ?auto_652772 ) ) ( not ( = ?auto_652766 ?auto_652773 ) ) ( not ( = ?auto_652766 ?auto_652774 ) ) ( not ( = ?auto_652766 ?auto_652777 ) ) ( not ( = ?auto_652767 ?auto_652768 ) ) ( not ( = ?auto_652767 ?auto_652769 ) ) ( not ( = ?auto_652767 ?auto_652770 ) ) ( not ( = ?auto_652767 ?auto_652771 ) ) ( not ( = ?auto_652767 ?auto_652772 ) ) ( not ( = ?auto_652767 ?auto_652773 ) ) ( not ( = ?auto_652767 ?auto_652774 ) ) ( not ( = ?auto_652767 ?auto_652777 ) ) ( not ( = ?auto_652768 ?auto_652769 ) ) ( not ( = ?auto_652768 ?auto_652770 ) ) ( not ( = ?auto_652768 ?auto_652771 ) ) ( not ( = ?auto_652768 ?auto_652772 ) ) ( not ( = ?auto_652768 ?auto_652773 ) ) ( not ( = ?auto_652768 ?auto_652774 ) ) ( not ( = ?auto_652768 ?auto_652777 ) ) ( not ( = ?auto_652769 ?auto_652770 ) ) ( not ( = ?auto_652769 ?auto_652771 ) ) ( not ( = ?auto_652769 ?auto_652772 ) ) ( not ( = ?auto_652769 ?auto_652773 ) ) ( not ( = ?auto_652769 ?auto_652774 ) ) ( not ( = ?auto_652769 ?auto_652777 ) ) ( not ( = ?auto_652770 ?auto_652771 ) ) ( not ( = ?auto_652770 ?auto_652772 ) ) ( not ( = ?auto_652770 ?auto_652773 ) ) ( not ( = ?auto_652770 ?auto_652774 ) ) ( not ( = ?auto_652770 ?auto_652777 ) ) ( not ( = ?auto_652771 ?auto_652772 ) ) ( not ( = ?auto_652771 ?auto_652773 ) ) ( not ( = ?auto_652771 ?auto_652774 ) ) ( not ( = ?auto_652771 ?auto_652777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652772 ?auto_652773 ?auto_652774 )
      ( MAKE-8CRATE-VERIFY ?auto_652766 ?auto_652767 ?auto_652768 ?auto_652769 ?auto_652770 ?auto_652771 ?auto_652772 ?auto_652773 ?auto_652774 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656882 - SURFACE
      ?auto_656883 - SURFACE
      ?auto_656884 - SURFACE
      ?auto_656885 - SURFACE
      ?auto_656886 - SURFACE
      ?auto_656887 - SURFACE
      ?auto_656888 - SURFACE
      ?auto_656889 - SURFACE
      ?auto_656890 - SURFACE
      ?auto_656891 - SURFACE
    )
    :vars
    (
      ?auto_656893 - HOIST
      ?auto_656892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_656893 ?auto_656892 ) ( SURFACE-AT ?auto_656890 ?auto_656892 ) ( CLEAR ?auto_656890 ) ( LIFTING ?auto_656893 ?auto_656891 ) ( IS-CRATE ?auto_656891 ) ( not ( = ?auto_656890 ?auto_656891 ) ) ( ON ?auto_656883 ?auto_656882 ) ( ON ?auto_656884 ?auto_656883 ) ( ON ?auto_656885 ?auto_656884 ) ( ON ?auto_656886 ?auto_656885 ) ( ON ?auto_656887 ?auto_656886 ) ( ON ?auto_656888 ?auto_656887 ) ( ON ?auto_656889 ?auto_656888 ) ( ON ?auto_656890 ?auto_656889 ) ( not ( = ?auto_656882 ?auto_656883 ) ) ( not ( = ?auto_656882 ?auto_656884 ) ) ( not ( = ?auto_656882 ?auto_656885 ) ) ( not ( = ?auto_656882 ?auto_656886 ) ) ( not ( = ?auto_656882 ?auto_656887 ) ) ( not ( = ?auto_656882 ?auto_656888 ) ) ( not ( = ?auto_656882 ?auto_656889 ) ) ( not ( = ?auto_656882 ?auto_656890 ) ) ( not ( = ?auto_656882 ?auto_656891 ) ) ( not ( = ?auto_656883 ?auto_656884 ) ) ( not ( = ?auto_656883 ?auto_656885 ) ) ( not ( = ?auto_656883 ?auto_656886 ) ) ( not ( = ?auto_656883 ?auto_656887 ) ) ( not ( = ?auto_656883 ?auto_656888 ) ) ( not ( = ?auto_656883 ?auto_656889 ) ) ( not ( = ?auto_656883 ?auto_656890 ) ) ( not ( = ?auto_656883 ?auto_656891 ) ) ( not ( = ?auto_656884 ?auto_656885 ) ) ( not ( = ?auto_656884 ?auto_656886 ) ) ( not ( = ?auto_656884 ?auto_656887 ) ) ( not ( = ?auto_656884 ?auto_656888 ) ) ( not ( = ?auto_656884 ?auto_656889 ) ) ( not ( = ?auto_656884 ?auto_656890 ) ) ( not ( = ?auto_656884 ?auto_656891 ) ) ( not ( = ?auto_656885 ?auto_656886 ) ) ( not ( = ?auto_656885 ?auto_656887 ) ) ( not ( = ?auto_656885 ?auto_656888 ) ) ( not ( = ?auto_656885 ?auto_656889 ) ) ( not ( = ?auto_656885 ?auto_656890 ) ) ( not ( = ?auto_656885 ?auto_656891 ) ) ( not ( = ?auto_656886 ?auto_656887 ) ) ( not ( = ?auto_656886 ?auto_656888 ) ) ( not ( = ?auto_656886 ?auto_656889 ) ) ( not ( = ?auto_656886 ?auto_656890 ) ) ( not ( = ?auto_656886 ?auto_656891 ) ) ( not ( = ?auto_656887 ?auto_656888 ) ) ( not ( = ?auto_656887 ?auto_656889 ) ) ( not ( = ?auto_656887 ?auto_656890 ) ) ( not ( = ?auto_656887 ?auto_656891 ) ) ( not ( = ?auto_656888 ?auto_656889 ) ) ( not ( = ?auto_656888 ?auto_656890 ) ) ( not ( = ?auto_656888 ?auto_656891 ) ) ( not ( = ?auto_656889 ?auto_656890 ) ) ( not ( = ?auto_656889 ?auto_656891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_656890 ?auto_656891 )
      ( MAKE-9CRATE-VERIFY ?auto_656882 ?auto_656883 ?auto_656884 ?auto_656885 ?auto_656886 ?auto_656887 ?auto_656888 ?auto_656889 ?auto_656890 ?auto_656891 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656962 - SURFACE
      ?auto_656963 - SURFACE
      ?auto_656964 - SURFACE
      ?auto_656965 - SURFACE
      ?auto_656966 - SURFACE
      ?auto_656967 - SURFACE
      ?auto_656968 - SURFACE
      ?auto_656969 - SURFACE
      ?auto_656970 - SURFACE
      ?auto_656971 - SURFACE
    )
    :vars
    (
      ?auto_656972 - HOIST
      ?auto_656974 - PLACE
      ?auto_656973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_656972 ?auto_656974 ) ( SURFACE-AT ?auto_656970 ?auto_656974 ) ( CLEAR ?auto_656970 ) ( IS-CRATE ?auto_656971 ) ( not ( = ?auto_656970 ?auto_656971 ) ) ( TRUCK-AT ?auto_656973 ?auto_656974 ) ( AVAILABLE ?auto_656972 ) ( IN ?auto_656971 ?auto_656973 ) ( ON ?auto_656970 ?auto_656969 ) ( not ( = ?auto_656969 ?auto_656970 ) ) ( not ( = ?auto_656969 ?auto_656971 ) ) ( ON ?auto_656963 ?auto_656962 ) ( ON ?auto_656964 ?auto_656963 ) ( ON ?auto_656965 ?auto_656964 ) ( ON ?auto_656966 ?auto_656965 ) ( ON ?auto_656967 ?auto_656966 ) ( ON ?auto_656968 ?auto_656967 ) ( ON ?auto_656969 ?auto_656968 ) ( not ( = ?auto_656962 ?auto_656963 ) ) ( not ( = ?auto_656962 ?auto_656964 ) ) ( not ( = ?auto_656962 ?auto_656965 ) ) ( not ( = ?auto_656962 ?auto_656966 ) ) ( not ( = ?auto_656962 ?auto_656967 ) ) ( not ( = ?auto_656962 ?auto_656968 ) ) ( not ( = ?auto_656962 ?auto_656969 ) ) ( not ( = ?auto_656962 ?auto_656970 ) ) ( not ( = ?auto_656962 ?auto_656971 ) ) ( not ( = ?auto_656963 ?auto_656964 ) ) ( not ( = ?auto_656963 ?auto_656965 ) ) ( not ( = ?auto_656963 ?auto_656966 ) ) ( not ( = ?auto_656963 ?auto_656967 ) ) ( not ( = ?auto_656963 ?auto_656968 ) ) ( not ( = ?auto_656963 ?auto_656969 ) ) ( not ( = ?auto_656963 ?auto_656970 ) ) ( not ( = ?auto_656963 ?auto_656971 ) ) ( not ( = ?auto_656964 ?auto_656965 ) ) ( not ( = ?auto_656964 ?auto_656966 ) ) ( not ( = ?auto_656964 ?auto_656967 ) ) ( not ( = ?auto_656964 ?auto_656968 ) ) ( not ( = ?auto_656964 ?auto_656969 ) ) ( not ( = ?auto_656964 ?auto_656970 ) ) ( not ( = ?auto_656964 ?auto_656971 ) ) ( not ( = ?auto_656965 ?auto_656966 ) ) ( not ( = ?auto_656965 ?auto_656967 ) ) ( not ( = ?auto_656965 ?auto_656968 ) ) ( not ( = ?auto_656965 ?auto_656969 ) ) ( not ( = ?auto_656965 ?auto_656970 ) ) ( not ( = ?auto_656965 ?auto_656971 ) ) ( not ( = ?auto_656966 ?auto_656967 ) ) ( not ( = ?auto_656966 ?auto_656968 ) ) ( not ( = ?auto_656966 ?auto_656969 ) ) ( not ( = ?auto_656966 ?auto_656970 ) ) ( not ( = ?auto_656966 ?auto_656971 ) ) ( not ( = ?auto_656967 ?auto_656968 ) ) ( not ( = ?auto_656967 ?auto_656969 ) ) ( not ( = ?auto_656967 ?auto_656970 ) ) ( not ( = ?auto_656967 ?auto_656971 ) ) ( not ( = ?auto_656968 ?auto_656969 ) ) ( not ( = ?auto_656968 ?auto_656970 ) ) ( not ( = ?auto_656968 ?auto_656971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656969 ?auto_656970 ?auto_656971 )
      ( MAKE-9CRATE-VERIFY ?auto_656962 ?auto_656963 ?auto_656964 ?auto_656965 ?auto_656966 ?auto_656967 ?auto_656968 ?auto_656969 ?auto_656970 ?auto_656971 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657052 - SURFACE
      ?auto_657053 - SURFACE
      ?auto_657054 - SURFACE
      ?auto_657055 - SURFACE
      ?auto_657056 - SURFACE
      ?auto_657057 - SURFACE
      ?auto_657058 - SURFACE
      ?auto_657059 - SURFACE
      ?auto_657060 - SURFACE
      ?auto_657061 - SURFACE
    )
    :vars
    (
      ?auto_657064 - HOIST
      ?auto_657062 - PLACE
      ?auto_657065 - TRUCK
      ?auto_657063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657064 ?auto_657062 ) ( SURFACE-AT ?auto_657060 ?auto_657062 ) ( CLEAR ?auto_657060 ) ( IS-CRATE ?auto_657061 ) ( not ( = ?auto_657060 ?auto_657061 ) ) ( AVAILABLE ?auto_657064 ) ( IN ?auto_657061 ?auto_657065 ) ( ON ?auto_657060 ?auto_657059 ) ( not ( = ?auto_657059 ?auto_657060 ) ) ( not ( = ?auto_657059 ?auto_657061 ) ) ( TRUCK-AT ?auto_657065 ?auto_657063 ) ( not ( = ?auto_657063 ?auto_657062 ) ) ( ON ?auto_657053 ?auto_657052 ) ( ON ?auto_657054 ?auto_657053 ) ( ON ?auto_657055 ?auto_657054 ) ( ON ?auto_657056 ?auto_657055 ) ( ON ?auto_657057 ?auto_657056 ) ( ON ?auto_657058 ?auto_657057 ) ( ON ?auto_657059 ?auto_657058 ) ( not ( = ?auto_657052 ?auto_657053 ) ) ( not ( = ?auto_657052 ?auto_657054 ) ) ( not ( = ?auto_657052 ?auto_657055 ) ) ( not ( = ?auto_657052 ?auto_657056 ) ) ( not ( = ?auto_657052 ?auto_657057 ) ) ( not ( = ?auto_657052 ?auto_657058 ) ) ( not ( = ?auto_657052 ?auto_657059 ) ) ( not ( = ?auto_657052 ?auto_657060 ) ) ( not ( = ?auto_657052 ?auto_657061 ) ) ( not ( = ?auto_657053 ?auto_657054 ) ) ( not ( = ?auto_657053 ?auto_657055 ) ) ( not ( = ?auto_657053 ?auto_657056 ) ) ( not ( = ?auto_657053 ?auto_657057 ) ) ( not ( = ?auto_657053 ?auto_657058 ) ) ( not ( = ?auto_657053 ?auto_657059 ) ) ( not ( = ?auto_657053 ?auto_657060 ) ) ( not ( = ?auto_657053 ?auto_657061 ) ) ( not ( = ?auto_657054 ?auto_657055 ) ) ( not ( = ?auto_657054 ?auto_657056 ) ) ( not ( = ?auto_657054 ?auto_657057 ) ) ( not ( = ?auto_657054 ?auto_657058 ) ) ( not ( = ?auto_657054 ?auto_657059 ) ) ( not ( = ?auto_657054 ?auto_657060 ) ) ( not ( = ?auto_657054 ?auto_657061 ) ) ( not ( = ?auto_657055 ?auto_657056 ) ) ( not ( = ?auto_657055 ?auto_657057 ) ) ( not ( = ?auto_657055 ?auto_657058 ) ) ( not ( = ?auto_657055 ?auto_657059 ) ) ( not ( = ?auto_657055 ?auto_657060 ) ) ( not ( = ?auto_657055 ?auto_657061 ) ) ( not ( = ?auto_657056 ?auto_657057 ) ) ( not ( = ?auto_657056 ?auto_657058 ) ) ( not ( = ?auto_657056 ?auto_657059 ) ) ( not ( = ?auto_657056 ?auto_657060 ) ) ( not ( = ?auto_657056 ?auto_657061 ) ) ( not ( = ?auto_657057 ?auto_657058 ) ) ( not ( = ?auto_657057 ?auto_657059 ) ) ( not ( = ?auto_657057 ?auto_657060 ) ) ( not ( = ?auto_657057 ?auto_657061 ) ) ( not ( = ?auto_657058 ?auto_657059 ) ) ( not ( = ?auto_657058 ?auto_657060 ) ) ( not ( = ?auto_657058 ?auto_657061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657059 ?auto_657060 ?auto_657061 )
      ( MAKE-9CRATE-VERIFY ?auto_657052 ?auto_657053 ?auto_657054 ?auto_657055 ?auto_657056 ?auto_657057 ?auto_657058 ?auto_657059 ?auto_657060 ?auto_657061 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657151 - SURFACE
      ?auto_657152 - SURFACE
      ?auto_657153 - SURFACE
      ?auto_657154 - SURFACE
      ?auto_657155 - SURFACE
      ?auto_657156 - SURFACE
      ?auto_657157 - SURFACE
      ?auto_657158 - SURFACE
      ?auto_657159 - SURFACE
      ?auto_657160 - SURFACE
    )
    :vars
    (
      ?auto_657164 - HOIST
      ?auto_657161 - PLACE
      ?auto_657165 - TRUCK
      ?auto_657163 - PLACE
      ?auto_657162 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_657164 ?auto_657161 ) ( SURFACE-AT ?auto_657159 ?auto_657161 ) ( CLEAR ?auto_657159 ) ( IS-CRATE ?auto_657160 ) ( not ( = ?auto_657159 ?auto_657160 ) ) ( AVAILABLE ?auto_657164 ) ( ON ?auto_657159 ?auto_657158 ) ( not ( = ?auto_657158 ?auto_657159 ) ) ( not ( = ?auto_657158 ?auto_657160 ) ) ( TRUCK-AT ?auto_657165 ?auto_657163 ) ( not ( = ?auto_657163 ?auto_657161 ) ) ( HOIST-AT ?auto_657162 ?auto_657163 ) ( LIFTING ?auto_657162 ?auto_657160 ) ( not ( = ?auto_657164 ?auto_657162 ) ) ( ON ?auto_657152 ?auto_657151 ) ( ON ?auto_657153 ?auto_657152 ) ( ON ?auto_657154 ?auto_657153 ) ( ON ?auto_657155 ?auto_657154 ) ( ON ?auto_657156 ?auto_657155 ) ( ON ?auto_657157 ?auto_657156 ) ( ON ?auto_657158 ?auto_657157 ) ( not ( = ?auto_657151 ?auto_657152 ) ) ( not ( = ?auto_657151 ?auto_657153 ) ) ( not ( = ?auto_657151 ?auto_657154 ) ) ( not ( = ?auto_657151 ?auto_657155 ) ) ( not ( = ?auto_657151 ?auto_657156 ) ) ( not ( = ?auto_657151 ?auto_657157 ) ) ( not ( = ?auto_657151 ?auto_657158 ) ) ( not ( = ?auto_657151 ?auto_657159 ) ) ( not ( = ?auto_657151 ?auto_657160 ) ) ( not ( = ?auto_657152 ?auto_657153 ) ) ( not ( = ?auto_657152 ?auto_657154 ) ) ( not ( = ?auto_657152 ?auto_657155 ) ) ( not ( = ?auto_657152 ?auto_657156 ) ) ( not ( = ?auto_657152 ?auto_657157 ) ) ( not ( = ?auto_657152 ?auto_657158 ) ) ( not ( = ?auto_657152 ?auto_657159 ) ) ( not ( = ?auto_657152 ?auto_657160 ) ) ( not ( = ?auto_657153 ?auto_657154 ) ) ( not ( = ?auto_657153 ?auto_657155 ) ) ( not ( = ?auto_657153 ?auto_657156 ) ) ( not ( = ?auto_657153 ?auto_657157 ) ) ( not ( = ?auto_657153 ?auto_657158 ) ) ( not ( = ?auto_657153 ?auto_657159 ) ) ( not ( = ?auto_657153 ?auto_657160 ) ) ( not ( = ?auto_657154 ?auto_657155 ) ) ( not ( = ?auto_657154 ?auto_657156 ) ) ( not ( = ?auto_657154 ?auto_657157 ) ) ( not ( = ?auto_657154 ?auto_657158 ) ) ( not ( = ?auto_657154 ?auto_657159 ) ) ( not ( = ?auto_657154 ?auto_657160 ) ) ( not ( = ?auto_657155 ?auto_657156 ) ) ( not ( = ?auto_657155 ?auto_657157 ) ) ( not ( = ?auto_657155 ?auto_657158 ) ) ( not ( = ?auto_657155 ?auto_657159 ) ) ( not ( = ?auto_657155 ?auto_657160 ) ) ( not ( = ?auto_657156 ?auto_657157 ) ) ( not ( = ?auto_657156 ?auto_657158 ) ) ( not ( = ?auto_657156 ?auto_657159 ) ) ( not ( = ?auto_657156 ?auto_657160 ) ) ( not ( = ?auto_657157 ?auto_657158 ) ) ( not ( = ?auto_657157 ?auto_657159 ) ) ( not ( = ?auto_657157 ?auto_657160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657158 ?auto_657159 ?auto_657160 )
      ( MAKE-9CRATE-VERIFY ?auto_657151 ?auto_657152 ?auto_657153 ?auto_657154 ?auto_657155 ?auto_657156 ?auto_657157 ?auto_657158 ?auto_657159 ?auto_657160 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657259 - SURFACE
      ?auto_657260 - SURFACE
      ?auto_657261 - SURFACE
      ?auto_657262 - SURFACE
      ?auto_657263 - SURFACE
      ?auto_657264 - SURFACE
      ?auto_657265 - SURFACE
      ?auto_657266 - SURFACE
      ?auto_657267 - SURFACE
      ?auto_657268 - SURFACE
    )
    :vars
    (
      ?auto_657271 - HOIST
      ?auto_657270 - PLACE
      ?auto_657274 - TRUCK
      ?auto_657269 - PLACE
      ?auto_657273 - HOIST
      ?auto_657272 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_657271 ?auto_657270 ) ( SURFACE-AT ?auto_657267 ?auto_657270 ) ( CLEAR ?auto_657267 ) ( IS-CRATE ?auto_657268 ) ( not ( = ?auto_657267 ?auto_657268 ) ) ( AVAILABLE ?auto_657271 ) ( ON ?auto_657267 ?auto_657266 ) ( not ( = ?auto_657266 ?auto_657267 ) ) ( not ( = ?auto_657266 ?auto_657268 ) ) ( TRUCK-AT ?auto_657274 ?auto_657269 ) ( not ( = ?auto_657269 ?auto_657270 ) ) ( HOIST-AT ?auto_657273 ?auto_657269 ) ( not ( = ?auto_657271 ?auto_657273 ) ) ( AVAILABLE ?auto_657273 ) ( SURFACE-AT ?auto_657268 ?auto_657269 ) ( ON ?auto_657268 ?auto_657272 ) ( CLEAR ?auto_657268 ) ( not ( = ?auto_657267 ?auto_657272 ) ) ( not ( = ?auto_657268 ?auto_657272 ) ) ( not ( = ?auto_657266 ?auto_657272 ) ) ( ON ?auto_657260 ?auto_657259 ) ( ON ?auto_657261 ?auto_657260 ) ( ON ?auto_657262 ?auto_657261 ) ( ON ?auto_657263 ?auto_657262 ) ( ON ?auto_657264 ?auto_657263 ) ( ON ?auto_657265 ?auto_657264 ) ( ON ?auto_657266 ?auto_657265 ) ( not ( = ?auto_657259 ?auto_657260 ) ) ( not ( = ?auto_657259 ?auto_657261 ) ) ( not ( = ?auto_657259 ?auto_657262 ) ) ( not ( = ?auto_657259 ?auto_657263 ) ) ( not ( = ?auto_657259 ?auto_657264 ) ) ( not ( = ?auto_657259 ?auto_657265 ) ) ( not ( = ?auto_657259 ?auto_657266 ) ) ( not ( = ?auto_657259 ?auto_657267 ) ) ( not ( = ?auto_657259 ?auto_657268 ) ) ( not ( = ?auto_657259 ?auto_657272 ) ) ( not ( = ?auto_657260 ?auto_657261 ) ) ( not ( = ?auto_657260 ?auto_657262 ) ) ( not ( = ?auto_657260 ?auto_657263 ) ) ( not ( = ?auto_657260 ?auto_657264 ) ) ( not ( = ?auto_657260 ?auto_657265 ) ) ( not ( = ?auto_657260 ?auto_657266 ) ) ( not ( = ?auto_657260 ?auto_657267 ) ) ( not ( = ?auto_657260 ?auto_657268 ) ) ( not ( = ?auto_657260 ?auto_657272 ) ) ( not ( = ?auto_657261 ?auto_657262 ) ) ( not ( = ?auto_657261 ?auto_657263 ) ) ( not ( = ?auto_657261 ?auto_657264 ) ) ( not ( = ?auto_657261 ?auto_657265 ) ) ( not ( = ?auto_657261 ?auto_657266 ) ) ( not ( = ?auto_657261 ?auto_657267 ) ) ( not ( = ?auto_657261 ?auto_657268 ) ) ( not ( = ?auto_657261 ?auto_657272 ) ) ( not ( = ?auto_657262 ?auto_657263 ) ) ( not ( = ?auto_657262 ?auto_657264 ) ) ( not ( = ?auto_657262 ?auto_657265 ) ) ( not ( = ?auto_657262 ?auto_657266 ) ) ( not ( = ?auto_657262 ?auto_657267 ) ) ( not ( = ?auto_657262 ?auto_657268 ) ) ( not ( = ?auto_657262 ?auto_657272 ) ) ( not ( = ?auto_657263 ?auto_657264 ) ) ( not ( = ?auto_657263 ?auto_657265 ) ) ( not ( = ?auto_657263 ?auto_657266 ) ) ( not ( = ?auto_657263 ?auto_657267 ) ) ( not ( = ?auto_657263 ?auto_657268 ) ) ( not ( = ?auto_657263 ?auto_657272 ) ) ( not ( = ?auto_657264 ?auto_657265 ) ) ( not ( = ?auto_657264 ?auto_657266 ) ) ( not ( = ?auto_657264 ?auto_657267 ) ) ( not ( = ?auto_657264 ?auto_657268 ) ) ( not ( = ?auto_657264 ?auto_657272 ) ) ( not ( = ?auto_657265 ?auto_657266 ) ) ( not ( = ?auto_657265 ?auto_657267 ) ) ( not ( = ?auto_657265 ?auto_657268 ) ) ( not ( = ?auto_657265 ?auto_657272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657266 ?auto_657267 ?auto_657268 )
      ( MAKE-9CRATE-VERIFY ?auto_657259 ?auto_657260 ?auto_657261 ?auto_657262 ?auto_657263 ?auto_657264 ?auto_657265 ?auto_657266 ?auto_657267 ?auto_657268 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657368 - SURFACE
      ?auto_657369 - SURFACE
      ?auto_657370 - SURFACE
      ?auto_657371 - SURFACE
      ?auto_657372 - SURFACE
      ?auto_657373 - SURFACE
      ?auto_657374 - SURFACE
      ?auto_657375 - SURFACE
      ?auto_657376 - SURFACE
      ?auto_657377 - SURFACE
    )
    :vars
    (
      ?auto_657380 - HOIST
      ?auto_657383 - PLACE
      ?auto_657378 - PLACE
      ?auto_657381 - HOIST
      ?auto_657379 - SURFACE
      ?auto_657382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657380 ?auto_657383 ) ( SURFACE-AT ?auto_657376 ?auto_657383 ) ( CLEAR ?auto_657376 ) ( IS-CRATE ?auto_657377 ) ( not ( = ?auto_657376 ?auto_657377 ) ) ( AVAILABLE ?auto_657380 ) ( ON ?auto_657376 ?auto_657375 ) ( not ( = ?auto_657375 ?auto_657376 ) ) ( not ( = ?auto_657375 ?auto_657377 ) ) ( not ( = ?auto_657378 ?auto_657383 ) ) ( HOIST-AT ?auto_657381 ?auto_657378 ) ( not ( = ?auto_657380 ?auto_657381 ) ) ( AVAILABLE ?auto_657381 ) ( SURFACE-AT ?auto_657377 ?auto_657378 ) ( ON ?auto_657377 ?auto_657379 ) ( CLEAR ?auto_657377 ) ( not ( = ?auto_657376 ?auto_657379 ) ) ( not ( = ?auto_657377 ?auto_657379 ) ) ( not ( = ?auto_657375 ?auto_657379 ) ) ( TRUCK-AT ?auto_657382 ?auto_657383 ) ( ON ?auto_657369 ?auto_657368 ) ( ON ?auto_657370 ?auto_657369 ) ( ON ?auto_657371 ?auto_657370 ) ( ON ?auto_657372 ?auto_657371 ) ( ON ?auto_657373 ?auto_657372 ) ( ON ?auto_657374 ?auto_657373 ) ( ON ?auto_657375 ?auto_657374 ) ( not ( = ?auto_657368 ?auto_657369 ) ) ( not ( = ?auto_657368 ?auto_657370 ) ) ( not ( = ?auto_657368 ?auto_657371 ) ) ( not ( = ?auto_657368 ?auto_657372 ) ) ( not ( = ?auto_657368 ?auto_657373 ) ) ( not ( = ?auto_657368 ?auto_657374 ) ) ( not ( = ?auto_657368 ?auto_657375 ) ) ( not ( = ?auto_657368 ?auto_657376 ) ) ( not ( = ?auto_657368 ?auto_657377 ) ) ( not ( = ?auto_657368 ?auto_657379 ) ) ( not ( = ?auto_657369 ?auto_657370 ) ) ( not ( = ?auto_657369 ?auto_657371 ) ) ( not ( = ?auto_657369 ?auto_657372 ) ) ( not ( = ?auto_657369 ?auto_657373 ) ) ( not ( = ?auto_657369 ?auto_657374 ) ) ( not ( = ?auto_657369 ?auto_657375 ) ) ( not ( = ?auto_657369 ?auto_657376 ) ) ( not ( = ?auto_657369 ?auto_657377 ) ) ( not ( = ?auto_657369 ?auto_657379 ) ) ( not ( = ?auto_657370 ?auto_657371 ) ) ( not ( = ?auto_657370 ?auto_657372 ) ) ( not ( = ?auto_657370 ?auto_657373 ) ) ( not ( = ?auto_657370 ?auto_657374 ) ) ( not ( = ?auto_657370 ?auto_657375 ) ) ( not ( = ?auto_657370 ?auto_657376 ) ) ( not ( = ?auto_657370 ?auto_657377 ) ) ( not ( = ?auto_657370 ?auto_657379 ) ) ( not ( = ?auto_657371 ?auto_657372 ) ) ( not ( = ?auto_657371 ?auto_657373 ) ) ( not ( = ?auto_657371 ?auto_657374 ) ) ( not ( = ?auto_657371 ?auto_657375 ) ) ( not ( = ?auto_657371 ?auto_657376 ) ) ( not ( = ?auto_657371 ?auto_657377 ) ) ( not ( = ?auto_657371 ?auto_657379 ) ) ( not ( = ?auto_657372 ?auto_657373 ) ) ( not ( = ?auto_657372 ?auto_657374 ) ) ( not ( = ?auto_657372 ?auto_657375 ) ) ( not ( = ?auto_657372 ?auto_657376 ) ) ( not ( = ?auto_657372 ?auto_657377 ) ) ( not ( = ?auto_657372 ?auto_657379 ) ) ( not ( = ?auto_657373 ?auto_657374 ) ) ( not ( = ?auto_657373 ?auto_657375 ) ) ( not ( = ?auto_657373 ?auto_657376 ) ) ( not ( = ?auto_657373 ?auto_657377 ) ) ( not ( = ?auto_657373 ?auto_657379 ) ) ( not ( = ?auto_657374 ?auto_657375 ) ) ( not ( = ?auto_657374 ?auto_657376 ) ) ( not ( = ?auto_657374 ?auto_657377 ) ) ( not ( = ?auto_657374 ?auto_657379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657375 ?auto_657376 ?auto_657377 )
      ( MAKE-9CRATE-VERIFY ?auto_657368 ?auto_657369 ?auto_657370 ?auto_657371 ?auto_657372 ?auto_657373 ?auto_657374 ?auto_657375 ?auto_657376 ?auto_657377 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657477 - SURFACE
      ?auto_657478 - SURFACE
      ?auto_657479 - SURFACE
      ?auto_657480 - SURFACE
      ?auto_657481 - SURFACE
      ?auto_657482 - SURFACE
      ?auto_657483 - SURFACE
      ?auto_657484 - SURFACE
      ?auto_657485 - SURFACE
      ?auto_657486 - SURFACE
    )
    :vars
    (
      ?auto_657489 - HOIST
      ?auto_657490 - PLACE
      ?auto_657487 - PLACE
      ?auto_657492 - HOIST
      ?auto_657491 - SURFACE
      ?auto_657488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657489 ?auto_657490 ) ( IS-CRATE ?auto_657486 ) ( not ( = ?auto_657485 ?auto_657486 ) ) ( not ( = ?auto_657484 ?auto_657485 ) ) ( not ( = ?auto_657484 ?auto_657486 ) ) ( not ( = ?auto_657487 ?auto_657490 ) ) ( HOIST-AT ?auto_657492 ?auto_657487 ) ( not ( = ?auto_657489 ?auto_657492 ) ) ( AVAILABLE ?auto_657492 ) ( SURFACE-AT ?auto_657486 ?auto_657487 ) ( ON ?auto_657486 ?auto_657491 ) ( CLEAR ?auto_657486 ) ( not ( = ?auto_657485 ?auto_657491 ) ) ( not ( = ?auto_657486 ?auto_657491 ) ) ( not ( = ?auto_657484 ?auto_657491 ) ) ( TRUCK-AT ?auto_657488 ?auto_657490 ) ( SURFACE-AT ?auto_657484 ?auto_657490 ) ( CLEAR ?auto_657484 ) ( LIFTING ?auto_657489 ?auto_657485 ) ( IS-CRATE ?auto_657485 ) ( ON ?auto_657478 ?auto_657477 ) ( ON ?auto_657479 ?auto_657478 ) ( ON ?auto_657480 ?auto_657479 ) ( ON ?auto_657481 ?auto_657480 ) ( ON ?auto_657482 ?auto_657481 ) ( ON ?auto_657483 ?auto_657482 ) ( ON ?auto_657484 ?auto_657483 ) ( not ( = ?auto_657477 ?auto_657478 ) ) ( not ( = ?auto_657477 ?auto_657479 ) ) ( not ( = ?auto_657477 ?auto_657480 ) ) ( not ( = ?auto_657477 ?auto_657481 ) ) ( not ( = ?auto_657477 ?auto_657482 ) ) ( not ( = ?auto_657477 ?auto_657483 ) ) ( not ( = ?auto_657477 ?auto_657484 ) ) ( not ( = ?auto_657477 ?auto_657485 ) ) ( not ( = ?auto_657477 ?auto_657486 ) ) ( not ( = ?auto_657477 ?auto_657491 ) ) ( not ( = ?auto_657478 ?auto_657479 ) ) ( not ( = ?auto_657478 ?auto_657480 ) ) ( not ( = ?auto_657478 ?auto_657481 ) ) ( not ( = ?auto_657478 ?auto_657482 ) ) ( not ( = ?auto_657478 ?auto_657483 ) ) ( not ( = ?auto_657478 ?auto_657484 ) ) ( not ( = ?auto_657478 ?auto_657485 ) ) ( not ( = ?auto_657478 ?auto_657486 ) ) ( not ( = ?auto_657478 ?auto_657491 ) ) ( not ( = ?auto_657479 ?auto_657480 ) ) ( not ( = ?auto_657479 ?auto_657481 ) ) ( not ( = ?auto_657479 ?auto_657482 ) ) ( not ( = ?auto_657479 ?auto_657483 ) ) ( not ( = ?auto_657479 ?auto_657484 ) ) ( not ( = ?auto_657479 ?auto_657485 ) ) ( not ( = ?auto_657479 ?auto_657486 ) ) ( not ( = ?auto_657479 ?auto_657491 ) ) ( not ( = ?auto_657480 ?auto_657481 ) ) ( not ( = ?auto_657480 ?auto_657482 ) ) ( not ( = ?auto_657480 ?auto_657483 ) ) ( not ( = ?auto_657480 ?auto_657484 ) ) ( not ( = ?auto_657480 ?auto_657485 ) ) ( not ( = ?auto_657480 ?auto_657486 ) ) ( not ( = ?auto_657480 ?auto_657491 ) ) ( not ( = ?auto_657481 ?auto_657482 ) ) ( not ( = ?auto_657481 ?auto_657483 ) ) ( not ( = ?auto_657481 ?auto_657484 ) ) ( not ( = ?auto_657481 ?auto_657485 ) ) ( not ( = ?auto_657481 ?auto_657486 ) ) ( not ( = ?auto_657481 ?auto_657491 ) ) ( not ( = ?auto_657482 ?auto_657483 ) ) ( not ( = ?auto_657482 ?auto_657484 ) ) ( not ( = ?auto_657482 ?auto_657485 ) ) ( not ( = ?auto_657482 ?auto_657486 ) ) ( not ( = ?auto_657482 ?auto_657491 ) ) ( not ( = ?auto_657483 ?auto_657484 ) ) ( not ( = ?auto_657483 ?auto_657485 ) ) ( not ( = ?auto_657483 ?auto_657486 ) ) ( not ( = ?auto_657483 ?auto_657491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657484 ?auto_657485 ?auto_657486 )
      ( MAKE-9CRATE-VERIFY ?auto_657477 ?auto_657478 ?auto_657479 ?auto_657480 ?auto_657481 ?auto_657482 ?auto_657483 ?auto_657484 ?auto_657485 ?auto_657486 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657586 - SURFACE
      ?auto_657587 - SURFACE
      ?auto_657588 - SURFACE
      ?auto_657589 - SURFACE
      ?auto_657590 - SURFACE
      ?auto_657591 - SURFACE
      ?auto_657592 - SURFACE
      ?auto_657593 - SURFACE
      ?auto_657594 - SURFACE
      ?auto_657595 - SURFACE
    )
    :vars
    (
      ?auto_657599 - HOIST
      ?auto_657596 - PLACE
      ?auto_657600 - PLACE
      ?auto_657601 - HOIST
      ?auto_657598 - SURFACE
      ?auto_657597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657599 ?auto_657596 ) ( IS-CRATE ?auto_657595 ) ( not ( = ?auto_657594 ?auto_657595 ) ) ( not ( = ?auto_657593 ?auto_657594 ) ) ( not ( = ?auto_657593 ?auto_657595 ) ) ( not ( = ?auto_657600 ?auto_657596 ) ) ( HOIST-AT ?auto_657601 ?auto_657600 ) ( not ( = ?auto_657599 ?auto_657601 ) ) ( AVAILABLE ?auto_657601 ) ( SURFACE-AT ?auto_657595 ?auto_657600 ) ( ON ?auto_657595 ?auto_657598 ) ( CLEAR ?auto_657595 ) ( not ( = ?auto_657594 ?auto_657598 ) ) ( not ( = ?auto_657595 ?auto_657598 ) ) ( not ( = ?auto_657593 ?auto_657598 ) ) ( TRUCK-AT ?auto_657597 ?auto_657596 ) ( SURFACE-AT ?auto_657593 ?auto_657596 ) ( CLEAR ?auto_657593 ) ( IS-CRATE ?auto_657594 ) ( AVAILABLE ?auto_657599 ) ( IN ?auto_657594 ?auto_657597 ) ( ON ?auto_657587 ?auto_657586 ) ( ON ?auto_657588 ?auto_657587 ) ( ON ?auto_657589 ?auto_657588 ) ( ON ?auto_657590 ?auto_657589 ) ( ON ?auto_657591 ?auto_657590 ) ( ON ?auto_657592 ?auto_657591 ) ( ON ?auto_657593 ?auto_657592 ) ( not ( = ?auto_657586 ?auto_657587 ) ) ( not ( = ?auto_657586 ?auto_657588 ) ) ( not ( = ?auto_657586 ?auto_657589 ) ) ( not ( = ?auto_657586 ?auto_657590 ) ) ( not ( = ?auto_657586 ?auto_657591 ) ) ( not ( = ?auto_657586 ?auto_657592 ) ) ( not ( = ?auto_657586 ?auto_657593 ) ) ( not ( = ?auto_657586 ?auto_657594 ) ) ( not ( = ?auto_657586 ?auto_657595 ) ) ( not ( = ?auto_657586 ?auto_657598 ) ) ( not ( = ?auto_657587 ?auto_657588 ) ) ( not ( = ?auto_657587 ?auto_657589 ) ) ( not ( = ?auto_657587 ?auto_657590 ) ) ( not ( = ?auto_657587 ?auto_657591 ) ) ( not ( = ?auto_657587 ?auto_657592 ) ) ( not ( = ?auto_657587 ?auto_657593 ) ) ( not ( = ?auto_657587 ?auto_657594 ) ) ( not ( = ?auto_657587 ?auto_657595 ) ) ( not ( = ?auto_657587 ?auto_657598 ) ) ( not ( = ?auto_657588 ?auto_657589 ) ) ( not ( = ?auto_657588 ?auto_657590 ) ) ( not ( = ?auto_657588 ?auto_657591 ) ) ( not ( = ?auto_657588 ?auto_657592 ) ) ( not ( = ?auto_657588 ?auto_657593 ) ) ( not ( = ?auto_657588 ?auto_657594 ) ) ( not ( = ?auto_657588 ?auto_657595 ) ) ( not ( = ?auto_657588 ?auto_657598 ) ) ( not ( = ?auto_657589 ?auto_657590 ) ) ( not ( = ?auto_657589 ?auto_657591 ) ) ( not ( = ?auto_657589 ?auto_657592 ) ) ( not ( = ?auto_657589 ?auto_657593 ) ) ( not ( = ?auto_657589 ?auto_657594 ) ) ( not ( = ?auto_657589 ?auto_657595 ) ) ( not ( = ?auto_657589 ?auto_657598 ) ) ( not ( = ?auto_657590 ?auto_657591 ) ) ( not ( = ?auto_657590 ?auto_657592 ) ) ( not ( = ?auto_657590 ?auto_657593 ) ) ( not ( = ?auto_657590 ?auto_657594 ) ) ( not ( = ?auto_657590 ?auto_657595 ) ) ( not ( = ?auto_657590 ?auto_657598 ) ) ( not ( = ?auto_657591 ?auto_657592 ) ) ( not ( = ?auto_657591 ?auto_657593 ) ) ( not ( = ?auto_657591 ?auto_657594 ) ) ( not ( = ?auto_657591 ?auto_657595 ) ) ( not ( = ?auto_657591 ?auto_657598 ) ) ( not ( = ?auto_657592 ?auto_657593 ) ) ( not ( = ?auto_657592 ?auto_657594 ) ) ( not ( = ?auto_657592 ?auto_657595 ) ) ( not ( = ?auto_657592 ?auto_657598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657593 ?auto_657594 ?auto_657595 )
      ( MAKE-9CRATE-VERIFY ?auto_657586 ?auto_657587 ?auto_657588 ?auto_657589 ?auto_657590 ?auto_657591 ?auto_657592 ?auto_657593 ?auto_657594 ?auto_657595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_661236 - SURFACE
      ?auto_661237 - SURFACE
    )
    :vars
    (
      ?auto_661241 - HOIST
      ?auto_661239 - PLACE
      ?auto_661242 - SURFACE
      ?auto_661244 - TRUCK
      ?auto_661238 - PLACE
      ?auto_661243 - HOIST
      ?auto_661240 - SURFACE
      ?auto_661245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_661241 ?auto_661239 ) ( SURFACE-AT ?auto_661236 ?auto_661239 ) ( CLEAR ?auto_661236 ) ( IS-CRATE ?auto_661237 ) ( not ( = ?auto_661236 ?auto_661237 ) ) ( AVAILABLE ?auto_661241 ) ( ON ?auto_661236 ?auto_661242 ) ( not ( = ?auto_661242 ?auto_661236 ) ) ( not ( = ?auto_661242 ?auto_661237 ) ) ( TRUCK-AT ?auto_661244 ?auto_661238 ) ( not ( = ?auto_661238 ?auto_661239 ) ) ( HOIST-AT ?auto_661243 ?auto_661238 ) ( not ( = ?auto_661241 ?auto_661243 ) ) ( SURFACE-AT ?auto_661237 ?auto_661238 ) ( ON ?auto_661237 ?auto_661240 ) ( CLEAR ?auto_661237 ) ( not ( = ?auto_661236 ?auto_661240 ) ) ( not ( = ?auto_661237 ?auto_661240 ) ) ( not ( = ?auto_661242 ?auto_661240 ) ) ( LIFTING ?auto_661243 ?auto_661245 ) ( IS-CRATE ?auto_661245 ) ( not ( = ?auto_661236 ?auto_661245 ) ) ( not ( = ?auto_661237 ?auto_661245 ) ) ( not ( = ?auto_661242 ?auto_661245 ) ) ( not ( = ?auto_661240 ?auto_661245 ) ) )
    :subtasks
    ( ( !LOAD ?auto_661243 ?auto_661245 ?auto_661244 ?auto_661238 )
      ( MAKE-1CRATE ?auto_661236 ?auto_661237 )
      ( MAKE-1CRATE-VERIFY ?auto_661236 ?auto_661237 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663139 - SURFACE
      ?auto_663140 - SURFACE
      ?auto_663141 - SURFACE
      ?auto_663142 - SURFACE
      ?auto_663143 - SURFACE
      ?auto_663144 - SURFACE
      ?auto_663145 - SURFACE
      ?auto_663146 - SURFACE
      ?auto_663147 - SURFACE
      ?auto_663148 - SURFACE
      ?auto_663149 - SURFACE
    )
    :vars
    (
      ?auto_663150 - HOIST
      ?auto_663151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663150 ?auto_663151 ) ( SURFACE-AT ?auto_663148 ?auto_663151 ) ( CLEAR ?auto_663148 ) ( LIFTING ?auto_663150 ?auto_663149 ) ( IS-CRATE ?auto_663149 ) ( not ( = ?auto_663148 ?auto_663149 ) ) ( ON ?auto_663140 ?auto_663139 ) ( ON ?auto_663141 ?auto_663140 ) ( ON ?auto_663142 ?auto_663141 ) ( ON ?auto_663143 ?auto_663142 ) ( ON ?auto_663144 ?auto_663143 ) ( ON ?auto_663145 ?auto_663144 ) ( ON ?auto_663146 ?auto_663145 ) ( ON ?auto_663147 ?auto_663146 ) ( ON ?auto_663148 ?auto_663147 ) ( not ( = ?auto_663139 ?auto_663140 ) ) ( not ( = ?auto_663139 ?auto_663141 ) ) ( not ( = ?auto_663139 ?auto_663142 ) ) ( not ( = ?auto_663139 ?auto_663143 ) ) ( not ( = ?auto_663139 ?auto_663144 ) ) ( not ( = ?auto_663139 ?auto_663145 ) ) ( not ( = ?auto_663139 ?auto_663146 ) ) ( not ( = ?auto_663139 ?auto_663147 ) ) ( not ( = ?auto_663139 ?auto_663148 ) ) ( not ( = ?auto_663139 ?auto_663149 ) ) ( not ( = ?auto_663140 ?auto_663141 ) ) ( not ( = ?auto_663140 ?auto_663142 ) ) ( not ( = ?auto_663140 ?auto_663143 ) ) ( not ( = ?auto_663140 ?auto_663144 ) ) ( not ( = ?auto_663140 ?auto_663145 ) ) ( not ( = ?auto_663140 ?auto_663146 ) ) ( not ( = ?auto_663140 ?auto_663147 ) ) ( not ( = ?auto_663140 ?auto_663148 ) ) ( not ( = ?auto_663140 ?auto_663149 ) ) ( not ( = ?auto_663141 ?auto_663142 ) ) ( not ( = ?auto_663141 ?auto_663143 ) ) ( not ( = ?auto_663141 ?auto_663144 ) ) ( not ( = ?auto_663141 ?auto_663145 ) ) ( not ( = ?auto_663141 ?auto_663146 ) ) ( not ( = ?auto_663141 ?auto_663147 ) ) ( not ( = ?auto_663141 ?auto_663148 ) ) ( not ( = ?auto_663141 ?auto_663149 ) ) ( not ( = ?auto_663142 ?auto_663143 ) ) ( not ( = ?auto_663142 ?auto_663144 ) ) ( not ( = ?auto_663142 ?auto_663145 ) ) ( not ( = ?auto_663142 ?auto_663146 ) ) ( not ( = ?auto_663142 ?auto_663147 ) ) ( not ( = ?auto_663142 ?auto_663148 ) ) ( not ( = ?auto_663142 ?auto_663149 ) ) ( not ( = ?auto_663143 ?auto_663144 ) ) ( not ( = ?auto_663143 ?auto_663145 ) ) ( not ( = ?auto_663143 ?auto_663146 ) ) ( not ( = ?auto_663143 ?auto_663147 ) ) ( not ( = ?auto_663143 ?auto_663148 ) ) ( not ( = ?auto_663143 ?auto_663149 ) ) ( not ( = ?auto_663144 ?auto_663145 ) ) ( not ( = ?auto_663144 ?auto_663146 ) ) ( not ( = ?auto_663144 ?auto_663147 ) ) ( not ( = ?auto_663144 ?auto_663148 ) ) ( not ( = ?auto_663144 ?auto_663149 ) ) ( not ( = ?auto_663145 ?auto_663146 ) ) ( not ( = ?auto_663145 ?auto_663147 ) ) ( not ( = ?auto_663145 ?auto_663148 ) ) ( not ( = ?auto_663145 ?auto_663149 ) ) ( not ( = ?auto_663146 ?auto_663147 ) ) ( not ( = ?auto_663146 ?auto_663148 ) ) ( not ( = ?auto_663146 ?auto_663149 ) ) ( not ( = ?auto_663147 ?auto_663148 ) ) ( not ( = ?auto_663147 ?auto_663149 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_663148 ?auto_663149 )
      ( MAKE-10CRATE-VERIFY ?auto_663139 ?auto_663140 ?auto_663141 ?auto_663142 ?auto_663143 ?auto_663144 ?auto_663145 ?auto_663146 ?auto_663147 ?auto_663148 ?auto_663149 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663233 - SURFACE
      ?auto_663234 - SURFACE
      ?auto_663235 - SURFACE
      ?auto_663236 - SURFACE
      ?auto_663237 - SURFACE
      ?auto_663238 - SURFACE
      ?auto_663239 - SURFACE
      ?auto_663240 - SURFACE
      ?auto_663241 - SURFACE
      ?auto_663242 - SURFACE
      ?auto_663243 - SURFACE
    )
    :vars
    (
      ?auto_663245 - HOIST
      ?auto_663246 - PLACE
      ?auto_663244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663245 ?auto_663246 ) ( SURFACE-AT ?auto_663242 ?auto_663246 ) ( CLEAR ?auto_663242 ) ( IS-CRATE ?auto_663243 ) ( not ( = ?auto_663242 ?auto_663243 ) ) ( TRUCK-AT ?auto_663244 ?auto_663246 ) ( AVAILABLE ?auto_663245 ) ( IN ?auto_663243 ?auto_663244 ) ( ON ?auto_663242 ?auto_663241 ) ( not ( = ?auto_663241 ?auto_663242 ) ) ( not ( = ?auto_663241 ?auto_663243 ) ) ( ON ?auto_663234 ?auto_663233 ) ( ON ?auto_663235 ?auto_663234 ) ( ON ?auto_663236 ?auto_663235 ) ( ON ?auto_663237 ?auto_663236 ) ( ON ?auto_663238 ?auto_663237 ) ( ON ?auto_663239 ?auto_663238 ) ( ON ?auto_663240 ?auto_663239 ) ( ON ?auto_663241 ?auto_663240 ) ( not ( = ?auto_663233 ?auto_663234 ) ) ( not ( = ?auto_663233 ?auto_663235 ) ) ( not ( = ?auto_663233 ?auto_663236 ) ) ( not ( = ?auto_663233 ?auto_663237 ) ) ( not ( = ?auto_663233 ?auto_663238 ) ) ( not ( = ?auto_663233 ?auto_663239 ) ) ( not ( = ?auto_663233 ?auto_663240 ) ) ( not ( = ?auto_663233 ?auto_663241 ) ) ( not ( = ?auto_663233 ?auto_663242 ) ) ( not ( = ?auto_663233 ?auto_663243 ) ) ( not ( = ?auto_663234 ?auto_663235 ) ) ( not ( = ?auto_663234 ?auto_663236 ) ) ( not ( = ?auto_663234 ?auto_663237 ) ) ( not ( = ?auto_663234 ?auto_663238 ) ) ( not ( = ?auto_663234 ?auto_663239 ) ) ( not ( = ?auto_663234 ?auto_663240 ) ) ( not ( = ?auto_663234 ?auto_663241 ) ) ( not ( = ?auto_663234 ?auto_663242 ) ) ( not ( = ?auto_663234 ?auto_663243 ) ) ( not ( = ?auto_663235 ?auto_663236 ) ) ( not ( = ?auto_663235 ?auto_663237 ) ) ( not ( = ?auto_663235 ?auto_663238 ) ) ( not ( = ?auto_663235 ?auto_663239 ) ) ( not ( = ?auto_663235 ?auto_663240 ) ) ( not ( = ?auto_663235 ?auto_663241 ) ) ( not ( = ?auto_663235 ?auto_663242 ) ) ( not ( = ?auto_663235 ?auto_663243 ) ) ( not ( = ?auto_663236 ?auto_663237 ) ) ( not ( = ?auto_663236 ?auto_663238 ) ) ( not ( = ?auto_663236 ?auto_663239 ) ) ( not ( = ?auto_663236 ?auto_663240 ) ) ( not ( = ?auto_663236 ?auto_663241 ) ) ( not ( = ?auto_663236 ?auto_663242 ) ) ( not ( = ?auto_663236 ?auto_663243 ) ) ( not ( = ?auto_663237 ?auto_663238 ) ) ( not ( = ?auto_663237 ?auto_663239 ) ) ( not ( = ?auto_663237 ?auto_663240 ) ) ( not ( = ?auto_663237 ?auto_663241 ) ) ( not ( = ?auto_663237 ?auto_663242 ) ) ( not ( = ?auto_663237 ?auto_663243 ) ) ( not ( = ?auto_663238 ?auto_663239 ) ) ( not ( = ?auto_663238 ?auto_663240 ) ) ( not ( = ?auto_663238 ?auto_663241 ) ) ( not ( = ?auto_663238 ?auto_663242 ) ) ( not ( = ?auto_663238 ?auto_663243 ) ) ( not ( = ?auto_663239 ?auto_663240 ) ) ( not ( = ?auto_663239 ?auto_663241 ) ) ( not ( = ?auto_663239 ?auto_663242 ) ) ( not ( = ?auto_663239 ?auto_663243 ) ) ( not ( = ?auto_663240 ?auto_663241 ) ) ( not ( = ?auto_663240 ?auto_663242 ) ) ( not ( = ?auto_663240 ?auto_663243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663241 ?auto_663242 ?auto_663243 )
      ( MAKE-10CRATE-VERIFY ?auto_663233 ?auto_663234 ?auto_663235 ?auto_663236 ?auto_663237 ?auto_663238 ?auto_663239 ?auto_663240 ?auto_663241 ?auto_663242 ?auto_663243 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663338 - SURFACE
      ?auto_663339 - SURFACE
      ?auto_663340 - SURFACE
      ?auto_663341 - SURFACE
      ?auto_663342 - SURFACE
      ?auto_663343 - SURFACE
      ?auto_663344 - SURFACE
      ?auto_663345 - SURFACE
      ?auto_663346 - SURFACE
      ?auto_663347 - SURFACE
      ?auto_663348 - SURFACE
    )
    :vars
    (
      ?auto_663349 - HOIST
      ?auto_663350 - PLACE
      ?auto_663351 - TRUCK
      ?auto_663352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663349 ?auto_663350 ) ( SURFACE-AT ?auto_663347 ?auto_663350 ) ( CLEAR ?auto_663347 ) ( IS-CRATE ?auto_663348 ) ( not ( = ?auto_663347 ?auto_663348 ) ) ( AVAILABLE ?auto_663349 ) ( IN ?auto_663348 ?auto_663351 ) ( ON ?auto_663347 ?auto_663346 ) ( not ( = ?auto_663346 ?auto_663347 ) ) ( not ( = ?auto_663346 ?auto_663348 ) ) ( TRUCK-AT ?auto_663351 ?auto_663352 ) ( not ( = ?auto_663352 ?auto_663350 ) ) ( ON ?auto_663339 ?auto_663338 ) ( ON ?auto_663340 ?auto_663339 ) ( ON ?auto_663341 ?auto_663340 ) ( ON ?auto_663342 ?auto_663341 ) ( ON ?auto_663343 ?auto_663342 ) ( ON ?auto_663344 ?auto_663343 ) ( ON ?auto_663345 ?auto_663344 ) ( ON ?auto_663346 ?auto_663345 ) ( not ( = ?auto_663338 ?auto_663339 ) ) ( not ( = ?auto_663338 ?auto_663340 ) ) ( not ( = ?auto_663338 ?auto_663341 ) ) ( not ( = ?auto_663338 ?auto_663342 ) ) ( not ( = ?auto_663338 ?auto_663343 ) ) ( not ( = ?auto_663338 ?auto_663344 ) ) ( not ( = ?auto_663338 ?auto_663345 ) ) ( not ( = ?auto_663338 ?auto_663346 ) ) ( not ( = ?auto_663338 ?auto_663347 ) ) ( not ( = ?auto_663338 ?auto_663348 ) ) ( not ( = ?auto_663339 ?auto_663340 ) ) ( not ( = ?auto_663339 ?auto_663341 ) ) ( not ( = ?auto_663339 ?auto_663342 ) ) ( not ( = ?auto_663339 ?auto_663343 ) ) ( not ( = ?auto_663339 ?auto_663344 ) ) ( not ( = ?auto_663339 ?auto_663345 ) ) ( not ( = ?auto_663339 ?auto_663346 ) ) ( not ( = ?auto_663339 ?auto_663347 ) ) ( not ( = ?auto_663339 ?auto_663348 ) ) ( not ( = ?auto_663340 ?auto_663341 ) ) ( not ( = ?auto_663340 ?auto_663342 ) ) ( not ( = ?auto_663340 ?auto_663343 ) ) ( not ( = ?auto_663340 ?auto_663344 ) ) ( not ( = ?auto_663340 ?auto_663345 ) ) ( not ( = ?auto_663340 ?auto_663346 ) ) ( not ( = ?auto_663340 ?auto_663347 ) ) ( not ( = ?auto_663340 ?auto_663348 ) ) ( not ( = ?auto_663341 ?auto_663342 ) ) ( not ( = ?auto_663341 ?auto_663343 ) ) ( not ( = ?auto_663341 ?auto_663344 ) ) ( not ( = ?auto_663341 ?auto_663345 ) ) ( not ( = ?auto_663341 ?auto_663346 ) ) ( not ( = ?auto_663341 ?auto_663347 ) ) ( not ( = ?auto_663341 ?auto_663348 ) ) ( not ( = ?auto_663342 ?auto_663343 ) ) ( not ( = ?auto_663342 ?auto_663344 ) ) ( not ( = ?auto_663342 ?auto_663345 ) ) ( not ( = ?auto_663342 ?auto_663346 ) ) ( not ( = ?auto_663342 ?auto_663347 ) ) ( not ( = ?auto_663342 ?auto_663348 ) ) ( not ( = ?auto_663343 ?auto_663344 ) ) ( not ( = ?auto_663343 ?auto_663345 ) ) ( not ( = ?auto_663343 ?auto_663346 ) ) ( not ( = ?auto_663343 ?auto_663347 ) ) ( not ( = ?auto_663343 ?auto_663348 ) ) ( not ( = ?auto_663344 ?auto_663345 ) ) ( not ( = ?auto_663344 ?auto_663346 ) ) ( not ( = ?auto_663344 ?auto_663347 ) ) ( not ( = ?auto_663344 ?auto_663348 ) ) ( not ( = ?auto_663345 ?auto_663346 ) ) ( not ( = ?auto_663345 ?auto_663347 ) ) ( not ( = ?auto_663345 ?auto_663348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663346 ?auto_663347 ?auto_663348 )
      ( MAKE-10CRATE-VERIFY ?auto_663338 ?auto_663339 ?auto_663340 ?auto_663341 ?auto_663342 ?auto_663343 ?auto_663344 ?auto_663345 ?auto_663346 ?auto_663347 ?auto_663348 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663453 - SURFACE
      ?auto_663454 - SURFACE
      ?auto_663455 - SURFACE
      ?auto_663456 - SURFACE
      ?auto_663457 - SURFACE
      ?auto_663458 - SURFACE
      ?auto_663459 - SURFACE
      ?auto_663460 - SURFACE
      ?auto_663461 - SURFACE
      ?auto_663462 - SURFACE
      ?auto_663463 - SURFACE
    )
    :vars
    (
      ?auto_663468 - HOIST
      ?auto_663467 - PLACE
      ?auto_663465 - TRUCK
      ?auto_663466 - PLACE
      ?auto_663464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_663468 ?auto_663467 ) ( SURFACE-AT ?auto_663462 ?auto_663467 ) ( CLEAR ?auto_663462 ) ( IS-CRATE ?auto_663463 ) ( not ( = ?auto_663462 ?auto_663463 ) ) ( AVAILABLE ?auto_663468 ) ( ON ?auto_663462 ?auto_663461 ) ( not ( = ?auto_663461 ?auto_663462 ) ) ( not ( = ?auto_663461 ?auto_663463 ) ) ( TRUCK-AT ?auto_663465 ?auto_663466 ) ( not ( = ?auto_663466 ?auto_663467 ) ) ( HOIST-AT ?auto_663464 ?auto_663466 ) ( LIFTING ?auto_663464 ?auto_663463 ) ( not ( = ?auto_663468 ?auto_663464 ) ) ( ON ?auto_663454 ?auto_663453 ) ( ON ?auto_663455 ?auto_663454 ) ( ON ?auto_663456 ?auto_663455 ) ( ON ?auto_663457 ?auto_663456 ) ( ON ?auto_663458 ?auto_663457 ) ( ON ?auto_663459 ?auto_663458 ) ( ON ?auto_663460 ?auto_663459 ) ( ON ?auto_663461 ?auto_663460 ) ( not ( = ?auto_663453 ?auto_663454 ) ) ( not ( = ?auto_663453 ?auto_663455 ) ) ( not ( = ?auto_663453 ?auto_663456 ) ) ( not ( = ?auto_663453 ?auto_663457 ) ) ( not ( = ?auto_663453 ?auto_663458 ) ) ( not ( = ?auto_663453 ?auto_663459 ) ) ( not ( = ?auto_663453 ?auto_663460 ) ) ( not ( = ?auto_663453 ?auto_663461 ) ) ( not ( = ?auto_663453 ?auto_663462 ) ) ( not ( = ?auto_663453 ?auto_663463 ) ) ( not ( = ?auto_663454 ?auto_663455 ) ) ( not ( = ?auto_663454 ?auto_663456 ) ) ( not ( = ?auto_663454 ?auto_663457 ) ) ( not ( = ?auto_663454 ?auto_663458 ) ) ( not ( = ?auto_663454 ?auto_663459 ) ) ( not ( = ?auto_663454 ?auto_663460 ) ) ( not ( = ?auto_663454 ?auto_663461 ) ) ( not ( = ?auto_663454 ?auto_663462 ) ) ( not ( = ?auto_663454 ?auto_663463 ) ) ( not ( = ?auto_663455 ?auto_663456 ) ) ( not ( = ?auto_663455 ?auto_663457 ) ) ( not ( = ?auto_663455 ?auto_663458 ) ) ( not ( = ?auto_663455 ?auto_663459 ) ) ( not ( = ?auto_663455 ?auto_663460 ) ) ( not ( = ?auto_663455 ?auto_663461 ) ) ( not ( = ?auto_663455 ?auto_663462 ) ) ( not ( = ?auto_663455 ?auto_663463 ) ) ( not ( = ?auto_663456 ?auto_663457 ) ) ( not ( = ?auto_663456 ?auto_663458 ) ) ( not ( = ?auto_663456 ?auto_663459 ) ) ( not ( = ?auto_663456 ?auto_663460 ) ) ( not ( = ?auto_663456 ?auto_663461 ) ) ( not ( = ?auto_663456 ?auto_663462 ) ) ( not ( = ?auto_663456 ?auto_663463 ) ) ( not ( = ?auto_663457 ?auto_663458 ) ) ( not ( = ?auto_663457 ?auto_663459 ) ) ( not ( = ?auto_663457 ?auto_663460 ) ) ( not ( = ?auto_663457 ?auto_663461 ) ) ( not ( = ?auto_663457 ?auto_663462 ) ) ( not ( = ?auto_663457 ?auto_663463 ) ) ( not ( = ?auto_663458 ?auto_663459 ) ) ( not ( = ?auto_663458 ?auto_663460 ) ) ( not ( = ?auto_663458 ?auto_663461 ) ) ( not ( = ?auto_663458 ?auto_663462 ) ) ( not ( = ?auto_663458 ?auto_663463 ) ) ( not ( = ?auto_663459 ?auto_663460 ) ) ( not ( = ?auto_663459 ?auto_663461 ) ) ( not ( = ?auto_663459 ?auto_663462 ) ) ( not ( = ?auto_663459 ?auto_663463 ) ) ( not ( = ?auto_663460 ?auto_663461 ) ) ( not ( = ?auto_663460 ?auto_663462 ) ) ( not ( = ?auto_663460 ?auto_663463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663461 ?auto_663462 ?auto_663463 )
      ( MAKE-10CRATE-VERIFY ?auto_663453 ?auto_663454 ?auto_663455 ?auto_663456 ?auto_663457 ?auto_663458 ?auto_663459 ?auto_663460 ?auto_663461 ?auto_663462 ?auto_663463 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663578 - SURFACE
      ?auto_663579 - SURFACE
      ?auto_663580 - SURFACE
      ?auto_663581 - SURFACE
      ?auto_663582 - SURFACE
      ?auto_663583 - SURFACE
      ?auto_663584 - SURFACE
      ?auto_663585 - SURFACE
      ?auto_663586 - SURFACE
      ?auto_663587 - SURFACE
      ?auto_663588 - SURFACE
    )
    :vars
    (
      ?auto_663591 - HOIST
      ?auto_663590 - PLACE
      ?auto_663592 - TRUCK
      ?auto_663589 - PLACE
      ?auto_663594 - HOIST
      ?auto_663593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663591 ?auto_663590 ) ( SURFACE-AT ?auto_663587 ?auto_663590 ) ( CLEAR ?auto_663587 ) ( IS-CRATE ?auto_663588 ) ( not ( = ?auto_663587 ?auto_663588 ) ) ( AVAILABLE ?auto_663591 ) ( ON ?auto_663587 ?auto_663586 ) ( not ( = ?auto_663586 ?auto_663587 ) ) ( not ( = ?auto_663586 ?auto_663588 ) ) ( TRUCK-AT ?auto_663592 ?auto_663589 ) ( not ( = ?auto_663589 ?auto_663590 ) ) ( HOIST-AT ?auto_663594 ?auto_663589 ) ( not ( = ?auto_663591 ?auto_663594 ) ) ( AVAILABLE ?auto_663594 ) ( SURFACE-AT ?auto_663588 ?auto_663589 ) ( ON ?auto_663588 ?auto_663593 ) ( CLEAR ?auto_663588 ) ( not ( = ?auto_663587 ?auto_663593 ) ) ( not ( = ?auto_663588 ?auto_663593 ) ) ( not ( = ?auto_663586 ?auto_663593 ) ) ( ON ?auto_663579 ?auto_663578 ) ( ON ?auto_663580 ?auto_663579 ) ( ON ?auto_663581 ?auto_663580 ) ( ON ?auto_663582 ?auto_663581 ) ( ON ?auto_663583 ?auto_663582 ) ( ON ?auto_663584 ?auto_663583 ) ( ON ?auto_663585 ?auto_663584 ) ( ON ?auto_663586 ?auto_663585 ) ( not ( = ?auto_663578 ?auto_663579 ) ) ( not ( = ?auto_663578 ?auto_663580 ) ) ( not ( = ?auto_663578 ?auto_663581 ) ) ( not ( = ?auto_663578 ?auto_663582 ) ) ( not ( = ?auto_663578 ?auto_663583 ) ) ( not ( = ?auto_663578 ?auto_663584 ) ) ( not ( = ?auto_663578 ?auto_663585 ) ) ( not ( = ?auto_663578 ?auto_663586 ) ) ( not ( = ?auto_663578 ?auto_663587 ) ) ( not ( = ?auto_663578 ?auto_663588 ) ) ( not ( = ?auto_663578 ?auto_663593 ) ) ( not ( = ?auto_663579 ?auto_663580 ) ) ( not ( = ?auto_663579 ?auto_663581 ) ) ( not ( = ?auto_663579 ?auto_663582 ) ) ( not ( = ?auto_663579 ?auto_663583 ) ) ( not ( = ?auto_663579 ?auto_663584 ) ) ( not ( = ?auto_663579 ?auto_663585 ) ) ( not ( = ?auto_663579 ?auto_663586 ) ) ( not ( = ?auto_663579 ?auto_663587 ) ) ( not ( = ?auto_663579 ?auto_663588 ) ) ( not ( = ?auto_663579 ?auto_663593 ) ) ( not ( = ?auto_663580 ?auto_663581 ) ) ( not ( = ?auto_663580 ?auto_663582 ) ) ( not ( = ?auto_663580 ?auto_663583 ) ) ( not ( = ?auto_663580 ?auto_663584 ) ) ( not ( = ?auto_663580 ?auto_663585 ) ) ( not ( = ?auto_663580 ?auto_663586 ) ) ( not ( = ?auto_663580 ?auto_663587 ) ) ( not ( = ?auto_663580 ?auto_663588 ) ) ( not ( = ?auto_663580 ?auto_663593 ) ) ( not ( = ?auto_663581 ?auto_663582 ) ) ( not ( = ?auto_663581 ?auto_663583 ) ) ( not ( = ?auto_663581 ?auto_663584 ) ) ( not ( = ?auto_663581 ?auto_663585 ) ) ( not ( = ?auto_663581 ?auto_663586 ) ) ( not ( = ?auto_663581 ?auto_663587 ) ) ( not ( = ?auto_663581 ?auto_663588 ) ) ( not ( = ?auto_663581 ?auto_663593 ) ) ( not ( = ?auto_663582 ?auto_663583 ) ) ( not ( = ?auto_663582 ?auto_663584 ) ) ( not ( = ?auto_663582 ?auto_663585 ) ) ( not ( = ?auto_663582 ?auto_663586 ) ) ( not ( = ?auto_663582 ?auto_663587 ) ) ( not ( = ?auto_663582 ?auto_663588 ) ) ( not ( = ?auto_663582 ?auto_663593 ) ) ( not ( = ?auto_663583 ?auto_663584 ) ) ( not ( = ?auto_663583 ?auto_663585 ) ) ( not ( = ?auto_663583 ?auto_663586 ) ) ( not ( = ?auto_663583 ?auto_663587 ) ) ( not ( = ?auto_663583 ?auto_663588 ) ) ( not ( = ?auto_663583 ?auto_663593 ) ) ( not ( = ?auto_663584 ?auto_663585 ) ) ( not ( = ?auto_663584 ?auto_663586 ) ) ( not ( = ?auto_663584 ?auto_663587 ) ) ( not ( = ?auto_663584 ?auto_663588 ) ) ( not ( = ?auto_663584 ?auto_663593 ) ) ( not ( = ?auto_663585 ?auto_663586 ) ) ( not ( = ?auto_663585 ?auto_663587 ) ) ( not ( = ?auto_663585 ?auto_663588 ) ) ( not ( = ?auto_663585 ?auto_663593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663586 ?auto_663587 ?auto_663588 )
      ( MAKE-10CRATE-VERIFY ?auto_663578 ?auto_663579 ?auto_663580 ?auto_663581 ?auto_663582 ?auto_663583 ?auto_663584 ?auto_663585 ?auto_663586 ?auto_663587 ?auto_663588 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663704 - SURFACE
      ?auto_663705 - SURFACE
      ?auto_663706 - SURFACE
      ?auto_663707 - SURFACE
      ?auto_663708 - SURFACE
      ?auto_663709 - SURFACE
      ?auto_663710 - SURFACE
      ?auto_663711 - SURFACE
      ?auto_663712 - SURFACE
      ?auto_663713 - SURFACE
      ?auto_663714 - SURFACE
    )
    :vars
    (
      ?auto_663715 - HOIST
      ?auto_663720 - PLACE
      ?auto_663716 - PLACE
      ?auto_663719 - HOIST
      ?auto_663717 - SURFACE
      ?auto_663718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663715 ?auto_663720 ) ( SURFACE-AT ?auto_663713 ?auto_663720 ) ( CLEAR ?auto_663713 ) ( IS-CRATE ?auto_663714 ) ( not ( = ?auto_663713 ?auto_663714 ) ) ( AVAILABLE ?auto_663715 ) ( ON ?auto_663713 ?auto_663712 ) ( not ( = ?auto_663712 ?auto_663713 ) ) ( not ( = ?auto_663712 ?auto_663714 ) ) ( not ( = ?auto_663716 ?auto_663720 ) ) ( HOIST-AT ?auto_663719 ?auto_663716 ) ( not ( = ?auto_663715 ?auto_663719 ) ) ( AVAILABLE ?auto_663719 ) ( SURFACE-AT ?auto_663714 ?auto_663716 ) ( ON ?auto_663714 ?auto_663717 ) ( CLEAR ?auto_663714 ) ( not ( = ?auto_663713 ?auto_663717 ) ) ( not ( = ?auto_663714 ?auto_663717 ) ) ( not ( = ?auto_663712 ?auto_663717 ) ) ( TRUCK-AT ?auto_663718 ?auto_663720 ) ( ON ?auto_663705 ?auto_663704 ) ( ON ?auto_663706 ?auto_663705 ) ( ON ?auto_663707 ?auto_663706 ) ( ON ?auto_663708 ?auto_663707 ) ( ON ?auto_663709 ?auto_663708 ) ( ON ?auto_663710 ?auto_663709 ) ( ON ?auto_663711 ?auto_663710 ) ( ON ?auto_663712 ?auto_663711 ) ( not ( = ?auto_663704 ?auto_663705 ) ) ( not ( = ?auto_663704 ?auto_663706 ) ) ( not ( = ?auto_663704 ?auto_663707 ) ) ( not ( = ?auto_663704 ?auto_663708 ) ) ( not ( = ?auto_663704 ?auto_663709 ) ) ( not ( = ?auto_663704 ?auto_663710 ) ) ( not ( = ?auto_663704 ?auto_663711 ) ) ( not ( = ?auto_663704 ?auto_663712 ) ) ( not ( = ?auto_663704 ?auto_663713 ) ) ( not ( = ?auto_663704 ?auto_663714 ) ) ( not ( = ?auto_663704 ?auto_663717 ) ) ( not ( = ?auto_663705 ?auto_663706 ) ) ( not ( = ?auto_663705 ?auto_663707 ) ) ( not ( = ?auto_663705 ?auto_663708 ) ) ( not ( = ?auto_663705 ?auto_663709 ) ) ( not ( = ?auto_663705 ?auto_663710 ) ) ( not ( = ?auto_663705 ?auto_663711 ) ) ( not ( = ?auto_663705 ?auto_663712 ) ) ( not ( = ?auto_663705 ?auto_663713 ) ) ( not ( = ?auto_663705 ?auto_663714 ) ) ( not ( = ?auto_663705 ?auto_663717 ) ) ( not ( = ?auto_663706 ?auto_663707 ) ) ( not ( = ?auto_663706 ?auto_663708 ) ) ( not ( = ?auto_663706 ?auto_663709 ) ) ( not ( = ?auto_663706 ?auto_663710 ) ) ( not ( = ?auto_663706 ?auto_663711 ) ) ( not ( = ?auto_663706 ?auto_663712 ) ) ( not ( = ?auto_663706 ?auto_663713 ) ) ( not ( = ?auto_663706 ?auto_663714 ) ) ( not ( = ?auto_663706 ?auto_663717 ) ) ( not ( = ?auto_663707 ?auto_663708 ) ) ( not ( = ?auto_663707 ?auto_663709 ) ) ( not ( = ?auto_663707 ?auto_663710 ) ) ( not ( = ?auto_663707 ?auto_663711 ) ) ( not ( = ?auto_663707 ?auto_663712 ) ) ( not ( = ?auto_663707 ?auto_663713 ) ) ( not ( = ?auto_663707 ?auto_663714 ) ) ( not ( = ?auto_663707 ?auto_663717 ) ) ( not ( = ?auto_663708 ?auto_663709 ) ) ( not ( = ?auto_663708 ?auto_663710 ) ) ( not ( = ?auto_663708 ?auto_663711 ) ) ( not ( = ?auto_663708 ?auto_663712 ) ) ( not ( = ?auto_663708 ?auto_663713 ) ) ( not ( = ?auto_663708 ?auto_663714 ) ) ( not ( = ?auto_663708 ?auto_663717 ) ) ( not ( = ?auto_663709 ?auto_663710 ) ) ( not ( = ?auto_663709 ?auto_663711 ) ) ( not ( = ?auto_663709 ?auto_663712 ) ) ( not ( = ?auto_663709 ?auto_663713 ) ) ( not ( = ?auto_663709 ?auto_663714 ) ) ( not ( = ?auto_663709 ?auto_663717 ) ) ( not ( = ?auto_663710 ?auto_663711 ) ) ( not ( = ?auto_663710 ?auto_663712 ) ) ( not ( = ?auto_663710 ?auto_663713 ) ) ( not ( = ?auto_663710 ?auto_663714 ) ) ( not ( = ?auto_663710 ?auto_663717 ) ) ( not ( = ?auto_663711 ?auto_663712 ) ) ( not ( = ?auto_663711 ?auto_663713 ) ) ( not ( = ?auto_663711 ?auto_663714 ) ) ( not ( = ?auto_663711 ?auto_663717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663712 ?auto_663713 ?auto_663714 )
      ( MAKE-10CRATE-VERIFY ?auto_663704 ?auto_663705 ?auto_663706 ?auto_663707 ?auto_663708 ?auto_663709 ?auto_663710 ?auto_663711 ?auto_663712 ?auto_663713 ?auto_663714 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663830 - SURFACE
      ?auto_663831 - SURFACE
      ?auto_663832 - SURFACE
      ?auto_663833 - SURFACE
      ?auto_663834 - SURFACE
      ?auto_663835 - SURFACE
      ?auto_663836 - SURFACE
      ?auto_663837 - SURFACE
      ?auto_663838 - SURFACE
      ?auto_663839 - SURFACE
      ?auto_663840 - SURFACE
    )
    :vars
    (
      ?auto_663841 - HOIST
      ?auto_663845 - PLACE
      ?auto_663843 - PLACE
      ?auto_663842 - HOIST
      ?auto_663846 - SURFACE
      ?auto_663844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663841 ?auto_663845 ) ( IS-CRATE ?auto_663840 ) ( not ( = ?auto_663839 ?auto_663840 ) ) ( not ( = ?auto_663838 ?auto_663839 ) ) ( not ( = ?auto_663838 ?auto_663840 ) ) ( not ( = ?auto_663843 ?auto_663845 ) ) ( HOIST-AT ?auto_663842 ?auto_663843 ) ( not ( = ?auto_663841 ?auto_663842 ) ) ( AVAILABLE ?auto_663842 ) ( SURFACE-AT ?auto_663840 ?auto_663843 ) ( ON ?auto_663840 ?auto_663846 ) ( CLEAR ?auto_663840 ) ( not ( = ?auto_663839 ?auto_663846 ) ) ( not ( = ?auto_663840 ?auto_663846 ) ) ( not ( = ?auto_663838 ?auto_663846 ) ) ( TRUCK-AT ?auto_663844 ?auto_663845 ) ( SURFACE-AT ?auto_663838 ?auto_663845 ) ( CLEAR ?auto_663838 ) ( LIFTING ?auto_663841 ?auto_663839 ) ( IS-CRATE ?auto_663839 ) ( ON ?auto_663831 ?auto_663830 ) ( ON ?auto_663832 ?auto_663831 ) ( ON ?auto_663833 ?auto_663832 ) ( ON ?auto_663834 ?auto_663833 ) ( ON ?auto_663835 ?auto_663834 ) ( ON ?auto_663836 ?auto_663835 ) ( ON ?auto_663837 ?auto_663836 ) ( ON ?auto_663838 ?auto_663837 ) ( not ( = ?auto_663830 ?auto_663831 ) ) ( not ( = ?auto_663830 ?auto_663832 ) ) ( not ( = ?auto_663830 ?auto_663833 ) ) ( not ( = ?auto_663830 ?auto_663834 ) ) ( not ( = ?auto_663830 ?auto_663835 ) ) ( not ( = ?auto_663830 ?auto_663836 ) ) ( not ( = ?auto_663830 ?auto_663837 ) ) ( not ( = ?auto_663830 ?auto_663838 ) ) ( not ( = ?auto_663830 ?auto_663839 ) ) ( not ( = ?auto_663830 ?auto_663840 ) ) ( not ( = ?auto_663830 ?auto_663846 ) ) ( not ( = ?auto_663831 ?auto_663832 ) ) ( not ( = ?auto_663831 ?auto_663833 ) ) ( not ( = ?auto_663831 ?auto_663834 ) ) ( not ( = ?auto_663831 ?auto_663835 ) ) ( not ( = ?auto_663831 ?auto_663836 ) ) ( not ( = ?auto_663831 ?auto_663837 ) ) ( not ( = ?auto_663831 ?auto_663838 ) ) ( not ( = ?auto_663831 ?auto_663839 ) ) ( not ( = ?auto_663831 ?auto_663840 ) ) ( not ( = ?auto_663831 ?auto_663846 ) ) ( not ( = ?auto_663832 ?auto_663833 ) ) ( not ( = ?auto_663832 ?auto_663834 ) ) ( not ( = ?auto_663832 ?auto_663835 ) ) ( not ( = ?auto_663832 ?auto_663836 ) ) ( not ( = ?auto_663832 ?auto_663837 ) ) ( not ( = ?auto_663832 ?auto_663838 ) ) ( not ( = ?auto_663832 ?auto_663839 ) ) ( not ( = ?auto_663832 ?auto_663840 ) ) ( not ( = ?auto_663832 ?auto_663846 ) ) ( not ( = ?auto_663833 ?auto_663834 ) ) ( not ( = ?auto_663833 ?auto_663835 ) ) ( not ( = ?auto_663833 ?auto_663836 ) ) ( not ( = ?auto_663833 ?auto_663837 ) ) ( not ( = ?auto_663833 ?auto_663838 ) ) ( not ( = ?auto_663833 ?auto_663839 ) ) ( not ( = ?auto_663833 ?auto_663840 ) ) ( not ( = ?auto_663833 ?auto_663846 ) ) ( not ( = ?auto_663834 ?auto_663835 ) ) ( not ( = ?auto_663834 ?auto_663836 ) ) ( not ( = ?auto_663834 ?auto_663837 ) ) ( not ( = ?auto_663834 ?auto_663838 ) ) ( not ( = ?auto_663834 ?auto_663839 ) ) ( not ( = ?auto_663834 ?auto_663840 ) ) ( not ( = ?auto_663834 ?auto_663846 ) ) ( not ( = ?auto_663835 ?auto_663836 ) ) ( not ( = ?auto_663835 ?auto_663837 ) ) ( not ( = ?auto_663835 ?auto_663838 ) ) ( not ( = ?auto_663835 ?auto_663839 ) ) ( not ( = ?auto_663835 ?auto_663840 ) ) ( not ( = ?auto_663835 ?auto_663846 ) ) ( not ( = ?auto_663836 ?auto_663837 ) ) ( not ( = ?auto_663836 ?auto_663838 ) ) ( not ( = ?auto_663836 ?auto_663839 ) ) ( not ( = ?auto_663836 ?auto_663840 ) ) ( not ( = ?auto_663836 ?auto_663846 ) ) ( not ( = ?auto_663837 ?auto_663838 ) ) ( not ( = ?auto_663837 ?auto_663839 ) ) ( not ( = ?auto_663837 ?auto_663840 ) ) ( not ( = ?auto_663837 ?auto_663846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663838 ?auto_663839 ?auto_663840 )
      ( MAKE-10CRATE-VERIFY ?auto_663830 ?auto_663831 ?auto_663832 ?auto_663833 ?auto_663834 ?auto_663835 ?auto_663836 ?auto_663837 ?auto_663838 ?auto_663839 ?auto_663840 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663956 - SURFACE
      ?auto_663957 - SURFACE
      ?auto_663958 - SURFACE
      ?auto_663959 - SURFACE
      ?auto_663960 - SURFACE
      ?auto_663961 - SURFACE
      ?auto_663962 - SURFACE
      ?auto_663963 - SURFACE
      ?auto_663964 - SURFACE
      ?auto_663965 - SURFACE
      ?auto_663966 - SURFACE
    )
    :vars
    (
      ?auto_663970 - HOIST
      ?auto_663967 - PLACE
      ?auto_663969 - PLACE
      ?auto_663968 - HOIST
      ?auto_663972 - SURFACE
      ?auto_663971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663970 ?auto_663967 ) ( IS-CRATE ?auto_663966 ) ( not ( = ?auto_663965 ?auto_663966 ) ) ( not ( = ?auto_663964 ?auto_663965 ) ) ( not ( = ?auto_663964 ?auto_663966 ) ) ( not ( = ?auto_663969 ?auto_663967 ) ) ( HOIST-AT ?auto_663968 ?auto_663969 ) ( not ( = ?auto_663970 ?auto_663968 ) ) ( AVAILABLE ?auto_663968 ) ( SURFACE-AT ?auto_663966 ?auto_663969 ) ( ON ?auto_663966 ?auto_663972 ) ( CLEAR ?auto_663966 ) ( not ( = ?auto_663965 ?auto_663972 ) ) ( not ( = ?auto_663966 ?auto_663972 ) ) ( not ( = ?auto_663964 ?auto_663972 ) ) ( TRUCK-AT ?auto_663971 ?auto_663967 ) ( SURFACE-AT ?auto_663964 ?auto_663967 ) ( CLEAR ?auto_663964 ) ( IS-CRATE ?auto_663965 ) ( AVAILABLE ?auto_663970 ) ( IN ?auto_663965 ?auto_663971 ) ( ON ?auto_663957 ?auto_663956 ) ( ON ?auto_663958 ?auto_663957 ) ( ON ?auto_663959 ?auto_663958 ) ( ON ?auto_663960 ?auto_663959 ) ( ON ?auto_663961 ?auto_663960 ) ( ON ?auto_663962 ?auto_663961 ) ( ON ?auto_663963 ?auto_663962 ) ( ON ?auto_663964 ?auto_663963 ) ( not ( = ?auto_663956 ?auto_663957 ) ) ( not ( = ?auto_663956 ?auto_663958 ) ) ( not ( = ?auto_663956 ?auto_663959 ) ) ( not ( = ?auto_663956 ?auto_663960 ) ) ( not ( = ?auto_663956 ?auto_663961 ) ) ( not ( = ?auto_663956 ?auto_663962 ) ) ( not ( = ?auto_663956 ?auto_663963 ) ) ( not ( = ?auto_663956 ?auto_663964 ) ) ( not ( = ?auto_663956 ?auto_663965 ) ) ( not ( = ?auto_663956 ?auto_663966 ) ) ( not ( = ?auto_663956 ?auto_663972 ) ) ( not ( = ?auto_663957 ?auto_663958 ) ) ( not ( = ?auto_663957 ?auto_663959 ) ) ( not ( = ?auto_663957 ?auto_663960 ) ) ( not ( = ?auto_663957 ?auto_663961 ) ) ( not ( = ?auto_663957 ?auto_663962 ) ) ( not ( = ?auto_663957 ?auto_663963 ) ) ( not ( = ?auto_663957 ?auto_663964 ) ) ( not ( = ?auto_663957 ?auto_663965 ) ) ( not ( = ?auto_663957 ?auto_663966 ) ) ( not ( = ?auto_663957 ?auto_663972 ) ) ( not ( = ?auto_663958 ?auto_663959 ) ) ( not ( = ?auto_663958 ?auto_663960 ) ) ( not ( = ?auto_663958 ?auto_663961 ) ) ( not ( = ?auto_663958 ?auto_663962 ) ) ( not ( = ?auto_663958 ?auto_663963 ) ) ( not ( = ?auto_663958 ?auto_663964 ) ) ( not ( = ?auto_663958 ?auto_663965 ) ) ( not ( = ?auto_663958 ?auto_663966 ) ) ( not ( = ?auto_663958 ?auto_663972 ) ) ( not ( = ?auto_663959 ?auto_663960 ) ) ( not ( = ?auto_663959 ?auto_663961 ) ) ( not ( = ?auto_663959 ?auto_663962 ) ) ( not ( = ?auto_663959 ?auto_663963 ) ) ( not ( = ?auto_663959 ?auto_663964 ) ) ( not ( = ?auto_663959 ?auto_663965 ) ) ( not ( = ?auto_663959 ?auto_663966 ) ) ( not ( = ?auto_663959 ?auto_663972 ) ) ( not ( = ?auto_663960 ?auto_663961 ) ) ( not ( = ?auto_663960 ?auto_663962 ) ) ( not ( = ?auto_663960 ?auto_663963 ) ) ( not ( = ?auto_663960 ?auto_663964 ) ) ( not ( = ?auto_663960 ?auto_663965 ) ) ( not ( = ?auto_663960 ?auto_663966 ) ) ( not ( = ?auto_663960 ?auto_663972 ) ) ( not ( = ?auto_663961 ?auto_663962 ) ) ( not ( = ?auto_663961 ?auto_663963 ) ) ( not ( = ?auto_663961 ?auto_663964 ) ) ( not ( = ?auto_663961 ?auto_663965 ) ) ( not ( = ?auto_663961 ?auto_663966 ) ) ( not ( = ?auto_663961 ?auto_663972 ) ) ( not ( = ?auto_663962 ?auto_663963 ) ) ( not ( = ?auto_663962 ?auto_663964 ) ) ( not ( = ?auto_663962 ?auto_663965 ) ) ( not ( = ?auto_663962 ?auto_663966 ) ) ( not ( = ?auto_663962 ?auto_663972 ) ) ( not ( = ?auto_663963 ?auto_663964 ) ) ( not ( = ?auto_663963 ?auto_663965 ) ) ( not ( = ?auto_663963 ?auto_663966 ) ) ( not ( = ?auto_663963 ?auto_663972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663964 ?auto_663965 ?auto_663966 )
      ( MAKE-10CRATE-VERIFY ?auto_663956 ?auto_663957 ?auto_663958 ?auto_663959 ?auto_663960 ?auto_663961 ?auto_663962 ?auto_663963 ?auto_663964 ?auto_663965 ?auto_663966 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671218 - SURFACE
      ?auto_671219 - SURFACE
      ?auto_671220 - SURFACE
      ?auto_671221 - SURFACE
      ?auto_671222 - SURFACE
      ?auto_671223 - SURFACE
      ?auto_671224 - SURFACE
      ?auto_671225 - SURFACE
      ?auto_671226 - SURFACE
      ?auto_671227 - SURFACE
      ?auto_671228 - SURFACE
      ?auto_671229 - SURFACE
    )
    :vars
    (
      ?auto_671230 - HOIST
      ?auto_671231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671230 ?auto_671231 ) ( SURFACE-AT ?auto_671228 ?auto_671231 ) ( CLEAR ?auto_671228 ) ( LIFTING ?auto_671230 ?auto_671229 ) ( IS-CRATE ?auto_671229 ) ( not ( = ?auto_671228 ?auto_671229 ) ) ( ON ?auto_671219 ?auto_671218 ) ( ON ?auto_671220 ?auto_671219 ) ( ON ?auto_671221 ?auto_671220 ) ( ON ?auto_671222 ?auto_671221 ) ( ON ?auto_671223 ?auto_671222 ) ( ON ?auto_671224 ?auto_671223 ) ( ON ?auto_671225 ?auto_671224 ) ( ON ?auto_671226 ?auto_671225 ) ( ON ?auto_671227 ?auto_671226 ) ( ON ?auto_671228 ?auto_671227 ) ( not ( = ?auto_671218 ?auto_671219 ) ) ( not ( = ?auto_671218 ?auto_671220 ) ) ( not ( = ?auto_671218 ?auto_671221 ) ) ( not ( = ?auto_671218 ?auto_671222 ) ) ( not ( = ?auto_671218 ?auto_671223 ) ) ( not ( = ?auto_671218 ?auto_671224 ) ) ( not ( = ?auto_671218 ?auto_671225 ) ) ( not ( = ?auto_671218 ?auto_671226 ) ) ( not ( = ?auto_671218 ?auto_671227 ) ) ( not ( = ?auto_671218 ?auto_671228 ) ) ( not ( = ?auto_671218 ?auto_671229 ) ) ( not ( = ?auto_671219 ?auto_671220 ) ) ( not ( = ?auto_671219 ?auto_671221 ) ) ( not ( = ?auto_671219 ?auto_671222 ) ) ( not ( = ?auto_671219 ?auto_671223 ) ) ( not ( = ?auto_671219 ?auto_671224 ) ) ( not ( = ?auto_671219 ?auto_671225 ) ) ( not ( = ?auto_671219 ?auto_671226 ) ) ( not ( = ?auto_671219 ?auto_671227 ) ) ( not ( = ?auto_671219 ?auto_671228 ) ) ( not ( = ?auto_671219 ?auto_671229 ) ) ( not ( = ?auto_671220 ?auto_671221 ) ) ( not ( = ?auto_671220 ?auto_671222 ) ) ( not ( = ?auto_671220 ?auto_671223 ) ) ( not ( = ?auto_671220 ?auto_671224 ) ) ( not ( = ?auto_671220 ?auto_671225 ) ) ( not ( = ?auto_671220 ?auto_671226 ) ) ( not ( = ?auto_671220 ?auto_671227 ) ) ( not ( = ?auto_671220 ?auto_671228 ) ) ( not ( = ?auto_671220 ?auto_671229 ) ) ( not ( = ?auto_671221 ?auto_671222 ) ) ( not ( = ?auto_671221 ?auto_671223 ) ) ( not ( = ?auto_671221 ?auto_671224 ) ) ( not ( = ?auto_671221 ?auto_671225 ) ) ( not ( = ?auto_671221 ?auto_671226 ) ) ( not ( = ?auto_671221 ?auto_671227 ) ) ( not ( = ?auto_671221 ?auto_671228 ) ) ( not ( = ?auto_671221 ?auto_671229 ) ) ( not ( = ?auto_671222 ?auto_671223 ) ) ( not ( = ?auto_671222 ?auto_671224 ) ) ( not ( = ?auto_671222 ?auto_671225 ) ) ( not ( = ?auto_671222 ?auto_671226 ) ) ( not ( = ?auto_671222 ?auto_671227 ) ) ( not ( = ?auto_671222 ?auto_671228 ) ) ( not ( = ?auto_671222 ?auto_671229 ) ) ( not ( = ?auto_671223 ?auto_671224 ) ) ( not ( = ?auto_671223 ?auto_671225 ) ) ( not ( = ?auto_671223 ?auto_671226 ) ) ( not ( = ?auto_671223 ?auto_671227 ) ) ( not ( = ?auto_671223 ?auto_671228 ) ) ( not ( = ?auto_671223 ?auto_671229 ) ) ( not ( = ?auto_671224 ?auto_671225 ) ) ( not ( = ?auto_671224 ?auto_671226 ) ) ( not ( = ?auto_671224 ?auto_671227 ) ) ( not ( = ?auto_671224 ?auto_671228 ) ) ( not ( = ?auto_671224 ?auto_671229 ) ) ( not ( = ?auto_671225 ?auto_671226 ) ) ( not ( = ?auto_671225 ?auto_671227 ) ) ( not ( = ?auto_671225 ?auto_671228 ) ) ( not ( = ?auto_671225 ?auto_671229 ) ) ( not ( = ?auto_671226 ?auto_671227 ) ) ( not ( = ?auto_671226 ?auto_671228 ) ) ( not ( = ?auto_671226 ?auto_671229 ) ) ( not ( = ?auto_671227 ?auto_671228 ) ) ( not ( = ?auto_671227 ?auto_671229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_671228 ?auto_671229 )
      ( MAKE-11CRATE-VERIFY ?auto_671218 ?auto_671219 ?auto_671220 ?auto_671221 ?auto_671222 ?auto_671223 ?auto_671224 ?auto_671225 ?auto_671226 ?auto_671227 ?auto_671228 ?auto_671229 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671327 - SURFACE
      ?auto_671328 - SURFACE
      ?auto_671329 - SURFACE
      ?auto_671330 - SURFACE
      ?auto_671331 - SURFACE
      ?auto_671332 - SURFACE
      ?auto_671333 - SURFACE
      ?auto_671334 - SURFACE
      ?auto_671335 - SURFACE
      ?auto_671336 - SURFACE
      ?auto_671337 - SURFACE
      ?auto_671338 - SURFACE
    )
    :vars
    (
      ?auto_671341 - HOIST
      ?auto_671340 - PLACE
      ?auto_671339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671341 ?auto_671340 ) ( SURFACE-AT ?auto_671337 ?auto_671340 ) ( CLEAR ?auto_671337 ) ( IS-CRATE ?auto_671338 ) ( not ( = ?auto_671337 ?auto_671338 ) ) ( TRUCK-AT ?auto_671339 ?auto_671340 ) ( AVAILABLE ?auto_671341 ) ( IN ?auto_671338 ?auto_671339 ) ( ON ?auto_671337 ?auto_671336 ) ( not ( = ?auto_671336 ?auto_671337 ) ) ( not ( = ?auto_671336 ?auto_671338 ) ) ( ON ?auto_671328 ?auto_671327 ) ( ON ?auto_671329 ?auto_671328 ) ( ON ?auto_671330 ?auto_671329 ) ( ON ?auto_671331 ?auto_671330 ) ( ON ?auto_671332 ?auto_671331 ) ( ON ?auto_671333 ?auto_671332 ) ( ON ?auto_671334 ?auto_671333 ) ( ON ?auto_671335 ?auto_671334 ) ( ON ?auto_671336 ?auto_671335 ) ( not ( = ?auto_671327 ?auto_671328 ) ) ( not ( = ?auto_671327 ?auto_671329 ) ) ( not ( = ?auto_671327 ?auto_671330 ) ) ( not ( = ?auto_671327 ?auto_671331 ) ) ( not ( = ?auto_671327 ?auto_671332 ) ) ( not ( = ?auto_671327 ?auto_671333 ) ) ( not ( = ?auto_671327 ?auto_671334 ) ) ( not ( = ?auto_671327 ?auto_671335 ) ) ( not ( = ?auto_671327 ?auto_671336 ) ) ( not ( = ?auto_671327 ?auto_671337 ) ) ( not ( = ?auto_671327 ?auto_671338 ) ) ( not ( = ?auto_671328 ?auto_671329 ) ) ( not ( = ?auto_671328 ?auto_671330 ) ) ( not ( = ?auto_671328 ?auto_671331 ) ) ( not ( = ?auto_671328 ?auto_671332 ) ) ( not ( = ?auto_671328 ?auto_671333 ) ) ( not ( = ?auto_671328 ?auto_671334 ) ) ( not ( = ?auto_671328 ?auto_671335 ) ) ( not ( = ?auto_671328 ?auto_671336 ) ) ( not ( = ?auto_671328 ?auto_671337 ) ) ( not ( = ?auto_671328 ?auto_671338 ) ) ( not ( = ?auto_671329 ?auto_671330 ) ) ( not ( = ?auto_671329 ?auto_671331 ) ) ( not ( = ?auto_671329 ?auto_671332 ) ) ( not ( = ?auto_671329 ?auto_671333 ) ) ( not ( = ?auto_671329 ?auto_671334 ) ) ( not ( = ?auto_671329 ?auto_671335 ) ) ( not ( = ?auto_671329 ?auto_671336 ) ) ( not ( = ?auto_671329 ?auto_671337 ) ) ( not ( = ?auto_671329 ?auto_671338 ) ) ( not ( = ?auto_671330 ?auto_671331 ) ) ( not ( = ?auto_671330 ?auto_671332 ) ) ( not ( = ?auto_671330 ?auto_671333 ) ) ( not ( = ?auto_671330 ?auto_671334 ) ) ( not ( = ?auto_671330 ?auto_671335 ) ) ( not ( = ?auto_671330 ?auto_671336 ) ) ( not ( = ?auto_671330 ?auto_671337 ) ) ( not ( = ?auto_671330 ?auto_671338 ) ) ( not ( = ?auto_671331 ?auto_671332 ) ) ( not ( = ?auto_671331 ?auto_671333 ) ) ( not ( = ?auto_671331 ?auto_671334 ) ) ( not ( = ?auto_671331 ?auto_671335 ) ) ( not ( = ?auto_671331 ?auto_671336 ) ) ( not ( = ?auto_671331 ?auto_671337 ) ) ( not ( = ?auto_671331 ?auto_671338 ) ) ( not ( = ?auto_671332 ?auto_671333 ) ) ( not ( = ?auto_671332 ?auto_671334 ) ) ( not ( = ?auto_671332 ?auto_671335 ) ) ( not ( = ?auto_671332 ?auto_671336 ) ) ( not ( = ?auto_671332 ?auto_671337 ) ) ( not ( = ?auto_671332 ?auto_671338 ) ) ( not ( = ?auto_671333 ?auto_671334 ) ) ( not ( = ?auto_671333 ?auto_671335 ) ) ( not ( = ?auto_671333 ?auto_671336 ) ) ( not ( = ?auto_671333 ?auto_671337 ) ) ( not ( = ?auto_671333 ?auto_671338 ) ) ( not ( = ?auto_671334 ?auto_671335 ) ) ( not ( = ?auto_671334 ?auto_671336 ) ) ( not ( = ?auto_671334 ?auto_671337 ) ) ( not ( = ?auto_671334 ?auto_671338 ) ) ( not ( = ?auto_671335 ?auto_671336 ) ) ( not ( = ?auto_671335 ?auto_671337 ) ) ( not ( = ?auto_671335 ?auto_671338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671336 ?auto_671337 ?auto_671338 )
      ( MAKE-11CRATE-VERIFY ?auto_671327 ?auto_671328 ?auto_671329 ?auto_671330 ?auto_671331 ?auto_671332 ?auto_671333 ?auto_671334 ?auto_671335 ?auto_671336 ?auto_671337 ?auto_671338 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671448 - SURFACE
      ?auto_671449 - SURFACE
      ?auto_671450 - SURFACE
      ?auto_671451 - SURFACE
      ?auto_671452 - SURFACE
      ?auto_671453 - SURFACE
      ?auto_671454 - SURFACE
      ?auto_671455 - SURFACE
      ?auto_671456 - SURFACE
      ?auto_671457 - SURFACE
      ?auto_671458 - SURFACE
      ?auto_671459 - SURFACE
    )
    :vars
    (
      ?auto_671462 - HOIST
      ?auto_671460 - PLACE
      ?auto_671463 - TRUCK
      ?auto_671461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671462 ?auto_671460 ) ( SURFACE-AT ?auto_671458 ?auto_671460 ) ( CLEAR ?auto_671458 ) ( IS-CRATE ?auto_671459 ) ( not ( = ?auto_671458 ?auto_671459 ) ) ( AVAILABLE ?auto_671462 ) ( IN ?auto_671459 ?auto_671463 ) ( ON ?auto_671458 ?auto_671457 ) ( not ( = ?auto_671457 ?auto_671458 ) ) ( not ( = ?auto_671457 ?auto_671459 ) ) ( TRUCK-AT ?auto_671463 ?auto_671461 ) ( not ( = ?auto_671461 ?auto_671460 ) ) ( ON ?auto_671449 ?auto_671448 ) ( ON ?auto_671450 ?auto_671449 ) ( ON ?auto_671451 ?auto_671450 ) ( ON ?auto_671452 ?auto_671451 ) ( ON ?auto_671453 ?auto_671452 ) ( ON ?auto_671454 ?auto_671453 ) ( ON ?auto_671455 ?auto_671454 ) ( ON ?auto_671456 ?auto_671455 ) ( ON ?auto_671457 ?auto_671456 ) ( not ( = ?auto_671448 ?auto_671449 ) ) ( not ( = ?auto_671448 ?auto_671450 ) ) ( not ( = ?auto_671448 ?auto_671451 ) ) ( not ( = ?auto_671448 ?auto_671452 ) ) ( not ( = ?auto_671448 ?auto_671453 ) ) ( not ( = ?auto_671448 ?auto_671454 ) ) ( not ( = ?auto_671448 ?auto_671455 ) ) ( not ( = ?auto_671448 ?auto_671456 ) ) ( not ( = ?auto_671448 ?auto_671457 ) ) ( not ( = ?auto_671448 ?auto_671458 ) ) ( not ( = ?auto_671448 ?auto_671459 ) ) ( not ( = ?auto_671449 ?auto_671450 ) ) ( not ( = ?auto_671449 ?auto_671451 ) ) ( not ( = ?auto_671449 ?auto_671452 ) ) ( not ( = ?auto_671449 ?auto_671453 ) ) ( not ( = ?auto_671449 ?auto_671454 ) ) ( not ( = ?auto_671449 ?auto_671455 ) ) ( not ( = ?auto_671449 ?auto_671456 ) ) ( not ( = ?auto_671449 ?auto_671457 ) ) ( not ( = ?auto_671449 ?auto_671458 ) ) ( not ( = ?auto_671449 ?auto_671459 ) ) ( not ( = ?auto_671450 ?auto_671451 ) ) ( not ( = ?auto_671450 ?auto_671452 ) ) ( not ( = ?auto_671450 ?auto_671453 ) ) ( not ( = ?auto_671450 ?auto_671454 ) ) ( not ( = ?auto_671450 ?auto_671455 ) ) ( not ( = ?auto_671450 ?auto_671456 ) ) ( not ( = ?auto_671450 ?auto_671457 ) ) ( not ( = ?auto_671450 ?auto_671458 ) ) ( not ( = ?auto_671450 ?auto_671459 ) ) ( not ( = ?auto_671451 ?auto_671452 ) ) ( not ( = ?auto_671451 ?auto_671453 ) ) ( not ( = ?auto_671451 ?auto_671454 ) ) ( not ( = ?auto_671451 ?auto_671455 ) ) ( not ( = ?auto_671451 ?auto_671456 ) ) ( not ( = ?auto_671451 ?auto_671457 ) ) ( not ( = ?auto_671451 ?auto_671458 ) ) ( not ( = ?auto_671451 ?auto_671459 ) ) ( not ( = ?auto_671452 ?auto_671453 ) ) ( not ( = ?auto_671452 ?auto_671454 ) ) ( not ( = ?auto_671452 ?auto_671455 ) ) ( not ( = ?auto_671452 ?auto_671456 ) ) ( not ( = ?auto_671452 ?auto_671457 ) ) ( not ( = ?auto_671452 ?auto_671458 ) ) ( not ( = ?auto_671452 ?auto_671459 ) ) ( not ( = ?auto_671453 ?auto_671454 ) ) ( not ( = ?auto_671453 ?auto_671455 ) ) ( not ( = ?auto_671453 ?auto_671456 ) ) ( not ( = ?auto_671453 ?auto_671457 ) ) ( not ( = ?auto_671453 ?auto_671458 ) ) ( not ( = ?auto_671453 ?auto_671459 ) ) ( not ( = ?auto_671454 ?auto_671455 ) ) ( not ( = ?auto_671454 ?auto_671456 ) ) ( not ( = ?auto_671454 ?auto_671457 ) ) ( not ( = ?auto_671454 ?auto_671458 ) ) ( not ( = ?auto_671454 ?auto_671459 ) ) ( not ( = ?auto_671455 ?auto_671456 ) ) ( not ( = ?auto_671455 ?auto_671457 ) ) ( not ( = ?auto_671455 ?auto_671458 ) ) ( not ( = ?auto_671455 ?auto_671459 ) ) ( not ( = ?auto_671456 ?auto_671457 ) ) ( not ( = ?auto_671456 ?auto_671458 ) ) ( not ( = ?auto_671456 ?auto_671459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671457 ?auto_671458 ?auto_671459 )
      ( MAKE-11CRATE-VERIFY ?auto_671448 ?auto_671449 ?auto_671450 ?auto_671451 ?auto_671452 ?auto_671453 ?auto_671454 ?auto_671455 ?auto_671456 ?auto_671457 ?auto_671458 ?auto_671459 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671580 - SURFACE
      ?auto_671581 - SURFACE
      ?auto_671582 - SURFACE
      ?auto_671583 - SURFACE
      ?auto_671584 - SURFACE
      ?auto_671585 - SURFACE
      ?auto_671586 - SURFACE
      ?auto_671587 - SURFACE
      ?auto_671588 - SURFACE
      ?auto_671589 - SURFACE
      ?auto_671590 - SURFACE
      ?auto_671591 - SURFACE
    )
    :vars
    (
      ?auto_671592 - HOIST
      ?auto_671595 - PLACE
      ?auto_671593 - TRUCK
      ?auto_671596 - PLACE
      ?auto_671594 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_671592 ?auto_671595 ) ( SURFACE-AT ?auto_671590 ?auto_671595 ) ( CLEAR ?auto_671590 ) ( IS-CRATE ?auto_671591 ) ( not ( = ?auto_671590 ?auto_671591 ) ) ( AVAILABLE ?auto_671592 ) ( ON ?auto_671590 ?auto_671589 ) ( not ( = ?auto_671589 ?auto_671590 ) ) ( not ( = ?auto_671589 ?auto_671591 ) ) ( TRUCK-AT ?auto_671593 ?auto_671596 ) ( not ( = ?auto_671596 ?auto_671595 ) ) ( HOIST-AT ?auto_671594 ?auto_671596 ) ( LIFTING ?auto_671594 ?auto_671591 ) ( not ( = ?auto_671592 ?auto_671594 ) ) ( ON ?auto_671581 ?auto_671580 ) ( ON ?auto_671582 ?auto_671581 ) ( ON ?auto_671583 ?auto_671582 ) ( ON ?auto_671584 ?auto_671583 ) ( ON ?auto_671585 ?auto_671584 ) ( ON ?auto_671586 ?auto_671585 ) ( ON ?auto_671587 ?auto_671586 ) ( ON ?auto_671588 ?auto_671587 ) ( ON ?auto_671589 ?auto_671588 ) ( not ( = ?auto_671580 ?auto_671581 ) ) ( not ( = ?auto_671580 ?auto_671582 ) ) ( not ( = ?auto_671580 ?auto_671583 ) ) ( not ( = ?auto_671580 ?auto_671584 ) ) ( not ( = ?auto_671580 ?auto_671585 ) ) ( not ( = ?auto_671580 ?auto_671586 ) ) ( not ( = ?auto_671580 ?auto_671587 ) ) ( not ( = ?auto_671580 ?auto_671588 ) ) ( not ( = ?auto_671580 ?auto_671589 ) ) ( not ( = ?auto_671580 ?auto_671590 ) ) ( not ( = ?auto_671580 ?auto_671591 ) ) ( not ( = ?auto_671581 ?auto_671582 ) ) ( not ( = ?auto_671581 ?auto_671583 ) ) ( not ( = ?auto_671581 ?auto_671584 ) ) ( not ( = ?auto_671581 ?auto_671585 ) ) ( not ( = ?auto_671581 ?auto_671586 ) ) ( not ( = ?auto_671581 ?auto_671587 ) ) ( not ( = ?auto_671581 ?auto_671588 ) ) ( not ( = ?auto_671581 ?auto_671589 ) ) ( not ( = ?auto_671581 ?auto_671590 ) ) ( not ( = ?auto_671581 ?auto_671591 ) ) ( not ( = ?auto_671582 ?auto_671583 ) ) ( not ( = ?auto_671582 ?auto_671584 ) ) ( not ( = ?auto_671582 ?auto_671585 ) ) ( not ( = ?auto_671582 ?auto_671586 ) ) ( not ( = ?auto_671582 ?auto_671587 ) ) ( not ( = ?auto_671582 ?auto_671588 ) ) ( not ( = ?auto_671582 ?auto_671589 ) ) ( not ( = ?auto_671582 ?auto_671590 ) ) ( not ( = ?auto_671582 ?auto_671591 ) ) ( not ( = ?auto_671583 ?auto_671584 ) ) ( not ( = ?auto_671583 ?auto_671585 ) ) ( not ( = ?auto_671583 ?auto_671586 ) ) ( not ( = ?auto_671583 ?auto_671587 ) ) ( not ( = ?auto_671583 ?auto_671588 ) ) ( not ( = ?auto_671583 ?auto_671589 ) ) ( not ( = ?auto_671583 ?auto_671590 ) ) ( not ( = ?auto_671583 ?auto_671591 ) ) ( not ( = ?auto_671584 ?auto_671585 ) ) ( not ( = ?auto_671584 ?auto_671586 ) ) ( not ( = ?auto_671584 ?auto_671587 ) ) ( not ( = ?auto_671584 ?auto_671588 ) ) ( not ( = ?auto_671584 ?auto_671589 ) ) ( not ( = ?auto_671584 ?auto_671590 ) ) ( not ( = ?auto_671584 ?auto_671591 ) ) ( not ( = ?auto_671585 ?auto_671586 ) ) ( not ( = ?auto_671585 ?auto_671587 ) ) ( not ( = ?auto_671585 ?auto_671588 ) ) ( not ( = ?auto_671585 ?auto_671589 ) ) ( not ( = ?auto_671585 ?auto_671590 ) ) ( not ( = ?auto_671585 ?auto_671591 ) ) ( not ( = ?auto_671586 ?auto_671587 ) ) ( not ( = ?auto_671586 ?auto_671588 ) ) ( not ( = ?auto_671586 ?auto_671589 ) ) ( not ( = ?auto_671586 ?auto_671590 ) ) ( not ( = ?auto_671586 ?auto_671591 ) ) ( not ( = ?auto_671587 ?auto_671588 ) ) ( not ( = ?auto_671587 ?auto_671589 ) ) ( not ( = ?auto_671587 ?auto_671590 ) ) ( not ( = ?auto_671587 ?auto_671591 ) ) ( not ( = ?auto_671588 ?auto_671589 ) ) ( not ( = ?auto_671588 ?auto_671590 ) ) ( not ( = ?auto_671588 ?auto_671591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671589 ?auto_671590 ?auto_671591 )
      ( MAKE-11CRATE-VERIFY ?auto_671580 ?auto_671581 ?auto_671582 ?auto_671583 ?auto_671584 ?auto_671585 ?auto_671586 ?auto_671587 ?auto_671588 ?auto_671589 ?auto_671590 ?auto_671591 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671723 - SURFACE
      ?auto_671724 - SURFACE
      ?auto_671725 - SURFACE
      ?auto_671726 - SURFACE
      ?auto_671727 - SURFACE
      ?auto_671728 - SURFACE
      ?auto_671729 - SURFACE
      ?auto_671730 - SURFACE
      ?auto_671731 - SURFACE
      ?auto_671732 - SURFACE
      ?auto_671733 - SURFACE
      ?auto_671734 - SURFACE
    )
    :vars
    (
      ?auto_671739 - HOIST
      ?auto_671735 - PLACE
      ?auto_671736 - TRUCK
      ?auto_671740 - PLACE
      ?auto_671737 - HOIST
      ?auto_671738 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671739 ?auto_671735 ) ( SURFACE-AT ?auto_671733 ?auto_671735 ) ( CLEAR ?auto_671733 ) ( IS-CRATE ?auto_671734 ) ( not ( = ?auto_671733 ?auto_671734 ) ) ( AVAILABLE ?auto_671739 ) ( ON ?auto_671733 ?auto_671732 ) ( not ( = ?auto_671732 ?auto_671733 ) ) ( not ( = ?auto_671732 ?auto_671734 ) ) ( TRUCK-AT ?auto_671736 ?auto_671740 ) ( not ( = ?auto_671740 ?auto_671735 ) ) ( HOIST-AT ?auto_671737 ?auto_671740 ) ( not ( = ?auto_671739 ?auto_671737 ) ) ( AVAILABLE ?auto_671737 ) ( SURFACE-AT ?auto_671734 ?auto_671740 ) ( ON ?auto_671734 ?auto_671738 ) ( CLEAR ?auto_671734 ) ( not ( = ?auto_671733 ?auto_671738 ) ) ( not ( = ?auto_671734 ?auto_671738 ) ) ( not ( = ?auto_671732 ?auto_671738 ) ) ( ON ?auto_671724 ?auto_671723 ) ( ON ?auto_671725 ?auto_671724 ) ( ON ?auto_671726 ?auto_671725 ) ( ON ?auto_671727 ?auto_671726 ) ( ON ?auto_671728 ?auto_671727 ) ( ON ?auto_671729 ?auto_671728 ) ( ON ?auto_671730 ?auto_671729 ) ( ON ?auto_671731 ?auto_671730 ) ( ON ?auto_671732 ?auto_671731 ) ( not ( = ?auto_671723 ?auto_671724 ) ) ( not ( = ?auto_671723 ?auto_671725 ) ) ( not ( = ?auto_671723 ?auto_671726 ) ) ( not ( = ?auto_671723 ?auto_671727 ) ) ( not ( = ?auto_671723 ?auto_671728 ) ) ( not ( = ?auto_671723 ?auto_671729 ) ) ( not ( = ?auto_671723 ?auto_671730 ) ) ( not ( = ?auto_671723 ?auto_671731 ) ) ( not ( = ?auto_671723 ?auto_671732 ) ) ( not ( = ?auto_671723 ?auto_671733 ) ) ( not ( = ?auto_671723 ?auto_671734 ) ) ( not ( = ?auto_671723 ?auto_671738 ) ) ( not ( = ?auto_671724 ?auto_671725 ) ) ( not ( = ?auto_671724 ?auto_671726 ) ) ( not ( = ?auto_671724 ?auto_671727 ) ) ( not ( = ?auto_671724 ?auto_671728 ) ) ( not ( = ?auto_671724 ?auto_671729 ) ) ( not ( = ?auto_671724 ?auto_671730 ) ) ( not ( = ?auto_671724 ?auto_671731 ) ) ( not ( = ?auto_671724 ?auto_671732 ) ) ( not ( = ?auto_671724 ?auto_671733 ) ) ( not ( = ?auto_671724 ?auto_671734 ) ) ( not ( = ?auto_671724 ?auto_671738 ) ) ( not ( = ?auto_671725 ?auto_671726 ) ) ( not ( = ?auto_671725 ?auto_671727 ) ) ( not ( = ?auto_671725 ?auto_671728 ) ) ( not ( = ?auto_671725 ?auto_671729 ) ) ( not ( = ?auto_671725 ?auto_671730 ) ) ( not ( = ?auto_671725 ?auto_671731 ) ) ( not ( = ?auto_671725 ?auto_671732 ) ) ( not ( = ?auto_671725 ?auto_671733 ) ) ( not ( = ?auto_671725 ?auto_671734 ) ) ( not ( = ?auto_671725 ?auto_671738 ) ) ( not ( = ?auto_671726 ?auto_671727 ) ) ( not ( = ?auto_671726 ?auto_671728 ) ) ( not ( = ?auto_671726 ?auto_671729 ) ) ( not ( = ?auto_671726 ?auto_671730 ) ) ( not ( = ?auto_671726 ?auto_671731 ) ) ( not ( = ?auto_671726 ?auto_671732 ) ) ( not ( = ?auto_671726 ?auto_671733 ) ) ( not ( = ?auto_671726 ?auto_671734 ) ) ( not ( = ?auto_671726 ?auto_671738 ) ) ( not ( = ?auto_671727 ?auto_671728 ) ) ( not ( = ?auto_671727 ?auto_671729 ) ) ( not ( = ?auto_671727 ?auto_671730 ) ) ( not ( = ?auto_671727 ?auto_671731 ) ) ( not ( = ?auto_671727 ?auto_671732 ) ) ( not ( = ?auto_671727 ?auto_671733 ) ) ( not ( = ?auto_671727 ?auto_671734 ) ) ( not ( = ?auto_671727 ?auto_671738 ) ) ( not ( = ?auto_671728 ?auto_671729 ) ) ( not ( = ?auto_671728 ?auto_671730 ) ) ( not ( = ?auto_671728 ?auto_671731 ) ) ( not ( = ?auto_671728 ?auto_671732 ) ) ( not ( = ?auto_671728 ?auto_671733 ) ) ( not ( = ?auto_671728 ?auto_671734 ) ) ( not ( = ?auto_671728 ?auto_671738 ) ) ( not ( = ?auto_671729 ?auto_671730 ) ) ( not ( = ?auto_671729 ?auto_671731 ) ) ( not ( = ?auto_671729 ?auto_671732 ) ) ( not ( = ?auto_671729 ?auto_671733 ) ) ( not ( = ?auto_671729 ?auto_671734 ) ) ( not ( = ?auto_671729 ?auto_671738 ) ) ( not ( = ?auto_671730 ?auto_671731 ) ) ( not ( = ?auto_671730 ?auto_671732 ) ) ( not ( = ?auto_671730 ?auto_671733 ) ) ( not ( = ?auto_671730 ?auto_671734 ) ) ( not ( = ?auto_671730 ?auto_671738 ) ) ( not ( = ?auto_671731 ?auto_671732 ) ) ( not ( = ?auto_671731 ?auto_671733 ) ) ( not ( = ?auto_671731 ?auto_671734 ) ) ( not ( = ?auto_671731 ?auto_671738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671732 ?auto_671733 ?auto_671734 )
      ( MAKE-11CRATE-VERIFY ?auto_671723 ?auto_671724 ?auto_671725 ?auto_671726 ?auto_671727 ?auto_671728 ?auto_671729 ?auto_671730 ?auto_671731 ?auto_671732 ?auto_671733 ?auto_671734 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671867 - SURFACE
      ?auto_671868 - SURFACE
      ?auto_671869 - SURFACE
      ?auto_671870 - SURFACE
      ?auto_671871 - SURFACE
      ?auto_671872 - SURFACE
      ?auto_671873 - SURFACE
      ?auto_671874 - SURFACE
      ?auto_671875 - SURFACE
      ?auto_671876 - SURFACE
      ?auto_671877 - SURFACE
      ?auto_671878 - SURFACE
    )
    :vars
    (
      ?auto_671880 - HOIST
      ?auto_671884 - PLACE
      ?auto_671883 - PLACE
      ?auto_671879 - HOIST
      ?auto_671882 - SURFACE
      ?auto_671881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671880 ?auto_671884 ) ( SURFACE-AT ?auto_671877 ?auto_671884 ) ( CLEAR ?auto_671877 ) ( IS-CRATE ?auto_671878 ) ( not ( = ?auto_671877 ?auto_671878 ) ) ( AVAILABLE ?auto_671880 ) ( ON ?auto_671877 ?auto_671876 ) ( not ( = ?auto_671876 ?auto_671877 ) ) ( not ( = ?auto_671876 ?auto_671878 ) ) ( not ( = ?auto_671883 ?auto_671884 ) ) ( HOIST-AT ?auto_671879 ?auto_671883 ) ( not ( = ?auto_671880 ?auto_671879 ) ) ( AVAILABLE ?auto_671879 ) ( SURFACE-AT ?auto_671878 ?auto_671883 ) ( ON ?auto_671878 ?auto_671882 ) ( CLEAR ?auto_671878 ) ( not ( = ?auto_671877 ?auto_671882 ) ) ( not ( = ?auto_671878 ?auto_671882 ) ) ( not ( = ?auto_671876 ?auto_671882 ) ) ( TRUCK-AT ?auto_671881 ?auto_671884 ) ( ON ?auto_671868 ?auto_671867 ) ( ON ?auto_671869 ?auto_671868 ) ( ON ?auto_671870 ?auto_671869 ) ( ON ?auto_671871 ?auto_671870 ) ( ON ?auto_671872 ?auto_671871 ) ( ON ?auto_671873 ?auto_671872 ) ( ON ?auto_671874 ?auto_671873 ) ( ON ?auto_671875 ?auto_671874 ) ( ON ?auto_671876 ?auto_671875 ) ( not ( = ?auto_671867 ?auto_671868 ) ) ( not ( = ?auto_671867 ?auto_671869 ) ) ( not ( = ?auto_671867 ?auto_671870 ) ) ( not ( = ?auto_671867 ?auto_671871 ) ) ( not ( = ?auto_671867 ?auto_671872 ) ) ( not ( = ?auto_671867 ?auto_671873 ) ) ( not ( = ?auto_671867 ?auto_671874 ) ) ( not ( = ?auto_671867 ?auto_671875 ) ) ( not ( = ?auto_671867 ?auto_671876 ) ) ( not ( = ?auto_671867 ?auto_671877 ) ) ( not ( = ?auto_671867 ?auto_671878 ) ) ( not ( = ?auto_671867 ?auto_671882 ) ) ( not ( = ?auto_671868 ?auto_671869 ) ) ( not ( = ?auto_671868 ?auto_671870 ) ) ( not ( = ?auto_671868 ?auto_671871 ) ) ( not ( = ?auto_671868 ?auto_671872 ) ) ( not ( = ?auto_671868 ?auto_671873 ) ) ( not ( = ?auto_671868 ?auto_671874 ) ) ( not ( = ?auto_671868 ?auto_671875 ) ) ( not ( = ?auto_671868 ?auto_671876 ) ) ( not ( = ?auto_671868 ?auto_671877 ) ) ( not ( = ?auto_671868 ?auto_671878 ) ) ( not ( = ?auto_671868 ?auto_671882 ) ) ( not ( = ?auto_671869 ?auto_671870 ) ) ( not ( = ?auto_671869 ?auto_671871 ) ) ( not ( = ?auto_671869 ?auto_671872 ) ) ( not ( = ?auto_671869 ?auto_671873 ) ) ( not ( = ?auto_671869 ?auto_671874 ) ) ( not ( = ?auto_671869 ?auto_671875 ) ) ( not ( = ?auto_671869 ?auto_671876 ) ) ( not ( = ?auto_671869 ?auto_671877 ) ) ( not ( = ?auto_671869 ?auto_671878 ) ) ( not ( = ?auto_671869 ?auto_671882 ) ) ( not ( = ?auto_671870 ?auto_671871 ) ) ( not ( = ?auto_671870 ?auto_671872 ) ) ( not ( = ?auto_671870 ?auto_671873 ) ) ( not ( = ?auto_671870 ?auto_671874 ) ) ( not ( = ?auto_671870 ?auto_671875 ) ) ( not ( = ?auto_671870 ?auto_671876 ) ) ( not ( = ?auto_671870 ?auto_671877 ) ) ( not ( = ?auto_671870 ?auto_671878 ) ) ( not ( = ?auto_671870 ?auto_671882 ) ) ( not ( = ?auto_671871 ?auto_671872 ) ) ( not ( = ?auto_671871 ?auto_671873 ) ) ( not ( = ?auto_671871 ?auto_671874 ) ) ( not ( = ?auto_671871 ?auto_671875 ) ) ( not ( = ?auto_671871 ?auto_671876 ) ) ( not ( = ?auto_671871 ?auto_671877 ) ) ( not ( = ?auto_671871 ?auto_671878 ) ) ( not ( = ?auto_671871 ?auto_671882 ) ) ( not ( = ?auto_671872 ?auto_671873 ) ) ( not ( = ?auto_671872 ?auto_671874 ) ) ( not ( = ?auto_671872 ?auto_671875 ) ) ( not ( = ?auto_671872 ?auto_671876 ) ) ( not ( = ?auto_671872 ?auto_671877 ) ) ( not ( = ?auto_671872 ?auto_671878 ) ) ( not ( = ?auto_671872 ?auto_671882 ) ) ( not ( = ?auto_671873 ?auto_671874 ) ) ( not ( = ?auto_671873 ?auto_671875 ) ) ( not ( = ?auto_671873 ?auto_671876 ) ) ( not ( = ?auto_671873 ?auto_671877 ) ) ( not ( = ?auto_671873 ?auto_671878 ) ) ( not ( = ?auto_671873 ?auto_671882 ) ) ( not ( = ?auto_671874 ?auto_671875 ) ) ( not ( = ?auto_671874 ?auto_671876 ) ) ( not ( = ?auto_671874 ?auto_671877 ) ) ( not ( = ?auto_671874 ?auto_671878 ) ) ( not ( = ?auto_671874 ?auto_671882 ) ) ( not ( = ?auto_671875 ?auto_671876 ) ) ( not ( = ?auto_671875 ?auto_671877 ) ) ( not ( = ?auto_671875 ?auto_671878 ) ) ( not ( = ?auto_671875 ?auto_671882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671876 ?auto_671877 ?auto_671878 )
      ( MAKE-11CRATE-VERIFY ?auto_671867 ?auto_671868 ?auto_671869 ?auto_671870 ?auto_671871 ?auto_671872 ?auto_671873 ?auto_671874 ?auto_671875 ?auto_671876 ?auto_671877 ?auto_671878 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_672011 - SURFACE
      ?auto_672012 - SURFACE
      ?auto_672013 - SURFACE
      ?auto_672014 - SURFACE
      ?auto_672015 - SURFACE
      ?auto_672016 - SURFACE
      ?auto_672017 - SURFACE
      ?auto_672018 - SURFACE
      ?auto_672019 - SURFACE
      ?auto_672020 - SURFACE
      ?auto_672021 - SURFACE
      ?auto_672022 - SURFACE
    )
    :vars
    (
      ?auto_672028 - HOIST
      ?auto_672023 - PLACE
      ?auto_672026 - PLACE
      ?auto_672027 - HOIST
      ?auto_672025 - SURFACE
      ?auto_672024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_672028 ?auto_672023 ) ( IS-CRATE ?auto_672022 ) ( not ( = ?auto_672021 ?auto_672022 ) ) ( not ( = ?auto_672020 ?auto_672021 ) ) ( not ( = ?auto_672020 ?auto_672022 ) ) ( not ( = ?auto_672026 ?auto_672023 ) ) ( HOIST-AT ?auto_672027 ?auto_672026 ) ( not ( = ?auto_672028 ?auto_672027 ) ) ( AVAILABLE ?auto_672027 ) ( SURFACE-AT ?auto_672022 ?auto_672026 ) ( ON ?auto_672022 ?auto_672025 ) ( CLEAR ?auto_672022 ) ( not ( = ?auto_672021 ?auto_672025 ) ) ( not ( = ?auto_672022 ?auto_672025 ) ) ( not ( = ?auto_672020 ?auto_672025 ) ) ( TRUCK-AT ?auto_672024 ?auto_672023 ) ( SURFACE-AT ?auto_672020 ?auto_672023 ) ( CLEAR ?auto_672020 ) ( LIFTING ?auto_672028 ?auto_672021 ) ( IS-CRATE ?auto_672021 ) ( ON ?auto_672012 ?auto_672011 ) ( ON ?auto_672013 ?auto_672012 ) ( ON ?auto_672014 ?auto_672013 ) ( ON ?auto_672015 ?auto_672014 ) ( ON ?auto_672016 ?auto_672015 ) ( ON ?auto_672017 ?auto_672016 ) ( ON ?auto_672018 ?auto_672017 ) ( ON ?auto_672019 ?auto_672018 ) ( ON ?auto_672020 ?auto_672019 ) ( not ( = ?auto_672011 ?auto_672012 ) ) ( not ( = ?auto_672011 ?auto_672013 ) ) ( not ( = ?auto_672011 ?auto_672014 ) ) ( not ( = ?auto_672011 ?auto_672015 ) ) ( not ( = ?auto_672011 ?auto_672016 ) ) ( not ( = ?auto_672011 ?auto_672017 ) ) ( not ( = ?auto_672011 ?auto_672018 ) ) ( not ( = ?auto_672011 ?auto_672019 ) ) ( not ( = ?auto_672011 ?auto_672020 ) ) ( not ( = ?auto_672011 ?auto_672021 ) ) ( not ( = ?auto_672011 ?auto_672022 ) ) ( not ( = ?auto_672011 ?auto_672025 ) ) ( not ( = ?auto_672012 ?auto_672013 ) ) ( not ( = ?auto_672012 ?auto_672014 ) ) ( not ( = ?auto_672012 ?auto_672015 ) ) ( not ( = ?auto_672012 ?auto_672016 ) ) ( not ( = ?auto_672012 ?auto_672017 ) ) ( not ( = ?auto_672012 ?auto_672018 ) ) ( not ( = ?auto_672012 ?auto_672019 ) ) ( not ( = ?auto_672012 ?auto_672020 ) ) ( not ( = ?auto_672012 ?auto_672021 ) ) ( not ( = ?auto_672012 ?auto_672022 ) ) ( not ( = ?auto_672012 ?auto_672025 ) ) ( not ( = ?auto_672013 ?auto_672014 ) ) ( not ( = ?auto_672013 ?auto_672015 ) ) ( not ( = ?auto_672013 ?auto_672016 ) ) ( not ( = ?auto_672013 ?auto_672017 ) ) ( not ( = ?auto_672013 ?auto_672018 ) ) ( not ( = ?auto_672013 ?auto_672019 ) ) ( not ( = ?auto_672013 ?auto_672020 ) ) ( not ( = ?auto_672013 ?auto_672021 ) ) ( not ( = ?auto_672013 ?auto_672022 ) ) ( not ( = ?auto_672013 ?auto_672025 ) ) ( not ( = ?auto_672014 ?auto_672015 ) ) ( not ( = ?auto_672014 ?auto_672016 ) ) ( not ( = ?auto_672014 ?auto_672017 ) ) ( not ( = ?auto_672014 ?auto_672018 ) ) ( not ( = ?auto_672014 ?auto_672019 ) ) ( not ( = ?auto_672014 ?auto_672020 ) ) ( not ( = ?auto_672014 ?auto_672021 ) ) ( not ( = ?auto_672014 ?auto_672022 ) ) ( not ( = ?auto_672014 ?auto_672025 ) ) ( not ( = ?auto_672015 ?auto_672016 ) ) ( not ( = ?auto_672015 ?auto_672017 ) ) ( not ( = ?auto_672015 ?auto_672018 ) ) ( not ( = ?auto_672015 ?auto_672019 ) ) ( not ( = ?auto_672015 ?auto_672020 ) ) ( not ( = ?auto_672015 ?auto_672021 ) ) ( not ( = ?auto_672015 ?auto_672022 ) ) ( not ( = ?auto_672015 ?auto_672025 ) ) ( not ( = ?auto_672016 ?auto_672017 ) ) ( not ( = ?auto_672016 ?auto_672018 ) ) ( not ( = ?auto_672016 ?auto_672019 ) ) ( not ( = ?auto_672016 ?auto_672020 ) ) ( not ( = ?auto_672016 ?auto_672021 ) ) ( not ( = ?auto_672016 ?auto_672022 ) ) ( not ( = ?auto_672016 ?auto_672025 ) ) ( not ( = ?auto_672017 ?auto_672018 ) ) ( not ( = ?auto_672017 ?auto_672019 ) ) ( not ( = ?auto_672017 ?auto_672020 ) ) ( not ( = ?auto_672017 ?auto_672021 ) ) ( not ( = ?auto_672017 ?auto_672022 ) ) ( not ( = ?auto_672017 ?auto_672025 ) ) ( not ( = ?auto_672018 ?auto_672019 ) ) ( not ( = ?auto_672018 ?auto_672020 ) ) ( not ( = ?auto_672018 ?auto_672021 ) ) ( not ( = ?auto_672018 ?auto_672022 ) ) ( not ( = ?auto_672018 ?auto_672025 ) ) ( not ( = ?auto_672019 ?auto_672020 ) ) ( not ( = ?auto_672019 ?auto_672021 ) ) ( not ( = ?auto_672019 ?auto_672022 ) ) ( not ( = ?auto_672019 ?auto_672025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_672020 ?auto_672021 ?auto_672022 )
      ( MAKE-11CRATE-VERIFY ?auto_672011 ?auto_672012 ?auto_672013 ?auto_672014 ?auto_672015 ?auto_672016 ?auto_672017 ?auto_672018 ?auto_672019 ?auto_672020 ?auto_672021 ?auto_672022 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_672155 - SURFACE
      ?auto_672156 - SURFACE
      ?auto_672157 - SURFACE
      ?auto_672158 - SURFACE
      ?auto_672159 - SURFACE
      ?auto_672160 - SURFACE
      ?auto_672161 - SURFACE
      ?auto_672162 - SURFACE
      ?auto_672163 - SURFACE
      ?auto_672164 - SURFACE
      ?auto_672165 - SURFACE
      ?auto_672166 - SURFACE
    )
    :vars
    (
      ?auto_672168 - HOIST
      ?auto_672171 - PLACE
      ?auto_672169 - PLACE
      ?auto_672172 - HOIST
      ?auto_672167 - SURFACE
      ?auto_672170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_672168 ?auto_672171 ) ( IS-CRATE ?auto_672166 ) ( not ( = ?auto_672165 ?auto_672166 ) ) ( not ( = ?auto_672164 ?auto_672165 ) ) ( not ( = ?auto_672164 ?auto_672166 ) ) ( not ( = ?auto_672169 ?auto_672171 ) ) ( HOIST-AT ?auto_672172 ?auto_672169 ) ( not ( = ?auto_672168 ?auto_672172 ) ) ( AVAILABLE ?auto_672172 ) ( SURFACE-AT ?auto_672166 ?auto_672169 ) ( ON ?auto_672166 ?auto_672167 ) ( CLEAR ?auto_672166 ) ( not ( = ?auto_672165 ?auto_672167 ) ) ( not ( = ?auto_672166 ?auto_672167 ) ) ( not ( = ?auto_672164 ?auto_672167 ) ) ( TRUCK-AT ?auto_672170 ?auto_672171 ) ( SURFACE-AT ?auto_672164 ?auto_672171 ) ( CLEAR ?auto_672164 ) ( IS-CRATE ?auto_672165 ) ( AVAILABLE ?auto_672168 ) ( IN ?auto_672165 ?auto_672170 ) ( ON ?auto_672156 ?auto_672155 ) ( ON ?auto_672157 ?auto_672156 ) ( ON ?auto_672158 ?auto_672157 ) ( ON ?auto_672159 ?auto_672158 ) ( ON ?auto_672160 ?auto_672159 ) ( ON ?auto_672161 ?auto_672160 ) ( ON ?auto_672162 ?auto_672161 ) ( ON ?auto_672163 ?auto_672162 ) ( ON ?auto_672164 ?auto_672163 ) ( not ( = ?auto_672155 ?auto_672156 ) ) ( not ( = ?auto_672155 ?auto_672157 ) ) ( not ( = ?auto_672155 ?auto_672158 ) ) ( not ( = ?auto_672155 ?auto_672159 ) ) ( not ( = ?auto_672155 ?auto_672160 ) ) ( not ( = ?auto_672155 ?auto_672161 ) ) ( not ( = ?auto_672155 ?auto_672162 ) ) ( not ( = ?auto_672155 ?auto_672163 ) ) ( not ( = ?auto_672155 ?auto_672164 ) ) ( not ( = ?auto_672155 ?auto_672165 ) ) ( not ( = ?auto_672155 ?auto_672166 ) ) ( not ( = ?auto_672155 ?auto_672167 ) ) ( not ( = ?auto_672156 ?auto_672157 ) ) ( not ( = ?auto_672156 ?auto_672158 ) ) ( not ( = ?auto_672156 ?auto_672159 ) ) ( not ( = ?auto_672156 ?auto_672160 ) ) ( not ( = ?auto_672156 ?auto_672161 ) ) ( not ( = ?auto_672156 ?auto_672162 ) ) ( not ( = ?auto_672156 ?auto_672163 ) ) ( not ( = ?auto_672156 ?auto_672164 ) ) ( not ( = ?auto_672156 ?auto_672165 ) ) ( not ( = ?auto_672156 ?auto_672166 ) ) ( not ( = ?auto_672156 ?auto_672167 ) ) ( not ( = ?auto_672157 ?auto_672158 ) ) ( not ( = ?auto_672157 ?auto_672159 ) ) ( not ( = ?auto_672157 ?auto_672160 ) ) ( not ( = ?auto_672157 ?auto_672161 ) ) ( not ( = ?auto_672157 ?auto_672162 ) ) ( not ( = ?auto_672157 ?auto_672163 ) ) ( not ( = ?auto_672157 ?auto_672164 ) ) ( not ( = ?auto_672157 ?auto_672165 ) ) ( not ( = ?auto_672157 ?auto_672166 ) ) ( not ( = ?auto_672157 ?auto_672167 ) ) ( not ( = ?auto_672158 ?auto_672159 ) ) ( not ( = ?auto_672158 ?auto_672160 ) ) ( not ( = ?auto_672158 ?auto_672161 ) ) ( not ( = ?auto_672158 ?auto_672162 ) ) ( not ( = ?auto_672158 ?auto_672163 ) ) ( not ( = ?auto_672158 ?auto_672164 ) ) ( not ( = ?auto_672158 ?auto_672165 ) ) ( not ( = ?auto_672158 ?auto_672166 ) ) ( not ( = ?auto_672158 ?auto_672167 ) ) ( not ( = ?auto_672159 ?auto_672160 ) ) ( not ( = ?auto_672159 ?auto_672161 ) ) ( not ( = ?auto_672159 ?auto_672162 ) ) ( not ( = ?auto_672159 ?auto_672163 ) ) ( not ( = ?auto_672159 ?auto_672164 ) ) ( not ( = ?auto_672159 ?auto_672165 ) ) ( not ( = ?auto_672159 ?auto_672166 ) ) ( not ( = ?auto_672159 ?auto_672167 ) ) ( not ( = ?auto_672160 ?auto_672161 ) ) ( not ( = ?auto_672160 ?auto_672162 ) ) ( not ( = ?auto_672160 ?auto_672163 ) ) ( not ( = ?auto_672160 ?auto_672164 ) ) ( not ( = ?auto_672160 ?auto_672165 ) ) ( not ( = ?auto_672160 ?auto_672166 ) ) ( not ( = ?auto_672160 ?auto_672167 ) ) ( not ( = ?auto_672161 ?auto_672162 ) ) ( not ( = ?auto_672161 ?auto_672163 ) ) ( not ( = ?auto_672161 ?auto_672164 ) ) ( not ( = ?auto_672161 ?auto_672165 ) ) ( not ( = ?auto_672161 ?auto_672166 ) ) ( not ( = ?auto_672161 ?auto_672167 ) ) ( not ( = ?auto_672162 ?auto_672163 ) ) ( not ( = ?auto_672162 ?auto_672164 ) ) ( not ( = ?auto_672162 ?auto_672165 ) ) ( not ( = ?auto_672162 ?auto_672166 ) ) ( not ( = ?auto_672162 ?auto_672167 ) ) ( not ( = ?auto_672163 ?auto_672164 ) ) ( not ( = ?auto_672163 ?auto_672165 ) ) ( not ( = ?auto_672163 ?auto_672166 ) ) ( not ( = ?auto_672163 ?auto_672167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_672164 ?auto_672165 ?auto_672166 )
      ( MAKE-11CRATE-VERIFY ?auto_672155 ?auto_672156 ?auto_672157 ?auto_672158 ?auto_672159 ?auto_672160 ?auto_672161 ?auto_672162 ?auto_672163 ?auto_672164 ?auto_672165 ?auto_672166 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681424 - SURFACE
      ?auto_681425 - SURFACE
      ?auto_681426 - SURFACE
      ?auto_681427 - SURFACE
      ?auto_681428 - SURFACE
      ?auto_681429 - SURFACE
      ?auto_681430 - SURFACE
      ?auto_681431 - SURFACE
      ?auto_681432 - SURFACE
      ?auto_681433 - SURFACE
      ?auto_681434 - SURFACE
      ?auto_681435 - SURFACE
      ?auto_681436 - SURFACE
    )
    :vars
    (
      ?auto_681437 - HOIST
      ?auto_681438 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681437 ?auto_681438 ) ( SURFACE-AT ?auto_681435 ?auto_681438 ) ( CLEAR ?auto_681435 ) ( LIFTING ?auto_681437 ?auto_681436 ) ( IS-CRATE ?auto_681436 ) ( not ( = ?auto_681435 ?auto_681436 ) ) ( ON ?auto_681425 ?auto_681424 ) ( ON ?auto_681426 ?auto_681425 ) ( ON ?auto_681427 ?auto_681426 ) ( ON ?auto_681428 ?auto_681427 ) ( ON ?auto_681429 ?auto_681428 ) ( ON ?auto_681430 ?auto_681429 ) ( ON ?auto_681431 ?auto_681430 ) ( ON ?auto_681432 ?auto_681431 ) ( ON ?auto_681433 ?auto_681432 ) ( ON ?auto_681434 ?auto_681433 ) ( ON ?auto_681435 ?auto_681434 ) ( not ( = ?auto_681424 ?auto_681425 ) ) ( not ( = ?auto_681424 ?auto_681426 ) ) ( not ( = ?auto_681424 ?auto_681427 ) ) ( not ( = ?auto_681424 ?auto_681428 ) ) ( not ( = ?auto_681424 ?auto_681429 ) ) ( not ( = ?auto_681424 ?auto_681430 ) ) ( not ( = ?auto_681424 ?auto_681431 ) ) ( not ( = ?auto_681424 ?auto_681432 ) ) ( not ( = ?auto_681424 ?auto_681433 ) ) ( not ( = ?auto_681424 ?auto_681434 ) ) ( not ( = ?auto_681424 ?auto_681435 ) ) ( not ( = ?auto_681424 ?auto_681436 ) ) ( not ( = ?auto_681425 ?auto_681426 ) ) ( not ( = ?auto_681425 ?auto_681427 ) ) ( not ( = ?auto_681425 ?auto_681428 ) ) ( not ( = ?auto_681425 ?auto_681429 ) ) ( not ( = ?auto_681425 ?auto_681430 ) ) ( not ( = ?auto_681425 ?auto_681431 ) ) ( not ( = ?auto_681425 ?auto_681432 ) ) ( not ( = ?auto_681425 ?auto_681433 ) ) ( not ( = ?auto_681425 ?auto_681434 ) ) ( not ( = ?auto_681425 ?auto_681435 ) ) ( not ( = ?auto_681425 ?auto_681436 ) ) ( not ( = ?auto_681426 ?auto_681427 ) ) ( not ( = ?auto_681426 ?auto_681428 ) ) ( not ( = ?auto_681426 ?auto_681429 ) ) ( not ( = ?auto_681426 ?auto_681430 ) ) ( not ( = ?auto_681426 ?auto_681431 ) ) ( not ( = ?auto_681426 ?auto_681432 ) ) ( not ( = ?auto_681426 ?auto_681433 ) ) ( not ( = ?auto_681426 ?auto_681434 ) ) ( not ( = ?auto_681426 ?auto_681435 ) ) ( not ( = ?auto_681426 ?auto_681436 ) ) ( not ( = ?auto_681427 ?auto_681428 ) ) ( not ( = ?auto_681427 ?auto_681429 ) ) ( not ( = ?auto_681427 ?auto_681430 ) ) ( not ( = ?auto_681427 ?auto_681431 ) ) ( not ( = ?auto_681427 ?auto_681432 ) ) ( not ( = ?auto_681427 ?auto_681433 ) ) ( not ( = ?auto_681427 ?auto_681434 ) ) ( not ( = ?auto_681427 ?auto_681435 ) ) ( not ( = ?auto_681427 ?auto_681436 ) ) ( not ( = ?auto_681428 ?auto_681429 ) ) ( not ( = ?auto_681428 ?auto_681430 ) ) ( not ( = ?auto_681428 ?auto_681431 ) ) ( not ( = ?auto_681428 ?auto_681432 ) ) ( not ( = ?auto_681428 ?auto_681433 ) ) ( not ( = ?auto_681428 ?auto_681434 ) ) ( not ( = ?auto_681428 ?auto_681435 ) ) ( not ( = ?auto_681428 ?auto_681436 ) ) ( not ( = ?auto_681429 ?auto_681430 ) ) ( not ( = ?auto_681429 ?auto_681431 ) ) ( not ( = ?auto_681429 ?auto_681432 ) ) ( not ( = ?auto_681429 ?auto_681433 ) ) ( not ( = ?auto_681429 ?auto_681434 ) ) ( not ( = ?auto_681429 ?auto_681435 ) ) ( not ( = ?auto_681429 ?auto_681436 ) ) ( not ( = ?auto_681430 ?auto_681431 ) ) ( not ( = ?auto_681430 ?auto_681432 ) ) ( not ( = ?auto_681430 ?auto_681433 ) ) ( not ( = ?auto_681430 ?auto_681434 ) ) ( not ( = ?auto_681430 ?auto_681435 ) ) ( not ( = ?auto_681430 ?auto_681436 ) ) ( not ( = ?auto_681431 ?auto_681432 ) ) ( not ( = ?auto_681431 ?auto_681433 ) ) ( not ( = ?auto_681431 ?auto_681434 ) ) ( not ( = ?auto_681431 ?auto_681435 ) ) ( not ( = ?auto_681431 ?auto_681436 ) ) ( not ( = ?auto_681432 ?auto_681433 ) ) ( not ( = ?auto_681432 ?auto_681434 ) ) ( not ( = ?auto_681432 ?auto_681435 ) ) ( not ( = ?auto_681432 ?auto_681436 ) ) ( not ( = ?auto_681433 ?auto_681434 ) ) ( not ( = ?auto_681433 ?auto_681435 ) ) ( not ( = ?auto_681433 ?auto_681436 ) ) ( not ( = ?auto_681434 ?auto_681435 ) ) ( not ( = ?auto_681434 ?auto_681436 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_681435 ?auto_681436 )
      ( MAKE-12CRATE-VERIFY ?auto_681424 ?auto_681425 ?auto_681426 ?auto_681427 ?auto_681428 ?auto_681429 ?auto_681430 ?auto_681431 ?auto_681432 ?auto_681433 ?auto_681434 ?auto_681435 ?auto_681436 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681549 - SURFACE
      ?auto_681550 - SURFACE
      ?auto_681551 - SURFACE
      ?auto_681552 - SURFACE
      ?auto_681553 - SURFACE
      ?auto_681554 - SURFACE
      ?auto_681555 - SURFACE
      ?auto_681556 - SURFACE
      ?auto_681557 - SURFACE
      ?auto_681558 - SURFACE
      ?auto_681559 - SURFACE
      ?auto_681560 - SURFACE
      ?auto_681561 - SURFACE
    )
    :vars
    (
      ?auto_681564 - HOIST
      ?auto_681562 - PLACE
      ?auto_681563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_681564 ?auto_681562 ) ( SURFACE-AT ?auto_681560 ?auto_681562 ) ( CLEAR ?auto_681560 ) ( IS-CRATE ?auto_681561 ) ( not ( = ?auto_681560 ?auto_681561 ) ) ( TRUCK-AT ?auto_681563 ?auto_681562 ) ( AVAILABLE ?auto_681564 ) ( IN ?auto_681561 ?auto_681563 ) ( ON ?auto_681560 ?auto_681559 ) ( not ( = ?auto_681559 ?auto_681560 ) ) ( not ( = ?auto_681559 ?auto_681561 ) ) ( ON ?auto_681550 ?auto_681549 ) ( ON ?auto_681551 ?auto_681550 ) ( ON ?auto_681552 ?auto_681551 ) ( ON ?auto_681553 ?auto_681552 ) ( ON ?auto_681554 ?auto_681553 ) ( ON ?auto_681555 ?auto_681554 ) ( ON ?auto_681556 ?auto_681555 ) ( ON ?auto_681557 ?auto_681556 ) ( ON ?auto_681558 ?auto_681557 ) ( ON ?auto_681559 ?auto_681558 ) ( not ( = ?auto_681549 ?auto_681550 ) ) ( not ( = ?auto_681549 ?auto_681551 ) ) ( not ( = ?auto_681549 ?auto_681552 ) ) ( not ( = ?auto_681549 ?auto_681553 ) ) ( not ( = ?auto_681549 ?auto_681554 ) ) ( not ( = ?auto_681549 ?auto_681555 ) ) ( not ( = ?auto_681549 ?auto_681556 ) ) ( not ( = ?auto_681549 ?auto_681557 ) ) ( not ( = ?auto_681549 ?auto_681558 ) ) ( not ( = ?auto_681549 ?auto_681559 ) ) ( not ( = ?auto_681549 ?auto_681560 ) ) ( not ( = ?auto_681549 ?auto_681561 ) ) ( not ( = ?auto_681550 ?auto_681551 ) ) ( not ( = ?auto_681550 ?auto_681552 ) ) ( not ( = ?auto_681550 ?auto_681553 ) ) ( not ( = ?auto_681550 ?auto_681554 ) ) ( not ( = ?auto_681550 ?auto_681555 ) ) ( not ( = ?auto_681550 ?auto_681556 ) ) ( not ( = ?auto_681550 ?auto_681557 ) ) ( not ( = ?auto_681550 ?auto_681558 ) ) ( not ( = ?auto_681550 ?auto_681559 ) ) ( not ( = ?auto_681550 ?auto_681560 ) ) ( not ( = ?auto_681550 ?auto_681561 ) ) ( not ( = ?auto_681551 ?auto_681552 ) ) ( not ( = ?auto_681551 ?auto_681553 ) ) ( not ( = ?auto_681551 ?auto_681554 ) ) ( not ( = ?auto_681551 ?auto_681555 ) ) ( not ( = ?auto_681551 ?auto_681556 ) ) ( not ( = ?auto_681551 ?auto_681557 ) ) ( not ( = ?auto_681551 ?auto_681558 ) ) ( not ( = ?auto_681551 ?auto_681559 ) ) ( not ( = ?auto_681551 ?auto_681560 ) ) ( not ( = ?auto_681551 ?auto_681561 ) ) ( not ( = ?auto_681552 ?auto_681553 ) ) ( not ( = ?auto_681552 ?auto_681554 ) ) ( not ( = ?auto_681552 ?auto_681555 ) ) ( not ( = ?auto_681552 ?auto_681556 ) ) ( not ( = ?auto_681552 ?auto_681557 ) ) ( not ( = ?auto_681552 ?auto_681558 ) ) ( not ( = ?auto_681552 ?auto_681559 ) ) ( not ( = ?auto_681552 ?auto_681560 ) ) ( not ( = ?auto_681552 ?auto_681561 ) ) ( not ( = ?auto_681553 ?auto_681554 ) ) ( not ( = ?auto_681553 ?auto_681555 ) ) ( not ( = ?auto_681553 ?auto_681556 ) ) ( not ( = ?auto_681553 ?auto_681557 ) ) ( not ( = ?auto_681553 ?auto_681558 ) ) ( not ( = ?auto_681553 ?auto_681559 ) ) ( not ( = ?auto_681553 ?auto_681560 ) ) ( not ( = ?auto_681553 ?auto_681561 ) ) ( not ( = ?auto_681554 ?auto_681555 ) ) ( not ( = ?auto_681554 ?auto_681556 ) ) ( not ( = ?auto_681554 ?auto_681557 ) ) ( not ( = ?auto_681554 ?auto_681558 ) ) ( not ( = ?auto_681554 ?auto_681559 ) ) ( not ( = ?auto_681554 ?auto_681560 ) ) ( not ( = ?auto_681554 ?auto_681561 ) ) ( not ( = ?auto_681555 ?auto_681556 ) ) ( not ( = ?auto_681555 ?auto_681557 ) ) ( not ( = ?auto_681555 ?auto_681558 ) ) ( not ( = ?auto_681555 ?auto_681559 ) ) ( not ( = ?auto_681555 ?auto_681560 ) ) ( not ( = ?auto_681555 ?auto_681561 ) ) ( not ( = ?auto_681556 ?auto_681557 ) ) ( not ( = ?auto_681556 ?auto_681558 ) ) ( not ( = ?auto_681556 ?auto_681559 ) ) ( not ( = ?auto_681556 ?auto_681560 ) ) ( not ( = ?auto_681556 ?auto_681561 ) ) ( not ( = ?auto_681557 ?auto_681558 ) ) ( not ( = ?auto_681557 ?auto_681559 ) ) ( not ( = ?auto_681557 ?auto_681560 ) ) ( not ( = ?auto_681557 ?auto_681561 ) ) ( not ( = ?auto_681558 ?auto_681559 ) ) ( not ( = ?auto_681558 ?auto_681560 ) ) ( not ( = ?auto_681558 ?auto_681561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681559 ?auto_681560 ?auto_681561 )
      ( MAKE-12CRATE-VERIFY ?auto_681549 ?auto_681550 ?auto_681551 ?auto_681552 ?auto_681553 ?auto_681554 ?auto_681555 ?auto_681556 ?auto_681557 ?auto_681558 ?auto_681559 ?auto_681560 ?auto_681561 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681687 - SURFACE
      ?auto_681688 - SURFACE
      ?auto_681689 - SURFACE
      ?auto_681690 - SURFACE
      ?auto_681691 - SURFACE
      ?auto_681692 - SURFACE
      ?auto_681693 - SURFACE
      ?auto_681694 - SURFACE
      ?auto_681695 - SURFACE
      ?auto_681696 - SURFACE
      ?auto_681697 - SURFACE
      ?auto_681698 - SURFACE
      ?auto_681699 - SURFACE
    )
    :vars
    (
      ?auto_681701 - HOIST
      ?auto_681703 - PLACE
      ?auto_681700 - TRUCK
      ?auto_681702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681701 ?auto_681703 ) ( SURFACE-AT ?auto_681698 ?auto_681703 ) ( CLEAR ?auto_681698 ) ( IS-CRATE ?auto_681699 ) ( not ( = ?auto_681698 ?auto_681699 ) ) ( AVAILABLE ?auto_681701 ) ( IN ?auto_681699 ?auto_681700 ) ( ON ?auto_681698 ?auto_681697 ) ( not ( = ?auto_681697 ?auto_681698 ) ) ( not ( = ?auto_681697 ?auto_681699 ) ) ( TRUCK-AT ?auto_681700 ?auto_681702 ) ( not ( = ?auto_681702 ?auto_681703 ) ) ( ON ?auto_681688 ?auto_681687 ) ( ON ?auto_681689 ?auto_681688 ) ( ON ?auto_681690 ?auto_681689 ) ( ON ?auto_681691 ?auto_681690 ) ( ON ?auto_681692 ?auto_681691 ) ( ON ?auto_681693 ?auto_681692 ) ( ON ?auto_681694 ?auto_681693 ) ( ON ?auto_681695 ?auto_681694 ) ( ON ?auto_681696 ?auto_681695 ) ( ON ?auto_681697 ?auto_681696 ) ( not ( = ?auto_681687 ?auto_681688 ) ) ( not ( = ?auto_681687 ?auto_681689 ) ) ( not ( = ?auto_681687 ?auto_681690 ) ) ( not ( = ?auto_681687 ?auto_681691 ) ) ( not ( = ?auto_681687 ?auto_681692 ) ) ( not ( = ?auto_681687 ?auto_681693 ) ) ( not ( = ?auto_681687 ?auto_681694 ) ) ( not ( = ?auto_681687 ?auto_681695 ) ) ( not ( = ?auto_681687 ?auto_681696 ) ) ( not ( = ?auto_681687 ?auto_681697 ) ) ( not ( = ?auto_681687 ?auto_681698 ) ) ( not ( = ?auto_681687 ?auto_681699 ) ) ( not ( = ?auto_681688 ?auto_681689 ) ) ( not ( = ?auto_681688 ?auto_681690 ) ) ( not ( = ?auto_681688 ?auto_681691 ) ) ( not ( = ?auto_681688 ?auto_681692 ) ) ( not ( = ?auto_681688 ?auto_681693 ) ) ( not ( = ?auto_681688 ?auto_681694 ) ) ( not ( = ?auto_681688 ?auto_681695 ) ) ( not ( = ?auto_681688 ?auto_681696 ) ) ( not ( = ?auto_681688 ?auto_681697 ) ) ( not ( = ?auto_681688 ?auto_681698 ) ) ( not ( = ?auto_681688 ?auto_681699 ) ) ( not ( = ?auto_681689 ?auto_681690 ) ) ( not ( = ?auto_681689 ?auto_681691 ) ) ( not ( = ?auto_681689 ?auto_681692 ) ) ( not ( = ?auto_681689 ?auto_681693 ) ) ( not ( = ?auto_681689 ?auto_681694 ) ) ( not ( = ?auto_681689 ?auto_681695 ) ) ( not ( = ?auto_681689 ?auto_681696 ) ) ( not ( = ?auto_681689 ?auto_681697 ) ) ( not ( = ?auto_681689 ?auto_681698 ) ) ( not ( = ?auto_681689 ?auto_681699 ) ) ( not ( = ?auto_681690 ?auto_681691 ) ) ( not ( = ?auto_681690 ?auto_681692 ) ) ( not ( = ?auto_681690 ?auto_681693 ) ) ( not ( = ?auto_681690 ?auto_681694 ) ) ( not ( = ?auto_681690 ?auto_681695 ) ) ( not ( = ?auto_681690 ?auto_681696 ) ) ( not ( = ?auto_681690 ?auto_681697 ) ) ( not ( = ?auto_681690 ?auto_681698 ) ) ( not ( = ?auto_681690 ?auto_681699 ) ) ( not ( = ?auto_681691 ?auto_681692 ) ) ( not ( = ?auto_681691 ?auto_681693 ) ) ( not ( = ?auto_681691 ?auto_681694 ) ) ( not ( = ?auto_681691 ?auto_681695 ) ) ( not ( = ?auto_681691 ?auto_681696 ) ) ( not ( = ?auto_681691 ?auto_681697 ) ) ( not ( = ?auto_681691 ?auto_681698 ) ) ( not ( = ?auto_681691 ?auto_681699 ) ) ( not ( = ?auto_681692 ?auto_681693 ) ) ( not ( = ?auto_681692 ?auto_681694 ) ) ( not ( = ?auto_681692 ?auto_681695 ) ) ( not ( = ?auto_681692 ?auto_681696 ) ) ( not ( = ?auto_681692 ?auto_681697 ) ) ( not ( = ?auto_681692 ?auto_681698 ) ) ( not ( = ?auto_681692 ?auto_681699 ) ) ( not ( = ?auto_681693 ?auto_681694 ) ) ( not ( = ?auto_681693 ?auto_681695 ) ) ( not ( = ?auto_681693 ?auto_681696 ) ) ( not ( = ?auto_681693 ?auto_681697 ) ) ( not ( = ?auto_681693 ?auto_681698 ) ) ( not ( = ?auto_681693 ?auto_681699 ) ) ( not ( = ?auto_681694 ?auto_681695 ) ) ( not ( = ?auto_681694 ?auto_681696 ) ) ( not ( = ?auto_681694 ?auto_681697 ) ) ( not ( = ?auto_681694 ?auto_681698 ) ) ( not ( = ?auto_681694 ?auto_681699 ) ) ( not ( = ?auto_681695 ?auto_681696 ) ) ( not ( = ?auto_681695 ?auto_681697 ) ) ( not ( = ?auto_681695 ?auto_681698 ) ) ( not ( = ?auto_681695 ?auto_681699 ) ) ( not ( = ?auto_681696 ?auto_681697 ) ) ( not ( = ?auto_681696 ?auto_681698 ) ) ( not ( = ?auto_681696 ?auto_681699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681697 ?auto_681698 ?auto_681699 )
      ( MAKE-12CRATE-VERIFY ?auto_681687 ?auto_681688 ?auto_681689 ?auto_681690 ?auto_681691 ?auto_681692 ?auto_681693 ?auto_681694 ?auto_681695 ?auto_681696 ?auto_681697 ?auto_681698 ?auto_681699 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681837 - SURFACE
      ?auto_681838 - SURFACE
      ?auto_681839 - SURFACE
      ?auto_681840 - SURFACE
      ?auto_681841 - SURFACE
      ?auto_681842 - SURFACE
      ?auto_681843 - SURFACE
      ?auto_681844 - SURFACE
      ?auto_681845 - SURFACE
      ?auto_681846 - SURFACE
      ?auto_681847 - SURFACE
      ?auto_681848 - SURFACE
      ?auto_681849 - SURFACE
    )
    :vars
    (
      ?auto_681851 - HOIST
      ?auto_681853 - PLACE
      ?auto_681852 - TRUCK
      ?auto_681854 - PLACE
      ?auto_681850 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_681851 ?auto_681853 ) ( SURFACE-AT ?auto_681848 ?auto_681853 ) ( CLEAR ?auto_681848 ) ( IS-CRATE ?auto_681849 ) ( not ( = ?auto_681848 ?auto_681849 ) ) ( AVAILABLE ?auto_681851 ) ( ON ?auto_681848 ?auto_681847 ) ( not ( = ?auto_681847 ?auto_681848 ) ) ( not ( = ?auto_681847 ?auto_681849 ) ) ( TRUCK-AT ?auto_681852 ?auto_681854 ) ( not ( = ?auto_681854 ?auto_681853 ) ) ( HOIST-AT ?auto_681850 ?auto_681854 ) ( LIFTING ?auto_681850 ?auto_681849 ) ( not ( = ?auto_681851 ?auto_681850 ) ) ( ON ?auto_681838 ?auto_681837 ) ( ON ?auto_681839 ?auto_681838 ) ( ON ?auto_681840 ?auto_681839 ) ( ON ?auto_681841 ?auto_681840 ) ( ON ?auto_681842 ?auto_681841 ) ( ON ?auto_681843 ?auto_681842 ) ( ON ?auto_681844 ?auto_681843 ) ( ON ?auto_681845 ?auto_681844 ) ( ON ?auto_681846 ?auto_681845 ) ( ON ?auto_681847 ?auto_681846 ) ( not ( = ?auto_681837 ?auto_681838 ) ) ( not ( = ?auto_681837 ?auto_681839 ) ) ( not ( = ?auto_681837 ?auto_681840 ) ) ( not ( = ?auto_681837 ?auto_681841 ) ) ( not ( = ?auto_681837 ?auto_681842 ) ) ( not ( = ?auto_681837 ?auto_681843 ) ) ( not ( = ?auto_681837 ?auto_681844 ) ) ( not ( = ?auto_681837 ?auto_681845 ) ) ( not ( = ?auto_681837 ?auto_681846 ) ) ( not ( = ?auto_681837 ?auto_681847 ) ) ( not ( = ?auto_681837 ?auto_681848 ) ) ( not ( = ?auto_681837 ?auto_681849 ) ) ( not ( = ?auto_681838 ?auto_681839 ) ) ( not ( = ?auto_681838 ?auto_681840 ) ) ( not ( = ?auto_681838 ?auto_681841 ) ) ( not ( = ?auto_681838 ?auto_681842 ) ) ( not ( = ?auto_681838 ?auto_681843 ) ) ( not ( = ?auto_681838 ?auto_681844 ) ) ( not ( = ?auto_681838 ?auto_681845 ) ) ( not ( = ?auto_681838 ?auto_681846 ) ) ( not ( = ?auto_681838 ?auto_681847 ) ) ( not ( = ?auto_681838 ?auto_681848 ) ) ( not ( = ?auto_681838 ?auto_681849 ) ) ( not ( = ?auto_681839 ?auto_681840 ) ) ( not ( = ?auto_681839 ?auto_681841 ) ) ( not ( = ?auto_681839 ?auto_681842 ) ) ( not ( = ?auto_681839 ?auto_681843 ) ) ( not ( = ?auto_681839 ?auto_681844 ) ) ( not ( = ?auto_681839 ?auto_681845 ) ) ( not ( = ?auto_681839 ?auto_681846 ) ) ( not ( = ?auto_681839 ?auto_681847 ) ) ( not ( = ?auto_681839 ?auto_681848 ) ) ( not ( = ?auto_681839 ?auto_681849 ) ) ( not ( = ?auto_681840 ?auto_681841 ) ) ( not ( = ?auto_681840 ?auto_681842 ) ) ( not ( = ?auto_681840 ?auto_681843 ) ) ( not ( = ?auto_681840 ?auto_681844 ) ) ( not ( = ?auto_681840 ?auto_681845 ) ) ( not ( = ?auto_681840 ?auto_681846 ) ) ( not ( = ?auto_681840 ?auto_681847 ) ) ( not ( = ?auto_681840 ?auto_681848 ) ) ( not ( = ?auto_681840 ?auto_681849 ) ) ( not ( = ?auto_681841 ?auto_681842 ) ) ( not ( = ?auto_681841 ?auto_681843 ) ) ( not ( = ?auto_681841 ?auto_681844 ) ) ( not ( = ?auto_681841 ?auto_681845 ) ) ( not ( = ?auto_681841 ?auto_681846 ) ) ( not ( = ?auto_681841 ?auto_681847 ) ) ( not ( = ?auto_681841 ?auto_681848 ) ) ( not ( = ?auto_681841 ?auto_681849 ) ) ( not ( = ?auto_681842 ?auto_681843 ) ) ( not ( = ?auto_681842 ?auto_681844 ) ) ( not ( = ?auto_681842 ?auto_681845 ) ) ( not ( = ?auto_681842 ?auto_681846 ) ) ( not ( = ?auto_681842 ?auto_681847 ) ) ( not ( = ?auto_681842 ?auto_681848 ) ) ( not ( = ?auto_681842 ?auto_681849 ) ) ( not ( = ?auto_681843 ?auto_681844 ) ) ( not ( = ?auto_681843 ?auto_681845 ) ) ( not ( = ?auto_681843 ?auto_681846 ) ) ( not ( = ?auto_681843 ?auto_681847 ) ) ( not ( = ?auto_681843 ?auto_681848 ) ) ( not ( = ?auto_681843 ?auto_681849 ) ) ( not ( = ?auto_681844 ?auto_681845 ) ) ( not ( = ?auto_681844 ?auto_681846 ) ) ( not ( = ?auto_681844 ?auto_681847 ) ) ( not ( = ?auto_681844 ?auto_681848 ) ) ( not ( = ?auto_681844 ?auto_681849 ) ) ( not ( = ?auto_681845 ?auto_681846 ) ) ( not ( = ?auto_681845 ?auto_681847 ) ) ( not ( = ?auto_681845 ?auto_681848 ) ) ( not ( = ?auto_681845 ?auto_681849 ) ) ( not ( = ?auto_681846 ?auto_681847 ) ) ( not ( = ?auto_681846 ?auto_681848 ) ) ( not ( = ?auto_681846 ?auto_681849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681847 ?auto_681848 ?auto_681849 )
      ( MAKE-12CRATE-VERIFY ?auto_681837 ?auto_681838 ?auto_681839 ?auto_681840 ?auto_681841 ?auto_681842 ?auto_681843 ?auto_681844 ?auto_681845 ?auto_681846 ?auto_681847 ?auto_681848 ?auto_681849 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681999 - SURFACE
      ?auto_682000 - SURFACE
      ?auto_682001 - SURFACE
      ?auto_682002 - SURFACE
      ?auto_682003 - SURFACE
      ?auto_682004 - SURFACE
      ?auto_682005 - SURFACE
      ?auto_682006 - SURFACE
      ?auto_682007 - SURFACE
      ?auto_682008 - SURFACE
      ?auto_682009 - SURFACE
      ?auto_682010 - SURFACE
      ?auto_682011 - SURFACE
    )
    :vars
    (
      ?auto_682014 - HOIST
      ?auto_682012 - PLACE
      ?auto_682013 - TRUCK
      ?auto_682016 - PLACE
      ?auto_682015 - HOIST
      ?auto_682017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_682014 ?auto_682012 ) ( SURFACE-AT ?auto_682010 ?auto_682012 ) ( CLEAR ?auto_682010 ) ( IS-CRATE ?auto_682011 ) ( not ( = ?auto_682010 ?auto_682011 ) ) ( AVAILABLE ?auto_682014 ) ( ON ?auto_682010 ?auto_682009 ) ( not ( = ?auto_682009 ?auto_682010 ) ) ( not ( = ?auto_682009 ?auto_682011 ) ) ( TRUCK-AT ?auto_682013 ?auto_682016 ) ( not ( = ?auto_682016 ?auto_682012 ) ) ( HOIST-AT ?auto_682015 ?auto_682016 ) ( not ( = ?auto_682014 ?auto_682015 ) ) ( AVAILABLE ?auto_682015 ) ( SURFACE-AT ?auto_682011 ?auto_682016 ) ( ON ?auto_682011 ?auto_682017 ) ( CLEAR ?auto_682011 ) ( not ( = ?auto_682010 ?auto_682017 ) ) ( not ( = ?auto_682011 ?auto_682017 ) ) ( not ( = ?auto_682009 ?auto_682017 ) ) ( ON ?auto_682000 ?auto_681999 ) ( ON ?auto_682001 ?auto_682000 ) ( ON ?auto_682002 ?auto_682001 ) ( ON ?auto_682003 ?auto_682002 ) ( ON ?auto_682004 ?auto_682003 ) ( ON ?auto_682005 ?auto_682004 ) ( ON ?auto_682006 ?auto_682005 ) ( ON ?auto_682007 ?auto_682006 ) ( ON ?auto_682008 ?auto_682007 ) ( ON ?auto_682009 ?auto_682008 ) ( not ( = ?auto_681999 ?auto_682000 ) ) ( not ( = ?auto_681999 ?auto_682001 ) ) ( not ( = ?auto_681999 ?auto_682002 ) ) ( not ( = ?auto_681999 ?auto_682003 ) ) ( not ( = ?auto_681999 ?auto_682004 ) ) ( not ( = ?auto_681999 ?auto_682005 ) ) ( not ( = ?auto_681999 ?auto_682006 ) ) ( not ( = ?auto_681999 ?auto_682007 ) ) ( not ( = ?auto_681999 ?auto_682008 ) ) ( not ( = ?auto_681999 ?auto_682009 ) ) ( not ( = ?auto_681999 ?auto_682010 ) ) ( not ( = ?auto_681999 ?auto_682011 ) ) ( not ( = ?auto_681999 ?auto_682017 ) ) ( not ( = ?auto_682000 ?auto_682001 ) ) ( not ( = ?auto_682000 ?auto_682002 ) ) ( not ( = ?auto_682000 ?auto_682003 ) ) ( not ( = ?auto_682000 ?auto_682004 ) ) ( not ( = ?auto_682000 ?auto_682005 ) ) ( not ( = ?auto_682000 ?auto_682006 ) ) ( not ( = ?auto_682000 ?auto_682007 ) ) ( not ( = ?auto_682000 ?auto_682008 ) ) ( not ( = ?auto_682000 ?auto_682009 ) ) ( not ( = ?auto_682000 ?auto_682010 ) ) ( not ( = ?auto_682000 ?auto_682011 ) ) ( not ( = ?auto_682000 ?auto_682017 ) ) ( not ( = ?auto_682001 ?auto_682002 ) ) ( not ( = ?auto_682001 ?auto_682003 ) ) ( not ( = ?auto_682001 ?auto_682004 ) ) ( not ( = ?auto_682001 ?auto_682005 ) ) ( not ( = ?auto_682001 ?auto_682006 ) ) ( not ( = ?auto_682001 ?auto_682007 ) ) ( not ( = ?auto_682001 ?auto_682008 ) ) ( not ( = ?auto_682001 ?auto_682009 ) ) ( not ( = ?auto_682001 ?auto_682010 ) ) ( not ( = ?auto_682001 ?auto_682011 ) ) ( not ( = ?auto_682001 ?auto_682017 ) ) ( not ( = ?auto_682002 ?auto_682003 ) ) ( not ( = ?auto_682002 ?auto_682004 ) ) ( not ( = ?auto_682002 ?auto_682005 ) ) ( not ( = ?auto_682002 ?auto_682006 ) ) ( not ( = ?auto_682002 ?auto_682007 ) ) ( not ( = ?auto_682002 ?auto_682008 ) ) ( not ( = ?auto_682002 ?auto_682009 ) ) ( not ( = ?auto_682002 ?auto_682010 ) ) ( not ( = ?auto_682002 ?auto_682011 ) ) ( not ( = ?auto_682002 ?auto_682017 ) ) ( not ( = ?auto_682003 ?auto_682004 ) ) ( not ( = ?auto_682003 ?auto_682005 ) ) ( not ( = ?auto_682003 ?auto_682006 ) ) ( not ( = ?auto_682003 ?auto_682007 ) ) ( not ( = ?auto_682003 ?auto_682008 ) ) ( not ( = ?auto_682003 ?auto_682009 ) ) ( not ( = ?auto_682003 ?auto_682010 ) ) ( not ( = ?auto_682003 ?auto_682011 ) ) ( not ( = ?auto_682003 ?auto_682017 ) ) ( not ( = ?auto_682004 ?auto_682005 ) ) ( not ( = ?auto_682004 ?auto_682006 ) ) ( not ( = ?auto_682004 ?auto_682007 ) ) ( not ( = ?auto_682004 ?auto_682008 ) ) ( not ( = ?auto_682004 ?auto_682009 ) ) ( not ( = ?auto_682004 ?auto_682010 ) ) ( not ( = ?auto_682004 ?auto_682011 ) ) ( not ( = ?auto_682004 ?auto_682017 ) ) ( not ( = ?auto_682005 ?auto_682006 ) ) ( not ( = ?auto_682005 ?auto_682007 ) ) ( not ( = ?auto_682005 ?auto_682008 ) ) ( not ( = ?auto_682005 ?auto_682009 ) ) ( not ( = ?auto_682005 ?auto_682010 ) ) ( not ( = ?auto_682005 ?auto_682011 ) ) ( not ( = ?auto_682005 ?auto_682017 ) ) ( not ( = ?auto_682006 ?auto_682007 ) ) ( not ( = ?auto_682006 ?auto_682008 ) ) ( not ( = ?auto_682006 ?auto_682009 ) ) ( not ( = ?auto_682006 ?auto_682010 ) ) ( not ( = ?auto_682006 ?auto_682011 ) ) ( not ( = ?auto_682006 ?auto_682017 ) ) ( not ( = ?auto_682007 ?auto_682008 ) ) ( not ( = ?auto_682007 ?auto_682009 ) ) ( not ( = ?auto_682007 ?auto_682010 ) ) ( not ( = ?auto_682007 ?auto_682011 ) ) ( not ( = ?auto_682007 ?auto_682017 ) ) ( not ( = ?auto_682008 ?auto_682009 ) ) ( not ( = ?auto_682008 ?auto_682010 ) ) ( not ( = ?auto_682008 ?auto_682011 ) ) ( not ( = ?auto_682008 ?auto_682017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682009 ?auto_682010 ?auto_682011 )
      ( MAKE-12CRATE-VERIFY ?auto_681999 ?auto_682000 ?auto_682001 ?auto_682002 ?auto_682003 ?auto_682004 ?auto_682005 ?auto_682006 ?auto_682007 ?auto_682008 ?auto_682009 ?auto_682010 ?auto_682011 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682162 - SURFACE
      ?auto_682163 - SURFACE
      ?auto_682164 - SURFACE
      ?auto_682165 - SURFACE
      ?auto_682166 - SURFACE
      ?auto_682167 - SURFACE
      ?auto_682168 - SURFACE
      ?auto_682169 - SURFACE
      ?auto_682170 - SURFACE
      ?auto_682171 - SURFACE
      ?auto_682172 - SURFACE
      ?auto_682173 - SURFACE
      ?auto_682174 - SURFACE
    )
    :vars
    (
      ?auto_682180 - HOIST
      ?auto_682177 - PLACE
      ?auto_682179 - PLACE
      ?auto_682176 - HOIST
      ?auto_682178 - SURFACE
      ?auto_682175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682180 ?auto_682177 ) ( SURFACE-AT ?auto_682173 ?auto_682177 ) ( CLEAR ?auto_682173 ) ( IS-CRATE ?auto_682174 ) ( not ( = ?auto_682173 ?auto_682174 ) ) ( AVAILABLE ?auto_682180 ) ( ON ?auto_682173 ?auto_682172 ) ( not ( = ?auto_682172 ?auto_682173 ) ) ( not ( = ?auto_682172 ?auto_682174 ) ) ( not ( = ?auto_682179 ?auto_682177 ) ) ( HOIST-AT ?auto_682176 ?auto_682179 ) ( not ( = ?auto_682180 ?auto_682176 ) ) ( AVAILABLE ?auto_682176 ) ( SURFACE-AT ?auto_682174 ?auto_682179 ) ( ON ?auto_682174 ?auto_682178 ) ( CLEAR ?auto_682174 ) ( not ( = ?auto_682173 ?auto_682178 ) ) ( not ( = ?auto_682174 ?auto_682178 ) ) ( not ( = ?auto_682172 ?auto_682178 ) ) ( TRUCK-AT ?auto_682175 ?auto_682177 ) ( ON ?auto_682163 ?auto_682162 ) ( ON ?auto_682164 ?auto_682163 ) ( ON ?auto_682165 ?auto_682164 ) ( ON ?auto_682166 ?auto_682165 ) ( ON ?auto_682167 ?auto_682166 ) ( ON ?auto_682168 ?auto_682167 ) ( ON ?auto_682169 ?auto_682168 ) ( ON ?auto_682170 ?auto_682169 ) ( ON ?auto_682171 ?auto_682170 ) ( ON ?auto_682172 ?auto_682171 ) ( not ( = ?auto_682162 ?auto_682163 ) ) ( not ( = ?auto_682162 ?auto_682164 ) ) ( not ( = ?auto_682162 ?auto_682165 ) ) ( not ( = ?auto_682162 ?auto_682166 ) ) ( not ( = ?auto_682162 ?auto_682167 ) ) ( not ( = ?auto_682162 ?auto_682168 ) ) ( not ( = ?auto_682162 ?auto_682169 ) ) ( not ( = ?auto_682162 ?auto_682170 ) ) ( not ( = ?auto_682162 ?auto_682171 ) ) ( not ( = ?auto_682162 ?auto_682172 ) ) ( not ( = ?auto_682162 ?auto_682173 ) ) ( not ( = ?auto_682162 ?auto_682174 ) ) ( not ( = ?auto_682162 ?auto_682178 ) ) ( not ( = ?auto_682163 ?auto_682164 ) ) ( not ( = ?auto_682163 ?auto_682165 ) ) ( not ( = ?auto_682163 ?auto_682166 ) ) ( not ( = ?auto_682163 ?auto_682167 ) ) ( not ( = ?auto_682163 ?auto_682168 ) ) ( not ( = ?auto_682163 ?auto_682169 ) ) ( not ( = ?auto_682163 ?auto_682170 ) ) ( not ( = ?auto_682163 ?auto_682171 ) ) ( not ( = ?auto_682163 ?auto_682172 ) ) ( not ( = ?auto_682163 ?auto_682173 ) ) ( not ( = ?auto_682163 ?auto_682174 ) ) ( not ( = ?auto_682163 ?auto_682178 ) ) ( not ( = ?auto_682164 ?auto_682165 ) ) ( not ( = ?auto_682164 ?auto_682166 ) ) ( not ( = ?auto_682164 ?auto_682167 ) ) ( not ( = ?auto_682164 ?auto_682168 ) ) ( not ( = ?auto_682164 ?auto_682169 ) ) ( not ( = ?auto_682164 ?auto_682170 ) ) ( not ( = ?auto_682164 ?auto_682171 ) ) ( not ( = ?auto_682164 ?auto_682172 ) ) ( not ( = ?auto_682164 ?auto_682173 ) ) ( not ( = ?auto_682164 ?auto_682174 ) ) ( not ( = ?auto_682164 ?auto_682178 ) ) ( not ( = ?auto_682165 ?auto_682166 ) ) ( not ( = ?auto_682165 ?auto_682167 ) ) ( not ( = ?auto_682165 ?auto_682168 ) ) ( not ( = ?auto_682165 ?auto_682169 ) ) ( not ( = ?auto_682165 ?auto_682170 ) ) ( not ( = ?auto_682165 ?auto_682171 ) ) ( not ( = ?auto_682165 ?auto_682172 ) ) ( not ( = ?auto_682165 ?auto_682173 ) ) ( not ( = ?auto_682165 ?auto_682174 ) ) ( not ( = ?auto_682165 ?auto_682178 ) ) ( not ( = ?auto_682166 ?auto_682167 ) ) ( not ( = ?auto_682166 ?auto_682168 ) ) ( not ( = ?auto_682166 ?auto_682169 ) ) ( not ( = ?auto_682166 ?auto_682170 ) ) ( not ( = ?auto_682166 ?auto_682171 ) ) ( not ( = ?auto_682166 ?auto_682172 ) ) ( not ( = ?auto_682166 ?auto_682173 ) ) ( not ( = ?auto_682166 ?auto_682174 ) ) ( not ( = ?auto_682166 ?auto_682178 ) ) ( not ( = ?auto_682167 ?auto_682168 ) ) ( not ( = ?auto_682167 ?auto_682169 ) ) ( not ( = ?auto_682167 ?auto_682170 ) ) ( not ( = ?auto_682167 ?auto_682171 ) ) ( not ( = ?auto_682167 ?auto_682172 ) ) ( not ( = ?auto_682167 ?auto_682173 ) ) ( not ( = ?auto_682167 ?auto_682174 ) ) ( not ( = ?auto_682167 ?auto_682178 ) ) ( not ( = ?auto_682168 ?auto_682169 ) ) ( not ( = ?auto_682168 ?auto_682170 ) ) ( not ( = ?auto_682168 ?auto_682171 ) ) ( not ( = ?auto_682168 ?auto_682172 ) ) ( not ( = ?auto_682168 ?auto_682173 ) ) ( not ( = ?auto_682168 ?auto_682174 ) ) ( not ( = ?auto_682168 ?auto_682178 ) ) ( not ( = ?auto_682169 ?auto_682170 ) ) ( not ( = ?auto_682169 ?auto_682171 ) ) ( not ( = ?auto_682169 ?auto_682172 ) ) ( not ( = ?auto_682169 ?auto_682173 ) ) ( not ( = ?auto_682169 ?auto_682174 ) ) ( not ( = ?auto_682169 ?auto_682178 ) ) ( not ( = ?auto_682170 ?auto_682171 ) ) ( not ( = ?auto_682170 ?auto_682172 ) ) ( not ( = ?auto_682170 ?auto_682173 ) ) ( not ( = ?auto_682170 ?auto_682174 ) ) ( not ( = ?auto_682170 ?auto_682178 ) ) ( not ( = ?auto_682171 ?auto_682172 ) ) ( not ( = ?auto_682171 ?auto_682173 ) ) ( not ( = ?auto_682171 ?auto_682174 ) ) ( not ( = ?auto_682171 ?auto_682178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682172 ?auto_682173 ?auto_682174 )
      ( MAKE-12CRATE-VERIFY ?auto_682162 ?auto_682163 ?auto_682164 ?auto_682165 ?auto_682166 ?auto_682167 ?auto_682168 ?auto_682169 ?auto_682170 ?auto_682171 ?auto_682172 ?auto_682173 ?auto_682174 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682325 - SURFACE
      ?auto_682326 - SURFACE
      ?auto_682327 - SURFACE
      ?auto_682328 - SURFACE
      ?auto_682329 - SURFACE
      ?auto_682330 - SURFACE
      ?auto_682331 - SURFACE
      ?auto_682332 - SURFACE
      ?auto_682333 - SURFACE
      ?auto_682334 - SURFACE
      ?auto_682335 - SURFACE
      ?auto_682336 - SURFACE
      ?auto_682337 - SURFACE
    )
    :vars
    (
      ?auto_682340 - HOIST
      ?auto_682341 - PLACE
      ?auto_682342 - PLACE
      ?auto_682343 - HOIST
      ?auto_682339 - SURFACE
      ?auto_682338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682340 ?auto_682341 ) ( IS-CRATE ?auto_682337 ) ( not ( = ?auto_682336 ?auto_682337 ) ) ( not ( = ?auto_682335 ?auto_682336 ) ) ( not ( = ?auto_682335 ?auto_682337 ) ) ( not ( = ?auto_682342 ?auto_682341 ) ) ( HOIST-AT ?auto_682343 ?auto_682342 ) ( not ( = ?auto_682340 ?auto_682343 ) ) ( AVAILABLE ?auto_682343 ) ( SURFACE-AT ?auto_682337 ?auto_682342 ) ( ON ?auto_682337 ?auto_682339 ) ( CLEAR ?auto_682337 ) ( not ( = ?auto_682336 ?auto_682339 ) ) ( not ( = ?auto_682337 ?auto_682339 ) ) ( not ( = ?auto_682335 ?auto_682339 ) ) ( TRUCK-AT ?auto_682338 ?auto_682341 ) ( SURFACE-AT ?auto_682335 ?auto_682341 ) ( CLEAR ?auto_682335 ) ( LIFTING ?auto_682340 ?auto_682336 ) ( IS-CRATE ?auto_682336 ) ( ON ?auto_682326 ?auto_682325 ) ( ON ?auto_682327 ?auto_682326 ) ( ON ?auto_682328 ?auto_682327 ) ( ON ?auto_682329 ?auto_682328 ) ( ON ?auto_682330 ?auto_682329 ) ( ON ?auto_682331 ?auto_682330 ) ( ON ?auto_682332 ?auto_682331 ) ( ON ?auto_682333 ?auto_682332 ) ( ON ?auto_682334 ?auto_682333 ) ( ON ?auto_682335 ?auto_682334 ) ( not ( = ?auto_682325 ?auto_682326 ) ) ( not ( = ?auto_682325 ?auto_682327 ) ) ( not ( = ?auto_682325 ?auto_682328 ) ) ( not ( = ?auto_682325 ?auto_682329 ) ) ( not ( = ?auto_682325 ?auto_682330 ) ) ( not ( = ?auto_682325 ?auto_682331 ) ) ( not ( = ?auto_682325 ?auto_682332 ) ) ( not ( = ?auto_682325 ?auto_682333 ) ) ( not ( = ?auto_682325 ?auto_682334 ) ) ( not ( = ?auto_682325 ?auto_682335 ) ) ( not ( = ?auto_682325 ?auto_682336 ) ) ( not ( = ?auto_682325 ?auto_682337 ) ) ( not ( = ?auto_682325 ?auto_682339 ) ) ( not ( = ?auto_682326 ?auto_682327 ) ) ( not ( = ?auto_682326 ?auto_682328 ) ) ( not ( = ?auto_682326 ?auto_682329 ) ) ( not ( = ?auto_682326 ?auto_682330 ) ) ( not ( = ?auto_682326 ?auto_682331 ) ) ( not ( = ?auto_682326 ?auto_682332 ) ) ( not ( = ?auto_682326 ?auto_682333 ) ) ( not ( = ?auto_682326 ?auto_682334 ) ) ( not ( = ?auto_682326 ?auto_682335 ) ) ( not ( = ?auto_682326 ?auto_682336 ) ) ( not ( = ?auto_682326 ?auto_682337 ) ) ( not ( = ?auto_682326 ?auto_682339 ) ) ( not ( = ?auto_682327 ?auto_682328 ) ) ( not ( = ?auto_682327 ?auto_682329 ) ) ( not ( = ?auto_682327 ?auto_682330 ) ) ( not ( = ?auto_682327 ?auto_682331 ) ) ( not ( = ?auto_682327 ?auto_682332 ) ) ( not ( = ?auto_682327 ?auto_682333 ) ) ( not ( = ?auto_682327 ?auto_682334 ) ) ( not ( = ?auto_682327 ?auto_682335 ) ) ( not ( = ?auto_682327 ?auto_682336 ) ) ( not ( = ?auto_682327 ?auto_682337 ) ) ( not ( = ?auto_682327 ?auto_682339 ) ) ( not ( = ?auto_682328 ?auto_682329 ) ) ( not ( = ?auto_682328 ?auto_682330 ) ) ( not ( = ?auto_682328 ?auto_682331 ) ) ( not ( = ?auto_682328 ?auto_682332 ) ) ( not ( = ?auto_682328 ?auto_682333 ) ) ( not ( = ?auto_682328 ?auto_682334 ) ) ( not ( = ?auto_682328 ?auto_682335 ) ) ( not ( = ?auto_682328 ?auto_682336 ) ) ( not ( = ?auto_682328 ?auto_682337 ) ) ( not ( = ?auto_682328 ?auto_682339 ) ) ( not ( = ?auto_682329 ?auto_682330 ) ) ( not ( = ?auto_682329 ?auto_682331 ) ) ( not ( = ?auto_682329 ?auto_682332 ) ) ( not ( = ?auto_682329 ?auto_682333 ) ) ( not ( = ?auto_682329 ?auto_682334 ) ) ( not ( = ?auto_682329 ?auto_682335 ) ) ( not ( = ?auto_682329 ?auto_682336 ) ) ( not ( = ?auto_682329 ?auto_682337 ) ) ( not ( = ?auto_682329 ?auto_682339 ) ) ( not ( = ?auto_682330 ?auto_682331 ) ) ( not ( = ?auto_682330 ?auto_682332 ) ) ( not ( = ?auto_682330 ?auto_682333 ) ) ( not ( = ?auto_682330 ?auto_682334 ) ) ( not ( = ?auto_682330 ?auto_682335 ) ) ( not ( = ?auto_682330 ?auto_682336 ) ) ( not ( = ?auto_682330 ?auto_682337 ) ) ( not ( = ?auto_682330 ?auto_682339 ) ) ( not ( = ?auto_682331 ?auto_682332 ) ) ( not ( = ?auto_682331 ?auto_682333 ) ) ( not ( = ?auto_682331 ?auto_682334 ) ) ( not ( = ?auto_682331 ?auto_682335 ) ) ( not ( = ?auto_682331 ?auto_682336 ) ) ( not ( = ?auto_682331 ?auto_682337 ) ) ( not ( = ?auto_682331 ?auto_682339 ) ) ( not ( = ?auto_682332 ?auto_682333 ) ) ( not ( = ?auto_682332 ?auto_682334 ) ) ( not ( = ?auto_682332 ?auto_682335 ) ) ( not ( = ?auto_682332 ?auto_682336 ) ) ( not ( = ?auto_682332 ?auto_682337 ) ) ( not ( = ?auto_682332 ?auto_682339 ) ) ( not ( = ?auto_682333 ?auto_682334 ) ) ( not ( = ?auto_682333 ?auto_682335 ) ) ( not ( = ?auto_682333 ?auto_682336 ) ) ( not ( = ?auto_682333 ?auto_682337 ) ) ( not ( = ?auto_682333 ?auto_682339 ) ) ( not ( = ?auto_682334 ?auto_682335 ) ) ( not ( = ?auto_682334 ?auto_682336 ) ) ( not ( = ?auto_682334 ?auto_682337 ) ) ( not ( = ?auto_682334 ?auto_682339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682335 ?auto_682336 ?auto_682337 )
      ( MAKE-12CRATE-VERIFY ?auto_682325 ?auto_682326 ?auto_682327 ?auto_682328 ?auto_682329 ?auto_682330 ?auto_682331 ?auto_682332 ?auto_682333 ?auto_682334 ?auto_682335 ?auto_682336 ?auto_682337 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_682488 - SURFACE
      ?auto_682489 - SURFACE
      ?auto_682490 - SURFACE
      ?auto_682491 - SURFACE
      ?auto_682492 - SURFACE
      ?auto_682493 - SURFACE
      ?auto_682494 - SURFACE
      ?auto_682495 - SURFACE
      ?auto_682496 - SURFACE
      ?auto_682497 - SURFACE
      ?auto_682498 - SURFACE
      ?auto_682499 - SURFACE
      ?auto_682500 - SURFACE
    )
    :vars
    (
      ?auto_682506 - HOIST
      ?auto_682505 - PLACE
      ?auto_682503 - PLACE
      ?auto_682501 - HOIST
      ?auto_682504 - SURFACE
      ?auto_682502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682506 ?auto_682505 ) ( IS-CRATE ?auto_682500 ) ( not ( = ?auto_682499 ?auto_682500 ) ) ( not ( = ?auto_682498 ?auto_682499 ) ) ( not ( = ?auto_682498 ?auto_682500 ) ) ( not ( = ?auto_682503 ?auto_682505 ) ) ( HOIST-AT ?auto_682501 ?auto_682503 ) ( not ( = ?auto_682506 ?auto_682501 ) ) ( AVAILABLE ?auto_682501 ) ( SURFACE-AT ?auto_682500 ?auto_682503 ) ( ON ?auto_682500 ?auto_682504 ) ( CLEAR ?auto_682500 ) ( not ( = ?auto_682499 ?auto_682504 ) ) ( not ( = ?auto_682500 ?auto_682504 ) ) ( not ( = ?auto_682498 ?auto_682504 ) ) ( TRUCK-AT ?auto_682502 ?auto_682505 ) ( SURFACE-AT ?auto_682498 ?auto_682505 ) ( CLEAR ?auto_682498 ) ( IS-CRATE ?auto_682499 ) ( AVAILABLE ?auto_682506 ) ( IN ?auto_682499 ?auto_682502 ) ( ON ?auto_682489 ?auto_682488 ) ( ON ?auto_682490 ?auto_682489 ) ( ON ?auto_682491 ?auto_682490 ) ( ON ?auto_682492 ?auto_682491 ) ( ON ?auto_682493 ?auto_682492 ) ( ON ?auto_682494 ?auto_682493 ) ( ON ?auto_682495 ?auto_682494 ) ( ON ?auto_682496 ?auto_682495 ) ( ON ?auto_682497 ?auto_682496 ) ( ON ?auto_682498 ?auto_682497 ) ( not ( = ?auto_682488 ?auto_682489 ) ) ( not ( = ?auto_682488 ?auto_682490 ) ) ( not ( = ?auto_682488 ?auto_682491 ) ) ( not ( = ?auto_682488 ?auto_682492 ) ) ( not ( = ?auto_682488 ?auto_682493 ) ) ( not ( = ?auto_682488 ?auto_682494 ) ) ( not ( = ?auto_682488 ?auto_682495 ) ) ( not ( = ?auto_682488 ?auto_682496 ) ) ( not ( = ?auto_682488 ?auto_682497 ) ) ( not ( = ?auto_682488 ?auto_682498 ) ) ( not ( = ?auto_682488 ?auto_682499 ) ) ( not ( = ?auto_682488 ?auto_682500 ) ) ( not ( = ?auto_682488 ?auto_682504 ) ) ( not ( = ?auto_682489 ?auto_682490 ) ) ( not ( = ?auto_682489 ?auto_682491 ) ) ( not ( = ?auto_682489 ?auto_682492 ) ) ( not ( = ?auto_682489 ?auto_682493 ) ) ( not ( = ?auto_682489 ?auto_682494 ) ) ( not ( = ?auto_682489 ?auto_682495 ) ) ( not ( = ?auto_682489 ?auto_682496 ) ) ( not ( = ?auto_682489 ?auto_682497 ) ) ( not ( = ?auto_682489 ?auto_682498 ) ) ( not ( = ?auto_682489 ?auto_682499 ) ) ( not ( = ?auto_682489 ?auto_682500 ) ) ( not ( = ?auto_682489 ?auto_682504 ) ) ( not ( = ?auto_682490 ?auto_682491 ) ) ( not ( = ?auto_682490 ?auto_682492 ) ) ( not ( = ?auto_682490 ?auto_682493 ) ) ( not ( = ?auto_682490 ?auto_682494 ) ) ( not ( = ?auto_682490 ?auto_682495 ) ) ( not ( = ?auto_682490 ?auto_682496 ) ) ( not ( = ?auto_682490 ?auto_682497 ) ) ( not ( = ?auto_682490 ?auto_682498 ) ) ( not ( = ?auto_682490 ?auto_682499 ) ) ( not ( = ?auto_682490 ?auto_682500 ) ) ( not ( = ?auto_682490 ?auto_682504 ) ) ( not ( = ?auto_682491 ?auto_682492 ) ) ( not ( = ?auto_682491 ?auto_682493 ) ) ( not ( = ?auto_682491 ?auto_682494 ) ) ( not ( = ?auto_682491 ?auto_682495 ) ) ( not ( = ?auto_682491 ?auto_682496 ) ) ( not ( = ?auto_682491 ?auto_682497 ) ) ( not ( = ?auto_682491 ?auto_682498 ) ) ( not ( = ?auto_682491 ?auto_682499 ) ) ( not ( = ?auto_682491 ?auto_682500 ) ) ( not ( = ?auto_682491 ?auto_682504 ) ) ( not ( = ?auto_682492 ?auto_682493 ) ) ( not ( = ?auto_682492 ?auto_682494 ) ) ( not ( = ?auto_682492 ?auto_682495 ) ) ( not ( = ?auto_682492 ?auto_682496 ) ) ( not ( = ?auto_682492 ?auto_682497 ) ) ( not ( = ?auto_682492 ?auto_682498 ) ) ( not ( = ?auto_682492 ?auto_682499 ) ) ( not ( = ?auto_682492 ?auto_682500 ) ) ( not ( = ?auto_682492 ?auto_682504 ) ) ( not ( = ?auto_682493 ?auto_682494 ) ) ( not ( = ?auto_682493 ?auto_682495 ) ) ( not ( = ?auto_682493 ?auto_682496 ) ) ( not ( = ?auto_682493 ?auto_682497 ) ) ( not ( = ?auto_682493 ?auto_682498 ) ) ( not ( = ?auto_682493 ?auto_682499 ) ) ( not ( = ?auto_682493 ?auto_682500 ) ) ( not ( = ?auto_682493 ?auto_682504 ) ) ( not ( = ?auto_682494 ?auto_682495 ) ) ( not ( = ?auto_682494 ?auto_682496 ) ) ( not ( = ?auto_682494 ?auto_682497 ) ) ( not ( = ?auto_682494 ?auto_682498 ) ) ( not ( = ?auto_682494 ?auto_682499 ) ) ( not ( = ?auto_682494 ?auto_682500 ) ) ( not ( = ?auto_682494 ?auto_682504 ) ) ( not ( = ?auto_682495 ?auto_682496 ) ) ( not ( = ?auto_682495 ?auto_682497 ) ) ( not ( = ?auto_682495 ?auto_682498 ) ) ( not ( = ?auto_682495 ?auto_682499 ) ) ( not ( = ?auto_682495 ?auto_682500 ) ) ( not ( = ?auto_682495 ?auto_682504 ) ) ( not ( = ?auto_682496 ?auto_682497 ) ) ( not ( = ?auto_682496 ?auto_682498 ) ) ( not ( = ?auto_682496 ?auto_682499 ) ) ( not ( = ?auto_682496 ?auto_682500 ) ) ( not ( = ?auto_682496 ?auto_682504 ) ) ( not ( = ?auto_682497 ?auto_682498 ) ) ( not ( = ?auto_682497 ?auto_682499 ) ) ( not ( = ?auto_682497 ?auto_682500 ) ) ( not ( = ?auto_682497 ?auto_682504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_682498 ?auto_682499 ?auto_682500 )
      ( MAKE-12CRATE-VERIFY ?auto_682488 ?auto_682489 ?auto_682490 ?auto_682491 ?auto_682492 ?auto_682493 ?auto_682494 ?auto_682495 ?auto_682496 ?auto_682497 ?auto_682498 ?auto_682499 ?auto_682500 ) )
  )

)

