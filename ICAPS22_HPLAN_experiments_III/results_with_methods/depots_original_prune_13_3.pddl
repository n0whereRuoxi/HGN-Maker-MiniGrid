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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042391 - SURFACE
      ?auto_1042392 - SURFACE
    )
    :vars
    (
      ?auto_1042393 - HOIST
      ?auto_1042394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042393 ?auto_1042394 ) ( SURFACE-AT ?auto_1042391 ?auto_1042394 ) ( CLEAR ?auto_1042391 ) ( LIFTING ?auto_1042393 ?auto_1042392 ) ( IS-CRATE ?auto_1042392 ) ( not ( = ?auto_1042391 ?auto_1042392 ) ) )
    :subtasks
    ( ( !DROP ?auto_1042393 ?auto_1042392 ?auto_1042391 ?auto_1042394 )
      ( MAKE-1CRATE-VERIFY ?auto_1042391 ?auto_1042392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042395 - SURFACE
      ?auto_1042396 - SURFACE
    )
    :vars
    (
      ?auto_1042398 - HOIST
      ?auto_1042397 - PLACE
      ?auto_1042399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042398 ?auto_1042397 ) ( SURFACE-AT ?auto_1042395 ?auto_1042397 ) ( CLEAR ?auto_1042395 ) ( IS-CRATE ?auto_1042396 ) ( not ( = ?auto_1042395 ?auto_1042396 ) ) ( TRUCK-AT ?auto_1042399 ?auto_1042397 ) ( AVAILABLE ?auto_1042398 ) ( IN ?auto_1042396 ?auto_1042399 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1042398 ?auto_1042396 ?auto_1042399 ?auto_1042397 )
      ( MAKE-1CRATE ?auto_1042395 ?auto_1042396 )
      ( MAKE-1CRATE-VERIFY ?auto_1042395 ?auto_1042396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042400 - SURFACE
      ?auto_1042401 - SURFACE
    )
    :vars
    (
      ?auto_1042404 - HOIST
      ?auto_1042402 - PLACE
      ?auto_1042403 - TRUCK
      ?auto_1042405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042404 ?auto_1042402 ) ( SURFACE-AT ?auto_1042400 ?auto_1042402 ) ( CLEAR ?auto_1042400 ) ( IS-CRATE ?auto_1042401 ) ( not ( = ?auto_1042400 ?auto_1042401 ) ) ( AVAILABLE ?auto_1042404 ) ( IN ?auto_1042401 ?auto_1042403 ) ( TRUCK-AT ?auto_1042403 ?auto_1042405 ) ( not ( = ?auto_1042405 ?auto_1042402 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042403 ?auto_1042405 ?auto_1042402 )
      ( MAKE-1CRATE ?auto_1042400 ?auto_1042401 )
      ( MAKE-1CRATE-VERIFY ?auto_1042400 ?auto_1042401 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042406 - SURFACE
      ?auto_1042407 - SURFACE
    )
    :vars
    (
      ?auto_1042408 - HOIST
      ?auto_1042409 - PLACE
      ?auto_1042411 - TRUCK
      ?auto_1042410 - PLACE
      ?auto_1042412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042408 ?auto_1042409 ) ( SURFACE-AT ?auto_1042406 ?auto_1042409 ) ( CLEAR ?auto_1042406 ) ( IS-CRATE ?auto_1042407 ) ( not ( = ?auto_1042406 ?auto_1042407 ) ) ( AVAILABLE ?auto_1042408 ) ( TRUCK-AT ?auto_1042411 ?auto_1042410 ) ( not ( = ?auto_1042410 ?auto_1042409 ) ) ( HOIST-AT ?auto_1042412 ?auto_1042410 ) ( LIFTING ?auto_1042412 ?auto_1042407 ) ( not ( = ?auto_1042408 ?auto_1042412 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1042412 ?auto_1042407 ?auto_1042411 ?auto_1042410 )
      ( MAKE-1CRATE ?auto_1042406 ?auto_1042407 )
      ( MAKE-1CRATE-VERIFY ?auto_1042406 ?auto_1042407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042413 - SURFACE
      ?auto_1042414 - SURFACE
    )
    :vars
    (
      ?auto_1042419 - HOIST
      ?auto_1042416 - PLACE
      ?auto_1042415 - TRUCK
      ?auto_1042417 - PLACE
      ?auto_1042418 - HOIST
      ?auto_1042420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042419 ?auto_1042416 ) ( SURFACE-AT ?auto_1042413 ?auto_1042416 ) ( CLEAR ?auto_1042413 ) ( IS-CRATE ?auto_1042414 ) ( not ( = ?auto_1042413 ?auto_1042414 ) ) ( AVAILABLE ?auto_1042419 ) ( TRUCK-AT ?auto_1042415 ?auto_1042417 ) ( not ( = ?auto_1042417 ?auto_1042416 ) ) ( HOIST-AT ?auto_1042418 ?auto_1042417 ) ( not ( = ?auto_1042419 ?auto_1042418 ) ) ( AVAILABLE ?auto_1042418 ) ( SURFACE-AT ?auto_1042414 ?auto_1042417 ) ( ON ?auto_1042414 ?auto_1042420 ) ( CLEAR ?auto_1042414 ) ( not ( = ?auto_1042413 ?auto_1042420 ) ) ( not ( = ?auto_1042414 ?auto_1042420 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1042418 ?auto_1042414 ?auto_1042420 ?auto_1042417 )
      ( MAKE-1CRATE ?auto_1042413 ?auto_1042414 )
      ( MAKE-1CRATE-VERIFY ?auto_1042413 ?auto_1042414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042421 - SURFACE
      ?auto_1042422 - SURFACE
    )
    :vars
    (
      ?auto_1042423 - HOIST
      ?auto_1042426 - PLACE
      ?auto_1042425 - PLACE
      ?auto_1042427 - HOIST
      ?auto_1042424 - SURFACE
      ?auto_1042428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042423 ?auto_1042426 ) ( SURFACE-AT ?auto_1042421 ?auto_1042426 ) ( CLEAR ?auto_1042421 ) ( IS-CRATE ?auto_1042422 ) ( not ( = ?auto_1042421 ?auto_1042422 ) ) ( AVAILABLE ?auto_1042423 ) ( not ( = ?auto_1042425 ?auto_1042426 ) ) ( HOIST-AT ?auto_1042427 ?auto_1042425 ) ( not ( = ?auto_1042423 ?auto_1042427 ) ) ( AVAILABLE ?auto_1042427 ) ( SURFACE-AT ?auto_1042422 ?auto_1042425 ) ( ON ?auto_1042422 ?auto_1042424 ) ( CLEAR ?auto_1042422 ) ( not ( = ?auto_1042421 ?auto_1042424 ) ) ( not ( = ?auto_1042422 ?auto_1042424 ) ) ( TRUCK-AT ?auto_1042428 ?auto_1042426 ) )
    :subtasks
    ( ( !DRIVE ?auto_1042428 ?auto_1042426 ?auto_1042425 )
      ( MAKE-1CRATE ?auto_1042421 ?auto_1042422 )
      ( MAKE-1CRATE-VERIFY ?auto_1042421 ?auto_1042422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042438 - SURFACE
      ?auto_1042439 - SURFACE
      ?auto_1042440 - SURFACE
    )
    :vars
    (
      ?auto_1042441 - HOIST
      ?auto_1042442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042441 ?auto_1042442 ) ( SURFACE-AT ?auto_1042439 ?auto_1042442 ) ( CLEAR ?auto_1042439 ) ( LIFTING ?auto_1042441 ?auto_1042440 ) ( IS-CRATE ?auto_1042440 ) ( not ( = ?auto_1042439 ?auto_1042440 ) ) ( ON ?auto_1042439 ?auto_1042438 ) ( not ( = ?auto_1042438 ?auto_1042439 ) ) ( not ( = ?auto_1042438 ?auto_1042440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042439 ?auto_1042440 )
      ( MAKE-2CRATE-VERIFY ?auto_1042438 ?auto_1042439 ?auto_1042440 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042448 - SURFACE
      ?auto_1042449 - SURFACE
      ?auto_1042450 - SURFACE
    )
    :vars
    (
      ?auto_1042451 - HOIST
      ?auto_1042452 - PLACE
      ?auto_1042453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042451 ?auto_1042452 ) ( SURFACE-AT ?auto_1042449 ?auto_1042452 ) ( CLEAR ?auto_1042449 ) ( IS-CRATE ?auto_1042450 ) ( not ( = ?auto_1042449 ?auto_1042450 ) ) ( TRUCK-AT ?auto_1042453 ?auto_1042452 ) ( AVAILABLE ?auto_1042451 ) ( IN ?auto_1042450 ?auto_1042453 ) ( ON ?auto_1042449 ?auto_1042448 ) ( not ( = ?auto_1042448 ?auto_1042449 ) ) ( not ( = ?auto_1042448 ?auto_1042450 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042449 ?auto_1042450 )
      ( MAKE-2CRATE-VERIFY ?auto_1042448 ?auto_1042449 ?auto_1042450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042454 - SURFACE
      ?auto_1042455 - SURFACE
    )
    :vars
    (
      ?auto_1042456 - HOIST
      ?auto_1042457 - PLACE
      ?auto_1042459 - TRUCK
      ?auto_1042458 - SURFACE
      ?auto_1042460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042456 ?auto_1042457 ) ( SURFACE-AT ?auto_1042454 ?auto_1042457 ) ( CLEAR ?auto_1042454 ) ( IS-CRATE ?auto_1042455 ) ( not ( = ?auto_1042454 ?auto_1042455 ) ) ( AVAILABLE ?auto_1042456 ) ( IN ?auto_1042455 ?auto_1042459 ) ( ON ?auto_1042454 ?auto_1042458 ) ( not ( = ?auto_1042458 ?auto_1042454 ) ) ( not ( = ?auto_1042458 ?auto_1042455 ) ) ( TRUCK-AT ?auto_1042459 ?auto_1042460 ) ( not ( = ?auto_1042460 ?auto_1042457 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042459 ?auto_1042460 ?auto_1042457 )
      ( MAKE-2CRATE ?auto_1042458 ?auto_1042454 ?auto_1042455 )
      ( MAKE-1CRATE-VERIFY ?auto_1042454 ?auto_1042455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042461 - SURFACE
      ?auto_1042462 - SURFACE
      ?auto_1042463 - SURFACE
    )
    :vars
    (
      ?auto_1042465 - HOIST
      ?auto_1042464 - PLACE
      ?auto_1042466 - TRUCK
      ?auto_1042467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042465 ?auto_1042464 ) ( SURFACE-AT ?auto_1042462 ?auto_1042464 ) ( CLEAR ?auto_1042462 ) ( IS-CRATE ?auto_1042463 ) ( not ( = ?auto_1042462 ?auto_1042463 ) ) ( AVAILABLE ?auto_1042465 ) ( IN ?auto_1042463 ?auto_1042466 ) ( ON ?auto_1042462 ?auto_1042461 ) ( not ( = ?auto_1042461 ?auto_1042462 ) ) ( not ( = ?auto_1042461 ?auto_1042463 ) ) ( TRUCK-AT ?auto_1042466 ?auto_1042467 ) ( not ( = ?auto_1042467 ?auto_1042464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042462 ?auto_1042463 )
      ( MAKE-2CRATE-VERIFY ?auto_1042461 ?auto_1042462 ?auto_1042463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042468 - SURFACE
      ?auto_1042469 - SURFACE
    )
    :vars
    (
      ?auto_1042472 - HOIST
      ?auto_1042470 - PLACE
      ?auto_1042471 - SURFACE
      ?auto_1042474 - TRUCK
      ?auto_1042473 - PLACE
      ?auto_1042475 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042472 ?auto_1042470 ) ( SURFACE-AT ?auto_1042468 ?auto_1042470 ) ( CLEAR ?auto_1042468 ) ( IS-CRATE ?auto_1042469 ) ( not ( = ?auto_1042468 ?auto_1042469 ) ) ( AVAILABLE ?auto_1042472 ) ( ON ?auto_1042468 ?auto_1042471 ) ( not ( = ?auto_1042471 ?auto_1042468 ) ) ( not ( = ?auto_1042471 ?auto_1042469 ) ) ( TRUCK-AT ?auto_1042474 ?auto_1042473 ) ( not ( = ?auto_1042473 ?auto_1042470 ) ) ( HOIST-AT ?auto_1042475 ?auto_1042473 ) ( LIFTING ?auto_1042475 ?auto_1042469 ) ( not ( = ?auto_1042472 ?auto_1042475 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1042475 ?auto_1042469 ?auto_1042474 ?auto_1042473 )
      ( MAKE-2CRATE ?auto_1042471 ?auto_1042468 ?auto_1042469 )
      ( MAKE-1CRATE-VERIFY ?auto_1042468 ?auto_1042469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042476 - SURFACE
      ?auto_1042477 - SURFACE
      ?auto_1042478 - SURFACE
    )
    :vars
    (
      ?auto_1042482 - HOIST
      ?auto_1042481 - PLACE
      ?auto_1042480 - TRUCK
      ?auto_1042483 - PLACE
      ?auto_1042479 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042482 ?auto_1042481 ) ( SURFACE-AT ?auto_1042477 ?auto_1042481 ) ( CLEAR ?auto_1042477 ) ( IS-CRATE ?auto_1042478 ) ( not ( = ?auto_1042477 ?auto_1042478 ) ) ( AVAILABLE ?auto_1042482 ) ( ON ?auto_1042477 ?auto_1042476 ) ( not ( = ?auto_1042476 ?auto_1042477 ) ) ( not ( = ?auto_1042476 ?auto_1042478 ) ) ( TRUCK-AT ?auto_1042480 ?auto_1042483 ) ( not ( = ?auto_1042483 ?auto_1042481 ) ) ( HOIST-AT ?auto_1042479 ?auto_1042483 ) ( LIFTING ?auto_1042479 ?auto_1042478 ) ( not ( = ?auto_1042482 ?auto_1042479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042477 ?auto_1042478 )
      ( MAKE-2CRATE-VERIFY ?auto_1042476 ?auto_1042477 ?auto_1042478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042484 - SURFACE
      ?auto_1042485 - SURFACE
    )
    :vars
    (
      ?auto_1042486 - HOIST
      ?auto_1042490 - PLACE
      ?auto_1042487 - SURFACE
      ?auto_1042491 - TRUCK
      ?auto_1042488 - PLACE
      ?auto_1042489 - HOIST
      ?auto_1042492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042486 ?auto_1042490 ) ( SURFACE-AT ?auto_1042484 ?auto_1042490 ) ( CLEAR ?auto_1042484 ) ( IS-CRATE ?auto_1042485 ) ( not ( = ?auto_1042484 ?auto_1042485 ) ) ( AVAILABLE ?auto_1042486 ) ( ON ?auto_1042484 ?auto_1042487 ) ( not ( = ?auto_1042487 ?auto_1042484 ) ) ( not ( = ?auto_1042487 ?auto_1042485 ) ) ( TRUCK-AT ?auto_1042491 ?auto_1042488 ) ( not ( = ?auto_1042488 ?auto_1042490 ) ) ( HOIST-AT ?auto_1042489 ?auto_1042488 ) ( not ( = ?auto_1042486 ?auto_1042489 ) ) ( AVAILABLE ?auto_1042489 ) ( SURFACE-AT ?auto_1042485 ?auto_1042488 ) ( ON ?auto_1042485 ?auto_1042492 ) ( CLEAR ?auto_1042485 ) ( not ( = ?auto_1042484 ?auto_1042492 ) ) ( not ( = ?auto_1042485 ?auto_1042492 ) ) ( not ( = ?auto_1042487 ?auto_1042492 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1042489 ?auto_1042485 ?auto_1042492 ?auto_1042488 )
      ( MAKE-2CRATE ?auto_1042487 ?auto_1042484 ?auto_1042485 )
      ( MAKE-1CRATE-VERIFY ?auto_1042484 ?auto_1042485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042493 - SURFACE
      ?auto_1042494 - SURFACE
      ?auto_1042495 - SURFACE
    )
    :vars
    (
      ?auto_1042501 - HOIST
      ?auto_1042499 - PLACE
      ?auto_1042500 - TRUCK
      ?auto_1042497 - PLACE
      ?auto_1042498 - HOIST
      ?auto_1042496 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042501 ?auto_1042499 ) ( SURFACE-AT ?auto_1042494 ?auto_1042499 ) ( CLEAR ?auto_1042494 ) ( IS-CRATE ?auto_1042495 ) ( not ( = ?auto_1042494 ?auto_1042495 ) ) ( AVAILABLE ?auto_1042501 ) ( ON ?auto_1042494 ?auto_1042493 ) ( not ( = ?auto_1042493 ?auto_1042494 ) ) ( not ( = ?auto_1042493 ?auto_1042495 ) ) ( TRUCK-AT ?auto_1042500 ?auto_1042497 ) ( not ( = ?auto_1042497 ?auto_1042499 ) ) ( HOIST-AT ?auto_1042498 ?auto_1042497 ) ( not ( = ?auto_1042501 ?auto_1042498 ) ) ( AVAILABLE ?auto_1042498 ) ( SURFACE-AT ?auto_1042495 ?auto_1042497 ) ( ON ?auto_1042495 ?auto_1042496 ) ( CLEAR ?auto_1042495 ) ( not ( = ?auto_1042494 ?auto_1042496 ) ) ( not ( = ?auto_1042495 ?auto_1042496 ) ) ( not ( = ?auto_1042493 ?auto_1042496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042494 ?auto_1042495 )
      ( MAKE-2CRATE-VERIFY ?auto_1042493 ?auto_1042494 ?auto_1042495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042502 - SURFACE
      ?auto_1042503 - SURFACE
    )
    :vars
    (
      ?auto_1042506 - HOIST
      ?auto_1042508 - PLACE
      ?auto_1042505 - SURFACE
      ?auto_1042507 - PLACE
      ?auto_1042504 - HOIST
      ?auto_1042510 - SURFACE
      ?auto_1042509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042506 ?auto_1042508 ) ( SURFACE-AT ?auto_1042502 ?auto_1042508 ) ( CLEAR ?auto_1042502 ) ( IS-CRATE ?auto_1042503 ) ( not ( = ?auto_1042502 ?auto_1042503 ) ) ( AVAILABLE ?auto_1042506 ) ( ON ?auto_1042502 ?auto_1042505 ) ( not ( = ?auto_1042505 ?auto_1042502 ) ) ( not ( = ?auto_1042505 ?auto_1042503 ) ) ( not ( = ?auto_1042507 ?auto_1042508 ) ) ( HOIST-AT ?auto_1042504 ?auto_1042507 ) ( not ( = ?auto_1042506 ?auto_1042504 ) ) ( AVAILABLE ?auto_1042504 ) ( SURFACE-AT ?auto_1042503 ?auto_1042507 ) ( ON ?auto_1042503 ?auto_1042510 ) ( CLEAR ?auto_1042503 ) ( not ( = ?auto_1042502 ?auto_1042510 ) ) ( not ( = ?auto_1042503 ?auto_1042510 ) ) ( not ( = ?auto_1042505 ?auto_1042510 ) ) ( TRUCK-AT ?auto_1042509 ?auto_1042508 ) )
    :subtasks
    ( ( !DRIVE ?auto_1042509 ?auto_1042508 ?auto_1042507 )
      ( MAKE-2CRATE ?auto_1042505 ?auto_1042502 ?auto_1042503 )
      ( MAKE-1CRATE-VERIFY ?auto_1042502 ?auto_1042503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042511 - SURFACE
      ?auto_1042512 - SURFACE
      ?auto_1042513 - SURFACE
    )
    :vars
    (
      ?auto_1042519 - HOIST
      ?auto_1042517 - PLACE
      ?auto_1042516 - PLACE
      ?auto_1042518 - HOIST
      ?auto_1042515 - SURFACE
      ?auto_1042514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042519 ?auto_1042517 ) ( SURFACE-AT ?auto_1042512 ?auto_1042517 ) ( CLEAR ?auto_1042512 ) ( IS-CRATE ?auto_1042513 ) ( not ( = ?auto_1042512 ?auto_1042513 ) ) ( AVAILABLE ?auto_1042519 ) ( ON ?auto_1042512 ?auto_1042511 ) ( not ( = ?auto_1042511 ?auto_1042512 ) ) ( not ( = ?auto_1042511 ?auto_1042513 ) ) ( not ( = ?auto_1042516 ?auto_1042517 ) ) ( HOIST-AT ?auto_1042518 ?auto_1042516 ) ( not ( = ?auto_1042519 ?auto_1042518 ) ) ( AVAILABLE ?auto_1042518 ) ( SURFACE-AT ?auto_1042513 ?auto_1042516 ) ( ON ?auto_1042513 ?auto_1042515 ) ( CLEAR ?auto_1042513 ) ( not ( = ?auto_1042512 ?auto_1042515 ) ) ( not ( = ?auto_1042513 ?auto_1042515 ) ) ( not ( = ?auto_1042511 ?auto_1042515 ) ) ( TRUCK-AT ?auto_1042514 ?auto_1042517 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042512 ?auto_1042513 )
      ( MAKE-2CRATE-VERIFY ?auto_1042511 ?auto_1042512 ?auto_1042513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042520 - SURFACE
      ?auto_1042521 - SURFACE
    )
    :vars
    (
      ?auto_1042528 - HOIST
      ?auto_1042525 - PLACE
      ?auto_1042527 - SURFACE
      ?auto_1042522 - PLACE
      ?auto_1042526 - HOIST
      ?auto_1042524 - SURFACE
      ?auto_1042523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042528 ?auto_1042525 ) ( IS-CRATE ?auto_1042521 ) ( not ( = ?auto_1042520 ?auto_1042521 ) ) ( not ( = ?auto_1042527 ?auto_1042520 ) ) ( not ( = ?auto_1042527 ?auto_1042521 ) ) ( not ( = ?auto_1042522 ?auto_1042525 ) ) ( HOIST-AT ?auto_1042526 ?auto_1042522 ) ( not ( = ?auto_1042528 ?auto_1042526 ) ) ( AVAILABLE ?auto_1042526 ) ( SURFACE-AT ?auto_1042521 ?auto_1042522 ) ( ON ?auto_1042521 ?auto_1042524 ) ( CLEAR ?auto_1042521 ) ( not ( = ?auto_1042520 ?auto_1042524 ) ) ( not ( = ?auto_1042521 ?auto_1042524 ) ) ( not ( = ?auto_1042527 ?auto_1042524 ) ) ( TRUCK-AT ?auto_1042523 ?auto_1042525 ) ( SURFACE-AT ?auto_1042527 ?auto_1042525 ) ( CLEAR ?auto_1042527 ) ( LIFTING ?auto_1042528 ?auto_1042520 ) ( IS-CRATE ?auto_1042520 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042527 ?auto_1042520 )
      ( MAKE-2CRATE ?auto_1042527 ?auto_1042520 ?auto_1042521 )
      ( MAKE-1CRATE-VERIFY ?auto_1042520 ?auto_1042521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042529 - SURFACE
      ?auto_1042530 - SURFACE
      ?auto_1042531 - SURFACE
    )
    :vars
    (
      ?auto_1042537 - HOIST
      ?auto_1042532 - PLACE
      ?auto_1042535 - PLACE
      ?auto_1042536 - HOIST
      ?auto_1042533 - SURFACE
      ?auto_1042534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042537 ?auto_1042532 ) ( IS-CRATE ?auto_1042531 ) ( not ( = ?auto_1042530 ?auto_1042531 ) ) ( not ( = ?auto_1042529 ?auto_1042530 ) ) ( not ( = ?auto_1042529 ?auto_1042531 ) ) ( not ( = ?auto_1042535 ?auto_1042532 ) ) ( HOIST-AT ?auto_1042536 ?auto_1042535 ) ( not ( = ?auto_1042537 ?auto_1042536 ) ) ( AVAILABLE ?auto_1042536 ) ( SURFACE-AT ?auto_1042531 ?auto_1042535 ) ( ON ?auto_1042531 ?auto_1042533 ) ( CLEAR ?auto_1042531 ) ( not ( = ?auto_1042530 ?auto_1042533 ) ) ( not ( = ?auto_1042531 ?auto_1042533 ) ) ( not ( = ?auto_1042529 ?auto_1042533 ) ) ( TRUCK-AT ?auto_1042534 ?auto_1042532 ) ( SURFACE-AT ?auto_1042529 ?auto_1042532 ) ( CLEAR ?auto_1042529 ) ( LIFTING ?auto_1042537 ?auto_1042530 ) ( IS-CRATE ?auto_1042530 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042530 ?auto_1042531 )
      ( MAKE-2CRATE-VERIFY ?auto_1042529 ?auto_1042530 ?auto_1042531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042538 - SURFACE
      ?auto_1042539 - SURFACE
    )
    :vars
    (
      ?auto_1042542 - HOIST
      ?auto_1042544 - PLACE
      ?auto_1042543 - SURFACE
      ?auto_1042546 - PLACE
      ?auto_1042541 - HOIST
      ?auto_1042545 - SURFACE
      ?auto_1042540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042542 ?auto_1042544 ) ( IS-CRATE ?auto_1042539 ) ( not ( = ?auto_1042538 ?auto_1042539 ) ) ( not ( = ?auto_1042543 ?auto_1042538 ) ) ( not ( = ?auto_1042543 ?auto_1042539 ) ) ( not ( = ?auto_1042546 ?auto_1042544 ) ) ( HOIST-AT ?auto_1042541 ?auto_1042546 ) ( not ( = ?auto_1042542 ?auto_1042541 ) ) ( AVAILABLE ?auto_1042541 ) ( SURFACE-AT ?auto_1042539 ?auto_1042546 ) ( ON ?auto_1042539 ?auto_1042545 ) ( CLEAR ?auto_1042539 ) ( not ( = ?auto_1042538 ?auto_1042545 ) ) ( not ( = ?auto_1042539 ?auto_1042545 ) ) ( not ( = ?auto_1042543 ?auto_1042545 ) ) ( TRUCK-AT ?auto_1042540 ?auto_1042544 ) ( SURFACE-AT ?auto_1042543 ?auto_1042544 ) ( CLEAR ?auto_1042543 ) ( IS-CRATE ?auto_1042538 ) ( AVAILABLE ?auto_1042542 ) ( IN ?auto_1042538 ?auto_1042540 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1042542 ?auto_1042538 ?auto_1042540 ?auto_1042544 )
      ( MAKE-2CRATE ?auto_1042543 ?auto_1042538 ?auto_1042539 )
      ( MAKE-1CRATE-VERIFY ?auto_1042538 ?auto_1042539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042547 - SURFACE
      ?auto_1042548 - SURFACE
      ?auto_1042549 - SURFACE
    )
    :vars
    (
      ?auto_1042555 - HOIST
      ?auto_1042552 - PLACE
      ?auto_1042550 - PLACE
      ?auto_1042554 - HOIST
      ?auto_1042551 - SURFACE
      ?auto_1042553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042555 ?auto_1042552 ) ( IS-CRATE ?auto_1042549 ) ( not ( = ?auto_1042548 ?auto_1042549 ) ) ( not ( = ?auto_1042547 ?auto_1042548 ) ) ( not ( = ?auto_1042547 ?auto_1042549 ) ) ( not ( = ?auto_1042550 ?auto_1042552 ) ) ( HOIST-AT ?auto_1042554 ?auto_1042550 ) ( not ( = ?auto_1042555 ?auto_1042554 ) ) ( AVAILABLE ?auto_1042554 ) ( SURFACE-AT ?auto_1042549 ?auto_1042550 ) ( ON ?auto_1042549 ?auto_1042551 ) ( CLEAR ?auto_1042549 ) ( not ( = ?auto_1042548 ?auto_1042551 ) ) ( not ( = ?auto_1042549 ?auto_1042551 ) ) ( not ( = ?auto_1042547 ?auto_1042551 ) ) ( TRUCK-AT ?auto_1042553 ?auto_1042552 ) ( SURFACE-AT ?auto_1042547 ?auto_1042552 ) ( CLEAR ?auto_1042547 ) ( IS-CRATE ?auto_1042548 ) ( AVAILABLE ?auto_1042555 ) ( IN ?auto_1042548 ?auto_1042553 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042548 ?auto_1042549 )
      ( MAKE-2CRATE-VERIFY ?auto_1042547 ?auto_1042548 ?auto_1042549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042592 - SURFACE
      ?auto_1042593 - SURFACE
    )
    :vars
    (
      ?auto_1042594 - HOIST
      ?auto_1042600 - PLACE
      ?auto_1042599 - SURFACE
      ?auto_1042597 - PLACE
      ?auto_1042595 - HOIST
      ?auto_1042596 - SURFACE
      ?auto_1042598 - TRUCK
      ?auto_1042601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042594 ?auto_1042600 ) ( SURFACE-AT ?auto_1042592 ?auto_1042600 ) ( CLEAR ?auto_1042592 ) ( IS-CRATE ?auto_1042593 ) ( not ( = ?auto_1042592 ?auto_1042593 ) ) ( AVAILABLE ?auto_1042594 ) ( ON ?auto_1042592 ?auto_1042599 ) ( not ( = ?auto_1042599 ?auto_1042592 ) ) ( not ( = ?auto_1042599 ?auto_1042593 ) ) ( not ( = ?auto_1042597 ?auto_1042600 ) ) ( HOIST-AT ?auto_1042595 ?auto_1042597 ) ( not ( = ?auto_1042594 ?auto_1042595 ) ) ( AVAILABLE ?auto_1042595 ) ( SURFACE-AT ?auto_1042593 ?auto_1042597 ) ( ON ?auto_1042593 ?auto_1042596 ) ( CLEAR ?auto_1042593 ) ( not ( = ?auto_1042592 ?auto_1042596 ) ) ( not ( = ?auto_1042593 ?auto_1042596 ) ) ( not ( = ?auto_1042599 ?auto_1042596 ) ) ( TRUCK-AT ?auto_1042598 ?auto_1042601 ) ( not ( = ?auto_1042601 ?auto_1042600 ) ) ( not ( = ?auto_1042597 ?auto_1042601 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042598 ?auto_1042601 ?auto_1042600 )
      ( MAKE-1CRATE ?auto_1042592 ?auto_1042593 )
      ( MAKE-1CRATE-VERIFY ?auto_1042592 ?auto_1042593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042631 - SURFACE
      ?auto_1042632 - SURFACE
      ?auto_1042633 - SURFACE
      ?auto_1042634 - SURFACE
    )
    :vars
    (
      ?auto_1042635 - HOIST
      ?auto_1042636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042635 ?auto_1042636 ) ( SURFACE-AT ?auto_1042633 ?auto_1042636 ) ( CLEAR ?auto_1042633 ) ( LIFTING ?auto_1042635 ?auto_1042634 ) ( IS-CRATE ?auto_1042634 ) ( not ( = ?auto_1042633 ?auto_1042634 ) ) ( ON ?auto_1042632 ?auto_1042631 ) ( ON ?auto_1042633 ?auto_1042632 ) ( not ( = ?auto_1042631 ?auto_1042632 ) ) ( not ( = ?auto_1042631 ?auto_1042633 ) ) ( not ( = ?auto_1042631 ?auto_1042634 ) ) ( not ( = ?auto_1042632 ?auto_1042633 ) ) ( not ( = ?auto_1042632 ?auto_1042634 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042633 ?auto_1042634 )
      ( MAKE-3CRATE-VERIFY ?auto_1042631 ?auto_1042632 ?auto_1042633 ?auto_1042634 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042648 - SURFACE
      ?auto_1042649 - SURFACE
      ?auto_1042650 - SURFACE
      ?auto_1042651 - SURFACE
    )
    :vars
    (
      ?auto_1042654 - HOIST
      ?auto_1042653 - PLACE
      ?auto_1042652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042654 ?auto_1042653 ) ( SURFACE-AT ?auto_1042650 ?auto_1042653 ) ( CLEAR ?auto_1042650 ) ( IS-CRATE ?auto_1042651 ) ( not ( = ?auto_1042650 ?auto_1042651 ) ) ( TRUCK-AT ?auto_1042652 ?auto_1042653 ) ( AVAILABLE ?auto_1042654 ) ( IN ?auto_1042651 ?auto_1042652 ) ( ON ?auto_1042650 ?auto_1042649 ) ( not ( = ?auto_1042649 ?auto_1042650 ) ) ( not ( = ?auto_1042649 ?auto_1042651 ) ) ( ON ?auto_1042649 ?auto_1042648 ) ( not ( = ?auto_1042648 ?auto_1042649 ) ) ( not ( = ?auto_1042648 ?auto_1042650 ) ) ( not ( = ?auto_1042648 ?auto_1042651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042649 ?auto_1042650 ?auto_1042651 )
      ( MAKE-3CRATE-VERIFY ?auto_1042648 ?auto_1042649 ?auto_1042650 ?auto_1042651 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042669 - SURFACE
      ?auto_1042670 - SURFACE
      ?auto_1042671 - SURFACE
      ?auto_1042672 - SURFACE
    )
    :vars
    (
      ?auto_1042675 - HOIST
      ?auto_1042674 - PLACE
      ?auto_1042676 - TRUCK
      ?auto_1042673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042675 ?auto_1042674 ) ( SURFACE-AT ?auto_1042671 ?auto_1042674 ) ( CLEAR ?auto_1042671 ) ( IS-CRATE ?auto_1042672 ) ( not ( = ?auto_1042671 ?auto_1042672 ) ) ( AVAILABLE ?auto_1042675 ) ( IN ?auto_1042672 ?auto_1042676 ) ( ON ?auto_1042671 ?auto_1042670 ) ( not ( = ?auto_1042670 ?auto_1042671 ) ) ( not ( = ?auto_1042670 ?auto_1042672 ) ) ( TRUCK-AT ?auto_1042676 ?auto_1042673 ) ( not ( = ?auto_1042673 ?auto_1042674 ) ) ( ON ?auto_1042670 ?auto_1042669 ) ( not ( = ?auto_1042669 ?auto_1042670 ) ) ( not ( = ?auto_1042669 ?auto_1042671 ) ) ( not ( = ?auto_1042669 ?auto_1042672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042670 ?auto_1042671 ?auto_1042672 )
      ( MAKE-3CRATE-VERIFY ?auto_1042669 ?auto_1042670 ?auto_1042671 ?auto_1042672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042693 - SURFACE
      ?auto_1042694 - SURFACE
      ?auto_1042695 - SURFACE
      ?auto_1042696 - SURFACE
    )
    :vars
    (
      ?auto_1042701 - HOIST
      ?auto_1042697 - PLACE
      ?auto_1042699 - TRUCK
      ?auto_1042700 - PLACE
      ?auto_1042698 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042701 ?auto_1042697 ) ( SURFACE-AT ?auto_1042695 ?auto_1042697 ) ( CLEAR ?auto_1042695 ) ( IS-CRATE ?auto_1042696 ) ( not ( = ?auto_1042695 ?auto_1042696 ) ) ( AVAILABLE ?auto_1042701 ) ( ON ?auto_1042695 ?auto_1042694 ) ( not ( = ?auto_1042694 ?auto_1042695 ) ) ( not ( = ?auto_1042694 ?auto_1042696 ) ) ( TRUCK-AT ?auto_1042699 ?auto_1042700 ) ( not ( = ?auto_1042700 ?auto_1042697 ) ) ( HOIST-AT ?auto_1042698 ?auto_1042700 ) ( LIFTING ?auto_1042698 ?auto_1042696 ) ( not ( = ?auto_1042701 ?auto_1042698 ) ) ( ON ?auto_1042694 ?auto_1042693 ) ( not ( = ?auto_1042693 ?auto_1042694 ) ) ( not ( = ?auto_1042693 ?auto_1042695 ) ) ( not ( = ?auto_1042693 ?auto_1042696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042694 ?auto_1042695 ?auto_1042696 )
      ( MAKE-3CRATE-VERIFY ?auto_1042693 ?auto_1042694 ?auto_1042695 ?auto_1042696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042720 - SURFACE
      ?auto_1042721 - SURFACE
      ?auto_1042722 - SURFACE
      ?auto_1042723 - SURFACE
    )
    :vars
    (
      ?auto_1042728 - HOIST
      ?auto_1042724 - PLACE
      ?auto_1042729 - TRUCK
      ?auto_1042726 - PLACE
      ?auto_1042727 - HOIST
      ?auto_1042725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042728 ?auto_1042724 ) ( SURFACE-AT ?auto_1042722 ?auto_1042724 ) ( CLEAR ?auto_1042722 ) ( IS-CRATE ?auto_1042723 ) ( not ( = ?auto_1042722 ?auto_1042723 ) ) ( AVAILABLE ?auto_1042728 ) ( ON ?auto_1042722 ?auto_1042721 ) ( not ( = ?auto_1042721 ?auto_1042722 ) ) ( not ( = ?auto_1042721 ?auto_1042723 ) ) ( TRUCK-AT ?auto_1042729 ?auto_1042726 ) ( not ( = ?auto_1042726 ?auto_1042724 ) ) ( HOIST-AT ?auto_1042727 ?auto_1042726 ) ( not ( = ?auto_1042728 ?auto_1042727 ) ) ( AVAILABLE ?auto_1042727 ) ( SURFACE-AT ?auto_1042723 ?auto_1042726 ) ( ON ?auto_1042723 ?auto_1042725 ) ( CLEAR ?auto_1042723 ) ( not ( = ?auto_1042722 ?auto_1042725 ) ) ( not ( = ?auto_1042723 ?auto_1042725 ) ) ( not ( = ?auto_1042721 ?auto_1042725 ) ) ( ON ?auto_1042721 ?auto_1042720 ) ( not ( = ?auto_1042720 ?auto_1042721 ) ) ( not ( = ?auto_1042720 ?auto_1042722 ) ) ( not ( = ?auto_1042720 ?auto_1042723 ) ) ( not ( = ?auto_1042720 ?auto_1042725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042721 ?auto_1042722 ?auto_1042723 )
      ( MAKE-3CRATE-VERIFY ?auto_1042720 ?auto_1042721 ?auto_1042722 ?auto_1042723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042748 - SURFACE
      ?auto_1042749 - SURFACE
      ?auto_1042750 - SURFACE
      ?auto_1042751 - SURFACE
    )
    :vars
    (
      ?auto_1042756 - HOIST
      ?auto_1042753 - PLACE
      ?auto_1042752 - PLACE
      ?auto_1042757 - HOIST
      ?auto_1042755 - SURFACE
      ?auto_1042754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042756 ?auto_1042753 ) ( SURFACE-AT ?auto_1042750 ?auto_1042753 ) ( CLEAR ?auto_1042750 ) ( IS-CRATE ?auto_1042751 ) ( not ( = ?auto_1042750 ?auto_1042751 ) ) ( AVAILABLE ?auto_1042756 ) ( ON ?auto_1042750 ?auto_1042749 ) ( not ( = ?auto_1042749 ?auto_1042750 ) ) ( not ( = ?auto_1042749 ?auto_1042751 ) ) ( not ( = ?auto_1042752 ?auto_1042753 ) ) ( HOIST-AT ?auto_1042757 ?auto_1042752 ) ( not ( = ?auto_1042756 ?auto_1042757 ) ) ( AVAILABLE ?auto_1042757 ) ( SURFACE-AT ?auto_1042751 ?auto_1042752 ) ( ON ?auto_1042751 ?auto_1042755 ) ( CLEAR ?auto_1042751 ) ( not ( = ?auto_1042750 ?auto_1042755 ) ) ( not ( = ?auto_1042751 ?auto_1042755 ) ) ( not ( = ?auto_1042749 ?auto_1042755 ) ) ( TRUCK-AT ?auto_1042754 ?auto_1042753 ) ( ON ?auto_1042749 ?auto_1042748 ) ( not ( = ?auto_1042748 ?auto_1042749 ) ) ( not ( = ?auto_1042748 ?auto_1042750 ) ) ( not ( = ?auto_1042748 ?auto_1042751 ) ) ( not ( = ?auto_1042748 ?auto_1042755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042749 ?auto_1042750 ?auto_1042751 )
      ( MAKE-3CRATE-VERIFY ?auto_1042748 ?auto_1042749 ?auto_1042750 ?auto_1042751 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042776 - SURFACE
      ?auto_1042777 - SURFACE
      ?auto_1042778 - SURFACE
      ?auto_1042779 - SURFACE
    )
    :vars
    (
      ?auto_1042785 - HOIST
      ?auto_1042783 - PLACE
      ?auto_1042782 - PLACE
      ?auto_1042781 - HOIST
      ?auto_1042780 - SURFACE
      ?auto_1042784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042785 ?auto_1042783 ) ( IS-CRATE ?auto_1042779 ) ( not ( = ?auto_1042778 ?auto_1042779 ) ) ( not ( = ?auto_1042777 ?auto_1042778 ) ) ( not ( = ?auto_1042777 ?auto_1042779 ) ) ( not ( = ?auto_1042782 ?auto_1042783 ) ) ( HOIST-AT ?auto_1042781 ?auto_1042782 ) ( not ( = ?auto_1042785 ?auto_1042781 ) ) ( AVAILABLE ?auto_1042781 ) ( SURFACE-AT ?auto_1042779 ?auto_1042782 ) ( ON ?auto_1042779 ?auto_1042780 ) ( CLEAR ?auto_1042779 ) ( not ( = ?auto_1042778 ?auto_1042780 ) ) ( not ( = ?auto_1042779 ?auto_1042780 ) ) ( not ( = ?auto_1042777 ?auto_1042780 ) ) ( TRUCK-AT ?auto_1042784 ?auto_1042783 ) ( SURFACE-AT ?auto_1042777 ?auto_1042783 ) ( CLEAR ?auto_1042777 ) ( LIFTING ?auto_1042785 ?auto_1042778 ) ( IS-CRATE ?auto_1042778 ) ( ON ?auto_1042777 ?auto_1042776 ) ( not ( = ?auto_1042776 ?auto_1042777 ) ) ( not ( = ?auto_1042776 ?auto_1042778 ) ) ( not ( = ?auto_1042776 ?auto_1042779 ) ) ( not ( = ?auto_1042776 ?auto_1042780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042777 ?auto_1042778 ?auto_1042779 )
      ( MAKE-3CRATE-VERIFY ?auto_1042776 ?auto_1042777 ?auto_1042778 ?auto_1042779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1042804 - SURFACE
      ?auto_1042805 - SURFACE
      ?auto_1042806 - SURFACE
      ?auto_1042807 - SURFACE
    )
    :vars
    (
      ?auto_1042808 - HOIST
      ?auto_1042813 - PLACE
      ?auto_1042810 - PLACE
      ?auto_1042809 - HOIST
      ?auto_1042812 - SURFACE
      ?auto_1042811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042808 ?auto_1042813 ) ( IS-CRATE ?auto_1042807 ) ( not ( = ?auto_1042806 ?auto_1042807 ) ) ( not ( = ?auto_1042805 ?auto_1042806 ) ) ( not ( = ?auto_1042805 ?auto_1042807 ) ) ( not ( = ?auto_1042810 ?auto_1042813 ) ) ( HOIST-AT ?auto_1042809 ?auto_1042810 ) ( not ( = ?auto_1042808 ?auto_1042809 ) ) ( AVAILABLE ?auto_1042809 ) ( SURFACE-AT ?auto_1042807 ?auto_1042810 ) ( ON ?auto_1042807 ?auto_1042812 ) ( CLEAR ?auto_1042807 ) ( not ( = ?auto_1042806 ?auto_1042812 ) ) ( not ( = ?auto_1042807 ?auto_1042812 ) ) ( not ( = ?auto_1042805 ?auto_1042812 ) ) ( TRUCK-AT ?auto_1042811 ?auto_1042813 ) ( SURFACE-AT ?auto_1042805 ?auto_1042813 ) ( CLEAR ?auto_1042805 ) ( IS-CRATE ?auto_1042806 ) ( AVAILABLE ?auto_1042808 ) ( IN ?auto_1042806 ?auto_1042811 ) ( ON ?auto_1042805 ?auto_1042804 ) ( not ( = ?auto_1042804 ?auto_1042805 ) ) ( not ( = ?auto_1042804 ?auto_1042806 ) ) ( not ( = ?auto_1042804 ?auto_1042807 ) ) ( not ( = ?auto_1042804 ?auto_1042812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1042805 ?auto_1042806 ?auto_1042807 )
      ( MAKE-3CRATE-VERIFY ?auto_1042804 ?auto_1042805 ?auto_1042806 ?auto_1042807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043095 - SURFACE
      ?auto_1043096 - SURFACE
      ?auto_1043097 - SURFACE
      ?auto_1043099 - SURFACE
      ?auto_1043098 - SURFACE
    )
    :vars
    (
      ?auto_1043100 - HOIST
      ?auto_1043101 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043100 ?auto_1043101 ) ( SURFACE-AT ?auto_1043099 ?auto_1043101 ) ( CLEAR ?auto_1043099 ) ( LIFTING ?auto_1043100 ?auto_1043098 ) ( IS-CRATE ?auto_1043098 ) ( not ( = ?auto_1043099 ?auto_1043098 ) ) ( ON ?auto_1043096 ?auto_1043095 ) ( ON ?auto_1043097 ?auto_1043096 ) ( ON ?auto_1043099 ?auto_1043097 ) ( not ( = ?auto_1043095 ?auto_1043096 ) ) ( not ( = ?auto_1043095 ?auto_1043097 ) ) ( not ( = ?auto_1043095 ?auto_1043099 ) ) ( not ( = ?auto_1043095 ?auto_1043098 ) ) ( not ( = ?auto_1043096 ?auto_1043097 ) ) ( not ( = ?auto_1043096 ?auto_1043099 ) ) ( not ( = ?auto_1043096 ?auto_1043098 ) ) ( not ( = ?auto_1043097 ?auto_1043099 ) ) ( not ( = ?auto_1043097 ?auto_1043098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043099 ?auto_1043098 )
      ( MAKE-4CRATE-VERIFY ?auto_1043095 ?auto_1043096 ?auto_1043097 ?auto_1043099 ?auto_1043098 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043120 - SURFACE
      ?auto_1043121 - SURFACE
      ?auto_1043122 - SURFACE
      ?auto_1043124 - SURFACE
      ?auto_1043123 - SURFACE
    )
    :vars
    (
      ?auto_1043126 - HOIST
      ?auto_1043127 - PLACE
      ?auto_1043125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043126 ?auto_1043127 ) ( SURFACE-AT ?auto_1043124 ?auto_1043127 ) ( CLEAR ?auto_1043124 ) ( IS-CRATE ?auto_1043123 ) ( not ( = ?auto_1043124 ?auto_1043123 ) ) ( TRUCK-AT ?auto_1043125 ?auto_1043127 ) ( AVAILABLE ?auto_1043126 ) ( IN ?auto_1043123 ?auto_1043125 ) ( ON ?auto_1043124 ?auto_1043122 ) ( not ( = ?auto_1043122 ?auto_1043124 ) ) ( not ( = ?auto_1043122 ?auto_1043123 ) ) ( ON ?auto_1043121 ?auto_1043120 ) ( ON ?auto_1043122 ?auto_1043121 ) ( not ( = ?auto_1043120 ?auto_1043121 ) ) ( not ( = ?auto_1043120 ?auto_1043122 ) ) ( not ( = ?auto_1043120 ?auto_1043124 ) ) ( not ( = ?auto_1043120 ?auto_1043123 ) ) ( not ( = ?auto_1043121 ?auto_1043122 ) ) ( not ( = ?auto_1043121 ?auto_1043124 ) ) ( not ( = ?auto_1043121 ?auto_1043123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043122 ?auto_1043124 ?auto_1043123 )
      ( MAKE-4CRATE-VERIFY ?auto_1043120 ?auto_1043121 ?auto_1043122 ?auto_1043124 ?auto_1043123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043150 - SURFACE
      ?auto_1043151 - SURFACE
      ?auto_1043152 - SURFACE
      ?auto_1043154 - SURFACE
      ?auto_1043153 - SURFACE
    )
    :vars
    (
      ?auto_1043158 - HOIST
      ?auto_1043155 - PLACE
      ?auto_1043156 - TRUCK
      ?auto_1043157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043158 ?auto_1043155 ) ( SURFACE-AT ?auto_1043154 ?auto_1043155 ) ( CLEAR ?auto_1043154 ) ( IS-CRATE ?auto_1043153 ) ( not ( = ?auto_1043154 ?auto_1043153 ) ) ( AVAILABLE ?auto_1043158 ) ( IN ?auto_1043153 ?auto_1043156 ) ( ON ?auto_1043154 ?auto_1043152 ) ( not ( = ?auto_1043152 ?auto_1043154 ) ) ( not ( = ?auto_1043152 ?auto_1043153 ) ) ( TRUCK-AT ?auto_1043156 ?auto_1043157 ) ( not ( = ?auto_1043157 ?auto_1043155 ) ) ( ON ?auto_1043151 ?auto_1043150 ) ( ON ?auto_1043152 ?auto_1043151 ) ( not ( = ?auto_1043150 ?auto_1043151 ) ) ( not ( = ?auto_1043150 ?auto_1043152 ) ) ( not ( = ?auto_1043150 ?auto_1043154 ) ) ( not ( = ?auto_1043150 ?auto_1043153 ) ) ( not ( = ?auto_1043151 ?auto_1043152 ) ) ( not ( = ?auto_1043151 ?auto_1043154 ) ) ( not ( = ?auto_1043151 ?auto_1043153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043152 ?auto_1043154 ?auto_1043153 )
      ( MAKE-4CRATE-VERIFY ?auto_1043150 ?auto_1043151 ?auto_1043152 ?auto_1043154 ?auto_1043153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043184 - SURFACE
      ?auto_1043185 - SURFACE
      ?auto_1043186 - SURFACE
      ?auto_1043188 - SURFACE
      ?auto_1043187 - SURFACE
    )
    :vars
    (
      ?auto_1043189 - HOIST
      ?auto_1043192 - PLACE
      ?auto_1043191 - TRUCK
      ?auto_1043190 - PLACE
      ?auto_1043193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043189 ?auto_1043192 ) ( SURFACE-AT ?auto_1043188 ?auto_1043192 ) ( CLEAR ?auto_1043188 ) ( IS-CRATE ?auto_1043187 ) ( not ( = ?auto_1043188 ?auto_1043187 ) ) ( AVAILABLE ?auto_1043189 ) ( ON ?auto_1043188 ?auto_1043186 ) ( not ( = ?auto_1043186 ?auto_1043188 ) ) ( not ( = ?auto_1043186 ?auto_1043187 ) ) ( TRUCK-AT ?auto_1043191 ?auto_1043190 ) ( not ( = ?auto_1043190 ?auto_1043192 ) ) ( HOIST-AT ?auto_1043193 ?auto_1043190 ) ( LIFTING ?auto_1043193 ?auto_1043187 ) ( not ( = ?auto_1043189 ?auto_1043193 ) ) ( ON ?auto_1043185 ?auto_1043184 ) ( ON ?auto_1043186 ?auto_1043185 ) ( not ( = ?auto_1043184 ?auto_1043185 ) ) ( not ( = ?auto_1043184 ?auto_1043186 ) ) ( not ( = ?auto_1043184 ?auto_1043188 ) ) ( not ( = ?auto_1043184 ?auto_1043187 ) ) ( not ( = ?auto_1043185 ?auto_1043186 ) ) ( not ( = ?auto_1043185 ?auto_1043188 ) ) ( not ( = ?auto_1043185 ?auto_1043187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043186 ?auto_1043188 ?auto_1043187 )
      ( MAKE-4CRATE-VERIFY ?auto_1043184 ?auto_1043185 ?auto_1043186 ?auto_1043188 ?auto_1043187 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043222 - SURFACE
      ?auto_1043223 - SURFACE
      ?auto_1043224 - SURFACE
      ?auto_1043226 - SURFACE
      ?auto_1043225 - SURFACE
    )
    :vars
    (
      ?auto_1043229 - HOIST
      ?auto_1043231 - PLACE
      ?auto_1043228 - TRUCK
      ?auto_1043230 - PLACE
      ?auto_1043232 - HOIST
      ?auto_1043227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043229 ?auto_1043231 ) ( SURFACE-AT ?auto_1043226 ?auto_1043231 ) ( CLEAR ?auto_1043226 ) ( IS-CRATE ?auto_1043225 ) ( not ( = ?auto_1043226 ?auto_1043225 ) ) ( AVAILABLE ?auto_1043229 ) ( ON ?auto_1043226 ?auto_1043224 ) ( not ( = ?auto_1043224 ?auto_1043226 ) ) ( not ( = ?auto_1043224 ?auto_1043225 ) ) ( TRUCK-AT ?auto_1043228 ?auto_1043230 ) ( not ( = ?auto_1043230 ?auto_1043231 ) ) ( HOIST-AT ?auto_1043232 ?auto_1043230 ) ( not ( = ?auto_1043229 ?auto_1043232 ) ) ( AVAILABLE ?auto_1043232 ) ( SURFACE-AT ?auto_1043225 ?auto_1043230 ) ( ON ?auto_1043225 ?auto_1043227 ) ( CLEAR ?auto_1043225 ) ( not ( = ?auto_1043226 ?auto_1043227 ) ) ( not ( = ?auto_1043225 ?auto_1043227 ) ) ( not ( = ?auto_1043224 ?auto_1043227 ) ) ( ON ?auto_1043223 ?auto_1043222 ) ( ON ?auto_1043224 ?auto_1043223 ) ( not ( = ?auto_1043222 ?auto_1043223 ) ) ( not ( = ?auto_1043222 ?auto_1043224 ) ) ( not ( = ?auto_1043222 ?auto_1043226 ) ) ( not ( = ?auto_1043222 ?auto_1043225 ) ) ( not ( = ?auto_1043222 ?auto_1043227 ) ) ( not ( = ?auto_1043223 ?auto_1043224 ) ) ( not ( = ?auto_1043223 ?auto_1043226 ) ) ( not ( = ?auto_1043223 ?auto_1043225 ) ) ( not ( = ?auto_1043223 ?auto_1043227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043224 ?auto_1043226 ?auto_1043225 )
      ( MAKE-4CRATE-VERIFY ?auto_1043222 ?auto_1043223 ?auto_1043224 ?auto_1043226 ?auto_1043225 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043261 - SURFACE
      ?auto_1043262 - SURFACE
      ?auto_1043263 - SURFACE
      ?auto_1043265 - SURFACE
      ?auto_1043264 - SURFACE
    )
    :vars
    (
      ?auto_1043269 - HOIST
      ?auto_1043268 - PLACE
      ?auto_1043267 - PLACE
      ?auto_1043266 - HOIST
      ?auto_1043270 - SURFACE
      ?auto_1043271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043269 ?auto_1043268 ) ( SURFACE-AT ?auto_1043265 ?auto_1043268 ) ( CLEAR ?auto_1043265 ) ( IS-CRATE ?auto_1043264 ) ( not ( = ?auto_1043265 ?auto_1043264 ) ) ( AVAILABLE ?auto_1043269 ) ( ON ?auto_1043265 ?auto_1043263 ) ( not ( = ?auto_1043263 ?auto_1043265 ) ) ( not ( = ?auto_1043263 ?auto_1043264 ) ) ( not ( = ?auto_1043267 ?auto_1043268 ) ) ( HOIST-AT ?auto_1043266 ?auto_1043267 ) ( not ( = ?auto_1043269 ?auto_1043266 ) ) ( AVAILABLE ?auto_1043266 ) ( SURFACE-AT ?auto_1043264 ?auto_1043267 ) ( ON ?auto_1043264 ?auto_1043270 ) ( CLEAR ?auto_1043264 ) ( not ( = ?auto_1043265 ?auto_1043270 ) ) ( not ( = ?auto_1043264 ?auto_1043270 ) ) ( not ( = ?auto_1043263 ?auto_1043270 ) ) ( TRUCK-AT ?auto_1043271 ?auto_1043268 ) ( ON ?auto_1043262 ?auto_1043261 ) ( ON ?auto_1043263 ?auto_1043262 ) ( not ( = ?auto_1043261 ?auto_1043262 ) ) ( not ( = ?auto_1043261 ?auto_1043263 ) ) ( not ( = ?auto_1043261 ?auto_1043265 ) ) ( not ( = ?auto_1043261 ?auto_1043264 ) ) ( not ( = ?auto_1043261 ?auto_1043270 ) ) ( not ( = ?auto_1043262 ?auto_1043263 ) ) ( not ( = ?auto_1043262 ?auto_1043265 ) ) ( not ( = ?auto_1043262 ?auto_1043264 ) ) ( not ( = ?auto_1043262 ?auto_1043270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043263 ?auto_1043265 ?auto_1043264 )
      ( MAKE-4CRATE-VERIFY ?auto_1043261 ?auto_1043262 ?auto_1043263 ?auto_1043265 ?auto_1043264 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043300 - SURFACE
      ?auto_1043301 - SURFACE
      ?auto_1043302 - SURFACE
      ?auto_1043304 - SURFACE
      ?auto_1043303 - SURFACE
    )
    :vars
    (
      ?auto_1043307 - HOIST
      ?auto_1043305 - PLACE
      ?auto_1043309 - PLACE
      ?auto_1043310 - HOIST
      ?auto_1043306 - SURFACE
      ?auto_1043308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043307 ?auto_1043305 ) ( IS-CRATE ?auto_1043303 ) ( not ( = ?auto_1043304 ?auto_1043303 ) ) ( not ( = ?auto_1043302 ?auto_1043304 ) ) ( not ( = ?auto_1043302 ?auto_1043303 ) ) ( not ( = ?auto_1043309 ?auto_1043305 ) ) ( HOIST-AT ?auto_1043310 ?auto_1043309 ) ( not ( = ?auto_1043307 ?auto_1043310 ) ) ( AVAILABLE ?auto_1043310 ) ( SURFACE-AT ?auto_1043303 ?auto_1043309 ) ( ON ?auto_1043303 ?auto_1043306 ) ( CLEAR ?auto_1043303 ) ( not ( = ?auto_1043304 ?auto_1043306 ) ) ( not ( = ?auto_1043303 ?auto_1043306 ) ) ( not ( = ?auto_1043302 ?auto_1043306 ) ) ( TRUCK-AT ?auto_1043308 ?auto_1043305 ) ( SURFACE-AT ?auto_1043302 ?auto_1043305 ) ( CLEAR ?auto_1043302 ) ( LIFTING ?auto_1043307 ?auto_1043304 ) ( IS-CRATE ?auto_1043304 ) ( ON ?auto_1043301 ?auto_1043300 ) ( ON ?auto_1043302 ?auto_1043301 ) ( not ( = ?auto_1043300 ?auto_1043301 ) ) ( not ( = ?auto_1043300 ?auto_1043302 ) ) ( not ( = ?auto_1043300 ?auto_1043304 ) ) ( not ( = ?auto_1043300 ?auto_1043303 ) ) ( not ( = ?auto_1043300 ?auto_1043306 ) ) ( not ( = ?auto_1043301 ?auto_1043302 ) ) ( not ( = ?auto_1043301 ?auto_1043304 ) ) ( not ( = ?auto_1043301 ?auto_1043303 ) ) ( not ( = ?auto_1043301 ?auto_1043306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043302 ?auto_1043304 ?auto_1043303 )
      ( MAKE-4CRATE-VERIFY ?auto_1043300 ?auto_1043301 ?auto_1043302 ?auto_1043304 ?auto_1043303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043339 - SURFACE
      ?auto_1043340 - SURFACE
      ?auto_1043341 - SURFACE
      ?auto_1043343 - SURFACE
      ?auto_1043342 - SURFACE
    )
    :vars
    (
      ?auto_1043346 - HOIST
      ?auto_1043347 - PLACE
      ?auto_1043345 - PLACE
      ?auto_1043344 - HOIST
      ?auto_1043348 - SURFACE
      ?auto_1043349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043346 ?auto_1043347 ) ( IS-CRATE ?auto_1043342 ) ( not ( = ?auto_1043343 ?auto_1043342 ) ) ( not ( = ?auto_1043341 ?auto_1043343 ) ) ( not ( = ?auto_1043341 ?auto_1043342 ) ) ( not ( = ?auto_1043345 ?auto_1043347 ) ) ( HOIST-AT ?auto_1043344 ?auto_1043345 ) ( not ( = ?auto_1043346 ?auto_1043344 ) ) ( AVAILABLE ?auto_1043344 ) ( SURFACE-AT ?auto_1043342 ?auto_1043345 ) ( ON ?auto_1043342 ?auto_1043348 ) ( CLEAR ?auto_1043342 ) ( not ( = ?auto_1043343 ?auto_1043348 ) ) ( not ( = ?auto_1043342 ?auto_1043348 ) ) ( not ( = ?auto_1043341 ?auto_1043348 ) ) ( TRUCK-AT ?auto_1043349 ?auto_1043347 ) ( SURFACE-AT ?auto_1043341 ?auto_1043347 ) ( CLEAR ?auto_1043341 ) ( IS-CRATE ?auto_1043343 ) ( AVAILABLE ?auto_1043346 ) ( IN ?auto_1043343 ?auto_1043349 ) ( ON ?auto_1043340 ?auto_1043339 ) ( ON ?auto_1043341 ?auto_1043340 ) ( not ( = ?auto_1043339 ?auto_1043340 ) ) ( not ( = ?auto_1043339 ?auto_1043341 ) ) ( not ( = ?auto_1043339 ?auto_1043343 ) ) ( not ( = ?auto_1043339 ?auto_1043342 ) ) ( not ( = ?auto_1043339 ?auto_1043348 ) ) ( not ( = ?auto_1043340 ?auto_1043341 ) ) ( not ( = ?auto_1043340 ?auto_1043343 ) ) ( not ( = ?auto_1043340 ?auto_1043342 ) ) ( not ( = ?auto_1043340 ?auto_1043348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043341 ?auto_1043343 ?auto_1043342 )
      ( MAKE-4CRATE-VERIFY ?auto_1043339 ?auto_1043340 ?auto_1043341 ?auto_1043343 ?auto_1043342 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1043999 - SURFACE
      ?auto_1044000 - SURFACE
      ?auto_1044001 - SURFACE
      ?auto_1044003 - SURFACE
      ?auto_1044002 - SURFACE
      ?auto_1044004 - SURFACE
    )
    :vars
    (
      ?auto_1044006 - HOIST
      ?auto_1044005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044006 ?auto_1044005 ) ( SURFACE-AT ?auto_1044002 ?auto_1044005 ) ( CLEAR ?auto_1044002 ) ( LIFTING ?auto_1044006 ?auto_1044004 ) ( IS-CRATE ?auto_1044004 ) ( not ( = ?auto_1044002 ?auto_1044004 ) ) ( ON ?auto_1044000 ?auto_1043999 ) ( ON ?auto_1044001 ?auto_1044000 ) ( ON ?auto_1044003 ?auto_1044001 ) ( ON ?auto_1044002 ?auto_1044003 ) ( not ( = ?auto_1043999 ?auto_1044000 ) ) ( not ( = ?auto_1043999 ?auto_1044001 ) ) ( not ( = ?auto_1043999 ?auto_1044003 ) ) ( not ( = ?auto_1043999 ?auto_1044002 ) ) ( not ( = ?auto_1043999 ?auto_1044004 ) ) ( not ( = ?auto_1044000 ?auto_1044001 ) ) ( not ( = ?auto_1044000 ?auto_1044003 ) ) ( not ( = ?auto_1044000 ?auto_1044002 ) ) ( not ( = ?auto_1044000 ?auto_1044004 ) ) ( not ( = ?auto_1044001 ?auto_1044003 ) ) ( not ( = ?auto_1044001 ?auto_1044002 ) ) ( not ( = ?auto_1044001 ?auto_1044004 ) ) ( not ( = ?auto_1044003 ?auto_1044002 ) ) ( not ( = ?auto_1044003 ?auto_1044004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1044002 ?auto_1044004 )
      ( MAKE-5CRATE-VERIFY ?auto_1043999 ?auto_1044000 ?auto_1044001 ?auto_1044003 ?auto_1044002 ?auto_1044004 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044033 - SURFACE
      ?auto_1044034 - SURFACE
      ?auto_1044035 - SURFACE
      ?auto_1044037 - SURFACE
      ?auto_1044036 - SURFACE
      ?auto_1044038 - SURFACE
    )
    :vars
    (
      ?auto_1044041 - HOIST
      ?auto_1044040 - PLACE
      ?auto_1044039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044041 ?auto_1044040 ) ( SURFACE-AT ?auto_1044036 ?auto_1044040 ) ( CLEAR ?auto_1044036 ) ( IS-CRATE ?auto_1044038 ) ( not ( = ?auto_1044036 ?auto_1044038 ) ) ( TRUCK-AT ?auto_1044039 ?auto_1044040 ) ( AVAILABLE ?auto_1044041 ) ( IN ?auto_1044038 ?auto_1044039 ) ( ON ?auto_1044036 ?auto_1044037 ) ( not ( = ?auto_1044037 ?auto_1044036 ) ) ( not ( = ?auto_1044037 ?auto_1044038 ) ) ( ON ?auto_1044034 ?auto_1044033 ) ( ON ?auto_1044035 ?auto_1044034 ) ( ON ?auto_1044037 ?auto_1044035 ) ( not ( = ?auto_1044033 ?auto_1044034 ) ) ( not ( = ?auto_1044033 ?auto_1044035 ) ) ( not ( = ?auto_1044033 ?auto_1044037 ) ) ( not ( = ?auto_1044033 ?auto_1044036 ) ) ( not ( = ?auto_1044033 ?auto_1044038 ) ) ( not ( = ?auto_1044034 ?auto_1044035 ) ) ( not ( = ?auto_1044034 ?auto_1044037 ) ) ( not ( = ?auto_1044034 ?auto_1044036 ) ) ( not ( = ?auto_1044034 ?auto_1044038 ) ) ( not ( = ?auto_1044035 ?auto_1044037 ) ) ( not ( = ?auto_1044035 ?auto_1044036 ) ) ( not ( = ?auto_1044035 ?auto_1044038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044037 ?auto_1044036 ?auto_1044038 )
      ( MAKE-5CRATE-VERIFY ?auto_1044033 ?auto_1044034 ?auto_1044035 ?auto_1044037 ?auto_1044036 ?auto_1044038 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044073 - SURFACE
      ?auto_1044074 - SURFACE
      ?auto_1044075 - SURFACE
      ?auto_1044077 - SURFACE
      ?auto_1044076 - SURFACE
      ?auto_1044078 - SURFACE
    )
    :vars
    (
      ?auto_1044079 - HOIST
      ?auto_1044081 - PLACE
      ?auto_1044082 - TRUCK
      ?auto_1044080 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044079 ?auto_1044081 ) ( SURFACE-AT ?auto_1044076 ?auto_1044081 ) ( CLEAR ?auto_1044076 ) ( IS-CRATE ?auto_1044078 ) ( not ( = ?auto_1044076 ?auto_1044078 ) ) ( AVAILABLE ?auto_1044079 ) ( IN ?auto_1044078 ?auto_1044082 ) ( ON ?auto_1044076 ?auto_1044077 ) ( not ( = ?auto_1044077 ?auto_1044076 ) ) ( not ( = ?auto_1044077 ?auto_1044078 ) ) ( TRUCK-AT ?auto_1044082 ?auto_1044080 ) ( not ( = ?auto_1044080 ?auto_1044081 ) ) ( ON ?auto_1044074 ?auto_1044073 ) ( ON ?auto_1044075 ?auto_1044074 ) ( ON ?auto_1044077 ?auto_1044075 ) ( not ( = ?auto_1044073 ?auto_1044074 ) ) ( not ( = ?auto_1044073 ?auto_1044075 ) ) ( not ( = ?auto_1044073 ?auto_1044077 ) ) ( not ( = ?auto_1044073 ?auto_1044076 ) ) ( not ( = ?auto_1044073 ?auto_1044078 ) ) ( not ( = ?auto_1044074 ?auto_1044075 ) ) ( not ( = ?auto_1044074 ?auto_1044077 ) ) ( not ( = ?auto_1044074 ?auto_1044076 ) ) ( not ( = ?auto_1044074 ?auto_1044078 ) ) ( not ( = ?auto_1044075 ?auto_1044077 ) ) ( not ( = ?auto_1044075 ?auto_1044076 ) ) ( not ( = ?auto_1044075 ?auto_1044078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044077 ?auto_1044076 ?auto_1044078 )
      ( MAKE-5CRATE-VERIFY ?auto_1044073 ?auto_1044074 ?auto_1044075 ?auto_1044077 ?auto_1044076 ?auto_1044078 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044118 - SURFACE
      ?auto_1044119 - SURFACE
      ?auto_1044120 - SURFACE
      ?auto_1044122 - SURFACE
      ?auto_1044121 - SURFACE
      ?auto_1044123 - SURFACE
    )
    :vars
    (
      ?auto_1044126 - HOIST
      ?auto_1044128 - PLACE
      ?auto_1044125 - TRUCK
      ?auto_1044127 - PLACE
      ?auto_1044124 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044126 ?auto_1044128 ) ( SURFACE-AT ?auto_1044121 ?auto_1044128 ) ( CLEAR ?auto_1044121 ) ( IS-CRATE ?auto_1044123 ) ( not ( = ?auto_1044121 ?auto_1044123 ) ) ( AVAILABLE ?auto_1044126 ) ( ON ?auto_1044121 ?auto_1044122 ) ( not ( = ?auto_1044122 ?auto_1044121 ) ) ( not ( = ?auto_1044122 ?auto_1044123 ) ) ( TRUCK-AT ?auto_1044125 ?auto_1044127 ) ( not ( = ?auto_1044127 ?auto_1044128 ) ) ( HOIST-AT ?auto_1044124 ?auto_1044127 ) ( LIFTING ?auto_1044124 ?auto_1044123 ) ( not ( = ?auto_1044126 ?auto_1044124 ) ) ( ON ?auto_1044119 ?auto_1044118 ) ( ON ?auto_1044120 ?auto_1044119 ) ( ON ?auto_1044122 ?auto_1044120 ) ( not ( = ?auto_1044118 ?auto_1044119 ) ) ( not ( = ?auto_1044118 ?auto_1044120 ) ) ( not ( = ?auto_1044118 ?auto_1044122 ) ) ( not ( = ?auto_1044118 ?auto_1044121 ) ) ( not ( = ?auto_1044118 ?auto_1044123 ) ) ( not ( = ?auto_1044119 ?auto_1044120 ) ) ( not ( = ?auto_1044119 ?auto_1044122 ) ) ( not ( = ?auto_1044119 ?auto_1044121 ) ) ( not ( = ?auto_1044119 ?auto_1044123 ) ) ( not ( = ?auto_1044120 ?auto_1044122 ) ) ( not ( = ?auto_1044120 ?auto_1044121 ) ) ( not ( = ?auto_1044120 ?auto_1044123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044122 ?auto_1044121 ?auto_1044123 )
      ( MAKE-5CRATE-VERIFY ?auto_1044118 ?auto_1044119 ?auto_1044120 ?auto_1044122 ?auto_1044121 ?auto_1044123 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044168 - SURFACE
      ?auto_1044169 - SURFACE
      ?auto_1044170 - SURFACE
      ?auto_1044172 - SURFACE
      ?auto_1044171 - SURFACE
      ?auto_1044173 - SURFACE
    )
    :vars
    (
      ?auto_1044175 - HOIST
      ?auto_1044176 - PLACE
      ?auto_1044178 - TRUCK
      ?auto_1044177 - PLACE
      ?auto_1044174 - HOIST
      ?auto_1044179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044175 ?auto_1044176 ) ( SURFACE-AT ?auto_1044171 ?auto_1044176 ) ( CLEAR ?auto_1044171 ) ( IS-CRATE ?auto_1044173 ) ( not ( = ?auto_1044171 ?auto_1044173 ) ) ( AVAILABLE ?auto_1044175 ) ( ON ?auto_1044171 ?auto_1044172 ) ( not ( = ?auto_1044172 ?auto_1044171 ) ) ( not ( = ?auto_1044172 ?auto_1044173 ) ) ( TRUCK-AT ?auto_1044178 ?auto_1044177 ) ( not ( = ?auto_1044177 ?auto_1044176 ) ) ( HOIST-AT ?auto_1044174 ?auto_1044177 ) ( not ( = ?auto_1044175 ?auto_1044174 ) ) ( AVAILABLE ?auto_1044174 ) ( SURFACE-AT ?auto_1044173 ?auto_1044177 ) ( ON ?auto_1044173 ?auto_1044179 ) ( CLEAR ?auto_1044173 ) ( not ( = ?auto_1044171 ?auto_1044179 ) ) ( not ( = ?auto_1044173 ?auto_1044179 ) ) ( not ( = ?auto_1044172 ?auto_1044179 ) ) ( ON ?auto_1044169 ?auto_1044168 ) ( ON ?auto_1044170 ?auto_1044169 ) ( ON ?auto_1044172 ?auto_1044170 ) ( not ( = ?auto_1044168 ?auto_1044169 ) ) ( not ( = ?auto_1044168 ?auto_1044170 ) ) ( not ( = ?auto_1044168 ?auto_1044172 ) ) ( not ( = ?auto_1044168 ?auto_1044171 ) ) ( not ( = ?auto_1044168 ?auto_1044173 ) ) ( not ( = ?auto_1044168 ?auto_1044179 ) ) ( not ( = ?auto_1044169 ?auto_1044170 ) ) ( not ( = ?auto_1044169 ?auto_1044172 ) ) ( not ( = ?auto_1044169 ?auto_1044171 ) ) ( not ( = ?auto_1044169 ?auto_1044173 ) ) ( not ( = ?auto_1044169 ?auto_1044179 ) ) ( not ( = ?auto_1044170 ?auto_1044172 ) ) ( not ( = ?auto_1044170 ?auto_1044171 ) ) ( not ( = ?auto_1044170 ?auto_1044173 ) ) ( not ( = ?auto_1044170 ?auto_1044179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044172 ?auto_1044171 ?auto_1044173 )
      ( MAKE-5CRATE-VERIFY ?auto_1044168 ?auto_1044169 ?auto_1044170 ?auto_1044172 ?auto_1044171 ?auto_1044173 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044219 - SURFACE
      ?auto_1044220 - SURFACE
      ?auto_1044221 - SURFACE
      ?auto_1044223 - SURFACE
      ?auto_1044222 - SURFACE
      ?auto_1044224 - SURFACE
    )
    :vars
    (
      ?auto_1044230 - HOIST
      ?auto_1044228 - PLACE
      ?auto_1044227 - PLACE
      ?auto_1044226 - HOIST
      ?auto_1044229 - SURFACE
      ?auto_1044225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044230 ?auto_1044228 ) ( SURFACE-AT ?auto_1044222 ?auto_1044228 ) ( CLEAR ?auto_1044222 ) ( IS-CRATE ?auto_1044224 ) ( not ( = ?auto_1044222 ?auto_1044224 ) ) ( AVAILABLE ?auto_1044230 ) ( ON ?auto_1044222 ?auto_1044223 ) ( not ( = ?auto_1044223 ?auto_1044222 ) ) ( not ( = ?auto_1044223 ?auto_1044224 ) ) ( not ( = ?auto_1044227 ?auto_1044228 ) ) ( HOIST-AT ?auto_1044226 ?auto_1044227 ) ( not ( = ?auto_1044230 ?auto_1044226 ) ) ( AVAILABLE ?auto_1044226 ) ( SURFACE-AT ?auto_1044224 ?auto_1044227 ) ( ON ?auto_1044224 ?auto_1044229 ) ( CLEAR ?auto_1044224 ) ( not ( = ?auto_1044222 ?auto_1044229 ) ) ( not ( = ?auto_1044224 ?auto_1044229 ) ) ( not ( = ?auto_1044223 ?auto_1044229 ) ) ( TRUCK-AT ?auto_1044225 ?auto_1044228 ) ( ON ?auto_1044220 ?auto_1044219 ) ( ON ?auto_1044221 ?auto_1044220 ) ( ON ?auto_1044223 ?auto_1044221 ) ( not ( = ?auto_1044219 ?auto_1044220 ) ) ( not ( = ?auto_1044219 ?auto_1044221 ) ) ( not ( = ?auto_1044219 ?auto_1044223 ) ) ( not ( = ?auto_1044219 ?auto_1044222 ) ) ( not ( = ?auto_1044219 ?auto_1044224 ) ) ( not ( = ?auto_1044219 ?auto_1044229 ) ) ( not ( = ?auto_1044220 ?auto_1044221 ) ) ( not ( = ?auto_1044220 ?auto_1044223 ) ) ( not ( = ?auto_1044220 ?auto_1044222 ) ) ( not ( = ?auto_1044220 ?auto_1044224 ) ) ( not ( = ?auto_1044220 ?auto_1044229 ) ) ( not ( = ?auto_1044221 ?auto_1044223 ) ) ( not ( = ?auto_1044221 ?auto_1044222 ) ) ( not ( = ?auto_1044221 ?auto_1044224 ) ) ( not ( = ?auto_1044221 ?auto_1044229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044223 ?auto_1044222 ?auto_1044224 )
      ( MAKE-5CRATE-VERIFY ?auto_1044219 ?auto_1044220 ?auto_1044221 ?auto_1044223 ?auto_1044222 ?auto_1044224 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044270 - SURFACE
      ?auto_1044271 - SURFACE
      ?auto_1044272 - SURFACE
      ?auto_1044274 - SURFACE
      ?auto_1044273 - SURFACE
      ?auto_1044275 - SURFACE
    )
    :vars
    (
      ?auto_1044278 - HOIST
      ?auto_1044280 - PLACE
      ?auto_1044276 - PLACE
      ?auto_1044281 - HOIST
      ?auto_1044277 - SURFACE
      ?auto_1044279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044278 ?auto_1044280 ) ( IS-CRATE ?auto_1044275 ) ( not ( = ?auto_1044273 ?auto_1044275 ) ) ( not ( = ?auto_1044274 ?auto_1044273 ) ) ( not ( = ?auto_1044274 ?auto_1044275 ) ) ( not ( = ?auto_1044276 ?auto_1044280 ) ) ( HOIST-AT ?auto_1044281 ?auto_1044276 ) ( not ( = ?auto_1044278 ?auto_1044281 ) ) ( AVAILABLE ?auto_1044281 ) ( SURFACE-AT ?auto_1044275 ?auto_1044276 ) ( ON ?auto_1044275 ?auto_1044277 ) ( CLEAR ?auto_1044275 ) ( not ( = ?auto_1044273 ?auto_1044277 ) ) ( not ( = ?auto_1044275 ?auto_1044277 ) ) ( not ( = ?auto_1044274 ?auto_1044277 ) ) ( TRUCK-AT ?auto_1044279 ?auto_1044280 ) ( SURFACE-AT ?auto_1044274 ?auto_1044280 ) ( CLEAR ?auto_1044274 ) ( LIFTING ?auto_1044278 ?auto_1044273 ) ( IS-CRATE ?auto_1044273 ) ( ON ?auto_1044271 ?auto_1044270 ) ( ON ?auto_1044272 ?auto_1044271 ) ( ON ?auto_1044274 ?auto_1044272 ) ( not ( = ?auto_1044270 ?auto_1044271 ) ) ( not ( = ?auto_1044270 ?auto_1044272 ) ) ( not ( = ?auto_1044270 ?auto_1044274 ) ) ( not ( = ?auto_1044270 ?auto_1044273 ) ) ( not ( = ?auto_1044270 ?auto_1044275 ) ) ( not ( = ?auto_1044270 ?auto_1044277 ) ) ( not ( = ?auto_1044271 ?auto_1044272 ) ) ( not ( = ?auto_1044271 ?auto_1044274 ) ) ( not ( = ?auto_1044271 ?auto_1044273 ) ) ( not ( = ?auto_1044271 ?auto_1044275 ) ) ( not ( = ?auto_1044271 ?auto_1044277 ) ) ( not ( = ?auto_1044272 ?auto_1044274 ) ) ( not ( = ?auto_1044272 ?auto_1044273 ) ) ( not ( = ?auto_1044272 ?auto_1044275 ) ) ( not ( = ?auto_1044272 ?auto_1044277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044274 ?auto_1044273 ?auto_1044275 )
      ( MAKE-5CRATE-VERIFY ?auto_1044270 ?auto_1044271 ?auto_1044272 ?auto_1044274 ?auto_1044273 ?auto_1044275 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044321 - SURFACE
      ?auto_1044322 - SURFACE
      ?auto_1044323 - SURFACE
      ?auto_1044325 - SURFACE
      ?auto_1044324 - SURFACE
      ?auto_1044326 - SURFACE
    )
    :vars
    (
      ?auto_1044332 - HOIST
      ?auto_1044331 - PLACE
      ?auto_1044329 - PLACE
      ?auto_1044327 - HOIST
      ?auto_1044330 - SURFACE
      ?auto_1044328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044332 ?auto_1044331 ) ( IS-CRATE ?auto_1044326 ) ( not ( = ?auto_1044324 ?auto_1044326 ) ) ( not ( = ?auto_1044325 ?auto_1044324 ) ) ( not ( = ?auto_1044325 ?auto_1044326 ) ) ( not ( = ?auto_1044329 ?auto_1044331 ) ) ( HOIST-AT ?auto_1044327 ?auto_1044329 ) ( not ( = ?auto_1044332 ?auto_1044327 ) ) ( AVAILABLE ?auto_1044327 ) ( SURFACE-AT ?auto_1044326 ?auto_1044329 ) ( ON ?auto_1044326 ?auto_1044330 ) ( CLEAR ?auto_1044326 ) ( not ( = ?auto_1044324 ?auto_1044330 ) ) ( not ( = ?auto_1044326 ?auto_1044330 ) ) ( not ( = ?auto_1044325 ?auto_1044330 ) ) ( TRUCK-AT ?auto_1044328 ?auto_1044331 ) ( SURFACE-AT ?auto_1044325 ?auto_1044331 ) ( CLEAR ?auto_1044325 ) ( IS-CRATE ?auto_1044324 ) ( AVAILABLE ?auto_1044332 ) ( IN ?auto_1044324 ?auto_1044328 ) ( ON ?auto_1044322 ?auto_1044321 ) ( ON ?auto_1044323 ?auto_1044322 ) ( ON ?auto_1044325 ?auto_1044323 ) ( not ( = ?auto_1044321 ?auto_1044322 ) ) ( not ( = ?auto_1044321 ?auto_1044323 ) ) ( not ( = ?auto_1044321 ?auto_1044325 ) ) ( not ( = ?auto_1044321 ?auto_1044324 ) ) ( not ( = ?auto_1044321 ?auto_1044326 ) ) ( not ( = ?auto_1044321 ?auto_1044330 ) ) ( not ( = ?auto_1044322 ?auto_1044323 ) ) ( not ( = ?auto_1044322 ?auto_1044325 ) ) ( not ( = ?auto_1044322 ?auto_1044324 ) ) ( not ( = ?auto_1044322 ?auto_1044326 ) ) ( not ( = ?auto_1044322 ?auto_1044330 ) ) ( not ( = ?auto_1044323 ?auto_1044325 ) ) ( not ( = ?auto_1044323 ?auto_1044324 ) ) ( not ( = ?auto_1044323 ?auto_1044326 ) ) ( not ( = ?auto_1044323 ?auto_1044330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044325 ?auto_1044324 ?auto_1044326 )
      ( MAKE-5CRATE-VERIFY ?auto_1044321 ?auto_1044322 ?auto_1044323 ?auto_1044325 ?auto_1044324 ?auto_1044326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1045313 - SURFACE
      ?auto_1045314 - SURFACE
    )
    :vars
    (
      ?auto_1045315 - HOIST
      ?auto_1045318 - PLACE
      ?auto_1045320 - SURFACE
      ?auto_1045317 - TRUCK
      ?auto_1045321 - PLACE
      ?auto_1045316 - HOIST
      ?auto_1045319 - SURFACE
      ?auto_1045322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045315 ?auto_1045318 ) ( SURFACE-AT ?auto_1045313 ?auto_1045318 ) ( CLEAR ?auto_1045313 ) ( IS-CRATE ?auto_1045314 ) ( not ( = ?auto_1045313 ?auto_1045314 ) ) ( AVAILABLE ?auto_1045315 ) ( ON ?auto_1045313 ?auto_1045320 ) ( not ( = ?auto_1045320 ?auto_1045313 ) ) ( not ( = ?auto_1045320 ?auto_1045314 ) ) ( TRUCK-AT ?auto_1045317 ?auto_1045321 ) ( not ( = ?auto_1045321 ?auto_1045318 ) ) ( HOIST-AT ?auto_1045316 ?auto_1045321 ) ( not ( = ?auto_1045315 ?auto_1045316 ) ) ( SURFACE-AT ?auto_1045314 ?auto_1045321 ) ( ON ?auto_1045314 ?auto_1045319 ) ( CLEAR ?auto_1045314 ) ( not ( = ?auto_1045313 ?auto_1045319 ) ) ( not ( = ?auto_1045314 ?auto_1045319 ) ) ( not ( = ?auto_1045320 ?auto_1045319 ) ) ( LIFTING ?auto_1045316 ?auto_1045322 ) ( IS-CRATE ?auto_1045322 ) ( not ( = ?auto_1045313 ?auto_1045322 ) ) ( not ( = ?auto_1045314 ?auto_1045322 ) ) ( not ( = ?auto_1045320 ?auto_1045322 ) ) ( not ( = ?auto_1045319 ?auto_1045322 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1045316 ?auto_1045322 ?auto_1045317 ?auto_1045321 )
      ( MAKE-1CRATE ?auto_1045313 ?auto_1045314 )
      ( MAKE-1CRATE-VERIFY ?auto_1045313 ?auto_1045314 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045528 - SURFACE
      ?auto_1045529 - SURFACE
      ?auto_1045530 - SURFACE
      ?auto_1045532 - SURFACE
      ?auto_1045531 - SURFACE
      ?auto_1045533 - SURFACE
      ?auto_1045534 - SURFACE
    )
    :vars
    (
      ?auto_1045536 - HOIST
      ?auto_1045535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045536 ?auto_1045535 ) ( SURFACE-AT ?auto_1045533 ?auto_1045535 ) ( CLEAR ?auto_1045533 ) ( LIFTING ?auto_1045536 ?auto_1045534 ) ( IS-CRATE ?auto_1045534 ) ( not ( = ?auto_1045533 ?auto_1045534 ) ) ( ON ?auto_1045529 ?auto_1045528 ) ( ON ?auto_1045530 ?auto_1045529 ) ( ON ?auto_1045532 ?auto_1045530 ) ( ON ?auto_1045531 ?auto_1045532 ) ( ON ?auto_1045533 ?auto_1045531 ) ( not ( = ?auto_1045528 ?auto_1045529 ) ) ( not ( = ?auto_1045528 ?auto_1045530 ) ) ( not ( = ?auto_1045528 ?auto_1045532 ) ) ( not ( = ?auto_1045528 ?auto_1045531 ) ) ( not ( = ?auto_1045528 ?auto_1045533 ) ) ( not ( = ?auto_1045528 ?auto_1045534 ) ) ( not ( = ?auto_1045529 ?auto_1045530 ) ) ( not ( = ?auto_1045529 ?auto_1045532 ) ) ( not ( = ?auto_1045529 ?auto_1045531 ) ) ( not ( = ?auto_1045529 ?auto_1045533 ) ) ( not ( = ?auto_1045529 ?auto_1045534 ) ) ( not ( = ?auto_1045530 ?auto_1045532 ) ) ( not ( = ?auto_1045530 ?auto_1045531 ) ) ( not ( = ?auto_1045530 ?auto_1045533 ) ) ( not ( = ?auto_1045530 ?auto_1045534 ) ) ( not ( = ?auto_1045532 ?auto_1045531 ) ) ( not ( = ?auto_1045532 ?auto_1045533 ) ) ( not ( = ?auto_1045532 ?auto_1045534 ) ) ( not ( = ?auto_1045531 ?auto_1045533 ) ) ( not ( = ?auto_1045531 ?auto_1045534 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1045533 ?auto_1045534 )
      ( MAKE-6CRATE-VERIFY ?auto_1045528 ?auto_1045529 ?auto_1045530 ?auto_1045532 ?auto_1045531 ?auto_1045533 ?auto_1045534 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045572 - SURFACE
      ?auto_1045573 - SURFACE
      ?auto_1045574 - SURFACE
      ?auto_1045576 - SURFACE
      ?auto_1045575 - SURFACE
      ?auto_1045577 - SURFACE
      ?auto_1045578 - SURFACE
    )
    :vars
    (
      ?auto_1045580 - HOIST
      ?auto_1045581 - PLACE
      ?auto_1045579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045580 ?auto_1045581 ) ( SURFACE-AT ?auto_1045577 ?auto_1045581 ) ( CLEAR ?auto_1045577 ) ( IS-CRATE ?auto_1045578 ) ( not ( = ?auto_1045577 ?auto_1045578 ) ) ( TRUCK-AT ?auto_1045579 ?auto_1045581 ) ( AVAILABLE ?auto_1045580 ) ( IN ?auto_1045578 ?auto_1045579 ) ( ON ?auto_1045577 ?auto_1045575 ) ( not ( = ?auto_1045575 ?auto_1045577 ) ) ( not ( = ?auto_1045575 ?auto_1045578 ) ) ( ON ?auto_1045573 ?auto_1045572 ) ( ON ?auto_1045574 ?auto_1045573 ) ( ON ?auto_1045576 ?auto_1045574 ) ( ON ?auto_1045575 ?auto_1045576 ) ( not ( = ?auto_1045572 ?auto_1045573 ) ) ( not ( = ?auto_1045572 ?auto_1045574 ) ) ( not ( = ?auto_1045572 ?auto_1045576 ) ) ( not ( = ?auto_1045572 ?auto_1045575 ) ) ( not ( = ?auto_1045572 ?auto_1045577 ) ) ( not ( = ?auto_1045572 ?auto_1045578 ) ) ( not ( = ?auto_1045573 ?auto_1045574 ) ) ( not ( = ?auto_1045573 ?auto_1045576 ) ) ( not ( = ?auto_1045573 ?auto_1045575 ) ) ( not ( = ?auto_1045573 ?auto_1045577 ) ) ( not ( = ?auto_1045573 ?auto_1045578 ) ) ( not ( = ?auto_1045574 ?auto_1045576 ) ) ( not ( = ?auto_1045574 ?auto_1045575 ) ) ( not ( = ?auto_1045574 ?auto_1045577 ) ) ( not ( = ?auto_1045574 ?auto_1045578 ) ) ( not ( = ?auto_1045576 ?auto_1045575 ) ) ( not ( = ?auto_1045576 ?auto_1045577 ) ) ( not ( = ?auto_1045576 ?auto_1045578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045575 ?auto_1045577 ?auto_1045578 )
      ( MAKE-6CRATE-VERIFY ?auto_1045572 ?auto_1045573 ?auto_1045574 ?auto_1045576 ?auto_1045575 ?auto_1045577 ?auto_1045578 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045623 - SURFACE
      ?auto_1045624 - SURFACE
      ?auto_1045625 - SURFACE
      ?auto_1045627 - SURFACE
      ?auto_1045626 - SURFACE
      ?auto_1045628 - SURFACE
      ?auto_1045629 - SURFACE
    )
    :vars
    (
      ?auto_1045633 - HOIST
      ?auto_1045631 - PLACE
      ?auto_1045630 - TRUCK
      ?auto_1045632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045633 ?auto_1045631 ) ( SURFACE-AT ?auto_1045628 ?auto_1045631 ) ( CLEAR ?auto_1045628 ) ( IS-CRATE ?auto_1045629 ) ( not ( = ?auto_1045628 ?auto_1045629 ) ) ( AVAILABLE ?auto_1045633 ) ( IN ?auto_1045629 ?auto_1045630 ) ( ON ?auto_1045628 ?auto_1045626 ) ( not ( = ?auto_1045626 ?auto_1045628 ) ) ( not ( = ?auto_1045626 ?auto_1045629 ) ) ( TRUCK-AT ?auto_1045630 ?auto_1045632 ) ( not ( = ?auto_1045632 ?auto_1045631 ) ) ( ON ?auto_1045624 ?auto_1045623 ) ( ON ?auto_1045625 ?auto_1045624 ) ( ON ?auto_1045627 ?auto_1045625 ) ( ON ?auto_1045626 ?auto_1045627 ) ( not ( = ?auto_1045623 ?auto_1045624 ) ) ( not ( = ?auto_1045623 ?auto_1045625 ) ) ( not ( = ?auto_1045623 ?auto_1045627 ) ) ( not ( = ?auto_1045623 ?auto_1045626 ) ) ( not ( = ?auto_1045623 ?auto_1045628 ) ) ( not ( = ?auto_1045623 ?auto_1045629 ) ) ( not ( = ?auto_1045624 ?auto_1045625 ) ) ( not ( = ?auto_1045624 ?auto_1045627 ) ) ( not ( = ?auto_1045624 ?auto_1045626 ) ) ( not ( = ?auto_1045624 ?auto_1045628 ) ) ( not ( = ?auto_1045624 ?auto_1045629 ) ) ( not ( = ?auto_1045625 ?auto_1045627 ) ) ( not ( = ?auto_1045625 ?auto_1045626 ) ) ( not ( = ?auto_1045625 ?auto_1045628 ) ) ( not ( = ?auto_1045625 ?auto_1045629 ) ) ( not ( = ?auto_1045627 ?auto_1045626 ) ) ( not ( = ?auto_1045627 ?auto_1045628 ) ) ( not ( = ?auto_1045627 ?auto_1045629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045626 ?auto_1045628 ?auto_1045629 )
      ( MAKE-6CRATE-VERIFY ?auto_1045623 ?auto_1045624 ?auto_1045625 ?auto_1045627 ?auto_1045626 ?auto_1045628 ?auto_1045629 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045680 - SURFACE
      ?auto_1045681 - SURFACE
      ?auto_1045682 - SURFACE
      ?auto_1045684 - SURFACE
      ?auto_1045683 - SURFACE
      ?auto_1045685 - SURFACE
      ?auto_1045686 - SURFACE
    )
    :vars
    (
      ?auto_1045689 - HOIST
      ?auto_1045688 - PLACE
      ?auto_1045687 - TRUCK
      ?auto_1045690 - PLACE
      ?auto_1045691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045689 ?auto_1045688 ) ( SURFACE-AT ?auto_1045685 ?auto_1045688 ) ( CLEAR ?auto_1045685 ) ( IS-CRATE ?auto_1045686 ) ( not ( = ?auto_1045685 ?auto_1045686 ) ) ( AVAILABLE ?auto_1045689 ) ( ON ?auto_1045685 ?auto_1045683 ) ( not ( = ?auto_1045683 ?auto_1045685 ) ) ( not ( = ?auto_1045683 ?auto_1045686 ) ) ( TRUCK-AT ?auto_1045687 ?auto_1045690 ) ( not ( = ?auto_1045690 ?auto_1045688 ) ) ( HOIST-AT ?auto_1045691 ?auto_1045690 ) ( LIFTING ?auto_1045691 ?auto_1045686 ) ( not ( = ?auto_1045689 ?auto_1045691 ) ) ( ON ?auto_1045681 ?auto_1045680 ) ( ON ?auto_1045682 ?auto_1045681 ) ( ON ?auto_1045684 ?auto_1045682 ) ( ON ?auto_1045683 ?auto_1045684 ) ( not ( = ?auto_1045680 ?auto_1045681 ) ) ( not ( = ?auto_1045680 ?auto_1045682 ) ) ( not ( = ?auto_1045680 ?auto_1045684 ) ) ( not ( = ?auto_1045680 ?auto_1045683 ) ) ( not ( = ?auto_1045680 ?auto_1045685 ) ) ( not ( = ?auto_1045680 ?auto_1045686 ) ) ( not ( = ?auto_1045681 ?auto_1045682 ) ) ( not ( = ?auto_1045681 ?auto_1045684 ) ) ( not ( = ?auto_1045681 ?auto_1045683 ) ) ( not ( = ?auto_1045681 ?auto_1045685 ) ) ( not ( = ?auto_1045681 ?auto_1045686 ) ) ( not ( = ?auto_1045682 ?auto_1045684 ) ) ( not ( = ?auto_1045682 ?auto_1045683 ) ) ( not ( = ?auto_1045682 ?auto_1045685 ) ) ( not ( = ?auto_1045682 ?auto_1045686 ) ) ( not ( = ?auto_1045684 ?auto_1045683 ) ) ( not ( = ?auto_1045684 ?auto_1045685 ) ) ( not ( = ?auto_1045684 ?auto_1045686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045683 ?auto_1045685 ?auto_1045686 )
      ( MAKE-6CRATE-VERIFY ?auto_1045680 ?auto_1045681 ?auto_1045682 ?auto_1045684 ?auto_1045683 ?auto_1045685 ?auto_1045686 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045743 - SURFACE
      ?auto_1045744 - SURFACE
      ?auto_1045745 - SURFACE
      ?auto_1045747 - SURFACE
      ?auto_1045746 - SURFACE
      ?auto_1045748 - SURFACE
      ?auto_1045749 - SURFACE
    )
    :vars
    (
      ?auto_1045755 - HOIST
      ?auto_1045753 - PLACE
      ?auto_1045751 - TRUCK
      ?auto_1045750 - PLACE
      ?auto_1045752 - HOIST
      ?auto_1045754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045755 ?auto_1045753 ) ( SURFACE-AT ?auto_1045748 ?auto_1045753 ) ( CLEAR ?auto_1045748 ) ( IS-CRATE ?auto_1045749 ) ( not ( = ?auto_1045748 ?auto_1045749 ) ) ( AVAILABLE ?auto_1045755 ) ( ON ?auto_1045748 ?auto_1045746 ) ( not ( = ?auto_1045746 ?auto_1045748 ) ) ( not ( = ?auto_1045746 ?auto_1045749 ) ) ( TRUCK-AT ?auto_1045751 ?auto_1045750 ) ( not ( = ?auto_1045750 ?auto_1045753 ) ) ( HOIST-AT ?auto_1045752 ?auto_1045750 ) ( not ( = ?auto_1045755 ?auto_1045752 ) ) ( AVAILABLE ?auto_1045752 ) ( SURFACE-AT ?auto_1045749 ?auto_1045750 ) ( ON ?auto_1045749 ?auto_1045754 ) ( CLEAR ?auto_1045749 ) ( not ( = ?auto_1045748 ?auto_1045754 ) ) ( not ( = ?auto_1045749 ?auto_1045754 ) ) ( not ( = ?auto_1045746 ?auto_1045754 ) ) ( ON ?auto_1045744 ?auto_1045743 ) ( ON ?auto_1045745 ?auto_1045744 ) ( ON ?auto_1045747 ?auto_1045745 ) ( ON ?auto_1045746 ?auto_1045747 ) ( not ( = ?auto_1045743 ?auto_1045744 ) ) ( not ( = ?auto_1045743 ?auto_1045745 ) ) ( not ( = ?auto_1045743 ?auto_1045747 ) ) ( not ( = ?auto_1045743 ?auto_1045746 ) ) ( not ( = ?auto_1045743 ?auto_1045748 ) ) ( not ( = ?auto_1045743 ?auto_1045749 ) ) ( not ( = ?auto_1045743 ?auto_1045754 ) ) ( not ( = ?auto_1045744 ?auto_1045745 ) ) ( not ( = ?auto_1045744 ?auto_1045747 ) ) ( not ( = ?auto_1045744 ?auto_1045746 ) ) ( not ( = ?auto_1045744 ?auto_1045748 ) ) ( not ( = ?auto_1045744 ?auto_1045749 ) ) ( not ( = ?auto_1045744 ?auto_1045754 ) ) ( not ( = ?auto_1045745 ?auto_1045747 ) ) ( not ( = ?auto_1045745 ?auto_1045746 ) ) ( not ( = ?auto_1045745 ?auto_1045748 ) ) ( not ( = ?auto_1045745 ?auto_1045749 ) ) ( not ( = ?auto_1045745 ?auto_1045754 ) ) ( not ( = ?auto_1045747 ?auto_1045746 ) ) ( not ( = ?auto_1045747 ?auto_1045748 ) ) ( not ( = ?auto_1045747 ?auto_1045749 ) ) ( not ( = ?auto_1045747 ?auto_1045754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045746 ?auto_1045748 ?auto_1045749 )
      ( MAKE-6CRATE-VERIFY ?auto_1045743 ?auto_1045744 ?auto_1045745 ?auto_1045747 ?auto_1045746 ?auto_1045748 ?auto_1045749 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045807 - SURFACE
      ?auto_1045808 - SURFACE
      ?auto_1045809 - SURFACE
      ?auto_1045811 - SURFACE
      ?auto_1045810 - SURFACE
      ?auto_1045812 - SURFACE
      ?auto_1045813 - SURFACE
    )
    :vars
    (
      ?auto_1045814 - HOIST
      ?auto_1045818 - PLACE
      ?auto_1045815 - PLACE
      ?auto_1045816 - HOIST
      ?auto_1045819 - SURFACE
      ?auto_1045817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045814 ?auto_1045818 ) ( SURFACE-AT ?auto_1045812 ?auto_1045818 ) ( CLEAR ?auto_1045812 ) ( IS-CRATE ?auto_1045813 ) ( not ( = ?auto_1045812 ?auto_1045813 ) ) ( AVAILABLE ?auto_1045814 ) ( ON ?auto_1045812 ?auto_1045810 ) ( not ( = ?auto_1045810 ?auto_1045812 ) ) ( not ( = ?auto_1045810 ?auto_1045813 ) ) ( not ( = ?auto_1045815 ?auto_1045818 ) ) ( HOIST-AT ?auto_1045816 ?auto_1045815 ) ( not ( = ?auto_1045814 ?auto_1045816 ) ) ( AVAILABLE ?auto_1045816 ) ( SURFACE-AT ?auto_1045813 ?auto_1045815 ) ( ON ?auto_1045813 ?auto_1045819 ) ( CLEAR ?auto_1045813 ) ( not ( = ?auto_1045812 ?auto_1045819 ) ) ( not ( = ?auto_1045813 ?auto_1045819 ) ) ( not ( = ?auto_1045810 ?auto_1045819 ) ) ( TRUCK-AT ?auto_1045817 ?auto_1045818 ) ( ON ?auto_1045808 ?auto_1045807 ) ( ON ?auto_1045809 ?auto_1045808 ) ( ON ?auto_1045811 ?auto_1045809 ) ( ON ?auto_1045810 ?auto_1045811 ) ( not ( = ?auto_1045807 ?auto_1045808 ) ) ( not ( = ?auto_1045807 ?auto_1045809 ) ) ( not ( = ?auto_1045807 ?auto_1045811 ) ) ( not ( = ?auto_1045807 ?auto_1045810 ) ) ( not ( = ?auto_1045807 ?auto_1045812 ) ) ( not ( = ?auto_1045807 ?auto_1045813 ) ) ( not ( = ?auto_1045807 ?auto_1045819 ) ) ( not ( = ?auto_1045808 ?auto_1045809 ) ) ( not ( = ?auto_1045808 ?auto_1045811 ) ) ( not ( = ?auto_1045808 ?auto_1045810 ) ) ( not ( = ?auto_1045808 ?auto_1045812 ) ) ( not ( = ?auto_1045808 ?auto_1045813 ) ) ( not ( = ?auto_1045808 ?auto_1045819 ) ) ( not ( = ?auto_1045809 ?auto_1045811 ) ) ( not ( = ?auto_1045809 ?auto_1045810 ) ) ( not ( = ?auto_1045809 ?auto_1045812 ) ) ( not ( = ?auto_1045809 ?auto_1045813 ) ) ( not ( = ?auto_1045809 ?auto_1045819 ) ) ( not ( = ?auto_1045811 ?auto_1045810 ) ) ( not ( = ?auto_1045811 ?auto_1045812 ) ) ( not ( = ?auto_1045811 ?auto_1045813 ) ) ( not ( = ?auto_1045811 ?auto_1045819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045810 ?auto_1045812 ?auto_1045813 )
      ( MAKE-6CRATE-VERIFY ?auto_1045807 ?auto_1045808 ?auto_1045809 ?auto_1045811 ?auto_1045810 ?auto_1045812 ?auto_1045813 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045871 - SURFACE
      ?auto_1045872 - SURFACE
      ?auto_1045873 - SURFACE
      ?auto_1045875 - SURFACE
      ?auto_1045874 - SURFACE
      ?auto_1045876 - SURFACE
      ?auto_1045877 - SURFACE
    )
    :vars
    (
      ?auto_1045878 - HOIST
      ?auto_1045881 - PLACE
      ?auto_1045880 - PLACE
      ?auto_1045879 - HOIST
      ?auto_1045882 - SURFACE
      ?auto_1045883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045878 ?auto_1045881 ) ( IS-CRATE ?auto_1045877 ) ( not ( = ?auto_1045876 ?auto_1045877 ) ) ( not ( = ?auto_1045874 ?auto_1045876 ) ) ( not ( = ?auto_1045874 ?auto_1045877 ) ) ( not ( = ?auto_1045880 ?auto_1045881 ) ) ( HOIST-AT ?auto_1045879 ?auto_1045880 ) ( not ( = ?auto_1045878 ?auto_1045879 ) ) ( AVAILABLE ?auto_1045879 ) ( SURFACE-AT ?auto_1045877 ?auto_1045880 ) ( ON ?auto_1045877 ?auto_1045882 ) ( CLEAR ?auto_1045877 ) ( not ( = ?auto_1045876 ?auto_1045882 ) ) ( not ( = ?auto_1045877 ?auto_1045882 ) ) ( not ( = ?auto_1045874 ?auto_1045882 ) ) ( TRUCK-AT ?auto_1045883 ?auto_1045881 ) ( SURFACE-AT ?auto_1045874 ?auto_1045881 ) ( CLEAR ?auto_1045874 ) ( LIFTING ?auto_1045878 ?auto_1045876 ) ( IS-CRATE ?auto_1045876 ) ( ON ?auto_1045872 ?auto_1045871 ) ( ON ?auto_1045873 ?auto_1045872 ) ( ON ?auto_1045875 ?auto_1045873 ) ( ON ?auto_1045874 ?auto_1045875 ) ( not ( = ?auto_1045871 ?auto_1045872 ) ) ( not ( = ?auto_1045871 ?auto_1045873 ) ) ( not ( = ?auto_1045871 ?auto_1045875 ) ) ( not ( = ?auto_1045871 ?auto_1045874 ) ) ( not ( = ?auto_1045871 ?auto_1045876 ) ) ( not ( = ?auto_1045871 ?auto_1045877 ) ) ( not ( = ?auto_1045871 ?auto_1045882 ) ) ( not ( = ?auto_1045872 ?auto_1045873 ) ) ( not ( = ?auto_1045872 ?auto_1045875 ) ) ( not ( = ?auto_1045872 ?auto_1045874 ) ) ( not ( = ?auto_1045872 ?auto_1045876 ) ) ( not ( = ?auto_1045872 ?auto_1045877 ) ) ( not ( = ?auto_1045872 ?auto_1045882 ) ) ( not ( = ?auto_1045873 ?auto_1045875 ) ) ( not ( = ?auto_1045873 ?auto_1045874 ) ) ( not ( = ?auto_1045873 ?auto_1045876 ) ) ( not ( = ?auto_1045873 ?auto_1045877 ) ) ( not ( = ?auto_1045873 ?auto_1045882 ) ) ( not ( = ?auto_1045875 ?auto_1045874 ) ) ( not ( = ?auto_1045875 ?auto_1045876 ) ) ( not ( = ?auto_1045875 ?auto_1045877 ) ) ( not ( = ?auto_1045875 ?auto_1045882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045874 ?auto_1045876 ?auto_1045877 )
      ( MAKE-6CRATE-VERIFY ?auto_1045871 ?auto_1045872 ?auto_1045873 ?auto_1045875 ?auto_1045874 ?auto_1045876 ?auto_1045877 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045935 - SURFACE
      ?auto_1045936 - SURFACE
      ?auto_1045937 - SURFACE
      ?auto_1045939 - SURFACE
      ?auto_1045938 - SURFACE
      ?auto_1045940 - SURFACE
      ?auto_1045941 - SURFACE
    )
    :vars
    (
      ?auto_1045944 - HOIST
      ?auto_1045942 - PLACE
      ?auto_1045947 - PLACE
      ?auto_1045943 - HOIST
      ?auto_1045946 - SURFACE
      ?auto_1045945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045944 ?auto_1045942 ) ( IS-CRATE ?auto_1045941 ) ( not ( = ?auto_1045940 ?auto_1045941 ) ) ( not ( = ?auto_1045938 ?auto_1045940 ) ) ( not ( = ?auto_1045938 ?auto_1045941 ) ) ( not ( = ?auto_1045947 ?auto_1045942 ) ) ( HOIST-AT ?auto_1045943 ?auto_1045947 ) ( not ( = ?auto_1045944 ?auto_1045943 ) ) ( AVAILABLE ?auto_1045943 ) ( SURFACE-AT ?auto_1045941 ?auto_1045947 ) ( ON ?auto_1045941 ?auto_1045946 ) ( CLEAR ?auto_1045941 ) ( not ( = ?auto_1045940 ?auto_1045946 ) ) ( not ( = ?auto_1045941 ?auto_1045946 ) ) ( not ( = ?auto_1045938 ?auto_1045946 ) ) ( TRUCK-AT ?auto_1045945 ?auto_1045942 ) ( SURFACE-AT ?auto_1045938 ?auto_1045942 ) ( CLEAR ?auto_1045938 ) ( IS-CRATE ?auto_1045940 ) ( AVAILABLE ?auto_1045944 ) ( IN ?auto_1045940 ?auto_1045945 ) ( ON ?auto_1045936 ?auto_1045935 ) ( ON ?auto_1045937 ?auto_1045936 ) ( ON ?auto_1045939 ?auto_1045937 ) ( ON ?auto_1045938 ?auto_1045939 ) ( not ( = ?auto_1045935 ?auto_1045936 ) ) ( not ( = ?auto_1045935 ?auto_1045937 ) ) ( not ( = ?auto_1045935 ?auto_1045939 ) ) ( not ( = ?auto_1045935 ?auto_1045938 ) ) ( not ( = ?auto_1045935 ?auto_1045940 ) ) ( not ( = ?auto_1045935 ?auto_1045941 ) ) ( not ( = ?auto_1045935 ?auto_1045946 ) ) ( not ( = ?auto_1045936 ?auto_1045937 ) ) ( not ( = ?auto_1045936 ?auto_1045939 ) ) ( not ( = ?auto_1045936 ?auto_1045938 ) ) ( not ( = ?auto_1045936 ?auto_1045940 ) ) ( not ( = ?auto_1045936 ?auto_1045941 ) ) ( not ( = ?auto_1045936 ?auto_1045946 ) ) ( not ( = ?auto_1045937 ?auto_1045939 ) ) ( not ( = ?auto_1045937 ?auto_1045938 ) ) ( not ( = ?auto_1045937 ?auto_1045940 ) ) ( not ( = ?auto_1045937 ?auto_1045941 ) ) ( not ( = ?auto_1045937 ?auto_1045946 ) ) ( not ( = ?auto_1045939 ?auto_1045938 ) ) ( not ( = ?auto_1045939 ?auto_1045940 ) ) ( not ( = ?auto_1045939 ?auto_1045941 ) ) ( not ( = ?auto_1045939 ?auto_1045946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045938 ?auto_1045940 ?auto_1045941 )
      ( MAKE-6CRATE-VERIFY ?auto_1045935 ?auto_1045936 ?auto_1045937 ?auto_1045939 ?auto_1045938 ?auto_1045940 ?auto_1045941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1047611 - SURFACE
      ?auto_1047612 - SURFACE
    )
    :vars
    (
      ?auto_1047614 - HOIST
      ?auto_1047616 - PLACE
      ?auto_1047613 - SURFACE
      ?auto_1047617 - PLACE
      ?auto_1047615 - HOIST
      ?auto_1047618 - SURFACE
      ?auto_1047619 - TRUCK
      ?auto_1047620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1047614 ?auto_1047616 ) ( SURFACE-AT ?auto_1047611 ?auto_1047616 ) ( CLEAR ?auto_1047611 ) ( IS-CRATE ?auto_1047612 ) ( not ( = ?auto_1047611 ?auto_1047612 ) ) ( ON ?auto_1047611 ?auto_1047613 ) ( not ( = ?auto_1047613 ?auto_1047611 ) ) ( not ( = ?auto_1047613 ?auto_1047612 ) ) ( not ( = ?auto_1047617 ?auto_1047616 ) ) ( HOIST-AT ?auto_1047615 ?auto_1047617 ) ( not ( = ?auto_1047614 ?auto_1047615 ) ) ( AVAILABLE ?auto_1047615 ) ( SURFACE-AT ?auto_1047612 ?auto_1047617 ) ( ON ?auto_1047612 ?auto_1047618 ) ( CLEAR ?auto_1047612 ) ( not ( = ?auto_1047611 ?auto_1047618 ) ) ( not ( = ?auto_1047612 ?auto_1047618 ) ) ( not ( = ?auto_1047613 ?auto_1047618 ) ) ( TRUCK-AT ?auto_1047619 ?auto_1047616 ) ( LIFTING ?auto_1047614 ?auto_1047620 ) ( IS-CRATE ?auto_1047620 ) ( not ( = ?auto_1047611 ?auto_1047620 ) ) ( not ( = ?auto_1047612 ?auto_1047620 ) ) ( not ( = ?auto_1047613 ?auto_1047620 ) ) ( not ( = ?auto_1047618 ?auto_1047620 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1047614 ?auto_1047620 ?auto_1047619 ?auto_1047616 )
      ( MAKE-1CRATE ?auto_1047611 ?auto_1047612 )
      ( MAKE-1CRATE-VERIFY ?auto_1047611 ?auto_1047612 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1047887 - SURFACE
      ?auto_1047888 - SURFACE
      ?auto_1047889 - SURFACE
      ?auto_1047891 - SURFACE
      ?auto_1047890 - SURFACE
      ?auto_1047892 - SURFACE
      ?auto_1047893 - SURFACE
      ?auto_1047894 - SURFACE
    )
    :vars
    (
      ?auto_1047895 - HOIST
      ?auto_1047896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1047895 ?auto_1047896 ) ( SURFACE-AT ?auto_1047893 ?auto_1047896 ) ( CLEAR ?auto_1047893 ) ( LIFTING ?auto_1047895 ?auto_1047894 ) ( IS-CRATE ?auto_1047894 ) ( not ( = ?auto_1047893 ?auto_1047894 ) ) ( ON ?auto_1047888 ?auto_1047887 ) ( ON ?auto_1047889 ?auto_1047888 ) ( ON ?auto_1047891 ?auto_1047889 ) ( ON ?auto_1047890 ?auto_1047891 ) ( ON ?auto_1047892 ?auto_1047890 ) ( ON ?auto_1047893 ?auto_1047892 ) ( not ( = ?auto_1047887 ?auto_1047888 ) ) ( not ( = ?auto_1047887 ?auto_1047889 ) ) ( not ( = ?auto_1047887 ?auto_1047891 ) ) ( not ( = ?auto_1047887 ?auto_1047890 ) ) ( not ( = ?auto_1047887 ?auto_1047892 ) ) ( not ( = ?auto_1047887 ?auto_1047893 ) ) ( not ( = ?auto_1047887 ?auto_1047894 ) ) ( not ( = ?auto_1047888 ?auto_1047889 ) ) ( not ( = ?auto_1047888 ?auto_1047891 ) ) ( not ( = ?auto_1047888 ?auto_1047890 ) ) ( not ( = ?auto_1047888 ?auto_1047892 ) ) ( not ( = ?auto_1047888 ?auto_1047893 ) ) ( not ( = ?auto_1047888 ?auto_1047894 ) ) ( not ( = ?auto_1047889 ?auto_1047891 ) ) ( not ( = ?auto_1047889 ?auto_1047890 ) ) ( not ( = ?auto_1047889 ?auto_1047892 ) ) ( not ( = ?auto_1047889 ?auto_1047893 ) ) ( not ( = ?auto_1047889 ?auto_1047894 ) ) ( not ( = ?auto_1047891 ?auto_1047890 ) ) ( not ( = ?auto_1047891 ?auto_1047892 ) ) ( not ( = ?auto_1047891 ?auto_1047893 ) ) ( not ( = ?auto_1047891 ?auto_1047894 ) ) ( not ( = ?auto_1047890 ?auto_1047892 ) ) ( not ( = ?auto_1047890 ?auto_1047893 ) ) ( not ( = ?auto_1047890 ?auto_1047894 ) ) ( not ( = ?auto_1047892 ?auto_1047893 ) ) ( not ( = ?auto_1047892 ?auto_1047894 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1047893 ?auto_1047894 )
      ( MAKE-7CRATE-VERIFY ?auto_1047887 ?auto_1047888 ?auto_1047889 ?auto_1047891 ?auto_1047890 ?auto_1047892 ?auto_1047893 ?auto_1047894 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1047942 - SURFACE
      ?auto_1047943 - SURFACE
      ?auto_1047944 - SURFACE
      ?auto_1047946 - SURFACE
      ?auto_1047945 - SURFACE
      ?auto_1047947 - SURFACE
      ?auto_1047948 - SURFACE
      ?auto_1047949 - SURFACE
    )
    :vars
    (
      ?auto_1047950 - HOIST
      ?auto_1047951 - PLACE
      ?auto_1047952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1047950 ?auto_1047951 ) ( SURFACE-AT ?auto_1047948 ?auto_1047951 ) ( CLEAR ?auto_1047948 ) ( IS-CRATE ?auto_1047949 ) ( not ( = ?auto_1047948 ?auto_1047949 ) ) ( TRUCK-AT ?auto_1047952 ?auto_1047951 ) ( AVAILABLE ?auto_1047950 ) ( IN ?auto_1047949 ?auto_1047952 ) ( ON ?auto_1047948 ?auto_1047947 ) ( not ( = ?auto_1047947 ?auto_1047948 ) ) ( not ( = ?auto_1047947 ?auto_1047949 ) ) ( ON ?auto_1047943 ?auto_1047942 ) ( ON ?auto_1047944 ?auto_1047943 ) ( ON ?auto_1047946 ?auto_1047944 ) ( ON ?auto_1047945 ?auto_1047946 ) ( ON ?auto_1047947 ?auto_1047945 ) ( not ( = ?auto_1047942 ?auto_1047943 ) ) ( not ( = ?auto_1047942 ?auto_1047944 ) ) ( not ( = ?auto_1047942 ?auto_1047946 ) ) ( not ( = ?auto_1047942 ?auto_1047945 ) ) ( not ( = ?auto_1047942 ?auto_1047947 ) ) ( not ( = ?auto_1047942 ?auto_1047948 ) ) ( not ( = ?auto_1047942 ?auto_1047949 ) ) ( not ( = ?auto_1047943 ?auto_1047944 ) ) ( not ( = ?auto_1047943 ?auto_1047946 ) ) ( not ( = ?auto_1047943 ?auto_1047945 ) ) ( not ( = ?auto_1047943 ?auto_1047947 ) ) ( not ( = ?auto_1047943 ?auto_1047948 ) ) ( not ( = ?auto_1047943 ?auto_1047949 ) ) ( not ( = ?auto_1047944 ?auto_1047946 ) ) ( not ( = ?auto_1047944 ?auto_1047945 ) ) ( not ( = ?auto_1047944 ?auto_1047947 ) ) ( not ( = ?auto_1047944 ?auto_1047948 ) ) ( not ( = ?auto_1047944 ?auto_1047949 ) ) ( not ( = ?auto_1047946 ?auto_1047945 ) ) ( not ( = ?auto_1047946 ?auto_1047947 ) ) ( not ( = ?auto_1047946 ?auto_1047948 ) ) ( not ( = ?auto_1047946 ?auto_1047949 ) ) ( not ( = ?auto_1047945 ?auto_1047947 ) ) ( not ( = ?auto_1047945 ?auto_1047948 ) ) ( not ( = ?auto_1047945 ?auto_1047949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1047947 ?auto_1047948 ?auto_1047949 )
      ( MAKE-7CRATE-VERIFY ?auto_1047942 ?auto_1047943 ?auto_1047944 ?auto_1047946 ?auto_1047945 ?auto_1047947 ?auto_1047948 ?auto_1047949 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048005 - SURFACE
      ?auto_1048006 - SURFACE
      ?auto_1048007 - SURFACE
      ?auto_1048009 - SURFACE
      ?auto_1048008 - SURFACE
      ?auto_1048010 - SURFACE
      ?auto_1048011 - SURFACE
      ?auto_1048012 - SURFACE
    )
    :vars
    (
      ?auto_1048013 - HOIST
      ?auto_1048015 - PLACE
      ?auto_1048014 - TRUCK
      ?auto_1048016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048013 ?auto_1048015 ) ( SURFACE-AT ?auto_1048011 ?auto_1048015 ) ( CLEAR ?auto_1048011 ) ( IS-CRATE ?auto_1048012 ) ( not ( = ?auto_1048011 ?auto_1048012 ) ) ( AVAILABLE ?auto_1048013 ) ( IN ?auto_1048012 ?auto_1048014 ) ( ON ?auto_1048011 ?auto_1048010 ) ( not ( = ?auto_1048010 ?auto_1048011 ) ) ( not ( = ?auto_1048010 ?auto_1048012 ) ) ( TRUCK-AT ?auto_1048014 ?auto_1048016 ) ( not ( = ?auto_1048016 ?auto_1048015 ) ) ( ON ?auto_1048006 ?auto_1048005 ) ( ON ?auto_1048007 ?auto_1048006 ) ( ON ?auto_1048009 ?auto_1048007 ) ( ON ?auto_1048008 ?auto_1048009 ) ( ON ?auto_1048010 ?auto_1048008 ) ( not ( = ?auto_1048005 ?auto_1048006 ) ) ( not ( = ?auto_1048005 ?auto_1048007 ) ) ( not ( = ?auto_1048005 ?auto_1048009 ) ) ( not ( = ?auto_1048005 ?auto_1048008 ) ) ( not ( = ?auto_1048005 ?auto_1048010 ) ) ( not ( = ?auto_1048005 ?auto_1048011 ) ) ( not ( = ?auto_1048005 ?auto_1048012 ) ) ( not ( = ?auto_1048006 ?auto_1048007 ) ) ( not ( = ?auto_1048006 ?auto_1048009 ) ) ( not ( = ?auto_1048006 ?auto_1048008 ) ) ( not ( = ?auto_1048006 ?auto_1048010 ) ) ( not ( = ?auto_1048006 ?auto_1048011 ) ) ( not ( = ?auto_1048006 ?auto_1048012 ) ) ( not ( = ?auto_1048007 ?auto_1048009 ) ) ( not ( = ?auto_1048007 ?auto_1048008 ) ) ( not ( = ?auto_1048007 ?auto_1048010 ) ) ( not ( = ?auto_1048007 ?auto_1048011 ) ) ( not ( = ?auto_1048007 ?auto_1048012 ) ) ( not ( = ?auto_1048009 ?auto_1048008 ) ) ( not ( = ?auto_1048009 ?auto_1048010 ) ) ( not ( = ?auto_1048009 ?auto_1048011 ) ) ( not ( = ?auto_1048009 ?auto_1048012 ) ) ( not ( = ?auto_1048008 ?auto_1048010 ) ) ( not ( = ?auto_1048008 ?auto_1048011 ) ) ( not ( = ?auto_1048008 ?auto_1048012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048010 ?auto_1048011 ?auto_1048012 )
      ( MAKE-7CRATE-VERIFY ?auto_1048005 ?auto_1048006 ?auto_1048007 ?auto_1048009 ?auto_1048008 ?auto_1048010 ?auto_1048011 ?auto_1048012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048075 - SURFACE
      ?auto_1048076 - SURFACE
      ?auto_1048077 - SURFACE
      ?auto_1048079 - SURFACE
      ?auto_1048078 - SURFACE
      ?auto_1048080 - SURFACE
      ?auto_1048081 - SURFACE
      ?auto_1048082 - SURFACE
    )
    :vars
    (
      ?auto_1048086 - HOIST
      ?auto_1048085 - PLACE
      ?auto_1048083 - TRUCK
      ?auto_1048084 - PLACE
      ?auto_1048087 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048086 ?auto_1048085 ) ( SURFACE-AT ?auto_1048081 ?auto_1048085 ) ( CLEAR ?auto_1048081 ) ( IS-CRATE ?auto_1048082 ) ( not ( = ?auto_1048081 ?auto_1048082 ) ) ( AVAILABLE ?auto_1048086 ) ( ON ?auto_1048081 ?auto_1048080 ) ( not ( = ?auto_1048080 ?auto_1048081 ) ) ( not ( = ?auto_1048080 ?auto_1048082 ) ) ( TRUCK-AT ?auto_1048083 ?auto_1048084 ) ( not ( = ?auto_1048084 ?auto_1048085 ) ) ( HOIST-AT ?auto_1048087 ?auto_1048084 ) ( LIFTING ?auto_1048087 ?auto_1048082 ) ( not ( = ?auto_1048086 ?auto_1048087 ) ) ( ON ?auto_1048076 ?auto_1048075 ) ( ON ?auto_1048077 ?auto_1048076 ) ( ON ?auto_1048079 ?auto_1048077 ) ( ON ?auto_1048078 ?auto_1048079 ) ( ON ?auto_1048080 ?auto_1048078 ) ( not ( = ?auto_1048075 ?auto_1048076 ) ) ( not ( = ?auto_1048075 ?auto_1048077 ) ) ( not ( = ?auto_1048075 ?auto_1048079 ) ) ( not ( = ?auto_1048075 ?auto_1048078 ) ) ( not ( = ?auto_1048075 ?auto_1048080 ) ) ( not ( = ?auto_1048075 ?auto_1048081 ) ) ( not ( = ?auto_1048075 ?auto_1048082 ) ) ( not ( = ?auto_1048076 ?auto_1048077 ) ) ( not ( = ?auto_1048076 ?auto_1048079 ) ) ( not ( = ?auto_1048076 ?auto_1048078 ) ) ( not ( = ?auto_1048076 ?auto_1048080 ) ) ( not ( = ?auto_1048076 ?auto_1048081 ) ) ( not ( = ?auto_1048076 ?auto_1048082 ) ) ( not ( = ?auto_1048077 ?auto_1048079 ) ) ( not ( = ?auto_1048077 ?auto_1048078 ) ) ( not ( = ?auto_1048077 ?auto_1048080 ) ) ( not ( = ?auto_1048077 ?auto_1048081 ) ) ( not ( = ?auto_1048077 ?auto_1048082 ) ) ( not ( = ?auto_1048079 ?auto_1048078 ) ) ( not ( = ?auto_1048079 ?auto_1048080 ) ) ( not ( = ?auto_1048079 ?auto_1048081 ) ) ( not ( = ?auto_1048079 ?auto_1048082 ) ) ( not ( = ?auto_1048078 ?auto_1048080 ) ) ( not ( = ?auto_1048078 ?auto_1048081 ) ) ( not ( = ?auto_1048078 ?auto_1048082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048080 ?auto_1048081 ?auto_1048082 )
      ( MAKE-7CRATE-VERIFY ?auto_1048075 ?auto_1048076 ?auto_1048077 ?auto_1048079 ?auto_1048078 ?auto_1048080 ?auto_1048081 ?auto_1048082 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048152 - SURFACE
      ?auto_1048153 - SURFACE
      ?auto_1048154 - SURFACE
      ?auto_1048156 - SURFACE
      ?auto_1048155 - SURFACE
      ?auto_1048157 - SURFACE
      ?auto_1048158 - SURFACE
      ?auto_1048159 - SURFACE
    )
    :vars
    (
      ?auto_1048165 - HOIST
      ?auto_1048160 - PLACE
      ?auto_1048161 - TRUCK
      ?auto_1048163 - PLACE
      ?auto_1048164 - HOIST
      ?auto_1048162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048165 ?auto_1048160 ) ( SURFACE-AT ?auto_1048158 ?auto_1048160 ) ( CLEAR ?auto_1048158 ) ( IS-CRATE ?auto_1048159 ) ( not ( = ?auto_1048158 ?auto_1048159 ) ) ( AVAILABLE ?auto_1048165 ) ( ON ?auto_1048158 ?auto_1048157 ) ( not ( = ?auto_1048157 ?auto_1048158 ) ) ( not ( = ?auto_1048157 ?auto_1048159 ) ) ( TRUCK-AT ?auto_1048161 ?auto_1048163 ) ( not ( = ?auto_1048163 ?auto_1048160 ) ) ( HOIST-AT ?auto_1048164 ?auto_1048163 ) ( not ( = ?auto_1048165 ?auto_1048164 ) ) ( AVAILABLE ?auto_1048164 ) ( SURFACE-AT ?auto_1048159 ?auto_1048163 ) ( ON ?auto_1048159 ?auto_1048162 ) ( CLEAR ?auto_1048159 ) ( not ( = ?auto_1048158 ?auto_1048162 ) ) ( not ( = ?auto_1048159 ?auto_1048162 ) ) ( not ( = ?auto_1048157 ?auto_1048162 ) ) ( ON ?auto_1048153 ?auto_1048152 ) ( ON ?auto_1048154 ?auto_1048153 ) ( ON ?auto_1048156 ?auto_1048154 ) ( ON ?auto_1048155 ?auto_1048156 ) ( ON ?auto_1048157 ?auto_1048155 ) ( not ( = ?auto_1048152 ?auto_1048153 ) ) ( not ( = ?auto_1048152 ?auto_1048154 ) ) ( not ( = ?auto_1048152 ?auto_1048156 ) ) ( not ( = ?auto_1048152 ?auto_1048155 ) ) ( not ( = ?auto_1048152 ?auto_1048157 ) ) ( not ( = ?auto_1048152 ?auto_1048158 ) ) ( not ( = ?auto_1048152 ?auto_1048159 ) ) ( not ( = ?auto_1048152 ?auto_1048162 ) ) ( not ( = ?auto_1048153 ?auto_1048154 ) ) ( not ( = ?auto_1048153 ?auto_1048156 ) ) ( not ( = ?auto_1048153 ?auto_1048155 ) ) ( not ( = ?auto_1048153 ?auto_1048157 ) ) ( not ( = ?auto_1048153 ?auto_1048158 ) ) ( not ( = ?auto_1048153 ?auto_1048159 ) ) ( not ( = ?auto_1048153 ?auto_1048162 ) ) ( not ( = ?auto_1048154 ?auto_1048156 ) ) ( not ( = ?auto_1048154 ?auto_1048155 ) ) ( not ( = ?auto_1048154 ?auto_1048157 ) ) ( not ( = ?auto_1048154 ?auto_1048158 ) ) ( not ( = ?auto_1048154 ?auto_1048159 ) ) ( not ( = ?auto_1048154 ?auto_1048162 ) ) ( not ( = ?auto_1048156 ?auto_1048155 ) ) ( not ( = ?auto_1048156 ?auto_1048157 ) ) ( not ( = ?auto_1048156 ?auto_1048158 ) ) ( not ( = ?auto_1048156 ?auto_1048159 ) ) ( not ( = ?auto_1048156 ?auto_1048162 ) ) ( not ( = ?auto_1048155 ?auto_1048157 ) ) ( not ( = ?auto_1048155 ?auto_1048158 ) ) ( not ( = ?auto_1048155 ?auto_1048159 ) ) ( not ( = ?auto_1048155 ?auto_1048162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048157 ?auto_1048158 ?auto_1048159 )
      ( MAKE-7CRATE-VERIFY ?auto_1048152 ?auto_1048153 ?auto_1048154 ?auto_1048156 ?auto_1048155 ?auto_1048157 ?auto_1048158 ?auto_1048159 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048230 - SURFACE
      ?auto_1048231 - SURFACE
      ?auto_1048232 - SURFACE
      ?auto_1048234 - SURFACE
      ?auto_1048233 - SURFACE
      ?auto_1048235 - SURFACE
      ?auto_1048236 - SURFACE
      ?auto_1048237 - SURFACE
    )
    :vars
    (
      ?auto_1048241 - HOIST
      ?auto_1048240 - PLACE
      ?auto_1048243 - PLACE
      ?auto_1048242 - HOIST
      ?auto_1048239 - SURFACE
      ?auto_1048238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048241 ?auto_1048240 ) ( SURFACE-AT ?auto_1048236 ?auto_1048240 ) ( CLEAR ?auto_1048236 ) ( IS-CRATE ?auto_1048237 ) ( not ( = ?auto_1048236 ?auto_1048237 ) ) ( AVAILABLE ?auto_1048241 ) ( ON ?auto_1048236 ?auto_1048235 ) ( not ( = ?auto_1048235 ?auto_1048236 ) ) ( not ( = ?auto_1048235 ?auto_1048237 ) ) ( not ( = ?auto_1048243 ?auto_1048240 ) ) ( HOIST-AT ?auto_1048242 ?auto_1048243 ) ( not ( = ?auto_1048241 ?auto_1048242 ) ) ( AVAILABLE ?auto_1048242 ) ( SURFACE-AT ?auto_1048237 ?auto_1048243 ) ( ON ?auto_1048237 ?auto_1048239 ) ( CLEAR ?auto_1048237 ) ( not ( = ?auto_1048236 ?auto_1048239 ) ) ( not ( = ?auto_1048237 ?auto_1048239 ) ) ( not ( = ?auto_1048235 ?auto_1048239 ) ) ( TRUCK-AT ?auto_1048238 ?auto_1048240 ) ( ON ?auto_1048231 ?auto_1048230 ) ( ON ?auto_1048232 ?auto_1048231 ) ( ON ?auto_1048234 ?auto_1048232 ) ( ON ?auto_1048233 ?auto_1048234 ) ( ON ?auto_1048235 ?auto_1048233 ) ( not ( = ?auto_1048230 ?auto_1048231 ) ) ( not ( = ?auto_1048230 ?auto_1048232 ) ) ( not ( = ?auto_1048230 ?auto_1048234 ) ) ( not ( = ?auto_1048230 ?auto_1048233 ) ) ( not ( = ?auto_1048230 ?auto_1048235 ) ) ( not ( = ?auto_1048230 ?auto_1048236 ) ) ( not ( = ?auto_1048230 ?auto_1048237 ) ) ( not ( = ?auto_1048230 ?auto_1048239 ) ) ( not ( = ?auto_1048231 ?auto_1048232 ) ) ( not ( = ?auto_1048231 ?auto_1048234 ) ) ( not ( = ?auto_1048231 ?auto_1048233 ) ) ( not ( = ?auto_1048231 ?auto_1048235 ) ) ( not ( = ?auto_1048231 ?auto_1048236 ) ) ( not ( = ?auto_1048231 ?auto_1048237 ) ) ( not ( = ?auto_1048231 ?auto_1048239 ) ) ( not ( = ?auto_1048232 ?auto_1048234 ) ) ( not ( = ?auto_1048232 ?auto_1048233 ) ) ( not ( = ?auto_1048232 ?auto_1048235 ) ) ( not ( = ?auto_1048232 ?auto_1048236 ) ) ( not ( = ?auto_1048232 ?auto_1048237 ) ) ( not ( = ?auto_1048232 ?auto_1048239 ) ) ( not ( = ?auto_1048234 ?auto_1048233 ) ) ( not ( = ?auto_1048234 ?auto_1048235 ) ) ( not ( = ?auto_1048234 ?auto_1048236 ) ) ( not ( = ?auto_1048234 ?auto_1048237 ) ) ( not ( = ?auto_1048234 ?auto_1048239 ) ) ( not ( = ?auto_1048233 ?auto_1048235 ) ) ( not ( = ?auto_1048233 ?auto_1048236 ) ) ( not ( = ?auto_1048233 ?auto_1048237 ) ) ( not ( = ?auto_1048233 ?auto_1048239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048235 ?auto_1048236 ?auto_1048237 )
      ( MAKE-7CRATE-VERIFY ?auto_1048230 ?auto_1048231 ?auto_1048232 ?auto_1048234 ?auto_1048233 ?auto_1048235 ?auto_1048236 ?auto_1048237 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048308 - SURFACE
      ?auto_1048309 - SURFACE
      ?auto_1048310 - SURFACE
      ?auto_1048312 - SURFACE
      ?auto_1048311 - SURFACE
      ?auto_1048313 - SURFACE
      ?auto_1048314 - SURFACE
      ?auto_1048315 - SURFACE
    )
    :vars
    (
      ?auto_1048319 - HOIST
      ?auto_1048318 - PLACE
      ?auto_1048317 - PLACE
      ?auto_1048316 - HOIST
      ?auto_1048320 - SURFACE
      ?auto_1048321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048319 ?auto_1048318 ) ( IS-CRATE ?auto_1048315 ) ( not ( = ?auto_1048314 ?auto_1048315 ) ) ( not ( = ?auto_1048313 ?auto_1048314 ) ) ( not ( = ?auto_1048313 ?auto_1048315 ) ) ( not ( = ?auto_1048317 ?auto_1048318 ) ) ( HOIST-AT ?auto_1048316 ?auto_1048317 ) ( not ( = ?auto_1048319 ?auto_1048316 ) ) ( AVAILABLE ?auto_1048316 ) ( SURFACE-AT ?auto_1048315 ?auto_1048317 ) ( ON ?auto_1048315 ?auto_1048320 ) ( CLEAR ?auto_1048315 ) ( not ( = ?auto_1048314 ?auto_1048320 ) ) ( not ( = ?auto_1048315 ?auto_1048320 ) ) ( not ( = ?auto_1048313 ?auto_1048320 ) ) ( TRUCK-AT ?auto_1048321 ?auto_1048318 ) ( SURFACE-AT ?auto_1048313 ?auto_1048318 ) ( CLEAR ?auto_1048313 ) ( LIFTING ?auto_1048319 ?auto_1048314 ) ( IS-CRATE ?auto_1048314 ) ( ON ?auto_1048309 ?auto_1048308 ) ( ON ?auto_1048310 ?auto_1048309 ) ( ON ?auto_1048312 ?auto_1048310 ) ( ON ?auto_1048311 ?auto_1048312 ) ( ON ?auto_1048313 ?auto_1048311 ) ( not ( = ?auto_1048308 ?auto_1048309 ) ) ( not ( = ?auto_1048308 ?auto_1048310 ) ) ( not ( = ?auto_1048308 ?auto_1048312 ) ) ( not ( = ?auto_1048308 ?auto_1048311 ) ) ( not ( = ?auto_1048308 ?auto_1048313 ) ) ( not ( = ?auto_1048308 ?auto_1048314 ) ) ( not ( = ?auto_1048308 ?auto_1048315 ) ) ( not ( = ?auto_1048308 ?auto_1048320 ) ) ( not ( = ?auto_1048309 ?auto_1048310 ) ) ( not ( = ?auto_1048309 ?auto_1048312 ) ) ( not ( = ?auto_1048309 ?auto_1048311 ) ) ( not ( = ?auto_1048309 ?auto_1048313 ) ) ( not ( = ?auto_1048309 ?auto_1048314 ) ) ( not ( = ?auto_1048309 ?auto_1048315 ) ) ( not ( = ?auto_1048309 ?auto_1048320 ) ) ( not ( = ?auto_1048310 ?auto_1048312 ) ) ( not ( = ?auto_1048310 ?auto_1048311 ) ) ( not ( = ?auto_1048310 ?auto_1048313 ) ) ( not ( = ?auto_1048310 ?auto_1048314 ) ) ( not ( = ?auto_1048310 ?auto_1048315 ) ) ( not ( = ?auto_1048310 ?auto_1048320 ) ) ( not ( = ?auto_1048312 ?auto_1048311 ) ) ( not ( = ?auto_1048312 ?auto_1048313 ) ) ( not ( = ?auto_1048312 ?auto_1048314 ) ) ( not ( = ?auto_1048312 ?auto_1048315 ) ) ( not ( = ?auto_1048312 ?auto_1048320 ) ) ( not ( = ?auto_1048311 ?auto_1048313 ) ) ( not ( = ?auto_1048311 ?auto_1048314 ) ) ( not ( = ?auto_1048311 ?auto_1048315 ) ) ( not ( = ?auto_1048311 ?auto_1048320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048313 ?auto_1048314 ?auto_1048315 )
      ( MAKE-7CRATE-VERIFY ?auto_1048308 ?auto_1048309 ?auto_1048310 ?auto_1048312 ?auto_1048311 ?auto_1048313 ?auto_1048314 ?auto_1048315 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048386 - SURFACE
      ?auto_1048387 - SURFACE
      ?auto_1048388 - SURFACE
      ?auto_1048390 - SURFACE
      ?auto_1048389 - SURFACE
      ?auto_1048391 - SURFACE
      ?auto_1048392 - SURFACE
      ?auto_1048393 - SURFACE
    )
    :vars
    (
      ?auto_1048398 - HOIST
      ?auto_1048397 - PLACE
      ?auto_1048395 - PLACE
      ?auto_1048394 - HOIST
      ?auto_1048396 - SURFACE
      ?auto_1048399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048398 ?auto_1048397 ) ( IS-CRATE ?auto_1048393 ) ( not ( = ?auto_1048392 ?auto_1048393 ) ) ( not ( = ?auto_1048391 ?auto_1048392 ) ) ( not ( = ?auto_1048391 ?auto_1048393 ) ) ( not ( = ?auto_1048395 ?auto_1048397 ) ) ( HOIST-AT ?auto_1048394 ?auto_1048395 ) ( not ( = ?auto_1048398 ?auto_1048394 ) ) ( AVAILABLE ?auto_1048394 ) ( SURFACE-AT ?auto_1048393 ?auto_1048395 ) ( ON ?auto_1048393 ?auto_1048396 ) ( CLEAR ?auto_1048393 ) ( not ( = ?auto_1048392 ?auto_1048396 ) ) ( not ( = ?auto_1048393 ?auto_1048396 ) ) ( not ( = ?auto_1048391 ?auto_1048396 ) ) ( TRUCK-AT ?auto_1048399 ?auto_1048397 ) ( SURFACE-AT ?auto_1048391 ?auto_1048397 ) ( CLEAR ?auto_1048391 ) ( IS-CRATE ?auto_1048392 ) ( AVAILABLE ?auto_1048398 ) ( IN ?auto_1048392 ?auto_1048399 ) ( ON ?auto_1048387 ?auto_1048386 ) ( ON ?auto_1048388 ?auto_1048387 ) ( ON ?auto_1048390 ?auto_1048388 ) ( ON ?auto_1048389 ?auto_1048390 ) ( ON ?auto_1048391 ?auto_1048389 ) ( not ( = ?auto_1048386 ?auto_1048387 ) ) ( not ( = ?auto_1048386 ?auto_1048388 ) ) ( not ( = ?auto_1048386 ?auto_1048390 ) ) ( not ( = ?auto_1048386 ?auto_1048389 ) ) ( not ( = ?auto_1048386 ?auto_1048391 ) ) ( not ( = ?auto_1048386 ?auto_1048392 ) ) ( not ( = ?auto_1048386 ?auto_1048393 ) ) ( not ( = ?auto_1048386 ?auto_1048396 ) ) ( not ( = ?auto_1048387 ?auto_1048388 ) ) ( not ( = ?auto_1048387 ?auto_1048390 ) ) ( not ( = ?auto_1048387 ?auto_1048389 ) ) ( not ( = ?auto_1048387 ?auto_1048391 ) ) ( not ( = ?auto_1048387 ?auto_1048392 ) ) ( not ( = ?auto_1048387 ?auto_1048393 ) ) ( not ( = ?auto_1048387 ?auto_1048396 ) ) ( not ( = ?auto_1048388 ?auto_1048390 ) ) ( not ( = ?auto_1048388 ?auto_1048389 ) ) ( not ( = ?auto_1048388 ?auto_1048391 ) ) ( not ( = ?auto_1048388 ?auto_1048392 ) ) ( not ( = ?auto_1048388 ?auto_1048393 ) ) ( not ( = ?auto_1048388 ?auto_1048396 ) ) ( not ( = ?auto_1048390 ?auto_1048389 ) ) ( not ( = ?auto_1048390 ?auto_1048391 ) ) ( not ( = ?auto_1048390 ?auto_1048392 ) ) ( not ( = ?auto_1048390 ?auto_1048393 ) ) ( not ( = ?auto_1048390 ?auto_1048396 ) ) ( not ( = ?auto_1048389 ?auto_1048391 ) ) ( not ( = ?auto_1048389 ?auto_1048392 ) ) ( not ( = ?auto_1048389 ?auto_1048393 ) ) ( not ( = ?auto_1048389 ?auto_1048396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048391 ?auto_1048392 ?auto_1048393 )
      ( MAKE-7CRATE-VERIFY ?auto_1048386 ?auto_1048387 ?auto_1048388 ?auto_1048390 ?auto_1048389 ?auto_1048391 ?auto_1048392 ?auto_1048393 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051305 - SURFACE
      ?auto_1051306 - SURFACE
      ?auto_1051307 - SURFACE
      ?auto_1051309 - SURFACE
      ?auto_1051308 - SURFACE
      ?auto_1051310 - SURFACE
      ?auto_1051311 - SURFACE
      ?auto_1051312 - SURFACE
      ?auto_1051313 - SURFACE
    )
    :vars
    (
      ?auto_1051314 - HOIST
      ?auto_1051315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051314 ?auto_1051315 ) ( SURFACE-AT ?auto_1051312 ?auto_1051315 ) ( CLEAR ?auto_1051312 ) ( LIFTING ?auto_1051314 ?auto_1051313 ) ( IS-CRATE ?auto_1051313 ) ( not ( = ?auto_1051312 ?auto_1051313 ) ) ( ON ?auto_1051306 ?auto_1051305 ) ( ON ?auto_1051307 ?auto_1051306 ) ( ON ?auto_1051309 ?auto_1051307 ) ( ON ?auto_1051308 ?auto_1051309 ) ( ON ?auto_1051310 ?auto_1051308 ) ( ON ?auto_1051311 ?auto_1051310 ) ( ON ?auto_1051312 ?auto_1051311 ) ( not ( = ?auto_1051305 ?auto_1051306 ) ) ( not ( = ?auto_1051305 ?auto_1051307 ) ) ( not ( = ?auto_1051305 ?auto_1051309 ) ) ( not ( = ?auto_1051305 ?auto_1051308 ) ) ( not ( = ?auto_1051305 ?auto_1051310 ) ) ( not ( = ?auto_1051305 ?auto_1051311 ) ) ( not ( = ?auto_1051305 ?auto_1051312 ) ) ( not ( = ?auto_1051305 ?auto_1051313 ) ) ( not ( = ?auto_1051306 ?auto_1051307 ) ) ( not ( = ?auto_1051306 ?auto_1051309 ) ) ( not ( = ?auto_1051306 ?auto_1051308 ) ) ( not ( = ?auto_1051306 ?auto_1051310 ) ) ( not ( = ?auto_1051306 ?auto_1051311 ) ) ( not ( = ?auto_1051306 ?auto_1051312 ) ) ( not ( = ?auto_1051306 ?auto_1051313 ) ) ( not ( = ?auto_1051307 ?auto_1051309 ) ) ( not ( = ?auto_1051307 ?auto_1051308 ) ) ( not ( = ?auto_1051307 ?auto_1051310 ) ) ( not ( = ?auto_1051307 ?auto_1051311 ) ) ( not ( = ?auto_1051307 ?auto_1051312 ) ) ( not ( = ?auto_1051307 ?auto_1051313 ) ) ( not ( = ?auto_1051309 ?auto_1051308 ) ) ( not ( = ?auto_1051309 ?auto_1051310 ) ) ( not ( = ?auto_1051309 ?auto_1051311 ) ) ( not ( = ?auto_1051309 ?auto_1051312 ) ) ( not ( = ?auto_1051309 ?auto_1051313 ) ) ( not ( = ?auto_1051308 ?auto_1051310 ) ) ( not ( = ?auto_1051308 ?auto_1051311 ) ) ( not ( = ?auto_1051308 ?auto_1051312 ) ) ( not ( = ?auto_1051308 ?auto_1051313 ) ) ( not ( = ?auto_1051310 ?auto_1051311 ) ) ( not ( = ?auto_1051310 ?auto_1051312 ) ) ( not ( = ?auto_1051310 ?auto_1051313 ) ) ( not ( = ?auto_1051311 ?auto_1051312 ) ) ( not ( = ?auto_1051311 ?auto_1051313 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1051312 ?auto_1051313 )
      ( MAKE-8CRATE-VERIFY ?auto_1051305 ?auto_1051306 ?auto_1051307 ?auto_1051309 ?auto_1051308 ?auto_1051310 ?auto_1051311 ?auto_1051312 ?auto_1051313 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051372 - SURFACE
      ?auto_1051373 - SURFACE
      ?auto_1051374 - SURFACE
      ?auto_1051376 - SURFACE
      ?auto_1051375 - SURFACE
      ?auto_1051377 - SURFACE
      ?auto_1051378 - SURFACE
      ?auto_1051379 - SURFACE
      ?auto_1051380 - SURFACE
    )
    :vars
    (
      ?auto_1051383 - HOIST
      ?auto_1051382 - PLACE
      ?auto_1051381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051383 ?auto_1051382 ) ( SURFACE-AT ?auto_1051379 ?auto_1051382 ) ( CLEAR ?auto_1051379 ) ( IS-CRATE ?auto_1051380 ) ( not ( = ?auto_1051379 ?auto_1051380 ) ) ( TRUCK-AT ?auto_1051381 ?auto_1051382 ) ( AVAILABLE ?auto_1051383 ) ( IN ?auto_1051380 ?auto_1051381 ) ( ON ?auto_1051379 ?auto_1051378 ) ( not ( = ?auto_1051378 ?auto_1051379 ) ) ( not ( = ?auto_1051378 ?auto_1051380 ) ) ( ON ?auto_1051373 ?auto_1051372 ) ( ON ?auto_1051374 ?auto_1051373 ) ( ON ?auto_1051376 ?auto_1051374 ) ( ON ?auto_1051375 ?auto_1051376 ) ( ON ?auto_1051377 ?auto_1051375 ) ( ON ?auto_1051378 ?auto_1051377 ) ( not ( = ?auto_1051372 ?auto_1051373 ) ) ( not ( = ?auto_1051372 ?auto_1051374 ) ) ( not ( = ?auto_1051372 ?auto_1051376 ) ) ( not ( = ?auto_1051372 ?auto_1051375 ) ) ( not ( = ?auto_1051372 ?auto_1051377 ) ) ( not ( = ?auto_1051372 ?auto_1051378 ) ) ( not ( = ?auto_1051372 ?auto_1051379 ) ) ( not ( = ?auto_1051372 ?auto_1051380 ) ) ( not ( = ?auto_1051373 ?auto_1051374 ) ) ( not ( = ?auto_1051373 ?auto_1051376 ) ) ( not ( = ?auto_1051373 ?auto_1051375 ) ) ( not ( = ?auto_1051373 ?auto_1051377 ) ) ( not ( = ?auto_1051373 ?auto_1051378 ) ) ( not ( = ?auto_1051373 ?auto_1051379 ) ) ( not ( = ?auto_1051373 ?auto_1051380 ) ) ( not ( = ?auto_1051374 ?auto_1051376 ) ) ( not ( = ?auto_1051374 ?auto_1051375 ) ) ( not ( = ?auto_1051374 ?auto_1051377 ) ) ( not ( = ?auto_1051374 ?auto_1051378 ) ) ( not ( = ?auto_1051374 ?auto_1051379 ) ) ( not ( = ?auto_1051374 ?auto_1051380 ) ) ( not ( = ?auto_1051376 ?auto_1051375 ) ) ( not ( = ?auto_1051376 ?auto_1051377 ) ) ( not ( = ?auto_1051376 ?auto_1051378 ) ) ( not ( = ?auto_1051376 ?auto_1051379 ) ) ( not ( = ?auto_1051376 ?auto_1051380 ) ) ( not ( = ?auto_1051375 ?auto_1051377 ) ) ( not ( = ?auto_1051375 ?auto_1051378 ) ) ( not ( = ?auto_1051375 ?auto_1051379 ) ) ( not ( = ?auto_1051375 ?auto_1051380 ) ) ( not ( = ?auto_1051377 ?auto_1051378 ) ) ( not ( = ?auto_1051377 ?auto_1051379 ) ) ( not ( = ?auto_1051377 ?auto_1051380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051378 ?auto_1051379 ?auto_1051380 )
      ( MAKE-8CRATE-VERIFY ?auto_1051372 ?auto_1051373 ?auto_1051374 ?auto_1051376 ?auto_1051375 ?auto_1051377 ?auto_1051378 ?auto_1051379 ?auto_1051380 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051448 - SURFACE
      ?auto_1051449 - SURFACE
      ?auto_1051450 - SURFACE
      ?auto_1051452 - SURFACE
      ?auto_1051451 - SURFACE
      ?auto_1051453 - SURFACE
      ?auto_1051454 - SURFACE
      ?auto_1051455 - SURFACE
      ?auto_1051456 - SURFACE
    )
    :vars
    (
      ?auto_1051459 - HOIST
      ?auto_1051460 - PLACE
      ?auto_1051458 - TRUCK
      ?auto_1051457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051459 ?auto_1051460 ) ( SURFACE-AT ?auto_1051455 ?auto_1051460 ) ( CLEAR ?auto_1051455 ) ( IS-CRATE ?auto_1051456 ) ( not ( = ?auto_1051455 ?auto_1051456 ) ) ( AVAILABLE ?auto_1051459 ) ( IN ?auto_1051456 ?auto_1051458 ) ( ON ?auto_1051455 ?auto_1051454 ) ( not ( = ?auto_1051454 ?auto_1051455 ) ) ( not ( = ?auto_1051454 ?auto_1051456 ) ) ( TRUCK-AT ?auto_1051458 ?auto_1051457 ) ( not ( = ?auto_1051457 ?auto_1051460 ) ) ( ON ?auto_1051449 ?auto_1051448 ) ( ON ?auto_1051450 ?auto_1051449 ) ( ON ?auto_1051452 ?auto_1051450 ) ( ON ?auto_1051451 ?auto_1051452 ) ( ON ?auto_1051453 ?auto_1051451 ) ( ON ?auto_1051454 ?auto_1051453 ) ( not ( = ?auto_1051448 ?auto_1051449 ) ) ( not ( = ?auto_1051448 ?auto_1051450 ) ) ( not ( = ?auto_1051448 ?auto_1051452 ) ) ( not ( = ?auto_1051448 ?auto_1051451 ) ) ( not ( = ?auto_1051448 ?auto_1051453 ) ) ( not ( = ?auto_1051448 ?auto_1051454 ) ) ( not ( = ?auto_1051448 ?auto_1051455 ) ) ( not ( = ?auto_1051448 ?auto_1051456 ) ) ( not ( = ?auto_1051449 ?auto_1051450 ) ) ( not ( = ?auto_1051449 ?auto_1051452 ) ) ( not ( = ?auto_1051449 ?auto_1051451 ) ) ( not ( = ?auto_1051449 ?auto_1051453 ) ) ( not ( = ?auto_1051449 ?auto_1051454 ) ) ( not ( = ?auto_1051449 ?auto_1051455 ) ) ( not ( = ?auto_1051449 ?auto_1051456 ) ) ( not ( = ?auto_1051450 ?auto_1051452 ) ) ( not ( = ?auto_1051450 ?auto_1051451 ) ) ( not ( = ?auto_1051450 ?auto_1051453 ) ) ( not ( = ?auto_1051450 ?auto_1051454 ) ) ( not ( = ?auto_1051450 ?auto_1051455 ) ) ( not ( = ?auto_1051450 ?auto_1051456 ) ) ( not ( = ?auto_1051452 ?auto_1051451 ) ) ( not ( = ?auto_1051452 ?auto_1051453 ) ) ( not ( = ?auto_1051452 ?auto_1051454 ) ) ( not ( = ?auto_1051452 ?auto_1051455 ) ) ( not ( = ?auto_1051452 ?auto_1051456 ) ) ( not ( = ?auto_1051451 ?auto_1051453 ) ) ( not ( = ?auto_1051451 ?auto_1051454 ) ) ( not ( = ?auto_1051451 ?auto_1051455 ) ) ( not ( = ?auto_1051451 ?auto_1051456 ) ) ( not ( = ?auto_1051453 ?auto_1051454 ) ) ( not ( = ?auto_1051453 ?auto_1051455 ) ) ( not ( = ?auto_1051453 ?auto_1051456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051454 ?auto_1051455 ?auto_1051456 )
      ( MAKE-8CRATE-VERIFY ?auto_1051448 ?auto_1051449 ?auto_1051450 ?auto_1051452 ?auto_1051451 ?auto_1051453 ?auto_1051454 ?auto_1051455 ?auto_1051456 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051532 - SURFACE
      ?auto_1051533 - SURFACE
      ?auto_1051534 - SURFACE
      ?auto_1051536 - SURFACE
      ?auto_1051535 - SURFACE
      ?auto_1051537 - SURFACE
      ?auto_1051538 - SURFACE
      ?auto_1051539 - SURFACE
      ?auto_1051540 - SURFACE
    )
    :vars
    (
      ?auto_1051545 - HOIST
      ?auto_1051544 - PLACE
      ?auto_1051541 - TRUCK
      ?auto_1051542 - PLACE
      ?auto_1051543 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051545 ?auto_1051544 ) ( SURFACE-AT ?auto_1051539 ?auto_1051544 ) ( CLEAR ?auto_1051539 ) ( IS-CRATE ?auto_1051540 ) ( not ( = ?auto_1051539 ?auto_1051540 ) ) ( AVAILABLE ?auto_1051545 ) ( ON ?auto_1051539 ?auto_1051538 ) ( not ( = ?auto_1051538 ?auto_1051539 ) ) ( not ( = ?auto_1051538 ?auto_1051540 ) ) ( TRUCK-AT ?auto_1051541 ?auto_1051542 ) ( not ( = ?auto_1051542 ?auto_1051544 ) ) ( HOIST-AT ?auto_1051543 ?auto_1051542 ) ( LIFTING ?auto_1051543 ?auto_1051540 ) ( not ( = ?auto_1051545 ?auto_1051543 ) ) ( ON ?auto_1051533 ?auto_1051532 ) ( ON ?auto_1051534 ?auto_1051533 ) ( ON ?auto_1051536 ?auto_1051534 ) ( ON ?auto_1051535 ?auto_1051536 ) ( ON ?auto_1051537 ?auto_1051535 ) ( ON ?auto_1051538 ?auto_1051537 ) ( not ( = ?auto_1051532 ?auto_1051533 ) ) ( not ( = ?auto_1051532 ?auto_1051534 ) ) ( not ( = ?auto_1051532 ?auto_1051536 ) ) ( not ( = ?auto_1051532 ?auto_1051535 ) ) ( not ( = ?auto_1051532 ?auto_1051537 ) ) ( not ( = ?auto_1051532 ?auto_1051538 ) ) ( not ( = ?auto_1051532 ?auto_1051539 ) ) ( not ( = ?auto_1051532 ?auto_1051540 ) ) ( not ( = ?auto_1051533 ?auto_1051534 ) ) ( not ( = ?auto_1051533 ?auto_1051536 ) ) ( not ( = ?auto_1051533 ?auto_1051535 ) ) ( not ( = ?auto_1051533 ?auto_1051537 ) ) ( not ( = ?auto_1051533 ?auto_1051538 ) ) ( not ( = ?auto_1051533 ?auto_1051539 ) ) ( not ( = ?auto_1051533 ?auto_1051540 ) ) ( not ( = ?auto_1051534 ?auto_1051536 ) ) ( not ( = ?auto_1051534 ?auto_1051535 ) ) ( not ( = ?auto_1051534 ?auto_1051537 ) ) ( not ( = ?auto_1051534 ?auto_1051538 ) ) ( not ( = ?auto_1051534 ?auto_1051539 ) ) ( not ( = ?auto_1051534 ?auto_1051540 ) ) ( not ( = ?auto_1051536 ?auto_1051535 ) ) ( not ( = ?auto_1051536 ?auto_1051537 ) ) ( not ( = ?auto_1051536 ?auto_1051538 ) ) ( not ( = ?auto_1051536 ?auto_1051539 ) ) ( not ( = ?auto_1051536 ?auto_1051540 ) ) ( not ( = ?auto_1051535 ?auto_1051537 ) ) ( not ( = ?auto_1051535 ?auto_1051538 ) ) ( not ( = ?auto_1051535 ?auto_1051539 ) ) ( not ( = ?auto_1051535 ?auto_1051540 ) ) ( not ( = ?auto_1051537 ?auto_1051538 ) ) ( not ( = ?auto_1051537 ?auto_1051539 ) ) ( not ( = ?auto_1051537 ?auto_1051540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051538 ?auto_1051539 ?auto_1051540 )
      ( MAKE-8CRATE-VERIFY ?auto_1051532 ?auto_1051533 ?auto_1051534 ?auto_1051536 ?auto_1051535 ?auto_1051537 ?auto_1051538 ?auto_1051539 ?auto_1051540 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051624 - SURFACE
      ?auto_1051625 - SURFACE
      ?auto_1051626 - SURFACE
      ?auto_1051628 - SURFACE
      ?auto_1051627 - SURFACE
      ?auto_1051629 - SURFACE
      ?auto_1051630 - SURFACE
      ?auto_1051631 - SURFACE
      ?auto_1051632 - SURFACE
    )
    :vars
    (
      ?auto_1051635 - HOIST
      ?auto_1051638 - PLACE
      ?auto_1051636 - TRUCK
      ?auto_1051633 - PLACE
      ?auto_1051637 - HOIST
      ?auto_1051634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051635 ?auto_1051638 ) ( SURFACE-AT ?auto_1051631 ?auto_1051638 ) ( CLEAR ?auto_1051631 ) ( IS-CRATE ?auto_1051632 ) ( not ( = ?auto_1051631 ?auto_1051632 ) ) ( AVAILABLE ?auto_1051635 ) ( ON ?auto_1051631 ?auto_1051630 ) ( not ( = ?auto_1051630 ?auto_1051631 ) ) ( not ( = ?auto_1051630 ?auto_1051632 ) ) ( TRUCK-AT ?auto_1051636 ?auto_1051633 ) ( not ( = ?auto_1051633 ?auto_1051638 ) ) ( HOIST-AT ?auto_1051637 ?auto_1051633 ) ( not ( = ?auto_1051635 ?auto_1051637 ) ) ( AVAILABLE ?auto_1051637 ) ( SURFACE-AT ?auto_1051632 ?auto_1051633 ) ( ON ?auto_1051632 ?auto_1051634 ) ( CLEAR ?auto_1051632 ) ( not ( = ?auto_1051631 ?auto_1051634 ) ) ( not ( = ?auto_1051632 ?auto_1051634 ) ) ( not ( = ?auto_1051630 ?auto_1051634 ) ) ( ON ?auto_1051625 ?auto_1051624 ) ( ON ?auto_1051626 ?auto_1051625 ) ( ON ?auto_1051628 ?auto_1051626 ) ( ON ?auto_1051627 ?auto_1051628 ) ( ON ?auto_1051629 ?auto_1051627 ) ( ON ?auto_1051630 ?auto_1051629 ) ( not ( = ?auto_1051624 ?auto_1051625 ) ) ( not ( = ?auto_1051624 ?auto_1051626 ) ) ( not ( = ?auto_1051624 ?auto_1051628 ) ) ( not ( = ?auto_1051624 ?auto_1051627 ) ) ( not ( = ?auto_1051624 ?auto_1051629 ) ) ( not ( = ?auto_1051624 ?auto_1051630 ) ) ( not ( = ?auto_1051624 ?auto_1051631 ) ) ( not ( = ?auto_1051624 ?auto_1051632 ) ) ( not ( = ?auto_1051624 ?auto_1051634 ) ) ( not ( = ?auto_1051625 ?auto_1051626 ) ) ( not ( = ?auto_1051625 ?auto_1051628 ) ) ( not ( = ?auto_1051625 ?auto_1051627 ) ) ( not ( = ?auto_1051625 ?auto_1051629 ) ) ( not ( = ?auto_1051625 ?auto_1051630 ) ) ( not ( = ?auto_1051625 ?auto_1051631 ) ) ( not ( = ?auto_1051625 ?auto_1051632 ) ) ( not ( = ?auto_1051625 ?auto_1051634 ) ) ( not ( = ?auto_1051626 ?auto_1051628 ) ) ( not ( = ?auto_1051626 ?auto_1051627 ) ) ( not ( = ?auto_1051626 ?auto_1051629 ) ) ( not ( = ?auto_1051626 ?auto_1051630 ) ) ( not ( = ?auto_1051626 ?auto_1051631 ) ) ( not ( = ?auto_1051626 ?auto_1051632 ) ) ( not ( = ?auto_1051626 ?auto_1051634 ) ) ( not ( = ?auto_1051628 ?auto_1051627 ) ) ( not ( = ?auto_1051628 ?auto_1051629 ) ) ( not ( = ?auto_1051628 ?auto_1051630 ) ) ( not ( = ?auto_1051628 ?auto_1051631 ) ) ( not ( = ?auto_1051628 ?auto_1051632 ) ) ( not ( = ?auto_1051628 ?auto_1051634 ) ) ( not ( = ?auto_1051627 ?auto_1051629 ) ) ( not ( = ?auto_1051627 ?auto_1051630 ) ) ( not ( = ?auto_1051627 ?auto_1051631 ) ) ( not ( = ?auto_1051627 ?auto_1051632 ) ) ( not ( = ?auto_1051627 ?auto_1051634 ) ) ( not ( = ?auto_1051629 ?auto_1051630 ) ) ( not ( = ?auto_1051629 ?auto_1051631 ) ) ( not ( = ?auto_1051629 ?auto_1051632 ) ) ( not ( = ?auto_1051629 ?auto_1051634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051630 ?auto_1051631 ?auto_1051632 )
      ( MAKE-8CRATE-VERIFY ?auto_1051624 ?auto_1051625 ?auto_1051626 ?auto_1051628 ?auto_1051627 ?auto_1051629 ?auto_1051630 ?auto_1051631 ?auto_1051632 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051717 - SURFACE
      ?auto_1051718 - SURFACE
      ?auto_1051719 - SURFACE
      ?auto_1051721 - SURFACE
      ?auto_1051720 - SURFACE
      ?auto_1051722 - SURFACE
      ?auto_1051723 - SURFACE
      ?auto_1051724 - SURFACE
      ?auto_1051725 - SURFACE
    )
    :vars
    (
      ?auto_1051728 - HOIST
      ?auto_1051726 - PLACE
      ?auto_1051729 - PLACE
      ?auto_1051730 - HOIST
      ?auto_1051731 - SURFACE
      ?auto_1051727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051728 ?auto_1051726 ) ( SURFACE-AT ?auto_1051724 ?auto_1051726 ) ( CLEAR ?auto_1051724 ) ( IS-CRATE ?auto_1051725 ) ( not ( = ?auto_1051724 ?auto_1051725 ) ) ( AVAILABLE ?auto_1051728 ) ( ON ?auto_1051724 ?auto_1051723 ) ( not ( = ?auto_1051723 ?auto_1051724 ) ) ( not ( = ?auto_1051723 ?auto_1051725 ) ) ( not ( = ?auto_1051729 ?auto_1051726 ) ) ( HOIST-AT ?auto_1051730 ?auto_1051729 ) ( not ( = ?auto_1051728 ?auto_1051730 ) ) ( AVAILABLE ?auto_1051730 ) ( SURFACE-AT ?auto_1051725 ?auto_1051729 ) ( ON ?auto_1051725 ?auto_1051731 ) ( CLEAR ?auto_1051725 ) ( not ( = ?auto_1051724 ?auto_1051731 ) ) ( not ( = ?auto_1051725 ?auto_1051731 ) ) ( not ( = ?auto_1051723 ?auto_1051731 ) ) ( TRUCK-AT ?auto_1051727 ?auto_1051726 ) ( ON ?auto_1051718 ?auto_1051717 ) ( ON ?auto_1051719 ?auto_1051718 ) ( ON ?auto_1051721 ?auto_1051719 ) ( ON ?auto_1051720 ?auto_1051721 ) ( ON ?auto_1051722 ?auto_1051720 ) ( ON ?auto_1051723 ?auto_1051722 ) ( not ( = ?auto_1051717 ?auto_1051718 ) ) ( not ( = ?auto_1051717 ?auto_1051719 ) ) ( not ( = ?auto_1051717 ?auto_1051721 ) ) ( not ( = ?auto_1051717 ?auto_1051720 ) ) ( not ( = ?auto_1051717 ?auto_1051722 ) ) ( not ( = ?auto_1051717 ?auto_1051723 ) ) ( not ( = ?auto_1051717 ?auto_1051724 ) ) ( not ( = ?auto_1051717 ?auto_1051725 ) ) ( not ( = ?auto_1051717 ?auto_1051731 ) ) ( not ( = ?auto_1051718 ?auto_1051719 ) ) ( not ( = ?auto_1051718 ?auto_1051721 ) ) ( not ( = ?auto_1051718 ?auto_1051720 ) ) ( not ( = ?auto_1051718 ?auto_1051722 ) ) ( not ( = ?auto_1051718 ?auto_1051723 ) ) ( not ( = ?auto_1051718 ?auto_1051724 ) ) ( not ( = ?auto_1051718 ?auto_1051725 ) ) ( not ( = ?auto_1051718 ?auto_1051731 ) ) ( not ( = ?auto_1051719 ?auto_1051721 ) ) ( not ( = ?auto_1051719 ?auto_1051720 ) ) ( not ( = ?auto_1051719 ?auto_1051722 ) ) ( not ( = ?auto_1051719 ?auto_1051723 ) ) ( not ( = ?auto_1051719 ?auto_1051724 ) ) ( not ( = ?auto_1051719 ?auto_1051725 ) ) ( not ( = ?auto_1051719 ?auto_1051731 ) ) ( not ( = ?auto_1051721 ?auto_1051720 ) ) ( not ( = ?auto_1051721 ?auto_1051722 ) ) ( not ( = ?auto_1051721 ?auto_1051723 ) ) ( not ( = ?auto_1051721 ?auto_1051724 ) ) ( not ( = ?auto_1051721 ?auto_1051725 ) ) ( not ( = ?auto_1051721 ?auto_1051731 ) ) ( not ( = ?auto_1051720 ?auto_1051722 ) ) ( not ( = ?auto_1051720 ?auto_1051723 ) ) ( not ( = ?auto_1051720 ?auto_1051724 ) ) ( not ( = ?auto_1051720 ?auto_1051725 ) ) ( not ( = ?auto_1051720 ?auto_1051731 ) ) ( not ( = ?auto_1051722 ?auto_1051723 ) ) ( not ( = ?auto_1051722 ?auto_1051724 ) ) ( not ( = ?auto_1051722 ?auto_1051725 ) ) ( not ( = ?auto_1051722 ?auto_1051731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051723 ?auto_1051724 ?auto_1051725 )
      ( MAKE-8CRATE-VERIFY ?auto_1051717 ?auto_1051718 ?auto_1051719 ?auto_1051721 ?auto_1051720 ?auto_1051722 ?auto_1051723 ?auto_1051724 ?auto_1051725 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051810 - SURFACE
      ?auto_1051811 - SURFACE
      ?auto_1051812 - SURFACE
      ?auto_1051814 - SURFACE
      ?auto_1051813 - SURFACE
      ?auto_1051815 - SURFACE
      ?auto_1051816 - SURFACE
      ?auto_1051817 - SURFACE
      ?auto_1051818 - SURFACE
    )
    :vars
    (
      ?auto_1051821 - HOIST
      ?auto_1051824 - PLACE
      ?auto_1051819 - PLACE
      ?auto_1051822 - HOIST
      ?auto_1051820 - SURFACE
      ?auto_1051823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051821 ?auto_1051824 ) ( IS-CRATE ?auto_1051818 ) ( not ( = ?auto_1051817 ?auto_1051818 ) ) ( not ( = ?auto_1051816 ?auto_1051817 ) ) ( not ( = ?auto_1051816 ?auto_1051818 ) ) ( not ( = ?auto_1051819 ?auto_1051824 ) ) ( HOIST-AT ?auto_1051822 ?auto_1051819 ) ( not ( = ?auto_1051821 ?auto_1051822 ) ) ( AVAILABLE ?auto_1051822 ) ( SURFACE-AT ?auto_1051818 ?auto_1051819 ) ( ON ?auto_1051818 ?auto_1051820 ) ( CLEAR ?auto_1051818 ) ( not ( = ?auto_1051817 ?auto_1051820 ) ) ( not ( = ?auto_1051818 ?auto_1051820 ) ) ( not ( = ?auto_1051816 ?auto_1051820 ) ) ( TRUCK-AT ?auto_1051823 ?auto_1051824 ) ( SURFACE-AT ?auto_1051816 ?auto_1051824 ) ( CLEAR ?auto_1051816 ) ( LIFTING ?auto_1051821 ?auto_1051817 ) ( IS-CRATE ?auto_1051817 ) ( ON ?auto_1051811 ?auto_1051810 ) ( ON ?auto_1051812 ?auto_1051811 ) ( ON ?auto_1051814 ?auto_1051812 ) ( ON ?auto_1051813 ?auto_1051814 ) ( ON ?auto_1051815 ?auto_1051813 ) ( ON ?auto_1051816 ?auto_1051815 ) ( not ( = ?auto_1051810 ?auto_1051811 ) ) ( not ( = ?auto_1051810 ?auto_1051812 ) ) ( not ( = ?auto_1051810 ?auto_1051814 ) ) ( not ( = ?auto_1051810 ?auto_1051813 ) ) ( not ( = ?auto_1051810 ?auto_1051815 ) ) ( not ( = ?auto_1051810 ?auto_1051816 ) ) ( not ( = ?auto_1051810 ?auto_1051817 ) ) ( not ( = ?auto_1051810 ?auto_1051818 ) ) ( not ( = ?auto_1051810 ?auto_1051820 ) ) ( not ( = ?auto_1051811 ?auto_1051812 ) ) ( not ( = ?auto_1051811 ?auto_1051814 ) ) ( not ( = ?auto_1051811 ?auto_1051813 ) ) ( not ( = ?auto_1051811 ?auto_1051815 ) ) ( not ( = ?auto_1051811 ?auto_1051816 ) ) ( not ( = ?auto_1051811 ?auto_1051817 ) ) ( not ( = ?auto_1051811 ?auto_1051818 ) ) ( not ( = ?auto_1051811 ?auto_1051820 ) ) ( not ( = ?auto_1051812 ?auto_1051814 ) ) ( not ( = ?auto_1051812 ?auto_1051813 ) ) ( not ( = ?auto_1051812 ?auto_1051815 ) ) ( not ( = ?auto_1051812 ?auto_1051816 ) ) ( not ( = ?auto_1051812 ?auto_1051817 ) ) ( not ( = ?auto_1051812 ?auto_1051818 ) ) ( not ( = ?auto_1051812 ?auto_1051820 ) ) ( not ( = ?auto_1051814 ?auto_1051813 ) ) ( not ( = ?auto_1051814 ?auto_1051815 ) ) ( not ( = ?auto_1051814 ?auto_1051816 ) ) ( not ( = ?auto_1051814 ?auto_1051817 ) ) ( not ( = ?auto_1051814 ?auto_1051818 ) ) ( not ( = ?auto_1051814 ?auto_1051820 ) ) ( not ( = ?auto_1051813 ?auto_1051815 ) ) ( not ( = ?auto_1051813 ?auto_1051816 ) ) ( not ( = ?auto_1051813 ?auto_1051817 ) ) ( not ( = ?auto_1051813 ?auto_1051818 ) ) ( not ( = ?auto_1051813 ?auto_1051820 ) ) ( not ( = ?auto_1051815 ?auto_1051816 ) ) ( not ( = ?auto_1051815 ?auto_1051817 ) ) ( not ( = ?auto_1051815 ?auto_1051818 ) ) ( not ( = ?auto_1051815 ?auto_1051820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051816 ?auto_1051817 ?auto_1051818 )
      ( MAKE-8CRATE-VERIFY ?auto_1051810 ?auto_1051811 ?auto_1051812 ?auto_1051814 ?auto_1051813 ?auto_1051815 ?auto_1051816 ?auto_1051817 ?auto_1051818 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051903 - SURFACE
      ?auto_1051904 - SURFACE
      ?auto_1051905 - SURFACE
      ?auto_1051907 - SURFACE
      ?auto_1051906 - SURFACE
      ?auto_1051908 - SURFACE
      ?auto_1051909 - SURFACE
      ?auto_1051910 - SURFACE
      ?auto_1051911 - SURFACE
    )
    :vars
    (
      ?auto_1051913 - HOIST
      ?auto_1051914 - PLACE
      ?auto_1051915 - PLACE
      ?auto_1051912 - HOIST
      ?auto_1051916 - SURFACE
      ?auto_1051917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051913 ?auto_1051914 ) ( IS-CRATE ?auto_1051911 ) ( not ( = ?auto_1051910 ?auto_1051911 ) ) ( not ( = ?auto_1051909 ?auto_1051910 ) ) ( not ( = ?auto_1051909 ?auto_1051911 ) ) ( not ( = ?auto_1051915 ?auto_1051914 ) ) ( HOIST-AT ?auto_1051912 ?auto_1051915 ) ( not ( = ?auto_1051913 ?auto_1051912 ) ) ( AVAILABLE ?auto_1051912 ) ( SURFACE-AT ?auto_1051911 ?auto_1051915 ) ( ON ?auto_1051911 ?auto_1051916 ) ( CLEAR ?auto_1051911 ) ( not ( = ?auto_1051910 ?auto_1051916 ) ) ( not ( = ?auto_1051911 ?auto_1051916 ) ) ( not ( = ?auto_1051909 ?auto_1051916 ) ) ( TRUCK-AT ?auto_1051917 ?auto_1051914 ) ( SURFACE-AT ?auto_1051909 ?auto_1051914 ) ( CLEAR ?auto_1051909 ) ( IS-CRATE ?auto_1051910 ) ( AVAILABLE ?auto_1051913 ) ( IN ?auto_1051910 ?auto_1051917 ) ( ON ?auto_1051904 ?auto_1051903 ) ( ON ?auto_1051905 ?auto_1051904 ) ( ON ?auto_1051907 ?auto_1051905 ) ( ON ?auto_1051906 ?auto_1051907 ) ( ON ?auto_1051908 ?auto_1051906 ) ( ON ?auto_1051909 ?auto_1051908 ) ( not ( = ?auto_1051903 ?auto_1051904 ) ) ( not ( = ?auto_1051903 ?auto_1051905 ) ) ( not ( = ?auto_1051903 ?auto_1051907 ) ) ( not ( = ?auto_1051903 ?auto_1051906 ) ) ( not ( = ?auto_1051903 ?auto_1051908 ) ) ( not ( = ?auto_1051903 ?auto_1051909 ) ) ( not ( = ?auto_1051903 ?auto_1051910 ) ) ( not ( = ?auto_1051903 ?auto_1051911 ) ) ( not ( = ?auto_1051903 ?auto_1051916 ) ) ( not ( = ?auto_1051904 ?auto_1051905 ) ) ( not ( = ?auto_1051904 ?auto_1051907 ) ) ( not ( = ?auto_1051904 ?auto_1051906 ) ) ( not ( = ?auto_1051904 ?auto_1051908 ) ) ( not ( = ?auto_1051904 ?auto_1051909 ) ) ( not ( = ?auto_1051904 ?auto_1051910 ) ) ( not ( = ?auto_1051904 ?auto_1051911 ) ) ( not ( = ?auto_1051904 ?auto_1051916 ) ) ( not ( = ?auto_1051905 ?auto_1051907 ) ) ( not ( = ?auto_1051905 ?auto_1051906 ) ) ( not ( = ?auto_1051905 ?auto_1051908 ) ) ( not ( = ?auto_1051905 ?auto_1051909 ) ) ( not ( = ?auto_1051905 ?auto_1051910 ) ) ( not ( = ?auto_1051905 ?auto_1051911 ) ) ( not ( = ?auto_1051905 ?auto_1051916 ) ) ( not ( = ?auto_1051907 ?auto_1051906 ) ) ( not ( = ?auto_1051907 ?auto_1051908 ) ) ( not ( = ?auto_1051907 ?auto_1051909 ) ) ( not ( = ?auto_1051907 ?auto_1051910 ) ) ( not ( = ?auto_1051907 ?auto_1051911 ) ) ( not ( = ?auto_1051907 ?auto_1051916 ) ) ( not ( = ?auto_1051906 ?auto_1051908 ) ) ( not ( = ?auto_1051906 ?auto_1051909 ) ) ( not ( = ?auto_1051906 ?auto_1051910 ) ) ( not ( = ?auto_1051906 ?auto_1051911 ) ) ( not ( = ?auto_1051906 ?auto_1051916 ) ) ( not ( = ?auto_1051908 ?auto_1051909 ) ) ( not ( = ?auto_1051908 ?auto_1051910 ) ) ( not ( = ?auto_1051908 ?auto_1051911 ) ) ( not ( = ?auto_1051908 ?auto_1051916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051909 ?auto_1051910 ?auto_1051911 )
      ( MAKE-8CRATE-VERIFY ?auto_1051903 ?auto_1051904 ?auto_1051905 ?auto_1051907 ?auto_1051906 ?auto_1051908 ?auto_1051909 ?auto_1051910 ?auto_1051911 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056019 - SURFACE
      ?auto_1056020 - SURFACE
      ?auto_1056021 - SURFACE
      ?auto_1056023 - SURFACE
      ?auto_1056022 - SURFACE
      ?auto_1056024 - SURFACE
      ?auto_1056025 - SURFACE
      ?auto_1056026 - SURFACE
      ?auto_1056027 - SURFACE
      ?auto_1056028 - SURFACE
    )
    :vars
    (
      ?auto_1056029 - HOIST
      ?auto_1056030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056029 ?auto_1056030 ) ( SURFACE-AT ?auto_1056027 ?auto_1056030 ) ( CLEAR ?auto_1056027 ) ( LIFTING ?auto_1056029 ?auto_1056028 ) ( IS-CRATE ?auto_1056028 ) ( not ( = ?auto_1056027 ?auto_1056028 ) ) ( ON ?auto_1056020 ?auto_1056019 ) ( ON ?auto_1056021 ?auto_1056020 ) ( ON ?auto_1056023 ?auto_1056021 ) ( ON ?auto_1056022 ?auto_1056023 ) ( ON ?auto_1056024 ?auto_1056022 ) ( ON ?auto_1056025 ?auto_1056024 ) ( ON ?auto_1056026 ?auto_1056025 ) ( ON ?auto_1056027 ?auto_1056026 ) ( not ( = ?auto_1056019 ?auto_1056020 ) ) ( not ( = ?auto_1056019 ?auto_1056021 ) ) ( not ( = ?auto_1056019 ?auto_1056023 ) ) ( not ( = ?auto_1056019 ?auto_1056022 ) ) ( not ( = ?auto_1056019 ?auto_1056024 ) ) ( not ( = ?auto_1056019 ?auto_1056025 ) ) ( not ( = ?auto_1056019 ?auto_1056026 ) ) ( not ( = ?auto_1056019 ?auto_1056027 ) ) ( not ( = ?auto_1056019 ?auto_1056028 ) ) ( not ( = ?auto_1056020 ?auto_1056021 ) ) ( not ( = ?auto_1056020 ?auto_1056023 ) ) ( not ( = ?auto_1056020 ?auto_1056022 ) ) ( not ( = ?auto_1056020 ?auto_1056024 ) ) ( not ( = ?auto_1056020 ?auto_1056025 ) ) ( not ( = ?auto_1056020 ?auto_1056026 ) ) ( not ( = ?auto_1056020 ?auto_1056027 ) ) ( not ( = ?auto_1056020 ?auto_1056028 ) ) ( not ( = ?auto_1056021 ?auto_1056023 ) ) ( not ( = ?auto_1056021 ?auto_1056022 ) ) ( not ( = ?auto_1056021 ?auto_1056024 ) ) ( not ( = ?auto_1056021 ?auto_1056025 ) ) ( not ( = ?auto_1056021 ?auto_1056026 ) ) ( not ( = ?auto_1056021 ?auto_1056027 ) ) ( not ( = ?auto_1056021 ?auto_1056028 ) ) ( not ( = ?auto_1056023 ?auto_1056022 ) ) ( not ( = ?auto_1056023 ?auto_1056024 ) ) ( not ( = ?auto_1056023 ?auto_1056025 ) ) ( not ( = ?auto_1056023 ?auto_1056026 ) ) ( not ( = ?auto_1056023 ?auto_1056027 ) ) ( not ( = ?auto_1056023 ?auto_1056028 ) ) ( not ( = ?auto_1056022 ?auto_1056024 ) ) ( not ( = ?auto_1056022 ?auto_1056025 ) ) ( not ( = ?auto_1056022 ?auto_1056026 ) ) ( not ( = ?auto_1056022 ?auto_1056027 ) ) ( not ( = ?auto_1056022 ?auto_1056028 ) ) ( not ( = ?auto_1056024 ?auto_1056025 ) ) ( not ( = ?auto_1056024 ?auto_1056026 ) ) ( not ( = ?auto_1056024 ?auto_1056027 ) ) ( not ( = ?auto_1056024 ?auto_1056028 ) ) ( not ( = ?auto_1056025 ?auto_1056026 ) ) ( not ( = ?auto_1056025 ?auto_1056027 ) ) ( not ( = ?auto_1056025 ?auto_1056028 ) ) ( not ( = ?auto_1056026 ?auto_1056027 ) ) ( not ( = ?auto_1056026 ?auto_1056028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1056027 ?auto_1056028 )
      ( MAKE-9CRATE-VERIFY ?auto_1056019 ?auto_1056020 ?auto_1056021 ?auto_1056023 ?auto_1056022 ?auto_1056024 ?auto_1056025 ?auto_1056026 ?auto_1056027 ?auto_1056028 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056099 - SURFACE
      ?auto_1056100 - SURFACE
      ?auto_1056101 - SURFACE
      ?auto_1056103 - SURFACE
      ?auto_1056102 - SURFACE
      ?auto_1056104 - SURFACE
      ?auto_1056105 - SURFACE
      ?auto_1056106 - SURFACE
      ?auto_1056107 - SURFACE
      ?auto_1056108 - SURFACE
    )
    :vars
    (
      ?auto_1056109 - HOIST
      ?auto_1056110 - PLACE
      ?auto_1056111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056109 ?auto_1056110 ) ( SURFACE-AT ?auto_1056107 ?auto_1056110 ) ( CLEAR ?auto_1056107 ) ( IS-CRATE ?auto_1056108 ) ( not ( = ?auto_1056107 ?auto_1056108 ) ) ( TRUCK-AT ?auto_1056111 ?auto_1056110 ) ( AVAILABLE ?auto_1056109 ) ( IN ?auto_1056108 ?auto_1056111 ) ( ON ?auto_1056107 ?auto_1056106 ) ( not ( = ?auto_1056106 ?auto_1056107 ) ) ( not ( = ?auto_1056106 ?auto_1056108 ) ) ( ON ?auto_1056100 ?auto_1056099 ) ( ON ?auto_1056101 ?auto_1056100 ) ( ON ?auto_1056103 ?auto_1056101 ) ( ON ?auto_1056102 ?auto_1056103 ) ( ON ?auto_1056104 ?auto_1056102 ) ( ON ?auto_1056105 ?auto_1056104 ) ( ON ?auto_1056106 ?auto_1056105 ) ( not ( = ?auto_1056099 ?auto_1056100 ) ) ( not ( = ?auto_1056099 ?auto_1056101 ) ) ( not ( = ?auto_1056099 ?auto_1056103 ) ) ( not ( = ?auto_1056099 ?auto_1056102 ) ) ( not ( = ?auto_1056099 ?auto_1056104 ) ) ( not ( = ?auto_1056099 ?auto_1056105 ) ) ( not ( = ?auto_1056099 ?auto_1056106 ) ) ( not ( = ?auto_1056099 ?auto_1056107 ) ) ( not ( = ?auto_1056099 ?auto_1056108 ) ) ( not ( = ?auto_1056100 ?auto_1056101 ) ) ( not ( = ?auto_1056100 ?auto_1056103 ) ) ( not ( = ?auto_1056100 ?auto_1056102 ) ) ( not ( = ?auto_1056100 ?auto_1056104 ) ) ( not ( = ?auto_1056100 ?auto_1056105 ) ) ( not ( = ?auto_1056100 ?auto_1056106 ) ) ( not ( = ?auto_1056100 ?auto_1056107 ) ) ( not ( = ?auto_1056100 ?auto_1056108 ) ) ( not ( = ?auto_1056101 ?auto_1056103 ) ) ( not ( = ?auto_1056101 ?auto_1056102 ) ) ( not ( = ?auto_1056101 ?auto_1056104 ) ) ( not ( = ?auto_1056101 ?auto_1056105 ) ) ( not ( = ?auto_1056101 ?auto_1056106 ) ) ( not ( = ?auto_1056101 ?auto_1056107 ) ) ( not ( = ?auto_1056101 ?auto_1056108 ) ) ( not ( = ?auto_1056103 ?auto_1056102 ) ) ( not ( = ?auto_1056103 ?auto_1056104 ) ) ( not ( = ?auto_1056103 ?auto_1056105 ) ) ( not ( = ?auto_1056103 ?auto_1056106 ) ) ( not ( = ?auto_1056103 ?auto_1056107 ) ) ( not ( = ?auto_1056103 ?auto_1056108 ) ) ( not ( = ?auto_1056102 ?auto_1056104 ) ) ( not ( = ?auto_1056102 ?auto_1056105 ) ) ( not ( = ?auto_1056102 ?auto_1056106 ) ) ( not ( = ?auto_1056102 ?auto_1056107 ) ) ( not ( = ?auto_1056102 ?auto_1056108 ) ) ( not ( = ?auto_1056104 ?auto_1056105 ) ) ( not ( = ?auto_1056104 ?auto_1056106 ) ) ( not ( = ?auto_1056104 ?auto_1056107 ) ) ( not ( = ?auto_1056104 ?auto_1056108 ) ) ( not ( = ?auto_1056105 ?auto_1056106 ) ) ( not ( = ?auto_1056105 ?auto_1056107 ) ) ( not ( = ?auto_1056105 ?auto_1056108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056106 ?auto_1056107 ?auto_1056108 )
      ( MAKE-9CRATE-VERIFY ?auto_1056099 ?auto_1056100 ?auto_1056101 ?auto_1056103 ?auto_1056102 ?auto_1056104 ?auto_1056105 ?auto_1056106 ?auto_1056107 ?auto_1056108 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056189 - SURFACE
      ?auto_1056190 - SURFACE
      ?auto_1056191 - SURFACE
      ?auto_1056193 - SURFACE
      ?auto_1056192 - SURFACE
      ?auto_1056194 - SURFACE
      ?auto_1056195 - SURFACE
      ?auto_1056196 - SURFACE
      ?auto_1056197 - SURFACE
      ?auto_1056198 - SURFACE
    )
    :vars
    (
      ?auto_1056200 - HOIST
      ?auto_1056202 - PLACE
      ?auto_1056199 - TRUCK
      ?auto_1056201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056200 ?auto_1056202 ) ( SURFACE-AT ?auto_1056197 ?auto_1056202 ) ( CLEAR ?auto_1056197 ) ( IS-CRATE ?auto_1056198 ) ( not ( = ?auto_1056197 ?auto_1056198 ) ) ( AVAILABLE ?auto_1056200 ) ( IN ?auto_1056198 ?auto_1056199 ) ( ON ?auto_1056197 ?auto_1056196 ) ( not ( = ?auto_1056196 ?auto_1056197 ) ) ( not ( = ?auto_1056196 ?auto_1056198 ) ) ( TRUCK-AT ?auto_1056199 ?auto_1056201 ) ( not ( = ?auto_1056201 ?auto_1056202 ) ) ( ON ?auto_1056190 ?auto_1056189 ) ( ON ?auto_1056191 ?auto_1056190 ) ( ON ?auto_1056193 ?auto_1056191 ) ( ON ?auto_1056192 ?auto_1056193 ) ( ON ?auto_1056194 ?auto_1056192 ) ( ON ?auto_1056195 ?auto_1056194 ) ( ON ?auto_1056196 ?auto_1056195 ) ( not ( = ?auto_1056189 ?auto_1056190 ) ) ( not ( = ?auto_1056189 ?auto_1056191 ) ) ( not ( = ?auto_1056189 ?auto_1056193 ) ) ( not ( = ?auto_1056189 ?auto_1056192 ) ) ( not ( = ?auto_1056189 ?auto_1056194 ) ) ( not ( = ?auto_1056189 ?auto_1056195 ) ) ( not ( = ?auto_1056189 ?auto_1056196 ) ) ( not ( = ?auto_1056189 ?auto_1056197 ) ) ( not ( = ?auto_1056189 ?auto_1056198 ) ) ( not ( = ?auto_1056190 ?auto_1056191 ) ) ( not ( = ?auto_1056190 ?auto_1056193 ) ) ( not ( = ?auto_1056190 ?auto_1056192 ) ) ( not ( = ?auto_1056190 ?auto_1056194 ) ) ( not ( = ?auto_1056190 ?auto_1056195 ) ) ( not ( = ?auto_1056190 ?auto_1056196 ) ) ( not ( = ?auto_1056190 ?auto_1056197 ) ) ( not ( = ?auto_1056190 ?auto_1056198 ) ) ( not ( = ?auto_1056191 ?auto_1056193 ) ) ( not ( = ?auto_1056191 ?auto_1056192 ) ) ( not ( = ?auto_1056191 ?auto_1056194 ) ) ( not ( = ?auto_1056191 ?auto_1056195 ) ) ( not ( = ?auto_1056191 ?auto_1056196 ) ) ( not ( = ?auto_1056191 ?auto_1056197 ) ) ( not ( = ?auto_1056191 ?auto_1056198 ) ) ( not ( = ?auto_1056193 ?auto_1056192 ) ) ( not ( = ?auto_1056193 ?auto_1056194 ) ) ( not ( = ?auto_1056193 ?auto_1056195 ) ) ( not ( = ?auto_1056193 ?auto_1056196 ) ) ( not ( = ?auto_1056193 ?auto_1056197 ) ) ( not ( = ?auto_1056193 ?auto_1056198 ) ) ( not ( = ?auto_1056192 ?auto_1056194 ) ) ( not ( = ?auto_1056192 ?auto_1056195 ) ) ( not ( = ?auto_1056192 ?auto_1056196 ) ) ( not ( = ?auto_1056192 ?auto_1056197 ) ) ( not ( = ?auto_1056192 ?auto_1056198 ) ) ( not ( = ?auto_1056194 ?auto_1056195 ) ) ( not ( = ?auto_1056194 ?auto_1056196 ) ) ( not ( = ?auto_1056194 ?auto_1056197 ) ) ( not ( = ?auto_1056194 ?auto_1056198 ) ) ( not ( = ?auto_1056195 ?auto_1056196 ) ) ( not ( = ?auto_1056195 ?auto_1056197 ) ) ( not ( = ?auto_1056195 ?auto_1056198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056196 ?auto_1056197 ?auto_1056198 )
      ( MAKE-9CRATE-VERIFY ?auto_1056189 ?auto_1056190 ?auto_1056191 ?auto_1056193 ?auto_1056192 ?auto_1056194 ?auto_1056195 ?auto_1056196 ?auto_1056197 ?auto_1056198 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056288 - SURFACE
      ?auto_1056289 - SURFACE
      ?auto_1056290 - SURFACE
      ?auto_1056292 - SURFACE
      ?auto_1056291 - SURFACE
      ?auto_1056293 - SURFACE
      ?auto_1056294 - SURFACE
      ?auto_1056295 - SURFACE
      ?auto_1056296 - SURFACE
      ?auto_1056297 - SURFACE
    )
    :vars
    (
      ?auto_1056302 - HOIST
      ?auto_1056300 - PLACE
      ?auto_1056299 - TRUCK
      ?auto_1056301 - PLACE
      ?auto_1056298 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056302 ?auto_1056300 ) ( SURFACE-AT ?auto_1056296 ?auto_1056300 ) ( CLEAR ?auto_1056296 ) ( IS-CRATE ?auto_1056297 ) ( not ( = ?auto_1056296 ?auto_1056297 ) ) ( AVAILABLE ?auto_1056302 ) ( ON ?auto_1056296 ?auto_1056295 ) ( not ( = ?auto_1056295 ?auto_1056296 ) ) ( not ( = ?auto_1056295 ?auto_1056297 ) ) ( TRUCK-AT ?auto_1056299 ?auto_1056301 ) ( not ( = ?auto_1056301 ?auto_1056300 ) ) ( HOIST-AT ?auto_1056298 ?auto_1056301 ) ( LIFTING ?auto_1056298 ?auto_1056297 ) ( not ( = ?auto_1056302 ?auto_1056298 ) ) ( ON ?auto_1056289 ?auto_1056288 ) ( ON ?auto_1056290 ?auto_1056289 ) ( ON ?auto_1056292 ?auto_1056290 ) ( ON ?auto_1056291 ?auto_1056292 ) ( ON ?auto_1056293 ?auto_1056291 ) ( ON ?auto_1056294 ?auto_1056293 ) ( ON ?auto_1056295 ?auto_1056294 ) ( not ( = ?auto_1056288 ?auto_1056289 ) ) ( not ( = ?auto_1056288 ?auto_1056290 ) ) ( not ( = ?auto_1056288 ?auto_1056292 ) ) ( not ( = ?auto_1056288 ?auto_1056291 ) ) ( not ( = ?auto_1056288 ?auto_1056293 ) ) ( not ( = ?auto_1056288 ?auto_1056294 ) ) ( not ( = ?auto_1056288 ?auto_1056295 ) ) ( not ( = ?auto_1056288 ?auto_1056296 ) ) ( not ( = ?auto_1056288 ?auto_1056297 ) ) ( not ( = ?auto_1056289 ?auto_1056290 ) ) ( not ( = ?auto_1056289 ?auto_1056292 ) ) ( not ( = ?auto_1056289 ?auto_1056291 ) ) ( not ( = ?auto_1056289 ?auto_1056293 ) ) ( not ( = ?auto_1056289 ?auto_1056294 ) ) ( not ( = ?auto_1056289 ?auto_1056295 ) ) ( not ( = ?auto_1056289 ?auto_1056296 ) ) ( not ( = ?auto_1056289 ?auto_1056297 ) ) ( not ( = ?auto_1056290 ?auto_1056292 ) ) ( not ( = ?auto_1056290 ?auto_1056291 ) ) ( not ( = ?auto_1056290 ?auto_1056293 ) ) ( not ( = ?auto_1056290 ?auto_1056294 ) ) ( not ( = ?auto_1056290 ?auto_1056295 ) ) ( not ( = ?auto_1056290 ?auto_1056296 ) ) ( not ( = ?auto_1056290 ?auto_1056297 ) ) ( not ( = ?auto_1056292 ?auto_1056291 ) ) ( not ( = ?auto_1056292 ?auto_1056293 ) ) ( not ( = ?auto_1056292 ?auto_1056294 ) ) ( not ( = ?auto_1056292 ?auto_1056295 ) ) ( not ( = ?auto_1056292 ?auto_1056296 ) ) ( not ( = ?auto_1056292 ?auto_1056297 ) ) ( not ( = ?auto_1056291 ?auto_1056293 ) ) ( not ( = ?auto_1056291 ?auto_1056294 ) ) ( not ( = ?auto_1056291 ?auto_1056295 ) ) ( not ( = ?auto_1056291 ?auto_1056296 ) ) ( not ( = ?auto_1056291 ?auto_1056297 ) ) ( not ( = ?auto_1056293 ?auto_1056294 ) ) ( not ( = ?auto_1056293 ?auto_1056295 ) ) ( not ( = ?auto_1056293 ?auto_1056296 ) ) ( not ( = ?auto_1056293 ?auto_1056297 ) ) ( not ( = ?auto_1056294 ?auto_1056295 ) ) ( not ( = ?auto_1056294 ?auto_1056296 ) ) ( not ( = ?auto_1056294 ?auto_1056297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056295 ?auto_1056296 ?auto_1056297 )
      ( MAKE-9CRATE-VERIFY ?auto_1056288 ?auto_1056289 ?auto_1056290 ?auto_1056292 ?auto_1056291 ?auto_1056293 ?auto_1056294 ?auto_1056295 ?auto_1056296 ?auto_1056297 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056396 - SURFACE
      ?auto_1056397 - SURFACE
      ?auto_1056398 - SURFACE
      ?auto_1056400 - SURFACE
      ?auto_1056399 - SURFACE
      ?auto_1056401 - SURFACE
      ?auto_1056402 - SURFACE
      ?auto_1056403 - SURFACE
      ?auto_1056404 - SURFACE
      ?auto_1056405 - SURFACE
    )
    :vars
    (
      ?auto_1056407 - HOIST
      ?auto_1056408 - PLACE
      ?auto_1056406 - TRUCK
      ?auto_1056411 - PLACE
      ?auto_1056410 - HOIST
      ?auto_1056409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056407 ?auto_1056408 ) ( SURFACE-AT ?auto_1056404 ?auto_1056408 ) ( CLEAR ?auto_1056404 ) ( IS-CRATE ?auto_1056405 ) ( not ( = ?auto_1056404 ?auto_1056405 ) ) ( AVAILABLE ?auto_1056407 ) ( ON ?auto_1056404 ?auto_1056403 ) ( not ( = ?auto_1056403 ?auto_1056404 ) ) ( not ( = ?auto_1056403 ?auto_1056405 ) ) ( TRUCK-AT ?auto_1056406 ?auto_1056411 ) ( not ( = ?auto_1056411 ?auto_1056408 ) ) ( HOIST-AT ?auto_1056410 ?auto_1056411 ) ( not ( = ?auto_1056407 ?auto_1056410 ) ) ( AVAILABLE ?auto_1056410 ) ( SURFACE-AT ?auto_1056405 ?auto_1056411 ) ( ON ?auto_1056405 ?auto_1056409 ) ( CLEAR ?auto_1056405 ) ( not ( = ?auto_1056404 ?auto_1056409 ) ) ( not ( = ?auto_1056405 ?auto_1056409 ) ) ( not ( = ?auto_1056403 ?auto_1056409 ) ) ( ON ?auto_1056397 ?auto_1056396 ) ( ON ?auto_1056398 ?auto_1056397 ) ( ON ?auto_1056400 ?auto_1056398 ) ( ON ?auto_1056399 ?auto_1056400 ) ( ON ?auto_1056401 ?auto_1056399 ) ( ON ?auto_1056402 ?auto_1056401 ) ( ON ?auto_1056403 ?auto_1056402 ) ( not ( = ?auto_1056396 ?auto_1056397 ) ) ( not ( = ?auto_1056396 ?auto_1056398 ) ) ( not ( = ?auto_1056396 ?auto_1056400 ) ) ( not ( = ?auto_1056396 ?auto_1056399 ) ) ( not ( = ?auto_1056396 ?auto_1056401 ) ) ( not ( = ?auto_1056396 ?auto_1056402 ) ) ( not ( = ?auto_1056396 ?auto_1056403 ) ) ( not ( = ?auto_1056396 ?auto_1056404 ) ) ( not ( = ?auto_1056396 ?auto_1056405 ) ) ( not ( = ?auto_1056396 ?auto_1056409 ) ) ( not ( = ?auto_1056397 ?auto_1056398 ) ) ( not ( = ?auto_1056397 ?auto_1056400 ) ) ( not ( = ?auto_1056397 ?auto_1056399 ) ) ( not ( = ?auto_1056397 ?auto_1056401 ) ) ( not ( = ?auto_1056397 ?auto_1056402 ) ) ( not ( = ?auto_1056397 ?auto_1056403 ) ) ( not ( = ?auto_1056397 ?auto_1056404 ) ) ( not ( = ?auto_1056397 ?auto_1056405 ) ) ( not ( = ?auto_1056397 ?auto_1056409 ) ) ( not ( = ?auto_1056398 ?auto_1056400 ) ) ( not ( = ?auto_1056398 ?auto_1056399 ) ) ( not ( = ?auto_1056398 ?auto_1056401 ) ) ( not ( = ?auto_1056398 ?auto_1056402 ) ) ( not ( = ?auto_1056398 ?auto_1056403 ) ) ( not ( = ?auto_1056398 ?auto_1056404 ) ) ( not ( = ?auto_1056398 ?auto_1056405 ) ) ( not ( = ?auto_1056398 ?auto_1056409 ) ) ( not ( = ?auto_1056400 ?auto_1056399 ) ) ( not ( = ?auto_1056400 ?auto_1056401 ) ) ( not ( = ?auto_1056400 ?auto_1056402 ) ) ( not ( = ?auto_1056400 ?auto_1056403 ) ) ( not ( = ?auto_1056400 ?auto_1056404 ) ) ( not ( = ?auto_1056400 ?auto_1056405 ) ) ( not ( = ?auto_1056400 ?auto_1056409 ) ) ( not ( = ?auto_1056399 ?auto_1056401 ) ) ( not ( = ?auto_1056399 ?auto_1056402 ) ) ( not ( = ?auto_1056399 ?auto_1056403 ) ) ( not ( = ?auto_1056399 ?auto_1056404 ) ) ( not ( = ?auto_1056399 ?auto_1056405 ) ) ( not ( = ?auto_1056399 ?auto_1056409 ) ) ( not ( = ?auto_1056401 ?auto_1056402 ) ) ( not ( = ?auto_1056401 ?auto_1056403 ) ) ( not ( = ?auto_1056401 ?auto_1056404 ) ) ( not ( = ?auto_1056401 ?auto_1056405 ) ) ( not ( = ?auto_1056401 ?auto_1056409 ) ) ( not ( = ?auto_1056402 ?auto_1056403 ) ) ( not ( = ?auto_1056402 ?auto_1056404 ) ) ( not ( = ?auto_1056402 ?auto_1056405 ) ) ( not ( = ?auto_1056402 ?auto_1056409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056403 ?auto_1056404 ?auto_1056405 )
      ( MAKE-9CRATE-VERIFY ?auto_1056396 ?auto_1056397 ?auto_1056398 ?auto_1056400 ?auto_1056399 ?auto_1056401 ?auto_1056402 ?auto_1056403 ?auto_1056404 ?auto_1056405 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056505 - SURFACE
      ?auto_1056506 - SURFACE
      ?auto_1056507 - SURFACE
      ?auto_1056509 - SURFACE
      ?auto_1056508 - SURFACE
      ?auto_1056510 - SURFACE
      ?auto_1056511 - SURFACE
      ?auto_1056512 - SURFACE
      ?auto_1056513 - SURFACE
      ?auto_1056514 - SURFACE
    )
    :vars
    (
      ?auto_1056517 - HOIST
      ?auto_1056520 - PLACE
      ?auto_1056519 - PLACE
      ?auto_1056516 - HOIST
      ?auto_1056515 - SURFACE
      ?auto_1056518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056517 ?auto_1056520 ) ( SURFACE-AT ?auto_1056513 ?auto_1056520 ) ( CLEAR ?auto_1056513 ) ( IS-CRATE ?auto_1056514 ) ( not ( = ?auto_1056513 ?auto_1056514 ) ) ( AVAILABLE ?auto_1056517 ) ( ON ?auto_1056513 ?auto_1056512 ) ( not ( = ?auto_1056512 ?auto_1056513 ) ) ( not ( = ?auto_1056512 ?auto_1056514 ) ) ( not ( = ?auto_1056519 ?auto_1056520 ) ) ( HOIST-AT ?auto_1056516 ?auto_1056519 ) ( not ( = ?auto_1056517 ?auto_1056516 ) ) ( AVAILABLE ?auto_1056516 ) ( SURFACE-AT ?auto_1056514 ?auto_1056519 ) ( ON ?auto_1056514 ?auto_1056515 ) ( CLEAR ?auto_1056514 ) ( not ( = ?auto_1056513 ?auto_1056515 ) ) ( not ( = ?auto_1056514 ?auto_1056515 ) ) ( not ( = ?auto_1056512 ?auto_1056515 ) ) ( TRUCK-AT ?auto_1056518 ?auto_1056520 ) ( ON ?auto_1056506 ?auto_1056505 ) ( ON ?auto_1056507 ?auto_1056506 ) ( ON ?auto_1056509 ?auto_1056507 ) ( ON ?auto_1056508 ?auto_1056509 ) ( ON ?auto_1056510 ?auto_1056508 ) ( ON ?auto_1056511 ?auto_1056510 ) ( ON ?auto_1056512 ?auto_1056511 ) ( not ( = ?auto_1056505 ?auto_1056506 ) ) ( not ( = ?auto_1056505 ?auto_1056507 ) ) ( not ( = ?auto_1056505 ?auto_1056509 ) ) ( not ( = ?auto_1056505 ?auto_1056508 ) ) ( not ( = ?auto_1056505 ?auto_1056510 ) ) ( not ( = ?auto_1056505 ?auto_1056511 ) ) ( not ( = ?auto_1056505 ?auto_1056512 ) ) ( not ( = ?auto_1056505 ?auto_1056513 ) ) ( not ( = ?auto_1056505 ?auto_1056514 ) ) ( not ( = ?auto_1056505 ?auto_1056515 ) ) ( not ( = ?auto_1056506 ?auto_1056507 ) ) ( not ( = ?auto_1056506 ?auto_1056509 ) ) ( not ( = ?auto_1056506 ?auto_1056508 ) ) ( not ( = ?auto_1056506 ?auto_1056510 ) ) ( not ( = ?auto_1056506 ?auto_1056511 ) ) ( not ( = ?auto_1056506 ?auto_1056512 ) ) ( not ( = ?auto_1056506 ?auto_1056513 ) ) ( not ( = ?auto_1056506 ?auto_1056514 ) ) ( not ( = ?auto_1056506 ?auto_1056515 ) ) ( not ( = ?auto_1056507 ?auto_1056509 ) ) ( not ( = ?auto_1056507 ?auto_1056508 ) ) ( not ( = ?auto_1056507 ?auto_1056510 ) ) ( not ( = ?auto_1056507 ?auto_1056511 ) ) ( not ( = ?auto_1056507 ?auto_1056512 ) ) ( not ( = ?auto_1056507 ?auto_1056513 ) ) ( not ( = ?auto_1056507 ?auto_1056514 ) ) ( not ( = ?auto_1056507 ?auto_1056515 ) ) ( not ( = ?auto_1056509 ?auto_1056508 ) ) ( not ( = ?auto_1056509 ?auto_1056510 ) ) ( not ( = ?auto_1056509 ?auto_1056511 ) ) ( not ( = ?auto_1056509 ?auto_1056512 ) ) ( not ( = ?auto_1056509 ?auto_1056513 ) ) ( not ( = ?auto_1056509 ?auto_1056514 ) ) ( not ( = ?auto_1056509 ?auto_1056515 ) ) ( not ( = ?auto_1056508 ?auto_1056510 ) ) ( not ( = ?auto_1056508 ?auto_1056511 ) ) ( not ( = ?auto_1056508 ?auto_1056512 ) ) ( not ( = ?auto_1056508 ?auto_1056513 ) ) ( not ( = ?auto_1056508 ?auto_1056514 ) ) ( not ( = ?auto_1056508 ?auto_1056515 ) ) ( not ( = ?auto_1056510 ?auto_1056511 ) ) ( not ( = ?auto_1056510 ?auto_1056512 ) ) ( not ( = ?auto_1056510 ?auto_1056513 ) ) ( not ( = ?auto_1056510 ?auto_1056514 ) ) ( not ( = ?auto_1056510 ?auto_1056515 ) ) ( not ( = ?auto_1056511 ?auto_1056512 ) ) ( not ( = ?auto_1056511 ?auto_1056513 ) ) ( not ( = ?auto_1056511 ?auto_1056514 ) ) ( not ( = ?auto_1056511 ?auto_1056515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056512 ?auto_1056513 ?auto_1056514 )
      ( MAKE-9CRATE-VERIFY ?auto_1056505 ?auto_1056506 ?auto_1056507 ?auto_1056509 ?auto_1056508 ?auto_1056510 ?auto_1056511 ?auto_1056512 ?auto_1056513 ?auto_1056514 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056614 - SURFACE
      ?auto_1056615 - SURFACE
      ?auto_1056616 - SURFACE
      ?auto_1056618 - SURFACE
      ?auto_1056617 - SURFACE
      ?auto_1056619 - SURFACE
      ?auto_1056620 - SURFACE
      ?auto_1056621 - SURFACE
      ?auto_1056622 - SURFACE
      ?auto_1056623 - SURFACE
    )
    :vars
    (
      ?auto_1056626 - HOIST
      ?auto_1056627 - PLACE
      ?auto_1056625 - PLACE
      ?auto_1056629 - HOIST
      ?auto_1056628 - SURFACE
      ?auto_1056624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056626 ?auto_1056627 ) ( IS-CRATE ?auto_1056623 ) ( not ( = ?auto_1056622 ?auto_1056623 ) ) ( not ( = ?auto_1056621 ?auto_1056622 ) ) ( not ( = ?auto_1056621 ?auto_1056623 ) ) ( not ( = ?auto_1056625 ?auto_1056627 ) ) ( HOIST-AT ?auto_1056629 ?auto_1056625 ) ( not ( = ?auto_1056626 ?auto_1056629 ) ) ( AVAILABLE ?auto_1056629 ) ( SURFACE-AT ?auto_1056623 ?auto_1056625 ) ( ON ?auto_1056623 ?auto_1056628 ) ( CLEAR ?auto_1056623 ) ( not ( = ?auto_1056622 ?auto_1056628 ) ) ( not ( = ?auto_1056623 ?auto_1056628 ) ) ( not ( = ?auto_1056621 ?auto_1056628 ) ) ( TRUCK-AT ?auto_1056624 ?auto_1056627 ) ( SURFACE-AT ?auto_1056621 ?auto_1056627 ) ( CLEAR ?auto_1056621 ) ( LIFTING ?auto_1056626 ?auto_1056622 ) ( IS-CRATE ?auto_1056622 ) ( ON ?auto_1056615 ?auto_1056614 ) ( ON ?auto_1056616 ?auto_1056615 ) ( ON ?auto_1056618 ?auto_1056616 ) ( ON ?auto_1056617 ?auto_1056618 ) ( ON ?auto_1056619 ?auto_1056617 ) ( ON ?auto_1056620 ?auto_1056619 ) ( ON ?auto_1056621 ?auto_1056620 ) ( not ( = ?auto_1056614 ?auto_1056615 ) ) ( not ( = ?auto_1056614 ?auto_1056616 ) ) ( not ( = ?auto_1056614 ?auto_1056618 ) ) ( not ( = ?auto_1056614 ?auto_1056617 ) ) ( not ( = ?auto_1056614 ?auto_1056619 ) ) ( not ( = ?auto_1056614 ?auto_1056620 ) ) ( not ( = ?auto_1056614 ?auto_1056621 ) ) ( not ( = ?auto_1056614 ?auto_1056622 ) ) ( not ( = ?auto_1056614 ?auto_1056623 ) ) ( not ( = ?auto_1056614 ?auto_1056628 ) ) ( not ( = ?auto_1056615 ?auto_1056616 ) ) ( not ( = ?auto_1056615 ?auto_1056618 ) ) ( not ( = ?auto_1056615 ?auto_1056617 ) ) ( not ( = ?auto_1056615 ?auto_1056619 ) ) ( not ( = ?auto_1056615 ?auto_1056620 ) ) ( not ( = ?auto_1056615 ?auto_1056621 ) ) ( not ( = ?auto_1056615 ?auto_1056622 ) ) ( not ( = ?auto_1056615 ?auto_1056623 ) ) ( not ( = ?auto_1056615 ?auto_1056628 ) ) ( not ( = ?auto_1056616 ?auto_1056618 ) ) ( not ( = ?auto_1056616 ?auto_1056617 ) ) ( not ( = ?auto_1056616 ?auto_1056619 ) ) ( not ( = ?auto_1056616 ?auto_1056620 ) ) ( not ( = ?auto_1056616 ?auto_1056621 ) ) ( not ( = ?auto_1056616 ?auto_1056622 ) ) ( not ( = ?auto_1056616 ?auto_1056623 ) ) ( not ( = ?auto_1056616 ?auto_1056628 ) ) ( not ( = ?auto_1056618 ?auto_1056617 ) ) ( not ( = ?auto_1056618 ?auto_1056619 ) ) ( not ( = ?auto_1056618 ?auto_1056620 ) ) ( not ( = ?auto_1056618 ?auto_1056621 ) ) ( not ( = ?auto_1056618 ?auto_1056622 ) ) ( not ( = ?auto_1056618 ?auto_1056623 ) ) ( not ( = ?auto_1056618 ?auto_1056628 ) ) ( not ( = ?auto_1056617 ?auto_1056619 ) ) ( not ( = ?auto_1056617 ?auto_1056620 ) ) ( not ( = ?auto_1056617 ?auto_1056621 ) ) ( not ( = ?auto_1056617 ?auto_1056622 ) ) ( not ( = ?auto_1056617 ?auto_1056623 ) ) ( not ( = ?auto_1056617 ?auto_1056628 ) ) ( not ( = ?auto_1056619 ?auto_1056620 ) ) ( not ( = ?auto_1056619 ?auto_1056621 ) ) ( not ( = ?auto_1056619 ?auto_1056622 ) ) ( not ( = ?auto_1056619 ?auto_1056623 ) ) ( not ( = ?auto_1056619 ?auto_1056628 ) ) ( not ( = ?auto_1056620 ?auto_1056621 ) ) ( not ( = ?auto_1056620 ?auto_1056622 ) ) ( not ( = ?auto_1056620 ?auto_1056623 ) ) ( not ( = ?auto_1056620 ?auto_1056628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056621 ?auto_1056622 ?auto_1056623 )
      ( MAKE-9CRATE-VERIFY ?auto_1056614 ?auto_1056615 ?auto_1056616 ?auto_1056618 ?auto_1056617 ?auto_1056619 ?auto_1056620 ?auto_1056621 ?auto_1056622 ?auto_1056623 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056723 - SURFACE
      ?auto_1056724 - SURFACE
      ?auto_1056725 - SURFACE
      ?auto_1056727 - SURFACE
      ?auto_1056726 - SURFACE
      ?auto_1056728 - SURFACE
      ?auto_1056729 - SURFACE
      ?auto_1056730 - SURFACE
      ?auto_1056731 - SURFACE
      ?auto_1056732 - SURFACE
    )
    :vars
    (
      ?auto_1056734 - HOIST
      ?auto_1056736 - PLACE
      ?auto_1056733 - PLACE
      ?auto_1056735 - HOIST
      ?auto_1056737 - SURFACE
      ?auto_1056738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056734 ?auto_1056736 ) ( IS-CRATE ?auto_1056732 ) ( not ( = ?auto_1056731 ?auto_1056732 ) ) ( not ( = ?auto_1056730 ?auto_1056731 ) ) ( not ( = ?auto_1056730 ?auto_1056732 ) ) ( not ( = ?auto_1056733 ?auto_1056736 ) ) ( HOIST-AT ?auto_1056735 ?auto_1056733 ) ( not ( = ?auto_1056734 ?auto_1056735 ) ) ( AVAILABLE ?auto_1056735 ) ( SURFACE-AT ?auto_1056732 ?auto_1056733 ) ( ON ?auto_1056732 ?auto_1056737 ) ( CLEAR ?auto_1056732 ) ( not ( = ?auto_1056731 ?auto_1056737 ) ) ( not ( = ?auto_1056732 ?auto_1056737 ) ) ( not ( = ?auto_1056730 ?auto_1056737 ) ) ( TRUCK-AT ?auto_1056738 ?auto_1056736 ) ( SURFACE-AT ?auto_1056730 ?auto_1056736 ) ( CLEAR ?auto_1056730 ) ( IS-CRATE ?auto_1056731 ) ( AVAILABLE ?auto_1056734 ) ( IN ?auto_1056731 ?auto_1056738 ) ( ON ?auto_1056724 ?auto_1056723 ) ( ON ?auto_1056725 ?auto_1056724 ) ( ON ?auto_1056727 ?auto_1056725 ) ( ON ?auto_1056726 ?auto_1056727 ) ( ON ?auto_1056728 ?auto_1056726 ) ( ON ?auto_1056729 ?auto_1056728 ) ( ON ?auto_1056730 ?auto_1056729 ) ( not ( = ?auto_1056723 ?auto_1056724 ) ) ( not ( = ?auto_1056723 ?auto_1056725 ) ) ( not ( = ?auto_1056723 ?auto_1056727 ) ) ( not ( = ?auto_1056723 ?auto_1056726 ) ) ( not ( = ?auto_1056723 ?auto_1056728 ) ) ( not ( = ?auto_1056723 ?auto_1056729 ) ) ( not ( = ?auto_1056723 ?auto_1056730 ) ) ( not ( = ?auto_1056723 ?auto_1056731 ) ) ( not ( = ?auto_1056723 ?auto_1056732 ) ) ( not ( = ?auto_1056723 ?auto_1056737 ) ) ( not ( = ?auto_1056724 ?auto_1056725 ) ) ( not ( = ?auto_1056724 ?auto_1056727 ) ) ( not ( = ?auto_1056724 ?auto_1056726 ) ) ( not ( = ?auto_1056724 ?auto_1056728 ) ) ( not ( = ?auto_1056724 ?auto_1056729 ) ) ( not ( = ?auto_1056724 ?auto_1056730 ) ) ( not ( = ?auto_1056724 ?auto_1056731 ) ) ( not ( = ?auto_1056724 ?auto_1056732 ) ) ( not ( = ?auto_1056724 ?auto_1056737 ) ) ( not ( = ?auto_1056725 ?auto_1056727 ) ) ( not ( = ?auto_1056725 ?auto_1056726 ) ) ( not ( = ?auto_1056725 ?auto_1056728 ) ) ( not ( = ?auto_1056725 ?auto_1056729 ) ) ( not ( = ?auto_1056725 ?auto_1056730 ) ) ( not ( = ?auto_1056725 ?auto_1056731 ) ) ( not ( = ?auto_1056725 ?auto_1056732 ) ) ( not ( = ?auto_1056725 ?auto_1056737 ) ) ( not ( = ?auto_1056727 ?auto_1056726 ) ) ( not ( = ?auto_1056727 ?auto_1056728 ) ) ( not ( = ?auto_1056727 ?auto_1056729 ) ) ( not ( = ?auto_1056727 ?auto_1056730 ) ) ( not ( = ?auto_1056727 ?auto_1056731 ) ) ( not ( = ?auto_1056727 ?auto_1056732 ) ) ( not ( = ?auto_1056727 ?auto_1056737 ) ) ( not ( = ?auto_1056726 ?auto_1056728 ) ) ( not ( = ?auto_1056726 ?auto_1056729 ) ) ( not ( = ?auto_1056726 ?auto_1056730 ) ) ( not ( = ?auto_1056726 ?auto_1056731 ) ) ( not ( = ?auto_1056726 ?auto_1056732 ) ) ( not ( = ?auto_1056726 ?auto_1056737 ) ) ( not ( = ?auto_1056728 ?auto_1056729 ) ) ( not ( = ?auto_1056728 ?auto_1056730 ) ) ( not ( = ?auto_1056728 ?auto_1056731 ) ) ( not ( = ?auto_1056728 ?auto_1056732 ) ) ( not ( = ?auto_1056728 ?auto_1056737 ) ) ( not ( = ?auto_1056729 ?auto_1056730 ) ) ( not ( = ?auto_1056729 ?auto_1056731 ) ) ( not ( = ?auto_1056729 ?auto_1056732 ) ) ( not ( = ?auto_1056729 ?auto_1056737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056730 ?auto_1056731 ?auto_1056732 )
      ( MAKE-9CRATE-VERIFY ?auto_1056723 ?auto_1056724 ?auto_1056725 ?auto_1056727 ?auto_1056726 ?auto_1056728 ?auto_1056729 ?auto_1056730 ?auto_1056731 ?auto_1056732 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062276 - SURFACE
      ?auto_1062277 - SURFACE
      ?auto_1062278 - SURFACE
      ?auto_1062280 - SURFACE
      ?auto_1062279 - SURFACE
      ?auto_1062281 - SURFACE
      ?auto_1062282 - SURFACE
      ?auto_1062283 - SURFACE
      ?auto_1062284 - SURFACE
      ?auto_1062285 - SURFACE
      ?auto_1062286 - SURFACE
    )
    :vars
    (
      ?auto_1062287 - HOIST
      ?auto_1062288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062287 ?auto_1062288 ) ( SURFACE-AT ?auto_1062285 ?auto_1062288 ) ( CLEAR ?auto_1062285 ) ( LIFTING ?auto_1062287 ?auto_1062286 ) ( IS-CRATE ?auto_1062286 ) ( not ( = ?auto_1062285 ?auto_1062286 ) ) ( ON ?auto_1062277 ?auto_1062276 ) ( ON ?auto_1062278 ?auto_1062277 ) ( ON ?auto_1062280 ?auto_1062278 ) ( ON ?auto_1062279 ?auto_1062280 ) ( ON ?auto_1062281 ?auto_1062279 ) ( ON ?auto_1062282 ?auto_1062281 ) ( ON ?auto_1062283 ?auto_1062282 ) ( ON ?auto_1062284 ?auto_1062283 ) ( ON ?auto_1062285 ?auto_1062284 ) ( not ( = ?auto_1062276 ?auto_1062277 ) ) ( not ( = ?auto_1062276 ?auto_1062278 ) ) ( not ( = ?auto_1062276 ?auto_1062280 ) ) ( not ( = ?auto_1062276 ?auto_1062279 ) ) ( not ( = ?auto_1062276 ?auto_1062281 ) ) ( not ( = ?auto_1062276 ?auto_1062282 ) ) ( not ( = ?auto_1062276 ?auto_1062283 ) ) ( not ( = ?auto_1062276 ?auto_1062284 ) ) ( not ( = ?auto_1062276 ?auto_1062285 ) ) ( not ( = ?auto_1062276 ?auto_1062286 ) ) ( not ( = ?auto_1062277 ?auto_1062278 ) ) ( not ( = ?auto_1062277 ?auto_1062280 ) ) ( not ( = ?auto_1062277 ?auto_1062279 ) ) ( not ( = ?auto_1062277 ?auto_1062281 ) ) ( not ( = ?auto_1062277 ?auto_1062282 ) ) ( not ( = ?auto_1062277 ?auto_1062283 ) ) ( not ( = ?auto_1062277 ?auto_1062284 ) ) ( not ( = ?auto_1062277 ?auto_1062285 ) ) ( not ( = ?auto_1062277 ?auto_1062286 ) ) ( not ( = ?auto_1062278 ?auto_1062280 ) ) ( not ( = ?auto_1062278 ?auto_1062279 ) ) ( not ( = ?auto_1062278 ?auto_1062281 ) ) ( not ( = ?auto_1062278 ?auto_1062282 ) ) ( not ( = ?auto_1062278 ?auto_1062283 ) ) ( not ( = ?auto_1062278 ?auto_1062284 ) ) ( not ( = ?auto_1062278 ?auto_1062285 ) ) ( not ( = ?auto_1062278 ?auto_1062286 ) ) ( not ( = ?auto_1062280 ?auto_1062279 ) ) ( not ( = ?auto_1062280 ?auto_1062281 ) ) ( not ( = ?auto_1062280 ?auto_1062282 ) ) ( not ( = ?auto_1062280 ?auto_1062283 ) ) ( not ( = ?auto_1062280 ?auto_1062284 ) ) ( not ( = ?auto_1062280 ?auto_1062285 ) ) ( not ( = ?auto_1062280 ?auto_1062286 ) ) ( not ( = ?auto_1062279 ?auto_1062281 ) ) ( not ( = ?auto_1062279 ?auto_1062282 ) ) ( not ( = ?auto_1062279 ?auto_1062283 ) ) ( not ( = ?auto_1062279 ?auto_1062284 ) ) ( not ( = ?auto_1062279 ?auto_1062285 ) ) ( not ( = ?auto_1062279 ?auto_1062286 ) ) ( not ( = ?auto_1062281 ?auto_1062282 ) ) ( not ( = ?auto_1062281 ?auto_1062283 ) ) ( not ( = ?auto_1062281 ?auto_1062284 ) ) ( not ( = ?auto_1062281 ?auto_1062285 ) ) ( not ( = ?auto_1062281 ?auto_1062286 ) ) ( not ( = ?auto_1062282 ?auto_1062283 ) ) ( not ( = ?auto_1062282 ?auto_1062284 ) ) ( not ( = ?auto_1062282 ?auto_1062285 ) ) ( not ( = ?auto_1062282 ?auto_1062286 ) ) ( not ( = ?auto_1062283 ?auto_1062284 ) ) ( not ( = ?auto_1062283 ?auto_1062285 ) ) ( not ( = ?auto_1062283 ?auto_1062286 ) ) ( not ( = ?auto_1062284 ?auto_1062285 ) ) ( not ( = ?auto_1062284 ?auto_1062286 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1062285 ?auto_1062286 )
      ( MAKE-10CRATE-VERIFY ?auto_1062276 ?auto_1062277 ?auto_1062278 ?auto_1062280 ?auto_1062279 ?auto_1062281 ?auto_1062282 ?auto_1062283 ?auto_1062284 ?auto_1062285 ?auto_1062286 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062370 - SURFACE
      ?auto_1062371 - SURFACE
      ?auto_1062372 - SURFACE
      ?auto_1062374 - SURFACE
      ?auto_1062373 - SURFACE
      ?auto_1062375 - SURFACE
      ?auto_1062376 - SURFACE
      ?auto_1062377 - SURFACE
      ?auto_1062378 - SURFACE
      ?auto_1062379 - SURFACE
      ?auto_1062380 - SURFACE
    )
    :vars
    (
      ?auto_1062382 - HOIST
      ?auto_1062383 - PLACE
      ?auto_1062381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062382 ?auto_1062383 ) ( SURFACE-AT ?auto_1062379 ?auto_1062383 ) ( CLEAR ?auto_1062379 ) ( IS-CRATE ?auto_1062380 ) ( not ( = ?auto_1062379 ?auto_1062380 ) ) ( TRUCK-AT ?auto_1062381 ?auto_1062383 ) ( AVAILABLE ?auto_1062382 ) ( IN ?auto_1062380 ?auto_1062381 ) ( ON ?auto_1062379 ?auto_1062378 ) ( not ( = ?auto_1062378 ?auto_1062379 ) ) ( not ( = ?auto_1062378 ?auto_1062380 ) ) ( ON ?auto_1062371 ?auto_1062370 ) ( ON ?auto_1062372 ?auto_1062371 ) ( ON ?auto_1062374 ?auto_1062372 ) ( ON ?auto_1062373 ?auto_1062374 ) ( ON ?auto_1062375 ?auto_1062373 ) ( ON ?auto_1062376 ?auto_1062375 ) ( ON ?auto_1062377 ?auto_1062376 ) ( ON ?auto_1062378 ?auto_1062377 ) ( not ( = ?auto_1062370 ?auto_1062371 ) ) ( not ( = ?auto_1062370 ?auto_1062372 ) ) ( not ( = ?auto_1062370 ?auto_1062374 ) ) ( not ( = ?auto_1062370 ?auto_1062373 ) ) ( not ( = ?auto_1062370 ?auto_1062375 ) ) ( not ( = ?auto_1062370 ?auto_1062376 ) ) ( not ( = ?auto_1062370 ?auto_1062377 ) ) ( not ( = ?auto_1062370 ?auto_1062378 ) ) ( not ( = ?auto_1062370 ?auto_1062379 ) ) ( not ( = ?auto_1062370 ?auto_1062380 ) ) ( not ( = ?auto_1062371 ?auto_1062372 ) ) ( not ( = ?auto_1062371 ?auto_1062374 ) ) ( not ( = ?auto_1062371 ?auto_1062373 ) ) ( not ( = ?auto_1062371 ?auto_1062375 ) ) ( not ( = ?auto_1062371 ?auto_1062376 ) ) ( not ( = ?auto_1062371 ?auto_1062377 ) ) ( not ( = ?auto_1062371 ?auto_1062378 ) ) ( not ( = ?auto_1062371 ?auto_1062379 ) ) ( not ( = ?auto_1062371 ?auto_1062380 ) ) ( not ( = ?auto_1062372 ?auto_1062374 ) ) ( not ( = ?auto_1062372 ?auto_1062373 ) ) ( not ( = ?auto_1062372 ?auto_1062375 ) ) ( not ( = ?auto_1062372 ?auto_1062376 ) ) ( not ( = ?auto_1062372 ?auto_1062377 ) ) ( not ( = ?auto_1062372 ?auto_1062378 ) ) ( not ( = ?auto_1062372 ?auto_1062379 ) ) ( not ( = ?auto_1062372 ?auto_1062380 ) ) ( not ( = ?auto_1062374 ?auto_1062373 ) ) ( not ( = ?auto_1062374 ?auto_1062375 ) ) ( not ( = ?auto_1062374 ?auto_1062376 ) ) ( not ( = ?auto_1062374 ?auto_1062377 ) ) ( not ( = ?auto_1062374 ?auto_1062378 ) ) ( not ( = ?auto_1062374 ?auto_1062379 ) ) ( not ( = ?auto_1062374 ?auto_1062380 ) ) ( not ( = ?auto_1062373 ?auto_1062375 ) ) ( not ( = ?auto_1062373 ?auto_1062376 ) ) ( not ( = ?auto_1062373 ?auto_1062377 ) ) ( not ( = ?auto_1062373 ?auto_1062378 ) ) ( not ( = ?auto_1062373 ?auto_1062379 ) ) ( not ( = ?auto_1062373 ?auto_1062380 ) ) ( not ( = ?auto_1062375 ?auto_1062376 ) ) ( not ( = ?auto_1062375 ?auto_1062377 ) ) ( not ( = ?auto_1062375 ?auto_1062378 ) ) ( not ( = ?auto_1062375 ?auto_1062379 ) ) ( not ( = ?auto_1062375 ?auto_1062380 ) ) ( not ( = ?auto_1062376 ?auto_1062377 ) ) ( not ( = ?auto_1062376 ?auto_1062378 ) ) ( not ( = ?auto_1062376 ?auto_1062379 ) ) ( not ( = ?auto_1062376 ?auto_1062380 ) ) ( not ( = ?auto_1062377 ?auto_1062378 ) ) ( not ( = ?auto_1062377 ?auto_1062379 ) ) ( not ( = ?auto_1062377 ?auto_1062380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062378 ?auto_1062379 ?auto_1062380 )
      ( MAKE-10CRATE-VERIFY ?auto_1062370 ?auto_1062371 ?auto_1062372 ?auto_1062374 ?auto_1062373 ?auto_1062375 ?auto_1062376 ?auto_1062377 ?auto_1062378 ?auto_1062379 ?auto_1062380 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062475 - SURFACE
      ?auto_1062476 - SURFACE
      ?auto_1062477 - SURFACE
      ?auto_1062479 - SURFACE
      ?auto_1062478 - SURFACE
      ?auto_1062480 - SURFACE
      ?auto_1062481 - SURFACE
      ?auto_1062482 - SURFACE
      ?auto_1062483 - SURFACE
      ?auto_1062484 - SURFACE
      ?auto_1062485 - SURFACE
    )
    :vars
    (
      ?auto_1062486 - HOIST
      ?auto_1062488 - PLACE
      ?auto_1062489 - TRUCK
      ?auto_1062487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062486 ?auto_1062488 ) ( SURFACE-AT ?auto_1062484 ?auto_1062488 ) ( CLEAR ?auto_1062484 ) ( IS-CRATE ?auto_1062485 ) ( not ( = ?auto_1062484 ?auto_1062485 ) ) ( AVAILABLE ?auto_1062486 ) ( IN ?auto_1062485 ?auto_1062489 ) ( ON ?auto_1062484 ?auto_1062483 ) ( not ( = ?auto_1062483 ?auto_1062484 ) ) ( not ( = ?auto_1062483 ?auto_1062485 ) ) ( TRUCK-AT ?auto_1062489 ?auto_1062487 ) ( not ( = ?auto_1062487 ?auto_1062488 ) ) ( ON ?auto_1062476 ?auto_1062475 ) ( ON ?auto_1062477 ?auto_1062476 ) ( ON ?auto_1062479 ?auto_1062477 ) ( ON ?auto_1062478 ?auto_1062479 ) ( ON ?auto_1062480 ?auto_1062478 ) ( ON ?auto_1062481 ?auto_1062480 ) ( ON ?auto_1062482 ?auto_1062481 ) ( ON ?auto_1062483 ?auto_1062482 ) ( not ( = ?auto_1062475 ?auto_1062476 ) ) ( not ( = ?auto_1062475 ?auto_1062477 ) ) ( not ( = ?auto_1062475 ?auto_1062479 ) ) ( not ( = ?auto_1062475 ?auto_1062478 ) ) ( not ( = ?auto_1062475 ?auto_1062480 ) ) ( not ( = ?auto_1062475 ?auto_1062481 ) ) ( not ( = ?auto_1062475 ?auto_1062482 ) ) ( not ( = ?auto_1062475 ?auto_1062483 ) ) ( not ( = ?auto_1062475 ?auto_1062484 ) ) ( not ( = ?auto_1062475 ?auto_1062485 ) ) ( not ( = ?auto_1062476 ?auto_1062477 ) ) ( not ( = ?auto_1062476 ?auto_1062479 ) ) ( not ( = ?auto_1062476 ?auto_1062478 ) ) ( not ( = ?auto_1062476 ?auto_1062480 ) ) ( not ( = ?auto_1062476 ?auto_1062481 ) ) ( not ( = ?auto_1062476 ?auto_1062482 ) ) ( not ( = ?auto_1062476 ?auto_1062483 ) ) ( not ( = ?auto_1062476 ?auto_1062484 ) ) ( not ( = ?auto_1062476 ?auto_1062485 ) ) ( not ( = ?auto_1062477 ?auto_1062479 ) ) ( not ( = ?auto_1062477 ?auto_1062478 ) ) ( not ( = ?auto_1062477 ?auto_1062480 ) ) ( not ( = ?auto_1062477 ?auto_1062481 ) ) ( not ( = ?auto_1062477 ?auto_1062482 ) ) ( not ( = ?auto_1062477 ?auto_1062483 ) ) ( not ( = ?auto_1062477 ?auto_1062484 ) ) ( not ( = ?auto_1062477 ?auto_1062485 ) ) ( not ( = ?auto_1062479 ?auto_1062478 ) ) ( not ( = ?auto_1062479 ?auto_1062480 ) ) ( not ( = ?auto_1062479 ?auto_1062481 ) ) ( not ( = ?auto_1062479 ?auto_1062482 ) ) ( not ( = ?auto_1062479 ?auto_1062483 ) ) ( not ( = ?auto_1062479 ?auto_1062484 ) ) ( not ( = ?auto_1062479 ?auto_1062485 ) ) ( not ( = ?auto_1062478 ?auto_1062480 ) ) ( not ( = ?auto_1062478 ?auto_1062481 ) ) ( not ( = ?auto_1062478 ?auto_1062482 ) ) ( not ( = ?auto_1062478 ?auto_1062483 ) ) ( not ( = ?auto_1062478 ?auto_1062484 ) ) ( not ( = ?auto_1062478 ?auto_1062485 ) ) ( not ( = ?auto_1062480 ?auto_1062481 ) ) ( not ( = ?auto_1062480 ?auto_1062482 ) ) ( not ( = ?auto_1062480 ?auto_1062483 ) ) ( not ( = ?auto_1062480 ?auto_1062484 ) ) ( not ( = ?auto_1062480 ?auto_1062485 ) ) ( not ( = ?auto_1062481 ?auto_1062482 ) ) ( not ( = ?auto_1062481 ?auto_1062483 ) ) ( not ( = ?auto_1062481 ?auto_1062484 ) ) ( not ( = ?auto_1062481 ?auto_1062485 ) ) ( not ( = ?auto_1062482 ?auto_1062483 ) ) ( not ( = ?auto_1062482 ?auto_1062484 ) ) ( not ( = ?auto_1062482 ?auto_1062485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062483 ?auto_1062484 ?auto_1062485 )
      ( MAKE-10CRATE-VERIFY ?auto_1062475 ?auto_1062476 ?auto_1062477 ?auto_1062479 ?auto_1062478 ?auto_1062480 ?auto_1062481 ?auto_1062482 ?auto_1062483 ?auto_1062484 ?auto_1062485 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062590 - SURFACE
      ?auto_1062591 - SURFACE
      ?auto_1062592 - SURFACE
      ?auto_1062594 - SURFACE
      ?auto_1062593 - SURFACE
      ?auto_1062595 - SURFACE
      ?auto_1062596 - SURFACE
      ?auto_1062597 - SURFACE
      ?auto_1062598 - SURFACE
      ?auto_1062599 - SURFACE
      ?auto_1062600 - SURFACE
    )
    :vars
    (
      ?auto_1062603 - HOIST
      ?auto_1062605 - PLACE
      ?auto_1062602 - TRUCK
      ?auto_1062601 - PLACE
      ?auto_1062604 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062603 ?auto_1062605 ) ( SURFACE-AT ?auto_1062599 ?auto_1062605 ) ( CLEAR ?auto_1062599 ) ( IS-CRATE ?auto_1062600 ) ( not ( = ?auto_1062599 ?auto_1062600 ) ) ( AVAILABLE ?auto_1062603 ) ( ON ?auto_1062599 ?auto_1062598 ) ( not ( = ?auto_1062598 ?auto_1062599 ) ) ( not ( = ?auto_1062598 ?auto_1062600 ) ) ( TRUCK-AT ?auto_1062602 ?auto_1062601 ) ( not ( = ?auto_1062601 ?auto_1062605 ) ) ( HOIST-AT ?auto_1062604 ?auto_1062601 ) ( LIFTING ?auto_1062604 ?auto_1062600 ) ( not ( = ?auto_1062603 ?auto_1062604 ) ) ( ON ?auto_1062591 ?auto_1062590 ) ( ON ?auto_1062592 ?auto_1062591 ) ( ON ?auto_1062594 ?auto_1062592 ) ( ON ?auto_1062593 ?auto_1062594 ) ( ON ?auto_1062595 ?auto_1062593 ) ( ON ?auto_1062596 ?auto_1062595 ) ( ON ?auto_1062597 ?auto_1062596 ) ( ON ?auto_1062598 ?auto_1062597 ) ( not ( = ?auto_1062590 ?auto_1062591 ) ) ( not ( = ?auto_1062590 ?auto_1062592 ) ) ( not ( = ?auto_1062590 ?auto_1062594 ) ) ( not ( = ?auto_1062590 ?auto_1062593 ) ) ( not ( = ?auto_1062590 ?auto_1062595 ) ) ( not ( = ?auto_1062590 ?auto_1062596 ) ) ( not ( = ?auto_1062590 ?auto_1062597 ) ) ( not ( = ?auto_1062590 ?auto_1062598 ) ) ( not ( = ?auto_1062590 ?auto_1062599 ) ) ( not ( = ?auto_1062590 ?auto_1062600 ) ) ( not ( = ?auto_1062591 ?auto_1062592 ) ) ( not ( = ?auto_1062591 ?auto_1062594 ) ) ( not ( = ?auto_1062591 ?auto_1062593 ) ) ( not ( = ?auto_1062591 ?auto_1062595 ) ) ( not ( = ?auto_1062591 ?auto_1062596 ) ) ( not ( = ?auto_1062591 ?auto_1062597 ) ) ( not ( = ?auto_1062591 ?auto_1062598 ) ) ( not ( = ?auto_1062591 ?auto_1062599 ) ) ( not ( = ?auto_1062591 ?auto_1062600 ) ) ( not ( = ?auto_1062592 ?auto_1062594 ) ) ( not ( = ?auto_1062592 ?auto_1062593 ) ) ( not ( = ?auto_1062592 ?auto_1062595 ) ) ( not ( = ?auto_1062592 ?auto_1062596 ) ) ( not ( = ?auto_1062592 ?auto_1062597 ) ) ( not ( = ?auto_1062592 ?auto_1062598 ) ) ( not ( = ?auto_1062592 ?auto_1062599 ) ) ( not ( = ?auto_1062592 ?auto_1062600 ) ) ( not ( = ?auto_1062594 ?auto_1062593 ) ) ( not ( = ?auto_1062594 ?auto_1062595 ) ) ( not ( = ?auto_1062594 ?auto_1062596 ) ) ( not ( = ?auto_1062594 ?auto_1062597 ) ) ( not ( = ?auto_1062594 ?auto_1062598 ) ) ( not ( = ?auto_1062594 ?auto_1062599 ) ) ( not ( = ?auto_1062594 ?auto_1062600 ) ) ( not ( = ?auto_1062593 ?auto_1062595 ) ) ( not ( = ?auto_1062593 ?auto_1062596 ) ) ( not ( = ?auto_1062593 ?auto_1062597 ) ) ( not ( = ?auto_1062593 ?auto_1062598 ) ) ( not ( = ?auto_1062593 ?auto_1062599 ) ) ( not ( = ?auto_1062593 ?auto_1062600 ) ) ( not ( = ?auto_1062595 ?auto_1062596 ) ) ( not ( = ?auto_1062595 ?auto_1062597 ) ) ( not ( = ?auto_1062595 ?auto_1062598 ) ) ( not ( = ?auto_1062595 ?auto_1062599 ) ) ( not ( = ?auto_1062595 ?auto_1062600 ) ) ( not ( = ?auto_1062596 ?auto_1062597 ) ) ( not ( = ?auto_1062596 ?auto_1062598 ) ) ( not ( = ?auto_1062596 ?auto_1062599 ) ) ( not ( = ?auto_1062596 ?auto_1062600 ) ) ( not ( = ?auto_1062597 ?auto_1062598 ) ) ( not ( = ?auto_1062597 ?auto_1062599 ) ) ( not ( = ?auto_1062597 ?auto_1062600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062598 ?auto_1062599 ?auto_1062600 )
      ( MAKE-10CRATE-VERIFY ?auto_1062590 ?auto_1062591 ?auto_1062592 ?auto_1062594 ?auto_1062593 ?auto_1062595 ?auto_1062596 ?auto_1062597 ?auto_1062598 ?auto_1062599 ?auto_1062600 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062715 - SURFACE
      ?auto_1062716 - SURFACE
      ?auto_1062717 - SURFACE
      ?auto_1062719 - SURFACE
      ?auto_1062718 - SURFACE
      ?auto_1062720 - SURFACE
      ?auto_1062721 - SURFACE
      ?auto_1062722 - SURFACE
      ?auto_1062723 - SURFACE
      ?auto_1062724 - SURFACE
      ?auto_1062725 - SURFACE
    )
    :vars
    (
      ?auto_1062731 - HOIST
      ?auto_1062730 - PLACE
      ?auto_1062727 - TRUCK
      ?auto_1062726 - PLACE
      ?auto_1062729 - HOIST
      ?auto_1062728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062731 ?auto_1062730 ) ( SURFACE-AT ?auto_1062724 ?auto_1062730 ) ( CLEAR ?auto_1062724 ) ( IS-CRATE ?auto_1062725 ) ( not ( = ?auto_1062724 ?auto_1062725 ) ) ( AVAILABLE ?auto_1062731 ) ( ON ?auto_1062724 ?auto_1062723 ) ( not ( = ?auto_1062723 ?auto_1062724 ) ) ( not ( = ?auto_1062723 ?auto_1062725 ) ) ( TRUCK-AT ?auto_1062727 ?auto_1062726 ) ( not ( = ?auto_1062726 ?auto_1062730 ) ) ( HOIST-AT ?auto_1062729 ?auto_1062726 ) ( not ( = ?auto_1062731 ?auto_1062729 ) ) ( AVAILABLE ?auto_1062729 ) ( SURFACE-AT ?auto_1062725 ?auto_1062726 ) ( ON ?auto_1062725 ?auto_1062728 ) ( CLEAR ?auto_1062725 ) ( not ( = ?auto_1062724 ?auto_1062728 ) ) ( not ( = ?auto_1062725 ?auto_1062728 ) ) ( not ( = ?auto_1062723 ?auto_1062728 ) ) ( ON ?auto_1062716 ?auto_1062715 ) ( ON ?auto_1062717 ?auto_1062716 ) ( ON ?auto_1062719 ?auto_1062717 ) ( ON ?auto_1062718 ?auto_1062719 ) ( ON ?auto_1062720 ?auto_1062718 ) ( ON ?auto_1062721 ?auto_1062720 ) ( ON ?auto_1062722 ?auto_1062721 ) ( ON ?auto_1062723 ?auto_1062722 ) ( not ( = ?auto_1062715 ?auto_1062716 ) ) ( not ( = ?auto_1062715 ?auto_1062717 ) ) ( not ( = ?auto_1062715 ?auto_1062719 ) ) ( not ( = ?auto_1062715 ?auto_1062718 ) ) ( not ( = ?auto_1062715 ?auto_1062720 ) ) ( not ( = ?auto_1062715 ?auto_1062721 ) ) ( not ( = ?auto_1062715 ?auto_1062722 ) ) ( not ( = ?auto_1062715 ?auto_1062723 ) ) ( not ( = ?auto_1062715 ?auto_1062724 ) ) ( not ( = ?auto_1062715 ?auto_1062725 ) ) ( not ( = ?auto_1062715 ?auto_1062728 ) ) ( not ( = ?auto_1062716 ?auto_1062717 ) ) ( not ( = ?auto_1062716 ?auto_1062719 ) ) ( not ( = ?auto_1062716 ?auto_1062718 ) ) ( not ( = ?auto_1062716 ?auto_1062720 ) ) ( not ( = ?auto_1062716 ?auto_1062721 ) ) ( not ( = ?auto_1062716 ?auto_1062722 ) ) ( not ( = ?auto_1062716 ?auto_1062723 ) ) ( not ( = ?auto_1062716 ?auto_1062724 ) ) ( not ( = ?auto_1062716 ?auto_1062725 ) ) ( not ( = ?auto_1062716 ?auto_1062728 ) ) ( not ( = ?auto_1062717 ?auto_1062719 ) ) ( not ( = ?auto_1062717 ?auto_1062718 ) ) ( not ( = ?auto_1062717 ?auto_1062720 ) ) ( not ( = ?auto_1062717 ?auto_1062721 ) ) ( not ( = ?auto_1062717 ?auto_1062722 ) ) ( not ( = ?auto_1062717 ?auto_1062723 ) ) ( not ( = ?auto_1062717 ?auto_1062724 ) ) ( not ( = ?auto_1062717 ?auto_1062725 ) ) ( not ( = ?auto_1062717 ?auto_1062728 ) ) ( not ( = ?auto_1062719 ?auto_1062718 ) ) ( not ( = ?auto_1062719 ?auto_1062720 ) ) ( not ( = ?auto_1062719 ?auto_1062721 ) ) ( not ( = ?auto_1062719 ?auto_1062722 ) ) ( not ( = ?auto_1062719 ?auto_1062723 ) ) ( not ( = ?auto_1062719 ?auto_1062724 ) ) ( not ( = ?auto_1062719 ?auto_1062725 ) ) ( not ( = ?auto_1062719 ?auto_1062728 ) ) ( not ( = ?auto_1062718 ?auto_1062720 ) ) ( not ( = ?auto_1062718 ?auto_1062721 ) ) ( not ( = ?auto_1062718 ?auto_1062722 ) ) ( not ( = ?auto_1062718 ?auto_1062723 ) ) ( not ( = ?auto_1062718 ?auto_1062724 ) ) ( not ( = ?auto_1062718 ?auto_1062725 ) ) ( not ( = ?auto_1062718 ?auto_1062728 ) ) ( not ( = ?auto_1062720 ?auto_1062721 ) ) ( not ( = ?auto_1062720 ?auto_1062722 ) ) ( not ( = ?auto_1062720 ?auto_1062723 ) ) ( not ( = ?auto_1062720 ?auto_1062724 ) ) ( not ( = ?auto_1062720 ?auto_1062725 ) ) ( not ( = ?auto_1062720 ?auto_1062728 ) ) ( not ( = ?auto_1062721 ?auto_1062722 ) ) ( not ( = ?auto_1062721 ?auto_1062723 ) ) ( not ( = ?auto_1062721 ?auto_1062724 ) ) ( not ( = ?auto_1062721 ?auto_1062725 ) ) ( not ( = ?auto_1062721 ?auto_1062728 ) ) ( not ( = ?auto_1062722 ?auto_1062723 ) ) ( not ( = ?auto_1062722 ?auto_1062724 ) ) ( not ( = ?auto_1062722 ?auto_1062725 ) ) ( not ( = ?auto_1062722 ?auto_1062728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062723 ?auto_1062724 ?auto_1062725 )
      ( MAKE-10CRATE-VERIFY ?auto_1062715 ?auto_1062716 ?auto_1062717 ?auto_1062719 ?auto_1062718 ?auto_1062720 ?auto_1062721 ?auto_1062722 ?auto_1062723 ?auto_1062724 ?auto_1062725 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062841 - SURFACE
      ?auto_1062842 - SURFACE
      ?auto_1062843 - SURFACE
      ?auto_1062845 - SURFACE
      ?auto_1062844 - SURFACE
      ?auto_1062846 - SURFACE
      ?auto_1062847 - SURFACE
      ?auto_1062848 - SURFACE
      ?auto_1062849 - SURFACE
      ?auto_1062850 - SURFACE
      ?auto_1062851 - SURFACE
    )
    :vars
    (
      ?auto_1062853 - HOIST
      ?auto_1062854 - PLACE
      ?auto_1062855 - PLACE
      ?auto_1062856 - HOIST
      ?auto_1062852 - SURFACE
      ?auto_1062857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062853 ?auto_1062854 ) ( SURFACE-AT ?auto_1062850 ?auto_1062854 ) ( CLEAR ?auto_1062850 ) ( IS-CRATE ?auto_1062851 ) ( not ( = ?auto_1062850 ?auto_1062851 ) ) ( AVAILABLE ?auto_1062853 ) ( ON ?auto_1062850 ?auto_1062849 ) ( not ( = ?auto_1062849 ?auto_1062850 ) ) ( not ( = ?auto_1062849 ?auto_1062851 ) ) ( not ( = ?auto_1062855 ?auto_1062854 ) ) ( HOIST-AT ?auto_1062856 ?auto_1062855 ) ( not ( = ?auto_1062853 ?auto_1062856 ) ) ( AVAILABLE ?auto_1062856 ) ( SURFACE-AT ?auto_1062851 ?auto_1062855 ) ( ON ?auto_1062851 ?auto_1062852 ) ( CLEAR ?auto_1062851 ) ( not ( = ?auto_1062850 ?auto_1062852 ) ) ( not ( = ?auto_1062851 ?auto_1062852 ) ) ( not ( = ?auto_1062849 ?auto_1062852 ) ) ( TRUCK-AT ?auto_1062857 ?auto_1062854 ) ( ON ?auto_1062842 ?auto_1062841 ) ( ON ?auto_1062843 ?auto_1062842 ) ( ON ?auto_1062845 ?auto_1062843 ) ( ON ?auto_1062844 ?auto_1062845 ) ( ON ?auto_1062846 ?auto_1062844 ) ( ON ?auto_1062847 ?auto_1062846 ) ( ON ?auto_1062848 ?auto_1062847 ) ( ON ?auto_1062849 ?auto_1062848 ) ( not ( = ?auto_1062841 ?auto_1062842 ) ) ( not ( = ?auto_1062841 ?auto_1062843 ) ) ( not ( = ?auto_1062841 ?auto_1062845 ) ) ( not ( = ?auto_1062841 ?auto_1062844 ) ) ( not ( = ?auto_1062841 ?auto_1062846 ) ) ( not ( = ?auto_1062841 ?auto_1062847 ) ) ( not ( = ?auto_1062841 ?auto_1062848 ) ) ( not ( = ?auto_1062841 ?auto_1062849 ) ) ( not ( = ?auto_1062841 ?auto_1062850 ) ) ( not ( = ?auto_1062841 ?auto_1062851 ) ) ( not ( = ?auto_1062841 ?auto_1062852 ) ) ( not ( = ?auto_1062842 ?auto_1062843 ) ) ( not ( = ?auto_1062842 ?auto_1062845 ) ) ( not ( = ?auto_1062842 ?auto_1062844 ) ) ( not ( = ?auto_1062842 ?auto_1062846 ) ) ( not ( = ?auto_1062842 ?auto_1062847 ) ) ( not ( = ?auto_1062842 ?auto_1062848 ) ) ( not ( = ?auto_1062842 ?auto_1062849 ) ) ( not ( = ?auto_1062842 ?auto_1062850 ) ) ( not ( = ?auto_1062842 ?auto_1062851 ) ) ( not ( = ?auto_1062842 ?auto_1062852 ) ) ( not ( = ?auto_1062843 ?auto_1062845 ) ) ( not ( = ?auto_1062843 ?auto_1062844 ) ) ( not ( = ?auto_1062843 ?auto_1062846 ) ) ( not ( = ?auto_1062843 ?auto_1062847 ) ) ( not ( = ?auto_1062843 ?auto_1062848 ) ) ( not ( = ?auto_1062843 ?auto_1062849 ) ) ( not ( = ?auto_1062843 ?auto_1062850 ) ) ( not ( = ?auto_1062843 ?auto_1062851 ) ) ( not ( = ?auto_1062843 ?auto_1062852 ) ) ( not ( = ?auto_1062845 ?auto_1062844 ) ) ( not ( = ?auto_1062845 ?auto_1062846 ) ) ( not ( = ?auto_1062845 ?auto_1062847 ) ) ( not ( = ?auto_1062845 ?auto_1062848 ) ) ( not ( = ?auto_1062845 ?auto_1062849 ) ) ( not ( = ?auto_1062845 ?auto_1062850 ) ) ( not ( = ?auto_1062845 ?auto_1062851 ) ) ( not ( = ?auto_1062845 ?auto_1062852 ) ) ( not ( = ?auto_1062844 ?auto_1062846 ) ) ( not ( = ?auto_1062844 ?auto_1062847 ) ) ( not ( = ?auto_1062844 ?auto_1062848 ) ) ( not ( = ?auto_1062844 ?auto_1062849 ) ) ( not ( = ?auto_1062844 ?auto_1062850 ) ) ( not ( = ?auto_1062844 ?auto_1062851 ) ) ( not ( = ?auto_1062844 ?auto_1062852 ) ) ( not ( = ?auto_1062846 ?auto_1062847 ) ) ( not ( = ?auto_1062846 ?auto_1062848 ) ) ( not ( = ?auto_1062846 ?auto_1062849 ) ) ( not ( = ?auto_1062846 ?auto_1062850 ) ) ( not ( = ?auto_1062846 ?auto_1062851 ) ) ( not ( = ?auto_1062846 ?auto_1062852 ) ) ( not ( = ?auto_1062847 ?auto_1062848 ) ) ( not ( = ?auto_1062847 ?auto_1062849 ) ) ( not ( = ?auto_1062847 ?auto_1062850 ) ) ( not ( = ?auto_1062847 ?auto_1062851 ) ) ( not ( = ?auto_1062847 ?auto_1062852 ) ) ( not ( = ?auto_1062848 ?auto_1062849 ) ) ( not ( = ?auto_1062848 ?auto_1062850 ) ) ( not ( = ?auto_1062848 ?auto_1062851 ) ) ( not ( = ?auto_1062848 ?auto_1062852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062849 ?auto_1062850 ?auto_1062851 )
      ( MAKE-10CRATE-VERIFY ?auto_1062841 ?auto_1062842 ?auto_1062843 ?auto_1062845 ?auto_1062844 ?auto_1062846 ?auto_1062847 ?auto_1062848 ?auto_1062849 ?auto_1062850 ?auto_1062851 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062967 - SURFACE
      ?auto_1062968 - SURFACE
      ?auto_1062969 - SURFACE
      ?auto_1062971 - SURFACE
      ?auto_1062970 - SURFACE
      ?auto_1062972 - SURFACE
      ?auto_1062973 - SURFACE
      ?auto_1062974 - SURFACE
      ?auto_1062975 - SURFACE
      ?auto_1062976 - SURFACE
      ?auto_1062977 - SURFACE
    )
    :vars
    (
      ?auto_1062981 - HOIST
      ?auto_1062979 - PLACE
      ?auto_1062980 - PLACE
      ?auto_1062983 - HOIST
      ?auto_1062982 - SURFACE
      ?auto_1062978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062981 ?auto_1062979 ) ( IS-CRATE ?auto_1062977 ) ( not ( = ?auto_1062976 ?auto_1062977 ) ) ( not ( = ?auto_1062975 ?auto_1062976 ) ) ( not ( = ?auto_1062975 ?auto_1062977 ) ) ( not ( = ?auto_1062980 ?auto_1062979 ) ) ( HOIST-AT ?auto_1062983 ?auto_1062980 ) ( not ( = ?auto_1062981 ?auto_1062983 ) ) ( AVAILABLE ?auto_1062983 ) ( SURFACE-AT ?auto_1062977 ?auto_1062980 ) ( ON ?auto_1062977 ?auto_1062982 ) ( CLEAR ?auto_1062977 ) ( not ( = ?auto_1062976 ?auto_1062982 ) ) ( not ( = ?auto_1062977 ?auto_1062982 ) ) ( not ( = ?auto_1062975 ?auto_1062982 ) ) ( TRUCK-AT ?auto_1062978 ?auto_1062979 ) ( SURFACE-AT ?auto_1062975 ?auto_1062979 ) ( CLEAR ?auto_1062975 ) ( LIFTING ?auto_1062981 ?auto_1062976 ) ( IS-CRATE ?auto_1062976 ) ( ON ?auto_1062968 ?auto_1062967 ) ( ON ?auto_1062969 ?auto_1062968 ) ( ON ?auto_1062971 ?auto_1062969 ) ( ON ?auto_1062970 ?auto_1062971 ) ( ON ?auto_1062972 ?auto_1062970 ) ( ON ?auto_1062973 ?auto_1062972 ) ( ON ?auto_1062974 ?auto_1062973 ) ( ON ?auto_1062975 ?auto_1062974 ) ( not ( = ?auto_1062967 ?auto_1062968 ) ) ( not ( = ?auto_1062967 ?auto_1062969 ) ) ( not ( = ?auto_1062967 ?auto_1062971 ) ) ( not ( = ?auto_1062967 ?auto_1062970 ) ) ( not ( = ?auto_1062967 ?auto_1062972 ) ) ( not ( = ?auto_1062967 ?auto_1062973 ) ) ( not ( = ?auto_1062967 ?auto_1062974 ) ) ( not ( = ?auto_1062967 ?auto_1062975 ) ) ( not ( = ?auto_1062967 ?auto_1062976 ) ) ( not ( = ?auto_1062967 ?auto_1062977 ) ) ( not ( = ?auto_1062967 ?auto_1062982 ) ) ( not ( = ?auto_1062968 ?auto_1062969 ) ) ( not ( = ?auto_1062968 ?auto_1062971 ) ) ( not ( = ?auto_1062968 ?auto_1062970 ) ) ( not ( = ?auto_1062968 ?auto_1062972 ) ) ( not ( = ?auto_1062968 ?auto_1062973 ) ) ( not ( = ?auto_1062968 ?auto_1062974 ) ) ( not ( = ?auto_1062968 ?auto_1062975 ) ) ( not ( = ?auto_1062968 ?auto_1062976 ) ) ( not ( = ?auto_1062968 ?auto_1062977 ) ) ( not ( = ?auto_1062968 ?auto_1062982 ) ) ( not ( = ?auto_1062969 ?auto_1062971 ) ) ( not ( = ?auto_1062969 ?auto_1062970 ) ) ( not ( = ?auto_1062969 ?auto_1062972 ) ) ( not ( = ?auto_1062969 ?auto_1062973 ) ) ( not ( = ?auto_1062969 ?auto_1062974 ) ) ( not ( = ?auto_1062969 ?auto_1062975 ) ) ( not ( = ?auto_1062969 ?auto_1062976 ) ) ( not ( = ?auto_1062969 ?auto_1062977 ) ) ( not ( = ?auto_1062969 ?auto_1062982 ) ) ( not ( = ?auto_1062971 ?auto_1062970 ) ) ( not ( = ?auto_1062971 ?auto_1062972 ) ) ( not ( = ?auto_1062971 ?auto_1062973 ) ) ( not ( = ?auto_1062971 ?auto_1062974 ) ) ( not ( = ?auto_1062971 ?auto_1062975 ) ) ( not ( = ?auto_1062971 ?auto_1062976 ) ) ( not ( = ?auto_1062971 ?auto_1062977 ) ) ( not ( = ?auto_1062971 ?auto_1062982 ) ) ( not ( = ?auto_1062970 ?auto_1062972 ) ) ( not ( = ?auto_1062970 ?auto_1062973 ) ) ( not ( = ?auto_1062970 ?auto_1062974 ) ) ( not ( = ?auto_1062970 ?auto_1062975 ) ) ( not ( = ?auto_1062970 ?auto_1062976 ) ) ( not ( = ?auto_1062970 ?auto_1062977 ) ) ( not ( = ?auto_1062970 ?auto_1062982 ) ) ( not ( = ?auto_1062972 ?auto_1062973 ) ) ( not ( = ?auto_1062972 ?auto_1062974 ) ) ( not ( = ?auto_1062972 ?auto_1062975 ) ) ( not ( = ?auto_1062972 ?auto_1062976 ) ) ( not ( = ?auto_1062972 ?auto_1062977 ) ) ( not ( = ?auto_1062972 ?auto_1062982 ) ) ( not ( = ?auto_1062973 ?auto_1062974 ) ) ( not ( = ?auto_1062973 ?auto_1062975 ) ) ( not ( = ?auto_1062973 ?auto_1062976 ) ) ( not ( = ?auto_1062973 ?auto_1062977 ) ) ( not ( = ?auto_1062973 ?auto_1062982 ) ) ( not ( = ?auto_1062974 ?auto_1062975 ) ) ( not ( = ?auto_1062974 ?auto_1062976 ) ) ( not ( = ?auto_1062974 ?auto_1062977 ) ) ( not ( = ?auto_1062974 ?auto_1062982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062975 ?auto_1062976 ?auto_1062977 )
      ( MAKE-10CRATE-VERIFY ?auto_1062967 ?auto_1062968 ?auto_1062969 ?auto_1062971 ?auto_1062970 ?auto_1062972 ?auto_1062973 ?auto_1062974 ?auto_1062975 ?auto_1062976 ?auto_1062977 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063093 - SURFACE
      ?auto_1063094 - SURFACE
      ?auto_1063095 - SURFACE
      ?auto_1063097 - SURFACE
      ?auto_1063096 - SURFACE
      ?auto_1063098 - SURFACE
      ?auto_1063099 - SURFACE
      ?auto_1063100 - SURFACE
      ?auto_1063101 - SURFACE
      ?auto_1063102 - SURFACE
      ?auto_1063103 - SURFACE
    )
    :vars
    (
      ?auto_1063109 - HOIST
      ?auto_1063105 - PLACE
      ?auto_1063104 - PLACE
      ?auto_1063107 - HOIST
      ?auto_1063108 - SURFACE
      ?auto_1063106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063109 ?auto_1063105 ) ( IS-CRATE ?auto_1063103 ) ( not ( = ?auto_1063102 ?auto_1063103 ) ) ( not ( = ?auto_1063101 ?auto_1063102 ) ) ( not ( = ?auto_1063101 ?auto_1063103 ) ) ( not ( = ?auto_1063104 ?auto_1063105 ) ) ( HOIST-AT ?auto_1063107 ?auto_1063104 ) ( not ( = ?auto_1063109 ?auto_1063107 ) ) ( AVAILABLE ?auto_1063107 ) ( SURFACE-AT ?auto_1063103 ?auto_1063104 ) ( ON ?auto_1063103 ?auto_1063108 ) ( CLEAR ?auto_1063103 ) ( not ( = ?auto_1063102 ?auto_1063108 ) ) ( not ( = ?auto_1063103 ?auto_1063108 ) ) ( not ( = ?auto_1063101 ?auto_1063108 ) ) ( TRUCK-AT ?auto_1063106 ?auto_1063105 ) ( SURFACE-AT ?auto_1063101 ?auto_1063105 ) ( CLEAR ?auto_1063101 ) ( IS-CRATE ?auto_1063102 ) ( AVAILABLE ?auto_1063109 ) ( IN ?auto_1063102 ?auto_1063106 ) ( ON ?auto_1063094 ?auto_1063093 ) ( ON ?auto_1063095 ?auto_1063094 ) ( ON ?auto_1063097 ?auto_1063095 ) ( ON ?auto_1063096 ?auto_1063097 ) ( ON ?auto_1063098 ?auto_1063096 ) ( ON ?auto_1063099 ?auto_1063098 ) ( ON ?auto_1063100 ?auto_1063099 ) ( ON ?auto_1063101 ?auto_1063100 ) ( not ( = ?auto_1063093 ?auto_1063094 ) ) ( not ( = ?auto_1063093 ?auto_1063095 ) ) ( not ( = ?auto_1063093 ?auto_1063097 ) ) ( not ( = ?auto_1063093 ?auto_1063096 ) ) ( not ( = ?auto_1063093 ?auto_1063098 ) ) ( not ( = ?auto_1063093 ?auto_1063099 ) ) ( not ( = ?auto_1063093 ?auto_1063100 ) ) ( not ( = ?auto_1063093 ?auto_1063101 ) ) ( not ( = ?auto_1063093 ?auto_1063102 ) ) ( not ( = ?auto_1063093 ?auto_1063103 ) ) ( not ( = ?auto_1063093 ?auto_1063108 ) ) ( not ( = ?auto_1063094 ?auto_1063095 ) ) ( not ( = ?auto_1063094 ?auto_1063097 ) ) ( not ( = ?auto_1063094 ?auto_1063096 ) ) ( not ( = ?auto_1063094 ?auto_1063098 ) ) ( not ( = ?auto_1063094 ?auto_1063099 ) ) ( not ( = ?auto_1063094 ?auto_1063100 ) ) ( not ( = ?auto_1063094 ?auto_1063101 ) ) ( not ( = ?auto_1063094 ?auto_1063102 ) ) ( not ( = ?auto_1063094 ?auto_1063103 ) ) ( not ( = ?auto_1063094 ?auto_1063108 ) ) ( not ( = ?auto_1063095 ?auto_1063097 ) ) ( not ( = ?auto_1063095 ?auto_1063096 ) ) ( not ( = ?auto_1063095 ?auto_1063098 ) ) ( not ( = ?auto_1063095 ?auto_1063099 ) ) ( not ( = ?auto_1063095 ?auto_1063100 ) ) ( not ( = ?auto_1063095 ?auto_1063101 ) ) ( not ( = ?auto_1063095 ?auto_1063102 ) ) ( not ( = ?auto_1063095 ?auto_1063103 ) ) ( not ( = ?auto_1063095 ?auto_1063108 ) ) ( not ( = ?auto_1063097 ?auto_1063096 ) ) ( not ( = ?auto_1063097 ?auto_1063098 ) ) ( not ( = ?auto_1063097 ?auto_1063099 ) ) ( not ( = ?auto_1063097 ?auto_1063100 ) ) ( not ( = ?auto_1063097 ?auto_1063101 ) ) ( not ( = ?auto_1063097 ?auto_1063102 ) ) ( not ( = ?auto_1063097 ?auto_1063103 ) ) ( not ( = ?auto_1063097 ?auto_1063108 ) ) ( not ( = ?auto_1063096 ?auto_1063098 ) ) ( not ( = ?auto_1063096 ?auto_1063099 ) ) ( not ( = ?auto_1063096 ?auto_1063100 ) ) ( not ( = ?auto_1063096 ?auto_1063101 ) ) ( not ( = ?auto_1063096 ?auto_1063102 ) ) ( not ( = ?auto_1063096 ?auto_1063103 ) ) ( not ( = ?auto_1063096 ?auto_1063108 ) ) ( not ( = ?auto_1063098 ?auto_1063099 ) ) ( not ( = ?auto_1063098 ?auto_1063100 ) ) ( not ( = ?auto_1063098 ?auto_1063101 ) ) ( not ( = ?auto_1063098 ?auto_1063102 ) ) ( not ( = ?auto_1063098 ?auto_1063103 ) ) ( not ( = ?auto_1063098 ?auto_1063108 ) ) ( not ( = ?auto_1063099 ?auto_1063100 ) ) ( not ( = ?auto_1063099 ?auto_1063101 ) ) ( not ( = ?auto_1063099 ?auto_1063102 ) ) ( not ( = ?auto_1063099 ?auto_1063103 ) ) ( not ( = ?auto_1063099 ?auto_1063108 ) ) ( not ( = ?auto_1063100 ?auto_1063101 ) ) ( not ( = ?auto_1063100 ?auto_1063102 ) ) ( not ( = ?auto_1063100 ?auto_1063103 ) ) ( not ( = ?auto_1063100 ?auto_1063108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063101 ?auto_1063102 ?auto_1063103 )
      ( MAKE-10CRATE-VERIFY ?auto_1063093 ?auto_1063094 ?auto_1063095 ?auto_1063097 ?auto_1063096 ?auto_1063098 ?auto_1063099 ?auto_1063100 ?auto_1063101 ?auto_1063102 ?auto_1063103 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070327 - SURFACE
      ?auto_1070328 - SURFACE
      ?auto_1070329 - SURFACE
      ?auto_1070331 - SURFACE
      ?auto_1070330 - SURFACE
      ?auto_1070332 - SURFACE
      ?auto_1070333 - SURFACE
      ?auto_1070334 - SURFACE
      ?auto_1070335 - SURFACE
      ?auto_1070336 - SURFACE
      ?auto_1070337 - SURFACE
      ?auto_1070338 - SURFACE
    )
    :vars
    (
      ?auto_1070340 - HOIST
      ?auto_1070339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070340 ?auto_1070339 ) ( SURFACE-AT ?auto_1070337 ?auto_1070339 ) ( CLEAR ?auto_1070337 ) ( LIFTING ?auto_1070340 ?auto_1070338 ) ( IS-CRATE ?auto_1070338 ) ( not ( = ?auto_1070337 ?auto_1070338 ) ) ( ON ?auto_1070328 ?auto_1070327 ) ( ON ?auto_1070329 ?auto_1070328 ) ( ON ?auto_1070331 ?auto_1070329 ) ( ON ?auto_1070330 ?auto_1070331 ) ( ON ?auto_1070332 ?auto_1070330 ) ( ON ?auto_1070333 ?auto_1070332 ) ( ON ?auto_1070334 ?auto_1070333 ) ( ON ?auto_1070335 ?auto_1070334 ) ( ON ?auto_1070336 ?auto_1070335 ) ( ON ?auto_1070337 ?auto_1070336 ) ( not ( = ?auto_1070327 ?auto_1070328 ) ) ( not ( = ?auto_1070327 ?auto_1070329 ) ) ( not ( = ?auto_1070327 ?auto_1070331 ) ) ( not ( = ?auto_1070327 ?auto_1070330 ) ) ( not ( = ?auto_1070327 ?auto_1070332 ) ) ( not ( = ?auto_1070327 ?auto_1070333 ) ) ( not ( = ?auto_1070327 ?auto_1070334 ) ) ( not ( = ?auto_1070327 ?auto_1070335 ) ) ( not ( = ?auto_1070327 ?auto_1070336 ) ) ( not ( = ?auto_1070327 ?auto_1070337 ) ) ( not ( = ?auto_1070327 ?auto_1070338 ) ) ( not ( = ?auto_1070328 ?auto_1070329 ) ) ( not ( = ?auto_1070328 ?auto_1070331 ) ) ( not ( = ?auto_1070328 ?auto_1070330 ) ) ( not ( = ?auto_1070328 ?auto_1070332 ) ) ( not ( = ?auto_1070328 ?auto_1070333 ) ) ( not ( = ?auto_1070328 ?auto_1070334 ) ) ( not ( = ?auto_1070328 ?auto_1070335 ) ) ( not ( = ?auto_1070328 ?auto_1070336 ) ) ( not ( = ?auto_1070328 ?auto_1070337 ) ) ( not ( = ?auto_1070328 ?auto_1070338 ) ) ( not ( = ?auto_1070329 ?auto_1070331 ) ) ( not ( = ?auto_1070329 ?auto_1070330 ) ) ( not ( = ?auto_1070329 ?auto_1070332 ) ) ( not ( = ?auto_1070329 ?auto_1070333 ) ) ( not ( = ?auto_1070329 ?auto_1070334 ) ) ( not ( = ?auto_1070329 ?auto_1070335 ) ) ( not ( = ?auto_1070329 ?auto_1070336 ) ) ( not ( = ?auto_1070329 ?auto_1070337 ) ) ( not ( = ?auto_1070329 ?auto_1070338 ) ) ( not ( = ?auto_1070331 ?auto_1070330 ) ) ( not ( = ?auto_1070331 ?auto_1070332 ) ) ( not ( = ?auto_1070331 ?auto_1070333 ) ) ( not ( = ?auto_1070331 ?auto_1070334 ) ) ( not ( = ?auto_1070331 ?auto_1070335 ) ) ( not ( = ?auto_1070331 ?auto_1070336 ) ) ( not ( = ?auto_1070331 ?auto_1070337 ) ) ( not ( = ?auto_1070331 ?auto_1070338 ) ) ( not ( = ?auto_1070330 ?auto_1070332 ) ) ( not ( = ?auto_1070330 ?auto_1070333 ) ) ( not ( = ?auto_1070330 ?auto_1070334 ) ) ( not ( = ?auto_1070330 ?auto_1070335 ) ) ( not ( = ?auto_1070330 ?auto_1070336 ) ) ( not ( = ?auto_1070330 ?auto_1070337 ) ) ( not ( = ?auto_1070330 ?auto_1070338 ) ) ( not ( = ?auto_1070332 ?auto_1070333 ) ) ( not ( = ?auto_1070332 ?auto_1070334 ) ) ( not ( = ?auto_1070332 ?auto_1070335 ) ) ( not ( = ?auto_1070332 ?auto_1070336 ) ) ( not ( = ?auto_1070332 ?auto_1070337 ) ) ( not ( = ?auto_1070332 ?auto_1070338 ) ) ( not ( = ?auto_1070333 ?auto_1070334 ) ) ( not ( = ?auto_1070333 ?auto_1070335 ) ) ( not ( = ?auto_1070333 ?auto_1070336 ) ) ( not ( = ?auto_1070333 ?auto_1070337 ) ) ( not ( = ?auto_1070333 ?auto_1070338 ) ) ( not ( = ?auto_1070334 ?auto_1070335 ) ) ( not ( = ?auto_1070334 ?auto_1070336 ) ) ( not ( = ?auto_1070334 ?auto_1070337 ) ) ( not ( = ?auto_1070334 ?auto_1070338 ) ) ( not ( = ?auto_1070335 ?auto_1070336 ) ) ( not ( = ?auto_1070335 ?auto_1070337 ) ) ( not ( = ?auto_1070335 ?auto_1070338 ) ) ( not ( = ?auto_1070336 ?auto_1070337 ) ) ( not ( = ?auto_1070336 ?auto_1070338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1070337 ?auto_1070338 )
      ( MAKE-11CRATE-VERIFY ?auto_1070327 ?auto_1070328 ?auto_1070329 ?auto_1070331 ?auto_1070330 ?auto_1070332 ?auto_1070333 ?auto_1070334 ?auto_1070335 ?auto_1070336 ?auto_1070337 ?auto_1070338 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070436 - SURFACE
      ?auto_1070437 - SURFACE
      ?auto_1070438 - SURFACE
      ?auto_1070440 - SURFACE
      ?auto_1070439 - SURFACE
      ?auto_1070441 - SURFACE
      ?auto_1070442 - SURFACE
      ?auto_1070443 - SURFACE
      ?auto_1070444 - SURFACE
      ?auto_1070445 - SURFACE
      ?auto_1070446 - SURFACE
      ?auto_1070447 - SURFACE
    )
    :vars
    (
      ?auto_1070449 - HOIST
      ?auto_1070450 - PLACE
      ?auto_1070448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070449 ?auto_1070450 ) ( SURFACE-AT ?auto_1070446 ?auto_1070450 ) ( CLEAR ?auto_1070446 ) ( IS-CRATE ?auto_1070447 ) ( not ( = ?auto_1070446 ?auto_1070447 ) ) ( TRUCK-AT ?auto_1070448 ?auto_1070450 ) ( AVAILABLE ?auto_1070449 ) ( IN ?auto_1070447 ?auto_1070448 ) ( ON ?auto_1070446 ?auto_1070445 ) ( not ( = ?auto_1070445 ?auto_1070446 ) ) ( not ( = ?auto_1070445 ?auto_1070447 ) ) ( ON ?auto_1070437 ?auto_1070436 ) ( ON ?auto_1070438 ?auto_1070437 ) ( ON ?auto_1070440 ?auto_1070438 ) ( ON ?auto_1070439 ?auto_1070440 ) ( ON ?auto_1070441 ?auto_1070439 ) ( ON ?auto_1070442 ?auto_1070441 ) ( ON ?auto_1070443 ?auto_1070442 ) ( ON ?auto_1070444 ?auto_1070443 ) ( ON ?auto_1070445 ?auto_1070444 ) ( not ( = ?auto_1070436 ?auto_1070437 ) ) ( not ( = ?auto_1070436 ?auto_1070438 ) ) ( not ( = ?auto_1070436 ?auto_1070440 ) ) ( not ( = ?auto_1070436 ?auto_1070439 ) ) ( not ( = ?auto_1070436 ?auto_1070441 ) ) ( not ( = ?auto_1070436 ?auto_1070442 ) ) ( not ( = ?auto_1070436 ?auto_1070443 ) ) ( not ( = ?auto_1070436 ?auto_1070444 ) ) ( not ( = ?auto_1070436 ?auto_1070445 ) ) ( not ( = ?auto_1070436 ?auto_1070446 ) ) ( not ( = ?auto_1070436 ?auto_1070447 ) ) ( not ( = ?auto_1070437 ?auto_1070438 ) ) ( not ( = ?auto_1070437 ?auto_1070440 ) ) ( not ( = ?auto_1070437 ?auto_1070439 ) ) ( not ( = ?auto_1070437 ?auto_1070441 ) ) ( not ( = ?auto_1070437 ?auto_1070442 ) ) ( not ( = ?auto_1070437 ?auto_1070443 ) ) ( not ( = ?auto_1070437 ?auto_1070444 ) ) ( not ( = ?auto_1070437 ?auto_1070445 ) ) ( not ( = ?auto_1070437 ?auto_1070446 ) ) ( not ( = ?auto_1070437 ?auto_1070447 ) ) ( not ( = ?auto_1070438 ?auto_1070440 ) ) ( not ( = ?auto_1070438 ?auto_1070439 ) ) ( not ( = ?auto_1070438 ?auto_1070441 ) ) ( not ( = ?auto_1070438 ?auto_1070442 ) ) ( not ( = ?auto_1070438 ?auto_1070443 ) ) ( not ( = ?auto_1070438 ?auto_1070444 ) ) ( not ( = ?auto_1070438 ?auto_1070445 ) ) ( not ( = ?auto_1070438 ?auto_1070446 ) ) ( not ( = ?auto_1070438 ?auto_1070447 ) ) ( not ( = ?auto_1070440 ?auto_1070439 ) ) ( not ( = ?auto_1070440 ?auto_1070441 ) ) ( not ( = ?auto_1070440 ?auto_1070442 ) ) ( not ( = ?auto_1070440 ?auto_1070443 ) ) ( not ( = ?auto_1070440 ?auto_1070444 ) ) ( not ( = ?auto_1070440 ?auto_1070445 ) ) ( not ( = ?auto_1070440 ?auto_1070446 ) ) ( not ( = ?auto_1070440 ?auto_1070447 ) ) ( not ( = ?auto_1070439 ?auto_1070441 ) ) ( not ( = ?auto_1070439 ?auto_1070442 ) ) ( not ( = ?auto_1070439 ?auto_1070443 ) ) ( not ( = ?auto_1070439 ?auto_1070444 ) ) ( not ( = ?auto_1070439 ?auto_1070445 ) ) ( not ( = ?auto_1070439 ?auto_1070446 ) ) ( not ( = ?auto_1070439 ?auto_1070447 ) ) ( not ( = ?auto_1070441 ?auto_1070442 ) ) ( not ( = ?auto_1070441 ?auto_1070443 ) ) ( not ( = ?auto_1070441 ?auto_1070444 ) ) ( not ( = ?auto_1070441 ?auto_1070445 ) ) ( not ( = ?auto_1070441 ?auto_1070446 ) ) ( not ( = ?auto_1070441 ?auto_1070447 ) ) ( not ( = ?auto_1070442 ?auto_1070443 ) ) ( not ( = ?auto_1070442 ?auto_1070444 ) ) ( not ( = ?auto_1070442 ?auto_1070445 ) ) ( not ( = ?auto_1070442 ?auto_1070446 ) ) ( not ( = ?auto_1070442 ?auto_1070447 ) ) ( not ( = ?auto_1070443 ?auto_1070444 ) ) ( not ( = ?auto_1070443 ?auto_1070445 ) ) ( not ( = ?auto_1070443 ?auto_1070446 ) ) ( not ( = ?auto_1070443 ?auto_1070447 ) ) ( not ( = ?auto_1070444 ?auto_1070445 ) ) ( not ( = ?auto_1070444 ?auto_1070446 ) ) ( not ( = ?auto_1070444 ?auto_1070447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070445 ?auto_1070446 ?auto_1070447 )
      ( MAKE-11CRATE-VERIFY ?auto_1070436 ?auto_1070437 ?auto_1070438 ?auto_1070440 ?auto_1070439 ?auto_1070441 ?auto_1070442 ?auto_1070443 ?auto_1070444 ?auto_1070445 ?auto_1070446 ?auto_1070447 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070557 - SURFACE
      ?auto_1070558 - SURFACE
      ?auto_1070559 - SURFACE
      ?auto_1070561 - SURFACE
      ?auto_1070560 - SURFACE
      ?auto_1070562 - SURFACE
      ?auto_1070563 - SURFACE
      ?auto_1070564 - SURFACE
      ?auto_1070565 - SURFACE
      ?auto_1070566 - SURFACE
      ?auto_1070567 - SURFACE
      ?auto_1070568 - SURFACE
    )
    :vars
    (
      ?auto_1070572 - HOIST
      ?auto_1070571 - PLACE
      ?auto_1070570 - TRUCK
      ?auto_1070569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070572 ?auto_1070571 ) ( SURFACE-AT ?auto_1070567 ?auto_1070571 ) ( CLEAR ?auto_1070567 ) ( IS-CRATE ?auto_1070568 ) ( not ( = ?auto_1070567 ?auto_1070568 ) ) ( AVAILABLE ?auto_1070572 ) ( IN ?auto_1070568 ?auto_1070570 ) ( ON ?auto_1070567 ?auto_1070566 ) ( not ( = ?auto_1070566 ?auto_1070567 ) ) ( not ( = ?auto_1070566 ?auto_1070568 ) ) ( TRUCK-AT ?auto_1070570 ?auto_1070569 ) ( not ( = ?auto_1070569 ?auto_1070571 ) ) ( ON ?auto_1070558 ?auto_1070557 ) ( ON ?auto_1070559 ?auto_1070558 ) ( ON ?auto_1070561 ?auto_1070559 ) ( ON ?auto_1070560 ?auto_1070561 ) ( ON ?auto_1070562 ?auto_1070560 ) ( ON ?auto_1070563 ?auto_1070562 ) ( ON ?auto_1070564 ?auto_1070563 ) ( ON ?auto_1070565 ?auto_1070564 ) ( ON ?auto_1070566 ?auto_1070565 ) ( not ( = ?auto_1070557 ?auto_1070558 ) ) ( not ( = ?auto_1070557 ?auto_1070559 ) ) ( not ( = ?auto_1070557 ?auto_1070561 ) ) ( not ( = ?auto_1070557 ?auto_1070560 ) ) ( not ( = ?auto_1070557 ?auto_1070562 ) ) ( not ( = ?auto_1070557 ?auto_1070563 ) ) ( not ( = ?auto_1070557 ?auto_1070564 ) ) ( not ( = ?auto_1070557 ?auto_1070565 ) ) ( not ( = ?auto_1070557 ?auto_1070566 ) ) ( not ( = ?auto_1070557 ?auto_1070567 ) ) ( not ( = ?auto_1070557 ?auto_1070568 ) ) ( not ( = ?auto_1070558 ?auto_1070559 ) ) ( not ( = ?auto_1070558 ?auto_1070561 ) ) ( not ( = ?auto_1070558 ?auto_1070560 ) ) ( not ( = ?auto_1070558 ?auto_1070562 ) ) ( not ( = ?auto_1070558 ?auto_1070563 ) ) ( not ( = ?auto_1070558 ?auto_1070564 ) ) ( not ( = ?auto_1070558 ?auto_1070565 ) ) ( not ( = ?auto_1070558 ?auto_1070566 ) ) ( not ( = ?auto_1070558 ?auto_1070567 ) ) ( not ( = ?auto_1070558 ?auto_1070568 ) ) ( not ( = ?auto_1070559 ?auto_1070561 ) ) ( not ( = ?auto_1070559 ?auto_1070560 ) ) ( not ( = ?auto_1070559 ?auto_1070562 ) ) ( not ( = ?auto_1070559 ?auto_1070563 ) ) ( not ( = ?auto_1070559 ?auto_1070564 ) ) ( not ( = ?auto_1070559 ?auto_1070565 ) ) ( not ( = ?auto_1070559 ?auto_1070566 ) ) ( not ( = ?auto_1070559 ?auto_1070567 ) ) ( not ( = ?auto_1070559 ?auto_1070568 ) ) ( not ( = ?auto_1070561 ?auto_1070560 ) ) ( not ( = ?auto_1070561 ?auto_1070562 ) ) ( not ( = ?auto_1070561 ?auto_1070563 ) ) ( not ( = ?auto_1070561 ?auto_1070564 ) ) ( not ( = ?auto_1070561 ?auto_1070565 ) ) ( not ( = ?auto_1070561 ?auto_1070566 ) ) ( not ( = ?auto_1070561 ?auto_1070567 ) ) ( not ( = ?auto_1070561 ?auto_1070568 ) ) ( not ( = ?auto_1070560 ?auto_1070562 ) ) ( not ( = ?auto_1070560 ?auto_1070563 ) ) ( not ( = ?auto_1070560 ?auto_1070564 ) ) ( not ( = ?auto_1070560 ?auto_1070565 ) ) ( not ( = ?auto_1070560 ?auto_1070566 ) ) ( not ( = ?auto_1070560 ?auto_1070567 ) ) ( not ( = ?auto_1070560 ?auto_1070568 ) ) ( not ( = ?auto_1070562 ?auto_1070563 ) ) ( not ( = ?auto_1070562 ?auto_1070564 ) ) ( not ( = ?auto_1070562 ?auto_1070565 ) ) ( not ( = ?auto_1070562 ?auto_1070566 ) ) ( not ( = ?auto_1070562 ?auto_1070567 ) ) ( not ( = ?auto_1070562 ?auto_1070568 ) ) ( not ( = ?auto_1070563 ?auto_1070564 ) ) ( not ( = ?auto_1070563 ?auto_1070565 ) ) ( not ( = ?auto_1070563 ?auto_1070566 ) ) ( not ( = ?auto_1070563 ?auto_1070567 ) ) ( not ( = ?auto_1070563 ?auto_1070568 ) ) ( not ( = ?auto_1070564 ?auto_1070565 ) ) ( not ( = ?auto_1070564 ?auto_1070566 ) ) ( not ( = ?auto_1070564 ?auto_1070567 ) ) ( not ( = ?auto_1070564 ?auto_1070568 ) ) ( not ( = ?auto_1070565 ?auto_1070566 ) ) ( not ( = ?auto_1070565 ?auto_1070567 ) ) ( not ( = ?auto_1070565 ?auto_1070568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070566 ?auto_1070567 ?auto_1070568 )
      ( MAKE-11CRATE-VERIFY ?auto_1070557 ?auto_1070558 ?auto_1070559 ?auto_1070561 ?auto_1070560 ?auto_1070562 ?auto_1070563 ?auto_1070564 ?auto_1070565 ?auto_1070566 ?auto_1070567 ?auto_1070568 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070689 - SURFACE
      ?auto_1070690 - SURFACE
      ?auto_1070691 - SURFACE
      ?auto_1070693 - SURFACE
      ?auto_1070692 - SURFACE
      ?auto_1070694 - SURFACE
      ?auto_1070695 - SURFACE
      ?auto_1070696 - SURFACE
      ?auto_1070697 - SURFACE
      ?auto_1070698 - SURFACE
      ?auto_1070699 - SURFACE
      ?auto_1070700 - SURFACE
    )
    :vars
    (
      ?auto_1070702 - HOIST
      ?auto_1070703 - PLACE
      ?auto_1070701 - TRUCK
      ?auto_1070705 - PLACE
      ?auto_1070704 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070702 ?auto_1070703 ) ( SURFACE-AT ?auto_1070699 ?auto_1070703 ) ( CLEAR ?auto_1070699 ) ( IS-CRATE ?auto_1070700 ) ( not ( = ?auto_1070699 ?auto_1070700 ) ) ( AVAILABLE ?auto_1070702 ) ( ON ?auto_1070699 ?auto_1070698 ) ( not ( = ?auto_1070698 ?auto_1070699 ) ) ( not ( = ?auto_1070698 ?auto_1070700 ) ) ( TRUCK-AT ?auto_1070701 ?auto_1070705 ) ( not ( = ?auto_1070705 ?auto_1070703 ) ) ( HOIST-AT ?auto_1070704 ?auto_1070705 ) ( LIFTING ?auto_1070704 ?auto_1070700 ) ( not ( = ?auto_1070702 ?auto_1070704 ) ) ( ON ?auto_1070690 ?auto_1070689 ) ( ON ?auto_1070691 ?auto_1070690 ) ( ON ?auto_1070693 ?auto_1070691 ) ( ON ?auto_1070692 ?auto_1070693 ) ( ON ?auto_1070694 ?auto_1070692 ) ( ON ?auto_1070695 ?auto_1070694 ) ( ON ?auto_1070696 ?auto_1070695 ) ( ON ?auto_1070697 ?auto_1070696 ) ( ON ?auto_1070698 ?auto_1070697 ) ( not ( = ?auto_1070689 ?auto_1070690 ) ) ( not ( = ?auto_1070689 ?auto_1070691 ) ) ( not ( = ?auto_1070689 ?auto_1070693 ) ) ( not ( = ?auto_1070689 ?auto_1070692 ) ) ( not ( = ?auto_1070689 ?auto_1070694 ) ) ( not ( = ?auto_1070689 ?auto_1070695 ) ) ( not ( = ?auto_1070689 ?auto_1070696 ) ) ( not ( = ?auto_1070689 ?auto_1070697 ) ) ( not ( = ?auto_1070689 ?auto_1070698 ) ) ( not ( = ?auto_1070689 ?auto_1070699 ) ) ( not ( = ?auto_1070689 ?auto_1070700 ) ) ( not ( = ?auto_1070690 ?auto_1070691 ) ) ( not ( = ?auto_1070690 ?auto_1070693 ) ) ( not ( = ?auto_1070690 ?auto_1070692 ) ) ( not ( = ?auto_1070690 ?auto_1070694 ) ) ( not ( = ?auto_1070690 ?auto_1070695 ) ) ( not ( = ?auto_1070690 ?auto_1070696 ) ) ( not ( = ?auto_1070690 ?auto_1070697 ) ) ( not ( = ?auto_1070690 ?auto_1070698 ) ) ( not ( = ?auto_1070690 ?auto_1070699 ) ) ( not ( = ?auto_1070690 ?auto_1070700 ) ) ( not ( = ?auto_1070691 ?auto_1070693 ) ) ( not ( = ?auto_1070691 ?auto_1070692 ) ) ( not ( = ?auto_1070691 ?auto_1070694 ) ) ( not ( = ?auto_1070691 ?auto_1070695 ) ) ( not ( = ?auto_1070691 ?auto_1070696 ) ) ( not ( = ?auto_1070691 ?auto_1070697 ) ) ( not ( = ?auto_1070691 ?auto_1070698 ) ) ( not ( = ?auto_1070691 ?auto_1070699 ) ) ( not ( = ?auto_1070691 ?auto_1070700 ) ) ( not ( = ?auto_1070693 ?auto_1070692 ) ) ( not ( = ?auto_1070693 ?auto_1070694 ) ) ( not ( = ?auto_1070693 ?auto_1070695 ) ) ( not ( = ?auto_1070693 ?auto_1070696 ) ) ( not ( = ?auto_1070693 ?auto_1070697 ) ) ( not ( = ?auto_1070693 ?auto_1070698 ) ) ( not ( = ?auto_1070693 ?auto_1070699 ) ) ( not ( = ?auto_1070693 ?auto_1070700 ) ) ( not ( = ?auto_1070692 ?auto_1070694 ) ) ( not ( = ?auto_1070692 ?auto_1070695 ) ) ( not ( = ?auto_1070692 ?auto_1070696 ) ) ( not ( = ?auto_1070692 ?auto_1070697 ) ) ( not ( = ?auto_1070692 ?auto_1070698 ) ) ( not ( = ?auto_1070692 ?auto_1070699 ) ) ( not ( = ?auto_1070692 ?auto_1070700 ) ) ( not ( = ?auto_1070694 ?auto_1070695 ) ) ( not ( = ?auto_1070694 ?auto_1070696 ) ) ( not ( = ?auto_1070694 ?auto_1070697 ) ) ( not ( = ?auto_1070694 ?auto_1070698 ) ) ( not ( = ?auto_1070694 ?auto_1070699 ) ) ( not ( = ?auto_1070694 ?auto_1070700 ) ) ( not ( = ?auto_1070695 ?auto_1070696 ) ) ( not ( = ?auto_1070695 ?auto_1070697 ) ) ( not ( = ?auto_1070695 ?auto_1070698 ) ) ( not ( = ?auto_1070695 ?auto_1070699 ) ) ( not ( = ?auto_1070695 ?auto_1070700 ) ) ( not ( = ?auto_1070696 ?auto_1070697 ) ) ( not ( = ?auto_1070696 ?auto_1070698 ) ) ( not ( = ?auto_1070696 ?auto_1070699 ) ) ( not ( = ?auto_1070696 ?auto_1070700 ) ) ( not ( = ?auto_1070697 ?auto_1070698 ) ) ( not ( = ?auto_1070697 ?auto_1070699 ) ) ( not ( = ?auto_1070697 ?auto_1070700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070698 ?auto_1070699 ?auto_1070700 )
      ( MAKE-11CRATE-VERIFY ?auto_1070689 ?auto_1070690 ?auto_1070691 ?auto_1070693 ?auto_1070692 ?auto_1070694 ?auto_1070695 ?auto_1070696 ?auto_1070697 ?auto_1070698 ?auto_1070699 ?auto_1070700 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070832 - SURFACE
      ?auto_1070833 - SURFACE
      ?auto_1070834 - SURFACE
      ?auto_1070836 - SURFACE
      ?auto_1070835 - SURFACE
      ?auto_1070837 - SURFACE
      ?auto_1070838 - SURFACE
      ?auto_1070839 - SURFACE
      ?auto_1070840 - SURFACE
      ?auto_1070841 - SURFACE
      ?auto_1070842 - SURFACE
      ?auto_1070843 - SURFACE
    )
    :vars
    (
      ?auto_1070845 - HOIST
      ?auto_1070844 - PLACE
      ?auto_1070849 - TRUCK
      ?auto_1070848 - PLACE
      ?auto_1070847 - HOIST
      ?auto_1070846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070845 ?auto_1070844 ) ( SURFACE-AT ?auto_1070842 ?auto_1070844 ) ( CLEAR ?auto_1070842 ) ( IS-CRATE ?auto_1070843 ) ( not ( = ?auto_1070842 ?auto_1070843 ) ) ( AVAILABLE ?auto_1070845 ) ( ON ?auto_1070842 ?auto_1070841 ) ( not ( = ?auto_1070841 ?auto_1070842 ) ) ( not ( = ?auto_1070841 ?auto_1070843 ) ) ( TRUCK-AT ?auto_1070849 ?auto_1070848 ) ( not ( = ?auto_1070848 ?auto_1070844 ) ) ( HOIST-AT ?auto_1070847 ?auto_1070848 ) ( not ( = ?auto_1070845 ?auto_1070847 ) ) ( AVAILABLE ?auto_1070847 ) ( SURFACE-AT ?auto_1070843 ?auto_1070848 ) ( ON ?auto_1070843 ?auto_1070846 ) ( CLEAR ?auto_1070843 ) ( not ( = ?auto_1070842 ?auto_1070846 ) ) ( not ( = ?auto_1070843 ?auto_1070846 ) ) ( not ( = ?auto_1070841 ?auto_1070846 ) ) ( ON ?auto_1070833 ?auto_1070832 ) ( ON ?auto_1070834 ?auto_1070833 ) ( ON ?auto_1070836 ?auto_1070834 ) ( ON ?auto_1070835 ?auto_1070836 ) ( ON ?auto_1070837 ?auto_1070835 ) ( ON ?auto_1070838 ?auto_1070837 ) ( ON ?auto_1070839 ?auto_1070838 ) ( ON ?auto_1070840 ?auto_1070839 ) ( ON ?auto_1070841 ?auto_1070840 ) ( not ( = ?auto_1070832 ?auto_1070833 ) ) ( not ( = ?auto_1070832 ?auto_1070834 ) ) ( not ( = ?auto_1070832 ?auto_1070836 ) ) ( not ( = ?auto_1070832 ?auto_1070835 ) ) ( not ( = ?auto_1070832 ?auto_1070837 ) ) ( not ( = ?auto_1070832 ?auto_1070838 ) ) ( not ( = ?auto_1070832 ?auto_1070839 ) ) ( not ( = ?auto_1070832 ?auto_1070840 ) ) ( not ( = ?auto_1070832 ?auto_1070841 ) ) ( not ( = ?auto_1070832 ?auto_1070842 ) ) ( not ( = ?auto_1070832 ?auto_1070843 ) ) ( not ( = ?auto_1070832 ?auto_1070846 ) ) ( not ( = ?auto_1070833 ?auto_1070834 ) ) ( not ( = ?auto_1070833 ?auto_1070836 ) ) ( not ( = ?auto_1070833 ?auto_1070835 ) ) ( not ( = ?auto_1070833 ?auto_1070837 ) ) ( not ( = ?auto_1070833 ?auto_1070838 ) ) ( not ( = ?auto_1070833 ?auto_1070839 ) ) ( not ( = ?auto_1070833 ?auto_1070840 ) ) ( not ( = ?auto_1070833 ?auto_1070841 ) ) ( not ( = ?auto_1070833 ?auto_1070842 ) ) ( not ( = ?auto_1070833 ?auto_1070843 ) ) ( not ( = ?auto_1070833 ?auto_1070846 ) ) ( not ( = ?auto_1070834 ?auto_1070836 ) ) ( not ( = ?auto_1070834 ?auto_1070835 ) ) ( not ( = ?auto_1070834 ?auto_1070837 ) ) ( not ( = ?auto_1070834 ?auto_1070838 ) ) ( not ( = ?auto_1070834 ?auto_1070839 ) ) ( not ( = ?auto_1070834 ?auto_1070840 ) ) ( not ( = ?auto_1070834 ?auto_1070841 ) ) ( not ( = ?auto_1070834 ?auto_1070842 ) ) ( not ( = ?auto_1070834 ?auto_1070843 ) ) ( not ( = ?auto_1070834 ?auto_1070846 ) ) ( not ( = ?auto_1070836 ?auto_1070835 ) ) ( not ( = ?auto_1070836 ?auto_1070837 ) ) ( not ( = ?auto_1070836 ?auto_1070838 ) ) ( not ( = ?auto_1070836 ?auto_1070839 ) ) ( not ( = ?auto_1070836 ?auto_1070840 ) ) ( not ( = ?auto_1070836 ?auto_1070841 ) ) ( not ( = ?auto_1070836 ?auto_1070842 ) ) ( not ( = ?auto_1070836 ?auto_1070843 ) ) ( not ( = ?auto_1070836 ?auto_1070846 ) ) ( not ( = ?auto_1070835 ?auto_1070837 ) ) ( not ( = ?auto_1070835 ?auto_1070838 ) ) ( not ( = ?auto_1070835 ?auto_1070839 ) ) ( not ( = ?auto_1070835 ?auto_1070840 ) ) ( not ( = ?auto_1070835 ?auto_1070841 ) ) ( not ( = ?auto_1070835 ?auto_1070842 ) ) ( not ( = ?auto_1070835 ?auto_1070843 ) ) ( not ( = ?auto_1070835 ?auto_1070846 ) ) ( not ( = ?auto_1070837 ?auto_1070838 ) ) ( not ( = ?auto_1070837 ?auto_1070839 ) ) ( not ( = ?auto_1070837 ?auto_1070840 ) ) ( not ( = ?auto_1070837 ?auto_1070841 ) ) ( not ( = ?auto_1070837 ?auto_1070842 ) ) ( not ( = ?auto_1070837 ?auto_1070843 ) ) ( not ( = ?auto_1070837 ?auto_1070846 ) ) ( not ( = ?auto_1070838 ?auto_1070839 ) ) ( not ( = ?auto_1070838 ?auto_1070840 ) ) ( not ( = ?auto_1070838 ?auto_1070841 ) ) ( not ( = ?auto_1070838 ?auto_1070842 ) ) ( not ( = ?auto_1070838 ?auto_1070843 ) ) ( not ( = ?auto_1070838 ?auto_1070846 ) ) ( not ( = ?auto_1070839 ?auto_1070840 ) ) ( not ( = ?auto_1070839 ?auto_1070841 ) ) ( not ( = ?auto_1070839 ?auto_1070842 ) ) ( not ( = ?auto_1070839 ?auto_1070843 ) ) ( not ( = ?auto_1070839 ?auto_1070846 ) ) ( not ( = ?auto_1070840 ?auto_1070841 ) ) ( not ( = ?auto_1070840 ?auto_1070842 ) ) ( not ( = ?auto_1070840 ?auto_1070843 ) ) ( not ( = ?auto_1070840 ?auto_1070846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070841 ?auto_1070842 ?auto_1070843 )
      ( MAKE-11CRATE-VERIFY ?auto_1070832 ?auto_1070833 ?auto_1070834 ?auto_1070836 ?auto_1070835 ?auto_1070837 ?auto_1070838 ?auto_1070839 ?auto_1070840 ?auto_1070841 ?auto_1070842 ?auto_1070843 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070976 - SURFACE
      ?auto_1070977 - SURFACE
      ?auto_1070978 - SURFACE
      ?auto_1070980 - SURFACE
      ?auto_1070979 - SURFACE
      ?auto_1070981 - SURFACE
      ?auto_1070982 - SURFACE
      ?auto_1070983 - SURFACE
      ?auto_1070984 - SURFACE
      ?auto_1070985 - SURFACE
      ?auto_1070986 - SURFACE
      ?auto_1070987 - SURFACE
    )
    :vars
    (
      ?auto_1070989 - HOIST
      ?auto_1070988 - PLACE
      ?auto_1070993 - PLACE
      ?auto_1070990 - HOIST
      ?auto_1070992 - SURFACE
      ?auto_1070991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070989 ?auto_1070988 ) ( SURFACE-AT ?auto_1070986 ?auto_1070988 ) ( CLEAR ?auto_1070986 ) ( IS-CRATE ?auto_1070987 ) ( not ( = ?auto_1070986 ?auto_1070987 ) ) ( AVAILABLE ?auto_1070989 ) ( ON ?auto_1070986 ?auto_1070985 ) ( not ( = ?auto_1070985 ?auto_1070986 ) ) ( not ( = ?auto_1070985 ?auto_1070987 ) ) ( not ( = ?auto_1070993 ?auto_1070988 ) ) ( HOIST-AT ?auto_1070990 ?auto_1070993 ) ( not ( = ?auto_1070989 ?auto_1070990 ) ) ( AVAILABLE ?auto_1070990 ) ( SURFACE-AT ?auto_1070987 ?auto_1070993 ) ( ON ?auto_1070987 ?auto_1070992 ) ( CLEAR ?auto_1070987 ) ( not ( = ?auto_1070986 ?auto_1070992 ) ) ( not ( = ?auto_1070987 ?auto_1070992 ) ) ( not ( = ?auto_1070985 ?auto_1070992 ) ) ( TRUCK-AT ?auto_1070991 ?auto_1070988 ) ( ON ?auto_1070977 ?auto_1070976 ) ( ON ?auto_1070978 ?auto_1070977 ) ( ON ?auto_1070980 ?auto_1070978 ) ( ON ?auto_1070979 ?auto_1070980 ) ( ON ?auto_1070981 ?auto_1070979 ) ( ON ?auto_1070982 ?auto_1070981 ) ( ON ?auto_1070983 ?auto_1070982 ) ( ON ?auto_1070984 ?auto_1070983 ) ( ON ?auto_1070985 ?auto_1070984 ) ( not ( = ?auto_1070976 ?auto_1070977 ) ) ( not ( = ?auto_1070976 ?auto_1070978 ) ) ( not ( = ?auto_1070976 ?auto_1070980 ) ) ( not ( = ?auto_1070976 ?auto_1070979 ) ) ( not ( = ?auto_1070976 ?auto_1070981 ) ) ( not ( = ?auto_1070976 ?auto_1070982 ) ) ( not ( = ?auto_1070976 ?auto_1070983 ) ) ( not ( = ?auto_1070976 ?auto_1070984 ) ) ( not ( = ?auto_1070976 ?auto_1070985 ) ) ( not ( = ?auto_1070976 ?auto_1070986 ) ) ( not ( = ?auto_1070976 ?auto_1070987 ) ) ( not ( = ?auto_1070976 ?auto_1070992 ) ) ( not ( = ?auto_1070977 ?auto_1070978 ) ) ( not ( = ?auto_1070977 ?auto_1070980 ) ) ( not ( = ?auto_1070977 ?auto_1070979 ) ) ( not ( = ?auto_1070977 ?auto_1070981 ) ) ( not ( = ?auto_1070977 ?auto_1070982 ) ) ( not ( = ?auto_1070977 ?auto_1070983 ) ) ( not ( = ?auto_1070977 ?auto_1070984 ) ) ( not ( = ?auto_1070977 ?auto_1070985 ) ) ( not ( = ?auto_1070977 ?auto_1070986 ) ) ( not ( = ?auto_1070977 ?auto_1070987 ) ) ( not ( = ?auto_1070977 ?auto_1070992 ) ) ( not ( = ?auto_1070978 ?auto_1070980 ) ) ( not ( = ?auto_1070978 ?auto_1070979 ) ) ( not ( = ?auto_1070978 ?auto_1070981 ) ) ( not ( = ?auto_1070978 ?auto_1070982 ) ) ( not ( = ?auto_1070978 ?auto_1070983 ) ) ( not ( = ?auto_1070978 ?auto_1070984 ) ) ( not ( = ?auto_1070978 ?auto_1070985 ) ) ( not ( = ?auto_1070978 ?auto_1070986 ) ) ( not ( = ?auto_1070978 ?auto_1070987 ) ) ( not ( = ?auto_1070978 ?auto_1070992 ) ) ( not ( = ?auto_1070980 ?auto_1070979 ) ) ( not ( = ?auto_1070980 ?auto_1070981 ) ) ( not ( = ?auto_1070980 ?auto_1070982 ) ) ( not ( = ?auto_1070980 ?auto_1070983 ) ) ( not ( = ?auto_1070980 ?auto_1070984 ) ) ( not ( = ?auto_1070980 ?auto_1070985 ) ) ( not ( = ?auto_1070980 ?auto_1070986 ) ) ( not ( = ?auto_1070980 ?auto_1070987 ) ) ( not ( = ?auto_1070980 ?auto_1070992 ) ) ( not ( = ?auto_1070979 ?auto_1070981 ) ) ( not ( = ?auto_1070979 ?auto_1070982 ) ) ( not ( = ?auto_1070979 ?auto_1070983 ) ) ( not ( = ?auto_1070979 ?auto_1070984 ) ) ( not ( = ?auto_1070979 ?auto_1070985 ) ) ( not ( = ?auto_1070979 ?auto_1070986 ) ) ( not ( = ?auto_1070979 ?auto_1070987 ) ) ( not ( = ?auto_1070979 ?auto_1070992 ) ) ( not ( = ?auto_1070981 ?auto_1070982 ) ) ( not ( = ?auto_1070981 ?auto_1070983 ) ) ( not ( = ?auto_1070981 ?auto_1070984 ) ) ( not ( = ?auto_1070981 ?auto_1070985 ) ) ( not ( = ?auto_1070981 ?auto_1070986 ) ) ( not ( = ?auto_1070981 ?auto_1070987 ) ) ( not ( = ?auto_1070981 ?auto_1070992 ) ) ( not ( = ?auto_1070982 ?auto_1070983 ) ) ( not ( = ?auto_1070982 ?auto_1070984 ) ) ( not ( = ?auto_1070982 ?auto_1070985 ) ) ( not ( = ?auto_1070982 ?auto_1070986 ) ) ( not ( = ?auto_1070982 ?auto_1070987 ) ) ( not ( = ?auto_1070982 ?auto_1070992 ) ) ( not ( = ?auto_1070983 ?auto_1070984 ) ) ( not ( = ?auto_1070983 ?auto_1070985 ) ) ( not ( = ?auto_1070983 ?auto_1070986 ) ) ( not ( = ?auto_1070983 ?auto_1070987 ) ) ( not ( = ?auto_1070983 ?auto_1070992 ) ) ( not ( = ?auto_1070984 ?auto_1070985 ) ) ( not ( = ?auto_1070984 ?auto_1070986 ) ) ( not ( = ?auto_1070984 ?auto_1070987 ) ) ( not ( = ?auto_1070984 ?auto_1070992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070985 ?auto_1070986 ?auto_1070987 )
      ( MAKE-11CRATE-VERIFY ?auto_1070976 ?auto_1070977 ?auto_1070978 ?auto_1070980 ?auto_1070979 ?auto_1070981 ?auto_1070982 ?auto_1070983 ?auto_1070984 ?auto_1070985 ?auto_1070986 ?auto_1070987 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071120 - SURFACE
      ?auto_1071121 - SURFACE
      ?auto_1071122 - SURFACE
      ?auto_1071124 - SURFACE
      ?auto_1071123 - SURFACE
      ?auto_1071125 - SURFACE
      ?auto_1071126 - SURFACE
      ?auto_1071127 - SURFACE
      ?auto_1071128 - SURFACE
      ?auto_1071129 - SURFACE
      ?auto_1071130 - SURFACE
      ?auto_1071131 - SURFACE
    )
    :vars
    (
      ?auto_1071134 - HOIST
      ?auto_1071133 - PLACE
      ?auto_1071132 - PLACE
      ?auto_1071135 - HOIST
      ?auto_1071136 - SURFACE
      ?auto_1071137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071134 ?auto_1071133 ) ( IS-CRATE ?auto_1071131 ) ( not ( = ?auto_1071130 ?auto_1071131 ) ) ( not ( = ?auto_1071129 ?auto_1071130 ) ) ( not ( = ?auto_1071129 ?auto_1071131 ) ) ( not ( = ?auto_1071132 ?auto_1071133 ) ) ( HOIST-AT ?auto_1071135 ?auto_1071132 ) ( not ( = ?auto_1071134 ?auto_1071135 ) ) ( AVAILABLE ?auto_1071135 ) ( SURFACE-AT ?auto_1071131 ?auto_1071132 ) ( ON ?auto_1071131 ?auto_1071136 ) ( CLEAR ?auto_1071131 ) ( not ( = ?auto_1071130 ?auto_1071136 ) ) ( not ( = ?auto_1071131 ?auto_1071136 ) ) ( not ( = ?auto_1071129 ?auto_1071136 ) ) ( TRUCK-AT ?auto_1071137 ?auto_1071133 ) ( SURFACE-AT ?auto_1071129 ?auto_1071133 ) ( CLEAR ?auto_1071129 ) ( LIFTING ?auto_1071134 ?auto_1071130 ) ( IS-CRATE ?auto_1071130 ) ( ON ?auto_1071121 ?auto_1071120 ) ( ON ?auto_1071122 ?auto_1071121 ) ( ON ?auto_1071124 ?auto_1071122 ) ( ON ?auto_1071123 ?auto_1071124 ) ( ON ?auto_1071125 ?auto_1071123 ) ( ON ?auto_1071126 ?auto_1071125 ) ( ON ?auto_1071127 ?auto_1071126 ) ( ON ?auto_1071128 ?auto_1071127 ) ( ON ?auto_1071129 ?auto_1071128 ) ( not ( = ?auto_1071120 ?auto_1071121 ) ) ( not ( = ?auto_1071120 ?auto_1071122 ) ) ( not ( = ?auto_1071120 ?auto_1071124 ) ) ( not ( = ?auto_1071120 ?auto_1071123 ) ) ( not ( = ?auto_1071120 ?auto_1071125 ) ) ( not ( = ?auto_1071120 ?auto_1071126 ) ) ( not ( = ?auto_1071120 ?auto_1071127 ) ) ( not ( = ?auto_1071120 ?auto_1071128 ) ) ( not ( = ?auto_1071120 ?auto_1071129 ) ) ( not ( = ?auto_1071120 ?auto_1071130 ) ) ( not ( = ?auto_1071120 ?auto_1071131 ) ) ( not ( = ?auto_1071120 ?auto_1071136 ) ) ( not ( = ?auto_1071121 ?auto_1071122 ) ) ( not ( = ?auto_1071121 ?auto_1071124 ) ) ( not ( = ?auto_1071121 ?auto_1071123 ) ) ( not ( = ?auto_1071121 ?auto_1071125 ) ) ( not ( = ?auto_1071121 ?auto_1071126 ) ) ( not ( = ?auto_1071121 ?auto_1071127 ) ) ( not ( = ?auto_1071121 ?auto_1071128 ) ) ( not ( = ?auto_1071121 ?auto_1071129 ) ) ( not ( = ?auto_1071121 ?auto_1071130 ) ) ( not ( = ?auto_1071121 ?auto_1071131 ) ) ( not ( = ?auto_1071121 ?auto_1071136 ) ) ( not ( = ?auto_1071122 ?auto_1071124 ) ) ( not ( = ?auto_1071122 ?auto_1071123 ) ) ( not ( = ?auto_1071122 ?auto_1071125 ) ) ( not ( = ?auto_1071122 ?auto_1071126 ) ) ( not ( = ?auto_1071122 ?auto_1071127 ) ) ( not ( = ?auto_1071122 ?auto_1071128 ) ) ( not ( = ?auto_1071122 ?auto_1071129 ) ) ( not ( = ?auto_1071122 ?auto_1071130 ) ) ( not ( = ?auto_1071122 ?auto_1071131 ) ) ( not ( = ?auto_1071122 ?auto_1071136 ) ) ( not ( = ?auto_1071124 ?auto_1071123 ) ) ( not ( = ?auto_1071124 ?auto_1071125 ) ) ( not ( = ?auto_1071124 ?auto_1071126 ) ) ( not ( = ?auto_1071124 ?auto_1071127 ) ) ( not ( = ?auto_1071124 ?auto_1071128 ) ) ( not ( = ?auto_1071124 ?auto_1071129 ) ) ( not ( = ?auto_1071124 ?auto_1071130 ) ) ( not ( = ?auto_1071124 ?auto_1071131 ) ) ( not ( = ?auto_1071124 ?auto_1071136 ) ) ( not ( = ?auto_1071123 ?auto_1071125 ) ) ( not ( = ?auto_1071123 ?auto_1071126 ) ) ( not ( = ?auto_1071123 ?auto_1071127 ) ) ( not ( = ?auto_1071123 ?auto_1071128 ) ) ( not ( = ?auto_1071123 ?auto_1071129 ) ) ( not ( = ?auto_1071123 ?auto_1071130 ) ) ( not ( = ?auto_1071123 ?auto_1071131 ) ) ( not ( = ?auto_1071123 ?auto_1071136 ) ) ( not ( = ?auto_1071125 ?auto_1071126 ) ) ( not ( = ?auto_1071125 ?auto_1071127 ) ) ( not ( = ?auto_1071125 ?auto_1071128 ) ) ( not ( = ?auto_1071125 ?auto_1071129 ) ) ( not ( = ?auto_1071125 ?auto_1071130 ) ) ( not ( = ?auto_1071125 ?auto_1071131 ) ) ( not ( = ?auto_1071125 ?auto_1071136 ) ) ( not ( = ?auto_1071126 ?auto_1071127 ) ) ( not ( = ?auto_1071126 ?auto_1071128 ) ) ( not ( = ?auto_1071126 ?auto_1071129 ) ) ( not ( = ?auto_1071126 ?auto_1071130 ) ) ( not ( = ?auto_1071126 ?auto_1071131 ) ) ( not ( = ?auto_1071126 ?auto_1071136 ) ) ( not ( = ?auto_1071127 ?auto_1071128 ) ) ( not ( = ?auto_1071127 ?auto_1071129 ) ) ( not ( = ?auto_1071127 ?auto_1071130 ) ) ( not ( = ?auto_1071127 ?auto_1071131 ) ) ( not ( = ?auto_1071127 ?auto_1071136 ) ) ( not ( = ?auto_1071128 ?auto_1071129 ) ) ( not ( = ?auto_1071128 ?auto_1071130 ) ) ( not ( = ?auto_1071128 ?auto_1071131 ) ) ( not ( = ?auto_1071128 ?auto_1071136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071129 ?auto_1071130 ?auto_1071131 )
      ( MAKE-11CRATE-VERIFY ?auto_1071120 ?auto_1071121 ?auto_1071122 ?auto_1071124 ?auto_1071123 ?auto_1071125 ?auto_1071126 ?auto_1071127 ?auto_1071128 ?auto_1071129 ?auto_1071130 ?auto_1071131 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071264 - SURFACE
      ?auto_1071265 - SURFACE
      ?auto_1071266 - SURFACE
      ?auto_1071268 - SURFACE
      ?auto_1071267 - SURFACE
      ?auto_1071269 - SURFACE
      ?auto_1071270 - SURFACE
      ?auto_1071271 - SURFACE
      ?auto_1071272 - SURFACE
      ?auto_1071273 - SURFACE
      ?auto_1071274 - SURFACE
      ?auto_1071275 - SURFACE
    )
    :vars
    (
      ?auto_1071281 - HOIST
      ?auto_1071279 - PLACE
      ?auto_1071276 - PLACE
      ?auto_1071280 - HOIST
      ?auto_1071278 - SURFACE
      ?auto_1071277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071281 ?auto_1071279 ) ( IS-CRATE ?auto_1071275 ) ( not ( = ?auto_1071274 ?auto_1071275 ) ) ( not ( = ?auto_1071273 ?auto_1071274 ) ) ( not ( = ?auto_1071273 ?auto_1071275 ) ) ( not ( = ?auto_1071276 ?auto_1071279 ) ) ( HOIST-AT ?auto_1071280 ?auto_1071276 ) ( not ( = ?auto_1071281 ?auto_1071280 ) ) ( AVAILABLE ?auto_1071280 ) ( SURFACE-AT ?auto_1071275 ?auto_1071276 ) ( ON ?auto_1071275 ?auto_1071278 ) ( CLEAR ?auto_1071275 ) ( not ( = ?auto_1071274 ?auto_1071278 ) ) ( not ( = ?auto_1071275 ?auto_1071278 ) ) ( not ( = ?auto_1071273 ?auto_1071278 ) ) ( TRUCK-AT ?auto_1071277 ?auto_1071279 ) ( SURFACE-AT ?auto_1071273 ?auto_1071279 ) ( CLEAR ?auto_1071273 ) ( IS-CRATE ?auto_1071274 ) ( AVAILABLE ?auto_1071281 ) ( IN ?auto_1071274 ?auto_1071277 ) ( ON ?auto_1071265 ?auto_1071264 ) ( ON ?auto_1071266 ?auto_1071265 ) ( ON ?auto_1071268 ?auto_1071266 ) ( ON ?auto_1071267 ?auto_1071268 ) ( ON ?auto_1071269 ?auto_1071267 ) ( ON ?auto_1071270 ?auto_1071269 ) ( ON ?auto_1071271 ?auto_1071270 ) ( ON ?auto_1071272 ?auto_1071271 ) ( ON ?auto_1071273 ?auto_1071272 ) ( not ( = ?auto_1071264 ?auto_1071265 ) ) ( not ( = ?auto_1071264 ?auto_1071266 ) ) ( not ( = ?auto_1071264 ?auto_1071268 ) ) ( not ( = ?auto_1071264 ?auto_1071267 ) ) ( not ( = ?auto_1071264 ?auto_1071269 ) ) ( not ( = ?auto_1071264 ?auto_1071270 ) ) ( not ( = ?auto_1071264 ?auto_1071271 ) ) ( not ( = ?auto_1071264 ?auto_1071272 ) ) ( not ( = ?auto_1071264 ?auto_1071273 ) ) ( not ( = ?auto_1071264 ?auto_1071274 ) ) ( not ( = ?auto_1071264 ?auto_1071275 ) ) ( not ( = ?auto_1071264 ?auto_1071278 ) ) ( not ( = ?auto_1071265 ?auto_1071266 ) ) ( not ( = ?auto_1071265 ?auto_1071268 ) ) ( not ( = ?auto_1071265 ?auto_1071267 ) ) ( not ( = ?auto_1071265 ?auto_1071269 ) ) ( not ( = ?auto_1071265 ?auto_1071270 ) ) ( not ( = ?auto_1071265 ?auto_1071271 ) ) ( not ( = ?auto_1071265 ?auto_1071272 ) ) ( not ( = ?auto_1071265 ?auto_1071273 ) ) ( not ( = ?auto_1071265 ?auto_1071274 ) ) ( not ( = ?auto_1071265 ?auto_1071275 ) ) ( not ( = ?auto_1071265 ?auto_1071278 ) ) ( not ( = ?auto_1071266 ?auto_1071268 ) ) ( not ( = ?auto_1071266 ?auto_1071267 ) ) ( not ( = ?auto_1071266 ?auto_1071269 ) ) ( not ( = ?auto_1071266 ?auto_1071270 ) ) ( not ( = ?auto_1071266 ?auto_1071271 ) ) ( not ( = ?auto_1071266 ?auto_1071272 ) ) ( not ( = ?auto_1071266 ?auto_1071273 ) ) ( not ( = ?auto_1071266 ?auto_1071274 ) ) ( not ( = ?auto_1071266 ?auto_1071275 ) ) ( not ( = ?auto_1071266 ?auto_1071278 ) ) ( not ( = ?auto_1071268 ?auto_1071267 ) ) ( not ( = ?auto_1071268 ?auto_1071269 ) ) ( not ( = ?auto_1071268 ?auto_1071270 ) ) ( not ( = ?auto_1071268 ?auto_1071271 ) ) ( not ( = ?auto_1071268 ?auto_1071272 ) ) ( not ( = ?auto_1071268 ?auto_1071273 ) ) ( not ( = ?auto_1071268 ?auto_1071274 ) ) ( not ( = ?auto_1071268 ?auto_1071275 ) ) ( not ( = ?auto_1071268 ?auto_1071278 ) ) ( not ( = ?auto_1071267 ?auto_1071269 ) ) ( not ( = ?auto_1071267 ?auto_1071270 ) ) ( not ( = ?auto_1071267 ?auto_1071271 ) ) ( not ( = ?auto_1071267 ?auto_1071272 ) ) ( not ( = ?auto_1071267 ?auto_1071273 ) ) ( not ( = ?auto_1071267 ?auto_1071274 ) ) ( not ( = ?auto_1071267 ?auto_1071275 ) ) ( not ( = ?auto_1071267 ?auto_1071278 ) ) ( not ( = ?auto_1071269 ?auto_1071270 ) ) ( not ( = ?auto_1071269 ?auto_1071271 ) ) ( not ( = ?auto_1071269 ?auto_1071272 ) ) ( not ( = ?auto_1071269 ?auto_1071273 ) ) ( not ( = ?auto_1071269 ?auto_1071274 ) ) ( not ( = ?auto_1071269 ?auto_1071275 ) ) ( not ( = ?auto_1071269 ?auto_1071278 ) ) ( not ( = ?auto_1071270 ?auto_1071271 ) ) ( not ( = ?auto_1071270 ?auto_1071272 ) ) ( not ( = ?auto_1071270 ?auto_1071273 ) ) ( not ( = ?auto_1071270 ?auto_1071274 ) ) ( not ( = ?auto_1071270 ?auto_1071275 ) ) ( not ( = ?auto_1071270 ?auto_1071278 ) ) ( not ( = ?auto_1071271 ?auto_1071272 ) ) ( not ( = ?auto_1071271 ?auto_1071273 ) ) ( not ( = ?auto_1071271 ?auto_1071274 ) ) ( not ( = ?auto_1071271 ?auto_1071275 ) ) ( not ( = ?auto_1071271 ?auto_1071278 ) ) ( not ( = ?auto_1071272 ?auto_1071273 ) ) ( not ( = ?auto_1071272 ?auto_1071274 ) ) ( not ( = ?auto_1071272 ?auto_1071275 ) ) ( not ( = ?auto_1071272 ?auto_1071278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071273 ?auto_1071274 ?auto_1071275 )
      ( MAKE-11CRATE-VERIFY ?auto_1071264 ?auto_1071265 ?auto_1071266 ?auto_1071268 ?auto_1071267 ?auto_1071269 ?auto_1071270 ?auto_1071271 ?auto_1071272 ?auto_1071273 ?auto_1071274 ?auto_1071275 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1080515 - SURFACE
      ?auto_1080516 - SURFACE
      ?auto_1080517 - SURFACE
      ?auto_1080519 - SURFACE
      ?auto_1080518 - SURFACE
      ?auto_1080520 - SURFACE
      ?auto_1080521 - SURFACE
      ?auto_1080522 - SURFACE
      ?auto_1080523 - SURFACE
      ?auto_1080524 - SURFACE
      ?auto_1080525 - SURFACE
      ?auto_1080526 - SURFACE
      ?auto_1080527 - SURFACE
    )
    :vars
    (
      ?auto_1080528 - HOIST
      ?auto_1080529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1080528 ?auto_1080529 ) ( SURFACE-AT ?auto_1080526 ?auto_1080529 ) ( CLEAR ?auto_1080526 ) ( LIFTING ?auto_1080528 ?auto_1080527 ) ( IS-CRATE ?auto_1080527 ) ( not ( = ?auto_1080526 ?auto_1080527 ) ) ( ON ?auto_1080516 ?auto_1080515 ) ( ON ?auto_1080517 ?auto_1080516 ) ( ON ?auto_1080519 ?auto_1080517 ) ( ON ?auto_1080518 ?auto_1080519 ) ( ON ?auto_1080520 ?auto_1080518 ) ( ON ?auto_1080521 ?auto_1080520 ) ( ON ?auto_1080522 ?auto_1080521 ) ( ON ?auto_1080523 ?auto_1080522 ) ( ON ?auto_1080524 ?auto_1080523 ) ( ON ?auto_1080525 ?auto_1080524 ) ( ON ?auto_1080526 ?auto_1080525 ) ( not ( = ?auto_1080515 ?auto_1080516 ) ) ( not ( = ?auto_1080515 ?auto_1080517 ) ) ( not ( = ?auto_1080515 ?auto_1080519 ) ) ( not ( = ?auto_1080515 ?auto_1080518 ) ) ( not ( = ?auto_1080515 ?auto_1080520 ) ) ( not ( = ?auto_1080515 ?auto_1080521 ) ) ( not ( = ?auto_1080515 ?auto_1080522 ) ) ( not ( = ?auto_1080515 ?auto_1080523 ) ) ( not ( = ?auto_1080515 ?auto_1080524 ) ) ( not ( = ?auto_1080515 ?auto_1080525 ) ) ( not ( = ?auto_1080515 ?auto_1080526 ) ) ( not ( = ?auto_1080515 ?auto_1080527 ) ) ( not ( = ?auto_1080516 ?auto_1080517 ) ) ( not ( = ?auto_1080516 ?auto_1080519 ) ) ( not ( = ?auto_1080516 ?auto_1080518 ) ) ( not ( = ?auto_1080516 ?auto_1080520 ) ) ( not ( = ?auto_1080516 ?auto_1080521 ) ) ( not ( = ?auto_1080516 ?auto_1080522 ) ) ( not ( = ?auto_1080516 ?auto_1080523 ) ) ( not ( = ?auto_1080516 ?auto_1080524 ) ) ( not ( = ?auto_1080516 ?auto_1080525 ) ) ( not ( = ?auto_1080516 ?auto_1080526 ) ) ( not ( = ?auto_1080516 ?auto_1080527 ) ) ( not ( = ?auto_1080517 ?auto_1080519 ) ) ( not ( = ?auto_1080517 ?auto_1080518 ) ) ( not ( = ?auto_1080517 ?auto_1080520 ) ) ( not ( = ?auto_1080517 ?auto_1080521 ) ) ( not ( = ?auto_1080517 ?auto_1080522 ) ) ( not ( = ?auto_1080517 ?auto_1080523 ) ) ( not ( = ?auto_1080517 ?auto_1080524 ) ) ( not ( = ?auto_1080517 ?auto_1080525 ) ) ( not ( = ?auto_1080517 ?auto_1080526 ) ) ( not ( = ?auto_1080517 ?auto_1080527 ) ) ( not ( = ?auto_1080519 ?auto_1080518 ) ) ( not ( = ?auto_1080519 ?auto_1080520 ) ) ( not ( = ?auto_1080519 ?auto_1080521 ) ) ( not ( = ?auto_1080519 ?auto_1080522 ) ) ( not ( = ?auto_1080519 ?auto_1080523 ) ) ( not ( = ?auto_1080519 ?auto_1080524 ) ) ( not ( = ?auto_1080519 ?auto_1080525 ) ) ( not ( = ?auto_1080519 ?auto_1080526 ) ) ( not ( = ?auto_1080519 ?auto_1080527 ) ) ( not ( = ?auto_1080518 ?auto_1080520 ) ) ( not ( = ?auto_1080518 ?auto_1080521 ) ) ( not ( = ?auto_1080518 ?auto_1080522 ) ) ( not ( = ?auto_1080518 ?auto_1080523 ) ) ( not ( = ?auto_1080518 ?auto_1080524 ) ) ( not ( = ?auto_1080518 ?auto_1080525 ) ) ( not ( = ?auto_1080518 ?auto_1080526 ) ) ( not ( = ?auto_1080518 ?auto_1080527 ) ) ( not ( = ?auto_1080520 ?auto_1080521 ) ) ( not ( = ?auto_1080520 ?auto_1080522 ) ) ( not ( = ?auto_1080520 ?auto_1080523 ) ) ( not ( = ?auto_1080520 ?auto_1080524 ) ) ( not ( = ?auto_1080520 ?auto_1080525 ) ) ( not ( = ?auto_1080520 ?auto_1080526 ) ) ( not ( = ?auto_1080520 ?auto_1080527 ) ) ( not ( = ?auto_1080521 ?auto_1080522 ) ) ( not ( = ?auto_1080521 ?auto_1080523 ) ) ( not ( = ?auto_1080521 ?auto_1080524 ) ) ( not ( = ?auto_1080521 ?auto_1080525 ) ) ( not ( = ?auto_1080521 ?auto_1080526 ) ) ( not ( = ?auto_1080521 ?auto_1080527 ) ) ( not ( = ?auto_1080522 ?auto_1080523 ) ) ( not ( = ?auto_1080522 ?auto_1080524 ) ) ( not ( = ?auto_1080522 ?auto_1080525 ) ) ( not ( = ?auto_1080522 ?auto_1080526 ) ) ( not ( = ?auto_1080522 ?auto_1080527 ) ) ( not ( = ?auto_1080523 ?auto_1080524 ) ) ( not ( = ?auto_1080523 ?auto_1080525 ) ) ( not ( = ?auto_1080523 ?auto_1080526 ) ) ( not ( = ?auto_1080523 ?auto_1080527 ) ) ( not ( = ?auto_1080524 ?auto_1080525 ) ) ( not ( = ?auto_1080524 ?auto_1080526 ) ) ( not ( = ?auto_1080524 ?auto_1080527 ) ) ( not ( = ?auto_1080525 ?auto_1080526 ) ) ( not ( = ?auto_1080525 ?auto_1080527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1080526 ?auto_1080527 )
      ( MAKE-12CRATE-VERIFY ?auto_1080515 ?auto_1080516 ?auto_1080517 ?auto_1080519 ?auto_1080518 ?auto_1080520 ?auto_1080521 ?auto_1080522 ?auto_1080523 ?auto_1080524 ?auto_1080525 ?auto_1080526 ?auto_1080527 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1080640 - SURFACE
      ?auto_1080641 - SURFACE
      ?auto_1080642 - SURFACE
      ?auto_1080644 - SURFACE
      ?auto_1080643 - SURFACE
      ?auto_1080645 - SURFACE
      ?auto_1080646 - SURFACE
      ?auto_1080647 - SURFACE
      ?auto_1080648 - SURFACE
      ?auto_1080649 - SURFACE
      ?auto_1080650 - SURFACE
      ?auto_1080651 - SURFACE
      ?auto_1080652 - SURFACE
    )
    :vars
    (
      ?auto_1080653 - HOIST
      ?auto_1080654 - PLACE
      ?auto_1080655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1080653 ?auto_1080654 ) ( SURFACE-AT ?auto_1080651 ?auto_1080654 ) ( CLEAR ?auto_1080651 ) ( IS-CRATE ?auto_1080652 ) ( not ( = ?auto_1080651 ?auto_1080652 ) ) ( TRUCK-AT ?auto_1080655 ?auto_1080654 ) ( AVAILABLE ?auto_1080653 ) ( IN ?auto_1080652 ?auto_1080655 ) ( ON ?auto_1080651 ?auto_1080650 ) ( not ( = ?auto_1080650 ?auto_1080651 ) ) ( not ( = ?auto_1080650 ?auto_1080652 ) ) ( ON ?auto_1080641 ?auto_1080640 ) ( ON ?auto_1080642 ?auto_1080641 ) ( ON ?auto_1080644 ?auto_1080642 ) ( ON ?auto_1080643 ?auto_1080644 ) ( ON ?auto_1080645 ?auto_1080643 ) ( ON ?auto_1080646 ?auto_1080645 ) ( ON ?auto_1080647 ?auto_1080646 ) ( ON ?auto_1080648 ?auto_1080647 ) ( ON ?auto_1080649 ?auto_1080648 ) ( ON ?auto_1080650 ?auto_1080649 ) ( not ( = ?auto_1080640 ?auto_1080641 ) ) ( not ( = ?auto_1080640 ?auto_1080642 ) ) ( not ( = ?auto_1080640 ?auto_1080644 ) ) ( not ( = ?auto_1080640 ?auto_1080643 ) ) ( not ( = ?auto_1080640 ?auto_1080645 ) ) ( not ( = ?auto_1080640 ?auto_1080646 ) ) ( not ( = ?auto_1080640 ?auto_1080647 ) ) ( not ( = ?auto_1080640 ?auto_1080648 ) ) ( not ( = ?auto_1080640 ?auto_1080649 ) ) ( not ( = ?auto_1080640 ?auto_1080650 ) ) ( not ( = ?auto_1080640 ?auto_1080651 ) ) ( not ( = ?auto_1080640 ?auto_1080652 ) ) ( not ( = ?auto_1080641 ?auto_1080642 ) ) ( not ( = ?auto_1080641 ?auto_1080644 ) ) ( not ( = ?auto_1080641 ?auto_1080643 ) ) ( not ( = ?auto_1080641 ?auto_1080645 ) ) ( not ( = ?auto_1080641 ?auto_1080646 ) ) ( not ( = ?auto_1080641 ?auto_1080647 ) ) ( not ( = ?auto_1080641 ?auto_1080648 ) ) ( not ( = ?auto_1080641 ?auto_1080649 ) ) ( not ( = ?auto_1080641 ?auto_1080650 ) ) ( not ( = ?auto_1080641 ?auto_1080651 ) ) ( not ( = ?auto_1080641 ?auto_1080652 ) ) ( not ( = ?auto_1080642 ?auto_1080644 ) ) ( not ( = ?auto_1080642 ?auto_1080643 ) ) ( not ( = ?auto_1080642 ?auto_1080645 ) ) ( not ( = ?auto_1080642 ?auto_1080646 ) ) ( not ( = ?auto_1080642 ?auto_1080647 ) ) ( not ( = ?auto_1080642 ?auto_1080648 ) ) ( not ( = ?auto_1080642 ?auto_1080649 ) ) ( not ( = ?auto_1080642 ?auto_1080650 ) ) ( not ( = ?auto_1080642 ?auto_1080651 ) ) ( not ( = ?auto_1080642 ?auto_1080652 ) ) ( not ( = ?auto_1080644 ?auto_1080643 ) ) ( not ( = ?auto_1080644 ?auto_1080645 ) ) ( not ( = ?auto_1080644 ?auto_1080646 ) ) ( not ( = ?auto_1080644 ?auto_1080647 ) ) ( not ( = ?auto_1080644 ?auto_1080648 ) ) ( not ( = ?auto_1080644 ?auto_1080649 ) ) ( not ( = ?auto_1080644 ?auto_1080650 ) ) ( not ( = ?auto_1080644 ?auto_1080651 ) ) ( not ( = ?auto_1080644 ?auto_1080652 ) ) ( not ( = ?auto_1080643 ?auto_1080645 ) ) ( not ( = ?auto_1080643 ?auto_1080646 ) ) ( not ( = ?auto_1080643 ?auto_1080647 ) ) ( not ( = ?auto_1080643 ?auto_1080648 ) ) ( not ( = ?auto_1080643 ?auto_1080649 ) ) ( not ( = ?auto_1080643 ?auto_1080650 ) ) ( not ( = ?auto_1080643 ?auto_1080651 ) ) ( not ( = ?auto_1080643 ?auto_1080652 ) ) ( not ( = ?auto_1080645 ?auto_1080646 ) ) ( not ( = ?auto_1080645 ?auto_1080647 ) ) ( not ( = ?auto_1080645 ?auto_1080648 ) ) ( not ( = ?auto_1080645 ?auto_1080649 ) ) ( not ( = ?auto_1080645 ?auto_1080650 ) ) ( not ( = ?auto_1080645 ?auto_1080651 ) ) ( not ( = ?auto_1080645 ?auto_1080652 ) ) ( not ( = ?auto_1080646 ?auto_1080647 ) ) ( not ( = ?auto_1080646 ?auto_1080648 ) ) ( not ( = ?auto_1080646 ?auto_1080649 ) ) ( not ( = ?auto_1080646 ?auto_1080650 ) ) ( not ( = ?auto_1080646 ?auto_1080651 ) ) ( not ( = ?auto_1080646 ?auto_1080652 ) ) ( not ( = ?auto_1080647 ?auto_1080648 ) ) ( not ( = ?auto_1080647 ?auto_1080649 ) ) ( not ( = ?auto_1080647 ?auto_1080650 ) ) ( not ( = ?auto_1080647 ?auto_1080651 ) ) ( not ( = ?auto_1080647 ?auto_1080652 ) ) ( not ( = ?auto_1080648 ?auto_1080649 ) ) ( not ( = ?auto_1080648 ?auto_1080650 ) ) ( not ( = ?auto_1080648 ?auto_1080651 ) ) ( not ( = ?auto_1080648 ?auto_1080652 ) ) ( not ( = ?auto_1080649 ?auto_1080650 ) ) ( not ( = ?auto_1080649 ?auto_1080651 ) ) ( not ( = ?auto_1080649 ?auto_1080652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1080650 ?auto_1080651 ?auto_1080652 )
      ( MAKE-12CRATE-VERIFY ?auto_1080640 ?auto_1080641 ?auto_1080642 ?auto_1080644 ?auto_1080643 ?auto_1080645 ?auto_1080646 ?auto_1080647 ?auto_1080648 ?auto_1080649 ?auto_1080650 ?auto_1080651 ?auto_1080652 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1080778 - SURFACE
      ?auto_1080779 - SURFACE
      ?auto_1080780 - SURFACE
      ?auto_1080782 - SURFACE
      ?auto_1080781 - SURFACE
      ?auto_1080783 - SURFACE
      ?auto_1080784 - SURFACE
      ?auto_1080785 - SURFACE
      ?auto_1080786 - SURFACE
      ?auto_1080787 - SURFACE
      ?auto_1080788 - SURFACE
      ?auto_1080789 - SURFACE
      ?auto_1080790 - SURFACE
    )
    :vars
    (
      ?auto_1080792 - HOIST
      ?auto_1080791 - PLACE
      ?auto_1080793 - TRUCK
      ?auto_1080794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1080792 ?auto_1080791 ) ( SURFACE-AT ?auto_1080789 ?auto_1080791 ) ( CLEAR ?auto_1080789 ) ( IS-CRATE ?auto_1080790 ) ( not ( = ?auto_1080789 ?auto_1080790 ) ) ( AVAILABLE ?auto_1080792 ) ( IN ?auto_1080790 ?auto_1080793 ) ( ON ?auto_1080789 ?auto_1080788 ) ( not ( = ?auto_1080788 ?auto_1080789 ) ) ( not ( = ?auto_1080788 ?auto_1080790 ) ) ( TRUCK-AT ?auto_1080793 ?auto_1080794 ) ( not ( = ?auto_1080794 ?auto_1080791 ) ) ( ON ?auto_1080779 ?auto_1080778 ) ( ON ?auto_1080780 ?auto_1080779 ) ( ON ?auto_1080782 ?auto_1080780 ) ( ON ?auto_1080781 ?auto_1080782 ) ( ON ?auto_1080783 ?auto_1080781 ) ( ON ?auto_1080784 ?auto_1080783 ) ( ON ?auto_1080785 ?auto_1080784 ) ( ON ?auto_1080786 ?auto_1080785 ) ( ON ?auto_1080787 ?auto_1080786 ) ( ON ?auto_1080788 ?auto_1080787 ) ( not ( = ?auto_1080778 ?auto_1080779 ) ) ( not ( = ?auto_1080778 ?auto_1080780 ) ) ( not ( = ?auto_1080778 ?auto_1080782 ) ) ( not ( = ?auto_1080778 ?auto_1080781 ) ) ( not ( = ?auto_1080778 ?auto_1080783 ) ) ( not ( = ?auto_1080778 ?auto_1080784 ) ) ( not ( = ?auto_1080778 ?auto_1080785 ) ) ( not ( = ?auto_1080778 ?auto_1080786 ) ) ( not ( = ?auto_1080778 ?auto_1080787 ) ) ( not ( = ?auto_1080778 ?auto_1080788 ) ) ( not ( = ?auto_1080778 ?auto_1080789 ) ) ( not ( = ?auto_1080778 ?auto_1080790 ) ) ( not ( = ?auto_1080779 ?auto_1080780 ) ) ( not ( = ?auto_1080779 ?auto_1080782 ) ) ( not ( = ?auto_1080779 ?auto_1080781 ) ) ( not ( = ?auto_1080779 ?auto_1080783 ) ) ( not ( = ?auto_1080779 ?auto_1080784 ) ) ( not ( = ?auto_1080779 ?auto_1080785 ) ) ( not ( = ?auto_1080779 ?auto_1080786 ) ) ( not ( = ?auto_1080779 ?auto_1080787 ) ) ( not ( = ?auto_1080779 ?auto_1080788 ) ) ( not ( = ?auto_1080779 ?auto_1080789 ) ) ( not ( = ?auto_1080779 ?auto_1080790 ) ) ( not ( = ?auto_1080780 ?auto_1080782 ) ) ( not ( = ?auto_1080780 ?auto_1080781 ) ) ( not ( = ?auto_1080780 ?auto_1080783 ) ) ( not ( = ?auto_1080780 ?auto_1080784 ) ) ( not ( = ?auto_1080780 ?auto_1080785 ) ) ( not ( = ?auto_1080780 ?auto_1080786 ) ) ( not ( = ?auto_1080780 ?auto_1080787 ) ) ( not ( = ?auto_1080780 ?auto_1080788 ) ) ( not ( = ?auto_1080780 ?auto_1080789 ) ) ( not ( = ?auto_1080780 ?auto_1080790 ) ) ( not ( = ?auto_1080782 ?auto_1080781 ) ) ( not ( = ?auto_1080782 ?auto_1080783 ) ) ( not ( = ?auto_1080782 ?auto_1080784 ) ) ( not ( = ?auto_1080782 ?auto_1080785 ) ) ( not ( = ?auto_1080782 ?auto_1080786 ) ) ( not ( = ?auto_1080782 ?auto_1080787 ) ) ( not ( = ?auto_1080782 ?auto_1080788 ) ) ( not ( = ?auto_1080782 ?auto_1080789 ) ) ( not ( = ?auto_1080782 ?auto_1080790 ) ) ( not ( = ?auto_1080781 ?auto_1080783 ) ) ( not ( = ?auto_1080781 ?auto_1080784 ) ) ( not ( = ?auto_1080781 ?auto_1080785 ) ) ( not ( = ?auto_1080781 ?auto_1080786 ) ) ( not ( = ?auto_1080781 ?auto_1080787 ) ) ( not ( = ?auto_1080781 ?auto_1080788 ) ) ( not ( = ?auto_1080781 ?auto_1080789 ) ) ( not ( = ?auto_1080781 ?auto_1080790 ) ) ( not ( = ?auto_1080783 ?auto_1080784 ) ) ( not ( = ?auto_1080783 ?auto_1080785 ) ) ( not ( = ?auto_1080783 ?auto_1080786 ) ) ( not ( = ?auto_1080783 ?auto_1080787 ) ) ( not ( = ?auto_1080783 ?auto_1080788 ) ) ( not ( = ?auto_1080783 ?auto_1080789 ) ) ( not ( = ?auto_1080783 ?auto_1080790 ) ) ( not ( = ?auto_1080784 ?auto_1080785 ) ) ( not ( = ?auto_1080784 ?auto_1080786 ) ) ( not ( = ?auto_1080784 ?auto_1080787 ) ) ( not ( = ?auto_1080784 ?auto_1080788 ) ) ( not ( = ?auto_1080784 ?auto_1080789 ) ) ( not ( = ?auto_1080784 ?auto_1080790 ) ) ( not ( = ?auto_1080785 ?auto_1080786 ) ) ( not ( = ?auto_1080785 ?auto_1080787 ) ) ( not ( = ?auto_1080785 ?auto_1080788 ) ) ( not ( = ?auto_1080785 ?auto_1080789 ) ) ( not ( = ?auto_1080785 ?auto_1080790 ) ) ( not ( = ?auto_1080786 ?auto_1080787 ) ) ( not ( = ?auto_1080786 ?auto_1080788 ) ) ( not ( = ?auto_1080786 ?auto_1080789 ) ) ( not ( = ?auto_1080786 ?auto_1080790 ) ) ( not ( = ?auto_1080787 ?auto_1080788 ) ) ( not ( = ?auto_1080787 ?auto_1080789 ) ) ( not ( = ?auto_1080787 ?auto_1080790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1080788 ?auto_1080789 ?auto_1080790 )
      ( MAKE-12CRATE-VERIFY ?auto_1080778 ?auto_1080779 ?auto_1080780 ?auto_1080782 ?auto_1080781 ?auto_1080783 ?auto_1080784 ?auto_1080785 ?auto_1080786 ?auto_1080787 ?auto_1080788 ?auto_1080789 ?auto_1080790 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1080928 - SURFACE
      ?auto_1080929 - SURFACE
      ?auto_1080930 - SURFACE
      ?auto_1080932 - SURFACE
      ?auto_1080931 - SURFACE
      ?auto_1080933 - SURFACE
      ?auto_1080934 - SURFACE
      ?auto_1080935 - SURFACE
      ?auto_1080936 - SURFACE
      ?auto_1080937 - SURFACE
      ?auto_1080938 - SURFACE
      ?auto_1080939 - SURFACE
      ?auto_1080940 - SURFACE
    )
    :vars
    (
      ?auto_1080943 - HOIST
      ?auto_1080945 - PLACE
      ?auto_1080944 - TRUCK
      ?auto_1080942 - PLACE
      ?auto_1080941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1080943 ?auto_1080945 ) ( SURFACE-AT ?auto_1080939 ?auto_1080945 ) ( CLEAR ?auto_1080939 ) ( IS-CRATE ?auto_1080940 ) ( not ( = ?auto_1080939 ?auto_1080940 ) ) ( AVAILABLE ?auto_1080943 ) ( ON ?auto_1080939 ?auto_1080938 ) ( not ( = ?auto_1080938 ?auto_1080939 ) ) ( not ( = ?auto_1080938 ?auto_1080940 ) ) ( TRUCK-AT ?auto_1080944 ?auto_1080942 ) ( not ( = ?auto_1080942 ?auto_1080945 ) ) ( HOIST-AT ?auto_1080941 ?auto_1080942 ) ( LIFTING ?auto_1080941 ?auto_1080940 ) ( not ( = ?auto_1080943 ?auto_1080941 ) ) ( ON ?auto_1080929 ?auto_1080928 ) ( ON ?auto_1080930 ?auto_1080929 ) ( ON ?auto_1080932 ?auto_1080930 ) ( ON ?auto_1080931 ?auto_1080932 ) ( ON ?auto_1080933 ?auto_1080931 ) ( ON ?auto_1080934 ?auto_1080933 ) ( ON ?auto_1080935 ?auto_1080934 ) ( ON ?auto_1080936 ?auto_1080935 ) ( ON ?auto_1080937 ?auto_1080936 ) ( ON ?auto_1080938 ?auto_1080937 ) ( not ( = ?auto_1080928 ?auto_1080929 ) ) ( not ( = ?auto_1080928 ?auto_1080930 ) ) ( not ( = ?auto_1080928 ?auto_1080932 ) ) ( not ( = ?auto_1080928 ?auto_1080931 ) ) ( not ( = ?auto_1080928 ?auto_1080933 ) ) ( not ( = ?auto_1080928 ?auto_1080934 ) ) ( not ( = ?auto_1080928 ?auto_1080935 ) ) ( not ( = ?auto_1080928 ?auto_1080936 ) ) ( not ( = ?auto_1080928 ?auto_1080937 ) ) ( not ( = ?auto_1080928 ?auto_1080938 ) ) ( not ( = ?auto_1080928 ?auto_1080939 ) ) ( not ( = ?auto_1080928 ?auto_1080940 ) ) ( not ( = ?auto_1080929 ?auto_1080930 ) ) ( not ( = ?auto_1080929 ?auto_1080932 ) ) ( not ( = ?auto_1080929 ?auto_1080931 ) ) ( not ( = ?auto_1080929 ?auto_1080933 ) ) ( not ( = ?auto_1080929 ?auto_1080934 ) ) ( not ( = ?auto_1080929 ?auto_1080935 ) ) ( not ( = ?auto_1080929 ?auto_1080936 ) ) ( not ( = ?auto_1080929 ?auto_1080937 ) ) ( not ( = ?auto_1080929 ?auto_1080938 ) ) ( not ( = ?auto_1080929 ?auto_1080939 ) ) ( not ( = ?auto_1080929 ?auto_1080940 ) ) ( not ( = ?auto_1080930 ?auto_1080932 ) ) ( not ( = ?auto_1080930 ?auto_1080931 ) ) ( not ( = ?auto_1080930 ?auto_1080933 ) ) ( not ( = ?auto_1080930 ?auto_1080934 ) ) ( not ( = ?auto_1080930 ?auto_1080935 ) ) ( not ( = ?auto_1080930 ?auto_1080936 ) ) ( not ( = ?auto_1080930 ?auto_1080937 ) ) ( not ( = ?auto_1080930 ?auto_1080938 ) ) ( not ( = ?auto_1080930 ?auto_1080939 ) ) ( not ( = ?auto_1080930 ?auto_1080940 ) ) ( not ( = ?auto_1080932 ?auto_1080931 ) ) ( not ( = ?auto_1080932 ?auto_1080933 ) ) ( not ( = ?auto_1080932 ?auto_1080934 ) ) ( not ( = ?auto_1080932 ?auto_1080935 ) ) ( not ( = ?auto_1080932 ?auto_1080936 ) ) ( not ( = ?auto_1080932 ?auto_1080937 ) ) ( not ( = ?auto_1080932 ?auto_1080938 ) ) ( not ( = ?auto_1080932 ?auto_1080939 ) ) ( not ( = ?auto_1080932 ?auto_1080940 ) ) ( not ( = ?auto_1080931 ?auto_1080933 ) ) ( not ( = ?auto_1080931 ?auto_1080934 ) ) ( not ( = ?auto_1080931 ?auto_1080935 ) ) ( not ( = ?auto_1080931 ?auto_1080936 ) ) ( not ( = ?auto_1080931 ?auto_1080937 ) ) ( not ( = ?auto_1080931 ?auto_1080938 ) ) ( not ( = ?auto_1080931 ?auto_1080939 ) ) ( not ( = ?auto_1080931 ?auto_1080940 ) ) ( not ( = ?auto_1080933 ?auto_1080934 ) ) ( not ( = ?auto_1080933 ?auto_1080935 ) ) ( not ( = ?auto_1080933 ?auto_1080936 ) ) ( not ( = ?auto_1080933 ?auto_1080937 ) ) ( not ( = ?auto_1080933 ?auto_1080938 ) ) ( not ( = ?auto_1080933 ?auto_1080939 ) ) ( not ( = ?auto_1080933 ?auto_1080940 ) ) ( not ( = ?auto_1080934 ?auto_1080935 ) ) ( not ( = ?auto_1080934 ?auto_1080936 ) ) ( not ( = ?auto_1080934 ?auto_1080937 ) ) ( not ( = ?auto_1080934 ?auto_1080938 ) ) ( not ( = ?auto_1080934 ?auto_1080939 ) ) ( not ( = ?auto_1080934 ?auto_1080940 ) ) ( not ( = ?auto_1080935 ?auto_1080936 ) ) ( not ( = ?auto_1080935 ?auto_1080937 ) ) ( not ( = ?auto_1080935 ?auto_1080938 ) ) ( not ( = ?auto_1080935 ?auto_1080939 ) ) ( not ( = ?auto_1080935 ?auto_1080940 ) ) ( not ( = ?auto_1080936 ?auto_1080937 ) ) ( not ( = ?auto_1080936 ?auto_1080938 ) ) ( not ( = ?auto_1080936 ?auto_1080939 ) ) ( not ( = ?auto_1080936 ?auto_1080940 ) ) ( not ( = ?auto_1080937 ?auto_1080938 ) ) ( not ( = ?auto_1080937 ?auto_1080939 ) ) ( not ( = ?auto_1080937 ?auto_1080940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1080938 ?auto_1080939 ?auto_1080940 )
      ( MAKE-12CRATE-VERIFY ?auto_1080928 ?auto_1080929 ?auto_1080930 ?auto_1080932 ?auto_1080931 ?auto_1080933 ?auto_1080934 ?auto_1080935 ?auto_1080936 ?auto_1080937 ?auto_1080938 ?auto_1080939 ?auto_1080940 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081090 - SURFACE
      ?auto_1081091 - SURFACE
      ?auto_1081092 - SURFACE
      ?auto_1081094 - SURFACE
      ?auto_1081093 - SURFACE
      ?auto_1081095 - SURFACE
      ?auto_1081096 - SURFACE
      ?auto_1081097 - SURFACE
      ?auto_1081098 - SURFACE
      ?auto_1081099 - SURFACE
      ?auto_1081100 - SURFACE
      ?auto_1081101 - SURFACE
      ?auto_1081102 - SURFACE
    )
    :vars
    (
      ?auto_1081107 - HOIST
      ?auto_1081106 - PLACE
      ?auto_1081105 - TRUCK
      ?auto_1081103 - PLACE
      ?auto_1081108 - HOIST
      ?auto_1081104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081107 ?auto_1081106 ) ( SURFACE-AT ?auto_1081101 ?auto_1081106 ) ( CLEAR ?auto_1081101 ) ( IS-CRATE ?auto_1081102 ) ( not ( = ?auto_1081101 ?auto_1081102 ) ) ( AVAILABLE ?auto_1081107 ) ( ON ?auto_1081101 ?auto_1081100 ) ( not ( = ?auto_1081100 ?auto_1081101 ) ) ( not ( = ?auto_1081100 ?auto_1081102 ) ) ( TRUCK-AT ?auto_1081105 ?auto_1081103 ) ( not ( = ?auto_1081103 ?auto_1081106 ) ) ( HOIST-AT ?auto_1081108 ?auto_1081103 ) ( not ( = ?auto_1081107 ?auto_1081108 ) ) ( AVAILABLE ?auto_1081108 ) ( SURFACE-AT ?auto_1081102 ?auto_1081103 ) ( ON ?auto_1081102 ?auto_1081104 ) ( CLEAR ?auto_1081102 ) ( not ( = ?auto_1081101 ?auto_1081104 ) ) ( not ( = ?auto_1081102 ?auto_1081104 ) ) ( not ( = ?auto_1081100 ?auto_1081104 ) ) ( ON ?auto_1081091 ?auto_1081090 ) ( ON ?auto_1081092 ?auto_1081091 ) ( ON ?auto_1081094 ?auto_1081092 ) ( ON ?auto_1081093 ?auto_1081094 ) ( ON ?auto_1081095 ?auto_1081093 ) ( ON ?auto_1081096 ?auto_1081095 ) ( ON ?auto_1081097 ?auto_1081096 ) ( ON ?auto_1081098 ?auto_1081097 ) ( ON ?auto_1081099 ?auto_1081098 ) ( ON ?auto_1081100 ?auto_1081099 ) ( not ( = ?auto_1081090 ?auto_1081091 ) ) ( not ( = ?auto_1081090 ?auto_1081092 ) ) ( not ( = ?auto_1081090 ?auto_1081094 ) ) ( not ( = ?auto_1081090 ?auto_1081093 ) ) ( not ( = ?auto_1081090 ?auto_1081095 ) ) ( not ( = ?auto_1081090 ?auto_1081096 ) ) ( not ( = ?auto_1081090 ?auto_1081097 ) ) ( not ( = ?auto_1081090 ?auto_1081098 ) ) ( not ( = ?auto_1081090 ?auto_1081099 ) ) ( not ( = ?auto_1081090 ?auto_1081100 ) ) ( not ( = ?auto_1081090 ?auto_1081101 ) ) ( not ( = ?auto_1081090 ?auto_1081102 ) ) ( not ( = ?auto_1081090 ?auto_1081104 ) ) ( not ( = ?auto_1081091 ?auto_1081092 ) ) ( not ( = ?auto_1081091 ?auto_1081094 ) ) ( not ( = ?auto_1081091 ?auto_1081093 ) ) ( not ( = ?auto_1081091 ?auto_1081095 ) ) ( not ( = ?auto_1081091 ?auto_1081096 ) ) ( not ( = ?auto_1081091 ?auto_1081097 ) ) ( not ( = ?auto_1081091 ?auto_1081098 ) ) ( not ( = ?auto_1081091 ?auto_1081099 ) ) ( not ( = ?auto_1081091 ?auto_1081100 ) ) ( not ( = ?auto_1081091 ?auto_1081101 ) ) ( not ( = ?auto_1081091 ?auto_1081102 ) ) ( not ( = ?auto_1081091 ?auto_1081104 ) ) ( not ( = ?auto_1081092 ?auto_1081094 ) ) ( not ( = ?auto_1081092 ?auto_1081093 ) ) ( not ( = ?auto_1081092 ?auto_1081095 ) ) ( not ( = ?auto_1081092 ?auto_1081096 ) ) ( not ( = ?auto_1081092 ?auto_1081097 ) ) ( not ( = ?auto_1081092 ?auto_1081098 ) ) ( not ( = ?auto_1081092 ?auto_1081099 ) ) ( not ( = ?auto_1081092 ?auto_1081100 ) ) ( not ( = ?auto_1081092 ?auto_1081101 ) ) ( not ( = ?auto_1081092 ?auto_1081102 ) ) ( not ( = ?auto_1081092 ?auto_1081104 ) ) ( not ( = ?auto_1081094 ?auto_1081093 ) ) ( not ( = ?auto_1081094 ?auto_1081095 ) ) ( not ( = ?auto_1081094 ?auto_1081096 ) ) ( not ( = ?auto_1081094 ?auto_1081097 ) ) ( not ( = ?auto_1081094 ?auto_1081098 ) ) ( not ( = ?auto_1081094 ?auto_1081099 ) ) ( not ( = ?auto_1081094 ?auto_1081100 ) ) ( not ( = ?auto_1081094 ?auto_1081101 ) ) ( not ( = ?auto_1081094 ?auto_1081102 ) ) ( not ( = ?auto_1081094 ?auto_1081104 ) ) ( not ( = ?auto_1081093 ?auto_1081095 ) ) ( not ( = ?auto_1081093 ?auto_1081096 ) ) ( not ( = ?auto_1081093 ?auto_1081097 ) ) ( not ( = ?auto_1081093 ?auto_1081098 ) ) ( not ( = ?auto_1081093 ?auto_1081099 ) ) ( not ( = ?auto_1081093 ?auto_1081100 ) ) ( not ( = ?auto_1081093 ?auto_1081101 ) ) ( not ( = ?auto_1081093 ?auto_1081102 ) ) ( not ( = ?auto_1081093 ?auto_1081104 ) ) ( not ( = ?auto_1081095 ?auto_1081096 ) ) ( not ( = ?auto_1081095 ?auto_1081097 ) ) ( not ( = ?auto_1081095 ?auto_1081098 ) ) ( not ( = ?auto_1081095 ?auto_1081099 ) ) ( not ( = ?auto_1081095 ?auto_1081100 ) ) ( not ( = ?auto_1081095 ?auto_1081101 ) ) ( not ( = ?auto_1081095 ?auto_1081102 ) ) ( not ( = ?auto_1081095 ?auto_1081104 ) ) ( not ( = ?auto_1081096 ?auto_1081097 ) ) ( not ( = ?auto_1081096 ?auto_1081098 ) ) ( not ( = ?auto_1081096 ?auto_1081099 ) ) ( not ( = ?auto_1081096 ?auto_1081100 ) ) ( not ( = ?auto_1081096 ?auto_1081101 ) ) ( not ( = ?auto_1081096 ?auto_1081102 ) ) ( not ( = ?auto_1081096 ?auto_1081104 ) ) ( not ( = ?auto_1081097 ?auto_1081098 ) ) ( not ( = ?auto_1081097 ?auto_1081099 ) ) ( not ( = ?auto_1081097 ?auto_1081100 ) ) ( not ( = ?auto_1081097 ?auto_1081101 ) ) ( not ( = ?auto_1081097 ?auto_1081102 ) ) ( not ( = ?auto_1081097 ?auto_1081104 ) ) ( not ( = ?auto_1081098 ?auto_1081099 ) ) ( not ( = ?auto_1081098 ?auto_1081100 ) ) ( not ( = ?auto_1081098 ?auto_1081101 ) ) ( not ( = ?auto_1081098 ?auto_1081102 ) ) ( not ( = ?auto_1081098 ?auto_1081104 ) ) ( not ( = ?auto_1081099 ?auto_1081100 ) ) ( not ( = ?auto_1081099 ?auto_1081101 ) ) ( not ( = ?auto_1081099 ?auto_1081102 ) ) ( not ( = ?auto_1081099 ?auto_1081104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081100 ?auto_1081101 ?auto_1081102 )
      ( MAKE-12CRATE-VERIFY ?auto_1081090 ?auto_1081091 ?auto_1081092 ?auto_1081094 ?auto_1081093 ?auto_1081095 ?auto_1081096 ?auto_1081097 ?auto_1081098 ?auto_1081099 ?auto_1081100 ?auto_1081101 ?auto_1081102 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081253 - SURFACE
      ?auto_1081254 - SURFACE
      ?auto_1081255 - SURFACE
      ?auto_1081257 - SURFACE
      ?auto_1081256 - SURFACE
      ?auto_1081258 - SURFACE
      ?auto_1081259 - SURFACE
      ?auto_1081260 - SURFACE
      ?auto_1081261 - SURFACE
      ?auto_1081262 - SURFACE
      ?auto_1081263 - SURFACE
      ?auto_1081264 - SURFACE
      ?auto_1081265 - SURFACE
    )
    :vars
    (
      ?auto_1081270 - HOIST
      ?auto_1081267 - PLACE
      ?auto_1081269 - PLACE
      ?auto_1081266 - HOIST
      ?auto_1081271 - SURFACE
      ?auto_1081268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081270 ?auto_1081267 ) ( SURFACE-AT ?auto_1081264 ?auto_1081267 ) ( CLEAR ?auto_1081264 ) ( IS-CRATE ?auto_1081265 ) ( not ( = ?auto_1081264 ?auto_1081265 ) ) ( AVAILABLE ?auto_1081270 ) ( ON ?auto_1081264 ?auto_1081263 ) ( not ( = ?auto_1081263 ?auto_1081264 ) ) ( not ( = ?auto_1081263 ?auto_1081265 ) ) ( not ( = ?auto_1081269 ?auto_1081267 ) ) ( HOIST-AT ?auto_1081266 ?auto_1081269 ) ( not ( = ?auto_1081270 ?auto_1081266 ) ) ( AVAILABLE ?auto_1081266 ) ( SURFACE-AT ?auto_1081265 ?auto_1081269 ) ( ON ?auto_1081265 ?auto_1081271 ) ( CLEAR ?auto_1081265 ) ( not ( = ?auto_1081264 ?auto_1081271 ) ) ( not ( = ?auto_1081265 ?auto_1081271 ) ) ( not ( = ?auto_1081263 ?auto_1081271 ) ) ( TRUCK-AT ?auto_1081268 ?auto_1081267 ) ( ON ?auto_1081254 ?auto_1081253 ) ( ON ?auto_1081255 ?auto_1081254 ) ( ON ?auto_1081257 ?auto_1081255 ) ( ON ?auto_1081256 ?auto_1081257 ) ( ON ?auto_1081258 ?auto_1081256 ) ( ON ?auto_1081259 ?auto_1081258 ) ( ON ?auto_1081260 ?auto_1081259 ) ( ON ?auto_1081261 ?auto_1081260 ) ( ON ?auto_1081262 ?auto_1081261 ) ( ON ?auto_1081263 ?auto_1081262 ) ( not ( = ?auto_1081253 ?auto_1081254 ) ) ( not ( = ?auto_1081253 ?auto_1081255 ) ) ( not ( = ?auto_1081253 ?auto_1081257 ) ) ( not ( = ?auto_1081253 ?auto_1081256 ) ) ( not ( = ?auto_1081253 ?auto_1081258 ) ) ( not ( = ?auto_1081253 ?auto_1081259 ) ) ( not ( = ?auto_1081253 ?auto_1081260 ) ) ( not ( = ?auto_1081253 ?auto_1081261 ) ) ( not ( = ?auto_1081253 ?auto_1081262 ) ) ( not ( = ?auto_1081253 ?auto_1081263 ) ) ( not ( = ?auto_1081253 ?auto_1081264 ) ) ( not ( = ?auto_1081253 ?auto_1081265 ) ) ( not ( = ?auto_1081253 ?auto_1081271 ) ) ( not ( = ?auto_1081254 ?auto_1081255 ) ) ( not ( = ?auto_1081254 ?auto_1081257 ) ) ( not ( = ?auto_1081254 ?auto_1081256 ) ) ( not ( = ?auto_1081254 ?auto_1081258 ) ) ( not ( = ?auto_1081254 ?auto_1081259 ) ) ( not ( = ?auto_1081254 ?auto_1081260 ) ) ( not ( = ?auto_1081254 ?auto_1081261 ) ) ( not ( = ?auto_1081254 ?auto_1081262 ) ) ( not ( = ?auto_1081254 ?auto_1081263 ) ) ( not ( = ?auto_1081254 ?auto_1081264 ) ) ( not ( = ?auto_1081254 ?auto_1081265 ) ) ( not ( = ?auto_1081254 ?auto_1081271 ) ) ( not ( = ?auto_1081255 ?auto_1081257 ) ) ( not ( = ?auto_1081255 ?auto_1081256 ) ) ( not ( = ?auto_1081255 ?auto_1081258 ) ) ( not ( = ?auto_1081255 ?auto_1081259 ) ) ( not ( = ?auto_1081255 ?auto_1081260 ) ) ( not ( = ?auto_1081255 ?auto_1081261 ) ) ( not ( = ?auto_1081255 ?auto_1081262 ) ) ( not ( = ?auto_1081255 ?auto_1081263 ) ) ( not ( = ?auto_1081255 ?auto_1081264 ) ) ( not ( = ?auto_1081255 ?auto_1081265 ) ) ( not ( = ?auto_1081255 ?auto_1081271 ) ) ( not ( = ?auto_1081257 ?auto_1081256 ) ) ( not ( = ?auto_1081257 ?auto_1081258 ) ) ( not ( = ?auto_1081257 ?auto_1081259 ) ) ( not ( = ?auto_1081257 ?auto_1081260 ) ) ( not ( = ?auto_1081257 ?auto_1081261 ) ) ( not ( = ?auto_1081257 ?auto_1081262 ) ) ( not ( = ?auto_1081257 ?auto_1081263 ) ) ( not ( = ?auto_1081257 ?auto_1081264 ) ) ( not ( = ?auto_1081257 ?auto_1081265 ) ) ( not ( = ?auto_1081257 ?auto_1081271 ) ) ( not ( = ?auto_1081256 ?auto_1081258 ) ) ( not ( = ?auto_1081256 ?auto_1081259 ) ) ( not ( = ?auto_1081256 ?auto_1081260 ) ) ( not ( = ?auto_1081256 ?auto_1081261 ) ) ( not ( = ?auto_1081256 ?auto_1081262 ) ) ( not ( = ?auto_1081256 ?auto_1081263 ) ) ( not ( = ?auto_1081256 ?auto_1081264 ) ) ( not ( = ?auto_1081256 ?auto_1081265 ) ) ( not ( = ?auto_1081256 ?auto_1081271 ) ) ( not ( = ?auto_1081258 ?auto_1081259 ) ) ( not ( = ?auto_1081258 ?auto_1081260 ) ) ( not ( = ?auto_1081258 ?auto_1081261 ) ) ( not ( = ?auto_1081258 ?auto_1081262 ) ) ( not ( = ?auto_1081258 ?auto_1081263 ) ) ( not ( = ?auto_1081258 ?auto_1081264 ) ) ( not ( = ?auto_1081258 ?auto_1081265 ) ) ( not ( = ?auto_1081258 ?auto_1081271 ) ) ( not ( = ?auto_1081259 ?auto_1081260 ) ) ( not ( = ?auto_1081259 ?auto_1081261 ) ) ( not ( = ?auto_1081259 ?auto_1081262 ) ) ( not ( = ?auto_1081259 ?auto_1081263 ) ) ( not ( = ?auto_1081259 ?auto_1081264 ) ) ( not ( = ?auto_1081259 ?auto_1081265 ) ) ( not ( = ?auto_1081259 ?auto_1081271 ) ) ( not ( = ?auto_1081260 ?auto_1081261 ) ) ( not ( = ?auto_1081260 ?auto_1081262 ) ) ( not ( = ?auto_1081260 ?auto_1081263 ) ) ( not ( = ?auto_1081260 ?auto_1081264 ) ) ( not ( = ?auto_1081260 ?auto_1081265 ) ) ( not ( = ?auto_1081260 ?auto_1081271 ) ) ( not ( = ?auto_1081261 ?auto_1081262 ) ) ( not ( = ?auto_1081261 ?auto_1081263 ) ) ( not ( = ?auto_1081261 ?auto_1081264 ) ) ( not ( = ?auto_1081261 ?auto_1081265 ) ) ( not ( = ?auto_1081261 ?auto_1081271 ) ) ( not ( = ?auto_1081262 ?auto_1081263 ) ) ( not ( = ?auto_1081262 ?auto_1081264 ) ) ( not ( = ?auto_1081262 ?auto_1081265 ) ) ( not ( = ?auto_1081262 ?auto_1081271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081263 ?auto_1081264 ?auto_1081265 )
      ( MAKE-12CRATE-VERIFY ?auto_1081253 ?auto_1081254 ?auto_1081255 ?auto_1081257 ?auto_1081256 ?auto_1081258 ?auto_1081259 ?auto_1081260 ?auto_1081261 ?auto_1081262 ?auto_1081263 ?auto_1081264 ?auto_1081265 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081416 - SURFACE
      ?auto_1081417 - SURFACE
      ?auto_1081418 - SURFACE
      ?auto_1081420 - SURFACE
      ?auto_1081419 - SURFACE
      ?auto_1081421 - SURFACE
      ?auto_1081422 - SURFACE
      ?auto_1081423 - SURFACE
      ?auto_1081424 - SURFACE
      ?auto_1081425 - SURFACE
      ?auto_1081426 - SURFACE
      ?auto_1081427 - SURFACE
      ?auto_1081428 - SURFACE
    )
    :vars
    (
      ?auto_1081430 - HOIST
      ?auto_1081429 - PLACE
      ?auto_1081434 - PLACE
      ?auto_1081433 - HOIST
      ?auto_1081431 - SURFACE
      ?auto_1081432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081430 ?auto_1081429 ) ( IS-CRATE ?auto_1081428 ) ( not ( = ?auto_1081427 ?auto_1081428 ) ) ( not ( = ?auto_1081426 ?auto_1081427 ) ) ( not ( = ?auto_1081426 ?auto_1081428 ) ) ( not ( = ?auto_1081434 ?auto_1081429 ) ) ( HOIST-AT ?auto_1081433 ?auto_1081434 ) ( not ( = ?auto_1081430 ?auto_1081433 ) ) ( AVAILABLE ?auto_1081433 ) ( SURFACE-AT ?auto_1081428 ?auto_1081434 ) ( ON ?auto_1081428 ?auto_1081431 ) ( CLEAR ?auto_1081428 ) ( not ( = ?auto_1081427 ?auto_1081431 ) ) ( not ( = ?auto_1081428 ?auto_1081431 ) ) ( not ( = ?auto_1081426 ?auto_1081431 ) ) ( TRUCK-AT ?auto_1081432 ?auto_1081429 ) ( SURFACE-AT ?auto_1081426 ?auto_1081429 ) ( CLEAR ?auto_1081426 ) ( LIFTING ?auto_1081430 ?auto_1081427 ) ( IS-CRATE ?auto_1081427 ) ( ON ?auto_1081417 ?auto_1081416 ) ( ON ?auto_1081418 ?auto_1081417 ) ( ON ?auto_1081420 ?auto_1081418 ) ( ON ?auto_1081419 ?auto_1081420 ) ( ON ?auto_1081421 ?auto_1081419 ) ( ON ?auto_1081422 ?auto_1081421 ) ( ON ?auto_1081423 ?auto_1081422 ) ( ON ?auto_1081424 ?auto_1081423 ) ( ON ?auto_1081425 ?auto_1081424 ) ( ON ?auto_1081426 ?auto_1081425 ) ( not ( = ?auto_1081416 ?auto_1081417 ) ) ( not ( = ?auto_1081416 ?auto_1081418 ) ) ( not ( = ?auto_1081416 ?auto_1081420 ) ) ( not ( = ?auto_1081416 ?auto_1081419 ) ) ( not ( = ?auto_1081416 ?auto_1081421 ) ) ( not ( = ?auto_1081416 ?auto_1081422 ) ) ( not ( = ?auto_1081416 ?auto_1081423 ) ) ( not ( = ?auto_1081416 ?auto_1081424 ) ) ( not ( = ?auto_1081416 ?auto_1081425 ) ) ( not ( = ?auto_1081416 ?auto_1081426 ) ) ( not ( = ?auto_1081416 ?auto_1081427 ) ) ( not ( = ?auto_1081416 ?auto_1081428 ) ) ( not ( = ?auto_1081416 ?auto_1081431 ) ) ( not ( = ?auto_1081417 ?auto_1081418 ) ) ( not ( = ?auto_1081417 ?auto_1081420 ) ) ( not ( = ?auto_1081417 ?auto_1081419 ) ) ( not ( = ?auto_1081417 ?auto_1081421 ) ) ( not ( = ?auto_1081417 ?auto_1081422 ) ) ( not ( = ?auto_1081417 ?auto_1081423 ) ) ( not ( = ?auto_1081417 ?auto_1081424 ) ) ( not ( = ?auto_1081417 ?auto_1081425 ) ) ( not ( = ?auto_1081417 ?auto_1081426 ) ) ( not ( = ?auto_1081417 ?auto_1081427 ) ) ( not ( = ?auto_1081417 ?auto_1081428 ) ) ( not ( = ?auto_1081417 ?auto_1081431 ) ) ( not ( = ?auto_1081418 ?auto_1081420 ) ) ( not ( = ?auto_1081418 ?auto_1081419 ) ) ( not ( = ?auto_1081418 ?auto_1081421 ) ) ( not ( = ?auto_1081418 ?auto_1081422 ) ) ( not ( = ?auto_1081418 ?auto_1081423 ) ) ( not ( = ?auto_1081418 ?auto_1081424 ) ) ( not ( = ?auto_1081418 ?auto_1081425 ) ) ( not ( = ?auto_1081418 ?auto_1081426 ) ) ( not ( = ?auto_1081418 ?auto_1081427 ) ) ( not ( = ?auto_1081418 ?auto_1081428 ) ) ( not ( = ?auto_1081418 ?auto_1081431 ) ) ( not ( = ?auto_1081420 ?auto_1081419 ) ) ( not ( = ?auto_1081420 ?auto_1081421 ) ) ( not ( = ?auto_1081420 ?auto_1081422 ) ) ( not ( = ?auto_1081420 ?auto_1081423 ) ) ( not ( = ?auto_1081420 ?auto_1081424 ) ) ( not ( = ?auto_1081420 ?auto_1081425 ) ) ( not ( = ?auto_1081420 ?auto_1081426 ) ) ( not ( = ?auto_1081420 ?auto_1081427 ) ) ( not ( = ?auto_1081420 ?auto_1081428 ) ) ( not ( = ?auto_1081420 ?auto_1081431 ) ) ( not ( = ?auto_1081419 ?auto_1081421 ) ) ( not ( = ?auto_1081419 ?auto_1081422 ) ) ( not ( = ?auto_1081419 ?auto_1081423 ) ) ( not ( = ?auto_1081419 ?auto_1081424 ) ) ( not ( = ?auto_1081419 ?auto_1081425 ) ) ( not ( = ?auto_1081419 ?auto_1081426 ) ) ( not ( = ?auto_1081419 ?auto_1081427 ) ) ( not ( = ?auto_1081419 ?auto_1081428 ) ) ( not ( = ?auto_1081419 ?auto_1081431 ) ) ( not ( = ?auto_1081421 ?auto_1081422 ) ) ( not ( = ?auto_1081421 ?auto_1081423 ) ) ( not ( = ?auto_1081421 ?auto_1081424 ) ) ( not ( = ?auto_1081421 ?auto_1081425 ) ) ( not ( = ?auto_1081421 ?auto_1081426 ) ) ( not ( = ?auto_1081421 ?auto_1081427 ) ) ( not ( = ?auto_1081421 ?auto_1081428 ) ) ( not ( = ?auto_1081421 ?auto_1081431 ) ) ( not ( = ?auto_1081422 ?auto_1081423 ) ) ( not ( = ?auto_1081422 ?auto_1081424 ) ) ( not ( = ?auto_1081422 ?auto_1081425 ) ) ( not ( = ?auto_1081422 ?auto_1081426 ) ) ( not ( = ?auto_1081422 ?auto_1081427 ) ) ( not ( = ?auto_1081422 ?auto_1081428 ) ) ( not ( = ?auto_1081422 ?auto_1081431 ) ) ( not ( = ?auto_1081423 ?auto_1081424 ) ) ( not ( = ?auto_1081423 ?auto_1081425 ) ) ( not ( = ?auto_1081423 ?auto_1081426 ) ) ( not ( = ?auto_1081423 ?auto_1081427 ) ) ( not ( = ?auto_1081423 ?auto_1081428 ) ) ( not ( = ?auto_1081423 ?auto_1081431 ) ) ( not ( = ?auto_1081424 ?auto_1081425 ) ) ( not ( = ?auto_1081424 ?auto_1081426 ) ) ( not ( = ?auto_1081424 ?auto_1081427 ) ) ( not ( = ?auto_1081424 ?auto_1081428 ) ) ( not ( = ?auto_1081424 ?auto_1081431 ) ) ( not ( = ?auto_1081425 ?auto_1081426 ) ) ( not ( = ?auto_1081425 ?auto_1081427 ) ) ( not ( = ?auto_1081425 ?auto_1081428 ) ) ( not ( = ?auto_1081425 ?auto_1081431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081426 ?auto_1081427 ?auto_1081428 )
      ( MAKE-12CRATE-VERIFY ?auto_1081416 ?auto_1081417 ?auto_1081418 ?auto_1081420 ?auto_1081419 ?auto_1081421 ?auto_1081422 ?auto_1081423 ?auto_1081424 ?auto_1081425 ?auto_1081426 ?auto_1081427 ?auto_1081428 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081579 - SURFACE
      ?auto_1081580 - SURFACE
      ?auto_1081581 - SURFACE
      ?auto_1081583 - SURFACE
      ?auto_1081582 - SURFACE
      ?auto_1081584 - SURFACE
      ?auto_1081585 - SURFACE
      ?auto_1081586 - SURFACE
      ?auto_1081587 - SURFACE
      ?auto_1081588 - SURFACE
      ?auto_1081589 - SURFACE
      ?auto_1081590 - SURFACE
      ?auto_1081591 - SURFACE
    )
    :vars
    (
      ?auto_1081596 - HOIST
      ?auto_1081594 - PLACE
      ?auto_1081597 - PLACE
      ?auto_1081593 - HOIST
      ?auto_1081595 - SURFACE
      ?auto_1081592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081596 ?auto_1081594 ) ( IS-CRATE ?auto_1081591 ) ( not ( = ?auto_1081590 ?auto_1081591 ) ) ( not ( = ?auto_1081589 ?auto_1081590 ) ) ( not ( = ?auto_1081589 ?auto_1081591 ) ) ( not ( = ?auto_1081597 ?auto_1081594 ) ) ( HOIST-AT ?auto_1081593 ?auto_1081597 ) ( not ( = ?auto_1081596 ?auto_1081593 ) ) ( AVAILABLE ?auto_1081593 ) ( SURFACE-AT ?auto_1081591 ?auto_1081597 ) ( ON ?auto_1081591 ?auto_1081595 ) ( CLEAR ?auto_1081591 ) ( not ( = ?auto_1081590 ?auto_1081595 ) ) ( not ( = ?auto_1081591 ?auto_1081595 ) ) ( not ( = ?auto_1081589 ?auto_1081595 ) ) ( TRUCK-AT ?auto_1081592 ?auto_1081594 ) ( SURFACE-AT ?auto_1081589 ?auto_1081594 ) ( CLEAR ?auto_1081589 ) ( IS-CRATE ?auto_1081590 ) ( AVAILABLE ?auto_1081596 ) ( IN ?auto_1081590 ?auto_1081592 ) ( ON ?auto_1081580 ?auto_1081579 ) ( ON ?auto_1081581 ?auto_1081580 ) ( ON ?auto_1081583 ?auto_1081581 ) ( ON ?auto_1081582 ?auto_1081583 ) ( ON ?auto_1081584 ?auto_1081582 ) ( ON ?auto_1081585 ?auto_1081584 ) ( ON ?auto_1081586 ?auto_1081585 ) ( ON ?auto_1081587 ?auto_1081586 ) ( ON ?auto_1081588 ?auto_1081587 ) ( ON ?auto_1081589 ?auto_1081588 ) ( not ( = ?auto_1081579 ?auto_1081580 ) ) ( not ( = ?auto_1081579 ?auto_1081581 ) ) ( not ( = ?auto_1081579 ?auto_1081583 ) ) ( not ( = ?auto_1081579 ?auto_1081582 ) ) ( not ( = ?auto_1081579 ?auto_1081584 ) ) ( not ( = ?auto_1081579 ?auto_1081585 ) ) ( not ( = ?auto_1081579 ?auto_1081586 ) ) ( not ( = ?auto_1081579 ?auto_1081587 ) ) ( not ( = ?auto_1081579 ?auto_1081588 ) ) ( not ( = ?auto_1081579 ?auto_1081589 ) ) ( not ( = ?auto_1081579 ?auto_1081590 ) ) ( not ( = ?auto_1081579 ?auto_1081591 ) ) ( not ( = ?auto_1081579 ?auto_1081595 ) ) ( not ( = ?auto_1081580 ?auto_1081581 ) ) ( not ( = ?auto_1081580 ?auto_1081583 ) ) ( not ( = ?auto_1081580 ?auto_1081582 ) ) ( not ( = ?auto_1081580 ?auto_1081584 ) ) ( not ( = ?auto_1081580 ?auto_1081585 ) ) ( not ( = ?auto_1081580 ?auto_1081586 ) ) ( not ( = ?auto_1081580 ?auto_1081587 ) ) ( not ( = ?auto_1081580 ?auto_1081588 ) ) ( not ( = ?auto_1081580 ?auto_1081589 ) ) ( not ( = ?auto_1081580 ?auto_1081590 ) ) ( not ( = ?auto_1081580 ?auto_1081591 ) ) ( not ( = ?auto_1081580 ?auto_1081595 ) ) ( not ( = ?auto_1081581 ?auto_1081583 ) ) ( not ( = ?auto_1081581 ?auto_1081582 ) ) ( not ( = ?auto_1081581 ?auto_1081584 ) ) ( not ( = ?auto_1081581 ?auto_1081585 ) ) ( not ( = ?auto_1081581 ?auto_1081586 ) ) ( not ( = ?auto_1081581 ?auto_1081587 ) ) ( not ( = ?auto_1081581 ?auto_1081588 ) ) ( not ( = ?auto_1081581 ?auto_1081589 ) ) ( not ( = ?auto_1081581 ?auto_1081590 ) ) ( not ( = ?auto_1081581 ?auto_1081591 ) ) ( not ( = ?auto_1081581 ?auto_1081595 ) ) ( not ( = ?auto_1081583 ?auto_1081582 ) ) ( not ( = ?auto_1081583 ?auto_1081584 ) ) ( not ( = ?auto_1081583 ?auto_1081585 ) ) ( not ( = ?auto_1081583 ?auto_1081586 ) ) ( not ( = ?auto_1081583 ?auto_1081587 ) ) ( not ( = ?auto_1081583 ?auto_1081588 ) ) ( not ( = ?auto_1081583 ?auto_1081589 ) ) ( not ( = ?auto_1081583 ?auto_1081590 ) ) ( not ( = ?auto_1081583 ?auto_1081591 ) ) ( not ( = ?auto_1081583 ?auto_1081595 ) ) ( not ( = ?auto_1081582 ?auto_1081584 ) ) ( not ( = ?auto_1081582 ?auto_1081585 ) ) ( not ( = ?auto_1081582 ?auto_1081586 ) ) ( not ( = ?auto_1081582 ?auto_1081587 ) ) ( not ( = ?auto_1081582 ?auto_1081588 ) ) ( not ( = ?auto_1081582 ?auto_1081589 ) ) ( not ( = ?auto_1081582 ?auto_1081590 ) ) ( not ( = ?auto_1081582 ?auto_1081591 ) ) ( not ( = ?auto_1081582 ?auto_1081595 ) ) ( not ( = ?auto_1081584 ?auto_1081585 ) ) ( not ( = ?auto_1081584 ?auto_1081586 ) ) ( not ( = ?auto_1081584 ?auto_1081587 ) ) ( not ( = ?auto_1081584 ?auto_1081588 ) ) ( not ( = ?auto_1081584 ?auto_1081589 ) ) ( not ( = ?auto_1081584 ?auto_1081590 ) ) ( not ( = ?auto_1081584 ?auto_1081591 ) ) ( not ( = ?auto_1081584 ?auto_1081595 ) ) ( not ( = ?auto_1081585 ?auto_1081586 ) ) ( not ( = ?auto_1081585 ?auto_1081587 ) ) ( not ( = ?auto_1081585 ?auto_1081588 ) ) ( not ( = ?auto_1081585 ?auto_1081589 ) ) ( not ( = ?auto_1081585 ?auto_1081590 ) ) ( not ( = ?auto_1081585 ?auto_1081591 ) ) ( not ( = ?auto_1081585 ?auto_1081595 ) ) ( not ( = ?auto_1081586 ?auto_1081587 ) ) ( not ( = ?auto_1081586 ?auto_1081588 ) ) ( not ( = ?auto_1081586 ?auto_1081589 ) ) ( not ( = ?auto_1081586 ?auto_1081590 ) ) ( not ( = ?auto_1081586 ?auto_1081591 ) ) ( not ( = ?auto_1081586 ?auto_1081595 ) ) ( not ( = ?auto_1081587 ?auto_1081588 ) ) ( not ( = ?auto_1081587 ?auto_1081589 ) ) ( not ( = ?auto_1081587 ?auto_1081590 ) ) ( not ( = ?auto_1081587 ?auto_1081591 ) ) ( not ( = ?auto_1081587 ?auto_1081595 ) ) ( not ( = ?auto_1081588 ?auto_1081589 ) ) ( not ( = ?auto_1081588 ?auto_1081590 ) ) ( not ( = ?auto_1081588 ?auto_1081591 ) ) ( not ( = ?auto_1081588 ?auto_1081595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081589 ?auto_1081590 ?auto_1081591 )
      ( MAKE-12CRATE-VERIFY ?auto_1081579 ?auto_1081580 ?auto_1081581 ?auto_1081583 ?auto_1081582 ?auto_1081584 ?auto_1081585 ?auto_1081586 ?auto_1081587 ?auto_1081588 ?auto_1081589 ?auto_1081590 ?auto_1081591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1081598 - SURFACE
      ?auto_1081599 - SURFACE
    )
    :vars
    (
      ?auto_1081604 - HOIST
      ?auto_1081602 - PLACE
      ?auto_1081606 - SURFACE
      ?auto_1081605 - PLACE
      ?auto_1081601 - HOIST
      ?auto_1081603 - SURFACE
      ?auto_1081600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081604 ?auto_1081602 ) ( IS-CRATE ?auto_1081599 ) ( not ( = ?auto_1081598 ?auto_1081599 ) ) ( not ( = ?auto_1081606 ?auto_1081598 ) ) ( not ( = ?auto_1081606 ?auto_1081599 ) ) ( not ( = ?auto_1081605 ?auto_1081602 ) ) ( HOIST-AT ?auto_1081601 ?auto_1081605 ) ( not ( = ?auto_1081604 ?auto_1081601 ) ) ( AVAILABLE ?auto_1081601 ) ( SURFACE-AT ?auto_1081599 ?auto_1081605 ) ( ON ?auto_1081599 ?auto_1081603 ) ( CLEAR ?auto_1081599 ) ( not ( = ?auto_1081598 ?auto_1081603 ) ) ( not ( = ?auto_1081599 ?auto_1081603 ) ) ( not ( = ?auto_1081606 ?auto_1081603 ) ) ( SURFACE-AT ?auto_1081606 ?auto_1081602 ) ( CLEAR ?auto_1081606 ) ( IS-CRATE ?auto_1081598 ) ( AVAILABLE ?auto_1081604 ) ( IN ?auto_1081598 ?auto_1081600 ) ( TRUCK-AT ?auto_1081600 ?auto_1081605 ) )
    :subtasks
    ( ( !DRIVE ?auto_1081600 ?auto_1081605 ?auto_1081602 )
      ( MAKE-2CRATE ?auto_1081606 ?auto_1081598 ?auto_1081599 )
      ( MAKE-1CRATE-VERIFY ?auto_1081598 ?auto_1081599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1081607 - SURFACE
      ?auto_1081608 - SURFACE
      ?auto_1081609 - SURFACE
    )
    :vars
    (
      ?auto_1081613 - HOIST
      ?auto_1081610 - PLACE
      ?auto_1081614 - PLACE
      ?auto_1081615 - HOIST
      ?auto_1081612 - SURFACE
      ?auto_1081611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081613 ?auto_1081610 ) ( IS-CRATE ?auto_1081609 ) ( not ( = ?auto_1081608 ?auto_1081609 ) ) ( not ( = ?auto_1081607 ?auto_1081608 ) ) ( not ( = ?auto_1081607 ?auto_1081609 ) ) ( not ( = ?auto_1081614 ?auto_1081610 ) ) ( HOIST-AT ?auto_1081615 ?auto_1081614 ) ( not ( = ?auto_1081613 ?auto_1081615 ) ) ( AVAILABLE ?auto_1081615 ) ( SURFACE-AT ?auto_1081609 ?auto_1081614 ) ( ON ?auto_1081609 ?auto_1081612 ) ( CLEAR ?auto_1081609 ) ( not ( = ?auto_1081608 ?auto_1081612 ) ) ( not ( = ?auto_1081609 ?auto_1081612 ) ) ( not ( = ?auto_1081607 ?auto_1081612 ) ) ( SURFACE-AT ?auto_1081607 ?auto_1081610 ) ( CLEAR ?auto_1081607 ) ( IS-CRATE ?auto_1081608 ) ( AVAILABLE ?auto_1081613 ) ( IN ?auto_1081608 ?auto_1081611 ) ( TRUCK-AT ?auto_1081611 ?auto_1081614 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1081608 ?auto_1081609 )
      ( MAKE-2CRATE-VERIFY ?auto_1081607 ?auto_1081608 ?auto_1081609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1081616 - SURFACE
      ?auto_1081617 - SURFACE
      ?auto_1081618 - SURFACE
      ?auto_1081619 - SURFACE
    )
    :vars
    (
      ?auto_1081623 - HOIST
      ?auto_1081624 - PLACE
      ?auto_1081620 - PLACE
      ?auto_1081625 - HOIST
      ?auto_1081621 - SURFACE
      ?auto_1081622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081623 ?auto_1081624 ) ( IS-CRATE ?auto_1081619 ) ( not ( = ?auto_1081618 ?auto_1081619 ) ) ( not ( = ?auto_1081617 ?auto_1081618 ) ) ( not ( = ?auto_1081617 ?auto_1081619 ) ) ( not ( = ?auto_1081620 ?auto_1081624 ) ) ( HOIST-AT ?auto_1081625 ?auto_1081620 ) ( not ( = ?auto_1081623 ?auto_1081625 ) ) ( AVAILABLE ?auto_1081625 ) ( SURFACE-AT ?auto_1081619 ?auto_1081620 ) ( ON ?auto_1081619 ?auto_1081621 ) ( CLEAR ?auto_1081619 ) ( not ( = ?auto_1081618 ?auto_1081621 ) ) ( not ( = ?auto_1081619 ?auto_1081621 ) ) ( not ( = ?auto_1081617 ?auto_1081621 ) ) ( SURFACE-AT ?auto_1081617 ?auto_1081624 ) ( CLEAR ?auto_1081617 ) ( IS-CRATE ?auto_1081618 ) ( AVAILABLE ?auto_1081623 ) ( IN ?auto_1081618 ?auto_1081622 ) ( TRUCK-AT ?auto_1081622 ?auto_1081620 ) ( ON ?auto_1081617 ?auto_1081616 ) ( not ( = ?auto_1081616 ?auto_1081617 ) ) ( not ( = ?auto_1081616 ?auto_1081618 ) ) ( not ( = ?auto_1081616 ?auto_1081619 ) ) ( not ( = ?auto_1081616 ?auto_1081621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081617 ?auto_1081618 ?auto_1081619 )
      ( MAKE-3CRATE-VERIFY ?auto_1081616 ?auto_1081617 ?auto_1081618 ?auto_1081619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1081626 - SURFACE
      ?auto_1081627 - SURFACE
      ?auto_1081628 - SURFACE
      ?auto_1081630 - SURFACE
      ?auto_1081629 - SURFACE
    )
    :vars
    (
      ?auto_1081634 - HOIST
      ?auto_1081635 - PLACE
      ?auto_1081631 - PLACE
      ?auto_1081636 - HOIST
      ?auto_1081632 - SURFACE
      ?auto_1081633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081634 ?auto_1081635 ) ( IS-CRATE ?auto_1081629 ) ( not ( = ?auto_1081630 ?auto_1081629 ) ) ( not ( = ?auto_1081628 ?auto_1081630 ) ) ( not ( = ?auto_1081628 ?auto_1081629 ) ) ( not ( = ?auto_1081631 ?auto_1081635 ) ) ( HOIST-AT ?auto_1081636 ?auto_1081631 ) ( not ( = ?auto_1081634 ?auto_1081636 ) ) ( AVAILABLE ?auto_1081636 ) ( SURFACE-AT ?auto_1081629 ?auto_1081631 ) ( ON ?auto_1081629 ?auto_1081632 ) ( CLEAR ?auto_1081629 ) ( not ( = ?auto_1081630 ?auto_1081632 ) ) ( not ( = ?auto_1081629 ?auto_1081632 ) ) ( not ( = ?auto_1081628 ?auto_1081632 ) ) ( SURFACE-AT ?auto_1081628 ?auto_1081635 ) ( CLEAR ?auto_1081628 ) ( IS-CRATE ?auto_1081630 ) ( AVAILABLE ?auto_1081634 ) ( IN ?auto_1081630 ?auto_1081633 ) ( TRUCK-AT ?auto_1081633 ?auto_1081631 ) ( ON ?auto_1081627 ?auto_1081626 ) ( ON ?auto_1081628 ?auto_1081627 ) ( not ( = ?auto_1081626 ?auto_1081627 ) ) ( not ( = ?auto_1081626 ?auto_1081628 ) ) ( not ( = ?auto_1081626 ?auto_1081630 ) ) ( not ( = ?auto_1081626 ?auto_1081629 ) ) ( not ( = ?auto_1081626 ?auto_1081632 ) ) ( not ( = ?auto_1081627 ?auto_1081628 ) ) ( not ( = ?auto_1081627 ?auto_1081630 ) ) ( not ( = ?auto_1081627 ?auto_1081629 ) ) ( not ( = ?auto_1081627 ?auto_1081632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081628 ?auto_1081630 ?auto_1081629 )
      ( MAKE-4CRATE-VERIFY ?auto_1081626 ?auto_1081627 ?auto_1081628 ?auto_1081630 ?auto_1081629 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1081637 - SURFACE
      ?auto_1081638 - SURFACE
      ?auto_1081639 - SURFACE
      ?auto_1081641 - SURFACE
      ?auto_1081640 - SURFACE
      ?auto_1081642 - SURFACE
    )
    :vars
    (
      ?auto_1081646 - HOIST
      ?auto_1081647 - PLACE
      ?auto_1081643 - PLACE
      ?auto_1081648 - HOIST
      ?auto_1081644 - SURFACE
      ?auto_1081645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081646 ?auto_1081647 ) ( IS-CRATE ?auto_1081642 ) ( not ( = ?auto_1081640 ?auto_1081642 ) ) ( not ( = ?auto_1081641 ?auto_1081640 ) ) ( not ( = ?auto_1081641 ?auto_1081642 ) ) ( not ( = ?auto_1081643 ?auto_1081647 ) ) ( HOIST-AT ?auto_1081648 ?auto_1081643 ) ( not ( = ?auto_1081646 ?auto_1081648 ) ) ( AVAILABLE ?auto_1081648 ) ( SURFACE-AT ?auto_1081642 ?auto_1081643 ) ( ON ?auto_1081642 ?auto_1081644 ) ( CLEAR ?auto_1081642 ) ( not ( = ?auto_1081640 ?auto_1081644 ) ) ( not ( = ?auto_1081642 ?auto_1081644 ) ) ( not ( = ?auto_1081641 ?auto_1081644 ) ) ( SURFACE-AT ?auto_1081641 ?auto_1081647 ) ( CLEAR ?auto_1081641 ) ( IS-CRATE ?auto_1081640 ) ( AVAILABLE ?auto_1081646 ) ( IN ?auto_1081640 ?auto_1081645 ) ( TRUCK-AT ?auto_1081645 ?auto_1081643 ) ( ON ?auto_1081638 ?auto_1081637 ) ( ON ?auto_1081639 ?auto_1081638 ) ( ON ?auto_1081641 ?auto_1081639 ) ( not ( = ?auto_1081637 ?auto_1081638 ) ) ( not ( = ?auto_1081637 ?auto_1081639 ) ) ( not ( = ?auto_1081637 ?auto_1081641 ) ) ( not ( = ?auto_1081637 ?auto_1081640 ) ) ( not ( = ?auto_1081637 ?auto_1081642 ) ) ( not ( = ?auto_1081637 ?auto_1081644 ) ) ( not ( = ?auto_1081638 ?auto_1081639 ) ) ( not ( = ?auto_1081638 ?auto_1081641 ) ) ( not ( = ?auto_1081638 ?auto_1081640 ) ) ( not ( = ?auto_1081638 ?auto_1081642 ) ) ( not ( = ?auto_1081638 ?auto_1081644 ) ) ( not ( = ?auto_1081639 ?auto_1081641 ) ) ( not ( = ?auto_1081639 ?auto_1081640 ) ) ( not ( = ?auto_1081639 ?auto_1081642 ) ) ( not ( = ?auto_1081639 ?auto_1081644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081641 ?auto_1081640 ?auto_1081642 )
      ( MAKE-5CRATE-VERIFY ?auto_1081637 ?auto_1081638 ?auto_1081639 ?auto_1081641 ?auto_1081640 ?auto_1081642 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1081649 - SURFACE
      ?auto_1081650 - SURFACE
      ?auto_1081651 - SURFACE
      ?auto_1081653 - SURFACE
      ?auto_1081652 - SURFACE
      ?auto_1081654 - SURFACE
      ?auto_1081655 - SURFACE
    )
    :vars
    (
      ?auto_1081659 - HOIST
      ?auto_1081660 - PLACE
      ?auto_1081656 - PLACE
      ?auto_1081661 - HOIST
      ?auto_1081657 - SURFACE
      ?auto_1081658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081659 ?auto_1081660 ) ( IS-CRATE ?auto_1081655 ) ( not ( = ?auto_1081654 ?auto_1081655 ) ) ( not ( = ?auto_1081652 ?auto_1081654 ) ) ( not ( = ?auto_1081652 ?auto_1081655 ) ) ( not ( = ?auto_1081656 ?auto_1081660 ) ) ( HOIST-AT ?auto_1081661 ?auto_1081656 ) ( not ( = ?auto_1081659 ?auto_1081661 ) ) ( AVAILABLE ?auto_1081661 ) ( SURFACE-AT ?auto_1081655 ?auto_1081656 ) ( ON ?auto_1081655 ?auto_1081657 ) ( CLEAR ?auto_1081655 ) ( not ( = ?auto_1081654 ?auto_1081657 ) ) ( not ( = ?auto_1081655 ?auto_1081657 ) ) ( not ( = ?auto_1081652 ?auto_1081657 ) ) ( SURFACE-AT ?auto_1081652 ?auto_1081660 ) ( CLEAR ?auto_1081652 ) ( IS-CRATE ?auto_1081654 ) ( AVAILABLE ?auto_1081659 ) ( IN ?auto_1081654 ?auto_1081658 ) ( TRUCK-AT ?auto_1081658 ?auto_1081656 ) ( ON ?auto_1081650 ?auto_1081649 ) ( ON ?auto_1081651 ?auto_1081650 ) ( ON ?auto_1081653 ?auto_1081651 ) ( ON ?auto_1081652 ?auto_1081653 ) ( not ( = ?auto_1081649 ?auto_1081650 ) ) ( not ( = ?auto_1081649 ?auto_1081651 ) ) ( not ( = ?auto_1081649 ?auto_1081653 ) ) ( not ( = ?auto_1081649 ?auto_1081652 ) ) ( not ( = ?auto_1081649 ?auto_1081654 ) ) ( not ( = ?auto_1081649 ?auto_1081655 ) ) ( not ( = ?auto_1081649 ?auto_1081657 ) ) ( not ( = ?auto_1081650 ?auto_1081651 ) ) ( not ( = ?auto_1081650 ?auto_1081653 ) ) ( not ( = ?auto_1081650 ?auto_1081652 ) ) ( not ( = ?auto_1081650 ?auto_1081654 ) ) ( not ( = ?auto_1081650 ?auto_1081655 ) ) ( not ( = ?auto_1081650 ?auto_1081657 ) ) ( not ( = ?auto_1081651 ?auto_1081653 ) ) ( not ( = ?auto_1081651 ?auto_1081652 ) ) ( not ( = ?auto_1081651 ?auto_1081654 ) ) ( not ( = ?auto_1081651 ?auto_1081655 ) ) ( not ( = ?auto_1081651 ?auto_1081657 ) ) ( not ( = ?auto_1081653 ?auto_1081652 ) ) ( not ( = ?auto_1081653 ?auto_1081654 ) ) ( not ( = ?auto_1081653 ?auto_1081655 ) ) ( not ( = ?auto_1081653 ?auto_1081657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081652 ?auto_1081654 ?auto_1081655 )
      ( MAKE-6CRATE-VERIFY ?auto_1081649 ?auto_1081650 ?auto_1081651 ?auto_1081653 ?auto_1081652 ?auto_1081654 ?auto_1081655 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1081662 - SURFACE
      ?auto_1081663 - SURFACE
      ?auto_1081664 - SURFACE
      ?auto_1081666 - SURFACE
      ?auto_1081665 - SURFACE
      ?auto_1081667 - SURFACE
      ?auto_1081668 - SURFACE
      ?auto_1081669 - SURFACE
    )
    :vars
    (
      ?auto_1081673 - HOIST
      ?auto_1081674 - PLACE
      ?auto_1081670 - PLACE
      ?auto_1081675 - HOIST
      ?auto_1081671 - SURFACE
      ?auto_1081672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081673 ?auto_1081674 ) ( IS-CRATE ?auto_1081669 ) ( not ( = ?auto_1081668 ?auto_1081669 ) ) ( not ( = ?auto_1081667 ?auto_1081668 ) ) ( not ( = ?auto_1081667 ?auto_1081669 ) ) ( not ( = ?auto_1081670 ?auto_1081674 ) ) ( HOIST-AT ?auto_1081675 ?auto_1081670 ) ( not ( = ?auto_1081673 ?auto_1081675 ) ) ( AVAILABLE ?auto_1081675 ) ( SURFACE-AT ?auto_1081669 ?auto_1081670 ) ( ON ?auto_1081669 ?auto_1081671 ) ( CLEAR ?auto_1081669 ) ( not ( = ?auto_1081668 ?auto_1081671 ) ) ( not ( = ?auto_1081669 ?auto_1081671 ) ) ( not ( = ?auto_1081667 ?auto_1081671 ) ) ( SURFACE-AT ?auto_1081667 ?auto_1081674 ) ( CLEAR ?auto_1081667 ) ( IS-CRATE ?auto_1081668 ) ( AVAILABLE ?auto_1081673 ) ( IN ?auto_1081668 ?auto_1081672 ) ( TRUCK-AT ?auto_1081672 ?auto_1081670 ) ( ON ?auto_1081663 ?auto_1081662 ) ( ON ?auto_1081664 ?auto_1081663 ) ( ON ?auto_1081666 ?auto_1081664 ) ( ON ?auto_1081665 ?auto_1081666 ) ( ON ?auto_1081667 ?auto_1081665 ) ( not ( = ?auto_1081662 ?auto_1081663 ) ) ( not ( = ?auto_1081662 ?auto_1081664 ) ) ( not ( = ?auto_1081662 ?auto_1081666 ) ) ( not ( = ?auto_1081662 ?auto_1081665 ) ) ( not ( = ?auto_1081662 ?auto_1081667 ) ) ( not ( = ?auto_1081662 ?auto_1081668 ) ) ( not ( = ?auto_1081662 ?auto_1081669 ) ) ( not ( = ?auto_1081662 ?auto_1081671 ) ) ( not ( = ?auto_1081663 ?auto_1081664 ) ) ( not ( = ?auto_1081663 ?auto_1081666 ) ) ( not ( = ?auto_1081663 ?auto_1081665 ) ) ( not ( = ?auto_1081663 ?auto_1081667 ) ) ( not ( = ?auto_1081663 ?auto_1081668 ) ) ( not ( = ?auto_1081663 ?auto_1081669 ) ) ( not ( = ?auto_1081663 ?auto_1081671 ) ) ( not ( = ?auto_1081664 ?auto_1081666 ) ) ( not ( = ?auto_1081664 ?auto_1081665 ) ) ( not ( = ?auto_1081664 ?auto_1081667 ) ) ( not ( = ?auto_1081664 ?auto_1081668 ) ) ( not ( = ?auto_1081664 ?auto_1081669 ) ) ( not ( = ?auto_1081664 ?auto_1081671 ) ) ( not ( = ?auto_1081666 ?auto_1081665 ) ) ( not ( = ?auto_1081666 ?auto_1081667 ) ) ( not ( = ?auto_1081666 ?auto_1081668 ) ) ( not ( = ?auto_1081666 ?auto_1081669 ) ) ( not ( = ?auto_1081666 ?auto_1081671 ) ) ( not ( = ?auto_1081665 ?auto_1081667 ) ) ( not ( = ?auto_1081665 ?auto_1081668 ) ) ( not ( = ?auto_1081665 ?auto_1081669 ) ) ( not ( = ?auto_1081665 ?auto_1081671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081667 ?auto_1081668 ?auto_1081669 )
      ( MAKE-7CRATE-VERIFY ?auto_1081662 ?auto_1081663 ?auto_1081664 ?auto_1081666 ?auto_1081665 ?auto_1081667 ?auto_1081668 ?auto_1081669 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1081676 - SURFACE
      ?auto_1081677 - SURFACE
      ?auto_1081678 - SURFACE
      ?auto_1081680 - SURFACE
      ?auto_1081679 - SURFACE
      ?auto_1081681 - SURFACE
      ?auto_1081682 - SURFACE
      ?auto_1081683 - SURFACE
      ?auto_1081684 - SURFACE
    )
    :vars
    (
      ?auto_1081688 - HOIST
      ?auto_1081689 - PLACE
      ?auto_1081685 - PLACE
      ?auto_1081690 - HOIST
      ?auto_1081686 - SURFACE
      ?auto_1081687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081688 ?auto_1081689 ) ( IS-CRATE ?auto_1081684 ) ( not ( = ?auto_1081683 ?auto_1081684 ) ) ( not ( = ?auto_1081682 ?auto_1081683 ) ) ( not ( = ?auto_1081682 ?auto_1081684 ) ) ( not ( = ?auto_1081685 ?auto_1081689 ) ) ( HOIST-AT ?auto_1081690 ?auto_1081685 ) ( not ( = ?auto_1081688 ?auto_1081690 ) ) ( AVAILABLE ?auto_1081690 ) ( SURFACE-AT ?auto_1081684 ?auto_1081685 ) ( ON ?auto_1081684 ?auto_1081686 ) ( CLEAR ?auto_1081684 ) ( not ( = ?auto_1081683 ?auto_1081686 ) ) ( not ( = ?auto_1081684 ?auto_1081686 ) ) ( not ( = ?auto_1081682 ?auto_1081686 ) ) ( SURFACE-AT ?auto_1081682 ?auto_1081689 ) ( CLEAR ?auto_1081682 ) ( IS-CRATE ?auto_1081683 ) ( AVAILABLE ?auto_1081688 ) ( IN ?auto_1081683 ?auto_1081687 ) ( TRUCK-AT ?auto_1081687 ?auto_1081685 ) ( ON ?auto_1081677 ?auto_1081676 ) ( ON ?auto_1081678 ?auto_1081677 ) ( ON ?auto_1081680 ?auto_1081678 ) ( ON ?auto_1081679 ?auto_1081680 ) ( ON ?auto_1081681 ?auto_1081679 ) ( ON ?auto_1081682 ?auto_1081681 ) ( not ( = ?auto_1081676 ?auto_1081677 ) ) ( not ( = ?auto_1081676 ?auto_1081678 ) ) ( not ( = ?auto_1081676 ?auto_1081680 ) ) ( not ( = ?auto_1081676 ?auto_1081679 ) ) ( not ( = ?auto_1081676 ?auto_1081681 ) ) ( not ( = ?auto_1081676 ?auto_1081682 ) ) ( not ( = ?auto_1081676 ?auto_1081683 ) ) ( not ( = ?auto_1081676 ?auto_1081684 ) ) ( not ( = ?auto_1081676 ?auto_1081686 ) ) ( not ( = ?auto_1081677 ?auto_1081678 ) ) ( not ( = ?auto_1081677 ?auto_1081680 ) ) ( not ( = ?auto_1081677 ?auto_1081679 ) ) ( not ( = ?auto_1081677 ?auto_1081681 ) ) ( not ( = ?auto_1081677 ?auto_1081682 ) ) ( not ( = ?auto_1081677 ?auto_1081683 ) ) ( not ( = ?auto_1081677 ?auto_1081684 ) ) ( not ( = ?auto_1081677 ?auto_1081686 ) ) ( not ( = ?auto_1081678 ?auto_1081680 ) ) ( not ( = ?auto_1081678 ?auto_1081679 ) ) ( not ( = ?auto_1081678 ?auto_1081681 ) ) ( not ( = ?auto_1081678 ?auto_1081682 ) ) ( not ( = ?auto_1081678 ?auto_1081683 ) ) ( not ( = ?auto_1081678 ?auto_1081684 ) ) ( not ( = ?auto_1081678 ?auto_1081686 ) ) ( not ( = ?auto_1081680 ?auto_1081679 ) ) ( not ( = ?auto_1081680 ?auto_1081681 ) ) ( not ( = ?auto_1081680 ?auto_1081682 ) ) ( not ( = ?auto_1081680 ?auto_1081683 ) ) ( not ( = ?auto_1081680 ?auto_1081684 ) ) ( not ( = ?auto_1081680 ?auto_1081686 ) ) ( not ( = ?auto_1081679 ?auto_1081681 ) ) ( not ( = ?auto_1081679 ?auto_1081682 ) ) ( not ( = ?auto_1081679 ?auto_1081683 ) ) ( not ( = ?auto_1081679 ?auto_1081684 ) ) ( not ( = ?auto_1081679 ?auto_1081686 ) ) ( not ( = ?auto_1081681 ?auto_1081682 ) ) ( not ( = ?auto_1081681 ?auto_1081683 ) ) ( not ( = ?auto_1081681 ?auto_1081684 ) ) ( not ( = ?auto_1081681 ?auto_1081686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081682 ?auto_1081683 ?auto_1081684 )
      ( MAKE-8CRATE-VERIFY ?auto_1081676 ?auto_1081677 ?auto_1081678 ?auto_1081680 ?auto_1081679 ?auto_1081681 ?auto_1081682 ?auto_1081683 ?auto_1081684 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1081691 - SURFACE
      ?auto_1081692 - SURFACE
      ?auto_1081693 - SURFACE
      ?auto_1081695 - SURFACE
      ?auto_1081694 - SURFACE
      ?auto_1081696 - SURFACE
      ?auto_1081697 - SURFACE
      ?auto_1081698 - SURFACE
      ?auto_1081699 - SURFACE
      ?auto_1081700 - SURFACE
    )
    :vars
    (
      ?auto_1081704 - HOIST
      ?auto_1081705 - PLACE
      ?auto_1081701 - PLACE
      ?auto_1081706 - HOIST
      ?auto_1081702 - SURFACE
      ?auto_1081703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081704 ?auto_1081705 ) ( IS-CRATE ?auto_1081700 ) ( not ( = ?auto_1081699 ?auto_1081700 ) ) ( not ( = ?auto_1081698 ?auto_1081699 ) ) ( not ( = ?auto_1081698 ?auto_1081700 ) ) ( not ( = ?auto_1081701 ?auto_1081705 ) ) ( HOIST-AT ?auto_1081706 ?auto_1081701 ) ( not ( = ?auto_1081704 ?auto_1081706 ) ) ( AVAILABLE ?auto_1081706 ) ( SURFACE-AT ?auto_1081700 ?auto_1081701 ) ( ON ?auto_1081700 ?auto_1081702 ) ( CLEAR ?auto_1081700 ) ( not ( = ?auto_1081699 ?auto_1081702 ) ) ( not ( = ?auto_1081700 ?auto_1081702 ) ) ( not ( = ?auto_1081698 ?auto_1081702 ) ) ( SURFACE-AT ?auto_1081698 ?auto_1081705 ) ( CLEAR ?auto_1081698 ) ( IS-CRATE ?auto_1081699 ) ( AVAILABLE ?auto_1081704 ) ( IN ?auto_1081699 ?auto_1081703 ) ( TRUCK-AT ?auto_1081703 ?auto_1081701 ) ( ON ?auto_1081692 ?auto_1081691 ) ( ON ?auto_1081693 ?auto_1081692 ) ( ON ?auto_1081695 ?auto_1081693 ) ( ON ?auto_1081694 ?auto_1081695 ) ( ON ?auto_1081696 ?auto_1081694 ) ( ON ?auto_1081697 ?auto_1081696 ) ( ON ?auto_1081698 ?auto_1081697 ) ( not ( = ?auto_1081691 ?auto_1081692 ) ) ( not ( = ?auto_1081691 ?auto_1081693 ) ) ( not ( = ?auto_1081691 ?auto_1081695 ) ) ( not ( = ?auto_1081691 ?auto_1081694 ) ) ( not ( = ?auto_1081691 ?auto_1081696 ) ) ( not ( = ?auto_1081691 ?auto_1081697 ) ) ( not ( = ?auto_1081691 ?auto_1081698 ) ) ( not ( = ?auto_1081691 ?auto_1081699 ) ) ( not ( = ?auto_1081691 ?auto_1081700 ) ) ( not ( = ?auto_1081691 ?auto_1081702 ) ) ( not ( = ?auto_1081692 ?auto_1081693 ) ) ( not ( = ?auto_1081692 ?auto_1081695 ) ) ( not ( = ?auto_1081692 ?auto_1081694 ) ) ( not ( = ?auto_1081692 ?auto_1081696 ) ) ( not ( = ?auto_1081692 ?auto_1081697 ) ) ( not ( = ?auto_1081692 ?auto_1081698 ) ) ( not ( = ?auto_1081692 ?auto_1081699 ) ) ( not ( = ?auto_1081692 ?auto_1081700 ) ) ( not ( = ?auto_1081692 ?auto_1081702 ) ) ( not ( = ?auto_1081693 ?auto_1081695 ) ) ( not ( = ?auto_1081693 ?auto_1081694 ) ) ( not ( = ?auto_1081693 ?auto_1081696 ) ) ( not ( = ?auto_1081693 ?auto_1081697 ) ) ( not ( = ?auto_1081693 ?auto_1081698 ) ) ( not ( = ?auto_1081693 ?auto_1081699 ) ) ( not ( = ?auto_1081693 ?auto_1081700 ) ) ( not ( = ?auto_1081693 ?auto_1081702 ) ) ( not ( = ?auto_1081695 ?auto_1081694 ) ) ( not ( = ?auto_1081695 ?auto_1081696 ) ) ( not ( = ?auto_1081695 ?auto_1081697 ) ) ( not ( = ?auto_1081695 ?auto_1081698 ) ) ( not ( = ?auto_1081695 ?auto_1081699 ) ) ( not ( = ?auto_1081695 ?auto_1081700 ) ) ( not ( = ?auto_1081695 ?auto_1081702 ) ) ( not ( = ?auto_1081694 ?auto_1081696 ) ) ( not ( = ?auto_1081694 ?auto_1081697 ) ) ( not ( = ?auto_1081694 ?auto_1081698 ) ) ( not ( = ?auto_1081694 ?auto_1081699 ) ) ( not ( = ?auto_1081694 ?auto_1081700 ) ) ( not ( = ?auto_1081694 ?auto_1081702 ) ) ( not ( = ?auto_1081696 ?auto_1081697 ) ) ( not ( = ?auto_1081696 ?auto_1081698 ) ) ( not ( = ?auto_1081696 ?auto_1081699 ) ) ( not ( = ?auto_1081696 ?auto_1081700 ) ) ( not ( = ?auto_1081696 ?auto_1081702 ) ) ( not ( = ?auto_1081697 ?auto_1081698 ) ) ( not ( = ?auto_1081697 ?auto_1081699 ) ) ( not ( = ?auto_1081697 ?auto_1081700 ) ) ( not ( = ?auto_1081697 ?auto_1081702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081698 ?auto_1081699 ?auto_1081700 )
      ( MAKE-9CRATE-VERIFY ?auto_1081691 ?auto_1081692 ?auto_1081693 ?auto_1081695 ?auto_1081694 ?auto_1081696 ?auto_1081697 ?auto_1081698 ?auto_1081699 ?auto_1081700 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1081707 - SURFACE
      ?auto_1081708 - SURFACE
      ?auto_1081709 - SURFACE
      ?auto_1081711 - SURFACE
      ?auto_1081710 - SURFACE
      ?auto_1081712 - SURFACE
      ?auto_1081713 - SURFACE
      ?auto_1081714 - SURFACE
      ?auto_1081715 - SURFACE
      ?auto_1081716 - SURFACE
      ?auto_1081717 - SURFACE
    )
    :vars
    (
      ?auto_1081721 - HOIST
      ?auto_1081722 - PLACE
      ?auto_1081718 - PLACE
      ?auto_1081723 - HOIST
      ?auto_1081719 - SURFACE
      ?auto_1081720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081721 ?auto_1081722 ) ( IS-CRATE ?auto_1081717 ) ( not ( = ?auto_1081716 ?auto_1081717 ) ) ( not ( = ?auto_1081715 ?auto_1081716 ) ) ( not ( = ?auto_1081715 ?auto_1081717 ) ) ( not ( = ?auto_1081718 ?auto_1081722 ) ) ( HOIST-AT ?auto_1081723 ?auto_1081718 ) ( not ( = ?auto_1081721 ?auto_1081723 ) ) ( AVAILABLE ?auto_1081723 ) ( SURFACE-AT ?auto_1081717 ?auto_1081718 ) ( ON ?auto_1081717 ?auto_1081719 ) ( CLEAR ?auto_1081717 ) ( not ( = ?auto_1081716 ?auto_1081719 ) ) ( not ( = ?auto_1081717 ?auto_1081719 ) ) ( not ( = ?auto_1081715 ?auto_1081719 ) ) ( SURFACE-AT ?auto_1081715 ?auto_1081722 ) ( CLEAR ?auto_1081715 ) ( IS-CRATE ?auto_1081716 ) ( AVAILABLE ?auto_1081721 ) ( IN ?auto_1081716 ?auto_1081720 ) ( TRUCK-AT ?auto_1081720 ?auto_1081718 ) ( ON ?auto_1081708 ?auto_1081707 ) ( ON ?auto_1081709 ?auto_1081708 ) ( ON ?auto_1081711 ?auto_1081709 ) ( ON ?auto_1081710 ?auto_1081711 ) ( ON ?auto_1081712 ?auto_1081710 ) ( ON ?auto_1081713 ?auto_1081712 ) ( ON ?auto_1081714 ?auto_1081713 ) ( ON ?auto_1081715 ?auto_1081714 ) ( not ( = ?auto_1081707 ?auto_1081708 ) ) ( not ( = ?auto_1081707 ?auto_1081709 ) ) ( not ( = ?auto_1081707 ?auto_1081711 ) ) ( not ( = ?auto_1081707 ?auto_1081710 ) ) ( not ( = ?auto_1081707 ?auto_1081712 ) ) ( not ( = ?auto_1081707 ?auto_1081713 ) ) ( not ( = ?auto_1081707 ?auto_1081714 ) ) ( not ( = ?auto_1081707 ?auto_1081715 ) ) ( not ( = ?auto_1081707 ?auto_1081716 ) ) ( not ( = ?auto_1081707 ?auto_1081717 ) ) ( not ( = ?auto_1081707 ?auto_1081719 ) ) ( not ( = ?auto_1081708 ?auto_1081709 ) ) ( not ( = ?auto_1081708 ?auto_1081711 ) ) ( not ( = ?auto_1081708 ?auto_1081710 ) ) ( not ( = ?auto_1081708 ?auto_1081712 ) ) ( not ( = ?auto_1081708 ?auto_1081713 ) ) ( not ( = ?auto_1081708 ?auto_1081714 ) ) ( not ( = ?auto_1081708 ?auto_1081715 ) ) ( not ( = ?auto_1081708 ?auto_1081716 ) ) ( not ( = ?auto_1081708 ?auto_1081717 ) ) ( not ( = ?auto_1081708 ?auto_1081719 ) ) ( not ( = ?auto_1081709 ?auto_1081711 ) ) ( not ( = ?auto_1081709 ?auto_1081710 ) ) ( not ( = ?auto_1081709 ?auto_1081712 ) ) ( not ( = ?auto_1081709 ?auto_1081713 ) ) ( not ( = ?auto_1081709 ?auto_1081714 ) ) ( not ( = ?auto_1081709 ?auto_1081715 ) ) ( not ( = ?auto_1081709 ?auto_1081716 ) ) ( not ( = ?auto_1081709 ?auto_1081717 ) ) ( not ( = ?auto_1081709 ?auto_1081719 ) ) ( not ( = ?auto_1081711 ?auto_1081710 ) ) ( not ( = ?auto_1081711 ?auto_1081712 ) ) ( not ( = ?auto_1081711 ?auto_1081713 ) ) ( not ( = ?auto_1081711 ?auto_1081714 ) ) ( not ( = ?auto_1081711 ?auto_1081715 ) ) ( not ( = ?auto_1081711 ?auto_1081716 ) ) ( not ( = ?auto_1081711 ?auto_1081717 ) ) ( not ( = ?auto_1081711 ?auto_1081719 ) ) ( not ( = ?auto_1081710 ?auto_1081712 ) ) ( not ( = ?auto_1081710 ?auto_1081713 ) ) ( not ( = ?auto_1081710 ?auto_1081714 ) ) ( not ( = ?auto_1081710 ?auto_1081715 ) ) ( not ( = ?auto_1081710 ?auto_1081716 ) ) ( not ( = ?auto_1081710 ?auto_1081717 ) ) ( not ( = ?auto_1081710 ?auto_1081719 ) ) ( not ( = ?auto_1081712 ?auto_1081713 ) ) ( not ( = ?auto_1081712 ?auto_1081714 ) ) ( not ( = ?auto_1081712 ?auto_1081715 ) ) ( not ( = ?auto_1081712 ?auto_1081716 ) ) ( not ( = ?auto_1081712 ?auto_1081717 ) ) ( not ( = ?auto_1081712 ?auto_1081719 ) ) ( not ( = ?auto_1081713 ?auto_1081714 ) ) ( not ( = ?auto_1081713 ?auto_1081715 ) ) ( not ( = ?auto_1081713 ?auto_1081716 ) ) ( not ( = ?auto_1081713 ?auto_1081717 ) ) ( not ( = ?auto_1081713 ?auto_1081719 ) ) ( not ( = ?auto_1081714 ?auto_1081715 ) ) ( not ( = ?auto_1081714 ?auto_1081716 ) ) ( not ( = ?auto_1081714 ?auto_1081717 ) ) ( not ( = ?auto_1081714 ?auto_1081719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081715 ?auto_1081716 ?auto_1081717 )
      ( MAKE-10CRATE-VERIFY ?auto_1081707 ?auto_1081708 ?auto_1081709 ?auto_1081711 ?auto_1081710 ?auto_1081712 ?auto_1081713 ?auto_1081714 ?auto_1081715 ?auto_1081716 ?auto_1081717 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1081724 - SURFACE
      ?auto_1081725 - SURFACE
      ?auto_1081726 - SURFACE
      ?auto_1081728 - SURFACE
      ?auto_1081727 - SURFACE
      ?auto_1081729 - SURFACE
      ?auto_1081730 - SURFACE
      ?auto_1081731 - SURFACE
      ?auto_1081732 - SURFACE
      ?auto_1081733 - SURFACE
      ?auto_1081734 - SURFACE
      ?auto_1081735 - SURFACE
    )
    :vars
    (
      ?auto_1081739 - HOIST
      ?auto_1081740 - PLACE
      ?auto_1081736 - PLACE
      ?auto_1081741 - HOIST
      ?auto_1081737 - SURFACE
      ?auto_1081738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081739 ?auto_1081740 ) ( IS-CRATE ?auto_1081735 ) ( not ( = ?auto_1081734 ?auto_1081735 ) ) ( not ( = ?auto_1081733 ?auto_1081734 ) ) ( not ( = ?auto_1081733 ?auto_1081735 ) ) ( not ( = ?auto_1081736 ?auto_1081740 ) ) ( HOIST-AT ?auto_1081741 ?auto_1081736 ) ( not ( = ?auto_1081739 ?auto_1081741 ) ) ( AVAILABLE ?auto_1081741 ) ( SURFACE-AT ?auto_1081735 ?auto_1081736 ) ( ON ?auto_1081735 ?auto_1081737 ) ( CLEAR ?auto_1081735 ) ( not ( = ?auto_1081734 ?auto_1081737 ) ) ( not ( = ?auto_1081735 ?auto_1081737 ) ) ( not ( = ?auto_1081733 ?auto_1081737 ) ) ( SURFACE-AT ?auto_1081733 ?auto_1081740 ) ( CLEAR ?auto_1081733 ) ( IS-CRATE ?auto_1081734 ) ( AVAILABLE ?auto_1081739 ) ( IN ?auto_1081734 ?auto_1081738 ) ( TRUCK-AT ?auto_1081738 ?auto_1081736 ) ( ON ?auto_1081725 ?auto_1081724 ) ( ON ?auto_1081726 ?auto_1081725 ) ( ON ?auto_1081728 ?auto_1081726 ) ( ON ?auto_1081727 ?auto_1081728 ) ( ON ?auto_1081729 ?auto_1081727 ) ( ON ?auto_1081730 ?auto_1081729 ) ( ON ?auto_1081731 ?auto_1081730 ) ( ON ?auto_1081732 ?auto_1081731 ) ( ON ?auto_1081733 ?auto_1081732 ) ( not ( = ?auto_1081724 ?auto_1081725 ) ) ( not ( = ?auto_1081724 ?auto_1081726 ) ) ( not ( = ?auto_1081724 ?auto_1081728 ) ) ( not ( = ?auto_1081724 ?auto_1081727 ) ) ( not ( = ?auto_1081724 ?auto_1081729 ) ) ( not ( = ?auto_1081724 ?auto_1081730 ) ) ( not ( = ?auto_1081724 ?auto_1081731 ) ) ( not ( = ?auto_1081724 ?auto_1081732 ) ) ( not ( = ?auto_1081724 ?auto_1081733 ) ) ( not ( = ?auto_1081724 ?auto_1081734 ) ) ( not ( = ?auto_1081724 ?auto_1081735 ) ) ( not ( = ?auto_1081724 ?auto_1081737 ) ) ( not ( = ?auto_1081725 ?auto_1081726 ) ) ( not ( = ?auto_1081725 ?auto_1081728 ) ) ( not ( = ?auto_1081725 ?auto_1081727 ) ) ( not ( = ?auto_1081725 ?auto_1081729 ) ) ( not ( = ?auto_1081725 ?auto_1081730 ) ) ( not ( = ?auto_1081725 ?auto_1081731 ) ) ( not ( = ?auto_1081725 ?auto_1081732 ) ) ( not ( = ?auto_1081725 ?auto_1081733 ) ) ( not ( = ?auto_1081725 ?auto_1081734 ) ) ( not ( = ?auto_1081725 ?auto_1081735 ) ) ( not ( = ?auto_1081725 ?auto_1081737 ) ) ( not ( = ?auto_1081726 ?auto_1081728 ) ) ( not ( = ?auto_1081726 ?auto_1081727 ) ) ( not ( = ?auto_1081726 ?auto_1081729 ) ) ( not ( = ?auto_1081726 ?auto_1081730 ) ) ( not ( = ?auto_1081726 ?auto_1081731 ) ) ( not ( = ?auto_1081726 ?auto_1081732 ) ) ( not ( = ?auto_1081726 ?auto_1081733 ) ) ( not ( = ?auto_1081726 ?auto_1081734 ) ) ( not ( = ?auto_1081726 ?auto_1081735 ) ) ( not ( = ?auto_1081726 ?auto_1081737 ) ) ( not ( = ?auto_1081728 ?auto_1081727 ) ) ( not ( = ?auto_1081728 ?auto_1081729 ) ) ( not ( = ?auto_1081728 ?auto_1081730 ) ) ( not ( = ?auto_1081728 ?auto_1081731 ) ) ( not ( = ?auto_1081728 ?auto_1081732 ) ) ( not ( = ?auto_1081728 ?auto_1081733 ) ) ( not ( = ?auto_1081728 ?auto_1081734 ) ) ( not ( = ?auto_1081728 ?auto_1081735 ) ) ( not ( = ?auto_1081728 ?auto_1081737 ) ) ( not ( = ?auto_1081727 ?auto_1081729 ) ) ( not ( = ?auto_1081727 ?auto_1081730 ) ) ( not ( = ?auto_1081727 ?auto_1081731 ) ) ( not ( = ?auto_1081727 ?auto_1081732 ) ) ( not ( = ?auto_1081727 ?auto_1081733 ) ) ( not ( = ?auto_1081727 ?auto_1081734 ) ) ( not ( = ?auto_1081727 ?auto_1081735 ) ) ( not ( = ?auto_1081727 ?auto_1081737 ) ) ( not ( = ?auto_1081729 ?auto_1081730 ) ) ( not ( = ?auto_1081729 ?auto_1081731 ) ) ( not ( = ?auto_1081729 ?auto_1081732 ) ) ( not ( = ?auto_1081729 ?auto_1081733 ) ) ( not ( = ?auto_1081729 ?auto_1081734 ) ) ( not ( = ?auto_1081729 ?auto_1081735 ) ) ( not ( = ?auto_1081729 ?auto_1081737 ) ) ( not ( = ?auto_1081730 ?auto_1081731 ) ) ( not ( = ?auto_1081730 ?auto_1081732 ) ) ( not ( = ?auto_1081730 ?auto_1081733 ) ) ( not ( = ?auto_1081730 ?auto_1081734 ) ) ( not ( = ?auto_1081730 ?auto_1081735 ) ) ( not ( = ?auto_1081730 ?auto_1081737 ) ) ( not ( = ?auto_1081731 ?auto_1081732 ) ) ( not ( = ?auto_1081731 ?auto_1081733 ) ) ( not ( = ?auto_1081731 ?auto_1081734 ) ) ( not ( = ?auto_1081731 ?auto_1081735 ) ) ( not ( = ?auto_1081731 ?auto_1081737 ) ) ( not ( = ?auto_1081732 ?auto_1081733 ) ) ( not ( = ?auto_1081732 ?auto_1081734 ) ) ( not ( = ?auto_1081732 ?auto_1081735 ) ) ( not ( = ?auto_1081732 ?auto_1081737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081733 ?auto_1081734 ?auto_1081735 )
      ( MAKE-11CRATE-VERIFY ?auto_1081724 ?auto_1081725 ?auto_1081726 ?auto_1081728 ?auto_1081727 ?auto_1081729 ?auto_1081730 ?auto_1081731 ?auto_1081732 ?auto_1081733 ?auto_1081734 ?auto_1081735 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081742 - SURFACE
      ?auto_1081743 - SURFACE
      ?auto_1081744 - SURFACE
      ?auto_1081746 - SURFACE
      ?auto_1081745 - SURFACE
      ?auto_1081747 - SURFACE
      ?auto_1081748 - SURFACE
      ?auto_1081749 - SURFACE
      ?auto_1081750 - SURFACE
      ?auto_1081751 - SURFACE
      ?auto_1081752 - SURFACE
      ?auto_1081753 - SURFACE
      ?auto_1081754 - SURFACE
    )
    :vars
    (
      ?auto_1081758 - HOIST
      ?auto_1081759 - PLACE
      ?auto_1081755 - PLACE
      ?auto_1081760 - HOIST
      ?auto_1081756 - SURFACE
      ?auto_1081757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081758 ?auto_1081759 ) ( IS-CRATE ?auto_1081754 ) ( not ( = ?auto_1081753 ?auto_1081754 ) ) ( not ( = ?auto_1081752 ?auto_1081753 ) ) ( not ( = ?auto_1081752 ?auto_1081754 ) ) ( not ( = ?auto_1081755 ?auto_1081759 ) ) ( HOIST-AT ?auto_1081760 ?auto_1081755 ) ( not ( = ?auto_1081758 ?auto_1081760 ) ) ( AVAILABLE ?auto_1081760 ) ( SURFACE-AT ?auto_1081754 ?auto_1081755 ) ( ON ?auto_1081754 ?auto_1081756 ) ( CLEAR ?auto_1081754 ) ( not ( = ?auto_1081753 ?auto_1081756 ) ) ( not ( = ?auto_1081754 ?auto_1081756 ) ) ( not ( = ?auto_1081752 ?auto_1081756 ) ) ( SURFACE-AT ?auto_1081752 ?auto_1081759 ) ( CLEAR ?auto_1081752 ) ( IS-CRATE ?auto_1081753 ) ( AVAILABLE ?auto_1081758 ) ( IN ?auto_1081753 ?auto_1081757 ) ( TRUCK-AT ?auto_1081757 ?auto_1081755 ) ( ON ?auto_1081743 ?auto_1081742 ) ( ON ?auto_1081744 ?auto_1081743 ) ( ON ?auto_1081746 ?auto_1081744 ) ( ON ?auto_1081745 ?auto_1081746 ) ( ON ?auto_1081747 ?auto_1081745 ) ( ON ?auto_1081748 ?auto_1081747 ) ( ON ?auto_1081749 ?auto_1081748 ) ( ON ?auto_1081750 ?auto_1081749 ) ( ON ?auto_1081751 ?auto_1081750 ) ( ON ?auto_1081752 ?auto_1081751 ) ( not ( = ?auto_1081742 ?auto_1081743 ) ) ( not ( = ?auto_1081742 ?auto_1081744 ) ) ( not ( = ?auto_1081742 ?auto_1081746 ) ) ( not ( = ?auto_1081742 ?auto_1081745 ) ) ( not ( = ?auto_1081742 ?auto_1081747 ) ) ( not ( = ?auto_1081742 ?auto_1081748 ) ) ( not ( = ?auto_1081742 ?auto_1081749 ) ) ( not ( = ?auto_1081742 ?auto_1081750 ) ) ( not ( = ?auto_1081742 ?auto_1081751 ) ) ( not ( = ?auto_1081742 ?auto_1081752 ) ) ( not ( = ?auto_1081742 ?auto_1081753 ) ) ( not ( = ?auto_1081742 ?auto_1081754 ) ) ( not ( = ?auto_1081742 ?auto_1081756 ) ) ( not ( = ?auto_1081743 ?auto_1081744 ) ) ( not ( = ?auto_1081743 ?auto_1081746 ) ) ( not ( = ?auto_1081743 ?auto_1081745 ) ) ( not ( = ?auto_1081743 ?auto_1081747 ) ) ( not ( = ?auto_1081743 ?auto_1081748 ) ) ( not ( = ?auto_1081743 ?auto_1081749 ) ) ( not ( = ?auto_1081743 ?auto_1081750 ) ) ( not ( = ?auto_1081743 ?auto_1081751 ) ) ( not ( = ?auto_1081743 ?auto_1081752 ) ) ( not ( = ?auto_1081743 ?auto_1081753 ) ) ( not ( = ?auto_1081743 ?auto_1081754 ) ) ( not ( = ?auto_1081743 ?auto_1081756 ) ) ( not ( = ?auto_1081744 ?auto_1081746 ) ) ( not ( = ?auto_1081744 ?auto_1081745 ) ) ( not ( = ?auto_1081744 ?auto_1081747 ) ) ( not ( = ?auto_1081744 ?auto_1081748 ) ) ( not ( = ?auto_1081744 ?auto_1081749 ) ) ( not ( = ?auto_1081744 ?auto_1081750 ) ) ( not ( = ?auto_1081744 ?auto_1081751 ) ) ( not ( = ?auto_1081744 ?auto_1081752 ) ) ( not ( = ?auto_1081744 ?auto_1081753 ) ) ( not ( = ?auto_1081744 ?auto_1081754 ) ) ( not ( = ?auto_1081744 ?auto_1081756 ) ) ( not ( = ?auto_1081746 ?auto_1081745 ) ) ( not ( = ?auto_1081746 ?auto_1081747 ) ) ( not ( = ?auto_1081746 ?auto_1081748 ) ) ( not ( = ?auto_1081746 ?auto_1081749 ) ) ( not ( = ?auto_1081746 ?auto_1081750 ) ) ( not ( = ?auto_1081746 ?auto_1081751 ) ) ( not ( = ?auto_1081746 ?auto_1081752 ) ) ( not ( = ?auto_1081746 ?auto_1081753 ) ) ( not ( = ?auto_1081746 ?auto_1081754 ) ) ( not ( = ?auto_1081746 ?auto_1081756 ) ) ( not ( = ?auto_1081745 ?auto_1081747 ) ) ( not ( = ?auto_1081745 ?auto_1081748 ) ) ( not ( = ?auto_1081745 ?auto_1081749 ) ) ( not ( = ?auto_1081745 ?auto_1081750 ) ) ( not ( = ?auto_1081745 ?auto_1081751 ) ) ( not ( = ?auto_1081745 ?auto_1081752 ) ) ( not ( = ?auto_1081745 ?auto_1081753 ) ) ( not ( = ?auto_1081745 ?auto_1081754 ) ) ( not ( = ?auto_1081745 ?auto_1081756 ) ) ( not ( = ?auto_1081747 ?auto_1081748 ) ) ( not ( = ?auto_1081747 ?auto_1081749 ) ) ( not ( = ?auto_1081747 ?auto_1081750 ) ) ( not ( = ?auto_1081747 ?auto_1081751 ) ) ( not ( = ?auto_1081747 ?auto_1081752 ) ) ( not ( = ?auto_1081747 ?auto_1081753 ) ) ( not ( = ?auto_1081747 ?auto_1081754 ) ) ( not ( = ?auto_1081747 ?auto_1081756 ) ) ( not ( = ?auto_1081748 ?auto_1081749 ) ) ( not ( = ?auto_1081748 ?auto_1081750 ) ) ( not ( = ?auto_1081748 ?auto_1081751 ) ) ( not ( = ?auto_1081748 ?auto_1081752 ) ) ( not ( = ?auto_1081748 ?auto_1081753 ) ) ( not ( = ?auto_1081748 ?auto_1081754 ) ) ( not ( = ?auto_1081748 ?auto_1081756 ) ) ( not ( = ?auto_1081749 ?auto_1081750 ) ) ( not ( = ?auto_1081749 ?auto_1081751 ) ) ( not ( = ?auto_1081749 ?auto_1081752 ) ) ( not ( = ?auto_1081749 ?auto_1081753 ) ) ( not ( = ?auto_1081749 ?auto_1081754 ) ) ( not ( = ?auto_1081749 ?auto_1081756 ) ) ( not ( = ?auto_1081750 ?auto_1081751 ) ) ( not ( = ?auto_1081750 ?auto_1081752 ) ) ( not ( = ?auto_1081750 ?auto_1081753 ) ) ( not ( = ?auto_1081750 ?auto_1081754 ) ) ( not ( = ?auto_1081750 ?auto_1081756 ) ) ( not ( = ?auto_1081751 ?auto_1081752 ) ) ( not ( = ?auto_1081751 ?auto_1081753 ) ) ( not ( = ?auto_1081751 ?auto_1081754 ) ) ( not ( = ?auto_1081751 ?auto_1081756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081752 ?auto_1081753 ?auto_1081754 )
      ( MAKE-12CRATE-VERIFY ?auto_1081742 ?auto_1081743 ?auto_1081744 ?auto_1081746 ?auto_1081745 ?auto_1081747 ?auto_1081748 ?auto_1081749 ?auto_1081750 ?auto_1081751 ?auto_1081752 ?auto_1081753 ?auto_1081754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1081761 - SURFACE
      ?auto_1081762 - SURFACE
    )
    :vars
    (
      ?auto_1081766 - HOIST
      ?auto_1081767 - PLACE
      ?auto_1081768 - SURFACE
      ?auto_1081763 - PLACE
      ?auto_1081769 - HOIST
      ?auto_1081764 - SURFACE
      ?auto_1081765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081766 ?auto_1081767 ) ( IS-CRATE ?auto_1081762 ) ( not ( = ?auto_1081761 ?auto_1081762 ) ) ( not ( = ?auto_1081768 ?auto_1081761 ) ) ( not ( = ?auto_1081768 ?auto_1081762 ) ) ( not ( = ?auto_1081763 ?auto_1081767 ) ) ( HOIST-AT ?auto_1081769 ?auto_1081763 ) ( not ( = ?auto_1081766 ?auto_1081769 ) ) ( SURFACE-AT ?auto_1081762 ?auto_1081763 ) ( ON ?auto_1081762 ?auto_1081764 ) ( CLEAR ?auto_1081762 ) ( not ( = ?auto_1081761 ?auto_1081764 ) ) ( not ( = ?auto_1081762 ?auto_1081764 ) ) ( not ( = ?auto_1081768 ?auto_1081764 ) ) ( SURFACE-AT ?auto_1081768 ?auto_1081767 ) ( CLEAR ?auto_1081768 ) ( IS-CRATE ?auto_1081761 ) ( AVAILABLE ?auto_1081766 ) ( TRUCK-AT ?auto_1081765 ?auto_1081763 ) ( LIFTING ?auto_1081769 ?auto_1081761 ) )
    :subtasks
    ( ( !LOAD ?auto_1081769 ?auto_1081761 ?auto_1081765 ?auto_1081763 )
      ( MAKE-2CRATE ?auto_1081768 ?auto_1081761 ?auto_1081762 )
      ( MAKE-1CRATE-VERIFY ?auto_1081761 ?auto_1081762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1081770 - SURFACE
      ?auto_1081771 - SURFACE
      ?auto_1081772 - SURFACE
    )
    :vars
    (
      ?auto_1081778 - HOIST
      ?auto_1081775 - PLACE
      ?auto_1081773 - PLACE
      ?auto_1081777 - HOIST
      ?auto_1081774 - SURFACE
      ?auto_1081776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081778 ?auto_1081775 ) ( IS-CRATE ?auto_1081772 ) ( not ( = ?auto_1081771 ?auto_1081772 ) ) ( not ( = ?auto_1081770 ?auto_1081771 ) ) ( not ( = ?auto_1081770 ?auto_1081772 ) ) ( not ( = ?auto_1081773 ?auto_1081775 ) ) ( HOIST-AT ?auto_1081777 ?auto_1081773 ) ( not ( = ?auto_1081778 ?auto_1081777 ) ) ( SURFACE-AT ?auto_1081772 ?auto_1081773 ) ( ON ?auto_1081772 ?auto_1081774 ) ( CLEAR ?auto_1081772 ) ( not ( = ?auto_1081771 ?auto_1081774 ) ) ( not ( = ?auto_1081772 ?auto_1081774 ) ) ( not ( = ?auto_1081770 ?auto_1081774 ) ) ( SURFACE-AT ?auto_1081770 ?auto_1081775 ) ( CLEAR ?auto_1081770 ) ( IS-CRATE ?auto_1081771 ) ( AVAILABLE ?auto_1081778 ) ( TRUCK-AT ?auto_1081776 ?auto_1081773 ) ( LIFTING ?auto_1081777 ?auto_1081771 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1081771 ?auto_1081772 )
      ( MAKE-2CRATE-VERIFY ?auto_1081770 ?auto_1081771 ?auto_1081772 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1081779 - SURFACE
      ?auto_1081780 - SURFACE
      ?auto_1081781 - SURFACE
      ?auto_1081782 - SURFACE
    )
    :vars
    (
      ?auto_1081786 - HOIST
      ?auto_1081783 - PLACE
      ?auto_1081785 - PLACE
      ?auto_1081788 - HOIST
      ?auto_1081784 - SURFACE
      ?auto_1081787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081786 ?auto_1081783 ) ( IS-CRATE ?auto_1081782 ) ( not ( = ?auto_1081781 ?auto_1081782 ) ) ( not ( = ?auto_1081780 ?auto_1081781 ) ) ( not ( = ?auto_1081780 ?auto_1081782 ) ) ( not ( = ?auto_1081785 ?auto_1081783 ) ) ( HOIST-AT ?auto_1081788 ?auto_1081785 ) ( not ( = ?auto_1081786 ?auto_1081788 ) ) ( SURFACE-AT ?auto_1081782 ?auto_1081785 ) ( ON ?auto_1081782 ?auto_1081784 ) ( CLEAR ?auto_1081782 ) ( not ( = ?auto_1081781 ?auto_1081784 ) ) ( not ( = ?auto_1081782 ?auto_1081784 ) ) ( not ( = ?auto_1081780 ?auto_1081784 ) ) ( SURFACE-AT ?auto_1081780 ?auto_1081783 ) ( CLEAR ?auto_1081780 ) ( IS-CRATE ?auto_1081781 ) ( AVAILABLE ?auto_1081786 ) ( TRUCK-AT ?auto_1081787 ?auto_1081785 ) ( LIFTING ?auto_1081788 ?auto_1081781 ) ( ON ?auto_1081780 ?auto_1081779 ) ( not ( = ?auto_1081779 ?auto_1081780 ) ) ( not ( = ?auto_1081779 ?auto_1081781 ) ) ( not ( = ?auto_1081779 ?auto_1081782 ) ) ( not ( = ?auto_1081779 ?auto_1081784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081780 ?auto_1081781 ?auto_1081782 )
      ( MAKE-3CRATE-VERIFY ?auto_1081779 ?auto_1081780 ?auto_1081781 ?auto_1081782 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1081789 - SURFACE
      ?auto_1081790 - SURFACE
      ?auto_1081791 - SURFACE
      ?auto_1081793 - SURFACE
      ?auto_1081792 - SURFACE
    )
    :vars
    (
      ?auto_1081797 - HOIST
      ?auto_1081794 - PLACE
      ?auto_1081796 - PLACE
      ?auto_1081799 - HOIST
      ?auto_1081795 - SURFACE
      ?auto_1081798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081797 ?auto_1081794 ) ( IS-CRATE ?auto_1081792 ) ( not ( = ?auto_1081793 ?auto_1081792 ) ) ( not ( = ?auto_1081791 ?auto_1081793 ) ) ( not ( = ?auto_1081791 ?auto_1081792 ) ) ( not ( = ?auto_1081796 ?auto_1081794 ) ) ( HOIST-AT ?auto_1081799 ?auto_1081796 ) ( not ( = ?auto_1081797 ?auto_1081799 ) ) ( SURFACE-AT ?auto_1081792 ?auto_1081796 ) ( ON ?auto_1081792 ?auto_1081795 ) ( CLEAR ?auto_1081792 ) ( not ( = ?auto_1081793 ?auto_1081795 ) ) ( not ( = ?auto_1081792 ?auto_1081795 ) ) ( not ( = ?auto_1081791 ?auto_1081795 ) ) ( SURFACE-AT ?auto_1081791 ?auto_1081794 ) ( CLEAR ?auto_1081791 ) ( IS-CRATE ?auto_1081793 ) ( AVAILABLE ?auto_1081797 ) ( TRUCK-AT ?auto_1081798 ?auto_1081796 ) ( LIFTING ?auto_1081799 ?auto_1081793 ) ( ON ?auto_1081790 ?auto_1081789 ) ( ON ?auto_1081791 ?auto_1081790 ) ( not ( = ?auto_1081789 ?auto_1081790 ) ) ( not ( = ?auto_1081789 ?auto_1081791 ) ) ( not ( = ?auto_1081789 ?auto_1081793 ) ) ( not ( = ?auto_1081789 ?auto_1081792 ) ) ( not ( = ?auto_1081789 ?auto_1081795 ) ) ( not ( = ?auto_1081790 ?auto_1081791 ) ) ( not ( = ?auto_1081790 ?auto_1081793 ) ) ( not ( = ?auto_1081790 ?auto_1081792 ) ) ( not ( = ?auto_1081790 ?auto_1081795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081791 ?auto_1081793 ?auto_1081792 )
      ( MAKE-4CRATE-VERIFY ?auto_1081789 ?auto_1081790 ?auto_1081791 ?auto_1081793 ?auto_1081792 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1081800 - SURFACE
      ?auto_1081801 - SURFACE
      ?auto_1081802 - SURFACE
      ?auto_1081804 - SURFACE
      ?auto_1081803 - SURFACE
      ?auto_1081805 - SURFACE
    )
    :vars
    (
      ?auto_1081809 - HOIST
      ?auto_1081806 - PLACE
      ?auto_1081808 - PLACE
      ?auto_1081811 - HOIST
      ?auto_1081807 - SURFACE
      ?auto_1081810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081809 ?auto_1081806 ) ( IS-CRATE ?auto_1081805 ) ( not ( = ?auto_1081803 ?auto_1081805 ) ) ( not ( = ?auto_1081804 ?auto_1081803 ) ) ( not ( = ?auto_1081804 ?auto_1081805 ) ) ( not ( = ?auto_1081808 ?auto_1081806 ) ) ( HOIST-AT ?auto_1081811 ?auto_1081808 ) ( not ( = ?auto_1081809 ?auto_1081811 ) ) ( SURFACE-AT ?auto_1081805 ?auto_1081808 ) ( ON ?auto_1081805 ?auto_1081807 ) ( CLEAR ?auto_1081805 ) ( not ( = ?auto_1081803 ?auto_1081807 ) ) ( not ( = ?auto_1081805 ?auto_1081807 ) ) ( not ( = ?auto_1081804 ?auto_1081807 ) ) ( SURFACE-AT ?auto_1081804 ?auto_1081806 ) ( CLEAR ?auto_1081804 ) ( IS-CRATE ?auto_1081803 ) ( AVAILABLE ?auto_1081809 ) ( TRUCK-AT ?auto_1081810 ?auto_1081808 ) ( LIFTING ?auto_1081811 ?auto_1081803 ) ( ON ?auto_1081801 ?auto_1081800 ) ( ON ?auto_1081802 ?auto_1081801 ) ( ON ?auto_1081804 ?auto_1081802 ) ( not ( = ?auto_1081800 ?auto_1081801 ) ) ( not ( = ?auto_1081800 ?auto_1081802 ) ) ( not ( = ?auto_1081800 ?auto_1081804 ) ) ( not ( = ?auto_1081800 ?auto_1081803 ) ) ( not ( = ?auto_1081800 ?auto_1081805 ) ) ( not ( = ?auto_1081800 ?auto_1081807 ) ) ( not ( = ?auto_1081801 ?auto_1081802 ) ) ( not ( = ?auto_1081801 ?auto_1081804 ) ) ( not ( = ?auto_1081801 ?auto_1081803 ) ) ( not ( = ?auto_1081801 ?auto_1081805 ) ) ( not ( = ?auto_1081801 ?auto_1081807 ) ) ( not ( = ?auto_1081802 ?auto_1081804 ) ) ( not ( = ?auto_1081802 ?auto_1081803 ) ) ( not ( = ?auto_1081802 ?auto_1081805 ) ) ( not ( = ?auto_1081802 ?auto_1081807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081804 ?auto_1081803 ?auto_1081805 )
      ( MAKE-5CRATE-VERIFY ?auto_1081800 ?auto_1081801 ?auto_1081802 ?auto_1081804 ?auto_1081803 ?auto_1081805 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1081812 - SURFACE
      ?auto_1081813 - SURFACE
      ?auto_1081814 - SURFACE
      ?auto_1081816 - SURFACE
      ?auto_1081815 - SURFACE
      ?auto_1081817 - SURFACE
      ?auto_1081818 - SURFACE
    )
    :vars
    (
      ?auto_1081822 - HOIST
      ?auto_1081819 - PLACE
      ?auto_1081821 - PLACE
      ?auto_1081824 - HOIST
      ?auto_1081820 - SURFACE
      ?auto_1081823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081822 ?auto_1081819 ) ( IS-CRATE ?auto_1081818 ) ( not ( = ?auto_1081817 ?auto_1081818 ) ) ( not ( = ?auto_1081815 ?auto_1081817 ) ) ( not ( = ?auto_1081815 ?auto_1081818 ) ) ( not ( = ?auto_1081821 ?auto_1081819 ) ) ( HOIST-AT ?auto_1081824 ?auto_1081821 ) ( not ( = ?auto_1081822 ?auto_1081824 ) ) ( SURFACE-AT ?auto_1081818 ?auto_1081821 ) ( ON ?auto_1081818 ?auto_1081820 ) ( CLEAR ?auto_1081818 ) ( not ( = ?auto_1081817 ?auto_1081820 ) ) ( not ( = ?auto_1081818 ?auto_1081820 ) ) ( not ( = ?auto_1081815 ?auto_1081820 ) ) ( SURFACE-AT ?auto_1081815 ?auto_1081819 ) ( CLEAR ?auto_1081815 ) ( IS-CRATE ?auto_1081817 ) ( AVAILABLE ?auto_1081822 ) ( TRUCK-AT ?auto_1081823 ?auto_1081821 ) ( LIFTING ?auto_1081824 ?auto_1081817 ) ( ON ?auto_1081813 ?auto_1081812 ) ( ON ?auto_1081814 ?auto_1081813 ) ( ON ?auto_1081816 ?auto_1081814 ) ( ON ?auto_1081815 ?auto_1081816 ) ( not ( = ?auto_1081812 ?auto_1081813 ) ) ( not ( = ?auto_1081812 ?auto_1081814 ) ) ( not ( = ?auto_1081812 ?auto_1081816 ) ) ( not ( = ?auto_1081812 ?auto_1081815 ) ) ( not ( = ?auto_1081812 ?auto_1081817 ) ) ( not ( = ?auto_1081812 ?auto_1081818 ) ) ( not ( = ?auto_1081812 ?auto_1081820 ) ) ( not ( = ?auto_1081813 ?auto_1081814 ) ) ( not ( = ?auto_1081813 ?auto_1081816 ) ) ( not ( = ?auto_1081813 ?auto_1081815 ) ) ( not ( = ?auto_1081813 ?auto_1081817 ) ) ( not ( = ?auto_1081813 ?auto_1081818 ) ) ( not ( = ?auto_1081813 ?auto_1081820 ) ) ( not ( = ?auto_1081814 ?auto_1081816 ) ) ( not ( = ?auto_1081814 ?auto_1081815 ) ) ( not ( = ?auto_1081814 ?auto_1081817 ) ) ( not ( = ?auto_1081814 ?auto_1081818 ) ) ( not ( = ?auto_1081814 ?auto_1081820 ) ) ( not ( = ?auto_1081816 ?auto_1081815 ) ) ( not ( = ?auto_1081816 ?auto_1081817 ) ) ( not ( = ?auto_1081816 ?auto_1081818 ) ) ( not ( = ?auto_1081816 ?auto_1081820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081815 ?auto_1081817 ?auto_1081818 )
      ( MAKE-6CRATE-VERIFY ?auto_1081812 ?auto_1081813 ?auto_1081814 ?auto_1081816 ?auto_1081815 ?auto_1081817 ?auto_1081818 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1081825 - SURFACE
      ?auto_1081826 - SURFACE
      ?auto_1081827 - SURFACE
      ?auto_1081829 - SURFACE
      ?auto_1081828 - SURFACE
      ?auto_1081830 - SURFACE
      ?auto_1081831 - SURFACE
      ?auto_1081832 - SURFACE
    )
    :vars
    (
      ?auto_1081836 - HOIST
      ?auto_1081833 - PLACE
      ?auto_1081835 - PLACE
      ?auto_1081838 - HOIST
      ?auto_1081834 - SURFACE
      ?auto_1081837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081836 ?auto_1081833 ) ( IS-CRATE ?auto_1081832 ) ( not ( = ?auto_1081831 ?auto_1081832 ) ) ( not ( = ?auto_1081830 ?auto_1081831 ) ) ( not ( = ?auto_1081830 ?auto_1081832 ) ) ( not ( = ?auto_1081835 ?auto_1081833 ) ) ( HOIST-AT ?auto_1081838 ?auto_1081835 ) ( not ( = ?auto_1081836 ?auto_1081838 ) ) ( SURFACE-AT ?auto_1081832 ?auto_1081835 ) ( ON ?auto_1081832 ?auto_1081834 ) ( CLEAR ?auto_1081832 ) ( not ( = ?auto_1081831 ?auto_1081834 ) ) ( not ( = ?auto_1081832 ?auto_1081834 ) ) ( not ( = ?auto_1081830 ?auto_1081834 ) ) ( SURFACE-AT ?auto_1081830 ?auto_1081833 ) ( CLEAR ?auto_1081830 ) ( IS-CRATE ?auto_1081831 ) ( AVAILABLE ?auto_1081836 ) ( TRUCK-AT ?auto_1081837 ?auto_1081835 ) ( LIFTING ?auto_1081838 ?auto_1081831 ) ( ON ?auto_1081826 ?auto_1081825 ) ( ON ?auto_1081827 ?auto_1081826 ) ( ON ?auto_1081829 ?auto_1081827 ) ( ON ?auto_1081828 ?auto_1081829 ) ( ON ?auto_1081830 ?auto_1081828 ) ( not ( = ?auto_1081825 ?auto_1081826 ) ) ( not ( = ?auto_1081825 ?auto_1081827 ) ) ( not ( = ?auto_1081825 ?auto_1081829 ) ) ( not ( = ?auto_1081825 ?auto_1081828 ) ) ( not ( = ?auto_1081825 ?auto_1081830 ) ) ( not ( = ?auto_1081825 ?auto_1081831 ) ) ( not ( = ?auto_1081825 ?auto_1081832 ) ) ( not ( = ?auto_1081825 ?auto_1081834 ) ) ( not ( = ?auto_1081826 ?auto_1081827 ) ) ( not ( = ?auto_1081826 ?auto_1081829 ) ) ( not ( = ?auto_1081826 ?auto_1081828 ) ) ( not ( = ?auto_1081826 ?auto_1081830 ) ) ( not ( = ?auto_1081826 ?auto_1081831 ) ) ( not ( = ?auto_1081826 ?auto_1081832 ) ) ( not ( = ?auto_1081826 ?auto_1081834 ) ) ( not ( = ?auto_1081827 ?auto_1081829 ) ) ( not ( = ?auto_1081827 ?auto_1081828 ) ) ( not ( = ?auto_1081827 ?auto_1081830 ) ) ( not ( = ?auto_1081827 ?auto_1081831 ) ) ( not ( = ?auto_1081827 ?auto_1081832 ) ) ( not ( = ?auto_1081827 ?auto_1081834 ) ) ( not ( = ?auto_1081829 ?auto_1081828 ) ) ( not ( = ?auto_1081829 ?auto_1081830 ) ) ( not ( = ?auto_1081829 ?auto_1081831 ) ) ( not ( = ?auto_1081829 ?auto_1081832 ) ) ( not ( = ?auto_1081829 ?auto_1081834 ) ) ( not ( = ?auto_1081828 ?auto_1081830 ) ) ( not ( = ?auto_1081828 ?auto_1081831 ) ) ( not ( = ?auto_1081828 ?auto_1081832 ) ) ( not ( = ?auto_1081828 ?auto_1081834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081830 ?auto_1081831 ?auto_1081832 )
      ( MAKE-7CRATE-VERIFY ?auto_1081825 ?auto_1081826 ?auto_1081827 ?auto_1081829 ?auto_1081828 ?auto_1081830 ?auto_1081831 ?auto_1081832 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1081839 - SURFACE
      ?auto_1081840 - SURFACE
      ?auto_1081841 - SURFACE
      ?auto_1081843 - SURFACE
      ?auto_1081842 - SURFACE
      ?auto_1081844 - SURFACE
      ?auto_1081845 - SURFACE
      ?auto_1081846 - SURFACE
      ?auto_1081847 - SURFACE
    )
    :vars
    (
      ?auto_1081851 - HOIST
      ?auto_1081848 - PLACE
      ?auto_1081850 - PLACE
      ?auto_1081853 - HOIST
      ?auto_1081849 - SURFACE
      ?auto_1081852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081851 ?auto_1081848 ) ( IS-CRATE ?auto_1081847 ) ( not ( = ?auto_1081846 ?auto_1081847 ) ) ( not ( = ?auto_1081845 ?auto_1081846 ) ) ( not ( = ?auto_1081845 ?auto_1081847 ) ) ( not ( = ?auto_1081850 ?auto_1081848 ) ) ( HOIST-AT ?auto_1081853 ?auto_1081850 ) ( not ( = ?auto_1081851 ?auto_1081853 ) ) ( SURFACE-AT ?auto_1081847 ?auto_1081850 ) ( ON ?auto_1081847 ?auto_1081849 ) ( CLEAR ?auto_1081847 ) ( not ( = ?auto_1081846 ?auto_1081849 ) ) ( not ( = ?auto_1081847 ?auto_1081849 ) ) ( not ( = ?auto_1081845 ?auto_1081849 ) ) ( SURFACE-AT ?auto_1081845 ?auto_1081848 ) ( CLEAR ?auto_1081845 ) ( IS-CRATE ?auto_1081846 ) ( AVAILABLE ?auto_1081851 ) ( TRUCK-AT ?auto_1081852 ?auto_1081850 ) ( LIFTING ?auto_1081853 ?auto_1081846 ) ( ON ?auto_1081840 ?auto_1081839 ) ( ON ?auto_1081841 ?auto_1081840 ) ( ON ?auto_1081843 ?auto_1081841 ) ( ON ?auto_1081842 ?auto_1081843 ) ( ON ?auto_1081844 ?auto_1081842 ) ( ON ?auto_1081845 ?auto_1081844 ) ( not ( = ?auto_1081839 ?auto_1081840 ) ) ( not ( = ?auto_1081839 ?auto_1081841 ) ) ( not ( = ?auto_1081839 ?auto_1081843 ) ) ( not ( = ?auto_1081839 ?auto_1081842 ) ) ( not ( = ?auto_1081839 ?auto_1081844 ) ) ( not ( = ?auto_1081839 ?auto_1081845 ) ) ( not ( = ?auto_1081839 ?auto_1081846 ) ) ( not ( = ?auto_1081839 ?auto_1081847 ) ) ( not ( = ?auto_1081839 ?auto_1081849 ) ) ( not ( = ?auto_1081840 ?auto_1081841 ) ) ( not ( = ?auto_1081840 ?auto_1081843 ) ) ( not ( = ?auto_1081840 ?auto_1081842 ) ) ( not ( = ?auto_1081840 ?auto_1081844 ) ) ( not ( = ?auto_1081840 ?auto_1081845 ) ) ( not ( = ?auto_1081840 ?auto_1081846 ) ) ( not ( = ?auto_1081840 ?auto_1081847 ) ) ( not ( = ?auto_1081840 ?auto_1081849 ) ) ( not ( = ?auto_1081841 ?auto_1081843 ) ) ( not ( = ?auto_1081841 ?auto_1081842 ) ) ( not ( = ?auto_1081841 ?auto_1081844 ) ) ( not ( = ?auto_1081841 ?auto_1081845 ) ) ( not ( = ?auto_1081841 ?auto_1081846 ) ) ( not ( = ?auto_1081841 ?auto_1081847 ) ) ( not ( = ?auto_1081841 ?auto_1081849 ) ) ( not ( = ?auto_1081843 ?auto_1081842 ) ) ( not ( = ?auto_1081843 ?auto_1081844 ) ) ( not ( = ?auto_1081843 ?auto_1081845 ) ) ( not ( = ?auto_1081843 ?auto_1081846 ) ) ( not ( = ?auto_1081843 ?auto_1081847 ) ) ( not ( = ?auto_1081843 ?auto_1081849 ) ) ( not ( = ?auto_1081842 ?auto_1081844 ) ) ( not ( = ?auto_1081842 ?auto_1081845 ) ) ( not ( = ?auto_1081842 ?auto_1081846 ) ) ( not ( = ?auto_1081842 ?auto_1081847 ) ) ( not ( = ?auto_1081842 ?auto_1081849 ) ) ( not ( = ?auto_1081844 ?auto_1081845 ) ) ( not ( = ?auto_1081844 ?auto_1081846 ) ) ( not ( = ?auto_1081844 ?auto_1081847 ) ) ( not ( = ?auto_1081844 ?auto_1081849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081845 ?auto_1081846 ?auto_1081847 )
      ( MAKE-8CRATE-VERIFY ?auto_1081839 ?auto_1081840 ?auto_1081841 ?auto_1081843 ?auto_1081842 ?auto_1081844 ?auto_1081845 ?auto_1081846 ?auto_1081847 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1081854 - SURFACE
      ?auto_1081855 - SURFACE
      ?auto_1081856 - SURFACE
      ?auto_1081858 - SURFACE
      ?auto_1081857 - SURFACE
      ?auto_1081859 - SURFACE
      ?auto_1081860 - SURFACE
      ?auto_1081861 - SURFACE
      ?auto_1081862 - SURFACE
      ?auto_1081863 - SURFACE
    )
    :vars
    (
      ?auto_1081867 - HOIST
      ?auto_1081864 - PLACE
      ?auto_1081866 - PLACE
      ?auto_1081869 - HOIST
      ?auto_1081865 - SURFACE
      ?auto_1081868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081867 ?auto_1081864 ) ( IS-CRATE ?auto_1081863 ) ( not ( = ?auto_1081862 ?auto_1081863 ) ) ( not ( = ?auto_1081861 ?auto_1081862 ) ) ( not ( = ?auto_1081861 ?auto_1081863 ) ) ( not ( = ?auto_1081866 ?auto_1081864 ) ) ( HOIST-AT ?auto_1081869 ?auto_1081866 ) ( not ( = ?auto_1081867 ?auto_1081869 ) ) ( SURFACE-AT ?auto_1081863 ?auto_1081866 ) ( ON ?auto_1081863 ?auto_1081865 ) ( CLEAR ?auto_1081863 ) ( not ( = ?auto_1081862 ?auto_1081865 ) ) ( not ( = ?auto_1081863 ?auto_1081865 ) ) ( not ( = ?auto_1081861 ?auto_1081865 ) ) ( SURFACE-AT ?auto_1081861 ?auto_1081864 ) ( CLEAR ?auto_1081861 ) ( IS-CRATE ?auto_1081862 ) ( AVAILABLE ?auto_1081867 ) ( TRUCK-AT ?auto_1081868 ?auto_1081866 ) ( LIFTING ?auto_1081869 ?auto_1081862 ) ( ON ?auto_1081855 ?auto_1081854 ) ( ON ?auto_1081856 ?auto_1081855 ) ( ON ?auto_1081858 ?auto_1081856 ) ( ON ?auto_1081857 ?auto_1081858 ) ( ON ?auto_1081859 ?auto_1081857 ) ( ON ?auto_1081860 ?auto_1081859 ) ( ON ?auto_1081861 ?auto_1081860 ) ( not ( = ?auto_1081854 ?auto_1081855 ) ) ( not ( = ?auto_1081854 ?auto_1081856 ) ) ( not ( = ?auto_1081854 ?auto_1081858 ) ) ( not ( = ?auto_1081854 ?auto_1081857 ) ) ( not ( = ?auto_1081854 ?auto_1081859 ) ) ( not ( = ?auto_1081854 ?auto_1081860 ) ) ( not ( = ?auto_1081854 ?auto_1081861 ) ) ( not ( = ?auto_1081854 ?auto_1081862 ) ) ( not ( = ?auto_1081854 ?auto_1081863 ) ) ( not ( = ?auto_1081854 ?auto_1081865 ) ) ( not ( = ?auto_1081855 ?auto_1081856 ) ) ( not ( = ?auto_1081855 ?auto_1081858 ) ) ( not ( = ?auto_1081855 ?auto_1081857 ) ) ( not ( = ?auto_1081855 ?auto_1081859 ) ) ( not ( = ?auto_1081855 ?auto_1081860 ) ) ( not ( = ?auto_1081855 ?auto_1081861 ) ) ( not ( = ?auto_1081855 ?auto_1081862 ) ) ( not ( = ?auto_1081855 ?auto_1081863 ) ) ( not ( = ?auto_1081855 ?auto_1081865 ) ) ( not ( = ?auto_1081856 ?auto_1081858 ) ) ( not ( = ?auto_1081856 ?auto_1081857 ) ) ( not ( = ?auto_1081856 ?auto_1081859 ) ) ( not ( = ?auto_1081856 ?auto_1081860 ) ) ( not ( = ?auto_1081856 ?auto_1081861 ) ) ( not ( = ?auto_1081856 ?auto_1081862 ) ) ( not ( = ?auto_1081856 ?auto_1081863 ) ) ( not ( = ?auto_1081856 ?auto_1081865 ) ) ( not ( = ?auto_1081858 ?auto_1081857 ) ) ( not ( = ?auto_1081858 ?auto_1081859 ) ) ( not ( = ?auto_1081858 ?auto_1081860 ) ) ( not ( = ?auto_1081858 ?auto_1081861 ) ) ( not ( = ?auto_1081858 ?auto_1081862 ) ) ( not ( = ?auto_1081858 ?auto_1081863 ) ) ( not ( = ?auto_1081858 ?auto_1081865 ) ) ( not ( = ?auto_1081857 ?auto_1081859 ) ) ( not ( = ?auto_1081857 ?auto_1081860 ) ) ( not ( = ?auto_1081857 ?auto_1081861 ) ) ( not ( = ?auto_1081857 ?auto_1081862 ) ) ( not ( = ?auto_1081857 ?auto_1081863 ) ) ( not ( = ?auto_1081857 ?auto_1081865 ) ) ( not ( = ?auto_1081859 ?auto_1081860 ) ) ( not ( = ?auto_1081859 ?auto_1081861 ) ) ( not ( = ?auto_1081859 ?auto_1081862 ) ) ( not ( = ?auto_1081859 ?auto_1081863 ) ) ( not ( = ?auto_1081859 ?auto_1081865 ) ) ( not ( = ?auto_1081860 ?auto_1081861 ) ) ( not ( = ?auto_1081860 ?auto_1081862 ) ) ( not ( = ?auto_1081860 ?auto_1081863 ) ) ( not ( = ?auto_1081860 ?auto_1081865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081861 ?auto_1081862 ?auto_1081863 )
      ( MAKE-9CRATE-VERIFY ?auto_1081854 ?auto_1081855 ?auto_1081856 ?auto_1081858 ?auto_1081857 ?auto_1081859 ?auto_1081860 ?auto_1081861 ?auto_1081862 ?auto_1081863 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1081870 - SURFACE
      ?auto_1081871 - SURFACE
      ?auto_1081872 - SURFACE
      ?auto_1081874 - SURFACE
      ?auto_1081873 - SURFACE
      ?auto_1081875 - SURFACE
      ?auto_1081876 - SURFACE
      ?auto_1081877 - SURFACE
      ?auto_1081878 - SURFACE
      ?auto_1081879 - SURFACE
      ?auto_1081880 - SURFACE
    )
    :vars
    (
      ?auto_1081884 - HOIST
      ?auto_1081881 - PLACE
      ?auto_1081883 - PLACE
      ?auto_1081886 - HOIST
      ?auto_1081882 - SURFACE
      ?auto_1081885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081884 ?auto_1081881 ) ( IS-CRATE ?auto_1081880 ) ( not ( = ?auto_1081879 ?auto_1081880 ) ) ( not ( = ?auto_1081878 ?auto_1081879 ) ) ( not ( = ?auto_1081878 ?auto_1081880 ) ) ( not ( = ?auto_1081883 ?auto_1081881 ) ) ( HOIST-AT ?auto_1081886 ?auto_1081883 ) ( not ( = ?auto_1081884 ?auto_1081886 ) ) ( SURFACE-AT ?auto_1081880 ?auto_1081883 ) ( ON ?auto_1081880 ?auto_1081882 ) ( CLEAR ?auto_1081880 ) ( not ( = ?auto_1081879 ?auto_1081882 ) ) ( not ( = ?auto_1081880 ?auto_1081882 ) ) ( not ( = ?auto_1081878 ?auto_1081882 ) ) ( SURFACE-AT ?auto_1081878 ?auto_1081881 ) ( CLEAR ?auto_1081878 ) ( IS-CRATE ?auto_1081879 ) ( AVAILABLE ?auto_1081884 ) ( TRUCK-AT ?auto_1081885 ?auto_1081883 ) ( LIFTING ?auto_1081886 ?auto_1081879 ) ( ON ?auto_1081871 ?auto_1081870 ) ( ON ?auto_1081872 ?auto_1081871 ) ( ON ?auto_1081874 ?auto_1081872 ) ( ON ?auto_1081873 ?auto_1081874 ) ( ON ?auto_1081875 ?auto_1081873 ) ( ON ?auto_1081876 ?auto_1081875 ) ( ON ?auto_1081877 ?auto_1081876 ) ( ON ?auto_1081878 ?auto_1081877 ) ( not ( = ?auto_1081870 ?auto_1081871 ) ) ( not ( = ?auto_1081870 ?auto_1081872 ) ) ( not ( = ?auto_1081870 ?auto_1081874 ) ) ( not ( = ?auto_1081870 ?auto_1081873 ) ) ( not ( = ?auto_1081870 ?auto_1081875 ) ) ( not ( = ?auto_1081870 ?auto_1081876 ) ) ( not ( = ?auto_1081870 ?auto_1081877 ) ) ( not ( = ?auto_1081870 ?auto_1081878 ) ) ( not ( = ?auto_1081870 ?auto_1081879 ) ) ( not ( = ?auto_1081870 ?auto_1081880 ) ) ( not ( = ?auto_1081870 ?auto_1081882 ) ) ( not ( = ?auto_1081871 ?auto_1081872 ) ) ( not ( = ?auto_1081871 ?auto_1081874 ) ) ( not ( = ?auto_1081871 ?auto_1081873 ) ) ( not ( = ?auto_1081871 ?auto_1081875 ) ) ( not ( = ?auto_1081871 ?auto_1081876 ) ) ( not ( = ?auto_1081871 ?auto_1081877 ) ) ( not ( = ?auto_1081871 ?auto_1081878 ) ) ( not ( = ?auto_1081871 ?auto_1081879 ) ) ( not ( = ?auto_1081871 ?auto_1081880 ) ) ( not ( = ?auto_1081871 ?auto_1081882 ) ) ( not ( = ?auto_1081872 ?auto_1081874 ) ) ( not ( = ?auto_1081872 ?auto_1081873 ) ) ( not ( = ?auto_1081872 ?auto_1081875 ) ) ( not ( = ?auto_1081872 ?auto_1081876 ) ) ( not ( = ?auto_1081872 ?auto_1081877 ) ) ( not ( = ?auto_1081872 ?auto_1081878 ) ) ( not ( = ?auto_1081872 ?auto_1081879 ) ) ( not ( = ?auto_1081872 ?auto_1081880 ) ) ( not ( = ?auto_1081872 ?auto_1081882 ) ) ( not ( = ?auto_1081874 ?auto_1081873 ) ) ( not ( = ?auto_1081874 ?auto_1081875 ) ) ( not ( = ?auto_1081874 ?auto_1081876 ) ) ( not ( = ?auto_1081874 ?auto_1081877 ) ) ( not ( = ?auto_1081874 ?auto_1081878 ) ) ( not ( = ?auto_1081874 ?auto_1081879 ) ) ( not ( = ?auto_1081874 ?auto_1081880 ) ) ( not ( = ?auto_1081874 ?auto_1081882 ) ) ( not ( = ?auto_1081873 ?auto_1081875 ) ) ( not ( = ?auto_1081873 ?auto_1081876 ) ) ( not ( = ?auto_1081873 ?auto_1081877 ) ) ( not ( = ?auto_1081873 ?auto_1081878 ) ) ( not ( = ?auto_1081873 ?auto_1081879 ) ) ( not ( = ?auto_1081873 ?auto_1081880 ) ) ( not ( = ?auto_1081873 ?auto_1081882 ) ) ( not ( = ?auto_1081875 ?auto_1081876 ) ) ( not ( = ?auto_1081875 ?auto_1081877 ) ) ( not ( = ?auto_1081875 ?auto_1081878 ) ) ( not ( = ?auto_1081875 ?auto_1081879 ) ) ( not ( = ?auto_1081875 ?auto_1081880 ) ) ( not ( = ?auto_1081875 ?auto_1081882 ) ) ( not ( = ?auto_1081876 ?auto_1081877 ) ) ( not ( = ?auto_1081876 ?auto_1081878 ) ) ( not ( = ?auto_1081876 ?auto_1081879 ) ) ( not ( = ?auto_1081876 ?auto_1081880 ) ) ( not ( = ?auto_1081876 ?auto_1081882 ) ) ( not ( = ?auto_1081877 ?auto_1081878 ) ) ( not ( = ?auto_1081877 ?auto_1081879 ) ) ( not ( = ?auto_1081877 ?auto_1081880 ) ) ( not ( = ?auto_1081877 ?auto_1081882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081878 ?auto_1081879 ?auto_1081880 )
      ( MAKE-10CRATE-VERIFY ?auto_1081870 ?auto_1081871 ?auto_1081872 ?auto_1081874 ?auto_1081873 ?auto_1081875 ?auto_1081876 ?auto_1081877 ?auto_1081878 ?auto_1081879 ?auto_1081880 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1081887 - SURFACE
      ?auto_1081888 - SURFACE
      ?auto_1081889 - SURFACE
      ?auto_1081891 - SURFACE
      ?auto_1081890 - SURFACE
      ?auto_1081892 - SURFACE
      ?auto_1081893 - SURFACE
      ?auto_1081894 - SURFACE
      ?auto_1081895 - SURFACE
      ?auto_1081896 - SURFACE
      ?auto_1081897 - SURFACE
      ?auto_1081898 - SURFACE
    )
    :vars
    (
      ?auto_1081902 - HOIST
      ?auto_1081899 - PLACE
      ?auto_1081901 - PLACE
      ?auto_1081904 - HOIST
      ?auto_1081900 - SURFACE
      ?auto_1081903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081902 ?auto_1081899 ) ( IS-CRATE ?auto_1081898 ) ( not ( = ?auto_1081897 ?auto_1081898 ) ) ( not ( = ?auto_1081896 ?auto_1081897 ) ) ( not ( = ?auto_1081896 ?auto_1081898 ) ) ( not ( = ?auto_1081901 ?auto_1081899 ) ) ( HOIST-AT ?auto_1081904 ?auto_1081901 ) ( not ( = ?auto_1081902 ?auto_1081904 ) ) ( SURFACE-AT ?auto_1081898 ?auto_1081901 ) ( ON ?auto_1081898 ?auto_1081900 ) ( CLEAR ?auto_1081898 ) ( not ( = ?auto_1081897 ?auto_1081900 ) ) ( not ( = ?auto_1081898 ?auto_1081900 ) ) ( not ( = ?auto_1081896 ?auto_1081900 ) ) ( SURFACE-AT ?auto_1081896 ?auto_1081899 ) ( CLEAR ?auto_1081896 ) ( IS-CRATE ?auto_1081897 ) ( AVAILABLE ?auto_1081902 ) ( TRUCK-AT ?auto_1081903 ?auto_1081901 ) ( LIFTING ?auto_1081904 ?auto_1081897 ) ( ON ?auto_1081888 ?auto_1081887 ) ( ON ?auto_1081889 ?auto_1081888 ) ( ON ?auto_1081891 ?auto_1081889 ) ( ON ?auto_1081890 ?auto_1081891 ) ( ON ?auto_1081892 ?auto_1081890 ) ( ON ?auto_1081893 ?auto_1081892 ) ( ON ?auto_1081894 ?auto_1081893 ) ( ON ?auto_1081895 ?auto_1081894 ) ( ON ?auto_1081896 ?auto_1081895 ) ( not ( = ?auto_1081887 ?auto_1081888 ) ) ( not ( = ?auto_1081887 ?auto_1081889 ) ) ( not ( = ?auto_1081887 ?auto_1081891 ) ) ( not ( = ?auto_1081887 ?auto_1081890 ) ) ( not ( = ?auto_1081887 ?auto_1081892 ) ) ( not ( = ?auto_1081887 ?auto_1081893 ) ) ( not ( = ?auto_1081887 ?auto_1081894 ) ) ( not ( = ?auto_1081887 ?auto_1081895 ) ) ( not ( = ?auto_1081887 ?auto_1081896 ) ) ( not ( = ?auto_1081887 ?auto_1081897 ) ) ( not ( = ?auto_1081887 ?auto_1081898 ) ) ( not ( = ?auto_1081887 ?auto_1081900 ) ) ( not ( = ?auto_1081888 ?auto_1081889 ) ) ( not ( = ?auto_1081888 ?auto_1081891 ) ) ( not ( = ?auto_1081888 ?auto_1081890 ) ) ( not ( = ?auto_1081888 ?auto_1081892 ) ) ( not ( = ?auto_1081888 ?auto_1081893 ) ) ( not ( = ?auto_1081888 ?auto_1081894 ) ) ( not ( = ?auto_1081888 ?auto_1081895 ) ) ( not ( = ?auto_1081888 ?auto_1081896 ) ) ( not ( = ?auto_1081888 ?auto_1081897 ) ) ( not ( = ?auto_1081888 ?auto_1081898 ) ) ( not ( = ?auto_1081888 ?auto_1081900 ) ) ( not ( = ?auto_1081889 ?auto_1081891 ) ) ( not ( = ?auto_1081889 ?auto_1081890 ) ) ( not ( = ?auto_1081889 ?auto_1081892 ) ) ( not ( = ?auto_1081889 ?auto_1081893 ) ) ( not ( = ?auto_1081889 ?auto_1081894 ) ) ( not ( = ?auto_1081889 ?auto_1081895 ) ) ( not ( = ?auto_1081889 ?auto_1081896 ) ) ( not ( = ?auto_1081889 ?auto_1081897 ) ) ( not ( = ?auto_1081889 ?auto_1081898 ) ) ( not ( = ?auto_1081889 ?auto_1081900 ) ) ( not ( = ?auto_1081891 ?auto_1081890 ) ) ( not ( = ?auto_1081891 ?auto_1081892 ) ) ( not ( = ?auto_1081891 ?auto_1081893 ) ) ( not ( = ?auto_1081891 ?auto_1081894 ) ) ( not ( = ?auto_1081891 ?auto_1081895 ) ) ( not ( = ?auto_1081891 ?auto_1081896 ) ) ( not ( = ?auto_1081891 ?auto_1081897 ) ) ( not ( = ?auto_1081891 ?auto_1081898 ) ) ( not ( = ?auto_1081891 ?auto_1081900 ) ) ( not ( = ?auto_1081890 ?auto_1081892 ) ) ( not ( = ?auto_1081890 ?auto_1081893 ) ) ( not ( = ?auto_1081890 ?auto_1081894 ) ) ( not ( = ?auto_1081890 ?auto_1081895 ) ) ( not ( = ?auto_1081890 ?auto_1081896 ) ) ( not ( = ?auto_1081890 ?auto_1081897 ) ) ( not ( = ?auto_1081890 ?auto_1081898 ) ) ( not ( = ?auto_1081890 ?auto_1081900 ) ) ( not ( = ?auto_1081892 ?auto_1081893 ) ) ( not ( = ?auto_1081892 ?auto_1081894 ) ) ( not ( = ?auto_1081892 ?auto_1081895 ) ) ( not ( = ?auto_1081892 ?auto_1081896 ) ) ( not ( = ?auto_1081892 ?auto_1081897 ) ) ( not ( = ?auto_1081892 ?auto_1081898 ) ) ( not ( = ?auto_1081892 ?auto_1081900 ) ) ( not ( = ?auto_1081893 ?auto_1081894 ) ) ( not ( = ?auto_1081893 ?auto_1081895 ) ) ( not ( = ?auto_1081893 ?auto_1081896 ) ) ( not ( = ?auto_1081893 ?auto_1081897 ) ) ( not ( = ?auto_1081893 ?auto_1081898 ) ) ( not ( = ?auto_1081893 ?auto_1081900 ) ) ( not ( = ?auto_1081894 ?auto_1081895 ) ) ( not ( = ?auto_1081894 ?auto_1081896 ) ) ( not ( = ?auto_1081894 ?auto_1081897 ) ) ( not ( = ?auto_1081894 ?auto_1081898 ) ) ( not ( = ?auto_1081894 ?auto_1081900 ) ) ( not ( = ?auto_1081895 ?auto_1081896 ) ) ( not ( = ?auto_1081895 ?auto_1081897 ) ) ( not ( = ?auto_1081895 ?auto_1081898 ) ) ( not ( = ?auto_1081895 ?auto_1081900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081896 ?auto_1081897 ?auto_1081898 )
      ( MAKE-11CRATE-VERIFY ?auto_1081887 ?auto_1081888 ?auto_1081889 ?auto_1081891 ?auto_1081890 ?auto_1081892 ?auto_1081893 ?auto_1081894 ?auto_1081895 ?auto_1081896 ?auto_1081897 ?auto_1081898 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081905 - SURFACE
      ?auto_1081906 - SURFACE
      ?auto_1081907 - SURFACE
      ?auto_1081909 - SURFACE
      ?auto_1081908 - SURFACE
      ?auto_1081910 - SURFACE
      ?auto_1081911 - SURFACE
      ?auto_1081912 - SURFACE
      ?auto_1081913 - SURFACE
      ?auto_1081914 - SURFACE
      ?auto_1081915 - SURFACE
      ?auto_1081916 - SURFACE
      ?auto_1081917 - SURFACE
    )
    :vars
    (
      ?auto_1081921 - HOIST
      ?auto_1081918 - PLACE
      ?auto_1081920 - PLACE
      ?auto_1081923 - HOIST
      ?auto_1081919 - SURFACE
      ?auto_1081922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081921 ?auto_1081918 ) ( IS-CRATE ?auto_1081917 ) ( not ( = ?auto_1081916 ?auto_1081917 ) ) ( not ( = ?auto_1081915 ?auto_1081916 ) ) ( not ( = ?auto_1081915 ?auto_1081917 ) ) ( not ( = ?auto_1081920 ?auto_1081918 ) ) ( HOIST-AT ?auto_1081923 ?auto_1081920 ) ( not ( = ?auto_1081921 ?auto_1081923 ) ) ( SURFACE-AT ?auto_1081917 ?auto_1081920 ) ( ON ?auto_1081917 ?auto_1081919 ) ( CLEAR ?auto_1081917 ) ( not ( = ?auto_1081916 ?auto_1081919 ) ) ( not ( = ?auto_1081917 ?auto_1081919 ) ) ( not ( = ?auto_1081915 ?auto_1081919 ) ) ( SURFACE-AT ?auto_1081915 ?auto_1081918 ) ( CLEAR ?auto_1081915 ) ( IS-CRATE ?auto_1081916 ) ( AVAILABLE ?auto_1081921 ) ( TRUCK-AT ?auto_1081922 ?auto_1081920 ) ( LIFTING ?auto_1081923 ?auto_1081916 ) ( ON ?auto_1081906 ?auto_1081905 ) ( ON ?auto_1081907 ?auto_1081906 ) ( ON ?auto_1081909 ?auto_1081907 ) ( ON ?auto_1081908 ?auto_1081909 ) ( ON ?auto_1081910 ?auto_1081908 ) ( ON ?auto_1081911 ?auto_1081910 ) ( ON ?auto_1081912 ?auto_1081911 ) ( ON ?auto_1081913 ?auto_1081912 ) ( ON ?auto_1081914 ?auto_1081913 ) ( ON ?auto_1081915 ?auto_1081914 ) ( not ( = ?auto_1081905 ?auto_1081906 ) ) ( not ( = ?auto_1081905 ?auto_1081907 ) ) ( not ( = ?auto_1081905 ?auto_1081909 ) ) ( not ( = ?auto_1081905 ?auto_1081908 ) ) ( not ( = ?auto_1081905 ?auto_1081910 ) ) ( not ( = ?auto_1081905 ?auto_1081911 ) ) ( not ( = ?auto_1081905 ?auto_1081912 ) ) ( not ( = ?auto_1081905 ?auto_1081913 ) ) ( not ( = ?auto_1081905 ?auto_1081914 ) ) ( not ( = ?auto_1081905 ?auto_1081915 ) ) ( not ( = ?auto_1081905 ?auto_1081916 ) ) ( not ( = ?auto_1081905 ?auto_1081917 ) ) ( not ( = ?auto_1081905 ?auto_1081919 ) ) ( not ( = ?auto_1081906 ?auto_1081907 ) ) ( not ( = ?auto_1081906 ?auto_1081909 ) ) ( not ( = ?auto_1081906 ?auto_1081908 ) ) ( not ( = ?auto_1081906 ?auto_1081910 ) ) ( not ( = ?auto_1081906 ?auto_1081911 ) ) ( not ( = ?auto_1081906 ?auto_1081912 ) ) ( not ( = ?auto_1081906 ?auto_1081913 ) ) ( not ( = ?auto_1081906 ?auto_1081914 ) ) ( not ( = ?auto_1081906 ?auto_1081915 ) ) ( not ( = ?auto_1081906 ?auto_1081916 ) ) ( not ( = ?auto_1081906 ?auto_1081917 ) ) ( not ( = ?auto_1081906 ?auto_1081919 ) ) ( not ( = ?auto_1081907 ?auto_1081909 ) ) ( not ( = ?auto_1081907 ?auto_1081908 ) ) ( not ( = ?auto_1081907 ?auto_1081910 ) ) ( not ( = ?auto_1081907 ?auto_1081911 ) ) ( not ( = ?auto_1081907 ?auto_1081912 ) ) ( not ( = ?auto_1081907 ?auto_1081913 ) ) ( not ( = ?auto_1081907 ?auto_1081914 ) ) ( not ( = ?auto_1081907 ?auto_1081915 ) ) ( not ( = ?auto_1081907 ?auto_1081916 ) ) ( not ( = ?auto_1081907 ?auto_1081917 ) ) ( not ( = ?auto_1081907 ?auto_1081919 ) ) ( not ( = ?auto_1081909 ?auto_1081908 ) ) ( not ( = ?auto_1081909 ?auto_1081910 ) ) ( not ( = ?auto_1081909 ?auto_1081911 ) ) ( not ( = ?auto_1081909 ?auto_1081912 ) ) ( not ( = ?auto_1081909 ?auto_1081913 ) ) ( not ( = ?auto_1081909 ?auto_1081914 ) ) ( not ( = ?auto_1081909 ?auto_1081915 ) ) ( not ( = ?auto_1081909 ?auto_1081916 ) ) ( not ( = ?auto_1081909 ?auto_1081917 ) ) ( not ( = ?auto_1081909 ?auto_1081919 ) ) ( not ( = ?auto_1081908 ?auto_1081910 ) ) ( not ( = ?auto_1081908 ?auto_1081911 ) ) ( not ( = ?auto_1081908 ?auto_1081912 ) ) ( not ( = ?auto_1081908 ?auto_1081913 ) ) ( not ( = ?auto_1081908 ?auto_1081914 ) ) ( not ( = ?auto_1081908 ?auto_1081915 ) ) ( not ( = ?auto_1081908 ?auto_1081916 ) ) ( not ( = ?auto_1081908 ?auto_1081917 ) ) ( not ( = ?auto_1081908 ?auto_1081919 ) ) ( not ( = ?auto_1081910 ?auto_1081911 ) ) ( not ( = ?auto_1081910 ?auto_1081912 ) ) ( not ( = ?auto_1081910 ?auto_1081913 ) ) ( not ( = ?auto_1081910 ?auto_1081914 ) ) ( not ( = ?auto_1081910 ?auto_1081915 ) ) ( not ( = ?auto_1081910 ?auto_1081916 ) ) ( not ( = ?auto_1081910 ?auto_1081917 ) ) ( not ( = ?auto_1081910 ?auto_1081919 ) ) ( not ( = ?auto_1081911 ?auto_1081912 ) ) ( not ( = ?auto_1081911 ?auto_1081913 ) ) ( not ( = ?auto_1081911 ?auto_1081914 ) ) ( not ( = ?auto_1081911 ?auto_1081915 ) ) ( not ( = ?auto_1081911 ?auto_1081916 ) ) ( not ( = ?auto_1081911 ?auto_1081917 ) ) ( not ( = ?auto_1081911 ?auto_1081919 ) ) ( not ( = ?auto_1081912 ?auto_1081913 ) ) ( not ( = ?auto_1081912 ?auto_1081914 ) ) ( not ( = ?auto_1081912 ?auto_1081915 ) ) ( not ( = ?auto_1081912 ?auto_1081916 ) ) ( not ( = ?auto_1081912 ?auto_1081917 ) ) ( not ( = ?auto_1081912 ?auto_1081919 ) ) ( not ( = ?auto_1081913 ?auto_1081914 ) ) ( not ( = ?auto_1081913 ?auto_1081915 ) ) ( not ( = ?auto_1081913 ?auto_1081916 ) ) ( not ( = ?auto_1081913 ?auto_1081917 ) ) ( not ( = ?auto_1081913 ?auto_1081919 ) ) ( not ( = ?auto_1081914 ?auto_1081915 ) ) ( not ( = ?auto_1081914 ?auto_1081916 ) ) ( not ( = ?auto_1081914 ?auto_1081917 ) ) ( not ( = ?auto_1081914 ?auto_1081919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081915 ?auto_1081916 ?auto_1081917 )
      ( MAKE-12CRATE-VERIFY ?auto_1081905 ?auto_1081906 ?auto_1081907 ?auto_1081909 ?auto_1081908 ?auto_1081910 ?auto_1081911 ?auto_1081912 ?auto_1081913 ?auto_1081914 ?auto_1081915 ?auto_1081916 ?auto_1081917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1081924 - SURFACE
      ?auto_1081925 - SURFACE
    )
    :vars
    (
      ?auto_1081929 - HOIST
      ?auto_1081926 - PLACE
      ?auto_1081930 - SURFACE
      ?auto_1081928 - PLACE
      ?auto_1081932 - HOIST
      ?auto_1081927 - SURFACE
      ?auto_1081931 - TRUCK
      ?auto_1081933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081929 ?auto_1081926 ) ( IS-CRATE ?auto_1081925 ) ( not ( = ?auto_1081924 ?auto_1081925 ) ) ( not ( = ?auto_1081930 ?auto_1081924 ) ) ( not ( = ?auto_1081930 ?auto_1081925 ) ) ( not ( = ?auto_1081928 ?auto_1081926 ) ) ( HOIST-AT ?auto_1081932 ?auto_1081928 ) ( not ( = ?auto_1081929 ?auto_1081932 ) ) ( SURFACE-AT ?auto_1081925 ?auto_1081928 ) ( ON ?auto_1081925 ?auto_1081927 ) ( CLEAR ?auto_1081925 ) ( not ( = ?auto_1081924 ?auto_1081927 ) ) ( not ( = ?auto_1081925 ?auto_1081927 ) ) ( not ( = ?auto_1081930 ?auto_1081927 ) ) ( SURFACE-AT ?auto_1081930 ?auto_1081926 ) ( CLEAR ?auto_1081930 ) ( IS-CRATE ?auto_1081924 ) ( AVAILABLE ?auto_1081929 ) ( TRUCK-AT ?auto_1081931 ?auto_1081928 ) ( AVAILABLE ?auto_1081932 ) ( SURFACE-AT ?auto_1081924 ?auto_1081928 ) ( ON ?auto_1081924 ?auto_1081933 ) ( CLEAR ?auto_1081924 ) ( not ( = ?auto_1081924 ?auto_1081933 ) ) ( not ( = ?auto_1081925 ?auto_1081933 ) ) ( not ( = ?auto_1081930 ?auto_1081933 ) ) ( not ( = ?auto_1081927 ?auto_1081933 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1081932 ?auto_1081924 ?auto_1081933 ?auto_1081928 )
      ( MAKE-2CRATE ?auto_1081930 ?auto_1081924 ?auto_1081925 )
      ( MAKE-1CRATE-VERIFY ?auto_1081924 ?auto_1081925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1081934 - SURFACE
      ?auto_1081935 - SURFACE
      ?auto_1081936 - SURFACE
    )
    :vars
    (
      ?auto_1081941 - HOIST
      ?auto_1081940 - PLACE
      ?auto_1081938 - PLACE
      ?auto_1081942 - HOIST
      ?auto_1081937 - SURFACE
      ?auto_1081943 - TRUCK
      ?auto_1081939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081941 ?auto_1081940 ) ( IS-CRATE ?auto_1081936 ) ( not ( = ?auto_1081935 ?auto_1081936 ) ) ( not ( = ?auto_1081934 ?auto_1081935 ) ) ( not ( = ?auto_1081934 ?auto_1081936 ) ) ( not ( = ?auto_1081938 ?auto_1081940 ) ) ( HOIST-AT ?auto_1081942 ?auto_1081938 ) ( not ( = ?auto_1081941 ?auto_1081942 ) ) ( SURFACE-AT ?auto_1081936 ?auto_1081938 ) ( ON ?auto_1081936 ?auto_1081937 ) ( CLEAR ?auto_1081936 ) ( not ( = ?auto_1081935 ?auto_1081937 ) ) ( not ( = ?auto_1081936 ?auto_1081937 ) ) ( not ( = ?auto_1081934 ?auto_1081937 ) ) ( SURFACE-AT ?auto_1081934 ?auto_1081940 ) ( CLEAR ?auto_1081934 ) ( IS-CRATE ?auto_1081935 ) ( AVAILABLE ?auto_1081941 ) ( TRUCK-AT ?auto_1081943 ?auto_1081938 ) ( AVAILABLE ?auto_1081942 ) ( SURFACE-AT ?auto_1081935 ?auto_1081938 ) ( ON ?auto_1081935 ?auto_1081939 ) ( CLEAR ?auto_1081935 ) ( not ( = ?auto_1081935 ?auto_1081939 ) ) ( not ( = ?auto_1081936 ?auto_1081939 ) ) ( not ( = ?auto_1081934 ?auto_1081939 ) ) ( not ( = ?auto_1081937 ?auto_1081939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1081935 ?auto_1081936 )
      ( MAKE-2CRATE-VERIFY ?auto_1081934 ?auto_1081935 ?auto_1081936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1081944 - SURFACE
      ?auto_1081945 - SURFACE
      ?auto_1081946 - SURFACE
      ?auto_1081947 - SURFACE
    )
    :vars
    (
      ?auto_1081948 - HOIST
      ?auto_1081950 - PLACE
      ?auto_1081953 - PLACE
      ?auto_1081951 - HOIST
      ?auto_1081952 - SURFACE
      ?auto_1081949 - TRUCK
      ?auto_1081954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081948 ?auto_1081950 ) ( IS-CRATE ?auto_1081947 ) ( not ( = ?auto_1081946 ?auto_1081947 ) ) ( not ( = ?auto_1081945 ?auto_1081946 ) ) ( not ( = ?auto_1081945 ?auto_1081947 ) ) ( not ( = ?auto_1081953 ?auto_1081950 ) ) ( HOIST-AT ?auto_1081951 ?auto_1081953 ) ( not ( = ?auto_1081948 ?auto_1081951 ) ) ( SURFACE-AT ?auto_1081947 ?auto_1081953 ) ( ON ?auto_1081947 ?auto_1081952 ) ( CLEAR ?auto_1081947 ) ( not ( = ?auto_1081946 ?auto_1081952 ) ) ( not ( = ?auto_1081947 ?auto_1081952 ) ) ( not ( = ?auto_1081945 ?auto_1081952 ) ) ( SURFACE-AT ?auto_1081945 ?auto_1081950 ) ( CLEAR ?auto_1081945 ) ( IS-CRATE ?auto_1081946 ) ( AVAILABLE ?auto_1081948 ) ( TRUCK-AT ?auto_1081949 ?auto_1081953 ) ( AVAILABLE ?auto_1081951 ) ( SURFACE-AT ?auto_1081946 ?auto_1081953 ) ( ON ?auto_1081946 ?auto_1081954 ) ( CLEAR ?auto_1081946 ) ( not ( = ?auto_1081946 ?auto_1081954 ) ) ( not ( = ?auto_1081947 ?auto_1081954 ) ) ( not ( = ?auto_1081945 ?auto_1081954 ) ) ( not ( = ?auto_1081952 ?auto_1081954 ) ) ( ON ?auto_1081945 ?auto_1081944 ) ( not ( = ?auto_1081944 ?auto_1081945 ) ) ( not ( = ?auto_1081944 ?auto_1081946 ) ) ( not ( = ?auto_1081944 ?auto_1081947 ) ) ( not ( = ?auto_1081944 ?auto_1081952 ) ) ( not ( = ?auto_1081944 ?auto_1081954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081945 ?auto_1081946 ?auto_1081947 )
      ( MAKE-3CRATE-VERIFY ?auto_1081944 ?auto_1081945 ?auto_1081946 ?auto_1081947 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1081955 - SURFACE
      ?auto_1081956 - SURFACE
      ?auto_1081957 - SURFACE
      ?auto_1081959 - SURFACE
      ?auto_1081958 - SURFACE
    )
    :vars
    (
      ?auto_1081960 - HOIST
      ?auto_1081962 - PLACE
      ?auto_1081965 - PLACE
      ?auto_1081963 - HOIST
      ?auto_1081964 - SURFACE
      ?auto_1081961 - TRUCK
      ?auto_1081966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081960 ?auto_1081962 ) ( IS-CRATE ?auto_1081958 ) ( not ( = ?auto_1081959 ?auto_1081958 ) ) ( not ( = ?auto_1081957 ?auto_1081959 ) ) ( not ( = ?auto_1081957 ?auto_1081958 ) ) ( not ( = ?auto_1081965 ?auto_1081962 ) ) ( HOIST-AT ?auto_1081963 ?auto_1081965 ) ( not ( = ?auto_1081960 ?auto_1081963 ) ) ( SURFACE-AT ?auto_1081958 ?auto_1081965 ) ( ON ?auto_1081958 ?auto_1081964 ) ( CLEAR ?auto_1081958 ) ( not ( = ?auto_1081959 ?auto_1081964 ) ) ( not ( = ?auto_1081958 ?auto_1081964 ) ) ( not ( = ?auto_1081957 ?auto_1081964 ) ) ( SURFACE-AT ?auto_1081957 ?auto_1081962 ) ( CLEAR ?auto_1081957 ) ( IS-CRATE ?auto_1081959 ) ( AVAILABLE ?auto_1081960 ) ( TRUCK-AT ?auto_1081961 ?auto_1081965 ) ( AVAILABLE ?auto_1081963 ) ( SURFACE-AT ?auto_1081959 ?auto_1081965 ) ( ON ?auto_1081959 ?auto_1081966 ) ( CLEAR ?auto_1081959 ) ( not ( = ?auto_1081959 ?auto_1081966 ) ) ( not ( = ?auto_1081958 ?auto_1081966 ) ) ( not ( = ?auto_1081957 ?auto_1081966 ) ) ( not ( = ?auto_1081964 ?auto_1081966 ) ) ( ON ?auto_1081956 ?auto_1081955 ) ( ON ?auto_1081957 ?auto_1081956 ) ( not ( = ?auto_1081955 ?auto_1081956 ) ) ( not ( = ?auto_1081955 ?auto_1081957 ) ) ( not ( = ?auto_1081955 ?auto_1081959 ) ) ( not ( = ?auto_1081955 ?auto_1081958 ) ) ( not ( = ?auto_1081955 ?auto_1081964 ) ) ( not ( = ?auto_1081955 ?auto_1081966 ) ) ( not ( = ?auto_1081956 ?auto_1081957 ) ) ( not ( = ?auto_1081956 ?auto_1081959 ) ) ( not ( = ?auto_1081956 ?auto_1081958 ) ) ( not ( = ?auto_1081956 ?auto_1081964 ) ) ( not ( = ?auto_1081956 ?auto_1081966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081957 ?auto_1081959 ?auto_1081958 )
      ( MAKE-4CRATE-VERIFY ?auto_1081955 ?auto_1081956 ?auto_1081957 ?auto_1081959 ?auto_1081958 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1081967 - SURFACE
      ?auto_1081968 - SURFACE
      ?auto_1081969 - SURFACE
      ?auto_1081971 - SURFACE
      ?auto_1081970 - SURFACE
      ?auto_1081972 - SURFACE
    )
    :vars
    (
      ?auto_1081973 - HOIST
      ?auto_1081975 - PLACE
      ?auto_1081978 - PLACE
      ?auto_1081976 - HOIST
      ?auto_1081977 - SURFACE
      ?auto_1081974 - TRUCK
      ?auto_1081979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081973 ?auto_1081975 ) ( IS-CRATE ?auto_1081972 ) ( not ( = ?auto_1081970 ?auto_1081972 ) ) ( not ( = ?auto_1081971 ?auto_1081970 ) ) ( not ( = ?auto_1081971 ?auto_1081972 ) ) ( not ( = ?auto_1081978 ?auto_1081975 ) ) ( HOIST-AT ?auto_1081976 ?auto_1081978 ) ( not ( = ?auto_1081973 ?auto_1081976 ) ) ( SURFACE-AT ?auto_1081972 ?auto_1081978 ) ( ON ?auto_1081972 ?auto_1081977 ) ( CLEAR ?auto_1081972 ) ( not ( = ?auto_1081970 ?auto_1081977 ) ) ( not ( = ?auto_1081972 ?auto_1081977 ) ) ( not ( = ?auto_1081971 ?auto_1081977 ) ) ( SURFACE-AT ?auto_1081971 ?auto_1081975 ) ( CLEAR ?auto_1081971 ) ( IS-CRATE ?auto_1081970 ) ( AVAILABLE ?auto_1081973 ) ( TRUCK-AT ?auto_1081974 ?auto_1081978 ) ( AVAILABLE ?auto_1081976 ) ( SURFACE-AT ?auto_1081970 ?auto_1081978 ) ( ON ?auto_1081970 ?auto_1081979 ) ( CLEAR ?auto_1081970 ) ( not ( = ?auto_1081970 ?auto_1081979 ) ) ( not ( = ?auto_1081972 ?auto_1081979 ) ) ( not ( = ?auto_1081971 ?auto_1081979 ) ) ( not ( = ?auto_1081977 ?auto_1081979 ) ) ( ON ?auto_1081968 ?auto_1081967 ) ( ON ?auto_1081969 ?auto_1081968 ) ( ON ?auto_1081971 ?auto_1081969 ) ( not ( = ?auto_1081967 ?auto_1081968 ) ) ( not ( = ?auto_1081967 ?auto_1081969 ) ) ( not ( = ?auto_1081967 ?auto_1081971 ) ) ( not ( = ?auto_1081967 ?auto_1081970 ) ) ( not ( = ?auto_1081967 ?auto_1081972 ) ) ( not ( = ?auto_1081967 ?auto_1081977 ) ) ( not ( = ?auto_1081967 ?auto_1081979 ) ) ( not ( = ?auto_1081968 ?auto_1081969 ) ) ( not ( = ?auto_1081968 ?auto_1081971 ) ) ( not ( = ?auto_1081968 ?auto_1081970 ) ) ( not ( = ?auto_1081968 ?auto_1081972 ) ) ( not ( = ?auto_1081968 ?auto_1081977 ) ) ( not ( = ?auto_1081968 ?auto_1081979 ) ) ( not ( = ?auto_1081969 ?auto_1081971 ) ) ( not ( = ?auto_1081969 ?auto_1081970 ) ) ( not ( = ?auto_1081969 ?auto_1081972 ) ) ( not ( = ?auto_1081969 ?auto_1081977 ) ) ( not ( = ?auto_1081969 ?auto_1081979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081971 ?auto_1081970 ?auto_1081972 )
      ( MAKE-5CRATE-VERIFY ?auto_1081967 ?auto_1081968 ?auto_1081969 ?auto_1081971 ?auto_1081970 ?auto_1081972 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1081980 - SURFACE
      ?auto_1081981 - SURFACE
      ?auto_1081982 - SURFACE
      ?auto_1081984 - SURFACE
      ?auto_1081983 - SURFACE
      ?auto_1081985 - SURFACE
      ?auto_1081986 - SURFACE
    )
    :vars
    (
      ?auto_1081987 - HOIST
      ?auto_1081989 - PLACE
      ?auto_1081992 - PLACE
      ?auto_1081990 - HOIST
      ?auto_1081991 - SURFACE
      ?auto_1081988 - TRUCK
      ?auto_1081993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081987 ?auto_1081989 ) ( IS-CRATE ?auto_1081986 ) ( not ( = ?auto_1081985 ?auto_1081986 ) ) ( not ( = ?auto_1081983 ?auto_1081985 ) ) ( not ( = ?auto_1081983 ?auto_1081986 ) ) ( not ( = ?auto_1081992 ?auto_1081989 ) ) ( HOIST-AT ?auto_1081990 ?auto_1081992 ) ( not ( = ?auto_1081987 ?auto_1081990 ) ) ( SURFACE-AT ?auto_1081986 ?auto_1081992 ) ( ON ?auto_1081986 ?auto_1081991 ) ( CLEAR ?auto_1081986 ) ( not ( = ?auto_1081985 ?auto_1081991 ) ) ( not ( = ?auto_1081986 ?auto_1081991 ) ) ( not ( = ?auto_1081983 ?auto_1081991 ) ) ( SURFACE-AT ?auto_1081983 ?auto_1081989 ) ( CLEAR ?auto_1081983 ) ( IS-CRATE ?auto_1081985 ) ( AVAILABLE ?auto_1081987 ) ( TRUCK-AT ?auto_1081988 ?auto_1081992 ) ( AVAILABLE ?auto_1081990 ) ( SURFACE-AT ?auto_1081985 ?auto_1081992 ) ( ON ?auto_1081985 ?auto_1081993 ) ( CLEAR ?auto_1081985 ) ( not ( = ?auto_1081985 ?auto_1081993 ) ) ( not ( = ?auto_1081986 ?auto_1081993 ) ) ( not ( = ?auto_1081983 ?auto_1081993 ) ) ( not ( = ?auto_1081991 ?auto_1081993 ) ) ( ON ?auto_1081981 ?auto_1081980 ) ( ON ?auto_1081982 ?auto_1081981 ) ( ON ?auto_1081984 ?auto_1081982 ) ( ON ?auto_1081983 ?auto_1081984 ) ( not ( = ?auto_1081980 ?auto_1081981 ) ) ( not ( = ?auto_1081980 ?auto_1081982 ) ) ( not ( = ?auto_1081980 ?auto_1081984 ) ) ( not ( = ?auto_1081980 ?auto_1081983 ) ) ( not ( = ?auto_1081980 ?auto_1081985 ) ) ( not ( = ?auto_1081980 ?auto_1081986 ) ) ( not ( = ?auto_1081980 ?auto_1081991 ) ) ( not ( = ?auto_1081980 ?auto_1081993 ) ) ( not ( = ?auto_1081981 ?auto_1081982 ) ) ( not ( = ?auto_1081981 ?auto_1081984 ) ) ( not ( = ?auto_1081981 ?auto_1081983 ) ) ( not ( = ?auto_1081981 ?auto_1081985 ) ) ( not ( = ?auto_1081981 ?auto_1081986 ) ) ( not ( = ?auto_1081981 ?auto_1081991 ) ) ( not ( = ?auto_1081981 ?auto_1081993 ) ) ( not ( = ?auto_1081982 ?auto_1081984 ) ) ( not ( = ?auto_1081982 ?auto_1081983 ) ) ( not ( = ?auto_1081982 ?auto_1081985 ) ) ( not ( = ?auto_1081982 ?auto_1081986 ) ) ( not ( = ?auto_1081982 ?auto_1081991 ) ) ( not ( = ?auto_1081982 ?auto_1081993 ) ) ( not ( = ?auto_1081984 ?auto_1081983 ) ) ( not ( = ?auto_1081984 ?auto_1081985 ) ) ( not ( = ?auto_1081984 ?auto_1081986 ) ) ( not ( = ?auto_1081984 ?auto_1081991 ) ) ( not ( = ?auto_1081984 ?auto_1081993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081983 ?auto_1081985 ?auto_1081986 )
      ( MAKE-6CRATE-VERIFY ?auto_1081980 ?auto_1081981 ?auto_1081982 ?auto_1081984 ?auto_1081983 ?auto_1081985 ?auto_1081986 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1081994 - SURFACE
      ?auto_1081995 - SURFACE
      ?auto_1081996 - SURFACE
      ?auto_1081998 - SURFACE
      ?auto_1081997 - SURFACE
      ?auto_1081999 - SURFACE
      ?auto_1082000 - SURFACE
      ?auto_1082001 - SURFACE
    )
    :vars
    (
      ?auto_1082002 - HOIST
      ?auto_1082004 - PLACE
      ?auto_1082007 - PLACE
      ?auto_1082005 - HOIST
      ?auto_1082006 - SURFACE
      ?auto_1082003 - TRUCK
      ?auto_1082008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082002 ?auto_1082004 ) ( IS-CRATE ?auto_1082001 ) ( not ( = ?auto_1082000 ?auto_1082001 ) ) ( not ( = ?auto_1081999 ?auto_1082000 ) ) ( not ( = ?auto_1081999 ?auto_1082001 ) ) ( not ( = ?auto_1082007 ?auto_1082004 ) ) ( HOIST-AT ?auto_1082005 ?auto_1082007 ) ( not ( = ?auto_1082002 ?auto_1082005 ) ) ( SURFACE-AT ?auto_1082001 ?auto_1082007 ) ( ON ?auto_1082001 ?auto_1082006 ) ( CLEAR ?auto_1082001 ) ( not ( = ?auto_1082000 ?auto_1082006 ) ) ( not ( = ?auto_1082001 ?auto_1082006 ) ) ( not ( = ?auto_1081999 ?auto_1082006 ) ) ( SURFACE-AT ?auto_1081999 ?auto_1082004 ) ( CLEAR ?auto_1081999 ) ( IS-CRATE ?auto_1082000 ) ( AVAILABLE ?auto_1082002 ) ( TRUCK-AT ?auto_1082003 ?auto_1082007 ) ( AVAILABLE ?auto_1082005 ) ( SURFACE-AT ?auto_1082000 ?auto_1082007 ) ( ON ?auto_1082000 ?auto_1082008 ) ( CLEAR ?auto_1082000 ) ( not ( = ?auto_1082000 ?auto_1082008 ) ) ( not ( = ?auto_1082001 ?auto_1082008 ) ) ( not ( = ?auto_1081999 ?auto_1082008 ) ) ( not ( = ?auto_1082006 ?auto_1082008 ) ) ( ON ?auto_1081995 ?auto_1081994 ) ( ON ?auto_1081996 ?auto_1081995 ) ( ON ?auto_1081998 ?auto_1081996 ) ( ON ?auto_1081997 ?auto_1081998 ) ( ON ?auto_1081999 ?auto_1081997 ) ( not ( = ?auto_1081994 ?auto_1081995 ) ) ( not ( = ?auto_1081994 ?auto_1081996 ) ) ( not ( = ?auto_1081994 ?auto_1081998 ) ) ( not ( = ?auto_1081994 ?auto_1081997 ) ) ( not ( = ?auto_1081994 ?auto_1081999 ) ) ( not ( = ?auto_1081994 ?auto_1082000 ) ) ( not ( = ?auto_1081994 ?auto_1082001 ) ) ( not ( = ?auto_1081994 ?auto_1082006 ) ) ( not ( = ?auto_1081994 ?auto_1082008 ) ) ( not ( = ?auto_1081995 ?auto_1081996 ) ) ( not ( = ?auto_1081995 ?auto_1081998 ) ) ( not ( = ?auto_1081995 ?auto_1081997 ) ) ( not ( = ?auto_1081995 ?auto_1081999 ) ) ( not ( = ?auto_1081995 ?auto_1082000 ) ) ( not ( = ?auto_1081995 ?auto_1082001 ) ) ( not ( = ?auto_1081995 ?auto_1082006 ) ) ( not ( = ?auto_1081995 ?auto_1082008 ) ) ( not ( = ?auto_1081996 ?auto_1081998 ) ) ( not ( = ?auto_1081996 ?auto_1081997 ) ) ( not ( = ?auto_1081996 ?auto_1081999 ) ) ( not ( = ?auto_1081996 ?auto_1082000 ) ) ( not ( = ?auto_1081996 ?auto_1082001 ) ) ( not ( = ?auto_1081996 ?auto_1082006 ) ) ( not ( = ?auto_1081996 ?auto_1082008 ) ) ( not ( = ?auto_1081998 ?auto_1081997 ) ) ( not ( = ?auto_1081998 ?auto_1081999 ) ) ( not ( = ?auto_1081998 ?auto_1082000 ) ) ( not ( = ?auto_1081998 ?auto_1082001 ) ) ( not ( = ?auto_1081998 ?auto_1082006 ) ) ( not ( = ?auto_1081998 ?auto_1082008 ) ) ( not ( = ?auto_1081997 ?auto_1081999 ) ) ( not ( = ?auto_1081997 ?auto_1082000 ) ) ( not ( = ?auto_1081997 ?auto_1082001 ) ) ( not ( = ?auto_1081997 ?auto_1082006 ) ) ( not ( = ?auto_1081997 ?auto_1082008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081999 ?auto_1082000 ?auto_1082001 )
      ( MAKE-7CRATE-VERIFY ?auto_1081994 ?auto_1081995 ?auto_1081996 ?auto_1081998 ?auto_1081997 ?auto_1081999 ?auto_1082000 ?auto_1082001 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1082009 - SURFACE
      ?auto_1082010 - SURFACE
      ?auto_1082011 - SURFACE
      ?auto_1082013 - SURFACE
      ?auto_1082012 - SURFACE
      ?auto_1082014 - SURFACE
      ?auto_1082015 - SURFACE
      ?auto_1082016 - SURFACE
      ?auto_1082017 - SURFACE
    )
    :vars
    (
      ?auto_1082018 - HOIST
      ?auto_1082020 - PLACE
      ?auto_1082023 - PLACE
      ?auto_1082021 - HOIST
      ?auto_1082022 - SURFACE
      ?auto_1082019 - TRUCK
      ?auto_1082024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082018 ?auto_1082020 ) ( IS-CRATE ?auto_1082017 ) ( not ( = ?auto_1082016 ?auto_1082017 ) ) ( not ( = ?auto_1082015 ?auto_1082016 ) ) ( not ( = ?auto_1082015 ?auto_1082017 ) ) ( not ( = ?auto_1082023 ?auto_1082020 ) ) ( HOIST-AT ?auto_1082021 ?auto_1082023 ) ( not ( = ?auto_1082018 ?auto_1082021 ) ) ( SURFACE-AT ?auto_1082017 ?auto_1082023 ) ( ON ?auto_1082017 ?auto_1082022 ) ( CLEAR ?auto_1082017 ) ( not ( = ?auto_1082016 ?auto_1082022 ) ) ( not ( = ?auto_1082017 ?auto_1082022 ) ) ( not ( = ?auto_1082015 ?auto_1082022 ) ) ( SURFACE-AT ?auto_1082015 ?auto_1082020 ) ( CLEAR ?auto_1082015 ) ( IS-CRATE ?auto_1082016 ) ( AVAILABLE ?auto_1082018 ) ( TRUCK-AT ?auto_1082019 ?auto_1082023 ) ( AVAILABLE ?auto_1082021 ) ( SURFACE-AT ?auto_1082016 ?auto_1082023 ) ( ON ?auto_1082016 ?auto_1082024 ) ( CLEAR ?auto_1082016 ) ( not ( = ?auto_1082016 ?auto_1082024 ) ) ( not ( = ?auto_1082017 ?auto_1082024 ) ) ( not ( = ?auto_1082015 ?auto_1082024 ) ) ( not ( = ?auto_1082022 ?auto_1082024 ) ) ( ON ?auto_1082010 ?auto_1082009 ) ( ON ?auto_1082011 ?auto_1082010 ) ( ON ?auto_1082013 ?auto_1082011 ) ( ON ?auto_1082012 ?auto_1082013 ) ( ON ?auto_1082014 ?auto_1082012 ) ( ON ?auto_1082015 ?auto_1082014 ) ( not ( = ?auto_1082009 ?auto_1082010 ) ) ( not ( = ?auto_1082009 ?auto_1082011 ) ) ( not ( = ?auto_1082009 ?auto_1082013 ) ) ( not ( = ?auto_1082009 ?auto_1082012 ) ) ( not ( = ?auto_1082009 ?auto_1082014 ) ) ( not ( = ?auto_1082009 ?auto_1082015 ) ) ( not ( = ?auto_1082009 ?auto_1082016 ) ) ( not ( = ?auto_1082009 ?auto_1082017 ) ) ( not ( = ?auto_1082009 ?auto_1082022 ) ) ( not ( = ?auto_1082009 ?auto_1082024 ) ) ( not ( = ?auto_1082010 ?auto_1082011 ) ) ( not ( = ?auto_1082010 ?auto_1082013 ) ) ( not ( = ?auto_1082010 ?auto_1082012 ) ) ( not ( = ?auto_1082010 ?auto_1082014 ) ) ( not ( = ?auto_1082010 ?auto_1082015 ) ) ( not ( = ?auto_1082010 ?auto_1082016 ) ) ( not ( = ?auto_1082010 ?auto_1082017 ) ) ( not ( = ?auto_1082010 ?auto_1082022 ) ) ( not ( = ?auto_1082010 ?auto_1082024 ) ) ( not ( = ?auto_1082011 ?auto_1082013 ) ) ( not ( = ?auto_1082011 ?auto_1082012 ) ) ( not ( = ?auto_1082011 ?auto_1082014 ) ) ( not ( = ?auto_1082011 ?auto_1082015 ) ) ( not ( = ?auto_1082011 ?auto_1082016 ) ) ( not ( = ?auto_1082011 ?auto_1082017 ) ) ( not ( = ?auto_1082011 ?auto_1082022 ) ) ( not ( = ?auto_1082011 ?auto_1082024 ) ) ( not ( = ?auto_1082013 ?auto_1082012 ) ) ( not ( = ?auto_1082013 ?auto_1082014 ) ) ( not ( = ?auto_1082013 ?auto_1082015 ) ) ( not ( = ?auto_1082013 ?auto_1082016 ) ) ( not ( = ?auto_1082013 ?auto_1082017 ) ) ( not ( = ?auto_1082013 ?auto_1082022 ) ) ( not ( = ?auto_1082013 ?auto_1082024 ) ) ( not ( = ?auto_1082012 ?auto_1082014 ) ) ( not ( = ?auto_1082012 ?auto_1082015 ) ) ( not ( = ?auto_1082012 ?auto_1082016 ) ) ( not ( = ?auto_1082012 ?auto_1082017 ) ) ( not ( = ?auto_1082012 ?auto_1082022 ) ) ( not ( = ?auto_1082012 ?auto_1082024 ) ) ( not ( = ?auto_1082014 ?auto_1082015 ) ) ( not ( = ?auto_1082014 ?auto_1082016 ) ) ( not ( = ?auto_1082014 ?auto_1082017 ) ) ( not ( = ?auto_1082014 ?auto_1082022 ) ) ( not ( = ?auto_1082014 ?auto_1082024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082015 ?auto_1082016 ?auto_1082017 )
      ( MAKE-8CRATE-VERIFY ?auto_1082009 ?auto_1082010 ?auto_1082011 ?auto_1082013 ?auto_1082012 ?auto_1082014 ?auto_1082015 ?auto_1082016 ?auto_1082017 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1082025 - SURFACE
      ?auto_1082026 - SURFACE
      ?auto_1082027 - SURFACE
      ?auto_1082029 - SURFACE
      ?auto_1082028 - SURFACE
      ?auto_1082030 - SURFACE
      ?auto_1082031 - SURFACE
      ?auto_1082032 - SURFACE
      ?auto_1082033 - SURFACE
      ?auto_1082034 - SURFACE
    )
    :vars
    (
      ?auto_1082035 - HOIST
      ?auto_1082037 - PLACE
      ?auto_1082040 - PLACE
      ?auto_1082038 - HOIST
      ?auto_1082039 - SURFACE
      ?auto_1082036 - TRUCK
      ?auto_1082041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082035 ?auto_1082037 ) ( IS-CRATE ?auto_1082034 ) ( not ( = ?auto_1082033 ?auto_1082034 ) ) ( not ( = ?auto_1082032 ?auto_1082033 ) ) ( not ( = ?auto_1082032 ?auto_1082034 ) ) ( not ( = ?auto_1082040 ?auto_1082037 ) ) ( HOIST-AT ?auto_1082038 ?auto_1082040 ) ( not ( = ?auto_1082035 ?auto_1082038 ) ) ( SURFACE-AT ?auto_1082034 ?auto_1082040 ) ( ON ?auto_1082034 ?auto_1082039 ) ( CLEAR ?auto_1082034 ) ( not ( = ?auto_1082033 ?auto_1082039 ) ) ( not ( = ?auto_1082034 ?auto_1082039 ) ) ( not ( = ?auto_1082032 ?auto_1082039 ) ) ( SURFACE-AT ?auto_1082032 ?auto_1082037 ) ( CLEAR ?auto_1082032 ) ( IS-CRATE ?auto_1082033 ) ( AVAILABLE ?auto_1082035 ) ( TRUCK-AT ?auto_1082036 ?auto_1082040 ) ( AVAILABLE ?auto_1082038 ) ( SURFACE-AT ?auto_1082033 ?auto_1082040 ) ( ON ?auto_1082033 ?auto_1082041 ) ( CLEAR ?auto_1082033 ) ( not ( = ?auto_1082033 ?auto_1082041 ) ) ( not ( = ?auto_1082034 ?auto_1082041 ) ) ( not ( = ?auto_1082032 ?auto_1082041 ) ) ( not ( = ?auto_1082039 ?auto_1082041 ) ) ( ON ?auto_1082026 ?auto_1082025 ) ( ON ?auto_1082027 ?auto_1082026 ) ( ON ?auto_1082029 ?auto_1082027 ) ( ON ?auto_1082028 ?auto_1082029 ) ( ON ?auto_1082030 ?auto_1082028 ) ( ON ?auto_1082031 ?auto_1082030 ) ( ON ?auto_1082032 ?auto_1082031 ) ( not ( = ?auto_1082025 ?auto_1082026 ) ) ( not ( = ?auto_1082025 ?auto_1082027 ) ) ( not ( = ?auto_1082025 ?auto_1082029 ) ) ( not ( = ?auto_1082025 ?auto_1082028 ) ) ( not ( = ?auto_1082025 ?auto_1082030 ) ) ( not ( = ?auto_1082025 ?auto_1082031 ) ) ( not ( = ?auto_1082025 ?auto_1082032 ) ) ( not ( = ?auto_1082025 ?auto_1082033 ) ) ( not ( = ?auto_1082025 ?auto_1082034 ) ) ( not ( = ?auto_1082025 ?auto_1082039 ) ) ( not ( = ?auto_1082025 ?auto_1082041 ) ) ( not ( = ?auto_1082026 ?auto_1082027 ) ) ( not ( = ?auto_1082026 ?auto_1082029 ) ) ( not ( = ?auto_1082026 ?auto_1082028 ) ) ( not ( = ?auto_1082026 ?auto_1082030 ) ) ( not ( = ?auto_1082026 ?auto_1082031 ) ) ( not ( = ?auto_1082026 ?auto_1082032 ) ) ( not ( = ?auto_1082026 ?auto_1082033 ) ) ( not ( = ?auto_1082026 ?auto_1082034 ) ) ( not ( = ?auto_1082026 ?auto_1082039 ) ) ( not ( = ?auto_1082026 ?auto_1082041 ) ) ( not ( = ?auto_1082027 ?auto_1082029 ) ) ( not ( = ?auto_1082027 ?auto_1082028 ) ) ( not ( = ?auto_1082027 ?auto_1082030 ) ) ( not ( = ?auto_1082027 ?auto_1082031 ) ) ( not ( = ?auto_1082027 ?auto_1082032 ) ) ( not ( = ?auto_1082027 ?auto_1082033 ) ) ( not ( = ?auto_1082027 ?auto_1082034 ) ) ( not ( = ?auto_1082027 ?auto_1082039 ) ) ( not ( = ?auto_1082027 ?auto_1082041 ) ) ( not ( = ?auto_1082029 ?auto_1082028 ) ) ( not ( = ?auto_1082029 ?auto_1082030 ) ) ( not ( = ?auto_1082029 ?auto_1082031 ) ) ( not ( = ?auto_1082029 ?auto_1082032 ) ) ( not ( = ?auto_1082029 ?auto_1082033 ) ) ( not ( = ?auto_1082029 ?auto_1082034 ) ) ( not ( = ?auto_1082029 ?auto_1082039 ) ) ( not ( = ?auto_1082029 ?auto_1082041 ) ) ( not ( = ?auto_1082028 ?auto_1082030 ) ) ( not ( = ?auto_1082028 ?auto_1082031 ) ) ( not ( = ?auto_1082028 ?auto_1082032 ) ) ( not ( = ?auto_1082028 ?auto_1082033 ) ) ( not ( = ?auto_1082028 ?auto_1082034 ) ) ( not ( = ?auto_1082028 ?auto_1082039 ) ) ( not ( = ?auto_1082028 ?auto_1082041 ) ) ( not ( = ?auto_1082030 ?auto_1082031 ) ) ( not ( = ?auto_1082030 ?auto_1082032 ) ) ( not ( = ?auto_1082030 ?auto_1082033 ) ) ( not ( = ?auto_1082030 ?auto_1082034 ) ) ( not ( = ?auto_1082030 ?auto_1082039 ) ) ( not ( = ?auto_1082030 ?auto_1082041 ) ) ( not ( = ?auto_1082031 ?auto_1082032 ) ) ( not ( = ?auto_1082031 ?auto_1082033 ) ) ( not ( = ?auto_1082031 ?auto_1082034 ) ) ( not ( = ?auto_1082031 ?auto_1082039 ) ) ( not ( = ?auto_1082031 ?auto_1082041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082032 ?auto_1082033 ?auto_1082034 )
      ( MAKE-9CRATE-VERIFY ?auto_1082025 ?auto_1082026 ?auto_1082027 ?auto_1082029 ?auto_1082028 ?auto_1082030 ?auto_1082031 ?auto_1082032 ?auto_1082033 ?auto_1082034 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1082042 - SURFACE
      ?auto_1082043 - SURFACE
      ?auto_1082044 - SURFACE
      ?auto_1082046 - SURFACE
      ?auto_1082045 - SURFACE
      ?auto_1082047 - SURFACE
      ?auto_1082048 - SURFACE
      ?auto_1082049 - SURFACE
      ?auto_1082050 - SURFACE
      ?auto_1082051 - SURFACE
      ?auto_1082052 - SURFACE
    )
    :vars
    (
      ?auto_1082053 - HOIST
      ?auto_1082055 - PLACE
      ?auto_1082058 - PLACE
      ?auto_1082056 - HOIST
      ?auto_1082057 - SURFACE
      ?auto_1082054 - TRUCK
      ?auto_1082059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082053 ?auto_1082055 ) ( IS-CRATE ?auto_1082052 ) ( not ( = ?auto_1082051 ?auto_1082052 ) ) ( not ( = ?auto_1082050 ?auto_1082051 ) ) ( not ( = ?auto_1082050 ?auto_1082052 ) ) ( not ( = ?auto_1082058 ?auto_1082055 ) ) ( HOIST-AT ?auto_1082056 ?auto_1082058 ) ( not ( = ?auto_1082053 ?auto_1082056 ) ) ( SURFACE-AT ?auto_1082052 ?auto_1082058 ) ( ON ?auto_1082052 ?auto_1082057 ) ( CLEAR ?auto_1082052 ) ( not ( = ?auto_1082051 ?auto_1082057 ) ) ( not ( = ?auto_1082052 ?auto_1082057 ) ) ( not ( = ?auto_1082050 ?auto_1082057 ) ) ( SURFACE-AT ?auto_1082050 ?auto_1082055 ) ( CLEAR ?auto_1082050 ) ( IS-CRATE ?auto_1082051 ) ( AVAILABLE ?auto_1082053 ) ( TRUCK-AT ?auto_1082054 ?auto_1082058 ) ( AVAILABLE ?auto_1082056 ) ( SURFACE-AT ?auto_1082051 ?auto_1082058 ) ( ON ?auto_1082051 ?auto_1082059 ) ( CLEAR ?auto_1082051 ) ( not ( = ?auto_1082051 ?auto_1082059 ) ) ( not ( = ?auto_1082052 ?auto_1082059 ) ) ( not ( = ?auto_1082050 ?auto_1082059 ) ) ( not ( = ?auto_1082057 ?auto_1082059 ) ) ( ON ?auto_1082043 ?auto_1082042 ) ( ON ?auto_1082044 ?auto_1082043 ) ( ON ?auto_1082046 ?auto_1082044 ) ( ON ?auto_1082045 ?auto_1082046 ) ( ON ?auto_1082047 ?auto_1082045 ) ( ON ?auto_1082048 ?auto_1082047 ) ( ON ?auto_1082049 ?auto_1082048 ) ( ON ?auto_1082050 ?auto_1082049 ) ( not ( = ?auto_1082042 ?auto_1082043 ) ) ( not ( = ?auto_1082042 ?auto_1082044 ) ) ( not ( = ?auto_1082042 ?auto_1082046 ) ) ( not ( = ?auto_1082042 ?auto_1082045 ) ) ( not ( = ?auto_1082042 ?auto_1082047 ) ) ( not ( = ?auto_1082042 ?auto_1082048 ) ) ( not ( = ?auto_1082042 ?auto_1082049 ) ) ( not ( = ?auto_1082042 ?auto_1082050 ) ) ( not ( = ?auto_1082042 ?auto_1082051 ) ) ( not ( = ?auto_1082042 ?auto_1082052 ) ) ( not ( = ?auto_1082042 ?auto_1082057 ) ) ( not ( = ?auto_1082042 ?auto_1082059 ) ) ( not ( = ?auto_1082043 ?auto_1082044 ) ) ( not ( = ?auto_1082043 ?auto_1082046 ) ) ( not ( = ?auto_1082043 ?auto_1082045 ) ) ( not ( = ?auto_1082043 ?auto_1082047 ) ) ( not ( = ?auto_1082043 ?auto_1082048 ) ) ( not ( = ?auto_1082043 ?auto_1082049 ) ) ( not ( = ?auto_1082043 ?auto_1082050 ) ) ( not ( = ?auto_1082043 ?auto_1082051 ) ) ( not ( = ?auto_1082043 ?auto_1082052 ) ) ( not ( = ?auto_1082043 ?auto_1082057 ) ) ( not ( = ?auto_1082043 ?auto_1082059 ) ) ( not ( = ?auto_1082044 ?auto_1082046 ) ) ( not ( = ?auto_1082044 ?auto_1082045 ) ) ( not ( = ?auto_1082044 ?auto_1082047 ) ) ( not ( = ?auto_1082044 ?auto_1082048 ) ) ( not ( = ?auto_1082044 ?auto_1082049 ) ) ( not ( = ?auto_1082044 ?auto_1082050 ) ) ( not ( = ?auto_1082044 ?auto_1082051 ) ) ( not ( = ?auto_1082044 ?auto_1082052 ) ) ( not ( = ?auto_1082044 ?auto_1082057 ) ) ( not ( = ?auto_1082044 ?auto_1082059 ) ) ( not ( = ?auto_1082046 ?auto_1082045 ) ) ( not ( = ?auto_1082046 ?auto_1082047 ) ) ( not ( = ?auto_1082046 ?auto_1082048 ) ) ( not ( = ?auto_1082046 ?auto_1082049 ) ) ( not ( = ?auto_1082046 ?auto_1082050 ) ) ( not ( = ?auto_1082046 ?auto_1082051 ) ) ( not ( = ?auto_1082046 ?auto_1082052 ) ) ( not ( = ?auto_1082046 ?auto_1082057 ) ) ( not ( = ?auto_1082046 ?auto_1082059 ) ) ( not ( = ?auto_1082045 ?auto_1082047 ) ) ( not ( = ?auto_1082045 ?auto_1082048 ) ) ( not ( = ?auto_1082045 ?auto_1082049 ) ) ( not ( = ?auto_1082045 ?auto_1082050 ) ) ( not ( = ?auto_1082045 ?auto_1082051 ) ) ( not ( = ?auto_1082045 ?auto_1082052 ) ) ( not ( = ?auto_1082045 ?auto_1082057 ) ) ( not ( = ?auto_1082045 ?auto_1082059 ) ) ( not ( = ?auto_1082047 ?auto_1082048 ) ) ( not ( = ?auto_1082047 ?auto_1082049 ) ) ( not ( = ?auto_1082047 ?auto_1082050 ) ) ( not ( = ?auto_1082047 ?auto_1082051 ) ) ( not ( = ?auto_1082047 ?auto_1082052 ) ) ( not ( = ?auto_1082047 ?auto_1082057 ) ) ( not ( = ?auto_1082047 ?auto_1082059 ) ) ( not ( = ?auto_1082048 ?auto_1082049 ) ) ( not ( = ?auto_1082048 ?auto_1082050 ) ) ( not ( = ?auto_1082048 ?auto_1082051 ) ) ( not ( = ?auto_1082048 ?auto_1082052 ) ) ( not ( = ?auto_1082048 ?auto_1082057 ) ) ( not ( = ?auto_1082048 ?auto_1082059 ) ) ( not ( = ?auto_1082049 ?auto_1082050 ) ) ( not ( = ?auto_1082049 ?auto_1082051 ) ) ( not ( = ?auto_1082049 ?auto_1082052 ) ) ( not ( = ?auto_1082049 ?auto_1082057 ) ) ( not ( = ?auto_1082049 ?auto_1082059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082050 ?auto_1082051 ?auto_1082052 )
      ( MAKE-10CRATE-VERIFY ?auto_1082042 ?auto_1082043 ?auto_1082044 ?auto_1082046 ?auto_1082045 ?auto_1082047 ?auto_1082048 ?auto_1082049 ?auto_1082050 ?auto_1082051 ?auto_1082052 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1082060 - SURFACE
      ?auto_1082061 - SURFACE
      ?auto_1082062 - SURFACE
      ?auto_1082064 - SURFACE
      ?auto_1082063 - SURFACE
      ?auto_1082065 - SURFACE
      ?auto_1082066 - SURFACE
      ?auto_1082067 - SURFACE
      ?auto_1082068 - SURFACE
      ?auto_1082069 - SURFACE
      ?auto_1082070 - SURFACE
      ?auto_1082071 - SURFACE
    )
    :vars
    (
      ?auto_1082072 - HOIST
      ?auto_1082074 - PLACE
      ?auto_1082077 - PLACE
      ?auto_1082075 - HOIST
      ?auto_1082076 - SURFACE
      ?auto_1082073 - TRUCK
      ?auto_1082078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082072 ?auto_1082074 ) ( IS-CRATE ?auto_1082071 ) ( not ( = ?auto_1082070 ?auto_1082071 ) ) ( not ( = ?auto_1082069 ?auto_1082070 ) ) ( not ( = ?auto_1082069 ?auto_1082071 ) ) ( not ( = ?auto_1082077 ?auto_1082074 ) ) ( HOIST-AT ?auto_1082075 ?auto_1082077 ) ( not ( = ?auto_1082072 ?auto_1082075 ) ) ( SURFACE-AT ?auto_1082071 ?auto_1082077 ) ( ON ?auto_1082071 ?auto_1082076 ) ( CLEAR ?auto_1082071 ) ( not ( = ?auto_1082070 ?auto_1082076 ) ) ( not ( = ?auto_1082071 ?auto_1082076 ) ) ( not ( = ?auto_1082069 ?auto_1082076 ) ) ( SURFACE-AT ?auto_1082069 ?auto_1082074 ) ( CLEAR ?auto_1082069 ) ( IS-CRATE ?auto_1082070 ) ( AVAILABLE ?auto_1082072 ) ( TRUCK-AT ?auto_1082073 ?auto_1082077 ) ( AVAILABLE ?auto_1082075 ) ( SURFACE-AT ?auto_1082070 ?auto_1082077 ) ( ON ?auto_1082070 ?auto_1082078 ) ( CLEAR ?auto_1082070 ) ( not ( = ?auto_1082070 ?auto_1082078 ) ) ( not ( = ?auto_1082071 ?auto_1082078 ) ) ( not ( = ?auto_1082069 ?auto_1082078 ) ) ( not ( = ?auto_1082076 ?auto_1082078 ) ) ( ON ?auto_1082061 ?auto_1082060 ) ( ON ?auto_1082062 ?auto_1082061 ) ( ON ?auto_1082064 ?auto_1082062 ) ( ON ?auto_1082063 ?auto_1082064 ) ( ON ?auto_1082065 ?auto_1082063 ) ( ON ?auto_1082066 ?auto_1082065 ) ( ON ?auto_1082067 ?auto_1082066 ) ( ON ?auto_1082068 ?auto_1082067 ) ( ON ?auto_1082069 ?auto_1082068 ) ( not ( = ?auto_1082060 ?auto_1082061 ) ) ( not ( = ?auto_1082060 ?auto_1082062 ) ) ( not ( = ?auto_1082060 ?auto_1082064 ) ) ( not ( = ?auto_1082060 ?auto_1082063 ) ) ( not ( = ?auto_1082060 ?auto_1082065 ) ) ( not ( = ?auto_1082060 ?auto_1082066 ) ) ( not ( = ?auto_1082060 ?auto_1082067 ) ) ( not ( = ?auto_1082060 ?auto_1082068 ) ) ( not ( = ?auto_1082060 ?auto_1082069 ) ) ( not ( = ?auto_1082060 ?auto_1082070 ) ) ( not ( = ?auto_1082060 ?auto_1082071 ) ) ( not ( = ?auto_1082060 ?auto_1082076 ) ) ( not ( = ?auto_1082060 ?auto_1082078 ) ) ( not ( = ?auto_1082061 ?auto_1082062 ) ) ( not ( = ?auto_1082061 ?auto_1082064 ) ) ( not ( = ?auto_1082061 ?auto_1082063 ) ) ( not ( = ?auto_1082061 ?auto_1082065 ) ) ( not ( = ?auto_1082061 ?auto_1082066 ) ) ( not ( = ?auto_1082061 ?auto_1082067 ) ) ( not ( = ?auto_1082061 ?auto_1082068 ) ) ( not ( = ?auto_1082061 ?auto_1082069 ) ) ( not ( = ?auto_1082061 ?auto_1082070 ) ) ( not ( = ?auto_1082061 ?auto_1082071 ) ) ( not ( = ?auto_1082061 ?auto_1082076 ) ) ( not ( = ?auto_1082061 ?auto_1082078 ) ) ( not ( = ?auto_1082062 ?auto_1082064 ) ) ( not ( = ?auto_1082062 ?auto_1082063 ) ) ( not ( = ?auto_1082062 ?auto_1082065 ) ) ( not ( = ?auto_1082062 ?auto_1082066 ) ) ( not ( = ?auto_1082062 ?auto_1082067 ) ) ( not ( = ?auto_1082062 ?auto_1082068 ) ) ( not ( = ?auto_1082062 ?auto_1082069 ) ) ( not ( = ?auto_1082062 ?auto_1082070 ) ) ( not ( = ?auto_1082062 ?auto_1082071 ) ) ( not ( = ?auto_1082062 ?auto_1082076 ) ) ( not ( = ?auto_1082062 ?auto_1082078 ) ) ( not ( = ?auto_1082064 ?auto_1082063 ) ) ( not ( = ?auto_1082064 ?auto_1082065 ) ) ( not ( = ?auto_1082064 ?auto_1082066 ) ) ( not ( = ?auto_1082064 ?auto_1082067 ) ) ( not ( = ?auto_1082064 ?auto_1082068 ) ) ( not ( = ?auto_1082064 ?auto_1082069 ) ) ( not ( = ?auto_1082064 ?auto_1082070 ) ) ( not ( = ?auto_1082064 ?auto_1082071 ) ) ( not ( = ?auto_1082064 ?auto_1082076 ) ) ( not ( = ?auto_1082064 ?auto_1082078 ) ) ( not ( = ?auto_1082063 ?auto_1082065 ) ) ( not ( = ?auto_1082063 ?auto_1082066 ) ) ( not ( = ?auto_1082063 ?auto_1082067 ) ) ( not ( = ?auto_1082063 ?auto_1082068 ) ) ( not ( = ?auto_1082063 ?auto_1082069 ) ) ( not ( = ?auto_1082063 ?auto_1082070 ) ) ( not ( = ?auto_1082063 ?auto_1082071 ) ) ( not ( = ?auto_1082063 ?auto_1082076 ) ) ( not ( = ?auto_1082063 ?auto_1082078 ) ) ( not ( = ?auto_1082065 ?auto_1082066 ) ) ( not ( = ?auto_1082065 ?auto_1082067 ) ) ( not ( = ?auto_1082065 ?auto_1082068 ) ) ( not ( = ?auto_1082065 ?auto_1082069 ) ) ( not ( = ?auto_1082065 ?auto_1082070 ) ) ( not ( = ?auto_1082065 ?auto_1082071 ) ) ( not ( = ?auto_1082065 ?auto_1082076 ) ) ( not ( = ?auto_1082065 ?auto_1082078 ) ) ( not ( = ?auto_1082066 ?auto_1082067 ) ) ( not ( = ?auto_1082066 ?auto_1082068 ) ) ( not ( = ?auto_1082066 ?auto_1082069 ) ) ( not ( = ?auto_1082066 ?auto_1082070 ) ) ( not ( = ?auto_1082066 ?auto_1082071 ) ) ( not ( = ?auto_1082066 ?auto_1082076 ) ) ( not ( = ?auto_1082066 ?auto_1082078 ) ) ( not ( = ?auto_1082067 ?auto_1082068 ) ) ( not ( = ?auto_1082067 ?auto_1082069 ) ) ( not ( = ?auto_1082067 ?auto_1082070 ) ) ( not ( = ?auto_1082067 ?auto_1082071 ) ) ( not ( = ?auto_1082067 ?auto_1082076 ) ) ( not ( = ?auto_1082067 ?auto_1082078 ) ) ( not ( = ?auto_1082068 ?auto_1082069 ) ) ( not ( = ?auto_1082068 ?auto_1082070 ) ) ( not ( = ?auto_1082068 ?auto_1082071 ) ) ( not ( = ?auto_1082068 ?auto_1082076 ) ) ( not ( = ?auto_1082068 ?auto_1082078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082069 ?auto_1082070 ?auto_1082071 )
      ( MAKE-11CRATE-VERIFY ?auto_1082060 ?auto_1082061 ?auto_1082062 ?auto_1082064 ?auto_1082063 ?auto_1082065 ?auto_1082066 ?auto_1082067 ?auto_1082068 ?auto_1082069 ?auto_1082070 ?auto_1082071 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1082079 - SURFACE
      ?auto_1082080 - SURFACE
      ?auto_1082081 - SURFACE
      ?auto_1082083 - SURFACE
      ?auto_1082082 - SURFACE
      ?auto_1082084 - SURFACE
      ?auto_1082085 - SURFACE
      ?auto_1082086 - SURFACE
      ?auto_1082087 - SURFACE
      ?auto_1082088 - SURFACE
      ?auto_1082089 - SURFACE
      ?auto_1082090 - SURFACE
      ?auto_1082091 - SURFACE
    )
    :vars
    (
      ?auto_1082092 - HOIST
      ?auto_1082094 - PLACE
      ?auto_1082097 - PLACE
      ?auto_1082095 - HOIST
      ?auto_1082096 - SURFACE
      ?auto_1082093 - TRUCK
      ?auto_1082098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082092 ?auto_1082094 ) ( IS-CRATE ?auto_1082091 ) ( not ( = ?auto_1082090 ?auto_1082091 ) ) ( not ( = ?auto_1082089 ?auto_1082090 ) ) ( not ( = ?auto_1082089 ?auto_1082091 ) ) ( not ( = ?auto_1082097 ?auto_1082094 ) ) ( HOIST-AT ?auto_1082095 ?auto_1082097 ) ( not ( = ?auto_1082092 ?auto_1082095 ) ) ( SURFACE-AT ?auto_1082091 ?auto_1082097 ) ( ON ?auto_1082091 ?auto_1082096 ) ( CLEAR ?auto_1082091 ) ( not ( = ?auto_1082090 ?auto_1082096 ) ) ( not ( = ?auto_1082091 ?auto_1082096 ) ) ( not ( = ?auto_1082089 ?auto_1082096 ) ) ( SURFACE-AT ?auto_1082089 ?auto_1082094 ) ( CLEAR ?auto_1082089 ) ( IS-CRATE ?auto_1082090 ) ( AVAILABLE ?auto_1082092 ) ( TRUCK-AT ?auto_1082093 ?auto_1082097 ) ( AVAILABLE ?auto_1082095 ) ( SURFACE-AT ?auto_1082090 ?auto_1082097 ) ( ON ?auto_1082090 ?auto_1082098 ) ( CLEAR ?auto_1082090 ) ( not ( = ?auto_1082090 ?auto_1082098 ) ) ( not ( = ?auto_1082091 ?auto_1082098 ) ) ( not ( = ?auto_1082089 ?auto_1082098 ) ) ( not ( = ?auto_1082096 ?auto_1082098 ) ) ( ON ?auto_1082080 ?auto_1082079 ) ( ON ?auto_1082081 ?auto_1082080 ) ( ON ?auto_1082083 ?auto_1082081 ) ( ON ?auto_1082082 ?auto_1082083 ) ( ON ?auto_1082084 ?auto_1082082 ) ( ON ?auto_1082085 ?auto_1082084 ) ( ON ?auto_1082086 ?auto_1082085 ) ( ON ?auto_1082087 ?auto_1082086 ) ( ON ?auto_1082088 ?auto_1082087 ) ( ON ?auto_1082089 ?auto_1082088 ) ( not ( = ?auto_1082079 ?auto_1082080 ) ) ( not ( = ?auto_1082079 ?auto_1082081 ) ) ( not ( = ?auto_1082079 ?auto_1082083 ) ) ( not ( = ?auto_1082079 ?auto_1082082 ) ) ( not ( = ?auto_1082079 ?auto_1082084 ) ) ( not ( = ?auto_1082079 ?auto_1082085 ) ) ( not ( = ?auto_1082079 ?auto_1082086 ) ) ( not ( = ?auto_1082079 ?auto_1082087 ) ) ( not ( = ?auto_1082079 ?auto_1082088 ) ) ( not ( = ?auto_1082079 ?auto_1082089 ) ) ( not ( = ?auto_1082079 ?auto_1082090 ) ) ( not ( = ?auto_1082079 ?auto_1082091 ) ) ( not ( = ?auto_1082079 ?auto_1082096 ) ) ( not ( = ?auto_1082079 ?auto_1082098 ) ) ( not ( = ?auto_1082080 ?auto_1082081 ) ) ( not ( = ?auto_1082080 ?auto_1082083 ) ) ( not ( = ?auto_1082080 ?auto_1082082 ) ) ( not ( = ?auto_1082080 ?auto_1082084 ) ) ( not ( = ?auto_1082080 ?auto_1082085 ) ) ( not ( = ?auto_1082080 ?auto_1082086 ) ) ( not ( = ?auto_1082080 ?auto_1082087 ) ) ( not ( = ?auto_1082080 ?auto_1082088 ) ) ( not ( = ?auto_1082080 ?auto_1082089 ) ) ( not ( = ?auto_1082080 ?auto_1082090 ) ) ( not ( = ?auto_1082080 ?auto_1082091 ) ) ( not ( = ?auto_1082080 ?auto_1082096 ) ) ( not ( = ?auto_1082080 ?auto_1082098 ) ) ( not ( = ?auto_1082081 ?auto_1082083 ) ) ( not ( = ?auto_1082081 ?auto_1082082 ) ) ( not ( = ?auto_1082081 ?auto_1082084 ) ) ( not ( = ?auto_1082081 ?auto_1082085 ) ) ( not ( = ?auto_1082081 ?auto_1082086 ) ) ( not ( = ?auto_1082081 ?auto_1082087 ) ) ( not ( = ?auto_1082081 ?auto_1082088 ) ) ( not ( = ?auto_1082081 ?auto_1082089 ) ) ( not ( = ?auto_1082081 ?auto_1082090 ) ) ( not ( = ?auto_1082081 ?auto_1082091 ) ) ( not ( = ?auto_1082081 ?auto_1082096 ) ) ( not ( = ?auto_1082081 ?auto_1082098 ) ) ( not ( = ?auto_1082083 ?auto_1082082 ) ) ( not ( = ?auto_1082083 ?auto_1082084 ) ) ( not ( = ?auto_1082083 ?auto_1082085 ) ) ( not ( = ?auto_1082083 ?auto_1082086 ) ) ( not ( = ?auto_1082083 ?auto_1082087 ) ) ( not ( = ?auto_1082083 ?auto_1082088 ) ) ( not ( = ?auto_1082083 ?auto_1082089 ) ) ( not ( = ?auto_1082083 ?auto_1082090 ) ) ( not ( = ?auto_1082083 ?auto_1082091 ) ) ( not ( = ?auto_1082083 ?auto_1082096 ) ) ( not ( = ?auto_1082083 ?auto_1082098 ) ) ( not ( = ?auto_1082082 ?auto_1082084 ) ) ( not ( = ?auto_1082082 ?auto_1082085 ) ) ( not ( = ?auto_1082082 ?auto_1082086 ) ) ( not ( = ?auto_1082082 ?auto_1082087 ) ) ( not ( = ?auto_1082082 ?auto_1082088 ) ) ( not ( = ?auto_1082082 ?auto_1082089 ) ) ( not ( = ?auto_1082082 ?auto_1082090 ) ) ( not ( = ?auto_1082082 ?auto_1082091 ) ) ( not ( = ?auto_1082082 ?auto_1082096 ) ) ( not ( = ?auto_1082082 ?auto_1082098 ) ) ( not ( = ?auto_1082084 ?auto_1082085 ) ) ( not ( = ?auto_1082084 ?auto_1082086 ) ) ( not ( = ?auto_1082084 ?auto_1082087 ) ) ( not ( = ?auto_1082084 ?auto_1082088 ) ) ( not ( = ?auto_1082084 ?auto_1082089 ) ) ( not ( = ?auto_1082084 ?auto_1082090 ) ) ( not ( = ?auto_1082084 ?auto_1082091 ) ) ( not ( = ?auto_1082084 ?auto_1082096 ) ) ( not ( = ?auto_1082084 ?auto_1082098 ) ) ( not ( = ?auto_1082085 ?auto_1082086 ) ) ( not ( = ?auto_1082085 ?auto_1082087 ) ) ( not ( = ?auto_1082085 ?auto_1082088 ) ) ( not ( = ?auto_1082085 ?auto_1082089 ) ) ( not ( = ?auto_1082085 ?auto_1082090 ) ) ( not ( = ?auto_1082085 ?auto_1082091 ) ) ( not ( = ?auto_1082085 ?auto_1082096 ) ) ( not ( = ?auto_1082085 ?auto_1082098 ) ) ( not ( = ?auto_1082086 ?auto_1082087 ) ) ( not ( = ?auto_1082086 ?auto_1082088 ) ) ( not ( = ?auto_1082086 ?auto_1082089 ) ) ( not ( = ?auto_1082086 ?auto_1082090 ) ) ( not ( = ?auto_1082086 ?auto_1082091 ) ) ( not ( = ?auto_1082086 ?auto_1082096 ) ) ( not ( = ?auto_1082086 ?auto_1082098 ) ) ( not ( = ?auto_1082087 ?auto_1082088 ) ) ( not ( = ?auto_1082087 ?auto_1082089 ) ) ( not ( = ?auto_1082087 ?auto_1082090 ) ) ( not ( = ?auto_1082087 ?auto_1082091 ) ) ( not ( = ?auto_1082087 ?auto_1082096 ) ) ( not ( = ?auto_1082087 ?auto_1082098 ) ) ( not ( = ?auto_1082088 ?auto_1082089 ) ) ( not ( = ?auto_1082088 ?auto_1082090 ) ) ( not ( = ?auto_1082088 ?auto_1082091 ) ) ( not ( = ?auto_1082088 ?auto_1082096 ) ) ( not ( = ?auto_1082088 ?auto_1082098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082089 ?auto_1082090 ?auto_1082091 )
      ( MAKE-12CRATE-VERIFY ?auto_1082079 ?auto_1082080 ?auto_1082081 ?auto_1082083 ?auto_1082082 ?auto_1082084 ?auto_1082085 ?auto_1082086 ?auto_1082087 ?auto_1082088 ?auto_1082089 ?auto_1082090 ?auto_1082091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1082099 - SURFACE
      ?auto_1082100 - SURFACE
    )
    :vars
    (
      ?auto_1082101 - HOIST
      ?auto_1082103 - PLACE
      ?auto_1082104 - SURFACE
      ?auto_1082107 - PLACE
      ?auto_1082105 - HOIST
      ?auto_1082106 - SURFACE
      ?auto_1082108 - SURFACE
      ?auto_1082102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082101 ?auto_1082103 ) ( IS-CRATE ?auto_1082100 ) ( not ( = ?auto_1082099 ?auto_1082100 ) ) ( not ( = ?auto_1082104 ?auto_1082099 ) ) ( not ( = ?auto_1082104 ?auto_1082100 ) ) ( not ( = ?auto_1082107 ?auto_1082103 ) ) ( HOIST-AT ?auto_1082105 ?auto_1082107 ) ( not ( = ?auto_1082101 ?auto_1082105 ) ) ( SURFACE-AT ?auto_1082100 ?auto_1082107 ) ( ON ?auto_1082100 ?auto_1082106 ) ( CLEAR ?auto_1082100 ) ( not ( = ?auto_1082099 ?auto_1082106 ) ) ( not ( = ?auto_1082100 ?auto_1082106 ) ) ( not ( = ?auto_1082104 ?auto_1082106 ) ) ( SURFACE-AT ?auto_1082104 ?auto_1082103 ) ( CLEAR ?auto_1082104 ) ( IS-CRATE ?auto_1082099 ) ( AVAILABLE ?auto_1082101 ) ( AVAILABLE ?auto_1082105 ) ( SURFACE-AT ?auto_1082099 ?auto_1082107 ) ( ON ?auto_1082099 ?auto_1082108 ) ( CLEAR ?auto_1082099 ) ( not ( = ?auto_1082099 ?auto_1082108 ) ) ( not ( = ?auto_1082100 ?auto_1082108 ) ) ( not ( = ?auto_1082104 ?auto_1082108 ) ) ( not ( = ?auto_1082106 ?auto_1082108 ) ) ( TRUCK-AT ?auto_1082102 ?auto_1082103 ) )
    :subtasks
    ( ( !DRIVE ?auto_1082102 ?auto_1082103 ?auto_1082107 )
      ( MAKE-2CRATE ?auto_1082104 ?auto_1082099 ?auto_1082100 )
      ( MAKE-1CRATE-VERIFY ?auto_1082099 ?auto_1082100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1082109 - SURFACE
      ?auto_1082110 - SURFACE
      ?auto_1082111 - SURFACE
    )
    :vars
    (
      ?auto_1082112 - HOIST
      ?auto_1082113 - PLACE
      ?auto_1082114 - PLACE
      ?auto_1082115 - HOIST
      ?auto_1082117 - SURFACE
      ?auto_1082118 - SURFACE
      ?auto_1082116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082112 ?auto_1082113 ) ( IS-CRATE ?auto_1082111 ) ( not ( = ?auto_1082110 ?auto_1082111 ) ) ( not ( = ?auto_1082109 ?auto_1082110 ) ) ( not ( = ?auto_1082109 ?auto_1082111 ) ) ( not ( = ?auto_1082114 ?auto_1082113 ) ) ( HOIST-AT ?auto_1082115 ?auto_1082114 ) ( not ( = ?auto_1082112 ?auto_1082115 ) ) ( SURFACE-AT ?auto_1082111 ?auto_1082114 ) ( ON ?auto_1082111 ?auto_1082117 ) ( CLEAR ?auto_1082111 ) ( not ( = ?auto_1082110 ?auto_1082117 ) ) ( not ( = ?auto_1082111 ?auto_1082117 ) ) ( not ( = ?auto_1082109 ?auto_1082117 ) ) ( SURFACE-AT ?auto_1082109 ?auto_1082113 ) ( CLEAR ?auto_1082109 ) ( IS-CRATE ?auto_1082110 ) ( AVAILABLE ?auto_1082112 ) ( AVAILABLE ?auto_1082115 ) ( SURFACE-AT ?auto_1082110 ?auto_1082114 ) ( ON ?auto_1082110 ?auto_1082118 ) ( CLEAR ?auto_1082110 ) ( not ( = ?auto_1082110 ?auto_1082118 ) ) ( not ( = ?auto_1082111 ?auto_1082118 ) ) ( not ( = ?auto_1082109 ?auto_1082118 ) ) ( not ( = ?auto_1082117 ?auto_1082118 ) ) ( TRUCK-AT ?auto_1082116 ?auto_1082113 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1082110 ?auto_1082111 )
      ( MAKE-2CRATE-VERIFY ?auto_1082109 ?auto_1082110 ?auto_1082111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1082119 - SURFACE
      ?auto_1082120 - SURFACE
      ?auto_1082121 - SURFACE
      ?auto_1082122 - SURFACE
    )
    :vars
    (
      ?auto_1082125 - HOIST
      ?auto_1082123 - PLACE
      ?auto_1082129 - PLACE
      ?auto_1082126 - HOIST
      ?auto_1082127 - SURFACE
      ?auto_1082124 - SURFACE
      ?auto_1082128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082125 ?auto_1082123 ) ( IS-CRATE ?auto_1082122 ) ( not ( = ?auto_1082121 ?auto_1082122 ) ) ( not ( = ?auto_1082120 ?auto_1082121 ) ) ( not ( = ?auto_1082120 ?auto_1082122 ) ) ( not ( = ?auto_1082129 ?auto_1082123 ) ) ( HOIST-AT ?auto_1082126 ?auto_1082129 ) ( not ( = ?auto_1082125 ?auto_1082126 ) ) ( SURFACE-AT ?auto_1082122 ?auto_1082129 ) ( ON ?auto_1082122 ?auto_1082127 ) ( CLEAR ?auto_1082122 ) ( not ( = ?auto_1082121 ?auto_1082127 ) ) ( not ( = ?auto_1082122 ?auto_1082127 ) ) ( not ( = ?auto_1082120 ?auto_1082127 ) ) ( SURFACE-AT ?auto_1082120 ?auto_1082123 ) ( CLEAR ?auto_1082120 ) ( IS-CRATE ?auto_1082121 ) ( AVAILABLE ?auto_1082125 ) ( AVAILABLE ?auto_1082126 ) ( SURFACE-AT ?auto_1082121 ?auto_1082129 ) ( ON ?auto_1082121 ?auto_1082124 ) ( CLEAR ?auto_1082121 ) ( not ( = ?auto_1082121 ?auto_1082124 ) ) ( not ( = ?auto_1082122 ?auto_1082124 ) ) ( not ( = ?auto_1082120 ?auto_1082124 ) ) ( not ( = ?auto_1082127 ?auto_1082124 ) ) ( TRUCK-AT ?auto_1082128 ?auto_1082123 ) ( ON ?auto_1082120 ?auto_1082119 ) ( not ( = ?auto_1082119 ?auto_1082120 ) ) ( not ( = ?auto_1082119 ?auto_1082121 ) ) ( not ( = ?auto_1082119 ?auto_1082122 ) ) ( not ( = ?auto_1082119 ?auto_1082127 ) ) ( not ( = ?auto_1082119 ?auto_1082124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082120 ?auto_1082121 ?auto_1082122 )
      ( MAKE-3CRATE-VERIFY ?auto_1082119 ?auto_1082120 ?auto_1082121 ?auto_1082122 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1082130 - SURFACE
      ?auto_1082131 - SURFACE
      ?auto_1082132 - SURFACE
      ?auto_1082134 - SURFACE
      ?auto_1082133 - SURFACE
    )
    :vars
    (
      ?auto_1082137 - HOIST
      ?auto_1082135 - PLACE
      ?auto_1082141 - PLACE
      ?auto_1082138 - HOIST
      ?auto_1082139 - SURFACE
      ?auto_1082136 - SURFACE
      ?auto_1082140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082137 ?auto_1082135 ) ( IS-CRATE ?auto_1082133 ) ( not ( = ?auto_1082134 ?auto_1082133 ) ) ( not ( = ?auto_1082132 ?auto_1082134 ) ) ( not ( = ?auto_1082132 ?auto_1082133 ) ) ( not ( = ?auto_1082141 ?auto_1082135 ) ) ( HOIST-AT ?auto_1082138 ?auto_1082141 ) ( not ( = ?auto_1082137 ?auto_1082138 ) ) ( SURFACE-AT ?auto_1082133 ?auto_1082141 ) ( ON ?auto_1082133 ?auto_1082139 ) ( CLEAR ?auto_1082133 ) ( not ( = ?auto_1082134 ?auto_1082139 ) ) ( not ( = ?auto_1082133 ?auto_1082139 ) ) ( not ( = ?auto_1082132 ?auto_1082139 ) ) ( SURFACE-AT ?auto_1082132 ?auto_1082135 ) ( CLEAR ?auto_1082132 ) ( IS-CRATE ?auto_1082134 ) ( AVAILABLE ?auto_1082137 ) ( AVAILABLE ?auto_1082138 ) ( SURFACE-AT ?auto_1082134 ?auto_1082141 ) ( ON ?auto_1082134 ?auto_1082136 ) ( CLEAR ?auto_1082134 ) ( not ( = ?auto_1082134 ?auto_1082136 ) ) ( not ( = ?auto_1082133 ?auto_1082136 ) ) ( not ( = ?auto_1082132 ?auto_1082136 ) ) ( not ( = ?auto_1082139 ?auto_1082136 ) ) ( TRUCK-AT ?auto_1082140 ?auto_1082135 ) ( ON ?auto_1082131 ?auto_1082130 ) ( ON ?auto_1082132 ?auto_1082131 ) ( not ( = ?auto_1082130 ?auto_1082131 ) ) ( not ( = ?auto_1082130 ?auto_1082132 ) ) ( not ( = ?auto_1082130 ?auto_1082134 ) ) ( not ( = ?auto_1082130 ?auto_1082133 ) ) ( not ( = ?auto_1082130 ?auto_1082139 ) ) ( not ( = ?auto_1082130 ?auto_1082136 ) ) ( not ( = ?auto_1082131 ?auto_1082132 ) ) ( not ( = ?auto_1082131 ?auto_1082134 ) ) ( not ( = ?auto_1082131 ?auto_1082133 ) ) ( not ( = ?auto_1082131 ?auto_1082139 ) ) ( not ( = ?auto_1082131 ?auto_1082136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082132 ?auto_1082134 ?auto_1082133 )
      ( MAKE-4CRATE-VERIFY ?auto_1082130 ?auto_1082131 ?auto_1082132 ?auto_1082134 ?auto_1082133 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1082142 - SURFACE
      ?auto_1082143 - SURFACE
      ?auto_1082144 - SURFACE
      ?auto_1082146 - SURFACE
      ?auto_1082145 - SURFACE
      ?auto_1082147 - SURFACE
    )
    :vars
    (
      ?auto_1082150 - HOIST
      ?auto_1082148 - PLACE
      ?auto_1082154 - PLACE
      ?auto_1082151 - HOIST
      ?auto_1082152 - SURFACE
      ?auto_1082149 - SURFACE
      ?auto_1082153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082150 ?auto_1082148 ) ( IS-CRATE ?auto_1082147 ) ( not ( = ?auto_1082145 ?auto_1082147 ) ) ( not ( = ?auto_1082146 ?auto_1082145 ) ) ( not ( = ?auto_1082146 ?auto_1082147 ) ) ( not ( = ?auto_1082154 ?auto_1082148 ) ) ( HOIST-AT ?auto_1082151 ?auto_1082154 ) ( not ( = ?auto_1082150 ?auto_1082151 ) ) ( SURFACE-AT ?auto_1082147 ?auto_1082154 ) ( ON ?auto_1082147 ?auto_1082152 ) ( CLEAR ?auto_1082147 ) ( not ( = ?auto_1082145 ?auto_1082152 ) ) ( not ( = ?auto_1082147 ?auto_1082152 ) ) ( not ( = ?auto_1082146 ?auto_1082152 ) ) ( SURFACE-AT ?auto_1082146 ?auto_1082148 ) ( CLEAR ?auto_1082146 ) ( IS-CRATE ?auto_1082145 ) ( AVAILABLE ?auto_1082150 ) ( AVAILABLE ?auto_1082151 ) ( SURFACE-AT ?auto_1082145 ?auto_1082154 ) ( ON ?auto_1082145 ?auto_1082149 ) ( CLEAR ?auto_1082145 ) ( not ( = ?auto_1082145 ?auto_1082149 ) ) ( not ( = ?auto_1082147 ?auto_1082149 ) ) ( not ( = ?auto_1082146 ?auto_1082149 ) ) ( not ( = ?auto_1082152 ?auto_1082149 ) ) ( TRUCK-AT ?auto_1082153 ?auto_1082148 ) ( ON ?auto_1082143 ?auto_1082142 ) ( ON ?auto_1082144 ?auto_1082143 ) ( ON ?auto_1082146 ?auto_1082144 ) ( not ( = ?auto_1082142 ?auto_1082143 ) ) ( not ( = ?auto_1082142 ?auto_1082144 ) ) ( not ( = ?auto_1082142 ?auto_1082146 ) ) ( not ( = ?auto_1082142 ?auto_1082145 ) ) ( not ( = ?auto_1082142 ?auto_1082147 ) ) ( not ( = ?auto_1082142 ?auto_1082152 ) ) ( not ( = ?auto_1082142 ?auto_1082149 ) ) ( not ( = ?auto_1082143 ?auto_1082144 ) ) ( not ( = ?auto_1082143 ?auto_1082146 ) ) ( not ( = ?auto_1082143 ?auto_1082145 ) ) ( not ( = ?auto_1082143 ?auto_1082147 ) ) ( not ( = ?auto_1082143 ?auto_1082152 ) ) ( not ( = ?auto_1082143 ?auto_1082149 ) ) ( not ( = ?auto_1082144 ?auto_1082146 ) ) ( not ( = ?auto_1082144 ?auto_1082145 ) ) ( not ( = ?auto_1082144 ?auto_1082147 ) ) ( not ( = ?auto_1082144 ?auto_1082152 ) ) ( not ( = ?auto_1082144 ?auto_1082149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082146 ?auto_1082145 ?auto_1082147 )
      ( MAKE-5CRATE-VERIFY ?auto_1082142 ?auto_1082143 ?auto_1082144 ?auto_1082146 ?auto_1082145 ?auto_1082147 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1082155 - SURFACE
      ?auto_1082156 - SURFACE
      ?auto_1082157 - SURFACE
      ?auto_1082159 - SURFACE
      ?auto_1082158 - SURFACE
      ?auto_1082160 - SURFACE
      ?auto_1082161 - SURFACE
    )
    :vars
    (
      ?auto_1082164 - HOIST
      ?auto_1082162 - PLACE
      ?auto_1082168 - PLACE
      ?auto_1082165 - HOIST
      ?auto_1082166 - SURFACE
      ?auto_1082163 - SURFACE
      ?auto_1082167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082164 ?auto_1082162 ) ( IS-CRATE ?auto_1082161 ) ( not ( = ?auto_1082160 ?auto_1082161 ) ) ( not ( = ?auto_1082158 ?auto_1082160 ) ) ( not ( = ?auto_1082158 ?auto_1082161 ) ) ( not ( = ?auto_1082168 ?auto_1082162 ) ) ( HOIST-AT ?auto_1082165 ?auto_1082168 ) ( not ( = ?auto_1082164 ?auto_1082165 ) ) ( SURFACE-AT ?auto_1082161 ?auto_1082168 ) ( ON ?auto_1082161 ?auto_1082166 ) ( CLEAR ?auto_1082161 ) ( not ( = ?auto_1082160 ?auto_1082166 ) ) ( not ( = ?auto_1082161 ?auto_1082166 ) ) ( not ( = ?auto_1082158 ?auto_1082166 ) ) ( SURFACE-AT ?auto_1082158 ?auto_1082162 ) ( CLEAR ?auto_1082158 ) ( IS-CRATE ?auto_1082160 ) ( AVAILABLE ?auto_1082164 ) ( AVAILABLE ?auto_1082165 ) ( SURFACE-AT ?auto_1082160 ?auto_1082168 ) ( ON ?auto_1082160 ?auto_1082163 ) ( CLEAR ?auto_1082160 ) ( not ( = ?auto_1082160 ?auto_1082163 ) ) ( not ( = ?auto_1082161 ?auto_1082163 ) ) ( not ( = ?auto_1082158 ?auto_1082163 ) ) ( not ( = ?auto_1082166 ?auto_1082163 ) ) ( TRUCK-AT ?auto_1082167 ?auto_1082162 ) ( ON ?auto_1082156 ?auto_1082155 ) ( ON ?auto_1082157 ?auto_1082156 ) ( ON ?auto_1082159 ?auto_1082157 ) ( ON ?auto_1082158 ?auto_1082159 ) ( not ( = ?auto_1082155 ?auto_1082156 ) ) ( not ( = ?auto_1082155 ?auto_1082157 ) ) ( not ( = ?auto_1082155 ?auto_1082159 ) ) ( not ( = ?auto_1082155 ?auto_1082158 ) ) ( not ( = ?auto_1082155 ?auto_1082160 ) ) ( not ( = ?auto_1082155 ?auto_1082161 ) ) ( not ( = ?auto_1082155 ?auto_1082166 ) ) ( not ( = ?auto_1082155 ?auto_1082163 ) ) ( not ( = ?auto_1082156 ?auto_1082157 ) ) ( not ( = ?auto_1082156 ?auto_1082159 ) ) ( not ( = ?auto_1082156 ?auto_1082158 ) ) ( not ( = ?auto_1082156 ?auto_1082160 ) ) ( not ( = ?auto_1082156 ?auto_1082161 ) ) ( not ( = ?auto_1082156 ?auto_1082166 ) ) ( not ( = ?auto_1082156 ?auto_1082163 ) ) ( not ( = ?auto_1082157 ?auto_1082159 ) ) ( not ( = ?auto_1082157 ?auto_1082158 ) ) ( not ( = ?auto_1082157 ?auto_1082160 ) ) ( not ( = ?auto_1082157 ?auto_1082161 ) ) ( not ( = ?auto_1082157 ?auto_1082166 ) ) ( not ( = ?auto_1082157 ?auto_1082163 ) ) ( not ( = ?auto_1082159 ?auto_1082158 ) ) ( not ( = ?auto_1082159 ?auto_1082160 ) ) ( not ( = ?auto_1082159 ?auto_1082161 ) ) ( not ( = ?auto_1082159 ?auto_1082166 ) ) ( not ( = ?auto_1082159 ?auto_1082163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082158 ?auto_1082160 ?auto_1082161 )
      ( MAKE-6CRATE-VERIFY ?auto_1082155 ?auto_1082156 ?auto_1082157 ?auto_1082159 ?auto_1082158 ?auto_1082160 ?auto_1082161 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1082169 - SURFACE
      ?auto_1082170 - SURFACE
      ?auto_1082171 - SURFACE
      ?auto_1082173 - SURFACE
      ?auto_1082172 - SURFACE
      ?auto_1082174 - SURFACE
      ?auto_1082175 - SURFACE
      ?auto_1082176 - SURFACE
    )
    :vars
    (
      ?auto_1082179 - HOIST
      ?auto_1082177 - PLACE
      ?auto_1082183 - PLACE
      ?auto_1082180 - HOIST
      ?auto_1082181 - SURFACE
      ?auto_1082178 - SURFACE
      ?auto_1082182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082179 ?auto_1082177 ) ( IS-CRATE ?auto_1082176 ) ( not ( = ?auto_1082175 ?auto_1082176 ) ) ( not ( = ?auto_1082174 ?auto_1082175 ) ) ( not ( = ?auto_1082174 ?auto_1082176 ) ) ( not ( = ?auto_1082183 ?auto_1082177 ) ) ( HOIST-AT ?auto_1082180 ?auto_1082183 ) ( not ( = ?auto_1082179 ?auto_1082180 ) ) ( SURFACE-AT ?auto_1082176 ?auto_1082183 ) ( ON ?auto_1082176 ?auto_1082181 ) ( CLEAR ?auto_1082176 ) ( not ( = ?auto_1082175 ?auto_1082181 ) ) ( not ( = ?auto_1082176 ?auto_1082181 ) ) ( not ( = ?auto_1082174 ?auto_1082181 ) ) ( SURFACE-AT ?auto_1082174 ?auto_1082177 ) ( CLEAR ?auto_1082174 ) ( IS-CRATE ?auto_1082175 ) ( AVAILABLE ?auto_1082179 ) ( AVAILABLE ?auto_1082180 ) ( SURFACE-AT ?auto_1082175 ?auto_1082183 ) ( ON ?auto_1082175 ?auto_1082178 ) ( CLEAR ?auto_1082175 ) ( not ( = ?auto_1082175 ?auto_1082178 ) ) ( not ( = ?auto_1082176 ?auto_1082178 ) ) ( not ( = ?auto_1082174 ?auto_1082178 ) ) ( not ( = ?auto_1082181 ?auto_1082178 ) ) ( TRUCK-AT ?auto_1082182 ?auto_1082177 ) ( ON ?auto_1082170 ?auto_1082169 ) ( ON ?auto_1082171 ?auto_1082170 ) ( ON ?auto_1082173 ?auto_1082171 ) ( ON ?auto_1082172 ?auto_1082173 ) ( ON ?auto_1082174 ?auto_1082172 ) ( not ( = ?auto_1082169 ?auto_1082170 ) ) ( not ( = ?auto_1082169 ?auto_1082171 ) ) ( not ( = ?auto_1082169 ?auto_1082173 ) ) ( not ( = ?auto_1082169 ?auto_1082172 ) ) ( not ( = ?auto_1082169 ?auto_1082174 ) ) ( not ( = ?auto_1082169 ?auto_1082175 ) ) ( not ( = ?auto_1082169 ?auto_1082176 ) ) ( not ( = ?auto_1082169 ?auto_1082181 ) ) ( not ( = ?auto_1082169 ?auto_1082178 ) ) ( not ( = ?auto_1082170 ?auto_1082171 ) ) ( not ( = ?auto_1082170 ?auto_1082173 ) ) ( not ( = ?auto_1082170 ?auto_1082172 ) ) ( not ( = ?auto_1082170 ?auto_1082174 ) ) ( not ( = ?auto_1082170 ?auto_1082175 ) ) ( not ( = ?auto_1082170 ?auto_1082176 ) ) ( not ( = ?auto_1082170 ?auto_1082181 ) ) ( not ( = ?auto_1082170 ?auto_1082178 ) ) ( not ( = ?auto_1082171 ?auto_1082173 ) ) ( not ( = ?auto_1082171 ?auto_1082172 ) ) ( not ( = ?auto_1082171 ?auto_1082174 ) ) ( not ( = ?auto_1082171 ?auto_1082175 ) ) ( not ( = ?auto_1082171 ?auto_1082176 ) ) ( not ( = ?auto_1082171 ?auto_1082181 ) ) ( not ( = ?auto_1082171 ?auto_1082178 ) ) ( not ( = ?auto_1082173 ?auto_1082172 ) ) ( not ( = ?auto_1082173 ?auto_1082174 ) ) ( not ( = ?auto_1082173 ?auto_1082175 ) ) ( not ( = ?auto_1082173 ?auto_1082176 ) ) ( not ( = ?auto_1082173 ?auto_1082181 ) ) ( not ( = ?auto_1082173 ?auto_1082178 ) ) ( not ( = ?auto_1082172 ?auto_1082174 ) ) ( not ( = ?auto_1082172 ?auto_1082175 ) ) ( not ( = ?auto_1082172 ?auto_1082176 ) ) ( not ( = ?auto_1082172 ?auto_1082181 ) ) ( not ( = ?auto_1082172 ?auto_1082178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082174 ?auto_1082175 ?auto_1082176 )
      ( MAKE-7CRATE-VERIFY ?auto_1082169 ?auto_1082170 ?auto_1082171 ?auto_1082173 ?auto_1082172 ?auto_1082174 ?auto_1082175 ?auto_1082176 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1082184 - SURFACE
      ?auto_1082185 - SURFACE
      ?auto_1082186 - SURFACE
      ?auto_1082188 - SURFACE
      ?auto_1082187 - SURFACE
      ?auto_1082189 - SURFACE
      ?auto_1082190 - SURFACE
      ?auto_1082191 - SURFACE
      ?auto_1082192 - SURFACE
    )
    :vars
    (
      ?auto_1082195 - HOIST
      ?auto_1082193 - PLACE
      ?auto_1082199 - PLACE
      ?auto_1082196 - HOIST
      ?auto_1082197 - SURFACE
      ?auto_1082194 - SURFACE
      ?auto_1082198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082195 ?auto_1082193 ) ( IS-CRATE ?auto_1082192 ) ( not ( = ?auto_1082191 ?auto_1082192 ) ) ( not ( = ?auto_1082190 ?auto_1082191 ) ) ( not ( = ?auto_1082190 ?auto_1082192 ) ) ( not ( = ?auto_1082199 ?auto_1082193 ) ) ( HOIST-AT ?auto_1082196 ?auto_1082199 ) ( not ( = ?auto_1082195 ?auto_1082196 ) ) ( SURFACE-AT ?auto_1082192 ?auto_1082199 ) ( ON ?auto_1082192 ?auto_1082197 ) ( CLEAR ?auto_1082192 ) ( not ( = ?auto_1082191 ?auto_1082197 ) ) ( not ( = ?auto_1082192 ?auto_1082197 ) ) ( not ( = ?auto_1082190 ?auto_1082197 ) ) ( SURFACE-AT ?auto_1082190 ?auto_1082193 ) ( CLEAR ?auto_1082190 ) ( IS-CRATE ?auto_1082191 ) ( AVAILABLE ?auto_1082195 ) ( AVAILABLE ?auto_1082196 ) ( SURFACE-AT ?auto_1082191 ?auto_1082199 ) ( ON ?auto_1082191 ?auto_1082194 ) ( CLEAR ?auto_1082191 ) ( not ( = ?auto_1082191 ?auto_1082194 ) ) ( not ( = ?auto_1082192 ?auto_1082194 ) ) ( not ( = ?auto_1082190 ?auto_1082194 ) ) ( not ( = ?auto_1082197 ?auto_1082194 ) ) ( TRUCK-AT ?auto_1082198 ?auto_1082193 ) ( ON ?auto_1082185 ?auto_1082184 ) ( ON ?auto_1082186 ?auto_1082185 ) ( ON ?auto_1082188 ?auto_1082186 ) ( ON ?auto_1082187 ?auto_1082188 ) ( ON ?auto_1082189 ?auto_1082187 ) ( ON ?auto_1082190 ?auto_1082189 ) ( not ( = ?auto_1082184 ?auto_1082185 ) ) ( not ( = ?auto_1082184 ?auto_1082186 ) ) ( not ( = ?auto_1082184 ?auto_1082188 ) ) ( not ( = ?auto_1082184 ?auto_1082187 ) ) ( not ( = ?auto_1082184 ?auto_1082189 ) ) ( not ( = ?auto_1082184 ?auto_1082190 ) ) ( not ( = ?auto_1082184 ?auto_1082191 ) ) ( not ( = ?auto_1082184 ?auto_1082192 ) ) ( not ( = ?auto_1082184 ?auto_1082197 ) ) ( not ( = ?auto_1082184 ?auto_1082194 ) ) ( not ( = ?auto_1082185 ?auto_1082186 ) ) ( not ( = ?auto_1082185 ?auto_1082188 ) ) ( not ( = ?auto_1082185 ?auto_1082187 ) ) ( not ( = ?auto_1082185 ?auto_1082189 ) ) ( not ( = ?auto_1082185 ?auto_1082190 ) ) ( not ( = ?auto_1082185 ?auto_1082191 ) ) ( not ( = ?auto_1082185 ?auto_1082192 ) ) ( not ( = ?auto_1082185 ?auto_1082197 ) ) ( not ( = ?auto_1082185 ?auto_1082194 ) ) ( not ( = ?auto_1082186 ?auto_1082188 ) ) ( not ( = ?auto_1082186 ?auto_1082187 ) ) ( not ( = ?auto_1082186 ?auto_1082189 ) ) ( not ( = ?auto_1082186 ?auto_1082190 ) ) ( not ( = ?auto_1082186 ?auto_1082191 ) ) ( not ( = ?auto_1082186 ?auto_1082192 ) ) ( not ( = ?auto_1082186 ?auto_1082197 ) ) ( not ( = ?auto_1082186 ?auto_1082194 ) ) ( not ( = ?auto_1082188 ?auto_1082187 ) ) ( not ( = ?auto_1082188 ?auto_1082189 ) ) ( not ( = ?auto_1082188 ?auto_1082190 ) ) ( not ( = ?auto_1082188 ?auto_1082191 ) ) ( not ( = ?auto_1082188 ?auto_1082192 ) ) ( not ( = ?auto_1082188 ?auto_1082197 ) ) ( not ( = ?auto_1082188 ?auto_1082194 ) ) ( not ( = ?auto_1082187 ?auto_1082189 ) ) ( not ( = ?auto_1082187 ?auto_1082190 ) ) ( not ( = ?auto_1082187 ?auto_1082191 ) ) ( not ( = ?auto_1082187 ?auto_1082192 ) ) ( not ( = ?auto_1082187 ?auto_1082197 ) ) ( not ( = ?auto_1082187 ?auto_1082194 ) ) ( not ( = ?auto_1082189 ?auto_1082190 ) ) ( not ( = ?auto_1082189 ?auto_1082191 ) ) ( not ( = ?auto_1082189 ?auto_1082192 ) ) ( not ( = ?auto_1082189 ?auto_1082197 ) ) ( not ( = ?auto_1082189 ?auto_1082194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082190 ?auto_1082191 ?auto_1082192 )
      ( MAKE-8CRATE-VERIFY ?auto_1082184 ?auto_1082185 ?auto_1082186 ?auto_1082188 ?auto_1082187 ?auto_1082189 ?auto_1082190 ?auto_1082191 ?auto_1082192 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1082200 - SURFACE
      ?auto_1082201 - SURFACE
      ?auto_1082202 - SURFACE
      ?auto_1082204 - SURFACE
      ?auto_1082203 - SURFACE
      ?auto_1082205 - SURFACE
      ?auto_1082206 - SURFACE
      ?auto_1082207 - SURFACE
      ?auto_1082208 - SURFACE
      ?auto_1082209 - SURFACE
    )
    :vars
    (
      ?auto_1082212 - HOIST
      ?auto_1082210 - PLACE
      ?auto_1082216 - PLACE
      ?auto_1082213 - HOIST
      ?auto_1082214 - SURFACE
      ?auto_1082211 - SURFACE
      ?auto_1082215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082212 ?auto_1082210 ) ( IS-CRATE ?auto_1082209 ) ( not ( = ?auto_1082208 ?auto_1082209 ) ) ( not ( = ?auto_1082207 ?auto_1082208 ) ) ( not ( = ?auto_1082207 ?auto_1082209 ) ) ( not ( = ?auto_1082216 ?auto_1082210 ) ) ( HOIST-AT ?auto_1082213 ?auto_1082216 ) ( not ( = ?auto_1082212 ?auto_1082213 ) ) ( SURFACE-AT ?auto_1082209 ?auto_1082216 ) ( ON ?auto_1082209 ?auto_1082214 ) ( CLEAR ?auto_1082209 ) ( not ( = ?auto_1082208 ?auto_1082214 ) ) ( not ( = ?auto_1082209 ?auto_1082214 ) ) ( not ( = ?auto_1082207 ?auto_1082214 ) ) ( SURFACE-AT ?auto_1082207 ?auto_1082210 ) ( CLEAR ?auto_1082207 ) ( IS-CRATE ?auto_1082208 ) ( AVAILABLE ?auto_1082212 ) ( AVAILABLE ?auto_1082213 ) ( SURFACE-AT ?auto_1082208 ?auto_1082216 ) ( ON ?auto_1082208 ?auto_1082211 ) ( CLEAR ?auto_1082208 ) ( not ( = ?auto_1082208 ?auto_1082211 ) ) ( not ( = ?auto_1082209 ?auto_1082211 ) ) ( not ( = ?auto_1082207 ?auto_1082211 ) ) ( not ( = ?auto_1082214 ?auto_1082211 ) ) ( TRUCK-AT ?auto_1082215 ?auto_1082210 ) ( ON ?auto_1082201 ?auto_1082200 ) ( ON ?auto_1082202 ?auto_1082201 ) ( ON ?auto_1082204 ?auto_1082202 ) ( ON ?auto_1082203 ?auto_1082204 ) ( ON ?auto_1082205 ?auto_1082203 ) ( ON ?auto_1082206 ?auto_1082205 ) ( ON ?auto_1082207 ?auto_1082206 ) ( not ( = ?auto_1082200 ?auto_1082201 ) ) ( not ( = ?auto_1082200 ?auto_1082202 ) ) ( not ( = ?auto_1082200 ?auto_1082204 ) ) ( not ( = ?auto_1082200 ?auto_1082203 ) ) ( not ( = ?auto_1082200 ?auto_1082205 ) ) ( not ( = ?auto_1082200 ?auto_1082206 ) ) ( not ( = ?auto_1082200 ?auto_1082207 ) ) ( not ( = ?auto_1082200 ?auto_1082208 ) ) ( not ( = ?auto_1082200 ?auto_1082209 ) ) ( not ( = ?auto_1082200 ?auto_1082214 ) ) ( not ( = ?auto_1082200 ?auto_1082211 ) ) ( not ( = ?auto_1082201 ?auto_1082202 ) ) ( not ( = ?auto_1082201 ?auto_1082204 ) ) ( not ( = ?auto_1082201 ?auto_1082203 ) ) ( not ( = ?auto_1082201 ?auto_1082205 ) ) ( not ( = ?auto_1082201 ?auto_1082206 ) ) ( not ( = ?auto_1082201 ?auto_1082207 ) ) ( not ( = ?auto_1082201 ?auto_1082208 ) ) ( not ( = ?auto_1082201 ?auto_1082209 ) ) ( not ( = ?auto_1082201 ?auto_1082214 ) ) ( not ( = ?auto_1082201 ?auto_1082211 ) ) ( not ( = ?auto_1082202 ?auto_1082204 ) ) ( not ( = ?auto_1082202 ?auto_1082203 ) ) ( not ( = ?auto_1082202 ?auto_1082205 ) ) ( not ( = ?auto_1082202 ?auto_1082206 ) ) ( not ( = ?auto_1082202 ?auto_1082207 ) ) ( not ( = ?auto_1082202 ?auto_1082208 ) ) ( not ( = ?auto_1082202 ?auto_1082209 ) ) ( not ( = ?auto_1082202 ?auto_1082214 ) ) ( not ( = ?auto_1082202 ?auto_1082211 ) ) ( not ( = ?auto_1082204 ?auto_1082203 ) ) ( not ( = ?auto_1082204 ?auto_1082205 ) ) ( not ( = ?auto_1082204 ?auto_1082206 ) ) ( not ( = ?auto_1082204 ?auto_1082207 ) ) ( not ( = ?auto_1082204 ?auto_1082208 ) ) ( not ( = ?auto_1082204 ?auto_1082209 ) ) ( not ( = ?auto_1082204 ?auto_1082214 ) ) ( not ( = ?auto_1082204 ?auto_1082211 ) ) ( not ( = ?auto_1082203 ?auto_1082205 ) ) ( not ( = ?auto_1082203 ?auto_1082206 ) ) ( not ( = ?auto_1082203 ?auto_1082207 ) ) ( not ( = ?auto_1082203 ?auto_1082208 ) ) ( not ( = ?auto_1082203 ?auto_1082209 ) ) ( not ( = ?auto_1082203 ?auto_1082214 ) ) ( not ( = ?auto_1082203 ?auto_1082211 ) ) ( not ( = ?auto_1082205 ?auto_1082206 ) ) ( not ( = ?auto_1082205 ?auto_1082207 ) ) ( not ( = ?auto_1082205 ?auto_1082208 ) ) ( not ( = ?auto_1082205 ?auto_1082209 ) ) ( not ( = ?auto_1082205 ?auto_1082214 ) ) ( not ( = ?auto_1082205 ?auto_1082211 ) ) ( not ( = ?auto_1082206 ?auto_1082207 ) ) ( not ( = ?auto_1082206 ?auto_1082208 ) ) ( not ( = ?auto_1082206 ?auto_1082209 ) ) ( not ( = ?auto_1082206 ?auto_1082214 ) ) ( not ( = ?auto_1082206 ?auto_1082211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082207 ?auto_1082208 ?auto_1082209 )
      ( MAKE-9CRATE-VERIFY ?auto_1082200 ?auto_1082201 ?auto_1082202 ?auto_1082204 ?auto_1082203 ?auto_1082205 ?auto_1082206 ?auto_1082207 ?auto_1082208 ?auto_1082209 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1082217 - SURFACE
      ?auto_1082218 - SURFACE
      ?auto_1082219 - SURFACE
      ?auto_1082221 - SURFACE
      ?auto_1082220 - SURFACE
      ?auto_1082222 - SURFACE
      ?auto_1082223 - SURFACE
      ?auto_1082224 - SURFACE
      ?auto_1082225 - SURFACE
      ?auto_1082226 - SURFACE
      ?auto_1082227 - SURFACE
    )
    :vars
    (
      ?auto_1082230 - HOIST
      ?auto_1082228 - PLACE
      ?auto_1082234 - PLACE
      ?auto_1082231 - HOIST
      ?auto_1082232 - SURFACE
      ?auto_1082229 - SURFACE
      ?auto_1082233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082230 ?auto_1082228 ) ( IS-CRATE ?auto_1082227 ) ( not ( = ?auto_1082226 ?auto_1082227 ) ) ( not ( = ?auto_1082225 ?auto_1082226 ) ) ( not ( = ?auto_1082225 ?auto_1082227 ) ) ( not ( = ?auto_1082234 ?auto_1082228 ) ) ( HOIST-AT ?auto_1082231 ?auto_1082234 ) ( not ( = ?auto_1082230 ?auto_1082231 ) ) ( SURFACE-AT ?auto_1082227 ?auto_1082234 ) ( ON ?auto_1082227 ?auto_1082232 ) ( CLEAR ?auto_1082227 ) ( not ( = ?auto_1082226 ?auto_1082232 ) ) ( not ( = ?auto_1082227 ?auto_1082232 ) ) ( not ( = ?auto_1082225 ?auto_1082232 ) ) ( SURFACE-AT ?auto_1082225 ?auto_1082228 ) ( CLEAR ?auto_1082225 ) ( IS-CRATE ?auto_1082226 ) ( AVAILABLE ?auto_1082230 ) ( AVAILABLE ?auto_1082231 ) ( SURFACE-AT ?auto_1082226 ?auto_1082234 ) ( ON ?auto_1082226 ?auto_1082229 ) ( CLEAR ?auto_1082226 ) ( not ( = ?auto_1082226 ?auto_1082229 ) ) ( not ( = ?auto_1082227 ?auto_1082229 ) ) ( not ( = ?auto_1082225 ?auto_1082229 ) ) ( not ( = ?auto_1082232 ?auto_1082229 ) ) ( TRUCK-AT ?auto_1082233 ?auto_1082228 ) ( ON ?auto_1082218 ?auto_1082217 ) ( ON ?auto_1082219 ?auto_1082218 ) ( ON ?auto_1082221 ?auto_1082219 ) ( ON ?auto_1082220 ?auto_1082221 ) ( ON ?auto_1082222 ?auto_1082220 ) ( ON ?auto_1082223 ?auto_1082222 ) ( ON ?auto_1082224 ?auto_1082223 ) ( ON ?auto_1082225 ?auto_1082224 ) ( not ( = ?auto_1082217 ?auto_1082218 ) ) ( not ( = ?auto_1082217 ?auto_1082219 ) ) ( not ( = ?auto_1082217 ?auto_1082221 ) ) ( not ( = ?auto_1082217 ?auto_1082220 ) ) ( not ( = ?auto_1082217 ?auto_1082222 ) ) ( not ( = ?auto_1082217 ?auto_1082223 ) ) ( not ( = ?auto_1082217 ?auto_1082224 ) ) ( not ( = ?auto_1082217 ?auto_1082225 ) ) ( not ( = ?auto_1082217 ?auto_1082226 ) ) ( not ( = ?auto_1082217 ?auto_1082227 ) ) ( not ( = ?auto_1082217 ?auto_1082232 ) ) ( not ( = ?auto_1082217 ?auto_1082229 ) ) ( not ( = ?auto_1082218 ?auto_1082219 ) ) ( not ( = ?auto_1082218 ?auto_1082221 ) ) ( not ( = ?auto_1082218 ?auto_1082220 ) ) ( not ( = ?auto_1082218 ?auto_1082222 ) ) ( not ( = ?auto_1082218 ?auto_1082223 ) ) ( not ( = ?auto_1082218 ?auto_1082224 ) ) ( not ( = ?auto_1082218 ?auto_1082225 ) ) ( not ( = ?auto_1082218 ?auto_1082226 ) ) ( not ( = ?auto_1082218 ?auto_1082227 ) ) ( not ( = ?auto_1082218 ?auto_1082232 ) ) ( not ( = ?auto_1082218 ?auto_1082229 ) ) ( not ( = ?auto_1082219 ?auto_1082221 ) ) ( not ( = ?auto_1082219 ?auto_1082220 ) ) ( not ( = ?auto_1082219 ?auto_1082222 ) ) ( not ( = ?auto_1082219 ?auto_1082223 ) ) ( not ( = ?auto_1082219 ?auto_1082224 ) ) ( not ( = ?auto_1082219 ?auto_1082225 ) ) ( not ( = ?auto_1082219 ?auto_1082226 ) ) ( not ( = ?auto_1082219 ?auto_1082227 ) ) ( not ( = ?auto_1082219 ?auto_1082232 ) ) ( not ( = ?auto_1082219 ?auto_1082229 ) ) ( not ( = ?auto_1082221 ?auto_1082220 ) ) ( not ( = ?auto_1082221 ?auto_1082222 ) ) ( not ( = ?auto_1082221 ?auto_1082223 ) ) ( not ( = ?auto_1082221 ?auto_1082224 ) ) ( not ( = ?auto_1082221 ?auto_1082225 ) ) ( not ( = ?auto_1082221 ?auto_1082226 ) ) ( not ( = ?auto_1082221 ?auto_1082227 ) ) ( not ( = ?auto_1082221 ?auto_1082232 ) ) ( not ( = ?auto_1082221 ?auto_1082229 ) ) ( not ( = ?auto_1082220 ?auto_1082222 ) ) ( not ( = ?auto_1082220 ?auto_1082223 ) ) ( not ( = ?auto_1082220 ?auto_1082224 ) ) ( not ( = ?auto_1082220 ?auto_1082225 ) ) ( not ( = ?auto_1082220 ?auto_1082226 ) ) ( not ( = ?auto_1082220 ?auto_1082227 ) ) ( not ( = ?auto_1082220 ?auto_1082232 ) ) ( not ( = ?auto_1082220 ?auto_1082229 ) ) ( not ( = ?auto_1082222 ?auto_1082223 ) ) ( not ( = ?auto_1082222 ?auto_1082224 ) ) ( not ( = ?auto_1082222 ?auto_1082225 ) ) ( not ( = ?auto_1082222 ?auto_1082226 ) ) ( not ( = ?auto_1082222 ?auto_1082227 ) ) ( not ( = ?auto_1082222 ?auto_1082232 ) ) ( not ( = ?auto_1082222 ?auto_1082229 ) ) ( not ( = ?auto_1082223 ?auto_1082224 ) ) ( not ( = ?auto_1082223 ?auto_1082225 ) ) ( not ( = ?auto_1082223 ?auto_1082226 ) ) ( not ( = ?auto_1082223 ?auto_1082227 ) ) ( not ( = ?auto_1082223 ?auto_1082232 ) ) ( not ( = ?auto_1082223 ?auto_1082229 ) ) ( not ( = ?auto_1082224 ?auto_1082225 ) ) ( not ( = ?auto_1082224 ?auto_1082226 ) ) ( not ( = ?auto_1082224 ?auto_1082227 ) ) ( not ( = ?auto_1082224 ?auto_1082232 ) ) ( not ( = ?auto_1082224 ?auto_1082229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082225 ?auto_1082226 ?auto_1082227 )
      ( MAKE-10CRATE-VERIFY ?auto_1082217 ?auto_1082218 ?auto_1082219 ?auto_1082221 ?auto_1082220 ?auto_1082222 ?auto_1082223 ?auto_1082224 ?auto_1082225 ?auto_1082226 ?auto_1082227 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1082235 - SURFACE
      ?auto_1082236 - SURFACE
      ?auto_1082237 - SURFACE
      ?auto_1082239 - SURFACE
      ?auto_1082238 - SURFACE
      ?auto_1082240 - SURFACE
      ?auto_1082241 - SURFACE
      ?auto_1082242 - SURFACE
      ?auto_1082243 - SURFACE
      ?auto_1082244 - SURFACE
      ?auto_1082245 - SURFACE
      ?auto_1082246 - SURFACE
    )
    :vars
    (
      ?auto_1082249 - HOIST
      ?auto_1082247 - PLACE
      ?auto_1082253 - PLACE
      ?auto_1082250 - HOIST
      ?auto_1082251 - SURFACE
      ?auto_1082248 - SURFACE
      ?auto_1082252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082249 ?auto_1082247 ) ( IS-CRATE ?auto_1082246 ) ( not ( = ?auto_1082245 ?auto_1082246 ) ) ( not ( = ?auto_1082244 ?auto_1082245 ) ) ( not ( = ?auto_1082244 ?auto_1082246 ) ) ( not ( = ?auto_1082253 ?auto_1082247 ) ) ( HOIST-AT ?auto_1082250 ?auto_1082253 ) ( not ( = ?auto_1082249 ?auto_1082250 ) ) ( SURFACE-AT ?auto_1082246 ?auto_1082253 ) ( ON ?auto_1082246 ?auto_1082251 ) ( CLEAR ?auto_1082246 ) ( not ( = ?auto_1082245 ?auto_1082251 ) ) ( not ( = ?auto_1082246 ?auto_1082251 ) ) ( not ( = ?auto_1082244 ?auto_1082251 ) ) ( SURFACE-AT ?auto_1082244 ?auto_1082247 ) ( CLEAR ?auto_1082244 ) ( IS-CRATE ?auto_1082245 ) ( AVAILABLE ?auto_1082249 ) ( AVAILABLE ?auto_1082250 ) ( SURFACE-AT ?auto_1082245 ?auto_1082253 ) ( ON ?auto_1082245 ?auto_1082248 ) ( CLEAR ?auto_1082245 ) ( not ( = ?auto_1082245 ?auto_1082248 ) ) ( not ( = ?auto_1082246 ?auto_1082248 ) ) ( not ( = ?auto_1082244 ?auto_1082248 ) ) ( not ( = ?auto_1082251 ?auto_1082248 ) ) ( TRUCK-AT ?auto_1082252 ?auto_1082247 ) ( ON ?auto_1082236 ?auto_1082235 ) ( ON ?auto_1082237 ?auto_1082236 ) ( ON ?auto_1082239 ?auto_1082237 ) ( ON ?auto_1082238 ?auto_1082239 ) ( ON ?auto_1082240 ?auto_1082238 ) ( ON ?auto_1082241 ?auto_1082240 ) ( ON ?auto_1082242 ?auto_1082241 ) ( ON ?auto_1082243 ?auto_1082242 ) ( ON ?auto_1082244 ?auto_1082243 ) ( not ( = ?auto_1082235 ?auto_1082236 ) ) ( not ( = ?auto_1082235 ?auto_1082237 ) ) ( not ( = ?auto_1082235 ?auto_1082239 ) ) ( not ( = ?auto_1082235 ?auto_1082238 ) ) ( not ( = ?auto_1082235 ?auto_1082240 ) ) ( not ( = ?auto_1082235 ?auto_1082241 ) ) ( not ( = ?auto_1082235 ?auto_1082242 ) ) ( not ( = ?auto_1082235 ?auto_1082243 ) ) ( not ( = ?auto_1082235 ?auto_1082244 ) ) ( not ( = ?auto_1082235 ?auto_1082245 ) ) ( not ( = ?auto_1082235 ?auto_1082246 ) ) ( not ( = ?auto_1082235 ?auto_1082251 ) ) ( not ( = ?auto_1082235 ?auto_1082248 ) ) ( not ( = ?auto_1082236 ?auto_1082237 ) ) ( not ( = ?auto_1082236 ?auto_1082239 ) ) ( not ( = ?auto_1082236 ?auto_1082238 ) ) ( not ( = ?auto_1082236 ?auto_1082240 ) ) ( not ( = ?auto_1082236 ?auto_1082241 ) ) ( not ( = ?auto_1082236 ?auto_1082242 ) ) ( not ( = ?auto_1082236 ?auto_1082243 ) ) ( not ( = ?auto_1082236 ?auto_1082244 ) ) ( not ( = ?auto_1082236 ?auto_1082245 ) ) ( not ( = ?auto_1082236 ?auto_1082246 ) ) ( not ( = ?auto_1082236 ?auto_1082251 ) ) ( not ( = ?auto_1082236 ?auto_1082248 ) ) ( not ( = ?auto_1082237 ?auto_1082239 ) ) ( not ( = ?auto_1082237 ?auto_1082238 ) ) ( not ( = ?auto_1082237 ?auto_1082240 ) ) ( not ( = ?auto_1082237 ?auto_1082241 ) ) ( not ( = ?auto_1082237 ?auto_1082242 ) ) ( not ( = ?auto_1082237 ?auto_1082243 ) ) ( not ( = ?auto_1082237 ?auto_1082244 ) ) ( not ( = ?auto_1082237 ?auto_1082245 ) ) ( not ( = ?auto_1082237 ?auto_1082246 ) ) ( not ( = ?auto_1082237 ?auto_1082251 ) ) ( not ( = ?auto_1082237 ?auto_1082248 ) ) ( not ( = ?auto_1082239 ?auto_1082238 ) ) ( not ( = ?auto_1082239 ?auto_1082240 ) ) ( not ( = ?auto_1082239 ?auto_1082241 ) ) ( not ( = ?auto_1082239 ?auto_1082242 ) ) ( not ( = ?auto_1082239 ?auto_1082243 ) ) ( not ( = ?auto_1082239 ?auto_1082244 ) ) ( not ( = ?auto_1082239 ?auto_1082245 ) ) ( not ( = ?auto_1082239 ?auto_1082246 ) ) ( not ( = ?auto_1082239 ?auto_1082251 ) ) ( not ( = ?auto_1082239 ?auto_1082248 ) ) ( not ( = ?auto_1082238 ?auto_1082240 ) ) ( not ( = ?auto_1082238 ?auto_1082241 ) ) ( not ( = ?auto_1082238 ?auto_1082242 ) ) ( not ( = ?auto_1082238 ?auto_1082243 ) ) ( not ( = ?auto_1082238 ?auto_1082244 ) ) ( not ( = ?auto_1082238 ?auto_1082245 ) ) ( not ( = ?auto_1082238 ?auto_1082246 ) ) ( not ( = ?auto_1082238 ?auto_1082251 ) ) ( not ( = ?auto_1082238 ?auto_1082248 ) ) ( not ( = ?auto_1082240 ?auto_1082241 ) ) ( not ( = ?auto_1082240 ?auto_1082242 ) ) ( not ( = ?auto_1082240 ?auto_1082243 ) ) ( not ( = ?auto_1082240 ?auto_1082244 ) ) ( not ( = ?auto_1082240 ?auto_1082245 ) ) ( not ( = ?auto_1082240 ?auto_1082246 ) ) ( not ( = ?auto_1082240 ?auto_1082251 ) ) ( not ( = ?auto_1082240 ?auto_1082248 ) ) ( not ( = ?auto_1082241 ?auto_1082242 ) ) ( not ( = ?auto_1082241 ?auto_1082243 ) ) ( not ( = ?auto_1082241 ?auto_1082244 ) ) ( not ( = ?auto_1082241 ?auto_1082245 ) ) ( not ( = ?auto_1082241 ?auto_1082246 ) ) ( not ( = ?auto_1082241 ?auto_1082251 ) ) ( not ( = ?auto_1082241 ?auto_1082248 ) ) ( not ( = ?auto_1082242 ?auto_1082243 ) ) ( not ( = ?auto_1082242 ?auto_1082244 ) ) ( not ( = ?auto_1082242 ?auto_1082245 ) ) ( not ( = ?auto_1082242 ?auto_1082246 ) ) ( not ( = ?auto_1082242 ?auto_1082251 ) ) ( not ( = ?auto_1082242 ?auto_1082248 ) ) ( not ( = ?auto_1082243 ?auto_1082244 ) ) ( not ( = ?auto_1082243 ?auto_1082245 ) ) ( not ( = ?auto_1082243 ?auto_1082246 ) ) ( not ( = ?auto_1082243 ?auto_1082251 ) ) ( not ( = ?auto_1082243 ?auto_1082248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082244 ?auto_1082245 ?auto_1082246 )
      ( MAKE-11CRATE-VERIFY ?auto_1082235 ?auto_1082236 ?auto_1082237 ?auto_1082239 ?auto_1082238 ?auto_1082240 ?auto_1082241 ?auto_1082242 ?auto_1082243 ?auto_1082244 ?auto_1082245 ?auto_1082246 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1082254 - SURFACE
      ?auto_1082255 - SURFACE
      ?auto_1082256 - SURFACE
      ?auto_1082258 - SURFACE
      ?auto_1082257 - SURFACE
      ?auto_1082259 - SURFACE
      ?auto_1082260 - SURFACE
      ?auto_1082261 - SURFACE
      ?auto_1082262 - SURFACE
      ?auto_1082263 - SURFACE
      ?auto_1082264 - SURFACE
      ?auto_1082265 - SURFACE
      ?auto_1082266 - SURFACE
    )
    :vars
    (
      ?auto_1082269 - HOIST
      ?auto_1082267 - PLACE
      ?auto_1082273 - PLACE
      ?auto_1082270 - HOIST
      ?auto_1082271 - SURFACE
      ?auto_1082268 - SURFACE
      ?auto_1082272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082269 ?auto_1082267 ) ( IS-CRATE ?auto_1082266 ) ( not ( = ?auto_1082265 ?auto_1082266 ) ) ( not ( = ?auto_1082264 ?auto_1082265 ) ) ( not ( = ?auto_1082264 ?auto_1082266 ) ) ( not ( = ?auto_1082273 ?auto_1082267 ) ) ( HOIST-AT ?auto_1082270 ?auto_1082273 ) ( not ( = ?auto_1082269 ?auto_1082270 ) ) ( SURFACE-AT ?auto_1082266 ?auto_1082273 ) ( ON ?auto_1082266 ?auto_1082271 ) ( CLEAR ?auto_1082266 ) ( not ( = ?auto_1082265 ?auto_1082271 ) ) ( not ( = ?auto_1082266 ?auto_1082271 ) ) ( not ( = ?auto_1082264 ?auto_1082271 ) ) ( SURFACE-AT ?auto_1082264 ?auto_1082267 ) ( CLEAR ?auto_1082264 ) ( IS-CRATE ?auto_1082265 ) ( AVAILABLE ?auto_1082269 ) ( AVAILABLE ?auto_1082270 ) ( SURFACE-AT ?auto_1082265 ?auto_1082273 ) ( ON ?auto_1082265 ?auto_1082268 ) ( CLEAR ?auto_1082265 ) ( not ( = ?auto_1082265 ?auto_1082268 ) ) ( not ( = ?auto_1082266 ?auto_1082268 ) ) ( not ( = ?auto_1082264 ?auto_1082268 ) ) ( not ( = ?auto_1082271 ?auto_1082268 ) ) ( TRUCK-AT ?auto_1082272 ?auto_1082267 ) ( ON ?auto_1082255 ?auto_1082254 ) ( ON ?auto_1082256 ?auto_1082255 ) ( ON ?auto_1082258 ?auto_1082256 ) ( ON ?auto_1082257 ?auto_1082258 ) ( ON ?auto_1082259 ?auto_1082257 ) ( ON ?auto_1082260 ?auto_1082259 ) ( ON ?auto_1082261 ?auto_1082260 ) ( ON ?auto_1082262 ?auto_1082261 ) ( ON ?auto_1082263 ?auto_1082262 ) ( ON ?auto_1082264 ?auto_1082263 ) ( not ( = ?auto_1082254 ?auto_1082255 ) ) ( not ( = ?auto_1082254 ?auto_1082256 ) ) ( not ( = ?auto_1082254 ?auto_1082258 ) ) ( not ( = ?auto_1082254 ?auto_1082257 ) ) ( not ( = ?auto_1082254 ?auto_1082259 ) ) ( not ( = ?auto_1082254 ?auto_1082260 ) ) ( not ( = ?auto_1082254 ?auto_1082261 ) ) ( not ( = ?auto_1082254 ?auto_1082262 ) ) ( not ( = ?auto_1082254 ?auto_1082263 ) ) ( not ( = ?auto_1082254 ?auto_1082264 ) ) ( not ( = ?auto_1082254 ?auto_1082265 ) ) ( not ( = ?auto_1082254 ?auto_1082266 ) ) ( not ( = ?auto_1082254 ?auto_1082271 ) ) ( not ( = ?auto_1082254 ?auto_1082268 ) ) ( not ( = ?auto_1082255 ?auto_1082256 ) ) ( not ( = ?auto_1082255 ?auto_1082258 ) ) ( not ( = ?auto_1082255 ?auto_1082257 ) ) ( not ( = ?auto_1082255 ?auto_1082259 ) ) ( not ( = ?auto_1082255 ?auto_1082260 ) ) ( not ( = ?auto_1082255 ?auto_1082261 ) ) ( not ( = ?auto_1082255 ?auto_1082262 ) ) ( not ( = ?auto_1082255 ?auto_1082263 ) ) ( not ( = ?auto_1082255 ?auto_1082264 ) ) ( not ( = ?auto_1082255 ?auto_1082265 ) ) ( not ( = ?auto_1082255 ?auto_1082266 ) ) ( not ( = ?auto_1082255 ?auto_1082271 ) ) ( not ( = ?auto_1082255 ?auto_1082268 ) ) ( not ( = ?auto_1082256 ?auto_1082258 ) ) ( not ( = ?auto_1082256 ?auto_1082257 ) ) ( not ( = ?auto_1082256 ?auto_1082259 ) ) ( not ( = ?auto_1082256 ?auto_1082260 ) ) ( not ( = ?auto_1082256 ?auto_1082261 ) ) ( not ( = ?auto_1082256 ?auto_1082262 ) ) ( not ( = ?auto_1082256 ?auto_1082263 ) ) ( not ( = ?auto_1082256 ?auto_1082264 ) ) ( not ( = ?auto_1082256 ?auto_1082265 ) ) ( not ( = ?auto_1082256 ?auto_1082266 ) ) ( not ( = ?auto_1082256 ?auto_1082271 ) ) ( not ( = ?auto_1082256 ?auto_1082268 ) ) ( not ( = ?auto_1082258 ?auto_1082257 ) ) ( not ( = ?auto_1082258 ?auto_1082259 ) ) ( not ( = ?auto_1082258 ?auto_1082260 ) ) ( not ( = ?auto_1082258 ?auto_1082261 ) ) ( not ( = ?auto_1082258 ?auto_1082262 ) ) ( not ( = ?auto_1082258 ?auto_1082263 ) ) ( not ( = ?auto_1082258 ?auto_1082264 ) ) ( not ( = ?auto_1082258 ?auto_1082265 ) ) ( not ( = ?auto_1082258 ?auto_1082266 ) ) ( not ( = ?auto_1082258 ?auto_1082271 ) ) ( not ( = ?auto_1082258 ?auto_1082268 ) ) ( not ( = ?auto_1082257 ?auto_1082259 ) ) ( not ( = ?auto_1082257 ?auto_1082260 ) ) ( not ( = ?auto_1082257 ?auto_1082261 ) ) ( not ( = ?auto_1082257 ?auto_1082262 ) ) ( not ( = ?auto_1082257 ?auto_1082263 ) ) ( not ( = ?auto_1082257 ?auto_1082264 ) ) ( not ( = ?auto_1082257 ?auto_1082265 ) ) ( not ( = ?auto_1082257 ?auto_1082266 ) ) ( not ( = ?auto_1082257 ?auto_1082271 ) ) ( not ( = ?auto_1082257 ?auto_1082268 ) ) ( not ( = ?auto_1082259 ?auto_1082260 ) ) ( not ( = ?auto_1082259 ?auto_1082261 ) ) ( not ( = ?auto_1082259 ?auto_1082262 ) ) ( not ( = ?auto_1082259 ?auto_1082263 ) ) ( not ( = ?auto_1082259 ?auto_1082264 ) ) ( not ( = ?auto_1082259 ?auto_1082265 ) ) ( not ( = ?auto_1082259 ?auto_1082266 ) ) ( not ( = ?auto_1082259 ?auto_1082271 ) ) ( not ( = ?auto_1082259 ?auto_1082268 ) ) ( not ( = ?auto_1082260 ?auto_1082261 ) ) ( not ( = ?auto_1082260 ?auto_1082262 ) ) ( not ( = ?auto_1082260 ?auto_1082263 ) ) ( not ( = ?auto_1082260 ?auto_1082264 ) ) ( not ( = ?auto_1082260 ?auto_1082265 ) ) ( not ( = ?auto_1082260 ?auto_1082266 ) ) ( not ( = ?auto_1082260 ?auto_1082271 ) ) ( not ( = ?auto_1082260 ?auto_1082268 ) ) ( not ( = ?auto_1082261 ?auto_1082262 ) ) ( not ( = ?auto_1082261 ?auto_1082263 ) ) ( not ( = ?auto_1082261 ?auto_1082264 ) ) ( not ( = ?auto_1082261 ?auto_1082265 ) ) ( not ( = ?auto_1082261 ?auto_1082266 ) ) ( not ( = ?auto_1082261 ?auto_1082271 ) ) ( not ( = ?auto_1082261 ?auto_1082268 ) ) ( not ( = ?auto_1082262 ?auto_1082263 ) ) ( not ( = ?auto_1082262 ?auto_1082264 ) ) ( not ( = ?auto_1082262 ?auto_1082265 ) ) ( not ( = ?auto_1082262 ?auto_1082266 ) ) ( not ( = ?auto_1082262 ?auto_1082271 ) ) ( not ( = ?auto_1082262 ?auto_1082268 ) ) ( not ( = ?auto_1082263 ?auto_1082264 ) ) ( not ( = ?auto_1082263 ?auto_1082265 ) ) ( not ( = ?auto_1082263 ?auto_1082266 ) ) ( not ( = ?auto_1082263 ?auto_1082271 ) ) ( not ( = ?auto_1082263 ?auto_1082268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082264 ?auto_1082265 ?auto_1082266 )
      ( MAKE-12CRATE-VERIFY ?auto_1082254 ?auto_1082255 ?auto_1082256 ?auto_1082258 ?auto_1082257 ?auto_1082259 ?auto_1082260 ?auto_1082261 ?auto_1082262 ?auto_1082263 ?auto_1082264 ?auto_1082265 ?auto_1082266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1082274 - SURFACE
      ?auto_1082275 - SURFACE
    )
    :vars
    (
      ?auto_1082278 - HOIST
      ?auto_1082276 - PLACE
      ?auto_1082282 - SURFACE
      ?auto_1082283 - PLACE
      ?auto_1082279 - HOIST
      ?auto_1082280 - SURFACE
      ?auto_1082277 - SURFACE
      ?auto_1082281 - TRUCK
      ?auto_1082284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082278 ?auto_1082276 ) ( IS-CRATE ?auto_1082275 ) ( not ( = ?auto_1082274 ?auto_1082275 ) ) ( not ( = ?auto_1082282 ?auto_1082274 ) ) ( not ( = ?auto_1082282 ?auto_1082275 ) ) ( not ( = ?auto_1082283 ?auto_1082276 ) ) ( HOIST-AT ?auto_1082279 ?auto_1082283 ) ( not ( = ?auto_1082278 ?auto_1082279 ) ) ( SURFACE-AT ?auto_1082275 ?auto_1082283 ) ( ON ?auto_1082275 ?auto_1082280 ) ( CLEAR ?auto_1082275 ) ( not ( = ?auto_1082274 ?auto_1082280 ) ) ( not ( = ?auto_1082275 ?auto_1082280 ) ) ( not ( = ?auto_1082282 ?auto_1082280 ) ) ( IS-CRATE ?auto_1082274 ) ( AVAILABLE ?auto_1082279 ) ( SURFACE-AT ?auto_1082274 ?auto_1082283 ) ( ON ?auto_1082274 ?auto_1082277 ) ( CLEAR ?auto_1082274 ) ( not ( = ?auto_1082274 ?auto_1082277 ) ) ( not ( = ?auto_1082275 ?auto_1082277 ) ) ( not ( = ?auto_1082282 ?auto_1082277 ) ) ( not ( = ?auto_1082280 ?auto_1082277 ) ) ( TRUCK-AT ?auto_1082281 ?auto_1082276 ) ( SURFACE-AT ?auto_1082284 ?auto_1082276 ) ( CLEAR ?auto_1082284 ) ( LIFTING ?auto_1082278 ?auto_1082282 ) ( IS-CRATE ?auto_1082282 ) ( not ( = ?auto_1082284 ?auto_1082282 ) ) ( not ( = ?auto_1082274 ?auto_1082284 ) ) ( not ( = ?auto_1082275 ?auto_1082284 ) ) ( not ( = ?auto_1082280 ?auto_1082284 ) ) ( not ( = ?auto_1082277 ?auto_1082284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1082284 ?auto_1082282 )
      ( MAKE-2CRATE ?auto_1082282 ?auto_1082274 ?auto_1082275 )
      ( MAKE-1CRATE-VERIFY ?auto_1082274 ?auto_1082275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1082285 - SURFACE
      ?auto_1082286 - SURFACE
      ?auto_1082287 - SURFACE
    )
    :vars
    (
      ?auto_1082291 - HOIST
      ?auto_1082294 - PLACE
      ?auto_1082295 - PLACE
      ?auto_1082292 - HOIST
      ?auto_1082288 - SURFACE
      ?auto_1082293 - SURFACE
      ?auto_1082289 - TRUCK
      ?auto_1082290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082291 ?auto_1082294 ) ( IS-CRATE ?auto_1082287 ) ( not ( = ?auto_1082286 ?auto_1082287 ) ) ( not ( = ?auto_1082285 ?auto_1082286 ) ) ( not ( = ?auto_1082285 ?auto_1082287 ) ) ( not ( = ?auto_1082295 ?auto_1082294 ) ) ( HOIST-AT ?auto_1082292 ?auto_1082295 ) ( not ( = ?auto_1082291 ?auto_1082292 ) ) ( SURFACE-AT ?auto_1082287 ?auto_1082295 ) ( ON ?auto_1082287 ?auto_1082288 ) ( CLEAR ?auto_1082287 ) ( not ( = ?auto_1082286 ?auto_1082288 ) ) ( not ( = ?auto_1082287 ?auto_1082288 ) ) ( not ( = ?auto_1082285 ?auto_1082288 ) ) ( IS-CRATE ?auto_1082286 ) ( AVAILABLE ?auto_1082292 ) ( SURFACE-AT ?auto_1082286 ?auto_1082295 ) ( ON ?auto_1082286 ?auto_1082293 ) ( CLEAR ?auto_1082286 ) ( not ( = ?auto_1082286 ?auto_1082293 ) ) ( not ( = ?auto_1082287 ?auto_1082293 ) ) ( not ( = ?auto_1082285 ?auto_1082293 ) ) ( not ( = ?auto_1082288 ?auto_1082293 ) ) ( TRUCK-AT ?auto_1082289 ?auto_1082294 ) ( SURFACE-AT ?auto_1082290 ?auto_1082294 ) ( CLEAR ?auto_1082290 ) ( LIFTING ?auto_1082291 ?auto_1082285 ) ( IS-CRATE ?auto_1082285 ) ( not ( = ?auto_1082290 ?auto_1082285 ) ) ( not ( = ?auto_1082286 ?auto_1082290 ) ) ( not ( = ?auto_1082287 ?auto_1082290 ) ) ( not ( = ?auto_1082288 ?auto_1082290 ) ) ( not ( = ?auto_1082293 ?auto_1082290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1082286 ?auto_1082287 )
      ( MAKE-2CRATE-VERIFY ?auto_1082285 ?auto_1082286 ?auto_1082287 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1082296 - SURFACE
      ?auto_1082297 - SURFACE
      ?auto_1082298 - SURFACE
      ?auto_1082299 - SURFACE
    )
    :vars
    (
      ?auto_1082304 - HOIST
      ?auto_1082302 - PLACE
      ?auto_1082306 - PLACE
      ?auto_1082303 - HOIST
      ?auto_1082301 - SURFACE
      ?auto_1082305 - SURFACE
      ?auto_1082300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082304 ?auto_1082302 ) ( IS-CRATE ?auto_1082299 ) ( not ( = ?auto_1082298 ?auto_1082299 ) ) ( not ( = ?auto_1082297 ?auto_1082298 ) ) ( not ( = ?auto_1082297 ?auto_1082299 ) ) ( not ( = ?auto_1082306 ?auto_1082302 ) ) ( HOIST-AT ?auto_1082303 ?auto_1082306 ) ( not ( = ?auto_1082304 ?auto_1082303 ) ) ( SURFACE-AT ?auto_1082299 ?auto_1082306 ) ( ON ?auto_1082299 ?auto_1082301 ) ( CLEAR ?auto_1082299 ) ( not ( = ?auto_1082298 ?auto_1082301 ) ) ( not ( = ?auto_1082299 ?auto_1082301 ) ) ( not ( = ?auto_1082297 ?auto_1082301 ) ) ( IS-CRATE ?auto_1082298 ) ( AVAILABLE ?auto_1082303 ) ( SURFACE-AT ?auto_1082298 ?auto_1082306 ) ( ON ?auto_1082298 ?auto_1082305 ) ( CLEAR ?auto_1082298 ) ( not ( = ?auto_1082298 ?auto_1082305 ) ) ( not ( = ?auto_1082299 ?auto_1082305 ) ) ( not ( = ?auto_1082297 ?auto_1082305 ) ) ( not ( = ?auto_1082301 ?auto_1082305 ) ) ( TRUCK-AT ?auto_1082300 ?auto_1082302 ) ( SURFACE-AT ?auto_1082296 ?auto_1082302 ) ( CLEAR ?auto_1082296 ) ( LIFTING ?auto_1082304 ?auto_1082297 ) ( IS-CRATE ?auto_1082297 ) ( not ( = ?auto_1082296 ?auto_1082297 ) ) ( not ( = ?auto_1082298 ?auto_1082296 ) ) ( not ( = ?auto_1082299 ?auto_1082296 ) ) ( not ( = ?auto_1082301 ?auto_1082296 ) ) ( not ( = ?auto_1082305 ?auto_1082296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082297 ?auto_1082298 ?auto_1082299 )
      ( MAKE-3CRATE-VERIFY ?auto_1082296 ?auto_1082297 ?auto_1082298 ?auto_1082299 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1082307 - SURFACE
      ?auto_1082308 - SURFACE
      ?auto_1082309 - SURFACE
      ?auto_1082311 - SURFACE
      ?auto_1082310 - SURFACE
    )
    :vars
    (
      ?auto_1082316 - HOIST
      ?auto_1082314 - PLACE
      ?auto_1082318 - PLACE
      ?auto_1082315 - HOIST
      ?auto_1082313 - SURFACE
      ?auto_1082317 - SURFACE
      ?auto_1082312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082316 ?auto_1082314 ) ( IS-CRATE ?auto_1082310 ) ( not ( = ?auto_1082311 ?auto_1082310 ) ) ( not ( = ?auto_1082309 ?auto_1082311 ) ) ( not ( = ?auto_1082309 ?auto_1082310 ) ) ( not ( = ?auto_1082318 ?auto_1082314 ) ) ( HOIST-AT ?auto_1082315 ?auto_1082318 ) ( not ( = ?auto_1082316 ?auto_1082315 ) ) ( SURFACE-AT ?auto_1082310 ?auto_1082318 ) ( ON ?auto_1082310 ?auto_1082313 ) ( CLEAR ?auto_1082310 ) ( not ( = ?auto_1082311 ?auto_1082313 ) ) ( not ( = ?auto_1082310 ?auto_1082313 ) ) ( not ( = ?auto_1082309 ?auto_1082313 ) ) ( IS-CRATE ?auto_1082311 ) ( AVAILABLE ?auto_1082315 ) ( SURFACE-AT ?auto_1082311 ?auto_1082318 ) ( ON ?auto_1082311 ?auto_1082317 ) ( CLEAR ?auto_1082311 ) ( not ( = ?auto_1082311 ?auto_1082317 ) ) ( not ( = ?auto_1082310 ?auto_1082317 ) ) ( not ( = ?auto_1082309 ?auto_1082317 ) ) ( not ( = ?auto_1082313 ?auto_1082317 ) ) ( TRUCK-AT ?auto_1082312 ?auto_1082314 ) ( SURFACE-AT ?auto_1082308 ?auto_1082314 ) ( CLEAR ?auto_1082308 ) ( LIFTING ?auto_1082316 ?auto_1082309 ) ( IS-CRATE ?auto_1082309 ) ( not ( = ?auto_1082308 ?auto_1082309 ) ) ( not ( = ?auto_1082311 ?auto_1082308 ) ) ( not ( = ?auto_1082310 ?auto_1082308 ) ) ( not ( = ?auto_1082313 ?auto_1082308 ) ) ( not ( = ?auto_1082317 ?auto_1082308 ) ) ( ON ?auto_1082308 ?auto_1082307 ) ( not ( = ?auto_1082307 ?auto_1082308 ) ) ( not ( = ?auto_1082307 ?auto_1082309 ) ) ( not ( = ?auto_1082307 ?auto_1082311 ) ) ( not ( = ?auto_1082307 ?auto_1082310 ) ) ( not ( = ?auto_1082307 ?auto_1082313 ) ) ( not ( = ?auto_1082307 ?auto_1082317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082309 ?auto_1082311 ?auto_1082310 )
      ( MAKE-4CRATE-VERIFY ?auto_1082307 ?auto_1082308 ?auto_1082309 ?auto_1082311 ?auto_1082310 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1082319 - SURFACE
      ?auto_1082320 - SURFACE
      ?auto_1082321 - SURFACE
      ?auto_1082323 - SURFACE
      ?auto_1082322 - SURFACE
      ?auto_1082324 - SURFACE
    )
    :vars
    (
      ?auto_1082329 - HOIST
      ?auto_1082327 - PLACE
      ?auto_1082331 - PLACE
      ?auto_1082328 - HOIST
      ?auto_1082326 - SURFACE
      ?auto_1082330 - SURFACE
      ?auto_1082325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082329 ?auto_1082327 ) ( IS-CRATE ?auto_1082324 ) ( not ( = ?auto_1082322 ?auto_1082324 ) ) ( not ( = ?auto_1082323 ?auto_1082322 ) ) ( not ( = ?auto_1082323 ?auto_1082324 ) ) ( not ( = ?auto_1082331 ?auto_1082327 ) ) ( HOIST-AT ?auto_1082328 ?auto_1082331 ) ( not ( = ?auto_1082329 ?auto_1082328 ) ) ( SURFACE-AT ?auto_1082324 ?auto_1082331 ) ( ON ?auto_1082324 ?auto_1082326 ) ( CLEAR ?auto_1082324 ) ( not ( = ?auto_1082322 ?auto_1082326 ) ) ( not ( = ?auto_1082324 ?auto_1082326 ) ) ( not ( = ?auto_1082323 ?auto_1082326 ) ) ( IS-CRATE ?auto_1082322 ) ( AVAILABLE ?auto_1082328 ) ( SURFACE-AT ?auto_1082322 ?auto_1082331 ) ( ON ?auto_1082322 ?auto_1082330 ) ( CLEAR ?auto_1082322 ) ( not ( = ?auto_1082322 ?auto_1082330 ) ) ( not ( = ?auto_1082324 ?auto_1082330 ) ) ( not ( = ?auto_1082323 ?auto_1082330 ) ) ( not ( = ?auto_1082326 ?auto_1082330 ) ) ( TRUCK-AT ?auto_1082325 ?auto_1082327 ) ( SURFACE-AT ?auto_1082321 ?auto_1082327 ) ( CLEAR ?auto_1082321 ) ( LIFTING ?auto_1082329 ?auto_1082323 ) ( IS-CRATE ?auto_1082323 ) ( not ( = ?auto_1082321 ?auto_1082323 ) ) ( not ( = ?auto_1082322 ?auto_1082321 ) ) ( not ( = ?auto_1082324 ?auto_1082321 ) ) ( not ( = ?auto_1082326 ?auto_1082321 ) ) ( not ( = ?auto_1082330 ?auto_1082321 ) ) ( ON ?auto_1082320 ?auto_1082319 ) ( ON ?auto_1082321 ?auto_1082320 ) ( not ( = ?auto_1082319 ?auto_1082320 ) ) ( not ( = ?auto_1082319 ?auto_1082321 ) ) ( not ( = ?auto_1082319 ?auto_1082323 ) ) ( not ( = ?auto_1082319 ?auto_1082322 ) ) ( not ( = ?auto_1082319 ?auto_1082324 ) ) ( not ( = ?auto_1082319 ?auto_1082326 ) ) ( not ( = ?auto_1082319 ?auto_1082330 ) ) ( not ( = ?auto_1082320 ?auto_1082321 ) ) ( not ( = ?auto_1082320 ?auto_1082323 ) ) ( not ( = ?auto_1082320 ?auto_1082322 ) ) ( not ( = ?auto_1082320 ?auto_1082324 ) ) ( not ( = ?auto_1082320 ?auto_1082326 ) ) ( not ( = ?auto_1082320 ?auto_1082330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082323 ?auto_1082322 ?auto_1082324 )
      ( MAKE-5CRATE-VERIFY ?auto_1082319 ?auto_1082320 ?auto_1082321 ?auto_1082323 ?auto_1082322 ?auto_1082324 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1082332 - SURFACE
      ?auto_1082333 - SURFACE
      ?auto_1082334 - SURFACE
      ?auto_1082336 - SURFACE
      ?auto_1082335 - SURFACE
      ?auto_1082337 - SURFACE
      ?auto_1082338 - SURFACE
    )
    :vars
    (
      ?auto_1082343 - HOIST
      ?auto_1082341 - PLACE
      ?auto_1082345 - PLACE
      ?auto_1082342 - HOIST
      ?auto_1082340 - SURFACE
      ?auto_1082344 - SURFACE
      ?auto_1082339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082343 ?auto_1082341 ) ( IS-CRATE ?auto_1082338 ) ( not ( = ?auto_1082337 ?auto_1082338 ) ) ( not ( = ?auto_1082335 ?auto_1082337 ) ) ( not ( = ?auto_1082335 ?auto_1082338 ) ) ( not ( = ?auto_1082345 ?auto_1082341 ) ) ( HOIST-AT ?auto_1082342 ?auto_1082345 ) ( not ( = ?auto_1082343 ?auto_1082342 ) ) ( SURFACE-AT ?auto_1082338 ?auto_1082345 ) ( ON ?auto_1082338 ?auto_1082340 ) ( CLEAR ?auto_1082338 ) ( not ( = ?auto_1082337 ?auto_1082340 ) ) ( not ( = ?auto_1082338 ?auto_1082340 ) ) ( not ( = ?auto_1082335 ?auto_1082340 ) ) ( IS-CRATE ?auto_1082337 ) ( AVAILABLE ?auto_1082342 ) ( SURFACE-AT ?auto_1082337 ?auto_1082345 ) ( ON ?auto_1082337 ?auto_1082344 ) ( CLEAR ?auto_1082337 ) ( not ( = ?auto_1082337 ?auto_1082344 ) ) ( not ( = ?auto_1082338 ?auto_1082344 ) ) ( not ( = ?auto_1082335 ?auto_1082344 ) ) ( not ( = ?auto_1082340 ?auto_1082344 ) ) ( TRUCK-AT ?auto_1082339 ?auto_1082341 ) ( SURFACE-AT ?auto_1082336 ?auto_1082341 ) ( CLEAR ?auto_1082336 ) ( LIFTING ?auto_1082343 ?auto_1082335 ) ( IS-CRATE ?auto_1082335 ) ( not ( = ?auto_1082336 ?auto_1082335 ) ) ( not ( = ?auto_1082337 ?auto_1082336 ) ) ( not ( = ?auto_1082338 ?auto_1082336 ) ) ( not ( = ?auto_1082340 ?auto_1082336 ) ) ( not ( = ?auto_1082344 ?auto_1082336 ) ) ( ON ?auto_1082333 ?auto_1082332 ) ( ON ?auto_1082334 ?auto_1082333 ) ( ON ?auto_1082336 ?auto_1082334 ) ( not ( = ?auto_1082332 ?auto_1082333 ) ) ( not ( = ?auto_1082332 ?auto_1082334 ) ) ( not ( = ?auto_1082332 ?auto_1082336 ) ) ( not ( = ?auto_1082332 ?auto_1082335 ) ) ( not ( = ?auto_1082332 ?auto_1082337 ) ) ( not ( = ?auto_1082332 ?auto_1082338 ) ) ( not ( = ?auto_1082332 ?auto_1082340 ) ) ( not ( = ?auto_1082332 ?auto_1082344 ) ) ( not ( = ?auto_1082333 ?auto_1082334 ) ) ( not ( = ?auto_1082333 ?auto_1082336 ) ) ( not ( = ?auto_1082333 ?auto_1082335 ) ) ( not ( = ?auto_1082333 ?auto_1082337 ) ) ( not ( = ?auto_1082333 ?auto_1082338 ) ) ( not ( = ?auto_1082333 ?auto_1082340 ) ) ( not ( = ?auto_1082333 ?auto_1082344 ) ) ( not ( = ?auto_1082334 ?auto_1082336 ) ) ( not ( = ?auto_1082334 ?auto_1082335 ) ) ( not ( = ?auto_1082334 ?auto_1082337 ) ) ( not ( = ?auto_1082334 ?auto_1082338 ) ) ( not ( = ?auto_1082334 ?auto_1082340 ) ) ( not ( = ?auto_1082334 ?auto_1082344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082335 ?auto_1082337 ?auto_1082338 )
      ( MAKE-6CRATE-VERIFY ?auto_1082332 ?auto_1082333 ?auto_1082334 ?auto_1082336 ?auto_1082335 ?auto_1082337 ?auto_1082338 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1082346 - SURFACE
      ?auto_1082347 - SURFACE
      ?auto_1082348 - SURFACE
      ?auto_1082350 - SURFACE
      ?auto_1082349 - SURFACE
      ?auto_1082351 - SURFACE
      ?auto_1082352 - SURFACE
      ?auto_1082353 - SURFACE
    )
    :vars
    (
      ?auto_1082358 - HOIST
      ?auto_1082356 - PLACE
      ?auto_1082360 - PLACE
      ?auto_1082357 - HOIST
      ?auto_1082355 - SURFACE
      ?auto_1082359 - SURFACE
      ?auto_1082354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082358 ?auto_1082356 ) ( IS-CRATE ?auto_1082353 ) ( not ( = ?auto_1082352 ?auto_1082353 ) ) ( not ( = ?auto_1082351 ?auto_1082352 ) ) ( not ( = ?auto_1082351 ?auto_1082353 ) ) ( not ( = ?auto_1082360 ?auto_1082356 ) ) ( HOIST-AT ?auto_1082357 ?auto_1082360 ) ( not ( = ?auto_1082358 ?auto_1082357 ) ) ( SURFACE-AT ?auto_1082353 ?auto_1082360 ) ( ON ?auto_1082353 ?auto_1082355 ) ( CLEAR ?auto_1082353 ) ( not ( = ?auto_1082352 ?auto_1082355 ) ) ( not ( = ?auto_1082353 ?auto_1082355 ) ) ( not ( = ?auto_1082351 ?auto_1082355 ) ) ( IS-CRATE ?auto_1082352 ) ( AVAILABLE ?auto_1082357 ) ( SURFACE-AT ?auto_1082352 ?auto_1082360 ) ( ON ?auto_1082352 ?auto_1082359 ) ( CLEAR ?auto_1082352 ) ( not ( = ?auto_1082352 ?auto_1082359 ) ) ( not ( = ?auto_1082353 ?auto_1082359 ) ) ( not ( = ?auto_1082351 ?auto_1082359 ) ) ( not ( = ?auto_1082355 ?auto_1082359 ) ) ( TRUCK-AT ?auto_1082354 ?auto_1082356 ) ( SURFACE-AT ?auto_1082349 ?auto_1082356 ) ( CLEAR ?auto_1082349 ) ( LIFTING ?auto_1082358 ?auto_1082351 ) ( IS-CRATE ?auto_1082351 ) ( not ( = ?auto_1082349 ?auto_1082351 ) ) ( not ( = ?auto_1082352 ?auto_1082349 ) ) ( not ( = ?auto_1082353 ?auto_1082349 ) ) ( not ( = ?auto_1082355 ?auto_1082349 ) ) ( not ( = ?auto_1082359 ?auto_1082349 ) ) ( ON ?auto_1082347 ?auto_1082346 ) ( ON ?auto_1082348 ?auto_1082347 ) ( ON ?auto_1082350 ?auto_1082348 ) ( ON ?auto_1082349 ?auto_1082350 ) ( not ( = ?auto_1082346 ?auto_1082347 ) ) ( not ( = ?auto_1082346 ?auto_1082348 ) ) ( not ( = ?auto_1082346 ?auto_1082350 ) ) ( not ( = ?auto_1082346 ?auto_1082349 ) ) ( not ( = ?auto_1082346 ?auto_1082351 ) ) ( not ( = ?auto_1082346 ?auto_1082352 ) ) ( not ( = ?auto_1082346 ?auto_1082353 ) ) ( not ( = ?auto_1082346 ?auto_1082355 ) ) ( not ( = ?auto_1082346 ?auto_1082359 ) ) ( not ( = ?auto_1082347 ?auto_1082348 ) ) ( not ( = ?auto_1082347 ?auto_1082350 ) ) ( not ( = ?auto_1082347 ?auto_1082349 ) ) ( not ( = ?auto_1082347 ?auto_1082351 ) ) ( not ( = ?auto_1082347 ?auto_1082352 ) ) ( not ( = ?auto_1082347 ?auto_1082353 ) ) ( not ( = ?auto_1082347 ?auto_1082355 ) ) ( not ( = ?auto_1082347 ?auto_1082359 ) ) ( not ( = ?auto_1082348 ?auto_1082350 ) ) ( not ( = ?auto_1082348 ?auto_1082349 ) ) ( not ( = ?auto_1082348 ?auto_1082351 ) ) ( not ( = ?auto_1082348 ?auto_1082352 ) ) ( not ( = ?auto_1082348 ?auto_1082353 ) ) ( not ( = ?auto_1082348 ?auto_1082355 ) ) ( not ( = ?auto_1082348 ?auto_1082359 ) ) ( not ( = ?auto_1082350 ?auto_1082349 ) ) ( not ( = ?auto_1082350 ?auto_1082351 ) ) ( not ( = ?auto_1082350 ?auto_1082352 ) ) ( not ( = ?auto_1082350 ?auto_1082353 ) ) ( not ( = ?auto_1082350 ?auto_1082355 ) ) ( not ( = ?auto_1082350 ?auto_1082359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082351 ?auto_1082352 ?auto_1082353 )
      ( MAKE-7CRATE-VERIFY ?auto_1082346 ?auto_1082347 ?auto_1082348 ?auto_1082350 ?auto_1082349 ?auto_1082351 ?auto_1082352 ?auto_1082353 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1082361 - SURFACE
      ?auto_1082362 - SURFACE
      ?auto_1082363 - SURFACE
      ?auto_1082365 - SURFACE
      ?auto_1082364 - SURFACE
      ?auto_1082366 - SURFACE
      ?auto_1082367 - SURFACE
      ?auto_1082368 - SURFACE
      ?auto_1082369 - SURFACE
    )
    :vars
    (
      ?auto_1082374 - HOIST
      ?auto_1082372 - PLACE
      ?auto_1082376 - PLACE
      ?auto_1082373 - HOIST
      ?auto_1082371 - SURFACE
      ?auto_1082375 - SURFACE
      ?auto_1082370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082374 ?auto_1082372 ) ( IS-CRATE ?auto_1082369 ) ( not ( = ?auto_1082368 ?auto_1082369 ) ) ( not ( = ?auto_1082367 ?auto_1082368 ) ) ( not ( = ?auto_1082367 ?auto_1082369 ) ) ( not ( = ?auto_1082376 ?auto_1082372 ) ) ( HOIST-AT ?auto_1082373 ?auto_1082376 ) ( not ( = ?auto_1082374 ?auto_1082373 ) ) ( SURFACE-AT ?auto_1082369 ?auto_1082376 ) ( ON ?auto_1082369 ?auto_1082371 ) ( CLEAR ?auto_1082369 ) ( not ( = ?auto_1082368 ?auto_1082371 ) ) ( not ( = ?auto_1082369 ?auto_1082371 ) ) ( not ( = ?auto_1082367 ?auto_1082371 ) ) ( IS-CRATE ?auto_1082368 ) ( AVAILABLE ?auto_1082373 ) ( SURFACE-AT ?auto_1082368 ?auto_1082376 ) ( ON ?auto_1082368 ?auto_1082375 ) ( CLEAR ?auto_1082368 ) ( not ( = ?auto_1082368 ?auto_1082375 ) ) ( not ( = ?auto_1082369 ?auto_1082375 ) ) ( not ( = ?auto_1082367 ?auto_1082375 ) ) ( not ( = ?auto_1082371 ?auto_1082375 ) ) ( TRUCK-AT ?auto_1082370 ?auto_1082372 ) ( SURFACE-AT ?auto_1082366 ?auto_1082372 ) ( CLEAR ?auto_1082366 ) ( LIFTING ?auto_1082374 ?auto_1082367 ) ( IS-CRATE ?auto_1082367 ) ( not ( = ?auto_1082366 ?auto_1082367 ) ) ( not ( = ?auto_1082368 ?auto_1082366 ) ) ( not ( = ?auto_1082369 ?auto_1082366 ) ) ( not ( = ?auto_1082371 ?auto_1082366 ) ) ( not ( = ?auto_1082375 ?auto_1082366 ) ) ( ON ?auto_1082362 ?auto_1082361 ) ( ON ?auto_1082363 ?auto_1082362 ) ( ON ?auto_1082365 ?auto_1082363 ) ( ON ?auto_1082364 ?auto_1082365 ) ( ON ?auto_1082366 ?auto_1082364 ) ( not ( = ?auto_1082361 ?auto_1082362 ) ) ( not ( = ?auto_1082361 ?auto_1082363 ) ) ( not ( = ?auto_1082361 ?auto_1082365 ) ) ( not ( = ?auto_1082361 ?auto_1082364 ) ) ( not ( = ?auto_1082361 ?auto_1082366 ) ) ( not ( = ?auto_1082361 ?auto_1082367 ) ) ( not ( = ?auto_1082361 ?auto_1082368 ) ) ( not ( = ?auto_1082361 ?auto_1082369 ) ) ( not ( = ?auto_1082361 ?auto_1082371 ) ) ( not ( = ?auto_1082361 ?auto_1082375 ) ) ( not ( = ?auto_1082362 ?auto_1082363 ) ) ( not ( = ?auto_1082362 ?auto_1082365 ) ) ( not ( = ?auto_1082362 ?auto_1082364 ) ) ( not ( = ?auto_1082362 ?auto_1082366 ) ) ( not ( = ?auto_1082362 ?auto_1082367 ) ) ( not ( = ?auto_1082362 ?auto_1082368 ) ) ( not ( = ?auto_1082362 ?auto_1082369 ) ) ( not ( = ?auto_1082362 ?auto_1082371 ) ) ( not ( = ?auto_1082362 ?auto_1082375 ) ) ( not ( = ?auto_1082363 ?auto_1082365 ) ) ( not ( = ?auto_1082363 ?auto_1082364 ) ) ( not ( = ?auto_1082363 ?auto_1082366 ) ) ( not ( = ?auto_1082363 ?auto_1082367 ) ) ( not ( = ?auto_1082363 ?auto_1082368 ) ) ( not ( = ?auto_1082363 ?auto_1082369 ) ) ( not ( = ?auto_1082363 ?auto_1082371 ) ) ( not ( = ?auto_1082363 ?auto_1082375 ) ) ( not ( = ?auto_1082365 ?auto_1082364 ) ) ( not ( = ?auto_1082365 ?auto_1082366 ) ) ( not ( = ?auto_1082365 ?auto_1082367 ) ) ( not ( = ?auto_1082365 ?auto_1082368 ) ) ( not ( = ?auto_1082365 ?auto_1082369 ) ) ( not ( = ?auto_1082365 ?auto_1082371 ) ) ( not ( = ?auto_1082365 ?auto_1082375 ) ) ( not ( = ?auto_1082364 ?auto_1082366 ) ) ( not ( = ?auto_1082364 ?auto_1082367 ) ) ( not ( = ?auto_1082364 ?auto_1082368 ) ) ( not ( = ?auto_1082364 ?auto_1082369 ) ) ( not ( = ?auto_1082364 ?auto_1082371 ) ) ( not ( = ?auto_1082364 ?auto_1082375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082367 ?auto_1082368 ?auto_1082369 )
      ( MAKE-8CRATE-VERIFY ?auto_1082361 ?auto_1082362 ?auto_1082363 ?auto_1082365 ?auto_1082364 ?auto_1082366 ?auto_1082367 ?auto_1082368 ?auto_1082369 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1082377 - SURFACE
      ?auto_1082378 - SURFACE
      ?auto_1082379 - SURFACE
      ?auto_1082381 - SURFACE
      ?auto_1082380 - SURFACE
      ?auto_1082382 - SURFACE
      ?auto_1082383 - SURFACE
      ?auto_1082384 - SURFACE
      ?auto_1082385 - SURFACE
      ?auto_1082386 - SURFACE
    )
    :vars
    (
      ?auto_1082391 - HOIST
      ?auto_1082389 - PLACE
      ?auto_1082393 - PLACE
      ?auto_1082390 - HOIST
      ?auto_1082388 - SURFACE
      ?auto_1082392 - SURFACE
      ?auto_1082387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082391 ?auto_1082389 ) ( IS-CRATE ?auto_1082386 ) ( not ( = ?auto_1082385 ?auto_1082386 ) ) ( not ( = ?auto_1082384 ?auto_1082385 ) ) ( not ( = ?auto_1082384 ?auto_1082386 ) ) ( not ( = ?auto_1082393 ?auto_1082389 ) ) ( HOIST-AT ?auto_1082390 ?auto_1082393 ) ( not ( = ?auto_1082391 ?auto_1082390 ) ) ( SURFACE-AT ?auto_1082386 ?auto_1082393 ) ( ON ?auto_1082386 ?auto_1082388 ) ( CLEAR ?auto_1082386 ) ( not ( = ?auto_1082385 ?auto_1082388 ) ) ( not ( = ?auto_1082386 ?auto_1082388 ) ) ( not ( = ?auto_1082384 ?auto_1082388 ) ) ( IS-CRATE ?auto_1082385 ) ( AVAILABLE ?auto_1082390 ) ( SURFACE-AT ?auto_1082385 ?auto_1082393 ) ( ON ?auto_1082385 ?auto_1082392 ) ( CLEAR ?auto_1082385 ) ( not ( = ?auto_1082385 ?auto_1082392 ) ) ( not ( = ?auto_1082386 ?auto_1082392 ) ) ( not ( = ?auto_1082384 ?auto_1082392 ) ) ( not ( = ?auto_1082388 ?auto_1082392 ) ) ( TRUCK-AT ?auto_1082387 ?auto_1082389 ) ( SURFACE-AT ?auto_1082383 ?auto_1082389 ) ( CLEAR ?auto_1082383 ) ( LIFTING ?auto_1082391 ?auto_1082384 ) ( IS-CRATE ?auto_1082384 ) ( not ( = ?auto_1082383 ?auto_1082384 ) ) ( not ( = ?auto_1082385 ?auto_1082383 ) ) ( not ( = ?auto_1082386 ?auto_1082383 ) ) ( not ( = ?auto_1082388 ?auto_1082383 ) ) ( not ( = ?auto_1082392 ?auto_1082383 ) ) ( ON ?auto_1082378 ?auto_1082377 ) ( ON ?auto_1082379 ?auto_1082378 ) ( ON ?auto_1082381 ?auto_1082379 ) ( ON ?auto_1082380 ?auto_1082381 ) ( ON ?auto_1082382 ?auto_1082380 ) ( ON ?auto_1082383 ?auto_1082382 ) ( not ( = ?auto_1082377 ?auto_1082378 ) ) ( not ( = ?auto_1082377 ?auto_1082379 ) ) ( not ( = ?auto_1082377 ?auto_1082381 ) ) ( not ( = ?auto_1082377 ?auto_1082380 ) ) ( not ( = ?auto_1082377 ?auto_1082382 ) ) ( not ( = ?auto_1082377 ?auto_1082383 ) ) ( not ( = ?auto_1082377 ?auto_1082384 ) ) ( not ( = ?auto_1082377 ?auto_1082385 ) ) ( not ( = ?auto_1082377 ?auto_1082386 ) ) ( not ( = ?auto_1082377 ?auto_1082388 ) ) ( not ( = ?auto_1082377 ?auto_1082392 ) ) ( not ( = ?auto_1082378 ?auto_1082379 ) ) ( not ( = ?auto_1082378 ?auto_1082381 ) ) ( not ( = ?auto_1082378 ?auto_1082380 ) ) ( not ( = ?auto_1082378 ?auto_1082382 ) ) ( not ( = ?auto_1082378 ?auto_1082383 ) ) ( not ( = ?auto_1082378 ?auto_1082384 ) ) ( not ( = ?auto_1082378 ?auto_1082385 ) ) ( not ( = ?auto_1082378 ?auto_1082386 ) ) ( not ( = ?auto_1082378 ?auto_1082388 ) ) ( not ( = ?auto_1082378 ?auto_1082392 ) ) ( not ( = ?auto_1082379 ?auto_1082381 ) ) ( not ( = ?auto_1082379 ?auto_1082380 ) ) ( not ( = ?auto_1082379 ?auto_1082382 ) ) ( not ( = ?auto_1082379 ?auto_1082383 ) ) ( not ( = ?auto_1082379 ?auto_1082384 ) ) ( not ( = ?auto_1082379 ?auto_1082385 ) ) ( not ( = ?auto_1082379 ?auto_1082386 ) ) ( not ( = ?auto_1082379 ?auto_1082388 ) ) ( not ( = ?auto_1082379 ?auto_1082392 ) ) ( not ( = ?auto_1082381 ?auto_1082380 ) ) ( not ( = ?auto_1082381 ?auto_1082382 ) ) ( not ( = ?auto_1082381 ?auto_1082383 ) ) ( not ( = ?auto_1082381 ?auto_1082384 ) ) ( not ( = ?auto_1082381 ?auto_1082385 ) ) ( not ( = ?auto_1082381 ?auto_1082386 ) ) ( not ( = ?auto_1082381 ?auto_1082388 ) ) ( not ( = ?auto_1082381 ?auto_1082392 ) ) ( not ( = ?auto_1082380 ?auto_1082382 ) ) ( not ( = ?auto_1082380 ?auto_1082383 ) ) ( not ( = ?auto_1082380 ?auto_1082384 ) ) ( not ( = ?auto_1082380 ?auto_1082385 ) ) ( not ( = ?auto_1082380 ?auto_1082386 ) ) ( not ( = ?auto_1082380 ?auto_1082388 ) ) ( not ( = ?auto_1082380 ?auto_1082392 ) ) ( not ( = ?auto_1082382 ?auto_1082383 ) ) ( not ( = ?auto_1082382 ?auto_1082384 ) ) ( not ( = ?auto_1082382 ?auto_1082385 ) ) ( not ( = ?auto_1082382 ?auto_1082386 ) ) ( not ( = ?auto_1082382 ?auto_1082388 ) ) ( not ( = ?auto_1082382 ?auto_1082392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082384 ?auto_1082385 ?auto_1082386 )
      ( MAKE-9CRATE-VERIFY ?auto_1082377 ?auto_1082378 ?auto_1082379 ?auto_1082381 ?auto_1082380 ?auto_1082382 ?auto_1082383 ?auto_1082384 ?auto_1082385 ?auto_1082386 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1082394 - SURFACE
      ?auto_1082395 - SURFACE
      ?auto_1082396 - SURFACE
      ?auto_1082398 - SURFACE
      ?auto_1082397 - SURFACE
      ?auto_1082399 - SURFACE
      ?auto_1082400 - SURFACE
      ?auto_1082401 - SURFACE
      ?auto_1082402 - SURFACE
      ?auto_1082403 - SURFACE
      ?auto_1082404 - SURFACE
    )
    :vars
    (
      ?auto_1082409 - HOIST
      ?auto_1082407 - PLACE
      ?auto_1082411 - PLACE
      ?auto_1082408 - HOIST
      ?auto_1082406 - SURFACE
      ?auto_1082410 - SURFACE
      ?auto_1082405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082409 ?auto_1082407 ) ( IS-CRATE ?auto_1082404 ) ( not ( = ?auto_1082403 ?auto_1082404 ) ) ( not ( = ?auto_1082402 ?auto_1082403 ) ) ( not ( = ?auto_1082402 ?auto_1082404 ) ) ( not ( = ?auto_1082411 ?auto_1082407 ) ) ( HOIST-AT ?auto_1082408 ?auto_1082411 ) ( not ( = ?auto_1082409 ?auto_1082408 ) ) ( SURFACE-AT ?auto_1082404 ?auto_1082411 ) ( ON ?auto_1082404 ?auto_1082406 ) ( CLEAR ?auto_1082404 ) ( not ( = ?auto_1082403 ?auto_1082406 ) ) ( not ( = ?auto_1082404 ?auto_1082406 ) ) ( not ( = ?auto_1082402 ?auto_1082406 ) ) ( IS-CRATE ?auto_1082403 ) ( AVAILABLE ?auto_1082408 ) ( SURFACE-AT ?auto_1082403 ?auto_1082411 ) ( ON ?auto_1082403 ?auto_1082410 ) ( CLEAR ?auto_1082403 ) ( not ( = ?auto_1082403 ?auto_1082410 ) ) ( not ( = ?auto_1082404 ?auto_1082410 ) ) ( not ( = ?auto_1082402 ?auto_1082410 ) ) ( not ( = ?auto_1082406 ?auto_1082410 ) ) ( TRUCK-AT ?auto_1082405 ?auto_1082407 ) ( SURFACE-AT ?auto_1082401 ?auto_1082407 ) ( CLEAR ?auto_1082401 ) ( LIFTING ?auto_1082409 ?auto_1082402 ) ( IS-CRATE ?auto_1082402 ) ( not ( = ?auto_1082401 ?auto_1082402 ) ) ( not ( = ?auto_1082403 ?auto_1082401 ) ) ( not ( = ?auto_1082404 ?auto_1082401 ) ) ( not ( = ?auto_1082406 ?auto_1082401 ) ) ( not ( = ?auto_1082410 ?auto_1082401 ) ) ( ON ?auto_1082395 ?auto_1082394 ) ( ON ?auto_1082396 ?auto_1082395 ) ( ON ?auto_1082398 ?auto_1082396 ) ( ON ?auto_1082397 ?auto_1082398 ) ( ON ?auto_1082399 ?auto_1082397 ) ( ON ?auto_1082400 ?auto_1082399 ) ( ON ?auto_1082401 ?auto_1082400 ) ( not ( = ?auto_1082394 ?auto_1082395 ) ) ( not ( = ?auto_1082394 ?auto_1082396 ) ) ( not ( = ?auto_1082394 ?auto_1082398 ) ) ( not ( = ?auto_1082394 ?auto_1082397 ) ) ( not ( = ?auto_1082394 ?auto_1082399 ) ) ( not ( = ?auto_1082394 ?auto_1082400 ) ) ( not ( = ?auto_1082394 ?auto_1082401 ) ) ( not ( = ?auto_1082394 ?auto_1082402 ) ) ( not ( = ?auto_1082394 ?auto_1082403 ) ) ( not ( = ?auto_1082394 ?auto_1082404 ) ) ( not ( = ?auto_1082394 ?auto_1082406 ) ) ( not ( = ?auto_1082394 ?auto_1082410 ) ) ( not ( = ?auto_1082395 ?auto_1082396 ) ) ( not ( = ?auto_1082395 ?auto_1082398 ) ) ( not ( = ?auto_1082395 ?auto_1082397 ) ) ( not ( = ?auto_1082395 ?auto_1082399 ) ) ( not ( = ?auto_1082395 ?auto_1082400 ) ) ( not ( = ?auto_1082395 ?auto_1082401 ) ) ( not ( = ?auto_1082395 ?auto_1082402 ) ) ( not ( = ?auto_1082395 ?auto_1082403 ) ) ( not ( = ?auto_1082395 ?auto_1082404 ) ) ( not ( = ?auto_1082395 ?auto_1082406 ) ) ( not ( = ?auto_1082395 ?auto_1082410 ) ) ( not ( = ?auto_1082396 ?auto_1082398 ) ) ( not ( = ?auto_1082396 ?auto_1082397 ) ) ( not ( = ?auto_1082396 ?auto_1082399 ) ) ( not ( = ?auto_1082396 ?auto_1082400 ) ) ( not ( = ?auto_1082396 ?auto_1082401 ) ) ( not ( = ?auto_1082396 ?auto_1082402 ) ) ( not ( = ?auto_1082396 ?auto_1082403 ) ) ( not ( = ?auto_1082396 ?auto_1082404 ) ) ( not ( = ?auto_1082396 ?auto_1082406 ) ) ( not ( = ?auto_1082396 ?auto_1082410 ) ) ( not ( = ?auto_1082398 ?auto_1082397 ) ) ( not ( = ?auto_1082398 ?auto_1082399 ) ) ( not ( = ?auto_1082398 ?auto_1082400 ) ) ( not ( = ?auto_1082398 ?auto_1082401 ) ) ( not ( = ?auto_1082398 ?auto_1082402 ) ) ( not ( = ?auto_1082398 ?auto_1082403 ) ) ( not ( = ?auto_1082398 ?auto_1082404 ) ) ( not ( = ?auto_1082398 ?auto_1082406 ) ) ( not ( = ?auto_1082398 ?auto_1082410 ) ) ( not ( = ?auto_1082397 ?auto_1082399 ) ) ( not ( = ?auto_1082397 ?auto_1082400 ) ) ( not ( = ?auto_1082397 ?auto_1082401 ) ) ( not ( = ?auto_1082397 ?auto_1082402 ) ) ( not ( = ?auto_1082397 ?auto_1082403 ) ) ( not ( = ?auto_1082397 ?auto_1082404 ) ) ( not ( = ?auto_1082397 ?auto_1082406 ) ) ( not ( = ?auto_1082397 ?auto_1082410 ) ) ( not ( = ?auto_1082399 ?auto_1082400 ) ) ( not ( = ?auto_1082399 ?auto_1082401 ) ) ( not ( = ?auto_1082399 ?auto_1082402 ) ) ( not ( = ?auto_1082399 ?auto_1082403 ) ) ( not ( = ?auto_1082399 ?auto_1082404 ) ) ( not ( = ?auto_1082399 ?auto_1082406 ) ) ( not ( = ?auto_1082399 ?auto_1082410 ) ) ( not ( = ?auto_1082400 ?auto_1082401 ) ) ( not ( = ?auto_1082400 ?auto_1082402 ) ) ( not ( = ?auto_1082400 ?auto_1082403 ) ) ( not ( = ?auto_1082400 ?auto_1082404 ) ) ( not ( = ?auto_1082400 ?auto_1082406 ) ) ( not ( = ?auto_1082400 ?auto_1082410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082402 ?auto_1082403 ?auto_1082404 )
      ( MAKE-10CRATE-VERIFY ?auto_1082394 ?auto_1082395 ?auto_1082396 ?auto_1082398 ?auto_1082397 ?auto_1082399 ?auto_1082400 ?auto_1082401 ?auto_1082402 ?auto_1082403 ?auto_1082404 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1082412 - SURFACE
      ?auto_1082413 - SURFACE
      ?auto_1082414 - SURFACE
      ?auto_1082416 - SURFACE
      ?auto_1082415 - SURFACE
      ?auto_1082417 - SURFACE
      ?auto_1082418 - SURFACE
      ?auto_1082419 - SURFACE
      ?auto_1082420 - SURFACE
      ?auto_1082421 - SURFACE
      ?auto_1082422 - SURFACE
      ?auto_1082423 - SURFACE
    )
    :vars
    (
      ?auto_1082428 - HOIST
      ?auto_1082426 - PLACE
      ?auto_1082430 - PLACE
      ?auto_1082427 - HOIST
      ?auto_1082425 - SURFACE
      ?auto_1082429 - SURFACE
      ?auto_1082424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082428 ?auto_1082426 ) ( IS-CRATE ?auto_1082423 ) ( not ( = ?auto_1082422 ?auto_1082423 ) ) ( not ( = ?auto_1082421 ?auto_1082422 ) ) ( not ( = ?auto_1082421 ?auto_1082423 ) ) ( not ( = ?auto_1082430 ?auto_1082426 ) ) ( HOIST-AT ?auto_1082427 ?auto_1082430 ) ( not ( = ?auto_1082428 ?auto_1082427 ) ) ( SURFACE-AT ?auto_1082423 ?auto_1082430 ) ( ON ?auto_1082423 ?auto_1082425 ) ( CLEAR ?auto_1082423 ) ( not ( = ?auto_1082422 ?auto_1082425 ) ) ( not ( = ?auto_1082423 ?auto_1082425 ) ) ( not ( = ?auto_1082421 ?auto_1082425 ) ) ( IS-CRATE ?auto_1082422 ) ( AVAILABLE ?auto_1082427 ) ( SURFACE-AT ?auto_1082422 ?auto_1082430 ) ( ON ?auto_1082422 ?auto_1082429 ) ( CLEAR ?auto_1082422 ) ( not ( = ?auto_1082422 ?auto_1082429 ) ) ( not ( = ?auto_1082423 ?auto_1082429 ) ) ( not ( = ?auto_1082421 ?auto_1082429 ) ) ( not ( = ?auto_1082425 ?auto_1082429 ) ) ( TRUCK-AT ?auto_1082424 ?auto_1082426 ) ( SURFACE-AT ?auto_1082420 ?auto_1082426 ) ( CLEAR ?auto_1082420 ) ( LIFTING ?auto_1082428 ?auto_1082421 ) ( IS-CRATE ?auto_1082421 ) ( not ( = ?auto_1082420 ?auto_1082421 ) ) ( not ( = ?auto_1082422 ?auto_1082420 ) ) ( not ( = ?auto_1082423 ?auto_1082420 ) ) ( not ( = ?auto_1082425 ?auto_1082420 ) ) ( not ( = ?auto_1082429 ?auto_1082420 ) ) ( ON ?auto_1082413 ?auto_1082412 ) ( ON ?auto_1082414 ?auto_1082413 ) ( ON ?auto_1082416 ?auto_1082414 ) ( ON ?auto_1082415 ?auto_1082416 ) ( ON ?auto_1082417 ?auto_1082415 ) ( ON ?auto_1082418 ?auto_1082417 ) ( ON ?auto_1082419 ?auto_1082418 ) ( ON ?auto_1082420 ?auto_1082419 ) ( not ( = ?auto_1082412 ?auto_1082413 ) ) ( not ( = ?auto_1082412 ?auto_1082414 ) ) ( not ( = ?auto_1082412 ?auto_1082416 ) ) ( not ( = ?auto_1082412 ?auto_1082415 ) ) ( not ( = ?auto_1082412 ?auto_1082417 ) ) ( not ( = ?auto_1082412 ?auto_1082418 ) ) ( not ( = ?auto_1082412 ?auto_1082419 ) ) ( not ( = ?auto_1082412 ?auto_1082420 ) ) ( not ( = ?auto_1082412 ?auto_1082421 ) ) ( not ( = ?auto_1082412 ?auto_1082422 ) ) ( not ( = ?auto_1082412 ?auto_1082423 ) ) ( not ( = ?auto_1082412 ?auto_1082425 ) ) ( not ( = ?auto_1082412 ?auto_1082429 ) ) ( not ( = ?auto_1082413 ?auto_1082414 ) ) ( not ( = ?auto_1082413 ?auto_1082416 ) ) ( not ( = ?auto_1082413 ?auto_1082415 ) ) ( not ( = ?auto_1082413 ?auto_1082417 ) ) ( not ( = ?auto_1082413 ?auto_1082418 ) ) ( not ( = ?auto_1082413 ?auto_1082419 ) ) ( not ( = ?auto_1082413 ?auto_1082420 ) ) ( not ( = ?auto_1082413 ?auto_1082421 ) ) ( not ( = ?auto_1082413 ?auto_1082422 ) ) ( not ( = ?auto_1082413 ?auto_1082423 ) ) ( not ( = ?auto_1082413 ?auto_1082425 ) ) ( not ( = ?auto_1082413 ?auto_1082429 ) ) ( not ( = ?auto_1082414 ?auto_1082416 ) ) ( not ( = ?auto_1082414 ?auto_1082415 ) ) ( not ( = ?auto_1082414 ?auto_1082417 ) ) ( not ( = ?auto_1082414 ?auto_1082418 ) ) ( not ( = ?auto_1082414 ?auto_1082419 ) ) ( not ( = ?auto_1082414 ?auto_1082420 ) ) ( not ( = ?auto_1082414 ?auto_1082421 ) ) ( not ( = ?auto_1082414 ?auto_1082422 ) ) ( not ( = ?auto_1082414 ?auto_1082423 ) ) ( not ( = ?auto_1082414 ?auto_1082425 ) ) ( not ( = ?auto_1082414 ?auto_1082429 ) ) ( not ( = ?auto_1082416 ?auto_1082415 ) ) ( not ( = ?auto_1082416 ?auto_1082417 ) ) ( not ( = ?auto_1082416 ?auto_1082418 ) ) ( not ( = ?auto_1082416 ?auto_1082419 ) ) ( not ( = ?auto_1082416 ?auto_1082420 ) ) ( not ( = ?auto_1082416 ?auto_1082421 ) ) ( not ( = ?auto_1082416 ?auto_1082422 ) ) ( not ( = ?auto_1082416 ?auto_1082423 ) ) ( not ( = ?auto_1082416 ?auto_1082425 ) ) ( not ( = ?auto_1082416 ?auto_1082429 ) ) ( not ( = ?auto_1082415 ?auto_1082417 ) ) ( not ( = ?auto_1082415 ?auto_1082418 ) ) ( not ( = ?auto_1082415 ?auto_1082419 ) ) ( not ( = ?auto_1082415 ?auto_1082420 ) ) ( not ( = ?auto_1082415 ?auto_1082421 ) ) ( not ( = ?auto_1082415 ?auto_1082422 ) ) ( not ( = ?auto_1082415 ?auto_1082423 ) ) ( not ( = ?auto_1082415 ?auto_1082425 ) ) ( not ( = ?auto_1082415 ?auto_1082429 ) ) ( not ( = ?auto_1082417 ?auto_1082418 ) ) ( not ( = ?auto_1082417 ?auto_1082419 ) ) ( not ( = ?auto_1082417 ?auto_1082420 ) ) ( not ( = ?auto_1082417 ?auto_1082421 ) ) ( not ( = ?auto_1082417 ?auto_1082422 ) ) ( not ( = ?auto_1082417 ?auto_1082423 ) ) ( not ( = ?auto_1082417 ?auto_1082425 ) ) ( not ( = ?auto_1082417 ?auto_1082429 ) ) ( not ( = ?auto_1082418 ?auto_1082419 ) ) ( not ( = ?auto_1082418 ?auto_1082420 ) ) ( not ( = ?auto_1082418 ?auto_1082421 ) ) ( not ( = ?auto_1082418 ?auto_1082422 ) ) ( not ( = ?auto_1082418 ?auto_1082423 ) ) ( not ( = ?auto_1082418 ?auto_1082425 ) ) ( not ( = ?auto_1082418 ?auto_1082429 ) ) ( not ( = ?auto_1082419 ?auto_1082420 ) ) ( not ( = ?auto_1082419 ?auto_1082421 ) ) ( not ( = ?auto_1082419 ?auto_1082422 ) ) ( not ( = ?auto_1082419 ?auto_1082423 ) ) ( not ( = ?auto_1082419 ?auto_1082425 ) ) ( not ( = ?auto_1082419 ?auto_1082429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082421 ?auto_1082422 ?auto_1082423 )
      ( MAKE-11CRATE-VERIFY ?auto_1082412 ?auto_1082413 ?auto_1082414 ?auto_1082416 ?auto_1082415 ?auto_1082417 ?auto_1082418 ?auto_1082419 ?auto_1082420 ?auto_1082421 ?auto_1082422 ?auto_1082423 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1082431 - SURFACE
      ?auto_1082432 - SURFACE
      ?auto_1082433 - SURFACE
      ?auto_1082435 - SURFACE
      ?auto_1082434 - SURFACE
      ?auto_1082436 - SURFACE
      ?auto_1082437 - SURFACE
      ?auto_1082438 - SURFACE
      ?auto_1082439 - SURFACE
      ?auto_1082440 - SURFACE
      ?auto_1082441 - SURFACE
      ?auto_1082442 - SURFACE
      ?auto_1082443 - SURFACE
    )
    :vars
    (
      ?auto_1082448 - HOIST
      ?auto_1082446 - PLACE
      ?auto_1082450 - PLACE
      ?auto_1082447 - HOIST
      ?auto_1082445 - SURFACE
      ?auto_1082449 - SURFACE
      ?auto_1082444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082448 ?auto_1082446 ) ( IS-CRATE ?auto_1082443 ) ( not ( = ?auto_1082442 ?auto_1082443 ) ) ( not ( = ?auto_1082441 ?auto_1082442 ) ) ( not ( = ?auto_1082441 ?auto_1082443 ) ) ( not ( = ?auto_1082450 ?auto_1082446 ) ) ( HOIST-AT ?auto_1082447 ?auto_1082450 ) ( not ( = ?auto_1082448 ?auto_1082447 ) ) ( SURFACE-AT ?auto_1082443 ?auto_1082450 ) ( ON ?auto_1082443 ?auto_1082445 ) ( CLEAR ?auto_1082443 ) ( not ( = ?auto_1082442 ?auto_1082445 ) ) ( not ( = ?auto_1082443 ?auto_1082445 ) ) ( not ( = ?auto_1082441 ?auto_1082445 ) ) ( IS-CRATE ?auto_1082442 ) ( AVAILABLE ?auto_1082447 ) ( SURFACE-AT ?auto_1082442 ?auto_1082450 ) ( ON ?auto_1082442 ?auto_1082449 ) ( CLEAR ?auto_1082442 ) ( not ( = ?auto_1082442 ?auto_1082449 ) ) ( not ( = ?auto_1082443 ?auto_1082449 ) ) ( not ( = ?auto_1082441 ?auto_1082449 ) ) ( not ( = ?auto_1082445 ?auto_1082449 ) ) ( TRUCK-AT ?auto_1082444 ?auto_1082446 ) ( SURFACE-AT ?auto_1082440 ?auto_1082446 ) ( CLEAR ?auto_1082440 ) ( LIFTING ?auto_1082448 ?auto_1082441 ) ( IS-CRATE ?auto_1082441 ) ( not ( = ?auto_1082440 ?auto_1082441 ) ) ( not ( = ?auto_1082442 ?auto_1082440 ) ) ( not ( = ?auto_1082443 ?auto_1082440 ) ) ( not ( = ?auto_1082445 ?auto_1082440 ) ) ( not ( = ?auto_1082449 ?auto_1082440 ) ) ( ON ?auto_1082432 ?auto_1082431 ) ( ON ?auto_1082433 ?auto_1082432 ) ( ON ?auto_1082435 ?auto_1082433 ) ( ON ?auto_1082434 ?auto_1082435 ) ( ON ?auto_1082436 ?auto_1082434 ) ( ON ?auto_1082437 ?auto_1082436 ) ( ON ?auto_1082438 ?auto_1082437 ) ( ON ?auto_1082439 ?auto_1082438 ) ( ON ?auto_1082440 ?auto_1082439 ) ( not ( = ?auto_1082431 ?auto_1082432 ) ) ( not ( = ?auto_1082431 ?auto_1082433 ) ) ( not ( = ?auto_1082431 ?auto_1082435 ) ) ( not ( = ?auto_1082431 ?auto_1082434 ) ) ( not ( = ?auto_1082431 ?auto_1082436 ) ) ( not ( = ?auto_1082431 ?auto_1082437 ) ) ( not ( = ?auto_1082431 ?auto_1082438 ) ) ( not ( = ?auto_1082431 ?auto_1082439 ) ) ( not ( = ?auto_1082431 ?auto_1082440 ) ) ( not ( = ?auto_1082431 ?auto_1082441 ) ) ( not ( = ?auto_1082431 ?auto_1082442 ) ) ( not ( = ?auto_1082431 ?auto_1082443 ) ) ( not ( = ?auto_1082431 ?auto_1082445 ) ) ( not ( = ?auto_1082431 ?auto_1082449 ) ) ( not ( = ?auto_1082432 ?auto_1082433 ) ) ( not ( = ?auto_1082432 ?auto_1082435 ) ) ( not ( = ?auto_1082432 ?auto_1082434 ) ) ( not ( = ?auto_1082432 ?auto_1082436 ) ) ( not ( = ?auto_1082432 ?auto_1082437 ) ) ( not ( = ?auto_1082432 ?auto_1082438 ) ) ( not ( = ?auto_1082432 ?auto_1082439 ) ) ( not ( = ?auto_1082432 ?auto_1082440 ) ) ( not ( = ?auto_1082432 ?auto_1082441 ) ) ( not ( = ?auto_1082432 ?auto_1082442 ) ) ( not ( = ?auto_1082432 ?auto_1082443 ) ) ( not ( = ?auto_1082432 ?auto_1082445 ) ) ( not ( = ?auto_1082432 ?auto_1082449 ) ) ( not ( = ?auto_1082433 ?auto_1082435 ) ) ( not ( = ?auto_1082433 ?auto_1082434 ) ) ( not ( = ?auto_1082433 ?auto_1082436 ) ) ( not ( = ?auto_1082433 ?auto_1082437 ) ) ( not ( = ?auto_1082433 ?auto_1082438 ) ) ( not ( = ?auto_1082433 ?auto_1082439 ) ) ( not ( = ?auto_1082433 ?auto_1082440 ) ) ( not ( = ?auto_1082433 ?auto_1082441 ) ) ( not ( = ?auto_1082433 ?auto_1082442 ) ) ( not ( = ?auto_1082433 ?auto_1082443 ) ) ( not ( = ?auto_1082433 ?auto_1082445 ) ) ( not ( = ?auto_1082433 ?auto_1082449 ) ) ( not ( = ?auto_1082435 ?auto_1082434 ) ) ( not ( = ?auto_1082435 ?auto_1082436 ) ) ( not ( = ?auto_1082435 ?auto_1082437 ) ) ( not ( = ?auto_1082435 ?auto_1082438 ) ) ( not ( = ?auto_1082435 ?auto_1082439 ) ) ( not ( = ?auto_1082435 ?auto_1082440 ) ) ( not ( = ?auto_1082435 ?auto_1082441 ) ) ( not ( = ?auto_1082435 ?auto_1082442 ) ) ( not ( = ?auto_1082435 ?auto_1082443 ) ) ( not ( = ?auto_1082435 ?auto_1082445 ) ) ( not ( = ?auto_1082435 ?auto_1082449 ) ) ( not ( = ?auto_1082434 ?auto_1082436 ) ) ( not ( = ?auto_1082434 ?auto_1082437 ) ) ( not ( = ?auto_1082434 ?auto_1082438 ) ) ( not ( = ?auto_1082434 ?auto_1082439 ) ) ( not ( = ?auto_1082434 ?auto_1082440 ) ) ( not ( = ?auto_1082434 ?auto_1082441 ) ) ( not ( = ?auto_1082434 ?auto_1082442 ) ) ( not ( = ?auto_1082434 ?auto_1082443 ) ) ( not ( = ?auto_1082434 ?auto_1082445 ) ) ( not ( = ?auto_1082434 ?auto_1082449 ) ) ( not ( = ?auto_1082436 ?auto_1082437 ) ) ( not ( = ?auto_1082436 ?auto_1082438 ) ) ( not ( = ?auto_1082436 ?auto_1082439 ) ) ( not ( = ?auto_1082436 ?auto_1082440 ) ) ( not ( = ?auto_1082436 ?auto_1082441 ) ) ( not ( = ?auto_1082436 ?auto_1082442 ) ) ( not ( = ?auto_1082436 ?auto_1082443 ) ) ( not ( = ?auto_1082436 ?auto_1082445 ) ) ( not ( = ?auto_1082436 ?auto_1082449 ) ) ( not ( = ?auto_1082437 ?auto_1082438 ) ) ( not ( = ?auto_1082437 ?auto_1082439 ) ) ( not ( = ?auto_1082437 ?auto_1082440 ) ) ( not ( = ?auto_1082437 ?auto_1082441 ) ) ( not ( = ?auto_1082437 ?auto_1082442 ) ) ( not ( = ?auto_1082437 ?auto_1082443 ) ) ( not ( = ?auto_1082437 ?auto_1082445 ) ) ( not ( = ?auto_1082437 ?auto_1082449 ) ) ( not ( = ?auto_1082438 ?auto_1082439 ) ) ( not ( = ?auto_1082438 ?auto_1082440 ) ) ( not ( = ?auto_1082438 ?auto_1082441 ) ) ( not ( = ?auto_1082438 ?auto_1082442 ) ) ( not ( = ?auto_1082438 ?auto_1082443 ) ) ( not ( = ?auto_1082438 ?auto_1082445 ) ) ( not ( = ?auto_1082438 ?auto_1082449 ) ) ( not ( = ?auto_1082439 ?auto_1082440 ) ) ( not ( = ?auto_1082439 ?auto_1082441 ) ) ( not ( = ?auto_1082439 ?auto_1082442 ) ) ( not ( = ?auto_1082439 ?auto_1082443 ) ) ( not ( = ?auto_1082439 ?auto_1082445 ) ) ( not ( = ?auto_1082439 ?auto_1082449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1082441 ?auto_1082442 ?auto_1082443 )
      ( MAKE-12CRATE-VERIFY ?auto_1082431 ?auto_1082432 ?auto_1082433 ?auto_1082435 ?auto_1082434 ?auto_1082436 ?auto_1082437 ?auto_1082438 ?auto_1082439 ?auto_1082440 ?auto_1082441 ?auto_1082442 ?auto_1082443 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1092972 - SURFACE
      ?auto_1092973 - SURFACE
      ?auto_1092974 - SURFACE
      ?auto_1092976 - SURFACE
      ?auto_1092975 - SURFACE
      ?auto_1092977 - SURFACE
      ?auto_1092978 - SURFACE
      ?auto_1092979 - SURFACE
      ?auto_1092980 - SURFACE
      ?auto_1092981 - SURFACE
      ?auto_1092982 - SURFACE
      ?auto_1092983 - SURFACE
      ?auto_1092984 - SURFACE
      ?auto_1092985 - SURFACE
    )
    :vars
    (
      ?auto_1092986 - HOIST
      ?auto_1092987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1092986 ?auto_1092987 ) ( SURFACE-AT ?auto_1092984 ?auto_1092987 ) ( CLEAR ?auto_1092984 ) ( LIFTING ?auto_1092986 ?auto_1092985 ) ( IS-CRATE ?auto_1092985 ) ( not ( = ?auto_1092984 ?auto_1092985 ) ) ( ON ?auto_1092973 ?auto_1092972 ) ( ON ?auto_1092974 ?auto_1092973 ) ( ON ?auto_1092976 ?auto_1092974 ) ( ON ?auto_1092975 ?auto_1092976 ) ( ON ?auto_1092977 ?auto_1092975 ) ( ON ?auto_1092978 ?auto_1092977 ) ( ON ?auto_1092979 ?auto_1092978 ) ( ON ?auto_1092980 ?auto_1092979 ) ( ON ?auto_1092981 ?auto_1092980 ) ( ON ?auto_1092982 ?auto_1092981 ) ( ON ?auto_1092983 ?auto_1092982 ) ( ON ?auto_1092984 ?auto_1092983 ) ( not ( = ?auto_1092972 ?auto_1092973 ) ) ( not ( = ?auto_1092972 ?auto_1092974 ) ) ( not ( = ?auto_1092972 ?auto_1092976 ) ) ( not ( = ?auto_1092972 ?auto_1092975 ) ) ( not ( = ?auto_1092972 ?auto_1092977 ) ) ( not ( = ?auto_1092972 ?auto_1092978 ) ) ( not ( = ?auto_1092972 ?auto_1092979 ) ) ( not ( = ?auto_1092972 ?auto_1092980 ) ) ( not ( = ?auto_1092972 ?auto_1092981 ) ) ( not ( = ?auto_1092972 ?auto_1092982 ) ) ( not ( = ?auto_1092972 ?auto_1092983 ) ) ( not ( = ?auto_1092972 ?auto_1092984 ) ) ( not ( = ?auto_1092972 ?auto_1092985 ) ) ( not ( = ?auto_1092973 ?auto_1092974 ) ) ( not ( = ?auto_1092973 ?auto_1092976 ) ) ( not ( = ?auto_1092973 ?auto_1092975 ) ) ( not ( = ?auto_1092973 ?auto_1092977 ) ) ( not ( = ?auto_1092973 ?auto_1092978 ) ) ( not ( = ?auto_1092973 ?auto_1092979 ) ) ( not ( = ?auto_1092973 ?auto_1092980 ) ) ( not ( = ?auto_1092973 ?auto_1092981 ) ) ( not ( = ?auto_1092973 ?auto_1092982 ) ) ( not ( = ?auto_1092973 ?auto_1092983 ) ) ( not ( = ?auto_1092973 ?auto_1092984 ) ) ( not ( = ?auto_1092973 ?auto_1092985 ) ) ( not ( = ?auto_1092974 ?auto_1092976 ) ) ( not ( = ?auto_1092974 ?auto_1092975 ) ) ( not ( = ?auto_1092974 ?auto_1092977 ) ) ( not ( = ?auto_1092974 ?auto_1092978 ) ) ( not ( = ?auto_1092974 ?auto_1092979 ) ) ( not ( = ?auto_1092974 ?auto_1092980 ) ) ( not ( = ?auto_1092974 ?auto_1092981 ) ) ( not ( = ?auto_1092974 ?auto_1092982 ) ) ( not ( = ?auto_1092974 ?auto_1092983 ) ) ( not ( = ?auto_1092974 ?auto_1092984 ) ) ( not ( = ?auto_1092974 ?auto_1092985 ) ) ( not ( = ?auto_1092976 ?auto_1092975 ) ) ( not ( = ?auto_1092976 ?auto_1092977 ) ) ( not ( = ?auto_1092976 ?auto_1092978 ) ) ( not ( = ?auto_1092976 ?auto_1092979 ) ) ( not ( = ?auto_1092976 ?auto_1092980 ) ) ( not ( = ?auto_1092976 ?auto_1092981 ) ) ( not ( = ?auto_1092976 ?auto_1092982 ) ) ( not ( = ?auto_1092976 ?auto_1092983 ) ) ( not ( = ?auto_1092976 ?auto_1092984 ) ) ( not ( = ?auto_1092976 ?auto_1092985 ) ) ( not ( = ?auto_1092975 ?auto_1092977 ) ) ( not ( = ?auto_1092975 ?auto_1092978 ) ) ( not ( = ?auto_1092975 ?auto_1092979 ) ) ( not ( = ?auto_1092975 ?auto_1092980 ) ) ( not ( = ?auto_1092975 ?auto_1092981 ) ) ( not ( = ?auto_1092975 ?auto_1092982 ) ) ( not ( = ?auto_1092975 ?auto_1092983 ) ) ( not ( = ?auto_1092975 ?auto_1092984 ) ) ( not ( = ?auto_1092975 ?auto_1092985 ) ) ( not ( = ?auto_1092977 ?auto_1092978 ) ) ( not ( = ?auto_1092977 ?auto_1092979 ) ) ( not ( = ?auto_1092977 ?auto_1092980 ) ) ( not ( = ?auto_1092977 ?auto_1092981 ) ) ( not ( = ?auto_1092977 ?auto_1092982 ) ) ( not ( = ?auto_1092977 ?auto_1092983 ) ) ( not ( = ?auto_1092977 ?auto_1092984 ) ) ( not ( = ?auto_1092977 ?auto_1092985 ) ) ( not ( = ?auto_1092978 ?auto_1092979 ) ) ( not ( = ?auto_1092978 ?auto_1092980 ) ) ( not ( = ?auto_1092978 ?auto_1092981 ) ) ( not ( = ?auto_1092978 ?auto_1092982 ) ) ( not ( = ?auto_1092978 ?auto_1092983 ) ) ( not ( = ?auto_1092978 ?auto_1092984 ) ) ( not ( = ?auto_1092978 ?auto_1092985 ) ) ( not ( = ?auto_1092979 ?auto_1092980 ) ) ( not ( = ?auto_1092979 ?auto_1092981 ) ) ( not ( = ?auto_1092979 ?auto_1092982 ) ) ( not ( = ?auto_1092979 ?auto_1092983 ) ) ( not ( = ?auto_1092979 ?auto_1092984 ) ) ( not ( = ?auto_1092979 ?auto_1092985 ) ) ( not ( = ?auto_1092980 ?auto_1092981 ) ) ( not ( = ?auto_1092980 ?auto_1092982 ) ) ( not ( = ?auto_1092980 ?auto_1092983 ) ) ( not ( = ?auto_1092980 ?auto_1092984 ) ) ( not ( = ?auto_1092980 ?auto_1092985 ) ) ( not ( = ?auto_1092981 ?auto_1092982 ) ) ( not ( = ?auto_1092981 ?auto_1092983 ) ) ( not ( = ?auto_1092981 ?auto_1092984 ) ) ( not ( = ?auto_1092981 ?auto_1092985 ) ) ( not ( = ?auto_1092982 ?auto_1092983 ) ) ( not ( = ?auto_1092982 ?auto_1092984 ) ) ( not ( = ?auto_1092982 ?auto_1092985 ) ) ( not ( = ?auto_1092983 ?auto_1092984 ) ) ( not ( = ?auto_1092983 ?auto_1092985 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1092984 ?auto_1092985 )
      ( MAKE-13CRATE-VERIFY ?auto_1092972 ?auto_1092973 ?auto_1092974 ?auto_1092976 ?auto_1092975 ?auto_1092977 ?auto_1092978 ?auto_1092979 ?auto_1092980 ?auto_1092981 ?auto_1092982 ?auto_1092983 ?auto_1092984 ?auto_1092985 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093114 - SURFACE
      ?auto_1093115 - SURFACE
      ?auto_1093116 - SURFACE
      ?auto_1093118 - SURFACE
      ?auto_1093117 - SURFACE
      ?auto_1093119 - SURFACE
      ?auto_1093120 - SURFACE
      ?auto_1093121 - SURFACE
      ?auto_1093122 - SURFACE
      ?auto_1093123 - SURFACE
      ?auto_1093124 - SURFACE
      ?auto_1093125 - SURFACE
      ?auto_1093126 - SURFACE
      ?auto_1093127 - SURFACE
    )
    :vars
    (
      ?auto_1093128 - HOIST
      ?auto_1093130 - PLACE
      ?auto_1093129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093128 ?auto_1093130 ) ( SURFACE-AT ?auto_1093126 ?auto_1093130 ) ( CLEAR ?auto_1093126 ) ( IS-CRATE ?auto_1093127 ) ( not ( = ?auto_1093126 ?auto_1093127 ) ) ( TRUCK-AT ?auto_1093129 ?auto_1093130 ) ( AVAILABLE ?auto_1093128 ) ( IN ?auto_1093127 ?auto_1093129 ) ( ON ?auto_1093126 ?auto_1093125 ) ( not ( = ?auto_1093125 ?auto_1093126 ) ) ( not ( = ?auto_1093125 ?auto_1093127 ) ) ( ON ?auto_1093115 ?auto_1093114 ) ( ON ?auto_1093116 ?auto_1093115 ) ( ON ?auto_1093118 ?auto_1093116 ) ( ON ?auto_1093117 ?auto_1093118 ) ( ON ?auto_1093119 ?auto_1093117 ) ( ON ?auto_1093120 ?auto_1093119 ) ( ON ?auto_1093121 ?auto_1093120 ) ( ON ?auto_1093122 ?auto_1093121 ) ( ON ?auto_1093123 ?auto_1093122 ) ( ON ?auto_1093124 ?auto_1093123 ) ( ON ?auto_1093125 ?auto_1093124 ) ( not ( = ?auto_1093114 ?auto_1093115 ) ) ( not ( = ?auto_1093114 ?auto_1093116 ) ) ( not ( = ?auto_1093114 ?auto_1093118 ) ) ( not ( = ?auto_1093114 ?auto_1093117 ) ) ( not ( = ?auto_1093114 ?auto_1093119 ) ) ( not ( = ?auto_1093114 ?auto_1093120 ) ) ( not ( = ?auto_1093114 ?auto_1093121 ) ) ( not ( = ?auto_1093114 ?auto_1093122 ) ) ( not ( = ?auto_1093114 ?auto_1093123 ) ) ( not ( = ?auto_1093114 ?auto_1093124 ) ) ( not ( = ?auto_1093114 ?auto_1093125 ) ) ( not ( = ?auto_1093114 ?auto_1093126 ) ) ( not ( = ?auto_1093114 ?auto_1093127 ) ) ( not ( = ?auto_1093115 ?auto_1093116 ) ) ( not ( = ?auto_1093115 ?auto_1093118 ) ) ( not ( = ?auto_1093115 ?auto_1093117 ) ) ( not ( = ?auto_1093115 ?auto_1093119 ) ) ( not ( = ?auto_1093115 ?auto_1093120 ) ) ( not ( = ?auto_1093115 ?auto_1093121 ) ) ( not ( = ?auto_1093115 ?auto_1093122 ) ) ( not ( = ?auto_1093115 ?auto_1093123 ) ) ( not ( = ?auto_1093115 ?auto_1093124 ) ) ( not ( = ?auto_1093115 ?auto_1093125 ) ) ( not ( = ?auto_1093115 ?auto_1093126 ) ) ( not ( = ?auto_1093115 ?auto_1093127 ) ) ( not ( = ?auto_1093116 ?auto_1093118 ) ) ( not ( = ?auto_1093116 ?auto_1093117 ) ) ( not ( = ?auto_1093116 ?auto_1093119 ) ) ( not ( = ?auto_1093116 ?auto_1093120 ) ) ( not ( = ?auto_1093116 ?auto_1093121 ) ) ( not ( = ?auto_1093116 ?auto_1093122 ) ) ( not ( = ?auto_1093116 ?auto_1093123 ) ) ( not ( = ?auto_1093116 ?auto_1093124 ) ) ( not ( = ?auto_1093116 ?auto_1093125 ) ) ( not ( = ?auto_1093116 ?auto_1093126 ) ) ( not ( = ?auto_1093116 ?auto_1093127 ) ) ( not ( = ?auto_1093118 ?auto_1093117 ) ) ( not ( = ?auto_1093118 ?auto_1093119 ) ) ( not ( = ?auto_1093118 ?auto_1093120 ) ) ( not ( = ?auto_1093118 ?auto_1093121 ) ) ( not ( = ?auto_1093118 ?auto_1093122 ) ) ( not ( = ?auto_1093118 ?auto_1093123 ) ) ( not ( = ?auto_1093118 ?auto_1093124 ) ) ( not ( = ?auto_1093118 ?auto_1093125 ) ) ( not ( = ?auto_1093118 ?auto_1093126 ) ) ( not ( = ?auto_1093118 ?auto_1093127 ) ) ( not ( = ?auto_1093117 ?auto_1093119 ) ) ( not ( = ?auto_1093117 ?auto_1093120 ) ) ( not ( = ?auto_1093117 ?auto_1093121 ) ) ( not ( = ?auto_1093117 ?auto_1093122 ) ) ( not ( = ?auto_1093117 ?auto_1093123 ) ) ( not ( = ?auto_1093117 ?auto_1093124 ) ) ( not ( = ?auto_1093117 ?auto_1093125 ) ) ( not ( = ?auto_1093117 ?auto_1093126 ) ) ( not ( = ?auto_1093117 ?auto_1093127 ) ) ( not ( = ?auto_1093119 ?auto_1093120 ) ) ( not ( = ?auto_1093119 ?auto_1093121 ) ) ( not ( = ?auto_1093119 ?auto_1093122 ) ) ( not ( = ?auto_1093119 ?auto_1093123 ) ) ( not ( = ?auto_1093119 ?auto_1093124 ) ) ( not ( = ?auto_1093119 ?auto_1093125 ) ) ( not ( = ?auto_1093119 ?auto_1093126 ) ) ( not ( = ?auto_1093119 ?auto_1093127 ) ) ( not ( = ?auto_1093120 ?auto_1093121 ) ) ( not ( = ?auto_1093120 ?auto_1093122 ) ) ( not ( = ?auto_1093120 ?auto_1093123 ) ) ( not ( = ?auto_1093120 ?auto_1093124 ) ) ( not ( = ?auto_1093120 ?auto_1093125 ) ) ( not ( = ?auto_1093120 ?auto_1093126 ) ) ( not ( = ?auto_1093120 ?auto_1093127 ) ) ( not ( = ?auto_1093121 ?auto_1093122 ) ) ( not ( = ?auto_1093121 ?auto_1093123 ) ) ( not ( = ?auto_1093121 ?auto_1093124 ) ) ( not ( = ?auto_1093121 ?auto_1093125 ) ) ( not ( = ?auto_1093121 ?auto_1093126 ) ) ( not ( = ?auto_1093121 ?auto_1093127 ) ) ( not ( = ?auto_1093122 ?auto_1093123 ) ) ( not ( = ?auto_1093122 ?auto_1093124 ) ) ( not ( = ?auto_1093122 ?auto_1093125 ) ) ( not ( = ?auto_1093122 ?auto_1093126 ) ) ( not ( = ?auto_1093122 ?auto_1093127 ) ) ( not ( = ?auto_1093123 ?auto_1093124 ) ) ( not ( = ?auto_1093123 ?auto_1093125 ) ) ( not ( = ?auto_1093123 ?auto_1093126 ) ) ( not ( = ?auto_1093123 ?auto_1093127 ) ) ( not ( = ?auto_1093124 ?auto_1093125 ) ) ( not ( = ?auto_1093124 ?auto_1093126 ) ) ( not ( = ?auto_1093124 ?auto_1093127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093125 ?auto_1093126 ?auto_1093127 )
      ( MAKE-13CRATE-VERIFY ?auto_1093114 ?auto_1093115 ?auto_1093116 ?auto_1093118 ?auto_1093117 ?auto_1093119 ?auto_1093120 ?auto_1093121 ?auto_1093122 ?auto_1093123 ?auto_1093124 ?auto_1093125 ?auto_1093126 ?auto_1093127 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093270 - SURFACE
      ?auto_1093271 - SURFACE
      ?auto_1093272 - SURFACE
      ?auto_1093274 - SURFACE
      ?auto_1093273 - SURFACE
      ?auto_1093275 - SURFACE
      ?auto_1093276 - SURFACE
      ?auto_1093277 - SURFACE
      ?auto_1093278 - SURFACE
      ?auto_1093279 - SURFACE
      ?auto_1093280 - SURFACE
      ?auto_1093281 - SURFACE
      ?auto_1093282 - SURFACE
      ?auto_1093283 - SURFACE
    )
    :vars
    (
      ?auto_1093284 - HOIST
      ?auto_1093285 - PLACE
      ?auto_1093286 - TRUCK
      ?auto_1093287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093284 ?auto_1093285 ) ( SURFACE-AT ?auto_1093282 ?auto_1093285 ) ( CLEAR ?auto_1093282 ) ( IS-CRATE ?auto_1093283 ) ( not ( = ?auto_1093282 ?auto_1093283 ) ) ( AVAILABLE ?auto_1093284 ) ( IN ?auto_1093283 ?auto_1093286 ) ( ON ?auto_1093282 ?auto_1093281 ) ( not ( = ?auto_1093281 ?auto_1093282 ) ) ( not ( = ?auto_1093281 ?auto_1093283 ) ) ( TRUCK-AT ?auto_1093286 ?auto_1093287 ) ( not ( = ?auto_1093287 ?auto_1093285 ) ) ( ON ?auto_1093271 ?auto_1093270 ) ( ON ?auto_1093272 ?auto_1093271 ) ( ON ?auto_1093274 ?auto_1093272 ) ( ON ?auto_1093273 ?auto_1093274 ) ( ON ?auto_1093275 ?auto_1093273 ) ( ON ?auto_1093276 ?auto_1093275 ) ( ON ?auto_1093277 ?auto_1093276 ) ( ON ?auto_1093278 ?auto_1093277 ) ( ON ?auto_1093279 ?auto_1093278 ) ( ON ?auto_1093280 ?auto_1093279 ) ( ON ?auto_1093281 ?auto_1093280 ) ( not ( = ?auto_1093270 ?auto_1093271 ) ) ( not ( = ?auto_1093270 ?auto_1093272 ) ) ( not ( = ?auto_1093270 ?auto_1093274 ) ) ( not ( = ?auto_1093270 ?auto_1093273 ) ) ( not ( = ?auto_1093270 ?auto_1093275 ) ) ( not ( = ?auto_1093270 ?auto_1093276 ) ) ( not ( = ?auto_1093270 ?auto_1093277 ) ) ( not ( = ?auto_1093270 ?auto_1093278 ) ) ( not ( = ?auto_1093270 ?auto_1093279 ) ) ( not ( = ?auto_1093270 ?auto_1093280 ) ) ( not ( = ?auto_1093270 ?auto_1093281 ) ) ( not ( = ?auto_1093270 ?auto_1093282 ) ) ( not ( = ?auto_1093270 ?auto_1093283 ) ) ( not ( = ?auto_1093271 ?auto_1093272 ) ) ( not ( = ?auto_1093271 ?auto_1093274 ) ) ( not ( = ?auto_1093271 ?auto_1093273 ) ) ( not ( = ?auto_1093271 ?auto_1093275 ) ) ( not ( = ?auto_1093271 ?auto_1093276 ) ) ( not ( = ?auto_1093271 ?auto_1093277 ) ) ( not ( = ?auto_1093271 ?auto_1093278 ) ) ( not ( = ?auto_1093271 ?auto_1093279 ) ) ( not ( = ?auto_1093271 ?auto_1093280 ) ) ( not ( = ?auto_1093271 ?auto_1093281 ) ) ( not ( = ?auto_1093271 ?auto_1093282 ) ) ( not ( = ?auto_1093271 ?auto_1093283 ) ) ( not ( = ?auto_1093272 ?auto_1093274 ) ) ( not ( = ?auto_1093272 ?auto_1093273 ) ) ( not ( = ?auto_1093272 ?auto_1093275 ) ) ( not ( = ?auto_1093272 ?auto_1093276 ) ) ( not ( = ?auto_1093272 ?auto_1093277 ) ) ( not ( = ?auto_1093272 ?auto_1093278 ) ) ( not ( = ?auto_1093272 ?auto_1093279 ) ) ( not ( = ?auto_1093272 ?auto_1093280 ) ) ( not ( = ?auto_1093272 ?auto_1093281 ) ) ( not ( = ?auto_1093272 ?auto_1093282 ) ) ( not ( = ?auto_1093272 ?auto_1093283 ) ) ( not ( = ?auto_1093274 ?auto_1093273 ) ) ( not ( = ?auto_1093274 ?auto_1093275 ) ) ( not ( = ?auto_1093274 ?auto_1093276 ) ) ( not ( = ?auto_1093274 ?auto_1093277 ) ) ( not ( = ?auto_1093274 ?auto_1093278 ) ) ( not ( = ?auto_1093274 ?auto_1093279 ) ) ( not ( = ?auto_1093274 ?auto_1093280 ) ) ( not ( = ?auto_1093274 ?auto_1093281 ) ) ( not ( = ?auto_1093274 ?auto_1093282 ) ) ( not ( = ?auto_1093274 ?auto_1093283 ) ) ( not ( = ?auto_1093273 ?auto_1093275 ) ) ( not ( = ?auto_1093273 ?auto_1093276 ) ) ( not ( = ?auto_1093273 ?auto_1093277 ) ) ( not ( = ?auto_1093273 ?auto_1093278 ) ) ( not ( = ?auto_1093273 ?auto_1093279 ) ) ( not ( = ?auto_1093273 ?auto_1093280 ) ) ( not ( = ?auto_1093273 ?auto_1093281 ) ) ( not ( = ?auto_1093273 ?auto_1093282 ) ) ( not ( = ?auto_1093273 ?auto_1093283 ) ) ( not ( = ?auto_1093275 ?auto_1093276 ) ) ( not ( = ?auto_1093275 ?auto_1093277 ) ) ( not ( = ?auto_1093275 ?auto_1093278 ) ) ( not ( = ?auto_1093275 ?auto_1093279 ) ) ( not ( = ?auto_1093275 ?auto_1093280 ) ) ( not ( = ?auto_1093275 ?auto_1093281 ) ) ( not ( = ?auto_1093275 ?auto_1093282 ) ) ( not ( = ?auto_1093275 ?auto_1093283 ) ) ( not ( = ?auto_1093276 ?auto_1093277 ) ) ( not ( = ?auto_1093276 ?auto_1093278 ) ) ( not ( = ?auto_1093276 ?auto_1093279 ) ) ( not ( = ?auto_1093276 ?auto_1093280 ) ) ( not ( = ?auto_1093276 ?auto_1093281 ) ) ( not ( = ?auto_1093276 ?auto_1093282 ) ) ( not ( = ?auto_1093276 ?auto_1093283 ) ) ( not ( = ?auto_1093277 ?auto_1093278 ) ) ( not ( = ?auto_1093277 ?auto_1093279 ) ) ( not ( = ?auto_1093277 ?auto_1093280 ) ) ( not ( = ?auto_1093277 ?auto_1093281 ) ) ( not ( = ?auto_1093277 ?auto_1093282 ) ) ( not ( = ?auto_1093277 ?auto_1093283 ) ) ( not ( = ?auto_1093278 ?auto_1093279 ) ) ( not ( = ?auto_1093278 ?auto_1093280 ) ) ( not ( = ?auto_1093278 ?auto_1093281 ) ) ( not ( = ?auto_1093278 ?auto_1093282 ) ) ( not ( = ?auto_1093278 ?auto_1093283 ) ) ( not ( = ?auto_1093279 ?auto_1093280 ) ) ( not ( = ?auto_1093279 ?auto_1093281 ) ) ( not ( = ?auto_1093279 ?auto_1093282 ) ) ( not ( = ?auto_1093279 ?auto_1093283 ) ) ( not ( = ?auto_1093280 ?auto_1093281 ) ) ( not ( = ?auto_1093280 ?auto_1093282 ) ) ( not ( = ?auto_1093280 ?auto_1093283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093281 ?auto_1093282 ?auto_1093283 )
      ( MAKE-13CRATE-VERIFY ?auto_1093270 ?auto_1093271 ?auto_1093272 ?auto_1093274 ?auto_1093273 ?auto_1093275 ?auto_1093276 ?auto_1093277 ?auto_1093278 ?auto_1093279 ?auto_1093280 ?auto_1093281 ?auto_1093282 ?auto_1093283 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093439 - SURFACE
      ?auto_1093440 - SURFACE
      ?auto_1093441 - SURFACE
      ?auto_1093443 - SURFACE
      ?auto_1093442 - SURFACE
      ?auto_1093444 - SURFACE
      ?auto_1093445 - SURFACE
      ?auto_1093446 - SURFACE
      ?auto_1093447 - SURFACE
      ?auto_1093448 - SURFACE
      ?auto_1093449 - SURFACE
      ?auto_1093450 - SURFACE
      ?auto_1093451 - SURFACE
      ?auto_1093452 - SURFACE
    )
    :vars
    (
      ?auto_1093456 - HOIST
      ?auto_1093453 - PLACE
      ?auto_1093454 - TRUCK
      ?auto_1093455 - PLACE
      ?auto_1093457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093456 ?auto_1093453 ) ( SURFACE-AT ?auto_1093451 ?auto_1093453 ) ( CLEAR ?auto_1093451 ) ( IS-CRATE ?auto_1093452 ) ( not ( = ?auto_1093451 ?auto_1093452 ) ) ( AVAILABLE ?auto_1093456 ) ( ON ?auto_1093451 ?auto_1093450 ) ( not ( = ?auto_1093450 ?auto_1093451 ) ) ( not ( = ?auto_1093450 ?auto_1093452 ) ) ( TRUCK-AT ?auto_1093454 ?auto_1093455 ) ( not ( = ?auto_1093455 ?auto_1093453 ) ) ( HOIST-AT ?auto_1093457 ?auto_1093455 ) ( LIFTING ?auto_1093457 ?auto_1093452 ) ( not ( = ?auto_1093456 ?auto_1093457 ) ) ( ON ?auto_1093440 ?auto_1093439 ) ( ON ?auto_1093441 ?auto_1093440 ) ( ON ?auto_1093443 ?auto_1093441 ) ( ON ?auto_1093442 ?auto_1093443 ) ( ON ?auto_1093444 ?auto_1093442 ) ( ON ?auto_1093445 ?auto_1093444 ) ( ON ?auto_1093446 ?auto_1093445 ) ( ON ?auto_1093447 ?auto_1093446 ) ( ON ?auto_1093448 ?auto_1093447 ) ( ON ?auto_1093449 ?auto_1093448 ) ( ON ?auto_1093450 ?auto_1093449 ) ( not ( = ?auto_1093439 ?auto_1093440 ) ) ( not ( = ?auto_1093439 ?auto_1093441 ) ) ( not ( = ?auto_1093439 ?auto_1093443 ) ) ( not ( = ?auto_1093439 ?auto_1093442 ) ) ( not ( = ?auto_1093439 ?auto_1093444 ) ) ( not ( = ?auto_1093439 ?auto_1093445 ) ) ( not ( = ?auto_1093439 ?auto_1093446 ) ) ( not ( = ?auto_1093439 ?auto_1093447 ) ) ( not ( = ?auto_1093439 ?auto_1093448 ) ) ( not ( = ?auto_1093439 ?auto_1093449 ) ) ( not ( = ?auto_1093439 ?auto_1093450 ) ) ( not ( = ?auto_1093439 ?auto_1093451 ) ) ( not ( = ?auto_1093439 ?auto_1093452 ) ) ( not ( = ?auto_1093440 ?auto_1093441 ) ) ( not ( = ?auto_1093440 ?auto_1093443 ) ) ( not ( = ?auto_1093440 ?auto_1093442 ) ) ( not ( = ?auto_1093440 ?auto_1093444 ) ) ( not ( = ?auto_1093440 ?auto_1093445 ) ) ( not ( = ?auto_1093440 ?auto_1093446 ) ) ( not ( = ?auto_1093440 ?auto_1093447 ) ) ( not ( = ?auto_1093440 ?auto_1093448 ) ) ( not ( = ?auto_1093440 ?auto_1093449 ) ) ( not ( = ?auto_1093440 ?auto_1093450 ) ) ( not ( = ?auto_1093440 ?auto_1093451 ) ) ( not ( = ?auto_1093440 ?auto_1093452 ) ) ( not ( = ?auto_1093441 ?auto_1093443 ) ) ( not ( = ?auto_1093441 ?auto_1093442 ) ) ( not ( = ?auto_1093441 ?auto_1093444 ) ) ( not ( = ?auto_1093441 ?auto_1093445 ) ) ( not ( = ?auto_1093441 ?auto_1093446 ) ) ( not ( = ?auto_1093441 ?auto_1093447 ) ) ( not ( = ?auto_1093441 ?auto_1093448 ) ) ( not ( = ?auto_1093441 ?auto_1093449 ) ) ( not ( = ?auto_1093441 ?auto_1093450 ) ) ( not ( = ?auto_1093441 ?auto_1093451 ) ) ( not ( = ?auto_1093441 ?auto_1093452 ) ) ( not ( = ?auto_1093443 ?auto_1093442 ) ) ( not ( = ?auto_1093443 ?auto_1093444 ) ) ( not ( = ?auto_1093443 ?auto_1093445 ) ) ( not ( = ?auto_1093443 ?auto_1093446 ) ) ( not ( = ?auto_1093443 ?auto_1093447 ) ) ( not ( = ?auto_1093443 ?auto_1093448 ) ) ( not ( = ?auto_1093443 ?auto_1093449 ) ) ( not ( = ?auto_1093443 ?auto_1093450 ) ) ( not ( = ?auto_1093443 ?auto_1093451 ) ) ( not ( = ?auto_1093443 ?auto_1093452 ) ) ( not ( = ?auto_1093442 ?auto_1093444 ) ) ( not ( = ?auto_1093442 ?auto_1093445 ) ) ( not ( = ?auto_1093442 ?auto_1093446 ) ) ( not ( = ?auto_1093442 ?auto_1093447 ) ) ( not ( = ?auto_1093442 ?auto_1093448 ) ) ( not ( = ?auto_1093442 ?auto_1093449 ) ) ( not ( = ?auto_1093442 ?auto_1093450 ) ) ( not ( = ?auto_1093442 ?auto_1093451 ) ) ( not ( = ?auto_1093442 ?auto_1093452 ) ) ( not ( = ?auto_1093444 ?auto_1093445 ) ) ( not ( = ?auto_1093444 ?auto_1093446 ) ) ( not ( = ?auto_1093444 ?auto_1093447 ) ) ( not ( = ?auto_1093444 ?auto_1093448 ) ) ( not ( = ?auto_1093444 ?auto_1093449 ) ) ( not ( = ?auto_1093444 ?auto_1093450 ) ) ( not ( = ?auto_1093444 ?auto_1093451 ) ) ( not ( = ?auto_1093444 ?auto_1093452 ) ) ( not ( = ?auto_1093445 ?auto_1093446 ) ) ( not ( = ?auto_1093445 ?auto_1093447 ) ) ( not ( = ?auto_1093445 ?auto_1093448 ) ) ( not ( = ?auto_1093445 ?auto_1093449 ) ) ( not ( = ?auto_1093445 ?auto_1093450 ) ) ( not ( = ?auto_1093445 ?auto_1093451 ) ) ( not ( = ?auto_1093445 ?auto_1093452 ) ) ( not ( = ?auto_1093446 ?auto_1093447 ) ) ( not ( = ?auto_1093446 ?auto_1093448 ) ) ( not ( = ?auto_1093446 ?auto_1093449 ) ) ( not ( = ?auto_1093446 ?auto_1093450 ) ) ( not ( = ?auto_1093446 ?auto_1093451 ) ) ( not ( = ?auto_1093446 ?auto_1093452 ) ) ( not ( = ?auto_1093447 ?auto_1093448 ) ) ( not ( = ?auto_1093447 ?auto_1093449 ) ) ( not ( = ?auto_1093447 ?auto_1093450 ) ) ( not ( = ?auto_1093447 ?auto_1093451 ) ) ( not ( = ?auto_1093447 ?auto_1093452 ) ) ( not ( = ?auto_1093448 ?auto_1093449 ) ) ( not ( = ?auto_1093448 ?auto_1093450 ) ) ( not ( = ?auto_1093448 ?auto_1093451 ) ) ( not ( = ?auto_1093448 ?auto_1093452 ) ) ( not ( = ?auto_1093449 ?auto_1093450 ) ) ( not ( = ?auto_1093449 ?auto_1093451 ) ) ( not ( = ?auto_1093449 ?auto_1093452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093450 ?auto_1093451 ?auto_1093452 )
      ( MAKE-13CRATE-VERIFY ?auto_1093439 ?auto_1093440 ?auto_1093441 ?auto_1093443 ?auto_1093442 ?auto_1093444 ?auto_1093445 ?auto_1093446 ?auto_1093447 ?auto_1093448 ?auto_1093449 ?auto_1093450 ?auto_1093451 ?auto_1093452 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093621 - SURFACE
      ?auto_1093622 - SURFACE
      ?auto_1093623 - SURFACE
      ?auto_1093625 - SURFACE
      ?auto_1093624 - SURFACE
      ?auto_1093626 - SURFACE
      ?auto_1093627 - SURFACE
      ?auto_1093628 - SURFACE
      ?auto_1093629 - SURFACE
      ?auto_1093630 - SURFACE
      ?auto_1093631 - SURFACE
      ?auto_1093632 - SURFACE
      ?auto_1093633 - SURFACE
      ?auto_1093634 - SURFACE
    )
    :vars
    (
      ?auto_1093636 - HOIST
      ?auto_1093639 - PLACE
      ?auto_1093638 - TRUCK
      ?auto_1093635 - PLACE
      ?auto_1093637 - HOIST
      ?auto_1093640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093636 ?auto_1093639 ) ( SURFACE-AT ?auto_1093633 ?auto_1093639 ) ( CLEAR ?auto_1093633 ) ( IS-CRATE ?auto_1093634 ) ( not ( = ?auto_1093633 ?auto_1093634 ) ) ( AVAILABLE ?auto_1093636 ) ( ON ?auto_1093633 ?auto_1093632 ) ( not ( = ?auto_1093632 ?auto_1093633 ) ) ( not ( = ?auto_1093632 ?auto_1093634 ) ) ( TRUCK-AT ?auto_1093638 ?auto_1093635 ) ( not ( = ?auto_1093635 ?auto_1093639 ) ) ( HOIST-AT ?auto_1093637 ?auto_1093635 ) ( not ( = ?auto_1093636 ?auto_1093637 ) ) ( AVAILABLE ?auto_1093637 ) ( SURFACE-AT ?auto_1093634 ?auto_1093635 ) ( ON ?auto_1093634 ?auto_1093640 ) ( CLEAR ?auto_1093634 ) ( not ( = ?auto_1093633 ?auto_1093640 ) ) ( not ( = ?auto_1093634 ?auto_1093640 ) ) ( not ( = ?auto_1093632 ?auto_1093640 ) ) ( ON ?auto_1093622 ?auto_1093621 ) ( ON ?auto_1093623 ?auto_1093622 ) ( ON ?auto_1093625 ?auto_1093623 ) ( ON ?auto_1093624 ?auto_1093625 ) ( ON ?auto_1093626 ?auto_1093624 ) ( ON ?auto_1093627 ?auto_1093626 ) ( ON ?auto_1093628 ?auto_1093627 ) ( ON ?auto_1093629 ?auto_1093628 ) ( ON ?auto_1093630 ?auto_1093629 ) ( ON ?auto_1093631 ?auto_1093630 ) ( ON ?auto_1093632 ?auto_1093631 ) ( not ( = ?auto_1093621 ?auto_1093622 ) ) ( not ( = ?auto_1093621 ?auto_1093623 ) ) ( not ( = ?auto_1093621 ?auto_1093625 ) ) ( not ( = ?auto_1093621 ?auto_1093624 ) ) ( not ( = ?auto_1093621 ?auto_1093626 ) ) ( not ( = ?auto_1093621 ?auto_1093627 ) ) ( not ( = ?auto_1093621 ?auto_1093628 ) ) ( not ( = ?auto_1093621 ?auto_1093629 ) ) ( not ( = ?auto_1093621 ?auto_1093630 ) ) ( not ( = ?auto_1093621 ?auto_1093631 ) ) ( not ( = ?auto_1093621 ?auto_1093632 ) ) ( not ( = ?auto_1093621 ?auto_1093633 ) ) ( not ( = ?auto_1093621 ?auto_1093634 ) ) ( not ( = ?auto_1093621 ?auto_1093640 ) ) ( not ( = ?auto_1093622 ?auto_1093623 ) ) ( not ( = ?auto_1093622 ?auto_1093625 ) ) ( not ( = ?auto_1093622 ?auto_1093624 ) ) ( not ( = ?auto_1093622 ?auto_1093626 ) ) ( not ( = ?auto_1093622 ?auto_1093627 ) ) ( not ( = ?auto_1093622 ?auto_1093628 ) ) ( not ( = ?auto_1093622 ?auto_1093629 ) ) ( not ( = ?auto_1093622 ?auto_1093630 ) ) ( not ( = ?auto_1093622 ?auto_1093631 ) ) ( not ( = ?auto_1093622 ?auto_1093632 ) ) ( not ( = ?auto_1093622 ?auto_1093633 ) ) ( not ( = ?auto_1093622 ?auto_1093634 ) ) ( not ( = ?auto_1093622 ?auto_1093640 ) ) ( not ( = ?auto_1093623 ?auto_1093625 ) ) ( not ( = ?auto_1093623 ?auto_1093624 ) ) ( not ( = ?auto_1093623 ?auto_1093626 ) ) ( not ( = ?auto_1093623 ?auto_1093627 ) ) ( not ( = ?auto_1093623 ?auto_1093628 ) ) ( not ( = ?auto_1093623 ?auto_1093629 ) ) ( not ( = ?auto_1093623 ?auto_1093630 ) ) ( not ( = ?auto_1093623 ?auto_1093631 ) ) ( not ( = ?auto_1093623 ?auto_1093632 ) ) ( not ( = ?auto_1093623 ?auto_1093633 ) ) ( not ( = ?auto_1093623 ?auto_1093634 ) ) ( not ( = ?auto_1093623 ?auto_1093640 ) ) ( not ( = ?auto_1093625 ?auto_1093624 ) ) ( not ( = ?auto_1093625 ?auto_1093626 ) ) ( not ( = ?auto_1093625 ?auto_1093627 ) ) ( not ( = ?auto_1093625 ?auto_1093628 ) ) ( not ( = ?auto_1093625 ?auto_1093629 ) ) ( not ( = ?auto_1093625 ?auto_1093630 ) ) ( not ( = ?auto_1093625 ?auto_1093631 ) ) ( not ( = ?auto_1093625 ?auto_1093632 ) ) ( not ( = ?auto_1093625 ?auto_1093633 ) ) ( not ( = ?auto_1093625 ?auto_1093634 ) ) ( not ( = ?auto_1093625 ?auto_1093640 ) ) ( not ( = ?auto_1093624 ?auto_1093626 ) ) ( not ( = ?auto_1093624 ?auto_1093627 ) ) ( not ( = ?auto_1093624 ?auto_1093628 ) ) ( not ( = ?auto_1093624 ?auto_1093629 ) ) ( not ( = ?auto_1093624 ?auto_1093630 ) ) ( not ( = ?auto_1093624 ?auto_1093631 ) ) ( not ( = ?auto_1093624 ?auto_1093632 ) ) ( not ( = ?auto_1093624 ?auto_1093633 ) ) ( not ( = ?auto_1093624 ?auto_1093634 ) ) ( not ( = ?auto_1093624 ?auto_1093640 ) ) ( not ( = ?auto_1093626 ?auto_1093627 ) ) ( not ( = ?auto_1093626 ?auto_1093628 ) ) ( not ( = ?auto_1093626 ?auto_1093629 ) ) ( not ( = ?auto_1093626 ?auto_1093630 ) ) ( not ( = ?auto_1093626 ?auto_1093631 ) ) ( not ( = ?auto_1093626 ?auto_1093632 ) ) ( not ( = ?auto_1093626 ?auto_1093633 ) ) ( not ( = ?auto_1093626 ?auto_1093634 ) ) ( not ( = ?auto_1093626 ?auto_1093640 ) ) ( not ( = ?auto_1093627 ?auto_1093628 ) ) ( not ( = ?auto_1093627 ?auto_1093629 ) ) ( not ( = ?auto_1093627 ?auto_1093630 ) ) ( not ( = ?auto_1093627 ?auto_1093631 ) ) ( not ( = ?auto_1093627 ?auto_1093632 ) ) ( not ( = ?auto_1093627 ?auto_1093633 ) ) ( not ( = ?auto_1093627 ?auto_1093634 ) ) ( not ( = ?auto_1093627 ?auto_1093640 ) ) ( not ( = ?auto_1093628 ?auto_1093629 ) ) ( not ( = ?auto_1093628 ?auto_1093630 ) ) ( not ( = ?auto_1093628 ?auto_1093631 ) ) ( not ( = ?auto_1093628 ?auto_1093632 ) ) ( not ( = ?auto_1093628 ?auto_1093633 ) ) ( not ( = ?auto_1093628 ?auto_1093634 ) ) ( not ( = ?auto_1093628 ?auto_1093640 ) ) ( not ( = ?auto_1093629 ?auto_1093630 ) ) ( not ( = ?auto_1093629 ?auto_1093631 ) ) ( not ( = ?auto_1093629 ?auto_1093632 ) ) ( not ( = ?auto_1093629 ?auto_1093633 ) ) ( not ( = ?auto_1093629 ?auto_1093634 ) ) ( not ( = ?auto_1093629 ?auto_1093640 ) ) ( not ( = ?auto_1093630 ?auto_1093631 ) ) ( not ( = ?auto_1093630 ?auto_1093632 ) ) ( not ( = ?auto_1093630 ?auto_1093633 ) ) ( not ( = ?auto_1093630 ?auto_1093634 ) ) ( not ( = ?auto_1093630 ?auto_1093640 ) ) ( not ( = ?auto_1093631 ?auto_1093632 ) ) ( not ( = ?auto_1093631 ?auto_1093633 ) ) ( not ( = ?auto_1093631 ?auto_1093634 ) ) ( not ( = ?auto_1093631 ?auto_1093640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093632 ?auto_1093633 ?auto_1093634 )
      ( MAKE-13CRATE-VERIFY ?auto_1093621 ?auto_1093622 ?auto_1093623 ?auto_1093625 ?auto_1093624 ?auto_1093626 ?auto_1093627 ?auto_1093628 ?auto_1093629 ?auto_1093630 ?auto_1093631 ?auto_1093632 ?auto_1093633 ?auto_1093634 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093804 - SURFACE
      ?auto_1093805 - SURFACE
      ?auto_1093806 - SURFACE
      ?auto_1093808 - SURFACE
      ?auto_1093807 - SURFACE
      ?auto_1093809 - SURFACE
      ?auto_1093810 - SURFACE
      ?auto_1093811 - SURFACE
      ?auto_1093812 - SURFACE
      ?auto_1093813 - SURFACE
      ?auto_1093814 - SURFACE
      ?auto_1093815 - SURFACE
      ?auto_1093816 - SURFACE
      ?auto_1093817 - SURFACE
    )
    :vars
    (
      ?auto_1093818 - HOIST
      ?auto_1093821 - PLACE
      ?auto_1093819 - PLACE
      ?auto_1093820 - HOIST
      ?auto_1093822 - SURFACE
      ?auto_1093823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093818 ?auto_1093821 ) ( SURFACE-AT ?auto_1093816 ?auto_1093821 ) ( CLEAR ?auto_1093816 ) ( IS-CRATE ?auto_1093817 ) ( not ( = ?auto_1093816 ?auto_1093817 ) ) ( AVAILABLE ?auto_1093818 ) ( ON ?auto_1093816 ?auto_1093815 ) ( not ( = ?auto_1093815 ?auto_1093816 ) ) ( not ( = ?auto_1093815 ?auto_1093817 ) ) ( not ( = ?auto_1093819 ?auto_1093821 ) ) ( HOIST-AT ?auto_1093820 ?auto_1093819 ) ( not ( = ?auto_1093818 ?auto_1093820 ) ) ( AVAILABLE ?auto_1093820 ) ( SURFACE-AT ?auto_1093817 ?auto_1093819 ) ( ON ?auto_1093817 ?auto_1093822 ) ( CLEAR ?auto_1093817 ) ( not ( = ?auto_1093816 ?auto_1093822 ) ) ( not ( = ?auto_1093817 ?auto_1093822 ) ) ( not ( = ?auto_1093815 ?auto_1093822 ) ) ( TRUCK-AT ?auto_1093823 ?auto_1093821 ) ( ON ?auto_1093805 ?auto_1093804 ) ( ON ?auto_1093806 ?auto_1093805 ) ( ON ?auto_1093808 ?auto_1093806 ) ( ON ?auto_1093807 ?auto_1093808 ) ( ON ?auto_1093809 ?auto_1093807 ) ( ON ?auto_1093810 ?auto_1093809 ) ( ON ?auto_1093811 ?auto_1093810 ) ( ON ?auto_1093812 ?auto_1093811 ) ( ON ?auto_1093813 ?auto_1093812 ) ( ON ?auto_1093814 ?auto_1093813 ) ( ON ?auto_1093815 ?auto_1093814 ) ( not ( = ?auto_1093804 ?auto_1093805 ) ) ( not ( = ?auto_1093804 ?auto_1093806 ) ) ( not ( = ?auto_1093804 ?auto_1093808 ) ) ( not ( = ?auto_1093804 ?auto_1093807 ) ) ( not ( = ?auto_1093804 ?auto_1093809 ) ) ( not ( = ?auto_1093804 ?auto_1093810 ) ) ( not ( = ?auto_1093804 ?auto_1093811 ) ) ( not ( = ?auto_1093804 ?auto_1093812 ) ) ( not ( = ?auto_1093804 ?auto_1093813 ) ) ( not ( = ?auto_1093804 ?auto_1093814 ) ) ( not ( = ?auto_1093804 ?auto_1093815 ) ) ( not ( = ?auto_1093804 ?auto_1093816 ) ) ( not ( = ?auto_1093804 ?auto_1093817 ) ) ( not ( = ?auto_1093804 ?auto_1093822 ) ) ( not ( = ?auto_1093805 ?auto_1093806 ) ) ( not ( = ?auto_1093805 ?auto_1093808 ) ) ( not ( = ?auto_1093805 ?auto_1093807 ) ) ( not ( = ?auto_1093805 ?auto_1093809 ) ) ( not ( = ?auto_1093805 ?auto_1093810 ) ) ( not ( = ?auto_1093805 ?auto_1093811 ) ) ( not ( = ?auto_1093805 ?auto_1093812 ) ) ( not ( = ?auto_1093805 ?auto_1093813 ) ) ( not ( = ?auto_1093805 ?auto_1093814 ) ) ( not ( = ?auto_1093805 ?auto_1093815 ) ) ( not ( = ?auto_1093805 ?auto_1093816 ) ) ( not ( = ?auto_1093805 ?auto_1093817 ) ) ( not ( = ?auto_1093805 ?auto_1093822 ) ) ( not ( = ?auto_1093806 ?auto_1093808 ) ) ( not ( = ?auto_1093806 ?auto_1093807 ) ) ( not ( = ?auto_1093806 ?auto_1093809 ) ) ( not ( = ?auto_1093806 ?auto_1093810 ) ) ( not ( = ?auto_1093806 ?auto_1093811 ) ) ( not ( = ?auto_1093806 ?auto_1093812 ) ) ( not ( = ?auto_1093806 ?auto_1093813 ) ) ( not ( = ?auto_1093806 ?auto_1093814 ) ) ( not ( = ?auto_1093806 ?auto_1093815 ) ) ( not ( = ?auto_1093806 ?auto_1093816 ) ) ( not ( = ?auto_1093806 ?auto_1093817 ) ) ( not ( = ?auto_1093806 ?auto_1093822 ) ) ( not ( = ?auto_1093808 ?auto_1093807 ) ) ( not ( = ?auto_1093808 ?auto_1093809 ) ) ( not ( = ?auto_1093808 ?auto_1093810 ) ) ( not ( = ?auto_1093808 ?auto_1093811 ) ) ( not ( = ?auto_1093808 ?auto_1093812 ) ) ( not ( = ?auto_1093808 ?auto_1093813 ) ) ( not ( = ?auto_1093808 ?auto_1093814 ) ) ( not ( = ?auto_1093808 ?auto_1093815 ) ) ( not ( = ?auto_1093808 ?auto_1093816 ) ) ( not ( = ?auto_1093808 ?auto_1093817 ) ) ( not ( = ?auto_1093808 ?auto_1093822 ) ) ( not ( = ?auto_1093807 ?auto_1093809 ) ) ( not ( = ?auto_1093807 ?auto_1093810 ) ) ( not ( = ?auto_1093807 ?auto_1093811 ) ) ( not ( = ?auto_1093807 ?auto_1093812 ) ) ( not ( = ?auto_1093807 ?auto_1093813 ) ) ( not ( = ?auto_1093807 ?auto_1093814 ) ) ( not ( = ?auto_1093807 ?auto_1093815 ) ) ( not ( = ?auto_1093807 ?auto_1093816 ) ) ( not ( = ?auto_1093807 ?auto_1093817 ) ) ( not ( = ?auto_1093807 ?auto_1093822 ) ) ( not ( = ?auto_1093809 ?auto_1093810 ) ) ( not ( = ?auto_1093809 ?auto_1093811 ) ) ( not ( = ?auto_1093809 ?auto_1093812 ) ) ( not ( = ?auto_1093809 ?auto_1093813 ) ) ( not ( = ?auto_1093809 ?auto_1093814 ) ) ( not ( = ?auto_1093809 ?auto_1093815 ) ) ( not ( = ?auto_1093809 ?auto_1093816 ) ) ( not ( = ?auto_1093809 ?auto_1093817 ) ) ( not ( = ?auto_1093809 ?auto_1093822 ) ) ( not ( = ?auto_1093810 ?auto_1093811 ) ) ( not ( = ?auto_1093810 ?auto_1093812 ) ) ( not ( = ?auto_1093810 ?auto_1093813 ) ) ( not ( = ?auto_1093810 ?auto_1093814 ) ) ( not ( = ?auto_1093810 ?auto_1093815 ) ) ( not ( = ?auto_1093810 ?auto_1093816 ) ) ( not ( = ?auto_1093810 ?auto_1093817 ) ) ( not ( = ?auto_1093810 ?auto_1093822 ) ) ( not ( = ?auto_1093811 ?auto_1093812 ) ) ( not ( = ?auto_1093811 ?auto_1093813 ) ) ( not ( = ?auto_1093811 ?auto_1093814 ) ) ( not ( = ?auto_1093811 ?auto_1093815 ) ) ( not ( = ?auto_1093811 ?auto_1093816 ) ) ( not ( = ?auto_1093811 ?auto_1093817 ) ) ( not ( = ?auto_1093811 ?auto_1093822 ) ) ( not ( = ?auto_1093812 ?auto_1093813 ) ) ( not ( = ?auto_1093812 ?auto_1093814 ) ) ( not ( = ?auto_1093812 ?auto_1093815 ) ) ( not ( = ?auto_1093812 ?auto_1093816 ) ) ( not ( = ?auto_1093812 ?auto_1093817 ) ) ( not ( = ?auto_1093812 ?auto_1093822 ) ) ( not ( = ?auto_1093813 ?auto_1093814 ) ) ( not ( = ?auto_1093813 ?auto_1093815 ) ) ( not ( = ?auto_1093813 ?auto_1093816 ) ) ( not ( = ?auto_1093813 ?auto_1093817 ) ) ( not ( = ?auto_1093813 ?auto_1093822 ) ) ( not ( = ?auto_1093814 ?auto_1093815 ) ) ( not ( = ?auto_1093814 ?auto_1093816 ) ) ( not ( = ?auto_1093814 ?auto_1093817 ) ) ( not ( = ?auto_1093814 ?auto_1093822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093815 ?auto_1093816 ?auto_1093817 )
      ( MAKE-13CRATE-VERIFY ?auto_1093804 ?auto_1093805 ?auto_1093806 ?auto_1093808 ?auto_1093807 ?auto_1093809 ?auto_1093810 ?auto_1093811 ?auto_1093812 ?auto_1093813 ?auto_1093814 ?auto_1093815 ?auto_1093816 ?auto_1093817 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093987 - SURFACE
      ?auto_1093988 - SURFACE
      ?auto_1093989 - SURFACE
      ?auto_1093991 - SURFACE
      ?auto_1093990 - SURFACE
      ?auto_1093992 - SURFACE
      ?auto_1093993 - SURFACE
      ?auto_1093994 - SURFACE
      ?auto_1093995 - SURFACE
      ?auto_1093996 - SURFACE
      ?auto_1093997 - SURFACE
      ?auto_1093998 - SURFACE
      ?auto_1093999 - SURFACE
      ?auto_1094000 - SURFACE
    )
    :vars
    (
      ?auto_1094002 - HOIST
      ?auto_1094004 - PLACE
      ?auto_1094006 - PLACE
      ?auto_1094005 - HOIST
      ?auto_1094003 - SURFACE
      ?auto_1094001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094002 ?auto_1094004 ) ( IS-CRATE ?auto_1094000 ) ( not ( = ?auto_1093999 ?auto_1094000 ) ) ( not ( = ?auto_1093998 ?auto_1093999 ) ) ( not ( = ?auto_1093998 ?auto_1094000 ) ) ( not ( = ?auto_1094006 ?auto_1094004 ) ) ( HOIST-AT ?auto_1094005 ?auto_1094006 ) ( not ( = ?auto_1094002 ?auto_1094005 ) ) ( AVAILABLE ?auto_1094005 ) ( SURFACE-AT ?auto_1094000 ?auto_1094006 ) ( ON ?auto_1094000 ?auto_1094003 ) ( CLEAR ?auto_1094000 ) ( not ( = ?auto_1093999 ?auto_1094003 ) ) ( not ( = ?auto_1094000 ?auto_1094003 ) ) ( not ( = ?auto_1093998 ?auto_1094003 ) ) ( TRUCK-AT ?auto_1094001 ?auto_1094004 ) ( SURFACE-AT ?auto_1093998 ?auto_1094004 ) ( CLEAR ?auto_1093998 ) ( LIFTING ?auto_1094002 ?auto_1093999 ) ( IS-CRATE ?auto_1093999 ) ( ON ?auto_1093988 ?auto_1093987 ) ( ON ?auto_1093989 ?auto_1093988 ) ( ON ?auto_1093991 ?auto_1093989 ) ( ON ?auto_1093990 ?auto_1093991 ) ( ON ?auto_1093992 ?auto_1093990 ) ( ON ?auto_1093993 ?auto_1093992 ) ( ON ?auto_1093994 ?auto_1093993 ) ( ON ?auto_1093995 ?auto_1093994 ) ( ON ?auto_1093996 ?auto_1093995 ) ( ON ?auto_1093997 ?auto_1093996 ) ( ON ?auto_1093998 ?auto_1093997 ) ( not ( = ?auto_1093987 ?auto_1093988 ) ) ( not ( = ?auto_1093987 ?auto_1093989 ) ) ( not ( = ?auto_1093987 ?auto_1093991 ) ) ( not ( = ?auto_1093987 ?auto_1093990 ) ) ( not ( = ?auto_1093987 ?auto_1093992 ) ) ( not ( = ?auto_1093987 ?auto_1093993 ) ) ( not ( = ?auto_1093987 ?auto_1093994 ) ) ( not ( = ?auto_1093987 ?auto_1093995 ) ) ( not ( = ?auto_1093987 ?auto_1093996 ) ) ( not ( = ?auto_1093987 ?auto_1093997 ) ) ( not ( = ?auto_1093987 ?auto_1093998 ) ) ( not ( = ?auto_1093987 ?auto_1093999 ) ) ( not ( = ?auto_1093987 ?auto_1094000 ) ) ( not ( = ?auto_1093987 ?auto_1094003 ) ) ( not ( = ?auto_1093988 ?auto_1093989 ) ) ( not ( = ?auto_1093988 ?auto_1093991 ) ) ( not ( = ?auto_1093988 ?auto_1093990 ) ) ( not ( = ?auto_1093988 ?auto_1093992 ) ) ( not ( = ?auto_1093988 ?auto_1093993 ) ) ( not ( = ?auto_1093988 ?auto_1093994 ) ) ( not ( = ?auto_1093988 ?auto_1093995 ) ) ( not ( = ?auto_1093988 ?auto_1093996 ) ) ( not ( = ?auto_1093988 ?auto_1093997 ) ) ( not ( = ?auto_1093988 ?auto_1093998 ) ) ( not ( = ?auto_1093988 ?auto_1093999 ) ) ( not ( = ?auto_1093988 ?auto_1094000 ) ) ( not ( = ?auto_1093988 ?auto_1094003 ) ) ( not ( = ?auto_1093989 ?auto_1093991 ) ) ( not ( = ?auto_1093989 ?auto_1093990 ) ) ( not ( = ?auto_1093989 ?auto_1093992 ) ) ( not ( = ?auto_1093989 ?auto_1093993 ) ) ( not ( = ?auto_1093989 ?auto_1093994 ) ) ( not ( = ?auto_1093989 ?auto_1093995 ) ) ( not ( = ?auto_1093989 ?auto_1093996 ) ) ( not ( = ?auto_1093989 ?auto_1093997 ) ) ( not ( = ?auto_1093989 ?auto_1093998 ) ) ( not ( = ?auto_1093989 ?auto_1093999 ) ) ( not ( = ?auto_1093989 ?auto_1094000 ) ) ( not ( = ?auto_1093989 ?auto_1094003 ) ) ( not ( = ?auto_1093991 ?auto_1093990 ) ) ( not ( = ?auto_1093991 ?auto_1093992 ) ) ( not ( = ?auto_1093991 ?auto_1093993 ) ) ( not ( = ?auto_1093991 ?auto_1093994 ) ) ( not ( = ?auto_1093991 ?auto_1093995 ) ) ( not ( = ?auto_1093991 ?auto_1093996 ) ) ( not ( = ?auto_1093991 ?auto_1093997 ) ) ( not ( = ?auto_1093991 ?auto_1093998 ) ) ( not ( = ?auto_1093991 ?auto_1093999 ) ) ( not ( = ?auto_1093991 ?auto_1094000 ) ) ( not ( = ?auto_1093991 ?auto_1094003 ) ) ( not ( = ?auto_1093990 ?auto_1093992 ) ) ( not ( = ?auto_1093990 ?auto_1093993 ) ) ( not ( = ?auto_1093990 ?auto_1093994 ) ) ( not ( = ?auto_1093990 ?auto_1093995 ) ) ( not ( = ?auto_1093990 ?auto_1093996 ) ) ( not ( = ?auto_1093990 ?auto_1093997 ) ) ( not ( = ?auto_1093990 ?auto_1093998 ) ) ( not ( = ?auto_1093990 ?auto_1093999 ) ) ( not ( = ?auto_1093990 ?auto_1094000 ) ) ( not ( = ?auto_1093990 ?auto_1094003 ) ) ( not ( = ?auto_1093992 ?auto_1093993 ) ) ( not ( = ?auto_1093992 ?auto_1093994 ) ) ( not ( = ?auto_1093992 ?auto_1093995 ) ) ( not ( = ?auto_1093992 ?auto_1093996 ) ) ( not ( = ?auto_1093992 ?auto_1093997 ) ) ( not ( = ?auto_1093992 ?auto_1093998 ) ) ( not ( = ?auto_1093992 ?auto_1093999 ) ) ( not ( = ?auto_1093992 ?auto_1094000 ) ) ( not ( = ?auto_1093992 ?auto_1094003 ) ) ( not ( = ?auto_1093993 ?auto_1093994 ) ) ( not ( = ?auto_1093993 ?auto_1093995 ) ) ( not ( = ?auto_1093993 ?auto_1093996 ) ) ( not ( = ?auto_1093993 ?auto_1093997 ) ) ( not ( = ?auto_1093993 ?auto_1093998 ) ) ( not ( = ?auto_1093993 ?auto_1093999 ) ) ( not ( = ?auto_1093993 ?auto_1094000 ) ) ( not ( = ?auto_1093993 ?auto_1094003 ) ) ( not ( = ?auto_1093994 ?auto_1093995 ) ) ( not ( = ?auto_1093994 ?auto_1093996 ) ) ( not ( = ?auto_1093994 ?auto_1093997 ) ) ( not ( = ?auto_1093994 ?auto_1093998 ) ) ( not ( = ?auto_1093994 ?auto_1093999 ) ) ( not ( = ?auto_1093994 ?auto_1094000 ) ) ( not ( = ?auto_1093994 ?auto_1094003 ) ) ( not ( = ?auto_1093995 ?auto_1093996 ) ) ( not ( = ?auto_1093995 ?auto_1093997 ) ) ( not ( = ?auto_1093995 ?auto_1093998 ) ) ( not ( = ?auto_1093995 ?auto_1093999 ) ) ( not ( = ?auto_1093995 ?auto_1094000 ) ) ( not ( = ?auto_1093995 ?auto_1094003 ) ) ( not ( = ?auto_1093996 ?auto_1093997 ) ) ( not ( = ?auto_1093996 ?auto_1093998 ) ) ( not ( = ?auto_1093996 ?auto_1093999 ) ) ( not ( = ?auto_1093996 ?auto_1094000 ) ) ( not ( = ?auto_1093996 ?auto_1094003 ) ) ( not ( = ?auto_1093997 ?auto_1093998 ) ) ( not ( = ?auto_1093997 ?auto_1093999 ) ) ( not ( = ?auto_1093997 ?auto_1094000 ) ) ( not ( = ?auto_1093997 ?auto_1094003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093998 ?auto_1093999 ?auto_1094000 )
      ( MAKE-13CRATE-VERIFY ?auto_1093987 ?auto_1093988 ?auto_1093989 ?auto_1093991 ?auto_1093990 ?auto_1093992 ?auto_1093993 ?auto_1093994 ?auto_1093995 ?auto_1093996 ?auto_1093997 ?auto_1093998 ?auto_1093999 ?auto_1094000 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094170 - SURFACE
      ?auto_1094171 - SURFACE
      ?auto_1094172 - SURFACE
      ?auto_1094174 - SURFACE
      ?auto_1094173 - SURFACE
      ?auto_1094175 - SURFACE
      ?auto_1094176 - SURFACE
      ?auto_1094177 - SURFACE
      ?auto_1094178 - SURFACE
      ?auto_1094179 - SURFACE
      ?auto_1094180 - SURFACE
      ?auto_1094181 - SURFACE
      ?auto_1094182 - SURFACE
      ?auto_1094183 - SURFACE
    )
    :vars
    (
      ?auto_1094184 - HOIST
      ?auto_1094185 - PLACE
      ?auto_1094186 - PLACE
      ?auto_1094189 - HOIST
      ?auto_1094188 - SURFACE
      ?auto_1094187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094184 ?auto_1094185 ) ( IS-CRATE ?auto_1094183 ) ( not ( = ?auto_1094182 ?auto_1094183 ) ) ( not ( = ?auto_1094181 ?auto_1094182 ) ) ( not ( = ?auto_1094181 ?auto_1094183 ) ) ( not ( = ?auto_1094186 ?auto_1094185 ) ) ( HOIST-AT ?auto_1094189 ?auto_1094186 ) ( not ( = ?auto_1094184 ?auto_1094189 ) ) ( AVAILABLE ?auto_1094189 ) ( SURFACE-AT ?auto_1094183 ?auto_1094186 ) ( ON ?auto_1094183 ?auto_1094188 ) ( CLEAR ?auto_1094183 ) ( not ( = ?auto_1094182 ?auto_1094188 ) ) ( not ( = ?auto_1094183 ?auto_1094188 ) ) ( not ( = ?auto_1094181 ?auto_1094188 ) ) ( TRUCK-AT ?auto_1094187 ?auto_1094185 ) ( SURFACE-AT ?auto_1094181 ?auto_1094185 ) ( CLEAR ?auto_1094181 ) ( IS-CRATE ?auto_1094182 ) ( AVAILABLE ?auto_1094184 ) ( IN ?auto_1094182 ?auto_1094187 ) ( ON ?auto_1094171 ?auto_1094170 ) ( ON ?auto_1094172 ?auto_1094171 ) ( ON ?auto_1094174 ?auto_1094172 ) ( ON ?auto_1094173 ?auto_1094174 ) ( ON ?auto_1094175 ?auto_1094173 ) ( ON ?auto_1094176 ?auto_1094175 ) ( ON ?auto_1094177 ?auto_1094176 ) ( ON ?auto_1094178 ?auto_1094177 ) ( ON ?auto_1094179 ?auto_1094178 ) ( ON ?auto_1094180 ?auto_1094179 ) ( ON ?auto_1094181 ?auto_1094180 ) ( not ( = ?auto_1094170 ?auto_1094171 ) ) ( not ( = ?auto_1094170 ?auto_1094172 ) ) ( not ( = ?auto_1094170 ?auto_1094174 ) ) ( not ( = ?auto_1094170 ?auto_1094173 ) ) ( not ( = ?auto_1094170 ?auto_1094175 ) ) ( not ( = ?auto_1094170 ?auto_1094176 ) ) ( not ( = ?auto_1094170 ?auto_1094177 ) ) ( not ( = ?auto_1094170 ?auto_1094178 ) ) ( not ( = ?auto_1094170 ?auto_1094179 ) ) ( not ( = ?auto_1094170 ?auto_1094180 ) ) ( not ( = ?auto_1094170 ?auto_1094181 ) ) ( not ( = ?auto_1094170 ?auto_1094182 ) ) ( not ( = ?auto_1094170 ?auto_1094183 ) ) ( not ( = ?auto_1094170 ?auto_1094188 ) ) ( not ( = ?auto_1094171 ?auto_1094172 ) ) ( not ( = ?auto_1094171 ?auto_1094174 ) ) ( not ( = ?auto_1094171 ?auto_1094173 ) ) ( not ( = ?auto_1094171 ?auto_1094175 ) ) ( not ( = ?auto_1094171 ?auto_1094176 ) ) ( not ( = ?auto_1094171 ?auto_1094177 ) ) ( not ( = ?auto_1094171 ?auto_1094178 ) ) ( not ( = ?auto_1094171 ?auto_1094179 ) ) ( not ( = ?auto_1094171 ?auto_1094180 ) ) ( not ( = ?auto_1094171 ?auto_1094181 ) ) ( not ( = ?auto_1094171 ?auto_1094182 ) ) ( not ( = ?auto_1094171 ?auto_1094183 ) ) ( not ( = ?auto_1094171 ?auto_1094188 ) ) ( not ( = ?auto_1094172 ?auto_1094174 ) ) ( not ( = ?auto_1094172 ?auto_1094173 ) ) ( not ( = ?auto_1094172 ?auto_1094175 ) ) ( not ( = ?auto_1094172 ?auto_1094176 ) ) ( not ( = ?auto_1094172 ?auto_1094177 ) ) ( not ( = ?auto_1094172 ?auto_1094178 ) ) ( not ( = ?auto_1094172 ?auto_1094179 ) ) ( not ( = ?auto_1094172 ?auto_1094180 ) ) ( not ( = ?auto_1094172 ?auto_1094181 ) ) ( not ( = ?auto_1094172 ?auto_1094182 ) ) ( not ( = ?auto_1094172 ?auto_1094183 ) ) ( not ( = ?auto_1094172 ?auto_1094188 ) ) ( not ( = ?auto_1094174 ?auto_1094173 ) ) ( not ( = ?auto_1094174 ?auto_1094175 ) ) ( not ( = ?auto_1094174 ?auto_1094176 ) ) ( not ( = ?auto_1094174 ?auto_1094177 ) ) ( not ( = ?auto_1094174 ?auto_1094178 ) ) ( not ( = ?auto_1094174 ?auto_1094179 ) ) ( not ( = ?auto_1094174 ?auto_1094180 ) ) ( not ( = ?auto_1094174 ?auto_1094181 ) ) ( not ( = ?auto_1094174 ?auto_1094182 ) ) ( not ( = ?auto_1094174 ?auto_1094183 ) ) ( not ( = ?auto_1094174 ?auto_1094188 ) ) ( not ( = ?auto_1094173 ?auto_1094175 ) ) ( not ( = ?auto_1094173 ?auto_1094176 ) ) ( not ( = ?auto_1094173 ?auto_1094177 ) ) ( not ( = ?auto_1094173 ?auto_1094178 ) ) ( not ( = ?auto_1094173 ?auto_1094179 ) ) ( not ( = ?auto_1094173 ?auto_1094180 ) ) ( not ( = ?auto_1094173 ?auto_1094181 ) ) ( not ( = ?auto_1094173 ?auto_1094182 ) ) ( not ( = ?auto_1094173 ?auto_1094183 ) ) ( not ( = ?auto_1094173 ?auto_1094188 ) ) ( not ( = ?auto_1094175 ?auto_1094176 ) ) ( not ( = ?auto_1094175 ?auto_1094177 ) ) ( not ( = ?auto_1094175 ?auto_1094178 ) ) ( not ( = ?auto_1094175 ?auto_1094179 ) ) ( not ( = ?auto_1094175 ?auto_1094180 ) ) ( not ( = ?auto_1094175 ?auto_1094181 ) ) ( not ( = ?auto_1094175 ?auto_1094182 ) ) ( not ( = ?auto_1094175 ?auto_1094183 ) ) ( not ( = ?auto_1094175 ?auto_1094188 ) ) ( not ( = ?auto_1094176 ?auto_1094177 ) ) ( not ( = ?auto_1094176 ?auto_1094178 ) ) ( not ( = ?auto_1094176 ?auto_1094179 ) ) ( not ( = ?auto_1094176 ?auto_1094180 ) ) ( not ( = ?auto_1094176 ?auto_1094181 ) ) ( not ( = ?auto_1094176 ?auto_1094182 ) ) ( not ( = ?auto_1094176 ?auto_1094183 ) ) ( not ( = ?auto_1094176 ?auto_1094188 ) ) ( not ( = ?auto_1094177 ?auto_1094178 ) ) ( not ( = ?auto_1094177 ?auto_1094179 ) ) ( not ( = ?auto_1094177 ?auto_1094180 ) ) ( not ( = ?auto_1094177 ?auto_1094181 ) ) ( not ( = ?auto_1094177 ?auto_1094182 ) ) ( not ( = ?auto_1094177 ?auto_1094183 ) ) ( not ( = ?auto_1094177 ?auto_1094188 ) ) ( not ( = ?auto_1094178 ?auto_1094179 ) ) ( not ( = ?auto_1094178 ?auto_1094180 ) ) ( not ( = ?auto_1094178 ?auto_1094181 ) ) ( not ( = ?auto_1094178 ?auto_1094182 ) ) ( not ( = ?auto_1094178 ?auto_1094183 ) ) ( not ( = ?auto_1094178 ?auto_1094188 ) ) ( not ( = ?auto_1094179 ?auto_1094180 ) ) ( not ( = ?auto_1094179 ?auto_1094181 ) ) ( not ( = ?auto_1094179 ?auto_1094182 ) ) ( not ( = ?auto_1094179 ?auto_1094183 ) ) ( not ( = ?auto_1094179 ?auto_1094188 ) ) ( not ( = ?auto_1094180 ?auto_1094181 ) ) ( not ( = ?auto_1094180 ?auto_1094182 ) ) ( not ( = ?auto_1094180 ?auto_1094183 ) ) ( not ( = ?auto_1094180 ?auto_1094188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094181 ?auto_1094182 ?auto_1094183 )
      ( MAKE-13CRATE-VERIFY ?auto_1094170 ?auto_1094171 ?auto_1094172 ?auto_1094174 ?auto_1094173 ?auto_1094175 ?auto_1094176 ?auto_1094177 ?auto_1094178 ?auto_1094179 ?auto_1094180 ?auto_1094181 ?auto_1094182 ?auto_1094183 ) )
  )

)

