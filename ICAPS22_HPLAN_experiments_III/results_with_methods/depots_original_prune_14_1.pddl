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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259312 - SURFACE
      ?auto_1259313 - SURFACE
    )
    :vars
    (
      ?auto_1259314 - HOIST
      ?auto_1259315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259314 ?auto_1259315 ) ( SURFACE-AT ?auto_1259312 ?auto_1259315 ) ( CLEAR ?auto_1259312 ) ( LIFTING ?auto_1259314 ?auto_1259313 ) ( IS-CRATE ?auto_1259313 ) ( not ( = ?auto_1259312 ?auto_1259313 ) ) )
    :subtasks
    ( ( !DROP ?auto_1259314 ?auto_1259313 ?auto_1259312 ?auto_1259315 )
      ( MAKE-1CRATE-VERIFY ?auto_1259312 ?auto_1259313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259316 - SURFACE
      ?auto_1259317 - SURFACE
    )
    :vars
    (
      ?auto_1259319 - HOIST
      ?auto_1259318 - PLACE
      ?auto_1259320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259319 ?auto_1259318 ) ( SURFACE-AT ?auto_1259316 ?auto_1259318 ) ( CLEAR ?auto_1259316 ) ( IS-CRATE ?auto_1259317 ) ( not ( = ?auto_1259316 ?auto_1259317 ) ) ( TRUCK-AT ?auto_1259320 ?auto_1259318 ) ( AVAILABLE ?auto_1259319 ) ( IN ?auto_1259317 ?auto_1259320 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1259319 ?auto_1259317 ?auto_1259320 ?auto_1259318 )
      ( MAKE-1CRATE ?auto_1259316 ?auto_1259317 )
      ( MAKE-1CRATE-VERIFY ?auto_1259316 ?auto_1259317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259321 - SURFACE
      ?auto_1259322 - SURFACE
    )
    :vars
    (
      ?auto_1259323 - HOIST
      ?auto_1259325 - PLACE
      ?auto_1259324 - TRUCK
      ?auto_1259326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259323 ?auto_1259325 ) ( SURFACE-AT ?auto_1259321 ?auto_1259325 ) ( CLEAR ?auto_1259321 ) ( IS-CRATE ?auto_1259322 ) ( not ( = ?auto_1259321 ?auto_1259322 ) ) ( AVAILABLE ?auto_1259323 ) ( IN ?auto_1259322 ?auto_1259324 ) ( TRUCK-AT ?auto_1259324 ?auto_1259326 ) ( not ( = ?auto_1259326 ?auto_1259325 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259324 ?auto_1259326 ?auto_1259325 )
      ( MAKE-1CRATE ?auto_1259321 ?auto_1259322 )
      ( MAKE-1CRATE-VERIFY ?auto_1259321 ?auto_1259322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259327 - SURFACE
      ?auto_1259328 - SURFACE
    )
    :vars
    (
      ?auto_1259330 - HOIST
      ?auto_1259332 - PLACE
      ?auto_1259329 - TRUCK
      ?auto_1259331 - PLACE
      ?auto_1259333 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259330 ?auto_1259332 ) ( SURFACE-AT ?auto_1259327 ?auto_1259332 ) ( CLEAR ?auto_1259327 ) ( IS-CRATE ?auto_1259328 ) ( not ( = ?auto_1259327 ?auto_1259328 ) ) ( AVAILABLE ?auto_1259330 ) ( TRUCK-AT ?auto_1259329 ?auto_1259331 ) ( not ( = ?auto_1259331 ?auto_1259332 ) ) ( HOIST-AT ?auto_1259333 ?auto_1259331 ) ( LIFTING ?auto_1259333 ?auto_1259328 ) ( not ( = ?auto_1259330 ?auto_1259333 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1259333 ?auto_1259328 ?auto_1259329 ?auto_1259331 )
      ( MAKE-1CRATE ?auto_1259327 ?auto_1259328 )
      ( MAKE-1CRATE-VERIFY ?auto_1259327 ?auto_1259328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259334 - SURFACE
      ?auto_1259335 - SURFACE
    )
    :vars
    (
      ?auto_1259336 - HOIST
      ?auto_1259338 - PLACE
      ?auto_1259337 - TRUCK
      ?auto_1259339 - PLACE
      ?auto_1259340 - HOIST
      ?auto_1259341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259336 ?auto_1259338 ) ( SURFACE-AT ?auto_1259334 ?auto_1259338 ) ( CLEAR ?auto_1259334 ) ( IS-CRATE ?auto_1259335 ) ( not ( = ?auto_1259334 ?auto_1259335 ) ) ( AVAILABLE ?auto_1259336 ) ( TRUCK-AT ?auto_1259337 ?auto_1259339 ) ( not ( = ?auto_1259339 ?auto_1259338 ) ) ( HOIST-AT ?auto_1259340 ?auto_1259339 ) ( not ( = ?auto_1259336 ?auto_1259340 ) ) ( AVAILABLE ?auto_1259340 ) ( SURFACE-AT ?auto_1259335 ?auto_1259339 ) ( ON ?auto_1259335 ?auto_1259341 ) ( CLEAR ?auto_1259335 ) ( not ( = ?auto_1259334 ?auto_1259341 ) ) ( not ( = ?auto_1259335 ?auto_1259341 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1259340 ?auto_1259335 ?auto_1259341 ?auto_1259339 )
      ( MAKE-1CRATE ?auto_1259334 ?auto_1259335 )
      ( MAKE-1CRATE-VERIFY ?auto_1259334 ?auto_1259335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259342 - SURFACE
      ?auto_1259343 - SURFACE
    )
    :vars
    (
      ?auto_1259344 - HOIST
      ?auto_1259349 - PLACE
      ?auto_1259347 - PLACE
      ?auto_1259346 - HOIST
      ?auto_1259345 - SURFACE
      ?auto_1259348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259344 ?auto_1259349 ) ( SURFACE-AT ?auto_1259342 ?auto_1259349 ) ( CLEAR ?auto_1259342 ) ( IS-CRATE ?auto_1259343 ) ( not ( = ?auto_1259342 ?auto_1259343 ) ) ( AVAILABLE ?auto_1259344 ) ( not ( = ?auto_1259347 ?auto_1259349 ) ) ( HOIST-AT ?auto_1259346 ?auto_1259347 ) ( not ( = ?auto_1259344 ?auto_1259346 ) ) ( AVAILABLE ?auto_1259346 ) ( SURFACE-AT ?auto_1259343 ?auto_1259347 ) ( ON ?auto_1259343 ?auto_1259345 ) ( CLEAR ?auto_1259343 ) ( not ( = ?auto_1259342 ?auto_1259345 ) ) ( not ( = ?auto_1259343 ?auto_1259345 ) ) ( TRUCK-AT ?auto_1259348 ?auto_1259349 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259348 ?auto_1259349 ?auto_1259347 )
      ( MAKE-1CRATE ?auto_1259342 ?auto_1259343 )
      ( MAKE-1CRATE-VERIFY ?auto_1259342 ?auto_1259343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259359 - SURFACE
      ?auto_1259360 - SURFACE
      ?auto_1259361 - SURFACE
    )
    :vars
    (
      ?auto_1259363 - HOIST
      ?auto_1259362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259363 ?auto_1259362 ) ( SURFACE-AT ?auto_1259360 ?auto_1259362 ) ( CLEAR ?auto_1259360 ) ( LIFTING ?auto_1259363 ?auto_1259361 ) ( IS-CRATE ?auto_1259361 ) ( not ( = ?auto_1259360 ?auto_1259361 ) ) ( ON ?auto_1259360 ?auto_1259359 ) ( not ( = ?auto_1259359 ?auto_1259360 ) ) ( not ( = ?auto_1259359 ?auto_1259361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259360 ?auto_1259361 )
      ( MAKE-2CRATE-VERIFY ?auto_1259359 ?auto_1259360 ?auto_1259361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259369 - SURFACE
      ?auto_1259370 - SURFACE
      ?auto_1259371 - SURFACE
    )
    :vars
    (
      ?auto_1259374 - HOIST
      ?auto_1259373 - PLACE
      ?auto_1259372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259374 ?auto_1259373 ) ( SURFACE-AT ?auto_1259370 ?auto_1259373 ) ( CLEAR ?auto_1259370 ) ( IS-CRATE ?auto_1259371 ) ( not ( = ?auto_1259370 ?auto_1259371 ) ) ( TRUCK-AT ?auto_1259372 ?auto_1259373 ) ( AVAILABLE ?auto_1259374 ) ( IN ?auto_1259371 ?auto_1259372 ) ( ON ?auto_1259370 ?auto_1259369 ) ( not ( = ?auto_1259369 ?auto_1259370 ) ) ( not ( = ?auto_1259369 ?auto_1259371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259370 ?auto_1259371 )
      ( MAKE-2CRATE-VERIFY ?auto_1259369 ?auto_1259370 ?auto_1259371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259375 - SURFACE
      ?auto_1259376 - SURFACE
    )
    :vars
    (
      ?auto_1259378 - HOIST
      ?auto_1259377 - PLACE
      ?auto_1259380 - TRUCK
      ?auto_1259379 - SURFACE
      ?auto_1259381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259378 ?auto_1259377 ) ( SURFACE-AT ?auto_1259375 ?auto_1259377 ) ( CLEAR ?auto_1259375 ) ( IS-CRATE ?auto_1259376 ) ( not ( = ?auto_1259375 ?auto_1259376 ) ) ( AVAILABLE ?auto_1259378 ) ( IN ?auto_1259376 ?auto_1259380 ) ( ON ?auto_1259375 ?auto_1259379 ) ( not ( = ?auto_1259379 ?auto_1259375 ) ) ( not ( = ?auto_1259379 ?auto_1259376 ) ) ( TRUCK-AT ?auto_1259380 ?auto_1259381 ) ( not ( = ?auto_1259381 ?auto_1259377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259380 ?auto_1259381 ?auto_1259377 )
      ( MAKE-2CRATE ?auto_1259379 ?auto_1259375 ?auto_1259376 )
      ( MAKE-1CRATE-VERIFY ?auto_1259375 ?auto_1259376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259382 - SURFACE
      ?auto_1259383 - SURFACE
      ?auto_1259384 - SURFACE
    )
    :vars
    (
      ?auto_1259386 - HOIST
      ?auto_1259388 - PLACE
      ?auto_1259385 - TRUCK
      ?auto_1259387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259386 ?auto_1259388 ) ( SURFACE-AT ?auto_1259383 ?auto_1259388 ) ( CLEAR ?auto_1259383 ) ( IS-CRATE ?auto_1259384 ) ( not ( = ?auto_1259383 ?auto_1259384 ) ) ( AVAILABLE ?auto_1259386 ) ( IN ?auto_1259384 ?auto_1259385 ) ( ON ?auto_1259383 ?auto_1259382 ) ( not ( = ?auto_1259382 ?auto_1259383 ) ) ( not ( = ?auto_1259382 ?auto_1259384 ) ) ( TRUCK-AT ?auto_1259385 ?auto_1259387 ) ( not ( = ?auto_1259387 ?auto_1259388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259383 ?auto_1259384 )
      ( MAKE-2CRATE-VERIFY ?auto_1259382 ?auto_1259383 ?auto_1259384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259389 - SURFACE
      ?auto_1259390 - SURFACE
    )
    :vars
    (
      ?auto_1259394 - HOIST
      ?auto_1259391 - PLACE
      ?auto_1259395 - SURFACE
      ?auto_1259393 - TRUCK
      ?auto_1259392 - PLACE
      ?auto_1259396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259394 ?auto_1259391 ) ( SURFACE-AT ?auto_1259389 ?auto_1259391 ) ( CLEAR ?auto_1259389 ) ( IS-CRATE ?auto_1259390 ) ( not ( = ?auto_1259389 ?auto_1259390 ) ) ( AVAILABLE ?auto_1259394 ) ( ON ?auto_1259389 ?auto_1259395 ) ( not ( = ?auto_1259395 ?auto_1259389 ) ) ( not ( = ?auto_1259395 ?auto_1259390 ) ) ( TRUCK-AT ?auto_1259393 ?auto_1259392 ) ( not ( = ?auto_1259392 ?auto_1259391 ) ) ( HOIST-AT ?auto_1259396 ?auto_1259392 ) ( LIFTING ?auto_1259396 ?auto_1259390 ) ( not ( = ?auto_1259394 ?auto_1259396 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1259396 ?auto_1259390 ?auto_1259393 ?auto_1259392 )
      ( MAKE-2CRATE ?auto_1259395 ?auto_1259389 ?auto_1259390 )
      ( MAKE-1CRATE-VERIFY ?auto_1259389 ?auto_1259390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259397 - SURFACE
      ?auto_1259398 - SURFACE
      ?auto_1259399 - SURFACE
    )
    :vars
    (
      ?auto_1259403 - HOIST
      ?auto_1259401 - PLACE
      ?auto_1259404 - TRUCK
      ?auto_1259402 - PLACE
      ?auto_1259400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259403 ?auto_1259401 ) ( SURFACE-AT ?auto_1259398 ?auto_1259401 ) ( CLEAR ?auto_1259398 ) ( IS-CRATE ?auto_1259399 ) ( not ( = ?auto_1259398 ?auto_1259399 ) ) ( AVAILABLE ?auto_1259403 ) ( ON ?auto_1259398 ?auto_1259397 ) ( not ( = ?auto_1259397 ?auto_1259398 ) ) ( not ( = ?auto_1259397 ?auto_1259399 ) ) ( TRUCK-AT ?auto_1259404 ?auto_1259402 ) ( not ( = ?auto_1259402 ?auto_1259401 ) ) ( HOIST-AT ?auto_1259400 ?auto_1259402 ) ( LIFTING ?auto_1259400 ?auto_1259399 ) ( not ( = ?auto_1259403 ?auto_1259400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259398 ?auto_1259399 )
      ( MAKE-2CRATE-VERIFY ?auto_1259397 ?auto_1259398 ?auto_1259399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259405 - SURFACE
      ?auto_1259406 - SURFACE
    )
    :vars
    (
      ?auto_1259408 - HOIST
      ?auto_1259410 - PLACE
      ?auto_1259409 - SURFACE
      ?auto_1259412 - TRUCK
      ?auto_1259411 - PLACE
      ?auto_1259407 - HOIST
      ?auto_1259413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259408 ?auto_1259410 ) ( SURFACE-AT ?auto_1259405 ?auto_1259410 ) ( CLEAR ?auto_1259405 ) ( IS-CRATE ?auto_1259406 ) ( not ( = ?auto_1259405 ?auto_1259406 ) ) ( AVAILABLE ?auto_1259408 ) ( ON ?auto_1259405 ?auto_1259409 ) ( not ( = ?auto_1259409 ?auto_1259405 ) ) ( not ( = ?auto_1259409 ?auto_1259406 ) ) ( TRUCK-AT ?auto_1259412 ?auto_1259411 ) ( not ( = ?auto_1259411 ?auto_1259410 ) ) ( HOIST-AT ?auto_1259407 ?auto_1259411 ) ( not ( = ?auto_1259408 ?auto_1259407 ) ) ( AVAILABLE ?auto_1259407 ) ( SURFACE-AT ?auto_1259406 ?auto_1259411 ) ( ON ?auto_1259406 ?auto_1259413 ) ( CLEAR ?auto_1259406 ) ( not ( = ?auto_1259405 ?auto_1259413 ) ) ( not ( = ?auto_1259406 ?auto_1259413 ) ) ( not ( = ?auto_1259409 ?auto_1259413 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1259407 ?auto_1259406 ?auto_1259413 ?auto_1259411 )
      ( MAKE-2CRATE ?auto_1259409 ?auto_1259405 ?auto_1259406 )
      ( MAKE-1CRATE-VERIFY ?auto_1259405 ?auto_1259406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259414 - SURFACE
      ?auto_1259415 - SURFACE
      ?auto_1259416 - SURFACE
    )
    :vars
    (
      ?auto_1259419 - HOIST
      ?auto_1259422 - PLACE
      ?auto_1259418 - TRUCK
      ?auto_1259421 - PLACE
      ?auto_1259420 - HOIST
      ?auto_1259417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259419 ?auto_1259422 ) ( SURFACE-AT ?auto_1259415 ?auto_1259422 ) ( CLEAR ?auto_1259415 ) ( IS-CRATE ?auto_1259416 ) ( not ( = ?auto_1259415 ?auto_1259416 ) ) ( AVAILABLE ?auto_1259419 ) ( ON ?auto_1259415 ?auto_1259414 ) ( not ( = ?auto_1259414 ?auto_1259415 ) ) ( not ( = ?auto_1259414 ?auto_1259416 ) ) ( TRUCK-AT ?auto_1259418 ?auto_1259421 ) ( not ( = ?auto_1259421 ?auto_1259422 ) ) ( HOIST-AT ?auto_1259420 ?auto_1259421 ) ( not ( = ?auto_1259419 ?auto_1259420 ) ) ( AVAILABLE ?auto_1259420 ) ( SURFACE-AT ?auto_1259416 ?auto_1259421 ) ( ON ?auto_1259416 ?auto_1259417 ) ( CLEAR ?auto_1259416 ) ( not ( = ?auto_1259415 ?auto_1259417 ) ) ( not ( = ?auto_1259416 ?auto_1259417 ) ) ( not ( = ?auto_1259414 ?auto_1259417 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259415 ?auto_1259416 )
      ( MAKE-2CRATE-VERIFY ?auto_1259414 ?auto_1259415 ?auto_1259416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259423 - SURFACE
      ?auto_1259424 - SURFACE
    )
    :vars
    (
      ?auto_1259429 - HOIST
      ?auto_1259425 - PLACE
      ?auto_1259428 - SURFACE
      ?auto_1259431 - PLACE
      ?auto_1259426 - HOIST
      ?auto_1259427 - SURFACE
      ?auto_1259430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259429 ?auto_1259425 ) ( SURFACE-AT ?auto_1259423 ?auto_1259425 ) ( CLEAR ?auto_1259423 ) ( IS-CRATE ?auto_1259424 ) ( not ( = ?auto_1259423 ?auto_1259424 ) ) ( AVAILABLE ?auto_1259429 ) ( ON ?auto_1259423 ?auto_1259428 ) ( not ( = ?auto_1259428 ?auto_1259423 ) ) ( not ( = ?auto_1259428 ?auto_1259424 ) ) ( not ( = ?auto_1259431 ?auto_1259425 ) ) ( HOIST-AT ?auto_1259426 ?auto_1259431 ) ( not ( = ?auto_1259429 ?auto_1259426 ) ) ( AVAILABLE ?auto_1259426 ) ( SURFACE-AT ?auto_1259424 ?auto_1259431 ) ( ON ?auto_1259424 ?auto_1259427 ) ( CLEAR ?auto_1259424 ) ( not ( = ?auto_1259423 ?auto_1259427 ) ) ( not ( = ?auto_1259424 ?auto_1259427 ) ) ( not ( = ?auto_1259428 ?auto_1259427 ) ) ( TRUCK-AT ?auto_1259430 ?auto_1259425 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259430 ?auto_1259425 ?auto_1259431 )
      ( MAKE-2CRATE ?auto_1259428 ?auto_1259423 ?auto_1259424 )
      ( MAKE-1CRATE-VERIFY ?auto_1259423 ?auto_1259424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259432 - SURFACE
      ?auto_1259433 - SURFACE
      ?auto_1259434 - SURFACE
    )
    :vars
    (
      ?auto_1259436 - HOIST
      ?auto_1259435 - PLACE
      ?auto_1259439 - PLACE
      ?auto_1259438 - HOIST
      ?auto_1259440 - SURFACE
      ?auto_1259437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259436 ?auto_1259435 ) ( SURFACE-AT ?auto_1259433 ?auto_1259435 ) ( CLEAR ?auto_1259433 ) ( IS-CRATE ?auto_1259434 ) ( not ( = ?auto_1259433 ?auto_1259434 ) ) ( AVAILABLE ?auto_1259436 ) ( ON ?auto_1259433 ?auto_1259432 ) ( not ( = ?auto_1259432 ?auto_1259433 ) ) ( not ( = ?auto_1259432 ?auto_1259434 ) ) ( not ( = ?auto_1259439 ?auto_1259435 ) ) ( HOIST-AT ?auto_1259438 ?auto_1259439 ) ( not ( = ?auto_1259436 ?auto_1259438 ) ) ( AVAILABLE ?auto_1259438 ) ( SURFACE-AT ?auto_1259434 ?auto_1259439 ) ( ON ?auto_1259434 ?auto_1259440 ) ( CLEAR ?auto_1259434 ) ( not ( = ?auto_1259433 ?auto_1259440 ) ) ( not ( = ?auto_1259434 ?auto_1259440 ) ) ( not ( = ?auto_1259432 ?auto_1259440 ) ) ( TRUCK-AT ?auto_1259437 ?auto_1259435 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259433 ?auto_1259434 )
      ( MAKE-2CRATE-VERIFY ?auto_1259432 ?auto_1259433 ?auto_1259434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259441 - SURFACE
      ?auto_1259442 - SURFACE
    )
    :vars
    (
      ?auto_1259444 - HOIST
      ?auto_1259447 - PLACE
      ?auto_1259448 - SURFACE
      ?auto_1259445 - PLACE
      ?auto_1259449 - HOIST
      ?auto_1259443 - SURFACE
      ?auto_1259446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259444 ?auto_1259447 ) ( IS-CRATE ?auto_1259442 ) ( not ( = ?auto_1259441 ?auto_1259442 ) ) ( not ( = ?auto_1259448 ?auto_1259441 ) ) ( not ( = ?auto_1259448 ?auto_1259442 ) ) ( not ( = ?auto_1259445 ?auto_1259447 ) ) ( HOIST-AT ?auto_1259449 ?auto_1259445 ) ( not ( = ?auto_1259444 ?auto_1259449 ) ) ( AVAILABLE ?auto_1259449 ) ( SURFACE-AT ?auto_1259442 ?auto_1259445 ) ( ON ?auto_1259442 ?auto_1259443 ) ( CLEAR ?auto_1259442 ) ( not ( = ?auto_1259441 ?auto_1259443 ) ) ( not ( = ?auto_1259442 ?auto_1259443 ) ) ( not ( = ?auto_1259448 ?auto_1259443 ) ) ( TRUCK-AT ?auto_1259446 ?auto_1259447 ) ( SURFACE-AT ?auto_1259448 ?auto_1259447 ) ( CLEAR ?auto_1259448 ) ( LIFTING ?auto_1259444 ?auto_1259441 ) ( IS-CRATE ?auto_1259441 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259448 ?auto_1259441 )
      ( MAKE-2CRATE ?auto_1259448 ?auto_1259441 ?auto_1259442 )
      ( MAKE-1CRATE-VERIFY ?auto_1259441 ?auto_1259442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259450 - SURFACE
      ?auto_1259451 - SURFACE
      ?auto_1259452 - SURFACE
    )
    :vars
    (
      ?auto_1259453 - HOIST
      ?auto_1259454 - PLACE
      ?auto_1259458 - PLACE
      ?auto_1259455 - HOIST
      ?auto_1259457 - SURFACE
      ?auto_1259456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259453 ?auto_1259454 ) ( IS-CRATE ?auto_1259452 ) ( not ( = ?auto_1259451 ?auto_1259452 ) ) ( not ( = ?auto_1259450 ?auto_1259451 ) ) ( not ( = ?auto_1259450 ?auto_1259452 ) ) ( not ( = ?auto_1259458 ?auto_1259454 ) ) ( HOIST-AT ?auto_1259455 ?auto_1259458 ) ( not ( = ?auto_1259453 ?auto_1259455 ) ) ( AVAILABLE ?auto_1259455 ) ( SURFACE-AT ?auto_1259452 ?auto_1259458 ) ( ON ?auto_1259452 ?auto_1259457 ) ( CLEAR ?auto_1259452 ) ( not ( = ?auto_1259451 ?auto_1259457 ) ) ( not ( = ?auto_1259452 ?auto_1259457 ) ) ( not ( = ?auto_1259450 ?auto_1259457 ) ) ( TRUCK-AT ?auto_1259456 ?auto_1259454 ) ( SURFACE-AT ?auto_1259450 ?auto_1259454 ) ( CLEAR ?auto_1259450 ) ( LIFTING ?auto_1259453 ?auto_1259451 ) ( IS-CRATE ?auto_1259451 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259451 ?auto_1259452 )
      ( MAKE-2CRATE-VERIFY ?auto_1259450 ?auto_1259451 ?auto_1259452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259459 - SURFACE
      ?auto_1259460 - SURFACE
    )
    :vars
    (
      ?auto_1259466 - HOIST
      ?auto_1259465 - PLACE
      ?auto_1259463 - SURFACE
      ?auto_1259462 - PLACE
      ?auto_1259464 - HOIST
      ?auto_1259461 - SURFACE
      ?auto_1259467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259466 ?auto_1259465 ) ( IS-CRATE ?auto_1259460 ) ( not ( = ?auto_1259459 ?auto_1259460 ) ) ( not ( = ?auto_1259463 ?auto_1259459 ) ) ( not ( = ?auto_1259463 ?auto_1259460 ) ) ( not ( = ?auto_1259462 ?auto_1259465 ) ) ( HOIST-AT ?auto_1259464 ?auto_1259462 ) ( not ( = ?auto_1259466 ?auto_1259464 ) ) ( AVAILABLE ?auto_1259464 ) ( SURFACE-AT ?auto_1259460 ?auto_1259462 ) ( ON ?auto_1259460 ?auto_1259461 ) ( CLEAR ?auto_1259460 ) ( not ( = ?auto_1259459 ?auto_1259461 ) ) ( not ( = ?auto_1259460 ?auto_1259461 ) ) ( not ( = ?auto_1259463 ?auto_1259461 ) ) ( TRUCK-AT ?auto_1259467 ?auto_1259465 ) ( SURFACE-AT ?auto_1259463 ?auto_1259465 ) ( CLEAR ?auto_1259463 ) ( IS-CRATE ?auto_1259459 ) ( AVAILABLE ?auto_1259466 ) ( IN ?auto_1259459 ?auto_1259467 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1259466 ?auto_1259459 ?auto_1259467 ?auto_1259465 )
      ( MAKE-2CRATE ?auto_1259463 ?auto_1259459 ?auto_1259460 )
      ( MAKE-1CRATE-VERIFY ?auto_1259459 ?auto_1259460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259468 - SURFACE
      ?auto_1259469 - SURFACE
      ?auto_1259470 - SURFACE
    )
    :vars
    (
      ?auto_1259474 - HOIST
      ?auto_1259476 - PLACE
      ?auto_1259471 - PLACE
      ?auto_1259475 - HOIST
      ?auto_1259473 - SURFACE
      ?auto_1259472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259474 ?auto_1259476 ) ( IS-CRATE ?auto_1259470 ) ( not ( = ?auto_1259469 ?auto_1259470 ) ) ( not ( = ?auto_1259468 ?auto_1259469 ) ) ( not ( = ?auto_1259468 ?auto_1259470 ) ) ( not ( = ?auto_1259471 ?auto_1259476 ) ) ( HOIST-AT ?auto_1259475 ?auto_1259471 ) ( not ( = ?auto_1259474 ?auto_1259475 ) ) ( AVAILABLE ?auto_1259475 ) ( SURFACE-AT ?auto_1259470 ?auto_1259471 ) ( ON ?auto_1259470 ?auto_1259473 ) ( CLEAR ?auto_1259470 ) ( not ( = ?auto_1259469 ?auto_1259473 ) ) ( not ( = ?auto_1259470 ?auto_1259473 ) ) ( not ( = ?auto_1259468 ?auto_1259473 ) ) ( TRUCK-AT ?auto_1259472 ?auto_1259476 ) ( SURFACE-AT ?auto_1259468 ?auto_1259476 ) ( CLEAR ?auto_1259468 ) ( IS-CRATE ?auto_1259469 ) ( AVAILABLE ?auto_1259474 ) ( IN ?auto_1259469 ?auto_1259472 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259469 ?auto_1259470 )
      ( MAKE-2CRATE-VERIFY ?auto_1259468 ?auto_1259469 ?auto_1259470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259513 - SURFACE
      ?auto_1259514 - SURFACE
    )
    :vars
    (
      ?auto_1259516 - HOIST
      ?auto_1259517 - PLACE
      ?auto_1259519 - SURFACE
      ?auto_1259520 - PLACE
      ?auto_1259518 - HOIST
      ?auto_1259521 - SURFACE
      ?auto_1259515 - TRUCK
      ?auto_1259522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259516 ?auto_1259517 ) ( SURFACE-AT ?auto_1259513 ?auto_1259517 ) ( CLEAR ?auto_1259513 ) ( IS-CRATE ?auto_1259514 ) ( not ( = ?auto_1259513 ?auto_1259514 ) ) ( AVAILABLE ?auto_1259516 ) ( ON ?auto_1259513 ?auto_1259519 ) ( not ( = ?auto_1259519 ?auto_1259513 ) ) ( not ( = ?auto_1259519 ?auto_1259514 ) ) ( not ( = ?auto_1259520 ?auto_1259517 ) ) ( HOIST-AT ?auto_1259518 ?auto_1259520 ) ( not ( = ?auto_1259516 ?auto_1259518 ) ) ( AVAILABLE ?auto_1259518 ) ( SURFACE-AT ?auto_1259514 ?auto_1259520 ) ( ON ?auto_1259514 ?auto_1259521 ) ( CLEAR ?auto_1259514 ) ( not ( = ?auto_1259513 ?auto_1259521 ) ) ( not ( = ?auto_1259514 ?auto_1259521 ) ) ( not ( = ?auto_1259519 ?auto_1259521 ) ) ( TRUCK-AT ?auto_1259515 ?auto_1259522 ) ( not ( = ?auto_1259522 ?auto_1259517 ) ) ( not ( = ?auto_1259520 ?auto_1259522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259515 ?auto_1259522 ?auto_1259517 )
      ( MAKE-1CRATE ?auto_1259513 ?auto_1259514 )
      ( MAKE-1CRATE-VERIFY ?auto_1259513 ?auto_1259514 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259552 - SURFACE
      ?auto_1259553 - SURFACE
      ?auto_1259554 - SURFACE
      ?auto_1259555 - SURFACE
    )
    :vars
    (
      ?auto_1259557 - HOIST
      ?auto_1259556 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259557 ?auto_1259556 ) ( SURFACE-AT ?auto_1259554 ?auto_1259556 ) ( CLEAR ?auto_1259554 ) ( LIFTING ?auto_1259557 ?auto_1259555 ) ( IS-CRATE ?auto_1259555 ) ( not ( = ?auto_1259554 ?auto_1259555 ) ) ( ON ?auto_1259553 ?auto_1259552 ) ( ON ?auto_1259554 ?auto_1259553 ) ( not ( = ?auto_1259552 ?auto_1259553 ) ) ( not ( = ?auto_1259552 ?auto_1259554 ) ) ( not ( = ?auto_1259552 ?auto_1259555 ) ) ( not ( = ?auto_1259553 ?auto_1259554 ) ) ( not ( = ?auto_1259553 ?auto_1259555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259554 ?auto_1259555 )
      ( MAKE-3CRATE-VERIFY ?auto_1259552 ?auto_1259553 ?auto_1259554 ?auto_1259555 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259569 - SURFACE
      ?auto_1259570 - SURFACE
      ?auto_1259571 - SURFACE
      ?auto_1259572 - SURFACE
    )
    :vars
    (
      ?auto_1259574 - HOIST
      ?auto_1259573 - PLACE
      ?auto_1259575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259574 ?auto_1259573 ) ( SURFACE-AT ?auto_1259571 ?auto_1259573 ) ( CLEAR ?auto_1259571 ) ( IS-CRATE ?auto_1259572 ) ( not ( = ?auto_1259571 ?auto_1259572 ) ) ( TRUCK-AT ?auto_1259575 ?auto_1259573 ) ( AVAILABLE ?auto_1259574 ) ( IN ?auto_1259572 ?auto_1259575 ) ( ON ?auto_1259571 ?auto_1259570 ) ( not ( = ?auto_1259570 ?auto_1259571 ) ) ( not ( = ?auto_1259570 ?auto_1259572 ) ) ( ON ?auto_1259570 ?auto_1259569 ) ( not ( = ?auto_1259569 ?auto_1259570 ) ) ( not ( = ?auto_1259569 ?auto_1259571 ) ) ( not ( = ?auto_1259569 ?auto_1259572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259570 ?auto_1259571 ?auto_1259572 )
      ( MAKE-3CRATE-VERIFY ?auto_1259569 ?auto_1259570 ?auto_1259571 ?auto_1259572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259590 - SURFACE
      ?auto_1259591 - SURFACE
      ?auto_1259592 - SURFACE
      ?auto_1259593 - SURFACE
    )
    :vars
    (
      ?auto_1259597 - HOIST
      ?auto_1259595 - PLACE
      ?auto_1259596 - TRUCK
      ?auto_1259594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259597 ?auto_1259595 ) ( SURFACE-AT ?auto_1259592 ?auto_1259595 ) ( CLEAR ?auto_1259592 ) ( IS-CRATE ?auto_1259593 ) ( not ( = ?auto_1259592 ?auto_1259593 ) ) ( AVAILABLE ?auto_1259597 ) ( IN ?auto_1259593 ?auto_1259596 ) ( ON ?auto_1259592 ?auto_1259591 ) ( not ( = ?auto_1259591 ?auto_1259592 ) ) ( not ( = ?auto_1259591 ?auto_1259593 ) ) ( TRUCK-AT ?auto_1259596 ?auto_1259594 ) ( not ( = ?auto_1259594 ?auto_1259595 ) ) ( ON ?auto_1259591 ?auto_1259590 ) ( not ( = ?auto_1259590 ?auto_1259591 ) ) ( not ( = ?auto_1259590 ?auto_1259592 ) ) ( not ( = ?auto_1259590 ?auto_1259593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259591 ?auto_1259592 ?auto_1259593 )
      ( MAKE-3CRATE-VERIFY ?auto_1259590 ?auto_1259591 ?auto_1259592 ?auto_1259593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259614 - SURFACE
      ?auto_1259615 - SURFACE
      ?auto_1259616 - SURFACE
      ?auto_1259617 - SURFACE
    )
    :vars
    (
      ?auto_1259620 - HOIST
      ?auto_1259618 - PLACE
      ?auto_1259621 - TRUCK
      ?auto_1259622 - PLACE
      ?auto_1259619 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259620 ?auto_1259618 ) ( SURFACE-AT ?auto_1259616 ?auto_1259618 ) ( CLEAR ?auto_1259616 ) ( IS-CRATE ?auto_1259617 ) ( not ( = ?auto_1259616 ?auto_1259617 ) ) ( AVAILABLE ?auto_1259620 ) ( ON ?auto_1259616 ?auto_1259615 ) ( not ( = ?auto_1259615 ?auto_1259616 ) ) ( not ( = ?auto_1259615 ?auto_1259617 ) ) ( TRUCK-AT ?auto_1259621 ?auto_1259622 ) ( not ( = ?auto_1259622 ?auto_1259618 ) ) ( HOIST-AT ?auto_1259619 ?auto_1259622 ) ( LIFTING ?auto_1259619 ?auto_1259617 ) ( not ( = ?auto_1259620 ?auto_1259619 ) ) ( ON ?auto_1259615 ?auto_1259614 ) ( not ( = ?auto_1259614 ?auto_1259615 ) ) ( not ( = ?auto_1259614 ?auto_1259616 ) ) ( not ( = ?auto_1259614 ?auto_1259617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259615 ?auto_1259616 ?auto_1259617 )
      ( MAKE-3CRATE-VERIFY ?auto_1259614 ?auto_1259615 ?auto_1259616 ?auto_1259617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259641 - SURFACE
      ?auto_1259642 - SURFACE
      ?auto_1259643 - SURFACE
      ?auto_1259644 - SURFACE
    )
    :vars
    (
      ?auto_1259650 - HOIST
      ?auto_1259647 - PLACE
      ?auto_1259646 - TRUCK
      ?auto_1259648 - PLACE
      ?auto_1259645 - HOIST
      ?auto_1259649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259650 ?auto_1259647 ) ( SURFACE-AT ?auto_1259643 ?auto_1259647 ) ( CLEAR ?auto_1259643 ) ( IS-CRATE ?auto_1259644 ) ( not ( = ?auto_1259643 ?auto_1259644 ) ) ( AVAILABLE ?auto_1259650 ) ( ON ?auto_1259643 ?auto_1259642 ) ( not ( = ?auto_1259642 ?auto_1259643 ) ) ( not ( = ?auto_1259642 ?auto_1259644 ) ) ( TRUCK-AT ?auto_1259646 ?auto_1259648 ) ( not ( = ?auto_1259648 ?auto_1259647 ) ) ( HOIST-AT ?auto_1259645 ?auto_1259648 ) ( not ( = ?auto_1259650 ?auto_1259645 ) ) ( AVAILABLE ?auto_1259645 ) ( SURFACE-AT ?auto_1259644 ?auto_1259648 ) ( ON ?auto_1259644 ?auto_1259649 ) ( CLEAR ?auto_1259644 ) ( not ( = ?auto_1259643 ?auto_1259649 ) ) ( not ( = ?auto_1259644 ?auto_1259649 ) ) ( not ( = ?auto_1259642 ?auto_1259649 ) ) ( ON ?auto_1259642 ?auto_1259641 ) ( not ( = ?auto_1259641 ?auto_1259642 ) ) ( not ( = ?auto_1259641 ?auto_1259643 ) ) ( not ( = ?auto_1259641 ?auto_1259644 ) ) ( not ( = ?auto_1259641 ?auto_1259649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259642 ?auto_1259643 ?auto_1259644 )
      ( MAKE-3CRATE-VERIFY ?auto_1259641 ?auto_1259642 ?auto_1259643 ?auto_1259644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259669 - SURFACE
      ?auto_1259670 - SURFACE
      ?auto_1259671 - SURFACE
      ?auto_1259672 - SURFACE
    )
    :vars
    (
      ?auto_1259674 - HOIST
      ?auto_1259678 - PLACE
      ?auto_1259676 - PLACE
      ?auto_1259677 - HOIST
      ?auto_1259673 - SURFACE
      ?auto_1259675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259674 ?auto_1259678 ) ( SURFACE-AT ?auto_1259671 ?auto_1259678 ) ( CLEAR ?auto_1259671 ) ( IS-CRATE ?auto_1259672 ) ( not ( = ?auto_1259671 ?auto_1259672 ) ) ( AVAILABLE ?auto_1259674 ) ( ON ?auto_1259671 ?auto_1259670 ) ( not ( = ?auto_1259670 ?auto_1259671 ) ) ( not ( = ?auto_1259670 ?auto_1259672 ) ) ( not ( = ?auto_1259676 ?auto_1259678 ) ) ( HOIST-AT ?auto_1259677 ?auto_1259676 ) ( not ( = ?auto_1259674 ?auto_1259677 ) ) ( AVAILABLE ?auto_1259677 ) ( SURFACE-AT ?auto_1259672 ?auto_1259676 ) ( ON ?auto_1259672 ?auto_1259673 ) ( CLEAR ?auto_1259672 ) ( not ( = ?auto_1259671 ?auto_1259673 ) ) ( not ( = ?auto_1259672 ?auto_1259673 ) ) ( not ( = ?auto_1259670 ?auto_1259673 ) ) ( TRUCK-AT ?auto_1259675 ?auto_1259678 ) ( ON ?auto_1259670 ?auto_1259669 ) ( not ( = ?auto_1259669 ?auto_1259670 ) ) ( not ( = ?auto_1259669 ?auto_1259671 ) ) ( not ( = ?auto_1259669 ?auto_1259672 ) ) ( not ( = ?auto_1259669 ?auto_1259673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259670 ?auto_1259671 ?auto_1259672 )
      ( MAKE-3CRATE-VERIFY ?auto_1259669 ?auto_1259670 ?auto_1259671 ?auto_1259672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259697 - SURFACE
      ?auto_1259698 - SURFACE
      ?auto_1259699 - SURFACE
      ?auto_1259700 - SURFACE
    )
    :vars
    (
      ?auto_1259704 - HOIST
      ?auto_1259702 - PLACE
      ?auto_1259705 - PLACE
      ?auto_1259706 - HOIST
      ?auto_1259701 - SURFACE
      ?auto_1259703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259704 ?auto_1259702 ) ( IS-CRATE ?auto_1259700 ) ( not ( = ?auto_1259699 ?auto_1259700 ) ) ( not ( = ?auto_1259698 ?auto_1259699 ) ) ( not ( = ?auto_1259698 ?auto_1259700 ) ) ( not ( = ?auto_1259705 ?auto_1259702 ) ) ( HOIST-AT ?auto_1259706 ?auto_1259705 ) ( not ( = ?auto_1259704 ?auto_1259706 ) ) ( AVAILABLE ?auto_1259706 ) ( SURFACE-AT ?auto_1259700 ?auto_1259705 ) ( ON ?auto_1259700 ?auto_1259701 ) ( CLEAR ?auto_1259700 ) ( not ( = ?auto_1259699 ?auto_1259701 ) ) ( not ( = ?auto_1259700 ?auto_1259701 ) ) ( not ( = ?auto_1259698 ?auto_1259701 ) ) ( TRUCK-AT ?auto_1259703 ?auto_1259702 ) ( SURFACE-AT ?auto_1259698 ?auto_1259702 ) ( CLEAR ?auto_1259698 ) ( LIFTING ?auto_1259704 ?auto_1259699 ) ( IS-CRATE ?auto_1259699 ) ( ON ?auto_1259698 ?auto_1259697 ) ( not ( = ?auto_1259697 ?auto_1259698 ) ) ( not ( = ?auto_1259697 ?auto_1259699 ) ) ( not ( = ?auto_1259697 ?auto_1259700 ) ) ( not ( = ?auto_1259697 ?auto_1259701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259698 ?auto_1259699 ?auto_1259700 )
      ( MAKE-3CRATE-VERIFY ?auto_1259697 ?auto_1259698 ?auto_1259699 ?auto_1259700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259725 - SURFACE
      ?auto_1259726 - SURFACE
      ?auto_1259727 - SURFACE
      ?auto_1259728 - SURFACE
    )
    :vars
    (
      ?auto_1259729 - HOIST
      ?auto_1259731 - PLACE
      ?auto_1259732 - PLACE
      ?auto_1259733 - HOIST
      ?auto_1259734 - SURFACE
      ?auto_1259730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259729 ?auto_1259731 ) ( IS-CRATE ?auto_1259728 ) ( not ( = ?auto_1259727 ?auto_1259728 ) ) ( not ( = ?auto_1259726 ?auto_1259727 ) ) ( not ( = ?auto_1259726 ?auto_1259728 ) ) ( not ( = ?auto_1259732 ?auto_1259731 ) ) ( HOIST-AT ?auto_1259733 ?auto_1259732 ) ( not ( = ?auto_1259729 ?auto_1259733 ) ) ( AVAILABLE ?auto_1259733 ) ( SURFACE-AT ?auto_1259728 ?auto_1259732 ) ( ON ?auto_1259728 ?auto_1259734 ) ( CLEAR ?auto_1259728 ) ( not ( = ?auto_1259727 ?auto_1259734 ) ) ( not ( = ?auto_1259728 ?auto_1259734 ) ) ( not ( = ?auto_1259726 ?auto_1259734 ) ) ( TRUCK-AT ?auto_1259730 ?auto_1259731 ) ( SURFACE-AT ?auto_1259726 ?auto_1259731 ) ( CLEAR ?auto_1259726 ) ( IS-CRATE ?auto_1259727 ) ( AVAILABLE ?auto_1259729 ) ( IN ?auto_1259727 ?auto_1259730 ) ( ON ?auto_1259726 ?auto_1259725 ) ( not ( = ?auto_1259725 ?auto_1259726 ) ) ( not ( = ?auto_1259725 ?auto_1259727 ) ) ( not ( = ?auto_1259725 ?auto_1259728 ) ) ( not ( = ?auto_1259725 ?auto_1259734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259726 ?auto_1259727 ?auto_1259728 )
      ( MAKE-3CRATE-VERIFY ?auto_1259725 ?auto_1259726 ?auto_1259727 ?auto_1259728 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260016 - SURFACE
      ?auto_1260017 - SURFACE
      ?auto_1260018 - SURFACE
      ?auto_1260019 - SURFACE
      ?auto_1260020 - SURFACE
    )
    :vars
    (
      ?auto_1260022 - HOIST
      ?auto_1260021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260022 ?auto_1260021 ) ( SURFACE-AT ?auto_1260019 ?auto_1260021 ) ( CLEAR ?auto_1260019 ) ( LIFTING ?auto_1260022 ?auto_1260020 ) ( IS-CRATE ?auto_1260020 ) ( not ( = ?auto_1260019 ?auto_1260020 ) ) ( ON ?auto_1260017 ?auto_1260016 ) ( ON ?auto_1260018 ?auto_1260017 ) ( ON ?auto_1260019 ?auto_1260018 ) ( not ( = ?auto_1260016 ?auto_1260017 ) ) ( not ( = ?auto_1260016 ?auto_1260018 ) ) ( not ( = ?auto_1260016 ?auto_1260019 ) ) ( not ( = ?auto_1260016 ?auto_1260020 ) ) ( not ( = ?auto_1260017 ?auto_1260018 ) ) ( not ( = ?auto_1260017 ?auto_1260019 ) ) ( not ( = ?auto_1260017 ?auto_1260020 ) ) ( not ( = ?auto_1260018 ?auto_1260019 ) ) ( not ( = ?auto_1260018 ?auto_1260020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1260019 ?auto_1260020 )
      ( MAKE-4CRATE-VERIFY ?auto_1260016 ?auto_1260017 ?auto_1260018 ?auto_1260019 ?auto_1260020 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260041 - SURFACE
      ?auto_1260042 - SURFACE
      ?auto_1260043 - SURFACE
      ?auto_1260044 - SURFACE
      ?auto_1260045 - SURFACE
    )
    :vars
    (
      ?auto_1260046 - HOIST
      ?auto_1260047 - PLACE
      ?auto_1260048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260046 ?auto_1260047 ) ( SURFACE-AT ?auto_1260044 ?auto_1260047 ) ( CLEAR ?auto_1260044 ) ( IS-CRATE ?auto_1260045 ) ( not ( = ?auto_1260044 ?auto_1260045 ) ) ( TRUCK-AT ?auto_1260048 ?auto_1260047 ) ( AVAILABLE ?auto_1260046 ) ( IN ?auto_1260045 ?auto_1260048 ) ( ON ?auto_1260044 ?auto_1260043 ) ( not ( = ?auto_1260043 ?auto_1260044 ) ) ( not ( = ?auto_1260043 ?auto_1260045 ) ) ( ON ?auto_1260042 ?auto_1260041 ) ( ON ?auto_1260043 ?auto_1260042 ) ( not ( = ?auto_1260041 ?auto_1260042 ) ) ( not ( = ?auto_1260041 ?auto_1260043 ) ) ( not ( = ?auto_1260041 ?auto_1260044 ) ) ( not ( = ?auto_1260041 ?auto_1260045 ) ) ( not ( = ?auto_1260042 ?auto_1260043 ) ) ( not ( = ?auto_1260042 ?auto_1260044 ) ) ( not ( = ?auto_1260042 ?auto_1260045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260043 ?auto_1260044 ?auto_1260045 )
      ( MAKE-4CRATE-VERIFY ?auto_1260041 ?auto_1260042 ?auto_1260043 ?auto_1260044 ?auto_1260045 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260071 - SURFACE
      ?auto_1260072 - SURFACE
      ?auto_1260073 - SURFACE
      ?auto_1260074 - SURFACE
      ?auto_1260075 - SURFACE
    )
    :vars
    (
      ?auto_1260076 - HOIST
      ?auto_1260079 - PLACE
      ?auto_1260077 - TRUCK
      ?auto_1260078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260076 ?auto_1260079 ) ( SURFACE-AT ?auto_1260074 ?auto_1260079 ) ( CLEAR ?auto_1260074 ) ( IS-CRATE ?auto_1260075 ) ( not ( = ?auto_1260074 ?auto_1260075 ) ) ( AVAILABLE ?auto_1260076 ) ( IN ?auto_1260075 ?auto_1260077 ) ( ON ?auto_1260074 ?auto_1260073 ) ( not ( = ?auto_1260073 ?auto_1260074 ) ) ( not ( = ?auto_1260073 ?auto_1260075 ) ) ( TRUCK-AT ?auto_1260077 ?auto_1260078 ) ( not ( = ?auto_1260078 ?auto_1260079 ) ) ( ON ?auto_1260072 ?auto_1260071 ) ( ON ?auto_1260073 ?auto_1260072 ) ( not ( = ?auto_1260071 ?auto_1260072 ) ) ( not ( = ?auto_1260071 ?auto_1260073 ) ) ( not ( = ?auto_1260071 ?auto_1260074 ) ) ( not ( = ?auto_1260071 ?auto_1260075 ) ) ( not ( = ?auto_1260072 ?auto_1260073 ) ) ( not ( = ?auto_1260072 ?auto_1260074 ) ) ( not ( = ?auto_1260072 ?auto_1260075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260073 ?auto_1260074 ?auto_1260075 )
      ( MAKE-4CRATE-VERIFY ?auto_1260071 ?auto_1260072 ?auto_1260073 ?auto_1260074 ?auto_1260075 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260105 - SURFACE
      ?auto_1260106 - SURFACE
      ?auto_1260107 - SURFACE
      ?auto_1260108 - SURFACE
      ?auto_1260109 - SURFACE
    )
    :vars
    (
      ?auto_1260112 - HOIST
      ?auto_1260111 - PLACE
      ?auto_1260114 - TRUCK
      ?auto_1260113 - PLACE
      ?auto_1260110 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260112 ?auto_1260111 ) ( SURFACE-AT ?auto_1260108 ?auto_1260111 ) ( CLEAR ?auto_1260108 ) ( IS-CRATE ?auto_1260109 ) ( not ( = ?auto_1260108 ?auto_1260109 ) ) ( AVAILABLE ?auto_1260112 ) ( ON ?auto_1260108 ?auto_1260107 ) ( not ( = ?auto_1260107 ?auto_1260108 ) ) ( not ( = ?auto_1260107 ?auto_1260109 ) ) ( TRUCK-AT ?auto_1260114 ?auto_1260113 ) ( not ( = ?auto_1260113 ?auto_1260111 ) ) ( HOIST-AT ?auto_1260110 ?auto_1260113 ) ( LIFTING ?auto_1260110 ?auto_1260109 ) ( not ( = ?auto_1260112 ?auto_1260110 ) ) ( ON ?auto_1260106 ?auto_1260105 ) ( ON ?auto_1260107 ?auto_1260106 ) ( not ( = ?auto_1260105 ?auto_1260106 ) ) ( not ( = ?auto_1260105 ?auto_1260107 ) ) ( not ( = ?auto_1260105 ?auto_1260108 ) ) ( not ( = ?auto_1260105 ?auto_1260109 ) ) ( not ( = ?auto_1260106 ?auto_1260107 ) ) ( not ( = ?auto_1260106 ?auto_1260108 ) ) ( not ( = ?auto_1260106 ?auto_1260109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260107 ?auto_1260108 ?auto_1260109 )
      ( MAKE-4CRATE-VERIFY ?auto_1260105 ?auto_1260106 ?auto_1260107 ?auto_1260108 ?auto_1260109 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260143 - SURFACE
      ?auto_1260144 - SURFACE
      ?auto_1260145 - SURFACE
      ?auto_1260146 - SURFACE
      ?auto_1260147 - SURFACE
    )
    :vars
    (
      ?auto_1260148 - HOIST
      ?auto_1260152 - PLACE
      ?auto_1260150 - TRUCK
      ?auto_1260151 - PLACE
      ?auto_1260149 - HOIST
      ?auto_1260153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260148 ?auto_1260152 ) ( SURFACE-AT ?auto_1260146 ?auto_1260152 ) ( CLEAR ?auto_1260146 ) ( IS-CRATE ?auto_1260147 ) ( not ( = ?auto_1260146 ?auto_1260147 ) ) ( AVAILABLE ?auto_1260148 ) ( ON ?auto_1260146 ?auto_1260145 ) ( not ( = ?auto_1260145 ?auto_1260146 ) ) ( not ( = ?auto_1260145 ?auto_1260147 ) ) ( TRUCK-AT ?auto_1260150 ?auto_1260151 ) ( not ( = ?auto_1260151 ?auto_1260152 ) ) ( HOIST-AT ?auto_1260149 ?auto_1260151 ) ( not ( = ?auto_1260148 ?auto_1260149 ) ) ( AVAILABLE ?auto_1260149 ) ( SURFACE-AT ?auto_1260147 ?auto_1260151 ) ( ON ?auto_1260147 ?auto_1260153 ) ( CLEAR ?auto_1260147 ) ( not ( = ?auto_1260146 ?auto_1260153 ) ) ( not ( = ?auto_1260147 ?auto_1260153 ) ) ( not ( = ?auto_1260145 ?auto_1260153 ) ) ( ON ?auto_1260144 ?auto_1260143 ) ( ON ?auto_1260145 ?auto_1260144 ) ( not ( = ?auto_1260143 ?auto_1260144 ) ) ( not ( = ?auto_1260143 ?auto_1260145 ) ) ( not ( = ?auto_1260143 ?auto_1260146 ) ) ( not ( = ?auto_1260143 ?auto_1260147 ) ) ( not ( = ?auto_1260143 ?auto_1260153 ) ) ( not ( = ?auto_1260144 ?auto_1260145 ) ) ( not ( = ?auto_1260144 ?auto_1260146 ) ) ( not ( = ?auto_1260144 ?auto_1260147 ) ) ( not ( = ?auto_1260144 ?auto_1260153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260145 ?auto_1260146 ?auto_1260147 )
      ( MAKE-4CRATE-VERIFY ?auto_1260143 ?auto_1260144 ?auto_1260145 ?auto_1260146 ?auto_1260147 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260182 - SURFACE
      ?auto_1260183 - SURFACE
      ?auto_1260184 - SURFACE
      ?auto_1260185 - SURFACE
      ?auto_1260186 - SURFACE
    )
    :vars
    (
      ?auto_1260192 - HOIST
      ?auto_1260190 - PLACE
      ?auto_1260187 - PLACE
      ?auto_1260189 - HOIST
      ?auto_1260191 - SURFACE
      ?auto_1260188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260192 ?auto_1260190 ) ( SURFACE-AT ?auto_1260185 ?auto_1260190 ) ( CLEAR ?auto_1260185 ) ( IS-CRATE ?auto_1260186 ) ( not ( = ?auto_1260185 ?auto_1260186 ) ) ( AVAILABLE ?auto_1260192 ) ( ON ?auto_1260185 ?auto_1260184 ) ( not ( = ?auto_1260184 ?auto_1260185 ) ) ( not ( = ?auto_1260184 ?auto_1260186 ) ) ( not ( = ?auto_1260187 ?auto_1260190 ) ) ( HOIST-AT ?auto_1260189 ?auto_1260187 ) ( not ( = ?auto_1260192 ?auto_1260189 ) ) ( AVAILABLE ?auto_1260189 ) ( SURFACE-AT ?auto_1260186 ?auto_1260187 ) ( ON ?auto_1260186 ?auto_1260191 ) ( CLEAR ?auto_1260186 ) ( not ( = ?auto_1260185 ?auto_1260191 ) ) ( not ( = ?auto_1260186 ?auto_1260191 ) ) ( not ( = ?auto_1260184 ?auto_1260191 ) ) ( TRUCK-AT ?auto_1260188 ?auto_1260190 ) ( ON ?auto_1260183 ?auto_1260182 ) ( ON ?auto_1260184 ?auto_1260183 ) ( not ( = ?auto_1260182 ?auto_1260183 ) ) ( not ( = ?auto_1260182 ?auto_1260184 ) ) ( not ( = ?auto_1260182 ?auto_1260185 ) ) ( not ( = ?auto_1260182 ?auto_1260186 ) ) ( not ( = ?auto_1260182 ?auto_1260191 ) ) ( not ( = ?auto_1260183 ?auto_1260184 ) ) ( not ( = ?auto_1260183 ?auto_1260185 ) ) ( not ( = ?auto_1260183 ?auto_1260186 ) ) ( not ( = ?auto_1260183 ?auto_1260191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260184 ?auto_1260185 ?auto_1260186 )
      ( MAKE-4CRATE-VERIFY ?auto_1260182 ?auto_1260183 ?auto_1260184 ?auto_1260185 ?auto_1260186 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260221 - SURFACE
      ?auto_1260222 - SURFACE
      ?auto_1260223 - SURFACE
      ?auto_1260224 - SURFACE
      ?auto_1260225 - SURFACE
    )
    :vars
    (
      ?auto_1260227 - HOIST
      ?auto_1260229 - PLACE
      ?auto_1260230 - PLACE
      ?auto_1260228 - HOIST
      ?auto_1260226 - SURFACE
      ?auto_1260231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260227 ?auto_1260229 ) ( IS-CRATE ?auto_1260225 ) ( not ( = ?auto_1260224 ?auto_1260225 ) ) ( not ( = ?auto_1260223 ?auto_1260224 ) ) ( not ( = ?auto_1260223 ?auto_1260225 ) ) ( not ( = ?auto_1260230 ?auto_1260229 ) ) ( HOIST-AT ?auto_1260228 ?auto_1260230 ) ( not ( = ?auto_1260227 ?auto_1260228 ) ) ( AVAILABLE ?auto_1260228 ) ( SURFACE-AT ?auto_1260225 ?auto_1260230 ) ( ON ?auto_1260225 ?auto_1260226 ) ( CLEAR ?auto_1260225 ) ( not ( = ?auto_1260224 ?auto_1260226 ) ) ( not ( = ?auto_1260225 ?auto_1260226 ) ) ( not ( = ?auto_1260223 ?auto_1260226 ) ) ( TRUCK-AT ?auto_1260231 ?auto_1260229 ) ( SURFACE-AT ?auto_1260223 ?auto_1260229 ) ( CLEAR ?auto_1260223 ) ( LIFTING ?auto_1260227 ?auto_1260224 ) ( IS-CRATE ?auto_1260224 ) ( ON ?auto_1260222 ?auto_1260221 ) ( ON ?auto_1260223 ?auto_1260222 ) ( not ( = ?auto_1260221 ?auto_1260222 ) ) ( not ( = ?auto_1260221 ?auto_1260223 ) ) ( not ( = ?auto_1260221 ?auto_1260224 ) ) ( not ( = ?auto_1260221 ?auto_1260225 ) ) ( not ( = ?auto_1260221 ?auto_1260226 ) ) ( not ( = ?auto_1260222 ?auto_1260223 ) ) ( not ( = ?auto_1260222 ?auto_1260224 ) ) ( not ( = ?auto_1260222 ?auto_1260225 ) ) ( not ( = ?auto_1260222 ?auto_1260226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260223 ?auto_1260224 ?auto_1260225 )
      ( MAKE-4CRATE-VERIFY ?auto_1260221 ?auto_1260222 ?auto_1260223 ?auto_1260224 ?auto_1260225 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260260 - SURFACE
      ?auto_1260261 - SURFACE
      ?auto_1260262 - SURFACE
      ?auto_1260263 - SURFACE
      ?auto_1260264 - SURFACE
    )
    :vars
    (
      ?auto_1260270 - HOIST
      ?auto_1260266 - PLACE
      ?auto_1260269 - PLACE
      ?auto_1260265 - HOIST
      ?auto_1260268 - SURFACE
      ?auto_1260267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260270 ?auto_1260266 ) ( IS-CRATE ?auto_1260264 ) ( not ( = ?auto_1260263 ?auto_1260264 ) ) ( not ( = ?auto_1260262 ?auto_1260263 ) ) ( not ( = ?auto_1260262 ?auto_1260264 ) ) ( not ( = ?auto_1260269 ?auto_1260266 ) ) ( HOIST-AT ?auto_1260265 ?auto_1260269 ) ( not ( = ?auto_1260270 ?auto_1260265 ) ) ( AVAILABLE ?auto_1260265 ) ( SURFACE-AT ?auto_1260264 ?auto_1260269 ) ( ON ?auto_1260264 ?auto_1260268 ) ( CLEAR ?auto_1260264 ) ( not ( = ?auto_1260263 ?auto_1260268 ) ) ( not ( = ?auto_1260264 ?auto_1260268 ) ) ( not ( = ?auto_1260262 ?auto_1260268 ) ) ( TRUCK-AT ?auto_1260267 ?auto_1260266 ) ( SURFACE-AT ?auto_1260262 ?auto_1260266 ) ( CLEAR ?auto_1260262 ) ( IS-CRATE ?auto_1260263 ) ( AVAILABLE ?auto_1260270 ) ( IN ?auto_1260263 ?auto_1260267 ) ( ON ?auto_1260261 ?auto_1260260 ) ( ON ?auto_1260262 ?auto_1260261 ) ( not ( = ?auto_1260260 ?auto_1260261 ) ) ( not ( = ?auto_1260260 ?auto_1260262 ) ) ( not ( = ?auto_1260260 ?auto_1260263 ) ) ( not ( = ?auto_1260260 ?auto_1260264 ) ) ( not ( = ?auto_1260260 ?auto_1260268 ) ) ( not ( = ?auto_1260261 ?auto_1260262 ) ) ( not ( = ?auto_1260261 ?auto_1260263 ) ) ( not ( = ?auto_1260261 ?auto_1260264 ) ) ( not ( = ?auto_1260261 ?auto_1260268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260262 ?auto_1260263 ?auto_1260264 )
      ( MAKE-4CRATE-VERIFY ?auto_1260260 ?auto_1260261 ?auto_1260262 ?auto_1260263 ?auto_1260264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260920 - SURFACE
      ?auto_1260921 - SURFACE
      ?auto_1260922 - SURFACE
      ?auto_1260923 - SURFACE
      ?auto_1260924 - SURFACE
      ?auto_1260925 - SURFACE
    )
    :vars
    (
      ?auto_1260926 - HOIST
      ?auto_1260927 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260926 ?auto_1260927 ) ( SURFACE-AT ?auto_1260924 ?auto_1260927 ) ( CLEAR ?auto_1260924 ) ( LIFTING ?auto_1260926 ?auto_1260925 ) ( IS-CRATE ?auto_1260925 ) ( not ( = ?auto_1260924 ?auto_1260925 ) ) ( ON ?auto_1260921 ?auto_1260920 ) ( ON ?auto_1260922 ?auto_1260921 ) ( ON ?auto_1260923 ?auto_1260922 ) ( ON ?auto_1260924 ?auto_1260923 ) ( not ( = ?auto_1260920 ?auto_1260921 ) ) ( not ( = ?auto_1260920 ?auto_1260922 ) ) ( not ( = ?auto_1260920 ?auto_1260923 ) ) ( not ( = ?auto_1260920 ?auto_1260924 ) ) ( not ( = ?auto_1260920 ?auto_1260925 ) ) ( not ( = ?auto_1260921 ?auto_1260922 ) ) ( not ( = ?auto_1260921 ?auto_1260923 ) ) ( not ( = ?auto_1260921 ?auto_1260924 ) ) ( not ( = ?auto_1260921 ?auto_1260925 ) ) ( not ( = ?auto_1260922 ?auto_1260923 ) ) ( not ( = ?auto_1260922 ?auto_1260924 ) ) ( not ( = ?auto_1260922 ?auto_1260925 ) ) ( not ( = ?auto_1260923 ?auto_1260924 ) ) ( not ( = ?auto_1260923 ?auto_1260925 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1260924 ?auto_1260925 )
      ( MAKE-5CRATE-VERIFY ?auto_1260920 ?auto_1260921 ?auto_1260922 ?auto_1260923 ?auto_1260924 ?auto_1260925 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260954 - SURFACE
      ?auto_1260955 - SURFACE
      ?auto_1260956 - SURFACE
      ?auto_1260957 - SURFACE
      ?auto_1260958 - SURFACE
      ?auto_1260959 - SURFACE
    )
    :vars
    (
      ?auto_1260960 - HOIST
      ?auto_1260962 - PLACE
      ?auto_1260961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260960 ?auto_1260962 ) ( SURFACE-AT ?auto_1260958 ?auto_1260962 ) ( CLEAR ?auto_1260958 ) ( IS-CRATE ?auto_1260959 ) ( not ( = ?auto_1260958 ?auto_1260959 ) ) ( TRUCK-AT ?auto_1260961 ?auto_1260962 ) ( AVAILABLE ?auto_1260960 ) ( IN ?auto_1260959 ?auto_1260961 ) ( ON ?auto_1260958 ?auto_1260957 ) ( not ( = ?auto_1260957 ?auto_1260958 ) ) ( not ( = ?auto_1260957 ?auto_1260959 ) ) ( ON ?auto_1260955 ?auto_1260954 ) ( ON ?auto_1260956 ?auto_1260955 ) ( ON ?auto_1260957 ?auto_1260956 ) ( not ( = ?auto_1260954 ?auto_1260955 ) ) ( not ( = ?auto_1260954 ?auto_1260956 ) ) ( not ( = ?auto_1260954 ?auto_1260957 ) ) ( not ( = ?auto_1260954 ?auto_1260958 ) ) ( not ( = ?auto_1260954 ?auto_1260959 ) ) ( not ( = ?auto_1260955 ?auto_1260956 ) ) ( not ( = ?auto_1260955 ?auto_1260957 ) ) ( not ( = ?auto_1260955 ?auto_1260958 ) ) ( not ( = ?auto_1260955 ?auto_1260959 ) ) ( not ( = ?auto_1260956 ?auto_1260957 ) ) ( not ( = ?auto_1260956 ?auto_1260958 ) ) ( not ( = ?auto_1260956 ?auto_1260959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260957 ?auto_1260958 ?auto_1260959 )
      ( MAKE-5CRATE-VERIFY ?auto_1260954 ?auto_1260955 ?auto_1260956 ?auto_1260957 ?auto_1260958 ?auto_1260959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260994 - SURFACE
      ?auto_1260995 - SURFACE
      ?auto_1260996 - SURFACE
      ?auto_1260997 - SURFACE
      ?auto_1260998 - SURFACE
      ?auto_1260999 - SURFACE
    )
    :vars
    (
      ?auto_1261003 - HOIST
      ?auto_1261001 - PLACE
      ?auto_1261002 - TRUCK
      ?auto_1261000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261003 ?auto_1261001 ) ( SURFACE-AT ?auto_1260998 ?auto_1261001 ) ( CLEAR ?auto_1260998 ) ( IS-CRATE ?auto_1260999 ) ( not ( = ?auto_1260998 ?auto_1260999 ) ) ( AVAILABLE ?auto_1261003 ) ( IN ?auto_1260999 ?auto_1261002 ) ( ON ?auto_1260998 ?auto_1260997 ) ( not ( = ?auto_1260997 ?auto_1260998 ) ) ( not ( = ?auto_1260997 ?auto_1260999 ) ) ( TRUCK-AT ?auto_1261002 ?auto_1261000 ) ( not ( = ?auto_1261000 ?auto_1261001 ) ) ( ON ?auto_1260995 ?auto_1260994 ) ( ON ?auto_1260996 ?auto_1260995 ) ( ON ?auto_1260997 ?auto_1260996 ) ( not ( = ?auto_1260994 ?auto_1260995 ) ) ( not ( = ?auto_1260994 ?auto_1260996 ) ) ( not ( = ?auto_1260994 ?auto_1260997 ) ) ( not ( = ?auto_1260994 ?auto_1260998 ) ) ( not ( = ?auto_1260994 ?auto_1260999 ) ) ( not ( = ?auto_1260995 ?auto_1260996 ) ) ( not ( = ?auto_1260995 ?auto_1260997 ) ) ( not ( = ?auto_1260995 ?auto_1260998 ) ) ( not ( = ?auto_1260995 ?auto_1260999 ) ) ( not ( = ?auto_1260996 ?auto_1260997 ) ) ( not ( = ?auto_1260996 ?auto_1260998 ) ) ( not ( = ?auto_1260996 ?auto_1260999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260997 ?auto_1260998 ?auto_1260999 )
      ( MAKE-5CRATE-VERIFY ?auto_1260994 ?auto_1260995 ?auto_1260996 ?auto_1260997 ?auto_1260998 ?auto_1260999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261039 - SURFACE
      ?auto_1261040 - SURFACE
      ?auto_1261041 - SURFACE
      ?auto_1261042 - SURFACE
      ?auto_1261043 - SURFACE
      ?auto_1261044 - SURFACE
    )
    :vars
    (
      ?auto_1261047 - HOIST
      ?auto_1261046 - PLACE
      ?auto_1261045 - TRUCK
      ?auto_1261048 - PLACE
      ?auto_1261049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261047 ?auto_1261046 ) ( SURFACE-AT ?auto_1261043 ?auto_1261046 ) ( CLEAR ?auto_1261043 ) ( IS-CRATE ?auto_1261044 ) ( not ( = ?auto_1261043 ?auto_1261044 ) ) ( AVAILABLE ?auto_1261047 ) ( ON ?auto_1261043 ?auto_1261042 ) ( not ( = ?auto_1261042 ?auto_1261043 ) ) ( not ( = ?auto_1261042 ?auto_1261044 ) ) ( TRUCK-AT ?auto_1261045 ?auto_1261048 ) ( not ( = ?auto_1261048 ?auto_1261046 ) ) ( HOIST-AT ?auto_1261049 ?auto_1261048 ) ( LIFTING ?auto_1261049 ?auto_1261044 ) ( not ( = ?auto_1261047 ?auto_1261049 ) ) ( ON ?auto_1261040 ?auto_1261039 ) ( ON ?auto_1261041 ?auto_1261040 ) ( ON ?auto_1261042 ?auto_1261041 ) ( not ( = ?auto_1261039 ?auto_1261040 ) ) ( not ( = ?auto_1261039 ?auto_1261041 ) ) ( not ( = ?auto_1261039 ?auto_1261042 ) ) ( not ( = ?auto_1261039 ?auto_1261043 ) ) ( not ( = ?auto_1261039 ?auto_1261044 ) ) ( not ( = ?auto_1261040 ?auto_1261041 ) ) ( not ( = ?auto_1261040 ?auto_1261042 ) ) ( not ( = ?auto_1261040 ?auto_1261043 ) ) ( not ( = ?auto_1261040 ?auto_1261044 ) ) ( not ( = ?auto_1261041 ?auto_1261042 ) ) ( not ( = ?auto_1261041 ?auto_1261043 ) ) ( not ( = ?auto_1261041 ?auto_1261044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261042 ?auto_1261043 ?auto_1261044 )
      ( MAKE-5CRATE-VERIFY ?auto_1261039 ?auto_1261040 ?auto_1261041 ?auto_1261042 ?auto_1261043 ?auto_1261044 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261089 - SURFACE
      ?auto_1261090 - SURFACE
      ?auto_1261091 - SURFACE
      ?auto_1261092 - SURFACE
      ?auto_1261093 - SURFACE
      ?auto_1261094 - SURFACE
    )
    :vars
    (
      ?auto_1261097 - HOIST
      ?auto_1261098 - PLACE
      ?auto_1261100 - TRUCK
      ?auto_1261095 - PLACE
      ?auto_1261096 - HOIST
      ?auto_1261099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261097 ?auto_1261098 ) ( SURFACE-AT ?auto_1261093 ?auto_1261098 ) ( CLEAR ?auto_1261093 ) ( IS-CRATE ?auto_1261094 ) ( not ( = ?auto_1261093 ?auto_1261094 ) ) ( AVAILABLE ?auto_1261097 ) ( ON ?auto_1261093 ?auto_1261092 ) ( not ( = ?auto_1261092 ?auto_1261093 ) ) ( not ( = ?auto_1261092 ?auto_1261094 ) ) ( TRUCK-AT ?auto_1261100 ?auto_1261095 ) ( not ( = ?auto_1261095 ?auto_1261098 ) ) ( HOIST-AT ?auto_1261096 ?auto_1261095 ) ( not ( = ?auto_1261097 ?auto_1261096 ) ) ( AVAILABLE ?auto_1261096 ) ( SURFACE-AT ?auto_1261094 ?auto_1261095 ) ( ON ?auto_1261094 ?auto_1261099 ) ( CLEAR ?auto_1261094 ) ( not ( = ?auto_1261093 ?auto_1261099 ) ) ( not ( = ?auto_1261094 ?auto_1261099 ) ) ( not ( = ?auto_1261092 ?auto_1261099 ) ) ( ON ?auto_1261090 ?auto_1261089 ) ( ON ?auto_1261091 ?auto_1261090 ) ( ON ?auto_1261092 ?auto_1261091 ) ( not ( = ?auto_1261089 ?auto_1261090 ) ) ( not ( = ?auto_1261089 ?auto_1261091 ) ) ( not ( = ?auto_1261089 ?auto_1261092 ) ) ( not ( = ?auto_1261089 ?auto_1261093 ) ) ( not ( = ?auto_1261089 ?auto_1261094 ) ) ( not ( = ?auto_1261089 ?auto_1261099 ) ) ( not ( = ?auto_1261090 ?auto_1261091 ) ) ( not ( = ?auto_1261090 ?auto_1261092 ) ) ( not ( = ?auto_1261090 ?auto_1261093 ) ) ( not ( = ?auto_1261090 ?auto_1261094 ) ) ( not ( = ?auto_1261090 ?auto_1261099 ) ) ( not ( = ?auto_1261091 ?auto_1261092 ) ) ( not ( = ?auto_1261091 ?auto_1261093 ) ) ( not ( = ?auto_1261091 ?auto_1261094 ) ) ( not ( = ?auto_1261091 ?auto_1261099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261092 ?auto_1261093 ?auto_1261094 )
      ( MAKE-5CRATE-VERIFY ?auto_1261089 ?auto_1261090 ?auto_1261091 ?auto_1261092 ?auto_1261093 ?auto_1261094 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261140 - SURFACE
      ?auto_1261141 - SURFACE
      ?auto_1261142 - SURFACE
      ?auto_1261143 - SURFACE
      ?auto_1261144 - SURFACE
      ?auto_1261145 - SURFACE
    )
    :vars
    (
      ?auto_1261146 - HOIST
      ?auto_1261150 - PLACE
      ?auto_1261151 - PLACE
      ?auto_1261148 - HOIST
      ?auto_1261149 - SURFACE
      ?auto_1261147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261146 ?auto_1261150 ) ( SURFACE-AT ?auto_1261144 ?auto_1261150 ) ( CLEAR ?auto_1261144 ) ( IS-CRATE ?auto_1261145 ) ( not ( = ?auto_1261144 ?auto_1261145 ) ) ( AVAILABLE ?auto_1261146 ) ( ON ?auto_1261144 ?auto_1261143 ) ( not ( = ?auto_1261143 ?auto_1261144 ) ) ( not ( = ?auto_1261143 ?auto_1261145 ) ) ( not ( = ?auto_1261151 ?auto_1261150 ) ) ( HOIST-AT ?auto_1261148 ?auto_1261151 ) ( not ( = ?auto_1261146 ?auto_1261148 ) ) ( AVAILABLE ?auto_1261148 ) ( SURFACE-AT ?auto_1261145 ?auto_1261151 ) ( ON ?auto_1261145 ?auto_1261149 ) ( CLEAR ?auto_1261145 ) ( not ( = ?auto_1261144 ?auto_1261149 ) ) ( not ( = ?auto_1261145 ?auto_1261149 ) ) ( not ( = ?auto_1261143 ?auto_1261149 ) ) ( TRUCK-AT ?auto_1261147 ?auto_1261150 ) ( ON ?auto_1261141 ?auto_1261140 ) ( ON ?auto_1261142 ?auto_1261141 ) ( ON ?auto_1261143 ?auto_1261142 ) ( not ( = ?auto_1261140 ?auto_1261141 ) ) ( not ( = ?auto_1261140 ?auto_1261142 ) ) ( not ( = ?auto_1261140 ?auto_1261143 ) ) ( not ( = ?auto_1261140 ?auto_1261144 ) ) ( not ( = ?auto_1261140 ?auto_1261145 ) ) ( not ( = ?auto_1261140 ?auto_1261149 ) ) ( not ( = ?auto_1261141 ?auto_1261142 ) ) ( not ( = ?auto_1261141 ?auto_1261143 ) ) ( not ( = ?auto_1261141 ?auto_1261144 ) ) ( not ( = ?auto_1261141 ?auto_1261145 ) ) ( not ( = ?auto_1261141 ?auto_1261149 ) ) ( not ( = ?auto_1261142 ?auto_1261143 ) ) ( not ( = ?auto_1261142 ?auto_1261144 ) ) ( not ( = ?auto_1261142 ?auto_1261145 ) ) ( not ( = ?auto_1261142 ?auto_1261149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261143 ?auto_1261144 ?auto_1261145 )
      ( MAKE-5CRATE-VERIFY ?auto_1261140 ?auto_1261141 ?auto_1261142 ?auto_1261143 ?auto_1261144 ?auto_1261145 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261191 - SURFACE
      ?auto_1261192 - SURFACE
      ?auto_1261193 - SURFACE
      ?auto_1261194 - SURFACE
      ?auto_1261195 - SURFACE
      ?auto_1261196 - SURFACE
    )
    :vars
    (
      ?auto_1261199 - HOIST
      ?auto_1261198 - PLACE
      ?auto_1261200 - PLACE
      ?auto_1261201 - HOIST
      ?auto_1261197 - SURFACE
      ?auto_1261202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261199 ?auto_1261198 ) ( IS-CRATE ?auto_1261196 ) ( not ( = ?auto_1261195 ?auto_1261196 ) ) ( not ( = ?auto_1261194 ?auto_1261195 ) ) ( not ( = ?auto_1261194 ?auto_1261196 ) ) ( not ( = ?auto_1261200 ?auto_1261198 ) ) ( HOIST-AT ?auto_1261201 ?auto_1261200 ) ( not ( = ?auto_1261199 ?auto_1261201 ) ) ( AVAILABLE ?auto_1261201 ) ( SURFACE-AT ?auto_1261196 ?auto_1261200 ) ( ON ?auto_1261196 ?auto_1261197 ) ( CLEAR ?auto_1261196 ) ( not ( = ?auto_1261195 ?auto_1261197 ) ) ( not ( = ?auto_1261196 ?auto_1261197 ) ) ( not ( = ?auto_1261194 ?auto_1261197 ) ) ( TRUCK-AT ?auto_1261202 ?auto_1261198 ) ( SURFACE-AT ?auto_1261194 ?auto_1261198 ) ( CLEAR ?auto_1261194 ) ( LIFTING ?auto_1261199 ?auto_1261195 ) ( IS-CRATE ?auto_1261195 ) ( ON ?auto_1261192 ?auto_1261191 ) ( ON ?auto_1261193 ?auto_1261192 ) ( ON ?auto_1261194 ?auto_1261193 ) ( not ( = ?auto_1261191 ?auto_1261192 ) ) ( not ( = ?auto_1261191 ?auto_1261193 ) ) ( not ( = ?auto_1261191 ?auto_1261194 ) ) ( not ( = ?auto_1261191 ?auto_1261195 ) ) ( not ( = ?auto_1261191 ?auto_1261196 ) ) ( not ( = ?auto_1261191 ?auto_1261197 ) ) ( not ( = ?auto_1261192 ?auto_1261193 ) ) ( not ( = ?auto_1261192 ?auto_1261194 ) ) ( not ( = ?auto_1261192 ?auto_1261195 ) ) ( not ( = ?auto_1261192 ?auto_1261196 ) ) ( not ( = ?auto_1261192 ?auto_1261197 ) ) ( not ( = ?auto_1261193 ?auto_1261194 ) ) ( not ( = ?auto_1261193 ?auto_1261195 ) ) ( not ( = ?auto_1261193 ?auto_1261196 ) ) ( not ( = ?auto_1261193 ?auto_1261197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261194 ?auto_1261195 ?auto_1261196 )
      ( MAKE-5CRATE-VERIFY ?auto_1261191 ?auto_1261192 ?auto_1261193 ?auto_1261194 ?auto_1261195 ?auto_1261196 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261242 - SURFACE
      ?auto_1261243 - SURFACE
      ?auto_1261244 - SURFACE
      ?auto_1261245 - SURFACE
      ?auto_1261246 - SURFACE
      ?auto_1261247 - SURFACE
    )
    :vars
    (
      ?auto_1261249 - HOIST
      ?auto_1261250 - PLACE
      ?auto_1261251 - PLACE
      ?auto_1261253 - HOIST
      ?auto_1261252 - SURFACE
      ?auto_1261248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261249 ?auto_1261250 ) ( IS-CRATE ?auto_1261247 ) ( not ( = ?auto_1261246 ?auto_1261247 ) ) ( not ( = ?auto_1261245 ?auto_1261246 ) ) ( not ( = ?auto_1261245 ?auto_1261247 ) ) ( not ( = ?auto_1261251 ?auto_1261250 ) ) ( HOIST-AT ?auto_1261253 ?auto_1261251 ) ( not ( = ?auto_1261249 ?auto_1261253 ) ) ( AVAILABLE ?auto_1261253 ) ( SURFACE-AT ?auto_1261247 ?auto_1261251 ) ( ON ?auto_1261247 ?auto_1261252 ) ( CLEAR ?auto_1261247 ) ( not ( = ?auto_1261246 ?auto_1261252 ) ) ( not ( = ?auto_1261247 ?auto_1261252 ) ) ( not ( = ?auto_1261245 ?auto_1261252 ) ) ( TRUCK-AT ?auto_1261248 ?auto_1261250 ) ( SURFACE-AT ?auto_1261245 ?auto_1261250 ) ( CLEAR ?auto_1261245 ) ( IS-CRATE ?auto_1261246 ) ( AVAILABLE ?auto_1261249 ) ( IN ?auto_1261246 ?auto_1261248 ) ( ON ?auto_1261243 ?auto_1261242 ) ( ON ?auto_1261244 ?auto_1261243 ) ( ON ?auto_1261245 ?auto_1261244 ) ( not ( = ?auto_1261242 ?auto_1261243 ) ) ( not ( = ?auto_1261242 ?auto_1261244 ) ) ( not ( = ?auto_1261242 ?auto_1261245 ) ) ( not ( = ?auto_1261242 ?auto_1261246 ) ) ( not ( = ?auto_1261242 ?auto_1261247 ) ) ( not ( = ?auto_1261242 ?auto_1261252 ) ) ( not ( = ?auto_1261243 ?auto_1261244 ) ) ( not ( = ?auto_1261243 ?auto_1261245 ) ) ( not ( = ?auto_1261243 ?auto_1261246 ) ) ( not ( = ?auto_1261243 ?auto_1261247 ) ) ( not ( = ?auto_1261243 ?auto_1261252 ) ) ( not ( = ?auto_1261244 ?auto_1261245 ) ) ( not ( = ?auto_1261244 ?auto_1261246 ) ) ( not ( = ?auto_1261244 ?auto_1261247 ) ) ( not ( = ?auto_1261244 ?auto_1261252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261245 ?auto_1261246 ?auto_1261247 )
      ( MAKE-5CRATE-VERIFY ?auto_1261242 ?auto_1261243 ?auto_1261244 ?auto_1261245 ?auto_1261246 ?auto_1261247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1261922 - SURFACE
      ?auto_1261923 - SURFACE
    )
    :vars
    (
      ?auto_1261927 - HOIST
      ?auto_1261930 - PLACE
      ?auto_1261929 - SURFACE
      ?auto_1261925 - TRUCK
      ?auto_1261928 - PLACE
      ?auto_1261926 - HOIST
      ?auto_1261924 - SURFACE
      ?auto_1261931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261927 ?auto_1261930 ) ( SURFACE-AT ?auto_1261922 ?auto_1261930 ) ( CLEAR ?auto_1261922 ) ( IS-CRATE ?auto_1261923 ) ( not ( = ?auto_1261922 ?auto_1261923 ) ) ( AVAILABLE ?auto_1261927 ) ( ON ?auto_1261922 ?auto_1261929 ) ( not ( = ?auto_1261929 ?auto_1261922 ) ) ( not ( = ?auto_1261929 ?auto_1261923 ) ) ( TRUCK-AT ?auto_1261925 ?auto_1261928 ) ( not ( = ?auto_1261928 ?auto_1261930 ) ) ( HOIST-AT ?auto_1261926 ?auto_1261928 ) ( not ( = ?auto_1261927 ?auto_1261926 ) ) ( SURFACE-AT ?auto_1261923 ?auto_1261928 ) ( ON ?auto_1261923 ?auto_1261924 ) ( CLEAR ?auto_1261923 ) ( not ( = ?auto_1261922 ?auto_1261924 ) ) ( not ( = ?auto_1261923 ?auto_1261924 ) ) ( not ( = ?auto_1261929 ?auto_1261924 ) ) ( LIFTING ?auto_1261926 ?auto_1261931 ) ( IS-CRATE ?auto_1261931 ) ( not ( = ?auto_1261922 ?auto_1261931 ) ) ( not ( = ?auto_1261923 ?auto_1261931 ) ) ( not ( = ?auto_1261929 ?auto_1261931 ) ) ( not ( = ?auto_1261924 ?auto_1261931 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1261926 ?auto_1261931 ?auto_1261925 ?auto_1261928 )
      ( MAKE-1CRATE ?auto_1261922 ?auto_1261923 )
      ( MAKE-1CRATE-VERIFY ?auto_1261922 ?auto_1261923 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262448 - SURFACE
      ?auto_1262449 - SURFACE
      ?auto_1262450 - SURFACE
      ?auto_1262451 - SURFACE
      ?auto_1262452 - SURFACE
      ?auto_1262453 - SURFACE
      ?auto_1262454 - SURFACE
    )
    :vars
    (
      ?auto_1262455 - HOIST
      ?auto_1262456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262455 ?auto_1262456 ) ( SURFACE-AT ?auto_1262453 ?auto_1262456 ) ( CLEAR ?auto_1262453 ) ( LIFTING ?auto_1262455 ?auto_1262454 ) ( IS-CRATE ?auto_1262454 ) ( not ( = ?auto_1262453 ?auto_1262454 ) ) ( ON ?auto_1262449 ?auto_1262448 ) ( ON ?auto_1262450 ?auto_1262449 ) ( ON ?auto_1262451 ?auto_1262450 ) ( ON ?auto_1262452 ?auto_1262451 ) ( ON ?auto_1262453 ?auto_1262452 ) ( not ( = ?auto_1262448 ?auto_1262449 ) ) ( not ( = ?auto_1262448 ?auto_1262450 ) ) ( not ( = ?auto_1262448 ?auto_1262451 ) ) ( not ( = ?auto_1262448 ?auto_1262452 ) ) ( not ( = ?auto_1262448 ?auto_1262453 ) ) ( not ( = ?auto_1262448 ?auto_1262454 ) ) ( not ( = ?auto_1262449 ?auto_1262450 ) ) ( not ( = ?auto_1262449 ?auto_1262451 ) ) ( not ( = ?auto_1262449 ?auto_1262452 ) ) ( not ( = ?auto_1262449 ?auto_1262453 ) ) ( not ( = ?auto_1262449 ?auto_1262454 ) ) ( not ( = ?auto_1262450 ?auto_1262451 ) ) ( not ( = ?auto_1262450 ?auto_1262452 ) ) ( not ( = ?auto_1262450 ?auto_1262453 ) ) ( not ( = ?auto_1262450 ?auto_1262454 ) ) ( not ( = ?auto_1262451 ?auto_1262452 ) ) ( not ( = ?auto_1262451 ?auto_1262453 ) ) ( not ( = ?auto_1262451 ?auto_1262454 ) ) ( not ( = ?auto_1262452 ?auto_1262453 ) ) ( not ( = ?auto_1262452 ?auto_1262454 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1262453 ?auto_1262454 )
      ( MAKE-6CRATE-VERIFY ?auto_1262448 ?auto_1262449 ?auto_1262450 ?auto_1262451 ?auto_1262452 ?auto_1262453 ?auto_1262454 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262492 - SURFACE
      ?auto_1262493 - SURFACE
      ?auto_1262494 - SURFACE
      ?auto_1262495 - SURFACE
      ?auto_1262496 - SURFACE
      ?auto_1262497 - SURFACE
      ?auto_1262498 - SURFACE
    )
    :vars
    (
      ?auto_1262501 - HOIST
      ?auto_1262499 - PLACE
      ?auto_1262500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262501 ?auto_1262499 ) ( SURFACE-AT ?auto_1262497 ?auto_1262499 ) ( CLEAR ?auto_1262497 ) ( IS-CRATE ?auto_1262498 ) ( not ( = ?auto_1262497 ?auto_1262498 ) ) ( TRUCK-AT ?auto_1262500 ?auto_1262499 ) ( AVAILABLE ?auto_1262501 ) ( IN ?auto_1262498 ?auto_1262500 ) ( ON ?auto_1262497 ?auto_1262496 ) ( not ( = ?auto_1262496 ?auto_1262497 ) ) ( not ( = ?auto_1262496 ?auto_1262498 ) ) ( ON ?auto_1262493 ?auto_1262492 ) ( ON ?auto_1262494 ?auto_1262493 ) ( ON ?auto_1262495 ?auto_1262494 ) ( ON ?auto_1262496 ?auto_1262495 ) ( not ( = ?auto_1262492 ?auto_1262493 ) ) ( not ( = ?auto_1262492 ?auto_1262494 ) ) ( not ( = ?auto_1262492 ?auto_1262495 ) ) ( not ( = ?auto_1262492 ?auto_1262496 ) ) ( not ( = ?auto_1262492 ?auto_1262497 ) ) ( not ( = ?auto_1262492 ?auto_1262498 ) ) ( not ( = ?auto_1262493 ?auto_1262494 ) ) ( not ( = ?auto_1262493 ?auto_1262495 ) ) ( not ( = ?auto_1262493 ?auto_1262496 ) ) ( not ( = ?auto_1262493 ?auto_1262497 ) ) ( not ( = ?auto_1262493 ?auto_1262498 ) ) ( not ( = ?auto_1262494 ?auto_1262495 ) ) ( not ( = ?auto_1262494 ?auto_1262496 ) ) ( not ( = ?auto_1262494 ?auto_1262497 ) ) ( not ( = ?auto_1262494 ?auto_1262498 ) ) ( not ( = ?auto_1262495 ?auto_1262496 ) ) ( not ( = ?auto_1262495 ?auto_1262497 ) ) ( not ( = ?auto_1262495 ?auto_1262498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262496 ?auto_1262497 ?auto_1262498 )
      ( MAKE-6CRATE-VERIFY ?auto_1262492 ?auto_1262493 ?auto_1262494 ?auto_1262495 ?auto_1262496 ?auto_1262497 ?auto_1262498 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262543 - SURFACE
      ?auto_1262544 - SURFACE
      ?auto_1262545 - SURFACE
      ?auto_1262546 - SURFACE
      ?auto_1262547 - SURFACE
      ?auto_1262548 - SURFACE
      ?auto_1262549 - SURFACE
    )
    :vars
    (
      ?auto_1262552 - HOIST
      ?auto_1262551 - PLACE
      ?auto_1262553 - TRUCK
      ?auto_1262550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262552 ?auto_1262551 ) ( SURFACE-AT ?auto_1262548 ?auto_1262551 ) ( CLEAR ?auto_1262548 ) ( IS-CRATE ?auto_1262549 ) ( not ( = ?auto_1262548 ?auto_1262549 ) ) ( AVAILABLE ?auto_1262552 ) ( IN ?auto_1262549 ?auto_1262553 ) ( ON ?auto_1262548 ?auto_1262547 ) ( not ( = ?auto_1262547 ?auto_1262548 ) ) ( not ( = ?auto_1262547 ?auto_1262549 ) ) ( TRUCK-AT ?auto_1262553 ?auto_1262550 ) ( not ( = ?auto_1262550 ?auto_1262551 ) ) ( ON ?auto_1262544 ?auto_1262543 ) ( ON ?auto_1262545 ?auto_1262544 ) ( ON ?auto_1262546 ?auto_1262545 ) ( ON ?auto_1262547 ?auto_1262546 ) ( not ( = ?auto_1262543 ?auto_1262544 ) ) ( not ( = ?auto_1262543 ?auto_1262545 ) ) ( not ( = ?auto_1262543 ?auto_1262546 ) ) ( not ( = ?auto_1262543 ?auto_1262547 ) ) ( not ( = ?auto_1262543 ?auto_1262548 ) ) ( not ( = ?auto_1262543 ?auto_1262549 ) ) ( not ( = ?auto_1262544 ?auto_1262545 ) ) ( not ( = ?auto_1262544 ?auto_1262546 ) ) ( not ( = ?auto_1262544 ?auto_1262547 ) ) ( not ( = ?auto_1262544 ?auto_1262548 ) ) ( not ( = ?auto_1262544 ?auto_1262549 ) ) ( not ( = ?auto_1262545 ?auto_1262546 ) ) ( not ( = ?auto_1262545 ?auto_1262547 ) ) ( not ( = ?auto_1262545 ?auto_1262548 ) ) ( not ( = ?auto_1262545 ?auto_1262549 ) ) ( not ( = ?auto_1262546 ?auto_1262547 ) ) ( not ( = ?auto_1262546 ?auto_1262548 ) ) ( not ( = ?auto_1262546 ?auto_1262549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262547 ?auto_1262548 ?auto_1262549 )
      ( MAKE-6CRATE-VERIFY ?auto_1262543 ?auto_1262544 ?auto_1262545 ?auto_1262546 ?auto_1262547 ?auto_1262548 ?auto_1262549 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262600 - SURFACE
      ?auto_1262601 - SURFACE
      ?auto_1262602 - SURFACE
      ?auto_1262603 - SURFACE
      ?auto_1262604 - SURFACE
      ?auto_1262605 - SURFACE
      ?auto_1262606 - SURFACE
    )
    :vars
    (
      ?auto_1262610 - HOIST
      ?auto_1262609 - PLACE
      ?auto_1262611 - TRUCK
      ?auto_1262607 - PLACE
      ?auto_1262608 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262610 ?auto_1262609 ) ( SURFACE-AT ?auto_1262605 ?auto_1262609 ) ( CLEAR ?auto_1262605 ) ( IS-CRATE ?auto_1262606 ) ( not ( = ?auto_1262605 ?auto_1262606 ) ) ( AVAILABLE ?auto_1262610 ) ( ON ?auto_1262605 ?auto_1262604 ) ( not ( = ?auto_1262604 ?auto_1262605 ) ) ( not ( = ?auto_1262604 ?auto_1262606 ) ) ( TRUCK-AT ?auto_1262611 ?auto_1262607 ) ( not ( = ?auto_1262607 ?auto_1262609 ) ) ( HOIST-AT ?auto_1262608 ?auto_1262607 ) ( LIFTING ?auto_1262608 ?auto_1262606 ) ( not ( = ?auto_1262610 ?auto_1262608 ) ) ( ON ?auto_1262601 ?auto_1262600 ) ( ON ?auto_1262602 ?auto_1262601 ) ( ON ?auto_1262603 ?auto_1262602 ) ( ON ?auto_1262604 ?auto_1262603 ) ( not ( = ?auto_1262600 ?auto_1262601 ) ) ( not ( = ?auto_1262600 ?auto_1262602 ) ) ( not ( = ?auto_1262600 ?auto_1262603 ) ) ( not ( = ?auto_1262600 ?auto_1262604 ) ) ( not ( = ?auto_1262600 ?auto_1262605 ) ) ( not ( = ?auto_1262600 ?auto_1262606 ) ) ( not ( = ?auto_1262601 ?auto_1262602 ) ) ( not ( = ?auto_1262601 ?auto_1262603 ) ) ( not ( = ?auto_1262601 ?auto_1262604 ) ) ( not ( = ?auto_1262601 ?auto_1262605 ) ) ( not ( = ?auto_1262601 ?auto_1262606 ) ) ( not ( = ?auto_1262602 ?auto_1262603 ) ) ( not ( = ?auto_1262602 ?auto_1262604 ) ) ( not ( = ?auto_1262602 ?auto_1262605 ) ) ( not ( = ?auto_1262602 ?auto_1262606 ) ) ( not ( = ?auto_1262603 ?auto_1262604 ) ) ( not ( = ?auto_1262603 ?auto_1262605 ) ) ( not ( = ?auto_1262603 ?auto_1262606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262604 ?auto_1262605 ?auto_1262606 )
      ( MAKE-6CRATE-VERIFY ?auto_1262600 ?auto_1262601 ?auto_1262602 ?auto_1262603 ?auto_1262604 ?auto_1262605 ?auto_1262606 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262663 - SURFACE
      ?auto_1262664 - SURFACE
      ?auto_1262665 - SURFACE
      ?auto_1262666 - SURFACE
      ?auto_1262667 - SURFACE
      ?auto_1262668 - SURFACE
      ?auto_1262669 - SURFACE
    )
    :vars
    (
      ?auto_1262671 - HOIST
      ?auto_1262672 - PLACE
      ?auto_1262675 - TRUCK
      ?auto_1262674 - PLACE
      ?auto_1262670 - HOIST
      ?auto_1262673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262671 ?auto_1262672 ) ( SURFACE-AT ?auto_1262668 ?auto_1262672 ) ( CLEAR ?auto_1262668 ) ( IS-CRATE ?auto_1262669 ) ( not ( = ?auto_1262668 ?auto_1262669 ) ) ( AVAILABLE ?auto_1262671 ) ( ON ?auto_1262668 ?auto_1262667 ) ( not ( = ?auto_1262667 ?auto_1262668 ) ) ( not ( = ?auto_1262667 ?auto_1262669 ) ) ( TRUCK-AT ?auto_1262675 ?auto_1262674 ) ( not ( = ?auto_1262674 ?auto_1262672 ) ) ( HOIST-AT ?auto_1262670 ?auto_1262674 ) ( not ( = ?auto_1262671 ?auto_1262670 ) ) ( AVAILABLE ?auto_1262670 ) ( SURFACE-AT ?auto_1262669 ?auto_1262674 ) ( ON ?auto_1262669 ?auto_1262673 ) ( CLEAR ?auto_1262669 ) ( not ( = ?auto_1262668 ?auto_1262673 ) ) ( not ( = ?auto_1262669 ?auto_1262673 ) ) ( not ( = ?auto_1262667 ?auto_1262673 ) ) ( ON ?auto_1262664 ?auto_1262663 ) ( ON ?auto_1262665 ?auto_1262664 ) ( ON ?auto_1262666 ?auto_1262665 ) ( ON ?auto_1262667 ?auto_1262666 ) ( not ( = ?auto_1262663 ?auto_1262664 ) ) ( not ( = ?auto_1262663 ?auto_1262665 ) ) ( not ( = ?auto_1262663 ?auto_1262666 ) ) ( not ( = ?auto_1262663 ?auto_1262667 ) ) ( not ( = ?auto_1262663 ?auto_1262668 ) ) ( not ( = ?auto_1262663 ?auto_1262669 ) ) ( not ( = ?auto_1262663 ?auto_1262673 ) ) ( not ( = ?auto_1262664 ?auto_1262665 ) ) ( not ( = ?auto_1262664 ?auto_1262666 ) ) ( not ( = ?auto_1262664 ?auto_1262667 ) ) ( not ( = ?auto_1262664 ?auto_1262668 ) ) ( not ( = ?auto_1262664 ?auto_1262669 ) ) ( not ( = ?auto_1262664 ?auto_1262673 ) ) ( not ( = ?auto_1262665 ?auto_1262666 ) ) ( not ( = ?auto_1262665 ?auto_1262667 ) ) ( not ( = ?auto_1262665 ?auto_1262668 ) ) ( not ( = ?auto_1262665 ?auto_1262669 ) ) ( not ( = ?auto_1262665 ?auto_1262673 ) ) ( not ( = ?auto_1262666 ?auto_1262667 ) ) ( not ( = ?auto_1262666 ?auto_1262668 ) ) ( not ( = ?auto_1262666 ?auto_1262669 ) ) ( not ( = ?auto_1262666 ?auto_1262673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262667 ?auto_1262668 ?auto_1262669 )
      ( MAKE-6CRATE-VERIFY ?auto_1262663 ?auto_1262664 ?auto_1262665 ?auto_1262666 ?auto_1262667 ?auto_1262668 ?auto_1262669 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262727 - SURFACE
      ?auto_1262728 - SURFACE
      ?auto_1262729 - SURFACE
      ?auto_1262730 - SURFACE
      ?auto_1262731 - SURFACE
      ?auto_1262732 - SURFACE
      ?auto_1262733 - SURFACE
    )
    :vars
    (
      ?auto_1262734 - HOIST
      ?auto_1262739 - PLACE
      ?auto_1262735 - PLACE
      ?auto_1262737 - HOIST
      ?auto_1262736 - SURFACE
      ?auto_1262738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262734 ?auto_1262739 ) ( SURFACE-AT ?auto_1262732 ?auto_1262739 ) ( CLEAR ?auto_1262732 ) ( IS-CRATE ?auto_1262733 ) ( not ( = ?auto_1262732 ?auto_1262733 ) ) ( AVAILABLE ?auto_1262734 ) ( ON ?auto_1262732 ?auto_1262731 ) ( not ( = ?auto_1262731 ?auto_1262732 ) ) ( not ( = ?auto_1262731 ?auto_1262733 ) ) ( not ( = ?auto_1262735 ?auto_1262739 ) ) ( HOIST-AT ?auto_1262737 ?auto_1262735 ) ( not ( = ?auto_1262734 ?auto_1262737 ) ) ( AVAILABLE ?auto_1262737 ) ( SURFACE-AT ?auto_1262733 ?auto_1262735 ) ( ON ?auto_1262733 ?auto_1262736 ) ( CLEAR ?auto_1262733 ) ( not ( = ?auto_1262732 ?auto_1262736 ) ) ( not ( = ?auto_1262733 ?auto_1262736 ) ) ( not ( = ?auto_1262731 ?auto_1262736 ) ) ( TRUCK-AT ?auto_1262738 ?auto_1262739 ) ( ON ?auto_1262728 ?auto_1262727 ) ( ON ?auto_1262729 ?auto_1262728 ) ( ON ?auto_1262730 ?auto_1262729 ) ( ON ?auto_1262731 ?auto_1262730 ) ( not ( = ?auto_1262727 ?auto_1262728 ) ) ( not ( = ?auto_1262727 ?auto_1262729 ) ) ( not ( = ?auto_1262727 ?auto_1262730 ) ) ( not ( = ?auto_1262727 ?auto_1262731 ) ) ( not ( = ?auto_1262727 ?auto_1262732 ) ) ( not ( = ?auto_1262727 ?auto_1262733 ) ) ( not ( = ?auto_1262727 ?auto_1262736 ) ) ( not ( = ?auto_1262728 ?auto_1262729 ) ) ( not ( = ?auto_1262728 ?auto_1262730 ) ) ( not ( = ?auto_1262728 ?auto_1262731 ) ) ( not ( = ?auto_1262728 ?auto_1262732 ) ) ( not ( = ?auto_1262728 ?auto_1262733 ) ) ( not ( = ?auto_1262728 ?auto_1262736 ) ) ( not ( = ?auto_1262729 ?auto_1262730 ) ) ( not ( = ?auto_1262729 ?auto_1262731 ) ) ( not ( = ?auto_1262729 ?auto_1262732 ) ) ( not ( = ?auto_1262729 ?auto_1262733 ) ) ( not ( = ?auto_1262729 ?auto_1262736 ) ) ( not ( = ?auto_1262730 ?auto_1262731 ) ) ( not ( = ?auto_1262730 ?auto_1262732 ) ) ( not ( = ?auto_1262730 ?auto_1262733 ) ) ( not ( = ?auto_1262730 ?auto_1262736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262731 ?auto_1262732 ?auto_1262733 )
      ( MAKE-6CRATE-VERIFY ?auto_1262727 ?auto_1262728 ?auto_1262729 ?auto_1262730 ?auto_1262731 ?auto_1262732 ?auto_1262733 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262791 - SURFACE
      ?auto_1262792 - SURFACE
      ?auto_1262793 - SURFACE
      ?auto_1262794 - SURFACE
      ?auto_1262795 - SURFACE
      ?auto_1262796 - SURFACE
      ?auto_1262797 - SURFACE
    )
    :vars
    (
      ?auto_1262801 - HOIST
      ?auto_1262799 - PLACE
      ?auto_1262803 - PLACE
      ?auto_1262800 - HOIST
      ?auto_1262798 - SURFACE
      ?auto_1262802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262801 ?auto_1262799 ) ( IS-CRATE ?auto_1262797 ) ( not ( = ?auto_1262796 ?auto_1262797 ) ) ( not ( = ?auto_1262795 ?auto_1262796 ) ) ( not ( = ?auto_1262795 ?auto_1262797 ) ) ( not ( = ?auto_1262803 ?auto_1262799 ) ) ( HOIST-AT ?auto_1262800 ?auto_1262803 ) ( not ( = ?auto_1262801 ?auto_1262800 ) ) ( AVAILABLE ?auto_1262800 ) ( SURFACE-AT ?auto_1262797 ?auto_1262803 ) ( ON ?auto_1262797 ?auto_1262798 ) ( CLEAR ?auto_1262797 ) ( not ( = ?auto_1262796 ?auto_1262798 ) ) ( not ( = ?auto_1262797 ?auto_1262798 ) ) ( not ( = ?auto_1262795 ?auto_1262798 ) ) ( TRUCK-AT ?auto_1262802 ?auto_1262799 ) ( SURFACE-AT ?auto_1262795 ?auto_1262799 ) ( CLEAR ?auto_1262795 ) ( LIFTING ?auto_1262801 ?auto_1262796 ) ( IS-CRATE ?auto_1262796 ) ( ON ?auto_1262792 ?auto_1262791 ) ( ON ?auto_1262793 ?auto_1262792 ) ( ON ?auto_1262794 ?auto_1262793 ) ( ON ?auto_1262795 ?auto_1262794 ) ( not ( = ?auto_1262791 ?auto_1262792 ) ) ( not ( = ?auto_1262791 ?auto_1262793 ) ) ( not ( = ?auto_1262791 ?auto_1262794 ) ) ( not ( = ?auto_1262791 ?auto_1262795 ) ) ( not ( = ?auto_1262791 ?auto_1262796 ) ) ( not ( = ?auto_1262791 ?auto_1262797 ) ) ( not ( = ?auto_1262791 ?auto_1262798 ) ) ( not ( = ?auto_1262792 ?auto_1262793 ) ) ( not ( = ?auto_1262792 ?auto_1262794 ) ) ( not ( = ?auto_1262792 ?auto_1262795 ) ) ( not ( = ?auto_1262792 ?auto_1262796 ) ) ( not ( = ?auto_1262792 ?auto_1262797 ) ) ( not ( = ?auto_1262792 ?auto_1262798 ) ) ( not ( = ?auto_1262793 ?auto_1262794 ) ) ( not ( = ?auto_1262793 ?auto_1262795 ) ) ( not ( = ?auto_1262793 ?auto_1262796 ) ) ( not ( = ?auto_1262793 ?auto_1262797 ) ) ( not ( = ?auto_1262793 ?auto_1262798 ) ) ( not ( = ?auto_1262794 ?auto_1262795 ) ) ( not ( = ?auto_1262794 ?auto_1262796 ) ) ( not ( = ?auto_1262794 ?auto_1262797 ) ) ( not ( = ?auto_1262794 ?auto_1262798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262795 ?auto_1262796 ?auto_1262797 )
      ( MAKE-6CRATE-VERIFY ?auto_1262791 ?auto_1262792 ?auto_1262793 ?auto_1262794 ?auto_1262795 ?auto_1262796 ?auto_1262797 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262855 - SURFACE
      ?auto_1262856 - SURFACE
      ?auto_1262857 - SURFACE
      ?auto_1262858 - SURFACE
      ?auto_1262859 - SURFACE
      ?auto_1262860 - SURFACE
      ?auto_1262861 - SURFACE
    )
    :vars
    (
      ?auto_1262864 - HOIST
      ?auto_1262867 - PLACE
      ?auto_1262862 - PLACE
      ?auto_1262866 - HOIST
      ?auto_1262863 - SURFACE
      ?auto_1262865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262864 ?auto_1262867 ) ( IS-CRATE ?auto_1262861 ) ( not ( = ?auto_1262860 ?auto_1262861 ) ) ( not ( = ?auto_1262859 ?auto_1262860 ) ) ( not ( = ?auto_1262859 ?auto_1262861 ) ) ( not ( = ?auto_1262862 ?auto_1262867 ) ) ( HOIST-AT ?auto_1262866 ?auto_1262862 ) ( not ( = ?auto_1262864 ?auto_1262866 ) ) ( AVAILABLE ?auto_1262866 ) ( SURFACE-AT ?auto_1262861 ?auto_1262862 ) ( ON ?auto_1262861 ?auto_1262863 ) ( CLEAR ?auto_1262861 ) ( not ( = ?auto_1262860 ?auto_1262863 ) ) ( not ( = ?auto_1262861 ?auto_1262863 ) ) ( not ( = ?auto_1262859 ?auto_1262863 ) ) ( TRUCK-AT ?auto_1262865 ?auto_1262867 ) ( SURFACE-AT ?auto_1262859 ?auto_1262867 ) ( CLEAR ?auto_1262859 ) ( IS-CRATE ?auto_1262860 ) ( AVAILABLE ?auto_1262864 ) ( IN ?auto_1262860 ?auto_1262865 ) ( ON ?auto_1262856 ?auto_1262855 ) ( ON ?auto_1262857 ?auto_1262856 ) ( ON ?auto_1262858 ?auto_1262857 ) ( ON ?auto_1262859 ?auto_1262858 ) ( not ( = ?auto_1262855 ?auto_1262856 ) ) ( not ( = ?auto_1262855 ?auto_1262857 ) ) ( not ( = ?auto_1262855 ?auto_1262858 ) ) ( not ( = ?auto_1262855 ?auto_1262859 ) ) ( not ( = ?auto_1262855 ?auto_1262860 ) ) ( not ( = ?auto_1262855 ?auto_1262861 ) ) ( not ( = ?auto_1262855 ?auto_1262863 ) ) ( not ( = ?auto_1262856 ?auto_1262857 ) ) ( not ( = ?auto_1262856 ?auto_1262858 ) ) ( not ( = ?auto_1262856 ?auto_1262859 ) ) ( not ( = ?auto_1262856 ?auto_1262860 ) ) ( not ( = ?auto_1262856 ?auto_1262861 ) ) ( not ( = ?auto_1262856 ?auto_1262863 ) ) ( not ( = ?auto_1262857 ?auto_1262858 ) ) ( not ( = ?auto_1262857 ?auto_1262859 ) ) ( not ( = ?auto_1262857 ?auto_1262860 ) ) ( not ( = ?auto_1262857 ?auto_1262861 ) ) ( not ( = ?auto_1262857 ?auto_1262863 ) ) ( not ( = ?auto_1262858 ?auto_1262859 ) ) ( not ( = ?auto_1262858 ?auto_1262860 ) ) ( not ( = ?auto_1262858 ?auto_1262861 ) ) ( not ( = ?auto_1262858 ?auto_1262863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262859 ?auto_1262860 ?auto_1262861 )
      ( MAKE-6CRATE-VERIFY ?auto_1262855 ?auto_1262856 ?auto_1262857 ?auto_1262858 ?auto_1262859 ?auto_1262860 ?auto_1262861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1264129 - SURFACE
      ?auto_1264130 - SURFACE
    )
    :vars
    (
      ?auto_1264135 - HOIST
      ?auto_1264136 - PLACE
      ?auto_1264137 - SURFACE
      ?auto_1264134 - PLACE
      ?auto_1264133 - HOIST
      ?auto_1264132 - SURFACE
      ?auto_1264131 - TRUCK
      ?auto_1264138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264135 ?auto_1264136 ) ( SURFACE-AT ?auto_1264129 ?auto_1264136 ) ( CLEAR ?auto_1264129 ) ( IS-CRATE ?auto_1264130 ) ( not ( = ?auto_1264129 ?auto_1264130 ) ) ( ON ?auto_1264129 ?auto_1264137 ) ( not ( = ?auto_1264137 ?auto_1264129 ) ) ( not ( = ?auto_1264137 ?auto_1264130 ) ) ( not ( = ?auto_1264134 ?auto_1264136 ) ) ( HOIST-AT ?auto_1264133 ?auto_1264134 ) ( not ( = ?auto_1264135 ?auto_1264133 ) ) ( AVAILABLE ?auto_1264133 ) ( SURFACE-AT ?auto_1264130 ?auto_1264134 ) ( ON ?auto_1264130 ?auto_1264132 ) ( CLEAR ?auto_1264130 ) ( not ( = ?auto_1264129 ?auto_1264132 ) ) ( not ( = ?auto_1264130 ?auto_1264132 ) ) ( not ( = ?auto_1264137 ?auto_1264132 ) ) ( TRUCK-AT ?auto_1264131 ?auto_1264136 ) ( LIFTING ?auto_1264135 ?auto_1264138 ) ( IS-CRATE ?auto_1264138 ) ( not ( = ?auto_1264129 ?auto_1264138 ) ) ( not ( = ?auto_1264130 ?auto_1264138 ) ) ( not ( = ?auto_1264137 ?auto_1264138 ) ) ( not ( = ?auto_1264132 ?auto_1264138 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1264135 ?auto_1264138 ?auto_1264131 ?auto_1264136 )
      ( MAKE-1CRATE ?auto_1264129 ?auto_1264130 )
      ( MAKE-1CRATE-VERIFY ?auto_1264129 ?auto_1264130 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264806 - SURFACE
      ?auto_1264807 - SURFACE
      ?auto_1264808 - SURFACE
      ?auto_1264809 - SURFACE
      ?auto_1264810 - SURFACE
      ?auto_1264811 - SURFACE
      ?auto_1264812 - SURFACE
      ?auto_1264813 - SURFACE
    )
    :vars
    (
      ?auto_1264815 - HOIST
      ?auto_1264814 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264815 ?auto_1264814 ) ( SURFACE-AT ?auto_1264812 ?auto_1264814 ) ( CLEAR ?auto_1264812 ) ( LIFTING ?auto_1264815 ?auto_1264813 ) ( IS-CRATE ?auto_1264813 ) ( not ( = ?auto_1264812 ?auto_1264813 ) ) ( ON ?auto_1264807 ?auto_1264806 ) ( ON ?auto_1264808 ?auto_1264807 ) ( ON ?auto_1264809 ?auto_1264808 ) ( ON ?auto_1264810 ?auto_1264809 ) ( ON ?auto_1264811 ?auto_1264810 ) ( ON ?auto_1264812 ?auto_1264811 ) ( not ( = ?auto_1264806 ?auto_1264807 ) ) ( not ( = ?auto_1264806 ?auto_1264808 ) ) ( not ( = ?auto_1264806 ?auto_1264809 ) ) ( not ( = ?auto_1264806 ?auto_1264810 ) ) ( not ( = ?auto_1264806 ?auto_1264811 ) ) ( not ( = ?auto_1264806 ?auto_1264812 ) ) ( not ( = ?auto_1264806 ?auto_1264813 ) ) ( not ( = ?auto_1264807 ?auto_1264808 ) ) ( not ( = ?auto_1264807 ?auto_1264809 ) ) ( not ( = ?auto_1264807 ?auto_1264810 ) ) ( not ( = ?auto_1264807 ?auto_1264811 ) ) ( not ( = ?auto_1264807 ?auto_1264812 ) ) ( not ( = ?auto_1264807 ?auto_1264813 ) ) ( not ( = ?auto_1264808 ?auto_1264809 ) ) ( not ( = ?auto_1264808 ?auto_1264810 ) ) ( not ( = ?auto_1264808 ?auto_1264811 ) ) ( not ( = ?auto_1264808 ?auto_1264812 ) ) ( not ( = ?auto_1264808 ?auto_1264813 ) ) ( not ( = ?auto_1264809 ?auto_1264810 ) ) ( not ( = ?auto_1264809 ?auto_1264811 ) ) ( not ( = ?auto_1264809 ?auto_1264812 ) ) ( not ( = ?auto_1264809 ?auto_1264813 ) ) ( not ( = ?auto_1264810 ?auto_1264811 ) ) ( not ( = ?auto_1264810 ?auto_1264812 ) ) ( not ( = ?auto_1264810 ?auto_1264813 ) ) ( not ( = ?auto_1264811 ?auto_1264812 ) ) ( not ( = ?auto_1264811 ?auto_1264813 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1264812 ?auto_1264813 )
      ( MAKE-7CRATE-VERIFY ?auto_1264806 ?auto_1264807 ?auto_1264808 ?auto_1264809 ?auto_1264810 ?auto_1264811 ?auto_1264812 ?auto_1264813 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264861 - SURFACE
      ?auto_1264862 - SURFACE
      ?auto_1264863 - SURFACE
      ?auto_1264864 - SURFACE
      ?auto_1264865 - SURFACE
      ?auto_1264866 - SURFACE
      ?auto_1264867 - SURFACE
      ?auto_1264868 - SURFACE
    )
    :vars
    (
      ?auto_1264870 - HOIST
      ?auto_1264871 - PLACE
      ?auto_1264869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264870 ?auto_1264871 ) ( SURFACE-AT ?auto_1264867 ?auto_1264871 ) ( CLEAR ?auto_1264867 ) ( IS-CRATE ?auto_1264868 ) ( not ( = ?auto_1264867 ?auto_1264868 ) ) ( TRUCK-AT ?auto_1264869 ?auto_1264871 ) ( AVAILABLE ?auto_1264870 ) ( IN ?auto_1264868 ?auto_1264869 ) ( ON ?auto_1264867 ?auto_1264866 ) ( not ( = ?auto_1264866 ?auto_1264867 ) ) ( not ( = ?auto_1264866 ?auto_1264868 ) ) ( ON ?auto_1264862 ?auto_1264861 ) ( ON ?auto_1264863 ?auto_1264862 ) ( ON ?auto_1264864 ?auto_1264863 ) ( ON ?auto_1264865 ?auto_1264864 ) ( ON ?auto_1264866 ?auto_1264865 ) ( not ( = ?auto_1264861 ?auto_1264862 ) ) ( not ( = ?auto_1264861 ?auto_1264863 ) ) ( not ( = ?auto_1264861 ?auto_1264864 ) ) ( not ( = ?auto_1264861 ?auto_1264865 ) ) ( not ( = ?auto_1264861 ?auto_1264866 ) ) ( not ( = ?auto_1264861 ?auto_1264867 ) ) ( not ( = ?auto_1264861 ?auto_1264868 ) ) ( not ( = ?auto_1264862 ?auto_1264863 ) ) ( not ( = ?auto_1264862 ?auto_1264864 ) ) ( not ( = ?auto_1264862 ?auto_1264865 ) ) ( not ( = ?auto_1264862 ?auto_1264866 ) ) ( not ( = ?auto_1264862 ?auto_1264867 ) ) ( not ( = ?auto_1264862 ?auto_1264868 ) ) ( not ( = ?auto_1264863 ?auto_1264864 ) ) ( not ( = ?auto_1264863 ?auto_1264865 ) ) ( not ( = ?auto_1264863 ?auto_1264866 ) ) ( not ( = ?auto_1264863 ?auto_1264867 ) ) ( not ( = ?auto_1264863 ?auto_1264868 ) ) ( not ( = ?auto_1264864 ?auto_1264865 ) ) ( not ( = ?auto_1264864 ?auto_1264866 ) ) ( not ( = ?auto_1264864 ?auto_1264867 ) ) ( not ( = ?auto_1264864 ?auto_1264868 ) ) ( not ( = ?auto_1264865 ?auto_1264866 ) ) ( not ( = ?auto_1264865 ?auto_1264867 ) ) ( not ( = ?auto_1264865 ?auto_1264868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264866 ?auto_1264867 ?auto_1264868 )
      ( MAKE-7CRATE-VERIFY ?auto_1264861 ?auto_1264862 ?auto_1264863 ?auto_1264864 ?auto_1264865 ?auto_1264866 ?auto_1264867 ?auto_1264868 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264924 - SURFACE
      ?auto_1264925 - SURFACE
      ?auto_1264926 - SURFACE
      ?auto_1264927 - SURFACE
      ?auto_1264928 - SURFACE
      ?auto_1264929 - SURFACE
      ?auto_1264930 - SURFACE
      ?auto_1264931 - SURFACE
    )
    :vars
    (
      ?auto_1264935 - HOIST
      ?auto_1264933 - PLACE
      ?auto_1264934 - TRUCK
      ?auto_1264932 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264935 ?auto_1264933 ) ( SURFACE-AT ?auto_1264930 ?auto_1264933 ) ( CLEAR ?auto_1264930 ) ( IS-CRATE ?auto_1264931 ) ( not ( = ?auto_1264930 ?auto_1264931 ) ) ( AVAILABLE ?auto_1264935 ) ( IN ?auto_1264931 ?auto_1264934 ) ( ON ?auto_1264930 ?auto_1264929 ) ( not ( = ?auto_1264929 ?auto_1264930 ) ) ( not ( = ?auto_1264929 ?auto_1264931 ) ) ( TRUCK-AT ?auto_1264934 ?auto_1264932 ) ( not ( = ?auto_1264932 ?auto_1264933 ) ) ( ON ?auto_1264925 ?auto_1264924 ) ( ON ?auto_1264926 ?auto_1264925 ) ( ON ?auto_1264927 ?auto_1264926 ) ( ON ?auto_1264928 ?auto_1264927 ) ( ON ?auto_1264929 ?auto_1264928 ) ( not ( = ?auto_1264924 ?auto_1264925 ) ) ( not ( = ?auto_1264924 ?auto_1264926 ) ) ( not ( = ?auto_1264924 ?auto_1264927 ) ) ( not ( = ?auto_1264924 ?auto_1264928 ) ) ( not ( = ?auto_1264924 ?auto_1264929 ) ) ( not ( = ?auto_1264924 ?auto_1264930 ) ) ( not ( = ?auto_1264924 ?auto_1264931 ) ) ( not ( = ?auto_1264925 ?auto_1264926 ) ) ( not ( = ?auto_1264925 ?auto_1264927 ) ) ( not ( = ?auto_1264925 ?auto_1264928 ) ) ( not ( = ?auto_1264925 ?auto_1264929 ) ) ( not ( = ?auto_1264925 ?auto_1264930 ) ) ( not ( = ?auto_1264925 ?auto_1264931 ) ) ( not ( = ?auto_1264926 ?auto_1264927 ) ) ( not ( = ?auto_1264926 ?auto_1264928 ) ) ( not ( = ?auto_1264926 ?auto_1264929 ) ) ( not ( = ?auto_1264926 ?auto_1264930 ) ) ( not ( = ?auto_1264926 ?auto_1264931 ) ) ( not ( = ?auto_1264927 ?auto_1264928 ) ) ( not ( = ?auto_1264927 ?auto_1264929 ) ) ( not ( = ?auto_1264927 ?auto_1264930 ) ) ( not ( = ?auto_1264927 ?auto_1264931 ) ) ( not ( = ?auto_1264928 ?auto_1264929 ) ) ( not ( = ?auto_1264928 ?auto_1264930 ) ) ( not ( = ?auto_1264928 ?auto_1264931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264929 ?auto_1264930 ?auto_1264931 )
      ( MAKE-7CRATE-VERIFY ?auto_1264924 ?auto_1264925 ?auto_1264926 ?auto_1264927 ?auto_1264928 ?auto_1264929 ?auto_1264930 ?auto_1264931 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264994 - SURFACE
      ?auto_1264995 - SURFACE
      ?auto_1264996 - SURFACE
      ?auto_1264997 - SURFACE
      ?auto_1264998 - SURFACE
      ?auto_1264999 - SURFACE
      ?auto_1265000 - SURFACE
      ?auto_1265001 - SURFACE
    )
    :vars
    (
      ?auto_1265006 - HOIST
      ?auto_1265004 - PLACE
      ?auto_1265005 - TRUCK
      ?auto_1265002 - PLACE
      ?auto_1265003 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265006 ?auto_1265004 ) ( SURFACE-AT ?auto_1265000 ?auto_1265004 ) ( CLEAR ?auto_1265000 ) ( IS-CRATE ?auto_1265001 ) ( not ( = ?auto_1265000 ?auto_1265001 ) ) ( AVAILABLE ?auto_1265006 ) ( ON ?auto_1265000 ?auto_1264999 ) ( not ( = ?auto_1264999 ?auto_1265000 ) ) ( not ( = ?auto_1264999 ?auto_1265001 ) ) ( TRUCK-AT ?auto_1265005 ?auto_1265002 ) ( not ( = ?auto_1265002 ?auto_1265004 ) ) ( HOIST-AT ?auto_1265003 ?auto_1265002 ) ( LIFTING ?auto_1265003 ?auto_1265001 ) ( not ( = ?auto_1265006 ?auto_1265003 ) ) ( ON ?auto_1264995 ?auto_1264994 ) ( ON ?auto_1264996 ?auto_1264995 ) ( ON ?auto_1264997 ?auto_1264996 ) ( ON ?auto_1264998 ?auto_1264997 ) ( ON ?auto_1264999 ?auto_1264998 ) ( not ( = ?auto_1264994 ?auto_1264995 ) ) ( not ( = ?auto_1264994 ?auto_1264996 ) ) ( not ( = ?auto_1264994 ?auto_1264997 ) ) ( not ( = ?auto_1264994 ?auto_1264998 ) ) ( not ( = ?auto_1264994 ?auto_1264999 ) ) ( not ( = ?auto_1264994 ?auto_1265000 ) ) ( not ( = ?auto_1264994 ?auto_1265001 ) ) ( not ( = ?auto_1264995 ?auto_1264996 ) ) ( not ( = ?auto_1264995 ?auto_1264997 ) ) ( not ( = ?auto_1264995 ?auto_1264998 ) ) ( not ( = ?auto_1264995 ?auto_1264999 ) ) ( not ( = ?auto_1264995 ?auto_1265000 ) ) ( not ( = ?auto_1264995 ?auto_1265001 ) ) ( not ( = ?auto_1264996 ?auto_1264997 ) ) ( not ( = ?auto_1264996 ?auto_1264998 ) ) ( not ( = ?auto_1264996 ?auto_1264999 ) ) ( not ( = ?auto_1264996 ?auto_1265000 ) ) ( not ( = ?auto_1264996 ?auto_1265001 ) ) ( not ( = ?auto_1264997 ?auto_1264998 ) ) ( not ( = ?auto_1264997 ?auto_1264999 ) ) ( not ( = ?auto_1264997 ?auto_1265000 ) ) ( not ( = ?auto_1264997 ?auto_1265001 ) ) ( not ( = ?auto_1264998 ?auto_1264999 ) ) ( not ( = ?auto_1264998 ?auto_1265000 ) ) ( not ( = ?auto_1264998 ?auto_1265001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264999 ?auto_1265000 ?auto_1265001 )
      ( MAKE-7CRATE-VERIFY ?auto_1264994 ?auto_1264995 ?auto_1264996 ?auto_1264997 ?auto_1264998 ?auto_1264999 ?auto_1265000 ?auto_1265001 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265071 - SURFACE
      ?auto_1265072 - SURFACE
      ?auto_1265073 - SURFACE
      ?auto_1265074 - SURFACE
      ?auto_1265075 - SURFACE
      ?auto_1265076 - SURFACE
      ?auto_1265077 - SURFACE
      ?auto_1265078 - SURFACE
    )
    :vars
    (
      ?auto_1265081 - HOIST
      ?auto_1265080 - PLACE
      ?auto_1265084 - TRUCK
      ?auto_1265079 - PLACE
      ?auto_1265083 - HOIST
      ?auto_1265082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265081 ?auto_1265080 ) ( SURFACE-AT ?auto_1265077 ?auto_1265080 ) ( CLEAR ?auto_1265077 ) ( IS-CRATE ?auto_1265078 ) ( not ( = ?auto_1265077 ?auto_1265078 ) ) ( AVAILABLE ?auto_1265081 ) ( ON ?auto_1265077 ?auto_1265076 ) ( not ( = ?auto_1265076 ?auto_1265077 ) ) ( not ( = ?auto_1265076 ?auto_1265078 ) ) ( TRUCK-AT ?auto_1265084 ?auto_1265079 ) ( not ( = ?auto_1265079 ?auto_1265080 ) ) ( HOIST-AT ?auto_1265083 ?auto_1265079 ) ( not ( = ?auto_1265081 ?auto_1265083 ) ) ( AVAILABLE ?auto_1265083 ) ( SURFACE-AT ?auto_1265078 ?auto_1265079 ) ( ON ?auto_1265078 ?auto_1265082 ) ( CLEAR ?auto_1265078 ) ( not ( = ?auto_1265077 ?auto_1265082 ) ) ( not ( = ?auto_1265078 ?auto_1265082 ) ) ( not ( = ?auto_1265076 ?auto_1265082 ) ) ( ON ?auto_1265072 ?auto_1265071 ) ( ON ?auto_1265073 ?auto_1265072 ) ( ON ?auto_1265074 ?auto_1265073 ) ( ON ?auto_1265075 ?auto_1265074 ) ( ON ?auto_1265076 ?auto_1265075 ) ( not ( = ?auto_1265071 ?auto_1265072 ) ) ( not ( = ?auto_1265071 ?auto_1265073 ) ) ( not ( = ?auto_1265071 ?auto_1265074 ) ) ( not ( = ?auto_1265071 ?auto_1265075 ) ) ( not ( = ?auto_1265071 ?auto_1265076 ) ) ( not ( = ?auto_1265071 ?auto_1265077 ) ) ( not ( = ?auto_1265071 ?auto_1265078 ) ) ( not ( = ?auto_1265071 ?auto_1265082 ) ) ( not ( = ?auto_1265072 ?auto_1265073 ) ) ( not ( = ?auto_1265072 ?auto_1265074 ) ) ( not ( = ?auto_1265072 ?auto_1265075 ) ) ( not ( = ?auto_1265072 ?auto_1265076 ) ) ( not ( = ?auto_1265072 ?auto_1265077 ) ) ( not ( = ?auto_1265072 ?auto_1265078 ) ) ( not ( = ?auto_1265072 ?auto_1265082 ) ) ( not ( = ?auto_1265073 ?auto_1265074 ) ) ( not ( = ?auto_1265073 ?auto_1265075 ) ) ( not ( = ?auto_1265073 ?auto_1265076 ) ) ( not ( = ?auto_1265073 ?auto_1265077 ) ) ( not ( = ?auto_1265073 ?auto_1265078 ) ) ( not ( = ?auto_1265073 ?auto_1265082 ) ) ( not ( = ?auto_1265074 ?auto_1265075 ) ) ( not ( = ?auto_1265074 ?auto_1265076 ) ) ( not ( = ?auto_1265074 ?auto_1265077 ) ) ( not ( = ?auto_1265074 ?auto_1265078 ) ) ( not ( = ?auto_1265074 ?auto_1265082 ) ) ( not ( = ?auto_1265075 ?auto_1265076 ) ) ( not ( = ?auto_1265075 ?auto_1265077 ) ) ( not ( = ?auto_1265075 ?auto_1265078 ) ) ( not ( = ?auto_1265075 ?auto_1265082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265076 ?auto_1265077 ?auto_1265078 )
      ( MAKE-7CRATE-VERIFY ?auto_1265071 ?auto_1265072 ?auto_1265073 ?auto_1265074 ?auto_1265075 ?auto_1265076 ?auto_1265077 ?auto_1265078 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265149 - SURFACE
      ?auto_1265150 - SURFACE
      ?auto_1265151 - SURFACE
      ?auto_1265152 - SURFACE
      ?auto_1265153 - SURFACE
      ?auto_1265154 - SURFACE
      ?auto_1265155 - SURFACE
      ?auto_1265156 - SURFACE
    )
    :vars
    (
      ?auto_1265160 - HOIST
      ?auto_1265158 - PLACE
      ?auto_1265162 - PLACE
      ?auto_1265159 - HOIST
      ?auto_1265161 - SURFACE
      ?auto_1265157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265160 ?auto_1265158 ) ( SURFACE-AT ?auto_1265155 ?auto_1265158 ) ( CLEAR ?auto_1265155 ) ( IS-CRATE ?auto_1265156 ) ( not ( = ?auto_1265155 ?auto_1265156 ) ) ( AVAILABLE ?auto_1265160 ) ( ON ?auto_1265155 ?auto_1265154 ) ( not ( = ?auto_1265154 ?auto_1265155 ) ) ( not ( = ?auto_1265154 ?auto_1265156 ) ) ( not ( = ?auto_1265162 ?auto_1265158 ) ) ( HOIST-AT ?auto_1265159 ?auto_1265162 ) ( not ( = ?auto_1265160 ?auto_1265159 ) ) ( AVAILABLE ?auto_1265159 ) ( SURFACE-AT ?auto_1265156 ?auto_1265162 ) ( ON ?auto_1265156 ?auto_1265161 ) ( CLEAR ?auto_1265156 ) ( not ( = ?auto_1265155 ?auto_1265161 ) ) ( not ( = ?auto_1265156 ?auto_1265161 ) ) ( not ( = ?auto_1265154 ?auto_1265161 ) ) ( TRUCK-AT ?auto_1265157 ?auto_1265158 ) ( ON ?auto_1265150 ?auto_1265149 ) ( ON ?auto_1265151 ?auto_1265150 ) ( ON ?auto_1265152 ?auto_1265151 ) ( ON ?auto_1265153 ?auto_1265152 ) ( ON ?auto_1265154 ?auto_1265153 ) ( not ( = ?auto_1265149 ?auto_1265150 ) ) ( not ( = ?auto_1265149 ?auto_1265151 ) ) ( not ( = ?auto_1265149 ?auto_1265152 ) ) ( not ( = ?auto_1265149 ?auto_1265153 ) ) ( not ( = ?auto_1265149 ?auto_1265154 ) ) ( not ( = ?auto_1265149 ?auto_1265155 ) ) ( not ( = ?auto_1265149 ?auto_1265156 ) ) ( not ( = ?auto_1265149 ?auto_1265161 ) ) ( not ( = ?auto_1265150 ?auto_1265151 ) ) ( not ( = ?auto_1265150 ?auto_1265152 ) ) ( not ( = ?auto_1265150 ?auto_1265153 ) ) ( not ( = ?auto_1265150 ?auto_1265154 ) ) ( not ( = ?auto_1265150 ?auto_1265155 ) ) ( not ( = ?auto_1265150 ?auto_1265156 ) ) ( not ( = ?auto_1265150 ?auto_1265161 ) ) ( not ( = ?auto_1265151 ?auto_1265152 ) ) ( not ( = ?auto_1265151 ?auto_1265153 ) ) ( not ( = ?auto_1265151 ?auto_1265154 ) ) ( not ( = ?auto_1265151 ?auto_1265155 ) ) ( not ( = ?auto_1265151 ?auto_1265156 ) ) ( not ( = ?auto_1265151 ?auto_1265161 ) ) ( not ( = ?auto_1265152 ?auto_1265153 ) ) ( not ( = ?auto_1265152 ?auto_1265154 ) ) ( not ( = ?auto_1265152 ?auto_1265155 ) ) ( not ( = ?auto_1265152 ?auto_1265156 ) ) ( not ( = ?auto_1265152 ?auto_1265161 ) ) ( not ( = ?auto_1265153 ?auto_1265154 ) ) ( not ( = ?auto_1265153 ?auto_1265155 ) ) ( not ( = ?auto_1265153 ?auto_1265156 ) ) ( not ( = ?auto_1265153 ?auto_1265161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265154 ?auto_1265155 ?auto_1265156 )
      ( MAKE-7CRATE-VERIFY ?auto_1265149 ?auto_1265150 ?auto_1265151 ?auto_1265152 ?auto_1265153 ?auto_1265154 ?auto_1265155 ?auto_1265156 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265227 - SURFACE
      ?auto_1265228 - SURFACE
      ?auto_1265229 - SURFACE
      ?auto_1265230 - SURFACE
      ?auto_1265231 - SURFACE
      ?auto_1265232 - SURFACE
      ?auto_1265233 - SURFACE
      ?auto_1265234 - SURFACE
    )
    :vars
    (
      ?auto_1265236 - HOIST
      ?auto_1265235 - PLACE
      ?auto_1265240 - PLACE
      ?auto_1265238 - HOIST
      ?auto_1265239 - SURFACE
      ?auto_1265237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265236 ?auto_1265235 ) ( IS-CRATE ?auto_1265234 ) ( not ( = ?auto_1265233 ?auto_1265234 ) ) ( not ( = ?auto_1265232 ?auto_1265233 ) ) ( not ( = ?auto_1265232 ?auto_1265234 ) ) ( not ( = ?auto_1265240 ?auto_1265235 ) ) ( HOIST-AT ?auto_1265238 ?auto_1265240 ) ( not ( = ?auto_1265236 ?auto_1265238 ) ) ( AVAILABLE ?auto_1265238 ) ( SURFACE-AT ?auto_1265234 ?auto_1265240 ) ( ON ?auto_1265234 ?auto_1265239 ) ( CLEAR ?auto_1265234 ) ( not ( = ?auto_1265233 ?auto_1265239 ) ) ( not ( = ?auto_1265234 ?auto_1265239 ) ) ( not ( = ?auto_1265232 ?auto_1265239 ) ) ( TRUCK-AT ?auto_1265237 ?auto_1265235 ) ( SURFACE-AT ?auto_1265232 ?auto_1265235 ) ( CLEAR ?auto_1265232 ) ( LIFTING ?auto_1265236 ?auto_1265233 ) ( IS-CRATE ?auto_1265233 ) ( ON ?auto_1265228 ?auto_1265227 ) ( ON ?auto_1265229 ?auto_1265228 ) ( ON ?auto_1265230 ?auto_1265229 ) ( ON ?auto_1265231 ?auto_1265230 ) ( ON ?auto_1265232 ?auto_1265231 ) ( not ( = ?auto_1265227 ?auto_1265228 ) ) ( not ( = ?auto_1265227 ?auto_1265229 ) ) ( not ( = ?auto_1265227 ?auto_1265230 ) ) ( not ( = ?auto_1265227 ?auto_1265231 ) ) ( not ( = ?auto_1265227 ?auto_1265232 ) ) ( not ( = ?auto_1265227 ?auto_1265233 ) ) ( not ( = ?auto_1265227 ?auto_1265234 ) ) ( not ( = ?auto_1265227 ?auto_1265239 ) ) ( not ( = ?auto_1265228 ?auto_1265229 ) ) ( not ( = ?auto_1265228 ?auto_1265230 ) ) ( not ( = ?auto_1265228 ?auto_1265231 ) ) ( not ( = ?auto_1265228 ?auto_1265232 ) ) ( not ( = ?auto_1265228 ?auto_1265233 ) ) ( not ( = ?auto_1265228 ?auto_1265234 ) ) ( not ( = ?auto_1265228 ?auto_1265239 ) ) ( not ( = ?auto_1265229 ?auto_1265230 ) ) ( not ( = ?auto_1265229 ?auto_1265231 ) ) ( not ( = ?auto_1265229 ?auto_1265232 ) ) ( not ( = ?auto_1265229 ?auto_1265233 ) ) ( not ( = ?auto_1265229 ?auto_1265234 ) ) ( not ( = ?auto_1265229 ?auto_1265239 ) ) ( not ( = ?auto_1265230 ?auto_1265231 ) ) ( not ( = ?auto_1265230 ?auto_1265232 ) ) ( not ( = ?auto_1265230 ?auto_1265233 ) ) ( not ( = ?auto_1265230 ?auto_1265234 ) ) ( not ( = ?auto_1265230 ?auto_1265239 ) ) ( not ( = ?auto_1265231 ?auto_1265232 ) ) ( not ( = ?auto_1265231 ?auto_1265233 ) ) ( not ( = ?auto_1265231 ?auto_1265234 ) ) ( not ( = ?auto_1265231 ?auto_1265239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265232 ?auto_1265233 ?auto_1265234 )
      ( MAKE-7CRATE-VERIFY ?auto_1265227 ?auto_1265228 ?auto_1265229 ?auto_1265230 ?auto_1265231 ?auto_1265232 ?auto_1265233 ?auto_1265234 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265305 - SURFACE
      ?auto_1265306 - SURFACE
      ?auto_1265307 - SURFACE
      ?auto_1265308 - SURFACE
      ?auto_1265309 - SURFACE
      ?auto_1265310 - SURFACE
      ?auto_1265311 - SURFACE
      ?auto_1265312 - SURFACE
    )
    :vars
    (
      ?auto_1265318 - HOIST
      ?auto_1265313 - PLACE
      ?auto_1265317 - PLACE
      ?auto_1265316 - HOIST
      ?auto_1265314 - SURFACE
      ?auto_1265315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265318 ?auto_1265313 ) ( IS-CRATE ?auto_1265312 ) ( not ( = ?auto_1265311 ?auto_1265312 ) ) ( not ( = ?auto_1265310 ?auto_1265311 ) ) ( not ( = ?auto_1265310 ?auto_1265312 ) ) ( not ( = ?auto_1265317 ?auto_1265313 ) ) ( HOIST-AT ?auto_1265316 ?auto_1265317 ) ( not ( = ?auto_1265318 ?auto_1265316 ) ) ( AVAILABLE ?auto_1265316 ) ( SURFACE-AT ?auto_1265312 ?auto_1265317 ) ( ON ?auto_1265312 ?auto_1265314 ) ( CLEAR ?auto_1265312 ) ( not ( = ?auto_1265311 ?auto_1265314 ) ) ( not ( = ?auto_1265312 ?auto_1265314 ) ) ( not ( = ?auto_1265310 ?auto_1265314 ) ) ( TRUCK-AT ?auto_1265315 ?auto_1265313 ) ( SURFACE-AT ?auto_1265310 ?auto_1265313 ) ( CLEAR ?auto_1265310 ) ( IS-CRATE ?auto_1265311 ) ( AVAILABLE ?auto_1265318 ) ( IN ?auto_1265311 ?auto_1265315 ) ( ON ?auto_1265306 ?auto_1265305 ) ( ON ?auto_1265307 ?auto_1265306 ) ( ON ?auto_1265308 ?auto_1265307 ) ( ON ?auto_1265309 ?auto_1265308 ) ( ON ?auto_1265310 ?auto_1265309 ) ( not ( = ?auto_1265305 ?auto_1265306 ) ) ( not ( = ?auto_1265305 ?auto_1265307 ) ) ( not ( = ?auto_1265305 ?auto_1265308 ) ) ( not ( = ?auto_1265305 ?auto_1265309 ) ) ( not ( = ?auto_1265305 ?auto_1265310 ) ) ( not ( = ?auto_1265305 ?auto_1265311 ) ) ( not ( = ?auto_1265305 ?auto_1265312 ) ) ( not ( = ?auto_1265305 ?auto_1265314 ) ) ( not ( = ?auto_1265306 ?auto_1265307 ) ) ( not ( = ?auto_1265306 ?auto_1265308 ) ) ( not ( = ?auto_1265306 ?auto_1265309 ) ) ( not ( = ?auto_1265306 ?auto_1265310 ) ) ( not ( = ?auto_1265306 ?auto_1265311 ) ) ( not ( = ?auto_1265306 ?auto_1265312 ) ) ( not ( = ?auto_1265306 ?auto_1265314 ) ) ( not ( = ?auto_1265307 ?auto_1265308 ) ) ( not ( = ?auto_1265307 ?auto_1265309 ) ) ( not ( = ?auto_1265307 ?auto_1265310 ) ) ( not ( = ?auto_1265307 ?auto_1265311 ) ) ( not ( = ?auto_1265307 ?auto_1265312 ) ) ( not ( = ?auto_1265307 ?auto_1265314 ) ) ( not ( = ?auto_1265308 ?auto_1265309 ) ) ( not ( = ?auto_1265308 ?auto_1265310 ) ) ( not ( = ?auto_1265308 ?auto_1265311 ) ) ( not ( = ?auto_1265308 ?auto_1265312 ) ) ( not ( = ?auto_1265308 ?auto_1265314 ) ) ( not ( = ?auto_1265309 ?auto_1265310 ) ) ( not ( = ?auto_1265309 ?auto_1265311 ) ) ( not ( = ?auto_1265309 ?auto_1265312 ) ) ( not ( = ?auto_1265309 ?auto_1265314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265310 ?auto_1265311 ?auto_1265312 )
      ( MAKE-7CRATE-VERIFY ?auto_1265305 ?auto_1265306 ?auto_1265307 ?auto_1265308 ?auto_1265309 ?auto_1265310 ?auto_1265311 ?auto_1265312 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268224 - SURFACE
      ?auto_1268225 - SURFACE
      ?auto_1268226 - SURFACE
      ?auto_1268227 - SURFACE
      ?auto_1268228 - SURFACE
      ?auto_1268229 - SURFACE
      ?auto_1268230 - SURFACE
      ?auto_1268231 - SURFACE
      ?auto_1268232 - SURFACE
    )
    :vars
    (
      ?auto_1268233 - HOIST
      ?auto_1268234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268233 ?auto_1268234 ) ( SURFACE-AT ?auto_1268231 ?auto_1268234 ) ( CLEAR ?auto_1268231 ) ( LIFTING ?auto_1268233 ?auto_1268232 ) ( IS-CRATE ?auto_1268232 ) ( not ( = ?auto_1268231 ?auto_1268232 ) ) ( ON ?auto_1268225 ?auto_1268224 ) ( ON ?auto_1268226 ?auto_1268225 ) ( ON ?auto_1268227 ?auto_1268226 ) ( ON ?auto_1268228 ?auto_1268227 ) ( ON ?auto_1268229 ?auto_1268228 ) ( ON ?auto_1268230 ?auto_1268229 ) ( ON ?auto_1268231 ?auto_1268230 ) ( not ( = ?auto_1268224 ?auto_1268225 ) ) ( not ( = ?auto_1268224 ?auto_1268226 ) ) ( not ( = ?auto_1268224 ?auto_1268227 ) ) ( not ( = ?auto_1268224 ?auto_1268228 ) ) ( not ( = ?auto_1268224 ?auto_1268229 ) ) ( not ( = ?auto_1268224 ?auto_1268230 ) ) ( not ( = ?auto_1268224 ?auto_1268231 ) ) ( not ( = ?auto_1268224 ?auto_1268232 ) ) ( not ( = ?auto_1268225 ?auto_1268226 ) ) ( not ( = ?auto_1268225 ?auto_1268227 ) ) ( not ( = ?auto_1268225 ?auto_1268228 ) ) ( not ( = ?auto_1268225 ?auto_1268229 ) ) ( not ( = ?auto_1268225 ?auto_1268230 ) ) ( not ( = ?auto_1268225 ?auto_1268231 ) ) ( not ( = ?auto_1268225 ?auto_1268232 ) ) ( not ( = ?auto_1268226 ?auto_1268227 ) ) ( not ( = ?auto_1268226 ?auto_1268228 ) ) ( not ( = ?auto_1268226 ?auto_1268229 ) ) ( not ( = ?auto_1268226 ?auto_1268230 ) ) ( not ( = ?auto_1268226 ?auto_1268231 ) ) ( not ( = ?auto_1268226 ?auto_1268232 ) ) ( not ( = ?auto_1268227 ?auto_1268228 ) ) ( not ( = ?auto_1268227 ?auto_1268229 ) ) ( not ( = ?auto_1268227 ?auto_1268230 ) ) ( not ( = ?auto_1268227 ?auto_1268231 ) ) ( not ( = ?auto_1268227 ?auto_1268232 ) ) ( not ( = ?auto_1268228 ?auto_1268229 ) ) ( not ( = ?auto_1268228 ?auto_1268230 ) ) ( not ( = ?auto_1268228 ?auto_1268231 ) ) ( not ( = ?auto_1268228 ?auto_1268232 ) ) ( not ( = ?auto_1268229 ?auto_1268230 ) ) ( not ( = ?auto_1268229 ?auto_1268231 ) ) ( not ( = ?auto_1268229 ?auto_1268232 ) ) ( not ( = ?auto_1268230 ?auto_1268231 ) ) ( not ( = ?auto_1268230 ?auto_1268232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1268231 ?auto_1268232 )
      ( MAKE-8CRATE-VERIFY ?auto_1268224 ?auto_1268225 ?auto_1268226 ?auto_1268227 ?auto_1268228 ?auto_1268229 ?auto_1268230 ?auto_1268231 ?auto_1268232 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268291 - SURFACE
      ?auto_1268292 - SURFACE
      ?auto_1268293 - SURFACE
      ?auto_1268294 - SURFACE
      ?auto_1268295 - SURFACE
      ?auto_1268296 - SURFACE
      ?auto_1268297 - SURFACE
      ?auto_1268298 - SURFACE
      ?auto_1268299 - SURFACE
    )
    :vars
    (
      ?auto_1268300 - HOIST
      ?auto_1268301 - PLACE
      ?auto_1268302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268300 ?auto_1268301 ) ( SURFACE-AT ?auto_1268298 ?auto_1268301 ) ( CLEAR ?auto_1268298 ) ( IS-CRATE ?auto_1268299 ) ( not ( = ?auto_1268298 ?auto_1268299 ) ) ( TRUCK-AT ?auto_1268302 ?auto_1268301 ) ( AVAILABLE ?auto_1268300 ) ( IN ?auto_1268299 ?auto_1268302 ) ( ON ?auto_1268298 ?auto_1268297 ) ( not ( = ?auto_1268297 ?auto_1268298 ) ) ( not ( = ?auto_1268297 ?auto_1268299 ) ) ( ON ?auto_1268292 ?auto_1268291 ) ( ON ?auto_1268293 ?auto_1268292 ) ( ON ?auto_1268294 ?auto_1268293 ) ( ON ?auto_1268295 ?auto_1268294 ) ( ON ?auto_1268296 ?auto_1268295 ) ( ON ?auto_1268297 ?auto_1268296 ) ( not ( = ?auto_1268291 ?auto_1268292 ) ) ( not ( = ?auto_1268291 ?auto_1268293 ) ) ( not ( = ?auto_1268291 ?auto_1268294 ) ) ( not ( = ?auto_1268291 ?auto_1268295 ) ) ( not ( = ?auto_1268291 ?auto_1268296 ) ) ( not ( = ?auto_1268291 ?auto_1268297 ) ) ( not ( = ?auto_1268291 ?auto_1268298 ) ) ( not ( = ?auto_1268291 ?auto_1268299 ) ) ( not ( = ?auto_1268292 ?auto_1268293 ) ) ( not ( = ?auto_1268292 ?auto_1268294 ) ) ( not ( = ?auto_1268292 ?auto_1268295 ) ) ( not ( = ?auto_1268292 ?auto_1268296 ) ) ( not ( = ?auto_1268292 ?auto_1268297 ) ) ( not ( = ?auto_1268292 ?auto_1268298 ) ) ( not ( = ?auto_1268292 ?auto_1268299 ) ) ( not ( = ?auto_1268293 ?auto_1268294 ) ) ( not ( = ?auto_1268293 ?auto_1268295 ) ) ( not ( = ?auto_1268293 ?auto_1268296 ) ) ( not ( = ?auto_1268293 ?auto_1268297 ) ) ( not ( = ?auto_1268293 ?auto_1268298 ) ) ( not ( = ?auto_1268293 ?auto_1268299 ) ) ( not ( = ?auto_1268294 ?auto_1268295 ) ) ( not ( = ?auto_1268294 ?auto_1268296 ) ) ( not ( = ?auto_1268294 ?auto_1268297 ) ) ( not ( = ?auto_1268294 ?auto_1268298 ) ) ( not ( = ?auto_1268294 ?auto_1268299 ) ) ( not ( = ?auto_1268295 ?auto_1268296 ) ) ( not ( = ?auto_1268295 ?auto_1268297 ) ) ( not ( = ?auto_1268295 ?auto_1268298 ) ) ( not ( = ?auto_1268295 ?auto_1268299 ) ) ( not ( = ?auto_1268296 ?auto_1268297 ) ) ( not ( = ?auto_1268296 ?auto_1268298 ) ) ( not ( = ?auto_1268296 ?auto_1268299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268297 ?auto_1268298 ?auto_1268299 )
      ( MAKE-8CRATE-VERIFY ?auto_1268291 ?auto_1268292 ?auto_1268293 ?auto_1268294 ?auto_1268295 ?auto_1268296 ?auto_1268297 ?auto_1268298 ?auto_1268299 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268367 - SURFACE
      ?auto_1268368 - SURFACE
      ?auto_1268369 - SURFACE
      ?auto_1268370 - SURFACE
      ?auto_1268371 - SURFACE
      ?auto_1268372 - SURFACE
      ?auto_1268373 - SURFACE
      ?auto_1268374 - SURFACE
      ?auto_1268375 - SURFACE
    )
    :vars
    (
      ?auto_1268378 - HOIST
      ?auto_1268376 - PLACE
      ?auto_1268377 - TRUCK
      ?auto_1268379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268378 ?auto_1268376 ) ( SURFACE-AT ?auto_1268374 ?auto_1268376 ) ( CLEAR ?auto_1268374 ) ( IS-CRATE ?auto_1268375 ) ( not ( = ?auto_1268374 ?auto_1268375 ) ) ( AVAILABLE ?auto_1268378 ) ( IN ?auto_1268375 ?auto_1268377 ) ( ON ?auto_1268374 ?auto_1268373 ) ( not ( = ?auto_1268373 ?auto_1268374 ) ) ( not ( = ?auto_1268373 ?auto_1268375 ) ) ( TRUCK-AT ?auto_1268377 ?auto_1268379 ) ( not ( = ?auto_1268379 ?auto_1268376 ) ) ( ON ?auto_1268368 ?auto_1268367 ) ( ON ?auto_1268369 ?auto_1268368 ) ( ON ?auto_1268370 ?auto_1268369 ) ( ON ?auto_1268371 ?auto_1268370 ) ( ON ?auto_1268372 ?auto_1268371 ) ( ON ?auto_1268373 ?auto_1268372 ) ( not ( = ?auto_1268367 ?auto_1268368 ) ) ( not ( = ?auto_1268367 ?auto_1268369 ) ) ( not ( = ?auto_1268367 ?auto_1268370 ) ) ( not ( = ?auto_1268367 ?auto_1268371 ) ) ( not ( = ?auto_1268367 ?auto_1268372 ) ) ( not ( = ?auto_1268367 ?auto_1268373 ) ) ( not ( = ?auto_1268367 ?auto_1268374 ) ) ( not ( = ?auto_1268367 ?auto_1268375 ) ) ( not ( = ?auto_1268368 ?auto_1268369 ) ) ( not ( = ?auto_1268368 ?auto_1268370 ) ) ( not ( = ?auto_1268368 ?auto_1268371 ) ) ( not ( = ?auto_1268368 ?auto_1268372 ) ) ( not ( = ?auto_1268368 ?auto_1268373 ) ) ( not ( = ?auto_1268368 ?auto_1268374 ) ) ( not ( = ?auto_1268368 ?auto_1268375 ) ) ( not ( = ?auto_1268369 ?auto_1268370 ) ) ( not ( = ?auto_1268369 ?auto_1268371 ) ) ( not ( = ?auto_1268369 ?auto_1268372 ) ) ( not ( = ?auto_1268369 ?auto_1268373 ) ) ( not ( = ?auto_1268369 ?auto_1268374 ) ) ( not ( = ?auto_1268369 ?auto_1268375 ) ) ( not ( = ?auto_1268370 ?auto_1268371 ) ) ( not ( = ?auto_1268370 ?auto_1268372 ) ) ( not ( = ?auto_1268370 ?auto_1268373 ) ) ( not ( = ?auto_1268370 ?auto_1268374 ) ) ( not ( = ?auto_1268370 ?auto_1268375 ) ) ( not ( = ?auto_1268371 ?auto_1268372 ) ) ( not ( = ?auto_1268371 ?auto_1268373 ) ) ( not ( = ?auto_1268371 ?auto_1268374 ) ) ( not ( = ?auto_1268371 ?auto_1268375 ) ) ( not ( = ?auto_1268372 ?auto_1268373 ) ) ( not ( = ?auto_1268372 ?auto_1268374 ) ) ( not ( = ?auto_1268372 ?auto_1268375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268373 ?auto_1268374 ?auto_1268375 )
      ( MAKE-8CRATE-VERIFY ?auto_1268367 ?auto_1268368 ?auto_1268369 ?auto_1268370 ?auto_1268371 ?auto_1268372 ?auto_1268373 ?auto_1268374 ?auto_1268375 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268451 - SURFACE
      ?auto_1268452 - SURFACE
      ?auto_1268453 - SURFACE
      ?auto_1268454 - SURFACE
      ?auto_1268455 - SURFACE
      ?auto_1268456 - SURFACE
      ?auto_1268457 - SURFACE
      ?auto_1268458 - SURFACE
      ?auto_1268459 - SURFACE
    )
    :vars
    (
      ?auto_1268464 - HOIST
      ?auto_1268461 - PLACE
      ?auto_1268463 - TRUCK
      ?auto_1268462 - PLACE
      ?auto_1268460 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268464 ?auto_1268461 ) ( SURFACE-AT ?auto_1268458 ?auto_1268461 ) ( CLEAR ?auto_1268458 ) ( IS-CRATE ?auto_1268459 ) ( not ( = ?auto_1268458 ?auto_1268459 ) ) ( AVAILABLE ?auto_1268464 ) ( ON ?auto_1268458 ?auto_1268457 ) ( not ( = ?auto_1268457 ?auto_1268458 ) ) ( not ( = ?auto_1268457 ?auto_1268459 ) ) ( TRUCK-AT ?auto_1268463 ?auto_1268462 ) ( not ( = ?auto_1268462 ?auto_1268461 ) ) ( HOIST-AT ?auto_1268460 ?auto_1268462 ) ( LIFTING ?auto_1268460 ?auto_1268459 ) ( not ( = ?auto_1268464 ?auto_1268460 ) ) ( ON ?auto_1268452 ?auto_1268451 ) ( ON ?auto_1268453 ?auto_1268452 ) ( ON ?auto_1268454 ?auto_1268453 ) ( ON ?auto_1268455 ?auto_1268454 ) ( ON ?auto_1268456 ?auto_1268455 ) ( ON ?auto_1268457 ?auto_1268456 ) ( not ( = ?auto_1268451 ?auto_1268452 ) ) ( not ( = ?auto_1268451 ?auto_1268453 ) ) ( not ( = ?auto_1268451 ?auto_1268454 ) ) ( not ( = ?auto_1268451 ?auto_1268455 ) ) ( not ( = ?auto_1268451 ?auto_1268456 ) ) ( not ( = ?auto_1268451 ?auto_1268457 ) ) ( not ( = ?auto_1268451 ?auto_1268458 ) ) ( not ( = ?auto_1268451 ?auto_1268459 ) ) ( not ( = ?auto_1268452 ?auto_1268453 ) ) ( not ( = ?auto_1268452 ?auto_1268454 ) ) ( not ( = ?auto_1268452 ?auto_1268455 ) ) ( not ( = ?auto_1268452 ?auto_1268456 ) ) ( not ( = ?auto_1268452 ?auto_1268457 ) ) ( not ( = ?auto_1268452 ?auto_1268458 ) ) ( not ( = ?auto_1268452 ?auto_1268459 ) ) ( not ( = ?auto_1268453 ?auto_1268454 ) ) ( not ( = ?auto_1268453 ?auto_1268455 ) ) ( not ( = ?auto_1268453 ?auto_1268456 ) ) ( not ( = ?auto_1268453 ?auto_1268457 ) ) ( not ( = ?auto_1268453 ?auto_1268458 ) ) ( not ( = ?auto_1268453 ?auto_1268459 ) ) ( not ( = ?auto_1268454 ?auto_1268455 ) ) ( not ( = ?auto_1268454 ?auto_1268456 ) ) ( not ( = ?auto_1268454 ?auto_1268457 ) ) ( not ( = ?auto_1268454 ?auto_1268458 ) ) ( not ( = ?auto_1268454 ?auto_1268459 ) ) ( not ( = ?auto_1268455 ?auto_1268456 ) ) ( not ( = ?auto_1268455 ?auto_1268457 ) ) ( not ( = ?auto_1268455 ?auto_1268458 ) ) ( not ( = ?auto_1268455 ?auto_1268459 ) ) ( not ( = ?auto_1268456 ?auto_1268457 ) ) ( not ( = ?auto_1268456 ?auto_1268458 ) ) ( not ( = ?auto_1268456 ?auto_1268459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268457 ?auto_1268458 ?auto_1268459 )
      ( MAKE-8CRATE-VERIFY ?auto_1268451 ?auto_1268452 ?auto_1268453 ?auto_1268454 ?auto_1268455 ?auto_1268456 ?auto_1268457 ?auto_1268458 ?auto_1268459 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268543 - SURFACE
      ?auto_1268544 - SURFACE
      ?auto_1268545 - SURFACE
      ?auto_1268546 - SURFACE
      ?auto_1268547 - SURFACE
      ?auto_1268548 - SURFACE
      ?auto_1268549 - SURFACE
      ?auto_1268550 - SURFACE
      ?auto_1268551 - SURFACE
    )
    :vars
    (
      ?auto_1268554 - HOIST
      ?auto_1268553 - PLACE
      ?auto_1268555 - TRUCK
      ?auto_1268557 - PLACE
      ?auto_1268556 - HOIST
      ?auto_1268552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268554 ?auto_1268553 ) ( SURFACE-AT ?auto_1268550 ?auto_1268553 ) ( CLEAR ?auto_1268550 ) ( IS-CRATE ?auto_1268551 ) ( not ( = ?auto_1268550 ?auto_1268551 ) ) ( AVAILABLE ?auto_1268554 ) ( ON ?auto_1268550 ?auto_1268549 ) ( not ( = ?auto_1268549 ?auto_1268550 ) ) ( not ( = ?auto_1268549 ?auto_1268551 ) ) ( TRUCK-AT ?auto_1268555 ?auto_1268557 ) ( not ( = ?auto_1268557 ?auto_1268553 ) ) ( HOIST-AT ?auto_1268556 ?auto_1268557 ) ( not ( = ?auto_1268554 ?auto_1268556 ) ) ( AVAILABLE ?auto_1268556 ) ( SURFACE-AT ?auto_1268551 ?auto_1268557 ) ( ON ?auto_1268551 ?auto_1268552 ) ( CLEAR ?auto_1268551 ) ( not ( = ?auto_1268550 ?auto_1268552 ) ) ( not ( = ?auto_1268551 ?auto_1268552 ) ) ( not ( = ?auto_1268549 ?auto_1268552 ) ) ( ON ?auto_1268544 ?auto_1268543 ) ( ON ?auto_1268545 ?auto_1268544 ) ( ON ?auto_1268546 ?auto_1268545 ) ( ON ?auto_1268547 ?auto_1268546 ) ( ON ?auto_1268548 ?auto_1268547 ) ( ON ?auto_1268549 ?auto_1268548 ) ( not ( = ?auto_1268543 ?auto_1268544 ) ) ( not ( = ?auto_1268543 ?auto_1268545 ) ) ( not ( = ?auto_1268543 ?auto_1268546 ) ) ( not ( = ?auto_1268543 ?auto_1268547 ) ) ( not ( = ?auto_1268543 ?auto_1268548 ) ) ( not ( = ?auto_1268543 ?auto_1268549 ) ) ( not ( = ?auto_1268543 ?auto_1268550 ) ) ( not ( = ?auto_1268543 ?auto_1268551 ) ) ( not ( = ?auto_1268543 ?auto_1268552 ) ) ( not ( = ?auto_1268544 ?auto_1268545 ) ) ( not ( = ?auto_1268544 ?auto_1268546 ) ) ( not ( = ?auto_1268544 ?auto_1268547 ) ) ( not ( = ?auto_1268544 ?auto_1268548 ) ) ( not ( = ?auto_1268544 ?auto_1268549 ) ) ( not ( = ?auto_1268544 ?auto_1268550 ) ) ( not ( = ?auto_1268544 ?auto_1268551 ) ) ( not ( = ?auto_1268544 ?auto_1268552 ) ) ( not ( = ?auto_1268545 ?auto_1268546 ) ) ( not ( = ?auto_1268545 ?auto_1268547 ) ) ( not ( = ?auto_1268545 ?auto_1268548 ) ) ( not ( = ?auto_1268545 ?auto_1268549 ) ) ( not ( = ?auto_1268545 ?auto_1268550 ) ) ( not ( = ?auto_1268545 ?auto_1268551 ) ) ( not ( = ?auto_1268545 ?auto_1268552 ) ) ( not ( = ?auto_1268546 ?auto_1268547 ) ) ( not ( = ?auto_1268546 ?auto_1268548 ) ) ( not ( = ?auto_1268546 ?auto_1268549 ) ) ( not ( = ?auto_1268546 ?auto_1268550 ) ) ( not ( = ?auto_1268546 ?auto_1268551 ) ) ( not ( = ?auto_1268546 ?auto_1268552 ) ) ( not ( = ?auto_1268547 ?auto_1268548 ) ) ( not ( = ?auto_1268547 ?auto_1268549 ) ) ( not ( = ?auto_1268547 ?auto_1268550 ) ) ( not ( = ?auto_1268547 ?auto_1268551 ) ) ( not ( = ?auto_1268547 ?auto_1268552 ) ) ( not ( = ?auto_1268548 ?auto_1268549 ) ) ( not ( = ?auto_1268548 ?auto_1268550 ) ) ( not ( = ?auto_1268548 ?auto_1268551 ) ) ( not ( = ?auto_1268548 ?auto_1268552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268549 ?auto_1268550 ?auto_1268551 )
      ( MAKE-8CRATE-VERIFY ?auto_1268543 ?auto_1268544 ?auto_1268545 ?auto_1268546 ?auto_1268547 ?auto_1268548 ?auto_1268549 ?auto_1268550 ?auto_1268551 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268636 - SURFACE
      ?auto_1268637 - SURFACE
      ?auto_1268638 - SURFACE
      ?auto_1268639 - SURFACE
      ?auto_1268640 - SURFACE
      ?auto_1268641 - SURFACE
      ?auto_1268642 - SURFACE
      ?auto_1268643 - SURFACE
      ?auto_1268644 - SURFACE
    )
    :vars
    (
      ?auto_1268646 - HOIST
      ?auto_1268648 - PLACE
      ?auto_1268649 - PLACE
      ?auto_1268650 - HOIST
      ?auto_1268645 - SURFACE
      ?auto_1268647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268646 ?auto_1268648 ) ( SURFACE-AT ?auto_1268643 ?auto_1268648 ) ( CLEAR ?auto_1268643 ) ( IS-CRATE ?auto_1268644 ) ( not ( = ?auto_1268643 ?auto_1268644 ) ) ( AVAILABLE ?auto_1268646 ) ( ON ?auto_1268643 ?auto_1268642 ) ( not ( = ?auto_1268642 ?auto_1268643 ) ) ( not ( = ?auto_1268642 ?auto_1268644 ) ) ( not ( = ?auto_1268649 ?auto_1268648 ) ) ( HOIST-AT ?auto_1268650 ?auto_1268649 ) ( not ( = ?auto_1268646 ?auto_1268650 ) ) ( AVAILABLE ?auto_1268650 ) ( SURFACE-AT ?auto_1268644 ?auto_1268649 ) ( ON ?auto_1268644 ?auto_1268645 ) ( CLEAR ?auto_1268644 ) ( not ( = ?auto_1268643 ?auto_1268645 ) ) ( not ( = ?auto_1268644 ?auto_1268645 ) ) ( not ( = ?auto_1268642 ?auto_1268645 ) ) ( TRUCK-AT ?auto_1268647 ?auto_1268648 ) ( ON ?auto_1268637 ?auto_1268636 ) ( ON ?auto_1268638 ?auto_1268637 ) ( ON ?auto_1268639 ?auto_1268638 ) ( ON ?auto_1268640 ?auto_1268639 ) ( ON ?auto_1268641 ?auto_1268640 ) ( ON ?auto_1268642 ?auto_1268641 ) ( not ( = ?auto_1268636 ?auto_1268637 ) ) ( not ( = ?auto_1268636 ?auto_1268638 ) ) ( not ( = ?auto_1268636 ?auto_1268639 ) ) ( not ( = ?auto_1268636 ?auto_1268640 ) ) ( not ( = ?auto_1268636 ?auto_1268641 ) ) ( not ( = ?auto_1268636 ?auto_1268642 ) ) ( not ( = ?auto_1268636 ?auto_1268643 ) ) ( not ( = ?auto_1268636 ?auto_1268644 ) ) ( not ( = ?auto_1268636 ?auto_1268645 ) ) ( not ( = ?auto_1268637 ?auto_1268638 ) ) ( not ( = ?auto_1268637 ?auto_1268639 ) ) ( not ( = ?auto_1268637 ?auto_1268640 ) ) ( not ( = ?auto_1268637 ?auto_1268641 ) ) ( not ( = ?auto_1268637 ?auto_1268642 ) ) ( not ( = ?auto_1268637 ?auto_1268643 ) ) ( not ( = ?auto_1268637 ?auto_1268644 ) ) ( not ( = ?auto_1268637 ?auto_1268645 ) ) ( not ( = ?auto_1268638 ?auto_1268639 ) ) ( not ( = ?auto_1268638 ?auto_1268640 ) ) ( not ( = ?auto_1268638 ?auto_1268641 ) ) ( not ( = ?auto_1268638 ?auto_1268642 ) ) ( not ( = ?auto_1268638 ?auto_1268643 ) ) ( not ( = ?auto_1268638 ?auto_1268644 ) ) ( not ( = ?auto_1268638 ?auto_1268645 ) ) ( not ( = ?auto_1268639 ?auto_1268640 ) ) ( not ( = ?auto_1268639 ?auto_1268641 ) ) ( not ( = ?auto_1268639 ?auto_1268642 ) ) ( not ( = ?auto_1268639 ?auto_1268643 ) ) ( not ( = ?auto_1268639 ?auto_1268644 ) ) ( not ( = ?auto_1268639 ?auto_1268645 ) ) ( not ( = ?auto_1268640 ?auto_1268641 ) ) ( not ( = ?auto_1268640 ?auto_1268642 ) ) ( not ( = ?auto_1268640 ?auto_1268643 ) ) ( not ( = ?auto_1268640 ?auto_1268644 ) ) ( not ( = ?auto_1268640 ?auto_1268645 ) ) ( not ( = ?auto_1268641 ?auto_1268642 ) ) ( not ( = ?auto_1268641 ?auto_1268643 ) ) ( not ( = ?auto_1268641 ?auto_1268644 ) ) ( not ( = ?auto_1268641 ?auto_1268645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268642 ?auto_1268643 ?auto_1268644 )
      ( MAKE-8CRATE-VERIFY ?auto_1268636 ?auto_1268637 ?auto_1268638 ?auto_1268639 ?auto_1268640 ?auto_1268641 ?auto_1268642 ?auto_1268643 ?auto_1268644 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268729 - SURFACE
      ?auto_1268730 - SURFACE
      ?auto_1268731 - SURFACE
      ?auto_1268732 - SURFACE
      ?auto_1268733 - SURFACE
      ?auto_1268734 - SURFACE
      ?auto_1268735 - SURFACE
      ?auto_1268736 - SURFACE
      ?auto_1268737 - SURFACE
    )
    :vars
    (
      ?auto_1268742 - HOIST
      ?auto_1268743 - PLACE
      ?auto_1268741 - PLACE
      ?auto_1268738 - HOIST
      ?auto_1268740 - SURFACE
      ?auto_1268739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268742 ?auto_1268743 ) ( IS-CRATE ?auto_1268737 ) ( not ( = ?auto_1268736 ?auto_1268737 ) ) ( not ( = ?auto_1268735 ?auto_1268736 ) ) ( not ( = ?auto_1268735 ?auto_1268737 ) ) ( not ( = ?auto_1268741 ?auto_1268743 ) ) ( HOIST-AT ?auto_1268738 ?auto_1268741 ) ( not ( = ?auto_1268742 ?auto_1268738 ) ) ( AVAILABLE ?auto_1268738 ) ( SURFACE-AT ?auto_1268737 ?auto_1268741 ) ( ON ?auto_1268737 ?auto_1268740 ) ( CLEAR ?auto_1268737 ) ( not ( = ?auto_1268736 ?auto_1268740 ) ) ( not ( = ?auto_1268737 ?auto_1268740 ) ) ( not ( = ?auto_1268735 ?auto_1268740 ) ) ( TRUCK-AT ?auto_1268739 ?auto_1268743 ) ( SURFACE-AT ?auto_1268735 ?auto_1268743 ) ( CLEAR ?auto_1268735 ) ( LIFTING ?auto_1268742 ?auto_1268736 ) ( IS-CRATE ?auto_1268736 ) ( ON ?auto_1268730 ?auto_1268729 ) ( ON ?auto_1268731 ?auto_1268730 ) ( ON ?auto_1268732 ?auto_1268731 ) ( ON ?auto_1268733 ?auto_1268732 ) ( ON ?auto_1268734 ?auto_1268733 ) ( ON ?auto_1268735 ?auto_1268734 ) ( not ( = ?auto_1268729 ?auto_1268730 ) ) ( not ( = ?auto_1268729 ?auto_1268731 ) ) ( not ( = ?auto_1268729 ?auto_1268732 ) ) ( not ( = ?auto_1268729 ?auto_1268733 ) ) ( not ( = ?auto_1268729 ?auto_1268734 ) ) ( not ( = ?auto_1268729 ?auto_1268735 ) ) ( not ( = ?auto_1268729 ?auto_1268736 ) ) ( not ( = ?auto_1268729 ?auto_1268737 ) ) ( not ( = ?auto_1268729 ?auto_1268740 ) ) ( not ( = ?auto_1268730 ?auto_1268731 ) ) ( not ( = ?auto_1268730 ?auto_1268732 ) ) ( not ( = ?auto_1268730 ?auto_1268733 ) ) ( not ( = ?auto_1268730 ?auto_1268734 ) ) ( not ( = ?auto_1268730 ?auto_1268735 ) ) ( not ( = ?auto_1268730 ?auto_1268736 ) ) ( not ( = ?auto_1268730 ?auto_1268737 ) ) ( not ( = ?auto_1268730 ?auto_1268740 ) ) ( not ( = ?auto_1268731 ?auto_1268732 ) ) ( not ( = ?auto_1268731 ?auto_1268733 ) ) ( not ( = ?auto_1268731 ?auto_1268734 ) ) ( not ( = ?auto_1268731 ?auto_1268735 ) ) ( not ( = ?auto_1268731 ?auto_1268736 ) ) ( not ( = ?auto_1268731 ?auto_1268737 ) ) ( not ( = ?auto_1268731 ?auto_1268740 ) ) ( not ( = ?auto_1268732 ?auto_1268733 ) ) ( not ( = ?auto_1268732 ?auto_1268734 ) ) ( not ( = ?auto_1268732 ?auto_1268735 ) ) ( not ( = ?auto_1268732 ?auto_1268736 ) ) ( not ( = ?auto_1268732 ?auto_1268737 ) ) ( not ( = ?auto_1268732 ?auto_1268740 ) ) ( not ( = ?auto_1268733 ?auto_1268734 ) ) ( not ( = ?auto_1268733 ?auto_1268735 ) ) ( not ( = ?auto_1268733 ?auto_1268736 ) ) ( not ( = ?auto_1268733 ?auto_1268737 ) ) ( not ( = ?auto_1268733 ?auto_1268740 ) ) ( not ( = ?auto_1268734 ?auto_1268735 ) ) ( not ( = ?auto_1268734 ?auto_1268736 ) ) ( not ( = ?auto_1268734 ?auto_1268737 ) ) ( not ( = ?auto_1268734 ?auto_1268740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268735 ?auto_1268736 ?auto_1268737 )
      ( MAKE-8CRATE-VERIFY ?auto_1268729 ?auto_1268730 ?auto_1268731 ?auto_1268732 ?auto_1268733 ?auto_1268734 ?auto_1268735 ?auto_1268736 ?auto_1268737 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268822 - SURFACE
      ?auto_1268823 - SURFACE
      ?auto_1268824 - SURFACE
      ?auto_1268825 - SURFACE
      ?auto_1268826 - SURFACE
      ?auto_1268827 - SURFACE
      ?auto_1268828 - SURFACE
      ?auto_1268829 - SURFACE
      ?auto_1268830 - SURFACE
    )
    :vars
    (
      ?auto_1268831 - HOIST
      ?auto_1268835 - PLACE
      ?auto_1268836 - PLACE
      ?auto_1268833 - HOIST
      ?auto_1268834 - SURFACE
      ?auto_1268832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268831 ?auto_1268835 ) ( IS-CRATE ?auto_1268830 ) ( not ( = ?auto_1268829 ?auto_1268830 ) ) ( not ( = ?auto_1268828 ?auto_1268829 ) ) ( not ( = ?auto_1268828 ?auto_1268830 ) ) ( not ( = ?auto_1268836 ?auto_1268835 ) ) ( HOIST-AT ?auto_1268833 ?auto_1268836 ) ( not ( = ?auto_1268831 ?auto_1268833 ) ) ( AVAILABLE ?auto_1268833 ) ( SURFACE-AT ?auto_1268830 ?auto_1268836 ) ( ON ?auto_1268830 ?auto_1268834 ) ( CLEAR ?auto_1268830 ) ( not ( = ?auto_1268829 ?auto_1268834 ) ) ( not ( = ?auto_1268830 ?auto_1268834 ) ) ( not ( = ?auto_1268828 ?auto_1268834 ) ) ( TRUCK-AT ?auto_1268832 ?auto_1268835 ) ( SURFACE-AT ?auto_1268828 ?auto_1268835 ) ( CLEAR ?auto_1268828 ) ( IS-CRATE ?auto_1268829 ) ( AVAILABLE ?auto_1268831 ) ( IN ?auto_1268829 ?auto_1268832 ) ( ON ?auto_1268823 ?auto_1268822 ) ( ON ?auto_1268824 ?auto_1268823 ) ( ON ?auto_1268825 ?auto_1268824 ) ( ON ?auto_1268826 ?auto_1268825 ) ( ON ?auto_1268827 ?auto_1268826 ) ( ON ?auto_1268828 ?auto_1268827 ) ( not ( = ?auto_1268822 ?auto_1268823 ) ) ( not ( = ?auto_1268822 ?auto_1268824 ) ) ( not ( = ?auto_1268822 ?auto_1268825 ) ) ( not ( = ?auto_1268822 ?auto_1268826 ) ) ( not ( = ?auto_1268822 ?auto_1268827 ) ) ( not ( = ?auto_1268822 ?auto_1268828 ) ) ( not ( = ?auto_1268822 ?auto_1268829 ) ) ( not ( = ?auto_1268822 ?auto_1268830 ) ) ( not ( = ?auto_1268822 ?auto_1268834 ) ) ( not ( = ?auto_1268823 ?auto_1268824 ) ) ( not ( = ?auto_1268823 ?auto_1268825 ) ) ( not ( = ?auto_1268823 ?auto_1268826 ) ) ( not ( = ?auto_1268823 ?auto_1268827 ) ) ( not ( = ?auto_1268823 ?auto_1268828 ) ) ( not ( = ?auto_1268823 ?auto_1268829 ) ) ( not ( = ?auto_1268823 ?auto_1268830 ) ) ( not ( = ?auto_1268823 ?auto_1268834 ) ) ( not ( = ?auto_1268824 ?auto_1268825 ) ) ( not ( = ?auto_1268824 ?auto_1268826 ) ) ( not ( = ?auto_1268824 ?auto_1268827 ) ) ( not ( = ?auto_1268824 ?auto_1268828 ) ) ( not ( = ?auto_1268824 ?auto_1268829 ) ) ( not ( = ?auto_1268824 ?auto_1268830 ) ) ( not ( = ?auto_1268824 ?auto_1268834 ) ) ( not ( = ?auto_1268825 ?auto_1268826 ) ) ( not ( = ?auto_1268825 ?auto_1268827 ) ) ( not ( = ?auto_1268825 ?auto_1268828 ) ) ( not ( = ?auto_1268825 ?auto_1268829 ) ) ( not ( = ?auto_1268825 ?auto_1268830 ) ) ( not ( = ?auto_1268825 ?auto_1268834 ) ) ( not ( = ?auto_1268826 ?auto_1268827 ) ) ( not ( = ?auto_1268826 ?auto_1268828 ) ) ( not ( = ?auto_1268826 ?auto_1268829 ) ) ( not ( = ?auto_1268826 ?auto_1268830 ) ) ( not ( = ?auto_1268826 ?auto_1268834 ) ) ( not ( = ?auto_1268827 ?auto_1268828 ) ) ( not ( = ?auto_1268827 ?auto_1268829 ) ) ( not ( = ?auto_1268827 ?auto_1268830 ) ) ( not ( = ?auto_1268827 ?auto_1268834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268828 ?auto_1268829 ?auto_1268830 )
      ( MAKE-8CRATE-VERIFY ?auto_1268822 ?auto_1268823 ?auto_1268824 ?auto_1268825 ?auto_1268826 ?auto_1268827 ?auto_1268828 ?auto_1268829 ?auto_1268830 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272938 - SURFACE
      ?auto_1272939 - SURFACE
      ?auto_1272940 - SURFACE
      ?auto_1272941 - SURFACE
      ?auto_1272942 - SURFACE
      ?auto_1272943 - SURFACE
      ?auto_1272944 - SURFACE
      ?auto_1272945 - SURFACE
      ?auto_1272946 - SURFACE
      ?auto_1272947 - SURFACE
    )
    :vars
    (
      ?auto_1272948 - HOIST
      ?auto_1272949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272948 ?auto_1272949 ) ( SURFACE-AT ?auto_1272946 ?auto_1272949 ) ( CLEAR ?auto_1272946 ) ( LIFTING ?auto_1272948 ?auto_1272947 ) ( IS-CRATE ?auto_1272947 ) ( not ( = ?auto_1272946 ?auto_1272947 ) ) ( ON ?auto_1272939 ?auto_1272938 ) ( ON ?auto_1272940 ?auto_1272939 ) ( ON ?auto_1272941 ?auto_1272940 ) ( ON ?auto_1272942 ?auto_1272941 ) ( ON ?auto_1272943 ?auto_1272942 ) ( ON ?auto_1272944 ?auto_1272943 ) ( ON ?auto_1272945 ?auto_1272944 ) ( ON ?auto_1272946 ?auto_1272945 ) ( not ( = ?auto_1272938 ?auto_1272939 ) ) ( not ( = ?auto_1272938 ?auto_1272940 ) ) ( not ( = ?auto_1272938 ?auto_1272941 ) ) ( not ( = ?auto_1272938 ?auto_1272942 ) ) ( not ( = ?auto_1272938 ?auto_1272943 ) ) ( not ( = ?auto_1272938 ?auto_1272944 ) ) ( not ( = ?auto_1272938 ?auto_1272945 ) ) ( not ( = ?auto_1272938 ?auto_1272946 ) ) ( not ( = ?auto_1272938 ?auto_1272947 ) ) ( not ( = ?auto_1272939 ?auto_1272940 ) ) ( not ( = ?auto_1272939 ?auto_1272941 ) ) ( not ( = ?auto_1272939 ?auto_1272942 ) ) ( not ( = ?auto_1272939 ?auto_1272943 ) ) ( not ( = ?auto_1272939 ?auto_1272944 ) ) ( not ( = ?auto_1272939 ?auto_1272945 ) ) ( not ( = ?auto_1272939 ?auto_1272946 ) ) ( not ( = ?auto_1272939 ?auto_1272947 ) ) ( not ( = ?auto_1272940 ?auto_1272941 ) ) ( not ( = ?auto_1272940 ?auto_1272942 ) ) ( not ( = ?auto_1272940 ?auto_1272943 ) ) ( not ( = ?auto_1272940 ?auto_1272944 ) ) ( not ( = ?auto_1272940 ?auto_1272945 ) ) ( not ( = ?auto_1272940 ?auto_1272946 ) ) ( not ( = ?auto_1272940 ?auto_1272947 ) ) ( not ( = ?auto_1272941 ?auto_1272942 ) ) ( not ( = ?auto_1272941 ?auto_1272943 ) ) ( not ( = ?auto_1272941 ?auto_1272944 ) ) ( not ( = ?auto_1272941 ?auto_1272945 ) ) ( not ( = ?auto_1272941 ?auto_1272946 ) ) ( not ( = ?auto_1272941 ?auto_1272947 ) ) ( not ( = ?auto_1272942 ?auto_1272943 ) ) ( not ( = ?auto_1272942 ?auto_1272944 ) ) ( not ( = ?auto_1272942 ?auto_1272945 ) ) ( not ( = ?auto_1272942 ?auto_1272946 ) ) ( not ( = ?auto_1272942 ?auto_1272947 ) ) ( not ( = ?auto_1272943 ?auto_1272944 ) ) ( not ( = ?auto_1272943 ?auto_1272945 ) ) ( not ( = ?auto_1272943 ?auto_1272946 ) ) ( not ( = ?auto_1272943 ?auto_1272947 ) ) ( not ( = ?auto_1272944 ?auto_1272945 ) ) ( not ( = ?auto_1272944 ?auto_1272946 ) ) ( not ( = ?auto_1272944 ?auto_1272947 ) ) ( not ( = ?auto_1272945 ?auto_1272946 ) ) ( not ( = ?auto_1272945 ?auto_1272947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1272946 ?auto_1272947 )
      ( MAKE-9CRATE-VERIFY ?auto_1272938 ?auto_1272939 ?auto_1272940 ?auto_1272941 ?auto_1272942 ?auto_1272943 ?auto_1272944 ?auto_1272945 ?auto_1272946 ?auto_1272947 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273018 - SURFACE
      ?auto_1273019 - SURFACE
      ?auto_1273020 - SURFACE
      ?auto_1273021 - SURFACE
      ?auto_1273022 - SURFACE
      ?auto_1273023 - SURFACE
      ?auto_1273024 - SURFACE
      ?auto_1273025 - SURFACE
      ?auto_1273026 - SURFACE
      ?auto_1273027 - SURFACE
    )
    :vars
    (
      ?auto_1273029 - HOIST
      ?auto_1273030 - PLACE
      ?auto_1273028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273029 ?auto_1273030 ) ( SURFACE-AT ?auto_1273026 ?auto_1273030 ) ( CLEAR ?auto_1273026 ) ( IS-CRATE ?auto_1273027 ) ( not ( = ?auto_1273026 ?auto_1273027 ) ) ( TRUCK-AT ?auto_1273028 ?auto_1273030 ) ( AVAILABLE ?auto_1273029 ) ( IN ?auto_1273027 ?auto_1273028 ) ( ON ?auto_1273026 ?auto_1273025 ) ( not ( = ?auto_1273025 ?auto_1273026 ) ) ( not ( = ?auto_1273025 ?auto_1273027 ) ) ( ON ?auto_1273019 ?auto_1273018 ) ( ON ?auto_1273020 ?auto_1273019 ) ( ON ?auto_1273021 ?auto_1273020 ) ( ON ?auto_1273022 ?auto_1273021 ) ( ON ?auto_1273023 ?auto_1273022 ) ( ON ?auto_1273024 ?auto_1273023 ) ( ON ?auto_1273025 ?auto_1273024 ) ( not ( = ?auto_1273018 ?auto_1273019 ) ) ( not ( = ?auto_1273018 ?auto_1273020 ) ) ( not ( = ?auto_1273018 ?auto_1273021 ) ) ( not ( = ?auto_1273018 ?auto_1273022 ) ) ( not ( = ?auto_1273018 ?auto_1273023 ) ) ( not ( = ?auto_1273018 ?auto_1273024 ) ) ( not ( = ?auto_1273018 ?auto_1273025 ) ) ( not ( = ?auto_1273018 ?auto_1273026 ) ) ( not ( = ?auto_1273018 ?auto_1273027 ) ) ( not ( = ?auto_1273019 ?auto_1273020 ) ) ( not ( = ?auto_1273019 ?auto_1273021 ) ) ( not ( = ?auto_1273019 ?auto_1273022 ) ) ( not ( = ?auto_1273019 ?auto_1273023 ) ) ( not ( = ?auto_1273019 ?auto_1273024 ) ) ( not ( = ?auto_1273019 ?auto_1273025 ) ) ( not ( = ?auto_1273019 ?auto_1273026 ) ) ( not ( = ?auto_1273019 ?auto_1273027 ) ) ( not ( = ?auto_1273020 ?auto_1273021 ) ) ( not ( = ?auto_1273020 ?auto_1273022 ) ) ( not ( = ?auto_1273020 ?auto_1273023 ) ) ( not ( = ?auto_1273020 ?auto_1273024 ) ) ( not ( = ?auto_1273020 ?auto_1273025 ) ) ( not ( = ?auto_1273020 ?auto_1273026 ) ) ( not ( = ?auto_1273020 ?auto_1273027 ) ) ( not ( = ?auto_1273021 ?auto_1273022 ) ) ( not ( = ?auto_1273021 ?auto_1273023 ) ) ( not ( = ?auto_1273021 ?auto_1273024 ) ) ( not ( = ?auto_1273021 ?auto_1273025 ) ) ( not ( = ?auto_1273021 ?auto_1273026 ) ) ( not ( = ?auto_1273021 ?auto_1273027 ) ) ( not ( = ?auto_1273022 ?auto_1273023 ) ) ( not ( = ?auto_1273022 ?auto_1273024 ) ) ( not ( = ?auto_1273022 ?auto_1273025 ) ) ( not ( = ?auto_1273022 ?auto_1273026 ) ) ( not ( = ?auto_1273022 ?auto_1273027 ) ) ( not ( = ?auto_1273023 ?auto_1273024 ) ) ( not ( = ?auto_1273023 ?auto_1273025 ) ) ( not ( = ?auto_1273023 ?auto_1273026 ) ) ( not ( = ?auto_1273023 ?auto_1273027 ) ) ( not ( = ?auto_1273024 ?auto_1273025 ) ) ( not ( = ?auto_1273024 ?auto_1273026 ) ) ( not ( = ?auto_1273024 ?auto_1273027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273025 ?auto_1273026 ?auto_1273027 )
      ( MAKE-9CRATE-VERIFY ?auto_1273018 ?auto_1273019 ?auto_1273020 ?auto_1273021 ?auto_1273022 ?auto_1273023 ?auto_1273024 ?auto_1273025 ?auto_1273026 ?auto_1273027 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273108 - SURFACE
      ?auto_1273109 - SURFACE
      ?auto_1273110 - SURFACE
      ?auto_1273111 - SURFACE
      ?auto_1273112 - SURFACE
      ?auto_1273113 - SURFACE
      ?auto_1273114 - SURFACE
      ?auto_1273115 - SURFACE
      ?auto_1273116 - SURFACE
      ?auto_1273117 - SURFACE
    )
    :vars
    (
      ?auto_1273119 - HOIST
      ?auto_1273121 - PLACE
      ?auto_1273118 - TRUCK
      ?auto_1273120 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273119 ?auto_1273121 ) ( SURFACE-AT ?auto_1273116 ?auto_1273121 ) ( CLEAR ?auto_1273116 ) ( IS-CRATE ?auto_1273117 ) ( not ( = ?auto_1273116 ?auto_1273117 ) ) ( AVAILABLE ?auto_1273119 ) ( IN ?auto_1273117 ?auto_1273118 ) ( ON ?auto_1273116 ?auto_1273115 ) ( not ( = ?auto_1273115 ?auto_1273116 ) ) ( not ( = ?auto_1273115 ?auto_1273117 ) ) ( TRUCK-AT ?auto_1273118 ?auto_1273120 ) ( not ( = ?auto_1273120 ?auto_1273121 ) ) ( ON ?auto_1273109 ?auto_1273108 ) ( ON ?auto_1273110 ?auto_1273109 ) ( ON ?auto_1273111 ?auto_1273110 ) ( ON ?auto_1273112 ?auto_1273111 ) ( ON ?auto_1273113 ?auto_1273112 ) ( ON ?auto_1273114 ?auto_1273113 ) ( ON ?auto_1273115 ?auto_1273114 ) ( not ( = ?auto_1273108 ?auto_1273109 ) ) ( not ( = ?auto_1273108 ?auto_1273110 ) ) ( not ( = ?auto_1273108 ?auto_1273111 ) ) ( not ( = ?auto_1273108 ?auto_1273112 ) ) ( not ( = ?auto_1273108 ?auto_1273113 ) ) ( not ( = ?auto_1273108 ?auto_1273114 ) ) ( not ( = ?auto_1273108 ?auto_1273115 ) ) ( not ( = ?auto_1273108 ?auto_1273116 ) ) ( not ( = ?auto_1273108 ?auto_1273117 ) ) ( not ( = ?auto_1273109 ?auto_1273110 ) ) ( not ( = ?auto_1273109 ?auto_1273111 ) ) ( not ( = ?auto_1273109 ?auto_1273112 ) ) ( not ( = ?auto_1273109 ?auto_1273113 ) ) ( not ( = ?auto_1273109 ?auto_1273114 ) ) ( not ( = ?auto_1273109 ?auto_1273115 ) ) ( not ( = ?auto_1273109 ?auto_1273116 ) ) ( not ( = ?auto_1273109 ?auto_1273117 ) ) ( not ( = ?auto_1273110 ?auto_1273111 ) ) ( not ( = ?auto_1273110 ?auto_1273112 ) ) ( not ( = ?auto_1273110 ?auto_1273113 ) ) ( not ( = ?auto_1273110 ?auto_1273114 ) ) ( not ( = ?auto_1273110 ?auto_1273115 ) ) ( not ( = ?auto_1273110 ?auto_1273116 ) ) ( not ( = ?auto_1273110 ?auto_1273117 ) ) ( not ( = ?auto_1273111 ?auto_1273112 ) ) ( not ( = ?auto_1273111 ?auto_1273113 ) ) ( not ( = ?auto_1273111 ?auto_1273114 ) ) ( not ( = ?auto_1273111 ?auto_1273115 ) ) ( not ( = ?auto_1273111 ?auto_1273116 ) ) ( not ( = ?auto_1273111 ?auto_1273117 ) ) ( not ( = ?auto_1273112 ?auto_1273113 ) ) ( not ( = ?auto_1273112 ?auto_1273114 ) ) ( not ( = ?auto_1273112 ?auto_1273115 ) ) ( not ( = ?auto_1273112 ?auto_1273116 ) ) ( not ( = ?auto_1273112 ?auto_1273117 ) ) ( not ( = ?auto_1273113 ?auto_1273114 ) ) ( not ( = ?auto_1273113 ?auto_1273115 ) ) ( not ( = ?auto_1273113 ?auto_1273116 ) ) ( not ( = ?auto_1273113 ?auto_1273117 ) ) ( not ( = ?auto_1273114 ?auto_1273115 ) ) ( not ( = ?auto_1273114 ?auto_1273116 ) ) ( not ( = ?auto_1273114 ?auto_1273117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273115 ?auto_1273116 ?auto_1273117 )
      ( MAKE-9CRATE-VERIFY ?auto_1273108 ?auto_1273109 ?auto_1273110 ?auto_1273111 ?auto_1273112 ?auto_1273113 ?auto_1273114 ?auto_1273115 ?auto_1273116 ?auto_1273117 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273207 - SURFACE
      ?auto_1273208 - SURFACE
      ?auto_1273209 - SURFACE
      ?auto_1273210 - SURFACE
      ?auto_1273211 - SURFACE
      ?auto_1273212 - SURFACE
      ?auto_1273213 - SURFACE
      ?auto_1273214 - SURFACE
      ?auto_1273215 - SURFACE
      ?auto_1273216 - SURFACE
    )
    :vars
    (
      ?auto_1273219 - HOIST
      ?auto_1273221 - PLACE
      ?auto_1273217 - TRUCK
      ?auto_1273218 - PLACE
      ?auto_1273220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273219 ?auto_1273221 ) ( SURFACE-AT ?auto_1273215 ?auto_1273221 ) ( CLEAR ?auto_1273215 ) ( IS-CRATE ?auto_1273216 ) ( not ( = ?auto_1273215 ?auto_1273216 ) ) ( AVAILABLE ?auto_1273219 ) ( ON ?auto_1273215 ?auto_1273214 ) ( not ( = ?auto_1273214 ?auto_1273215 ) ) ( not ( = ?auto_1273214 ?auto_1273216 ) ) ( TRUCK-AT ?auto_1273217 ?auto_1273218 ) ( not ( = ?auto_1273218 ?auto_1273221 ) ) ( HOIST-AT ?auto_1273220 ?auto_1273218 ) ( LIFTING ?auto_1273220 ?auto_1273216 ) ( not ( = ?auto_1273219 ?auto_1273220 ) ) ( ON ?auto_1273208 ?auto_1273207 ) ( ON ?auto_1273209 ?auto_1273208 ) ( ON ?auto_1273210 ?auto_1273209 ) ( ON ?auto_1273211 ?auto_1273210 ) ( ON ?auto_1273212 ?auto_1273211 ) ( ON ?auto_1273213 ?auto_1273212 ) ( ON ?auto_1273214 ?auto_1273213 ) ( not ( = ?auto_1273207 ?auto_1273208 ) ) ( not ( = ?auto_1273207 ?auto_1273209 ) ) ( not ( = ?auto_1273207 ?auto_1273210 ) ) ( not ( = ?auto_1273207 ?auto_1273211 ) ) ( not ( = ?auto_1273207 ?auto_1273212 ) ) ( not ( = ?auto_1273207 ?auto_1273213 ) ) ( not ( = ?auto_1273207 ?auto_1273214 ) ) ( not ( = ?auto_1273207 ?auto_1273215 ) ) ( not ( = ?auto_1273207 ?auto_1273216 ) ) ( not ( = ?auto_1273208 ?auto_1273209 ) ) ( not ( = ?auto_1273208 ?auto_1273210 ) ) ( not ( = ?auto_1273208 ?auto_1273211 ) ) ( not ( = ?auto_1273208 ?auto_1273212 ) ) ( not ( = ?auto_1273208 ?auto_1273213 ) ) ( not ( = ?auto_1273208 ?auto_1273214 ) ) ( not ( = ?auto_1273208 ?auto_1273215 ) ) ( not ( = ?auto_1273208 ?auto_1273216 ) ) ( not ( = ?auto_1273209 ?auto_1273210 ) ) ( not ( = ?auto_1273209 ?auto_1273211 ) ) ( not ( = ?auto_1273209 ?auto_1273212 ) ) ( not ( = ?auto_1273209 ?auto_1273213 ) ) ( not ( = ?auto_1273209 ?auto_1273214 ) ) ( not ( = ?auto_1273209 ?auto_1273215 ) ) ( not ( = ?auto_1273209 ?auto_1273216 ) ) ( not ( = ?auto_1273210 ?auto_1273211 ) ) ( not ( = ?auto_1273210 ?auto_1273212 ) ) ( not ( = ?auto_1273210 ?auto_1273213 ) ) ( not ( = ?auto_1273210 ?auto_1273214 ) ) ( not ( = ?auto_1273210 ?auto_1273215 ) ) ( not ( = ?auto_1273210 ?auto_1273216 ) ) ( not ( = ?auto_1273211 ?auto_1273212 ) ) ( not ( = ?auto_1273211 ?auto_1273213 ) ) ( not ( = ?auto_1273211 ?auto_1273214 ) ) ( not ( = ?auto_1273211 ?auto_1273215 ) ) ( not ( = ?auto_1273211 ?auto_1273216 ) ) ( not ( = ?auto_1273212 ?auto_1273213 ) ) ( not ( = ?auto_1273212 ?auto_1273214 ) ) ( not ( = ?auto_1273212 ?auto_1273215 ) ) ( not ( = ?auto_1273212 ?auto_1273216 ) ) ( not ( = ?auto_1273213 ?auto_1273214 ) ) ( not ( = ?auto_1273213 ?auto_1273215 ) ) ( not ( = ?auto_1273213 ?auto_1273216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273214 ?auto_1273215 ?auto_1273216 )
      ( MAKE-9CRATE-VERIFY ?auto_1273207 ?auto_1273208 ?auto_1273209 ?auto_1273210 ?auto_1273211 ?auto_1273212 ?auto_1273213 ?auto_1273214 ?auto_1273215 ?auto_1273216 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273315 - SURFACE
      ?auto_1273316 - SURFACE
      ?auto_1273317 - SURFACE
      ?auto_1273318 - SURFACE
      ?auto_1273319 - SURFACE
      ?auto_1273320 - SURFACE
      ?auto_1273321 - SURFACE
      ?auto_1273322 - SURFACE
      ?auto_1273323 - SURFACE
      ?auto_1273324 - SURFACE
    )
    :vars
    (
      ?auto_1273325 - HOIST
      ?auto_1273326 - PLACE
      ?auto_1273329 - TRUCK
      ?auto_1273327 - PLACE
      ?auto_1273328 - HOIST
      ?auto_1273330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273325 ?auto_1273326 ) ( SURFACE-AT ?auto_1273323 ?auto_1273326 ) ( CLEAR ?auto_1273323 ) ( IS-CRATE ?auto_1273324 ) ( not ( = ?auto_1273323 ?auto_1273324 ) ) ( AVAILABLE ?auto_1273325 ) ( ON ?auto_1273323 ?auto_1273322 ) ( not ( = ?auto_1273322 ?auto_1273323 ) ) ( not ( = ?auto_1273322 ?auto_1273324 ) ) ( TRUCK-AT ?auto_1273329 ?auto_1273327 ) ( not ( = ?auto_1273327 ?auto_1273326 ) ) ( HOIST-AT ?auto_1273328 ?auto_1273327 ) ( not ( = ?auto_1273325 ?auto_1273328 ) ) ( AVAILABLE ?auto_1273328 ) ( SURFACE-AT ?auto_1273324 ?auto_1273327 ) ( ON ?auto_1273324 ?auto_1273330 ) ( CLEAR ?auto_1273324 ) ( not ( = ?auto_1273323 ?auto_1273330 ) ) ( not ( = ?auto_1273324 ?auto_1273330 ) ) ( not ( = ?auto_1273322 ?auto_1273330 ) ) ( ON ?auto_1273316 ?auto_1273315 ) ( ON ?auto_1273317 ?auto_1273316 ) ( ON ?auto_1273318 ?auto_1273317 ) ( ON ?auto_1273319 ?auto_1273318 ) ( ON ?auto_1273320 ?auto_1273319 ) ( ON ?auto_1273321 ?auto_1273320 ) ( ON ?auto_1273322 ?auto_1273321 ) ( not ( = ?auto_1273315 ?auto_1273316 ) ) ( not ( = ?auto_1273315 ?auto_1273317 ) ) ( not ( = ?auto_1273315 ?auto_1273318 ) ) ( not ( = ?auto_1273315 ?auto_1273319 ) ) ( not ( = ?auto_1273315 ?auto_1273320 ) ) ( not ( = ?auto_1273315 ?auto_1273321 ) ) ( not ( = ?auto_1273315 ?auto_1273322 ) ) ( not ( = ?auto_1273315 ?auto_1273323 ) ) ( not ( = ?auto_1273315 ?auto_1273324 ) ) ( not ( = ?auto_1273315 ?auto_1273330 ) ) ( not ( = ?auto_1273316 ?auto_1273317 ) ) ( not ( = ?auto_1273316 ?auto_1273318 ) ) ( not ( = ?auto_1273316 ?auto_1273319 ) ) ( not ( = ?auto_1273316 ?auto_1273320 ) ) ( not ( = ?auto_1273316 ?auto_1273321 ) ) ( not ( = ?auto_1273316 ?auto_1273322 ) ) ( not ( = ?auto_1273316 ?auto_1273323 ) ) ( not ( = ?auto_1273316 ?auto_1273324 ) ) ( not ( = ?auto_1273316 ?auto_1273330 ) ) ( not ( = ?auto_1273317 ?auto_1273318 ) ) ( not ( = ?auto_1273317 ?auto_1273319 ) ) ( not ( = ?auto_1273317 ?auto_1273320 ) ) ( not ( = ?auto_1273317 ?auto_1273321 ) ) ( not ( = ?auto_1273317 ?auto_1273322 ) ) ( not ( = ?auto_1273317 ?auto_1273323 ) ) ( not ( = ?auto_1273317 ?auto_1273324 ) ) ( not ( = ?auto_1273317 ?auto_1273330 ) ) ( not ( = ?auto_1273318 ?auto_1273319 ) ) ( not ( = ?auto_1273318 ?auto_1273320 ) ) ( not ( = ?auto_1273318 ?auto_1273321 ) ) ( not ( = ?auto_1273318 ?auto_1273322 ) ) ( not ( = ?auto_1273318 ?auto_1273323 ) ) ( not ( = ?auto_1273318 ?auto_1273324 ) ) ( not ( = ?auto_1273318 ?auto_1273330 ) ) ( not ( = ?auto_1273319 ?auto_1273320 ) ) ( not ( = ?auto_1273319 ?auto_1273321 ) ) ( not ( = ?auto_1273319 ?auto_1273322 ) ) ( not ( = ?auto_1273319 ?auto_1273323 ) ) ( not ( = ?auto_1273319 ?auto_1273324 ) ) ( not ( = ?auto_1273319 ?auto_1273330 ) ) ( not ( = ?auto_1273320 ?auto_1273321 ) ) ( not ( = ?auto_1273320 ?auto_1273322 ) ) ( not ( = ?auto_1273320 ?auto_1273323 ) ) ( not ( = ?auto_1273320 ?auto_1273324 ) ) ( not ( = ?auto_1273320 ?auto_1273330 ) ) ( not ( = ?auto_1273321 ?auto_1273322 ) ) ( not ( = ?auto_1273321 ?auto_1273323 ) ) ( not ( = ?auto_1273321 ?auto_1273324 ) ) ( not ( = ?auto_1273321 ?auto_1273330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273322 ?auto_1273323 ?auto_1273324 )
      ( MAKE-9CRATE-VERIFY ?auto_1273315 ?auto_1273316 ?auto_1273317 ?auto_1273318 ?auto_1273319 ?auto_1273320 ?auto_1273321 ?auto_1273322 ?auto_1273323 ?auto_1273324 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273424 - SURFACE
      ?auto_1273425 - SURFACE
      ?auto_1273426 - SURFACE
      ?auto_1273427 - SURFACE
      ?auto_1273428 - SURFACE
      ?auto_1273429 - SURFACE
      ?auto_1273430 - SURFACE
      ?auto_1273431 - SURFACE
      ?auto_1273432 - SURFACE
      ?auto_1273433 - SURFACE
    )
    :vars
    (
      ?auto_1273434 - HOIST
      ?auto_1273439 - PLACE
      ?auto_1273437 - PLACE
      ?auto_1273436 - HOIST
      ?auto_1273438 - SURFACE
      ?auto_1273435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273434 ?auto_1273439 ) ( SURFACE-AT ?auto_1273432 ?auto_1273439 ) ( CLEAR ?auto_1273432 ) ( IS-CRATE ?auto_1273433 ) ( not ( = ?auto_1273432 ?auto_1273433 ) ) ( AVAILABLE ?auto_1273434 ) ( ON ?auto_1273432 ?auto_1273431 ) ( not ( = ?auto_1273431 ?auto_1273432 ) ) ( not ( = ?auto_1273431 ?auto_1273433 ) ) ( not ( = ?auto_1273437 ?auto_1273439 ) ) ( HOIST-AT ?auto_1273436 ?auto_1273437 ) ( not ( = ?auto_1273434 ?auto_1273436 ) ) ( AVAILABLE ?auto_1273436 ) ( SURFACE-AT ?auto_1273433 ?auto_1273437 ) ( ON ?auto_1273433 ?auto_1273438 ) ( CLEAR ?auto_1273433 ) ( not ( = ?auto_1273432 ?auto_1273438 ) ) ( not ( = ?auto_1273433 ?auto_1273438 ) ) ( not ( = ?auto_1273431 ?auto_1273438 ) ) ( TRUCK-AT ?auto_1273435 ?auto_1273439 ) ( ON ?auto_1273425 ?auto_1273424 ) ( ON ?auto_1273426 ?auto_1273425 ) ( ON ?auto_1273427 ?auto_1273426 ) ( ON ?auto_1273428 ?auto_1273427 ) ( ON ?auto_1273429 ?auto_1273428 ) ( ON ?auto_1273430 ?auto_1273429 ) ( ON ?auto_1273431 ?auto_1273430 ) ( not ( = ?auto_1273424 ?auto_1273425 ) ) ( not ( = ?auto_1273424 ?auto_1273426 ) ) ( not ( = ?auto_1273424 ?auto_1273427 ) ) ( not ( = ?auto_1273424 ?auto_1273428 ) ) ( not ( = ?auto_1273424 ?auto_1273429 ) ) ( not ( = ?auto_1273424 ?auto_1273430 ) ) ( not ( = ?auto_1273424 ?auto_1273431 ) ) ( not ( = ?auto_1273424 ?auto_1273432 ) ) ( not ( = ?auto_1273424 ?auto_1273433 ) ) ( not ( = ?auto_1273424 ?auto_1273438 ) ) ( not ( = ?auto_1273425 ?auto_1273426 ) ) ( not ( = ?auto_1273425 ?auto_1273427 ) ) ( not ( = ?auto_1273425 ?auto_1273428 ) ) ( not ( = ?auto_1273425 ?auto_1273429 ) ) ( not ( = ?auto_1273425 ?auto_1273430 ) ) ( not ( = ?auto_1273425 ?auto_1273431 ) ) ( not ( = ?auto_1273425 ?auto_1273432 ) ) ( not ( = ?auto_1273425 ?auto_1273433 ) ) ( not ( = ?auto_1273425 ?auto_1273438 ) ) ( not ( = ?auto_1273426 ?auto_1273427 ) ) ( not ( = ?auto_1273426 ?auto_1273428 ) ) ( not ( = ?auto_1273426 ?auto_1273429 ) ) ( not ( = ?auto_1273426 ?auto_1273430 ) ) ( not ( = ?auto_1273426 ?auto_1273431 ) ) ( not ( = ?auto_1273426 ?auto_1273432 ) ) ( not ( = ?auto_1273426 ?auto_1273433 ) ) ( not ( = ?auto_1273426 ?auto_1273438 ) ) ( not ( = ?auto_1273427 ?auto_1273428 ) ) ( not ( = ?auto_1273427 ?auto_1273429 ) ) ( not ( = ?auto_1273427 ?auto_1273430 ) ) ( not ( = ?auto_1273427 ?auto_1273431 ) ) ( not ( = ?auto_1273427 ?auto_1273432 ) ) ( not ( = ?auto_1273427 ?auto_1273433 ) ) ( not ( = ?auto_1273427 ?auto_1273438 ) ) ( not ( = ?auto_1273428 ?auto_1273429 ) ) ( not ( = ?auto_1273428 ?auto_1273430 ) ) ( not ( = ?auto_1273428 ?auto_1273431 ) ) ( not ( = ?auto_1273428 ?auto_1273432 ) ) ( not ( = ?auto_1273428 ?auto_1273433 ) ) ( not ( = ?auto_1273428 ?auto_1273438 ) ) ( not ( = ?auto_1273429 ?auto_1273430 ) ) ( not ( = ?auto_1273429 ?auto_1273431 ) ) ( not ( = ?auto_1273429 ?auto_1273432 ) ) ( not ( = ?auto_1273429 ?auto_1273433 ) ) ( not ( = ?auto_1273429 ?auto_1273438 ) ) ( not ( = ?auto_1273430 ?auto_1273431 ) ) ( not ( = ?auto_1273430 ?auto_1273432 ) ) ( not ( = ?auto_1273430 ?auto_1273433 ) ) ( not ( = ?auto_1273430 ?auto_1273438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273431 ?auto_1273432 ?auto_1273433 )
      ( MAKE-9CRATE-VERIFY ?auto_1273424 ?auto_1273425 ?auto_1273426 ?auto_1273427 ?auto_1273428 ?auto_1273429 ?auto_1273430 ?auto_1273431 ?auto_1273432 ?auto_1273433 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273533 - SURFACE
      ?auto_1273534 - SURFACE
      ?auto_1273535 - SURFACE
      ?auto_1273536 - SURFACE
      ?auto_1273537 - SURFACE
      ?auto_1273538 - SURFACE
      ?auto_1273539 - SURFACE
      ?auto_1273540 - SURFACE
      ?auto_1273541 - SURFACE
      ?auto_1273542 - SURFACE
    )
    :vars
    (
      ?auto_1273545 - HOIST
      ?auto_1273546 - PLACE
      ?auto_1273548 - PLACE
      ?auto_1273543 - HOIST
      ?auto_1273547 - SURFACE
      ?auto_1273544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273545 ?auto_1273546 ) ( IS-CRATE ?auto_1273542 ) ( not ( = ?auto_1273541 ?auto_1273542 ) ) ( not ( = ?auto_1273540 ?auto_1273541 ) ) ( not ( = ?auto_1273540 ?auto_1273542 ) ) ( not ( = ?auto_1273548 ?auto_1273546 ) ) ( HOIST-AT ?auto_1273543 ?auto_1273548 ) ( not ( = ?auto_1273545 ?auto_1273543 ) ) ( AVAILABLE ?auto_1273543 ) ( SURFACE-AT ?auto_1273542 ?auto_1273548 ) ( ON ?auto_1273542 ?auto_1273547 ) ( CLEAR ?auto_1273542 ) ( not ( = ?auto_1273541 ?auto_1273547 ) ) ( not ( = ?auto_1273542 ?auto_1273547 ) ) ( not ( = ?auto_1273540 ?auto_1273547 ) ) ( TRUCK-AT ?auto_1273544 ?auto_1273546 ) ( SURFACE-AT ?auto_1273540 ?auto_1273546 ) ( CLEAR ?auto_1273540 ) ( LIFTING ?auto_1273545 ?auto_1273541 ) ( IS-CRATE ?auto_1273541 ) ( ON ?auto_1273534 ?auto_1273533 ) ( ON ?auto_1273535 ?auto_1273534 ) ( ON ?auto_1273536 ?auto_1273535 ) ( ON ?auto_1273537 ?auto_1273536 ) ( ON ?auto_1273538 ?auto_1273537 ) ( ON ?auto_1273539 ?auto_1273538 ) ( ON ?auto_1273540 ?auto_1273539 ) ( not ( = ?auto_1273533 ?auto_1273534 ) ) ( not ( = ?auto_1273533 ?auto_1273535 ) ) ( not ( = ?auto_1273533 ?auto_1273536 ) ) ( not ( = ?auto_1273533 ?auto_1273537 ) ) ( not ( = ?auto_1273533 ?auto_1273538 ) ) ( not ( = ?auto_1273533 ?auto_1273539 ) ) ( not ( = ?auto_1273533 ?auto_1273540 ) ) ( not ( = ?auto_1273533 ?auto_1273541 ) ) ( not ( = ?auto_1273533 ?auto_1273542 ) ) ( not ( = ?auto_1273533 ?auto_1273547 ) ) ( not ( = ?auto_1273534 ?auto_1273535 ) ) ( not ( = ?auto_1273534 ?auto_1273536 ) ) ( not ( = ?auto_1273534 ?auto_1273537 ) ) ( not ( = ?auto_1273534 ?auto_1273538 ) ) ( not ( = ?auto_1273534 ?auto_1273539 ) ) ( not ( = ?auto_1273534 ?auto_1273540 ) ) ( not ( = ?auto_1273534 ?auto_1273541 ) ) ( not ( = ?auto_1273534 ?auto_1273542 ) ) ( not ( = ?auto_1273534 ?auto_1273547 ) ) ( not ( = ?auto_1273535 ?auto_1273536 ) ) ( not ( = ?auto_1273535 ?auto_1273537 ) ) ( not ( = ?auto_1273535 ?auto_1273538 ) ) ( not ( = ?auto_1273535 ?auto_1273539 ) ) ( not ( = ?auto_1273535 ?auto_1273540 ) ) ( not ( = ?auto_1273535 ?auto_1273541 ) ) ( not ( = ?auto_1273535 ?auto_1273542 ) ) ( not ( = ?auto_1273535 ?auto_1273547 ) ) ( not ( = ?auto_1273536 ?auto_1273537 ) ) ( not ( = ?auto_1273536 ?auto_1273538 ) ) ( not ( = ?auto_1273536 ?auto_1273539 ) ) ( not ( = ?auto_1273536 ?auto_1273540 ) ) ( not ( = ?auto_1273536 ?auto_1273541 ) ) ( not ( = ?auto_1273536 ?auto_1273542 ) ) ( not ( = ?auto_1273536 ?auto_1273547 ) ) ( not ( = ?auto_1273537 ?auto_1273538 ) ) ( not ( = ?auto_1273537 ?auto_1273539 ) ) ( not ( = ?auto_1273537 ?auto_1273540 ) ) ( not ( = ?auto_1273537 ?auto_1273541 ) ) ( not ( = ?auto_1273537 ?auto_1273542 ) ) ( not ( = ?auto_1273537 ?auto_1273547 ) ) ( not ( = ?auto_1273538 ?auto_1273539 ) ) ( not ( = ?auto_1273538 ?auto_1273540 ) ) ( not ( = ?auto_1273538 ?auto_1273541 ) ) ( not ( = ?auto_1273538 ?auto_1273542 ) ) ( not ( = ?auto_1273538 ?auto_1273547 ) ) ( not ( = ?auto_1273539 ?auto_1273540 ) ) ( not ( = ?auto_1273539 ?auto_1273541 ) ) ( not ( = ?auto_1273539 ?auto_1273542 ) ) ( not ( = ?auto_1273539 ?auto_1273547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273540 ?auto_1273541 ?auto_1273542 )
      ( MAKE-9CRATE-VERIFY ?auto_1273533 ?auto_1273534 ?auto_1273535 ?auto_1273536 ?auto_1273537 ?auto_1273538 ?auto_1273539 ?auto_1273540 ?auto_1273541 ?auto_1273542 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273642 - SURFACE
      ?auto_1273643 - SURFACE
      ?auto_1273644 - SURFACE
      ?auto_1273645 - SURFACE
      ?auto_1273646 - SURFACE
      ?auto_1273647 - SURFACE
      ?auto_1273648 - SURFACE
      ?auto_1273649 - SURFACE
      ?auto_1273650 - SURFACE
      ?auto_1273651 - SURFACE
    )
    :vars
    (
      ?auto_1273652 - HOIST
      ?auto_1273655 - PLACE
      ?auto_1273656 - PLACE
      ?auto_1273657 - HOIST
      ?auto_1273654 - SURFACE
      ?auto_1273653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273652 ?auto_1273655 ) ( IS-CRATE ?auto_1273651 ) ( not ( = ?auto_1273650 ?auto_1273651 ) ) ( not ( = ?auto_1273649 ?auto_1273650 ) ) ( not ( = ?auto_1273649 ?auto_1273651 ) ) ( not ( = ?auto_1273656 ?auto_1273655 ) ) ( HOIST-AT ?auto_1273657 ?auto_1273656 ) ( not ( = ?auto_1273652 ?auto_1273657 ) ) ( AVAILABLE ?auto_1273657 ) ( SURFACE-AT ?auto_1273651 ?auto_1273656 ) ( ON ?auto_1273651 ?auto_1273654 ) ( CLEAR ?auto_1273651 ) ( not ( = ?auto_1273650 ?auto_1273654 ) ) ( not ( = ?auto_1273651 ?auto_1273654 ) ) ( not ( = ?auto_1273649 ?auto_1273654 ) ) ( TRUCK-AT ?auto_1273653 ?auto_1273655 ) ( SURFACE-AT ?auto_1273649 ?auto_1273655 ) ( CLEAR ?auto_1273649 ) ( IS-CRATE ?auto_1273650 ) ( AVAILABLE ?auto_1273652 ) ( IN ?auto_1273650 ?auto_1273653 ) ( ON ?auto_1273643 ?auto_1273642 ) ( ON ?auto_1273644 ?auto_1273643 ) ( ON ?auto_1273645 ?auto_1273644 ) ( ON ?auto_1273646 ?auto_1273645 ) ( ON ?auto_1273647 ?auto_1273646 ) ( ON ?auto_1273648 ?auto_1273647 ) ( ON ?auto_1273649 ?auto_1273648 ) ( not ( = ?auto_1273642 ?auto_1273643 ) ) ( not ( = ?auto_1273642 ?auto_1273644 ) ) ( not ( = ?auto_1273642 ?auto_1273645 ) ) ( not ( = ?auto_1273642 ?auto_1273646 ) ) ( not ( = ?auto_1273642 ?auto_1273647 ) ) ( not ( = ?auto_1273642 ?auto_1273648 ) ) ( not ( = ?auto_1273642 ?auto_1273649 ) ) ( not ( = ?auto_1273642 ?auto_1273650 ) ) ( not ( = ?auto_1273642 ?auto_1273651 ) ) ( not ( = ?auto_1273642 ?auto_1273654 ) ) ( not ( = ?auto_1273643 ?auto_1273644 ) ) ( not ( = ?auto_1273643 ?auto_1273645 ) ) ( not ( = ?auto_1273643 ?auto_1273646 ) ) ( not ( = ?auto_1273643 ?auto_1273647 ) ) ( not ( = ?auto_1273643 ?auto_1273648 ) ) ( not ( = ?auto_1273643 ?auto_1273649 ) ) ( not ( = ?auto_1273643 ?auto_1273650 ) ) ( not ( = ?auto_1273643 ?auto_1273651 ) ) ( not ( = ?auto_1273643 ?auto_1273654 ) ) ( not ( = ?auto_1273644 ?auto_1273645 ) ) ( not ( = ?auto_1273644 ?auto_1273646 ) ) ( not ( = ?auto_1273644 ?auto_1273647 ) ) ( not ( = ?auto_1273644 ?auto_1273648 ) ) ( not ( = ?auto_1273644 ?auto_1273649 ) ) ( not ( = ?auto_1273644 ?auto_1273650 ) ) ( not ( = ?auto_1273644 ?auto_1273651 ) ) ( not ( = ?auto_1273644 ?auto_1273654 ) ) ( not ( = ?auto_1273645 ?auto_1273646 ) ) ( not ( = ?auto_1273645 ?auto_1273647 ) ) ( not ( = ?auto_1273645 ?auto_1273648 ) ) ( not ( = ?auto_1273645 ?auto_1273649 ) ) ( not ( = ?auto_1273645 ?auto_1273650 ) ) ( not ( = ?auto_1273645 ?auto_1273651 ) ) ( not ( = ?auto_1273645 ?auto_1273654 ) ) ( not ( = ?auto_1273646 ?auto_1273647 ) ) ( not ( = ?auto_1273646 ?auto_1273648 ) ) ( not ( = ?auto_1273646 ?auto_1273649 ) ) ( not ( = ?auto_1273646 ?auto_1273650 ) ) ( not ( = ?auto_1273646 ?auto_1273651 ) ) ( not ( = ?auto_1273646 ?auto_1273654 ) ) ( not ( = ?auto_1273647 ?auto_1273648 ) ) ( not ( = ?auto_1273647 ?auto_1273649 ) ) ( not ( = ?auto_1273647 ?auto_1273650 ) ) ( not ( = ?auto_1273647 ?auto_1273651 ) ) ( not ( = ?auto_1273647 ?auto_1273654 ) ) ( not ( = ?auto_1273648 ?auto_1273649 ) ) ( not ( = ?auto_1273648 ?auto_1273650 ) ) ( not ( = ?auto_1273648 ?auto_1273651 ) ) ( not ( = ?auto_1273648 ?auto_1273654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273649 ?auto_1273650 ?auto_1273651 )
      ( MAKE-9CRATE-VERIFY ?auto_1273642 ?auto_1273643 ?auto_1273644 ?auto_1273645 ?auto_1273646 ?auto_1273647 ?auto_1273648 ?auto_1273649 ?auto_1273650 ?auto_1273651 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279207 - SURFACE
      ?auto_1279208 - SURFACE
      ?auto_1279209 - SURFACE
      ?auto_1279210 - SURFACE
      ?auto_1279211 - SURFACE
      ?auto_1279212 - SURFACE
      ?auto_1279213 - SURFACE
      ?auto_1279214 - SURFACE
      ?auto_1279215 - SURFACE
      ?auto_1279216 - SURFACE
      ?auto_1279217 - SURFACE
    )
    :vars
    (
      ?auto_1279218 - HOIST
      ?auto_1279219 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279218 ?auto_1279219 ) ( SURFACE-AT ?auto_1279216 ?auto_1279219 ) ( CLEAR ?auto_1279216 ) ( LIFTING ?auto_1279218 ?auto_1279217 ) ( IS-CRATE ?auto_1279217 ) ( not ( = ?auto_1279216 ?auto_1279217 ) ) ( ON ?auto_1279208 ?auto_1279207 ) ( ON ?auto_1279209 ?auto_1279208 ) ( ON ?auto_1279210 ?auto_1279209 ) ( ON ?auto_1279211 ?auto_1279210 ) ( ON ?auto_1279212 ?auto_1279211 ) ( ON ?auto_1279213 ?auto_1279212 ) ( ON ?auto_1279214 ?auto_1279213 ) ( ON ?auto_1279215 ?auto_1279214 ) ( ON ?auto_1279216 ?auto_1279215 ) ( not ( = ?auto_1279207 ?auto_1279208 ) ) ( not ( = ?auto_1279207 ?auto_1279209 ) ) ( not ( = ?auto_1279207 ?auto_1279210 ) ) ( not ( = ?auto_1279207 ?auto_1279211 ) ) ( not ( = ?auto_1279207 ?auto_1279212 ) ) ( not ( = ?auto_1279207 ?auto_1279213 ) ) ( not ( = ?auto_1279207 ?auto_1279214 ) ) ( not ( = ?auto_1279207 ?auto_1279215 ) ) ( not ( = ?auto_1279207 ?auto_1279216 ) ) ( not ( = ?auto_1279207 ?auto_1279217 ) ) ( not ( = ?auto_1279208 ?auto_1279209 ) ) ( not ( = ?auto_1279208 ?auto_1279210 ) ) ( not ( = ?auto_1279208 ?auto_1279211 ) ) ( not ( = ?auto_1279208 ?auto_1279212 ) ) ( not ( = ?auto_1279208 ?auto_1279213 ) ) ( not ( = ?auto_1279208 ?auto_1279214 ) ) ( not ( = ?auto_1279208 ?auto_1279215 ) ) ( not ( = ?auto_1279208 ?auto_1279216 ) ) ( not ( = ?auto_1279208 ?auto_1279217 ) ) ( not ( = ?auto_1279209 ?auto_1279210 ) ) ( not ( = ?auto_1279209 ?auto_1279211 ) ) ( not ( = ?auto_1279209 ?auto_1279212 ) ) ( not ( = ?auto_1279209 ?auto_1279213 ) ) ( not ( = ?auto_1279209 ?auto_1279214 ) ) ( not ( = ?auto_1279209 ?auto_1279215 ) ) ( not ( = ?auto_1279209 ?auto_1279216 ) ) ( not ( = ?auto_1279209 ?auto_1279217 ) ) ( not ( = ?auto_1279210 ?auto_1279211 ) ) ( not ( = ?auto_1279210 ?auto_1279212 ) ) ( not ( = ?auto_1279210 ?auto_1279213 ) ) ( not ( = ?auto_1279210 ?auto_1279214 ) ) ( not ( = ?auto_1279210 ?auto_1279215 ) ) ( not ( = ?auto_1279210 ?auto_1279216 ) ) ( not ( = ?auto_1279210 ?auto_1279217 ) ) ( not ( = ?auto_1279211 ?auto_1279212 ) ) ( not ( = ?auto_1279211 ?auto_1279213 ) ) ( not ( = ?auto_1279211 ?auto_1279214 ) ) ( not ( = ?auto_1279211 ?auto_1279215 ) ) ( not ( = ?auto_1279211 ?auto_1279216 ) ) ( not ( = ?auto_1279211 ?auto_1279217 ) ) ( not ( = ?auto_1279212 ?auto_1279213 ) ) ( not ( = ?auto_1279212 ?auto_1279214 ) ) ( not ( = ?auto_1279212 ?auto_1279215 ) ) ( not ( = ?auto_1279212 ?auto_1279216 ) ) ( not ( = ?auto_1279212 ?auto_1279217 ) ) ( not ( = ?auto_1279213 ?auto_1279214 ) ) ( not ( = ?auto_1279213 ?auto_1279215 ) ) ( not ( = ?auto_1279213 ?auto_1279216 ) ) ( not ( = ?auto_1279213 ?auto_1279217 ) ) ( not ( = ?auto_1279214 ?auto_1279215 ) ) ( not ( = ?auto_1279214 ?auto_1279216 ) ) ( not ( = ?auto_1279214 ?auto_1279217 ) ) ( not ( = ?auto_1279215 ?auto_1279216 ) ) ( not ( = ?auto_1279215 ?auto_1279217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1279216 ?auto_1279217 )
      ( MAKE-10CRATE-VERIFY ?auto_1279207 ?auto_1279208 ?auto_1279209 ?auto_1279210 ?auto_1279211 ?auto_1279212 ?auto_1279213 ?auto_1279214 ?auto_1279215 ?auto_1279216 ?auto_1279217 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279301 - SURFACE
      ?auto_1279302 - SURFACE
      ?auto_1279303 - SURFACE
      ?auto_1279304 - SURFACE
      ?auto_1279305 - SURFACE
      ?auto_1279306 - SURFACE
      ?auto_1279307 - SURFACE
      ?auto_1279308 - SURFACE
      ?auto_1279309 - SURFACE
      ?auto_1279310 - SURFACE
      ?auto_1279311 - SURFACE
    )
    :vars
    (
      ?auto_1279312 - HOIST
      ?auto_1279313 - PLACE
      ?auto_1279314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279312 ?auto_1279313 ) ( SURFACE-AT ?auto_1279310 ?auto_1279313 ) ( CLEAR ?auto_1279310 ) ( IS-CRATE ?auto_1279311 ) ( not ( = ?auto_1279310 ?auto_1279311 ) ) ( TRUCK-AT ?auto_1279314 ?auto_1279313 ) ( AVAILABLE ?auto_1279312 ) ( IN ?auto_1279311 ?auto_1279314 ) ( ON ?auto_1279310 ?auto_1279309 ) ( not ( = ?auto_1279309 ?auto_1279310 ) ) ( not ( = ?auto_1279309 ?auto_1279311 ) ) ( ON ?auto_1279302 ?auto_1279301 ) ( ON ?auto_1279303 ?auto_1279302 ) ( ON ?auto_1279304 ?auto_1279303 ) ( ON ?auto_1279305 ?auto_1279304 ) ( ON ?auto_1279306 ?auto_1279305 ) ( ON ?auto_1279307 ?auto_1279306 ) ( ON ?auto_1279308 ?auto_1279307 ) ( ON ?auto_1279309 ?auto_1279308 ) ( not ( = ?auto_1279301 ?auto_1279302 ) ) ( not ( = ?auto_1279301 ?auto_1279303 ) ) ( not ( = ?auto_1279301 ?auto_1279304 ) ) ( not ( = ?auto_1279301 ?auto_1279305 ) ) ( not ( = ?auto_1279301 ?auto_1279306 ) ) ( not ( = ?auto_1279301 ?auto_1279307 ) ) ( not ( = ?auto_1279301 ?auto_1279308 ) ) ( not ( = ?auto_1279301 ?auto_1279309 ) ) ( not ( = ?auto_1279301 ?auto_1279310 ) ) ( not ( = ?auto_1279301 ?auto_1279311 ) ) ( not ( = ?auto_1279302 ?auto_1279303 ) ) ( not ( = ?auto_1279302 ?auto_1279304 ) ) ( not ( = ?auto_1279302 ?auto_1279305 ) ) ( not ( = ?auto_1279302 ?auto_1279306 ) ) ( not ( = ?auto_1279302 ?auto_1279307 ) ) ( not ( = ?auto_1279302 ?auto_1279308 ) ) ( not ( = ?auto_1279302 ?auto_1279309 ) ) ( not ( = ?auto_1279302 ?auto_1279310 ) ) ( not ( = ?auto_1279302 ?auto_1279311 ) ) ( not ( = ?auto_1279303 ?auto_1279304 ) ) ( not ( = ?auto_1279303 ?auto_1279305 ) ) ( not ( = ?auto_1279303 ?auto_1279306 ) ) ( not ( = ?auto_1279303 ?auto_1279307 ) ) ( not ( = ?auto_1279303 ?auto_1279308 ) ) ( not ( = ?auto_1279303 ?auto_1279309 ) ) ( not ( = ?auto_1279303 ?auto_1279310 ) ) ( not ( = ?auto_1279303 ?auto_1279311 ) ) ( not ( = ?auto_1279304 ?auto_1279305 ) ) ( not ( = ?auto_1279304 ?auto_1279306 ) ) ( not ( = ?auto_1279304 ?auto_1279307 ) ) ( not ( = ?auto_1279304 ?auto_1279308 ) ) ( not ( = ?auto_1279304 ?auto_1279309 ) ) ( not ( = ?auto_1279304 ?auto_1279310 ) ) ( not ( = ?auto_1279304 ?auto_1279311 ) ) ( not ( = ?auto_1279305 ?auto_1279306 ) ) ( not ( = ?auto_1279305 ?auto_1279307 ) ) ( not ( = ?auto_1279305 ?auto_1279308 ) ) ( not ( = ?auto_1279305 ?auto_1279309 ) ) ( not ( = ?auto_1279305 ?auto_1279310 ) ) ( not ( = ?auto_1279305 ?auto_1279311 ) ) ( not ( = ?auto_1279306 ?auto_1279307 ) ) ( not ( = ?auto_1279306 ?auto_1279308 ) ) ( not ( = ?auto_1279306 ?auto_1279309 ) ) ( not ( = ?auto_1279306 ?auto_1279310 ) ) ( not ( = ?auto_1279306 ?auto_1279311 ) ) ( not ( = ?auto_1279307 ?auto_1279308 ) ) ( not ( = ?auto_1279307 ?auto_1279309 ) ) ( not ( = ?auto_1279307 ?auto_1279310 ) ) ( not ( = ?auto_1279307 ?auto_1279311 ) ) ( not ( = ?auto_1279308 ?auto_1279309 ) ) ( not ( = ?auto_1279308 ?auto_1279310 ) ) ( not ( = ?auto_1279308 ?auto_1279311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279309 ?auto_1279310 ?auto_1279311 )
      ( MAKE-10CRATE-VERIFY ?auto_1279301 ?auto_1279302 ?auto_1279303 ?auto_1279304 ?auto_1279305 ?auto_1279306 ?auto_1279307 ?auto_1279308 ?auto_1279309 ?auto_1279310 ?auto_1279311 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279406 - SURFACE
      ?auto_1279407 - SURFACE
      ?auto_1279408 - SURFACE
      ?auto_1279409 - SURFACE
      ?auto_1279410 - SURFACE
      ?auto_1279411 - SURFACE
      ?auto_1279412 - SURFACE
      ?auto_1279413 - SURFACE
      ?auto_1279414 - SURFACE
      ?auto_1279415 - SURFACE
      ?auto_1279416 - SURFACE
    )
    :vars
    (
      ?auto_1279417 - HOIST
      ?auto_1279418 - PLACE
      ?auto_1279420 - TRUCK
      ?auto_1279419 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279417 ?auto_1279418 ) ( SURFACE-AT ?auto_1279415 ?auto_1279418 ) ( CLEAR ?auto_1279415 ) ( IS-CRATE ?auto_1279416 ) ( not ( = ?auto_1279415 ?auto_1279416 ) ) ( AVAILABLE ?auto_1279417 ) ( IN ?auto_1279416 ?auto_1279420 ) ( ON ?auto_1279415 ?auto_1279414 ) ( not ( = ?auto_1279414 ?auto_1279415 ) ) ( not ( = ?auto_1279414 ?auto_1279416 ) ) ( TRUCK-AT ?auto_1279420 ?auto_1279419 ) ( not ( = ?auto_1279419 ?auto_1279418 ) ) ( ON ?auto_1279407 ?auto_1279406 ) ( ON ?auto_1279408 ?auto_1279407 ) ( ON ?auto_1279409 ?auto_1279408 ) ( ON ?auto_1279410 ?auto_1279409 ) ( ON ?auto_1279411 ?auto_1279410 ) ( ON ?auto_1279412 ?auto_1279411 ) ( ON ?auto_1279413 ?auto_1279412 ) ( ON ?auto_1279414 ?auto_1279413 ) ( not ( = ?auto_1279406 ?auto_1279407 ) ) ( not ( = ?auto_1279406 ?auto_1279408 ) ) ( not ( = ?auto_1279406 ?auto_1279409 ) ) ( not ( = ?auto_1279406 ?auto_1279410 ) ) ( not ( = ?auto_1279406 ?auto_1279411 ) ) ( not ( = ?auto_1279406 ?auto_1279412 ) ) ( not ( = ?auto_1279406 ?auto_1279413 ) ) ( not ( = ?auto_1279406 ?auto_1279414 ) ) ( not ( = ?auto_1279406 ?auto_1279415 ) ) ( not ( = ?auto_1279406 ?auto_1279416 ) ) ( not ( = ?auto_1279407 ?auto_1279408 ) ) ( not ( = ?auto_1279407 ?auto_1279409 ) ) ( not ( = ?auto_1279407 ?auto_1279410 ) ) ( not ( = ?auto_1279407 ?auto_1279411 ) ) ( not ( = ?auto_1279407 ?auto_1279412 ) ) ( not ( = ?auto_1279407 ?auto_1279413 ) ) ( not ( = ?auto_1279407 ?auto_1279414 ) ) ( not ( = ?auto_1279407 ?auto_1279415 ) ) ( not ( = ?auto_1279407 ?auto_1279416 ) ) ( not ( = ?auto_1279408 ?auto_1279409 ) ) ( not ( = ?auto_1279408 ?auto_1279410 ) ) ( not ( = ?auto_1279408 ?auto_1279411 ) ) ( not ( = ?auto_1279408 ?auto_1279412 ) ) ( not ( = ?auto_1279408 ?auto_1279413 ) ) ( not ( = ?auto_1279408 ?auto_1279414 ) ) ( not ( = ?auto_1279408 ?auto_1279415 ) ) ( not ( = ?auto_1279408 ?auto_1279416 ) ) ( not ( = ?auto_1279409 ?auto_1279410 ) ) ( not ( = ?auto_1279409 ?auto_1279411 ) ) ( not ( = ?auto_1279409 ?auto_1279412 ) ) ( not ( = ?auto_1279409 ?auto_1279413 ) ) ( not ( = ?auto_1279409 ?auto_1279414 ) ) ( not ( = ?auto_1279409 ?auto_1279415 ) ) ( not ( = ?auto_1279409 ?auto_1279416 ) ) ( not ( = ?auto_1279410 ?auto_1279411 ) ) ( not ( = ?auto_1279410 ?auto_1279412 ) ) ( not ( = ?auto_1279410 ?auto_1279413 ) ) ( not ( = ?auto_1279410 ?auto_1279414 ) ) ( not ( = ?auto_1279410 ?auto_1279415 ) ) ( not ( = ?auto_1279410 ?auto_1279416 ) ) ( not ( = ?auto_1279411 ?auto_1279412 ) ) ( not ( = ?auto_1279411 ?auto_1279413 ) ) ( not ( = ?auto_1279411 ?auto_1279414 ) ) ( not ( = ?auto_1279411 ?auto_1279415 ) ) ( not ( = ?auto_1279411 ?auto_1279416 ) ) ( not ( = ?auto_1279412 ?auto_1279413 ) ) ( not ( = ?auto_1279412 ?auto_1279414 ) ) ( not ( = ?auto_1279412 ?auto_1279415 ) ) ( not ( = ?auto_1279412 ?auto_1279416 ) ) ( not ( = ?auto_1279413 ?auto_1279414 ) ) ( not ( = ?auto_1279413 ?auto_1279415 ) ) ( not ( = ?auto_1279413 ?auto_1279416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279414 ?auto_1279415 ?auto_1279416 )
      ( MAKE-10CRATE-VERIFY ?auto_1279406 ?auto_1279407 ?auto_1279408 ?auto_1279409 ?auto_1279410 ?auto_1279411 ?auto_1279412 ?auto_1279413 ?auto_1279414 ?auto_1279415 ?auto_1279416 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279521 - SURFACE
      ?auto_1279522 - SURFACE
      ?auto_1279523 - SURFACE
      ?auto_1279524 - SURFACE
      ?auto_1279525 - SURFACE
      ?auto_1279526 - SURFACE
      ?auto_1279527 - SURFACE
      ?auto_1279528 - SURFACE
      ?auto_1279529 - SURFACE
      ?auto_1279530 - SURFACE
      ?auto_1279531 - SURFACE
    )
    :vars
    (
      ?auto_1279535 - HOIST
      ?auto_1279536 - PLACE
      ?auto_1279532 - TRUCK
      ?auto_1279534 - PLACE
      ?auto_1279533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279535 ?auto_1279536 ) ( SURFACE-AT ?auto_1279530 ?auto_1279536 ) ( CLEAR ?auto_1279530 ) ( IS-CRATE ?auto_1279531 ) ( not ( = ?auto_1279530 ?auto_1279531 ) ) ( AVAILABLE ?auto_1279535 ) ( ON ?auto_1279530 ?auto_1279529 ) ( not ( = ?auto_1279529 ?auto_1279530 ) ) ( not ( = ?auto_1279529 ?auto_1279531 ) ) ( TRUCK-AT ?auto_1279532 ?auto_1279534 ) ( not ( = ?auto_1279534 ?auto_1279536 ) ) ( HOIST-AT ?auto_1279533 ?auto_1279534 ) ( LIFTING ?auto_1279533 ?auto_1279531 ) ( not ( = ?auto_1279535 ?auto_1279533 ) ) ( ON ?auto_1279522 ?auto_1279521 ) ( ON ?auto_1279523 ?auto_1279522 ) ( ON ?auto_1279524 ?auto_1279523 ) ( ON ?auto_1279525 ?auto_1279524 ) ( ON ?auto_1279526 ?auto_1279525 ) ( ON ?auto_1279527 ?auto_1279526 ) ( ON ?auto_1279528 ?auto_1279527 ) ( ON ?auto_1279529 ?auto_1279528 ) ( not ( = ?auto_1279521 ?auto_1279522 ) ) ( not ( = ?auto_1279521 ?auto_1279523 ) ) ( not ( = ?auto_1279521 ?auto_1279524 ) ) ( not ( = ?auto_1279521 ?auto_1279525 ) ) ( not ( = ?auto_1279521 ?auto_1279526 ) ) ( not ( = ?auto_1279521 ?auto_1279527 ) ) ( not ( = ?auto_1279521 ?auto_1279528 ) ) ( not ( = ?auto_1279521 ?auto_1279529 ) ) ( not ( = ?auto_1279521 ?auto_1279530 ) ) ( not ( = ?auto_1279521 ?auto_1279531 ) ) ( not ( = ?auto_1279522 ?auto_1279523 ) ) ( not ( = ?auto_1279522 ?auto_1279524 ) ) ( not ( = ?auto_1279522 ?auto_1279525 ) ) ( not ( = ?auto_1279522 ?auto_1279526 ) ) ( not ( = ?auto_1279522 ?auto_1279527 ) ) ( not ( = ?auto_1279522 ?auto_1279528 ) ) ( not ( = ?auto_1279522 ?auto_1279529 ) ) ( not ( = ?auto_1279522 ?auto_1279530 ) ) ( not ( = ?auto_1279522 ?auto_1279531 ) ) ( not ( = ?auto_1279523 ?auto_1279524 ) ) ( not ( = ?auto_1279523 ?auto_1279525 ) ) ( not ( = ?auto_1279523 ?auto_1279526 ) ) ( not ( = ?auto_1279523 ?auto_1279527 ) ) ( not ( = ?auto_1279523 ?auto_1279528 ) ) ( not ( = ?auto_1279523 ?auto_1279529 ) ) ( not ( = ?auto_1279523 ?auto_1279530 ) ) ( not ( = ?auto_1279523 ?auto_1279531 ) ) ( not ( = ?auto_1279524 ?auto_1279525 ) ) ( not ( = ?auto_1279524 ?auto_1279526 ) ) ( not ( = ?auto_1279524 ?auto_1279527 ) ) ( not ( = ?auto_1279524 ?auto_1279528 ) ) ( not ( = ?auto_1279524 ?auto_1279529 ) ) ( not ( = ?auto_1279524 ?auto_1279530 ) ) ( not ( = ?auto_1279524 ?auto_1279531 ) ) ( not ( = ?auto_1279525 ?auto_1279526 ) ) ( not ( = ?auto_1279525 ?auto_1279527 ) ) ( not ( = ?auto_1279525 ?auto_1279528 ) ) ( not ( = ?auto_1279525 ?auto_1279529 ) ) ( not ( = ?auto_1279525 ?auto_1279530 ) ) ( not ( = ?auto_1279525 ?auto_1279531 ) ) ( not ( = ?auto_1279526 ?auto_1279527 ) ) ( not ( = ?auto_1279526 ?auto_1279528 ) ) ( not ( = ?auto_1279526 ?auto_1279529 ) ) ( not ( = ?auto_1279526 ?auto_1279530 ) ) ( not ( = ?auto_1279526 ?auto_1279531 ) ) ( not ( = ?auto_1279527 ?auto_1279528 ) ) ( not ( = ?auto_1279527 ?auto_1279529 ) ) ( not ( = ?auto_1279527 ?auto_1279530 ) ) ( not ( = ?auto_1279527 ?auto_1279531 ) ) ( not ( = ?auto_1279528 ?auto_1279529 ) ) ( not ( = ?auto_1279528 ?auto_1279530 ) ) ( not ( = ?auto_1279528 ?auto_1279531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279529 ?auto_1279530 ?auto_1279531 )
      ( MAKE-10CRATE-VERIFY ?auto_1279521 ?auto_1279522 ?auto_1279523 ?auto_1279524 ?auto_1279525 ?auto_1279526 ?auto_1279527 ?auto_1279528 ?auto_1279529 ?auto_1279530 ?auto_1279531 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279646 - SURFACE
      ?auto_1279647 - SURFACE
      ?auto_1279648 - SURFACE
      ?auto_1279649 - SURFACE
      ?auto_1279650 - SURFACE
      ?auto_1279651 - SURFACE
      ?auto_1279652 - SURFACE
      ?auto_1279653 - SURFACE
      ?auto_1279654 - SURFACE
      ?auto_1279655 - SURFACE
      ?auto_1279656 - SURFACE
    )
    :vars
    (
      ?auto_1279661 - HOIST
      ?auto_1279658 - PLACE
      ?auto_1279660 - TRUCK
      ?auto_1279662 - PLACE
      ?auto_1279659 - HOIST
      ?auto_1279657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279661 ?auto_1279658 ) ( SURFACE-AT ?auto_1279655 ?auto_1279658 ) ( CLEAR ?auto_1279655 ) ( IS-CRATE ?auto_1279656 ) ( not ( = ?auto_1279655 ?auto_1279656 ) ) ( AVAILABLE ?auto_1279661 ) ( ON ?auto_1279655 ?auto_1279654 ) ( not ( = ?auto_1279654 ?auto_1279655 ) ) ( not ( = ?auto_1279654 ?auto_1279656 ) ) ( TRUCK-AT ?auto_1279660 ?auto_1279662 ) ( not ( = ?auto_1279662 ?auto_1279658 ) ) ( HOIST-AT ?auto_1279659 ?auto_1279662 ) ( not ( = ?auto_1279661 ?auto_1279659 ) ) ( AVAILABLE ?auto_1279659 ) ( SURFACE-AT ?auto_1279656 ?auto_1279662 ) ( ON ?auto_1279656 ?auto_1279657 ) ( CLEAR ?auto_1279656 ) ( not ( = ?auto_1279655 ?auto_1279657 ) ) ( not ( = ?auto_1279656 ?auto_1279657 ) ) ( not ( = ?auto_1279654 ?auto_1279657 ) ) ( ON ?auto_1279647 ?auto_1279646 ) ( ON ?auto_1279648 ?auto_1279647 ) ( ON ?auto_1279649 ?auto_1279648 ) ( ON ?auto_1279650 ?auto_1279649 ) ( ON ?auto_1279651 ?auto_1279650 ) ( ON ?auto_1279652 ?auto_1279651 ) ( ON ?auto_1279653 ?auto_1279652 ) ( ON ?auto_1279654 ?auto_1279653 ) ( not ( = ?auto_1279646 ?auto_1279647 ) ) ( not ( = ?auto_1279646 ?auto_1279648 ) ) ( not ( = ?auto_1279646 ?auto_1279649 ) ) ( not ( = ?auto_1279646 ?auto_1279650 ) ) ( not ( = ?auto_1279646 ?auto_1279651 ) ) ( not ( = ?auto_1279646 ?auto_1279652 ) ) ( not ( = ?auto_1279646 ?auto_1279653 ) ) ( not ( = ?auto_1279646 ?auto_1279654 ) ) ( not ( = ?auto_1279646 ?auto_1279655 ) ) ( not ( = ?auto_1279646 ?auto_1279656 ) ) ( not ( = ?auto_1279646 ?auto_1279657 ) ) ( not ( = ?auto_1279647 ?auto_1279648 ) ) ( not ( = ?auto_1279647 ?auto_1279649 ) ) ( not ( = ?auto_1279647 ?auto_1279650 ) ) ( not ( = ?auto_1279647 ?auto_1279651 ) ) ( not ( = ?auto_1279647 ?auto_1279652 ) ) ( not ( = ?auto_1279647 ?auto_1279653 ) ) ( not ( = ?auto_1279647 ?auto_1279654 ) ) ( not ( = ?auto_1279647 ?auto_1279655 ) ) ( not ( = ?auto_1279647 ?auto_1279656 ) ) ( not ( = ?auto_1279647 ?auto_1279657 ) ) ( not ( = ?auto_1279648 ?auto_1279649 ) ) ( not ( = ?auto_1279648 ?auto_1279650 ) ) ( not ( = ?auto_1279648 ?auto_1279651 ) ) ( not ( = ?auto_1279648 ?auto_1279652 ) ) ( not ( = ?auto_1279648 ?auto_1279653 ) ) ( not ( = ?auto_1279648 ?auto_1279654 ) ) ( not ( = ?auto_1279648 ?auto_1279655 ) ) ( not ( = ?auto_1279648 ?auto_1279656 ) ) ( not ( = ?auto_1279648 ?auto_1279657 ) ) ( not ( = ?auto_1279649 ?auto_1279650 ) ) ( not ( = ?auto_1279649 ?auto_1279651 ) ) ( not ( = ?auto_1279649 ?auto_1279652 ) ) ( not ( = ?auto_1279649 ?auto_1279653 ) ) ( not ( = ?auto_1279649 ?auto_1279654 ) ) ( not ( = ?auto_1279649 ?auto_1279655 ) ) ( not ( = ?auto_1279649 ?auto_1279656 ) ) ( not ( = ?auto_1279649 ?auto_1279657 ) ) ( not ( = ?auto_1279650 ?auto_1279651 ) ) ( not ( = ?auto_1279650 ?auto_1279652 ) ) ( not ( = ?auto_1279650 ?auto_1279653 ) ) ( not ( = ?auto_1279650 ?auto_1279654 ) ) ( not ( = ?auto_1279650 ?auto_1279655 ) ) ( not ( = ?auto_1279650 ?auto_1279656 ) ) ( not ( = ?auto_1279650 ?auto_1279657 ) ) ( not ( = ?auto_1279651 ?auto_1279652 ) ) ( not ( = ?auto_1279651 ?auto_1279653 ) ) ( not ( = ?auto_1279651 ?auto_1279654 ) ) ( not ( = ?auto_1279651 ?auto_1279655 ) ) ( not ( = ?auto_1279651 ?auto_1279656 ) ) ( not ( = ?auto_1279651 ?auto_1279657 ) ) ( not ( = ?auto_1279652 ?auto_1279653 ) ) ( not ( = ?auto_1279652 ?auto_1279654 ) ) ( not ( = ?auto_1279652 ?auto_1279655 ) ) ( not ( = ?auto_1279652 ?auto_1279656 ) ) ( not ( = ?auto_1279652 ?auto_1279657 ) ) ( not ( = ?auto_1279653 ?auto_1279654 ) ) ( not ( = ?auto_1279653 ?auto_1279655 ) ) ( not ( = ?auto_1279653 ?auto_1279656 ) ) ( not ( = ?auto_1279653 ?auto_1279657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279654 ?auto_1279655 ?auto_1279656 )
      ( MAKE-10CRATE-VERIFY ?auto_1279646 ?auto_1279647 ?auto_1279648 ?auto_1279649 ?auto_1279650 ?auto_1279651 ?auto_1279652 ?auto_1279653 ?auto_1279654 ?auto_1279655 ?auto_1279656 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279772 - SURFACE
      ?auto_1279773 - SURFACE
      ?auto_1279774 - SURFACE
      ?auto_1279775 - SURFACE
      ?auto_1279776 - SURFACE
      ?auto_1279777 - SURFACE
      ?auto_1279778 - SURFACE
      ?auto_1279779 - SURFACE
      ?auto_1279780 - SURFACE
      ?auto_1279781 - SURFACE
      ?auto_1279782 - SURFACE
    )
    :vars
    (
      ?auto_1279788 - HOIST
      ?auto_1279787 - PLACE
      ?auto_1279786 - PLACE
      ?auto_1279784 - HOIST
      ?auto_1279785 - SURFACE
      ?auto_1279783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279788 ?auto_1279787 ) ( SURFACE-AT ?auto_1279781 ?auto_1279787 ) ( CLEAR ?auto_1279781 ) ( IS-CRATE ?auto_1279782 ) ( not ( = ?auto_1279781 ?auto_1279782 ) ) ( AVAILABLE ?auto_1279788 ) ( ON ?auto_1279781 ?auto_1279780 ) ( not ( = ?auto_1279780 ?auto_1279781 ) ) ( not ( = ?auto_1279780 ?auto_1279782 ) ) ( not ( = ?auto_1279786 ?auto_1279787 ) ) ( HOIST-AT ?auto_1279784 ?auto_1279786 ) ( not ( = ?auto_1279788 ?auto_1279784 ) ) ( AVAILABLE ?auto_1279784 ) ( SURFACE-AT ?auto_1279782 ?auto_1279786 ) ( ON ?auto_1279782 ?auto_1279785 ) ( CLEAR ?auto_1279782 ) ( not ( = ?auto_1279781 ?auto_1279785 ) ) ( not ( = ?auto_1279782 ?auto_1279785 ) ) ( not ( = ?auto_1279780 ?auto_1279785 ) ) ( TRUCK-AT ?auto_1279783 ?auto_1279787 ) ( ON ?auto_1279773 ?auto_1279772 ) ( ON ?auto_1279774 ?auto_1279773 ) ( ON ?auto_1279775 ?auto_1279774 ) ( ON ?auto_1279776 ?auto_1279775 ) ( ON ?auto_1279777 ?auto_1279776 ) ( ON ?auto_1279778 ?auto_1279777 ) ( ON ?auto_1279779 ?auto_1279778 ) ( ON ?auto_1279780 ?auto_1279779 ) ( not ( = ?auto_1279772 ?auto_1279773 ) ) ( not ( = ?auto_1279772 ?auto_1279774 ) ) ( not ( = ?auto_1279772 ?auto_1279775 ) ) ( not ( = ?auto_1279772 ?auto_1279776 ) ) ( not ( = ?auto_1279772 ?auto_1279777 ) ) ( not ( = ?auto_1279772 ?auto_1279778 ) ) ( not ( = ?auto_1279772 ?auto_1279779 ) ) ( not ( = ?auto_1279772 ?auto_1279780 ) ) ( not ( = ?auto_1279772 ?auto_1279781 ) ) ( not ( = ?auto_1279772 ?auto_1279782 ) ) ( not ( = ?auto_1279772 ?auto_1279785 ) ) ( not ( = ?auto_1279773 ?auto_1279774 ) ) ( not ( = ?auto_1279773 ?auto_1279775 ) ) ( not ( = ?auto_1279773 ?auto_1279776 ) ) ( not ( = ?auto_1279773 ?auto_1279777 ) ) ( not ( = ?auto_1279773 ?auto_1279778 ) ) ( not ( = ?auto_1279773 ?auto_1279779 ) ) ( not ( = ?auto_1279773 ?auto_1279780 ) ) ( not ( = ?auto_1279773 ?auto_1279781 ) ) ( not ( = ?auto_1279773 ?auto_1279782 ) ) ( not ( = ?auto_1279773 ?auto_1279785 ) ) ( not ( = ?auto_1279774 ?auto_1279775 ) ) ( not ( = ?auto_1279774 ?auto_1279776 ) ) ( not ( = ?auto_1279774 ?auto_1279777 ) ) ( not ( = ?auto_1279774 ?auto_1279778 ) ) ( not ( = ?auto_1279774 ?auto_1279779 ) ) ( not ( = ?auto_1279774 ?auto_1279780 ) ) ( not ( = ?auto_1279774 ?auto_1279781 ) ) ( not ( = ?auto_1279774 ?auto_1279782 ) ) ( not ( = ?auto_1279774 ?auto_1279785 ) ) ( not ( = ?auto_1279775 ?auto_1279776 ) ) ( not ( = ?auto_1279775 ?auto_1279777 ) ) ( not ( = ?auto_1279775 ?auto_1279778 ) ) ( not ( = ?auto_1279775 ?auto_1279779 ) ) ( not ( = ?auto_1279775 ?auto_1279780 ) ) ( not ( = ?auto_1279775 ?auto_1279781 ) ) ( not ( = ?auto_1279775 ?auto_1279782 ) ) ( not ( = ?auto_1279775 ?auto_1279785 ) ) ( not ( = ?auto_1279776 ?auto_1279777 ) ) ( not ( = ?auto_1279776 ?auto_1279778 ) ) ( not ( = ?auto_1279776 ?auto_1279779 ) ) ( not ( = ?auto_1279776 ?auto_1279780 ) ) ( not ( = ?auto_1279776 ?auto_1279781 ) ) ( not ( = ?auto_1279776 ?auto_1279782 ) ) ( not ( = ?auto_1279776 ?auto_1279785 ) ) ( not ( = ?auto_1279777 ?auto_1279778 ) ) ( not ( = ?auto_1279777 ?auto_1279779 ) ) ( not ( = ?auto_1279777 ?auto_1279780 ) ) ( not ( = ?auto_1279777 ?auto_1279781 ) ) ( not ( = ?auto_1279777 ?auto_1279782 ) ) ( not ( = ?auto_1279777 ?auto_1279785 ) ) ( not ( = ?auto_1279778 ?auto_1279779 ) ) ( not ( = ?auto_1279778 ?auto_1279780 ) ) ( not ( = ?auto_1279778 ?auto_1279781 ) ) ( not ( = ?auto_1279778 ?auto_1279782 ) ) ( not ( = ?auto_1279778 ?auto_1279785 ) ) ( not ( = ?auto_1279779 ?auto_1279780 ) ) ( not ( = ?auto_1279779 ?auto_1279781 ) ) ( not ( = ?auto_1279779 ?auto_1279782 ) ) ( not ( = ?auto_1279779 ?auto_1279785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279780 ?auto_1279781 ?auto_1279782 )
      ( MAKE-10CRATE-VERIFY ?auto_1279772 ?auto_1279773 ?auto_1279774 ?auto_1279775 ?auto_1279776 ?auto_1279777 ?auto_1279778 ?auto_1279779 ?auto_1279780 ?auto_1279781 ?auto_1279782 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279898 - SURFACE
      ?auto_1279899 - SURFACE
      ?auto_1279900 - SURFACE
      ?auto_1279901 - SURFACE
      ?auto_1279902 - SURFACE
      ?auto_1279903 - SURFACE
      ?auto_1279904 - SURFACE
      ?auto_1279905 - SURFACE
      ?auto_1279906 - SURFACE
      ?auto_1279907 - SURFACE
      ?auto_1279908 - SURFACE
    )
    :vars
    (
      ?auto_1279913 - HOIST
      ?auto_1279910 - PLACE
      ?auto_1279912 - PLACE
      ?auto_1279914 - HOIST
      ?auto_1279911 - SURFACE
      ?auto_1279909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279913 ?auto_1279910 ) ( IS-CRATE ?auto_1279908 ) ( not ( = ?auto_1279907 ?auto_1279908 ) ) ( not ( = ?auto_1279906 ?auto_1279907 ) ) ( not ( = ?auto_1279906 ?auto_1279908 ) ) ( not ( = ?auto_1279912 ?auto_1279910 ) ) ( HOIST-AT ?auto_1279914 ?auto_1279912 ) ( not ( = ?auto_1279913 ?auto_1279914 ) ) ( AVAILABLE ?auto_1279914 ) ( SURFACE-AT ?auto_1279908 ?auto_1279912 ) ( ON ?auto_1279908 ?auto_1279911 ) ( CLEAR ?auto_1279908 ) ( not ( = ?auto_1279907 ?auto_1279911 ) ) ( not ( = ?auto_1279908 ?auto_1279911 ) ) ( not ( = ?auto_1279906 ?auto_1279911 ) ) ( TRUCK-AT ?auto_1279909 ?auto_1279910 ) ( SURFACE-AT ?auto_1279906 ?auto_1279910 ) ( CLEAR ?auto_1279906 ) ( LIFTING ?auto_1279913 ?auto_1279907 ) ( IS-CRATE ?auto_1279907 ) ( ON ?auto_1279899 ?auto_1279898 ) ( ON ?auto_1279900 ?auto_1279899 ) ( ON ?auto_1279901 ?auto_1279900 ) ( ON ?auto_1279902 ?auto_1279901 ) ( ON ?auto_1279903 ?auto_1279902 ) ( ON ?auto_1279904 ?auto_1279903 ) ( ON ?auto_1279905 ?auto_1279904 ) ( ON ?auto_1279906 ?auto_1279905 ) ( not ( = ?auto_1279898 ?auto_1279899 ) ) ( not ( = ?auto_1279898 ?auto_1279900 ) ) ( not ( = ?auto_1279898 ?auto_1279901 ) ) ( not ( = ?auto_1279898 ?auto_1279902 ) ) ( not ( = ?auto_1279898 ?auto_1279903 ) ) ( not ( = ?auto_1279898 ?auto_1279904 ) ) ( not ( = ?auto_1279898 ?auto_1279905 ) ) ( not ( = ?auto_1279898 ?auto_1279906 ) ) ( not ( = ?auto_1279898 ?auto_1279907 ) ) ( not ( = ?auto_1279898 ?auto_1279908 ) ) ( not ( = ?auto_1279898 ?auto_1279911 ) ) ( not ( = ?auto_1279899 ?auto_1279900 ) ) ( not ( = ?auto_1279899 ?auto_1279901 ) ) ( not ( = ?auto_1279899 ?auto_1279902 ) ) ( not ( = ?auto_1279899 ?auto_1279903 ) ) ( not ( = ?auto_1279899 ?auto_1279904 ) ) ( not ( = ?auto_1279899 ?auto_1279905 ) ) ( not ( = ?auto_1279899 ?auto_1279906 ) ) ( not ( = ?auto_1279899 ?auto_1279907 ) ) ( not ( = ?auto_1279899 ?auto_1279908 ) ) ( not ( = ?auto_1279899 ?auto_1279911 ) ) ( not ( = ?auto_1279900 ?auto_1279901 ) ) ( not ( = ?auto_1279900 ?auto_1279902 ) ) ( not ( = ?auto_1279900 ?auto_1279903 ) ) ( not ( = ?auto_1279900 ?auto_1279904 ) ) ( not ( = ?auto_1279900 ?auto_1279905 ) ) ( not ( = ?auto_1279900 ?auto_1279906 ) ) ( not ( = ?auto_1279900 ?auto_1279907 ) ) ( not ( = ?auto_1279900 ?auto_1279908 ) ) ( not ( = ?auto_1279900 ?auto_1279911 ) ) ( not ( = ?auto_1279901 ?auto_1279902 ) ) ( not ( = ?auto_1279901 ?auto_1279903 ) ) ( not ( = ?auto_1279901 ?auto_1279904 ) ) ( not ( = ?auto_1279901 ?auto_1279905 ) ) ( not ( = ?auto_1279901 ?auto_1279906 ) ) ( not ( = ?auto_1279901 ?auto_1279907 ) ) ( not ( = ?auto_1279901 ?auto_1279908 ) ) ( not ( = ?auto_1279901 ?auto_1279911 ) ) ( not ( = ?auto_1279902 ?auto_1279903 ) ) ( not ( = ?auto_1279902 ?auto_1279904 ) ) ( not ( = ?auto_1279902 ?auto_1279905 ) ) ( not ( = ?auto_1279902 ?auto_1279906 ) ) ( not ( = ?auto_1279902 ?auto_1279907 ) ) ( not ( = ?auto_1279902 ?auto_1279908 ) ) ( not ( = ?auto_1279902 ?auto_1279911 ) ) ( not ( = ?auto_1279903 ?auto_1279904 ) ) ( not ( = ?auto_1279903 ?auto_1279905 ) ) ( not ( = ?auto_1279903 ?auto_1279906 ) ) ( not ( = ?auto_1279903 ?auto_1279907 ) ) ( not ( = ?auto_1279903 ?auto_1279908 ) ) ( not ( = ?auto_1279903 ?auto_1279911 ) ) ( not ( = ?auto_1279904 ?auto_1279905 ) ) ( not ( = ?auto_1279904 ?auto_1279906 ) ) ( not ( = ?auto_1279904 ?auto_1279907 ) ) ( not ( = ?auto_1279904 ?auto_1279908 ) ) ( not ( = ?auto_1279904 ?auto_1279911 ) ) ( not ( = ?auto_1279905 ?auto_1279906 ) ) ( not ( = ?auto_1279905 ?auto_1279907 ) ) ( not ( = ?auto_1279905 ?auto_1279908 ) ) ( not ( = ?auto_1279905 ?auto_1279911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279906 ?auto_1279907 ?auto_1279908 )
      ( MAKE-10CRATE-VERIFY ?auto_1279898 ?auto_1279899 ?auto_1279900 ?auto_1279901 ?auto_1279902 ?auto_1279903 ?auto_1279904 ?auto_1279905 ?auto_1279906 ?auto_1279907 ?auto_1279908 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1280024 - SURFACE
      ?auto_1280025 - SURFACE
      ?auto_1280026 - SURFACE
      ?auto_1280027 - SURFACE
      ?auto_1280028 - SURFACE
      ?auto_1280029 - SURFACE
      ?auto_1280030 - SURFACE
      ?auto_1280031 - SURFACE
      ?auto_1280032 - SURFACE
      ?auto_1280033 - SURFACE
      ?auto_1280034 - SURFACE
    )
    :vars
    (
      ?auto_1280039 - HOIST
      ?auto_1280035 - PLACE
      ?auto_1280038 - PLACE
      ?auto_1280036 - HOIST
      ?auto_1280037 - SURFACE
      ?auto_1280040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1280039 ?auto_1280035 ) ( IS-CRATE ?auto_1280034 ) ( not ( = ?auto_1280033 ?auto_1280034 ) ) ( not ( = ?auto_1280032 ?auto_1280033 ) ) ( not ( = ?auto_1280032 ?auto_1280034 ) ) ( not ( = ?auto_1280038 ?auto_1280035 ) ) ( HOIST-AT ?auto_1280036 ?auto_1280038 ) ( not ( = ?auto_1280039 ?auto_1280036 ) ) ( AVAILABLE ?auto_1280036 ) ( SURFACE-AT ?auto_1280034 ?auto_1280038 ) ( ON ?auto_1280034 ?auto_1280037 ) ( CLEAR ?auto_1280034 ) ( not ( = ?auto_1280033 ?auto_1280037 ) ) ( not ( = ?auto_1280034 ?auto_1280037 ) ) ( not ( = ?auto_1280032 ?auto_1280037 ) ) ( TRUCK-AT ?auto_1280040 ?auto_1280035 ) ( SURFACE-AT ?auto_1280032 ?auto_1280035 ) ( CLEAR ?auto_1280032 ) ( IS-CRATE ?auto_1280033 ) ( AVAILABLE ?auto_1280039 ) ( IN ?auto_1280033 ?auto_1280040 ) ( ON ?auto_1280025 ?auto_1280024 ) ( ON ?auto_1280026 ?auto_1280025 ) ( ON ?auto_1280027 ?auto_1280026 ) ( ON ?auto_1280028 ?auto_1280027 ) ( ON ?auto_1280029 ?auto_1280028 ) ( ON ?auto_1280030 ?auto_1280029 ) ( ON ?auto_1280031 ?auto_1280030 ) ( ON ?auto_1280032 ?auto_1280031 ) ( not ( = ?auto_1280024 ?auto_1280025 ) ) ( not ( = ?auto_1280024 ?auto_1280026 ) ) ( not ( = ?auto_1280024 ?auto_1280027 ) ) ( not ( = ?auto_1280024 ?auto_1280028 ) ) ( not ( = ?auto_1280024 ?auto_1280029 ) ) ( not ( = ?auto_1280024 ?auto_1280030 ) ) ( not ( = ?auto_1280024 ?auto_1280031 ) ) ( not ( = ?auto_1280024 ?auto_1280032 ) ) ( not ( = ?auto_1280024 ?auto_1280033 ) ) ( not ( = ?auto_1280024 ?auto_1280034 ) ) ( not ( = ?auto_1280024 ?auto_1280037 ) ) ( not ( = ?auto_1280025 ?auto_1280026 ) ) ( not ( = ?auto_1280025 ?auto_1280027 ) ) ( not ( = ?auto_1280025 ?auto_1280028 ) ) ( not ( = ?auto_1280025 ?auto_1280029 ) ) ( not ( = ?auto_1280025 ?auto_1280030 ) ) ( not ( = ?auto_1280025 ?auto_1280031 ) ) ( not ( = ?auto_1280025 ?auto_1280032 ) ) ( not ( = ?auto_1280025 ?auto_1280033 ) ) ( not ( = ?auto_1280025 ?auto_1280034 ) ) ( not ( = ?auto_1280025 ?auto_1280037 ) ) ( not ( = ?auto_1280026 ?auto_1280027 ) ) ( not ( = ?auto_1280026 ?auto_1280028 ) ) ( not ( = ?auto_1280026 ?auto_1280029 ) ) ( not ( = ?auto_1280026 ?auto_1280030 ) ) ( not ( = ?auto_1280026 ?auto_1280031 ) ) ( not ( = ?auto_1280026 ?auto_1280032 ) ) ( not ( = ?auto_1280026 ?auto_1280033 ) ) ( not ( = ?auto_1280026 ?auto_1280034 ) ) ( not ( = ?auto_1280026 ?auto_1280037 ) ) ( not ( = ?auto_1280027 ?auto_1280028 ) ) ( not ( = ?auto_1280027 ?auto_1280029 ) ) ( not ( = ?auto_1280027 ?auto_1280030 ) ) ( not ( = ?auto_1280027 ?auto_1280031 ) ) ( not ( = ?auto_1280027 ?auto_1280032 ) ) ( not ( = ?auto_1280027 ?auto_1280033 ) ) ( not ( = ?auto_1280027 ?auto_1280034 ) ) ( not ( = ?auto_1280027 ?auto_1280037 ) ) ( not ( = ?auto_1280028 ?auto_1280029 ) ) ( not ( = ?auto_1280028 ?auto_1280030 ) ) ( not ( = ?auto_1280028 ?auto_1280031 ) ) ( not ( = ?auto_1280028 ?auto_1280032 ) ) ( not ( = ?auto_1280028 ?auto_1280033 ) ) ( not ( = ?auto_1280028 ?auto_1280034 ) ) ( not ( = ?auto_1280028 ?auto_1280037 ) ) ( not ( = ?auto_1280029 ?auto_1280030 ) ) ( not ( = ?auto_1280029 ?auto_1280031 ) ) ( not ( = ?auto_1280029 ?auto_1280032 ) ) ( not ( = ?auto_1280029 ?auto_1280033 ) ) ( not ( = ?auto_1280029 ?auto_1280034 ) ) ( not ( = ?auto_1280029 ?auto_1280037 ) ) ( not ( = ?auto_1280030 ?auto_1280031 ) ) ( not ( = ?auto_1280030 ?auto_1280032 ) ) ( not ( = ?auto_1280030 ?auto_1280033 ) ) ( not ( = ?auto_1280030 ?auto_1280034 ) ) ( not ( = ?auto_1280030 ?auto_1280037 ) ) ( not ( = ?auto_1280031 ?auto_1280032 ) ) ( not ( = ?auto_1280031 ?auto_1280033 ) ) ( not ( = ?auto_1280031 ?auto_1280034 ) ) ( not ( = ?auto_1280031 ?auto_1280037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1280032 ?auto_1280033 ?auto_1280034 )
      ( MAKE-10CRATE-VERIFY ?auto_1280024 ?auto_1280025 ?auto_1280026 ?auto_1280027 ?auto_1280028 ?auto_1280029 ?auto_1280030 ?auto_1280031 ?auto_1280032 ?auto_1280033 ?auto_1280034 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287308 - SURFACE
      ?auto_1287309 - SURFACE
      ?auto_1287310 - SURFACE
      ?auto_1287311 - SURFACE
      ?auto_1287312 - SURFACE
      ?auto_1287313 - SURFACE
      ?auto_1287314 - SURFACE
      ?auto_1287315 - SURFACE
      ?auto_1287316 - SURFACE
      ?auto_1287317 - SURFACE
      ?auto_1287318 - SURFACE
      ?auto_1287319 - SURFACE
    )
    :vars
    (
      ?auto_1287321 - HOIST
      ?auto_1287320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287321 ?auto_1287320 ) ( SURFACE-AT ?auto_1287318 ?auto_1287320 ) ( CLEAR ?auto_1287318 ) ( LIFTING ?auto_1287321 ?auto_1287319 ) ( IS-CRATE ?auto_1287319 ) ( not ( = ?auto_1287318 ?auto_1287319 ) ) ( ON ?auto_1287309 ?auto_1287308 ) ( ON ?auto_1287310 ?auto_1287309 ) ( ON ?auto_1287311 ?auto_1287310 ) ( ON ?auto_1287312 ?auto_1287311 ) ( ON ?auto_1287313 ?auto_1287312 ) ( ON ?auto_1287314 ?auto_1287313 ) ( ON ?auto_1287315 ?auto_1287314 ) ( ON ?auto_1287316 ?auto_1287315 ) ( ON ?auto_1287317 ?auto_1287316 ) ( ON ?auto_1287318 ?auto_1287317 ) ( not ( = ?auto_1287308 ?auto_1287309 ) ) ( not ( = ?auto_1287308 ?auto_1287310 ) ) ( not ( = ?auto_1287308 ?auto_1287311 ) ) ( not ( = ?auto_1287308 ?auto_1287312 ) ) ( not ( = ?auto_1287308 ?auto_1287313 ) ) ( not ( = ?auto_1287308 ?auto_1287314 ) ) ( not ( = ?auto_1287308 ?auto_1287315 ) ) ( not ( = ?auto_1287308 ?auto_1287316 ) ) ( not ( = ?auto_1287308 ?auto_1287317 ) ) ( not ( = ?auto_1287308 ?auto_1287318 ) ) ( not ( = ?auto_1287308 ?auto_1287319 ) ) ( not ( = ?auto_1287309 ?auto_1287310 ) ) ( not ( = ?auto_1287309 ?auto_1287311 ) ) ( not ( = ?auto_1287309 ?auto_1287312 ) ) ( not ( = ?auto_1287309 ?auto_1287313 ) ) ( not ( = ?auto_1287309 ?auto_1287314 ) ) ( not ( = ?auto_1287309 ?auto_1287315 ) ) ( not ( = ?auto_1287309 ?auto_1287316 ) ) ( not ( = ?auto_1287309 ?auto_1287317 ) ) ( not ( = ?auto_1287309 ?auto_1287318 ) ) ( not ( = ?auto_1287309 ?auto_1287319 ) ) ( not ( = ?auto_1287310 ?auto_1287311 ) ) ( not ( = ?auto_1287310 ?auto_1287312 ) ) ( not ( = ?auto_1287310 ?auto_1287313 ) ) ( not ( = ?auto_1287310 ?auto_1287314 ) ) ( not ( = ?auto_1287310 ?auto_1287315 ) ) ( not ( = ?auto_1287310 ?auto_1287316 ) ) ( not ( = ?auto_1287310 ?auto_1287317 ) ) ( not ( = ?auto_1287310 ?auto_1287318 ) ) ( not ( = ?auto_1287310 ?auto_1287319 ) ) ( not ( = ?auto_1287311 ?auto_1287312 ) ) ( not ( = ?auto_1287311 ?auto_1287313 ) ) ( not ( = ?auto_1287311 ?auto_1287314 ) ) ( not ( = ?auto_1287311 ?auto_1287315 ) ) ( not ( = ?auto_1287311 ?auto_1287316 ) ) ( not ( = ?auto_1287311 ?auto_1287317 ) ) ( not ( = ?auto_1287311 ?auto_1287318 ) ) ( not ( = ?auto_1287311 ?auto_1287319 ) ) ( not ( = ?auto_1287312 ?auto_1287313 ) ) ( not ( = ?auto_1287312 ?auto_1287314 ) ) ( not ( = ?auto_1287312 ?auto_1287315 ) ) ( not ( = ?auto_1287312 ?auto_1287316 ) ) ( not ( = ?auto_1287312 ?auto_1287317 ) ) ( not ( = ?auto_1287312 ?auto_1287318 ) ) ( not ( = ?auto_1287312 ?auto_1287319 ) ) ( not ( = ?auto_1287313 ?auto_1287314 ) ) ( not ( = ?auto_1287313 ?auto_1287315 ) ) ( not ( = ?auto_1287313 ?auto_1287316 ) ) ( not ( = ?auto_1287313 ?auto_1287317 ) ) ( not ( = ?auto_1287313 ?auto_1287318 ) ) ( not ( = ?auto_1287313 ?auto_1287319 ) ) ( not ( = ?auto_1287314 ?auto_1287315 ) ) ( not ( = ?auto_1287314 ?auto_1287316 ) ) ( not ( = ?auto_1287314 ?auto_1287317 ) ) ( not ( = ?auto_1287314 ?auto_1287318 ) ) ( not ( = ?auto_1287314 ?auto_1287319 ) ) ( not ( = ?auto_1287315 ?auto_1287316 ) ) ( not ( = ?auto_1287315 ?auto_1287317 ) ) ( not ( = ?auto_1287315 ?auto_1287318 ) ) ( not ( = ?auto_1287315 ?auto_1287319 ) ) ( not ( = ?auto_1287316 ?auto_1287317 ) ) ( not ( = ?auto_1287316 ?auto_1287318 ) ) ( not ( = ?auto_1287316 ?auto_1287319 ) ) ( not ( = ?auto_1287317 ?auto_1287318 ) ) ( not ( = ?auto_1287317 ?auto_1287319 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1287318 ?auto_1287319 )
      ( MAKE-11CRATE-VERIFY ?auto_1287308 ?auto_1287309 ?auto_1287310 ?auto_1287311 ?auto_1287312 ?auto_1287313 ?auto_1287314 ?auto_1287315 ?auto_1287316 ?auto_1287317 ?auto_1287318 ?auto_1287319 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287417 - SURFACE
      ?auto_1287418 - SURFACE
      ?auto_1287419 - SURFACE
      ?auto_1287420 - SURFACE
      ?auto_1287421 - SURFACE
      ?auto_1287422 - SURFACE
      ?auto_1287423 - SURFACE
      ?auto_1287424 - SURFACE
      ?auto_1287425 - SURFACE
      ?auto_1287426 - SURFACE
      ?auto_1287427 - SURFACE
      ?auto_1287428 - SURFACE
    )
    :vars
    (
      ?auto_1287431 - HOIST
      ?auto_1287430 - PLACE
      ?auto_1287429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287431 ?auto_1287430 ) ( SURFACE-AT ?auto_1287427 ?auto_1287430 ) ( CLEAR ?auto_1287427 ) ( IS-CRATE ?auto_1287428 ) ( not ( = ?auto_1287427 ?auto_1287428 ) ) ( TRUCK-AT ?auto_1287429 ?auto_1287430 ) ( AVAILABLE ?auto_1287431 ) ( IN ?auto_1287428 ?auto_1287429 ) ( ON ?auto_1287427 ?auto_1287426 ) ( not ( = ?auto_1287426 ?auto_1287427 ) ) ( not ( = ?auto_1287426 ?auto_1287428 ) ) ( ON ?auto_1287418 ?auto_1287417 ) ( ON ?auto_1287419 ?auto_1287418 ) ( ON ?auto_1287420 ?auto_1287419 ) ( ON ?auto_1287421 ?auto_1287420 ) ( ON ?auto_1287422 ?auto_1287421 ) ( ON ?auto_1287423 ?auto_1287422 ) ( ON ?auto_1287424 ?auto_1287423 ) ( ON ?auto_1287425 ?auto_1287424 ) ( ON ?auto_1287426 ?auto_1287425 ) ( not ( = ?auto_1287417 ?auto_1287418 ) ) ( not ( = ?auto_1287417 ?auto_1287419 ) ) ( not ( = ?auto_1287417 ?auto_1287420 ) ) ( not ( = ?auto_1287417 ?auto_1287421 ) ) ( not ( = ?auto_1287417 ?auto_1287422 ) ) ( not ( = ?auto_1287417 ?auto_1287423 ) ) ( not ( = ?auto_1287417 ?auto_1287424 ) ) ( not ( = ?auto_1287417 ?auto_1287425 ) ) ( not ( = ?auto_1287417 ?auto_1287426 ) ) ( not ( = ?auto_1287417 ?auto_1287427 ) ) ( not ( = ?auto_1287417 ?auto_1287428 ) ) ( not ( = ?auto_1287418 ?auto_1287419 ) ) ( not ( = ?auto_1287418 ?auto_1287420 ) ) ( not ( = ?auto_1287418 ?auto_1287421 ) ) ( not ( = ?auto_1287418 ?auto_1287422 ) ) ( not ( = ?auto_1287418 ?auto_1287423 ) ) ( not ( = ?auto_1287418 ?auto_1287424 ) ) ( not ( = ?auto_1287418 ?auto_1287425 ) ) ( not ( = ?auto_1287418 ?auto_1287426 ) ) ( not ( = ?auto_1287418 ?auto_1287427 ) ) ( not ( = ?auto_1287418 ?auto_1287428 ) ) ( not ( = ?auto_1287419 ?auto_1287420 ) ) ( not ( = ?auto_1287419 ?auto_1287421 ) ) ( not ( = ?auto_1287419 ?auto_1287422 ) ) ( not ( = ?auto_1287419 ?auto_1287423 ) ) ( not ( = ?auto_1287419 ?auto_1287424 ) ) ( not ( = ?auto_1287419 ?auto_1287425 ) ) ( not ( = ?auto_1287419 ?auto_1287426 ) ) ( not ( = ?auto_1287419 ?auto_1287427 ) ) ( not ( = ?auto_1287419 ?auto_1287428 ) ) ( not ( = ?auto_1287420 ?auto_1287421 ) ) ( not ( = ?auto_1287420 ?auto_1287422 ) ) ( not ( = ?auto_1287420 ?auto_1287423 ) ) ( not ( = ?auto_1287420 ?auto_1287424 ) ) ( not ( = ?auto_1287420 ?auto_1287425 ) ) ( not ( = ?auto_1287420 ?auto_1287426 ) ) ( not ( = ?auto_1287420 ?auto_1287427 ) ) ( not ( = ?auto_1287420 ?auto_1287428 ) ) ( not ( = ?auto_1287421 ?auto_1287422 ) ) ( not ( = ?auto_1287421 ?auto_1287423 ) ) ( not ( = ?auto_1287421 ?auto_1287424 ) ) ( not ( = ?auto_1287421 ?auto_1287425 ) ) ( not ( = ?auto_1287421 ?auto_1287426 ) ) ( not ( = ?auto_1287421 ?auto_1287427 ) ) ( not ( = ?auto_1287421 ?auto_1287428 ) ) ( not ( = ?auto_1287422 ?auto_1287423 ) ) ( not ( = ?auto_1287422 ?auto_1287424 ) ) ( not ( = ?auto_1287422 ?auto_1287425 ) ) ( not ( = ?auto_1287422 ?auto_1287426 ) ) ( not ( = ?auto_1287422 ?auto_1287427 ) ) ( not ( = ?auto_1287422 ?auto_1287428 ) ) ( not ( = ?auto_1287423 ?auto_1287424 ) ) ( not ( = ?auto_1287423 ?auto_1287425 ) ) ( not ( = ?auto_1287423 ?auto_1287426 ) ) ( not ( = ?auto_1287423 ?auto_1287427 ) ) ( not ( = ?auto_1287423 ?auto_1287428 ) ) ( not ( = ?auto_1287424 ?auto_1287425 ) ) ( not ( = ?auto_1287424 ?auto_1287426 ) ) ( not ( = ?auto_1287424 ?auto_1287427 ) ) ( not ( = ?auto_1287424 ?auto_1287428 ) ) ( not ( = ?auto_1287425 ?auto_1287426 ) ) ( not ( = ?auto_1287425 ?auto_1287427 ) ) ( not ( = ?auto_1287425 ?auto_1287428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287426 ?auto_1287427 ?auto_1287428 )
      ( MAKE-11CRATE-VERIFY ?auto_1287417 ?auto_1287418 ?auto_1287419 ?auto_1287420 ?auto_1287421 ?auto_1287422 ?auto_1287423 ?auto_1287424 ?auto_1287425 ?auto_1287426 ?auto_1287427 ?auto_1287428 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287538 - SURFACE
      ?auto_1287539 - SURFACE
      ?auto_1287540 - SURFACE
      ?auto_1287541 - SURFACE
      ?auto_1287542 - SURFACE
      ?auto_1287543 - SURFACE
      ?auto_1287544 - SURFACE
      ?auto_1287545 - SURFACE
      ?auto_1287546 - SURFACE
      ?auto_1287547 - SURFACE
      ?auto_1287548 - SURFACE
      ?auto_1287549 - SURFACE
    )
    :vars
    (
      ?auto_1287551 - HOIST
      ?auto_1287553 - PLACE
      ?auto_1287550 - TRUCK
      ?auto_1287552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287551 ?auto_1287553 ) ( SURFACE-AT ?auto_1287548 ?auto_1287553 ) ( CLEAR ?auto_1287548 ) ( IS-CRATE ?auto_1287549 ) ( not ( = ?auto_1287548 ?auto_1287549 ) ) ( AVAILABLE ?auto_1287551 ) ( IN ?auto_1287549 ?auto_1287550 ) ( ON ?auto_1287548 ?auto_1287547 ) ( not ( = ?auto_1287547 ?auto_1287548 ) ) ( not ( = ?auto_1287547 ?auto_1287549 ) ) ( TRUCK-AT ?auto_1287550 ?auto_1287552 ) ( not ( = ?auto_1287552 ?auto_1287553 ) ) ( ON ?auto_1287539 ?auto_1287538 ) ( ON ?auto_1287540 ?auto_1287539 ) ( ON ?auto_1287541 ?auto_1287540 ) ( ON ?auto_1287542 ?auto_1287541 ) ( ON ?auto_1287543 ?auto_1287542 ) ( ON ?auto_1287544 ?auto_1287543 ) ( ON ?auto_1287545 ?auto_1287544 ) ( ON ?auto_1287546 ?auto_1287545 ) ( ON ?auto_1287547 ?auto_1287546 ) ( not ( = ?auto_1287538 ?auto_1287539 ) ) ( not ( = ?auto_1287538 ?auto_1287540 ) ) ( not ( = ?auto_1287538 ?auto_1287541 ) ) ( not ( = ?auto_1287538 ?auto_1287542 ) ) ( not ( = ?auto_1287538 ?auto_1287543 ) ) ( not ( = ?auto_1287538 ?auto_1287544 ) ) ( not ( = ?auto_1287538 ?auto_1287545 ) ) ( not ( = ?auto_1287538 ?auto_1287546 ) ) ( not ( = ?auto_1287538 ?auto_1287547 ) ) ( not ( = ?auto_1287538 ?auto_1287548 ) ) ( not ( = ?auto_1287538 ?auto_1287549 ) ) ( not ( = ?auto_1287539 ?auto_1287540 ) ) ( not ( = ?auto_1287539 ?auto_1287541 ) ) ( not ( = ?auto_1287539 ?auto_1287542 ) ) ( not ( = ?auto_1287539 ?auto_1287543 ) ) ( not ( = ?auto_1287539 ?auto_1287544 ) ) ( not ( = ?auto_1287539 ?auto_1287545 ) ) ( not ( = ?auto_1287539 ?auto_1287546 ) ) ( not ( = ?auto_1287539 ?auto_1287547 ) ) ( not ( = ?auto_1287539 ?auto_1287548 ) ) ( not ( = ?auto_1287539 ?auto_1287549 ) ) ( not ( = ?auto_1287540 ?auto_1287541 ) ) ( not ( = ?auto_1287540 ?auto_1287542 ) ) ( not ( = ?auto_1287540 ?auto_1287543 ) ) ( not ( = ?auto_1287540 ?auto_1287544 ) ) ( not ( = ?auto_1287540 ?auto_1287545 ) ) ( not ( = ?auto_1287540 ?auto_1287546 ) ) ( not ( = ?auto_1287540 ?auto_1287547 ) ) ( not ( = ?auto_1287540 ?auto_1287548 ) ) ( not ( = ?auto_1287540 ?auto_1287549 ) ) ( not ( = ?auto_1287541 ?auto_1287542 ) ) ( not ( = ?auto_1287541 ?auto_1287543 ) ) ( not ( = ?auto_1287541 ?auto_1287544 ) ) ( not ( = ?auto_1287541 ?auto_1287545 ) ) ( not ( = ?auto_1287541 ?auto_1287546 ) ) ( not ( = ?auto_1287541 ?auto_1287547 ) ) ( not ( = ?auto_1287541 ?auto_1287548 ) ) ( not ( = ?auto_1287541 ?auto_1287549 ) ) ( not ( = ?auto_1287542 ?auto_1287543 ) ) ( not ( = ?auto_1287542 ?auto_1287544 ) ) ( not ( = ?auto_1287542 ?auto_1287545 ) ) ( not ( = ?auto_1287542 ?auto_1287546 ) ) ( not ( = ?auto_1287542 ?auto_1287547 ) ) ( not ( = ?auto_1287542 ?auto_1287548 ) ) ( not ( = ?auto_1287542 ?auto_1287549 ) ) ( not ( = ?auto_1287543 ?auto_1287544 ) ) ( not ( = ?auto_1287543 ?auto_1287545 ) ) ( not ( = ?auto_1287543 ?auto_1287546 ) ) ( not ( = ?auto_1287543 ?auto_1287547 ) ) ( not ( = ?auto_1287543 ?auto_1287548 ) ) ( not ( = ?auto_1287543 ?auto_1287549 ) ) ( not ( = ?auto_1287544 ?auto_1287545 ) ) ( not ( = ?auto_1287544 ?auto_1287546 ) ) ( not ( = ?auto_1287544 ?auto_1287547 ) ) ( not ( = ?auto_1287544 ?auto_1287548 ) ) ( not ( = ?auto_1287544 ?auto_1287549 ) ) ( not ( = ?auto_1287545 ?auto_1287546 ) ) ( not ( = ?auto_1287545 ?auto_1287547 ) ) ( not ( = ?auto_1287545 ?auto_1287548 ) ) ( not ( = ?auto_1287545 ?auto_1287549 ) ) ( not ( = ?auto_1287546 ?auto_1287547 ) ) ( not ( = ?auto_1287546 ?auto_1287548 ) ) ( not ( = ?auto_1287546 ?auto_1287549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287547 ?auto_1287548 ?auto_1287549 )
      ( MAKE-11CRATE-VERIFY ?auto_1287538 ?auto_1287539 ?auto_1287540 ?auto_1287541 ?auto_1287542 ?auto_1287543 ?auto_1287544 ?auto_1287545 ?auto_1287546 ?auto_1287547 ?auto_1287548 ?auto_1287549 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287670 - SURFACE
      ?auto_1287671 - SURFACE
      ?auto_1287672 - SURFACE
      ?auto_1287673 - SURFACE
      ?auto_1287674 - SURFACE
      ?auto_1287675 - SURFACE
      ?auto_1287676 - SURFACE
      ?auto_1287677 - SURFACE
      ?auto_1287678 - SURFACE
      ?auto_1287679 - SURFACE
      ?auto_1287680 - SURFACE
      ?auto_1287681 - SURFACE
    )
    :vars
    (
      ?auto_1287685 - HOIST
      ?auto_1287683 - PLACE
      ?auto_1287686 - TRUCK
      ?auto_1287682 - PLACE
      ?auto_1287684 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287685 ?auto_1287683 ) ( SURFACE-AT ?auto_1287680 ?auto_1287683 ) ( CLEAR ?auto_1287680 ) ( IS-CRATE ?auto_1287681 ) ( not ( = ?auto_1287680 ?auto_1287681 ) ) ( AVAILABLE ?auto_1287685 ) ( ON ?auto_1287680 ?auto_1287679 ) ( not ( = ?auto_1287679 ?auto_1287680 ) ) ( not ( = ?auto_1287679 ?auto_1287681 ) ) ( TRUCK-AT ?auto_1287686 ?auto_1287682 ) ( not ( = ?auto_1287682 ?auto_1287683 ) ) ( HOIST-AT ?auto_1287684 ?auto_1287682 ) ( LIFTING ?auto_1287684 ?auto_1287681 ) ( not ( = ?auto_1287685 ?auto_1287684 ) ) ( ON ?auto_1287671 ?auto_1287670 ) ( ON ?auto_1287672 ?auto_1287671 ) ( ON ?auto_1287673 ?auto_1287672 ) ( ON ?auto_1287674 ?auto_1287673 ) ( ON ?auto_1287675 ?auto_1287674 ) ( ON ?auto_1287676 ?auto_1287675 ) ( ON ?auto_1287677 ?auto_1287676 ) ( ON ?auto_1287678 ?auto_1287677 ) ( ON ?auto_1287679 ?auto_1287678 ) ( not ( = ?auto_1287670 ?auto_1287671 ) ) ( not ( = ?auto_1287670 ?auto_1287672 ) ) ( not ( = ?auto_1287670 ?auto_1287673 ) ) ( not ( = ?auto_1287670 ?auto_1287674 ) ) ( not ( = ?auto_1287670 ?auto_1287675 ) ) ( not ( = ?auto_1287670 ?auto_1287676 ) ) ( not ( = ?auto_1287670 ?auto_1287677 ) ) ( not ( = ?auto_1287670 ?auto_1287678 ) ) ( not ( = ?auto_1287670 ?auto_1287679 ) ) ( not ( = ?auto_1287670 ?auto_1287680 ) ) ( not ( = ?auto_1287670 ?auto_1287681 ) ) ( not ( = ?auto_1287671 ?auto_1287672 ) ) ( not ( = ?auto_1287671 ?auto_1287673 ) ) ( not ( = ?auto_1287671 ?auto_1287674 ) ) ( not ( = ?auto_1287671 ?auto_1287675 ) ) ( not ( = ?auto_1287671 ?auto_1287676 ) ) ( not ( = ?auto_1287671 ?auto_1287677 ) ) ( not ( = ?auto_1287671 ?auto_1287678 ) ) ( not ( = ?auto_1287671 ?auto_1287679 ) ) ( not ( = ?auto_1287671 ?auto_1287680 ) ) ( not ( = ?auto_1287671 ?auto_1287681 ) ) ( not ( = ?auto_1287672 ?auto_1287673 ) ) ( not ( = ?auto_1287672 ?auto_1287674 ) ) ( not ( = ?auto_1287672 ?auto_1287675 ) ) ( not ( = ?auto_1287672 ?auto_1287676 ) ) ( not ( = ?auto_1287672 ?auto_1287677 ) ) ( not ( = ?auto_1287672 ?auto_1287678 ) ) ( not ( = ?auto_1287672 ?auto_1287679 ) ) ( not ( = ?auto_1287672 ?auto_1287680 ) ) ( not ( = ?auto_1287672 ?auto_1287681 ) ) ( not ( = ?auto_1287673 ?auto_1287674 ) ) ( not ( = ?auto_1287673 ?auto_1287675 ) ) ( not ( = ?auto_1287673 ?auto_1287676 ) ) ( not ( = ?auto_1287673 ?auto_1287677 ) ) ( not ( = ?auto_1287673 ?auto_1287678 ) ) ( not ( = ?auto_1287673 ?auto_1287679 ) ) ( not ( = ?auto_1287673 ?auto_1287680 ) ) ( not ( = ?auto_1287673 ?auto_1287681 ) ) ( not ( = ?auto_1287674 ?auto_1287675 ) ) ( not ( = ?auto_1287674 ?auto_1287676 ) ) ( not ( = ?auto_1287674 ?auto_1287677 ) ) ( not ( = ?auto_1287674 ?auto_1287678 ) ) ( not ( = ?auto_1287674 ?auto_1287679 ) ) ( not ( = ?auto_1287674 ?auto_1287680 ) ) ( not ( = ?auto_1287674 ?auto_1287681 ) ) ( not ( = ?auto_1287675 ?auto_1287676 ) ) ( not ( = ?auto_1287675 ?auto_1287677 ) ) ( not ( = ?auto_1287675 ?auto_1287678 ) ) ( not ( = ?auto_1287675 ?auto_1287679 ) ) ( not ( = ?auto_1287675 ?auto_1287680 ) ) ( not ( = ?auto_1287675 ?auto_1287681 ) ) ( not ( = ?auto_1287676 ?auto_1287677 ) ) ( not ( = ?auto_1287676 ?auto_1287678 ) ) ( not ( = ?auto_1287676 ?auto_1287679 ) ) ( not ( = ?auto_1287676 ?auto_1287680 ) ) ( not ( = ?auto_1287676 ?auto_1287681 ) ) ( not ( = ?auto_1287677 ?auto_1287678 ) ) ( not ( = ?auto_1287677 ?auto_1287679 ) ) ( not ( = ?auto_1287677 ?auto_1287680 ) ) ( not ( = ?auto_1287677 ?auto_1287681 ) ) ( not ( = ?auto_1287678 ?auto_1287679 ) ) ( not ( = ?auto_1287678 ?auto_1287680 ) ) ( not ( = ?auto_1287678 ?auto_1287681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287679 ?auto_1287680 ?auto_1287681 )
      ( MAKE-11CRATE-VERIFY ?auto_1287670 ?auto_1287671 ?auto_1287672 ?auto_1287673 ?auto_1287674 ?auto_1287675 ?auto_1287676 ?auto_1287677 ?auto_1287678 ?auto_1287679 ?auto_1287680 ?auto_1287681 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287813 - SURFACE
      ?auto_1287814 - SURFACE
      ?auto_1287815 - SURFACE
      ?auto_1287816 - SURFACE
      ?auto_1287817 - SURFACE
      ?auto_1287818 - SURFACE
      ?auto_1287819 - SURFACE
      ?auto_1287820 - SURFACE
      ?auto_1287821 - SURFACE
      ?auto_1287822 - SURFACE
      ?auto_1287823 - SURFACE
      ?auto_1287824 - SURFACE
    )
    :vars
    (
      ?auto_1287827 - HOIST
      ?auto_1287829 - PLACE
      ?auto_1287826 - TRUCK
      ?auto_1287828 - PLACE
      ?auto_1287830 - HOIST
      ?auto_1287825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287827 ?auto_1287829 ) ( SURFACE-AT ?auto_1287823 ?auto_1287829 ) ( CLEAR ?auto_1287823 ) ( IS-CRATE ?auto_1287824 ) ( not ( = ?auto_1287823 ?auto_1287824 ) ) ( AVAILABLE ?auto_1287827 ) ( ON ?auto_1287823 ?auto_1287822 ) ( not ( = ?auto_1287822 ?auto_1287823 ) ) ( not ( = ?auto_1287822 ?auto_1287824 ) ) ( TRUCK-AT ?auto_1287826 ?auto_1287828 ) ( not ( = ?auto_1287828 ?auto_1287829 ) ) ( HOIST-AT ?auto_1287830 ?auto_1287828 ) ( not ( = ?auto_1287827 ?auto_1287830 ) ) ( AVAILABLE ?auto_1287830 ) ( SURFACE-AT ?auto_1287824 ?auto_1287828 ) ( ON ?auto_1287824 ?auto_1287825 ) ( CLEAR ?auto_1287824 ) ( not ( = ?auto_1287823 ?auto_1287825 ) ) ( not ( = ?auto_1287824 ?auto_1287825 ) ) ( not ( = ?auto_1287822 ?auto_1287825 ) ) ( ON ?auto_1287814 ?auto_1287813 ) ( ON ?auto_1287815 ?auto_1287814 ) ( ON ?auto_1287816 ?auto_1287815 ) ( ON ?auto_1287817 ?auto_1287816 ) ( ON ?auto_1287818 ?auto_1287817 ) ( ON ?auto_1287819 ?auto_1287818 ) ( ON ?auto_1287820 ?auto_1287819 ) ( ON ?auto_1287821 ?auto_1287820 ) ( ON ?auto_1287822 ?auto_1287821 ) ( not ( = ?auto_1287813 ?auto_1287814 ) ) ( not ( = ?auto_1287813 ?auto_1287815 ) ) ( not ( = ?auto_1287813 ?auto_1287816 ) ) ( not ( = ?auto_1287813 ?auto_1287817 ) ) ( not ( = ?auto_1287813 ?auto_1287818 ) ) ( not ( = ?auto_1287813 ?auto_1287819 ) ) ( not ( = ?auto_1287813 ?auto_1287820 ) ) ( not ( = ?auto_1287813 ?auto_1287821 ) ) ( not ( = ?auto_1287813 ?auto_1287822 ) ) ( not ( = ?auto_1287813 ?auto_1287823 ) ) ( not ( = ?auto_1287813 ?auto_1287824 ) ) ( not ( = ?auto_1287813 ?auto_1287825 ) ) ( not ( = ?auto_1287814 ?auto_1287815 ) ) ( not ( = ?auto_1287814 ?auto_1287816 ) ) ( not ( = ?auto_1287814 ?auto_1287817 ) ) ( not ( = ?auto_1287814 ?auto_1287818 ) ) ( not ( = ?auto_1287814 ?auto_1287819 ) ) ( not ( = ?auto_1287814 ?auto_1287820 ) ) ( not ( = ?auto_1287814 ?auto_1287821 ) ) ( not ( = ?auto_1287814 ?auto_1287822 ) ) ( not ( = ?auto_1287814 ?auto_1287823 ) ) ( not ( = ?auto_1287814 ?auto_1287824 ) ) ( not ( = ?auto_1287814 ?auto_1287825 ) ) ( not ( = ?auto_1287815 ?auto_1287816 ) ) ( not ( = ?auto_1287815 ?auto_1287817 ) ) ( not ( = ?auto_1287815 ?auto_1287818 ) ) ( not ( = ?auto_1287815 ?auto_1287819 ) ) ( not ( = ?auto_1287815 ?auto_1287820 ) ) ( not ( = ?auto_1287815 ?auto_1287821 ) ) ( not ( = ?auto_1287815 ?auto_1287822 ) ) ( not ( = ?auto_1287815 ?auto_1287823 ) ) ( not ( = ?auto_1287815 ?auto_1287824 ) ) ( not ( = ?auto_1287815 ?auto_1287825 ) ) ( not ( = ?auto_1287816 ?auto_1287817 ) ) ( not ( = ?auto_1287816 ?auto_1287818 ) ) ( not ( = ?auto_1287816 ?auto_1287819 ) ) ( not ( = ?auto_1287816 ?auto_1287820 ) ) ( not ( = ?auto_1287816 ?auto_1287821 ) ) ( not ( = ?auto_1287816 ?auto_1287822 ) ) ( not ( = ?auto_1287816 ?auto_1287823 ) ) ( not ( = ?auto_1287816 ?auto_1287824 ) ) ( not ( = ?auto_1287816 ?auto_1287825 ) ) ( not ( = ?auto_1287817 ?auto_1287818 ) ) ( not ( = ?auto_1287817 ?auto_1287819 ) ) ( not ( = ?auto_1287817 ?auto_1287820 ) ) ( not ( = ?auto_1287817 ?auto_1287821 ) ) ( not ( = ?auto_1287817 ?auto_1287822 ) ) ( not ( = ?auto_1287817 ?auto_1287823 ) ) ( not ( = ?auto_1287817 ?auto_1287824 ) ) ( not ( = ?auto_1287817 ?auto_1287825 ) ) ( not ( = ?auto_1287818 ?auto_1287819 ) ) ( not ( = ?auto_1287818 ?auto_1287820 ) ) ( not ( = ?auto_1287818 ?auto_1287821 ) ) ( not ( = ?auto_1287818 ?auto_1287822 ) ) ( not ( = ?auto_1287818 ?auto_1287823 ) ) ( not ( = ?auto_1287818 ?auto_1287824 ) ) ( not ( = ?auto_1287818 ?auto_1287825 ) ) ( not ( = ?auto_1287819 ?auto_1287820 ) ) ( not ( = ?auto_1287819 ?auto_1287821 ) ) ( not ( = ?auto_1287819 ?auto_1287822 ) ) ( not ( = ?auto_1287819 ?auto_1287823 ) ) ( not ( = ?auto_1287819 ?auto_1287824 ) ) ( not ( = ?auto_1287819 ?auto_1287825 ) ) ( not ( = ?auto_1287820 ?auto_1287821 ) ) ( not ( = ?auto_1287820 ?auto_1287822 ) ) ( not ( = ?auto_1287820 ?auto_1287823 ) ) ( not ( = ?auto_1287820 ?auto_1287824 ) ) ( not ( = ?auto_1287820 ?auto_1287825 ) ) ( not ( = ?auto_1287821 ?auto_1287822 ) ) ( not ( = ?auto_1287821 ?auto_1287823 ) ) ( not ( = ?auto_1287821 ?auto_1287824 ) ) ( not ( = ?auto_1287821 ?auto_1287825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287822 ?auto_1287823 ?auto_1287824 )
      ( MAKE-11CRATE-VERIFY ?auto_1287813 ?auto_1287814 ?auto_1287815 ?auto_1287816 ?auto_1287817 ?auto_1287818 ?auto_1287819 ?auto_1287820 ?auto_1287821 ?auto_1287822 ?auto_1287823 ?auto_1287824 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287957 - SURFACE
      ?auto_1287958 - SURFACE
      ?auto_1287959 - SURFACE
      ?auto_1287960 - SURFACE
      ?auto_1287961 - SURFACE
      ?auto_1287962 - SURFACE
      ?auto_1287963 - SURFACE
      ?auto_1287964 - SURFACE
      ?auto_1287965 - SURFACE
      ?auto_1287966 - SURFACE
      ?auto_1287967 - SURFACE
      ?auto_1287968 - SURFACE
    )
    :vars
    (
      ?auto_1287970 - HOIST
      ?auto_1287974 - PLACE
      ?auto_1287971 - PLACE
      ?auto_1287972 - HOIST
      ?auto_1287969 - SURFACE
      ?auto_1287973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287970 ?auto_1287974 ) ( SURFACE-AT ?auto_1287967 ?auto_1287974 ) ( CLEAR ?auto_1287967 ) ( IS-CRATE ?auto_1287968 ) ( not ( = ?auto_1287967 ?auto_1287968 ) ) ( AVAILABLE ?auto_1287970 ) ( ON ?auto_1287967 ?auto_1287966 ) ( not ( = ?auto_1287966 ?auto_1287967 ) ) ( not ( = ?auto_1287966 ?auto_1287968 ) ) ( not ( = ?auto_1287971 ?auto_1287974 ) ) ( HOIST-AT ?auto_1287972 ?auto_1287971 ) ( not ( = ?auto_1287970 ?auto_1287972 ) ) ( AVAILABLE ?auto_1287972 ) ( SURFACE-AT ?auto_1287968 ?auto_1287971 ) ( ON ?auto_1287968 ?auto_1287969 ) ( CLEAR ?auto_1287968 ) ( not ( = ?auto_1287967 ?auto_1287969 ) ) ( not ( = ?auto_1287968 ?auto_1287969 ) ) ( not ( = ?auto_1287966 ?auto_1287969 ) ) ( TRUCK-AT ?auto_1287973 ?auto_1287974 ) ( ON ?auto_1287958 ?auto_1287957 ) ( ON ?auto_1287959 ?auto_1287958 ) ( ON ?auto_1287960 ?auto_1287959 ) ( ON ?auto_1287961 ?auto_1287960 ) ( ON ?auto_1287962 ?auto_1287961 ) ( ON ?auto_1287963 ?auto_1287962 ) ( ON ?auto_1287964 ?auto_1287963 ) ( ON ?auto_1287965 ?auto_1287964 ) ( ON ?auto_1287966 ?auto_1287965 ) ( not ( = ?auto_1287957 ?auto_1287958 ) ) ( not ( = ?auto_1287957 ?auto_1287959 ) ) ( not ( = ?auto_1287957 ?auto_1287960 ) ) ( not ( = ?auto_1287957 ?auto_1287961 ) ) ( not ( = ?auto_1287957 ?auto_1287962 ) ) ( not ( = ?auto_1287957 ?auto_1287963 ) ) ( not ( = ?auto_1287957 ?auto_1287964 ) ) ( not ( = ?auto_1287957 ?auto_1287965 ) ) ( not ( = ?auto_1287957 ?auto_1287966 ) ) ( not ( = ?auto_1287957 ?auto_1287967 ) ) ( not ( = ?auto_1287957 ?auto_1287968 ) ) ( not ( = ?auto_1287957 ?auto_1287969 ) ) ( not ( = ?auto_1287958 ?auto_1287959 ) ) ( not ( = ?auto_1287958 ?auto_1287960 ) ) ( not ( = ?auto_1287958 ?auto_1287961 ) ) ( not ( = ?auto_1287958 ?auto_1287962 ) ) ( not ( = ?auto_1287958 ?auto_1287963 ) ) ( not ( = ?auto_1287958 ?auto_1287964 ) ) ( not ( = ?auto_1287958 ?auto_1287965 ) ) ( not ( = ?auto_1287958 ?auto_1287966 ) ) ( not ( = ?auto_1287958 ?auto_1287967 ) ) ( not ( = ?auto_1287958 ?auto_1287968 ) ) ( not ( = ?auto_1287958 ?auto_1287969 ) ) ( not ( = ?auto_1287959 ?auto_1287960 ) ) ( not ( = ?auto_1287959 ?auto_1287961 ) ) ( not ( = ?auto_1287959 ?auto_1287962 ) ) ( not ( = ?auto_1287959 ?auto_1287963 ) ) ( not ( = ?auto_1287959 ?auto_1287964 ) ) ( not ( = ?auto_1287959 ?auto_1287965 ) ) ( not ( = ?auto_1287959 ?auto_1287966 ) ) ( not ( = ?auto_1287959 ?auto_1287967 ) ) ( not ( = ?auto_1287959 ?auto_1287968 ) ) ( not ( = ?auto_1287959 ?auto_1287969 ) ) ( not ( = ?auto_1287960 ?auto_1287961 ) ) ( not ( = ?auto_1287960 ?auto_1287962 ) ) ( not ( = ?auto_1287960 ?auto_1287963 ) ) ( not ( = ?auto_1287960 ?auto_1287964 ) ) ( not ( = ?auto_1287960 ?auto_1287965 ) ) ( not ( = ?auto_1287960 ?auto_1287966 ) ) ( not ( = ?auto_1287960 ?auto_1287967 ) ) ( not ( = ?auto_1287960 ?auto_1287968 ) ) ( not ( = ?auto_1287960 ?auto_1287969 ) ) ( not ( = ?auto_1287961 ?auto_1287962 ) ) ( not ( = ?auto_1287961 ?auto_1287963 ) ) ( not ( = ?auto_1287961 ?auto_1287964 ) ) ( not ( = ?auto_1287961 ?auto_1287965 ) ) ( not ( = ?auto_1287961 ?auto_1287966 ) ) ( not ( = ?auto_1287961 ?auto_1287967 ) ) ( not ( = ?auto_1287961 ?auto_1287968 ) ) ( not ( = ?auto_1287961 ?auto_1287969 ) ) ( not ( = ?auto_1287962 ?auto_1287963 ) ) ( not ( = ?auto_1287962 ?auto_1287964 ) ) ( not ( = ?auto_1287962 ?auto_1287965 ) ) ( not ( = ?auto_1287962 ?auto_1287966 ) ) ( not ( = ?auto_1287962 ?auto_1287967 ) ) ( not ( = ?auto_1287962 ?auto_1287968 ) ) ( not ( = ?auto_1287962 ?auto_1287969 ) ) ( not ( = ?auto_1287963 ?auto_1287964 ) ) ( not ( = ?auto_1287963 ?auto_1287965 ) ) ( not ( = ?auto_1287963 ?auto_1287966 ) ) ( not ( = ?auto_1287963 ?auto_1287967 ) ) ( not ( = ?auto_1287963 ?auto_1287968 ) ) ( not ( = ?auto_1287963 ?auto_1287969 ) ) ( not ( = ?auto_1287964 ?auto_1287965 ) ) ( not ( = ?auto_1287964 ?auto_1287966 ) ) ( not ( = ?auto_1287964 ?auto_1287967 ) ) ( not ( = ?auto_1287964 ?auto_1287968 ) ) ( not ( = ?auto_1287964 ?auto_1287969 ) ) ( not ( = ?auto_1287965 ?auto_1287966 ) ) ( not ( = ?auto_1287965 ?auto_1287967 ) ) ( not ( = ?auto_1287965 ?auto_1287968 ) ) ( not ( = ?auto_1287965 ?auto_1287969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287966 ?auto_1287967 ?auto_1287968 )
      ( MAKE-11CRATE-VERIFY ?auto_1287957 ?auto_1287958 ?auto_1287959 ?auto_1287960 ?auto_1287961 ?auto_1287962 ?auto_1287963 ?auto_1287964 ?auto_1287965 ?auto_1287966 ?auto_1287967 ?auto_1287968 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1288101 - SURFACE
      ?auto_1288102 - SURFACE
      ?auto_1288103 - SURFACE
      ?auto_1288104 - SURFACE
      ?auto_1288105 - SURFACE
      ?auto_1288106 - SURFACE
      ?auto_1288107 - SURFACE
      ?auto_1288108 - SURFACE
      ?auto_1288109 - SURFACE
      ?auto_1288110 - SURFACE
      ?auto_1288111 - SURFACE
      ?auto_1288112 - SURFACE
    )
    :vars
    (
      ?auto_1288115 - HOIST
      ?auto_1288113 - PLACE
      ?auto_1288114 - PLACE
      ?auto_1288117 - HOIST
      ?auto_1288116 - SURFACE
      ?auto_1288118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1288115 ?auto_1288113 ) ( IS-CRATE ?auto_1288112 ) ( not ( = ?auto_1288111 ?auto_1288112 ) ) ( not ( = ?auto_1288110 ?auto_1288111 ) ) ( not ( = ?auto_1288110 ?auto_1288112 ) ) ( not ( = ?auto_1288114 ?auto_1288113 ) ) ( HOIST-AT ?auto_1288117 ?auto_1288114 ) ( not ( = ?auto_1288115 ?auto_1288117 ) ) ( AVAILABLE ?auto_1288117 ) ( SURFACE-AT ?auto_1288112 ?auto_1288114 ) ( ON ?auto_1288112 ?auto_1288116 ) ( CLEAR ?auto_1288112 ) ( not ( = ?auto_1288111 ?auto_1288116 ) ) ( not ( = ?auto_1288112 ?auto_1288116 ) ) ( not ( = ?auto_1288110 ?auto_1288116 ) ) ( TRUCK-AT ?auto_1288118 ?auto_1288113 ) ( SURFACE-AT ?auto_1288110 ?auto_1288113 ) ( CLEAR ?auto_1288110 ) ( LIFTING ?auto_1288115 ?auto_1288111 ) ( IS-CRATE ?auto_1288111 ) ( ON ?auto_1288102 ?auto_1288101 ) ( ON ?auto_1288103 ?auto_1288102 ) ( ON ?auto_1288104 ?auto_1288103 ) ( ON ?auto_1288105 ?auto_1288104 ) ( ON ?auto_1288106 ?auto_1288105 ) ( ON ?auto_1288107 ?auto_1288106 ) ( ON ?auto_1288108 ?auto_1288107 ) ( ON ?auto_1288109 ?auto_1288108 ) ( ON ?auto_1288110 ?auto_1288109 ) ( not ( = ?auto_1288101 ?auto_1288102 ) ) ( not ( = ?auto_1288101 ?auto_1288103 ) ) ( not ( = ?auto_1288101 ?auto_1288104 ) ) ( not ( = ?auto_1288101 ?auto_1288105 ) ) ( not ( = ?auto_1288101 ?auto_1288106 ) ) ( not ( = ?auto_1288101 ?auto_1288107 ) ) ( not ( = ?auto_1288101 ?auto_1288108 ) ) ( not ( = ?auto_1288101 ?auto_1288109 ) ) ( not ( = ?auto_1288101 ?auto_1288110 ) ) ( not ( = ?auto_1288101 ?auto_1288111 ) ) ( not ( = ?auto_1288101 ?auto_1288112 ) ) ( not ( = ?auto_1288101 ?auto_1288116 ) ) ( not ( = ?auto_1288102 ?auto_1288103 ) ) ( not ( = ?auto_1288102 ?auto_1288104 ) ) ( not ( = ?auto_1288102 ?auto_1288105 ) ) ( not ( = ?auto_1288102 ?auto_1288106 ) ) ( not ( = ?auto_1288102 ?auto_1288107 ) ) ( not ( = ?auto_1288102 ?auto_1288108 ) ) ( not ( = ?auto_1288102 ?auto_1288109 ) ) ( not ( = ?auto_1288102 ?auto_1288110 ) ) ( not ( = ?auto_1288102 ?auto_1288111 ) ) ( not ( = ?auto_1288102 ?auto_1288112 ) ) ( not ( = ?auto_1288102 ?auto_1288116 ) ) ( not ( = ?auto_1288103 ?auto_1288104 ) ) ( not ( = ?auto_1288103 ?auto_1288105 ) ) ( not ( = ?auto_1288103 ?auto_1288106 ) ) ( not ( = ?auto_1288103 ?auto_1288107 ) ) ( not ( = ?auto_1288103 ?auto_1288108 ) ) ( not ( = ?auto_1288103 ?auto_1288109 ) ) ( not ( = ?auto_1288103 ?auto_1288110 ) ) ( not ( = ?auto_1288103 ?auto_1288111 ) ) ( not ( = ?auto_1288103 ?auto_1288112 ) ) ( not ( = ?auto_1288103 ?auto_1288116 ) ) ( not ( = ?auto_1288104 ?auto_1288105 ) ) ( not ( = ?auto_1288104 ?auto_1288106 ) ) ( not ( = ?auto_1288104 ?auto_1288107 ) ) ( not ( = ?auto_1288104 ?auto_1288108 ) ) ( not ( = ?auto_1288104 ?auto_1288109 ) ) ( not ( = ?auto_1288104 ?auto_1288110 ) ) ( not ( = ?auto_1288104 ?auto_1288111 ) ) ( not ( = ?auto_1288104 ?auto_1288112 ) ) ( not ( = ?auto_1288104 ?auto_1288116 ) ) ( not ( = ?auto_1288105 ?auto_1288106 ) ) ( not ( = ?auto_1288105 ?auto_1288107 ) ) ( not ( = ?auto_1288105 ?auto_1288108 ) ) ( not ( = ?auto_1288105 ?auto_1288109 ) ) ( not ( = ?auto_1288105 ?auto_1288110 ) ) ( not ( = ?auto_1288105 ?auto_1288111 ) ) ( not ( = ?auto_1288105 ?auto_1288112 ) ) ( not ( = ?auto_1288105 ?auto_1288116 ) ) ( not ( = ?auto_1288106 ?auto_1288107 ) ) ( not ( = ?auto_1288106 ?auto_1288108 ) ) ( not ( = ?auto_1288106 ?auto_1288109 ) ) ( not ( = ?auto_1288106 ?auto_1288110 ) ) ( not ( = ?auto_1288106 ?auto_1288111 ) ) ( not ( = ?auto_1288106 ?auto_1288112 ) ) ( not ( = ?auto_1288106 ?auto_1288116 ) ) ( not ( = ?auto_1288107 ?auto_1288108 ) ) ( not ( = ?auto_1288107 ?auto_1288109 ) ) ( not ( = ?auto_1288107 ?auto_1288110 ) ) ( not ( = ?auto_1288107 ?auto_1288111 ) ) ( not ( = ?auto_1288107 ?auto_1288112 ) ) ( not ( = ?auto_1288107 ?auto_1288116 ) ) ( not ( = ?auto_1288108 ?auto_1288109 ) ) ( not ( = ?auto_1288108 ?auto_1288110 ) ) ( not ( = ?auto_1288108 ?auto_1288111 ) ) ( not ( = ?auto_1288108 ?auto_1288112 ) ) ( not ( = ?auto_1288108 ?auto_1288116 ) ) ( not ( = ?auto_1288109 ?auto_1288110 ) ) ( not ( = ?auto_1288109 ?auto_1288111 ) ) ( not ( = ?auto_1288109 ?auto_1288112 ) ) ( not ( = ?auto_1288109 ?auto_1288116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1288110 ?auto_1288111 ?auto_1288112 )
      ( MAKE-11CRATE-VERIFY ?auto_1288101 ?auto_1288102 ?auto_1288103 ?auto_1288104 ?auto_1288105 ?auto_1288106 ?auto_1288107 ?auto_1288108 ?auto_1288109 ?auto_1288110 ?auto_1288111 ?auto_1288112 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1288245 - SURFACE
      ?auto_1288246 - SURFACE
      ?auto_1288247 - SURFACE
      ?auto_1288248 - SURFACE
      ?auto_1288249 - SURFACE
      ?auto_1288250 - SURFACE
      ?auto_1288251 - SURFACE
      ?auto_1288252 - SURFACE
      ?auto_1288253 - SURFACE
      ?auto_1288254 - SURFACE
      ?auto_1288255 - SURFACE
      ?auto_1288256 - SURFACE
    )
    :vars
    (
      ?auto_1288262 - HOIST
      ?auto_1288259 - PLACE
      ?auto_1288258 - PLACE
      ?auto_1288260 - HOIST
      ?auto_1288261 - SURFACE
      ?auto_1288257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1288262 ?auto_1288259 ) ( IS-CRATE ?auto_1288256 ) ( not ( = ?auto_1288255 ?auto_1288256 ) ) ( not ( = ?auto_1288254 ?auto_1288255 ) ) ( not ( = ?auto_1288254 ?auto_1288256 ) ) ( not ( = ?auto_1288258 ?auto_1288259 ) ) ( HOIST-AT ?auto_1288260 ?auto_1288258 ) ( not ( = ?auto_1288262 ?auto_1288260 ) ) ( AVAILABLE ?auto_1288260 ) ( SURFACE-AT ?auto_1288256 ?auto_1288258 ) ( ON ?auto_1288256 ?auto_1288261 ) ( CLEAR ?auto_1288256 ) ( not ( = ?auto_1288255 ?auto_1288261 ) ) ( not ( = ?auto_1288256 ?auto_1288261 ) ) ( not ( = ?auto_1288254 ?auto_1288261 ) ) ( TRUCK-AT ?auto_1288257 ?auto_1288259 ) ( SURFACE-AT ?auto_1288254 ?auto_1288259 ) ( CLEAR ?auto_1288254 ) ( IS-CRATE ?auto_1288255 ) ( AVAILABLE ?auto_1288262 ) ( IN ?auto_1288255 ?auto_1288257 ) ( ON ?auto_1288246 ?auto_1288245 ) ( ON ?auto_1288247 ?auto_1288246 ) ( ON ?auto_1288248 ?auto_1288247 ) ( ON ?auto_1288249 ?auto_1288248 ) ( ON ?auto_1288250 ?auto_1288249 ) ( ON ?auto_1288251 ?auto_1288250 ) ( ON ?auto_1288252 ?auto_1288251 ) ( ON ?auto_1288253 ?auto_1288252 ) ( ON ?auto_1288254 ?auto_1288253 ) ( not ( = ?auto_1288245 ?auto_1288246 ) ) ( not ( = ?auto_1288245 ?auto_1288247 ) ) ( not ( = ?auto_1288245 ?auto_1288248 ) ) ( not ( = ?auto_1288245 ?auto_1288249 ) ) ( not ( = ?auto_1288245 ?auto_1288250 ) ) ( not ( = ?auto_1288245 ?auto_1288251 ) ) ( not ( = ?auto_1288245 ?auto_1288252 ) ) ( not ( = ?auto_1288245 ?auto_1288253 ) ) ( not ( = ?auto_1288245 ?auto_1288254 ) ) ( not ( = ?auto_1288245 ?auto_1288255 ) ) ( not ( = ?auto_1288245 ?auto_1288256 ) ) ( not ( = ?auto_1288245 ?auto_1288261 ) ) ( not ( = ?auto_1288246 ?auto_1288247 ) ) ( not ( = ?auto_1288246 ?auto_1288248 ) ) ( not ( = ?auto_1288246 ?auto_1288249 ) ) ( not ( = ?auto_1288246 ?auto_1288250 ) ) ( not ( = ?auto_1288246 ?auto_1288251 ) ) ( not ( = ?auto_1288246 ?auto_1288252 ) ) ( not ( = ?auto_1288246 ?auto_1288253 ) ) ( not ( = ?auto_1288246 ?auto_1288254 ) ) ( not ( = ?auto_1288246 ?auto_1288255 ) ) ( not ( = ?auto_1288246 ?auto_1288256 ) ) ( not ( = ?auto_1288246 ?auto_1288261 ) ) ( not ( = ?auto_1288247 ?auto_1288248 ) ) ( not ( = ?auto_1288247 ?auto_1288249 ) ) ( not ( = ?auto_1288247 ?auto_1288250 ) ) ( not ( = ?auto_1288247 ?auto_1288251 ) ) ( not ( = ?auto_1288247 ?auto_1288252 ) ) ( not ( = ?auto_1288247 ?auto_1288253 ) ) ( not ( = ?auto_1288247 ?auto_1288254 ) ) ( not ( = ?auto_1288247 ?auto_1288255 ) ) ( not ( = ?auto_1288247 ?auto_1288256 ) ) ( not ( = ?auto_1288247 ?auto_1288261 ) ) ( not ( = ?auto_1288248 ?auto_1288249 ) ) ( not ( = ?auto_1288248 ?auto_1288250 ) ) ( not ( = ?auto_1288248 ?auto_1288251 ) ) ( not ( = ?auto_1288248 ?auto_1288252 ) ) ( not ( = ?auto_1288248 ?auto_1288253 ) ) ( not ( = ?auto_1288248 ?auto_1288254 ) ) ( not ( = ?auto_1288248 ?auto_1288255 ) ) ( not ( = ?auto_1288248 ?auto_1288256 ) ) ( not ( = ?auto_1288248 ?auto_1288261 ) ) ( not ( = ?auto_1288249 ?auto_1288250 ) ) ( not ( = ?auto_1288249 ?auto_1288251 ) ) ( not ( = ?auto_1288249 ?auto_1288252 ) ) ( not ( = ?auto_1288249 ?auto_1288253 ) ) ( not ( = ?auto_1288249 ?auto_1288254 ) ) ( not ( = ?auto_1288249 ?auto_1288255 ) ) ( not ( = ?auto_1288249 ?auto_1288256 ) ) ( not ( = ?auto_1288249 ?auto_1288261 ) ) ( not ( = ?auto_1288250 ?auto_1288251 ) ) ( not ( = ?auto_1288250 ?auto_1288252 ) ) ( not ( = ?auto_1288250 ?auto_1288253 ) ) ( not ( = ?auto_1288250 ?auto_1288254 ) ) ( not ( = ?auto_1288250 ?auto_1288255 ) ) ( not ( = ?auto_1288250 ?auto_1288256 ) ) ( not ( = ?auto_1288250 ?auto_1288261 ) ) ( not ( = ?auto_1288251 ?auto_1288252 ) ) ( not ( = ?auto_1288251 ?auto_1288253 ) ) ( not ( = ?auto_1288251 ?auto_1288254 ) ) ( not ( = ?auto_1288251 ?auto_1288255 ) ) ( not ( = ?auto_1288251 ?auto_1288256 ) ) ( not ( = ?auto_1288251 ?auto_1288261 ) ) ( not ( = ?auto_1288252 ?auto_1288253 ) ) ( not ( = ?auto_1288252 ?auto_1288254 ) ) ( not ( = ?auto_1288252 ?auto_1288255 ) ) ( not ( = ?auto_1288252 ?auto_1288256 ) ) ( not ( = ?auto_1288252 ?auto_1288261 ) ) ( not ( = ?auto_1288253 ?auto_1288254 ) ) ( not ( = ?auto_1288253 ?auto_1288255 ) ) ( not ( = ?auto_1288253 ?auto_1288256 ) ) ( not ( = ?auto_1288253 ?auto_1288261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1288254 ?auto_1288255 ?auto_1288256 )
      ( MAKE-11CRATE-VERIFY ?auto_1288245 ?auto_1288246 ?auto_1288247 ?auto_1288248 ?auto_1288249 ?auto_1288250 ?auto_1288251 ?auto_1288252 ?auto_1288253 ?auto_1288254 ?auto_1288255 ?auto_1288256 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297536 - SURFACE
      ?auto_1297537 - SURFACE
      ?auto_1297538 - SURFACE
      ?auto_1297539 - SURFACE
      ?auto_1297540 - SURFACE
      ?auto_1297541 - SURFACE
      ?auto_1297542 - SURFACE
      ?auto_1297543 - SURFACE
      ?auto_1297544 - SURFACE
      ?auto_1297545 - SURFACE
      ?auto_1297546 - SURFACE
      ?auto_1297547 - SURFACE
      ?auto_1297548 - SURFACE
    )
    :vars
    (
      ?auto_1297550 - HOIST
      ?auto_1297549 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297550 ?auto_1297549 ) ( SURFACE-AT ?auto_1297547 ?auto_1297549 ) ( CLEAR ?auto_1297547 ) ( LIFTING ?auto_1297550 ?auto_1297548 ) ( IS-CRATE ?auto_1297548 ) ( not ( = ?auto_1297547 ?auto_1297548 ) ) ( ON ?auto_1297537 ?auto_1297536 ) ( ON ?auto_1297538 ?auto_1297537 ) ( ON ?auto_1297539 ?auto_1297538 ) ( ON ?auto_1297540 ?auto_1297539 ) ( ON ?auto_1297541 ?auto_1297540 ) ( ON ?auto_1297542 ?auto_1297541 ) ( ON ?auto_1297543 ?auto_1297542 ) ( ON ?auto_1297544 ?auto_1297543 ) ( ON ?auto_1297545 ?auto_1297544 ) ( ON ?auto_1297546 ?auto_1297545 ) ( ON ?auto_1297547 ?auto_1297546 ) ( not ( = ?auto_1297536 ?auto_1297537 ) ) ( not ( = ?auto_1297536 ?auto_1297538 ) ) ( not ( = ?auto_1297536 ?auto_1297539 ) ) ( not ( = ?auto_1297536 ?auto_1297540 ) ) ( not ( = ?auto_1297536 ?auto_1297541 ) ) ( not ( = ?auto_1297536 ?auto_1297542 ) ) ( not ( = ?auto_1297536 ?auto_1297543 ) ) ( not ( = ?auto_1297536 ?auto_1297544 ) ) ( not ( = ?auto_1297536 ?auto_1297545 ) ) ( not ( = ?auto_1297536 ?auto_1297546 ) ) ( not ( = ?auto_1297536 ?auto_1297547 ) ) ( not ( = ?auto_1297536 ?auto_1297548 ) ) ( not ( = ?auto_1297537 ?auto_1297538 ) ) ( not ( = ?auto_1297537 ?auto_1297539 ) ) ( not ( = ?auto_1297537 ?auto_1297540 ) ) ( not ( = ?auto_1297537 ?auto_1297541 ) ) ( not ( = ?auto_1297537 ?auto_1297542 ) ) ( not ( = ?auto_1297537 ?auto_1297543 ) ) ( not ( = ?auto_1297537 ?auto_1297544 ) ) ( not ( = ?auto_1297537 ?auto_1297545 ) ) ( not ( = ?auto_1297537 ?auto_1297546 ) ) ( not ( = ?auto_1297537 ?auto_1297547 ) ) ( not ( = ?auto_1297537 ?auto_1297548 ) ) ( not ( = ?auto_1297538 ?auto_1297539 ) ) ( not ( = ?auto_1297538 ?auto_1297540 ) ) ( not ( = ?auto_1297538 ?auto_1297541 ) ) ( not ( = ?auto_1297538 ?auto_1297542 ) ) ( not ( = ?auto_1297538 ?auto_1297543 ) ) ( not ( = ?auto_1297538 ?auto_1297544 ) ) ( not ( = ?auto_1297538 ?auto_1297545 ) ) ( not ( = ?auto_1297538 ?auto_1297546 ) ) ( not ( = ?auto_1297538 ?auto_1297547 ) ) ( not ( = ?auto_1297538 ?auto_1297548 ) ) ( not ( = ?auto_1297539 ?auto_1297540 ) ) ( not ( = ?auto_1297539 ?auto_1297541 ) ) ( not ( = ?auto_1297539 ?auto_1297542 ) ) ( not ( = ?auto_1297539 ?auto_1297543 ) ) ( not ( = ?auto_1297539 ?auto_1297544 ) ) ( not ( = ?auto_1297539 ?auto_1297545 ) ) ( not ( = ?auto_1297539 ?auto_1297546 ) ) ( not ( = ?auto_1297539 ?auto_1297547 ) ) ( not ( = ?auto_1297539 ?auto_1297548 ) ) ( not ( = ?auto_1297540 ?auto_1297541 ) ) ( not ( = ?auto_1297540 ?auto_1297542 ) ) ( not ( = ?auto_1297540 ?auto_1297543 ) ) ( not ( = ?auto_1297540 ?auto_1297544 ) ) ( not ( = ?auto_1297540 ?auto_1297545 ) ) ( not ( = ?auto_1297540 ?auto_1297546 ) ) ( not ( = ?auto_1297540 ?auto_1297547 ) ) ( not ( = ?auto_1297540 ?auto_1297548 ) ) ( not ( = ?auto_1297541 ?auto_1297542 ) ) ( not ( = ?auto_1297541 ?auto_1297543 ) ) ( not ( = ?auto_1297541 ?auto_1297544 ) ) ( not ( = ?auto_1297541 ?auto_1297545 ) ) ( not ( = ?auto_1297541 ?auto_1297546 ) ) ( not ( = ?auto_1297541 ?auto_1297547 ) ) ( not ( = ?auto_1297541 ?auto_1297548 ) ) ( not ( = ?auto_1297542 ?auto_1297543 ) ) ( not ( = ?auto_1297542 ?auto_1297544 ) ) ( not ( = ?auto_1297542 ?auto_1297545 ) ) ( not ( = ?auto_1297542 ?auto_1297546 ) ) ( not ( = ?auto_1297542 ?auto_1297547 ) ) ( not ( = ?auto_1297542 ?auto_1297548 ) ) ( not ( = ?auto_1297543 ?auto_1297544 ) ) ( not ( = ?auto_1297543 ?auto_1297545 ) ) ( not ( = ?auto_1297543 ?auto_1297546 ) ) ( not ( = ?auto_1297543 ?auto_1297547 ) ) ( not ( = ?auto_1297543 ?auto_1297548 ) ) ( not ( = ?auto_1297544 ?auto_1297545 ) ) ( not ( = ?auto_1297544 ?auto_1297546 ) ) ( not ( = ?auto_1297544 ?auto_1297547 ) ) ( not ( = ?auto_1297544 ?auto_1297548 ) ) ( not ( = ?auto_1297545 ?auto_1297546 ) ) ( not ( = ?auto_1297545 ?auto_1297547 ) ) ( not ( = ?auto_1297545 ?auto_1297548 ) ) ( not ( = ?auto_1297546 ?auto_1297547 ) ) ( not ( = ?auto_1297546 ?auto_1297548 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1297547 ?auto_1297548 )
      ( MAKE-12CRATE-VERIFY ?auto_1297536 ?auto_1297537 ?auto_1297538 ?auto_1297539 ?auto_1297540 ?auto_1297541 ?auto_1297542 ?auto_1297543 ?auto_1297544 ?auto_1297545 ?auto_1297546 ?auto_1297547 ?auto_1297548 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297661 - SURFACE
      ?auto_1297662 - SURFACE
      ?auto_1297663 - SURFACE
      ?auto_1297664 - SURFACE
      ?auto_1297665 - SURFACE
      ?auto_1297666 - SURFACE
      ?auto_1297667 - SURFACE
      ?auto_1297668 - SURFACE
      ?auto_1297669 - SURFACE
      ?auto_1297670 - SURFACE
      ?auto_1297671 - SURFACE
      ?auto_1297672 - SURFACE
      ?auto_1297673 - SURFACE
    )
    :vars
    (
      ?auto_1297676 - HOIST
      ?auto_1297674 - PLACE
      ?auto_1297675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297676 ?auto_1297674 ) ( SURFACE-AT ?auto_1297672 ?auto_1297674 ) ( CLEAR ?auto_1297672 ) ( IS-CRATE ?auto_1297673 ) ( not ( = ?auto_1297672 ?auto_1297673 ) ) ( TRUCK-AT ?auto_1297675 ?auto_1297674 ) ( AVAILABLE ?auto_1297676 ) ( IN ?auto_1297673 ?auto_1297675 ) ( ON ?auto_1297672 ?auto_1297671 ) ( not ( = ?auto_1297671 ?auto_1297672 ) ) ( not ( = ?auto_1297671 ?auto_1297673 ) ) ( ON ?auto_1297662 ?auto_1297661 ) ( ON ?auto_1297663 ?auto_1297662 ) ( ON ?auto_1297664 ?auto_1297663 ) ( ON ?auto_1297665 ?auto_1297664 ) ( ON ?auto_1297666 ?auto_1297665 ) ( ON ?auto_1297667 ?auto_1297666 ) ( ON ?auto_1297668 ?auto_1297667 ) ( ON ?auto_1297669 ?auto_1297668 ) ( ON ?auto_1297670 ?auto_1297669 ) ( ON ?auto_1297671 ?auto_1297670 ) ( not ( = ?auto_1297661 ?auto_1297662 ) ) ( not ( = ?auto_1297661 ?auto_1297663 ) ) ( not ( = ?auto_1297661 ?auto_1297664 ) ) ( not ( = ?auto_1297661 ?auto_1297665 ) ) ( not ( = ?auto_1297661 ?auto_1297666 ) ) ( not ( = ?auto_1297661 ?auto_1297667 ) ) ( not ( = ?auto_1297661 ?auto_1297668 ) ) ( not ( = ?auto_1297661 ?auto_1297669 ) ) ( not ( = ?auto_1297661 ?auto_1297670 ) ) ( not ( = ?auto_1297661 ?auto_1297671 ) ) ( not ( = ?auto_1297661 ?auto_1297672 ) ) ( not ( = ?auto_1297661 ?auto_1297673 ) ) ( not ( = ?auto_1297662 ?auto_1297663 ) ) ( not ( = ?auto_1297662 ?auto_1297664 ) ) ( not ( = ?auto_1297662 ?auto_1297665 ) ) ( not ( = ?auto_1297662 ?auto_1297666 ) ) ( not ( = ?auto_1297662 ?auto_1297667 ) ) ( not ( = ?auto_1297662 ?auto_1297668 ) ) ( not ( = ?auto_1297662 ?auto_1297669 ) ) ( not ( = ?auto_1297662 ?auto_1297670 ) ) ( not ( = ?auto_1297662 ?auto_1297671 ) ) ( not ( = ?auto_1297662 ?auto_1297672 ) ) ( not ( = ?auto_1297662 ?auto_1297673 ) ) ( not ( = ?auto_1297663 ?auto_1297664 ) ) ( not ( = ?auto_1297663 ?auto_1297665 ) ) ( not ( = ?auto_1297663 ?auto_1297666 ) ) ( not ( = ?auto_1297663 ?auto_1297667 ) ) ( not ( = ?auto_1297663 ?auto_1297668 ) ) ( not ( = ?auto_1297663 ?auto_1297669 ) ) ( not ( = ?auto_1297663 ?auto_1297670 ) ) ( not ( = ?auto_1297663 ?auto_1297671 ) ) ( not ( = ?auto_1297663 ?auto_1297672 ) ) ( not ( = ?auto_1297663 ?auto_1297673 ) ) ( not ( = ?auto_1297664 ?auto_1297665 ) ) ( not ( = ?auto_1297664 ?auto_1297666 ) ) ( not ( = ?auto_1297664 ?auto_1297667 ) ) ( not ( = ?auto_1297664 ?auto_1297668 ) ) ( not ( = ?auto_1297664 ?auto_1297669 ) ) ( not ( = ?auto_1297664 ?auto_1297670 ) ) ( not ( = ?auto_1297664 ?auto_1297671 ) ) ( not ( = ?auto_1297664 ?auto_1297672 ) ) ( not ( = ?auto_1297664 ?auto_1297673 ) ) ( not ( = ?auto_1297665 ?auto_1297666 ) ) ( not ( = ?auto_1297665 ?auto_1297667 ) ) ( not ( = ?auto_1297665 ?auto_1297668 ) ) ( not ( = ?auto_1297665 ?auto_1297669 ) ) ( not ( = ?auto_1297665 ?auto_1297670 ) ) ( not ( = ?auto_1297665 ?auto_1297671 ) ) ( not ( = ?auto_1297665 ?auto_1297672 ) ) ( not ( = ?auto_1297665 ?auto_1297673 ) ) ( not ( = ?auto_1297666 ?auto_1297667 ) ) ( not ( = ?auto_1297666 ?auto_1297668 ) ) ( not ( = ?auto_1297666 ?auto_1297669 ) ) ( not ( = ?auto_1297666 ?auto_1297670 ) ) ( not ( = ?auto_1297666 ?auto_1297671 ) ) ( not ( = ?auto_1297666 ?auto_1297672 ) ) ( not ( = ?auto_1297666 ?auto_1297673 ) ) ( not ( = ?auto_1297667 ?auto_1297668 ) ) ( not ( = ?auto_1297667 ?auto_1297669 ) ) ( not ( = ?auto_1297667 ?auto_1297670 ) ) ( not ( = ?auto_1297667 ?auto_1297671 ) ) ( not ( = ?auto_1297667 ?auto_1297672 ) ) ( not ( = ?auto_1297667 ?auto_1297673 ) ) ( not ( = ?auto_1297668 ?auto_1297669 ) ) ( not ( = ?auto_1297668 ?auto_1297670 ) ) ( not ( = ?auto_1297668 ?auto_1297671 ) ) ( not ( = ?auto_1297668 ?auto_1297672 ) ) ( not ( = ?auto_1297668 ?auto_1297673 ) ) ( not ( = ?auto_1297669 ?auto_1297670 ) ) ( not ( = ?auto_1297669 ?auto_1297671 ) ) ( not ( = ?auto_1297669 ?auto_1297672 ) ) ( not ( = ?auto_1297669 ?auto_1297673 ) ) ( not ( = ?auto_1297670 ?auto_1297671 ) ) ( not ( = ?auto_1297670 ?auto_1297672 ) ) ( not ( = ?auto_1297670 ?auto_1297673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297671 ?auto_1297672 ?auto_1297673 )
      ( MAKE-12CRATE-VERIFY ?auto_1297661 ?auto_1297662 ?auto_1297663 ?auto_1297664 ?auto_1297665 ?auto_1297666 ?auto_1297667 ?auto_1297668 ?auto_1297669 ?auto_1297670 ?auto_1297671 ?auto_1297672 ?auto_1297673 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297799 - SURFACE
      ?auto_1297800 - SURFACE
      ?auto_1297801 - SURFACE
      ?auto_1297802 - SURFACE
      ?auto_1297803 - SURFACE
      ?auto_1297804 - SURFACE
      ?auto_1297805 - SURFACE
      ?auto_1297806 - SURFACE
      ?auto_1297807 - SURFACE
      ?auto_1297808 - SURFACE
      ?auto_1297809 - SURFACE
      ?auto_1297810 - SURFACE
      ?auto_1297811 - SURFACE
    )
    :vars
    (
      ?auto_1297813 - HOIST
      ?auto_1297814 - PLACE
      ?auto_1297815 - TRUCK
      ?auto_1297812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297813 ?auto_1297814 ) ( SURFACE-AT ?auto_1297810 ?auto_1297814 ) ( CLEAR ?auto_1297810 ) ( IS-CRATE ?auto_1297811 ) ( not ( = ?auto_1297810 ?auto_1297811 ) ) ( AVAILABLE ?auto_1297813 ) ( IN ?auto_1297811 ?auto_1297815 ) ( ON ?auto_1297810 ?auto_1297809 ) ( not ( = ?auto_1297809 ?auto_1297810 ) ) ( not ( = ?auto_1297809 ?auto_1297811 ) ) ( TRUCK-AT ?auto_1297815 ?auto_1297812 ) ( not ( = ?auto_1297812 ?auto_1297814 ) ) ( ON ?auto_1297800 ?auto_1297799 ) ( ON ?auto_1297801 ?auto_1297800 ) ( ON ?auto_1297802 ?auto_1297801 ) ( ON ?auto_1297803 ?auto_1297802 ) ( ON ?auto_1297804 ?auto_1297803 ) ( ON ?auto_1297805 ?auto_1297804 ) ( ON ?auto_1297806 ?auto_1297805 ) ( ON ?auto_1297807 ?auto_1297806 ) ( ON ?auto_1297808 ?auto_1297807 ) ( ON ?auto_1297809 ?auto_1297808 ) ( not ( = ?auto_1297799 ?auto_1297800 ) ) ( not ( = ?auto_1297799 ?auto_1297801 ) ) ( not ( = ?auto_1297799 ?auto_1297802 ) ) ( not ( = ?auto_1297799 ?auto_1297803 ) ) ( not ( = ?auto_1297799 ?auto_1297804 ) ) ( not ( = ?auto_1297799 ?auto_1297805 ) ) ( not ( = ?auto_1297799 ?auto_1297806 ) ) ( not ( = ?auto_1297799 ?auto_1297807 ) ) ( not ( = ?auto_1297799 ?auto_1297808 ) ) ( not ( = ?auto_1297799 ?auto_1297809 ) ) ( not ( = ?auto_1297799 ?auto_1297810 ) ) ( not ( = ?auto_1297799 ?auto_1297811 ) ) ( not ( = ?auto_1297800 ?auto_1297801 ) ) ( not ( = ?auto_1297800 ?auto_1297802 ) ) ( not ( = ?auto_1297800 ?auto_1297803 ) ) ( not ( = ?auto_1297800 ?auto_1297804 ) ) ( not ( = ?auto_1297800 ?auto_1297805 ) ) ( not ( = ?auto_1297800 ?auto_1297806 ) ) ( not ( = ?auto_1297800 ?auto_1297807 ) ) ( not ( = ?auto_1297800 ?auto_1297808 ) ) ( not ( = ?auto_1297800 ?auto_1297809 ) ) ( not ( = ?auto_1297800 ?auto_1297810 ) ) ( not ( = ?auto_1297800 ?auto_1297811 ) ) ( not ( = ?auto_1297801 ?auto_1297802 ) ) ( not ( = ?auto_1297801 ?auto_1297803 ) ) ( not ( = ?auto_1297801 ?auto_1297804 ) ) ( not ( = ?auto_1297801 ?auto_1297805 ) ) ( not ( = ?auto_1297801 ?auto_1297806 ) ) ( not ( = ?auto_1297801 ?auto_1297807 ) ) ( not ( = ?auto_1297801 ?auto_1297808 ) ) ( not ( = ?auto_1297801 ?auto_1297809 ) ) ( not ( = ?auto_1297801 ?auto_1297810 ) ) ( not ( = ?auto_1297801 ?auto_1297811 ) ) ( not ( = ?auto_1297802 ?auto_1297803 ) ) ( not ( = ?auto_1297802 ?auto_1297804 ) ) ( not ( = ?auto_1297802 ?auto_1297805 ) ) ( not ( = ?auto_1297802 ?auto_1297806 ) ) ( not ( = ?auto_1297802 ?auto_1297807 ) ) ( not ( = ?auto_1297802 ?auto_1297808 ) ) ( not ( = ?auto_1297802 ?auto_1297809 ) ) ( not ( = ?auto_1297802 ?auto_1297810 ) ) ( not ( = ?auto_1297802 ?auto_1297811 ) ) ( not ( = ?auto_1297803 ?auto_1297804 ) ) ( not ( = ?auto_1297803 ?auto_1297805 ) ) ( not ( = ?auto_1297803 ?auto_1297806 ) ) ( not ( = ?auto_1297803 ?auto_1297807 ) ) ( not ( = ?auto_1297803 ?auto_1297808 ) ) ( not ( = ?auto_1297803 ?auto_1297809 ) ) ( not ( = ?auto_1297803 ?auto_1297810 ) ) ( not ( = ?auto_1297803 ?auto_1297811 ) ) ( not ( = ?auto_1297804 ?auto_1297805 ) ) ( not ( = ?auto_1297804 ?auto_1297806 ) ) ( not ( = ?auto_1297804 ?auto_1297807 ) ) ( not ( = ?auto_1297804 ?auto_1297808 ) ) ( not ( = ?auto_1297804 ?auto_1297809 ) ) ( not ( = ?auto_1297804 ?auto_1297810 ) ) ( not ( = ?auto_1297804 ?auto_1297811 ) ) ( not ( = ?auto_1297805 ?auto_1297806 ) ) ( not ( = ?auto_1297805 ?auto_1297807 ) ) ( not ( = ?auto_1297805 ?auto_1297808 ) ) ( not ( = ?auto_1297805 ?auto_1297809 ) ) ( not ( = ?auto_1297805 ?auto_1297810 ) ) ( not ( = ?auto_1297805 ?auto_1297811 ) ) ( not ( = ?auto_1297806 ?auto_1297807 ) ) ( not ( = ?auto_1297806 ?auto_1297808 ) ) ( not ( = ?auto_1297806 ?auto_1297809 ) ) ( not ( = ?auto_1297806 ?auto_1297810 ) ) ( not ( = ?auto_1297806 ?auto_1297811 ) ) ( not ( = ?auto_1297807 ?auto_1297808 ) ) ( not ( = ?auto_1297807 ?auto_1297809 ) ) ( not ( = ?auto_1297807 ?auto_1297810 ) ) ( not ( = ?auto_1297807 ?auto_1297811 ) ) ( not ( = ?auto_1297808 ?auto_1297809 ) ) ( not ( = ?auto_1297808 ?auto_1297810 ) ) ( not ( = ?auto_1297808 ?auto_1297811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297809 ?auto_1297810 ?auto_1297811 )
      ( MAKE-12CRATE-VERIFY ?auto_1297799 ?auto_1297800 ?auto_1297801 ?auto_1297802 ?auto_1297803 ?auto_1297804 ?auto_1297805 ?auto_1297806 ?auto_1297807 ?auto_1297808 ?auto_1297809 ?auto_1297810 ?auto_1297811 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297949 - SURFACE
      ?auto_1297950 - SURFACE
      ?auto_1297951 - SURFACE
      ?auto_1297952 - SURFACE
      ?auto_1297953 - SURFACE
      ?auto_1297954 - SURFACE
      ?auto_1297955 - SURFACE
      ?auto_1297956 - SURFACE
      ?auto_1297957 - SURFACE
      ?auto_1297958 - SURFACE
      ?auto_1297959 - SURFACE
      ?auto_1297960 - SURFACE
      ?auto_1297961 - SURFACE
    )
    :vars
    (
      ?auto_1297963 - HOIST
      ?auto_1297965 - PLACE
      ?auto_1297964 - TRUCK
      ?auto_1297962 - PLACE
      ?auto_1297966 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297963 ?auto_1297965 ) ( SURFACE-AT ?auto_1297960 ?auto_1297965 ) ( CLEAR ?auto_1297960 ) ( IS-CRATE ?auto_1297961 ) ( not ( = ?auto_1297960 ?auto_1297961 ) ) ( AVAILABLE ?auto_1297963 ) ( ON ?auto_1297960 ?auto_1297959 ) ( not ( = ?auto_1297959 ?auto_1297960 ) ) ( not ( = ?auto_1297959 ?auto_1297961 ) ) ( TRUCK-AT ?auto_1297964 ?auto_1297962 ) ( not ( = ?auto_1297962 ?auto_1297965 ) ) ( HOIST-AT ?auto_1297966 ?auto_1297962 ) ( LIFTING ?auto_1297966 ?auto_1297961 ) ( not ( = ?auto_1297963 ?auto_1297966 ) ) ( ON ?auto_1297950 ?auto_1297949 ) ( ON ?auto_1297951 ?auto_1297950 ) ( ON ?auto_1297952 ?auto_1297951 ) ( ON ?auto_1297953 ?auto_1297952 ) ( ON ?auto_1297954 ?auto_1297953 ) ( ON ?auto_1297955 ?auto_1297954 ) ( ON ?auto_1297956 ?auto_1297955 ) ( ON ?auto_1297957 ?auto_1297956 ) ( ON ?auto_1297958 ?auto_1297957 ) ( ON ?auto_1297959 ?auto_1297958 ) ( not ( = ?auto_1297949 ?auto_1297950 ) ) ( not ( = ?auto_1297949 ?auto_1297951 ) ) ( not ( = ?auto_1297949 ?auto_1297952 ) ) ( not ( = ?auto_1297949 ?auto_1297953 ) ) ( not ( = ?auto_1297949 ?auto_1297954 ) ) ( not ( = ?auto_1297949 ?auto_1297955 ) ) ( not ( = ?auto_1297949 ?auto_1297956 ) ) ( not ( = ?auto_1297949 ?auto_1297957 ) ) ( not ( = ?auto_1297949 ?auto_1297958 ) ) ( not ( = ?auto_1297949 ?auto_1297959 ) ) ( not ( = ?auto_1297949 ?auto_1297960 ) ) ( not ( = ?auto_1297949 ?auto_1297961 ) ) ( not ( = ?auto_1297950 ?auto_1297951 ) ) ( not ( = ?auto_1297950 ?auto_1297952 ) ) ( not ( = ?auto_1297950 ?auto_1297953 ) ) ( not ( = ?auto_1297950 ?auto_1297954 ) ) ( not ( = ?auto_1297950 ?auto_1297955 ) ) ( not ( = ?auto_1297950 ?auto_1297956 ) ) ( not ( = ?auto_1297950 ?auto_1297957 ) ) ( not ( = ?auto_1297950 ?auto_1297958 ) ) ( not ( = ?auto_1297950 ?auto_1297959 ) ) ( not ( = ?auto_1297950 ?auto_1297960 ) ) ( not ( = ?auto_1297950 ?auto_1297961 ) ) ( not ( = ?auto_1297951 ?auto_1297952 ) ) ( not ( = ?auto_1297951 ?auto_1297953 ) ) ( not ( = ?auto_1297951 ?auto_1297954 ) ) ( not ( = ?auto_1297951 ?auto_1297955 ) ) ( not ( = ?auto_1297951 ?auto_1297956 ) ) ( not ( = ?auto_1297951 ?auto_1297957 ) ) ( not ( = ?auto_1297951 ?auto_1297958 ) ) ( not ( = ?auto_1297951 ?auto_1297959 ) ) ( not ( = ?auto_1297951 ?auto_1297960 ) ) ( not ( = ?auto_1297951 ?auto_1297961 ) ) ( not ( = ?auto_1297952 ?auto_1297953 ) ) ( not ( = ?auto_1297952 ?auto_1297954 ) ) ( not ( = ?auto_1297952 ?auto_1297955 ) ) ( not ( = ?auto_1297952 ?auto_1297956 ) ) ( not ( = ?auto_1297952 ?auto_1297957 ) ) ( not ( = ?auto_1297952 ?auto_1297958 ) ) ( not ( = ?auto_1297952 ?auto_1297959 ) ) ( not ( = ?auto_1297952 ?auto_1297960 ) ) ( not ( = ?auto_1297952 ?auto_1297961 ) ) ( not ( = ?auto_1297953 ?auto_1297954 ) ) ( not ( = ?auto_1297953 ?auto_1297955 ) ) ( not ( = ?auto_1297953 ?auto_1297956 ) ) ( not ( = ?auto_1297953 ?auto_1297957 ) ) ( not ( = ?auto_1297953 ?auto_1297958 ) ) ( not ( = ?auto_1297953 ?auto_1297959 ) ) ( not ( = ?auto_1297953 ?auto_1297960 ) ) ( not ( = ?auto_1297953 ?auto_1297961 ) ) ( not ( = ?auto_1297954 ?auto_1297955 ) ) ( not ( = ?auto_1297954 ?auto_1297956 ) ) ( not ( = ?auto_1297954 ?auto_1297957 ) ) ( not ( = ?auto_1297954 ?auto_1297958 ) ) ( not ( = ?auto_1297954 ?auto_1297959 ) ) ( not ( = ?auto_1297954 ?auto_1297960 ) ) ( not ( = ?auto_1297954 ?auto_1297961 ) ) ( not ( = ?auto_1297955 ?auto_1297956 ) ) ( not ( = ?auto_1297955 ?auto_1297957 ) ) ( not ( = ?auto_1297955 ?auto_1297958 ) ) ( not ( = ?auto_1297955 ?auto_1297959 ) ) ( not ( = ?auto_1297955 ?auto_1297960 ) ) ( not ( = ?auto_1297955 ?auto_1297961 ) ) ( not ( = ?auto_1297956 ?auto_1297957 ) ) ( not ( = ?auto_1297956 ?auto_1297958 ) ) ( not ( = ?auto_1297956 ?auto_1297959 ) ) ( not ( = ?auto_1297956 ?auto_1297960 ) ) ( not ( = ?auto_1297956 ?auto_1297961 ) ) ( not ( = ?auto_1297957 ?auto_1297958 ) ) ( not ( = ?auto_1297957 ?auto_1297959 ) ) ( not ( = ?auto_1297957 ?auto_1297960 ) ) ( not ( = ?auto_1297957 ?auto_1297961 ) ) ( not ( = ?auto_1297958 ?auto_1297959 ) ) ( not ( = ?auto_1297958 ?auto_1297960 ) ) ( not ( = ?auto_1297958 ?auto_1297961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297959 ?auto_1297960 ?auto_1297961 )
      ( MAKE-12CRATE-VERIFY ?auto_1297949 ?auto_1297950 ?auto_1297951 ?auto_1297952 ?auto_1297953 ?auto_1297954 ?auto_1297955 ?auto_1297956 ?auto_1297957 ?auto_1297958 ?auto_1297959 ?auto_1297960 ?auto_1297961 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298111 - SURFACE
      ?auto_1298112 - SURFACE
      ?auto_1298113 - SURFACE
      ?auto_1298114 - SURFACE
      ?auto_1298115 - SURFACE
      ?auto_1298116 - SURFACE
      ?auto_1298117 - SURFACE
      ?auto_1298118 - SURFACE
      ?auto_1298119 - SURFACE
      ?auto_1298120 - SURFACE
      ?auto_1298121 - SURFACE
      ?auto_1298122 - SURFACE
      ?auto_1298123 - SURFACE
    )
    :vars
    (
      ?auto_1298124 - HOIST
      ?auto_1298125 - PLACE
      ?auto_1298129 - TRUCK
      ?auto_1298126 - PLACE
      ?auto_1298128 - HOIST
      ?auto_1298127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298124 ?auto_1298125 ) ( SURFACE-AT ?auto_1298122 ?auto_1298125 ) ( CLEAR ?auto_1298122 ) ( IS-CRATE ?auto_1298123 ) ( not ( = ?auto_1298122 ?auto_1298123 ) ) ( AVAILABLE ?auto_1298124 ) ( ON ?auto_1298122 ?auto_1298121 ) ( not ( = ?auto_1298121 ?auto_1298122 ) ) ( not ( = ?auto_1298121 ?auto_1298123 ) ) ( TRUCK-AT ?auto_1298129 ?auto_1298126 ) ( not ( = ?auto_1298126 ?auto_1298125 ) ) ( HOIST-AT ?auto_1298128 ?auto_1298126 ) ( not ( = ?auto_1298124 ?auto_1298128 ) ) ( AVAILABLE ?auto_1298128 ) ( SURFACE-AT ?auto_1298123 ?auto_1298126 ) ( ON ?auto_1298123 ?auto_1298127 ) ( CLEAR ?auto_1298123 ) ( not ( = ?auto_1298122 ?auto_1298127 ) ) ( not ( = ?auto_1298123 ?auto_1298127 ) ) ( not ( = ?auto_1298121 ?auto_1298127 ) ) ( ON ?auto_1298112 ?auto_1298111 ) ( ON ?auto_1298113 ?auto_1298112 ) ( ON ?auto_1298114 ?auto_1298113 ) ( ON ?auto_1298115 ?auto_1298114 ) ( ON ?auto_1298116 ?auto_1298115 ) ( ON ?auto_1298117 ?auto_1298116 ) ( ON ?auto_1298118 ?auto_1298117 ) ( ON ?auto_1298119 ?auto_1298118 ) ( ON ?auto_1298120 ?auto_1298119 ) ( ON ?auto_1298121 ?auto_1298120 ) ( not ( = ?auto_1298111 ?auto_1298112 ) ) ( not ( = ?auto_1298111 ?auto_1298113 ) ) ( not ( = ?auto_1298111 ?auto_1298114 ) ) ( not ( = ?auto_1298111 ?auto_1298115 ) ) ( not ( = ?auto_1298111 ?auto_1298116 ) ) ( not ( = ?auto_1298111 ?auto_1298117 ) ) ( not ( = ?auto_1298111 ?auto_1298118 ) ) ( not ( = ?auto_1298111 ?auto_1298119 ) ) ( not ( = ?auto_1298111 ?auto_1298120 ) ) ( not ( = ?auto_1298111 ?auto_1298121 ) ) ( not ( = ?auto_1298111 ?auto_1298122 ) ) ( not ( = ?auto_1298111 ?auto_1298123 ) ) ( not ( = ?auto_1298111 ?auto_1298127 ) ) ( not ( = ?auto_1298112 ?auto_1298113 ) ) ( not ( = ?auto_1298112 ?auto_1298114 ) ) ( not ( = ?auto_1298112 ?auto_1298115 ) ) ( not ( = ?auto_1298112 ?auto_1298116 ) ) ( not ( = ?auto_1298112 ?auto_1298117 ) ) ( not ( = ?auto_1298112 ?auto_1298118 ) ) ( not ( = ?auto_1298112 ?auto_1298119 ) ) ( not ( = ?auto_1298112 ?auto_1298120 ) ) ( not ( = ?auto_1298112 ?auto_1298121 ) ) ( not ( = ?auto_1298112 ?auto_1298122 ) ) ( not ( = ?auto_1298112 ?auto_1298123 ) ) ( not ( = ?auto_1298112 ?auto_1298127 ) ) ( not ( = ?auto_1298113 ?auto_1298114 ) ) ( not ( = ?auto_1298113 ?auto_1298115 ) ) ( not ( = ?auto_1298113 ?auto_1298116 ) ) ( not ( = ?auto_1298113 ?auto_1298117 ) ) ( not ( = ?auto_1298113 ?auto_1298118 ) ) ( not ( = ?auto_1298113 ?auto_1298119 ) ) ( not ( = ?auto_1298113 ?auto_1298120 ) ) ( not ( = ?auto_1298113 ?auto_1298121 ) ) ( not ( = ?auto_1298113 ?auto_1298122 ) ) ( not ( = ?auto_1298113 ?auto_1298123 ) ) ( not ( = ?auto_1298113 ?auto_1298127 ) ) ( not ( = ?auto_1298114 ?auto_1298115 ) ) ( not ( = ?auto_1298114 ?auto_1298116 ) ) ( not ( = ?auto_1298114 ?auto_1298117 ) ) ( not ( = ?auto_1298114 ?auto_1298118 ) ) ( not ( = ?auto_1298114 ?auto_1298119 ) ) ( not ( = ?auto_1298114 ?auto_1298120 ) ) ( not ( = ?auto_1298114 ?auto_1298121 ) ) ( not ( = ?auto_1298114 ?auto_1298122 ) ) ( not ( = ?auto_1298114 ?auto_1298123 ) ) ( not ( = ?auto_1298114 ?auto_1298127 ) ) ( not ( = ?auto_1298115 ?auto_1298116 ) ) ( not ( = ?auto_1298115 ?auto_1298117 ) ) ( not ( = ?auto_1298115 ?auto_1298118 ) ) ( not ( = ?auto_1298115 ?auto_1298119 ) ) ( not ( = ?auto_1298115 ?auto_1298120 ) ) ( not ( = ?auto_1298115 ?auto_1298121 ) ) ( not ( = ?auto_1298115 ?auto_1298122 ) ) ( not ( = ?auto_1298115 ?auto_1298123 ) ) ( not ( = ?auto_1298115 ?auto_1298127 ) ) ( not ( = ?auto_1298116 ?auto_1298117 ) ) ( not ( = ?auto_1298116 ?auto_1298118 ) ) ( not ( = ?auto_1298116 ?auto_1298119 ) ) ( not ( = ?auto_1298116 ?auto_1298120 ) ) ( not ( = ?auto_1298116 ?auto_1298121 ) ) ( not ( = ?auto_1298116 ?auto_1298122 ) ) ( not ( = ?auto_1298116 ?auto_1298123 ) ) ( not ( = ?auto_1298116 ?auto_1298127 ) ) ( not ( = ?auto_1298117 ?auto_1298118 ) ) ( not ( = ?auto_1298117 ?auto_1298119 ) ) ( not ( = ?auto_1298117 ?auto_1298120 ) ) ( not ( = ?auto_1298117 ?auto_1298121 ) ) ( not ( = ?auto_1298117 ?auto_1298122 ) ) ( not ( = ?auto_1298117 ?auto_1298123 ) ) ( not ( = ?auto_1298117 ?auto_1298127 ) ) ( not ( = ?auto_1298118 ?auto_1298119 ) ) ( not ( = ?auto_1298118 ?auto_1298120 ) ) ( not ( = ?auto_1298118 ?auto_1298121 ) ) ( not ( = ?auto_1298118 ?auto_1298122 ) ) ( not ( = ?auto_1298118 ?auto_1298123 ) ) ( not ( = ?auto_1298118 ?auto_1298127 ) ) ( not ( = ?auto_1298119 ?auto_1298120 ) ) ( not ( = ?auto_1298119 ?auto_1298121 ) ) ( not ( = ?auto_1298119 ?auto_1298122 ) ) ( not ( = ?auto_1298119 ?auto_1298123 ) ) ( not ( = ?auto_1298119 ?auto_1298127 ) ) ( not ( = ?auto_1298120 ?auto_1298121 ) ) ( not ( = ?auto_1298120 ?auto_1298122 ) ) ( not ( = ?auto_1298120 ?auto_1298123 ) ) ( not ( = ?auto_1298120 ?auto_1298127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298121 ?auto_1298122 ?auto_1298123 )
      ( MAKE-12CRATE-VERIFY ?auto_1298111 ?auto_1298112 ?auto_1298113 ?auto_1298114 ?auto_1298115 ?auto_1298116 ?auto_1298117 ?auto_1298118 ?auto_1298119 ?auto_1298120 ?auto_1298121 ?auto_1298122 ?auto_1298123 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298274 - SURFACE
      ?auto_1298275 - SURFACE
      ?auto_1298276 - SURFACE
      ?auto_1298277 - SURFACE
      ?auto_1298278 - SURFACE
      ?auto_1298279 - SURFACE
      ?auto_1298280 - SURFACE
      ?auto_1298281 - SURFACE
      ?auto_1298282 - SURFACE
      ?auto_1298283 - SURFACE
      ?auto_1298284 - SURFACE
      ?auto_1298285 - SURFACE
      ?auto_1298286 - SURFACE
    )
    :vars
    (
      ?auto_1298291 - HOIST
      ?auto_1298287 - PLACE
      ?auto_1298292 - PLACE
      ?auto_1298288 - HOIST
      ?auto_1298289 - SURFACE
      ?auto_1298290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298291 ?auto_1298287 ) ( SURFACE-AT ?auto_1298285 ?auto_1298287 ) ( CLEAR ?auto_1298285 ) ( IS-CRATE ?auto_1298286 ) ( not ( = ?auto_1298285 ?auto_1298286 ) ) ( AVAILABLE ?auto_1298291 ) ( ON ?auto_1298285 ?auto_1298284 ) ( not ( = ?auto_1298284 ?auto_1298285 ) ) ( not ( = ?auto_1298284 ?auto_1298286 ) ) ( not ( = ?auto_1298292 ?auto_1298287 ) ) ( HOIST-AT ?auto_1298288 ?auto_1298292 ) ( not ( = ?auto_1298291 ?auto_1298288 ) ) ( AVAILABLE ?auto_1298288 ) ( SURFACE-AT ?auto_1298286 ?auto_1298292 ) ( ON ?auto_1298286 ?auto_1298289 ) ( CLEAR ?auto_1298286 ) ( not ( = ?auto_1298285 ?auto_1298289 ) ) ( not ( = ?auto_1298286 ?auto_1298289 ) ) ( not ( = ?auto_1298284 ?auto_1298289 ) ) ( TRUCK-AT ?auto_1298290 ?auto_1298287 ) ( ON ?auto_1298275 ?auto_1298274 ) ( ON ?auto_1298276 ?auto_1298275 ) ( ON ?auto_1298277 ?auto_1298276 ) ( ON ?auto_1298278 ?auto_1298277 ) ( ON ?auto_1298279 ?auto_1298278 ) ( ON ?auto_1298280 ?auto_1298279 ) ( ON ?auto_1298281 ?auto_1298280 ) ( ON ?auto_1298282 ?auto_1298281 ) ( ON ?auto_1298283 ?auto_1298282 ) ( ON ?auto_1298284 ?auto_1298283 ) ( not ( = ?auto_1298274 ?auto_1298275 ) ) ( not ( = ?auto_1298274 ?auto_1298276 ) ) ( not ( = ?auto_1298274 ?auto_1298277 ) ) ( not ( = ?auto_1298274 ?auto_1298278 ) ) ( not ( = ?auto_1298274 ?auto_1298279 ) ) ( not ( = ?auto_1298274 ?auto_1298280 ) ) ( not ( = ?auto_1298274 ?auto_1298281 ) ) ( not ( = ?auto_1298274 ?auto_1298282 ) ) ( not ( = ?auto_1298274 ?auto_1298283 ) ) ( not ( = ?auto_1298274 ?auto_1298284 ) ) ( not ( = ?auto_1298274 ?auto_1298285 ) ) ( not ( = ?auto_1298274 ?auto_1298286 ) ) ( not ( = ?auto_1298274 ?auto_1298289 ) ) ( not ( = ?auto_1298275 ?auto_1298276 ) ) ( not ( = ?auto_1298275 ?auto_1298277 ) ) ( not ( = ?auto_1298275 ?auto_1298278 ) ) ( not ( = ?auto_1298275 ?auto_1298279 ) ) ( not ( = ?auto_1298275 ?auto_1298280 ) ) ( not ( = ?auto_1298275 ?auto_1298281 ) ) ( not ( = ?auto_1298275 ?auto_1298282 ) ) ( not ( = ?auto_1298275 ?auto_1298283 ) ) ( not ( = ?auto_1298275 ?auto_1298284 ) ) ( not ( = ?auto_1298275 ?auto_1298285 ) ) ( not ( = ?auto_1298275 ?auto_1298286 ) ) ( not ( = ?auto_1298275 ?auto_1298289 ) ) ( not ( = ?auto_1298276 ?auto_1298277 ) ) ( not ( = ?auto_1298276 ?auto_1298278 ) ) ( not ( = ?auto_1298276 ?auto_1298279 ) ) ( not ( = ?auto_1298276 ?auto_1298280 ) ) ( not ( = ?auto_1298276 ?auto_1298281 ) ) ( not ( = ?auto_1298276 ?auto_1298282 ) ) ( not ( = ?auto_1298276 ?auto_1298283 ) ) ( not ( = ?auto_1298276 ?auto_1298284 ) ) ( not ( = ?auto_1298276 ?auto_1298285 ) ) ( not ( = ?auto_1298276 ?auto_1298286 ) ) ( not ( = ?auto_1298276 ?auto_1298289 ) ) ( not ( = ?auto_1298277 ?auto_1298278 ) ) ( not ( = ?auto_1298277 ?auto_1298279 ) ) ( not ( = ?auto_1298277 ?auto_1298280 ) ) ( not ( = ?auto_1298277 ?auto_1298281 ) ) ( not ( = ?auto_1298277 ?auto_1298282 ) ) ( not ( = ?auto_1298277 ?auto_1298283 ) ) ( not ( = ?auto_1298277 ?auto_1298284 ) ) ( not ( = ?auto_1298277 ?auto_1298285 ) ) ( not ( = ?auto_1298277 ?auto_1298286 ) ) ( not ( = ?auto_1298277 ?auto_1298289 ) ) ( not ( = ?auto_1298278 ?auto_1298279 ) ) ( not ( = ?auto_1298278 ?auto_1298280 ) ) ( not ( = ?auto_1298278 ?auto_1298281 ) ) ( not ( = ?auto_1298278 ?auto_1298282 ) ) ( not ( = ?auto_1298278 ?auto_1298283 ) ) ( not ( = ?auto_1298278 ?auto_1298284 ) ) ( not ( = ?auto_1298278 ?auto_1298285 ) ) ( not ( = ?auto_1298278 ?auto_1298286 ) ) ( not ( = ?auto_1298278 ?auto_1298289 ) ) ( not ( = ?auto_1298279 ?auto_1298280 ) ) ( not ( = ?auto_1298279 ?auto_1298281 ) ) ( not ( = ?auto_1298279 ?auto_1298282 ) ) ( not ( = ?auto_1298279 ?auto_1298283 ) ) ( not ( = ?auto_1298279 ?auto_1298284 ) ) ( not ( = ?auto_1298279 ?auto_1298285 ) ) ( not ( = ?auto_1298279 ?auto_1298286 ) ) ( not ( = ?auto_1298279 ?auto_1298289 ) ) ( not ( = ?auto_1298280 ?auto_1298281 ) ) ( not ( = ?auto_1298280 ?auto_1298282 ) ) ( not ( = ?auto_1298280 ?auto_1298283 ) ) ( not ( = ?auto_1298280 ?auto_1298284 ) ) ( not ( = ?auto_1298280 ?auto_1298285 ) ) ( not ( = ?auto_1298280 ?auto_1298286 ) ) ( not ( = ?auto_1298280 ?auto_1298289 ) ) ( not ( = ?auto_1298281 ?auto_1298282 ) ) ( not ( = ?auto_1298281 ?auto_1298283 ) ) ( not ( = ?auto_1298281 ?auto_1298284 ) ) ( not ( = ?auto_1298281 ?auto_1298285 ) ) ( not ( = ?auto_1298281 ?auto_1298286 ) ) ( not ( = ?auto_1298281 ?auto_1298289 ) ) ( not ( = ?auto_1298282 ?auto_1298283 ) ) ( not ( = ?auto_1298282 ?auto_1298284 ) ) ( not ( = ?auto_1298282 ?auto_1298285 ) ) ( not ( = ?auto_1298282 ?auto_1298286 ) ) ( not ( = ?auto_1298282 ?auto_1298289 ) ) ( not ( = ?auto_1298283 ?auto_1298284 ) ) ( not ( = ?auto_1298283 ?auto_1298285 ) ) ( not ( = ?auto_1298283 ?auto_1298286 ) ) ( not ( = ?auto_1298283 ?auto_1298289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298284 ?auto_1298285 ?auto_1298286 )
      ( MAKE-12CRATE-VERIFY ?auto_1298274 ?auto_1298275 ?auto_1298276 ?auto_1298277 ?auto_1298278 ?auto_1298279 ?auto_1298280 ?auto_1298281 ?auto_1298282 ?auto_1298283 ?auto_1298284 ?auto_1298285 ?auto_1298286 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298437 - SURFACE
      ?auto_1298438 - SURFACE
      ?auto_1298439 - SURFACE
      ?auto_1298440 - SURFACE
      ?auto_1298441 - SURFACE
      ?auto_1298442 - SURFACE
      ?auto_1298443 - SURFACE
      ?auto_1298444 - SURFACE
      ?auto_1298445 - SURFACE
      ?auto_1298446 - SURFACE
      ?auto_1298447 - SURFACE
      ?auto_1298448 - SURFACE
      ?auto_1298449 - SURFACE
    )
    :vars
    (
      ?auto_1298453 - HOIST
      ?auto_1298454 - PLACE
      ?auto_1298450 - PLACE
      ?auto_1298455 - HOIST
      ?auto_1298452 - SURFACE
      ?auto_1298451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298453 ?auto_1298454 ) ( IS-CRATE ?auto_1298449 ) ( not ( = ?auto_1298448 ?auto_1298449 ) ) ( not ( = ?auto_1298447 ?auto_1298448 ) ) ( not ( = ?auto_1298447 ?auto_1298449 ) ) ( not ( = ?auto_1298450 ?auto_1298454 ) ) ( HOIST-AT ?auto_1298455 ?auto_1298450 ) ( not ( = ?auto_1298453 ?auto_1298455 ) ) ( AVAILABLE ?auto_1298455 ) ( SURFACE-AT ?auto_1298449 ?auto_1298450 ) ( ON ?auto_1298449 ?auto_1298452 ) ( CLEAR ?auto_1298449 ) ( not ( = ?auto_1298448 ?auto_1298452 ) ) ( not ( = ?auto_1298449 ?auto_1298452 ) ) ( not ( = ?auto_1298447 ?auto_1298452 ) ) ( TRUCK-AT ?auto_1298451 ?auto_1298454 ) ( SURFACE-AT ?auto_1298447 ?auto_1298454 ) ( CLEAR ?auto_1298447 ) ( LIFTING ?auto_1298453 ?auto_1298448 ) ( IS-CRATE ?auto_1298448 ) ( ON ?auto_1298438 ?auto_1298437 ) ( ON ?auto_1298439 ?auto_1298438 ) ( ON ?auto_1298440 ?auto_1298439 ) ( ON ?auto_1298441 ?auto_1298440 ) ( ON ?auto_1298442 ?auto_1298441 ) ( ON ?auto_1298443 ?auto_1298442 ) ( ON ?auto_1298444 ?auto_1298443 ) ( ON ?auto_1298445 ?auto_1298444 ) ( ON ?auto_1298446 ?auto_1298445 ) ( ON ?auto_1298447 ?auto_1298446 ) ( not ( = ?auto_1298437 ?auto_1298438 ) ) ( not ( = ?auto_1298437 ?auto_1298439 ) ) ( not ( = ?auto_1298437 ?auto_1298440 ) ) ( not ( = ?auto_1298437 ?auto_1298441 ) ) ( not ( = ?auto_1298437 ?auto_1298442 ) ) ( not ( = ?auto_1298437 ?auto_1298443 ) ) ( not ( = ?auto_1298437 ?auto_1298444 ) ) ( not ( = ?auto_1298437 ?auto_1298445 ) ) ( not ( = ?auto_1298437 ?auto_1298446 ) ) ( not ( = ?auto_1298437 ?auto_1298447 ) ) ( not ( = ?auto_1298437 ?auto_1298448 ) ) ( not ( = ?auto_1298437 ?auto_1298449 ) ) ( not ( = ?auto_1298437 ?auto_1298452 ) ) ( not ( = ?auto_1298438 ?auto_1298439 ) ) ( not ( = ?auto_1298438 ?auto_1298440 ) ) ( not ( = ?auto_1298438 ?auto_1298441 ) ) ( not ( = ?auto_1298438 ?auto_1298442 ) ) ( not ( = ?auto_1298438 ?auto_1298443 ) ) ( not ( = ?auto_1298438 ?auto_1298444 ) ) ( not ( = ?auto_1298438 ?auto_1298445 ) ) ( not ( = ?auto_1298438 ?auto_1298446 ) ) ( not ( = ?auto_1298438 ?auto_1298447 ) ) ( not ( = ?auto_1298438 ?auto_1298448 ) ) ( not ( = ?auto_1298438 ?auto_1298449 ) ) ( not ( = ?auto_1298438 ?auto_1298452 ) ) ( not ( = ?auto_1298439 ?auto_1298440 ) ) ( not ( = ?auto_1298439 ?auto_1298441 ) ) ( not ( = ?auto_1298439 ?auto_1298442 ) ) ( not ( = ?auto_1298439 ?auto_1298443 ) ) ( not ( = ?auto_1298439 ?auto_1298444 ) ) ( not ( = ?auto_1298439 ?auto_1298445 ) ) ( not ( = ?auto_1298439 ?auto_1298446 ) ) ( not ( = ?auto_1298439 ?auto_1298447 ) ) ( not ( = ?auto_1298439 ?auto_1298448 ) ) ( not ( = ?auto_1298439 ?auto_1298449 ) ) ( not ( = ?auto_1298439 ?auto_1298452 ) ) ( not ( = ?auto_1298440 ?auto_1298441 ) ) ( not ( = ?auto_1298440 ?auto_1298442 ) ) ( not ( = ?auto_1298440 ?auto_1298443 ) ) ( not ( = ?auto_1298440 ?auto_1298444 ) ) ( not ( = ?auto_1298440 ?auto_1298445 ) ) ( not ( = ?auto_1298440 ?auto_1298446 ) ) ( not ( = ?auto_1298440 ?auto_1298447 ) ) ( not ( = ?auto_1298440 ?auto_1298448 ) ) ( not ( = ?auto_1298440 ?auto_1298449 ) ) ( not ( = ?auto_1298440 ?auto_1298452 ) ) ( not ( = ?auto_1298441 ?auto_1298442 ) ) ( not ( = ?auto_1298441 ?auto_1298443 ) ) ( not ( = ?auto_1298441 ?auto_1298444 ) ) ( not ( = ?auto_1298441 ?auto_1298445 ) ) ( not ( = ?auto_1298441 ?auto_1298446 ) ) ( not ( = ?auto_1298441 ?auto_1298447 ) ) ( not ( = ?auto_1298441 ?auto_1298448 ) ) ( not ( = ?auto_1298441 ?auto_1298449 ) ) ( not ( = ?auto_1298441 ?auto_1298452 ) ) ( not ( = ?auto_1298442 ?auto_1298443 ) ) ( not ( = ?auto_1298442 ?auto_1298444 ) ) ( not ( = ?auto_1298442 ?auto_1298445 ) ) ( not ( = ?auto_1298442 ?auto_1298446 ) ) ( not ( = ?auto_1298442 ?auto_1298447 ) ) ( not ( = ?auto_1298442 ?auto_1298448 ) ) ( not ( = ?auto_1298442 ?auto_1298449 ) ) ( not ( = ?auto_1298442 ?auto_1298452 ) ) ( not ( = ?auto_1298443 ?auto_1298444 ) ) ( not ( = ?auto_1298443 ?auto_1298445 ) ) ( not ( = ?auto_1298443 ?auto_1298446 ) ) ( not ( = ?auto_1298443 ?auto_1298447 ) ) ( not ( = ?auto_1298443 ?auto_1298448 ) ) ( not ( = ?auto_1298443 ?auto_1298449 ) ) ( not ( = ?auto_1298443 ?auto_1298452 ) ) ( not ( = ?auto_1298444 ?auto_1298445 ) ) ( not ( = ?auto_1298444 ?auto_1298446 ) ) ( not ( = ?auto_1298444 ?auto_1298447 ) ) ( not ( = ?auto_1298444 ?auto_1298448 ) ) ( not ( = ?auto_1298444 ?auto_1298449 ) ) ( not ( = ?auto_1298444 ?auto_1298452 ) ) ( not ( = ?auto_1298445 ?auto_1298446 ) ) ( not ( = ?auto_1298445 ?auto_1298447 ) ) ( not ( = ?auto_1298445 ?auto_1298448 ) ) ( not ( = ?auto_1298445 ?auto_1298449 ) ) ( not ( = ?auto_1298445 ?auto_1298452 ) ) ( not ( = ?auto_1298446 ?auto_1298447 ) ) ( not ( = ?auto_1298446 ?auto_1298448 ) ) ( not ( = ?auto_1298446 ?auto_1298449 ) ) ( not ( = ?auto_1298446 ?auto_1298452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298447 ?auto_1298448 ?auto_1298449 )
      ( MAKE-12CRATE-VERIFY ?auto_1298437 ?auto_1298438 ?auto_1298439 ?auto_1298440 ?auto_1298441 ?auto_1298442 ?auto_1298443 ?auto_1298444 ?auto_1298445 ?auto_1298446 ?auto_1298447 ?auto_1298448 ?auto_1298449 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298600 - SURFACE
      ?auto_1298601 - SURFACE
      ?auto_1298602 - SURFACE
      ?auto_1298603 - SURFACE
      ?auto_1298604 - SURFACE
      ?auto_1298605 - SURFACE
      ?auto_1298606 - SURFACE
      ?auto_1298607 - SURFACE
      ?auto_1298608 - SURFACE
      ?auto_1298609 - SURFACE
      ?auto_1298610 - SURFACE
      ?auto_1298611 - SURFACE
      ?auto_1298612 - SURFACE
    )
    :vars
    (
      ?auto_1298618 - HOIST
      ?auto_1298614 - PLACE
      ?auto_1298613 - PLACE
      ?auto_1298615 - HOIST
      ?auto_1298616 - SURFACE
      ?auto_1298617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298618 ?auto_1298614 ) ( IS-CRATE ?auto_1298612 ) ( not ( = ?auto_1298611 ?auto_1298612 ) ) ( not ( = ?auto_1298610 ?auto_1298611 ) ) ( not ( = ?auto_1298610 ?auto_1298612 ) ) ( not ( = ?auto_1298613 ?auto_1298614 ) ) ( HOIST-AT ?auto_1298615 ?auto_1298613 ) ( not ( = ?auto_1298618 ?auto_1298615 ) ) ( AVAILABLE ?auto_1298615 ) ( SURFACE-AT ?auto_1298612 ?auto_1298613 ) ( ON ?auto_1298612 ?auto_1298616 ) ( CLEAR ?auto_1298612 ) ( not ( = ?auto_1298611 ?auto_1298616 ) ) ( not ( = ?auto_1298612 ?auto_1298616 ) ) ( not ( = ?auto_1298610 ?auto_1298616 ) ) ( TRUCK-AT ?auto_1298617 ?auto_1298614 ) ( SURFACE-AT ?auto_1298610 ?auto_1298614 ) ( CLEAR ?auto_1298610 ) ( IS-CRATE ?auto_1298611 ) ( AVAILABLE ?auto_1298618 ) ( IN ?auto_1298611 ?auto_1298617 ) ( ON ?auto_1298601 ?auto_1298600 ) ( ON ?auto_1298602 ?auto_1298601 ) ( ON ?auto_1298603 ?auto_1298602 ) ( ON ?auto_1298604 ?auto_1298603 ) ( ON ?auto_1298605 ?auto_1298604 ) ( ON ?auto_1298606 ?auto_1298605 ) ( ON ?auto_1298607 ?auto_1298606 ) ( ON ?auto_1298608 ?auto_1298607 ) ( ON ?auto_1298609 ?auto_1298608 ) ( ON ?auto_1298610 ?auto_1298609 ) ( not ( = ?auto_1298600 ?auto_1298601 ) ) ( not ( = ?auto_1298600 ?auto_1298602 ) ) ( not ( = ?auto_1298600 ?auto_1298603 ) ) ( not ( = ?auto_1298600 ?auto_1298604 ) ) ( not ( = ?auto_1298600 ?auto_1298605 ) ) ( not ( = ?auto_1298600 ?auto_1298606 ) ) ( not ( = ?auto_1298600 ?auto_1298607 ) ) ( not ( = ?auto_1298600 ?auto_1298608 ) ) ( not ( = ?auto_1298600 ?auto_1298609 ) ) ( not ( = ?auto_1298600 ?auto_1298610 ) ) ( not ( = ?auto_1298600 ?auto_1298611 ) ) ( not ( = ?auto_1298600 ?auto_1298612 ) ) ( not ( = ?auto_1298600 ?auto_1298616 ) ) ( not ( = ?auto_1298601 ?auto_1298602 ) ) ( not ( = ?auto_1298601 ?auto_1298603 ) ) ( not ( = ?auto_1298601 ?auto_1298604 ) ) ( not ( = ?auto_1298601 ?auto_1298605 ) ) ( not ( = ?auto_1298601 ?auto_1298606 ) ) ( not ( = ?auto_1298601 ?auto_1298607 ) ) ( not ( = ?auto_1298601 ?auto_1298608 ) ) ( not ( = ?auto_1298601 ?auto_1298609 ) ) ( not ( = ?auto_1298601 ?auto_1298610 ) ) ( not ( = ?auto_1298601 ?auto_1298611 ) ) ( not ( = ?auto_1298601 ?auto_1298612 ) ) ( not ( = ?auto_1298601 ?auto_1298616 ) ) ( not ( = ?auto_1298602 ?auto_1298603 ) ) ( not ( = ?auto_1298602 ?auto_1298604 ) ) ( not ( = ?auto_1298602 ?auto_1298605 ) ) ( not ( = ?auto_1298602 ?auto_1298606 ) ) ( not ( = ?auto_1298602 ?auto_1298607 ) ) ( not ( = ?auto_1298602 ?auto_1298608 ) ) ( not ( = ?auto_1298602 ?auto_1298609 ) ) ( not ( = ?auto_1298602 ?auto_1298610 ) ) ( not ( = ?auto_1298602 ?auto_1298611 ) ) ( not ( = ?auto_1298602 ?auto_1298612 ) ) ( not ( = ?auto_1298602 ?auto_1298616 ) ) ( not ( = ?auto_1298603 ?auto_1298604 ) ) ( not ( = ?auto_1298603 ?auto_1298605 ) ) ( not ( = ?auto_1298603 ?auto_1298606 ) ) ( not ( = ?auto_1298603 ?auto_1298607 ) ) ( not ( = ?auto_1298603 ?auto_1298608 ) ) ( not ( = ?auto_1298603 ?auto_1298609 ) ) ( not ( = ?auto_1298603 ?auto_1298610 ) ) ( not ( = ?auto_1298603 ?auto_1298611 ) ) ( not ( = ?auto_1298603 ?auto_1298612 ) ) ( not ( = ?auto_1298603 ?auto_1298616 ) ) ( not ( = ?auto_1298604 ?auto_1298605 ) ) ( not ( = ?auto_1298604 ?auto_1298606 ) ) ( not ( = ?auto_1298604 ?auto_1298607 ) ) ( not ( = ?auto_1298604 ?auto_1298608 ) ) ( not ( = ?auto_1298604 ?auto_1298609 ) ) ( not ( = ?auto_1298604 ?auto_1298610 ) ) ( not ( = ?auto_1298604 ?auto_1298611 ) ) ( not ( = ?auto_1298604 ?auto_1298612 ) ) ( not ( = ?auto_1298604 ?auto_1298616 ) ) ( not ( = ?auto_1298605 ?auto_1298606 ) ) ( not ( = ?auto_1298605 ?auto_1298607 ) ) ( not ( = ?auto_1298605 ?auto_1298608 ) ) ( not ( = ?auto_1298605 ?auto_1298609 ) ) ( not ( = ?auto_1298605 ?auto_1298610 ) ) ( not ( = ?auto_1298605 ?auto_1298611 ) ) ( not ( = ?auto_1298605 ?auto_1298612 ) ) ( not ( = ?auto_1298605 ?auto_1298616 ) ) ( not ( = ?auto_1298606 ?auto_1298607 ) ) ( not ( = ?auto_1298606 ?auto_1298608 ) ) ( not ( = ?auto_1298606 ?auto_1298609 ) ) ( not ( = ?auto_1298606 ?auto_1298610 ) ) ( not ( = ?auto_1298606 ?auto_1298611 ) ) ( not ( = ?auto_1298606 ?auto_1298612 ) ) ( not ( = ?auto_1298606 ?auto_1298616 ) ) ( not ( = ?auto_1298607 ?auto_1298608 ) ) ( not ( = ?auto_1298607 ?auto_1298609 ) ) ( not ( = ?auto_1298607 ?auto_1298610 ) ) ( not ( = ?auto_1298607 ?auto_1298611 ) ) ( not ( = ?auto_1298607 ?auto_1298612 ) ) ( not ( = ?auto_1298607 ?auto_1298616 ) ) ( not ( = ?auto_1298608 ?auto_1298609 ) ) ( not ( = ?auto_1298608 ?auto_1298610 ) ) ( not ( = ?auto_1298608 ?auto_1298611 ) ) ( not ( = ?auto_1298608 ?auto_1298612 ) ) ( not ( = ?auto_1298608 ?auto_1298616 ) ) ( not ( = ?auto_1298609 ?auto_1298610 ) ) ( not ( = ?auto_1298609 ?auto_1298611 ) ) ( not ( = ?auto_1298609 ?auto_1298612 ) ) ( not ( = ?auto_1298609 ?auto_1298616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298610 ?auto_1298611 ?auto_1298612 )
      ( MAKE-12CRATE-VERIFY ?auto_1298600 ?auto_1298601 ?auto_1298602 ?auto_1298603 ?auto_1298604 ?auto_1298605 ?auto_1298606 ?auto_1298607 ?auto_1298608 ?auto_1298609 ?auto_1298610 ?auto_1298611 ?auto_1298612 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310204 - SURFACE
      ?auto_1310205 - SURFACE
      ?auto_1310206 - SURFACE
      ?auto_1310207 - SURFACE
      ?auto_1310208 - SURFACE
      ?auto_1310209 - SURFACE
      ?auto_1310210 - SURFACE
      ?auto_1310211 - SURFACE
      ?auto_1310212 - SURFACE
      ?auto_1310213 - SURFACE
      ?auto_1310214 - SURFACE
      ?auto_1310215 - SURFACE
      ?auto_1310216 - SURFACE
      ?auto_1310217 - SURFACE
    )
    :vars
    (
      ?auto_1310219 - HOIST
      ?auto_1310218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310219 ?auto_1310218 ) ( SURFACE-AT ?auto_1310216 ?auto_1310218 ) ( CLEAR ?auto_1310216 ) ( LIFTING ?auto_1310219 ?auto_1310217 ) ( IS-CRATE ?auto_1310217 ) ( not ( = ?auto_1310216 ?auto_1310217 ) ) ( ON ?auto_1310205 ?auto_1310204 ) ( ON ?auto_1310206 ?auto_1310205 ) ( ON ?auto_1310207 ?auto_1310206 ) ( ON ?auto_1310208 ?auto_1310207 ) ( ON ?auto_1310209 ?auto_1310208 ) ( ON ?auto_1310210 ?auto_1310209 ) ( ON ?auto_1310211 ?auto_1310210 ) ( ON ?auto_1310212 ?auto_1310211 ) ( ON ?auto_1310213 ?auto_1310212 ) ( ON ?auto_1310214 ?auto_1310213 ) ( ON ?auto_1310215 ?auto_1310214 ) ( ON ?auto_1310216 ?auto_1310215 ) ( not ( = ?auto_1310204 ?auto_1310205 ) ) ( not ( = ?auto_1310204 ?auto_1310206 ) ) ( not ( = ?auto_1310204 ?auto_1310207 ) ) ( not ( = ?auto_1310204 ?auto_1310208 ) ) ( not ( = ?auto_1310204 ?auto_1310209 ) ) ( not ( = ?auto_1310204 ?auto_1310210 ) ) ( not ( = ?auto_1310204 ?auto_1310211 ) ) ( not ( = ?auto_1310204 ?auto_1310212 ) ) ( not ( = ?auto_1310204 ?auto_1310213 ) ) ( not ( = ?auto_1310204 ?auto_1310214 ) ) ( not ( = ?auto_1310204 ?auto_1310215 ) ) ( not ( = ?auto_1310204 ?auto_1310216 ) ) ( not ( = ?auto_1310204 ?auto_1310217 ) ) ( not ( = ?auto_1310205 ?auto_1310206 ) ) ( not ( = ?auto_1310205 ?auto_1310207 ) ) ( not ( = ?auto_1310205 ?auto_1310208 ) ) ( not ( = ?auto_1310205 ?auto_1310209 ) ) ( not ( = ?auto_1310205 ?auto_1310210 ) ) ( not ( = ?auto_1310205 ?auto_1310211 ) ) ( not ( = ?auto_1310205 ?auto_1310212 ) ) ( not ( = ?auto_1310205 ?auto_1310213 ) ) ( not ( = ?auto_1310205 ?auto_1310214 ) ) ( not ( = ?auto_1310205 ?auto_1310215 ) ) ( not ( = ?auto_1310205 ?auto_1310216 ) ) ( not ( = ?auto_1310205 ?auto_1310217 ) ) ( not ( = ?auto_1310206 ?auto_1310207 ) ) ( not ( = ?auto_1310206 ?auto_1310208 ) ) ( not ( = ?auto_1310206 ?auto_1310209 ) ) ( not ( = ?auto_1310206 ?auto_1310210 ) ) ( not ( = ?auto_1310206 ?auto_1310211 ) ) ( not ( = ?auto_1310206 ?auto_1310212 ) ) ( not ( = ?auto_1310206 ?auto_1310213 ) ) ( not ( = ?auto_1310206 ?auto_1310214 ) ) ( not ( = ?auto_1310206 ?auto_1310215 ) ) ( not ( = ?auto_1310206 ?auto_1310216 ) ) ( not ( = ?auto_1310206 ?auto_1310217 ) ) ( not ( = ?auto_1310207 ?auto_1310208 ) ) ( not ( = ?auto_1310207 ?auto_1310209 ) ) ( not ( = ?auto_1310207 ?auto_1310210 ) ) ( not ( = ?auto_1310207 ?auto_1310211 ) ) ( not ( = ?auto_1310207 ?auto_1310212 ) ) ( not ( = ?auto_1310207 ?auto_1310213 ) ) ( not ( = ?auto_1310207 ?auto_1310214 ) ) ( not ( = ?auto_1310207 ?auto_1310215 ) ) ( not ( = ?auto_1310207 ?auto_1310216 ) ) ( not ( = ?auto_1310207 ?auto_1310217 ) ) ( not ( = ?auto_1310208 ?auto_1310209 ) ) ( not ( = ?auto_1310208 ?auto_1310210 ) ) ( not ( = ?auto_1310208 ?auto_1310211 ) ) ( not ( = ?auto_1310208 ?auto_1310212 ) ) ( not ( = ?auto_1310208 ?auto_1310213 ) ) ( not ( = ?auto_1310208 ?auto_1310214 ) ) ( not ( = ?auto_1310208 ?auto_1310215 ) ) ( not ( = ?auto_1310208 ?auto_1310216 ) ) ( not ( = ?auto_1310208 ?auto_1310217 ) ) ( not ( = ?auto_1310209 ?auto_1310210 ) ) ( not ( = ?auto_1310209 ?auto_1310211 ) ) ( not ( = ?auto_1310209 ?auto_1310212 ) ) ( not ( = ?auto_1310209 ?auto_1310213 ) ) ( not ( = ?auto_1310209 ?auto_1310214 ) ) ( not ( = ?auto_1310209 ?auto_1310215 ) ) ( not ( = ?auto_1310209 ?auto_1310216 ) ) ( not ( = ?auto_1310209 ?auto_1310217 ) ) ( not ( = ?auto_1310210 ?auto_1310211 ) ) ( not ( = ?auto_1310210 ?auto_1310212 ) ) ( not ( = ?auto_1310210 ?auto_1310213 ) ) ( not ( = ?auto_1310210 ?auto_1310214 ) ) ( not ( = ?auto_1310210 ?auto_1310215 ) ) ( not ( = ?auto_1310210 ?auto_1310216 ) ) ( not ( = ?auto_1310210 ?auto_1310217 ) ) ( not ( = ?auto_1310211 ?auto_1310212 ) ) ( not ( = ?auto_1310211 ?auto_1310213 ) ) ( not ( = ?auto_1310211 ?auto_1310214 ) ) ( not ( = ?auto_1310211 ?auto_1310215 ) ) ( not ( = ?auto_1310211 ?auto_1310216 ) ) ( not ( = ?auto_1310211 ?auto_1310217 ) ) ( not ( = ?auto_1310212 ?auto_1310213 ) ) ( not ( = ?auto_1310212 ?auto_1310214 ) ) ( not ( = ?auto_1310212 ?auto_1310215 ) ) ( not ( = ?auto_1310212 ?auto_1310216 ) ) ( not ( = ?auto_1310212 ?auto_1310217 ) ) ( not ( = ?auto_1310213 ?auto_1310214 ) ) ( not ( = ?auto_1310213 ?auto_1310215 ) ) ( not ( = ?auto_1310213 ?auto_1310216 ) ) ( not ( = ?auto_1310213 ?auto_1310217 ) ) ( not ( = ?auto_1310214 ?auto_1310215 ) ) ( not ( = ?auto_1310214 ?auto_1310216 ) ) ( not ( = ?auto_1310214 ?auto_1310217 ) ) ( not ( = ?auto_1310215 ?auto_1310216 ) ) ( not ( = ?auto_1310215 ?auto_1310217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1310216 ?auto_1310217 )
      ( MAKE-13CRATE-VERIFY ?auto_1310204 ?auto_1310205 ?auto_1310206 ?auto_1310207 ?auto_1310208 ?auto_1310209 ?auto_1310210 ?auto_1310211 ?auto_1310212 ?auto_1310213 ?auto_1310214 ?auto_1310215 ?auto_1310216 ?auto_1310217 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310346 - SURFACE
      ?auto_1310347 - SURFACE
      ?auto_1310348 - SURFACE
      ?auto_1310349 - SURFACE
      ?auto_1310350 - SURFACE
      ?auto_1310351 - SURFACE
      ?auto_1310352 - SURFACE
      ?auto_1310353 - SURFACE
      ?auto_1310354 - SURFACE
      ?auto_1310355 - SURFACE
      ?auto_1310356 - SURFACE
      ?auto_1310357 - SURFACE
      ?auto_1310358 - SURFACE
      ?auto_1310359 - SURFACE
    )
    :vars
    (
      ?auto_1310362 - HOIST
      ?auto_1310361 - PLACE
      ?auto_1310360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310362 ?auto_1310361 ) ( SURFACE-AT ?auto_1310358 ?auto_1310361 ) ( CLEAR ?auto_1310358 ) ( IS-CRATE ?auto_1310359 ) ( not ( = ?auto_1310358 ?auto_1310359 ) ) ( TRUCK-AT ?auto_1310360 ?auto_1310361 ) ( AVAILABLE ?auto_1310362 ) ( IN ?auto_1310359 ?auto_1310360 ) ( ON ?auto_1310358 ?auto_1310357 ) ( not ( = ?auto_1310357 ?auto_1310358 ) ) ( not ( = ?auto_1310357 ?auto_1310359 ) ) ( ON ?auto_1310347 ?auto_1310346 ) ( ON ?auto_1310348 ?auto_1310347 ) ( ON ?auto_1310349 ?auto_1310348 ) ( ON ?auto_1310350 ?auto_1310349 ) ( ON ?auto_1310351 ?auto_1310350 ) ( ON ?auto_1310352 ?auto_1310351 ) ( ON ?auto_1310353 ?auto_1310352 ) ( ON ?auto_1310354 ?auto_1310353 ) ( ON ?auto_1310355 ?auto_1310354 ) ( ON ?auto_1310356 ?auto_1310355 ) ( ON ?auto_1310357 ?auto_1310356 ) ( not ( = ?auto_1310346 ?auto_1310347 ) ) ( not ( = ?auto_1310346 ?auto_1310348 ) ) ( not ( = ?auto_1310346 ?auto_1310349 ) ) ( not ( = ?auto_1310346 ?auto_1310350 ) ) ( not ( = ?auto_1310346 ?auto_1310351 ) ) ( not ( = ?auto_1310346 ?auto_1310352 ) ) ( not ( = ?auto_1310346 ?auto_1310353 ) ) ( not ( = ?auto_1310346 ?auto_1310354 ) ) ( not ( = ?auto_1310346 ?auto_1310355 ) ) ( not ( = ?auto_1310346 ?auto_1310356 ) ) ( not ( = ?auto_1310346 ?auto_1310357 ) ) ( not ( = ?auto_1310346 ?auto_1310358 ) ) ( not ( = ?auto_1310346 ?auto_1310359 ) ) ( not ( = ?auto_1310347 ?auto_1310348 ) ) ( not ( = ?auto_1310347 ?auto_1310349 ) ) ( not ( = ?auto_1310347 ?auto_1310350 ) ) ( not ( = ?auto_1310347 ?auto_1310351 ) ) ( not ( = ?auto_1310347 ?auto_1310352 ) ) ( not ( = ?auto_1310347 ?auto_1310353 ) ) ( not ( = ?auto_1310347 ?auto_1310354 ) ) ( not ( = ?auto_1310347 ?auto_1310355 ) ) ( not ( = ?auto_1310347 ?auto_1310356 ) ) ( not ( = ?auto_1310347 ?auto_1310357 ) ) ( not ( = ?auto_1310347 ?auto_1310358 ) ) ( not ( = ?auto_1310347 ?auto_1310359 ) ) ( not ( = ?auto_1310348 ?auto_1310349 ) ) ( not ( = ?auto_1310348 ?auto_1310350 ) ) ( not ( = ?auto_1310348 ?auto_1310351 ) ) ( not ( = ?auto_1310348 ?auto_1310352 ) ) ( not ( = ?auto_1310348 ?auto_1310353 ) ) ( not ( = ?auto_1310348 ?auto_1310354 ) ) ( not ( = ?auto_1310348 ?auto_1310355 ) ) ( not ( = ?auto_1310348 ?auto_1310356 ) ) ( not ( = ?auto_1310348 ?auto_1310357 ) ) ( not ( = ?auto_1310348 ?auto_1310358 ) ) ( not ( = ?auto_1310348 ?auto_1310359 ) ) ( not ( = ?auto_1310349 ?auto_1310350 ) ) ( not ( = ?auto_1310349 ?auto_1310351 ) ) ( not ( = ?auto_1310349 ?auto_1310352 ) ) ( not ( = ?auto_1310349 ?auto_1310353 ) ) ( not ( = ?auto_1310349 ?auto_1310354 ) ) ( not ( = ?auto_1310349 ?auto_1310355 ) ) ( not ( = ?auto_1310349 ?auto_1310356 ) ) ( not ( = ?auto_1310349 ?auto_1310357 ) ) ( not ( = ?auto_1310349 ?auto_1310358 ) ) ( not ( = ?auto_1310349 ?auto_1310359 ) ) ( not ( = ?auto_1310350 ?auto_1310351 ) ) ( not ( = ?auto_1310350 ?auto_1310352 ) ) ( not ( = ?auto_1310350 ?auto_1310353 ) ) ( not ( = ?auto_1310350 ?auto_1310354 ) ) ( not ( = ?auto_1310350 ?auto_1310355 ) ) ( not ( = ?auto_1310350 ?auto_1310356 ) ) ( not ( = ?auto_1310350 ?auto_1310357 ) ) ( not ( = ?auto_1310350 ?auto_1310358 ) ) ( not ( = ?auto_1310350 ?auto_1310359 ) ) ( not ( = ?auto_1310351 ?auto_1310352 ) ) ( not ( = ?auto_1310351 ?auto_1310353 ) ) ( not ( = ?auto_1310351 ?auto_1310354 ) ) ( not ( = ?auto_1310351 ?auto_1310355 ) ) ( not ( = ?auto_1310351 ?auto_1310356 ) ) ( not ( = ?auto_1310351 ?auto_1310357 ) ) ( not ( = ?auto_1310351 ?auto_1310358 ) ) ( not ( = ?auto_1310351 ?auto_1310359 ) ) ( not ( = ?auto_1310352 ?auto_1310353 ) ) ( not ( = ?auto_1310352 ?auto_1310354 ) ) ( not ( = ?auto_1310352 ?auto_1310355 ) ) ( not ( = ?auto_1310352 ?auto_1310356 ) ) ( not ( = ?auto_1310352 ?auto_1310357 ) ) ( not ( = ?auto_1310352 ?auto_1310358 ) ) ( not ( = ?auto_1310352 ?auto_1310359 ) ) ( not ( = ?auto_1310353 ?auto_1310354 ) ) ( not ( = ?auto_1310353 ?auto_1310355 ) ) ( not ( = ?auto_1310353 ?auto_1310356 ) ) ( not ( = ?auto_1310353 ?auto_1310357 ) ) ( not ( = ?auto_1310353 ?auto_1310358 ) ) ( not ( = ?auto_1310353 ?auto_1310359 ) ) ( not ( = ?auto_1310354 ?auto_1310355 ) ) ( not ( = ?auto_1310354 ?auto_1310356 ) ) ( not ( = ?auto_1310354 ?auto_1310357 ) ) ( not ( = ?auto_1310354 ?auto_1310358 ) ) ( not ( = ?auto_1310354 ?auto_1310359 ) ) ( not ( = ?auto_1310355 ?auto_1310356 ) ) ( not ( = ?auto_1310355 ?auto_1310357 ) ) ( not ( = ?auto_1310355 ?auto_1310358 ) ) ( not ( = ?auto_1310355 ?auto_1310359 ) ) ( not ( = ?auto_1310356 ?auto_1310357 ) ) ( not ( = ?auto_1310356 ?auto_1310358 ) ) ( not ( = ?auto_1310356 ?auto_1310359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310357 ?auto_1310358 ?auto_1310359 )
      ( MAKE-13CRATE-VERIFY ?auto_1310346 ?auto_1310347 ?auto_1310348 ?auto_1310349 ?auto_1310350 ?auto_1310351 ?auto_1310352 ?auto_1310353 ?auto_1310354 ?auto_1310355 ?auto_1310356 ?auto_1310357 ?auto_1310358 ?auto_1310359 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310502 - SURFACE
      ?auto_1310503 - SURFACE
      ?auto_1310504 - SURFACE
      ?auto_1310505 - SURFACE
      ?auto_1310506 - SURFACE
      ?auto_1310507 - SURFACE
      ?auto_1310508 - SURFACE
      ?auto_1310509 - SURFACE
      ?auto_1310510 - SURFACE
      ?auto_1310511 - SURFACE
      ?auto_1310512 - SURFACE
      ?auto_1310513 - SURFACE
      ?auto_1310514 - SURFACE
      ?auto_1310515 - SURFACE
    )
    :vars
    (
      ?auto_1310517 - HOIST
      ?auto_1310518 - PLACE
      ?auto_1310519 - TRUCK
      ?auto_1310516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310517 ?auto_1310518 ) ( SURFACE-AT ?auto_1310514 ?auto_1310518 ) ( CLEAR ?auto_1310514 ) ( IS-CRATE ?auto_1310515 ) ( not ( = ?auto_1310514 ?auto_1310515 ) ) ( AVAILABLE ?auto_1310517 ) ( IN ?auto_1310515 ?auto_1310519 ) ( ON ?auto_1310514 ?auto_1310513 ) ( not ( = ?auto_1310513 ?auto_1310514 ) ) ( not ( = ?auto_1310513 ?auto_1310515 ) ) ( TRUCK-AT ?auto_1310519 ?auto_1310516 ) ( not ( = ?auto_1310516 ?auto_1310518 ) ) ( ON ?auto_1310503 ?auto_1310502 ) ( ON ?auto_1310504 ?auto_1310503 ) ( ON ?auto_1310505 ?auto_1310504 ) ( ON ?auto_1310506 ?auto_1310505 ) ( ON ?auto_1310507 ?auto_1310506 ) ( ON ?auto_1310508 ?auto_1310507 ) ( ON ?auto_1310509 ?auto_1310508 ) ( ON ?auto_1310510 ?auto_1310509 ) ( ON ?auto_1310511 ?auto_1310510 ) ( ON ?auto_1310512 ?auto_1310511 ) ( ON ?auto_1310513 ?auto_1310512 ) ( not ( = ?auto_1310502 ?auto_1310503 ) ) ( not ( = ?auto_1310502 ?auto_1310504 ) ) ( not ( = ?auto_1310502 ?auto_1310505 ) ) ( not ( = ?auto_1310502 ?auto_1310506 ) ) ( not ( = ?auto_1310502 ?auto_1310507 ) ) ( not ( = ?auto_1310502 ?auto_1310508 ) ) ( not ( = ?auto_1310502 ?auto_1310509 ) ) ( not ( = ?auto_1310502 ?auto_1310510 ) ) ( not ( = ?auto_1310502 ?auto_1310511 ) ) ( not ( = ?auto_1310502 ?auto_1310512 ) ) ( not ( = ?auto_1310502 ?auto_1310513 ) ) ( not ( = ?auto_1310502 ?auto_1310514 ) ) ( not ( = ?auto_1310502 ?auto_1310515 ) ) ( not ( = ?auto_1310503 ?auto_1310504 ) ) ( not ( = ?auto_1310503 ?auto_1310505 ) ) ( not ( = ?auto_1310503 ?auto_1310506 ) ) ( not ( = ?auto_1310503 ?auto_1310507 ) ) ( not ( = ?auto_1310503 ?auto_1310508 ) ) ( not ( = ?auto_1310503 ?auto_1310509 ) ) ( not ( = ?auto_1310503 ?auto_1310510 ) ) ( not ( = ?auto_1310503 ?auto_1310511 ) ) ( not ( = ?auto_1310503 ?auto_1310512 ) ) ( not ( = ?auto_1310503 ?auto_1310513 ) ) ( not ( = ?auto_1310503 ?auto_1310514 ) ) ( not ( = ?auto_1310503 ?auto_1310515 ) ) ( not ( = ?auto_1310504 ?auto_1310505 ) ) ( not ( = ?auto_1310504 ?auto_1310506 ) ) ( not ( = ?auto_1310504 ?auto_1310507 ) ) ( not ( = ?auto_1310504 ?auto_1310508 ) ) ( not ( = ?auto_1310504 ?auto_1310509 ) ) ( not ( = ?auto_1310504 ?auto_1310510 ) ) ( not ( = ?auto_1310504 ?auto_1310511 ) ) ( not ( = ?auto_1310504 ?auto_1310512 ) ) ( not ( = ?auto_1310504 ?auto_1310513 ) ) ( not ( = ?auto_1310504 ?auto_1310514 ) ) ( not ( = ?auto_1310504 ?auto_1310515 ) ) ( not ( = ?auto_1310505 ?auto_1310506 ) ) ( not ( = ?auto_1310505 ?auto_1310507 ) ) ( not ( = ?auto_1310505 ?auto_1310508 ) ) ( not ( = ?auto_1310505 ?auto_1310509 ) ) ( not ( = ?auto_1310505 ?auto_1310510 ) ) ( not ( = ?auto_1310505 ?auto_1310511 ) ) ( not ( = ?auto_1310505 ?auto_1310512 ) ) ( not ( = ?auto_1310505 ?auto_1310513 ) ) ( not ( = ?auto_1310505 ?auto_1310514 ) ) ( not ( = ?auto_1310505 ?auto_1310515 ) ) ( not ( = ?auto_1310506 ?auto_1310507 ) ) ( not ( = ?auto_1310506 ?auto_1310508 ) ) ( not ( = ?auto_1310506 ?auto_1310509 ) ) ( not ( = ?auto_1310506 ?auto_1310510 ) ) ( not ( = ?auto_1310506 ?auto_1310511 ) ) ( not ( = ?auto_1310506 ?auto_1310512 ) ) ( not ( = ?auto_1310506 ?auto_1310513 ) ) ( not ( = ?auto_1310506 ?auto_1310514 ) ) ( not ( = ?auto_1310506 ?auto_1310515 ) ) ( not ( = ?auto_1310507 ?auto_1310508 ) ) ( not ( = ?auto_1310507 ?auto_1310509 ) ) ( not ( = ?auto_1310507 ?auto_1310510 ) ) ( not ( = ?auto_1310507 ?auto_1310511 ) ) ( not ( = ?auto_1310507 ?auto_1310512 ) ) ( not ( = ?auto_1310507 ?auto_1310513 ) ) ( not ( = ?auto_1310507 ?auto_1310514 ) ) ( not ( = ?auto_1310507 ?auto_1310515 ) ) ( not ( = ?auto_1310508 ?auto_1310509 ) ) ( not ( = ?auto_1310508 ?auto_1310510 ) ) ( not ( = ?auto_1310508 ?auto_1310511 ) ) ( not ( = ?auto_1310508 ?auto_1310512 ) ) ( not ( = ?auto_1310508 ?auto_1310513 ) ) ( not ( = ?auto_1310508 ?auto_1310514 ) ) ( not ( = ?auto_1310508 ?auto_1310515 ) ) ( not ( = ?auto_1310509 ?auto_1310510 ) ) ( not ( = ?auto_1310509 ?auto_1310511 ) ) ( not ( = ?auto_1310509 ?auto_1310512 ) ) ( not ( = ?auto_1310509 ?auto_1310513 ) ) ( not ( = ?auto_1310509 ?auto_1310514 ) ) ( not ( = ?auto_1310509 ?auto_1310515 ) ) ( not ( = ?auto_1310510 ?auto_1310511 ) ) ( not ( = ?auto_1310510 ?auto_1310512 ) ) ( not ( = ?auto_1310510 ?auto_1310513 ) ) ( not ( = ?auto_1310510 ?auto_1310514 ) ) ( not ( = ?auto_1310510 ?auto_1310515 ) ) ( not ( = ?auto_1310511 ?auto_1310512 ) ) ( not ( = ?auto_1310511 ?auto_1310513 ) ) ( not ( = ?auto_1310511 ?auto_1310514 ) ) ( not ( = ?auto_1310511 ?auto_1310515 ) ) ( not ( = ?auto_1310512 ?auto_1310513 ) ) ( not ( = ?auto_1310512 ?auto_1310514 ) ) ( not ( = ?auto_1310512 ?auto_1310515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310513 ?auto_1310514 ?auto_1310515 )
      ( MAKE-13CRATE-VERIFY ?auto_1310502 ?auto_1310503 ?auto_1310504 ?auto_1310505 ?auto_1310506 ?auto_1310507 ?auto_1310508 ?auto_1310509 ?auto_1310510 ?auto_1310511 ?auto_1310512 ?auto_1310513 ?auto_1310514 ?auto_1310515 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310671 - SURFACE
      ?auto_1310672 - SURFACE
      ?auto_1310673 - SURFACE
      ?auto_1310674 - SURFACE
      ?auto_1310675 - SURFACE
      ?auto_1310676 - SURFACE
      ?auto_1310677 - SURFACE
      ?auto_1310678 - SURFACE
      ?auto_1310679 - SURFACE
      ?auto_1310680 - SURFACE
      ?auto_1310681 - SURFACE
      ?auto_1310682 - SURFACE
      ?auto_1310683 - SURFACE
      ?auto_1310684 - SURFACE
    )
    :vars
    (
      ?auto_1310686 - HOIST
      ?auto_1310685 - PLACE
      ?auto_1310689 - TRUCK
      ?auto_1310688 - PLACE
      ?auto_1310687 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310686 ?auto_1310685 ) ( SURFACE-AT ?auto_1310683 ?auto_1310685 ) ( CLEAR ?auto_1310683 ) ( IS-CRATE ?auto_1310684 ) ( not ( = ?auto_1310683 ?auto_1310684 ) ) ( AVAILABLE ?auto_1310686 ) ( ON ?auto_1310683 ?auto_1310682 ) ( not ( = ?auto_1310682 ?auto_1310683 ) ) ( not ( = ?auto_1310682 ?auto_1310684 ) ) ( TRUCK-AT ?auto_1310689 ?auto_1310688 ) ( not ( = ?auto_1310688 ?auto_1310685 ) ) ( HOIST-AT ?auto_1310687 ?auto_1310688 ) ( LIFTING ?auto_1310687 ?auto_1310684 ) ( not ( = ?auto_1310686 ?auto_1310687 ) ) ( ON ?auto_1310672 ?auto_1310671 ) ( ON ?auto_1310673 ?auto_1310672 ) ( ON ?auto_1310674 ?auto_1310673 ) ( ON ?auto_1310675 ?auto_1310674 ) ( ON ?auto_1310676 ?auto_1310675 ) ( ON ?auto_1310677 ?auto_1310676 ) ( ON ?auto_1310678 ?auto_1310677 ) ( ON ?auto_1310679 ?auto_1310678 ) ( ON ?auto_1310680 ?auto_1310679 ) ( ON ?auto_1310681 ?auto_1310680 ) ( ON ?auto_1310682 ?auto_1310681 ) ( not ( = ?auto_1310671 ?auto_1310672 ) ) ( not ( = ?auto_1310671 ?auto_1310673 ) ) ( not ( = ?auto_1310671 ?auto_1310674 ) ) ( not ( = ?auto_1310671 ?auto_1310675 ) ) ( not ( = ?auto_1310671 ?auto_1310676 ) ) ( not ( = ?auto_1310671 ?auto_1310677 ) ) ( not ( = ?auto_1310671 ?auto_1310678 ) ) ( not ( = ?auto_1310671 ?auto_1310679 ) ) ( not ( = ?auto_1310671 ?auto_1310680 ) ) ( not ( = ?auto_1310671 ?auto_1310681 ) ) ( not ( = ?auto_1310671 ?auto_1310682 ) ) ( not ( = ?auto_1310671 ?auto_1310683 ) ) ( not ( = ?auto_1310671 ?auto_1310684 ) ) ( not ( = ?auto_1310672 ?auto_1310673 ) ) ( not ( = ?auto_1310672 ?auto_1310674 ) ) ( not ( = ?auto_1310672 ?auto_1310675 ) ) ( not ( = ?auto_1310672 ?auto_1310676 ) ) ( not ( = ?auto_1310672 ?auto_1310677 ) ) ( not ( = ?auto_1310672 ?auto_1310678 ) ) ( not ( = ?auto_1310672 ?auto_1310679 ) ) ( not ( = ?auto_1310672 ?auto_1310680 ) ) ( not ( = ?auto_1310672 ?auto_1310681 ) ) ( not ( = ?auto_1310672 ?auto_1310682 ) ) ( not ( = ?auto_1310672 ?auto_1310683 ) ) ( not ( = ?auto_1310672 ?auto_1310684 ) ) ( not ( = ?auto_1310673 ?auto_1310674 ) ) ( not ( = ?auto_1310673 ?auto_1310675 ) ) ( not ( = ?auto_1310673 ?auto_1310676 ) ) ( not ( = ?auto_1310673 ?auto_1310677 ) ) ( not ( = ?auto_1310673 ?auto_1310678 ) ) ( not ( = ?auto_1310673 ?auto_1310679 ) ) ( not ( = ?auto_1310673 ?auto_1310680 ) ) ( not ( = ?auto_1310673 ?auto_1310681 ) ) ( not ( = ?auto_1310673 ?auto_1310682 ) ) ( not ( = ?auto_1310673 ?auto_1310683 ) ) ( not ( = ?auto_1310673 ?auto_1310684 ) ) ( not ( = ?auto_1310674 ?auto_1310675 ) ) ( not ( = ?auto_1310674 ?auto_1310676 ) ) ( not ( = ?auto_1310674 ?auto_1310677 ) ) ( not ( = ?auto_1310674 ?auto_1310678 ) ) ( not ( = ?auto_1310674 ?auto_1310679 ) ) ( not ( = ?auto_1310674 ?auto_1310680 ) ) ( not ( = ?auto_1310674 ?auto_1310681 ) ) ( not ( = ?auto_1310674 ?auto_1310682 ) ) ( not ( = ?auto_1310674 ?auto_1310683 ) ) ( not ( = ?auto_1310674 ?auto_1310684 ) ) ( not ( = ?auto_1310675 ?auto_1310676 ) ) ( not ( = ?auto_1310675 ?auto_1310677 ) ) ( not ( = ?auto_1310675 ?auto_1310678 ) ) ( not ( = ?auto_1310675 ?auto_1310679 ) ) ( not ( = ?auto_1310675 ?auto_1310680 ) ) ( not ( = ?auto_1310675 ?auto_1310681 ) ) ( not ( = ?auto_1310675 ?auto_1310682 ) ) ( not ( = ?auto_1310675 ?auto_1310683 ) ) ( not ( = ?auto_1310675 ?auto_1310684 ) ) ( not ( = ?auto_1310676 ?auto_1310677 ) ) ( not ( = ?auto_1310676 ?auto_1310678 ) ) ( not ( = ?auto_1310676 ?auto_1310679 ) ) ( not ( = ?auto_1310676 ?auto_1310680 ) ) ( not ( = ?auto_1310676 ?auto_1310681 ) ) ( not ( = ?auto_1310676 ?auto_1310682 ) ) ( not ( = ?auto_1310676 ?auto_1310683 ) ) ( not ( = ?auto_1310676 ?auto_1310684 ) ) ( not ( = ?auto_1310677 ?auto_1310678 ) ) ( not ( = ?auto_1310677 ?auto_1310679 ) ) ( not ( = ?auto_1310677 ?auto_1310680 ) ) ( not ( = ?auto_1310677 ?auto_1310681 ) ) ( not ( = ?auto_1310677 ?auto_1310682 ) ) ( not ( = ?auto_1310677 ?auto_1310683 ) ) ( not ( = ?auto_1310677 ?auto_1310684 ) ) ( not ( = ?auto_1310678 ?auto_1310679 ) ) ( not ( = ?auto_1310678 ?auto_1310680 ) ) ( not ( = ?auto_1310678 ?auto_1310681 ) ) ( not ( = ?auto_1310678 ?auto_1310682 ) ) ( not ( = ?auto_1310678 ?auto_1310683 ) ) ( not ( = ?auto_1310678 ?auto_1310684 ) ) ( not ( = ?auto_1310679 ?auto_1310680 ) ) ( not ( = ?auto_1310679 ?auto_1310681 ) ) ( not ( = ?auto_1310679 ?auto_1310682 ) ) ( not ( = ?auto_1310679 ?auto_1310683 ) ) ( not ( = ?auto_1310679 ?auto_1310684 ) ) ( not ( = ?auto_1310680 ?auto_1310681 ) ) ( not ( = ?auto_1310680 ?auto_1310682 ) ) ( not ( = ?auto_1310680 ?auto_1310683 ) ) ( not ( = ?auto_1310680 ?auto_1310684 ) ) ( not ( = ?auto_1310681 ?auto_1310682 ) ) ( not ( = ?auto_1310681 ?auto_1310683 ) ) ( not ( = ?auto_1310681 ?auto_1310684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310682 ?auto_1310683 ?auto_1310684 )
      ( MAKE-13CRATE-VERIFY ?auto_1310671 ?auto_1310672 ?auto_1310673 ?auto_1310674 ?auto_1310675 ?auto_1310676 ?auto_1310677 ?auto_1310678 ?auto_1310679 ?auto_1310680 ?auto_1310681 ?auto_1310682 ?auto_1310683 ?auto_1310684 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310853 - SURFACE
      ?auto_1310854 - SURFACE
      ?auto_1310855 - SURFACE
      ?auto_1310856 - SURFACE
      ?auto_1310857 - SURFACE
      ?auto_1310858 - SURFACE
      ?auto_1310859 - SURFACE
      ?auto_1310860 - SURFACE
      ?auto_1310861 - SURFACE
      ?auto_1310862 - SURFACE
      ?auto_1310863 - SURFACE
      ?auto_1310864 - SURFACE
      ?auto_1310865 - SURFACE
      ?auto_1310866 - SURFACE
    )
    :vars
    (
      ?auto_1310868 - HOIST
      ?auto_1310872 - PLACE
      ?auto_1310870 - TRUCK
      ?auto_1310867 - PLACE
      ?auto_1310869 - HOIST
      ?auto_1310871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310868 ?auto_1310872 ) ( SURFACE-AT ?auto_1310865 ?auto_1310872 ) ( CLEAR ?auto_1310865 ) ( IS-CRATE ?auto_1310866 ) ( not ( = ?auto_1310865 ?auto_1310866 ) ) ( AVAILABLE ?auto_1310868 ) ( ON ?auto_1310865 ?auto_1310864 ) ( not ( = ?auto_1310864 ?auto_1310865 ) ) ( not ( = ?auto_1310864 ?auto_1310866 ) ) ( TRUCK-AT ?auto_1310870 ?auto_1310867 ) ( not ( = ?auto_1310867 ?auto_1310872 ) ) ( HOIST-AT ?auto_1310869 ?auto_1310867 ) ( not ( = ?auto_1310868 ?auto_1310869 ) ) ( AVAILABLE ?auto_1310869 ) ( SURFACE-AT ?auto_1310866 ?auto_1310867 ) ( ON ?auto_1310866 ?auto_1310871 ) ( CLEAR ?auto_1310866 ) ( not ( = ?auto_1310865 ?auto_1310871 ) ) ( not ( = ?auto_1310866 ?auto_1310871 ) ) ( not ( = ?auto_1310864 ?auto_1310871 ) ) ( ON ?auto_1310854 ?auto_1310853 ) ( ON ?auto_1310855 ?auto_1310854 ) ( ON ?auto_1310856 ?auto_1310855 ) ( ON ?auto_1310857 ?auto_1310856 ) ( ON ?auto_1310858 ?auto_1310857 ) ( ON ?auto_1310859 ?auto_1310858 ) ( ON ?auto_1310860 ?auto_1310859 ) ( ON ?auto_1310861 ?auto_1310860 ) ( ON ?auto_1310862 ?auto_1310861 ) ( ON ?auto_1310863 ?auto_1310862 ) ( ON ?auto_1310864 ?auto_1310863 ) ( not ( = ?auto_1310853 ?auto_1310854 ) ) ( not ( = ?auto_1310853 ?auto_1310855 ) ) ( not ( = ?auto_1310853 ?auto_1310856 ) ) ( not ( = ?auto_1310853 ?auto_1310857 ) ) ( not ( = ?auto_1310853 ?auto_1310858 ) ) ( not ( = ?auto_1310853 ?auto_1310859 ) ) ( not ( = ?auto_1310853 ?auto_1310860 ) ) ( not ( = ?auto_1310853 ?auto_1310861 ) ) ( not ( = ?auto_1310853 ?auto_1310862 ) ) ( not ( = ?auto_1310853 ?auto_1310863 ) ) ( not ( = ?auto_1310853 ?auto_1310864 ) ) ( not ( = ?auto_1310853 ?auto_1310865 ) ) ( not ( = ?auto_1310853 ?auto_1310866 ) ) ( not ( = ?auto_1310853 ?auto_1310871 ) ) ( not ( = ?auto_1310854 ?auto_1310855 ) ) ( not ( = ?auto_1310854 ?auto_1310856 ) ) ( not ( = ?auto_1310854 ?auto_1310857 ) ) ( not ( = ?auto_1310854 ?auto_1310858 ) ) ( not ( = ?auto_1310854 ?auto_1310859 ) ) ( not ( = ?auto_1310854 ?auto_1310860 ) ) ( not ( = ?auto_1310854 ?auto_1310861 ) ) ( not ( = ?auto_1310854 ?auto_1310862 ) ) ( not ( = ?auto_1310854 ?auto_1310863 ) ) ( not ( = ?auto_1310854 ?auto_1310864 ) ) ( not ( = ?auto_1310854 ?auto_1310865 ) ) ( not ( = ?auto_1310854 ?auto_1310866 ) ) ( not ( = ?auto_1310854 ?auto_1310871 ) ) ( not ( = ?auto_1310855 ?auto_1310856 ) ) ( not ( = ?auto_1310855 ?auto_1310857 ) ) ( not ( = ?auto_1310855 ?auto_1310858 ) ) ( not ( = ?auto_1310855 ?auto_1310859 ) ) ( not ( = ?auto_1310855 ?auto_1310860 ) ) ( not ( = ?auto_1310855 ?auto_1310861 ) ) ( not ( = ?auto_1310855 ?auto_1310862 ) ) ( not ( = ?auto_1310855 ?auto_1310863 ) ) ( not ( = ?auto_1310855 ?auto_1310864 ) ) ( not ( = ?auto_1310855 ?auto_1310865 ) ) ( not ( = ?auto_1310855 ?auto_1310866 ) ) ( not ( = ?auto_1310855 ?auto_1310871 ) ) ( not ( = ?auto_1310856 ?auto_1310857 ) ) ( not ( = ?auto_1310856 ?auto_1310858 ) ) ( not ( = ?auto_1310856 ?auto_1310859 ) ) ( not ( = ?auto_1310856 ?auto_1310860 ) ) ( not ( = ?auto_1310856 ?auto_1310861 ) ) ( not ( = ?auto_1310856 ?auto_1310862 ) ) ( not ( = ?auto_1310856 ?auto_1310863 ) ) ( not ( = ?auto_1310856 ?auto_1310864 ) ) ( not ( = ?auto_1310856 ?auto_1310865 ) ) ( not ( = ?auto_1310856 ?auto_1310866 ) ) ( not ( = ?auto_1310856 ?auto_1310871 ) ) ( not ( = ?auto_1310857 ?auto_1310858 ) ) ( not ( = ?auto_1310857 ?auto_1310859 ) ) ( not ( = ?auto_1310857 ?auto_1310860 ) ) ( not ( = ?auto_1310857 ?auto_1310861 ) ) ( not ( = ?auto_1310857 ?auto_1310862 ) ) ( not ( = ?auto_1310857 ?auto_1310863 ) ) ( not ( = ?auto_1310857 ?auto_1310864 ) ) ( not ( = ?auto_1310857 ?auto_1310865 ) ) ( not ( = ?auto_1310857 ?auto_1310866 ) ) ( not ( = ?auto_1310857 ?auto_1310871 ) ) ( not ( = ?auto_1310858 ?auto_1310859 ) ) ( not ( = ?auto_1310858 ?auto_1310860 ) ) ( not ( = ?auto_1310858 ?auto_1310861 ) ) ( not ( = ?auto_1310858 ?auto_1310862 ) ) ( not ( = ?auto_1310858 ?auto_1310863 ) ) ( not ( = ?auto_1310858 ?auto_1310864 ) ) ( not ( = ?auto_1310858 ?auto_1310865 ) ) ( not ( = ?auto_1310858 ?auto_1310866 ) ) ( not ( = ?auto_1310858 ?auto_1310871 ) ) ( not ( = ?auto_1310859 ?auto_1310860 ) ) ( not ( = ?auto_1310859 ?auto_1310861 ) ) ( not ( = ?auto_1310859 ?auto_1310862 ) ) ( not ( = ?auto_1310859 ?auto_1310863 ) ) ( not ( = ?auto_1310859 ?auto_1310864 ) ) ( not ( = ?auto_1310859 ?auto_1310865 ) ) ( not ( = ?auto_1310859 ?auto_1310866 ) ) ( not ( = ?auto_1310859 ?auto_1310871 ) ) ( not ( = ?auto_1310860 ?auto_1310861 ) ) ( not ( = ?auto_1310860 ?auto_1310862 ) ) ( not ( = ?auto_1310860 ?auto_1310863 ) ) ( not ( = ?auto_1310860 ?auto_1310864 ) ) ( not ( = ?auto_1310860 ?auto_1310865 ) ) ( not ( = ?auto_1310860 ?auto_1310866 ) ) ( not ( = ?auto_1310860 ?auto_1310871 ) ) ( not ( = ?auto_1310861 ?auto_1310862 ) ) ( not ( = ?auto_1310861 ?auto_1310863 ) ) ( not ( = ?auto_1310861 ?auto_1310864 ) ) ( not ( = ?auto_1310861 ?auto_1310865 ) ) ( not ( = ?auto_1310861 ?auto_1310866 ) ) ( not ( = ?auto_1310861 ?auto_1310871 ) ) ( not ( = ?auto_1310862 ?auto_1310863 ) ) ( not ( = ?auto_1310862 ?auto_1310864 ) ) ( not ( = ?auto_1310862 ?auto_1310865 ) ) ( not ( = ?auto_1310862 ?auto_1310866 ) ) ( not ( = ?auto_1310862 ?auto_1310871 ) ) ( not ( = ?auto_1310863 ?auto_1310864 ) ) ( not ( = ?auto_1310863 ?auto_1310865 ) ) ( not ( = ?auto_1310863 ?auto_1310866 ) ) ( not ( = ?auto_1310863 ?auto_1310871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310864 ?auto_1310865 ?auto_1310866 )
      ( MAKE-13CRATE-VERIFY ?auto_1310853 ?auto_1310854 ?auto_1310855 ?auto_1310856 ?auto_1310857 ?auto_1310858 ?auto_1310859 ?auto_1310860 ?auto_1310861 ?auto_1310862 ?auto_1310863 ?auto_1310864 ?auto_1310865 ?auto_1310866 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311036 - SURFACE
      ?auto_1311037 - SURFACE
      ?auto_1311038 - SURFACE
      ?auto_1311039 - SURFACE
      ?auto_1311040 - SURFACE
      ?auto_1311041 - SURFACE
      ?auto_1311042 - SURFACE
      ?auto_1311043 - SURFACE
      ?auto_1311044 - SURFACE
      ?auto_1311045 - SURFACE
      ?auto_1311046 - SURFACE
      ?auto_1311047 - SURFACE
      ?auto_1311048 - SURFACE
      ?auto_1311049 - SURFACE
    )
    :vars
    (
      ?auto_1311054 - HOIST
      ?auto_1311050 - PLACE
      ?auto_1311052 - PLACE
      ?auto_1311053 - HOIST
      ?auto_1311051 - SURFACE
      ?auto_1311055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311054 ?auto_1311050 ) ( SURFACE-AT ?auto_1311048 ?auto_1311050 ) ( CLEAR ?auto_1311048 ) ( IS-CRATE ?auto_1311049 ) ( not ( = ?auto_1311048 ?auto_1311049 ) ) ( AVAILABLE ?auto_1311054 ) ( ON ?auto_1311048 ?auto_1311047 ) ( not ( = ?auto_1311047 ?auto_1311048 ) ) ( not ( = ?auto_1311047 ?auto_1311049 ) ) ( not ( = ?auto_1311052 ?auto_1311050 ) ) ( HOIST-AT ?auto_1311053 ?auto_1311052 ) ( not ( = ?auto_1311054 ?auto_1311053 ) ) ( AVAILABLE ?auto_1311053 ) ( SURFACE-AT ?auto_1311049 ?auto_1311052 ) ( ON ?auto_1311049 ?auto_1311051 ) ( CLEAR ?auto_1311049 ) ( not ( = ?auto_1311048 ?auto_1311051 ) ) ( not ( = ?auto_1311049 ?auto_1311051 ) ) ( not ( = ?auto_1311047 ?auto_1311051 ) ) ( TRUCK-AT ?auto_1311055 ?auto_1311050 ) ( ON ?auto_1311037 ?auto_1311036 ) ( ON ?auto_1311038 ?auto_1311037 ) ( ON ?auto_1311039 ?auto_1311038 ) ( ON ?auto_1311040 ?auto_1311039 ) ( ON ?auto_1311041 ?auto_1311040 ) ( ON ?auto_1311042 ?auto_1311041 ) ( ON ?auto_1311043 ?auto_1311042 ) ( ON ?auto_1311044 ?auto_1311043 ) ( ON ?auto_1311045 ?auto_1311044 ) ( ON ?auto_1311046 ?auto_1311045 ) ( ON ?auto_1311047 ?auto_1311046 ) ( not ( = ?auto_1311036 ?auto_1311037 ) ) ( not ( = ?auto_1311036 ?auto_1311038 ) ) ( not ( = ?auto_1311036 ?auto_1311039 ) ) ( not ( = ?auto_1311036 ?auto_1311040 ) ) ( not ( = ?auto_1311036 ?auto_1311041 ) ) ( not ( = ?auto_1311036 ?auto_1311042 ) ) ( not ( = ?auto_1311036 ?auto_1311043 ) ) ( not ( = ?auto_1311036 ?auto_1311044 ) ) ( not ( = ?auto_1311036 ?auto_1311045 ) ) ( not ( = ?auto_1311036 ?auto_1311046 ) ) ( not ( = ?auto_1311036 ?auto_1311047 ) ) ( not ( = ?auto_1311036 ?auto_1311048 ) ) ( not ( = ?auto_1311036 ?auto_1311049 ) ) ( not ( = ?auto_1311036 ?auto_1311051 ) ) ( not ( = ?auto_1311037 ?auto_1311038 ) ) ( not ( = ?auto_1311037 ?auto_1311039 ) ) ( not ( = ?auto_1311037 ?auto_1311040 ) ) ( not ( = ?auto_1311037 ?auto_1311041 ) ) ( not ( = ?auto_1311037 ?auto_1311042 ) ) ( not ( = ?auto_1311037 ?auto_1311043 ) ) ( not ( = ?auto_1311037 ?auto_1311044 ) ) ( not ( = ?auto_1311037 ?auto_1311045 ) ) ( not ( = ?auto_1311037 ?auto_1311046 ) ) ( not ( = ?auto_1311037 ?auto_1311047 ) ) ( not ( = ?auto_1311037 ?auto_1311048 ) ) ( not ( = ?auto_1311037 ?auto_1311049 ) ) ( not ( = ?auto_1311037 ?auto_1311051 ) ) ( not ( = ?auto_1311038 ?auto_1311039 ) ) ( not ( = ?auto_1311038 ?auto_1311040 ) ) ( not ( = ?auto_1311038 ?auto_1311041 ) ) ( not ( = ?auto_1311038 ?auto_1311042 ) ) ( not ( = ?auto_1311038 ?auto_1311043 ) ) ( not ( = ?auto_1311038 ?auto_1311044 ) ) ( not ( = ?auto_1311038 ?auto_1311045 ) ) ( not ( = ?auto_1311038 ?auto_1311046 ) ) ( not ( = ?auto_1311038 ?auto_1311047 ) ) ( not ( = ?auto_1311038 ?auto_1311048 ) ) ( not ( = ?auto_1311038 ?auto_1311049 ) ) ( not ( = ?auto_1311038 ?auto_1311051 ) ) ( not ( = ?auto_1311039 ?auto_1311040 ) ) ( not ( = ?auto_1311039 ?auto_1311041 ) ) ( not ( = ?auto_1311039 ?auto_1311042 ) ) ( not ( = ?auto_1311039 ?auto_1311043 ) ) ( not ( = ?auto_1311039 ?auto_1311044 ) ) ( not ( = ?auto_1311039 ?auto_1311045 ) ) ( not ( = ?auto_1311039 ?auto_1311046 ) ) ( not ( = ?auto_1311039 ?auto_1311047 ) ) ( not ( = ?auto_1311039 ?auto_1311048 ) ) ( not ( = ?auto_1311039 ?auto_1311049 ) ) ( not ( = ?auto_1311039 ?auto_1311051 ) ) ( not ( = ?auto_1311040 ?auto_1311041 ) ) ( not ( = ?auto_1311040 ?auto_1311042 ) ) ( not ( = ?auto_1311040 ?auto_1311043 ) ) ( not ( = ?auto_1311040 ?auto_1311044 ) ) ( not ( = ?auto_1311040 ?auto_1311045 ) ) ( not ( = ?auto_1311040 ?auto_1311046 ) ) ( not ( = ?auto_1311040 ?auto_1311047 ) ) ( not ( = ?auto_1311040 ?auto_1311048 ) ) ( not ( = ?auto_1311040 ?auto_1311049 ) ) ( not ( = ?auto_1311040 ?auto_1311051 ) ) ( not ( = ?auto_1311041 ?auto_1311042 ) ) ( not ( = ?auto_1311041 ?auto_1311043 ) ) ( not ( = ?auto_1311041 ?auto_1311044 ) ) ( not ( = ?auto_1311041 ?auto_1311045 ) ) ( not ( = ?auto_1311041 ?auto_1311046 ) ) ( not ( = ?auto_1311041 ?auto_1311047 ) ) ( not ( = ?auto_1311041 ?auto_1311048 ) ) ( not ( = ?auto_1311041 ?auto_1311049 ) ) ( not ( = ?auto_1311041 ?auto_1311051 ) ) ( not ( = ?auto_1311042 ?auto_1311043 ) ) ( not ( = ?auto_1311042 ?auto_1311044 ) ) ( not ( = ?auto_1311042 ?auto_1311045 ) ) ( not ( = ?auto_1311042 ?auto_1311046 ) ) ( not ( = ?auto_1311042 ?auto_1311047 ) ) ( not ( = ?auto_1311042 ?auto_1311048 ) ) ( not ( = ?auto_1311042 ?auto_1311049 ) ) ( not ( = ?auto_1311042 ?auto_1311051 ) ) ( not ( = ?auto_1311043 ?auto_1311044 ) ) ( not ( = ?auto_1311043 ?auto_1311045 ) ) ( not ( = ?auto_1311043 ?auto_1311046 ) ) ( not ( = ?auto_1311043 ?auto_1311047 ) ) ( not ( = ?auto_1311043 ?auto_1311048 ) ) ( not ( = ?auto_1311043 ?auto_1311049 ) ) ( not ( = ?auto_1311043 ?auto_1311051 ) ) ( not ( = ?auto_1311044 ?auto_1311045 ) ) ( not ( = ?auto_1311044 ?auto_1311046 ) ) ( not ( = ?auto_1311044 ?auto_1311047 ) ) ( not ( = ?auto_1311044 ?auto_1311048 ) ) ( not ( = ?auto_1311044 ?auto_1311049 ) ) ( not ( = ?auto_1311044 ?auto_1311051 ) ) ( not ( = ?auto_1311045 ?auto_1311046 ) ) ( not ( = ?auto_1311045 ?auto_1311047 ) ) ( not ( = ?auto_1311045 ?auto_1311048 ) ) ( not ( = ?auto_1311045 ?auto_1311049 ) ) ( not ( = ?auto_1311045 ?auto_1311051 ) ) ( not ( = ?auto_1311046 ?auto_1311047 ) ) ( not ( = ?auto_1311046 ?auto_1311048 ) ) ( not ( = ?auto_1311046 ?auto_1311049 ) ) ( not ( = ?auto_1311046 ?auto_1311051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311047 ?auto_1311048 ?auto_1311049 )
      ( MAKE-13CRATE-VERIFY ?auto_1311036 ?auto_1311037 ?auto_1311038 ?auto_1311039 ?auto_1311040 ?auto_1311041 ?auto_1311042 ?auto_1311043 ?auto_1311044 ?auto_1311045 ?auto_1311046 ?auto_1311047 ?auto_1311048 ?auto_1311049 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311219 - SURFACE
      ?auto_1311220 - SURFACE
      ?auto_1311221 - SURFACE
      ?auto_1311222 - SURFACE
      ?auto_1311223 - SURFACE
      ?auto_1311224 - SURFACE
      ?auto_1311225 - SURFACE
      ?auto_1311226 - SURFACE
      ?auto_1311227 - SURFACE
      ?auto_1311228 - SURFACE
      ?auto_1311229 - SURFACE
      ?auto_1311230 - SURFACE
      ?auto_1311231 - SURFACE
      ?auto_1311232 - SURFACE
    )
    :vars
    (
      ?auto_1311235 - HOIST
      ?auto_1311237 - PLACE
      ?auto_1311236 - PLACE
      ?auto_1311234 - HOIST
      ?auto_1311238 - SURFACE
      ?auto_1311233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311235 ?auto_1311237 ) ( IS-CRATE ?auto_1311232 ) ( not ( = ?auto_1311231 ?auto_1311232 ) ) ( not ( = ?auto_1311230 ?auto_1311231 ) ) ( not ( = ?auto_1311230 ?auto_1311232 ) ) ( not ( = ?auto_1311236 ?auto_1311237 ) ) ( HOIST-AT ?auto_1311234 ?auto_1311236 ) ( not ( = ?auto_1311235 ?auto_1311234 ) ) ( AVAILABLE ?auto_1311234 ) ( SURFACE-AT ?auto_1311232 ?auto_1311236 ) ( ON ?auto_1311232 ?auto_1311238 ) ( CLEAR ?auto_1311232 ) ( not ( = ?auto_1311231 ?auto_1311238 ) ) ( not ( = ?auto_1311232 ?auto_1311238 ) ) ( not ( = ?auto_1311230 ?auto_1311238 ) ) ( TRUCK-AT ?auto_1311233 ?auto_1311237 ) ( SURFACE-AT ?auto_1311230 ?auto_1311237 ) ( CLEAR ?auto_1311230 ) ( LIFTING ?auto_1311235 ?auto_1311231 ) ( IS-CRATE ?auto_1311231 ) ( ON ?auto_1311220 ?auto_1311219 ) ( ON ?auto_1311221 ?auto_1311220 ) ( ON ?auto_1311222 ?auto_1311221 ) ( ON ?auto_1311223 ?auto_1311222 ) ( ON ?auto_1311224 ?auto_1311223 ) ( ON ?auto_1311225 ?auto_1311224 ) ( ON ?auto_1311226 ?auto_1311225 ) ( ON ?auto_1311227 ?auto_1311226 ) ( ON ?auto_1311228 ?auto_1311227 ) ( ON ?auto_1311229 ?auto_1311228 ) ( ON ?auto_1311230 ?auto_1311229 ) ( not ( = ?auto_1311219 ?auto_1311220 ) ) ( not ( = ?auto_1311219 ?auto_1311221 ) ) ( not ( = ?auto_1311219 ?auto_1311222 ) ) ( not ( = ?auto_1311219 ?auto_1311223 ) ) ( not ( = ?auto_1311219 ?auto_1311224 ) ) ( not ( = ?auto_1311219 ?auto_1311225 ) ) ( not ( = ?auto_1311219 ?auto_1311226 ) ) ( not ( = ?auto_1311219 ?auto_1311227 ) ) ( not ( = ?auto_1311219 ?auto_1311228 ) ) ( not ( = ?auto_1311219 ?auto_1311229 ) ) ( not ( = ?auto_1311219 ?auto_1311230 ) ) ( not ( = ?auto_1311219 ?auto_1311231 ) ) ( not ( = ?auto_1311219 ?auto_1311232 ) ) ( not ( = ?auto_1311219 ?auto_1311238 ) ) ( not ( = ?auto_1311220 ?auto_1311221 ) ) ( not ( = ?auto_1311220 ?auto_1311222 ) ) ( not ( = ?auto_1311220 ?auto_1311223 ) ) ( not ( = ?auto_1311220 ?auto_1311224 ) ) ( not ( = ?auto_1311220 ?auto_1311225 ) ) ( not ( = ?auto_1311220 ?auto_1311226 ) ) ( not ( = ?auto_1311220 ?auto_1311227 ) ) ( not ( = ?auto_1311220 ?auto_1311228 ) ) ( not ( = ?auto_1311220 ?auto_1311229 ) ) ( not ( = ?auto_1311220 ?auto_1311230 ) ) ( not ( = ?auto_1311220 ?auto_1311231 ) ) ( not ( = ?auto_1311220 ?auto_1311232 ) ) ( not ( = ?auto_1311220 ?auto_1311238 ) ) ( not ( = ?auto_1311221 ?auto_1311222 ) ) ( not ( = ?auto_1311221 ?auto_1311223 ) ) ( not ( = ?auto_1311221 ?auto_1311224 ) ) ( not ( = ?auto_1311221 ?auto_1311225 ) ) ( not ( = ?auto_1311221 ?auto_1311226 ) ) ( not ( = ?auto_1311221 ?auto_1311227 ) ) ( not ( = ?auto_1311221 ?auto_1311228 ) ) ( not ( = ?auto_1311221 ?auto_1311229 ) ) ( not ( = ?auto_1311221 ?auto_1311230 ) ) ( not ( = ?auto_1311221 ?auto_1311231 ) ) ( not ( = ?auto_1311221 ?auto_1311232 ) ) ( not ( = ?auto_1311221 ?auto_1311238 ) ) ( not ( = ?auto_1311222 ?auto_1311223 ) ) ( not ( = ?auto_1311222 ?auto_1311224 ) ) ( not ( = ?auto_1311222 ?auto_1311225 ) ) ( not ( = ?auto_1311222 ?auto_1311226 ) ) ( not ( = ?auto_1311222 ?auto_1311227 ) ) ( not ( = ?auto_1311222 ?auto_1311228 ) ) ( not ( = ?auto_1311222 ?auto_1311229 ) ) ( not ( = ?auto_1311222 ?auto_1311230 ) ) ( not ( = ?auto_1311222 ?auto_1311231 ) ) ( not ( = ?auto_1311222 ?auto_1311232 ) ) ( not ( = ?auto_1311222 ?auto_1311238 ) ) ( not ( = ?auto_1311223 ?auto_1311224 ) ) ( not ( = ?auto_1311223 ?auto_1311225 ) ) ( not ( = ?auto_1311223 ?auto_1311226 ) ) ( not ( = ?auto_1311223 ?auto_1311227 ) ) ( not ( = ?auto_1311223 ?auto_1311228 ) ) ( not ( = ?auto_1311223 ?auto_1311229 ) ) ( not ( = ?auto_1311223 ?auto_1311230 ) ) ( not ( = ?auto_1311223 ?auto_1311231 ) ) ( not ( = ?auto_1311223 ?auto_1311232 ) ) ( not ( = ?auto_1311223 ?auto_1311238 ) ) ( not ( = ?auto_1311224 ?auto_1311225 ) ) ( not ( = ?auto_1311224 ?auto_1311226 ) ) ( not ( = ?auto_1311224 ?auto_1311227 ) ) ( not ( = ?auto_1311224 ?auto_1311228 ) ) ( not ( = ?auto_1311224 ?auto_1311229 ) ) ( not ( = ?auto_1311224 ?auto_1311230 ) ) ( not ( = ?auto_1311224 ?auto_1311231 ) ) ( not ( = ?auto_1311224 ?auto_1311232 ) ) ( not ( = ?auto_1311224 ?auto_1311238 ) ) ( not ( = ?auto_1311225 ?auto_1311226 ) ) ( not ( = ?auto_1311225 ?auto_1311227 ) ) ( not ( = ?auto_1311225 ?auto_1311228 ) ) ( not ( = ?auto_1311225 ?auto_1311229 ) ) ( not ( = ?auto_1311225 ?auto_1311230 ) ) ( not ( = ?auto_1311225 ?auto_1311231 ) ) ( not ( = ?auto_1311225 ?auto_1311232 ) ) ( not ( = ?auto_1311225 ?auto_1311238 ) ) ( not ( = ?auto_1311226 ?auto_1311227 ) ) ( not ( = ?auto_1311226 ?auto_1311228 ) ) ( not ( = ?auto_1311226 ?auto_1311229 ) ) ( not ( = ?auto_1311226 ?auto_1311230 ) ) ( not ( = ?auto_1311226 ?auto_1311231 ) ) ( not ( = ?auto_1311226 ?auto_1311232 ) ) ( not ( = ?auto_1311226 ?auto_1311238 ) ) ( not ( = ?auto_1311227 ?auto_1311228 ) ) ( not ( = ?auto_1311227 ?auto_1311229 ) ) ( not ( = ?auto_1311227 ?auto_1311230 ) ) ( not ( = ?auto_1311227 ?auto_1311231 ) ) ( not ( = ?auto_1311227 ?auto_1311232 ) ) ( not ( = ?auto_1311227 ?auto_1311238 ) ) ( not ( = ?auto_1311228 ?auto_1311229 ) ) ( not ( = ?auto_1311228 ?auto_1311230 ) ) ( not ( = ?auto_1311228 ?auto_1311231 ) ) ( not ( = ?auto_1311228 ?auto_1311232 ) ) ( not ( = ?auto_1311228 ?auto_1311238 ) ) ( not ( = ?auto_1311229 ?auto_1311230 ) ) ( not ( = ?auto_1311229 ?auto_1311231 ) ) ( not ( = ?auto_1311229 ?auto_1311232 ) ) ( not ( = ?auto_1311229 ?auto_1311238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311230 ?auto_1311231 ?auto_1311232 )
      ( MAKE-13CRATE-VERIFY ?auto_1311219 ?auto_1311220 ?auto_1311221 ?auto_1311222 ?auto_1311223 ?auto_1311224 ?auto_1311225 ?auto_1311226 ?auto_1311227 ?auto_1311228 ?auto_1311229 ?auto_1311230 ?auto_1311231 ?auto_1311232 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311402 - SURFACE
      ?auto_1311403 - SURFACE
      ?auto_1311404 - SURFACE
      ?auto_1311405 - SURFACE
      ?auto_1311406 - SURFACE
      ?auto_1311407 - SURFACE
      ?auto_1311408 - SURFACE
      ?auto_1311409 - SURFACE
      ?auto_1311410 - SURFACE
      ?auto_1311411 - SURFACE
      ?auto_1311412 - SURFACE
      ?auto_1311413 - SURFACE
      ?auto_1311414 - SURFACE
      ?auto_1311415 - SURFACE
    )
    :vars
    (
      ?auto_1311419 - HOIST
      ?auto_1311420 - PLACE
      ?auto_1311418 - PLACE
      ?auto_1311417 - HOIST
      ?auto_1311416 - SURFACE
      ?auto_1311421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311419 ?auto_1311420 ) ( IS-CRATE ?auto_1311415 ) ( not ( = ?auto_1311414 ?auto_1311415 ) ) ( not ( = ?auto_1311413 ?auto_1311414 ) ) ( not ( = ?auto_1311413 ?auto_1311415 ) ) ( not ( = ?auto_1311418 ?auto_1311420 ) ) ( HOIST-AT ?auto_1311417 ?auto_1311418 ) ( not ( = ?auto_1311419 ?auto_1311417 ) ) ( AVAILABLE ?auto_1311417 ) ( SURFACE-AT ?auto_1311415 ?auto_1311418 ) ( ON ?auto_1311415 ?auto_1311416 ) ( CLEAR ?auto_1311415 ) ( not ( = ?auto_1311414 ?auto_1311416 ) ) ( not ( = ?auto_1311415 ?auto_1311416 ) ) ( not ( = ?auto_1311413 ?auto_1311416 ) ) ( TRUCK-AT ?auto_1311421 ?auto_1311420 ) ( SURFACE-AT ?auto_1311413 ?auto_1311420 ) ( CLEAR ?auto_1311413 ) ( IS-CRATE ?auto_1311414 ) ( AVAILABLE ?auto_1311419 ) ( IN ?auto_1311414 ?auto_1311421 ) ( ON ?auto_1311403 ?auto_1311402 ) ( ON ?auto_1311404 ?auto_1311403 ) ( ON ?auto_1311405 ?auto_1311404 ) ( ON ?auto_1311406 ?auto_1311405 ) ( ON ?auto_1311407 ?auto_1311406 ) ( ON ?auto_1311408 ?auto_1311407 ) ( ON ?auto_1311409 ?auto_1311408 ) ( ON ?auto_1311410 ?auto_1311409 ) ( ON ?auto_1311411 ?auto_1311410 ) ( ON ?auto_1311412 ?auto_1311411 ) ( ON ?auto_1311413 ?auto_1311412 ) ( not ( = ?auto_1311402 ?auto_1311403 ) ) ( not ( = ?auto_1311402 ?auto_1311404 ) ) ( not ( = ?auto_1311402 ?auto_1311405 ) ) ( not ( = ?auto_1311402 ?auto_1311406 ) ) ( not ( = ?auto_1311402 ?auto_1311407 ) ) ( not ( = ?auto_1311402 ?auto_1311408 ) ) ( not ( = ?auto_1311402 ?auto_1311409 ) ) ( not ( = ?auto_1311402 ?auto_1311410 ) ) ( not ( = ?auto_1311402 ?auto_1311411 ) ) ( not ( = ?auto_1311402 ?auto_1311412 ) ) ( not ( = ?auto_1311402 ?auto_1311413 ) ) ( not ( = ?auto_1311402 ?auto_1311414 ) ) ( not ( = ?auto_1311402 ?auto_1311415 ) ) ( not ( = ?auto_1311402 ?auto_1311416 ) ) ( not ( = ?auto_1311403 ?auto_1311404 ) ) ( not ( = ?auto_1311403 ?auto_1311405 ) ) ( not ( = ?auto_1311403 ?auto_1311406 ) ) ( not ( = ?auto_1311403 ?auto_1311407 ) ) ( not ( = ?auto_1311403 ?auto_1311408 ) ) ( not ( = ?auto_1311403 ?auto_1311409 ) ) ( not ( = ?auto_1311403 ?auto_1311410 ) ) ( not ( = ?auto_1311403 ?auto_1311411 ) ) ( not ( = ?auto_1311403 ?auto_1311412 ) ) ( not ( = ?auto_1311403 ?auto_1311413 ) ) ( not ( = ?auto_1311403 ?auto_1311414 ) ) ( not ( = ?auto_1311403 ?auto_1311415 ) ) ( not ( = ?auto_1311403 ?auto_1311416 ) ) ( not ( = ?auto_1311404 ?auto_1311405 ) ) ( not ( = ?auto_1311404 ?auto_1311406 ) ) ( not ( = ?auto_1311404 ?auto_1311407 ) ) ( not ( = ?auto_1311404 ?auto_1311408 ) ) ( not ( = ?auto_1311404 ?auto_1311409 ) ) ( not ( = ?auto_1311404 ?auto_1311410 ) ) ( not ( = ?auto_1311404 ?auto_1311411 ) ) ( not ( = ?auto_1311404 ?auto_1311412 ) ) ( not ( = ?auto_1311404 ?auto_1311413 ) ) ( not ( = ?auto_1311404 ?auto_1311414 ) ) ( not ( = ?auto_1311404 ?auto_1311415 ) ) ( not ( = ?auto_1311404 ?auto_1311416 ) ) ( not ( = ?auto_1311405 ?auto_1311406 ) ) ( not ( = ?auto_1311405 ?auto_1311407 ) ) ( not ( = ?auto_1311405 ?auto_1311408 ) ) ( not ( = ?auto_1311405 ?auto_1311409 ) ) ( not ( = ?auto_1311405 ?auto_1311410 ) ) ( not ( = ?auto_1311405 ?auto_1311411 ) ) ( not ( = ?auto_1311405 ?auto_1311412 ) ) ( not ( = ?auto_1311405 ?auto_1311413 ) ) ( not ( = ?auto_1311405 ?auto_1311414 ) ) ( not ( = ?auto_1311405 ?auto_1311415 ) ) ( not ( = ?auto_1311405 ?auto_1311416 ) ) ( not ( = ?auto_1311406 ?auto_1311407 ) ) ( not ( = ?auto_1311406 ?auto_1311408 ) ) ( not ( = ?auto_1311406 ?auto_1311409 ) ) ( not ( = ?auto_1311406 ?auto_1311410 ) ) ( not ( = ?auto_1311406 ?auto_1311411 ) ) ( not ( = ?auto_1311406 ?auto_1311412 ) ) ( not ( = ?auto_1311406 ?auto_1311413 ) ) ( not ( = ?auto_1311406 ?auto_1311414 ) ) ( not ( = ?auto_1311406 ?auto_1311415 ) ) ( not ( = ?auto_1311406 ?auto_1311416 ) ) ( not ( = ?auto_1311407 ?auto_1311408 ) ) ( not ( = ?auto_1311407 ?auto_1311409 ) ) ( not ( = ?auto_1311407 ?auto_1311410 ) ) ( not ( = ?auto_1311407 ?auto_1311411 ) ) ( not ( = ?auto_1311407 ?auto_1311412 ) ) ( not ( = ?auto_1311407 ?auto_1311413 ) ) ( not ( = ?auto_1311407 ?auto_1311414 ) ) ( not ( = ?auto_1311407 ?auto_1311415 ) ) ( not ( = ?auto_1311407 ?auto_1311416 ) ) ( not ( = ?auto_1311408 ?auto_1311409 ) ) ( not ( = ?auto_1311408 ?auto_1311410 ) ) ( not ( = ?auto_1311408 ?auto_1311411 ) ) ( not ( = ?auto_1311408 ?auto_1311412 ) ) ( not ( = ?auto_1311408 ?auto_1311413 ) ) ( not ( = ?auto_1311408 ?auto_1311414 ) ) ( not ( = ?auto_1311408 ?auto_1311415 ) ) ( not ( = ?auto_1311408 ?auto_1311416 ) ) ( not ( = ?auto_1311409 ?auto_1311410 ) ) ( not ( = ?auto_1311409 ?auto_1311411 ) ) ( not ( = ?auto_1311409 ?auto_1311412 ) ) ( not ( = ?auto_1311409 ?auto_1311413 ) ) ( not ( = ?auto_1311409 ?auto_1311414 ) ) ( not ( = ?auto_1311409 ?auto_1311415 ) ) ( not ( = ?auto_1311409 ?auto_1311416 ) ) ( not ( = ?auto_1311410 ?auto_1311411 ) ) ( not ( = ?auto_1311410 ?auto_1311412 ) ) ( not ( = ?auto_1311410 ?auto_1311413 ) ) ( not ( = ?auto_1311410 ?auto_1311414 ) ) ( not ( = ?auto_1311410 ?auto_1311415 ) ) ( not ( = ?auto_1311410 ?auto_1311416 ) ) ( not ( = ?auto_1311411 ?auto_1311412 ) ) ( not ( = ?auto_1311411 ?auto_1311413 ) ) ( not ( = ?auto_1311411 ?auto_1311414 ) ) ( not ( = ?auto_1311411 ?auto_1311415 ) ) ( not ( = ?auto_1311411 ?auto_1311416 ) ) ( not ( = ?auto_1311412 ?auto_1311413 ) ) ( not ( = ?auto_1311412 ?auto_1311414 ) ) ( not ( = ?auto_1311412 ?auto_1311415 ) ) ( not ( = ?auto_1311412 ?auto_1311416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311413 ?auto_1311414 ?auto_1311415 )
      ( MAKE-13CRATE-VERIFY ?auto_1311402 ?auto_1311403 ?auto_1311404 ?auto_1311405 ?auto_1311406 ?auto_1311407 ?auto_1311408 ?auto_1311409 ?auto_1311410 ?auto_1311411 ?auto_1311412 ?auto_1311413 ?auto_1311414 ?auto_1311415 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325617 - SURFACE
      ?auto_1325618 - SURFACE
      ?auto_1325619 - SURFACE
      ?auto_1325620 - SURFACE
      ?auto_1325621 - SURFACE
      ?auto_1325622 - SURFACE
      ?auto_1325623 - SURFACE
      ?auto_1325624 - SURFACE
      ?auto_1325625 - SURFACE
      ?auto_1325626 - SURFACE
      ?auto_1325627 - SURFACE
      ?auto_1325628 - SURFACE
      ?auto_1325629 - SURFACE
      ?auto_1325630 - SURFACE
      ?auto_1325631 - SURFACE
    )
    :vars
    (
      ?auto_1325632 - HOIST
      ?auto_1325633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325632 ?auto_1325633 ) ( SURFACE-AT ?auto_1325630 ?auto_1325633 ) ( CLEAR ?auto_1325630 ) ( LIFTING ?auto_1325632 ?auto_1325631 ) ( IS-CRATE ?auto_1325631 ) ( not ( = ?auto_1325630 ?auto_1325631 ) ) ( ON ?auto_1325618 ?auto_1325617 ) ( ON ?auto_1325619 ?auto_1325618 ) ( ON ?auto_1325620 ?auto_1325619 ) ( ON ?auto_1325621 ?auto_1325620 ) ( ON ?auto_1325622 ?auto_1325621 ) ( ON ?auto_1325623 ?auto_1325622 ) ( ON ?auto_1325624 ?auto_1325623 ) ( ON ?auto_1325625 ?auto_1325624 ) ( ON ?auto_1325626 ?auto_1325625 ) ( ON ?auto_1325627 ?auto_1325626 ) ( ON ?auto_1325628 ?auto_1325627 ) ( ON ?auto_1325629 ?auto_1325628 ) ( ON ?auto_1325630 ?auto_1325629 ) ( not ( = ?auto_1325617 ?auto_1325618 ) ) ( not ( = ?auto_1325617 ?auto_1325619 ) ) ( not ( = ?auto_1325617 ?auto_1325620 ) ) ( not ( = ?auto_1325617 ?auto_1325621 ) ) ( not ( = ?auto_1325617 ?auto_1325622 ) ) ( not ( = ?auto_1325617 ?auto_1325623 ) ) ( not ( = ?auto_1325617 ?auto_1325624 ) ) ( not ( = ?auto_1325617 ?auto_1325625 ) ) ( not ( = ?auto_1325617 ?auto_1325626 ) ) ( not ( = ?auto_1325617 ?auto_1325627 ) ) ( not ( = ?auto_1325617 ?auto_1325628 ) ) ( not ( = ?auto_1325617 ?auto_1325629 ) ) ( not ( = ?auto_1325617 ?auto_1325630 ) ) ( not ( = ?auto_1325617 ?auto_1325631 ) ) ( not ( = ?auto_1325618 ?auto_1325619 ) ) ( not ( = ?auto_1325618 ?auto_1325620 ) ) ( not ( = ?auto_1325618 ?auto_1325621 ) ) ( not ( = ?auto_1325618 ?auto_1325622 ) ) ( not ( = ?auto_1325618 ?auto_1325623 ) ) ( not ( = ?auto_1325618 ?auto_1325624 ) ) ( not ( = ?auto_1325618 ?auto_1325625 ) ) ( not ( = ?auto_1325618 ?auto_1325626 ) ) ( not ( = ?auto_1325618 ?auto_1325627 ) ) ( not ( = ?auto_1325618 ?auto_1325628 ) ) ( not ( = ?auto_1325618 ?auto_1325629 ) ) ( not ( = ?auto_1325618 ?auto_1325630 ) ) ( not ( = ?auto_1325618 ?auto_1325631 ) ) ( not ( = ?auto_1325619 ?auto_1325620 ) ) ( not ( = ?auto_1325619 ?auto_1325621 ) ) ( not ( = ?auto_1325619 ?auto_1325622 ) ) ( not ( = ?auto_1325619 ?auto_1325623 ) ) ( not ( = ?auto_1325619 ?auto_1325624 ) ) ( not ( = ?auto_1325619 ?auto_1325625 ) ) ( not ( = ?auto_1325619 ?auto_1325626 ) ) ( not ( = ?auto_1325619 ?auto_1325627 ) ) ( not ( = ?auto_1325619 ?auto_1325628 ) ) ( not ( = ?auto_1325619 ?auto_1325629 ) ) ( not ( = ?auto_1325619 ?auto_1325630 ) ) ( not ( = ?auto_1325619 ?auto_1325631 ) ) ( not ( = ?auto_1325620 ?auto_1325621 ) ) ( not ( = ?auto_1325620 ?auto_1325622 ) ) ( not ( = ?auto_1325620 ?auto_1325623 ) ) ( not ( = ?auto_1325620 ?auto_1325624 ) ) ( not ( = ?auto_1325620 ?auto_1325625 ) ) ( not ( = ?auto_1325620 ?auto_1325626 ) ) ( not ( = ?auto_1325620 ?auto_1325627 ) ) ( not ( = ?auto_1325620 ?auto_1325628 ) ) ( not ( = ?auto_1325620 ?auto_1325629 ) ) ( not ( = ?auto_1325620 ?auto_1325630 ) ) ( not ( = ?auto_1325620 ?auto_1325631 ) ) ( not ( = ?auto_1325621 ?auto_1325622 ) ) ( not ( = ?auto_1325621 ?auto_1325623 ) ) ( not ( = ?auto_1325621 ?auto_1325624 ) ) ( not ( = ?auto_1325621 ?auto_1325625 ) ) ( not ( = ?auto_1325621 ?auto_1325626 ) ) ( not ( = ?auto_1325621 ?auto_1325627 ) ) ( not ( = ?auto_1325621 ?auto_1325628 ) ) ( not ( = ?auto_1325621 ?auto_1325629 ) ) ( not ( = ?auto_1325621 ?auto_1325630 ) ) ( not ( = ?auto_1325621 ?auto_1325631 ) ) ( not ( = ?auto_1325622 ?auto_1325623 ) ) ( not ( = ?auto_1325622 ?auto_1325624 ) ) ( not ( = ?auto_1325622 ?auto_1325625 ) ) ( not ( = ?auto_1325622 ?auto_1325626 ) ) ( not ( = ?auto_1325622 ?auto_1325627 ) ) ( not ( = ?auto_1325622 ?auto_1325628 ) ) ( not ( = ?auto_1325622 ?auto_1325629 ) ) ( not ( = ?auto_1325622 ?auto_1325630 ) ) ( not ( = ?auto_1325622 ?auto_1325631 ) ) ( not ( = ?auto_1325623 ?auto_1325624 ) ) ( not ( = ?auto_1325623 ?auto_1325625 ) ) ( not ( = ?auto_1325623 ?auto_1325626 ) ) ( not ( = ?auto_1325623 ?auto_1325627 ) ) ( not ( = ?auto_1325623 ?auto_1325628 ) ) ( not ( = ?auto_1325623 ?auto_1325629 ) ) ( not ( = ?auto_1325623 ?auto_1325630 ) ) ( not ( = ?auto_1325623 ?auto_1325631 ) ) ( not ( = ?auto_1325624 ?auto_1325625 ) ) ( not ( = ?auto_1325624 ?auto_1325626 ) ) ( not ( = ?auto_1325624 ?auto_1325627 ) ) ( not ( = ?auto_1325624 ?auto_1325628 ) ) ( not ( = ?auto_1325624 ?auto_1325629 ) ) ( not ( = ?auto_1325624 ?auto_1325630 ) ) ( not ( = ?auto_1325624 ?auto_1325631 ) ) ( not ( = ?auto_1325625 ?auto_1325626 ) ) ( not ( = ?auto_1325625 ?auto_1325627 ) ) ( not ( = ?auto_1325625 ?auto_1325628 ) ) ( not ( = ?auto_1325625 ?auto_1325629 ) ) ( not ( = ?auto_1325625 ?auto_1325630 ) ) ( not ( = ?auto_1325625 ?auto_1325631 ) ) ( not ( = ?auto_1325626 ?auto_1325627 ) ) ( not ( = ?auto_1325626 ?auto_1325628 ) ) ( not ( = ?auto_1325626 ?auto_1325629 ) ) ( not ( = ?auto_1325626 ?auto_1325630 ) ) ( not ( = ?auto_1325626 ?auto_1325631 ) ) ( not ( = ?auto_1325627 ?auto_1325628 ) ) ( not ( = ?auto_1325627 ?auto_1325629 ) ) ( not ( = ?auto_1325627 ?auto_1325630 ) ) ( not ( = ?auto_1325627 ?auto_1325631 ) ) ( not ( = ?auto_1325628 ?auto_1325629 ) ) ( not ( = ?auto_1325628 ?auto_1325630 ) ) ( not ( = ?auto_1325628 ?auto_1325631 ) ) ( not ( = ?auto_1325629 ?auto_1325630 ) ) ( not ( = ?auto_1325629 ?auto_1325631 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1325630 ?auto_1325631 )
      ( MAKE-14CRATE-VERIFY ?auto_1325617 ?auto_1325618 ?auto_1325619 ?auto_1325620 ?auto_1325621 ?auto_1325622 ?auto_1325623 ?auto_1325624 ?auto_1325625 ?auto_1325626 ?auto_1325627 ?auto_1325628 ?auto_1325629 ?auto_1325630 ?auto_1325631 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325777 - SURFACE
      ?auto_1325778 - SURFACE
      ?auto_1325779 - SURFACE
      ?auto_1325780 - SURFACE
      ?auto_1325781 - SURFACE
      ?auto_1325782 - SURFACE
      ?auto_1325783 - SURFACE
      ?auto_1325784 - SURFACE
      ?auto_1325785 - SURFACE
      ?auto_1325786 - SURFACE
      ?auto_1325787 - SURFACE
      ?auto_1325788 - SURFACE
      ?auto_1325789 - SURFACE
      ?auto_1325790 - SURFACE
      ?auto_1325791 - SURFACE
    )
    :vars
    (
      ?auto_1325793 - HOIST
      ?auto_1325794 - PLACE
      ?auto_1325792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325793 ?auto_1325794 ) ( SURFACE-AT ?auto_1325790 ?auto_1325794 ) ( CLEAR ?auto_1325790 ) ( IS-CRATE ?auto_1325791 ) ( not ( = ?auto_1325790 ?auto_1325791 ) ) ( TRUCK-AT ?auto_1325792 ?auto_1325794 ) ( AVAILABLE ?auto_1325793 ) ( IN ?auto_1325791 ?auto_1325792 ) ( ON ?auto_1325790 ?auto_1325789 ) ( not ( = ?auto_1325789 ?auto_1325790 ) ) ( not ( = ?auto_1325789 ?auto_1325791 ) ) ( ON ?auto_1325778 ?auto_1325777 ) ( ON ?auto_1325779 ?auto_1325778 ) ( ON ?auto_1325780 ?auto_1325779 ) ( ON ?auto_1325781 ?auto_1325780 ) ( ON ?auto_1325782 ?auto_1325781 ) ( ON ?auto_1325783 ?auto_1325782 ) ( ON ?auto_1325784 ?auto_1325783 ) ( ON ?auto_1325785 ?auto_1325784 ) ( ON ?auto_1325786 ?auto_1325785 ) ( ON ?auto_1325787 ?auto_1325786 ) ( ON ?auto_1325788 ?auto_1325787 ) ( ON ?auto_1325789 ?auto_1325788 ) ( not ( = ?auto_1325777 ?auto_1325778 ) ) ( not ( = ?auto_1325777 ?auto_1325779 ) ) ( not ( = ?auto_1325777 ?auto_1325780 ) ) ( not ( = ?auto_1325777 ?auto_1325781 ) ) ( not ( = ?auto_1325777 ?auto_1325782 ) ) ( not ( = ?auto_1325777 ?auto_1325783 ) ) ( not ( = ?auto_1325777 ?auto_1325784 ) ) ( not ( = ?auto_1325777 ?auto_1325785 ) ) ( not ( = ?auto_1325777 ?auto_1325786 ) ) ( not ( = ?auto_1325777 ?auto_1325787 ) ) ( not ( = ?auto_1325777 ?auto_1325788 ) ) ( not ( = ?auto_1325777 ?auto_1325789 ) ) ( not ( = ?auto_1325777 ?auto_1325790 ) ) ( not ( = ?auto_1325777 ?auto_1325791 ) ) ( not ( = ?auto_1325778 ?auto_1325779 ) ) ( not ( = ?auto_1325778 ?auto_1325780 ) ) ( not ( = ?auto_1325778 ?auto_1325781 ) ) ( not ( = ?auto_1325778 ?auto_1325782 ) ) ( not ( = ?auto_1325778 ?auto_1325783 ) ) ( not ( = ?auto_1325778 ?auto_1325784 ) ) ( not ( = ?auto_1325778 ?auto_1325785 ) ) ( not ( = ?auto_1325778 ?auto_1325786 ) ) ( not ( = ?auto_1325778 ?auto_1325787 ) ) ( not ( = ?auto_1325778 ?auto_1325788 ) ) ( not ( = ?auto_1325778 ?auto_1325789 ) ) ( not ( = ?auto_1325778 ?auto_1325790 ) ) ( not ( = ?auto_1325778 ?auto_1325791 ) ) ( not ( = ?auto_1325779 ?auto_1325780 ) ) ( not ( = ?auto_1325779 ?auto_1325781 ) ) ( not ( = ?auto_1325779 ?auto_1325782 ) ) ( not ( = ?auto_1325779 ?auto_1325783 ) ) ( not ( = ?auto_1325779 ?auto_1325784 ) ) ( not ( = ?auto_1325779 ?auto_1325785 ) ) ( not ( = ?auto_1325779 ?auto_1325786 ) ) ( not ( = ?auto_1325779 ?auto_1325787 ) ) ( not ( = ?auto_1325779 ?auto_1325788 ) ) ( not ( = ?auto_1325779 ?auto_1325789 ) ) ( not ( = ?auto_1325779 ?auto_1325790 ) ) ( not ( = ?auto_1325779 ?auto_1325791 ) ) ( not ( = ?auto_1325780 ?auto_1325781 ) ) ( not ( = ?auto_1325780 ?auto_1325782 ) ) ( not ( = ?auto_1325780 ?auto_1325783 ) ) ( not ( = ?auto_1325780 ?auto_1325784 ) ) ( not ( = ?auto_1325780 ?auto_1325785 ) ) ( not ( = ?auto_1325780 ?auto_1325786 ) ) ( not ( = ?auto_1325780 ?auto_1325787 ) ) ( not ( = ?auto_1325780 ?auto_1325788 ) ) ( not ( = ?auto_1325780 ?auto_1325789 ) ) ( not ( = ?auto_1325780 ?auto_1325790 ) ) ( not ( = ?auto_1325780 ?auto_1325791 ) ) ( not ( = ?auto_1325781 ?auto_1325782 ) ) ( not ( = ?auto_1325781 ?auto_1325783 ) ) ( not ( = ?auto_1325781 ?auto_1325784 ) ) ( not ( = ?auto_1325781 ?auto_1325785 ) ) ( not ( = ?auto_1325781 ?auto_1325786 ) ) ( not ( = ?auto_1325781 ?auto_1325787 ) ) ( not ( = ?auto_1325781 ?auto_1325788 ) ) ( not ( = ?auto_1325781 ?auto_1325789 ) ) ( not ( = ?auto_1325781 ?auto_1325790 ) ) ( not ( = ?auto_1325781 ?auto_1325791 ) ) ( not ( = ?auto_1325782 ?auto_1325783 ) ) ( not ( = ?auto_1325782 ?auto_1325784 ) ) ( not ( = ?auto_1325782 ?auto_1325785 ) ) ( not ( = ?auto_1325782 ?auto_1325786 ) ) ( not ( = ?auto_1325782 ?auto_1325787 ) ) ( not ( = ?auto_1325782 ?auto_1325788 ) ) ( not ( = ?auto_1325782 ?auto_1325789 ) ) ( not ( = ?auto_1325782 ?auto_1325790 ) ) ( not ( = ?auto_1325782 ?auto_1325791 ) ) ( not ( = ?auto_1325783 ?auto_1325784 ) ) ( not ( = ?auto_1325783 ?auto_1325785 ) ) ( not ( = ?auto_1325783 ?auto_1325786 ) ) ( not ( = ?auto_1325783 ?auto_1325787 ) ) ( not ( = ?auto_1325783 ?auto_1325788 ) ) ( not ( = ?auto_1325783 ?auto_1325789 ) ) ( not ( = ?auto_1325783 ?auto_1325790 ) ) ( not ( = ?auto_1325783 ?auto_1325791 ) ) ( not ( = ?auto_1325784 ?auto_1325785 ) ) ( not ( = ?auto_1325784 ?auto_1325786 ) ) ( not ( = ?auto_1325784 ?auto_1325787 ) ) ( not ( = ?auto_1325784 ?auto_1325788 ) ) ( not ( = ?auto_1325784 ?auto_1325789 ) ) ( not ( = ?auto_1325784 ?auto_1325790 ) ) ( not ( = ?auto_1325784 ?auto_1325791 ) ) ( not ( = ?auto_1325785 ?auto_1325786 ) ) ( not ( = ?auto_1325785 ?auto_1325787 ) ) ( not ( = ?auto_1325785 ?auto_1325788 ) ) ( not ( = ?auto_1325785 ?auto_1325789 ) ) ( not ( = ?auto_1325785 ?auto_1325790 ) ) ( not ( = ?auto_1325785 ?auto_1325791 ) ) ( not ( = ?auto_1325786 ?auto_1325787 ) ) ( not ( = ?auto_1325786 ?auto_1325788 ) ) ( not ( = ?auto_1325786 ?auto_1325789 ) ) ( not ( = ?auto_1325786 ?auto_1325790 ) ) ( not ( = ?auto_1325786 ?auto_1325791 ) ) ( not ( = ?auto_1325787 ?auto_1325788 ) ) ( not ( = ?auto_1325787 ?auto_1325789 ) ) ( not ( = ?auto_1325787 ?auto_1325790 ) ) ( not ( = ?auto_1325787 ?auto_1325791 ) ) ( not ( = ?auto_1325788 ?auto_1325789 ) ) ( not ( = ?auto_1325788 ?auto_1325790 ) ) ( not ( = ?auto_1325788 ?auto_1325791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325789 ?auto_1325790 ?auto_1325791 )
      ( MAKE-14CRATE-VERIFY ?auto_1325777 ?auto_1325778 ?auto_1325779 ?auto_1325780 ?auto_1325781 ?auto_1325782 ?auto_1325783 ?auto_1325784 ?auto_1325785 ?auto_1325786 ?auto_1325787 ?auto_1325788 ?auto_1325789 ?auto_1325790 ?auto_1325791 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325952 - SURFACE
      ?auto_1325953 - SURFACE
      ?auto_1325954 - SURFACE
      ?auto_1325955 - SURFACE
      ?auto_1325956 - SURFACE
      ?auto_1325957 - SURFACE
      ?auto_1325958 - SURFACE
      ?auto_1325959 - SURFACE
      ?auto_1325960 - SURFACE
      ?auto_1325961 - SURFACE
      ?auto_1325962 - SURFACE
      ?auto_1325963 - SURFACE
      ?auto_1325964 - SURFACE
      ?auto_1325965 - SURFACE
      ?auto_1325966 - SURFACE
    )
    :vars
    (
      ?auto_1325970 - HOIST
      ?auto_1325967 - PLACE
      ?auto_1325969 - TRUCK
      ?auto_1325968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325970 ?auto_1325967 ) ( SURFACE-AT ?auto_1325965 ?auto_1325967 ) ( CLEAR ?auto_1325965 ) ( IS-CRATE ?auto_1325966 ) ( not ( = ?auto_1325965 ?auto_1325966 ) ) ( AVAILABLE ?auto_1325970 ) ( IN ?auto_1325966 ?auto_1325969 ) ( ON ?auto_1325965 ?auto_1325964 ) ( not ( = ?auto_1325964 ?auto_1325965 ) ) ( not ( = ?auto_1325964 ?auto_1325966 ) ) ( TRUCK-AT ?auto_1325969 ?auto_1325968 ) ( not ( = ?auto_1325968 ?auto_1325967 ) ) ( ON ?auto_1325953 ?auto_1325952 ) ( ON ?auto_1325954 ?auto_1325953 ) ( ON ?auto_1325955 ?auto_1325954 ) ( ON ?auto_1325956 ?auto_1325955 ) ( ON ?auto_1325957 ?auto_1325956 ) ( ON ?auto_1325958 ?auto_1325957 ) ( ON ?auto_1325959 ?auto_1325958 ) ( ON ?auto_1325960 ?auto_1325959 ) ( ON ?auto_1325961 ?auto_1325960 ) ( ON ?auto_1325962 ?auto_1325961 ) ( ON ?auto_1325963 ?auto_1325962 ) ( ON ?auto_1325964 ?auto_1325963 ) ( not ( = ?auto_1325952 ?auto_1325953 ) ) ( not ( = ?auto_1325952 ?auto_1325954 ) ) ( not ( = ?auto_1325952 ?auto_1325955 ) ) ( not ( = ?auto_1325952 ?auto_1325956 ) ) ( not ( = ?auto_1325952 ?auto_1325957 ) ) ( not ( = ?auto_1325952 ?auto_1325958 ) ) ( not ( = ?auto_1325952 ?auto_1325959 ) ) ( not ( = ?auto_1325952 ?auto_1325960 ) ) ( not ( = ?auto_1325952 ?auto_1325961 ) ) ( not ( = ?auto_1325952 ?auto_1325962 ) ) ( not ( = ?auto_1325952 ?auto_1325963 ) ) ( not ( = ?auto_1325952 ?auto_1325964 ) ) ( not ( = ?auto_1325952 ?auto_1325965 ) ) ( not ( = ?auto_1325952 ?auto_1325966 ) ) ( not ( = ?auto_1325953 ?auto_1325954 ) ) ( not ( = ?auto_1325953 ?auto_1325955 ) ) ( not ( = ?auto_1325953 ?auto_1325956 ) ) ( not ( = ?auto_1325953 ?auto_1325957 ) ) ( not ( = ?auto_1325953 ?auto_1325958 ) ) ( not ( = ?auto_1325953 ?auto_1325959 ) ) ( not ( = ?auto_1325953 ?auto_1325960 ) ) ( not ( = ?auto_1325953 ?auto_1325961 ) ) ( not ( = ?auto_1325953 ?auto_1325962 ) ) ( not ( = ?auto_1325953 ?auto_1325963 ) ) ( not ( = ?auto_1325953 ?auto_1325964 ) ) ( not ( = ?auto_1325953 ?auto_1325965 ) ) ( not ( = ?auto_1325953 ?auto_1325966 ) ) ( not ( = ?auto_1325954 ?auto_1325955 ) ) ( not ( = ?auto_1325954 ?auto_1325956 ) ) ( not ( = ?auto_1325954 ?auto_1325957 ) ) ( not ( = ?auto_1325954 ?auto_1325958 ) ) ( not ( = ?auto_1325954 ?auto_1325959 ) ) ( not ( = ?auto_1325954 ?auto_1325960 ) ) ( not ( = ?auto_1325954 ?auto_1325961 ) ) ( not ( = ?auto_1325954 ?auto_1325962 ) ) ( not ( = ?auto_1325954 ?auto_1325963 ) ) ( not ( = ?auto_1325954 ?auto_1325964 ) ) ( not ( = ?auto_1325954 ?auto_1325965 ) ) ( not ( = ?auto_1325954 ?auto_1325966 ) ) ( not ( = ?auto_1325955 ?auto_1325956 ) ) ( not ( = ?auto_1325955 ?auto_1325957 ) ) ( not ( = ?auto_1325955 ?auto_1325958 ) ) ( not ( = ?auto_1325955 ?auto_1325959 ) ) ( not ( = ?auto_1325955 ?auto_1325960 ) ) ( not ( = ?auto_1325955 ?auto_1325961 ) ) ( not ( = ?auto_1325955 ?auto_1325962 ) ) ( not ( = ?auto_1325955 ?auto_1325963 ) ) ( not ( = ?auto_1325955 ?auto_1325964 ) ) ( not ( = ?auto_1325955 ?auto_1325965 ) ) ( not ( = ?auto_1325955 ?auto_1325966 ) ) ( not ( = ?auto_1325956 ?auto_1325957 ) ) ( not ( = ?auto_1325956 ?auto_1325958 ) ) ( not ( = ?auto_1325956 ?auto_1325959 ) ) ( not ( = ?auto_1325956 ?auto_1325960 ) ) ( not ( = ?auto_1325956 ?auto_1325961 ) ) ( not ( = ?auto_1325956 ?auto_1325962 ) ) ( not ( = ?auto_1325956 ?auto_1325963 ) ) ( not ( = ?auto_1325956 ?auto_1325964 ) ) ( not ( = ?auto_1325956 ?auto_1325965 ) ) ( not ( = ?auto_1325956 ?auto_1325966 ) ) ( not ( = ?auto_1325957 ?auto_1325958 ) ) ( not ( = ?auto_1325957 ?auto_1325959 ) ) ( not ( = ?auto_1325957 ?auto_1325960 ) ) ( not ( = ?auto_1325957 ?auto_1325961 ) ) ( not ( = ?auto_1325957 ?auto_1325962 ) ) ( not ( = ?auto_1325957 ?auto_1325963 ) ) ( not ( = ?auto_1325957 ?auto_1325964 ) ) ( not ( = ?auto_1325957 ?auto_1325965 ) ) ( not ( = ?auto_1325957 ?auto_1325966 ) ) ( not ( = ?auto_1325958 ?auto_1325959 ) ) ( not ( = ?auto_1325958 ?auto_1325960 ) ) ( not ( = ?auto_1325958 ?auto_1325961 ) ) ( not ( = ?auto_1325958 ?auto_1325962 ) ) ( not ( = ?auto_1325958 ?auto_1325963 ) ) ( not ( = ?auto_1325958 ?auto_1325964 ) ) ( not ( = ?auto_1325958 ?auto_1325965 ) ) ( not ( = ?auto_1325958 ?auto_1325966 ) ) ( not ( = ?auto_1325959 ?auto_1325960 ) ) ( not ( = ?auto_1325959 ?auto_1325961 ) ) ( not ( = ?auto_1325959 ?auto_1325962 ) ) ( not ( = ?auto_1325959 ?auto_1325963 ) ) ( not ( = ?auto_1325959 ?auto_1325964 ) ) ( not ( = ?auto_1325959 ?auto_1325965 ) ) ( not ( = ?auto_1325959 ?auto_1325966 ) ) ( not ( = ?auto_1325960 ?auto_1325961 ) ) ( not ( = ?auto_1325960 ?auto_1325962 ) ) ( not ( = ?auto_1325960 ?auto_1325963 ) ) ( not ( = ?auto_1325960 ?auto_1325964 ) ) ( not ( = ?auto_1325960 ?auto_1325965 ) ) ( not ( = ?auto_1325960 ?auto_1325966 ) ) ( not ( = ?auto_1325961 ?auto_1325962 ) ) ( not ( = ?auto_1325961 ?auto_1325963 ) ) ( not ( = ?auto_1325961 ?auto_1325964 ) ) ( not ( = ?auto_1325961 ?auto_1325965 ) ) ( not ( = ?auto_1325961 ?auto_1325966 ) ) ( not ( = ?auto_1325962 ?auto_1325963 ) ) ( not ( = ?auto_1325962 ?auto_1325964 ) ) ( not ( = ?auto_1325962 ?auto_1325965 ) ) ( not ( = ?auto_1325962 ?auto_1325966 ) ) ( not ( = ?auto_1325963 ?auto_1325964 ) ) ( not ( = ?auto_1325963 ?auto_1325965 ) ) ( not ( = ?auto_1325963 ?auto_1325966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325964 ?auto_1325965 ?auto_1325966 )
      ( MAKE-14CRATE-VERIFY ?auto_1325952 ?auto_1325953 ?auto_1325954 ?auto_1325955 ?auto_1325956 ?auto_1325957 ?auto_1325958 ?auto_1325959 ?auto_1325960 ?auto_1325961 ?auto_1325962 ?auto_1325963 ?auto_1325964 ?auto_1325965 ?auto_1325966 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326141 - SURFACE
      ?auto_1326142 - SURFACE
      ?auto_1326143 - SURFACE
      ?auto_1326144 - SURFACE
      ?auto_1326145 - SURFACE
      ?auto_1326146 - SURFACE
      ?auto_1326147 - SURFACE
      ?auto_1326148 - SURFACE
      ?auto_1326149 - SURFACE
      ?auto_1326150 - SURFACE
      ?auto_1326151 - SURFACE
      ?auto_1326152 - SURFACE
      ?auto_1326153 - SURFACE
      ?auto_1326154 - SURFACE
      ?auto_1326155 - SURFACE
    )
    :vars
    (
      ?auto_1326156 - HOIST
      ?auto_1326160 - PLACE
      ?auto_1326158 - TRUCK
      ?auto_1326157 - PLACE
      ?auto_1326159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326156 ?auto_1326160 ) ( SURFACE-AT ?auto_1326154 ?auto_1326160 ) ( CLEAR ?auto_1326154 ) ( IS-CRATE ?auto_1326155 ) ( not ( = ?auto_1326154 ?auto_1326155 ) ) ( AVAILABLE ?auto_1326156 ) ( ON ?auto_1326154 ?auto_1326153 ) ( not ( = ?auto_1326153 ?auto_1326154 ) ) ( not ( = ?auto_1326153 ?auto_1326155 ) ) ( TRUCK-AT ?auto_1326158 ?auto_1326157 ) ( not ( = ?auto_1326157 ?auto_1326160 ) ) ( HOIST-AT ?auto_1326159 ?auto_1326157 ) ( LIFTING ?auto_1326159 ?auto_1326155 ) ( not ( = ?auto_1326156 ?auto_1326159 ) ) ( ON ?auto_1326142 ?auto_1326141 ) ( ON ?auto_1326143 ?auto_1326142 ) ( ON ?auto_1326144 ?auto_1326143 ) ( ON ?auto_1326145 ?auto_1326144 ) ( ON ?auto_1326146 ?auto_1326145 ) ( ON ?auto_1326147 ?auto_1326146 ) ( ON ?auto_1326148 ?auto_1326147 ) ( ON ?auto_1326149 ?auto_1326148 ) ( ON ?auto_1326150 ?auto_1326149 ) ( ON ?auto_1326151 ?auto_1326150 ) ( ON ?auto_1326152 ?auto_1326151 ) ( ON ?auto_1326153 ?auto_1326152 ) ( not ( = ?auto_1326141 ?auto_1326142 ) ) ( not ( = ?auto_1326141 ?auto_1326143 ) ) ( not ( = ?auto_1326141 ?auto_1326144 ) ) ( not ( = ?auto_1326141 ?auto_1326145 ) ) ( not ( = ?auto_1326141 ?auto_1326146 ) ) ( not ( = ?auto_1326141 ?auto_1326147 ) ) ( not ( = ?auto_1326141 ?auto_1326148 ) ) ( not ( = ?auto_1326141 ?auto_1326149 ) ) ( not ( = ?auto_1326141 ?auto_1326150 ) ) ( not ( = ?auto_1326141 ?auto_1326151 ) ) ( not ( = ?auto_1326141 ?auto_1326152 ) ) ( not ( = ?auto_1326141 ?auto_1326153 ) ) ( not ( = ?auto_1326141 ?auto_1326154 ) ) ( not ( = ?auto_1326141 ?auto_1326155 ) ) ( not ( = ?auto_1326142 ?auto_1326143 ) ) ( not ( = ?auto_1326142 ?auto_1326144 ) ) ( not ( = ?auto_1326142 ?auto_1326145 ) ) ( not ( = ?auto_1326142 ?auto_1326146 ) ) ( not ( = ?auto_1326142 ?auto_1326147 ) ) ( not ( = ?auto_1326142 ?auto_1326148 ) ) ( not ( = ?auto_1326142 ?auto_1326149 ) ) ( not ( = ?auto_1326142 ?auto_1326150 ) ) ( not ( = ?auto_1326142 ?auto_1326151 ) ) ( not ( = ?auto_1326142 ?auto_1326152 ) ) ( not ( = ?auto_1326142 ?auto_1326153 ) ) ( not ( = ?auto_1326142 ?auto_1326154 ) ) ( not ( = ?auto_1326142 ?auto_1326155 ) ) ( not ( = ?auto_1326143 ?auto_1326144 ) ) ( not ( = ?auto_1326143 ?auto_1326145 ) ) ( not ( = ?auto_1326143 ?auto_1326146 ) ) ( not ( = ?auto_1326143 ?auto_1326147 ) ) ( not ( = ?auto_1326143 ?auto_1326148 ) ) ( not ( = ?auto_1326143 ?auto_1326149 ) ) ( not ( = ?auto_1326143 ?auto_1326150 ) ) ( not ( = ?auto_1326143 ?auto_1326151 ) ) ( not ( = ?auto_1326143 ?auto_1326152 ) ) ( not ( = ?auto_1326143 ?auto_1326153 ) ) ( not ( = ?auto_1326143 ?auto_1326154 ) ) ( not ( = ?auto_1326143 ?auto_1326155 ) ) ( not ( = ?auto_1326144 ?auto_1326145 ) ) ( not ( = ?auto_1326144 ?auto_1326146 ) ) ( not ( = ?auto_1326144 ?auto_1326147 ) ) ( not ( = ?auto_1326144 ?auto_1326148 ) ) ( not ( = ?auto_1326144 ?auto_1326149 ) ) ( not ( = ?auto_1326144 ?auto_1326150 ) ) ( not ( = ?auto_1326144 ?auto_1326151 ) ) ( not ( = ?auto_1326144 ?auto_1326152 ) ) ( not ( = ?auto_1326144 ?auto_1326153 ) ) ( not ( = ?auto_1326144 ?auto_1326154 ) ) ( not ( = ?auto_1326144 ?auto_1326155 ) ) ( not ( = ?auto_1326145 ?auto_1326146 ) ) ( not ( = ?auto_1326145 ?auto_1326147 ) ) ( not ( = ?auto_1326145 ?auto_1326148 ) ) ( not ( = ?auto_1326145 ?auto_1326149 ) ) ( not ( = ?auto_1326145 ?auto_1326150 ) ) ( not ( = ?auto_1326145 ?auto_1326151 ) ) ( not ( = ?auto_1326145 ?auto_1326152 ) ) ( not ( = ?auto_1326145 ?auto_1326153 ) ) ( not ( = ?auto_1326145 ?auto_1326154 ) ) ( not ( = ?auto_1326145 ?auto_1326155 ) ) ( not ( = ?auto_1326146 ?auto_1326147 ) ) ( not ( = ?auto_1326146 ?auto_1326148 ) ) ( not ( = ?auto_1326146 ?auto_1326149 ) ) ( not ( = ?auto_1326146 ?auto_1326150 ) ) ( not ( = ?auto_1326146 ?auto_1326151 ) ) ( not ( = ?auto_1326146 ?auto_1326152 ) ) ( not ( = ?auto_1326146 ?auto_1326153 ) ) ( not ( = ?auto_1326146 ?auto_1326154 ) ) ( not ( = ?auto_1326146 ?auto_1326155 ) ) ( not ( = ?auto_1326147 ?auto_1326148 ) ) ( not ( = ?auto_1326147 ?auto_1326149 ) ) ( not ( = ?auto_1326147 ?auto_1326150 ) ) ( not ( = ?auto_1326147 ?auto_1326151 ) ) ( not ( = ?auto_1326147 ?auto_1326152 ) ) ( not ( = ?auto_1326147 ?auto_1326153 ) ) ( not ( = ?auto_1326147 ?auto_1326154 ) ) ( not ( = ?auto_1326147 ?auto_1326155 ) ) ( not ( = ?auto_1326148 ?auto_1326149 ) ) ( not ( = ?auto_1326148 ?auto_1326150 ) ) ( not ( = ?auto_1326148 ?auto_1326151 ) ) ( not ( = ?auto_1326148 ?auto_1326152 ) ) ( not ( = ?auto_1326148 ?auto_1326153 ) ) ( not ( = ?auto_1326148 ?auto_1326154 ) ) ( not ( = ?auto_1326148 ?auto_1326155 ) ) ( not ( = ?auto_1326149 ?auto_1326150 ) ) ( not ( = ?auto_1326149 ?auto_1326151 ) ) ( not ( = ?auto_1326149 ?auto_1326152 ) ) ( not ( = ?auto_1326149 ?auto_1326153 ) ) ( not ( = ?auto_1326149 ?auto_1326154 ) ) ( not ( = ?auto_1326149 ?auto_1326155 ) ) ( not ( = ?auto_1326150 ?auto_1326151 ) ) ( not ( = ?auto_1326150 ?auto_1326152 ) ) ( not ( = ?auto_1326150 ?auto_1326153 ) ) ( not ( = ?auto_1326150 ?auto_1326154 ) ) ( not ( = ?auto_1326150 ?auto_1326155 ) ) ( not ( = ?auto_1326151 ?auto_1326152 ) ) ( not ( = ?auto_1326151 ?auto_1326153 ) ) ( not ( = ?auto_1326151 ?auto_1326154 ) ) ( not ( = ?auto_1326151 ?auto_1326155 ) ) ( not ( = ?auto_1326152 ?auto_1326153 ) ) ( not ( = ?auto_1326152 ?auto_1326154 ) ) ( not ( = ?auto_1326152 ?auto_1326155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326153 ?auto_1326154 ?auto_1326155 )
      ( MAKE-14CRATE-VERIFY ?auto_1326141 ?auto_1326142 ?auto_1326143 ?auto_1326144 ?auto_1326145 ?auto_1326146 ?auto_1326147 ?auto_1326148 ?auto_1326149 ?auto_1326150 ?auto_1326151 ?auto_1326152 ?auto_1326153 ?auto_1326154 ?auto_1326155 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326344 - SURFACE
      ?auto_1326345 - SURFACE
      ?auto_1326346 - SURFACE
      ?auto_1326347 - SURFACE
      ?auto_1326348 - SURFACE
      ?auto_1326349 - SURFACE
      ?auto_1326350 - SURFACE
      ?auto_1326351 - SURFACE
      ?auto_1326352 - SURFACE
      ?auto_1326353 - SURFACE
      ?auto_1326354 - SURFACE
      ?auto_1326355 - SURFACE
      ?auto_1326356 - SURFACE
      ?auto_1326357 - SURFACE
      ?auto_1326358 - SURFACE
    )
    :vars
    (
      ?auto_1326359 - HOIST
      ?auto_1326363 - PLACE
      ?auto_1326364 - TRUCK
      ?auto_1326361 - PLACE
      ?auto_1326360 - HOIST
      ?auto_1326362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326359 ?auto_1326363 ) ( SURFACE-AT ?auto_1326357 ?auto_1326363 ) ( CLEAR ?auto_1326357 ) ( IS-CRATE ?auto_1326358 ) ( not ( = ?auto_1326357 ?auto_1326358 ) ) ( AVAILABLE ?auto_1326359 ) ( ON ?auto_1326357 ?auto_1326356 ) ( not ( = ?auto_1326356 ?auto_1326357 ) ) ( not ( = ?auto_1326356 ?auto_1326358 ) ) ( TRUCK-AT ?auto_1326364 ?auto_1326361 ) ( not ( = ?auto_1326361 ?auto_1326363 ) ) ( HOIST-AT ?auto_1326360 ?auto_1326361 ) ( not ( = ?auto_1326359 ?auto_1326360 ) ) ( AVAILABLE ?auto_1326360 ) ( SURFACE-AT ?auto_1326358 ?auto_1326361 ) ( ON ?auto_1326358 ?auto_1326362 ) ( CLEAR ?auto_1326358 ) ( not ( = ?auto_1326357 ?auto_1326362 ) ) ( not ( = ?auto_1326358 ?auto_1326362 ) ) ( not ( = ?auto_1326356 ?auto_1326362 ) ) ( ON ?auto_1326345 ?auto_1326344 ) ( ON ?auto_1326346 ?auto_1326345 ) ( ON ?auto_1326347 ?auto_1326346 ) ( ON ?auto_1326348 ?auto_1326347 ) ( ON ?auto_1326349 ?auto_1326348 ) ( ON ?auto_1326350 ?auto_1326349 ) ( ON ?auto_1326351 ?auto_1326350 ) ( ON ?auto_1326352 ?auto_1326351 ) ( ON ?auto_1326353 ?auto_1326352 ) ( ON ?auto_1326354 ?auto_1326353 ) ( ON ?auto_1326355 ?auto_1326354 ) ( ON ?auto_1326356 ?auto_1326355 ) ( not ( = ?auto_1326344 ?auto_1326345 ) ) ( not ( = ?auto_1326344 ?auto_1326346 ) ) ( not ( = ?auto_1326344 ?auto_1326347 ) ) ( not ( = ?auto_1326344 ?auto_1326348 ) ) ( not ( = ?auto_1326344 ?auto_1326349 ) ) ( not ( = ?auto_1326344 ?auto_1326350 ) ) ( not ( = ?auto_1326344 ?auto_1326351 ) ) ( not ( = ?auto_1326344 ?auto_1326352 ) ) ( not ( = ?auto_1326344 ?auto_1326353 ) ) ( not ( = ?auto_1326344 ?auto_1326354 ) ) ( not ( = ?auto_1326344 ?auto_1326355 ) ) ( not ( = ?auto_1326344 ?auto_1326356 ) ) ( not ( = ?auto_1326344 ?auto_1326357 ) ) ( not ( = ?auto_1326344 ?auto_1326358 ) ) ( not ( = ?auto_1326344 ?auto_1326362 ) ) ( not ( = ?auto_1326345 ?auto_1326346 ) ) ( not ( = ?auto_1326345 ?auto_1326347 ) ) ( not ( = ?auto_1326345 ?auto_1326348 ) ) ( not ( = ?auto_1326345 ?auto_1326349 ) ) ( not ( = ?auto_1326345 ?auto_1326350 ) ) ( not ( = ?auto_1326345 ?auto_1326351 ) ) ( not ( = ?auto_1326345 ?auto_1326352 ) ) ( not ( = ?auto_1326345 ?auto_1326353 ) ) ( not ( = ?auto_1326345 ?auto_1326354 ) ) ( not ( = ?auto_1326345 ?auto_1326355 ) ) ( not ( = ?auto_1326345 ?auto_1326356 ) ) ( not ( = ?auto_1326345 ?auto_1326357 ) ) ( not ( = ?auto_1326345 ?auto_1326358 ) ) ( not ( = ?auto_1326345 ?auto_1326362 ) ) ( not ( = ?auto_1326346 ?auto_1326347 ) ) ( not ( = ?auto_1326346 ?auto_1326348 ) ) ( not ( = ?auto_1326346 ?auto_1326349 ) ) ( not ( = ?auto_1326346 ?auto_1326350 ) ) ( not ( = ?auto_1326346 ?auto_1326351 ) ) ( not ( = ?auto_1326346 ?auto_1326352 ) ) ( not ( = ?auto_1326346 ?auto_1326353 ) ) ( not ( = ?auto_1326346 ?auto_1326354 ) ) ( not ( = ?auto_1326346 ?auto_1326355 ) ) ( not ( = ?auto_1326346 ?auto_1326356 ) ) ( not ( = ?auto_1326346 ?auto_1326357 ) ) ( not ( = ?auto_1326346 ?auto_1326358 ) ) ( not ( = ?auto_1326346 ?auto_1326362 ) ) ( not ( = ?auto_1326347 ?auto_1326348 ) ) ( not ( = ?auto_1326347 ?auto_1326349 ) ) ( not ( = ?auto_1326347 ?auto_1326350 ) ) ( not ( = ?auto_1326347 ?auto_1326351 ) ) ( not ( = ?auto_1326347 ?auto_1326352 ) ) ( not ( = ?auto_1326347 ?auto_1326353 ) ) ( not ( = ?auto_1326347 ?auto_1326354 ) ) ( not ( = ?auto_1326347 ?auto_1326355 ) ) ( not ( = ?auto_1326347 ?auto_1326356 ) ) ( not ( = ?auto_1326347 ?auto_1326357 ) ) ( not ( = ?auto_1326347 ?auto_1326358 ) ) ( not ( = ?auto_1326347 ?auto_1326362 ) ) ( not ( = ?auto_1326348 ?auto_1326349 ) ) ( not ( = ?auto_1326348 ?auto_1326350 ) ) ( not ( = ?auto_1326348 ?auto_1326351 ) ) ( not ( = ?auto_1326348 ?auto_1326352 ) ) ( not ( = ?auto_1326348 ?auto_1326353 ) ) ( not ( = ?auto_1326348 ?auto_1326354 ) ) ( not ( = ?auto_1326348 ?auto_1326355 ) ) ( not ( = ?auto_1326348 ?auto_1326356 ) ) ( not ( = ?auto_1326348 ?auto_1326357 ) ) ( not ( = ?auto_1326348 ?auto_1326358 ) ) ( not ( = ?auto_1326348 ?auto_1326362 ) ) ( not ( = ?auto_1326349 ?auto_1326350 ) ) ( not ( = ?auto_1326349 ?auto_1326351 ) ) ( not ( = ?auto_1326349 ?auto_1326352 ) ) ( not ( = ?auto_1326349 ?auto_1326353 ) ) ( not ( = ?auto_1326349 ?auto_1326354 ) ) ( not ( = ?auto_1326349 ?auto_1326355 ) ) ( not ( = ?auto_1326349 ?auto_1326356 ) ) ( not ( = ?auto_1326349 ?auto_1326357 ) ) ( not ( = ?auto_1326349 ?auto_1326358 ) ) ( not ( = ?auto_1326349 ?auto_1326362 ) ) ( not ( = ?auto_1326350 ?auto_1326351 ) ) ( not ( = ?auto_1326350 ?auto_1326352 ) ) ( not ( = ?auto_1326350 ?auto_1326353 ) ) ( not ( = ?auto_1326350 ?auto_1326354 ) ) ( not ( = ?auto_1326350 ?auto_1326355 ) ) ( not ( = ?auto_1326350 ?auto_1326356 ) ) ( not ( = ?auto_1326350 ?auto_1326357 ) ) ( not ( = ?auto_1326350 ?auto_1326358 ) ) ( not ( = ?auto_1326350 ?auto_1326362 ) ) ( not ( = ?auto_1326351 ?auto_1326352 ) ) ( not ( = ?auto_1326351 ?auto_1326353 ) ) ( not ( = ?auto_1326351 ?auto_1326354 ) ) ( not ( = ?auto_1326351 ?auto_1326355 ) ) ( not ( = ?auto_1326351 ?auto_1326356 ) ) ( not ( = ?auto_1326351 ?auto_1326357 ) ) ( not ( = ?auto_1326351 ?auto_1326358 ) ) ( not ( = ?auto_1326351 ?auto_1326362 ) ) ( not ( = ?auto_1326352 ?auto_1326353 ) ) ( not ( = ?auto_1326352 ?auto_1326354 ) ) ( not ( = ?auto_1326352 ?auto_1326355 ) ) ( not ( = ?auto_1326352 ?auto_1326356 ) ) ( not ( = ?auto_1326352 ?auto_1326357 ) ) ( not ( = ?auto_1326352 ?auto_1326358 ) ) ( not ( = ?auto_1326352 ?auto_1326362 ) ) ( not ( = ?auto_1326353 ?auto_1326354 ) ) ( not ( = ?auto_1326353 ?auto_1326355 ) ) ( not ( = ?auto_1326353 ?auto_1326356 ) ) ( not ( = ?auto_1326353 ?auto_1326357 ) ) ( not ( = ?auto_1326353 ?auto_1326358 ) ) ( not ( = ?auto_1326353 ?auto_1326362 ) ) ( not ( = ?auto_1326354 ?auto_1326355 ) ) ( not ( = ?auto_1326354 ?auto_1326356 ) ) ( not ( = ?auto_1326354 ?auto_1326357 ) ) ( not ( = ?auto_1326354 ?auto_1326358 ) ) ( not ( = ?auto_1326354 ?auto_1326362 ) ) ( not ( = ?auto_1326355 ?auto_1326356 ) ) ( not ( = ?auto_1326355 ?auto_1326357 ) ) ( not ( = ?auto_1326355 ?auto_1326358 ) ) ( not ( = ?auto_1326355 ?auto_1326362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326356 ?auto_1326357 ?auto_1326358 )
      ( MAKE-14CRATE-VERIFY ?auto_1326344 ?auto_1326345 ?auto_1326346 ?auto_1326347 ?auto_1326348 ?auto_1326349 ?auto_1326350 ?auto_1326351 ?auto_1326352 ?auto_1326353 ?auto_1326354 ?auto_1326355 ?auto_1326356 ?auto_1326357 ?auto_1326358 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326548 - SURFACE
      ?auto_1326549 - SURFACE
      ?auto_1326550 - SURFACE
      ?auto_1326551 - SURFACE
      ?auto_1326552 - SURFACE
      ?auto_1326553 - SURFACE
      ?auto_1326554 - SURFACE
      ?auto_1326555 - SURFACE
      ?auto_1326556 - SURFACE
      ?auto_1326557 - SURFACE
      ?auto_1326558 - SURFACE
      ?auto_1326559 - SURFACE
      ?auto_1326560 - SURFACE
      ?auto_1326561 - SURFACE
      ?auto_1326562 - SURFACE
    )
    :vars
    (
      ?auto_1326564 - HOIST
      ?auto_1326565 - PLACE
      ?auto_1326563 - PLACE
      ?auto_1326568 - HOIST
      ?auto_1326566 - SURFACE
      ?auto_1326567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326564 ?auto_1326565 ) ( SURFACE-AT ?auto_1326561 ?auto_1326565 ) ( CLEAR ?auto_1326561 ) ( IS-CRATE ?auto_1326562 ) ( not ( = ?auto_1326561 ?auto_1326562 ) ) ( AVAILABLE ?auto_1326564 ) ( ON ?auto_1326561 ?auto_1326560 ) ( not ( = ?auto_1326560 ?auto_1326561 ) ) ( not ( = ?auto_1326560 ?auto_1326562 ) ) ( not ( = ?auto_1326563 ?auto_1326565 ) ) ( HOIST-AT ?auto_1326568 ?auto_1326563 ) ( not ( = ?auto_1326564 ?auto_1326568 ) ) ( AVAILABLE ?auto_1326568 ) ( SURFACE-AT ?auto_1326562 ?auto_1326563 ) ( ON ?auto_1326562 ?auto_1326566 ) ( CLEAR ?auto_1326562 ) ( not ( = ?auto_1326561 ?auto_1326566 ) ) ( not ( = ?auto_1326562 ?auto_1326566 ) ) ( not ( = ?auto_1326560 ?auto_1326566 ) ) ( TRUCK-AT ?auto_1326567 ?auto_1326565 ) ( ON ?auto_1326549 ?auto_1326548 ) ( ON ?auto_1326550 ?auto_1326549 ) ( ON ?auto_1326551 ?auto_1326550 ) ( ON ?auto_1326552 ?auto_1326551 ) ( ON ?auto_1326553 ?auto_1326552 ) ( ON ?auto_1326554 ?auto_1326553 ) ( ON ?auto_1326555 ?auto_1326554 ) ( ON ?auto_1326556 ?auto_1326555 ) ( ON ?auto_1326557 ?auto_1326556 ) ( ON ?auto_1326558 ?auto_1326557 ) ( ON ?auto_1326559 ?auto_1326558 ) ( ON ?auto_1326560 ?auto_1326559 ) ( not ( = ?auto_1326548 ?auto_1326549 ) ) ( not ( = ?auto_1326548 ?auto_1326550 ) ) ( not ( = ?auto_1326548 ?auto_1326551 ) ) ( not ( = ?auto_1326548 ?auto_1326552 ) ) ( not ( = ?auto_1326548 ?auto_1326553 ) ) ( not ( = ?auto_1326548 ?auto_1326554 ) ) ( not ( = ?auto_1326548 ?auto_1326555 ) ) ( not ( = ?auto_1326548 ?auto_1326556 ) ) ( not ( = ?auto_1326548 ?auto_1326557 ) ) ( not ( = ?auto_1326548 ?auto_1326558 ) ) ( not ( = ?auto_1326548 ?auto_1326559 ) ) ( not ( = ?auto_1326548 ?auto_1326560 ) ) ( not ( = ?auto_1326548 ?auto_1326561 ) ) ( not ( = ?auto_1326548 ?auto_1326562 ) ) ( not ( = ?auto_1326548 ?auto_1326566 ) ) ( not ( = ?auto_1326549 ?auto_1326550 ) ) ( not ( = ?auto_1326549 ?auto_1326551 ) ) ( not ( = ?auto_1326549 ?auto_1326552 ) ) ( not ( = ?auto_1326549 ?auto_1326553 ) ) ( not ( = ?auto_1326549 ?auto_1326554 ) ) ( not ( = ?auto_1326549 ?auto_1326555 ) ) ( not ( = ?auto_1326549 ?auto_1326556 ) ) ( not ( = ?auto_1326549 ?auto_1326557 ) ) ( not ( = ?auto_1326549 ?auto_1326558 ) ) ( not ( = ?auto_1326549 ?auto_1326559 ) ) ( not ( = ?auto_1326549 ?auto_1326560 ) ) ( not ( = ?auto_1326549 ?auto_1326561 ) ) ( not ( = ?auto_1326549 ?auto_1326562 ) ) ( not ( = ?auto_1326549 ?auto_1326566 ) ) ( not ( = ?auto_1326550 ?auto_1326551 ) ) ( not ( = ?auto_1326550 ?auto_1326552 ) ) ( not ( = ?auto_1326550 ?auto_1326553 ) ) ( not ( = ?auto_1326550 ?auto_1326554 ) ) ( not ( = ?auto_1326550 ?auto_1326555 ) ) ( not ( = ?auto_1326550 ?auto_1326556 ) ) ( not ( = ?auto_1326550 ?auto_1326557 ) ) ( not ( = ?auto_1326550 ?auto_1326558 ) ) ( not ( = ?auto_1326550 ?auto_1326559 ) ) ( not ( = ?auto_1326550 ?auto_1326560 ) ) ( not ( = ?auto_1326550 ?auto_1326561 ) ) ( not ( = ?auto_1326550 ?auto_1326562 ) ) ( not ( = ?auto_1326550 ?auto_1326566 ) ) ( not ( = ?auto_1326551 ?auto_1326552 ) ) ( not ( = ?auto_1326551 ?auto_1326553 ) ) ( not ( = ?auto_1326551 ?auto_1326554 ) ) ( not ( = ?auto_1326551 ?auto_1326555 ) ) ( not ( = ?auto_1326551 ?auto_1326556 ) ) ( not ( = ?auto_1326551 ?auto_1326557 ) ) ( not ( = ?auto_1326551 ?auto_1326558 ) ) ( not ( = ?auto_1326551 ?auto_1326559 ) ) ( not ( = ?auto_1326551 ?auto_1326560 ) ) ( not ( = ?auto_1326551 ?auto_1326561 ) ) ( not ( = ?auto_1326551 ?auto_1326562 ) ) ( not ( = ?auto_1326551 ?auto_1326566 ) ) ( not ( = ?auto_1326552 ?auto_1326553 ) ) ( not ( = ?auto_1326552 ?auto_1326554 ) ) ( not ( = ?auto_1326552 ?auto_1326555 ) ) ( not ( = ?auto_1326552 ?auto_1326556 ) ) ( not ( = ?auto_1326552 ?auto_1326557 ) ) ( not ( = ?auto_1326552 ?auto_1326558 ) ) ( not ( = ?auto_1326552 ?auto_1326559 ) ) ( not ( = ?auto_1326552 ?auto_1326560 ) ) ( not ( = ?auto_1326552 ?auto_1326561 ) ) ( not ( = ?auto_1326552 ?auto_1326562 ) ) ( not ( = ?auto_1326552 ?auto_1326566 ) ) ( not ( = ?auto_1326553 ?auto_1326554 ) ) ( not ( = ?auto_1326553 ?auto_1326555 ) ) ( not ( = ?auto_1326553 ?auto_1326556 ) ) ( not ( = ?auto_1326553 ?auto_1326557 ) ) ( not ( = ?auto_1326553 ?auto_1326558 ) ) ( not ( = ?auto_1326553 ?auto_1326559 ) ) ( not ( = ?auto_1326553 ?auto_1326560 ) ) ( not ( = ?auto_1326553 ?auto_1326561 ) ) ( not ( = ?auto_1326553 ?auto_1326562 ) ) ( not ( = ?auto_1326553 ?auto_1326566 ) ) ( not ( = ?auto_1326554 ?auto_1326555 ) ) ( not ( = ?auto_1326554 ?auto_1326556 ) ) ( not ( = ?auto_1326554 ?auto_1326557 ) ) ( not ( = ?auto_1326554 ?auto_1326558 ) ) ( not ( = ?auto_1326554 ?auto_1326559 ) ) ( not ( = ?auto_1326554 ?auto_1326560 ) ) ( not ( = ?auto_1326554 ?auto_1326561 ) ) ( not ( = ?auto_1326554 ?auto_1326562 ) ) ( not ( = ?auto_1326554 ?auto_1326566 ) ) ( not ( = ?auto_1326555 ?auto_1326556 ) ) ( not ( = ?auto_1326555 ?auto_1326557 ) ) ( not ( = ?auto_1326555 ?auto_1326558 ) ) ( not ( = ?auto_1326555 ?auto_1326559 ) ) ( not ( = ?auto_1326555 ?auto_1326560 ) ) ( not ( = ?auto_1326555 ?auto_1326561 ) ) ( not ( = ?auto_1326555 ?auto_1326562 ) ) ( not ( = ?auto_1326555 ?auto_1326566 ) ) ( not ( = ?auto_1326556 ?auto_1326557 ) ) ( not ( = ?auto_1326556 ?auto_1326558 ) ) ( not ( = ?auto_1326556 ?auto_1326559 ) ) ( not ( = ?auto_1326556 ?auto_1326560 ) ) ( not ( = ?auto_1326556 ?auto_1326561 ) ) ( not ( = ?auto_1326556 ?auto_1326562 ) ) ( not ( = ?auto_1326556 ?auto_1326566 ) ) ( not ( = ?auto_1326557 ?auto_1326558 ) ) ( not ( = ?auto_1326557 ?auto_1326559 ) ) ( not ( = ?auto_1326557 ?auto_1326560 ) ) ( not ( = ?auto_1326557 ?auto_1326561 ) ) ( not ( = ?auto_1326557 ?auto_1326562 ) ) ( not ( = ?auto_1326557 ?auto_1326566 ) ) ( not ( = ?auto_1326558 ?auto_1326559 ) ) ( not ( = ?auto_1326558 ?auto_1326560 ) ) ( not ( = ?auto_1326558 ?auto_1326561 ) ) ( not ( = ?auto_1326558 ?auto_1326562 ) ) ( not ( = ?auto_1326558 ?auto_1326566 ) ) ( not ( = ?auto_1326559 ?auto_1326560 ) ) ( not ( = ?auto_1326559 ?auto_1326561 ) ) ( not ( = ?auto_1326559 ?auto_1326562 ) ) ( not ( = ?auto_1326559 ?auto_1326566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326560 ?auto_1326561 ?auto_1326562 )
      ( MAKE-14CRATE-VERIFY ?auto_1326548 ?auto_1326549 ?auto_1326550 ?auto_1326551 ?auto_1326552 ?auto_1326553 ?auto_1326554 ?auto_1326555 ?auto_1326556 ?auto_1326557 ?auto_1326558 ?auto_1326559 ?auto_1326560 ?auto_1326561 ?auto_1326562 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326752 - SURFACE
      ?auto_1326753 - SURFACE
      ?auto_1326754 - SURFACE
      ?auto_1326755 - SURFACE
      ?auto_1326756 - SURFACE
      ?auto_1326757 - SURFACE
      ?auto_1326758 - SURFACE
      ?auto_1326759 - SURFACE
      ?auto_1326760 - SURFACE
      ?auto_1326761 - SURFACE
      ?auto_1326762 - SURFACE
      ?auto_1326763 - SURFACE
      ?auto_1326764 - SURFACE
      ?auto_1326765 - SURFACE
      ?auto_1326766 - SURFACE
    )
    :vars
    (
      ?auto_1326770 - HOIST
      ?auto_1326772 - PLACE
      ?auto_1326771 - PLACE
      ?auto_1326769 - HOIST
      ?auto_1326768 - SURFACE
      ?auto_1326767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326770 ?auto_1326772 ) ( IS-CRATE ?auto_1326766 ) ( not ( = ?auto_1326765 ?auto_1326766 ) ) ( not ( = ?auto_1326764 ?auto_1326765 ) ) ( not ( = ?auto_1326764 ?auto_1326766 ) ) ( not ( = ?auto_1326771 ?auto_1326772 ) ) ( HOIST-AT ?auto_1326769 ?auto_1326771 ) ( not ( = ?auto_1326770 ?auto_1326769 ) ) ( AVAILABLE ?auto_1326769 ) ( SURFACE-AT ?auto_1326766 ?auto_1326771 ) ( ON ?auto_1326766 ?auto_1326768 ) ( CLEAR ?auto_1326766 ) ( not ( = ?auto_1326765 ?auto_1326768 ) ) ( not ( = ?auto_1326766 ?auto_1326768 ) ) ( not ( = ?auto_1326764 ?auto_1326768 ) ) ( TRUCK-AT ?auto_1326767 ?auto_1326772 ) ( SURFACE-AT ?auto_1326764 ?auto_1326772 ) ( CLEAR ?auto_1326764 ) ( LIFTING ?auto_1326770 ?auto_1326765 ) ( IS-CRATE ?auto_1326765 ) ( ON ?auto_1326753 ?auto_1326752 ) ( ON ?auto_1326754 ?auto_1326753 ) ( ON ?auto_1326755 ?auto_1326754 ) ( ON ?auto_1326756 ?auto_1326755 ) ( ON ?auto_1326757 ?auto_1326756 ) ( ON ?auto_1326758 ?auto_1326757 ) ( ON ?auto_1326759 ?auto_1326758 ) ( ON ?auto_1326760 ?auto_1326759 ) ( ON ?auto_1326761 ?auto_1326760 ) ( ON ?auto_1326762 ?auto_1326761 ) ( ON ?auto_1326763 ?auto_1326762 ) ( ON ?auto_1326764 ?auto_1326763 ) ( not ( = ?auto_1326752 ?auto_1326753 ) ) ( not ( = ?auto_1326752 ?auto_1326754 ) ) ( not ( = ?auto_1326752 ?auto_1326755 ) ) ( not ( = ?auto_1326752 ?auto_1326756 ) ) ( not ( = ?auto_1326752 ?auto_1326757 ) ) ( not ( = ?auto_1326752 ?auto_1326758 ) ) ( not ( = ?auto_1326752 ?auto_1326759 ) ) ( not ( = ?auto_1326752 ?auto_1326760 ) ) ( not ( = ?auto_1326752 ?auto_1326761 ) ) ( not ( = ?auto_1326752 ?auto_1326762 ) ) ( not ( = ?auto_1326752 ?auto_1326763 ) ) ( not ( = ?auto_1326752 ?auto_1326764 ) ) ( not ( = ?auto_1326752 ?auto_1326765 ) ) ( not ( = ?auto_1326752 ?auto_1326766 ) ) ( not ( = ?auto_1326752 ?auto_1326768 ) ) ( not ( = ?auto_1326753 ?auto_1326754 ) ) ( not ( = ?auto_1326753 ?auto_1326755 ) ) ( not ( = ?auto_1326753 ?auto_1326756 ) ) ( not ( = ?auto_1326753 ?auto_1326757 ) ) ( not ( = ?auto_1326753 ?auto_1326758 ) ) ( not ( = ?auto_1326753 ?auto_1326759 ) ) ( not ( = ?auto_1326753 ?auto_1326760 ) ) ( not ( = ?auto_1326753 ?auto_1326761 ) ) ( not ( = ?auto_1326753 ?auto_1326762 ) ) ( not ( = ?auto_1326753 ?auto_1326763 ) ) ( not ( = ?auto_1326753 ?auto_1326764 ) ) ( not ( = ?auto_1326753 ?auto_1326765 ) ) ( not ( = ?auto_1326753 ?auto_1326766 ) ) ( not ( = ?auto_1326753 ?auto_1326768 ) ) ( not ( = ?auto_1326754 ?auto_1326755 ) ) ( not ( = ?auto_1326754 ?auto_1326756 ) ) ( not ( = ?auto_1326754 ?auto_1326757 ) ) ( not ( = ?auto_1326754 ?auto_1326758 ) ) ( not ( = ?auto_1326754 ?auto_1326759 ) ) ( not ( = ?auto_1326754 ?auto_1326760 ) ) ( not ( = ?auto_1326754 ?auto_1326761 ) ) ( not ( = ?auto_1326754 ?auto_1326762 ) ) ( not ( = ?auto_1326754 ?auto_1326763 ) ) ( not ( = ?auto_1326754 ?auto_1326764 ) ) ( not ( = ?auto_1326754 ?auto_1326765 ) ) ( not ( = ?auto_1326754 ?auto_1326766 ) ) ( not ( = ?auto_1326754 ?auto_1326768 ) ) ( not ( = ?auto_1326755 ?auto_1326756 ) ) ( not ( = ?auto_1326755 ?auto_1326757 ) ) ( not ( = ?auto_1326755 ?auto_1326758 ) ) ( not ( = ?auto_1326755 ?auto_1326759 ) ) ( not ( = ?auto_1326755 ?auto_1326760 ) ) ( not ( = ?auto_1326755 ?auto_1326761 ) ) ( not ( = ?auto_1326755 ?auto_1326762 ) ) ( not ( = ?auto_1326755 ?auto_1326763 ) ) ( not ( = ?auto_1326755 ?auto_1326764 ) ) ( not ( = ?auto_1326755 ?auto_1326765 ) ) ( not ( = ?auto_1326755 ?auto_1326766 ) ) ( not ( = ?auto_1326755 ?auto_1326768 ) ) ( not ( = ?auto_1326756 ?auto_1326757 ) ) ( not ( = ?auto_1326756 ?auto_1326758 ) ) ( not ( = ?auto_1326756 ?auto_1326759 ) ) ( not ( = ?auto_1326756 ?auto_1326760 ) ) ( not ( = ?auto_1326756 ?auto_1326761 ) ) ( not ( = ?auto_1326756 ?auto_1326762 ) ) ( not ( = ?auto_1326756 ?auto_1326763 ) ) ( not ( = ?auto_1326756 ?auto_1326764 ) ) ( not ( = ?auto_1326756 ?auto_1326765 ) ) ( not ( = ?auto_1326756 ?auto_1326766 ) ) ( not ( = ?auto_1326756 ?auto_1326768 ) ) ( not ( = ?auto_1326757 ?auto_1326758 ) ) ( not ( = ?auto_1326757 ?auto_1326759 ) ) ( not ( = ?auto_1326757 ?auto_1326760 ) ) ( not ( = ?auto_1326757 ?auto_1326761 ) ) ( not ( = ?auto_1326757 ?auto_1326762 ) ) ( not ( = ?auto_1326757 ?auto_1326763 ) ) ( not ( = ?auto_1326757 ?auto_1326764 ) ) ( not ( = ?auto_1326757 ?auto_1326765 ) ) ( not ( = ?auto_1326757 ?auto_1326766 ) ) ( not ( = ?auto_1326757 ?auto_1326768 ) ) ( not ( = ?auto_1326758 ?auto_1326759 ) ) ( not ( = ?auto_1326758 ?auto_1326760 ) ) ( not ( = ?auto_1326758 ?auto_1326761 ) ) ( not ( = ?auto_1326758 ?auto_1326762 ) ) ( not ( = ?auto_1326758 ?auto_1326763 ) ) ( not ( = ?auto_1326758 ?auto_1326764 ) ) ( not ( = ?auto_1326758 ?auto_1326765 ) ) ( not ( = ?auto_1326758 ?auto_1326766 ) ) ( not ( = ?auto_1326758 ?auto_1326768 ) ) ( not ( = ?auto_1326759 ?auto_1326760 ) ) ( not ( = ?auto_1326759 ?auto_1326761 ) ) ( not ( = ?auto_1326759 ?auto_1326762 ) ) ( not ( = ?auto_1326759 ?auto_1326763 ) ) ( not ( = ?auto_1326759 ?auto_1326764 ) ) ( not ( = ?auto_1326759 ?auto_1326765 ) ) ( not ( = ?auto_1326759 ?auto_1326766 ) ) ( not ( = ?auto_1326759 ?auto_1326768 ) ) ( not ( = ?auto_1326760 ?auto_1326761 ) ) ( not ( = ?auto_1326760 ?auto_1326762 ) ) ( not ( = ?auto_1326760 ?auto_1326763 ) ) ( not ( = ?auto_1326760 ?auto_1326764 ) ) ( not ( = ?auto_1326760 ?auto_1326765 ) ) ( not ( = ?auto_1326760 ?auto_1326766 ) ) ( not ( = ?auto_1326760 ?auto_1326768 ) ) ( not ( = ?auto_1326761 ?auto_1326762 ) ) ( not ( = ?auto_1326761 ?auto_1326763 ) ) ( not ( = ?auto_1326761 ?auto_1326764 ) ) ( not ( = ?auto_1326761 ?auto_1326765 ) ) ( not ( = ?auto_1326761 ?auto_1326766 ) ) ( not ( = ?auto_1326761 ?auto_1326768 ) ) ( not ( = ?auto_1326762 ?auto_1326763 ) ) ( not ( = ?auto_1326762 ?auto_1326764 ) ) ( not ( = ?auto_1326762 ?auto_1326765 ) ) ( not ( = ?auto_1326762 ?auto_1326766 ) ) ( not ( = ?auto_1326762 ?auto_1326768 ) ) ( not ( = ?auto_1326763 ?auto_1326764 ) ) ( not ( = ?auto_1326763 ?auto_1326765 ) ) ( not ( = ?auto_1326763 ?auto_1326766 ) ) ( not ( = ?auto_1326763 ?auto_1326768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326764 ?auto_1326765 ?auto_1326766 )
      ( MAKE-14CRATE-VERIFY ?auto_1326752 ?auto_1326753 ?auto_1326754 ?auto_1326755 ?auto_1326756 ?auto_1326757 ?auto_1326758 ?auto_1326759 ?auto_1326760 ?auto_1326761 ?auto_1326762 ?auto_1326763 ?auto_1326764 ?auto_1326765 ?auto_1326766 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326956 - SURFACE
      ?auto_1326957 - SURFACE
      ?auto_1326958 - SURFACE
      ?auto_1326959 - SURFACE
      ?auto_1326960 - SURFACE
      ?auto_1326961 - SURFACE
      ?auto_1326962 - SURFACE
      ?auto_1326963 - SURFACE
      ?auto_1326964 - SURFACE
      ?auto_1326965 - SURFACE
      ?auto_1326966 - SURFACE
      ?auto_1326967 - SURFACE
      ?auto_1326968 - SURFACE
      ?auto_1326969 - SURFACE
      ?auto_1326970 - SURFACE
    )
    :vars
    (
      ?auto_1326976 - HOIST
      ?auto_1326971 - PLACE
      ?auto_1326974 - PLACE
      ?auto_1326975 - HOIST
      ?auto_1326972 - SURFACE
      ?auto_1326973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326976 ?auto_1326971 ) ( IS-CRATE ?auto_1326970 ) ( not ( = ?auto_1326969 ?auto_1326970 ) ) ( not ( = ?auto_1326968 ?auto_1326969 ) ) ( not ( = ?auto_1326968 ?auto_1326970 ) ) ( not ( = ?auto_1326974 ?auto_1326971 ) ) ( HOIST-AT ?auto_1326975 ?auto_1326974 ) ( not ( = ?auto_1326976 ?auto_1326975 ) ) ( AVAILABLE ?auto_1326975 ) ( SURFACE-AT ?auto_1326970 ?auto_1326974 ) ( ON ?auto_1326970 ?auto_1326972 ) ( CLEAR ?auto_1326970 ) ( not ( = ?auto_1326969 ?auto_1326972 ) ) ( not ( = ?auto_1326970 ?auto_1326972 ) ) ( not ( = ?auto_1326968 ?auto_1326972 ) ) ( TRUCK-AT ?auto_1326973 ?auto_1326971 ) ( SURFACE-AT ?auto_1326968 ?auto_1326971 ) ( CLEAR ?auto_1326968 ) ( IS-CRATE ?auto_1326969 ) ( AVAILABLE ?auto_1326976 ) ( IN ?auto_1326969 ?auto_1326973 ) ( ON ?auto_1326957 ?auto_1326956 ) ( ON ?auto_1326958 ?auto_1326957 ) ( ON ?auto_1326959 ?auto_1326958 ) ( ON ?auto_1326960 ?auto_1326959 ) ( ON ?auto_1326961 ?auto_1326960 ) ( ON ?auto_1326962 ?auto_1326961 ) ( ON ?auto_1326963 ?auto_1326962 ) ( ON ?auto_1326964 ?auto_1326963 ) ( ON ?auto_1326965 ?auto_1326964 ) ( ON ?auto_1326966 ?auto_1326965 ) ( ON ?auto_1326967 ?auto_1326966 ) ( ON ?auto_1326968 ?auto_1326967 ) ( not ( = ?auto_1326956 ?auto_1326957 ) ) ( not ( = ?auto_1326956 ?auto_1326958 ) ) ( not ( = ?auto_1326956 ?auto_1326959 ) ) ( not ( = ?auto_1326956 ?auto_1326960 ) ) ( not ( = ?auto_1326956 ?auto_1326961 ) ) ( not ( = ?auto_1326956 ?auto_1326962 ) ) ( not ( = ?auto_1326956 ?auto_1326963 ) ) ( not ( = ?auto_1326956 ?auto_1326964 ) ) ( not ( = ?auto_1326956 ?auto_1326965 ) ) ( not ( = ?auto_1326956 ?auto_1326966 ) ) ( not ( = ?auto_1326956 ?auto_1326967 ) ) ( not ( = ?auto_1326956 ?auto_1326968 ) ) ( not ( = ?auto_1326956 ?auto_1326969 ) ) ( not ( = ?auto_1326956 ?auto_1326970 ) ) ( not ( = ?auto_1326956 ?auto_1326972 ) ) ( not ( = ?auto_1326957 ?auto_1326958 ) ) ( not ( = ?auto_1326957 ?auto_1326959 ) ) ( not ( = ?auto_1326957 ?auto_1326960 ) ) ( not ( = ?auto_1326957 ?auto_1326961 ) ) ( not ( = ?auto_1326957 ?auto_1326962 ) ) ( not ( = ?auto_1326957 ?auto_1326963 ) ) ( not ( = ?auto_1326957 ?auto_1326964 ) ) ( not ( = ?auto_1326957 ?auto_1326965 ) ) ( not ( = ?auto_1326957 ?auto_1326966 ) ) ( not ( = ?auto_1326957 ?auto_1326967 ) ) ( not ( = ?auto_1326957 ?auto_1326968 ) ) ( not ( = ?auto_1326957 ?auto_1326969 ) ) ( not ( = ?auto_1326957 ?auto_1326970 ) ) ( not ( = ?auto_1326957 ?auto_1326972 ) ) ( not ( = ?auto_1326958 ?auto_1326959 ) ) ( not ( = ?auto_1326958 ?auto_1326960 ) ) ( not ( = ?auto_1326958 ?auto_1326961 ) ) ( not ( = ?auto_1326958 ?auto_1326962 ) ) ( not ( = ?auto_1326958 ?auto_1326963 ) ) ( not ( = ?auto_1326958 ?auto_1326964 ) ) ( not ( = ?auto_1326958 ?auto_1326965 ) ) ( not ( = ?auto_1326958 ?auto_1326966 ) ) ( not ( = ?auto_1326958 ?auto_1326967 ) ) ( not ( = ?auto_1326958 ?auto_1326968 ) ) ( not ( = ?auto_1326958 ?auto_1326969 ) ) ( not ( = ?auto_1326958 ?auto_1326970 ) ) ( not ( = ?auto_1326958 ?auto_1326972 ) ) ( not ( = ?auto_1326959 ?auto_1326960 ) ) ( not ( = ?auto_1326959 ?auto_1326961 ) ) ( not ( = ?auto_1326959 ?auto_1326962 ) ) ( not ( = ?auto_1326959 ?auto_1326963 ) ) ( not ( = ?auto_1326959 ?auto_1326964 ) ) ( not ( = ?auto_1326959 ?auto_1326965 ) ) ( not ( = ?auto_1326959 ?auto_1326966 ) ) ( not ( = ?auto_1326959 ?auto_1326967 ) ) ( not ( = ?auto_1326959 ?auto_1326968 ) ) ( not ( = ?auto_1326959 ?auto_1326969 ) ) ( not ( = ?auto_1326959 ?auto_1326970 ) ) ( not ( = ?auto_1326959 ?auto_1326972 ) ) ( not ( = ?auto_1326960 ?auto_1326961 ) ) ( not ( = ?auto_1326960 ?auto_1326962 ) ) ( not ( = ?auto_1326960 ?auto_1326963 ) ) ( not ( = ?auto_1326960 ?auto_1326964 ) ) ( not ( = ?auto_1326960 ?auto_1326965 ) ) ( not ( = ?auto_1326960 ?auto_1326966 ) ) ( not ( = ?auto_1326960 ?auto_1326967 ) ) ( not ( = ?auto_1326960 ?auto_1326968 ) ) ( not ( = ?auto_1326960 ?auto_1326969 ) ) ( not ( = ?auto_1326960 ?auto_1326970 ) ) ( not ( = ?auto_1326960 ?auto_1326972 ) ) ( not ( = ?auto_1326961 ?auto_1326962 ) ) ( not ( = ?auto_1326961 ?auto_1326963 ) ) ( not ( = ?auto_1326961 ?auto_1326964 ) ) ( not ( = ?auto_1326961 ?auto_1326965 ) ) ( not ( = ?auto_1326961 ?auto_1326966 ) ) ( not ( = ?auto_1326961 ?auto_1326967 ) ) ( not ( = ?auto_1326961 ?auto_1326968 ) ) ( not ( = ?auto_1326961 ?auto_1326969 ) ) ( not ( = ?auto_1326961 ?auto_1326970 ) ) ( not ( = ?auto_1326961 ?auto_1326972 ) ) ( not ( = ?auto_1326962 ?auto_1326963 ) ) ( not ( = ?auto_1326962 ?auto_1326964 ) ) ( not ( = ?auto_1326962 ?auto_1326965 ) ) ( not ( = ?auto_1326962 ?auto_1326966 ) ) ( not ( = ?auto_1326962 ?auto_1326967 ) ) ( not ( = ?auto_1326962 ?auto_1326968 ) ) ( not ( = ?auto_1326962 ?auto_1326969 ) ) ( not ( = ?auto_1326962 ?auto_1326970 ) ) ( not ( = ?auto_1326962 ?auto_1326972 ) ) ( not ( = ?auto_1326963 ?auto_1326964 ) ) ( not ( = ?auto_1326963 ?auto_1326965 ) ) ( not ( = ?auto_1326963 ?auto_1326966 ) ) ( not ( = ?auto_1326963 ?auto_1326967 ) ) ( not ( = ?auto_1326963 ?auto_1326968 ) ) ( not ( = ?auto_1326963 ?auto_1326969 ) ) ( not ( = ?auto_1326963 ?auto_1326970 ) ) ( not ( = ?auto_1326963 ?auto_1326972 ) ) ( not ( = ?auto_1326964 ?auto_1326965 ) ) ( not ( = ?auto_1326964 ?auto_1326966 ) ) ( not ( = ?auto_1326964 ?auto_1326967 ) ) ( not ( = ?auto_1326964 ?auto_1326968 ) ) ( not ( = ?auto_1326964 ?auto_1326969 ) ) ( not ( = ?auto_1326964 ?auto_1326970 ) ) ( not ( = ?auto_1326964 ?auto_1326972 ) ) ( not ( = ?auto_1326965 ?auto_1326966 ) ) ( not ( = ?auto_1326965 ?auto_1326967 ) ) ( not ( = ?auto_1326965 ?auto_1326968 ) ) ( not ( = ?auto_1326965 ?auto_1326969 ) ) ( not ( = ?auto_1326965 ?auto_1326970 ) ) ( not ( = ?auto_1326965 ?auto_1326972 ) ) ( not ( = ?auto_1326966 ?auto_1326967 ) ) ( not ( = ?auto_1326966 ?auto_1326968 ) ) ( not ( = ?auto_1326966 ?auto_1326969 ) ) ( not ( = ?auto_1326966 ?auto_1326970 ) ) ( not ( = ?auto_1326966 ?auto_1326972 ) ) ( not ( = ?auto_1326967 ?auto_1326968 ) ) ( not ( = ?auto_1326967 ?auto_1326969 ) ) ( not ( = ?auto_1326967 ?auto_1326970 ) ) ( not ( = ?auto_1326967 ?auto_1326972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326968 ?auto_1326969 ?auto_1326970 )
      ( MAKE-14CRATE-VERIFY ?auto_1326956 ?auto_1326957 ?auto_1326958 ?auto_1326959 ?auto_1326960 ?auto_1326961 ?auto_1326962 ?auto_1326963 ?auto_1326964 ?auto_1326965 ?auto_1326966 ?auto_1326967 ?auto_1326968 ?auto_1326969 ?auto_1326970 ) )
  )

)

