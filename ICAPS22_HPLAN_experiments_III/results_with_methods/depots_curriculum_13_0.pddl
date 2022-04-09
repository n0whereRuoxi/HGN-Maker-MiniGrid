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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13456 - SURFACE
      ?auto_13457 - SURFACE
    )
    :vars
    (
      ?auto_13458 - HOIST
      ?auto_13459 - PLACE
      ?auto_13461 - PLACE
      ?auto_13462 - HOIST
      ?auto_13463 - SURFACE
      ?auto_13460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13458 ?auto_13459 ) ( SURFACE-AT ?auto_13456 ?auto_13459 ) ( CLEAR ?auto_13456 ) ( IS-CRATE ?auto_13457 ) ( AVAILABLE ?auto_13458 ) ( not ( = ?auto_13461 ?auto_13459 ) ) ( HOIST-AT ?auto_13462 ?auto_13461 ) ( AVAILABLE ?auto_13462 ) ( SURFACE-AT ?auto_13457 ?auto_13461 ) ( ON ?auto_13457 ?auto_13463 ) ( CLEAR ?auto_13457 ) ( TRUCK-AT ?auto_13460 ?auto_13459 ) ( not ( = ?auto_13456 ?auto_13457 ) ) ( not ( = ?auto_13456 ?auto_13463 ) ) ( not ( = ?auto_13457 ?auto_13463 ) ) ( not ( = ?auto_13458 ?auto_13462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13460 ?auto_13459 ?auto_13461 )
      ( !LIFT ?auto_13462 ?auto_13457 ?auto_13463 ?auto_13461 )
      ( !LOAD ?auto_13462 ?auto_13457 ?auto_13460 ?auto_13461 )
      ( !DRIVE ?auto_13460 ?auto_13461 ?auto_13459 )
      ( !UNLOAD ?auto_13458 ?auto_13457 ?auto_13460 ?auto_13459 )
      ( !DROP ?auto_13458 ?auto_13457 ?auto_13456 ?auto_13459 )
      ( MAKE-1CRATE-VERIFY ?auto_13456 ?auto_13457 ) )
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
      ?auto_13473 - HOIST
      ?auto_13472 - PLACE
      ?auto_13475 - PLACE
      ?auto_13471 - HOIST
      ?auto_13470 - SURFACE
      ?auto_13478 - PLACE
      ?auto_13476 - HOIST
      ?auto_13477 - SURFACE
      ?auto_13474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13473 ?auto_13472 ) ( IS-CRATE ?auto_13469 ) ( not ( = ?auto_13475 ?auto_13472 ) ) ( HOIST-AT ?auto_13471 ?auto_13475 ) ( AVAILABLE ?auto_13471 ) ( SURFACE-AT ?auto_13469 ?auto_13475 ) ( ON ?auto_13469 ?auto_13470 ) ( CLEAR ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13468 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13473 ?auto_13471 ) ) ( SURFACE-AT ?auto_13467 ?auto_13472 ) ( CLEAR ?auto_13467 ) ( IS-CRATE ?auto_13468 ) ( AVAILABLE ?auto_13473 ) ( not ( = ?auto_13478 ?auto_13472 ) ) ( HOIST-AT ?auto_13476 ?auto_13478 ) ( AVAILABLE ?auto_13476 ) ( SURFACE-AT ?auto_13468 ?auto_13478 ) ( ON ?auto_13468 ?auto_13477 ) ( CLEAR ?auto_13468 ) ( TRUCK-AT ?auto_13474 ?auto_13472 ) ( not ( = ?auto_13467 ?auto_13468 ) ) ( not ( = ?auto_13467 ?auto_13477 ) ) ( not ( = ?auto_13468 ?auto_13477 ) ) ( not ( = ?auto_13473 ?auto_13476 ) ) ( not ( = ?auto_13467 ?auto_13469 ) ) ( not ( = ?auto_13467 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13477 ) ) ( not ( = ?auto_13475 ?auto_13478 ) ) ( not ( = ?auto_13471 ?auto_13476 ) ) ( not ( = ?auto_13470 ?auto_13477 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13467 ?auto_13468 )
      ( MAKE-1CRATE ?auto_13468 ?auto_13469 )
      ( MAKE-2CRATE-VERIFY ?auto_13467 ?auto_13468 ?auto_13469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13481 - SURFACE
      ?auto_13482 - SURFACE
    )
    :vars
    (
      ?auto_13483 - HOIST
      ?auto_13484 - PLACE
      ?auto_13486 - PLACE
      ?auto_13487 - HOIST
      ?auto_13488 - SURFACE
      ?auto_13485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13483 ?auto_13484 ) ( SURFACE-AT ?auto_13481 ?auto_13484 ) ( CLEAR ?auto_13481 ) ( IS-CRATE ?auto_13482 ) ( AVAILABLE ?auto_13483 ) ( not ( = ?auto_13486 ?auto_13484 ) ) ( HOIST-AT ?auto_13487 ?auto_13486 ) ( AVAILABLE ?auto_13487 ) ( SURFACE-AT ?auto_13482 ?auto_13486 ) ( ON ?auto_13482 ?auto_13488 ) ( CLEAR ?auto_13482 ) ( TRUCK-AT ?auto_13485 ?auto_13484 ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13488 ) ) ( not ( = ?auto_13482 ?auto_13488 ) ) ( not ( = ?auto_13483 ?auto_13487 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13485 ?auto_13484 ?auto_13486 )
      ( !LIFT ?auto_13487 ?auto_13482 ?auto_13488 ?auto_13486 )
      ( !LOAD ?auto_13487 ?auto_13482 ?auto_13485 ?auto_13486 )
      ( !DRIVE ?auto_13485 ?auto_13486 ?auto_13484 )
      ( !UNLOAD ?auto_13483 ?auto_13482 ?auto_13485 ?auto_13484 )
      ( !DROP ?auto_13483 ?auto_13482 ?auto_13481 ?auto_13484 )
      ( MAKE-1CRATE-VERIFY ?auto_13481 ?auto_13482 ) )
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
      ?auto_13497 - HOIST
      ?auto_13502 - PLACE
      ?auto_13498 - PLACE
      ?auto_13499 - HOIST
      ?auto_13500 - SURFACE
      ?auto_13507 - PLACE
      ?auto_13506 - HOIST
      ?auto_13508 - SURFACE
      ?auto_13503 - PLACE
      ?auto_13504 - HOIST
      ?auto_13505 - SURFACE
      ?auto_13501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13497 ?auto_13502 ) ( IS-CRATE ?auto_13496 ) ( not ( = ?auto_13498 ?auto_13502 ) ) ( HOIST-AT ?auto_13499 ?auto_13498 ) ( AVAILABLE ?auto_13499 ) ( SURFACE-AT ?auto_13496 ?auto_13498 ) ( ON ?auto_13496 ?auto_13500 ) ( CLEAR ?auto_13496 ) ( not ( = ?auto_13495 ?auto_13496 ) ) ( not ( = ?auto_13495 ?auto_13500 ) ) ( not ( = ?auto_13496 ?auto_13500 ) ) ( not ( = ?auto_13497 ?auto_13499 ) ) ( IS-CRATE ?auto_13495 ) ( not ( = ?auto_13507 ?auto_13502 ) ) ( HOIST-AT ?auto_13506 ?auto_13507 ) ( AVAILABLE ?auto_13506 ) ( SURFACE-AT ?auto_13495 ?auto_13507 ) ( ON ?auto_13495 ?auto_13508 ) ( CLEAR ?auto_13495 ) ( not ( = ?auto_13494 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13508 ) ) ( not ( = ?auto_13495 ?auto_13508 ) ) ( not ( = ?auto_13497 ?auto_13506 ) ) ( SURFACE-AT ?auto_13493 ?auto_13502 ) ( CLEAR ?auto_13493 ) ( IS-CRATE ?auto_13494 ) ( AVAILABLE ?auto_13497 ) ( not ( = ?auto_13503 ?auto_13502 ) ) ( HOIST-AT ?auto_13504 ?auto_13503 ) ( AVAILABLE ?auto_13504 ) ( SURFACE-AT ?auto_13494 ?auto_13503 ) ( ON ?auto_13494 ?auto_13505 ) ( CLEAR ?auto_13494 ) ( TRUCK-AT ?auto_13501 ?auto_13502 ) ( not ( = ?auto_13493 ?auto_13494 ) ) ( not ( = ?auto_13493 ?auto_13505 ) ) ( not ( = ?auto_13494 ?auto_13505 ) ) ( not ( = ?auto_13497 ?auto_13504 ) ) ( not ( = ?auto_13493 ?auto_13495 ) ) ( not ( = ?auto_13493 ?auto_13508 ) ) ( not ( = ?auto_13495 ?auto_13505 ) ) ( not ( = ?auto_13507 ?auto_13503 ) ) ( not ( = ?auto_13506 ?auto_13504 ) ) ( not ( = ?auto_13508 ?auto_13505 ) ) ( not ( = ?auto_13493 ?auto_13496 ) ) ( not ( = ?auto_13493 ?auto_13500 ) ) ( not ( = ?auto_13494 ?auto_13496 ) ) ( not ( = ?auto_13494 ?auto_13500 ) ) ( not ( = ?auto_13496 ?auto_13508 ) ) ( not ( = ?auto_13496 ?auto_13505 ) ) ( not ( = ?auto_13498 ?auto_13507 ) ) ( not ( = ?auto_13498 ?auto_13503 ) ) ( not ( = ?auto_13499 ?auto_13506 ) ) ( not ( = ?auto_13499 ?auto_13504 ) ) ( not ( = ?auto_13500 ?auto_13508 ) ) ( not ( = ?auto_13500 ?auto_13505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13493 ?auto_13494 ?auto_13495 )
      ( MAKE-1CRATE ?auto_13495 ?auto_13496 )
      ( MAKE-3CRATE-VERIFY ?auto_13493 ?auto_13494 ?auto_13495 ?auto_13496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13511 - SURFACE
      ?auto_13512 - SURFACE
    )
    :vars
    (
      ?auto_13513 - HOIST
      ?auto_13514 - PLACE
      ?auto_13516 - PLACE
      ?auto_13517 - HOIST
      ?auto_13518 - SURFACE
      ?auto_13515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13513 ?auto_13514 ) ( SURFACE-AT ?auto_13511 ?auto_13514 ) ( CLEAR ?auto_13511 ) ( IS-CRATE ?auto_13512 ) ( AVAILABLE ?auto_13513 ) ( not ( = ?auto_13516 ?auto_13514 ) ) ( HOIST-AT ?auto_13517 ?auto_13516 ) ( AVAILABLE ?auto_13517 ) ( SURFACE-AT ?auto_13512 ?auto_13516 ) ( ON ?auto_13512 ?auto_13518 ) ( CLEAR ?auto_13512 ) ( TRUCK-AT ?auto_13515 ?auto_13514 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13518 ) ) ( not ( = ?auto_13512 ?auto_13518 ) ) ( not ( = ?auto_13513 ?auto_13517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13515 ?auto_13514 ?auto_13516 )
      ( !LIFT ?auto_13517 ?auto_13512 ?auto_13518 ?auto_13516 )
      ( !LOAD ?auto_13517 ?auto_13512 ?auto_13515 ?auto_13516 )
      ( !DRIVE ?auto_13515 ?auto_13516 ?auto_13514 )
      ( !UNLOAD ?auto_13513 ?auto_13512 ?auto_13515 ?auto_13514 )
      ( !DROP ?auto_13513 ?auto_13512 ?auto_13511 ?auto_13514 )
      ( MAKE-1CRATE-VERIFY ?auto_13511 ?auto_13512 ) )
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
      ?auto_13532 - HOIST
      ?auto_13531 - PLACE
      ?auto_13534 - PLACE
      ?auto_13529 - HOIST
      ?auto_13533 - SURFACE
      ?auto_13542 - PLACE
      ?auto_13536 - HOIST
      ?auto_13535 - SURFACE
      ?auto_13541 - PLACE
      ?auto_13537 - HOIST
      ?auto_13538 - SURFACE
      ?auto_13539 - PLACE
      ?auto_13543 - HOIST
      ?auto_13540 - SURFACE
      ?auto_13530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13532 ?auto_13531 ) ( IS-CRATE ?auto_13528 ) ( not ( = ?auto_13534 ?auto_13531 ) ) ( HOIST-AT ?auto_13529 ?auto_13534 ) ( AVAILABLE ?auto_13529 ) ( SURFACE-AT ?auto_13528 ?auto_13534 ) ( ON ?auto_13528 ?auto_13533 ) ( CLEAR ?auto_13528 ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( not ( = ?auto_13527 ?auto_13533 ) ) ( not ( = ?auto_13528 ?auto_13533 ) ) ( not ( = ?auto_13532 ?auto_13529 ) ) ( IS-CRATE ?auto_13527 ) ( not ( = ?auto_13542 ?auto_13531 ) ) ( HOIST-AT ?auto_13536 ?auto_13542 ) ( AVAILABLE ?auto_13536 ) ( SURFACE-AT ?auto_13527 ?auto_13542 ) ( ON ?auto_13527 ?auto_13535 ) ( CLEAR ?auto_13527 ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13535 ) ) ( not ( = ?auto_13527 ?auto_13535 ) ) ( not ( = ?auto_13532 ?auto_13536 ) ) ( IS-CRATE ?auto_13526 ) ( not ( = ?auto_13541 ?auto_13531 ) ) ( HOIST-AT ?auto_13537 ?auto_13541 ) ( AVAILABLE ?auto_13537 ) ( SURFACE-AT ?auto_13526 ?auto_13541 ) ( ON ?auto_13526 ?auto_13538 ) ( CLEAR ?auto_13526 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13538 ) ) ( not ( = ?auto_13526 ?auto_13538 ) ) ( not ( = ?auto_13532 ?auto_13537 ) ) ( SURFACE-AT ?auto_13524 ?auto_13531 ) ( CLEAR ?auto_13524 ) ( IS-CRATE ?auto_13525 ) ( AVAILABLE ?auto_13532 ) ( not ( = ?auto_13539 ?auto_13531 ) ) ( HOIST-AT ?auto_13543 ?auto_13539 ) ( AVAILABLE ?auto_13543 ) ( SURFACE-AT ?auto_13525 ?auto_13539 ) ( ON ?auto_13525 ?auto_13540 ) ( CLEAR ?auto_13525 ) ( TRUCK-AT ?auto_13530 ?auto_13531 ) ( not ( = ?auto_13524 ?auto_13525 ) ) ( not ( = ?auto_13524 ?auto_13540 ) ) ( not ( = ?auto_13525 ?auto_13540 ) ) ( not ( = ?auto_13532 ?auto_13543 ) ) ( not ( = ?auto_13524 ?auto_13526 ) ) ( not ( = ?auto_13524 ?auto_13538 ) ) ( not ( = ?auto_13526 ?auto_13540 ) ) ( not ( = ?auto_13541 ?auto_13539 ) ) ( not ( = ?auto_13537 ?auto_13543 ) ) ( not ( = ?auto_13538 ?auto_13540 ) ) ( not ( = ?auto_13524 ?auto_13527 ) ) ( not ( = ?auto_13524 ?auto_13535 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13535 ) ) ( not ( = ?auto_13527 ?auto_13538 ) ) ( not ( = ?auto_13527 ?auto_13540 ) ) ( not ( = ?auto_13542 ?auto_13541 ) ) ( not ( = ?auto_13542 ?auto_13539 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13543 ) ) ( not ( = ?auto_13535 ?auto_13538 ) ) ( not ( = ?auto_13535 ?auto_13540 ) ) ( not ( = ?auto_13524 ?auto_13528 ) ) ( not ( = ?auto_13524 ?auto_13533 ) ) ( not ( = ?auto_13525 ?auto_13528 ) ) ( not ( = ?auto_13525 ?auto_13533 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13533 ) ) ( not ( = ?auto_13528 ?auto_13535 ) ) ( not ( = ?auto_13528 ?auto_13538 ) ) ( not ( = ?auto_13528 ?auto_13540 ) ) ( not ( = ?auto_13534 ?auto_13542 ) ) ( not ( = ?auto_13534 ?auto_13541 ) ) ( not ( = ?auto_13534 ?auto_13539 ) ) ( not ( = ?auto_13529 ?auto_13536 ) ) ( not ( = ?auto_13529 ?auto_13537 ) ) ( not ( = ?auto_13529 ?auto_13543 ) ) ( not ( = ?auto_13533 ?auto_13535 ) ) ( not ( = ?auto_13533 ?auto_13538 ) ) ( not ( = ?auto_13533 ?auto_13540 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13527 )
      ( MAKE-1CRATE ?auto_13527 ?auto_13528 )
      ( MAKE-4CRATE-VERIFY ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13527 ?auto_13528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13546 - SURFACE
      ?auto_13547 - SURFACE
    )
    :vars
    (
      ?auto_13548 - HOIST
      ?auto_13549 - PLACE
      ?auto_13551 - PLACE
      ?auto_13552 - HOIST
      ?auto_13553 - SURFACE
      ?auto_13550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13548 ?auto_13549 ) ( SURFACE-AT ?auto_13546 ?auto_13549 ) ( CLEAR ?auto_13546 ) ( IS-CRATE ?auto_13547 ) ( AVAILABLE ?auto_13548 ) ( not ( = ?auto_13551 ?auto_13549 ) ) ( HOIST-AT ?auto_13552 ?auto_13551 ) ( AVAILABLE ?auto_13552 ) ( SURFACE-AT ?auto_13547 ?auto_13551 ) ( ON ?auto_13547 ?auto_13553 ) ( CLEAR ?auto_13547 ) ( TRUCK-AT ?auto_13550 ?auto_13549 ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( not ( = ?auto_13546 ?auto_13553 ) ) ( not ( = ?auto_13547 ?auto_13553 ) ) ( not ( = ?auto_13548 ?auto_13552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13550 ?auto_13549 ?auto_13551 )
      ( !LIFT ?auto_13552 ?auto_13547 ?auto_13553 ?auto_13551 )
      ( !LOAD ?auto_13552 ?auto_13547 ?auto_13550 ?auto_13551 )
      ( !DRIVE ?auto_13550 ?auto_13551 ?auto_13549 )
      ( !UNLOAD ?auto_13548 ?auto_13547 ?auto_13550 ?auto_13549 )
      ( !DROP ?auto_13548 ?auto_13547 ?auto_13546 ?auto_13549 )
      ( MAKE-1CRATE-VERIFY ?auto_13546 ?auto_13547 ) )
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
      ?auto_13567 - HOIST
      ?auto_13569 - PLACE
      ?auto_13571 - PLACE
      ?auto_13570 - HOIST
      ?auto_13566 - SURFACE
      ?auto_13574 - PLACE
      ?auto_13576 - HOIST
      ?auto_13581 - SURFACE
      ?auto_13578 - PLACE
      ?auto_13583 - HOIST
      ?auto_13577 - SURFACE
      ?auto_13579 - PLACE
      ?auto_13575 - HOIST
      ?auto_13582 - SURFACE
      ?auto_13573 - PLACE
      ?auto_13580 - HOIST
      ?auto_13572 - SURFACE
      ?auto_13568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13567 ?auto_13569 ) ( IS-CRATE ?auto_13565 ) ( not ( = ?auto_13571 ?auto_13569 ) ) ( HOIST-AT ?auto_13570 ?auto_13571 ) ( AVAILABLE ?auto_13570 ) ( SURFACE-AT ?auto_13565 ?auto_13571 ) ( ON ?auto_13565 ?auto_13566 ) ( CLEAR ?auto_13565 ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13566 ) ) ( not ( = ?auto_13565 ?auto_13566 ) ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( IS-CRATE ?auto_13564 ) ( not ( = ?auto_13574 ?auto_13569 ) ) ( HOIST-AT ?auto_13576 ?auto_13574 ) ( AVAILABLE ?auto_13576 ) ( SURFACE-AT ?auto_13564 ?auto_13574 ) ( ON ?auto_13564 ?auto_13581 ) ( CLEAR ?auto_13564 ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13581 ) ) ( not ( = ?auto_13564 ?auto_13581 ) ) ( not ( = ?auto_13567 ?auto_13576 ) ) ( IS-CRATE ?auto_13563 ) ( not ( = ?auto_13578 ?auto_13569 ) ) ( HOIST-AT ?auto_13583 ?auto_13578 ) ( AVAILABLE ?auto_13583 ) ( SURFACE-AT ?auto_13563 ?auto_13578 ) ( ON ?auto_13563 ?auto_13577 ) ( CLEAR ?auto_13563 ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( not ( = ?auto_13562 ?auto_13577 ) ) ( not ( = ?auto_13563 ?auto_13577 ) ) ( not ( = ?auto_13567 ?auto_13583 ) ) ( IS-CRATE ?auto_13562 ) ( not ( = ?auto_13579 ?auto_13569 ) ) ( HOIST-AT ?auto_13575 ?auto_13579 ) ( AVAILABLE ?auto_13575 ) ( SURFACE-AT ?auto_13562 ?auto_13579 ) ( ON ?auto_13562 ?auto_13582 ) ( CLEAR ?auto_13562 ) ( not ( = ?auto_13561 ?auto_13562 ) ) ( not ( = ?auto_13561 ?auto_13582 ) ) ( not ( = ?auto_13562 ?auto_13582 ) ) ( not ( = ?auto_13567 ?auto_13575 ) ) ( SURFACE-AT ?auto_13560 ?auto_13569 ) ( CLEAR ?auto_13560 ) ( IS-CRATE ?auto_13561 ) ( AVAILABLE ?auto_13567 ) ( not ( = ?auto_13573 ?auto_13569 ) ) ( HOIST-AT ?auto_13580 ?auto_13573 ) ( AVAILABLE ?auto_13580 ) ( SURFACE-AT ?auto_13561 ?auto_13573 ) ( ON ?auto_13561 ?auto_13572 ) ( CLEAR ?auto_13561 ) ( TRUCK-AT ?auto_13568 ?auto_13569 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13572 ) ) ( not ( = ?auto_13561 ?auto_13572 ) ) ( not ( = ?auto_13567 ?auto_13580 ) ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13582 ) ) ( not ( = ?auto_13562 ?auto_13572 ) ) ( not ( = ?auto_13579 ?auto_13573 ) ) ( not ( = ?auto_13575 ?auto_13580 ) ) ( not ( = ?auto_13582 ?auto_13572 ) ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13560 ?auto_13577 ) ) ( not ( = ?auto_13561 ?auto_13563 ) ) ( not ( = ?auto_13561 ?auto_13577 ) ) ( not ( = ?auto_13563 ?auto_13582 ) ) ( not ( = ?auto_13563 ?auto_13572 ) ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13573 ) ) ( not ( = ?auto_13583 ?auto_13575 ) ) ( not ( = ?auto_13583 ?auto_13580 ) ) ( not ( = ?auto_13577 ?auto_13582 ) ) ( not ( = ?auto_13577 ?auto_13572 ) ) ( not ( = ?auto_13560 ?auto_13564 ) ) ( not ( = ?auto_13560 ?auto_13581 ) ) ( not ( = ?auto_13561 ?auto_13564 ) ) ( not ( = ?auto_13561 ?auto_13581 ) ) ( not ( = ?auto_13562 ?auto_13564 ) ) ( not ( = ?auto_13562 ?auto_13581 ) ) ( not ( = ?auto_13564 ?auto_13577 ) ) ( not ( = ?auto_13564 ?auto_13582 ) ) ( not ( = ?auto_13564 ?auto_13572 ) ) ( not ( = ?auto_13574 ?auto_13578 ) ) ( not ( = ?auto_13574 ?auto_13579 ) ) ( not ( = ?auto_13574 ?auto_13573 ) ) ( not ( = ?auto_13576 ?auto_13583 ) ) ( not ( = ?auto_13576 ?auto_13575 ) ) ( not ( = ?auto_13576 ?auto_13580 ) ) ( not ( = ?auto_13581 ?auto_13577 ) ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13581 ?auto_13572 ) ) ( not ( = ?auto_13560 ?auto_13565 ) ) ( not ( = ?auto_13560 ?auto_13566 ) ) ( not ( = ?auto_13561 ?auto_13565 ) ) ( not ( = ?auto_13561 ?auto_13566 ) ) ( not ( = ?auto_13562 ?auto_13565 ) ) ( not ( = ?auto_13562 ?auto_13566 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( not ( = ?auto_13563 ?auto_13566 ) ) ( not ( = ?auto_13565 ?auto_13581 ) ) ( not ( = ?auto_13565 ?auto_13577 ) ) ( not ( = ?auto_13565 ?auto_13582 ) ) ( not ( = ?auto_13565 ?auto_13572 ) ) ( not ( = ?auto_13571 ?auto_13574 ) ) ( not ( = ?auto_13571 ?auto_13578 ) ) ( not ( = ?auto_13571 ?auto_13579 ) ) ( not ( = ?auto_13571 ?auto_13573 ) ) ( not ( = ?auto_13570 ?auto_13576 ) ) ( not ( = ?auto_13570 ?auto_13583 ) ) ( not ( = ?auto_13570 ?auto_13575 ) ) ( not ( = ?auto_13570 ?auto_13580 ) ) ( not ( = ?auto_13566 ?auto_13581 ) ) ( not ( = ?auto_13566 ?auto_13577 ) ) ( not ( = ?auto_13566 ?auto_13582 ) ) ( not ( = ?auto_13566 ?auto_13572 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 ?auto_13564 )
      ( MAKE-1CRATE ?auto_13564 ?auto_13565 )
      ( MAKE-5CRATE-VERIFY ?auto_13560 ?auto_13561 ?auto_13562 ?auto_13563 ?auto_13564 ?auto_13565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13586 - SURFACE
      ?auto_13587 - SURFACE
    )
    :vars
    (
      ?auto_13588 - HOIST
      ?auto_13589 - PLACE
      ?auto_13591 - PLACE
      ?auto_13592 - HOIST
      ?auto_13593 - SURFACE
      ?auto_13590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13588 ?auto_13589 ) ( SURFACE-AT ?auto_13586 ?auto_13589 ) ( CLEAR ?auto_13586 ) ( IS-CRATE ?auto_13587 ) ( AVAILABLE ?auto_13588 ) ( not ( = ?auto_13591 ?auto_13589 ) ) ( HOIST-AT ?auto_13592 ?auto_13591 ) ( AVAILABLE ?auto_13592 ) ( SURFACE-AT ?auto_13587 ?auto_13591 ) ( ON ?auto_13587 ?auto_13593 ) ( CLEAR ?auto_13587 ) ( TRUCK-AT ?auto_13590 ?auto_13589 ) ( not ( = ?auto_13586 ?auto_13587 ) ) ( not ( = ?auto_13586 ?auto_13593 ) ) ( not ( = ?auto_13587 ?auto_13593 ) ) ( not ( = ?auto_13588 ?auto_13592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13590 ?auto_13589 ?auto_13591 )
      ( !LIFT ?auto_13592 ?auto_13587 ?auto_13593 ?auto_13591 )
      ( !LOAD ?auto_13592 ?auto_13587 ?auto_13590 ?auto_13591 )
      ( !DRIVE ?auto_13590 ?auto_13591 ?auto_13589 )
      ( !UNLOAD ?auto_13588 ?auto_13587 ?auto_13590 ?auto_13589 )
      ( !DROP ?auto_13588 ?auto_13587 ?auto_13586 ?auto_13589 )
      ( MAKE-1CRATE-VERIFY ?auto_13586 ?auto_13587 ) )
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
      ?auto_13611 - HOIST
      ?auto_13608 - PLACE
      ?auto_13613 - PLACE
      ?auto_13612 - HOIST
      ?auto_13610 - SURFACE
      ?auto_13624 - PLACE
      ?auto_13627 - HOIST
      ?auto_13625 - SURFACE
      ?auto_13614 - PLACE
      ?auto_13622 - HOIST
      ?auto_13617 - SURFACE
      ?auto_13620 - PLACE
      ?auto_13618 - HOIST
      ?auto_13621 - SURFACE
      ?auto_13619 - PLACE
      ?auto_13628 - HOIST
      ?auto_13615 - SURFACE
      ?auto_13623 - PLACE
      ?auto_13626 - HOIST
      ?auto_13616 - SURFACE
      ?auto_13609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13611 ?auto_13608 ) ( IS-CRATE ?auto_13607 ) ( not ( = ?auto_13613 ?auto_13608 ) ) ( HOIST-AT ?auto_13612 ?auto_13613 ) ( AVAILABLE ?auto_13612 ) ( SURFACE-AT ?auto_13607 ?auto_13613 ) ( ON ?auto_13607 ?auto_13610 ) ( CLEAR ?auto_13607 ) ( not ( = ?auto_13606 ?auto_13607 ) ) ( not ( = ?auto_13606 ?auto_13610 ) ) ( not ( = ?auto_13607 ?auto_13610 ) ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( IS-CRATE ?auto_13606 ) ( not ( = ?auto_13624 ?auto_13608 ) ) ( HOIST-AT ?auto_13627 ?auto_13624 ) ( AVAILABLE ?auto_13627 ) ( SURFACE-AT ?auto_13606 ?auto_13624 ) ( ON ?auto_13606 ?auto_13625 ) ( CLEAR ?auto_13606 ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( not ( = ?auto_13605 ?auto_13625 ) ) ( not ( = ?auto_13606 ?auto_13625 ) ) ( not ( = ?auto_13611 ?auto_13627 ) ) ( IS-CRATE ?auto_13605 ) ( not ( = ?auto_13614 ?auto_13608 ) ) ( HOIST-AT ?auto_13622 ?auto_13614 ) ( AVAILABLE ?auto_13622 ) ( SURFACE-AT ?auto_13605 ?auto_13614 ) ( ON ?auto_13605 ?auto_13617 ) ( CLEAR ?auto_13605 ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13617 ) ) ( not ( = ?auto_13605 ?auto_13617 ) ) ( not ( = ?auto_13611 ?auto_13622 ) ) ( IS-CRATE ?auto_13604 ) ( not ( = ?auto_13620 ?auto_13608 ) ) ( HOIST-AT ?auto_13618 ?auto_13620 ) ( AVAILABLE ?auto_13618 ) ( SURFACE-AT ?auto_13604 ?auto_13620 ) ( ON ?auto_13604 ?auto_13621 ) ( CLEAR ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13621 ) ) ( not ( = ?auto_13604 ?auto_13621 ) ) ( not ( = ?auto_13611 ?auto_13618 ) ) ( IS-CRATE ?auto_13603 ) ( not ( = ?auto_13619 ?auto_13608 ) ) ( HOIST-AT ?auto_13628 ?auto_13619 ) ( AVAILABLE ?auto_13628 ) ( SURFACE-AT ?auto_13603 ?auto_13619 ) ( ON ?auto_13603 ?auto_13615 ) ( CLEAR ?auto_13603 ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13615 ) ) ( not ( = ?auto_13603 ?auto_13615 ) ) ( not ( = ?auto_13611 ?auto_13628 ) ) ( SURFACE-AT ?auto_13601 ?auto_13608 ) ( CLEAR ?auto_13601 ) ( IS-CRATE ?auto_13602 ) ( AVAILABLE ?auto_13611 ) ( not ( = ?auto_13623 ?auto_13608 ) ) ( HOIST-AT ?auto_13626 ?auto_13623 ) ( AVAILABLE ?auto_13626 ) ( SURFACE-AT ?auto_13602 ?auto_13623 ) ( ON ?auto_13602 ?auto_13616 ) ( CLEAR ?auto_13602 ) ( TRUCK-AT ?auto_13609 ?auto_13608 ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13616 ) ) ( not ( = ?auto_13602 ?auto_13616 ) ) ( not ( = ?auto_13611 ?auto_13626 ) ) ( not ( = ?auto_13601 ?auto_13603 ) ) ( not ( = ?auto_13601 ?auto_13615 ) ) ( not ( = ?auto_13603 ?auto_13616 ) ) ( not ( = ?auto_13619 ?auto_13623 ) ) ( not ( = ?auto_13628 ?auto_13626 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13601 ?auto_13604 ) ) ( not ( = ?auto_13601 ?auto_13621 ) ) ( not ( = ?auto_13602 ?auto_13604 ) ) ( not ( = ?auto_13602 ?auto_13621 ) ) ( not ( = ?auto_13604 ?auto_13615 ) ) ( not ( = ?auto_13604 ?auto_13616 ) ) ( not ( = ?auto_13620 ?auto_13619 ) ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( not ( = ?auto_13618 ?auto_13628 ) ) ( not ( = ?auto_13618 ?auto_13626 ) ) ( not ( = ?auto_13621 ?auto_13615 ) ) ( not ( = ?auto_13621 ?auto_13616 ) ) ( not ( = ?auto_13601 ?auto_13605 ) ) ( not ( = ?auto_13601 ?auto_13617 ) ) ( not ( = ?auto_13602 ?auto_13605 ) ) ( not ( = ?auto_13602 ?auto_13617 ) ) ( not ( = ?auto_13603 ?auto_13605 ) ) ( not ( = ?auto_13603 ?auto_13617 ) ) ( not ( = ?auto_13605 ?auto_13621 ) ) ( not ( = ?auto_13605 ?auto_13615 ) ) ( not ( = ?auto_13605 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13620 ) ) ( not ( = ?auto_13614 ?auto_13619 ) ) ( not ( = ?auto_13614 ?auto_13623 ) ) ( not ( = ?auto_13622 ?auto_13618 ) ) ( not ( = ?auto_13622 ?auto_13628 ) ) ( not ( = ?auto_13622 ?auto_13626 ) ) ( not ( = ?auto_13617 ?auto_13621 ) ) ( not ( = ?auto_13617 ?auto_13615 ) ) ( not ( = ?auto_13617 ?auto_13616 ) ) ( not ( = ?auto_13601 ?auto_13606 ) ) ( not ( = ?auto_13601 ?auto_13625 ) ) ( not ( = ?auto_13602 ?auto_13606 ) ) ( not ( = ?auto_13602 ?auto_13625 ) ) ( not ( = ?auto_13603 ?auto_13606 ) ) ( not ( = ?auto_13603 ?auto_13625 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13625 ) ) ( not ( = ?auto_13606 ?auto_13617 ) ) ( not ( = ?auto_13606 ?auto_13621 ) ) ( not ( = ?auto_13606 ?auto_13615 ) ) ( not ( = ?auto_13606 ?auto_13616 ) ) ( not ( = ?auto_13624 ?auto_13614 ) ) ( not ( = ?auto_13624 ?auto_13620 ) ) ( not ( = ?auto_13624 ?auto_13619 ) ) ( not ( = ?auto_13624 ?auto_13623 ) ) ( not ( = ?auto_13627 ?auto_13622 ) ) ( not ( = ?auto_13627 ?auto_13618 ) ) ( not ( = ?auto_13627 ?auto_13628 ) ) ( not ( = ?auto_13627 ?auto_13626 ) ) ( not ( = ?auto_13625 ?auto_13617 ) ) ( not ( = ?auto_13625 ?auto_13621 ) ) ( not ( = ?auto_13625 ?auto_13615 ) ) ( not ( = ?auto_13625 ?auto_13616 ) ) ( not ( = ?auto_13601 ?auto_13607 ) ) ( not ( = ?auto_13601 ?auto_13610 ) ) ( not ( = ?auto_13602 ?auto_13607 ) ) ( not ( = ?auto_13602 ?auto_13610 ) ) ( not ( = ?auto_13603 ?auto_13607 ) ) ( not ( = ?auto_13603 ?auto_13610 ) ) ( not ( = ?auto_13604 ?auto_13607 ) ) ( not ( = ?auto_13604 ?auto_13610 ) ) ( not ( = ?auto_13605 ?auto_13607 ) ) ( not ( = ?auto_13605 ?auto_13610 ) ) ( not ( = ?auto_13607 ?auto_13625 ) ) ( not ( = ?auto_13607 ?auto_13617 ) ) ( not ( = ?auto_13607 ?auto_13621 ) ) ( not ( = ?auto_13607 ?auto_13615 ) ) ( not ( = ?auto_13607 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13624 ) ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13620 ) ) ( not ( = ?auto_13613 ?auto_13619 ) ) ( not ( = ?auto_13613 ?auto_13623 ) ) ( not ( = ?auto_13612 ?auto_13627 ) ) ( not ( = ?auto_13612 ?auto_13622 ) ) ( not ( = ?auto_13612 ?auto_13618 ) ) ( not ( = ?auto_13612 ?auto_13628 ) ) ( not ( = ?auto_13612 ?auto_13626 ) ) ( not ( = ?auto_13610 ?auto_13625 ) ) ( not ( = ?auto_13610 ?auto_13617 ) ) ( not ( = ?auto_13610 ?auto_13621 ) ) ( not ( = ?auto_13610 ?auto_13615 ) ) ( not ( = ?auto_13610 ?auto_13616 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13604 ?auto_13605 ?auto_13606 )
      ( MAKE-1CRATE ?auto_13606 ?auto_13607 )
      ( MAKE-6CRATE-VERIFY ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13604 ?auto_13605 ?auto_13606 ?auto_13607 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13631 - SURFACE
      ?auto_13632 - SURFACE
    )
    :vars
    (
      ?auto_13633 - HOIST
      ?auto_13634 - PLACE
      ?auto_13636 - PLACE
      ?auto_13637 - HOIST
      ?auto_13638 - SURFACE
      ?auto_13635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13633 ?auto_13634 ) ( SURFACE-AT ?auto_13631 ?auto_13634 ) ( CLEAR ?auto_13631 ) ( IS-CRATE ?auto_13632 ) ( AVAILABLE ?auto_13633 ) ( not ( = ?auto_13636 ?auto_13634 ) ) ( HOIST-AT ?auto_13637 ?auto_13636 ) ( AVAILABLE ?auto_13637 ) ( SURFACE-AT ?auto_13632 ?auto_13636 ) ( ON ?auto_13632 ?auto_13638 ) ( CLEAR ?auto_13632 ) ( TRUCK-AT ?auto_13635 ?auto_13634 ) ( not ( = ?auto_13631 ?auto_13632 ) ) ( not ( = ?auto_13631 ?auto_13638 ) ) ( not ( = ?auto_13632 ?auto_13638 ) ) ( not ( = ?auto_13633 ?auto_13637 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13635 ?auto_13634 ?auto_13636 )
      ( !LIFT ?auto_13637 ?auto_13632 ?auto_13638 ?auto_13636 )
      ( !LOAD ?auto_13637 ?auto_13632 ?auto_13635 ?auto_13636 )
      ( !DRIVE ?auto_13635 ?auto_13636 ?auto_13634 )
      ( !UNLOAD ?auto_13633 ?auto_13632 ?auto_13635 ?auto_13634 )
      ( !DROP ?auto_13633 ?auto_13632 ?auto_13631 ?auto_13634 )
      ( MAKE-1CRATE-VERIFY ?auto_13631 ?auto_13632 ) )
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
      ?auto_13654 - SURFACE
      ?auto_13653 - SURFACE
    )
    :vars
    (
      ?auto_13657 - HOIST
      ?auto_13659 - PLACE
      ?auto_13658 - PLACE
      ?auto_13655 - HOIST
      ?auto_13660 - SURFACE
      ?auto_13662 - PLACE
      ?auto_13661 - HOIST
      ?auto_13663 - SURFACE
      ?auto_13670 - PLACE
      ?auto_13674 - HOIST
      ?auto_13672 - SURFACE
      ?auto_13668 - PLACE
      ?auto_13669 - HOIST
      ?auto_13664 - SURFACE
      ?auto_13675 - SURFACE
      ?auto_13676 - PLACE
      ?auto_13667 - HOIST
      ?auto_13665 - SURFACE
      ?auto_13671 - PLACE
      ?auto_13673 - HOIST
      ?auto_13666 - SURFACE
      ?auto_13656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13657 ?auto_13659 ) ( IS-CRATE ?auto_13653 ) ( not ( = ?auto_13658 ?auto_13659 ) ) ( HOIST-AT ?auto_13655 ?auto_13658 ) ( SURFACE-AT ?auto_13653 ?auto_13658 ) ( ON ?auto_13653 ?auto_13660 ) ( CLEAR ?auto_13653 ) ( not ( = ?auto_13654 ?auto_13653 ) ) ( not ( = ?auto_13654 ?auto_13660 ) ) ( not ( = ?auto_13653 ?auto_13660 ) ) ( not ( = ?auto_13657 ?auto_13655 ) ) ( IS-CRATE ?auto_13654 ) ( not ( = ?auto_13662 ?auto_13659 ) ) ( HOIST-AT ?auto_13661 ?auto_13662 ) ( AVAILABLE ?auto_13661 ) ( SURFACE-AT ?auto_13654 ?auto_13662 ) ( ON ?auto_13654 ?auto_13663 ) ( CLEAR ?auto_13654 ) ( not ( = ?auto_13652 ?auto_13654 ) ) ( not ( = ?auto_13652 ?auto_13663 ) ) ( not ( = ?auto_13654 ?auto_13663 ) ) ( not ( = ?auto_13657 ?auto_13661 ) ) ( IS-CRATE ?auto_13652 ) ( not ( = ?auto_13670 ?auto_13659 ) ) ( HOIST-AT ?auto_13674 ?auto_13670 ) ( AVAILABLE ?auto_13674 ) ( SURFACE-AT ?auto_13652 ?auto_13670 ) ( ON ?auto_13652 ?auto_13672 ) ( CLEAR ?auto_13652 ) ( not ( = ?auto_13651 ?auto_13652 ) ) ( not ( = ?auto_13651 ?auto_13672 ) ) ( not ( = ?auto_13652 ?auto_13672 ) ) ( not ( = ?auto_13657 ?auto_13674 ) ) ( IS-CRATE ?auto_13651 ) ( not ( = ?auto_13668 ?auto_13659 ) ) ( HOIST-AT ?auto_13669 ?auto_13668 ) ( AVAILABLE ?auto_13669 ) ( SURFACE-AT ?auto_13651 ?auto_13668 ) ( ON ?auto_13651 ?auto_13664 ) ( CLEAR ?auto_13651 ) ( not ( = ?auto_13650 ?auto_13651 ) ) ( not ( = ?auto_13650 ?auto_13664 ) ) ( not ( = ?auto_13651 ?auto_13664 ) ) ( not ( = ?auto_13657 ?auto_13669 ) ) ( IS-CRATE ?auto_13650 ) ( AVAILABLE ?auto_13655 ) ( SURFACE-AT ?auto_13650 ?auto_13658 ) ( ON ?auto_13650 ?auto_13675 ) ( CLEAR ?auto_13650 ) ( not ( = ?auto_13649 ?auto_13650 ) ) ( not ( = ?auto_13649 ?auto_13675 ) ) ( not ( = ?auto_13650 ?auto_13675 ) ) ( IS-CRATE ?auto_13649 ) ( not ( = ?auto_13676 ?auto_13659 ) ) ( HOIST-AT ?auto_13667 ?auto_13676 ) ( AVAILABLE ?auto_13667 ) ( SURFACE-AT ?auto_13649 ?auto_13676 ) ( ON ?auto_13649 ?auto_13665 ) ( CLEAR ?auto_13649 ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( not ( = ?auto_13648 ?auto_13665 ) ) ( not ( = ?auto_13649 ?auto_13665 ) ) ( not ( = ?auto_13657 ?auto_13667 ) ) ( SURFACE-AT ?auto_13647 ?auto_13659 ) ( CLEAR ?auto_13647 ) ( IS-CRATE ?auto_13648 ) ( AVAILABLE ?auto_13657 ) ( not ( = ?auto_13671 ?auto_13659 ) ) ( HOIST-AT ?auto_13673 ?auto_13671 ) ( AVAILABLE ?auto_13673 ) ( SURFACE-AT ?auto_13648 ?auto_13671 ) ( ON ?auto_13648 ?auto_13666 ) ( CLEAR ?auto_13648 ) ( TRUCK-AT ?auto_13656 ?auto_13659 ) ( not ( = ?auto_13647 ?auto_13648 ) ) ( not ( = ?auto_13647 ?auto_13666 ) ) ( not ( = ?auto_13648 ?auto_13666 ) ) ( not ( = ?auto_13657 ?auto_13673 ) ) ( not ( = ?auto_13647 ?auto_13649 ) ) ( not ( = ?auto_13647 ?auto_13665 ) ) ( not ( = ?auto_13649 ?auto_13666 ) ) ( not ( = ?auto_13676 ?auto_13671 ) ) ( not ( = ?auto_13667 ?auto_13673 ) ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13647 ?auto_13650 ) ) ( not ( = ?auto_13647 ?auto_13675 ) ) ( not ( = ?auto_13648 ?auto_13650 ) ) ( not ( = ?auto_13648 ?auto_13675 ) ) ( not ( = ?auto_13650 ?auto_13665 ) ) ( not ( = ?auto_13650 ?auto_13666 ) ) ( not ( = ?auto_13658 ?auto_13676 ) ) ( not ( = ?auto_13658 ?auto_13671 ) ) ( not ( = ?auto_13655 ?auto_13667 ) ) ( not ( = ?auto_13655 ?auto_13673 ) ) ( not ( = ?auto_13675 ?auto_13665 ) ) ( not ( = ?auto_13675 ?auto_13666 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) ( not ( = ?auto_13647 ?auto_13664 ) ) ( not ( = ?auto_13648 ?auto_13651 ) ) ( not ( = ?auto_13648 ?auto_13664 ) ) ( not ( = ?auto_13649 ?auto_13651 ) ) ( not ( = ?auto_13649 ?auto_13664 ) ) ( not ( = ?auto_13651 ?auto_13675 ) ) ( not ( = ?auto_13651 ?auto_13665 ) ) ( not ( = ?auto_13651 ?auto_13666 ) ) ( not ( = ?auto_13668 ?auto_13658 ) ) ( not ( = ?auto_13668 ?auto_13676 ) ) ( not ( = ?auto_13668 ?auto_13671 ) ) ( not ( = ?auto_13669 ?auto_13655 ) ) ( not ( = ?auto_13669 ?auto_13667 ) ) ( not ( = ?auto_13669 ?auto_13673 ) ) ( not ( = ?auto_13664 ?auto_13675 ) ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13647 ?auto_13652 ) ) ( not ( = ?auto_13647 ?auto_13672 ) ) ( not ( = ?auto_13648 ?auto_13652 ) ) ( not ( = ?auto_13648 ?auto_13672 ) ) ( not ( = ?auto_13649 ?auto_13652 ) ) ( not ( = ?auto_13649 ?auto_13672 ) ) ( not ( = ?auto_13650 ?auto_13652 ) ) ( not ( = ?auto_13650 ?auto_13672 ) ) ( not ( = ?auto_13652 ?auto_13664 ) ) ( not ( = ?auto_13652 ?auto_13675 ) ) ( not ( = ?auto_13652 ?auto_13665 ) ) ( not ( = ?auto_13652 ?auto_13666 ) ) ( not ( = ?auto_13670 ?auto_13668 ) ) ( not ( = ?auto_13670 ?auto_13658 ) ) ( not ( = ?auto_13670 ?auto_13676 ) ) ( not ( = ?auto_13670 ?auto_13671 ) ) ( not ( = ?auto_13674 ?auto_13669 ) ) ( not ( = ?auto_13674 ?auto_13655 ) ) ( not ( = ?auto_13674 ?auto_13667 ) ) ( not ( = ?auto_13674 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13664 ) ) ( not ( = ?auto_13672 ?auto_13675 ) ) ( not ( = ?auto_13672 ?auto_13665 ) ) ( not ( = ?auto_13672 ?auto_13666 ) ) ( not ( = ?auto_13647 ?auto_13654 ) ) ( not ( = ?auto_13647 ?auto_13663 ) ) ( not ( = ?auto_13648 ?auto_13654 ) ) ( not ( = ?auto_13648 ?auto_13663 ) ) ( not ( = ?auto_13649 ?auto_13654 ) ) ( not ( = ?auto_13649 ?auto_13663 ) ) ( not ( = ?auto_13650 ?auto_13654 ) ) ( not ( = ?auto_13650 ?auto_13663 ) ) ( not ( = ?auto_13651 ?auto_13654 ) ) ( not ( = ?auto_13651 ?auto_13663 ) ) ( not ( = ?auto_13654 ?auto_13672 ) ) ( not ( = ?auto_13654 ?auto_13664 ) ) ( not ( = ?auto_13654 ?auto_13675 ) ) ( not ( = ?auto_13654 ?auto_13665 ) ) ( not ( = ?auto_13654 ?auto_13666 ) ) ( not ( = ?auto_13662 ?auto_13670 ) ) ( not ( = ?auto_13662 ?auto_13668 ) ) ( not ( = ?auto_13662 ?auto_13658 ) ) ( not ( = ?auto_13662 ?auto_13676 ) ) ( not ( = ?auto_13662 ?auto_13671 ) ) ( not ( = ?auto_13661 ?auto_13674 ) ) ( not ( = ?auto_13661 ?auto_13669 ) ) ( not ( = ?auto_13661 ?auto_13655 ) ) ( not ( = ?auto_13661 ?auto_13667 ) ) ( not ( = ?auto_13661 ?auto_13673 ) ) ( not ( = ?auto_13663 ?auto_13672 ) ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13663 ?auto_13675 ) ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( not ( = ?auto_13647 ?auto_13653 ) ) ( not ( = ?auto_13647 ?auto_13660 ) ) ( not ( = ?auto_13648 ?auto_13653 ) ) ( not ( = ?auto_13648 ?auto_13660 ) ) ( not ( = ?auto_13649 ?auto_13653 ) ) ( not ( = ?auto_13649 ?auto_13660 ) ) ( not ( = ?auto_13650 ?auto_13653 ) ) ( not ( = ?auto_13650 ?auto_13660 ) ) ( not ( = ?auto_13651 ?auto_13653 ) ) ( not ( = ?auto_13651 ?auto_13660 ) ) ( not ( = ?auto_13652 ?auto_13653 ) ) ( not ( = ?auto_13652 ?auto_13660 ) ) ( not ( = ?auto_13653 ?auto_13663 ) ) ( not ( = ?auto_13653 ?auto_13672 ) ) ( not ( = ?auto_13653 ?auto_13664 ) ) ( not ( = ?auto_13653 ?auto_13675 ) ) ( not ( = ?auto_13653 ?auto_13665 ) ) ( not ( = ?auto_13653 ?auto_13666 ) ) ( not ( = ?auto_13660 ?auto_13663 ) ) ( not ( = ?auto_13660 ?auto_13672 ) ) ( not ( = ?auto_13660 ?auto_13664 ) ) ( not ( = ?auto_13660 ?auto_13675 ) ) ( not ( = ?auto_13660 ?auto_13665 ) ) ( not ( = ?auto_13660 ?auto_13666 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13654 )
      ( MAKE-1CRATE ?auto_13654 ?auto_13653 )
      ( MAKE-7CRATE-VERIFY ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13650 ?auto_13651 ?auto_13652 ?auto_13654 ?auto_13653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13679 - SURFACE
      ?auto_13680 - SURFACE
    )
    :vars
    (
      ?auto_13681 - HOIST
      ?auto_13682 - PLACE
      ?auto_13684 - PLACE
      ?auto_13685 - HOIST
      ?auto_13686 - SURFACE
      ?auto_13683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13681 ?auto_13682 ) ( SURFACE-AT ?auto_13679 ?auto_13682 ) ( CLEAR ?auto_13679 ) ( IS-CRATE ?auto_13680 ) ( AVAILABLE ?auto_13681 ) ( not ( = ?auto_13684 ?auto_13682 ) ) ( HOIST-AT ?auto_13685 ?auto_13684 ) ( AVAILABLE ?auto_13685 ) ( SURFACE-AT ?auto_13680 ?auto_13684 ) ( ON ?auto_13680 ?auto_13686 ) ( CLEAR ?auto_13680 ) ( TRUCK-AT ?auto_13683 ?auto_13682 ) ( not ( = ?auto_13679 ?auto_13680 ) ) ( not ( = ?auto_13679 ?auto_13686 ) ) ( not ( = ?auto_13680 ?auto_13686 ) ) ( not ( = ?auto_13681 ?auto_13685 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13683 ?auto_13682 ?auto_13684 )
      ( !LIFT ?auto_13685 ?auto_13680 ?auto_13686 ?auto_13684 )
      ( !LOAD ?auto_13685 ?auto_13680 ?auto_13683 ?auto_13684 )
      ( !DRIVE ?auto_13683 ?auto_13684 ?auto_13682 )
      ( !UNLOAD ?auto_13681 ?auto_13680 ?auto_13683 ?auto_13682 )
      ( !DROP ?auto_13681 ?auto_13680 ?auto_13679 ?auto_13682 )
      ( MAKE-1CRATE-VERIFY ?auto_13679 ?auto_13680 ) )
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
      ?auto_13704 - SURFACE
      ?auto_13703 - SURFACE
      ?auto_13702 - SURFACE
    )
    :vars
    (
      ?auto_13708 - HOIST
      ?auto_13706 - PLACE
      ?auto_13707 - PLACE
      ?auto_13709 - HOIST
      ?auto_13710 - SURFACE
      ?auto_13724 - PLACE
      ?auto_13726 - HOIST
      ?auto_13725 - SURFACE
      ?auto_13728 - PLACE
      ?auto_13712 - HOIST
      ?auto_13729 - SURFACE
      ?auto_13716 - PLACE
      ?auto_13719 - HOIST
      ?auto_13717 - SURFACE
      ?auto_13720 - PLACE
      ?auto_13714 - HOIST
      ?auto_13727 - SURFACE
      ?auto_13711 - SURFACE
      ?auto_13713 - PLACE
      ?auto_13721 - HOIST
      ?auto_13723 - SURFACE
      ?auto_13715 - PLACE
      ?auto_13718 - HOIST
      ?auto_13722 - SURFACE
      ?auto_13705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13708 ?auto_13706 ) ( IS-CRATE ?auto_13702 ) ( not ( = ?auto_13707 ?auto_13706 ) ) ( HOIST-AT ?auto_13709 ?auto_13707 ) ( AVAILABLE ?auto_13709 ) ( SURFACE-AT ?auto_13702 ?auto_13707 ) ( ON ?auto_13702 ?auto_13710 ) ( CLEAR ?auto_13702 ) ( not ( = ?auto_13703 ?auto_13702 ) ) ( not ( = ?auto_13703 ?auto_13710 ) ) ( not ( = ?auto_13702 ?auto_13710 ) ) ( not ( = ?auto_13708 ?auto_13709 ) ) ( IS-CRATE ?auto_13703 ) ( not ( = ?auto_13724 ?auto_13706 ) ) ( HOIST-AT ?auto_13726 ?auto_13724 ) ( SURFACE-AT ?auto_13703 ?auto_13724 ) ( ON ?auto_13703 ?auto_13725 ) ( CLEAR ?auto_13703 ) ( not ( = ?auto_13704 ?auto_13703 ) ) ( not ( = ?auto_13704 ?auto_13725 ) ) ( not ( = ?auto_13703 ?auto_13725 ) ) ( not ( = ?auto_13708 ?auto_13726 ) ) ( IS-CRATE ?auto_13704 ) ( not ( = ?auto_13728 ?auto_13706 ) ) ( HOIST-AT ?auto_13712 ?auto_13728 ) ( AVAILABLE ?auto_13712 ) ( SURFACE-AT ?auto_13704 ?auto_13728 ) ( ON ?auto_13704 ?auto_13729 ) ( CLEAR ?auto_13704 ) ( not ( = ?auto_13701 ?auto_13704 ) ) ( not ( = ?auto_13701 ?auto_13729 ) ) ( not ( = ?auto_13704 ?auto_13729 ) ) ( not ( = ?auto_13708 ?auto_13712 ) ) ( IS-CRATE ?auto_13701 ) ( not ( = ?auto_13716 ?auto_13706 ) ) ( HOIST-AT ?auto_13719 ?auto_13716 ) ( AVAILABLE ?auto_13719 ) ( SURFACE-AT ?auto_13701 ?auto_13716 ) ( ON ?auto_13701 ?auto_13717 ) ( CLEAR ?auto_13701 ) ( not ( = ?auto_13700 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13717 ) ) ( not ( = ?auto_13701 ?auto_13717 ) ) ( not ( = ?auto_13708 ?auto_13719 ) ) ( IS-CRATE ?auto_13700 ) ( not ( = ?auto_13720 ?auto_13706 ) ) ( HOIST-AT ?auto_13714 ?auto_13720 ) ( AVAILABLE ?auto_13714 ) ( SURFACE-AT ?auto_13700 ?auto_13720 ) ( ON ?auto_13700 ?auto_13727 ) ( CLEAR ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( not ( = ?auto_13699 ?auto_13727 ) ) ( not ( = ?auto_13700 ?auto_13727 ) ) ( not ( = ?auto_13708 ?auto_13714 ) ) ( IS-CRATE ?auto_13699 ) ( AVAILABLE ?auto_13726 ) ( SURFACE-AT ?auto_13699 ?auto_13724 ) ( ON ?auto_13699 ?auto_13711 ) ( CLEAR ?auto_13699 ) ( not ( = ?auto_13698 ?auto_13699 ) ) ( not ( = ?auto_13698 ?auto_13711 ) ) ( not ( = ?auto_13699 ?auto_13711 ) ) ( IS-CRATE ?auto_13698 ) ( not ( = ?auto_13713 ?auto_13706 ) ) ( HOIST-AT ?auto_13721 ?auto_13713 ) ( AVAILABLE ?auto_13721 ) ( SURFACE-AT ?auto_13698 ?auto_13713 ) ( ON ?auto_13698 ?auto_13723 ) ( CLEAR ?auto_13698 ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13723 ) ) ( not ( = ?auto_13698 ?auto_13723 ) ) ( not ( = ?auto_13708 ?auto_13721 ) ) ( SURFACE-AT ?auto_13696 ?auto_13706 ) ( CLEAR ?auto_13696 ) ( IS-CRATE ?auto_13697 ) ( AVAILABLE ?auto_13708 ) ( not ( = ?auto_13715 ?auto_13706 ) ) ( HOIST-AT ?auto_13718 ?auto_13715 ) ( AVAILABLE ?auto_13718 ) ( SURFACE-AT ?auto_13697 ?auto_13715 ) ( ON ?auto_13697 ?auto_13722 ) ( CLEAR ?auto_13697 ) ( TRUCK-AT ?auto_13705 ?auto_13706 ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( not ( = ?auto_13696 ?auto_13722 ) ) ( not ( = ?auto_13697 ?auto_13722 ) ) ( not ( = ?auto_13708 ?auto_13718 ) ) ( not ( = ?auto_13696 ?auto_13698 ) ) ( not ( = ?auto_13696 ?auto_13723 ) ) ( not ( = ?auto_13698 ?auto_13722 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) ( not ( = ?auto_13721 ?auto_13718 ) ) ( not ( = ?auto_13723 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13699 ) ) ( not ( = ?auto_13696 ?auto_13711 ) ) ( not ( = ?auto_13697 ?auto_13699 ) ) ( not ( = ?auto_13697 ?auto_13711 ) ) ( not ( = ?auto_13699 ?auto_13723 ) ) ( not ( = ?auto_13699 ?auto_13722 ) ) ( not ( = ?auto_13724 ?auto_13713 ) ) ( not ( = ?auto_13724 ?auto_13715 ) ) ( not ( = ?auto_13726 ?auto_13721 ) ) ( not ( = ?auto_13726 ?auto_13718 ) ) ( not ( = ?auto_13711 ?auto_13723 ) ) ( not ( = ?auto_13711 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13696 ?auto_13727 ) ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( not ( = ?auto_13697 ?auto_13727 ) ) ( not ( = ?auto_13698 ?auto_13700 ) ) ( not ( = ?auto_13698 ?auto_13727 ) ) ( not ( = ?auto_13700 ?auto_13711 ) ) ( not ( = ?auto_13700 ?auto_13723 ) ) ( not ( = ?auto_13700 ?auto_13722 ) ) ( not ( = ?auto_13720 ?auto_13724 ) ) ( not ( = ?auto_13720 ?auto_13713 ) ) ( not ( = ?auto_13720 ?auto_13715 ) ) ( not ( = ?auto_13714 ?auto_13726 ) ) ( not ( = ?auto_13714 ?auto_13721 ) ) ( not ( = ?auto_13714 ?auto_13718 ) ) ( not ( = ?auto_13727 ?auto_13711 ) ) ( not ( = ?auto_13727 ?auto_13723 ) ) ( not ( = ?auto_13727 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13701 ) ) ( not ( = ?auto_13696 ?auto_13717 ) ) ( not ( = ?auto_13697 ?auto_13701 ) ) ( not ( = ?auto_13697 ?auto_13717 ) ) ( not ( = ?auto_13698 ?auto_13701 ) ) ( not ( = ?auto_13698 ?auto_13717 ) ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( not ( = ?auto_13699 ?auto_13717 ) ) ( not ( = ?auto_13701 ?auto_13727 ) ) ( not ( = ?auto_13701 ?auto_13711 ) ) ( not ( = ?auto_13701 ?auto_13723 ) ) ( not ( = ?auto_13701 ?auto_13722 ) ) ( not ( = ?auto_13716 ?auto_13720 ) ) ( not ( = ?auto_13716 ?auto_13724 ) ) ( not ( = ?auto_13716 ?auto_13713 ) ) ( not ( = ?auto_13716 ?auto_13715 ) ) ( not ( = ?auto_13719 ?auto_13714 ) ) ( not ( = ?auto_13719 ?auto_13726 ) ) ( not ( = ?auto_13719 ?auto_13721 ) ) ( not ( = ?auto_13719 ?auto_13718 ) ) ( not ( = ?auto_13717 ?auto_13727 ) ) ( not ( = ?auto_13717 ?auto_13711 ) ) ( not ( = ?auto_13717 ?auto_13723 ) ) ( not ( = ?auto_13717 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13704 ) ) ( not ( = ?auto_13696 ?auto_13729 ) ) ( not ( = ?auto_13697 ?auto_13704 ) ) ( not ( = ?auto_13697 ?auto_13729 ) ) ( not ( = ?auto_13698 ?auto_13704 ) ) ( not ( = ?auto_13698 ?auto_13729 ) ) ( not ( = ?auto_13699 ?auto_13704 ) ) ( not ( = ?auto_13699 ?auto_13729 ) ) ( not ( = ?auto_13700 ?auto_13704 ) ) ( not ( = ?auto_13700 ?auto_13729 ) ) ( not ( = ?auto_13704 ?auto_13717 ) ) ( not ( = ?auto_13704 ?auto_13727 ) ) ( not ( = ?auto_13704 ?auto_13711 ) ) ( not ( = ?auto_13704 ?auto_13723 ) ) ( not ( = ?auto_13704 ?auto_13722 ) ) ( not ( = ?auto_13728 ?auto_13716 ) ) ( not ( = ?auto_13728 ?auto_13720 ) ) ( not ( = ?auto_13728 ?auto_13724 ) ) ( not ( = ?auto_13728 ?auto_13713 ) ) ( not ( = ?auto_13728 ?auto_13715 ) ) ( not ( = ?auto_13712 ?auto_13719 ) ) ( not ( = ?auto_13712 ?auto_13714 ) ) ( not ( = ?auto_13712 ?auto_13726 ) ) ( not ( = ?auto_13712 ?auto_13721 ) ) ( not ( = ?auto_13712 ?auto_13718 ) ) ( not ( = ?auto_13729 ?auto_13717 ) ) ( not ( = ?auto_13729 ?auto_13727 ) ) ( not ( = ?auto_13729 ?auto_13711 ) ) ( not ( = ?auto_13729 ?auto_13723 ) ) ( not ( = ?auto_13729 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13703 ) ) ( not ( = ?auto_13696 ?auto_13725 ) ) ( not ( = ?auto_13697 ?auto_13703 ) ) ( not ( = ?auto_13697 ?auto_13725 ) ) ( not ( = ?auto_13698 ?auto_13703 ) ) ( not ( = ?auto_13698 ?auto_13725 ) ) ( not ( = ?auto_13699 ?auto_13703 ) ) ( not ( = ?auto_13699 ?auto_13725 ) ) ( not ( = ?auto_13700 ?auto_13703 ) ) ( not ( = ?auto_13700 ?auto_13725 ) ) ( not ( = ?auto_13701 ?auto_13703 ) ) ( not ( = ?auto_13701 ?auto_13725 ) ) ( not ( = ?auto_13703 ?auto_13729 ) ) ( not ( = ?auto_13703 ?auto_13717 ) ) ( not ( = ?auto_13703 ?auto_13727 ) ) ( not ( = ?auto_13703 ?auto_13711 ) ) ( not ( = ?auto_13703 ?auto_13723 ) ) ( not ( = ?auto_13703 ?auto_13722 ) ) ( not ( = ?auto_13725 ?auto_13729 ) ) ( not ( = ?auto_13725 ?auto_13717 ) ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13725 ?auto_13711 ) ) ( not ( = ?auto_13725 ?auto_13723 ) ) ( not ( = ?auto_13725 ?auto_13722 ) ) ( not ( = ?auto_13696 ?auto_13702 ) ) ( not ( = ?auto_13696 ?auto_13710 ) ) ( not ( = ?auto_13697 ?auto_13702 ) ) ( not ( = ?auto_13697 ?auto_13710 ) ) ( not ( = ?auto_13698 ?auto_13702 ) ) ( not ( = ?auto_13698 ?auto_13710 ) ) ( not ( = ?auto_13699 ?auto_13702 ) ) ( not ( = ?auto_13699 ?auto_13710 ) ) ( not ( = ?auto_13700 ?auto_13702 ) ) ( not ( = ?auto_13700 ?auto_13710 ) ) ( not ( = ?auto_13701 ?auto_13702 ) ) ( not ( = ?auto_13701 ?auto_13710 ) ) ( not ( = ?auto_13704 ?auto_13702 ) ) ( not ( = ?auto_13704 ?auto_13710 ) ) ( not ( = ?auto_13702 ?auto_13725 ) ) ( not ( = ?auto_13702 ?auto_13729 ) ) ( not ( = ?auto_13702 ?auto_13717 ) ) ( not ( = ?auto_13702 ?auto_13727 ) ) ( not ( = ?auto_13702 ?auto_13711 ) ) ( not ( = ?auto_13702 ?auto_13723 ) ) ( not ( = ?auto_13702 ?auto_13722 ) ) ( not ( = ?auto_13707 ?auto_13724 ) ) ( not ( = ?auto_13707 ?auto_13728 ) ) ( not ( = ?auto_13707 ?auto_13716 ) ) ( not ( = ?auto_13707 ?auto_13720 ) ) ( not ( = ?auto_13707 ?auto_13713 ) ) ( not ( = ?auto_13707 ?auto_13715 ) ) ( not ( = ?auto_13709 ?auto_13726 ) ) ( not ( = ?auto_13709 ?auto_13712 ) ) ( not ( = ?auto_13709 ?auto_13719 ) ) ( not ( = ?auto_13709 ?auto_13714 ) ) ( not ( = ?auto_13709 ?auto_13721 ) ) ( not ( = ?auto_13709 ?auto_13718 ) ) ( not ( = ?auto_13710 ?auto_13725 ) ) ( not ( = ?auto_13710 ?auto_13729 ) ) ( not ( = ?auto_13710 ?auto_13717 ) ) ( not ( = ?auto_13710 ?auto_13727 ) ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13723 ) ) ( not ( = ?auto_13710 ?auto_13722 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13699 ?auto_13700 ?auto_13701 ?auto_13704 ?auto_13703 )
      ( MAKE-1CRATE ?auto_13703 ?auto_13702 )
      ( MAKE-8CRATE-VERIFY ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13699 ?auto_13700 ?auto_13701 ?auto_13704 ?auto_13703 ?auto_13702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13732 - SURFACE
      ?auto_13733 - SURFACE
    )
    :vars
    (
      ?auto_13734 - HOIST
      ?auto_13735 - PLACE
      ?auto_13737 - PLACE
      ?auto_13738 - HOIST
      ?auto_13739 - SURFACE
      ?auto_13736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13734 ?auto_13735 ) ( SURFACE-AT ?auto_13732 ?auto_13735 ) ( CLEAR ?auto_13732 ) ( IS-CRATE ?auto_13733 ) ( AVAILABLE ?auto_13734 ) ( not ( = ?auto_13737 ?auto_13735 ) ) ( HOIST-AT ?auto_13738 ?auto_13737 ) ( AVAILABLE ?auto_13738 ) ( SURFACE-AT ?auto_13733 ?auto_13737 ) ( ON ?auto_13733 ?auto_13739 ) ( CLEAR ?auto_13733 ) ( TRUCK-AT ?auto_13736 ?auto_13735 ) ( not ( = ?auto_13732 ?auto_13733 ) ) ( not ( = ?auto_13732 ?auto_13739 ) ) ( not ( = ?auto_13733 ?auto_13739 ) ) ( not ( = ?auto_13734 ?auto_13738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13736 ?auto_13735 ?auto_13737 )
      ( !LIFT ?auto_13738 ?auto_13733 ?auto_13739 ?auto_13737 )
      ( !LOAD ?auto_13738 ?auto_13733 ?auto_13736 ?auto_13737 )
      ( !DRIVE ?auto_13736 ?auto_13737 ?auto_13735 )
      ( !UNLOAD ?auto_13734 ?auto_13733 ?auto_13736 ?auto_13735 )
      ( !DROP ?auto_13734 ?auto_13733 ?auto_13732 ?auto_13735 )
      ( MAKE-1CRATE-VERIFY ?auto_13732 ?auto_13733 ) )
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
      ?auto_13758 - SURFACE
      ?auto_13757 - SURFACE
      ?auto_13756 - SURFACE
      ?auto_13759 - SURFACE
    )
    :vars
    (
      ?auto_13760 - HOIST
      ?auto_13762 - PLACE
      ?auto_13761 - PLACE
      ?auto_13763 - HOIST
      ?auto_13764 - SURFACE
      ?auto_13766 - SURFACE
      ?auto_13779 - PLACE
      ?auto_13773 - HOIST
      ?auto_13785 - SURFACE
      ?auto_13769 - PLACE
      ?auto_13768 - HOIST
      ?auto_13772 - SURFACE
      ?auto_13782 - PLACE
      ?auto_13774 - HOIST
      ?auto_13781 - SURFACE
      ?auto_13776 - PLACE
      ?auto_13784 - HOIST
      ?auto_13771 - SURFACE
      ?auto_13770 - SURFACE
      ?auto_13767 - PLACE
      ?auto_13775 - HOIST
      ?auto_13778 - SURFACE
      ?auto_13783 - PLACE
      ?auto_13780 - HOIST
      ?auto_13777 - SURFACE
      ?auto_13765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13760 ?auto_13762 ) ( IS-CRATE ?auto_13759 ) ( not ( = ?auto_13761 ?auto_13762 ) ) ( HOIST-AT ?auto_13763 ?auto_13761 ) ( SURFACE-AT ?auto_13759 ?auto_13761 ) ( ON ?auto_13759 ?auto_13764 ) ( CLEAR ?auto_13759 ) ( not ( = ?auto_13756 ?auto_13759 ) ) ( not ( = ?auto_13756 ?auto_13764 ) ) ( not ( = ?auto_13759 ?auto_13764 ) ) ( not ( = ?auto_13760 ?auto_13763 ) ) ( IS-CRATE ?auto_13756 ) ( AVAILABLE ?auto_13763 ) ( SURFACE-AT ?auto_13756 ?auto_13761 ) ( ON ?auto_13756 ?auto_13766 ) ( CLEAR ?auto_13756 ) ( not ( = ?auto_13757 ?auto_13756 ) ) ( not ( = ?auto_13757 ?auto_13766 ) ) ( not ( = ?auto_13756 ?auto_13766 ) ) ( IS-CRATE ?auto_13757 ) ( not ( = ?auto_13779 ?auto_13762 ) ) ( HOIST-AT ?auto_13773 ?auto_13779 ) ( SURFACE-AT ?auto_13757 ?auto_13779 ) ( ON ?auto_13757 ?auto_13785 ) ( CLEAR ?auto_13757 ) ( not ( = ?auto_13758 ?auto_13757 ) ) ( not ( = ?auto_13758 ?auto_13785 ) ) ( not ( = ?auto_13757 ?auto_13785 ) ) ( not ( = ?auto_13760 ?auto_13773 ) ) ( IS-CRATE ?auto_13758 ) ( not ( = ?auto_13769 ?auto_13762 ) ) ( HOIST-AT ?auto_13768 ?auto_13769 ) ( AVAILABLE ?auto_13768 ) ( SURFACE-AT ?auto_13758 ?auto_13769 ) ( ON ?auto_13758 ?auto_13772 ) ( CLEAR ?auto_13758 ) ( not ( = ?auto_13755 ?auto_13758 ) ) ( not ( = ?auto_13755 ?auto_13772 ) ) ( not ( = ?auto_13758 ?auto_13772 ) ) ( not ( = ?auto_13760 ?auto_13768 ) ) ( IS-CRATE ?auto_13755 ) ( not ( = ?auto_13782 ?auto_13762 ) ) ( HOIST-AT ?auto_13774 ?auto_13782 ) ( AVAILABLE ?auto_13774 ) ( SURFACE-AT ?auto_13755 ?auto_13782 ) ( ON ?auto_13755 ?auto_13781 ) ( CLEAR ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13754 ?auto_13781 ) ) ( not ( = ?auto_13755 ?auto_13781 ) ) ( not ( = ?auto_13760 ?auto_13774 ) ) ( IS-CRATE ?auto_13754 ) ( not ( = ?auto_13776 ?auto_13762 ) ) ( HOIST-AT ?auto_13784 ?auto_13776 ) ( AVAILABLE ?auto_13784 ) ( SURFACE-AT ?auto_13754 ?auto_13776 ) ( ON ?auto_13754 ?auto_13771 ) ( CLEAR ?auto_13754 ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13771 ) ) ( not ( = ?auto_13754 ?auto_13771 ) ) ( not ( = ?auto_13760 ?auto_13784 ) ) ( IS-CRATE ?auto_13753 ) ( AVAILABLE ?auto_13773 ) ( SURFACE-AT ?auto_13753 ?auto_13779 ) ( ON ?auto_13753 ?auto_13770 ) ( CLEAR ?auto_13753 ) ( not ( = ?auto_13752 ?auto_13753 ) ) ( not ( = ?auto_13752 ?auto_13770 ) ) ( not ( = ?auto_13753 ?auto_13770 ) ) ( IS-CRATE ?auto_13752 ) ( not ( = ?auto_13767 ?auto_13762 ) ) ( HOIST-AT ?auto_13775 ?auto_13767 ) ( AVAILABLE ?auto_13775 ) ( SURFACE-AT ?auto_13752 ?auto_13767 ) ( ON ?auto_13752 ?auto_13778 ) ( CLEAR ?auto_13752 ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( not ( = ?auto_13751 ?auto_13778 ) ) ( not ( = ?auto_13752 ?auto_13778 ) ) ( not ( = ?auto_13760 ?auto_13775 ) ) ( SURFACE-AT ?auto_13750 ?auto_13762 ) ( CLEAR ?auto_13750 ) ( IS-CRATE ?auto_13751 ) ( AVAILABLE ?auto_13760 ) ( not ( = ?auto_13783 ?auto_13762 ) ) ( HOIST-AT ?auto_13780 ?auto_13783 ) ( AVAILABLE ?auto_13780 ) ( SURFACE-AT ?auto_13751 ?auto_13783 ) ( ON ?auto_13751 ?auto_13777 ) ( CLEAR ?auto_13751 ) ( TRUCK-AT ?auto_13765 ?auto_13762 ) ( not ( = ?auto_13750 ?auto_13751 ) ) ( not ( = ?auto_13750 ?auto_13777 ) ) ( not ( = ?auto_13751 ?auto_13777 ) ) ( not ( = ?auto_13760 ?auto_13780 ) ) ( not ( = ?auto_13750 ?auto_13752 ) ) ( not ( = ?auto_13750 ?auto_13778 ) ) ( not ( = ?auto_13752 ?auto_13777 ) ) ( not ( = ?auto_13767 ?auto_13783 ) ) ( not ( = ?auto_13775 ?auto_13780 ) ) ( not ( = ?auto_13778 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13753 ) ) ( not ( = ?auto_13750 ?auto_13770 ) ) ( not ( = ?auto_13751 ?auto_13753 ) ) ( not ( = ?auto_13751 ?auto_13770 ) ) ( not ( = ?auto_13753 ?auto_13778 ) ) ( not ( = ?auto_13753 ?auto_13777 ) ) ( not ( = ?auto_13779 ?auto_13767 ) ) ( not ( = ?auto_13779 ?auto_13783 ) ) ( not ( = ?auto_13773 ?auto_13775 ) ) ( not ( = ?auto_13773 ?auto_13780 ) ) ( not ( = ?auto_13770 ?auto_13778 ) ) ( not ( = ?auto_13770 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13754 ) ) ( not ( = ?auto_13750 ?auto_13771 ) ) ( not ( = ?auto_13751 ?auto_13754 ) ) ( not ( = ?auto_13751 ?auto_13771 ) ) ( not ( = ?auto_13752 ?auto_13754 ) ) ( not ( = ?auto_13752 ?auto_13771 ) ) ( not ( = ?auto_13754 ?auto_13770 ) ) ( not ( = ?auto_13754 ?auto_13778 ) ) ( not ( = ?auto_13754 ?auto_13777 ) ) ( not ( = ?auto_13776 ?auto_13779 ) ) ( not ( = ?auto_13776 ?auto_13767 ) ) ( not ( = ?auto_13776 ?auto_13783 ) ) ( not ( = ?auto_13784 ?auto_13773 ) ) ( not ( = ?auto_13784 ?auto_13775 ) ) ( not ( = ?auto_13784 ?auto_13780 ) ) ( not ( = ?auto_13771 ?auto_13770 ) ) ( not ( = ?auto_13771 ?auto_13778 ) ) ( not ( = ?auto_13771 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13755 ) ) ( not ( = ?auto_13750 ?auto_13781 ) ) ( not ( = ?auto_13751 ?auto_13755 ) ) ( not ( = ?auto_13751 ?auto_13781 ) ) ( not ( = ?auto_13752 ?auto_13755 ) ) ( not ( = ?auto_13752 ?auto_13781 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13781 ) ) ( not ( = ?auto_13755 ?auto_13771 ) ) ( not ( = ?auto_13755 ?auto_13770 ) ) ( not ( = ?auto_13755 ?auto_13778 ) ) ( not ( = ?auto_13755 ?auto_13777 ) ) ( not ( = ?auto_13782 ?auto_13776 ) ) ( not ( = ?auto_13782 ?auto_13779 ) ) ( not ( = ?auto_13782 ?auto_13767 ) ) ( not ( = ?auto_13782 ?auto_13783 ) ) ( not ( = ?auto_13774 ?auto_13784 ) ) ( not ( = ?auto_13774 ?auto_13773 ) ) ( not ( = ?auto_13774 ?auto_13775 ) ) ( not ( = ?auto_13774 ?auto_13780 ) ) ( not ( = ?auto_13781 ?auto_13771 ) ) ( not ( = ?auto_13781 ?auto_13770 ) ) ( not ( = ?auto_13781 ?auto_13778 ) ) ( not ( = ?auto_13781 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13758 ) ) ( not ( = ?auto_13750 ?auto_13772 ) ) ( not ( = ?auto_13751 ?auto_13758 ) ) ( not ( = ?auto_13751 ?auto_13772 ) ) ( not ( = ?auto_13752 ?auto_13758 ) ) ( not ( = ?auto_13752 ?auto_13772 ) ) ( not ( = ?auto_13753 ?auto_13758 ) ) ( not ( = ?auto_13753 ?auto_13772 ) ) ( not ( = ?auto_13754 ?auto_13758 ) ) ( not ( = ?auto_13754 ?auto_13772 ) ) ( not ( = ?auto_13758 ?auto_13781 ) ) ( not ( = ?auto_13758 ?auto_13771 ) ) ( not ( = ?auto_13758 ?auto_13770 ) ) ( not ( = ?auto_13758 ?auto_13778 ) ) ( not ( = ?auto_13758 ?auto_13777 ) ) ( not ( = ?auto_13769 ?auto_13782 ) ) ( not ( = ?auto_13769 ?auto_13776 ) ) ( not ( = ?auto_13769 ?auto_13779 ) ) ( not ( = ?auto_13769 ?auto_13767 ) ) ( not ( = ?auto_13769 ?auto_13783 ) ) ( not ( = ?auto_13768 ?auto_13774 ) ) ( not ( = ?auto_13768 ?auto_13784 ) ) ( not ( = ?auto_13768 ?auto_13773 ) ) ( not ( = ?auto_13768 ?auto_13775 ) ) ( not ( = ?auto_13768 ?auto_13780 ) ) ( not ( = ?auto_13772 ?auto_13781 ) ) ( not ( = ?auto_13772 ?auto_13771 ) ) ( not ( = ?auto_13772 ?auto_13770 ) ) ( not ( = ?auto_13772 ?auto_13778 ) ) ( not ( = ?auto_13772 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13757 ) ) ( not ( = ?auto_13750 ?auto_13785 ) ) ( not ( = ?auto_13751 ?auto_13757 ) ) ( not ( = ?auto_13751 ?auto_13785 ) ) ( not ( = ?auto_13752 ?auto_13757 ) ) ( not ( = ?auto_13752 ?auto_13785 ) ) ( not ( = ?auto_13753 ?auto_13757 ) ) ( not ( = ?auto_13753 ?auto_13785 ) ) ( not ( = ?auto_13754 ?auto_13757 ) ) ( not ( = ?auto_13754 ?auto_13785 ) ) ( not ( = ?auto_13755 ?auto_13757 ) ) ( not ( = ?auto_13755 ?auto_13785 ) ) ( not ( = ?auto_13757 ?auto_13772 ) ) ( not ( = ?auto_13757 ?auto_13781 ) ) ( not ( = ?auto_13757 ?auto_13771 ) ) ( not ( = ?auto_13757 ?auto_13770 ) ) ( not ( = ?auto_13757 ?auto_13778 ) ) ( not ( = ?auto_13757 ?auto_13777 ) ) ( not ( = ?auto_13785 ?auto_13772 ) ) ( not ( = ?auto_13785 ?auto_13781 ) ) ( not ( = ?auto_13785 ?auto_13771 ) ) ( not ( = ?auto_13785 ?auto_13770 ) ) ( not ( = ?auto_13785 ?auto_13778 ) ) ( not ( = ?auto_13785 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13756 ) ) ( not ( = ?auto_13750 ?auto_13766 ) ) ( not ( = ?auto_13751 ?auto_13756 ) ) ( not ( = ?auto_13751 ?auto_13766 ) ) ( not ( = ?auto_13752 ?auto_13756 ) ) ( not ( = ?auto_13752 ?auto_13766 ) ) ( not ( = ?auto_13753 ?auto_13756 ) ) ( not ( = ?auto_13753 ?auto_13766 ) ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13754 ?auto_13766 ) ) ( not ( = ?auto_13755 ?auto_13756 ) ) ( not ( = ?auto_13755 ?auto_13766 ) ) ( not ( = ?auto_13758 ?auto_13756 ) ) ( not ( = ?auto_13758 ?auto_13766 ) ) ( not ( = ?auto_13756 ?auto_13785 ) ) ( not ( = ?auto_13756 ?auto_13772 ) ) ( not ( = ?auto_13756 ?auto_13781 ) ) ( not ( = ?auto_13756 ?auto_13771 ) ) ( not ( = ?auto_13756 ?auto_13770 ) ) ( not ( = ?auto_13756 ?auto_13778 ) ) ( not ( = ?auto_13756 ?auto_13777 ) ) ( not ( = ?auto_13761 ?auto_13779 ) ) ( not ( = ?auto_13761 ?auto_13769 ) ) ( not ( = ?auto_13761 ?auto_13782 ) ) ( not ( = ?auto_13761 ?auto_13776 ) ) ( not ( = ?auto_13761 ?auto_13767 ) ) ( not ( = ?auto_13761 ?auto_13783 ) ) ( not ( = ?auto_13763 ?auto_13773 ) ) ( not ( = ?auto_13763 ?auto_13768 ) ) ( not ( = ?auto_13763 ?auto_13774 ) ) ( not ( = ?auto_13763 ?auto_13784 ) ) ( not ( = ?auto_13763 ?auto_13775 ) ) ( not ( = ?auto_13763 ?auto_13780 ) ) ( not ( = ?auto_13766 ?auto_13785 ) ) ( not ( = ?auto_13766 ?auto_13772 ) ) ( not ( = ?auto_13766 ?auto_13781 ) ) ( not ( = ?auto_13766 ?auto_13771 ) ) ( not ( = ?auto_13766 ?auto_13770 ) ) ( not ( = ?auto_13766 ?auto_13778 ) ) ( not ( = ?auto_13766 ?auto_13777 ) ) ( not ( = ?auto_13750 ?auto_13759 ) ) ( not ( = ?auto_13750 ?auto_13764 ) ) ( not ( = ?auto_13751 ?auto_13759 ) ) ( not ( = ?auto_13751 ?auto_13764 ) ) ( not ( = ?auto_13752 ?auto_13759 ) ) ( not ( = ?auto_13752 ?auto_13764 ) ) ( not ( = ?auto_13753 ?auto_13759 ) ) ( not ( = ?auto_13753 ?auto_13764 ) ) ( not ( = ?auto_13754 ?auto_13759 ) ) ( not ( = ?auto_13754 ?auto_13764 ) ) ( not ( = ?auto_13755 ?auto_13759 ) ) ( not ( = ?auto_13755 ?auto_13764 ) ) ( not ( = ?auto_13758 ?auto_13759 ) ) ( not ( = ?auto_13758 ?auto_13764 ) ) ( not ( = ?auto_13757 ?auto_13759 ) ) ( not ( = ?auto_13757 ?auto_13764 ) ) ( not ( = ?auto_13759 ?auto_13766 ) ) ( not ( = ?auto_13759 ?auto_13785 ) ) ( not ( = ?auto_13759 ?auto_13772 ) ) ( not ( = ?auto_13759 ?auto_13781 ) ) ( not ( = ?auto_13759 ?auto_13771 ) ) ( not ( = ?auto_13759 ?auto_13770 ) ) ( not ( = ?auto_13759 ?auto_13778 ) ) ( not ( = ?auto_13759 ?auto_13777 ) ) ( not ( = ?auto_13764 ?auto_13766 ) ) ( not ( = ?auto_13764 ?auto_13785 ) ) ( not ( = ?auto_13764 ?auto_13772 ) ) ( not ( = ?auto_13764 ?auto_13781 ) ) ( not ( = ?auto_13764 ?auto_13771 ) ) ( not ( = ?auto_13764 ?auto_13770 ) ) ( not ( = ?auto_13764 ?auto_13778 ) ) ( not ( = ?auto_13764 ?auto_13777 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13753 ?auto_13754 ?auto_13755 ?auto_13758 ?auto_13757 ?auto_13756 )
      ( MAKE-1CRATE ?auto_13756 ?auto_13759 )
      ( MAKE-9CRATE-VERIFY ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13753 ?auto_13754 ?auto_13755 ?auto_13758 ?auto_13757 ?auto_13756 ?auto_13759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13788 - SURFACE
      ?auto_13789 - SURFACE
    )
    :vars
    (
      ?auto_13790 - HOIST
      ?auto_13791 - PLACE
      ?auto_13793 - PLACE
      ?auto_13794 - HOIST
      ?auto_13795 - SURFACE
      ?auto_13792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13790 ?auto_13791 ) ( SURFACE-AT ?auto_13788 ?auto_13791 ) ( CLEAR ?auto_13788 ) ( IS-CRATE ?auto_13789 ) ( AVAILABLE ?auto_13790 ) ( not ( = ?auto_13793 ?auto_13791 ) ) ( HOIST-AT ?auto_13794 ?auto_13793 ) ( AVAILABLE ?auto_13794 ) ( SURFACE-AT ?auto_13789 ?auto_13793 ) ( ON ?auto_13789 ?auto_13795 ) ( CLEAR ?auto_13789 ) ( TRUCK-AT ?auto_13792 ?auto_13791 ) ( not ( = ?auto_13788 ?auto_13789 ) ) ( not ( = ?auto_13788 ?auto_13795 ) ) ( not ( = ?auto_13789 ?auto_13795 ) ) ( not ( = ?auto_13790 ?auto_13794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13792 ?auto_13791 ?auto_13793 )
      ( !LIFT ?auto_13794 ?auto_13789 ?auto_13795 ?auto_13793 )
      ( !LOAD ?auto_13794 ?auto_13789 ?auto_13792 ?auto_13793 )
      ( !DRIVE ?auto_13792 ?auto_13793 ?auto_13791 )
      ( !UNLOAD ?auto_13790 ?auto_13789 ?auto_13792 ?auto_13791 )
      ( !DROP ?auto_13790 ?auto_13789 ?auto_13788 ?auto_13791 )
      ( MAKE-1CRATE-VERIFY ?auto_13788 ?auto_13789 ) )
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
      ?auto_13815 - SURFACE
      ?auto_13814 - SURFACE
      ?auto_13813 - SURFACE
      ?auto_13816 - SURFACE
      ?auto_13817 - SURFACE
    )
    :vars
    (
      ?auto_13823 - HOIST
      ?auto_13819 - PLACE
      ?auto_13822 - PLACE
      ?auto_13818 - HOIST
      ?auto_13821 - SURFACE
      ?auto_13830 - PLACE
      ?auto_13835 - HOIST
      ?auto_13846 - SURFACE
      ?auto_13828 - SURFACE
      ?auto_13827 - PLACE
      ?auto_13826 - HOIST
      ?auto_13843 - SURFACE
      ?auto_13829 - PLACE
      ?auto_13845 - HOIST
      ?auto_13840 - SURFACE
      ?auto_13844 - PLACE
      ?auto_13833 - HOIST
      ?auto_13837 - SURFACE
      ?auto_13825 - PLACE
      ?auto_13832 - HOIST
      ?auto_13841 - SURFACE
      ?auto_13842 - SURFACE
      ?auto_13831 - PLACE
      ?auto_13834 - HOIST
      ?auto_13838 - SURFACE
      ?auto_13824 - PLACE
      ?auto_13839 - HOIST
      ?auto_13836 - SURFACE
      ?auto_13820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13823 ?auto_13819 ) ( IS-CRATE ?auto_13817 ) ( not ( = ?auto_13822 ?auto_13819 ) ) ( HOIST-AT ?auto_13818 ?auto_13822 ) ( AVAILABLE ?auto_13818 ) ( SURFACE-AT ?auto_13817 ?auto_13822 ) ( ON ?auto_13817 ?auto_13821 ) ( CLEAR ?auto_13817 ) ( not ( = ?auto_13816 ?auto_13817 ) ) ( not ( = ?auto_13816 ?auto_13821 ) ) ( not ( = ?auto_13817 ?auto_13821 ) ) ( not ( = ?auto_13823 ?auto_13818 ) ) ( IS-CRATE ?auto_13816 ) ( not ( = ?auto_13830 ?auto_13819 ) ) ( HOIST-AT ?auto_13835 ?auto_13830 ) ( SURFACE-AT ?auto_13816 ?auto_13830 ) ( ON ?auto_13816 ?auto_13846 ) ( CLEAR ?auto_13816 ) ( not ( = ?auto_13813 ?auto_13816 ) ) ( not ( = ?auto_13813 ?auto_13846 ) ) ( not ( = ?auto_13816 ?auto_13846 ) ) ( not ( = ?auto_13823 ?auto_13835 ) ) ( IS-CRATE ?auto_13813 ) ( AVAILABLE ?auto_13835 ) ( SURFACE-AT ?auto_13813 ?auto_13830 ) ( ON ?auto_13813 ?auto_13828 ) ( CLEAR ?auto_13813 ) ( not ( = ?auto_13814 ?auto_13813 ) ) ( not ( = ?auto_13814 ?auto_13828 ) ) ( not ( = ?auto_13813 ?auto_13828 ) ) ( IS-CRATE ?auto_13814 ) ( not ( = ?auto_13827 ?auto_13819 ) ) ( HOIST-AT ?auto_13826 ?auto_13827 ) ( SURFACE-AT ?auto_13814 ?auto_13827 ) ( ON ?auto_13814 ?auto_13843 ) ( CLEAR ?auto_13814 ) ( not ( = ?auto_13815 ?auto_13814 ) ) ( not ( = ?auto_13815 ?auto_13843 ) ) ( not ( = ?auto_13814 ?auto_13843 ) ) ( not ( = ?auto_13823 ?auto_13826 ) ) ( IS-CRATE ?auto_13815 ) ( not ( = ?auto_13829 ?auto_13819 ) ) ( HOIST-AT ?auto_13845 ?auto_13829 ) ( AVAILABLE ?auto_13845 ) ( SURFACE-AT ?auto_13815 ?auto_13829 ) ( ON ?auto_13815 ?auto_13840 ) ( CLEAR ?auto_13815 ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( not ( = ?auto_13812 ?auto_13840 ) ) ( not ( = ?auto_13815 ?auto_13840 ) ) ( not ( = ?auto_13823 ?auto_13845 ) ) ( IS-CRATE ?auto_13812 ) ( not ( = ?auto_13844 ?auto_13819 ) ) ( HOIST-AT ?auto_13833 ?auto_13844 ) ( AVAILABLE ?auto_13833 ) ( SURFACE-AT ?auto_13812 ?auto_13844 ) ( ON ?auto_13812 ?auto_13837 ) ( CLEAR ?auto_13812 ) ( not ( = ?auto_13811 ?auto_13812 ) ) ( not ( = ?auto_13811 ?auto_13837 ) ) ( not ( = ?auto_13812 ?auto_13837 ) ) ( not ( = ?auto_13823 ?auto_13833 ) ) ( IS-CRATE ?auto_13811 ) ( not ( = ?auto_13825 ?auto_13819 ) ) ( HOIST-AT ?auto_13832 ?auto_13825 ) ( AVAILABLE ?auto_13832 ) ( SURFACE-AT ?auto_13811 ?auto_13825 ) ( ON ?auto_13811 ?auto_13841 ) ( CLEAR ?auto_13811 ) ( not ( = ?auto_13810 ?auto_13811 ) ) ( not ( = ?auto_13810 ?auto_13841 ) ) ( not ( = ?auto_13811 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13832 ) ) ( IS-CRATE ?auto_13810 ) ( AVAILABLE ?auto_13826 ) ( SURFACE-AT ?auto_13810 ?auto_13827 ) ( ON ?auto_13810 ?auto_13842 ) ( CLEAR ?auto_13810 ) ( not ( = ?auto_13809 ?auto_13810 ) ) ( not ( = ?auto_13809 ?auto_13842 ) ) ( not ( = ?auto_13810 ?auto_13842 ) ) ( IS-CRATE ?auto_13809 ) ( not ( = ?auto_13831 ?auto_13819 ) ) ( HOIST-AT ?auto_13834 ?auto_13831 ) ( AVAILABLE ?auto_13834 ) ( SURFACE-AT ?auto_13809 ?auto_13831 ) ( ON ?auto_13809 ?auto_13838 ) ( CLEAR ?auto_13809 ) ( not ( = ?auto_13808 ?auto_13809 ) ) ( not ( = ?auto_13808 ?auto_13838 ) ) ( not ( = ?auto_13809 ?auto_13838 ) ) ( not ( = ?auto_13823 ?auto_13834 ) ) ( SURFACE-AT ?auto_13807 ?auto_13819 ) ( CLEAR ?auto_13807 ) ( IS-CRATE ?auto_13808 ) ( AVAILABLE ?auto_13823 ) ( not ( = ?auto_13824 ?auto_13819 ) ) ( HOIST-AT ?auto_13839 ?auto_13824 ) ( AVAILABLE ?auto_13839 ) ( SURFACE-AT ?auto_13808 ?auto_13824 ) ( ON ?auto_13808 ?auto_13836 ) ( CLEAR ?auto_13808 ) ( TRUCK-AT ?auto_13820 ?auto_13819 ) ( not ( = ?auto_13807 ?auto_13808 ) ) ( not ( = ?auto_13807 ?auto_13836 ) ) ( not ( = ?auto_13808 ?auto_13836 ) ) ( not ( = ?auto_13823 ?auto_13839 ) ) ( not ( = ?auto_13807 ?auto_13809 ) ) ( not ( = ?auto_13807 ?auto_13838 ) ) ( not ( = ?auto_13809 ?auto_13836 ) ) ( not ( = ?auto_13831 ?auto_13824 ) ) ( not ( = ?auto_13834 ?auto_13839 ) ) ( not ( = ?auto_13838 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13810 ) ) ( not ( = ?auto_13807 ?auto_13842 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) ( not ( = ?auto_13808 ?auto_13842 ) ) ( not ( = ?auto_13810 ?auto_13838 ) ) ( not ( = ?auto_13810 ?auto_13836 ) ) ( not ( = ?auto_13827 ?auto_13831 ) ) ( not ( = ?auto_13827 ?auto_13824 ) ) ( not ( = ?auto_13826 ?auto_13834 ) ) ( not ( = ?auto_13826 ?auto_13839 ) ) ( not ( = ?auto_13842 ?auto_13838 ) ) ( not ( = ?auto_13842 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13811 ) ) ( not ( = ?auto_13807 ?auto_13841 ) ) ( not ( = ?auto_13808 ?auto_13811 ) ) ( not ( = ?auto_13808 ?auto_13841 ) ) ( not ( = ?auto_13809 ?auto_13811 ) ) ( not ( = ?auto_13809 ?auto_13841 ) ) ( not ( = ?auto_13811 ?auto_13842 ) ) ( not ( = ?auto_13811 ?auto_13838 ) ) ( not ( = ?auto_13811 ?auto_13836 ) ) ( not ( = ?auto_13825 ?auto_13827 ) ) ( not ( = ?auto_13825 ?auto_13831 ) ) ( not ( = ?auto_13825 ?auto_13824 ) ) ( not ( = ?auto_13832 ?auto_13826 ) ) ( not ( = ?auto_13832 ?auto_13834 ) ) ( not ( = ?auto_13832 ?auto_13839 ) ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13838 ) ) ( not ( = ?auto_13841 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13812 ) ) ( not ( = ?auto_13807 ?auto_13837 ) ) ( not ( = ?auto_13808 ?auto_13812 ) ) ( not ( = ?auto_13808 ?auto_13837 ) ) ( not ( = ?auto_13809 ?auto_13812 ) ) ( not ( = ?auto_13809 ?auto_13837 ) ) ( not ( = ?auto_13810 ?auto_13812 ) ) ( not ( = ?auto_13810 ?auto_13837 ) ) ( not ( = ?auto_13812 ?auto_13841 ) ) ( not ( = ?auto_13812 ?auto_13842 ) ) ( not ( = ?auto_13812 ?auto_13838 ) ) ( not ( = ?auto_13812 ?auto_13836 ) ) ( not ( = ?auto_13844 ?auto_13825 ) ) ( not ( = ?auto_13844 ?auto_13827 ) ) ( not ( = ?auto_13844 ?auto_13831 ) ) ( not ( = ?auto_13844 ?auto_13824 ) ) ( not ( = ?auto_13833 ?auto_13832 ) ) ( not ( = ?auto_13833 ?auto_13826 ) ) ( not ( = ?auto_13833 ?auto_13834 ) ) ( not ( = ?auto_13833 ?auto_13839 ) ) ( not ( = ?auto_13837 ?auto_13841 ) ) ( not ( = ?auto_13837 ?auto_13842 ) ) ( not ( = ?auto_13837 ?auto_13838 ) ) ( not ( = ?auto_13837 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13815 ) ) ( not ( = ?auto_13807 ?auto_13840 ) ) ( not ( = ?auto_13808 ?auto_13815 ) ) ( not ( = ?auto_13808 ?auto_13840 ) ) ( not ( = ?auto_13809 ?auto_13815 ) ) ( not ( = ?auto_13809 ?auto_13840 ) ) ( not ( = ?auto_13810 ?auto_13815 ) ) ( not ( = ?auto_13810 ?auto_13840 ) ) ( not ( = ?auto_13811 ?auto_13815 ) ) ( not ( = ?auto_13811 ?auto_13840 ) ) ( not ( = ?auto_13815 ?auto_13837 ) ) ( not ( = ?auto_13815 ?auto_13841 ) ) ( not ( = ?auto_13815 ?auto_13842 ) ) ( not ( = ?auto_13815 ?auto_13838 ) ) ( not ( = ?auto_13815 ?auto_13836 ) ) ( not ( = ?auto_13829 ?auto_13844 ) ) ( not ( = ?auto_13829 ?auto_13825 ) ) ( not ( = ?auto_13829 ?auto_13827 ) ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13829 ?auto_13824 ) ) ( not ( = ?auto_13845 ?auto_13833 ) ) ( not ( = ?auto_13845 ?auto_13832 ) ) ( not ( = ?auto_13845 ?auto_13826 ) ) ( not ( = ?auto_13845 ?auto_13834 ) ) ( not ( = ?auto_13845 ?auto_13839 ) ) ( not ( = ?auto_13840 ?auto_13837 ) ) ( not ( = ?auto_13840 ?auto_13841 ) ) ( not ( = ?auto_13840 ?auto_13842 ) ) ( not ( = ?auto_13840 ?auto_13838 ) ) ( not ( = ?auto_13840 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13814 ) ) ( not ( = ?auto_13807 ?auto_13843 ) ) ( not ( = ?auto_13808 ?auto_13814 ) ) ( not ( = ?auto_13808 ?auto_13843 ) ) ( not ( = ?auto_13809 ?auto_13814 ) ) ( not ( = ?auto_13809 ?auto_13843 ) ) ( not ( = ?auto_13810 ?auto_13814 ) ) ( not ( = ?auto_13810 ?auto_13843 ) ) ( not ( = ?auto_13811 ?auto_13814 ) ) ( not ( = ?auto_13811 ?auto_13843 ) ) ( not ( = ?auto_13812 ?auto_13814 ) ) ( not ( = ?auto_13812 ?auto_13843 ) ) ( not ( = ?auto_13814 ?auto_13840 ) ) ( not ( = ?auto_13814 ?auto_13837 ) ) ( not ( = ?auto_13814 ?auto_13841 ) ) ( not ( = ?auto_13814 ?auto_13842 ) ) ( not ( = ?auto_13814 ?auto_13838 ) ) ( not ( = ?auto_13814 ?auto_13836 ) ) ( not ( = ?auto_13843 ?auto_13840 ) ) ( not ( = ?auto_13843 ?auto_13837 ) ) ( not ( = ?auto_13843 ?auto_13841 ) ) ( not ( = ?auto_13843 ?auto_13842 ) ) ( not ( = ?auto_13843 ?auto_13838 ) ) ( not ( = ?auto_13843 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13813 ) ) ( not ( = ?auto_13807 ?auto_13828 ) ) ( not ( = ?auto_13808 ?auto_13813 ) ) ( not ( = ?auto_13808 ?auto_13828 ) ) ( not ( = ?auto_13809 ?auto_13813 ) ) ( not ( = ?auto_13809 ?auto_13828 ) ) ( not ( = ?auto_13810 ?auto_13813 ) ) ( not ( = ?auto_13810 ?auto_13828 ) ) ( not ( = ?auto_13811 ?auto_13813 ) ) ( not ( = ?auto_13811 ?auto_13828 ) ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13812 ?auto_13828 ) ) ( not ( = ?auto_13815 ?auto_13813 ) ) ( not ( = ?auto_13815 ?auto_13828 ) ) ( not ( = ?auto_13813 ?auto_13843 ) ) ( not ( = ?auto_13813 ?auto_13840 ) ) ( not ( = ?auto_13813 ?auto_13837 ) ) ( not ( = ?auto_13813 ?auto_13841 ) ) ( not ( = ?auto_13813 ?auto_13842 ) ) ( not ( = ?auto_13813 ?auto_13838 ) ) ( not ( = ?auto_13813 ?auto_13836 ) ) ( not ( = ?auto_13830 ?auto_13827 ) ) ( not ( = ?auto_13830 ?auto_13829 ) ) ( not ( = ?auto_13830 ?auto_13844 ) ) ( not ( = ?auto_13830 ?auto_13825 ) ) ( not ( = ?auto_13830 ?auto_13831 ) ) ( not ( = ?auto_13830 ?auto_13824 ) ) ( not ( = ?auto_13835 ?auto_13826 ) ) ( not ( = ?auto_13835 ?auto_13845 ) ) ( not ( = ?auto_13835 ?auto_13833 ) ) ( not ( = ?auto_13835 ?auto_13832 ) ) ( not ( = ?auto_13835 ?auto_13834 ) ) ( not ( = ?auto_13835 ?auto_13839 ) ) ( not ( = ?auto_13828 ?auto_13843 ) ) ( not ( = ?auto_13828 ?auto_13840 ) ) ( not ( = ?auto_13828 ?auto_13837 ) ) ( not ( = ?auto_13828 ?auto_13841 ) ) ( not ( = ?auto_13828 ?auto_13842 ) ) ( not ( = ?auto_13828 ?auto_13838 ) ) ( not ( = ?auto_13828 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13816 ) ) ( not ( = ?auto_13807 ?auto_13846 ) ) ( not ( = ?auto_13808 ?auto_13816 ) ) ( not ( = ?auto_13808 ?auto_13846 ) ) ( not ( = ?auto_13809 ?auto_13816 ) ) ( not ( = ?auto_13809 ?auto_13846 ) ) ( not ( = ?auto_13810 ?auto_13816 ) ) ( not ( = ?auto_13810 ?auto_13846 ) ) ( not ( = ?auto_13811 ?auto_13816 ) ) ( not ( = ?auto_13811 ?auto_13846 ) ) ( not ( = ?auto_13812 ?auto_13816 ) ) ( not ( = ?auto_13812 ?auto_13846 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13846 ) ) ( not ( = ?auto_13814 ?auto_13816 ) ) ( not ( = ?auto_13814 ?auto_13846 ) ) ( not ( = ?auto_13816 ?auto_13828 ) ) ( not ( = ?auto_13816 ?auto_13843 ) ) ( not ( = ?auto_13816 ?auto_13840 ) ) ( not ( = ?auto_13816 ?auto_13837 ) ) ( not ( = ?auto_13816 ?auto_13841 ) ) ( not ( = ?auto_13816 ?auto_13842 ) ) ( not ( = ?auto_13816 ?auto_13838 ) ) ( not ( = ?auto_13816 ?auto_13836 ) ) ( not ( = ?auto_13846 ?auto_13828 ) ) ( not ( = ?auto_13846 ?auto_13843 ) ) ( not ( = ?auto_13846 ?auto_13840 ) ) ( not ( = ?auto_13846 ?auto_13837 ) ) ( not ( = ?auto_13846 ?auto_13841 ) ) ( not ( = ?auto_13846 ?auto_13842 ) ) ( not ( = ?auto_13846 ?auto_13838 ) ) ( not ( = ?auto_13846 ?auto_13836 ) ) ( not ( = ?auto_13807 ?auto_13817 ) ) ( not ( = ?auto_13807 ?auto_13821 ) ) ( not ( = ?auto_13808 ?auto_13817 ) ) ( not ( = ?auto_13808 ?auto_13821 ) ) ( not ( = ?auto_13809 ?auto_13817 ) ) ( not ( = ?auto_13809 ?auto_13821 ) ) ( not ( = ?auto_13810 ?auto_13817 ) ) ( not ( = ?auto_13810 ?auto_13821 ) ) ( not ( = ?auto_13811 ?auto_13817 ) ) ( not ( = ?auto_13811 ?auto_13821 ) ) ( not ( = ?auto_13812 ?auto_13817 ) ) ( not ( = ?auto_13812 ?auto_13821 ) ) ( not ( = ?auto_13815 ?auto_13817 ) ) ( not ( = ?auto_13815 ?auto_13821 ) ) ( not ( = ?auto_13814 ?auto_13817 ) ) ( not ( = ?auto_13814 ?auto_13821 ) ) ( not ( = ?auto_13813 ?auto_13817 ) ) ( not ( = ?auto_13813 ?auto_13821 ) ) ( not ( = ?auto_13817 ?auto_13846 ) ) ( not ( = ?auto_13817 ?auto_13828 ) ) ( not ( = ?auto_13817 ?auto_13843 ) ) ( not ( = ?auto_13817 ?auto_13840 ) ) ( not ( = ?auto_13817 ?auto_13837 ) ) ( not ( = ?auto_13817 ?auto_13841 ) ) ( not ( = ?auto_13817 ?auto_13842 ) ) ( not ( = ?auto_13817 ?auto_13838 ) ) ( not ( = ?auto_13817 ?auto_13836 ) ) ( not ( = ?auto_13822 ?auto_13830 ) ) ( not ( = ?auto_13822 ?auto_13827 ) ) ( not ( = ?auto_13822 ?auto_13829 ) ) ( not ( = ?auto_13822 ?auto_13844 ) ) ( not ( = ?auto_13822 ?auto_13825 ) ) ( not ( = ?auto_13822 ?auto_13831 ) ) ( not ( = ?auto_13822 ?auto_13824 ) ) ( not ( = ?auto_13818 ?auto_13835 ) ) ( not ( = ?auto_13818 ?auto_13826 ) ) ( not ( = ?auto_13818 ?auto_13845 ) ) ( not ( = ?auto_13818 ?auto_13833 ) ) ( not ( = ?auto_13818 ?auto_13832 ) ) ( not ( = ?auto_13818 ?auto_13834 ) ) ( not ( = ?auto_13818 ?auto_13839 ) ) ( not ( = ?auto_13821 ?auto_13846 ) ) ( not ( = ?auto_13821 ?auto_13828 ) ) ( not ( = ?auto_13821 ?auto_13843 ) ) ( not ( = ?auto_13821 ?auto_13840 ) ) ( not ( = ?auto_13821 ?auto_13837 ) ) ( not ( = ?auto_13821 ?auto_13841 ) ) ( not ( = ?auto_13821 ?auto_13842 ) ) ( not ( = ?auto_13821 ?auto_13838 ) ) ( not ( = ?auto_13821 ?auto_13836 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13807 ?auto_13808 ?auto_13809 ?auto_13810 ?auto_13811 ?auto_13812 ?auto_13815 ?auto_13814 ?auto_13813 ?auto_13816 )
      ( MAKE-1CRATE ?auto_13816 ?auto_13817 )
      ( MAKE-10CRATE-VERIFY ?auto_13807 ?auto_13808 ?auto_13809 ?auto_13810 ?auto_13811 ?auto_13812 ?auto_13815 ?auto_13814 ?auto_13813 ?auto_13816 ?auto_13817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13849 - SURFACE
      ?auto_13850 - SURFACE
    )
    :vars
    (
      ?auto_13851 - HOIST
      ?auto_13852 - PLACE
      ?auto_13854 - PLACE
      ?auto_13855 - HOIST
      ?auto_13856 - SURFACE
      ?auto_13853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13851 ?auto_13852 ) ( SURFACE-AT ?auto_13849 ?auto_13852 ) ( CLEAR ?auto_13849 ) ( IS-CRATE ?auto_13850 ) ( AVAILABLE ?auto_13851 ) ( not ( = ?auto_13854 ?auto_13852 ) ) ( HOIST-AT ?auto_13855 ?auto_13854 ) ( AVAILABLE ?auto_13855 ) ( SURFACE-AT ?auto_13850 ?auto_13854 ) ( ON ?auto_13850 ?auto_13856 ) ( CLEAR ?auto_13850 ) ( TRUCK-AT ?auto_13853 ?auto_13852 ) ( not ( = ?auto_13849 ?auto_13850 ) ) ( not ( = ?auto_13849 ?auto_13856 ) ) ( not ( = ?auto_13850 ?auto_13856 ) ) ( not ( = ?auto_13851 ?auto_13855 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13853 ?auto_13852 ?auto_13854 )
      ( !LIFT ?auto_13855 ?auto_13850 ?auto_13856 ?auto_13854 )
      ( !LOAD ?auto_13855 ?auto_13850 ?auto_13853 ?auto_13854 )
      ( !DRIVE ?auto_13853 ?auto_13854 ?auto_13852 )
      ( !UNLOAD ?auto_13851 ?auto_13850 ?auto_13853 ?auto_13852 )
      ( !DROP ?auto_13851 ?auto_13850 ?auto_13849 ?auto_13852 )
      ( MAKE-1CRATE-VERIFY ?auto_13849 ?auto_13850 ) )
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
      ?auto_13877 - SURFACE
      ?auto_13876 - SURFACE
      ?auto_13875 - SURFACE
      ?auto_13878 - SURFACE
      ?auto_13880 - SURFACE
      ?auto_13879 - SURFACE
    )
    :vars
    (
      ?auto_13886 - HOIST
      ?auto_13881 - PLACE
      ?auto_13882 - PLACE
      ?auto_13884 - HOIST
      ?auto_13885 - SURFACE
      ?auto_13910 - PLACE
      ?auto_13909 - HOIST
      ?auto_13891 - SURFACE
      ?auto_13911 - PLACE
      ?auto_13895 - HOIST
      ?auto_13900 - SURFACE
      ?auto_13897 - SURFACE
      ?auto_13892 - PLACE
      ?auto_13894 - HOIST
      ?auto_13902 - SURFACE
      ?auto_13888 - PLACE
      ?auto_13903 - HOIST
      ?auto_13893 - SURFACE
      ?auto_13901 - PLACE
      ?auto_13905 - HOIST
      ?auto_13907 - SURFACE
      ?auto_13898 - PLACE
      ?auto_13887 - HOIST
      ?auto_13896 - SURFACE
      ?auto_13890 - SURFACE
      ?auto_13899 - PLACE
      ?auto_13904 - HOIST
      ?auto_13908 - SURFACE
      ?auto_13889 - PLACE
      ?auto_13912 - HOIST
      ?auto_13906 - SURFACE
      ?auto_13883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13886 ?auto_13881 ) ( IS-CRATE ?auto_13879 ) ( not ( = ?auto_13882 ?auto_13881 ) ) ( HOIST-AT ?auto_13884 ?auto_13882 ) ( AVAILABLE ?auto_13884 ) ( SURFACE-AT ?auto_13879 ?auto_13882 ) ( ON ?auto_13879 ?auto_13885 ) ( CLEAR ?auto_13879 ) ( not ( = ?auto_13880 ?auto_13879 ) ) ( not ( = ?auto_13880 ?auto_13885 ) ) ( not ( = ?auto_13879 ?auto_13885 ) ) ( not ( = ?auto_13886 ?auto_13884 ) ) ( IS-CRATE ?auto_13880 ) ( not ( = ?auto_13910 ?auto_13881 ) ) ( HOIST-AT ?auto_13909 ?auto_13910 ) ( AVAILABLE ?auto_13909 ) ( SURFACE-AT ?auto_13880 ?auto_13910 ) ( ON ?auto_13880 ?auto_13891 ) ( CLEAR ?auto_13880 ) ( not ( = ?auto_13878 ?auto_13880 ) ) ( not ( = ?auto_13878 ?auto_13891 ) ) ( not ( = ?auto_13880 ?auto_13891 ) ) ( not ( = ?auto_13886 ?auto_13909 ) ) ( IS-CRATE ?auto_13878 ) ( not ( = ?auto_13911 ?auto_13881 ) ) ( HOIST-AT ?auto_13895 ?auto_13911 ) ( SURFACE-AT ?auto_13878 ?auto_13911 ) ( ON ?auto_13878 ?auto_13900 ) ( CLEAR ?auto_13878 ) ( not ( = ?auto_13875 ?auto_13878 ) ) ( not ( = ?auto_13875 ?auto_13900 ) ) ( not ( = ?auto_13878 ?auto_13900 ) ) ( not ( = ?auto_13886 ?auto_13895 ) ) ( IS-CRATE ?auto_13875 ) ( AVAILABLE ?auto_13895 ) ( SURFACE-AT ?auto_13875 ?auto_13911 ) ( ON ?auto_13875 ?auto_13897 ) ( CLEAR ?auto_13875 ) ( not ( = ?auto_13876 ?auto_13875 ) ) ( not ( = ?auto_13876 ?auto_13897 ) ) ( not ( = ?auto_13875 ?auto_13897 ) ) ( IS-CRATE ?auto_13876 ) ( not ( = ?auto_13892 ?auto_13881 ) ) ( HOIST-AT ?auto_13894 ?auto_13892 ) ( SURFACE-AT ?auto_13876 ?auto_13892 ) ( ON ?auto_13876 ?auto_13902 ) ( CLEAR ?auto_13876 ) ( not ( = ?auto_13877 ?auto_13876 ) ) ( not ( = ?auto_13877 ?auto_13902 ) ) ( not ( = ?auto_13876 ?auto_13902 ) ) ( not ( = ?auto_13886 ?auto_13894 ) ) ( IS-CRATE ?auto_13877 ) ( not ( = ?auto_13888 ?auto_13881 ) ) ( HOIST-AT ?auto_13903 ?auto_13888 ) ( AVAILABLE ?auto_13903 ) ( SURFACE-AT ?auto_13877 ?auto_13888 ) ( ON ?auto_13877 ?auto_13893 ) ( CLEAR ?auto_13877 ) ( not ( = ?auto_13874 ?auto_13877 ) ) ( not ( = ?auto_13874 ?auto_13893 ) ) ( not ( = ?auto_13877 ?auto_13893 ) ) ( not ( = ?auto_13886 ?auto_13903 ) ) ( IS-CRATE ?auto_13874 ) ( not ( = ?auto_13901 ?auto_13881 ) ) ( HOIST-AT ?auto_13905 ?auto_13901 ) ( AVAILABLE ?auto_13905 ) ( SURFACE-AT ?auto_13874 ?auto_13901 ) ( ON ?auto_13874 ?auto_13907 ) ( CLEAR ?auto_13874 ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13907 ) ) ( not ( = ?auto_13874 ?auto_13907 ) ) ( not ( = ?auto_13886 ?auto_13905 ) ) ( IS-CRATE ?auto_13873 ) ( not ( = ?auto_13898 ?auto_13881 ) ) ( HOIST-AT ?auto_13887 ?auto_13898 ) ( AVAILABLE ?auto_13887 ) ( SURFACE-AT ?auto_13873 ?auto_13898 ) ( ON ?auto_13873 ?auto_13896 ) ( CLEAR ?auto_13873 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13896 ) ) ( not ( = ?auto_13873 ?auto_13896 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( IS-CRATE ?auto_13872 ) ( AVAILABLE ?auto_13894 ) ( SURFACE-AT ?auto_13872 ?auto_13892 ) ( ON ?auto_13872 ?auto_13890 ) ( CLEAR ?auto_13872 ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13890 ) ) ( not ( = ?auto_13872 ?auto_13890 ) ) ( IS-CRATE ?auto_13871 ) ( not ( = ?auto_13899 ?auto_13881 ) ) ( HOIST-AT ?auto_13904 ?auto_13899 ) ( AVAILABLE ?auto_13904 ) ( SURFACE-AT ?auto_13871 ?auto_13899 ) ( ON ?auto_13871 ?auto_13908 ) ( CLEAR ?auto_13871 ) ( not ( = ?auto_13870 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13908 ) ) ( not ( = ?auto_13871 ?auto_13908 ) ) ( not ( = ?auto_13886 ?auto_13904 ) ) ( SURFACE-AT ?auto_13869 ?auto_13881 ) ( CLEAR ?auto_13869 ) ( IS-CRATE ?auto_13870 ) ( AVAILABLE ?auto_13886 ) ( not ( = ?auto_13889 ?auto_13881 ) ) ( HOIST-AT ?auto_13912 ?auto_13889 ) ( AVAILABLE ?auto_13912 ) ( SURFACE-AT ?auto_13870 ?auto_13889 ) ( ON ?auto_13870 ?auto_13906 ) ( CLEAR ?auto_13870 ) ( TRUCK-AT ?auto_13883 ?auto_13881 ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13906 ) ) ( not ( = ?auto_13870 ?auto_13906 ) ) ( not ( = ?auto_13886 ?auto_13912 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13908 ) ) ( not ( = ?auto_13871 ?auto_13906 ) ) ( not ( = ?auto_13899 ?auto_13889 ) ) ( not ( = ?auto_13904 ?auto_13912 ) ) ( not ( = ?auto_13908 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) ( not ( = ?auto_13869 ?auto_13890 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( not ( = ?auto_13870 ?auto_13890 ) ) ( not ( = ?auto_13872 ?auto_13908 ) ) ( not ( = ?auto_13872 ?auto_13906 ) ) ( not ( = ?auto_13892 ?auto_13899 ) ) ( not ( = ?auto_13892 ?auto_13889 ) ) ( not ( = ?auto_13894 ?auto_13904 ) ) ( not ( = ?auto_13894 ?auto_13912 ) ) ( not ( = ?auto_13890 ?auto_13908 ) ) ( not ( = ?auto_13890 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) ( not ( = ?auto_13869 ?auto_13896 ) ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( not ( = ?auto_13870 ?auto_13896 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13896 ) ) ( not ( = ?auto_13873 ?auto_13890 ) ) ( not ( = ?auto_13873 ?auto_13908 ) ) ( not ( = ?auto_13873 ?auto_13906 ) ) ( not ( = ?auto_13898 ?auto_13892 ) ) ( not ( = ?auto_13898 ?auto_13899 ) ) ( not ( = ?auto_13898 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13894 ) ) ( not ( = ?auto_13887 ?auto_13904 ) ) ( not ( = ?auto_13887 ?auto_13912 ) ) ( not ( = ?auto_13896 ?auto_13890 ) ) ( not ( = ?auto_13896 ?auto_13908 ) ) ( not ( = ?auto_13896 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13874 ) ) ( not ( = ?auto_13869 ?auto_13907 ) ) ( not ( = ?auto_13870 ?auto_13874 ) ) ( not ( = ?auto_13870 ?auto_13907 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13907 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13907 ) ) ( not ( = ?auto_13874 ?auto_13896 ) ) ( not ( = ?auto_13874 ?auto_13890 ) ) ( not ( = ?auto_13874 ?auto_13908 ) ) ( not ( = ?auto_13874 ?auto_13906 ) ) ( not ( = ?auto_13901 ?auto_13898 ) ) ( not ( = ?auto_13901 ?auto_13892 ) ) ( not ( = ?auto_13901 ?auto_13899 ) ) ( not ( = ?auto_13901 ?auto_13889 ) ) ( not ( = ?auto_13905 ?auto_13887 ) ) ( not ( = ?auto_13905 ?auto_13894 ) ) ( not ( = ?auto_13905 ?auto_13904 ) ) ( not ( = ?auto_13905 ?auto_13912 ) ) ( not ( = ?auto_13907 ?auto_13896 ) ) ( not ( = ?auto_13907 ?auto_13890 ) ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( not ( = ?auto_13907 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13877 ) ) ( not ( = ?auto_13869 ?auto_13893 ) ) ( not ( = ?auto_13870 ?auto_13877 ) ) ( not ( = ?auto_13870 ?auto_13893 ) ) ( not ( = ?auto_13871 ?auto_13877 ) ) ( not ( = ?auto_13871 ?auto_13893 ) ) ( not ( = ?auto_13872 ?auto_13877 ) ) ( not ( = ?auto_13872 ?auto_13893 ) ) ( not ( = ?auto_13873 ?auto_13877 ) ) ( not ( = ?auto_13873 ?auto_13893 ) ) ( not ( = ?auto_13877 ?auto_13907 ) ) ( not ( = ?auto_13877 ?auto_13896 ) ) ( not ( = ?auto_13877 ?auto_13890 ) ) ( not ( = ?auto_13877 ?auto_13908 ) ) ( not ( = ?auto_13877 ?auto_13906 ) ) ( not ( = ?auto_13888 ?auto_13901 ) ) ( not ( = ?auto_13888 ?auto_13898 ) ) ( not ( = ?auto_13888 ?auto_13892 ) ) ( not ( = ?auto_13888 ?auto_13899 ) ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( not ( = ?auto_13903 ?auto_13905 ) ) ( not ( = ?auto_13903 ?auto_13887 ) ) ( not ( = ?auto_13903 ?auto_13894 ) ) ( not ( = ?auto_13903 ?auto_13904 ) ) ( not ( = ?auto_13903 ?auto_13912 ) ) ( not ( = ?auto_13893 ?auto_13907 ) ) ( not ( = ?auto_13893 ?auto_13896 ) ) ( not ( = ?auto_13893 ?auto_13890 ) ) ( not ( = ?auto_13893 ?auto_13908 ) ) ( not ( = ?auto_13893 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13876 ) ) ( not ( = ?auto_13869 ?auto_13902 ) ) ( not ( = ?auto_13870 ?auto_13876 ) ) ( not ( = ?auto_13870 ?auto_13902 ) ) ( not ( = ?auto_13871 ?auto_13876 ) ) ( not ( = ?auto_13871 ?auto_13902 ) ) ( not ( = ?auto_13872 ?auto_13876 ) ) ( not ( = ?auto_13872 ?auto_13902 ) ) ( not ( = ?auto_13873 ?auto_13876 ) ) ( not ( = ?auto_13873 ?auto_13902 ) ) ( not ( = ?auto_13874 ?auto_13876 ) ) ( not ( = ?auto_13874 ?auto_13902 ) ) ( not ( = ?auto_13876 ?auto_13893 ) ) ( not ( = ?auto_13876 ?auto_13907 ) ) ( not ( = ?auto_13876 ?auto_13896 ) ) ( not ( = ?auto_13876 ?auto_13890 ) ) ( not ( = ?auto_13876 ?auto_13908 ) ) ( not ( = ?auto_13876 ?auto_13906 ) ) ( not ( = ?auto_13902 ?auto_13893 ) ) ( not ( = ?auto_13902 ?auto_13907 ) ) ( not ( = ?auto_13902 ?auto_13896 ) ) ( not ( = ?auto_13902 ?auto_13890 ) ) ( not ( = ?auto_13902 ?auto_13908 ) ) ( not ( = ?auto_13902 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13875 ) ) ( not ( = ?auto_13869 ?auto_13897 ) ) ( not ( = ?auto_13870 ?auto_13875 ) ) ( not ( = ?auto_13870 ?auto_13897 ) ) ( not ( = ?auto_13871 ?auto_13875 ) ) ( not ( = ?auto_13871 ?auto_13897 ) ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13872 ?auto_13897 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( not ( = ?auto_13873 ?auto_13897 ) ) ( not ( = ?auto_13874 ?auto_13875 ) ) ( not ( = ?auto_13874 ?auto_13897 ) ) ( not ( = ?auto_13877 ?auto_13875 ) ) ( not ( = ?auto_13877 ?auto_13897 ) ) ( not ( = ?auto_13875 ?auto_13902 ) ) ( not ( = ?auto_13875 ?auto_13893 ) ) ( not ( = ?auto_13875 ?auto_13907 ) ) ( not ( = ?auto_13875 ?auto_13896 ) ) ( not ( = ?auto_13875 ?auto_13890 ) ) ( not ( = ?auto_13875 ?auto_13908 ) ) ( not ( = ?auto_13875 ?auto_13906 ) ) ( not ( = ?auto_13911 ?auto_13892 ) ) ( not ( = ?auto_13911 ?auto_13888 ) ) ( not ( = ?auto_13911 ?auto_13901 ) ) ( not ( = ?auto_13911 ?auto_13898 ) ) ( not ( = ?auto_13911 ?auto_13899 ) ) ( not ( = ?auto_13911 ?auto_13889 ) ) ( not ( = ?auto_13895 ?auto_13894 ) ) ( not ( = ?auto_13895 ?auto_13903 ) ) ( not ( = ?auto_13895 ?auto_13905 ) ) ( not ( = ?auto_13895 ?auto_13887 ) ) ( not ( = ?auto_13895 ?auto_13904 ) ) ( not ( = ?auto_13895 ?auto_13912 ) ) ( not ( = ?auto_13897 ?auto_13902 ) ) ( not ( = ?auto_13897 ?auto_13893 ) ) ( not ( = ?auto_13897 ?auto_13907 ) ) ( not ( = ?auto_13897 ?auto_13896 ) ) ( not ( = ?auto_13897 ?auto_13890 ) ) ( not ( = ?auto_13897 ?auto_13908 ) ) ( not ( = ?auto_13897 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13878 ) ) ( not ( = ?auto_13869 ?auto_13900 ) ) ( not ( = ?auto_13870 ?auto_13878 ) ) ( not ( = ?auto_13870 ?auto_13900 ) ) ( not ( = ?auto_13871 ?auto_13878 ) ) ( not ( = ?auto_13871 ?auto_13900 ) ) ( not ( = ?auto_13872 ?auto_13878 ) ) ( not ( = ?auto_13872 ?auto_13900 ) ) ( not ( = ?auto_13873 ?auto_13878 ) ) ( not ( = ?auto_13873 ?auto_13900 ) ) ( not ( = ?auto_13874 ?auto_13878 ) ) ( not ( = ?auto_13874 ?auto_13900 ) ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( not ( = ?auto_13877 ?auto_13900 ) ) ( not ( = ?auto_13876 ?auto_13878 ) ) ( not ( = ?auto_13876 ?auto_13900 ) ) ( not ( = ?auto_13878 ?auto_13897 ) ) ( not ( = ?auto_13878 ?auto_13902 ) ) ( not ( = ?auto_13878 ?auto_13893 ) ) ( not ( = ?auto_13878 ?auto_13907 ) ) ( not ( = ?auto_13878 ?auto_13896 ) ) ( not ( = ?auto_13878 ?auto_13890 ) ) ( not ( = ?auto_13878 ?auto_13908 ) ) ( not ( = ?auto_13878 ?auto_13906 ) ) ( not ( = ?auto_13900 ?auto_13897 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( not ( = ?auto_13900 ?auto_13893 ) ) ( not ( = ?auto_13900 ?auto_13907 ) ) ( not ( = ?auto_13900 ?auto_13896 ) ) ( not ( = ?auto_13900 ?auto_13890 ) ) ( not ( = ?auto_13900 ?auto_13908 ) ) ( not ( = ?auto_13900 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13880 ) ) ( not ( = ?auto_13869 ?auto_13891 ) ) ( not ( = ?auto_13870 ?auto_13880 ) ) ( not ( = ?auto_13870 ?auto_13891 ) ) ( not ( = ?auto_13871 ?auto_13880 ) ) ( not ( = ?auto_13871 ?auto_13891 ) ) ( not ( = ?auto_13872 ?auto_13880 ) ) ( not ( = ?auto_13872 ?auto_13891 ) ) ( not ( = ?auto_13873 ?auto_13880 ) ) ( not ( = ?auto_13873 ?auto_13891 ) ) ( not ( = ?auto_13874 ?auto_13880 ) ) ( not ( = ?auto_13874 ?auto_13891 ) ) ( not ( = ?auto_13877 ?auto_13880 ) ) ( not ( = ?auto_13877 ?auto_13891 ) ) ( not ( = ?auto_13876 ?auto_13880 ) ) ( not ( = ?auto_13876 ?auto_13891 ) ) ( not ( = ?auto_13875 ?auto_13880 ) ) ( not ( = ?auto_13875 ?auto_13891 ) ) ( not ( = ?auto_13880 ?auto_13900 ) ) ( not ( = ?auto_13880 ?auto_13897 ) ) ( not ( = ?auto_13880 ?auto_13902 ) ) ( not ( = ?auto_13880 ?auto_13893 ) ) ( not ( = ?auto_13880 ?auto_13907 ) ) ( not ( = ?auto_13880 ?auto_13896 ) ) ( not ( = ?auto_13880 ?auto_13890 ) ) ( not ( = ?auto_13880 ?auto_13908 ) ) ( not ( = ?auto_13880 ?auto_13906 ) ) ( not ( = ?auto_13910 ?auto_13911 ) ) ( not ( = ?auto_13910 ?auto_13892 ) ) ( not ( = ?auto_13910 ?auto_13888 ) ) ( not ( = ?auto_13910 ?auto_13901 ) ) ( not ( = ?auto_13910 ?auto_13898 ) ) ( not ( = ?auto_13910 ?auto_13899 ) ) ( not ( = ?auto_13910 ?auto_13889 ) ) ( not ( = ?auto_13909 ?auto_13895 ) ) ( not ( = ?auto_13909 ?auto_13894 ) ) ( not ( = ?auto_13909 ?auto_13903 ) ) ( not ( = ?auto_13909 ?auto_13905 ) ) ( not ( = ?auto_13909 ?auto_13887 ) ) ( not ( = ?auto_13909 ?auto_13904 ) ) ( not ( = ?auto_13909 ?auto_13912 ) ) ( not ( = ?auto_13891 ?auto_13900 ) ) ( not ( = ?auto_13891 ?auto_13897 ) ) ( not ( = ?auto_13891 ?auto_13902 ) ) ( not ( = ?auto_13891 ?auto_13893 ) ) ( not ( = ?auto_13891 ?auto_13907 ) ) ( not ( = ?auto_13891 ?auto_13896 ) ) ( not ( = ?auto_13891 ?auto_13890 ) ) ( not ( = ?auto_13891 ?auto_13908 ) ) ( not ( = ?auto_13891 ?auto_13906 ) ) ( not ( = ?auto_13869 ?auto_13879 ) ) ( not ( = ?auto_13869 ?auto_13885 ) ) ( not ( = ?auto_13870 ?auto_13879 ) ) ( not ( = ?auto_13870 ?auto_13885 ) ) ( not ( = ?auto_13871 ?auto_13879 ) ) ( not ( = ?auto_13871 ?auto_13885 ) ) ( not ( = ?auto_13872 ?auto_13879 ) ) ( not ( = ?auto_13872 ?auto_13885 ) ) ( not ( = ?auto_13873 ?auto_13879 ) ) ( not ( = ?auto_13873 ?auto_13885 ) ) ( not ( = ?auto_13874 ?auto_13879 ) ) ( not ( = ?auto_13874 ?auto_13885 ) ) ( not ( = ?auto_13877 ?auto_13879 ) ) ( not ( = ?auto_13877 ?auto_13885 ) ) ( not ( = ?auto_13876 ?auto_13879 ) ) ( not ( = ?auto_13876 ?auto_13885 ) ) ( not ( = ?auto_13875 ?auto_13879 ) ) ( not ( = ?auto_13875 ?auto_13885 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13885 ) ) ( not ( = ?auto_13879 ?auto_13891 ) ) ( not ( = ?auto_13879 ?auto_13900 ) ) ( not ( = ?auto_13879 ?auto_13897 ) ) ( not ( = ?auto_13879 ?auto_13902 ) ) ( not ( = ?auto_13879 ?auto_13893 ) ) ( not ( = ?auto_13879 ?auto_13907 ) ) ( not ( = ?auto_13879 ?auto_13896 ) ) ( not ( = ?auto_13879 ?auto_13890 ) ) ( not ( = ?auto_13879 ?auto_13908 ) ) ( not ( = ?auto_13879 ?auto_13906 ) ) ( not ( = ?auto_13882 ?auto_13910 ) ) ( not ( = ?auto_13882 ?auto_13911 ) ) ( not ( = ?auto_13882 ?auto_13892 ) ) ( not ( = ?auto_13882 ?auto_13888 ) ) ( not ( = ?auto_13882 ?auto_13901 ) ) ( not ( = ?auto_13882 ?auto_13898 ) ) ( not ( = ?auto_13882 ?auto_13899 ) ) ( not ( = ?auto_13882 ?auto_13889 ) ) ( not ( = ?auto_13884 ?auto_13909 ) ) ( not ( = ?auto_13884 ?auto_13895 ) ) ( not ( = ?auto_13884 ?auto_13894 ) ) ( not ( = ?auto_13884 ?auto_13903 ) ) ( not ( = ?auto_13884 ?auto_13905 ) ) ( not ( = ?auto_13884 ?auto_13887 ) ) ( not ( = ?auto_13884 ?auto_13904 ) ) ( not ( = ?auto_13884 ?auto_13912 ) ) ( not ( = ?auto_13885 ?auto_13891 ) ) ( not ( = ?auto_13885 ?auto_13900 ) ) ( not ( = ?auto_13885 ?auto_13897 ) ) ( not ( = ?auto_13885 ?auto_13902 ) ) ( not ( = ?auto_13885 ?auto_13893 ) ) ( not ( = ?auto_13885 ?auto_13907 ) ) ( not ( = ?auto_13885 ?auto_13896 ) ) ( not ( = ?auto_13885 ?auto_13890 ) ) ( not ( = ?auto_13885 ?auto_13908 ) ) ( not ( = ?auto_13885 ?auto_13906 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13877 ?auto_13876 ?auto_13875 ?auto_13878 ?auto_13880 )
      ( MAKE-1CRATE ?auto_13880 ?auto_13879 )
      ( MAKE-11CRATE-VERIFY ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13877 ?auto_13876 ?auto_13875 ?auto_13878 ?auto_13880 ?auto_13879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13915 - SURFACE
      ?auto_13916 - SURFACE
    )
    :vars
    (
      ?auto_13917 - HOIST
      ?auto_13918 - PLACE
      ?auto_13920 - PLACE
      ?auto_13921 - HOIST
      ?auto_13922 - SURFACE
      ?auto_13919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13917 ?auto_13918 ) ( SURFACE-AT ?auto_13915 ?auto_13918 ) ( CLEAR ?auto_13915 ) ( IS-CRATE ?auto_13916 ) ( AVAILABLE ?auto_13917 ) ( not ( = ?auto_13920 ?auto_13918 ) ) ( HOIST-AT ?auto_13921 ?auto_13920 ) ( AVAILABLE ?auto_13921 ) ( SURFACE-AT ?auto_13916 ?auto_13920 ) ( ON ?auto_13916 ?auto_13922 ) ( CLEAR ?auto_13916 ) ( TRUCK-AT ?auto_13919 ?auto_13918 ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13922 ) ) ( not ( = ?auto_13916 ?auto_13922 ) ) ( not ( = ?auto_13917 ?auto_13921 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13919 ?auto_13918 ?auto_13920 )
      ( !LIFT ?auto_13921 ?auto_13916 ?auto_13922 ?auto_13920 )
      ( !LOAD ?auto_13921 ?auto_13916 ?auto_13919 ?auto_13920 )
      ( !DRIVE ?auto_13919 ?auto_13920 ?auto_13918 )
      ( !UNLOAD ?auto_13917 ?auto_13916 ?auto_13919 ?auto_13918 )
      ( !DROP ?auto_13917 ?auto_13916 ?auto_13915 ?auto_13918 )
      ( MAKE-1CRATE-VERIFY ?auto_13915 ?auto_13916 ) )
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
      ?auto_13944 - SURFACE
      ?auto_13943 - SURFACE
      ?auto_13942 - SURFACE
      ?auto_13945 - SURFACE
      ?auto_13947 - SURFACE
      ?auto_13946 - SURFACE
      ?auto_13948 - SURFACE
    )
    :vars
    (
      ?auto_13952 - HOIST
      ?auto_13949 - PLACE
      ?auto_13953 - PLACE
      ?auto_13954 - HOIST
      ?auto_13950 - SURFACE
      ?auto_13957 - PLACE
      ?auto_13974 - HOIST
      ?auto_13959 - SURFACE
      ?auto_13970 - PLACE
      ?auto_13962 - HOIST
      ?auto_13978 - SURFACE
      ?auto_13958 - SURFACE
      ?auto_13980 - SURFACE
      ?auto_13976 - PLACE
      ?auto_13966 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13960 - PLACE
      ?auto_13972 - HOIST
      ?auto_13973 - SURFACE
      ?auto_13969 - PLACE
      ?auto_13963 - HOIST
      ?auto_13956 - SURFACE
      ?auto_13955 - PLACE
      ?auto_13961 - HOIST
      ?auto_13981 - SURFACE
      ?auto_13964 - SURFACE
      ?auto_13968 - PLACE
      ?auto_13965 - HOIST
      ?auto_13975 - SURFACE
      ?auto_13971 - PLACE
      ?auto_13967 - HOIST
      ?auto_13979 - SURFACE
      ?auto_13951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13952 ?auto_13949 ) ( IS-CRATE ?auto_13948 ) ( not ( = ?auto_13953 ?auto_13949 ) ) ( HOIST-AT ?auto_13954 ?auto_13953 ) ( SURFACE-AT ?auto_13948 ?auto_13953 ) ( ON ?auto_13948 ?auto_13950 ) ( CLEAR ?auto_13948 ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13950 ) ) ( not ( = ?auto_13948 ?auto_13950 ) ) ( not ( = ?auto_13952 ?auto_13954 ) ) ( IS-CRATE ?auto_13946 ) ( not ( = ?auto_13957 ?auto_13949 ) ) ( HOIST-AT ?auto_13974 ?auto_13957 ) ( AVAILABLE ?auto_13974 ) ( SURFACE-AT ?auto_13946 ?auto_13957 ) ( ON ?auto_13946 ?auto_13959 ) ( CLEAR ?auto_13946 ) ( not ( = ?auto_13947 ?auto_13946 ) ) ( not ( = ?auto_13947 ?auto_13959 ) ) ( not ( = ?auto_13946 ?auto_13959 ) ) ( not ( = ?auto_13952 ?auto_13974 ) ) ( IS-CRATE ?auto_13947 ) ( not ( = ?auto_13970 ?auto_13949 ) ) ( HOIST-AT ?auto_13962 ?auto_13970 ) ( AVAILABLE ?auto_13962 ) ( SURFACE-AT ?auto_13947 ?auto_13970 ) ( ON ?auto_13947 ?auto_13978 ) ( CLEAR ?auto_13947 ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13978 ) ) ( not ( = ?auto_13947 ?auto_13978 ) ) ( not ( = ?auto_13952 ?auto_13962 ) ) ( IS-CRATE ?auto_13945 ) ( SURFACE-AT ?auto_13945 ?auto_13953 ) ( ON ?auto_13945 ?auto_13958 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13942 ?auto_13945 ) ) ( not ( = ?auto_13942 ?auto_13958 ) ) ( not ( = ?auto_13945 ?auto_13958 ) ) ( IS-CRATE ?auto_13942 ) ( AVAILABLE ?auto_13954 ) ( SURFACE-AT ?auto_13942 ?auto_13953 ) ( ON ?auto_13942 ?auto_13980 ) ( CLEAR ?auto_13942 ) ( not ( = ?auto_13943 ?auto_13942 ) ) ( not ( = ?auto_13943 ?auto_13980 ) ) ( not ( = ?auto_13942 ?auto_13980 ) ) ( IS-CRATE ?auto_13943 ) ( not ( = ?auto_13976 ?auto_13949 ) ) ( HOIST-AT ?auto_13966 ?auto_13976 ) ( SURFACE-AT ?auto_13943 ?auto_13976 ) ( ON ?auto_13943 ?auto_13977 ) ( CLEAR ?auto_13943 ) ( not ( = ?auto_13944 ?auto_13943 ) ) ( not ( = ?auto_13944 ?auto_13977 ) ) ( not ( = ?auto_13943 ?auto_13977 ) ) ( not ( = ?auto_13952 ?auto_13966 ) ) ( IS-CRATE ?auto_13944 ) ( not ( = ?auto_13960 ?auto_13949 ) ) ( HOIST-AT ?auto_13972 ?auto_13960 ) ( AVAILABLE ?auto_13972 ) ( SURFACE-AT ?auto_13944 ?auto_13960 ) ( ON ?auto_13944 ?auto_13973 ) ( CLEAR ?auto_13944 ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13973 ) ) ( not ( = ?auto_13944 ?auto_13973 ) ) ( not ( = ?auto_13952 ?auto_13972 ) ) ( IS-CRATE ?auto_13941 ) ( not ( = ?auto_13969 ?auto_13949 ) ) ( HOIST-AT ?auto_13963 ?auto_13969 ) ( AVAILABLE ?auto_13963 ) ( SURFACE-AT ?auto_13941 ?auto_13969 ) ( ON ?auto_13941 ?auto_13956 ) ( CLEAR ?auto_13941 ) ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13956 ) ) ( not ( = ?auto_13941 ?auto_13956 ) ) ( not ( = ?auto_13952 ?auto_13963 ) ) ( IS-CRATE ?auto_13940 ) ( not ( = ?auto_13955 ?auto_13949 ) ) ( HOIST-AT ?auto_13961 ?auto_13955 ) ( AVAILABLE ?auto_13961 ) ( SURFACE-AT ?auto_13940 ?auto_13955 ) ( ON ?auto_13940 ?auto_13981 ) ( CLEAR ?auto_13940 ) ( not ( = ?auto_13939 ?auto_13940 ) ) ( not ( = ?auto_13939 ?auto_13981 ) ) ( not ( = ?auto_13940 ?auto_13981 ) ) ( not ( = ?auto_13952 ?auto_13961 ) ) ( IS-CRATE ?auto_13939 ) ( AVAILABLE ?auto_13966 ) ( SURFACE-AT ?auto_13939 ?auto_13976 ) ( ON ?auto_13939 ?auto_13964 ) ( CLEAR ?auto_13939 ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13964 ) ) ( not ( = ?auto_13939 ?auto_13964 ) ) ( IS-CRATE ?auto_13938 ) ( not ( = ?auto_13968 ?auto_13949 ) ) ( HOIST-AT ?auto_13965 ?auto_13968 ) ( AVAILABLE ?auto_13965 ) ( SURFACE-AT ?auto_13938 ?auto_13968 ) ( ON ?auto_13938 ?auto_13975 ) ( CLEAR ?auto_13938 ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13975 ) ) ( not ( = ?auto_13938 ?auto_13975 ) ) ( not ( = ?auto_13952 ?auto_13965 ) ) ( SURFACE-AT ?auto_13936 ?auto_13949 ) ( CLEAR ?auto_13936 ) ( IS-CRATE ?auto_13937 ) ( AVAILABLE ?auto_13952 ) ( not ( = ?auto_13971 ?auto_13949 ) ) ( HOIST-AT ?auto_13967 ?auto_13971 ) ( AVAILABLE ?auto_13967 ) ( SURFACE-AT ?auto_13937 ?auto_13971 ) ( ON ?auto_13937 ?auto_13979 ) ( CLEAR ?auto_13937 ) ( TRUCK-AT ?auto_13951 ?auto_13949 ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13979 ) ) ( not ( = ?auto_13937 ?auto_13979 ) ) ( not ( = ?auto_13952 ?auto_13967 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13975 ) ) ( not ( = ?auto_13938 ?auto_13979 ) ) ( not ( = ?auto_13968 ?auto_13971 ) ) ( not ( = ?auto_13965 ?auto_13967 ) ) ( not ( = ?auto_13975 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13964 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13964 ) ) ( not ( = ?auto_13939 ?auto_13975 ) ) ( not ( = ?auto_13939 ?auto_13979 ) ) ( not ( = ?auto_13976 ?auto_13968 ) ) ( not ( = ?auto_13976 ?auto_13971 ) ) ( not ( = ?auto_13966 ?auto_13965 ) ) ( not ( = ?auto_13966 ?auto_13967 ) ) ( not ( = ?auto_13964 ?auto_13975 ) ) ( not ( = ?auto_13964 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13940 ) ) ( not ( = ?auto_13936 ?auto_13981 ) ) ( not ( = ?auto_13937 ?auto_13940 ) ) ( not ( = ?auto_13937 ?auto_13981 ) ) ( not ( = ?auto_13938 ?auto_13940 ) ) ( not ( = ?auto_13938 ?auto_13981 ) ) ( not ( = ?auto_13940 ?auto_13964 ) ) ( not ( = ?auto_13940 ?auto_13975 ) ) ( not ( = ?auto_13940 ?auto_13979 ) ) ( not ( = ?auto_13955 ?auto_13976 ) ) ( not ( = ?auto_13955 ?auto_13968 ) ) ( not ( = ?auto_13955 ?auto_13971 ) ) ( not ( = ?auto_13961 ?auto_13966 ) ) ( not ( = ?auto_13961 ?auto_13965 ) ) ( not ( = ?auto_13961 ?auto_13967 ) ) ( not ( = ?auto_13981 ?auto_13964 ) ) ( not ( = ?auto_13981 ?auto_13975 ) ) ( not ( = ?auto_13981 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13941 ) ) ( not ( = ?auto_13936 ?auto_13956 ) ) ( not ( = ?auto_13937 ?auto_13941 ) ) ( not ( = ?auto_13937 ?auto_13956 ) ) ( not ( = ?auto_13938 ?auto_13941 ) ) ( not ( = ?auto_13938 ?auto_13956 ) ) ( not ( = ?auto_13939 ?auto_13941 ) ) ( not ( = ?auto_13939 ?auto_13956 ) ) ( not ( = ?auto_13941 ?auto_13981 ) ) ( not ( = ?auto_13941 ?auto_13964 ) ) ( not ( = ?auto_13941 ?auto_13975 ) ) ( not ( = ?auto_13941 ?auto_13979 ) ) ( not ( = ?auto_13969 ?auto_13955 ) ) ( not ( = ?auto_13969 ?auto_13976 ) ) ( not ( = ?auto_13969 ?auto_13968 ) ) ( not ( = ?auto_13969 ?auto_13971 ) ) ( not ( = ?auto_13963 ?auto_13961 ) ) ( not ( = ?auto_13963 ?auto_13966 ) ) ( not ( = ?auto_13963 ?auto_13965 ) ) ( not ( = ?auto_13963 ?auto_13967 ) ) ( not ( = ?auto_13956 ?auto_13981 ) ) ( not ( = ?auto_13956 ?auto_13964 ) ) ( not ( = ?auto_13956 ?auto_13975 ) ) ( not ( = ?auto_13956 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13944 ) ) ( not ( = ?auto_13936 ?auto_13973 ) ) ( not ( = ?auto_13937 ?auto_13944 ) ) ( not ( = ?auto_13937 ?auto_13973 ) ) ( not ( = ?auto_13938 ?auto_13944 ) ) ( not ( = ?auto_13938 ?auto_13973 ) ) ( not ( = ?auto_13939 ?auto_13944 ) ) ( not ( = ?auto_13939 ?auto_13973 ) ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13940 ?auto_13973 ) ) ( not ( = ?auto_13944 ?auto_13956 ) ) ( not ( = ?auto_13944 ?auto_13981 ) ) ( not ( = ?auto_13944 ?auto_13964 ) ) ( not ( = ?auto_13944 ?auto_13975 ) ) ( not ( = ?auto_13944 ?auto_13979 ) ) ( not ( = ?auto_13960 ?auto_13969 ) ) ( not ( = ?auto_13960 ?auto_13955 ) ) ( not ( = ?auto_13960 ?auto_13976 ) ) ( not ( = ?auto_13960 ?auto_13968 ) ) ( not ( = ?auto_13960 ?auto_13971 ) ) ( not ( = ?auto_13972 ?auto_13963 ) ) ( not ( = ?auto_13972 ?auto_13961 ) ) ( not ( = ?auto_13972 ?auto_13966 ) ) ( not ( = ?auto_13972 ?auto_13965 ) ) ( not ( = ?auto_13972 ?auto_13967 ) ) ( not ( = ?auto_13973 ?auto_13956 ) ) ( not ( = ?auto_13973 ?auto_13981 ) ) ( not ( = ?auto_13973 ?auto_13964 ) ) ( not ( = ?auto_13973 ?auto_13975 ) ) ( not ( = ?auto_13973 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13943 ) ) ( not ( = ?auto_13936 ?auto_13977 ) ) ( not ( = ?auto_13937 ?auto_13943 ) ) ( not ( = ?auto_13937 ?auto_13977 ) ) ( not ( = ?auto_13938 ?auto_13943 ) ) ( not ( = ?auto_13938 ?auto_13977 ) ) ( not ( = ?auto_13939 ?auto_13943 ) ) ( not ( = ?auto_13939 ?auto_13977 ) ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13940 ?auto_13977 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( not ( = ?auto_13941 ?auto_13977 ) ) ( not ( = ?auto_13943 ?auto_13973 ) ) ( not ( = ?auto_13943 ?auto_13956 ) ) ( not ( = ?auto_13943 ?auto_13981 ) ) ( not ( = ?auto_13943 ?auto_13964 ) ) ( not ( = ?auto_13943 ?auto_13975 ) ) ( not ( = ?auto_13943 ?auto_13979 ) ) ( not ( = ?auto_13977 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13956 ) ) ( not ( = ?auto_13977 ?auto_13981 ) ) ( not ( = ?auto_13977 ?auto_13964 ) ) ( not ( = ?auto_13977 ?auto_13975 ) ) ( not ( = ?auto_13977 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( not ( = ?auto_13936 ?auto_13980 ) ) ( not ( = ?auto_13937 ?auto_13942 ) ) ( not ( = ?auto_13937 ?auto_13980 ) ) ( not ( = ?auto_13938 ?auto_13942 ) ) ( not ( = ?auto_13938 ?auto_13980 ) ) ( not ( = ?auto_13939 ?auto_13942 ) ) ( not ( = ?auto_13939 ?auto_13980 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13980 ) ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13980 ) ) ( not ( = ?auto_13944 ?auto_13942 ) ) ( not ( = ?auto_13944 ?auto_13980 ) ) ( not ( = ?auto_13942 ?auto_13977 ) ) ( not ( = ?auto_13942 ?auto_13973 ) ) ( not ( = ?auto_13942 ?auto_13956 ) ) ( not ( = ?auto_13942 ?auto_13981 ) ) ( not ( = ?auto_13942 ?auto_13964 ) ) ( not ( = ?auto_13942 ?auto_13975 ) ) ( not ( = ?auto_13942 ?auto_13979 ) ) ( not ( = ?auto_13953 ?auto_13976 ) ) ( not ( = ?auto_13953 ?auto_13960 ) ) ( not ( = ?auto_13953 ?auto_13969 ) ) ( not ( = ?auto_13953 ?auto_13955 ) ) ( not ( = ?auto_13953 ?auto_13968 ) ) ( not ( = ?auto_13953 ?auto_13971 ) ) ( not ( = ?auto_13954 ?auto_13966 ) ) ( not ( = ?auto_13954 ?auto_13972 ) ) ( not ( = ?auto_13954 ?auto_13963 ) ) ( not ( = ?auto_13954 ?auto_13961 ) ) ( not ( = ?auto_13954 ?auto_13965 ) ) ( not ( = ?auto_13954 ?auto_13967 ) ) ( not ( = ?auto_13980 ?auto_13977 ) ) ( not ( = ?auto_13980 ?auto_13973 ) ) ( not ( = ?auto_13980 ?auto_13956 ) ) ( not ( = ?auto_13980 ?auto_13981 ) ) ( not ( = ?auto_13980 ?auto_13964 ) ) ( not ( = ?auto_13980 ?auto_13975 ) ) ( not ( = ?auto_13980 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13945 ) ) ( not ( = ?auto_13936 ?auto_13958 ) ) ( not ( = ?auto_13937 ?auto_13945 ) ) ( not ( = ?auto_13937 ?auto_13958 ) ) ( not ( = ?auto_13938 ?auto_13945 ) ) ( not ( = ?auto_13938 ?auto_13958 ) ) ( not ( = ?auto_13939 ?auto_13945 ) ) ( not ( = ?auto_13939 ?auto_13958 ) ) ( not ( = ?auto_13940 ?auto_13945 ) ) ( not ( = ?auto_13940 ?auto_13958 ) ) ( not ( = ?auto_13941 ?auto_13945 ) ) ( not ( = ?auto_13941 ?auto_13958 ) ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13944 ?auto_13958 ) ) ( not ( = ?auto_13943 ?auto_13945 ) ) ( not ( = ?auto_13943 ?auto_13958 ) ) ( not ( = ?auto_13945 ?auto_13980 ) ) ( not ( = ?auto_13945 ?auto_13977 ) ) ( not ( = ?auto_13945 ?auto_13973 ) ) ( not ( = ?auto_13945 ?auto_13956 ) ) ( not ( = ?auto_13945 ?auto_13981 ) ) ( not ( = ?auto_13945 ?auto_13964 ) ) ( not ( = ?auto_13945 ?auto_13975 ) ) ( not ( = ?auto_13945 ?auto_13979 ) ) ( not ( = ?auto_13958 ?auto_13980 ) ) ( not ( = ?auto_13958 ?auto_13977 ) ) ( not ( = ?auto_13958 ?auto_13973 ) ) ( not ( = ?auto_13958 ?auto_13956 ) ) ( not ( = ?auto_13958 ?auto_13981 ) ) ( not ( = ?auto_13958 ?auto_13964 ) ) ( not ( = ?auto_13958 ?auto_13975 ) ) ( not ( = ?auto_13958 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13947 ) ) ( not ( = ?auto_13936 ?auto_13978 ) ) ( not ( = ?auto_13937 ?auto_13947 ) ) ( not ( = ?auto_13937 ?auto_13978 ) ) ( not ( = ?auto_13938 ?auto_13947 ) ) ( not ( = ?auto_13938 ?auto_13978 ) ) ( not ( = ?auto_13939 ?auto_13947 ) ) ( not ( = ?auto_13939 ?auto_13978 ) ) ( not ( = ?auto_13940 ?auto_13947 ) ) ( not ( = ?auto_13940 ?auto_13978 ) ) ( not ( = ?auto_13941 ?auto_13947 ) ) ( not ( = ?auto_13941 ?auto_13978 ) ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13944 ?auto_13978 ) ) ( not ( = ?auto_13943 ?auto_13947 ) ) ( not ( = ?auto_13943 ?auto_13978 ) ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13942 ?auto_13978 ) ) ( not ( = ?auto_13947 ?auto_13958 ) ) ( not ( = ?auto_13947 ?auto_13980 ) ) ( not ( = ?auto_13947 ?auto_13977 ) ) ( not ( = ?auto_13947 ?auto_13973 ) ) ( not ( = ?auto_13947 ?auto_13956 ) ) ( not ( = ?auto_13947 ?auto_13981 ) ) ( not ( = ?auto_13947 ?auto_13964 ) ) ( not ( = ?auto_13947 ?auto_13975 ) ) ( not ( = ?auto_13947 ?auto_13979 ) ) ( not ( = ?auto_13970 ?auto_13953 ) ) ( not ( = ?auto_13970 ?auto_13976 ) ) ( not ( = ?auto_13970 ?auto_13960 ) ) ( not ( = ?auto_13970 ?auto_13969 ) ) ( not ( = ?auto_13970 ?auto_13955 ) ) ( not ( = ?auto_13970 ?auto_13968 ) ) ( not ( = ?auto_13970 ?auto_13971 ) ) ( not ( = ?auto_13962 ?auto_13954 ) ) ( not ( = ?auto_13962 ?auto_13966 ) ) ( not ( = ?auto_13962 ?auto_13972 ) ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( not ( = ?auto_13962 ?auto_13961 ) ) ( not ( = ?auto_13962 ?auto_13965 ) ) ( not ( = ?auto_13962 ?auto_13967 ) ) ( not ( = ?auto_13978 ?auto_13958 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13977 ) ) ( not ( = ?auto_13978 ?auto_13973 ) ) ( not ( = ?auto_13978 ?auto_13956 ) ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( not ( = ?auto_13978 ?auto_13964 ) ) ( not ( = ?auto_13978 ?auto_13975 ) ) ( not ( = ?auto_13978 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13946 ) ) ( not ( = ?auto_13936 ?auto_13959 ) ) ( not ( = ?auto_13937 ?auto_13946 ) ) ( not ( = ?auto_13937 ?auto_13959 ) ) ( not ( = ?auto_13938 ?auto_13946 ) ) ( not ( = ?auto_13938 ?auto_13959 ) ) ( not ( = ?auto_13939 ?auto_13946 ) ) ( not ( = ?auto_13939 ?auto_13959 ) ) ( not ( = ?auto_13940 ?auto_13946 ) ) ( not ( = ?auto_13940 ?auto_13959 ) ) ( not ( = ?auto_13941 ?auto_13946 ) ) ( not ( = ?auto_13941 ?auto_13959 ) ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13944 ?auto_13959 ) ) ( not ( = ?auto_13943 ?auto_13946 ) ) ( not ( = ?auto_13943 ?auto_13959 ) ) ( not ( = ?auto_13942 ?auto_13946 ) ) ( not ( = ?auto_13942 ?auto_13959 ) ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13959 ) ) ( not ( = ?auto_13946 ?auto_13978 ) ) ( not ( = ?auto_13946 ?auto_13958 ) ) ( not ( = ?auto_13946 ?auto_13980 ) ) ( not ( = ?auto_13946 ?auto_13977 ) ) ( not ( = ?auto_13946 ?auto_13973 ) ) ( not ( = ?auto_13946 ?auto_13956 ) ) ( not ( = ?auto_13946 ?auto_13981 ) ) ( not ( = ?auto_13946 ?auto_13964 ) ) ( not ( = ?auto_13946 ?auto_13975 ) ) ( not ( = ?auto_13946 ?auto_13979 ) ) ( not ( = ?auto_13957 ?auto_13970 ) ) ( not ( = ?auto_13957 ?auto_13953 ) ) ( not ( = ?auto_13957 ?auto_13976 ) ) ( not ( = ?auto_13957 ?auto_13960 ) ) ( not ( = ?auto_13957 ?auto_13969 ) ) ( not ( = ?auto_13957 ?auto_13955 ) ) ( not ( = ?auto_13957 ?auto_13968 ) ) ( not ( = ?auto_13957 ?auto_13971 ) ) ( not ( = ?auto_13974 ?auto_13962 ) ) ( not ( = ?auto_13974 ?auto_13954 ) ) ( not ( = ?auto_13974 ?auto_13966 ) ) ( not ( = ?auto_13974 ?auto_13972 ) ) ( not ( = ?auto_13974 ?auto_13963 ) ) ( not ( = ?auto_13974 ?auto_13961 ) ) ( not ( = ?auto_13974 ?auto_13965 ) ) ( not ( = ?auto_13974 ?auto_13967 ) ) ( not ( = ?auto_13959 ?auto_13978 ) ) ( not ( = ?auto_13959 ?auto_13958 ) ) ( not ( = ?auto_13959 ?auto_13980 ) ) ( not ( = ?auto_13959 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13973 ) ) ( not ( = ?auto_13959 ?auto_13956 ) ) ( not ( = ?auto_13959 ?auto_13981 ) ) ( not ( = ?auto_13959 ?auto_13964 ) ) ( not ( = ?auto_13959 ?auto_13975 ) ) ( not ( = ?auto_13959 ?auto_13979 ) ) ( not ( = ?auto_13936 ?auto_13948 ) ) ( not ( = ?auto_13936 ?auto_13950 ) ) ( not ( = ?auto_13937 ?auto_13948 ) ) ( not ( = ?auto_13937 ?auto_13950 ) ) ( not ( = ?auto_13938 ?auto_13948 ) ) ( not ( = ?auto_13938 ?auto_13950 ) ) ( not ( = ?auto_13939 ?auto_13948 ) ) ( not ( = ?auto_13939 ?auto_13950 ) ) ( not ( = ?auto_13940 ?auto_13948 ) ) ( not ( = ?auto_13940 ?auto_13950 ) ) ( not ( = ?auto_13941 ?auto_13948 ) ) ( not ( = ?auto_13941 ?auto_13950 ) ) ( not ( = ?auto_13944 ?auto_13948 ) ) ( not ( = ?auto_13944 ?auto_13950 ) ) ( not ( = ?auto_13943 ?auto_13948 ) ) ( not ( = ?auto_13943 ?auto_13950 ) ) ( not ( = ?auto_13942 ?auto_13948 ) ) ( not ( = ?auto_13942 ?auto_13950 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13945 ?auto_13950 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13950 ) ) ( not ( = ?auto_13948 ?auto_13959 ) ) ( not ( = ?auto_13948 ?auto_13978 ) ) ( not ( = ?auto_13948 ?auto_13958 ) ) ( not ( = ?auto_13948 ?auto_13980 ) ) ( not ( = ?auto_13948 ?auto_13977 ) ) ( not ( = ?auto_13948 ?auto_13973 ) ) ( not ( = ?auto_13948 ?auto_13956 ) ) ( not ( = ?auto_13948 ?auto_13981 ) ) ( not ( = ?auto_13948 ?auto_13964 ) ) ( not ( = ?auto_13948 ?auto_13975 ) ) ( not ( = ?auto_13948 ?auto_13979 ) ) ( not ( = ?auto_13950 ?auto_13959 ) ) ( not ( = ?auto_13950 ?auto_13978 ) ) ( not ( = ?auto_13950 ?auto_13958 ) ) ( not ( = ?auto_13950 ?auto_13980 ) ) ( not ( = ?auto_13950 ?auto_13977 ) ) ( not ( = ?auto_13950 ?auto_13973 ) ) ( not ( = ?auto_13950 ?auto_13956 ) ) ( not ( = ?auto_13950 ?auto_13981 ) ) ( not ( = ?auto_13950 ?auto_13964 ) ) ( not ( = ?auto_13950 ?auto_13975 ) ) ( not ( = ?auto_13950 ?auto_13979 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13944 ?auto_13943 ?auto_13942 ?auto_13945 ?auto_13947 ?auto_13946 )
      ( MAKE-1CRATE ?auto_13946 ?auto_13948 )
      ( MAKE-12CRATE-VERIFY ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13941 ?auto_13944 ?auto_13943 ?auto_13942 ?auto_13945 ?auto_13947 ?auto_13946 ?auto_13948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13984 - SURFACE
      ?auto_13985 - SURFACE
    )
    :vars
    (
      ?auto_13986 - HOIST
      ?auto_13987 - PLACE
      ?auto_13989 - PLACE
      ?auto_13990 - HOIST
      ?auto_13991 - SURFACE
      ?auto_13988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13986 ?auto_13987 ) ( SURFACE-AT ?auto_13984 ?auto_13987 ) ( CLEAR ?auto_13984 ) ( IS-CRATE ?auto_13985 ) ( AVAILABLE ?auto_13986 ) ( not ( = ?auto_13989 ?auto_13987 ) ) ( HOIST-AT ?auto_13990 ?auto_13989 ) ( AVAILABLE ?auto_13990 ) ( SURFACE-AT ?auto_13985 ?auto_13989 ) ( ON ?auto_13985 ?auto_13991 ) ( CLEAR ?auto_13985 ) ( TRUCK-AT ?auto_13988 ?auto_13987 ) ( not ( = ?auto_13984 ?auto_13985 ) ) ( not ( = ?auto_13984 ?auto_13991 ) ) ( not ( = ?auto_13985 ?auto_13991 ) ) ( not ( = ?auto_13986 ?auto_13990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13988 ?auto_13987 ?auto_13989 )
      ( !LIFT ?auto_13990 ?auto_13985 ?auto_13991 ?auto_13989 )
      ( !LOAD ?auto_13990 ?auto_13985 ?auto_13988 ?auto_13989 )
      ( !DRIVE ?auto_13988 ?auto_13989 ?auto_13987 )
      ( !UNLOAD ?auto_13986 ?auto_13985 ?auto_13988 ?auto_13987 )
      ( !DROP ?auto_13986 ?auto_13985 ?auto_13984 ?auto_13987 )
      ( MAKE-1CRATE-VERIFY ?auto_13984 ?auto_13985 ) )
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
      ?auto_14014 - SURFACE
      ?auto_14013 - SURFACE
      ?auto_14012 - SURFACE
      ?auto_14015 - SURFACE
      ?auto_14017 - SURFACE
      ?auto_14016 - SURFACE
      ?auto_14018 - SURFACE
      ?auto_14019 - SURFACE
    )
    :vars
    (
      ?auto_14023 - HOIST
      ?auto_14020 - PLACE
      ?auto_14024 - PLACE
      ?auto_14021 - HOIST
      ?auto_14022 - SURFACE
      ?auto_14046 - PLACE
      ?auto_14048 - HOIST
      ?auto_14037 - SURFACE
      ?auto_14031 - PLACE
      ?auto_14043 - HOIST
      ?auto_14027 - SURFACE
      ?auto_14028 - PLACE
      ?auto_14047 - HOIST
      ?auto_14039 - SURFACE
      ?auto_14030 - SURFACE
      ?auto_14055 - SURFACE
      ?auto_14033 - PLACE
      ?auto_14029 - HOIST
      ?auto_14026 - SURFACE
      ?auto_14050 - PLACE
      ?auto_14052 - HOIST
      ?auto_14038 - SURFACE
      ?auto_14051 - PLACE
      ?auto_14035 - HOIST
      ?auto_14036 - SURFACE
      ?auto_14040 - PLACE
      ?auto_14045 - HOIST
      ?auto_14044 - SURFACE
      ?auto_14032 - SURFACE
      ?auto_14053 - PLACE
      ?auto_14042 - HOIST
      ?auto_14034 - SURFACE
      ?auto_14054 - PLACE
      ?auto_14049 - HOIST
      ?auto_14041 - SURFACE
      ?auto_14025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14023 ?auto_14020 ) ( IS-CRATE ?auto_14019 ) ( not ( = ?auto_14024 ?auto_14020 ) ) ( HOIST-AT ?auto_14021 ?auto_14024 ) ( AVAILABLE ?auto_14021 ) ( SURFACE-AT ?auto_14019 ?auto_14024 ) ( ON ?auto_14019 ?auto_14022 ) ( CLEAR ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14019 ) ) ( not ( = ?auto_14018 ?auto_14022 ) ) ( not ( = ?auto_14019 ?auto_14022 ) ) ( not ( = ?auto_14023 ?auto_14021 ) ) ( IS-CRATE ?auto_14018 ) ( not ( = ?auto_14046 ?auto_14020 ) ) ( HOIST-AT ?auto_14048 ?auto_14046 ) ( SURFACE-AT ?auto_14018 ?auto_14046 ) ( ON ?auto_14018 ?auto_14037 ) ( CLEAR ?auto_14018 ) ( not ( = ?auto_14016 ?auto_14018 ) ) ( not ( = ?auto_14016 ?auto_14037 ) ) ( not ( = ?auto_14018 ?auto_14037 ) ) ( not ( = ?auto_14023 ?auto_14048 ) ) ( IS-CRATE ?auto_14016 ) ( not ( = ?auto_14031 ?auto_14020 ) ) ( HOIST-AT ?auto_14043 ?auto_14031 ) ( AVAILABLE ?auto_14043 ) ( SURFACE-AT ?auto_14016 ?auto_14031 ) ( ON ?auto_14016 ?auto_14027 ) ( CLEAR ?auto_14016 ) ( not ( = ?auto_14017 ?auto_14016 ) ) ( not ( = ?auto_14017 ?auto_14027 ) ) ( not ( = ?auto_14016 ?auto_14027 ) ) ( not ( = ?auto_14023 ?auto_14043 ) ) ( IS-CRATE ?auto_14017 ) ( not ( = ?auto_14028 ?auto_14020 ) ) ( HOIST-AT ?auto_14047 ?auto_14028 ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14017 ?auto_14028 ) ( ON ?auto_14017 ?auto_14039 ) ( CLEAR ?auto_14017 ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( not ( = ?auto_14015 ?auto_14039 ) ) ( not ( = ?auto_14017 ?auto_14039 ) ) ( not ( = ?auto_14023 ?auto_14047 ) ) ( IS-CRATE ?auto_14015 ) ( SURFACE-AT ?auto_14015 ?auto_14046 ) ( ON ?auto_14015 ?auto_14030 ) ( CLEAR ?auto_14015 ) ( not ( = ?auto_14012 ?auto_14015 ) ) ( not ( = ?auto_14012 ?auto_14030 ) ) ( not ( = ?auto_14015 ?auto_14030 ) ) ( IS-CRATE ?auto_14012 ) ( AVAILABLE ?auto_14048 ) ( SURFACE-AT ?auto_14012 ?auto_14046 ) ( ON ?auto_14012 ?auto_14055 ) ( CLEAR ?auto_14012 ) ( not ( = ?auto_14013 ?auto_14012 ) ) ( not ( = ?auto_14013 ?auto_14055 ) ) ( not ( = ?auto_14012 ?auto_14055 ) ) ( IS-CRATE ?auto_14013 ) ( not ( = ?auto_14033 ?auto_14020 ) ) ( HOIST-AT ?auto_14029 ?auto_14033 ) ( SURFACE-AT ?auto_14013 ?auto_14033 ) ( ON ?auto_14013 ?auto_14026 ) ( CLEAR ?auto_14013 ) ( not ( = ?auto_14014 ?auto_14013 ) ) ( not ( = ?auto_14014 ?auto_14026 ) ) ( not ( = ?auto_14013 ?auto_14026 ) ) ( not ( = ?auto_14023 ?auto_14029 ) ) ( IS-CRATE ?auto_14014 ) ( not ( = ?auto_14050 ?auto_14020 ) ) ( HOIST-AT ?auto_14052 ?auto_14050 ) ( AVAILABLE ?auto_14052 ) ( SURFACE-AT ?auto_14014 ?auto_14050 ) ( ON ?auto_14014 ?auto_14038 ) ( CLEAR ?auto_14014 ) ( not ( = ?auto_14011 ?auto_14014 ) ) ( not ( = ?auto_14011 ?auto_14038 ) ) ( not ( = ?auto_14014 ?auto_14038 ) ) ( not ( = ?auto_14023 ?auto_14052 ) ) ( IS-CRATE ?auto_14011 ) ( not ( = ?auto_14051 ?auto_14020 ) ) ( HOIST-AT ?auto_14035 ?auto_14051 ) ( AVAILABLE ?auto_14035 ) ( SURFACE-AT ?auto_14011 ?auto_14051 ) ( ON ?auto_14011 ?auto_14036 ) ( CLEAR ?auto_14011 ) ( not ( = ?auto_14010 ?auto_14011 ) ) ( not ( = ?auto_14010 ?auto_14036 ) ) ( not ( = ?auto_14011 ?auto_14036 ) ) ( not ( = ?auto_14023 ?auto_14035 ) ) ( IS-CRATE ?auto_14010 ) ( not ( = ?auto_14040 ?auto_14020 ) ) ( HOIST-AT ?auto_14045 ?auto_14040 ) ( AVAILABLE ?auto_14045 ) ( SURFACE-AT ?auto_14010 ?auto_14040 ) ( ON ?auto_14010 ?auto_14044 ) ( CLEAR ?auto_14010 ) ( not ( = ?auto_14009 ?auto_14010 ) ) ( not ( = ?auto_14009 ?auto_14044 ) ) ( not ( = ?auto_14010 ?auto_14044 ) ) ( not ( = ?auto_14023 ?auto_14045 ) ) ( IS-CRATE ?auto_14009 ) ( AVAILABLE ?auto_14029 ) ( SURFACE-AT ?auto_14009 ?auto_14033 ) ( ON ?auto_14009 ?auto_14032 ) ( CLEAR ?auto_14009 ) ( not ( = ?auto_14008 ?auto_14009 ) ) ( not ( = ?auto_14008 ?auto_14032 ) ) ( not ( = ?auto_14009 ?auto_14032 ) ) ( IS-CRATE ?auto_14008 ) ( not ( = ?auto_14053 ?auto_14020 ) ) ( HOIST-AT ?auto_14042 ?auto_14053 ) ( AVAILABLE ?auto_14042 ) ( SURFACE-AT ?auto_14008 ?auto_14053 ) ( ON ?auto_14008 ?auto_14034 ) ( CLEAR ?auto_14008 ) ( not ( = ?auto_14007 ?auto_14008 ) ) ( not ( = ?auto_14007 ?auto_14034 ) ) ( not ( = ?auto_14008 ?auto_14034 ) ) ( not ( = ?auto_14023 ?auto_14042 ) ) ( SURFACE-AT ?auto_14006 ?auto_14020 ) ( CLEAR ?auto_14006 ) ( IS-CRATE ?auto_14007 ) ( AVAILABLE ?auto_14023 ) ( not ( = ?auto_14054 ?auto_14020 ) ) ( HOIST-AT ?auto_14049 ?auto_14054 ) ( AVAILABLE ?auto_14049 ) ( SURFACE-AT ?auto_14007 ?auto_14054 ) ( ON ?auto_14007 ?auto_14041 ) ( CLEAR ?auto_14007 ) ( TRUCK-AT ?auto_14025 ?auto_14020 ) ( not ( = ?auto_14006 ?auto_14007 ) ) ( not ( = ?auto_14006 ?auto_14041 ) ) ( not ( = ?auto_14007 ?auto_14041 ) ) ( not ( = ?auto_14023 ?auto_14049 ) ) ( not ( = ?auto_14006 ?auto_14008 ) ) ( not ( = ?auto_14006 ?auto_14034 ) ) ( not ( = ?auto_14008 ?auto_14041 ) ) ( not ( = ?auto_14053 ?auto_14054 ) ) ( not ( = ?auto_14042 ?auto_14049 ) ) ( not ( = ?auto_14034 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14009 ) ) ( not ( = ?auto_14006 ?auto_14032 ) ) ( not ( = ?auto_14007 ?auto_14009 ) ) ( not ( = ?auto_14007 ?auto_14032 ) ) ( not ( = ?auto_14009 ?auto_14034 ) ) ( not ( = ?auto_14009 ?auto_14041 ) ) ( not ( = ?auto_14033 ?auto_14053 ) ) ( not ( = ?auto_14033 ?auto_14054 ) ) ( not ( = ?auto_14029 ?auto_14042 ) ) ( not ( = ?auto_14029 ?auto_14049 ) ) ( not ( = ?auto_14032 ?auto_14034 ) ) ( not ( = ?auto_14032 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14010 ) ) ( not ( = ?auto_14006 ?auto_14044 ) ) ( not ( = ?auto_14007 ?auto_14010 ) ) ( not ( = ?auto_14007 ?auto_14044 ) ) ( not ( = ?auto_14008 ?auto_14010 ) ) ( not ( = ?auto_14008 ?auto_14044 ) ) ( not ( = ?auto_14010 ?auto_14032 ) ) ( not ( = ?auto_14010 ?auto_14034 ) ) ( not ( = ?auto_14010 ?auto_14041 ) ) ( not ( = ?auto_14040 ?auto_14033 ) ) ( not ( = ?auto_14040 ?auto_14053 ) ) ( not ( = ?auto_14040 ?auto_14054 ) ) ( not ( = ?auto_14045 ?auto_14029 ) ) ( not ( = ?auto_14045 ?auto_14042 ) ) ( not ( = ?auto_14045 ?auto_14049 ) ) ( not ( = ?auto_14044 ?auto_14032 ) ) ( not ( = ?auto_14044 ?auto_14034 ) ) ( not ( = ?auto_14044 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14011 ) ) ( not ( = ?auto_14006 ?auto_14036 ) ) ( not ( = ?auto_14007 ?auto_14011 ) ) ( not ( = ?auto_14007 ?auto_14036 ) ) ( not ( = ?auto_14008 ?auto_14011 ) ) ( not ( = ?auto_14008 ?auto_14036 ) ) ( not ( = ?auto_14009 ?auto_14011 ) ) ( not ( = ?auto_14009 ?auto_14036 ) ) ( not ( = ?auto_14011 ?auto_14044 ) ) ( not ( = ?auto_14011 ?auto_14032 ) ) ( not ( = ?auto_14011 ?auto_14034 ) ) ( not ( = ?auto_14011 ?auto_14041 ) ) ( not ( = ?auto_14051 ?auto_14040 ) ) ( not ( = ?auto_14051 ?auto_14033 ) ) ( not ( = ?auto_14051 ?auto_14053 ) ) ( not ( = ?auto_14051 ?auto_14054 ) ) ( not ( = ?auto_14035 ?auto_14045 ) ) ( not ( = ?auto_14035 ?auto_14029 ) ) ( not ( = ?auto_14035 ?auto_14042 ) ) ( not ( = ?auto_14035 ?auto_14049 ) ) ( not ( = ?auto_14036 ?auto_14044 ) ) ( not ( = ?auto_14036 ?auto_14032 ) ) ( not ( = ?auto_14036 ?auto_14034 ) ) ( not ( = ?auto_14036 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14014 ) ) ( not ( = ?auto_14006 ?auto_14038 ) ) ( not ( = ?auto_14007 ?auto_14014 ) ) ( not ( = ?auto_14007 ?auto_14038 ) ) ( not ( = ?auto_14008 ?auto_14014 ) ) ( not ( = ?auto_14008 ?auto_14038 ) ) ( not ( = ?auto_14009 ?auto_14014 ) ) ( not ( = ?auto_14009 ?auto_14038 ) ) ( not ( = ?auto_14010 ?auto_14014 ) ) ( not ( = ?auto_14010 ?auto_14038 ) ) ( not ( = ?auto_14014 ?auto_14036 ) ) ( not ( = ?auto_14014 ?auto_14044 ) ) ( not ( = ?auto_14014 ?auto_14032 ) ) ( not ( = ?auto_14014 ?auto_14034 ) ) ( not ( = ?auto_14014 ?auto_14041 ) ) ( not ( = ?auto_14050 ?auto_14051 ) ) ( not ( = ?auto_14050 ?auto_14040 ) ) ( not ( = ?auto_14050 ?auto_14033 ) ) ( not ( = ?auto_14050 ?auto_14053 ) ) ( not ( = ?auto_14050 ?auto_14054 ) ) ( not ( = ?auto_14052 ?auto_14035 ) ) ( not ( = ?auto_14052 ?auto_14045 ) ) ( not ( = ?auto_14052 ?auto_14029 ) ) ( not ( = ?auto_14052 ?auto_14042 ) ) ( not ( = ?auto_14052 ?auto_14049 ) ) ( not ( = ?auto_14038 ?auto_14036 ) ) ( not ( = ?auto_14038 ?auto_14044 ) ) ( not ( = ?auto_14038 ?auto_14032 ) ) ( not ( = ?auto_14038 ?auto_14034 ) ) ( not ( = ?auto_14038 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14013 ) ) ( not ( = ?auto_14006 ?auto_14026 ) ) ( not ( = ?auto_14007 ?auto_14013 ) ) ( not ( = ?auto_14007 ?auto_14026 ) ) ( not ( = ?auto_14008 ?auto_14013 ) ) ( not ( = ?auto_14008 ?auto_14026 ) ) ( not ( = ?auto_14009 ?auto_14013 ) ) ( not ( = ?auto_14009 ?auto_14026 ) ) ( not ( = ?auto_14010 ?auto_14013 ) ) ( not ( = ?auto_14010 ?auto_14026 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14026 ) ) ( not ( = ?auto_14013 ?auto_14038 ) ) ( not ( = ?auto_14013 ?auto_14036 ) ) ( not ( = ?auto_14013 ?auto_14044 ) ) ( not ( = ?auto_14013 ?auto_14032 ) ) ( not ( = ?auto_14013 ?auto_14034 ) ) ( not ( = ?auto_14013 ?auto_14041 ) ) ( not ( = ?auto_14026 ?auto_14038 ) ) ( not ( = ?auto_14026 ?auto_14036 ) ) ( not ( = ?auto_14026 ?auto_14044 ) ) ( not ( = ?auto_14026 ?auto_14032 ) ) ( not ( = ?auto_14026 ?auto_14034 ) ) ( not ( = ?auto_14026 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14012 ) ) ( not ( = ?auto_14006 ?auto_14055 ) ) ( not ( = ?auto_14007 ?auto_14012 ) ) ( not ( = ?auto_14007 ?auto_14055 ) ) ( not ( = ?auto_14008 ?auto_14012 ) ) ( not ( = ?auto_14008 ?auto_14055 ) ) ( not ( = ?auto_14009 ?auto_14012 ) ) ( not ( = ?auto_14009 ?auto_14055 ) ) ( not ( = ?auto_14010 ?auto_14012 ) ) ( not ( = ?auto_14010 ?auto_14055 ) ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14055 ) ) ( not ( = ?auto_14014 ?auto_14012 ) ) ( not ( = ?auto_14014 ?auto_14055 ) ) ( not ( = ?auto_14012 ?auto_14026 ) ) ( not ( = ?auto_14012 ?auto_14038 ) ) ( not ( = ?auto_14012 ?auto_14036 ) ) ( not ( = ?auto_14012 ?auto_14044 ) ) ( not ( = ?auto_14012 ?auto_14032 ) ) ( not ( = ?auto_14012 ?auto_14034 ) ) ( not ( = ?auto_14012 ?auto_14041 ) ) ( not ( = ?auto_14046 ?auto_14033 ) ) ( not ( = ?auto_14046 ?auto_14050 ) ) ( not ( = ?auto_14046 ?auto_14051 ) ) ( not ( = ?auto_14046 ?auto_14040 ) ) ( not ( = ?auto_14046 ?auto_14053 ) ) ( not ( = ?auto_14046 ?auto_14054 ) ) ( not ( = ?auto_14048 ?auto_14029 ) ) ( not ( = ?auto_14048 ?auto_14052 ) ) ( not ( = ?auto_14048 ?auto_14035 ) ) ( not ( = ?auto_14048 ?auto_14045 ) ) ( not ( = ?auto_14048 ?auto_14042 ) ) ( not ( = ?auto_14048 ?auto_14049 ) ) ( not ( = ?auto_14055 ?auto_14026 ) ) ( not ( = ?auto_14055 ?auto_14038 ) ) ( not ( = ?auto_14055 ?auto_14036 ) ) ( not ( = ?auto_14055 ?auto_14044 ) ) ( not ( = ?auto_14055 ?auto_14032 ) ) ( not ( = ?auto_14055 ?auto_14034 ) ) ( not ( = ?auto_14055 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14015 ) ) ( not ( = ?auto_14006 ?auto_14030 ) ) ( not ( = ?auto_14007 ?auto_14015 ) ) ( not ( = ?auto_14007 ?auto_14030 ) ) ( not ( = ?auto_14008 ?auto_14015 ) ) ( not ( = ?auto_14008 ?auto_14030 ) ) ( not ( = ?auto_14009 ?auto_14015 ) ) ( not ( = ?auto_14009 ?auto_14030 ) ) ( not ( = ?auto_14010 ?auto_14015 ) ) ( not ( = ?auto_14010 ?auto_14030 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( not ( = ?auto_14011 ?auto_14030 ) ) ( not ( = ?auto_14014 ?auto_14015 ) ) ( not ( = ?auto_14014 ?auto_14030 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14030 ) ) ( not ( = ?auto_14015 ?auto_14055 ) ) ( not ( = ?auto_14015 ?auto_14026 ) ) ( not ( = ?auto_14015 ?auto_14038 ) ) ( not ( = ?auto_14015 ?auto_14036 ) ) ( not ( = ?auto_14015 ?auto_14044 ) ) ( not ( = ?auto_14015 ?auto_14032 ) ) ( not ( = ?auto_14015 ?auto_14034 ) ) ( not ( = ?auto_14015 ?auto_14041 ) ) ( not ( = ?auto_14030 ?auto_14055 ) ) ( not ( = ?auto_14030 ?auto_14026 ) ) ( not ( = ?auto_14030 ?auto_14038 ) ) ( not ( = ?auto_14030 ?auto_14036 ) ) ( not ( = ?auto_14030 ?auto_14044 ) ) ( not ( = ?auto_14030 ?auto_14032 ) ) ( not ( = ?auto_14030 ?auto_14034 ) ) ( not ( = ?auto_14030 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14017 ) ) ( not ( = ?auto_14006 ?auto_14039 ) ) ( not ( = ?auto_14007 ?auto_14017 ) ) ( not ( = ?auto_14007 ?auto_14039 ) ) ( not ( = ?auto_14008 ?auto_14017 ) ) ( not ( = ?auto_14008 ?auto_14039 ) ) ( not ( = ?auto_14009 ?auto_14017 ) ) ( not ( = ?auto_14009 ?auto_14039 ) ) ( not ( = ?auto_14010 ?auto_14017 ) ) ( not ( = ?auto_14010 ?auto_14039 ) ) ( not ( = ?auto_14011 ?auto_14017 ) ) ( not ( = ?auto_14011 ?auto_14039 ) ) ( not ( = ?auto_14014 ?auto_14017 ) ) ( not ( = ?auto_14014 ?auto_14039 ) ) ( not ( = ?auto_14013 ?auto_14017 ) ) ( not ( = ?auto_14013 ?auto_14039 ) ) ( not ( = ?auto_14012 ?auto_14017 ) ) ( not ( = ?auto_14012 ?auto_14039 ) ) ( not ( = ?auto_14017 ?auto_14030 ) ) ( not ( = ?auto_14017 ?auto_14055 ) ) ( not ( = ?auto_14017 ?auto_14026 ) ) ( not ( = ?auto_14017 ?auto_14038 ) ) ( not ( = ?auto_14017 ?auto_14036 ) ) ( not ( = ?auto_14017 ?auto_14044 ) ) ( not ( = ?auto_14017 ?auto_14032 ) ) ( not ( = ?auto_14017 ?auto_14034 ) ) ( not ( = ?auto_14017 ?auto_14041 ) ) ( not ( = ?auto_14028 ?auto_14046 ) ) ( not ( = ?auto_14028 ?auto_14033 ) ) ( not ( = ?auto_14028 ?auto_14050 ) ) ( not ( = ?auto_14028 ?auto_14051 ) ) ( not ( = ?auto_14028 ?auto_14040 ) ) ( not ( = ?auto_14028 ?auto_14053 ) ) ( not ( = ?auto_14028 ?auto_14054 ) ) ( not ( = ?auto_14047 ?auto_14048 ) ) ( not ( = ?auto_14047 ?auto_14029 ) ) ( not ( = ?auto_14047 ?auto_14052 ) ) ( not ( = ?auto_14047 ?auto_14035 ) ) ( not ( = ?auto_14047 ?auto_14045 ) ) ( not ( = ?auto_14047 ?auto_14042 ) ) ( not ( = ?auto_14047 ?auto_14049 ) ) ( not ( = ?auto_14039 ?auto_14030 ) ) ( not ( = ?auto_14039 ?auto_14055 ) ) ( not ( = ?auto_14039 ?auto_14026 ) ) ( not ( = ?auto_14039 ?auto_14038 ) ) ( not ( = ?auto_14039 ?auto_14036 ) ) ( not ( = ?auto_14039 ?auto_14044 ) ) ( not ( = ?auto_14039 ?auto_14032 ) ) ( not ( = ?auto_14039 ?auto_14034 ) ) ( not ( = ?auto_14039 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14016 ) ) ( not ( = ?auto_14006 ?auto_14027 ) ) ( not ( = ?auto_14007 ?auto_14016 ) ) ( not ( = ?auto_14007 ?auto_14027 ) ) ( not ( = ?auto_14008 ?auto_14016 ) ) ( not ( = ?auto_14008 ?auto_14027 ) ) ( not ( = ?auto_14009 ?auto_14016 ) ) ( not ( = ?auto_14009 ?auto_14027 ) ) ( not ( = ?auto_14010 ?auto_14016 ) ) ( not ( = ?auto_14010 ?auto_14027 ) ) ( not ( = ?auto_14011 ?auto_14016 ) ) ( not ( = ?auto_14011 ?auto_14027 ) ) ( not ( = ?auto_14014 ?auto_14016 ) ) ( not ( = ?auto_14014 ?auto_14027 ) ) ( not ( = ?auto_14013 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14027 ) ) ( not ( = ?auto_14012 ?auto_14016 ) ) ( not ( = ?auto_14012 ?auto_14027 ) ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14027 ) ) ( not ( = ?auto_14016 ?auto_14039 ) ) ( not ( = ?auto_14016 ?auto_14030 ) ) ( not ( = ?auto_14016 ?auto_14055 ) ) ( not ( = ?auto_14016 ?auto_14026 ) ) ( not ( = ?auto_14016 ?auto_14038 ) ) ( not ( = ?auto_14016 ?auto_14036 ) ) ( not ( = ?auto_14016 ?auto_14044 ) ) ( not ( = ?auto_14016 ?auto_14032 ) ) ( not ( = ?auto_14016 ?auto_14034 ) ) ( not ( = ?auto_14016 ?auto_14041 ) ) ( not ( = ?auto_14031 ?auto_14028 ) ) ( not ( = ?auto_14031 ?auto_14046 ) ) ( not ( = ?auto_14031 ?auto_14033 ) ) ( not ( = ?auto_14031 ?auto_14050 ) ) ( not ( = ?auto_14031 ?auto_14051 ) ) ( not ( = ?auto_14031 ?auto_14040 ) ) ( not ( = ?auto_14031 ?auto_14053 ) ) ( not ( = ?auto_14031 ?auto_14054 ) ) ( not ( = ?auto_14043 ?auto_14047 ) ) ( not ( = ?auto_14043 ?auto_14048 ) ) ( not ( = ?auto_14043 ?auto_14029 ) ) ( not ( = ?auto_14043 ?auto_14052 ) ) ( not ( = ?auto_14043 ?auto_14035 ) ) ( not ( = ?auto_14043 ?auto_14045 ) ) ( not ( = ?auto_14043 ?auto_14042 ) ) ( not ( = ?auto_14043 ?auto_14049 ) ) ( not ( = ?auto_14027 ?auto_14039 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14055 ) ) ( not ( = ?auto_14027 ?auto_14026 ) ) ( not ( = ?auto_14027 ?auto_14038 ) ) ( not ( = ?auto_14027 ?auto_14036 ) ) ( not ( = ?auto_14027 ?auto_14044 ) ) ( not ( = ?auto_14027 ?auto_14032 ) ) ( not ( = ?auto_14027 ?auto_14034 ) ) ( not ( = ?auto_14027 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14018 ) ) ( not ( = ?auto_14006 ?auto_14037 ) ) ( not ( = ?auto_14007 ?auto_14018 ) ) ( not ( = ?auto_14007 ?auto_14037 ) ) ( not ( = ?auto_14008 ?auto_14018 ) ) ( not ( = ?auto_14008 ?auto_14037 ) ) ( not ( = ?auto_14009 ?auto_14018 ) ) ( not ( = ?auto_14009 ?auto_14037 ) ) ( not ( = ?auto_14010 ?auto_14018 ) ) ( not ( = ?auto_14010 ?auto_14037 ) ) ( not ( = ?auto_14011 ?auto_14018 ) ) ( not ( = ?auto_14011 ?auto_14037 ) ) ( not ( = ?auto_14014 ?auto_14018 ) ) ( not ( = ?auto_14014 ?auto_14037 ) ) ( not ( = ?auto_14013 ?auto_14018 ) ) ( not ( = ?auto_14013 ?auto_14037 ) ) ( not ( = ?auto_14012 ?auto_14018 ) ) ( not ( = ?auto_14012 ?auto_14037 ) ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14037 ) ) ( not ( = ?auto_14017 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14037 ) ) ( not ( = ?auto_14018 ?auto_14027 ) ) ( not ( = ?auto_14018 ?auto_14039 ) ) ( not ( = ?auto_14018 ?auto_14030 ) ) ( not ( = ?auto_14018 ?auto_14055 ) ) ( not ( = ?auto_14018 ?auto_14026 ) ) ( not ( = ?auto_14018 ?auto_14038 ) ) ( not ( = ?auto_14018 ?auto_14036 ) ) ( not ( = ?auto_14018 ?auto_14044 ) ) ( not ( = ?auto_14018 ?auto_14032 ) ) ( not ( = ?auto_14018 ?auto_14034 ) ) ( not ( = ?auto_14018 ?auto_14041 ) ) ( not ( = ?auto_14037 ?auto_14027 ) ) ( not ( = ?auto_14037 ?auto_14039 ) ) ( not ( = ?auto_14037 ?auto_14030 ) ) ( not ( = ?auto_14037 ?auto_14055 ) ) ( not ( = ?auto_14037 ?auto_14026 ) ) ( not ( = ?auto_14037 ?auto_14038 ) ) ( not ( = ?auto_14037 ?auto_14036 ) ) ( not ( = ?auto_14037 ?auto_14044 ) ) ( not ( = ?auto_14037 ?auto_14032 ) ) ( not ( = ?auto_14037 ?auto_14034 ) ) ( not ( = ?auto_14037 ?auto_14041 ) ) ( not ( = ?auto_14006 ?auto_14019 ) ) ( not ( = ?auto_14006 ?auto_14022 ) ) ( not ( = ?auto_14007 ?auto_14019 ) ) ( not ( = ?auto_14007 ?auto_14022 ) ) ( not ( = ?auto_14008 ?auto_14019 ) ) ( not ( = ?auto_14008 ?auto_14022 ) ) ( not ( = ?auto_14009 ?auto_14019 ) ) ( not ( = ?auto_14009 ?auto_14022 ) ) ( not ( = ?auto_14010 ?auto_14019 ) ) ( not ( = ?auto_14010 ?auto_14022 ) ) ( not ( = ?auto_14011 ?auto_14019 ) ) ( not ( = ?auto_14011 ?auto_14022 ) ) ( not ( = ?auto_14014 ?auto_14019 ) ) ( not ( = ?auto_14014 ?auto_14022 ) ) ( not ( = ?auto_14013 ?auto_14019 ) ) ( not ( = ?auto_14013 ?auto_14022 ) ) ( not ( = ?auto_14012 ?auto_14019 ) ) ( not ( = ?auto_14012 ?auto_14022 ) ) ( not ( = ?auto_14015 ?auto_14019 ) ) ( not ( = ?auto_14015 ?auto_14022 ) ) ( not ( = ?auto_14017 ?auto_14019 ) ) ( not ( = ?auto_14017 ?auto_14022 ) ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( not ( = ?auto_14016 ?auto_14022 ) ) ( not ( = ?auto_14019 ?auto_14037 ) ) ( not ( = ?auto_14019 ?auto_14027 ) ) ( not ( = ?auto_14019 ?auto_14039 ) ) ( not ( = ?auto_14019 ?auto_14030 ) ) ( not ( = ?auto_14019 ?auto_14055 ) ) ( not ( = ?auto_14019 ?auto_14026 ) ) ( not ( = ?auto_14019 ?auto_14038 ) ) ( not ( = ?auto_14019 ?auto_14036 ) ) ( not ( = ?auto_14019 ?auto_14044 ) ) ( not ( = ?auto_14019 ?auto_14032 ) ) ( not ( = ?auto_14019 ?auto_14034 ) ) ( not ( = ?auto_14019 ?auto_14041 ) ) ( not ( = ?auto_14024 ?auto_14046 ) ) ( not ( = ?auto_14024 ?auto_14031 ) ) ( not ( = ?auto_14024 ?auto_14028 ) ) ( not ( = ?auto_14024 ?auto_14033 ) ) ( not ( = ?auto_14024 ?auto_14050 ) ) ( not ( = ?auto_14024 ?auto_14051 ) ) ( not ( = ?auto_14024 ?auto_14040 ) ) ( not ( = ?auto_14024 ?auto_14053 ) ) ( not ( = ?auto_14024 ?auto_14054 ) ) ( not ( = ?auto_14021 ?auto_14048 ) ) ( not ( = ?auto_14021 ?auto_14043 ) ) ( not ( = ?auto_14021 ?auto_14047 ) ) ( not ( = ?auto_14021 ?auto_14029 ) ) ( not ( = ?auto_14021 ?auto_14052 ) ) ( not ( = ?auto_14021 ?auto_14035 ) ) ( not ( = ?auto_14021 ?auto_14045 ) ) ( not ( = ?auto_14021 ?auto_14042 ) ) ( not ( = ?auto_14021 ?auto_14049 ) ) ( not ( = ?auto_14022 ?auto_14037 ) ) ( not ( = ?auto_14022 ?auto_14027 ) ) ( not ( = ?auto_14022 ?auto_14039 ) ) ( not ( = ?auto_14022 ?auto_14030 ) ) ( not ( = ?auto_14022 ?auto_14055 ) ) ( not ( = ?auto_14022 ?auto_14026 ) ) ( not ( = ?auto_14022 ?auto_14038 ) ) ( not ( = ?auto_14022 ?auto_14036 ) ) ( not ( = ?auto_14022 ?auto_14044 ) ) ( not ( = ?auto_14022 ?auto_14032 ) ) ( not ( = ?auto_14022 ?auto_14034 ) ) ( not ( = ?auto_14022 ?auto_14041 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14006 ?auto_14007 ?auto_14008 ?auto_14009 ?auto_14010 ?auto_14011 ?auto_14014 ?auto_14013 ?auto_14012 ?auto_14015 ?auto_14017 ?auto_14016 ?auto_14018 )
      ( MAKE-1CRATE ?auto_14018 ?auto_14019 )
      ( MAKE-13CRATE-VERIFY ?auto_14006 ?auto_14007 ?auto_14008 ?auto_14009 ?auto_14010 ?auto_14011 ?auto_14014 ?auto_14013 ?auto_14012 ?auto_14015 ?auto_14017 ?auto_14016 ?auto_14018 ?auto_14019 ) )
  )

)

