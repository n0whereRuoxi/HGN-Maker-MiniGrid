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
      ?auto_13446 - SURFACE
      ?auto_13447 - SURFACE
    )
    :vars
    (
      ?auto_13448 - HOIST
      ?auto_13449 - PLACE
      ?auto_13451 - PLACE
      ?auto_13452 - HOIST
      ?auto_13453 - SURFACE
      ?auto_13450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13448 ?auto_13449 ) ( SURFACE-AT ?auto_13446 ?auto_13449 ) ( CLEAR ?auto_13446 ) ( IS-CRATE ?auto_13447 ) ( AVAILABLE ?auto_13448 ) ( not ( = ?auto_13451 ?auto_13449 ) ) ( HOIST-AT ?auto_13452 ?auto_13451 ) ( AVAILABLE ?auto_13452 ) ( SURFACE-AT ?auto_13447 ?auto_13451 ) ( ON ?auto_13447 ?auto_13453 ) ( CLEAR ?auto_13447 ) ( TRUCK-AT ?auto_13450 ?auto_13449 ) ( not ( = ?auto_13446 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13453 ) ) ( not ( = ?auto_13447 ?auto_13453 ) ) ( not ( = ?auto_13448 ?auto_13452 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13450 ?auto_13449 ?auto_13451 )
      ( !LIFT ?auto_13452 ?auto_13447 ?auto_13453 ?auto_13451 )
      ( !LOAD ?auto_13452 ?auto_13447 ?auto_13450 ?auto_13451 )
      ( !DRIVE ?auto_13450 ?auto_13451 ?auto_13449 )
      ( !UNLOAD ?auto_13448 ?auto_13447 ?auto_13450 ?auto_13449 )
      ( !DROP ?auto_13448 ?auto_13447 ?auto_13446 ?auto_13449 )
      ( MAKE-1CRATE-VERIFY ?auto_13446 ?auto_13447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13467 - SURFACE
      ?auto_13468 - SURFACE
      ?auto_13469 - SURFACE
    )
    :vars
    (
      ?auto_13475 - HOIST
      ?auto_13474 - PLACE
      ?auto_13472 - PLACE
      ?auto_13473 - HOIST
      ?auto_13471 - SURFACE
      ?auto_13476 - PLACE
      ?auto_13477 - HOIST
      ?auto_13478 - SURFACE
      ?auto_13470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13475 ?auto_13474 ) ( IS-CRATE ?auto_13469 ) ( not ( = ?auto_13472 ?auto_13474 ) ) ( HOIST-AT ?auto_13473 ?auto_13472 ) ( AVAILABLE ?auto_13473 ) ( SURFACE-AT ?auto_13469 ?auto_13472 ) ( ON ?auto_13469 ?auto_13471 ) ( CLEAR ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13468 ?auto_13471 ) ) ( not ( = ?auto_13469 ?auto_13471 ) ) ( not ( = ?auto_13475 ?auto_13473 ) ) ( SURFACE-AT ?auto_13467 ?auto_13474 ) ( CLEAR ?auto_13467 ) ( IS-CRATE ?auto_13468 ) ( AVAILABLE ?auto_13475 ) ( not ( = ?auto_13476 ?auto_13474 ) ) ( HOIST-AT ?auto_13477 ?auto_13476 ) ( AVAILABLE ?auto_13477 ) ( SURFACE-AT ?auto_13468 ?auto_13476 ) ( ON ?auto_13468 ?auto_13478 ) ( CLEAR ?auto_13468 ) ( TRUCK-AT ?auto_13470 ?auto_13474 ) ( not ( = ?auto_13467 ?auto_13468 ) ) ( not ( = ?auto_13467 ?auto_13478 ) ) ( not ( = ?auto_13468 ?auto_13478 ) ) ( not ( = ?auto_13475 ?auto_13477 ) ) ( not ( = ?auto_13467 ?auto_13469 ) ) ( not ( = ?auto_13467 ?auto_13471 ) ) ( not ( = ?auto_13469 ?auto_13478 ) ) ( not ( = ?auto_13472 ?auto_13476 ) ) ( not ( = ?auto_13473 ?auto_13477 ) ) ( not ( = ?auto_13471 ?auto_13478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13467 ?auto_13468 )
      ( MAKE-1CRATE ?auto_13468 ?auto_13469 )
      ( MAKE-2CRATE-VERIFY ?auto_13467 ?auto_13468 ?auto_13469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13493 - SURFACE
      ?auto_13494 - SURFACE
      ?auto_13495 - SURFACE
      ?auto_13496 - SURFACE
    )
    :vars
    (
      ?auto_13500 - HOIST
      ?auto_13497 - PLACE
      ?auto_13499 - PLACE
      ?auto_13502 - HOIST
      ?auto_13498 - SURFACE
      ?auto_13504 - PLACE
      ?auto_13506 - HOIST
      ?auto_13503 - SURFACE
      ?auto_13507 - PLACE
      ?auto_13508 - HOIST
      ?auto_13505 - SURFACE
      ?auto_13501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13500 ?auto_13497 ) ( IS-CRATE ?auto_13496 ) ( not ( = ?auto_13499 ?auto_13497 ) ) ( HOIST-AT ?auto_13502 ?auto_13499 ) ( AVAILABLE ?auto_13502 ) ( SURFACE-AT ?auto_13496 ?auto_13499 ) ( ON ?auto_13496 ?auto_13498 ) ( CLEAR ?auto_13496 ) ( not ( = ?auto_13495 ?auto_13496 ) ) ( not ( = ?auto_13495 ?auto_13498 ) ) ( not ( = ?auto_13496 ?auto_13498 ) ) ( not ( = ?auto_13500 ?auto_13502 ) ) ( IS-CRATE ?auto_13495 ) ( not ( = ?auto_13504 ?auto_13497 ) ) ( HOIST-AT ?auto_13506 ?auto_13504 ) ( AVAILABLE ?auto_13506 ) ( SURFACE-AT ?auto_13495 ?auto_13504 ) ( ON ?auto_13495 ?auto_13503 ) ( CLEAR ?auto_13495 ) ( not ( = ?auto_13494 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13503 ) ) ( not ( = ?auto_13495 ?auto_13503 ) ) ( not ( = ?auto_13500 ?auto_13506 ) ) ( SURFACE-AT ?auto_13493 ?auto_13497 ) ( CLEAR ?auto_13493 ) ( IS-CRATE ?auto_13494 ) ( AVAILABLE ?auto_13500 ) ( not ( = ?auto_13507 ?auto_13497 ) ) ( HOIST-AT ?auto_13508 ?auto_13507 ) ( AVAILABLE ?auto_13508 ) ( SURFACE-AT ?auto_13494 ?auto_13507 ) ( ON ?auto_13494 ?auto_13505 ) ( CLEAR ?auto_13494 ) ( TRUCK-AT ?auto_13501 ?auto_13497 ) ( not ( = ?auto_13493 ?auto_13494 ) ) ( not ( = ?auto_13493 ?auto_13505 ) ) ( not ( = ?auto_13494 ?auto_13505 ) ) ( not ( = ?auto_13500 ?auto_13508 ) ) ( not ( = ?auto_13493 ?auto_13495 ) ) ( not ( = ?auto_13493 ?auto_13503 ) ) ( not ( = ?auto_13495 ?auto_13505 ) ) ( not ( = ?auto_13504 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13508 ) ) ( not ( = ?auto_13503 ?auto_13505 ) ) ( not ( = ?auto_13493 ?auto_13496 ) ) ( not ( = ?auto_13493 ?auto_13498 ) ) ( not ( = ?auto_13494 ?auto_13496 ) ) ( not ( = ?auto_13494 ?auto_13498 ) ) ( not ( = ?auto_13496 ?auto_13503 ) ) ( not ( = ?auto_13496 ?auto_13505 ) ) ( not ( = ?auto_13499 ?auto_13504 ) ) ( not ( = ?auto_13499 ?auto_13507 ) ) ( not ( = ?auto_13502 ?auto_13506 ) ) ( not ( = ?auto_13502 ?auto_13508 ) ) ( not ( = ?auto_13498 ?auto_13503 ) ) ( not ( = ?auto_13498 ?auto_13505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13493 ?auto_13494 ?auto_13495 )
      ( MAKE-1CRATE ?auto_13495 ?auto_13496 )
      ( MAKE-3CRATE-VERIFY ?auto_13493 ?auto_13494 ?auto_13495 ?auto_13496 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13524 - SURFACE
      ?auto_13525 - SURFACE
      ?auto_13526 - SURFACE
      ?auto_13527 - SURFACE
      ?auto_13528 - SURFACE
    )
    :vars
    (
      ?auto_13533 - HOIST
      ?auto_13531 - PLACE
      ?auto_13534 - PLACE
      ?auto_13532 - HOIST
      ?auto_13529 - SURFACE
      ?auto_13535 - PLACE
      ?auto_13537 - HOIST
      ?auto_13542 - SURFACE
      ?auto_13543 - PLACE
      ?auto_13536 - HOIST
      ?auto_13541 - SURFACE
      ?auto_13539 - PLACE
      ?auto_13538 - HOIST
      ?auto_13540 - SURFACE
      ?auto_13530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13533 ?auto_13531 ) ( IS-CRATE ?auto_13528 ) ( not ( = ?auto_13534 ?auto_13531 ) ) ( HOIST-AT ?auto_13532 ?auto_13534 ) ( AVAILABLE ?auto_13532 ) ( SURFACE-AT ?auto_13528 ?auto_13534 ) ( ON ?auto_13528 ?auto_13529 ) ( CLEAR ?auto_13528 ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( not ( = ?auto_13527 ?auto_13529 ) ) ( not ( = ?auto_13528 ?auto_13529 ) ) ( not ( = ?auto_13533 ?auto_13532 ) ) ( IS-CRATE ?auto_13527 ) ( not ( = ?auto_13535 ?auto_13531 ) ) ( HOIST-AT ?auto_13537 ?auto_13535 ) ( AVAILABLE ?auto_13537 ) ( SURFACE-AT ?auto_13527 ?auto_13535 ) ( ON ?auto_13527 ?auto_13542 ) ( CLEAR ?auto_13527 ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13542 ) ) ( not ( = ?auto_13527 ?auto_13542 ) ) ( not ( = ?auto_13533 ?auto_13537 ) ) ( IS-CRATE ?auto_13526 ) ( not ( = ?auto_13543 ?auto_13531 ) ) ( HOIST-AT ?auto_13536 ?auto_13543 ) ( AVAILABLE ?auto_13536 ) ( SURFACE-AT ?auto_13526 ?auto_13543 ) ( ON ?auto_13526 ?auto_13541 ) ( CLEAR ?auto_13526 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13541 ) ) ( not ( = ?auto_13526 ?auto_13541 ) ) ( not ( = ?auto_13533 ?auto_13536 ) ) ( SURFACE-AT ?auto_13524 ?auto_13531 ) ( CLEAR ?auto_13524 ) ( IS-CRATE ?auto_13525 ) ( AVAILABLE ?auto_13533 ) ( not ( = ?auto_13539 ?auto_13531 ) ) ( HOIST-AT ?auto_13538 ?auto_13539 ) ( AVAILABLE ?auto_13538 ) ( SURFACE-AT ?auto_13525 ?auto_13539 ) ( ON ?auto_13525 ?auto_13540 ) ( CLEAR ?auto_13525 ) ( TRUCK-AT ?auto_13530 ?auto_13531 ) ( not ( = ?auto_13524 ?auto_13525 ) ) ( not ( = ?auto_13524 ?auto_13540 ) ) ( not ( = ?auto_13525 ?auto_13540 ) ) ( not ( = ?auto_13533 ?auto_13538 ) ) ( not ( = ?auto_13524 ?auto_13526 ) ) ( not ( = ?auto_13524 ?auto_13541 ) ) ( not ( = ?auto_13526 ?auto_13540 ) ) ( not ( = ?auto_13543 ?auto_13539 ) ) ( not ( = ?auto_13536 ?auto_13538 ) ) ( not ( = ?auto_13541 ?auto_13540 ) ) ( not ( = ?auto_13524 ?auto_13527 ) ) ( not ( = ?auto_13524 ?auto_13542 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13542 ) ) ( not ( = ?auto_13527 ?auto_13541 ) ) ( not ( = ?auto_13527 ?auto_13540 ) ) ( not ( = ?auto_13535 ?auto_13543 ) ) ( not ( = ?auto_13535 ?auto_13539 ) ) ( not ( = ?auto_13537 ?auto_13536 ) ) ( not ( = ?auto_13537 ?auto_13538 ) ) ( not ( = ?auto_13542 ?auto_13541 ) ) ( not ( = ?auto_13542 ?auto_13540 ) ) ( not ( = ?auto_13524 ?auto_13528 ) ) ( not ( = ?auto_13524 ?auto_13529 ) ) ( not ( = ?auto_13525 ?auto_13528 ) ) ( not ( = ?auto_13525 ?auto_13529 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13529 ) ) ( not ( = ?auto_13528 ?auto_13542 ) ) ( not ( = ?auto_13528 ?auto_13541 ) ) ( not ( = ?auto_13528 ?auto_13540 ) ) ( not ( = ?auto_13534 ?auto_13535 ) ) ( not ( = ?auto_13534 ?auto_13543 ) ) ( not ( = ?auto_13534 ?auto_13539 ) ) ( not ( = ?auto_13532 ?auto_13537 ) ) ( not ( = ?auto_13532 ?auto_13536 ) ) ( not ( = ?auto_13532 ?auto_13538 ) ) ( not ( = ?auto_13529 ?auto_13542 ) ) ( not ( = ?auto_13529 ?auto_13541 ) ) ( not ( = ?auto_13529 ?auto_13540 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13527 )
      ( MAKE-1CRATE ?auto_13527 ?auto_13528 )
      ( MAKE-4CRATE-VERIFY ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13527 ?auto_13528 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13560 - SURFACE
      ?auto_13561 - SURFACE
      ?auto_13562 - SURFACE
      ?auto_13563 - SURFACE
      ?auto_13564 - SURFACE
      ?auto_13565 - SURFACE
    )
    :vars
    (
      ?auto_13571 - HOIST
      ?auto_13570 - PLACE
      ?auto_13567 - PLACE
      ?auto_13566 - HOIST
      ?auto_13569 - SURFACE
      ?auto_13576 - PLACE
      ?auto_13577 - HOIST
      ?auto_13579 - SURFACE
      ?auto_13578 - PLACE
      ?auto_13574 - HOIST
      ?auto_13580 - SURFACE
      ?auto_13573 - PLACE
      ?auto_13572 - HOIST
      ?auto_13581 - SURFACE
      ?auto_13583 - PLACE
      ?auto_13575 - HOIST
      ?auto_13582 - SURFACE
      ?auto_13568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13571 ?auto_13570 ) ( IS-CRATE ?auto_13565 ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( HOIST-AT ?auto_13566 ?auto_13567 ) ( AVAILABLE ?auto_13566 ) ( SURFACE-AT ?auto_13565 ?auto_13567 ) ( ON ?auto_13565 ?auto_13569 ) ( CLEAR ?auto_13565 ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13569 ) ) ( not ( = ?auto_13565 ?auto_13569 ) ) ( not ( = ?auto_13571 ?auto_13566 ) ) ( IS-CRATE ?auto_13564 ) ( not ( = ?auto_13576 ?auto_13570 ) ) ( HOIST-AT ?auto_13577 ?auto_13576 ) ( AVAILABLE ?auto_13577 ) ( SURFACE-AT ?auto_13564 ?auto_13576 ) ( ON ?auto_13564 ?auto_13579 ) ( CLEAR ?auto_13564 ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13579 ) ) ( not ( = ?auto_13564 ?auto_13579 ) ) ( not ( = ?auto_13571 ?auto_13577 ) ) ( IS-CRATE ?auto_13563 ) ( not ( = ?auto_13578 ?auto_13570 ) ) ( HOIST-AT ?auto_13574 ?auto_13578 ) ( AVAILABLE ?auto_13574 ) ( SURFACE-AT ?auto_13563 ?auto_13578 ) ( ON ?auto_13563 ?auto_13580 ) ( CLEAR ?auto_13563 ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( not ( = ?auto_13562 ?auto_13580 ) ) ( not ( = ?auto_13563 ?auto_13580 ) ) ( not ( = ?auto_13571 ?auto_13574 ) ) ( IS-CRATE ?auto_13562 ) ( not ( = ?auto_13573 ?auto_13570 ) ) ( HOIST-AT ?auto_13572 ?auto_13573 ) ( AVAILABLE ?auto_13572 ) ( SURFACE-AT ?auto_13562 ?auto_13573 ) ( ON ?auto_13562 ?auto_13581 ) ( CLEAR ?auto_13562 ) ( not ( = ?auto_13561 ?auto_13562 ) ) ( not ( = ?auto_13561 ?auto_13581 ) ) ( not ( = ?auto_13562 ?auto_13581 ) ) ( not ( = ?auto_13571 ?auto_13572 ) ) ( SURFACE-AT ?auto_13560 ?auto_13570 ) ( CLEAR ?auto_13560 ) ( IS-CRATE ?auto_13561 ) ( AVAILABLE ?auto_13571 ) ( not ( = ?auto_13583 ?auto_13570 ) ) ( HOIST-AT ?auto_13575 ?auto_13583 ) ( AVAILABLE ?auto_13575 ) ( SURFACE-AT ?auto_13561 ?auto_13583 ) ( ON ?auto_13561 ?auto_13582 ) ( CLEAR ?auto_13561 ) ( TRUCK-AT ?auto_13568 ?auto_13570 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13582 ) ) ( not ( = ?auto_13561 ?auto_13582 ) ) ( not ( = ?auto_13571 ?auto_13575 ) ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13581 ) ) ( not ( = ?auto_13562 ?auto_13582 ) ) ( not ( = ?auto_13573 ?auto_13583 ) ) ( not ( = ?auto_13572 ?auto_13575 ) ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13560 ?auto_13580 ) ) ( not ( = ?auto_13561 ?auto_13563 ) ) ( not ( = ?auto_13561 ?auto_13580 ) ) ( not ( = ?auto_13563 ?auto_13581 ) ) ( not ( = ?auto_13563 ?auto_13582 ) ) ( not ( = ?auto_13578 ?auto_13573 ) ) ( not ( = ?auto_13578 ?auto_13583 ) ) ( not ( = ?auto_13574 ?auto_13572 ) ) ( not ( = ?auto_13574 ?auto_13575 ) ) ( not ( = ?auto_13580 ?auto_13581 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13560 ?auto_13564 ) ) ( not ( = ?auto_13560 ?auto_13579 ) ) ( not ( = ?auto_13561 ?auto_13564 ) ) ( not ( = ?auto_13561 ?auto_13579 ) ) ( not ( = ?auto_13562 ?auto_13564 ) ) ( not ( = ?auto_13562 ?auto_13579 ) ) ( not ( = ?auto_13564 ?auto_13580 ) ) ( not ( = ?auto_13564 ?auto_13581 ) ) ( not ( = ?auto_13564 ?auto_13582 ) ) ( not ( = ?auto_13576 ?auto_13578 ) ) ( not ( = ?auto_13576 ?auto_13573 ) ) ( not ( = ?auto_13576 ?auto_13583 ) ) ( not ( = ?auto_13577 ?auto_13574 ) ) ( not ( = ?auto_13577 ?auto_13572 ) ) ( not ( = ?auto_13577 ?auto_13575 ) ) ( not ( = ?auto_13579 ?auto_13580 ) ) ( not ( = ?auto_13579 ?auto_13581 ) ) ( not ( = ?auto_13579 ?auto_13582 ) ) ( not ( = ?auto_13560 ?auto_13565 ) ) ( not ( = ?auto_13560 ?auto_13569 ) ) ( not ( = ?auto_13561 ?auto_13565 ) ) ( not ( = ?auto_13561 ?auto_13569 ) ) ( not ( = ?auto_13562 ?auto_13565 ) ) ( not ( = ?auto_13562 ?auto_13569 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( not ( = ?auto_13563 ?auto_13569 ) ) ( not ( = ?auto_13565 ?auto_13579 ) ) ( not ( = ?auto_13565 ?auto_13580 ) ) ( not ( = ?auto_13565 ?auto_13581 ) ) ( not ( = ?auto_13565 ?auto_13582 ) ) ( not ( = ?auto_13567 ?auto_13576 ) ) ( not ( = ?auto_13567 ?auto_13578 ) ) ( not ( = ?auto_13567 ?auto_13573 ) ) ( not ( = ?auto_13567 ?auto_13583 ) ) ( not ( = ?auto_13566 ?auto_13577 ) ) ( not ( = ?auto_13566 ?auto_13574 ) ) ( not ( = ?auto_13566 ?auto_13572 ) ) ( not ( = ?auto_13566 ?auto_13575 ) ) ( not ( = ?auto_13569 ?auto_13579 ) ) ( not ( = ?auto_13569 ?auto_13580 ) ) ( not ( = ?auto_13569 ?auto_13581 ) ) ( not ( = ?auto_13569 ?auto_13582 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 ?auto_13564 )
      ( MAKE-1CRATE ?auto_13564 ?auto_13565 )
      ( MAKE-5CRATE-VERIFY ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 ?auto_13564 ?auto_13565 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13601 - SURFACE
      ?auto_13602 - SURFACE
      ?auto_13603 - SURFACE
      ?auto_13604 - SURFACE
      ?auto_13605 - SURFACE
      ?auto_13606 - SURFACE
      ?auto_13607 - SURFACE
    )
    :vars
    (
      ?auto_13613 - HOIST
      ?auto_13608 - PLACE
      ?auto_13609 - PLACE
      ?auto_13611 - HOIST
      ?auto_13612 - SURFACE
      ?auto_13617 - PLACE
      ?auto_13620 - HOIST
      ?auto_13628 - SURFACE
      ?auto_13622 - PLACE
      ?auto_13621 - HOIST
      ?auto_13626 - SURFACE
      ?auto_13627 - PLACE
      ?auto_13615 - HOIST
      ?auto_13618 - SURFACE
      ?auto_13616 - PLACE
      ?auto_13623 - HOIST
      ?auto_13624 - SURFACE
      ?auto_13625 - PLACE
      ?auto_13619 - HOIST
      ?auto_13614 - SURFACE
      ?auto_13610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13613 ?auto_13608 ) ( IS-CRATE ?auto_13607 ) ( not ( = ?auto_13609 ?auto_13608 ) ) ( HOIST-AT ?auto_13611 ?auto_13609 ) ( AVAILABLE ?auto_13611 ) ( SURFACE-AT ?auto_13607 ?auto_13609 ) ( ON ?auto_13607 ?auto_13612 ) ( CLEAR ?auto_13607 ) ( not ( = ?auto_13606 ?auto_13607 ) ) ( not ( = ?auto_13606 ?auto_13612 ) ) ( not ( = ?auto_13607 ?auto_13612 ) ) ( not ( = ?auto_13613 ?auto_13611 ) ) ( IS-CRATE ?auto_13606 ) ( not ( = ?auto_13617 ?auto_13608 ) ) ( HOIST-AT ?auto_13620 ?auto_13617 ) ( AVAILABLE ?auto_13620 ) ( SURFACE-AT ?auto_13606 ?auto_13617 ) ( ON ?auto_13606 ?auto_13628 ) ( CLEAR ?auto_13606 ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( not ( = ?auto_13605 ?auto_13628 ) ) ( not ( = ?auto_13606 ?auto_13628 ) ) ( not ( = ?auto_13613 ?auto_13620 ) ) ( IS-CRATE ?auto_13605 ) ( not ( = ?auto_13622 ?auto_13608 ) ) ( HOIST-AT ?auto_13621 ?auto_13622 ) ( AVAILABLE ?auto_13621 ) ( SURFACE-AT ?auto_13605 ?auto_13622 ) ( ON ?auto_13605 ?auto_13626 ) ( CLEAR ?auto_13605 ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13626 ) ) ( not ( = ?auto_13605 ?auto_13626 ) ) ( not ( = ?auto_13613 ?auto_13621 ) ) ( IS-CRATE ?auto_13604 ) ( not ( = ?auto_13627 ?auto_13608 ) ) ( HOIST-AT ?auto_13615 ?auto_13627 ) ( AVAILABLE ?auto_13615 ) ( SURFACE-AT ?auto_13604 ?auto_13627 ) ( ON ?auto_13604 ?auto_13618 ) ( CLEAR ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13618 ) ) ( not ( = ?auto_13604 ?auto_13618 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( IS-CRATE ?auto_13603 ) ( not ( = ?auto_13616 ?auto_13608 ) ) ( HOIST-AT ?auto_13623 ?auto_13616 ) ( AVAILABLE ?auto_13623 ) ( SURFACE-AT ?auto_13603 ?auto_13616 ) ( ON ?auto_13603 ?auto_13624 ) ( CLEAR ?auto_13603 ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13624 ) ) ( not ( = ?auto_13603 ?auto_13624 ) ) ( not ( = ?auto_13613 ?auto_13623 ) ) ( SURFACE-AT ?auto_13601 ?auto_13608 ) ( CLEAR ?auto_13601 ) ( IS-CRATE ?auto_13602 ) ( AVAILABLE ?auto_13613 ) ( not ( = ?auto_13625 ?auto_13608 ) ) ( HOIST-AT ?auto_13619 ?auto_13625 ) ( AVAILABLE ?auto_13619 ) ( SURFACE-AT ?auto_13602 ?auto_13625 ) ( ON ?auto_13602 ?auto_13614 ) ( CLEAR ?auto_13602 ) ( TRUCK-AT ?auto_13610 ?auto_13608 ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13614 ) ) ( not ( = ?auto_13602 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13619 ) ) ( not ( = ?auto_13601 ?auto_13603 ) ) ( not ( = ?auto_13601 ?auto_13624 ) ) ( not ( = ?auto_13603 ?auto_13614 ) ) ( not ( = ?auto_13616 ?auto_13625 ) ) ( not ( = ?auto_13623 ?auto_13619 ) ) ( not ( = ?auto_13624 ?auto_13614 ) ) ( not ( = ?auto_13601 ?auto_13604 ) ) ( not ( = ?auto_13601 ?auto_13618 ) ) ( not ( = ?auto_13602 ?auto_13604 ) ) ( not ( = ?auto_13602 ?auto_13618 ) ) ( not ( = ?auto_13604 ?auto_13624 ) ) ( not ( = ?auto_13604 ?auto_13614 ) ) ( not ( = ?auto_13627 ?auto_13616 ) ) ( not ( = ?auto_13627 ?auto_13625 ) ) ( not ( = ?auto_13615 ?auto_13623 ) ) ( not ( = ?auto_13615 ?auto_13619 ) ) ( not ( = ?auto_13618 ?auto_13624 ) ) ( not ( = ?auto_13618 ?auto_13614 ) ) ( not ( = ?auto_13601 ?auto_13605 ) ) ( not ( = ?auto_13601 ?auto_13626 ) ) ( not ( = ?auto_13602 ?auto_13605 ) ) ( not ( = ?auto_13602 ?auto_13626 ) ) ( not ( = ?auto_13603 ?auto_13605 ) ) ( not ( = ?auto_13603 ?auto_13626 ) ) ( not ( = ?auto_13605 ?auto_13618 ) ) ( not ( = ?auto_13605 ?auto_13624 ) ) ( not ( = ?auto_13605 ?auto_13614 ) ) ( not ( = ?auto_13622 ?auto_13627 ) ) ( not ( = ?auto_13622 ?auto_13616 ) ) ( not ( = ?auto_13622 ?auto_13625 ) ) ( not ( = ?auto_13621 ?auto_13615 ) ) ( not ( = ?auto_13621 ?auto_13623 ) ) ( not ( = ?auto_13621 ?auto_13619 ) ) ( not ( = ?auto_13626 ?auto_13618 ) ) ( not ( = ?auto_13626 ?auto_13624 ) ) ( not ( = ?auto_13626 ?auto_13614 ) ) ( not ( = ?auto_13601 ?auto_13606 ) ) ( not ( = ?auto_13601 ?auto_13628 ) ) ( not ( = ?auto_13602 ?auto_13606 ) ) ( not ( = ?auto_13602 ?auto_13628 ) ) ( not ( = ?auto_13603 ?auto_13606 ) ) ( not ( = ?auto_13603 ?auto_13628 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13628 ) ) ( not ( = ?auto_13606 ?auto_13626 ) ) ( not ( = ?auto_13606 ?auto_13618 ) ) ( not ( = ?auto_13606 ?auto_13624 ) ) ( not ( = ?auto_13606 ?auto_13614 ) ) ( not ( = ?auto_13617 ?auto_13622 ) ) ( not ( = ?auto_13617 ?auto_13627 ) ) ( not ( = ?auto_13617 ?auto_13616 ) ) ( not ( = ?auto_13617 ?auto_13625 ) ) ( not ( = ?auto_13620 ?auto_13621 ) ) ( not ( = ?auto_13620 ?auto_13615 ) ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( not ( = ?auto_13620 ?auto_13619 ) ) ( not ( = ?auto_13628 ?auto_13626 ) ) ( not ( = ?auto_13628 ?auto_13618 ) ) ( not ( = ?auto_13628 ?auto_13624 ) ) ( not ( = ?auto_13628 ?auto_13614 ) ) ( not ( = ?auto_13601 ?auto_13607 ) ) ( not ( = ?auto_13601 ?auto_13612 ) ) ( not ( = ?auto_13602 ?auto_13607 ) ) ( not ( = ?auto_13602 ?auto_13612 ) ) ( not ( = ?auto_13603 ?auto_13607 ) ) ( not ( = ?auto_13603 ?auto_13612 ) ) ( not ( = ?auto_13604 ?auto_13607 ) ) ( not ( = ?auto_13604 ?auto_13612 ) ) ( not ( = ?auto_13605 ?auto_13607 ) ) ( not ( = ?auto_13605 ?auto_13612 ) ) ( not ( = ?auto_13607 ?auto_13628 ) ) ( not ( = ?auto_13607 ?auto_13626 ) ) ( not ( = ?auto_13607 ?auto_13618 ) ) ( not ( = ?auto_13607 ?auto_13624 ) ) ( not ( = ?auto_13607 ?auto_13614 ) ) ( not ( = ?auto_13609 ?auto_13617 ) ) ( not ( = ?auto_13609 ?auto_13622 ) ) ( not ( = ?auto_13609 ?auto_13627 ) ) ( not ( = ?auto_13609 ?auto_13616 ) ) ( not ( = ?auto_13609 ?auto_13625 ) ) ( not ( = ?auto_13611 ?auto_13620 ) ) ( not ( = ?auto_13611 ?auto_13621 ) ) ( not ( = ?auto_13611 ?auto_13615 ) ) ( not ( = ?auto_13611 ?auto_13623 ) ) ( not ( = ?auto_13611 ?auto_13619 ) ) ( not ( = ?auto_13612 ?auto_13628 ) ) ( not ( = ?auto_13612 ?auto_13626 ) ) ( not ( = ?auto_13612 ?auto_13618 ) ) ( not ( = ?auto_13612 ?auto_13624 ) ) ( not ( = ?auto_13612 ?auto_13614 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13604 ?auto_13605 ?auto_13606 )
      ( MAKE-1CRATE ?auto_13606 ?auto_13607 )
      ( MAKE-6CRATE-VERIFY ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13604 ?auto_13605 ?auto_13606 ?auto_13607 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13647 - SURFACE
      ?auto_13648 - SURFACE
      ?auto_13649 - SURFACE
      ?auto_13650 - SURFACE
      ?auto_13651 - SURFACE
      ?auto_13652 - SURFACE
      ?auto_13653 - SURFACE
      ?auto_13654 - SURFACE
    )
    :vars
    (
      ?auto_13660 - HOIST
      ?auto_13659 - PLACE
      ?auto_13656 - PLACE
      ?auto_13658 - HOIST
      ?auto_13655 - SURFACE
      ?auto_13667 - PLACE
      ?auto_13673 - HOIST
      ?auto_13674 - SURFACE
      ?auto_13664 - PLACE
      ?auto_13676 - HOIST
      ?auto_13666 - SURFACE
      ?auto_13668 - PLACE
      ?auto_13675 - HOIST
      ?auto_13662 - SURFACE
      ?auto_13663 - SURFACE
      ?auto_13665 - PLACE
      ?auto_13670 - HOIST
      ?auto_13672 - SURFACE
      ?auto_13671 - PLACE
      ?auto_13661 - HOIST
      ?auto_13669 - SURFACE
      ?auto_13657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13660 ?auto_13659 ) ( IS-CRATE ?auto_13654 ) ( not ( = ?auto_13656 ?auto_13659 ) ) ( HOIST-AT ?auto_13658 ?auto_13656 ) ( SURFACE-AT ?auto_13654 ?auto_13656 ) ( ON ?auto_13654 ?auto_13655 ) ( CLEAR ?auto_13654 ) ( not ( = ?auto_13653 ?auto_13654 ) ) ( not ( = ?auto_13653 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13655 ) ) ( not ( = ?auto_13660 ?auto_13658 ) ) ( IS-CRATE ?auto_13653 ) ( not ( = ?auto_13667 ?auto_13659 ) ) ( HOIST-AT ?auto_13673 ?auto_13667 ) ( AVAILABLE ?auto_13673 ) ( SURFACE-AT ?auto_13653 ?auto_13667 ) ( ON ?auto_13653 ?auto_13674 ) ( CLEAR ?auto_13653 ) ( not ( = ?auto_13652 ?auto_13653 ) ) ( not ( = ?auto_13652 ?auto_13674 ) ) ( not ( = ?auto_13653 ?auto_13674 ) ) ( not ( = ?auto_13660 ?auto_13673 ) ) ( IS-CRATE ?auto_13652 ) ( not ( = ?auto_13664 ?auto_13659 ) ) ( HOIST-AT ?auto_13676 ?auto_13664 ) ( AVAILABLE ?auto_13676 ) ( SURFACE-AT ?auto_13652 ?auto_13664 ) ( ON ?auto_13652 ?auto_13666 ) ( CLEAR ?auto_13652 ) ( not ( = ?auto_13651 ?auto_13652 ) ) ( not ( = ?auto_13651 ?auto_13666 ) ) ( not ( = ?auto_13652 ?auto_13666 ) ) ( not ( = ?auto_13660 ?auto_13676 ) ) ( IS-CRATE ?auto_13651 ) ( not ( = ?auto_13668 ?auto_13659 ) ) ( HOIST-AT ?auto_13675 ?auto_13668 ) ( AVAILABLE ?auto_13675 ) ( SURFACE-AT ?auto_13651 ?auto_13668 ) ( ON ?auto_13651 ?auto_13662 ) ( CLEAR ?auto_13651 ) ( not ( = ?auto_13650 ?auto_13651 ) ) ( not ( = ?auto_13650 ?auto_13662 ) ) ( not ( = ?auto_13651 ?auto_13662 ) ) ( not ( = ?auto_13660 ?auto_13675 ) ) ( IS-CRATE ?auto_13650 ) ( AVAILABLE ?auto_13658 ) ( SURFACE-AT ?auto_13650 ?auto_13656 ) ( ON ?auto_13650 ?auto_13663 ) ( CLEAR ?auto_13650 ) ( not ( = ?auto_13649 ?auto_13650 ) ) ( not ( = ?auto_13649 ?auto_13663 ) ) ( not ( = ?auto_13650 ?auto_13663 ) ) ( IS-CRATE ?auto_13649 ) ( not ( = ?auto_13665 ?auto_13659 ) ) ( HOIST-AT ?auto_13670 ?auto_13665 ) ( AVAILABLE ?auto_13670 ) ( SURFACE-AT ?auto_13649 ?auto_13665 ) ( ON ?auto_13649 ?auto_13672 ) ( CLEAR ?auto_13649 ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( not ( = ?auto_13648 ?auto_13672 ) ) ( not ( = ?auto_13649 ?auto_13672 ) ) ( not ( = ?auto_13660 ?auto_13670 ) ) ( SURFACE-AT ?auto_13647 ?auto_13659 ) ( CLEAR ?auto_13647 ) ( IS-CRATE ?auto_13648 ) ( AVAILABLE ?auto_13660 ) ( not ( = ?auto_13671 ?auto_13659 ) ) ( HOIST-AT ?auto_13661 ?auto_13671 ) ( AVAILABLE ?auto_13661 ) ( SURFACE-AT ?auto_13648 ?auto_13671 ) ( ON ?auto_13648 ?auto_13669 ) ( CLEAR ?auto_13648 ) ( TRUCK-AT ?auto_13657 ?auto_13659 ) ( not ( = ?auto_13647 ?auto_13648 ) ) ( not ( = ?auto_13647 ?auto_13669 ) ) ( not ( = ?auto_13648 ?auto_13669 ) ) ( not ( = ?auto_13660 ?auto_13661 ) ) ( not ( = ?auto_13647 ?auto_13649 ) ) ( not ( = ?auto_13647 ?auto_13672 ) ) ( not ( = ?auto_13649 ?auto_13669 ) ) ( not ( = ?auto_13665 ?auto_13671 ) ) ( not ( = ?auto_13670 ?auto_13661 ) ) ( not ( = ?auto_13672 ?auto_13669 ) ) ( not ( = ?auto_13647 ?auto_13650 ) ) ( not ( = ?auto_13647 ?auto_13663 ) ) ( not ( = ?auto_13648 ?auto_13650 ) ) ( not ( = ?auto_13648 ?auto_13663 ) ) ( not ( = ?auto_13650 ?auto_13672 ) ) ( not ( = ?auto_13650 ?auto_13669 ) ) ( not ( = ?auto_13656 ?auto_13665 ) ) ( not ( = ?auto_13656 ?auto_13671 ) ) ( not ( = ?auto_13658 ?auto_13670 ) ) ( not ( = ?auto_13658 ?auto_13661 ) ) ( not ( = ?auto_13663 ?auto_13672 ) ) ( not ( = ?auto_13663 ?auto_13669 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) ( not ( = ?auto_13647 ?auto_13662 ) ) ( not ( = ?auto_13648 ?auto_13651 ) ) ( not ( = ?auto_13648 ?auto_13662 ) ) ( not ( = ?auto_13649 ?auto_13651 ) ) ( not ( = ?auto_13649 ?auto_13662 ) ) ( not ( = ?auto_13651 ?auto_13663 ) ) ( not ( = ?auto_13651 ?auto_13672 ) ) ( not ( = ?auto_13651 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13656 ) ) ( not ( = ?auto_13668 ?auto_13665 ) ) ( not ( = ?auto_13668 ?auto_13671 ) ) ( not ( = ?auto_13675 ?auto_13658 ) ) ( not ( = ?auto_13675 ?auto_13670 ) ) ( not ( = ?auto_13675 ?auto_13661 ) ) ( not ( = ?auto_13662 ?auto_13663 ) ) ( not ( = ?auto_13662 ?auto_13672 ) ) ( not ( = ?auto_13662 ?auto_13669 ) ) ( not ( = ?auto_13647 ?auto_13652 ) ) ( not ( = ?auto_13647 ?auto_13666 ) ) ( not ( = ?auto_13648 ?auto_13652 ) ) ( not ( = ?auto_13648 ?auto_13666 ) ) ( not ( = ?auto_13649 ?auto_13652 ) ) ( not ( = ?auto_13649 ?auto_13666 ) ) ( not ( = ?auto_13650 ?auto_13652 ) ) ( not ( = ?auto_13650 ?auto_13666 ) ) ( not ( = ?auto_13652 ?auto_13662 ) ) ( not ( = ?auto_13652 ?auto_13663 ) ) ( not ( = ?auto_13652 ?auto_13672 ) ) ( not ( = ?auto_13652 ?auto_13669 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13656 ) ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13671 ) ) ( not ( = ?auto_13676 ?auto_13675 ) ) ( not ( = ?auto_13676 ?auto_13658 ) ) ( not ( = ?auto_13676 ?auto_13670 ) ) ( not ( = ?auto_13676 ?auto_13661 ) ) ( not ( = ?auto_13666 ?auto_13662 ) ) ( not ( = ?auto_13666 ?auto_13663 ) ) ( not ( = ?auto_13666 ?auto_13672 ) ) ( not ( = ?auto_13666 ?auto_13669 ) ) ( not ( = ?auto_13647 ?auto_13653 ) ) ( not ( = ?auto_13647 ?auto_13674 ) ) ( not ( = ?auto_13648 ?auto_13653 ) ) ( not ( = ?auto_13648 ?auto_13674 ) ) ( not ( = ?auto_13649 ?auto_13653 ) ) ( not ( = ?auto_13649 ?auto_13674 ) ) ( not ( = ?auto_13650 ?auto_13653 ) ) ( not ( = ?auto_13650 ?auto_13674 ) ) ( not ( = ?auto_13651 ?auto_13653 ) ) ( not ( = ?auto_13651 ?auto_13674 ) ) ( not ( = ?auto_13653 ?auto_13666 ) ) ( not ( = ?auto_13653 ?auto_13662 ) ) ( not ( = ?auto_13653 ?auto_13663 ) ) ( not ( = ?auto_13653 ?auto_13672 ) ) ( not ( = ?auto_13653 ?auto_13669 ) ) ( not ( = ?auto_13667 ?auto_13664 ) ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13656 ) ) ( not ( = ?auto_13667 ?auto_13665 ) ) ( not ( = ?auto_13667 ?auto_13671 ) ) ( not ( = ?auto_13673 ?auto_13676 ) ) ( not ( = ?auto_13673 ?auto_13675 ) ) ( not ( = ?auto_13673 ?auto_13658 ) ) ( not ( = ?auto_13673 ?auto_13670 ) ) ( not ( = ?auto_13673 ?auto_13661 ) ) ( not ( = ?auto_13674 ?auto_13666 ) ) ( not ( = ?auto_13674 ?auto_13662 ) ) ( not ( = ?auto_13674 ?auto_13663 ) ) ( not ( = ?auto_13674 ?auto_13672 ) ) ( not ( = ?auto_13674 ?auto_13669 ) ) ( not ( = ?auto_13647 ?auto_13654 ) ) ( not ( = ?auto_13647 ?auto_13655 ) ) ( not ( = ?auto_13648 ?auto_13654 ) ) ( not ( = ?auto_13648 ?auto_13655 ) ) ( not ( = ?auto_13649 ?auto_13654 ) ) ( not ( = ?auto_13649 ?auto_13655 ) ) ( not ( = ?auto_13650 ?auto_13654 ) ) ( not ( = ?auto_13650 ?auto_13655 ) ) ( not ( = ?auto_13651 ?auto_13654 ) ) ( not ( = ?auto_13651 ?auto_13655 ) ) ( not ( = ?auto_13652 ?auto_13654 ) ) ( not ( = ?auto_13652 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13674 ) ) ( not ( = ?auto_13654 ?auto_13666 ) ) ( not ( = ?auto_13654 ?auto_13662 ) ) ( not ( = ?auto_13654 ?auto_13663 ) ) ( not ( = ?auto_13654 ?auto_13672 ) ) ( not ( = ?auto_13654 ?auto_13669 ) ) ( not ( = ?auto_13655 ?auto_13674 ) ) ( not ( = ?auto_13655 ?auto_13666 ) ) ( not ( = ?auto_13655 ?auto_13662 ) ) ( not ( = ?auto_13655 ?auto_13663 ) ) ( not ( = ?auto_13655 ?auto_13672 ) ) ( not ( = ?auto_13655 ?auto_13669 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13653 )
      ( MAKE-1CRATE ?auto_13653 ?auto_13654 )
      ( MAKE-7CRATE-VERIFY ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13653 ?auto_13654 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13696 - SURFACE
      ?auto_13697 - SURFACE
      ?auto_13698 - SURFACE
      ?auto_13699 - SURFACE
      ?auto_13700 - SURFACE
      ?auto_13701 - SURFACE
      ?auto_13702 - SURFACE
      ?auto_13703 - SURFACE
      ?auto_13704 - SURFACE
    )
    :vars
    (
      ?auto_13706 - HOIST
      ?auto_13705 - PLACE
      ?auto_13707 - PLACE
      ?auto_13709 - HOIST
      ?auto_13710 - SURFACE
      ?auto_13729 - PLACE
      ?auto_13717 - HOIST
      ?auto_13715 - SURFACE
      ?auto_13716 - PLACE
      ?auto_13723 - HOIST
      ?auto_13714 - SURFACE
      ?auto_13724 - PLACE
      ?auto_13718 - HOIST
      ?auto_13712 - SURFACE
      ?auto_13713 - PLACE
      ?auto_13727 - HOIST
      ?auto_13725 - SURFACE
      ?auto_13726 - SURFACE
      ?auto_13711 - PLACE
      ?auto_13721 - HOIST
      ?auto_13722 - SURFACE
      ?auto_13720 - PLACE
      ?auto_13728 - HOIST
      ?auto_13719 - SURFACE
      ?auto_13708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13706 ?auto_13705 ) ( IS-CRATE ?auto_13704 ) ( not ( = ?auto_13707 ?auto_13705 ) ) ( HOIST-AT ?auto_13709 ?auto_13707 ) ( AVAILABLE ?auto_13709 ) ( SURFACE-AT ?auto_13704 ?auto_13707 ) ( ON ?auto_13704 ?auto_13710 ) ( CLEAR ?auto_13704 ) ( not ( = ?auto_13703 ?auto_13704 ) ) ( not ( = ?auto_13703 ?auto_13710 ) ) ( not ( = ?auto_13704 ?auto_13710 ) ) ( not ( = ?auto_13706 ?auto_13709 ) ) ( IS-CRATE ?auto_13703 ) ( not ( = ?auto_13729 ?auto_13705 ) ) ( HOIST-AT ?auto_13717 ?auto_13729 ) ( SURFACE-AT ?auto_13703 ?auto_13729 ) ( ON ?auto_13703 ?auto_13715 ) ( CLEAR ?auto_13703 ) ( not ( = ?auto_13702 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13715 ) ) ( not ( = ?auto_13703 ?auto_13715 ) ) ( not ( = ?auto_13706 ?auto_13717 ) ) ( IS-CRATE ?auto_13702 ) ( not ( = ?auto_13716 ?auto_13705 ) ) ( HOIST-AT ?auto_13723 ?auto_13716 ) ( AVAILABLE ?auto_13723 ) ( SURFACE-AT ?auto_13702 ?auto_13716 ) ( ON ?auto_13702 ?auto_13714 ) ( CLEAR ?auto_13702 ) ( not ( = ?auto_13701 ?auto_13702 ) ) ( not ( = ?auto_13701 ?auto_13714 ) ) ( not ( = ?auto_13702 ?auto_13714 ) ) ( not ( = ?auto_13706 ?auto_13723 ) ) ( IS-CRATE ?auto_13701 ) ( not ( = ?auto_13724 ?auto_13705 ) ) ( HOIST-AT ?auto_13718 ?auto_13724 ) ( AVAILABLE ?auto_13718 ) ( SURFACE-AT ?auto_13701 ?auto_13724 ) ( ON ?auto_13701 ?auto_13712 ) ( CLEAR ?auto_13701 ) ( not ( = ?auto_13700 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13712 ) ) ( not ( = ?auto_13701 ?auto_13712 ) ) ( not ( = ?auto_13706 ?auto_13718 ) ) ( IS-CRATE ?auto_13700 ) ( not ( = ?auto_13713 ?auto_13705 ) ) ( HOIST-AT ?auto_13727 ?auto_13713 ) ( AVAILABLE ?auto_13727 ) ( SURFACE-AT ?auto_13700 ?auto_13713 ) ( ON ?auto_13700 ?auto_13725 ) ( CLEAR ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( not ( = ?auto_13699 ?auto_13725 ) ) ( not ( = ?auto_13700 ?auto_13725 ) ) ( not ( = ?auto_13706 ?auto_13727 ) ) ( IS-CRATE ?auto_13699 ) ( AVAILABLE ?auto_13717 ) ( SURFACE-AT ?auto_13699 ?auto_13729 ) ( ON ?auto_13699 ?auto_13726 ) ( CLEAR ?auto_13699 ) ( not ( = ?auto_13698 ?auto_13699 ) ) ( not ( = ?auto_13698 ?auto_13726 ) ) ( not ( = ?auto_13699 ?auto_13726 ) ) ( IS-CRATE ?auto_13698 ) ( not ( = ?auto_13711 ?auto_13705 ) ) ( HOIST-AT ?auto_13721 ?auto_13711 ) ( AVAILABLE ?auto_13721 ) ( SURFACE-AT ?auto_13698 ?auto_13711 ) ( ON ?auto_13698 ?auto_13722 ) ( CLEAR ?auto_13698 ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13722 ) ) ( not ( = ?auto_13698 ?auto_13722 ) ) ( not ( = ?auto_13706 ?auto_13721 ) ) ( SURFACE-AT ?auto_13696 ?auto_13705 ) ( CLEAR ?auto_13696 ) ( IS-CRATE ?auto_13697 ) ( AVAILABLE ?auto_13706 ) ( not ( = ?auto_13720 ?auto_13705 ) ) ( HOIST-AT ?auto_13728 ?auto_13720 ) ( AVAILABLE ?auto_13728 ) ( SURFACE-AT ?auto_13697 ?auto_13720 ) ( ON ?auto_13697 ?auto_13719 ) ( CLEAR ?auto_13697 ) ( TRUCK-AT ?auto_13708 ?auto_13705 ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( not ( = ?auto_13696 ?auto_13719 ) ) ( not ( = ?auto_13697 ?auto_13719 ) ) ( not ( = ?auto_13706 ?auto_13728 ) ) ( not ( = ?auto_13696 ?auto_13698 ) ) ( not ( = ?auto_13696 ?auto_13722 ) ) ( not ( = ?auto_13698 ?auto_13719 ) ) ( not ( = ?auto_13711 ?auto_13720 ) ) ( not ( = ?auto_13721 ?auto_13728 ) ) ( not ( = ?auto_13722 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13699 ) ) ( not ( = ?auto_13696 ?auto_13726 ) ) ( not ( = ?auto_13697 ?auto_13699 ) ) ( not ( = ?auto_13697 ?auto_13726 ) ) ( not ( = ?auto_13699 ?auto_13722 ) ) ( not ( = ?auto_13699 ?auto_13719 ) ) ( not ( = ?auto_13729 ?auto_13711 ) ) ( not ( = ?auto_13729 ?auto_13720 ) ) ( not ( = ?auto_13717 ?auto_13721 ) ) ( not ( = ?auto_13717 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13722 ) ) ( not ( = ?auto_13726 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13696 ?auto_13725 ) ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( not ( = ?auto_13697 ?auto_13725 ) ) ( not ( = ?auto_13698 ?auto_13700 ) ) ( not ( = ?auto_13698 ?auto_13725 ) ) ( not ( = ?auto_13700 ?auto_13726 ) ) ( not ( = ?auto_13700 ?auto_13722 ) ) ( not ( = ?auto_13700 ?auto_13719 ) ) ( not ( = ?auto_13713 ?auto_13729 ) ) ( not ( = ?auto_13713 ?auto_13711 ) ) ( not ( = ?auto_13713 ?auto_13720 ) ) ( not ( = ?auto_13727 ?auto_13717 ) ) ( not ( = ?auto_13727 ?auto_13721 ) ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13722 ) ) ( not ( = ?auto_13725 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13701 ) ) ( not ( = ?auto_13696 ?auto_13712 ) ) ( not ( = ?auto_13697 ?auto_13701 ) ) ( not ( = ?auto_13697 ?auto_13712 ) ) ( not ( = ?auto_13698 ?auto_13701 ) ) ( not ( = ?auto_13698 ?auto_13712 ) ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( not ( = ?auto_13699 ?auto_13712 ) ) ( not ( = ?auto_13701 ?auto_13725 ) ) ( not ( = ?auto_13701 ?auto_13726 ) ) ( not ( = ?auto_13701 ?auto_13722 ) ) ( not ( = ?auto_13701 ?auto_13719 ) ) ( not ( = ?auto_13724 ?auto_13713 ) ) ( not ( = ?auto_13724 ?auto_13729 ) ) ( not ( = ?auto_13724 ?auto_13711 ) ) ( not ( = ?auto_13724 ?auto_13720 ) ) ( not ( = ?auto_13718 ?auto_13727 ) ) ( not ( = ?auto_13718 ?auto_13717 ) ) ( not ( = ?auto_13718 ?auto_13721 ) ) ( not ( = ?auto_13718 ?auto_13728 ) ) ( not ( = ?auto_13712 ?auto_13725 ) ) ( not ( = ?auto_13712 ?auto_13726 ) ) ( not ( = ?auto_13712 ?auto_13722 ) ) ( not ( = ?auto_13712 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13702 ) ) ( not ( = ?auto_13696 ?auto_13714 ) ) ( not ( = ?auto_13697 ?auto_13702 ) ) ( not ( = ?auto_13697 ?auto_13714 ) ) ( not ( = ?auto_13698 ?auto_13702 ) ) ( not ( = ?auto_13698 ?auto_13714 ) ) ( not ( = ?auto_13699 ?auto_13702 ) ) ( not ( = ?auto_13699 ?auto_13714 ) ) ( not ( = ?auto_13700 ?auto_13702 ) ) ( not ( = ?auto_13700 ?auto_13714 ) ) ( not ( = ?auto_13702 ?auto_13712 ) ) ( not ( = ?auto_13702 ?auto_13725 ) ) ( not ( = ?auto_13702 ?auto_13726 ) ) ( not ( = ?auto_13702 ?auto_13722 ) ) ( not ( = ?auto_13702 ?auto_13719 ) ) ( not ( = ?auto_13716 ?auto_13724 ) ) ( not ( = ?auto_13716 ?auto_13713 ) ) ( not ( = ?auto_13716 ?auto_13729 ) ) ( not ( = ?auto_13716 ?auto_13711 ) ) ( not ( = ?auto_13716 ?auto_13720 ) ) ( not ( = ?auto_13723 ?auto_13718 ) ) ( not ( = ?auto_13723 ?auto_13727 ) ) ( not ( = ?auto_13723 ?auto_13717 ) ) ( not ( = ?auto_13723 ?auto_13721 ) ) ( not ( = ?auto_13723 ?auto_13728 ) ) ( not ( = ?auto_13714 ?auto_13712 ) ) ( not ( = ?auto_13714 ?auto_13725 ) ) ( not ( = ?auto_13714 ?auto_13726 ) ) ( not ( = ?auto_13714 ?auto_13722 ) ) ( not ( = ?auto_13714 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13703 ) ) ( not ( = ?auto_13696 ?auto_13715 ) ) ( not ( = ?auto_13697 ?auto_13703 ) ) ( not ( = ?auto_13697 ?auto_13715 ) ) ( not ( = ?auto_13698 ?auto_13703 ) ) ( not ( = ?auto_13698 ?auto_13715 ) ) ( not ( = ?auto_13699 ?auto_13703 ) ) ( not ( = ?auto_13699 ?auto_13715 ) ) ( not ( = ?auto_13700 ?auto_13703 ) ) ( not ( = ?auto_13700 ?auto_13715 ) ) ( not ( = ?auto_13701 ?auto_13703 ) ) ( not ( = ?auto_13701 ?auto_13715 ) ) ( not ( = ?auto_13703 ?auto_13714 ) ) ( not ( = ?auto_13703 ?auto_13712 ) ) ( not ( = ?auto_13703 ?auto_13725 ) ) ( not ( = ?auto_13703 ?auto_13726 ) ) ( not ( = ?auto_13703 ?auto_13722 ) ) ( not ( = ?auto_13703 ?auto_13719 ) ) ( not ( = ?auto_13715 ?auto_13714 ) ) ( not ( = ?auto_13715 ?auto_13712 ) ) ( not ( = ?auto_13715 ?auto_13725 ) ) ( not ( = ?auto_13715 ?auto_13726 ) ) ( not ( = ?auto_13715 ?auto_13722 ) ) ( not ( = ?auto_13715 ?auto_13719 ) ) ( not ( = ?auto_13696 ?auto_13704 ) ) ( not ( = ?auto_13696 ?auto_13710 ) ) ( not ( = ?auto_13697 ?auto_13704 ) ) ( not ( = ?auto_13697 ?auto_13710 ) ) ( not ( = ?auto_13698 ?auto_13704 ) ) ( not ( = ?auto_13698 ?auto_13710 ) ) ( not ( = ?auto_13699 ?auto_13704 ) ) ( not ( = ?auto_13699 ?auto_13710 ) ) ( not ( = ?auto_13700 ?auto_13704 ) ) ( not ( = ?auto_13700 ?auto_13710 ) ) ( not ( = ?auto_13701 ?auto_13704 ) ) ( not ( = ?auto_13701 ?auto_13710 ) ) ( not ( = ?auto_13702 ?auto_13704 ) ) ( not ( = ?auto_13702 ?auto_13710 ) ) ( not ( = ?auto_13704 ?auto_13715 ) ) ( not ( = ?auto_13704 ?auto_13714 ) ) ( not ( = ?auto_13704 ?auto_13712 ) ) ( not ( = ?auto_13704 ?auto_13725 ) ) ( not ( = ?auto_13704 ?auto_13726 ) ) ( not ( = ?auto_13704 ?auto_13722 ) ) ( not ( = ?auto_13704 ?auto_13719 ) ) ( not ( = ?auto_13707 ?auto_13729 ) ) ( not ( = ?auto_13707 ?auto_13716 ) ) ( not ( = ?auto_13707 ?auto_13724 ) ) ( not ( = ?auto_13707 ?auto_13713 ) ) ( not ( = ?auto_13707 ?auto_13711 ) ) ( not ( = ?auto_13707 ?auto_13720 ) ) ( not ( = ?auto_13709 ?auto_13717 ) ) ( not ( = ?auto_13709 ?auto_13723 ) ) ( not ( = ?auto_13709 ?auto_13718 ) ) ( not ( = ?auto_13709 ?auto_13727 ) ) ( not ( = ?auto_13709 ?auto_13721 ) ) ( not ( = ?auto_13709 ?auto_13728 ) ) ( not ( = ?auto_13710 ?auto_13715 ) ) ( not ( = ?auto_13710 ?auto_13714 ) ) ( not ( = ?auto_13710 ?auto_13712 ) ) ( not ( = ?auto_13710 ?auto_13725 ) ) ( not ( = ?auto_13710 ?auto_13726 ) ) ( not ( = ?auto_13710 ?auto_13722 ) ) ( not ( = ?auto_13710 ?auto_13719 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13699 ?auto_13700 ?auto_13701 ?auto_13702 ?auto_13703 )
      ( MAKE-1CRATE ?auto_13703 ?auto_13704 )
      ( MAKE-8CRATE-VERIFY ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13699 ?auto_13700 ?auto_13701 ?auto_13702 ?auto_13703 ?auto_13704 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13750 - SURFACE
      ?auto_13751 - SURFACE
      ?auto_13752 - SURFACE
      ?auto_13753 - SURFACE
      ?auto_13754 - SURFACE
      ?auto_13755 - SURFACE
      ?auto_13756 - SURFACE
      ?auto_13757 - SURFACE
      ?auto_13758 - SURFACE
      ?auto_13759 - SURFACE
    )
    :vars
    (
      ?auto_13761 - HOIST
      ?auto_13760 - PLACE
      ?auto_13762 - PLACE
      ?auto_13764 - HOIST
      ?auto_13763 - SURFACE
      ?auto_13776 - SURFACE
      ?auto_13782 - PLACE
      ?auto_13772 - HOIST
      ?auto_13778 - SURFACE
      ?auto_13777 - PLACE
      ?auto_13767 - HOIST
      ?auto_13766 - SURFACE
      ?auto_13770 - PLACE
      ?auto_13771 - HOIST
      ?auto_13768 - SURFACE
      ?auto_13769 - PLACE
      ?auto_13781 - HOIST
      ?auto_13779 - SURFACE
      ?auto_13783 - SURFACE
      ?auto_13780 - PLACE
      ?auto_13784 - HOIST
      ?auto_13775 - SURFACE
      ?auto_13774 - PLACE
      ?auto_13773 - HOIST
      ?auto_13785 - SURFACE
      ?auto_13765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13761 ?auto_13760 ) ( IS-CRATE ?auto_13759 ) ( not ( = ?auto_13762 ?auto_13760 ) ) ( HOIST-AT ?auto_13764 ?auto_13762 ) ( SURFACE-AT ?auto_13759 ?auto_13762 ) ( ON ?auto_13759 ?auto_13763 ) ( CLEAR ?auto_13759 ) ( not ( = ?auto_13758 ?auto_13759 ) ) ( not ( = ?auto_13758 ?auto_13763 ) ) ( not ( = ?auto_13759 ?auto_13763 ) ) ( not ( = ?auto_13761 ?auto_13764 ) ) ( IS-CRATE ?auto_13758 ) ( AVAILABLE ?auto_13764 ) ( SURFACE-AT ?auto_13758 ?auto_13762 ) ( ON ?auto_13758 ?auto_13776 ) ( CLEAR ?auto_13758 ) ( not ( = ?auto_13757 ?auto_13758 ) ) ( not ( = ?auto_13757 ?auto_13776 ) ) ( not ( = ?auto_13758 ?auto_13776 ) ) ( IS-CRATE ?auto_13757 ) ( not ( = ?auto_13782 ?auto_13760 ) ) ( HOIST-AT ?auto_13772 ?auto_13782 ) ( SURFACE-AT ?auto_13757 ?auto_13782 ) ( ON ?auto_13757 ?auto_13778 ) ( CLEAR ?auto_13757 ) ( not ( = ?auto_13756 ?auto_13757 ) ) ( not ( = ?auto_13756 ?auto_13778 ) ) ( not ( = ?auto_13757 ?auto_13778 ) ) ( not ( = ?auto_13761 ?auto_13772 ) ) ( IS-CRATE ?auto_13756 ) ( not ( = ?auto_13777 ?auto_13760 ) ) ( HOIST-AT ?auto_13767 ?auto_13777 ) ( AVAILABLE ?auto_13767 ) ( SURFACE-AT ?auto_13756 ?auto_13777 ) ( ON ?auto_13756 ?auto_13766 ) ( CLEAR ?auto_13756 ) ( not ( = ?auto_13755 ?auto_13756 ) ) ( not ( = ?auto_13755 ?auto_13766 ) ) ( not ( = ?auto_13756 ?auto_13766 ) ) ( not ( = ?auto_13761 ?auto_13767 ) ) ( IS-CRATE ?auto_13755 ) ( not ( = ?auto_13770 ?auto_13760 ) ) ( HOIST-AT ?auto_13771 ?auto_13770 ) ( AVAILABLE ?auto_13771 ) ( SURFACE-AT ?auto_13755 ?auto_13770 ) ( ON ?auto_13755 ?auto_13768 ) ( CLEAR ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13754 ?auto_13768 ) ) ( not ( = ?auto_13755 ?auto_13768 ) ) ( not ( = ?auto_13761 ?auto_13771 ) ) ( IS-CRATE ?auto_13754 ) ( not ( = ?auto_13769 ?auto_13760 ) ) ( HOIST-AT ?auto_13781 ?auto_13769 ) ( AVAILABLE ?auto_13781 ) ( SURFACE-AT ?auto_13754 ?auto_13769 ) ( ON ?auto_13754 ?auto_13779 ) ( CLEAR ?auto_13754 ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13779 ) ) ( not ( = ?auto_13754 ?auto_13779 ) ) ( not ( = ?auto_13761 ?auto_13781 ) ) ( IS-CRATE ?auto_13753 ) ( AVAILABLE ?auto_13772 ) ( SURFACE-AT ?auto_13753 ?auto_13782 ) ( ON ?auto_13753 ?auto_13783 ) ( CLEAR ?auto_13753 ) ( not ( = ?auto_13752 ?auto_13753 ) ) ( not ( = ?auto_13752 ?auto_13783 ) ) ( not ( = ?auto_13753 ?auto_13783 ) ) ( IS-CRATE ?auto_13752 ) ( not ( = ?auto_13780 ?auto_13760 ) ) ( HOIST-AT ?auto_13784 ?auto_13780 ) ( AVAILABLE ?auto_13784 ) ( SURFACE-AT ?auto_13752 ?auto_13780 ) ( ON ?auto_13752 ?auto_13775 ) ( CLEAR ?auto_13752 ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( not ( = ?auto_13751 ?auto_13775 ) ) ( not ( = ?auto_13752 ?auto_13775 ) ) ( not ( = ?auto_13761 ?auto_13784 ) ) ( SURFACE-AT ?auto_13750 ?auto_13760 ) ( CLEAR ?auto_13750 ) ( IS-CRATE ?auto_13751 ) ( AVAILABLE ?auto_13761 ) ( not ( = ?auto_13774 ?auto_13760 ) ) ( HOIST-AT ?auto_13773 ?auto_13774 ) ( AVAILABLE ?auto_13773 ) ( SURFACE-AT ?auto_13751 ?auto_13774 ) ( ON ?auto_13751 ?auto_13785 ) ( CLEAR ?auto_13751 ) ( TRUCK-AT ?auto_13765 ?auto_13760 ) ( not ( = ?auto_13750 ?auto_13751 ) ) ( not ( = ?auto_13750 ?auto_13785 ) ) ( not ( = ?auto_13751 ?auto_13785 ) ) ( not ( = ?auto_13761 ?auto_13773 ) ) ( not ( = ?auto_13750 ?auto_13752 ) ) ( not ( = ?auto_13750 ?auto_13775 ) ) ( not ( = ?auto_13752 ?auto_13785 ) ) ( not ( = ?auto_13780 ?auto_13774 ) ) ( not ( = ?auto_13784 ?auto_13773 ) ) ( not ( = ?auto_13775 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13753 ) ) ( not ( = ?auto_13750 ?auto_13783 ) ) ( not ( = ?auto_13751 ?auto_13753 ) ) ( not ( = ?auto_13751 ?auto_13783 ) ) ( not ( = ?auto_13753 ?auto_13775 ) ) ( not ( = ?auto_13753 ?auto_13785 ) ) ( not ( = ?auto_13782 ?auto_13780 ) ) ( not ( = ?auto_13782 ?auto_13774 ) ) ( not ( = ?auto_13772 ?auto_13784 ) ) ( not ( = ?auto_13772 ?auto_13773 ) ) ( not ( = ?auto_13783 ?auto_13775 ) ) ( not ( = ?auto_13783 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13754 ) ) ( not ( = ?auto_13750 ?auto_13779 ) ) ( not ( = ?auto_13751 ?auto_13754 ) ) ( not ( = ?auto_13751 ?auto_13779 ) ) ( not ( = ?auto_13752 ?auto_13754 ) ) ( not ( = ?auto_13752 ?auto_13779 ) ) ( not ( = ?auto_13754 ?auto_13783 ) ) ( not ( = ?auto_13754 ?auto_13775 ) ) ( not ( = ?auto_13754 ?auto_13785 ) ) ( not ( = ?auto_13769 ?auto_13782 ) ) ( not ( = ?auto_13769 ?auto_13780 ) ) ( not ( = ?auto_13769 ?auto_13774 ) ) ( not ( = ?auto_13781 ?auto_13772 ) ) ( not ( = ?auto_13781 ?auto_13784 ) ) ( not ( = ?auto_13781 ?auto_13773 ) ) ( not ( = ?auto_13779 ?auto_13783 ) ) ( not ( = ?auto_13779 ?auto_13775 ) ) ( not ( = ?auto_13779 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13755 ) ) ( not ( = ?auto_13750 ?auto_13768 ) ) ( not ( = ?auto_13751 ?auto_13755 ) ) ( not ( = ?auto_13751 ?auto_13768 ) ) ( not ( = ?auto_13752 ?auto_13755 ) ) ( not ( = ?auto_13752 ?auto_13768 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13768 ) ) ( not ( = ?auto_13755 ?auto_13779 ) ) ( not ( = ?auto_13755 ?auto_13783 ) ) ( not ( = ?auto_13755 ?auto_13775 ) ) ( not ( = ?auto_13755 ?auto_13785 ) ) ( not ( = ?auto_13770 ?auto_13769 ) ) ( not ( = ?auto_13770 ?auto_13782 ) ) ( not ( = ?auto_13770 ?auto_13780 ) ) ( not ( = ?auto_13770 ?auto_13774 ) ) ( not ( = ?auto_13771 ?auto_13781 ) ) ( not ( = ?auto_13771 ?auto_13772 ) ) ( not ( = ?auto_13771 ?auto_13784 ) ) ( not ( = ?auto_13771 ?auto_13773 ) ) ( not ( = ?auto_13768 ?auto_13779 ) ) ( not ( = ?auto_13768 ?auto_13783 ) ) ( not ( = ?auto_13768 ?auto_13775 ) ) ( not ( = ?auto_13768 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13756 ) ) ( not ( = ?auto_13750 ?auto_13766 ) ) ( not ( = ?auto_13751 ?auto_13756 ) ) ( not ( = ?auto_13751 ?auto_13766 ) ) ( not ( = ?auto_13752 ?auto_13756 ) ) ( not ( = ?auto_13752 ?auto_13766 ) ) ( not ( = ?auto_13753 ?auto_13756 ) ) ( not ( = ?auto_13753 ?auto_13766 ) ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13754 ?auto_13766 ) ) ( not ( = ?auto_13756 ?auto_13768 ) ) ( not ( = ?auto_13756 ?auto_13779 ) ) ( not ( = ?auto_13756 ?auto_13783 ) ) ( not ( = ?auto_13756 ?auto_13775 ) ) ( not ( = ?auto_13756 ?auto_13785 ) ) ( not ( = ?auto_13777 ?auto_13770 ) ) ( not ( = ?auto_13777 ?auto_13769 ) ) ( not ( = ?auto_13777 ?auto_13782 ) ) ( not ( = ?auto_13777 ?auto_13780 ) ) ( not ( = ?auto_13777 ?auto_13774 ) ) ( not ( = ?auto_13767 ?auto_13771 ) ) ( not ( = ?auto_13767 ?auto_13781 ) ) ( not ( = ?auto_13767 ?auto_13772 ) ) ( not ( = ?auto_13767 ?auto_13784 ) ) ( not ( = ?auto_13767 ?auto_13773 ) ) ( not ( = ?auto_13766 ?auto_13768 ) ) ( not ( = ?auto_13766 ?auto_13779 ) ) ( not ( = ?auto_13766 ?auto_13783 ) ) ( not ( = ?auto_13766 ?auto_13775 ) ) ( not ( = ?auto_13766 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13757 ) ) ( not ( = ?auto_13750 ?auto_13778 ) ) ( not ( = ?auto_13751 ?auto_13757 ) ) ( not ( = ?auto_13751 ?auto_13778 ) ) ( not ( = ?auto_13752 ?auto_13757 ) ) ( not ( = ?auto_13752 ?auto_13778 ) ) ( not ( = ?auto_13753 ?auto_13757 ) ) ( not ( = ?auto_13753 ?auto_13778 ) ) ( not ( = ?auto_13754 ?auto_13757 ) ) ( not ( = ?auto_13754 ?auto_13778 ) ) ( not ( = ?auto_13755 ?auto_13757 ) ) ( not ( = ?auto_13755 ?auto_13778 ) ) ( not ( = ?auto_13757 ?auto_13766 ) ) ( not ( = ?auto_13757 ?auto_13768 ) ) ( not ( = ?auto_13757 ?auto_13779 ) ) ( not ( = ?auto_13757 ?auto_13783 ) ) ( not ( = ?auto_13757 ?auto_13775 ) ) ( not ( = ?auto_13757 ?auto_13785 ) ) ( not ( = ?auto_13778 ?auto_13766 ) ) ( not ( = ?auto_13778 ?auto_13768 ) ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( not ( = ?auto_13778 ?auto_13783 ) ) ( not ( = ?auto_13778 ?auto_13775 ) ) ( not ( = ?auto_13778 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13758 ) ) ( not ( = ?auto_13750 ?auto_13776 ) ) ( not ( = ?auto_13751 ?auto_13758 ) ) ( not ( = ?auto_13751 ?auto_13776 ) ) ( not ( = ?auto_13752 ?auto_13758 ) ) ( not ( = ?auto_13752 ?auto_13776 ) ) ( not ( = ?auto_13753 ?auto_13758 ) ) ( not ( = ?auto_13753 ?auto_13776 ) ) ( not ( = ?auto_13754 ?auto_13758 ) ) ( not ( = ?auto_13754 ?auto_13776 ) ) ( not ( = ?auto_13755 ?auto_13758 ) ) ( not ( = ?auto_13755 ?auto_13776 ) ) ( not ( = ?auto_13756 ?auto_13758 ) ) ( not ( = ?auto_13756 ?auto_13776 ) ) ( not ( = ?auto_13758 ?auto_13778 ) ) ( not ( = ?auto_13758 ?auto_13766 ) ) ( not ( = ?auto_13758 ?auto_13768 ) ) ( not ( = ?auto_13758 ?auto_13779 ) ) ( not ( = ?auto_13758 ?auto_13783 ) ) ( not ( = ?auto_13758 ?auto_13775 ) ) ( not ( = ?auto_13758 ?auto_13785 ) ) ( not ( = ?auto_13762 ?auto_13782 ) ) ( not ( = ?auto_13762 ?auto_13777 ) ) ( not ( = ?auto_13762 ?auto_13770 ) ) ( not ( = ?auto_13762 ?auto_13769 ) ) ( not ( = ?auto_13762 ?auto_13780 ) ) ( not ( = ?auto_13762 ?auto_13774 ) ) ( not ( = ?auto_13764 ?auto_13772 ) ) ( not ( = ?auto_13764 ?auto_13767 ) ) ( not ( = ?auto_13764 ?auto_13771 ) ) ( not ( = ?auto_13764 ?auto_13781 ) ) ( not ( = ?auto_13764 ?auto_13784 ) ) ( not ( = ?auto_13764 ?auto_13773 ) ) ( not ( = ?auto_13776 ?auto_13778 ) ) ( not ( = ?auto_13776 ?auto_13766 ) ) ( not ( = ?auto_13776 ?auto_13768 ) ) ( not ( = ?auto_13776 ?auto_13779 ) ) ( not ( = ?auto_13776 ?auto_13783 ) ) ( not ( = ?auto_13776 ?auto_13775 ) ) ( not ( = ?auto_13776 ?auto_13785 ) ) ( not ( = ?auto_13750 ?auto_13759 ) ) ( not ( = ?auto_13750 ?auto_13763 ) ) ( not ( = ?auto_13751 ?auto_13759 ) ) ( not ( = ?auto_13751 ?auto_13763 ) ) ( not ( = ?auto_13752 ?auto_13759 ) ) ( not ( = ?auto_13752 ?auto_13763 ) ) ( not ( = ?auto_13753 ?auto_13759 ) ) ( not ( = ?auto_13753 ?auto_13763 ) ) ( not ( = ?auto_13754 ?auto_13759 ) ) ( not ( = ?auto_13754 ?auto_13763 ) ) ( not ( = ?auto_13755 ?auto_13759 ) ) ( not ( = ?auto_13755 ?auto_13763 ) ) ( not ( = ?auto_13756 ?auto_13759 ) ) ( not ( = ?auto_13756 ?auto_13763 ) ) ( not ( = ?auto_13757 ?auto_13759 ) ) ( not ( = ?auto_13757 ?auto_13763 ) ) ( not ( = ?auto_13759 ?auto_13776 ) ) ( not ( = ?auto_13759 ?auto_13778 ) ) ( not ( = ?auto_13759 ?auto_13766 ) ) ( not ( = ?auto_13759 ?auto_13768 ) ) ( not ( = ?auto_13759 ?auto_13779 ) ) ( not ( = ?auto_13759 ?auto_13783 ) ) ( not ( = ?auto_13759 ?auto_13775 ) ) ( not ( = ?auto_13759 ?auto_13785 ) ) ( not ( = ?auto_13763 ?auto_13776 ) ) ( not ( = ?auto_13763 ?auto_13778 ) ) ( not ( = ?auto_13763 ?auto_13766 ) ) ( not ( = ?auto_13763 ?auto_13768 ) ) ( not ( = ?auto_13763 ?auto_13779 ) ) ( not ( = ?auto_13763 ?auto_13783 ) ) ( not ( = ?auto_13763 ?auto_13775 ) ) ( not ( = ?auto_13763 ?auto_13785 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13753 ?auto_13754 ?auto_13755 ?auto_13756 ?auto_13757 ?auto_13758 )
      ( MAKE-1CRATE ?auto_13758 ?auto_13759 )
      ( MAKE-9CRATE-VERIFY ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13753 ?auto_13754 ?auto_13755 ?auto_13756 ?auto_13757 ?auto_13758 ?auto_13759 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13807 - SURFACE
      ?auto_13808 - SURFACE
      ?auto_13809 - SURFACE
      ?auto_13810 - SURFACE
      ?auto_13811 - SURFACE
      ?auto_13812 - SURFACE
      ?auto_13813 - SURFACE
      ?auto_13814 - SURFACE
      ?auto_13815 - SURFACE
      ?auto_13816 - SURFACE
      ?auto_13817 - SURFACE
    )
    :vars
    (
      ?auto_13818 - HOIST
      ?auto_13822 - PLACE
      ?auto_13819 - PLACE
      ?auto_13821 - HOIST
      ?auto_13823 - SURFACE
      ?auto_13843 - PLACE
      ?auto_13829 - HOIST
      ?auto_13842 - SURFACE
      ?auto_13831 - SURFACE
      ?auto_13824 - PLACE
      ?auto_13839 - HOIST
      ?auto_13836 - SURFACE
      ?auto_13835 - PLACE
      ?auto_13825 - HOIST
      ?auto_13844 - SURFACE
      ?auto_13841 - PLACE
      ?auto_13840 - HOIST
      ?auto_13833 - SURFACE
      ?auto_13827 - PLACE
      ?auto_13845 - HOIST
      ?auto_13837 - SURFACE
      ?auto_13828 - SURFACE
      ?auto_13834 - PLACE
      ?auto_13830 - HOIST
      ?auto_13826 - SURFACE
      ?auto_13846 - PLACE
      ?auto_13838 - HOIST
      ?auto_13832 - SURFACE
      ?auto_13820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13818 ?auto_13822 ) ( IS-CRATE ?auto_13817 ) ( not ( = ?auto_13819 ?auto_13822 ) ) ( HOIST-AT ?auto_13821 ?auto_13819 ) ( AVAILABLE ?auto_13821 ) ( SURFACE-AT ?auto_13817 ?auto_13819 ) ( ON ?auto_13817 ?auto_13823 ) ( CLEAR ?auto_13817 ) ( not ( = ?auto_13816 ?auto_13817 ) ) ( not ( = ?auto_13816 ?auto_13823 ) ) ( not ( = ?auto_13817 ?auto_13823 ) ) ( not ( = ?auto_13818 ?auto_13821 ) ) ( IS-CRATE ?auto_13816 ) ( not ( = ?auto_13843 ?auto_13822 ) ) ( HOIST-AT ?auto_13829 ?auto_13843 ) ( SURFACE-AT ?auto_13816 ?auto_13843 ) ( ON ?auto_13816 ?auto_13842 ) ( CLEAR ?auto_13816 ) ( not ( = ?auto_13815 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13842 ) ) ( not ( = ?auto_13816 ?auto_13842 ) ) ( not ( = ?auto_13818 ?auto_13829 ) ) ( IS-CRATE ?auto_13815 ) ( AVAILABLE ?auto_13829 ) ( SURFACE-AT ?auto_13815 ?auto_13843 ) ( ON ?auto_13815 ?auto_13831 ) ( CLEAR ?auto_13815 ) ( not ( = ?auto_13814 ?auto_13815 ) ) ( not ( = ?auto_13814 ?auto_13831 ) ) ( not ( = ?auto_13815 ?auto_13831 ) ) ( IS-CRATE ?auto_13814 ) ( not ( = ?auto_13824 ?auto_13822 ) ) ( HOIST-AT ?auto_13839 ?auto_13824 ) ( SURFACE-AT ?auto_13814 ?auto_13824 ) ( ON ?auto_13814 ?auto_13836 ) ( CLEAR ?auto_13814 ) ( not ( = ?auto_13813 ?auto_13814 ) ) ( not ( = ?auto_13813 ?auto_13836 ) ) ( not ( = ?auto_13814 ?auto_13836 ) ) ( not ( = ?auto_13818 ?auto_13839 ) ) ( IS-CRATE ?auto_13813 ) ( not ( = ?auto_13835 ?auto_13822 ) ) ( HOIST-AT ?auto_13825 ?auto_13835 ) ( AVAILABLE ?auto_13825 ) ( SURFACE-AT ?auto_13813 ?auto_13835 ) ( ON ?auto_13813 ?auto_13844 ) ( CLEAR ?auto_13813 ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13812 ?auto_13844 ) ) ( not ( = ?auto_13813 ?auto_13844 ) ) ( not ( = ?auto_13818 ?auto_13825 ) ) ( IS-CRATE ?auto_13812 ) ( not ( = ?auto_13841 ?auto_13822 ) ) ( HOIST-AT ?auto_13840 ?auto_13841 ) ( AVAILABLE ?auto_13840 ) ( SURFACE-AT ?auto_13812 ?auto_13841 ) ( ON ?auto_13812 ?auto_13833 ) ( CLEAR ?auto_13812 ) ( not ( = ?auto_13811 ?auto_13812 ) ) ( not ( = ?auto_13811 ?auto_13833 ) ) ( not ( = ?auto_13812 ?auto_13833 ) ) ( not ( = ?auto_13818 ?auto_13840 ) ) ( IS-CRATE ?auto_13811 ) ( not ( = ?auto_13827 ?auto_13822 ) ) ( HOIST-AT ?auto_13845 ?auto_13827 ) ( AVAILABLE ?auto_13845 ) ( SURFACE-AT ?auto_13811 ?auto_13827 ) ( ON ?auto_13811 ?auto_13837 ) ( CLEAR ?auto_13811 ) ( not ( = ?auto_13810 ?auto_13811 ) ) ( not ( = ?auto_13810 ?auto_13837 ) ) ( not ( = ?auto_13811 ?auto_13837 ) ) ( not ( = ?auto_13818 ?auto_13845 ) ) ( IS-CRATE ?auto_13810 ) ( AVAILABLE ?auto_13839 ) ( SURFACE-AT ?auto_13810 ?auto_13824 ) ( ON ?auto_13810 ?auto_13828 ) ( CLEAR ?auto_13810 ) ( not ( = ?auto_13809 ?auto_13810 ) ) ( not ( = ?auto_13809 ?auto_13828 ) ) ( not ( = ?auto_13810 ?auto_13828 ) ) ( IS-CRATE ?auto_13809 ) ( not ( = ?auto_13834 ?auto_13822 ) ) ( HOIST-AT ?auto_13830 ?auto_13834 ) ( AVAILABLE ?auto_13830 ) ( SURFACE-AT ?auto_13809 ?auto_13834 ) ( ON ?auto_13809 ?auto_13826 ) ( CLEAR ?auto_13809 ) ( not ( = ?auto_13808 ?auto_13809 ) ) ( not ( = ?auto_13808 ?auto_13826 ) ) ( not ( = ?auto_13809 ?auto_13826 ) ) ( not ( = ?auto_13818 ?auto_13830 ) ) ( SURFACE-AT ?auto_13807 ?auto_13822 ) ( CLEAR ?auto_13807 ) ( IS-CRATE ?auto_13808 ) ( AVAILABLE ?auto_13818 ) ( not ( = ?auto_13846 ?auto_13822 ) ) ( HOIST-AT ?auto_13838 ?auto_13846 ) ( AVAILABLE ?auto_13838 ) ( SURFACE-AT ?auto_13808 ?auto_13846 ) ( ON ?auto_13808 ?auto_13832 ) ( CLEAR ?auto_13808 ) ( TRUCK-AT ?auto_13820 ?auto_13822 ) ( not ( = ?auto_13807 ?auto_13808 ) ) ( not ( = ?auto_13807 ?auto_13832 ) ) ( not ( = ?auto_13808 ?auto_13832 ) ) ( not ( = ?auto_13818 ?auto_13838 ) ) ( not ( = ?auto_13807 ?auto_13809 ) ) ( not ( = ?auto_13807 ?auto_13826 ) ) ( not ( = ?auto_13809 ?auto_13832 ) ) ( not ( = ?auto_13834 ?auto_13846 ) ) ( not ( = ?auto_13830 ?auto_13838 ) ) ( not ( = ?auto_13826 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13810 ) ) ( not ( = ?auto_13807 ?auto_13828 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) ( not ( = ?auto_13808 ?auto_13828 ) ) ( not ( = ?auto_13810 ?auto_13826 ) ) ( not ( = ?auto_13810 ?auto_13832 ) ) ( not ( = ?auto_13824 ?auto_13834 ) ) ( not ( = ?auto_13824 ?auto_13846 ) ) ( not ( = ?auto_13839 ?auto_13830 ) ) ( not ( = ?auto_13839 ?auto_13838 ) ) ( not ( = ?auto_13828 ?auto_13826 ) ) ( not ( = ?auto_13828 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13811 ) ) ( not ( = ?auto_13807 ?auto_13837 ) ) ( not ( = ?auto_13808 ?auto_13811 ) ) ( not ( = ?auto_13808 ?auto_13837 ) ) ( not ( = ?auto_13809 ?auto_13811 ) ) ( not ( = ?auto_13809 ?auto_13837 ) ) ( not ( = ?auto_13811 ?auto_13828 ) ) ( not ( = ?auto_13811 ?auto_13826 ) ) ( not ( = ?auto_13811 ?auto_13832 ) ) ( not ( = ?auto_13827 ?auto_13824 ) ) ( not ( = ?auto_13827 ?auto_13834 ) ) ( not ( = ?auto_13827 ?auto_13846 ) ) ( not ( = ?auto_13845 ?auto_13839 ) ) ( not ( = ?auto_13845 ?auto_13830 ) ) ( not ( = ?auto_13845 ?auto_13838 ) ) ( not ( = ?auto_13837 ?auto_13828 ) ) ( not ( = ?auto_13837 ?auto_13826 ) ) ( not ( = ?auto_13837 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13812 ) ) ( not ( = ?auto_13807 ?auto_13833 ) ) ( not ( = ?auto_13808 ?auto_13812 ) ) ( not ( = ?auto_13808 ?auto_13833 ) ) ( not ( = ?auto_13809 ?auto_13812 ) ) ( not ( = ?auto_13809 ?auto_13833 ) ) ( not ( = ?auto_13810 ?auto_13812 ) ) ( not ( = ?auto_13810 ?auto_13833 ) ) ( not ( = ?auto_13812 ?auto_13837 ) ) ( not ( = ?auto_13812 ?auto_13828 ) ) ( not ( = ?auto_13812 ?auto_13826 ) ) ( not ( = ?auto_13812 ?auto_13832 ) ) ( not ( = ?auto_13841 ?auto_13827 ) ) ( not ( = ?auto_13841 ?auto_13824 ) ) ( not ( = ?auto_13841 ?auto_13834 ) ) ( not ( = ?auto_13841 ?auto_13846 ) ) ( not ( = ?auto_13840 ?auto_13845 ) ) ( not ( = ?auto_13840 ?auto_13839 ) ) ( not ( = ?auto_13840 ?auto_13830 ) ) ( not ( = ?auto_13840 ?auto_13838 ) ) ( not ( = ?auto_13833 ?auto_13837 ) ) ( not ( = ?auto_13833 ?auto_13828 ) ) ( not ( = ?auto_13833 ?auto_13826 ) ) ( not ( = ?auto_13833 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13813 ) ) ( not ( = ?auto_13807 ?auto_13844 ) ) ( not ( = ?auto_13808 ?auto_13813 ) ) ( not ( = ?auto_13808 ?auto_13844 ) ) ( not ( = ?auto_13809 ?auto_13813 ) ) ( not ( = ?auto_13809 ?auto_13844 ) ) ( not ( = ?auto_13810 ?auto_13813 ) ) ( not ( = ?auto_13810 ?auto_13844 ) ) ( not ( = ?auto_13811 ?auto_13813 ) ) ( not ( = ?auto_13811 ?auto_13844 ) ) ( not ( = ?auto_13813 ?auto_13833 ) ) ( not ( = ?auto_13813 ?auto_13837 ) ) ( not ( = ?auto_13813 ?auto_13828 ) ) ( not ( = ?auto_13813 ?auto_13826 ) ) ( not ( = ?auto_13813 ?auto_13832 ) ) ( not ( = ?auto_13835 ?auto_13841 ) ) ( not ( = ?auto_13835 ?auto_13827 ) ) ( not ( = ?auto_13835 ?auto_13824 ) ) ( not ( = ?auto_13835 ?auto_13834 ) ) ( not ( = ?auto_13835 ?auto_13846 ) ) ( not ( = ?auto_13825 ?auto_13840 ) ) ( not ( = ?auto_13825 ?auto_13845 ) ) ( not ( = ?auto_13825 ?auto_13839 ) ) ( not ( = ?auto_13825 ?auto_13830 ) ) ( not ( = ?auto_13825 ?auto_13838 ) ) ( not ( = ?auto_13844 ?auto_13833 ) ) ( not ( = ?auto_13844 ?auto_13837 ) ) ( not ( = ?auto_13844 ?auto_13828 ) ) ( not ( = ?auto_13844 ?auto_13826 ) ) ( not ( = ?auto_13844 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13814 ) ) ( not ( = ?auto_13807 ?auto_13836 ) ) ( not ( = ?auto_13808 ?auto_13814 ) ) ( not ( = ?auto_13808 ?auto_13836 ) ) ( not ( = ?auto_13809 ?auto_13814 ) ) ( not ( = ?auto_13809 ?auto_13836 ) ) ( not ( = ?auto_13810 ?auto_13814 ) ) ( not ( = ?auto_13810 ?auto_13836 ) ) ( not ( = ?auto_13811 ?auto_13814 ) ) ( not ( = ?auto_13811 ?auto_13836 ) ) ( not ( = ?auto_13812 ?auto_13814 ) ) ( not ( = ?auto_13812 ?auto_13836 ) ) ( not ( = ?auto_13814 ?auto_13844 ) ) ( not ( = ?auto_13814 ?auto_13833 ) ) ( not ( = ?auto_13814 ?auto_13837 ) ) ( not ( = ?auto_13814 ?auto_13828 ) ) ( not ( = ?auto_13814 ?auto_13826 ) ) ( not ( = ?auto_13814 ?auto_13832 ) ) ( not ( = ?auto_13836 ?auto_13844 ) ) ( not ( = ?auto_13836 ?auto_13833 ) ) ( not ( = ?auto_13836 ?auto_13837 ) ) ( not ( = ?auto_13836 ?auto_13828 ) ) ( not ( = ?auto_13836 ?auto_13826 ) ) ( not ( = ?auto_13836 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13815 ) ) ( not ( = ?auto_13807 ?auto_13831 ) ) ( not ( = ?auto_13808 ?auto_13815 ) ) ( not ( = ?auto_13808 ?auto_13831 ) ) ( not ( = ?auto_13809 ?auto_13815 ) ) ( not ( = ?auto_13809 ?auto_13831 ) ) ( not ( = ?auto_13810 ?auto_13815 ) ) ( not ( = ?auto_13810 ?auto_13831 ) ) ( not ( = ?auto_13811 ?auto_13815 ) ) ( not ( = ?auto_13811 ?auto_13831 ) ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( not ( = ?auto_13812 ?auto_13831 ) ) ( not ( = ?auto_13813 ?auto_13815 ) ) ( not ( = ?auto_13813 ?auto_13831 ) ) ( not ( = ?auto_13815 ?auto_13836 ) ) ( not ( = ?auto_13815 ?auto_13844 ) ) ( not ( = ?auto_13815 ?auto_13833 ) ) ( not ( = ?auto_13815 ?auto_13837 ) ) ( not ( = ?auto_13815 ?auto_13828 ) ) ( not ( = ?auto_13815 ?auto_13826 ) ) ( not ( = ?auto_13815 ?auto_13832 ) ) ( not ( = ?auto_13843 ?auto_13824 ) ) ( not ( = ?auto_13843 ?auto_13835 ) ) ( not ( = ?auto_13843 ?auto_13841 ) ) ( not ( = ?auto_13843 ?auto_13827 ) ) ( not ( = ?auto_13843 ?auto_13834 ) ) ( not ( = ?auto_13843 ?auto_13846 ) ) ( not ( = ?auto_13829 ?auto_13839 ) ) ( not ( = ?auto_13829 ?auto_13825 ) ) ( not ( = ?auto_13829 ?auto_13840 ) ) ( not ( = ?auto_13829 ?auto_13845 ) ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13838 ) ) ( not ( = ?auto_13831 ?auto_13836 ) ) ( not ( = ?auto_13831 ?auto_13844 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13831 ?auto_13837 ) ) ( not ( = ?auto_13831 ?auto_13828 ) ) ( not ( = ?auto_13831 ?auto_13826 ) ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13816 ) ) ( not ( = ?auto_13807 ?auto_13842 ) ) ( not ( = ?auto_13808 ?auto_13816 ) ) ( not ( = ?auto_13808 ?auto_13842 ) ) ( not ( = ?auto_13809 ?auto_13816 ) ) ( not ( = ?auto_13809 ?auto_13842 ) ) ( not ( = ?auto_13810 ?auto_13816 ) ) ( not ( = ?auto_13810 ?auto_13842 ) ) ( not ( = ?auto_13811 ?auto_13816 ) ) ( not ( = ?auto_13811 ?auto_13842 ) ) ( not ( = ?auto_13812 ?auto_13816 ) ) ( not ( = ?auto_13812 ?auto_13842 ) ) ( not ( = ?auto_13813 ?auto_13816 ) ) ( not ( = ?auto_13813 ?auto_13842 ) ) ( not ( = ?auto_13814 ?auto_13816 ) ) ( not ( = ?auto_13814 ?auto_13842 ) ) ( not ( = ?auto_13816 ?auto_13831 ) ) ( not ( = ?auto_13816 ?auto_13836 ) ) ( not ( = ?auto_13816 ?auto_13844 ) ) ( not ( = ?auto_13816 ?auto_13833 ) ) ( not ( = ?auto_13816 ?auto_13837 ) ) ( not ( = ?auto_13816 ?auto_13828 ) ) ( not ( = ?auto_13816 ?auto_13826 ) ) ( not ( = ?auto_13816 ?auto_13832 ) ) ( not ( = ?auto_13842 ?auto_13831 ) ) ( not ( = ?auto_13842 ?auto_13836 ) ) ( not ( = ?auto_13842 ?auto_13844 ) ) ( not ( = ?auto_13842 ?auto_13833 ) ) ( not ( = ?auto_13842 ?auto_13837 ) ) ( not ( = ?auto_13842 ?auto_13828 ) ) ( not ( = ?auto_13842 ?auto_13826 ) ) ( not ( = ?auto_13842 ?auto_13832 ) ) ( not ( = ?auto_13807 ?auto_13817 ) ) ( not ( = ?auto_13807 ?auto_13823 ) ) ( not ( = ?auto_13808 ?auto_13817 ) ) ( not ( = ?auto_13808 ?auto_13823 ) ) ( not ( = ?auto_13809 ?auto_13817 ) ) ( not ( = ?auto_13809 ?auto_13823 ) ) ( not ( = ?auto_13810 ?auto_13817 ) ) ( not ( = ?auto_13810 ?auto_13823 ) ) ( not ( = ?auto_13811 ?auto_13817 ) ) ( not ( = ?auto_13811 ?auto_13823 ) ) ( not ( = ?auto_13812 ?auto_13817 ) ) ( not ( = ?auto_13812 ?auto_13823 ) ) ( not ( = ?auto_13813 ?auto_13817 ) ) ( not ( = ?auto_13813 ?auto_13823 ) ) ( not ( = ?auto_13814 ?auto_13817 ) ) ( not ( = ?auto_13814 ?auto_13823 ) ) ( not ( = ?auto_13815 ?auto_13817 ) ) ( not ( = ?auto_13815 ?auto_13823 ) ) ( not ( = ?auto_13817 ?auto_13842 ) ) ( not ( = ?auto_13817 ?auto_13831 ) ) ( not ( = ?auto_13817 ?auto_13836 ) ) ( not ( = ?auto_13817 ?auto_13844 ) ) ( not ( = ?auto_13817 ?auto_13833 ) ) ( not ( = ?auto_13817 ?auto_13837 ) ) ( not ( = ?auto_13817 ?auto_13828 ) ) ( not ( = ?auto_13817 ?auto_13826 ) ) ( not ( = ?auto_13817 ?auto_13832 ) ) ( not ( = ?auto_13819 ?auto_13843 ) ) ( not ( = ?auto_13819 ?auto_13824 ) ) ( not ( = ?auto_13819 ?auto_13835 ) ) ( not ( = ?auto_13819 ?auto_13841 ) ) ( not ( = ?auto_13819 ?auto_13827 ) ) ( not ( = ?auto_13819 ?auto_13834 ) ) ( not ( = ?auto_13819 ?auto_13846 ) ) ( not ( = ?auto_13821 ?auto_13829 ) ) ( not ( = ?auto_13821 ?auto_13839 ) ) ( not ( = ?auto_13821 ?auto_13825 ) ) ( not ( = ?auto_13821 ?auto_13840 ) ) ( not ( = ?auto_13821 ?auto_13845 ) ) ( not ( = ?auto_13821 ?auto_13830 ) ) ( not ( = ?auto_13821 ?auto_13838 ) ) ( not ( = ?auto_13823 ?auto_13842 ) ) ( not ( = ?auto_13823 ?auto_13831 ) ) ( not ( = ?auto_13823 ?auto_13836 ) ) ( not ( = ?auto_13823 ?auto_13844 ) ) ( not ( = ?auto_13823 ?auto_13833 ) ) ( not ( = ?auto_13823 ?auto_13837 ) ) ( not ( = ?auto_13823 ?auto_13828 ) ) ( not ( = ?auto_13823 ?auto_13826 ) ) ( not ( = ?auto_13823 ?auto_13832 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13807 ?auto_13808 ?auto_13809 ?auto_13810 ?auto_13811 ?auto_13812 ?auto_13813 ?auto_13814 ?auto_13815 ?auto_13816 )
      ( MAKE-1CRATE ?auto_13816 ?auto_13817 )
      ( MAKE-10CRATE-VERIFY ?auto_13807 ?auto_13808 ?auto_13809 ?auto_13810 ?auto_13811 ?auto_13812 ?auto_13813 ?auto_13814 ?auto_13815 ?auto_13816 ?auto_13817 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13869 - SURFACE
      ?auto_13870 - SURFACE
      ?auto_13871 - SURFACE
      ?auto_13872 - SURFACE
      ?auto_13873 - SURFACE
      ?auto_13874 - SURFACE
      ?auto_13875 - SURFACE
      ?auto_13876 - SURFACE
      ?auto_13877 - SURFACE
      ?auto_13878 - SURFACE
      ?auto_13879 - SURFACE
      ?auto_13880 - SURFACE
    )
    :vars
    (
      ?auto_13886 - HOIST
      ?auto_13884 - PLACE
      ?auto_13883 - PLACE
      ?auto_13881 - HOIST
      ?auto_13885 - SURFACE
      ?auto_13910 - PLACE
      ?auto_13902 - HOIST
      ?auto_13891 - SURFACE
      ?auto_13892 - PLACE
      ?auto_13895 - HOIST
      ?auto_13907 - SURFACE
      ?auto_13896 - SURFACE
      ?auto_13903 - PLACE
      ?auto_13888 - HOIST
      ?auto_13901 - SURFACE
      ?auto_13908 - PLACE
      ?auto_13889 - HOIST
      ?auto_13893 - SURFACE
      ?auto_13909 - PLACE
      ?auto_13906 - HOIST
      ?auto_13899 - SURFACE
      ?auto_13904 - PLACE
      ?auto_13894 - HOIST
      ?auto_13898 - SURFACE
      ?auto_13890 - SURFACE
      ?auto_13900 - PLACE
      ?auto_13911 - HOIST
      ?auto_13905 - SURFACE
      ?auto_13887 - PLACE
      ?auto_13912 - HOIST
      ?auto_13897 - SURFACE
      ?auto_13882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13886 ?auto_13884 ) ( IS-CRATE ?auto_13880 ) ( not ( = ?auto_13883 ?auto_13884 ) ) ( HOIST-AT ?auto_13881 ?auto_13883 ) ( AVAILABLE ?auto_13881 ) ( SURFACE-AT ?auto_13880 ?auto_13883 ) ( ON ?auto_13880 ?auto_13885 ) ( CLEAR ?auto_13880 ) ( not ( = ?auto_13879 ?auto_13880 ) ) ( not ( = ?auto_13879 ?auto_13885 ) ) ( not ( = ?auto_13880 ?auto_13885 ) ) ( not ( = ?auto_13886 ?auto_13881 ) ) ( IS-CRATE ?auto_13879 ) ( not ( = ?auto_13910 ?auto_13884 ) ) ( HOIST-AT ?auto_13902 ?auto_13910 ) ( AVAILABLE ?auto_13902 ) ( SURFACE-AT ?auto_13879 ?auto_13910 ) ( ON ?auto_13879 ?auto_13891 ) ( CLEAR ?auto_13879 ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13891 ) ) ( not ( = ?auto_13879 ?auto_13891 ) ) ( not ( = ?auto_13886 ?auto_13902 ) ) ( IS-CRATE ?auto_13878 ) ( not ( = ?auto_13892 ?auto_13884 ) ) ( HOIST-AT ?auto_13895 ?auto_13892 ) ( SURFACE-AT ?auto_13878 ?auto_13892 ) ( ON ?auto_13878 ?auto_13907 ) ( CLEAR ?auto_13878 ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( not ( = ?auto_13877 ?auto_13907 ) ) ( not ( = ?auto_13878 ?auto_13907 ) ) ( not ( = ?auto_13886 ?auto_13895 ) ) ( IS-CRATE ?auto_13877 ) ( AVAILABLE ?auto_13895 ) ( SURFACE-AT ?auto_13877 ?auto_13892 ) ( ON ?auto_13877 ?auto_13896 ) ( CLEAR ?auto_13877 ) ( not ( = ?auto_13876 ?auto_13877 ) ) ( not ( = ?auto_13876 ?auto_13896 ) ) ( not ( = ?auto_13877 ?auto_13896 ) ) ( IS-CRATE ?auto_13876 ) ( not ( = ?auto_13903 ?auto_13884 ) ) ( HOIST-AT ?auto_13888 ?auto_13903 ) ( SURFACE-AT ?auto_13876 ?auto_13903 ) ( ON ?auto_13876 ?auto_13901 ) ( CLEAR ?auto_13876 ) ( not ( = ?auto_13875 ?auto_13876 ) ) ( not ( = ?auto_13875 ?auto_13901 ) ) ( not ( = ?auto_13876 ?auto_13901 ) ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( IS-CRATE ?auto_13875 ) ( not ( = ?auto_13908 ?auto_13884 ) ) ( HOIST-AT ?auto_13889 ?auto_13908 ) ( AVAILABLE ?auto_13889 ) ( SURFACE-AT ?auto_13875 ?auto_13908 ) ( ON ?auto_13875 ?auto_13893 ) ( CLEAR ?auto_13875 ) ( not ( = ?auto_13874 ?auto_13875 ) ) ( not ( = ?auto_13874 ?auto_13893 ) ) ( not ( = ?auto_13875 ?auto_13893 ) ) ( not ( = ?auto_13886 ?auto_13889 ) ) ( IS-CRATE ?auto_13874 ) ( not ( = ?auto_13909 ?auto_13884 ) ) ( HOIST-AT ?auto_13906 ?auto_13909 ) ( AVAILABLE ?auto_13906 ) ( SURFACE-AT ?auto_13874 ?auto_13909 ) ( ON ?auto_13874 ?auto_13899 ) ( CLEAR ?auto_13874 ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13899 ) ) ( not ( = ?auto_13874 ?auto_13899 ) ) ( not ( = ?auto_13886 ?auto_13906 ) ) ( IS-CRATE ?auto_13873 ) ( not ( = ?auto_13904 ?auto_13884 ) ) ( HOIST-AT ?auto_13894 ?auto_13904 ) ( AVAILABLE ?auto_13894 ) ( SURFACE-AT ?auto_13873 ?auto_13904 ) ( ON ?auto_13873 ?auto_13898 ) ( CLEAR ?auto_13873 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13898 ) ) ( not ( = ?auto_13873 ?auto_13898 ) ) ( not ( = ?auto_13886 ?auto_13894 ) ) ( IS-CRATE ?auto_13872 ) ( AVAILABLE ?auto_13888 ) ( SURFACE-AT ?auto_13872 ?auto_13903 ) ( ON ?auto_13872 ?auto_13890 ) ( CLEAR ?auto_13872 ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13890 ) ) ( not ( = ?auto_13872 ?auto_13890 ) ) ( IS-CRATE ?auto_13871 ) ( not ( = ?auto_13900 ?auto_13884 ) ) ( HOIST-AT ?auto_13911 ?auto_13900 ) ( AVAILABLE ?auto_13911 ) ( SURFACE-AT ?auto_13871 ?auto_13900 ) ( ON ?auto_13871 ?auto_13905 ) ( CLEAR ?auto_13871 ) ( not ( = ?auto_13870 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13905 ) ) ( not ( = ?auto_13871 ?auto_13905 ) ) ( not ( = ?auto_13886 ?auto_13911 ) ) ( SURFACE-AT ?auto_13869 ?auto_13884 ) ( CLEAR ?auto_13869 ) ( IS-CRATE ?auto_13870 ) ( AVAILABLE ?auto_13886 ) ( not ( = ?auto_13887 ?auto_13884 ) ) ( HOIST-AT ?auto_13912 ?auto_13887 ) ( AVAILABLE ?auto_13912 ) ( SURFACE-AT ?auto_13870 ?auto_13887 ) ( ON ?auto_13870 ?auto_13897 ) ( CLEAR ?auto_13870 ) ( TRUCK-AT ?auto_13882 ?auto_13884 ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13897 ) ) ( not ( = ?auto_13870 ?auto_13897 ) ) ( not ( = ?auto_13886 ?auto_13912 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13905 ) ) ( not ( = ?auto_13871 ?auto_13897 ) ) ( not ( = ?auto_13900 ?auto_13887 ) ) ( not ( = ?auto_13911 ?auto_13912 ) ) ( not ( = ?auto_13905 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) ( not ( = ?auto_13869 ?auto_13890 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( not ( = ?auto_13870 ?auto_13890 ) ) ( not ( = ?auto_13872 ?auto_13905 ) ) ( not ( = ?auto_13872 ?auto_13897 ) ) ( not ( = ?auto_13903 ?auto_13900 ) ) ( not ( = ?auto_13903 ?auto_13887 ) ) ( not ( = ?auto_13888 ?auto_13911 ) ) ( not ( = ?auto_13888 ?auto_13912 ) ) ( not ( = ?auto_13890 ?auto_13905 ) ) ( not ( = ?auto_13890 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) ( not ( = ?auto_13869 ?auto_13898 ) ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( not ( = ?auto_13870 ?auto_13898 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13898 ) ) ( not ( = ?auto_13873 ?auto_13890 ) ) ( not ( = ?auto_13873 ?auto_13905 ) ) ( not ( = ?auto_13873 ?auto_13897 ) ) ( not ( = ?auto_13904 ?auto_13903 ) ) ( not ( = ?auto_13904 ?auto_13900 ) ) ( not ( = ?auto_13904 ?auto_13887 ) ) ( not ( = ?auto_13894 ?auto_13888 ) ) ( not ( = ?auto_13894 ?auto_13911 ) ) ( not ( = ?auto_13894 ?auto_13912 ) ) ( not ( = ?auto_13898 ?auto_13890 ) ) ( not ( = ?auto_13898 ?auto_13905 ) ) ( not ( = ?auto_13898 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13874 ) ) ( not ( = ?auto_13869 ?auto_13899 ) ) ( not ( = ?auto_13870 ?auto_13874 ) ) ( not ( = ?auto_13870 ?auto_13899 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13899 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13899 ) ) ( not ( = ?auto_13874 ?auto_13898 ) ) ( not ( = ?auto_13874 ?auto_13890 ) ) ( not ( = ?auto_13874 ?auto_13905 ) ) ( not ( = ?auto_13874 ?auto_13897 ) ) ( not ( = ?auto_13909 ?auto_13904 ) ) ( not ( = ?auto_13909 ?auto_13903 ) ) ( not ( = ?auto_13909 ?auto_13900 ) ) ( not ( = ?auto_13909 ?auto_13887 ) ) ( not ( = ?auto_13906 ?auto_13894 ) ) ( not ( = ?auto_13906 ?auto_13888 ) ) ( not ( = ?auto_13906 ?auto_13911 ) ) ( not ( = ?auto_13906 ?auto_13912 ) ) ( not ( = ?auto_13899 ?auto_13898 ) ) ( not ( = ?auto_13899 ?auto_13890 ) ) ( not ( = ?auto_13899 ?auto_13905 ) ) ( not ( = ?auto_13899 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13875 ) ) ( not ( = ?auto_13869 ?auto_13893 ) ) ( not ( = ?auto_13870 ?auto_13875 ) ) ( not ( = ?auto_13870 ?auto_13893 ) ) ( not ( = ?auto_13871 ?auto_13875 ) ) ( not ( = ?auto_13871 ?auto_13893 ) ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13872 ?auto_13893 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( not ( = ?auto_13873 ?auto_13893 ) ) ( not ( = ?auto_13875 ?auto_13899 ) ) ( not ( = ?auto_13875 ?auto_13898 ) ) ( not ( = ?auto_13875 ?auto_13890 ) ) ( not ( = ?auto_13875 ?auto_13905 ) ) ( not ( = ?auto_13875 ?auto_13897 ) ) ( not ( = ?auto_13908 ?auto_13909 ) ) ( not ( = ?auto_13908 ?auto_13904 ) ) ( not ( = ?auto_13908 ?auto_13903 ) ) ( not ( = ?auto_13908 ?auto_13900 ) ) ( not ( = ?auto_13908 ?auto_13887 ) ) ( not ( = ?auto_13889 ?auto_13906 ) ) ( not ( = ?auto_13889 ?auto_13894 ) ) ( not ( = ?auto_13889 ?auto_13888 ) ) ( not ( = ?auto_13889 ?auto_13911 ) ) ( not ( = ?auto_13889 ?auto_13912 ) ) ( not ( = ?auto_13893 ?auto_13899 ) ) ( not ( = ?auto_13893 ?auto_13898 ) ) ( not ( = ?auto_13893 ?auto_13890 ) ) ( not ( = ?auto_13893 ?auto_13905 ) ) ( not ( = ?auto_13893 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13876 ) ) ( not ( = ?auto_13869 ?auto_13901 ) ) ( not ( = ?auto_13870 ?auto_13876 ) ) ( not ( = ?auto_13870 ?auto_13901 ) ) ( not ( = ?auto_13871 ?auto_13876 ) ) ( not ( = ?auto_13871 ?auto_13901 ) ) ( not ( = ?auto_13872 ?auto_13876 ) ) ( not ( = ?auto_13872 ?auto_13901 ) ) ( not ( = ?auto_13873 ?auto_13876 ) ) ( not ( = ?auto_13873 ?auto_13901 ) ) ( not ( = ?auto_13874 ?auto_13876 ) ) ( not ( = ?auto_13874 ?auto_13901 ) ) ( not ( = ?auto_13876 ?auto_13893 ) ) ( not ( = ?auto_13876 ?auto_13899 ) ) ( not ( = ?auto_13876 ?auto_13898 ) ) ( not ( = ?auto_13876 ?auto_13890 ) ) ( not ( = ?auto_13876 ?auto_13905 ) ) ( not ( = ?auto_13876 ?auto_13897 ) ) ( not ( = ?auto_13901 ?auto_13893 ) ) ( not ( = ?auto_13901 ?auto_13899 ) ) ( not ( = ?auto_13901 ?auto_13898 ) ) ( not ( = ?auto_13901 ?auto_13890 ) ) ( not ( = ?auto_13901 ?auto_13905 ) ) ( not ( = ?auto_13901 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13877 ) ) ( not ( = ?auto_13869 ?auto_13896 ) ) ( not ( = ?auto_13870 ?auto_13877 ) ) ( not ( = ?auto_13870 ?auto_13896 ) ) ( not ( = ?auto_13871 ?auto_13877 ) ) ( not ( = ?auto_13871 ?auto_13896 ) ) ( not ( = ?auto_13872 ?auto_13877 ) ) ( not ( = ?auto_13872 ?auto_13896 ) ) ( not ( = ?auto_13873 ?auto_13877 ) ) ( not ( = ?auto_13873 ?auto_13896 ) ) ( not ( = ?auto_13874 ?auto_13877 ) ) ( not ( = ?auto_13874 ?auto_13896 ) ) ( not ( = ?auto_13875 ?auto_13877 ) ) ( not ( = ?auto_13875 ?auto_13896 ) ) ( not ( = ?auto_13877 ?auto_13901 ) ) ( not ( = ?auto_13877 ?auto_13893 ) ) ( not ( = ?auto_13877 ?auto_13899 ) ) ( not ( = ?auto_13877 ?auto_13898 ) ) ( not ( = ?auto_13877 ?auto_13890 ) ) ( not ( = ?auto_13877 ?auto_13905 ) ) ( not ( = ?auto_13877 ?auto_13897 ) ) ( not ( = ?auto_13892 ?auto_13903 ) ) ( not ( = ?auto_13892 ?auto_13908 ) ) ( not ( = ?auto_13892 ?auto_13909 ) ) ( not ( = ?auto_13892 ?auto_13904 ) ) ( not ( = ?auto_13892 ?auto_13900 ) ) ( not ( = ?auto_13892 ?auto_13887 ) ) ( not ( = ?auto_13895 ?auto_13888 ) ) ( not ( = ?auto_13895 ?auto_13889 ) ) ( not ( = ?auto_13895 ?auto_13906 ) ) ( not ( = ?auto_13895 ?auto_13894 ) ) ( not ( = ?auto_13895 ?auto_13911 ) ) ( not ( = ?auto_13895 ?auto_13912 ) ) ( not ( = ?auto_13896 ?auto_13901 ) ) ( not ( = ?auto_13896 ?auto_13893 ) ) ( not ( = ?auto_13896 ?auto_13899 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13890 ) ) ( not ( = ?auto_13896 ?auto_13905 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13878 ) ) ( not ( = ?auto_13869 ?auto_13907 ) ) ( not ( = ?auto_13870 ?auto_13878 ) ) ( not ( = ?auto_13870 ?auto_13907 ) ) ( not ( = ?auto_13871 ?auto_13878 ) ) ( not ( = ?auto_13871 ?auto_13907 ) ) ( not ( = ?auto_13872 ?auto_13878 ) ) ( not ( = ?auto_13872 ?auto_13907 ) ) ( not ( = ?auto_13873 ?auto_13878 ) ) ( not ( = ?auto_13873 ?auto_13907 ) ) ( not ( = ?auto_13874 ?auto_13878 ) ) ( not ( = ?auto_13874 ?auto_13907 ) ) ( not ( = ?auto_13875 ?auto_13878 ) ) ( not ( = ?auto_13875 ?auto_13907 ) ) ( not ( = ?auto_13876 ?auto_13878 ) ) ( not ( = ?auto_13876 ?auto_13907 ) ) ( not ( = ?auto_13878 ?auto_13896 ) ) ( not ( = ?auto_13878 ?auto_13901 ) ) ( not ( = ?auto_13878 ?auto_13893 ) ) ( not ( = ?auto_13878 ?auto_13899 ) ) ( not ( = ?auto_13878 ?auto_13898 ) ) ( not ( = ?auto_13878 ?auto_13890 ) ) ( not ( = ?auto_13878 ?auto_13905 ) ) ( not ( = ?auto_13878 ?auto_13897 ) ) ( not ( = ?auto_13907 ?auto_13896 ) ) ( not ( = ?auto_13907 ?auto_13901 ) ) ( not ( = ?auto_13907 ?auto_13893 ) ) ( not ( = ?auto_13907 ?auto_13899 ) ) ( not ( = ?auto_13907 ?auto_13898 ) ) ( not ( = ?auto_13907 ?auto_13890 ) ) ( not ( = ?auto_13907 ?auto_13905 ) ) ( not ( = ?auto_13907 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13879 ) ) ( not ( = ?auto_13869 ?auto_13891 ) ) ( not ( = ?auto_13870 ?auto_13879 ) ) ( not ( = ?auto_13870 ?auto_13891 ) ) ( not ( = ?auto_13871 ?auto_13879 ) ) ( not ( = ?auto_13871 ?auto_13891 ) ) ( not ( = ?auto_13872 ?auto_13879 ) ) ( not ( = ?auto_13872 ?auto_13891 ) ) ( not ( = ?auto_13873 ?auto_13879 ) ) ( not ( = ?auto_13873 ?auto_13891 ) ) ( not ( = ?auto_13874 ?auto_13879 ) ) ( not ( = ?auto_13874 ?auto_13891 ) ) ( not ( = ?auto_13875 ?auto_13879 ) ) ( not ( = ?auto_13875 ?auto_13891 ) ) ( not ( = ?auto_13876 ?auto_13879 ) ) ( not ( = ?auto_13876 ?auto_13891 ) ) ( not ( = ?auto_13877 ?auto_13879 ) ) ( not ( = ?auto_13877 ?auto_13891 ) ) ( not ( = ?auto_13879 ?auto_13907 ) ) ( not ( = ?auto_13879 ?auto_13896 ) ) ( not ( = ?auto_13879 ?auto_13901 ) ) ( not ( = ?auto_13879 ?auto_13893 ) ) ( not ( = ?auto_13879 ?auto_13899 ) ) ( not ( = ?auto_13879 ?auto_13898 ) ) ( not ( = ?auto_13879 ?auto_13890 ) ) ( not ( = ?auto_13879 ?auto_13905 ) ) ( not ( = ?auto_13879 ?auto_13897 ) ) ( not ( = ?auto_13910 ?auto_13892 ) ) ( not ( = ?auto_13910 ?auto_13903 ) ) ( not ( = ?auto_13910 ?auto_13908 ) ) ( not ( = ?auto_13910 ?auto_13909 ) ) ( not ( = ?auto_13910 ?auto_13904 ) ) ( not ( = ?auto_13910 ?auto_13900 ) ) ( not ( = ?auto_13910 ?auto_13887 ) ) ( not ( = ?auto_13902 ?auto_13895 ) ) ( not ( = ?auto_13902 ?auto_13888 ) ) ( not ( = ?auto_13902 ?auto_13889 ) ) ( not ( = ?auto_13902 ?auto_13906 ) ) ( not ( = ?auto_13902 ?auto_13894 ) ) ( not ( = ?auto_13902 ?auto_13911 ) ) ( not ( = ?auto_13902 ?auto_13912 ) ) ( not ( = ?auto_13891 ?auto_13907 ) ) ( not ( = ?auto_13891 ?auto_13896 ) ) ( not ( = ?auto_13891 ?auto_13901 ) ) ( not ( = ?auto_13891 ?auto_13893 ) ) ( not ( = ?auto_13891 ?auto_13899 ) ) ( not ( = ?auto_13891 ?auto_13898 ) ) ( not ( = ?auto_13891 ?auto_13890 ) ) ( not ( = ?auto_13891 ?auto_13905 ) ) ( not ( = ?auto_13891 ?auto_13897 ) ) ( not ( = ?auto_13869 ?auto_13880 ) ) ( not ( = ?auto_13869 ?auto_13885 ) ) ( not ( = ?auto_13870 ?auto_13880 ) ) ( not ( = ?auto_13870 ?auto_13885 ) ) ( not ( = ?auto_13871 ?auto_13880 ) ) ( not ( = ?auto_13871 ?auto_13885 ) ) ( not ( = ?auto_13872 ?auto_13880 ) ) ( not ( = ?auto_13872 ?auto_13885 ) ) ( not ( = ?auto_13873 ?auto_13880 ) ) ( not ( = ?auto_13873 ?auto_13885 ) ) ( not ( = ?auto_13874 ?auto_13880 ) ) ( not ( = ?auto_13874 ?auto_13885 ) ) ( not ( = ?auto_13875 ?auto_13880 ) ) ( not ( = ?auto_13875 ?auto_13885 ) ) ( not ( = ?auto_13876 ?auto_13880 ) ) ( not ( = ?auto_13876 ?auto_13885 ) ) ( not ( = ?auto_13877 ?auto_13880 ) ) ( not ( = ?auto_13877 ?auto_13885 ) ) ( not ( = ?auto_13878 ?auto_13880 ) ) ( not ( = ?auto_13878 ?auto_13885 ) ) ( not ( = ?auto_13880 ?auto_13891 ) ) ( not ( = ?auto_13880 ?auto_13907 ) ) ( not ( = ?auto_13880 ?auto_13896 ) ) ( not ( = ?auto_13880 ?auto_13901 ) ) ( not ( = ?auto_13880 ?auto_13893 ) ) ( not ( = ?auto_13880 ?auto_13899 ) ) ( not ( = ?auto_13880 ?auto_13898 ) ) ( not ( = ?auto_13880 ?auto_13890 ) ) ( not ( = ?auto_13880 ?auto_13905 ) ) ( not ( = ?auto_13880 ?auto_13897 ) ) ( not ( = ?auto_13883 ?auto_13910 ) ) ( not ( = ?auto_13883 ?auto_13892 ) ) ( not ( = ?auto_13883 ?auto_13903 ) ) ( not ( = ?auto_13883 ?auto_13908 ) ) ( not ( = ?auto_13883 ?auto_13909 ) ) ( not ( = ?auto_13883 ?auto_13904 ) ) ( not ( = ?auto_13883 ?auto_13900 ) ) ( not ( = ?auto_13883 ?auto_13887 ) ) ( not ( = ?auto_13881 ?auto_13902 ) ) ( not ( = ?auto_13881 ?auto_13895 ) ) ( not ( = ?auto_13881 ?auto_13888 ) ) ( not ( = ?auto_13881 ?auto_13889 ) ) ( not ( = ?auto_13881 ?auto_13906 ) ) ( not ( = ?auto_13881 ?auto_13894 ) ) ( not ( = ?auto_13881 ?auto_13911 ) ) ( not ( = ?auto_13881 ?auto_13912 ) ) ( not ( = ?auto_13885 ?auto_13891 ) ) ( not ( = ?auto_13885 ?auto_13907 ) ) ( not ( = ?auto_13885 ?auto_13896 ) ) ( not ( = ?auto_13885 ?auto_13901 ) ) ( not ( = ?auto_13885 ?auto_13893 ) ) ( not ( = ?auto_13885 ?auto_13899 ) ) ( not ( = ?auto_13885 ?auto_13898 ) ) ( not ( = ?auto_13885 ?auto_13890 ) ) ( not ( = ?auto_13885 ?auto_13905 ) ) ( not ( = ?auto_13885 ?auto_13897 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13875 ?auto_13876 ?auto_13877 ?auto_13878 ?auto_13879 )
      ( MAKE-1CRATE ?auto_13879 ?auto_13880 )
      ( MAKE-11CRATE-VERIFY ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13875 ?auto_13876 ?auto_13877 ?auto_13878 ?auto_13879 ?auto_13880 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13936 - SURFACE
      ?auto_13937 - SURFACE
      ?auto_13938 - SURFACE
      ?auto_13939 - SURFACE
      ?auto_13940 - SURFACE
      ?auto_13941 - SURFACE
      ?auto_13942 - SURFACE
      ?auto_13943 - SURFACE
      ?auto_13944 - SURFACE
      ?auto_13945 - SURFACE
      ?auto_13946 - SURFACE
      ?auto_13947 - SURFACE
      ?auto_13948 - SURFACE
    )
    :vars
    (
      ?auto_13953 - HOIST
      ?auto_13949 - PLACE
      ?auto_13951 - PLACE
      ?auto_13952 - HOIST
      ?auto_13954 - SURFACE
      ?auto_13975 - PLACE
      ?auto_13965 - HOIST
      ?auto_13967 - SURFACE
      ?auto_13974 - PLACE
      ?auto_13963 - HOIST
      ?auto_13978 - SURFACE
      ?auto_13961 - SURFACE
      ?auto_13966 - SURFACE
      ?auto_13956 - PLACE
      ?auto_13968 - HOIST
      ?auto_13981 - SURFACE
      ?auto_13962 - PLACE
      ?auto_13957 - HOIST
      ?auto_13969 - SURFACE
      ?auto_13958 - PLACE
      ?auto_13977 - HOIST
      ?auto_13972 - SURFACE
      ?auto_13970 - PLACE
      ?auto_13973 - HOIST
      ?auto_13976 - SURFACE
      ?auto_13959 - SURFACE
      ?auto_13979 - PLACE
      ?auto_13955 - HOIST
      ?auto_13980 - SURFACE
      ?auto_13960 - PLACE
      ?auto_13971 - HOIST
      ?auto_13964 - SURFACE
      ?auto_13950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13953 ?auto_13949 ) ( IS-CRATE ?auto_13948 ) ( not ( = ?auto_13951 ?auto_13949 ) ) ( HOIST-AT ?auto_13952 ?auto_13951 ) ( SURFACE-AT ?auto_13948 ?auto_13951 ) ( ON ?auto_13948 ?auto_13954 ) ( CLEAR ?auto_13948 ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13954 ) ) ( not ( = ?auto_13948 ?auto_13954 ) ) ( not ( = ?auto_13953 ?auto_13952 ) ) ( IS-CRATE ?auto_13947 ) ( not ( = ?auto_13975 ?auto_13949 ) ) ( HOIST-AT ?auto_13965 ?auto_13975 ) ( AVAILABLE ?auto_13965 ) ( SURFACE-AT ?auto_13947 ?auto_13975 ) ( ON ?auto_13947 ?auto_13967 ) ( CLEAR ?auto_13947 ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13967 ) ) ( not ( = ?auto_13947 ?auto_13967 ) ) ( not ( = ?auto_13953 ?auto_13965 ) ) ( IS-CRATE ?auto_13946 ) ( not ( = ?auto_13974 ?auto_13949 ) ) ( HOIST-AT ?auto_13963 ?auto_13974 ) ( AVAILABLE ?auto_13963 ) ( SURFACE-AT ?auto_13946 ?auto_13974 ) ( ON ?auto_13946 ?auto_13978 ) ( CLEAR ?auto_13946 ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13978 ) ) ( not ( = ?auto_13946 ?auto_13978 ) ) ( not ( = ?auto_13953 ?auto_13963 ) ) ( IS-CRATE ?auto_13945 ) ( SURFACE-AT ?auto_13945 ?auto_13951 ) ( ON ?auto_13945 ?auto_13961 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13944 ?auto_13961 ) ) ( not ( = ?auto_13945 ?auto_13961 ) ) ( IS-CRATE ?auto_13944 ) ( AVAILABLE ?auto_13952 ) ( SURFACE-AT ?auto_13944 ?auto_13951 ) ( ON ?auto_13944 ?auto_13966 ) ( CLEAR ?auto_13944 ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13966 ) ) ( not ( = ?auto_13944 ?auto_13966 ) ) ( IS-CRATE ?auto_13943 ) ( not ( = ?auto_13956 ?auto_13949 ) ) ( HOIST-AT ?auto_13968 ?auto_13956 ) ( SURFACE-AT ?auto_13943 ?auto_13956 ) ( ON ?auto_13943 ?auto_13981 ) ( CLEAR ?auto_13943 ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( not ( = ?auto_13942 ?auto_13981 ) ) ( not ( = ?auto_13943 ?auto_13981 ) ) ( not ( = ?auto_13953 ?auto_13968 ) ) ( IS-CRATE ?auto_13942 ) ( not ( = ?auto_13962 ?auto_13949 ) ) ( HOIST-AT ?auto_13957 ?auto_13962 ) ( AVAILABLE ?auto_13957 ) ( SURFACE-AT ?auto_13942 ?auto_13962 ) ( ON ?auto_13942 ?auto_13969 ) ( CLEAR ?auto_13942 ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13969 ) ) ( not ( = ?auto_13942 ?auto_13969 ) ) ( not ( = ?auto_13953 ?auto_13957 ) ) ( IS-CRATE ?auto_13941 ) ( not ( = ?auto_13958 ?auto_13949 ) ) ( HOIST-AT ?auto_13977 ?auto_13958 ) ( AVAILABLE ?auto_13977 ) ( SURFACE-AT ?auto_13941 ?auto_13958 ) ( ON ?auto_13941 ?auto_13972 ) ( CLEAR ?auto_13941 ) ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13972 ) ) ( not ( = ?auto_13941 ?auto_13972 ) ) ( not ( = ?auto_13953 ?auto_13977 ) ) ( IS-CRATE ?auto_13940 ) ( not ( = ?auto_13970 ?auto_13949 ) ) ( HOIST-AT ?auto_13973 ?auto_13970 ) ( AVAILABLE ?auto_13973 ) ( SURFACE-AT ?auto_13940 ?auto_13970 ) ( ON ?auto_13940 ?auto_13976 ) ( CLEAR ?auto_13940 ) ( not ( = ?auto_13939 ?auto_13940 ) ) ( not ( = ?auto_13939 ?auto_13976 ) ) ( not ( = ?auto_13940 ?auto_13976 ) ) ( not ( = ?auto_13953 ?auto_13973 ) ) ( IS-CRATE ?auto_13939 ) ( AVAILABLE ?auto_13968 ) ( SURFACE-AT ?auto_13939 ?auto_13956 ) ( ON ?auto_13939 ?auto_13959 ) ( CLEAR ?auto_13939 ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13959 ) ) ( not ( = ?auto_13939 ?auto_13959 ) ) ( IS-CRATE ?auto_13938 ) ( not ( = ?auto_13979 ?auto_13949 ) ) ( HOIST-AT ?auto_13955 ?auto_13979 ) ( AVAILABLE ?auto_13955 ) ( SURFACE-AT ?auto_13938 ?auto_13979 ) ( ON ?auto_13938 ?auto_13980 ) ( CLEAR ?auto_13938 ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13980 ) ) ( not ( = ?auto_13938 ?auto_13980 ) ) ( not ( = ?auto_13953 ?auto_13955 ) ) ( SURFACE-AT ?auto_13936 ?auto_13949 ) ( CLEAR ?auto_13936 ) ( IS-CRATE ?auto_13937 ) ( AVAILABLE ?auto_13953 ) ( not ( = ?auto_13960 ?auto_13949 ) ) ( HOIST-AT ?auto_13971 ?auto_13960 ) ( AVAILABLE ?auto_13971 ) ( SURFACE-AT ?auto_13937 ?auto_13960 ) ( ON ?auto_13937 ?auto_13964 ) ( CLEAR ?auto_13937 ) ( TRUCK-AT ?auto_13950 ?auto_13949 ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13964 ) ) ( not ( = ?auto_13937 ?auto_13964 ) ) ( not ( = ?auto_13953 ?auto_13971 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13980 ) ) ( not ( = ?auto_13938 ?auto_13964 ) ) ( not ( = ?auto_13979 ?auto_13960 ) ) ( not ( = ?auto_13955 ?auto_13971 ) ) ( not ( = ?auto_13980 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13959 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13959 ) ) ( not ( = ?auto_13939 ?auto_13980 ) ) ( not ( = ?auto_13939 ?auto_13964 ) ) ( not ( = ?auto_13956 ?auto_13979 ) ) ( not ( = ?auto_13956 ?auto_13960 ) ) ( not ( = ?auto_13968 ?auto_13955 ) ) ( not ( = ?auto_13968 ?auto_13971 ) ) ( not ( = ?auto_13959 ?auto_13980 ) ) ( not ( = ?auto_13959 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13940 ) ) ( not ( = ?auto_13936 ?auto_13976 ) ) ( not ( = ?auto_13937 ?auto_13940 ) ) ( not ( = ?auto_13937 ?auto_13976 ) ) ( not ( = ?auto_13938 ?auto_13940 ) ) ( not ( = ?auto_13938 ?auto_13976 ) ) ( not ( = ?auto_13940 ?auto_13959 ) ) ( not ( = ?auto_13940 ?auto_13980 ) ) ( not ( = ?auto_13940 ?auto_13964 ) ) ( not ( = ?auto_13970 ?auto_13956 ) ) ( not ( = ?auto_13970 ?auto_13979 ) ) ( not ( = ?auto_13970 ?auto_13960 ) ) ( not ( = ?auto_13973 ?auto_13968 ) ) ( not ( = ?auto_13973 ?auto_13955 ) ) ( not ( = ?auto_13973 ?auto_13971 ) ) ( not ( = ?auto_13976 ?auto_13959 ) ) ( not ( = ?auto_13976 ?auto_13980 ) ) ( not ( = ?auto_13976 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13941 ) ) ( not ( = ?auto_13936 ?auto_13972 ) ) ( not ( = ?auto_13937 ?auto_13941 ) ) ( not ( = ?auto_13937 ?auto_13972 ) ) ( not ( = ?auto_13938 ?auto_13941 ) ) ( not ( = ?auto_13938 ?auto_13972 ) ) ( not ( = ?auto_13939 ?auto_13941 ) ) ( not ( = ?auto_13939 ?auto_13972 ) ) ( not ( = ?auto_13941 ?auto_13976 ) ) ( not ( = ?auto_13941 ?auto_13959 ) ) ( not ( = ?auto_13941 ?auto_13980 ) ) ( not ( = ?auto_13941 ?auto_13964 ) ) ( not ( = ?auto_13958 ?auto_13970 ) ) ( not ( = ?auto_13958 ?auto_13956 ) ) ( not ( = ?auto_13958 ?auto_13979 ) ) ( not ( = ?auto_13958 ?auto_13960 ) ) ( not ( = ?auto_13977 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13968 ) ) ( not ( = ?auto_13977 ?auto_13955 ) ) ( not ( = ?auto_13977 ?auto_13971 ) ) ( not ( = ?auto_13972 ?auto_13976 ) ) ( not ( = ?auto_13972 ?auto_13959 ) ) ( not ( = ?auto_13972 ?auto_13980 ) ) ( not ( = ?auto_13972 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( not ( = ?auto_13936 ?auto_13969 ) ) ( not ( = ?auto_13937 ?auto_13942 ) ) ( not ( = ?auto_13937 ?auto_13969 ) ) ( not ( = ?auto_13938 ?auto_13942 ) ) ( not ( = ?auto_13938 ?auto_13969 ) ) ( not ( = ?auto_13939 ?auto_13942 ) ) ( not ( = ?auto_13939 ?auto_13969 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13969 ) ) ( not ( = ?auto_13942 ?auto_13972 ) ) ( not ( = ?auto_13942 ?auto_13976 ) ) ( not ( = ?auto_13942 ?auto_13959 ) ) ( not ( = ?auto_13942 ?auto_13980 ) ) ( not ( = ?auto_13942 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13958 ) ) ( not ( = ?auto_13962 ?auto_13970 ) ) ( not ( = ?auto_13962 ?auto_13956 ) ) ( not ( = ?auto_13962 ?auto_13979 ) ) ( not ( = ?auto_13962 ?auto_13960 ) ) ( not ( = ?auto_13957 ?auto_13977 ) ) ( not ( = ?auto_13957 ?auto_13973 ) ) ( not ( = ?auto_13957 ?auto_13968 ) ) ( not ( = ?auto_13957 ?auto_13955 ) ) ( not ( = ?auto_13957 ?auto_13971 ) ) ( not ( = ?auto_13969 ?auto_13972 ) ) ( not ( = ?auto_13969 ?auto_13976 ) ) ( not ( = ?auto_13969 ?auto_13959 ) ) ( not ( = ?auto_13969 ?auto_13980 ) ) ( not ( = ?auto_13969 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13943 ) ) ( not ( = ?auto_13936 ?auto_13981 ) ) ( not ( = ?auto_13937 ?auto_13943 ) ) ( not ( = ?auto_13937 ?auto_13981 ) ) ( not ( = ?auto_13938 ?auto_13943 ) ) ( not ( = ?auto_13938 ?auto_13981 ) ) ( not ( = ?auto_13939 ?auto_13943 ) ) ( not ( = ?auto_13939 ?auto_13981 ) ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13940 ?auto_13981 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( not ( = ?auto_13941 ?auto_13981 ) ) ( not ( = ?auto_13943 ?auto_13969 ) ) ( not ( = ?auto_13943 ?auto_13972 ) ) ( not ( = ?auto_13943 ?auto_13976 ) ) ( not ( = ?auto_13943 ?auto_13959 ) ) ( not ( = ?auto_13943 ?auto_13980 ) ) ( not ( = ?auto_13943 ?auto_13964 ) ) ( not ( = ?auto_13981 ?auto_13969 ) ) ( not ( = ?auto_13981 ?auto_13972 ) ) ( not ( = ?auto_13981 ?auto_13976 ) ) ( not ( = ?auto_13981 ?auto_13959 ) ) ( not ( = ?auto_13981 ?auto_13980 ) ) ( not ( = ?auto_13981 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13944 ) ) ( not ( = ?auto_13936 ?auto_13966 ) ) ( not ( = ?auto_13937 ?auto_13944 ) ) ( not ( = ?auto_13937 ?auto_13966 ) ) ( not ( = ?auto_13938 ?auto_13944 ) ) ( not ( = ?auto_13938 ?auto_13966 ) ) ( not ( = ?auto_13939 ?auto_13944 ) ) ( not ( = ?auto_13939 ?auto_13966 ) ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13940 ?auto_13966 ) ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13966 ) ) ( not ( = ?auto_13942 ?auto_13944 ) ) ( not ( = ?auto_13942 ?auto_13966 ) ) ( not ( = ?auto_13944 ?auto_13981 ) ) ( not ( = ?auto_13944 ?auto_13969 ) ) ( not ( = ?auto_13944 ?auto_13972 ) ) ( not ( = ?auto_13944 ?auto_13976 ) ) ( not ( = ?auto_13944 ?auto_13959 ) ) ( not ( = ?auto_13944 ?auto_13980 ) ) ( not ( = ?auto_13944 ?auto_13964 ) ) ( not ( = ?auto_13951 ?auto_13956 ) ) ( not ( = ?auto_13951 ?auto_13962 ) ) ( not ( = ?auto_13951 ?auto_13958 ) ) ( not ( = ?auto_13951 ?auto_13970 ) ) ( not ( = ?auto_13951 ?auto_13979 ) ) ( not ( = ?auto_13951 ?auto_13960 ) ) ( not ( = ?auto_13952 ?auto_13968 ) ) ( not ( = ?auto_13952 ?auto_13957 ) ) ( not ( = ?auto_13952 ?auto_13977 ) ) ( not ( = ?auto_13952 ?auto_13973 ) ) ( not ( = ?auto_13952 ?auto_13955 ) ) ( not ( = ?auto_13952 ?auto_13971 ) ) ( not ( = ?auto_13966 ?auto_13981 ) ) ( not ( = ?auto_13966 ?auto_13969 ) ) ( not ( = ?auto_13966 ?auto_13972 ) ) ( not ( = ?auto_13966 ?auto_13976 ) ) ( not ( = ?auto_13966 ?auto_13959 ) ) ( not ( = ?auto_13966 ?auto_13980 ) ) ( not ( = ?auto_13966 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13945 ) ) ( not ( = ?auto_13936 ?auto_13961 ) ) ( not ( = ?auto_13937 ?auto_13945 ) ) ( not ( = ?auto_13937 ?auto_13961 ) ) ( not ( = ?auto_13938 ?auto_13945 ) ) ( not ( = ?auto_13938 ?auto_13961 ) ) ( not ( = ?auto_13939 ?auto_13945 ) ) ( not ( = ?auto_13939 ?auto_13961 ) ) ( not ( = ?auto_13940 ?auto_13945 ) ) ( not ( = ?auto_13940 ?auto_13961 ) ) ( not ( = ?auto_13941 ?auto_13945 ) ) ( not ( = ?auto_13941 ?auto_13961 ) ) ( not ( = ?auto_13942 ?auto_13945 ) ) ( not ( = ?auto_13942 ?auto_13961 ) ) ( not ( = ?auto_13943 ?auto_13945 ) ) ( not ( = ?auto_13943 ?auto_13961 ) ) ( not ( = ?auto_13945 ?auto_13966 ) ) ( not ( = ?auto_13945 ?auto_13981 ) ) ( not ( = ?auto_13945 ?auto_13969 ) ) ( not ( = ?auto_13945 ?auto_13972 ) ) ( not ( = ?auto_13945 ?auto_13976 ) ) ( not ( = ?auto_13945 ?auto_13959 ) ) ( not ( = ?auto_13945 ?auto_13980 ) ) ( not ( = ?auto_13945 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13966 ) ) ( not ( = ?auto_13961 ?auto_13981 ) ) ( not ( = ?auto_13961 ?auto_13969 ) ) ( not ( = ?auto_13961 ?auto_13972 ) ) ( not ( = ?auto_13961 ?auto_13976 ) ) ( not ( = ?auto_13961 ?auto_13959 ) ) ( not ( = ?auto_13961 ?auto_13980 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13946 ) ) ( not ( = ?auto_13936 ?auto_13978 ) ) ( not ( = ?auto_13937 ?auto_13946 ) ) ( not ( = ?auto_13937 ?auto_13978 ) ) ( not ( = ?auto_13938 ?auto_13946 ) ) ( not ( = ?auto_13938 ?auto_13978 ) ) ( not ( = ?auto_13939 ?auto_13946 ) ) ( not ( = ?auto_13939 ?auto_13978 ) ) ( not ( = ?auto_13940 ?auto_13946 ) ) ( not ( = ?auto_13940 ?auto_13978 ) ) ( not ( = ?auto_13941 ?auto_13946 ) ) ( not ( = ?auto_13941 ?auto_13978 ) ) ( not ( = ?auto_13942 ?auto_13946 ) ) ( not ( = ?auto_13942 ?auto_13978 ) ) ( not ( = ?auto_13943 ?auto_13946 ) ) ( not ( = ?auto_13943 ?auto_13978 ) ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13944 ?auto_13978 ) ) ( not ( = ?auto_13946 ?auto_13961 ) ) ( not ( = ?auto_13946 ?auto_13966 ) ) ( not ( = ?auto_13946 ?auto_13981 ) ) ( not ( = ?auto_13946 ?auto_13969 ) ) ( not ( = ?auto_13946 ?auto_13972 ) ) ( not ( = ?auto_13946 ?auto_13976 ) ) ( not ( = ?auto_13946 ?auto_13959 ) ) ( not ( = ?auto_13946 ?auto_13980 ) ) ( not ( = ?auto_13946 ?auto_13964 ) ) ( not ( = ?auto_13974 ?auto_13951 ) ) ( not ( = ?auto_13974 ?auto_13956 ) ) ( not ( = ?auto_13974 ?auto_13962 ) ) ( not ( = ?auto_13974 ?auto_13958 ) ) ( not ( = ?auto_13974 ?auto_13970 ) ) ( not ( = ?auto_13974 ?auto_13979 ) ) ( not ( = ?auto_13974 ?auto_13960 ) ) ( not ( = ?auto_13963 ?auto_13952 ) ) ( not ( = ?auto_13963 ?auto_13968 ) ) ( not ( = ?auto_13963 ?auto_13957 ) ) ( not ( = ?auto_13963 ?auto_13977 ) ) ( not ( = ?auto_13963 ?auto_13973 ) ) ( not ( = ?auto_13963 ?auto_13955 ) ) ( not ( = ?auto_13963 ?auto_13971 ) ) ( not ( = ?auto_13978 ?auto_13961 ) ) ( not ( = ?auto_13978 ?auto_13966 ) ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( not ( = ?auto_13978 ?auto_13969 ) ) ( not ( = ?auto_13978 ?auto_13972 ) ) ( not ( = ?auto_13978 ?auto_13976 ) ) ( not ( = ?auto_13978 ?auto_13959 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13947 ) ) ( not ( = ?auto_13936 ?auto_13967 ) ) ( not ( = ?auto_13937 ?auto_13947 ) ) ( not ( = ?auto_13937 ?auto_13967 ) ) ( not ( = ?auto_13938 ?auto_13947 ) ) ( not ( = ?auto_13938 ?auto_13967 ) ) ( not ( = ?auto_13939 ?auto_13947 ) ) ( not ( = ?auto_13939 ?auto_13967 ) ) ( not ( = ?auto_13940 ?auto_13947 ) ) ( not ( = ?auto_13940 ?auto_13967 ) ) ( not ( = ?auto_13941 ?auto_13947 ) ) ( not ( = ?auto_13941 ?auto_13967 ) ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13942 ?auto_13967 ) ) ( not ( = ?auto_13943 ?auto_13947 ) ) ( not ( = ?auto_13943 ?auto_13967 ) ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13944 ?auto_13967 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13967 ) ) ( not ( = ?auto_13947 ?auto_13978 ) ) ( not ( = ?auto_13947 ?auto_13961 ) ) ( not ( = ?auto_13947 ?auto_13966 ) ) ( not ( = ?auto_13947 ?auto_13981 ) ) ( not ( = ?auto_13947 ?auto_13969 ) ) ( not ( = ?auto_13947 ?auto_13972 ) ) ( not ( = ?auto_13947 ?auto_13976 ) ) ( not ( = ?auto_13947 ?auto_13959 ) ) ( not ( = ?auto_13947 ?auto_13980 ) ) ( not ( = ?auto_13947 ?auto_13964 ) ) ( not ( = ?auto_13975 ?auto_13974 ) ) ( not ( = ?auto_13975 ?auto_13951 ) ) ( not ( = ?auto_13975 ?auto_13956 ) ) ( not ( = ?auto_13975 ?auto_13962 ) ) ( not ( = ?auto_13975 ?auto_13958 ) ) ( not ( = ?auto_13975 ?auto_13970 ) ) ( not ( = ?auto_13975 ?auto_13979 ) ) ( not ( = ?auto_13975 ?auto_13960 ) ) ( not ( = ?auto_13965 ?auto_13963 ) ) ( not ( = ?auto_13965 ?auto_13952 ) ) ( not ( = ?auto_13965 ?auto_13968 ) ) ( not ( = ?auto_13965 ?auto_13957 ) ) ( not ( = ?auto_13965 ?auto_13977 ) ) ( not ( = ?auto_13965 ?auto_13973 ) ) ( not ( = ?auto_13965 ?auto_13955 ) ) ( not ( = ?auto_13965 ?auto_13971 ) ) ( not ( = ?auto_13967 ?auto_13978 ) ) ( not ( = ?auto_13967 ?auto_13961 ) ) ( not ( = ?auto_13967 ?auto_13966 ) ) ( not ( = ?auto_13967 ?auto_13981 ) ) ( not ( = ?auto_13967 ?auto_13969 ) ) ( not ( = ?auto_13967 ?auto_13972 ) ) ( not ( = ?auto_13967 ?auto_13976 ) ) ( not ( = ?auto_13967 ?auto_13959 ) ) ( not ( = ?auto_13967 ?auto_13980 ) ) ( not ( = ?auto_13967 ?auto_13964 ) ) ( not ( = ?auto_13936 ?auto_13948 ) ) ( not ( = ?auto_13936 ?auto_13954 ) ) ( not ( = ?auto_13937 ?auto_13948 ) ) ( not ( = ?auto_13937 ?auto_13954 ) ) ( not ( = ?auto_13938 ?auto_13948 ) ) ( not ( = ?auto_13938 ?auto_13954 ) ) ( not ( = ?auto_13939 ?auto_13948 ) ) ( not ( = ?auto_13939 ?auto_13954 ) ) ( not ( = ?auto_13940 ?auto_13948 ) ) ( not ( = ?auto_13940 ?auto_13954 ) ) ( not ( = ?auto_13941 ?auto_13948 ) ) ( not ( = ?auto_13941 ?auto_13954 ) ) ( not ( = ?auto_13942 ?auto_13948 ) ) ( not ( = ?auto_13942 ?auto_13954 ) ) ( not ( = ?auto_13943 ?auto_13948 ) ) ( not ( = ?auto_13943 ?auto_13954 ) ) ( not ( = ?auto_13944 ?auto_13948 ) ) ( not ( = ?auto_13944 ?auto_13954 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13945 ?auto_13954 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13954 ) ) ( not ( = ?auto_13948 ?auto_13967 ) ) ( not ( = ?auto_13948 ?auto_13978 ) ) ( not ( = ?auto_13948 ?auto_13961 ) ) ( not ( = ?auto_13948 ?auto_13966 ) ) ( not ( = ?auto_13948 ?auto_13981 ) ) ( not ( = ?auto_13948 ?auto_13969 ) ) ( not ( = ?auto_13948 ?auto_13972 ) ) ( not ( = ?auto_13948 ?auto_13976 ) ) ( not ( = ?auto_13948 ?auto_13959 ) ) ( not ( = ?auto_13948 ?auto_13980 ) ) ( not ( = ?auto_13948 ?auto_13964 ) ) ( not ( = ?auto_13954 ?auto_13967 ) ) ( not ( = ?auto_13954 ?auto_13978 ) ) ( not ( = ?auto_13954 ?auto_13961 ) ) ( not ( = ?auto_13954 ?auto_13966 ) ) ( not ( = ?auto_13954 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13969 ) ) ( not ( = ?auto_13954 ?auto_13972 ) ) ( not ( = ?auto_13954 ?auto_13976 ) ) ( not ( = ?auto_13954 ?auto_13959 ) ) ( not ( = ?auto_13954 ?auto_13980 ) ) ( not ( = ?auto_13954 ?auto_13964 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ?auto_13944 ?auto_13945 ?auto_13946 ?auto_13947 )
      ( MAKE-1CRATE ?auto_13947 ?auto_13948 )
      ( MAKE-12CRATE-VERIFY ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ?auto_13944 ?auto_13945 ?auto_13946 ?auto_13947 ?auto_13948 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14006 - SURFACE
      ?auto_14007 - SURFACE
      ?auto_14008 - SURFACE
      ?auto_14009 - SURFACE
      ?auto_14010 - SURFACE
      ?auto_14011 - SURFACE
      ?auto_14012 - SURFACE
      ?auto_14013 - SURFACE
      ?auto_14014 - SURFACE
      ?auto_14015 - SURFACE
      ?auto_14016 - SURFACE
      ?auto_14017 - SURFACE
      ?auto_14018 - SURFACE
      ?auto_14019 - SURFACE
    )
    :vars
    (
      ?auto_14025 - HOIST
      ?auto_14024 - PLACE
      ?auto_14022 - PLACE
      ?auto_14021 - HOIST
      ?auto_14023 - SURFACE
      ?auto_14054 - PLACE
      ?auto_14036 - HOIST
      ?auto_14052 - SURFACE
      ?auto_14033 - PLACE
      ?auto_14053 - HOIST
      ?auto_14029 - SURFACE
      ?auto_14046 - PLACE
      ?auto_14034 - HOIST
      ?auto_14055 - SURFACE
      ?auto_14041 - SURFACE
      ?auto_14031 - SURFACE
      ?auto_14040 - PLACE
      ?auto_14030 - HOIST
      ?auto_14050 - SURFACE
      ?auto_14039 - PLACE
      ?auto_14049 - HOIST
      ?auto_14044 - SURFACE
      ?auto_14047 - PLACE
      ?auto_14045 - HOIST
      ?auto_14026 - SURFACE
      ?auto_14032 - PLACE
      ?auto_14038 - HOIST
      ?auto_14043 - SURFACE
      ?auto_14037 - SURFACE
      ?auto_14051 - PLACE
      ?auto_14028 - HOIST
      ?auto_14035 - SURFACE
      ?auto_14048 - PLACE
      ?auto_14027 - HOIST
      ?auto_14042 - SURFACE
      ?auto_14020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14025 ?auto_14024 ) ( IS-CRATE ?auto_14019 ) ( not ( = ?auto_14022 ?auto_14024 ) ) ( HOIST-AT ?auto_14021 ?auto_14022 ) ( AVAILABLE ?auto_14021 ) ( SURFACE-AT ?auto_14019 ?auto_14022 ) ( ON ?auto_14019 ?auto_14023 ) ( CLEAR ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14019 ) ) ( not ( = ?auto_14018 ?auto_14023 ) ) ( not ( = ?auto_14019 ?auto_14023 ) ) ( not ( = ?auto_14025 ?auto_14021 ) ) ( IS-CRATE ?auto_14018 ) ( not ( = ?auto_14054 ?auto_14024 ) ) ( HOIST-AT ?auto_14036 ?auto_14054 ) ( SURFACE-AT ?auto_14018 ?auto_14054 ) ( ON ?auto_14018 ?auto_14052 ) ( CLEAR ?auto_14018 ) ( not ( = ?auto_14017 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14052 ) ) ( not ( = ?auto_14018 ?auto_14052 ) ) ( not ( = ?auto_14025 ?auto_14036 ) ) ( IS-CRATE ?auto_14017 ) ( not ( = ?auto_14033 ?auto_14024 ) ) ( HOIST-AT ?auto_14053 ?auto_14033 ) ( AVAILABLE ?auto_14053 ) ( SURFACE-AT ?auto_14017 ?auto_14033 ) ( ON ?auto_14017 ?auto_14029 ) ( CLEAR ?auto_14017 ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( not ( = ?auto_14016 ?auto_14029 ) ) ( not ( = ?auto_14017 ?auto_14029 ) ) ( not ( = ?auto_14025 ?auto_14053 ) ) ( IS-CRATE ?auto_14016 ) ( not ( = ?auto_14046 ?auto_14024 ) ) ( HOIST-AT ?auto_14034 ?auto_14046 ) ( AVAILABLE ?auto_14034 ) ( SURFACE-AT ?auto_14016 ?auto_14046 ) ( ON ?auto_14016 ?auto_14055 ) ( CLEAR ?auto_14016 ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14055 ) ) ( not ( = ?auto_14016 ?auto_14055 ) ) ( not ( = ?auto_14025 ?auto_14034 ) ) ( IS-CRATE ?auto_14015 ) ( SURFACE-AT ?auto_14015 ?auto_14054 ) ( ON ?auto_14015 ?auto_14041 ) ( CLEAR ?auto_14015 ) ( not ( = ?auto_14014 ?auto_14015 ) ) ( not ( = ?auto_14014 ?auto_14041 ) ) ( not ( = ?auto_14015 ?auto_14041 ) ) ( IS-CRATE ?auto_14014 ) ( AVAILABLE ?auto_14036 ) ( SURFACE-AT ?auto_14014 ?auto_14054 ) ( ON ?auto_14014 ?auto_14031 ) ( CLEAR ?auto_14014 ) ( not ( = ?auto_14013 ?auto_14014 ) ) ( not ( = ?auto_14013 ?auto_14031 ) ) ( not ( = ?auto_14014 ?auto_14031 ) ) ( IS-CRATE ?auto_14013 ) ( not ( = ?auto_14040 ?auto_14024 ) ) ( HOIST-AT ?auto_14030 ?auto_14040 ) ( SURFACE-AT ?auto_14013 ?auto_14040 ) ( ON ?auto_14013 ?auto_14050 ) ( CLEAR ?auto_14013 ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14012 ?auto_14050 ) ) ( not ( = ?auto_14013 ?auto_14050 ) ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( IS-CRATE ?auto_14012 ) ( not ( = ?auto_14039 ?auto_14024 ) ) ( HOIST-AT ?auto_14049 ?auto_14039 ) ( AVAILABLE ?auto_14049 ) ( SURFACE-AT ?auto_14012 ?auto_14039 ) ( ON ?auto_14012 ?auto_14044 ) ( CLEAR ?auto_14012 ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14044 ) ) ( not ( = ?auto_14012 ?auto_14044 ) ) ( not ( = ?auto_14025 ?auto_14049 ) ) ( IS-CRATE ?auto_14011 ) ( not ( = ?auto_14047 ?auto_14024 ) ) ( HOIST-AT ?auto_14045 ?auto_14047 ) ( AVAILABLE ?auto_14045 ) ( SURFACE-AT ?auto_14011 ?auto_14047 ) ( ON ?auto_14011 ?auto_14026 ) ( CLEAR ?auto_14011 ) ( not ( = ?auto_14010 ?auto_14011 ) ) ( not ( = ?auto_14010 ?auto_14026 ) ) ( not ( = ?auto_14011 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14045 ) ) ( IS-CRATE ?auto_14010 ) ( not ( = ?auto_14032 ?auto_14024 ) ) ( HOIST-AT ?auto_14038 ?auto_14032 ) ( AVAILABLE ?auto_14038 ) ( SURFACE-AT ?auto_14010 ?auto_14032 ) ( ON ?auto_14010 ?auto_14043 ) ( CLEAR ?auto_14010 ) ( not ( = ?auto_14009 ?auto_14010 ) ) ( not ( = ?auto_14009 ?auto_14043 ) ) ( not ( = ?auto_14010 ?auto_14043 ) ) ( not ( = ?auto_14025 ?auto_14038 ) ) ( IS-CRATE ?auto_14009 ) ( AVAILABLE ?auto_14030 ) ( SURFACE-AT ?auto_14009 ?auto_14040 ) ( ON ?auto_14009 ?auto_14037 ) ( CLEAR ?auto_14009 ) ( not ( = ?auto_14008 ?auto_14009 ) ) ( not ( = ?auto_14008 ?auto_14037 ) ) ( not ( = ?auto_14009 ?auto_14037 ) ) ( IS-CRATE ?auto_14008 ) ( not ( = ?auto_14051 ?auto_14024 ) ) ( HOIST-AT ?auto_14028 ?auto_14051 ) ( AVAILABLE ?auto_14028 ) ( SURFACE-AT ?auto_14008 ?auto_14051 ) ( ON ?auto_14008 ?auto_14035 ) ( CLEAR ?auto_14008 ) ( not ( = ?auto_14007 ?auto_14008 ) ) ( not ( = ?auto_14007 ?auto_14035 ) ) ( not ( = ?auto_14008 ?auto_14035 ) ) ( not ( = ?auto_14025 ?auto_14028 ) ) ( SURFACE-AT ?auto_14006 ?auto_14024 ) ( CLEAR ?auto_14006 ) ( IS-CRATE ?auto_14007 ) ( AVAILABLE ?auto_14025 ) ( not ( = ?auto_14048 ?auto_14024 ) ) ( HOIST-AT ?auto_14027 ?auto_14048 ) ( AVAILABLE ?auto_14027 ) ( SURFACE-AT ?auto_14007 ?auto_14048 ) ( ON ?auto_14007 ?auto_14042 ) ( CLEAR ?auto_14007 ) ( TRUCK-AT ?auto_14020 ?auto_14024 ) ( not ( = ?auto_14006 ?auto_14007 ) ) ( not ( = ?auto_14006 ?auto_14042 ) ) ( not ( = ?auto_14007 ?auto_14042 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14006 ?auto_14008 ) ) ( not ( = ?auto_14006 ?auto_14035 ) ) ( not ( = ?auto_14008 ?auto_14042 ) ) ( not ( = ?auto_14051 ?auto_14048 ) ) ( not ( = ?auto_14028 ?auto_14027 ) ) ( not ( = ?auto_14035 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14009 ) ) ( not ( = ?auto_14006 ?auto_14037 ) ) ( not ( = ?auto_14007 ?auto_14009 ) ) ( not ( = ?auto_14007 ?auto_14037 ) ) ( not ( = ?auto_14009 ?auto_14035 ) ) ( not ( = ?auto_14009 ?auto_14042 ) ) ( not ( = ?auto_14040 ?auto_14051 ) ) ( not ( = ?auto_14040 ?auto_14048 ) ) ( not ( = ?auto_14030 ?auto_14028 ) ) ( not ( = ?auto_14030 ?auto_14027 ) ) ( not ( = ?auto_14037 ?auto_14035 ) ) ( not ( = ?auto_14037 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14010 ) ) ( not ( = ?auto_14006 ?auto_14043 ) ) ( not ( = ?auto_14007 ?auto_14010 ) ) ( not ( = ?auto_14007 ?auto_14043 ) ) ( not ( = ?auto_14008 ?auto_14010 ) ) ( not ( = ?auto_14008 ?auto_14043 ) ) ( not ( = ?auto_14010 ?auto_14037 ) ) ( not ( = ?auto_14010 ?auto_14035 ) ) ( not ( = ?auto_14010 ?auto_14042 ) ) ( not ( = ?auto_14032 ?auto_14040 ) ) ( not ( = ?auto_14032 ?auto_14051 ) ) ( not ( = ?auto_14032 ?auto_14048 ) ) ( not ( = ?auto_14038 ?auto_14030 ) ) ( not ( = ?auto_14038 ?auto_14028 ) ) ( not ( = ?auto_14038 ?auto_14027 ) ) ( not ( = ?auto_14043 ?auto_14037 ) ) ( not ( = ?auto_14043 ?auto_14035 ) ) ( not ( = ?auto_14043 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14011 ) ) ( not ( = ?auto_14006 ?auto_14026 ) ) ( not ( = ?auto_14007 ?auto_14011 ) ) ( not ( = ?auto_14007 ?auto_14026 ) ) ( not ( = ?auto_14008 ?auto_14011 ) ) ( not ( = ?auto_14008 ?auto_14026 ) ) ( not ( = ?auto_14009 ?auto_14011 ) ) ( not ( = ?auto_14009 ?auto_14026 ) ) ( not ( = ?auto_14011 ?auto_14043 ) ) ( not ( = ?auto_14011 ?auto_14037 ) ) ( not ( = ?auto_14011 ?auto_14035 ) ) ( not ( = ?auto_14011 ?auto_14042 ) ) ( not ( = ?auto_14047 ?auto_14032 ) ) ( not ( = ?auto_14047 ?auto_14040 ) ) ( not ( = ?auto_14047 ?auto_14051 ) ) ( not ( = ?auto_14047 ?auto_14048 ) ) ( not ( = ?auto_14045 ?auto_14038 ) ) ( not ( = ?auto_14045 ?auto_14030 ) ) ( not ( = ?auto_14045 ?auto_14028 ) ) ( not ( = ?auto_14045 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14043 ) ) ( not ( = ?auto_14026 ?auto_14037 ) ) ( not ( = ?auto_14026 ?auto_14035 ) ) ( not ( = ?auto_14026 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14012 ) ) ( not ( = ?auto_14006 ?auto_14044 ) ) ( not ( = ?auto_14007 ?auto_14012 ) ) ( not ( = ?auto_14007 ?auto_14044 ) ) ( not ( = ?auto_14008 ?auto_14012 ) ) ( not ( = ?auto_14008 ?auto_14044 ) ) ( not ( = ?auto_14009 ?auto_14012 ) ) ( not ( = ?auto_14009 ?auto_14044 ) ) ( not ( = ?auto_14010 ?auto_14012 ) ) ( not ( = ?auto_14010 ?auto_14044 ) ) ( not ( = ?auto_14012 ?auto_14026 ) ) ( not ( = ?auto_14012 ?auto_14043 ) ) ( not ( = ?auto_14012 ?auto_14037 ) ) ( not ( = ?auto_14012 ?auto_14035 ) ) ( not ( = ?auto_14012 ?auto_14042 ) ) ( not ( = ?auto_14039 ?auto_14047 ) ) ( not ( = ?auto_14039 ?auto_14032 ) ) ( not ( = ?auto_14039 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14051 ) ) ( not ( = ?auto_14039 ?auto_14048 ) ) ( not ( = ?auto_14049 ?auto_14045 ) ) ( not ( = ?auto_14049 ?auto_14038 ) ) ( not ( = ?auto_14049 ?auto_14030 ) ) ( not ( = ?auto_14049 ?auto_14028 ) ) ( not ( = ?auto_14049 ?auto_14027 ) ) ( not ( = ?auto_14044 ?auto_14026 ) ) ( not ( = ?auto_14044 ?auto_14043 ) ) ( not ( = ?auto_14044 ?auto_14037 ) ) ( not ( = ?auto_14044 ?auto_14035 ) ) ( not ( = ?auto_14044 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14013 ) ) ( not ( = ?auto_14006 ?auto_14050 ) ) ( not ( = ?auto_14007 ?auto_14013 ) ) ( not ( = ?auto_14007 ?auto_14050 ) ) ( not ( = ?auto_14008 ?auto_14013 ) ) ( not ( = ?auto_14008 ?auto_14050 ) ) ( not ( = ?auto_14009 ?auto_14013 ) ) ( not ( = ?auto_14009 ?auto_14050 ) ) ( not ( = ?auto_14010 ?auto_14013 ) ) ( not ( = ?auto_14010 ?auto_14050 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14050 ) ) ( not ( = ?auto_14013 ?auto_14044 ) ) ( not ( = ?auto_14013 ?auto_14026 ) ) ( not ( = ?auto_14013 ?auto_14043 ) ) ( not ( = ?auto_14013 ?auto_14037 ) ) ( not ( = ?auto_14013 ?auto_14035 ) ) ( not ( = ?auto_14013 ?auto_14042 ) ) ( not ( = ?auto_14050 ?auto_14044 ) ) ( not ( = ?auto_14050 ?auto_14026 ) ) ( not ( = ?auto_14050 ?auto_14043 ) ) ( not ( = ?auto_14050 ?auto_14037 ) ) ( not ( = ?auto_14050 ?auto_14035 ) ) ( not ( = ?auto_14050 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14014 ) ) ( not ( = ?auto_14006 ?auto_14031 ) ) ( not ( = ?auto_14007 ?auto_14014 ) ) ( not ( = ?auto_14007 ?auto_14031 ) ) ( not ( = ?auto_14008 ?auto_14014 ) ) ( not ( = ?auto_14008 ?auto_14031 ) ) ( not ( = ?auto_14009 ?auto_14014 ) ) ( not ( = ?auto_14009 ?auto_14031 ) ) ( not ( = ?auto_14010 ?auto_14014 ) ) ( not ( = ?auto_14010 ?auto_14031 ) ) ( not ( = ?auto_14011 ?auto_14014 ) ) ( not ( = ?auto_14011 ?auto_14031 ) ) ( not ( = ?auto_14012 ?auto_14014 ) ) ( not ( = ?auto_14012 ?auto_14031 ) ) ( not ( = ?auto_14014 ?auto_14050 ) ) ( not ( = ?auto_14014 ?auto_14044 ) ) ( not ( = ?auto_14014 ?auto_14026 ) ) ( not ( = ?auto_14014 ?auto_14043 ) ) ( not ( = ?auto_14014 ?auto_14037 ) ) ( not ( = ?auto_14014 ?auto_14035 ) ) ( not ( = ?auto_14014 ?auto_14042 ) ) ( not ( = ?auto_14054 ?auto_14040 ) ) ( not ( = ?auto_14054 ?auto_14039 ) ) ( not ( = ?auto_14054 ?auto_14047 ) ) ( not ( = ?auto_14054 ?auto_14032 ) ) ( not ( = ?auto_14054 ?auto_14051 ) ) ( not ( = ?auto_14054 ?auto_14048 ) ) ( not ( = ?auto_14036 ?auto_14030 ) ) ( not ( = ?auto_14036 ?auto_14049 ) ) ( not ( = ?auto_14036 ?auto_14045 ) ) ( not ( = ?auto_14036 ?auto_14038 ) ) ( not ( = ?auto_14036 ?auto_14028 ) ) ( not ( = ?auto_14036 ?auto_14027 ) ) ( not ( = ?auto_14031 ?auto_14050 ) ) ( not ( = ?auto_14031 ?auto_14044 ) ) ( not ( = ?auto_14031 ?auto_14026 ) ) ( not ( = ?auto_14031 ?auto_14043 ) ) ( not ( = ?auto_14031 ?auto_14037 ) ) ( not ( = ?auto_14031 ?auto_14035 ) ) ( not ( = ?auto_14031 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14015 ) ) ( not ( = ?auto_14006 ?auto_14041 ) ) ( not ( = ?auto_14007 ?auto_14015 ) ) ( not ( = ?auto_14007 ?auto_14041 ) ) ( not ( = ?auto_14008 ?auto_14015 ) ) ( not ( = ?auto_14008 ?auto_14041 ) ) ( not ( = ?auto_14009 ?auto_14015 ) ) ( not ( = ?auto_14009 ?auto_14041 ) ) ( not ( = ?auto_14010 ?auto_14015 ) ) ( not ( = ?auto_14010 ?auto_14041 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( not ( = ?auto_14011 ?auto_14041 ) ) ( not ( = ?auto_14012 ?auto_14015 ) ) ( not ( = ?auto_14012 ?auto_14041 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14041 ) ) ( not ( = ?auto_14015 ?auto_14031 ) ) ( not ( = ?auto_14015 ?auto_14050 ) ) ( not ( = ?auto_14015 ?auto_14044 ) ) ( not ( = ?auto_14015 ?auto_14026 ) ) ( not ( = ?auto_14015 ?auto_14043 ) ) ( not ( = ?auto_14015 ?auto_14037 ) ) ( not ( = ?auto_14015 ?auto_14035 ) ) ( not ( = ?auto_14015 ?auto_14042 ) ) ( not ( = ?auto_14041 ?auto_14031 ) ) ( not ( = ?auto_14041 ?auto_14050 ) ) ( not ( = ?auto_14041 ?auto_14044 ) ) ( not ( = ?auto_14041 ?auto_14026 ) ) ( not ( = ?auto_14041 ?auto_14043 ) ) ( not ( = ?auto_14041 ?auto_14037 ) ) ( not ( = ?auto_14041 ?auto_14035 ) ) ( not ( = ?auto_14041 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14016 ) ) ( not ( = ?auto_14006 ?auto_14055 ) ) ( not ( = ?auto_14007 ?auto_14016 ) ) ( not ( = ?auto_14007 ?auto_14055 ) ) ( not ( = ?auto_14008 ?auto_14016 ) ) ( not ( = ?auto_14008 ?auto_14055 ) ) ( not ( = ?auto_14009 ?auto_14016 ) ) ( not ( = ?auto_14009 ?auto_14055 ) ) ( not ( = ?auto_14010 ?auto_14016 ) ) ( not ( = ?auto_14010 ?auto_14055 ) ) ( not ( = ?auto_14011 ?auto_14016 ) ) ( not ( = ?auto_14011 ?auto_14055 ) ) ( not ( = ?auto_14012 ?auto_14016 ) ) ( not ( = ?auto_14012 ?auto_14055 ) ) ( not ( = ?auto_14013 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14055 ) ) ( not ( = ?auto_14014 ?auto_14016 ) ) ( not ( = ?auto_14014 ?auto_14055 ) ) ( not ( = ?auto_14016 ?auto_14041 ) ) ( not ( = ?auto_14016 ?auto_14031 ) ) ( not ( = ?auto_14016 ?auto_14050 ) ) ( not ( = ?auto_14016 ?auto_14044 ) ) ( not ( = ?auto_14016 ?auto_14026 ) ) ( not ( = ?auto_14016 ?auto_14043 ) ) ( not ( = ?auto_14016 ?auto_14037 ) ) ( not ( = ?auto_14016 ?auto_14035 ) ) ( not ( = ?auto_14016 ?auto_14042 ) ) ( not ( = ?auto_14046 ?auto_14054 ) ) ( not ( = ?auto_14046 ?auto_14040 ) ) ( not ( = ?auto_14046 ?auto_14039 ) ) ( not ( = ?auto_14046 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14032 ) ) ( not ( = ?auto_14046 ?auto_14051 ) ) ( not ( = ?auto_14046 ?auto_14048 ) ) ( not ( = ?auto_14034 ?auto_14036 ) ) ( not ( = ?auto_14034 ?auto_14030 ) ) ( not ( = ?auto_14034 ?auto_14049 ) ) ( not ( = ?auto_14034 ?auto_14045 ) ) ( not ( = ?auto_14034 ?auto_14038 ) ) ( not ( = ?auto_14034 ?auto_14028 ) ) ( not ( = ?auto_14034 ?auto_14027 ) ) ( not ( = ?auto_14055 ?auto_14041 ) ) ( not ( = ?auto_14055 ?auto_14031 ) ) ( not ( = ?auto_14055 ?auto_14050 ) ) ( not ( = ?auto_14055 ?auto_14044 ) ) ( not ( = ?auto_14055 ?auto_14026 ) ) ( not ( = ?auto_14055 ?auto_14043 ) ) ( not ( = ?auto_14055 ?auto_14037 ) ) ( not ( = ?auto_14055 ?auto_14035 ) ) ( not ( = ?auto_14055 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14017 ) ) ( not ( = ?auto_14006 ?auto_14029 ) ) ( not ( = ?auto_14007 ?auto_14017 ) ) ( not ( = ?auto_14007 ?auto_14029 ) ) ( not ( = ?auto_14008 ?auto_14017 ) ) ( not ( = ?auto_14008 ?auto_14029 ) ) ( not ( = ?auto_14009 ?auto_14017 ) ) ( not ( = ?auto_14009 ?auto_14029 ) ) ( not ( = ?auto_14010 ?auto_14017 ) ) ( not ( = ?auto_14010 ?auto_14029 ) ) ( not ( = ?auto_14011 ?auto_14017 ) ) ( not ( = ?auto_14011 ?auto_14029 ) ) ( not ( = ?auto_14012 ?auto_14017 ) ) ( not ( = ?auto_14012 ?auto_14029 ) ) ( not ( = ?auto_14013 ?auto_14017 ) ) ( not ( = ?auto_14013 ?auto_14029 ) ) ( not ( = ?auto_14014 ?auto_14017 ) ) ( not ( = ?auto_14014 ?auto_14029 ) ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( not ( = ?auto_14015 ?auto_14029 ) ) ( not ( = ?auto_14017 ?auto_14055 ) ) ( not ( = ?auto_14017 ?auto_14041 ) ) ( not ( = ?auto_14017 ?auto_14031 ) ) ( not ( = ?auto_14017 ?auto_14050 ) ) ( not ( = ?auto_14017 ?auto_14044 ) ) ( not ( = ?auto_14017 ?auto_14026 ) ) ( not ( = ?auto_14017 ?auto_14043 ) ) ( not ( = ?auto_14017 ?auto_14037 ) ) ( not ( = ?auto_14017 ?auto_14035 ) ) ( not ( = ?auto_14017 ?auto_14042 ) ) ( not ( = ?auto_14033 ?auto_14046 ) ) ( not ( = ?auto_14033 ?auto_14054 ) ) ( not ( = ?auto_14033 ?auto_14040 ) ) ( not ( = ?auto_14033 ?auto_14039 ) ) ( not ( = ?auto_14033 ?auto_14047 ) ) ( not ( = ?auto_14033 ?auto_14032 ) ) ( not ( = ?auto_14033 ?auto_14051 ) ) ( not ( = ?auto_14033 ?auto_14048 ) ) ( not ( = ?auto_14053 ?auto_14034 ) ) ( not ( = ?auto_14053 ?auto_14036 ) ) ( not ( = ?auto_14053 ?auto_14030 ) ) ( not ( = ?auto_14053 ?auto_14049 ) ) ( not ( = ?auto_14053 ?auto_14045 ) ) ( not ( = ?auto_14053 ?auto_14038 ) ) ( not ( = ?auto_14053 ?auto_14028 ) ) ( not ( = ?auto_14053 ?auto_14027 ) ) ( not ( = ?auto_14029 ?auto_14055 ) ) ( not ( = ?auto_14029 ?auto_14041 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14050 ) ) ( not ( = ?auto_14029 ?auto_14044 ) ) ( not ( = ?auto_14029 ?auto_14026 ) ) ( not ( = ?auto_14029 ?auto_14043 ) ) ( not ( = ?auto_14029 ?auto_14037 ) ) ( not ( = ?auto_14029 ?auto_14035 ) ) ( not ( = ?auto_14029 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14018 ) ) ( not ( = ?auto_14006 ?auto_14052 ) ) ( not ( = ?auto_14007 ?auto_14018 ) ) ( not ( = ?auto_14007 ?auto_14052 ) ) ( not ( = ?auto_14008 ?auto_14018 ) ) ( not ( = ?auto_14008 ?auto_14052 ) ) ( not ( = ?auto_14009 ?auto_14018 ) ) ( not ( = ?auto_14009 ?auto_14052 ) ) ( not ( = ?auto_14010 ?auto_14018 ) ) ( not ( = ?auto_14010 ?auto_14052 ) ) ( not ( = ?auto_14011 ?auto_14018 ) ) ( not ( = ?auto_14011 ?auto_14052 ) ) ( not ( = ?auto_14012 ?auto_14018 ) ) ( not ( = ?auto_14012 ?auto_14052 ) ) ( not ( = ?auto_14013 ?auto_14018 ) ) ( not ( = ?auto_14013 ?auto_14052 ) ) ( not ( = ?auto_14014 ?auto_14018 ) ) ( not ( = ?auto_14014 ?auto_14052 ) ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14052 ) ) ( not ( = ?auto_14016 ?auto_14018 ) ) ( not ( = ?auto_14016 ?auto_14052 ) ) ( not ( = ?auto_14018 ?auto_14029 ) ) ( not ( = ?auto_14018 ?auto_14055 ) ) ( not ( = ?auto_14018 ?auto_14041 ) ) ( not ( = ?auto_14018 ?auto_14031 ) ) ( not ( = ?auto_14018 ?auto_14050 ) ) ( not ( = ?auto_14018 ?auto_14044 ) ) ( not ( = ?auto_14018 ?auto_14026 ) ) ( not ( = ?auto_14018 ?auto_14043 ) ) ( not ( = ?auto_14018 ?auto_14037 ) ) ( not ( = ?auto_14018 ?auto_14035 ) ) ( not ( = ?auto_14018 ?auto_14042 ) ) ( not ( = ?auto_14052 ?auto_14029 ) ) ( not ( = ?auto_14052 ?auto_14055 ) ) ( not ( = ?auto_14052 ?auto_14041 ) ) ( not ( = ?auto_14052 ?auto_14031 ) ) ( not ( = ?auto_14052 ?auto_14050 ) ) ( not ( = ?auto_14052 ?auto_14044 ) ) ( not ( = ?auto_14052 ?auto_14026 ) ) ( not ( = ?auto_14052 ?auto_14043 ) ) ( not ( = ?auto_14052 ?auto_14037 ) ) ( not ( = ?auto_14052 ?auto_14035 ) ) ( not ( = ?auto_14052 ?auto_14042 ) ) ( not ( = ?auto_14006 ?auto_14019 ) ) ( not ( = ?auto_14006 ?auto_14023 ) ) ( not ( = ?auto_14007 ?auto_14019 ) ) ( not ( = ?auto_14007 ?auto_14023 ) ) ( not ( = ?auto_14008 ?auto_14019 ) ) ( not ( = ?auto_14008 ?auto_14023 ) ) ( not ( = ?auto_14009 ?auto_14019 ) ) ( not ( = ?auto_14009 ?auto_14023 ) ) ( not ( = ?auto_14010 ?auto_14019 ) ) ( not ( = ?auto_14010 ?auto_14023 ) ) ( not ( = ?auto_14011 ?auto_14019 ) ) ( not ( = ?auto_14011 ?auto_14023 ) ) ( not ( = ?auto_14012 ?auto_14019 ) ) ( not ( = ?auto_14012 ?auto_14023 ) ) ( not ( = ?auto_14013 ?auto_14019 ) ) ( not ( = ?auto_14013 ?auto_14023 ) ) ( not ( = ?auto_14014 ?auto_14019 ) ) ( not ( = ?auto_14014 ?auto_14023 ) ) ( not ( = ?auto_14015 ?auto_14019 ) ) ( not ( = ?auto_14015 ?auto_14023 ) ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( not ( = ?auto_14016 ?auto_14023 ) ) ( not ( = ?auto_14017 ?auto_14019 ) ) ( not ( = ?auto_14017 ?auto_14023 ) ) ( not ( = ?auto_14019 ?auto_14052 ) ) ( not ( = ?auto_14019 ?auto_14029 ) ) ( not ( = ?auto_14019 ?auto_14055 ) ) ( not ( = ?auto_14019 ?auto_14041 ) ) ( not ( = ?auto_14019 ?auto_14031 ) ) ( not ( = ?auto_14019 ?auto_14050 ) ) ( not ( = ?auto_14019 ?auto_14044 ) ) ( not ( = ?auto_14019 ?auto_14026 ) ) ( not ( = ?auto_14019 ?auto_14043 ) ) ( not ( = ?auto_14019 ?auto_14037 ) ) ( not ( = ?auto_14019 ?auto_14035 ) ) ( not ( = ?auto_14019 ?auto_14042 ) ) ( not ( = ?auto_14022 ?auto_14054 ) ) ( not ( = ?auto_14022 ?auto_14033 ) ) ( not ( = ?auto_14022 ?auto_14046 ) ) ( not ( = ?auto_14022 ?auto_14040 ) ) ( not ( = ?auto_14022 ?auto_14039 ) ) ( not ( = ?auto_14022 ?auto_14047 ) ) ( not ( = ?auto_14022 ?auto_14032 ) ) ( not ( = ?auto_14022 ?auto_14051 ) ) ( not ( = ?auto_14022 ?auto_14048 ) ) ( not ( = ?auto_14021 ?auto_14036 ) ) ( not ( = ?auto_14021 ?auto_14053 ) ) ( not ( = ?auto_14021 ?auto_14034 ) ) ( not ( = ?auto_14021 ?auto_14030 ) ) ( not ( = ?auto_14021 ?auto_14049 ) ) ( not ( = ?auto_14021 ?auto_14045 ) ) ( not ( = ?auto_14021 ?auto_14038 ) ) ( not ( = ?auto_14021 ?auto_14028 ) ) ( not ( = ?auto_14021 ?auto_14027 ) ) ( not ( = ?auto_14023 ?auto_14052 ) ) ( not ( = ?auto_14023 ?auto_14029 ) ) ( not ( = ?auto_14023 ?auto_14055 ) ) ( not ( = ?auto_14023 ?auto_14041 ) ) ( not ( = ?auto_14023 ?auto_14031 ) ) ( not ( = ?auto_14023 ?auto_14050 ) ) ( not ( = ?auto_14023 ?auto_14044 ) ) ( not ( = ?auto_14023 ?auto_14026 ) ) ( not ( = ?auto_14023 ?auto_14043 ) ) ( not ( = ?auto_14023 ?auto_14037 ) ) ( not ( = ?auto_14023 ?auto_14035 ) ) ( not ( = ?auto_14023 ?auto_14042 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14006 ?auto_14007 ?auto_14008 ?auto_14009 ?auto_14010 ?auto_14011 ?auto_14012 ?auto_14013 ?auto_14014 ?auto_14015 ?auto_14016 ?auto_14017 ?auto_14018 )
      ( MAKE-1CRATE ?auto_14018 ?auto_14019 )
      ( MAKE-13CRATE-VERIFY ?auto_14006 ?auto_14007 ?auto_14008 ?auto_14009 ?auto_14010 ?auto_14011 ?auto_14012 ?auto_14013 ?auto_14014 ?auto_14015 ?auto_14016 ?auto_14017 ?auto_14018 ?auto_14019 ) )
  )

)
