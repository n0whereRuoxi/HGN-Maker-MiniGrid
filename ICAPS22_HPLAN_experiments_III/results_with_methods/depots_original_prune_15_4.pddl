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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021322 - SURFACE
      ?auto_2021323 - SURFACE
    )
    :vars
    (
      ?auto_2021324 - HOIST
      ?auto_2021325 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021324 ?auto_2021325 ) ( SURFACE-AT ?auto_2021322 ?auto_2021325 ) ( CLEAR ?auto_2021322 ) ( LIFTING ?auto_2021324 ?auto_2021323 ) ( IS-CRATE ?auto_2021323 ) ( not ( = ?auto_2021322 ?auto_2021323 ) ) )
    :subtasks
    ( ( !DROP ?auto_2021324 ?auto_2021323 ?auto_2021322 ?auto_2021325 )
      ( MAKE-1CRATE-VERIFY ?auto_2021322 ?auto_2021323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021326 - SURFACE
      ?auto_2021327 - SURFACE
    )
    :vars
    (
      ?auto_2021328 - HOIST
      ?auto_2021329 - PLACE
      ?auto_2021330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021328 ?auto_2021329 ) ( SURFACE-AT ?auto_2021326 ?auto_2021329 ) ( CLEAR ?auto_2021326 ) ( IS-CRATE ?auto_2021327 ) ( not ( = ?auto_2021326 ?auto_2021327 ) ) ( TRUCK-AT ?auto_2021330 ?auto_2021329 ) ( AVAILABLE ?auto_2021328 ) ( IN ?auto_2021327 ?auto_2021330 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021328 ?auto_2021327 ?auto_2021330 ?auto_2021329 )
      ( MAKE-1CRATE ?auto_2021326 ?auto_2021327 )
      ( MAKE-1CRATE-VERIFY ?auto_2021326 ?auto_2021327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021331 - SURFACE
      ?auto_2021332 - SURFACE
    )
    :vars
    (
      ?auto_2021335 - HOIST
      ?auto_2021334 - PLACE
      ?auto_2021333 - TRUCK
      ?auto_2021336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021335 ?auto_2021334 ) ( SURFACE-AT ?auto_2021331 ?auto_2021334 ) ( CLEAR ?auto_2021331 ) ( IS-CRATE ?auto_2021332 ) ( not ( = ?auto_2021331 ?auto_2021332 ) ) ( AVAILABLE ?auto_2021335 ) ( IN ?auto_2021332 ?auto_2021333 ) ( TRUCK-AT ?auto_2021333 ?auto_2021336 ) ( not ( = ?auto_2021336 ?auto_2021334 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021333 ?auto_2021336 ?auto_2021334 )
      ( MAKE-1CRATE ?auto_2021331 ?auto_2021332 )
      ( MAKE-1CRATE-VERIFY ?auto_2021331 ?auto_2021332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021337 - SURFACE
      ?auto_2021338 - SURFACE
    )
    :vars
    (
      ?auto_2021341 - HOIST
      ?auto_2021340 - PLACE
      ?auto_2021339 - TRUCK
      ?auto_2021342 - PLACE
      ?auto_2021343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021341 ?auto_2021340 ) ( SURFACE-AT ?auto_2021337 ?auto_2021340 ) ( CLEAR ?auto_2021337 ) ( IS-CRATE ?auto_2021338 ) ( not ( = ?auto_2021337 ?auto_2021338 ) ) ( AVAILABLE ?auto_2021341 ) ( TRUCK-AT ?auto_2021339 ?auto_2021342 ) ( not ( = ?auto_2021342 ?auto_2021340 ) ) ( HOIST-AT ?auto_2021343 ?auto_2021342 ) ( LIFTING ?auto_2021343 ?auto_2021338 ) ( not ( = ?auto_2021341 ?auto_2021343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021343 ?auto_2021338 ?auto_2021339 ?auto_2021342 )
      ( MAKE-1CRATE ?auto_2021337 ?auto_2021338 )
      ( MAKE-1CRATE-VERIFY ?auto_2021337 ?auto_2021338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021344 - SURFACE
      ?auto_2021345 - SURFACE
    )
    :vars
    (
      ?auto_2021347 - HOIST
      ?auto_2021349 - PLACE
      ?auto_2021348 - TRUCK
      ?auto_2021346 - PLACE
      ?auto_2021350 - HOIST
      ?auto_2021351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021347 ?auto_2021349 ) ( SURFACE-AT ?auto_2021344 ?auto_2021349 ) ( CLEAR ?auto_2021344 ) ( IS-CRATE ?auto_2021345 ) ( not ( = ?auto_2021344 ?auto_2021345 ) ) ( AVAILABLE ?auto_2021347 ) ( TRUCK-AT ?auto_2021348 ?auto_2021346 ) ( not ( = ?auto_2021346 ?auto_2021349 ) ) ( HOIST-AT ?auto_2021350 ?auto_2021346 ) ( not ( = ?auto_2021347 ?auto_2021350 ) ) ( AVAILABLE ?auto_2021350 ) ( SURFACE-AT ?auto_2021345 ?auto_2021346 ) ( ON ?auto_2021345 ?auto_2021351 ) ( CLEAR ?auto_2021345 ) ( not ( = ?auto_2021344 ?auto_2021351 ) ) ( not ( = ?auto_2021345 ?auto_2021351 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021350 ?auto_2021345 ?auto_2021351 ?auto_2021346 )
      ( MAKE-1CRATE ?auto_2021344 ?auto_2021345 )
      ( MAKE-1CRATE-VERIFY ?auto_2021344 ?auto_2021345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021352 - SURFACE
      ?auto_2021353 - SURFACE
    )
    :vars
    (
      ?auto_2021356 - HOIST
      ?auto_2021355 - PLACE
      ?auto_2021357 - PLACE
      ?auto_2021354 - HOIST
      ?auto_2021359 - SURFACE
      ?auto_2021358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021356 ?auto_2021355 ) ( SURFACE-AT ?auto_2021352 ?auto_2021355 ) ( CLEAR ?auto_2021352 ) ( IS-CRATE ?auto_2021353 ) ( not ( = ?auto_2021352 ?auto_2021353 ) ) ( AVAILABLE ?auto_2021356 ) ( not ( = ?auto_2021357 ?auto_2021355 ) ) ( HOIST-AT ?auto_2021354 ?auto_2021357 ) ( not ( = ?auto_2021356 ?auto_2021354 ) ) ( AVAILABLE ?auto_2021354 ) ( SURFACE-AT ?auto_2021353 ?auto_2021357 ) ( ON ?auto_2021353 ?auto_2021359 ) ( CLEAR ?auto_2021353 ) ( not ( = ?auto_2021352 ?auto_2021359 ) ) ( not ( = ?auto_2021353 ?auto_2021359 ) ) ( TRUCK-AT ?auto_2021358 ?auto_2021355 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021358 ?auto_2021355 ?auto_2021357 )
      ( MAKE-1CRATE ?auto_2021352 ?auto_2021353 )
      ( MAKE-1CRATE-VERIFY ?auto_2021352 ?auto_2021353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021369 - SURFACE
      ?auto_2021370 - SURFACE
      ?auto_2021371 - SURFACE
    )
    :vars
    (
      ?auto_2021372 - HOIST
      ?auto_2021373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021372 ?auto_2021373 ) ( SURFACE-AT ?auto_2021370 ?auto_2021373 ) ( CLEAR ?auto_2021370 ) ( LIFTING ?auto_2021372 ?auto_2021371 ) ( IS-CRATE ?auto_2021371 ) ( not ( = ?auto_2021370 ?auto_2021371 ) ) ( ON ?auto_2021370 ?auto_2021369 ) ( not ( = ?auto_2021369 ?auto_2021370 ) ) ( not ( = ?auto_2021369 ?auto_2021371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021370 ?auto_2021371 )
      ( MAKE-2CRATE-VERIFY ?auto_2021369 ?auto_2021370 ?auto_2021371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021379 - SURFACE
      ?auto_2021380 - SURFACE
      ?auto_2021381 - SURFACE
    )
    :vars
    (
      ?auto_2021384 - HOIST
      ?auto_2021383 - PLACE
      ?auto_2021382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021384 ?auto_2021383 ) ( SURFACE-AT ?auto_2021380 ?auto_2021383 ) ( CLEAR ?auto_2021380 ) ( IS-CRATE ?auto_2021381 ) ( not ( = ?auto_2021380 ?auto_2021381 ) ) ( TRUCK-AT ?auto_2021382 ?auto_2021383 ) ( AVAILABLE ?auto_2021384 ) ( IN ?auto_2021381 ?auto_2021382 ) ( ON ?auto_2021380 ?auto_2021379 ) ( not ( = ?auto_2021379 ?auto_2021380 ) ) ( not ( = ?auto_2021379 ?auto_2021381 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021380 ?auto_2021381 )
      ( MAKE-2CRATE-VERIFY ?auto_2021379 ?auto_2021380 ?auto_2021381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021385 - SURFACE
      ?auto_2021386 - SURFACE
    )
    :vars
    (
      ?auto_2021390 - HOIST
      ?auto_2021389 - PLACE
      ?auto_2021388 - TRUCK
      ?auto_2021387 - SURFACE
      ?auto_2021391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021390 ?auto_2021389 ) ( SURFACE-AT ?auto_2021385 ?auto_2021389 ) ( CLEAR ?auto_2021385 ) ( IS-CRATE ?auto_2021386 ) ( not ( = ?auto_2021385 ?auto_2021386 ) ) ( AVAILABLE ?auto_2021390 ) ( IN ?auto_2021386 ?auto_2021388 ) ( ON ?auto_2021385 ?auto_2021387 ) ( not ( = ?auto_2021387 ?auto_2021385 ) ) ( not ( = ?auto_2021387 ?auto_2021386 ) ) ( TRUCK-AT ?auto_2021388 ?auto_2021391 ) ( not ( = ?auto_2021391 ?auto_2021389 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021388 ?auto_2021391 ?auto_2021389 )
      ( MAKE-2CRATE ?auto_2021387 ?auto_2021385 ?auto_2021386 )
      ( MAKE-1CRATE-VERIFY ?auto_2021385 ?auto_2021386 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021392 - SURFACE
      ?auto_2021393 - SURFACE
      ?auto_2021394 - SURFACE
    )
    :vars
    (
      ?auto_2021396 - HOIST
      ?auto_2021397 - PLACE
      ?auto_2021398 - TRUCK
      ?auto_2021395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021396 ?auto_2021397 ) ( SURFACE-AT ?auto_2021393 ?auto_2021397 ) ( CLEAR ?auto_2021393 ) ( IS-CRATE ?auto_2021394 ) ( not ( = ?auto_2021393 ?auto_2021394 ) ) ( AVAILABLE ?auto_2021396 ) ( IN ?auto_2021394 ?auto_2021398 ) ( ON ?auto_2021393 ?auto_2021392 ) ( not ( = ?auto_2021392 ?auto_2021393 ) ) ( not ( = ?auto_2021392 ?auto_2021394 ) ) ( TRUCK-AT ?auto_2021398 ?auto_2021395 ) ( not ( = ?auto_2021395 ?auto_2021397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021393 ?auto_2021394 )
      ( MAKE-2CRATE-VERIFY ?auto_2021392 ?auto_2021393 ?auto_2021394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021399 - SURFACE
      ?auto_2021400 - SURFACE
    )
    :vars
    (
      ?auto_2021403 - HOIST
      ?auto_2021404 - PLACE
      ?auto_2021402 - SURFACE
      ?auto_2021401 - TRUCK
      ?auto_2021405 - PLACE
      ?auto_2021406 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021403 ?auto_2021404 ) ( SURFACE-AT ?auto_2021399 ?auto_2021404 ) ( CLEAR ?auto_2021399 ) ( IS-CRATE ?auto_2021400 ) ( not ( = ?auto_2021399 ?auto_2021400 ) ) ( AVAILABLE ?auto_2021403 ) ( ON ?auto_2021399 ?auto_2021402 ) ( not ( = ?auto_2021402 ?auto_2021399 ) ) ( not ( = ?auto_2021402 ?auto_2021400 ) ) ( TRUCK-AT ?auto_2021401 ?auto_2021405 ) ( not ( = ?auto_2021405 ?auto_2021404 ) ) ( HOIST-AT ?auto_2021406 ?auto_2021405 ) ( LIFTING ?auto_2021406 ?auto_2021400 ) ( not ( = ?auto_2021403 ?auto_2021406 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021406 ?auto_2021400 ?auto_2021401 ?auto_2021405 )
      ( MAKE-2CRATE ?auto_2021402 ?auto_2021399 ?auto_2021400 )
      ( MAKE-1CRATE-VERIFY ?auto_2021399 ?auto_2021400 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021407 - SURFACE
      ?auto_2021408 - SURFACE
      ?auto_2021409 - SURFACE
    )
    :vars
    (
      ?auto_2021414 - HOIST
      ?auto_2021412 - PLACE
      ?auto_2021411 - TRUCK
      ?auto_2021413 - PLACE
      ?auto_2021410 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021414 ?auto_2021412 ) ( SURFACE-AT ?auto_2021408 ?auto_2021412 ) ( CLEAR ?auto_2021408 ) ( IS-CRATE ?auto_2021409 ) ( not ( = ?auto_2021408 ?auto_2021409 ) ) ( AVAILABLE ?auto_2021414 ) ( ON ?auto_2021408 ?auto_2021407 ) ( not ( = ?auto_2021407 ?auto_2021408 ) ) ( not ( = ?auto_2021407 ?auto_2021409 ) ) ( TRUCK-AT ?auto_2021411 ?auto_2021413 ) ( not ( = ?auto_2021413 ?auto_2021412 ) ) ( HOIST-AT ?auto_2021410 ?auto_2021413 ) ( LIFTING ?auto_2021410 ?auto_2021409 ) ( not ( = ?auto_2021414 ?auto_2021410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021408 ?auto_2021409 )
      ( MAKE-2CRATE-VERIFY ?auto_2021407 ?auto_2021408 ?auto_2021409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021415 - SURFACE
      ?auto_2021416 - SURFACE
    )
    :vars
    (
      ?auto_2021421 - HOIST
      ?auto_2021420 - PLACE
      ?auto_2021419 - SURFACE
      ?auto_2021417 - TRUCK
      ?auto_2021418 - PLACE
      ?auto_2021422 - HOIST
      ?auto_2021423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021421 ?auto_2021420 ) ( SURFACE-AT ?auto_2021415 ?auto_2021420 ) ( CLEAR ?auto_2021415 ) ( IS-CRATE ?auto_2021416 ) ( not ( = ?auto_2021415 ?auto_2021416 ) ) ( AVAILABLE ?auto_2021421 ) ( ON ?auto_2021415 ?auto_2021419 ) ( not ( = ?auto_2021419 ?auto_2021415 ) ) ( not ( = ?auto_2021419 ?auto_2021416 ) ) ( TRUCK-AT ?auto_2021417 ?auto_2021418 ) ( not ( = ?auto_2021418 ?auto_2021420 ) ) ( HOIST-AT ?auto_2021422 ?auto_2021418 ) ( not ( = ?auto_2021421 ?auto_2021422 ) ) ( AVAILABLE ?auto_2021422 ) ( SURFACE-AT ?auto_2021416 ?auto_2021418 ) ( ON ?auto_2021416 ?auto_2021423 ) ( CLEAR ?auto_2021416 ) ( not ( = ?auto_2021415 ?auto_2021423 ) ) ( not ( = ?auto_2021416 ?auto_2021423 ) ) ( not ( = ?auto_2021419 ?auto_2021423 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021422 ?auto_2021416 ?auto_2021423 ?auto_2021418 )
      ( MAKE-2CRATE ?auto_2021419 ?auto_2021415 ?auto_2021416 )
      ( MAKE-1CRATE-VERIFY ?auto_2021415 ?auto_2021416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021424 - SURFACE
      ?auto_2021425 - SURFACE
      ?auto_2021426 - SURFACE
    )
    :vars
    (
      ?auto_2021431 - HOIST
      ?auto_2021429 - PLACE
      ?auto_2021432 - TRUCK
      ?auto_2021428 - PLACE
      ?auto_2021427 - HOIST
      ?auto_2021430 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021431 ?auto_2021429 ) ( SURFACE-AT ?auto_2021425 ?auto_2021429 ) ( CLEAR ?auto_2021425 ) ( IS-CRATE ?auto_2021426 ) ( not ( = ?auto_2021425 ?auto_2021426 ) ) ( AVAILABLE ?auto_2021431 ) ( ON ?auto_2021425 ?auto_2021424 ) ( not ( = ?auto_2021424 ?auto_2021425 ) ) ( not ( = ?auto_2021424 ?auto_2021426 ) ) ( TRUCK-AT ?auto_2021432 ?auto_2021428 ) ( not ( = ?auto_2021428 ?auto_2021429 ) ) ( HOIST-AT ?auto_2021427 ?auto_2021428 ) ( not ( = ?auto_2021431 ?auto_2021427 ) ) ( AVAILABLE ?auto_2021427 ) ( SURFACE-AT ?auto_2021426 ?auto_2021428 ) ( ON ?auto_2021426 ?auto_2021430 ) ( CLEAR ?auto_2021426 ) ( not ( = ?auto_2021425 ?auto_2021430 ) ) ( not ( = ?auto_2021426 ?auto_2021430 ) ) ( not ( = ?auto_2021424 ?auto_2021430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021425 ?auto_2021426 )
      ( MAKE-2CRATE-VERIFY ?auto_2021424 ?auto_2021425 ?auto_2021426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021433 - SURFACE
      ?auto_2021434 - SURFACE
    )
    :vars
    (
      ?auto_2021436 - HOIST
      ?auto_2021437 - PLACE
      ?auto_2021440 - SURFACE
      ?auto_2021441 - PLACE
      ?auto_2021435 - HOIST
      ?auto_2021438 - SURFACE
      ?auto_2021439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021436 ?auto_2021437 ) ( SURFACE-AT ?auto_2021433 ?auto_2021437 ) ( CLEAR ?auto_2021433 ) ( IS-CRATE ?auto_2021434 ) ( not ( = ?auto_2021433 ?auto_2021434 ) ) ( AVAILABLE ?auto_2021436 ) ( ON ?auto_2021433 ?auto_2021440 ) ( not ( = ?auto_2021440 ?auto_2021433 ) ) ( not ( = ?auto_2021440 ?auto_2021434 ) ) ( not ( = ?auto_2021441 ?auto_2021437 ) ) ( HOIST-AT ?auto_2021435 ?auto_2021441 ) ( not ( = ?auto_2021436 ?auto_2021435 ) ) ( AVAILABLE ?auto_2021435 ) ( SURFACE-AT ?auto_2021434 ?auto_2021441 ) ( ON ?auto_2021434 ?auto_2021438 ) ( CLEAR ?auto_2021434 ) ( not ( = ?auto_2021433 ?auto_2021438 ) ) ( not ( = ?auto_2021434 ?auto_2021438 ) ) ( not ( = ?auto_2021440 ?auto_2021438 ) ) ( TRUCK-AT ?auto_2021439 ?auto_2021437 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021439 ?auto_2021437 ?auto_2021441 )
      ( MAKE-2CRATE ?auto_2021440 ?auto_2021433 ?auto_2021434 )
      ( MAKE-1CRATE-VERIFY ?auto_2021433 ?auto_2021434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021442 - SURFACE
      ?auto_2021443 - SURFACE
      ?auto_2021444 - SURFACE
    )
    :vars
    (
      ?auto_2021445 - HOIST
      ?auto_2021446 - PLACE
      ?auto_2021448 - PLACE
      ?auto_2021449 - HOIST
      ?auto_2021447 - SURFACE
      ?auto_2021450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021445 ?auto_2021446 ) ( SURFACE-AT ?auto_2021443 ?auto_2021446 ) ( CLEAR ?auto_2021443 ) ( IS-CRATE ?auto_2021444 ) ( not ( = ?auto_2021443 ?auto_2021444 ) ) ( AVAILABLE ?auto_2021445 ) ( ON ?auto_2021443 ?auto_2021442 ) ( not ( = ?auto_2021442 ?auto_2021443 ) ) ( not ( = ?auto_2021442 ?auto_2021444 ) ) ( not ( = ?auto_2021448 ?auto_2021446 ) ) ( HOIST-AT ?auto_2021449 ?auto_2021448 ) ( not ( = ?auto_2021445 ?auto_2021449 ) ) ( AVAILABLE ?auto_2021449 ) ( SURFACE-AT ?auto_2021444 ?auto_2021448 ) ( ON ?auto_2021444 ?auto_2021447 ) ( CLEAR ?auto_2021444 ) ( not ( = ?auto_2021443 ?auto_2021447 ) ) ( not ( = ?auto_2021444 ?auto_2021447 ) ) ( not ( = ?auto_2021442 ?auto_2021447 ) ) ( TRUCK-AT ?auto_2021450 ?auto_2021446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021443 ?auto_2021444 )
      ( MAKE-2CRATE-VERIFY ?auto_2021442 ?auto_2021443 ?auto_2021444 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021451 - SURFACE
      ?auto_2021452 - SURFACE
    )
    :vars
    (
      ?auto_2021455 - HOIST
      ?auto_2021459 - PLACE
      ?auto_2021457 - SURFACE
      ?auto_2021458 - PLACE
      ?auto_2021454 - HOIST
      ?auto_2021453 - SURFACE
      ?auto_2021456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021455 ?auto_2021459 ) ( IS-CRATE ?auto_2021452 ) ( not ( = ?auto_2021451 ?auto_2021452 ) ) ( not ( = ?auto_2021457 ?auto_2021451 ) ) ( not ( = ?auto_2021457 ?auto_2021452 ) ) ( not ( = ?auto_2021458 ?auto_2021459 ) ) ( HOIST-AT ?auto_2021454 ?auto_2021458 ) ( not ( = ?auto_2021455 ?auto_2021454 ) ) ( AVAILABLE ?auto_2021454 ) ( SURFACE-AT ?auto_2021452 ?auto_2021458 ) ( ON ?auto_2021452 ?auto_2021453 ) ( CLEAR ?auto_2021452 ) ( not ( = ?auto_2021451 ?auto_2021453 ) ) ( not ( = ?auto_2021452 ?auto_2021453 ) ) ( not ( = ?auto_2021457 ?auto_2021453 ) ) ( TRUCK-AT ?auto_2021456 ?auto_2021459 ) ( SURFACE-AT ?auto_2021457 ?auto_2021459 ) ( CLEAR ?auto_2021457 ) ( LIFTING ?auto_2021455 ?auto_2021451 ) ( IS-CRATE ?auto_2021451 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021457 ?auto_2021451 )
      ( MAKE-2CRATE ?auto_2021457 ?auto_2021451 ?auto_2021452 )
      ( MAKE-1CRATE-VERIFY ?auto_2021451 ?auto_2021452 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021460 - SURFACE
      ?auto_2021461 - SURFACE
      ?auto_2021462 - SURFACE
    )
    :vars
    (
      ?auto_2021468 - HOIST
      ?auto_2021467 - PLACE
      ?auto_2021463 - PLACE
      ?auto_2021466 - HOIST
      ?auto_2021464 - SURFACE
      ?auto_2021465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021468 ?auto_2021467 ) ( IS-CRATE ?auto_2021462 ) ( not ( = ?auto_2021461 ?auto_2021462 ) ) ( not ( = ?auto_2021460 ?auto_2021461 ) ) ( not ( = ?auto_2021460 ?auto_2021462 ) ) ( not ( = ?auto_2021463 ?auto_2021467 ) ) ( HOIST-AT ?auto_2021466 ?auto_2021463 ) ( not ( = ?auto_2021468 ?auto_2021466 ) ) ( AVAILABLE ?auto_2021466 ) ( SURFACE-AT ?auto_2021462 ?auto_2021463 ) ( ON ?auto_2021462 ?auto_2021464 ) ( CLEAR ?auto_2021462 ) ( not ( = ?auto_2021461 ?auto_2021464 ) ) ( not ( = ?auto_2021462 ?auto_2021464 ) ) ( not ( = ?auto_2021460 ?auto_2021464 ) ) ( TRUCK-AT ?auto_2021465 ?auto_2021467 ) ( SURFACE-AT ?auto_2021460 ?auto_2021467 ) ( CLEAR ?auto_2021460 ) ( LIFTING ?auto_2021468 ?auto_2021461 ) ( IS-CRATE ?auto_2021461 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021461 ?auto_2021462 )
      ( MAKE-2CRATE-VERIFY ?auto_2021460 ?auto_2021461 ?auto_2021462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021469 - SURFACE
      ?auto_2021470 - SURFACE
    )
    :vars
    (
      ?auto_2021471 - HOIST
      ?auto_2021472 - PLACE
      ?auto_2021474 - SURFACE
      ?auto_2021473 - PLACE
      ?auto_2021475 - HOIST
      ?auto_2021476 - SURFACE
      ?auto_2021477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021471 ?auto_2021472 ) ( IS-CRATE ?auto_2021470 ) ( not ( = ?auto_2021469 ?auto_2021470 ) ) ( not ( = ?auto_2021474 ?auto_2021469 ) ) ( not ( = ?auto_2021474 ?auto_2021470 ) ) ( not ( = ?auto_2021473 ?auto_2021472 ) ) ( HOIST-AT ?auto_2021475 ?auto_2021473 ) ( not ( = ?auto_2021471 ?auto_2021475 ) ) ( AVAILABLE ?auto_2021475 ) ( SURFACE-AT ?auto_2021470 ?auto_2021473 ) ( ON ?auto_2021470 ?auto_2021476 ) ( CLEAR ?auto_2021470 ) ( not ( = ?auto_2021469 ?auto_2021476 ) ) ( not ( = ?auto_2021470 ?auto_2021476 ) ) ( not ( = ?auto_2021474 ?auto_2021476 ) ) ( TRUCK-AT ?auto_2021477 ?auto_2021472 ) ( SURFACE-AT ?auto_2021474 ?auto_2021472 ) ( CLEAR ?auto_2021474 ) ( IS-CRATE ?auto_2021469 ) ( AVAILABLE ?auto_2021471 ) ( IN ?auto_2021469 ?auto_2021477 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021471 ?auto_2021469 ?auto_2021477 ?auto_2021472 )
      ( MAKE-2CRATE ?auto_2021474 ?auto_2021469 ?auto_2021470 )
      ( MAKE-1CRATE-VERIFY ?auto_2021469 ?auto_2021470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021478 - SURFACE
      ?auto_2021479 - SURFACE
      ?auto_2021480 - SURFACE
    )
    :vars
    (
      ?auto_2021484 - HOIST
      ?auto_2021485 - PLACE
      ?auto_2021486 - PLACE
      ?auto_2021481 - HOIST
      ?auto_2021483 - SURFACE
      ?auto_2021482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021484 ?auto_2021485 ) ( IS-CRATE ?auto_2021480 ) ( not ( = ?auto_2021479 ?auto_2021480 ) ) ( not ( = ?auto_2021478 ?auto_2021479 ) ) ( not ( = ?auto_2021478 ?auto_2021480 ) ) ( not ( = ?auto_2021486 ?auto_2021485 ) ) ( HOIST-AT ?auto_2021481 ?auto_2021486 ) ( not ( = ?auto_2021484 ?auto_2021481 ) ) ( AVAILABLE ?auto_2021481 ) ( SURFACE-AT ?auto_2021480 ?auto_2021486 ) ( ON ?auto_2021480 ?auto_2021483 ) ( CLEAR ?auto_2021480 ) ( not ( = ?auto_2021479 ?auto_2021483 ) ) ( not ( = ?auto_2021480 ?auto_2021483 ) ) ( not ( = ?auto_2021478 ?auto_2021483 ) ) ( TRUCK-AT ?auto_2021482 ?auto_2021485 ) ( SURFACE-AT ?auto_2021478 ?auto_2021485 ) ( CLEAR ?auto_2021478 ) ( IS-CRATE ?auto_2021479 ) ( AVAILABLE ?auto_2021484 ) ( IN ?auto_2021479 ?auto_2021482 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021479 ?auto_2021480 )
      ( MAKE-2CRATE-VERIFY ?auto_2021478 ?auto_2021479 ?auto_2021480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021523 - SURFACE
      ?auto_2021524 - SURFACE
    )
    :vars
    (
      ?auto_2021529 - HOIST
      ?auto_2021527 - PLACE
      ?auto_2021528 - SURFACE
      ?auto_2021526 - PLACE
      ?auto_2021531 - HOIST
      ?auto_2021525 - SURFACE
      ?auto_2021530 - TRUCK
      ?auto_2021532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021529 ?auto_2021527 ) ( SURFACE-AT ?auto_2021523 ?auto_2021527 ) ( CLEAR ?auto_2021523 ) ( IS-CRATE ?auto_2021524 ) ( not ( = ?auto_2021523 ?auto_2021524 ) ) ( AVAILABLE ?auto_2021529 ) ( ON ?auto_2021523 ?auto_2021528 ) ( not ( = ?auto_2021528 ?auto_2021523 ) ) ( not ( = ?auto_2021528 ?auto_2021524 ) ) ( not ( = ?auto_2021526 ?auto_2021527 ) ) ( HOIST-AT ?auto_2021531 ?auto_2021526 ) ( not ( = ?auto_2021529 ?auto_2021531 ) ) ( AVAILABLE ?auto_2021531 ) ( SURFACE-AT ?auto_2021524 ?auto_2021526 ) ( ON ?auto_2021524 ?auto_2021525 ) ( CLEAR ?auto_2021524 ) ( not ( = ?auto_2021523 ?auto_2021525 ) ) ( not ( = ?auto_2021524 ?auto_2021525 ) ) ( not ( = ?auto_2021528 ?auto_2021525 ) ) ( TRUCK-AT ?auto_2021530 ?auto_2021532 ) ( not ( = ?auto_2021532 ?auto_2021527 ) ) ( not ( = ?auto_2021526 ?auto_2021532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021530 ?auto_2021532 ?auto_2021527 )
      ( MAKE-1CRATE ?auto_2021523 ?auto_2021524 )
      ( MAKE-1CRATE-VERIFY ?auto_2021523 ?auto_2021524 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021562 - SURFACE
      ?auto_2021563 - SURFACE
      ?auto_2021564 - SURFACE
      ?auto_2021565 - SURFACE
    )
    :vars
    (
      ?auto_2021567 - HOIST
      ?auto_2021566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021567 ?auto_2021566 ) ( SURFACE-AT ?auto_2021564 ?auto_2021566 ) ( CLEAR ?auto_2021564 ) ( LIFTING ?auto_2021567 ?auto_2021565 ) ( IS-CRATE ?auto_2021565 ) ( not ( = ?auto_2021564 ?auto_2021565 ) ) ( ON ?auto_2021563 ?auto_2021562 ) ( ON ?auto_2021564 ?auto_2021563 ) ( not ( = ?auto_2021562 ?auto_2021563 ) ) ( not ( = ?auto_2021562 ?auto_2021564 ) ) ( not ( = ?auto_2021562 ?auto_2021565 ) ) ( not ( = ?auto_2021563 ?auto_2021564 ) ) ( not ( = ?auto_2021563 ?auto_2021565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021564 ?auto_2021565 )
      ( MAKE-3CRATE-VERIFY ?auto_2021562 ?auto_2021563 ?auto_2021564 ?auto_2021565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021579 - SURFACE
      ?auto_2021580 - SURFACE
      ?auto_2021581 - SURFACE
      ?auto_2021582 - SURFACE
    )
    :vars
    (
      ?auto_2021585 - HOIST
      ?auto_2021583 - PLACE
      ?auto_2021584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021585 ?auto_2021583 ) ( SURFACE-AT ?auto_2021581 ?auto_2021583 ) ( CLEAR ?auto_2021581 ) ( IS-CRATE ?auto_2021582 ) ( not ( = ?auto_2021581 ?auto_2021582 ) ) ( TRUCK-AT ?auto_2021584 ?auto_2021583 ) ( AVAILABLE ?auto_2021585 ) ( IN ?auto_2021582 ?auto_2021584 ) ( ON ?auto_2021581 ?auto_2021580 ) ( not ( = ?auto_2021580 ?auto_2021581 ) ) ( not ( = ?auto_2021580 ?auto_2021582 ) ) ( ON ?auto_2021580 ?auto_2021579 ) ( not ( = ?auto_2021579 ?auto_2021580 ) ) ( not ( = ?auto_2021579 ?auto_2021581 ) ) ( not ( = ?auto_2021579 ?auto_2021582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021580 ?auto_2021581 ?auto_2021582 )
      ( MAKE-3CRATE-VERIFY ?auto_2021579 ?auto_2021580 ?auto_2021581 ?auto_2021582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021600 - SURFACE
      ?auto_2021601 - SURFACE
      ?auto_2021602 - SURFACE
      ?auto_2021603 - SURFACE
    )
    :vars
    (
      ?auto_2021605 - HOIST
      ?auto_2021604 - PLACE
      ?auto_2021606 - TRUCK
      ?auto_2021607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021605 ?auto_2021604 ) ( SURFACE-AT ?auto_2021602 ?auto_2021604 ) ( CLEAR ?auto_2021602 ) ( IS-CRATE ?auto_2021603 ) ( not ( = ?auto_2021602 ?auto_2021603 ) ) ( AVAILABLE ?auto_2021605 ) ( IN ?auto_2021603 ?auto_2021606 ) ( ON ?auto_2021602 ?auto_2021601 ) ( not ( = ?auto_2021601 ?auto_2021602 ) ) ( not ( = ?auto_2021601 ?auto_2021603 ) ) ( TRUCK-AT ?auto_2021606 ?auto_2021607 ) ( not ( = ?auto_2021607 ?auto_2021604 ) ) ( ON ?auto_2021601 ?auto_2021600 ) ( not ( = ?auto_2021600 ?auto_2021601 ) ) ( not ( = ?auto_2021600 ?auto_2021602 ) ) ( not ( = ?auto_2021600 ?auto_2021603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021601 ?auto_2021602 ?auto_2021603 )
      ( MAKE-3CRATE-VERIFY ?auto_2021600 ?auto_2021601 ?auto_2021602 ?auto_2021603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021624 - SURFACE
      ?auto_2021625 - SURFACE
      ?auto_2021626 - SURFACE
      ?auto_2021627 - SURFACE
    )
    :vars
    (
      ?auto_2021628 - HOIST
      ?auto_2021630 - PLACE
      ?auto_2021632 - TRUCK
      ?auto_2021629 - PLACE
      ?auto_2021631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021628 ?auto_2021630 ) ( SURFACE-AT ?auto_2021626 ?auto_2021630 ) ( CLEAR ?auto_2021626 ) ( IS-CRATE ?auto_2021627 ) ( not ( = ?auto_2021626 ?auto_2021627 ) ) ( AVAILABLE ?auto_2021628 ) ( ON ?auto_2021626 ?auto_2021625 ) ( not ( = ?auto_2021625 ?auto_2021626 ) ) ( not ( = ?auto_2021625 ?auto_2021627 ) ) ( TRUCK-AT ?auto_2021632 ?auto_2021629 ) ( not ( = ?auto_2021629 ?auto_2021630 ) ) ( HOIST-AT ?auto_2021631 ?auto_2021629 ) ( LIFTING ?auto_2021631 ?auto_2021627 ) ( not ( = ?auto_2021628 ?auto_2021631 ) ) ( ON ?auto_2021625 ?auto_2021624 ) ( not ( = ?auto_2021624 ?auto_2021625 ) ) ( not ( = ?auto_2021624 ?auto_2021626 ) ) ( not ( = ?auto_2021624 ?auto_2021627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021625 ?auto_2021626 ?auto_2021627 )
      ( MAKE-3CRATE-VERIFY ?auto_2021624 ?auto_2021625 ?auto_2021626 ?auto_2021627 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021651 - SURFACE
      ?auto_2021652 - SURFACE
      ?auto_2021653 - SURFACE
      ?auto_2021654 - SURFACE
    )
    :vars
    (
      ?auto_2021658 - HOIST
      ?auto_2021657 - PLACE
      ?auto_2021659 - TRUCK
      ?auto_2021656 - PLACE
      ?auto_2021660 - HOIST
      ?auto_2021655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021658 ?auto_2021657 ) ( SURFACE-AT ?auto_2021653 ?auto_2021657 ) ( CLEAR ?auto_2021653 ) ( IS-CRATE ?auto_2021654 ) ( not ( = ?auto_2021653 ?auto_2021654 ) ) ( AVAILABLE ?auto_2021658 ) ( ON ?auto_2021653 ?auto_2021652 ) ( not ( = ?auto_2021652 ?auto_2021653 ) ) ( not ( = ?auto_2021652 ?auto_2021654 ) ) ( TRUCK-AT ?auto_2021659 ?auto_2021656 ) ( not ( = ?auto_2021656 ?auto_2021657 ) ) ( HOIST-AT ?auto_2021660 ?auto_2021656 ) ( not ( = ?auto_2021658 ?auto_2021660 ) ) ( AVAILABLE ?auto_2021660 ) ( SURFACE-AT ?auto_2021654 ?auto_2021656 ) ( ON ?auto_2021654 ?auto_2021655 ) ( CLEAR ?auto_2021654 ) ( not ( = ?auto_2021653 ?auto_2021655 ) ) ( not ( = ?auto_2021654 ?auto_2021655 ) ) ( not ( = ?auto_2021652 ?auto_2021655 ) ) ( ON ?auto_2021652 ?auto_2021651 ) ( not ( = ?auto_2021651 ?auto_2021652 ) ) ( not ( = ?auto_2021651 ?auto_2021653 ) ) ( not ( = ?auto_2021651 ?auto_2021654 ) ) ( not ( = ?auto_2021651 ?auto_2021655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021652 ?auto_2021653 ?auto_2021654 )
      ( MAKE-3CRATE-VERIFY ?auto_2021651 ?auto_2021652 ?auto_2021653 ?auto_2021654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021679 - SURFACE
      ?auto_2021680 - SURFACE
      ?auto_2021681 - SURFACE
      ?auto_2021682 - SURFACE
    )
    :vars
    (
      ?auto_2021687 - HOIST
      ?auto_2021684 - PLACE
      ?auto_2021685 - PLACE
      ?auto_2021688 - HOIST
      ?auto_2021683 - SURFACE
      ?auto_2021686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021687 ?auto_2021684 ) ( SURFACE-AT ?auto_2021681 ?auto_2021684 ) ( CLEAR ?auto_2021681 ) ( IS-CRATE ?auto_2021682 ) ( not ( = ?auto_2021681 ?auto_2021682 ) ) ( AVAILABLE ?auto_2021687 ) ( ON ?auto_2021681 ?auto_2021680 ) ( not ( = ?auto_2021680 ?auto_2021681 ) ) ( not ( = ?auto_2021680 ?auto_2021682 ) ) ( not ( = ?auto_2021685 ?auto_2021684 ) ) ( HOIST-AT ?auto_2021688 ?auto_2021685 ) ( not ( = ?auto_2021687 ?auto_2021688 ) ) ( AVAILABLE ?auto_2021688 ) ( SURFACE-AT ?auto_2021682 ?auto_2021685 ) ( ON ?auto_2021682 ?auto_2021683 ) ( CLEAR ?auto_2021682 ) ( not ( = ?auto_2021681 ?auto_2021683 ) ) ( not ( = ?auto_2021682 ?auto_2021683 ) ) ( not ( = ?auto_2021680 ?auto_2021683 ) ) ( TRUCK-AT ?auto_2021686 ?auto_2021684 ) ( ON ?auto_2021680 ?auto_2021679 ) ( not ( = ?auto_2021679 ?auto_2021680 ) ) ( not ( = ?auto_2021679 ?auto_2021681 ) ) ( not ( = ?auto_2021679 ?auto_2021682 ) ) ( not ( = ?auto_2021679 ?auto_2021683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021680 ?auto_2021681 ?auto_2021682 )
      ( MAKE-3CRATE-VERIFY ?auto_2021679 ?auto_2021680 ?auto_2021681 ?auto_2021682 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021707 - SURFACE
      ?auto_2021708 - SURFACE
      ?auto_2021709 - SURFACE
      ?auto_2021710 - SURFACE
    )
    :vars
    (
      ?auto_2021716 - HOIST
      ?auto_2021712 - PLACE
      ?auto_2021711 - PLACE
      ?auto_2021715 - HOIST
      ?auto_2021714 - SURFACE
      ?auto_2021713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021716 ?auto_2021712 ) ( IS-CRATE ?auto_2021710 ) ( not ( = ?auto_2021709 ?auto_2021710 ) ) ( not ( = ?auto_2021708 ?auto_2021709 ) ) ( not ( = ?auto_2021708 ?auto_2021710 ) ) ( not ( = ?auto_2021711 ?auto_2021712 ) ) ( HOIST-AT ?auto_2021715 ?auto_2021711 ) ( not ( = ?auto_2021716 ?auto_2021715 ) ) ( AVAILABLE ?auto_2021715 ) ( SURFACE-AT ?auto_2021710 ?auto_2021711 ) ( ON ?auto_2021710 ?auto_2021714 ) ( CLEAR ?auto_2021710 ) ( not ( = ?auto_2021709 ?auto_2021714 ) ) ( not ( = ?auto_2021710 ?auto_2021714 ) ) ( not ( = ?auto_2021708 ?auto_2021714 ) ) ( TRUCK-AT ?auto_2021713 ?auto_2021712 ) ( SURFACE-AT ?auto_2021708 ?auto_2021712 ) ( CLEAR ?auto_2021708 ) ( LIFTING ?auto_2021716 ?auto_2021709 ) ( IS-CRATE ?auto_2021709 ) ( ON ?auto_2021708 ?auto_2021707 ) ( not ( = ?auto_2021707 ?auto_2021708 ) ) ( not ( = ?auto_2021707 ?auto_2021709 ) ) ( not ( = ?auto_2021707 ?auto_2021710 ) ) ( not ( = ?auto_2021707 ?auto_2021714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021708 ?auto_2021709 ?auto_2021710 )
      ( MAKE-3CRATE-VERIFY ?auto_2021707 ?auto_2021708 ?auto_2021709 ?auto_2021710 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021735 - SURFACE
      ?auto_2021736 - SURFACE
      ?auto_2021737 - SURFACE
      ?auto_2021738 - SURFACE
    )
    :vars
    (
      ?auto_2021741 - HOIST
      ?auto_2021744 - PLACE
      ?auto_2021739 - PLACE
      ?auto_2021740 - HOIST
      ?auto_2021742 - SURFACE
      ?auto_2021743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021741 ?auto_2021744 ) ( IS-CRATE ?auto_2021738 ) ( not ( = ?auto_2021737 ?auto_2021738 ) ) ( not ( = ?auto_2021736 ?auto_2021737 ) ) ( not ( = ?auto_2021736 ?auto_2021738 ) ) ( not ( = ?auto_2021739 ?auto_2021744 ) ) ( HOIST-AT ?auto_2021740 ?auto_2021739 ) ( not ( = ?auto_2021741 ?auto_2021740 ) ) ( AVAILABLE ?auto_2021740 ) ( SURFACE-AT ?auto_2021738 ?auto_2021739 ) ( ON ?auto_2021738 ?auto_2021742 ) ( CLEAR ?auto_2021738 ) ( not ( = ?auto_2021737 ?auto_2021742 ) ) ( not ( = ?auto_2021738 ?auto_2021742 ) ) ( not ( = ?auto_2021736 ?auto_2021742 ) ) ( TRUCK-AT ?auto_2021743 ?auto_2021744 ) ( SURFACE-AT ?auto_2021736 ?auto_2021744 ) ( CLEAR ?auto_2021736 ) ( IS-CRATE ?auto_2021737 ) ( AVAILABLE ?auto_2021741 ) ( IN ?auto_2021737 ?auto_2021743 ) ( ON ?auto_2021736 ?auto_2021735 ) ( not ( = ?auto_2021735 ?auto_2021736 ) ) ( not ( = ?auto_2021735 ?auto_2021737 ) ) ( not ( = ?auto_2021735 ?auto_2021738 ) ) ( not ( = ?auto_2021735 ?auto_2021742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021736 ?auto_2021737 ?auto_2021738 )
      ( MAKE-3CRATE-VERIFY ?auto_2021735 ?auto_2021736 ?auto_2021737 ?auto_2021738 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022026 - SURFACE
      ?auto_2022027 - SURFACE
      ?auto_2022028 - SURFACE
      ?auto_2022030 - SURFACE
      ?auto_2022029 - SURFACE
    )
    :vars
    (
      ?auto_2022031 - HOIST
      ?auto_2022032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022031 ?auto_2022032 ) ( SURFACE-AT ?auto_2022030 ?auto_2022032 ) ( CLEAR ?auto_2022030 ) ( LIFTING ?auto_2022031 ?auto_2022029 ) ( IS-CRATE ?auto_2022029 ) ( not ( = ?auto_2022030 ?auto_2022029 ) ) ( ON ?auto_2022027 ?auto_2022026 ) ( ON ?auto_2022028 ?auto_2022027 ) ( ON ?auto_2022030 ?auto_2022028 ) ( not ( = ?auto_2022026 ?auto_2022027 ) ) ( not ( = ?auto_2022026 ?auto_2022028 ) ) ( not ( = ?auto_2022026 ?auto_2022030 ) ) ( not ( = ?auto_2022026 ?auto_2022029 ) ) ( not ( = ?auto_2022027 ?auto_2022028 ) ) ( not ( = ?auto_2022027 ?auto_2022030 ) ) ( not ( = ?auto_2022027 ?auto_2022029 ) ) ( not ( = ?auto_2022028 ?auto_2022030 ) ) ( not ( = ?auto_2022028 ?auto_2022029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022030 ?auto_2022029 )
      ( MAKE-4CRATE-VERIFY ?auto_2022026 ?auto_2022027 ?auto_2022028 ?auto_2022030 ?auto_2022029 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022051 - SURFACE
      ?auto_2022052 - SURFACE
      ?auto_2022053 - SURFACE
      ?auto_2022055 - SURFACE
      ?auto_2022054 - SURFACE
    )
    :vars
    (
      ?auto_2022058 - HOIST
      ?auto_2022056 - PLACE
      ?auto_2022057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022058 ?auto_2022056 ) ( SURFACE-AT ?auto_2022055 ?auto_2022056 ) ( CLEAR ?auto_2022055 ) ( IS-CRATE ?auto_2022054 ) ( not ( = ?auto_2022055 ?auto_2022054 ) ) ( TRUCK-AT ?auto_2022057 ?auto_2022056 ) ( AVAILABLE ?auto_2022058 ) ( IN ?auto_2022054 ?auto_2022057 ) ( ON ?auto_2022055 ?auto_2022053 ) ( not ( = ?auto_2022053 ?auto_2022055 ) ) ( not ( = ?auto_2022053 ?auto_2022054 ) ) ( ON ?auto_2022052 ?auto_2022051 ) ( ON ?auto_2022053 ?auto_2022052 ) ( not ( = ?auto_2022051 ?auto_2022052 ) ) ( not ( = ?auto_2022051 ?auto_2022053 ) ) ( not ( = ?auto_2022051 ?auto_2022055 ) ) ( not ( = ?auto_2022051 ?auto_2022054 ) ) ( not ( = ?auto_2022052 ?auto_2022053 ) ) ( not ( = ?auto_2022052 ?auto_2022055 ) ) ( not ( = ?auto_2022052 ?auto_2022054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022053 ?auto_2022055 ?auto_2022054 )
      ( MAKE-4CRATE-VERIFY ?auto_2022051 ?auto_2022052 ?auto_2022053 ?auto_2022055 ?auto_2022054 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022081 - SURFACE
      ?auto_2022082 - SURFACE
      ?auto_2022083 - SURFACE
      ?auto_2022085 - SURFACE
      ?auto_2022084 - SURFACE
    )
    :vars
    (
      ?auto_2022088 - HOIST
      ?auto_2022089 - PLACE
      ?auto_2022086 - TRUCK
      ?auto_2022087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022088 ?auto_2022089 ) ( SURFACE-AT ?auto_2022085 ?auto_2022089 ) ( CLEAR ?auto_2022085 ) ( IS-CRATE ?auto_2022084 ) ( not ( = ?auto_2022085 ?auto_2022084 ) ) ( AVAILABLE ?auto_2022088 ) ( IN ?auto_2022084 ?auto_2022086 ) ( ON ?auto_2022085 ?auto_2022083 ) ( not ( = ?auto_2022083 ?auto_2022085 ) ) ( not ( = ?auto_2022083 ?auto_2022084 ) ) ( TRUCK-AT ?auto_2022086 ?auto_2022087 ) ( not ( = ?auto_2022087 ?auto_2022089 ) ) ( ON ?auto_2022082 ?auto_2022081 ) ( ON ?auto_2022083 ?auto_2022082 ) ( not ( = ?auto_2022081 ?auto_2022082 ) ) ( not ( = ?auto_2022081 ?auto_2022083 ) ) ( not ( = ?auto_2022081 ?auto_2022085 ) ) ( not ( = ?auto_2022081 ?auto_2022084 ) ) ( not ( = ?auto_2022082 ?auto_2022083 ) ) ( not ( = ?auto_2022082 ?auto_2022085 ) ) ( not ( = ?auto_2022082 ?auto_2022084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022083 ?auto_2022085 ?auto_2022084 )
      ( MAKE-4CRATE-VERIFY ?auto_2022081 ?auto_2022082 ?auto_2022083 ?auto_2022085 ?auto_2022084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022115 - SURFACE
      ?auto_2022116 - SURFACE
      ?auto_2022117 - SURFACE
      ?auto_2022119 - SURFACE
      ?auto_2022118 - SURFACE
    )
    :vars
    (
      ?auto_2022122 - HOIST
      ?auto_2022123 - PLACE
      ?auto_2022120 - TRUCK
      ?auto_2022121 - PLACE
      ?auto_2022124 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022122 ?auto_2022123 ) ( SURFACE-AT ?auto_2022119 ?auto_2022123 ) ( CLEAR ?auto_2022119 ) ( IS-CRATE ?auto_2022118 ) ( not ( = ?auto_2022119 ?auto_2022118 ) ) ( AVAILABLE ?auto_2022122 ) ( ON ?auto_2022119 ?auto_2022117 ) ( not ( = ?auto_2022117 ?auto_2022119 ) ) ( not ( = ?auto_2022117 ?auto_2022118 ) ) ( TRUCK-AT ?auto_2022120 ?auto_2022121 ) ( not ( = ?auto_2022121 ?auto_2022123 ) ) ( HOIST-AT ?auto_2022124 ?auto_2022121 ) ( LIFTING ?auto_2022124 ?auto_2022118 ) ( not ( = ?auto_2022122 ?auto_2022124 ) ) ( ON ?auto_2022116 ?auto_2022115 ) ( ON ?auto_2022117 ?auto_2022116 ) ( not ( = ?auto_2022115 ?auto_2022116 ) ) ( not ( = ?auto_2022115 ?auto_2022117 ) ) ( not ( = ?auto_2022115 ?auto_2022119 ) ) ( not ( = ?auto_2022115 ?auto_2022118 ) ) ( not ( = ?auto_2022116 ?auto_2022117 ) ) ( not ( = ?auto_2022116 ?auto_2022119 ) ) ( not ( = ?auto_2022116 ?auto_2022118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022117 ?auto_2022119 ?auto_2022118 )
      ( MAKE-4CRATE-VERIFY ?auto_2022115 ?auto_2022116 ?auto_2022117 ?auto_2022119 ?auto_2022118 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022153 - SURFACE
      ?auto_2022154 - SURFACE
      ?auto_2022155 - SURFACE
      ?auto_2022157 - SURFACE
      ?auto_2022156 - SURFACE
    )
    :vars
    (
      ?auto_2022160 - HOIST
      ?auto_2022159 - PLACE
      ?auto_2022162 - TRUCK
      ?auto_2022161 - PLACE
      ?auto_2022158 - HOIST
      ?auto_2022163 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022160 ?auto_2022159 ) ( SURFACE-AT ?auto_2022157 ?auto_2022159 ) ( CLEAR ?auto_2022157 ) ( IS-CRATE ?auto_2022156 ) ( not ( = ?auto_2022157 ?auto_2022156 ) ) ( AVAILABLE ?auto_2022160 ) ( ON ?auto_2022157 ?auto_2022155 ) ( not ( = ?auto_2022155 ?auto_2022157 ) ) ( not ( = ?auto_2022155 ?auto_2022156 ) ) ( TRUCK-AT ?auto_2022162 ?auto_2022161 ) ( not ( = ?auto_2022161 ?auto_2022159 ) ) ( HOIST-AT ?auto_2022158 ?auto_2022161 ) ( not ( = ?auto_2022160 ?auto_2022158 ) ) ( AVAILABLE ?auto_2022158 ) ( SURFACE-AT ?auto_2022156 ?auto_2022161 ) ( ON ?auto_2022156 ?auto_2022163 ) ( CLEAR ?auto_2022156 ) ( not ( = ?auto_2022157 ?auto_2022163 ) ) ( not ( = ?auto_2022156 ?auto_2022163 ) ) ( not ( = ?auto_2022155 ?auto_2022163 ) ) ( ON ?auto_2022154 ?auto_2022153 ) ( ON ?auto_2022155 ?auto_2022154 ) ( not ( = ?auto_2022153 ?auto_2022154 ) ) ( not ( = ?auto_2022153 ?auto_2022155 ) ) ( not ( = ?auto_2022153 ?auto_2022157 ) ) ( not ( = ?auto_2022153 ?auto_2022156 ) ) ( not ( = ?auto_2022153 ?auto_2022163 ) ) ( not ( = ?auto_2022154 ?auto_2022155 ) ) ( not ( = ?auto_2022154 ?auto_2022157 ) ) ( not ( = ?auto_2022154 ?auto_2022156 ) ) ( not ( = ?auto_2022154 ?auto_2022163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022155 ?auto_2022157 ?auto_2022156 )
      ( MAKE-4CRATE-VERIFY ?auto_2022153 ?auto_2022154 ?auto_2022155 ?auto_2022157 ?auto_2022156 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022192 - SURFACE
      ?auto_2022193 - SURFACE
      ?auto_2022194 - SURFACE
      ?auto_2022196 - SURFACE
      ?auto_2022195 - SURFACE
    )
    :vars
    (
      ?auto_2022197 - HOIST
      ?auto_2022199 - PLACE
      ?auto_2022200 - PLACE
      ?auto_2022202 - HOIST
      ?auto_2022201 - SURFACE
      ?auto_2022198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022197 ?auto_2022199 ) ( SURFACE-AT ?auto_2022196 ?auto_2022199 ) ( CLEAR ?auto_2022196 ) ( IS-CRATE ?auto_2022195 ) ( not ( = ?auto_2022196 ?auto_2022195 ) ) ( AVAILABLE ?auto_2022197 ) ( ON ?auto_2022196 ?auto_2022194 ) ( not ( = ?auto_2022194 ?auto_2022196 ) ) ( not ( = ?auto_2022194 ?auto_2022195 ) ) ( not ( = ?auto_2022200 ?auto_2022199 ) ) ( HOIST-AT ?auto_2022202 ?auto_2022200 ) ( not ( = ?auto_2022197 ?auto_2022202 ) ) ( AVAILABLE ?auto_2022202 ) ( SURFACE-AT ?auto_2022195 ?auto_2022200 ) ( ON ?auto_2022195 ?auto_2022201 ) ( CLEAR ?auto_2022195 ) ( not ( = ?auto_2022196 ?auto_2022201 ) ) ( not ( = ?auto_2022195 ?auto_2022201 ) ) ( not ( = ?auto_2022194 ?auto_2022201 ) ) ( TRUCK-AT ?auto_2022198 ?auto_2022199 ) ( ON ?auto_2022193 ?auto_2022192 ) ( ON ?auto_2022194 ?auto_2022193 ) ( not ( = ?auto_2022192 ?auto_2022193 ) ) ( not ( = ?auto_2022192 ?auto_2022194 ) ) ( not ( = ?auto_2022192 ?auto_2022196 ) ) ( not ( = ?auto_2022192 ?auto_2022195 ) ) ( not ( = ?auto_2022192 ?auto_2022201 ) ) ( not ( = ?auto_2022193 ?auto_2022194 ) ) ( not ( = ?auto_2022193 ?auto_2022196 ) ) ( not ( = ?auto_2022193 ?auto_2022195 ) ) ( not ( = ?auto_2022193 ?auto_2022201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022194 ?auto_2022196 ?auto_2022195 )
      ( MAKE-4CRATE-VERIFY ?auto_2022192 ?auto_2022193 ?auto_2022194 ?auto_2022196 ?auto_2022195 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022231 - SURFACE
      ?auto_2022232 - SURFACE
      ?auto_2022233 - SURFACE
      ?auto_2022235 - SURFACE
      ?auto_2022234 - SURFACE
    )
    :vars
    (
      ?auto_2022240 - HOIST
      ?auto_2022239 - PLACE
      ?auto_2022241 - PLACE
      ?auto_2022237 - HOIST
      ?auto_2022238 - SURFACE
      ?auto_2022236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022240 ?auto_2022239 ) ( IS-CRATE ?auto_2022234 ) ( not ( = ?auto_2022235 ?auto_2022234 ) ) ( not ( = ?auto_2022233 ?auto_2022235 ) ) ( not ( = ?auto_2022233 ?auto_2022234 ) ) ( not ( = ?auto_2022241 ?auto_2022239 ) ) ( HOIST-AT ?auto_2022237 ?auto_2022241 ) ( not ( = ?auto_2022240 ?auto_2022237 ) ) ( AVAILABLE ?auto_2022237 ) ( SURFACE-AT ?auto_2022234 ?auto_2022241 ) ( ON ?auto_2022234 ?auto_2022238 ) ( CLEAR ?auto_2022234 ) ( not ( = ?auto_2022235 ?auto_2022238 ) ) ( not ( = ?auto_2022234 ?auto_2022238 ) ) ( not ( = ?auto_2022233 ?auto_2022238 ) ) ( TRUCK-AT ?auto_2022236 ?auto_2022239 ) ( SURFACE-AT ?auto_2022233 ?auto_2022239 ) ( CLEAR ?auto_2022233 ) ( LIFTING ?auto_2022240 ?auto_2022235 ) ( IS-CRATE ?auto_2022235 ) ( ON ?auto_2022232 ?auto_2022231 ) ( ON ?auto_2022233 ?auto_2022232 ) ( not ( = ?auto_2022231 ?auto_2022232 ) ) ( not ( = ?auto_2022231 ?auto_2022233 ) ) ( not ( = ?auto_2022231 ?auto_2022235 ) ) ( not ( = ?auto_2022231 ?auto_2022234 ) ) ( not ( = ?auto_2022231 ?auto_2022238 ) ) ( not ( = ?auto_2022232 ?auto_2022233 ) ) ( not ( = ?auto_2022232 ?auto_2022235 ) ) ( not ( = ?auto_2022232 ?auto_2022234 ) ) ( not ( = ?auto_2022232 ?auto_2022238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022233 ?auto_2022235 ?auto_2022234 )
      ( MAKE-4CRATE-VERIFY ?auto_2022231 ?auto_2022232 ?auto_2022233 ?auto_2022235 ?auto_2022234 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022270 - SURFACE
      ?auto_2022271 - SURFACE
      ?auto_2022272 - SURFACE
      ?auto_2022274 - SURFACE
      ?auto_2022273 - SURFACE
    )
    :vars
    (
      ?auto_2022280 - HOIST
      ?auto_2022276 - PLACE
      ?auto_2022278 - PLACE
      ?auto_2022275 - HOIST
      ?auto_2022277 - SURFACE
      ?auto_2022279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022280 ?auto_2022276 ) ( IS-CRATE ?auto_2022273 ) ( not ( = ?auto_2022274 ?auto_2022273 ) ) ( not ( = ?auto_2022272 ?auto_2022274 ) ) ( not ( = ?auto_2022272 ?auto_2022273 ) ) ( not ( = ?auto_2022278 ?auto_2022276 ) ) ( HOIST-AT ?auto_2022275 ?auto_2022278 ) ( not ( = ?auto_2022280 ?auto_2022275 ) ) ( AVAILABLE ?auto_2022275 ) ( SURFACE-AT ?auto_2022273 ?auto_2022278 ) ( ON ?auto_2022273 ?auto_2022277 ) ( CLEAR ?auto_2022273 ) ( not ( = ?auto_2022274 ?auto_2022277 ) ) ( not ( = ?auto_2022273 ?auto_2022277 ) ) ( not ( = ?auto_2022272 ?auto_2022277 ) ) ( TRUCK-AT ?auto_2022279 ?auto_2022276 ) ( SURFACE-AT ?auto_2022272 ?auto_2022276 ) ( CLEAR ?auto_2022272 ) ( IS-CRATE ?auto_2022274 ) ( AVAILABLE ?auto_2022280 ) ( IN ?auto_2022274 ?auto_2022279 ) ( ON ?auto_2022271 ?auto_2022270 ) ( ON ?auto_2022272 ?auto_2022271 ) ( not ( = ?auto_2022270 ?auto_2022271 ) ) ( not ( = ?auto_2022270 ?auto_2022272 ) ) ( not ( = ?auto_2022270 ?auto_2022274 ) ) ( not ( = ?auto_2022270 ?auto_2022273 ) ) ( not ( = ?auto_2022270 ?auto_2022277 ) ) ( not ( = ?auto_2022271 ?auto_2022272 ) ) ( not ( = ?auto_2022271 ?auto_2022274 ) ) ( not ( = ?auto_2022271 ?auto_2022273 ) ) ( not ( = ?auto_2022271 ?auto_2022277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022272 ?auto_2022274 ?auto_2022273 )
      ( MAKE-4CRATE-VERIFY ?auto_2022270 ?auto_2022271 ?auto_2022272 ?auto_2022274 ?auto_2022273 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2022930 - SURFACE
      ?auto_2022931 - SURFACE
      ?auto_2022932 - SURFACE
      ?auto_2022934 - SURFACE
      ?auto_2022933 - SURFACE
      ?auto_2022935 - SURFACE
    )
    :vars
    (
      ?auto_2022937 - HOIST
      ?auto_2022936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022937 ?auto_2022936 ) ( SURFACE-AT ?auto_2022933 ?auto_2022936 ) ( CLEAR ?auto_2022933 ) ( LIFTING ?auto_2022937 ?auto_2022935 ) ( IS-CRATE ?auto_2022935 ) ( not ( = ?auto_2022933 ?auto_2022935 ) ) ( ON ?auto_2022931 ?auto_2022930 ) ( ON ?auto_2022932 ?auto_2022931 ) ( ON ?auto_2022934 ?auto_2022932 ) ( ON ?auto_2022933 ?auto_2022934 ) ( not ( = ?auto_2022930 ?auto_2022931 ) ) ( not ( = ?auto_2022930 ?auto_2022932 ) ) ( not ( = ?auto_2022930 ?auto_2022934 ) ) ( not ( = ?auto_2022930 ?auto_2022933 ) ) ( not ( = ?auto_2022930 ?auto_2022935 ) ) ( not ( = ?auto_2022931 ?auto_2022932 ) ) ( not ( = ?auto_2022931 ?auto_2022934 ) ) ( not ( = ?auto_2022931 ?auto_2022933 ) ) ( not ( = ?auto_2022931 ?auto_2022935 ) ) ( not ( = ?auto_2022932 ?auto_2022934 ) ) ( not ( = ?auto_2022932 ?auto_2022933 ) ) ( not ( = ?auto_2022932 ?auto_2022935 ) ) ( not ( = ?auto_2022934 ?auto_2022933 ) ) ( not ( = ?auto_2022934 ?auto_2022935 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022933 ?auto_2022935 )
      ( MAKE-5CRATE-VERIFY ?auto_2022930 ?auto_2022931 ?auto_2022932 ?auto_2022934 ?auto_2022933 ?auto_2022935 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2022964 - SURFACE
      ?auto_2022965 - SURFACE
      ?auto_2022966 - SURFACE
      ?auto_2022968 - SURFACE
      ?auto_2022967 - SURFACE
      ?auto_2022969 - SURFACE
    )
    :vars
    (
      ?auto_2022970 - HOIST
      ?auto_2022971 - PLACE
      ?auto_2022972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022970 ?auto_2022971 ) ( SURFACE-AT ?auto_2022967 ?auto_2022971 ) ( CLEAR ?auto_2022967 ) ( IS-CRATE ?auto_2022969 ) ( not ( = ?auto_2022967 ?auto_2022969 ) ) ( TRUCK-AT ?auto_2022972 ?auto_2022971 ) ( AVAILABLE ?auto_2022970 ) ( IN ?auto_2022969 ?auto_2022972 ) ( ON ?auto_2022967 ?auto_2022968 ) ( not ( = ?auto_2022968 ?auto_2022967 ) ) ( not ( = ?auto_2022968 ?auto_2022969 ) ) ( ON ?auto_2022965 ?auto_2022964 ) ( ON ?auto_2022966 ?auto_2022965 ) ( ON ?auto_2022968 ?auto_2022966 ) ( not ( = ?auto_2022964 ?auto_2022965 ) ) ( not ( = ?auto_2022964 ?auto_2022966 ) ) ( not ( = ?auto_2022964 ?auto_2022968 ) ) ( not ( = ?auto_2022964 ?auto_2022967 ) ) ( not ( = ?auto_2022964 ?auto_2022969 ) ) ( not ( = ?auto_2022965 ?auto_2022966 ) ) ( not ( = ?auto_2022965 ?auto_2022968 ) ) ( not ( = ?auto_2022965 ?auto_2022967 ) ) ( not ( = ?auto_2022965 ?auto_2022969 ) ) ( not ( = ?auto_2022966 ?auto_2022968 ) ) ( not ( = ?auto_2022966 ?auto_2022967 ) ) ( not ( = ?auto_2022966 ?auto_2022969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022968 ?auto_2022967 ?auto_2022969 )
      ( MAKE-5CRATE-VERIFY ?auto_2022964 ?auto_2022965 ?auto_2022966 ?auto_2022968 ?auto_2022967 ?auto_2022969 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023004 - SURFACE
      ?auto_2023005 - SURFACE
      ?auto_2023006 - SURFACE
      ?auto_2023008 - SURFACE
      ?auto_2023007 - SURFACE
      ?auto_2023009 - SURFACE
    )
    :vars
    (
      ?auto_2023013 - HOIST
      ?auto_2023012 - PLACE
      ?auto_2023010 - TRUCK
      ?auto_2023011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023013 ?auto_2023012 ) ( SURFACE-AT ?auto_2023007 ?auto_2023012 ) ( CLEAR ?auto_2023007 ) ( IS-CRATE ?auto_2023009 ) ( not ( = ?auto_2023007 ?auto_2023009 ) ) ( AVAILABLE ?auto_2023013 ) ( IN ?auto_2023009 ?auto_2023010 ) ( ON ?auto_2023007 ?auto_2023008 ) ( not ( = ?auto_2023008 ?auto_2023007 ) ) ( not ( = ?auto_2023008 ?auto_2023009 ) ) ( TRUCK-AT ?auto_2023010 ?auto_2023011 ) ( not ( = ?auto_2023011 ?auto_2023012 ) ) ( ON ?auto_2023005 ?auto_2023004 ) ( ON ?auto_2023006 ?auto_2023005 ) ( ON ?auto_2023008 ?auto_2023006 ) ( not ( = ?auto_2023004 ?auto_2023005 ) ) ( not ( = ?auto_2023004 ?auto_2023006 ) ) ( not ( = ?auto_2023004 ?auto_2023008 ) ) ( not ( = ?auto_2023004 ?auto_2023007 ) ) ( not ( = ?auto_2023004 ?auto_2023009 ) ) ( not ( = ?auto_2023005 ?auto_2023006 ) ) ( not ( = ?auto_2023005 ?auto_2023008 ) ) ( not ( = ?auto_2023005 ?auto_2023007 ) ) ( not ( = ?auto_2023005 ?auto_2023009 ) ) ( not ( = ?auto_2023006 ?auto_2023008 ) ) ( not ( = ?auto_2023006 ?auto_2023007 ) ) ( not ( = ?auto_2023006 ?auto_2023009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023008 ?auto_2023007 ?auto_2023009 )
      ( MAKE-5CRATE-VERIFY ?auto_2023004 ?auto_2023005 ?auto_2023006 ?auto_2023008 ?auto_2023007 ?auto_2023009 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023049 - SURFACE
      ?auto_2023050 - SURFACE
      ?auto_2023051 - SURFACE
      ?auto_2023053 - SURFACE
      ?auto_2023052 - SURFACE
      ?auto_2023054 - SURFACE
    )
    :vars
    (
      ?auto_2023059 - HOIST
      ?auto_2023058 - PLACE
      ?auto_2023056 - TRUCK
      ?auto_2023057 - PLACE
      ?auto_2023055 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023059 ?auto_2023058 ) ( SURFACE-AT ?auto_2023052 ?auto_2023058 ) ( CLEAR ?auto_2023052 ) ( IS-CRATE ?auto_2023054 ) ( not ( = ?auto_2023052 ?auto_2023054 ) ) ( AVAILABLE ?auto_2023059 ) ( ON ?auto_2023052 ?auto_2023053 ) ( not ( = ?auto_2023053 ?auto_2023052 ) ) ( not ( = ?auto_2023053 ?auto_2023054 ) ) ( TRUCK-AT ?auto_2023056 ?auto_2023057 ) ( not ( = ?auto_2023057 ?auto_2023058 ) ) ( HOIST-AT ?auto_2023055 ?auto_2023057 ) ( LIFTING ?auto_2023055 ?auto_2023054 ) ( not ( = ?auto_2023059 ?auto_2023055 ) ) ( ON ?auto_2023050 ?auto_2023049 ) ( ON ?auto_2023051 ?auto_2023050 ) ( ON ?auto_2023053 ?auto_2023051 ) ( not ( = ?auto_2023049 ?auto_2023050 ) ) ( not ( = ?auto_2023049 ?auto_2023051 ) ) ( not ( = ?auto_2023049 ?auto_2023053 ) ) ( not ( = ?auto_2023049 ?auto_2023052 ) ) ( not ( = ?auto_2023049 ?auto_2023054 ) ) ( not ( = ?auto_2023050 ?auto_2023051 ) ) ( not ( = ?auto_2023050 ?auto_2023053 ) ) ( not ( = ?auto_2023050 ?auto_2023052 ) ) ( not ( = ?auto_2023050 ?auto_2023054 ) ) ( not ( = ?auto_2023051 ?auto_2023053 ) ) ( not ( = ?auto_2023051 ?auto_2023052 ) ) ( not ( = ?auto_2023051 ?auto_2023054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023053 ?auto_2023052 ?auto_2023054 )
      ( MAKE-5CRATE-VERIFY ?auto_2023049 ?auto_2023050 ?auto_2023051 ?auto_2023053 ?auto_2023052 ?auto_2023054 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023099 - SURFACE
      ?auto_2023100 - SURFACE
      ?auto_2023101 - SURFACE
      ?auto_2023103 - SURFACE
      ?auto_2023102 - SURFACE
      ?auto_2023104 - SURFACE
    )
    :vars
    (
      ?auto_2023108 - HOIST
      ?auto_2023110 - PLACE
      ?auto_2023105 - TRUCK
      ?auto_2023107 - PLACE
      ?auto_2023106 - HOIST
      ?auto_2023109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023108 ?auto_2023110 ) ( SURFACE-AT ?auto_2023102 ?auto_2023110 ) ( CLEAR ?auto_2023102 ) ( IS-CRATE ?auto_2023104 ) ( not ( = ?auto_2023102 ?auto_2023104 ) ) ( AVAILABLE ?auto_2023108 ) ( ON ?auto_2023102 ?auto_2023103 ) ( not ( = ?auto_2023103 ?auto_2023102 ) ) ( not ( = ?auto_2023103 ?auto_2023104 ) ) ( TRUCK-AT ?auto_2023105 ?auto_2023107 ) ( not ( = ?auto_2023107 ?auto_2023110 ) ) ( HOIST-AT ?auto_2023106 ?auto_2023107 ) ( not ( = ?auto_2023108 ?auto_2023106 ) ) ( AVAILABLE ?auto_2023106 ) ( SURFACE-AT ?auto_2023104 ?auto_2023107 ) ( ON ?auto_2023104 ?auto_2023109 ) ( CLEAR ?auto_2023104 ) ( not ( = ?auto_2023102 ?auto_2023109 ) ) ( not ( = ?auto_2023104 ?auto_2023109 ) ) ( not ( = ?auto_2023103 ?auto_2023109 ) ) ( ON ?auto_2023100 ?auto_2023099 ) ( ON ?auto_2023101 ?auto_2023100 ) ( ON ?auto_2023103 ?auto_2023101 ) ( not ( = ?auto_2023099 ?auto_2023100 ) ) ( not ( = ?auto_2023099 ?auto_2023101 ) ) ( not ( = ?auto_2023099 ?auto_2023103 ) ) ( not ( = ?auto_2023099 ?auto_2023102 ) ) ( not ( = ?auto_2023099 ?auto_2023104 ) ) ( not ( = ?auto_2023099 ?auto_2023109 ) ) ( not ( = ?auto_2023100 ?auto_2023101 ) ) ( not ( = ?auto_2023100 ?auto_2023103 ) ) ( not ( = ?auto_2023100 ?auto_2023102 ) ) ( not ( = ?auto_2023100 ?auto_2023104 ) ) ( not ( = ?auto_2023100 ?auto_2023109 ) ) ( not ( = ?auto_2023101 ?auto_2023103 ) ) ( not ( = ?auto_2023101 ?auto_2023102 ) ) ( not ( = ?auto_2023101 ?auto_2023104 ) ) ( not ( = ?auto_2023101 ?auto_2023109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023103 ?auto_2023102 ?auto_2023104 )
      ( MAKE-5CRATE-VERIFY ?auto_2023099 ?auto_2023100 ?auto_2023101 ?auto_2023103 ?auto_2023102 ?auto_2023104 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023150 - SURFACE
      ?auto_2023151 - SURFACE
      ?auto_2023152 - SURFACE
      ?auto_2023154 - SURFACE
      ?auto_2023153 - SURFACE
      ?auto_2023155 - SURFACE
    )
    :vars
    (
      ?auto_2023157 - HOIST
      ?auto_2023156 - PLACE
      ?auto_2023161 - PLACE
      ?auto_2023158 - HOIST
      ?auto_2023160 - SURFACE
      ?auto_2023159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023157 ?auto_2023156 ) ( SURFACE-AT ?auto_2023153 ?auto_2023156 ) ( CLEAR ?auto_2023153 ) ( IS-CRATE ?auto_2023155 ) ( not ( = ?auto_2023153 ?auto_2023155 ) ) ( AVAILABLE ?auto_2023157 ) ( ON ?auto_2023153 ?auto_2023154 ) ( not ( = ?auto_2023154 ?auto_2023153 ) ) ( not ( = ?auto_2023154 ?auto_2023155 ) ) ( not ( = ?auto_2023161 ?auto_2023156 ) ) ( HOIST-AT ?auto_2023158 ?auto_2023161 ) ( not ( = ?auto_2023157 ?auto_2023158 ) ) ( AVAILABLE ?auto_2023158 ) ( SURFACE-AT ?auto_2023155 ?auto_2023161 ) ( ON ?auto_2023155 ?auto_2023160 ) ( CLEAR ?auto_2023155 ) ( not ( = ?auto_2023153 ?auto_2023160 ) ) ( not ( = ?auto_2023155 ?auto_2023160 ) ) ( not ( = ?auto_2023154 ?auto_2023160 ) ) ( TRUCK-AT ?auto_2023159 ?auto_2023156 ) ( ON ?auto_2023151 ?auto_2023150 ) ( ON ?auto_2023152 ?auto_2023151 ) ( ON ?auto_2023154 ?auto_2023152 ) ( not ( = ?auto_2023150 ?auto_2023151 ) ) ( not ( = ?auto_2023150 ?auto_2023152 ) ) ( not ( = ?auto_2023150 ?auto_2023154 ) ) ( not ( = ?auto_2023150 ?auto_2023153 ) ) ( not ( = ?auto_2023150 ?auto_2023155 ) ) ( not ( = ?auto_2023150 ?auto_2023160 ) ) ( not ( = ?auto_2023151 ?auto_2023152 ) ) ( not ( = ?auto_2023151 ?auto_2023154 ) ) ( not ( = ?auto_2023151 ?auto_2023153 ) ) ( not ( = ?auto_2023151 ?auto_2023155 ) ) ( not ( = ?auto_2023151 ?auto_2023160 ) ) ( not ( = ?auto_2023152 ?auto_2023154 ) ) ( not ( = ?auto_2023152 ?auto_2023153 ) ) ( not ( = ?auto_2023152 ?auto_2023155 ) ) ( not ( = ?auto_2023152 ?auto_2023160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023154 ?auto_2023153 ?auto_2023155 )
      ( MAKE-5CRATE-VERIFY ?auto_2023150 ?auto_2023151 ?auto_2023152 ?auto_2023154 ?auto_2023153 ?auto_2023155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023201 - SURFACE
      ?auto_2023202 - SURFACE
      ?auto_2023203 - SURFACE
      ?auto_2023205 - SURFACE
      ?auto_2023204 - SURFACE
      ?auto_2023206 - SURFACE
    )
    :vars
    (
      ?auto_2023208 - HOIST
      ?auto_2023207 - PLACE
      ?auto_2023212 - PLACE
      ?auto_2023210 - HOIST
      ?auto_2023209 - SURFACE
      ?auto_2023211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023208 ?auto_2023207 ) ( IS-CRATE ?auto_2023206 ) ( not ( = ?auto_2023204 ?auto_2023206 ) ) ( not ( = ?auto_2023205 ?auto_2023204 ) ) ( not ( = ?auto_2023205 ?auto_2023206 ) ) ( not ( = ?auto_2023212 ?auto_2023207 ) ) ( HOIST-AT ?auto_2023210 ?auto_2023212 ) ( not ( = ?auto_2023208 ?auto_2023210 ) ) ( AVAILABLE ?auto_2023210 ) ( SURFACE-AT ?auto_2023206 ?auto_2023212 ) ( ON ?auto_2023206 ?auto_2023209 ) ( CLEAR ?auto_2023206 ) ( not ( = ?auto_2023204 ?auto_2023209 ) ) ( not ( = ?auto_2023206 ?auto_2023209 ) ) ( not ( = ?auto_2023205 ?auto_2023209 ) ) ( TRUCK-AT ?auto_2023211 ?auto_2023207 ) ( SURFACE-AT ?auto_2023205 ?auto_2023207 ) ( CLEAR ?auto_2023205 ) ( LIFTING ?auto_2023208 ?auto_2023204 ) ( IS-CRATE ?auto_2023204 ) ( ON ?auto_2023202 ?auto_2023201 ) ( ON ?auto_2023203 ?auto_2023202 ) ( ON ?auto_2023205 ?auto_2023203 ) ( not ( = ?auto_2023201 ?auto_2023202 ) ) ( not ( = ?auto_2023201 ?auto_2023203 ) ) ( not ( = ?auto_2023201 ?auto_2023205 ) ) ( not ( = ?auto_2023201 ?auto_2023204 ) ) ( not ( = ?auto_2023201 ?auto_2023206 ) ) ( not ( = ?auto_2023201 ?auto_2023209 ) ) ( not ( = ?auto_2023202 ?auto_2023203 ) ) ( not ( = ?auto_2023202 ?auto_2023205 ) ) ( not ( = ?auto_2023202 ?auto_2023204 ) ) ( not ( = ?auto_2023202 ?auto_2023206 ) ) ( not ( = ?auto_2023202 ?auto_2023209 ) ) ( not ( = ?auto_2023203 ?auto_2023205 ) ) ( not ( = ?auto_2023203 ?auto_2023204 ) ) ( not ( = ?auto_2023203 ?auto_2023206 ) ) ( not ( = ?auto_2023203 ?auto_2023209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023205 ?auto_2023204 ?auto_2023206 )
      ( MAKE-5CRATE-VERIFY ?auto_2023201 ?auto_2023202 ?auto_2023203 ?auto_2023205 ?auto_2023204 ?auto_2023206 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023252 - SURFACE
      ?auto_2023253 - SURFACE
      ?auto_2023254 - SURFACE
      ?auto_2023256 - SURFACE
      ?auto_2023255 - SURFACE
      ?auto_2023257 - SURFACE
    )
    :vars
    (
      ?auto_2023258 - HOIST
      ?auto_2023259 - PLACE
      ?auto_2023263 - PLACE
      ?auto_2023261 - HOIST
      ?auto_2023260 - SURFACE
      ?auto_2023262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023258 ?auto_2023259 ) ( IS-CRATE ?auto_2023257 ) ( not ( = ?auto_2023255 ?auto_2023257 ) ) ( not ( = ?auto_2023256 ?auto_2023255 ) ) ( not ( = ?auto_2023256 ?auto_2023257 ) ) ( not ( = ?auto_2023263 ?auto_2023259 ) ) ( HOIST-AT ?auto_2023261 ?auto_2023263 ) ( not ( = ?auto_2023258 ?auto_2023261 ) ) ( AVAILABLE ?auto_2023261 ) ( SURFACE-AT ?auto_2023257 ?auto_2023263 ) ( ON ?auto_2023257 ?auto_2023260 ) ( CLEAR ?auto_2023257 ) ( not ( = ?auto_2023255 ?auto_2023260 ) ) ( not ( = ?auto_2023257 ?auto_2023260 ) ) ( not ( = ?auto_2023256 ?auto_2023260 ) ) ( TRUCK-AT ?auto_2023262 ?auto_2023259 ) ( SURFACE-AT ?auto_2023256 ?auto_2023259 ) ( CLEAR ?auto_2023256 ) ( IS-CRATE ?auto_2023255 ) ( AVAILABLE ?auto_2023258 ) ( IN ?auto_2023255 ?auto_2023262 ) ( ON ?auto_2023253 ?auto_2023252 ) ( ON ?auto_2023254 ?auto_2023253 ) ( ON ?auto_2023256 ?auto_2023254 ) ( not ( = ?auto_2023252 ?auto_2023253 ) ) ( not ( = ?auto_2023252 ?auto_2023254 ) ) ( not ( = ?auto_2023252 ?auto_2023256 ) ) ( not ( = ?auto_2023252 ?auto_2023255 ) ) ( not ( = ?auto_2023252 ?auto_2023257 ) ) ( not ( = ?auto_2023252 ?auto_2023260 ) ) ( not ( = ?auto_2023253 ?auto_2023254 ) ) ( not ( = ?auto_2023253 ?auto_2023256 ) ) ( not ( = ?auto_2023253 ?auto_2023255 ) ) ( not ( = ?auto_2023253 ?auto_2023257 ) ) ( not ( = ?auto_2023253 ?auto_2023260 ) ) ( not ( = ?auto_2023254 ?auto_2023256 ) ) ( not ( = ?auto_2023254 ?auto_2023255 ) ) ( not ( = ?auto_2023254 ?auto_2023257 ) ) ( not ( = ?auto_2023254 ?auto_2023260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023256 ?auto_2023255 ?auto_2023257 )
      ( MAKE-5CRATE-VERIFY ?auto_2023252 ?auto_2023253 ?auto_2023254 ?auto_2023256 ?auto_2023255 ?auto_2023257 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024461 - SURFACE
      ?auto_2024462 - SURFACE
      ?auto_2024463 - SURFACE
      ?auto_2024465 - SURFACE
      ?auto_2024464 - SURFACE
      ?auto_2024466 - SURFACE
      ?auto_2024467 - SURFACE
    )
    :vars
    (
      ?auto_2024468 - HOIST
      ?auto_2024469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024468 ?auto_2024469 ) ( SURFACE-AT ?auto_2024466 ?auto_2024469 ) ( CLEAR ?auto_2024466 ) ( LIFTING ?auto_2024468 ?auto_2024467 ) ( IS-CRATE ?auto_2024467 ) ( not ( = ?auto_2024466 ?auto_2024467 ) ) ( ON ?auto_2024462 ?auto_2024461 ) ( ON ?auto_2024463 ?auto_2024462 ) ( ON ?auto_2024465 ?auto_2024463 ) ( ON ?auto_2024464 ?auto_2024465 ) ( ON ?auto_2024466 ?auto_2024464 ) ( not ( = ?auto_2024461 ?auto_2024462 ) ) ( not ( = ?auto_2024461 ?auto_2024463 ) ) ( not ( = ?auto_2024461 ?auto_2024465 ) ) ( not ( = ?auto_2024461 ?auto_2024464 ) ) ( not ( = ?auto_2024461 ?auto_2024466 ) ) ( not ( = ?auto_2024461 ?auto_2024467 ) ) ( not ( = ?auto_2024462 ?auto_2024463 ) ) ( not ( = ?auto_2024462 ?auto_2024465 ) ) ( not ( = ?auto_2024462 ?auto_2024464 ) ) ( not ( = ?auto_2024462 ?auto_2024466 ) ) ( not ( = ?auto_2024462 ?auto_2024467 ) ) ( not ( = ?auto_2024463 ?auto_2024465 ) ) ( not ( = ?auto_2024463 ?auto_2024464 ) ) ( not ( = ?auto_2024463 ?auto_2024466 ) ) ( not ( = ?auto_2024463 ?auto_2024467 ) ) ( not ( = ?auto_2024465 ?auto_2024464 ) ) ( not ( = ?auto_2024465 ?auto_2024466 ) ) ( not ( = ?auto_2024465 ?auto_2024467 ) ) ( not ( = ?auto_2024464 ?auto_2024466 ) ) ( not ( = ?auto_2024464 ?auto_2024467 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2024466 ?auto_2024467 )
      ( MAKE-6CRATE-VERIFY ?auto_2024461 ?auto_2024462 ?auto_2024463 ?auto_2024465 ?auto_2024464 ?auto_2024466 ?auto_2024467 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024505 - SURFACE
      ?auto_2024506 - SURFACE
      ?auto_2024507 - SURFACE
      ?auto_2024509 - SURFACE
      ?auto_2024508 - SURFACE
      ?auto_2024510 - SURFACE
      ?auto_2024511 - SURFACE
    )
    :vars
    (
      ?auto_2024514 - HOIST
      ?auto_2024512 - PLACE
      ?auto_2024513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024514 ?auto_2024512 ) ( SURFACE-AT ?auto_2024510 ?auto_2024512 ) ( CLEAR ?auto_2024510 ) ( IS-CRATE ?auto_2024511 ) ( not ( = ?auto_2024510 ?auto_2024511 ) ) ( TRUCK-AT ?auto_2024513 ?auto_2024512 ) ( AVAILABLE ?auto_2024514 ) ( IN ?auto_2024511 ?auto_2024513 ) ( ON ?auto_2024510 ?auto_2024508 ) ( not ( = ?auto_2024508 ?auto_2024510 ) ) ( not ( = ?auto_2024508 ?auto_2024511 ) ) ( ON ?auto_2024506 ?auto_2024505 ) ( ON ?auto_2024507 ?auto_2024506 ) ( ON ?auto_2024509 ?auto_2024507 ) ( ON ?auto_2024508 ?auto_2024509 ) ( not ( = ?auto_2024505 ?auto_2024506 ) ) ( not ( = ?auto_2024505 ?auto_2024507 ) ) ( not ( = ?auto_2024505 ?auto_2024509 ) ) ( not ( = ?auto_2024505 ?auto_2024508 ) ) ( not ( = ?auto_2024505 ?auto_2024510 ) ) ( not ( = ?auto_2024505 ?auto_2024511 ) ) ( not ( = ?auto_2024506 ?auto_2024507 ) ) ( not ( = ?auto_2024506 ?auto_2024509 ) ) ( not ( = ?auto_2024506 ?auto_2024508 ) ) ( not ( = ?auto_2024506 ?auto_2024510 ) ) ( not ( = ?auto_2024506 ?auto_2024511 ) ) ( not ( = ?auto_2024507 ?auto_2024509 ) ) ( not ( = ?auto_2024507 ?auto_2024508 ) ) ( not ( = ?auto_2024507 ?auto_2024510 ) ) ( not ( = ?auto_2024507 ?auto_2024511 ) ) ( not ( = ?auto_2024509 ?auto_2024508 ) ) ( not ( = ?auto_2024509 ?auto_2024510 ) ) ( not ( = ?auto_2024509 ?auto_2024511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024508 ?auto_2024510 ?auto_2024511 )
      ( MAKE-6CRATE-VERIFY ?auto_2024505 ?auto_2024506 ?auto_2024507 ?auto_2024509 ?auto_2024508 ?auto_2024510 ?auto_2024511 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024556 - SURFACE
      ?auto_2024557 - SURFACE
      ?auto_2024558 - SURFACE
      ?auto_2024560 - SURFACE
      ?auto_2024559 - SURFACE
      ?auto_2024561 - SURFACE
      ?auto_2024562 - SURFACE
    )
    :vars
    (
      ?auto_2024563 - HOIST
      ?auto_2024566 - PLACE
      ?auto_2024565 - TRUCK
      ?auto_2024564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024563 ?auto_2024566 ) ( SURFACE-AT ?auto_2024561 ?auto_2024566 ) ( CLEAR ?auto_2024561 ) ( IS-CRATE ?auto_2024562 ) ( not ( = ?auto_2024561 ?auto_2024562 ) ) ( AVAILABLE ?auto_2024563 ) ( IN ?auto_2024562 ?auto_2024565 ) ( ON ?auto_2024561 ?auto_2024559 ) ( not ( = ?auto_2024559 ?auto_2024561 ) ) ( not ( = ?auto_2024559 ?auto_2024562 ) ) ( TRUCK-AT ?auto_2024565 ?auto_2024564 ) ( not ( = ?auto_2024564 ?auto_2024566 ) ) ( ON ?auto_2024557 ?auto_2024556 ) ( ON ?auto_2024558 ?auto_2024557 ) ( ON ?auto_2024560 ?auto_2024558 ) ( ON ?auto_2024559 ?auto_2024560 ) ( not ( = ?auto_2024556 ?auto_2024557 ) ) ( not ( = ?auto_2024556 ?auto_2024558 ) ) ( not ( = ?auto_2024556 ?auto_2024560 ) ) ( not ( = ?auto_2024556 ?auto_2024559 ) ) ( not ( = ?auto_2024556 ?auto_2024561 ) ) ( not ( = ?auto_2024556 ?auto_2024562 ) ) ( not ( = ?auto_2024557 ?auto_2024558 ) ) ( not ( = ?auto_2024557 ?auto_2024560 ) ) ( not ( = ?auto_2024557 ?auto_2024559 ) ) ( not ( = ?auto_2024557 ?auto_2024561 ) ) ( not ( = ?auto_2024557 ?auto_2024562 ) ) ( not ( = ?auto_2024558 ?auto_2024560 ) ) ( not ( = ?auto_2024558 ?auto_2024559 ) ) ( not ( = ?auto_2024558 ?auto_2024561 ) ) ( not ( = ?auto_2024558 ?auto_2024562 ) ) ( not ( = ?auto_2024560 ?auto_2024559 ) ) ( not ( = ?auto_2024560 ?auto_2024561 ) ) ( not ( = ?auto_2024560 ?auto_2024562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024559 ?auto_2024561 ?auto_2024562 )
      ( MAKE-6CRATE-VERIFY ?auto_2024556 ?auto_2024557 ?auto_2024558 ?auto_2024560 ?auto_2024559 ?auto_2024561 ?auto_2024562 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024613 - SURFACE
      ?auto_2024614 - SURFACE
      ?auto_2024615 - SURFACE
      ?auto_2024617 - SURFACE
      ?auto_2024616 - SURFACE
      ?auto_2024618 - SURFACE
      ?auto_2024619 - SURFACE
    )
    :vars
    (
      ?auto_2024624 - HOIST
      ?auto_2024623 - PLACE
      ?auto_2024621 - TRUCK
      ?auto_2024622 - PLACE
      ?auto_2024620 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024624 ?auto_2024623 ) ( SURFACE-AT ?auto_2024618 ?auto_2024623 ) ( CLEAR ?auto_2024618 ) ( IS-CRATE ?auto_2024619 ) ( not ( = ?auto_2024618 ?auto_2024619 ) ) ( AVAILABLE ?auto_2024624 ) ( ON ?auto_2024618 ?auto_2024616 ) ( not ( = ?auto_2024616 ?auto_2024618 ) ) ( not ( = ?auto_2024616 ?auto_2024619 ) ) ( TRUCK-AT ?auto_2024621 ?auto_2024622 ) ( not ( = ?auto_2024622 ?auto_2024623 ) ) ( HOIST-AT ?auto_2024620 ?auto_2024622 ) ( LIFTING ?auto_2024620 ?auto_2024619 ) ( not ( = ?auto_2024624 ?auto_2024620 ) ) ( ON ?auto_2024614 ?auto_2024613 ) ( ON ?auto_2024615 ?auto_2024614 ) ( ON ?auto_2024617 ?auto_2024615 ) ( ON ?auto_2024616 ?auto_2024617 ) ( not ( = ?auto_2024613 ?auto_2024614 ) ) ( not ( = ?auto_2024613 ?auto_2024615 ) ) ( not ( = ?auto_2024613 ?auto_2024617 ) ) ( not ( = ?auto_2024613 ?auto_2024616 ) ) ( not ( = ?auto_2024613 ?auto_2024618 ) ) ( not ( = ?auto_2024613 ?auto_2024619 ) ) ( not ( = ?auto_2024614 ?auto_2024615 ) ) ( not ( = ?auto_2024614 ?auto_2024617 ) ) ( not ( = ?auto_2024614 ?auto_2024616 ) ) ( not ( = ?auto_2024614 ?auto_2024618 ) ) ( not ( = ?auto_2024614 ?auto_2024619 ) ) ( not ( = ?auto_2024615 ?auto_2024617 ) ) ( not ( = ?auto_2024615 ?auto_2024616 ) ) ( not ( = ?auto_2024615 ?auto_2024618 ) ) ( not ( = ?auto_2024615 ?auto_2024619 ) ) ( not ( = ?auto_2024617 ?auto_2024616 ) ) ( not ( = ?auto_2024617 ?auto_2024618 ) ) ( not ( = ?auto_2024617 ?auto_2024619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024616 ?auto_2024618 ?auto_2024619 )
      ( MAKE-6CRATE-VERIFY ?auto_2024613 ?auto_2024614 ?auto_2024615 ?auto_2024617 ?auto_2024616 ?auto_2024618 ?auto_2024619 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024676 - SURFACE
      ?auto_2024677 - SURFACE
      ?auto_2024678 - SURFACE
      ?auto_2024680 - SURFACE
      ?auto_2024679 - SURFACE
      ?auto_2024681 - SURFACE
      ?auto_2024682 - SURFACE
    )
    :vars
    (
      ?auto_2024687 - HOIST
      ?auto_2024688 - PLACE
      ?auto_2024686 - TRUCK
      ?auto_2024685 - PLACE
      ?auto_2024684 - HOIST
      ?auto_2024683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024687 ?auto_2024688 ) ( SURFACE-AT ?auto_2024681 ?auto_2024688 ) ( CLEAR ?auto_2024681 ) ( IS-CRATE ?auto_2024682 ) ( not ( = ?auto_2024681 ?auto_2024682 ) ) ( AVAILABLE ?auto_2024687 ) ( ON ?auto_2024681 ?auto_2024679 ) ( not ( = ?auto_2024679 ?auto_2024681 ) ) ( not ( = ?auto_2024679 ?auto_2024682 ) ) ( TRUCK-AT ?auto_2024686 ?auto_2024685 ) ( not ( = ?auto_2024685 ?auto_2024688 ) ) ( HOIST-AT ?auto_2024684 ?auto_2024685 ) ( not ( = ?auto_2024687 ?auto_2024684 ) ) ( AVAILABLE ?auto_2024684 ) ( SURFACE-AT ?auto_2024682 ?auto_2024685 ) ( ON ?auto_2024682 ?auto_2024683 ) ( CLEAR ?auto_2024682 ) ( not ( = ?auto_2024681 ?auto_2024683 ) ) ( not ( = ?auto_2024682 ?auto_2024683 ) ) ( not ( = ?auto_2024679 ?auto_2024683 ) ) ( ON ?auto_2024677 ?auto_2024676 ) ( ON ?auto_2024678 ?auto_2024677 ) ( ON ?auto_2024680 ?auto_2024678 ) ( ON ?auto_2024679 ?auto_2024680 ) ( not ( = ?auto_2024676 ?auto_2024677 ) ) ( not ( = ?auto_2024676 ?auto_2024678 ) ) ( not ( = ?auto_2024676 ?auto_2024680 ) ) ( not ( = ?auto_2024676 ?auto_2024679 ) ) ( not ( = ?auto_2024676 ?auto_2024681 ) ) ( not ( = ?auto_2024676 ?auto_2024682 ) ) ( not ( = ?auto_2024676 ?auto_2024683 ) ) ( not ( = ?auto_2024677 ?auto_2024678 ) ) ( not ( = ?auto_2024677 ?auto_2024680 ) ) ( not ( = ?auto_2024677 ?auto_2024679 ) ) ( not ( = ?auto_2024677 ?auto_2024681 ) ) ( not ( = ?auto_2024677 ?auto_2024682 ) ) ( not ( = ?auto_2024677 ?auto_2024683 ) ) ( not ( = ?auto_2024678 ?auto_2024680 ) ) ( not ( = ?auto_2024678 ?auto_2024679 ) ) ( not ( = ?auto_2024678 ?auto_2024681 ) ) ( not ( = ?auto_2024678 ?auto_2024682 ) ) ( not ( = ?auto_2024678 ?auto_2024683 ) ) ( not ( = ?auto_2024680 ?auto_2024679 ) ) ( not ( = ?auto_2024680 ?auto_2024681 ) ) ( not ( = ?auto_2024680 ?auto_2024682 ) ) ( not ( = ?auto_2024680 ?auto_2024683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024679 ?auto_2024681 ?auto_2024682 )
      ( MAKE-6CRATE-VERIFY ?auto_2024676 ?auto_2024677 ?auto_2024678 ?auto_2024680 ?auto_2024679 ?auto_2024681 ?auto_2024682 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024740 - SURFACE
      ?auto_2024741 - SURFACE
      ?auto_2024742 - SURFACE
      ?auto_2024744 - SURFACE
      ?auto_2024743 - SURFACE
      ?auto_2024745 - SURFACE
      ?auto_2024746 - SURFACE
    )
    :vars
    (
      ?auto_2024751 - HOIST
      ?auto_2024752 - PLACE
      ?auto_2024747 - PLACE
      ?auto_2024750 - HOIST
      ?auto_2024748 - SURFACE
      ?auto_2024749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024751 ?auto_2024752 ) ( SURFACE-AT ?auto_2024745 ?auto_2024752 ) ( CLEAR ?auto_2024745 ) ( IS-CRATE ?auto_2024746 ) ( not ( = ?auto_2024745 ?auto_2024746 ) ) ( AVAILABLE ?auto_2024751 ) ( ON ?auto_2024745 ?auto_2024743 ) ( not ( = ?auto_2024743 ?auto_2024745 ) ) ( not ( = ?auto_2024743 ?auto_2024746 ) ) ( not ( = ?auto_2024747 ?auto_2024752 ) ) ( HOIST-AT ?auto_2024750 ?auto_2024747 ) ( not ( = ?auto_2024751 ?auto_2024750 ) ) ( AVAILABLE ?auto_2024750 ) ( SURFACE-AT ?auto_2024746 ?auto_2024747 ) ( ON ?auto_2024746 ?auto_2024748 ) ( CLEAR ?auto_2024746 ) ( not ( = ?auto_2024745 ?auto_2024748 ) ) ( not ( = ?auto_2024746 ?auto_2024748 ) ) ( not ( = ?auto_2024743 ?auto_2024748 ) ) ( TRUCK-AT ?auto_2024749 ?auto_2024752 ) ( ON ?auto_2024741 ?auto_2024740 ) ( ON ?auto_2024742 ?auto_2024741 ) ( ON ?auto_2024744 ?auto_2024742 ) ( ON ?auto_2024743 ?auto_2024744 ) ( not ( = ?auto_2024740 ?auto_2024741 ) ) ( not ( = ?auto_2024740 ?auto_2024742 ) ) ( not ( = ?auto_2024740 ?auto_2024744 ) ) ( not ( = ?auto_2024740 ?auto_2024743 ) ) ( not ( = ?auto_2024740 ?auto_2024745 ) ) ( not ( = ?auto_2024740 ?auto_2024746 ) ) ( not ( = ?auto_2024740 ?auto_2024748 ) ) ( not ( = ?auto_2024741 ?auto_2024742 ) ) ( not ( = ?auto_2024741 ?auto_2024744 ) ) ( not ( = ?auto_2024741 ?auto_2024743 ) ) ( not ( = ?auto_2024741 ?auto_2024745 ) ) ( not ( = ?auto_2024741 ?auto_2024746 ) ) ( not ( = ?auto_2024741 ?auto_2024748 ) ) ( not ( = ?auto_2024742 ?auto_2024744 ) ) ( not ( = ?auto_2024742 ?auto_2024743 ) ) ( not ( = ?auto_2024742 ?auto_2024745 ) ) ( not ( = ?auto_2024742 ?auto_2024746 ) ) ( not ( = ?auto_2024742 ?auto_2024748 ) ) ( not ( = ?auto_2024744 ?auto_2024743 ) ) ( not ( = ?auto_2024744 ?auto_2024745 ) ) ( not ( = ?auto_2024744 ?auto_2024746 ) ) ( not ( = ?auto_2024744 ?auto_2024748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024743 ?auto_2024745 ?auto_2024746 )
      ( MAKE-6CRATE-VERIFY ?auto_2024740 ?auto_2024741 ?auto_2024742 ?auto_2024744 ?auto_2024743 ?auto_2024745 ?auto_2024746 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024804 - SURFACE
      ?auto_2024805 - SURFACE
      ?auto_2024806 - SURFACE
      ?auto_2024808 - SURFACE
      ?auto_2024807 - SURFACE
      ?auto_2024809 - SURFACE
      ?auto_2024810 - SURFACE
    )
    :vars
    (
      ?auto_2024811 - HOIST
      ?auto_2024815 - PLACE
      ?auto_2024812 - PLACE
      ?auto_2024814 - HOIST
      ?auto_2024813 - SURFACE
      ?auto_2024816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024811 ?auto_2024815 ) ( IS-CRATE ?auto_2024810 ) ( not ( = ?auto_2024809 ?auto_2024810 ) ) ( not ( = ?auto_2024807 ?auto_2024809 ) ) ( not ( = ?auto_2024807 ?auto_2024810 ) ) ( not ( = ?auto_2024812 ?auto_2024815 ) ) ( HOIST-AT ?auto_2024814 ?auto_2024812 ) ( not ( = ?auto_2024811 ?auto_2024814 ) ) ( AVAILABLE ?auto_2024814 ) ( SURFACE-AT ?auto_2024810 ?auto_2024812 ) ( ON ?auto_2024810 ?auto_2024813 ) ( CLEAR ?auto_2024810 ) ( not ( = ?auto_2024809 ?auto_2024813 ) ) ( not ( = ?auto_2024810 ?auto_2024813 ) ) ( not ( = ?auto_2024807 ?auto_2024813 ) ) ( TRUCK-AT ?auto_2024816 ?auto_2024815 ) ( SURFACE-AT ?auto_2024807 ?auto_2024815 ) ( CLEAR ?auto_2024807 ) ( LIFTING ?auto_2024811 ?auto_2024809 ) ( IS-CRATE ?auto_2024809 ) ( ON ?auto_2024805 ?auto_2024804 ) ( ON ?auto_2024806 ?auto_2024805 ) ( ON ?auto_2024808 ?auto_2024806 ) ( ON ?auto_2024807 ?auto_2024808 ) ( not ( = ?auto_2024804 ?auto_2024805 ) ) ( not ( = ?auto_2024804 ?auto_2024806 ) ) ( not ( = ?auto_2024804 ?auto_2024808 ) ) ( not ( = ?auto_2024804 ?auto_2024807 ) ) ( not ( = ?auto_2024804 ?auto_2024809 ) ) ( not ( = ?auto_2024804 ?auto_2024810 ) ) ( not ( = ?auto_2024804 ?auto_2024813 ) ) ( not ( = ?auto_2024805 ?auto_2024806 ) ) ( not ( = ?auto_2024805 ?auto_2024808 ) ) ( not ( = ?auto_2024805 ?auto_2024807 ) ) ( not ( = ?auto_2024805 ?auto_2024809 ) ) ( not ( = ?auto_2024805 ?auto_2024810 ) ) ( not ( = ?auto_2024805 ?auto_2024813 ) ) ( not ( = ?auto_2024806 ?auto_2024808 ) ) ( not ( = ?auto_2024806 ?auto_2024807 ) ) ( not ( = ?auto_2024806 ?auto_2024809 ) ) ( not ( = ?auto_2024806 ?auto_2024810 ) ) ( not ( = ?auto_2024806 ?auto_2024813 ) ) ( not ( = ?auto_2024808 ?auto_2024807 ) ) ( not ( = ?auto_2024808 ?auto_2024809 ) ) ( not ( = ?auto_2024808 ?auto_2024810 ) ) ( not ( = ?auto_2024808 ?auto_2024813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024807 ?auto_2024809 ?auto_2024810 )
      ( MAKE-6CRATE-VERIFY ?auto_2024804 ?auto_2024805 ?auto_2024806 ?auto_2024808 ?auto_2024807 ?auto_2024809 ?auto_2024810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024868 - SURFACE
      ?auto_2024869 - SURFACE
      ?auto_2024870 - SURFACE
      ?auto_2024872 - SURFACE
      ?auto_2024871 - SURFACE
      ?auto_2024873 - SURFACE
      ?auto_2024874 - SURFACE
    )
    :vars
    (
      ?auto_2024877 - HOIST
      ?auto_2024879 - PLACE
      ?auto_2024875 - PLACE
      ?auto_2024878 - HOIST
      ?auto_2024876 - SURFACE
      ?auto_2024880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024877 ?auto_2024879 ) ( IS-CRATE ?auto_2024874 ) ( not ( = ?auto_2024873 ?auto_2024874 ) ) ( not ( = ?auto_2024871 ?auto_2024873 ) ) ( not ( = ?auto_2024871 ?auto_2024874 ) ) ( not ( = ?auto_2024875 ?auto_2024879 ) ) ( HOIST-AT ?auto_2024878 ?auto_2024875 ) ( not ( = ?auto_2024877 ?auto_2024878 ) ) ( AVAILABLE ?auto_2024878 ) ( SURFACE-AT ?auto_2024874 ?auto_2024875 ) ( ON ?auto_2024874 ?auto_2024876 ) ( CLEAR ?auto_2024874 ) ( not ( = ?auto_2024873 ?auto_2024876 ) ) ( not ( = ?auto_2024874 ?auto_2024876 ) ) ( not ( = ?auto_2024871 ?auto_2024876 ) ) ( TRUCK-AT ?auto_2024880 ?auto_2024879 ) ( SURFACE-AT ?auto_2024871 ?auto_2024879 ) ( CLEAR ?auto_2024871 ) ( IS-CRATE ?auto_2024873 ) ( AVAILABLE ?auto_2024877 ) ( IN ?auto_2024873 ?auto_2024880 ) ( ON ?auto_2024869 ?auto_2024868 ) ( ON ?auto_2024870 ?auto_2024869 ) ( ON ?auto_2024872 ?auto_2024870 ) ( ON ?auto_2024871 ?auto_2024872 ) ( not ( = ?auto_2024868 ?auto_2024869 ) ) ( not ( = ?auto_2024868 ?auto_2024870 ) ) ( not ( = ?auto_2024868 ?auto_2024872 ) ) ( not ( = ?auto_2024868 ?auto_2024871 ) ) ( not ( = ?auto_2024868 ?auto_2024873 ) ) ( not ( = ?auto_2024868 ?auto_2024874 ) ) ( not ( = ?auto_2024868 ?auto_2024876 ) ) ( not ( = ?auto_2024869 ?auto_2024870 ) ) ( not ( = ?auto_2024869 ?auto_2024872 ) ) ( not ( = ?auto_2024869 ?auto_2024871 ) ) ( not ( = ?auto_2024869 ?auto_2024873 ) ) ( not ( = ?auto_2024869 ?auto_2024874 ) ) ( not ( = ?auto_2024869 ?auto_2024876 ) ) ( not ( = ?auto_2024870 ?auto_2024872 ) ) ( not ( = ?auto_2024870 ?auto_2024871 ) ) ( not ( = ?auto_2024870 ?auto_2024873 ) ) ( not ( = ?auto_2024870 ?auto_2024874 ) ) ( not ( = ?auto_2024870 ?auto_2024876 ) ) ( not ( = ?auto_2024872 ?auto_2024871 ) ) ( not ( = ?auto_2024872 ?auto_2024873 ) ) ( not ( = ?auto_2024872 ?auto_2024874 ) ) ( not ( = ?auto_2024872 ?auto_2024876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024871 ?auto_2024873 ?auto_2024874 )
      ( MAKE-6CRATE-VERIFY ?auto_2024868 ?auto_2024869 ?auto_2024870 ?auto_2024872 ?auto_2024871 ?auto_2024873 ?auto_2024874 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2026824 - SURFACE
      ?auto_2026825 - SURFACE
      ?auto_2026826 - SURFACE
      ?auto_2026828 - SURFACE
      ?auto_2026827 - SURFACE
      ?auto_2026829 - SURFACE
      ?auto_2026830 - SURFACE
      ?auto_2026831 - SURFACE
    )
    :vars
    (
      ?auto_2026833 - HOIST
      ?auto_2026832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2026833 ?auto_2026832 ) ( SURFACE-AT ?auto_2026830 ?auto_2026832 ) ( CLEAR ?auto_2026830 ) ( LIFTING ?auto_2026833 ?auto_2026831 ) ( IS-CRATE ?auto_2026831 ) ( not ( = ?auto_2026830 ?auto_2026831 ) ) ( ON ?auto_2026825 ?auto_2026824 ) ( ON ?auto_2026826 ?auto_2026825 ) ( ON ?auto_2026828 ?auto_2026826 ) ( ON ?auto_2026827 ?auto_2026828 ) ( ON ?auto_2026829 ?auto_2026827 ) ( ON ?auto_2026830 ?auto_2026829 ) ( not ( = ?auto_2026824 ?auto_2026825 ) ) ( not ( = ?auto_2026824 ?auto_2026826 ) ) ( not ( = ?auto_2026824 ?auto_2026828 ) ) ( not ( = ?auto_2026824 ?auto_2026827 ) ) ( not ( = ?auto_2026824 ?auto_2026829 ) ) ( not ( = ?auto_2026824 ?auto_2026830 ) ) ( not ( = ?auto_2026824 ?auto_2026831 ) ) ( not ( = ?auto_2026825 ?auto_2026826 ) ) ( not ( = ?auto_2026825 ?auto_2026828 ) ) ( not ( = ?auto_2026825 ?auto_2026827 ) ) ( not ( = ?auto_2026825 ?auto_2026829 ) ) ( not ( = ?auto_2026825 ?auto_2026830 ) ) ( not ( = ?auto_2026825 ?auto_2026831 ) ) ( not ( = ?auto_2026826 ?auto_2026828 ) ) ( not ( = ?auto_2026826 ?auto_2026827 ) ) ( not ( = ?auto_2026826 ?auto_2026829 ) ) ( not ( = ?auto_2026826 ?auto_2026830 ) ) ( not ( = ?auto_2026826 ?auto_2026831 ) ) ( not ( = ?auto_2026828 ?auto_2026827 ) ) ( not ( = ?auto_2026828 ?auto_2026829 ) ) ( not ( = ?auto_2026828 ?auto_2026830 ) ) ( not ( = ?auto_2026828 ?auto_2026831 ) ) ( not ( = ?auto_2026827 ?auto_2026829 ) ) ( not ( = ?auto_2026827 ?auto_2026830 ) ) ( not ( = ?auto_2026827 ?auto_2026831 ) ) ( not ( = ?auto_2026829 ?auto_2026830 ) ) ( not ( = ?auto_2026829 ?auto_2026831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2026830 ?auto_2026831 )
      ( MAKE-7CRATE-VERIFY ?auto_2026824 ?auto_2026825 ?auto_2026826 ?auto_2026828 ?auto_2026827 ?auto_2026829 ?auto_2026830 ?auto_2026831 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2026879 - SURFACE
      ?auto_2026880 - SURFACE
      ?auto_2026881 - SURFACE
      ?auto_2026883 - SURFACE
      ?auto_2026882 - SURFACE
      ?auto_2026884 - SURFACE
      ?auto_2026885 - SURFACE
      ?auto_2026886 - SURFACE
    )
    :vars
    (
      ?auto_2026887 - HOIST
      ?auto_2026889 - PLACE
      ?auto_2026888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2026887 ?auto_2026889 ) ( SURFACE-AT ?auto_2026885 ?auto_2026889 ) ( CLEAR ?auto_2026885 ) ( IS-CRATE ?auto_2026886 ) ( not ( = ?auto_2026885 ?auto_2026886 ) ) ( TRUCK-AT ?auto_2026888 ?auto_2026889 ) ( AVAILABLE ?auto_2026887 ) ( IN ?auto_2026886 ?auto_2026888 ) ( ON ?auto_2026885 ?auto_2026884 ) ( not ( = ?auto_2026884 ?auto_2026885 ) ) ( not ( = ?auto_2026884 ?auto_2026886 ) ) ( ON ?auto_2026880 ?auto_2026879 ) ( ON ?auto_2026881 ?auto_2026880 ) ( ON ?auto_2026883 ?auto_2026881 ) ( ON ?auto_2026882 ?auto_2026883 ) ( ON ?auto_2026884 ?auto_2026882 ) ( not ( = ?auto_2026879 ?auto_2026880 ) ) ( not ( = ?auto_2026879 ?auto_2026881 ) ) ( not ( = ?auto_2026879 ?auto_2026883 ) ) ( not ( = ?auto_2026879 ?auto_2026882 ) ) ( not ( = ?auto_2026879 ?auto_2026884 ) ) ( not ( = ?auto_2026879 ?auto_2026885 ) ) ( not ( = ?auto_2026879 ?auto_2026886 ) ) ( not ( = ?auto_2026880 ?auto_2026881 ) ) ( not ( = ?auto_2026880 ?auto_2026883 ) ) ( not ( = ?auto_2026880 ?auto_2026882 ) ) ( not ( = ?auto_2026880 ?auto_2026884 ) ) ( not ( = ?auto_2026880 ?auto_2026885 ) ) ( not ( = ?auto_2026880 ?auto_2026886 ) ) ( not ( = ?auto_2026881 ?auto_2026883 ) ) ( not ( = ?auto_2026881 ?auto_2026882 ) ) ( not ( = ?auto_2026881 ?auto_2026884 ) ) ( not ( = ?auto_2026881 ?auto_2026885 ) ) ( not ( = ?auto_2026881 ?auto_2026886 ) ) ( not ( = ?auto_2026883 ?auto_2026882 ) ) ( not ( = ?auto_2026883 ?auto_2026884 ) ) ( not ( = ?auto_2026883 ?auto_2026885 ) ) ( not ( = ?auto_2026883 ?auto_2026886 ) ) ( not ( = ?auto_2026882 ?auto_2026884 ) ) ( not ( = ?auto_2026882 ?auto_2026885 ) ) ( not ( = ?auto_2026882 ?auto_2026886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2026884 ?auto_2026885 ?auto_2026886 )
      ( MAKE-7CRATE-VERIFY ?auto_2026879 ?auto_2026880 ?auto_2026881 ?auto_2026883 ?auto_2026882 ?auto_2026884 ?auto_2026885 ?auto_2026886 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2026942 - SURFACE
      ?auto_2026943 - SURFACE
      ?auto_2026944 - SURFACE
      ?auto_2026946 - SURFACE
      ?auto_2026945 - SURFACE
      ?auto_2026947 - SURFACE
      ?auto_2026948 - SURFACE
      ?auto_2026949 - SURFACE
    )
    :vars
    (
      ?auto_2026950 - HOIST
      ?auto_2026953 - PLACE
      ?auto_2026951 - TRUCK
      ?auto_2026952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2026950 ?auto_2026953 ) ( SURFACE-AT ?auto_2026948 ?auto_2026953 ) ( CLEAR ?auto_2026948 ) ( IS-CRATE ?auto_2026949 ) ( not ( = ?auto_2026948 ?auto_2026949 ) ) ( AVAILABLE ?auto_2026950 ) ( IN ?auto_2026949 ?auto_2026951 ) ( ON ?auto_2026948 ?auto_2026947 ) ( not ( = ?auto_2026947 ?auto_2026948 ) ) ( not ( = ?auto_2026947 ?auto_2026949 ) ) ( TRUCK-AT ?auto_2026951 ?auto_2026952 ) ( not ( = ?auto_2026952 ?auto_2026953 ) ) ( ON ?auto_2026943 ?auto_2026942 ) ( ON ?auto_2026944 ?auto_2026943 ) ( ON ?auto_2026946 ?auto_2026944 ) ( ON ?auto_2026945 ?auto_2026946 ) ( ON ?auto_2026947 ?auto_2026945 ) ( not ( = ?auto_2026942 ?auto_2026943 ) ) ( not ( = ?auto_2026942 ?auto_2026944 ) ) ( not ( = ?auto_2026942 ?auto_2026946 ) ) ( not ( = ?auto_2026942 ?auto_2026945 ) ) ( not ( = ?auto_2026942 ?auto_2026947 ) ) ( not ( = ?auto_2026942 ?auto_2026948 ) ) ( not ( = ?auto_2026942 ?auto_2026949 ) ) ( not ( = ?auto_2026943 ?auto_2026944 ) ) ( not ( = ?auto_2026943 ?auto_2026946 ) ) ( not ( = ?auto_2026943 ?auto_2026945 ) ) ( not ( = ?auto_2026943 ?auto_2026947 ) ) ( not ( = ?auto_2026943 ?auto_2026948 ) ) ( not ( = ?auto_2026943 ?auto_2026949 ) ) ( not ( = ?auto_2026944 ?auto_2026946 ) ) ( not ( = ?auto_2026944 ?auto_2026945 ) ) ( not ( = ?auto_2026944 ?auto_2026947 ) ) ( not ( = ?auto_2026944 ?auto_2026948 ) ) ( not ( = ?auto_2026944 ?auto_2026949 ) ) ( not ( = ?auto_2026946 ?auto_2026945 ) ) ( not ( = ?auto_2026946 ?auto_2026947 ) ) ( not ( = ?auto_2026946 ?auto_2026948 ) ) ( not ( = ?auto_2026946 ?auto_2026949 ) ) ( not ( = ?auto_2026945 ?auto_2026947 ) ) ( not ( = ?auto_2026945 ?auto_2026948 ) ) ( not ( = ?auto_2026945 ?auto_2026949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2026947 ?auto_2026948 ?auto_2026949 )
      ( MAKE-7CRATE-VERIFY ?auto_2026942 ?auto_2026943 ?auto_2026944 ?auto_2026946 ?auto_2026945 ?auto_2026947 ?auto_2026948 ?auto_2026949 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027012 - SURFACE
      ?auto_2027013 - SURFACE
      ?auto_2027014 - SURFACE
      ?auto_2027016 - SURFACE
      ?auto_2027015 - SURFACE
      ?auto_2027017 - SURFACE
      ?auto_2027018 - SURFACE
      ?auto_2027019 - SURFACE
    )
    :vars
    (
      ?auto_2027023 - HOIST
      ?auto_2027021 - PLACE
      ?auto_2027022 - TRUCK
      ?auto_2027020 - PLACE
      ?auto_2027024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027023 ?auto_2027021 ) ( SURFACE-AT ?auto_2027018 ?auto_2027021 ) ( CLEAR ?auto_2027018 ) ( IS-CRATE ?auto_2027019 ) ( not ( = ?auto_2027018 ?auto_2027019 ) ) ( AVAILABLE ?auto_2027023 ) ( ON ?auto_2027018 ?auto_2027017 ) ( not ( = ?auto_2027017 ?auto_2027018 ) ) ( not ( = ?auto_2027017 ?auto_2027019 ) ) ( TRUCK-AT ?auto_2027022 ?auto_2027020 ) ( not ( = ?auto_2027020 ?auto_2027021 ) ) ( HOIST-AT ?auto_2027024 ?auto_2027020 ) ( LIFTING ?auto_2027024 ?auto_2027019 ) ( not ( = ?auto_2027023 ?auto_2027024 ) ) ( ON ?auto_2027013 ?auto_2027012 ) ( ON ?auto_2027014 ?auto_2027013 ) ( ON ?auto_2027016 ?auto_2027014 ) ( ON ?auto_2027015 ?auto_2027016 ) ( ON ?auto_2027017 ?auto_2027015 ) ( not ( = ?auto_2027012 ?auto_2027013 ) ) ( not ( = ?auto_2027012 ?auto_2027014 ) ) ( not ( = ?auto_2027012 ?auto_2027016 ) ) ( not ( = ?auto_2027012 ?auto_2027015 ) ) ( not ( = ?auto_2027012 ?auto_2027017 ) ) ( not ( = ?auto_2027012 ?auto_2027018 ) ) ( not ( = ?auto_2027012 ?auto_2027019 ) ) ( not ( = ?auto_2027013 ?auto_2027014 ) ) ( not ( = ?auto_2027013 ?auto_2027016 ) ) ( not ( = ?auto_2027013 ?auto_2027015 ) ) ( not ( = ?auto_2027013 ?auto_2027017 ) ) ( not ( = ?auto_2027013 ?auto_2027018 ) ) ( not ( = ?auto_2027013 ?auto_2027019 ) ) ( not ( = ?auto_2027014 ?auto_2027016 ) ) ( not ( = ?auto_2027014 ?auto_2027015 ) ) ( not ( = ?auto_2027014 ?auto_2027017 ) ) ( not ( = ?auto_2027014 ?auto_2027018 ) ) ( not ( = ?auto_2027014 ?auto_2027019 ) ) ( not ( = ?auto_2027016 ?auto_2027015 ) ) ( not ( = ?auto_2027016 ?auto_2027017 ) ) ( not ( = ?auto_2027016 ?auto_2027018 ) ) ( not ( = ?auto_2027016 ?auto_2027019 ) ) ( not ( = ?auto_2027015 ?auto_2027017 ) ) ( not ( = ?auto_2027015 ?auto_2027018 ) ) ( not ( = ?auto_2027015 ?auto_2027019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027017 ?auto_2027018 ?auto_2027019 )
      ( MAKE-7CRATE-VERIFY ?auto_2027012 ?auto_2027013 ?auto_2027014 ?auto_2027016 ?auto_2027015 ?auto_2027017 ?auto_2027018 ?auto_2027019 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027089 - SURFACE
      ?auto_2027090 - SURFACE
      ?auto_2027091 - SURFACE
      ?auto_2027093 - SURFACE
      ?auto_2027092 - SURFACE
      ?auto_2027094 - SURFACE
      ?auto_2027095 - SURFACE
      ?auto_2027096 - SURFACE
    )
    :vars
    (
      ?auto_2027099 - HOIST
      ?auto_2027101 - PLACE
      ?auto_2027100 - TRUCK
      ?auto_2027102 - PLACE
      ?auto_2027098 - HOIST
      ?auto_2027097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027099 ?auto_2027101 ) ( SURFACE-AT ?auto_2027095 ?auto_2027101 ) ( CLEAR ?auto_2027095 ) ( IS-CRATE ?auto_2027096 ) ( not ( = ?auto_2027095 ?auto_2027096 ) ) ( AVAILABLE ?auto_2027099 ) ( ON ?auto_2027095 ?auto_2027094 ) ( not ( = ?auto_2027094 ?auto_2027095 ) ) ( not ( = ?auto_2027094 ?auto_2027096 ) ) ( TRUCK-AT ?auto_2027100 ?auto_2027102 ) ( not ( = ?auto_2027102 ?auto_2027101 ) ) ( HOIST-AT ?auto_2027098 ?auto_2027102 ) ( not ( = ?auto_2027099 ?auto_2027098 ) ) ( AVAILABLE ?auto_2027098 ) ( SURFACE-AT ?auto_2027096 ?auto_2027102 ) ( ON ?auto_2027096 ?auto_2027097 ) ( CLEAR ?auto_2027096 ) ( not ( = ?auto_2027095 ?auto_2027097 ) ) ( not ( = ?auto_2027096 ?auto_2027097 ) ) ( not ( = ?auto_2027094 ?auto_2027097 ) ) ( ON ?auto_2027090 ?auto_2027089 ) ( ON ?auto_2027091 ?auto_2027090 ) ( ON ?auto_2027093 ?auto_2027091 ) ( ON ?auto_2027092 ?auto_2027093 ) ( ON ?auto_2027094 ?auto_2027092 ) ( not ( = ?auto_2027089 ?auto_2027090 ) ) ( not ( = ?auto_2027089 ?auto_2027091 ) ) ( not ( = ?auto_2027089 ?auto_2027093 ) ) ( not ( = ?auto_2027089 ?auto_2027092 ) ) ( not ( = ?auto_2027089 ?auto_2027094 ) ) ( not ( = ?auto_2027089 ?auto_2027095 ) ) ( not ( = ?auto_2027089 ?auto_2027096 ) ) ( not ( = ?auto_2027089 ?auto_2027097 ) ) ( not ( = ?auto_2027090 ?auto_2027091 ) ) ( not ( = ?auto_2027090 ?auto_2027093 ) ) ( not ( = ?auto_2027090 ?auto_2027092 ) ) ( not ( = ?auto_2027090 ?auto_2027094 ) ) ( not ( = ?auto_2027090 ?auto_2027095 ) ) ( not ( = ?auto_2027090 ?auto_2027096 ) ) ( not ( = ?auto_2027090 ?auto_2027097 ) ) ( not ( = ?auto_2027091 ?auto_2027093 ) ) ( not ( = ?auto_2027091 ?auto_2027092 ) ) ( not ( = ?auto_2027091 ?auto_2027094 ) ) ( not ( = ?auto_2027091 ?auto_2027095 ) ) ( not ( = ?auto_2027091 ?auto_2027096 ) ) ( not ( = ?auto_2027091 ?auto_2027097 ) ) ( not ( = ?auto_2027093 ?auto_2027092 ) ) ( not ( = ?auto_2027093 ?auto_2027094 ) ) ( not ( = ?auto_2027093 ?auto_2027095 ) ) ( not ( = ?auto_2027093 ?auto_2027096 ) ) ( not ( = ?auto_2027093 ?auto_2027097 ) ) ( not ( = ?auto_2027092 ?auto_2027094 ) ) ( not ( = ?auto_2027092 ?auto_2027095 ) ) ( not ( = ?auto_2027092 ?auto_2027096 ) ) ( not ( = ?auto_2027092 ?auto_2027097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027094 ?auto_2027095 ?auto_2027096 )
      ( MAKE-7CRATE-VERIFY ?auto_2027089 ?auto_2027090 ?auto_2027091 ?auto_2027093 ?auto_2027092 ?auto_2027094 ?auto_2027095 ?auto_2027096 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027167 - SURFACE
      ?auto_2027168 - SURFACE
      ?auto_2027169 - SURFACE
      ?auto_2027171 - SURFACE
      ?auto_2027170 - SURFACE
      ?auto_2027172 - SURFACE
      ?auto_2027173 - SURFACE
      ?auto_2027174 - SURFACE
    )
    :vars
    (
      ?auto_2027178 - HOIST
      ?auto_2027179 - PLACE
      ?auto_2027176 - PLACE
      ?auto_2027175 - HOIST
      ?auto_2027177 - SURFACE
      ?auto_2027180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027178 ?auto_2027179 ) ( SURFACE-AT ?auto_2027173 ?auto_2027179 ) ( CLEAR ?auto_2027173 ) ( IS-CRATE ?auto_2027174 ) ( not ( = ?auto_2027173 ?auto_2027174 ) ) ( AVAILABLE ?auto_2027178 ) ( ON ?auto_2027173 ?auto_2027172 ) ( not ( = ?auto_2027172 ?auto_2027173 ) ) ( not ( = ?auto_2027172 ?auto_2027174 ) ) ( not ( = ?auto_2027176 ?auto_2027179 ) ) ( HOIST-AT ?auto_2027175 ?auto_2027176 ) ( not ( = ?auto_2027178 ?auto_2027175 ) ) ( AVAILABLE ?auto_2027175 ) ( SURFACE-AT ?auto_2027174 ?auto_2027176 ) ( ON ?auto_2027174 ?auto_2027177 ) ( CLEAR ?auto_2027174 ) ( not ( = ?auto_2027173 ?auto_2027177 ) ) ( not ( = ?auto_2027174 ?auto_2027177 ) ) ( not ( = ?auto_2027172 ?auto_2027177 ) ) ( TRUCK-AT ?auto_2027180 ?auto_2027179 ) ( ON ?auto_2027168 ?auto_2027167 ) ( ON ?auto_2027169 ?auto_2027168 ) ( ON ?auto_2027171 ?auto_2027169 ) ( ON ?auto_2027170 ?auto_2027171 ) ( ON ?auto_2027172 ?auto_2027170 ) ( not ( = ?auto_2027167 ?auto_2027168 ) ) ( not ( = ?auto_2027167 ?auto_2027169 ) ) ( not ( = ?auto_2027167 ?auto_2027171 ) ) ( not ( = ?auto_2027167 ?auto_2027170 ) ) ( not ( = ?auto_2027167 ?auto_2027172 ) ) ( not ( = ?auto_2027167 ?auto_2027173 ) ) ( not ( = ?auto_2027167 ?auto_2027174 ) ) ( not ( = ?auto_2027167 ?auto_2027177 ) ) ( not ( = ?auto_2027168 ?auto_2027169 ) ) ( not ( = ?auto_2027168 ?auto_2027171 ) ) ( not ( = ?auto_2027168 ?auto_2027170 ) ) ( not ( = ?auto_2027168 ?auto_2027172 ) ) ( not ( = ?auto_2027168 ?auto_2027173 ) ) ( not ( = ?auto_2027168 ?auto_2027174 ) ) ( not ( = ?auto_2027168 ?auto_2027177 ) ) ( not ( = ?auto_2027169 ?auto_2027171 ) ) ( not ( = ?auto_2027169 ?auto_2027170 ) ) ( not ( = ?auto_2027169 ?auto_2027172 ) ) ( not ( = ?auto_2027169 ?auto_2027173 ) ) ( not ( = ?auto_2027169 ?auto_2027174 ) ) ( not ( = ?auto_2027169 ?auto_2027177 ) ) ( not ( = ?auto_2027171 ?auto_2027170 ) ) ( not ( = ?auto_2027171 ?auto_2027172 ) ) ( not ( = ?auto_2027171 ?auto_2027173 ) ) ( not ( = ?auto_2027171 ?auto_2027174 ) ) ( not ( = ?auto_2027171 ?auto_2027177 ) ) ( not ( = ?auto_2027170 ?auto_2027172 ) ) ( not ( = ?auto_2027170 ?auto_2027173 ) ) ( not ( = ?auto_2027170 ?auto_2027174 ) ) ( not ( = ?auto_2027170 ?auto_2027177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027172 ?auto_2027173 ?auto_2027174 )
      ( MAKE-7CRATE-VERIFY ?auto_2027167 ?auto_2027168 ?auto_2027169 ?auto_2027171 ?auto_2027170 ?auto_2027172 ?auto_2027173 ?auto_2027174 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027245 - SURFACE
      ?auto_2027246 - SURFACE
      ?auto_2027247 - SURFACE
      ?auto_2027249 - SURFACE
      ?auto_2027248 - SURFACE
      ?auto_2027250 - SURFACE
      ?auto_2027251 - SURFACE
      ?auto_2027252 - SURFACE
    )
    :vars
    (
      ?auto_2027253 - HOIST
      ?auto_2027254 - PLACE
      ?auto_2027258 - PLACE
      ?auto_2027256 - HOIST
      ?auto_2027255 - SURFACE
      ?auto_2027257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027253 ?auto_2027254 ) ( IS-CRATE ?auto_2027252 ) ( not ( = ?auto_2027251 ?auto_2027252 ) ) ( not ( = ?auto_2027250 ?auto_2027251 ) ) ( not ( = ?auto_2027250 ?auto_2027252 ) ) ( not ( = ?auto_2027258 ?auto_2027254 ) ) ( HOIST-AT ?auto_2027256 ?auto_2027258 ) ( not ( = ?auto_2027253 ?auto_2027256 ) ) ( AVAILABLE ?auto_2027256 ) ( SURFACE-AT ?auto_2027252 ?auto_2027258 ) ( ON ?auto_2027252 ?auto_2027255 ) ( CLEAR ?auto_2027252 ) ( not ( = ?auto_2027251 ?auto_2027255 ) ) ( not ( = ?auto_2027252 ?auto_2027255 ) ) ( not ( = ?auto_2027250 ?auto_2027255 ) ) ( TRUCK-AT ?auto_2027257 ?auto_2027254 ) ( SURFACE-AT ?auto_2027250 ?auto_2027254 ) ( CLEAR ?auto_2027250 ) ( LIFTING ?auto_2027253 ?auto_2027251 ) ( IS-CRATE ?auto_2027251 ) ( ON ?auto_2027246 ?auto_2027245 ) ( ON ?auto_2027247 ?auto_2027246 ) ( ON ?auto_2027249 ?auto_2027247 ) ( ON ?auto_2027248 ?auto_2027249 ) ( ON ?auto_2027250 ?auto_2027248 ) ( not ( = ?auto_2027245 ?auto_2027246 ) ) ( not ( = ?auto_2027245 ?auto_2027247 ) ) ( not ( = ?auto_2027245 ?auto_2027249 ) ) ( not ( = ?auto_2027245 ?auto_2027248 ) ) ( not ( = ?auto_2027245 ?auto_2027250 ) ) ( not ( = ?auto_2027245 ?auto_2027251 ) ) ( not ( = ?auto_2027245 ?auto_2027252 ) ) ( not ( = ?auto_2027245 ?auto_2027255 ) ) ( not ( = ?auto_2027246 ?auto_2027247 ) ) ( not ( = ?auto_2027246 ?auto_2027249 ) ) ( not ( = ?auto_2027246 ?auto_2027248 ) ) ( not ( = ?auto_2027246 ?auto_2027250 ) ) ( not ( = ?auto_2027246 ?auto_2027251 ) ) ( not ( = ?auto_2027246 ?auto_2027252 ) ) ( not ( = ?auto_2027246 ?auto_2027255 ) ) ( not ( = ?auto_2027247 ?auto_2027249 ) ) ( not ( = ?auto_2027247 ?auto_2027248 ) ) ( not ( = ?auto_2027247 ?auto_2027250 ) ) ( not ( = ?auto_2027247 ?auto_2027251 ) ) ( not ( = ?auto_2027247 ?auto_2027252 ) ) ( not ( = ?auto_2027247 ?auto_2027255 ) ) ( not ( = ?auto_2027249 ?auto_2027248 ) ) ( not ( = ?auto_2027249 ?auto_2027250 ) ) ( not ( = ?auto_2027249 ?auto_2027251 ) ) ( not ( = ?auto_2027249 ?auto_2027252 ) ) ( not ( = ?auto_2027249 ?auto_2027255 ) ) ( not ( = ?auto_2027248 ?auto_2027250 ) ) ( not ( = ?auto_2027248 ?auto_2027251 ) ) ( not ( = ?auto_2027248 ?auto_2027252 ) ) ( not ( = ?auto_2027248 ?auto_2027255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027250 ?auto_2027251 ?auto_2027252 )
      ( MAKE-7CRATE-VERIFY ?auto_2027245 ?auto_2027246 ?auto_2027247 ?auto_2027249 ?auto_2027248 ?auto_2027250 ?auto_2027251 ?auto_2027252 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027323 - SURFACE
      ?auto_2027324 - SURFACE
      ?auto_2027325 - SURFACE
      ?auto_2027327 - SURFACE
      ?auto_2027326 - SURFACE
      ?auto_2027328 - SURFACE
      ?auto_2027329 - SURFACE
      ?auto_2027330 - SURFACE
    )
    :vars
    (
      ?auto_2027331 - HOIST
      ?auto_2027334 - PLACE
      ?auto_2027335 - PLACE
      ?auto_2027336 - HOIST
      ?auto_2027332 - SURFACE
      ?auto_2027333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027331 ?auto_2027334 ) ( IS-CRATE ?auto_2027330 ) ( not ( = ?auto_2027329 ?auto_2027330 ) ) ( not ( = ?auto_2027328 ?auto_2027329 ) ) ( not ( = ?auto_2027328 ?auto_2027330 ) ) ( not ( = ?auto_2027335 ?auto_2027334 ) ) ( HOIST-AT ?auto_2027336 ?auto_2027335 ) ( not ( = ?auto_2027331 ?auto_2027336 ) ) ( AVAILABLE ?auto_2027336 ) ( SURFACE-AT ?auto_2027330 ?auto_2027335 ) ( ON ?auto_2027330 ?auto_2027332 ) ( CLEAR ?auto_2027330 ) ( not ( = ?auto_2027329 ?auto_2027332 ) ) ( not ( = ?auto_2027330 ?auto_2027332 ) ) ( not ( = ?auto_2027328 ?auto_2027332 ) ) ( TRUCK-AT ?auto_2027333 ?auto_2027334 ) ( SURFACE-AT ?auto_2027328 ?auto_2027334 ) ( CLEAR ?auto_2027328 ) ( IS-CRATE ?auto_2027329 ) ( AVAILABLE ?auto_2027331 ) ( IN ?auto_2027329 ?auto_2027333 ) ( ON ?auto_2027324 ?auto_2027323 ) ( ON ?auto_2027325 ?auto_2027324 ) ( ON ?auto_2027327 ?auto_2027325 ) ( ON ?auto_2027326 ?auto_2027327 ) ( ON ?auto_2027328 ?auto_2027326 ) ( not ( = ?auto_2027323 ?auto_2027324 ) ) ( not ( = ?auto_2027323 ?auto_2027325 ) ) ( not ( = ?auto_2027323 ?auto_2027327 ) ) ( not ( = ?auto_2027323 ?auto_2027326 ) ) ( not ( = ?auto_2027323 ?auto_2027328 ) ) ( not ( = ?auto_2027323 ?auto_2027329 ) ) ( not ( = ?auto_2027323 ?auto_2027330 ) ) ( not ( = ?auto_2027323 ?auto_2027332 ) ) ( not ( = ?auto_2027324 ?auto_2027325 ) ) ( not ( = ?auto_2027324 ?auto_2027327 ) ) ( not ( = ?auto_2027324 ?auto_2027326 ) ) ( not ( = ?auto_2027324 ?auto_2027328 ) ) ( not ( = ?auto_2027324 ?auto_2027329 ) ) ( not ( = ?auto_2027324 ?auto_2027330 ) ) ( not ( = ?auto_2027324 ?auto_2027332 ) ) ( not ( = ?auto_2027325 ?auto_2027327 ) ) ( not ( = ?auto_2027325 ?auto_2027326 ) ) ( not ( = ?auto_2027325 ?auto_2027328 ) ) ( not ( = ?auto_2027325 ?auto_2027329 ) ) ( not ( = ?auto_2027325 ?auto_2027330 ) ) ( not ( = ?auto_2027325 ?auto_2027332 ) ) ( not ( = ?auto_2027327 ?auto_2027326 ) ) ( not ( = ?auto_2027327 ?auto_2027328 ) ) ( not ( = ?auto_2027327 ?auto_2027329 ) ) ( not ( = ?auto_2027327 ?auto_2027330 ) ) ( not ( = ?auto_2027327 ?auto_2027332 ) ) ( not ( = ?auto_2027326 ?auto_2027328 ) ) ( not ( = ?auto_2027326 ?auto_2027329 ) ) ( not ( = ?auto_2027326 ?auto_2027330 ) ) ( not ( = ?auto_2027326 ?auto_2027332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027328 ?auto_2027329 ?auto_2027330 )
      ( MAKE-7CRATE-VERIFY ?auto_2027323 ?auto_2027324 ?auto_2027325 ?auto_2027327 ?auto_2027326 ?auto_2027328 ?auto_2027329 ?auto_2027330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2028898 - SURFACE
      ?auto_2028899 - SURFACE
    )
    :vars
    (
      ?auto_2028906 - HOIST
      ?auto_2028904 - PLACE
      ?auto_2028903 - SURFACE
      ?auto_2028900 - TRUCK
      ?auto_2028902 - PLACE
      ?auto_2028901 - HOIST
      ?auto_2028905 - SURFACE
      ?auto_2028907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2028906 ?auto_2028904 ) ( SURFACE-AT ?auto_2028898 ?auto_2028904 ) ( CLEAR ?auto_2028898 ) ( IS-CRATE ?auto_2028899 ) ( not ( = ?auto_2028898 ?auto_2028899 ) ) ( AVAILABLE ?auto_2028906 ) ( ON ?auto_2028898 ?auto_2028903 ) ( not ( = ?auto_2028903 ?auto_2028898 ) ) ( not ( = ?auto_2028903 ?auto_2028899 ) ) ( TRUCK-AT ?auto_2028900 ?auto_2028902 ) ( not ( = ?auto_2028902 ?auto_2028904 ) ) ( HOIST-AT ?auto_2028901 ?auto_2028902 ) ( not ( = ?auto_2028906 ?auto_2028901 ) ) ( SURFACE-AT ?auto_2028899 ?auto_2028902 ) ( ON ?auto_2028899 ?auto_2028905 ) ( CLEAR ?auto_2028899 ) ( not ( = ?auto_2028898 ?auto_2028905 ) ) ( not ( = ?auto_2028899 ?auto_2028905 ) ) ( not ( = ?auto_2028903 ?auto_2028905 ) ) ( LIFTING ?auto_2028901 ?auto_2028907 ) ( IS-CRATE ?auto_2028907 ) ( not ( = ?auto_2028898 ?auto_2028907 ) ) ( not ( = ?auto_2028899 ?auto_2028907 ) ) ( not ( = ?auto_2028903 ?auto_2028907 ) ) ( not ( = ?auto_2028905 ?auto_2028907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2028901 ?auto_2028907 ?auto_2028900 ?auto_2028902 )
      ( MAKE-1CRATE ?auto_2028898 ?auto_2028899 )
      ( MAKE-1CRATE-VERIFY ?auto_2028898 ?auto_2028899 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030234 - SURFACE
      ?auto_2030235 - SURFACE
      ?auto_2030236 - SURFACE
      ?auto_2030238 - SURFACE
      ?auto_2030237 - SURFACE
      ?auto_2030239 - SURFACE
      ?auto_2030240 - SURFACE
      ?auto_2030241 - SURFACE
      ?auto_2030242 - SURFACE
    )
    :vars
    (
      ?auto_2030244 - HOIST
      ?auto_2030243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030244 ?auto_2030243 ) ( SURFACE-AT ?auto_2030241 ?auto_2030243 ) ( CLEAR ?auto_2030241 ) ( LIFTING ?auto_2030244 ?auto_2030242 ) ( IS-CRATE ?auto_2030242 ) ( not ( = ?auto_2030241 ?auto_2030242 ) ) ( ON ?auto_2030235 ?auto_2030234 ) ( ON ?auto_2030236 ?auto_2030235 ) ( ON ?auto_2030238 ?auto_2030236 ) ( ON ?auto_2030237 ?auto_2030238 ) ( ON ?auto_2030239 ?auto_2030237 ) ( ON ?auto_2030240 ?auto_2030239 ) ( ON ?auto_2030241 ?auto_2030240 ) ( not ( = ?auto_2030234 ?auto_2030235 ) ) ( not ( = ?auto_2030234 ?auto_2030236 ) ) ( not ( = ?auto_2030234 ?auto_2030238 ) ) ( not ( = ?auto_2030234 ?auto_2030237 ) ) ( not ( = ?auto_2030234 ?auto_2030239 ) ) ( not ( = ?auto_2030234 ?auto_2030240 ) ) ( not ( = ?auto_2030234 ?auto_2030241 ) ) ( not ( = ?auto_2030234 ?auto_2030242 ) ) ( not ( = ?auto_2030235 ?auto_2030236 ) ) ( not ( = ?auto_2030235 ?auto_2030238 ) ) ( not ( = ?auto_2030235 ?auto_2030237 ) ) ( not ( = ?auto_2030235 ?auto_2030239 ) ) ( not ( = ?auto_2030235 ?auto_2030240 ) ) ( not ( = ?auto_2030235 ?auto_2030241 ) ) ( not ( = ?auto_2030235 ?auto_2030242 ) ) ( not ( = ?auto_2030236 ?auto_2030238 ) ) ( not ( = ?auto_2030236 ?auto_2030237 ) ) ( not ( = ?auto_2030236 ?auto_2030239 ) ) ( not ( = ?auto_2030236 ?auto_2030240 ) ) ( not ( = ?auto_2030236 ?auto_2030241 ) ) ( not ( = ?auto_2030236 ?auto_2030242 ) ) ( not ( = ?auto_2030238 ?auto_2030237 ) ) ( not ( = ?auto_2030238 ?auto_2030239 ) ) ( not ( = ?auto_2030238 ?auto_2030240 ) ) ( not ( = ?auto_2030238 ?auto_2030241 ) ) ( not ( = ?auto_2030238 ?auto_2030242 ) ) ( not ( = ?auto_2030237 ?auto_2030239 ) ) ( not ( = ?auto_2030237 ?auto_2030240 ) ) ( not ( = ?auto_2030237 ?auto_2030241 ) ) ( not ( = ?auto_2030237 ?auto_2030242 ) ) ( not ( = ?auto_2030239 ?auto_2030240 ) ) ( not ( = ?auto_2030239 ?auto_2030241 ) ) ( not ( = ?auto_2030239 ?auto_2030242 ) ) ( not ( = ?auto_2030240 ?auto_2030241 ) ) ( not ( = ?auto_2030240 ?auto_2030242 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2030241 ?auto_2030242 )
      ( MAKE-8CRATE-VERIFY ?auto_2030234 ?auto_2030235 ?auto_2030236 ?auto_2030238 ?auto_2030237 ?auto_2030239 ?auto_2030240 ?auto_2030241 ?auto_2030242 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030301 - SURFACE
      ?auto_2030302 - SURFACE
      ?auto_2030303 - SURFACE
      ?auto_2030305 - SURFACE
      ?auto_2030304 - SURFACE
      ?auto_2030306 - SURFACE
      ?auto_2030307 - SURFACE
      ?auto_2030308 - SURFACE
      ?auto_2030309 - SURFACE
    )
    :vars
    (
      ?auto_2030311 - HOIST
      ?auto_2030312 - PLACE
      ?auto_2030310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030311 ?auto_2030312 ) ( SURFACE-AT ?auto_2030308 ?auto_2030312 ) ( CLEAR ?auto_2030308 ) ( IS-CRATE ?auto_2030309 ) ( not ( = ?auto_2030308 ?auto_2030309 ) ) ( TRUCK-AT ?auto_2030310 ?auto_2030312 ) ( AVAILABLE ?auto_2030311 ) ( IN ?auto_2030309 ?auto_2030310 ) ( ON ?auto_2030308 ?auto_2030307 ) ( not ( = ?auto_2030307 ?auto_2030308 ) ) ( not ( = ?auto_2030307 ?auto_2030309 ) ) ( ON ?auto_2030302 ?auto_2030301 ) ( ON ?auto_2030303 ?auto_2030302 ) ( ON ?auto_2030305 ?auto_2030303 ) ( ON ?auto_2030304 ?auto_2030305 ) ( ON ?auto_2030306 ?auto_2030304 ) ( ON ?auto_2030307 ?auto_2030306 ) ( not ( = ?auto_2030301 ?auto_2030302 ) ) ( not ( = ?auto_2030301 ?auto_2030303 ) ) ( not ( = ?auto_2030301 ?auto_2030305 ) ) ( not ( = ?auto_2030301 ?auto_2030304 ) ) ( not ( = ?auto_2030301 ?auto_2030306 ) ) ( not ( = ?auto_2030301 ?auto_2030307 ) ) ( not ( = ?auto_2030301 ?auto_2030308 ) ) ( not ( = ?auto_2030301 ?auto_2030309 ) ) ( not ( = ?auto_2030302 ?auto_2030303 ) ) ( not ( = ?auto_2030302 ?auto_2030305 ) ) ( not ( = ?auto_2030302 ?auto_2030304 ) ) ( not ( = ?auto_2030302 ?auto_2030306 ) ) ( not ( = ?auto_2030302 ?auto_2030307 ) ) ( not ( = ?auto_2030302 ?auto_2030308 ) ) ( not ( = ?auto_2030302 ?auto_2030309 ) ) ( not ( = ?auto_2030303 ?auto_2030305 ) ) ( not ( = ?auto_2030303 ?auto_2030304 ) ) ( not ( = ?auto_2030303 ?auto_2030306 ) ) ( not ( = ?auto_2030303 ?auto_2030307 ) ) ( not ( = ?auto_2030303 ?auto_2030308 ) ) ( not ( = ?auto_2030303 ?auto_2030309 ) ) ( not ( = ?auto_2030305 ?auto_2030304 ) ) ( not ( = ?auto_2030305 ?auto_2030306 ) ) ( not ( = ?auto_2030305 ?auto_2030307 ) ) ( not ( = ?auto_2030305 ?auto_2030308 ) ) ( not ( = ?auto_2030305 ?auto_2030309 ) ) ( not ( = ?auto_2030304 ?auto_2030306 ) ) ( not ( = ?auto_2030304 ?auto_2030307 ) ) ( not ( = ?auto_2030304 ?auto_2030308 ) ) ( not ( = ?auto_2030304 ?auto_2030309 ) ) ( not ( = ?auto_2030306 ?auto_2030307 ) ) ( not ( = ?auto_2030306 ?auto_2030308 ) ) ( not ( = ?auto_2030306 ?auto_2030309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030307 ?auto_2030308 ?auto_2030309 )
      ( MAKE-8CRATE-VERIFY ?auto_2030301 ?auto_2030302 ?auto_2030303 ?auto_2030305 ?auto_2030304 ?auto_2030306 ?auto_2030307 ?auto_2030308 ?auto_2030309 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030377 - SURFACE
      ?auto_2030378 - SURFACE
      ?auto_2030379 - SURFACE
      ?auto_2030381 - SURFACE
      ?auto_2030380 - SURFACE
      ?auto_2030382 - SURFACE
      ?auto_2030383 - SURFACE
      ?auto_2030384 - SURFACE
      ?auto_2030385 - SURFACE
    )
    :vars
    (
      ?auto_2030387 - HOIST
      ?auto_2030388 - PLACE
      ?auto_2030386 - TRUCK
      ?auto_2030389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030387 ?auto_2030388 ) ( SURFACE-AT ?auto_2030384 ?auto_2030388 ) ( CLEAR ?auto_2030384 ) ( IS-CRATE ?auto_2030385 ) ( not ( = ?auto_2030384 ?auto_2030385 ) ) ( AVAILABLE ?auto_2030387 ) ( IN ?auto_2030385 ?auto_2030386 ) ( ON ?auto_2030384 ?auto_2030383 ) ( not ( = ?auto_2030383 ?auto_2030384 ) ) ( not ( = ?auto_2030383 ?auto_2030385 ) ) ( TRUCK-AT ?auto_2030386 ?auto_2030389 ) ( not ( = ?auto_2030389 ?auto_2030388 ) ) ( ON ?auto_2030378 ?auto_2030377 ) ( ON ?auto_2030379 ?auto_2030378 ) ( ON ?auto_2030381 ?auto_2030379 ) ( ON ?auto_2030380 ?auto_2030381 ) ( ON ?auto_2030382 ?auto_2030380 ) ( ON ?auto_2030383 ?auto_2030382 ) ( not ( = ?auto_2030377 ?auto_2030378 ) ) ( not ( = ?auto_2030377 ?auto_2030379 ) ) ( not ( = ?auto_2030377 ?auto_2030381 ) ) ( not ( = ?auto_2030377 ?auto_2030380 ) ) ( not ( = ?auto_2030377 ?auto_2030382 ) ) ( not ( = ?auto_2030377 ?auto_2030383 ) ) ( not ( = ?auto_2030377 ?auto_2030384 ) ) ( not ( = ?auto_2030377 ?auto_2030385 ) ) ( not ( = ?auto_2030378 ?auto_2030379 ) ) ( not ( = ?auto_2030378 ?auto_2030381 ) ) ( not ( = ?auto_2030378 ?auto_2030380 ) ) ( not ( = ?auto_2030378 ?auto_2030382 ) ) ( not ( = ?auto_2030378 ?auto_2030383 ) ) ( not ( = ?auto_2030378 ?auto_2030384 ) ) ( not ( = ?auto_2030378 ?auto_2030385 ) ) ( not ( = ?auto_2030379 ?auto_2030381 ) ) ( not ( = ?auto_2030379 ?auto_2030380 ) ) ( not ( = ?auto_2030379 ?auto_2030382 ) ) ( not ( = ?auto_2030379 ?auto_2030383 ) ) ( not ( = ?auto_2030379 ?auto_2030384 ) ) ( not ( = ?auto_2030379 ?auto_2030385 ) ) ( not ( = ?auto_2030381 ?auto_2030380 ) ) ( not ( = ?auto_2030381 ?auto_2030382 ) ) ( not ( = ?auto_2030381 ?auto_2030383 ) ) ( not ( = ?auto_2030381 ?auto_2030384 ) ) ( not ( = ?auto_2030381 ?auto_2030385 ) ) ( not ( = ?auto_2030380 ?auto_2030382 ) ) ( not ( = ?auto_2030380 ?auto_2030383 ) ) ( not ( = ?auto_2030380 ?auto_2030384 ) ) ( not ( = ?auto_2030380 ?auto_2030385 ) ) ( not ( = ?auto_2030382 ?auto_2030383 ) ) ( not ( = ?auto_2030382 ?auto_2030384 ) ) ( not ( = ?auto_2030382 ?auto_2030385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030383 ?auto_2030384 ?auto_2030385 )
      ( MAKE-8CRATE-VERIFY ?auto_2030377 ?auto_2030378 ?auto_2030379 ?auto_2030381 ?auto_2030380 ?auto_2030382 ?auto_2030383 ?auto_2030384 ?auto_2030385 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030461 - SURFACE
      ?auto_2030462 - SURFACE
      ?auto_2030463 - SURFACE
      ?auto_2030465 - SURFACE
      ?auto_2030464 - SURFACE
      ?auto_2030466 - SURFACE
      ?auto_2030467 - SURFACE
      ?auto_2030468 - SURFACE
      ?auto_2030469 - SURFACE
    )
    :vars
    (
      ?auto_2030474 - HOIST
      ?auto_2030470 - PLACE
      ?auto_2030472 - TRUCK
      ?auto_2030471 - PLACE
      ?auto_2030473 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030474 ?auto_2030470 ) ( SURFACE-AT ?auto_2030468 ?auto_2030470 ) ( CLEAR ?auto_2030468 ) ( IS-CRATE ?auto_2030469 ) ( not ( = ?auto_2030468 ?auto_2030469 ) ) ( AVAILABLE ?auto_2030474 ) ( ON ?auto_2030468 ?auto_2030467 ) ( not ( = ?auto_2030467 ?auto_2030468 ) ) ( not ( = ?auto_2030467 ?auto_2030469 ) ) ( TRUCK-AT ?auto_2030472 ?auto_2030471 ) ( not ( = ?auto_2030471 ?auto_2030470 ) ) ( HOIST-AT ?auto_2030473 ?auto_2030471 ) ( LIFTING ?auto_2030473 ?auto_2030469 ) ( not ( = ?auto_2030474 ?auto_2030473 ) ) ( ON ?auto_2030462 ?auto_2030461 ) ( ON ?auto_2030463 ?auto_2030462 ) ( ON ?auto_2030465 ?auto_2030463 ) ( ON ?auto_2030464 ?auto_2030465 ) ( ON ?auto_2030466 ?auto_2030464 ) ( ON ?auto_2030467 ?auto_2030466 ) ( not ( = ?auto_2030461 ?auto_2030462 ) ) ( not ( = ?auto_2030461 ?auto_2030463 ) ) ( not ( = ?auto_2030461 ?auto_2030465 ) ) ( not ( = ?auto_2030461 ?auto_2030464 ) ) ( not ( = ?auto_2030461 ?auto_2030466 ) ) ( not ( = ?auto_2030461 ?auto_2030467 ) ) ( not ( = ?auto_2030461 ?auto_2030468 ) ) ( not ( = ?auto_2030461 ?auto_2030469 ) ) ( not ( = ?auto_2030462 ?auto_2030463 ) ) ( not ( = ?auto_2030462 ?auto_2030465 ) ) ( not ( = ?auto_2030462 ?auto_2030464 ) ) ( not ( = ?auto_2030462 ?auto_2030466 ) ) ( not ( = ?auto_2030462 ?auto_2030467 ) ) ( not ( = ?auto_2030462 ?auto_2030468 ) ) ( not ( = ?auto_2030462 ?auto_2030469 ) ) ( not ( = ?auto_2030463 ?auto_2030465 ) ) ( not ( = ?auto_2030463 ?auto_2030464 ) ) ( not ( = ?auto_2030463 ?auto_2030466 ) ) ( not ( = ?auto_2030463 ?auto_2030467 ) ) ( not ( = ?auto_2030463 ?auto_2030468 ) ) ( not ( = ?auto_2030463 ?auto_2030469 ) ) ( not ( = ?auto_2030465 ?auto_2030464 ) ) ( not ( = ?auto_2030465 ?auto_2030466 ) ) ( not ( = ?auto_2030465 ?auto_2030467 ) ) ( not ( = ?auto_2030465 ?auto_2030468 ) ) ( not ( = ?auto_2030465 ?auto_2030469 ) ) ( not ( = ?auto_2030464 ?auto_2030466 ) ) ( not ( = ?auto_2030464 ?auto_2030467 ) ) ( not ( = ?auto_2030464 ?auto_2030468 ) ) ( not ( = ?auto_2030464 ?auto_2030469 ) ) ( not ( = ?auto_2030466 ?auto_2030467 ) ) ( not ( = ?auto_2030466 ?auto_2030468 ) ) ( not ( = ?auto_2030466 ?auto_2030469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030467 ?auto_2030468 ?auto_2030469 )
      ( MAKE-8CRATE-VERIFY ?auto_2030461 ?auto_2030462 ?auto_2030463 ?auto_2030465 ?auto_2030464 ?auto_2030466 ?auto_2030467 ?auto_2030468 ?auto_2030469 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030553 - SURFACE
      ?auto_2030554 - SURFACE
      ?auto_2030555 - SURFACE
      ?auto_2030557 - SURFACE
      ?auto_2030556 - SURFACE
      ?auto_2030558 - SURFACE
      ?auto_2030559 - SURFACE
      ?auto_2030560 - SURFACE
      ?auto_2030561 - SURFACE
    )
    :vars
    (
      ?auto_2030567 - HOIST
      ?auto_2030566 - PLACE
      ?auto_2030565 - TRUCK
      ?auto_2030563 - PLACE
      ?auto_2030564 - HOIST
      ?auto_2030562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030567 ?auto_2030566 ) ( SURFACE-AT ?auto_2030560 ?auto_2030566 ) ( CLEAR ?auto_2030560 ) ( IS-CRATE ?auto_2030561 ) ( not ( = ?auto_2030560 ?auto_2030561 ) ) ( AVAILABLE ?auto_2030567 ) ( ON ?auto_2030560 ?auto_2030559 ) ( not ( = ?auto_2030559 ?auto_2030560 ) ) ( not ( = ?auto_2030559 ?auto_2030561 ) ) ( TRUCK-AT ?auto_2030565 ?auto_2030563 ) ( not ( = ?auto_2030563 ?auto_2030566 ) ) ( HOIST-AT ?auto_2030564 ?auto_2030563 ) ( not ( = ?auto_2030567 ?auto_2030564 ) ) ( AVAILABLE ?auto_2030564 ) ( SURFACE-AT ?auto_2030561 ?auto_2030563 ) ( ON ?auto_2030561 ?auto_2030562 ) ( CLEAR ?auto_2030561 ) ( not ( = ?auto_2030560 ?auto_2030562 ) ) ( not ( = ?auto_2030561 ?auto_2030562 ) ) ( not ( = ?auto_2030559 ?auto_2030562 ) ) ( ON ?auto_2030554 ?auto_2030553 ) ( ON ?auto_2030555 ?auto_2030554 ) ( ON ?auto_2030557 ?auto_2030555 ) ( ON ?auto_2030556 ?auto_2030557 ) ( ON ?auto_2030558 ?auto_2030556 ) ( ON ?auto_2030559 ?auto_2030558 ) ( not ( = ?auto_2030553 ?auto_2030554 ) ) ( not ( = ?auto_2030553 ?auto_2030555 ) ) ( not ( = ?auto_2030553 ?auto_2030557 ) ) ( not ( = ?auto_2030553 ?auto_2030556 ) ) ( not ( = ?auto_2030553 ?auto_2030558 ) ) ( not ( = ?auto_2030553 ?auto_2030559 ) ) ( not ( = ?auto_2030553 ?auto_2030560 ) ) ( not ( = ?auto_2030553 ?auto_2030561 ) ) ( not ( = ?auto_2030553 ?auto_2030562 ) ) ( not ( = ?auto_2030554 ?auto_2030555 ) ) ( not ( = ?auto_2030554 ?auto_2030557 ) ) ( not ( = ?auto_2030554 ?auto_2030556 ) ) ( not ( = ?auto_2030554 ?auto_2030558 ) ) ( not ( = ?auto_2030554 ?auto_2030559 ) ) ( not ( = ?auto_2030554 ?auto_2030560 ) ) ( not ( = ?auto_2030554 ?auto_2030561 ) ) ( not ( = ?auto_2030554 ?auto_2030562 ) ) ( not ( = ?auto_2030555 ?auto_2030557 ) ) ( not ( = ?auto_2030555 ?auto_2030556 ) ) ( not ( = ?auto_2030555 ?auto_2030558 ) ) ( not ( = ?auto_2030555 ?auto_2030559 ) ) ( not ( = ?auto_2030555 ?auto_2030560 ) ) ( not ( = ?auto_2030555 ?auto_2030561 ) ) ( not ( = ?auto_2030555 ?auto_2030562 ) ) ( not ( = ?auto_2030557 ?auto_2030556 ) ) ( not ( = ?auto_2030557 ?auto_2030558 ) ) ( not ( = ?auto_2030557 ?auto_2030559 ) ) ( not ( = ?auto_2030557 ?auto_2030560 ) ) ( not ( = ?auto_2030557 ?auto_2030561 ) ) ( not ( = ?auto_2030557 ?auto_2030562 ) ) ( not ( = ?auto_2030556 ?auto_2030558 ) ) ( not ( = ?auto_2030556 ?auto_2030559 ) ) ( not ( = ?auto_2030556 ?auto_2030560 ) ) ( not ( = ?auto_2030556 ?auto_2030561 ) ) ( not ( = ?auto_2030556 ?auto_2030562 ) ) ( not ( = ?auto_2030558 ?auto_2030559 ) ) ( not ( = ?auto_2030558 ?auto_2030560 ) ) ( not ( = ?auto_2030558 ?auto_2030561 ) ) ( not ( = ?auto_2030558 ?auto_2030562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030559 ?auto_2030560 ?auto_2030561 )
      ( MAKE-8CRATE-VERIFY ?auto_2030553 ?auto_2030554 ?auto_2030555 ?auto_2030557 ?auto_2030556 ?auto_2030558 ?auto_2030559 ?auto_2030560 ?auto_2030561 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030646 - SURFACE
      ?auto_2030647 - SURFACE
      ?auto_2030648 - SURFACE
      ?auto_2030650 - SURFACE
      ?auto_2030649 - SURFACE
      ?auto_2030651 - SURFACE
      ?auto_2030652 - SURFACE
      ?auto_2030653 - SURFACE
      ?auto_2030654 - SURFACE
    )
    :vars
    (
      ?auto_2030659 - HOIST
      ?auto_2030655 - PLACE
      ?auto_2030656 - PLACE
      ?auto_2030658 - HOIST
      ?auto_2030657 - SURFACE
      ?auto_2030660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030659 ?auto_2030655 ) ( SURFACE-AT ?auto_2030653 ?auto_2030655 ) ( CLEAR ?auto_2030653 ) ( IS-CRATE ?auto_2030654 ) ( not ( = ?auto_2030653 ?auto_2030654 ) ) ( AVAILABLE ?auto_2030659 ) ( ON ?auto_2030653 ?auto_2030652 ) ( not ( = ?auto_2030652 ?auto_2030653 ) ) ( not ( = ?auto_2030652 ?auto_2030654 ) ) ( not ( = ?auto_2030656 ?auto_2030655 ) ) ( HOIST-AT ?auto_2030658 ?auto_2030656 ) ( not ( = ?auto_2030659 ?auto_2030658 ) ) ( AVAILABLE ?auto_2030658 ) ( SURFACE-AT ?auto_2030654 ?auto_2030656 ) ( ON ?auto_2030654 ?auto_2030657 ) ( CLEAR ?auto_2030654 ) ( not ( = ?auto_2030653 ?auto_2030657 ) ) ( not ( = ?auto_2030654 ?auto_2030657 ) ) ( not ( = ?auto_2030652 ?auto_2030657 ) ) ( TRUCK-AT ?auto_2030660 ?auto_2030655 ) ( ON ?auto_2030647 ?auto_2030646 ) ( ON ?auto_2030648 ?auto_2030647 ) ( ON ?auto_2030650 ?auto_2030648 ) ( ON ?auto_2030649 ?auto_2030650 ) ( ON ?auto_2030651 ?auto_2030649 ) ( ON ?auto_2030652 ?auto_2030651 ) ( not ( = ?auto_2030646 ?auto_2030647 ) ) ( not ( = ?auto_2030646 ?auto_2030648 ) ) ( not ( = ?auto_2030646 ?auto_2030650 ) ) ( not ( = ?auto_2030646 ?auto_2030649 ) ) ( not ( = ?auto_2030646 ?auto_2030651 ) ) ( not ( = ?auto_2030646 ?auto_2030652 ) ) ( not ( = ?auto_2030646 ?auto_2030653 ) ) ( not ( = ?auto_2030646 ?auto_2030654 ) ) ( not ( = ?auto_2030646 ?auto_2030657 ) ) ( not ( = ?auto_2030647 ?auto_2030648 ) ) ( not ( = ?auto_2030647 ?auto_2030650 ) ) ( not ( = ?auto_2030647 ?auto_2030649 ) ) ( not ( = ?auto_2030647 ?auto_2030651 ) ) ( not ( = ?auto_2030647 ?auto_2030652 ) ) ( not ( = ?auto_2030647 ?auto_2030653 ) ) ( not ( = ?auto_2030647 ?auto_2030654 ) ) ( not ( = ?auto_2030647 ?auto_2030657 ) ) ( not ( = ?auto_2030648 ?auto_2030650 ) ) ( not ( = ?auto_2030648 ?auto_2030649 ) ) ( not ( = ?auto_2030648 ?auto_2030651 ) ) ( not ( = ?auto_2030648 ?auto_2030652 ) ) ( not ( = ?auto_2030648 ?auto_2030653 ) ) ( not ( = ?auto_2030648 ?auto_2030654 ) ) ( not ( = ?auto_2030648 ?auto_2030657 ) ) ( not ( = ?auto_2030650 ?auto_2030649 ) ) ( not ( = ?auto_2030650 ?auto_2030651 ) ) ( not ( = ?auto_2030650 ?auto_2030652 ) ) ( not ( = ?auto_2030650 ?auto_2030653 ) ) ( not ( = ?auto_2030650 ?auto_2030654 ) ) ( not ( = ?auto_2030650 ?auto_2030657 ) ) ( not ( = ?auto_2030649 ?auto_2030651 ) ) ( not ( = ?auto_2030649 ?auto_2030652 ) ) ( not ( = ?auto_2030649 ?auto_2030653 ) ) ( not ( = ?auto_2030649 ?auto_2030654 ) ) ( not ( = ?auto_2030649 ?auto_2030657 ) ) ( not ( = ?auto_2030651 ?auto_2030652 ) ) ( not ( = ?auto_2030651 ?auto_2030653 ) ) ( not ( = ?auto_2030651 ?auto_2030654 ) ) ( not ( = ?auto_2030651 ?auto_2030657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030652 ?auto_2030653 ?auto_2030654 )
      ( MAKE-8CRATE-VERIFY ?auto_2030646 ?auto_2030647 ?auto_2030648 ?auto_2030650 ?auto_2030649 ?auto_2030651 ?auto_2030652 ?auto_2030653 ?auto_2030654 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030739 - SURFACE
      ?auto_2030740 - SURFACE
      ?auto_2030741 - SURFACE
      ?auto_2030743 - SURFACE
      ?auto_2030742 - SURFACE
      ?auto_2030744 - SURFACE
      ?auto_2030745 - SURFACE
      ?auto_2030746 - SURFACE
      ?auto_2030747 - SURFACE
    )
    :vars
    (
      ?auto_2030752 - HOIST
      ?auto_2030748 - PLACE
      ?auto_2030749 - PLACE
      ?auto_2030753 - HOIST
      ?auto_2030750 - SURFACE
      ?auto_2030751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030752 ?auto_2030748 ) ( IS-CRATE ?auto_2030747 ) ( not ( = ?auto_2030746 ?auto_2030747 ) ) ( not ( = ?auto_2030745 ?auto_2030746 ) ) ( not ( = ?auto_2030745 ?auto_2030747 ) ) ( not ( = ?auto_2030749 ?auto_2030748 ) ) ( HOIST-AT ?auto_2030753 ?auto_2030749 ) ( not ( = ?auto_2030752 ?auto_2030753 ) ) ( AVAILABLE ?auto_2030753 ) ( SURFACE-AT ?auto_2030747 ?auto_2030749 ) ( ON ?auto_2030747 ?auto_2030750 ) ( CLEAR ?auto_2030747 ) ( not ( = ?auto_2030746 ?auto_2030750 ) ) ( not ( = ?auto_2030747 ?auto_2030750 ) ) ( not ( = ?auto_2030745 ?auto_2030750 ) ) ( TRUCK-AT ?auto_2030751 ?auto_2030748 ) ( SURFACE-AT ?auto_2030745 ?auto_2030748 ) ( CLEAR ?auto_2030745 ) ( LIFTING ?auto_2030752 ?auto_2030746 ) ( IS-CRATE ?auto_2030746 ) ( ON ?auto_2030740 ?auto_2030739 ) ( ON ?auto_2030741 ?auto_2030740 ) ( ON ?auto_2030743 ?auto_2030741 ) ( ON ?auto_2030742 ?auto_2030743 ) ( ON ?auto_2030744 ?auto_2030742 ) ( ON ?auto_2030745 ?auto_2030744 ) ( not ( = ?auto_2030739 ?auto_2030740 ) ) ( not ( = ?auto_2030739 ?auto_2030741 ) ) ( not ( = ?auto_2030739 ?auto_2030743 ) ) ( not ( = ?auto_2030739 ?auto_2030742 ) ) ( not ( = ?auto_2030739 ?auto_2030744 ) ) ( not ( = ?auto_2030739 ?auto_2030745 ) ) ( not ( = ?auto_2030739 ?auto_2030746 ) ) ( not ( = ?auto_2030739 ?auto_2030747 ) ) ( not ( = ?auto_2030739 ?auto_2030750 ) ) ( not ( = ?auto_2030740 ?auto_2030741 ) ) ( not ( = ?auto_2030740 ?auto_2030743 ) ) ( not ( = ?auto_2030740 ?auto_2030742 ) ) ( not ( = ?auto_2030740 ?auto_2030744 ) ) ( not ( = ?auto_2030740 ?auto_2030745 ) ) ( not ( = ?auto_2030740 ?auto_2030746 ) ) ( not ( = ?auto_2030740 ?auto_2030747 ) ) ( not ( = ?auto_2030740 ?auto_2030750 ) ) ( not ( = ?auto_2030741 ?auto_2030743 ) ) ( not ( = ?auto_2030741 ?auto_2030742 ) ) ( not ( = ?auto_2030741 ?auto_2030744 ) ) ( not ( = ?auto_2030741 ?auto_2030745 ) ) ( not ( = ?auto_2030741 ?auto_2030746 ) ) ( not ( = ?auto_2030741 ?auto_2030747 ) ) ( not ( = ?auto_2030741 ?auto_2030750 ) ) ( not ( = ?auto_2030743 ?auto_2030742 ) ) ( not ( = ?auto_2030743 ?auto_2030744 ) ) ( not ( = ?auto_2030743 ?auto_2030745 ) ) ( not ( = ?auto_2030743 ?auto_2030746 ) ) ( not ( = ?auto_2030743 ?auto_2030747 ) ) ( not ( = ?auto_2030743 ?auto_2030750 ) ) ( not ( = ?auto_2030742 ?auto_2030744 ) ) ( not ( = ?auto_2030742 ?auto_2030745 ) ) ( not ( = ?auto_2030742 ?auto_2030746 ) ) ( not ( = ?auto_2030742 ?auto_2030747 ) ) ( not ( = ?auto_2030742 ?auto_2030750 ) ) ( not ( = ?auto_2030744 ?auto_2030745 ) ) ( not ( = ?auto_2030744 ?auto_2030746 ) ) ( not ( = ?auto_2030744 ?auto_2030747 ) ) ( not ( = ?auto_2030744 ?auto_2030750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030745 ?auto_2030746 ?auto_2030747 )
      ( MAKE-8CRATE-VERIFY ?auto_2030739 ?auto_2030740 ?auto_2030741 ?auto_2030743 ?auto_2030742 ?auto_2030744 ?auto_2030745 ?auto_2030746 ?auto_2030747 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030832 - SURFACE
      ?auto_2030833 - SURFACE
      ?auto_2030834 - SURFACE
      ?auto_2030836 - SURFACE
      ?auto_2030835 - SURFACE
      ?auto_2030837 - SURFACE
      ?auto_2030838 - SURFACE
      ?auto_2030839 - SURFACE
      ?auto_2030840 - SURFACE
    )
    :vars
    (
      ?auto_2030844 - HOIST
      ?auto_2030846 - PLACE
      ?auto_2030841 - PLACE
      ?auto_2030843 - HOIST
      ?auto_2030845 - SURFACE
      ?auto_2030842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030844 ?auto_2030846 ) ( IS-CRATE ?auto_2030840 ) ( not ( = ?auto_2030839 ?auto_2030840 ) ) ( not ( = ?auto_2030838 ?auto_2030839 ) ) ( not ( = ?auto_2030838 ?auto_2030840 ) ) ( not ( = ?auto_2030841 ?auto_2030846 ) ) ( HOIST-AT ?auto_2030843 ?auto_2030841 ) ( not ( = ?auto_2030844 ?auto_2030843 ) ) ( AVAILABLE ?auto_2030843 ) ( SURFACE-AT ?auto_2030840 ?auto_2030841 ) ( ON ?auto_2030840 ?auto_2030845 ) ( CLEAR ?auto_2030840 ) ( not ( = ?auto_2030839 ?auto_2030845 ) ) ( not ( = ?auto_2030840 ?auto_2030845 ) ) ( not ( = ?auto_2030838 ?auto_2030845 ) ) ( TRUCK-AT ?auto_2030842 ?auto_2030846 ) ( SURFACE-AT ?auto_2030838 ?auto_2030846 ) ( CLEAR ?auto_2030838 ) ( IS-CRATE ?auto_2030839 ) ( AVAILABLE ?auto_2030844 ) ( IN ?auto_2030839 ?auto_2030842 ) ( ON ?auto_2030833 ?auto_2030832 ) ( ON ?auto_2030834 ?auto_2030833 ) ( ON ?auto_2030836 ?auto_2030834 ) ( ON ?auto_2030835 ?auto_2030836 ) ( ON ?auto_2030837 ?auto_2030835 ) ( ON ?auto_2030838 ?auto_2030837 ) ( not ( = ?auto_2030832 ?auto_2030833 ) ) ( not ( = ?auto_2030832 ?auto_2030834 ) ) ( not ( = ?auto_2030832 ?auto_2030836 ) ) ( not ( = ?auto_2030832 ?auto_2030835 ) ) ( not ( = ?auto_2030832 ?auto_2030837 ) ) ( not ( = ?auto_2030832 ?auto_2030838 ) ) ( not ( = ?auto_2030832 ?auto_2030839 ) ) ( not ( = ?auto_2030832 ?auto_2030840 ) ) ( not ( = ?auto_2030832 ?auto_2030845 ) ) ( not ( = ?auto_2030833 ?auto_2030834 ) ) ( not ( = ?auto_2030833 ?auto_2030836 ) ) ( not ( = ?auto_2030833 ?auto_2030835 ) ) ( not ( = ?auto_2030833 ?auto_2030837 ) ) ( not ( = ?auto_2030833 ?auto_2030838 ) ) ( not ( = ?auto_2030833 ?auto_2030839 ) ) ( not ( = ?auto_2030833 ?auto_2030840 ) ) ( not ( = ?auto_2030833 ?auto_2030845 ) ) ( not ( = ?auto_2030834 ?auto_2030836 ) ) ( not ( = ?auto_2030834 ?auto_2030835 ) ) ( not ( = ?auto_2030834 ?auto_2030837 ) ) ( not ( = ?auto_2030834 ?auto_2030838 ) ) ( not ( = ?auto_2030834 ?auto_2030839 ) ) ( not ( = ?auto_2030834 ?auto_2030840 ) ) ( not ( = ?auto_2030834 ?auto_2030845 ) ) ( not ( = ?auto_2030836 ?auto_2030835 ) ) ( not ( = ?auto_2030836 ?auto_2030837 ) ) ( not ( = ?auto_2030836 ?auto_2030838 ) ) ( not ( = ?auto_2030836 ?auto_2030839 ) ) ( not ( = ?auto_2030836 ?auto_2030840 ) ) ( not ( = ?auto_2030836 ?auto_2030845 ) ) ( not ( = ?auto_2030835 ?auto_2030837 ) ) ( not ( = ?auto_2030835 ?auto_2030838 ) ) ( not ( = ?auto_2030835 ?auto_2030839 ) ) ( not ( = ?auto_2030835 ?auto_2030840 ) ) ( not ( = ?auto_2030835 ?auto_2030845 ) ) ( not ( = ?auto_2030837 ?auto_2030838 ) ) ( not ( = ?auto_2030837 ?auto_2030839 ) ) ( not ( = ?auto_2030837 ?auto_2030840 ) ) ( not ( = ?auto_2030837 ?auto_2030845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030838 ?auto_2030839 ?auto_2030840 )
      ( MAKE-8CRATE-VERIFY ?auto_2030832 ?auto_2030833 ?auto_2030834 ?auto_2030836 ?auto_2030835 ?auto_2030837 ?auto_2030838 ?auto_2030839 ?auto_2030840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2033327 - SURFACE
      ?auto_2033328 - SURFACE
    )
    :vars
    (
      ?auto_2033329 - HOIST
      ?auto_2033332 - PLACE
      ?auto_2033333 - SURFACE
      ?auto_2033331 - PLACE
      ?auto_2033335 - HOIST
      ?auto_2033330 - SURFACE
      ?auto_2033334 - TRUCK
      ?auto_2033336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2033329 ?auto_2033332 ) ( SURFACE-AT ?auto_2033327 ?auto_2033332 ) ( CLEAR ?auto_2033327 ) ( IS-CRATE ?auto_2033328 ) ( not ( = ?auto_2033327 ?auto_2033328 ) ) ( ON ?auto_2033327 ?auto_2033333 ) ( not ( = ?auto_2033333 ?auto_2033327 ) ) ( not ( = ?auto_2033333 ?auto_2033328 ) ) ( not ( = ?auto_2033331 ?auto_2033332 ) ) ( HOIST-AT ?auto_2033335 ?auto_2033331 ) ( not ( = ?auto_2033329 ?auto_2033335 ) ) ( AVAILABLE ?auto_2033335 ) ( SURFACE-AT ?auto_2033328 ?auto_2033331 ) ( ON ?auto_2033328 ?auto_2033330 ) ( CLEAR ?auto_2033328 ) ( not ( = ?auto_2033327 ?auto_2033330 ) ) ( not ( = ?auto_2033328 ?auto_2033330 ) ) ( not ( = ?auto_2033333 ?auto_2033330 ) ) ( TRUCK-AT ?auto_2033334 ?auto_2033332 ) ( LIFTING ?auto_2033329 ?auto_2033336 ) ( IS-CRATE ?auto_2033336 ) ( not ( = ?auto_2033327 ?auto_2033336 ) ) ( not ( = ?auto_2033328 ?auto_2033336 ) ) ( not ( = ?auto_2033333 ?auto_2033336 ) ) ( not ( = ?auto_2033330 ?auto_2033336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2033329 ?auto_2033336 ?auto_2033334 ?auto_2033332 )
      ( MAKE-1CRATE ?auto_2033327 ?auto_2033328 )
      ( MAKE-1CRATE-VERIFY ?auto_2033327 ?auto_2033328 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2034922 - SURFACE
      ?auto_2034923 - SURFACE
      ?auto_2034924 - SURFACE
      ?auto_2034926 - SURFACE
      ?auto_2034925 - SURFACE
      ?auto_2034927 - SURFACE
      ?auto_2034928 - SURFACE
      ?auto_2034929 - SURFACE
      ?auto_2034930 - SURFACE
      ?auto_2034931 - SURFACE
    )
    :vars
    (
      ?auto_2034933 - HOIST
      ?auto_2034932 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2034933 ?auto_2034932 ) ( SURFACE-AT ?auto_2034930 ?auto_2034932 ) ( CLEAR ?auto_2034930 ) ( LIFTING ?auto_2034933 ?auto_2034931 ) ( IS-CRATE ?auto_2034931 ) ( not ( = ?auto_2034930 ?auto_2034931 ) ) ( ON ?auto_2034923 ?auto_2034922 ) ( ON ?auto_2034924 ?auto_2034923 ) ( ON ?auto_2034926 ?auto_2034924 ) ( ON ?auto_2034925 ?auto_2034926 ) ( ON ?auto_2034927 ?auto_2034925 ) ( ON ?auto_2034928 ?auto_2034927 ) ( ON ?auto_2034929 ?auto_2034928 ) ( ON ?auto_2034930 ?auto_2034929 ) ( not ( = ?auto_2034922 ?auto_2034923 ) ) ( not ( = ?auto_2034922 ?auto_2034924 ) ) ( not ( = ?auto_2034922 ?auto_2034926 ) ) ( not ( = ?auto_2034922 ?auto_2034925 ) ) ( not ( = ?auto_2034922 ?auto_2034927 ) ) ( not ( = ?auto_2034922 ?auto_2034928 ) ) ( not ( = ?auto_2034922 ?auto_2034929 ) ) ( not ( = ?auto_2034922 ?auto_2034930 ) ) ( not ( = ?auto_2034922 ?auto_2034931 ) ) ( not ( = ?auto_2034923 ?auto_2034924 ) ) ( not ( = ?auto_2034923 ?auto_2034926 ) ) ( not ( = ?auto_2034923 ?auto_2034925 ) ) ( not ( = ?auto_2034923 ?auto_2034927 ) ) ( not ( = ?auto_2034923 ?auto_2034928 ) ) ( not ( = ?auto_2034923 ?auto_2034929 ) ) ( not ( = ?auto_2034923 ?auto_2034930 ) ) ( not ( = ?auto_2034923 ?auto_2034931 ) ) ( not ( = ?auto_2034924 ?auto_2034926 ) ) ( not ( = ?auto_2034924 ?auto_2034925 ) ) ( not ( = ?auto_2034924 ?auto_2034927 ) ) ( not ( = ?auto_2034924 ?auto_2034928 ) ) ( not ( = ?auto_2034924 ?auto_2034929 ) ) ( not ( = ?auto_2034924 ?auto_2034930 ) ) ( not ( = ?auto_2034924 ?auto_2034931 ) ) ( not ( = ?auto_2034926 ?auto_2034925 ) ) ( not ( = ?auto_2034926 ?auto_2034927 ) ) ( not ( = ?auto_2034926 ?auto_2034928 ) ) ( not ( = ?auto_2034926 ?auto_2034929 ) ) ( not ( = ?auto_2034926 ?auto_2034930 ) ) ( not ( = ?auto_2034926 ?auto_2034931 ) ) ( not ( = ?auto_2034925 ?auto_2034927 ) ) ( not ( = ?auto_2034925 ?auto_2034928 ) ) ( not ( = ?auto_2034925 ?auto_2034929 ) ) ( not ( = ?auto_2034925 ?auto_2034930 ) ) ( not ( = ?auto_2034925 ?auto_2034931 ) ) ( not ( = ?auto_2034927 ?auto_2034928 ) ) ( not ( = ?auto_2034927 ?auto_2034929 ) ) ( not ( = ?auto_2034927 ?auto_2034930 ) ) ( not ( = ?auto_2034927 ?auto_2034931 ) ) ( not ( = ?auto_2034928 ?auto_2034929 ) ) ( not ( = ?auto_2034928 ?auto_2034930 ) ) ( not ( = ?auto_2034928 ?auto_2034931 ) ) ( not ( = ?auto_2034929 ?auto_2034930 ) ) ( not ( = ?auto_2034929 ?auto_2034931 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2034930 ?auto_2034931 )
      ( MAKE-9CRATE-VERIFY ?auto_2034922 ?auto_2034923 ?auto_2034924 ?auto_2034926 ?auto_2034925 ?auto_2034927 ?auto_2034928 ?auto_2034929 ?auto_2034930 ?auto_2034931 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035002 - SURFACE
      ?auto_2035003 - SURFACE
      ?auto_2035004 - SURFACE
      ?auto_2035006 - SURFACE
      ?auto_2035005 - SURFACE
      ?auto_2035007 - SURFACE
      ?auto_2035008 - SURFACE
      ?auto_2035009 - SURFACE
      ?auto_2035010 - SURFACE
      ?auto_2035011 - SURFACE
    )
    :vars
    (
      ?auto_2035013 - HOIST
      ?auto_2035014 - PLACE
      ?auto_2035012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035013 ?auto_2035014 ) ( SURFACE-AT ?auto_2035010 ?auto_2035014 ) ( CLEAR ?auto_2035010 ) ( IS-CRATE ?auto_2035011 ) ( not ( = ?auto_2035010 ?auto_2035011 ) ) ( TRUCK-AT ?auto_2035012 ?auto_2035014 ) ( AVAILABLE ?auto_2035013 ) ( IN ?auto_2035011 ?auto_2035012 ) ( ON ?auto_2035010 ?auto_2035009 ) ( not ( = ?auto_2035009 ?auto_2035010 ) ) ( not ( = ?auto_2035009 ?auto_2035011 ) ) ( ON ?auto_2035003 ?auto_2035002 ) ( ON ?auto_2035004 ?auto_2035003 ) ( ON ?auto_2035006 ?auto_2035004 ) ( ON ?auto_2035005 ?auto_2035006 ) ( ON ?auto_2035007 ?auto_2035005 ) ( ON ?auto_2035008 ?auto_2035007 ) ( ON ?auto_2035009 ?auto_2035008 ) ( not ( = ?auto_2035002 ?auto_2035003 ) ) ( not ( = ?auto_2035002 ?auto_2035004 ) ) ( not ( = ?auto_2035002 ?auto_2035006 ) ) ( not ( = ?auto_2035002 ?auto_2035005 ) ) ( not ( = ?auto_2035002 ?auto_2035007 ) ) ( not ( = ?auto_2035002 ?auto_2035008 ) ) ( not ( = ?auto_2035002 ?auto_2035009 ) ) ( not ( = ?auto_2035002 ?auto_2035010 ) ) ( not ( = ?auto_2035002 ?auto_2035011 ) ) ( not ( = ?auto_2035003 ?auto_2035004 ) ) ( not ( = ?auto_2035003 ?auto_2035006 ) ) ( not ( = ?auto_2035003 ?auto_2035005 ) ) ( not ( = ?auto_2035003 ?auto_2035007 ) ) ( not ( = ?auto_2035003 ?auto_2035008 ) ) ( not ( = ?auto_2035003 ?auto_2035009 ) ) ( not ( = ?auto_2035003 ?auto_2035010 ) ) ( not ( = ?auto_2035003 ?auto_2035011 ) ) ( not ( = ?auto_2035004 ?auto_2035006 ) ) ( not ( = ?auto_2035004 ?auto_2035005 ) ) ( not ( = ?auto_2035004 ?auto_2035007 ) ) ( not ( = ?auto_2035004 ?auto_2035008 ) ) ( not ( = ?auto_2035004 ?auto_2035009 ) ) ( not ( = ?auto_2035004 ?auto_2035010 ) ) ( not ( = ?auto_2035004 ?auto_2035011 ) ) ( not ( = ?auto_2035006 ?auto_2035005 ) ) ( not ( = ?auto_2035006 ?auto_2035007 ) ) ( not ( = ?auto_2035006 ?auto_2035008 ) ) ( not ( = ?auto_2035006 ?auto_2035009 ) ) ( not ( = ?auto_2035006 ?auto_2035010 ) ) ( not ( = ?auto_2035006 ?auto_2035011 ) ) ( not ( = ?auto_2035005 ?auto_2035007 ) ) ( not ( = ?auto_2035005 ?auto_2035008 ) ) ( not ( = ?auto_2035005 ?auto_2035009 ) ) ( not ( = ?auto_2035005 ?auto_2035010 ) ) ( not ( = ?auto_2035005 ?auto_2035011 ) ) ( not ( = ?auto_2035007 ?auto_2035008 ) ) ( not ( = ?auto_2035007 ?auto_2035009 ) ) ( not ( = ?auto_2035007 ?auto_2035010 ) ) ( not ( = ?auto_2035007 ?auto_2035011 ) ) ( not ( = ?auto_2035008 ?auto_2035009 ) ) ( not ( = ?auto_2035008 ?auto_2035010 ) ) ( not ( = ?auto_2035008 ?auto_2035011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035009 ?auto_2035010 ?auto_2035011 )
      ( MAKE-9CRATE-VERIFY ?auto_2035002 ?auto_2035003 ?auto_2035004 ?auto_2035006 ?auto_2035005 ?auto_2035007 ?auto_2035008 ?auto_2035009 ?auto_2035010 ?auto_2035011 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035092 - SURFACE
      ?auto_2035093 - SURFACE
      ?auto_2035094 - SURFACE
      ?auto_2035096 - SURFACE
      ?auto_2035095 - SURFACE
      ?auto_2035097 - SURFACE
      ?auto_2035098 - SURFACE
      ?auto_2035099 - SURFACE
      ?auto_2035100 - SURFACE
      ?auto_2035101 - SURFACE
    )
    :vars
    (
      ?auto_2035104 - HOIST
      ?auto_2035105 - PLACE
      ?auto_2035102 - TRUCK
      ?auto_2035103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035104 ?auto_2035105 ) ( SURFACE-AT ?auto_2035100 ?auto_2035105 ) ( CLEAR ?auto_2035100 ) ( IS-CRATE ?auto_2035101 ) ( not ( = ?auto_2035100 ?auto_2035101 ) ) ( AVAILABLE ?auto_2035104 ) ( IN ?auto_2035101 ?auto_2035102 ) ( ON ?auto_2035100 ?auto_2035099 ) ( not ( = ?auto_2035099 ?auto_2035100 ) ) ( not ( = ?auto_2035099 ?auto_2035101 ) ) ( TRUCK-AT ?auto_2035102 ?auto_2035103 ) ( not ( = ?auto_2035103 ?auto_2035105 ) ) ( ON ?auto_2035093 ?auto_2035092 ) ( ON ?auto_2035094 ?auto_2035093 ) ( ON ?auto_2035096 ?auto_2035094 ) ( ON ?auto_2035095 ?auto_2035096 ) ( ON ?auto_2035097 ?auto_2035095 ) ( ON ?auto_2035098 ?auto_2035097 ) ( ON ?auto_2035099 ?auto_2035098 ) ( not ( = ?auto_2035092 ?auto_2035093 ) ) ( not ( = ?auto_2035092 ?auto_2035094 ) ) ( not ( = ?auto_2035092 ?auto_2035096 ) ) ( not ( = ?auto_2035092 ?auto_2035095 ) ) ( not ( = ?auto_2035092 ?auto_2035097 ) ) ( not ( = ?auto_2035092 ?auto_2035098 ) ) ( not ( = ?auto_2035092 ?auto_2035099 ) ) ( not ( = ?auto_2035092 ?auto_2035100 ) ) ( not ( = ?auto_2035092 ?auto_2035101 ) ) ( not ( = ?auto_2035093 ?auto_2035094 ) ) ( not ( = ?auto_2035093 ?auto_2035096 ) ) ( not ( = ?auto_2035093 ?auto_2035095 ) ) ( not ( = ?auto_2035093 ?auto_2035097 ) ) ( not ( = ?auto_2035093 ?auto_2035098 ) ) ( not ( = ?auto_2035093 ?auto_2035099 ) ) ( not ( = ?auto_2035093 ?auto_2035100 ) ) ( not ( = ?auto_2035093 ?auto_2035101 ) ) ( not ( = ?auto_2035094 ?auto_2035096 ) ) ( not ( = ?auto_2035094 ?auto_2035095 ) ) ( not ( = ?auto_2035094 ?auto_2035097 ) ) ( not ( = ?auto_2035094 ?auto_2035098 ) ) ( not ( = ?auto_2035094 ?auto_2035099 ) ) ( not ( = ?auto_2035094 ?auto_2035100 ) ) ( not ( = ?auto_2035094 ?auto_2035101 ) ) ( not ( = ?auto_2035096 ?auto_2035095 ) ) ( not ( = ?auto_2035096 ?auto_2035097 ) ) ( not ( = ?auto_2035096 ?auto_2035098 ) ) ( not ( = ?auto_2035096 ?auto_2035099 ) ) ( not ( = ?auto_2035096 ?auto_2035100 ) ) ( not ( = ?auto_2035096 ?auto_2035101 ) ) ( not ( = ?auto_2035095 ?auto_2035097 ) ) ( not ( = ?auto_2035095 ?auto_2035098 ) ) ( not ( = ?auto_2035095 ?auto_2035099 ) ) ( not ( = ?auto_2035095 ?auto_2035100 ) ) ( not ( = ?auto_2035095 ?auto_2035101 ) ) ( not ( = ?auto_2035097 ?auto_2035098 ) ) ( not ( = ?auto_2035097 ?auto_2035099 ) ) ( not ( = ?auto_2035097 ?auto_2035100 ) ) ( not ( = ?auto_2035097 ?auto_2035101 ) ) ( not ( = ?auto_2035098 ?auto_2035099 ) ) ( not ( = ?auto_2035098 ?auto_2035100 ) ) ( not ( = ?auto_2035098 ?auto_2035101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035099 ?auto_2035100 ?auto_2035101 )
      ( MAKE-9CRATE-VERIFY ?auto_2035092 ?auto_2035093 ?auto_2035094 ?auto_2035096 ?auto_2035095 ?auto_2035097 ?auto_2035098 ?auto_2035099 ?auto_2035100 ?auto_2035101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035191 - SURFACE
      ?auto_2035192 - SURFACE
      ?auto_2035193 - SURFACE
      ?auto_2035195 - SURFACE
      ?auto_2035194 - SURFACE
      ?auto_2035196 - SURFACE
      ?auto_2035197 - SURFACE
      ?auto_2035198 - SURFACE
      ?auto_2035199 - SURFACE
      ?auto_2035200 - SURFACE
    )
    :vars
    (
      ?auto_2035202 - HOIST
      ?auto_2035201 - PLACE
      ?auto_2035205 - TRUCK
      ?auto_2035204 - PLACE
      ?auto_2035203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035202 ?auto_2035201 ) ( SURFACE-AT ?auto_2035199 ?auto_2035201 ) ( CLEAR ?auto_2035199 ) ( IS-CRATE ?auto_2035200 ) ( not ( = ?auto_2035199 ?auto_2035200 ) ) ( AVAILABLE ?auto_2035202 ) ( ON ?auto_2035199 ?auto_2035198 ) ( not ( = ?auto_2035198 ?auto_2035199 ) ) ( not ( = ?auto_2035198 ?auto_2035200 ) ) ( TRUCK-AT ?auto_2035205 ?auto_2035204 ) ( not ( = ?auto_2035204 ?auto_2035201 ) ) ( HOIST-AT ?auto_2035203 ?auto_2035204 ) ( LIFTING ?auto_2035203 ?auto_2035200 ) ( not ( = ?auto_2035202 ?auto_2035203 ) ) ( ON ?auto_2035192 ?auto_2035191 ) ( ON ?auto_2035193 ?auto_2035192 ) ( ON ?auto_2035195 ?auto_2035193 ) ( ON ?auto_2035194 ?auto_2035195 ) ( ON ?auto_2035196 ?auto_2035194 ) ( ON ?auto_2035197 ?auto_2035196 ) ( ON ?auto_2035198 ?auto_2035197 ) ( not ( = ?auto_2035191 ?auto_2035192 ) ) ( not ( = ?auto_2035191 ?auto_2035193 ) ) ( not ( = ?auto_2035191 ?auto_2035195 ) ) ( not ( = ?auto_2035191 ?auto_2035194 ) ) ( not ( = ?auto_2035191 ?auto_2035196 ) ) ( not ( = ?auto_2035191 ?auto_2035197 ) ) ( not ( = ?auto_2035191 ?auto_2035198 ) ) ( not ( = ?auto_2035191 ?auto_2035199 ) ) ( not ( = ?auto_2035191 ?auto_2035200 ) ) ( not ( = ?auto_2035192 ?auto_2035193 ) ) ( not ( = ?auto_2035192 ?auto_2035195 ) ) ( not ( = ?auto_2035192 ?auto_2035194 ) ) ( not ( = ?auto_2035192 ?auto_2035196 ) ) ( not ( = ?auto_2035192 ?auto_2035197 ) ) ( not ( = ?auto_2035192 ?auto_2035198 ) ) ( not ( = ?auto_2035192 ?auto_2035199 ) ) ( not ( = ?auto_2035192 ?auto_2035200 ) ) ( not ( = ?auto_2035193 ?auto_2035195 ) ) ( not ( = ?auto_2035193 ?auto_2035194 ) ) ( not ( = ?auto_2035193 ?auto_2035196 ) ) ( not ( = ?auto_2035193 ?auto_2035197 ) ) ( not ( = ?auto_2035193 ?auto_2035198 ) ) ( not ( = ?auto_2035193 ?auto_2035199 ) ) ( not ( = ?auto_2035193 ?auto_2035200 ) ) ( not ( = ?auto_2035195 ?auto_2035194 ) ) ( not ( = ?auto_2035195 ?auto_2035196 ) ) ( not ( = ?auto_2035195 ?auto_2035197 ) ) ( not ( = ?auto_2035195 ?auto_2035198 ) ) ( not ( = ?auto_2035195 ?auto_2035199 ) ) ( not ( = ?auto_2035195 ?auto_2035200 ) ) ( not ( = ?auto_2035194 ?auto_2035196 ) ) ( not ( = ?auto_2035194 ?auto_2035197 ) ) ( not ( = ?auto_2035194 ?auto_2035198 ) ) ( not ( = ?auto_2035194 ?auto_2035199 ) ) ( not ( = ?auto_2035194 ?auto_2035200 ) ) ( not ( = ?auto_2035196 ?auto_2035197 ) ) ( not ( = ?auto_2035196 ?auto_2035198 ) ) ( not ( = ?auto_2035196 ?auto_2035199 ) ) ( not ( = ?auto_2035196 ?auto_2035200 ) ) ( not ( = ?auto_2035197 ?auto_2035198 ) ) ( not ( = ?auto_2035197 ?auto_2035199 ) ) ( not ( = ?auto_2035197 ?auto_2035200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035198 ?auto_2035199 ?auto_2035200 )
      ( MAKE-9CRATE-VERIFY ?auto_2035191 ?auto_2035192 ?auto_2035193 ?auto_2035195 ?auto_2035194 ?auto_2035196 ?auto_2035197 ?auto_2035198 ?auto_2035199 ?auto_2035200 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035299 - SURFACE
      ?auto_2035300 - SURFACE
      ?auto_2035301 - SURFACE
      ?auto_2035303 - SURFACE
      ?auto_2035302 - SURFACE
      ?auto_2035304 - SURFACE
      ?auto_2035305 - SURFACE
      ?auto_2035306 - SURFACE
      ?auto_2035307 - SURFACE
      ?auto_2035308 - SURFACE
    )
    :vars
    (
      ?auto_2035313 - HOIST
      ?auto_2035309 - PLACE
      ?auto_2035310 - TRUCK
      ?auto_2035314 - PLACE
      ?auto_2035311 - HOIST
      ?auto_2035312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035313 ?auto_2035309 ) ( SURFACE-AT ?auto_2035307 ?auto_2035309 ) ( CLEAR ?auto_2035307 ) ( IS-CRATE ?auto_2035308 ) ( not ( = ?auto_2035307 ?auto_2035308 ) ) ( AVAILABLE ?auto_2035313 ) ( ON ?auto_2035307 ?auto_2035306 ) ( not ( = ?auto_2035306 ?auto_2035307 ) ) ( not ( = ?auto_2035306 ?auto_2035308 ) ) ( TRUCK-AT ?auto_2035310 ?auto_2035314 ) ( not ( = ?auto_2035314 ?auto_2035309 ) ) ( HOIST-AT ?auto_2035311 ?auto_2035314 ) ( not ( = ?auto_2035313 ?auto_2035311 ) ) ( AVAILABLE ?auto_2035311 ) ( SURFACE-AT ?auto_2035308 ?auto_2035314 ) ( ON ?auto_2035308 ?auto_2035312 ) ( CLEAR ?auto_2035308 ) ( not ( = ?auto_2035307 ?auto_2035312 ) ) ( not ( = ?auto_2035308 ?auto_2035312 ) ) ( not ( = ?auto_2035306 ?auto_2035312 ) ) ( ON ?auto_2035300 ?auto_2035299 ) ( ON ?auto_2035301 ?auto_2035300 ) ( ON ?auto_2035303 ?auto_2035301 ) ( ON ?auto_2035302 ?auto_2035303 ) ( ON ?auto_2035304 ?auto_2035302 ) ( ON ?auto_2035305 ?auto_2035304 ) ( ON ?auto_2035306 ?auto_2035305 ) ( not ( = ?auto_2035299 ?auto_2035300 ) ) ( not ( = ?auto_2035299 ?auto_2035301 ) ) ( not ( = ?auto_2035299 ?auto_2035303 ) ) ( not ( = ?auto_2035299 ?auto_2035302 ) ) ( not ( = ?auto_2035299 ?auto_2035304 ) ) ( not ( = ?auto_2035299 ?auto_2035305 ) ) ( not ( = ?auto_2035299 ?auto_2035306 ) ) ( not ( = ?auto_2035299 ?auto_2035307 ) ) ( not ( = ?auto_2035299 ?auto_2035308 ) ) ( not ( = ?auto_2035299 ?auto_2035312 ) ) ( not ( = ?auto_2035300 ?auto_2035301 ) ) ( not ( = ?auto_2035300 ?auto_2035303 ) ) ( not ( = ?auto_2035300 ?auto_2035302 ) ) ( not ( = ?auto_2035300 ?auto_2035304 ) ) ( not ( = ?auto_2035300 ?auto_2035305 ) ) ( not ( = ?auto_2035300 ?auto_2035306 ) ) ( not ( = ?auto_2035300 ?auto_2035307 ) ) ( not ( = ?auto_2035300 ?auto_2035308 ) ) ( not ( = ?auto_2035300 ?auto_2035312 ) ) ( not ( = ?auto_2035301 ?auto_2035303 ) ) ( not ( = ?auto_2035301 ?auto_2035302 ) ) ( not ( = ?auto_2035301 ?auto_2035304 ) ) ( not ( = ?auto_2035301 ?auto_2035305 ) ) ( not ( = ?auto_2035301 ?auto_2035306 ) ) ( not ( = ?auto_2035301 ?auto_2035307 ) ) ( not ( = ?auto_2035301 ?auto_2035308 ) ) ( not ( = ?auto_2035301 ?auto_2035312 ) ) ( not ( = ?auto_2035303 ?auto_2035302 ) ) ( not ( = ?auto_2035303 ?auto_2035304 ) ) ( not ( = ?auto_2035303 ?auto_2035305 ) ) ( not ( = ?auto_2035303 ?auto_2035306 ) ) ( not ( = ?auto_2035303 ?auto_2035307 ) ) ( not ( = ?auto_2035303 ?auto_2035308 ) ) ( not ( = ?auto_2035303 ?auto_2035312 ) ) ( not ( = ?auto_2035302 ?auto_2035304 ) ) ( not ( = ?auto_2035302 ?auto_2035305 ) ) ( not ( = ?auto_2035302 ?auto_2035306 ) ) ( not ( = ?auto_2035302 ?auto_2035307 ) ) ( not ( = ?auto_2035302 ?auto_2035308 ) ) ( not ( = ?auto_2035302 ?auto_2035312 ) ) ( not ( = ?auto_2035304 ?auto_2035305 ) ) ( not ( = ?auto_2035304 ?auto_2035306 ) ) ( not ( = ?auto_2035304 ?auto_2035307 ) ) ( not ( = ?auto_2035304 ?auto_2035308 ) ) ( not ( = ?auto_2035304 ?auto_2035312 ) ) ( not ( = ?auto_2035305 ?auto_2035306 ) ) ( not ( = ?auto_2035305 ?auto_2035307 ) ) ( not ( = ?auto_2035305 ?auto_2035308 ) ) ( not ( = ?auto_2035305 ?auto_2035312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035306 ?auto_2035307 ?auto_2035308 )
      ( MAKE-9CRATE-VERIFY ?auto_2035299 ?auto_2035300 ?auto_2035301 ?auto_2035303 ?auto_2035302 ?auto_2035304 ?auto_2035305 ?auto_2035306 ?auto_2035307 ?auto_2035308 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035408 - SURFACE
      ?auto_2035409 - SURFACE
      ?auto_2035410 - SURFACE
      ?auto_2035412 - SURFACE
      ?auto_2035411 - SURFACE
      ?auto_2035413 - SURFACE
      ?auto_2035414 - SURFACE
      ?auto_2035415 - SURFACE
      ?auto_2035416 - SURFACE
      ?auto_2035417 - SURFACE
    )
    :vars
    (
      ?auto_2035420 - HOIST
      ?auto_2035423 - PLACE
      ?auto_2035418 - PLACE
      ?auto_2035422 - HOIST
      ?auto_2035419 - SURFACE
      ?auto_2035421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035420 ?auto_2035423 ) ( SURFACE-AT ?auto_2035416 ?auto_2035423 ) ( CLEAR ?auto_2035416 ) ( IS-CRATE ?auto_2035417 ) ( not ( = ?auto_2035416 ?auto_2035417 ) ) ( AVAILABLE ?auto_2035420 ) ( ON ?auto_2035416 ?auto_2035415 ) ( not ( = ?auto_2035415 ?auto_2035416 ) ) ( not ( = ?auto_2035415 ?auto_2035417 ) ) ( not ( = ?auto_2035418 ?auto_2035423 ) ) ( HOIST-AT ?auto_2035422 ?auto_2035418 ) ( not ( = ?auto_2035420 ?auto_2035422 ) ) ( AVAILABLE ?auto_2035422 ) ( SURFACE-AT ?auto_2035417 ?auto_2035418 ) ( ON ?auto_2035417 ?auto_2035419 ) ( CLEAR ?auto_2035417 ) ( not ( = ?auto_2035416 ?auto_2035419 ) ) ( not ( = ?auto_2035417 ?auto_2035419 ) ) ( not ( = ?auto_2035415 ?auto_2035419 ) ) ( TRUCK-AT ?auto_2035421 ?auto_2035423 ) ( ON ?auto_2035409 ?auto_2035408 ) ( ON ?auto_2035410 ?auto_2035409 ) ( ON ?auto_2035412 ?auto_2035410 ) ( ON ?auto_2035411 ?auto_2035412 ) ( ON ?auto_2035413 ?auto_2035411 ) ( ON ?auto_2035414 ?auto_2035413 ) ( ON ?auto_2035415 ?auto_2035414 ) ( not ( = ?auto_2035408 ?auto_2035409 ) ) ( not ( = ?auto_2035408 ?auto_2035410 ) ) ( not ( = ?auto_2035408 ?auto_2035412 ) ) ( not ( = ?auto_2035408 ?auto_2035411 ) ) ( not ( = ?auto_2035408 ?auto_2035413 ) ) ( not ( = ?auto_2035408 ?auto_2035414 ) ) ( not ( = ?auto_2035408 ?auto_2035415 ) ) ( not ( = ?auto_2035408 ?auto_2035416 ) ) ( not ( = ?auto_2035408 ?auto_2035417 ) ) ( not ( = ?auto_2035408 ?auto_2035419 ) ) ( not ( = ?auto_2035409 ?auto_2035410 ) ) ( not ( = ?auto_2035409 ?auto_2035412 ) ) ( not ( = ?auto_2035409 ?auto_2035411 ) ) ( not ( = ?auto_2035409 ?auto_2035413 ) ) ( not ( = ?auto_2035409 ?auto_2035414 ) ) ( not ( = ?auto_2035409 ?auto_2035415 ) ) ( not ( = ?auto_2035409 ?auto_2035416 ) ) ( not ( = ?auto_2035409 ?auto_2035417 ) ) ( not ( = ?auto_2035409 ?auto_2035419 ) ) ( not ( = ?auto_2035410 ?auto_2035412 ) ) ( not ( = ?auto_2035410 ?auto_2035411 ) ) ( not ( = ?auto_2035410 ?auto_2035413 ) ) ( not ( = ?auto_2035410 ?auto_2035414 ) ) ( not ( = ?auto_2035410 ?auto_2035415 ) ) ( not ( = ?auto_2035410 ?auto_2035416 ) ) ( not ( = ?auto_2035410 ?auto_2035417 ) ) ( not ( = ?auto_2035410 ?auto_2035419 ) ) ( not ( = ?auto_2035412 ?auto_2035411 ) ) ( not ( = ?auto_2035412 ?auto_2035413 ) ) ( not ( = ?auto_2035412 ?auto_2035414 ) ) ( not ( = ?auto_2035412 ?auto_2035415 ) ) ( not ( = ?auto_2035412 ?auto_2035416 ) ) ( not ( = ?auto_2035412 ?auto_2035417 ) ) ( not ( = ?auto_2035412 ?auto_2035419 ) ) ( not ( = ?auto_2035411 ?auto_2035413 ) ) ( not ( = ?auto_2035411 ?auto_2035414 ) ) ( not ( = ?auto_2035411 ?auto_2035415 ) ) ( not ( = ?auto_2035411 ?auto_2035416 ) ) ( not ( = ?auto_2035411 ?auto_2035417 ) ) ( not ( = ?auto_2035411 ?auto_2035419 ) ) ( not ( = ?auto_2035413 ?auto_2035414 ) ) ( not ( = ?auto_2035413 ?auto_2035415 ) ) ( not ( = ?auto_2035413 ?auto_2035416 ) ) ( not ( = ?auto_2035413 ?auto_2035417 ) ) ( not ( = ?auto_2035413 ?auto_2035419 ) ) ( not ( = ?auto_2035414 ?auto_2035415 ) ) ( not ( = ?auto_2035414 ?auto_2035416 ) ) ( not ( = ?auto_2035414 ?auto_2035417 ) ) ( not ( = ?auto_2035414 ?auto_2035419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035415 ?auto_2035416 ?auto_2035417 )
      ( MAKE-9CRATE-VERIFY ?auto_2035408 ?auto_2035409 ?auto_2035410 ?auto_2035412 ?auto_2035411 ?auto_2035413 ?auto_2035414 ?auto_2035415 ?auto_2035416 ?auto_2035417 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035517 - SURFACE
      ?auto_2035518 - SURFACE
      ?auto_2035519 - SURFACE
      ?auto_2035521 - SURFACE
      ?auto_2035520 - SURFACE
      ?auto_2035522 - SURFACE
      ?auto_2035523 - SURFACE
      ?auto_2035524 - SURFACE
      ?auto_2035525 - SURFACE
      ?auto_2035526 - SURFACE
    )
    :vars
    (
      ?auto_2035529 - HOIST
      ?auto_2035532 - PLACE
      ?auto_2035527 - PLACE
      ?auto_2035531 - HOIST
      ?auto_2035528 - SURFACE
      ?auto_2035530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035529 ?auto_2035532 ) ( IS-CRATE ?auto_2035526 ) ( not ( = ?auto_2035525 ?auto_2035526 ) ) ( not ( = ?auto_2035524 ?auto_2035525 ) ) ( not ( = ?auto_2035524 ?auto_2035526 ) ) ( not ( = ?auto_2035527 ?auto_2035532 ) ) ( HOIST-AT ?auto_2035531 ?auto_2035527 ) ( not ( = ?auto_2035529 ?auto_2035531 ) ) ( AVAILABLE ?auto_2035531 ) ( SURFACE-AT ?auto_2035526 ?auto_2035527 ) ( ON ?auto_2035526 ?auto_2035528 ) ( CLEAR ?auto_2035526 ) ( not ( = ?auto_2035525 ?auto_2035528 ) ) ( not ( = ?auto_2035526 ?auto_2035528 ) ) ( not ( = ?auto_2035524 ?auto_2035528 ) ) ( TRUCK-AT ?auto_2035530 ?auto_2035532 ) ( SURFACE-AT ?auto_2035524 ?auto_2035532 ) ( CLEAR ?auto_2035524 ) ( LIFTING ?auto_2035529 ?auto_2035525 ) ( IS-CRATE ?auto_2035525 ) ( ON ?auto_2035518 ?auto_2035517 ) ( ON ?auto_2035519 ?auto_2035518 ) ( ON ?auto_2035521 ?auto_2035519 ) ( ON ?auto_2035520 ?auto_2035521 ) ( ON ?auto_2035522 ?auto_2035520 ) ( ON ?auto_2035523 ?auto_2035522 ) ( ON ?auto_2035524 ?auto_2035523 ) ( not ( = ?auto_2035517 ?auto_2035518 ) ) ( not ( = ?auto_2035517 ?auto_2035519 ) ) ( not ( = ?auto_2035517 ?auto_2035521 ) ) ( not ( = ?auto_2035517 ?auto_2035520 ) ) ( not ( = ?auto_2035517 ?auto_2035522 ) ) ( not ( = ?auto_2035517 ?auto_2035523 ) ) ( not ( = ?auto_2035517 ?auto_2035524 ) ) ( not ( = ?auto_2035517 ?auto_2035525 ) ) ( not ( = ?auto_2035517 ?auto_2035526 ) ) ( not ( = ?auto_2035517 ?auto_2035528 ) ) ( not ( = ?auto_2035518 ?auto_2035519 ) ) ( not ( = ?auto_2035518 ?auto_2035521 ) ) ( not ( = ?auto_2035518 ?auto_2035520 ) ) ( not ( = ?auto_2035518 ?auto_2035522 ) ) ( not ( = ?auto_2035518 ?auto_2035523 ) ) ( not ( = ?auto_2035518 ?auto_2035524 ) ) ( not ( = ?auto_2035518 ?auto_2035525 ) ) ( not ( = ?auto_2035518 ?auto_2035526 ) ) ( not ( = ?auto_2035518 ?auto_2035528 ) ) ( not ( = ?auto_2035519 ?auto_2035521 ) ) ( not ( = ?auto_2035519 ?auto_2035520 ) ) ( not ( = ?auto_2035519 ?auto_2035522 ) ) ( not ( = ?auto_2035519 ?auto_2035523 ) ) ( not ( = ?auto_2035519 ?auto_2035524 ) ) ( not ( = ?auto_2035519 ?auto_2035525 ) ) ( not ( = ?auto_2035519 ?auto_2035526 ) ) ( not ( = ?auto_2035519 ?auto_2035528 ) ) ( not ( = ?auto_2035521 ?auto_2035520 ) ) ( not ( = ?auto_2035521 ?auto_2035522 ) ) ( not ( = ?auto_2035521 ?auto_2035523 ) ) ( not ( = ?auto_2035521 ?auto_2035524 ) ) ( not ( = ?auto_2035521 ?auto_2035525 ) ) ( not ( = ?auto_2035521 ?auto_2035526 ) ) ( not ( = ?auto_2035521 ?auto_2035528 ) ) ( not ( = ?auto_2035520 ?auto_2035522 ) ) ( not ( = ?auto_2035520 ?auto_2035523 ) ) ( not ( = ?auto_2035520 ?auto_2035524 ) ) ( not ( = ?auto_2035520 ?auto_2035525 ) ) ( not ( = ?auto_2035520 ?auto_2035526 ) ) ( not ( = ?auto_2035520 ?auto_2035528 ) ) ( not ( = ?auto_2035522 ?auto_2035523 ) ) ( not ( = ?auto_2035522 ?auto_2035524 ) ) ( not ( = ?auto_2035522 ?auto_2035525 ) ) ( not ( = ?auto_2035522 ?auto_2035526 ) ) ( not ( = ?auto_2035522 ?auto_2035528 ) ) ( not ( = ?auto_2035523 ?auto_2035524 ) ) ( not ( = ?auto_2035523 ?auto_2035525 ) ) ( not ( = ?auto_2035523 ?auto_2035526 ) ) ( not ( = ?auto_2035523 ?auto_2035528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035524 ?auto_2035525 ?auto_2035526 )
      ( MAKE-9CRATE-VERIFY ?auto_2035517 ?auto_2035518 ?auto_2035519 ?auto_2035521 ?auto_2035520 ?auto_2035522 ?auto_2035523 ?auto_2035524 ?auto_2035525 ?auto_2035526 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035626 - SURFACE
      ?auto_2035627 - SURFACE
      ?auto_2035628 - SURFACE
      ?auto_2035630 - SURFACE
      ?auto_2035629 - SURFACE
      ?auto_2035631 - SURFACE
      ?auto_2035632 - SURFACE
      ?auto_2035633 - SURFACE
      ?auto_2035634 - SURFACE
      ?auto_2035635 - SURFACE
    )
    :vars
    (
      ?auto_2035636 - HOIST
      ?auto_2035637 - PLACE
      ?auto_2035640 - PLACE
      ?auto_2035641 - HOIST
      ?auto_2035638 - SURFACE
      ?auto_2035639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035636 ?auto_2035637 ) ( IS-CRATE ?auto_2035635 ) ( not ( = ?auto_2035634 ?auto_2035635 ) ) ( not ( = ?auto_2035633 ?auto_2035634 ) ) ( not ( = ?auto_2035633 ?auto_2035635 ) ) ( not ( = ?auto_2035640 ?auto_2035637 ) ) ( HOIST-AT ?auto_2035641 ?auto_2035640 ) ( not ( = ?auto_2035636 ?auto_2035641 ) ) ( AVAILABLE ?auto_2035641 ) ( SURFACE-AT ?auto_2035635 ?auto_2035640 ) ( ON ?auto_2035635 ?auto_2035638 ) ( CLEAR ?auto_2035635 ) ( not ( = ?auto_2035634 ?auto_2035638 ) ) ( not ( = ?auto_2035635 ?auto_2035638 ) ) ( not ( = ?auto_2035633 ?auto_2035638 ) ) ( TRUCK-AT ?auto_2035639 ?auto_2035637 ) ( SURFACE-AT ?auto_2035633 ?auto_2035637 ) ( CLEAR ?auto_2035633 ) ( IS-CRATE ?auto_2035634 ) ( AVAILABLE ?auto_2035636 ) ( IN ?auto_2035634 ?auto_2035639 ) ( ON ?auto_2035627 ?auto_2035626 ) ( ON ?auto_2035628 ?auto_2035627 ) ( ON ?auto_2035630 ?auto_2035628 ) ( ON ?auto_2035629 ?auto_2035630 ) ( ON ?auto_2035631 ?auto_2035629 ) ( ON ?auto_2035632 ?auto_2035631 ) ( ON ?auto_2035633 ?auto_2035632 ) ( not ( = ?auto_2035626 ?auto_2035627 ) ) ( not ( = ?auto_2035626 ?auto_2035628 ) ) ( not ( = ?auto_2035626 ?auto_2035630 ) ) ( not ( = ?auto_2035626 ?auto_2035629 ) ) ( not ( = ?auto_2035626 ?auto_2035631 ) ) ( not ( = ?auto_2035626 ?auto_2035632 ) ) ( not ( = ?auto_2035626 ?auto_2035633 ) ) ( not ( = ?auto_2035626 ?auto_2035634 ) ) ( not ( = ?auto_2035626 ?auto_2035635 ) ) ( not ( = ?auto_2035626 ?auto_2035638 ) ) ( not ( = ?auto_2035627 ?auto_2035628 ) ) ( not ( = ?auto_2035627 ?auto_2035630 ) ) ( not ( = ?auto_2035627 ?auto_2035629 ) ) ( not ( = ?auto_2035627 ?auto_2035631 ) ) ( not ( = ?auto_2035627 ?auto_2035632 ) ) ( not ( = ?auto_2035627 ?auto_2035633 ) ) ( not ( = ?auto_2035627 ?auto_2035634 ) ) ( not ( = ?auto_2035627 ?auto_2035635 ) ) ( not ( = ?auto_2035627 ?auto_2035638 ) ) ( not ( = ?auto_2035628 ?auto_2035630 ) ) ( not ( = ?auto_2035628 ?auto_2035629 ) ) ( not ( = ?auto_2035628 ?auto_2035631 ) ) ( not ( = ?auto_2035628 ?auto_2035632 ) ) ( not ( = ?auto_2035628 ?auto_2035633 ) ) ( not ( = ?auto_2035628 ?auto_2035634 ) ) ( not ( = ?auto_2035628 ?auto_2035635 ) ) ( not ( = ?auto_2035628 ?auto_2035638 ) ) ( not ( = ?auto_2035630 ?auto_2035629 ) ) ( not ( = ?auto_2035630 ?auto_2035631 ) ) ( not ( = ?auto_2035630 ?auto_2035632 ) ) ( not ( = ?auto_2035630 ?auto_2035633 ) ) ( not ( = ?auto_2035630 ?auto_2035634 ) ) ( not ( = ?auto_2035630 ?auto_2035635 ) ) ( not ( = ?auto_2035630 ?auto_2035638 ) ) ( not ( = ?auto_2035629 ?auto_2035631 ) ) ( not ( = ?auto_2035629 ?auto_2035632 ) ) ( not ( = ?auto_2035629 ?auto_2035633 ) ) ( not ( = ?auto_2035629 ?auto_2035634 ) ) ( not ( = ?auto_2035629 ?auto_2035635 ) ) ( not ( = ?auto_2035629 ?auto_2035638 ) ) ( not ( = ?auto_2035631 ?auto_2035632 ) ) ( not ( = ?auto_2035631 ?auto_2035633 ) ) ( not ( = ?auto_2035631 ?auto_2035634 ) ) ( not ( = ?auto_2035631 ?auto_2035635 ) ) ( not ( = ?auto_2035631 ?auto_2035638 ) ) ( not ( = ?auto_2035632 ?auto_2035633 ) ) ( not ( = ?auto_2035632 ?auto_2035634 ) ) ( not ( = ?auto_2035632 ?auto_2035635 ) ) ( not ( = ?auto_2035632 ?auto_2035638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035633 ?auto_2035634 ?auto_2035635 )
      ( MAKE-9CRATE-VERIFY ?auto_2035626 ?auto_2035627 ?auto_2035628 ?auto_2035630 ?auto_2035629 ?auto_2035631 ?auto_2035632 ?auto_2035633 ?auto_2035634 ?auto_2035635 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041137 - SURFACE
      ?auto_2041138 - SURFACE
      ?auto_2041139 - SURFACE
      ?auto_2041141 - SURFACE
      ?auto_2041140 - SURFACE
      ?auto_2041142 - SURFACE
      ?auto_2041143 - SURFACE
      ?auto_2041144 - SURFACE
      ?auto_2041145 - SURFACE
      ?auto_2041146 - SURFACE
      ?auto_2041147 - SURFACE
    )
    :vars
    (
      ?auto_2041148 - HOIST
      ?auto_2041149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041148 ?auto_2041149 ) ( SURFACE-AT ?auto_2041146 ?auto_2041149 ) ( CLEAR ?auto_2041146 ) ( LIFTING ?auto_2041148 ?auto_2041147 ) ( IS-CRATE ?auto_2041147 ) ( not ( = ?auto_2041146 ?auto_2041147 ) ) ( ON ?auto_2041138 ?auto_2041137 ) ( ON ?auto_2041139 ?auto_2041138 ) ( ON ?auto_2041141 ?auto_2041139 ) ( ON ?auto_2041140 ?auto_2041141 ) ( ON ?auto_2041142 ?auto_2041140 ) ( ON ?auto_2041143 ?auto_2041142 ) ( ON ?auto_2041144 ?auto_2041143 ) ( ON ?auto_2041145 ?auto_2041144 ) ( ON ?auto_2041146 ?auto_2041145 ) ( not ( = ?auto_2041137 ?auto_2041138 ) ) ( not ( = ?auto_2041137 ?auto_2041139 ) ) ( not ( = ?auto_2041137 ?auto_2041141 ) ) ( not ( = ?auto_2041137 ?auto_2041140 ) ) ( not ( = ?auto_2041137 ?auto_2041142 ) ) ( not ( = ?auto_2041137 ?auto_2041143 ) ) ( not ( = ?auto_2041137 ?auto_2041144 ) ) ( not ( = ?auto_2041137 ?auto_2041145 ) ) ( not ( = ?auto_2041137 ?auto_2041146 ) ) ( not ( = ?auto_2041137 ?auto_2041147 ) ) ( not ( = ?auto_2041138 ?auto_2041139 ) ) ( not ( = ?auto_2041138 ?auto_2041141 ) ) ( not ( = ?auto_2041138 ?auto_2041140 ) ) ( not ( = ?auto_2041138 ?auto_2041142 ) ) ( not ( = ?auto_2041138 ?auto_2041143 ) ) ( not ( = ?auto_2041138 ?auto_2041144 ) ) ( not ( = ?auto_2041138 ?auto_2041145 ) ) ( not ( = ?auto_2041138 ?auto_2041146 ) ) ( not ( = ?auto_2041138 ?auto_2041147 ) ) ( not ( = ?auto_2041139 ?auto_2041141 ) ) ( not ( = ?auto_2041139 ?auto_2041140 ) ) ( not ( = ?auto_2041139 ?auto_2041142 ) ) ( not ( = ?auto_2041139 ?auto_2041143 ) ) ( not ( = ?auto_2041139 ?auto_2041144 ) ) ( not ( = ?auto_2041139 ?auto_2041145 ) ) ( not ( = ?auto_2041139 ?auto_2041146 ) ) ( not ( = ?auto_2041139 ?auto_2041147 ) ) ( not ( = ?auto_2041141 ?auto_2041140 ) ) ( not ( = ?auto_2041141 ?auto_2041142 ) ) ( not ( = ?auto_2041141 ?auto_2041143 ) ) ( not ( = ?auto_2041141 ?auto_2041144 ) ) ( not ( = ?auto_2041141 ?auto_2041145 ) ) ( not ( = ?auto_2041141 ?auto_2041146 ) ) ( not ( = ?auto_2041141 ?auto_2041147 ) ) ( not ( = ?auto_2041140 ?auto_2041142 ) ) ( not ( = ?auto_2041140 ?auto_2041143 ) ) ( not ( = ?auto_2041140 ?auto_2041144 ) ) ( not ( = ?auto_2041140 ?auto_2041145 ) ) ( not ( = ?auto_2041140 ?auto_2041146 ) ) ( not ( = ?auto_2041140 ?auto_2041147 ) ) ( not ( = ?auto_2041142 ?auto_2041143 ) ) ( not ( = ?auto_2041142 ?auto_2041144 ) ) ( not ( = ?auto_2041142 ?auto_2041145 ) ) ( not ( = ?auto_2041142 ?auto_2041146 ) ) ( not ( = ?auto_2041142 ?auto_2041147 ) ) ( not ( = ?auto_2041143 ?auto_2041144 ) ) ( not ( = ?auto_2041143 ?auto_2041145 ) ) ( not ( = ?auto_2041143 ?auto_2041146 ) ) ( not ( = ?auto_2041143 ?auto_2041147 ) ) ( not ( = ?auto_2041144 ?auto_2041145 ) ) ( not ( = ?auto_2041144 ?auto_2041146 ) ) ( not ( = ?auto_2041144 ?auto_2041147 ) ) ( not ( = ?auto_2041145 ?auto_2041146 ) ) ( not ( = ?auto_2041145 ?auto_2041147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2041146 ?auto_2041147 )
      ( MAKE-10CRATE-VERIFY ?auto_2041137 ?auto_2041138 ?auto_2041139 ?auto_2041141 ?auto_2041140 ?auto_2041142 ?auto_2041143 ?auto_2041144 ?auto_2041145 ?auto_2041146 ?auto_2041147 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041231 - SURFACE
      ?auto_2041232 - SURFACE
      ?auto_2041233 - SURFACE
      ?auto_2041235 - SURFACE
      ?auto_2041234 - SURFACE
      ?auto_2041236 - SURFACE
      ?auto_2041237 - SURFACE
      ?auto_2041238 - SURFACE
      ?auto_2041239 - SURFACE
      ?auto_2041240 - SURFACE
      ?auto_2041241 - SURFACE
    )
    :vars
    (
      ?auto_2041243 - HOIST
      ?auto_2041244 - PLACE
      ?auto_2041242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041243 ?auto_2041244 ) ( SURFACE-AT ?auto_2041240 ?auto_2041244 ) ( CLEAR ?auto_2041240 ) ( IS-CRATE ?auto_2041241 ) ( not ( = ?auto_2041240 ?auto_2041241 ) ) ( TRUCK-AT ?auto_2041242 ?auto_2041244 ) ( AVAILABLE ?auto_2041243 ) ( IN ?auto_2041241 ?auto_2041242 ) ( ON ?auto_2041240 ?auto_2041239 ) ( not ( = ?auto_2041239 ?auto_2041240 ) ) ( not ( = ?auto_2041239 ?auto_2041241 ) ) ( ON ?auto_2041232 ?auto_2041231 ) ( ON ?auto_2041233 ?auto_2041232 ) ( ON ?auto_2041235 ?auto_2041233 ) ( ON ?auto_2041234 ?auto_2041235 ) ( ON ?auto_2041236 ?auto_2041234 ) ( ON ?auto_2041237 ?auto_2041236 ) ( ON ?auto_2041238 ?auto_2041237 ) ( ON ?auto_2041239 ?auto_2041238 ) ( not ( = ?auto_2041231 ?auto_2041232 ) ) ( not ( = ?auto_2041231 ?auto_2041233 ) ) ( not ( = ?auto_2041231 ?auto_2041235 ) ) ( not ( = ?auto_2041231 ?auto_2041234 ) ) ( not ( = ?auto_2041231 ?auto_2041236 ) ) ( not ( = ?auto_2041231 ?auto_2041237 ) ) ( not ( = ?auto_2041231 ?auto_2041238 ) ) ( not ( = ?auto_2041231 ?auto_2041239 ) ) ( not ( = ?auto_2041231 ?auto_2041240 ) ) ( not ( = ?auto_2041231 ?auto_2041241 ) ) ( not ( = ?auto_2041232 ?auto_2041233 ) ) ( not ( = ?auto_2041232 ?auto_2041235 ) ) ( not ( = ?auto_2041232 ?auto_2041234 ) ) ( not ( = ?auto_2041232 ?auto_2041236 ) ) ( not ( = ?auto_2041232 ?auto_2041237 ) ) ( not ( = ?auto_2041232 ?auto_2041238 ) ) ( not ( = ?auto_2041232 ?auto_2041239 ) ) ( not ( = ?auto_2041232 ?auto_2041240 ) ) ( not ( = ?auto_2041232 ?auto_2041241 ) ) ( not ( = ?auto_2041233 ?auto_2041235 ) ) ( not ( = ?auto_2041233 ?auto_2041234 ) ) ( not ( = ?auto_2041233 ?auto_2041236 ) ) ( not ( = ?auto_2041233 ?auto_2041237 ) ) ( not ( = ?auto_2041233 ?auto_2041238 ) ) ( not ( = ?auto_2041233 ?auto_2041239 ) ) ( not ( = ?auto_2041233 ?auto_2041240 ) ) ( not ( = ?auto_2041233 ?auto_2041241 ) ) ( not ( = ?auto_2041235 ?auto_2041234 ) ) ( not ( = ?auto_2041235 ?auto_2041236 ) ) ( not ( = ?auto_2041235 ?auto_2041237 ) ) ( not ( = ?auto_2041235 ?auto_2041238 ) ) ( not ( = ?auto_2041235 ?auto_2041239 ) ) ( not ( = ?auto_2041235 ?auto_2041240 ) ) ( not ( = ?auto_2041235 ?auto_2041241 ) ) ( not ( = ?auto_2041234 ?auto_2041236 ) ) ( not ( = ?auto_2041234 ?auto_2041237 ) ) ( not ( = ?auto_2041234 ?auto_2041238 ) ) ( not ( = ?auto_2041234 ?auto_2041239 ) ) ( not ( = ?auto_2041234 ?auto_2041240 ) ) ( not ( = ?auto_2041234 ?auto_2041241 ) ) ( not ( = ?auto_2041236 ?auto_2041237 ) ) ( not ( = ?auto_2041236 ?auto_2041238 ) ) ( not ( = ?auto_2041236 ?auto_2041239 ) ) ( not ( = ?auto_2041236 ?auto_2041240 ) ) ( not ( = ?auto_2041236 ?auto_2041241 ) ) ( not ( = ?auto_2041237 ?auto_2041238 ) ) ( not ( = ?auto_2041237 ?auto_2041239 ) ) ( not ( = ?auto_2041237 ?auto_2041240 ) ) ( not ( = ?auto_2041237 ?auto_2041241 ) ) ( not ( = ?auto_2041238 ?auto_2041239 ) ) ( not ( = ?auto_2041238 ?auto_2041240 ) ) ( not ( = ?auto_2041238 ?auto_2041241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041239 ?auto_2041240 ?auto_2041241 )
      ( MAKE-10CRATE-VERIFY ?auto_2041231 ?auto_2041232 ?auto_2041233 ?auto_2041235 ?auto_2041234 ?auto_2041236 ?auto_2041237 ?auto_2041238 ?auto_2041239 ?auto_2041240 ?auto_2041241 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041336 - SURFACE
      ?auto_2041337 - SURFACE
      ?auto_2041338 - SURFACE
      ?auto_2041340 - SURFACE
      ?auto_2041339 - SURFACE
      ?auto_2041341 - SURFACE
      ?auto_2041342 - SURFACE
      ?auto_2041343 - SURFACE
      ?auto_2041344 - SURFACE
      ?auto_2041345 - SURFACE
      ?auto_2041346 - SURFACE
    )
    :vars
    (
      ?auto_2041349 - HOIST
      ?auto_2041347 - PLACE
      ?auto_2041348 - TRUCK
      ?auto_2041350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041349 ?auto_2041347 ) ( SURFACE-AT ?auto_2041345 ?auto_2041347 ) ( CLEAR ?auto_2041345 ) ( IS-CRATE ?auto_2041346 ) ( not ( = ?auto_2041345 ?auto_2041346 ) ) ( AVAILABLE ?auto_2041349 ) ( IN ?auto_2041346 ?auto_2041348 ) ( ON ?auto_2041345 ?auto_2041344 ) ( not ( = ?auto_2041344 ?auto_2041345 ) ) ( not ( = ?auto_2041344 ?auto_2041346 ) ) ( TRUCK-AT ?auto_2041348 ?auto_2041350 ) ( not ( = ?auto_2041350 ?auto_2041347 ) ) ( ON ?auto_2041337 ?auto_2041336 ) ( ON ?auto_2041338 ?auto_2041337 ) ( ON ?auto_2041340 ?auto_2041338 ) ( ON ?auto_2041339 ?auto_2041340 ) ( ON ?auto_2041341 ?auto_2041339 ) ( ON ?auto_2041342 ?auto_2041341 ) ( ON ?auto_2041343 ?auto_2041342 ) ( ON ?auto_2041344 ?auto_2041343 ) ( not ( = ?auto_2041336 ?auto_2041337 ) ) ( not ( = ?auto_2041336 ?auto_2041338 ) ) ( not ( = ?auto_2041336 ?auto_2041340 ) ) ( not ( = ?auto_2041336 ?auto_2041339 ) ) ( not ( = ?auto_2041336 ?auto_2041341 ) ) ( not ( = ?auto_2041336 ?auto_2041342 ) ) ( not ( = ?auto_2041336 ?auto_2041343 ) ) ( not ( = ?auto_2041336 ?auto_2041344 ) ) ( not ( = ?auto_2041336 ?auto_2041345 ) ) ( not ( = ?auto_2041336 ?auto_2041346 ) ) ( not ( = ?auto_2041337 ?auto_2041338 ) ) ( not ( = ?auto_2041337 ?auto_2041340 ) ) ( not ( = ?auto_2041337 ?auto_2041339 ) ) ( not ( = ?auto_2041337 ?auto_2041341 ) ) ( not ( = ?auto_2041337 ?auto_2041342 ) ) ( not ( = ?auto_2041337 ?auto_2041343 ) ) ( not ( = ?auto_2041337 ?auto_2041344 ) ) ( not ( = ?auto_2041337 ?auto_2041345 ) ) ( not ( = ?auto_2041337 ?auto_2041346 ) ) ( not ( = ?auto_2041338 ?auto_2041340 ) ) ( not ( = ?auto_2041338 ?auto_2041339 ) ) ( not ( = ?auto_2041338 ?auto_2041341 ) ) ( not ( = ?auto_2041338 ?auto_2041342 ) ) ( not ( = ?auto_2041338 ?auto_2041343 ) ) ( not ( = ?auto_2041338 ?auto_2041344 ) ) ( not ( = ?auto_2041338 ?auto_2041345 ) ) ( not ( = ?auto_2041338 ?auto_2041346 ) ) ( not ( = ?auto_2041340 ?auto_2041339 ) ) ( not ( = ?auto_2041340 ?auto_2041341 ) ) ( not ( = ?auto_2041340 ?auto_2041342 ) ) ( not ( = ?auto_2041340 ?auto_2041343 ) ) ( not ( = ?auto_2041340 ?auto_2041344 ) ) ( not ( = ?auto_2041340 ?auto_2041345 ) ) ( not ( = ?auto_2041340 ?auto_2041346 ) ) ( not ( = ?auto_2041339 ?auto_2041341 ) ) ( not ( = ?auto_2041339 ?auto_2041342 ) ) ( not ( = ?auto_2041339 ?auto_2041343 ) ) ( not ( = ?auto_2041339 ?auto_2041344 ) ) ( not ( = ?auto_2041339 ?auto_2041345 ) ) ( not ( = ?auto_2041339 ?auto_2041346 ) ) ( not ( = ?auto_2041341 ?auto_2041342 ) ) ( not ( = ?auto_2041341 ?auto_2041343 ) ) ( not ( = ?auto_2041341 ?auto_2041344 ) ) ( not ( = ?auto_2041341 ?auto_2041345 ) ) ( not ( = ?auto_2041341 ?auto_2041346 ) ) ( not ( = ?auto_2041342 ?auto_2041343 ) ) ( not ( = ?auto_2041342 ?auto_2041344 ) ) ( not ( = ?auto_2041342 ?auto_2041345 ) ) ( not ( = ?auto_2041342 ?auto_2041346 ) ) ( not ( = ?auto_2041343 ?auto_2041344 ) ) ( not ( = ?auto_2041343 ?auto_2041345 ) ) ( not ( = ?auto_2041343 ?auto_2041346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041344 ?auto_2041345 ?auto_2041346 )
      ( MAKE-10CRATE-VERIFY ?auto_2041336 ?auto_2041337 ?auto_2041338 ?auto_2041340 ?auto_2041339 ?auto_2041341 ?auto_2041342 ?auto_2041343 ?auto_2041344 ?auto_2041345 ?auto_2041346 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041451 - SURFACE
      ?auto_2041452 - SURFACE
      ?auto_2041453 - SURFACE
      ?auto_2041455 - SURFACE
      ?auto_2041454 - SURFACE
      ?auto_2041456 - SURFACE
      ?auto_2041457 - SURFACE
      ?auto_2041458 - SURFACE
      ?auto_2041459 - SURFACE
      ?auto_2041460 - SURFACE
      ?auto_2041461 - SURFACE
    )
    :vars
    (
      ?auto_2041465 - HOIST
      ?auto_2041466 - PLACE
      ?auto_2041462 - TRUCK
      ?auto_2041464 - PLACE
      ?auto_2041463 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041465 ?auto_2041466 ) ( SURFACE-AT ?auto_2041460 ?auto_2041466 ) ( CLEAR ?auto_2041460 ) ( IS-CRATE ?auto_2041461 ) ( not ( = ?auto_2041460 ?auto_2041461 ) ) ( AVAILABLE ?auto_2041465 ) ( ON ?auto_2041460 ?auto_2041459 ) ( not ( = ?auto_2041459 ?auto_2041460 ) ) ( not ( = ?auto_2041459 ?auto_2041461 ) ) ( TRUCK-AT ?auto_2041462 ?auto_2041464 ) ( not ( = ?auto_2041464 ?auto_2041466 ) ) ( HOIST-AT ?auto_2041463 ?auto_2041464 ) ( LIFTING ?auto_2041463 ?auto_2041461 ) ( not ( = ?auto_2041465 ?auto_2041463 ) ) ( ON ?auto_2041452 ?auto_2041451 ) ( ON ?auto_2041453 ?auto_2041452 ) ( ON ?auto_2041455 ?auto_2041453 ) ( ON ?auto_2041454 ?auto_2041455 ) ( ON ?auto_2041456 ?auto_2041454 ) ( ON ?auto_2041457 ?auto_2041456 ) ( ON ?auto_2041458 ?auto_2041457 ) ( ON ?auto_2041459 ?auto_2041458 ) ( not ( = ?auto_2041451 ?auto_2041452 ) ) ( not ( = ?auto_2041451 ?auto_2041453 ) ) ( not ( = ?auto_2041451 ?auto_2041455 ) ) ( not ( = ?auto_2041451 ?auto_2041454 ) ) ( not ( = ?auto_2041451 ?auto_2041456 ) ) ( not ( = ?auto_2041451 ?auto_2041457 ) ) ( not ( = ?auto_2041451 ?auto_2041458 ) ) ( not ( = ?auto_2041451 ?auto_2041459 ) ) ( not ( = ?auto_2041451 ?auto_2041460 ) ) ( not ( = ?auto_2041451 ?auto_2041461 ) ) ( not ( = ?auto_2041452 ?auto_2041453 ) ) ( not ( = ?auto_2041452 ?auto_2041455 ) ) ( not ( = ?auto_2041452 ?auto_2041454 ) ) ( not ( = ?auto_2041452 ?auto_2041456 ) ) ( not ( = ?auto_2041452 ?auto_2041457 ) ) ( not ( = ?auto_2041452 ?auto_2041458 ) ) ( not ( = ?auto_2041452 ?auto_2041459 ) ) ( not ( = ?auto_2041452 ?auto_2041460 ) ) ( not ( = ?auto_2041452 ?auto_2041461 ) ) ( not ( = ?auto_2041453 ?auto_2041455 ) ) ( not ( = ?auto_2041453 ?auto_2041454 ) ) ( not ( = ?auto_2041453 ?auto_2041456 ) ) ( not ( = ?auto_2041453 ?auto_2041457 ) ) ( not ( = ?auto_2041453 ?auto_2041458 ) ) ( not ( = ?auto_2041453 ?auto_2041459 ) ) ( not ( = ?auto_2041453 ?auto_2041460 ) ) ( not ( = ?auto_2041453 ?auto_2041461 ) ) ( not ( = ?auto_2041455 ?auto_2041454 ) ) ( not ( = ?auto_2041455 ?auto_2041456 ) ) ( not ( = ?auto_2041455 ?auto_2041457 ) ) ( not ( = ?auto_2041455 ?auto_2041458 ) ) ( not ( = ?auto_2041455 ?auto_2041459 ) ) ( not ( = ?auto_2041455 ?auto_2041460 ) ) ( not ( = ?auto_2041455 ?auto_2041461 ) ) ( not ( = ?auto_2041454 ?auto_2041456 ) ) ( not ( = ?auto_2041454 ?auto_2041457 ) ) ( not ( = ?auto_2041454 ?auto_2041458 ) ) ( not ( = ?auto_2041454 ?auto_2041459 ) ) ( not ( = ?auto_2041454 ?auto_2041460 ) ) ( not ( = ?auto_2041454 ?auto_2041461 ) ) ( not ( = ?auto_2041456 ?auto_2041457 ) ) ( not ( = ?auto_2041456 ?auto_2041458 ) ) ( not ( = ?auto_2041456 ?auto_2041459 ) ) ( not ( = ?auto_2041456 ?auto_2041460 ) ) ( not ( = ?auto_2041456 ?auto_2041461 ) ) ( not ( = ?auto_2041457 ?auto_2041458 ) ) ( not ( = ?auto_2041457 ?auto_2041459 ) ) ( not ( = ?auto_2041457 ?auto_2041460 ) ) ( not ( = ?auto_2041457 ?auto_2041461 ) ) ( not ( = ?auto_2041458 ?auto_2041459 ) ) ( not ( = ?auto_2041458 ?auto_2041460 ) ) ( not ( = ?auto_2041458 ?auto_2041461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041459 ?auto_2041460 ?auto_2041461 )
      ( MAKE-10CRATE-VERIFY ?auto_2041451 ?auto_2041452 ?auto_2041453 ?auto_2041455 ?auto_2041454 ?auto_2041456 ?auto_2041457 ?auto_2041458 ?auto_2041459 ?auto_2041460 ?auto_2041461 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041576 - SURFACE
      ?auto_2041577 - SURFACE
      ?auto_2041578 - SURFACE
      ?auto_2041580 - SURFACE
      ?auto_2041579 - SURFACE
      ?auto_2041581 - SURFACE
      ?auto_2041582 - SURFACE
      ?auto_2041583 - SURFACE
      ?auto_2041584 - SURFACE
      ?auto_2041585 - SURFACE
      ?auto_2041586 - SURFACE
    )
    :vars
    (
      ?auto_2041590 - HOIST
      ?auto_2041592 - PLACE
      ?auto_2041588 - TRUCK
      ?auto_2041589 - PLACE
      ?auto_2041591 - HOIST
      ?auto_2041587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041590 ?auto_2041592 ) ( SURFACE-AT ?auto_2041585 ?auto_2041592 ) ( CLEAR ?auto_2041585 ) ( IS-CRATE ?auto_2041586 ) ( not ( = ?auto_2041585 ?auto_2041586 ) ) ( AVAILABLE ?auto_2041590 ) ( ON ?auto_2041585 ?auto_2041584 ) ( not ( = ?auto_2041584 ?auto_2041585 ) ) ( not ( = ?auto_2041584 ?auto_2041586 ) ) ( TRUCK-AT ?auto_2041588 ?auto_2041589 ) ( not ( = ?auto_2041589 ?auto_2041592 ) ) ( HOIST-AT ?auto_2041591 ?auto_2041589 ) ( not ( = ?auto_2041590 ?auto_2041591 ) ) ( AVAILABLE ?auto_2041591 ) ( SURFACE-AT ?auto_2041586 ?auto_2041589 ) ( ON ?auto_2041586 ?auto_2041587 ) ( CLEAR ?auto_2041586 ) ( not ( = ?auto_2041585 ?auto_2041587 ) ) ( not ( = ?auto_2041586 ?auto_2041587 ) ) ( not ( = ?auto_2041584 ?auto_2041587 ) ) ( ON ?auto_2041577 ?auto_2041576 ) ( ON ?auto_2041578 ?auto_2041577 ) ( ON ?auto_2041580 ?auto_2041578 ) ( ON ?auto_2041579 ?auto_2041580 ) ( ON ?auto_2041581 ?auto_2041579 ) ( ON ?auto_2041582 ?auto_2041581 ) ( ON ?auto_2041583 ?auto_2041582 ) ( ON ?auto_2041584 ?auto_2041583 ) ( not ( = ?auto_2041576 ?auto_2041577 ) ) ( not ( = ?auto_2041576 ?auto_2041578 ) ) ( not ( = ?auto_2041576 ?auto_2041580 ) ) ( not ( = ?auto_2041576 ?auto_2041579 ) ) ( not ( = ?auto_2041576 ?auto_2041581 ) ) ( not ( = ?auto_2041576 ?auto_2041582 ) ) ( not ( = ?auto_2041576 ?auto_2041583 ) ) ( not ( = ?auto_2041576 ?auto_2041584 ) ) ( not ( = ?auto_2041576 ?auto_2041585 ) ) ( not ( = ?auto_2041576 ?auto_2041586 ) ) ( not ( = ?auto_2041576 ?auto_2041587 ) ) ( not ( = ?auto_2041577 ?auto_2041578 ) ) ( not ( = ?auto_2041577 ?auto_2041580 ) ) ( not ( = ?auto_2041577 ?auto_2041579 ) ) ( not ( = ?auto_2041577 ?auto_2041581 ) ) ( not ( = ?auto_2041577 ?auto_2041582 ) ) ( not ( = ?auto_2041577 ?auto_2041583 ) ) ( not ( = ?auto_2041577 ?auto_2041584 ) ) ( not ( = ?auto_2041577 ?auto_2041585 ) ) ( not ( = ?auto_2041577 ?auto_2041586 ) ) ( not ( = ?auto_2041577 ?auto_2041587 ) ) ( not ( = ?auto_2041578 ?auto_2041580 ) ) ( not ( = ?auto_2041578 ?auto_2041579 ) ) ( not ( = ?auto_2041578 ?auto_2041581 ) ) ( not ( = ?auto_2041578 ?auto_2041582 ) ) ( not ( = ?auto_2041578 ?auto_2041583 ) ) ( not ( = ?auto_2041578 ?auto_2041584 ) ) ( not ( = ?auto_2041578 ?auto_2041585 ) ) ( not ( = ?auto_2041578 ?auto_2041586 ) ) ( not ( = ?auto_2041578 ?auto_2041587 ) ) ( not ( = ?auto_2041580 ?auto_2041579 ) ) ( not ( = ?auto_2041580 ?auto_2041581 ) ) ( not ( = ?auto_2041580 ?auto_2041582 ) ) ( not ( = ?auto_2041580 ?auto_2041583 ) ) ( not ( = ?auto_2041580 ?auto_2041584 ) ) ( not ( = ?auto_2041580 ?auto_2041585 ) ) ( not ( = ?auto_2041580 ?auto_2041586 ) ) ( not ( = ?auto_2041580 ?auto_2041587 ) ) ( not ( = ?auto_2041579 ?auto_2041581 ) ) ( not ( = ?auto_2041579 ?auto_2041582 ) ) ( not ( = ?auto_2041579 ?auto_2041583 ) ) ( not ( = ?auto_2041579 ?auto_2041584 ) ) ( not ( = ?auto_2041579 ?auto_2041585 ) ) ( not ( = ?auto_2041579 ?auto_2041586 ) ) ( not ( = ?auto_2041579 ?auto_2041587 ) ) ( not ( = ?auto_2041581 ?auto_2041582 ) ) ( not ( = ?auto_2041581 ?auto_2041583 ) ) ( not ( = ?auto_2041581 ?auto_2041584 ) ) ( not ( = ?auto_2041581 ?auto_2041585 ) ) ( not ( = ?auto_2041581 ?auto_2041586 ) ) ( not ( = ?auto_2041581 ?auto_2041587 ) ) ( not ( = ?auto_2041582 ?auto_2041583 ) ) ( not ( = ?auto_2041582 ?auto_2041584 ) ) ( not ( = ?auto_2041582 ?auto_2041585 ) ) ( not ( = ?auto_2041582 ?auto_2041586 ) ) ( not ( = ?auto_2041582 ?auto_2041587 ) ) ( not ( = ?auto_2041583 ?auto_2041584 ) ) ( not ( = ?auto_2041583 ?auto_2041585 ) ) ( not ( = ?auto_2041583 ?auto_2041586 ) ) ( not ( = ?auto_2041583 ?auto_2041587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041584 ?auto_2041585 ?auto_2041586 )
      ( MAKE-10CRATE-VERIFY ?auto_2041576 ?auto_2041577 ?auto_2041578 ?auto_2041580 ?auto_2041579 ?auto_2041581 ?auto_2041582 ?auto_2041583 ?auto_2041584 ?auto_2041585 ?auto_2041586 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041702 - SURFACE
      ?auto_2041703 - SURFACE
      ?auto_2041704 - SURFACE
      ?auto_2041706 - SURFACE
      ?auto_2041705 - SURFACE
      ?auto_2041707 - SURFACE
      ?auto_2041708 - SURFACE
      ?auto_2041709 - SURFACE
      ?auto_2041710 - SURFACE
      ?auto_2041711 - SURFACE
      ?auto_2041712 - SURFACE
    )
    :vars
    (
      ?auto_2041717 - HOIST
      ?auto_2041718 - PLACE
      ?auto_2041716 - PLACE
      ?auto_2041714 - HOIST
      ?auto_2041715 - SURFACE
      ?auto_2041713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041717 ?auto_2041718 ) ( SURFACE-AT ?auto_2041711 ?auto_2041718 ) ( CLEAR ?auto_2041711 ) ( IS-CRATE ?auto_2041712 ) ( not ( = ?auto_2041711 ?auto_2041712 ) ) ( AVAILABLE ?auto_2041717 ) ( ON ?auto_2041711 ?auto_2041710 ) ( not ( = ?auto_2041710 ?auto_2041711 ) ) ( not ( = ?auto_2041710 ?auto_2041712 ) ) ( not ( = ?auto_2041716 ?auto_2041718 ) ) ( HOIST-AT ?auto_2041714 ?auto_2041716 ) ( not ( = ?auto_2041717 ?auto_2041714 ) ) ( AVAILABLE ?auto_2041714 ) ( SURFACE-AT ?auto_2041712 ?auto_2041716 ) ( ON ?auto_2041712 ?auto_2041715 ) ( CLEAR ?auto_2041712 ) ( not ( = ?auto_2041711 ?auto_2041715 ) ) ( not ( = ?auto_2041712 ?auto_2041715 ) ) ( not ( = ?auto_2041710 ?auto_2041715 ) ) ( TRUCK-AT ?auto_2041713 ?auto_2041718 ) ( ON ?auto_2041703 ?auto_2041702 ) ( ON ?auto_2041704 ?auto_2041703 ) ( ON ?auto_2041706 ?auto_2041704 ) ( ON ?auto_2041705 ?auto_2041706 ) ( ON ?auto_2041707 ?auto_2041705 ) ( ON ?auto_2041708 ?auto_2041707 ) ( ON ?auto_2041709 ?auto_2041708 ) ( ON ?auto_2041710 ?auto_2041709 ) ( not ( = ?auto_2041702 ?auto_2041703 ) ) ( not ( = ?auto_2041702 ?auto_2041704 ) ) ( not ( = ?auto_2041702 ?auto_2041706 ) ) ( not ( = ?auto_2041702 ?auto_2041705 ) ) ( not ( = ?auto_2041702 ?auto_2041707 ) ) ( not ( = ?auto_2041702 ?auto_2041708 ) ) ( not ( = ?auto_2041702 ?auto_2041709 ) ) ( not ( = ?auto_2041702 ?auto_2041710 ) ) ( not ( = ?auto_2041702 ?auto_2041711 ) ) ( not ( = ?auto_2041702 ?auto_2041712 ) ) ( not ( = ?auto_2041702 ?auto_2041715 ) ) ( not ( = ?auto_2041703 ?auto_2041704 ) ) ( not ( = ?auto_2041703 ?auto_2041706 ) ) ( not ( = ?auto_2041703 ?auto_2041705 ) ) ( not ( = ?auto_2041703 ?auto_2041707 ) ) ( not ( = ?auto_2041703 ?auto_2041708 ) ) ( not ( = ?auto_2041703 ?auto_2041709 ) ) ( not ( = ?auto_2041703 ?auto_2041710 ) ) ( not ( = ?auto_2041703 ?auto_2041711 ) ) ( not ( = ?auto_2041703 ?auto_2041712 ) ) ( not ( = ?auto_2041703 ?auto_2041715 ) ) ( not ( = ?auto_2041704 ?auto_2041706 ) ) ( not ( = ?auto_2041704 ?auto_2041705 ) ) ( not ( = ?auto_2041704 ?auto_2041707 ) ) ( not ( = ?auto_2041704 ?auto_2041708 ) ) ( not ( = ?auto_2041704 ?auto_2041709 ) ) ( not ( = ?auto_2041704 ?auto_2041710 ) ) ( not ( = ?auto_2041704 ?auto_2041711 ) ) ( not ( = ?auto_2041704 ?auto_2041712 ) ) ( not ( = ?auto_2041704 ?auto_2041715 ) ) ( not ( = ?auto_2041706 ?auto_2041705 ) ) ( not ( = ?auto_2041706 ?auto_2041707 ) ) ( not ( = ?auto_2041706 ?auto_2041708 ) ) ( not ( = ?auto_2041706 ?auto_2041709 ) ) ( not ( = ?auto_2041706 ?auto_2041710 ) ) ( not ( = ?auto_2041706 ?auto_2041711 ) ) ( not ( = ?auto_2041706 ?auto_2041712 ) ) ( not ( = ?auto_2041706 ?auto_2041715 ) ) ( not ( = ?auto_2041705 ?auto_2041707 ) ) ( not ( = ?auto_2041705 ?auto_2041708 ) ) ( not ( = ?auto_2041705 ?auto_2041709 ) ) ( not ( = ?auto_2041705 ?auto_2041710 ) ) ( not ( = ?auto_2041705 ?auto_2041711 ) ) ( not ( = ?auto_2041705 ?auto_2041712 ) ) ( not ( = ?auto_2041705 ?auto_2041715 ) ) ( not ( = ?auto_2041707 ?auto_2041708 ) ) ( not ( = ?auto_2041707 ?auto_2041709 ) ) ( not ( = ?auto_2041707 ?auto_2041710 ) ) ( not ( = ?auto_2041707 ?auto_2041711 ) ) ( not ( = ?auto_2041707 ?auto_2041712 ) ) ( not ( = ?auto_2041707 ?auto_2041715 ) ) ( not ( = ?auto_2041708 ?auto_2041709 ) ) ( not ( = ?auto_2041708 ?auto_2041710 ) ) ( not ( = ?auto_2041708 ?auto_2041711 ) ) ( not ( = ?auto_2041708 ?auto_2041712 ) ) ( not ( = ?auto_2041708 ?auto_2041715 ) ) ( not ( = ?auto_2041709 ?auto_2041710 ) ) ( not ( = ?auto_2041709 ?auto_2041711 ) ) ( not ( = ?auto_2041709 ?auto_2041712 ) ) ( not ( = ?auto_2041709 ?auto_2041715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041710 ?auto_2041711 ?auto_2041712 )
      ( MAKE-10CRATE-VERIFY ?auto_2041702 ?auto_2041703 ?auto_2041704 ?auto_2041706 ?auto_2041705 ?auto_2041707 ?auto_2041708 ?auto_2041709 ?auto_2041710 ?auto_2041711 ?auto_2041712 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041828 - SURFACE
      ?auto_2041829 - SURFACE
      ?auto_2041830 - SURFACE
      ?auto_2041832 - SURFACE
      ?auto_2041831 - SURFACE
      ?auto_2041833 - SURFACE
      ?auto_2041834 - SURFACE
      ?auto_2041835 - SURFACE
      ?auto_2041836 - SURFACE
      ?auto_2041837 - SURFACE
      ?auto_2041838 - SURFACE
    )
    :vars
    (
      ?auto_2041840 - HOIST
      ?auto_2041839 - PLACE
      ?auto_2041842 - PLACE
      ?auto_2041841 - HOIST
      ?auto_2041844 - SURFACE
      ?auto_2041843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041840 ?auto_2041839 ) ( IS-CRATE ?auto_2041838 ) ( not ( = ?auto_2041837 ?auto_2041838 ) ) ( not ( = ?auto_2041836 ?auto_2041837 ) ) ( not ( = ?auto_2041836 ?auto_2041838 ) ) ( not ( = ?auto_2041842 ?auto_2041839 ) ) ( HOIST-AT ?auto_2041841 ?auto_2041842 ) ( not ( = ?auto_2041840 ?auto_2041841 ) ) ( AVAILABLE ?auto_2041841 ) ( SURFACE-AT ?auto_2041838 ?auto_2041842 ) ( ON ?auto_2041838 ?auto_2041844 ) ( CLEAR ?auto_2041838 ) ( not ( = ?auto_2041837 ?auto_2041844 ) ) ( not ( = ?auto_2041838 ?auto_2041844 ) ) ( not ( = ?auto_2041836 ?auto_2041844 ) ) ( TRUCK-AT ?auto_2041843 ?auto_2041839 ) ( SURFACE-AT ?auto_2041836 ?auto_2041839 ) ( CLEAR ?auto_2041836 ) ( LIFTING ?auto_2041840 ?auto_2041837 ) ( IS-CRATE ?auto_2041837 ) ( ON ?auto_2041829 ?auto_2041828 ) ( ON ?auto_2041830 ?auto_2041829 ) ( ON ?auto_2041832 ?auto_2041830 ) ( ON ?auto_2041831 ?auto_2041832 ) ( ON ?auto_2041833 ?auto_2041831 ) ( ON ?auto_2041834 ?auto_2041833 ) ( ON ?auto_2041835 ?auto_2041834 ) ( ON ?auto_2041836 ?auto_2041835 ) ( not ( = ?auto_2041828 ?auto_2041829 ) ) ( not ( = ?auto_2041828 ?auto_2041830 ) ) ( not ( = ?auto_2041828 ?auto_2041832 ) ) ( not ( = ?auto_2041828 ?auto_2041831 ) ) ( not ( = ?auto_2041828 ?auto_2041833 ) ) ( not ( = ?auto_2041828 ?auto_2041834 ) ) ( not ( = ?auto_2041828 ?auto_2041835 ) ) ( not ( = ?auto_2041828 ?auto_2041836 ) ) ( not ( = ?auto_2041828 ?auto_2041837 ) ) ( not ( = ?auto_2041828 ?auto_2041838 ) ) ( not ( = ?auto_2041828 ?auto_2041844 ) ) ( not ( = ?auto_2041829 ?auto_2041830 ) ) ( not ( = ?auto_2041829 ?auto_2041832 ) ) ( not ( = ?auto_2041829 ?auto_2041831 ) ) ( not ( = ?auto_2041829 ?auto_2041833 ) ) ( not ( = ?auto_2041829 ?auto_2041834 ) ) ( not ( = ?auto_2041829 ?auto_2041835 ) ) ( not ( = ?auto_2041829 ?auto_2041836 ) ) ( not ( = ?auto_2041829 ?auto_2041837 ) ) ( not ( = ?auto_2041829 ?auto_2041838 ) ) ( not ( = ?auto_2041829 ?auto_2041844 ) ) ( not ( = ?auto_2041830 ?auto_2041832 ) ) ( not ( = ?auto_2041830 ?auto_2041831 ) ) ( not ( = ?auto_2041830 ?auto_2041833 ) ) ( not ( = ?auto_2041830 ?auto_2041834 ) ) ( not ( = ?auto_2041830 ?auto_2041835 ) ) ( not ( = ?auto_2041830 ?auto_2041836 ) ) ( not ( = ?auto_2041830 ?auto_2041837 ) ) ( not ( = ?auto_2041830 ?auto_2041838 ) ) ( not ( = ?auto_2041830 ?auto_2041844 ) ) ( not ( = ?auto_2041832 ?auto_2041831 ) ) ( not ( = ?auto_2041832 ?auto_2041833 ) ) ( not ( = ?auto_2041832 ?auto_2041834 ) ) ( not ( = ?auto_2041832 ?auto_2041835 ) ) ( not ( = ?auto_2041832 ?auto_2041836 ) ) ( not ( = ?auto_2041832 ?auto_2041837 ) ) ( not ( = ?auto_2041832 ?auto_2041838 ) ) ( not ( = ?auto_2041832 ?auto_2041844 ) ) ( not ( = ?auto_2041831 ?auto_2041833 ) ) ( not ( = ?auto_2041831 ?auto_2041834 ) ) ( not ( = ?auto_2041831 ?auto_2041835 ) ) ( not ( = ?auto_2041831 ?auto_2041836 ) ) ( not ( = ?auto_2041831 ?auto_2041837 ) ) ( not ( = ?auto_2041831 ?auto_2041838 ) ) ( not ( = ?auto_2041831 ?auto_2041844 ) ) ( not ( = ?auto_2041833 ?auto_2041834 ) ) ( not ( = ?auto_2041833 ?auto_2041835 ) ) ( not ( = ?auto_2041833 ?auto_2041836 ) ) ( not ( = ?auto_2041833 ?auto_2041837 ) ) ( not ( = ?auto_2041833 ?auto_2041838 ) ) ( not ( = ?auto_2041833 ?auto_2041844 ) ) ( not ( = ?auto_2041834 ?auto_2041835 ) ) ( not ( = ?auto_2041834 ?auto_2041836 ) ) ( not ( = ?auto_2041834 ?auto_2041837 ) ) ( not ( = ?auto_2041834 ?auto_2041838 ) ) ( not ( = ?auto_2041834 ?auto_2041844 ) ) ( not ( = ?auto_2041835 ?auto_2041836 ) ) ( not ( = ?auto_2041835 ?auto_2041837 ) ) ( not ( = ?auto_2041835 ?auto_2041838 ) ) ( not ( = ?auto_2041835 ?auto_2041844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041836 ?auto_2041837 ?auto_2041838 )
      ( MAKE-10CRATE-VERIFY ?auto_2041828 ?auto_2041829 ?auto_2041830 ?auto_2041832 ?auto_2041831 ?auto_2041833 ?auto_2041834 ?auto_2041835 ?auto_2041836 ?auto_2041837 ?auto_2041838 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041954 - SURFACE
      ?auto_2041955 - SURFACE
      ?auto_2041956 - SURFACE
      ?auto_2041958 - SURFACE
      ?auto_2041957 - SURFACE
      ?auto_2041959 - SURFACE
      ?auto_2041960 - SURFACE
      ?auto_2041961 - SURFACE
      ?auto_2041962 - SURFACE
      ?auto_2041963 - SURFACE
      ?auto_2041964 - SURFACE
    )
    :vars
    (
      ?auto_2041968 - HOIST
      ?auto_2041967 - PLACE
      ?auto_2041965 - PLACE
      ?auto_2041969 - HOIST
      ?auto_2041970 - SURFACE
      ?auto_2041966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041968 ?auto_2041967 ) ( IS-CRATE ?auto_2041964 ) ( not ( = ?auto_2041963 ?auto_2041964 ) ) ( not ( = ?auto_2041962 ?auto_2041963 ) ) ( not ( = ?auto_2041962 ?auto_2041964 ) ) ( not ( = ?auto_2041965 ?auto_2041967 ) ) ( HOIST-AT ?auto_2041969 ?auto_2041965 ) ( not ( = ?auto_2041968 ?auto_2041969 ) ) ( AVAILABLE ?auto_2041969 ) ( SURFACE-AT ?auto_2041964 ?auto_2041965 ) ( ON ?auto_2041964 ?auto_2041970 ) ( CLEAR ?auto_2041964 ) ( not ( = ?auto_2041963 ?auto_2041970 ) ) ( not ( = ?auto_2041964 ?auto_2041970 ) ) ( not ( = ?auto_2041962 ?auto_2041970 ) ) ( TRUCK-AT ?auto_2041966 ?auto_2041967 ) ( SURFACE-AT ?auto_2041962 ?auto_2041967 ) ( CLEAR ?auto_2041962 ) ( IS-CRATE ?auto_2041963 ) ( AVAILABLE ?auto_2041968 ) ( IN ?auto_2041963 ?auto_2041966 ) ( ON ?auto_2041955 ?auto_2041954 ) ( ON ?auto_2041956 ?auto_2041955 ) ( ON ?auto_2041958 ?auto_2041956 ) ( ON ?auto_2041957 ?auto_2041958 ) ( ON ?auto_2041959 ?auto_2041957 ) ( ON ?auto_2041960 ?auto_2041959 ) ( ON ?auto_2041961 ?auto_2041960 ) ( ON ?auto_2041962 ?auto_2041961 ) ( not ( = ?auto_2041954 ?auto_2041955 ) ) ( not ( = ?auto_2041954 ?auto_2041956 ) ) ( not ( = ?auto_2041954 ?auto_2041958 ) ) ( not ( = ?auto_2041954 ?auto_2041957 ) ) ( not ( = ?auto_2041954 ?auto_2041959 ) ) ( not ( = ?auto_2041954 ?auto_2041960 ) ) ( not ( = ?auto_2041954 ?auto_2041961 ) ) ( not ( = ?auto_2041954 ?auto_2041962 ) ) ( not ( = ?auto_2041954 ?auto_2041963 ) ) ( not ( = ?auto_2041954 ?auto_2041964 ) ) ( not ( = ?auto_2041954 ?auto_2041970 ) ) ( not ( = ?auto_2041955 ?auto_2041956 ) ) ( not ( = ?auto_2041955 ?auto_2041958 ) ) ( not ( = ?auto_2041955 ?auto_2041957 ) ) ( not ( = ?auto_2041955 ?auto_2041959 ) ) ( not ( = ?auto_2041955 ?auto_2041960 ) ) ( not ( = ?auto_2041955 ?auto_2041961 ) ) ( not ( = ?auto_2041955 ?auto_2041962 ) ) ( not ( = ?auto_2041955 ?auto_2041963 ) ) ( not ( = ?auto_2041955 ?auto_2041964 ) ) ( not ( = ?auto_2041955 ?auto_2041970 ) ) ( not ( = ?auto_2041956 ?auto_2041958 ) ) ( not ( = ?auto_2041956 ?auto_2041957 ) ) ( not ( = ?auto_2041956 ?auto_2041959 ) ) ( not ( = ?auto_2041956 ?auto_2041960 ) ) ( not ( = ?auto_2041956 ?auto_2041961 ) ) ( not ( = ?auto_2041956 ?auto_2041962 ) ) ( not ( = ?auto_2041956 ?auto_2041963 ) ) ( not ( = ?auto_2041956 ?auto_2041964 ) ) ( not ( = ?auto_2041956 ?auto_2041970 ) ) ( not ( = ?auto_2041958 ?auto_2041957 ) ) ( not ( = ?auto_2041958 ?auto_2041959 ) ) ( not ( = ?auto_2041958 ?auto_2041960 ) ) ( not ( = ?auto_2041958 ?auto_2041961 ) ) ( not ( = ?auto_2041958 ?auto_2041962 ) ) ( not ( = ?auto_2041958 ?auto_2041963 ) ) ( not ( = ?auto_2041958 ?auto_2041964 ) ) ( not ( = ?auto_2041958 ?auto_2041970 ) ) ( not ( = ?auto_2041957 ?auto_2041959 ) ) ( not ( = ?auto_2041957 ?auto_2041960 ) ) ( not ( = ?auto_2041957 ?auto_2041961 ) ) ( not ( = ?auto_2041957 ?auto_2041962 ) ) ( not ( = ?auto_2041957 ?auto_2041963 ) ) ( not ( = ?auto_2041957 ?auto_2041964 ) ) ( not ( = ?auto_2041957 ?auto_2041970 ) ) ( not ( = ?auto_2041959 ?auto_2041960 ) ) ( not ( = ?auto_2041959 ?auto_2041961 ) ) ( not ( = ?auto_2041959 ?auto_2041962 ) ) ( not ( = ?auto_2041959 ?auto_2041963 ) ) ( not ( = ?auto_2041959 ?auto_2041964 ) ) ( not ( = ?auto_2041959 ?auto_2041970 ) ) ( not ( = ?auto_2041960 ?auto_2041961 ) ) ( not ( = ?auto_2041960 ?auto_2041962 ) ) ( not ( = ?auto_2041960 ?auto_2041963 ) ) ( not ( = ?auto_2041960 ?auto_2041964 ) ) ( not ( = ?auto_2041960 ?auto_2041970 ) ) ( not ( = ?auto_2041961 ?auto_2041962 ) ) ( not ( = ?auto_2041961 ?auto_2041963 ) ) ( not ( = ?auto_2041961 ?auto_2041964 ) ) ( not ( = ?auto_2041961 ?auto_2041970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041962 ?auto_2041963 ?auto_2041964 )
      ( MAKE-10CRATE-VERIFY ?auto_2041954 ?auto_2041955 ?auto_2041956 ?auto_2041958 ?auto_2041957 ?auto_2041959 ?auto_2041960 ?auto_2041961 ?auto_2041962 ?auto_2041963 ?auto_2041964 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049198 - SURFACE
      ?auto_2049199 - SURFACE
      ?auto_2049200 - SURFACE
      ?auto_2049202 - SURFACE
      ?auto_2049201 - SURFACE
      ?auto_2049203 - SURFACE
      ?auto_2049204 - SURFACE
      ?auto_2049205 - SURFACE
      ?auto_2049206 - SURFACE
      ?auto_2049207 - SURFACE
      ?auto_2049208 - SURFACE
      ?auto_2049209 - SURFACE
    )
    :vars
    (
      ?auto_2049210 - HOIST
      ?auto_2049211 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049210 ?auto_2049211 ) ( SURFACE-AT ?auto_2049208 ?auto_2049211 ) ( CLEAR ?auto_2049208 ) ( LIFTING ?auto_2049210 ?auto_2049209 ) ( IS-CRATE ?auto_2049209 ) ( not ( = ?auto_2049208 ?auto_2049209 ) ) ( ON ?auto_2049199 ?auto_2049198 ) ( ON ?auto_2049200 ?auto_2049199 ) ( ON ?auto_2049202 ?auto_2049200 ) ( ON ?auto_2049201 ?auto_2049202 ) ( ON ?auto_2049203 ?auto_2049201 ) ( ON ?auto_2049204 ?auto_2049203 ) ( ON ?auto_2049205 ?auto_2049204 ) ( ON ?auto_2049206 ?auto_2049205 ) ( ON ?auto_2049207 ?auto_2049206 ) ( ON ?auto_2049208 ?auto_2049207 ) ( not ( = ?auto_2049198 ?auto_2049199 ) ) ( not ( = ?auto_2049198 ?auto_2049200 ) ) ( not ( = ?auto_2049198 ?auto_2049202 ) ) ( not ( = ?auto_2049198 ?auto_2049201 ) ) ( not ( = ?auto_2049198 ?auto_2049203 ) ) ( not ( = ?auto_2049198 ?auto_2049204 ) ) ( not ( = ?auto_2049198 ?auto_2049205 ) ) ( not ( = ?auto_2049198 ?auto_2049206 ) ) ( not ( = ?auto_2049198 ?auto_2049207 ) ) ( not ( = ?auto_2049198 ?auto_2049208 ) ) ( not ( = ?auto_2049198 ?auto_2049209 ) ) ( not ( = ?auto_2049199 ?auto_2049200 ) ) ( not ( = ?auto_2049199 ?auto_2049202 ) ) ( not ( = ?auto_2049199 ?auto_2049201 ) ) ( not ( = ?auto_2049199 ?auto_2049203 ) ) ( not ( = ?auto_2049199 ?auto_2049204 ) ) ( not ( = ?auto_2049199 ?auto_2049205 ) ) ( not ( = ?auto_2049199 ?auto_2049206 ) ) ( not ( = ?auto_2049199 ?auto_2049207 ) ) ( not ( = ?auto_2049199 ?auto_2049208 ) ) ( not ( = ?auto_2049199 ?auto_2049209 ) ) ( not ( = ?auto_2049200 ?auto_2049202 ) ) ( not ( = ?auto_2049200 ?auto_2049201 ) ) ( not ( = ?auto_2049200 ?auto_2049203 ) ) ( not ( = ?auto_2049200 ?auto_2049204 ) ) ( not ( = ?auto_2049200 ?auto_2049205 ) ) ( not ( = ?auto_2049200 ?auto_2049206 ) ) ( not ( = ?auto_2049200 ?auto_2049207 ) ) ( not ( = ?auto_2049200 ?auto_2049208 ) ) ( not ( = ?auto_2049200 ?auto_2049209 ) ) ( not ( = ?auto_2049202 ?auto_2049201 ) ) ( not ( = ?auto_2049202 ?auto_2049203 ) ) ( not ( = ?auto_2049202 ?auto_2049204 ) ) ( not ( = ?auto_2049202 ?auto_2049205 ) ) ( not ( = ?auto_2049202 ?auto_2049206 ) ) ( not ( = ?auto_2049202 ?auto_2049207 ) ) ( not ( = ?auto_2049202 ?auto_2049208 ) ) ( not ( = ?auto_2049202 ?auto_2049209 ) ) ( not ( = ?auto_2049201 ?auto_2049203 ) ) ( not ( = ?auto_2049201 ?auto_2049204 ) ) ( not ( = ?auto_2049201 ?auto_2049205 ) ) ( not ( = ?auto_2049201 ?auto_2049206 ) ) ( not ( = ?auto_2049201 ?auto_2049207 ) ) ( not ( = ?auto_2049201 ?auto_2049208 ) ) ( not ( = ?auto_2049201 ?auto_2049209 ) ) ( not ( = ?auto_2049203 ?auto_2049204 ) ) ( not ( = ?auto_2049203 ?auto_2049205 ) ) ( not ( = ?auto_2049203 ?auto_2049206 ) ) ( not ( = ?auto_2049203 ?auto_2049207 ) ) ( not ( = ?auto_2049203 ?auto_2049208 ) ) ( not ( = ?auto_2049203 ?auto_2049209 ) ) ( not ( = ?auto_2049204 ?auto_2049205 ) ) ( not ( = ?auto_2049204 ?auto_2049206 ) ) ( not ( = ?auto_2049204 ?auto_2049207 ) ) ( not ( = ?auto_2049204 ?auto_2049208 ) ) ( not ( = ?auto_2049204 ?auto_2049209 ) ) ( not ( = ?auto_2049205 ?auto_2049206 ) ) ( not ( = ?auto_2049205 ?auto_2049207 ) ) ( not ( = ?auto_2049205 ?auto_2049208 ) ) ( not ( = ?auto_2049205 ?auto_2049209 ) ) ( not ( = ?auto_2049206 ?auto_2049207 ) ) ( not ( = ?auto_2049206 ?auto_2049208 ) ) ( not ( = ?auto_2049206 ?auto_2049209 ) ) ( not ( = ?auto_2049207 ?auto_2049208 ) ) ( not ( = ?auto_2049207 ?auto_2049209 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2049208 ?auto_2049209 )
      ( MAKE-11CRATE-VERIFY ?auto_2049198 ?auto_2049199 ?auto_2049200 ?auto_2049202 ?auto_2049201 ?auto_2049203 ?auto_2049204 ?auto_2049205 ?auto_2049206 ?auto_2049207 ?auto_2049208 ?auto_2049209 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049307 - SURFACE
      ?auto_2049308 - SURFACE
      ?auto_2049309 - SURFACE
      ?auto_2049311 - SURFACE
      ?auto_2049310 - SURFACE
      ?auto_2049312 - SURFACE
      ?auto_2049313 - SURFACE
      ?auto_2049314 - SURFACE
      ?auto_2049315 - SURFACE
      ?auto_2049316 - SURFACE
      ?auto_2049317 - SURFACE
      ?auto_2049318 - SURFACE
    )
    :vars
    (
      ?auto_2049320 - HOIST
      ?auto_2049321 - PLACE
      ?auto_2049319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049320 ?auto_2049321 ) ( SURFACE-AT ?auto_2049317 ?auto_2049321 ) ( CLEAR ?auto_2049317 ) ( IS-CRATE ?auto_2049318 ) ( not ( = ?auto_2049317 ?auto_2049318 ) ) ( TRUCK-AT ?auto_2049319 ?auto_2049321 ) ( AVAILABLE ?auto_2049320 ) ( IN ?auto_2049318 ?auto_2049319 ) ( ON ?auto_2049317 ?auto_2049316 ) ( not ( = ?auto_2049316 ?auto_2049317 ) ) ( not ( = ?auto_2049316 ?auto_2049318 ) ) ( ON ?auto_2049308 ?auto_2049307 ) ( ON ?auto_2049309 ?auto_2049308 ) ( ON ?auto_2049311 ?auto_2049309 ) ( ON ?auto_2049310 ?auto_2049311 ) ( ON ?auto_2049312 ?auto_2049310 ) ( ON ?auto_2049313 ?auto_2049312 ) ( ON ?auto_2049314 ?auto_2049313 ) ( ON ?auto_2049315 ?auto_2049314 ) ( ON ?auto_2049316 ?auto_2049315 ) ( not ( = ?auto_2049307 ?auto_2049308 ) ) ( not ( = ?auto_2049307 ?auto_2049309 ) ) ( not ( = ?auto_2049307 ?auto_2049311 ) ) ( not ( = ?auto_2049307 ?auto_2049310 ) ) ( not ( = ?auto_2049307 ?auto_2049312 ) ) ( not ( = ?auto_2049307 ?auto_2049313 ) ) ( not ( = ?auto_2049307 ?auto_2049314 ) ) ( not ( = ?auto_2049307 ?auto_2049315 ) ) ( not ( = ?auto_2049307 ?auto_2049316 ) ) ( not ( = ?auto_2049307 ?auto_2049317 ) ) ( not ( = ?auto_2049307 ?auto_2049318 ) ) ( not ( = ?auto_2049308 ?auto_2049309 ) ) ( not ( = ?auto_2049308 ?auto_2049311 ) ) ( not ( = ?auto_2049308 ?auto_2049310 ) ) ( not ( = ?auto_2049308 ?auto_2049312 ) ) ( not ( = ?auto_2049308 ?auto_2049313 ) ) ( not ( = ?auto_2049308 ?auto_2049314 ) ) ( not ( = ?auto_2049308 ?auto_2049315 ) ) ( not ( = ?auto_2049308 ?auto_2049316 ) ) ( not ( = ?auto_2049308 ?auto_2049317 ) ) ( not ( = ?auto_2049308 ?auto_2049318 ) ) ( not ( = ?auto_2049309 ?auto_2049311 ) ) ( not ( = ?auto_2049309 ?auto_2049310 ) ) ( not ( = ?auto_2049309 ?auto_2049312 ) ) ( not ( = ?auto_2049309 ?auto_2049313 ) ) ( not ( = ?auto_2049309 ?auto_2049314 ) ) ( not ( = ?auto_2049309 ?auto_2049315 ) ) ( not ( = ?auto_2049309 ?auto_2049316 ) ) ( not ( = ?auto_2049309 ?auto_2049317 ) ) ( not ( = ?auto_2049309 ?auto_2049318 ) ) ( not ( = ?auto_2049311 ?auto_2049310 ) ) ( not ( = ?auto_2049311 ?auto_2049312 ) ) ( not ( = ?auto_2049311 ?auto_2049313 ) ) ( not ( = ?auto_2049311 ?auto_2049314 ) ) ( not ( = ?auto_2049311 ?auto_2049315 ) ) ( not ( = ?auto_2049311 ?auto_2049316 ) ) ( not ( = ?auto_2049311 ?auto_2049317 ) ) ( not ( = ?auto_2049311 ?auto_2049318 ) ) ( not ( = ?auto_2049310 ?auto_2049312 ) ) ( not ( = ?auto_2049310 ?auto_2049313 ) ) ( not ( = ?auto_2049310 ?auto_2049314 ) ) ( not ( = ?auto_2049310 ?auto_2049315 ) ) ( not ( = ?auto_2049310 ?auto_2049316 ) ) ( not ( = ?auto_2049310 ?auto_2049317 ) ) ( not ( = ?auto_2049310 ?auto_2049318 ) ) ( not ( = ?auto_2049312 ?auto_2049313 ) ) ( not ( = ?auto_2049312 ?auto_2049314 ) ) ( not ( = ?auto_2049312 ?auto_2049315 ) ) ( not ( = ?auto_2049312 ?auto_2049316 ) ) ( not ( = ?auto_2049312 ?auto_2049317 ) ) ( not ( = ?auto_2049312 ?auto_2049318 ) ) ( not ( = ?auto_2049313 ?auto_2049314 ) ) ( not ( = ?auto_2049313 ?auto_2049315 ) ) ( not ( = ?auto_2049313 ?auto_2049316 ) ) ( not ( = ?auto_2049313 ?auto_2049317 ) ) ( not ( = ?auto_2049313 ?auto_2049318 ) ) ( not ( = ?auto_2049314 ?auto_2049315 ) ) ( not ( = ?auto_2049314 ?auto_2049316 ) ) ( not ( = ?auto_2049314 ?auto_2049317 ) ) ( not ( = ?auto_2049314 ?auto_2049318 ) ) ( not ( = ?auto_2049315 ?auto_2049316 ) ) ( not ( = ?auto_2049315 ?auto_2049317 ) ) ( not ( = ?auto_2049315 ?auto_2049318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049316 ?auto_2049317 ?auto_2049318 )
      ( MAKE-11CRATE-VERIFY ?auto_2049307 ?auto_2049308 ?auto_2049309 ?auto_2049311 ?auto_2049310 ?auto_2049312 ?auto_2049313 ?auto_2049314 ?auto_2049315 ?auto_2049316 ?auto_2049317 ?auto_2049318 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049428 - SURFACE
      ?auto_2049429 - SURFACE
      ?auto_2049430 - SURFACE
      ?auto_2049432 - SURFACE
      ?auto_2049431 - SURFACE
      ?auto_2049433 - SURFACE
      ?auto_2049434 - SURFACE
      ?auto_2049435 - SURFACE
      ?auto_2049436 - SURFACE
      ?auto_2049437 - SURFACE
      ?auto_2049438 - SURFACE
      ?auto_2049439 - SURFACE
    )
    :vars
    (
      ?auto_2049441 - HOIST
      ?auto_2049440 - PLACE
      ?auto_2049443 - TRUCK
      ?auto_2049442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049441 ?auto_2049440 ) ( SURFACE-AT ?auto_2049438 ?auto_2049440 ) ( CLEAR ?auto_2049438 ) ( IS-CRATE ?auto_2049439 ) ( not ( = ?auto_2049438 ?auto_2049439 ) ) ( AVAILABLE ?auto_2049441 ) ( IN ?auto_2049439 ?auto_2049443 ) ( ON ?auto_2049438 ?auto_2049437 ) ( not ( = ?auto_2049437 ?auto_2049438 ) ) ( not ( = ?auto_2049437 ?auto_2049439 ) ) ( TRUCK-AT ?auto_2049443 ?auto_2049442 ) ( not ( = ?auto_2049442 ?auto_2049440 ) ) ( ON ?auto_2049429 ?auto_2049428 ) ( ON ?auto_2049430 ?auto_2049429 ) ( ON ?auto_2049432 ?auto_2049430 ) ( ON ?auto_2049431 ?auto_2049432 ) ( ON ?auto_2049433 ?auto_2049431 ) ( ON ?auto_2049434 ?auto_2049433 ) ( ON ?auto_2049435 ?auto_2049434 ) ( ON ?auto_2049436 ?auto_2049435 ) ( ON ?auto_2049437 ?auto_2049436 ) ( not ( = ?auto_2049428 ?auto_2049429 ) ) ( not ( = ?auto_2049428 ?auto_2049430 ) ) ( not ( = ?auto_2049428 ?auto_2049432 ) ) ( not ( = ?auto_2049428 ?auto_2049431 ) ) ( not ( = ?auto_2049428 ?auto_2049433 ) ) ( not ( = ?auto_2049428 ?auto_2049434 ) ) ( not ( = ?auto_2049428 ?auto_2049435 ) ) ( not ( = ?auto_2049428 ?auto_2049436 ) ) ( not ( = ?auto_2049428 ?auto_2049437 ) ) ( not ( = ?auto_2049428 ?auto_2049438 ) ) ( not ( = ?auto_2049428 ?auto_2049439 ) ) ( not ( = ?auto_2049429 ?auto_2049430 ) ) ( not ( = ?auto_2049429 ?auto_2049432 ) ) ( not ( = ?auto_2049429 ?auto_2049431 ) ) ( not ( = ?auto_2049429 ?auto_2049433 ) ) ( not ( = ?auto_2049429 ?auto_2049434 ) ) ( not ( = ?auto_2049429 ?auto_2049435 ) ) ( not ( = ?auto_2049429 ?auto_2049436 ) ) ( not ( = ?auto_2049429 ?auto_2049437 ) ) ( not ( = ?auto_2049429 ?auto_2049438 ) ) ( not ( = ?auto_2049429 ?auto_2049439 ) ) ( not ( = ?auto_2049430 ?auto_2049432 ) ) ( not ( = ?auto_2049430 ?auto_2049431 ) ) ( not ( = ?auto_2049430 ?auto_2049433 ) ) ( not ( = ?auto_2049430 ?auto_2049434 ) ) ( not ( = ?auto_2049430 ?auto_2049435 ) ) ( not ( = ?auto_2049430 ?auto_2049436 ) ) ( not ( = ?auto_2049430 ?auto_2049437 ) ) ( not ( = ?auto_2049430 ?auto_2049438 ) ) ( not ( = ?auto_2049430 ?auto_2049439 ) ) ( not ( = ?auto_2049432 ?auto_2049431 ) ) ( not ( = ?auto_2049432 ?auto_2049433 ) ) ( not ( = ?auto_2049432 ?auto_2049434 ) ) ( not ( = ?auto_2049432 ?auto_2049435 ) ) ( not ( = ?auto_2049432 ?auto_2049436 ) ) ( not ( = ?auto_2049432 ?auto_2049437 ) ) ( not ( = ?auto_2049432 ?auto_2049438 ) ) ( not ( = ?auto_2049432 ?auto_2049439 ) ) ( not ( = ?auto_2049431 ?auto_2049433 ) ) ( not ( = ?auto_2049431 ?auto_2049434 ) ) ( not ( = ?auto_2049431 ?auto_2049435 ) ) ( not ( = ?auto_2049431 ?auto_2049436 ) ) ( not ( = ?auto_2049431 ?auto_2049437 ) ) ( not ( = ?auto_2049431 ?auto_2049438 ) ) ( not ( = ?auto_2049431 ?auto_2049439 ) ) ( not ( = ?auto_2049433 ?auto_2049434 ) ) ( not ( = ?auto_2049433 ?auto_2049435 ) ) ( not ( = ?auto_2049433 ?auto_2049436 ) ) ( not ( = ?auto_2049433 ?auto_2049437 ) ) ( not ( = ?auto_2049433 ?auto_2049438 ) ) ( not ( = ?auto_2049433 ?auto_2049439 ) ) ( not ( = ?auto_2049434 ?auto_2049435 ) ) ( not ( = ?auto_2049434 ?auto_2049436 ) ) ( not ( = ?auto_2049434 ?auto_2049437 ) ) ( not ( = ?auto_2049434 ?auto_2049438 ) ) ( not ( = ?auto_2049434 ?auto_2049439 ) ) ( not ( = ?auto_2049435 ?auto_2049436 ) ) ( not ( = ?auto_2049435 ?auto_2049437 ) ) ( not ( = ?auto_2049435 ?auto_2049438 ) ) ( not ( = ?auto_2049435 ?auto_2049439 ) ) ( not ( = ?auto_2049436 ?auto_2049437 ) ) ( not ( = ?auto_2049436 ?auto_2049438 ) ) ( not ( = ?auto_2049436 ?auto_2049439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049437 ?auto_2049438 ?auto_2049439 )
      ( MAKE-11CRATE-VERIFY ?auto_2049428 ?auto_2049429 ?auto_2049430 ?auto_2049432 ?auto_2049431 ?auto_2049433 ?auto_2049434 ?auto_2049435 ?auto_2049436 ?auto_2049437 ?auto_2049438 ?auto_2049439 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049560 - SURFACE
      ?auto_2049561 - SURFACE
      ?auto_2049562 - SURFACE
      ?auto_2049564 - SURFACE
      ?auto_2049563 - SURFACE
      ?auto_2049565 - SURFACE
      ?auto_2049566 - SURFACE
      ?auto_2049567 - SURFACE
      ?auto_2049568 - SURFACE
      ?auto_2049569 - SURFACE
      ?auto_2049570 - SURFACE
      ?auto_2049571 - SURFACE
    )
    :vars
    (
      ?auto_2049572 - HOIST
      ?auto_2049574 - PLACE
      ?auto_2049575 - TRUCK
      ?auto_2049576 - PLACE
      ?auto_2049573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049572 ?auto_2049574 ) ( SURFACE-AT ?auto_2049570 ?auto_2049574 ) ( CLEAR ?auto_2049570 ) ( IS-CRATE ?auto_2049571 ) ( not ( = ?auto_2049570 ?auto_2049571 ) ) ( AVAILABLE ?auto_2049572 ) ( ON ?auto_2049570 ?auto_2049569 ) ( not ( = ?auto_2049569 ?auto_2049570 ) ) ( not ( = ?auto_2049569 ?auto_2049571 ) ) ( TRUCK-AT ?auto_2049575 ?auto_2049576 ) ( not ( = ?auto_2049576 ?auto_2049574 ) ) ( HOIST-AT ?auto_2049573 ?auto_2049576 ) ( LIFTING ?auto_2049573 ?auto_2049571 ) ( not ( = ?auto_2049572 ?auto_2049573 ) ) ( ON ?auto_2049561 ?auto_2049560 ) ( ON ?auto_2049562 ?auto_2049561 ) ( ON ?auto_2049564 ?auto_2049562 ) ( ON ?auto_2049563 ?auto_2049564 ) ( ON ?auto_2049565 ?auto_2049563 ) ( ON ?auto_2049566 ?auto_2049565 ) ( ON ?auto_2049567 ?auto_2049566 ) ( ON ?auto_2049568 ?auto_2049567 ) ( ON ?auto_2049569 ?auto_2049568 ) ( not ( = ?auto_2049560 ?auto_2049561 ) ) ( not ( = ?auto_2049560 ?auto_2049562 ) ) ( not ( = ?auto_2049560 ?auto_2049564 ) ) ( not ( = ?auto_2049560 ?auto_2049563 ) ) ( not ( = ?auto_2049560 ?auto_2049565 ) ) ( not ( = ?auto_2049560 ?auto_2049566 ) ) ( not ( = ?auto_2049560 ?auto_2049567 ) ) ( not ( = ?auto_2049560 ?auto_2049568 ) ) ( not ( = ?auto_2049560 ?auto_2049569 ) ) ( not ( = ?auto_2049560 ?auto_2049570 ) ) ( not ( = ?auto_2049560 ?auto_2049571 ) ) ( not ( = ?auto_2049561 ?auto_2049562 ) ) ( not ( = ?auto_2049561 ?auto_2049564 ) ) ( not ( = ?auto_2049561 ?auto_2049563 ) ) ( not ( = ?auto_2049561 ?auto_2049565 ) ) ( not ( = ?auto_2049561 ?auto_2049566 ) ) ( not ( = ?auto_2049561 ?auto_2049567 ) ) ( not ( = ?auto_2049561 ?auto_2049568 ) ) ( not ( = ?auto_2049561 ?auto_2049569 ) ) ( not ( = ?auto_2049561 ?auto_2049570 ) ) ( not ( = ?auto_2049561 ?auto_2049571 ) ) ( not ( = ?auto_2049562 ?auto_2049564 ) ) ( not ( = ?auto_2049562 ?auto_2049563 ) ) ( not ( = ?auto_2049562 ?auto_2049565 ) ) ( not ( = ?auto_2049562 ?auto_2049566 ) ) ( not ( = ?auto_2049562 ?auto_2049567 ) ) ( not ( = ?auto_2049562 ?auto_2049568 ) ) ( not ( = ?auto_2049562 ?auto_2049569 ) ) ( not ( = ?auto_2049562 ?auto_2049570 ) ) ( not ( = ?auto_2049562 ?auto_2049571 ) ) ( not ( = ?auto_2049564 ?auto_2049563 ) ) ( not ( = ?auto_2049564 ?auto_2049565 ) ) ( not ( = ?auto_2049564 ?auto_2049566 ) ) ( not ( = ?auto_2049564 ?auto_2049567 ) ) ( not ( = ?auto_2049564 ?auto_2049568 ) ) ( not ( = ?auto_2049564 ?auto_2049569 ) ) ( not ( = ?auto_2049564 ?auto_2049570 ) ) ( not ( = ?auto_2049564 ?auto_2049571 ) ) ( not ( = ?auto_2049563 ?auto_2049565 ) ) ( not ( = ?auto_2049563 ?auto_2049566 ) ) ( not ( = ?auto_2049563 ?auto_2049567 ) ) ( not ( = ?auto_2049563 ?auto_2049568 ) ) ( not ( = ?auto_2049563 ?auto_2049569 ) ) ( not ( = ?auto_2049563 ?auto_2049570 ) ) ( not ( = ?auto_2049563 ?auto_2049571 ) ) ( not ( = ?auto_2049565 ?auto_2049566 ) ) ( not ( = ?auto_2049565 ?auto_2049567 ) ) ( not ( = ?auto_2049565 ?auto_2049568 ) ) ( not ( = ?auto_2049565 ?auto_2049569 ) ) ( not ( = ?auto_2049565 ?auto_2049570 ) ) ( not ( = ?auto_2049565 ?auto_2049571 ) ) ( not ( = ?auto_2049566 ?auto_2049567 ) ) ( not ( = ?auto_2049566 ?auto_2049568 ) ) ( not ( = ?auto_2049566 ?auto_2049569 ) ) ( not ( = ?auto_2049566 ?auto_2049570 ) ) ( not ( = ?auto_2049566 ?auto_2049571 ) ) ( not ( = ?auto_2049567 ?auto_2049568 ) ) ( not ( = ?auto_2049567 ?auto_2049569 ) ) ( not ( = ?auto_2049567 ?auto_2049570 ) ) ( not ( = ?auto_2049567 ?auto_2049571 ) ) ( not ( = ?auto_2049568 ?auto_2049569 ) ) ( not ( = ?auto_2049568 ?auto_2049570 ) ) ( not ( = ?auto_2049568 ?auto_2049571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049569 ?auto_2049570 ?auto_2049571 )
      ( MAKE-11CRATE-VERIFY ?auto_2049560 ?auto_2049561 ?auto_2049562 ?auto_2049564 ?auto_2049563 ?auto_2049565 ?auto_2049566 ?auto_2049567 ?auto_2049568 ?auto_2049569 ?auto_2049570 ?auto_2049571 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049703 - SURFACE
      ?auto_2049704 - SURFACE
      ?auto_2049705 - SURFACE
      ?auto_2049707 - SURFACE
      ?auto_2049706 - SURFACE
      ?auto_2049708 - SURFACE
      ?auto_2049709 - SURFACE
      ?auto_2049710 - SURFACE
      ?auto_2049711 - SURFACE
      ?auto_2049712 - SURFACE
      ?auto_2049713 - SURFACE
      ?auto_2049714 - SURFACE
    )
    :vars
    (
      ?auto_2049720 - HOIST
      ?auto_2049719 - PLACE
      ?auto_2049716 - TRUCK
      ?auto_2049718 - PLACE
      ?auto_2049717 - HOIST
      ?auto_2049715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049720 ?auto_2049719 ) ( SURFACE-AT ?auto_2049713 ?auto_2049719 ) ( CLEAR ?auto_2049713 ) ( IS-CRATE ?auto_2049714 ) ( not ( = ?auto_2049713 ?auto_2049714 ) ) ( AVAILABLE ?auto_2049720 ) ( ON ?auto_2049713 ?auto_2049712 ) ( not ( = ?auto_2049712 ?auto_2049713 ) ) ( not ( = ?auto_2049712 ?auto_2049714 ) ) ( TRUCK-AT ?auto_2049716 ?auto_2049718 ) ( not ( = ?auto_2049718 ?auto_2049719 ) ) ( HOIST-AT ?auto_2049717 ?auto_2049718 ) ( not ( = ?auto_2049720 ?auto_2049717 ) ) ( AVAILABLE ?auto_2049717 ) ( SURFACE-AT ?auto_2049714 ?auto_2049718 ) ( ON ?auto_2049714 ?auto_2049715 ) ( CLEAR ?auto_2049714 ) ( not ( = ?auto_2049713 ?auto_2049715 ) ) ( not ( = ?auto_2049714 ?auto_2049715 ) ) ( not ( = ?auto_2049712 ?auto_2049715 ) ) ( ON ?auto_2049704 ?auto_2049703 ) ( ON ?auto_2049705 ?auto_2049704 ) ( ON ?auto_2049707 ?auto_2049705 ) ( ON ?auto_2049706 ?auto_2049707 ) ( ON ?auto_2049708 ?auto_2049706 ) ( ON ?auto_2049709 ?auto_2049708 ) ( ON ?auto_2049710 ?auto_2049709 ) ( ON ?auto_2049711 ?auto_2049710 ) ( ON ?auto_2049712 ?auto_2049711 ) ( not ( = ?auto_2049703 ?auto_2049704 ) ) ( not ( = ?auto_2049703 ?auto_2049705 ) ) ( not ( = ?auto_2049703 ?auto_2049707 ) ) ( not ( = ?auto_2049703 ?auto_2049706 ) ) ( not ( = ?auto_2049703 ?auto_2049708 ) ) ( not ( = ?auto_2049703 ?auto_2049709 ) ) ( not ( = ?auto_2049703 ?auto_2049710 ) ) ( not ( = ?auto_2049703 ?auto_2049711 ) ) ( not ( = ?auto_2049703 ?auto_2049712 ) ) ( not ( = ?auto_2049703 ?auto_2049713 ) ) ( not ( = ?auto_2049703 ?auto_2049714 ) ) ( not ( = ?auto_2049703 ?auto_2049715 ) ) ( not ( = ?auto_2049704 ?auto_2049705 ) ) ( not ( = ?auto_2049704 ?auto_2049707 ) ) ( not ( = ?auto_2049704 ?auto_2049706 ) ) ( not ( = ?auto_2049704 ?auto_2049708 ) ) ( not ( = ?auto_2049704 ?auto_2049709 ) ) ( not ( = ?auto_2049704 ?auto_2049710 ) ) ( not ( = ?auto_2049704 ?auto_2049711 ) ) ( not ( = ?auto_2049704 ?auto_2049712 ) ) ( not ( = ?auto_2049704 ?auto_2049713 ) ) ( not ( = ?auto_2049704 ?auto_2049714 ) ) ( not ( = ?auto_2049704 ?auto_2049715 ) ) ( not ( = ?auto_2049705 ?auto_2049707 ) ) ( not ( = ?auto_2049705 ?auto_2049706 ) ) ( not ( = ?auto_2049705 ?auto_2049708 ) ) ( not ( = ?auto_2049705 ?auto_2049709 ) ) ( not ( = ?auto_2049705 ?auto_2049710 ) ) ( not ( = ?auto_2049705 ?auto_2049711 ) ) ( not ( = ?auto_2049705 ?auto_2049712 ) ) ( not ( = ?auto_2049705 ?auto_2049713 ) ) ( not ( = ?auto_2049705 ?auto_2049714 ) ) ( not ( = ?auto_2049705 ?auto_2049715 ) ) ( not ( = ?auto_2049707 ?auto_2049706 ) ) ( not ( = ?auto_2049707 ?auto_2049708 ) ) ( not ( = ?auto_2049707 ?auto_2049709 ) ) ( not ( = ?auto_2049707 ?auto_2049710 ) ) ( not ( = ?auto_2049707 ?auto_2049711 ) ) ( not ( = ?auto_2049707 ?auto_2049712 ) ) ( not ( = ?auto_2049707 ?auto_2049713 ) ) ( not ( = ?auto_2049707 ?auto_2049714 ) ) ( not ( = ?auto_2049707 ?auto_2049715 ) ) ( not ( = ?auto_2049706 ?auto_2049708 ) ) ( not ( = ?auto_2049706 ?auto_2049709 ) ) ( not ( = ?auto_2049706 ?auto_2049710 ) ) ( not ( = ?auto_2049706 ?auto_2049711 ) ) ( not ( = ?auto_2049706 ?auto_2049712 ) ) ( not ( = ?auto_2049706 ?auto_2049713 ) ) ( not ( = ?auto_2049706 ?auto_2049714 ) ) ( not ( = ?auto_2049706 ?auto_2049715 ) ) ( not ( = ?auto_2049708 ?auto_2049709 ) ) ( not ( = ?auto_2049708 ?auto_2049710 ) ) ( not ( = ?auto_2049708 ?auto_2049711 ) ) ( not ( = ?auto_2049708 ?auto_2049712 ) ) ( not ( = ?auto_2049708 ?auto_2049713 ) ) ( not ( = ?auto_2049708 ?auto_2049714 ) ) ( not ( = ?auto_2049708 ?auto_2049715 ) ) ( not ( = ?auto_2049709 ?auto_2049710 ) ) ( not ( = ?auto_2049709 ?auto_2049711 ) ) ( not ( = ?auto_2049709 ?auto_2049712 ) ) ( not ( = ?auto_2049709 ?auto_2049713 ) ) ( not ( = ?auto_2049709 ?auto_2049714 ) ) ( not ( = ?auto_2049709 ?auto_2049715 ) ) ( not ( = ?auto_2049710 ?auto_2049711 ) ) ( not ( = ?auto_2049710 ?auto_2049712 ) ) ( not ( = ?auto_2049710 ?auto_2049713 ) ) ( not ( = ?auto_2049710 ?auto_2049714 ) ) ( not ( = ?auto_2049710 ?auto_2049715 ) ) ( not ( = ?auto_2049711 ?auto_2049712 ) ) ( not ( = ?auto_2049711 ?auto_2049713 ) ) ( not ( = ?auto_2049711 ?auto_2049714 ) ) ( not ( = ?auto_2049711 ?auto_2049715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049712 ?auto_2049713 ?auto_2049714 )
      ( MAKE-11CRATE-VERIFY ?auto_2049703 ?auto_2049704 ?auto_2049705 ?auto_2049707 ?auto_2049706 ?auto_2049708 ?auto_2049709 ?auto_2049710 ?auto_2049711 ?auto_2049712 ?auto_2049713 ?auto_2049714 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049847 - SURFACE
      ?auto_2049848 - SURFACE
      ?auto_2049849 - SURFACE
      ?auto_2049851 - SURFACE
      ?auto_2049850 - SURFACE
      ?auto_2049852 - SURFACE
      ?auto_2049853 - SURFACE
      ?auto_2049854 - SURFACE
      ?auto_2049855 - SURFACE
      ?auto_2049856 - SURFACE
      ?auto_2049857 - SURFACE
      ?auto_2049858 - SURFACE
    )
    :vars
    (
      ?auto_2049863 - HOIST
      ?auto_2049862 - PLACE
      ?auto_2049860 - PLACE
      ?auto_2049859 - HOIST
      ?auto_2049861 - SURFACE
      ?auto_2049864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049863 ?auto_2049862 ) ( SURFACE-AT ?auto_2049857 ?auto_2049862 ) ( CLEAR ?auto_2049857 ) ( IS-CRATE ?auto_2049858 ) ( not ( = ?auto_2049857 ?auto_2049858 ) ) ( AVAILABLE ?auto_2049863 ) ( ON ?auto_2049857 ?auto_2049856 ) ( not ( = ?auto_2049856 ?auto_2049857 ) ) ( not ( = ?auto_2049856 ?auto_2049858 ) ) ( not ( = ?auto_2049860 ?auto_2049862 ) ) ( HOIST-AT ?auto_2049859 ?auto_2049860 ) ( not ( = ?auto_2049863 ?auto_2049859 ) ) ( AVAILABLE ?auto_2049859 ) ( SURFACE-AT ?auto_2049858 ?auto_2049860 ) ( ON ?auto_2049858 ?auto_2049861 ) ( CLEAR ?auto_2049858 ) ( not ( = ?auto_2049857 ?auto_2049861 ) ) ( not ( = ?auto_2049858 ?auto_2049861 ) ) ( not ( = ?auto_2049856 ?auto_2049861 ) ) ( TRUCK-AT ?auto_2049864 ?auto_2049862 ) ( ON ?auto_2049848 ?auto_2049847 ) ( ON ?auto_2049849 ?auto_2049848 ) ( ON ?auto_2049851 ?auto_2049849 ) ( ON ?auto_2049850 ?auto_2049851 ) ( ON ?auto_2049852 ?auto_2049850 ) ( ON ?auto_2049853 ?auto_2049852 ) ( ON ?auto_2049854 ?auto_2049853 ) ( ON ?auto_2049855 ?auto_2049854 ) ( ON ?auto_2049856 ?auto_2049855 ) ( not ( = ?auto_2049847 ?auto_2049848 ) ) ( not ( = ?auto_2049847 ?auto_2049849 ) ) ( not ( = ?auto_2049847 ?auto_2049851 ) ) ( not ( = ?auto_2049847 ?auto_2049850 ) ) ( not ( = ?auto_2049847 ?auto_2049852 ) ) ( not ( = ?auto_2049847 ?auto_2049853 ) ) ( not ( = ?auto_2049847 ?auto_2049854 ) ) ( not ( = ?auto_2049847 ?auto_2049855 ) ) ( not ( = ?auto_2049847 ?auto_2049856 ) ) ( not ( = ?auto_2049847 ?auto_2049857 ) ) ( not ( = ?auto_2049847 ?auto_2049858 ) ) ( not ( = ?auto_2049847 ?auto_2049861 ) ) ( not ( = ?auto_2049848 ?auto_2049849 ) ) ( not ( = ?auto_2049848 ?auto_2049851 ) ) ( not ( = ?auto_2049848 ?auto_2049850 ) ) ( not ( = ?auto_2049848 ?auto_2049852 ) ) ( not ( = ?auto_2049848 ?auto_2049853 ) ) ( not ( = ?auto_2049848 ?auto_2049854 ) ) ( not ( = ?auto_2049848 ?auto_2049855 ) ) ( not ( = ?auto_2049848 ?auto_2049856 ) ) ( not ( = ?auto_2049848 ?auto_2049857 ) ) ( not ( = ?auto_2049848 ?auto_2049858 ) ) ( not ( = ?auto_2049848 ?auto_2049861 ) ) ( not ( = ?auto_2049849 ?auto_2049851 ) ) ( not ( = ?auto_2049849 ?auto_2049850 ) ) ( not ( = ?auto_2049849 ?auto_2049852 ) ) ( not ( = ?auto_2049849 ?auto_2049853 ) ) ( not ( = ?auto_2049849 ?auto_2049854 ) ) ( not ( = ?auto_2049849 ?auto_2049855 ) ) ( not ( = ?auto_2049849 ?auto_2049856 ) ) ( not ( = ?auto_2049849 ?auto_2049857 ) ) ( not ( = ?auto_2049849 ?auto_2049858 ) ) ( not ( = ?auto_2049849 ?auto_2049861 ) ) ( not ( = ?auto_2049851 ?auto_2049850 ) ) ( not ( = ?auto_2049851 ?auto_2049852 ) ) ( not ( = ?auto_2049851 ?auto_2049853 ) ) ( not ( = ?auto_2049851 ?auto_2049854 ) ) ( not ( = ?auto_2049851 ?auto_2049855 ) ) ( not ( = ?auto_2049851 ?auto_2049856 ) ) ( not ( = ?auto_2049851 ?auto_2049857 ) ) ( not ( = ?auto_2049851 ?auto_2049858 ) ) ( not ( = ?auto_2049851 ?auto_2049861 ) ) ( not ( = ?auto_2049850 ?auto_2049852 ) ) ( not ( = ?auto_2049850 ?auto_2049853 ) ) ( not ( = ?auto_2049850 ?auto_2049854 ) ) ( not ( = ?auto_2049850 ?auto_2049855 ) ) ( not ( = ?auto_2049850 ?auto_2049856 ) ) ( not ( = ?auto_2049850 ?auto_2049857 ) ) ( not ( = ?auto_2049850 ?auto_2049858 ) ) ( not ( = ?auto_2049850 ?auto_2049861 ) ) ( not ( = ?auto_2049852 ?auto_2049853 ) ) ( not ( = ?auto_2049852 ?auto_2049854 ) ) ( not ( = ?auto_2049852 ?auto_2049855 ) ) ( not ( = ?auto_2049852 ?auto_2049856 ) ) ( not ( = ?auto_2049852 ?auto_2049857 ) ) ( not ( = ?auto_2049852 ?auto_2049858 ) ) ( not ( = ?auto_2049852 ?auto_2049861 ) ) ( not ( = ?auto_2049853 ?auto_2049854 ) ) ( not ( = ?auto_2049853 ?auto_2049855 ) ) ( not ( = ?auto_2049853 ?auto_2049856 ) ) ( not ( = ?auto_2049853 ?auto_2049857 ) ) ( not ( = ?auto_2049853 ?auto_2049858 ) ) ( not ( = ?auto_2049853 ?auto_2049861 ) ) ( not ( = ?auto_2049854 ?auto_2049855 ) ) ( not ( = ?auto_2049854 ?auto_2049856 ) ) ( not ( = ?auto_2049854 ?auto_2049857 ) ) ( not ( = ?auto_2049854 ?auto_2049858 ) ) ( not ( = ?auto_2049854 ?auto_2049861 ) ) ( not ( = ?auto_2049855 ?auto_2049856 ) ) ( not ( = ?auto_2049855 ?auto_2049857 ) ) ( not ( = ?auto_2049855 ?auto_2049858 ) ) ( not ( = ?auto_2049855 ?auto_2049861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049856 ?auto_2049857 ?auto_2049858 )
      ( MAKE-11CRATE-VERIFY ?auto_2049847 ?auto_2049848 ?auto_2049849 ?auto_2049851 ?auto_2049850 ?auto_2049852 ?auto_2049853 ?auto_2049854 ?auto_2049855 ?auto_2049856 ?auto_2049857 ?auto_2049858 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049991 - SURFACE
      ?auto_2049992 - SURFACE
      ?auto_2049993 - SURFACE
      ?auto_2049995 - SURFACE
      ?auto_2049994 - SURFACE
      ?auto_2049996 - SURFACE
      ?auto_2049997 - SURFACE
      ?auto_2049998 - SURFACE
      ?auto_2049999 - SURFACE
      ?auto_2050000 - SURFACE
      ?auto_2050001 - SURFACE
      ?auto_2050002 - SURFACE
    )
    :vars
    (
      ?auto_2050007 - HOIST
      ?auto_2050005 - PLACE
      ?auto_2050006 - PLACE
      ?auto_2050004 - HOIST
      ?auto_2050008 - SURFACE
      ?auto_2050003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050007 ?auto_2050005 ) ( IS-CRATE ?auto_2050002 ) ( not ( = ?auto_2050001 ?auto_2050002 ) ) ( not ( = ?auto_2050000 ?auto_2050001 ) ) ( not ( = ?auto_2050000 ?auto_2050002 ) ) ( not ( = ?auto_2050006 ?auto_2050005 ) ) ( HOIST-AT ?auto_2050004 ?auto_2050006 ) ( not ( = ?auto_2050007 ?auto_2050004 ) ) ( AVAILABLE ?auto_2050004 ) ( SURFACE-AT ?auto_2050002 ?auto_2050006 ) ( ON ?auto_2050002 ?auto_2050008 ) ( CLEAR ?auto_2050002 ) ( not ( = ?auto_2050001 ?auto_2050008 ) ) ( not ( = ?auto_2050002 ?auto_2050008 ) ) ( not ( = ?auto_2050000 ?auto_2050008 ) ) ( TRUCK-AT ?auto_2050003 ?auto_2050005 ) ( SURFACE-AT ?auto_2050000 ?auto_2050005 ) ( CLEAR ?auto_2050000 ) ( LIFTING ?auto_2050007 ?auto_2050001 ) ( IS-CRATE ?auto_2050001 ) ( ON ?auto_2049992 ?auto_2049991 ) ( ON ?auto_2049993 ?auto_2049992 ) ( ON ?auto_2049995 ?auto_2049993 ) ( ON ?auto_2049994 ?auto_2049995 ) ( ON ?auto_2049996 ?auto_2049994 ) ( ON ?auto_2049997 ?auto_2049996 ) ( ON ?auto_2049998 ?auto_2049997 ) ( ON ?auto_2049999 ?auto_2049998 ) ( ON ?auto_2050000 ?auto_2049999 ) ( not ( = ?auto_2049991 ?auto_2049992 ) ) ( not ( = ?auto_2049991 ?auto_2049993 ) ) ( not ( = ?auto_2049991 ?auto_2049995 ) ) ( not ( = ?auto_2049991 ?auto_2049994 ) ) ( not ( = ?auto_2049991 ?auto_2049996 ) ) ( not ( = ?auto_2049991 ?auto_2049997 ) ) ( not ( = ?auto_2049991 ?auto_2049998 ) ) ( not ( = ?auto_2049991 ?auto_2049999 ) ) ( not ( = ?auto_2049991 ?auto_2050000 ) ) ( not ( = ?auto_2049991 ?auto_2050001 ) ) ( not ( = ?auto_2049991 ?auto_2050002 ) ) ( not ( = ?auto_2049991 ?auto_2050008 ) ) ( not ( = ?auto_2049992 ?auto_2049993 ) ) ( not ( = ?auto_2049992 ?auto_2049995 ) ) ( not ( = ?auto_2049992 ?auto_2049994 ) ) ( not ( = ?auto_2049992 ?auto_2049996 ) ) ( not ( = ?auto_2049992 ?auto_2049997 ) ) ( not ( = ?auto_2049992 ?auto_2049998 ) ) ( not ( = ?auto_2049992 ?auto_2049999 ) ) ( not ( = ?auto_2049992 ?auto_2050000 ) ) ( not ( = ?auto_2049992 ?auto_2050001 ) ) ( not ( = ?auto_2049992 ?auto_2050002 ) ) ( not ( = ?auto_2049992 ?auto_2050008 ) ) ( not ( = ?auto_2049993 ?auto_2049995 ) ) ( not ( = ?auto_2049993 ?auto_2049994 ) ) ( not ( = ?auto_2049993 ?auto_2049996 ) ) ( not ( = ?auto_2049993 ?auto_2049997 ) ) ( not ( = ?auto_2049993 ?auto_2049998 ) ) ( not ( = ?auto_2049993 ?auto_2049999 ) ) ( not ( = ?auto_2049993 ?auto_2050000 ) ) ( not ( = ?auto_2049993 ?auto_2050001 ) ) ( not ( = ?auto_2049993 ?auto_2050002 ) ) ( not ( = ?auto_2049993 ?auto_2050008 ) ) ( not ( = ?auto_2049995 ?auto_2049994 ) ) ( not ( = ?auto_2049995 ?auto_2049996 ) ) ( not ( = ?auto_2049995 ?auto_2049997 ) ) ( not ( = ?auto_2049995 ?auto_2049998 ) ) ( not ( = ?auto_2049995 ?auto_2049999 ) ) ( not ( = ?auto_2049995 ?auto_2050000 ) ) ( not ( = ?auto_2049995 ?auto_2050001 ) ) ( not ( = ?auto_2049995 ?auto_2050002 ) ) ( not ( = ?auto_2049995 ?auto_2050008 ) ) ( not ( = ?auto_2049994 ?auto_2049996 ) ) ( not ( = ?auto_2049994 ?auto_2049997 ) ) ( not ( = ?auto_2049994 ?auto_2049998 ) ) ( not ( = ?auto_2049994 ?auto_2049999 ) ) ( not ( = ?auto_2049994 ?auto_2050000 ) ) ( not ( = ?auto_2049994 ?auto_2050001 ) ) ( not ( = ?auto_2049994 ?auto_2050002 ) ) ( not ( = ?auto_2049994 ?auto_2050008 ) ) ( not ( = ?auto_2049996 ?auto_2049997 ) ) ( not ( = ?auto_2049996 ?auto_2049998 ) ) ( not ( = ?auto_2049996 ?auto_2049999 ) ) ( not ( = ?auto_2049996 ?auto_2050000 ) ) ( not ( = ?auto_2049996 ?auto_2050001 ) ) ( not ( = ?auto_2049996 ?auto_2050002 ) ) ( not ( = ?auto_2049996 ?auto_2050008 ) ) ( not ( = ?auto_2049997 ?auto_2049998 ) ) ( not ( = ?auto_2049997 ?auto_2049999 ) ) ( not ( = ?auto_2049997 ?auto_2050000 ) ) ( not ( = ?auto_2049997 ?auto_2050001 ) ) ( not ( = ?auto_2049997 ?auto_2050002 ) ) ( not ( = ?auto_2049997 ?auto_2050008 ) ) ( not ( = ?auto_2049998 ?auto_2049999 ) ) ( not ( = ?auto_2049998 ?auto_2050000 ) ) ( not ( = ?auto_2049998 ?auto_2050001 ) ) ( not ( = ?auto_2049998 ?auto_2050002 ) ) ( not ( = ?auto_2049998 ?auto_2050008 ) ) ( not ( = ?auto_2049999 ?auto_2050000 ) ) ( not ( = ?auto_2049999 ?auto_2050001 ) ) ( not ( = ?auto_2049999 ?auto_2050002 ) ) ( not ( = ?auto_2049999 ?auto_2050008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050000 ?auto_2050001 ?auto_2050002 )
      ( MAKE-11CRATE-VERIFY ?auto_2049991 ?auto_2049992 ?auto_2049993 ?auto_2049995 ?auto_2049994 ?auto_2049996 ?auto_2049997 ?auto_2049998 ?auto_2049999 ?auto_2050000 ?auto_2050001 ?auto_2050002 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050135 - SURFACE
      ?auto_2050136 - SURFACE
      ?auto_2050137 - SURFACE
      ?auto_2050139 - SURFACE
      ?auto_2050138 - SURFACE
      ?auto_2050140 - SURFACE
      ?auto_2050141 - SURFACE
      ?auto_2050142 - SURFACE
      ?auto_2050143 - SURFACE
      ?auto_2050144 - SURFACE
      ?auto_2050145 - SURFACE
      ?auto_2050146 - SURFACE
    )
    :vars
    (
      ?auto_2050152 - HOIST
      ?auto_2050151 - PLACE
      ?auto_2050149 - PLACE
      ?auto_2050148 - HOIST
      ?auto_2050150 - SURFACE
      ?auto_2050147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050152 ?auto_2050151 ) ( IS-CRATE ?auto_2050146 ) ( not ( = ?auto_2050145 ?auto_2050146 ) ) ( not ( = ?auto_2050144 ?auto_2050145 ) ) ( not ( = ?auto_2050144 ?auto_2050146 ) ) ( not ( = ?auto_2050149 ?auto_2050151 ) ) ( HOIST-AT ?auto_2050148 ?auto_2050149 ) ( not ( = ?auto_2050152 ?auto_2050148 ) ) ( AVAILABLE ?auto_2050148 ) ( SURFACE-AT ?auto_2050146 ?auto_2050149 ) ( ON ?auto_2050146 ?auto_2050150 ) ( CLEAR ?auto_2050146 ) ( not ( = ?auto_2050145 ?auto_2050150 ) ) ( not ( = ?auto_2050146 ?auto_2050150 ) ) ( not ( = ?auto_2050144 ?auto_2050150 ) ) ( TRUCK-AT ?auto_2050147 ?auto_2050151 ) ( SURFACE-AT ?auto_2050144 ?auto_2050151 ) ( CLEAR ?auto_2050144 ) ( IS-CRATE ?auto_2050145 ) ( AVAILABLE ?auto_2050152 ) ( IN ?auto_2050145 ?auto_2050147 ) ( ON ?auto_2050136 ?auto_2050135 ) ( ON ?auto_2050137 ?auto_2050136 ) ( ON ?auto_2050139 ?auto_2050137 ) ( ON ?auto_2050138 ?auto_2050139 ) ( ON ?auto_2050140 ?auto_2050138 ) ( ON ?auto_2050141 ?auto_2050140 ) ( ON ?auto_2050142 ?auto_2050141 ) ( ON ?auto_2050143 ?auto_2050142 ) ( ON ?auto_2050144 ?auto_2050143 ) ( not ( = ?auto_2050135 ?auto_2050136 ) ) ( not ( = ?auto_2050135 ?auto_2050137 ) ) ( not ( = ?auto_2050135 ?auto_2050139 ) ) ( not ( = ?auto_2050135 ?auto_2050138 ) ) ( not ( = ?auto_2050135 ?auto_2050140 ) ) ( not ( = ?auto_2050135 ?auto_2050141 ) ) ( not ( = ?auto_2050135 ?auto_2050142 ) ) ( not ( = ?auto_2050135 ?auto_2050143 ) ) ( not ( = ?auto_2050135 ?auto_2050144 ) ) ( not ( = ?auto_2050135 ?auto_2050145 ) ) ( not ( = ?auto_2050135 ?auto_2050146 ) ) ( not ( = ?auto_2050135 ?auto_2050150 ) ) ( not ( = ?auto_2050136 ?auto_2050137 ) ) ( not ( = ?auto_2050136 ?auto_2050139 ) ) ( not ( = ?auto_2050136 ?auto_2050138 ) ) ( not ( = ?auto_2050136 ?auto_2050140 ) ) ( not ( = ?auto_2050136 ?auto_2050141 ) ) ( not ( = ?auto_2050136 ?auto_2050142 ) ) ( not ( = ?auto_2050136 ?auto_2050143 ) ) ( not ( = ?auto_2050136 ?auto_2050144 ) ) ( not ( = ?auto_2050136 ?auto_2050145 ) ) ( not ( = ?auto_2050136 ?auto_2050146 ) ) ( not ( = ?auto_2050136 ?auto_2050150 ) ) ( not ( = ?auto_2050137 ?auto_2050139 ) ) ( not ( = ?auto_2050137 ?auto_2050138 ) ) ( not ( = ?auto_2050137 ?auto_2050140 ) ) ( not ( = ?auto_2050137 ?auto_2050141 ) ) ( not ( = ?auto_2050137 ?auto_2050142 ) ) ( not ( = ?auto_2050137 ?auto_2050143 ) ) ( not ( = ?auto_2050137 ?auto_2050144 ) ) ( not ( = ?auto_2050137 ?auto_2050145 ) ) ( not ( = ?auto_2050137 ?auto_2050146 ) ) ( not ( = ?auto_2050137 ?auto_2050150 ) ) ( not ( = ?auto_2050139 ?auto_2050138 ) ) ( not ( = ?auto_2050139 ?auto_2050140 ) ) ( not ( = ?auto_2050139 ?auto_2050141 ) ) ( not ( = ?auto_2050139 ?auto_2050142 ) ) ( not ( = ?auto_2050139 ?auto_2050143 ) ) ( not ( = ?auto_2050139 ?auto_2050144 ) ) ( not ( = ?auto_2050139 ?auto_2050145 ) ) ( not ( = ?auto_2050139 ?auto_2050146 ) ) ( not ( = ?auto_2050139 ?auto_2050150 ) ) ( not ( = ?auto_2050138 ?auto_2050140 ) ) ( not ( = ?auto_2050138 ?auto_2050141 ) ) ( not ( = ?auto_2050138 ?auto_2050142 ) ) ( not ( = ?auto_2050138 ?auto_2050143 ) ) ( not ( = ?auto_2050138 ?auto_2050144 ) ) ( not ( = ?auto_2050138 ?auto_2050145 ) ) ( not ( = ?auto_2050138 ?auto_2050146 ) ) ( not ( = ?auto_2050138 ?auto_2050150 ) ) ( not ( = ?auto_2050140 ?auto_2050141 ) ) ( not ( = ?auto_2050140 ?auto_2050142 ) ) ( not ( = ?auto_2050140 ?auto_2050143 ) ) ( not ( = ?auto_2050140 ?auto_2050144 ) ) ( not ( = ?auto_2050140 ?auto_2050145 ) ) ( not ( = ?auto_2050140 ?auto_2050146 ) ) ( not ( = ?auto_2050140 ?auto_2050150 ) ) ( not ( = ?auto_2050141 ?auto_2050142 ) ) ( not ( = ?auto_2050141 ?auto_2050143 ) ) ( not ( = ?auto_2050141 ?auto_2050144 ) ) ( not ( = ?auto_2050141 ?auto_2050145 ) ) ( not ( = ?auto_2050141 ?auto_2050146 ) ) ( not ( = ?auto_2050141 ?auto_2050150 ) ) ( not ( = ?auto_2050142 ?auto_2050143 ) ) ( not ( = ?auto_2050142 ?auto_2050144 ) ) ( not ( = ?auto_2050142 ?auto_2050145 ) ) ( not ( = ?auto_2050142 ?auto_2050146 ) ) ( not ( = ?auto_2050142 ?auto_2050150 ) ) ( not ( = ?auto_2050143 ?auto_2050144 ) ) ( not ( = ?auto_2050143 ?auto_2050145 ) ) ( not ( = ?auto_2050143 ?auto_2050146 ) ) ( not ( = ?auto_2050143 ?auto_2050150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050144 ?auto_2050145 ?auto_2050146 )
      ( MAKE-11CRATE-VERIFY ?auto_2050135 ?auto_2050136 ?auto_2050137 ?auto_2050139 ?auto_2050138 ?auto_2050140 ?auto_2050141 ?auto_2050142 ?auto_2050143 ?auto_2050144 ?auto_2050145 ?auto_2050146 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059352 - SURFACE
      ?auto_2059353 - SURFACE
      ?auto_2059354 - SURFACE
      ?auto_2059356 - SURFACE
      ?auto_2059355 - SURFACE
      ?auto_2059357 - SURFACE
      ?auto_2059358 - SURFACE
      ?auto_2059359 - SURFACE
      ?auto_2059360 - SURFACE
      ?auto_2059361 - SURFACE
      ?auto_2059362 - SURFACE
      ?auto_2059363 - SURFACE
      ?auto_2059364 - SURFACE
    )
    :vars
    (
      ?auto_2059365 - HOIST
      ?auto_2059366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059365 ?auto_2059366 ) ( SURFACE-AT ?auto_2059363 ?auto_2059366 ) ( CLEAR ?auto_2059363 ) ( LIFTING ?auto_2059365 ?auto_2059364 ) ( IS-CRATE ?auto_2059364 ) ( not ( = ?auto_2059363 ?auto_2059364 ) ) ( ON ?auto_2059353 ?auto_2059352 ) ( ON ?auto_2059354 ?auto_2059353 ) ( ON ?auto_2059356 ?auto_2059354 ) ( ON ?auto_2059355 ?auto_2059356 ) ( ON ?auto_2059357 ?auto_2059355 ) ( ON ?auto_2059358 ?auto_2059357 ) ( ON ?auto_2059359 ?auto_2059358 ) ( ON ?auto_2059360 ?auto_2059359 ) ( ON ?auto_2059361 ?auto_2059360 ) ( ON ?auto_2059362 ?auto_2059361 ) ( ON ?auto_2059363 ?auto_2059362 ) ( not ( = ?auto_2059352 ?auto_2059353 ) ) ( not ( = ?auto_2059352 ?auto_2059354 ) ) ( not ( = ?auto_2059352 ?auto_2059356 ) ) ( not ( = ?auto_2059352 ?auto_2059355 ) ) ( not ( = ?auto_2059352 ?auto_2059357 ) ) ( not ( = ?auto_2059352 ?auto_2059358 ) ) ( not ( = ?auto_2059352 ?auto_2059359 ) ) ( not ( = ?auto_2059352 ?auto_2059360 ) ) ( not ( = ?auto_2059352 ?auto_2059361 ) ) ( not ( = ?auto_2059352 ?auto_2059362 ) ) ( not ( = ?auto_2059352 ?auto_2059363 ) ) ( not ( = ?auto_2059352 ?auto_2059364 ) ) ( not ( = ?auto_2059353 ?auto_2059354 ) ) ( not ( = ?auto_2059353 ?auto_2059356 ) ) ( not ( = ?auto_2059353 ?auto_2059355 ) ) ( not ( = ?auto_2059353 ?auto_2059357 ) ) ( not ( = ?auto_2059353 ?auto_2059358 ) ) ( not ( = ?auto_2059353 ?auto_2059359 ) ) ( not ( = ?auto_2059353 ?auto_2059360 ) ) ( not ( = ?auto_2059353 ?auto_2059361 ) ) ( not ( = ?auto_2059353 ?auto_2059362 ) ) ( not ( = ?auto_2059353 ?auto_2059363 ) ) ( not ( = ?auto_2059353 ?auto_2059364 ) ) ( not ( = ?auto_2059354 ?auto_2059356 ) ) ( not ( = ?auto_2059354 ?auto_2059355 ) ) ( not ( = ?auto_2059354 ?auto_2059357 ) ) ( not ( = ?auto_2059354 ?auto_2059358 ) ) ( not ( = ?auto_2059354 ?auto_2059359 ) ) ( not ( = ?auto_2059354 ?auto_2059360 ) ) ( not ( = ?auto_2059354 ?auto_2059361 ) ) ( not ( = ?auto_2059354 ?auto_2059362 ) ) ( not ( = ?auto_2059354 ?auto_2059363 ) ) ( not ( = ?auto_2059354 ?auto_2059364 ) ) ( not ( = ?auto_2059356 ?auto_2059355 ) ) ( not ( = ?auto_2059356 ?auto_2059357 ) ) ( not ( = ?auto_2059356 ?auto_2059358 ) ) ( not ( = ?auto_2059356 ?auto_2059359 ) ) ( not ( = ?auto_2059356 ?auto_2059360 ) ) ( not ( = ?auto_2059356 ?auto_2059361 ) ) ( not ( = ?auto_2059356 ?auto_2059362 ) ) ( not ( = ?auto_2059356 ?auto_2059363 ) ) ( not ( = ?auto_2059356 ?auto_2059364 ) ) ( not ( = ?auto_2059355 ?auto_2059357 ) ) ( not ( = ?auto_2059355 ?auto_2059358 ) ) ( not ( = ?auto_2059355 ?auto_2059359 ) ) ( not ( = ?auto_2059355 ?auto_2059360 ) ) ( not ( = ?auto_2059355 ?auto_2059361 ) ) ( not ( = ?auto_2059355 ?auto_2059362 ) ) ( not ( = ?auto_2059355 ?auto_2059363 ) ) ( not ( = ?auto_2059355 ?auto_2059364 ) ) ( not ( = ?auto_2059357 ?auto_2059358 ) ) ( not ( = ?auto_2059357 ?auto_2059359 ) ) ( not ( = ?auto_2059357 ?auto_2059360 ) ) ( not ( = ?auto_2059357 ?auto_2059361 ) ) ( not ( = ?auto_2059357 ?auto_2059362 ) ) ( not ( = ?auto_2059357 ?auto_2059363 ) ) ( not ( = ?auto_2059357 ?auto_2059364 ) ) ( not ( = ?auto_2059358 ?auto_2059359 ) ) ( not ( = ?auto_2059358 ?auto_2059360 ) ) ( not ( = ?auto_2059358 ?auto_2059361 ) ) ( not ( = ?auto_2059358 ?auto_2059362 ) ) ( not ( = ?auto_2059358 ?auto_2059363 ) ) ( not ( = ?auto_2059358 ?auto_2059364 ) ) ( not ( = ?auto_2059359 ?auto_2059360 ) ) ( not ( = ?auto_2059359 ?auto_2059361 ) ) ( not ( = ?auto_2059359 ?auto_2059362 ) ) ( not ( = ?auto_2059359 ?auto_2059363 ) ) ( not ( = ?auto_2059359 ?auto_2059364 ) ) ( not ( = ?auto_2059360 ?auto_2059361 ) ) ( not ( = ?auto_2059360 ?auto_2059362 ) ) ( not ( = ?auto_2059360 ?auto_2059363 ) ) ( not ( = ?auto_2059360 ?auto_2059364 ) ) ( not ( = ?auto_2059361 ?auto_2059362 ) ) ( not ( = ?auto_2059361 ?auto_2059363 ) ) ( not ( = ?auto_2059361 ?auto_2059364 ) ) ( not ( = ?auto_2059362 ?auto_2059363 ) ) ( not ( = ?auto_2059362 ?auto_2059364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2059363 ?auto_2059364 )
      ( MAKE-12CRATE-VERIFY ?auto_2059352 ?auto_2059353 ?auto_2059354 ?auto_2059356 ?auto_2059355 ?auto_2059357 ?auto_2059358 ?auto_2059359 ?auto_2059360 ?auto_2059361 ?auto_2059362 ?auto_2059363 ?auto_2059364 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059477 - SURFACE
      ?auto_2059478 - SURFACE
      ?auto_2059479 - SURFACE
      ?auto_2059481 - SURFACE
      ?auto_2059480 - SURFACE
      ?auto_2059482 - SURFACE
      ?auto_2059483 - SURFACE
      ?auto_2059484 - SURFACE
      ?auto_2059485 - SURFACE
      ?auto_2059486 - SURFACE
      ?auto_2059487 - SURFACE
      ?auto_2059488 - SURFACE
      ?auto_2059489 - SURFACE
    )
    :vars
    (
      ?auto_2059491 - HOIST
      ?auto_2059492 - PLACE
      ?auto_2059490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059491 ?auto_2059492 ) ( SURFACE-AT ?auto_2059488 ?auto_2059492 ) ( CLEAR ?auto_2059488 ) ( IS-CRATE ?auto_2059489 ) ( not ( = ?auto_2059488 ?auto_2059489 ) ) ( TRUCK-AT ?auto_2059490 ?auto_2059492 ) ( AVAILABLE ?auto_2059491 ) ( IN ?auto_2059489 ?auto_2059490 ) ( ON ?auto_2059488 ?auto_2059487 ) ( not ( = ?auto_2059487 ?auto_2059488 ) ) ( not ( = ?auto_2059487 ?auto_2059489 ) ) ( ON ?auto_2059478 ?auto_2059477 ) ( ON ?auto_2059479 ?auto_2059478 ) ( ON ?auto_2059481 ?auto_2059479 ) ( ON ?auto_2059480 ?auto_2059481 ) ( ON ?auto_2059482 ?auto_2059480 ) ( ON ?auto_2059483 ?auto_2059482 ) ( ON ?auto_2059484 ?auto_2059483 ) ( ON ?auto_2059485 ?auto_2059484 ) ( ON ?auto_2059486 ?auto_2059485 ) ( ON ?auto_2059487 ?auto_2059486 ) ( not ( = ?auto_2059477 ?auto_2059478 ) ) ( not ( = ?auto_2059477 ?auto_2059479 ) ) ( not ( = ?auto_2059477 ?auto_2059481 ) ) ( not ( = ?auto_2059477 ?auto_2059480 ) ) ( not ( = ?auto_2059477 ?auto_2059482 ) ) ( not ( = ?auto_2059477 ?auto_2059483 ) ) ( not ( = ?auto_2059477 ?auto_2059484 ) ) ( not ( = ?auto_2059477 ?auto_2059485 ) ) ( not ( = ?auto_2059477 ?auto_2059486 ) ) ( not ( = ?auto_2059477 ?auto_2059487 ) ) ( not ( = ?auto_2059477 ?auto_2059488 ) ) ( not ( = ?auto_2059477 ?auto_2059489 ) ) ( not ( = ?auto_2059478 ?auto_2059479 ) ) ( not ( = ?auto_2059478 ?auto_2059481 ) ) ( not ( = ?auto_2059478 ?auto_2059480 ) ) ( not ( = ?auto_2059478 ?auto_2059482 ) ) ( not ( = ?auto_2059478 ?auto_2059483 ) ) ( not ( = ?auto_2059478 ?auto_2059484 ) ) ( not ( = ?auto_2059478 ?auto_2059485 ) ) ( not ( = ?auto_2059478 ?auto_2059486 ) ) ( not ( = ?auto_2059478 ?auto_2059487 ) ) ( not ( = ?auto_2059478 ?auto_2059488 ) ) ( not ( = ?auto_2059478 ?auto_2059489 ) ) ( not ( = ?auto_2059479 ?auto_2059481 ) ) ( not ( = ?auto_2059479 ?auto_2059480 ) ) ( not ( = ?auto_2059479 ?auto_2059482 ) ) ( not ( = ?auto_2059479 ?auto_2059483 ) ) ( not ( = ?auto_2059479 ?auto_2059484 ) ) ( not ( = ?auto_2059479 ?auto_2059485 ) ) ( not ( = ?auto_2059479 ?auto_2059486 ) ) ( not ( = ?auto_2059479 ?auto_2059487 ) ) ( not ( = ?auto_2059479 ?auto_2059488 ) ) ( not ( = ?auto_2059479 ?auto_2059489 ) ) ( not ( = ?auto_2059481 ?auto_2059480 ) ) ( not ( = ?auto_2059481 ?auto_2059482 ) ) ( not ( = ?auto_2059481 ?auto_2059483 ) ) ( not ( = ?auto_2059481 ?auto_2059484 ) ) ( not ( = ?auto_2059481 ?auto_2059485 ) ) ( not ( = ?auto_2059481 ?auto_2059486 ) ) ( not ( = ?auto_2059481 ?auto_2059487 ) ) ( not ( = ?auto_2059481 ?auto_2059488 ) ) ( not ( = ?auto_2059481 ?auto_2059489 ) ) ( not ( = ?auto_2059480 ?auto_2059482 ) ) ( not ( = ?auto_2059480 ?auto_2059483 ) ) ( not ( = ?auto_2059480 ?auto_2059484 ) ) ( not ( = ?auto_2059480 ?auto_2059485 ) ) ( not ( = ?auto_2059480 ?auto_2059486 ) ) ( not ( = ?auto_2059480 ?auto_2059487 ) ) ( not ( = ?auto_2059480 ?auto_2059488 ) ) ( not ( = ?auto_2059480 ?auto_2059489 ) ) ( not ( = ?auto_2059482 ?auto_2059483 ) ) ( not ( = ?auto_2059482 ?auto_2059484 ) ) ( not ( = ?auto_2059482 ?auto_2059485 ) ) ( not ( = ?auto_2059482 ?auto_2059486 ) ) ( not ( = ?auto_2059482 ?auto_2059487 ) ) ( not ( = ?auto_2059482 ?auto_2059488 ) ) ( not ( = ?auto_2059482 ?auto_2059489 ) ) ( not ( = ?auto_2059483 ?auto_2059484 ) ) ( not ( = ?auto_2059483 ?auto_2059485 ) ) ( not ( = ?auto_2059483 ?auto_2059486 ) ) ( not ( = ?auto_2059483 ?auto_2059487 ) ) ( not ( = ?auto_2059483 ?auto_2059488 ) ) ( not ( = ?auto_2059483 ?auto_2059489 ) ) ( not ( = ?auto_2059484 ?auto_2059485 ) ) ( not ( = ?auto_2059484 ?auto_2059486 ) ) ( not ( = ?auto_2059484 ?auto_2059487 ) ) ( not ( = ?auto_2059484 ?auto_2059488 ) ) ( not ( = ?auto_2059484 ?auto_2059489 ) ) ( not ( = ?auto_2059485 ?auto_2059486 ) ) ( not ( = ?auto_2059485 ?auto_2059487 ) ) ( not ( = ?auto_2059485 ?auto_2059488 ) ) ( not ( = ?auto_2059485 ?auto_2059489 ) ) ( not ( = ?auto_2059486 ?auto_2059487 ) ) ( not ( = ?auto_2059486 ?auto_2059488 ) ) ( not ( = ?auto_2059486 ?auto_2059489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2059487 ?auto_2059488 ?auto_2059489 )
      ( MAKE-12CRATE-VERIFY ?auto_2059477 ?auto_2059478 ?auto_2059479 ?auto_2059481 ?auto_2059480 ?auto_2059482 ?auto_2059483 ?auto_2059484 ?auto_2059485 ?auto_2059486 ?auto_2059487 ?auto_2059488 ?auto_2059489 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059615 - SURFACE
      ?auto_2059616 - SURFACE
      ?auto_2059617 - SURFACE
      ?auto_2059619 - SURFACE
      ?auto_2059618 - SURFACE
      ?auto_2059620 - SURFACE
      ?auto_2059621 - SURFACE
      ?auto_2059622 - SURFACE
      ?auto_2059623 - SURFACE
      ?auto_2059624 - SURFACE
      ?auto_2059625 - SURFACE
      ?auto_2059626 - SURFACE
      ?auto_2059627 - SURFACE
    )
    :vars
    (
      ?auto_2059629 - HOIST
      ?auto_2059628 - PLACE
      ?auto_2059631 - TRUCK
      ?auto_2059630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059629 ?auto_2059628 ) ( SURFACE-AT ?auto_2059626 ?auto_2059628 ) ( CLEAR ?auto_2059626 ) ( IS-CRATE ?auto_2059627 ) ( not ( = ?auto_2059626 ?auto_2059627 ) ) ( AVAILABLE ?auto_2059629 ) ( IN ?auto_2059627 ?auto_2059631 ) ( ON ?auto_2059626 ?auto_2059625 ) ( not ( = ?auto_2059625 ?auto_2059626 ) ) ( not ( = ?auto_2059625 ?auto_2059627 ) ) ( TRUCK-AT ?auto_2059631 ?auto_2059630 ) ( not ( = ?auto_2059630 ?auto_2059628 ) ) ( ON ?auto_2059616 ?auto_2059615 ) ( ON ?auto_2059617 ?auto_2059616 ) ( ON ?auto_2059619 ?auto_2059617 ) ( ON ?auto_2059618 ?auto_2059619 ) ( ON ?auto_2059620 ?auto_2059618 ) ( ON ?auto_2059621 ?auto_2059620 ) ( ON ?auto_2059622 ?auto_2059621 ) ( ON ?auto_2059623 ?auto_2059622 ) ( ON ?auto_2059624 ?auto_2059623 ) ( ON ?auto_2059625 ?auto_2059624 ) ( not ( = ?auto_2059615 ?auto_2059616 ) ) ( not ( = ?auto_2059615 ?auto_2059617 ) ) ( not ( = ?auto_2059615 ?auto_2059619 ) ) ( not ( = ?auto_2059615 ?auto_2059618 ) ) ( not ( = ?auto_2059615 ?auto_2059620 ) ) ( not ( = ?auto_2059615 ?auto_2059621 ) ) ( not ( = ?auto_2059615 ?auto_2059622 ) ) ( not ( = ?auto_2059615 ?auto_2059623 ) ) ( not ( = ?auto_2059615 ?auto_2059624 ) ) ( not ( = ?auto_2059615 ?auto_2059625 ) ) ( not ( = ?auto_2059615 ?auto_2059626 ) ) ( not ( = ?auto_2059615 ?auto_2059627 ) ) ( not ( = ?auto_2059616 ?auto_2059617 ) ) ( not ( = ?auto_2059616 ?auto_2059619 ) ) ( not ( = ?auto_2059616 ?auto_2059618 ) ) ( not ( = ?auto_2059616 ?auto_2059620 ) ) ( not ( = ?auto_2059616 ?auto_2059621 ) ) ( not ( = ?auto_2059616 ?auto_2059622 ) ) ( not ( = ?auto_2059616 ?auto_2059623 ) ) ( not ( = ?auto_2059616 ?auto_2059624 ) ) ( not ( = ?auto_2059616 ?auto_2059625 ) ) ( not ( = ?auto_2059616 ?auto_2059626 ) ) ( not ( = ?auto_2059616 ?auto_2059627 ) ) ( not ( = ?auto_2059617 ?auto_2059619 ) ) ( not ( = ?auto_2059617 ?auto_2059618 ) ) ( not ( = ?auto_2059617 ?auto_2059620 ) ) ( not ( = ?auto_2059617 ?auto_2059621 ) ) ( not ( = ?auto_2059617 ?auto_2059622 ) ) ( not ( = ?auto_2059617 ?auto_2059623 ) ) ( not ( = ?auto_2059617 ?auto_2059624 ) ) ( not ( = ?auto_2059617 ?auto_2059625 ) ) ( not ( = ?auto_2059617 ?auto_2059626 ) ) ( not ( = ?auto_2059617 ?auto_2059627 ) ) ( not ( = ?auto_2059619 ?auto_2059618 ) ) ( not ( = ?auto_2059619 ?auto_2059620 ) ) ( not ( = ?auto_2059619 ?auto_2059621 ) ) ( not ( = ?auto_2059619 ?auto_2059622 ) ) ( not ( = ?auto_2059619 ?auto_2059623 ) ) ( not ( = ?auto_2059619 ?auto_2059624 ) ) ( not ( = ?auto_2059619 ?auto_2059625 ) ) ( not ( = ?auto_2059619 ?auto_2059626 ) ) ( not ( = ?auto_2059619 ?auto_2059627 ) ) ( not ( = ?auto_2059618 ?auto_2059620 ) ) ( not ( = ?auto_2059618 ?auto_2059621 ) ) ( not ( = ?auto_2059618 ?auto_2059622 ) ) ( not ( = ?auto_2059618 ?auto_2059623 ) ) ( not ( = ?auto_2059618 ?auto_2059624 ) ) ( not ( = ?auto_2059618 ?auto_2059625 ) ) ( not ( = ?auto_2059618 ?auto_2059626 ) ) ( not ( = ?auto_2059618 ?auto_2059627 ) ) ( not ( = ?auto_2059620 ?auto_2059621 ) ) ( not ( = ?auto_2059620 ?auto_2059622 ) ) ( not ( = ?auto_2059620 ?auto_2059623 ) ) ( not ( = ?auto_2059620 ?auto_2059624 ) ) ( not ( = ?auto_2059620 ?auto_2059625 ) ) ( not ( = ?auto_2059620 ?auto_2059626 ) ) ( not ( = ?auto_2059620 ?auto_2059627 ) ) ( not ( = ?auto_2059621 ?auto_2059622 ) ) ( not ( = ?auto_2059621 ?auto_2059623 ) ) ( not ( = ?auto_2059621 ?auto_2059624 ) ) ( not ( = ?auto_2059621 ?auto_2059625 ) ) ( not ( = ?auto_2059621 ?auto_2059626 ) ) ( not ( = ?auto_2059621 ?auto_2059627 ) ) ( not ( = ?auto_2059622 ?auto_2059623 ) ) ( not ( = ?auto_2059622 ?auto_2059624 ) ) ( not ( = ?auto_2059622 ?auto_2059625 ) ) ( not ( = ?auto_2059622 ?auto_2059626 ) ) ( not ( = ?auto_2059622 ?auto_2059627 ) ) ( not ( = ?auto_2059623 ?auto_2059624 ) ) ( not ( = ?auto_2059623 ?auto_2059625 ) ) ( not ( = ?auto_2059623 ?auto_2059626 ) ) ( not ( = ?auto_2059623 ?auto_2059627 ) ) ( not ( = ?auto_2059624 ?auto_2059625 ) ) ( not ( = ?auto_2059624 ?auto_2059626 ) ) ( not ( = ?auto_2059624 ?auto_2059627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2059625 ?auto_2059626 ?auto_2059627 )
      ( MAKE-12CRATE-VERIFY ?auto_2059615 ?auto_2059616 ?auto_2059617 ?auto_2059619 ?auto_2059618 ?auto_2059620 ?auto_2059621 ?auto_2059622 ?auto_2059623 ?auto_2059624 ?auto_2059625 ?auto_2059626 ?auto_2059627 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059765 - SURFACE
      ?auto_2059766 - SURFACE
      ?auto_2059767 - SURFACE
      ?auto_2059769 - SURFACE
      ?auto_2059768 - SURFACE
      ?auto_2059770 - SURFACE
      ?auto_2059771 - SURFACE
      ?auto_2059772 - SURFACE
      ?auto_2059773 - SURFACE
      ?auto_2059774 - SURFACE
      ?auto_2059775 - SURFACE
      ?auto_2059776 - SURFACE
      ?auto_2059777 - SURFACE
    )
    :vars
    (
      ?auto_2059778 - HOIST
      ?auto_2059782 - PLACE
      ?auto_2059780 - TRUCK
      ?auto_2059781 - PLACE
      ?auto_2059779 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059778 ?auto_2059782 ) ( SURFACE-AT ?auto_2059776 ?auto_2059782 ) ( CLEAR ?auto_2059776 ) ( IS-CRATE ?auto_2059777 ) ( not ( = ?auto_2059776 ?auto_2059777 ) ) ( AVAILABLE ?auto_2059778 ) ( ON ?auto_2059776 ?auto_2059775 ) ( not ( = ?auto_2059775 ?auto_2059776 ) ) ( not ( = ?auto_2059775 ?auto_2059777 ) ) ( TRUCK-AT ?auto_2059780 ?auto_2059781 ) ( not ( = ?auto_2059781 ?auto_2059782 ) ) ( HOIST-AT ?auto_2059779 ?auto_2059781 ) ( LIFTING ?auto_2059779 ?auto_2059777 ) ( not ( = ?auto_2059778 ?auto_2059779 ) ) ( ON ?auto_2059766 ?auto_2059765 ) ( ON ?auto_2059767 ?auto_2059766 ) ( ON ?auto_2059769 ?auto_2059767 ) ( ON ?auto_2059768 ?auto_2059769 ) ( ON ?auto_2059770 ?auto_2059768 ) ( ON ?auto_2059771 ?auto_2059770 ) ( ON ?auto_2059772 ?auto_2059771 ) ( ON ?auto_2059773 ?auto_2059772 ) ( ON ?auto_2059774 ?auto_2059773 ) ( ON ?auto_2059775 ?auto_2059774 ) ( not ( = ?auto_2059765 ?auto_2059766 ) ) ( not ( = ?auto_2059765 ?auto_2059767 ) ) ( not ( = ?auto_2059765 ?auto_2059769 ) ) ( not ( = ?auto_2059765 ?auto_2059768 ) ) ( not ( = ?auto_2059765 ?auto_2059770 ) ) ( not ( = ?auto_2059765 ?auto_2059771 ) ) ( not ( = ?auto_2059765 ?auto_2059772 ) ) ( not ( = ?auto_2059765 ?auto_2059773 ) ) ( not ( = ?auto_2059765 ?auto_2059774 ) ) ( not ( = ?auto_2059765 ?auto_2059775 ) ) ( not ( = ?auto_2059765 ?auto_2059776 ) ) ( not ( = ?auto_2059765 ?auto_2059777 ) ) ( not ( = ?auto_2059766 ?auto_2059767 ) ) ( not ( = ?auto_2059766 ?auto_2059769 ) ) ( not ( = ?auto_2059766 ?auto_2059768 ) ) ( not ( = ?auto_2059766 ?auto_2059770 ) ) ( not ( = ?auto_2059766 ?auto_2059771 ) ) ( not ( = ?auto_2059766 ?auto_2059772 ) ) ( not ( = ?auto_2059766 ?auto_2059773 ) ) ( not ( = ?auto_2059766 ?auto_2059774 ) ) ( not ( = ?auto_2059766 ?auto_2059775 ) ) ( not ( = ?auto_2059766 ?auto_2059776 ) ) ( not ( = ?auto_2059766 ?auto_2059777 ) ) ( not ( = ?auto_2059767 ?auto_2059769 ) ) ( not ( = ?auto_2059767 ?auto_2059768 ) ) ( not ( = ?auto_2059767 ?auto_2059770 ) ) ( not ( = ?auto_2059767 ?auto_2059771 ) ) ( not ( = ?auto_2059767 ?auto_2059772 ) ) ( not ( = ?auto_2059767 ?auto_2059773 ) ) ( not ( = ?auto_2059767 ?auto_2059774 ) ) ( not ( = ?auto_2059767 ?auto_2059775 ) ) ( not ( = ?auto_2059767 ?auto_2059776 ) ) ( not ( = ?auto_2059767 ?auto_2059777 ) ) ( not ( = ?auto_2059769 ?auto_2059768 ) ) ( not ( = ?auto_2059769 ?auto_2059770 ) ) ( not ( = ?auto_2059769 ?auto_2059771 ) ) ( not ( = ?auto_2059769 ?auto_2059772 ) ) ( not ( = ?auto_2059769 ?auto_2059773 ) ) ( not ( = ?auto_2059769 ?auto_2059774 ) ) ( not ( = ?auto_2059769 ?auto_2059775 ) ) ( not ( = ?auto_2059769 ?auto_2059776 ) ) ( not ( = ?auto_2059769 ?auto_2059777 ) ) ( not ( = ?auto_2059768 ?auto_2059770 ) ) ( not ( = ?auto_2059768 ?auto_2059771 ) ) ( not ( = ?auto_2059768 ?auto_2059772 ) ) ( not ( = ?auto_2059768 ?auto_2059773 ) ) ( not ( = ?auto_2059768 ?auto_2059774 ) ) ( not ( = ?auto_2059768 ?auto_2059775 ) ) ( not ( = ?auto_2059768 ?auto_2059776 ) ) ( not ( = ?auto_2059768 ?auto_2059777 ) ) ( not ( = ?auto_2059770 ?auto_2059771 ) ) ( not ( = ?auto_2059770 ?auto_2059772 ) ) ( not ( = ?auto_2059770 ?auto_2059773 ) ) ( not ( = ?auto_2059770 ?auto_2059774 ) ) ( not ( = ?auto_2059770 ?auto_2059775 ) ) ( not ( = ?auto_2059770 ?auto_2059776 ) ) ( not ( = ?auto_2059770 ?auto_2059777 ) ) ( not ( = ?auto_2059771 ?auto_2059772 ) ) ( not ( = ?auto_2059771 ?auto_2059773 ) ) ( not ( = ?auto_2059771 ?auto_2059774 ) ) ( not ( = ?auto_2059771 ?auto_2059775 ) ) ( not ( = ?auto_2059771 ?auto_2059776 ) ) ( not ( = ?auto_2059771 ?auto_2059777 ) ) ( not ( = ?auto_2059772 ?auto_2059773 ) ) ( not ( = ?auto_2059772 ?auto_2059774 ) ) ( not ( = ?auto_2059772 ?auto_2059775 ) ) ( not ( = ?auto_2059772 ?auto_2059776 ) ) ( not ( = ?auto_2059772 ?auto_2059777 ) ) ( not ( = ?auto_2059773 ?auto_2059774 ) ) ( not ( = ?auto_2059773 ?auto_2059775 ) ) ( not ( = ?auto_2059773 ?auto_2059776 ) ) ( not ( = ?auto_2059773 ?auto_2059777 ) ) ( not ( = ?auto_2059774 ?auto_2059775 ) ) ( not ( = ?auto_2059774 ?auto_2059776 ) ) ( not ( = ?auto_2059774 ?auto_2059777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2059775 ?auto_2059776 ?auto_2059777 )
      ( MAKE-12CRATE-VERIFY ?auto_2059765 ?auto_2059766 ?auto_2059767 ?auto_2059769 ?auto_2059768 ?auto_2059770 ?auto_2059771 ?auto_2059772 ?auto_2059773 ?auto_2059774 ?auto_2059775 ?auto_2059776 ?auto_2059777 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059927 - SURFACE
      ?auto_2059928 - SURFACE
      ?auto_2059929 - SURFACE
      ?auto_2059931 - SURFACE
      ?auto_2059930 - SURFACE
      ?auto_2059932 - SURFACE
      ?auto_2059933 - SURFACE
      ?auto_2059934 - SURFACE
      ?auto_2059935 - SURFACE
      ?auto_2059936 - SURFACE
      ?auto_2059937 - SURFACE
      ?auto_2059938 - SURFACE
      ?auto_2059939 - SURFACE
    )
    :vars
    (
      ?auto_2059940 - HOIST
      ?auto_2059944 - PLACE
      ?auto_2059941 - TRUCK
      ?auto_2059942 - PLACE
      ?auto_2059943 - HOIST
      ?auto_2059945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059940 ?auto_2059944 ) ( SURFACE-AT ?auto_2059938 ?auto_2059944 ) ( CLEAR ?auto_2059938 ) ( IS-CRATE ?auto_2059939 ) ( not ( = ?auto_2059938 ?auto_2059939 ) ) ( AVAILABLE ?auto_2059940 ) ( ON ?auto_2059938 ?auto_2059937 ) ( not ( = ?auto_2059937 ?auto_2059938 ) ) ( not ( = ?auto_2059937 ?auto_2059939 ) ) ( TRUCK-AT ?auto_2059941 ?auto_2059942 ) ( not ( = ?auto_2059942 ?auto_2059944 ) ) ( HOIST-AT ?auto_2059943 ?auto_2059942 ) ( not ( = ?auto_2059940 ?auto_2059943 ) ) ( AVAILABLE ?auto_2059943 ) ( SURFACE-AT ?auto_2059939 ?auto_2059942 ) ( ON ?auto_2059939 ?auto_2059945 ) ( CLEAR ?auto_2059939 ) ( not ( = ?auto_2059938 ?auto_2059945 ) ) ( not ( = ?auto_2059939 ?auto_2059945 ) ) ( not ( = ?auto_2059937 ?auto_2059945 ) ) ( ON ?auto_2059928 ?auto_2059927 ) ( ON ?auto_2059929 ?auto_2059928 ) ( ON ?auto_2059931 ?auto_2059929 ) ( ON ?auto_2059930 ?auto_2059931 ) ( ON ?auto_2059932 ?auto_2059930 ) ( ON ?auto_2059933 ?auto_2059932 ) ( ON ?auto_2059934 ?auto_2059933 ) ( ON ?auto_2059935 ?auto_2059934 ) ( ON ?auto_2059936 ?auto_2059935 ) ( ON ?auto_2059937 ?auto_2059936 ) ( not ( = ?auto_2059927 ?auto_2059928 ) ) ( not ( = ?auto_2059927 ?auto_2059929 ) ) ( not ( = ?auto_2059927 ?auto_2059931 ) ) ( not ( = ?auto_2059927 ?auto_2059930 ) ) ( not ( = ?auto_2059927 ?auto_2059932 ) ) ( not ( = ?auto_2059927 ?auto_2059933 ) ) ( not ( = ?auto_2059927 ?auto_2059934 ) ) ( not ( = ?auto_2059927 ?auto_2059935 ) ) ( not ( = ?auto_2059927 ?auto_2059936 ) ) ( not ( = ?auto_2059927 ?auto_2059937 ) ) ( not ( = ?auto_2059927 ?auto_2059938 ) ) ( not ( = ?auto_2059927 ?auto_2059939 ) ) ( not ( = ?auto_2059927 ?auto_2059945 ) ) ( not ( = ?auto_2059928 ?auto_2059929 ) ) ( not ( = ?auto_2059928 ?auto_2059931 ) ) ( not ( = ?auto_2059928 ?auto_2059930 ) ) ( not ( = ?auto_2059928 ?auto_2059932 ) ) ( not ( = ?auto_2059928 ?auto_2059933 ) ) ( not ( = ?auto_2059928 ?auto_2059934 ) ) ( not ( = ?auto_2059928 ?auto_2059935 ) ) ( not ( = ?auto_2059928 ?auto_2059936 ) ) ( not ( = ?auto_2059928 ?auto_2059937 ) ) ( not ( = ?auto_2059928 ?auto_2059938 ) ) ( not ( = ?auto_2059928 ?auto_2059939 ) ) ( not ( = ?auto_2059928 ?auto_2059945 ) ) ( not ( = ?auto_2059929 ?auto_2059931 ) ) ( not ( = ?auto_2059929 ?auto_2059930 ) ) ( not ( = ?auto_2059929 ?auto_2059932 ) ) ( not ( = ?auto_2059929 ?auto_2059933 ) ) ( not ( = ?auto_2059929 ?auto_2059934 ) ) ( not ( = ?auto_2059929 ?auto_2059935 ) ) ( not ( = ?auto_2059929 ?auto_2059936 ) ) ( not ( = ?auto_2059929 ?auto_2059937 ) ) ( not ( = ?auto_2059929 ?auto_2059938 ) ) ( not ( = ?auto_2059929 ?auto_2059939 ) ) ( not ( = ?auto_2059929 ?auto_2059945 ) ) ( not ( = ?auto_2059931 ?auto_2059930 ) ) ( not ( = ?auto_2059931 ?auto_2059932 ) ) ( not ( = ?auto_2059931 ?auto_2059933 ) ) ( not ( = ?auto_2059931 ?auto_2059934 ) ) ( not ( = ?auto_2059931 ?auto_2059935 ) ) ( not ( = ?auto_2059931 ?auto_2059936 ) ) ( not ( = ?auto_2059931 ?auto_2059937 ) ) ( not ( = ?auto_2059931 ?auto_2059938 ) ) ( not ( = ?auto_2059931 ?auto_2059939 ) ) ( not ( = ?auto_2059931 ?auto_2059945 ) ) ( not ( = ?auto_2059930 ?auto_2059932 ) ) ( not ( = ?auto_2059930 ?auto_2059933 ) ) ( not ( = ?auto_2059930 ?auto_2059934 ) ) ( not ( = ?auto_2059930 ?auto_2059935 ) ) ( not ( = ?auto_2059930 ?auto_2059936 ) ) ( not ( = ?auto_2059930 ?auto_2059937 ) ) ( not ( = ?auto_2059930 ?auto_2059938 ) ) ( not ( = ?auto_2059930 ?auto_2059939 ) ) ( not ( = ?auto_2059930 ?auto_2059945 ) ) ( not ( = ?auto_2059932 ?auto_2059933 ) ) ( not ( = ?auto_2059932 ?auto_2059934 ) ) ( not ( = ?auto_2059932 ?auto_2059935 ) ) ( not ( = ?auto_2059932 ?auto_2059936 ) ) ( not ( = ?auto_2059932 ?auto_2059937 ) ) ( not ( = ?auto_2059932 ?auto_2059938 ) ) ( not ( = ?auto_2059932 ?auto_2059939 ) ) ( not ( = ?auto_2059932 ?auto_2059945 ) ) ( not ( = ?auto_2059933 ?auto_2059934 ) ) ( not ( = ?auto_2059933 ?auto_2059935 ) ) ( not ( = ?auto_2059933 ?auto_2059936 ) ) ( not ( = ?auto_2059933 ?auto_2059937 ) ) ( not ( = ?auto_2059933 ?auto_2059938 ) ) ( not ( = ?auto_2059933 ?auto_2059939 ) ) ( not ( = ?auto_2059933 ?auto_2059945 ) ) ( not ( = ?auto_2059934 ?auto_2059935 ) ) ( not ( = ?auto_2059934 ?auto_2059936 ) ) ( not ( = ?auto_2059934 ?auto_2059937 ) ) ( not ( = ?auto_2059934 ?auto_2059938 ) ) ( not ( = ?auto_2059934 ?auto_2059939 ) ) ( not ( = ?auto_2059934 ?auto_2059945 ) ) ( not ( = ?auto_2059935 ?auto_2059936 ) ) ( not ( = ?auto_2059935 ?auto_2059937 ) ) ( not ( = ?auto_2059935 ?auto_2059938 ) ) ( not ( = ?auto_2059935 ?auto_2059939 ) ) ( not ( = ?auto_2059935 ?auto_2059945 ) ) ( not ( = ?auto_2059936 ?auto_2059937 ) ) ( not ( = ?auto_2059936 ?auto_2059938 ) ) ( not ( = ?auto_2059936 ?auto_2059939 ) ) ( not ( = ?auto_2059936 ?auto_2059945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2059937 ?auto_2059938 ?auto_2059939 )
      ( MAKE-12CRATE-VERIFY ?auto_2059927 ?auto_2059928 ?auto_2059929 ?auto_2059931 ?auto_2059930 ?auto_2059932 ?auto_2059933 ?auto_2059934 ?auto_2059935 ?auto_2059936 ?auto_2059937 ?auto_2059938 ?auto_2059939 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060090 - SURFACE
      ?auto_2060091 - SURFACE
      ?auto_2060092 - SURFACE
      ?auto_2060094 - SURFACE
      ?auto_2060093 - SURFACE
      ?auto_2060095 - SURFACE
      ?auto_2060096 - SURFACE
      ?auto_2060097 - SURFACE
      ?auto_2060098 - SURFACE
      ?auto_2060099 - SURFACE
      ?auto_2060100 - SURFACE
      ?auto_2060101 - SURFACE
      ?auto_2060102 - SURFACE
    )
    :vars
    (
      ?auto_2060105 - HOIST
      ?auto_2060108 - PLACE
      ?auto_2060107 - PLACE
      ?auto_2060106 - HOIST
      ?auto_2060104 - SURFACE
      ?auto_2060103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060105 ?auto_2060108 ) ( SURFACE-AT ?auto_2060101 ?auto_2060108 ) ( CLEAR ?auto_2060101 ) ( IS-CRATE ?auto_2060102 ) ( not ( = ?auto_2060101 ?auto_2060102 ) ) ( AVAILABLE ?auto_2060105 ) ( ON ?auto_2060101 ?auto_2060100 ) ( not ( = ?auto_2060100 ?auto_2060101 ) ) ( not ( = ?auto_2060100 ?auto_2060102 ) ) ( not ( = ?auto_2060107 ?auto_2060108 ) ) ( HOIST-AT ?auto_2060106 ?auto_2060107 ) ( not ( = ?auto_2060105 ?auto_2060106 ) ) ( AVAILABLE ?auto_2060106 ) ( SURFACE-AT ?auto_2060102 ?auto_2060107 ) ( ON ?auto_2060102 ?auto_2060104 ) ( CLEAR ?auto_2060102 ) ( not ( = ?auto_2060101 ?auto_2060104 ) ) ( not ( = ?auto_2060102 ?auto_2060104 ) ) ( not ( = ?auto_2060100 ?auto_2060104 ) ) ( TRUCK-AT ?auto_2060103 ?auto_2060108 ) ( ON ?auto_2060091 ?auto_2060090 ) ( ON ?auto_2060092 ?auto_2060091 ) ( ON ?auto_2060094 ?auto_2060092 ) ( ON ?auto_2060093 ?auto_2060094 ) ( ON ?auto_2060095 ?auto_2060093 ) ( ON ?auto_2060096 ?auto_2060095 ) ( ON ?auto_2060097 ?auto_2060096 ) ( ON ?auto_2060098 ?auto_2060097 ) ( ON ?auto_2060099 ?auto_2060098 ) ( ON ?auto_2060100 ?auto_2060099 ) ( not ( = ?auto_2060090 ?auto_2060091 ) ) ( not ( = ?auto_2060090 ?auto_2060092 ) ) ( not ( = ?auto_2060090 ?auto_2060094 ) ) ( not ( = ?auto_2060090 ?auto_2060093 ) ) ( not ( = ?auto_2060090 ?auto_2060095 ) ) ( not ( = ?auto_2060090 ?auto_2060096 ) ) ( not ( = ?auto_2060090 ?auto_2060097 ) ) ( not ( = ?auto_2060090 ?auto_2060098 ) ) ( not ( = ?auto_2060090 ?auto_2060099 ) ) ( not ( = ?auto_2060090 ?auto_2060100 ) ) ( not ( = ?auto_2060090 ?auto_2060101 ) ) ( not ( = ?auto_2060090 ?auto_2060102 ) ) ( not ( = ?auto_2060090 ?auto_2060104 ) ) ( not ( = ?auto_2060091 ?auto_2060092 ) ) ( not ( = ?auto_2060091 ?auto_2060094 ) ) ( not ( = ?auto_2060091 ?auto_2060093 ) ) ( not ( = ?auto_2060091 ?auto_2060095 ) ) ( not ( = ?auto_2060091 ?auto_2060096 ) ) ( not ( = ?auto_2060091 ?auto_2060097 ) ) ( not ( = ?auto_2060091 ?auto_2060098 ) ) ( not ( = ?auto_2060091 ?auto_2060099 ) ) ( not ( = ?auto_2060091 ?auto_2060100 ) ) ( not ( = ?auto_2060091 ?auto_2060101 ) ) ( not ( = ?auto_2060091 ?auto_2060102 ) ) ( not ( = ?auto_2060091 ?auto_2060104 ) ) ( not ( = ?auto_2060092 ?auto_2060094 ) ) ( not ( = ?auto_2060092 ?auto_2060093 ) ) ( not ( = ?auto_2060092 ?auto_2060095 ) ) ( not ( = ?auto_2060092 ?auto_2060096 ) ) ( not ( = ?auto_2060092 ?auto_2060097 ) ) ( not ( = ?auto_2060092 ?auto_2060098 ) ) ( not ( = ?auto_2060092 ?auto_2060099 ) ) ( not ( = ?auto_2060092 ?auto_2060100 ) ) ( not ( = ?auto_2060092 ?auto_2060101 ) ) ( not ( = ?auto_2060092 ?auto_2060102 ) ) ( not ( = ?auto_2060092 ?auto_2060104 ) ) ( not ( = ?auto_2060094 ?auto_2060093 ) ) ( not ( = ?auto_2060094 ?auto_2060095 ) ) ( not ( = ?auto_2060094 ?auto_2060096 ) ) ( not ( = ?auto_2060094 ?auto_2060097 ) ) ( not ( = ?auto_2060094 ?auto_2060098 ) ) ( not ( = ?auto_2060094 ?auto_2060099 ) ) ( not ( = ?auto_2060094 ?auto_2060100 ) ) ( not ( = ?auto_2060094 ?auto_2060101 ) ) ( not ( = ?auto_2060094 ?auto_2060102 ) ) ( not ( = ?auto_2060094 ?auto_2060104 ) ) ( not ( = ?auto_2060093 ?auto_2060095 ) ) ( not ( = ?auto_2060093 ?auto_2060096 ) ) ( not ( = ?auto_2060093 ?auto_2060097 ) ) ( not ( = ?auto_2060093 ?auto_2060098 ) ) ( not ( = ?auto_2060093 ?auto_2060099 ) ) ( not ( = ?auto_2060093 ?auto_2060100 ) ) ( not ( = ?auto_2060093 ?auto_2060101 ) ) ( not ( = ?auto_2060093 ?auto_2060102 ) ) ( not ( = ?auto_2060093 ?auto_2060104 ) ) ( not ( = ?auto_2060095 ?auto_2060096 ) ) ( not ( = ?auto_2060095 ?auto_2060097 ) ) ( not ( = ?auto_2060095 ?auto_2060098 ) ) ( not ( = ?auto_2060095 ?auto_2060099 ) ) ( not ( = ?auto_2060095 ?auto_2060100 ) ) ( not ( = ?auto_2060095 ?auto_2060101 ) ) ( not ( = ?auto_2060095 ?auto_2060102 ) ) ( not ( = ?auto_2060095 ?auto_2060104 ) ) ( not ( = ?auto_2060096 ?auto_2060097 ) ) ( not ( = ?auto_2060096 ?auto_2060098 ) ) ( not ( = ?auto_2060096 ?auto_2060099 ) ) ( not ( = ?auto_2060096 ?auto_2060100 ) ) ( not ( = ?auto_2060096 ?auto_2060101 ) ) ( not ( = ?auto_2060096 ?auto_2060102 ) ) ( not ( = ?auto_2060096 ?auto_2060104 ) ) ( not ( = ?auto_2060097 ?auto_2060098 ) ) ( not ( = ?auto_2060097 ?auto_2060099 ) ) ( not ( = ?auto_2060097 ?auto_2060100 ) ) ( not ( = ?auto_2060097 ?auto_2060101 ) ) ( not ( = ?auto_2060097 ?auto_2060102 ) ) ( not ( = ?auto_2060097 ?auto_2060104 ) ) ( not ( = ?auto_2060098 ?auto_2060099 ) ) ( not ( = ?auto_2060098 ?auto_2060100 ) ) ( not ( = ?auto_2060098 ?auto_2060101 ) ) ( not ( = ?auto_2060098 ?auto_2060102 ) ) ( not ( = ?auto_2060098 ?auto_2060104 ) ) ( not ( = ?auto_2060099 ?auto_2060100 ) ) ( not ( = ?auto_2060099 ?auto_2060101 ) ) ( not ( = ?auto_2060099 ?auto_2060102 ) ) ( not ( = ?auto_2060099 ?auto_2060104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060100 ?auto_2060101 ?auto_2060102 )
      ( MAKE-12CRATE-VERIFY ?auto_2060090 ?auto_2060091 ?auto_2060092 ?auto_2060094 ?auto_2060093 ?auto_2060095 ?auto_2060096 ?auto_2060097 ?auto_2060098 ?auto_2060099 ?auto_2060100 ?auto_2060101 ?auto_2060102 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060253 - SURFACE
      ?auto_2060254 - SURFACE
      ?auto_2060255 - SURFACE
      ?auto_2060257 - SURFACE
      ?auto_2060256 - SURFACE
      ?auto_2060258 - SURFACE
      ?auto_2060259 - SURFACE
      ?auto_2060260 - SURFACE
      ?auto_2060261 - SURFACE
      ?auto_2060262 - SURFACE
      ?auto_2060263 - SURFACE
      ?auto_2060264 - SURFACE
      ?auto_2060265 - SURFACE
    )
    :vars
    (
      ?auto_2060266 - HOIST
      ?auto_2060271 - PLACE
      ?auto_2060268 - PLACE
      ?auto_2060267 - HOIST
      ?auto_2060270 - SURFACE
      ?auto_2060269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060266 ?auto_2060271 ) ( IS-CRATE ?auto_2060265 ) ( not ( = ?auto_2060264 ?auto_2060265 ) ) ( not ( = ?auto_2060263 ?auto_2060264 ) ) ( not ( = ?auto_2060263 ?auto_2060265 ) ) ( not ( = ?auto_2060268 ?auto_2060271 ) ) ( HOIST-AT ?auto_2060267 ?auto_2060268 ) ( not ( = ?auto_2060266 ?auto_2060267 ) ) ( AVAILABLE ?auto_2060267 ) ( SURFACE-AT ?auto_2060265 ?auto_2060268 ) ( ON ?auto_2060265 ?auto_2060270 ) ( CLEAR ?auto_2060265 ) ( not ( = ?auto_2060264 ?auto_2060270 ) ) ( not ( = ?auto_2060265 ?auto_2060270 ) ) ( not ( = ?auto_2060263 ?auto_2060270 ) ) ( TRUCK-AT ?auto_2060269 ?auto_2060271 ) ( SURFACE-AT ?auto_2060263 ?auto_2060271 ) ( CLEAR ?auto_2060263 ) ( LIFTING ?auto_2060266 ?auto_2060264 ) ( IS-CRATE ?auto_2060264 ) ( ON ?auto_2060254 ?auto_2060253 ) ( ON ?auto_2060255 ?auto_2060254 ) ( ON ?auto_2060257 ?auto_2060255 ) ( ON ?auto_2060256 ?auto_2060257 ) ( ON ?auto_2060258 ?auto_2060256 ) ( ON ?auto_2060259 ?auto_2060258 ) ( ON ?auto_2060260 ?auto_2060259 ) ( ON ?auto_2060261 ?auto_2060260 ) ( ON ?auto_2060262 ?auto_2060261 ) ( ON ?auto_2060263 ?auto_2060262 ) ( not ( = ?auto_2060253 ?auto_2060254 ) ) ( not ( = ?auto_2060253 ?auto_2060255 ) ) ( not ( = ?auto_2060253 ?auto_2060257 ) ) ( not ( = ?auto_2060253 ?auto_2060256 ) ) ( not ( = ?auto_2060253 ?auto_2060258 ) ) ( not ( = ?auto_2060253 ?auto_2060259 ) ) ( not ( = ?auto_2060253 ?auto_2060260 ) ) ( not ( = ?auto_2060253 ?auto_2060261 ) ) ( not ( = ?auto_2060253 ?auto_2060262 ) ) ( not ( = ?auto_2060253 ?auto_2060263 ) ) ( not ( = ?auto_2060253 ?auto_2060264 ) ) ( not ( = ?auto_2060253 ?auto_2060265 ) ) ( not ( = ?auto_2060253 ?auto_2060270 ) ) ( not ( = ?auto_2060254 ?auto_2060255 ) ) ( not ( = ?auto_2060254 ?auto_2060257 ) ) ( not ( = ?auto_2060254 ?auto_2060256 ) ) ( not ( = ?auto_2060254 ?auto_2060258 ) ) ( not ( = ?auto_2060254 ?auto_2060259 ) ) ( not ( = ?auto_2060254 ?auto_2060260 ) ) ( not ( = ?auto_2060254 ?auto_2060261 ) ) ( not ( = ?auto_2060254 ?auto_2060262 ) ) ( not ( = ?auto_2060254 ?auto_2060263 ) ) ( not ( = ?auto_2060254 ?auto_2060264 ) ) ( not ( = ?auto_2060254 ?auto_2060265 ) ) ( not ( = ?auto_2060254 ?auto_2060270 ) ) ( not ( = ?auto_2060255 ?auto_2060257 ) ) ( not ( = ?auto_2060255 ?auto_2060256 ) ) ( not ( = ?auto_2060255 ?auto_2060258 ) ) ( not ( = ?auto_2060255 ?auto_2060259 ) ) ( not ( = ?auto_2060255 ?auto_2060260 ) ) ( not ( = ?auto_2060255 ?auto_2060261 ) ) ( not ( = ?auto_2060255 ?auto_2060262 ) ) ( not ( = ?auto_2060255 ?auto_2060263 ) ) ( not ( = ?auto_2060255 ?auto_2060264 ) ) ( not ( = ?auto_2060255 ?auto_2060265 ) ) ( not ( = ?auto_2060255 ?auto_2060270 ) ) ( not ( = ?auto_2060257 ?auto_2060256 ) ) ( not ( = ?auto_2060257 ?auto_2060258 ) ) ( not ( = ?auto_2060257 ?auto_2060259 ) ) ( not ( = ?auto_2060257 ?auto_2060260 ) ) ( not ( = ?auto_2060257 ?auto_2060261 ) ) ( not ( = ?auto_2060257 ?auto_2060262 ) ) ( not ( = ?auto_2060257 ?auto_2060263 ) ) ( not ( = ?auto_2060257 ?auto_2060264 ) ) ( not ( = ?auto_2060257 ?auto_2060265 ) ) ( not ( = ?auto_2060257 ?auto_2060270 ) ) ( not ( = ?auto_2060256 ?auto_2060258 ) ) ( not ( = ?auto_2060256 ?auto_2060259 ) ) ( not ( = ?auto_2060256 ?auto_2060260 ) ) ( not ( = ?auto_2060256 ?auto_2060261 ) ) ( not ( = ?auto_2060256 ?auto_2060262 ) ) ( not ( = ?auto_2060256 ?auto_2060263 ) ) ( not ( = ?auto_2060256 ?auto_2060264 ) ) ( not ( = ?auto_2060256 ?auto_2060265 ) ) ( not ( = ?auto_2060256 ?auto_2060270 ) ) ( not ( = ?auto_2060258 ?auto_2060259 ) ) ( not ( = ?auto_2060258 ?auto_2060260 ) ) ( not ( = ?auto_2060258 ?auto_2060261 ) ) ( not ( = ?auto_2060258 ?auto_2060262 ) ) ( not ( = ?auto_2060258 ?auto_2060263 ) ) ( not ( = ?auto_2060258 ?auto_2060264 ) ) ( not ( = ?auto_2060258 ?auto_2060265 ) ) ( not ( = ?auto_2060258 ?auto_2060270 ) ) ( not ( = ?auto_2060259 ?auto_2060260 ) ) ( not ( = ?auto_2060259 ?auto_2060261 ) ) ( not ( = ?auto_2060259 ?auto_2060262 ) ) ( not ( = ?auto_2060259 ?auto_2060263 ) ) ( not ( = ?auto_2060259 ?auto_2060264 ) ) ( not ( = ?auto_2060259 ?auto_2060265 ) ) ( not ( = ?auto_2060259 ?auto_2060270 ) ) ( not ( = ?auto_2060260 ?auto_2060261 ) ) ( not ( = ?auto_2060260 ?auto_2060262 ) ) ( not ( = ?auto_2060260 ?auto_2060263 ) ) ( not ( = ?auto_2060260 ?auto_2060264 ) ) ( not ( = ?auto_2060260 ?auto_2060265 ) ) ( not ( = ?auto_2060260 ?auto_2060270 ) ) ( not ( = ?auto_2060261 ?auto_2060262 ) ) ( not ( = ?auto_2060261 ?auto_2060263 ) ) ( not ( = ?auto_2060261 ?auto_2060264 ) ) ( not ( = ?auto_2060261 ?auto_2060265 ) ) ( not ( = ?auto_2060261 ?auto_2060270 ) ) ( not ( = ?auto_2060262 ?auto_2060263 ) ) ( not ( = ?auto_2060262 ?auto_2060264 ) ) ( not ( = ?auto_2060262 ?auto_2060265 ) ) ( not ( = ?auto_2060262 ?auto_2060270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060263 ?auto_2060264 ?auto_2060265 )
      ( MAKE-12CRATE-VERIFY ?auto_2060253 ?auto_2060254 ?auto_2060255 ?auto_2060257 ?auto_2060256 ?auto_2060258 ?auto_2060259 ?auto_2060260 ?auto_2060261 ?auto_2060262 ?auto_2060263 ?auto_2060264 ?auto_2060265 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060416 - SURFACE
      ?auto_2060417 - SURFACE
      ?auto_2060418 - SURFACE
      ?auto_2060420 - SURFACE
      ?auto_2060419 - SURFACE
      ?auto_2060421 - SURFACE
      ?auto_2060422 - SURFACE
      ?auto_2060423 - SURFACE
      ?auto_2060424 - SURFACE
      ?auto_2060425 - SURFACE
      ?auto_2060426 - SURFACE
      ?auto_2060427 - SURFACE
      ?auto_2060428 - SURFACE
    )
    :vars
    (
      ?auto_2060431 - HOIST
      ?auto_2060430 - PLACE
      ?auto_2060434 - PLACE
      ?auto_2060429 - HOIST
      ?auto_2060432 - SURFACE
      ?auto_2060433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060431 ?auto_2060430 ) ( IS-CRATE ?auto_2060428 ) ( not ( = ?auto_2060427 ?auto_2060428 ) ) ( not ( = ?auto_2060426 ?auto_2060427 ) ) ( not ( = ?auto_2060426 ?auto_2060428 ) ) ( not ( = ?auto_2060434 ?auto_2060430 ) ) ( HOIST-AT ?auto_2060429 ?auto_2060434 ) ( not ( = ?auto_2060431 ?auto_2060429 ) ) ( AVAILABLE ?auto_2060429 ) ( SURFACE-AT ?auto_2060428 ?auto_2060434 ) ( ON ?auto_2060428 ?auto_2060432 ) ( CLEAR ?auto_2060428 ) ( not ( = ?auto_2060427 ?auto_2060432 ) ) ( not ( = ?auto_2060428 ?auto_2060432 ) ) ( not ( = ?auto_2060426 ?auto_2060432 ) ) ( TRUCK-AT ?auto_2060433 ?auto_2060430 ) ( SURFACE-AT ?auto_2060426 ?auto_2060430 ) ( CLEAR ?auto_2060426 ) ( IS-CRATE ?auto_2060427 ) ( AVAILABLE ?auto_2060431 ) ( IN ?auto_2060427 ?auto_2060433 ) ( ON ?auto_2060417 ?auto_2060416 ) ( ON ?auto_2060418 ?auto_2060417 ) ( ON ?auto_2060420 ?auto_2060418 ) ( ON ?auto_2060419 ?auto_2060420 ) ( ON ?auto_2060421 ?auto_2060419 ) ( ON ?auto_2060422 ?auto_2060421 ) ( ON ?auto_2060423 ?auto_2060422 ) ( ON ?auto_2060424 ?auto_2060423 ) ( ON ?auto_2060425 ?auto_2060424 ) ( ON ?auto_2060426 ?auto_2060425 ) ( not ( = ?auto_2060416 ?auto_2060417 ) ) ( not ( = ?auto_2060416 ?auto_2060418 ) ) ( not ( = ?auto_2060416 ?auto_2060420 ) ) ( not ( = ?auto_2060416 ?auto_2060419 ) ) ( not ( = ?auto_2060416 ?auto_2060421 ) ) ( not ( = ?auto_2060416 ?auto_2060422 ) ) ( not ( = ?auto_2060416 ?auto_2060423 ) ) ( not ( = ?auto_2060416 ?auto_2060424 ) ) ( not ( = ?auto_2060416 ?auto_2060425 ) ) ( not ( = ?auto_2060416 ?auto_2060426 ) ) ( not ( = ?auto_2060416 ?auto_2060427 ) ) ( not ( = ?auto_2060416 ?auto_2060428 ) ) ( not ( = ?auto_2060416 ?auto_2060432 ) ) ( not ( = ?auto_2060417 ?auto_2060418 ) ) ( not ( = ?auto_2060417 ?auto_2060420 ) ) ( not ( = ?auto_2060417 ?auto_2060419 ) ) ( not ( = ?auto_2060417 ?auto_2060421 ) ) ( not ( = ?auto_2060417 ?auto_2060422 ) ) ( not ( = ?auto_2060417 ?auto_2060423 ) ) ( not ( = ?auto_2060417 ?auto_2060424 ) ) ( not ( = ?auto_2060417 ?auto_2060425 ) ) ( not ( = ?auto_2060417 ?auto_2060426 ) ) ( not ( = ?auto_2060417 ?auto_2060427 ) ) ( not ( = ?auto_2060417 ?auto_2060428 ) ) ( not ( = ?auto_2060417 ?auto_2060432 ) ) ( not ( = ?auto_2060418 ?auto_2060420 ) ) ( not ( = ?auto_2060418 ?auto_2060419 ) ) ( not ( = ?auto_2060418 ?auto_2060421 ) ) ( not ( = ?auto_2060418 ?auto_2060422 ) ) ( not ( = ?auto_2060418 ?auto_2060423 ) ) ( not ( = ?auto_2060418 ?auto_2060424 ) ) ( not ( = ?auto_2060418 ?auto_2060425 ) ) ( not ( = ?auto_2060418 ?auto_2060426 ) ) ( not ( = ?auto_2060418 ?auto_2060427 ) ) ( not ( = ?auto_2060418 ?auto_2060428 ) ) ( not ( = ?auto_2060418 ?auto_2060432 ) ) ( not ( = ?auto_2060420 ?auto_2060419 ) ) ( not ( = ?auto_2060420 ?auto_2060421 ) ) ( not ( = ?auto_2060420 ?auto_2060422 ) ) ( not ( = ?auto_2060420 ?auto_2060423 ) ) ( not ( = ?auto_2060420 ?auto_2060424 ) ) ( not ( = ?auto_2060420 ?auto_2060425 ) ) ( not ( = ?auto_2060420 ?auto_2060426 ) ) ( not ( = ?auto_2060420 ?auto_2060427 ) ) ( not ( = ?auto_2060420 ?auto_2060428 ) ) ( not ( = ?auto_2060420 ?auto_2060432 ) ) ( not ( = ?auto_2060419 ?auto_2060421 ) ) ( not ( = ?auto_2060419 ?auto_2060422 ) ) ( not ( = ?auto_2060419 ?auto_2060423 ) ) ( not ( = ?auto_2060419 ?auto_2060424 ) ) ( not ( = ?auto_2060419 ?auto_2060425 ) ) ( not ( = ?auto_2060419 ?auto_2060426 ) ) ( not ( = ?auto_2060419 ?auto_2060427 ) ) ( not ( = ?auto_2060419 ?auto_2060428 ) ) ( not ( = ?auto_2060419 ?auto_2060432 ) ) ( not ( = ?auto_2060421 ?auto_2060422 ) ) ( not ( = ?auto_2060421 ?auto_2060423 ) ) ( not ( = ?auto_2060421 ?auto_2060424 ) ) ( not ( = ?auto_2060421 ?auto_2060425 ) ) ( not ( = ?auto_2060421 ?auto_2060426 ) ) ( not ( = ?auto_2060421 ?auto_2060427 ) ) ( not ( = ?auto_2060421 ?auto_2060428 ) ) ( not ( = ?auto_2060421 ?auto_2060432 ) ) ( not ( = ?auto_2060422 ?auto_2060423 ) ) ( not ( = ?auto_2060422 ?auto_2060424 ) ) ( not ( = ?auto_2060422 ?auto_2060425 ) ) ( not ( = ?auto_2060422 ?auto_2060426 ) ) ( not ( = ?auto_2060422 ?auto_2060427 ) ) ( not ( = ?auto_2060422 ?auto_2060428 ) ) ( not ( = ?auto_2060422 ?auto_2060432 ) ) ( not ( = ?auto_2060423 ?auto_2060424 ) ) ( not ( = ?auto_2060423 ?auto_2060425 ) ) ( not ( = ?auto_2060423 ?auto_2060426 ) ) ( not ( = ?auto_2060423 ?auto_2060427 ) ) ( not ( = ?auto_2060423 ?auto_2060428 ) ) ( not ( = ?auto_2060423 ?auto_2060432 ) ) ( not ( = ?auto_2060424 ?auto_2060425 ) ) ( not ( = ?auto_2060424 ?auto_2060426 ) ) ( not ( = ?auto_2060424 ?auto_2060427 ) ) ( not ( = ?auto_2060424 ?auto_2060428 ) ) ( not ( = ?auto_2060424 ?auto_2060432 ) ) ( not ( = ?auto_2060425 ?auto_2060426 ) ) ( not ( = ?auto_2060425 ?auto_2060427 ) ) ( not ( = ?auto_2060425 ?auto_2060428 ) ) ( not ( = ?auto_2060425 ?auto_2060432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060426 ?auto_2060427 ?auto_2060428 )
      ( MAKE-12CRATE-VERIFY ?auto_2060416 ?auto_2060417 ?auto_2060418 ?auto_2060420 ?auto_2060419 ?auto_2060421 ?auto_2060422 ?auto_2060423 ?auto_2060424 ?auto_2060425 ?auto_2060426 ?auto_2060427 ?auto_2060428 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2071913 - SURFACE
      ?auto_2071914 - SURFACE
      ?auto_2071915 - SURFACE
      ?auto_2071917 - SURFACE
      ?auto_2071916 - SURFACE
      ?auto_2071918 - SURFACE
      ?auto_2071919 - SURFACE
      ?auto_2071920 - SURFACE
      ?auto_2071921 - SURFACE
      ?auto_2071922 - SURFACE
      ?auto_2071923 - SURFACE
      ?auto_2071924 - SURFACE
      ?auto_2071925 - SURFACE
      ?auto_2071926 - SURFACE
    )
    :vars
    (
      ?auto_2071927 - HOIST
      ?auto_2071928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2071927 ?auto_2071928 ) ( SURFACE-AT ?auto_2071925 ?auto_2071928 ) ( CLEAR ?auto_2071925 ) ( LIFTING ?auto_2071927 ?auto_2071926 ) ( IS-CRATE ?auto_2071926 ) ( not ( = ?auto_2071925 ?auto_2071926 ) ) ( ON ?auto_2071914 ?auto_2071913 ) ( ON ?auto_2071915 ?auto_2071914 ) ( ON ?auto_2071917 ?auto_2071915 ) ( ON ?auto_2071916 ?auto_2071917 ) ( ON ?auto_2071918 ?auto_2071916 ) ( ON ?auto_2071919 ?auto_2071918 ) ( ON ?auto_2071920 ?auto_2071919 ) ( ON ?auto_2071921 ?auto_2071920 ) ( ON ?auto_2071922 ?auto_2071921 ) ( ON ?auto_2071923 ?auto_2071922 ) ( ON ?auto_2071924 ?auto_2071923 ) ( ON ?auto_2071925 ?auto_2071924 ) ( not ( = ?auto_2071913 ?auto_2071914 ) ) ( not ( = ?auto_2071913 ?auto_2071915 ) ) ( not ( = ?auto_2071913 ?auto_2071917 ) ) ( not ( = ?auto_2071913 ?auto_2071916 ) ) ( not ( = ?auto_2071913 ?auto_2071918 ) ) ( not ( = ?auto_2071913 ?auto_2071919 ) ) ( not ( = ?auto_2071913 ?auto_2071920 ) ) ( not ( = ?auto_2071913 ?auto_2071921 ) ) ( not ( = ?auto_2071913 ?auto_2071922 ) ) ( not ( = ?auto_2071913 ?auto_2071923 ) ) ( not ( = ?auto_2071913 ?auto_2071924 ) ) ( not ( = ?auto_2071913 ?auto_2071925 ) ) ( not ( = ?auto_2071913 ?auto_2071926 ) ) ( not ( = ?auto_2071914 ?auto_2071915 ) ) ( not ( = ?auto_2071914 ?auto_2071917 ) ) ( not ( = ?auto_2071914 ?auto_2071916 ) ) ( not ( = ?auto_2071914 ?auto_2071918 ) ) ( not ( = ?auto_2071914 ?auto_2071919 ) ) ( not ( = ?auto_2071914 ?auto_2071920 ) ) ( not ( = ?auto_2071914 ?auto_2071921 ) ) ( not ( = ?auto_2071914 ?auto_2071922 ) ) ( not ( = ?auto_2071914 ?auto_2071923 ) ) ( not ( = ?auto_2071914 ?auto_2071924 ) ) ( not ( = ?auto_2071914 ?auto_2071925 ) ) ( not ( = ?auto_2071914 ?auto_2071926 ) ) ( not ( = ?auto_2071915 ?auto_2071917 ) ) ( not ( = ?auto_2071915 ?auto_2071916 ) ) ( not ( = ?auto_2071915 ?auto_2071918 ) ) ( not ( = ?auto_2071915 ?auto_2071919 ) ) ( not ( = ?auto_2071915 ?auto_2071920 ) ) ( not ( = ?auto_2071915 ?auto_2071921 ) ) ( not ( = ?auto_2071915 ?auto_2071922 ) ) ( not ( = ?auto_2071915 ?auto_2071923 ) ) ( not ( = ?auto_2071915 ?auto_2071924 ) ) ( not ( = ?auto_2071915 ?auto_2071925 ) ) ( not ( = ?auto_2071915 ?auto_2071926 ) ) ( not ( = ?auto_2071917 ?auto_2071916 ) ) ( not ( = ?auto_2071917 ?auto_2071918 ) ) ( not ( = ?auto_2071917 ?auto_2071919 ) ) ( not ( = ?auto_2071917 ?auto_2071920 ) ) ( not ( = ?auto_2071917 ?auto_2071921 ) ) ( not ( = ?auto_2071917 ?auto_2071922 ) ) ( not ( = ?auto_2071917 ?auto_2071923 ) ) ( not ( = ?auto_2071917 ?auto_2071924 ) ) ( not ( = ?auto_2071917 ?auto_2071925 ) ) ( not ( = ?auto_2071917 ?auto_2071926 ) ) ( not ( = ?auto_2071916 ?auto_2071918 ) ) ( not ( = ?auto_2071916 ?auto_2071919 ) ) ( not ( = ?auto_2071916 ?auto_2071920 ) ) ( not ( = ?auto_2071916 ?auto_2071921 ) ) ( not ( = ?auto_2071916 ?auto_2071922 ) ) ( not ( = ?auto_2071916 ?auto_2071923 ) ) ( not ( = ?auto_2071916 ?auto_2071924 ) ) ( not ( = ?auto_2071916 ?auto_2071925 ) ) ( not ( = ?auto_2071916 ?auto_2071926 ) ) ( not ( = ?auto_2071918 ?auto_2071919 ) ) ( not ( = ?auto_2071918 ?auto_2071920 ) ) ( not ( = ?auto_2071918 ?auto_2071921 ) ) ( not ( = ?auto_2071918 ?auto_2071922 ) ) ( not ( = ?auto_2071918 ?auto_2071923 ) ) ( not ( = ?auto_2071918 ?auto_2071924 ) ) ( not ( = ?auto_2071918 ?auto_2071925 ) ) ( not ( = ?auto_2071918 ?auto_2071926 ) ) ( not ( = ?auto_2071919 ?auto_2071920 ) ) ( not ( = ?auto_2071919 ?auto_2071921 ) ) ( not ( = ?auto_2071919 ?auto_2071922 ) ) ( not ( = ?auto_2071919 ?auto_2071923 ) ) ( not ( = ?auto_2071919 ?auto_2071924 ) ) ( not ( = ?auto_2071919 ?auto_2071925 ) ) ( not ( = ?auto_2071919 ?auto_2071926 ) ) ( not ( = ?auto_2071920 ?auto_2071921 ) ) ( not ( = ?auto_2071920 ?auto_2071922 ) ) ( not ( = ?auto_2071920 ?auto_2071923 ) ) ( not ( = ?auto_2071920 ?auto_2071924 ) ) ( not ( = ?auto_2071920 ?auto_2071925 ) ) ( not ( = ?auto_2071920 ?auto_2071926 ) ) ( not ( = ?auto_2071921 ?auto_2071922 ) ) ( not ( = ?auto_2071921 ?auto_2071923 ) ) ( not ( = ?auto_2071921 ?auto_2071924 ) ) ( not ( = ?auto_2071921 ?auto_2071925 ) ) ( not ( = ?auto_2071921 ?auto_2071926 ) ) ( not ( = ?auto_2071922 ?auto_2071923 ) ) ( not ( = ?auto_2071922 ?auto_2071924 ) ) ( not ( = ?auto_2071922 ?auto_2071925 ) ) ( not ( = ?auto_2071922 ?auto_2071926 ) ) ( not ( = ?auto_2071923 ?auto_2071924 ) ) ( not ( = ?auto_2071923 ?auto_2071925 ) ) ( not ( = ?auto_2071923 ?auto_2071926 ) ) ( not ( = ?auto_2071924 ?auto_2071925 ) ) ( not ( = ?auto_2071924 ?auto_2071926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2071925 ?auto_2071926 )
      ( MAKE-13CRATE-VERIFY ?auto_2071913 ?auto_2071914 ?auto_2071915 ?auto_2071917 ?auto_2071916 ?auto_2071918 ?auto_2071919 ?auto_2071920 ?auto_2071921 ?auto_2071922 ?auto_2071923 ?auto_2071924 ?auto_2071925 ?auto_2071926 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072055 - SURFACE
      ?auto_2072056 - SURFACE
      ?auto_2072057 - SURFACE
      ?auto_2072059 - SURFACE
      ?auto_2072058 - SURFACE
      ?auto_2072060 - SURFACE
      ?auto_2072061 - SURFACE
      ?auto_2072062 - SURFACE
      ?auto_2072063 - SURFACE
      ?auto_2072064 - SURFACE
      ?auto_2072065 - SURFACE
      ?auto_2072066 - SURFACE
      ?auto_2072067 - SURFACE
      ?auto_2072068 - SURFACE
    )
    :vars
    (
      ?auto_2072070 - HOIST
      ?auto_2072069 - PLACE
      ?auto_2072071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072070 ?auto_2072069 ) ( SURFACE-AT ?auto_2072067 ?auto_2072069 ) ( CLEAR ?auto_2072067 ) ( IS-CRATE ?auto_2072068 ) ( not ( = ?auto_2072067 ?auto_2072068 ) ) ( TRUCK-AT ?auto_2072071 ?auto_2072069 ) ( AVAILABLE ?auto_2072070 ) ( IN ?auto_2072068 ?auto_2072071 ) ( ON ?auto_2072067 ?auto_2072066 ) ( not ( = ?auto_2072066 ?auto_2072067 ) ) ( not ( = ?auto_2072066 ?auto_2072068 ) ) ( ON ?auto_2072056 ?auto_2072055 ) ( ON ?auto_2072057 ?auto_2072056 ) ( ON ?auto_2072059 ?auto_2072057 ) ( ON ?auto_2072058 ?auto_2072059 ) ( ON ?auto_2072060 ?auto_2072058 ) ( ON ?auto_2072061 ?auto_2072060 ) ( ON ?auto_2072062 ?auto_2072061 ) ( ON ?auto_2072063 ?auto_2072062 ) ( ON ?auto_2072064 ?auto_2072063 ) ( ON ?auto_2072065 ?auto_2072064 ) ( ON ?auto_2072066 ?auto_2072065 ) ( not ( = ?auto_2072055 ?auto_2072056 ) ) ( not ( = ?auto_2072055 ?auto_2072057 ) ) ( not ( = ?auto_2072055 ?auto_2072059 ) ) ( not ( = ?auto_2072055 ?auto_2072058 ) ) ( not ( = ?auto_2072055 ?auto_2072060 ) ) ( not ( = ?auto_2072055 ?auto_2072061 ) ) ( not ( = ?auto_2072055 ?auto_2072062 ) ) ( not ( = ?auto_2072055 ?auto_2072063 ) ) ( not ( = ?auto_2072055 ?auto_2072064 ) ) ( not ( = ?auto_2072055 ?auto_2072065 ) ) ( not ( = ?auto_2072055 ?auto_2072066 ) ) ( not ( = ?auto_2072055 ?auto_2072067 ) ) ( not ( = ?auto_2072055 ?auto_2072068 ) ) ( not ( = ?auto_2072056 ?auto_2072057 ) ) ( not ( = ?auto_2072056 ?auto_2072059 ) ) ( not ( = ?auto_2072056 ?auto_2072058 ) ) ( not ( = ?auto_2072056 ?auto_2072060 ) ) ( not ( = ?auto_2072056 ?auto_2072061 ) ) ( not ( = ?auto_2072056 ?auto_2072062 ) ) ( not ( = ?auto_2072056 ?auto_2072063 ) ) ( not ( = ?auto_2072056 ?auto_2072064 ) ) ( not ( = ?auto_2072056 ?auto_2072065 ) ) ( not ( = ?auto_2072056 ?auto_2072066 ) ) ( not ( = ?auto_2072056 ?auto_2072067 ) ) ( not ( = ?auto_2072056 ?auto_2072068 ) ) ( not ( = ?auto_2072057 ?auto_2072059 ) ) ( not ( = ?auto_2072057 ?auto_2072058 ) ) ( not ( = ?auto_2072057 ?auto_2072060 ) ) ( not ( = ?auto_2072057 ?auto_2072061 ) ) ( not ( = ?auto_2072057 ?auto_2072062 ) ) ( not ( = ?auto_2072057 ?auto_2072063 ) ) ( not ( = ?auto_2072057 ?auto_2072064 ) ) ( not ( = ?auto_2072057 ?auto_2072065 ) ) ( not ( = ?auto_2072057 ?auto_2072066 ) ) ( not ( = ?auto_2072057 ?auto_2072067 ) ) ( not ( = ?auto_2072057 ?auto_2072068 ) ) ( not ( = ?auto_2072059 ?auto_2072058 ) ) ( not ( = ?auto_2072059 ?auto_2072060 ) ) ( not ( = ?auto_2072059 ?auto_2072061 ) ) ( not ( = ?auto_2072059 ?auto_2072062 ) ) ( not ( = ?auto_2072059 ?auto_2072063 ) ) ( not ( = ?auto_2072059 ?auto_2072064 ) ) ( not ( = ?auto_2072059 ?auto_2072065 ) ) ( not ( = ?auto_2072059 ?auto_2072066 ) ) ( not ( = ?auto_2072059 ?auto_2072067 ) ) ( not ( = ?auto_2072059 ?auto_2072068 ) ) ( not ( = ?auto_2072058 ?auto_2072060 ) ) ( not ( = ?auto_2072058 ?auto_2072061 ) ) ( not ( = ?auto_2072058 ?auto_2072062 ) ) ( not ( = ?auto_2072058 ?auto_2072063 ) ) ( not ( = ?auto_2072058 ?auto_2072064 ) ) ( not ( = ?auto_2072058 ?auto_2072065 ) ) ( not ( = ?auto_2072058 ?auto_2072066 ) ) ( not ( = ?auto_2072058 ?auto_2072067 ) ) ( not ( = ?auto_2072058 ?auto_2072068 ) ) ( not ( = ?auto_2072060 ?auto_2072061 ) ) ( not ( = ?auto_2072060 ?auto_2072062 ) ) ( not ( = ?auto_2072060 ?auto_2072063 ) ) ( not ( = ?auto_2072060 ?auto_2072064 ) ) ( not ( = ?auto_2072060 ?auto_2072065 ) ) ( not ( = ?auto_2072060 ?auto_2072066 ) ) ( not ( = ?auto_2072060 ?auto_2072067 ) ) ( not ( = ?auto_2072060 ?auto_2072068 ) ) ( not ( = ?auto_2072061 ?auto_2072062 ) ) ( not ( = ?auto_2072061 ?auto_2072063 ) ) ( not ( = ?auto_2072061 ?auto_2072064 ) ) ( not ( = ?auto_2072061 ?auto_2072065 ) ) ( not ( = ?auto_2072061 ?auto_2072066 ) ) ( not ( = ?auto_2072061 ?auto_2072067 ) ) ( not ( = ?auto_2072061 ?auto_2072068 ) ) ( not ( = ?auto_2072062 ?auto_2072063 ) ) ( not ( = ?auto_2072062 ?auto_2072064 ) ) ( not ( = ?auto_2072062 ?auto_2072065 ) ) ( not ( = ?auto_2072062 ?auto_2072066 ) ) ( not ( = ?auto_2072062 ?auto_2072067 ) ) ( not ( = ?auto_2072062 ?auto_2072068 ) ) ( not ( = ?auto_2072063 ?auto_2072064 ) ) ( not ( = ?auto_2072063 ?auto_2072065 ) ) ( not ( = ?auto_2072063 ?auto_2072066 ) ) ( not ( = ?auto_2072063 ?auto_2072067 ) ) ( not ( = ?auto_2072063 ?auto_2072068 ) ) ( not ( = ?auto_2072064 ?auto_2072065 ) ) ( not ( = ?auto_2072064 ?auto_2072066 ) ) ( not ( = ?auto_2072064 ?auto_2072067 ) ) ( not ( = ?auto_2072064 ?auto_2072068 ) ) ( not ( = ?auto_2072065 ?auto_2072066 ) ) ( not ( = ?auto_2072065 ?auto_2072067 ) ) ( not ( = ?auto_2072065 ?auto_2072068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072066 ?auto_2072067 ?auto_2072068 )
      ( MAKE-13CRATE-VERIFY ?auto_2072055 ?auto_2072056 ?auto_2072057 ?auto_2072059 ?auto_2072058 ?auto_2072060 ?auto_2072061 ?auto_2072062 ?auto_2072063 ?auto_2072064 ?auto_2072065 ?auto_2072066 ?auto_2072067 ?auto_2072068 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072211 - SURFACE
      ?auto_2072212 - SURFACE
      ?auto_2072213 - SURFACE
      ?auto_2072215 - SURFACE
      ?auto_2072214 - SURFACE
      ?auto_2072216 - SURFACE
      ?auto_2072217 - SURFACE
      ?auto_2072218 - SURFACE
      ?auto_2072219 - SURFACE
      ?auto_2072220 - SURFACE
      ?auto_2072221 - SURFACE
      ?auto_2072222 - SURFACE
      ?auto_2072223 - SURFACE
      ?auto_2072224 - SURFACE
    )
    :vars
    (
      ?auto_2072225 - HOIST
      ?auto_2072227 - PLACE
      ?auto_2072228 - TRUCK
      ?auto_2072226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072225 ?auto_2072227 ) ( SURFACE-AT ?auto_2072223 ?auto_2072227 ) ( CLEAR ?auto_2072223 ) ( IS-CRATE ?auto_2072224 ) ( not ( = ?auto_2072223 ?auto_2072224 ) ) ( AVAILABLE ?auto_2072225 ) ( IN ?auto_2072224 ?auto_2072228 ) ( ON ?auto_2072223 ?auto_2072222 ) ( not ( = ?auto_2072222 ?auto_2072223 ) ) ( not ( = ?auto_2072222 ?auto_2072224 ) ) ( TRUCK-AT ?auto_2072228 ?auto_2072226 ) ( not ( = ?auto_2072226 ?auto_2072227 ) ) ( ON ?auto_2072212 ?auto_2072211 ) ( ON ?auto_2072213 ?auto_2072212 ) ( ON ?auto_2072215 ?auto_2072213 ) ( ON ?auto_2072214 ?auto_2072215 ) ( ON ?auto_2072216 ?auto_2072214 ) ( ON ?auto_2072217 ?auto_2072216 ) ( ON ?auto_2072218 ?auto_2072217 ) ( ON ?auto_2072219 ?auto_2072218 ) ( ON ?auto_2072220 ?auto_2072219 ) ( ON ?auto_2072221 ?auto_2072220 ) ( ON ?auto_2072222 ?auto_2072221 ) ( not ( = ?auto_2072211 ?auto_2072212 ) ) ( not ( = ?auto_2072211 ?auto_2072213 ) ) ( not ( = ?auto_2072211 ?auto_2072215 ) ) ( not ( = ?auto_2072211 ?auto_2072214 ) ) ( not ( = ?auto_2072211 ?auto_2072216 ) ) ( not ( = ?auto_2072211 ?auto_2072217 ) ) ( not ( = ?auto_2072211 ?auto_2072218 ) ) ( not ( = ?auto_2072211 ?auto_2072219 ) ) ( not ( = ?auto_2072211 ?auto_2072220 ) ) ( not ( = ?auto_2072211 ?auto_2072221 ) ) ( not ( = ?auto_2072211 ?auto_2072222 ) ) ( not ( = ?auto_2072211 ?auto_2072223 ) ) ( not ( = ?auto_2072211 ?auto_2072224 ) ) ( not ( = ?auto_2072212 ?auto_2072213 ) ) ( not ( = ?auto_2072212 ?auto_2072215 ) ) ( not ( = ?auto_2072212 ?auto_2072214 ) ) ( not ( = ?auto_2072212 ?auto_2072216 ) ) ( not ( = ?auto_2072212 ?auto_2072217 ) ) ( not ( = ?auto_2072212 ?auto_2072218 ) ) ( not ( = ?auto_2072212 ?auto_2072219 ) ) ( not ( = ?auto_2072212 ?auto_2072220 ) ) ( not ( = ?auto_2072212 ?auto_2072221 ) ) ( not ( = ?auto_2072212 ?auto_2072222 ) ) ( not ( = ?auto_2072212 ?auto_2072223 ) ) ( not ( = ?auto_2072212 ?auto_2072224 ) ) ( not ( = ?auto_2072213 ?auto_2072215 ) ) ( not ( = ?auto_2072213 ?auto_2072214 ) ) ( not ( = ?auto_2072213 ?auto_2072216 ) ) ( not ( = ?auto_2072213 ?auto_2072217 ) ) ( not ( = ?auto_2072213 ?auto_2072218 ) ) ( not ( = ?auto_2072213 ?auto_2072219 ) ) ( not ( = ?auto_2072213 ?auto_2072220 ) ) ( not ( = ?auto_2072213 ?auto_2072221 ) ) ( not ( = ?auto_2072213 ?auto_2072222 ) ) ( not ( = ?auto_2072213 ?auto_2072223 ) ) ( not ( = ?auto_2072213 ?auto_2072224 ) ) ( not ( = ?auto_2072215 ?auto_2072214 ) ) ( not ( = ?auto_2072215 ?auto_2072216 ) ) ( not ( = ?auto_2072215 ?auto_2072217 ) ) ( not ( = ?auto_2072215 ?auto_2072218 ) ) ( not ( = ?auto_2072215 ?auto_2072219 ) ) ( not ( = ?auto_2072215 ?auto_2072220 ) ) ( not ( = ?auto_2072215 ?auto_2072221 ) ) ( not ( = ?auto_2072215 ?auto_2072222 ) ) ( not ( = ?auto_2072215 ?auto_2072223 ) ) ( not ( = ?auto_2072215 ?auto_2072224 ) ) ( not ( = ?auto_2072214 ?auto_2072216 ) ) ( not ( = ?auto_2072214 ?auto_2072217 ) ) ( not ( = ?auto_2072214 ?auto_2072218 ) ) ( not ( = ?auto_2072214 ?auto_2072219 ) ) ( not ( = ?auto_2072214 ?auto_2072220 ) ) ( not ( = ?auto_2072214 ?auto_2072221 ) ) ( not ( = ?auto_2072214 ?auto_2072222 ) ) ( not ( = ?auto_2072214 ?auto_2072223 ) ) ( not ( = ?auto_2072214 ?auto_2072224 ) ) ( not ( = ?auto_2072216 ?auto_2072217 ) ) ( not ( = ?auto_2072216 ?auto_2072218 ) ) ( not ( = ?auto_2072216 ?auto_2072219 ) ) ( not ( = ?auto_2072216 ?auto_2072220 ) ) ( not ( = ?auto_2072216 ?auto_2072221 ) ) ( not ( = ?auto_2072216 ?auto_2072222 ) ) ( not ( = ?auto_2072216 ?auto_2072223 ) ) ( not ( = ?auto_2072216 ?auto_2072224 ) ) ( not ( = ?auto_2072217 ?auto_2072218 ) ) ( not ( = ?auto_2072217 ?auto_2072219 ) ) ( not ( = ?auto_2072217 ?auto_2072220 ) ) ( not ( = ?auto_2072217 ?auto_2072221 ) ) ( not ( = ?auto_2072217 ?auto_2072222 ) ) ( not ( = ?auto_2072217 ?auto_2072223 ) ) ( not ( = ?auto_2072217 ?auto_2072224 ) ) ( not ( = ?auto_2072218 ?auto_2072219 ) ) ( not ( = ?auto_2072218 ?auto_2072220 ) ) ( not ( = ?auto_2072218 ?auto_2072221 ) ) ( not ( = ?auto_2072218 ?auto_2072222 ) ) ( not ( = ?auto_2072218 ?auto_2072223 ) ) ( not ( = ?auto_2072218 ?auto_2072224 ) ) ( not ( = ?auto_2072219 ?auto_2072220 ) ) ( not ( = ?auto_2072219 ?auto_2072221 ) ) ( not ( = ?auto_2072219 ?auto_2072222 ) ) ( not ( = ?auto_2072219 ?auto_2072223 ) ) ( not ( = ?auto_2072219 ?auto_2072224 ) ) ( not ( = ?auto_2072220 ?auto_2072221 ) ) ( not ( = ?auto_2072220 ?auto_2072222 ) ) ( not ( = ?auto_2072220 ?auto_2072223 ) ) ( not ( = ?auto_2072220 ?auto_2072224 ) ) ( not ( = ?auto_2072221 ?auto_2072222 ) ) ( not ( = ?auto_2072221 ?auto_2072223 ) ) ( not ( = ?auto_2072221 ?auto_2072224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072222 ?auto_2072223 ?auto_2072224 )
      ( MAKE-13CRATE-VERIFY ?auto_2072211 ?auto_2072212 ?auto_2072213 ?auto_2072215 ?auto_2072214 ?auto_2072216 ?auto_2072217 ?auto_2072218 ?auto_2072219 ?auto_2072220 ?auto_2072221 ?auto_2072222 ?auto_2072223 ?auto_2072224 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072380 - SURFACE
      ?auto_2072381 - SURFACE
      ?auto_2072382 - SURFACE
      ?auto_2072384 - SURFACE
      ?auto_2072383 - SURFACE
      ?auto_2072385 - SURFACE
      ?auto_2072386 - SURFACE
      ?auto_2072387 - SURFACE
      ?auto_2072388 - SURFACE
      ?auto_2072389 - SURFACE
      ?auto_2072390 - SURFACE
      ?auto_2072391 - SURFACE
      ?auto_2072392 - SURFACE
      ?auto_2072393 - SURFACE
    )
    :vars
    (
      ?auto_2072397 - HOIST
      ?auto_2072395 - PLACE
      ?auto_2072394 - TRUCK
      ?auto_2072398 - PLACE
      ?auto_2072396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072397 ?auto_2072395 ) ( SURFACE-AT ?auto_2072392 ?auto_2072395 ) ( CLEAR ?auto_2072392 ) ( IS-CRATE ?auto_2072393 ) ( not ( = ?auto_2072392 ?auto_2072393 ) ) ( AVAILABLE ?auto_2072397 ) ( ON ?auto_2072392 ?auto_2072391 ) ( not ( = ?auto_2072391 ?auto_2072392 ) ) ( not ( = ?auto_2072391 ?auto_2072393 ) ) ( TRUCK-AT ?auto_2072394 ?auto_2072398 ) ( not ( = ?auto_2072398 ?auto_2072395 ) ) ( HOIST-AT ?auto_2072396 ?auto_2072398 ) ( LIFTING ?auto_2072396 ?auto_2072393 ) ( not ( = ?auto_2072397 ?auto_2072396 ) ) ( ON ?auto_2072381 ?auto_2072380 ) ( ON ?auto_2072382 ?auto_2072381 ) ( ON ?auto_2072384 ?auto_2072382 ) ( ON ?auto_2072383 ?auto_2072384 ) ( ON ?auto_2072385 ?auto_2072383 ) ( ON ?auto_2072386 ?auto_2072385 ) ( ON ?auto_2072387 ?auto_2072386 ) ( ON ?auto_2072388 ?auto_2072387 ) ( ON ?auto_2072389 ?auto_2072388 ) ( ON ?auto_2072390 ?auto_2072389 ) ( ON ?auto_2072391 ?auto_2072390 ) ( not ( = ?auto_2072380 ?auto_2072381 ) ) ( not ( = ?auto_2072380 ?auto_2072382 ) ) ( not ( = ?auto_2072380 ?auto_2072384 ) ) ( not ( = ?auto_2072380 ?auto_2072383 ) ) ( not ( = ?auto_2072380 ?auto_2072385 ) ) ( not ( = ?auto_2072380 ?auto_2072386 ) ) ( not ( = ?auto_2072380 ?auto_2072387 ) ) ( not ( = ?auto_2072380 ?auto_2072388 ) ) ( not ( = ?auto_2072380 ?auto_2072389 ) ) ( not ( = ?auto_2072380 ?auto_2072390 ) ) ( not ( = ?auto_2072380 ?auto_2072391 ) ) ( not ( = ?auto_2072380 ?auto_2072392 ) ) ( not ( = ?auto_2072380 ?auto_2072393 ) ) ( not ( = ?auto_2072381 ?auto_2072382 ) ) ( not ( = ?auto_2072381 ?auto_2072384 ) ) ( not ( = ?auto_2072381 ?auto_2072383 ) ) ( not ( = ?auto_2072381 ?auto_2072385 ) ) ( not ( = ?auto_2072381 ?auto_2072386 ) ) ( not ( = ?auto_2072381 ?auto_2072387 ) ) ( not ( = ?auto_2072381 ?auto_2072388 ) ) ( not ( = ?auto_2072381 ?auto_2072389 ) ) ( not ( = ?auto_2072381 ?auto_2072390 ) ) ( not ( = ?auto_2072381 ?auto_2072391 ) ) ( not ( = ?auto_2072381 ?auto_2072392 ) ) ( not ( = ?auto_2072381 ?auto_2072393 ) ) ( not ( = ?auto_2072382 ?auto_2072384 ) ) ( not ( = ?auto_2072382 ?auto_2072383 ) ) ( not ( = ?auto_2072382 ?auto_2072385 ) ) ( not ( = ?auto_2072382 ?auto_2072386 ) ) ( not ( = ?auto_2072382 ?auto_2072387 ) ) ( not ( = ?auto_2072382 ?auto_2072388 ) ) ( not ( = ?auto_2072382 ?auto_2072389 ) ) ( not ( = ?auto_2072382 ?auto_2072390 ) ) ( not ( = ?auto_2072382 ?auto_2072391 ) ) ( not ( = ?auto_2072382 ?auto_2072392 ) ) ( not ( = ?auto_2072382 ?auto_2072393 ) ) ( not ( = ?auto_2072384 ?auto_2072383 ) ) ( not ( = ?auto_2072384 ?auto_2072385 ) ) ( not ( = ?auto_2072384 ?auto_2072386 ) ) ( not ( = ?auto_2072384 ?auto_2072387 ) ) ( not ( = ?auto_2072384 ?auto_2072388 ) ) ( not ( = ?auto_2072384 ?auto_2072389 ) ) ( not ( = ?auto_2072384 ?auto_2072390 ) ) ( not ( = ?auto_2072384 ?auto_2072391 ) ) ( not ( = ?auto_2072384 ?auto_2072392 ) ) ( not ( = ?auto_2072384 ?auto_2072393 ) ) ( not ( = ?auto_2072383 ?auto_2072385 ) ) ( not ( = ?auto_2072383 ?auto_2072386 ) ) ( not ( = ?auto_2072383 ?auto_2072387 ) ) ( not ( = ?auto_2072383 ?auto_2072388 ) ) ( not ( = ?auto_2072383 ?auto_2072389 ) ) ( not ( = ?auto_2072383 ?auto_2072390 ) ) ( not ( = ?auto_2072383 ?auto_2072391 ) ) ( not ( = ?auto_2072383 ?auto_2072392 ) ) ( not ( = ?auto_2072383 ?auto_2072393 ) ) ( not ( = ?auto_2072385 ?auto_2072386 ) ) ( not ( = ?auto_2072385 ?auto_2072387 ) ) ( not ( = ?auto_2072385 ?auto_2072388 ) ) ( not ( = ?auto_2072385 ?auto_2072389 ) ) ( not ( = ?auto_2072385 ?auto_2072390 ) ) ( not ( = ?auto_2072385 ?auto_2072391 ) ) ( not ( = ?auto_2072385 ?auto_2072392 ) ) ( not ( = ?auto_2072385 ?auto_2072393 ) ) ( not ( = ?auto_2072386 ?auto_2072387 ) ) ( not ( = ?auto_2072386 ?auto_2072388 ) ) ( not ( = ?auto_2072386 ?auto_2072389 ) ) ( not ( = ?auto_2072386 ?auto_2072390 ) ) ( not ( = ?auto_2072386 ?auto_2072391 ) ) ( not ( = ?auto_2072386 ?auto_2072392 ) ) ( not ( = ?auto_2072386 ?auto_2072393 ) ) ( not ( = ?auto_2072387 ?auto_2072388 ) ) ( not ( = ?auto_2072387 ?auto_2072389 ) ) ( not ( = ?auto_2072387 ?auto_2072390 ) ) ( not ( = ?auto_2072387 ?auto_2072391 ) ) ( not ( = ?auto_2072387 ?auto_2072392 ) ) ( not ( = ?auto_2072387 ?auto_2072393 ) ) ( not ( = ?auto_2072388 ?auto_2072389 ) ) ( not ( = ?auto_2072388 ?auto_2072390 ) ) ( not ( = ?auto_2072388 ?auto_2072391 ) ) ( not ( = ?auto_2072388 ?auto_2072392 ) ) ( not ( = ?auto_2072388 ?auto_2072393 ) ) ( not ( = ?auto_2072389 ?auto_2072390 ) ) ( not ( = ?auto_2072389 ?auto_2072391 ) ) ( not ( = ?auto_2072389 ?auto_2072392 ) ) ( not ( = ?auto_2072389 ?auto_2072393 ) ) ( not ( = ?auto_2072390 ?auto_2072391 ) ) ( not ( = ?auto_2072390 ?auto_2072392 ) ) ( not ( = ?auto_2072390 ?auto_2072393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072391 ?auto_2072392 ?auto_2072393 )
      ( MAKE-13CRATE-VERIFY ?auto_2072380 ?auto_2072381 ?auto_2072382 ?auto_2072384 ?auto_2072383 ?auto_2072385 ?auto_2072386 ?auto_2072387 ?auto_2072388 ?auto_2072389 ?auto_2072390 ?auto_2072391 ?auto_2072392 ?auto_2072393 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072562 - SURFACE
      ?auto_2072563 - SURFACE
      ?auto_2072564 - SURFACE
      ?auto_2072566 - SURFACE
      ?auto_2072565 - SURFACE
      ?auto_2072567 - SURFACE
      ?auto_2072568 - SURFACE
      ?auto_2072569 - SURFACE
      ?auto_2072570 - SURFACE
      ?auto_2072571 - SURFACE
      ?auto_2072572 - SURFACE
      ?auto_2072573 - SURFACE
      ?auto_2072574 - SURFACE
      ?auto_2072575 - SURFACE
    )
    :vars
    (
      ?auto_2072581 - HOIST
      ?auto_2072580 - PLACE
      ?auto_2072579 - TRUCK
      ?auto_2072576 - PLACE
      ?auto_2072577 - HOIST
      ?auto_2072578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072581 ?auto_2072580 ) ( SURFACE-AT ?auto_2072574 ?auto_2072580 ) ( CLEAR ?auto_2072574 ) ( IS-CRATE ?auto_2072575 ) ( not ( = ?auto_2072574 ?auto_2072575 ) ) ( AVAILABLE ?auto_2072581 ) ( ON ?auto_2072574 ?auto_2072573 ) ( not ( = ?auto_2072573 ?auto_2072574 ) ) ( not ( = ?auto_2072573 ?auto_2072575 ) ) ( TRUCK-AT ?auto_2072579 ?auto_2072576 ) ( not ( = ?auto_2072576 ?auto_2072580 ) ) ( HOIST-AT ?auto_2072577 ?auto_2072576 ) ( not ( = ?auto_2072581 ?auto_2072577 ) ) ( AVAILABLE ?auto_2072577 ) ( SURFACE-AT ?auto_2072575 ?auto_2072576 ) ( ON ?auto_2072575 ?auto_2072578 ) ( CLEAR ?auto_2072575 ) ( not ( = ?auto_2072574 ?auto_2072578 ) ) ( not ( = ?auto_2072575 ?auto_2072578 ) ) ( not ( = ?auto_2072573 ?auto_2072578 ) ) ( ON ?auto_2072563 ?auto_2072562 ) ( ON ?auto_2072564 ?auto_2072563 ) ( ON ?auto_2072566 ?auto_2072564 ) ( ON ?auto_2072565 ?auto_2072566 ) ( ON ?auto_2072567 ?auto_2072565 ) ( ON ?auto_2072568 ?auto_2072567 ) ( ON ?auto_2072569 ?auto_2072568 ) ( ON ?auto_2072570 ?auto_2072569 ) ( ON ?auto_2072571 ?auto_2072570 ) ( ON ?auto_2072572 ?auto_2072571 ) ( ON ?auto_2072573 ?auto_2072572 ) ( not ( = ?auto_2072562 ?auto_2072563 ) ) ( not ( = ?auto_2072562 ?auto_2072564 ) ) ( not ( = ?auto_2072562 ?auto_2072566 ) ) ( not ( = ?auto_2072562 ?auto_2072565 ) ) ( not ( = ?auto_2072562 ?auto_2072567 ) ) ( not ( = ?auto_2072562 ?auto_2072568 ) ) ( not ( = ?auto_2072562 ?auto_2072569 ) ) ( not ( = ?auto_2072562 ?auto_2072570 ) ) ( not ( = ?auto_2072562 ?auto_2072571 ) ) ( not ( = ?auto_2072562 ?auto_2072572 ) ) ( not ( = ?auto_2072562 ?auto_2072573 ) ) ( not ( = ?auto_2072562 ?auto_2072574 ) ) ( not ( = ?auto_2072562 ?auto_2072575 ) ) ( not ( = ?auto_2072562 ?auto_2072578 ) ) ( not ( = ?auto_2072563 ?auto_2072564 ) ) ( not ( = ?auto_2072563 ?auto_2072566 ) ) ( not ( = ?auto_2072563 ?auto_2072565 ) ) ( not ( = ?auto_2072563 ?auto_2072567 ) ) ( not ( = ?auto_2072563 ?auto_2072568 ) ) ( not ( = ?auto_2072563 ?auto_2072569 ) ) ( not ( = ?auto_2072563 ?auto_2072570 ) ) ( not ( = ?auto_2072563 ?auto_2072571 ) ) ( not ( = ?auto_2072563 ?auto_2072572 ) ) ( not ( = ?auto_2072563 ?auto_2072573 ) ) ( not ( = ?auto_2072563 ?auto_2072574 ) ) ( not ( = ?auto_2072563 ?auto_2072575 ) ) ( not ( = ?auto_2072563 ?auto_2072578 ) ) ( not ( = ?auto_2072564 ?auto_2072566 ) ) ( not ( = ?auto_2072564 ?auto_2072565 ) ) ( not ( = ?auto_2072564 ?auto_2072567 ) ) ( not ( = ?auto_2072564 ?auto_2072568 ) ) ( not ( = ?auto_2072564 ?auto_2072569 ) ) ( not ( = ?auto_2072564 ?auto_2072570 ) ) ( not ( = ?auto_2072564 ?auto_2072571 ) ) ( not ( = ?auto_2072564 ?auto_2072572 ) ) ( not ( = ?auto_2072564 ?auto_2072573 ) ) ( not ( = ?auto_2072564 ?auto_2072574 ) ) ( not ( = ?auto_2072564 ?auto_2072575 ) ) ( not ( = ?auto_2072564 ?auto_2072578 ) ) ( not ( = ?auto_2072566 ?auto_2072565 ) ) ( not ( = ?auto_2072566 ?auto_2072567 ) ) ( not ( = ?auto_2072566 ?auto_2072568 ) ) ( not ( = ?auto_2072566 ?auto_2072569 ) ) ( not ( = ?auto_2072566 ?auto_2072570 ) ) ( not ( = ?auto_2072566 ?auto_2072571 ) ) ( not ( = ?auto_2072566 ?auto_2072572 ) ) ( not ( = ?auto_2072566 ?auto_2072573 ) ) ( not ( = ?auto_2072566 ?auto_2072574 ) ) ( not ( = ?auto_2072566 ?auto_2072575 ) ) ( not ( = ?auto_2072566 ?auto_2072578 ) ) ( not ( = ?auto_2072565 ?auto_2072567 ) ) ( not ( = ?auto_2072565 ?auto_2072568 ) ) ( not ( = ?auto_2072565 ?auto_2072569 ) ) ( not ( = ?auto_2072565 ?auto_2072570 ) ) ( not ( = ?auto_2072565 ?auto_2072571 ) ) ( not ( = ?auto_2072565 ?auto_2072572 ) ) ( not ( = ?auto_2072565 ?auto_2072573 ) ) ( not ( = ?auto_2072565 ?auto_2072574 ) ) ( not ( = ?auto_2072565 ?auto_2072575 ) ) ( not ( = ?auto_2072565 ?auto_2072578 ) ) ( not ( = ?auto_2072567 ?auto_2072568 ) ) ( not ( = ?auto_2072567 ?auto_2072569 ) ) ( not ( = ?auto_2072567 ?auto_2072570 ) ) ( not ( = ?auto_2072567 ?auto_2072571 ) ) ( not ( = ?auto_2072567 ?auto_2072572 ) ) ( not ( = ?auto_2072567 ?auto_2072573 ) ) ( not ( = ?auto_2072567 ?auto_2072574 ) ) ( not ( = ?auto_2072567 ?auto_2072575 ) ) ( not ( = ?auto_2072567 ?auto_2072578 ) ) ( not ( = ?auto_2072568 ?auto_2072569 ) ) ( not ( = ?auto_2072568 ?auto_2072570 ) ) ( not ( = ?auto_2072568 ?auto_2072571 ) ) ( not ( = ?auto_2072568 ?auto_2072572 ) ) ( not ( = ?auto_2072568 ?auto_2072573 ) ) ( not ( = ?auto_2072568 ?auto_2072574 ) ) ( not ( = ?auto_2072568 ?auto_2072575 ) ) ( not ( = ?auto_2072568 ?auto_2072578 ) ) ( not ( = ?auto_2072569 ?auto_2072570 ) ) ( not ( = ?auto_2072569 ?auto_2072571 ) ) ( not ( = ?auto_2072569 ?auto_2072572 ) ) ( not ( = ?auto_2072569 ?auto_2072573 ) ) ( not ( = ?auto_2072569 ?auto_2072574 ) ) ( not ( = ?auto_2072569 ?auto_2072575 ) ) ( not ( = ?auto_2072569 ?auto_2072578 ) ) ( not ( = ?auto_2072570 ?auto_2072571 ) ) ( not ( = ?auto_2072570 ?auto_2072572 ) ) ( not ( = ?auto_2072570 ?auto_2072573 ) ) ( not ( = ?auto_2072570 ?auto_2072574 ) ) ( not ( = ?auto_2072570 ?auto_2072575 ) ) ( not ( = ?auto_2072570 ?auto_2072578 ) ) ( not ( = ?auto_2072571 ?auto_2072572 ) ) ( not ( = ?auto_2072571 ?auto_2072573 ) ) ( not ( = ?auto_2072571 ?auto_2072574 ) ) ( not ( = ?auto_2072571 ?auto_2072575 ) ) ( not ( = ?auto_2072571 ?auto_2072578 ) ) ( not ( = ?auto_2072572 ?auto_2072573 ) ) ( not ( = ?auto_2072572 ?auto_2072574 ) ) ( not ( = ?auto_2072572 ?auto_2072575 ) ) ( not ( = ?auto_2072572 ?auto_2072578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072573 ?auto_2072574 ?auto_2072575 )
      ( MAKE-13CRATE-VERIFY ?auto_2072562 ?auto_2072563 ?auto_2072564 ?auto_2072566 ?auto_2072565 ?auto_2072567 ?auto_2072568 ?auto_2072569 ?auto_2072570 ?auto_2072571 ?auto_2072572 ?auto_2072573 ?auto_2072574 ?auto_2072575 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072745 - SURFACE
      ?auto_2072746 - SURFACE
      ?auto_2072747 - SURFACE
      ?auto_2072749 - SURFACE
      ?auto_2072748 - SURFACE
      ?auto_2072750 - SURFACE
      ?auto_2072751 - SURFACE
      ?auto_2072752 - SURFACE
      ?auto_2072753 - SURFACE
      ?auto_2072754 - SURFACE
      ?auto_2072755 - SURFACE
      ?auto_2072756 - SURFACE
      ?auto_2072757 - SURFACE
      ?auto_2072758 - SURFACE
    )
    :vars
    (
      ?auto_2072763 - HOIST
      ?auto_2072759 - PLACE
      ?auto_2072761 - PLACE
      ?auto_2072760 - HOIST
      ?auto_2072762 - SURFACE
      ?auto_2072764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072763 ?auto_2072759 ) ( SURFACE-AT ?auto_2072757 ?auto_2072759 ) ( CLEAR ?auto_2072757 ) ( IS-CRATE ?auto_2072758 ) ( not ( = ?auto_2072757 ?auto_2072758 ) ) ( AVAILABLE ?auto_2072763 ) ( ON ?auto_2072757 ?auto_2072756 ) ( not ( = ?auto_2072756 ?auto_2072757 ) ) ( not ( = ?auto_2072756 ?auto_2072758 ) ) ( not ( = ?auto_2072761 ?auto_2072759 ) ) ( HOIST-AT ?auto_2072760 ?auto_2072761 ) ( not ( = ?auto_2072763 ?auto_2072760 ) ) ( AVAILABLE ?auto_2072760 ) ( SURFACE-AT ?auto_2072758 ?auto_2072761 ) ( ON ?auto_2072758 ?auto_2072762 ) ( CLEAR ?auto_2072758 ) ( not ( = ?auto_2072757 ?auto_2072762 ) ) ( not ( = ?auto_2072758 ?auto_2072762 ) ) ( not ( = ?auto_2072756 ?auto_2072762 ) ) ( TRUCK-AT ?auto_2072764 ?auto_2072759 ) ( ON ?auto_2072746 ?auto_2072745 ) ( ON ?auto_2072747 ?auto_2072746 ) ( ON ?auto_2072749 ?auto_2072747 ) ( ON ?auto_2072748 ?auto_2072749 ) ( ON ?auto_2072750 ?auto_2072748 ) ( ON ?auto_2072751 ?auto_2072750 ) ( ON ?auto_2072752 ?auto_2072751 ) ( ON ?auto_2072753 ?auto_2072752 ) ( ON ?auto_2072754 ?auto_2072753 ) ( ON ?auto_2072755 ?auto_2072754 ) ( ON ?auto_2072756 ?auto_2072755 ) ( not ( = ?auto_2072745 ?auto_2072746 ) ) ( not ( = ?auto_2072745 ?auto_2072747 ) ) ( not ( = ?auto_2072745 ?auto_2072749 ) ) ( not ( = ?auto_2072745 ?auto_2072748 ) ) ( not ( = ?auto_2072745 ?auto_2072750 ) ) ( not ( = ?auto_2072745 ?auto_2072751 ) ) ( not ( = ?auto_2072745 ?auto_2072752 ) ) ( not ( = ?auto_2072745 ?auto_2072753 ) ) ( not ( = ?auto_2072745 ?auto_2072754 ) ) ( not ( = ?auto_2072745 ?auto_2072755 ) ) ( not ( = ?auto_2072745 ?auto_2072756 ) ) ( not ( = ?auto_2072745 ?auto_2072757 ) ) ( not ( = ?auto_2072745 ?auto_2072758 ) ) ( not ( = ?auto_2072745 ?auto_2072762 ) ) ( not ( = ?auto_2072746 ?auto_2072747 ) ) ( not ( = ?auto_2072746 ?auto_2072749 ) ) ( not ( = ?auto_2072746 ?auto_2072748 ) ) ( not ( = ?auto_2072746 ?auto_2072750 ) ) ( not ( = ?auto_2072746 ?auto_2072751 ) ) ( not ( = ?auto_2072746 ?auto_2072752 ) ) ( not ( = ?auto_2072746 ?auto_2072753 ) ) ( not ( = ?auto_2072746 ?auto_2072754 ) ) ( not ( = ?auto_2072746 ?auto_2072755 ) ) ( not ( = ?auto_2072746 ?auto_2072756 ) ) ( not ( = ?auto_2072746 ?auto_2072757 ) ) ( not ( = ?auto_2072746 ?auto_2072758 ) ) ( not ( = ?auto_2072746 ?auto_2072762 ) ) ( not ( = ?auto_2072747 ?auto_2072749 ) ) ( not ( = ?auto_2072747 ?auto_2072748 ) ) ( not ( = ?auto_2072747 ?auto_2072750 ) ) ( not ( = ?auto_2072747 ?auto_2072751 ) ) ( not ( = ?auto_2072747 ?auto_2072752 ) ) ( not ( = ?auto_2072747 ?auto_2072753 ) ) ( not ( = ?auto_2072747 ?auto_2072754 ) ) ( not ( = ?auto_2072747 ?auto_2072755 ) ) ( not ( = ?auto_2072747 ?auto_2072756 ) ) ( not ( = ?auto_2072747 ?auto_2072757 ) ) ( not ( = ?auto_2072747 ?auto_2072758 ) ) ( not ( = ?auto_2072747 ?auto_2072762 ) ) ( not ( = ?auto_2072749 ?auto_2072748 ) ) ( not ( = ?auto_2072749 ?auto_2072750 ) ) ( not ( = ?auto_2072749 ?auto_2072751 ) ) ( not ( = ?auto_2072749 ?auto_2072752 ) ) ( not ( = ?auto_2072749 ?auto_2072753 ) ) ( not ( = ?auto_2072749 ?auto_2072754 ) ) ( not ( = ?auto_2072749 ?auto_2072755 ) ) ( not ( = ?auto_2072749 ?auto_2072756 ) ) ( not ( = ?auto_2072749 ?auto_2072757 ) ) ( not ( = ?auto_2072749 ?auto_2072758 ) ) ( not ( = ?auto_2072749 ?auto_2072762 ) ) ( not ( = ?auto_2072748 ?auto_2072750 ) ) ( not ( = ?auto_2072748 ?auto_2072751 ) ) ( not ( = ?auto_2072748 ?auto_2072752 ) ) ( not ( = ?auto_2072748 ?auto_2072753 ) ) ( not ( = ?auto_2072748 ?auto_2072754 ) ) ( not ( = ?auto_2072748 ?auto_2072755 ) ) ( not ( = ?auto_2072748 ?auto_2072756 ) ) ( not ( = ?auto_2072748 ?auto_2072757 ) ) ( not ( = ?auto_2072748 ?auto_2072758 ) ) ( not ( = ?auto_2072748 ?auto_2072762 ) ) ( not ( = ?auto_2072750 ?auto_2072751 ) ) ( not ( = ?auto_2072750 ?auto_2072752 ) ) ( not ( = ?auto_2072750 ?auto_2072753 ) ) ( not ( = ?auto_2072750 ?auto_2072754 ) ) ( not ( = ?auto_2072750 ?auto_2072755 ) ) ( not ( = ?auto_2072750 ?auto_2072756 ) ) ( not ( = ?auto_2072750 ?auto_2072757 ) ) ( not ( = ?auto_2072750 ?auto_2072758 ) ) ( not ( = ?auto_2072750 ?auto_2072762 ) ) ( not ( = ?auto_2072751 ?auto_2072752 ) ) ( not ( = ?auto_2072751 ?auto_2072753 ) ) ( not ( = ?auto_2072751 ?auto_2072754 ) ) ( not ( = ?auto_2072751 ?auto_2072755 ) ) ( not ( = ?auto_2072751 ?auto_2072756 ) ) ( not ( = ?auto_2072751 ?auto_2072757 ) ) ( not ( = ?auto_2072751 ?auto_2072758 ) ) ( not ( = ?auto_2072751 ?auto_2072762 ) ) ( not ( = ?auto_2072752 ?auto_2072753 ) ) ( not ( = ?auto_2072752 ?auto_2072754 ) ) ( not ( = ?auto_2072752 ?auto_2072755 ) ) ( not ( = ?auto_2072752 ?auto_2072756 ) ) ( not ( = ?auto_2072752 ?auto_2072757 ) ) ( not ( = ?auto_2072752 ?auto_2072758 ) ) ( not ( = ?auto_2072752 ?auto_2072762 ) ) ( not ( = ?auto_2072753 ?auto_2072754 ) ) ( not ( = ?auto_2072753 ?auto_2072755 ) ) ( not ( = ?auto_2072753 ?auto_2072756 ) ) ( not ( = ?auto_2072753 ?auto_2072757 ) ) ( not ( = ?auto_2072753 ?auto_2072758 ) ) ( not ( = ?auto_2072753 ?auto_2072762 ) ) ( not ( = ?auto_2072754 ?auto_2072755 ) ) ( not ( = ?auto_2072754 ?auto_2072756 ) ) ( not ( = ?auto_2072754 ?auto_2072757 ) ) ( not ( = ?auto_2072754 ?auto_2072758 ) ) ( not ( = ?auto_2072754 ?auto_2072762 ) ) ( not ( = ?auto_2072755 ?auto_2072756 ) ) ( not ( = ?auto_2072755 ?auto_2072757 ) ) ( not ( = ?auto_2072755 ?auto_2072758 ) ) ( not ( = ?auto_2072755 ?auto_2072762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072756 ?auto_2072757 ?auto_2072758 )
      ( MAKE-13CRATE-VERIFY ?auto_2072745 ?auto_2072746 ?auto_2072747 ?auto_2072749 ?auto_2072748 ?auto_2072750 ?auto_2072751 ?auto_2072752 ?auto_2072753 ?auto_2072754 ?auto_2072755 ?auto_2072756 ?auto_2072757 ?auto_2072758 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072928 - SURFACE
      ?auto_2072929 - SURFACE
      ?auto_2072930 - SURFACE
      ?auto_2072932 - SURFACE
      ?auto_2072931 - SURFACE
      ?auto_2072933 - SURFACE
      ?auto_2072934 - SURFACE
      ?auto_2072935 - SURFACE
      ?auto_2072936 - SURFACE
      ?auto_2072937 - SURFACE
      ?auto_2072938 - SURFACE
      ?auto_2072939 - SURFACE
      ?auto_2072940 - SURFACE
      ?auto_2072941 - SURFACE
    )
    :vars
    (
      ?auto_2072946 - HOIST
      ?auto_2072947 - PLACE
      ?auto_2072943 - PLACE
      ?auto_2072944 - HOIST
      ?auto_2072945 - SURFACE
      ?auto_2072942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072946 ?auto_2072947 ) ( IS-CRATE ?auto_2072941 ) ( not ( = ?auto_2072940 ?auto_2072941 ) ) ( not ( = ?auto_2072939 ?auto_2072940 ) ) ( not ( = ?auto_2072939 ?auto_2072941 ) ) ( not ( = ?auto_2072943 ?auto_2072947 ) ) ( HOIST-AT ?auto_2072944 ?auto_2072943 ) ( not ( = ?auto_2072946 ?auto_2072944 ) ) ( AVAILABLE ?auto_2072944 ) ( SURFACE-AT ?auto_2072941 ?auto_2072943 ) ( ON ?auto_2072941 ?auto_2072945 ) ( CLEAR ?auto_2072941 ) ( not ( = ?auto_2072940 ?auto_2072945 ) ) ( not ( = ?auto_2072941 ?auto_2072945 ) ) ( not ( = ?auto_2072939 ?auto_2072945 ) ) ( TRUCK-AT ?auto_2072942 ?auto_2072947 ) ( SURFACE-AT ?auto_2072939 ?auto_2072947 ) ( CLEAR ?auto_2072939 ) ( LIFTING ?auto_2072946 ?auto_2072940 ) ( IS-CRATE ?auto_2072940 ) ( ON ?auto_2072929 ?auto_2072928 ) ( ON ?auto_2072930 ?auto_2072929 ) ( ON ?auto_2072932 ?auto_2072930 ) ( ON ?auto_2072931 ?auto_2072932 ) ( ON ?auto_2072933 ?auto_2072931 ) ( ON ?auto_2072934 ?auto_2072933 ) ( ON ?auto_2072935 ?auto_2072934 ) ( ON ?auto_2072936 ?auto_2072935 ) ( ON ?auto_2072937 ?auto_2072936 ) ( ON ?auto_2072938 ?auto_2072937 ) ( ON ?auto_2072939 ?auto_2072938 ) ( not ( = ?auto_2072928 ?auto_2072929 ) ) ( not ( = ?auto_2072928 ?auto_2072930 ) ) ( not ( = ?auto_2072928 ?auto_2072932 ) ) ( not ( = ?auto_2072928 ?auto_2072931 ) ) ( not ( = ?auto_2072928 ?auto_2072933 ) ) ( not ( = ?auto_2072928 ?auto_2072934 ) ) ( not ( = ?auto_2072928 ?auto_2072935 ) ) ( not ( = ?auto_2072928 ?auto_2072936 ) ) ( not ( = ?auto_2072928 ?auto_2072937 ) ) ( not ( = ?auto_2072928 ?auto_2072938 ) ) ( not ( = ?auto_2072928 ?auto_2072939 ) ) ( not ( = ?auto_2072928 ?auto_2072940 ) ) ( not ( = ?auto_2072928 ?auto_2072941 ) ) ( not ( = ?auto_2072928 ?auto_2072945 ) ) ( not ( = ?auto_2072929 ?auto_2072930 ) ) ( not ( = ?auto_2072929 ?auto_2072932 ) ) ( not ( = ?auto_2072929 ?auto_2072931 ) ) ( not ( = ?auto_2072929 ?auto_2072933 ) ) ( not ( = ?auto_2072929 ?auto_2072934 ) ) ( not ( = ?auto_2072929 ?auto_2072935 ) ) ( not ( = ?auto_2072929 ?auto_2072936 ) ) ( not ( = ?auto_2072929 ?auto_2072937 ) ) ( not ( = ?auto_2072929 ?auto_2072938 ) ) ( not ( = ?auto_2072929 ?auto_2072939 ) ) ( not ( = ?auto_2072929 ?auto_2072940 ) ) ( not ( = ?auto_2072929 ?auto_2072941 ) ) ( not ( = ?auto_2072929 ?auto_2072945 ) ) ( not ( = ?auto_2072930 ?auto_2072932 ) ) ( not ( = ?auto_2072930 ?auto_2072931 ) ) ( not ( = ?auto_2072930 ?auto_2072933 ) ) ( not ( = ?auto_2072930 ?auto_2072934 ) ) ( not ( = ?auto_2072930 ?auto_2072935 ) ) ( not ( = ?auto_2072930 ?auto_2072936 ) ) ( not ( = ?auto_2072930 ?auto_2072937 ) ) ( not ( = ?auto_2072930 ?auto_2072938 ) ) ( not ( = ?auto_2072930 ?auto_2072939 ) ) ( not ( = ?auto_2072930 ?auto_2072940 ) ) ( not ( = ?auto_2072930 ?auto_2072941 ) ) ( not ( = ?auto_2072930 ?auto_2072945 ) ) ( not ( = ?auto_2072932 ?auto_2072931 ) ) ( not ( = ?auto_2072932 ?auto_2072933 ) ) ( not ( = ?auto_2072932 ?auto_2072934 ) ) ( not ( = ?auto_2072932 ?auto_2072935 ) ) ( not ( = ?auto_2072932 ?auto_2072936 ) ) ( not ( = ?auto_2072932 ?auto_2072937 ) ) ( not ( = ?auto_2072932 ?auto_2072938 ) ) ( not ( = ?auto_2072932 ?auto_2072939 ) ) ( not ( = ?auto_2072932 ?auto_2072940 ) ) ( not ( = ?auto_2072932 ?auto_2072941 ) ) ( not ( = ?auto_2072932 ?auto_2072945 ) ) ( not ( = ?auto_2072931 ?auto_2072933 ) ) ( not ( = ?auto_2072931 ?auto_2072934 ) ) ( not ( = ?auto_2072931 ?auto_2072935 ) ) ( not ( = ?auto_2072931 ?auto_2072936 ) ) ( not ( = ?auto_2072931 ?auto_2072937 ) ) ( not ( = ?auto_2072931 ?auto_2072938 ) ) ( not ( = ?auto_2072931 ?auto_2072939 ) ) ( not ( = ?auto_2072931 ?auto_2072940 ) ) ( not ( = ?auto_2072931 ?auto_2072941 ) ) ( not ( = ?auto_2072931 ?auto_2072945 ) ) ( not ( = ?auto_2072933 ?auto_2072934 ) ) ( not ( = ?auto_2072933 ?auto_2072935 ) ) ( not ( = ?auto_2072933 ?auto_2072936 ) ) ( not ( = ?auto_2072933 ?auto_2072937 ) ) ( not ( = ?auto_2072933 ?auto_2072938 ) ) ( not ( = ?auto_2072933 ?auto_2072939 ) ) ( not ( = ?auto_2072933 ?auto_2072940 ) ) ( not ( = ?auto_2072933 ?auto_2072941 ) ) ( not ( = ?auto_2072933 ?auto_2072945 ) ) ( not ( = ?auto_2072934 ?auto_2072935 ) ) ( not ( = ?auto_2072934 ?auto_2072936 ) ) ( not ( = ?auto_2072934 ?auto_2072937 ) ) ( not ( = ?auto_2072934 ?auto_2072938 ) ) ( not ( = ?auto_2072934 ?auto_2072939 ) ) ( not ( = ?auto_2072934 ?auto_2072940 ) ) ( not ( = ?auto_2072934 ?auto_2072941 ) ) ( not ( = ?auto_2072934 ?auto_2072945 ) ) ( not ( = ?auto_2072935 ?auto_2072936 ) ) ( not ( = ?auto_2072935 ?auto_2072937 ) ) ( not ( = ?auto_2072935 ?auto_2072938 ) ) ( not ( = ?auto_2072935 ?auto_2072939 ) ) ( not ( = ?auto_2072935 ?auto_2072940 ) ) ( not ( = ?auto_2072935 ?auto_2072941 ) ) ( not ( = ?auto_2072935 ?auto_2072945 ) ) ( not ( = ?auto_2072936 ?auto_2072937 ) ) ( not ( = ?auto_2072936 ?auto_2072938 ) ) ( not ( = ?auto_2072936 ?auto_2072939 ) ) ( not ( = ?auto_2072936 ?auto_2072940 ) ) ( not ( = ?auto_2072936 ?auto_2072941 ) ) ( not ( = ?auto_2072936 ?auto_2072945 ) ) ( not ( = ?auto_2072937 ?auto_2072938 ) ) ( not ( = ?auto_2072937 ?auto_2072939 ) ) ( not ( = ?auto_2072937 ?auto_2072940 ) ) ( not ( = ?auto_2072937 ?auto_2072941 ) ) ( not ( = ?auto_2072937 ?auto_2072945 ) ) ( not ( = ?auto_2072938 ?auto_2072939 ) ) ( not ( = ?auto_2072938 ?auto_2072940 ) ) ( not ( = ?auto_2072938 ?auto_2072941 ) ) ( not ( = ?auto_2072938 ?auto_2072945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072939 ?auto_2072940 ?auto_2072941 )
      ( MAKE-13CRATE-VERIFY ?auto_2072928 ?auto_2072929 ?auto_2072930 ?auto_2072932 ?auto_2072931 ?auto_2072933 ?auto_2072934 ?auto_2072935 ?auto_2072936 ?auto_2072937 ?auto_2072938 ?auto_2072939 ?auto_2072940 ?auto_2072941 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073111 - SURFACE
      ?auto_2073112 - SURFACE
      ?auto_2073113 - SURFACE
      ?auto_2073115 - SURFACE
      ?auto_2073114 - SURFACE
      ?auto_2073116 - SURFACE
      ?auto_2073117 - SURFACE
      ?auto_2073118 - SURFACE
      ?auto_2073119 - SURFACE
      ?auto_2073120 - SURFACE
      ?auto_2073121 - SURFACE
      ?auto_2073122 - SURFACE
      ?auto_2073123 - SURFACE
      ?auto_2073124 - SURFACE
    )
    :vars
    (
      ?auto_2073126 - HOIST
      ?auto_2073128 - PLACE
      ?auto_2073125 - PLACE
      ?auto_2073130 - HOIST
      ?auto_2073129 - SURFACE
      ?auto_2073127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073126 ?auto_2073128 ) ( IS-CRATE ?auto_2073124 ) ( not ( = ?auto_2073123 ?auto_2073124 ) ) ( not ( = ?auto_2073122 ?auto_2073123 ) ) ( not ( = ?auto_2073122 ?auto_2073124 ) ) ( not ( = ?auto_2073125 ?auto_2073128 ) ) ( HOIST-AT ?auto_2073130 ?auto_2073125 ) ( not ( = ?auto_2073126 ?auto_2073130 ) ) ( AVAILABLE ?auto_2073130 ) ( SURFACE-AT ?auto_2073124 ?auto_2073125 ) ( ON ?auto_2073124 ?auto_2073129 ) ( CLEAR ?auto_2073124 ) ( not ( = ?auto_2073123 ?auto_2073129 ) ) ( not ( = ?auto_2073124 ?auto_2073129 ) ) ( not ( = ?auto_2073122 ?auto_2073129 ) ) ( TRUCK-AT ?auto_2073127 ?auto_2073128 ) ( SURFACE-AT ?auto_2073122 ?auto_2073128 ) ( CLEAR ?auto_2073122 ) ( IS-CRATE ?auto_2073123 ) ( AVAILABLE ?auto_2073126 ) ( IN ?auto_2073123 ?auto_2073127 ) ( ON ?auto_2073112 ?auto_2073111 ) ( ON ?auto_2073113 ?auto_2073112 ) ( ON ?auto_2073115 ?auto_2073113 ) ( ON ?auto_2073114 ?auto_2073115 ) ( ON ?auto_2073116 ?auto_2073114 ) ( ON ?auto_2073117 ?auto_2073116 ) ( ON ?auto_2073118 ?auto_2073117 ) ( ON ?auto_2073119 ?auto_2073118 ) ( ON ?auto_2073120 ?auto_2073119 ) ( ON ?auto_2073121 ?auto_2073120 ) ( ON ?auto_2073122 ?auto_2073121 ) ( not ( = ?auto_2073111 ?auto_2073112 ) ) ( not ( = ?auto_2073111 ?auto_2073113 ) ) ( not ( = ?auto_2073111 ?auto_2073115 ) ) ( not ( = ?auto_2073111 ?auto_2073114 ) ) ( not ( = ?auto_2073111 ?auto_2073116 ) ) ( not ( = ?auto_2073111 ?auto_2073117 ) ) ( not ( = ?auto_2073111 ?auto_2073118 ) ) ( not ( = ?auto_2073111 ?auto_2073119 ) ) ( not ( = ?auto_2073111 ?auto_2073120 ) ) ( not ( = ?auto_2073111 ?auto_2073121 ) ) ( not ( = ?auto_2073111 ?auto_2073122 ) ) ( not ( = ?auto_2073111 ?auto_2073123 ) ) ( not ( = ?auto_2073111 ?auto_2073124 ) ) ( not ( = ?auto_2073111 ?auto_2073129 ) ) ( not ( = ?auto_2073112 ?auto_2073113 ) ) ( not ( = ?auto_2073112 ?auto_2073115 ) ) ( not ( = ?auto_2073112 ?auto_2073114 ) ) ( not ( = ?auto_2073112 ?auto_2073116 ) ) ( not ( = ?auto_2073112 ?auto_2073117 ) ) ( not ( = ?auto_2073112 ?auto_2073118 ) ) ( not ( = ?auto_2073112 ?auto_2073119 ) ) ( not ( = ?auto_2073112 ?auto_2073120 ) ) ( not ( = ?auto_2073112 ?auto_2073121 ) ) ( not ( = ?auto_2073112 ?auto_2073122 ) ) ( not ( = ?auto_2073112 ?auto_2073123 ) ) ( not ( = ?auto_2073112 ?auto_2073124 ) ) ( not ( = ?auto_2073112 ?auto_2073129 ) ) ( not ( = ?auto_2073113 ?auto_2073115 ) ) ( not ( = ?auto_2073113 ?auto_2073114 ) ) ( not ( = ?auto_2073113 ?auto_2073116 ) ) ( not ( = ?auto_2073113 ?auto_2073117 ) ) ( not ( = ?auto_2073113 ?auto_2073118 ) ) ( not ( = ?auto_2073113 ?auto_2073119 ) ) ( not ( = ?auto_2073113 ?auto_2073120 ) ) ( not ( = ?auto_2073113 ?auto_2073121 ) ) ( not ( = ?auto_2073113 ?auto_2073122 ) ) ( not ( = ?auto_2073113 ?auto_2073123 ) ) ( not ( = ?auto_2073113 ?auto_2073124 ) ) ( not ( = ?auto_2073113 ?auto_2073129 ) ) ( not ( = ?auto_2073115 ?auto_2073114 ) ) ( not ( = ?auto_2073115 ?auto_2073116 ) ) ( not ( = ?auto_2073115 ?auto_2073117 ) ) ( not ( = ?auto_2073115 ?auto_2073118 ) ) ( not ( = ?auto_2073115 ?auto_2073119 ) ) ( not ( = ?auto_2073115 ?auto_2073120 ) ) ( not ( = ?auto_2073115 ?auto_2073121 ) ) ( not ( = ?auto_2073115 ?auto_2073122 ) ) ( not ( = ?auto_2073115 ?auto_2073123 ) ) ( not ( = ?auto_2073115 ?auto_2073124 ) ) ( not ( = ?auto_2073115 ?auto_2073129 ) ) ( not ( = ?auto_2073114 ?auto_2073116 ) ) ( not ( = ?auto_2073114 ?auto_2073117 ) ) ( not ( = ?auto_2073114 ?auto_2073118 ) ) ( not ( = ?auto_2073114 ?auto_2073119 ) ) ( not ( = ?auto_2073114 ?auto_2073120 ) ) ( not ( = ?auto_2073114 ?auto_2073121 ) ) ( not ( = ?auto_2073114 ?auto_2073122 ) ) ( not ( = ?auto_2073114 ?auto_2073123 ) ) ( not ( = ?auto_2073114 ?auto_2073124 ) ) ( not ( = ?auto_2073114 ?auto_2073129 ) ) ( not ( = ?auto_2073116 ?auto_2073117 ) ) ( not ( = ?auto_2073116 ?auto_2073118 ) ) ( not ( = ?auto_2073116 ?auto_2073119 ) ) ( not ( = ?auto_2073116 ?auto_2073120 ) ) ( not ( = ?auto_2073116 ?auto_2073121 ) ) ( not ( = ?auto_2073116 ?auto_2073122 ) ) ( not ( = ?auto_2073116 ?auto_2073123 ) ) ( not ( = ?auto_2073116 ?auto_2073124 ) ) ( not ( = ?auto_2073116 ?auto_2073129 ) ) ( not ( = ?auto_2073117 ?auto_2073118 ) ) ( not ( = ?auto_2073117 ?auto_2073119 ) ) ( not ( = ?auto_2073117 ?auto_2073120 ) ) ( not ( = ?auto_2073117 ?auto_2073121 ) ) ( not ( = ?auto_2073117 ?auto_2073122 ) ) ( not ( = ?auto_2073117 ?auto_2073123 ) ) ( not ( = ?auto_2073117 ?auto_2073124 ) ) ( not ( = ?auto_2073117 ?auto_2073129 ) ) ( not ( = ?auto_2073118 ?auto_2073119 ) ) ( not ( = ?auto_2073118 ?auto_2073120 ) ) ( not ( = ?auto_2073118 ?auto_2073121 ) ) ( not ( = ?auto_2073118 ?auto_2073122 ) ) ( not ( = ?auto_2073118 ?auto_2073123 ) ) ( not ( = ?auto_2073118 ?auto_2073124 ) ) ( not ( = ?auto_2073118 ?auto_2073129 ) ) ( not ( = ?auto_2073119 ?auto_2073120 ) ) ( not ( = ?auto_2073119 ?auto_2073121 ) ) ( not ( = ?auto_2073119 ?auto_2073122 ) ) ( not ( = ?auto_2073119 ?auto_2073123 ) ) ( not ( = ?auto_2073119 ?auto_2073124 ) ) ( not ( = ?auto_2073119 ?auto_2073129 ) ) ( not ( = ?auto_2073120 ?auto_2073121 ) ) ( not ( = ?auto_2073120 ?auto_2073122 ) ) ( not ( = ?auto_2073120 ?auto_2073123 ) ) ( not ( = ?auto_2073120 ?auto_2073124 ) ) ( not ( = ?auto_2073120 ?auto_2073129 ) ) ( not ( = ?auto_2073121 ?auto_2073122 ) ) ( not ( = ?auto_2073121 ?auto_2073123 ) ) ( not ( = ?auto_2073121 ?auto_2073124 ) ) ( not ( = ?auto_2073121 ?auto_2073129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073122 ?auto_2073123 ?auto_2073124 )
      ( MAKE-13CRATE-VERIFY ?auto_2073111 ?auto_2073112 ?auto_2073113 ?auto_2073115 ?auto_2073114 ?auto_2073116 ?auto_2073117 ?auto_2073118 ?auto_2073119 ?auto_2073120 ?auto_2073121 ?auto_2073122 ?auto_2073123 ?auto_2073124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2073131 - SURFACE
      ?auto_2073132 - SURFACE
    )
    :vars
    (
      ?auto_2073135 - HOIST
      ?auto_2073137 - PLACE
      ?auto_2073133 - SURFACE
      ?auto_2073134 - PLACE
      ?auto_2073139 - HOIST
      ?auto_2073138 - SURFACE
      ?auto_2073136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073135 ?auto_2073137 ) ( IS-CRATE ?auto_2073132 ) ( not ( = ?auto_2073131 ?auto_2073132 ) ) ( not ( = ?auto_2073133 ?auto_2073131 ) ) ( not ( = ?auto_2073133 ?auto_2073132 ) ) ( not ( = ?auto_2073134 ?auto_2073137 ) ) ( HOIST-AT ?auto_2073139 ?auto_2073134 ) ( not ( = ?auto_2073135 ?auto_2073139 ) ) ( AVAILABLE ?auto_2073139 ) ( SURFACE-AT ?auto_2073132 ?auto_2073134 ) ( ON ?auto_2073132 ?auto_2073138 ) ( CLEAR ?auto_2073132 ) ( not ( = ?auto_2073131 ?auto_2073138 ) ) ( not ( = ?auto_2073132 ?auto_2073138 ) ) ( not ( = ?auto_2073133 ?auto_2073138 ) ) ( SURFACE-AT ?auto_2073133 ?auto_2073137 ) ( CLEAR ?auto_2073133 ) ( IS-CRATE ?auto_2073131 ) ( AVAILABLE ?auto_2073135 ) ( IN ?auto_2073131 ?auto_2073136 ) ( TRUCK-AT ?auto_2073136 ?auto_2073134 ) )
    :subtasks
    ( ( !DRIVE ?auto_2073136 ?auto_2073134 ?auto_2073137 )
      ( MAKE-2CRATE ?auto_2073133 ?auto_2073131 ?auto_2073132 )
      ( MAKE-1CRATE-VERIFY ?auto_2073131 ?auto_2073132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2073140 - SURFACE
      ?auto_2073141 - SURFACE
      ?auto_2073142 - SURFACE
    )
    :vars
    (
      ?auto_2073143 - HOIST
      ?auto_2073145 - PLACE
      ?auto_2073146 - PLACE
      ?auto_2073147 - HOIST
      ?auto_2073148 - SURFACE
      ?auto_2073144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073143 ?auto_2073145 ) ( IS-CRATE ?auto_2073142 ) ( not ( = ?auto_2073141 ?auto_2073142 ) ) ( not ( = ?auto_2073140 ?auto_2073141 ) ) ( not ( = ?auto_2073140 ?auto_2073142 ) ) ( not ( = ?auto_2073146 ?auto_2073145 ) ) ( HOIST-AT ?auto_2073147 ?auto_2073146 ) ( not ( = ?auto_2073143 ?auto_2073147 ) ) ( AVAILABLE ?auto_2073147 ) ( SURFACE-AT ?auto_2073142 ?auto_2073146 ) ( ON ?auto_2073142 ?auto_2073148 ) ( CLEAR ?auto_2073142 ) ( not ( = ?auto_2073141 ?auto_2073148 ) ) ( not ( = ?auto_2073142 ?auto_2073148 ) ) ( not ( = ?auto_2073140 ?auto_2073148 ) ) ( SURFACE-AT ?auto_2073140 ?auto_2073145 ) ( CLEAR ?auto_2073140 ) ( IS-CRATE ?auto_2073141 ) ( AVAILABLE ?auto_2073143 ) ( IN ?auto_2073141 ?auto_2073144 ) ( TRUCK-AT ?auto_2073144 ?auto_2073146 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073141 ?auto_2073142 )
      ( MAKE-2CRATE-VERIFY ?auto_2073140 ?auto_2073141 ?auto_2073142 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2073149 - SURFACE
      ?auto_2073150 - SURFACE
      ?auto_2073151 - SURFACE
      ?auto_2073152 - SURFACE
    )
    :vars
    (
      ?auto_2073158 - HOIST
      ?auto_2073155 - PLACE
      ?auto_2073154 - PLACE
      ?auto_2073157 - HOIST
      ?auto_2073153 - SURFACE
      ?auto_2073156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073158 ?auto_2073155 ) ( IS-CRATE ?auto_2073152 ) ( not ( = ?auto_2073151 ?auto_2073152 ) ) ( not ( = ?auto_2073150 ?auto_2073151 ) ) ( not ( = ?auto_2073150 ?auto_2073152 ) ) ( not ( = ?auto_2073154 ?auto_2073155 ) ) ( HOIST-AT ?auto_2073157 ?auto_2073154 ) ( not ( = ?auto_2073158 ?auto_2073157 ) ) ( AVAILABLE ?auto_2073157 ) ( SURFACE-AT ?auto_2073152 ?auto_2073154 ) ( ON ?auto_2073152 ?auto_2073153 ) ( CLEAR ?auto_2073152 ) ( not ( = ?auto_2073151 ?auto_2073153 ) ) ( not ( = ?auto_2073152 ?auto_2073153 ) ) ( not ( = ?auto_2073150 ?auto_2073153 ) ) ( SURFACE-AT ?auto_2073150 ?auto_2073155 ) ( CLEAR ?auto_2073150 ) ( IS-CRATE ?auto_2073151 ) ( AVAILABLE ?auto_2073158 ) ( IN ?auto_2073151 ?auto_2073156 ) ( TRUCK-AT ?auto_2073156 ?auto_2073154 ) ( ON ?auto_2073150 ?auto_2073149 ) ( not ( = ?auto_2073149 ?auto_2073150 ) ) ( not ( = ?auto_2073149 ?auto_2073151 ) ) ( not ( = ?auto_2073149 ?auto_2073152 ) ) ( not ( = ?auto_2073149 ?auto_2073153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073150 ?auto_2073151 ?auto_2073152 )
      ( MAKE-3CRATE-VERIFY ?auto_2073149 ?auto_2073150 ?auto_2073151 ?auto_2073152 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2073159 - SURFACE
      ?auto_2073160 - SURFACE
      ?auto_2073161 - SURFACE
      ?auto_2073163 - SURFACE
      ?auto_2073162 - SURFACE
    )
    :vars
    (
      ?auto_2073169 - HOIST
      ?auto_2073166 - PLACE
      ?auto_2073165 - PLACE
      ?auto_2073168 - HOIST
      ?auto_2073164 - SURFACE
      ?auto_2073167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073169 ?auto_2073166 ) ( IS-CRATE ?auto_2073162 ) ( not ( = ?auto_2073163 ?auto_2073162 ) ) ( not ( = ?auto_2073161 ?auto_2073163 ) ) ( not ( = ?auto_2073161 ?auto_2073162 ) ) ( not ( = ?auto_2073165 ?auto_2073166 ) ) ( HOIST-AT ?auto_2073168 ?auto_2073165 ) ( not ( = ?auto_2073169 ?auto_2073168 ) ) ( AVAILABLE ?auto_2073168 ) ( SURFACE-AT ?auto_2073162 ?auto_2073165 ) ( ON ?auto_2073162 ?auto_2073164 ) ( CLEAR ?auto_2073162 ) ( not ( = ?auto_2073163 ?auto_2073164 ) ) ( not ( = ?auto_2073162 ?auto_2073164 ) ) ( not ( = ?auto_2073161 ?auto_2073164 ) ) ( SURFACE-AT ?auto_2073161 ?auto_2073166 ) ( CLEAR ?auto_2073161 ) ( IS-CRATE ?auto_2073163 ) ( AVAILABLE ?auto_2073169 ) ( IN ?auto_2073163 ?auto_2073167 ) ( TRUCK-AT ?auto_2073167 ?auto_2073165 ) ( ON ?auto_2073160 ?auto_2073159 ) ( ON ?auto_2073161 ?auto_2073160 ) ( not ( = ?auto_2073159 ?auto_2073160 ) ) ( not ( = ?auto_2073159 ?auto_2073161 ) ) ( not ( = ?auto_2073159 ?auto_2073163 ) ) ( not ( = ?auto_2073159 ?auto_2073162 ) ) ( not ( = ?auto_2073159 ?auto_2073164 ) ) ( not ( = ?auto_2073160 ?auto_2073161 ) ) ( not ( = ?auto_2073160 ?auto_2073163 ) ) ( not ( = ?auto_2073160 ?auto_2073162 ) ) ( not ( = ?auto_2073160 ?auto_2073164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073161 ?auto_2073163 ?auto_2073162 )
      ( MAKE-4CRATE-VERIFY ?auto_2073159 ?auto_2073160 ?auto_2073161 ?auto_2073163 ?auto_2073162 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2073170 - SURFACE
      ?auto_2073171 - SURFACE
      ?auto_2073172 - SURFACE
      ?auto_2073174 - SURFACE
      ?auto_2073173 - SURFACE
      ?auto_2073175 - SURFACE
    )
    :vars
    (
      ?auto_2073181 - HOIST
      ?auto_2073178 - PLACE
      ?auto_2073177 - PLACE
      ?auto_2073180 - HOIST
      ?auto_2073176 - SURFACE
      ?auto_2073179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073181 ?auto_2073178 ) ( IS-CRATE ?auto_2073175 ) ( not ( = ?auto_2073173 ?auto_2073175 ) ) ( not ( = ?auto_2073174 ?auto_2073173 ) ) ( not ( = ?auto_2073174 ?auto_2073175 ) ) ( not ( = ?auto_2073177 ?auto_2073178 ) ) ( HOIST-AT ?auto_2073180 ?auto_2073177 ) ( not ( = ?auto_2073181 ?auto_2073180 ) ) ( AVAILABLE ?auto_2073180 ) ( SURFACE-AT ?auto_2073175 ?auto_2073177 ) ( ON ?auto_2073175 ?auto_2073176 ) ( CLEAR ?auto_2073175 ) ( not ( = ?auto_2073173 ?auto_2073176 ) ) ( not ( = ?auto_2073175 ?auto_2073176 ) ) ( not ( = ?auto_2073174 ?auto_2073176 ) ) ( SURFACE-AT ?auto_2073174 ?auto_2073178 ) ( CLEAR ?auto_2073174 ) ( IS-CRATE ?auto_2073173 ) ( AVAILABLE ?auto_2073181 ) ( IN ?auto_2073173 ?auto_2073179 ) ( TRUCK-AT ?auto_2073179 ?auto_2073177 ) ( ON ?auto_2073171 ?auto_2073170 ) ( ON ?auto_2073172 ?auto_2073171 ) ( ON ?auto_2073174 ?auto_2073172 ) ( not ( = ?auto_2073170 ?auto_2073171 ) ) ( not ( = ?auto_2073170 ?auto_2073172 ) ) ( not ( = ?auto_2073170 ?auto_2073174 ) ) ( not ( = ?auto_2073170 ?auto_2073173 ) ) ( not ( = ?auto_2073170 ?auto_2073175 ) ) ( not ( = ?auto_2073170 ?auto_2073176 ) ) ( not ( = ?auto_2073171 ?auto_2073172 ) ) ( not ( = ?auto_2073171 ?auto_2073174 ) ) ( not ( = ?auto_2073171 ?auto_2073173 ) ) ( not ( = ?auto_2073171 ?auto_2073175 ) ) ( not ( = ?auto_2073171 ?auto_2073176 ) ) ( not ( = ?auto_2073172 ?auto_2073174 ) ) ( not ( = ?auto_2073172 ?auto_2073173 ) ) ( not ( = ?auto_2073172 ?auto_2073175 ) ) ( not ( = ?auto_2073172 ?auto_2073176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073174 ?auto_2073173 ?auto_2073175 )
      ( MAKE-5CRATE-VERIFY ?auto_2073170 ?auto_2073171 ?auto_2073172 ?auto_2073174 ?auto_2073173 ?auto_2073175 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2073182 - SURFACE
      ?auto_2073183 - SURFACE
      ?auto_2073184 - SURFACE
      ?auto_2073186 - SURFACE
      ?auto_2073185 - SURFACE
      ?auto_2073187 - SURFACE
      ?auto_2073188 - SURFACE
    )
    :vars
    (
      ?auto_2073194 - HOIST
      ?auto_2073191 - PLACE
      ?auto_2073190 - PLACE
      ?auto_2073193 - HOIST
      ?auto_2073189 - SURFACE
      ?auto_2073192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073194 ?auto_2073191 ) ( IS-CRATE ?auto_2073188 ) ( not ( = ?auto_2073187 ?auto_2073188 ) ) ( not ( = ?auto_2073185 ?auto_2073187 ) ) ( not ( = ?auto_2073185 ?auto_2073188 ) ) ( not ( = ?auto_2073190 ?auto_2073191 ) ) ( HOIST-AT ?auto_2073193 ?auto_2073190 ) ( not ( = ?auto_2073194 ?auto_2073193 ) ) ( AVAILABLE ?auto_2073193 ) ( SURFACE-AT ?auto_2073188 ?auto_2073190 ) ( ON ?auto_2073188 ?auto_2073189 ) ( CLEAR ?auto_2073188 ) ( not ( = ?auto_2073187 ?auto_2073189 ) ) ( not ( = ?auto_2073188 ?auto_2073189 ) ) ( not ( = ?auto_2073185 ?auto_2073189 ) ) ( SURFACE-AT ?auto_2073185 ?auto_2073191 ) ( CLEAR ?auto_2073185 ) ( IS-CRATE ?auto_2073187 ) ( AVAILABLE ?auto_2073194 ) ( IN ?auto_2073187 ?auto_2073192 ) ( TRUCK-AT ?auto_2073192 ?auto_2073190 ) ( ON ?auto_2073183 ?auto_2073182 ) ( ON ?auto_2073184 ?auto_2073183 ) ( ON ?auto_2073186 ?auto_2073184 ) ( ON ?auto_2073185 ?auto_2073186 ) ( not ( = ?auto_2073182 ?auto_2073183 ) ) ( not ( = ?auto_2073182 ?auto_2073184 ) ) ( not ( = ?auto_2073182 ?auto_2073186 ) ) ( not ( = ?auto_2073182 ?auto_2073185 ) ) ( not ( = ?auto_2073182 ?auto_2073187 ) ) ( not ( = ?auto_2073182 ?auto_2073188 ) ) ( not ( = ?auto_2073182 ?auto_2073189 ) ) ( not ( = ?auto_2073183 ?auto_2073184 ) ) ( not ( = ?auto_2073183 ?auto_2073186 ) ) ( not ( = ?auto_2073183 ?auto_2073185 ) ) ( not ( = ?auto_2073183 ?auto_2073187 ) ) ( not ( = ?auto_2073183 ?auto_2073188 ) ) ( not ( = ?auto_2073183 ?auto_2073189 ) ) ( not ( = ?auto_2073184 ?auto_2073186 ) ) ( not ( = ?auto_2073184 ?auto_2073185 ) ) ( not ( = ?auto_2073184 ?auto_2073187 ) ) ( not ( = ?auto_2073184 ?auto_2073188 ) ) ( not ( = ?auto_2073184 ?auto_2073189 ) ) ( not ( = ?auto_2073186 ?auto_2073185 ) ) ( not ( = ?auto_2073186 ?auto_2073187 ) ) ( not ( = ?auto_2073186 ?auto_2073188 ) ) ( not ( = ?auto_2073186 ?auto_2073189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073185 ?auto_2073187 ?auto_2073188 )
      ( MAKE-6CRATE-VERIFY ?auto_2073182 ?auto_2073183 ?auto_2073184 ?auto_2073186 ?auto_2073185 ?auto_2073187 ?auto_2073188 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2073195 - SURFACE
      ?auto_2073196 - SURFACE
      ?auto_2073197 - SURFACE
      ?auto_2073199 - SURFACE
      ?auto_2073198 - SURFACE
      ?auto_2073200 - SURFACE
      ?auto_2073201 - SURFACE
      ?auto_2073202 - SURFACE
    )
    :vars
    (
      ?auto_2073208 - HOIST
      ?auto_2073205 - PLACE
      ?auto_2073204 - PLACE
      ?auto_2073207 - HOIST
      ?auto_2073203 - SURFACE
      ?auto_2073206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073208 ?auto_2073205 ) ( IS-CRATE ?auto_2073202 ) ( not ( = ?auto_2073201 ?auto_2073202 ) ) ( not ( = ?auto_2073200 ?auto_2073201 ) ) ( not ( = ?auto_2073200 ?auto_2073202 ) ) ( not ( = ?auto_2073204 ?auto_2073205 ) ) ( HOIST-AT ?auto_2073207 ?auto_2073204 ) ( not ( = ?auto_2073208 ?auto_2073207 ) ) ( AVAILABLE ?auto_2073207 ) ( SURFACE-AT ?auto_2073202 ?auto_2073204 ) ( ON ?auto_2073202 ?auto_2073203 ) ( CLEAR ?auto_2073202 ) ( not ( = ?auto_2073201 ?auto_2073203 ) ) ( not ( = ?auto_2073202 ?auto_2073203 ) ) ( not ( = ?auto_2073200 ?auto_2073203 ) ) ( SURFACE-AT ?auto_2073200 ?auto_2073205 ) ( CLEAR ?auto_2073200 ) ( IS-CRATE ?auto_2073201 ) ( AVAILABLE ?auto_2073208 ) ( IN ?auto_2073201 ?auto_2073206 ) ( TRUCK-AT ?auto_2073206 ?auto_2073204 ) ( ON ?auto_2073196 ?auto_2073195 ) ( ON ?auto_2073197 ?auto_2073196 ) ( ON ?auto_2073199 ?auto_2073197 ) ( ON ?auto_2073198 ?auto_2073199 ) ( ON ?auto_2073200 ?auto_2073198 ) ( not ( = ?auto_2073195 ?auto_2073196 ) ) ( not ( = ?auto_2073195 ?auto_2073197 ) ) ( not ( = ?auto_2073195 ?auto_2073199 ) ) ( not ( = ?auto_2073195 ?auto_2073198 ) ) ( not ( = ?auto_2073195 ?auto_2073200 ) ) ( not ( = ?auto_2073195 ?auto_2073201 ) ) ( not ( = ?auto_2073195 ?auto_2073202 ) ) ( not ( = ?auto_2073195 ?auto_2073203 ) ) ( not ( = ?auto_2073196 ?auto_2073197 ) ) ( not ( = ?auto_2073196 ?auto_2073199 ) ) ( not ( = ?auto_2073196 ?auto_2073198 ) ) ( not ( = ?auto_2073196 ?auto_2073200 ) ) ( not ( = ?auto_2073196 ?auto_2073201 ) ) ( not ( = ?auto_2073196 ?auto_2073202 ) ) ( not ( = ?auto_2073196 ?auto_2073203 ) ) ( not ( = ?auto_2073197 ?auto_2073199 ) ) ( not ( = ?auto_2073197 ?auto_2073198 ) ) ( not ( = ?auto_2073197 ?auto_2073200 ) ) ( not ( = ?auto_2073197 ?auto_2073201 ) ) ( not ( = ?auto_2073197 ?auto_2073202 ) ) ( not ( = ?auto_2073197 ?auto_2073203 ) ) ( not ( = ?auto_2073199 ?auto_2073198 ) ) ( not ( = ?auto_2073199 ?auto_2073200 ) ) ( not ( = ?auto_2073199 ?auto_2073201 ) ) ( not ( = ?auto_2073199 ?auto_2073202 ) ) ( not ( = ?auto_2073199 ?auto_2073203 ) ) ( not ( = ?auto_2073198 ?auto_2073200 ) ) ( not ( = ?auto_2073198 ?auto_2073201 ) ) ( not ( = ?auto_2073198 ?auto_2073202 ) ) ( not ( = ?auto_2073198 ?auto_2073203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073200 ?auto_2073201 ?auto_2073202 )
      ( MAKE-7CRATE-VERIFY ?auto_2073195 ?auto_2073196 ?auto_2073197 ?auto_2073199 ?auto_2073198 ?auto_2073200 ?auto_2073201 ?auto_2073202 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2073209 - SURFACE
      ?auto_2073210 - SURFACE
      ?auto_2073211 - SURFACE
      ?auto_2073213 - SURFACE
      ?auto_2073212 - SURFACE
      ?auto_2073214 - SURFACE
      ?auto_2073215 - SURFACE
      ?auto_2073216 - SURFACE
      ?auto_2073217 - SURFACE
    )
    :vars
    (
      ?auto_2073223 - HOIST
      ?auto_2073220 - PLACE
      ?auto_2073219 - PLACE
      ?auto_2073222 - HOIST
      ?auto_2073218 - SURFACE
      ?auto_2073221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073223 ?auto_2073220 ) ( IS-CRATE ?auto_2073217 ) ( not ( = ?auto_2073216 ?auto_2073217 ) ) ( not ( = ?auto_2073215 ?auto_2073216 ) ) ( not ( = ?auto_2073215 ?auto_2073217 ) ) ( not ( = ?auto_2073219 ?auto_2073220 ) ) ( HOIST-AT ?auto_2073222 ?auto_2073219 ) ( not ( = ?auto_2073223 ?auto_2073222 ) ) ( AVAILABLE ?auto_2073222 ) ( SURFACE-AT ?auto_2073217 ?auto_2073219 ) ( ON ?auto_2073217 ?auto_2073218 ) ( CLEAR ?auto_2073217 ) ( not ( = ?auto_2073216 ?auto_2073218 ) ) ( not ( = ?auto_2073217 ?auto_2073218 ) ) ( not ( = ?auto_2073215 ?auto_2073218 ) ) ( SURFACE-AT ?auto_2073215 ?auto_2073220 ) ( CLEAR ?auto_2073215 ) ( IS-CRATE ?auto_2073216 ) ( AVAILABLE ?auto_2073223 ) ( IN ?auto_2073216 ?auto_2073221 ) ( TRUCK-AT ?auto_2073221 ?auto_2073219 ) ( ON ?auto_2073210 ?auto_2073209 ) ( ON ?auto_2073211 ?auto_2073210 ) ( ON ?auto_2073213 ?auto_2073211 ) ( ON ?auto_2073212 ?auto_2073213 ) ( ON ?auto_2073214 ?auto_2073212 ) ( ON ?auto_2073215 ?auto_2073214 ) ( not ( = ?auto_2073209 ?auto_2073210 ) ) ( not ( = ?auto_2073209 ?auto_2073211 ) ) ( not ( = ?auto_2073209 ?auto_2073213 ) ) ( not ( = ?auto_2073209 ?auto_2073212 ) ) ( not ( = ?auto_2073209 ?auto_2073214 ) ) ( not ( = ?auto_2073209 ?auto_2073215 ) ) ( not ( = ?auto_2073209 ?auto_2073216 ) ) ( not ( = ?auto_2073209 ?auto_2073217 ) ) ( not ( = ?auto_2073209 ?auto_2073218 ) ) ( not ( = ?auto_2073210 ?auto_2073211 ) ) ( not ( = ?auto_2073210 ?auto_2073213 ) ) ( not ( = ?auto_2073210 ?auto_2073212 ) ) ( not ( = ?auto_2073210 ?auto_2073214 ) ) ( not ( = ?auto_2073210 ?auto_2073215 ) ) ( not ( = ?auto_2073210 ?auto_2073216 ) ) ( not ( = ?auto_2073210 ?auto_2073217 ) ) ( not ( = ?auto_2073210 ?auto_2073218 ) ) ( not ( = ?auto_2073211 ?auto_2073213 ) ) ( not ( = ?auto_2073211 ?auto_2073212 ) ) ( not ( = ?auto_2073211 ?auto_2073214 ) ) ( not ( = ?auto_2073211 ?auto_2073215 ) ) ( not ( = ?auto_2073211 ?auto_2073216 ) ) ( not ( = ?auto_2073211 ?auto_2073217 ) ) ( not ( = ?auto_2073211 ?auto_2073218 ) ) ( not ( = ?auto_2073213 ?auto_2073212 ) ) ( not ( = ?auto_2073213 ?auto_2073214 ) ) ( not ( = ?auto_2073213 ?auto_2073215 ) ) ( not ( = ?auto_2073213 ?auto_2073216 ) ) ( not ( = ?auto_2073213 ?auto_2073217 ) ) ( not ( = ?auto_2073213 ?auto_2073218 ) ) ( not ( = ?auto_2073212 ?auto_2073214 ) ) ( not ( = ?auto_2073212 ?auto_2073215 ) ) ( not ( = ?auto_2073212 ?auto_2073216 ) ) ( not ( = ?auto_2073212 ?auto_2073217 ) ) ( not ( = ?auto_2073212 ?auto_2073218 ) ) ( not ( = ?auto_2073214 ?auto_2073215 ) ) ( not ( = ?auto_2073214 ?auto_2073216 ) ) ( not ( = ?auto_2073214 ?auto_2073217 ) ) ( not ( = ?auto_2073214 ?auto_2073218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073215 ?auto_2073216 ?auto_2073217 )
      ( MAKE-8CRATE-VERIFY ?auto_2073209 ?auto_2073210 ?auto_2073211 ?auto_2073213 ?auto_2073212 ?auto_2073214 ?auto_2073215 ?auto_2073216 ?auto_2073217 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2073224 - SURFACE
      ?auto_2073225 - SURFACE
      ?auto_2073226 - SURFACE
      ?auto_2073228 - SURFACE
      ?auto_2073227 - SURFACE
      ?auto_2073229 - SURFACE
      ?auto_2073230 - SURFACE
      ?auto_2073231 - SURFACE
      ?auto_2073232 - SURFACE
      ?auto_2073233 - SURFACE
    )
    :vars
    (
      ?auto_2073239 - HOIST
      ?auto_2073236 - PLACE
      ?auto_2073235 - PLACE
      ?auto_2073238 - HOIST
      ?auto_2073234 - SURFACE
      ?auto_2073237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073239 ?auto_2073236 ) ( IS-CRATE ?auto_2073233 ) ( not ( = ?auto_2073232 ?auto_2073233 ) ) ( not ( = ?auto_2073231 ?auto_2073232 ) ) ( not ( = ?auto_2073231 ?auto_2073233 ) ) ( not ( = ?auto_2073235 ?auto_2073236 ) ) ( HOIST-AT ?auto_2073238 ?auto_2073235 ) ( not ( = ?auto_2073239 ?auto_2073238 ) ) ( AVAILABLE ?auto_2073238 ) ( SURFACE-AT ?auto_2073233 ?auto_2073235 ) ( ON ?auto_2073233 ?auto_2073234 ) ( CLEAR ?auto_2073233 ) ( not ( = ?auto_2073232 ?auto_2073234 ) ) ( not ( = ?auto_2073233 ?auto_2073234 ) ) ( not ( = ?auto_2073231 ?auto_2073234 ) ) ( SURFACE-AT ?auto_2073231 ?auto_2073236 ) ( CLEAR ?auto_2073231 ) ( IS-CRATE ?auto_2073232 ) ( AVAILABLE ?auto_2073239 ) ( IN ?auto_2073232 ?auto_2073237 ) ( TRUCK-AT ?auto_2073237 ?auto_2073235 ) ( ON ?auto_2073225 ?auto_2073224 ) ( ON ?auto_2073226 ?auto_2073225 ) ( ON ?auto_2073228 ?auto_2073226 ) ( ON ?auto_2073227 ?auto_2073228 ) ( ON ?auto_2073229 ?auto_2073227 ) ( ON ?auto_2073230 ?auto_2073229 ) ( ON ?auto_2073231 ?auto_2073230 ) ( not ( = ?auto_2073224 ?auto_2073225 ) ) ( not ( = ?auto_2073224 ?auto_2073226 ) ) ( not ( = ?auto_2073224 ?auto_2073228 ) ) ( not ( = ?auto_2073224 ?auto_2073227 ) ) ( not ( = ?auto_2073224 ?auto_2073229 ) ) ( not ( = ?auto_2073224 ?auto_2073230 ) ) ( not ( = ?auto_2073224 ?auto_2073231 ) ) ( not ( = ?auto_2073224 ?auto_2073232 ) ) ( not ( = ?auto_2073224 ?auto_2073233 ) ) ( not ( = ?auto_2073224 ?auto_2073234 ) ) ( not ( = ?auto_2073225 ?auto_2073226 ) ) ( not ( = ?auto_2073225 ?auto_2073228 ) ) ( not ( = ?auto_2073225 ?auto_2073227 ) ) ( not ( = ?auto_2073225 ?auto_2073229 ) ) ( not ( = ?auto_2073225 ?auto_2073230 ) ) ( not ( = ?auto_2073225 ?auto_2073231 ) ) ( not ( = ?auto_2073225 ?auto_2073232 ) ) ( not ( = ?auto_2073225 ?auto_2073233 ) ) ( not ( = ?auto_2073225 ?auto_2073234 ) ) ( not ( = ?auto_2073226 ?auto_2073228 ) ) ( not ( = ?auto_2073226 ?auto_2073227 ) ) ( not ( = ?auto_2073226 ?auto_2073229 ) ) ( not ( = ?auto_2073226 ?auto_2073230 ) ) ( not ( = ?auto_2073226 ?auto_2073231 ) ) ( not ( = ?auto_2073226 ?auto_2073232 ) ) ( not ( = ?auto_2073226 ?auto_2073233 ) ) ( not ( = ?auto_2073226 ?auto_2073234 ) ) ( not ( = ?auto_2073228 ?auto_2073227 ) ) ( not ( = ?auto_2073228 ?auto_2073229 ) ) ( not ( = ?auto_2073228 ?auto_2073230 ) ) ( not ( = ?auto_2073228 ?auto_2073231 ) ) ( not ( = ?auto_2073228 ?auto_2073232 ) ) ( not ( = ?auto_2073228 ?auto_2073233 ) ) ( not ( = ?auto_2073228 ?auto_2073234 ) ) ( not ( = ?auto_2073227 ?auto_2073229 ) ) ( not ( = ?auto_2073227 ?auto_2073230 ) ) ( not ( = ?auto_2073227 ?auto_2073231 ) ) ( not ( = ?auto_2073227 ?auto_2073232 ) ) ( not ( = ?auto_2073227 ?auto_2073233 ) ) ( not ( = ?auto_2073227 ?auto_2073234 ) ) ( not ( = ?auto_2073229 ?auto_2073230 ) ) ( not ( = ?auto_2073229 ?auto_2073231 ) ) ( not ( = ?auto_2073229 ?auto_2073232 ) ) ( not ( = ?auto_2073229 ?auto_2073233 ) ) ( not ( = ?auto_2073229 ?auto_2073234 ) ) ( not ( = ?auto_2073230 ?auto_2073231 ) ) ( not ( = ?auto_2073230 ?auto_2073232 ) ) ( not ( = ?auto_2073230 ?auto_2073233 ) ) ( not ( = ?auto_2073230 ?auto_2073234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073231 ?auto_2073232 ?auto_2073233 )
      ( MAKE-9CRATE-VERIFY ?auto_2073224 ?auto_2073225 ?auto_2073226 ?auto_2073228 ?auto_2073227 ?auto_2073229 ?auto_2073230 ?auto_2073231 ?auto_2073232 ?auto_2073233 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2073240 - SURFACE
      ?auto_2073241 - SURFACE
      ?auto_2073242 - SURFACE
      ?auto_2073244 - SURFACE
      ?auto_2073243 - SURFACE
      ?auto_2073245 - SURFACE
      ?auto_2073246 - SURFACE
      ?auto_2073247 - SURFACE
      ?auto_2073248 - SURFACE
      ?auto_2073249 - SURFACE
      ?auto_2073250 - SURFACE
    )
    :vars
    (
      ?auto_2073256 - HOIST
      ?auto_2073253 - PLACE
      ?auto_2073252 - PLACE
      ?auto_2073255 - HOIST
      ?auto_2073251 - SURFACE
      ?auto_2073254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073256 ?auto_2073253 ) ( IS-CRATE ?auto_2073250 ) ( not ( = ?auto_2073249 ?auto_2073250 ) ) ( not ( = ?auto_2073248 ?auto_2073249 ) ) ( not ( = ?auto_2073248 ?auto_2073250 ) ) ( not ( = ?auto_2073252 ?auto_2073253 ) ) ( HOIST-AT ?auto_2073255 ?auto_2073252 ) ( not ( = ?auto_2073256 ?auto_2073255 ) ) ( AVAILABLE ?auto_2073255 ) ( SURFACE-AT ?auto_2073250 ?auto_2073252 ) ( ON ?auto_2073250 ?auto_2073251 ) ( CLEAR ?auto_2073250 ) ( not ( = ?auto_2073249 ?auto_2073251 ) ) ( not ( = ?auto_2073250 ?auto_2073251 ) ) ( not ( = ?auto_2073248 ?auto_2073251 ) ) ( SURFACE-AT ?auto_2073248 ?auto_2073253 ) ( CLEAR ?auto_2073248 ) ( IS-CRATE ?auto_2073249 ) ( AVAILABLE ?auto_2073256 ) ( IN ?auto_2073249 ?auto_2073254 ) ( TRUCK-AT ?auto_2073254 ?auto_2073252 ) ( ON ?auto_2073241 ?auto_2073240 ) ( ON ?auto_2073242 ?auto_2073241 ) ( ON ?auto_2073244 ?auto_2073242 ) ( ON ?auto_2073243 ?auto_2073244 ) ( ON ?auto_2073245 ?auto_2073243 ) ( ON ?auto_2073246 ?auto_2073245 ) ( ON ?auto_2073247 ?auto_2073246 ) ( ON ?auto_2073248 ?auto_2073247 ) ( not ( = ?auto_2073240 ?auto_2073241 ) ) ( not ( = ?auto_2073240 ?auto_2073242 ) ) ( not ( = ?auto_2073240 ?auto_2073244 ) ) ( not ( = ?auto_2073240 ?auto_2073243 ) ) ( not ( = ?auto_2073240 ?auto_2073245 ) ) ( not ( = ?auto_2073240 ?auto_2073246 ) ) ( not ( = ?auto_2073240 ?auto_2073247 ) ) ( not ( = ?auto_2073240 ?auto_2073248 ) ) ( not ( = ?auto_2073240 ?auto_2073249 ) ) ( not ( = ?auto_2073240 ?auto_2073250 ) ) ( not ( = ?auto_2073240 ?auto_2073251 ) ) ( not ( = ?auto_2073241 ?auto_2073242 ) ) ( not ( = ?auto_2073241 ?auto_2073244 ) ) ( not ( = ?auto_2073241 ?auto_2073243 ) ) ( not ( = ?auto_2073241 ?auto_2073245 ) ) ( not ( = ?auto_2073241 ?auto_2073246 ) ) ( not ( = ?auto_2073241 ?auto_2073247 ) ) ( not ( = ?auto_2073241 ?auto_2073248 ) ) ( not ( = ?auto_2073241 ?auto_2073249 ) ) ( not ( = ?auto_2073241 ?auto_2073250 ) ) ( not ( = ?auto_2073241 ?auto_2073251 ) ) ( not ( = ?auto_2073242 ?auto_2073244 ) ) ( not ( = ?auto_2073242 ?auto_2073243 ) ) ( not ( = ?auto_2073242 ?auto_2073245 ) ) ( not ( = ?auto_2073242 ?auto_2073246 ) ) ( not ( = ?auto_2073242 ?auto_2073247 ) ) ( not ( = ?auto_2073242 ?auto_2073248 ) ) ( not ( = ?auto_2073242 ?auto_2073249 ) ) ( not ( = ?auto_2073242 ?auto_2073250 ) ) ( not ( = ?auto_2073242 ?auto_2073251 ) ) ( not ( = ?auto_2073244 ?auto_2073243 ) ) ( not ( = ?auto_2073244 ?auto_2073245 ) ) ( not ( = ?auto_2073244 ?auto_2073246 ) ) ( not ( = ?auto_2073244 ?auto_2073247 ) ) ( not ( = ?auto_2073244 ?auto_2073248 ) ) ( not ( = ?auto_2073244 ?auto_2073249 ) ) ( not ( = ?auto_2073244 ?auto_2073250 ) ) ( not ( = ?auto_2073244 ?auto_2073251 ) ) ( not ( = ?auto_2073243 ?auto_2073245 ) ) ( not ( = ?auto_2073243 ?auto_2073246 ) ) ( not ( = ?auto_2073243 ?auto_2073247 ) ) ( not ( = ?auto_2073243 ?auto_2073248 ) ) ( not ( = ?auto_2073243 ?auto_2073249 ) ) ( not ( = ?auto_2073243 ?auto_2073250 ) ) ( not ( = ?auto_2073243 ?auto_2073251 ) ) ( not ( = ?auto_2073245 ?auto_2073246 ) ) ( not ( = ?auto_2073245 ?auto_2073247 ) ) ( not ( = ?auto_2073245 ?auto_2073248 ) ) ( not ( = ?auto_2073245 ?auto_2073249 ) ) ( not ( = ?auto_2073245 ?auto_2073250 ) ) ( not ( = ?auto_2073245 ?auto_2073251 ) ) ( not ( = ?auto_2073246 ?auto_2073247 ) ) ( not ( = ?auto_2073246 ?auto_2073248 ) ) ( not ( = ?auto_2073246 ?auto_2073249 ) ) ( not ( = ?auto_2073246 ?auto_2073250 ) ) ( not ( = ?auto_2073246 ?auto_2073251 ) ) ( not ( = ?auto_2073247 ?auto_2073248 ) ) ( not ( = ?auto_2073247 ?auto_2073249 ) ) ( not ( = ?auto_2073247 ?auto_2073250 ) ) ( not ( = ?auto_2073247 ?auto_2073251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073248 ?auto_2073249 ?auto_2073250 )
      ( MAKE-10CRATE-VERIFY ?auto_2073240 ?auto_2073241 ?auto_2073242 ?auto_2073244 ?auto_2073243 ?auto_2073245 ?auto_2073246 ?auto_2073247 ?auto_2073248 ?auto_2073249 ?auto_2073250 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2073257 - SURFACE
      ?auto_2073258 - SURFACE
      ?auto_2073259 - SURFACE
      ?auto_2073261 - SURFACE
      ?auto_2073260 - SURFACE
      ?auto_2073262 - SURFACE
      ?auto_2073263 - SURFACE
      ?auto_2073264 - SURFACE
      ?auto_2073265 - SURFACE
      ?auto_2073266 - SURFACE
      ?auto_2073267 - SURFACE
      ?auto_2073268 - SURFACE
    )
    :vars
    (
      ?auto_2073274 - HOIST
      ?auto_2073271 - PLACE
      ?auto_2073270 - PLACE
      ?auto_2073273 - HOIST
      ?auto_2073269 - SURFACE
      ?auto_2073272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073274 ?auto_2073271 ) ( IS-CRATE ?auto_2073268 ) ( not ( = ?auto_2073267 ?auto_2073268 ) ) ( not ( = ?auto_2073266 ?auto_2073267 ) ) ( not ( = ?auto_2073266 ?auto_2073268 ) ) ( not ( = ?auto_2073270 ?auto_2073271 ) ) ( HOIST-AT ?auto_2073273 ?auto_2073270 ) ( not ( = ?auto_2073274 ?auto_2073273 ) ) ( AVAILABLE ?auto_2073273 ) ( SURFACE-AT ?auto_2073268 ?auto_2073270 ) ( ON ?auto_2073268 ?auto_2073269 ) ( CLEAR ?auto_2073268 ) ( not ( = ?auto_2073267 ?auto_2073269 ) ) ( not ( = ?auto_2073268 ?auto_2073269 ) ) ( not ( = ?auto_2073266 ?auto_2073269 ) ) ( SURFACE-AT ?auto_2073266 ?auto_2073271 ) ( CLEAR ?auto_2073266 ) ( IS-CRATE ?auto_2073267 ) ( AVAILABLE ?auto_2073274 ) ( IN ?auto_2073267 ?auto_2073272 ) ( TRUCK-AT ?auto_2073272 ?auto_2073270 ) ( ON ?auto_2073258 ?auto_2073257 ) ( ON ?auto_2073259 ?auto_2073258 ) ( ON ?auto_2073261 ?auto_2073259 ) ( ON ?auto_2073260 ?auto_2073261 ) ( ON ?auto_2073262 ?auto_2073260 ) ( ON ?auto_2073263 ?auto_2073262 ) ( ON ?auto_2073264 ?auto_2073263 ) ( ON ?auto_2073265 ?auto_2073264 ) ( ON ?auto_2073266 ?auto_2073265 ) ( not ( = ?auto_2073257 ?auto_2073258 ) ) ( not ( = ?auto_2073257 ?auto_2073259 ) ) ( not ( = ?auto_2073257 ?auto_2073261 ) ) ( not ( = ?auto_2073257 ?auto_2073260 ) ) ( not ( = ?auto_2073257 ?auto_2073262 ) ) ( not ( = ?auto_2073257 ?auto_2073263 ) ) ( not ( = ?auto_2073257 ?auto_2073264 ) ) ( not ( = ?auto_2073257 ?auto_2073265 ) ) ( not ( = ?auto_2073257 ?auto_2073266 ) ) ( not ( = ?auto_2073257 ?auto_2073267 ) ) ( not ( = ?auto_2073257 ?auto_2073268 ) ) ( not ( = ?auto_2073257 ?auto_2073269 ) ) ( not ( = ?auto_2073258 ?auto_2073259 ) ) ( not ( = ?auto_2073258 ?auto_2073261 ) ) ( not ( = ?auto_2073258 ?auto_2073260 ) ) ( not ( = ?auto_2073258 ?auto_2073262 ) ) ( not ( = ?auto_2073258 ?auto_2073263 ) ) ( not ( = ?auto_2073258 ?auto_2073264 ) ) ( not ( = ?auto_2073258 ?auto_2073265 ) ) ( not ( = ?auto_2073258 ?auto_2073266 ) ) ( not ( = ?auto_2073258 ?auto_2073267 ) ) ( not ( = ?auto_2073258 ?auto_2073268 ) ) ( not ( = ?auto_2073258 ?auto_2073269 ) ) ( not ( = ?auto_2073259 ?auto_2073261 ) ) ( not ( = ?auto_2073259 ?auto_2073260 ) ) ( not ( = ?auto_2073259 ?auto_2073262 ) ) ( not ( = ?auto_2073259 ?auto_2073263 ) ) ( not ( = ?auto_2073259 ?auto_2073264 ) ) ( not ( = ?auto_2073259 ?auto_2073265 ) ) ( not ( = ?auto_2073259 ?auto_2073266 ) ) ( not ( = ?auto_2073259 ?auto_2073267 ) ) ( not ( = ?auto_2073259 ?auto_2073268 ) ) ( not ( = ?auto_2073259 ?auto_2073269 ) ) ( not ( = ?auto_2073261 ?auto_2073260 ) ) ( not ( = ?auto_2073261 ?auto_2073262 ) ) ( not ( = ?auto_2073261 ?auto_2073263 ) ) ( not ( = ?auto_2073261 ?auto_2073264 ) ) ( not ( = ?auto_2073261 ?auto_2073265 ) ) ( not ( = ?auto_2073261 ?auto_2073266 ) ) ( not ( = ?auto_2073261 ?auto_2073267 ) ) ( not ( = ?auto_2073261 ?auto_2073268 ) ) ( not ( = ?auto_2073261 ?auto_2073269 ) ) ( not ( = ?auto_2073260 ?auto_2073262 ) ) ( not ( = ?auto_2073260 ?auto_2073263 ) ) ( not ( = ?auto_2073260 ?auto_2073264 ) ) ( not ( = ?auto_2073260 ?auto_2073265 ) ) ( not ( = ?auto_2073260 ?auto_2073266 ) ) ( not ( = ?auto_2073260 ?auto_2073267 ) ) ( not ( = ?auto_2073260 ?auto_2073268 ) ) ( not ( = ?auto_2073260 ?auto_2073269 ) ) ( not ( = ?auto_2073262 ?auto_2073263 ) ) ( not ( = ?auto_2073262 ?auto_2073264 ) ) ( not ( = ?auto_2073262 ?auto_2073265 ) ) ( not ( = ?auto_2073262 ?auto_2073266 ) ) ( not ( = ?auto_2073262 ?auto_2073267 ) ) ( not ( = ?auto_2073262 ?auto_2073268 ) ) ( not ( = ?auto_2073262 ?auto_2073269 ) ) ( not ( = ?auto_2073263 ?auto_2073264 ) ) ( not ( = ?auto_2073263 ?auto_2073265 ) ) ( not ( = ?auto_2073263 ?auto_2073266 ) ) ( not ( = ?auto_2073263 ?auto_2073267 ) ) ( not ( = ?auto_2073263 ?auto_2073268 ) ) ( not ( = ?auto_2073263 ?auto_2073269 ) ) ( not ( = ?auto_2073264 ?auto_2073265 ) ) ( not ( = ?auto_2073264 ?auto_2073266 ) ) ( not ( = ?auto_2073264 ?auto_2073267 ) ) ( not ( = ?auto_2073264 ?auto_2073268 ) ) ( not ( = ?auto_2073264 ?auto_2073269 ) ) ( not ( = ?auto_2073265 ?auto_2073266 ) ) ( not ( = ?auto_2073265 ?auto_2073267 ) ) ( not ( = ?auto_2073265 ?auto_2073268 ) ) ( not ( = ?auto_2073265 ?auto_2073269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073266 ?auto_2073267 ?auto_2073268 )
      ( MAKE-11CRATE-VERIFY ?auto_2073257 ?auto_2073258 ?auto_2073259 ?auto_2073261 ?auto_2073260 ?auto_2073262 ?auto_2073263 ?auto_2073264 ?auto_2073265 ?auto_2073266 ?auto_2073267 ?auto_2073268 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2073275 - SURFACE
      ?auto_2073276 - SURFACE
      ?auto_2073277 - SURFACE
      ?auto_2073279 - SURFACE
      ?auto_2073278 - SURFACE
      ?auto_2073280 - SURFACE
      ?auto_2073281 - SURFACE
      ?auto_2073282 - SURFACE
      ?auto_2073283 - SURFACE
      ?auto_2073284 - SURFACE
      ?auto_2073285 - SURFACE
      ?auto_2073286 - SURFACE
      ?auto_2073287 - SURFACE
    )
    :vars
    (
      ?auto_2073293 - HOIST
      ?auto_2073290 - PLACE
      ?auto_2073289 - PLACE
      ?auto_2073292 - HOIST
      ?auto_2073288 - SURFACE
      ?auto_2073291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073293 ?auto_2073290 ) ( IS-CRATE ?auto_2073287 ) ( not ( = ?auto_2073286 ?auto_2073287 ) ) ( not ( = ?auto_2073285 ?auto_2073286 ) ) ( not ( = ?auto_2073285 ?auto_2073287 ) ) ( not ( = ?auto_2073289 ?auto_2073290 ) ) ( HOIST-AT ?auto_2073292 ?auto_2073289 ) ( not ( = ?auto_2073293 ?auto_2073292 ) ) ( AVAILABLE ?auto_2073292 ) ( SURFACE-AT ?auto_2073287 ?auto_2073289 ) ( ON ?auto_2073287 ?auto_2073288 ) ( CLEAR ?auto_2073287 ) ( not ( = ?auto_2073286 ?auto_2073288 ) ) ( not ( = ?auto_2073287 ?auto_2073288 ) ) ( not ( = ?auto_2073285 ?auto_2073288 ) ) ( SURFACE-AT ?auto_2073285 ?auto_2073290 ) ( CLEAR ?auto_2073285 ) ( IS-CRATE ?auto_2073286 ) ( AVAILABLE ?auto_2073293 ) ( IN ?auto_2073286 ?auto_2073291 ) ( TRUCK-AT ?auto_2073291 ?auto_2073289 ) ( ON ?auto_2073276 ?auto_2073275 ) ( ON ?auto_2073277 ?auto_2073276 ) ( ON ?auto_2073279 ?auto_2073277 ) ( ON ?auto_2073278 ?auto_2073279 ) ( ON ?auto_2073280 ?auto_2073278 ) ( ON ?auto_2073281 ?auto_2073280 ) ( ON ?auto_2073282 ?auto_2073281 ) ( ON ?auto_2073283 ?auto_2073282 ) ( ON ?auto_2073284 ?auto_2073283 ) ( ON ?auto_2073285 ?auto_2073284 ) ( not ( = ?auto_2073275 ?auto_2073276 ) ) ( not ( = ?auto_2073275 ?auto_2073277 ) ) ( not ( = ?auto_2073275 ?auto_2073279 ) ) ( not ( = ?auto_2073275 ?auto_2073278 ) ) ( not ( = ?auto_2073275 ?auto_2073280 ) ) ( not ( = ?auto_2073275 ?auto_2073281 ) ) ( not ( = ?auto_2073275 ?auto_2073282 ) ) ( not ( = ?auto_2073275 ?auto_2073283 ) ) ( not ( = ?auto_2073275 ?auto_2073284 ) ) ( not ( = ?auto_2073275 ?auto_2073285 ) ) ( not ( = ?auto_2073275 ?auto_2073286 ) ) ( not ( = ?auto_2073275 ?auto_2073287 ) ) ( not ( = ?auto_2073275 ?auto_2073288 ) ) ( not ( = ?auto_2073276 ?auto_2073277 ) ) ( not ( = ?auto_2073276 ?auto_2073279 ) ) ( not ( = ?auto_2073276 ?auto_2073278 ) ) ( not ( = ?auto_2073276 ?auto_2073280 ) ) ( not ( = ?auto_2073276 ?auto_2073281 ) ) ( not ( = ?auto_2073276 ?auto_2073282 ) ) ( not ( = ?auto_2073276 ?auto_2073283 ) ) ( not ( = ?auto_2073276 ?auto_2073284 ) ) ( not ( = ?auto_2073276 ?auto_2073285 ) ) ( not ( = ?auto_2073276 ?auto_2073286 ) ) ( not ( = ?auto_2073276 ?auto_2073287 ) ) ( not ( = ?auto_2073276 ?auto_2073288 ) ) ( not ( = ?auto_2073277 ?auto_2073279 ) ) ( not ( = ?auto_2073277 ?auto_2073278 ) ) ( not ( = ?auto_2073277 ?auto_2073280 ) ) ( not ( = ?auto_2073277 ?auto_2073281 ) ) ( not ( = ?auto_2073277 ?auto_2073282 ) ) ( not ( = ?auto_2073277 ?auto_2073283 ) ) ( not ( = ?auto_2073277 ?auto_2073284 ) ) ( not ( = ?auto_2073277 ?auto_2073285 ) ) ( not ( = ?auto_2073277 ?auto_2073286 ) ) ( not ( = ?auto_2073277 ?auto_2073287 ) ) ( not ( = ?auto_2073277 ?auto_2073288 ) ) ( not ( = ?auto_2073279 ?auto_2073278 ) ) ( not ( = ?auto_2073279 ?auto_2073280 ) ) ( not ( = ?auto_2073279 ?auto_2073281 ) ) ( not ( = ?auto_2073279 ?auto_2073282 ) ) ( not ( = ?auto_2073279 ?auto_2073283 ) ) ( not ( = ?auto_2073279 ?auto_2073284 ) ) ( not ( = ?auto_2073279 ?auto_2073285 ) ) ( not ( = ?auto_2073279 ?auto_2073286 ) ) ( not ( = ?auto_2073279 ?auto_2073287 ) ) ( not ( = ?auto_2073279 ?auto_2073288 ) ) ( not ( = ?auto_2073278 ?auto_2073280 ) ) ( not ( = ?auto_2073278 ?auto_2073281 ) ) ( not ( = ?auto_2073278 ?auto_2073282 ) ) ( not ( = ?auto_2073278 ?auto_2073283 ) ) ( not ( = ?auto_2073278 ?auto_2073284 ) ) ( not ( = ?auto_2073278 ?auto_2073285 ) ) ( not ( = ?auto_2073278 ?auto_2073286 ) ) ( not ( = ?auto_2073278 ?auto_2073287 ) ) ( not ( = ?auto_2073278 ?auto_2073288 ) ) ( not ( = ?auto_2073280 ?auto_2073281 ) ) ( not ( = ?auto_2073280 ?auto_2073282 ) ) ( not ( = ?auto_2073280 ?auto_2073283 ) ) ( not ( = ?auto_2073280 ?auto_2073284 ) ) ( not ( = ?auto_2073280 ?auto_2073285 ) ) ( not ( = ?auto_2073280 ?auto_2073286 ) ) ( not ( = ?auto_2073280 ?auto_2073287 ) ) ( not ( = ?auto_2073280 ?auto_2073288 ) ) ( not ( = ?auto_2073281 ?auto_2073282 ) ) ( not ( = ?auto_2073281 ?auto_2073283 ) ) ( not ( = ?auto_2073281 ?auto_2073284 ) ) ( not ( = ?auto_2073281 ?auto_2073285 ) ) ( not ( = ?auto_2073281 ?auto_2073286 ) ) ( not ( = ?auto_2073281 ?auto_2073287 ) ) ( not ( = ?auto_2073281 ?auto_2073288 ) ) ( not ( = ?auto_2073282 ?auto_2073283 ) ) ( not ( = ?auto_2073282 ?auto_2073284 ) ) ( not ( = ?auto_2073282 ?auto_2073285 ) ) ( not ( = ?auto_2073282 ?auto_2073286 ) ) ( not ( = ?auto_2073282 ?auto_2073287 ) ) ( not ( = ?auto_2073282 ?auto_2073288 ) ) ( not ( = ?auto_2073283 ?auto_2073284 ) ) ( not ( = ?auto_2073283 ?auto_2073285 ) ) ( not ( = ?auto_2073283 ?auto_2073286 ) ) ( not ( = ?auto_2073283 ?auto_2073287 ) ) ( not ( = ?auto_2073283 ?auto_2073288 ) ) ( not ( = ?auto_2073284 ?auto_2073285 ) ) ( not ( = ?auto_2073284 ?auto_2073286 ) ) ( not ( = ?auto_2073284 ?auto_2073287 ) ) ( not ( = ?auto_2073284 ?auto_2073288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073285 ?auto_2073286 ?auto_2073287 )
      ( MAKE-12CRATE-VERIFY ?auto_2073275 ?auto_2073276 ?auto_2073277 ?auto_2073279 ?auto_2073278 ?auto_2073280 ?auto_2073281 ?auto_2073282 ?auto_2073283 ?auto_2073284 ?auto_2073285 ?auto_2073286 ?auto_2073287 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073294 - SURFACE
      ?auto_2073295 - SURFACE
      ?auto_2073296 - SURFACE
      ?auto_2073298 - SURFACE
      ?auto_2073297 - SURFACE
      ?auto_2073299 - SURFACE
      ?auto_2073300 - SURFACE
      ?auto_2073301 - SURFACE
      ?auto_2073302 - SURFACE
      ?auto_2073303 - SURFACE
      ?auto_2073304 - SURFACE
      ?auto_2073305 - SURFACE
      ?auto_2073306 - SURFACE
      ?auto_2073307 - SURFACE
    )
    :vars
    (
      ?auto_2073313 - HOIST
      ?auto_2073310 - PLACE
      ?auto_2073309 - PLACE
      ?auto_2073312 - HOIST
      ?auto_2073308 - SURFACE
      ?auto_2073311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073313 ?auto_2073310 ) ( IS-CRATE ?auto_2073307 ) ( not ( = ?auto_2073306 ?auto_2073307 ) ) ( not ( = ?auto_2073305 ?auto_2073306 ) ) ( not ( = ?auto_2073305 ?auto_2073307 ) ) ( not ( = ?auto_2073309 ?auto_2073310 ) ) ( HOIST-AT ?auto_2073312 ?auto_2073309 ) ( not ( = ?auto_2073313 ?auto_2073312 ) ) ( AVAILABLE ?auto_2073312 ) ( SURFACE-AT ?auto_2073307 ?auto_2073309 ) ( ON ?auto_2073307 ?auto_2073308 ) ( CLEAR ?auto_2073307 ) ( not ( = ?auto_2073306 ?auto_2073308 ) ) ( not ( = ?auto_2073307 ?auto_2073308 ) ) ( not ( = ?auto_2073305 ?auto_2073308 ) ) ( SURFACE-AT ?auto_2073305 ?auto_2073310 ) ( CLEAR ?auto_2073305 ) ( IS-CRATE ?auto_2073306 ) ( AVAILABLE ?auto_2073313 ) ( IN ?auto_2073306 ?auto_2073311 ) ( TRUCK-AT ?auto_2073311 ?auto_2073309 ) ( ON ?auto_2073295 ?auto_2073294 ) ( ON ?auto_2073296 ?auto_2073295 ) ( ON ?auto_2073298 ?auto_2073296 ) ( ON ?auto_2073297 ?auto_2073298 ) ( ON ?auto_2073299 ?auto_2073297 ) ( ON ?auto_2073300 ?auto_2073299 ) ( ON ?auto_2073301 ?auto_2073300 ) ( ON ?auto_2073302 ?auto_2073301 ) ( ON ?auto_2073303 ?auto_2073302 ) ( ON ?auto_2073304 ?auto_2073303 ) ( ON ?auto_2073305 ?auto_2073304 ) ( not ( = ?auto_2073294 ?auto_2073295 ) ) ( not ( = ?auto_2073294 ?auto_2073296 ) ) ( not ( = ?auto_2073294 ?auto_2073298 ) ) ( not ( = ?auto_2073294 ?auto_2073297 ) ) ( not ( = ?auto_2073294 ?auto_2073299 ) ) ( not ( = ?auto_2073294 ?auto_2073300 ) ) ( not ( = ?auto_2073294 ?auto_2073301 ) ) ( not ( = ?auto_2073294 ?auto_2073302 ) ) ( not ( = ?auto_2073294 ?auto_2073303 ) ) ( not ( = ?auto_2073294 ?auto_2073304 ) ) ( not ( = ?auto_2073294 ?auto_2073305 ) ) ( not ( = ?auto_2073294 ?auto_2073306 ) ) ( not ( = ?auto_2073294 ?auto_2073307 ) ) ( not ( = ?auto_2073294 ?auto_2073308 ) ) ( not ( = ?auto_2073295 ?auto_2073296 ) ) ( not ( = ?auto_2073295 ?auto_2073298 ) ) ( not ( = ?auto_2073295 ?auto_2073297 ) ) ( not ( = ?auto_2073295 ?auto_2073299 ) ) ( not ( = ?auto_2073295 ?auto_2073300 ) ) ( not ( = ?auto_2073295 ?auto_2073301 ) ) ( not ( = ?auto_2073295 ?auto_2073302 ) ) ( not ( = ?auto_2073295 ?auto_2073303 ) ) ( not ( = ?auto_2073295 ?auto_2073304 ) ) ( not ( = ?auto_2073295 ?auto_2073305 ) ) ( not ( = ?auto_2073295 ?auto_2073306 ) ) ( not ( = ?auto_2073295 ?auto_2073307 ) ) ( not ( = ?auto_2073295 ?auto_2073308 ) ) ( not ( = ?auto_2073296 ?auto_2073298 ) ) ( not ( = ?auto_2073296 ?auto_2073297 ) ) ( not ( = ?auto_2073296 ?auto_2073299 ) ) ( not ( = ?auto_2073296 ?auto_2073300 ) ) ( not ( = ?auto_2073296 ?auto_2073301 ) ) ( not ( = ?auto_2073296 ?auto_2073302 ) ) ( not ( = ?auto_2073296 ?auto_2073303 ) ) ( not ( = ?auto_2073296 ?auto_2073304 ) ) ( not ( = ?auto_2073296 ?auto_2073305 ) ) ( not ( = ?auto_2073296 ?auto_2073306 ) ) ( not ( = ?auto_2073296 ?auto_2073307 ) ) ( not ( = ?auto_2073296 ?auto_2073308 ) ) ( not ( = ?auto_2073298 ?auto_2073297 ) ) ( not ( = ?auto_2073298 ?auto_2073299 ) ) ( not ( = ?auto_2073298 ?auto_2073300 ) ) ( not ( = ?auto_2073298 ?auto_2073301 ) ) ( not ( = ?auto_2073298 ?auto_2073302 ) ) ( not ( = ?auto_2073298 ?auto_2073303 ) ) ( not ( = ?auto_2073298 ?auto_2073304 ) ) ( not ( = ?auto_2073298 ?auto_2073305 ) ) ( not ( = ?auto_2073298 ?auto_2073306 ) ) ( not ( = ?auto_2073298 ?auto_2073307 ) ) ( not ( = ?auto_2073298 ?auto_2073308 ) ) ( not ( = ?auto_2073297 ?auto_2073299 ) ) ( not ( = ?auto_2073297 ?auto_2073300 ) ) ( not ( = ?auto_2073297 ?auto_2073301 ) ) ( not ( = ?auto_2073297 ?auto_2073302 ) ) ( not ( = ?auto_2073297 ?auto_2073303 ) ) ( not ( = ?auto_2073297 ?auto_2073304 ) ) ( not ( = ?auto_2073297 ?auto_2073305 ) ) ( not ( = ?auto_2073297 ?auto_2073306 ) ) ( not ( = ?auto_2073297 ?auto_2073307 ) ) ( not ( = ?auto_2073297 ?auto_2073308 ) ) ( not ( = ?auto_2073299 ?auto_2073300 ) ) ( not ( = ?auto_2073299 ?auto_2073301 ) ) ( not ( = ?auto_2073299 ?auto_2073302 ) ) ( not ( = ?auto_2073299 ?auto_2073303 ) ) ( not ( = ?auto_2073299 ?auto_2073304 ) ) ( not ( = ?auto_2073299 ?auto_2073305 ) ) ( not ( = ?auto_2073299 ?auto_2073306 ) ) ( not ( = ?auto_2073299 ?auto_2073307 ) ) ( not ( = ?auto_2073299 ?auto_2073308 ) ) ( not ( = ?auto_2073300 ?auto_2073301 ) ) ( not ( = ?auto_2073300 ?auto_2073302 ) ) ( not ( = ?auto_2073300 ?auto_2073303 ) ) ( not ( = ?auto_2073300 ?auto_2073304 ) ) ( not ( = ?auto_2073300 ?auto_2073305 ) ) ( not ( = ?auto_2073300 ?auto_2073306 ) ) ( not ( = ?auto_2073300 ?auto_2073307 ) ) ( not ( = ?auto_2073300 ?auto_2073308 ) ) ( not ( = ?auto_2073301 ?auto_2073302 ) ) ( not ( = ?auto_2073301 ?auto_2073303 ) ) ( not ( = ?auto_2073301 ?auto_2073304 ) ) ( not ( = ?auto_2073301 ?auto_2073305 ) ) ( not ( = ?auto_2073301 ?auto_2073306 ) ) ( not ( = ?auto_2073301 ?auto_2073307 ) ) ( not ( = ?auto_2073301 ?auto_2073308 ) ) ( not ( = ?auto_2073302 ?auto_2073303 ) ) ( not ( = ?auto_2073302 ?auto_2073304 ) ) ( not ( = ?auto_2073302 ?auto_2073305 ) ) ( not ( = ?auto_2073302 ?auto_2073306 ) ) ( not ( = ?auto_2073302 ?auto_2073307 ) ) ( not ( = ?auto_2073302 ?auto_2073308 ) ) ( not ( = ?auto_2073303 ?auto_2073304 ) ) ( not ( = ?auto_2073303 ?auto_2073305 ) ) ( not ( = ?auto_2073303 ?auto_2073306 ) ) ( not ( = ?auto_2073303 ?auto_2073307 ) ) ( not ( = ?auto_2073303 ?auto_2073308 ) ) ( not ( = ?auto_2073304 ?auto_2073305 ) ) ( not ( = ?auto_2073304 ?auto_2073306 ) ) ( not ( = ?auto_2073304 ?auto_2073307 ) ) ( not ( = ?auto_2073304 ?auto_2073308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073305 ?auto_2073306 ?auto_2073307 )
      ( MAKE-13CRATE-VERIFY ?auto_2073294 ?auto_2073295 ?auto_2073296 ?auto_2073298 ?auto_2073297 ?auto_2073299 ?auto_2073300 ?auto_2073301 ?auto_2073302 ?auto_2073303 ?auto_2073304 ?auto_2073305 ?auto_2073306 ?auto_2073307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2073314 - SURFACE
      ?auto_2073315 - SURFACE
    )
    :vars
    (
      ?auto_2073321 - HOIST
      ?auto_2073318 - PLACE
      ?auto_2073322 - SURFACE
      ?auto_2073317 - PLACE
      ?auto_2073320 - HOIST
      ?auto_2073316 - SURFACE
      ?auto_2073319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073321 ?auto_2073318 ) ( IS-CRATE ?auto_2073315 ) ( not ( = ?auto_2073314 ?auto_2073315 ) ) ( not ( = ?auto_2073322 ?auto_2073314 ) ) ( not ( = ?auto_2073322 ?auto_2073315 ) ) ( not ( = ?auto_2073317 ?auto_2073318 ) ) ( HOIST-AT ?auto_2073320 ?auto_2073317 ) ( not ( = ?auto_2073321 ?auto_2073320 ) ) ( SURFACE-AT ?auto_2073315 ?auto_2073317 ) ( ON ?auto_2073315 ?auto_2073316 ) ( CLEAR ?auto_2073315 ) ( not ( = ?auto_2073314 ?auto_2073316 ) ) ( not ( = ?auto_2073315 ?auto_2073316 ) ) ( not ( = ?auto_2073322 ?auto_2073316 ) ) ( SURFACE-AT ?auto_2073322 ?auto_2073318 ) ( CLEAR ?auto_2073322 ) ( IS-CRATE ?auto_2073314 ) ( AVAILABLE ?auto_2073321 ) ( TRUCK-AT ?auto_2073319 ?auto_2073317 ) ( LIFTING ?auto_2073320 ?auto_2073314 ) )
    :subtasks
    ( ( !LOAD ?auto_2073320 ?auto_2073314 ?auto_2073319 ?auto_2073317 )
      ( MAKE-2CRATE ?auto_2073322 ?auto_2073314 ?auto_2073315 )
      ( MAKE-1CRATE-VERIFY ?auto_2073314 ?auto_2073315 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2073323 - SURFACE
      ?auto_2073324 - SURFACE
      ?auto_2073325 - SURFACE
    )
    :vars
    (
      ?auto_2073331 - HOIST
      ?auto_2073329 - PLACE
      ?auto_2073330 - PLACE
      ?auto_2073326 - HOIST
      ?auto_2073328 - SURFACE
      ?auto_2073327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073331 ?auto_2073329 ) ( IS-CRATE ?auto_2073325 ) ( not ( = ?auto_2073324 ?auto_2073325 ) ) ( not ( = ?auto_2073323 ?auto_2073324 ) ) ( not ( = ?auto_2073323 ?auto_2073325 ) ) ( not ( = ?auto_2073330 ?auto_2073329 ) ) ( HOIST-AT ?auto_2073326 ?auto_2073330 ) ( not ( = ?auto_2073331 ?auto_2073326 ) ) ( SURFACE-AT ?auto_2073325 ?auto_2073330 ) ( ON ?auto_2073325 ?auto_2073328 ) ( CLEAR ?auto_2073325 ) ( not ( = ?auto_2073324 ?auto_2073328 ) ) ( not ( = ?auto_2073325 ?auto_2073328 ) ) ( not ( = ?auto_2073323 ?auto_2073328 ) ) ( SURFACE-AT ?auto_2073323 ?auto_2073329 ) ( CLEAR ?auto_2073323 ) ( IS-CRATE ?auto_2073324 ) ( AVAILABLE ?auto_2073331 ) ( TRUCK-AT ?auto_2073327 ?auto_2073330 ) ( LIFTING ?auto_2073326 ?auto_2073324 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073324 ?auto_2073325 )
      ( MAKE-2CRATE-VERIFY ?auto_2073323 ?auto_2073324 ?auto_2073325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2073332 - SURFACE
      ?auto_2073333 - SURFACE
      ?auto_2073334 - SURFACE
      ?auto_2073335 - SURFACE
    )
    :vars
    (
      ?auto_2073336 - HOIST
      ?auto_2073339 - PLACE
      ?auto_2073340 - PLACE
      ?auto_2073338 - HOIST
      ?auto_2073337 - SURFACE
      ?auto_2073341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073336 ?auto_2073339 ) ( IS-CRATE ?auto_2073335 ) ( not ( = ?auto_2073334 ?auto_2073335 ) ) ( not ( = ?auto_2073333 ?auto_2073334 ) ) ( not ( = ?auto_2073333 ?auto_2073335 ) ) ( not ( = ?auto_2073340 ?auto_2073339 ) ) ( HOIST-AT ?auto_2073338 ?auto_2073340 ) ( not ( = ?auto_2073336 ?auto_2073338 ) ) ( SURFACE-AT ?auto_2073335 ?auto_2073340 ) ( ON ?auto_2073335 ?auto_2073337 ) ( CLEAR ?auto_2073335 ) ( not ( = ?auto_2073334 ?auto_2073337 ) ) ( not ( = ?auto_2073335 ?auto_2073337 ) ) ( not ( = ?auto_2073333 ?auto_2073337 ) ) ( SURFACE-AT ?auto_2073333 ?auto_2073339 ) ( CLEAR ?auto_2073333 ) ( IS-CRATE ?auto_2073334 ) ( AVAILABLE ?auto_2073336 ) ( TRUCK-AT ?auto_2073341 ?auto_2073340 ) ( LIFTING ?auto_2073338 ?auto_2073334 ) ( ON ?auto_2073333 ?auto_2073332 ) ( not ( = ?auto_2073332 ?auto_2073333 ) ) ( not ( = ?auto_2073332 ?auto_2073334 ) ) ( not ( = ?auto_2073332 ?auto_2073335 ) ) ( not ( = ?auto_2073332 ?auto_2073337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073333 ?auto_2073334 ?auto_2073335 )
      ( MAKE-3CRATE-VERIFY ?auto_2073332 ?auto_2073333 ?auto_2073334 ?auto_2073335 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2073342 - SURFACE
      ?auto_2073343 - SURFACE
      ?auto_2073344 - SURFACE
      ?auto_2073346 - SURFACE
      ?auto_2073345 - SURFACE
    )
    :vars
    (
      ?auto_2073347 - HOIST
      ?auto_2073350 - PLACE
      ?auto_2073351 - PLACE
      ?auto_2073349 - HOIST
      ?auto_2073348 - SURFACE
      ?auto_2073352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073347 ?auto_2073350 ) ( IS-CRATE ?auto_2073345 ) ( not ( = ?auto_2073346 ?auto_2073345 ) ) ( not ( = ?auto_2073344 ?auto_2073346 ) ) ( not ( = ?auto_2073344 ?auto_2073345 ) ) ( not ( = ?auto_2073351 ?auto_2073350 ) ) ( HOIST-AT ?auto_2073349 ?auto_2073351 ) ( not ( = ?auto_2073347 ?auto_2073349 ) ) ( SURFACE-AT ?auto_2073345 ?auto_2073351 ) ( ON ?auto_2073345 ?auto_2073348 ) ( CLEAR ?auto_2073345 ) ( not ( = ?auto_2073346 ?auto_2073348 ) ) ( not ( = ?auto_2073345 ?auto_2073348 ) ) ( not ( = ?auto_2073344 ?auto_2073348 ) ) ( SURFACE-AT ?auto_2073344 ?auto_2073350 ) ( CLEAR ?auto_2073344 ) ( IS-CRATE ?auto_2073346 ) ( AVAILABLE ?auto_2073347 ) ( TRUCK-AT ?auto_2073352 ?auto_2073351 ) ( LIFTING ?auto_2073349 ?auto_2073346 ) ( ON ?auto_2073343 ?auto_2073342 ) ( ON ?auto_2073344 ?auto_2073343 ) ( not ( = ?auto_2073342 ?auto_2073343 ) ) ( not ( = ?auto_2073342 ?auto_2073344 ) ) ( not ( = ?auto_2073342 ?auto_2073346 ) ) ( not ( = ?auto_2073342 ?auto_2073345 ) ) ( not ( = ?auto_2073342 ?auto_2073348 ) ) ( not ( = ?auto_2073343 ?auto_2073344 ) ) ( not ( = ?auto_2073343 ?auto_2073346 ) ) ( not ( = ?auto_2073343 ?auto_2073345 ) ) ( not ( = ?auto_2073343 ?auto_2073348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073344 ?auto_2073346 ?auto_2073345 )
      ( MAKE-4CRATE-VERIFY ?auto_2073342 ?auto_2073343 ?auto_2073344 ?auto_2073346 ?auto_2073345 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2073353 - SURFACE
      ?auto_2073354 - SURFACE
      ?auto_2073355 - SURFACE
      ?auto_2073357 - SURFACE
      ?auto_2073356 - SURFACE
      ?auto_2073358 - SURFACE
    )
    :vars
    (
      ?auto_2073359 - HOIST
      ?auto_2073362 - PLACE
      ?auto_2073363 - PLACE
      ?auto_2073361 - HOIST
      ?auto_2073360 - SURFACE
      ?auto_2073364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073359 ?auto_2073362 ) ( IS-CRATE ?auto_2073358 ) ( not ( = ?auto_2073356 ?auto_2073358 ) ) ( not ( = ?auto_2073357 ?auto_2073356 ) ) ( not ( = ?auto_2073357 ?auto_2073358 ) ) ( not ( = ?auto_2073363 ?auto_2073362 ) ) ( HOIST-AT ?auto_2073361 ?auto_2073363 ) ( not ( = ?auto_2073359 ?auto_2073361 ) ) ( SURFACE-AT ?auto_2073358 ?auto_2073363 ) ( ON ?auto_2073358 ?auto_2073360 ) ( CLEAR ?auto_2073358 ) ( not ( = ?auto_2073356 ?auto_2073360 ) ) ( not ( = ?auto_2073358 ?auto_2073360 ) ) ( not ( = ?auto_2073357 ?auto_2073360 ) ) ( SURFACE-AT ?auto_2073357 ?auto_2073362 ) ( CLEAR ?auto_2073357 ) ( IS-CRATE ?auto_2073356 ) ( AVAILABLE ?auto_2073359 ) ( TRUCK-AT ?auto_2073364 ?auto_2073363 ) ( LIFTING ?auto_2073361 ?auto_2073356 ) ( ON ?auto_2073354 ?auto_2073353 ) ( ON ?auto_2073355 ?auto_2073354 ) ( ON ?auto_2073357 ?auto_2073355 ) ( not ( = ?auto_2073353 ?auto_2073354 ) ) ( not ( = ?auto_2073353 ?auto_2073355 ) ) ( not ( = ?auto_2073353 ?auto_2073357 ) ) ( not ( = ?auto_2073353 ?auto_2073356 ) ) ( not ( = ?auto_2073353 ?auto_2073358 ) ) ( not ( = ?auto_2073353 ?auto_2073360 ) ) ( not ( = ?auto_2073354 ?auto_2073355 ) ) ( not ( = ?auto_2073354 ?auto_2073357 ) ) ( not ( = ?auto_2073354 ?auto_2073356 ) ) ( not ( = ?auto_2073354 ?auto_2073358 ) ) ( not ( = ?auto_2073354 ?auto_2073360 ) ) ( not ( = ?auto_2073355 ?auto_2073357 ) ) ( not ( = ?auto_2073355 ?auto_2073356 ) ) ( not ( = ?auto_2073355 ?auto_2073358 ) ) ( not ( = ?auto_2073355 ?auto_2073360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073357 ?auto_2073356 ?auto_2073358 )
      ( MAKE-5CRATE-VERIFY ?auto_2073353 ?auto_2073354 ?auto_2073355 ?auto_2073357 ?auto_2073356 ?auto_2073358 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2073365 - SURFACE
      ?auto_2073366 - SURFACE
      ?auto_2073367 - SURFACE
      ?auto_2073369 - SURFACE
      ?auto_2073368 - SURFACE
      ?auto_2073370 - SURFACE
      ?auto_2073371 - SURFACE
    )
    :vars
    (
      ?auto_2073372 - HOIST
      ?auto_2073375 - PLACE
      ?auto_2073376 - PLACE
      ?auto_2073374 - HOIST
      ?auto_2073373 - SURFACE
      ?auto_2073377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073372 ?auto_2073375 ) ( IS-CRATE ?auto_2073371 ) ( not ( = ?auto_2073370 ?auto_2073371 ) ) ( not ( = ?auto_2073368 ?auto_2073370 ) ) ( not ( = ?auto_2073368 ?auto_2073371 ) ) ( not ( = ?auto_2073376 ?auto_2073375 ) ) ( HOIST-AT ?auto_2073374 ?auto_2073376 ) ( not ( = ?auto_2073372 ?auto_2073374 ) ) ( SURFACE-AT ?auto_2073371 ?auto_2073376 ) ( ON ?auto_2073371 ?auto_2073373 ) ( CLEAR ?auto_2073371 ) ( not ( = ?auto_2073370 ?auto_2073373 ) ) ( not ( = ?auto_2073371 ?auto_2073373 ) ) ( not ( = ?auto_2073368 ?auto_2073373 ) ) ( SURFACE-AT ?auto_2073368 ?auto_2073375 ) ( CLEAR ?auto_2073368 ) ( IS-CRATE ?auto_2073370 ) ( AVAILABLE ?auto_2073372 ) ( TRUCK-AT ?auto_2073377 ?auto_2073376 ) ( LIFTING ?auto_2073374 ?auto_2073370 ) ( ON ?auto_2073366 ?auto_2073365 ) ( ON ?auto_2073367 ?auto_2073366 ) ( ON ?auto_2073369 ?auto_2073367 ) ( ON ?auto_2073368 ?auto_2073369 ) ( not ( = ?auto_2073365 ?auto_2073366 ) ) ( not ( = ?auto_2073365 ?auto_2073367 ) ) ( not ( = ?auto_2073365 ?auto_2073369 ) ) ( not ( = ?auto_2073365 ?auto_2073368 ) ) ( not ( = ?auto_2073365 ?auto_2073370 ) ) ( not ( = ?auto_2073365 ?auto_2073371 ) ) ( not ( = ?auto_2073365 ?auto_2073373 ) ) ( not ( = ?auto_2073366 ?auto_2073367 ) ) ( not ( = ?auto_2073366 ?auto_2073369 ) ) ( not ( = ?auto_2073366 ?auto_2073368 ) ) ( not ( = ?auto_2073366 ?auto_2073370 ) ) ( not ( = ?auto_2073366 ?auto_2073371 ) ) ( not ( = ?auto_2073366 ?auto_2073373 ) ) ( not ( = ?auto_2073367 ?auto_2073369 ) ) ( not ( = ?auto_2073367 ?auto_2073368 ) ) ( not ( = ?auto_2073367 ?auto_2073370 ) ) ( not ( = ?auto_2073367 ?auto_2073371 ) ) ( not ( = ?auto_2073367 ?auto_2073373 ) ) ( not ( = ?auto_2073369 ?auto_2073368 ) ) ( not ( = ?auto_2073369 ?auto_2073370 ) ) ( not ( = ?auto_2073369 ?auto_2073371 ) ) ( not ( = ?auto_2073369 ?auto_2073373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073368 ?auto_2073370 ?auto_2073371 )
      ( MAKE-6CRATE-VERIFY ?auto_2073365 ?auto_2073366 ?auto_2073367 ?auto_2073369 ?auto_2073368 ?auto_2073370 ?auto_2073371 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2073378 - SURFACE
      ?auto_2073379 - SURFACE
      ?auto_2073380 - SURFACE
      ?auto_2073382 - SURFACE
      ?auto_2073381 - SURFACE
      ?auto_2073383 - SURFACE
      ?auto_2073384 - SURFACE
      ?auto_2073385 - SURFACE
    )
    :vars
    (
      ?auto_2073386 - HOIST
      ?auto_2073389 - PLACE
      ?auto_2073390 - PLACE
      ?auto_2073388 - HOIST
      ?auto_2073387 - SURFACE
      ?auto_2073391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073386 ?auto_2073389 ) ( IS-CRATE ?auto_2073385 ) ( not ( = ?auto_2073384 ?auto_2073385 ) ) ( not ( = ?auto_2073383 ?auto_2073384 ) ) ( not ( = ?auto_2073383 ?auto_2073385 ) ) ( not ( = ?auto_2073390 ?auto_2073389 ) ) ( HOIST-AT ?auto_2073388 ?auto_2073390 ) ( not ( = ?auto_2073386 ?auto_2073388 ) ) ( SURFACE-AT ?auto_2073385 ?auto_2073390 ) ( ON ?auto_2073385 ?auto_2073387 ) ( CLEAR ?auto_2073385 ) ( not ( = ?auto_2073384 ?auto_2073387 ) ) ( not ( = ?auto_2073385 ?auto_2073387 ) ) ( not ( = ?auto_2073383 ?auto_2073387 ) ) ( SURFACE-AT ?auto_2073383 ?auto_2073389 ) ( CLEAR ?auto_2073383 ) ( IS-CRATE ?auto_2073384 ) ( AVAILABLE ?auto_2073386 ) ( TRUCK-AT ?auto_2073391 ?auto_2073390 ) ( LIFTING ?auto_2073388 ?auto_2073384 ) ( ON ?auto_2073379 ?auto_2073378 ) ( ON ?auto_2073380 ?auto_2073379 ) ( ON ?auto_2073382 ?auto_2073380 ) ( ON ?auto_2073381 ?auto_2073382 ) ( ON ?auto_2073383 ?auto_2073381 ) ( not ( = ?auto_2073378 ?auto_2073379 ) ) ( not ( = ?auto_2073378 ?auto_2073380 ) ) ( not ( = ?auto_2073378 ?auto_2073382 ) ) ( not ( = ?auto_2073378 ?auto_2073381 ) ) ( not ( = ?auto_2073378 ?auto_2073383 ) ) ( not ( = ?auto_2073378 ?auto_2073384 ) ) ( not ( = ?auto_2073378 ?auto_2073385 ) ) ( not ( = ?auto_2073378 ?auto_2073387 ) ) ( not ( = ?auto_2073379 ?auto_2073380 ) ) ( not ( = ?auto_2073379 ?auto_2073382 ) ) ( not ( = ?auto_2073379 ?auto_2073381 ) ) ( not ( = ?auto_2073379 ?auto_2073383 ) ) ( not ( = ?auto_2073379 ?auto_2073384 ) ) ( not ( = ?auto_2073379 ?auto_2073385 ) ) ( not ( = ?auto_2073379 ?auto_2073387 ) ) ( not ( = ?auto_2073380 ?auto_2073382 ) ) ( not ( = ?auto_2073380 ?auto_2073381 ) ) ( not ( = ?auto_2073380 ?auto_2073383 ) ) ( not ( = ?auto_2073380 ?auto_2073384 ) ) ( not ( = ?auto_2073380 ?auto_2073385 ) ) ( not ( = ?auto_2073380 ?auto_2073387 ) ) ( not ( = ?auto_2073382 ?auto_2073381 ) ) ( not ( = ?auto_2073382 ?auto_2073383 ) ) ( not ( = ?auto_2073382 ?auto_2073384 ) ) ( not ( = ?auto_2073382 ?auto_2073385 ) ) ( not ( = ?auto_2073382 ?auto_2073387 ) ) ( not ( = ?auto_2073381 ?auto_2073383 ) ) ( not ( = ?auto_2073381 ?auto_2073384 ) ) ( not ( = ?auto_2073381 ?auto_2073385 ) ) ( not ( = ?auto_2073381 ?auto_2073387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073383 ?auto_2073384 ?auto_2073385 )
      ( MAKE-7CRATE-VERIFY ?auto_2073378 ?auto_2073379 ?auto_2073380 ?auto_2073382 ?auto_2073381 ?auto_2073383 ?auto_2073384 ?auto_2073385 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2073392 - SURFACE
      ?auto_2073393 - SURFACE
      ?auto_2073394 - SURFACE
      ?auto_2073396 - SURFACE
      ?auto_2073395 - SURFACE
      ?auto_2073397 - SURFACE
      ?auto_2073398 - SURFACE
      ?auto_2073399 - SURFACE
      ?auto_2073400 - SURFACE
    )
    :vars
    (
      ?auto_2073401 - HOIST
      ?auto_2073404 - PLACE
      ?auto_2073405 - PLACE
      ?auto_2073403 - HOIST
      ?auto_2073402 - SURFACE
      ?auto_2073406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073401 ?auto_2073404 ) ( IS-CRATE ?auto_2073400 ) ( not ( = ?auto_2073399 ?auto_2073400 ) ) ( not ( = ?auto_2073398 ?auto_2073399 ) ) ( not ( = ?auto_2073398 ?auto_2073400 ) ) ( not ( = ?auto_2073405 ?auto_2073404 ) ) ( HOIST-AT ?auto_2073403 ?auto_2073405 ) ( not ( = ?auto_2073401 ?auto_2073403 ) ) ( SURFACE-AT ?auto_2073400 ?auto_2073405 ) ( ON ?auto_2073400 ?auto_2073402 ) ( CLEAR ?auto_2073400 ) ( not ( = ?auto_2073399 ?auto_2073402 ) ) ( not ( = ?auto_2073400 ?auto_2073402 ) ) ( not ( = ?auto_2073398 ?auto_2073402 ) ) ( SURFACE-AT ?auto_2073398 ?auto_2073404 ) ( CLEAR ?auto_2073398 ) ( IS-CRATE ?auto_2073399 ) ( AVAILABLE ?auto_2073401 ) ( TRUCK-AT ?auto_2073406 ?auto_2073405 ) ( LIFTING ?auto_2073403 ?auto_2073399 ) ( ON ?auto_2073393 ?auto_2073392 ) ( ON ?auto_2073394 ?auto_2073393 ) ( ON ?auto_2073396 ?auto_2073394 ) ( ON ?auto_2073395 ?auto_2073396 ) ( ON ?auto_2073397 ?auto_2073395 ) ( ON ?auto_2073398 ?auto_2073397 ) ( not ( = ?auto_2073392 ?auto_2073393 ) ) ( not ( = ?auto_2073392 ?auto_2073394 ) ) ( not ( = ?auto_2073392 ?auto_2073396 ) ) ( not ( = ?auto_2073392 ?auto_2073395 ) ) ( not ( = ?auto_2073392 ?auto_2073397 ) ) ( not ( = ?auto_2073392 ?auto_2073398 ) ) ( not ( = ?auto_2073392 ?auto_2073399 ) ) ( not ( = ?auto_2073392 ?auto_2073400 ) ) ( not ( = ?auto_2073392 ?auto_2073402 ) ) ( not ( = ?auto_2073393 ?auto_2073394 ) ) ( not ( = ?auto_2073393 ?auto_2073396 ) ) ( not ( = ?auto_2073393 ?auto_2073395 ) ) ( not ( = ?auto_2073393 ?auto_2073397 ) ) ( not ( = ?auto_2073393 ?auto_2073398 ) ) ( not ( = ?auto_2073393 ?auto_2073399 ) ) ( not ( = ?auto_2073393 ?auto_2073400 ) ) ( not ( = ?auto_2073393 ?auto_2073402 ) ) ( not ( = ?auto_2073394 ?auto_2073396 ) ) ( not ( = ?auto_2073394 ?auto_2073395 ) ) ( not ( = ?auto_2073394 ?auto_2073397 ) ) ( not ( = ?auto_2073394 ?auto_2073398 ) ) ( not ( = ?auto_2073394 ?auto_2073399 ) ) ( not ( = ?auto_2073394 ?auto_2073400 ) ) ( not ( = ?auto_2073394 ?auto_2073402 ) ) ( not ( = ?auto_2073396 ?auto_2073395 ) ) ( not ( = ?auto_2073396 ?auto_2073397 ) ) ( not ( = ?auto_2073396 ?auto_2073398 ) ) ( not ( = ?auto_2073396 ?auto_2073399 ) ) ( not ( = ?auto_2073396 ?auto_2073400 ) ) ( not ( = ?auto_2073396 ?auto_2073402 ) ) ( not ( = ?auto_2073395 ?auto_2073397 ) ) ( not ( = ?auto_2073395 ?auto_2073398 ) ) ( not ( = ?auto_2073395 ?auto_2073399 ) ) ( not ( = ?auto_2073395 ?auto_2073400 ) ) ( not ( = ?auto_2073395 ?auto_2073402 ) ) ( not ( = ?auto_2073397 ?auto_2073398 ) ) ( not ( = ?auto_2073397 ?auto_2073399 ) ) ( not ( = ?auto_2073397 ?auto_2073400 ) ) ( not ( = ?auto_2073397 ?auto_2073402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073398 ?auto_2073399 ?auto_2073400 )
      ( MAKE-8CRATE-VERIFY ?auto_2073392 ?auto_2073393 ?auto_2073394 ?auto_2073396 ?auto_2073395 ?auto_2073397 ?auto_2073398 ?auto_2073399 ?auto_2073400 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2073407 - SURFACE
      ?auto_2073408 - SURFACE
      ?auto_2073409 - SURFACE
      ?auto_2073411 - SURFACE
      ?auto_2073410 - SURFACE
      ?auto_2073412 - SURFACE
      ?auto_2073413 - SURFACE
      ?auto_2073414 - SURFACE
      ?auto_2073415 - SURFACE
      ?auto_2073416 - SURFACE
    )
    :vars
    (
      ?auto_2073417 - HOIST
      ?auto_2073420 - PLACE
      ?auto_2073421 - PLACE
      ?auto_2073419 - HOIST
      ?auto_2073418 - SURFACE
      ?auto_2073422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073417 ?auto_2073420 ) ( IS-CRATE ?auto_2073416 ) ( not ( = ?auto_2073415 ?auto_2073416 ) ) ( not ( = ?auto_2073414 ?auto_2073415 ) ) ( not ( = ?auto_2073414 ?auto_2073416 ) ) ( not ( = ?auto_2073421 ?auto_2073420 ) ) ( HOIST-AT ?auto_2073419 ?auto_2073421 ) ( not ( = ?auto_2073417 ?auto_2073419 ) ) ( SURFACE-AT ?auto_2073416 ?auto_2073421 ) ( ON ?auto_2073416 ?auto_2073418 ) ( CLEAR ?auto_2073416 ) ( not ( = ?auto_2073415 ?auto_2073418 ) ) ( not ( = ?auto_2073416 ?auto_2073418 ) ) ( not ( = ?auto_2073414 ?auto_2073418 ) ) ( SURFACE-AT ?auto_2073414 ?auto_2073420 ) ( CLEAR ?auto_2073414 ) ( IS-CRATE ?auto_2073415 ) ( AVAILABLE ?auto_2073417 ) ( TRUCK-AT ?auto_2073422 ?auto_2073421 ) ( LIFTING ?auto_2073419 ?auto_2073415 ) ( ON ?auto_2073408 ?auto_2073407 ) ( ON ?auto_2073409 ?auto_2073408 ) ( ON ?auto_2073411 ?auto_2073409 ) ( ON ?auto_2073410 ?auto_2073411 ) ( ON ?auto_2073412 ?auto_2073410 ) ( ON ?auto_2073413 ?auto_2073412 ) ( ON ?auto_2073414 ?auto_2073413 ) ( not ( = ?auto_2073407 ?auto_2073408 ) ) ( not ( = ?auto_2073407 ?auto_2073409 ) ) ( not ( = ?auto_2073407 ?auto_2073411 ) ) ( not ( = ?auto_2073407 ?auto_2073410 ) ) ( not ( = ?auto_2073407 ?auto_2073412 ) ) ( not ( = ?auto_2073407 ?auto_2073413 ) ) ( not ( = ?auto_2073407 ?auto_2073414 ) ) ( not ( = ?auto_2073407 ?auto_2073415 ) ) ( not ( = ?auto_2073407 ?auto_2073416 ) ) ( not ( = ?auto_2073407 ?auto_2073418 ) ) ( not ( = ?auto_2073408 ?auto_2073409 ) ) ( not ( = ?auto_2073408 ?auto_2073411 ) ) ( not ( = ?auto_2073408 ?auto_2073410 ) ) ( not ( = ?auto_2073408 ?auto_2073412 ) ) ( not ( = ?auto_2073408 ?auto_2073413 ) ) ( not ( = ?auto_2073408 ?auto_2073414 ) ) ( not ( = ?auto_2073408 ?auto_2073415 ) ) ( not ( = ?auto_2073408 ?auto_2073416 ) ) ( not ( = ?auto_2073408 ?auto_2073418 ) ) ( not ( = ?auto_2073409 ?auto_2073411 ) ) ( not ( = ?auto_2073409 ?auto_2073410 ) ) ( not ( = ?auto_2073409 ?auto_2073412 ) ) ( not ( = ?auto_2073409 ?auto_2073413 ) ) ( not ( = ?auto_2073409 ?auto_2073414 ) ) ( not ( = ?auto_2073409 ?auto_2073415 ) ) ( not ( = ?auto_2073409 ?auto_2073416 ) ) ( not ( = ?auto_2073409 ?auto_2073418 ) ) ( not ( = ?auto_2073411 ?auto_2073410 ) ) ( not ( = ?auto_2073411 ?auto_2073412 ) ) ( not ( = ?auto_2073411 ?auto_2073413 ) ) ( not ( = ?auto_2073411 ?auto_2073414 ) ) ( not ( = ?auto_2073411 ?auto_2073415 ) ) ( not ( = ?auto_2073411 ?auto_2073416 ) ) ( not ( = ?auto_2073411 ?auto_2073418 ) ) ( not ( = ?auto_2073410 ?auto_2073412 ) ) ( not ( = ?auto_2073410 ?auto_2073413 ) ) ( not ( = ?auto_2073410 ?auto_2073414 ) ) ( not ( = ?auto_2073410 ?auto_2073415 ) ) ( not ( = ?auto_2073410 ?auto_2073416 ) ) ( not ( = ?auto_2073410 ?auto_2073418 ) ) ( not ( = ?auto_2073412 ?auto_2073413 ) ) ( not ( = ?auto_2073412 ?auto_2073414 ) ) ( not ( = ?auto_2073412 ?auto_2073415 ) ) ( not ( = ?auto_2073412 ?auto_2073416 ) ) ( not ( = ?auto_2073412 ?auto_2073418 ) ) ( not ( = ?auto_2073413 ?auto_2073414 ) ) ( not ( = ?auto_2073413 ?auto_2073415 ) ) ( not ( = ?auto_2073413 ?auto_2073416 ) ) ( not ( = ?auto_2073413 ?auto_2073418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073414 ?auto_2073415 ?auto_2073416 )
      ( MAKE-9CRATE-VERIFY ?auto_2073407 ?auto_2073408 ?auto_2073409 ?auto_2073411 ?auto_2073410 ?auto_2073412 ?auto_2073413 ?auto_2073414 ?auto_2073415 ?auto_2073416 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2073423 - SURFACE
      ?auto_2073424 - SURFACE
      ?auto_2073425 - SURFACE
      ?auto_2073427 - SURFACE
      ?auto_2073426 - SURFACE
      ?auto_2073428 - SURFACE
      ?auto_2073429 - SURFACE
      ?auto_2073430 - SURFACE
      ?auto_2073431 - SURFACE
      ?auto_2073432 - SURFACE
      ?auto_2073433 - SURFACE
    )
    :vars
    (
      ?auto_2073434 - HOIST
      ?auto_2073437 - PLACE
      ?auto_2073438 - PLACE
      ?auto_2073436 - HOIST
      ?auto_2073435 - SURFACE
      ?auto_2073439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073434 ?auto_2073437 ) ( IS-CRATE ?auto_2073433 ) ( not ( = ?auto_2073432 ?auto_2073433 ) ) ( not ( = ?auto_2073431 ?auto_2073432 ) ) ( not ( = ?auto_2073431 ?auto_2073433 ) ) ( not ( = ?auto_2073438 ?auto_2073437 ) ) ( HOIST-AT ?auto_2073436 ?auto_2073438 ) ( not ( = ?auto_2073434 ?auto_2073436 ) ) ( SURFACE-AT ?auto_2073433 ?auto_2073438 ) ( ON ?auto_2073433 ?auto_2073435 ) ( CLEAR ?auto_2073433 ) ( not ( = ?auto_2073432 ?auto_2073435 ) ) ( not ( = ?auto_2073433 ?auto_2073435 ) ) ( not ( = ?auto_2073431 ?auto_2073435 ) ) ( SURFACE-AT ?auto_2073431 ?auto_2073437 ) ( CLEAR ?auto_2073431 ) ( IS-CRATE ?auto_2073432 ) ( AVAILABLE ?auto_2073434 ) ( TRUCK-AT ?auto_2073439 ?auto_2073438 ) ( LIFTING ?auto_2073436 ?auto_2073432 ) ( ON ?auto_2073424 ?auto_2073423 ) ( ON ?auto_2073425 ?auto_2073424 ) ( ON ?auto_2073427 ?auto_2073425 ) ( ON ?auto_2073426 ?auto_2073427 ) ( ON ?auto_2073428 ?auto_2073426 ) ( ON ?auto_2073429 ?auto_2073428 ) ( ON ?auto_2073430 ?auto_2073429 ) ( ON ?auto_2073431 ?auto_2073430 ) ( not ( = ?auto_2073423 ?auto_2073424 ) ) ( not ( = ?auto_2073423 ?auto_2073425 ) ) ( not ( = ?auto_2073423 ?auto_2073427 ) ) ( not ( = ?auto_2073423 ?auto_2073426 ) ) ( not ( = ?auto_2073423 ?auto_2073428 ) ) ( not ( = ?auto_2073423 ?auto_2073429 ) ) ( not ( = ?auto_2073423 ?auto_2073430 ) ) ( not ( = ?auto_2073423 ?auto_2073431 ) ) ( not ( = ?auto_2073423 ?auto_2073432 ) ) ( not ( = ?auto_2073423 ?auto_2073433 ) ) ( not ( = ?auto_2073423 ?auto_2073435 ) ) ( not ( = ?auto_2073424 ?auto_2073425 ) ) ( not ( = ?auto_2073424 ?auto_2073427 ) ) ( not ( = ?auto_2073424 ?auto_2073426 ) ) ( not ( = ?auto_2073424 ?auto_2073428 ) ) ( not ( = ?auto_2073424 ?auto_2073429 ) ) ( not ( = ?auto_2073424 ?auto_2073430 ) ) ( not ( = ?auto_2073424 ?auto_2073431 ) ) ( not ( = ?auto_2073424 ?auto_2073432 ) ) ( not ( = ?auto_2073424 ?auto_2073433 ) ) ( not ( = ?auto_2073424 ?auto_2073435 ) ) ( not ( = ?auto_2073425 ?auto_2073427 ) ) ( not ( = ?auto_2073425 ?auto_2073426 ) ) ( not ( = ?auto_2073425 ?auto_2073428 ) ) ( not ( = ?auto_2073425 ?auto_2073429 ) ) ( not ( = ?auto_2073425 ?auto_2073430 ) ) ( not ( = ?auto_2073425 ?auto_2073431 ) ) ( not ( = ?auto_2073425 ?auto_2073432 ) ) ( not ( = ?auto_2073425 ?auto_2073433 ) ) ( not ( = ?auto_2073425 ?auto_2073435 ) ) ( not ( = ?auto_2073427 ?auto_2073426 ) ) ( not ( = ?auto_2073427 ?auto_2073428 ) ) ( not ( = ?auto_2073427 ?auto_2073429 ) ) ( not ( = ?auto_2073427 ?auto_2073430 ) ) ( not ( = ?auto_2073427 ?auto_2073431 ) ) ( not ( = ?auto_2073427 ?auto_2073432 ) ) ( not ( = ?auto_2073427 ?auto_2073433 ) ) ( not ( = ?auto_2073427 ?auto_2073435 ) ) ( not ( = ?auto_2073426 ?auto_2073428 ) ) ( not ( = ?auto_2073426 ?auto_2073429 ) ) ( not ( = ?auto_2073426 ?auto_2073430 ) ) ( not ( = ?auto_2073426 ?auto_2073431 ) ) ( not ( = ?auto_2073426 ?auto_2073432 ) ) ( not ( = ?auto_2073426 ?auto_2073433 ) ) ( not ( = ?auto_2073426 ?auto_2073435 ) ) ( not ( = ?auto_2073428 ?auto_2073429 ) ) ( not ( = ?auto_2073428 ?auto_2073430 ) ) ( not ( = ?auto_2073428 ?auto_2073431 ) ) ( not ( = ?auto_2073428 ?auto_2073432 ) ) ( not ( = ?auto_2073428 ?auto_2073433 ) ) ( not ( = ?auto_2073428 ?auto_2073435 ) ) ( not ( = ?auto_2073429 ?auto_2073430 ) ) ( not ( = ?auto_2073429 ?auto_2073431 ) ) ( not ( = ?auto_2073429 ?auto_2073432 ) ) ( not ( = ?auto_2073429 ?auto_2073433 ) ) ( not ( = ?auto_2073429 ?auto_2073435 ) ) ( not ( = ?auto_2073430 ?auto_2073431 ) ) ( not ( = ?auto_2073430 ?auto_2073432 ) ) ( not ( = ?auto_2073430 ?auto_2073433 ) ) ( not ( = ?auto_2073430 ?auto_2073435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073431 ?auto_2073432 ?auto_2073433 )
      ( MAKE-10CRATE-VERIFY ?auto_2073423 ?auto_2073424 ?auto_2073425 ?auto_2073427 ?auto_2073426 ?auto_2073428 ?auto_2073429 ?auto_2073430 ?auto_2073431 ?auto_2073432 ?auto_2073433 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2073440 - SURFACE
      ?auto_2073441 - SURFACE
      ?auto_2073442 - SURFACE
      ?auto_2073444 - SURFACE
      ?auto_2073443 - SURFACE
      ?auto_2073445 - SURFACE
      ?auto_2073446 - SURFACE
      ?auto_2073447 - SURFACE
      ?auto_2073448 - SURFACE
      ?auto_2073449 - SURFACE
      ?auto_2073450 - SURFACE
      ?auto_2073451 - SURFACE
    )
    :vars
    (
      ?auto_2073452 - HOIST
      ?auto_2073455 - PLACE
      ?auto_2073456 - PLACE
      ?auto_2073454 - HOIST
      ?auto_2073453 - SURFACE
      ?auto_2073457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073452 ?auto_2073455 ) ( IS-CRATE ?auto_2073451 ) ( not ( = ?auto_2073450 ?auto_2073451 ) ) ( not ( = ?auto_2073449 ?auto_2073450 ) ) ( not ( = ?auto_2073449 ?auto_2073451 ) ) ( not ( = ?auto_2073456 ?auto_2073455 ) ) ( HOIST-AT ?auto_2073454 ?auto_2073456 ) ( not ( = ?auto_2073452 ?auto_2073454 ) ) ( SURFACE-AT ?auto_2073451 ?auto_2073456 ) ( ON ?auto_2073451 ?auto_2073453 ) ( CLEAR ?auto_2073451 ) ( not ( = ?auto_2073450 ?auto_2073453 ) ) ( not ( = ?auto_2073451 ?auto_2073453 ) ) ( not ( = ?auto_2073449 ?auto_2073453 ) ) ( SURFACE-AT ?auto_2073449 ?auto_2073455 ) ( CLEAR ?auto_2073449 ) ( IS-CRATE ?auto_2073450 ) ( AVAILABLE ?auto_2073452 ) ( TRUCK-AT ?auto_2073457 ?auto_2073456 ) ( LIFTING ?auto_2073454 ?auto_2073450 ) ( ON ?auto_2073441 ?auto_2073440 ) ( ON ?auto_2073442 ?auto_2073441 ) ( ON ?auto_2073444 ?auto_2073442 ) ( ON ?auto_2073443 ?auto_2073444 ) ( ON ?auto_2073445 ?auto_2073443 ) ( ON ?auto_2073446 ?auto_2073445 ) ( ON ?auto_2073447 ?auto_2073446 ) ( ON ?auto_2073448 ?auto_2073447 ) ( ON ?auto_2073449 ?auto_2073448 ) ( not ( = ?auto_2073440 ?auto_2073441 ) ) ( not ( = ?auto_2073440 ?auto_2073442 ) ) ( not ( = ?auto_2073440 ?auto_2073444 ) ) ( not ( = ?auto_2073440 ?auto_2073443 ) ) ( not ( = ?auto_2073440 ?auto_2073445 ) ) ( not ( = ?auto_2073440 ?auto_2073446 ) ) ( not ( = ?auto_2073440 ?auto_2073447 ) ) ( not ( = ?auto_2073440 ?auto_2073448 ) ) ( not ( = ?auto_2073440 ?auto_2073449 ) ) ( not ( = ?auto_2073440 ?auto_2073450 ) ) ( not ( = ?auto_2073440 ?auto_2073451 ) ) ( not ( = ?auto_2073440 ?auto_2073453 ) ) ( not ( = ?auto_2073441 ?auto_2073442 ) ) ( not ( = ?auto_2073441 ?auto_2073444 ) ) ( not ( = ?auto_2073441 ?auto_2073443 ) ) ( not ( = ?auto_2073441 ?auto_2073445 ) ) ( not ( = ?auto_2073441 ?auto_2073446 ) ) ( not ( = ?auto_2073441 ?auto_2073447 ) ) ( not ( = ?auto_2073441 ?auto_2073448 ) ) ( not ( = ?auto_2073441 ?auto_2073449 ) ) ( not ( = ?auto_2073441 ?auto_2073450 ) ) ( not ( = ?auto_2073441 ?auto_2073451 ) ) ( not ( = ?auto_2073441 ?auto_2073453 ) ) ( not ( = ?auto_2073442 ?auto_2073444 ) ) ( not ( = ?auto_2073442 ?auto_2073443 ) ) ( not ( = ?auto_2073442 ?auto_2073445 ) ) ( not ( = ?auto_2073442 ?auto_2073446 ) ) ( not ( = ?auto_2073442 ?auto_2073447 ) ) ( not ( = ?auto_2073442 ?auto_2073448 ) ) ( not ( = ?auto_2073442 ?auto_2073449 ) ) ( not ( = ?auto_2073442 ?auto_2073450 ) ) ( not ( = ?auto_2073442 ?auto_2073451 ) ) ( not ( = ?auto_2073442 ?auto_2073453 ) ) ( not ( = ?auto_2073444 ?auto_2073443 ) ) ( not ( = ?auto_2073444 ?auto_2073445 ) ) ( not ( = ?auto_2073444 ?auto_2073446 ) ) ( not ( = ?auto_2073444 ?auto_2073447 ) ) ( not ( = ?auto_2073444 ?auto_2073448 ) ) ( not ( = ?auto_2073444 ?auto_2073449 ) ) ( not ( = ?auto_2073444 ?auto_2073450 ) ) ( not ( = ?auto_2073444 ?auto_2073451 ) ) ( not ( = ?auto_2073444 ?auto_2073453 ) ) ( not ( = ?auto_2073443 ?auto_2073445 ) ) ( not ( = ?auto_2073443 ?auto_2073446 ) ) ( not ( = ?auto_2073443 ?auto_2073447 ) ) ( not ( = ?auto_2073443 ?auto_2073448 ) ) ( not ( = ?auto_2073443 ?auto_2073449 ) ) ( not ( = ?auto_2073443 ?auto_2073450 ) ) ( not ( = ?auto_2073443 ?auto_2073451 ) ) ( not ( = ?auto_2073443 ?auto_2073453 ) ) ( not ( = ?auto_2073445 ?auto_2073446 ) ) ( not ( = ?auto_2073445 ?auto_2073447 ) ) ( not ( = ?auto_2073445 ?auto_2073448 ) ) ( not ( = ?auto_2073445 ?auto_2073449 ) ) ( not ( = ?auto_2073445 ?auto_2073450 ) ) ( not ( = ?auto_2073445 ?auto_2073451 ) ) ( not ( = ?auto_2073445 ?auto_2073453 ) ) ( not ( = ?auto_2073446 ?auto_2073447 ) ) ( not ( = ?auto_2073446 ?auto_2073448 ) ) ( not ( = ?auto_2073446 ?auto_2073449 ) ) ( not ( = ?auto_2073446 ?auto_2073450 ) ) ( not ( = ?auto_2073446 ?auto_2073451 ) ) ( not ( = ?auto_2073446 ?auto_2073453 ) ) ( not ( = ?auto_2073447 ?auto_2073448 ) ) ( not ( = ?auto_2073447 ?auto_2073449 ) ) ( not ( = ?auto_2073447 ?auto_2073450 ) ) ( not ( = ?auto_2073447 ?auto_2073451 ) ) ( not ( = ?auto_2073447 ?auto_2073453 ) ) ( not ( = ?auto_2073448 ?auto_2073449 ) ) ( not ( = ?auto_2073448 ?auto_2073450 ) ) ( not ( = ?auto_2073448 ?auto_2073451 ) ) ( not ( = ?auto_2073448 ?auto_2073453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073449 ?auto_2073450 ?auto_2073451 )
      ( MAKE-11CRATE-VERIFY ?auto_2073440 ?auto_2073441 ?auto_2073442 ?auto_2073444 ?auto_2073443 ?auto_2073445 ?auto_2073446 ?auto_2073447 ?auto_2073448 ?auto_2073449 ?auto_2073450 ?auto_2073451 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2073458 - SURFACE
      ?auto_2073459 - SURFACE
      ?auto_2073460 - SURFACE
      ?auto_2073462 - SURFACE
      ?auto_2073461 - SURFACE
      ?auto_2073463 - SURFACE
      ?auto_2073464 - SURFACE
      ?auto_2073465 - SURFACE
      ?auto_2073466 - SURFACE
      ?auto_2073467 - SURFACE
      ?auto_2073468 - SURFACE
      ?auto_2073469 - SURFACE
      ?auto_2073470 - SURFACE
    )
    :vars
    (
      ?auto_2073471 - HOIST
      ?auto_2073474 - PLACE
      ?auto_2073475 - PLACE
      ?auto_2073473 - HOIST
      ?auto_2073472 - SURFACE
      ?auto_2073476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073471 ?auto_2073474 ) ( IS-CRATE ?auto_2073470 ) ( not ( = ?auto_2073469 ?auto_2073470 ) ) ( not ( = ?auto_2073468 ?auto_2073469 ) ) ( not ( = ?auto_2073468 ?auto_2073470 ) ) ( not ( = ?auto_2073475 ?auto_2073474 ) ) ( HOIST-AT ?auto_2073473 ?auto_2073475 ) ( not ( = ?auto_2073471 ?auto_2073473 ) ) ( SURFACE-AT ?auto_2073470 ?auto_2073475 ) ( ON ?auto_2073470 ?auto_2073472 ) ( CLEAR ?auto_2073470 ) ( not ( = ?auto_2073469 ?auto_2073472 ) ) ( not ( = ?auto_2073470 ?auto_2073472 ) ) ( not ( = ?auto_2073468 ?auto_2073472 ) ) ( SURFACE-AT ?auto_2073468 ?auto_2073474 ) ( CLEAR ?auto_2073468 ) ( IS-CRATE ?auto_2073469 ) ( AVAILABLE ?auto_2073471 ) ( TRUCK-AT ?auto_2073476 ?auto_2073475 ) ( LIFTING ?auto_2073473 ?auto_2073469 ) ( ON ?auto_2073459 ?auto_2073458 ) ( ON ?auto_2073460 ?auto_2073459 ) ( ON ?auto_2073462 ?auto_2073460 ) ( ON ?auto_2073461 ?auto_2073462 ) ( ON ?auto_2073463 ?auto_2073461 ) ( ON ?auto_2073464 ?auto_2073463 ) ( ON ?auto_2073465 ?auto_2073464 ) ( ON ?auto_2073466 ?auto_2073465 ) ( ON ?auto_2073467 ?auto_2073466 ) ( ON ?auto_2073468 ?auto_2073467 ) ( not ( = ?auto_2073458 ?auto_2073459 ) ) ( not ( = ?auto_2073458 ?auto_2073460 ) ) ( not ( = ?auto_2073458 ?auto_2073462 ) ) ( not ( = ?auto_2073458 ?auto_2073461 ) ) ( not ( = ?auto_2073458 ?auto_2073463 ) ) ( not ( = ?auto_2073458 ?auto_2073464 ) ) ( not ( = ?auto_2073458 ?auto_2073465 ) ) ( not ( = ?auto_2073458 ?auto_2073466 ) ) ( not ( = ?auto_2073458 ?auto_2073467 ) ) ( not ( = ?auto_2073458 ?auto_2073468 ) ) ( not ( = ?auto_2073458 ?auto_2073469 ) ) ( not ( = ?auto_2073458 ?auto_2073470 ) ) ( not ( = ?auto_2073458 ?auto_2073472 ) ) ( not ( = ?auto_2073459 ?auto_2073460 ) ) ( not ( = ?auto_2073459 ?auto_2073462 ) ) ( not ( = ?auto_2073459 ?auto_2073461 ) ) ( not ( = ?auto_2073459 ?auto_2073463 ) ) ( not ( = ?auto_2073459 ?auto_2073464 ) ) ( not ( = ?auto_2073459 ?auto_2073465 ) ) ( not ( = ?auto_2073459 ?auto_2073466 ) ) ( not ( = ?auto_2073459 ?auto_2073467 ) ) ( not ( = ?auto_2073459 ?auto_2073468 ) ) ( not ( = ?auto_2073459 ?auto_2073469 ) ) ( not ( = ?auto_2073459 ?auto_2073470 ) ) ( not ( = ?auto_2073459 ?auto_2073472 ) ) ( not ( = ?auto_2073460 ?auto_2073462 ) ) ( not ( = ?auto_2073460 ?auto_2073461 ) ) ( not ( = ?auto_2073460 ?auto_2073463 ) ) ( not ( = ?auto_2073460 ?auto_2073464 ) ) ( not ( = ?auto_2073460 ?auto_2073465 ) ) ( not ( = ?auto_2073460 ?auto_2073466 ) ) ( not ( = ?auto_2073460 ?auto_2073467 ) ) ( not ( = ?auto_2073460 ?auto_2073468 ) ) ( not ( = ?auto_2073460 ?auto_2073469 ) ) ( not ( = ?auto_2073460 ?auto_2073470 ) ) ( not ( = ?auto_2073460 ?auto_2073472 ) ) ( not ( = ?auto_2073462 ?auto_2073461 ) ) ( not ( = ?auto_2073462 ?auto_2073463 ) ) ( not ( = ?auto_2073462 ?auto_2073464 ) ) ( not ( = ?auto_2073462 ?auto_2073465 ) ) ( not ( = ?auto_2073462 ?auto_2073466 ) ) ( not ( = ?auto_2073462 ?auto_2073467 ) ) ( not ( = ?auto_2073462 ?auto_2073468 ) ) ( not ( = ?auto_2073462 ?auto_2073469 ) ) ( not ( = ?auto_2073462 ?auto_2073470 ) ) ( not ( = ?auto_2073462 ?auto_2073472 ) ) ( not ( = ?auto_2073461 ?auto_2073463 ) ) ( not ( = ?auto_2073461 ?auto_2073464 ) ) ( not ( = ?auto_2073461 ?auto_2073465 ) ) ( not ( = ?auto_2073461 ?auto_2073466 ) ) ( not ( = ?auto_2073461 ?auto_2073467 ) ) ( not ( = ?auto_2073461 ?auto_2073468 ) ) ( not ( = ?auto_2073461 ?auto_2073469 ) ) ( not ( = ?auto_2073461 ?auto_2073470 ) ) ( not ( = ?auto_2073461 ?auto_2073472 ) ) ( not ( = ?auto_2073463 ?auto_2073464 ) ) ( not ( = ?auto_2073463 ?auto_2073465 ) ) ( not ( = ?auto_2073463 ?auto_2073466 ) ) ( not ( = ?auto_2073463 ?auto_2073467 ) ) ( not ( = ?auto_2073463 ?auto_2073468 ) ) ( not ( = ?auto_2073463 ?auto_2073469 ) ) ( not ( = ?auto_2073463 ?auto_2073470 ) ) ( not ( = ?auto_2073463 ?auto_2073472 ) ) ( not ( = ?auto_2073464 ?auto_2073465 ) ) ( not ( = ?auto_2073464 ?auto_2073466 ) ) ( not ( = ?auto_2073464 ?auto_2073467 ) ) ( not ( = ?auto_2073464 ?auto_2073468 ) ) ( not ( = ?auto_2073464 ?auto_2073469 ) ) ( not ( = ?auto_2073464 ?auto_2073470 ) ) ( not ( = ?auto_2073464 ?auto_2073472 ) ) ( not ( = ?auto_2073465 ?auto_2073466 ) ) ( not ( = ?auto_2073465 ?auto_2073467 ) ) ( not ( = ?auto_2073465 ?auto_2073468 ) ) ( not ( = ?auto_2073465 ?auto_2073469 ) ) ( not ( = ?auto_2073465 ?auto_2073470 ) ) ( not ( = ?auto_2073465 ?auto_2073472 ) ) ( not ( = ?auto_2073466 ?auto_2073467 ) ) ( not ( = ?auto_2073466 ?auto_2073468 ) ) ( not ( = ?auto_2073466 ?auto_2073469 ) ) ( not ( = ?auto_2073466 ?auto_2073470 ) ) ( not ( = ?auto_2073466 ?auto_2073472 ) ) ( not ( = ?auto_2073467 ?auto_2073468 ) ) ( not ( = ?auto_2073467 ?auto_2073469 ) ) ( not ( = ?auto_2073467 ?auto_2073470 ) ) ( not ( = ?auto_2073467 ?auto_2073472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073468 ?auto_2073469 ?auto_2073470 )
      ( MAKE-12CRATE-VERIFY ?auto_2073458 ?auto_2073459 ?auto_2073460 ?auto_2073462 ?auto_2073461 ?auto_2073463 ?auto_2073464 ?auto_2073465 ?auto_2073466 ?auto_2073467 ?auto_2073468 ?auto_2073469 ?auto_2073470 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073477 - SURFACE
      ?auto_2073478 - SURFACE
      ?auto_2073479 - SURFACE
      ?auto_2073481 - SURFACE
      ?auto_2073480 - SURFACE
      ?auto_2073482 - SURFACE
      ?auto_2073483 - SURFACE
      ?auto_2073484 - SURFACE
      ?auto_2073485 - SURFACE
      ?auto_2073486 - SURFACE
      ?auto_2073487 - SURFACE
      ?auto_2073488 - SURFACE
      ?auto_2073489 - SURFACE
      ?auto_2073490 - SURFACE
    )
    :vars
    (
      ?auto_2073491 - HOIST
      ?auto_2073494 - PLACE
      ?auto_2073495 - PLACE
      ?auto_2073493 - HOIST
      ?auto_2073492 - SURFACE
      ?auto_2073496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073491 ?auto_2073494 ) ( IS-CRATE ?auto_2073490 ) ( not ( = ?auto_2073489 ?auto_2073490 ) ) ( not ( = ?auto_2073488 ?auto_2073489 ) ) ( not ( = ?auto_2073488 ?auto_2073490 ) ) ( not ( = ?auto_2073495 ?auto_2073494 ) ) ( HOIST-AT ?auto_2073493 ?auto_2073495 ) ( not ( = ?auto_2073491 ?auto_2073493 ) ) ( SURFACE-AT ?auto_2073490 ?auto_2073495 ) ( ON ?auto_2073490 ?auto_2073492 ) ( CLEAR ?auto_2073490 ) ( not ( = ?auto_2073489 ?auto_2073492 ) ) ( not ( = ?auto_2073490 ?auto_2073492 ) ) ( not ( = ?auto_2073488 ?auto_2073492 ) ) ( SURFACE-AT ?auto_2073488 ?auto_2073494 ) ( CLEAR ?auto_2073488 ) ( IS-CRATE ?auto_2073489 ) ( AVAILABLE ?auto_2073491 ) ( TRUCK-AT ?auto_2073496 ?auto_2073495 ) ( LIFTING ?auto_2073493 ?auto_2073489 ) ( ON ?auto_2073478 ?auto_2073477 ) ( ON ?auto_2073479 ?auto_2073478 ) ( ON ?auto_2073481 ?auto_2073479 ) ( ON ?auto_2073480 ?auto_2073481 ) ( ON ?auto_2073482 ?auto_2073480 ) ( ON ?auto_2073483 ?auto_2073482 ) ( ON ?auto_2073484 ?auto_2073483 ) ( ON ?auto_2073485 ?auto_2073484 ) ( ON ?auto_2073486 ?auto_2073485 ) ( ON ?auto_2073487 ?auto_2073486 ) ( ON ?auto_2073488 ?auto_2073487 ) ( not ( = ?auto_2073477 ?auto_2073478 ) ) ( not ( = ?auto_2073477 ?auto_2073479 ) ) ( not ( = ?auto_2073477 ?auto_2073481 ) ) ( not ( = ?auto_2073477 ?auto_2073480 ) ) ( not ( = ?auto_2073477 ?auto_2073482 ) ) ( not ( = ?auto_2073477 ?auto_2073483 ) ) ( not ( = ?auto_2073477 ?auto_2073484 ) ) ( not ( = ?auto_2073477 ?auto_2073485 ) ) ( not ( = ?auto_2073477 ?auto_2073486 ) ) ( not ( = ?auto_2073477 ?auto_2073487 ) ) ( not ( = ?auto_2073477 ?auto_2073488 ) ) ( not ( = ?auto_2073477 ?auto_2073489 ) ) ( not ( = ?auto_2073477 ?auto_2073490 ) ) ( not ( = ?auto_2073477 ?auto_2073492 ) ) ( not ( = ?auto_2073478 ?auto_2073479 ) ) ( not ( = ?auto_2073478 ?auto_2073481 ) ) ( not ( = ?auto_2073478 ?auto_2073480 ) ) ( not ( = ?auto_2073478 ?auto_2073482 ) ) ( not ( = ?auto_2073478 ?auto_2073483 ) ) ( not ( = ?auto_2073478 ?auto_2073484 ) ) ( not ( = ?auto_2073478 ?auto_2073485 ) ) ( not ( = ?auto_2073478 ?auto_2073486 ) ) ( not ( = ?auto_2073478 ?auto_2073487 ) ) ( not ( = ?auto_2073478 ?auto_2073488 ) ) ( not ( = ?auto_2073478 ?auto_2073489 ) ) ( not ( = ?auto_2073478 ?auto_2073490 ) ) ( not ( = ?auto_2073478 ?auto_2073492 ) ) ( not ( = ?auto_2073479 ?auto_2073481 ) ) ( not ( = ?auto_2073479 ?auto_2073480 ) ) ( not ( = ?auto_2073479 ?auto_2073482 ) ) ( not ( = ?auto_2073479 ?auto_2073483 ) ) ( not ( = ?auto_2073479 ?auto_2073484 ) ) ( not ( = ?auto_2073479 ?auto_2073485 ) ) ( not ( = ?auto_2073479 ?auto_2073486 ) ) ( not ( = ?auto_2073479 ?auto_2073487 ) ) ( not ( = ?auto_2073479 ?auto_2073488 ) ) ( not ( = ?auto_2073479 ?auto_2073489 ) ) ( not ( = ?auto_2073479 ?auto_2073490 ) ) ( not ( = ?auto_2073479 ?auto_2073492 ) ) ( not ( = ?auto_2073481 ?auto_2073480 ) ) ( not ( = ?auto_2073481 ?auto_2073482 ) ) ( not ( = ?auto_2073481 ?auto_2073483 ) ) ( not ( = ?auto_2073481 ?auto_2073484 ) ) ( not ( = ?auto_2073481 ?auto_2073485 ) ) ( not ( = ?auto_2073481 ?auto_2073486 ) ) ( not ( = ?auto_2073481 ?auto_2073487 ) ) ( not ( = ?auto_2073481 ?auto_2073488 ) ) ( not ( = ?auto_2073481 ?auto_2073489 ) ) ( not ( = ?auto_2073481 ?auto_2073490 ) ) ( not ( = ?auto_2073481 ?auto_2073492 ) ) ( not ( = ?auto_2073480 ?auto_2073482 ) ) ( not ( = ?auto_2073480 ?auto_2073483 ) ) ( not ( = ?auto_2073480 ?auto_2073484 ) ) ( not ( = ?auto_2073480 ?auto_2073485 ) ) ( not ( = ?auto_2073480 ?auto_2073486 ) ) ( not ( = ?auto_2073480 ?auto_2073487 ) ) ( not ( = ?auto_2073480 ?auto_2073488 ) ) ( not ( = ?auto_2073480 ?auto_2073489 ) ) ( not ( = ?auto_2073480 ?auto_2073490 ) ) ( not ( = ?auto_2073480 ?auto_2073492 ) ) ( not ( = ?auto_2073482 ?auto_2073483 ) ) ( not ( = ?auto_2073482 ?auto_2073484 ) ) ( not ( = ?auto_2073482 ?auto_2073485 ) ) ( not ( = ?auto_2073482 ?auto_2073486 ) ) ( not ( = ?auto_2073482 ?auto_2073487 ) ) ( not ( = ?auto_2073482 ?auto_2073488 ) ) ( not ( = ?auto_2073482 ?auto_2073489 ) ) ( not ( = ?auto_2073482 ?auto_2073490 ) ) ( not ( = ?auto_2073482 ?auto_2073492 ) ) ( not ( = ?auto_2073483 ?auto_2073484 ) ) ( not ( = ?auto_2073483 ?auto_2073485 ) ) ( not ( = ?auto_2073483 ?auto_2073486 ) ) ( not ( = ?auto_2073483 ?auto_2073487 ) ) ( not ( = ?auto_2073483 ?auto_2073488 ) ) ( not ( = ?auto_2073483 ?auto_2073489 ) ) ( not ( = ?auto_2073483 ?auto_2073490 ) ) ( not ( = ?auto_2073483 ?auto_2073492 ) ) ( not ( = ?auto_2073484 ?auto_2073485 ) ) ( not ( = ?auto_2073484 ?auto_2073486 ) ) ( not ( = ?auto_2073484 ?auto_2073487 ) ) ( not ( = ?auto_2073484 ?auto_2073488 ) ) ( not ( = ?auto_2073484 ?auto_2073489 ) ) ( not ( = ?auto_2073484 ?auto_2073490 ) ) ( not ( = ?auto_2073484 ?auto_2073492 ) ) ( not ( = ?auto_2073485 ?auto_2073486 ) ) ( not ( = ?auto_2073485 ?auto_2073487 ) ) ( not ( = ?auto_2073485 ?auto_2073488 ) ) ( not ( = ?auto_2073485 ?auto_2073489 ) ) ( not ( = ?auto_2073485 ?auto_2073490 ) ) ( not ( = ?auto_2073485 ?auto_2073492 ) ) ( not ( = ?auto_2073486 ?auto_2073487 ) ) ( not ( = ?auto_2073486 ?auto_2073488 ) ) ( not ( = ?auto_2073486 ?auto_2073489 ) ) ( not ( = ?auto_2073486 ?auto_2073490 ) ) ( not ( = ?auto_2073486 ?auto_2073492 ) ) ( not ( = ?auto_2073487 ?auto_2073488 ) ) ( not ( = ?auto_2073487 ?auto_2073489 ) ) ( not ( = ?auto_2073487 ?auto_2073490 ) ) ( not ( = ?auto_2073487 ?auto_2073492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073488 ?auto_2073489 ?auto_2073490 )
      ( MAKE-13CRATE-VERIFY ?auto_2073477 ?auto_2073478 ?auto_2073479 ?auto_2073481 ?auto_2073480 ?auto_2073482 ?auto_2073483 ?auto_2073484 ?auto_2073485 ?auto_2073486 ?auto_2073487 ?auto_2073488 ?auto_2073489 ?auto_2073490 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2073497 - SURFACE
      ?auto_2073498 - SURFACE
    )
    :vars
    (
      ?auto_2073500 - HOIST
      ?auto_2073503 - PLACE
      ?auto_2073499 - SURFACE
      ?auto_2073504 - PLACE
      ?auto_2073502 - HOIST
      ?auto_2073501 - SURFACE
      ?auto_2073505 - TRUCK
      ?auto_2073506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073500 ?auto_2073503 ) ( IS-CRATE ?auto_2073498 ) ( not ( = ?auto_2073497 ?auto_2073498 ) ) ( not ( = ?auto_2073499 ?auto_2073497 ) ) ( not ( = ?auto_2073499 ?auto_2073498 ) ) ( not ( = ?auto_2073504 ?auto_2073503 ) ) ( HOIST-AT ?auto_2073502 ?auto_2073504 ) ( not ( = ?auto_2073500 ?auto_2073502 ) ) ( SURFACE-AT ?auto_2073498 ?auto_2073504 ) ( ON ?auto_2073498 ?auto_2073501 ) ( CLEAR ?auto_2073498 ) ( not ( = ?auto_2073497 ?auto_2073501 ) ) ( not ( = ?auto_2073498 ?auto_2073501 ) ) ( not ( = ?auto_2073499 ?auto_2073501 ) ) ( SURFACE-AT ?auto_2073499 ?auto_2073503 ) ( CLEAR ?auto_2073499 ) ( IS-CRATE ?auto_2073497 ) ( AVAILABLE ?auto_2073500 ) ( TRUCK-AT ?auto_2073505 ?auto_2073504 ) ( AVAILABLE ?auto_2073502 ) ( SURFACE-AT ?auto_2073497 ?auto_2073504 ) ( ON ?auto_2073497 ?auto_2073506 ) ( CLEAR ?auto_2073497 ) ( not ( = ?auto_2073497 ?auto_2073506 ) ) ( not ( = ?auto_2073498 ?auto_2073506 ) ) ( not ( = ?auto_2073499 ?auto_2073506 ) ) ( not ( = ?auto_2073501 ?auto_2073506 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2073502 ?auto_2073497 ?auto_2073506 ?auto_2073504 )
      ( MAKE-2CRATE ?auto_2073499 ?auto_2073497 ?auto_2073498 )
      ( MAKE-1CRATE-VERIFY ?auto_2073497 ?auto_2073498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2073507 - SURFACE
      ?auto_2073508 - SURFACE
      ?auto_2073509 - SURFACE
    )
    :vars
    (
      ?auto_2073515 - HOIST
      ?auto_2073510 - PLACE
      ?auto_2073516 - PLACE
      ?auto_2073514 - HOIST
      ?auto_2073511 - SURFACE
      ?auto_2073513 - TRUCK
      ?auto_2073512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073515 ?auto_2073510 ) ( IS-CRATE ?auto_2073509 ) ( not ( = ?auto_2073508 ?auto_2073509 ) ) ( not ( = ?auto_2073507 ?auto_2073508 ) ) ( not ( = ?auto_2073507 ?auto_2073509 ) ) ( not ( = ?auto_2073516 ?auto_2073510 ) ) ( HOIST-AT ?auto_2073514 ?auto_2073516 ) ( not ( = ?auto_2073515 ?auto_2073514 ) ) ( SURFACE-AT ?auto_2073509 ?auto_2073516 ) ( ON ?auto_2073509 ?auto_2073511 ) ( CLEAR ?auto_2073509 ) ( not ( = ?auto_2073508 ?auto_2073511 ) ) ( not ( = ?auto_2073509 ?auto_2073511 ) ) ( not ( = ?auto_2073507 ?auto_2073511 ) ) ( SURFACE-AT ?auto_2073507 ?auto_2073510 ) ( CLEAR ?auto_2073507 ) ( IS-CRATE ?auto_2073508 ) ( AVAILABLE ?auto_2073515 ) ( TRUCK-AT ?auto_2073513 ?auto_2073516 ) ( AVAILABLE ?auto_2073514 ) ( SURFACE-AT ?auto_2073508 ?auto_2073516 ) ( ON ?auto_2073508 ?auto_2073512 ) ( CLEAR ?auto_2073508 ) ( not ( = ?auto_2073508 ?auto_2073512 ) ) ( not ( = ?auto_2073509 ?auto_2073512 ) ) ( not ( = ?auto_2073507 ?auto_2073512 ) ) ( not ( = ?auto_2073511 ?auto_2073512 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073508 ?auto_2073509 )
      ( MAKE-2CRATE-VERIFY ?auto_2073507 ?auto_2073508 ?auto_2073509 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2073517 - SURFACE
      ?auto_2073518 - SURFACE
      ?auto_2073519 - SURFACE
      ?auto_2073520 - SURFACE
    )
    :vars
    (
      ?auto_2073522 - HOIST
      ?auto_2073527 - PLACE
      ?auto_2073525 - PLACE
      ?auto_2073524 - HOIST
      ?auto_2073526 - SURFACE
      ?auto_2073523 - TRUCK
      ?auto_2073521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073522 ?auto_2073527 ) ( IS-CRATE ?auto_2073520 ) ( not ( = ?auto_2073519 ?auto_2073520 ) ) ( not ( = ?auto_2073518 ?auto_2073519 ) ) ( not ( = ?auto_2073518 ?auto_2073520 ) ) ( not ( = ?auto_2073525 ?auto_2073527 ) ) ( HOIST-AT ?auto_2073524 ?auto_2073525 ) ( not ( = ?auto_2073522 ?auto_2073524 ) ) ( SURFACE-AT ?auto_2073520 ?auto_2073525 ) ( ON ?auto_2073520 ?auto_2073526 ) ( CLEAR ?auto_2073520 ) ( not ( = ?auto_2073519 ?auto_2073526 ) ) ( not ( = ?auto_2073520 ?auto_2073526 ) ) ( not ( = ?auto_2073518 ?auto_2073526 ) ) ( SURFACE-AT ?auto_2073518 ?auto_2073527 ) ( CLEAR ?auto_2073518 ) ( IS-CRATE ?auto_2073519 ) ( AVAILABLE ?auto_2073522 ) ( TRUCK-AT ?auto_2073523 ?auto_2073525 ) ( AVAILABLE ?auto_2073524 ) ( SURFACE-AT ?auto_2073519 ?auto_2073525 ) ( ON ?auto_2073519 ?auto_2073521 ) ( CLEAR ?auto_2073519 ) ( not ( = ?auto_2073519 ?auto_2073521 ) ) ( not ( = ?auto_2073520 ?auto_2073521 ) ) ( not ( = ?auto_2073518 ?auto_2073521 ) ) ( not ( = ?auto_2073526 ?auto_2073521 ) ) ( ON ?auto_2073518 ?auto_2073517 ) ( not ( = ?auto_2073517 ?auto_2073518 ) ) ( not ( = ?auto_2073517 ?auto_2073519 ) ) ( not ( = ?auto_2073517 ?auto_2073520 ) ) ( not ( = ?auto_2073517 ?auto_2073526 ) ) ( not ( = ?auto_2073517 ?auto_2073521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073518 ?auto_2073519 ?auto_2073520 )
      ( MAKE-3CRATE-VERIFY ?auto_2073517 ?auto_2073518 ?auto_2073519 ?auto_2073520 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2073528 - SURFACE
      ?auto_2073529 - SURFACE
      ?auto_2073530 - SURFACE
      ?auto_2073532 - SURFACE
      ?auto_2073531 - SURFACE
    )
    :vars
    (
      ?auto_2073534 - HOIST
      ?auto_2073539 - PLACE
      ?auto_2073537 - PLACE
      ?auto_2073536 - HOIST
      ?auto_2073538 - SURFACE
      ?auto_2073535 - TRUCK
      ?auto_2073533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073534 ?auto_2073539 ) ( IS-CRATE ?auto_2073531 ) ( not ( = ?auto_2073532 ?auto_2073531 ) ) ( not ( = ?auto_2073530 ?auto_2073532 ) ) ( not ( = ?auto_2073530 ?auto_2073531 ) ) ( not ( = ?auto_2073537 ?auto_2073539 ) ) ( HOIST-AT ?auto_2073536 ?auto_2073537 ) ( not ( = ?auto_2073534 ?auto_2073536 ) ) ( SURFACE-AT ?auto_2073531 ?auto_2073537 ) ( ON ?auto_2073531 ?auto_2073538 ) ( CLEAR ?auto_2073531 ) ( not ( = ?auto_2073532 ?auto_2073538 ) ) ( not ( = ?auto_2073531 ?auto_2073538 ) ) ( not ( = ?auto_2073530 ?auto_2073538 ) ) ( SURFACE-AT ?auto_2073530 ?auto_2073539 ) ( CLEAR ?auto_2073530 ) ( IS-CRATE ?auto_2073532 ) ( AVAILABLE ?auto_2073534 ) ( TRUCK-AT ?auto_2073535 ?auto_2073537 ) ( AVAILABLE ?auto_2073536 ) ( SURFACE-AT ?auto_2073532 ?auto_2073537 ) ( ON ?auto_2073532 ?auto_2073533 ) ( CLEAR ?auto_2073532 ) ( not ( = ?auto_2073532 ?auto_2073533 ) ) ( not ( = ?auto_2073531 ?auto_2073533 ) ) ( not ( = ?auto_2073530 ?auto_2073533 ) ) ( not ( = ?auto_2073538 ?auto_2073533 ) ) ( ON ?auto_2073529 ?auto_2073528 ) ( ON ?auto_2073530 ?auto_2073529 ) ( not ( = ?auto_2073528 ?auto_2073529 ) ) ( not ( = ?auto_2073528 ?auto_2073530 ) ) ( not ( = ?auto_2073528 ?auto_2073532 ) ) ( not ( = ?auto_2073528 ?auto_2073531 ) ) ( not ( = ?auto_2073528 ?auto_2073538 ) ) ( not ( = ?auto_2073528 ?auto_2073533 ) ) ( not ( = ?auto_2073529 ?auto_2073530 ) ) ( not ( = ?auto_2073529 ?auto_2073532 ) ) ( not ( = ?auto_2073529 ?auto_2073531 ) ) ( not ( = ?auto_2073529 ?auto_2073538 ) ) ( not ( = ?auto_2073529 ?auto_2073533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073530 ?auto_2073532 ?auto_2073531 )
      ( MAKE-4CRATE-VERIFY ?auto_2073528 ?auto_2073529 ?auto_2073530 ?auto_2073532 ?auto_2073531 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2073540 - SURFACE
      ?auto_2073541 - SURFACE
      ?auto_2073542 - SURFACE
      ?auto_2073544 - SURFACE
      ?auto_2073543 - SURFACE
      ?auto_2073545 - SURFACE
    )
    :vars
    (
      ?auto_2073547 - HOIST
      ?auto_2073552 - PLACE
      ?auto_2073550 - PLACE
      ?auto_2073549 - HOIST
      ?auto_2073551 - SURFACE
      ?auto_2073548 - TRUCK
      ?auto_2073546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073547 ?auto_2073552 ) ( IS-CRATE ?auto_2073545 ) ( not ( = ?auto_2073543 ?auto_2073545 ) ) ( not ( = ?auto_2073544 ?auto_2073543 ) ) ( not ( = ?auto_2073544 ?auto_2073545 ) ) ( not ( = ?auto_2073550 ?auto_2073552 ) ) ( HOIST-AT ?auto_2073549 ?auto_2073550 ) ( not ( = ?auto_2073547 ?auto_2073549 ) ) ( SURFACE-AT ?auto_2073545 ?auto_2073550 ) ( ON ?auto_2073545 ?auto_2073551 ) ( CLEAR ?auto_2073545 ) ( not ( = ?auto_2073543 ?auto_2073551 ) ) ( not ( = ?auto_2073545 ?auto_2073551 ) ) ( not ( = ?auto_2073544 ?auto_2073551 ) ) ( SURFACE-AT ?auto_2073544 ?auto_2073552 ) ( CLEAR ?auto_2073544 ) ( IS-CRATE ?auto_2073543 ) ( AVAILABLE ?auto_2073547 ) ( TRUCK-AT ?auto_2073548 ?auto_2073550 ) ( AVAILABLE ?auto_2073549 ) ( SURFACE-AT ?auto_2073543 ?auto_2073550 ) ( ON ?auto_2073543 ?auto_2073546 ) ( CLEAR ?auto_2073543 ) ( not ( = ?auto_2073543 ?auto_2073546 ) ) ( not ( = ?auto_2073545 ?auto_2073546 ) ) ( not ( = ?auto_2073544 ?auto_2073546 ) ) ( not ( = ?auto_2073551 ?auto_2073546 ) ) ( ON ?auto_2073541 ?auto_2073540 ) ( ON ?auto_2073542 ?auto_2073541 ) ( ON ?auto_2073544 ?auto_2073542 ) ( not ( = ?auto_2073540 ?auto_2073541 ) ) ( not ( = ?auto_2073540 ?auto_2073542 ) ) ( not ( = ?auto_2073540 ?auto_2073544 ) ) ( not ( = ?auto_2073540 ?auto_2073543 ) ) ( not ( = ?auto_2073540 ?auto_2073545 ) ) ( not ( = ?auto_2073540 ?auto_2073551 ) ) ( not ( = ?auto_2073540 ?auto_2073546 ) ) ( not ( = ?auto_2073541 ?auto_2073542 ) ) ( not ( = ?auto_2073541 ?auto_2073544 ) ) ( not ( = ?auto_2073541 ?auto_2073543 ) ) ( not ( = ?auto_2073541 ?auto_2073545 ) ) ( not ( = ?auto_2073541 ?auto_2073551 ) ) ( not ( = ?auto_2073541 ?auto_2073546 ) ) ( not ( = ?auto_2073542 ?auto_2073544 ) ) ( not ( = ?auto_2073542 ?auto_2073543 ) ) ( not ( = ?auto_2073542 ?auto_2073545 ) ) ( not ( = ?auto_2073542 ?auto_2073551 ) ) ( not ( = ?auto_2073542 ?auto_2073546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073544 ?auto_2073543 ?auto_2073545 )
      ( MAKE-5CRATE-VERIFY ?auto_2073540 ?auto_2073541 ?auto_2073542 ?auto_2073544 ?auto_2073543 ?auto_2073545 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2073553 - SURFACE
      ?auto_2073554 - SURFACE
      ?auto_2073555 - SURFACE
      ?auto_2073557 - SURFACE
      ?auto_2073556 - SURFACE
      ?auto_2073558 - SURFACE
      ?auto_2073559 - SURFACE
    )
    :vars
    (
      ?auto_2073561 - HOIST
      ?auto_2073566 - PLACE
      ?auto_2073564 - PLACE
      ?auto_2073563 - HOIST
      ?auto_2073565 - SURFACE
      ?auto_2073562 - TRUCK
      ?auto_2073560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073561 ?auto_2073566 ) ( IS-CRATE ?auto_2073559 ) ( not ( = ?auto_2073558 ?auto_2073559 ) ) ( not ( = ?auto_2073556 ?auto_2073558 ) ) ( not ( = ?auto_2073556 ?auto_2073559 ) ) ( not ( = ?auto_2073564 ?auto_2073566 ) ) ( HOIST-AT ?auto_2073563 ?auto_2073564 ) ( not ( = ?auto_2073561 ?auto_2073563 ) ) ( SURFACE-AT ?auto_2073559 ?auto_2073564 ) ( ON ?auto_2073559 ?auto_2073565 ) ( CLEAR ?auto_2073559 ) ( not ( = ?auto_2073558 ?auto_2073565 ) ) ( not ( = ?auto_2073559 ?auto_2073565 ) ) ( not ( = ?auto_2073556 ?auto_2073565 ) ) ( SURFACE-AT ?auto_2073556 ?auto_2073566 ) ( CLEAR ?auto_2073556 ) ( IS-CRATE ?auto_2073558 ) ( AVAILABLE ?auto_2073561 ) ( TRUCK-AT ?auto_2073562 ?auto_2073564 ) ( AVAILABLE ?auto_2073563 ) ( SURFACE-AT ?auto_2073558 ?auto_2073564 ) ( ON ?auto_2073558 ?auto_2073560 ) ( CLEAR ?auto_2073558 ) ( not ( = ?auto_2073558 ?auto_2073560 ) ) ( not ( = ?auto_2073559 ?auto_2073560 ) ) ( not ( = ?auto_2073556 ?auto_2073560 ) ) ( not ( = ?auto_2073565 ?auto_2073560 ) ) ( ON ?auto_2073554 ?auto_2073553 ) ( ON ?auto_2073555 ?auto_2073554 ) ( ON ?auto_2073557 ?auto_2073555 ) ( ON ?auto_2073556 ?auto_2073557 ) ( not ( = ?auto_2073553 ?auto_2073554 ) ) ( not ( = ?auto_2073553 ?auto_2073555 ) ) ( not ( = ?auto_2073553 ?auto_2073557 ) ) ( not ( = ?auto_2073553 ?auto_2073556 ) ) ( not ( = ?auto_2073553 ?auto_2073558 ) ) ( not ( = ?auto_2073553 ?auto_2073559 ) ) ( not ( = ?auto_2073553 ?auto_2073565 ) ) ( not ( = ?auto_2073553 ?auto_2073560 ) ) ( not ( = ?auto_2073554 ?auto_2073555 ) ) ( not ( = ?auto_2073554 ?auto_2073557 ) ) ( not ( = ?auto_2073554 ?auto_2073556 ) ) ( not ( = ?auto_2073554 ?auto_2073558 ) ) ( not ( = ?auto_2073554 ?auto_2073559 ) ) ( not ( = ?auto_2073554 ?auto_2073565 ) ) ( not ( = ?auto_2073554 ?auto_2073560 ) ) ( not ( = ?auto_2073555 ?auto_2073557 ) ) ( not ( = ?auto_2073555 ?auto_2073556 ) ) ( not ( = ?auto_2073555 ?auto_2073558 ) ) ( not ( = ?auto_2073555 ?auto_2073559 ) ) ( not ( = ?auto_2073555 ?auto_2073565 ) ) ( not ( = ?auto_2073555 ?auto_2073560 ) ) ( not ( = ?auto_2073557 ?auto_2073556 ) ) ( not ( = ?auto_2073557 ?auto_2073558 ) ) ( not ( = ?auto_2073557 ?auto_2073559 ) ) ( not ( = ?auto_2073557 ?auto_2073565 ) ) ( not ( = ?auto_2073557 ?auto_2073560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073556 ?auto_2073558 ?auto_2073559 )
      ( MAKE-6CRATE-VERIFY ?auto_2073553 ?auto_2073554 ?auto_2073555 ?auto_2073557 ?auto_2073556 ?auto_2073558 ?auto_2073559 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2073567 - SURFACE
      ?auto_2073568 - SURFACE
      ?auto_2073569 - SURFACE
      ?auto_2073571 - SURFACE
      ?auto_2073570 - SURFACE
      ?auto_2073572 - SURFACE
      ?auto_2073573 - SURFACE
      ?auto_2073574 - SURFACE
    )
    :vars
    (
      ?auto_2073576 - HOIST
      ?auto_2073581 - PLACE
      ?auto_2073579 - PLACE
      ?auto_2073578 - HOIST
      ?auto_2073580 - SURFACE
      ?auto_2073577 - TRUCK
      ?auto_2073575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073576 ?auto_2073581 ) ( IS-CRATE ?auto_2073574 ) ( not ( = ?auto_2073573 ?auto_2073574 ) ) ( not ( = ?auto_2073572 ?auto_2073573 ) ) ( not ( = ?auto_2073572 ?auto_2073574 ) ) ( not ( = ?auto_2073579 ?auto_2073581 ) ) ( HOIST-AT ?auto_2073578 ?auto_2073579 ) ( not ( = ?auto_2073576 ?auto_2073578 ) ) ( SURFACE-AT ?auto_2073574 ?auto_2073579 ) ( ON ?auto_2073574 ?auto_2073580 ) ( CLEAR ?auto_2073574 ) ( not ( = ?auto_2073573 ?auto_2073580 ) ) ( not ( = ?auto_2073574 ?auto_2073580 ) ) ( not ( = ?auto_2073572 ?auto_2073580 ) ) ( SURFACE-AT ?auto_2073572 ?auto_2073581 ) ( CLEAR ?auto_2073572 ) ( IS-CRATE ?auto_2073573 ) ( AVAILABLE ?auto_2073576 ) ( TRUCK-AT ?auto_2073577 ?auto_2073579 ) ( AVAILABLE ?auto_2073578 ) ( SURFACE-AT ?auto_2073573 ?auto_2073579 ) ( ON ?auto_2073573 ?auto_2073575 ) ( CLEAR ?auto_2073573 ) ( not ( = ?auto_2073573 ?auto_2073575 ) ) ( not ( = ?auto_2073574 ?auto_2073575 ) ) ( not ( = ?auto_2073572 ?auto_2073575 ) ) ( not ( = ?auto_2073580 ?auto_2073575 ) ) ( ON ?auto_2073568 ?auto_2073567 ) ( ON ?auto_2073569 ?auto_2073568 ) ( ON ?auto_2073571 ?auto_2073569 ) ( ON ?auto_2073570 ?auto_2073571 ) ( ON ?auto_2073572 ?auto_2073570 ) ( not ( = ?auto_2073567 ?auto_2073568 ) ) ( not ( = ?auto_2073567 ?auto_2073569 ) ) ( not ( = ?auto_2073567 ?auto_2073571 ) ) ( not ( = ?auto_2073567 ?auto_2073570 ) ) ( not ( = ?auto_2073567 ?auto_2073572 ) ) ( not ( = ?auto_2073567 ?auto_2073573 ) ) ( not ( = ?auto_2073567 ?auto_2073574 ) ) ( not ( = ?auto_2073567 ?auto_2073580 ) ) ( not ( = ?auto_2073567 ?auto_2073575 ) ) ( not ( = ?auto_2073568 ?auto_2073569 ) ) ( not ( = ?auto_2073568 ?auto_2073571 ) ) ( not ( = ?auto_2073568 ?auto_2073570 ) ) ( not ( = ?auto_2073568 ?auto_2073572 ) ) ( not ( = ?auto_2073568 ?auto_2073573 ) ) ( not ( = ?auto_2073568 ?auto_2073574 ) ) ( not ( = ?auto_2073568 ?auto_2073580 ) ) ( not ( = ?auto_2073568 ?auto_2073575 ) ) ( not ( = ?auto_2073569 ?auto_2073571 ) ) ( not ( = ?auto_2073569 ?auto_2073570 ) ) ( not ( = ?auto_2073569 ?auto_2073572 ) ) ( not ( = ?auto_2073569 ?auto_2073573 ) ) ( not ( = ?auto_2073569 ?auto_2073574 ) ) ( not ( = ?auto_2073569 ?auto_2073580 ) ) ( not ( = ?auto_2073569 ?auto_2073575 ) ) ( not ( = ?auto_2073571 ?auto_2073570 ) ) ( not ( = ?auto_2073571 ?auto_2073572 ) ) ( not ( = ?auto_2073571 ?auto_2073573 ) ) ( not ( = ?auto_2073571 ?auto_2073574 ) ) ( not ( = ?auto_2073571 ?auto_2073580 ) ) ( not ( = ?auto_2073571 ?auto_2073575 ) ) ( not ( = ?auto_2073570 ?auto_2073572 ) ) ( not ( = ?auto_2073570 ?auto_2073573 ) ) ( not ( = ?auto_2073570 ?auto_2073574 ) ) ( not ( = ?auto_2073570 ?auto_2073580 ) ) ( not ( = ?auto_2073570 ?auto_2073575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073572 ?auto_2073573 ?auto_2073574 )
      ( MAKE-7CRATE-VERIFY ?auto_2073567 ?auto_2073568 ?auto_2073569 ?auto_2073571 ?auto_2073570 ?auto_2073572 ?auto_2073573 ?auto_2073574 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2073582 - SURFACE
      ?auto_2073583 - SURFACE
      ?auto_2073584 - SURFACE
      ?auto_2073586 - SURFACE
      ?auto_2073585 - SURFACE
      ?auto_2073587 - SURFACE
      ?auto_2073588 - SURFACE
      ?auto_2073589 - SURFACE
      ?auto_2073590 - SURFACE
    )
    :vars
    (
      ?auto_2073592 - HOIST
      ?auto_2073597 - PLACE
      ?auto_2073595 - PLACE
      ?auto_2073594 - HOIST
      ?auto_2073596 - SURFACE
      ?auto_2073593 - TRUCK
      ?auto_2073591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073592 ?auto_2073597 ) ( IS-CRATE ?auto_2073590 ) ( not ( = ?auto_2073589 ?auto_2073590 ) ) ( not ( = ?auto_2073588 ?auto_2073589 ) ) ( not ( = ?auto_2073588 ?auto_2073590 ) ) ( not ( = ?auto_2073595 ?auto_2073597 ) ) ( HOIST-AT ?auto_2073594 ?auto_2073595 ) ( not ( = ?auto_2073592 ?auto_2073594 ) ) ( SURFACE-AT ?auto_2073590 ?auto_2073595 ) ( ON ?auto_2073590 ?auto_2073596 ) ( CLEAR ?auto_2073590 ) ( not ( = ?auto_2073589 ?auto_2073596 ) ) ( not ( = ?auto_2073590 ?auto_2073596 ) ) ( not ( = ?auto_2073588 ?auto_2073596 ) ) ( SURFACE-AT ?auto_2073588 ?auto_2073597 ) ( CLEAR ?auto_2073588 ) ( IS-CRATE ?auto_2073589 ) ( AVAILABLE ?auto_2073592 ) ( TRUCK-AT ?auto_2073593 ?auto_2073595 ) ( AVAILABLE ?auto_2073594 ) ( SURFACE-AT ?auto_2073589 ?auto_2073595 ) ( ON ?auto_2073589 ?auto_2073591 ) ( CLEAR ?auto_2073589 ) ( not ( = ?auto_2073589 ?auto_2073591 ) ) ( not ( = ?auto_2073590 ?auto_2073591 ) ) ( not ( = ?auto_2073588 ?auto_2073591 ) ) ( not ( = ?auto_2073596 ?auto_2073591 ) ) ( ON ?auto_2073583 ?auto_2073582 ) ( ON ?auto_2073584 ?auto_2073583 ) ( ON ?auto_2073586 ?auto_2073584 ) ( ON ?auto_2073585 ?auto_2073586 ) ( ON ?auto_2073587 ?auto_2073585 ) ( ON ?auto_2073588 ?auto_2073587 ) ( not ( = ?auto_2073582 ?auto_2073583 ) ) ( not ( = ?auto_2073582 ?auto_2073584 ) ) ( not ( = ?auto_2073582 ?auto_2073586 ) ) ( not ( = ?auto_2073582 ?auto_2073585 ) ) ( not ( = ?auto_2073582 ?auto_2073587 ) ) ( not ( = ?auto_2073582 ?auto_2073588 ) ) ( not ( = ?auto_2073582 ?auto_2073589 ) ) ( not ( = ?auto_2073582 ?auto_2073590 ) ) ( not ( = ?auto_2073582 ?auto_2073596 ) ) ( not ( = ?auto_2073582 ?auto_2073591 ) ) ( not ( = ?auto_2073583 ?auto_2073584 ) ) ( not ( = ?auto_2073583 ?auto_2073586 ) ) ( not ( = ?auto_2073583 ?auto_2073585 ) ) ( not ( = ?auto_2073583 ?auto_2073587 ) ) ( not ( = ?auto_2073583 ?auto_2073588 ) ) ( not ( = ?auto_2073583 ?auto_2073589 ) ) ( not ( = ?auto_2073583 ?auto_2073590 ) ) ( not ( = ?auto_2073583 ?auto_2073596 ) ) ( not ( = ?auto_2073583 ?auto_2073591 ) ) ( not ( = ?auto_2073584 ?auto_2073586 ) ) ( not ( = ?auto_2073584 ?auto_2073585 ) ) ( not ( = ?auto_2073584 ?auto_2073587 ) ) ( not ( = ?auto_2073584 ?auto_2073588 ) ) ( not ( = ?auto_2073584 ?auto_2073589 ) ) ( not ( = ?auto_2073584 ?auto_2073590 ) ) ( not ( = ?auto_2073584 ?auto_2073596 ) ) ( not ( = ?auto_2073584 ?auto_2073591 ) ) ( not ( = ?auto_2073586 ?auto_2073585 ) ) ( not ( = ?auto_2073586 ?auto_2073587 ) ) ( not ( = ?auto_2073586 ?auto_2073588 ) ) ( not ( = ?auto_2073586 ?auto_2073589 ) ) ( not ( = ?auto_2073586 ?auto_2073590 ) ) ( not ( = ?auto_2073586 ?auto_2073596 ) ) ( not ( = ?auto_2073586 ?auto_2073591 ) ) ( not ( = ?auto_2073585 ?auto_2073587 ) ) ( not ( = ?auto_2073585 ?auto_2073588 ) ) ( not ( = ?auto_2073585 ?auto_2073589 ) ) ( not ( = ?auto_2073585 ?auto_2073590 ) ) ( not ( = ?auto_2073585 ?auto_2073596 ) ) ( not ( = ?auto_2073585 ?auto_2073591 ) ) ( not ( = ?auto_2073587 ?auto_2073588 ) ) ( not ( = ?auto_2073587 ?auto_2073589 ) ) ( not ( = ?auto_2073587 ?auto_2073590 ) ) ( not ( = ?auto_2073587 ?auto_2073596 ) ) ( not ( = ?auto_2073587 ?auto_2073591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073588 ?auto_2073589 ?auto_2073590 )
      ( MAKE-8CRATE-VERIFY ?auto_2073582 ?auto_2073583 ?auto_2073584 ?auto_2073586 ?auto_2073585 ?auto_2073587 ?auto_2073588 ?auto_2073589 ?auto_2073590 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2073598 - SURFACE
      ?auto_2073599 - SURFACE
      ?auto_2073600 - SURFACE
      ?auto_2073602 - SURFACE
      ?auto_2073601 - SURFACE
      ?auto_2073603 - SURFACE
      ?auto_2073604 - SURFACE
      ?auto_2073605 - SURFACE
      ?auto_2073606 - SURFACE
      ?auto_2073607 - SURFACE
    )
    :vars
    (
      ?auto_2073609 - HOIST
      ?auto_2073614 - PLACE
      ?auto_2073612 - PLACE
      ?auto_2073611 - HOIST
      ?auto_2073613 - SURFACE
      ?auto_2073610 - TRUCK
      ?auto_2073608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073609 ?auto_2073614 ) ( IS-CRATE ?auto_2073607 ) ( not ( = ?auto_2073606 ?auto_2073607 ) ) ( not ( = ?auto_2073605 ?auto_2073606 ) ) ( not ( = ?auto_2073605 ?auto_2073607 ) ) ( not ( = ?auto_2073612 ?auto_2073614 ) ) ( HOIST-AT ?auto_2073611 ?auto_2073612 ) ( not ( = ?auto_2073609 ?auto_2073611 ) ) ( SURFACE-AT ?auto_2073607 ?auto_2073612 ) ( ON ?auto_2073607 ?auto_2073613 ) ( CLEAR ?auto_2073607 ) ( not ( = ?auto_2073606 ?auto_2073613 ) ) ( not ( = ?auto_2073607 ?auto_2073613 ) ) ( not ( = ?auto_2073605 ?auto_2073613 ) ) ( SURFACE-AT ?auto_2073605 ?auto_2073614 ) ( CLEAR ?auto_2073605 ) ( IS-CRATE ?auto_2073606 ) ( AVAILABLE ?auto_2073609 ) ( TRUCK-AT ?auto_2073610 ?auto_2073612 ) ( AVAILABLE ?auto_2073611 ) ( SURFACE-AT ?auto_2073606 ?auto_2073612 ) ( ON ?auto_2073606 ?auto_2073608 ) ( CLEAR ?auto_2073606 ) ( not ( = ?auto_2073606 ?auto_2073608 ) ) ( not ( = ?auto_2073607 ?auto_2073608 ) ) ( not ( = ?auto_2073605 ?auto_2073608 ) ) ( not ( = ?auto_2073613 ?auto_2073608 ) ) ( ON ?auto_2073599 ?auto_2073598 ) ( ON ?auto_2073600 ?auto_2073599 ) ( ON ?auto_2073602 ?auto_2073600 ) ( ON ?auto_2073601 ?auto_2073602 ) ( ON ?auto_2073603 ?auto_2073601 ) ( ON ?auto_2073604 ?auto_2073603 ) ( ON ?auto_2073605 ?auto_2073604 ) ( not ( = ?auto_2073598 ?auto_2073599 ) ) ( not ( = ?auto_2073598 ?auto_2073600 ) ) ( not ( = ?auto_2073598 ?auto_2073602 ) ) ( not ( = ?auto_2073598 ?auto_2073601 ) ) ( not ( = ?auto_2073598 ?auto_2073603 ) ) ( not ( = ?auto_2073598 ?auto_2073604 ) ) ( not ( = ?auto_2073598 ?auto_2073605 ) ) ( not ( = ?auto_2073598 ?auto_2073606 ) ) ( not ( = ?auto_2073598 ?auto_2073607 ) ) ( not ( = ?auto_2073598 ?auto_2073613 ) ) ( not ( = ?auto_2073598 ?auto_2073608 ) ) ( not ( = ?auto_2073599 ?auto_2073600 ) ) ( not ( = ?auto_2073599 ?auto_2073602 ) ) ( not ( = ?auto_2073599 ?auto_2073601 ) ) ( not ( = ?auto_2073599 ?auto_2073603 ) ) ( not ( = ?auto_2073599 ?auto_2073604 ) ) ( not ( = ?auto_2073599 ?auto_2073605 ) ) ( not ( = ?auto_2073599 ?auto_2073606 ) ) ( not ( = ?auto_2073599 ?auto_2073607 ) ) ( not ( = ?auto_2073599 ?auto_2073613 ) ) ( not ( = ?auto_2073599 ?auto_2073608 ) ) ( not ( = ?auto_2073600 ?auto_2073602 ) ) ( not ( = ?auto_2073600 ?auto_2073601 ) ) ( not ( = ?auto_2073600 ?auto_2073603 ) ) ( not ( = ?auto_2073600 ?auto_2073604 ) ) ( not ( = ?auto_2073600 ?auto_2073605 ) ) ( not ( = ?auto_2073600 ?auto_2073606 ) ) ( not ( = ?auto_2073600 ?auto_2073607 ) ) ( not ( = ?auto_2073600 ?auto_2073613 ) ) ( not ( = ?auto_2073600 ?auto_2073608 ) ) ( not ( = ?auto_2073602 ?auto_2073601 ) ) ( not ( = ?auto_2073602 ?auto_2073603 ) ) ( not ( = ?auto_2073602 ?auto_2073604 ) ) ( not ( = ?auto_2073602 ?auto_2073605 ) ) ( not ( = ?auto_2073602 ?auto_2073606 ) ) ( not ( = ?auto_2073602 ?auto_2073607 ) ) ( not ( = ?auto_2073602 ?auto_2073613 ) ) ( not ( = ?auto_2073602 ?auto_2073608 ) ) ( not ( = ?auto_2073601 ?auto_2073603 ) ) ( not ( = ?auto_2073601 ?auto_2073604 ) ) ( not ( = ?auto_2073601 ?auto_2073605 ) ) ( not ( = ?auto_2073601 ?auto_2073606 ) ) ( not ( = ?auto_2073601 ?auto_2073607 ) ) ( not ( = ?auto_2073601 ?auto_2073613 ) ) ( not ( = ?auto_2073601 ?auto_2073608 ) ) ( not ( = ?auto_2073603 ?auto_2073604 ) ) ( not ( = ?auto_2073603 ?auto_2073605 ) ) ( not ( = ?auto_2073603 ?auto_2073606 ) ) ( not ( = ?auto_2073603 ?auto_2073607 ) ) ( not ( = ?auto_2073603 ?auto_2073613 ) ) ( not ( = ?auto_2073603 ?auto_2073608 ) ) ( not ( = ?auto_2073604 ?auto_2073605 ) ) ( not ( = ?auto_2073604 ?auto_2073606 ) ) ( not ( = ?auto_2073604 ?auto_2073607 ) ) ( not ( = ?auto_2073604 ?auto_2073613 ) ) ( not ( = ?auto_2073604 ?auto_2073608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073605 ?auto_2073606 ?auto_2073607 )
      ( MAKE-9CRATE-VERIFY ?auto_2073598 ?auto_2073599 ?auto_2073600 ?auto_2073602 ?auto_2073601 ?auto_2073603 ?auto_2073604 ?auto_2073605 ?auto_2073606 ?auto_2073607 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2073615 - SURFACE
      ?auto_2073616 - SURFACE
      ?auto_2073617 - SURFACE
      ?auto_2073619 - SURFACE
      ?auto_2073618 - SURFACE
      ?auto_2073620 - SURFACE
      ?auto_2073621 - SURFACE
      ?auto_2073622 - SURFACE
      ?auto_2073623 - SURFACE
      ?auto_2073624 - SURFACE
      ?auto_2073625 - SURFACE
    )
    :vars
    (
      ?auto_2073627 - HOIST
      ?auto_2073632 - PLACE
      ?auto_2073630 - PLACE
      ?auto_2073629 - HOIST
      ?auto_2073631 - SURFACE
      ?auto_2073628 - TRUCK
      ?auto_2073626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073627 ?auto_2073632 ) ( IS-CRATE ?auto_2073625 ) ( not ( = ?auto_2073624 ?auto_2073625 ) ) ( not ( = ?auto_2073623 ?auto_2073624 ) ) ( not ( = ?auto_2073623 ?auto_2073625 ) ) ( not ( = ?auto_2073630 ?auto_2073632 ) ) ( HOIST-AT ?auto_2073629 ?auto_2073630 ) ( not ( = ?auto_2073627 ?auto_2073629 ) ) ( SURFACE-AT ?auto_2073625 ?auto_2073630 ) ( ON ?auto_2073625 ?auto_2073631 ) ( CLEAR ?auto_2073625 ) ( not ( = ?auto_2073624 ?auto_2073631 ) ) ( not ( = ?auto_2073625 ?auto_2073631 ) ) ( not ( = ?auto_2073623 ?auto_2073631 ) ) ( SURFACE-AT ?auto_2073623 ?auto_2073632 ) ( CLEAR ?auto_2073623 ) ( IS-CRATE ?auto_2073624 ) ( AVAILABLE ?auto_2073627 ) ( TRUCK-AT ?auto_2073628 ?auto_2073630 ) ( AVAILABLE ?auto_2073629 ) ( SURFACE-AT ?auto_2073624 ?auto_2073630 ) ( ON ?auto_2073624 ?auto_2073626 ) ( CLEAR ?auto_2073624 ) ( not ( = ?auto_2073624 ?auto_2073626 ) ) ( not ( = ?auto_2073625 ?auto_2073626 ) ) ( not ( = ?auto_2073623 ?auto_2073626 ) ) ( not ( = ?auto_2073631 ?auto_2073626 ) ) ( ON ?auto_2073616 ?auto_2073615 ) ( ON ?auto_2073617 ?auto_2073616 ) ( ON ?auto_2073619 ?auto_2073617 ) ( ON ?auto_2073618 ?auto_2073619 ) ( ON ?auto_2073620 ?auto_2073618 ) ( ON ?auto_2073621 ?auto_2073620 ) ( ON ?auto_2073622 ?auto_2073621 ) ( ON ?auto_2073623 ?auto_2073622 ) ( not ( = ?auto_2073615 ?auto_2073616 ) ) ( not ( = ?auto_2073615 ?auto_2073617 ) ) ( not ( = ?auto_2073615 ?auto_2073619 ) ) ( not ( = ?auto_2073615 ?auto_2073618 ) ) ( not ( = ?auto_2073615 ?auto_2073620 ) ) ( not ( = ?auto_2073615 ?auto_2073621 ) ) ( not ( = ?auto_2073615 ?auto_2073622 ) ) ( not ( = ?auto_2073615 ?auto_2073623 ) ) ( not ( = ?auto_2073615 ?auto_2073624 ) ) ( not ( = ?auto_2073615 ?auto_2073625 ) ) ( not ( = ?auto_2073615 ?auto_2073631 ) ) ( not ( = ?auto_2073615 ?auto_2073626 ) ) ( not ( = ?auto_2073616 ?auto_2073617 ) ) ( not ( = ?auto_2073616 ?auto_2073619 ) ) ( not ( = ?auto_2073616 ?auto_2073618 ) ) ( not ( = ?auto_2073616 ?auto_2073620 ) ) ( not ( = ?auto_2073616 ?auto_2073621 ) ) ( not ( = ?auto_2073616 ?auto_2073622 ) ) ( not ( = ?auto_2073616 ?auto_2073623 ) ) ( not ( = ?auto_2073616 ?auto_2073624 ) ) ( not ( = ?auto_2073616 ?auto_2073625 ) ) ( not ( = ?auto_2073616 ?auto_2073631 ) ) ( not ( = ?auto_2073616 ?auto_2073626 ) ) ( not ( = ?auto_2073617 ?auto_2073619 ) ) ( not ( = ?auto_2073617 ?auto_2073618 ) ) ( not ( = ?auto_2073617 ?auto_2073620 ) ) ( not ( = ?auto_2073617 ?auto_2073621 ) ) ( not ( = ?auto_2073617 ?auto_2073622 ) ) ( not ( = ?auto_2073617 ?auto_2073623 ) ) ( not ( = ?auto_2073617 ?auto_2073624 ) ) ( not ( = ?auto_2073617 ?auto_2073625 ) ) ( not ( = ?auto_2073617 ?auto_2073631 ) ) ( not ( = ?auto_2073617 ?auto_2073626 ) ) ( not ( = ?auto_2073619 ?auto_2073618 ) ) ( not ( = ?auto_2073619 ?auto_2073620 ) ) ( not ( = ?auto_2073619 ?auto_2073621 ) ) ( not ( = ?auto_2073619 ?auto_2073622 ) ) ( not ( = ?auto_2073619 ?auto_2073623 ) ) ( not ( = ?auto_2073619 ?auto_2073624 ) ) ( not ( = ?auto_2073619 ?auto_2073625 ) ) ( not ( = ?auto_2073619 ?auto_2073631 ) ) ( not ( = ?auto_2073619 ?auto_2073626 ) ) ( not ( = ?auto_2073618 ?auto_2073620 ) ) ( not ( = ?auto_2073618 ?auto_2073621 ) ) ( not ( = ?auto_2073618 ?auto_2073622 ) ) ( not ( = ?auto_2073618 ?auto_2073623 ) ) ( not ( = ?auto_2073618 ?auto_2073624 ) ) ( not ( = ?auto_2073618 ?auto_2073625 ) ) ( not ( = ?auto_2073618 ?auto_2073631 ) ) ( not ( = ?auto_2073618 ?auto_2073626 ) ) ( not ( = ?auto_2073620 ?auto_2073621 ) ) ( not ( = ?auto_2073620 ?auto_2073622 ) ) ( not ( = ?auto_2073620 ?auto_2073623 ) ) ( not ( = ?auto_2073620 ?auto_2073624 ) ) ( not ( = ?auto_2073620 ?auto_2073625 ) ) ( not ( = ?auto_2073620 ?auto_2073631 ) ) ( not ( = ?auto_2073620 ?auto_2073626 ) ) ( not ( = ?auto_2073621 ?auto_2073622 ) ) ( not ( = ?auto_2073621 ?auto_2073623 ) ) ( not ( = ?auto_2073621 ?auto_2073624 ) ) ( not ( = ?auto_2073621 ?auto_2073625 ) ) ( not ( = ?auto_2073621 ?auto_2073631 ) ) ( not ( = ?auto_2073621 ?auto_2073626 ) ) ( not ( = ?auto_2073622 ?auto_2073623 ) ) ( not ( = ?auto_2073622 ?auto_2073624 ) ) ( not ( = ?auto_2073622 ?auto_2073625 ) ) ( not ( = ?auto_2073622 ?auto_2073631 ) ) ( not ( = ?auto_2073622 ?auto_2073626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073623 ?auto_2073624 ?auto_2073625 )
      ( MAKE-10CRATE-VERIFY ?auto_2073615 ?auto_2073616 ?auto_2073617 ?auto_2073619 ?auto_2073618 ?auto_2073620 ?auto_2073621 ?auto_2073622 ?auto_2073623 ?auto_2073624 ?auto_2073625 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2073633 - SURFACE
      ?auto_2073634 - SURFACE
      ?auto_2073635 - SURFACE
      ?auto_2073637 - SURFACE
      ?auto_2073636 - SURFACE
      ?auto_2073638 - SURFACE
      ?auto_2073639 - SURFACE
      ?auto_2073640 - SURFACE
      ?auto_2073641 - SURFACE
      ?auto_2073642 - SURFACE
      ?auto_2073643 - SURFACE
      ?auto_2073644 - SURFACE
    )
    :vars
    (
      ?auto_2073646 - HOIST
      ?auto_2073651 - PLACE
      ?auto_2073649 - PLACE
      ?auto_2073648 - HOIST
      ?auto_2073650 - SURFACE
      ?auto_2073647 - TRUCK
      ?auto_2073645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073646 ?auto_2073651 ) ( IS-CRATE ?auto_2073644 ) ( not ( = ?auto_2073643 ?auto_2073644 ) ) ( not ( = ?auto_2073642 ?auto_2073643 ) ) ( not ( = ?auto_2073642 ?auto_2073644 ) ) ( not ( = ?auto_2073649 ?auto_2073651 ) ) ( HOIST-AT ?auto_2073648 ?auto_2073649 ) ( not ( = ?auto_2073646 ?auto_2073648 ) ) ( SURFACE-AT ?auto_2073644 ?auto_2073649 ) ( ON ?auto_2073644 ?auto_2073650 ) ( CLEAR ?auto_2073644 ) ( not ( = ?auto_2073643 ?auto_2073650 ) ) ( not ( = ?auto_2073644 ?auto_2073650 ) ) ( not ( = ?auto_2073642 ?auto_2073650 ) ) ( SURFACE-AT ?auto_2073642 ?auto_2073651 ) ( CLEAR ?auto_2073642 ) ( IS-CRATE ?auto_2073643 ) ( AVAILABLE ?auto_2073646 ) ( TRUCK-AT ?auto_2073647 ?auto_2073649 ) ( AVAILABLE ?auto_2073648 ) ( SURFACE-AT ?auto_2073643 ?auto_2073649 ) ( ON ?auto_2073643 ?auto_2073645 ) ( CLEAR ?auto_2073643 ) ( not ( = ?auto_2073643 ?auto_2073645 ) ) ( not ( = ?auto_2073644 ?auto_2073645 ) ) ( not ( = ?auto_2073642 ?auto_2073645 ) ) ( not ( = ?auto_2073650 ?auto_2073645 ) ) ( ON ?auto_2073634 ?auto_2073633 ) ( ON ?auto_2073635 ?auto_2073634 ) ( ON ?auto_2073637 ?auto_2073635 ) ( ON ?auto_2073636 ?auto_2073637 ) ( ON ?auto_2073638 ?auto_2073636 ) ( ON ?auto_2073639 ?auto_2073638 ) ( ON ?auto_2073640 ?auto_2073639 ) ( ON ?auto_2073641 ?auto_2073640 ) ( ON ?auto_2073642 ?auto_2073641 ) ( not ( = ?auto_2073633 ?auto_2073634 ) ) ( not ( = ?auto_2073633 ?auto_2073635 ) ) ( not ( = ?auto_2073633 ?auto_2073637 ) ) ( not ( = ?auto_2073633 ?auto_2073636 ) ) ( not ( = ?auto_2073633 ?auto_2073638 ) ) ( not ( = ?auto_2073633 ?auto_2073639 ) ) ( not ( = ?auto_2073633 ?auto_2073640 ) ) ( not ( = ?auto_2073633 ?auto_2073641 ) ) ( not ( = ?auto_2073633 ?auto_2073642 ) ) ( not ( = ?auto_2073633 ?auto_2073643 ) ) ( not ( = ?auto_2073633 ?auto_2073644 ) ) ( not ( = ?auto_2073633 ?auto_2073650 ) ) ( not ( = ?auto_2073633 ?auto_2073645 ) ) ( not ( = ?auto_2073634 ?auto_2073635 ) ) ( not ( = ?auto_2073634 ?auto_2073637 ) ) ( not ( = ?auto_2073634 ?auto_2073636 ) ) ( not ( = ?auto_2073634 ?auto_2073638 ) ) ( not ( = ?auto_2073634 ?auto_2073639 ) ) ( not ( = ?auto_2073634 ?auto_2073640 ) ) ( not ( = ?auto_2073634 ?auto_2073641 ) ) ( not ( = ?auto_2073634 ?auto_2073642 ) ) ( not ( = ?auto_2073634 ?auto_2073643 ) ) ( not ( = ?auto_2073634 ?auto_2073644 ) ) ( not ( = ?auto_2073634 ?auto_2073650 ) ) ( not ( = ?auto_2073634 ?auto_2073645 ) ) ( not ( = ?auto_2073635 ?auto_2073637 ) ) ( not ( = ?auto_2073635 ?auto_2073636 ) ) ( not ( = ?auto_2073635 ?auto_2073638 ) ) ( not ( = ?auto_2073635 ?auto_2073639 ) ) ( not ( = ?auto_2073635 ?auto_2073640 ) ) ( not ( = ?auto_2073635 ?auto_2073641 ) ) ( not ( = ?auto_2073635 ?auto_2073642 ) ) ( not ( = ?auto_2073635 ?auto_2073643 ) ) ( not ( = ?auto_2073635 ?auto_2073644 ) ) ( not ( = ?auto_2073635 ?auto_2073650 ) ) ( not ( = ?auto_2073635 ?auto_2073645 ) ) ( not ( = ?auto_2073637 ?auto_2073636 ) ) ( not ( = ?auto_2073637 ?auto_2073638 ) ) ( not ( = ?auto_2073637 ?auto_2073639 ) ) ( not ( = ?auto_2073637 ?auto_2073640 ) ) ( not ( = ?auto_2073637 ?auto_2073641 ) ) ( not ( = ?auto_2073637 ?auto_2073642 ) ) ( not ( = ?auto_2073637 ?auto_2073643 ) ) ( not ( = ?auto_2073637 ?auto_2073644 ) ) ( not ( = ?auto_2073637 ?auto_2073650 ) ) ( not ( = ?auto_2073637 ?auto_2073645 ) ) ( not ( = ?auto_2073636 ?auto_2073638 ) ) ( not ( = ?auto_2073636 ?auto_2073639 ) ) ( not ( = ?auto_2073636 ?auto_2073640 ) ) ( not ( = ?auto_2073636 ?auto_2073641 ) ) ( not ( = ?auto_2073636 ?auto_2073642 ) ) ( not ( = ?auto_2073636 ?auto_2073643 ) ) ( not ( = ?auto_2073636 ?auto_2073644 ) ) ( not ( = ?auto_2073636 ?auto_2073650 ) ) ( not ( = ?auto_2073636 ?auto_2073645 ) ) ( not ( = ?auto_2073638 ?auto_2073639 ) ) ( not ( = ?auto_2073638 ?auto_2073640 ) ) ( not ( = ?auto_2073638 ?auto_2073641 ) ) ( not ( = ?auto_2073638 ?auto_2073642 ) ) ( not ( = ?auto_2073638 ?auto_2073643 ) ) ( not ( = ?auto_2073638 ?auto_2073644 ) ) ( not ( = ?auto_2073638 ?auto_2073650 ) ) ( not ( = ?auto_2073638 ?auto_2073645 ) ) ( not ( = ?auto_2073639 ?auto_2073640 ) ) ( not ( = ?auto_2073639 ?auto_2073641 ) ) ( not ( = ?auto_2073639 ?auto_2073642 ) ) ( not ( = ?auto_2073639 ?auto_2073643 ) ) ( not ( = ?auto_2073639 ?auto_2073644 ) ) ( not ( = ?auto_2073639 ?auto_2073650 ) ) ( not ( = ?auto_2073639 ?auto_2073645 ) ) ( not ( = ?auto_2073640 ?auto_2073641 ) ) ( not ( = ?auto_2073640 ?auto_2073642 ) ) ( not ( = ?auto_2073640 ?auto_2073643 ) ) ( not ( = ?auto_2073640 ?auto_2073644 ) ) ( not ( = ?auto_2073640 ?auto_2073650 ) ) ( not ( = ?auto_2073640 ?auto_2073645 ) ) ( not ( = ?auto_2073641 ?auto_2073642 ) ) ( not ( = ?auto_2073641 ?auto_2073643 ) ) ( not ( = ?auto_2073641 ?auto_2073644 ) ) ( not ( = ?auto_2073641 ?auto_2073650 ) ) ( not ( = ?auto_2073641 ?auto_2073645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073642 ?auto_2073643 ?auto_2073644 )
      ( MAKE-11CRATE-VERIFY ?auto_2073633 ?auto_2073634 ?auto_2073635 ?auto_2073637 ?auto_2073636 ?auto_2073638 ?auto_2073639 ?auto_2073640 ?auto_2073641 ?auto_2073642 ?auto_2073643 ?auto_2073644 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2073652 - SURFACE
      ?auto_2073653 - SURFACE
      ?auto_2073654 - SURFACE
      ?auto_2073656 - SURFACE
      ?auto_2073655 - SURFACE
      ?auto_2073657 - SURFACE
      ?auto_2073658 - SURFACE
      ?auto_2073659 - SURFACE
      ?auto_2073660 - SURFACE
      ?auto_2073661 - SURFACE
      ?auto_2073662 - SURFACE
      ?auto_2073663 - SURFACE
      ?auto_2073664 - SURFACE
    )
    :vars
    (
      ?auto_2073666 - HOIST
      ?auto_2073671 - PLACE
      ?auto_2073669 - PLACE
      ?auto_2073668 - HOIST
      ?auto_2073670 - SURFACE
      ?auto_2073667 - TRUCK
      ?auto_2073665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073666 ?auto_2073671 ) ( IS-CRATE ?auto_2073664 ) ( not ( = ?auto_2073663 ?auto_2073664 ) ) ( not ( = ?auto_2073662 ?auto_2073663 ) ) ( not ( = ?auto_2073662 ?auto_2073664 ) ) ( not ( = ?auto_2073669 ?auto_2073671 ) ) ( HOIST-AT ?auto_2073668 ?auto_2073669 ) ( not ( = ?auto_2073666 ?auto_2073668 ) ) ( SURFACE-AT ?auto_2073664 ?auto_2073669 ) ( ON ?auto_2073664 ?auto_2073670 ) ( CLEAR ?auto_2073664 ) ( not ( = ?auto_2073663 ?auto_2073670 ) ) ( not ( = ?auto_2073664 ?auto_2073670 ) ) ( not ( = ?auto_2073662 ?auto_2073670 ) ) ( SURFACE-AT ?auto_2073662 ?auto_2073671 ) ( CLEAR ?auto_2073662 ) ( IS-CRATE ?auto_2073663 ) ( AVAILABLE ?auto_2073666 ) ( TRUCK-AT ?auto_2073667 ?auto_2073669 ) ( AVAILABLE ?auto_2073668 ) ( SURFACE-AT ?auto_2073663 ?auto_2073669 ) ( ON ?auto_2073663 ?auto_2073665 ) ( CLEAR ?auto_2073663 ) ( not ( = ?auto_2073663 ?auto_2073665 ) ) ( not ( = ?auto_2073664 ?auto_2073665 ) ) ( not ( = ?auto_2073662 ?auto_2073665 ) ) ( not ( = ?auto_2073670 ?auto_2073665 ) ) ( ON ?auto_2073653 ?auto_2073652 ) ( ON ?auto_2073654 ?auto_2073653 ) ( ON ?auto_2073656 ?auto_2073654 ) ( ON ?auto_2073655 ?auto_2073656 ) ( ON ?auto_2073657 ?auto_2073655 ) ( ON ?auto_2073658 ?auto_2073657 ) ( ON ?auto_2073659 ?auto_2073658 ) ( ON ?auto_2073660 ?auto_2073659 ) ( ON ?auto_2073661 ?auto_2073660 ) ( ON ?auto_2073662 ?auto_2073661 ) ( not ( = ?auto_2073652 ?auto_2073653 ) ) ( not ( = ?auto_2073652 ?auto_2073654 ) ) ( not ( = ?auto_2073652 ?auto_2073656 ) ) ( not ( = ?auto_2073652 ?auto_2073655 ) ) ( not ( = ?auto_2073652 ?auto_2073657 ) ) ( not ( = ?auto_2073652 ?auto_2073658 ) ) ( not ( = ?auto_2073652 ?auto_2073659 ) ) ( not ( = ?auto_2073652 ?auto_2073660 ) ) ( not ( = ?auto_2073652 ?auto_2073661 ) ) ( not ( = ?auto_2073652 ?auto_2073662 ) ) ( not ( = ?auto_2073652 ?auto_2073663 ) ) ( not ( = ?auto_2073652 ?auto_2073664 ) ) ( not ( = ?auto_2073652 ?auto_2073670 ) ) ( not ( = ?auto_2073652 ?auto_2073665 ) ) ( not ( = ?auto_2073653 ?auto_2073654 ) ) ( not ( = ?auto_2073653 ?auto_2073656 ) ) ( not ( = ?auto_2073653 ?auto_2073655 ) ) ( not ( = ?auto_2073653 ?auto_2073657 ) ) ( not ( = ?auto_2073653 ?auto_2073658 ) ) ( not ( = ?auto_2073653 ?auto_2073659 ) ) ( not ( = ?auto_2073653 ?auto_2073660 ) ) ( not ( = ?auto_2073653 ?auto_2073661 ) ) ( not ( = ?auto_2073653 ?auto_2073662 ) ) ( not ( = ?auto_2073653 ?auto_2073663 ) ) ( not ( = ?auto_2073653 ?auto_2073664 ) ) ( not ( = ?auto_2073653 ?auto_2073670 ) ) ( not ( = ?auto_2073653 ?auto_2073665 ) ) ( not ( = ?auto_2073654 ?auto_2073656 ) ) ( not ( = ?auto_2073654 ?auto_2073655 ) ) ( not ( = ?auto_2073654 ?auto_2073657 ) ) ( not ( = ?auto_2073654 ?auto_2073658 ) ) ( not ( = ?auto_2073654 ?auto_2073659 ) ) ( not ( = ?auto_2073654 ?auto_2073660 ) ) ( not ( = ?auto_2073654 ?auto_2073661 ) ) ( not ( = ?auto_2073654 ?auto_2073662 ) ) ( not ( = ?auto_2073654 ?auto_2073663 ) ) ( not ( = ?auto_2073654 ?auto_2073664 ) ) ( not ( = ?auto_2073654 ?auto_2073670 ) ) ( not ( = ?auto_2073654 ?auto_2073665 ) ) ( not ( = ?auto_2073656 ?auto_2073655 ) ) ( not ( = ?auto_2073656 ?auto_2073657 ) ) ( not ( = ?auto_2073656 ?auto_2073658 ) ) ( not ( = ?auto_2073656 ?auto_2073659 ) ) ( not ( = ?auto_2073656 ?auto_2073660 ) ) ( not ( = ?auto_2073656 ?auto_2073661 ) ) ( not ( = ?auto_2073656 ?auto_2073662 ) ) ( not ( = ?auto_2073656 ?auto_2073663 ) ) ( not ( = ?auto_2073656 ?auto_2073664 ) ) ( not ( = ?auto_2073656 ?auto_2073670 ) ) ( not ( = ?auto_2073656 ?auto_2073665 ) ) ( not ( = ?auto_2073655 ?auto_2073657 ) ) ( not ( = ?auto_2073655 ?auto_2073658 ) ) ( not ( = ?auto_2073655 ?auto_2073659 ) ) ( not ( = ?auto_2073655 ?auto_2073660 ) ) ( not ( = ?auto_2073655 ?auto_2073661 ) ) ( not ( = ?auto_2073655 ?auto_2073662 ) ) ( not ( = ?auto_2073655 ?auto_2073663 ) ) ( not ( = ?auto_2073655 ?auto_2073664 ) ) ( not ( = ?auto_2073655 ?auto_2073670 ) ) ( not ( = ?auto_2073655 ?auto_2073665 ) ) ( not ( = ?auto_2073657 ?auto_2073658 ) ) ( not ( = ?auto_2073657 ?auto_2073659 ) ) ( not ( = ?auto_2073657 ?auto_2073660 ) ) ( not ( = ?auto_2073657 ?auto_2073661 ) ) ( not ( = ?auto_2073657 ?auto_2073662 ) ) ( not ( = ?auto_2073657 ?auto_2073663 ) ) ( not ( = ?auto_2073657 ?auto_2073664 ) ) ( not ( = ?auto_2073657 ?auto_2073670 ) ) ( not ( = ?auto_2073657 ?auto_2073665 ) ) ( not ( = ?auto_2073658 ?auto_2073659 ) ) ( not ( = ?auto_2073658 ?auto_2073660 ) ) ( not ( = ?auto_2073658 ?auto_2073661 ) ) ( not ( = ?auto_2073658 ?auto_2073662 ) ) ( not ( = ?auto_2073658 ?auto_2073663 ) ) ( not ( = ?auto_2073658 ?auto_2073664 ) ) ( not ( = ?auto_2073658 ?auto_2073670 ) ) ( not ( = ?auto_2073658 ?auto_2073665 ) ) ( not ( = ?auto_2073659 ?auto_2073660 ) ) ( not ( = ?auto_2073659 ?auto_2073661 ) ) ( not ( = ?auto_2073659 ?auto_2073662 ) ) ( not ( = ?auto_2073659 ?auto_2073663 ) ) ( not ( = ?auto_2073659 ?auto_2073664 ) ) ( not ( = ?auto_2073659 ?auto_2073670 ) ) ( not ( = ?auto_2073659 ?auto_2073665 ) ) ( not ( = ?auto_2073660 ?auto_2073661 ) ) ( not ( = ?auto_2073660 ?auto_2073662 ) ) ( not ( = ?auto_2073660 ?auto_2073663 ) ) ( not ( = ?auto_2073660 ?auto_2073664 ) ) ( not ( = ?auto_2073660 ?auto_2073670 ) ) ( not ( = ?auto_2073660 ?auto_2073665 ) ) ( not ( = ?auto_2073661 ?auto_2073662 ) ) ( not ( = ?auto_2073661 ?auto_2073663 ) ) ( not ( = ?auto_2073661 ?auto_2073664 ) ) ( not ( = ?auto_2073661 ?auto_2073670 ) ) ( not ( = ?auto_2073661 ?auto_2073665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073662 ?auto_2073663 ?auto_2073664 )
      ( MAKE-12CRATE-VERIFY ?auto_2073652 ?auto_2073653 ?auto_2073654 ?auto_2073656 ?auto_2073655 ?auto_2073657 ?auto_2073658 ?auto_2073659 ?auto_2073660 ?auto_2073661 ?auto_2073662 ?auto_2073663 ?auto_2073664 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073672 - SURFACE
      ?auto_2073673 - SURFACE
      ?auto_2073674 - SURFACE
      ?auto_2073676 - SURFACE
      ?auto_2073675 - SURFACE
      ?auto_2073677 - SURFACE
      ?auto_2073678 - SURFACE
      ?auto_2073679 - SURFACE
      ?auto_2073680 - SURFACE
      ?auto_2073681 - SURFACE
      ?auto_2073682 - SURFACE
      ?auto_2073683 - SURFACE
      ?auto_2073684 - SURFACE
      ?auto_2073685 - SURFACE
    )
    :vars
    (
      ?auto_2073687 - HOIST
      ?auto_2073692 - PLACE
      ?auto_2073690 - PLACE
      ?auto_2073689 - HOIST
      ?auto_2073691 - SURFACE
      ?auto_2073688 - TRUCK
      ?auto_2073686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073687 ?auto_2073692 ) ( IS-CRATE ?auto_2073685 ) ( not ( = ?auto_2073684 ?auto_2073685 ) ) ( not ( = ?auto_2073683 ?auto_2073684 ) ) ( not ( = ?auto_2073683 ?auto_2073685 ) ) ( not ( = ?auto_2073690 ?auto_2073692 ) ) ( HOIST-AT ?auto_2073689 ?auto_2073690 ) ( not ( = ?auto_2073687 ?auto_2073689 ) ) ( SURFACE-AT ?auto_2073685 ?auto_2073690 ) ( ON ?auto_2073685 ?auto_2073691 ) ( CLEAR ?auto_2073685 ) ( not ( = ?auto_2073684 ?auto_2073691 ) ) ( not ( = ?auto_2073685 ?auto_2073691 ) ) ( not ( = ?auto_2073683 ?auto_2073691 ) ) ( SURFACE-AT ?auto_2073683 ?auto_2073692 ) ( CLEAR ?auto_2073683 ) ( IS-CRATE ?auto_2073684 ) ( AVAILABLE ?auto_2073687 ) ( TRUCK-AT ?auto_2073688 ?auto_2073690 ) ( AVAILABLE ?auto_2073689 ) ( SURFACE-AT ?auto_2073684 ?auto_2073690 ) ( ON ?auto_2073684 ?auto_2073686 ) ( CLEAR ?auto_2073684 ) ( not ( = ?auto_2073684 ?auto_2073686 ) ) ( not ( = ?auto_2073685 ?auto_2073686 ) ) ( not ( = ?auto_2073683 ?auto_2073686 ) ) ( not ( = ?auto_2073691 ?auto_2073686 ) ) ( ON ?auto_2073673 ?auto_2073672 ) ( ON ?auto_2073674 ?auto_2073673 ) ( ON ?auto_2073676 ?auto_2073674 ) ( ON ?auto_2073675 ?auto_2073676 ) ( ON ?auto_2073677 ?auto_2073675 ) ( ON ?auto_2073678 ?auto_2073677 ) ( ON ?auto_2073679 ?auto_2073678 ) ( ON ?auto_2073680 ?auto_2073679 ) ( ON ?auto_2073681 ?auto_2073680 ) ( ON ?auto_2073682 ?auto_2073681 ) ( ON ?auto_2073683 ?auto_2073682 ) ( not ( = ?auto_2073672 ?auto_2073673 ) ) ( not ( = ?auto_2073672 ?auto_2073674 ) ) ( not ( = ?auto_2073672 ?auto_2073676 ) ) ( not ( = ?auto_2073672 ?auto_2073675 ) ) ( not ( = ?auto_2073672 ?auto_2073677 ) ) ( not ( = ?auto_2073672 ?auto_2073678 ) ) ( not ( = ?auto_2073672 ?auto_2073679 ) ) ( not ( = ?auto_2073672 ?auto_2073680 ) ) ( not ( = ?auto_2073672 ?auto_2073681 ) ) ( not ( = ?auto_2073672 ?auto_2073682 ) ) ( not ( = ?auto_2073672 ?auto_2073683 ) ) ( not ( = ?auto_2073672 ?auto_2073684 ) ) ( not ( = ?auto_2073672 ?auto_2073685 ) ) ( not ( = ?auto_2073672 ?auto_2073691 ) ) ( not ( = ?auto_2073672 ?auto_2073686 ) ) ( not ( = ?auto_2073673 ?auto_2073674 ) ) ( not ( = ?auto_2073673 ?auto_2073676 ) ) ( not ( = ?auto_2073673 ?auto_2073675 ) ) ( not ( = ?auto_2073673 ?auto_2073677 ) ) ( not ( = ?auto_2073673 ?auto_2073678 ) ) ( not ( = ?auto_2073673 ?auto_2073679 ) ) ( not ( = ?auto_2073673 ?auto_2073680 ) ) ( not ( = ?auto_2073673 ?auto_2073681 ) ) ( not ( = ?auto_2073673 ?auto_2073682 ) ) ( not ( = ?auto_2073673 ?auto_2073683 ) ) ( not ( = ?auto_2073673 ?auto_2073684 ) ) ( not ( = ?auto_2073673 ?auto_2073685 ) ) ( not ( = ?auto_2073673 ?auto_2073691 ) ) ( not ( = ?auto_2073673 ?auto_2073686 ) ) ( not ( = ?auto_2073674 ?auto_2073676 ) ) ( not ( = ?auto_2073674 ?auto_2073675 ) ) ( not ( = ?auto_2073674 ?auto_2073677 ) ) ( not ( = ?auto_2073674 ?auto_2073678 ) ) ( not ( = ?auto_2073674 ?auto_2073679 ) ) ( not ( = ?auto_2073674 ?auto_2073680 ) ) ( not ( = ?auto_2073674 ?auto_2073681 ) ) ( not ( = ?auto_2073674 ?auto_2073682 ) ) ( not ( = ?auto_2073674 ?auto_2073683 ) ) ( not ( = ?auto_2073674 ?auto_2073684 ) ) ( not ( = ?auto_2073674 ?auto_2073685 ) ) ( not ( = ?auto_2073674 ?auto_2073691 ) ) ( not ( = ?auto_2073674 ?auto_2073686 ) ) ( not ( = ?auto_2073676 ?auto_2073675 ) ) ( not ( = ?auto_2073676 ?auto_2073677 ) ) ( not ( = ?auto_2073676 ?auto_2073678 ) ) ( not ( = ?auto_2073676 ?auto_2073679 ) ) ( not ( = ?auto_2073676 ?auto_2073680 ) ) ( not ( = ?auto_2073676 ?auto_2073681 ) ) ( not ( = ?auto_2073676 ?auto_2073682 ) ) ( not ( = ?auto_2073676 ?auto_2073683 ) ) ( not ( = ?auto_2073676 ?auto_2073684 ) ) ( not ( = ?auto_2073676 ?auto_2073685 ) ) ( not ( = ?auto_2073676 ?auto_2073691 ) ) ( not ( = ?auto_2073676 ?auto_2073686 ) ) ( not ( = ?auto_2073675 ?auto_2073677 ) ) ( not ( = ?auto_2073675 ?auto_2073678 ) ) ( not ( = ?auto_2073675 ?auto_2073679 ) ) ( not ( = ?auto_2073675 ?auto_2073680 ) ) ( not ( = ?auto_2073675 ?auto_2073681 ) ) ( not ( = ?auto_2073675 ?auto_2073682 ) ) ( not ( = ?auto_2073675 ?auto_2073683 ) ) ( not ( = ?auto_2073675 ?auto_2073684 ) ) ( not ( = ?auto_2073675 ?auto_2073685 ) ) ( not ( = ?auto_2073675 ?auto_2073691 ) ) ( not ( = ?auto_2073675 ?auto_2073686 ) ) ( not ( = ?auto_2073677 ?auto_2073678 ) ) ( not ( = ?auto_2073677 ?auto_2073679 ) ) ( not ( = ?auto_2073677 ?auto_2073680 ) ) ( not ( = ?auto_2073677 ?auto_2073681 ) ) ( not ( = ?auto_2073677 ?auto_2073682 ) ) ( not ( = ?auto_2073677 ?auto_2073683 ) ) ( not ( = ?auto_2073677 ?auto_2073684 ) ) ( not ( = ?auto_2073677 ?auto_2073685 ) ) ( not ( = ?auto_2073677 ?auto_2073691 ) ) ( not ( = ?auto_2073677 ?auto_2073686 ) ) ( not ( = ?auto_2073678 ?auto_2073679 ) ) ( not ( = ?auto_2073678 ?auto_2073680 ) ) ( not ( = ?auto_2073678 ?auto_2073681 ) ) ( not ( = ?auto_2073678 ?auto_2073682 ) ) ( not ( = ?auto_2073678 ?auto_2073683 ) ) ( not ( = ?auto_2073678 ?auto_2073684 ) ) ( not ( = ?auto_2073678 ?auto_2073685 ) ) ( not ( = ?auto_2073678 ?auto_2073691 ) ) ( not ( = ?auto_2073678 ?auto_2073686 ) ) ( not ( = ?auto_2073679 ?auto_2073680 ) ) ( not ( = ?auto_2073679 ?auto_2073681 ) ) ( not ( = ?auto_2073679 ?auto_2073682 ) ) ( not ( = ?auto_2073679 ?auto_2073683 ) ) ( not ( = ?auto_2073679 ?auto_2073684 ) ) ( not ( = ?auto_2073679 ?auto_2073685 ) ) ( not ( = ?auto_2073679 ?auto_2073691 ) ) ( not ( = ?auto_2073679 ?auto_2073686 ) ) ( not ( = ?auto_2073680 ?auto_2073681 ) ) ( not ( = ?auto_2073680 ?auto_2073682 ) ) ( not ( = ?auto_2073680 ?auto_2073683 ) ) ( not ( = ?auto_2073680 ?auto_2073684 ) ) ( not ( = ?auto_2073680 ?auto_2073685 ) ) ( not ( = ?auto_2073680 ?auto_2073691 ) ) ( not ( = ?auto_2073680 ?auto_2073686 ) ) ( not ( = ?auto_2073681 ?auto_2073682 ) ) ( not ( = ?auto_2073681 ?auto_2073683 ) ) ( not ( = ?auto_2073681 ?auto_2073684 ) ) ( not ( = ?auto_2073681 ?auto_2073685 ) ) ( not ( = ?auto_2073681 ?auto_2073691 ) ) ( not ( = ?auto_2073681 ?auto_2073686 ) ) ( not ( = ?auto_2073682 ?auto_2073683 ) ) ( not ( = ?auto_2073682 ?auto_2073684 ) ) ( not ( = ?auto_2073682 ?auto_2073685 ) ) ( not ( = ?auto_2073682 ?auto_2073691 ) ) ( not ( = ?auto_2073682 ?auto_2073686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073683 ?auto_2073684 ?auto_2073685 )
      ( MAKE-13CRATE-VERIFY ?auto_2073672 ?auto_2073673 ?auto_2073674 ?auto_2073676 ?auto_2073675 ?auto_2073677 ?auto_2073678 ?auto_2073679 ?auto_2073680 ?auto_2073681 ?auto_2073682 ?auto_2073683 ?auto_2073684 ?auto_2073685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2073693 - SURFACE
      ?auto_2073694 - SURFACE
    )
    :vars
    (
      ?auto_2073696 - HOIST
      ?auto_2073702 - PLACE
      ?auto_2073701 - SURFACE
      ?auto_2073699 - PLACE
      ?auto_2073698 - HOIST
      ?auto_2073700 - SURFACE
      ?auto_2073695 - SURFACE
      ?auto_2073697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073696 ?auto_2073702 ) ( IS-CRATE ?auto_2073694 ) ( not ( = ?auto_2073693 ?auto_2073694 ) ) ( not ( = ?auto_2073701 ?auto_2073693 ) ) ( not ( = ?auto_2073701 ?auto_2073694 ) ) ( not ( = ?auto_2073699 ?auto_2073702 ) ) ( HOIST-AT ?auto_2073698 ?auto_2073699 ) ( not ( = ?auto_2073696 ?auto_2073698 ) ) ( SURFACE-AT ?auto_2073694 ?auto_2073699 ) ( ON ?auto_2073694 ?auto_2073700 ) ( CLEAR ?auto_2073694 ) ( not ( = ?auto_2073693 ?auto_2073700 ) ) ( not ( = ?auto_2073694 ?auto_2073700 ) ) ( not ( = ?auto_2073701 ?auto_2073700 ) ) ( SURFACE-AT ?auto_2073701 ?auto_2073702 ) ( CLEAR ?auto_2073701 ) ( IS-CRATE ?auto_2073693 ) ( AVAILABLE ?auto_2073696 ) ( AVAILABLE ?auto_2073698 ) ( SURFACE-AT ?auto_2073693 ?auto_2073699 ) ( ON ?auto_2073693 ?auto_2073695 ) ( CLEAR ?auto_2073693 ) ( not ( = ?auto_2073693 ?auto_2073695 ) ) ( not ( = ?auto_2073694 ?auto_2073695 ) ) ( not ( = ?auto_2073701 ?auto_2073695 ) ) ( not ( = ?auto_2073700 ?auto_2073695 ) ) ( TRUCK-AT ?auto_2073697 ?auto_2073702 ) )
    :subtasks
    ( ( !DRIVE ?auto_2073697 ?auto_2073702 ?auto_2073699 )
      ( MAKE-2CRATE ?auto_2073701 ?auto_2073693 ?auto_2073694 )
      ( MAKE-1CRATE-VERIFY ?auto_2073693 ?auto_2073694 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2073703 - SURFACE
      ?auto_2073704 - SURFACE
      ?auto_2073705 - SURFACE
    )
    :vars
    (
      ?auto_2073706 - HOIST
      ?auto_2073710 - PLACE
      ?auto_2073709 - PLACE
      ?auto_2073707 - HOIST
      ?auto_2073712 - SURFACE
      ?auto_2073711 - SURFACE
      ?auto_2073708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073706 ?auto_2073710 ) ( IS-CRATE ?auto_2073705 ) ( not ( = ?auto_2073704 ?auto_2073705 ) ) ( not ( = ?auto_2073703 ?auto_2073704 ) ) ( not ( = ?auto_2073703 ?auto_2073705 ) ) ( not ( = ?auto_2073709 ?auto_2073710 ) ) ( HOIST-AT ?auto_2073707 ?auto_2073709 ) ( not ( = ?auto_2073706 ?auto_2073707 ) ) ( SURFACE-AT ?auto_2073705 ?auto_2073709 ) ( ON ?auto_2073705 ?auto_2073712 ) ( CLEAR ?auto_2073705 ) ( not ( = ?auto_2073704 ?auto_2073712 ) ) ( not ( = ?auto_2073705 ?auto_2073712 ) ) ( not ( = ?auto_2073703 ?auto_2073712 ) ) ( SURFACE-AT ?auto_2073703 ?auto_2073710 ) ( CLEAR ?auto_2073703 ) ( IS-CRATE ?auto_2073704 ) ( AVAILABLE ?auto_2073706 ) ( AVAILABLE ?auto_2073707 ) ( SURFACE-AT ?auto_2073704 ?auto_2073709 ) ( ON ?auto_2073704 ?auto_2073711 ) ( CLEAR ?auto_2073704 ) ( not ( = ?auto_2073704 ?auto_2073711 ) ) ( not ( = ?auto_2073705 ?auto_2073711 ) ) ( not ( = ?auto_2073703 ?auto_2073711 ) ) ( not ( = ?auto_2073712 ?auto_2073711 ) ) ( TRUCK-AT ?auto_2073708 ?auto_2073710 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073704 ?auto_2073705 )
      ( MAKE-2CRATE-VERIFY ?auto_2073703 ?auto_2073704 ?auto_2073705 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2073713 - SURFACE
      ?auto_2073714 - SURFACE
      ?auto_2073715 - SURFACE
      ?auto_2073716 - SURFACE
    )
    :vars
    (
      ?auto_2073722 - HOIST
      ?auto_2073717 - PLACE
      ?auto_2073721 - PLACE
      ?auto_2073723 - HOIST
      ?auto_2073719 - SURFACE
      ?auto_2073720 - SURFACE
      ?auto_2073718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073722 ?auto_2073717 ) ( IS-CRATE ?auto_2073716 ) ( not ( = ?auto_2073715 ?auto_2073716 ) ) ( not ( = ?auto_2073714 ?auto_2073715 ) ) ( not ( = ?auto_2073714 ?auto_2073716 ) ) ( not ( = ?auto_2073721 ?auto_2073717 ) ) ( HOIST-AT ?auto_2073723 ?auto_2073721 ) ( not ( = ?auto_2073722 ?auto_2073723 ) ) ( SURFACE-AT ?auto_2073716 ?auto_2073721 ) ( ON ?auto_2073716 ?auto_2073719 ) ( CLEAR ?auto_2073716 ) ( not ( = ?auto_2073715 ?auto_2073719 ) ) ( not ( = ?auto_2073716 ?auto_2073719 ) ) ( not ( = ?auto_2073714 ?auto_2073719 ) ) ( SURFACE-AT ?auto_2073714 ?auto_2073717 ) ( CLEAR ?auto_2073714 ) ( IS-CRATE ?auto_2073715 ) ( AVAILABLE ?auto_2073722 ) ( AVAILABLE ?auto_2073723 ) ( SURFACE-AT ?auto_2073715 ?auto_2073721 ) ( ON ?auto_2073715 ?auto_2073720 ) ( CLEAR ?auto_2073715 ) ( not ( = ?auto_2073715 ?auto_2073720 ) ) ( not ( = ?auto_2073716 ?auto_2073720 ) ) ( not ( = ?auto_2073714 ?auto_2073720 ) ) ( not ( = ?auto_2073719 ?auto_2073720 ) ) ( TRUCK-AT ?auto_2073718 ?auto_2073717 ) ( ON ?auto_2073714 ?auto_2073713 ) ( not ( = ?auto_2073713 ?auto_2073714 ) ) ( not ( = ?auto_2073713 ?auto_2073715 ) ) ( not ( = ?auto_2073713 ?auto_2073716 ) ) ( not ( = ?auto_2073713 ?auto_2073719 ) ) ( not ( = ?auto_2073713 ?auto_2073720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073714 ?auto_2073715 ?auto_2073716 )
      ( MAKE-3CRATE-VERIFY ?auto_2073713 ?auto_2073714 ?auto_2073715 ?auto_2073716 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2073724 - SURFACE
      ?auto_2073725 - SURFACE
      ?auto_2073726 - SURFACE
      ?auto_2073728 - SURFACE
      ?auto_2073727 - SURFACE
    )
    :vars
    (
      ?auto_2073734 - HOIST
      ?auto_2073729 - PLACE
      ?auto_2073733 - PLACE
      ?auto_2073735 - HOIST
      ?auto_2073731 - SURFACE
      ?auto_2073732 - SURFACE
      ?auto_2073730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073734 ?auto_2073729 ) ( IS-CRATE ?auto_2073727 ) ( not ( = ?auto_2073728 ?auto_2073727 ) ) ( not ( = ?auto_2073726 ?auto_2073728 ) ) ( not ( = ?auto_2073726 ?auto_2073727 ) ) ( not ( = ?auto_2073733 ?auto_2073729 ) ) ( HOIST-AT ?auto_2073735 ?auto_2073733 ) ( not ( = ?auto_2073734 ?auto_2073735 ) ) ( SURFACE-AT ?auto_2073727 ?auto_2073733 ) ( ON ?auto_2073727 ?auto_2073731 ) ( CLEAR ?auto_2073727 ) ( not ( = ?auto_2073728 ?auto_2073731 ) ) ( not ( = ?auto_2073727 ?auto_2073731 ) ) ( not ( = ?auto_2073726 ?auto_2073731 ) ) ( SURFACE-AT ?auto_2073726 ?auto_2073729 ) ( CLEAR ?auto_2073726 ) ( IS-CRATE ?auto_2073728 ) ( AVAILABLE ?auto_2073734 ) ( AVAILABLE ?auto_2073735 ) ( SURFACE-AT ?auto_2073728 ?auto_2073733 ) ( ON ?auto_2073728 ?auto_2073732 ) ( CLEAR ?auto_2073728 ) ( not ( = ?auto_2073728 ?auto_2073732 ) ) ( not ( = ?auto_2073727 ?auto_2073732 ) ) ( not ( = ?auto_2073726 ?auto_2073732 ) ) ( not ( = ?auto_2073731 ?auto_2073732 ) ) ( TRUCK-AT ?auto_2073730 ?auto_2073729 ) ( ON ?auto_2073725 ?auto_2073724 ) ( ON ?auto_2073726 ?auto_2073725 ) ( not ( = ?auto_2073724 ?auto_2073725 ) ) ( not ( = ?auto_2073724 ?auto_2073726 ) ) ( not ( = ?auto_2073724 ?auto_2073728 ) ) ( not ( = ?auto_2073724 ?auto_2073727 ) ) ( not ( = ?auto_2073724 ?auto_2073731 ) ) ( not ( = ?auto_2073724 ?auto_2073732 ) ) ( not ( = ?auto_2073725 ?auto_2073726 ) ) ( not ( = ?auto_2073725 ?auto_2073728 ) ) ( not ( = ?auto_2073725 ?auto_2073727 ) ) ( not ( = ?auto_2073725 ?auto_2073731 ) ) ( not ( = ?auto_2073725 ?auto_2073732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073726 ?auto_2073728 ?auto_2073727 )
      ( MAKE-4CRATE-VERIFY ?auto_2073724 ?auto_2073725 ?auto_2073726 ?auto_2073728 ?auto_2073727 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2073736 - SURFACE
      ?auto_2073737 - SURFACE
      ?auto_2073738 - SURFACE
      ?auto_2073740 - SURFACE
      ?auto_2073739 - SURFACE
      ?auto_2073741 - SURFACE
    )
    :vars
    (
      ?auto_2073747 - HOIST
      ?auto_2073742 - PLACE
      ?auto_2073746 - PLACE
      ?auto_2073748 - HOIST
      ?auto_2073744 - SURFACE
      ?auto_2073745 - SURFACE
      ?auto_2073743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073747 ?auto_2073742 ) ( IS-CRATE ?auto_2073741 ) ( not ( = ?auto_2073739 ?auto_2073741 ) ) ( not ( = ?auto_2073740 ?auto_2073739 ) ) ( not ( = ?auto_2073740 ?auto_2073741 ) ) ( not ( = ?auto_2073746 ?auto_2073742 ) ) ( HOIST-AT ?auto_2073748 ?auto_2073746 ) ( not ( = ?auto_2073747 ?auto_2073748 ) ) ( SURFACE-AT ?auto_2073741 ?auto_2073746 ) ( ON ?auto_2073741 ?auto_2073744 ) ( CLEAR ?auto_2073741 ) ( not ( = ?auto_2073739 ?auto_2073744 ) ) ( not ( = ?auto_2073741 ?auto_2073744 ) ) ( not ( = ?auto_2073740 ?auto_2073744 ) ) ( SURFACE-AT ?auto_2073740 ?auto_2073742 ) ( CLEAR ?auto_2073740 ) ( IS-CRATE ?auto_2073739 ) ( AVAILABLE ?auto_2073747 ) ( AVAILABLE ?auto_2073748 ) ( SURFACE-AT ?auto_2073739 ?auto_2073746 ) ( ON ?auto_2073739 ?auto_2073745 ) ( CLEAR ?auto_2073739 ) ( not ( = ?auto_2073739 ?auto_2073745 ) ) ( not ( = ?auto_2073741 ?auto_2073745 ) ) ( not ( = ?auto_2073740 ?auto_2073745 ) ) ( not ( = ?auto_2073744 ?auto_2073745 ) ) ( TRUCK-AT ?auto_2073743 ?auto_2073742 ) ( ON ?auto_2073737 ?auto_2073736 ) ( ON ?auto_2073738 ?auto_2073737 ) ( ON ?auto_2073740 ?auto_2073738 ) ( not ( = ?auto_2073736 ?auto_2073737 ) ) ( not ( = ?auto_2073736 ?auto_2073738 ) ) ( not ( = ?auto_2073736 ?auto_2073740 ) ) ( not ( = ?auto_2073736 ?auto_2073739 ) ) ( not ( = ?auto_2073736 ?auto_2073741 ) ) ( not ( = ?auto_2073736 ?auto_2073744 ) ) ( not ( = ?auto_2073736 ?auto_2073745 ) ) ( not ( = ?auto_2073737 ?auto_2073738 ) ) ( not ( = ?auto_2073737 ?auto_2073740 ) ) ( not ( = ?auto_2073737 ?auto_2073739 ) ) ( not ( = ?auto_2073737 ?auto_2073741 ) ) ( not ( = ?auto_2073737 ?auto_2073744 ) ) ( not ( = ?auto_2073737 ?auto_2073745 ) ) ( not ( = ?auto_2073738 ?auto_2073740 ) ) ( not ( = ?auto_2073738 ?auto_2073739 ) ) ( not ( = ?auto_2073738 ?auto_2073741 ) ) ( not ( = ?auto_2073738 ?auto_2073744 ) ) ( not ( = ?auto_2073738 ?auto_2073745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073740 ?auto_2073739 ?auto_2073741 )
      ( MAKE-5CRATE-VERIFY ?auto_2073736 ?auto_2073737 ?auto_2073738 ?auto_2073740 ?auto_2073739 ?auto_2073741 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2073749 - SURFACE
      ?auto_2073750 - SURFACE
      ?auto_2073751 - SURFACE
      ?auto_2073753 - SURFACE
      ?auto_2073752 - SURFACE
      ?auto_2073754 - SURFACE
      ?auto_2073755 - SURFACE
    )
    :vars
    (
      ?auto_2073761 - HOIST
      ?auto_2073756 - PLACE
      ?auto_2073760 - PLACE
      ?auto_2073762 - HOIST
      ?auto_2073758 - SURFACE
      ?auto_2073759 - SURFACE
      ?auto_2073757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073761 ?auto_2073756 ) ( IS-CRATE ?auto_2073755 ) ( not ( = ?auto_2073754 ?auto_2073755 ) ) ( not ( = ?auto_2073752 ?auto_2073754 ) ) ( not ( = ?auto_2073752 ?auto_2073755 ) ) ( not ( = ?auto_2073760 ?auto_2073756 ) ) ( HOIST-AT ?auto_2073762 ?auto_2073760 ) ( not ( = ?auto_2073761 ?auto_2073762 ) ) ( SURFACE-AT ?auto_2073755 ?auto_2073760 ) ( ON ?auto_2073755 ?auto_2073758 ) ( CLEAR ?auto_2073755 ) ( not ( = ?auto_2073754 ?auto_2073758 ) ) ( not ( = ?auto_2073755 ?auto_2073758 ) ) ( not ( = ?auto_2073752 ?auto_2073758 ) ) ( SURFACE-AT ?auto_2073752 ?auto_2073756 ) ( CLEAR ?auto_2073752 ) ( IS-CRATE ?auto_2073754 ) ( AVAILABLE ?auto_2073761 ) ( AVAILABLE ?auto_2073762 ) ( SURFACE-AT ?auto_2073754 ?auto_2073760 ) ( ON ?auto_2073754 ?auto_2073759 ) ( CLEAR ?auto_2073754 ) ( not ( = ?auto_2073754 ?auto_2073759 ) ) ( not ( = ?auto_2073755 ?auto_2073759 ) ) ( not ( = ?auto_2073752 ?auto_2073759 ) ) ( not ( = ?auto_2073758 ?auto_2073759 ) ) ( TRUCK-AT ?auto_2073757 ?auto_2073756 ) ( ON ?auto_2073750 ?auto_2073749 ) ( ON ?auto_2073751 ?auto_2073750 ) ( ON ?auto_2073753 ?auto_2073751 ) ( ON ?auto_2073752 ?auto_2073753 ) ( not ( = ?auto_2073749 ?auto_2073750 ) ) ( not ( = ?auto_2073749 ?auto_2073751 ) ) ( not ( = ?auto_2073749 ?auto_2073753 ) ) ( not ( = ?auto_2073749 ?auto_2073752 ) ) ( not ( = ?auto_2073749 ?auto_2073754 ) ) ( not ( = ?auto_2073749 ?auto_2073755 ) ) ( not ( = ?auto_2073749 ?auto_2073758 ) ) ( not ( = ?auto_2073749 ?auto_2073759 ) ) ( not ( = ?auto_2073750 ?auto_2073751 ) ) ( not ( = ?auto_2073750 ?auto_2073753 ) ) ( not ( = ?auto_2073750 ?auto_2073752 ) ) ( not ( = ?auto_2073750 ?auto_2073754 ) ) ( not ( = ?auto_2073750 ?auto_2073755 ) ) ( not ( = ?auto_2073750 ?auto_2073758 ) ) ( not ( = ?auto_2073750 ?auto_2073759 ) ) ( not ( = ?auto_2073751 ?auto_2073753 ) ) ( not ( = ?auto_2073751 ?auto_2073752 ) ) ( not ( = ?auto_2073751 ?auto_2073754 ) ) ( not ( = ?auto_2073751 ?auto_2073755 ) ) ( not ( = ?auto_2073751 ?auto_2073758 ) ) ( not ( = ?auto_2073751 ?auto_2073759 ) ) ( not ( = ?auto_2073753 ?auto_2073752 ) ) ( not ( = ?auto_2073753 ?auto_2073754 ) ) ( not ( = ?auto_2073753 ?auto_2073755 ) ) ( not ( = ?auto_2073753 ?auto_2073758 ) ) ( not ( = ?auto_2073753 ?auto_2073759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073752 ?auto_2073754 ?auto_2073755 )
      ( MAKE-6CRATE-VERIFY ?auto_2073749 ?auto_2073750 ?auto_2073751 ?auto_2073753 ?auto_2073752 ?auto_2073754 ?auto_2073755 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2073763 - SURFACE
      ?auto_2073764 - SURFACE
      ?auto_2073765 - SURFACE
      ?auto_2073767 - SURFACE
      ?auto_2073766 - SURFACE
      ?auto_2073768 - SURFACE
      ?auto_2073769 - SURFACE
      ?auto_2073770 - SURFACE
    )
    :vars
    (
      ?auto_2073776 - HOIST
      ?auto_2073771 - PLACE
      ?auto_2073775 - PLACE
      ?auto_2073777 - HOIST
      ?auto_2073773 - SURFACE
      ?auto_2073774 - SURFACE
      ?auto_2073772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073776 ?auto_2073771 ) ( IS-CRATE ?auto_2073770 ) ( not ( = ?auto_2073769 ?auto_2073770 ) ) ( not ( = ?auto_2073768 ?auto_2073769 ) ) ( not ( = ?auto_2073768 ?auto_2073770 ) ) ( not ( = ?auto_2073775 ?auto_2073771 ) ) ( HOIST-AT ?auto_2073777 ?auto_2073775 ) ( not ( = ?auto_2073776 ?auto_2073777 ) ) ( SURFACE-AT ?auto_2073770 ?auto_2073775 ) ( ON ?auto_2073770 ?auto_2073773 ) ( CLEAR ?auto_2073770 ) ( not ( = ?auto_2073769 ?auto_2073773 ) ) ( not ( = ?auto_2073770 ?auto_2073773 ) ) ( not ( = ?auto_2073768 ?auto_2073773 ) ) ( SURFACE-AT ?auto_2073768 ?auto_2073771 ) ( CLEAR ?auto_2073768 ) ( IS-CRATE ?auto_2073769 ) ( AVAILABLE ?auto_2073776 ) ( AVAILABLE ?auto_2073777 ) ( SURFACE-AT ?auto_2073769 ?auto_2073775 ) ( ON ?auto_2073769 ?auto_2073774 ) ( CLEAR ?auto_2073769 ) ( not ( = ?auto_2073769 ?auto_2073774 ) ) ( not ( = ?auto_2073770 ?auto_2073774 ) ) ( not ( = ?auto_2073768 ?auto_2073774 ) ) ( not ( = ?auto_2073773 ?auto_2073774 ) ) ( TRUCK-AT ?auto_2073772 ?auto_2073771 ) ( ON ?auto_2073764 ?auto_2073763 ) ( ON ?auto_2073765 ?auto_2073764 ) ( ON ?auto_2073767 ?auto_2073765 ) ( ON ?auto_2073766 ?auto_2073767 ) ( ON ?auto_2073768 ?auto_2073766 ) ( not ( = ?auto_2073763 ?auto_2073764 ) ) ( not ( = ?auto_2073763 ?auto_2073765 ) ) ( not ( = ?auto_2073763 ?auto_2073767 ) ) ( not ( = ?auto_2073763 ?auto_2073766 ) ) ( not ( = ?auto_2073763 ?auto_2073768 ) ) ( not ( = ?auto_2073763 ?auto_2073769 ) ) ( not ( = ?auto_2073763 ?auto_2073770 ) ) ( not ( = ?auto_2073763 ?auto_2073773 ) ) ( not ( = ?auto_2073763 ?auto_2073774 ) ) ( not ( = ?auto_2073764 ?auto_2073765 ) ) ( not ( = ?auto_2073764 ?auto_2073767 ) ) ( not ( = ?auto_2073764 ?auto_2073766 ) ) ( not ( = ?auto_2073764 ?auto_2073768 ) ) ( not ( = ?auto_2073764 ?auto_2073769 ) ) ( not ( = ?auto_2073764 ?auto_2073770 ) ) ( not ( = ?auto_2073764 ?auto_2073773 ) ) ( not ( = ?auto_2073764 ?auto_2073774 ) ) ( not ( = ?auto_2073765 ?auto_2073767 ) ) ( not ( = ?auto_2073765 ?auto_2073766 ) ) ( not ( = ?auto_2073765 ?auto_2073768 ) ) ( not ( = ?auto_2073765 ?auto_2073769 ) ) ( not ( = ?auto_2073765 ?auto_2073770 ) ) ( not ( = ?auto_2073765 ?auto_2073773 ) ) ( not ( = ?auto_2073765 ?auto_2073774 ) ) ( not ( = ?auto_2073767 ?auto_2073766 ) ) ( not ( = ?auto_2073767 ?auto_2073768 ) ) ( not ( = ?auto_2073767 ?auto_2073769 ) ) ( not ( = ?auto_2073767 ?auto_2073770 ) ) ( not ( = ?auto_2073767 ?auto_2073773 ) ) ( not ( = ?auto_2073767 ?auto_2073774 ) ) ( not ( = ?auto_2073766 ?auto_2073768 ) ) ( not ( = ?auto_2073766 ?auto_2073769 ) ) ( not ( = ?auto_2073766 ?auto_2073770 ) ) ( not ( = ?auto_2073766 ?auto_2073773 ) ) ( not ( = ?auto_2073766 ?auto_2073774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073768 ?auto_2073769 ?auto_2073770 )
      ( MAKE-7CRATE-VERIFY ?auto_2073763 ?auto_2073764 ?auto_2073765 ?auto_2073767 ?auto_2073766 ?auto_2073768 ?auto_2073769 ?auto_2073770 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2073778 - SURFACE
      ?auto_2073779 - SURFACE
      ?auto_2073780 - SURFACE
      ?auto_2073782 - SURFACE
      ?auto_2073781 - SURFACE
      ?auto_2073783 - SURFACE
      ?auto_2073784 - SURFACE
      ?auto_2073785 - SURFACE
      ?auto_2073786 - SURFACE
    )
    :vars
    (
      ?auto_2073792 - HOIST
      ?auto_2073787 - PLACE
      ?auto_2073791 - PLACE
      ?auto_2073793 - HOIST
      ?auto_2073789 - SURFACE
      ?auto_2073790 - SURFACE
      ?auto_2073788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073792 ?auto_2073787 ) ( IS-CRATE ?auto_2073786 ) ( not ( = ?auto_2073785 ?auto_2073786 ) ) ( not ( = ?auto_2073784 ?auto_2073785 ) ) ( not ( = ?auto_2073784 ?auto_2073786 ) ) ( not ( = ?auto_2073791 ?auto_2073787 ) ) ( HOIST-AT ?auto_2073793 ?auto_2073791 ) ( not ( = ?auto_2073792 ?auto_2073793 ) ) ( SURFACE-AT ?auto_2073786 ?auto_2073791 ) ( ON ?auto_2073786 ?auto_2073789 ) ( CLEAR ?auto_2073786 ) ( not ( = ?auto_2073785 ?auto_2073789 ) ) ( not ( = ?auto_2073786 ?auto_2073789 ) ) ( not ( = ?auto_2073784 ?auto_2073789 ) ) ( SURFACE-AT ?auto_2073784 ?auto_2073787 ) ( CLEAR ?auto_2073784 ) ( IS-CRATE ?auto_2073785 ) ( AVAILABLE ?auto_2073792 ) ( AVAILABLE ?auto_2073793 ) ( SURFACE-AT ?auto_2073785 ?auto_2073791 ) ( ON ?auto_2073785 ?auto_2073790 ) ( CLEAR ?auto_2073785 ) ( not ( = ?auto_2073785 ?auto_2073790 ) ) ( not ( = ?auto_2073786 ?auto_2073790 ) ) ( not ( = ?auto_2073784 ?auto_2073790 ) ) ( not ( = ?auto_2073789 ?auto_2073790 ) ) ( TRUCK-AT ?auto_2073788 ?auto_2073787 ) ( ON ?auto_2073779 ?auto_2073778 ) ( ON ?auto_2073780 ?auto_2073779 ) ( ON ?auto_2073782 ?auto_2073780 ) ( ON ?auto_2073781 ?auto_2073782 ) ( ON ?auto_2073783 ?auto_2073781 ) ( ON ?auto_2073784 ?auto_2073783 ) ( not ( = ?auto_2073778 ?auto_2073779 ) ) ( not ( = ?auto_2073778 ?auto_2073780 ) ) ( not ( = ?auto_2073778 ?auto_2073782 ) ) ( not ( = ?auto_2073778 ?auto_2073781 ) ) ( not ( = ?auto_2073778 ?auto_2073783 ) ) ( not ( = ?auto_2073778 ?auto_2073784 ) ) ( not ( = ?auto_2073778 ?auto_2073785 ) ) ( not ( = ?auto_2073778 ?auto_2073786 ) ) ( not ( = ?auto_2073778 ?auto_2073789 ) ) ( not ( = ?auto_2073778 ?auto_2073790 ) ) ( not ( = ?auto_2073779 ?auto_2073780 ) ) ( not ( = ?auto_2073779 ?auto_2073782 ) ) ( not ( = ?auto_2073779 ?auto_2073781 ) ) ( not ( = ?auto_2073779 ?auto_2073783 ) ) ( not ( = ?auto_2073779 ?auto_2073784 ) ) ( not ( = ?auto_2073779 ?auto_2073785 ) ) ( not ( = ?auto_2073779 ?auto_2073786 ) ) ( not ( = ?auto_2073779 ?auto_2073789 ) ) ( not ( = ?auto_2073779 ?auto_2073790 ) ) ( not ( = ?auto_2073780 ?auto_2073782 ) ) ( not ( = ?auto_2073780 ?auto_2073781 ) ) ( not ( = ?auto_2073780 ?auto_2073783 ) ) ( not ( = ?auto_2073780 ?auto_2073784 ) ) ( not ( = ?auto_2073780 ?auto_2073785 ) ) ( not ( = ?auto_2073780 ?auto_2073786 ) ) ( not ( = ?auto_2073780 ?auto_2073789 ) ) ( not ( = ?auto_2073780 ?auto_2073790 ) ) ( not ( = ?auto_2073782 ?auto_2073781 ) ) ( not ( = ?auto_2073782 ?auto_2073783 ) ) ( not ( = ?auto_2073782 ?auto_2073784 ) ) ( not ( = ?auto_2073782 ?auto_2073785 ) ) ( not ( = ?auto_2073782 ?auto_2073786 ) ) ( not ( = ?auto_2073782 ?auto_2073789 ) ) ( not ( = ?auto_2073782 ?auto_2073790 ) ) ( not ( = ?auto_2073781 ?auto_2073783 ) ) ( not ( = ?auto_2073781 ?auto_2073784 ) ) ( not ( = ?auto_2073781 ?auto_2073785 ) ) ( not ( = ?auto_2073781 ?auto_2073786 ) ) ( not ( = ?auto_2073781 ?auto_2073789 ) ) ( not ( = ?auto_2073781 ?auto_2073790 ) ) ( not ( = ?auto_2073783 ?auto_2073784 ) ) ( not ( = ?auto_2073783 ?auto_2073785 ) ) ( not ( = ?auto_2073783 ?auto_2073786 ) ) ( not ( = ?auto_2073783 ?auto_2073789 ) ) ( not ( = ?auto_2073783 ?auto_2073790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073784 ?auto_2073785 ?auto_2073786 )
      ( MAKE-8CRATE-VERIFY ?auto_2073778 ?auto_2073779 ?auto_2073780 ?auto_2073782 ?auto_2073781 ?auto_2073783 ?auto_2073784 ?auto_2073785 ?auto_2073786 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2073794 - SURFACE
      ?auto_2073795 - SURFACE
      ?auto_2073796 - SURFACE
      ?auto_2073798 - SURFACE
      ?auto_2073797 - SURFACE
      ?auto_2073799 - SURFACE
      ?auto_2073800 - SURFACE
      ?auto_2073801 - SURFACE
      ?auto_2073802 - SURFACE
      ?auto_2073803 - SURFACE
    )
    :vars
    (
      ?auto_2073809 - HOIST
      ?auto_2073804 - PLACE
      ?auto_2073808 - PLACE
      ?auto_2073810 - HOIST
      ?auto_2073806 - SURFACE
      ?auto_2073807 - SURFACE
      ?auto_2073805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073809 ?auto_2073804 ) ( IS-CRATE ?auto_2073803 ) ( not ( = ?auto_2073802 ?auto_2073803 ) ) ( not ( = ?auto_2073801 ?auto_2073802 ) ) ( not ( = ?auto_2073801 ?auto_2073803 ) ) ( not ( = ?auto_2073808 ?auto_2073804 ) ) ( HOIST-AT ?auto_2073810 ?auto_2073808 ) ( not ( = ?auto_2073809 ?auto_2073810 ) ) ( SURFACE-AT ?auto_2073803 ?auto_2073808 ) ( ON ?auto_2073803 ?auto_2073806 ) ( CLEAR ?auto_2073803 ) ( not ( = ?auto_2073802 ?auto_2073806 ) ) ( not ( = ?auto_2073803 ?auto_2073806 ) ) ( not ( = ?auto_2073801 ?auto_2073806 ) ) ( SURFACE-AT ?auto_2073801 ?auto_2073804 ) ( CLEAR ?auto_2073801 ) ( IS-CRATE ?auto_2073802 ) ( AVAILABLE ?auto_2073809 ) ( AVAILABLE ?auto_2073810 ) ( SURFACE-AT ?auto_2073802 ?auto_2073808 ) ( ON ?auto_2073802 ?auto_2073807 ) ( CLEAR ?auto_2073802 ) ( not ( = ?auto_2073802 ?auto_2073807 ) ) ( not ( = ?auto_2073803 ?auto_2073807 ) ) ( not ( = ?auto_2073801 ?auto_2073807 ) ) ( not ( = ?auto_2073806 ?auto_2073807 ) ) ( TRUCK-AT ?auto_2073805 ?auto_2073804 ) ( ON ?auto_2073795 ?auto_2073794 ) ( ON ?auto_2073796 ?auto_2073795 ) ( ON ?auto_2073798 ?auto_2073796 ) ( ON ?auto_2073797 ?auto_2073798 ) ( ON ?auto_2073799 ?auto_2073797 ) ( ON ?auto_2073800 ?auto_2073799 ) ( ON ?auto_2073801 ?auto_2073800 ) ( not ( = ?auto_2073794 ?auto_2073795 ) ) ( not ( = ?auto_2073794 ?auto_2073796 ) ) ( not ( = ?auto_2073794 ?auto_2073798 ) ) ( not ( = ?auto_2073794 ?auto_2073797 ) ) ( not ( = ?auto_2073794 ?auto_2073799 ) ) ( not ( = ?auto_2073794 ?auto_2073800 ) ) ( not ( = ?auto_2073794 ?auto_2073801 ) ) ( not ( = ?auto_2073794 ?auto_2073802 ) ) ( not ( = ?auto_2073794 ?auto_2073803 ) ) ( not ( = ?auto_2073794 ?auto_2073806 ) ) ( not ( = ?auto_2073794 ?auto_2073807 ) ) ( not ( = ?auto_2073795 ?auto_2073796 ) ) ( not ( = ?auto_2073795 ?auto_2073798 ) ) ( not ( = ?auto_2073795 ?auto_2073797 ) ) ( not ( = ?auto_2073795 ?auto_2073799 ) ) ( not ( = ?auto_2073795 ?auto_2073800 ) ) ( not ( = ?auto_2073795 ?auto_2073801 ) ) ( not ( = ?auto_2073795 ?auto_2073802 ) ) ( not ( = ?auto_2073795 ?auto_2073803 ) ) ( not ( = ?auto_2073795 ?auto_2073806 ) ) ( not ( = ?auto_2073795 ?auto_2073807 ) ) ( not ( = ?auto_2073796 ?auto_2073798 ) ) ( not ( = ?auto_2073796 ?auto_2073797 ) ) ( not ( = ?auto_2073796 ?auto_2073799 ) ) ( not ( = ?auto_2073796 ?auto_2073800 ) ) ( not ( = ?auto_2073796 ?auto_2073801 ) ) ( not ( = ?auto_2073796 ?auto_2073802 ) ) ( not ( = ?auto_2073796 ?auto_2073803 ) ) ( not ( = ?auto_2073796 ?auto_2073806 ) ) ( not ( = ?auto_2073796 ?auto_2073807 ) ) ( not ( = ?auto_2073798 ?auto_2073797 ) ) ( not ( = ?auto_2073798 ?auto_2073799 ) ) ( not ( = ?auto_2073798 ?auto_2073800 ) ) ( not ( = ?auto_2073798 ?auto_2073801 ) ) ( not ( = ?auto_2073798 ?auto_2073802 ) ) ( not ( = ?auto_2073798 ?auto_2073803 ) ) ( not ( = ?auto_2073798 ?auto_2073806 ) ) ( not ( = ?auto_2073798 ?auto_2073807 ) ) ( not ( = ?auto_2073797 ?auto_2073799 ) ) ( not ( = ?auto_2073797 ?auto_2073800 ) ) ( not ( = ?auto_2073797 ?auto_2073801 ) ) ( not ( = ?auto_2073797 ?auto_2073802 ) ) ( not ( = ?auto_2073797 ?auto_2073803 ) ) ( not ( = ?auto_2073797 ?auto_2073806 ) ) ( not ( = ?auto_2073797 ?auto_2073807 ) ) ( not ( = ?auto_2073799 ?auto_2073800 ) ) ( not ( = ?auto_2073799 ?auto_2073801 ) ) ( not ( = ?auto_2073799 ?auto_2073802 ) ) ( not ( = ?auto_2073799 ?auto_2073803 ) ) ( not ( = ?auto_2073799 ?auto_2073806 ) ) ( not ( = ?auto_2073799 ?auto_2073807 ) ) ( not ( = ?auto_2073800 ?auto_2073801 ) ) ( not ( = ?auto_2073800 ?auto_2073802 ) ) ( not ( = ?auto_2073800 ?auto_2073803 ) ) ( not ( = ?auto_2073800 ?auto_2073806 ) ) ( not ( = ?auto_2073800 ?auto_2073807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073801 ?auto_2073802 ?auto_2073803 )
      ( MAKE-9CRATE-VERIFY ?auto_2073794 ?auto_2073795 ?auto_2073796 ?auto_2073798 ?auto_2073797 ?auto_2073799 ?auto_2073800 ?auto_2073801 ?auto_2073802 ?auto_2073803 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2073811 - SURFACE
      ?auto_2073812 - SURFACE
      ?auto_2073813 - SURFACE
      ?auto_2073815 - SURFACE
      ?auto_2073814 - SURFACE
      ?auto_2073816 - SURFACE
      ?auto_2073817 - SURFACE
      ?auto_2073818 - SURFACE
      ?auto_2073819 - SURFACE
      ?auto_2073820 - SURFACE
      ?auto_2073821 - SURFACE
    )
    :vars
    (
      ?auto_2073827 - HOIST
      ?auto_2073822 - PLACE
      ?auto_2073826 - PLACE
      ?auto_2073828 - HOIST
      ?auto_2073824 - SURFACE
      ?auto_2073825 - SURFACE
      ?auto_2073823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073827 ?auto_2073822 ) ( IS-CRATE ?auto_2073821 ) ( not ( = ?auto_2073820 ?auto_2073821 ) ) ( not ( = ?auto_2073819 ?auto_2073820 ) ) ( not ( = ?auto_2073819 ?auto_2073821 ) ) ( not ( = ?auto_2073826 ?auto_2073822 ) ) ( HOIST-AT ?auto_2073828 ?auto_2073826 ) ( not ( = ?auto_2073827 ?auto_2073828 ) ) ( SURFACE-AT ?auto_2073821 ?auto_2073826 ) ( ON ?auto_2073821 ?auto_2073824 ) ( CLEAR ?auto_2073821 ) ( not ( = ?auto_2073820 ?auto_2073824 ) ) ( not ( = ?auto_2073821 ?auto_2073824 ) ) ( not ( = ?auto_2073819 ?auto_2073824 ) ) ( SURFACE-AT ?auto_2073819 ?auto_2073822 ) ( CLEAR ?auto_2073819 ) ( IS-CRATE ?auto_2073820 ) ( AVAILABLE ?auto_2073827 ) ( AVAILABLE ?auto_2073828 ) ( SURFACE-AT ?auto_2073820 ?auto_2073826 ) ( ON ?auto_2073820 ?auto_2073825 ) ( CLEAR ?auto_2073820 ) ( not ( = ?auto_2073820 ?auto_2073825 ) ) ( not ( = ?auto_2073821 ?auto_2073825 ) ) ( not ( = ?auto_2073819 ?auto_2073825 ) ) ( not ( = ?auto_2073824 ?auto_2073825 ) ) ( TRUCK-AT ?auto_2073823 ?auto_2073822 ) ( ON ?auto_2073812 ?auto_2073811 ) ( ON ?auto_2073813 ?auto_2073812 ) ( ON ?auto_2073815 ?auto_2073813 ) ( ON ?auto_2073814 ?auto_2073815 ) ( ON ?auto_2073816 ?auto_2073814 ) ( ON ?auto_2073817 ?auto_2073816 ) ( ON ?auto_2073818 ?auto_2073817 ) ( ON ?auto_2073819 ?auto_2073818 ) ( not ( = ?auto_2073811 ?auto_2073812 ) ) ( not ( = ?auto_2073811 ?auto_2073813 ) ) ( not ( = ?auto_2073811 ?auto_2073815 ) ) ( not ( = ?auto_2073811 ?auto_2073814 ) ) ( not ( = ?auto_2073811 ?auto_2073816 ) ) ( not ( = ?auto_2073811 ?auto_2073817 ) ) ( not ( = ?auto_2073811 ?auto_2073818 ) ) ( not ( = ?auto_2073811 ?auto_2073819 ) ) ( not ( = ?auto_2073811 ?auto_2073820 ) ) ( not ( = ?auto_2073811 ?auto_2073821 ) ) ( not ( = ?auto_2073811 ?auto_2073824 ) ) ( not ( = ?auto_2073811 ?auto_2073825 ) ) ( not ( = ?auto_2073812 ?auto_2073813 ) ) ( not ( = ?auto_2073812 ?auto_2073815 ) ) ( not ( = ?auto_2073812 ?auto_2073814 ) ) ( not ( = ?auto_2073812 ?auto_2073816 ) ) ( not ( = ?auto_2073812 ?auto_2073817 ) ) ( not ( = ?auto_2073812 ?auto_2073818 ) ) ( not ( = ?auto_2073812 ?auto_2073819 ) ) ( not ( = ?auto_2073812 ?auto_2073820 ) ) ( not ( = ?auto_2073812 ?auto_2073821 ) ) ( not ( = ?auto_2073812 ?auto_2073824 ) ) ( not ( = ?auto_2073812 ?auto_2073825 ) ) ( not ( = ?auto_2073813 ?auto_2073815 ) ) ( not ( = ?auto_2073813 ?auto_2073814 ) ) ( not ( = ?auto_2073813 ?auto_2073816 ) ) ( not ( = ?auto_2073813 ?auto_2073817 ) ) ( not ( = ?auto_2073813 ?auto_2073818 ) ) ( not ( = ?auto_2073813 ?auto_2073819 ) ) ( not ( = ?auto_2073813 ?auto_2073820 ) ) ( not ( = ?auto_2073813 ?auto_2073821 ) ) ( not ( = ?auto_2073813 ?auto_2073824 ) ) ( not ( = ?auto_2073813 ?auto_2073825 ) ) ( not ( = ?auto_2073815 ?auto_2073814 ) ) ( not ( = ?auto_2073815 ?auto_2073816 ) ) ( not ( = ?auto_2073815 ?auto_2073817 ) ) ( not ( = ?auto_2073815 ?auto_2073818 ) ) ( not ( = ?auto_2073815 ?auto_2073819 ) ) ( not ( = ?auto_2073815 ?auto_2073820 ) ) ( not ( = ?auto_2073815 ?auto_2073821 ) ) ( not ( = ?auto_2073815 ?auto_2073824 ) ) ( not ( = ?auto_2073815 ?auto_2073825 ) ) ( not ( = ?auto_2073814 ?auto_2073816 ) ) ( not ( = ?auto_2073814 ?auto_2073817 ) ) ( not ( = ?auto_2073814 ?auto_2073818 ) ) ( not ( = ?auto_2073814 ?auto_2073819 ) ) ( not ( = ?auto_2073814 ?auto_2073820 ) ) ( not ( = ?auto_2073814 ?auto_2073821 ) ) ( not ( = ?auto_2073814 ?auto_2073824 ) ) ( not ( = ?auto_2073814 ?auto_2073825 ) ) ( not ( = ?auto_2073816 ?auto_2073817 ) ) ( not ( = ?auto_2073816 ?auto_2073818 ) ) ( not ( = ?auto_2073816 ?auto_2073819 ) ) ( not ( = ?auto_2073816 ?auto_2073820 ) ) ( not ( = ?auto_2073816 ?auto_2073821 ) ) ( not ( = ?auto_2073816 ?auto_2073824 ) ) ( not ( = ?auto_2073816 ?auto_2073825 ) ) ( not ( = ?auto_2073817 ?auto_2073818 ) ) ( not ( = ?auto_2073817 ?auto_2073819 ) ) ( not ( = ?auto_2073817 ?auto_2073820 ) ) ( not ( = ?auto_2073817 ?auto_2073821 ) ) ( not ( = ?auto_2073817 ?auto_2073824 ) ) ( not ( = ?auto_2073817 ?auto_2073825 ) ) ( not ( = ?auto_2073818 ?auto_2073819 ) ) ( not ( = ?auto_2073818 ?auto_2073820 ) ) ( not ( = ?auto_2073818 ?auto_2073821 ) ) ( not ( = ?auto_2073818 ?auto_2073824 ) ) ( not ( = ?auto_2073818 ?auto_2073825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073819 ?auto_2073820 ?auto_2073821 )
      ( MAKE-10CRATE-VERIFY ?auto_2073811 ?auto_2073812 ?auto_2073813 ?auto_2073815 ?auto_2073814 ?auto_2073816 ?auto_2073817 ?auto_2073818 ?auto_2073819 ?auto_2073820 ?auto_2073821 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2073829 - SURFACE
      ?auto_2073830 - SURFACE
      ?auto_2073831 - SURFACE
      ?auto_2073833 - SURFACE
      ?auto_2073832 - SURFACE
      ?auto_2073834 - SURFACE
      ?auto_2073835 - SURFACE
      ?auto_2073836 - SURFACE
      ?auto_2073837 - SURFACE
      ?auto_2073838 - SURFACE
      ?auto_2073839 - SURFACE
      ?auto_2073840 - SURFACE
    )
    :vars
    (
      ?auto_2073846 - HOIST
      ?auto_2073841 - PLACE
      ?auto_2073845 - PLACE
      ?auto_2073847 - HOIST
      ?auto_2073843 - SURFACE
      ?auto_2073844 - SURFACE
      ?auto_2073842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073846 ?auto_2073841 ) ( IS-CRATE ?auto_2073840 ) ( not ( = ?auto_2073839 ?auto_2073840 ) ) ( not ( = ?auto_2073838 ?auto_2073839 ) ) ( not ( = ?auto_2073838 ?auto_2073840 ) ) ( not ( = ?auto_2073845 ?auto_2073841 ) ) ( HOIST-AT ?auto_2073847 ?auto_2073845 ) ( not ( = ?auto_2073846 ?auto_2073847 ) ) ( SURFACE-AT ?auto_2073840 ?auto_2073845 ) ( ON ?auto_2073840 ?auto_2073843 ) ( CLEAR ?auto_2073840 ) ( not ( = ?auto_2073839 ?auto_2073843 ) ) ( not ( = ?auto_2073840 ?auto_2073843 ) ) ( not ( = ?auto_2073838 ?auto_2073843 ) ) ( SURFACE-AT ?auto_2073838 ?auto_2073841 ) ( CLEAR ?auto_2073838 ) ( IS-CRATE ?auto_2073839 ) ( AVAILABLE ?auto_2073846 ) ( AVAILABLE ?auto_2073847 ) ( SURFACE-AT ?auto_2073839 ?auto_2073845 ) ( ON ?auto_2073839 ?auto_2073844 ) ( CLEAR ?auto_2073839 ) ( not ( = ?auto_2073839 ?auto_2073844 ) ) ( not ( = ?auto_2073840 ?auto_2073844 ) ) ( not ( = ?auto_2073838 ?auto_2073844 ) ) ( not ( = ?auto_2073843 ?auto_2073844 ) ) ( TRUCK-AT ?auto_2073842 ?auto_2073841 ) ( ON ?auto_2073830 ?auto_2073829 ) ( ON ?auto_2073831 ?auto_2073830 ) ( ON ?auto_2073833 ?auto_2073831 ) ( ON ?auto_2073832 ?auto_2073833 ) ( ON ?auto_2073834 ?auto_2073832 ) ( ON ?auto_2073835 ?auto_2073834 ) ( ON ?auto_2073836 ?auto_2073835 ) ( ON ?auto_2073837 ?auto_2073836 ) ( ON ?auto_2073838 ?auto_2073837 ) ( not ( = ?auto_2073829 ?auto_2073830 ) ) ( not ( = ?auto_2073829 ?auto_2073831 ) ) ( not ( = ?auto_2073829 ?auto_2073833 ) ) ( not ( = ?auto_2073829 ?auto_2073832 ) ) ( not ( = ?auto_2073829 ?auto_2073834 ) ) ( not ( = ?auto_2073829 ?auto_2073835 ) ) ( not ( = ?auto_2073829 ?auto_2073836 ) ) ( not ( = ?auto_2073829 ?auto_2073837 ) ) ( not ( = ?auto_2073829 ?auto_2073838 ) ) ( not ( = ?auto_2073829 ?auto_2073839 ) ) ( not ( = ?auto_2073829 ?auto_2073840 ) ) ( not ( = ?auto_2073829 ?auto_2073843 ) ) ( not ( = ?auto_2073829 ?auto_2073844 ) ) ( not ( = ?auto_2073830 ?auto_2073831 ) ) ( not ( = ?auto_2073830 ?auto_2073833 ) ) ( not ( = ?auto_2073830 ?auto_2073832 ) ) ( not ( = ?auto_2073830 ?auto_2073834 ) ) ( not ( = ?auto_2073830 ?auto_2073835 ) ) ( not ( = ?auto_2073830 ?auto_2073836 ) ) ( not ( = ?auto_2073830 ?auto_2073837 ) ) ( not ( = ?auto_2073830 ?auto_2073838 ) ) ( not ( = ?auto_2073830 ?auto_2073839 ) ) ( not ( = ?auto_2073830 ?auto_2073840 ) ) ( not ( = ?auto_2073830 ?auto_2073843 ) ) ( not ( = ?auto_2073830 ?auto_2073844 ) ) ( not ( = ?auto_2073831 ?auto_2073833 ) ) ( not ( = ?auto_2073831 ?auto_2073832 ) ) ( not ( = ?auto_2073831 ?auto_2073834 ) ) ( not ( = ?auto_2073831 ?auto_2073835 ) ) ( not ( = ?auto_2073831 ?auto_2073836 ) ) ( not ( = ?auto_2073831 ?auto_2073837 ) ) ( not ( = ?auto_2073831 ?auto_2073838 ) ) ( not ( = ?auto_2073831 ?auto_2073839 ) ) ( not ( = ?auto_2073831 ?auto_2073840 ) ) ( not ( = ?auto_2073831 ?auto_2073843 ) ) ( not ( = ?auto_2073831 ?auto_2073844 ) ) ( not ( = ?auto_2073833 ?auto_2073832 ) ) ( not ( = ?auto_2073833 ?auto_2073834 ) ) ( not ( = ?auto_2073833 ?auto_2073835 ) ) ( not ( = ?auto_2073833 ?auto_2073836 ) ) ( not ( = ?auto_2073833 ?auto_2073837 ) ) ( not ( = ?auto_2073833 ?auto_2073838 ) ) ( not ( = ?auto_2073833 ?auto_2073839 ) ) ( not ( = ?auto_2073833 ?auto_2073840 ) ) ( not ( = ?auto_2073833 ?auto_2073843 ) ) ( not ( = ?auto_2073833 ?auto_2073844 ) ) ( not ( = ?auto_2073832 ?auto_2073834 ) ) ( not ( = ?auto_2073832 ?auto_2073835 ) ) ( not ( = ?auto_2073832 ?auto_2073836 ) ) ( not ( = ?auto_2073832 ?auto_2073837 ) ) ( not ( = ?auto_2073832 ?auto_2073838 ) ) ( not ( = ?auto_2073832 ?auto_2073839 ) ) ( not ( = ?auto_2073832 ?auto_2073840 ) ) ( not ( = ?auto_2073832 ?auto_2073843 ) ) ( not ( = ?auto_2073832 ?auto_2073844 ) ) ( not ( = ?auto_2073834 ?auto_2073835 ) ) ( not ( = ?auto_2073834 ?auto_2073836 ) ) ( not ( = ?auto_2073834 ?auto_2073837 ) ) ( not ( = ?auto_2073834 ?auto_2073838 ) ) ( not ( = ?auto_2073834 ?auto_2073839 ) ) ( not ( = ?auto_2073834 ?auto_2073840 ) ) ( not ( = ?auto_2073834 ?auto_2073843 ) ) ( not ( = ?auto_2073834 ?auto_2073844 ) ) ( not ( = ?auto_2073835 ?auto_2073836 ) ) ( not ( = ?auto_2073835 ?auto_2073837 ) ) ( not ( = ?auto_2073835 ?auto_2073838 ) ) ( not ( = ?auto_2073835 ?auto_2073839 ) ) ( not ( = ?auto_2073835 ?auto_2073840 ) ) ( not ( = ?auto_2073835 ?auto_2073843 ) ) ( not ( = ?auto_2073835 ?auto_2073844 ) ) ( not ( = ?auto_2073836 ?auto_2073837 ) ) ( not ( = ?auto_2073836 ?auto_2073838 ) ) ( not ( = ?auto_2073836 ?auto_2073839 ) ) ( not ( = ?auto_2073836 ?auto_2073840 ) ) ( not ( = ?auto_2073836 ?auto_2073843 ) ) ( not ( = ?auto_2073836 ?auto_2073844 ) ) ( not ( = ?auto_2073837 ?auto_2073838 ) ) ( not ( = ?auto_2073837 ?auto_2073839 ) ) ( not ( = ?auto_2073837 ?auto_2073840 ) ) ( not ( = ?auto_2073837 ?auto_2073843 ) ) ( not ( = ?auto_2073837 ?auto_2073844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073838 ?auto_2073839 ?auto_2073840 )
      ( MAKE-11CRATE-VERIFY ?auto_2073829 ?auto_2073830 ?auto_2073831 ?auto_2073833 ?auto_2073832 ?auto_2073834 ?auto_2073835 ?auto_2073836 ?auto_2073837 ?auto_2073838 ?auto_2073839 ?auto_2073840 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2073848 - SURFACE
      ?auto_2073849 - SURFACE
      ?auto_2073850 - SURFACE
      ?auto_2073852 - SURFACE
      ?auto_2073851 - SURFACE
      ?auto_2073853 - SURFACE
      ?auto_2073854 - SURFACE
      ?auto_2073855 - SURFACE
      ?auto_2073856 - SURFACE
      ?auto_2073857 - SURFACE
      ?auto_2073858 - SURFACE
      ?auto_2073859 - SURFACE
      ?auto_2073860 - SURFACE
    )
    :vars
    (
      ?auto_2073866 - HOIST
      ?auto_2073861 - PLACE
      ?auto_2073865 - PLACE
      ?auto_2073867 - HOIST
      ?auto_2073863 - SURFACE
      ?auto_2073864 - SURFACE
      ?auto_2073862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073866 ?auto_2073861 ) ( IS-CRATE ?auto_2073860 ) ( not ( = ?auto_2073859 ?auto_2073860 ) ) ( not ( = ?auto_2073858 ?auto_2073859 ) ) ( not ( = ?auto_2073858 ?auto_2073860 ) ) ( not ( = ?auto_2073865 ?auto_2073861 ) ) ( HOIST-AT ?auto_2073867 ?auto_2073865 ) ( not ( = ?auto_2073866 ?auto_2073867 ) ) ( SURFACE-AT ?auto_2073860 ?auto_2073865 ) ( ON ?auto_2073860 ?auto_2073863 ) ( CLEAR ?auto_2073860 ) ( not ( = ?auto_2073859 ?auto_2073863 ) ) ( not ( = ?auto_2073860 ?auto_2073863 ) ) ( not ( = ?auto_2073858 ?auto_2073863 ) ) ( SURFACE-AT ?auto_2073858 ?auto_2073861 ) ( CLEAR ?auto_2073858 ) ( IS-CRATE ?auto_2073859 ) ( AVAILABLE ?auto_2073866 ) ( AVAILABLE ?auto_2073867 ) ( SURFACE-AT ?auto_2073859 ?auto_2073865 ) ( ON ?auto_2073859 ?auto_2073864 ) ( CLEAR ?auto_2073859 ) ( not ( = ?auto_2073859 ?auto_2073864 ) ) ( not ( = ?auto_2073860 ?auto_2073864 ) ) ( not ( = ?auto_2073858 ?auto_2073864 ) ) ( not ( = ?auto_2073863 ?auto_2073864 ) ) ( TRUCK-AT ?auto_2073862 ?auto_2073861 ) ( ON ?auto_2073849 ?auto_2073848 ) ( ON ?auto_2073850 ?auto_2073849 ) ( ON ?auto_2073852 ?auto_2073850 ) ( ON ?auto_2073851 ?auto_2073852 ) ( ON ?auto_2073853 ?auto_2073851 ) ( ON ?auto_2073854 ?auto_2073853 ) ( ON ?auto_2073855 ?auto_2073854 ) ( ON ?auto_2073856 ?auto_2073855 ) ( ON ?auto_2073857 ?auto_2073856 ) ( ON ?auto_2073858 ?auto_2073857 ) ( not ( = ?auto_2073848 ?auto_2073849 ) ) ( not ( = ?auto_2073848 ?auto_2073850 ) ) ( not ( = ?auto_2073848 ?auto_2073852 ) ) ( not ( = ?auto_2073848 ?auto_2073851 ) ) ( not ( = ?auto_2073848 ?auto_2073853 ) ) ( not ( = ?auto_2073848 ?auto_2073854 ) ) ( not ( = ?auto_2073848 ?auto_2073855 ) ) ( not ( = ?auto_2073848 ?auto_2073856 ) ) ( not ( = ?auto_2073848 ?auto_2073857 ) ) ( not ( = ?auto_2073848 ?auto_2073858 ) ) ( not ( = ?auto_2073848 ?auto_2073859 ) ) ( not ( = ?auto_2073848 ?auto_2073860 ) ) ( not ( = ?auto_2073848 ?auto_2073863 ) ) ( not ( = ?auto_2073848 ?auto_2073864 ) ) ( not ( = ?auto_2073849 ?auto_2073850 ) ) ( not ( = ?auto_2073849 ?auto_2073852 ) ) ( not ( = ?auto_2073849 ?auto_2073851 ) ) ( not ( = ?auto_2073849 ?auto_2073853 ) ) ( not ( = ?auto_2073849 ?auto_2073854 ) ) ( not ( = ?auto_2073849 ?auto_2073855 ) ) ( not ( = ?auto_2073849 ?auto_2073856 ) ) ( not ( = ?auto_2073849 ?auto_2073857 ) ) ( not ( = ?auto_2073849 ?auto_2073858 ) ) ( not ( = ?auto_2073849 ?auto_2073859 ) ) ( not ( = ?auto_2073849 ?auto_2073860 ) ) ( not ( = ?auto_2073849 ?auto_2073863 ) ) ( not ( = ?auto_2073849 ?auto_2073864 ) ) ( not ( = ?auto_2073850 ?auto_2073852 ) ) ( not ( = ?auto_2073850 ?auto_2073851 ) ) ( not ( = ?auto_2073850 ?auto_2073853 ) ) ( not ( = ?auto_2073850 ?auto_2073854 ) ) ( not ( = ?auto_2073850 ?auto_2073855 ) ) ( not ( = ?auto_2073850 ?auto_2073856 ) ) ( not ( = ?auto_2073850 ?auto_2073857 ) ) ( not ( = ?auto_2073850 ?auto_2073858 ) ) ( not ( = ?auto_2073850 ?auto_2073859 ) ) ( not ( = ?auto_2073850 ?auto_2073860 ) ) ( not ( = ?auto_2073850 ?auto_2073863 ) ) ( not ( = ?auto_2073850 ?auto_2073864 ) ) ( not ( = ?auto_2073852 ?auto_2073851 ) ) ( not ( = ?auto_2073852 ?auto_2073853 ) ) ( not ( = ?auto_2073852 ?auto_2073854 ) ) ( not ( = ?auto_2073852 ?auto_2073855 ) ) ( not ( = ?auto_2073852 ?auto_2073856 ) ) ( not ( = ?auto_2073852 ?auto_2073857 ) ) ( not ( = ?auto_2073852 ?auto_2073858 ) ) ( not ( = ?auto_2073852 ?auto_2073859 ) ) ( not ( = ?auto_2073852 ?auto_2073860 ) ) ( not ( = ?auto_2073852 ?auto_2073863 ) ) ( not ( = ?auto_2073852 ?auto_2073864 ) ) ( not ( = ?auto_2073851 ?auto_2073853 ) ) ( not ( = ?auto_2073851 ?auto_2073854 ) ) ( not ( = ?auto_2073851 ?auto_2073855 ) ) ( not ( = ?auto_2073851 ?auto_2073856 ) ) ( not ( = ?auto_2073851 ?auto_2073857 ) ) ( not ( = ?auto_2073851 ?auto_2073858 ) ) ( not ( = ?auto_2073851 ?auto_2073859 ) ) ( not ( = ?auto_2073851 ?auto_2073860 ) ) ( not ( = ?auto_2073851 ?auto_2073863 ) ) ( not ( = ?auto_2073851 ?auto_2073864 ) ) ( not ( = ?auto_2073853 ?auto_2073854 ) ) ( not ( = ?auto_2073853 ?auto_2073855 ) ) ( not ( = ?auto_2073853 ?auto_2073856 ) ) ( not ( = ?auto_2073853 ?auto_2073857 ) ) ( not ( = ?auto_2073853 ?auto_2073858 ) ) ( not ( = ?auto_2073853 ?auto_2073859 ) ) ( not ( = ?auto_2073853 ?auto_2073860 ) ) ( not ( = ?auto_2073853 ?auto_2073863 ) ) ( not ( = ?auto_2073853 ?auto_2073864 ) ) ( not ( = ?auto_2073854 ?auto_2073855 ) ) ( not ( = ?auto_2073854 ?auto_2073856 ) ) ( not ( = ?auto_2073854 ?auto_2073857 ) ) ( not ( = ?auto_2073854 ?auto_2073858 ) ) ( not ( = ?auto_2073854 ?auto_2073859 ) ) ( not ( = ?auto_2073854 ?auto_2073860 ) ) ( not ( = ?auto_2073854 ?auto_2073863 ) ) ( not ( = ?auto_2073854 ?auto_2073864 ) ) ( not ( = ?auto_2073855 ?auto_2073856 ) ) ( not ( = ?auto_2073855 ?auto_2073857 ) ) ( not ( = ?auto_2073855 ?auto_2073858 ) ) ( not ( = ?auto_2073855 ?auto_2073859 ) ) ( not ( = ?auto_2073855 ?auto_2073860 ) ) ( not ( = ?auto_2073855 ?auto_2073863 ) ) ( not ( = ?auto_2073855 ?auto_2073864 ) ) ( not ( = ?auto_2073856 ?auto_2073857 ) ) ( not ( = ?auto_2073856 ?auto_2073858 ) ) ( not ( = ?auto_2073856 ?auto_2073859 ) ) ( not ( = ?auto_2073856 ?auto_2073860 ) ) ( not ( = ?auto_2073856 ?auto_2073863 ) ) ( not ( = ?auto_2073856 ?auto_2073864 ) ) ( not ( = ?auto_2073857 ?auto_2073858 ) ) ( not ( = ?auto_2073857 ?auto_2073859 ) ) ( not ( = ?auto_2073857 ?auto_2073860 ) ) ( not ( = ?auto_2073857 ?auto_2073863 ) ) ( not ( = ?auto_2073857 ?auto_2073864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073858 ?auto_2073859 ?auto_2073860 )
      ( MAKE-12CRATE-VERIFY ?auto_2073848 ?auto_2073849 ?auto_2073850 ?auto_2073852 ?auto_2073851 ?auto_2073853 ?auto_2073854 ?auto_2073855 ?auto_2073856 ?auto_2073857 ?auto_2073858 ?auto_2073859 ?auto_2073860 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073868 - SURFACE
      ?auto_2073869 - SURFACE
      ?auto_2073870 - SURFACE
      ?auto_2073872 - SURFACE
      ?auto_2073871 - SURFACE
      ?auto_2073873 - SURFACE
      ?auto_2073874 - SURFACE
      ?auto_2073875 - SURFACE
      ?auto_2073876 - SURFACE
      ?auto_2073877 - SURFACE
      ?auto_2073878 - SURFACE
      ?auto_2073879 - SURFACE
      ?auto_2073880 - SURFACE
      ?auto_2073881 - SURFACE
    )
    :vars
    (
      ?auto_2073887 - HOIST
      ?auto_2073882 - PLACE
      ?auto_2073886 - PLACE
      ?auto_2073888 - HOIST
      ?auto_2073884 - SURFACE
      ?auto_2073885 - SURFACE
      ?auto_2073883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073887 ?auto_2073882 ) ( IS-CRATE ?auto_2073881 ) ( not ( = ?auto_2073880 ?auto_2073881 ) ) ( not ( = ?auto_2073879 ?auto_2073880 ) ) ( not ( = ?auto_2073879 ?auto_2073881 ) ) ( not ( = ?auto_2073886 ?auto_2073882 ) ) ( HOIST-AT ?auto_2073888 ?auto_2073886 ) ( not ( = ?auto_2073887 ?auto_2073888 ) ) ( SURFACE-AT ?auto_2073881 ?auto_2073886 ) ( ON ?auto_2073881 ?auto_2073884 ) ( CLEAR ?auto_2073881 ) ( not ( = ?auto_2073880 ?auto_2073884 ) ) ( not ( = ?auto_2073881 ?auto_2073884 ) ) ( not ( = ?auto_2073879 ?auto_2073884 ) ) ( SURFACE-AT ?auto_2073879 ?auto_2073882 ) ( CLEAR ?auto_2073879 ) ( IS-CRATE ?auto_2073880 ) ( AVAILABLE ?auto_2073887 ) ( AVAILABLE ?auto_2073888 ) ( SURFACE-AT ?auto_2073880 ?auto_2073886 ) ( ON ?auto_2073880 ?auto_2073885 ) ( CLEAR ?auto_2073880 ) ( not ( = ?auto_2073880 ?auto_2073885 ) ) ( not ( = ?auto_2073881 ?auto_2073885 ) ) ( not ( = ?auto_2073879 ?auto_2073885 ) ) ( not ( = ?auto_2073884 ?auto_2073885 ) ) ( TRUCK-AT ?auto_2073883 ?auto_2073882 ) ( ON ?auto_2073869 ?auto_2073868 ) ( ON ?auto_2073870 ?auto_2073869 ) ( ON ?auto_2073872 ?auto_2073870 ) ( ON ?auto_2073871 ?auto_2073872 ) ( ON ?auto_2073873 ?auto_2073871 ) ( ON ?auto_2073874 ?auto_2073873 ) ( ON ?auto_2073875 ?auto_2073874 ) ( ON ?auto_2073876 ?auto_2073875 ) ( ON ?auto_2073877 ?auto_2073876 ) ( ON ?auto_2073878 ?auto_2073877 ) ( ON ?auto_2073879 ?auto_2073878 ) ( not ( = ?auto_2073868 ?auto_2073869 ) ) ( not ( = ?auto_2073868 ?auto_2073870 ) ) ( not ( = ?auto_2073868 ?auto_2073872 ) ) ( not ( = ?auto_2073868 ?auto_2073871 ) ) ( not ( = ?auto_2073868 ?auto_2073873 ) ) ( not ( = ?auto_2073868 ?auto_2073874 ) ) ( not ( = ?auto_2073868 ?auto_2073875 ) ) ( not ( = ?auto_2073868 ?auto_2073876 ) ) ( not ( = ?auto_2073868 ?auto_2073877 ) ) ( not ( = ?auto_2073868 ?auto_2073878 ) ) ( not ( = ?auto_2073868 ?auto_2073879 ) ) ( not ( = ?auto_2073868 ?auto_2073880 ) ) ( not ( = ?auto_2073868 ?auto_2073881 ) ) ( not ( = ?auto_2073868 ?auto_2073884 ) ) ( not ( = ?auto_2073868 ?auto_2073885 ) ) ( not ( = ?auto_2073869 ?auto_2073870 ) ) ( not ( = ?auto_2073869 ?auto_2073872 ) ) ( not ( = ?auto_2073869 ?auto_2073871 ) ) ( not ( = ?auto_2073869 ?auto_2073873 ) ) ( not ( = ?auto_2073869 ?auto_2073874 ) ) ( not ( = ?auto_2073869 ?auto_2073875 ) ) ( not ( = ?auto_2073869 ?auto_2073876 ) ) ( not ( = ?auto_2073869 ?auto_2073877 ) ) ( not ( = ?auto_2073869 ?auto_2073878 ) ) ( not ( = ?auto_2073869 ?auto_2073879 ) ) ( not ( = ?auto_2073869 ?auto_2073880 ) ) ( not ( = ?auto_2073869 ?auto_2073881 ) ) ( not ( = ?auto_2073869 ?auto_2073884 ) ) ( not ( = ?auto_2073869 ?auto_2073885 ) ) ( not ( = ?auto_2073870 ?auto_2073872 ) ) ( not ( = ?auto_2073870 ?auto_2073871 ) ) ( not ( = ?auto_2073870 ?auto_2073873 ) ) ( not ( = ?auto_2073870 ?auto_2073874 ) ) ( not ( = ?auto_2073870 ?auto_2073875 ) ) ( not ( = ?auto_2073870 ?auto_2073876 ) ) ( not ( = ?auto_2073870 ?auto_2073877 ) ) ( not ( = ?auto_2073870 ?auto_2073878 ) ) ( not ( = ?auto_2073870 ?auto_2073879 ) ) ( not ( = ?auto_2073870 ?auto_2073880 ) ) ( not ( = ?auto_2073870 ?auto_2073881 ) ) ( not ( = ?auto_2073870 ?auto_2073884 ) ) ( not ( = ?auto_2073870 ?auto_2073885 ) ) ( not ( = ?auto_2073872 ?auto_2073871 ) ) ( not ( = ?auto_2073872 ?auto_2073873 ) ) ( not ( = ?auto_2073872 ?auto_2073874 ) ) ( not ( = ?auto_2073872 ?auto_2073875 ) ) ( not ( = ?auto_2073872 ?auto_2073876 ) ) ( not ( = ?auto_2073872 ?auto_2073877 ) ) ( not ( = ?auto_2073872 ?auto_2073878 ) ) ( not ( = ?auto_2073872 ?auto_2073879 ) ) ( not ( = ?auto_2073872 ?auto_2073880 ) ) ( not ( = ?auto_2073872 ?auto_2073881 ) ) ( not ( = ?auto_2073872 ?auto_2073884 ) ) ( not ( = ?auto_2073872 ?auto_2073885 ) ) ( not ( = ?auto_2073871 ?auto_2073873 ) ) ( not ( = ?auto_2073871 ?auto_2073874 ) ) ( not ( = ?auto_2073871 ?auto_2073875 ) ) ( not ( = ?auto_2073871 ?auto_2073876 ) ) ( not ( = ?auto_2073871 ?auto_2073877 ) ) ( not ( = ?auto_2073871 ?auto_2073878 ) ) ( not ( = ?auto_2073871 ?auto_2073879 ) ) ( not ( = ?auto_2073871 ?auto_2073880 ) ) ( not ( = ?auto_2073871 ?auto_2073881 ) ) ( not ( = ?auto_2073871 ?auto_2073884 ) ) ( not ( = ?auto_2073871 ?auto_2073885 ) ) ( not ( = ?auto_2073873 ?auto_2073874 ) ) ( not ( = ?auto_2073873 ?auto_2073875 ) ) ( not ( = ?auto_2073873 ?auto_2073876 ) ) ( not ( = ?auto_2073873 ?auto_2073877 ) ) ( not ( = ?auto_2073873 ?auto_2073878 ) ) ( not ( = ?auto_2073873 ?auto_2073879 ) ) ( not ( = ?auto_2073873 ?auto_2073880 ) ) ( not ( = ?auto_2073873 ?auto_2073881 ) ) ( not ( = ?auto_2073873 ?auto_2073884 ) ) ( not ( = ?auto_2073873 ?auto_2073885 ) ) ( not ( = ?auto_2073874 ?auto_2073875 ) ) ( not ( = ?auto_2073874 ?auto_2073876 ) ) ( not ( = ?auto_2073874 ?auto_2073877 ) ) ( not ( = ?auto_2073874 ?auto_2073878 ) ) ( not ( = ?auto_2073874 ?auto_2073879 ) ) ( not ( = ?auto_2073874 ?auto_2073880 ) ) ( not ( = ?auto_2073874 ?auto_2073881 ) ) ( not ( = ?auto_2073874 ?auto_2073884 ) ) ( not ( = ?auto_2073874 ?auto_2073885 ) ) ( not ( = ?auto_2073875 ?auto_2073876 ) ) ( not ( = ?auto_2073875 ?auto_2073877 ) ) ( not ( = ?auto_2073875 ?auto_2073878 ) ) ( not ( = ?auto_2073875 ?auto_2073879 ) ) ( not ( = ?auto_2073875 ?auto_2073880 ) ) ( not ( = ?auto_2073875 ?auto_2073881 ) ) ( not ( = ?auto_2073875 ?auto_2073884 ) ) ( not ( = ?auto_2073875 ?auto_2073885 ) ) ( not ( = ?auto_2073876 ?auto_2073877 ) ) ( not ( = ?auto_2073876 ?auto_2073878 ) ) ( not ( = ?auto_2073876 ?auto_2073879 ) ) ( not ( = ?auto_2073876 ?auto_2073880 ) ) ( not ( = ?auto_2073876 ?auto_2073881 ) ) ( not ( = ?auto_2073876 ?auto_2073884 ) ) ( not ( = ?auto_2073876 ?auto_2073885 ) ) ( not ( = ?auto_2073877 ?auto_2073878 ) ) ( not ( = ?auto_2073877 ?auto_2073879 ) ) ( not ( = ?auto_2073877 ?auto_2073880 ) ) ( not ( = ?auto_2073877 ?auto_2073881 ) ) ( not ( = ?auto_2073877 ?auto_2073884 ) ) ( not ( = ?auto_2073877 ?auto_2073885 ) ) ( not ( = ?auto_2073878 ?auto_2073879 ) ) ( not ( = ?auto_2073878 ?auto_2073880 ) ) ( not ( = ?auto_2073878 ?auto_2073881 ) ) ( not ( = ?auto_2073878 ?auto_2073884 ) ) ( not ( = ?auto_2073878 ?auto_2073885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073879 ?auto_2073880 ?auto_2073881 )
      ( MAKE-13CRATE-VERIFY ?auto_2073868 ?auto_2073869 ?auto_2073870 ?auto_2073872 ?auto_2073871 ?auto_2073873 ?auto_2073874 ?auto_2073875 ?auto_2073876 ?auto_2073877 ?auto_2073878 ?auto_2073879 ?auto_2073880 ?auto_2073881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2073889 - SURFACE
      ?auto_2073890 - SURFACE
    )
    :vars
    (
      ?auto_2073897 - HOIST
      ?auto_2073892 - PLACE
      ?auto_2073891 - SURFACE
      ?auto_2073896 - PLACE
      ?auto_2073898 - HOIST
      ?auto_2073894 - SURFACE
      ?auto_2073895 - SURFACE
      ?auto_2073893 - TRUCK
      ?auto_2073899 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073897 ?auto_2073892 ) ( IS-CRATE ?auto_2073890 ) ( not ( = ?auto_2073889 ?auto_2073890 ) ) ( not ( = ?auto_2073891 ?auto_2073889 ) ) ( not ( = ?auto_2073891 ?auto_2073890 ) ) ( not ( = ?auto_2073896 ?auto_2073892 ) ) ( HOIST-AT ?auto_2073898 ?auto_2073896 ) ( not ( = ?auto_2073897 ?auto_2073898 ) ) ( SURFACE-AT ?auto_2073890 ?auto_2073896 ) ( ON ?auto_2073890 ?auto_2073894 ) ( CLEAR ?auto_2073890 ) ( not ( = ?auto_2073889 ?auto_2073894 ) ) ( not ( = ?auto_2073890 ?auto_2073894 ) ) ( not ( = ?auto_2073891 ?auto_2073894 ) ) ( IS-CRATE ?auto_2073889 ) ( AVAILABLE ?auto_2073898 ) ( SURFACE-AT ?auto_2073889 ?auto_2073896 ) ( ON ?auto_2073889 ?auto_2073895 ) ( CLEAR ?auto_2073889 ) ( not ( = ?auto_2073889 ?auto_2073895 ) ) ( not ( = ?auto_2073890 ?auto_2073895 ) ) ( not ( = ?auto_2073891 ?auto_2073895 ) ) ( not ( = ?auto_2073894 ?auto_2073895 ) ) ( TRUCK-AT ?auto_2073893 ?auto_2073892 ) ( SURFACE-AT ?auto_2073899 ?auto_2073892 ) ( CLEAR ?auto_2073899 ) ( LIFTING ?auto_2073897 ?auto_2073891 ) ( IS-CRATE ?auto_2073891 ) ( not ( = ?auto_2073899 ?auto_2073891 ) ) ( not ( = ?auto_2073889 ?auto_2073899 ) ) ( not ( = ?auto_2073890 ?auto_2073899 ) ) ( not ( = ?auto_2073894 ?auto_2073899 ) ) ( not ( = ?auto_2073895 ?auto_2073899 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073899 ?auto_2073891 )
      ( MAKE-2CRATE ?auto_2073891 ?auto_2073889 ?auto_2073890 )
      ( MAKE-1CRATE-VERIFY ?auto_2073889 ?auto_2073890 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2073900 - SURFACE
      ?auto_2073901 - SURFACE
      ?auto_2073902 - SURFACE
    )
    :vars
    (
      ?auto_2073906 - HOIST
      ?auto_2073904 - PLACE
      ?auto_2073908 - PLACE
      ?auto_2073910 - HOIST
      ?auto_2073909 - SURFACE
      ?auto_2073907 - SURFACE
      ?auto_2073905 - TRUCK
      ?auto_2073903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073906 ?auto_2073904 ) ( IS-CRATE ?auto_2073902 ) ( not ( = ?auto_2073901 ?auto_2073902 ) ) ( not ( = ?auto_2073900 ?auto_2073901 ) ) ( not ( = ?auto_2073900 ?auto_2073902 ) ) ( not ( = ?auto_2073908 ?auto_2073904 ) ) ( HOIST-AT ?auto_2073910 ?auto_2073908 ) ( not ( = ?auto_2073906 ?auto_2073910 ) ) ( SURFACE-AT ?auto_2073902 ?auto_2073908 ) ( ON ?auto_2073902 ?auto_2073909 ) ( CLEAR ?auto_2073902 ) ( not ( = ?auto_2073901 ?auto_2073909 ) ) ( not ( = ?auto_2073902 ?auto_2073909 ) ) ( not ( = ?auto_2073900 ?auto_2073909 ) ) ( IS-CRATE ?auto_2073901 ) ( AVAILABLE ?auto_2073910 ) ( SURFACE-AT ?auto_2073901 ?auto_2073908 ) ( ON ?auto_2073901 ?auto_2073907 ) ( CLEAR ?auto_2073901 ) ( not ( = ?auto_2073901 ?auto_2073907 ) ) ( not ( = ?auto_2073902 ?auto_2073907 ) ) ( not ( = ?auto_2073900 ?auto_2073907 ) ) ( not ( = ?auto_2073909 ?auto_2073907 ) ) ( TRUCK-AT ?auto_2073905 ?auto_2073904 ) ( SURFACE-AT ?auto_2073903 ?auto_2073904 ) ( CLEAR ?auto_2073903 ) ( LIFTING ?auto_2073906 ?auto_2073900 ) ( IS-CRATE ?auto_2073900 ) ( not ( = ?auto_2073903 ?auto_2073900 ) ) ( not ( = ?auto_2073901 ?auto_2073903 ) ) ( not ( = ?auto_2073902 ?auto_2073903 ) ) ( not ( = ?auto_2073909 ?auto_2073903 ) ) ( not ( = ?auto_2073907 ?auto_2073903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2073901 ?auto_2073902 )
      ( MAKE-2CRATE-VERIFY ?auto_2073900 ?auto_2073901 ?auto_2073902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2073911 - SURFACE
      ?auto_2073912 - SURFACE
      ?auto_2073913 - SURFACE
      ?auto_2073914 - SURFACE
    )
    :vars
    (
      ?auto_2073919 - HOIST
      ?auto_2073917 - PLACE
      ?auto_2073916 - PLACE
      ?auto_2073921 - HOIST
      ?auto_2073920 - SURFACE
      ?auto_2073915 - SURFACE
      ?auto_2073918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073919 ?auto_2073917 ) ( IS-CRATE ?auto_2073914 ) ( not ( = ?auto_2073913 ?auto_2073914 ) ) ( not ( = ?auto_2073912 ?auto_2073913 ) ) ( not ( = ?auto_2073912 ?auto_2073914 ) ) ( not ( = ?auto_2073916 ?auto_2073917 ) ) ( HOIST-AT ?auto_2073921 ?auto_2073916 ) ( not ( = ?auto_2073919 ?auto_2073921 ) ) ( SURFACE-AT ?auto_2073914 ?auto_2073916 ) ( ON ?auto_2073914 ?auto_2073920 ) ( CLEAR ?auto_2073914 ) ( not ( = ?auto_2073913 ?auto_2073920 ) ) ( not ( = ?auto_2073914 ?auto_2073920 ) ) ( not ( = ?auto_2073912 ?auto_2073920 ) ) ( IS-CRATE ?auto_2073913 ) ( AVAILABLE ?auto_2073921 ) ( SURFACE-AT ?auto_2073913 ?auto_2073916 ) ( ON ?auto_2073913 ?auto_2073915 ) ( CLEAR ?auto_2073913 ) ( not ( = ?auto_2073913 ?auto_2073915 ) ) ( not ( = ?auto_2073914 ?auto_2073915 ) ) ( not ( = ?auto_2073912 ?auto_2073915 ) ) ( not ( = ?auto_2073920 ?auto_2073915 ) ) ( TRUCK-AT ?auto_2073918 ?auto_2073917 ) ( SURFACE-AT ?auto_2073911 ?auto_2073917 ) ( CLEAR ?auto_2073911 ) ( LIFTING ?auto_2073919 ?auto_2073912 ) ( IS-CRATE ?auto_2073912 ) ( not ( = ?auto_2073911 ?auto_2073912 ) ) ( not ( = ?auto_2073913 ?auto_2073911 ) ) ( not ( = ?auto_2073914 ?auto_2073911 ) ) ( not ( = ?auto_2073920 ?auto_2073911 ) ) ( not ( = ?auto_2073915 ?auto_2073911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073912 ?auto_2073913 ?auto_2073914 )
      ( MAKE-3CRATE-VERIFY ?auto_2073911 ?auto_2073912 ?auto_2073913 ?auto_2073914 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2073922 - SURFACE
      ?auto_2073923 - SURFACE
      ?auto_2073924 - SURFACE
      ?auto_2073926 - SURFACE
      ?auto_2073925 - SURFACE
    )
    :vars
    (
      ?auto_2073931 - HOIST
      ?auto_2073929 - PLACE
      ?auto_2073928 - PLACE
      ?auto_2073933 - HOIST
      ?auto_2073932 - SURFACE
      ?auto_2073927 - SURFACE
      ?auto_2073930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073931 ?auto_2073929 ) ( IS-CRATE ?auto_2073925 ) ( not ( = ?auto_2073926 ?auto_2073925 ) ) ( not ( = ?auto_2073924 ?auto_2073926 ) ) ( not ( = ?auto_2073924 ?auto_2073925 ) ) ( not ( = ?auto_2073928 ?auto_2073929 ) ) ( HOIST-AT ?auto_2073933 ?auto_2073928 ) ( not ( = ?auto_2073931 ?auto_2073933 ) ) ( SURFACE-AT ?auto_2073925 ?auto_2073928 ) ( ON ?auto_2073925 ?auto_2073932 ) ( CLEAR ?auto_2073925 ) ( not ( = ?auto_2073926 ?auto_2073932 ) ) ( not ( = ?auto_2073925 ?auto_2073932 ) ) ( not ( = ?auto_2073924 ?auto_2073932 ) ) ( IS-CRATE ?auto_2073926 ) ( AVAILABLE ?auto_2073933 ) ( SURFACE-AT ?auto_2073926 ?auto_2073928 ) ( ON ?auto_2073926 ?auto_2073927 ) ( CLEAR ?auto_2073926 ) ( not ( = ?auto_2073926 ?auto_2073927 ) ) ( not ( = ?auto_2073925 ?auto_2073927 ) ) ( not ( = ?auto_2073924 ?auto_2073927 ) ) ( not ( = ?auto_2073932 ?auto_2073927 ) ) ( TRUCK-AT ?auto_2073930 ?auto_2073929 ) ( SURFACE-AT ?auto_2073923 ?auto_2073929 ) ( CLEAR ?auto_2073923 ) ( LIFTING ?auto_2073931 ?auto_2073924 ) ( IS-CRATE ?auto_2073924 ) ( not ( = ?auto_2073923 ?auto_2073924 ) ) ( not ( = ?auto_2073926 ?auto_2073923 ) ) ( not ( = ?auto_2073925 ?auto_2073923 ) ) ( not ( = ?auto_2073932 ?auto_2073923 ) ) ( not ( = ?auto_2073927 ?auto_2073923 ) ) ( ON ?auto_2073923 ?auto_2073922 ) ( not ( = ?auto_2073922 ?auto_2073923 ) ) ( not ( = ?auto_2073922 ?auto_2073924 ) ) ( not ( = ?auto_2073922 ?auto_2073926 ) ) ( not ( = ?auto_2073922 ?auto_2073925 ) ) ( not ( = ?auto_2073922 ?auto_2073932 ) ) ( not ( = ?auto_2073922 ?auto_2073927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073924 ?auto_2073926 ?auto_2073925 )
      ( MAKE-4CRATE-VERIFY ?auto_2073922 ?auto_2073923 ?auto_2073924 ?auto_2073926 ?auto_2073925 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2073934 - SURFACE
      ?auto_2073935 - SURFACE
      ?auto_2073936 - SURFACE
      ?auto_2073938 - SURFACE
      ?auto_2073937 - SURFACE
      ?auto_2073939 - SURFACE
    )
    :vars
    (
      ?auto_2073944 - HOIST
      ?auto_2073942 - PLACE
      ?auto_2073941 - PLACE
      ?auto_2073946 - HOIST
      ?auto_2073945 - SURFACE
      ?auto_2073940 - SURFACE
      ?auto_2073943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073944 ?auto_2073942 ) ( IS-CRATE ?auto_2073939 ) ( not ( = ?auto_2073937 ?auto_2073939 ) ) ( not ( = ?auto_2073938 ?auto_2073937 ) ) ( not ( = ?auto_2073938 ?auto_2073939 ) ) ( not ( = ?auto_2073941 ?auto_2073942 ) ) ( HOIST-AT ?auto_2073946 ?auto_2073941 ) ( not ( = ?auto_2073944 ?auto_2073946 ) ) ( SURFACE-AT ?auto_2073939 ?auto_2073941 ) ( ON ?auto_2073939 ?auto_2073945 ) ( CLEAR ?auto_2073939 ) ( not ( = ?auto_2073937 ?auto_2073945 ) ) ( not ( = ?auto_2073939 ?auto_2073945 ) ) ( not ( = ?auto_2073938 ?auto_2073945 ) ) ( IS-CRATE ?auto_2073937 ) ( AVAILABLE ?auto_2073946 ) ( SURFACE-AT ?auto_2073937 ?auto_2073941 ) ( ON ?auto_2073937 ?auto_2073940 ) ( CLEAR ?auto_2073937 ) ( not ( = ?auto_2073937 ?auto_2073940 ) ) ( not ( = ?auto_2073939 ?auto_2073940 ) ) ( not ( = ?auto_2073938 ?auto_2073940 ) ) ( not ( = ?auto_2073945 ?auto_2073940 ) ) ( TRUCK-AT ?auto_2073943 ?auto_2073942 ) ( SURFACE-AT ?auto_2073936 ?auto_2073942 ) ( CLEAR ?auto_2073936 ) ( LIFTING ?auto_2073944 ?auto_2073938 ) ( IS-CRATE ?auto_2073938 ) ( not ( = ?auto_2073936 ?auto_2073938 ) ) ( not ( = ?auto_2073937 ?auto_2073936 ) ) ( not ( = ?auto_2073939 ?auto_2073936 ) ) ( not ( = ?auto_2073945 ?auto_2073936 ) ) ( not ( = ?auto_2073940 ?auto_2073936 ) ) ( ON ?auto_2073935 ?auto_2073934 ) ( ON ?auto_2073936 ?auto_2073935 ) ( not ( = ?auto_2073934 ?auto_2073935 ) ) ( not ( = ?auto_2073934 ?auto_2073936 ) ) ( not ( = ?auto_2073934 ?auto_2073938 ) ) ( not ( = ?auto_2073934 ?auto_2073937 ) ) ( not ( = ?auto_2073934 ?auto_2073939 ) ) ( not ( = ?auto_2073934 ?auto_2073945 ) ) ( not ( = ?auto_2073934 ?auto_2073940 ) ) ( not ( = ?auto_2073935 ?auto_2073936 ) ) ( not ( = ?auto_2073935 ?auto_2073938 ) ) ( not ( = ?auto_2073935 ?auto_2073937 ) ) ( not ( = ?auto_2073935 ?auto_2073939 ) ) ( not ( = ?auto_2073935 ?auto_2073945 ) ) ( not ( = ?auto_2073935 ?auto_2073940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073938 ?auto_2073937 ?auto_2073939 )
      ( MAKE-5CRATE-VERIFY ?auto_2073934 ?auto_2073935 ?auto_2073936 ?auto_2073938 ?auto_2073937 ?auto_2073939 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2073947 - SURFACE
      ?auto_2073948 - SURFACE
      ?auto_2073949 - SURFACE
      ?auto_2073951 - SURFACE
      ?auto_2073950 - SURFACE
      ?auto_2073952 - SURFACE
      ?auto_2073953 - SURFACE
    )
    :vars
    (
      ?auto_2073958 - HOIST
      ?auto_2073956 - PLACE
      ?auto_2073955 - PLACE
      ?auto_2073960 - HOIST
      ?auto_2073959 - SURFACE
      ?auto_2073954 - SURFACE
      ?auto_2073957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073958 ?auto_2073956 ) ( IS-CRATE ?auto_2073953 ) ( not ( = ?auto_2073952 ?auto_2073953 ) ) ( not ( = ?auto_2073950 ?auto_2073952 ) ) ( not ( = ?auto_2073950 ?auto_2073953 ) ) ( not ( = ?auto_2073955 ?auto_2073956 ) ) ( HOIST-AT ?auto_2073960 ?auto_2073955 ) ( not ( = ?auto_2073958 ?auto_2073960 ) ) ( SURFACE-AT ?auto_2073953 ?auto_2073955 ) ( ON ?auto_2073953 ?auto_2073959 ) ( CLEAR ?auto_2073953 ) ( not ( = ?auto_2073952 ?auto_2073959 ) ) ( not ( = ?auto_2073953 ?auto_2073959 ) ) ( not ( = ?auto_2073950 ?auto_2073959 ) ) ( IS-CRATE ?auto_2073952 ) ( AVAILABLE ?auto_2073960 ) ( SURFACE-AT ?auto_2073952 ?auto_2073955 ) ( ON ?auto_2073952 ?auto_2073954 ) ( CLEAR ?auto_2073952 ) ( not ( = ?auto_2073952 ?auto_2073954 ) ) ( not ( = ?auto_2073953 ?auto_2073954 ) ) ( not ( = ?auto_2073950 ?auto_2073954 ) ) ( not ( = ?auto_2073959 ?auto_2073954 ) ) ( TRUCK-AT ?auto_2073957 ?auto_2073956 ) ( SURFACE-AT ?auto_2073951 ?auto_2073956 ) ( CLEAR ?auto_2073951 ) ( LIFTING ?auto_2073958 ?auto_2073950 ) ( IS-CRATE ?auto_2073950 ) ( not ( = ?auto_2073951 ?auto_2073950 ) ) ( not ( = ?auto_2073952 ?auto_2073951 ) ) ( not ( = ?auto_2073953 ?auto_2073951 ) ) ( not ( = ?auto_2073959 ?auto_2073951 ) ) ( not ( = ?auto_2073954 ?auto_2073951 ) ) ( ON ?auto_2073948 ?auto_2073947 ) ( ON ?auto_2073949 ?auto_2073948 ) ( ON ?auto_2073951 ?auto_2073949 ) ( not ( = ?auto_2073947 ?auto_2073948 ) ) ( not ( = ?auto_2073947 ?auto_2073949 ) ) ( not ( = ?auto_2073947 ?auto_2073951 ) ) ( not ( = ?auto_2073947 ?auto_2073950 ) ) ( not ( = ?auto_2073947 ?auto_2073952 ) ) ( not ( = ?auto_2073947 ?auto_2073953 ) ) ( not ( = ?auto_2073947 ?auto_2073959 ) ) ( not ( = ?auto_2073947 ?auto_2073954 ) ) ( not ( = ?auto_2073948 ?auto_2073949 ) ) ( not ( = ?auto_2073948 ?auto_2073951 ) ) ( not ( = ?auto_2073948 ?auto_2073950 ) ) ( not ( = ?auto_2073948 ?auto_2073952 ) ) ( not ( = ?auto_2073948 ?auto_2073953 ) ) ( not ( = ?auto_2073948 ?auto_2073959 ) ) ( not ( = ?auto_2073948 ?auto_2073954 ) ) ( not ( = ?auto_2073949 ?auto_2073951 ) ) ( not ( = ?auto_2073949 ?auto_2073950 ) ) ( not ( = ?auto_2073949 ?auto_2073952 ) ) ( not ( = ?auto_2073949 ?auto_2073953 ) ) ( not ( = ?auto_2073949 ?auto_2073959 ) ) ( not ( = ?auto_2073949 ?auto_2073954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073950 ?auto_2073952 ?auto_2073953 )
      ( MAKE-6CRATE-VERIFY ?auto_2073947 ?auto_2073948 ?auto_2073949 ?auto_2073951 ?auto_2073950 ?auto_2073952 ?auto_2073953 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2073961 - SURFACE
      ?auto_2073962 - SURFACE
      ?auto_2073963 - SURFACE
      ?auto_2073965 - SURFACE
      ?auto_2073964 - SURFACE
      ?auto_2073966 - SURFACE
      ?auto_2073967 - SURFACE
      ?auto_2073968 - SURFACE
    )
    :vars
    (
      ?auto_2073973 - HOIST
      ?auto_2073971 - PLACE
      ?auto_2073970 - PLACE
      ?auto_2073975 - HOIST
      ?auto_2073974 - SURFACE
      ?auto_2073969 - SURFACE
      ?auto_2073972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073973 ?auto_2073971 ) ( IS-CRATE ?auto_2073968 ) ( not ( = ?auto_2073967 ?auto_2073968 ) ) ( not ( = ?auto_2073966 ?auto_2073967 ) ) ( not ( = ?auto_2073966 ?auto_2073968 ) ) ( not ( = ?auto_2073970 ?auto_2073971 ) ) ( HOIST-AT ?auto_2073975 ?auto_2073970 ) ( not ( = ?auto_2073973 ?auto_2073975 ) ) ( SURFACE-AT ?auto_2073968 ?auto_2073970 ) ( ON ?auto_2073968 ?auto_2073974 ) ( CLEAR ?auto_2073968 ) ( not ( = ?auto_2073967 ?auto_2073974 ) ) ( not ( = ?auto_2073968 ?auto_2073974 ) ) ( not ( = ?auto_2073966 ?auto_2073974 ) ) ( IS-CRATE ?auto_2073967 ) ( AVAILABLE ?auto_2073975 ) ( SURFACE-AT ?auto_2073967 ?auto_2073970 ) ( ON ?auto_2073967 ?auto_2073969 ) ( CLEAR ?auto_2073967 ) ( not ( = ?auto_2073967 ?auto_2073969 ) ) ( not ( = ?auto_2073968 ?auto_2073969 ) ) ( not ( = ?auto_2073966 ?auto_2073969 ) ) ( not ( = ?auto_2073974 ?auto_2073969 ) ) ( TRUCK-AT ?auto_2073972 ?auto_2073971 ) ( SURFACE-AT ?auto_2073964 ?auto_2073971 ) ( CLEAR ?auto_2073964 ) ( LIFTING ?auto_2073973 ?auto_2073966 ) ( IS-CRATE ?auto_2073966 ) ( not ( = ?auto_2073964 ?auto_2073966 ) ) ( not ( = ?auto_2073967 ?auto_2073964 ) ) ( not ( = ?auto_2073968 ?auto_2073964 ) ) ( not ( = ?auto_2073974 ?auto_2073964 ) ) ( not ( = ?auto_2073969 ?auto_2073964 ) ) ( ON ?auto_2073962 ?auto_2073961 ) ( ON ?auto_2073963 ?auto_2073962 ) ( ON ?auto_2073965 ?auto_2073963 ) ( ON ?auto_2073964 ?auto_2073965 ) ( not ( = ?auto_2073961 ?auto_2073962 ) ) ( not ( = ?auto_2073961 ?auto_2073963 ) ) ( not ( = ?auto_2073961 ?auto_2073965 ) ) ( not ( = ?auto_2073961 ?auto_2073964 ) ) ( not ( = ?auto_2073961 ?auto_2073966 ) ) ( not ( = ?auto_2073961 ?auto_2073967 ) ) ( not ( = ?auto_2073961 ?auto_2073968 ) ) ( not ( = ?auto_2073961 ?auto_2073974 ) ) ( not ( = ?auto_2073961 ?auto_2073969 ) ) ( not ( = ?auto_2073962 ?auto_2073963 ) ) ( not ( = ?auto_2073962 ?auto_2073965 ) ) ( not ( = ?auto_2073962 ?auto_2073964 ) ) ( not ( = ?auto_2073962 ?auto_2073966 ) ) ( not ( = ?auto_2073962 ?auto_2073967 ) ) ( not ( = ?auto_2073962 ?auto_2073968 ) ) ( not ( = ?auto_2073962 ?auto_2073974 ) ) ( not ( = ?auto_2073962 ?auto_2073969 ) ) ( not ( = ?auto_2073963 ?auto_2073965 ) ) ( not ( = ?auto_2073963 ?auto_2073964 ) ) ( not ( = ?auto_2073963 ?auto_2073966 ) ) ( not ( = ?auto_2073963 ?auto_2073967 ) ) ( not ( = ?auto_2073963 ?auto_2073968 ) ) ( not ( = ?auto_2073963 ?auto_2073974 ) ) ( not ( = ?auto_2073963 ?auto_2073969 ) ) ( not ( = ?auto_2073965 ?auto_2073964 ) ) ( not ( = ?auto_2073965 ?auto_2073966 ) ) ( not ( = ?auto_2073965 ?auto_2073967 ) ) ( not ( = ?auto_2073965 ?auto_2073968 ) ) ( not ( = ?auto_2073965 ?auto_2073974 ) ) ( not ( = ?auto_2073965 ?auto_2073969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073966 ?auto_2073967 ?auto_2073968 )
      ( MAKE-7CRATE-VERIFY ?auto_2073961 ?auto_2073962 ?auto_2073963 ?auto_2073965 ?auto_2073964 ?auto_2073966 ?auto_2073967 ?auto_2073968 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2073976 - SURFACE
      ?auto_2073977 - SURFACE
      ?auto_2073978 - SURFACE
      ?auto_2073980 - SURFACE
      ?auto_2073979 - SURFACE
      ?auto_2073981 - SURFACE
      ?auto_2073982 - SURFACE
      ?auto_2073983 - SURFACE
      ?auto_2073984 - SURFACE
    )
    :vars
    (
      ?auto_2073989 - HOIST
      ?auto_2073987 - PLACE
      ?auto_2073986 - PLACE
      ?auto_2073991 - HOIST
      ?auto_2073990 - SURFACE
      ?auto_2073985 - SURFACE
      ?auto_2073988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073989 ?auto_2073987 ) ( IS-CRATE ?auto_2073984 ) ( not ( = ?auto_2073983 ?auto_2073984 ) ) ( not ( = ?auto_2073982 ?auto_2073983 ) ) ( not ( = ?auto_2073982 ?auto_2073984 ) ) ( not ( = ?auto_2073986 ?auto_2073987 ) ) ( HOIST-AT ?auto_2073991 ?auto_2073986 ) ( not ( = ?auto_2073989 ?auto_2073991 ) ) ( SURFACE-AT ?auto_2073984 ?auto_2073986 ) ( ON ?auto_2073984 ?auto_2073990 ) ( CLEAR ?auto_2073984 ) ( not ( = ?auto_2073983 ?auto_2073990 ) ) ( not ( = ?auto_2073984 ?auto_2073990 ) ) ( not ( = ?auto_2073982 ?auto_2073990 ) ) ( IS-CRATE ?auto_2073983 ) ( AVAILABLE ?auto_2073991 ) ( SURFACE-AT ?auto_2073983 ?auto_2073986 ) ( ON ?auto_2073983 ?auto_2073985 ) ( CLEAR ?auto_2073983 ) ( not ( = ?auto_2073983 ?auto_2073985 ) ) ( not ( = ?auto_2073984 ?auto_2073985 ) ) ( not ( = ?auto_2073982 ?auto_2073985 ) ) ( not ( = ?auto_2073990 ?auto_2073985 ) ) ( TRUCK-AT ?auto_2073988 ?auto_2073987 ) ( SURFACE-AT ?auto_2073981 ?auto_2073987 ) ( CLEAR ?auto_2073981 ) ( LIFTING ?auto_2073989 ?auto_2073982 ) ( IS-CRATE ?auto_2073982 ) ( not ( = ?auto_2073981 ?auto_2073982 ) ) ( not ( = ?auto_2073983 ?auto_2073981 ) ) ( not ( = ?auto_2073984 ?auto_2073981 ) ) ( not ( = ?auto_2073990 ?auto_2073981 ) ) ( not ( = ?auto_2073985 ?auto_2073981 ) ) ( ON ?auto_2073977 ?auto_2073976 ) ( ON ?auto_2073978 ?auto_2073977 ) ( ON ?auto_2073980 ?auto_2073978 ) ( ON ?auto_2073979 ?auto_2073980 ) ( ON ?auto_2073981 ?auto_2073979 ) ( not ( = ?auto_2073976 ?auto_2073977 ) ) ( not ( = ?auto_2073976 ?auto_2073978 ) ) ( not ( = ?auto_2073976 ?auto_2073980 ) ) ( not ( = ?auto_2073976 ?auto_2073979 ) ) ( not ( = ?auto_2073976 ?auto_2073981 ) ) ( not ( = ?auto_2073976 ?auto_2073982 ) ) ( not ( = ?auto_2073976 ?auto_2073983 ) ) ( not ( = ?auto_2073976 ?auto_2073984 ) ) ( not ( = ?auto_2073976 ?auto_2073990 ) ) ( not ( = ?auto_2073976 ?auto_2073985 ) ) ( not ( = ?auto_2073977 ?auto_2073978 ) ) ( not ( = ?auto_2073977 ?auto_2073980 ) ) ( not ( = ?auto_2073977 ?auto_2073979 ) ) ( not ( = ?auto_2073977 ?auto_2073981 ) ) ( not ( = ?auto_2073977 ?auto_2073982 ) ) ( not ( = ?auto_2073977 ?auto_2073983 ) ) ( not ( = ?auto_2073977 ?auto_2073984 ) ) ( not ( = ?auto_2073977 ?auto_2073990 ) ) ( not ( = ?auto_2073977 ?auto_2073985 ) ) ( not ( = ?auto_2073978 ?auto_2073980 ) ) ( not ( = ?auto_2073978 ?auto_2073979 ) ) ( not ( = ?auto_2073978 ?auto_2073981 ) ) ( not ( = ?auto_2073978 ?auto_2073982 ) ) ( not ( = ?auto_2073978 ?auto_2073983 ) ) ( not ( = ?auto_2073978 ?auto_2073984 ) ) ( not ( = ?auto_2073978 ?auto_2073990 ) ) ( not ( = ?auto_2073978 ?auto_2073985 ) ) ( not ( = ?auto_2073980 ?auto_2073979 ) ) ( not ( = ?auto_2073980 ?auto_2073981 ) ) ( not ( = ?auto_2073980 ?auto_2073982 ) ) ( not ( = ?auto_2073980 ?auto_2073983 ) ) ( not ( = ?auto_2073980 ?auto_2073984 ) ) ( not ( = ?auto_2073980 ?auto_2073990 ) ) ( not ( = ?auto_2073980 ?auto_2073985 ) ) ( not ( = ?auto_2073979 ?auto_2073981 ) ) ( not ( = ?auto_2073979 ?auto_2073982 ) ) ( not ( = ?auto_2073979 ?auto_2073983 ) ) ( not ( = ?auto_2073979 ?auto_2073984 ) ) ( not ( = ?auto_2073979 ?auto_2073990 ) ) ( not ( = ?auto_2073979 ?auto_2073985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073982 ?auto_2073983 ?auto_2073984 )
      ( MAKE-8CRATE-VERIFY ?auto_2073976 ?auto_2073977 ?auto_2073978 ?auto_2073980 ?auto_2073979 ?auto_2073981 ?auto_2073982 ?auto_2073983 ?auto_2073984 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2073992 - SURFACE
      ?auto_2073993 - SURFACE
      ?auto_2073994 - SURFACE
      ?auto_2073996 - SURFACE
      ?auto_2073995 - SURFACE
      ?auto_2073997 - SURFACE
      ?auto_2073998 - SURFACE
      ?auto_2073999 - SURFACE
      ?auto_2074000 - SURFACE
      ?auto_2074001 - SURFACE
    )
    :vars
    (
      ?auto_2074006 - HOIST
      ?auto_2074004 - PLACE
      ?auto_2074003 - PLACE
      ?auto_2074008 - HOIST
      ?auto_2074007 - SURFACE
      ?auto_2074002 - SURFACE
      ?auto_2074005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074006 ?auto_2074004 ) ( IS-CRATE ?auto_2074001 ) ( not ( = ?auto_2074000 ?auto_2074001 ) ) ( not ( = ?auto_2073999 ?auto_2074000 ) ) ( not ( = ?auto_2073999 ?auto_2074001 ) ) ( not ( = ?auto_2074003 ?auto_2074004 ) ) ( HOIST-AT ?auto_2074008 ?auto_2074003 ) ( not ( = ?auto_2074006 ?auto_2074008 ) ) ( SURFACE-AT ?auto_2074001 ?auto_2074003 ) ( ON ?auto_2074001 ?auto_2074007 ) ( CLEAR ?auto_2074001 ) ( not ( = ?auto_2074000 ?auto_2074007 ) ) ( not ( = ?auto_2074001 ?auto_2074007 ) ) ( not ( = ?auto_2073999 ?auto_2074007 ) ) ( IS-CRATE ?auto_2074000 ) ( AVAILABLE ?auto_2074008 ) ( SURFACE-AT ?auto_2074000 ?auto_2074003 ) ( ON ?auto_2074000 ?auto_2074002 ) ( CLEAR ?auto_2074000 ) ( not ( = ?auto_2074000 ?auto_2074002 ) ) ( not ( = ?auto_2074001 ?auto_2074002 ) ) ( not ( = ?auto_2073999 ?auto_2074002 ) ) ( not ( = ?auto_2074007 ?auto_2074002 ) ) ( TRUCK-AT ?auto_2074005 ?auto_2074004 ) ( SURFACE-AT ?auto_2073998 ?auto_2074004 ) ( CLEAR ?auto_2073998 ) ( LIFTING ?auto_2074006 ?auto_2073999 ) ( IS-CRATE ?auto_2073999 ) ( not ( = ?auto_2073998 ?auto_2073999 ) ) ( not ( = ?auto_2074000 ?auto_2073998 ) ) ( not ( = ?auto_2074001 ?auto_2073998 ) ) ( not ( = ?auto_2074007 ?auto_2073998 ) ) ( not ( = ?auto_2074002 ?auto_2073998 ) ) ( ON ?auto_2073993 ?auto_2073992 ) ( ON ?auto_2073994 ?auto_2073993 ) ( ON ?auto_2073996 ?auto_2073994 ) ( ON ?auto_2073995 ?auto_2073996 ) ( ON ?auto_2073997 ?auto_2073995 ) ( ON ?auto_2073998 ?auto_2073997 ) ( not ( = ?auto_2073992 ?auto_2073993 ) ) ( not ( = ?auto_2073992 ?auto_2073994 ) ) ( not ( = ?auto_2073992 ?auto_2073996 ) ) ( not ( = ?auto_2073992 ?auto_2073995 ) ) ( not ( = ?auto_2073992 ?auto_2073997 ) ) ( not ( = ?auto_2073992 ?auto_2073998 ) ) ( not ( = ?auto_2073992 ?auto_2073999 ) ) ( not ( = ?auto_2073992 ?auto_2074000 ) ) ( not ( = ?auto_2073992 ?auto_2074001 ) ) ( not ( = ?auto_2073992 ?auto_2074007 ) ) ( not ( = ?auto_2073992 ?auto_2074002 ) ) ( not ( = ?auto_2073993 ?auto_2073994 ) ) ( not ( = ?auto_2073993 ?auto_2073996 ) ) ( not ( = ?auto_2073993 ?auto_2073995 ) ) ( not ( = ?auto_2073993 ?auto_2073997 ) ) ( not ( = ?auto_2073993 ?auto_2073998 ) ) ( not ( = ?auto_2073993 ?auto_2073999 ) ) ( not ( = ?auto_2073993 ?auto_2074000 ) ) ( not ( = ?auto_2073993 ?auto_2074001 ) ) ( not ( = ?auto_2073993 ?auto_2074007 ) ) ( not ( = ?auto_2073993 ?auto_2074002 ) ) ( not ( = ?auto_2073994 ?auto_2073996 ) ) ( not ( = ?auto_2073994 ?auto_2073995 ) ) ( not ( = ?auto_2073994 ?auto_2073997 ) ) ( not ( = ?auto_2073994 ?auto_2073998 ) ) ( not ( = ?auto_2073994 ?auto_2073999 ) ) ( not ( = ?auto_2073994 ?auto_2074000 ) ) ( not ( = ?auto_2073994 ?auto_2074001 ) ) ( not ( = ?auto_2073994 ?auto_2074007 ) ) ( not ( = ?auto_2073994 ?auto_2074002 ) ) ( not ( = ?auto_2073996 ?auto_2073995 ) ) ( not ( = ?auto_2073996 ?auto_2073997 ) ) ( not ( = ?auto_2073996 ?auto_2073998 ) ) ( not ( = ?auto_2073996 ?auto_2073999 ) ) ( not ( = ?auto_2073996 ?auto_2074000 ) ) ( not ( = ?auto_2073996 ?auto_2074001 ) ) ( not ( = ?auto_2073996 ?auto_2074007 ) ) ( not ( = ?auto_2073996 ?auto_2074002 ) ) ( not ( = ?auto_2073995 ?auto_2073997 ) ) ( not ( = ?auto_2073995 ?auto_2073998 ) ) ( not ( = ?auto_2073995 ?auto_2073999 ) ) ( not ( = ?auto_2073995 ?auto_2074000 ) ) ( not ( = ?auto_2073995 ?auto_2074001 ) ) ( not ( = ?auto_2073995 ?auto_2074007 ) ) ( not ( = ?auto_2073995 ?auto_2074002 ) ) ( not ( = ?auto_2073997 ?auto_2073998 ) ) ( not ( = ?auto_2073997 ?auto_2073999 ) ) ( not ( = ?auto_2073997 ?auto_2074000 ) ) ( not ( = ?auto_2073997 ?auto_2074001 ) ) ( not ( = ?auto_2073997 ?auto_2074007 ) ) ( not ( = ?auto_2073997 ?auto_2074002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073999 ?auto_2074000 ?auto_2074001 )
      ( MAKE-9CRATE-VERIFY ?auto_2073992 ?auto_2073993 ?auto_2073994 ?auto_2073996 ?auto_2073995 ?auto_2073997 ?auto_2073998 ?auto_2073999 ?auto_2074000 ?auto_2074001 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2074009 - SURFACE
      ?auto_2074010 - SURFACE
      ?auto_2074011 - SURFACE
      ?auto_2074013 - SURFACE
      ?auto_2074012 - SURFACE
      ?auto_2074014 - SURFACE
      ?auto_2074015 - SURFACE
      ?auto_2074016 - SURFACE
      ?auto_2074017 - SURFACE
      ?auto_2074018 - SURFACE
      ?auto_2074019 - SURFACE
    )
    :vars
    (
      ?auto_2074024 - HOIST
      ?auto_2074022 - PLACE
      ?auto_2074021 - PLACE
      ?auto_2074026 - HOIST
      ?auto_2074025 - SURFACE
      ?auto_2074020 - SURFACE
      ?auto_2074023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074024 ?auto_2074022 ) ( IS-CRATE ?auto_2074019 ) ( not ( = ?auto_2074018 ?auto_2074019 ) ) ( not ( = ?auto_2074017 ?auto_2074018 ) ) ( not ( = ?auto_2074017 ?auto_2074019 ) ) ( not ( = ?auto_2074021 ?auto_2074022 ) ) ( HOIST-AT ?auto_2074026 ?auto_2074021 ) ( not ( = ?auto_2074024 ?auto_2074026 ) ) ( SURFACE-AT ?auto_2074019 ?auto_2074021 ) ( ON ?auto_2074019 ?auto_2074025 ) ( CLEAR ?auto_2074019 ) ( not ( = ?auto_2074018 ?auto_2074025 ) ) ( not ( = ?auto_2074019 ?auto_2074025 ) ) ( not ( = ?auto_2074017 ?auto_2074025 ) ) ( IS-CRATE ?auto_2074018 ) ( AVAILABLE ?auto_2074026 ) ( SURFACE-AT ?auto_2074018 ?auto_2074021 ) ( ON ?auto_2074018 ?auto_2074020 ) ( CLEAR ?auto_2074018 ) ( not ( = ?auto_2074018 ?auto_2074020 ) ) ( not ( = ?auto_2074019 ?auto_2074020 ) ) ( not ( = ?auto_2074017 ?auto_2074020 ) ) ( not ( = ?auto_2074025 ?auto_2074020 ) ) ( TRUCK-AT ?auto_2074023 ?auto_2074022 ) ( SURFACE-AT ?auto_2074016 ?auto_2074022 ) ( CLEAR ?auto_2074016 ) ( LIFTING ?auto_2074024 ?auto_2074017 ) ( IS-CRATE ?auto_2074017 ) ( not ( = ?auto_2074016 ?auto_2074017 ) ) ( not ( = ?auto_2074018 ?auto_2074016 ) ) ( not ( = ?auto_2074019 ?auto_2074016 ) ) ( not ( = ?auto_2074025 ?auto_2074016 ) ) ( not ( = ?auto_2074020 ?auto_2074016 ) ) ( ON ?auto_2074010 ?auto_2074009 ) ( ON ?auto_2074011 ?auto_2074010 ) ( ON ?auto_2074013 ?auto_2074011 ) ( ON ?auto_2074012 ?auto_2074013 ) ( ON ?auto_2074014 ?auto_2074012 ) ( ON ?auto_2074015 ?auto_2074014 ) ( ON ?auto_2074016 ?auto_2074015 ) ( not ( = ?auto_2074009 ?auto_2074010 ) ) ( not ( = ?auto_2074009 ?auto_2074011 ) ) ( not ( = ?auto_2074009 ?auto_2074013 ) ) ( not ( = ?auto_2074009 ?auto_2074012 ) ) ( not ( = ?auto_2074009 ?auto_2074014 ) ) ( not ( = ?auto_2074009 ?auto_2074015 ) ) ( not ( = ?auto_2074009 ?auto_2074016 ) ) ( not ( = ?auto_2074009 ?auto_2074017 ) ) ( not ( = ?auto_2074009 ?auto_2074018 ) ) ( not ( = ?auto_2074009 ?auto_2074019 ) ) ( not ( = ?auto_2074009 ?auto_2074025 ) ) ( not ( = ?auto_2074009 ?auto_2074020 ) ) ( not ( = ?auto_2074010 ?auto_2074011 ) ) ( not ( = ?auto_2074010 ?auto_2074013 ) ) ( not ( = ?auto_2074010 ?auto_2074012 ) ) ( not ( = ?auto_2074010 ?auto_2074014 ) ) ( not ( = ?auto_2074010 ?auto_2074015 ) ) ( not ( = ?auto_2074010 ?auto_2074016 ) ) ( not ( = ?auto_2074010 ?auto_2074017 ) ) ( not ( = ?auto_2074010 ?auto_2074018 ) ) ( not ( = ?auto_2074010 ?auto_2074019 ) ) ( not ( = ?auto_2074010 ?auto_2074025 ) ) ( not ( = ?auto_2074010 ?auto_2074020 ) ) ( not ( = ?auto_2074011 ?auto_2074013 ) ) ( not ( = ?auto_2074011 ?auto_2074012 ) ) ( not ( = ?auto_2074011 ?auto_2074014 ) ) ( not ( = ?auto_2074011 ?auto_2074015 ) ) ( not ( = ?auto_2074011 ?auto_2074016 ) ) ( not ( = ?auto_2074011 ?auto_2074017 ) ) ( not ( = ?auto_2074011 ?auto_2074018 ) ) ( not ( = ?auto_2074011 ?auto_2074019 ) ) ( not ( = ?auto_2074011 ?auto_2074025 ) ) ( not ( = ?auto_2074011 ?auto_2074020 ) ) ( not ( = ?auto_2074013 ?auto_2074012 ) ) ( not ( = ?auto_2074013 ?auto_2074014 ) ) ( not ( = ?auto_2074013 ?auto_2074015 ) ) ( not ( = ?auto_2074013 ?auto_2074016 ) ) ( not ( = ?auto_2074013 ?auto_2074017 ) ) ( not ( = ?auto_2074013 ?auto_2074018 ) ) ( not ( = ?auto_2074013 ?auto_2074019 ) ) ( not ( = ?auto_2074013 ?auto_2074025 ) ) ( not ( = ?auto_2074013 ?auto_2074020 ) ) ( not ( = ?auto_2074012 ?auto_2074014 ) ) ( not ( = ?auto_2074012 ?auto_2074015 ) ) ( not ( = ?auto_2074012 ?auto_2074016 ) ) ( not ( = ?auto_2074012 ?auto_2074017 ) ) ( not ( = ?auto_2074012 ?auto_2074018 ) ) ( not ( = ?auto_2074012 ?auto_2074019 ) ) ( not ( = ?auto_2074012 ?auto_2074025 ) ) ( not ( = ?auto_2074012 ?auto_2074020 ) ) ( not ( = ?auto_2074014 ?auto_2074015 ) ) ( not ( = ?auto_2074014 ?auto_2074016 ) ) ( not ( = ?auto_2074014 ?auto_2074017 ) ) ( not ( = ?auto_2074014 ?auto_2074018 ) ) ( not ( = ?auto_2074014 ?auto_2074019 ) ) ( not ( = ?auto_2074014 ?auto_2074025 ) ) ( not ( = ?auto_2074014 ?auto_2074020 ) ) ( not ( = ?auto_2074015 ?auto_2074016 ) ) ( not ( = ?auto_2074015 ?auto_2074017 ) ) ( not ( = ?auto_2074015 ?auto_2074018 ) ) ( not ( = ?auto_2074015 ?auto_2074019 ) ) ( not ( = ?auto_2074015 ?auto_2074025 ) ) ( not ( = ?auto_2074015 ?auto_2074020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2074017 ?auto_2074018 ?auto_2074019 )
      ( MAKE-10CRATE-VERIFY ?auto_2074009 ?auto_2074010 ?auto_2074011 ?auto_2074013 ?auto_2074012 ?auto_2074014 ?auto_2074015 ?auto_2074016 ?auto_2074017 ?auto_2074018 ?auto_2074019 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2074027 - SURFACE
      ?auto_2074028 - SURFACE
      ?auto_2074029 - SURFACE
      ?auto_2074031 - SURFACE
      ?auto_2074030 - SURFACE
      ?auto_2074032 - SURFACE
      ?auto_2074033 - SURFACE
      ?auto_2074034 - SURFACE
      ?auto_2074035 - SURFACE
      ?auto_2074036 - SURFACE
      ?auto_2074037 - SURFACE
      ?auto_2074038 - SURFACE
    )
    :vars
    (
      ?auto_2074043 - HOIST
      ?auto_2074041 - PLACE
      ?auto_2074040 - PLACE
      ?auto_2074045 - HOIST
      ?auto_2074044 - SURFACE
      ?auto_2074039 - SURFACE
      ?auto_2074042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074043 ?auto_2074041 ) ( IS-CRATE ?auto_2074038 ) ( not ( = ?auto_2074037 ?auto_2074038 ) ) ( not ( = ?auto_2074036 ?auto_2074037 ) ) ( not ( = ?auto_2074036 ?auto_2074038 ) ) ( not ( = ?auto_2074040 ?auto_2074041 ) ) ( HOIST-AT ?auto_2074045 ?auto_2074040 ) ( not ( = ?auto_2074043 ?auto_2074045 ) ) ( SURFACE-AT ?auto_2074038 ?auto_2074040 ) ( ON ?auto_2074038 ?auto_2074044 ) ( CLEAR ?auto_2074038 ) ( not ( = ?auto_2074037 ?auto_2074044 ) ) ( not ( = ?auto_2074038 ?auto_2074044 ) ) ( not ( = ?auto_2074036 ?auto_2074044 ) ) ( IS-CRATE ?auto_2074037 ) ( AVAILABLE ?auto_2074045 ) ( SURFACE-AT ?auto_2074037 ?auto_2074040 ) ( ON ?auto_2074037 ?auto_2074039 ) ( CLEAR ?auto_2074037 ) ( not ( = ?auto_2074037 ?auto_2074039 ) ) ( not ( = ?auto_2074038 ?auto_2074039 ) ) ( not ( = ?auto_2074036 ?auto_2074039 ) ) ( not ( = ?auto_2074044 ?auto_2074039 ) ) ( TRUCK-AT ?auto_2074042 ?auto_2074041 ) ( SURFACE-AT ?auto_2074035 ?auto_2074041 ) ( CLEAR ?auto_2074035 ) ( LIFTING ?auto_2074043 ?auto_2074036 ) ( IS-CRATE ?auto_2074036 ) ( not ( = ?auto_2074035 ?auto_2074036 ) ) ( not ( = ?auto_2074037 ?auto_2074035 ) ) ( not ( = ?auto_2074038 ?auto_2074035 ) ) ( not ( = ?auto_2074044 ?auto_2074035 ) ) ( not ( = ?auto_2074039 ?auto_2074035 ) ) ( ON ?auto_2074028 ?auto_2074027 ) ( ON ?auto_2074029 ?auto_2074028 ) ( ON ?auto_2074031 ?auto_2074029 ) ( ON ?auto_2074030 ?auto_2074031 ) ( ON ?auto_2074032 ?auto_2074030 ) ( ON ?auto_2074033 ?auto_2074032 ) ( ON ?auto_2074034 ?auto_2074033 ) ( ON ?auto_2074035 ?auto_2074034 ) ( not ( = ?auto_2074027 ?auto_2074028 ) ) ( not ( = ?auto_2074027 ?auto_2074029 ) ) ( not ( = ?auto_2074027 ?auto_2074031 ) ) ( not ( = ?auto_2074027 ?auto_2074030 ) ) ( not ( = ?auto_2074027 ?auto_2074032 ) ) ( not ( = ?auto_2074027 ?auto_2074033 ) ) ( not ( = ?auto_2074027 ?auto_2074034 ) ) ( not ( = ?auto_2074027 ?auto_2074035 ) ) ( not ( = ?auto_2074027 ?auto_2074036 ) ) ( not ( = ?auto_2074027 ?auto_2074037 ) ) ( not ( = ?auto_2074027 ?auto_2074038 ) ) ( not ( = ?auto_2074027 ?auto_2074044 ) ) ( not ( = ?auto_2074027 ?auto_2074039 ) ) ( not ( = ?auto_2074028 ?auto_2074029 ) ) ( not ( = ?auto_2074028 ?auto_2074031 ) ) ( not ( = ?auto_2074028 ?auto_2074030 ) ) ( not ( = ?auto_2074028 ?auto_2074032 ) ) ( not ( = ?auto_2074028 ?auto_2074033 ) ) ( not ( = ?auto_2074028 ?auto_2074034 ) ) ( not ( = ?auto_2074028 ?auto_2074035 ) ) ( not ( = ?auto_2074028 ?auto_2074036 ) ) ( not ( = ?auto_2074028 ?auto_2074037 ) ) ( not ( = ?auto_2074028 ?auto_2074038 ) ) ( not ( = ?auto_2074028 ?auto_2074044 ) ) ( not ( = ?auto_2074028 ?auto_2074039 ) ) ( not ( = ?auto_2074029 ?auto_2074031 ) ) ( not ( = ?auto_2074029 ?auto_2074030 ) ) ( not ( = ?auto_2074029 ?auto_2074032 ) ) ( not ( = ?auto_2074029 ?auto_2074033 ) ) ( not ( = ?auto_2074029 ?auto_2074034 ) ) ( not ( = ?auto_2074029 ?auto_2074035 ) ) ( not ( = ?auto_2074029 ?auto_2074036 ) ) ( not ( = ?auto_2074029 ?auto_2074037 ) ) ( not ( = ?auto_2074029 ?auto_2074038 ) ) ( not ( = ?auto_2074029 ?auto_2074044 ) ) ( not ( = ?auto_2074029 ?auto_2074039 ) ) ( not ( = ?auto_2074031 ?auto_2074030 ) ) ( not ( = ?auto_2074031 ?auto_2074032 ) ) ( not ( = ?auto_2074031 ?auto_2074033 ) ) ( not ( = ?auto_2074031 ?auto_2074034 ) ) ( not ( = ?auto_2074031 ?auto_2074035 ) ) ( not ( = ?auto_2074031 ?auto_2074036 ) ) ( not ( = ?auto_2074031 ?auto_2074037 ) ) ( not ( = ?auto_2074031 ?auto_2074038 ) ) ( not ( = ?auto_2074031 ?auto_2074044 ) ) ( not ( = ?auto_2074031 ?auto_2074039 ) ) ( not ( = ?auto_2074030 ?auto_2074032 ) ) ( not ( = ?auto_2074030 ?auto_2074033 ) ) ( not ( = ?auto_2074030 ?auto_2074034 ) ) ( not ( = ?auto_2074030 ?auto_2074035 ) ) ( not ( = ?auto_2074030 ?auto_2074036 ) ) ( not ( = ?auto_2074030 ?auto_2074037 ) ) ( not ( = ?auto_2074030 ?auto_2074038 ) ) ( not ( = ?auto_2074030 ?auto_2074044 ) ) ( not ( = ?auto_2074030 ?auto_2074039 ) ) ( not ( = ?auto_2074032 ?auto_2074033 ) ) ( not ( = ?auto_2074032 ?auto_2074034 ) ) ( not ( = ?auto_2074032 ?auto_2074035 ) ) ( not ( = ?auto_2074032 ?auto_2074036 ) ) ( not ( = ?auto_2074032 ?auto_2074037 ) ) ( not ( = ?auto_2074032 ?auto_2074038 ) ) ( not ( = ?auto_2074032 ?auto_2074044 ) ) ( not ( = ?auto_2074032 ?auto_2074039 ) ) ( not ( = ?auto_2074033 ?auto_2074034 ) ) ( not ( = ?auto_2074033 ?auto_2074035 ) ) ( not ( = ?auto_2074033 ?auto_2074036 ) ) ( not ( = ?auto_2074033 ?auto_2074037 ) ) ( not ( = ?auto_2074033 ?auto_2074038 ) ) ( not ( = ?auto_2074033 ?auto_2074044 ) ) ( not ( = ?auto_2074033 ?auto_2074039 ) ) ( not ( = ?auto_2074034 ?auto_2074035 ) ) ( not ( = ?auto_2074034 ?auto_2074036 ) ) ( not ( = ?auto_2074034 ?auto_2074037 ) ) ( not ( = ?auto_2074034 ?auto_2074038 ) ) ( not ( = ?auto_2074034 ?auto_2074044 ) ) ( not ( = ?auto_2074034 ?auto_2074039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2074036 ?auto_2074037 ?auto_2074038 )
      ( MAKE-11CRATE-VERIFY ?auto_2074027 ?auto_2074028 ?auto_2074029 ?auto_2074031 ?auto_2074030 ?auto_2074032 ?auto_2074033 ?auto_2074034 ?auto_2074035 ?auto_2074036 ?auto_2074037 ?auto_2074038 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2074046 - SURFACE
      ?auto_2074047 - SURFACE
      ?auto_2074048 - SURFACE
      ?auto_2074050 - SURFACE
      ?auto_2074049 - SURFACE
      ?auto_2074051 - SURFACE
      ?auto_2074052 - SURFACE
      ?auto_2074053 - SURFACE
      ?auto_2074054 - SURFACE
      ?auto_2074055 - SURFACE
      ?auto_2074056 - SURFACE
      ?auto_2074057 - SURFACE
      ?auto_2074058 - SURFACE
    )
    :vars
    (
      ?auto_2074063 - HOIST
      ?auto_2074061 - PLACE
      ?auto_2074060 - PLACE
      ?auto_2074065 - HOIST
      ?auto_2074064 - SURFACE
      ?auto_2074059 - SURFACE
      ?auto_2074062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074063 ?auto_2074061 ) ( IS-CRATE ?auto_2074058 ) ( not ( = ?auto_2074057 ?auto_2074058 ) ) ( not ( = ?auto_2074056 ?auto_2074057 ) ) ( not ( = ?auto_2074056 ?auto_2074058 ) ) ( not ( = ?auto_2074060 ?auto_2074061 ) ) ( HOIST-AT ?auto_2074065 ?auto_2074060 ) ( not ( = ?auto_2074063 ?auto_2074065 ) ) ( SURFACE-AT ?auto_2074058 ?auto_2074060 ) ( ON ?auto_2074058 ?auto_2074064 ) ( CLEAR ?auto_2074058 ) ( not ( = ?auto_2074057 ?auto_2074064 ) ) ( not ( = ?auto_2074058 ?auto_2074064 ) ) ( not ( = ?auto_2074056 ?auto_2074064 ) ) ( IS-CRATE ?auto_2074057 ) ( AVAILABLE ?auto_2074065 ) ( SURFACE-AT ?auto_2074057 ?auto_2074060 ) ( ON ?auto_2074057 ?auto_2074059 ) ( CLEAR ?auto_2074057 ) ( not ( = ?auto_2074057 ?auto_2074059 ) ) ( not ( = ?auto_2074058 ?auto_2074059 ) ) ( not ( = ?auto_2074056 ?auto_2074059 ) ) ( not ( = ?auto_2074064 ?auto_2074059 ) ) ( TRUCK-AT ?auto_2074062 ?auto_2074061 ) ( SURFACE-AT ?auto_2074055 ?auto_2074061 ) ( CLEAR ?auto_2074055 ) ( LIFTING ?auto_2074063 ?auto_2074056 ) ( IS-CRATE ?auto_2074056 ) ( not ( = ?auto_2074055 ?auto_2074056 ) ) ( not ( = ?auto_2074057 ?auto_2074055 ) ) ( not ( = ?auto_2074058 ?auto_2074055 ) ) ( not ( = ?auto_2074064 ?auto_2074055 ) ) ( not ( = ?auto_2074059 ?auto_2074055 ) ) ( ON ?auto_2074047 ?auto_2074046 ) ( ON ?auto_2074048 ?auto_2074047 ) ( ON ?auto_2074050 ?auto_2074048 ) ( ON ?auto_2074049 ?auto_2074050 ) ( ON ?auto_2074051 ?auto_2074049 ) ( ON ?auto_2074052 ?auto_2074051 ) ( ON ?auto_2074053 ?auto_2074052 ) ( ON ?auto_2074054 ?auto_2074053 ) ( ON ?auto_2074055 ?auto_2074054 ) ( not ( = ?auto_2074046 ?auto_2074047 ) ) ( not ( = ?auto_2074046 ?auto_2074048 ) ) ( not ( = ?auto_2074046 ?auto_2074050 ) ) ( not ( = ?auto_2074046 ?auto_2074049 ) ) ( not ( = ?auto_2074046 ?auto_2074051 ) ) ( not ( = ?auto_2074046 ?auto_2074052 ) ) ( not ( = ?auto_2074046 ?auto_2074053 ) ) ( not ( = ?auto_2074046 ?auto_2074054 ) ) ( not ( = ?auto_2074046 ?auto_2074055 ) ) ( not ( = ?auto_2074046 ?auto_2074056 ) ) ( not ( = ?auto_2074046 ?auto_2074057 ) ) ( not ( = ?auto_2074046 ?auto_2074058 ) ) ( not ( = ?auto_2074046 ?auto_2074064 ) ) ( not ( = ?auto_2074046 ?auto_2074059 ) ) ( not ( = ?auto_2074047 ?auto_2074048 ) ) ( not ( = ?auto_2074047 ?auto_2074050 ) ) ( not ( = ?auto_2074047 ?auto_2074049 ) ) ( not ( = ?auto_2074047 ?auto_2074051 ) ) ( not ( = ?auto_2074047 ?auto_2074052 ) ) ( not ( = ?auto_2074047 ?auto_2074053 ) ) ( not ( = ?auto_2074047 ?auto_2074054 ) ) ( not ( = ?auto_2074047 ?auto_2074055 ) ) ( not ( = ?auto_2074047 ?auto_2074056 ) ) ( not ( = ?auto_2074047 ?auto_2074057 ) ) ( not ( = ?auto_2074047 ?auto_2074058 ) ) ( not ( = ?auto_2074047 ?auto_2074064 ) ) ( not ( = ?auto_2074047 ?auto_2074059 ) ) ( not ( = ?auto_2074048 ?auto_2074050 ) ) ( not ( = ?auto_2074048 ?auto_2074049 ) ) ( not ( = ?auto_2074048 ?auto_2074051 ) ) ( not ( = ?auto_2074048 ?auto_2074052 ) ) ( not ( = ?auto_2074048 ?auto_2074053 ) ) ( not ( = ?auto_2074048 ?auto_2074054 ) ) ( not ( = ?auto_2074048 ?auto_2074055 ) ) ( not ( = ?auto_2074048 ?auto_2074056 ) ) ( not ( = ?auto_2074048 ?auto_2074057 ) ) ( not ( = ?auto_2074048 ?auto_2074058 ) ) ( not ( = ?auto_2074048 ?auto_2074064 ) ) ( not ( = ?auto_2074048 ?auto_2074059 ) ) ( not ( = ?auto_2074050 ?auto_2074049 ) ) ( not ( = ?auto_2074050 ?auto_2074051 ) ) ( not ( = ?auto_2074050 ?auto_2074052 ) ) ( not ( = ?auto_2074050 ?auto_2074053 ) ) ( not ( = ?auto_2074050 ?auto_2074054 ) ) ( not ( = ?auto_2074050 ?auto_2074055 ) ) ( not ( = ?auto_2074050 ?auto_2074056 ) ) ( not ( = ?auto_2074050 ?auto_2074057 ) ) ( not ( = ?auto_2074050 ?auto_2074058 ) ) ( not ( = ?auto_2074050 ?auto_2074064 ) ) ( not ( = ?auto_2074050 ?auto_2074059 ) ) ( not ( = ?auto_2074049 ?auto_2074051 ) ) ( not ( = ?auto_2074049 ?auto_2074052 ) ) ( not ( = ?auto_2074049 ?auto_2074053 ) ) ( not ( = ?auto_2074049 ?auto_2074054 ) ) ( not ( = ?auto_2074049 ?auto_2074055 ) ) ( not ( = ?auto_2074049 ?auto_2074056 ) ) ( not ( = ?auto_2074049 ?auto_2074057 ) ) ( not ( = ?auto_2074049 ?auto_2074058 ) ) ( not ( = ?auto_2074049 ?auto_2074064 ) ) ( not ( = ?auto_2074049 ?auto_2074059 ) ) ( not ( = ?auto_2074051 ?auto_2074052 ) ) ( not ( = ?auto_2074051 ?auto_2074053 ) ) ( not ( = ?auto_2074051 ?auto_2074054 ) ) ( not ( = ?auto_2074051 ?auto_2074055 ) ) ( not ( = ?auto_2074051 ?auto_2074056 ) ) ( not ( = ?auto_2074051 ?auto_2074057 ) ) ( not ( = ?auto_2074051 ?auto_2074058 ) ) ( not ( = ?auto_2074051 ?auto_2074064 ) ) ( not ( = ?auto_2074051 ?auto_2074059 ) ) ( not ( = ?auto_2074052 ?auto_2074053 ) ) ( not ( = ?auto_2074052 ?auto_2074054 ) ) ( not ( = ?auto_2074052 ?auto_2074055 ) ) ( not ( = ?auto_2074052 ?auto_2074056 ) ) ( not ( = ?auto_2074052 ?auto_2074057 ) ) ( not ( = ?auto_2074052 ?auto_2074058 ) ) ( not ( = ?auto_2074052 ?auto_2074064 ) ) ( not ( = ?auto_2074052 ?auto_2074059 ) ) ( not ( = ?auto_2074053 ?auto_2074054 ) ) ( not ( = ?auto_2074053 ?auto_2074055 ) ) ( not ( = ?auto_2074053 ?auto_2074056 ) ) ( not ( = ?auto_2074053 ?auto_2074057 ) ) ( not ( = ?auto_2074053 ?auto_2074058 ) ) ( not ( = ?auto_2074053 ?auto_2074064 ) ) ( not ( = ?auto_2074053 ?auto_2074059 ) ) ( not ( = ?auto_2074054 ?auto_2074055 ) ) ( not ( = ?auto_2074054 ?auto_2074056 ) ) ( not ( = ?auto_2074054 ?auto_2074057 ) ) ( not ( = ?auto_2074054 ?auto_2074058 ) ) ( not ( = ?auto_2074054 ?auto_2074064 ) ) ( not ( = ?auto_2074054 ?auto_2074059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2074056 ?auto_2074057 ?auto_2074058 )
      ( MAKE-12CRATE-VERIFY ?auto_2074046 ?auto_2074047 ?auto_2074048 ?auto_2074050 ?auto_2074049 ?auto_2074051 ?auto_2074052 ?auto_2074053 ?auto_2074054 ?auto_2074055 ?auto_2074056 ?auto_2074057 ?auto_2074058 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2074066 - SURFACE
      ?auto_2074067 - SURFACE
      ?auto_2074068 - SURFACE
      ?auto_2074070 - SURFACE
      ?auto_2074069 - SURFACE
      ?auto_2074071 - SURFACE
      ?auto_2074072 - SURFACE
      ?auto_2074073 - SURFACE
      ?auto_2074074 - SURFACE
      ?auto_2074075 - SURFACE
      ?auto_2074076 - SURFACE
      ?auto_2074077 - SURFACE
      ?auto_2074078 - SURFACE
      ?auto_2074079 - SURFACE
    )
    :vars
    (
      ?auto_2074084 - HOIST
      ?auto_2074082 - PLACE
      ?auto_2074081 - PLACE
      ?auto_2074086 - HOIST
      ?auto_2074085 - SURFACE
      ?auto_2074080 - SURFACE
      ?auto_2074083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074084 ?auto_2074082 ) ( IS-CRATE ?auto_2074079 ) ( not ( = ?auto_2074078 ?auto_2074079 ) ) ( not ( = ?auto_2074077 ?auto_2074078 ) ) ( not ( = ?auto_2074077 ?auto_2074079 ) ) ( not ( = ?auto_2074081 ?auto_2074082 ) ) ( HOIST-AT ?auto_2074086 ?auto_2074081 ) ( not ( = ?auto_2074084 ?auto_2074086 ) ) ( SURFACE-AT ?auto_2074079 ?auto_2074081 ) ( ON ?auto_2074079 ?auto_2074085 ) ( CLEAR ?auto_2074079 ) ( not ( = ?auto_2074078 ?auto_2074085 ) ) ( not ( = ?auto_2074079 ?auto_2074085 ) ) ( not ( = ?auto_2074077 ?auto_2074085 ) ) ( IS-CRATE ?auto_2074078 ) ( AVAILABLE ?auto_2074086 ) ( SURFACE-AT ?auto_2074078 ?auto_2074081 ) ( ON ?auto_2074078 ?auto_2074080 ) ( CLEAR ?auto_2074078 ) ( not ( = ?auto_2074078 ?auto_2074080 ) ) ( not ( = ?auto_2074079 ?auto_2074080 ) ) ( not ( = ?auto_2074077 ?auto_2074080 ) ) ( not ( = ?auto_2074085 ?auto_2074080 ) ) ( TRUCK-AT ?auto_2074083 ?auto_2074082 ) ( SURFACE-AT ?auto_2074076 ?auto_2074082 ) ( CLEAR ?auto_2074076 ) ( LIFTING ?auto_2074084 ?auto_2074077 ) ( IS-CRATE ?auto_2074077 ) ( not ( = ?auto_2074076 ?auto_2074077 ) ) ( not ( = ?auto_2074078 ?auto_2074076 ) ) ( not ( = ?auto_2074079 ?auto_2074076 ) ) ( not ( = ?auto_2074085 ?auto_2074076 ) ) ( not ( = ?auto_2074080 ?auto_2074076 ) ) ( ON ?auto_2074067 ?auto_2074066 ) ( ON ?auto_2074068 ?auto_2074067 ) ( ON ?auto_2074070 ?auto_2074068 ) ( ON ?auto_2074069 ?auto_2074070 ) ( ON ?auto_2074071 ?auto_2074069 ) ( ON ?auto_2074072 ?auto_2074071 ) ( ON ?auto_2074073 ?auto_2074072 ) ( ON ?auto_2074074 ?auto_2074073 ) ( ON ?auto_2074075 ?auto_2074074 ) ( ON ?auto_2074076 ?auto_2074075 ) ( not ( = ?auto_2074066 ?auto_2074067 ) ) ( not ( = ?auto_2074066 ?auto_2074068 ) ) ( not ( = ?auto_2074066 ?auto_2074070 ) ) ( not ( = ?auto_2074066 ?auto_2074069 ) ) ( not ( = ?auto_2074066 ?auto_2074071 ) ) ( not ( = ?auto_2074066 ?auto_2074072 ) ) ( not ( = ?auto_2074066 ?auto_2074073 ) ) ( not ( = ?auto_2074066 ?auto_2074074 ) ) ( not ( = ?auto_2074066 ?auto_2074075 ) ) ( not ( = ?auto_2074066 ?auto_2074076 ) ) ( not ( = ?auto_2074066 ?auto_2074077 ) ) ( not ( = ?auto_2074066 ?auto_2074078 ) ) ( not ( = ?auto_2074066 ?auto_2074079 ) ) ( not ( = ?auto_2074066 ?auto_2074085 ) ) ( not ( = ?auto_2074066 ?auto_2074080 ) ) ( not ( = ?auto_2074067 ?auto_2074068 ) ) ( not ( = ?auto_2074067 ?auto_2074070 ) ) ( not ( = ?auto_2074067 ?auto_2074069 ) ) ( not ( = ?auto_2074067 ?auto_2074071 ) ) ( not ( = ?auto_2074067 ?auto_2074072 ) ) ( not ( = ?auto_2074067 ?auto_2074073 ) ) ( not ( = ?auto_2074067 ?auto_2074074 ) ) ( not ( = ?auto_2074067 ?auto_2074075 ) ) ( not ( = ?auto_2074067 ?auto_2074076 ) ) ( not ( = ?auto_2074067 ?auto_2074077 ) ) ( not ( = ?auto_2074067 ?auto_2074078 ) ) ( not ( = ?auto_2074067 ?auto_2074079 ) ) ( not ( = ?auto_2074067 ?auto_2074085 ) ) ( not ( = ?auto_2074067 ?auto_2074080 ) ) ( not ( = ?auto_2074068 ?auto_2074070 ) ) ( not ( = ?auto_2074068 ?auto_2074069 ) ) ( not ( = ?auto_2074068 ?auto_2074071 ) ) ( not ( = ?auto_2074068 ?auto_2074072 ) ) ( not ( = ?auto_2074068 ?auto_2074073 ) ) ( not ( = ?auto_2074068 ?auto_2074074 ) ) ( not ( = ?auto_2074068 ?auto_2074075 ) ) ( not ( = ?auto_2074068 ?auto_2074076 ) ) ( not ( = ?auto_2074068 ?auto_2074077 ) ) ( not ( = ?auto_2074068 ?auto_2074078 ) ) ( not ( = ?auto_2074068 ?auto_2074079 ) ) ( not ( = ?auto_2074068 ?auto_2074085 ) ) ( not ( = ?auto_2074068 ?auto_2074080 ) ) ( not ( = ?auto_2074070 ?auto_2074069 ) ) ( not ( = ?auto_2074070 ?auto_2074071 ) ) ( not ( = ?auto_2074070 ?auto_2074072 ) ) ( not ( = ?auto_2074070 ?auto_2074073 ) ) ( not ( = ?auto_2074070 ?auto_2074074 ) ) ( not ( = ?auto_2074070 ?auto_2074075 ) ) ( not ( = ?auto_2074070 ?auto_2074076 ) ) ( not ( = ?auto_2074070 ?auto_2074077 ) ) ( not ( = ?auto_2074070 ?auto_2074078 ) ) ( not ( = ?auto_2074070 ?auto_2074079 ) ) ( not ( = ?auto_2074070 ?auto_2074085 ) ) ( not ( = ?auto_2074070 ?auto_2074080 ) ) ( not ( = ?auto_2074069 ?auto_2074071 ) ) ( not ( = ?auto_2074069 ?auto_2074072 ) ) ( not ( = ?auto_2074069 ?auto_2074073 ) ) ( not ( = ?auto_2074069 ?auto_2074074 ) ) ( not ( = ?auto_2074069 ?auto_2074075 ) ) ( not ( = ?auto_2074069 ?auto_2074076 ) ) ( not ( = ?auto_2074069 ?auto_2074077 ) ) ( not ( = ?auto_2074069 ?auto_2074078 ) ) ( not ( = ?auto_2074069 ?auto_2074079 ) ) ( not ( = ?auto_2074069 ?auto_2074085 ) ) ( not ( = ?auto_2074069 ?auto_2074080 ) ) ( not ( = ?auto_2074071 ?auto_2074072 ) ) ( not ( = ?auto_2074071 ?auto_2074073 ) ) ( not ( = ?auto_2074071 ?auto_2074074 ) ) ( not ( = ?auto_2074071 ?auto_2074075 ) ) ( not ( = ?auto_2074071 ?auto_2074076 ) ) ( not ( = ?auto_2074071 ?auto_2074077 ) ) ( not ( = ?auto_2074071 ?auto_2074078 ) ) ( not ( = ?auto_2074071 ?auto_2074079 ) ) ( not ( = ?auto_2074071 ?auto_2074085 ) ) ( not ( = ?auto_2074071 ?auto_2074080 ) ) ( not ( = ?auto_2074072 ?auto_2074073 ) ) ( not ( = ?auto_2074072 ?auto_2074074 ) ) ( not ( = ?auto_2074072 ?auto_2074075 ) ) ( not ( = ?auto_2074072 ?auto_2074076 ) ) ( not ( = ?auto_2074072 ?auto_2074077 ) ) ( not ( = ?auto_2074072 ?auto_2074078 ) ) ( not ( = ?auto_2074072 ?auto_2074079 ) ) ( not ( = ?auto_2074072 ?auto_2074085 ) ) ( not ( = ?auto_2074072 ?auto_2074080 ) ) ( not ( = ?auto_2074073 ?auto_2074074 ) ) ( not ( = ?auto_2074073 ?auto_2074075 ) ) ( not ( = ?auto_2074073 ?auto_2074076 ) ) ( not ( = ?auto_2074073 ?auto_2074077 ) ) ( not ( = ?auto_2074073 ?auto_2074078 ) ) ( not ( = ?auto_2074073 ?auto_2074079 ) ) ( not ( = ?auto_2074073 ?auto_2074085 ) ) ( not ( = ?auto_2074073 ?auto_2074080 ) ) ( not ( = ?auto_2074074 ?auto_2074075 ) ) ( not ( = ?auto_2074074 ?auto_2074076 ) ) ( not ( = ?auto_2074074 ?auto_2074077 ) ) ( not ( = ?auto_2074074 ?auto_2074078 ) ) ( not ( = ?auto_2074074 ?auto_2074079 ) ) ( not ( = ?auto_2074074 ?auto_2074085 ) ) ( not ( = ?auto_2074074 ?auto_2074080 ) ) ( not ( = ?auto_2074075 ?auto_2074076 ) ) ( not ( = ?auto_2074075 ?auto_2074077 ) ) ( not ( = ?auto_2074075 ?auto_2074078 ) ) ( not ( = ?auto_2074075 ?auto_2074079 ) ) ( not ( = ?auto_2074075 ?auto_2074085 ) ) ( not ( = ?auto_2074075 ?auto_2074080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2074077 ?auto_2074078 ?auto_2074079 )
      ( MAKE-13CRATE-VERIFY ?auto_2074066 ?auto_2074067 ?auto_2074068 ?auto_2074070 ?auto_2074069 ?auto_2074071 ?auto_2074072 ?auto_2074073 ?auto_2074074 ?auto_2074075 ?auto_2074076 ?auto_2074077 ?auto_2074078 ?auto_2074079 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2082625 - SURFACE
      ?auto_2082626 - SURFACE
    )
    :vars
    (
      ?auto_2082630 - HOIST
      ?auto_2082628 - PLACE
      ?auto_2082627 - SURFACE
      ?auto_2082633 - PLACE
      ?auto_2082629 - HOIST
      ?auto_2082634 - SURFACE
      ?auto_2082631 - TRUCK
      ?auto_2082632 - SURFACE
      ?auto_2082635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2082630 ?auto_2082628 ) ( IS-CRATE ?auto_2082626 ) ( not ( = ?auto_2082625 ?auto_2082626 ) ) ( not ( = ?auto_2082627 ?auto_2082625 ) ) ( not ( = ?auto_2082627 ?auto_2082626 ) ) ( not ( = ?auto_2082633 ?auto_2082628 ) ) ( HOIST-AT ?auto_2082629 ?auto_2082633 ) ( not ( = ?auto_2082630 ?auto_2082629 ) ) ( SURFACE-AT ?auto_2082626 ?auto_2082633 ) ( ON ?auto_2082626 ?auto_2082634 ) ( CLEAR ?auto_2082626 ) ( not ( = ?auto_2082625 ?auto_2082634 ) ) ( not ( = ?auto_2082626 ?auto_2082634 ) ) ( not ( = ?auto_2082627 ?auto_2082634 ) ) ( SURFACE-AT ?auto_2082627 ?auto_2082628 ) ( CLEAR ?auto_2082627 ) ( IS-CRATE ?auto_2082625 ) ( AVAILABLE ?auto_2082630 ) ( TRUCK-AT ?auto_2082631 ?auto_2082633 ) ( SURFACE-AT ?auto_2082625 ?auto_2082633 ) ( ON ?auto_2082625 ?auto_2082632 ) ( CLEAR ?auto_2082625 ) ( not ( = ?auto_2082625 ?auto_2082632 ) ) ( not ( = ?auto_2082626 ?auto_2082632 ) ) ( not ( = ?auto_2082627 ?auto_2082632 ) ) ( not ( = ?auto_2082634 ?auto_2082632 ) ) ( LIFTING ?auto_2082629 ?auto_2082635 ) ( IS-CRATE ?auto_2082635 ) ( not ( = ?auto_2082625 ?auto_2082635 ) ) ( not ( = ?auto_2082626 ?auto_2082635 ) ) ( not ( = ?auto_2082627 ?auto_2082635 ) ) ( not ( = ?auto_2082634 ?auto_2082635 ) ) ( not ( = ?auto_2082632 ?auto_2082635 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2082629 ?auto_2082635 ?auto_2082631 ?auto_2082633 )
      ( MAKE-2CRATE ?auto_2082627 ?auto_2082625 ?auto_2082626 )
      ( MAKE-1CRATE-VERIFY ?auto_2082625 ?auto_2082626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2082636 - SURFACE
      ?auto_2082637 - SURFACE
      ?auto_2082638 - SURFACE
    )
    :vars
    (
      ?auto_2082641 - HOIST
      ?auto_2082646 - PLACE
      ?auto_2082643 - PLACE
      ?auto_2082639 - HOIST
      ?auto_2082642 - SURFACE
      ?auto_2082640 - TRUCK
      ?auto_2082644 - SURFACE
      ?auto_2082645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2082641 ?auto_2082646 ) ( IS-CRATE ?auto_2082638 ) ( not ( = ?auto_2082637 ?auto_2082638 ) ) ( not ( = ?auto_2082636 ?auto_2082637 ) ) ( not ( = ?auto_2082636 ?auto_2082638 ) ) ( not ( = ?auto_2082643 ?auto_2082646 ) ) ( HOIST-AT ?auto_2082639 ?auto_2082643 ) ( not ( = ?auto_2082641 ?auto_2082639 ) ) ( SURFACE-AT ?auto_2082638 ?auto_2082643 ) ( ON ?auto_2082638 ?auto_2082642 ) ( CLEAR ?auto_2082638 ) ( not ( = ?auto_2082637 ?auto_2082642 ) ) ( not ( = ?auto_2082638 ?auto_2082642 ) ) ( not ( = ?auto_2082636 ?auto_2082642 ) ) ( SURFACE-AT ?auto_2082636 ?auto_2082646 ) ( CLEAR ?auto_2082636 ) ( IS-CRATE ?auto_2082637 ) ( AVAILABLE ?auto_2082641 ) ( TRUCK-AT ?auto_2082640 ?auto_2082643 ) ( SURFACE-AT ?auto_2082637 ?auto_2082643 ) ( ON ?auto_2082637 ?auto_2082644 ) ( CLEAR ?auto_2082637 ) ( not ( = ?auto_2082637 ?auto_2082644 ) ) ( not ( = ?auto_2082638 ?auto_2082644 ) ) ( not ( = ?auto_2082636 ?auto_2082644 ) ) ( not ( = ?auto_2082642 ?auto_2082644 ) ) ( LIFTING ?auto_2082639 ?auto_2082645 ) ( IS-CRATE ?auto_2082645 ) ( not ( = ?auto_2082637 ?auto_2082645 ) ) ( not ( = ?auto_2082638 ?auto_2082645 ) ) ( not ( = ?auto_2082636 ?auto_2082645 ) ) ( not ( = ?auto_2082642 ?auto_2082645 ) ) ( not ( = ?auto_2082644 ?auto_2082645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2082637 ?auto_2082638 )
      ( MAKE-2CRATE-VERIFY ?auto_2082636 ?auto_2082637 ?auto_2082638 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087048 - SURFACE
      ?auto_2087049 - SURFACE
      ?auto_2087050 - SURFACE
      ?auto_2087052 - SURFACE
      ?auto_2087051 - SURFACE
      ?auto_2087053 - SURFACE
      ?auto_2087054 - SURFACE
      ?auto_2087055 - SURFACE
      ?auto_2087056 - SURFACE
      ?auto_2087057 - SURFACE
      ?auto_2087058 - SURFACE
      ?auto_2087059 - SURFACE
      ?auto_2087060 - SURFACE
      ?auto_2087061 - SURFACE
      ?auto_2087062 - SURFACE
    )
    :vars
    (
      ?auto_2087063 - HOIST
      ?auto_2087064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087063 ?auto_2087064 ) ( SURFACE-AT ?auto_2087061 ?auto_2087064 ) ( CLEAR ?auto_2087061 ) ( LIFTING ?auto_2087063 ?auto_2087062 ) ( IS-CRATE ?auto_2087062 ) ( not ( = ?auto_2087061 ?auto_2087062 ) ) ( ON ?auto_2087049 ?auto_2087048 ) ( ON ?auto_2087050 ?auto_2087049 ) ( ON ?auto_2087052 ?auto_2087050 ) ( ON ?auto_2087051 ?auto_2087052 ) ( ON ?auto_2087053 ?auto_2087051 ) ( ON ?auto_2087054 ?auto_2087053 ) ( ON ?auto_2087055 ?auto_2087054 ) ( ON ?auto_2087056 ?auto_2087055 ) ( ON ?auto_2087057 ?auto_2087056 ) ( ON ?auto_2087058 ?auto_2087057 ) ( ON ?auto_2087059 ?auto_2087058 ) ( ON ?auto_2087060 ?auto_2087059 ) ( ON ?auto_2087061 ?auto_2087060 ) ( not ( = ?auto_2087048 ?auto_2087049 ) ) ( not ( = ?auto_2087048 ?auto_2087050 ) ) ( not ( = ?auto_2087048 ?auto_2087052 ) ) ( not ( = ?auto_2087048 ?auto_2087051 ) ) ( not ( = ?auto_2087048 ?auto_2087053 ) ) ( not ( = ?auto_2087048 ?auto_2087054 ) ) ( not ( = ?auto_2087048 ?auto_2087055 ) ) ( not ( = ?auto_2087048 ?auto_2087056 ) ) ( not ( = ?auto_2087048 ?auto_2087057 ) ) ( not ( = ?auto_2087048 ?auto_2087058 ) ) ( not ( = ?auto_2087048 ?auto_2087059 ) ) ( not ( = ?auto_2087048 ?auto_2087060 ) ) ( not ( = ?auto_2087048 ?auto_2087061 ) ) ( not ( = ?auto_2087048 ?auto_2087062 ) ) ( not ( = ?auto_2087049 ?auto_2087050 ) ) ( not ( = ?auto_2087049 ?auto_2087052 ) ) ( not ( = ?auto_2087049 ?auto_2087051 ) ) ( not ( = ?auto_2087049 ?auto_2087053 ) ) ( not ( = ?auto_2087049 ?auto_2087054 ) ) ( not ( = ?auto_2087049 ?auto_2087055 ) ) ( not ( = ?auto_2087049 ?auto_2087056 ) ) ( not ( = ?auto_2087049 ?auto_2087057 ) ) ( not ( = ?auto_2087049 ?auto_2087058 ) ) ( not ( = ?auto_2087049 ?auto_2087059 ) ) ( not ( = ?auto_2087049 ?auto_2087060 ) ) ( not ( = ?auto_2087049 ?auto_2087061 ) ) ( not ( = ?auto_2087049 ?auto_2087062 ) ) ( not ( = ?auto_2087050 ?auto_2087052 ) ) ( not ( = ?auto_2087050 ?auto_2087051 ) ) ( not ( = ?auto_2087050 ?auto_2087053 ) ) ( not ( = ?auto_2087050 ?auto_2087054 ) ) ( not ( = ?auto_2087050 ?auto_2087055 ) ) ( not ( = ?auto_2087050 ?auto_2087056 ) ) ( not ( = ?auto_2087050 ?auto_2087057 ) ) ( not ( = ?auto_2087050 ?auto_2087058 ) ) ( not ( = ?auto_2087050 ?auto_2087059 ) ) ( not ( = ?auto_2087050 ?auto_2087060 ) ) ( not ( = ?auto_2087050 ?auto_2087061 ) ) ( not ( = ?auto_2087050 ?auto_2087062 ) ) ( not ( = ?auto_2087052 ?auto_2087051 ) ) ( not ( = ?auto_2087052 ?auto_2087053 ) ) ( not ( = ?auto_2087052 ?auto_2087054 ) ) ( not ( = ?auto_2087052 ?auto_2087055 ) ) ( not ( = ?auto_2087052 ?auto_2087056 ) ) ( not ( = ?auto_2087052 ?auto_2087057 ) ) ( not ( = ?auto_2087052 ?auto_2087058 ) ) ( not ( = ?auto_2087052 ?auto_2087059 ) ) ( not ( = ?auto_2087052 ?auto_2087060 ) ) ( not ( = ?auto_2087052 ?auto_2087061 ) ) ( not ( = ?auto_2087052 ?auto_2087062 ) ) ( not ( = ?auto_2087051 ?auto_2087053 ) ) ( not ( = ?auto_2087051 ?auto_2087054 ) ) ( not ( = ?auto_2087051 ?auto_2087055 ) ) ( not ( = ?auto_2087051 ?auto_2087056 ) ) ( not ( = ?auto_2087051 ?auto_2087057 ) ) ( not ( = ?auto_2087051 ?auto_2087058 ) ) ( not ( = ?auto_2087051 ?auto_2087059 ) ) ( not ( = ?auto_2087051 ?auto_2087060 ) ) ( not ( = ?auto_2087051 ?auto_2087061 ) ) ( not ( = ?auto_2087051 ?auto_2087062 ) ) ( not ( = ?auto_2087053 ?auto_2087054 ) ) ( not ( = ?auto_2087053 ?auto_2087055 ) ) ( not ( = ?auto_2087053 ?auto_2087056 ) ) ( not ( = ?auto_2087053 ?auto_2087057 ) ) ( not ( = ?auto_2087053 ?auto_2087058 ) ) ( not ( = ?auto_2087053 ?auto_2087059 ) ) ( not ( = ?auto_2087053 ?auto_2087060 ) ) ( not ( = ?auto_2087053 ?auto_2087061 ) ) ( not ( = ?auto_2087053 ?auto_2087062 ) ) ( not ( = ?auto_2087054 ?auto_2087055 ) ) ( not ( = ?auto_2087054 ?auto_2087056 ) ) ( not ( = ?auto_2087054 ?auto_2087057 ) ) ( not ( = ?auto_2087054 ?auto_2087058 ) ) ( not ( = ?auto_2087054 ?auto_2087059 ) ) ( not ( = ?auto_2087054 ?auto_2087060 ) ) ( not ( = ?auto_2087054 ?auto_2087061 ) ) ( not ( = ?auto_2087054 ?auto_2087062 ) ) ( not ( = ?auto_2087055 ?auto_2087056 ) ) ( not ( = ?auto_2087055 ?auto_2087057 ) ) ( not ( = ?auto_2087055 ?auto_2087058 ) ) ( not ( = ?auto_2087055 ?auto_2087059 ) ) ( not ( = ?auto_2087055 ?auto_2087060 ) ) ( not ( = ?auto_2087055 ?auto_2087061 ) ) ( not ( = ?auto_2087055 ?auto_2087062 ) ) ( not ( = ?auto_2087056 ?auto_2087057 ) ) ( not ( = ?auto_2087056 ?auto_2087058 ) ) ( not ( = ?auto_2087056 ?auto_2087059 ) ) ( not ( = ?auto_2087056 ?auto_2087060 ) ) ( not ( = ?auto_2087056 ?auto_2087061 ) ) ( not ( = ?auto_2087056 ?auto_2087062 ) ) ( not ( = ?auto_2087057 ?auto_2087058 ) ) ( not ( = ?auto_2087057 ?auto_2087059 ) ) ( not ( = ?auto_2087057 ?auto_2087060 ) ) ( not ( = ?auto_2087057 ?auto_2087061 ) ) ( not ( = ?auto_2087057 ?auto_2087062 ) ) ( not ( = ?auto_2087058 ?auto_2087059 ) ) ( not ( = ?auto_2087058 ?auto_2087060 ) ) ( not ( = ?auto_2087058 ?auto_2087061 ) ) ( not ( = ?auto_2087058 ?auto_2087062 ) ) ( not ( = ?auto_2087059 ?auto_2087060 ) ) ( not ( = ?auto_2087059 ?auto_2087061 ) ) ( not ( = ?auto_2087059 ?auto_2087062 ) ) ( not ( = ?auto_2087060 ?auto_2087061 ) ) ( not ( = ?auto_2087060 ?auto_2087062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2087061 ?auto_2087062 )
      ( MAKE-14CRATE-VERIFY ?auto_2087048 ?auto_2087049 ?auto_2087050 ?auto_2087052 ?auto_2087051 ?auto_2087053 ?auto_2087054 ?auto_2087055 ?auto_2087056 ?auto_2087057 ?auto_2087058 ?auto_2087059 ?auto_2087060 ?auto_2087061 ?auto_2087062 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087208 - SURFACE
      ?auto_2087209 - SURFACE
      ?auto_2087210 - SURFACE
      ?auto_2087212 - SURFACE
      ?auto_2087211 - SURFACE
      ?auto_2087213 - SURFACE
      ?auto_2087214 - SURFACE
      ?auto_2087215 - SURFACE
      ?auto_2087216 - SURFACE
      ?auto_2087217 - SURFACE
      ?auto_2087218 - SURFACE
      ?auto_2087219 - SURFACE
      ?auto_2087220 - SURFACE
      ?auto_2087221 - SURFACE
      ?auto_2087222 - SURFACE
    )
    :vars
    (
      ?auto_2087223 - HOIST
      ?auto_2087225 - PLACE
      ?auto_2087224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087223 ?auto_2087225 ) ( SURFACE-AT ?auto_2087221 ?auto_2087225 ) ( CLEAR ?auto_2087221 ) ( IS-CRATE ?auto_2087222 ) ( not ( = ?auto_2087221 ?auto_2087222 ) ) ( TRUCK-AT ?auto_2087224 ?auto_2087225 ) ( AVAILABLE ?auto_2087223 ) ( IN ?auto_2087222 ?auto_2087224 ) ( ON ?auto_2087221 ?auto_2087220 ) ( not ( = ?auto_2087220 ?auto_2087221 ) ) ( not ( = ?auto_2087220 ?auto_2087222 ) ) ( ON ?auto_2087209 ?auto_2087208 ) ( ON ?auto_2087210 ?auto_2087209 ) ( ON ?auto_2087212 ?auto_2087210 ) ( ON ?auto_2087211 ?auto_2087212 ) ( ON ?auto_2087213 ?auto_2087211 ) ( ON ?auto_2087214 ?auto_2087213 ) ( ON ?auto_2087215 ?auto_2087214 ) ( ON ?auto_2087216 ?auto_2087215 ) ( ON ?auto_2087217 ?auto_2087216 ) ( ON ?auto_2087218 ?auto_2087217 ) ( ON ?auto_2087219 ?auto_2087218 ) ( ON ?auto_2087220 ?auto_2087219 ) ( not ( = ?auto_2087208 ?auto_2087209 ) ) ( not ( = ?auto_2087208 ?auto_2087210 ) ) ( not ( = ?auto_2087208 ?auto_2087212 ) ) ( not ( = ?auto_2087208 ?auto_2087211 ) ) ( not ( = ?auto_2087208 ?auto_2087213 ) ) ( not ( = ?auto_2087208 ?auto_2087214 ) ) ( not ( = ?auto_2087208 ?auto_2087215 ) ) ( not ( = ?auto_2087208 ?auto_2087216 ) ) ( not ( = ?auto_2087208 ?auto_2087217 ) ) ( not ( = ?auto_2087208 ?auto_2087218 ) ) ( not ( = ?auto_2087208 ?auto_2087219 ) ) ( not ( = ?auto_2087208 ?auto_2087220 ) ) ( not ( = ?auto_2087208 ?auto_2087221 ) ) ( not ( = ?auto_2087208 ?auto_2087222 ) ) ( not ( = ?auto_2087209 ?auto_2087210 ) ) ( not ( = ?auto_2087209 ?auto_2087212 ) ) ( not ( = ?auto_2087209 ?auto_2087211 ) ) ( not ( = ?auto_2087209 ?auto_2087213 ) ) ( not ( = ?auto_2087209 ?auto_2087214 ) ) ( not ( = ?auto_2087209 ?auto_2087215 ) ) ( not ( = ?auto_2087209 ?auto_2087216 ) ) ( not ( = ?auto_2087209 ?auto_2087217 ) ) ( not ( = ?auto_2087209 ?auto_2087218 ) ) ( not ( = ?auto_2087209 ?auto_2087219 ) ) ( not ( = ?auto_2087209 ?auto_2087220 ) ) ( not ( = ?auto_2087209 ?auto_2087221 ) ) ( not ( = ?auto_2087209 ?auto_2087222 ) ) ( not ( = ?auto_2087210 ?auto_2087212 ) ) ( not ( = ?auto_2087210 ?auto_2087211 ) ) ( not ( = ?auto_2087210 ?auto_2087213 ) ) ( not ( = ?auto_2087210 ?auto_2087214 ) ) ( not ( = ?auto_2087210 ?auto_2087215 ) ) ( not ( = ?auto_2087210 ?auto_2087216 ) ) ( not ( = ?auto_2087210 ?auto_2087217 ) ) ( not ( = ?auto_2087210 ?auto_2087218 ) ) ( not ( = ?auto_2087210 ?auto_2087219 ) ) ( not ( = ?auto_2087210 ?auto_2087220 ) ) ( not ( = ?auto_2087210 ?auto_2087221 ) ) ( not ( = ?auto_2087210 ?auto_2087222 ) ) ( not ( = ?auto_2087212 ?auto_2087211 ) ) ( not ( = ?auto_2087212 ?auto_2087213 ) ) ( not ( = ?auto_2087212 ?auto_2087214 ) ) ( not ( = ?auto_2087212 ?auto_2087215 ) ) ( not ( = ?auto_2087212 ?auto_2087216 ) ) ( not ( = ?auto_2087212 ?auto_2087217 ) ) ( not ( = ?auto_2087212 ?auto_2087218 ) ) ( not ( = ?auto_2087212 ?auto_2087219 ) ) ( not ( = ?auto_2087212 ?auto_2087220 ) ) ( not ( = ?auto_2087212 ?auto_2087221 ) ) ( not ( = ?auto_2087212 ?auto_2087222 ) ) ( not ( = ?auto_2087211 ?auto_2087213 ) ) ( not ( = ?auto_2087211 ?auto_2087214 ) ) ( not ( = ?auto_2087211 ?auto_2087215 ) ) ( not ( = ?auto_2087211 ?auto_2087216 ) ) ( not ( = ?auto_2087211 ?auto_2087217 ) ) ( not ( = ?auto_2087211 ?auto_2087218 ) ) ( not ( = ?auto_2087211 ?auto_2087219 ) ) ( not ( = ?auto_2087211 ?auto_2087220 ) ) ( not ( = ?auto_2087211 ?auto_2087221 ) ) ( not ( = ?auto_2087211 ?auto_2087222 ) ) ( not ( = ?auto_2087213 ?auto_2087214 ) ) ( not ( = ?auto_2087213 ?auto_2087215 ) ) ( not ( = ?auto_2087213 ?auto_2087216 ) ) ( not ( = ?auto_2087213 ?auto_2087217 ) ) ( not ( = ?auto_2087213 ?auto_2087218 ) ) ( not ( = ?auto_2087213 ?auto_2087219 ) ) ( not ( = ?auto_2087213 ?auto_2087220 ) ) ( not ( = ?auto_2087213 ?auto_2087221 ) ) ( not ( = ?auto_2087213 ?auto_2087222 ) ) ( not ( = ?auto_2087214 ?auto_2087215 ) ) ( not ( = ?auto_2087214 ?auto_2087216 ) ) ( not ( = ?auto_2087214 ?auto_2087217 ) ) ( not ( = ?auto_2087214 ?auto_2087218 ) ) ( not ( = ?auto_2087214 ?auto_2087219 ) ) ( not ( = ?auto_2087214 ?auto_2087220 ) ) ( not ( = ?auto_2087214 ?auto_2087221 ) ) ( not ( = ?auto_2087214 ?auto_2087222 ) ) ( not ( = ?auto_2087215 ?auto_2087216 ) ) ( not ( = ?auto_2087215 ?auto_2087217 ) ) ( not ( = ?auto_2087215 ?auto_2087218 ) ) ( not ( = ?auto_2087215 ?auto_2087219 ) ) ( not ( = ?auto_2087215 ?auto_2087220 ) ) ( not ( = ?auto_2087215 ?auto_2087221 ) ) ( not ( = ?auto_2087215 ?auto_2087222 ) ) ( not ( = ?auto_2087216 ?auto_2087217 ) ) ( not ( = ?auto_2087216 ?auto_2087218 ) ) ( not ( = ?auto_2087216 ?auto_2087219 ) ) ( not ( = ?auto_2087216 ?auto_2087220 ) ) ( not ( = ?auto_2087216 ?auto_2087221 ) ) ( not ( = ?auto_2087216 ?auto_2087222 ) ) ( not ( = ?auto_2087217 ?auto_2087218 ) ) ( not ( = ?auto_2087217 ?auto_2087219 ) ) ( not ( = ?auto_2087217 ?auto_2087220 ) ) ( not ( = ?auto_2087217 ?auto_2087221 ) ) ( not ( = ?auto_2087217 ?auto_2087222 ) ) ( not ( = ?auto_2087218 ?auto_2087219 ) ) ( not ( = ?auto_2087218 ?auto_2087220 ) ) ( not ( = ?auto_2087218 ?auto_2087221 ) ) ( not ( = ?auto_2087218 ?auto_2087222 ) ) ( not ( = ?auto_2087219 ?auto_2087220 ) ) ( not ( = ?auto_2087219 ?auto_2087221 ) ) ( not ( = ?auto_2087219 ?auto_2087222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087220 ?auto_2087221 ?auto_2087222 )
      ( MAKE-14CRATE-VERIFY ?auto_2087208 ?auto_2087209 ?auto_2087210 ?auto_2087212 ?auto_2087211 ?auto_2087213 ?auto_2087214 ?auto_2087215 ?auto_2087216 ?auto_2087217 ?auto_2087218 ?auto_2087219 ?auto_2087220 ?auto_2087221 ?auto_2087222 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087383 - SURFACE
      ?auto_2087384 - SURFACE
      ?auto_2087385 - SURFACE
      ?auto_2087387 - SURFACE
      ?auto_2087386 - SURFACE
      ?auto_2087388 - SURFACE
      ?auto_2087389 - SURFACE
      ?auto_2087390 - SURFACE
      ?auto_2087391 - SURFACE
      ?auto_2087392 - SURFACE
      ?auto_2087393 - SURFACE
      ?auto_2087394 - SURFACE
      ?auto_2087395 - SURFACE
      ?auto_2087396 - SURFACE
      ?auto_2087397 - SURFACE
    )
    :vars
    (
      ?auto_2087398 - HOIST
      ?auto_2087399 - PLACE
      ?auto_2087401 - TRUCK
      ?auto_2087400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087398 ?auto_2087399 ) ( SURFACE-AT ?auto_2087396 ?auto_2087399 ) ( CLEAR ?auto_2087396 ) ( IS-CRATE ?auto_2087397 ) ( not ( = ?auto_2087396 ?auto_2087397 ) ) ( AVAILABLE ?auto_2087398 ) ( IN ?auto_2087397 ?auto_2087401 ) ( ON ?auto_2087396 ?auto_2087395 ) ( not ( = ?auto_2087395 ?auto_2087396 ) ) ( not ( = ?auto_2087395 ?auto_2087397 ) ) ( TRUCK-AT ?auto_2087401 ?auto_2087400 ) ( not ( = ?auto_2087400 ?auto_2087399 ) ) ( ON ?auto_2087384 ?auto_2087383 ) ( ON ?auto_2087385 ?auto_2087384 ) ( ON ?auto_2087387 ?auto_2087385 ) ( ON ?auto_2087386 ?auto_2087387 ) ( ON ?auto_2087388 ?auto_2087386 ) ( ON ?auto_2087389 ?auto_2087388 ) ( ON ?auto_2087390 ?auto_2087389 ) ( ON ?auto_2087391 ?auto_2087390 ) ( ON ?auto_2087392 ?auto_2087391 ) ( ON ?auto_2087393 ?auto_2087392 ) ( ON ?auto_2087394 ?auto_2087393 ) ( ON ?auto_2087395 ?auto_2087394 ) ( not ( = ?auto_2087383 ?auto_2087384 ) ) ( not ( = ?auto_2087383 ?auto_2087385 ) ) ( not ( = ?auto_2087383 ?auto_2087387 ) ) ( not ( = ?auto_2087383 ?auto_2087386 ) ) ( not ( = ?auto_2087383 ?auto_2087388 ) ) ( not ( = ?auto_2087383 ?auto_2087389 ) ) ( not ( = ?auto_2087383 ?auto_2087390 ) ) ( not ( = ?auto_2087383 ?auto_2087391 ) ) ( not ( = ?auto_2087383 ?auto_2087392 ) ) ( not ( = ?auto_2087383 ?auto_2087393 ) ) ( not ( = ?auto_2087383 ?auto_2087394 ) ) ( not ( = ?auto_2087383 ?auto_2087395 ) ) ( not ( = ?auto_2087383 ?auto_2087396 ) ) ( not ( = ?auto_2087383 ?auto_2087397 ) ) ( not ( = ?auto_2087384 ?auto_2087385 ) ) ( not ( = ?auto_2087384 ?auto_2087387 ) ) ( not ( = ?auto_2087384 ?auto_2087386 ) ) ( not ( = ?auto_2087384 ?auto_2087388 ) ) ( not ( = ?auto_2087384 ?auto_2087389 ) ) ( not ( = ?auto_2087384 ?auto_2087390 ) ) ( not ( = ?auto_2087384 ?auto_2087391 ) ) ( not ( = ?auto_2087384 ?auto_2087392 ) ) ( not ( = ?auto_2087384 ?auto_2087393 ) ) ( not ( = ?auto_2087384 ?auto_2087394 ) ) ( not ( = ?auto_2087384 ?auto_2087395 ) ) ( not ( = ?auto_2087384 ?auto_2087396 ) ) ( not ( = ?auto_2087384 ?auto_2087397 ) ) ( not ( = ?auto_2087385 ?auto_2087387 ) ) ( not ( = ?auto_2087385 ?auto_2087386 ) ) ( not ( = ?auto_2087385 ?auto_2087388 ) ) ( not ( = ?auto_2087385 ?auto_2087389 ) ) ( not ( = ?auto_2087385 ?auto_2087390 ) ) ( not ( = ?auto_2087385 ?auto_2087391 ) ) ( not ( = ?auto_2087385 ?auto_2087392 ) ) ( not ( = ?auto_2087385 ?auto_2087393 ) ) ( not ( = ?auto_2087385 ?auto_2087394 ) ) ( not ( = ?auto_2087385 ?auto_2087395 ) ) ( not ( = ?auto_2087385 ?auto_2087396 ) ) ( not ( = ?auto_2087385 ?auto_2087397 ) ) ( not ( = ?auto_2087387 ?auto_2087386 ) ) ( not ( = ?auto_2087387 ?auto_2087388 ) ) ( not ( = ?auto_2087387 ?auto_2087389 ) ) ( not ( = ?auto_2087387 ?auto_2087390 ) ) ( not ( = ?auto_2087387 ?auto_2087391 ) ) ( not ( = ?auto_2087387 ?auto_2087392 ) ) ( not ( = ?auto_2087387 ?auto_2087393 ) ) ( not ( = ?auto_2087387 ?auto_2087394 ) ) ( not ( = ?auto_2087387 ?auto_2087395 ) ) ( not ( = ?auto_2087387 ?auto_2087396 ) ) ( not ( = ?auto_2087387 ?auto_2087397 ) ) ( not ( = ?auto_2087386 ?auto_2087388 ) ) ( not ( = ?auto_2087386 ?auto_2087389 ) ) ( not ( = ?auto_2087386 ?auto_2087390 ) ) ( not ( = ?auto_2087386 ?auto_2087391 ) ) ( not ( = ?auto_2087386 ?auto_2087392 ) ) ( not ( = ?auto_2087386 ?auto_2087393 ) ) ( not ( = ?auto_2087386 ?auto_2087394 ) ) ( not ( = ?auto_2087386 ?auto_2087395 ) ) ( not ( = ?auto_2087386 ?auto_2087396 ) ) ( not ( = ?auto_2087386 ?auto_2087397 ) ) ( not ( = ?auto_2087388 ?auto_2087389 ) ) ( not ( = ?auto_2087388 ?auto_2087390 ) ) ( not ( = ?auto_2087388 ?auto_2087391 ) ) ( not ( = ?auto_2087388 ?auto_2087392 ) ) ( not ( = ?auto_2087388 ?auto_2087393 ) ) ( not ( = ?auto_2087388 ?auto_2087394 ) ) ( not ( = ?auto_2087388 ?auto_2087395 ) ) ( not ( = ?auto_2087388 ?auto_2087396 ) ) ( not ( = ?auto_2087388 ?auto_2087397 ) ) ( not ( = ?auto_2087389 ?auto_2087390 ) ) ( not ( = ?auto_2087389 ?auto_2087391 ) ) ( not ( = ?auto_2087389 ?auto_2087392 ) ) ( not ( = ?auto_2087389 ?auto_2087393 ) ) ( not ( = ?auto_2087389 ?auto_2087394 ) ) ( not ( = ?auto_2087389 ?auto_2087395 ) ) ( not ( = ?auto_2087389 ?auto_2087396 ) ) ( not ( = ?auto_2087389 ?auto_2087397 ) ) ( not ( = ?auto_2087390 ?auto_2087391 ) ) ( not ( = ?auto_2087390 ?auto_2087392 ) ) ( not ( = ?auto_2087390 ?auto_2087393 ) ) ( not ( = ?auto_2087390 ?auto_2087394 ) ) ( not ( = ?auto_2087390 ?auto_2087395 ) ) ( not ( = ?auto_2087390 ?auto_2087396 ) ) ( not ( = ?auto_2087390 ?auto_2087397 ) ) ( not ( = ?auto_2087391 ?auto_2087392 ) ) ( not ( = ?auto_2087391 ?auto_2087393 ) ) ( not ( = ?auto_2087391 ?auto_2087394 ) ) ( not ( = ?auto_2087391 ?auto_2087395 ) ) ( not ( = ?auto_2087391 ?auto_2087396 ) ) ( not ( = ?auto_2087391 ?auto_2087397 ) ) ( not ( = ?auto_2087392 ?auto_2087393 ) ) ( not ( = ?auto_2087392 ?auto_2087394 ) ) ( not ( = ?auto_2087392 ?auto_2087395 ) ) ( not ( = ?auto_2087392 ?auto_2087396 ) ) ( not ( = ?auto_2087392 ?auto_2087397 ) ) ( not ( = ?auto_2087393 ?auto_2087394 ) ) ( not ( = ?auto_2087393 ?auto_2087395 ) ) ( not ( = ?auto_2087393 ?auto_2087396 ) ) ( not ( = ?auto_2087393 ?auto_2087397 ) ) ( not ( = ?auto_2087394 ?auto_2087395 ) ) ( not ( = ?auto_2087394 ?auto_2087396 ) ) ( not ( = ?auto_2087394 ?auto_2087397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087395 ?auto_2087396 ?auto_2087397 )
      ( MAKE-14CRATE-VERIFY ?auto_2087383 ?auto_2087384 ?auto_2087385 ?auto_2087387 ?auto_2087386 ?auto_2087388 ?auto_2087389 ?auto_2087390 ?auto_2087391 ?auto_2087392 ?auto_2087393 ?auto_2087394 ?auto_2087395 ?auto_2087396 ?auto_2087397 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087572 - SURFACE
      ?auto_2087573 - SURFACE
      ?auto_2087574 - SURFACE
      ?auto_2087576 - SURFACE
      ?auto_2087575 - SURFACE
      ?auto_2087577 - SURFACE
      ?auto_2087578 - SURFACE
      ?auto_2087579 - SURFACE
      ?auto_2087580 - SURFACE
      ?auto_2087581 - SURFACE
      ?auto_2087582 - SURFACE
      ?auto_2087583 - SURFACE
      ?auto_2087584 - SURFACE
      ?auto_2087585 - SURFACE
      ?auto_2087586 - SURFACE
    )
    :vars
    (
      ?auto_2087591 - HOIST
      ?auto_2087587 - PLACE
      ?auto_2087589 - TRUCK
      ?auto_2087588 - PLACE
      ?auto_2087590 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087591 ?auto_2087587 ) ( SURFACE-AT ?auto_2087585 ?auto_2087587 ) ( CLEAR ?auto_2087585 ) ( IS-CRATE ?auto_2087586 ) ( not ( = ?auto_2087585 ?auto_2087586 ) ) ( AVAILABLE ?auto_2087591 ) ( ON ?auto_2087585 ?auto_2087584 ) ( not ( = ?auto_2087584 ?auto_2087585 ) ) ( not ( = ?auto_2087584 ?auto_2087586 ) ) ( TRUCK-AT ?auto_2087589 ?auto_2087588 ) ( not ( = ?auto_2087588 ?auto_2087587 ) ) ( HOIST-AT ?auto_2087590 ?auto_2087588 ) ( LIFTING ?auto_2087590 ?auto_2087586 ) ( not ( = ?auto_2087591 ?auto_2087590 ) ) ( ON ?auto_2087573 ?auto_2087572 ) ( ON ?auto_2087574 ?auto_2087573 ) ( ON ?auto_2087576 ?auto_2087574 ) ( ON ?auto_2087575 ?auto_2087576 ) ( ON ?auto_2087577 ?auto_2087575 ) ( ON ?auto_2087578 ?auto_2087577 ) ( ON ?auto_2087579 ?auto_2087578 ) ( ON ?auto_2087580 ?auto_2087579 ) ( ON ?auto_2087581 ?auto_2087580 ) ( ON ?auto_2087582 ?auto_2087581 ) ( ON ?auto_2087583 ?auto_2087582 ) ( ON ?auto_2087584 ?auto_2087583 ) ( not ( = ?auto_2087572 ?auto_2087573 ) ) ( not ( = ?auto_2087572 ?auto_2087574 ) ) ( not ( = ?auto_2087572 ?auto_2087576 ) ) ( not ( = ?auto_2087572 ?auto_2087575 ) ) ( not ( = ?auto_2087572 ?auto_2087577 ) ) ( not ( = ?auto_2087572 ?auto_2087578 ) ) ( not ( = ?auto_2087572 ?auto_2087579 ) ) ( not ( = ?auto_2087572 ?auto_2087580 ) ) ( not ( = ?auto_2087572 ?auto_2087581 ) ) ( not ( = ?auto_2087572 ?auto_2087582 ) ) ( not ( = ?auto_2087572 ?auto_2087583 ) ) ( not ( = ?auto_2087572 ?auto_2087584 ) ) ( not ( = ?auto_2087572 ?auto_2087585 ) ) ( not ( = ?auto_2087572 ?auto_2087586 ) ) ( not ( = ?auto_2087573 ?auto_2087574 ) ) ( not ( = ?auto_2087573 ?auto_2087576 ) ) ( not ( = ?auto_2087573 ?auto_2087575 ) ) ( not ( = ?auto_2087573 ?auto_2087577 ) ) ( not ( = ?auto_2087573 ?auto_2087578 ) ) ( not ( = ?auto_2087573 ?auto_2087579 ) ) ( not ( = ?auto_2087573 ?auto_2087580 ) ) ( not ( = ?auto_2087573 ?auto_2087581 ) ) ( not ( = ?auto_2087573 ?auto_2087582 ) ) ( not ( = ?auto_2087573 ?auto_2087583 ) ) ( not ( = ?auto_2087573 ?auto_2087584 ) ) ( not ( = ?auto_2087573 ?auto_2087585 ) ) ( not ( = ?auto_2087573 ?auto_2087586 ) ) ( not ( = ?auto_2087574 ?auto_2087576 ) ) ( not ( = ?auto_2087574 ?auto_2087575 ) ) ( not ( = ?auto_2087574 ?auto_2087577 ) ) ( not ( = ?auto_2087574 ?auto_2087578 ) ) ( not ( = ?auto_2087574 ?auto_2087579 ) ) ( not ( = ?auto_2087574 ?auto_2087580 ) ) ( not ( = ?auto_2087574 ?auto_2087581 ) ) ( not ( = ?auto_2087574 ?auto_2087582 ) ) ( not ( = ?auto_2087574 ?auto_2087583 ) ) ( not ( = ?auto_2087574 ?auto_2087584 ) ) ( not ( = ?auto_2087574 ?auto_2087585 ) ) ( not ( = ?auto_2087574 ?auto_2087586 ) ) ( not ( = ?auto_2087576 ?auto_2087575 ) ) ( not ( = ?auto_2087576 ?auto_2087577 ) ) ( not ( = ?auto_2087576 ?auto_2087578 ) ) ( not ( = ?auto_2087576 ?auto_2087579 ) ) ( not ( = ?auto_2087576 ?auto_2087580 ) ) ( not ( = ?auto_2087576 ?auto_2087581 ) ) ( not ( = ?auto_2087576 ?auto_2087582 ) ) ( not ( = ?auto_2087576 ?auto_2087583 ) ) ( not ( = ?auto_2087576 ?auto_2087584 ) ) ( not ( = ?auto_2087576 ?auto_2087585 ) ) ( not ( = ?auto_2087576 ?auto_2087586 ) ) ( not ( = ?auto_2087575 ?auto_2087577 ) ) ( not ( = ?auto_2087575 ?auto_2087578 ) ) ( not ( = ?auto_2087575 ?auto_2087579 ) ) ( not ( = ?auto_2087575 ?auto_2087580 ) ) ( not ( = ?auto_2087575 ?auto_2087581 ) ) ( not ( = ?auto_2087575 ?auto_2087582 ) ) ( not ( = ?auto_2087575 ?auto_2087583 ) ) ( not ( = ?auto_2087575 ?auto_2087584 ) ) ( not ( = ?auto_2087575 ?auto_2087585 ) ) ( not ( = ?auto_2087575 ?auto_2087586 ) ) ( not ( = ?auto_2087577 ?auto_2087578 ) ) ( not ( = ?auto_2087577 ?auto_2087579 ) ) ( not ( = ?auto_2087577 ?auto_2087580 ) ) ( not ( = ?auto_2087577 ?auto_2087581 ) ) ( not ( = ?auto_2087577 ?auto_2087582 ) ) ( not ( = ?auto_2087577 ?auto_2087583 ) ) ( not ( = ?auto_2087577 ?auto_2087584 ) ) ( not ( = ?auto_2087577 ?auto_2087585 ) ) ( not ( = ?auto_2087577 ?auto_2087586 ) ) ( not ( = ?auto_2087578 ?auto_2087579 ) ) ( not ( = ?auto_2087578 ?auto_2087580 ) ) ( not ( = ?auto_2087578 ?auto_2087581 ) ) ( not ( = ?auto_2087578 ?auto_2087582 ) ) ( not ( = ?auto_2087578 ?auto_2087583 ) ) ( not ( = ?auto_2087578 ?auto_2087584 ) ) ( not ( = ?auto_2087578 ?auto_2087585 ) ) ( not ( = ?auto_2087578 ?auto_2087586 ) ) ( not ( = ?auto_2087579 ?auto_2087580 ) ) ( not ( = ?auto_2087579 ?auto_2087581 ) ) ( not ( = ?auto_2087579 ?auto_2087582 ) ) ( not ( = ?auto_2087579 ?auto_2087583 ) ) ( not ( = ?auto_2087579 ?auto_2087584 ) ) ( not ( = ?auto_2087579 ?auto_2087585 ) ) ( not ( = ?auto_2087579 ?auto_2087586 ) ) ( not ( = ?auto_2087580 ?auto_2087581 ) ) ( not ( = ?auto_2087580 ?auto_2087582 ) ) ( not ( = ?auto_2087580 ?auto_2087583 ) ) ( not ( = ?auto_2087580 ?auto_2087584 ) ) ( not ( = ?auto_2087580 ?auto_2087585 ) ) ( not ( = ?auto_2087580 ?auto_2087586 ) ) ( not ( = ?auto_2087581 ?auto_2087582 ) ) ( not ( = ?auto_2087581 ?auto_2087583 ) ) ( not ( = ?auto_2087581 ?auto_2087584 ) ) ( not ( = ?auto_2087581 ?auto_2087585 ) ) ( not ( = ?auto_2087581 ?auto_2087586 ) ) ( not ( = ?auto_2087582 ?auto_2087583 ) ) ( not ( = ?auto_2087582 ?auto_2087584 ) ) ( not ( = ?auto_2087582 ?auto_2087585 ) ) ( not ( = ?auto_2087582 ?auto_2087586 ) ) ( not ( = ?auto_2087583 ?auto_2087584 ) ) ( not ( = ?auto_2087583 ?auto_2087585 ) ) ( not ( = ?auto_2087583 ?auto_2087586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087584 ?auto_2087585 ?auto_2087586 )
      ( MAKE-14CRATE-VERIFY ?auto_2087572 ?auto_2087573 ?auto_2087574 ?auto_2087576 ?auto_2087575 ?auto_2087577 ?auto_2087578 ?auto_2087579 ?auto_2087580 ?auto_2087581 ?auto_2087582 ?auto_2087583 ?auto_2087584 ?auto_2087585 ?auto_2087586 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087775 - SURFACE
      ?auto_2087776 - SURFACE
      ?auto_2087777 - SURFACE
      ?auto_2087779 - SURFACE
      ?auto_2087778 - SURFACE
      ?auto_2087780 - SURFACE
      ?auto_2087781 - SURFACE
      ?auto_2087782 - SURFACE
      ?auto_2087783 - SURFACE
      ?auto_2087784 - SURFACE
      ?auto_2087785 - SURFACE
      ?auto_2087786 - SURFACE
      ?auto_2087787 - SURFACE
      ?auto_2087788 - SURFACE
      ?auto_2087789 - SURFACE
    )
    :vars
    (
      ?auto_2087793 - HOIST
      ?auto_2087791 - PLACE
      ?auto_2087795 - TRUCK
      ?auto_2087794 - PLACE
      ?auto_2087790 - HOIST
      ?auto_2087792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087793 ?auto_2087791 ) ( SURFACE-AT ?auto_2087788 ?auto_2087791 ) ( CLEAR ?auto_2087788 ) ( IS-CRATE ?auto_2087789 ) ( not ( = ?auto_2087788 ?auto_2087789 ) ) ( AVAILABLE ?auto_2087793 ) ( ON ?auto_2087788 ?auto_2087787 ) ( not ( = ?auto_2087787 ?auto_2087788 ) ) ( not ( = ?auto_2087787 ?auto_2087789 ) ) ( TRUCK-AT ?auto_2087795 ?auto_2087794 ) ( not ( = ?auto_2087794 ?auto_2087791 ) ) ( HOIST-AT ?auto_2087790 ?auto_2087794 ) ( not ( = ?auto_2087793 ?auto_2087790 ) ) ( AVAILABLE ?auto_2087790 ) ( SURFACE-AT ?auto_2087789 ?auto_2087794 ) ( ON ?auto_2087789 ?auto_2087792 ) ( CLEAR ?auto_2087789 ) ( not ( = ?auto_2087788 ?auto_2087792 ) ) ( not ( = ?auto_2087789 ?auto_2087792 ) ) ( not ( = ?auto_2087787 ?auto_2087792 ) ) ( ON ?auto_2087776 ?auto_2087775 ) ( ON ?auto_2087777 ?auto_2087776 ) ( ON ?auto_2087779 ?auto_2087777 ) ( ON ?auto_2087778 ?auto_2087779 ) ( ON ?auto_2087780 ?auto_2087778 ) ( ON ?auto_2087781 ?auto_2087780 ) ( ON ?auto_2087782 ?auto_2087781 ) ( ON ?auto_2087783 ?auto_2087782 ) ( ON ?auto_2087784 ?auto_2087783 ) ( ON ?auto_2087785 ?auto_2087784 ) ( ON ?auto_2087786 ?auto_2087785 ) ( ON ?auto_2087787 ?auto_2087786 ) ( not ( = ?auto_2087775 ?auto_2087776 ) ) ( not ( = ?auto_2087775 ?auto_2087777 ) ) ( not ( = ?auto_2087775 ?auto_2087779 ) ) ( not ( = ?auto_2087775 ?auto_2087778 ) ) ( not ( = ?auto_2087775 ?auto_2087780 ) ) ( not ( = ?auto_2087775 ?auto_2087781 ) ) ( not ( = ?auto_2087775 ?auto_2087782 ) ) ( not ( = ?auto_2087775 ?auto_2087783 ) ) ( not ( = ?auto_2087775 ?auto_2087784 ) ) ( not ( = ?auto_2087775 ?auto_2087785 ) ) ( not ( = ?auto_2087775 ?auto_2087786 ) ) ( not ( = ?auto_2087775 ?auto_2087787 ) ) ( not ( = ?auto_2087775 ?auto_2087788 ) ) ( not ( = ?auto_2087775 ?auto_2087789 ) ) ( not ( = ?auto_2087775 ?auto_2087792 ) ) ( not ( = ?auto_2087776 ?auto_2087777 ) ) ( not ( = ?auto_2087776 ?auto_2087779 ) ) ( not ( = ?auto_2087776 ?auto_2087778 ) ) ( not ( = ?auto_2087776 ?auto_2087780 ) ) ( not ( = ?auto_2087776 ?auto_2087781 ) ) ( not ( = ?auto_2087776 ?auto_2087782 ) ) ( not ( = ?auto_2087776 ?auto_2087783 ) ) ( not ( = ?auto_2087776 ?auto_2087784 ) ) ( not ( = ?auto_2087776 ?auto_2087785 ) ) ( not ( = ?auto_2087776 ?auto_2087786 ) ) ( not ( = ?auto_2087776 ?auto_2087787 ) ) ( not ( = ?auto_2087776 ?auto_2087788 ) ) ( not ( = ?auto_2087776 ?auto_2087789 ) ) ( not ( = ?auto_2087776 ?auto_2087792 ) ) ( not ( = ?auto_2087777 ?auto_2087779 ) ) ( not ( = ?auto_2087777 ?auto_2087778 ) ) ( not ( = ?auto_2087777 ?auto_2087780 ) ) ( not ( = ?auto_2087777 ?auto_2087781 ) ) ( not ( = ?auto_2087777 ?auto_2087782 ) ) ( not ( = ?auto_2087777 ?auto_2087783 ) ) ( not ( = ?auto_2087777 ?auto_2087784 ) ) ( not ( = ?auto_2087777 ?auto_2087785 ) ) ( not ( = ?auto_2087777 ?auto_2087786 ) ) ( not ( = ?auto_2087777 ?auto_2087787 ) ) ( not ( = ?auto_2087777 ?auto_2087788 ) ) ( not ( = ?auto_2087777 ?auto_2087789 ) ) ( not ( = ?auto_2087777 ?auto_2087792 ) ) ( not ( = ?auto_2087779 ?auto_2087778 ) ) ( not ( = ?auto_2087779 ?auto_2087780 ) ) ( not ( = ?auto_2087779 ?auto_2087781 ) ) ( not ( = ?auto_2087779 ?auto_2087782 ) ) ( not ( = ?auto_2087779 ?auto_2087783 ) ) ( not ( = ?auto_2087779 ?auto_2087784 ) ) ( not ( = ?auto_2087779 ?auto_2087785 ) ) ( not ( = ?auto_2087779 ?auto_2087786 ) ) ( not ( = ?auto_2087779 ?auto_2087787 ) ) ( not ( = ?auto_2087779 ?auto_2087788 ) ) ( not ( = ?auto_2087779 ?auto_2087789 ) ) ( not ( = ?auto_2087779 ?auto_2087792 ) ) ( not ( = ?auto_2087778 ?auto_2087780 ) ) ( not ( = ?auto_2087778 ?auto_2087781 ) ) ( not ( = ?auto_2087778 ?auto_2087782 ) ) ( not ( = ?auto_2087778 ?auto_2087783 ) ) ( not ( = ?auto_2087778 ?auto_2087784 ) ) ( not ( = ?auto_2087778 ?auto_2087785 ) ) ( not ( = ?auto_2087778 ?auto_2087786 ) ) ( not ( = ?auto_2087778 ?auto_2087787 ) ) ( not ( = ?auto_2087778 ?auto_2087788 ) ) ( not ( = ?auto_2087778 ?auto_2087789 ) ) ( not ( = ?auto_2087778 ?auto_2087792 ) ) ( not ( = ?auto_2087780 ?auto_2087781 ) ) ( not ( = ?auto_2087780 ?auto_2087782 ) ) ( not ( = ?auto_2087780 ?auto_2087783 ) ) ( not ( = ?auto_2087780 ?auto_2087784 ) ) ( not ( = ?auto_2087780 ?auto_2087785 ) ) ( not ( = ?auto_2087780 ?auto_2087786 ) ) ( not ( = ?auto_2087780 ?auto_2087787 ) ) ( not ( = ?auto_2087780 ?auto_2087788 ) ) ( not ( = ?auto_2087780 ?auto_2087789 ) ) ( not ( = ?auto_2087780 ?auto_2087792 ) ) ( not ( = ?auto_2087781 ?auto_2087782 ) ) ( not ( = ?auto_2087781 ?auto_2087783 ) ) ( not ( = ?auto_2087781 ?auto_2087784 ) ) ( not ( = ?auto_2087781 ?auto_2087785 ) ) ( not ( = ?auto_2087781 ?auto_2087786 ) ) ( not ( = ?auto_2087781 ?auto_2087787 ) ) ( not ( = ?auto_2087781 ?auto_2087788 ) ) ( not ( = ?auto_2087781 ?auto_2087789 ) ) ( not ( = ?auto_2087781 ?auto_2087792 ) ) ( not ( = ?auto_2087782 ?auto_2087783 ) ) ( not ( = ?auto_2087782 ?auto_2087784 ) ) ( not ( = ?auto_2087782 ?auto_2087785 ) ) ( not ( = ?auto_2087782 ?auto_2087786 ) ) ( not ( = ?auto_2087782 ?auto_2087787 ) ) ( not ( = ?auto_2087782 ?auto_2087788 ) ) ( not ( = ?auto_2087782 ?auto_2087789 ) ) ( not ( = ?auto_2087782 ?auto_2087792 ) ) ( not ( = ?auto_2087783 ?auto_2087784 ) ) ( not ( = ?auto_2087783 ?auto_2087785 ) ) ( not ( = ?auto_2087783 ?auto_2087786 ) ) ( not ( = ?auto_2087783 ?auto_2087787 ) ) ( not ( = ?auto_2087783 ?auto_2087788 ) ) ( not ( = ?auto_2087783 ?auto_2087789 ) ) ( not ( = ?auto_2087783 ?auto_2087792 ) ) ( not ( = ?auto_2087784 ?auto_2087785 ) ) ( not ( = ?auto_2087784 ?auto_2087786 ) ) ( not ( = ?auto_2087784 ?auto_2087787 ) ) ( not ( = ?auto_2087784 ?auto_2087788 ) ) ( not ( = ?auto_2087784 ?auto_2087789 ) ) ( not ( = ?auto_2087784 ?auto_2087792 ) ) ( not ( = ?auto_2087785 ?auto_2087786 ) ) ( not ( = ?auto_2087785 ?auto_2087787 ) ) ( not ( = ?auto_2087785 ?auto_2087788 ) ) ( not ( = ?auto_2087785 ?auto_2087789 ) ) ( not ( = ?auto_2087785 ?auto_2087792 ) ) ( not ( = ?auto_2087786 ?auto_2087787 ) ) ( not ( = ?auto_2087786 ?auto_2087788 ) ) ( not ( = ?auto_2087786 ?auto_2087789 ) ) ( not ( = ?auto_2087786 ?auto_2087792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087787 ?auto_2087788 ?auto_2087789 )
      ( MAKE-14CRATE-VERIFY ?auto_2087775 ?auto_2087776 ?auto_2087777 ?auto_2087779 ?auto_2087778 ?auto_2087780 ?auto_2087781 ?auto_2087782 ?auto_2087783 ?auto_2087784 ?auto_2087785 ?auto_2087786 ?auto_2087787 ?auto_2087788 ?auto_2087789 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087979 - SURFACE
      ?auto_2087980 - SURFACE
      ?auto_2087981 - SURFACE
      ?auto_2087983 - SURFACE
      ?auto_2087982 - SURFACE
      ?auto_2087984 - SURFACE
      ?auto_2087985 - SURFACE
      ?auto_2087986 - SURFACE
      ?auto_2087987 - SURFACE
      ?auto_2087988 - SURFACE
      ?auto_2087989 - SURFACE
      ?auto_2087990 - SURFACE
      ?auto_2087991 - SURFACE
      ?auto_2087992 - SURFACE
      ?auto_2087993 - SURFACE
    )
    :vars
    (
      ?auto_2087996 - HOIST
      ?auto_2087997 - PLACE
      ?auto_2087999 - PLACE
      ?auto_2087994 - HOIST
      ?auto_2087995 - SURFACE
      ?auto_2087998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087996 ?auto_2087997 ) ( SURFACE-AT ?auto_2087992 ?auto_2087997 ) ( CLEAR ?auto_2087992 ) ( IS-CRATE ?auto_2087993 ) ( not ( = ?auto_2087992 ?auto_2087993 ) ) ( AVAILABLE ?auto_2087996 ) ( ON ?auto_2087992 ?auto_2087991 ) ( not ( = ?auto_2087991 ?auto_2087992 ) ) ( not ( = ?auto_2087991 ?auto_2087993 ) ) ( not ( = ?auto_2087999 ?auto_2087997 ) ) ( HOIST-AT ?auto_2087994 ?auto_2087999 ) ( not ( = ?auto_2087996 ?auto_2087994 ) ) ( AVAILABLE ?auto_2087994 ) ( SURFACE-AT ?auto_2087993 ?auto_2087999 ) ( ON ?auto_2087993 ?auto_2087995 ) ( CLEAR ?auto_2087993 ) ( not ( = ?auto_2087992 ?auto_2087995 ) ) ( not ( = ?auto_2087993 ?auto_2087995 ) ) ( not ( = ?auto_2087991 ?auto_2087995 ) ) ( TRUCK-AT ?auto_2087998 ?auto_2087997 ) ( ON ?auto_2087980 ?auto_2087979 ) ( ON ?auto_2087981 ?auto_2087980 ) ( ON ?auto_2087983 ?auto_2087981 ) ( ON ?auto_2087982 ?auto_2087983 ) ( ON ?auto_2087984 ?auto_2087982 ) ( ON ?auto_2087985 ?auto_2087984 ) ( ON ?auto_2087986 ?auto_2087985 ) ( ON ?auto_2087987 ?auto_2087986 ) ( ON ?auto_2087988 ?auto_2087987 ) ( ON ?auto_2087989 ?auto_2087988 ) ( ON ?auto_2087990 ?auto_2087989 ) ( ON ?auto_2087991 ?auto_2087990 ) ( not ( = ?auto_2087979 ?auto_2087980 ) ) ( not ( = ?auto_2087979 ?auto_2087981 ) ) ( not ( = ?auto_2087979 ?auto_2087983 ) ) ( not ( = ?auto_2087979 ?auto_2087982 ) ) ( not ( = ?auto_2087979 ?auto_2087984 ) ) ( not ( = ?auto_2087979 ?auto_2087985 ) ) ( not ( = ?auto_2087979 ?auto_2087986 ) ) ( not ( = ?auto_2087979 ?auto_2087987 ) ) ( not ( = ?auto_2087979 ?auto_2087988 ) ) ( not ( = ?auto_2087979 ?auto_2087989 ) ) ( not ( = ?auto_2087979 ?auto_2087990 ) ) ( not ( = ?auto_2087979 ?auto_2087991 ) ) ( not ( = ?auto_2087979 ?auto_2087992 ) ) ( not ( = ?auto_2087979 ?auto_2087993 ) ) ( not ( = ?auto_2087979 ?auto_2087995 ) ) ( not ( = ?auto_2087980 ?auto_2087981 ) ) ( not ( = ?auto_2087980 ?auto_2087983 ) ) ( not ( = ?auto_2087980 ?auto_2087982 ) ) ( not ( = ?auto_2087980 ?auto_2087984 ) ) ( not ( = ?auto_2087980 ?auto_2087985 ) ) ( not ( = ?auto_2087980 ?auto_2087986 ) ) ( not ( = ?auto_2087980 ?auto_2087987 ) ) ( not ( = ?auto_2087980 ?auto_2087988 ) ) ( not ( = ?auto_2087980 ?auto_2087989 ) ) ( not ( = ?auto_2087980 ?auto_2087990 ) ) ( not ( = ?auto_2087980 ?auto_2087991 ) ) ( not ( = ?auto_2087980 ?auto_2087992 ) ) ( not ( = ?auto_2087980 ?auto_2087993 ) ) ( not ( = ?auto_2087980 ?auto_2087995 ) ) ( not ( = ?auto_2087981 ?auto_2087983 ) ) ( not ( = ?auto_2087981 ?auto_2087982 ) ) ( not ( = ?auto_2087981 ?auto_2087984 ) ) ( not ( = ?auto_2087981 ?auto_2087985 ) ) ( not ( = ?auto_2087981 ?auto_2087986 ) ) ( not ( = ?auto_2087981 ?auto_2087987 ) ) ( not ( = ?auto_2087981 ?auto_2087988 ) ) ( not ( = ?auto_2087981 ?auto_2087989 ) ) ( not ( = ?auto_2087981 ?auto_2087990 ) ) ( not ( = ?auto_2087981 ?auto_2087991 ) ) ( not ( = ?auto_2087981 ?auto_2087992 ) ) ( not ( = ?auto_2087981 ?auto_2087993 ) ) ( not ( = ?auto_2087981 ?auto_2087995 ) ) ( not ( = ?auto_2087983 ?auto_2087982 ) ) ( not ( = ?auto_2087983 ?auto_2087984 ) ) ( not ( = ?auto_2087983 ?auto_2087985 ) ) ( not ( = ?auto_2087983 ?auto_2087986 ) ) ( not ( = ?auto_2087983 ?auto_2087987 ) ) ( not ( = ?auto_2087983 ?auto_2087988 ) ) ( not ( = ?auto_2087983 ?auto_2087989 ) ) ( not ( = ?auto_2087983 ?auto_2087990 ) ) ( not ( = ?auto_2087983 ?auto_2087991 ) ) ( not ( = ?auto_2087983 ?auto_2087992 ) ) ( not ( = ?auto_2087983 ?auto_2087993 ) ) ( not ( = ?auto_2087983 ?auto_2087995 ) ) ( not ( = ?auto_2087982 ?auto_2087984 ) ) ( not ( = ?auto_2087982 ?auto_2087985 ) ) ( not ( = ?auto_2087982 ?auto_2087986 ) ) ( not ( = ?auto_2087982 ?auto_2087987 ) ) ( not ( = ?auto_2087982 ?auto_2087988 ) ) ( not ( = ?auto_2087982 ?auto_2087989 ) ) ( not ( = ?auto_2087982 ?auto_2087990 ) ) ( not ( = ?auto_2087982 ?auto_2087991 ) ) ( not ( = ?auto_2087982 ?auto_2087992 ) ) ( not ( = ?auto_2087982 ?auto_2087993 ) ) ( not ( = ?auto_2087982 ?auto_2087995 ) ) ( not ( = ?auto_2087984 ?auto_2087985 ) ) ( not ( = ?auto_2087984 ?auto_2087986 ) ) ( not ( = ?auto_2087984 ?auto_2087987 ) ) ( not ( = ?auto_2087984 ?auto_2087988 ) ) ( not ( = ?auto_2087984 ?auto_2087989 ) ) ( not ( = ?auto_2087984 ?auto_2087990 ) ) ( not ( = ?auto_2087984 ?auto_2087991 ) ) ( not ( = ?auto_2087984 ?auto_2087992 ) ) ( not ( = ?auto_2087984 ?auto_2087993 ) ) ( not ( = ?auto_2087984 ?auto_2087995 ) ) ( not ( = ?auto_2087985 ?auto_2087986 ) ) ( not ( = ?auto_2087985 ?auto_2087987 ) ) ( not ( = ?auto_2087985 ?auto_2087988 ) ) ( not ( = ?auto_2087985 ?auto_2087989 ) ) ( not ( = ?auto_2087985 ?auto_2087990 ) ) ( not ( = ?auto_2087985 ?auto_2087991 ) ) ( not ( = ?auto_2087985 ?auto_2087992 ) ) ( not ( = ?auto_2087985 ?auto_2087993 ) ) ( not ( = ?auto_2087985 ?auto_2087995 ) ) ( not ( = ?auto_2087986 ?auto_2087987 ) ) ( not ( = ?auto_2087986 ?auto_2087988 ) ) ( not ( = ?auto_2087986 ?auto_2087989 ) ) ( not ( = ?auto_2087986 ?auto_2087990 ) ) ( not ( = ?auto_2087986 ?auto_2087991 ) ) ( not ( = ?auto_2087986 ?auto_2087992 ) ) ( not ( = ?auto_2087986 ?auto_2087993 ) ) ( not ( = ?auto_2087986 ?auto_2087995 ) ) ( not ( = ?auto_2087987 ?auto_2087988 ) ) ( not ( = ?auto_2087987 ?auto_2087989 ) ) ( not ( = ?auto_2087987 ?auto_2087990 ) ) ( not ( = ?auto_2087987 ?auto_2087991 ) ) ( not ( = ?auto_2087987 ?auto_2087992 ) ) ( not ( = ?auto_2087987 ?auto_2087993 ) ) ( not ( = ?auto_2087987 ?auto_2087995 ) ) ( not ( = ?auto_2087988 ?auto_2087989 ) ) ( not ( = ?auto_2087988 ?auto_2087990 ) ) ( not ( = ?auto_2087988 ?auto_2087991 ) ) ( not ( = ?auto_2087988 ?auto_2087992 ) ) ( not ( = ?auto_2087988 ?auto_2087993 ) ) ( not ( = ?auto_2087988 ?auto_2087995 ) ) ( not ( = ?auto_2087989 ?auto_2087990 ) ) ( not ( = ?auto_2087989 ?auto_2087991 ) ) ( not ( = ?auto_2087989 ?auto_2087992 ) ) ( not ( = ?auto_2087989 ?auto_2087993 ) ) ( not ( = ?auto_2087989 ?auto_2087995 ) ) ( not ( = ?auto_2087990 ?auto_2087991 ) ) ( not ( = ?auto_2087990 ?auto_2087992 ) ) ( not ( = ?auto_2087990 ?auto_2087993 ) ) ( not ( = ?auto_2087990 ?auto_2087995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087991 ?auto_2087992 ?auto_2087993 )
      ( MAKE-14CRATE-VERIFY ?auto_2087979 ?auto_2087980 ?auto_2087981 ?auto_2087983 ?auto_2087982 ?auto_2087984 ?auto_2087985 ?auto_2087986 ?auto_2087987 ?auto_2087988 ?auto_2087989 ?auto_2087990 ?auto_2087991 ?auto_2087992 ?auto_2087993 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088183 - SURFACE
      ?auto_2088184 - SURFACE
      ?auto_2088185 - SURFACE
      ?auto_2088187 - SURFACE
      ?auto_2088186 - SURFACE
      ?auto_2088188 - SURFACE
      ?auto_2088189 - SURFACE
      ?auto_2088190 - SURFACE
      ?auto_2088191 - SURFACE
      ?auto_2088192 - SURFACE
      ?auto_2088193 - SURFACE
      ?auto_2088194 - SURFACE
      ?auto_2088195 - SURFACE
      ?auto_2088196 - SURFACE
      ?auto_2088197 - SURFACE
    )
    :vars
    (
      ?auto_2088201 - HOIST
      ?auto_2088202 - PLACE
      ?auto_2088199 - PLACE
      ?auto_2088198 - HOIST
      ?auto_2088203 - SURFACE
      ?auto_2088200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088201 ?auto_2088202 ) ( IS-CRATE ?auto_2088197 ) ( not ( = ?auto_2088196 ?auto_2088197 ) ) ( not ( = ?auto_2088195 ?auto_2088196 ) ) ( not ( = ?auto_2088195 ?auto_2088197 ) ) ( not ( = ?auto_2088199 ?auto_2088202 ) ) ( HOIST-AT ?auto_2088198 ?auto_2088199 ) ( not ( = ?auto_2088201 ?auto_2088198 ) ) ( AVAILABLE ?auto_2088198 ) ( SURFACE-AT ?auto_2088197 ?auto_2088199 ) ( ON ?auto_2088197 ?auto_2088203 ) ( CLEAR ?auto_2088197 ) ( not ( = ?auto_2088196 ?auto_2088203 ) ) ( not ( = ?auto_2088197 ?auto_2088203 ) ) ( not ( = ?auto_2088195 ?auto_2088203 ) ) ( TRUCK-AT ?auto_2088200 ?auto_2088202 ) ( SURFACE-AT ?auto_2088195 ?auto_2088202 ) ( CLEAR ?auto_2088195 ) ( LIFTING ?auto_2088201 ?auto_2088196 ) ( IS-CRATE ?auto_2088196 ) ( ON ?auto_2088184 ?auto_2088183 ) ( ON ?auto_2088185 ?auto_2088184 ) ( ON ?auto_2088187 ?auto_2088185 ) ( ON ?auto_2088186 ?auto_2088187 ) ( ON ?auto_2088188 ?auto_2088186 ) ( ON ?auto_2088189 ?auto_2088188 ) ( ON ?auto_2088190 ?auto_2088189 ) ( ON ?auto_2088191 ?auto_2088190 ) ( ON ?auto_2088192 ?auto_2088191 ) ( ON ?auto_2088193 ?auto_2088192 ) ( ON ?auto_2088194 ?auto_2088193 ) ( ON ?auto_2088195 ?auto_2088194 ) ( not ( = ?auto_2088183 ?auto_2088184 ) ) ( not ( = ?auto_2088183 ?auto_2088185 ) ) ( not ( = ?auto_2088183 ?auto_2088187 ) ) ( not ( = ?auto_2088183 ?auto_2088186 ) ) ( not ( = ?auto_2088183 ?auto_2088188 ) ) ( not ( = ?auto_2088183 ?auto_2088189 ) ) ( not ( = ?auto_2088183 ?auto_2088190 ) ) ( not ( = ?auto_2088183 ?auto_2088191 ) ) ( not ( = ?auto_2088183 ?auto_2088192 ) ) ( not ( = ?auto_2088183 ?auto_2088193 ) ) ( not ( = ?auto_2088183 ?auto_2088194 ) ) ( not ( = ?auto_2088183 ?auto_2088195 ) ) ( not ( = ?auto_2088183 ?auto_2088196 ) ) ( not ( = ?auto_2088183 ?auto_2088197 ) ) ( not ( = ?auto_2088183 ?auto_2088203 ) ) ( not ( = ?auto_2088184 ?auto_2088185 ) ) ( not ( = ?auto_2088184 ?auto_2088187 ) ) ( not ( = ?auto_2088184 ?auto_2088186 ) ) ( not ( = ?auto_2088184 ?auto_2088188 ) ) ( not ( = ?auto_2088184 ?auto_2088189 ) ) ( not ( = ?auto_2088184 ?auto_2088190 ) ) ( not ( = ?auto_2088184 ?auto_2088191 ) ) ( not ( = ?auto_2088184 ?auto_2088192 ) ) ( not ( = ?auto_2088184 ?auto_2088193 ) ) ( not ( = ?auto_2088184 ?auto_2088194 ) ) ( not ( = ?auto_2088184 ?auto_2088195 ) ) ( not ( = ?auto_2088184 ?auto_2088196 ) ) ( not ( = ?auto_2088184 ?auto_2088197 ) ) ( not ( = ?auto_2088184 ?auto_2088203 ) ) ( not ( = ?auto_2088185 ?auto_2088187 ) ) ( not ( = ?auto_2088185 ?auto_2088186 ) ) ( not ( = ?auto_2088185 ?auto_2088188 ) ) ( not ( = ?auto_2088185 ?auto_2088189 ) ) ( not ( = ?auto_2088185 ?auto_2088190 ) ) ( not ( = ?auto_2088185 ?auto_2088191 ) ) ( not ( = ?auto_2088185 ?auto_2088192 ) ) ( not ( = ?auto_2088185 ?auto_2088193 ) ) ( not ( = ?auto_2088185 ?auto_2088194 ) ) ( not ( = ?auto_2088185 ?auto_2088195 ) ) ( not ( = ?auto_2088185 ?auto_2088196 ) ) ( not ( = ?auto_2088185 ?auto_2088197 ) ) ( not ( = ?auto_2088185 ?auto_2088203 ) ) ( not ( = ?auto_2088187 ?auto_2088186 ) ) ( not ( = ?auto_2088187 ?auto_2088188 ) ) ( not ( = ?auto_2088187 ?auto_2088189 ) ) ( not ( = ?auto_2088187 ?auto_2088190 ) ) ( not ( = ?auto_2088187 ?auto_2088191 ) ) ( not ( = ?auto_2088187 ?auto_2088192 ) ) ( not ( = ?auto_2088187 ?auto_2088193 ) ) ( not ( = ?auto_2088187 ?auto_2088194 ) ) ( not ( = ?auto_2088187 ?auto_2088195 ) ) ( not ( = ?auto_2088187 ?auto_2088196 ) ) ( not ( = ?auto_2088187 ?auto_2088197 ) ) ( not ( = ?auto_2088187 ?auto_2088203 ) ) ( not ( = ?auto_2088186 ?auto_2088188 ) ) ( not ( = ?auto_2088186 ?auto_2088189 ) ) ( not ( = ?auto_2088186 ?auto_2088190 ) ) ( not ( = ?auto_2088186 ?auto_2088191 ) ) ( not ( = ?auto_2088186 ?auto_2088192 ) ) ( not ( = ?auto_2088186 ?auto_2088193 ) ) ( not ( = ?auto_2088186 ?auto_2088194 ) ) ( not ( = ?auto_2088186 ?auto_2088195 ) ) ( not ( = ?auto_2088186 ?auto_2088196 ) ) ( not ( = ?auto_2088186 ?auto_2088197 ) ) ( not ( = ?auto_2088186 ?auto_2088203 ) ) ( not ( = ?auto_2088188 ?auto_2088189 ) ) ( not ( = ?auto_2088188 ?auto_2088190 ) ) ( not ( = ?auto_2088188 ?auto_2088191 ) ) ( not ( = ?auto_2088188 ?auto_2088192 ) ) ( not ( = ?auto_2088188 ?auto_2088193 ) ) ( not ( = ?auto_2088188 ?auto_2088194 ) ) ( not ( = ?auto_2088188 ?auto_2088195 ) ) ( not ( = ?auto_2088188 ?auto_2088196 ) ) ( not ( = ?auto_2088188 ?auto_2088197 ) ) ( not ( = ?auto_2088188 ?auto_2088203 ) ) ( not ( = ?auto_2088189 ?auto_2088190 ) ) ( not ( = ?auto_2088189 ?auto_2088191 ) ) ( not ( = ?auto_2088189 ?auto_2088192 ) ) ( not ( = ?auto_2088189 ?auto_2088193 ) ) ( not ( = ?auto_2088189 ?auto_2088194 ) ) ( not ( = ?auto_2088189 ?auto_2088195 ) ) ( not ( = ?auto_2088189 ?auto_2088196 ) ) ( not ( = ?auto_2088189 ?auto_2088197 ) ) ( not ( = ?auto_2088189 ?auto_2088203 ) ) ( not ( = ?auto_2088190 ?auto_2088191 ) ) ( not ( = ?auto_2088190 ?auto_2088192 ) ) ( not ( = ?auto_2088190 ?auto_2088193 ) ) ( not ( = ?auto_2088190 ?auto_2088194 ) ) ( not ( = ?auto_2088190 ?auto_2088195 ) ) ( not ( = ?auto_2088190 ?auto_2088196 ) ) ( not ( = ?auto_2088190 ?auto_2088197 ) ) ( not ( = ?auto_2088190 ?auto_2088203 ) ) ( not ( = ?auto_2088191 ?auto_2088192 ) ) ( not ( = ?auto_2088191 ?auto_2088193 ) ) ( not ( = ?auto_2088191 ?auto_2088194 ) ) ( not ( = ?auto_2088191 ?auto_2088195 ) ) ( not ( = ?auto_2088191 ?auto_2088196 ) ) ( not ( = ?auto_2088191 ?auto_2088197 ) ) ( not ( = ?auto_2088191 ?auto_2088203 ) ) ( not ( = ?auto_2088192 ?auto_2088193 ) ) ( not ( = ?auto_2088192 ?auto_2088194 ) ) ( not ( = ?auto_2088192 ?auto_2088195 ) ) ( not ( = ?auto_2088192 ?auto_2088196 ) ) ( not ( = ?auto_2088192 ?auto_2088197 ) ) ( not ( = ?auto_2088192 ?auto_2088203 ) ) ( not ( = ?auto_2088193 ?auto_2088194 ) ) ( not ( = ?auto_2088193 ?auto_2088195 ) ) ( not ( = ?auto_2088193 ?auto_2088196 ) ) ( not ( = ?auto_2088193 ?auto_2088197 ) ) ( not ( = ?auto_2088193 ?auto_2088203 ) ) ( not ( = ?auto_2088194 ?auto_2088195 ) ) ( not ( = ?auto_2088194 ?auto_2088196 ) ) ( not ( = ?auto_2088194 ?auto_2088197 ) ) ( not ( = ?auto_2088194 ?auto_2088203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088195 ?auto_2088196 ?auto_2088197 )
      ( MAKE-14CRATE-VERIFY ?auto_2088183 ?auto_2088184 ?auto_2088185 ?auto_2088187 ?auto_2088186 ?auto_2088188 ?auto_2088189 ?auto_2088190 ?auto_2088191 ?auto_2088192 ?auto_2088193 ?auto_2088194 ?auto_2088195 ?auto_2088196 ?auto_2088197 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088387 - SURFACE
      ?auto_2088388 - SURFACE
      ?auto_2088389 - SURFACE
      ?auto_2088391 - SURFACE
      ?auto_2088390 - SURFACE
      ?auto_2088392 - SURFACE
      ?auto_2088393 - SURFACE
      ?auto_2088394 - SURFACE
      ?auto_2088395 - SURFACE
      ?auto_2088396 - SURFACE
      ?auto_2088397 - SURFACE
      ?auto_2088398 - SURFACE
      ?auto_2088399 - SURFACE
      ?auto_2088400 - SURFACE
      ?auto_2088401 - SURFACE
    )
    :vars
    (
      ?auto_2088407 - HOIST
      ?auto_2088403 - PLACE
      ?auto_2088402 - PLACE
      ?auto_2088404 - HOIST
      ?auto_2088405 - SURFACE
      ?auto_2088406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088407 ?auto_2088403 ) ( IS-CRATE ?auto_2088401 ) ( not ( = ?auto_2088400 ?auto_2088401 ) ) ( not ( = ?auto_2088399 ?auto_2088400 ) ) ( not ( = ?auto_2088399 ?auto_2088401 ) ) ( not ( = ?auto_2088402 ?auto_2088403 ) ) ( HOIST-AT ?auto_2088404 ?auto_2088402 ) ( not ( = ?auto_2088407 ?auto_2088404 ) ) ( AVAILABLE ?auto_2088404 ) ( SURFACE-AT ?auto_2088401 ?auto_2088402 ) ( ON ?auto_2088401 ?auto_2088405 ) ( CLEAR ?auto_2088401 ) ( not ( = ?auto_2088400 ?auto_2088405 ) ) ( not ( = ?auto_2088401 ?auto_2088405 ) ) ( not ( = ?auto_2088399 ?auto_2088405 ) ) ( TRUCK-AT ?auto_2088406 ?auto_2088403 ) ( SURFACE-AT ?auto_2088399 ?auto_2088403 ) ( CLEAR ?auto_2088399 ) ( IS-CRATE ?auto_2088400 ) ( AVAILABLE ?auto_2088407 ) ( IN ?auto_2088400 ?auto_2088406 ) ( ON ?auto_2088388 ?auto_2088387 ) ( ON ?auto_2088389 ?auto_2088388 ) ( ON ?auto_2088391 ?auto_2088389 ) ( ON ?auto_2088390 ?auto_2088391 ) ( ON ?auto_2088392 ?auto_2088390 ) ( ON ?auto_2088393 ?auto_2088392 ) ( ON ?auto_2088394 ?auto_2088393 ) ( ON ?auto_2088395 ?auto_2088394 ) ( ON ?auto_2088396 ?auto_2088395 ) ( ON ?auto_2088397 ?auto_2088396 ) ( ON ?auto_2088398 ?auto_2088397 ) ( ON ?auto_2088399 ?auto_2088398 ) ( not ( = ?auto_2088387 ?auto_2088388 ) ) ( not ( = ?auto_2088387 ?auto_2088389 ) ) ( not ( = ?auto_2088387 ?auto_2088391 ) ) ( not ( = ?auto_2088387 ?auto_2088390 ) ) ( not ( = ?auto_2088387 ?auto_2088392 ) ) ( not ( = ?auto_2088387 ?auto_2088393 ) ) ( not ( = ?auto_2088387 ?auto_2088394 ) ) ( not ( = ?auto_2088387 ?auto_2088395 ) ) ( not ( = ?auto_2088387 ?auto_2088396 ) ) ( not ( = ?auto_2088387 ?auto_2088397 ) ) ( not ( = ?auto_2088387 ?auto_2088398 ) ) ( not ( = ?auto_2088387 ?auto_2088399 ) ) ( not ( = ?auto_2088387 ?auto_2088400 ) ) ( not ( = ?auto_2088387 ?auto_2088401 ) ) ( not ( = ?auto_2088387 ?auto_2088405 ) ) ( not ( = ?auto_2088388 ?auto_2088389 ) ) ( not ( = ?auto_2088388 ?auto_2088391 ) ) ( not ( = ?auto_2088388 ?auto_2088390 ) ) ( not ( = ?auto_2088388 ?auto_2088392 ) ) ( not ( = ?auto_2088388 ?auto_2088393 ) ) ( not ( = ?auto_2088388 ?auto_2088394 ) ) ( not ( = ?auto_2088388 ?auto_2088395 ) ) ( not ( = ?auto_2088388 ?auto_2088396 ) ) ( not ( = ?auto_2088388 ?auto_2088397 ) ) ( not ( = ?auto_2088388 ?auto_2088398 ) ) ( not ( = ?auto_2088388 ?auto_2088399 ) ) ( not ( = ?auto_2088388 ?auto_2088400 ) ) ( not ( = ?auto_2088388 ?auto_2088401 ) ) ( not ( = ?auto_2088388 ?auto_2088405 ) ) ( not ( = ?auto_2088389 ?auto_2088391 ) ) ( not ( = ?auto_2088389 ?auto_2088390 ) ) ( not ( = ?auto_2088389 ?auto_2088392 ) ) ( not ( = ?auto_2088389 ?auto_2088393 ) ) ( not ( = ?auto_2088389 ?auto_2088394 ) ) ( not ( = ?auto_2088389 ?auto_2088395 ) ) ( not ( = ?auto_2088389 ?auto_2088396 ) ) ( not ( = ?auto_2088389 ?auto_2088397 ) ) ( not ( = ?auto_2088389 ?auto_2088398 ) ) ( not ( = ?auto_2088389 ?auto_2088399 ) ) ( not ( = ?auto_2088389 ?auto_2088400 ) ) ( not ( = ?auto_2088389 ?auto_2088401 ) ) ( not ( = ?auto_2088389 ?auto_2088405 ) ) ( not ( = ?auto_2088391 ?auto_2088390 ) ) ( not ( = ?auto_2088391 ?auto_2088392 ) ) ( not ( = ?auto_2088391 ?auto_2088393 ) ) ( not ( = ?auto_2088391 ?auto_2088394 ) ) ( not ( = ?auto_2088391 ?auto_2088395 ) ) ( not ( = ?auto_2088391 ?auto_2088396 ) ) ( not ( = ?auto_2088391 ?auto_2088397 ) ) ( not ( = ?auto_2088391 ?auto_2088398 ) ) ( not ( = ?auto_2088391 ?auto_2088399 ) ) ( not ( = ?auto_2088391 ?auto_2088400 ) ) ( not ( = ?auto_2088391 ?auto_2088401 ) ) ( not ( = ?auto_2088391 ?auto_2088405 ) ) ( not ( = ?auto_2088390 ?auto_2088392 ) ) ( not ( = ?auto_2088390 ?auto_2088393 ) ) ( not ( = ?auto_2088390 ?auto_2088394 ) ) ( not ( = ?auto_2088390 ?auto_2088395 ) ) ( not ( = ?auto_2088390 ?auto_2088396 ) ) ( not ( = ?auto_2088390 ?auto_2088397 ) ) ( not ( = ?auto_2088390 ?auto_2088398 ) ) ( not ( = ?auto_2088390 ?auto_2088399 ) ) ( not ( = ?auto_2088390 ?auto_2088400 ) ) ( not ( = ?auto_2088390 ?auto_2088401 ) ) ( not ( = ?auto_2088390 ?auto_2088405 ) ) ( not ( = ?auto_2088392 ?auto_2088393 ) ) ( not ( = ?auto_2088392 ?auto_2088394 ) ) ( not ( = ?auto_2088392 ?auto_2088395 ) ) ( not ( = ?auto_2088392 ?auto_2088396 ) ) ( not ( = ?auto_2088392 ?auto_2088397 ) ) ( not ( = ?auto_2088392 ?auto_2088398 ) ) ( not ( = ?auto_2088392 ?auto_2088399 ) ) ( not ( = ?auto_2088392 ?auto_2088400 ) ) ( not ( = ?auto_2088392 ?auto_2088401 ) ) ( not ( = ?auto_2088392 ?auto_2088405 ) ) ( not ( = ?auto_2088393 ?auto_2088394 ) ) ( not ( = ?auto_2088393 ?auto_2088395 ) ) ( not ( = ?auto_2088393 ?auto_2088396 ) ) ( not ( = ?auto_2088393 ?auto_2088397 ) ) ( not ( = ?auto_2088393 ?auto_2088398 ) ) ( not ( = ?auto_2088393 ?auto_2088399 ) ) ( not ( = ?auto_2088393 ?auto_2088400 ) ) ( not ( = ?auto_2088393 ?auto_2088401 ) ) ( not ( = ?auto_2088393 ?auto_2088405 ) ) ( not ( = ?auto_2088394 ?auto_2088395 ) ) ( not ( = ?auto_2088394 ?auto_2088396 ) ) ( not ( = ?auto_2088394 ?auto_2088397 ) ) ( not ( = ?auto_2088394 ?auto_2088398 ) ) ( not ( = ?auto_2088394 ?auto_2088399 ) ) ( not ( = ?auto_2088394 ?auto_2088400 ) ) ( not ( = ?auto_2088394 ?auto_2088401 ) ) ( not ( = ?auto_2088394 ?auto_2088405 ) ) ( not ( = ?auto_2088395 ?auto_2088396 ) ) ( not ( = ?auto_2088395 ?auto_2088397 ) ) ( not ( = ?auto_2088395 ?auto_2088398 ) ) ( not ( = ?auto_2088395 ?auto_2088399 ) ) ( not ( = ?auto_2088395 ?auto_2088400 ) ) ( not ( = ?auto_2088395 ?auto_2088401 ) ) ( not ( = ?auto_2088395 ?auto_2088405 ) ) ( not ( = ?auto_2088396 ?auto_2088397 ) ) ( not ( = ?auto_2088396 ?auto_2088398 ) ) ( not ( = ?auto_2088396 ?auto_2088399 ) ) ( not ( = ?auto_2088396 ?auto_2088400 ) ) ( not ( = ?auto_2088396 ?auto_2088401 ) ) ( not ( = ?auto_2088396 ?auto_2088405 ) ) ( not ( = ?auto_2088397 ?auto_2088398 ) ) ( not ( = ?auto_2088397 ?auto_2088399 ) ) ( not ( = ?auto_2088397 ?auto_2088400 ) ) ( not ( = ?auto_2088397 ?auto_2088401 ) ) ( not ( = ?auto_2088397 ?auto_2088405 ) ) ( not ( = ?auto_2088398 ?auto_2088399 ) ) ( not ( = ?auto_2088398 ?auto_2088400 ) ) ( not ( = ?auto_2088398 ?auto_2088401 ) ) ( not ( = ?auto_2088398 ?auto_2088405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088399 ?auto_2088400 ?auto_2088401 )
      ( MAKE-14CRATE-VERIFY ?auto_2088387 ?auto_2088388 ?auto_2088389 ?auto_2088391 ?auto_2088390 ?auto_2088392 ?auto_2088393 ?auto_2088394 ?auto_2088395 ?auto_2088396 ?auto_2088397 ?auto_2088398 ?auto_2088399 ?auto_2088400 ?auto_2088401 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088591 - SURFACE
      ?auto_2088592 - SURFACE
      ?auto_2088593 - SURFACE
      ?auto_2088595 - SURFACE
      ?auto_2088594 - SURFACE
      ?auto_2088596 - SURFACE
      ?auto_2088597 - SURFACE
      ?auto_2088598 - SURFACE
      ?auto_2088599 - SURFACE
      ?auto_2088600 - SURFACE
      ?auto_2088601 - SURFACE
      ?auto_2088602 - SURFACE
      ?auto_2088603 - SURFACE
      ?auto_2088604 - SURFACE
      ?auto_2088605 - SURFACE
    )
    :vars
    (
      ?auto_2088608 - HOIST
      ?auto_2088607 - PLACE
      ?auto_2088610 - PLACE
      ?auto_2088609 - HOIST
      ?auto_2088606 - SURFACE
      ?auto_2088611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088608 ?auto_2088607 ) ( IS-CRATE ?auto_2088605 ) ( not ( = ?auto_2088604 ?auto_2088605 ) ) ( not ( = ?auto_2088603 ?auto_2088604 ) ) ( not ( = ?auto_2088603 ?auto_2088605 ) ) ( not ( = ?auto_2088610 ?auto_2088607 ) ) ( HOIST-AT ?auto_2088609 ?auto_2088610 ) ( not ( = ?auto_2088608 ?auto_2088609 ) ) ( AVAILABLE ?auto_2088609 ) ( SURFACE-AT ?auto_2088605 ?auto_2088610 ) ( ON ?auto_2088605 ?auto_2088606 ) ( CLEAR ?auto_2088605 ) ( not ( = ?auto_2088604 ?auto_2088606 ) ) ( not ( = ?auto_2088605 ?auto_2088606 ) ) ( not ( = ?auto_2088603 ?auto_2088606 ) ) ( SURFACE-AT ?auto_2088603 ?auto_2088607 ) ( CLEAR ?auto_2088603 ) ( IS-CRATE ?auto_2088604 ) ( AVAILABLE ?auto_2088608 ) ( IN ?auto_2088604 ?auto_2088611 ) ( TRUCK-AT ?auto_2088611 ?auto_2088610 ) ( ON ?auto_2088592 ?auto_2088591 ) ( ON ?auto_2088593 ?auto_2088592 ) ( ON ?auto_2088595 ?auto_2088593 ) ( ON ?auto_2088594 ?auto_2088595 ) ( ON ?auto_2088596 ?auto_2088594 ) ( ON ?auto_2088597 ?auto_2088596 ) ( ON ?auto_2088598 ?auto_2088597 ) ( ON ?auto_2088599 ?auto_2088598 ) ( ON ?auto_2088600 ?auto_2088599 ) ( ON ?auto_2088601 ?auto_2088600 ) ( ON ?auto_2088602 ?auto_2088601 ) ( ON ?auto_2088603 ?auto_2088602 ) ( not ( = ?auto_2088591 ?auto_2088592 ) ) ( not ( = ?auto_2088591 ?auto_2088593 ) ) ( not ( = ?auto_2088591 ?auto_2088595 ) ) ( not ( = ?auto_2088591 ?auto_2088594 ) ) ( not ( = ?auto_2088591 ?auto_2088596 ) ) ( not ( = ?auto_2088591 ?auto_2088597 ) ) ( not ( = ?auto_2088591 ?auto_2088598 ) ) ( not ( = ?auto_2088591 ?auto_2088599 ) ) ( not ( = ?auto_2088591 ?auto_2088600 ) ) ( not ( = ?auto_2088591 ?auto_2088601 ) ) ( not ( = ?auto_2088591 ?auto_2088602 ) ) ( not ( = ?auto_2088591 ?auto_2088603 ) ) ( not ( = ?auto_2088591 ?auto_2088604 ) ) ( not ( = ?auto_2088591 ?auto_2088605 ) ) ( not ( = ?auto_2088591 ?auto_2088606 ) ) ( not ( = ?auto_2088592 ?auto_2088593 ) ) ( not ( = ?auto_2088592 ?auto_2088595 ) ) ( not ( = ?auto_2088592 ?auto_2088594 ) ) ( not ( = ?auto_2088592 ?auto_2088596 ) ) ( not ( = ?auto_2088592 ?auto_2088597 ) ) ( not ( = ?auto_2088592 ?auto_2088598 ) ) ( not ( = ?auto_2088592 ?auto_2088599 ) ) ( not ( = ?auto_2088592 ?auto_2088600 ) ) ( not ( = ?auto_2088592 ?auto_2088601 ) ) ( not ( = ?auto_2088592 ?auto_2088602 ) ) ( not ( = ?auto_2088592 ?auto_2088603 ) ) ( not ( = ?auto_2088592 ?auto_2088604 ) ) ( not ( = ?auto_2088592 ?auto_2088605 ) ) ( not ( = ?auto_2088592 ?auto_2088606 ) ) ( not ( = ?auto_2088593 ?auto_2088595 ) ) ( not ( = ?auto_2088593 ?auto_2088594 ) ) ( not ( = ?auto_2088593 ?auto_2088596 ) ) ( not ( = ?auto_2088593 ?auto_2088597 ) ) ( not ( = ?auto_2088593 ?auto_2088598 ) ) ( not ( = ?auto_2088593 ?auto_2088599 ) ) ( not ( = ?auto_2088593 ?auto_2088600 ) ) ( not ( = ?auto_2088593 ?auto_2088601 ) ) ( not ( = ?auto_2088593 ?auto_2088602 ) ) ( not ( = ?auto_2088593 ?auto_2088603 ) ) ( not ( = ?auto_2088593 ?auto_2088604 ) ) ( not ( = ?auto_2088593 ?auto_2088605 ) ) ( not ( = ?auto_2088593 ?auto_2088606 ) ) ( not ( = ?auto_2088595 ?auto_2088594 ) ) ( not ( = ?auto_2088595 ?auto_2088596 ) ) ( not ( = ?auto_2088595 ?auto_2088597 ) ) ( not ( = ?auto_2088595 ?auto_2088598 ) ) ( not ( = ?auto_2088595 ?auto_2088599 ) ) ( not ( = ?auto_2088595 ?auto_2088600 ) ) ( not ( = ?auto_2088595 ?auto_2088601 ) ) ( not ( = ?auto_2088595 ?auto_2088602 ) ) ( not ( = ?auto_2088595 ?auto_2088603 ) ) ( not ( = ?auto_2088595 ?auto_2088604 ) ) ( not ( = ?auto_2088595 ?auto_2088605 ) ) ( not ( = ?auto_2088595 ?auto_2088606 ) ) ( not ( = ?auto_2088594 ?auto_2088596 ) ) ( not ( = ?auto_2088594 ?auto_2088597 ) ) ( not ( = ?auto_2088594 ?auto_2088598 ) ) ( not ( = ?auto_2088594 ?auto_2088599 ) ) ( not ( = ?auto_2088594 ?auto_2088600 ) ) ( not ( = ?auto_2088594 ?auto_2088601 ) ) ( not ( = ?auto_2088594 ?auto_2088602 ) ) ( not ( = ?auto_2088594 ?auto_2088603 ) ) ( not ( = ?auto_2088594 ?auto_2088604 ) ) ( not ( = ?auto_2088594 ?auto_2088605 ) ) ( not ( = ?auto_2088594 ?auto_2088606 ) ) ( not ( = ?auto_2088596 ?auto_2088597 ) ) ( not ( = ?auto_2088596 ?auto_2088598 ) ) ( not ( = ?auto_2088596 ?auto_2088599 ) ) ( not ( = ?auto_2088596 ?auto_2088600 ) ) ( not ( = ?auto_2088596 ?auto_2088601 ) ) ( not ( = ?auto_2088596 ?auto_2088602 ) ) ( not ( = ?auto_2088596 ?auto_2088603 ) ) ( not ( = ?auto_2088596 ?auto_2088604 ) ) ( not ( = ?auto_2088596 ?auto_2088605 ) ) ( not ( = ?auto_2088596 ?auto_2088606 ) ) ( not ( = ?auto_2088597 ?auto_2088598 ) ) ( not ( = ?auto_2088597 ?auto_2088599 ) ) ( not ( = ?auto_2088597 ?auto_2088600 ) ) ( not ( = ?auto_2088597 ?auto_2088601 ) ) ( not ( = ?auto_2088597 ?auto_2088602 ) ) ( not ( = ?auto_2088597 ?auto_2088603 ) ) ( not ( = ?auto_2088597 ?auto_2088604 ) ) ( not ( = ?auto_2088597 ?auto_2088605 ) ) ( not ( = ?auto_2088597 ?auto_2088606 ) ) ( not ( = ?auto_2088598 ?auto_2088599 ) ) ( not ( = ?auto_2088598 ?auto_2088600 ) ) ( not ( = ?auto_2088598 ?auto_2088601 ) ) ( not ( = ?auto_2088598 ?auto_2088602 ) ) ( not ( = ?auto_2088598 ?auto_2088603 ) ) ( not ( = ?auto_2088598 ?auto_2088604 ) ) ( not ( = ?auto_2088598 ?auto_2088605 ) ) ( not ( = ?auto_2088598 ?auto_2088606 ) ) ( not ( = ?auto_2088599 ?auto_2088600 ) ) ( not ( = ?auto_2088599 ?auto_2088601 ) ) ( not ( = ?auto_2088599 ?auto_2088602 ) ) ( not ( = ?auto_2088599 ?auto_2088603 ) ) ( not ( = ?auto_2088599 ?auto_2088604 ) ) ( not ( = ?auto_2088599 ?auto_2088605 ) ) ( not ( = ?auto_2088599 ?auto_2088606 ) ) ( not ( = ?auto_2088600 ?auto_2088601 ) ) ( not ( = ?auto_2088600 ?auto_2088602 ) ) ( not ( = ?auto_2088600 ?auto_2088603 ) ) ( not ( = ?auto_2088600 ?auto_2088604 ) ) ( not ( = ?auto_2088600 ?auto_2088605 ) ) ( not ( = ?auto_2088600 ?auto_2088606 ) ) ( not ( = ?auto_2088601 ?auto_2088602 ) ) ( not ( = ?auto_2088601 ?auto_2088603 ) ) ( not ( = ?auto_2088601 ?auto_2088604 ) ) ( not ( = ?auto_2088601 ?auto_2088605 ) ) ( not ( = ?auto_2088601 ?auto_2088606 ) ) ( not ( = ?auto_2088602 ?auto_2088603 ) ) ( not ( = ?auto_2088602 ?auto_2088604 ) ) ( not ( = ?auto_2088602 ?auto_2088605 ) ) ( not ( = ?auto_2088602 ?auto_2088606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088603 ?auto_2088604 ?auto_2088605 )
      ( MAKE-14CRATE-VERIFY ?auto_2088591 ?auto_2088592 ?auto_2088593 ?auto_2088595 ?auto_2088594 ?auto_2088596 ?auto_2088597 ?auto_2088598 ?auto_2088599 ?auto_2088600 ?auto_2088601 ?auto_2088602 ?auto_2088603 ?auto_2088604 ?auto_2088605 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088795 - SURFACE
      ?auto_2088796 - SURFACE
      ?auto_2088797 - SURFACE
      ?auto_2088799 - SURFACE
      ?auto_2088798 - SURFACE
      ?auto_2088800 - SURFACE
      ?auto_2088801 - SURFACE
      ?auto_2088802 - SURFACE
      ?auto_2088803 - SURFACE
      ?auto_2088804 - SURFACE
      ?auto_2088805 - SURFACE
      ?auto_2088806 - SURFACE
      ?auto_2088807 - SURFACE
      ?auto_2088808 - SURFACE
      ?auto_2088809 - SURFACE
    )
    :vars
    (
      ?auto_2088815 - HOIST
      ?auto_2088811 - PLACE
      ?auto_2088812 - PLACE
      ?auto_2088814 - HOIST
      ?auto_2088813 - SURFACE
      ?auto_2088810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088815 ?auto_2088811 ) ( IS-CRATE ?auto_2088809 ) ( not ( = ?auto_2088808 ?auto_2088809 ) ) ( not ( = ?auto_2088807 ?auto_2088808 ) ) ( not ( = ?auto_2088807 ?auto_2088809 ) ) ( not ( = ?auto_2088812 ?auto_2088811 ) ) ( HOIST-AT ?auto_2088814 ?auto_2088812 ) ( not ( = ?auto_2088815 ?auto_2088814 ) ) ( SURFACE-AT ?auto_2088809 ?auto_2088812 ) ( ON ?auto_2088809 ?auto_2088813 ) ( CLEAR ?auto_2088809 ) ( not ( = ?auto_2088808 ?auto_2088813 ) ) ( not ( = ?auto_2088809 ?auto_2088813 ) ) ( not ( = ?auto_2088807 ?auto_2088813 ) ) ( SURFACE-AT ?auto_2088807 ?auto_2088811 ) ( CLEAR ?auto_2088807 ) ( IS-CRATE ?auto_2088808 ) ( AVAILABLE ?auto_2088815 ) ( TRUCK-AT ?auto_2088810 ?auto_2088812 ) ( LIFTING ?auto_2088814 ?auto_2088808 ) ( ON ?auto_2088796 ?auto_2088795 ) ( ON ?auto_2088797 ?auto_2088796 ) ( ON ?auto_2088799 ?auto_2088797 ) ( ON ?auto_2088798 ?auto_2088799 ) ( ON ?auto_2088800 ?auto_2088798 ) ( ON ?auto_2088801 ?auto_2088800 ) ( ON ?auto_2088802 ?auto_2088801 ) ( ON ?auto_2088803 ?auto_2088802 ) ( ON ?auto_2088804 ?auto_2088803 ) ( ON ?auto_2088805 ?auto_2088804 ) ( ON ?auto_2088806 ?auto_2088805 ) ( ON ?auto_2088807 ?auto_2088806 ) ( not ( = ?auto_2088795 ?auto_2088796 ) ) ( not ( = ?auto_2088795 ?auto_2088797 ) ) ( not ( = ?auto_2088795 ?auto_2088799 ) ) ( not ( = ?auto_2088795 ?auto_2088798 ) ) ( not ( = ?auto_2088795 ?auto_2088800 ) ) ( not ( = ?auto_2088795 ?auto_2088801 ) ) ( not ( = ?auto_2088795 ?auto_2088802 ) ) ( not ( = ?auto_2088795 ?auto_2088803 ) ) ( not ( = ?auto_2088795 ?auto_2088804 ) ) ( not ( = ?auto_2088795 ?auto_2088805 ) ) ( not ( = ?auto_2088795 ?auto_2088806 ) ) ( not ( = ?auto_2088795 ?auto_2088807 ) ) ( not ( = ?auto_2088795 ?auto_2088808 ) ) ( not ( = ?auto_2088795 ?auto_2088809 ) ) ( not ( = ?auto_2088795 ?auto_2088813 ) ) ( not ( = ?auto_2088796 ?auto_2088797 ) ) ( not ( = ?auto_2088796 ?auto_2088799 ) ) ( not ( = ?auto_2088796 ?auto_2088798 ) ) ( not ( = ?auto_2088796 ?auto_2088800 ) ) ( not ( = ?auto_2088796 ?auto_2088801 ) ) ( not ( = ?auto_2088796 ?auto_2088802 ) ) ( not ( = ?auto_2088796 ?auto_2088803 ) ) ( not ( = ?auto_2088796 ?auto_2088804 ) ) ( not ( = ?auto_2088796 ?auto_2088805 ) ) ( not ( = ?auto_2088796 ?auto_2088806 ) ) ( not ( = ?auto_2088796 ?auto_2088807 ) ) ( not ( = ?auto_2088796 ?auto_2088808 ) ) ( not ( = ?auto_2088796 ?auto_2088809 ) ) ( not ( = ?auto_2088796 ?auto_2088813 ) ) ( not ( = ?auto_2088797 ?auto_2088799 ) ) ( not ( = ?auto_2088797 ?auto_2088798 ) ) ( not ( = ?auto_2088797 ?auto_2088800 ) ) ( not ( = ?auto_2088797 ?auto_2088801 ) ) ( not ( = ?auto_2088797 ?auto_2088802 ) ) ( not ( = ?auto_2088797 ?auto_2088803 ) ) ( not ( = ?auto_2088797 ?auto_2088804 ) ) ( not ( = ?auto_2088797 ?auto_2088805 ) ) ( not ( = ?auto_2088797 ?auto_2088806 ) ) ( not ( = ?auto_2088797 ?auto_2088807 ) ) ( not ( = ?auto_2088797 ?auto_2088808 ) ) ( not ( = ?auto_2088797 ?auto_2088809 ) ) ( not ( = ?auto_2088797 ?auto_2088813 ) ) ( not ( = ?auto_2088799 ?auto_2088798 ) ) ( not ( = ?auto_2088799 ?auto_2088800 ) ) ( not ( = ?auto_2088799 ?auto_2088801 ) ) ( not ( = ?auto_2088799 ?auto_2088802 ) ) ( not ( = ?auto_2088799 ?auto_2088803 ) ) ( not ( = ?auto_2088799 ?auto_2088804 ) ) ( not ( = ?auto_2088799 ?auto_2088805 ) ) ( not ( = ?auto_2088799 ?auto_2088806 ) ) ( not ( = ?auto_2088799 ?auto_2088807 ) ) ( not ( = ?auto_2088799 ?auto_2088808 ) ) ( not ( = ?auto_2088799 ?auto_2088809 ) ) ( not ( = ?auto_2088799 ?auto_2088813 ) ) ( not ( = ?auto_2088798 ?auto_2088800 ) ) ( not ( = ?auto_2088798 ?auto_2088801 ) ) ( not ( = ?auto_2088798 ?auto_2088802 ) ) ( not ( = ?auto_2088798 ?auto_2088803 ) ) ( not ( = ?auto_2088798 ?auto_2088804 ) ) ( not ( = ?auto_2088798 ?auto_2088805 ) ) ( not ( = ?auto_2088798 ?auto_2088806 ) ) ( not ( = ?auto_2088798 ?auto_2088807 ) ) ( not ( = ?auto_2088798 ?auto_2088808 ) ) ( not ( = ?auto_2088798 ?auto_2088809 ) ) ( not ( = ?auto_2088798 ?auto_2088813 ) ) ( not ( = ?auto_2088800 ?auto_2088801 ) ) ( not ( = ?auto_2088800 ?auto_2088802 ) ) ( not ( = ?auto_2088800 ?auto_2088803 ) ) ( not ( = ?auto_2088800 ?auto_2088804 ) ) ( not ( = ?auto_2088800 ?auto_2088805 ) ) ( not ( = ?auto_2088800 ?auto_2088806 ) ) ( not ( = ?auto_2088800 ?auto_2088807 ) ) ( not ( = ?auto_2088800 ?auto_2088808 ) ) ( not ( = ?auto_2088800 ?auto_2088809 ) ) ( not ( = ?auto_2088800 ?auto_2088813 ) ) ( not ( = ?auto_2088801 ?auto_2088802 ) ) ( not ( = ?auto_2088801 ?auto_2088803 ) ) ( not ( = ?auto_2088801 ?auto_2088804 ) ) ( not ( = ?auto_2088801 ?auto_2088805 ) ) ( not ( = ?auto_2088801 ?auto_2088806 ) ) ( not ( = ?auto_2088801 ?auto_2088807 ) ) ( not ( = ?auto_2088801 ?auto_2088808 ) ) ( not ( = ?auto_2088801 ?auto_2088809 ) ) ( not ( = ?auto_2088801 ?auto_2088813 ) ) ( not ( = ?auto_2088802 ?auto_2088803 ) ) ( not ( = ?auto_2088802 ?auto_2088804 ) ) ( not ( = ?auto_2088802 ?auto_2088805 ) ) ( not ( = ?auto_2088802 ?auto_2088806 ) ) ( not ( = ?auto_2088802 ?auto_2088807 ) ) ( not ( = ?auto_2088802 ?auto_2088808 ) ) ( not ( = ?auto_2088802 ?auto_2088809 ) ) ( not ( = ?auto_2088802 ?auto_2088813 ) ) ( not ( = ?auto_2088803 ?auto_2088804 ) ) ( not ( = ?auto_2088803 ?auto_2088805 ) ) ( not ( = ?auto_2088803 ?auto_2088806 ) ) ( not ( = ?auto_2088803 ?auto_2088807 ) ) ( not ( = ?auto_2088803 ?auto_2088808 ) ) ( not ( = ?auto_2088803 ?auto_2088809 ) ) ( not ( = ?auto_2088803 ?auto_2088813 ) ) ( not ( = ?auto_2088804 ?auto_2088805 ) ) ( not ( = ?auto_2088804 ?auto_2088806 ) ) ( not ( = ?auto_2088804 ?auto_2088807 ) ) ( not ( = ?auto_2088804 ?auto_2088808 ) ) ( not ( = ?auto_2088804 ?auto_2088809 ) ) ( not ( = ?auto_2088804 ?auto_2088813 ) ) ( not ( = ?auto_2088805 ?auto_2088806 ) ) ( not ( = ?auto_2088805 ?auto_2088807 ) ) ( not ( = ?auto_2088805 ?auto_2088808 ) ) ( not ( = ?auto_2088805 ?auto_2088809 ) ) ( not ( = ?auto_2088805 ?auto_2088813 ) ) ( not ( = ?auto_2088806 ?auto_2088807 ) ) ( not ( = ?auto_2088806 ?auto_2088808 ) ) ( not ( = ?auto_2088806 ?auto_2088809 ) ) ( not ( = ?auto_2088806 ?auto_2088813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088807 ?auto_2088808 ?auto_2088809 )
      ( MAKE-14CRATE-VERIFY ?auto_2088795 ?auto_2088796 ?auto_2088797 ?auto_2088799 ?auto_2088798 ?auto_2088800 ?auto_2088801 ?auto_2088802 ?auto_2088803 ?auto_2088804 ?auto_2088805 ?auto_2088806 ?auto_2088807 ?auto_2088808 ?auto_2088809 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089012 - SURFACE
      ?auto_2089013 - SURFACE
      ?auto_2089014 - SURFACE
      ?auto_2089016 - SURFACE
      ?auto_2089015 - SURFACE
      ?auto_2089017 - SURFACE
      ?auto_2089018 - SURFACE
      ?auto_2089019 - SURFACE
      ?auto_2089020 - SURFACE
      ?auto_2089021 - SURFACE
      ?auto_2089022 - SURFACE
      ?auto_2089023 - SURFACE
      ?auto_2089024 - SURFACE
      ?auto_2089025 - SURFACE
      ?auto_2089026 - SURFACE
    )
    :vars
    (
      ?auto_2089033 - HOIST
      ?auto_2089028 - PLACE
      ?auto_2089031 - PLACE
      ?auto_2089029 - HOIST
      ?auto_2089030 - SURFACE
      ?auto_2089032 - TRUCK
      ?auto_2089027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089033 ?auto_2089028 ) ( IS-CRATE ?auto_2089026 ) ( not ( = ?auto_2089025 ?auto_2089026 ) ) ( not ( = ?auto_2089024 ?auto_2089025 ) ) ( not ( = ?auto_2089024 ?auto_2089026 ) ) ( not ( = ?auto_2089031 ?auto_2089028 ) ) ( HOIST-AT ?auto_2089029 ?auto_2089031 ) ( not ( = ?auto_2089033 ?auto_2089029 ) ) ( SURFACE-AT ?auto_2089026 ?auto_2089031 ) ( ON ?auto_2089026 ?auto_2089030 ) ( CLEAR ?auto_2089026 ) ( not ( = ?auto_2089025 ?auto_2089030 ) ) ( not ( = ?auto_2089026 ?auto_2089030 ) ) ( not ( = ?auto_2089024 ?auto_2089030 ) ) ( SURFACE-AT ?auto_2089024 ?auto_2089028 ) ( CLEAR ?auto_2089024 ) ( IS-CRATE ?auto_2089025 ) ( AVAILABLE ?auto_2089033 ) ( TRUCK-AT ?auto_2089032 ?auto_2089031 ) ( AVAILABLE ?auto_2089029 ) ( SURFACE-AT ?auto_2089025 ?auto_2089031 ) ( ON ?auto_2089025 ?auto_2089027 ) ( CLEAR ?auto_2089025 ) ( not ( = ?auto_2089025 ?auto_2089027 ) ) ( not ( = ?auto_2089026 ?auto_2089027 ) ) ( not ( = ?auto_2089024 ?auto_2089027 ) ) ( not ( = ?auto_2089030 ?auto_2089027 ) ) ( ON ?auto_2089013 ?auto_2089012 ) ( ON ?auto_2089014 ?auto_2089013 ) ( ON ?auto_2089016 ?auto_2089014 ) ( ON ?auto_2089015 ?auto_2089016 ) ( ON ?auto_2089017 ?auto_2089015 ) ( ON ?auto_2089018 ?auto_2089017 ) ( ON ?auto_2089019 ?auto_2089018 ) ( ON ?auto_2089020 ?auto_2089019 ) ( ON ?auto_2089021 ?auto_2089020 ) ( ON ?auto_2089022 ?auto_2089021 ) ( ON ?auto_2089023 ?auto_2089022 ) ( ON ?auto_2089024 ?auto_2089023 ) ( not ( = ?auto_2089012 ?auto_2089013 ) ) ( not ( = ?auto_2089012 ?auto_2089014 ) ) ( not ( = ?auto_2089012 ?auto_2089016 ) ) ( not ( = ?auto_2089012 ?auto_2089015 ) ) ( not ( = ?auto_2089012 ?auto_2089017 ) ) ( not ( = ?auto_2089012 ?auto_2089018 ) ) ( not ( = ?auto_2089012 ?auto_2089019 ) ) ( not ( = ?auto_2089012 ?auto_2089020 ) ) ( not ( = ?auto_2089012 ?auto_2089021 ) ) ( not ( = ?auto_2089012 ?auto_2089022 ) ) ( not ( = ?auto_2089012 ?auto_2089023 ) ) ( not ( = ?auto_2089012 ?auto_2089024 ) ) ( not ( = ?auto_2089012 ?auto_2089025 ) ) ( not ( = ?auto_2089012 ?auto_2089026 ) ) ( not ( = ?auto_2089012 ?auto_2089030 ) ) ( not ( = ?auto_2089012 ?auto_2089027 ) ) ( not ( = ?auto_2089013 ?auto_2089014 ) ) ( not ( = ?auto_2089013 ?auto_2089016 ) ) ( not ( = ?auto_2089013 ?auto_2089015 ) ) ( not ( = ?auto_2089013 ?auto_2089017 ) ) ( not ( = ?auto_2089013 ?auto_2089018 ) ) ( not ( = ?auto_2089013 ?auto_2089019 ) ) ( not ( = ?auto_2089013 ?auto_2089020 ) ) ( not ( = ?auto_2089013 ?auto_2089021 ) ) ( not ( = ?auto_2089013 ?auto_2089022 ) ) ( not ( = ?auto_2089013 ?auto_2089023 ) ) ( not ( = ?auto_2089013 ?auto_2089024 ) ) ( not ( = ?auto_2089013 ?auto_2089025 ) ) ( not ( = ?auto_2089013 ?auto_2089026 ) ) ( not ( = ?auto_2089013 ?auto_2089030 ) ) ( not ( = ?auto_2089013 ?auto_2089027 ) ) ( not ( = ?auto_2089014 ?auto_2089016 ) ) ( not ( = ?auto_2089014 ?auto_2089015 ) ) ( not ( = ?auto_2089014 ?auto_2089017 ) ) ( not ( = ?auto_2089014 ?auto_2089018 ) ) ( not ( = ?auto_2089014 ?auto_2089019 ) ) ( not ( = ?auto_2089014 ?auto_2089020 ) ) ( not ( = ?auto_2089014 ?auto_2089021 ) ) ( not ( = ?auto_2089014 ?auto_2089022 ) ) ( not ( = ?auto_2089014 ?auto_2089023 ) ) ( not ( = ?auto_2089014 ?auto_2089024 ) ) ( not ( = ?auto_2089014 ?auto_2089025 ) ) ( not ( = ?auto_2089014 ?auto_2089026 ) ) ( not ( = ?auto_2089014 ?auto_2089030 ) ) ( not ( = ?auto_2089014 ?auto_2089027 ) ) ( not ( = ?auto_2089016 ?auto_2089015 ) ) ( not ( = ?auto_2089016 ?auto_2089017 ) ) ( not ( = ?auto_2089016 ?auto_2089018 ) ) ( not ( = ?auto_2089016 ?auto_2089019 ) ) ( not ( = ?auto_2089016 ?auto_2089020 ) ) ( not ( = ?auto_2089016 ?auto_2089021 ) ) ( not ( = ?auto_2089016 ?auto_2089022 ) ) ( not ( = ?auto_2089016 ?auto_2089023 ) ) ( not ( = ?auto_2089016 ?auto_2089024 ) ) ( not ( = ?auto_2089016 ?auto_2089025 ) ) ( not ( = ?auto_2089016 ?auto_2089026 ) ) ( not ( = ?auto_2089016 ?auto_2089030 ) ) ( not ( = ?auto_2089016 ?auto_2089027 ) ) ( not ( = ?auto_2089015 ?auto_2089017 ) ) ( not ( = ?auto_2089015 ?auto_2089018 ) ) ( not ( = ?auto_2089015 ?auto_2089019 ) ) ( not ( = ?auto_2089015 ?auto_2089020 ) ) ( not ( = ?auto_2089015 ?auto_2089021 ) ) ( not ( = ?auto_2089015 ?auto_2089022 ) ) ( not ( = ?auto_2089015 ?auto_2089023 ) ) ( not ( = ?auto_2089015 ?auto_2089024 ) ) ( not ( = ?auto_2089015 ?auto_2089025 ) ) ( not ( = ?auto_2089015 ?auto_2089026 ) ) ( not ( = ?auto_2089015 ?auto_2089030 ) ) ( not ( = ?auto_2089015 ?auto_2089027 ) ) ( not ( = ?auto_2089017 ?auto_2089018 ) ) ( not ( = ?auto_2089017 ?auto_2089019 ) ) ( not ( = ?auto_2089017 ?auto_2089020 ) ) ( not ( = ?auto_2089017 ?auto_2089021 ) ) ( not ( = ?auto_2089017 ?auto_2089022 ) ) ( not ( = ?auto_2089017 ?auto_2089023 ) ) ( not ( = ?auto_2089017 ?auto_2089024 ) ) ( not ( = ?auto_2089017 ?auto_2089025 ) ) ( not ( = ?auto_2089017 ?auto_2089026 ) ) ( not ( = ?auto_2089017 ?auto_2089030 ) ) ( not ( = ?auto_2089017 ?auto_2089027 ) ) ( not ( = ?auto_2089018 ?auto_2089019 ) ) ( not ( = ?auto_2089018 ?auto_2089020 ) ) ( not ( = ?auto_2089018 ?auto_2089021 ) ) ( not ( = ?auto_2089018 ?auto_2089022 ) ) ( not ( = ?auto_2089018 ?auto_2089023 ) ) ( not ( = ?auto_2089018 ?auto_2089024 ) ) ( not ( = ?auto_2089018 ?auto_2089025 ) ) ( not ( = ?auto_2089018 ?auto_2089026 ) ) ( not ( = ?auto_2089018 ?auto_2089030 ) ) ( not ( = ?auto_2089018 ?auto_2089027 ) ) ( not ( = ?auto_2089019 ?auto_2089020 ) ) ( not ( = ?auto_2089019 ?auto_2089021 ) ) ( not ( = ?auto_2089019 ?auto_2089022 ) ) ( not ( = ?auto_2089019 ?auto_2089023 ) ) ( not ( = ?auto_2089019 ?auto_2089024 ) ) ( not ( = ?auto_2089019 ?auto_2089025 ) ) ( not ( = ?auto_2089019 ?auto_2089026 ) ) ( not ( = ?auto_2089019 ?auto_2089030 ) ) ( not ( = ?auto_2089019 ?auto_2089027 ) ) ( not ( = ?auto_2089020 ?auto_2089021 ) ) ( not ( = ?auto_2089020 ?auto_2089022 ) ) ( not ( = ?auto_2089020 ?auto_2089023 ) ) ( not ( = ?auto_2089020 ?auto_2089024 ) ) ( not ( = ?auto_2089020 ?auto_2089025 ) ) ( not ( = ?auto_2089020 ?auto_2089026 ) ) ( not ( = ?auto_2089020 ?auto_2089030 ) ) ( not ( = ?auto_2089020 ?auto_2089027 ) ) ( not ( = ?auto_2089021 ?auto_2089022 ) ) ( not ( = ?auto_2089021 ?auto_2089023 ) ) ( not ( = ?auto_2089021 ?auto_2089024 ) ) ( not ( = ?auto_2089021 ?auto_2089025 ) ) ( not ( = ?auto_2089021 ?auto_2089026 ) ) ( not ( = ?auto_2089021 ?auto_2089030 ) ) ( not ( = ?auto_2089021 ?auto_2089027 ) ) ( not ( = ?auto_2089022 ?auto_2089023 ) ) ( not ( = ?auto_2089022 ?auto_2089024 ) ) ( not ( = ?auto_2089022 ?auto_2089025 ) ) ( not ( = ?auto_2089022 ?auto_2089026 ) ) ( not ( = ?auto_2089022 ?auto_2089030 ) ) ( not ( = ?auto_2089022 ?auto_2089027 ) ) ( not ( = ?auto_2089023 ?auto_2089024 ) ) ( not ( = ?auto_2089023 ?auto_2089025 ) ) ( not ( = ?auto_2089023 ?auto_2089026 ) ) ( not ( = ?auto_2089023 ?auto_2089030 ) ) ( not ( = ?auto_2089023 ?auto_2089027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089024 ?auto_2089025 ?auto_2089026 )
      ( MAKE-14CRATE-VERIFY ?auto_2089012 ?auto_2089013 ?auto_2089014 ?auto_2089016 ?auto_2089015 ?auto_2089017 ?auto_2089018 ?auto_2089019 ?auto_2089020 ?auto_2089021 ?auto_2089022 ?auto_2089023 ?auto_2089024 ?auto_2089025 ?auto_2089026 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089230 - SURFACE
      ?auto_2089231 - SURFACE
      ?auto_2089232 - SURFACE
      ?auto_2089234 - SURFACE
      ?auto_2089233 - SURFACE
      ?auto_2089235 - SURFACE
      ?auto_2089236 - SURFACE
      ?auto_2089237 - SURFACE
      ?auto_2089238 - SURFACE
      ?auto_2089239 - SURFACE
      ?auto_2089240 - SURFACE
      ?auto_2089241 - SURFACE
      ?auto_2089242 - SURFACE
      ?auto_2089243 - SURFACE
      ?auto_2089244 - SURFACE
    )
    :vars
    (
      ?auto_2089251 - HOIST
      ?auto_2089249 - PLACE
      ?auto_2089246 - PLACE
      ?auto_2089245 - HOIST
      ?auto_2089247 - SURFACE
      ?auto_2089248 - SURFACE
      ?auto_2089250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089251 ?auto_2089249 ) ( IS-CRATE ?auto_2089244 ) ( not ( = ?auto_2089243 ?auto_2089244 ) ) ( not ( = ?auto_2089242 ?auto_2089243 ) ) ( not ( = ?auto_2089242 ?auto_2089244 ) ) ( not ( = ?auto_2089246 ?auto_2089249 ) ) ( HOIST-AT ?auto_2089245 ?auto_2089246 ) ( not ( = ?auto_2089251 ?auto_2089245 ) ) ( SURFACE-AT ?auto_2089244 ?auto_2089246 ) ( ON ?auto_2089244 ?auto_2089247 ) ( CLEAR ?auto_2089244 ) ( not ( = ?auto_2089243 ?auto_2089247 ) ) ( not ( = ?auto_2089244 ?auto_2089247 ) ) ( not ( = ?auto_2089242 ?auto_2089247 ) ) ( SURFACE-AT ?auto_2089242 ?auto_2089249 ) ( CLEAR ?auto_2089242 ) ( IS-CRATE ?auto_2089243 ) ( AVAILABLE ?auto_2089251 ) ( AVAILABLE ?auto_2089245 ) ( SURFACE-AT ?auto_2089243 ?auto_2089246 ) ( ON ?auto_2089243 ?auto_2089248 ) ( CLEAR ?auto_2089243 ) ( not ( = ?auto_2089243 ?auto_2089248 ) ) ( not ( = ?auto_2089244 ?auto_2089248 ) ) ( not ( = ?auto_2089242 ?auto_2089248 ) ) ( not ( = ?auto_2089247 ?auto_2089248 ) ) ( TRUCK-AT ?auto_2089250 ?auto_2089249 ) ( ON ?auto_2089231 ?auto_2089230 ) ( ON ?auto_2089232 ?auto_2089231 ) ( ON ?auto_2089234 ?auto_2089232 ) ( ON ?auto_2089233 ?auto_2089234 ) ( ON ?auto_2089235 ?auto_2089233 ) ( ON ?auto_2089236 ?auto_2089235 ) ( ON ?auto_2089237 ?auto_2089236 ) ( ON ?auto_2089238 ?auto_2089237 ) ( ON ?auto_2089239 ?auto_2089238 ) ( ON ?auto_2089240 ?auto_2089239 ) ( ON ?auto_2089241 ?auto_2089240 ) ( ON ?auto_2089242 ?auto_2089241 ) ( not ( = ?auto_2089230 ?auto_2089231 ) ) ( not ( = ?auto_2089230 ?auto_2089232 ) ) ( not ( = ?auto_2089230 ?auto_2089234 ) ) ( not ( = ?auto_2089230 ?auto_2089233 ) ) ( not ( = ?auto_2089230 ?auto_2089235 ) ) ( not ( = ?auto_2089230 ?auto_2089236 ) ) ( not ( = ?auto_2089230 ?auto_2089237 ) ) ( not ( = ?auto_2089230 ?auto_2089238 ) ) ( not ( = ?auto_2089230 ?auto_2089239 ) ) ( not ( = ?auto_2089230 ?auto_2089240 ) ) ( not ( = ?auto_2089230 ?auto_2089241 ) ) ( not ( = ?auto_2089230 ?auto_2089242 ) ) ( not ( = ?auto_2089230 ?auto_2089243 ) ) ( not ( = ?auto_2089230 ?auto_2089244 ) ) ( not ( = ?auto_2089230 ?auto_2089247 ) ) ( not ( = ?auto_2089230 ?auto_2089248 ) ) ( not ( = ?auto_2089231 ?auto_2089232 ) ) ( not ( = ?auto_2089231 ?auto_2089234 ) ) ( not ( = ?auto_2089231 ?auto_2089233 ) ) ( not ( = ?auto_2089231 ?auto_2089235 ) ) ( not ( = ?auto_2089231 ?auto_2089236 ) ) ( not ( = ?auto_2089231 ?auto_2089237 ) ) ( not ( = ?auto_2089231 ?auto_2089238 ) ) ( not ( = ?auto_2089231 ?auto_2089239 ) ) ( not ( = ?auto_2089231 ?auto_2089240 ) ) ( not ( = ?auto_2089231 ?auto_2089241 ) ) ( not ( = ?auto_2089231 ?auto_2089242 ) ) ( not ( = ?auto_2089231 ?auto_2089243 ) ) ( not ( = ?auto_2089231 ?auto_2089244 ) ) ( not ( = ?auto_2089231 ?auto_2089247 ) ) ( not ( = ?auto_2089231 ?auto_2089248 ) ) ( not ( = ?auto_2089232 ?auto_2089234 ) ) ( not ( = ?auto_2089232 ?auto_2089233 ) ) ( not ( = ?auto_2089232 ?auto_2089235 ) ) ( not ( = ?auto_2089232 ?auto_2089236 ) ) ( not ( = ?auto_2089232 ?auto_2089237 ) ) ( not ( = ?auto_2089232 ?auto_2089238 ) ) ( not ( = ?auto_2089232 ?auto_2089239 ) ) ( not ( = ?auto_2089232 ?auto_2089240 ) ) ( not ( = ?auto_2089232 ?auto_2089241 ) ) ( not ( = ?auto_2089232 ?auto_2089242 ) ) ( not ( = ?auto_2089232 ?auto_2089243 ) ) ( not ( = ?auto_2089232 ?auto_2089244 ) ) ( not ( = ?auto_2089232 ?auto_2089247 ) ) ( not ( = ?auto_2089232 ?auto_2089248 ) ) ( not ( = ?auto_2089234 ?auto_2089233 ) ) ( not ( = ?auto_2089234 ?auto_2089235 ) ) ( not ( = ?auto_2089234 ?auto_2089236 ) ) ( not ( = ?auto_2089234 ?auto_2089237 ) ) ( not ( = ?auto_2089234 ?auto_2089238 ) ) ( not ( = ?auto_2089234 ?auto_2089239 ) ) ( not ( = ?auto_2089234 ?auto_2089240 ) ) ( not ( = ?auto_2089234 ?auto_2089241 ) ) ( not ( = ?auto_2089234 ?auto_2089242 ) ) ( not ( = ?auto_2089234 ?auto_2089243 ) ) ( not ( = ?auto_2089234 ?auto_2089244 ) ) ( not ( = ?auto_2089234 ?auto_2089247 ) ) ( not ( = ?auto_2089234 ?auto_2089248 ) ) ( not ( = ?auto_2089233 ?auto_2089235 ) ) ( not ( = ?auto_2089233 ?auto_2089236 ) ) ( not ( = ?auto_2089233 ?auto_2089237 ) ) ( not ( = ?auto_2089233 ?auto_2089238 ) ) ( not ( = ?auto_2089233 ?auto_2089239 ) ) ( not ( = ?auto_2089233 ?auto_2089240 ) ) ( not ( = ?auto_2089233 ?auto_2089241 ) ) ( not ( = ?auto_2089233 ?auto_2089242 ) ) ( not ( = ?auto_2089233 ?auto_2089243 ) ) ( not ( = ?auto_2089233 ?auto_2089244 ) ) ( not ( = ?auto_2089233 ?auto_2089247 ) ) ( not ( = ?auto_2089233 ?auto_2089248 ) ) ( not ( = ?auto_2089235 ?auto_2089236 ) ) ( not ( = ?auto_2089235 ?auto_2089237 ) ) ( not ( = ?auto_2089235 ?auto_2089238 ) ) ( not ( = ?auto_2089235 ?auto_2089239 ) ) ( not ( = ?auto_2089235 ?auto_2089240 ) ) ( not ( = ?auto_2089235 ?auto_2089241 ) ) ( not ( = ?auto_2089235 ?auto_2089242 ) ) ( not ( = ?auto_2089235 ?auto_2089243 ) ) ( not ( = ?auto_2089235 ?auto_2089244 ) ) ( not ( = ?auto_2089235 ?auto_2089247 ) ) ( not ( = ?auto_2089235 ?auto_2089248 ) ) ( not ( = ?auto_2089236 ?auto_2089237 ) ) ( not ( = ?auto_2089236 ?auto_2089238 ) ) ( not ( = ?auto_2089236 ?auto_2089239 ) ) ( not ( = ?auto_2089236 ?auto_2089240 ) ) ( not ( = ?auto_2089236 ?auto_2089241 ) ) ( not ( = ?auto_2089236 ?auto_2089242 ) ) ( not ( = ?auto_2089236 ?auto_2089243 ) ) ( not ( = ?auto_2089236 ?auto_2089244 ) ) ( not ( = ?auto_2089236 ?auto_2089247 ) ) ( not ( = ?auto_2089236 ?auto_2089248 ) ) ( not ( = ?auto_2089237 ?auto_2089238 ) ) ( not ( = ?auto_2089237 ?auto_2089239 ) ) ( not ( = ?auto_2089237 ?auto_2089240 ) ) ( not ( = ?auto_2089237 ?auto_2089241 ) ) ( not ( = ?auto_2089237 ?auto_2089242 ) ) ( not ( = ?auto_2089237 ?auto_2089243 ) ) ( not ( = ?auto_2089237 ?auto_2089244 ) ) ( not ( = ?auto_2089237 ?auto_2089247 ) ) ( not ( = ?auto_2089237 ?auto_2089248 ) ) ( not ( = ?auto_2089238 ?auto_2089239 ) ) ( not ( = ?auto_2089238 ?auto_2089240 ) ) ( not ( = ?auto_2089238 ?auto_2089241 ) ) ( not ( = ?auto_2089238 ?auto_2089242 ) ) ( not ( = ?auto_2089238 ?auto_2089243 ) ) ( not ( = ?auto_2089238 ?auto_2089244 ) ) ( not ( = ?auto_2089238 ?auto_2089247 ) ) ( not ( = ?auto_2089238 ?auto_2089248 ) ) ( not ( = ?auto_2089239 ?auto_2089240 ) ) ( not ( = ?auto_2089239 ?auto_2089241 ) ) ( not ( = ?auto_2089239 ?auto_2089242 ) ) ( not ( = ?auto_2089239 ?auto_2089243 ) ) ( not ( = ?auto_2089239 ?auto_2089244 ) ) ( not ( = ?auto_2089239 ?auto_2089247 ) ) ( not ( = ?auto_2089239 ?auto_2089248 ) ) ( not ( = ?auto_2089240 ?auto_2089241 ) ) ( not ( = ?auto_2089240 ?auto_2089242 ) ) ( not ( = ?auto_2089240 ?auto_2089243 ) ) ( not ( = ?auto_2089240 ?auto_2089244 ) ) ( not ( = ?auto_2089240 ?auto_2089247 ) ) ( not ( = ?auto_2089240 ?auto_2089248 ) ) ( not ( = ?auto_2089241 ?auto_2089242 ) ) ( not ( = ?auto_2089241 ?auto_2089243 ) ) ( not ( = ?auto_2089241 ?auto_2089244 ) ) ( not ( = ?auto_2089241 ?auto_2089247 ) ) ( not ( = ?auto_2089241 ?auto_2089248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089242 ?auto_2089243 ?auto_2089244 )
      ( MAKE-14CRATE-VERIFY ?auto_2089230 ?auto_2089231 ?auto_2089232 ?auto_2089234 ?auto_2089233 ?auto_2089235 ?auto_2089236 ?auto_2089237 ?auto_2089238 ?auto_2089239 ?auto_2089240 ?auto_2089241 ?auto_2089242 ?auto_2089243 ?auto_2089244 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089450 - SURFACE
      ?auto_2089451 - SURFACE
      ?auto_2089452 - SURFACE
      ?auto_2089454 - SURFACE
      ?auto_2089453 - SURFACE
      ?auto_2089455 - SURFACE
      ?auto_2089456 - SURFACE
      ?auto_2089457 - SURFACE
      ?auto_2089458 - SURFACE
      ?auto_2089459 - SURFACE
      ?auto_2089460 - SURFACE
      ?auto_2089461 - SURFACE
      ?auto_2089462 - SURFACE
      ?auto_2089463 - SURFACE
      ?auto_2089464 - SURFACE
    )
    :vars
    (
      ?auto_2089467 - HOIST
      ?auto_2089469 - PLACE
      ?auto_2089465 - PLACE
      ?auto_2089471 - HOIST
      ?auto_2089470 - SURFACE
      ?auto_2089468 - SURFACE
      ?auto_2089466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089467 ?auto_2089469 ) ( IS-CRATE ?auto_2089464 ) ( not ( = ?auto_2089463 ?auto_2089464 ) ) ( not ( = ?auto_2089462 ?auto_2089463 ) ) ( not ( = ?auto_2089462 ?auto_2089464 ) ) ( not ( = ?auto_2089465 ?auto_2089469 ) ) ( HOIST-AT ?auto_2089471 ?auto_2089465 ) ( not ( = ?auto_2089467 ?auto_2089471 ) ) ( SURFACE-AT ?auto_2089464 ?auto_2089465 ) ( ON ?auto_2089464 ?auto_2089470 ) ( CLEAR ?auto_2089464 ) ( not ( = ?auto_2089463 ?auto_2089470 ) ) ( not ( = ?auto_2089464 ?auto_2089470 ) ) ( not ( = ?auto_2089462 ?auto_2089470 ) ) ( IS-CRATE ?auto_2089463 ) ( AVAILABLE ?auto_2089471 ) ( SURFACE-AT ?auto_2089463 ?auto_2089465 ) ( ON ?auto_2089463 ?auto_2089468 ) ( CLEAR ?auto_2089463 ) ( not ( = ?auto_2089463 ?auto_2089468 ) ) ( not ( = ?auto_2089464 ?auto_2089468 ) ) ( not ( = ?auto_2089462 ?auto_2089468 ) ) ( not ( = ?auto_2089470 ?auto_2089468 ) ) ( TRUCK-AT ?auto_2089466 ?auto_2089469 ) ( SURFACE-AT ?auto_2089461 ?auto_2089469 ) ( CLEAR ?auto_2089461 ) ( LIFTING ?auto_2089467 ?auto_2089462 ) ( IS-CRATE ?auto_2089462 ) ( not ( = ?auto_2089461 ?auto_2089462 ) ) ( not ( = ?auto_2089463 ?auto_2089461 ) ) ( not ( = ?auto_2089464 ?auto_2089461 ) ) ( not ( = ?auto_2089470 ?auto_2089461 ) ) ( not ( = ?auto_2089468 ?auto_2089461 ) ) ( ON ?auto_2089451 ?auto_2089450 ) ( ON ?auto_2089452 ?auto_2089451 ) ( ON ?auto_2089454 ?auto_2089452 ) ( ON ?auto_2089453 ?auto_2089454 ) ( ON ?auto_2089455 ?auto_2089453 ) ( ON ?auto_2089456 ?auto_2089455 ) ( ON ?auto_2089457 ?auto_2089456 ) ( ON ?auto_2089458 ?auto_2089457 ) ( ON ?auto_2089459 ?auto_2089458 ) ( ON ?auto_2089460 ?auto_2089459 ) ( ON ?auto_2089461 ?auto_2089460 ) ( not ( = ?auto_2089450 ?auto_2089451 ) ) ( not ( = ?auto_2089450 ?auto_2089452 ) ) ( not ( = ?auto_2089450 ?auto_2089454 ) ) ( not ( = ?auto_2089450 ?auto_2089453 ) ) ( not ( = ?auto_2089450 ?auto_2089455 ) ) ( not ( = ?auto_2089450 ?auto_2089456 ) ) ( not ( = ?auto_2089450 ?auto_2089457 ) ) ( not ( = ?auto_2089450 ?auto_2089458 ) ) ( not ( = ?auto_2089450 ?auto_2089459 ) ) ( not ( = ?auto_2089450 ?auto_2089460 ) ) ( not ( = ?auto_2089450 ?auto_2089461 ) ) ( not ( = ?auto_2089450 ?auto_2089462 ) ) ( not ( = ?auto_2089450 ?auto_2089463 ) ) ( not ( = ?auto_2089450 ?auto_2089464 ) ) ( not ( = ?auto_2089450 ?auto_2089470 ) ) ( not ( = ?auto_2089450 ?auto_2089468 ) ) ( not ( = ?auto_2089451 ?auto_2089452 ) ) ( not ( = ?auto_2089451 ?auto_2089454 ) ) ( not ( = ?auto_2089451 ?auto_2089453 ) ) ( not ( = ?auto_2089451 ?auto_2089455 ) ) ( not ( = ?auto_2089451 ?auto_2089456 ) ) ( not ( = ?auto_2089451 ?auto_2089457 ) ) ( not ( = ?auto_2089451 ?auto_2089458 ) ) ( not ( = ?auto_2089451 ?auto_2089459 ) ) ( not ( = ?auto_2089451 ?auto_2089460 ) ) ( not ( = ?auto_2089451 ?auto_2089461 ) ) ( not ( = ?auto_2089451 ?auto_2089462 ) ) ( not ( = ?auto_2089451 ?auto_2089463 ) ) ( not ( = ?auto_2089451 ?auto_2089464 ) ) ( not ( = ?auto_2089451 ?auto_2089470 ) ) ( not ( = ?auto_2089451 ?auto_2089468 ) ) ( not ( = ?auto_2089452 ?auto_2089454 ) ) ( not ( = ?auto_2089452 ?auto_2089453 ) ) ( not ( = ?auto_2089452 ?auto_2089455 ) ) ( not ( = ?auto_2089452 ?auto_2089456 ) ) ( not ( = ?auto_2089452 ?auto_2089457 ) ) ( not ( = ?auto_2089452 ?auto_2089458 ) ) ( not ( = ?auto_2089452 ?auto_2089459 ) ) ( not ( = ?auto_2089452 ?auto_2089460 ) ) ( not ( = ?auto_2089452 ?auto_2089461 ) ) ( not ( = ?auto_2089452 ?auto_2089462 ) ) ( not ( = ?auto_2089452 ?auto_2089463 ) ) ( not ( = ?auto_2089452 ?auto_2089464 ) ) ( not ( = ?auto_2089452 ?auto_2089470 ) ) ( not ( = ?auto_2089452 ?auto_2089468 ) ) ( not ( = ?auto_2089454 ?auto_2089453 ) ) ( not ( = ?auto_2089454 ?auto_2089455 ) ) ( not ( = ?auto_2089454 ?auto_2089456 ) ) ( not ( = ?auto_2089454 ?auto_2089457 ) ) ( not ( = ?auto_2089454 ?auto_2089458 ) ) ( not ( = ?auto_2089454 ?auto_2089459 ) ) ( not ( = ?auto_2089454 ?auto_2089460 ) ) ( not ( = ?auto_2089454 ?auto_2089461 ) ) ( not ( = ?auto_2089454 ?auto_2089462 ) ) ( not ( = ?auto_2089454 ?auto_2089463 ) ) ( not ( = ?auto_2089454 ?auto_2089464 ) ) ( not ( = ?auto_2089454 ?auto_2089470 ) ) ( not ( = ?auto_2089454 ?auto_2089468 ) ) ( not ( = ?auto_2089453 ?auto_2089455 ) ) ( not ( = ?auto_2089453 ?auto_2089456 ) ) ( not ( = ?auto_2089453 ?auto_2089457 ) ) ( not ( = ?auto_2089453 ?auto_2089458 ) ) ( not ( = ?auto_2089453 ?auto_2089459 ) ) ( not ( = ?auto_2089453 ?auto_2089460 ) ) ( not ( = ?auto_2089453 ?auto_2089461 ) ) ( not ( = ?auto_2089453 ?auto_2089462 ) ) ( not ( = ?auto_2089453 ?auto_2089463 ) ) ( not ( = ?auto_2089453 ?auto_2089464 ) ) ( not ( = ?auto_2089453 ?auto_2089470 ) ) ( not ( = ?auto_2089453 ?auto_2089468 ) ) ( not ( = ?auto_2089455 ?auto_2089456 ) ) ( not ( = ?auto_2089455 ?auto_2089457 ) ) ( not ( = ?auto_2089455 ?auto_2089458 ) ) ( not ( = ?auto_2089455 ?auto_2089459 ) ) ( not ( = ?auto_2089455 ?auto_2089460 ) ) ( not ( = ?auto_2089455 ?auto_2089461 ) ) ( not ( = ?auto_2089455 ?auto_2089462 ) ) ( not ( = ?auto_2089455 ?auto_2089463 ) ) ( not ( = ?auto_2089455 ?auto_2089464 ) ) ( not ( = ?auto_2089455 ?auto_2089470 ) ) ( not ( = ?auto_2089455 ?auto_2089468 ) ) ( not ( = ?auto_2089456 ?auto_2089457 ) ) ( not ( = ?auto_2089456 ?auto_2089458 ) ) ( not ( = ?auto_2089456 ?auto_2089459 ) ) ( not ( = ?auto_2089456 ?auto_2089460 ) ) ( not ( = ?auto_2089456 ?auto_2089461 ) ) ( not ( = ?auto_2089456 ?auto_2089462 ) ) ( not ( = ?auto_2089456 ?auto_2089463 ) ) ( not ( = ?auto_2089456 ?auto_2089464 ) ) ( not ( = ?auto_2089456 ?auto_2089470 ) ) ( not ( = ?auto_2089456 ?auto_2089468 ) ) ( not ( = ?auto_2089457 ?auto_2089458 ) ) ( not ( = ?auto_2089457 ?auto_2089459 ) ) ( not ( = ?auto_2089457 ?auto_2089460 ) ) ( not ( = ?auto_2089457 ?auto_2089461 ) ) ( not ( = ?auto_2089457 ?auto_2089462 ) ) ( not ( = ?auto_2089457 ?auto_2089463 ) ) ( not ( = ?auto_2089457 ?auto_2089464 ) ) ( not ( = ?auto_2089457 ?auto_2089470 ) ) ( not ( = ?auto_2089457 ?auto_2089468 ) ) ( not ( = ?auto_2089458 ?auto_2089459 ) ) ( not ( = ?auto_2089458 ?auto_2089460 ) ) ( not ( = ?auto_2089458 ?auto_2089461 ) ) ( not ( = ?auto_2089458 ?auto_2089462 ) ) ( not ( = ?auto_2089458 ?auto_2089463 ) ) ( not ( = ?auto_2089458 ?auto_2089464 ) ) ( not ( = ?auto_2089458 ?auto_2089470 ) ) ( not ( = ?auto_2089458 ?auto_2089468 ) ) ( not ( = ?auto_2089459 ?auto_2089460 ) ) ( not ( = ?auto_2089459 ?auto_2089461 ) ) ( not ( = ?auto_2089459 ?auto_2089462 ) ) ( not ( = ?auto_2089459 ?auto_2089463 ) ) ( not ( = ?auto_2089459 ?auto_2089464 ) ) ( not ( = ?auto_2089459 ?auto_2089470 ) ) ( not ( = ?auto_2089459 ?auto_2089468 ) ) ( not ( = ?auto_2089460 ?auto_2089461 ) ) ( not ( = ?auto_2089460 ?auto_2089462 ) ) ( not ( = ?auto_2089460 ?auto_2089463 ) ) ( not ( = ?auto_2089460 ?auto_2089464 ) ) ( not ( = ?auto_2089460 ?auto_2089470 ) ) ( not ( = ?auto_2089460 ?auto_2089468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089462 ?auto_2089463 ?auto_2089464 )
      ( MAKE-14CRATE-VERIFY ?auto_2089450 ?auto_2089451 ?auto_2089452 ?auto_2089454 ?auto_2089453 ?auto_2089455 ?auto_2089456 ?auto_2089457 ?auto_2089458 ?auto_2089459 ?auto_2089460 ?auto_2089461 ?auto_2089462 ?auto_2089463 ?auto_2089464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2089906 - SURFACE
      ?auto_2089907 - SURFACE
    )
    :vars
    (
      ?auto_2089912 - HOIST
      ?auto_2089915 - PLACE
      ?auto_2089911 - SURFACE
      ?auto_2089908 - PLACE
      ?auto_2089910 - HOIST
      ?auto_2089913 - SURFACE
      ?auto_2089909 - TRUCK
      ?auto_2089914 - SURFACE
      ?auto_2089916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089912 ?auto_2089915 ) ( IS-CRATE ?auto_2089907 ) ( not ( = ?auto_2089906 ?auto_2089907 ) ) ( not ( = ?auto_2089911 ?auto_2089906 ) ) ( not ( = ?auto_2089911 ?auto_2089907 ) ) ( not ( = ?auto_2089908 ?auto_2089915 ) ) ( HOIST-AT ?auto_2089910 ?auto_2089908 ) ( not ( = ?auto_2089912 ?auto_2089910 ) ) ( SURFACE-AT ?auto_2089907 ?auto_2089908 ) ( ON ?auto_2089907 ?auto_2089913 ) ( CLEAR ?auto_2089907 ) ( not ( = ?auto_2089906 ?auto_2089913 ) ) ( not ( = ?auto_2089907 ?auto_2089913 ) ) ( not ( = ?auto_2089911 ?auto_2089913 ) ) ( SURFACE-AT ?auto_2089911 ?auto_2089915 ) ( CLEAR ?auto_2089911 ) ( IS-CRATE ?auto_2089906 ) ( AVAILABLE ?auto_2089912 ) ( TRUCK-AT ?auto_2089909 ?auto_2089908 ) ( SURFACE-AT ?auto_2089906 ?auto_2089908 ) ( ON ?auto_2089906 ?auto_2089914 ) ( CLEAR ?auto_2089906 ) ( not ( = ?auto_2089906 ?auto_2089914 ) ) ( not ( = ?auto_2089907 ?auto_2089914 ) ) ( not ( = ?auto_2089911 ?auto_2089914 ) ) ( not ( = ?auto_2089913 ?auto_2089914 ) ) ( LIFTING ?auto_2089910 ?auto_2089916 ) ( IS-CRATE ?auto_2089916 ) ( not ( = ?auto_2089906 ?auto_2089916 ) ) ( not ( = ?auto_2089907 ?auto_2089916 ) ) ( not ( = ?auto_2089911 ?auto_2089916 ) ) ( not ( = ?auto_2089913 ?auto_2089916 ) ) ( not ( = ?auto_2089914 ?auto_2089916 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2089910 ?auto_2089916 ?auto_2089909 ?auto_2089908 )
      ( MAKE-1CRATE ?auto_2089906 ?auto_2089907 )
      ( MAKE-1CRATE-VERIFY ?auto_2089906 ?auto_2089907 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2105462 - SURFACE
      ?auto_2105463 - SURFACE
      ?auto_2105464 - SURFACE
      ?auto_2105466 - SURFACE
      ?auto_2105465 - SURFACE
      ?auto_2105467 - SURFACE
      ?auto_2105468 - SURFACE
      ?auto_2105469 - SURFACE
      ?auto_2105470 - SURFACE
      ?auto_2105471 - SURFACE
      ?auto_2105472 - SURFACE
      ?auto_2105473 - SURFACE
      ?auto_2105474 - SURFACE
      ?auto_2105475 - SURFACE
      ?auto_2105476 - SURFACE
      ?auto_2105477 - SURFACE
    )
    :vars
    (
      ?auto_2105479 - HOIST
      ?auto_2105478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2105479 ?auto_2105478 ) ( SURFACE-AT ?auto_2105476 ?auto_2105478 ) ( CLEAR ?auto_2105476 ) ( LIFTING ?auto_2105479 ?auto_2105477 ) ( IS-CRATE ?auto_2105477 ) ( not ( = ?auto_2105476 ?auto_2105477 ) ) ( ON ?auto_2105463 ?auto_2105462 ) ( ON ?auto_2105464 ?auto_2105463 ) ( ON ?auto_2105466 ?auto_2105464 ) ( ON ?auto_2105465 ?auto_2105466 ) ( ON ?auto_2105467 ?auto_2105465 ) ( ON ?auto_2105468 ?auto_2105467 ) ( ON ?auto_2105469 ?auto_2105468 ) ( ON ?auto_2105470 ?auto_2105469 ) ( ON ?auto_2105471 ?auto_2105470 ) ( ON ?auto_2105472 ?auto_2105471 ) ( ON ?auto_2105473 ?auto_2105472 ) ( ON ?auto_2105474 ?auto_2105473 ) ( ON ?auto_2105475 ?auto_2105474 ) ( ON ?auto_2105476 ?auto_2105475 ) ( not ( = ?auto_2105462 ?auto_2105463 ) ) ( not ( = ?auto_2105462 ?auto_2105464 ) ) ( not ( = ?auto_2105462 ?auto_2105466 ) ) ( not ( = ?auto_2105462 ?auto_2105465 ) ) ( not ( = ?auto_2105462 ?auto_2105467 ) ) ( not ( = ?auto_2105462 ?auto_2105468 ) ) ( not ( = ?auto_2105462 ?auto_2105469 ) ) ( not ( = ?auto_2105462 ?auto_2105470 ) ) ( not ( = ?auto_2105462 ?auto_2105471 ) ) ( not ( = ?auto_2105462 ?auto_2105472 ) ) ( not ( = ?auto_2105462 ?auto_2105473 ) ) ( not ( = ?auto_2105462 ?auto_2105474 ) ) ( not ( = ?auto_2105462 ?auto_2105475 ) ) ( not ( = ?auto_2105462 ?auto_2105476 ) ) ( not ( = ?auto_2105462 ?auto_2105477 ) ) ( not ( = ?auto_2105463 ?auto_2105464 ) ) ( not ( = ?auto_2105463 ?auto_2105466 ) ) ( not ( = ?auto_2105463 ?auto_2105465 ) ) ( not ( = ?auto_2105463 ?auto_2105467 ) ) ( not ( = ?auto_2105463 ?auto_2105468 ) ) ( not ( = ?auto_2105463 ?auto_2105469 ) ) ( not ( = ?auto_2105463 ?auto_2105470 ) ) ( not ( = ?auto_2105463 ?auto_2105471 ) ) ( not ( = ?auto_2105463 ?auto_2105472 ) ) ( not ( = ?auto_2105463 ?auto_2105473 ) ) ( not ( = ?auto_2105463 ?auto_2105474 ) ) ( not ( = ?auto_2105463 ?auto_2105475 ) ) ( not ( = ?auto_2105463 ?auto_2105476 ) ) ( not ( = ?auto_2105463 ?auto_2105477 ) ) ( not ( = ?auto_2105464 ?auto_2105466 ) ) ( not ( = ?auto_2105464 ?auto_2105465 ) ) ( not ( = ?auto_2105464 ?auto_2105467 ) ) ( not ( = ?auto_2105464 ?auto_2105468 ) ) ( not ( = ?auto_2105464 ?auto_2105469 ) ) ( not ( = ?auto_2105464 ?auto_2105470 ) ) ( not ( = ?auto_2105464 ?auto_2105471 ) ) ( not ( = ?auto_2105464 ?auto_2105472 ) ) ( not ( = ?auto_2105464 ?auto_2105473 ) ) ( not ( = ?auto_2105464 ?auto_2105474 ) ) ( not ( = ?auto_2105464 ?auto_2105475 ) ) ( not ( = ?auto_2105464 ?auto_2105476 ) ) ( not ( = ?auto_2105464 ?auto_2105477 ) ) ( not ( = ?auto_2105466 ?auto_2105465 ) ) ( not ( = ?auto_2105466 ?auto_2105467 ) ) ( not ( = ?auto_2105466 ?auto_2105468 ) ) ( not ( = ?auto_2105466 ?auto_2105469 ) ) ( not ( = ?auto_2105466 ?auto_2105470 ) ) ( not ( = ?auto_2105466 ?auto_2105471 ) ) ( not ( = ?auto_2105466 ?auto_2105472 ) ) ( not ( = ?auto_2105466 ?auto_2105473 ) ) ( not ( = ?auto_2105466 ?auto_2105474 ) ) ( not ( = ?auto_2105466 ?auto_2105475 ) ) ( not ( = ?auto_2105466 ?auto_2105476 ) ) ( not ( = ?auto_2105466 ?auto_2105477 ) ) ( not ( = ?auto_2105465 ?auto_2105467 ) ) ( not ( = ?auto_2105465 ?auto_2105468 ) ) ( not ( = ?auto_2105465 ?auto_2105469 ) ) ( not ( = ?auto_2105465 ?auto_2105470 ) ) ( not ( = ?auto_2105465 ?auto_2105471 ) ) ( not ( = ?auto_2105465 ?auto_2105472 ) ) ( not ( = ?auto_2105465 ?auto_2105473 ) ) ( not ( = ?auto_2105465 ?auto_2105474 ) ) ( not ( = ?auto_2105465 ?auto_2105475 ) ) ( not ( = ?auto_2105465 ?auto_2105476 ) ) ( not ( = ?auto_2105465 ?auto_2105477 ) ) ( not ( = ?auto_2105467 ?auto_2105468 ) ) ( not ( = ?auto_2105467 ?auto_2105469 ) ) ( not ( = ?auto_2105467 ?auto_2105470 ) ) ( not ( = ?auto_2105467 ?auto_2105471 ) ) ( not ( = ?auto_2105467 ?auto_2105472 ) ) ( not ( = ?auto_2105467 ?auto_2105473 ) ) ( not ( = ?auto_2105467 ?auto_2105474 ) ) ( not ( = ?auto_2105467 ?auto_2105475 ) ) ( not ( = ?auto_2105467 ?auto_2105476 ) ) ( not ( = ?auto_2105467 ?auto_2105477 ) ) ( not ( = ?auto_2105468 ?auto_2105469 ) ) ( not ( = ?auto_2105468 ?auto_2105470 ) ) ( not ( = ?auto_2105468 ?auto_2105471 ) ) ( not ( = ?auto_2105468 ?auto_2105472 ) ) ( not ( = ?auto_2105468 ?auto_2105473 ) ) ( not ( = ?auto_2105468 ?auto_2105474 ) ) ( not ( = ?auto_2105468 ?auto_2105475 ) ) ( not ( = ?auto_2105468 ?auto_2105476 ) ) ( not ( = ?auto_2105468 ?auto_2105477 ) ) ( not ( = ?auto_2105469 ?auto_2105470 ) ) ( not ( = ?auto_2105469 ?auto_2105471 ) ) ( not ( = ?auto_2105469 ?auto_2105472 ) ) ( not ( = ?auto_2105469 ?auto_2105473 ) ) ( not ( = ?auto_2105469 ?auto_2105474 ) ) ( not ( = ?auto_2105469 ?auto_2105475 ) ) ( not ( = ?auto_2105469 ?auto_2105476 ) ) ( not ( = ?auto_2105469 ?auto_2105477 ) ) ( not ( = ?auto_2105470 ?auto_2105471 ) ) ( not ( = ?auto_2105470 ?auto_2105472 ) ) ( not ( = ?auto_2105470 ?auto_2105473 ) ) ( not ( = ?auto_2105470 ?auto_2105474 ) ) ( not ( = ?auto_2105470 ?auto_2105475 ) ) ( not ( = ?auto_2105470 ?auto_2105476 ) ) ( not ( = ?auto_2105470 ?auto_2105477 ) ) ( not ( = ?auto_2105471 ?auto_2105472 ) ) ( not ( = ?auto_2105471 ?auto_2105473 ) ) ( not ( = ?auto_2105471 ?auto_2105474 ) ) ( not ( = ?auto_2105471 ?auto_2105475 ) ) ( not ( = ?auto_2105471 ?auto_2105476 ) ) ( not ( = ?auto_2105471 ?auto_2105477 ) ) ( not ( = ?auto_2105472 ?auto_2105473 ) ) ( not ( = ?auto_2105472 ?auto_2105474 ) ) ( not ( = ?auto_2105472 ?auto_2105475 ) ) ( not ( = ?auto_2105472 ?auto_2105476 ) ) ( not ( = ?auto_2105472 ?auto_2105477 ) ) ( not ( = ?auto_2105473 ?auto_2105474 ) ) ( not ( = ?auto_2105473 ?auto_2105475 ) ) ( not ( = ?auto_2105473 ?auto_2105476 ) ) ( not ( = ?auto_2105473 ?auto_2105477 ) ) ( not ( = ?auto_2105474 ?auto_2105475 ) ) ( not ( = ?auto_2105474 ?auto_2105476 ) ) ( not ( = ?auto_2105474 ?auto_2105477 ) ) ( not ( = ?auto_2105475 ?auto_2105476 ) ) ( not ( = ?auto_2105475 ?auto_2105477 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2105476 ?auto_2105477 )
      ( MAKE-15CRATE-VERIFY ?auto_2105462 ?auto_2105463 ?auto_2105464 ?auto_2105466 ?auto_2105465 ?auto_2105467 ?auto_2105468 ?auto_2105469 ?auto_2105470 ?auto_2105471 ?auto_2105472 ?auto_2105473 ?auto_2105474 ?auto_2105475 ?auto_2105476 ?auto_2105477 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2105641 - SURFACE
      ?auto_2105642 - SURFACE
      ?auto_2105643 - SURFACE
      ?auto_2105645 - SURFACE
      ?auto_2105644 - SURFACE
      ?auto_2105646 - SURFACE
      ?auto_2105647 - SURFACE
      ?auto_2105648 - SURFACE
      ?auto_2105649 - SURFACE
      ?auto_2105650 - SURFACE
      ?auto_2105651 - SURFACE
      ?auto_2105652 - SURFACE
      ?auto_2105653 - SURFACE
      ?auto_2105654 - SURFACE
      ?auto_2105655 - SURFACE
      ?auto_2105656 - SURFACE
    )
    :vars
    (
      ?auto_2105658 - HOIST
      ?auto_2105659 - PLACE
      ?auto_2105657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2105658 ?auto_2105659 ) ( SURFACE-AT ?auto_2105655 ?auto_2105659 ) ( CLEAR ?auto_2105655 ) ( IS-CRATE ?auto_2105656 ) ( not ( = ?auto_2105655 ?auto_2105656 ) ) ( TRUCK-AT ?auto_2105657 ?auto_2105659 ) ( AVAILABLE ?auto_2105658 ) ( IN ?auto_2105656 ?auto_2105657 ) ( ON ?auto_2105655 ?auto_2105654 ) ( not ( = ?auto_2105654 ?auto_2105655 ) ) ( not ( = ?auto_2105654 ?auto_2105656 ) ) ( ON ?auto_2105642 ?auto_2105641 ) ( ON ?auto_2105643 ?auto_2105642 ) ( ON ?auto_2105645 ?auto_2105643 ) ( ON ?auto_2105644 ?auto_2105645 ) ( ON ?auto_2105646 ?auto_2105644 ) ( ON ?auto_2105647 ?auto_2105646 ) ( ON ?auto_2105648 ?auto_2105647 ) ( ON ?auto_2105649 ?auto_2105648 ) ( ON ?auto_2105650 ?auto_2105649 ) ( ON ?auto_2105651 ?auto_2105650 ) ( ON ?auto_2105652 ?auto_2105651 ) ( ON ?auto_2105653 ?auto_2105652 ) ( ON ?auto_2105654 ?auto_2105653 ) ( not ( = ?auto_2105641 ?auto_2105642 ) ) ( not ( = ?auto_2105641 ?auto_2105643 ) ) ( not ( = ?auto_2105641 ?auto_2105645 ) ) ( not ( = ?auto_2105641 ?auto_2105644 ) ) ( not ( = ?auto_2105641 ?auto_2105646 ) ) ( not ( = ?auto_2105641 ?auto_2105647 ) ) ( not ( = ?auto_2105641 ?auto_2105648 ) ) ( not ( = ?auto_2105641 ?auto_2105649 ) ) ( not ( = ?auto_2105641 ?auto_2105650 ) ) ( not ( = ?auto_2105641 ?auto_2105651 ) ) ( not ( = ?auto_2105641 ?auto_2105652 ) ) ( not ( = ?auto_2105641 ?auto_2105653 ) ) ( not ( = ?auto_2105641 ?auto_2105654 ) ) ( not ( = ?auto_2105641 ?auto_2105655 ) ) ( not ( = ?auto_2105641 ?auto_2105656 ) ) ( not ( = ?auto_2105642 ?auto_2105643 ) ) ( not ( = ?auto_2105642 ?auto_2105645 ) ) ( not ( = ?auto_2105642 ?auto_2105644 ) ) ( not ( = ?auto_2105642 ?auto_2105646 ) ) ( not ( = ?auto_2105642 ?auto_2105647 ) ) ( not ( = ?auto_2105642 ?auto_2105648 ) ) ( not ( = ?auto_2105642 ?auto_2105649 ) ) ( not ( = ?auto_2105642 ?auto_2105650 ) ) ( not ( = ?auto_2105642 ?auto_2105651 ) ) ( not ( = ?auto_2105642 ?auto_2105652 ) ) ( not ( = ?auto_2105642 ?auto_2105653 ) ) ( not ( = ?auto_2105642 ?auto_2105654 ) ) ( not ( = ?auto_2105642 ?auto_2105655 ) ) ( not ( = ?auto_2105642 ?auto_2105656 ) ) ( not ( = ?auto_2105643 ?auto_2105645 ) ) ( not ( = ?auto_2105643 ?auto_2105644 ) ) ( not ( = ?auto_2105643 ?auto_2105646 ) ) ( not ( = ?auto_2105643 ?auto_2105647 ) ) ( not ( = ?auto_2105643 ?auto_2105648 ) ) ( not ( = ?auto_2105643 ?auto_2105649 ) ) ( not ( = ?auto_2105643 ?auto_2105650 ) ) ( not ( = ?auto_2105643 ?auto_2105651 ) ) ( not ( = ?auto_2105643 ?auto_2105652 ) ) ( not ( = ?auto_2105643 ?auto_2105653 ) ) ( not ( = ?auto_2105643 ?auto_2105654 ) ) ( not ( = ?auto_2105643 ?auto_2105655 ) ) ( not ( = ?auto_2105643 ?auto_2105656 ) ) ( not ( = ?auto_2105645 ?auto_2105644 ) ) ( not ( = ?auto_2105645 ?auto_2105646 ) ) ( not ( = ?auto_2105645 ?auto_2105647 ) ) ( not ( = ?auto_2105645 ?auto_2105648 ) ) ( not ( = ?auto_2105645 ?auto_2105649 ) ) ( not ( = ?auto_2105645 ?auto_2105650 ) ) ( not ( = ?auto_2105645 ?auto_2105651 ) ) ( not ( = ?auto_2105645 ?auto_2105652 ) ) ( not ( = ?auto_2105645 ?auto_2105653 ) ) ( not ( = ?auto_2105645 ?auto_2105654 ) ) ( not ( = ?auto_2105645 ?auto_2105655 ) ) ( not ( = ?auto_2105645 ?auto_2105656 ) ) ( not ( = ?auto_2105644 ?auto_2105646 ) ) ( not ( = ?auto_2105644 ?auto_2105647 ) ) ( not ( = ?auto_2105644 ?auto_2105648 ) ) ( not ( = ?auto_2105644 ?auto_2105649 ) ) ( not ( = ?auto_2105644 ?auto_2105650 ) ) ( not ( = ?auto_2105644 ?auto_2105651 ) ) ( not ( = ?auto_2105644 ?auto_2105652 ) ) ( not ( = ?auto_2105644 ?auto_2105653 ) ) ( not ( = ?auto_2105644 ?auto_2105654 ) ) ( not ( = ?auto_2105644 ?auto_2105655 ) ) ( not ( = ?auto_2105644 ?auto_2105656 ) ) ( not ( = ?auto_2105646 ?auto_2105647 ) ) ( not ( = ?auto_2105646 ?auto_2105648 ) ) ( not ( = ?auto_2105646 ?auto_2105649 ) ) ( not ( = ?auto_2105646 ?auto_2105650 ) ) ( not ( = ?auto_2105646 ?auto_2105651 ) ) ( not ( = ?auto_2105646 ?auto_2105652 ) ) ( not ( = ?auto_2105646 ?auto_2105653 ) ) ( not ( = ?auto_2105646 ?auto_2105654 ) ) ( not ( = ?auto_2105646 ?auto_2105655 ) ) ( not ( = ?auto_2105646 ?auto_2105656 ) ) ( not ( = ?auto_2105647 ?auto_2105648 ) ) ( not ( = ?auto_2105647 ?auto_2105649 ) ) ( not ( = ?auto_2105647 ?auto_2105650 ) ) ( not ( = ?auto_2105647 ?auto_2105651 ) ) ( not ( = ?auto_2105647 ?auto_2105652 ) ) ( not ( = ?auto_2105647 ?auto_2105653 ) ) ( not ( = ?auto_2105647 ?auto_2105654 ) ) ( not ( = ?auto_2105647 ?auto_2105655 ) ) ( not ( = ?auto_2105647 ?auto_2105656 ) ) ( not ( = ?auto_2105648 ?auto_2105649 ) ) ( not ( = ?auto_2105648 ?auto_2105650 ) ) ( not ( = ?auto_2105648 ?auto_2105651 ) ) ( not ( = ?auto_2105648 ?auto_2105652 ) ) ( not ( = ?auto_2105648 ?auto_2105653 ) ) ( not ( = ?auto_2105648 ?auto_2105654 ) ) ( not ( = ?auto_2105648 ?auto_2105655 ) ) ( not ( = ?auto_2105648 ?auto_2105656 ) ) ( not ( = ?auto_2105649 ?auto_2105650 ) ) ( not ( = ?auto_2105649 ?auto_2105651 ) ) ( not ( = ?auto_2105649 ?auto_2105652 ) ) ( not ( = ?auto_2105649 ?auto_2105653 ) ) ( not ( = ?auto_2105649 ?auto_2105654 ) ) ( not ( = ?auto_2105649 ?auto_2105655 ) ) ( not ( = ?auto_2105649 ?auto_2105656 ) ) ( not ( = ?auto_2105650 ?auto_2105651 ) ) ( not ( = ?auto_2105650 ?auto_2105652 ) ) ( not ( = ?auto_2105650 ?auto_2105653 ) ) ( not ( = ?auto_2105650 ?auto_2105654 ) ) ( not ( = ?auto_2105650 ?auto_2105655 ) ) ( not ( = ?auto_2105650 ?auto_2105656 ) ) ( not ( = ?auto_2105651 ?auto_2105652 ) ) ( not ( = ?auto_2105651 ?auto_2105653 ) ) ( not ( = ?auto_2105651 ?auto_2105654 ) ) ( not ( = ?auto_2105651 ?auto_2105655 ) ) ( not ( = ?auto_2105651 ?auto_2105656 ) ) ( not ( = ?auto_2105652 ?auto_2105653 ) ) ( not ( = ?auto_2105652 ?auto_2105654 ) ) ( not ( = ?auto_2105652 ?auto_2105655 ) ) ( not ( = ?auto_2105652 ?auto_2105656 ) ) ( not ( = ?auto_2105653 ?auto_2105654 ) ) ( not ( = ?auto_2105653 ?auto_2105655 ) ) ( not ( = ?auto_2105653 ?auto_2105656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2105654 ?auto_2105655 ?auto_2105656 )
      ( MAKE-15CRATE-VERIFY ?auto_2105641 ?auto_2105642 ?auto_2105643 ?auto_2105645 ?auto_2105644 ?auto_2105646 ?auto_2105647 ?auto_2105648 ?auto_2105649 ?auto_2105650 ?auto_2105651 ?auto_2105652 ?auto_2105653 ?auto_2105654 ?auto_2105655 ?auto_2105656 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2105836 - SURFACE
      ?auto_2105837 - SURFACE
      ?auto_2105838 - SURFACE
      ?auto_2105840 - SURFACE
      ?auto_2105839 - SURFACE
      ?auto_2105841 - SURFACE
      ?auto_2105842 - SURFACE
      ?auto_2105843 - SURFACE
      ?auto_2105844 - SURFACE
      ?auto_2105845 - SURFACE
      ?auto_2105846 - SURFACE
      ?auto_2105847 - SURFACE
      ?auto_2105848 - SURFACE
      ?auto_2105849 - SURFACE
      ?auto_2105850 - SURFACE
      ?auto_2105851 - SURFACE
    )
    :vars
    (
      ?auto_2105853 - HOIST
      ?auto_2105854 - PLACE
      ?auto_2105852 - TRUCK
      ?auto_2105855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2105853 ?auto_2105854 ) ( SURFACE-AT ?auto_2105850 ?auto_2105854 ) ( CLEAR ?auto_2105850 ) ( IS-CRATE ?auto_2105851 ) ( not ( = ?auto_2105850 ?auto_2105851 ) ) ( AVAILABLE ?auto_2105853 ) ( IN ?auto_2105851 ?auto_2105852 ) ( ON ?auto_2105850 ?auto_2105849 ) ( not ( = ?auto_2105849 ?auto_2105850 ) ) ( not ( = ?auto_2105849 ?auto_2105851 ) ) ( TRUCK-AT ?auto_2105852 ?auto_2105855 ) ( not ( = ?auto_2105855 ?auto_2105854 ) ) ( ON ?auto_2105837 ?auto_2105836 ) ( ON ?auto_2105838 ?auto_2105837 ) ( ON ?auto_2105840 ?auto_2105838 ) ( ON ?auto_2105839 ?auto_2105840 ) ( ON ?auto_2105841 ?auto_2105839 ) ( ON ?auto_2105842 ?auto_2105841 ) ( ON ?auto_2105843 ?auto_2105842 ) ( ON ?auto_2105844 ?auto_2105843 ) ( ON ?auto_2105845 ?auto_2105844 ) ( ON ?auto_2105846 ?auto_2105845 ) ( ON ?auto_2105847 ?auto_2105846 ) ( ON ?auto_2105848 ?auto_2105847 ) ( ON ?auto_2105849 ?auto_2105848 ) ( not ( = ?auto_2105836 ?auto_2105837 ) ) ( not ( = ?auto_2105836 ?auto_2105838 ) ) ( not ( = ?auto_2105836 ?auto_2105840 ) ) ( not ( = ?auto_2105836 ?auto_2105839 ) ) ( not ( = ?auto_2105836 ?auto_2105841 ) ) ( not ( = ?auto_2105836 ?auto_2105842 ) ) ( not ( = ?auto_2105836 ?auto_2105843 ) ) ( not ( = ?auto_2105836 ?auto_2105844 ) ) ( not ( = ?auto_2105836 ?auto_2105845 ) ) ( not ( = ?auto_2105836 ?auto_2105846 ) ) ( not ( = ?auto_2105836 ?auto_2105847 ) ) ( not ( = ?auto_2105836 ?auto_2105848 ) ) ( not ( = ?auto_2105836 ?auto_2105849 ) ) ( not ( = ?auto_2105836 ?auto_2105850 ) ) ( not ( = ?auto_2105836 ?auto_2105851 ) ) ( not ( = ?auto_2105837 ?auto_2105838 ) ) ( not ( = ?auto_2105837 ?auto_2105840 ) ) ( not ( = ?auto_2105837 ?auto_2105839 ) ) ( not ( = ?auto_2105837 ?auto_2105841 ) ) ( not ( = ?auto_2105837 ?auto_2105842 ) ) ( not ( = ?auto_2105837 ?auto_2105843 ) ) ( not ( = ?auto_2105837 ?auto_2105844 ) ) ( not ( = ?auto_2105837 ?auto_2105845 ) ) ( not ( = ?auto_2105837 ?auto_2105846 ) ) ( not ( = ?auto_2105837 ?auto_2105847 ) ) ( not ( = ?auto_2105837 ?auto_2105848 ) ) ( not ( = ?auto_2105837 ?auto_2105849 ) ) ( not ( = ?auto_2105837 ?auto_2105850 ) ) ( not ( = ?auto_2105837 ?auto_2105851 ) ) ( not ( = ?auto_2105838 ?auto_2105840 ) ) ( not ( = ?auto_2105838 ?auto_2105839 ) ) ( not ( = ?auto_2105838 ?auto_2105841 ) ) ( not ( = ?auto_2105838 ?auto_2105842 ) ) ( not ( = ?auto_2105838 ?auto_2105843 ) ) ( not ( = ?auto_2105838 ?auto_2105844 ) ) ( not ( = ?auto_2105838 ?auto_2105845 ) ) ( not ( = ?auto_2105838 ?auto_2105846 ) ) ( not ( = ?auto_2105838 ?auto_2105847 ) ) ( not ( = ?auto_2105838 ?auto_2105848 ) ) ( not ( = ?auto_2105838 ?auto_2105849 ) ) ( not ( = ?auto_2105838 ?auto_2105850 ) ) ( not ( = ?auto_2105838 ?auto_2105851 ) ) ( not ( = ?auto_2105840 ?auto_2105839 ) ) ( not ( = ?auto_2105840 ?auto_2105841 ) ) ( not ( = ?auto_2105840 ?auto_2105842 ) ) ( not ( = ?auto_2105840 ?auto_2105843 ) ) ( not ( = ?auto_2105840 ?auto_2105844 ) ) ( not ( = ?auto_2105840 ?auto_2105845 ) ) ( not ( = ?auto_2105840 ?auto_2105846 ) ) ( not ( = ?auto_2105840 ?auto_2105847 ) ) ( not ( = ?auto_2105840 ?auto_2105848 ) ) ( not ( = ?auto_2105840 ?auto_2105849 ) ) ( not ( = ?auto_2105840 ?auto_2105850 ) ) ( not ( = ?auto_2105840 ?auto_2105851 ) ) ( not ( = ?auto_2105839 ?auto_2105841 ) ) ( not ( = ?auto_2105839 ?auto_2105842 ) ) ( not ( = ?auto_2105839 ?auto_2105843 ) ) ( not ( = ?auto_2105839 ?auto_2105844 ) ) ( not ( = ?auto_2105839 ?auto_2105845 ) ) ( not ( = ?auto_2105839 ?auto_2105846 ) ) ( not ( = ?auto_2105839 ?auto_2105847 ) ) ( not ( = ?auto_2105839 ?auto_2105848 ) ) ( not ( = ?auto_2105839 ?auto_2105849 ) ) ( not ( = ?auto_2105839 ?auto_2105850 ) ) ( not ( = ?auto_2105839 ?auto_2105851 ) ) ( not ( = ?auto_2105841 ?auto_2105842 ) ) ( not ( = ?auto_2105841 ?auto_2105843 ) ) ( not ( = ?auto_2105841 ?auto_2105844 ) ) ( not ( = ?auto_2105841 ?auto_2105845 ) ) ( not ( = ?auto_2105841 ?auto_2105846 ) ) ( not ( = ?auto_2105841 ?auto_2105847 ) ) ( not ( = ?auto_2105841 ?auto_2105848 ) ) ( not ( = ?auto_2105841 ?auto_2105849 ) ) ( not ( = ?auto_2105841 ?auto_2105850 ) ) ( not ( = ?auto_2105841 ?auto_2105851 ) ) ( not ( = ?auto_2105842 ?auto_2105843 ) ) ( not ( = ?auto_2105842 ?auto_2105844 ) ) ( not ( = ?auto_2105842 ?auto_2105845 ) ) ( not ( = ?auto_2105842 ?auto_2105846 ) ) ( not ( = ?auto_2105842 ?auto_2105847 ) ) ( not ( = ?auto_2105842 ?auto_2105848 ) ) ( not ( = ?auto_2105842 ?auto_2105849 ) ) ( not ( = ?auto_2105842 ?auto_2105850 ) ) ( not ( = ?auto_2105842 ?auto_2105851 ) ) ( not ( = ?auto_2105843 ?auto_2105844 ) ) ( not ( = ?auto_2105843 ?auto_2105845 ) ) ( not ( = ?auto_2105843 ?auto_2105846 ) ) ( not ( = ?auto_2105843 ?auto_2105847 ) ) ( not ( = ?auto_2105843 ?auto_2105848 ) ) ( not ( = ?auto_2105843 ?auto_2105849 ) ) ( not ( = ?auto_2105843 ?auto_2105850 ) ) ( not ( = ?auto_2105843 ?auto_2105851 ) ) ( not ( = ?auto_2105844 ?auto_2105845 ) ) ( not ( = ?auto_2105844 ?auto_2105846 ) ) ( not ( = ?auto_2105844 ?auto_2105847 ) ) ( not ( = ?auto_2105844 ?auto_2105848 ) ) ( not ( = ?auto_2105844 ?auto_2105849 ) ) ( not ( = ?auto_2105844 ?auto_2105850 ) ) ( not ( = ?auto_2105844 ?auto_2105851 ) ) ( not ( = ?auto_2105845 ?auto_2105846 ) ) ( not ( = ?auto_2105845 ?auto_2105847 ) ) ( not ( = ?auto_2105845 ?auto_2105848 ) ) ( not ( = ?auto_2105845 ?auto_2105849 ) ) ( not ( = ?auto_2105845 ?auto_2105850 ) ) ( not ( = ?auto_2105845 ?auto_2105851 ) ) ( not ( = ?auto_2105846 ?auto_2105847 ) ) ( not ( = ?auto_2105846 ?auto_2105848 ) ) ( not ( = ?auto_2105846 ?auto_2105849 ) ) ( not ( = ?auto_2105846 ?auto_2105850 ) ) ( not ( = ?auto_2105846 ?auto_2105851 ) ) ( not ( = ?auto_2105847 ?auto_2105848 ) ) ( not ( = ?auto_2105847 ?auto_2105849 ) ) ( not ( = ?auto_2105847 ?auto_2105850 ) ) ( not ( = ?auto_2105847 ?auto_2105851 ) ) ( not ( = ?auto_2105848 ?auto_2105849 ) ) ( not ( = ?auto_2105848 ?auto_2105850 ) ) ( not ( = ?auto_2105848 ?auto_2105851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2105849 ?auto_2105850 ?auto_2105851 )
      ( MAKE-15CRATE-VERIFY ?auto_2105836 ?auto_2105837 ?auto_2105838 ?auto_2105840 ?auto_2105839 ?auto_2105841 ?auto_2105842 ?auto_2105843 ?auto_2105844 ?auto_2105845 ?auto_2105846 ?auto_2105847 ?auto_2105848 ?auto_2105849 ?auto_2105850 ?auto_2105851 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106046 - SURFACE
      ?auto_2106047 - SURFACE
      ?auto_2106048 - SURFACE
      ?auto_2106050 - SURFACE
      ?auto_2106049 - SURFACE
      ?auto_2106051 - SURFACE
      ?auto_2106052 - SURFACE
      ?auto_2106053 - SURFACE
      ?auto_2106054 - SURFACE
      ?auto_2106055 - SURFACE
      ?auto_2106056 - SURFACE
      ?auto_2106057 - SURFACE
      ?auto_2106058 - SURFACE
      ?auto_2106059 - SURFACE
      ?auto_2106060 - SURFACE
      ?auto_2106061 - SURFACE
    )
    :vars
    (
      ?auto_2106064 - HOIST
      ?auto_2106066 - PLACE
      ?auto_2106062 - TRUCK
      ?auto_2106065 - PLACE
      ?auto_2106063 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106064 ?auto_2106066 ) ( SURFACE-AT ?auto_2106060 ?auto_2106066 ) ( CLEAR ?auto_2106060 ) ( IS-CRATE ?auto_2106061 ) ( not ( = ?auto_2106060 ?auto_2106061 ) ) ( AVAILABLE ?auto_2106064 ) ( ON ?auto_2106060 ?auto_2106059 ) ( not ( = ?auto_2106059 ?auto_2106060 ) ) ( not ( = ?auto_2106059 ?auto_2106061 ) ) ( TRUCK-AT ?auto_2106062 ?auto_2106065 ) ( not ( = ?auto_2106065 ?auto_2106066 ) ) ( HOIST-AT ?auto_2106063 ?auto_2106065 ) ( LIFTING ?auto_2106063 ?auto_2106061 ) ( not ( = ?auto_2106064 ?auto_2106063 ) ) ( ON ?auto_2106047 ?auto_2106046 ) ( ON ?auto_2106048 ?auto_2106047 ) ( ON ?auto_2106050 ?auto_2106048 ) ( ON ?auto_2106049 ?auto_2106050 ) ( ON ?auto_2106051 ?auto_2106049 ) ( ON ?auto_2106052 ?auto_2106051 ) ( ON ?auto_2106053 ?auto_2106052 ) ( ON ?auto_2106054 ?auto_2106053 ) ( ON ?auto_2106055 ?auto_2106054 ) ( ON ?auto_2106056 ?auto_2106055 ) ( ON ?auto_2106057 ?auto_2106056 ) ( ON ?auto_2106058 ?auto_2106057 ) ( ON ?auto_2106059 ?auto_2106058 ) ( not ( = ?auto_2106046 ?auto_2106047 ) ) ( not ( = ?auto_2106046 ?auto_2106048 ) ) ( not ( = ?auto_2106046 ?auto_2106050 ) ) ( not ( = ?auto_2106046 ?auto_2106049 ) ) ( not ( = ?auto_2106046 ?auto_2106051 ) ) ( not ( = ?auto_2106046 ?auto_2106052 ) ) ( not ( = ?auto_2106046 ?auto_2106053 ) ) ( not ( = ?auto_2106046 ?auto_2106054 ) ) ( not ( = ?auto_2106046 ?auto_2106055 ) ) ( not ( = ?auto_2106046 ?auto_2106056 ) ) ( not ( = ?auto_2106046 ?auto_2106057 ) ) ( not ( = ?auto_2106046 ?auto_2106058 ) ) ( not ( = ?auto_2106046 ?auto_2106059 ) ) ( not ( = ?auto_2106046 ?auto_2106060 ) ) ( not ( = ?auto_2106046 ?auto_2106061 ) ) ( not ( = ?auto_2106047 ?auto_2106048 ) ) ( not ( = ?auto_2106047 ?auto_2106050 ) ) ( not ( = ?auto_2106047 ?auto_2106049 ) ) ( not ( = ?auto_2106047 ?auto_2106051 ) ) ( not ( = ?auto_2106047 ?auto_2106052 ) ) ( not ( = ?auto_2106047 ?auto_2106053 ) ) ( not ( = ?auto_2106047 ?auto_2106054 ) ) ( not ( = ?auto_2106047 ?auto_2106055 ) ) ( not ( = ?auto_2106047 ?auto_2106056 ) ) ( not ( = ?auto_2106047 ?auto_2106057 ) ) ( not ( = ?auto_2106047 ?auto_2106058 ) ) ( not ( = ?auto_2106047 ?auto_2106059 ) ) ( not ( = ?auto_2106047 ?auto_2106060 ) ) ( not ( = ?auto_2106047 ?auto_2106061 ) ) ( not ( = ?auto_2106048 ?auto_2106050 ) ) ( not ( = ?auto_2106048 ?auto_2106049 ) ) ( not ( = ?auto_2106048 ?auto_2106051 ) ) ( not ( = ?auto_2106048 ?auto_2106052 ) ) ( not ( = ?auto_2106048 ?auto_2106053 ) ) ( not ( = ?auto_2106048 ?auto_2106054 ) ) ( not ( = ?auto_2106048 ?auto_2106055 ) ) ( not ( = ?auto_2106048 ?auto_2106056 ) ) ( not ( = ?auto_2106048 ?auto_2106057 ) ) ( not ( = ?auto_2106048 ?auto_2106058 ) ) ( not ( = ?auto_2106048 ?auto_2106059 ) ) ( not ( = ?auto_2106048 ?auto_2106060 ) ) ( not ( = ?auto_2106048 ?auto_2106061 ) ) ( not ( = ?auto_2106050 ?auto_2106049 ) ) ( not ( = ?auto_2106050 ?auto_2106051 ) ) ( not ( = ?auto_2106050 ?auto_2106052 ) ) ( not ( = ?auto_2106050 ?auto_2106053 ) ) ( not ( = ?auto_2106050 ?auto_2106054 ) ) ( not ( = ?auto_2106050 ?auto_2106055 ) ) ( not ( = ?auto_2106050 ?auto_2106056 ) ) ( not ( = ?auto_2106050 ?auto_2106057 ) ) ( not ( = ?auto_2106050 ?auto_2106058 ) ) ( not ( = ?auto_2106050 ?auto_2106059 ) ) ( not ( = ?auto_2106050 ?auto_2106060 ) ) ( not ( = ?auto_2106050 ?auto_2106061 ) ) ( not ( = ?auto_2106049 ?auto_2106051 ) ) ( not ( = ?auto_2106049 ?auto_2106052 ) ) ( not ( = ?auto_2106049 ?auto_2106053 ) ) ( not ( = ?auto_2106049 ?auto_2106054 ) ) ( not ( = ?auto_2106049 ?auto_2106055 ) ) ( not ( = ?auto_2106049 ?auto_2106056 ) ) ( not ( = ?auto_2106049 ?auto_2106057 ) ) ( not ( = ?auto_2106049 ?auto_2106058 ) ) ( not ( = ?auto_2106049 ?auto_2106059 ) ) ( not ( = ?auto_2106049 ?auto_2106060 ) ) ( not ( = ?auto_2106049 ?auto_2106061 ) ) ( not ( = ?auto_2106051 ?auto_2106052 ) ) ( not ( = ?auto_2106051 ?auto_2106053 ) ) ( not ( = ?auto_2106051 ?auto_2106054 ) ) ( not ( = ?auto_2106051 ?auto_2106055 ) ) ( not ( = ?auto_2106051 ?auto_2106056 ) ) ( not ( = ?auto_2106051 ?auto_2106057 ) ) ( not ( = ?auto_2106051 ?auto_2106058 ) ) ( not ( = ?auto_2106051 ?auto_2106059 ) ) ( not ( = ?auto_2106051 ?auto_2106060 ) ) ( not ( = ?auto_2106051 ?auto_2106061 ) ) ( not ( = ?auto_2106052 ?auto_2106053 ) ) ( not ( = ?auto_2106052 ?auto_2106054 ) ) ( not ( = ?auto_2106052 ?auto_2106055 ) ) ( not ( = ?auto_2106052 ?auto_2106056 ) ) ( not ( = ?auto_2106052 ?auto_2106057 ) ) ( not ( = ?auto_2106052 ?auto_2106058 ) ) ( not ( = ?auto_2106052 ?auto_2106059 ) ) ( not ( = ?auto_2106052 ?auto_2106060 ) ) ( not ( = ?auto_2106052 ?auto_2106061 ) ) ( not ( = ?auto_2106053 ?auto_2106054 ) ) ( not ( = ?auto_2106053 ?auto_2106055 ) ) ( not ( = ?auto_2106053 ?auto_2106056 ) ) ( not ( = ?auto_2106053 ?auto_2106057 ) ) ( not ( = ?auto_2106053 ?auto_2106058 ) ) ( not ( = ?auto_2106053 ?auto_2106059 ) ) ( not ( = ?auto_2106053 ?auto_2106060 ) ) ( not ( = ?auto_2106053 ?auto_2106061 ) ) ( not ( = ?auto_2106054 ?auto_2106055 ) ) ( not ( = ?auto_2106054 ?auto_2106056 ) ) ( not ( = ?auto_2106054 ?auto_2106057 ) ) ( not ( = ?auto_2106054 ?auto_2106058 ) ) ( not ( = ?auto_2106054 ?auto_2106059 ) ) ( not ( = ?auto_2106054 ?auto_2106060 ) ) ( not ( = ?auto_2106054 ?auto_2106061 ) ) ( not ( = ?auto_2106055 ?auto_2106056 ) ) ( not ( = ?auto_2106055 ?auto_2106057 ) ) ( not ( = ?auto_2106055 ?auto_2106058 ) ) ( not ( = ?auto_2106055 ?auto_2106059 ) ) ( not ( = ?auto_2106055 ?auto_2106060 ) ) ( not ( = ?auto_2106055 ?auto_2106061 ) ) ( not ( = ?auto_2106056 ?auto_2106057 ) ) ( not ( = ?auto_2106056 ?auto_2106058 ) ) ( not ( = ?auto_2106056 ?auto_2106059 ) ) ( not ( = ?auto_2106056 ?auto_2106060 ) ) ( not ( = ?auto_2106056 ?auto_2106061 ) ) ( not ( = ?auto_2106057 ?auto_2106058 ) ) ( not ( = ?auto_2106057 ?auto_2106059 ) ) ( not ( = ?auto_2106057 ?auto_2106060 ) ) ( not ( = ?auto_2106057 ?auto_2106061 ) ) ( not ( = ?auto_2106058 ?auto_2106059 ) ) ( not ( = ?auto_2106058 ?auto_2106060 ) ) ( not ( = ?auto_2106058 ?auto_2106061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106059 ?auto_2106060 ?auto_2106061 )
      ( MAKE-15CRATE-VERIFY ?auto_2106046 ?auto_2106047 ?auto_2106048 ?auto_2106050 ?auto_2106049 ?auto_2106051 ?auto_2106052 ?auto_2106053 ?auto_2106054 ?auto_2106055 ?auto_2106056 ?auto_2106057 ?auto_2106058 ?auto_2106059 ?auto_2106060 ?auto_2106061 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106271 - SURFACE
      ?auto_2106272 - SURFACE
      ?auto_2106273 - SURFACE
      ?auto_2106275 - SURFACE
      ?auto_2106274 - SURFACE
      ?auto_2106276 - SURFACE
      ?auto_2106277 - SURFACE
      ?auto_2106278 - SURFACE
      ?auto_2106279 - SURFACE
      ?auto_2106280 - SURFACE
      ?auto_2106281 - SURFACE
      ?auto_2106282 - SURFACE
      ?auto_2106283 - SURFACE
      ?auto_2106284 - SURFACE
      ?auto_2106285 - SURFACE
      ?auto_2106286 - SURFACE
    )
    :vars
    (
      ?auto_2106289 - HOIST
      ?auto_2106288 - PLACE
      ?auto_2106291 - TRUCK
      ?auto_2106292 - PLACE
      ?auto_2106287 - HOIST
      ?auto_2106290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106289 ?auto_2106288 ) ( SURFACE-AT ?auto_2106285 ?auto_2106288 ) ( CLEAR ?auto_2106285 ) ( IS-CRATE ?auto_2106286 ) ( not ( = ?auto_2106285 ?auto_2106286 ) ) ( AVAILABLE ?auto_2106289 ) ( ON ?auto_2106285 ?auto_2106284 ) ( not ( = ?auto_2106284 ?auto_2106285 ) ) ( not ( = ?auto_2106284 ?auto_2106286 ) ) ( TRUCK-AT ?auto_2106291 ?auto_2106292 ) ( not ( = ?auto_2106292 ?auto_2106288 ) ) ( HOIST-AT ?auto_2106287 ?auto_2106292 ) ( not ( = ?auto_2106289 ?auto_2106287 ) ) ( AVAILABLE ?auto_2106287 ) ( SURFACE-AT ?auto_2106286 ?auto_2106292 ) ( ON ?auto_2106286 ?auto_2106290 ) ( CLEAR ?auto_2106286 ) ( not ( = ?auto_2106285 ?auto_2106290 ) ) ( not ( = ?auto_2106286 ?auto_2106290 ) ) ( not ( = ?auto_2106284 ?auto_2106290 ) ) ( ON ?auto_2106272 ?auto_2106271 ) ( ON ?auto_2106273 ?auto_2106272 ) ( ON ?auto_2106275 ?auto_2106273 ) ( ON ?auto_2106274 ?auto_2106275 ) ( ON ?auto_2106276 ?auto_2106274 ) ( ON ?auto_2106277 ?auto_2106276 ) ( ON ?auto_2106278 ?auto_2106277 ) ( ON ?auto_2106279 ?auto_2106278 ) ( ON ?auto_2106280 ?auto_2106279 ) ( ON ?auto_2106281 ?auto_2106280 ) ( ON ?auto_2106282 ?auto_2106281 ) ( ON ?auto_2106283 ?auto_2106282 ) ( ON ?auto_2106284 ?auto_2106283 ) ( not ( = ?auto_2106271 ?auto_2106272 ) ) ( not ( = ?auto_2106271 ?auto_2106273 ) ) ( not ( = ?auto_2106271 ?auto_2106275 ) ) ( not ( = ?auto_2106271 ?auto_2106274 ) ) ( not ( = ?auto_2106271 ?auto_2106276 ) ) ( not ( = ?auto_2106271 ?auto_2106277 ) ) ( not ( = ?auto_2106271 ?auto_2106278 ) ) ( not ( = ?auto_2106271 ?auto_2106279 ) ) ( not ( = ?auto_2106271 ?auto_2106280 ) ) ( not ( = ?auto_2106271 ?auto_2106281 ) ) ( not ( = ?auto_2106271 ?auto_2106282 ) ) ( not ( = ?auto_2106271 ?auto_2106283 ) ) ( not ( = ?auto_2106271 ?auto_2106284 ) ) ( not ( = ?auto_2106271 ?auto_2106285 ) ) ( not ( = ?auto_2106271 ?auto_2106286 ) ) ( not ( = ?auto_2106271 ?auto_2106290 ) ) ( not ( = ?auto_2106272 ?auto_2106273 ) ) ( not ( = ?auto_2106272 ?auto_2106275 ) ) ( not ( = ?auto_2106272 ?auto_2106274 ) ) ( not ( = ?auto_2106272 ?auto_2106276 ) ) ( not ( = ?auto_2106272 ?auto_2106277 ) ) ( not ( = ?auto_2106272 ?auto_2106278 ) ) ( not ( = ?auto_2106272 ?auto_2106279 ) ) ( not ( = ?auto_2106272 ?auto_2106280 ) ) ( not ( = ?auto_2106272 ?auto_2106281 ) ) ( not ( = ?auto_2106272 ?auto_2106282 ) ) ( not ( = ?auto_2106272 ?auto_2106283 ) ) ( not ( = ?auto_2106272 ?auto_2106284 ) ) ( not ( = ?auto_2106272 ?auto_2106285 ) ) ( not ( = ?auto_2106272 ?auto_2106286 ) ) ( not ( = ?auto_2106272 ?auto_2106290 ) ) ( not ( = ?auto_2106273 ?auto_2106275 ) ) ( not ( = ?auto_2106273 ?auto_2106274 ) ) ( not ( = ?auto_2106273 ?auto_2106276 ) ) ( not ( = ?auto_2106273 ?auto_2106277 ) ) ( not ( = ?auto_2106273 ?auto_2106278 ) ) ( not ( = ?auto_2106273 ?auto_2106279 ) ) ( not ( = ?auto_2106273 ?auto_2106280 ) ) ( not ( = ?auto_2106273 ?auto_2106281 ) ) ( not ( = ?auto_2106273 ?auto_2106282 ) ) ( not ( = ?auto_2106273 ?auto_2106283 ) ) ( not ( = ?auto_2106273 ?auto_2106284 ) ) ( not ( = ?auto_2106273 ?auto_2106285 ) ) ( not ( = ?auto_2106273 ?auto_2106286 ) ) ( not ( = ?auto_2106273 ?auto_2106290 ) ) ( not ( = ?auto_2106275 ?auto_2106274 ) ) ( not ( = ?auto_2106275 ?auto_2106276 ) ) ( not ( = ?auto_2106275 ?auto_2106277 ) ) ( not ( = ?auto_2106275 ?auto_2106278 ) ) ( not ( = ?auto_2106275 ?auto_2106279 ) ) ( not ( = ?auto_2106275 ?auto_2106280 ) ) ( not ( = ?auto_2106275 ?auto_2106281 ) ) ( not ( = ?auto_2106275 ?auto_2106282 ) ) ( not ( = ?auto_2106275 ?auto_2106283 ) ) ( not ( = ?auto_2106275 ?auto_2106284 ) ) ( not ( = ?auto_2106275 ?auto_2106285 ) ) ( not ( = ?auto_2106275 ?auto_2106286 ) ) ( not ( = ?auto_2106275 ?auto_2106290 ) ) ( not ( = ?auto_2106274 ?auto_2106276 ) ) ( not ( = ?auto_2106274 ?auto_2106277 ) ) ( not ( = ?auto_2106274 ?auto_2106278 ) ) ( not ( = ?auto_2106274 ?auto_2106279 ) ) ( not ( = ?auto_2106274 ?auto_2106280 ) ) ( not ( = ?auto_2106274 ?auto_2106281 ) ) ( not ( = ?auto_2106274 ?auto_2106282 ) ) ( not ( = ?auto_2106274 ?auto_2106283 ) ) ( not ( = ?auto_2106274 ?auto_2106284 ) ) ( not ( = ?auto_2106274 ?auto_2106285 ) ) ( not ( = ?auto_2106274 ?auto_2106286 ) ) ( not ( = ?auto_2106274 ?auto_2106290 ) ) ( not ( = ?auto_2106276 ?auto_2106277 ) ) ( not ( = ?auto_2106276 ?auto_2106278 ) ) ( not ( = ?auto_2106276 ?auto_2106279 ) ) ( not ( = ?auto_2106276 ?auto_2106280 ) ) ( not ( = ?auto_2106276 ?auto_2106281 ) ) ( not ( = ?auto_2106276 ?auto_2106282 ) ) ( not ( = ?auto_2106276 ?auto_2106283 ) ) ( not ( = ?auto_2106276 ?auto_2106284 ) ) ( not ( = ?auto_2106276 ?auto_2106285 ) ) ( not ( = ?auto_2106276 ?auto_2106286 ) ) ( not ( = ?auto_2106276 ?auto_2106290 ) ) ( not ( = ?auto_2106277 ?auto_2106278 ) ) ( not ( = ?auto_2106277 ?auto_2106279 ) ) ( not ( = ?auto_2106277 ?auto_2106280 ) ) ( not ( = ?auto_2106277 ?auto_2106281 ) ) ( not ( = ?auto_2106277 ?auto_2106282 ) ) ( not ( = ?auto_2106277 ?auto_2106283 ) ) ( not ( = ?auto_2106277 ?auto_2106284 ) ) ( not ( = ?auto_2106277 ?auto_2106285 ) ) ( not ( = ?auto_2106277 ?auto_2106286 ) ) ( not ( = ?auto_2106277 ?auto_2106290 ) ) ( not ( = ?auto_2106278 ?auto_2106279 ) ) ( not ( = ?auto_2106278 ?auto_2106280 ) ) ( not ( = ?auto_2106278 ?auto_2106281 ) ) ( not ( = ?auto_2106278 ?auto_2106282 ) ) ( not ( = ?auto_2106278 ?auto_2106283 ) ) ( not ( = ?auto_2106278 ?auto_2106284 ) ) ( not ( = ?auto_2106278 ?auto_2106285 ) ) ( not ( = ?auto_2106278 ?auto_2106286 ) ) ( not ( = ?auto_2106278 ?auto_2106290 ) ) ( not ( = ?auto_2106279 ?auto_2106280 ) ) ( not ( = ?auto_2106279 ?auto_2106281 ) ) ( not ( = ?auto_2106279 ?auto_2106282 ) ) ( not ( = ?auto_2106279 ?auto_2106283 ) ) ( not ( = ?auto_2106279 ?auto_2106284 ) ) ( not ( = ?auto_2106279 ?auto_2106285 ) ) ( not ( = ?auto_2106279 ?auto_2106286 ) ) ( not ( = ?auto_2106279 ?auto_2106290 ) ) ( not ( = ?auto_2106280 ?auto_2106281 ) ) ( not ( = ?auto_2106280 ?auto_2106282 ) ) ( not ( = ?auto_2106280 ?auto_2106283 ) ) ( not ( = ?auto_2106280 ?auto_2106284 ) ) ( not ( = ?auto_2106280 ?auto_2106285 ) ) ( not ( = ?auto_2106280 ?auto_2106286 ) ) ( not ( = ?auto_2106280 ?auto_2106290 ) ) ( not ( = ?auto_2106281 ?auto_2106282 ) ) ( not ( = ?auto_2106281 ?auto_2106283 ) ) ( not ( = ?auto_2106281 ?auto_2106284 ) ) ( not ( = ?auto_2106281 ?auto_2106285 ) ) ( not ( = ?auto_2106281 ?auto_2106286 ) ) ( not ( = ?auto_2106281 ?auto_2106290 ) ) ( not ( = ?auto_2106282 ?auto_2106283 ) ) ( not ( = ?auto_2106282 ?auto_2106284 ) ) ( not ( = ?auto_2106282 ?auto_2106285 ) ) ( not ( = ?auto_2106282 ?auto_2106286 ) ) ( not ( = ?auto_2106282 ?auto_2106290 ) ) ( not ( = ?auto_2106283 ?auto_2106284 ) ) ( not ( = ?auto_2106283 ?auto_2106285 ) ) ( not ( = ?auto_2106283 ?auto_2106286 ) ) ( not ( = ?auto_2106283 ?auto_2106290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106284 ?auto_2106285 ?auto_2106286 )
      ( MAKE-15CRATE-VERIFY ?auto_2106271 ?auto_2106272 ?auto_2106273 ?auto_2106275 ?auto_2106274 ?auto_2106276 ?auto_2106277 ?auto_2106278 ?auto_2106279 ?auto_2106280 ?auto_2106281 ?auto_2106282 ?auto_2106283 ?auto_2106284 ?auto_2106285 ?auto_2106286 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106497 - SURFACE
      ?auto_2106498 - SURFACE
      ?auto_2106499 - SURFACE
      ?auto_2106501 - SURFACE
      ?auto_2106500 - SURFACE
      ?auto_2106502 - SURFACE
      ?auto_2106503 - SURFACE
      ?auto_2106504 - SURFACE
      ?auto_2106505 - SURFACE
      ?auto_2106506 - SURFACE
      ?auto_2106507 - SURFACE
      ?auto_2106508 - SURFACE
      ?auto_2106509 - SURFACE
      ?auto_2106510 - SURFACE
      ?auto_2106511 - SURFACE
      ?auto_2106512 - SURFACE
    )
    :vars
    (
      ?auto_2106514 - HOIST
      ?auto_2106515 - PLACE
      ?auto_2106518 - PLACE
      ?auto_2106516 - HOIST
      ?auto_2106513 - SURFACE
      ?auto_2106517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106514 ?auto_2106515 ) ( SURFACE-AT ?auto_2106511 ?auto_2106515 ) ( CLEAR ?auto_2106511 ) ( IS-CRATE ?auto_2106512 ) ( not ( = ?auto_2106511 ?auto_2106512 ) ) ( AVAILABLE ?auto_2106514 ) ( ON ?auto_2106511 ?auto_2106510 ) ( not ( = ?auto_2106510 ?auto_2106511 ) ) ( not ( = ?auto_2106510 ?auto_2106512 ) ) ( not ( = ?auto_2106518 ?auto_2106515 ) ) ( HOIST-AT ?auto_2106516 ?auto_2106518 ) ( not ( = ?auto_2106514 ?auto_2106516 ) ) ( AVAILABLE ?auto_2106516 ) ( SURFACE-AT ?auto_2106512 ?auto_2106518 ) ( ON ?auto_2106512 ?auto_2106513 ) ( CLEAR ?auto_2106512 ) ( not ( = ?auto_2106511 ?auto_2106513 ) ) ( not ( = ?auto_2106512 ?auto_2106513 ) ) ( not ( = ?auto_2106510 ?auto_2106513 ) ) ( TRUCK-AT ?auto_2106517 ?auto_2106515 ) ( ON ?auto_2106498 ?auto_2106497 ) ( ON ?auto_2106499 ?auto_2106498 ) ( ON ?auto_2106501 ?auto_2106499 ) ( ON ?auto_2106500 ?auto_2106501 ) ( ON ?auto_2106502 ?auto_2106500 ) ( ON ?auto_2106503 ?auto_2106502 ) ( ON ?auto_2106504 ?auto_2106503 ) ( ON ?auto_2106505 ?auto_2106504 ) ( ON ?auto_2106506 ?auto_2106505 ) ( ON ?auto_2106507 ?auto_2106506 ) ( ON ?auto_2106508 ?auto_2106507 ) ( ON ?auto_2106509 ?auto_2106508 ) ( ON ?auto_2106510 ?auto_2106509 ) ( not ( = ?auto_2106497 ?auto_2106498 ) ) ( not ( = ?auto_2106497 ?auto_2106499 ) ) ( not ( = ?auto_2106497 ?auto_2106501 ) ) ( not ( = ?auto_2106497 ?auto_2106500 ) ) ( not ( = ?auto_2106497 ?auto_2106502 ) ) ( not ( = ?auto_2106497 ?auto_2106503 ) ) ( not ( = ?auto_2106497 ?auto_2106504 ) ) ( not ( = ?auto_2106497 ?auto_2106505 ) ) ( not ( = ?auto_2106497 ?auto_2106506 ) ) ( not ( = ?auto_2106497 ?auto_2106507 ) ) ( not ( = ?auto_2106497 ?auto_2106508 ) ) ( not ( = ?auto_2106497 ?auto_2106509 ) ) ( not ( = ?auto_2106497 ?auto_2106510 ) ) ( not ( = ?auto_2106497 ?auto_2106511 ) ) ( not ( = ?auto_2106497 ?auto_2106512 ) ) ( not ( = ?auto_2106497 ?auto_2106513 ) ) ( not ( = ?auto_2106498 ?auto_2106499 ) ) ( not ( = ?auto_2106498 ?auto_2106501 ) ) ( not ( = ?auto_2106498 ?auto_2106500 ) ) ( not ( = ?auto_2106498 ?auto_2106502 ) ) ( not ( = ?auto_2106498 ?auto_2106503 ) ) ( not ( = ?auto_2106498 ?auto_2106504 ) ) ( not ( = ?auto_2106498 ?auto_2106505 ) ) ( not ( = ?auto_2106498 ?auto_2106506 ) ) ( not ( = ?auto_2106498 ?auto_2106507 ) ) ( not ( = ?auto_2106498 ?auto_2106508 ) ) ( not ( = ?auto_2106498 ?auto_2106509 ) ) ( not ( = ?auto_2106498 ?auto_2106510 ) ) ( not ( = ?auto_2106498 ?auto_2106511 ) ) ( not ( = ?auto_2106498 ?auto_2106512 ) ) ( not ( = ?auto_2106498 ?auto_2106513 ) ) ( not ( = ?auto_2106499 ?auto_2106501 ) ) ( not ( = ?auto_2106499 ?auto_2106500 ) ) ( not ( = ?auto_2106499 ?auto_2106502 ) ) ( not ( = ?auto_2106499 ?auto_2106503 ) ) ( not ( = ?auto_2106499 ?auto_2106504 ) ) ( not ( = ?auto_2106499 ?auto_2106505 ) ) ( not ( = ?auto_2106499 ?auto_2106506 ) ) ( not ( = ?auto_2106499 ?auto_2106507 ) ) ( not ( = ?auto_2106499 ?auto_2106508 ) ) ( not ( = ?auto_2106499 ?auto_2106509 ) ) ( not ( = ?auto_2106499 ?auto_2106510 ) ) ( not ( = ?auto_2106499 ?auto_2106511 ) ) ( not ( = ?auto_2106499 ?auto_2106512 ) ) ( not ( = ?auto_2106499 ?auto_2106513 ) ) ( not ( = ?auto_2106501 ?auto_2106500 ) ) ( not ( = ?auto_2106501 ?auto_2106502 ) ) ( not ( = ?auto_2106501 ?auto_2106503 ) ) ( not ( = ?auto_2106501 ?auto_2106504 ) ) ( not ( = ?auto_2106501 ?auto_2106505 ) ) ( not ( = ?auto_2106501 ?auto_2106506 ) ) ( not ( = ?auto_2106501 ?auto_2106507 ) ) ( not ( = ?auto_2106501 ?auto_2106508 ) ) ( not ( = ?auto_2106501 ?auto_2106509 ) ) ( not ( = ?auto_2106501 ?auto_2106510 ) ) ( not ( = ?auto_2106501 ?auto_2106511 ) ) ( not ( = ?auto_2106501 ?auto_2106512 ) ) ( not ( = ?auto_2106501 ?auto_2106513 ) ) ( not ( = ?auto_2106500 ?auto_2106502 ) ) ( not ( = ?auto_2106500 ?auto_2106503 ) ) ( not ( = ?auto_2106500 ?auto_2106504 ) ) ( not ( = ?auto_2106500 ?auto_2106505 ) ) ( not ( = ?auto_2106500 ?auto_2106506 ) ) ( not ( = ?auto_2106500 ?auto_2106507 ) ) ( not ( = ?auto_2106500 ?auto_2106508 ) ) ( not ( = ?auto_2106500 ?auto_2106509 ) ) ( not ( = ?auto_2106500 ?auto_2106510 ) ) ( not ( = ?auto_2106500 ?auto_2106511 ) ) ( not ( = ?auto_2106500 ?auto_2106512 ) ) ( not ( = ?auto_2106500 ?auto_2106513 ) ) ( not ( = ?auto_2106502 ?auto_2106503 ) ) ( not ( = ?auto_2106502 ?auto_2106504 ) ) ( not ( = ?auto_2106502 ?auto_2106505 ) ) ( not ( = ?auto_2106502 ?auto_2106506 ) ) ( not ( = ?auto_2106502 ?auto_2106507 ) ) ( not ( = ?auto_2106502 ?auto_2106508 ) ) ( not ( = ?auto_2106502 ?auto_2106509 ) ) ( not ( = ?auto_2106502 ?auto_2106510 ) ) ( not ( = ?auto_2106502 ?auto_2106511 ) ) ( not ( = ?auto_2106502 ?auto_2106512 ) ) ( not ( = ?auto_2106502 ?auto_2106513 ) ) ( not ( = ?auto_2106503 ?auto_2106504 ) ) ( not ( = ?auto_2106503 ?auto_2106505 ) ) ( not ( = ?auto_2106503 ?auto_2106506 ) ) ( not ( = ?auto_2106503 ?auto_2106507 ) ) ( not ( = ?auto_2106503 ?auto_2106508 ) ) ( not ( = ?auto_2106503 ?auto_2106509 ) ) ( not ( = ?auto_2106503 ?auto_2106510 ) ) ( not ( = ?auto_2106503 ?auto_2106511 ) ) ( not ( = ?auto_2106503 ?auto_2106512 ) ) ( not ( = ?auto_2106503 ?auto_2106513 ) ) ( not ( = ?auto_2106504 ?auto_2106505 ) ) ( not ( = ?auto_2106504 ?auto_2106506 ) ) ( not ( = ?auto_2106504 ?auto_2106507 ) ) ( not ( = ?auto_2106504 ?auto_2106508 ) ) ( not ( = ?auto_2106504 ?auto_2106509 ) ) ( not ( = ?auto_2106504 ?auto_2106510 ) ) ( not ( = ?auto_2106504 ?auto_2106511 ) ) ( not ( = ?auto_2106504 ?auto_2106512 ) ) ( not ( = ?auto_2106504 ?auto_2106513 ) ) ( not ( = ?auto_2106505 ?auto_2106506 ) ) ( not ( = ?auto_2106505 ?auto_2106507 ) ) ( not ( = ?auto_2106505 ?auto_2106508 ) ) ( not ( = ?auto_2106505 ?auto_2106509 ) ) ( not ( = ?auto_2106505 ?auto_2106510 ) ) ( not ( = ?auto_2106505 ?auto_2106511 ) ) ( not ( = ?auto_2106505 ?auto_2106512 ) ) ( not ( = ?auto_2106505 ?auto_2106513 ) ) ( not ( = ?auto_2106506 ?auto_2106507 ) ) ( not ( = ?auto_2106506 ?auto_2106508 ) ) ( not ( = ?auto_2106506 ?auto_2106509 ) ) ( not ( = ?auto_2106506 ?auto_2106510 ) ) ( not ( = ?auto_2106506 ?auto_2106511 ) ) ( not ( = ?auto_2106506 ?auto_2106512 ) ) ( not ( = ?auto_2106506 ?auto_2106513 ) ) ( not ( = ?auto_2106507 ?auto_2106508 ) ) ( not ( = ?auto_2106507 ?auto_2106509 ) ) ( not ( = ?auto_2106507 ?auto_2106510 ) ) ( not ( = ?auto_2106507 ?auto_2106511 ) ) ( not ( = ?auto_2106507 ?auto_2106512 ) ) ( not ( = ?auto_2106507 ?auto_2106513 ) ) ( not ( = ?auto_2106508 ?auto_2106509 ) ) ( not ( = ?auto_2106508 ?auto_2106510 ) ) ( not ( = ?auto_2106508 ?auto_2106511 ) ) ( not ( = ?auto_2106508 ?auto_2106512 ) ) ( not ( = ?auto_2106508 ?auto_2106513 ) ) ( not ( = ?auto_2106509 ?auto_2106510 ) ) ( not ( = ?auto_2106509 ?auto_2106511 ) ) ( not ( = ?auto_2106509 ?auto_2106512 ) ) ( not ( = ?auto_2106509 ?auto_2106513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106510 ?auto_2106511 ?auto_2106512 )
      ( MAKE-15CRATE-VERIFY ?auto_2106497 ?auto_2106498 ?auto_2106499 ?auto_2106501 ?auto_2106500 ?auto_2106502 ?auto_2106503 ?auto_2106504 ?auto_2106505 ?auto_2106506 ?auto_2106507 ?auto_2106508 ?auto_2106509 ?auto_2106510 ?auto_2106511 ?auto_2106512 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106723 - SURFACE
      ?auto_2106724 - SURFACE
      ?auto_2106725 - SURFACE
      ?auto_2106727 - SURFACE
      ?auto_2106726 - SURFACE
      ?auto_2106728 - SURFACE
      ?auto_2106729 - SURFACE
      ?auto_2106730 - SURFACE
      ?auto_2106731 - SURFACE
      ?auto_2106732 - SURFACE
      ?auto_2106733 - SURFACE
      ?auto_2106734 - SURFACE
      ?auto_2106735 - SURFACE
      ?auto_2106736 - SURFACE
      ?auto_2106737 - SURFACE
      ?auto_2106738 - SURFACE
    )
    :vars
    (
      ?auto_2106742 - HOIST
      ?auto_2106741 - PLACE
      ?auto_2106740 - PLACE
      ?auto_2106739 - HOIST
      ?auto_2106744 - SURFACE
      ?auto_2106743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106742 ?auto_2106741 ) ( IS-CRATE ?auto_2106738 ) ( not ( = ?auto_2106737 ?auto_2106738 ) ) ( not ( = ?auto_2106736 ?auto_2106737 ) ) ( not ( = ?auto_2106736 ?auto_2106738 ) ) ( not ( = ?auto_2106740 ?auto_2106741 ) ) ( HOIST-AT ?auto_2106739 ?auto_2106740 ) ( not ( = ?auto_2106742 ?auto_2106739 ) ) ( AVAILABLE ?auto_2106739 ) ( SURFACE-AT ?auto_2106738 ?auto_2106740 ) ( ON ?auto_2106738 ?auto_2106744 ) ( CLEAR ?auto_2106738 ) ( not ( = ?auto_2106737 ?auto_2106744 ) ) ( not ( = ?auto_2106738 ?auto_2106744 ) ) ( not ( = ?auto_2106736 ?auto_2106744 ) ) ( TRUCK-AT ?auto_2106743 ?auto_2106741 ) ( SURFACE-AT ?auto_2106736 ?auto_2106741 ) ( CLEAR ?auto_2106736 ) ( LIFTING ?auto_2106742 ?auto_2106737 ) ( IS-CRATE ?auto_2106737 ) ( ON ?auto_2106724 ?auto_2106723 ) ( ON ?auto_2106725 ?auto_2106724 ) ( ON ?auto_2106727 ?auto_2106725 ) ( ON ?auto_2106726 ?auto_2106727 ) ( ON ?auto_2106728 ?auto_2106726 ) ( ON ?auto_2106729 ?auto_2106728 ) ( ON ?auto_2106730 ?auto_2106729 ) ( ON ?auto_2106731 ?auto_2106730 ) ( ON ?auto_2106732 ?auto_2106731 ) ( ON ?auto_2106733 ?auto_2106732 ) ( ON ?auto_2106734 ?auto_2106733 ) ( ON ?auto_2106735 ?auto_2106734 ) ( ON ?auto_2106736 ?auto_2106735 ) ( not ( = ?auto_2106723 ?auto_2106724 ) ) ( not ( = ?auto_2106723 ?auto_2106725 ) ) ( not ( = ?auto_2106723 ?auto_2106727 ) ) ( not ( = ?auto_2106723 ?auto_2106726 ) ) ( not ( = ?auto_2106723 ?auto_2106728 ) ) ( not ( = ?auto_2106723 ?auto_2106729 ) ) ( not ( = ?auto_2106723 ?auto_2106730 ) ) ( not ( = ?auto_2106723 ?auto_2106731 ) ) ( not ( = ?auto_2106723 ?auto_2106732 ) ) ( not ( = ?auto_2106723 ?auto_2106733 ) ) ( not ( = ?auto_2106723 ?auto_2106734 ) ) ( not ( = ?auto_2106723 ?auto_2106735 ) ) ( not ( = ?auto_2106723 ?auto_2106736 ) ) ( not ( = ?auto_2106723 ?auto_2106737 ) ) ( not ( = ?auto_2106723 ?auto_2106738 ) ) ( not ( = ?auto_2106723 ?auto_2106744 ) ) ( not ( = ?auto_2106724 ?auto_2106725 ) ) ( not ( = ?auto_2106724 ?auto_2106727 ) ) ( not ( = ?auto_2106724 ?auto_2106726 ) ) ( not ( = ?auto_2106724 ?auto_2106728 ) ) ( not ( = ?auto_2106724 ?auto_2106729 ) ) ( not ( = ?auto_2106724 ?auto_2106730 ) ) ( not ( = ?auto_2106724 ?auto_2106731 ) ) ( not ( = ?auto_2106724 ?auto_2106732 ) ) ( not ( = ?auto_2106724 ?auto_2106733 ) ) ( not ( = ?auto_2106724 ?auto_2106734 ) ) ( not ( = ?auto_2106724 ?auto_2106735 ) ) ( not ( = ?auto_2106724 ?auto_2106736 ) ) ( not ( = ?auto_2106724 ?auto_2106737 ) ) ( not ( = ?auto_2106724 ?auto_2106738 ) ) ( not ( = ?auto_2106724 ?auto_2106744 ) ) ( not ( = ?auto_2106725 ?auto_2106727 ) ) ( not ( = ?auto_2106725 ?auto_2106726 ) ) ( not ( = ?auto_2106725 ?auto_2106728 ) ) ( not ( = ?auto_2106725 ?auto_2106729 ) ) ( not ( = ?auto_2106725 ?auto_2106730 ) ) ( not ( = ?auto_2106725 ?auto_2106731 ) ) ( not ( = ?auto_2106725 ?auto_2106732 ) ) ( not ( = ?auto_2106725 ?auto_2106733 ) ) ( not ( = ?auto_2106725 ?auto_2106734 ) ) ( not ( = ?auto_2106725 ?auto_2106735 ) ) ( not ( = ?auto_2106725 ?auto_2106736 ) ) ( not ( = ?auto_2106725 ?auto_2106737 ) ) ( not ( = ?auto_2106725 ?auto_2106738 ) ) ( not ( = ?auto_2106725 ?auto_2106744 ) ) ( not ( = ?auto_2106727 ?auto_2106726 ) ) ( not ( = ?auto_2106727 ?auto_2106728 ) ) ( not ( = ?auto_2106727 ?auto_2106729 ) ) ( not ( = ?auto_2106727 ?auto_2106730 ) ) ( not ( = ?auto_2106727 ?auto_2106731 ) ) ( not ( = ?auto_2106727 ?auto_2106732 ) ) ( not ( = ?auto_2106727 ?auto_2106733 ) ) ( not ( = ?auto_2106727 ?auto_2106734 ) ) ( not ( = ?auto_2106727 ?auto_2106735 ) ) ( not ( = ?auto_2106727 ?auto_2106736 ) ) ( not ( = ?auto_2106727 ?auto_2106737 ) ) ( not ( = ?auto_2106727 ?auto_2106738 ) ) ( not ( = ?auto_2106727 ?auto_2106744 ) ) ( not ( = ?auto_2106726 ?auto_2106728 ) ) ( not ( = ?auto_2106726 ?auto_2106729 ) ) ( not ( = ?auto_2106726 ?auto_2106730 ) ) ( not ( = ?auto_2106726 ?auto_2106731 ) ) ( not ( = ?auto_2106726 ?auto_2106732 ) ) ( not ( = ?auto_2106726 ?auto_2106733 ) ) ( not ( = ?auto_2106726 ?auto_2106734 ) ) ( not ( = ?auto_2106726 ?auto_2106735 ) ) ( not ( = ?auto_2106726 ?auto_2106736 ) ) ( not ( = ?auto_2106726 ?auto_2106737 ) ) ( not ( = ?auto_2106726 ?auto_2106738 ) ) ( not ( = ?auto_2106726 ?auto_2106744 ) ) ( not ( = ?auto_2106728 ?auto_2106729 ) ) ( not ( = ?auto_2106728 ?auto_2106730 ) ) ( not ( = ?auto_2106728 ?auto_2106731 ) ) ( not ( = ?auto_2106728 ?auto_2106732 ) ) ( not ( = ?auto_2106728 ?auto_2106733 ) ) ( not ( = ?auto_2106728 ?auto_2106734 ) ) ( not ( = ?auto_2106728 ?auto_2106735 ) ) ( not ( = ?auto_2106728 ?auto_2106736 ) ) ( not ( = ?auto_2106728 ?auto_2106737 ) ) ( not ( = ?auto_2106728 ?auto_2106738 ) ) ( not ( = ?auto_2106728 ?auto_2106744 ) ) ( not ( = ?auto_2106729 ?auto_2106730 ) ) ( not ( = ?auto_2106729 ?auto_2106731 ) ) ( not ( = ?auto_2106729 ?auto_2106732 ) ) ( not ( = ?auto_2106729 ?auto_2106733 ) ) ( not ( = ?auto_2106729 ?auto_2106734 ) ) ( not ( = ?auto_2106729 ?auto_2106735 ) ) ( not ( = ?auto_2106729 ?auto_2106736 ) ) ( not ( = ?auto_2106729 ?auto_2106737 ) ) ( not ( = ?auto_2106729 ?auto_2106738 ) ) ( not ( = ?auto_2106729 ?auto_2106744 ) ) ( not ( = ?auto_2106730 ?auto_2106731 ) ) ( not ( = ?auto_2106730 ?auto_2106732 ) ) ( not ( = ?auto_2106730 ?auto_2106733 ) ) ( not ( = ?auto_2106730 ?auto_2106734 ) ) ( not ( = ?auto_2106730 ?auto_2106735 ) ) ( not ( = ?auto_2106730 ?auto_2106736 ) ) ( not ( = ?auto_2106730 ?auto_2106737 ) ) ( not ( = ?auto_2106730 ?auto_2106738 ) ) ( not ( = ?auto_2106730 ?auto_2106744 ) ) ( not ( = ?auto_2106731 ?auto_2106732 ) ) ( not ( = ?auto_2106731 ?auto_2106733 ) ) ( not ( = ?auto_2106731 ?auto_2106734 ) ) ( not ( = ?auto_2106731 ?auto_2106735 ) ) ( not ( = ?auto_2106731 ?auto_2106736 ) ) ( not ( = ?auto_2106731 ?auto_2106737 ) ) ( not ( = ?auto_2106731 ?auto_2106738 ) ) ( not ( = ?auto_2106731 ?auto_2106744 ) ) ( not ( = ?auto_2106732 ?auto_2106733 ) ) ( not ( = ?auto_2106732 ?auto_2106734 ) ) ( not ( = ?auto_2106732 ?auto_2106735 ) ) ( not ( = ?auto_2106732 ?auto_2106736 ) ) ( not ( = ?auto_2106732 ?auto_2106737 ) ) ( not ( = ?auto_2106732 ?auto_2106738 ) ) ( not ( = ?auto_2106732 ?auto_2106744 ) ) ( not ( = ?auto_2106733 ?auto_2106734 ) ) ( not ( = ?auto_2106733 ?auto_2106735 ) ) ( not ( = ?auto_2106733 ?auto_2106736 ) ) ( not ( = ?auto_2106733 ?auto_2106737 ) ) ( not ( = ?auto_2106733 ?auto_2106738 ) ) ( not ( = ?auto_2106733 ?auto_2106744 ) ) ( not ( = ?auto_2106734 ?auto_2106735 ) ) ( not ( = ?auto_2106734 ?auto_2106736 ) ) ( not ( = ?auto_2106734 ?auto_2106737 ) ) ( not ( = ?auto_2106734 ?auto_2106738 ) ) ( not ( = ?auto_2106734 ?auto_2106744 ) ) ( not ( = ?auto_2106735 ?auto_2106736 ) ) ( not ( = ?auto_2106735 ?auto_2106737 ) ) ( not ( = ?auto_2106735 ?auto_2106738 ) ) ( not ( = ?auto_2106735 ?auto_2106744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106736 ?auto_2106737 ?auto_2106738 )
      ( MAKE-15CRATE-VERIFY ?auto_2106723 ?auto_2106724 ?auto_2106725 ?auto_2106727 ?auto_2106726 ?auto_2106728 ?auto_2106729 ?auto_2106730 ?auto_2106731 ?auto_2106732 ?auto_2106733 ?auto_2106734 ?auto_2106735 ?auto_2106736 ?auto_2106737 ?auto_2106738 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106949 - SURFACE
      ?auto_2106950 - SURFACE
      ?auto_2106951 - SURFACE
      ?auto_2106953 - SURFACE
      ?auto_2106952 - SURFACE
      ?auto_2106954 - SURFACE
      ?auto_2106955 - SURFACE
      ?auto_2106956 - SURFACE
      ?auto_2106957 - SURFACE
      ?auto_2106958 - SURFACE
      ?auto_2106959 - SURFACE
      ?auto_2106960 - SURFACE
      ?auto_2106961 - SURFACE
      ?auto_2106962 - SURFACE
      ?auto_2106963 - SURFACE
      ?auto_2106964 - SURFACE
    )
    :vars
    (
      ?auto_2106966 - HOIST
      ?auto_2106965 - PLACE
      ?auto_2106967 - PLACE
      ?auto_2106968 - HOIST
      ?auto_2106970 - SURFACE
      ?auto_2106969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106966 ?auto_2106965 ) ( IS-CRATE ?auto_2106964 ) ( not ( = ?auto_2106963 ?auto_2106964 ) ) ( not ( = ?auto_2106962 ?auto_2106963 ) ) ( not ( = ?auto_2106962 ?auto_2106964 ) ) ( not ( = ?auto_2106967 ?auto_2106965 ) ) ( HOIST-AT ?auto_2106968 ?auto_2106967 ) ( not ( = ?auto_2106966 ?auto_2106968 ) ) ( AVAILABLE ?auto_2106968 ) ( SURFACE-AT ?auto_2106964 ?auto_2106967 ) ( ON ?auto_2106964 ?auto_2106970 ) ( CLEAR ?auto_2106964 ) ( not ( = ?auto_2106963 ?auto_2106970 ) ) ( not ( = ?auto_2106964 ?auto_2106970 ) ) ( not ( = ?auto_2106962 ?auto_2106970 ) ) ( TRUCK-AT ?auto_2106969 ?auto_2106965 ) ( SURFACE-AT ?auto_2106962 ?auto_2106965 ) ( CLEAR ?auto_2106962 ) ( IS-CRATE ?auto_2106963 ) ( AVAILABLE ?auto_2106966 ) ( IN ?auto_2106963 ?auto_2106969 ) ( ON ?auto_2106950 ?auto_2106949 ) ( ON ?auto_2106951 ?auto_2106950 ) ( ON ?auto_2106953 ?auto_2106951 ) ( ON ?auto_2106952 ?auto_2106953 ) ( ON ?auto_2106954 ?auto_2106952 ) ( ON ?auto_2106955 ?auto_2106954 ) ( ON ?auto_2106956 ?auto_2106955 ) ( ON ?auto_2106957 ?auto_2106956 ) ( ON ?auto_2106958 ?auto_2106957 ) ( ON ?auto_2106959 ?auto_2106958 ) ( ON ?auto_2106960 ?auto_2106959 ) ( ON ?auto_2106961 ?auto_2106960 ) ( ON ?auto_2106962 ?auto_2106961 ) ( not ( = ?auto_2106949 ?auto_2106950 ) ) ( not ( = ?auto_2106949 ?auto_2106951 ) ) ( not ( = ?auto_2106949 ?auto_2106953 ) ) ( not ( = ?auto_2106949 ?auto_2106952 ) ) ( not ( = ?auto_2106949 ?auto_2106954 ) ) ( not ( = ?auto_2106949 ?auto_2106955 ) ) ( not ( = ?auto_2106949 ?auto_2106956 ) ) ( not ( = ?auto_2106949 ?auto_2106957 ) ) ( not ( = ?auto_2106949 ?auto_2106958 ) ) ( not ( = ?auto_2106949 ?auto_2106959 ) ) ( not ( = ?auto_2106949 ?auto_2106960 ) ) ( not ( = ?auto_2106949 ?auto_2106961 ) ) ( not ( = ?auto_2106949 ?auto_2106962 ) ) ( not ( = ?auto_2106949 ?auto_2106963 ) ) ( not ( = ?auto_2106949 ?auto_2106964 ) ) ( not ( = ?auto_2106949 ?auto_2106970 ) ) ( not ( = ?auto_2106950 ?auto_2106951 ) ) ( not ( = ?auto_2106950 ?auto_2106953 ) ) ( not ( = ?auto_2106950 ?auto_2106952 ) ) ( not ( = ?auto_2106950 ?auto_2106954 ) ) ( not ( = ?auto_2106950 ?auto_2106955 ) ) ( not ( = ?auto_2106950 ?auto_2106956 ) ) ( not ( = ?auto_2106950 ?auto_2106957 ) ) ( not ( = ?auto_2106950 ?auto_2106958 ) ) ( not ( = ?auto_2106950 ?auto_2106959 ) ) ( not ( = ?auto_2106950 ?auto_2106960 ) ) ( not ( = ?auto_2106950 ?auto_2106961 ) ) ( not ( = ?auto_2106950 ?auto_2106962 ) ) ( not ( = ?auto_2106950 ?auto_2106963 ) ) ( not ( = ?auto_2106950 ?auto_2106964 ) ) ( not ( = ?auto_2106950 ?auto_2106970 ) ) ( not ( = ?auto_2106951 ?auto_2106953 ) ) ( not ( = ?auto_2106951 ?auto_2106952 ) ) ( not ( = ?auto_2106951 ?auto_2106954 ) ) ( not ( = ?auto_2106951 ?auto_2106955 ) ) ( not ( = ?auto_2106951 ?auto_2106956 ) ) ( not ( = ?auto_2106951 ?auto_2106957 ) ) ( not ( = ?auto_2106951 ?auto_2106958 ) ) ( not ( = ?auto_2106951 ?auto_2106959 ) ) ( not ( = ?auto_2106951 ?auto_2106960 ) ) ( not ( = ?auto_2106951 ?auto_2106961 ) ) ( not ( = ?auto_2106951 ?auto_2106962 ) ) ( not ( = ?auto_2106951 ?auto_2106963 ) ) ( not ( = ?auto_2106951 ?auto_2106964 ) ) ( not ( = ?auto_2106951 ?auto_2106970 ) ) ( not ( = ?auto_2106953 ?auto_2106952 ) ) ( not ( = ?auto_2106953 ?auto_2106954 ) ) ( not ( = ?auto_2106953 ?auto_2106955 ) ) ( not ( = ?auto_2106953 ?auto_2106956 ) ) ( not ( = ?auto_2106953 ?auto_2106957 ) ) ( not ( = ?auto_2106953 ?auto_2106958 ) ) ( not ( = ?auto_2106953 ?auto_2106959 ) ) ( not ( = ?auto_2106953 ?auto_2106960 ) ) ( not ( = ?auto_2106953 ?auto_2106961 ) ) ( not ( = ?auto_2106953 ?auto_2106962 ) ) ( not ( = ?auto_2106953 ?auto_2106963 ) ) ( not ( = ?auto_2106953 ?auto_2106964 ) ) ( not ( = ?auto_2106953 ?auto_2106970 ) ) ( not ( = ?auto_2106952 ?auto_2106954 ) ) ( not ( = ?auto_2106952 ?auto_2106955 ) ) ( not ( = ?auto_2106952 ?auto_2106956 ) ) ( not ( = ?auto_2106952 ?auto_2106957 ) ) ( not ( = ?auto_2106952 ?auto_2106958 ) ) ( not ( = ?auto_2106952 ?auto_2106959 ) ) ( not ( = ?auto_2106952 ?auto_2106960 ) ) ( not ( = ?auto_2106952 ?auto_2106961 ) ) ( not ( = ?auto_2106952 ?auto_2106962 ) ) ( not ( = ?auto_2106952 ?auto_2106963 ) ) ( not ( = ?auto_2106952 ?auto_2106964 ) ) ( not ( = ?auto_2106952 ?auto_2106970 ) ) ( not ( = ?auto_2106954 ?auto_2106955 ) ) ( not ( = ?auto_2106954 ?auto_2106956 ) ) ( not ( = ?auto_2106954 ?auto_2106957 ) ) ( not ( = ?auto_2106954 ?auto_2106958 ) ) ( not ( = ?auto_2106954 ?auto_2106959 ) ) ( not ( = ?auto_2106954 ?auto_2106960 ) ) ( not ( = ?auto_2106954 ?auto_2106961 ) ) ( not ( = ?auto_2106954 ?auto_2106962 ) ) ( not ( = ?auto_2106954 ?auto_2106963 ) ) ( not ( = ?auto_2106954 ?auto_2106964 ) ) ( not ( = ?auto_2106954 ?auto_2106970 ) ) ( not ( = ?auto_2106955 ?auto_2106956 ) ) ( not ( = ?auto_2106955 ?auto_2106957 ) ) ( not ( = ?auto_2106955 ?auto_2106958 ) ) ( not ( = ?auto_2106955 ?auto_2106959 ) ) ( not ( = ?auto_2106955 ?auto_2106960 ) ) ( not ( = ?auto_2106955 ?auto_2106961 ) ) ( not ( = ?auto_2106955 ?auto_2106962 ) ) ( not ( = ?auto_2106955 ?auto_2106963 ) ) ( not ( = ?auto_2106955 ?auto_2106964 ) ) ( not ( = ?auto_2106955 ?auto_2106970 ) ) ( not ( = ?auto_2106956 ?auto_2106957 ) ) ( not ( = ?auto_2106956 ?auto_2106958 ) ) ( not ( = ?auto_2106956 ?auto_2106959 ) ) ( not ( = ?auto_2106956 ?auto_2106960 ) ) ( not ( = ?auto_2106956 ?auto_2106961 ) ) ( not ( = ?auto_2106956 ?auto_2106962 ) ) ( not ( = ?auto_2106956 ?auto_2106963 ) ) ( not ( = ?auto_2106956 ?auto_2106964 ) ) ( not ( = ?auto_2106956 ?auto_2106970 ) ) ( not ( = ?auto_2106957 ?auto_2106958 ) ) ( not ( = ?auto_2106957 ?auto_2106959 ) ) ( not ( = ?auto_2106957 ?auto_2106960 ) ) ( not ( = ?auto_2106957 ?auto_2106961 ) ) ( not ( = ?auto_2106957 ?auto_2106962 ) ) ( not ( = ?auto_2106957 ?auto_2106963 ) ) ( not ( = ?auto_2106957 ?auto_2106964 ) ) ( not ( = ?auto_2106957 ?auto_2106970 ) ) ( not ( = ?auto_2106958 ?auto_2106959 ) ) ( not ( = ?auto_2106958 ?auto_2106960 ) ) ( not ( = ?auto_2106958 ?auto_2106961 ) ) ( not ( = ?auto_2106958 ?auto_2106962 ) ) ( not ( = ?auto_2106958 ?auto_2106963 ) ) ( not ( = ?auto_2106958 ?auto_2106964 ) ) ( not ( = ?auto_2106958 ?auto_2106970 ) ) ( not ( = ?auto_2106959 ?auto_2106960 ) ) ( not ( = ?auto_2106959 ?auto_2106961 ) ) ( not ( = ?auto_2106959 ?auto_2106962 ) ) ( not ( = ?auto_2106959 ?auto_2106963 ) ) ( not ( = ?auto_2106959 ?auto_2106964 ) ) ( not ( = ?auto_2106959 ?auto_2106970 ) ) ( not ( = ?auto_2106960 ?auto_2106961 ) ) ( not ( = ?auto_2106960 ?auto_2106962 ) ) ( not ( = ?auto_2106960 ?auto_2106963 ) ) ( not ( = ?auto_2106960 ?auto_2106964 ) ) ( not ( = ?auto_2106960 ?auto_2106970 ) ) ( not ( = ?auto_2106961 ?auto_2106962 ) ) ( not ( = ?auto_2106961 ?auto_2106963 ) ) ( not ( = ?auto_2106961 ?auto_2106964 ) ) ( not ( = ?auto_2106961 ?auto_2106970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106962 ?auto_2106963 ?auto_2106964 )
      ( MAKE-15CRATE-VERIFY ?auto_2106949 ?auto_2106950 ?auto_2106951 ?auto_2106953 ?auto_2106952 ?auto_2106954 ?auto_2106955 ?auto_2106956 ?auto_2106957 ?auto_2106958 ?auto_2106959 ?auto_2106960 ?auto_2106961 ?auto_2106962 ?auto_2106963 ?auto_2106964 ) )
  )

)

