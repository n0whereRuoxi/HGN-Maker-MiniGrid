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
      ?auto_13464 - SURFACE
      ?auto_13465 - SURFACE
    )
    :vars
    (
      ?auto_13466 - HOIST
      ?auto_13467 - PLACE
      ?auto_13469 - PLACE
      ?auto_13470 - HOIST
      ?auto_13471 - SURFACE
      ?auto_13468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13466 ?auto_13467 ) ( SURFACE-AT ?auto_13464 ?auto_13467 ) ( CLEAR ?auto_13464 ) ( IS-CRATE ?auto_13465 ) ( AVAILABLE ?auto_13466 ) ( not ( = ?auto_13469 ?auto_13467 ) ) ( HOIST-AT ?auto_13470 ?auto_13469 ) ( AVAILABLE ?auto_13470 ) ( SURFACE-AT ?auto_13465 ?auto_13469 ) ( ON ?auto_13465 ?auto_13471 ) ( CLEAR ?auto_13465 ) ( TRUCK-AT ?auto_13468 ?auto_13467 ) ( not ( = ?auto_13464 ?auto_13465 ) ) ( not ( = ?auto_13464 ?auto_13471 ) ) ( not ( = ?auto_13465 ?auto_13471 ) ) ( not ( = ?auto_13466 ?auto_13470 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13468 ?auto_13467 ?auto_13469 )
      ( !LIFT ?auto_13470 ?auto_13465 ?auto_13471 ?auto_13469 )
      ( !LOAD ?auto_13470 ?auto_13465 ?auto_13468 ?auto_13469 )
      ( !DRIVE ?auto_13468 ?auto_13469 ?auto_13467 )
      ( !UNLOAD ?auto_13466 ?auto_13465 ?auto_13468 ?auto_13467 )
      ( !DROP ?auto_13466 ?auto_13465 ?auto_13464 ?auto_13467 )
      ( MAKE-1CRATE-VERIFY ?auto_13464 ?auto_13465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13474 - SURFACE
      ?auto_13475 - SURFACE
    )
    :vars
    (
      ?auto_13476 - HOIST
      ?auto_13477 - PLACE
      ?auto_13479 - PLACE
      ?auto_13480 - HOIST
      ?auto_13481 - SURFACE
      ?auto_13478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13476 ?auto_13477 ) ( SURFACE-AT ?auto_13474 ?auto_13477 ) ( CLEAR ?auto_13474 ) ( IS-CRATE ?auto_13475 ) ( AVAILABLE ?auto_13476 ) ( not ( = ?auto_13479 ?auto_13477 ) ) ( HOIST-AT ?auto_13480 ?auto_13479 ) ( AVAILABLE ?auto_13480 ) ( SURFACE-AT ?auto_13475 ?auto_13479 ) ( ON ?auto_13475 ?auto_13481 ) ( CLEAR ?auto_13475 ) ( TRUCK-AT ?auto_13478 ?auto_13477 ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13481 ) ) ( not ( = ?auto_13475 ?auto_13481 ) ) ( not ( = ?auto_13476 ?auto_13480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13478 ?auto_13477 ?auto_13479 )
      ( !LIFT ?auto_13480 ?auto_13475 ?auto_13481 ?auto_13479 )
      ( !LOAD ?auto_13480 ?auto_13475 ?auto_13478 ?auto_13479 )
      ( !DRIVE ?auto_13478 ?auto_13479 ?auto_13477 )
      ( !UNLOAD ?auto_13476 ?auto_13475 ?auto_13478 ?auto_13477 )
      ( !DROP ?auto_13476 ?auto_13475 ?auto_13474 ?auto_13477 )
      ( MAKE-1CRATE-VERIFY ?auto_13474 ?auto_13475 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13485 - SURFACE
      ?auto_13486 - SURFACE
      ?auto_13487 - SURFACE
    )
    :vars
    (
      ?auto_13491 - HOIST
      ?auto_13488 - PLACE
      ?auto_13492 - PLACE
      ?auto_13490 - HOIST
      ?auto_13493 - SURFACE
      ?auto_13494 - PLACE
      ?auto_13495 - HOIST
      ?auto_13496 - SURFACE
      ?auto_13489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13491 ?auto_13488 ) ( IS-CRATE ?auto_13487 ) ( not ( = ?auto_13492 ?auto_13488 ) ) ( HOIST-AT ?auto_13490 ?auto_13492 ) ( AVAILABLE ?auto_13490 ) ( SURFACE-AT ?auto_13487 ?auto_13492 ) ( ON ?auto_13487 ?auto_13493 ) ( CLEAR ?auto_13487 ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( not ( = ?auto_13486 ?auto_13493 ) ) ( not ( = ?auto_13487 ?auto_13493 ) ) ( not ( = ?auto_13491 ?auto_13490 ) ) ( SURFACE-AT ?auto_13485 ?auto_13488 ) ( CLEAR ?auto_13485 ) ( IS-CRATE ?auto_13486 ) ( AVAILABLE ?auto_13491 ) ( not ( = ?auto_13494 ?auto_13488 ) ) ( HOIST-AT ?auto_13495 ?auto_13494 ) ( AVAILABLE ?auto_13495 ) ( SURFACE-AT ?auto_13486 ?auto_13494 ) ( ON ?auto_13486 ?auto_13496 ) ( CLEAR ?auto_13486 ) ( TRUCK-AT ?auto_13489 ?auto_13488 ) ( not ( = ?auto_13485 ?auto_13486 ) ) ( not ( = ?auto_13485 ?auto_13496 ) ) ( not ( = ?auto_13486 ?auto_13496 ) ) ( not ( = ?auto_13491 ?auto_13495 ) ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13485 ?auto_13493 ) ) ( not ( = ?auto_13487 ?auto_13496 ) ) ( not ( = ?auto_13492 ?auto_13494 ) ) ( not ( = ?auto_13490 ?auto_13495 ) ) ( not ( = ?auto_13493 ?auto_13496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13485 ?auto_13486 )
      ( MAKE-1CRATE ?auto_13486 ?auto_13487 )
      ( MAKE-2CRATE-VERIFY ?auto_13485 ?auto_13486 ?auto_13487 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13499 - SURFACE
      ?auto_13500 - SURFACE
    )
    :vars
    (
      ?auto_13501 - HOIST
      ?auto_13502 - PLACE
      ?auto_13504 - PLACE
      ?auto_13505 - HOIST
      ?auto_13506 - SURFACE
      ?auto_13503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13501 ?auto_13502 ) ( SURFACE-AT ?auto_13499 ?auto_13502 ) ( CLEAR ?auto_13499 ) ( IS-CRATE ?auto_13500 ) ( AVAILABLE ?auto_13501 ) ( not ( = ?auto_13504 ?auto_13502 ) ) ( HOIST-AT ?auto_13505 ?auto_13504 ) ( AVAILABLE ?auto_13505 ) ( SURFACE-AT ?auto_13500 ?auto_13504 ) ( ON ?auto_13500 ?auto_13506 ) ( CLEAR ?auto_13500 ) ( TRUCK-AT ?auto_13503 ?auto_13502 ) ( not ( = ?auto_13499 ?auto_13500 ) ) ( not ( = ?auto_13499 ?auto_13506 ) ) ( not ( = ?auto_13500 ?auto_13506 ) ) ( not ( = ?auto_13501 ?auto_13505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13503 ?auto_13502 ?auto_13504 )
      ( !LIFT ?auto_13505 ?auto_13500 ?auto_13506 ?auto_13504 )
      ( !LOAD ?auto_13505 ?auto_13500 ?auto_13503 ?auto_13504 )
      ( !DRIVE ?auto_13503 ?auto_13504 ?auto_13502 )
      ( !UNLOAD ?auto_13501 ?auto_13500 ?auto_13503 ?auto_13502 )
      ( !DROP ?auto_13501 ?auto_13500 ?auto_13499 ?auto_13502 )
      ( MAKE-1CRATE-VERIFY ?auto_13499 ?auto_13500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13511 - SURFACE
      ?auto_13512 - SURFACE
      ?auto_13513 - SURFACE
      ?auto_13514 - SURFACE
    )
    :vars
    (
      ?auto_13519 - HOIST
      ?auto_13518 - PLACE
      ?auto_13516 - PLACE
      ?auto_13517 - HOIST
      ?auto_13520 - SURFACE
      ?auto_13521 - PLACE
      ?auto_13525 - HOIST
      ?auto_13526 - SURFACE
      ?auto_13524 - PLACE
      ?auto_13523 - HOIST
      ?auto_13522 - SURFACE
      ?auto_13515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13519 ?auto_13518 ) ( IS-CRATE ?auto_13514 ) ( not ( = ?auto_13516 ?auto_13518 ) ) ( HOIST-AT ?auto_13517 ?auto_13516 ) ( AVAILABLE ?auto_13517 ) ( SURFACE-AT ?auto_13514 ?auto_13516 ) ( ON ?auto_13514 ?auto_13520 ) ( CLEAR ?auto_13514 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13520 ) ) ( not ( = ?auto_13514 ?auto_13520 ) ) ( not ( = ?auto_13519 ?auto_13517 ) ) ( IS-CRATE ?auto_13513 ) ( not ( = ?auto_13521 ?auto_13518 ) ) ( HOIST-AT ?auto_13525 ?auto_13521 ) ( AVAILABLE ?auto_13525 ) ( SURFACE-AT ?auto_13513 ?auto_13521 ) ( ON ?auto_13513 ?auto_13526 ) ( CLEAR ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13526 ) ) ( not ( = ?auto_13513 ?auto_13526 ) ) ( not ( = ?auto_13519 ?auto_13525 ) ) ( SURFACE-AT ?auto_13511 ?auto_13518 ) ( CLEAR ?auto_13511 ) ( IS-CRATE ?auto_13512 ) ( AVAILABLE ?auto_13519 ) ( not ( = ?auto_13524 ?auto_13518 ) ) ( HOIST-AT ?auto_13523 ?auto_13524 ) ( AVAILABLE ?auto_13523 ) ( SURFACE-AT ?auto_13512 ?auto_13524 ) ( ON ?auto_13512 ?auto_13522 ) ( CLEAR ?auto_13512 ) ( TRUCK-AT ?auto_13515 ?auto_13518 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13522 ) ) ( not ( = ?auto_13512 ?auto_13522 ) ) ( not ( = ?auto_13519 ?auto_13523 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13526 ) ) ( not ( = ?auto_13513 ?auto_13522 ) ) ( not ( = ?auto_13521 ?auto_13524 ) ) ( not ( = ?auto_13525 ?auto_13523 ) ) ( not ( = ?auto_13526 ?auto_13522 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13511 ?auto_13520 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13520 ) ) ( not ( = ?auto_13514 ?auto_13526 ) ) ( not ( = ?auto_13514 ?auto_13522 ) ) ( not ( = ?auto_13516 ?auto_13521 ) ) ( not ( = ?auto_13516 ?auto_13524 ) ) ( not ( = ?auto_13517 ?auto_13525 ) ) ( not ( = ?auto_13517 ?auto_13523 ) ) ( not ( = ?auto_13520 ?auto_13526 ) ) ( not ( = ?auto_13520 ?auto_13522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13511 ?auto_13512 ?auto_13513 )
      ( MAKE-1CRATE ?auto_13513 ?auto_13514 )
      ( MAKE-3CRATE-VERIFY ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13529 - SURFACE
      ?auto_13530 - SURFACE
    )
    :vars
    (
      ?auto_13531 - HOIST
      ?auto_13532 - PLACE
      ?auto_13534 - PLACE
      ?auto_13535 - HOIST
      ?auto_13536 - SURFACE
      ?auto_13533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13531 ?auto_13532 ) ( SURFACE-AT ?auto_13529 ?auto_13532 ) ( CLEAR ?auto_13529 ) ( IS-CRATE ?auto_13530 ) ( AVAILABLE ?auto_13531 ) ( not ( = ?auto_13534 ?auto_13532 ) ) ( HOIST-AT ?auto_13535 ?auto_13534 ) ( AVAILABLE ?auto_13535 ) ( SURFACE-AT ?auto_13530 ?auto_13534 ) ( ON ?auto_13530 ?auto_13536 ) ( CLEAR ?auto_13530 ) ( TRUCK-AT ?auto_13533 ?auto_13532 ) ( not ( = ?auto_13529 ?auto_13530 ) ) ( not ( = ?auto_13529 ?auto_13536 ) ) ( not ( = ?auto_13530 ?auto_13536 ) ) ( not ( = ?auto_13531 ?auto_13535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13533 ?auto_13532 ?auto_13534 )
      ( !LIFT ?auto_13535 ?auto_13530 ?auto_13536 ?auto_13534 )
      ( !LOAD ?auto_13535 ?auto_13530 ?auto_13533 ?auto_13534 )
      ( !DRIVE ?auto_13533 ?auto_13534 ?auto_13532 )
      ( !UNLOAD ?auto_13531 ?auto_13530 ?auto_13533 ?auto_13532 )
      ( !DROP ?auto_13531 ?auto_13530 ?auto_13529 ?auto_13532 )
      ( MAKE-1CRATE-VERIFY ?auto_13529 ?auto_13530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13542 - SURFACE
      ?auto_13543 - SURFACE
      ?auto_13544 - SURFACE
      ?auto_13545 - SURFACE
      ?auto_13546 - SURFACE
    )
    :vars
    (
      ?auto_13551 - HOIST
      ?auto_13552 - PLACE
      ?auto_13550 - PLACE
      ?auto_13548 - HOIST
      ?auto_13549 - SURFACE
      ?auto_13558 - PLACE
      ?auto_13560 - HOIST
      ?auto_13557 - SURFACE
      ?auto_13555 - PLACE
      ?auto_13561 - HOIST
      ?auto_13554 - SURFACE
      ?auto_13553 - PLACE
      ?auto_13559 - HOIST
      ?auto_13556 - SURFACE
      ?auto_13547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13551 ?auto_13552 ) ( IS-CRATE ?auto_13546 ) ( not ( = ?auto_13550 ?auto_13552 ) ) ( HOIST-AT ?auto_13548 ?auto_13550 ) ( AVAILABLE ?auto_13548 ) ( SURFACE-AT ?auto_13546 ?auto_13550 ) ( ON ?auto_13546 ?auto_13549 ) ( CLEAR ?auto_13546 ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13549 ) ) ( not ( = ?auto_13546 ?auto_13549 ) ) ( not ( = ?auto_13551 ?auto_13548 ) ) ( IS-CRATE ?auto_13545 ) ( not ( = ?auto_13558 ?auto_13552 ) ) ( HOIST-AT ?auto_13560 ?auto_13558 ) ( AVAILABLE ?auto_13560 ) ( SURFACE-AT ?auto_13545 ?auto_13558 ) ( ON ?auto_13545 ?auto_13557 ) ( CLEAR ?auto_13545 ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( not ( = ?auto_13544 ?auto_13557 ) ) ( not ( = ?auto_13545 ?auto_13557 ) ) ( not ( = ?auto_13551 ?auto_13560 ) ) ( IS-CRATE ?auto_13544 ) ( not ( = ?auto_13555 ?auto_13552 ) ) ( HOIST-AT ?auto_13561 ?auto_13555 ) ( AVAILABLE ?auto_13561 ) ( SURFACE-AT ?auto_13544 ?auto_13555 ) ( ON ?auto_13544 ?auto_13554 ) ( CLEAR ?auto_13544 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( not ( = ?auto_13543 ?auto_13554 ) ) ( not ( = ?auto_13544 ?auto_13554 ) ) ( not ( = ?auto_13551 ?auto_13561 ) ) ( SURFACE-AT ?auto_13542 ?auto_13552 ) ( CLEAR ?auto_13542 ) ( IS-CRATE ?auto_13543 ) ( AVAILABLE ?auto_13551 ) ( not ( = ?auto_13553 ?auto_13552 ) ) ( HOIST-AT ?auto_13559 ?auto_13553 ) ( AVAILABLE ?auto_13559 ) ( SURFACE-AT ?auto_13543 ?auto_13553 ) ( ON ?auto_13543 ?auto_13556 ) ( CLEAR ?auto_13543 ) ( TRUCK-AT ?auto_13547 ?auto_13552 ) ( not ( = ?auto_13542 ?auto_13543 ) ) ( not ( = ?auto_13542 ?auto_13556 ) ) ( not ( = ?auto_13543 ?auto_13556 ) ) ( not ( = ?auto_13551 ?auto_13559 ) ) ( not ( = ?auto_13542 ?auto_13544 ) ) ( not ( = ?auto_13542 ?auto_13554 ) ) ( not ( = ?auto_13544 ?auto_13556 ) ) ( not ( = ?auto_13555 ?auto_13553 ) ) ( not ( = ?auto_13561 ?auto_13559 ) ) ( not ( = ?auto_13554 ?auto_13556 ) ) ( not ( = ?auto_13542 ?auto_13545 ) ) ( not ( = ?auto_13542 ?auto_13557 ) ) ( not ( = ?auto_13543 ?auto_13545 ) ) ( not ( = ?auto_13543 ?auto_13557 ) ) ( not ( = ?auto_13545 ?auto_13554 ) ) ( not ( = ?auto_13545 ?auto_13556 ) ) ( not ( = ?auto_13558 ?auto_13555 ) ) ( not ( = ?auto_13558 ?auto_13553 ) ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13554 ) ) ( not ( = ?auto_13557 ?auto_13556 ) ) ( not ( = ?auto_13542 ?auto_13546 ) ) ( not ( = ?auto_13542 ?auto_13549 ) ) ( not ( = ?auto_13543 ?auto_13546 ) ) ( not ( = ?auto_13543 ?auto_13549 ) ) ( not ( = ?auto_13544 ?auto_13546 ) ) ( not ( = ?auto_13544 ?auto_13549 ) ) ( not ( = ?auto_13546 ?auto_13557 ) ) ( not ( = ?auto_13546 ?auto_13554 ) ) ( not ( = ?auto_13546 ?auto_13556 ) ) ( not ( = ?auto_13550 ?auto_13558 ) ) ( not ( = ?auto_13550 ?auto_13555 ) ) ( not ( = ?auto_13550 ?auto_13553 ) ) ( not ( = ?auto_13548 ?auto_13560 ) ) ( not ( = ?auto_13548 ?auto_13561 ) ) ( not ( = ?auto_13548 ?auto_13559 ) ) ( not ( = ?auto_13549 ?auto_13557 ) ) ( not ( = ?auto_13549 ?auto_13554 ) ) ( not ( = ?auto_13549 ?auto_13556 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13542 ?auto_13543 ?auto_13544 ?auto_13545 )
      ( MAKE-1CRATE ?auto_13545 ?auto_13546 )
      ( MAKE-4CRATE-VERIFY ?auto_13542 ?auto_13543 ?auto_13544 ?auto_13545 ?auto_13546 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13564 - SURFACE
      ?auto_13565 - SURFACE
    )
    :vars
    (
      ?auto_13566 - HOIST
      ?auto_13567 - PLACE
      ?auto_13569 - PLACE
      ?auto_13570 - HOIST
      ?auto_13571 - SURFACE
      ?auto_13568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13566 ?auto_13567 ) ( SURFACE-AT ?auto_13564 ?auto_13567 ) ( CLEAR ?auto_13564 ) ( IS-CRATE ?auto_13565 ) ( AVAILABLE ?auto_13566 ) ( not ( = ?auto_13569 ?auto_13567 ) ) ( HOIST-AT ?auto_13570 ?auto_13569 ) ( AVAILABLE ?auto_13570 ) ( SURFACE-AT ?auto_13565 ?auto_13569 ) ( ON ?auto_13565 ?auto_13571 ) ( CLEAR ?auto_13565 ) ( TRUCK-AT ?auto_13568 ?auto_13567 ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13571 ) ) ( not ( = ?auto_13565 ?auto_13571 ) ) ( not ( = ?auto_13566 ?auto_13570 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13568 ?auto_13567 ?auto_13569 )
      ( !LIFT ?auto_13570 ?auto_13565 ?auto_13571 ?auto_13569 )
      ( !LOAD ?auto_13570 ?auto_13565 ?auto_13568 ?auto_13569 )
      ( !DRIVE ?auto_13568 ?auto_13569 ?auto_13567 )
      ( !UNLOAD ?auto_13566 ?auto_13565 ?auto_13568 ?auto_13567 )
      ( !DROP ?auto_13566 ?auto_13565 ?auto_13564 ?auto_13567 )
      ( MAKE-1CRATE-VERIFY ?auto_13564 ?auto_13565 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13578 - SURFACE
      ?auto_13579 - SURFACE
      ?auto_13580 - SURFACE
      ?auto_13581 - SURFACE
      ?auto_13582 - SURFACE
      ?auto_13583 - SURFACE
    )
    :vars
    (
      ?auto_13587 - HOIST
      ?auto_13589 - PLACE
      ?auto_13584 - PLACE
      ?auto_13588 - HOIST
      ?auto_13585 - SURFACE
      ?auto_13595 - SURFACE
      ?auto_13590 - PLACE
      ?auto_13592 - HOIST
      ?auto_13599 - SURFACE
      ?auto_13597 - PLACE
      ?auto_13598 - HOIST
      ?auto_13593 - SURFACE
      ?auto_13591 - PLACE
      ?auto_13596 - HOIST
      ?auto_13594 - SURFACE
      ?auto_13586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13587 ?auto_13589 ) ( IS-CRATE ?auto_13583 ) ( not ( = ?auto_13584 ?auto_13589 ) ) ( HOIST-AT ?auto_13588 ?auto_13584 ) ( SURFACE-AT ?auto_13583 ?auto_13584 ) ( ON ?auto_13583 ?auto_13585 ) ( CLEAR ?auto_13583 ) ( not ( = ?auto_13582 ?auto_13583 ) ) ( not ( = ?auto_13582 ?auto_13585 ) ) ( not ( = ?auto_13583 ?auto_13585 ) ) ( not ( = ?auto_13587 ?auto_13588 ) ) ( IS-CRATE ?auto_13582 ) ( AVAILABLE ?auto_13588 ) ( SURFACE-AT ?auto_13582 ?auto_13584 ) ( ON ?auto_13582 ?auto_13595 ) ( CLEAR ?auto_13582 ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13581 ?auto_13595 ) ) ( not ( = ?auto_13582 ?auto_13595 ) ) ( IS-CRATE ?auto_13581 ) ( not ( = ?auto_13590 ?auto_13589 ) ) ( HOIST-AT ?auto_13592 ?auto_13590 ) ( AVAILABLE ?auto_13592 ) ( SURFACE-AT ?auto_13581 ?auto_13590 ) ( ON ?auto_13581 ?auto_13599 ) ( CLEAR ?auto_13581 ) ( not ( = ?auto_13580 ?auto_13581 ) ) ( not ( = ?auto_13580 ?auto_13599 ) ) ( not ( = ?auto_13581 ?auto_13599 ) ) ( not ( = ?auto_13587 ?auto_13592 ) ) ( IS-CRATE ?auto_13580 ) ( not ( = ?auto_13597 ?auto_13589 ) ) ( HOIST-AT ?auto_13598 ?auto_13597 ) ( AVAILABLE ?auto_13598 ) ( SURFACE-AT ?auto_13580 ?auto_13597 ) ( ON ?auto_13580 ?auto_13593 ) ( CLEAR ?auto_13580 ) ( not ( = ?auto_13579 ?auto_13580 ) ) ( not ( = ?auto_13579 ?auto_13593 ) ) ( not ( = ?auto_13580 ?auto_13593 ) ) ( not ( = ?auto_13587 ?auto_13598 ) ) ( SURFACE-AT ?auto_13578 ?auto_13589 ) ( CLEAR ?auto_13578 ) ( IS-CRATE ?auto_13579 ) ( AVAILABLE ?auto_13587 ) ( not ( = ?auto_13591 ?auto_13589 ) ) ( HOIST-AT ?auto_13596 ?auto_13591 ) ( AVAILABLE ?auto_13596 ) ( SURFACE-AT ?auto_13579 ?auto_13591 ) ( ON ?auto_13579 ?auto_13594 ) ( CLEAR ?auto_13579 ) ( TRUCK-AT ?auto_13586 ?auto_13589 ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13594 ) ) ( not ( = ?auto_13579 ?auto_13594 ) ) ( not ( = ?auto_13587 ?auto_13596 ) ) ( not ( = ?auto_13578 ?auto_13580 ) ) ( not ( = ?auto_13578 ?auto_13593 ) ) ( not ( = ?auto_13580 ?auto_13594 ) ) ( not ( = ?auto_13597 ?auto_13591 ) ) ( not ( = ?auto_13598 ?auto_13596 ) ) ( not ( = ?auto_13593 ?auto_13594 ) ) ( not ( = ?auto_13578 ?auto_13581 ) ) ( not ( = ?auto_13578 ?auto_13599 ) ) ( not ( = ?auto_13579 ?auto_13581 ) ) ( not ( = ?auto_13579 ?auto_13599 ) ) ( not ( = ?auto_13581 ?auto_13593 ) ) ( not ( = ?auto_13581 ?auto_13594 ) ) ( not ( = ?auto_13590 ?auto_13597 ) ) ( not ( = ?auto_13590 ?auto_13591 ) ) ( not ( = ?auto_13592 ?auto_13598 ) ) ( not ( = ?auto_13592 ?auto_13596 ) ) ( not ( = ?auto_13599 ?auto_13593 ) ) ( not ( = ?auto_13599 ?auto_13594 ) ) ( not ( = ?auto_13578 ?auto_13582 ) ) ( not ( = ?auto_13578 ?auto_13595 ) ) ( not ( = ?auto_13579 ?auto_13582 ) ) ( not ( = ?auto_13579 ?auto_13595 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13580 ?auto_13595 ) ) ( not ( = ?auto_13582 ?auto_13599 ) ) ( not ( = ?auto_13582 ?auto_13593 ) ) ( not ( = ?auto_13582 ?auto_13594 ) ) ( not ( = ?auto_13584 ?auto_13590 ) ) ( not ( = ?auto_13584 ?auto_13597 ) ) ( not ( = ?auto_13584 ?auto_13591 ) ) ( not ( = ?auto_13588 ?auto_13592 ) ) ( not ( = ?auto_13588 ?auto_13598 ) ) ( not ( = ?auto_13588 ?auto_13596 ) ) ( not ( = ?auto_13595 ?auto_13599 ) ) ( not ( = ?auto_13595 ?auto_13593 ) ) ( not ( = ?auto_13595 ?auto_13594 ) ) ( not ( = ?auto_13578 ?auto_13583 ) ) ( not ( = ?auto_13578 ?auto_13585 ) ) ( not ( = ?auto_13579 ?auto_13583 ) ) ( not ( = ?auto_13579 ?auto_13585 ) ) ( not ( = ?auto_13580 ?auto_13583 ) ) ( not ( = ?auto_13580 ?auto_13585 ) ) ( not ( = ?auto_13581 ?auto_13583 ) ) ( not ( = ?auto_13581 ?auto_13585 ) ) ( not ( = ?auto_13583 ?auto_13595 ) ) ( not ( = ?auto_13583 ?auto_13599 ) ) ( not ( = ?auto_13583 ?auto_13593 ) ) ( not ( = ?auto_13583 ?auto_13594 ) ) ( not ( = ?auto_13585 ?auto_13595 ) ) ( not ( = ?auto_13585 ?auto_13599 ) ) ( not ( = ?auto_13585 ?auto_13593 ) ) ( not ( = ?auto_13585 ?auto_13594 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13578 ?auto_13579 ?auto_13580 ?auto_13581 ?auto_13582 )
      ( MAKE-1CRATE ?auto_13582 ?auto_13583 )
      ( MAKE-5CRATE-VERIFY ?auto_13578 ?auto_13579 ?auto_13580 ?auto_13581 ?auto_13582 ?auto_13583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13602 - SURFACE
      ?auto_13603 - SURFACE
    )
    :vars
    (
      ?auto_13604 - HOIST
      ?auto_13605 - PLACE
      ?auto_13607 - PLACE
      ?auto_13608 - HOIST
      ?auto_13609 - SURFACE
      ?auto_13606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13604 ?auto_13605 ) ( SURFACE-AT ?auto_13602 ?auto_13605 ) ( CLEAR ?auto_13602 ) ( IS-CRATE ?auto_13603 ) ( AVAILABLE ?auto_13604 ) ( not ( = ?auto_13607 ?auto_13605 ) ) ( HOIST-AT ?auto_13608 ?auto_13607 ) ( AVAILABLE ?auto_13608 ) ( SURFACE-AT ?auto_13603 ?auto_13607 ) ( ON ?auto_13603 ?auto_13609 ) ( CLEAR ?auto_13603 ) ( TRUCK-AT ?auto_13606 ?auto_13605 ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13609 ) ) ( not ( = ?auto_13603 ?auto_13609 ) ) ( not ( = ?auto_13604 ?auto_13608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13606 ?auto_13605 ?auto_13607 )
      ( !LIFT ?auto_13608 ?auto_13603 ?auto_13609 ?auto_13607 )
      ( !LOAD ?auto_13608 ?auto_13603 ?auto_13606 ?auto_13607 )
      ( !DRIVE ?auto_13606 ?auto_13607 ?auto_13605 )
      ( !UNLOAD ?auto_13604 ?auto_13603 ?auto_13606 ?auto_13605 )
      ( !DROP ?auto_13604 ?auto_13603 ?auto_13602 ?auto_13605 )
      ( MAKE-1CRATE-VERIFY ?auto_13602 ?auto_13603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13617 - SURFACE
      ?auto_13618 - SURFACE
      ?auto_13619 - SURFACE
      ?auto_13620 - SURFACE
      ?auto_13621 - SURFACE
      ?auto_13622 - SURFACE
      ?auto_13623 - SURFACE
    )
    :vars
    (
      ?auto_13626 - HOIST
      ?auto_13629 - PLACE
      ?auto_13625 - PLACE
      ?auto_13628 - HOIST
      ?auto_13627 - SURFACE
      ?auto_13640 - PLACE
      ?auto_13639 - HOIST
      ?auto_13637 - SURFACE
      ?auto_13630 - SURFACE
      ?auto_13636 - PLACE
      ?auto_13641 - HOIST
      ?auto_13634 - SURFACE
      ?auto_13638 - PLACE
      ?auto_13642 - HOIST
      ?auto_13632 - SURFACE
      ?auto_13633 - PLACE
      ?auto_13631 - HOIST
      ?auto_13635 - SURFACE
      ?auto_13624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13626 ?auto_13629 ) ( IS-CRATE ?auto_13623 ) ( not ( = ?auto_13625 ?auto_13629 ) ) ( HOIST-AT ?auto_13628 ?auto_13625 ) ( AVAILABLE ?auto_13628 ) ( SURFACE-AT ?auto_13623 ?auto_13625 ) ( ON ?auto_13623 ?auto_13627 ) ( CLEAR ?auto_13623 ) ( not ( = ?auto_13622 ?auto_13623 ) ) ( not ( = ?auto_13622 ?auto_13627 ) ) ( not ( = ?auto_13623 ?auto_13627 ) ) ( not ( = ?auto_13626 ?auto_13628 ) ) ( IS-CRATE ?auto_13622 ) ( not ( = ?auto_13640 ?auto_13629 ) ) ( HOIST-AT ?auto_13639 ?auto_13640 ) ( SURFACE-AT ?auto_13622 ?auto_13640 ) ( ON ?auto_13622 ?auto_13637 ) ( CLEAR ?auto_13622 ) ( not ( = ?auto_13621 ?auto_13622 ) ) ( not ( = ?auto_13621 ?auto_13637 ) ) ( not ( = ?auto_13622 ?auto_13637 ) ) ( not ( = ?auto_13626 ?auto_13639 ) ) ( IS-CRATE ?auto_13621 ) ( AVAILABLE ?auto_13639 ) ( SURFACE-AT ?auto_13621 ?auto_13640 ) ( ON ?auto_13621 ?auto_13630 ) ( CLEAR ?auto_13621 ) ( not ( = ?auto_13620 ?auto_13621 ) ) ( not ( = ?auto_13620 ?auto_13630 ) ) ( not ( = ?auto_13621 ?auto_13630 ) ) ( IS-CRATE ?auto_13620 ) ( not ( = ?auto_13636 ?auto_13629 ) ) ( HOIST-AT ?auto_13641 ?auto_13636 ) ( AVAILABLE ?auto_13641 ) ( SURFACE-AT ?auto_13620 ?auto_13636 ) ( ON ?auto_13620 ?auto_13634 ) ( CLEAR ?auto_13620 ) ( not ( = ?auto_13619 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13634 ) ) ( not ( = ?auto_13620 ?auto_13634 ) ) ( not ( = ?auto_13626 ?auto_13641 ) ) ( IS-CRATE ?auto_13619 ) ( not ( = ?auto_13638 ?auto_13629 ) ) ( HOIST-AT ?auto_13642 ?auto_13638 ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13619 ?auto_13638 ) ( ON ?auto_13619 ?auto_13632 ) ( CLEAR ?auto_13619 ) ( not ( = ?auto_13618 ?auto_13619 ) ) ( not ( = ?auto_13618 ?auto_13632 ) ) ( not ( = ?auto_13619 ?auto_13632 ) ) ( not ( = ?auto_13626 ?auto_13642 ) ) ( SURFACE-AT ?auto_13617 ?auto_13629 ) ( CLEAR ?auto_13617 ) ( IS-CRATE ?auto_13618 ) ( AVAILABLE ?auto_13626 ) ( not ( = ?auto_13633 ?auto_13629 ) ) ( HOIST-AT ?auto_13631 ?auto_13633 ) ( AVAILABLE ?auto_13631 ) ( SURFACE-AT ?auto_13618 ?auto_13633 ) ( ON ?auto_13618 ?auto_13635 ) ( CLEAR ?auto_13618 ) ( TRUCK-AT ?auto_13624 ?auto_13629 ) ( not ( = ?auto_13617 ?auto_13618 ) ) ( not ( = ?auto_13617 ?auto_13635 ) ) ( not ( = ?auto_13618 ?auto_13635 ) ) ( not ( = ?auto_13626 ?auto_13631 ) ) ( not ( = ?auto_13617 ?auto_13619 ) ) ( not ( = ?auto_13617 ?auto_13632 ) ) ( not ( = ?auto_13619 ?auto_13635 ) ) ( not ( = ?auto_13638 ?auto_13633 ) ) ( not ( = ?auto_13642 ?auto_13631 ) ) ( not ( = ?auto_13632 ?auto_13635 ) ) ( not ( = ?auto_13617 ?auto_13620 ) ) ( not ( = ?auto_13617 ?auto_13634 ) ) ( not ( = ?auto_13618 ?auto_13620 ) ) ( not ( = ?auto_13618 ?auto_13634 ) ) ( not ( = ?auto_13620 ?auto_13632 ) ) ( not ( = ?auto_13620 ?auto_13635 ) ) ( not ( = ?auto_13636 ?auto_13638 ) ) ( not ( = ?auto_13636 ?auto_13633 ) ) ( not ( = ?auto_13641 ?auto_13642 ) ) ( not ( = ?auto_13641 ?auto_13631 ) ) ( not ( = ?auto_13634 ?auto_13632 ) ) ( not ( = ?auto_13634 ?auto_13635 ) ) ( not ( = ?auto_13617 ?auto_13621 ) ) ( not ( = ?auto_13617 ?auto_13630 ) ) ( not ( = ?auto_13618 ?auto_13621 ) ) ( not ( = ?auto_13618 ?auto_13630 ) ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( not ( = ?auto_13619 ?auto_13630 ) ) ( not ( = ?auto_13621 ?auto_13634 ) ) ( not ( = ?auto_13621 ?auto_13632 ) ) ( not ( = ?auto_13621 ?auto_13635 ) ) ( not ( = ?auto_13640 ?auto_13636 ) ) ( not ( = ?auto_13640 ?auto_13638 ) ) ( not ( = ?auto_13640 ?auto_13633 ) ) ( not ( = ?auto_13639 ?auto_13641 ) ) ( not ( = ?auto_13639 ?auto_13642 ) ) ( not ( = ?auto_13639 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13634 ) ) ( not ( = ?auto_13630 ?auto_13632 ) ) ( not ( = ?auto_13630 ?auto_13635 ) ) ( not ( = ?auto_13617 ?auto_13622 ) ) ( not ( = ?auto_13617 ?auto_13637 ) ) ( not ( = ?auto_13618 ?auto_13622 ) ) ( not ( = ?auto_13618 ?auto_13637 ) ) ( not ( = ?auto_13619 ?auto_13622 ) ) ( not ( = ?auto_13619 ?auto_13637 ) ) ( not ( = ?auto_13620 ?auto_13622 ) ) ( not ( = ?auto_13620 ?auto_13637 ) ) ( not ( = ?auto_13622 ?auto_13630 ) ) ( not ( = ?auto_13622 ?auto_13634 ) ) ( not ( = ?auto_13622 ?auto_13632 ) ) ( not ( = ?auto_13622 ?auto_13635 ) ) ( not ( = ?auto_13637 ?auto_13630 ) ) ( not ( = ?auto_13637 ?auto_13634 ) ) ( not ( = ?auto_13637 ?auto_13632 ) ) ( not ( = ?auto_13637 ?auto_13635 ) ) ( not ( = ?auto_13617 ?auto_13623 ) ) ( not ( = ?auto_13617 ?auto_13627 ) ) ( not ( = ?auto_13618 ?auto_13623 ) ) ( not ( = ?auto_13618 ?auto_13627 ) ) ( not ( = ?auto_13619 ?auto_13623 ) ) ( not ( = ?auto_13619 ?auto_13627 ) ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( not ( = ?auto_13620 ?auto_13627 ) ) ( not ( = ?auto_13621 ?auto_13623 ) ) ( not ( = ?auto_13621 ?auto_13627 ) ) ( not ( = ?auto_13623 ?auto_13637 ) ) ( not ( = ?auto_13623 ?auto_13630 ) ) ( not ( = ?auto_13623 ?auto_13634 ) ) ( not ( = ?auto_13623 ?auto_13632 ) ) ( not ( = ?auto_13623 ?auto_13635 ) ) ( not ( = ?auto_13625 ?auto_13640 ) ) ( not ( = ?auto_13625 ?auto_13636 ) ) ( not ( = ?auto_13625 ?auto_13638 ) ) ( not ( = ?auto_13625 ?auto_13633 ) ) ( not ( = ?auto_13628 ?auto_13639 ) ) ( not ( = ?auto_13628 ?auto_13641 ) ) ( not ( = ?auto_13628 ?auto_13642 ) ) ( not ( = ?auto_13628 ?auto_13631 ) ) ( not ( = ?auto_13627 ?auto_13637 ) ) ( not ( = ?auto_13627 ?auto_13630 ) ) ( not ( = ?auto_13627 ?auto_13634 ) ) ( not ( = ?auto_13627 ?auto_13632 ) ) ( not ( = ?auto_13627 ?auto_13635 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13620 ?auto_13621 ?auto_13622 )
      ( MAKE-1CRATE ?auto_13622 ?auto_13623 )
      ( MAKE-6CRATE-VERIFY ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13620 ?auto_13621 ?auto_13622 ?auto_13623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13645 - SURFACE
      ?auto_13646 - SURFACE
    )
    :vars
    (
      ?auto_13647 - HOIST
      ?auto_13648 - PLACE
      ?auto_13650 - PLACE
      ?auto_13651 - HOIST
      ?auto_13652 - SURFACE
      ?auto_13649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13647 ?auto_13648 ) ( SURFACE-AT ?auto_13645 ?auto_13648 ) ( CLEAR ?auto_13645 ) ( IS-CRATE ?auto_13646 ) ( AVAILABLE ?auto_13647 ) ( not ( = ?auto_13650 ?auto_13648 ) ) ( HOIST-AT ?auto_13651 ?auto_13650 ) ( AVAILABLE ?auto_13651 ) ( SURFACE-AT ?auto_13646 ?auto_13650 ) ( ON ?auto_13646 ?auto_13652 ) ( CLEAR ?auto_13646 ) ( TRUCK-AT ?auto_13649 ?auto_13648 ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( not ( = ?auto_13645 ?auto_13652 ) ) ( not ( = ?auto_13646 ?auto_13652 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13649 ?auto_13648 ?auto_13650 )
      ( !LIFT ?auto_13651 ?auto_13646 ?auto_13652 ?auto_13650 )
      ( !LOAD ?auto_13651 ?auto_13646 ?auto_13649 ?auto_13650 )
      ( !DRIVE ?auto_13649 ?auto_13650 ?auto_13648 )
      ( !UNLOAD ?auto_13647 ?auto_13646 ?auto_13649 ?auto_13648 )
      ( !DROP ?auto_13647 ?auto_13646 ?auto_13645 ?auto_13648 )
      ( MAKE-1CRATE-VERIFY ?auto_13645 ?auto_13646 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13661 - SURFACE
      ?auto_13662 - SURFACE
      ?auto_13663 - SURFACE
      ?auto_13664 - SURFACE
      ?auto_13665 - SURFACE
      ?auto_13666 - SURFACE
      ?auto_13667 - SURFACE
      ?auto_13668 - SURFACE
    )
    :vars
    (
      ?auto_13672 - HOIST
      ?auto_13670 - PLACE
      ?auto_13671 - PLACE
      ?auto_13674 - HOIST
      ?auto_13673 - SURFACE
      ?auto_13677 - PLACE
      ?auto_13688 - HOIST
      ?auto_13687 - SURFACE
      ?auto_13679 - PLACE
      ?auto_13680 - HOIST
      ?auto_13683 - SURFACE
      ?auto_13676 - SURFACE
      ?auto_13684 - PLACE
      ?auto_13681 - HOIST
      ?auto_13686 - SURFACE
      ?auto_13678 - PLACE
      ?auto_13682 - HOIST
      ?auto_13690 - SURFACE
      ?auto_13675 - PLACE
      ?auto_13689 - HOIST
      ?auto_13685 - SURFACE
      ?auto_13669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13672 ?auto_13670 ) ( IS-CRATE ?auto_13668 ) ( not ( = ?auto_13671 ?auto_13670 ) ) ( HOIST-AT ?auto_13674 ?auto_13671 ) ( AVAILABLE ?auto_13674 ) ( SURFACE-AT ?auto_13668 ?auto_13671 ) ( ON ?auto_13668 ?auto_13673 ) ( CLEAR ?auto_13668 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13673 ) ) ( not ( = ?auto_13668 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13674 ) ) ( IS-CRATE ?auto_13667 ) ( not ( = ?auto_13677 ?auto_13670 ) ) ( HOIST-AT ?auto_13688 ?auto_13677 ) ( AVAILABLE ?auto_13688 ) ( SURFACE-AT ?auto_13667 ?auto_13677 ) ( ON ?auto_13667 ?auto_13687 ) ( CLEAR ?auto_13667 ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13687 ) ) ( not ( = ?auto_13667 ?auto_13687 ) ) ( not ( = ?auto_13672 ?auto_13688 ) ) ( IS-CRATE ?auto_13666 ) ( not ( = ?auto_13679 ?auto_13670 ) ) ( HOIST-AT ?auto_13680 ?auto_13679 ) ( SURFACE-AT ?auto_13666 ?auto_13679 ) ( ON ?auto_13666 ?auto_13683 ) ( CLEAR ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13683 ) ) ( not ( = ?auto_13666 ?auto_13683 ) ) ( not ( = ?auto_13672 ?auto_13680 ) ) ( IS-CRATE ?auto_13665 ) ( AVAILABLE ?auto_13680 ) ( SURFACE-AT ?auto_13665 ?auto_13679 ) ( ON ?auto_13665 ?auto_13676 ) ( CLEAR ?auto_13665 ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13676 ) ) ( not ( = ?auto_13665 ?auto_13676 ) ) ( IS-CRATE ?auto_13664 ) ( not ( = ?auto_13684 ?auto_13670 ) ) ( HOIST-AT ?auto_13681 ?auto_13684 ) ( AVAILABLE ?auto_13681 ) ( SURFACE-AT ?auto_13664 ?auto_13684 ) ( ON ?auto_13664 ?auto_13686 ) ( CLEAR ?auto_13664 ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13663 ?auto_13686 ) ) ( not ( = ?auto_13664 ?auto_13686 ) ) ( not ( = ?auto_13672 ?auto_13681 ) ) ( IS-CRATE ?auto_13663 ) ( not ( = ?auto_13678 ?auto_13670 ) ) ( HOIST-AT ?auto_13682 ?auto_13678 ) ( AVAILABLE ?auto_13682 ) ( SURFACE-AT ?auto_13663 ?auto_13678 ) ( ON ?auto_13663 ?auto_13690 ) ( CLEAR ?auto_13663 ) ( not ( = ?auto_13662 ?auto_13663 ) ) ( not ( = ?auto_13662 ?auto_13690 ) ) ( not ( = ?auto_13663 ?auto_13690 ) ) ( not ( = ?auto_13672 ?auto_13682 ) ) ( SURFACE-AT ?auto_13661 ?auto_13670 ) ( CLEAR ?auto_13661 ) ( IS-CRATE ?auto_13662 ) ( AVAILABLE ?auto_13672 ) ( not ( = ?auto_13675 ?auto_13670 ) ) ( HOIST-AT ?auto_13689 ?auto_13675 ) ( AVAILABLE ?auto_13689 ) ( SURFACE-AT ?auto_13662 ?auto_13675 ) ( ON ?auto_13662 ?auto_13685 ) ( CLEAR ?auto_13662 ) ( TRUCK-AT ?auto_13669 ?auto_13670 ) ( not ( = ?auto_13661 ?auto_13662 ) ) ( not ( = ?auto_13661 ?auto_13685 ) ) ( not ( = ?auto_13662 ?auto_13685 ) ) ( not ( = ?auto_13672 ?auto_13689 ) ) ( not ( = ?auto_13661 ?auto_13663 ) ) ( not ( = ?auto_13661 ?auto_13690 ) ) ( not ( = ?auto_13663 ?auto_13685 ) ) ( not ( = ?auto_13678 ?auto_13675 ) ) ( not ( = ?auto_13682 ?auto_13689 ) ) ( not ( = ?auto_13690 ?auto_13685 ) ) ( not ( = ?auto_13661 ?auto_13664 ) ) ( not ( = ?auto_13661 ?auto_13686 ) ) ( not ( = ?auto_13662 ?auto_13664 ) ) ( not ( = ?auto_13662 ?auto_13686 ) ) ( not ( = ?auto_13664 ?auto_13690 ) ) ( not ( = ?auto_13664 ?auto_13685 ) ) ( not ( = ?auto_13684 ?auto_13678 ) ) ( not ( = ?auto_13684 ?auto_13675 ) ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( not ( = ?auto_13681 ?auto_13689 ) ) ( not ( = ?auto_13686 ?auto_13690 ) ) ( not ( = ?auto_13686 ?auto_13685 ) ) ( not ( = ?auto_13661 ?auto_13665 ) ) ( not ( = ?auto_13661 ?auto_13676 ) ) ( not ( = ?auto_13662 ?auto_13665 ) ) ( not ( = ?auto_13662 ?auto_13676 ) ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( not ( = ?auto_13663 ?auto_13676 ) ) ( not ( = ?auto_13665 ?auto_13686 ) ) ( not ( = ?auto_13665 ?auto_13690 ) ) ( not ( = ?auto_13665 ?auto_13685 ) ) ( not ( = ?auto_13679 ?auto_13684 ) ) ( not ( = ?auto_13679 ?auto_13678 ) ) ( not ( = ?auto_13679 ?auto_13675 ) ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( not ( = ?auto_13680 ?auto_13682 ) ) ( not ( = ?auto_13680 ?auto_13689 ) ) ( not ( = ?auto_13676 ?auto_13686 ) ) ( not ( = ?auto_13676 ?auto_13690 ) ) ( not ( = ?auto_13676 ?auto_13685 ) ) ( not ( = ?auto_13661 ?auto_13666 ) ) ( not ( = ?auto_13661 ?auto_13683 ) ) ( not ( = ?auto_13662 ?auto_13666 ) ) ( not ( = ?auto_13662 ?auto_13683 ) ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( not ( = ?auto_13663 ?auto_13683 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13683 ) ) ( not ( = ?auto_13666 ?auto_13676 ) ) ( not ( = ?auto_13666 ?auto_13686 ) ) ( not ( = ?auto_13666 ?auto_13690 ) ) ( not ( = ?auto_13666 ?auto_13685 ) ) ( not ( = ?auto_13683 ?auto_13676 ) ) ( not ( = ?auto_13683 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13690 ) ) ( not ( = ?auto_13683 ?auto_13685 ) ) ( not ( = ?auto_13661 ?auto_13667 ) ) ( not ( = ?auto_13661 ?auto_13687 ) ) ( not ( = ?auto_13662 ?auto_13667 ) ) ( not ( = ?auto_13662 ?auto_13687 ) ) ( not ( = ?auto_13663 ?auto_13667 ) ) ( not ( = ?auto_13663 ?auto_13687 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13664 ?auto_13687 ) ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13687 ) ) ( not ( = ?auto_13667 ?auto_13683 ) ) ( not ( = ?auto_13667 ?auto_13676 ) ) ( not ( = ?auto_13667 ?auto_13686 ) ) ( not ( = ?auto_13667 ?auto_13690 ) ) ( not ( = ?auto_13667 ?auto_13685 ) ) ( not ( = ?auto_13677 ?auto_13679 ) ) ( not ( = ?auto_13677 ?auto_13684 ) ) ( not ( = ?auto_13677 ?auto_13678 ) ) ( not ( = ?auto_13677 ?auto_13675 ) ) ( not ( = ?auto_13688 ?auto_13680 ) ) ( not ( = ?auto_13688 ?auto_13681 ) ) ( not ( = ?auto_13688 ?auto_13682 ) ) ( not ( = ?auto_13688 ?auto_13689 ) ) ( not ( = ?auto_13687 ?auto_13683 ) ) ( not ( = ?auto_13687 ?auto_13676 ) ) ( not ( = ?auto_13687 ?auto_13686 ) ) ( not ( = ?auto_13687 ?auto_13690 ) ) ( not ( = ?auto_13687 ?auto_13685 ) ) ( not ( = ?auto_13661 ?auto_13668 ) ) ( not ( = ?auto_13661 ?auto_13673 ) ) ( not ( = ?auto_13662 ?auto_13668 ) ) ( not ( = ?auto_13662 ?auto_13673 ) ) ( not ( = ?auto_13663 ?auto_13668 ) ) ( not ( = ?auto_13663 ?auto_13673 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13673 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13673 ) ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13666 ?auto_13673 ) ) ( not ( = ?auto_13668 ?auto_13687 ) ) ( not ( = ?auto_13668 ?auto_13683 ) ) ( not ( = ?auto_13668 ?auto_13676 ) ) ( not ( = ?auto_13668 ?auto_13686 ) ) ( not ( = ?auto_13668 ?auto_13690 ) ) ( not ( = ?auto_13668 ?auto_13685 ) ) ( not ( = ?auto_13671 ?auto_13677 ) ) ( not ( = ?auto_13671 ?auto_13679 ) ) ( not ( = ?auto_13671 ?auto_13684 ) ) ( not ( = ?auto_13671 ?auto_13678 ) ) ( not ( = ?auto_13671 ?auto_13675 ) ) ( not ( = ?auto_13674 ?auto_13688 ) ) ( not ( = ?auto_13674 ?auto_13680 ) ) ( not ( = ?auto_13674 ?auto_13681 ) ) ( not ( = ?auto_13674 ?auto_13682 ) ) ( not ( = ?auto_13674 ?auto_13689 ) ) ( not ( = ?auto_13673 ?auto_13687 ) ) ( not ( = ?auto_13673 ?auto_13683 ) ) ( not ( = ?auto_13673 ?auto_13676 ) ) ( not ( = ?auto_13673 ?auto_13686 ) ) ( not ( = ?auto_13673 ?auto_13690 ) ) ( not ( = ?auto_13673 ?auto_13685 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13661 ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 )
      ( MAKE-1CRATE ?auto_13667 ?auto_13668 )
      ( MAKE-7CRATE-VERIFY ?auto_13661 ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13693 - SURFACE
      ?auto_13694 - SURFACE
    )
    :vars
    (
      ?auto_13695 - HOIST
      ?auto_13696 - PLACE
      ?auto_13698 - PLACE
      ?auto_13699 - HOIST
      ?auto_13700 - SURFACE
      ?auto_13697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13695 ?auto_13696 ) ( SURFACE-AT ?auto_13693 ?auto_13696 ) ( CLEAR ?auto_13693 ) ( IS-CRATE ?auto_13694 ) ( AVAILABLE ?auto_13695 ) ( not ( = ?auto_13698 ?auto_13696 ) ) ( HOIST-AT ?auto_13699 ?auto_13698 ) ( AVAILABLE ?auto_13699 ) ( SURFACE-AT ?auto_13694 ?auto_13698 ) ( ON ?auto_13694 ?auto_13700 ) ( CLEAR ?auto_13694 ) ( TRUCK-AT ?auto_13697 ?auto_13696 ) ( not ( = ?auto_13693 ?auto_13694 ) ) ( not ( = ?auto_13693 ?auto_13700 ) ) ( not ( = ?auto_13694 ?auto_13700 ) ) ( not ( = ?auto_13695 ?auto_13699 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13697 ?auto_13696 ?auto_13698 )
      ( !LIFT ?auto_13699 ?auto_13694 ?auto_13700 ?auto_13698 )
      ( !LOAD ?auto_13699 ?auto_13694 ?auto_13697 ?auto_13698 )
      ( !DRIVE ?auto_13697 ?auto_13698 ?auto_13696 )
      ( !UNLOAD ?auto_13695 ?auto_13694 ?auto_13697 ?auto_13696 )
      ( !DROP ?auto_13695 ?auto_13694 ?auto_13693 ?auto_13696 )
      ( MAKE-1CRATE-VERIFY ?auto_13693 ?auto_13694 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13710 - SURFACE
      ?auto_13711 - SURFACE
      ?auto_13712 - SURFACE
      ?auto_13713 - SURFACE
      ?auto_13714 - SURFACE
      ?auto_13715 - SURFACE
      ?auto_13716 - SURFACE
      ?auto_13718 - SURFACE
      ?auto_13717 - SURFACE
    )
    :vars
    (
      ?auto_13719 - HOIST
      ?auto_13722 - PLACE
      ?auto_13720 - PLACE
      ?auto_13724 - HOIST
      ?auto_13723 - SURFACE
      ?auto_13741 - PLACE
      ?auto_13739 - HOIST
      ?auto_13740 - SURFACE
      ?auto_13727 - PLACE
      ?auto_13734 - HOIST
      ?auto_13733 - SURFACE
      ?auto_13738 - PLACE
      ?auto_13737 - HOIST
      ?auto_13729 - SURFACE
      ?auto_13742 - SURFACE
      ?auto_13731 - PLACE
      ?auto_13736 - HOIST
      ?auto_13732 - SURFACE
      ?auto_13743 - PLACE
      ?auto_13735 - HOIST
      ?auto_13728 - SURFACE
      ?auto_13726 - PLACE
      ?auto_13725 - HOIST
      ?auto_13730 - SURFACE
      ?auto_13721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13719 ?auto_13722 ) ( IS-CRATE ?auto_13717 ) ( not ( = ?auto_13720 ?auto_13722 ) ) ( HOIST-AT ?auto_13724 ?auto_13720 ) ( AVAILABLE ?auto_13724 ) ( SURFACE-AT ?auto_13717 ?auto_13720 ) ( ON ?auto_13717 ?auto_13723 ) ( CLEAR ?auto_13717 ) ( not ( = ?auto_13718 ?auto_13717 ) ) ( not ( = ?auto_13718 ?auto_13723 ) ) ( not ( = ?auto_13717 ?auto_13723 ) ) ( not ( = ?auto_13719 ?auto_13724 ) ) ( IS-CRATE ?auto_13718 ) ( not ( = ?auto_13741 ?auto_13722 ) ) ( HOIST-AT ?auto_13739 ?auto_13741 ) ( AVAILABLE ?auto_13739 ) ( SURFACE-AT ?auto_13718 ?auto_13741 ) ( ON ?auto_13718 ?auto_13740 ) ( CLEAR ?auto_13718 ) ( not ( = ?auto_13716 ?auto_13718 ) ) ( not ( = ?auto_13716 ?auto_13740 ) ) ( not ( = ?auto_13718 ?auto_13740 ) ) ( not ( = ?auto_13719 ?auto_13739 ) ) ( IS-CRATE ?auto_13716 ) ( not ( = ?auto_13727 ?auto_13722 ) ) ( HOIST-AT ?auto_13734 ?auto_13727 ) ( AVAILABLE ?auto_13734 ) ( SURFACE-AT ?auto_13716 ?auto_13727 ) ( ON ?auto_13716 ?auto_13733 ) ( CLEAR ?auto_13716 ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( not ( = ?auto_13715 ?auto_13733 ) ) ( not ( = ?auto_13716 ?auto_13733 ) ) ( not ( = ?auto_13719 ?auto_13734 ) ) ( IS-CRATE ?auto_13715 ) ( not ( = ?auto_13738 ?auto_13722 ) ) ( HOIST-AT ?auto_13737 ?auto_13738 ) ( SURFACE-AT ?auto_13715 ?auto_13738 ) ( ON ?auto_13715 ?auto_13729 ) ( CLEAR ?auto_13715 ) ( not ( = ?auto_13714 ?auto_13715 ) ) ( not ( = ?auto_13714 ?auto_13729 ) ) ( not ( = ?auto_13715 ?auto_13729 ) ) ( not ( = ?auto_13719 ?auto_13737 ) ) ( IS-CRATE ?auto_13714 ) ( AVAILABLE ?auto_13737 ) ( SURFACE-AT ?auto_13714 ?auto_13738 ) ( ON ?auto_13714 ?auto_13742 ) ( CLEAR ?auto_13714 ) ( not ( = ?auto_13713 ?auto_13714 ) ) ( not ( = ?auto_13713 ?auto_13742 ) ) ( not ( = ?auto_13714 ?auto_13742 ) ) ( IS-CRATE ?auto_13713 ) ( not ( = ?auto_13731 ?auto_13722 ) ) ( HOIST-AT ?auto_13736 ?auto_13731 ) ( AVAILABLE ?auto_13736 ) ( SURFACE-AT ?auto_13713 ?auto_13731 ) ( ON ?auto_13713 ?auto_13732 ) ( CLEAR ?auto_13713 ) ( not ( = ?auto_13712 ?auto_13713 ) ) ( not ( = ?auto_13712 ?auto_13732 ) ) ( not ( = ?auto_13713 ?auto_13732 ) ) ( not ( = ?auto_13719 ?auto_13736 ) ) ( IS-CRATE ?auto_13712 ) ( not ( = ?auto_13743 ?auto_13722 ) ) ( HOIST-AT ?auto_13735 ?auto_13743 ) ( AVAILABLE ?auto_13735 ) ( SURFACE-AT ?auto_13712 ?auto_13743 ) ( ON ?auto_13712 ?auto_13728 ) ( CLEAR ?auto_13712 ) ( not ( = ?auto_13711 ?auto_13712 ) ) ( not ( = ?auto_13711 ?auto_13728 ) ) ( not ( = ?auto_13712 ?auto_13728 ) ) ( not ( = ?auto_13719 ?auto_13735 ) ) ( SURFACE-AT ?auto_13710 ?auto_13722 ) ( CLEAR ?auto_13710 ) ( IS-CRATE ?auto_13711 ) ( AVAILABLE ?auto_13719 ) ( not ( = ?auto_13726 ?auto_13722 ) ) ( HOIST-AT ?auto_13725 ?auto_13726 ) ( AVAILABLE ?auto_13725 ) ( SURFACE-AT ?auto_13711 ?auto_13726 ) ( ON ?auto_13711 ?auto_13730 ) ( CLEAR ?auto_13711 ) ( TRUCK-AT ?auto_13721 ?auto_13722 ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13730 ) ) ( not ( = ?auto_13711 ?auto_13730 ) ) ( not ( = ?auto_13719 ?auto_13725 ) ) ( not ( = ?auto_13710 ?auto_13712 ) ) ( not ( = ?auto_13710 ?auto_13728 ) ) ( not ( = ?auto_13712 ?auto_13730 ) ) ( not ( = ?auto_13743 ?auto_13726 ) ) ( not ( = ?auto_13735 ?auto_13725 ) ) ( not ( = ?auto_13728 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13713 ) ) ( not ( = ?auto_13710 ?auto_13732 ) ) ( not ( = ?auto_13711 ?auto_13713 ) ) ( not ( = ?auto_13711 ?auto_13732 ) ) ( not ( = ?auto_13713 ?auto_13728 ) ) ( not ( = ?auto_13713 ?auto_13730 ) ) ( not ( = ?auto_13731 ?auto_13743 ) ) ( not ( = ?auto_13731 ?auto_13726 ) ) ( not ( = ?auto_13736 ?auto_13735 ) ) ( not ( = ?auto_13736 ?auto_13725 ) ) ( not ( = ?auto_13732 ?auto_13728 ) ) ( not ( = ?auto_13732 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13714 ) ) ( not ( = ?auto_13710 ?auto_13742 ) ) ( not ( = ?auto_13711 ?auto_13714 ) ) ( not ( = ?auto_13711 ?auto_13742 ) ) ( not ( = ?auto_13712 ?auto_13714 ) ) ( not ( = ?auto_13712 ?auto_13742 ) ) ( not ( = ?auto_13714 ?auto_13732 ) ) ( not ( = ?auto_13714 ?auto_13728 ) ) ( not ( = ?auto_13714 ?auto_13730 ) ) ( not ( = ?auto_13738 ?auto_13731 ) ) ( not ( = ?auto_13738 ?auto_13743 ) ) ( not ( = ?auto_13738 ?auto_13726 ) ) ( not ( = ?auto_13737 ?auto_13736 ) ) ( not ( = ?auto_13737 ?auto_13735 ) ) ( not ( = ?auto_13737 ?auto_13725 ) ) ( not ( = ?auto_13742 ?auto_13732 ) ) ( not ( = ?auto_13742 ?auto_13728 ) ) ( not ( = ?auto_13742 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13715 ) ) ( not ( = ?auto_13710 ?auto_13729 ) ) ( not ( = ?auto_13711 ?auto_13715 ) ) ( not ( = ?auto_13711 ?auto_13729 ) ) ( not ( = ?auto_13712 ?auto_13715 ) ) ( not ( = ?auto_13712 ?auto_13729 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) ( not ( = ?auto_13713 ?auto_13729 ) ) ( not ( = ?auto_13715 ?auto_13742 ) ) ( not ( = ?auto_13715 ?auto_13732 ) ) ( not ( = ?auto_13715 ?auto_13728 ) ) ( not ( = ?auto_13715 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13742 ) ) ( not ( = ?auto_13729 ?auto_13732 ) ) ( not ( = ?auto_13729 ?auto_13728 ) ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13716 ) ) ( not ( = ?auto_13710 ?auto_13733 ) ) ( not ( = ?auto_13711 ?auto_13716 ) ) ( not ( = ?auto_13711 ?auto_13733 ) ) ( not ( = ?auto_13712 ?auto_13716 ) ) ( not ( = ?auto_13712 ?auto_13733 ) ) ( not ( = ?auto_13713 ?auto_13716 ) ) ( not ( = ?auto_13713 ?auto_13733 ) ) ( not ( = ?auto_13714 ?auto_13716 ) ) ( not ( = ?auto_13714 ?auto_13733 ) ) ( not ( = ?auto_13716 ?auto_13729 ) ) ( not ( = ?auto_13716 ?auto_13742 ) ) ( not ( = ?auto_13716 ?auto_13732 ) ) ( not ( = ?auto_13716 ?auto_13728 ) ) ( not ( = ?auto_13716 ?auto_13730 ) ) ( not ( = ?auto_13727 ?auto_13738 ) ) ( not ( = ?auto_13727 ?auto_13731 ) ) ( not ( = ?auto_13727 ?auto_13743 ) ) ( not ( = ?auto_13727 ?auto_13726 ) ) ( not ( = ?auto_13734 ?auto_13737 ) ) ( not ( = ?auto_13734 ?auto_13736 ) ) ( not ( = ?auto_13734 ?auto_13735 ) ) ( not ( = ?auto_13734 ?auto_13725 ) ) ( not ( = ?auto_13733 ?auto_13729 ) ) ( not ( = ?auto_13733 ?auto_13742 ) ) ( not ( = ?auto_13733 ?auto_13732 ) ) ( not ( = ?auto_13733 ?auto_13728 ) ) ( not ( = ?auto_13733 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13718 ) ) ( not ( = ?auto_13710 ?auto_13740 ) ) ( not ( = ?auto_13711 ?auto_13718 ) ) ( not ( = ?auto_13711 ?auto_13740 ) ) ( not ( = ?auto_13712 ?auto_13718 ) ) ( not ( = ?auto_13712 ?auto_13740 ) ) ( not ( = ?auto_13713 ?auto_13718 ) ) ( not ( = ?auto_13713 ?auto_13740 ) ) ( not ( = ?auto_13714 ?auto_13718 ) ) ( not ( = ?auto_13714 ?auto_13740 ) ) ( not ( = ?auto_13715 ?auto_13718 ) ) ( not ( = ?auto_13715 ?auto_13740 ) ) ( not ( = ?auto_13718 ?auto_13733 ) ) ( not ( = ?auto_13718 ?auto_13729 ) ) ( not ( = ?auto_13718 ?auto_13742 ) ) ( not ( = ?auto_13718 ?auto_13732 ) ) ( not ( = ?auto_13718 ?auto_13728 ) ) ( not ( = ?auto_13718 ?auto_13730 ) ) ( not ( = ?auto_13741 ?auto_13727 ) ) ( not ( = ?auto_13741 ?auto_13738 ) ) ( not ( = ?auto_13741 ?auto_13731 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13726 ) ) ( not ( = ?auto_13739 ?auto_13734 ) ) ( not ( = ?auto_13739 ?auto_13737 ) ) ( not ( = ?auto_13739 ?auto_13736 ) ) ( not ( = ?auto_13739 ?auto_13735 ) ) ( not ( = ?auto_13739 ?auto_13725 ) ) ( not ( = ?auto_13740 ?auto_13733 ) ) ( not ( = ?auto_13740 ?auto_13729 ) ) ( not ( = ?auto_13740 ?auto_13742 ) ) ( not ( = ?auto_13740 ?auto_13732 ) ) ( not ( = ?auto_13740 ?auto_13728 ) ) ( not ( = ?auto_13740 ?auto_13730 ) ) ( not ( = ?auto_13710 ?auto_13717 ) ) ( not ( = ?auto_13710 ?auto_13723 ) ) ( not ( = ?auto_13711 ?auto_13717 ) ) ( not ( = ?auto_13711 ?auto_13723 ) ) ( not ( = ?auto_13712 ?auto_13717 ) ) ( not ( = ?auto_13712 ?auto_13723 ) ) ( not ( = ?auto_13713 ?auto_13717 ) ) ( not ( = ?auto_13713 ?auto_13723 ) ) ( not ( = ?auto_13714 ?auto_13717 ) ) ( not ( = ?auto_13714 ?auto_13723 ) ) ( not ( = ?auto_13715 ?auto_13717 ) ) ( not ( = ?auto_13715 ?auto_13723 ) ) ( not ( = ?auto_13716 ?auto_13717 ) ) ( not ( = ?auto_13716 ?auto_13723 ) ) ( not ( = ?auto_13717 ?auto_13740 ) ) ( not ( = ?auto_13717 ?auto_13733 ) ) ( not ( = ?auto_13717 ?auto_13729 ) ) ( not ( = ?auto_13717 ?auto_13742 ) ) ( not ( = ?auto_13717 ?auto_13732 ) ) ( not ( = ?auto_13717 ?auto_13728 ) ) ( not ( = ?auto_13717 ?auto_13730 ) ) ( not ( = ?auto_13720 ?auto_13741 ) ) ( not ( = ?auto_13720 ?auto_13727 ) ) ( not ( = ?auto_13720 ?auto_13738 ) ) ( not ( = ?auto_13720 ?auto_13731 ) ) ( not ( = ?auto_13720 ?auto_13743 ) ) ( not ( = ?auto_13720 ?auto_13726 ) ) ( not ( = ?auto_13724 ?auto_13739 ) ) ( not ( = ?auto_13724 ?auto_13734 ) ) ( not ( = ?auto_13724 ?auto_13737 ) ) ( not ( = ?auto_13724 ?auto_13736 ) ) ( not ( = ?auto_13724 ?auto_13735 ) ) ( not ( = ?auto_13724 ?auto_13725 ) ) ( not ( = ?auto_13723 ?auto_13740 ) ) ( not ( = ?auto_13723 ?auto_13733 ) ) ( not ( = ?auto_13723 ?auto_13729 ) ) ( not ( = ?auto_13723 ?auto_13742 ) ) ( not ( = ?auto_13723 ?auto_13732 ) ) ( not ( = ?auto_13723 ?auto_13728 ) ) ( not ( = ?auto_13723 ?auto_13730 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13710 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13714 ?auto_13715 ?auto_13716 ?auto_13718 )
      ( MAKE-1CRATE ?auto_13718 ?auto_13717 )
      ( MAKE-8CRATE-VERIFY ?auto_13710 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13714 ?auto_13715 ?auto_13716 ?auto_13718 ?auto_13717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13746 - SURFACE
      ?auto_13747 - SURFACE
    )
    :vars
    (
      ?auto_13748 - HOIST
      ?auto_13749 - PLACE
      ?auto_13751 - PLACE
      ?auto_13752 - HOIST
      ?auto_13753 - SURFACE
      ?auto_13750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13748 ?auto_13749 ) ( SURFACE-AT ?auto_13746 ?auto_13749 ) ( CLEAR ?auto_13746 ) ( IS-CRATE ?auto_13747 ) ( AVAILABLE ?auto_13748 ) ( not ( = ?auto_13751 ?auto_13749 ) ) ( HOIST-AT ?auto_13752 ?auto_13751 ) ( AVAILABLE ?auto_13752 ) ( SURFACE-AT ?auto_13747 ?auto_13751 ) ( ON ?auto_13747 ?auto_13753 ) ( CLEAR ?auto_13747 ) ( TRUCK-AT ?auto_13750 ?auto_13749 ) ( not ( = ?auto_13746 ?auto_13747 ) ) ( not ( = ?auto_13746 ?auto_13753 ) ) ( not ( = ?auto_13747 ?auto_13753 ) ) ( not ( = ?auto_13748 ?auto_13752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13750 ?auto_13749 ?auto_13751 )
      ( !LIFT ?auto_13752 ?auto_13747 ?auto_13753 ?auto_13751 )
      ( !LOAD ?auto_13752 ?auto_13747 ?auto_13750 ?auto_13751 )
      ( !DRIVE ?auto_13750 ?auto_13751 ?auto_13749 )
      ( !UNLOAD ?auto_13748 ?auto_13747 ?auto_13750 ?auto_13749 )
      ( !DROP ?auto_13748 ?auto_13747 ?auto_13746 ?auto_13749 )
      ( MAKE-1CRATE-VERIFY ?auto_13746 ?auto_13747 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13764 - SURFACE
      ?auto_13765 - SURFACE
      ?auto_13766 - SURFACE
      ?auto_13767 - SURFACE
      ?auto_13768 - SURFACE
      ?auto_13769 - SURFACE
      ?auto_13770 - SURFACE
      ?auto_13773 - SURFACE
      ?auto_13772 - SURFACE
      ?auto_13771 - SURFACE
    )
    :vars
    (
      ?auto_13779 - HOIST
      ?auto_13778 - PLACE
      ?auto_13777 - PLACE
      ?auto_13776 - HOIST
      ?auto_13774 - SURFACE
      ?auto_13798 - PLACE
      ?auto_13781 - HOIST
      ?auto_13797 - SURFACE
      ?auto_13783 - PLACE
      ?auto_13780 - HOIST
      ?auto_13785 - SURFACE
      ?auto_13782 - PLACE
      ?auto_13788 - HOIST
      ?auto_13786 - SURFACE
      ?auto_13791 - PLACE
      ?auto_13790 - HOIST
      ?auto_13795 - SURFACE
      ?auto_13801 - SURFACE
      ?auto_13793 - PLACE
      ?auto_13789 - HOIST
      ?auto_13792 - SURFACE
      ?auto_13800 - PLACE
      ?auto_13787 - HOIST
      ?auto_13799 - SURFACE
      ?auto_13796 - PLACE
      ?auto_13784 - HOIST
      ?auto_13794 - SURFACE
      ?auto_13775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13779 ?auto_13778 ) ( IS-CRATE ?auto_13771 ) ( not ( = ?auto_13777 ?auto_13778 ) ) ( HOIST-AT ?auto_13776 ?auto_13777 ) ( AVAILABLE ?auto_13776 ) ( SURFACE-AT ?auto_13771 ?auto_13777 ) ( ON ?auto_13771 ?auto_13774 ) ( CLEAR ?auto_13771 ) ( not ( = ?auto_13772 ?auto_13771 ) ) ( not ( = ?auto_13772 ?auto_13774 ) ) ( not ( = ?auto_13771 ?auto_13774 ) ) ( not ( = ?auto_13779 ?auto_13776 ) ) ( IS-CRATE ?auto_13772 ) ( not ( = ?auto_13798 ?auto_13778 ) ) ( HOIST-AT ?auto_13781 ?auto_13798 ) ( AVAILABLE ?auto_13781 ) ( SURFACE-AT ?auto_13772 ?auto_13798 ) ( ON ?auto_13772 ?auto_13797 ) ( CLEAR ?auto_13772 ) ( not ( = ?auto_13773 ?auto_13772 ) ) ( not ( = ?auto_13773 ?auto_13797 ) ) ( not ( = ?auto_13772 ?auto_13797 ) ) ( not ( = ?auto_13779 ?auto_13781 ) ) ( IS-CRATE ?auto_13773 ) ( not ( = ?auto_13783 ?auto_13778 ) ) ( HOIST-AT ?auto_13780 ?auto_13783 ) ( AVAILABLE ?auto_13780 ) ( SURFACE-AT ?auto_13773 ?auto_13783 ) ( ON ?auto_13773 ?auto_13785 ) ( CLEAR ?auto_13773 ) ( not ( = ?auto_13770 ?auto_13773 ) ) ( not ( = ?auto_13770 ?auto_13785 ) ) ( not ( = ?auto_13773 ?auto_13785 ) ) ( not ( = ?auto_13779 ?auto_13780 ) ) ( IS-CRATE ?auto_13770 ) ( not ( = ?auto_13782 ?auto_13778 ) ) ( HOIST-AT ?auto_13788 ?auto_13782 ) ( AVAILABLE ?auto_13788 ) ( SURFACE-AT ?auto_13770 ?auto_13782 ) ( ON ?auto_13770 ?auto_13786 ) ( CLEAR ?auto_13770 ) ( not ( = ?auto_13769 ?auto_13770 ) ) ( not ( = ?auto_13769 ?auto_13786 ) ) ( not ( = ?auto_13770 ?auto_13786 ) ) ( not ( = ?auto_13779 ?auto_13788 ) ) ( IS-CRATE ?auto_13769 ) ( not ( = ?auto_13791 ?auto_13778 ) ) ( HOIST-AT ?auto_13790 ?auto_13791 ) ( SURFACE-AT ?auto_13769 ?auto_13791 ) ( ON ?auto_13769 ?auto_13795 ) ( CLEAR ?auto_13769 ) ( not ( = ?auto_13768 ?auto_13769 ) ) ( not ( = ?auto_13768 ?auto_13795 ) ) ( not ( = ?auto_13769 ?auto_13795 ) ) ( not ( = ?auto_13779 ?auto_13790 ) ) ( IS-CRATE ?auto_13768 ) ( AVAILABLE ?auto_13790 ) ( SURFACE-AT ?auto_13768 ?auto_13791 ) ( ON ?auto_13768 ?auto_13801 ) ( CLEAR ?auto_13768 ) ( not ( = ?auto_13767 ?auto_13768 ) ) ( not ( = ?auto_13767 ?auto_13801 ) ) ( not ( = ?auto_13768 ?auto_13801 ) ) ( IS-CRATE ?auto_13767 ) ( not ( = ?auto_13793 ?auto_13778 ) ) ( HOIST-AT ?auto_13789 ?auto_13793 ) ( AVAILABLE ?auto_13789 ) ( SURFACE-AT ?auto_13767 ?auto_13793 ) ( ON ?auto_13767 ?auto_13792 ) ( CLEAR ?auto_13767 ) ( not ( = ?auto_13766 ?auto_13767 ) ) ( not ( = ?auto_13766 ?auto_13792 ) ) ( not ( = ?auto_13767 ?auto_13792 ) ) ( not ( = ?auto_13779 ?auto_13789 ) ) ( IS-CRATE ?auto_13766 ) ( not ( = ?auto_13800 ?auto_13778 ) ) ( HOIST-AT ?auto_13787 ?auto_13800 ) ( AVAILABLE ?auto_13787 ) ( SURFACE-AT ?auto_13766 ?auto_13800 ) ( ON ?auto_13766 ?auto_13799 ) ( CLEAR ?auto_13766 ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13799 ) ) ( not ( = ?auto_13766 ?auto_13799 ) ) ( not ( = ?auto_13779 ?auto_13787 ) ) ( SURFACE-AT ?auto_13764 ?auto_13778 ) ( CLEAR ?auto_13764 ) ( IS-CRATE ?auto_13765 ) ( AVAILABLE ?auto_13779 ) ( not ( = ?auto_13796 ?auto_13778 ) ) ( HOIST-AT ?auto_13784 ?auto_13796 ) ( AVAILABLE ?auto_13784 ) ( SURFACE-AT ?auto_13765 ?auto_13796 ) ( ON ?auto_13765 ?auto_13794 ) ( CLEAR ?auto_13765 ) ( TRUCK-AT ?auto_13775 ?auto_13778 ) ( not ( = ?auto_13764 ?auto_13765 ) ) ( not ( = ?auto_13764 ?auto_13794 ) ) ( not ( = ?auto_13765 ?auto_13794 ) ) ( not ( = ?auto_13779 ?auto_13784 ) ) ( not ( = ?auto_13764 ?auto_13766 ) ) ( not ( = ?auto_13764 ?auto_13799 ) ) ( not ( = ?auto_13766 ?auto_13794 ) ) ( not ( = ?auto_13800 ?auto_13796 ) ) ( not ( = ?auto_13787 ?auto_13784 ) ) ( not ( = ?auto_13799 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13767 ) ) ( not ( = ?auto_13764 ?auto_13792 ) ) ( not ( = ?auto_13765 ?auto_13767 ) ) ( not ( = ?auto_13765 ?auto_13792 ) ) ( not ( = ?auto_13767 ?auto_13799 ) ) ( not ( = ?auto_13767 ?auto_13794 ) ) ( not ( = ?auto_13793 ?auto_13800 ) ) ( not ( = ?auto_13793 ?auto_13796 ) ) ( not ( = ?auto_13789 ?auto_13787 ) ) ( not ( = ?auto_13789 ?auto_13784 ) ) ( not ( = ?auto_13792 ?auto_13799 ) ) ( not ( = ?auto_13792 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13768 ) ) ( not ( = ?auto_13764 ?auto_13801 ) ) ( not ( = ?auto_13765 ?auto_13768 ) ) ( not ( = ?auto_13765 ?auto_13801 ) ) ( not ( = ?auto_13766 ?auto_13768 ) ) ( not ( = ?auto_13766 ?auto_13801 ) ) ( not ( = ?auto_13768 ?auto_13792 ) ) ( not ( = ?auto_13768 ?auto_13799 ) ) ( not ( = ?auto_13768 ?auto_13794 ) ) ( not ( = ?auto_13791 ?auto_13793 ) ) ( not ( = ?auto_13791 ?auto_13800 ) ) ( not ( = ?auto_13791 ?auto_13796 ) ) ( not ( = ?auto_13790 ?auto_13789 ) ) ( not ( = ?auto_13790 ?auto_13787 ) ) ( not ( = ?auto_13790 ?auto_13784 ) ) ( not ( = ?auto_13801 ?auto_13792 ) ) ( not ( = ?auto_13801 ?auto_13799 ) ) ( not ( = ?auto_13801 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13769 ) ) ( not ( = ?auto_13764 ?auto_13795 ) ) ( not ( = ?auto_13765 ?auto_13769 ) ) ( not ( = ?auto_13765 ?auto_13795 ) ) ( not ( = ?auto_13766 ?auto_13769 ) ) ( not ( = ?auto_13766 ?auto_13795 ) ) ( not ( = ?auto_13767 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13795 ) ) ( not ( = ?auto_13769 ?auto_13801 ) ) ( not ( = ?auto_13769 ?auto_13792 ) ) ( not ( = ?auto_13769 ?auto_13799 ) ) ( not ( = ?auto_13769 ?auto_13794 ) ) ( not ( = ?auto_13795 ?auto_13801 ) ) ( not ( = ?auto_13795 ?auto_13792 ) ) ( not ( = ?auto_13795 ?auto_13799 ) ) ( not ( = ?auto_13795 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13770 ) ) ( not ( = ?auto_13764 ?auto_13786 ) ) ( not ( = ?auto_13765 ?auto_13770 ) ) ( not ( = ?auto_13765 ?auto_13786 ) ) ( not ( = ?auto_13766 ?auto_13770 ) ) ( not ( = ?auto_13766 ?auto_13786 ) ) ( not ( = ?auto_13767 ?auto_13770 ) ) ( not ( = ?auto_13767 ?auto_13786 ) ) ( not ( = ?auto_13768 ?auto_13770 ) ) ( not ( = ?auto_13768 ?auto_13786 ) ) ( not ( = ?auto_13770 ?auto_13795 ) ) ( not ( = ?auto_13770 ?auto_13801 ) ) ( not ( = ?auto_13770 ?auto_13792 ) ) ( not ( = ?auto_13770 ?auto_13799 ) ) ( not ( = ?auto_13770 ?auto_13794 ) ) ( not ( = ?auto_13782 ?auto_13791 ) ) ( not ( = ?auto_13782 ?auto_13793 ) ) ( not ( = ?auto_13782 ?auto_13800 ) ) ( not ( = ?auto_13782 ?auto_13796 ) ) ( not ( = ?auto_13788 ?auto_13790 ) ) ( not ( = ?auto_13788 ?auto_13789 ) ) ( not ( = ?auto_13788 ?auto_13787 ) ) ( not ( = ?auto_13788 ?auto_13784 ) ) ( not ( = ?auto_13786 ?auto_13795 ) ) ( not ( = ?auto_13786 ?auto_13801 ) ) ( not ( = ?auto_13786 ?auto_13792 ) ) ( not ( = ?auto_13786 ?auto_13799 ) ) ( not ( = ?auto_13786 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13773 ) ) ( not ( = ?auto_13764 ?auto_13785 ) ) ( not ( = ?auto_13765 ?auto_13773 ) ) ( not ( = ?auto_13765 ?auto_13785 ) ) ( not ( = ?auto_13766 ?auto_13773 ) ) ( not ( = ?auto_13766 ?auto_13785 ) ) ( not ( = ?auto_13767 ?auto_13773 ) ) ( not ( = ?auto_13767 ?auto_13785 ) ) ( not ( = ?auto_13768 ?auto_13773 ) ) ( not ( = ?auto_13768 ?auto_13785 ) ) ( not ( = ?auto_13769 ?auto_13773 ) ) ( not ( = ?auto_13769 ?auto_13785 ) ) ( not ( = ?auto_13773 ?auto_13786 ) ) ( not ( = ?auto_13773 ?auto_13795 ) ) ( not ( = ?auto_13773 ?auto_13801 ) ) ( not ( = ?auto_13773 ?auto_13792 ) ) ( not ( = ?auto_13773 ?auto_13799 ) ) ( not ( = ?auto_13773 ?auto_13794 ) ) ( not ( = ?auto_13783 ?auto_13782 ) ) ( not ( = ?auto_13783 ?auto_13791 ) ) ( not ( = ?auto_13783 ?auto_13793 ) ) ( not ( = ?auto_13783 ?auto_13800 ) ) ( not ( = ?auto_13783 ?auto_13796 ) ) ( not ( = ?auto_13780 ?auto_13788 ) ) ( not ( = ?auto_13780 ?auto_13790 ) ) ( not ( = ?auto_13780 ?auto_13789 ) ) ( not ( = ?auto_13780 ?auto_13787 ) ) ( not ( = ?auto_13780 ?auto_13784 ) ) ( not ( = ?auto_13785 ?auto_13786 ) ) ( not ( = ?auto_13785 ?auto_13795 ) ) ( not ( = ?auto_13785 ?auto_13801 ) ) ( not ( = ?auto_13785 ?auto_13792 ) ) ( not ( = ?auto_13785 ?auto_13799 ) ) ( not ( = ?auto_13785 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13772 ) ) ( not ( = ?auto_13764 ?auto_13797 ) ) ( not ( = ?auto_13765 ?auto_13772 ) ) ( not ( = ?auto_13765 ?auto_13797 ) ) ( not ( = ?auto_13766 ?auto_13772 ) ) ( not ( = ?auto_13766 ?auto_13797 ) ) ( not ( = ?auto_13767 ?auto_13772 ) ) ( not ( = ?auto_13767 ?auto_13797 ) ) ( not ( = ?auto_13768 ?auto_13772 ) ) ( not ( = ?auto_13768 ?auto_13797 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( not ( = ?auto_13769 ?auto_13797 ) ) ( not ( = ?auto_13770 ?auto_13772 ) ) ( not ( = ?auto_13770 ?auto_13797 ) ) ( not ( = ?auto_13772 ?auto_13785 ) ) ( not ( = ?auto_13772 ?auto_13786 ) ) ( not ( = ?auto_13772 ?auto_13795 ) ) ( not ( = ?auto_13772 ?auto_13801 ) ) ( not ( = ?auto_13772 ?auto_13792 ) ) ( not ( = ?auto_13772 ?auto_13799 ) ) ( not ( = ?auto_13772 ?auto_13794 ) ) ( not ( = ?auto_13798 ?auto_13783 ) ) ( not ( = ?auto_13798 ?auto_13782 ) ) ( not ( = ?auto_13798 ?auto_13791 ) ) ( not ( = ?auto_13798 ?auto_13793 ) ) ( not ( = ?auto_13798 ?auto_13800 ) ) ( not ( = ?auto_13798 ?auto_13796 ) ) ( not ( = ?auto_13781 ?auto_13780 ) ) ( not ( = ?auto_13781 ?auto_13788 ) ) ( not ( = ?auto_13781 ?auto_13790 ) ) ( not ( = ?auto_13781 ?auto_13789 ) ) ( not ( = ?auto_13781 ?auto_13787 ) ) ( not ( = ?auto_13781 ?auto_13784 ) ) ( not ( = ?auto_13797 ?auto_13785 ) ) ( not ( = ?auto_13797 ?auto_13786 ) ) ( not ( = ?auto_13797 ?auto_13795 ) ) ( not ( = ?auto_13797 ?auto_13801 ) ) ( not ( = ?auto_13797 ?auto_13792 ) ) ( not ( = ?auto_13797 ?auto_13799 ) ) ( not ( = ?auto_13797 ?auto_13794 ) ) ( not ( = ?auto_13764 ?auto_13771 ) ) ( not ( = ?auto_13764 ?auto_13774 ) ) ( not ( = ?auto_13765 ?auto_13771 ) ) ( not ( = ?auto_13765 ?auto_13774 ) ) ( not ( = ?auto_13766 ?auto_13771 ) ) ( not ( = ?auto_13766 ?auto_13774 ) ) ( not ( = ?auto_13767 ?auto_13771 ) ) ( not ( = ?auto_13767 ?auto_13774 ) ) ( not ( = ?auto_13768 ?auto_13771 ) ) ( not ( = ?auto_13768 ?auto_13774 ) ) ( not ( = ?auto_13769 ?auto_13771 ) ) ( not ( = ?auto_13769 ?auto_13774 ) ) ( not ( = ?auto_13770 ?auto_13771 ) ) ( not ( = ?auto_13770 ?auto_13774 ) ) ( not ( = ?auto_13773 ?auto_13771 ) ) ( not ( = ?auto_13773 ?auto_13774 ) ) ( not ( = ?auto_13771 ?auto_13797 ) ) ( not ( = ?auto_13771 ?auto_13785 ) ) ( not ( = ?auto_13771 ?auto_13786 ) ) ( not ( = ?auto_13771 ?auto_13795 ) ) ( not ( = ?auto_13771 ?auto_13801 ) ) ( not ( = ?auto_13771 ?auto_13792 ) ) ( not ( = ?auto_13771 ?auto_13799 ) ) ( not ( = ?auto_13771 ?auto_13794 ) ) ( not ( = ?auto_13777 ?auto_13798 ) ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( not ( = ?auto_13777 ?auto_13782 ) ) ( not ( = ?auto_13777 ?auto_13791 ) ) ( not ( = ?auto_13777 ?auto_13793 ) ) ( not ( = ?auto_13777 ?auto_13800 ) ) ( not ( = ?auto_13777 ?auto_13796 ) ) ( not ( = ?auto_13776 ?auto_13781 ) ) ( not ( = ?auto_13776 ?auto_13780 ) ) ( not ( = ?auto_13776 ?auto_13788 ) ) ( not ( = ?auto_13776 ?auto_13790 ) ) ( not ( = ?auto_13776 ?auto_13789 ) ) ( not ( = ?auto_13776 ?auto_13787 ) ) ( not ( = ?auto_13776 ?auto_13784 ) ) ( not ( = ?auto_13774 ?auto_13797 ) ) ( not ( = ?auto_13774 ?auto_13785 ) ) ( not ( = ?auto_13774 ?auto_13786 ) ) ( not ( = ?auto_13774 ?auto_13795 ) ) ( not ( = ?auto_13774 ?auto_13801 ) ) ( not ( = ?auto_13774 ?auto_13792 ) ) ( not ( = ?auto_13774 ?auto_13799 ) ) ( not ( = ?auto_13774 ?auto_13794 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13764 ?auto_13765 ?auto_13766 ?auto_13767 ?auto_13768 ?auto_13769 ?auto_13770 ?auto_13773 ?auto_13772 )
      ( MAKE-1CRATE ?auto_13772 ?auto_13771 )
      ( MAKE-9CRATE-VERIFY ?auto_13764 ?auto_13765 ?auto_13766 ?auto_13767 ?auto_13768 ?auto_13769 ?auto_13770 ?auto_13773 ?auto_13772 ?auto_13771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13804 - SURFACE
      ?auto_13805 - SURFACE
    )
    :vars
    (
      ?auto_13806 - HOIST
      ?auto_13807 - PLACE
      ?auto_13809 - PLACE
      ?auto_13810 - HOIST
      ?auto_13811 - SURFACE
      ?auto_13808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13806 ?auto_13807 ) ( SURFACE-AT ?auto_13804 ?auto_13807 ) ( CLEAR ?auto_13804 ) ( IS-CRATE ?auto_13805 ) ( AVAILABLE ?auto_13806 ) ( not ( = ?auto_13809 ?auto_13807 ) ) ( HOIST-AT ?auto_13810 ?auto_13809 ) ( AVAILABLE ?auto_13810 ) ( SURFACE-AT ?auto_13805 ?auto_13809 ) ( ON ?auto_13805 ?auto_13811 ) ( CLEAR ?auto_13805 ) ( TRUCK-AT ?auto_13808 ?auto_13807 ) ( not ( = ?auto_13804 ?auto_13805 ) ) ( not ( = ?auto_13804 ?auto_13811 ) ) ( not ( = ?auto_13805 ?auto_13811 ) ) ( not ( = ?auto_13806 ?auto_13810 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13808 ?auto_13807 ?auto_13809 )
      ( !LIFT ?auto_13810 ?auto_13805 ?auto_13811 ?auto_13809 )
      ( !LOAD ?auto_13810 ?auto_13805 ?auto_13808 ?auto_13809 )
      ( !DRIVE ?auto_13808 ?auto_13809 ?auto_13807 )
      ( !UNLOAD ?auto_13806 ?auto_13805 ?auto_13808 ?auto_13807 )
      ( !DROP ?auto_13806 ?auto_13805 ?auto_13804 ?auto_13807 )
      ( MAKE-1CRATE-VERIFY ?auto_13804 ?auto_13805 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13823 - SURFACE
      ?auto_13824 - SURFACE
      ?auto_13825 - SURFACE
      ?auto_13826 - SURFACE
      ?auto_13827 - SURFACE
      ?auto_13828 - SURFACE
      ?auto_13829 - SURFACE
      ?auto_13832 - SURFACE
      ?auto_13831 - SURFACE
      ?auto_13830 - SURFACE
      ?auto_13833 - SURFACE
    )
    :vars
    (
      ?auto_13834 - HOIST
      ?auto_13836 - PLACE
      ?auto_13837 - PLACE
      ?auto_13839 - HOIST
      ?auto_13835 - SURFACE
      ?auto_13864 - PLACE
      ?auto_13862 - HOIST
      ?auto_13852 - SURFACE
      ?auto_13851 - PLACE
      ?auto_13849 - HOIST
      ?auto_13860 - SURFACE
      ?auto_13861 - PLACE
      ?auto_13847 - HOIST
      ?auto_13844 - SURFACE
      ?auto_13841 - PLACE
      ?auto_13853 - HOIST
      ?auto_13845 - SURFACE
      ?auto_13857 - PLACE
      ?auto_13846 - HOIST
      ?auto_13858 - SURFACE
      ?auto_13850 - SURFACE
      ?auto_13855 - PLACE
      ?auto_13854 - HOIST
      ?auto_13859 - SURFACE
      ?auto_13848 - PLACE
      ?auto_13856 - HOIST
      ?auto_13842 - SURFACE
      ?auto_13840 - PLACE
      ?auto_13843 - HOIST
      ?auto_13863 - SURFACE
      ?auto_13838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13834 ?auto_13836 ) ( IS-CRATE ?auto_13833 ) ( not ( = ?auto_13837 ?auto_13836 ) ) ( HOIST-AT ?auto_13839 ?auto_13837 ) ( AVAILABLE ?auto_13839 ) ( SURFACE-AT ?auto_13833 ?auto_13837 ) ( ON ?auto_13833 ?auto_13835 ) ( CLEAR ?auto_13833 ) ( not ( = ?auto_13830 ?auto_13833 ) ) ( not ( = ?auto_13830 ?auto_13835 ) ) ( not ( = ?auto_13833 ?auto_13835 ) ) ( not ( = ?auto_13834 ?auto_13839 ) ) ( IS-CRATE ?auto_13830 ) ( not ( = ?auto_13864 ?auto_13836 ) ) ( HOIST-AT ?auto_13862 ?auto_13864 ) ( AVAILABLE ?auto_13862 ) ( SURFACE-AT ?auto_13830 ?auto_13864 ) ( ON ?auto_13830 ?auto_13852 ) ( CLEAR ?auto_13830 ) ( not ( = ?auto_13831 ?auto_13830 ) ) ( not ( = ?auto_13831 ?auto_13852 ) ) ( not ( = ?auto_13830 ?auto_13852 ) ) ( not ( = ?auto_13834 ?auto_13862 ) ) ( IS-CRATE ?auto_13831 ) ( not ( = ?auto_13851 ?auto_13836 ) ) ( HOIST-AT ?auto_13849 ?auto_13851 ) ( AVAILABLE ?auto_13849 ) ( SURFACE-AT ?auto_13831 ?auto_13851 ) ( ON ?auto_13831 ?auto_13860 ) ( CLEAR ?auto_13831 ) ( not ( = ?auto_13832 ?auto_13831 ) ) ( not ( = ?auto_13832 ?auto_13860 ) ) ( not ( = ?auto_13831 ?auto_13860 ) ) ( not ( = ?auto_13834 ?auto_13849 ) ) ( IS-CRATE ?auto_13832 ) ( not ( = ?auto_13861 ?auto_13836 ) ) ( HOIST-AT ?auto_13847 ?auto_13861 ) ( AVAILABLE ?auto_13847 ) ( SURFACE-AT ?auto_13832 ?auto_13861 ) ( ON ?auto_13832 ?auto_13844 ) ( CLEAR ?auto_13832 ) ( not ( = ?auto_13829 ?auto_13832 ) ) ( not ( = ?auto_13829 ?auto_13844 ) ) ( not ( = ?auto_13832 ?auto_13844 ) ) ( not ( = ?auto_13834 ?auto_13847 ) ) ( IS-CRATE ?auto_13829 ) ( not ( = ?auto_13841 ?auto_13836 ) ) ( HOIST-AT ?auto_13853 ?auto_13841 ) ( AVAILABLE ?auto_13853 ) ( SURFACE-AT ?auto_13829 ?auto_13841 ) ( ON ?auto_13829 ?auto_13845 ) ( CLEAR ?auto_13829 ) ( not ( = ?auto_13828 ?auto_13829 ) ) ( not ( = ?auto_13828 ?auto_13845 ) ) ( not ( = ?auto_13829 ?auto_13845 ) ) ( not ( = ?auto_13834 ?auto_13853 ) ) ( IS-CRATE ?auto_13828 ) ( not ( = ?auto_13857 ?auto_13836 ) ) ( HOIST-AT ?auto_13846 ?auto_13857 ) ( SURFACE-AT ?auto_13828 ?auto_13857 ) ( ON ?auto_13828 ?auto_13858 ) ( CLEAR ?auto_13828 ) ( not ( = ?auto_13827 ?auto_13828 ) ) ( not ( = ?auto_13827 ?auto_13858 ) ) ( not ( = ?auto_13828 ?auto_13858 ) ) ( not ( = ?auto_13834 ?auto_13846 ) ) ( IS-CRATE ?auto_13827 ) ( AVAILABLE ?auto_13846 ) ( SURFACE-AT ?auto_13827 ?auto_13857 ) ( ON ?auto_13827 ?auto_13850 ) ( CLEAR ?auto_13827 ) ( not ( = ?auto_13826 ?auto_13827 ) ) ( not ( = ?auto_13826 ?auto_13850 ) ) ( not ( = ?auto_13827 ?auto_13850 ) ) ( IS-CRATE ?auto_13826 ) ( not ( = ?auto_13855 ?auto_13836 ) ) ( HOIST-AT ?auto_13854 ?auto_13855 ) ( AVAILABLE ?auto_13854 ) ( SURFACE-AT ?auto_13826 ?auto_13855 ) ( ON ?auto_13826 ?auto_13859 ) ( CLEAR ?auto_13826 ) ( not ( = ?auto_13825 ?auto_13826 ) ) ( not ( = ?auto_13825 ?auto_13859 ) ) ( not ( = ?auto_13826 ?auto_13859 ) ) ( not ( = ?auto_13834 ?auto_13854 ) ) ( IS-CRATE ?auto_13825 ) ( not ( = ?auto_13848 ?auto_13836 ) ) ( HOIST-AT ?auto_13856 ?auto_13848 ) ( AVAILABLE ?auto_13856 ) ( SURFACE-AT ?auto_13825 ?auto_13848 ) ( ON ?auto_13825 ?auto_13842 ) ( CLEAR ?auto_13825 ) ( not ( = ?auto_13824 ?auto_13825 ) ) ( not ( = ?auto_13824 ?auto_13842 ) ) ( not ( = ?auto_13825 ?auto_13842 ) ) ( not ( = ?auto_13834 ?auto_13856 ) ) ( SURFACE-AT ?auto_13823 ?auto_13836 ) ( CLEAR ?auto_13823 ) ( IS-CRATE ?auto_13824 ) ( AVAILABLE ?auto_13834 ) ( not ( = ?auto_13840 ?auto_13836 ) ) ( HOIST-AT ?auto_13843 ?auto_13840 ) ( AVAILABLE ?auto_13843 ) ( SURFACE-AT ?auto_13824 ?auto_13840 ) ( ON ?auto_13824 ?auto_13863 ) ( CLEAR ?auto_13824 ) ( TRUCK-AT ?auto_13838 ?auto_13836 ) ( not ( = ?auto_13823 ?auto_13824 ) ) ( not ( = ?auto_13823 ?auto_13863 ) ) ( not ( = ?auto_13824 ?auto_13863 ) ) ( not ( = ?auto_13834 ?auto_13843 ) ) ( not ( = ?auto_13823 ?auto_13825 ) ) ( not ( = ?auto_13823 ?auto_13842 ) ) ( not ( = ?auto_13825 ?auto_13863 ) ) ( not ( = ?auto_13848 ?auto_13840 ) ) ( not ( = ?auto_13856 ?auto_13843 ) ) ( not ( = ?auto_13842 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13826 ) ) ( not ( = ?auto_13823 ?auto_13859 ) ) ( not ( = ?auto_13824 ?auto_13826 ) ) ( not ( = ?auto_13824 ?auto_13859 ) ) ( not ( = ?auto_13826 ?auto_13842 ) ) ( not ( = ?auto_13826 ?auto_13863 ) ) ( not ( = ?auto_13855 ?auto_13848 ) ) ( not ( = ?auto_13855 ?auto_13840 ) ) ( not ( = ?auto_13854 ?auto_13856 ) ) ( not ( = ?auto_13854 ?auto_13843 ) ) ( not ( = ?auto_13859 ?auto_13842 ) ) ( not ( = ?auto_13859 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13827 ) ) ( not ( = ?auto_13823 ?auto_13850 ) ) ( not ( = ?auto_13824 ?auto_13827 ) ) ( not ( = ?auto_13824 ?auto_13850 ) ) ( not ( = ?auto_13825 ?auto_13827 ) ) ( not ( = ?auto_13825 ?auto_13850 ) ) ( not ( = ?auto_13827 ?auto_13859 ) ) ( not ( = ?auto_13827 ?auto_13842 ) ) ( not ( = ?auto_13827 ?auto_13863 ) ) ( not ( = ?auto_13857 ?auto_13855 ) ) ( not ( = ?auto_13857 ?auto_13848 ) ) ( not ( = ?auto_13857 ?auto_13840 ) ) ( not ( = ?auto_13846 ?auto_13854 ) ) ( not ( = ?auto_13846 ?auto_13856 ) ) ( not ( = ?auto_13846 ?auto_13843 ) ) ( not ( = ?auto_13850 ?auto_13859 ) ) ( not ( = ?auto_13850 ?auto_13842 ) ) ( not ( = ?auto_13850 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13828 ) ) ( not ( = ?auto_13823 ?auto_13858 ) ) ( not ( = ?auto_13824 ?auto_13828 ) ) ( not ( = ?auto_13824 ?auto_13858 ) ) ( not ( = ?auto_13825 ?auto_13828 ) ) ( not ( = ?auto_13825 ?auto_13858 ) ) ( not ( = ?auto_13826 ?auto_13828 ) ) ( not ( = ?auto_13826 ?auto_13858 ) ) ( not ( = ?auto_13828 ?auto_13850 ) ) ( not ( = ?auto_13828 ?auto_13859 ) ) ( not ( = ?auto_13828 ?auto_13842 ) ) ( not ( = ?auto_13828 ?auto_13863 ) ) ( not ( = ?auto_13858 ?auto_13850 ) ) ( not ( = ?auto_13858 ?auto_13859 ) ) ( not ( = ?auto_13858 ?auto_13842 ) ) ( not ( = ?auto_13858 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13829 ) ) ( not ( = ?auto_13823 ?auto_13845 ) ) ( not ( = ?auto_13824 ?auto_13829 ) ) ( not ( = ?auto_13824 ?auto_13845 ) ) ( not ( = ?auto_13825 ?auto_13829 ) ) ( not ( = ?auto_13825 ?auto_13845 ) ) ( not ( = ?auto_13826 ?auto_13829 ) ) ( not ( = ?auto_13826 ?auto_13845 ) ) ( not ( = ?auto_13827 ?auto_13829 ) ) ( not ( = ?auto_13827 ?auto_13845 ) ) ( not ( = ?auto_13829 ?auto_13858 ) ) ( not ( = ?auto_13829 ?auto_13850 ) ) ( not ( = ?auto_13829 ?auto_13859 ) ) ( not ( = ?auto_13829 ?auto_13842 ) ) ( not ( = ?auto_13829 ?auto_13863 ) ) ( not ( = ?auto_13841 ?auto_13857 ) ) ( not ( = ?auto_13841 ?auto_13855 ) ) ( not ( = ?auto_13841 ?auto_13848 ) ) ( not ( = ?auto_13841 ?auto_13840 ) ) ( not ( = ?auto_13853 ?auto_13846 ) ) ( not ( = ?auto_13853 ?auto_13854 ) ) ( not ( = ?auto_13853 ?auto_13856 ) ) ( not ( = ?auto_13853 ?auto_13843 ) ) ( not ( = ?auto_13845 ?auto_13858 ) ) ( not ( = ?auto_13845 ?auto_13850 ) ) ( not ( = ?auto_13845 ?auto_13859 ) ) ( not ( = ?auto_13845 ?auto_13842 ) ) ( not ( = ?auto_13845 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13832 ) ) ( not ( = ?auto_13823 ?auto_13844 ) ) ( not ( = ?auto_13824 ?auto_13832 ) ) ( not ( = ?auto_13824 ?auto_13844 ) ) ( not ( = ?auto_13825 ?auto_13832 ) ) ( not ( = ?auto_13825 ?auto_13844 ) ) ( not ( = ?auto_13826 ?auto_13832 ) ) ( not ( = ?auto_13826 ?auto_13844 ) ) ( not ( = ?auto_13827 ?auto_13832 ) ) ( not ( = ?auto_13827 ?auto_13844 ) ) ( not ( = ?auto_13828 ?auto_13832 ) ) ( not ( = ?auto_13828 ?auto_13844 ) ) ( not ( = ?auto_13832 ?auto_13845 ) ) ( not ( = ?auto_13832 ?auto_13858 ) ) ( not ( = ?auto_13832 ?auto_13850 ) ) ( not ( = ?auto_13832 ?auto_13859 ) ) ( not ( = ?auto_13832 ?auto_13842 ) ) ( not ( = ?auto_13832 ?auto_13863 ) ) ( not ( = ?auto_13861 ?auto_13841 ) ) ( not ( = ?auto_13861 ?auto_13857 ) ) ( not ( = ?auto_13861 ?auto_13855 ) ) ( not ( = ?auto_13861 ?auto_13848 ) ) ( not ( = ?auto_13861 ?auto_13840 ) ) ( not ( = ?auto_13847 ?auto_13853 ) ) ( not ( = ?auto_13847 ?auto_13846 ) ) ( not ( = ?auto_13847 ?auto_13854 ) ) ( not ( = ?auto_13847 ?auto_13856 ) ) ( not ( = ?auto_13847 ?auto_13843 ) ) ( not ( = ?auto_13844 ?auto_13845 ) ) ( not ( = ?auto_13844 ?auto_13858 ) ) ( not ( = ?auto_13844 ?auto_13850 ) ) ( not ( = ?auto_13844 ?auto_13859 ) ) ( not ( = ?auto_13844 ?auto_13842 ) ) ( not ( = ?auto_13844 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13831 ) ) ( not ( = ?auto_13823 ?auto_13860 ) ) ( not ( = ?auto_13824 ?auto_13831 ) ) ( not ( = ?auto_13824 ?auto_13860 ) ) ( not ( = ?auto_13825 ?auto_13831 ) ) ( not ( = ?auto_13825 ?auto_13860 ) ) ( not ( = ?auto_13826 ?auto_13831 ) ) ( not ( = ?auto_13826 ?auto_13860 ) ) ( not ( = ?auto_13827 ?auto_13831 ) ) ( not ( = ?auto_13827 ?auto_13860 ) ) ( not ( = ?auto_13828 ?auto_13831 ) ) ( not ( = ?auto_13828 ?auto_13860 ) ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13829 ?auto_13860 ) ) ( not ( = ?auto_13831 ?auto_13844 ) ) ( not ( = ?auto_13831 ?auto_13845 ) ) ( not ( = ?auto_13831 ?auto_13858 ) ) ( not ( = ?auto_13831 ?auto_13850 ) ) ( not ( = ?auto_13831 ?auto_13859 ) ) ( not ( = ?auto_13831 ?auto_13842 ) ) ( not ( = ?auto_13831 ?auto_13863 ) ) ( not ( = ?auto_13851 ?auto_13861 ) ) ( not ( = ?auto_13851 ?auto_13841 ) ) ( not ( = ?auto_13851 ?auto_13857 ) ) ( not ( = ?auto_13851 ?auto_13855 ) ) ( not ( = ?auto_13851 ?auto_13848 ) ) ( not ( = ?auto_13851 ?auto_13840 ) ) ( not ( = ?auto_13849 ?auto_13847 ) ) ( not ( = ?auto_13849 ?auto_13853 ) ) ( not ( = ?auto_13849 ?auto_13846 ) ) ( not ( = ?auto_13849 ?auto_13854 ) ) ( not ( = ?auto_13849 ?auto_13856 ) ) ( not ( = ?auto_13849 ?auto_13843 ) ) ( not ( = ?auto_13860 ?auto_13844 ) ) ( not ( = ?auto_13860 ?auto_13845 ) ) ( not ( = ?auto_13860 ?auto_13858 ) ) ( not ( = ?auto_13860 ?auto_13850 ) ) ( not ( = ?auto_13860 ?auto_13859 ) ) ( not ( = ?auto_13860 ?auto_13842 ) ) ( not ( = ?auto_13860 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13830 ) ) ( not ( = ?auto_13823 ?auto_13852 ) ) ( not ( = ?auto_13824 ?auto_13830 ) ) ( not ( = ?auto_13824 ?auto_13852 ) ) ( not ( = ?auto_13825 ?auto_13830 ) ) ( not ( = ?auto_13825 ?auto_13852 ) ) ( not ( = ?auto_13826 ?auto_13830 ) ) ( not ( = ?auto_13826 ?auto_13852 ) ) ( not ( = ?auto_13827 ?auto_13830 ) ) ( not ( = ?auto_13827 ?auto_13852 ) ) ( not ( = ?auto_13828 ?auto_13830 ) ) ( not ( = ?auto_13828 ?auto_13852 ) ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13852 ) ) ( not ( = ?auto_13832 ?auto_13830 ) ) ( not ( = ?auto_13832 ?auto_13852 ) ) ( not ( = ?auto_13830 ?auto_13860 ) ) ( not ( = ?auto_13830 ?auto_13844 ) ) ( not ( = ?auto_13830 ?auto_13845 ) ) ( not ( = ?auto_13830 ?auto_13858 ) ) ( not ( = ?auto_13830 ?auto_13850 ) ) ( not ( = ?auto_13830 ?auto_13859 ) ) ( not ( = ?auto_13830 ?auto_13842 ) ) ( not ( = ?auto_13830 ?auto_13863 ) ) ( not ( = ?auto_13864 ?auto_13851 ) ) ( not ( = ?auto_13864 ?auto_13861 ) ) ( not ( = ?auto_13864 ?auto_13841 ) ) ( not ( = ?auto_13864 ?auto_13857 ) ) ( not ( = ?auto_13864 ?auto_13855 ) ) ( not ( = ?auto_13864 ?auto_13848 ) ) ( not ( = ?auto_13864 ?auto_13840 ) ) ( not ( = ?auto_13862 ?auto_13849 ) ) ( not ( = ?auto_13862 ?auto_13847 ) ) ( not ( = ?auto_13862 ?auto_13853 ) ) ( not ( = ?auto_13862 ?auto_13846 ) ) ( not ( = ?auto_13862 ?auto_13854 ) ) ( not ( = ?auto_13862 ?auto_13856 ) ) ( not ( = ?auto_13862 ?auto_13843 ) ) ( not ( = ?auto_13852 ?auto_13860 ) ) ( not ( = ?auto_13852 ?auto_13844 ) ) ( not ( = ?auto_13852 ?auto_13845 ) ) ( not ( = ?auto_13852 ?auto_13858 ) ) ( not ( = ?auto_13852 ?auto_13850 ) ) ( not ( = ?auto_13852 ?auto_13859 ) ) ( not ( = ?auto_13852 ?auto_13842 ) ) ( not ( = ?auto_13852 ?auto_13863 ) ) ( not ( = ?auto_13823 ?auto_13833 ) ) ( not ( = ?auto_13823 ?auto_13835 ) ) ( not ( = ?auto_13824 ?auto_13833 ) ) ( not ( = ?auto_13824 ?auto_13835 ) ) ( not ( = ?auto_13825 ?auto_13833 ) ) ( not ( = ?auto_13825 ?auto_13835 ) ) ( not ( = ?auto_13826 ?auto_13833 ) ) ( not ( = ?auto_13826 ?auto_13835 ) ) ( not ( = ?auto_13827 ?auto_13833 ) ) ( not ( = ?auto_13827 ?auto_13835 ) ) ( not ( = ?auto_13828 ?auto_13833 ) ) ( not ( = ?auto_13828 ?auto_13835 ) ) ( not ( = ?auto_13829 ?auto_13833 ) ) ( not ( = ?auto_13829 ?auto_13835 ) ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13835 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( not ( = ?auto_13833 ?auto_13852 ) ) ( not ( = ?auto_13833 ?auto_13860 ) ) ( not ( = ?auto_13833 ?auto_13844 ) ) ( not ( = ?auto_13833 ?auto_13845 ) ) ( not ( = ?auto_13833 ?auto_13858 ) ) ( not ( = ?auto_13833 ?auto_13850 ) ) ( not ( = ?auto_13833 ?auto_13859 ) ) ( not ( = ?auto_13833 ?auto_13842 ) ) ( not ( = ?auto_13833 ?auto_13863 ) ) ( not ( = ?auto_13837 ?auto_13864 ) ) ( not ( = ?auto_13837 ?auto_13851 ) ) ( not ( = ?auto_13837 ?auto_13861 ) ) ( not ( = ?auto_13837 ?auto_13841 ) ) ( not ( = ?auto_13837 ?auto_13857 ) ) ( not ( = ?auto_13837 ?auto_13855 ) ) ( not ( = ?auto_13837 ?auto_13848 ) ) ( not ( = ?auto_13837 ?auto_13840 ) ) ( not ( = ?auto_13839 ?auto_13862 ) ) ( not ( = ?auto_13839 ?auto_13849 ) ) ( not ( = ?auto_13839 ?auto_13847 ) ) ( not ( = ?auto_13839 ?auto_13853 ) ) ( not ( = ?auto_13839 ?auto_13846 ) ) ( not ( = ?auto_13839 ?auto_13854 ) ) ( not ( = ?auto_13839 ?auto_13856 ) ) ( not ( = ?auto_13839 ?auto_13843 ) ) ( not ( = ?auto_13835 ?auto_13852 ) ) ( not ( = ?auto_13835 ?auto_13860 ) ) ( not ( = ?auto_13835 ?auto_13844 ) ) ( not ( = ?auto_13835 ?auto_13845 ) ) ( not ( = ?auto_13835 ?auto_13858 ) ) ( not ( = ?auto_13835 ?auto_13850 ) ) ( not ( = ?auto_13835 ?auto_13859 ) ) ( not ( = ?auto_13835 ?auto_13842 ) ) ( not ( = ?auto_13835 ?auto_13863 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13823 ?auto_13824 ?auto_13825 ?auto_13826 ?auto_13827 ?auto_13828 ?auto_13829 ?auto_13832 ?auto_13831 ?auto_13830 )
      ( MAKE-1CRATE ?auto_13830 ?auto_13833 )
      ( MAKE-10CRATE-VERIFY ?auto_13823 ?auto_13824 ?auto_13825 ?auto_13826 ?auto_13827 ?auto_13828 ?auto_13829 ?auto_13832 ?auto_13831 ?auto_13830 ?auto_13833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13867 - SURFACE
      ?auto_13868 - SURFACE
    )
    :vars
    (
      ?auto_13869 - HOIST
      ?auto_13870 - PLACE
      ?auto_13872 - PLACE
      ?auto_13873 - HOIST
      ?auto_13874 - SURFACE
      ?auto_13871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13869 ?auto_13870 ) ( SURFACE-AT ?auto_13867 ?auto_13870 ) ( CLEAR ?auto_13867 ) ( IS-CRATE ?auto_13868 ) ( AVAILABLE ?auto_13869 ) ( not ( = ?auto_13872 ?auto_13870 ) ) ( HOIST-AT ?auto_13873 ?auto_13872 ) ( AVAILABLE ?auto_13873 ) ( SURFACE-AT ?auto_13868 ?auto_13872 ) ( ON ?auto_13868 ?auto_13874 ) ( CLEAR ?auto_13868 ) ( TRUCK-AT ?auto_13871 ?auto_13870 ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13874 ) ) ( not ( = ?auto_13868 ?auto_13874 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13871 ?auto_13870 ?auto_13872 )
      ( !LIFT ?auto_13873 ?auto_13868 ?auto_13874 ?auto_13872 )
      ( !LOAD ?auto_13873 ?auto_13868 ?auto_13871 ?auto_13872 )
      ( !DRIVE ?auto_13871 ?auto_13872 ?auto_13870 )
      ( !UNLOAD ?auto_13869 ?auto_13868 ?auto_13871 ?auto_13870 )
      ( !DROP ?auto_13869 ?auto_13868 ?auto_13867 ?auto_13870 )
      ( MAKE-1CRATE-VERIFY ?auto_13867 ?auto_13868 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13887 - SURFACE
      ?auto_13888 - SURFACE
      ?auto_13889 - SURFACE
      ?auto_13890 - SURFACE
      ?auto_13891 - SURFACE
      ?auto_13892 - SURFACE
      ?auto_13893 - SURFACE
      ?auto_13896 - SURFACE
      ?auto_13895 - SURFACE
      ?auto_13894 - SURFACE
      ?auto_13897 - SURFACE
      ?auto_13898 - SURFACE
    )
    :vars
    (
      ?auto_13900 - HOIST
      ?auto_13904 - PLACE
      ?auto_13899 - PLACE
      ?auto_13903 - HOIST
      ?auto_13901 - SURFACE
      ?auto_13909 - PLACE
      ?auto_13907 - HOIST
      ?auto_13920 - SURFACE
      ?auto_13914 - PLACE
      ?auto_13930 - HOIST
      ?auto_13915 - SURFACE
      ?auto_13926 - PLACE
      ?auto_13908 - HOIST
      ?auto_13917 - SURFACE
      ?auto_13919 - PLACE
      ?auto_13929 - HOIST
      ?auto_13928 - SURFACE
      ?auto_13910 - PLACE
      ?auto_13912 - HOIST
      ?auto_13921 - SURFACE
      ?auto_13927 - PLACE
      ?auto_13911 - HOIST
      ?auto_13923 - SURFACE
      ?auto_13916 - SURFACE
      ?auto_13913 - PLACE
      ?auto_13905 - HOIST
      ?auto_13918 - SURFACE
      ?auto_13925 - SURFACE
      ?auto_13922 - PLACE
      ?auto_13924 - HOIST
      ?auto_13906 - SURFACE
      ?auto_13902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13900 ?auto_13904 ) ( IS-CRATE ?auto_13898 ) ( not ( = ?auto_13899 ?auto_13904 ) ) ( HOIST-AT ?auto_13903 ?auto_13899 ) ( SURFACE-AT ?auto_13898 ?auto_13899 ) ( ON ?auto_13898 ?auto_13901 ) ( CLEAR ?auto_13898 ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13897 ?auto_13901 ) ) ( not ( = ?auto_13898 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13903 ) ) ( IS-CRATE ?auto_13897 ) ( not ( = ?auto_13909 ?auto_13904 ) ) ( HOIST-AT ?auto_13907 ?auto_13909 ) ( AVAILABLE ?auto_13907 ) ( SURFACE-AT ?auto_13897 ?auto_13909 ) ( ON ?auto_13897 ?auto_13920 ) ( CLEAR ?auto_13897 ) ( not ( = ?auto_13894 ?auto_13897 ) ) ( not ( = ?auto_13894 ?auto_13920 ) ) ( not ( = ?auto_13897 ?auto_13920 ) ) ( not ( = ?auto_13900 ?auto_13907 ) ) ( IS-CRATE ?auto_13894 ) ( not ( = ?auto_13914 ?auto_13904 ) ) ( HOIST-AT ?auto_13930 ?auto_13914 ) ( AVAILABLE ?auto_13930 ) ( SURFACE-AT ?auto_13894 ?auto_13914 ) ( ON ?auto_13894 ?auto_13915 ) ( CLEAR ?auto_13894 ) ( not ( = ?auto_13895 ?auto_13894 ) ) ( not ( = ?auto_13895 ?auto_13915 ) ) ( not ( = ?auto_13894 ?auto_13915 ) ) ( not ( = ?auto_13900 ?auto_13930 ) ) ( IS-CRATE ?auto_13895 ) ( not ( = ?auto_13926 ?auto_13904 ) ) ( HOIST-AT ?auto_13908 ?auto_13926 ) ( AVAILABLE ?auto_13908 ) ( SURFACE-AT ?auto_13895 ?auto_13926 ) ( ON ?auto_13895 ?auto_13917 ) ( CLEAR ?auto_13895 ) ( not ( = ?auto_13896 ?auto_13895 ) ) ( not ( = ?auto_13896 ?auto_13917 ) ) ( not ( = ?auto_13895 ?auto_13917 ) ) ( not ( = ?auto_13900 ?auto_13908 ) ) ( IS-CRATE ?auto_13896 ) ( not ( = ?auto_13919 ?auto_13904 ) ) ( HOIST-AT ?auto_13929 ?auto_13919 ) ( AVAILABLE ?auto_13929 ) ( SURFACE-AT ?auto_13896 ?auto_13919 ) ( ON ?auto_13896 ?auto_13928 ) ( CLEAR ?auto_13896 ) ( not ( = ?auto_13893 ?auto_13896 ) ) ( not ( = ?auto_13893 ?auto_13928 ) ) ( not ( = ?auto_13896 ?auto_13928 ) ) ( not ( = ?auto_13900 ?auto_13929 ) ) ( IS-CRATE ?auto_13893 ) ( not ( = ?auto_13910 ?auto_13904 ) ) ( HOIST-AT ?auto_13912 ?auto_13910 ) ( AVAILABLE ?auto_13912 ) ( SURFACE-AT ?auto_13893 ?auto_13910 ) ( ON ?auto_13893 ?auto_13921 ) ( CLEAR ?auto_13893 ) ( not ( = ?auto_13892 ?auto_13893 ) ) ( not ( = ?auto_13892 ?auto_13921 ) ) ( not ( = ?auto_13893 ?auto_13921 ) ) ( not ( = ?auto_13900 ?auto_13912 ) ) ( IS-CRATE ?auto_13892 ) ( not ( = ?auto_13927 ?auto_13904 ) ) ( HOIST-AT ?auto_13911 ?auto_13927 ) ( SURFACE-AT ?auto_13892 ?auto_13927 ) ( ON ?auto_13892 ?auto_13923 ) ( CLEAR ?auto_13892 ) ( not ( = ?auto_13891 ?auto_13892 ) ) ( not ( = ?auto_13891 ?auto_13923 ) ) ( not ( = ?auto_13892 ?auto_13923 ) ) ( not ( = ?auto_13900 ?auto_13911 ) ) ( IS-CRATE ?auto_13891 ) ( AVAILABLE ?auto_13911 ) ( SURFACE-AT ?auto_13891 ?auto_13927 ) ( ON ?auto_13891 ?auto_13916 ) ( CLEAR ?auto_13891 ) ( not ( = ?auto_13890 ?auto_13891 ) ) ( not ( = ?auto_13890 ?auto_13916 ) ) ( not ( = ?auto_13891 ?auto_13916 ) ) ( IS-CRATE ?auto_13890 ) ( not ( = ?auto_13913 ?auto_13904 ) ) ( HOIST-AT ?auto_13905 ?auto_13913 ) ( AVAILABLE ?auto_13905 ) ( SURFACE-AT ?auto_13890 ?auto_13913 ) ( ON ?auto_13890 ?auto_13918 ) ( CLEAR ?auto_13890 ) ( not ( = ?auto_13889 ?auto_13890 ) ) ( not ( = ?auto_13889 ?auto_13918 ) ) ( not ( = ?auto_13890 ?auto_13918 ) ) ( not ( = ?auto_13900 ?auto_13905 ) ) ( IS-CRATE ?auto_13889 ) ( AVAILABLE ?auto_13903 ) ( SURFACE-AT ?auto_13889 ?auto_13899 ) ( ON ?auto_13889 ?auto_13925 ) ( CLEAR ?auto_13889 ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( not ( = ?auto_13888 ?auto_13925 ) ) ( not ( = ?auto_13889 ?auto_13925 ) ) ( SURFACE-AT ?auto_13887 ?auto_13904 ) ( CLEAR ?auto_13887 ) ( IS-CRATE ?auto_13888 ) ( AVAILABLE ?auto_13900 ) ( not ( = ?auto_13922 ?auto_13904 ) ) ( HOIST-AT ?auto_13924 ?auto_13922 ) ( AVAILABLE ?auto_13924 ) ( SURFACE-AT ?auto_13888 ?auto_13922 ) ( ON ?auto_13888 ?auto_13906 ) ( CLEAR ?auto_13888 ) ( TRUCK-AT ?auto_13902 ?auto_13904 ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13906 ) ) ( not ( = ?auto_13888 ?auto_13906 ) ) ( not ( = ?auto_13900 ?auto_13924 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13925 ) ) ( not ( = ?auto_13889 ?auto_13906 ) ) ( not ( = ?auto_13899 ?auto_13922 ) ) ( not ( = ?auto_13903 ?auto_13924 ) ) ( not ( = ?auto_13925 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13890 ) ) ( not ( = ?auto_13887 ?auto_13918 ) ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( not ( = ?auto_13888 ?auto_13918 ) ) ( not ( = ?auto_13890 ?auto_13925 ) ) ( not ( = ?auto_13890 ?auto_13906 ) ) ( not ( = ?auto_13913 ?auto_13899 ) ) ( not ( = ?auto_13913 ?auto_13922 ) ) ( not ( = ?auto_13905 ?auto_13903 ) ) ( not ( = ?auto_13905 ?auto_13924 ) ) ( not ( = ?auto_13918 ?auto_13925 ) ) ( not ( = ?auto_13918 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13891 ) ) ( not ( = ?auto_13887 ?auto_13916 ) ) ( not ( = ?auto_13888 ?auto_13891 ) ) ( not ( = ?auto_13888 ?auto_13916 ) ) ( not ( = ?auto_13889 ?auto_13891 ) ) ( not ( = ?auto_13889 ?auto_13916 ) ) ( not ( = ?auto_13891 ?auto_13918 ) ) ( not ( = ?auto_13891 ?auto_13925 ) ) ( not ( = ?auto_13891 ?auto_13906 ) ) ( not ( = ?auto_13927 ?auto_13913 ) ) ( not ( = ?auto_13927 ?auto_13899 ) ) ( not ( = ?auto_13927 ?auto_13922 ) ) ( not ( = ?auto_13911 ?auto_13905 ) ) ( not ( = ?auto_13911 ?auto_13903 ) ) ( not ( = ?auto_13911 ?auto_13924 ) ) ( not ( = ?auto_13916 ?auto_13918 ) ) ( not ( = ?auto_13916 ?auto_13925 ) ) ( not ( = ?auto_13916 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13892 ) ) ( not ( = ?auto_13887 ?auto_13923 ) ) ( not ( = ?auto_13888 ?auto_13892 ) ) ( not ( = ?auto_13888 ?auto_13923 ) ) ( not ( = ?auto_13889 ?auto_13892 ) ) ( not ( = ?auto_13889 ?auto_13923 ) ) ( not ( = ?auto_13890 ?auto_13892 ) ) ( not ( = ?auto_13890 ?auto_13923 ) ) ( not ( = ?auto_13892 ?auto_13916 ) ) ( not ( = ?auto_13892 ?auto_13918 ) ) ( not ( = ?auto_13892 ?auto_13925 ) ) ( not ( = ?auto_13892 ?auto_13906 ) ) ( not ( = ?auto_13923 ?auto_13916 ) ) ( not ( = ?auto_13923 ?auto_13918 ) ) ( not ( = ?auto_13923 ?auto_13925 ) ) ( not ( = ?auto_13923 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13893 ) ) ( not ( = ?auto_13887 ?auto_13921 ) ) ( not ( = ?auto_13888 ?auto_13893 ) ) ( not ( = ?auto_13888 ?auto_13921 ) ) ( not ( = ?auto_13889 ?auto_13893 ) ) ( not ( = ?auto_13889 ?auto_13921 ) ) ( not ( = ?auto_13890 ?auto_13893 ) ) ( not ( = ?auto_13890 ?auto_13921 ) ) ( not ( = ?auto_13891 ?auto_13893 ) ) ( not ( = ?auto_13891 ?auto_13921 ) ) ( not ( = ?auto_13893 ?auto_13923 ) ) ( not ( = ?auto_13893 ?auto_13916 ) ) ( not ( = ?auto_13893 ?auto_13918 ) ) ( not ( = ?auto_13893 ?auto_13925 ) ) ( not ( = ?auto_13893 ?auto_13906 ) ) ( not ( = ?auto_13910 ?auto_13927 ) ) ( not ( = ?auto_13910 ?auto_13913 ) ) ( not ( = ?auto_13910 ?auto_13899 ) ) ( not ( = ?auto_13910 ?auto_13922 ) ) ( not ( = ?auto_13912 ?auto_13911 ) ) ( not ( = ?auto_13912 ?auto_13905 ) ) ( not ( = ?auto_13912 ?auto_13903 ) ) ( not ( = ?auto_13912 ?auto_13924 ) ) ( not ( = ?auto_13921 ?auto_13923 ) ) ( not ( = ?auto_13921 ?auto_13916 ) ) ( not ( = ?auto_13921 ?auto_13918 ) ) ( not ( = ?auto_13921 ?auto_13925 ) ) ( not ( = ?auto_13921 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13896 ) ) ( not ( = ?auto_13887 ?auto_13928 ) ) ( not ( = ?auto_13888 ?auto_13896 ) ) ( not ( = ?auto_13888 ?auto_13928 ) ) ( not ( = ?auto_13889 ?auto_13896 ) ) ( not ( = ?auto_13889 ?auto_13928 ) ) ( not ( = ?auto_13890 ?auto_13896 ) ) ( not ( = ?auto_13890 ?auto_13928 ) ) ( not ( = ?auto_13891 ?auto_13896 ) ) ( not ( = ?auto_13891 ?auto_13928 ) ) ( not ( = ?auto_13892 ?auto_13896 ) ) ( not ( = ?auto_13892 ?auto_13928 ) ) ( not ( = ?auto_13896 ?auto_13921 ) ) ( not ( = ?auto_13896 ?auto_13923 ) ) ( not ( = ?auto_13896 ?auto_13916 ) ) ( not ( = ?auto_13896 ?auto_13918 ) ) ( not ( = ?auto_13896 ?auto_13925 ) ) ( not ( = ?auto_13896 ?auto_13906 ) ) ( not ( = ?auto_13919 ?auto_13910 ) ) ( not ( = ?auto_13919 ?auto_13927 ) ) ( not ( = ?auto_13919 ?auto_13913 ) ) ( not ( = ?auto_13919 ?auto_13899 ) ) ( not ( = ?auto_13919 ?auto_13922 ) ) ( not ( = ?auto_13929 ?auto_13912 ) ) ( not ( = ?auto_13929 ?auto_13911 ) ) ( not ( = ?auto_13929 ?auto_13905 ) ) ( not ( = ?auto_13929 ?auto_13903 ) ) ( not ( = ?auto_13929 ?auto_13924 ) ) ( not ( = ?auto_13928 ?auto_13921 ) ) ( not ( = ?auto_13928 ?auto_13923 ) ) ( not ( = ?auto_13928 ?auto_13916 ) ) ( not ( = ?auto_13928 ?auto_13918 ) ) ( not ( = ?auto_13928 ?auto_13925 ) ) ( not ( = ?auto_13928 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13895 ) ) ( not ( = ?auto_13887 ?auto_13917 ) ) ( not ( = ?auto_13888 ?auto_13895 ) ) ( not ( = ?auto_13888 ?auto_13917 ) ) ( not ( = ?auto_13889 ?auto_13895 ) ) ( not ( = ?auto_13889 ?auto_13917 ) ) ( not ( = ?auto_13890 ?auto_13895 ) ) ( not ( = ?auto_13890 ?auto_13917 ) ) ( not ( = ?auto_13891 ?auto_13895 ) ) ( not ( = ?auto_13891 ?auto_13917 ) ) ( not ( = ?auto_13892 ?auto_13895 ) ) ( not ( = ?auto_13892 ?auto_13917 ) ) ( not ( = ?auto_13893 ?auto_13895 ) ) ( not ( = ?auto_13893 ?auto_13917 ) ) ( not ( = ?auto_13895 ?auto_13928 ) ) ( not ( = ?auto_13895 ?auto_13921 ) ) ( not ( = ?auto_13895 ?auto_13923 ) ) ( not ( = ?auto_13895 ?auto_13916 ) ) ( not ( = ?auto_13895 ?auto_13918 ) ) ( not ( = ?auto_13895 ?auto_13925 ) ) ( not ( = ?auto_13895 ?auto_13906 ) ) ( not ( = ?auto_13926 ?auto_13919 ) ) ( not ( = ?auto_13926 ?auto_13910 ) ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13913 ) ) ( not ( = ?auto_13926 ?auto_13899 ) ) ( not ( = ?auto_13926 ?auto_13922 ) ) ( not ( = ?auto_13908 ?auto_13929 ) ) ( not ( = ?auto_13908 ?auto_13912 ) ) ( not ( = ?auto_13908 ?auto_13911 ) ) ( not ( = ?auto_13908 ?auto_13905 ) ) ( not ( = ?auto_13908 ?auto_13903 ) ) ( not ( = ?auto_13908 ?auto_13924 ) ) ( not ( = ?auto_13917 ?auto_13928 ) ) ( not ( = ?auto_13917 ?auto_13921 ) ) ( not ( = ?auto_13917 ?auto_13923 ) ) ( not ( = ?auto_13917 ?auto_13916 ) ) ( not ( = ?auto_13917 ?auto_13918 ) ) ( not ( = ?auto_13917 ?auto_13925 ) ) ( not ( = ?auto_13917 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13894 ) ) ( not ( = ?auto_13887 ?auto_13915 ) ) ( not ( = ?auto_13888 ?auto_13894 ) ) ( not ( = ?auto_13888 ?auto_13915 ) ) ( not ( = ?auto_13889 ?auto_13894 ) ) ( not ( = ?auto_13889 ?auto_13915 ) ) ( not ( = ?auto_13890 ?auto_13894 ) ) ( not ( = ?auto_13890 ?auto_13915 ) ) ( not ( = ?auto_13891 ?auto_13894 ) ) ( not ( = ?auto_13891 ?auto_13915 ) ) ( not ( = ?auto_13892 ?auto_13894 ) ) ( not ( = ?auto_13892 ?auto_13915 ) ) ( not ( = ?auto_13893 ?auto_13894 ) ) ( not ( = ?auto_13893 ?auto_13915 ) ) ( not ( = ?auto_13896 ?auto_13894 ) ) ( not ( = ?auto_13896 ?auto_13915 ) ) ( not ( = ?auto_13894 ?auto_13917 ) ) ( not ( = ?auto_13894 ?auto_13928 ) ) ( not ( = ?auto_13894 ?auto_13921 ) ) ( not ( = ?auto_13894 ?auto_13923 ) ) ( not ( = ?auto_13894 ?auto_13916 ) ) ( not ( = ?auto_13894 ?auto_13918 ) ) ( not ( = ?auto_13894 ?auto_13925 ) ) ( not ( = ?auto_13894 ?auto_13906 ) ) ( not ( = ?auto_13914 ?auto_13926 ) ) ( not ( = ?auto_13914 ?auto_13919 ) ) ( not ( = ?auto_13914 ?auto_13910 ) ) ( not ( = ?auto_13914 ?auto_13927 ) ) ( not ( = ?auto_13914 ?auto_13913 ) ) ( not ( = ?auto_13914 ?auto_13899 ) ) ( not ( = ?auto_13914 ?auto_13922 ) ) ( not ( = ?auto_13930 ?auto_13908 ) ) ( not ( = ?auto_13930 ?auto_13929 ) ) ( not ( = ?auto_13930 ?auto_13912 ) ) ( not ( = ?auto_13930 ?auto_13911 ) ) ( not ( = ?auto_13930 ?auto_13905 ) ) ( not ( = ?auto_13930 ?auto_13903 ) ) ( not ( = ?auto_13930 ?auto_13924 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) ( not ( = ?auto_13915 ?auto_13928 ) ) ( not ( = ?auto_13915 ?auto_13921 ) ) ( not ( = ?auto_13915 ?auto_13923 ) ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13918 ) ) ( not ( = ?auto_13915 ?auto_13925 ) ) ( not ( = ?auto_13915 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13897 ) ) ( not ( = ?auto_13887 ?auto_13920 ) ) ( not ( = ?auto_13888 ?auto_13897 ) ) ( not ( = ?auto_13888 ?auto_13920 ) ) ( not ( = ?auto_13889 ?auto_13897 ) ) ( not ( = ?auto_13889 ?auto_13920 ) ) ( not ( = ?auto_13890 ?auto_13897 ) ) ( not ( = ?auto_13890 ?auto_13920 ) ) ( not ( = ?auto_13891 ?auto_13897 ) ) ( not ( = ?auto_13891 ?auto_13920 ) ) ( not ( = ?auto_13892 ?auto_13897 ) ) ( not ( = ?auto_13892 ?auto_13920 ) ) ( not ( = ?auto_13893 ?auto_13897 ) ) ( not ( = ?auto_13893 ?auto_13920 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13920 ) ) ( not ( = ?auto_13895 ?auto_13897 ) ) ( not ( = ?auto_13895 ?auto_13920 ) ) ( not ( = ?auto_13897 ?auto_13915 ) ) ( not ( = ?auto_13897 ?auto_13917 ) ) ( not ( = ?auto_13897 ?auto_13928 ) ) ( not ( = ?auto_13897 ?auto_13921 ) ) ( not ( = ?auto_13897 ?auto_13923 ) ) ( not ( = ?auto_13897 ?auto_13916 ) ) ( not ( = ?auto_13897 ?auto_13918 ) ) ( not ( = ?auto_13897 ?auto_13925 ) ) ( not ( = ?auto_13897 ?auto_13906 ) ) ( not ( = ?auto_13909 ?auto_13914 ) ) ( not ( = ?auto_13909 ?auto_13926 ) ) ( not ( = ?auto_13909 ?auto_13919 ) ) ( not ( = ?auto_13909 ?auto_13910 ) ) ( not ( = ?auto_13909 ?auto_13927 ) ) ( not ( = ?auto_13909 ?auto_13913 ) ) ( not ( = ?auto_13909 ?auto_13899 ) ) ( not ( = ?auto_13909 ?auto_13922 ) ) ( not ( = ?auto_13907 ?auto_13930 ) ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( not ( = ?auto_13907 ?auto_13929 ) ) ( not ( = ?auto_13907 ?auto_13912 ) ) ( not ( = ?auto_13907 ?auto_13911 ) ) ( not ( = ?auto_13907 ?auto_13905 ) ) ( not ( = ?auto_13907 ?auto_13903 ) ) ( not ( = ?auto_13907 ?auto_13924 ) ) ( not ( = ?auto_13920 ?auto_13915 ) ) ( not ( = ?auto_13920 ?auto_13917 ) ) ( not ( = ?auto_13920 ?auto_13928 ) ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( not ( = ?auto_13920 ?auto_13923 ) ) ( not ( = ?auto_13920 ?auto_13916 ) ) ( not ( = ?auto_13920 ?auto_13918 ) ) ( not ( = ?auto_13920 ?auto_13925 ) ) ( not ( = ?auto_13920 ?auto_13906 ) ) ( not ( = ?auto_13887 ?auto_13898 ) ) ( not ( = ?auto_13887 ?auto_13901 ) ) ( not ( = ?auto_13888 ?auto_13898 ) ) ( not ( = ?auto_13888 ?auto_13901 ) ) ( not ( = ?auto_13889 ?auto_13898 ) ) ( not ( = ?auto_13889 ?auto_13901 ) ) ( not ( = ?auto_13890 ?auto_13898 ) ) ( not ( = ?auto_13890 ?auto_13901 ) ) ( not ( = ?auto_13891 ?auto_13898 ) ) ( not ( = ?auto_13891 ?auto_13901 ) ) ( not ( = ?auto_13892 ?auto_13898 ) ) ( not ( = ?auto_13892 ?auto_13901 ) ) ( not ( = ?auto_13893 ?auto_13898 ) ) ( not ( = ?auto_13893 ?auto_13901 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13901 ) ) ( not ( = ?auto_13895 ?auto_13898 ) ) ( not ( = ?auto_13895 ?auto_13901 ) ) ( not ( = ?auto_13894 ?auto_13898 ) ) ( not ( = ?auto_13894 ?auto_13901 ) ) ( not ( = ?auto_13898 ?auto_13920 ) ) ( not ( = ?auto_13898 ?auto_13915 ) ) ( not ( = ?auto_13898 ?auto_13917 ) ) ( not ( = ?auto_13898 ?auto_13928 ) ) ( not ( = ?auto_13898 ?auto_13921 ) ) ( not ( = ?auto_13898 ?auto_13923 ) ) ( not ( = ?auto_13898 ?auto_13916 ) ) ( not ( = ?auto_13898 ?auto_13918 ) ) ( not ( = ?auto_13898 ?auto_13925 ) ) ( not ( = ?auto_13898 ?auto_13906 ) ) ( not ( = ?auto_13901 ?auto_13920 ) ) ( not ( = ?auto_13901 ?auto_13915 ) ) ( not ( = ?auto_13901 ?auto_13917 ) ) ( not ( = ?auto_13901 ?auto_13928 ) ) ( not ( = ?auto_13901 ?auto_13921 ) ) ( not ( = ?auto_13901 ?auto_13923 ) ) ( not ( = ?auto_13901 ?auto_13916 ) ) ( not ( = ?auto_13901 ?auto_13918 ) ) ( not ( = ?auto_13901 ?auto_13925 ) ) ( not ( = ?auto_13901 ?auto_13906 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13890 ?auto_13891 ?auto_13892 ?auto_13893 ?auto_13896 ?auto_13895 ?auto_13894 ?auto_13897 )
      ( MAKE-1CRATE ?auto_13897 ?auto_13898 )
      ( MAKE-11CRATE-VERIFY ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13890 ?auto_13891 ?auto_13892 ?auto_13893 ?auto_13896 ?auto_13895 ?auto_13894 ?auto_13897 ?auto_13898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13933 - SURFACE
      ?auto_13934 - SURFACE
    )
    :vars
    (
      ?auto_13935 - HOIST
      ?auto_13936 - PLACE
      ?auto_13938 - PLACE
      ?auto_13939 - HOIST
      ?auto_13940 - SURFACE
      ?auto_13937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13935 ?auto_13936 ) ( SURFACE-AT ?auto_13933 ?auto_13936 ) ( CLEAR ?auto_13933 ) ( IS-CRATE ?auto_13934 ) ( AVAILABLE ?auto_13935 ) ( not ( = ?auto_13938 ?auto_13936 ) ) ( HOIST-AT ?auto_13939 ?auto_13938 ) ( AVAILABLE ?auto_13939 ) ( SURFACE-AT ?auto_13934 ?auto_13938 ) ( ON ?auto_13934 ?auto_13940 ) ( CLEAR ?auto_13934 ) ( TRUCK-AT ?auto_13937 ?auto_13936 ) ( not ( = ?auto_13933 ?auto_13934 ) ) ( not ( = ?auto_13933 ?auto_13940 ) ) ( not ( = ?auto_13934 ?auto_13940 ) ) ( not ( = ?auto_13935 ?auto_13939 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13937 ?auto_13936 ?auto_13938 )
      ( !LIFT ?auto_13939 ?auto_13934 ?auto_13940 ?auto_13938 )
      ( !LOAD ?auto_13939 ?auto_13934 ?auto_13937 ?auto_13938 )
      ( !DRIVE ?auto_13937 ?auto_13938 ?auto_13936 )
      ( !UNLOAD ?auto_13935 ?auto_13934 ?auto_13937 ?auto_13936 )
      ( !DROP ?auto_13935 ?auto_13934 ?auto_13933 ?auto_13936 )
      ( MAKE-1CRATE-VERIFY ?auto_13933 ?auto_13934 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13954 - SURFACE
      ?auto_13955 - SURFACE
      ?auto_13956 - SURFACE
      ?auto_13957 - SURFACE
      ?auto_13958 - SURFACE
      ?auto_13959 - SURFACE
      ?auto_13960 - SURFACE
      ?auto_13963 - SURFACE
      ?auto_13962 - SURFACE
      ?auto_13961 - SURFACE
      ?auto_13964 - SURFACE
      ?auto_13965 - SURFACE
      ?auto_13966 - SURFACE
    )
    :vars
    (
      ?auto_13971 - HOIST
      ?auto_13969 - PLACE
      ?auto_13972 - PLACE
      ?auto_13967 - HOIST
      ?auto_13968 - SURFACE
      ?auto_13985 - PLACE
      ?auto_13994 - HOIST
      ?auto_13997 - SURFACE
      ?auto_13996 - PLACE
      ?auto_13975 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13987 - PLACE
      ?auto_13978 - HOIST
      ?auto_13986 - SURFACE
      ?auto_13981 - PLACE
      ?auto_13990 - HOIST
      ?auto_13980 - SURFACE
      ?auto_13988 - PLACE
      ?auto_13974 - HOIST
      ?auto_13976 - SURFACE
      ?auto_13998 - PLACE
      ?auto_13979 - HOIST
      ?auto_13973 - SURFACE
      ?auto_13992 - PLACE
      ?auto_13982 - HOIST
      ?auto_13989 - SURFACE
      ?auto_13983 - SURFACE
      ?auto_13999 - PLACE
      ?auto_13991 - HOIST
      ?auto_13995 - SURFACE
      ?auto_13984 - SURFACE
      ?auto_13993 - SURFACE
      ?auto_13970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13971 ?auto_13969 ) ( IS-CRATE ?auto_13966 ) ( not ( = ?auto_13972 ?auto_13969 ) ) ( HOIST-AT ?auto_13967 ?auto_13972 ) ( SURFACE-AT ?auto_13966 ?auto_13972 ) ( ON ?auto_13966 ?auto_13968 ) ( CLEAR ?auto_13966 ) ( not ( = ?auto_13965 ?auto_13966 ) ) ( not ( = ?auto_13965 ?auto_13968 ) ) ( not ( = ?auto_13966 ?auto_13968 ) ) ( not ( = ?auto_13971 ?auto_13967 ) ) ( IS-CRATE ?auto_13965 ) ( not ( = ?auto_13985 ?auto_13969 ) ) ( HOIST-AT ?auto_13994 ?auto_13985 ) ( SURFACE-AT ?auto_13965 ?auto_13985 ) ( ON ?auto_13965 ?auto_13997 ) ( CLEAR ?auto_13965 ) ( not ( = ?auto_13964 ?auto_13965 ) ) ( not ( = ?auto_13964 ?auto_13997 ) ) ( not ( = ?auto_13965 ?auto_13997 ) ) ( not ( = ?auto_13971 ?auto_13994 ) ) ( IS-CRATE ?auto_13964 ) ( not ( = ?auto_13996 ?auto_13969 ) ) ( HOIST-AT ?auto_13975 ?auto_13996 ) ( AVAILABLE ?auto_13975 ) ( SURFACE-AT ?auto_13964 ?auto_13996 ) ( ON ?auto_13964 ?auto_13977 ) ( CLEAR ?auto_13964 ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13977 ) ) ( not ( = ?auto_13964 ?auto_13977 ) ) ( not ( = ?auto_13971 ?auto_13975 ) ) ( IS-CRATE ?auto_13961 ) ( not ( = ?auto_13987 ?auto_13969 ) ) ( HOIST-AT ?auto_13978 ?auto_13987 ) ( AVAILABLE ?auto_13978 ) ( SURFACE-AT ?auto_13961 ?auto_13987 ) ( ON ?auto_13961 ?auto_13986 ) ( CLEAR ?auto_13961 ) ( not ( = ?auto_13962 ?auto_13961 ) ) ( not ( = ?auto_13962 ?auto_13986 ) ) ( not ( = ?auto_13961 ?auto_13986 ) ) ( not ( = ?auto_13971 ?auto_13978 ) ) ( IS-CRATE ?auto_13962 ) ( not ( = ?auto_13981 ?auto_13969 ) ) ( HOIST-AT ?auto_13990 ?auto_13981 ) ( AVAILABLE ?auto_13990 ) ( SURFACE-AT ?auto_13962 ?auto_13981 ) ( ON ?auto_13962 ?auto_13980 ) ( CLEAR ?auto_13962 ) ( not ( = ?auto_13963 ?auto_13962 ) ) ( not ( = ?auto_13963 ?auto_13980 ) ) ( not ( = ?auto_13962 ?auto_13980 ) ) ( not ( = ?auto_13971 ?auto_13990 ) ) ( IS-CRATE ?auto_13963 ) ( not ( = ?auto_13988 ?auto_13969 ) ) ( HOIST-AT ?auto_13974 ?auto_13988 ) ( AVAILABLE ?auto_13974 ) ( SURFACE-AT ?auto_13963 ?auto_13988 ) ( ON ?auto_13963 ?auto_13976 ) ( CLEAR ?auto_13963 ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13960 ?auto_13976 ) ) ( not ( = ?auto_13963 ?auto_13976 ) ) ( not ( = ?auto_13971 ?auto_13974 ) ) ( IS-CRATE ?auto_13960 ) ( not ( = ?auto_13998 ?auto_13969 ) ) ( HOIST-AT ?auto_13979 ?auto_13998 ) ( AVAILABLE ?auto_13979 ) ( SURFACE-AT ?auto_13960 ?auto_13998 ) ( ON ?auto_13960 ?auto_13973 ) ( CLEAR ?auto_13960 ) ( not ( = ?auto_13959 ?auto_13960 ) ) ( not ( = ?auto_13959 ?auto_13973 ) ) ( not ( = ?auto_13960 ?auto_13973 ) ) ( not ( = ?auto_13971 ?auto_13979 ) ) ( IS-CRATE ?auto_13959 ) ( not ( = ?auto_13992 ?auto_13969 ) ) ( HOIST-AT ?auto_13982 ?auto_13992 ) ( SURFACE-AT ?auto_13959 ?auto_13992 ) ( ON ?auto_13959 ?auto_13989 ) ( CLEAR ?auto_13959 ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( not ( = ?auto_13958 ?auto_13989 ) ) ( not ( = ?auto_13959 ?auto_13989 ) ) ( not ( = ?auto_13971 ?auto_13982 ) ) ( IS-CRATE ?auto_13958 ) ( AVAILABLE ?auto_13982 ) ( SURFACE-AT ?auto_13958 ?auto_13992 ) ( ON ?auto_13958 ?auto_13983 ) ( CLEAR ?auto_13958 ) ( not ( = ?auto_13957 ?auto_13958 ) ) ( not ( = ?auto_13957 ?auto_13983 ) ) ( not ( = ?auto_13958 ?auto_13983 ) ) ( IS-CRATE ?auto_13957 ) ( not ( = ?auto_13999 ?auto_13969 ) ) ( HOIST-AT ?auto_13991 ?auto_13999 ) ( AVAILABLE ?auto_13991 ) ( SURFACE-AT ?auto_13957 ?auto_13999 ) ( ON ?auto_13957 ?auto_13995 ) ( CLEAR ?auto_13957 ) ( not ( = ?auto_13956 ?auto_13957 ) ) ( not ( = ?auto_13956 ?auto_13995 ) ) ( not ( = ?auto_13957 ?auto_13995 ) ) ( not ( = ?auto_13971 ?auto_13991 ) ) ( IS-CRATE ?auto_13956 ) ( AVAILABLE ?auto_13994 ) ( SURFACE-AT ?auto_13956 ?auto_13985 ) ( ON ?auto_13956 ?auto_13984 ) ( CLEAR ?auto_13956 ) ( not ( = ?auto_13955 ?auto_13956 ) ) ( not ( = ?auto_13955 ?auto_13984 ) ) ( not ( = ?auto_13956 ?auto_13984 ) ) ( SURFACE-AT ?auto_13954 ?auto_13969 ) ( CLEAR ?auto_13954 ) ( IS-CRATE ?auto_13955 ) ( AVAILABLE ?auto_13971 ) ( AVAILABLE ?auto_13967 ) ( SURFACE-AT ?auto_13955 ?auto_13972 ) ( ON ?auto_13955 ?auto_13993 ) ( CLEAR ?auto_13955 ) ( TRUCK-AT ?auto_13970 ?auto_13969 ) ( not ( = ?auto_13954 ?auto_13955 ) ) ( not ( = ?auto_13954 ?auto_13993 ) ) ( not ( = ?auto_13955 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13956 ) ) ( not ( = ?auto_13954 ?auto_13984 ) ) ( not ( = ?auto_13956 ?auto_13993 ) ) ( not ( = ?auto_13985 ?auto_13972 ) ) ( not ( = ?auto_13994 ?auto_13967 ) ) ( not ( = ?auto_13984 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13957 ) ) ( not ( = ?auto_13954 ?auto_13995 ) ) ( not ( = ?auto_13955 ?auto_13957 ) ) ( not ( = ?auto_13955 ?auto_13995 ) ) ( not ( = ?auto_13957 ?auto_13984 ) ) ( not ( = ?auto_13957 ?auto_13993 ) ) ( not ( = ?auto_13999 ?auto_13985 ) ) ( not ( = ?auto_13999 ?auto_13972 ) ) ( not ( = ?auto_13991 ?auto_13994 ) ) ( not ( = ?auto_13991 ?auto_13967 ) ) ( not ( = ?auto_13995 ?auto_13984 ) ) ( not ( = ?auto_13995 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13958 ) ) ( not ( = ?auto_13954 ?auto_13983 ) ) ( not ( = ?auto_13955 ?auto_13958 ) ) ( not ( = ?auto_13955 ?auto_13983 ) ) ( not ( = ?auto_13956 ?auto_13958 ) ) ( not ( = ?auto_13956 ?auto_13983 ) ) ( not ( = ?auto_13958 ?auto_13995 ) ) ( not ( = ?auto_13958 ?auto_13984 ) ) ( not ( = ?auto_13958 ?auto_13993 ) ) ( not ( = ?auto_13992 ?auto_13999 ) ) ( not ( = ?auto_13992 ?auto_13985 ) ) ( not ( = ?auto_13992 ?auto_13972 ) ) ( not ( = ?auto_13982 ?auto_13991 ) ) ( not ( = ?auto_13982 ?auto_13994 ) ) ( not ( = ?auto_13982 ?auto_13967 ) ) ( not ( = ?auto_13983 ?auto_13995 ) ) ( not ( = ?auto_13983 ?auto_13984 ) ) ( not ( = ?auto_13983 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13959 ) ) ( not ( = ?auto_13954 ?auto_13989 ) ) ( not ( = ?auto_13955 ?auto_13959 ) ) ( not ( = ?auto_13955 ?auto_13989 ) ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( not ( = ?auto_13956 ?auto_13989 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13989 ) ) ( not ( = ?auto_13959 ?auto_13983 ) ) ( not ( = ?auto_13959 ?auto_13995 ) ) ( not ( = ?auto_13959 ?auto_13984 ) ) ( not ( = ?auto_13959 ?auto_13993 ) ) ( not ( = ?auto_13989 ?auto_13983 ) ) ( not ( = ?auto_13989 ?auto_13995 ) ) ( not ( = ?auto_13989 ?auto_13984 ) ) ( not ( = ?auto_13989 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13960 ) ) ( not ( = ?auto_13954 ?auto_13973 ) ) ( not ( = ?auto_13955 ?auto_13960 ) ) ( not ( = ?auto_13955 ?auto_13973 ) ) ( not ( = ?auto_13956 ?auto_13960 ) ) ( not ( = ?auto_13956 ?auto_13973 ) ) ( not ( = ?auto_13957 ?auto_13960 ) ) ( not ( = ?auto_13957 ?auto_13973 ) ) ( not ( = ?auto_13958 ?auto_13960 ) ) ( not ( = ?auto_13958 ?auto_13973 ) ) ( not ( = ?auto_13960 ?auto_13989 ) ) ( not ( = ?auto_13960 ?auto_13983 ) ) ( not ( = ?auto_13960 ?auto_13995 ) ) ( not ( = ?auto_13960 ?auto_13984 ) ) ( not ( = ?auto_13960 ?auto_13993 ) ) ( not ( = ?auto_13998 ?auto_13992 ) ) ( not ( = ?auto_13998 ?auto_13999 ) ) ( not ( = ?auto_13998 ?auto_13985 ) ) ( not ( = ?auto_13998 ?auto_13972 ) ) ( not ( = ?auto_13979 ?auto_13982 ) ) ( not ( = ?auto_13979 ?auto_13991 ) ) ( not ( = ?auto_13979 ?auto_13994 ) ) ( not ( = ?auto_13979 ?auto_13967 ) ) ( not ( = ?auto_13973 ?auto_13989 ) ) ( not ( = ?auto_13973 ?auto_13983 ) ) ( not ( = ?auto_13973 ?auto_13995 ) ) ( not ( = ?auto_13973 ?auto_13984 ) ) ( not ( = ?auto_13973 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13963 ) ) ( not ( = ?auto_13954 ?auto_13976 ) ) ( not ( = ?auto_13955 ?auto_13963 ) ) ( not ( = ?auto_13955 ?auto_13976 ) ) ( not ( = ?auto_13956 ?auto_13963 ) ) ( not ( = ?auto_13956 ?auto_13976 ) ) ( not ( = ?auto_13957 ?auto_13963 ) ) ( not ( = ?auto_13957 ?auto_13976 ) ) ( not ( = ?auto_13958 ?auto_13963 ) ) ( not ( = ?auto_13958 ?auto_13976 ) ) ( not ( = ?auto_13959 ?auto_13963 ) ) ( not ( = ?auto_13959 ?auto_13976 ) ) ( not ( = ?auto_13963 ?auto_13973 ) ) ( not ( = ?auto_13963 ?auto_13989 ) ) ( not ( = ?auto_13963 ?auto_13983 ) ) ( not ( = ?auto_13963 ?auto_13995 ) ) ( not ( = ?auto_13963 ?auto_13984 ) ) ( not ( = ?auto_13963 ?auto_13993 ) ) ( not ( = ?auto_13988 ?auto_13998 ) ) ( not ( = ?auto_13988 ?auto_13992 ) ) ( not ( = ?auto_13988 ?auto_13999 ) ) ( not ( = ?auto_13988 ?auto_13985 ) ) ( not ( = ?auto_13988 ?auto_13972 ) ) ( not ( = ?auto_13974 ?auto_13979 ) ) ( not ( = ?auto_13974 ?auto_13982 ) ) ( not ( = ?auto_13974 ?auto_13991 ) ) ( not ( = ?auto_13974 ?auto_13994 ) ) ( not ( = ?auto_13974 ?auto_13967 ) ) ( not ( = ?auto_13976 ?auto_13973 ) ) ( not ( = ?auto_13976 ?auto_13989 ) ) ( not ( = ?auto_13976 ?auto_13983 ) ) ( not ( = ?auto_13976 ?auto_13995 ) ) ( not ( = ?auto_13976 ?auto_13984 ) ) ( not ( = ?auto_13976 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13962 ) ) ( not ( = ?auto_13954 ?auto_13980 ) ) ( not ( = ?auto_13955 ?auto_13962 ) ) ( not ( = ?auto_13955 ?auto_13980 ) ) ( not ( = ?auto_13956 ?auto_13962 ) ) ( not ( = ?auto_13956 ?auto_13980 ) ) ( not ( = ?auto_13957 ?auto_13962 ) ) ( not ( = ?auto_13957 ?auto_13980 ) ) ( not ( = ?auto_13958 ?auto_13962 ) ) ( not ( = ?auto_13958 ?auto_13980 ) ) ( not ( = ?auto_13959 ?auto_13962 ) ) ( not ( = ?auto_13959 ?auto_13980 ) ) ( not ( = ?auto_13960 ?auto_13962 ) ) ( not ( = ?auto_13960 ?auto_13980 ) ) ( not ( = ?auto_13962 ?auto_13976 ) ) ( not ( = ?auto_13962 ?auto_13973 ) ) ( not ( = ?auto_13962 ?auto_13989 ) ) ( not ( = ?auto_13962 ?auto_13983 ) ) ( not ( = ?auto_13962 ?auto_13995 ) ) ( not ( = ?auto_13962 ?auto_13984 ) ) ( not ( = ?auto_13962 ?auto_13993 ) ) ( not ( = ?auto_13981 ?auto_13988 ) ) ( not ( = ?auto_13981 ?auto_13998 ) ) ( not ( = ?auto_13981 ?auto_13992 ) ) ( not ( = ?auto_13981 ?auto_13999 ) ) ( not ( = ?auto_13981 ?auto_13985 ) ) ( not ( = ?auto_13981 ?auto_13972 ) ) ( not ( = ?auto_13990 ?auto_13974 ) ) ( not ( = ?auto_13990 ?auto_13979 ) ) ( not ( = ?auto_13990 ?auto_13982 ) ) ( not ( = ?auto_13990 ?auto_13991 ) ) ( not ( = ?auto_13990 ?auto_13994 ) ) ( not ( = ?auto_13990 ?auto_13967 ) ) ( not ( = ?auto_13980 ?auto_13976 ) ) ( not ( = ?auto_13980 ?auto_13973 ) ) ( not ( = ?auto_13980 ?auto_13989 ) ) ( not ( = ?auto_13980 ?auto_13983 ) ) ( not ( = ?auto_13980 ?auto_13995 ) ) ( not ( = ?auto_13980 ?auto_13984 ) ) ( not ( = ?auto_13980 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13961 ) ) ( not ( = ?auto_13954 ?auto_13986 ) ) ( not ( = ?auto_13955 ?auto_13961 ) ) ( not ( = ?auto_13955 ?auto_13986 ) ) ( not ( = ?auto_13956 ?auto_13961 ) ) ( not ( = ?auto_13956 ?auto_13986 ) ) ( not ( = ?auto_13957 ?auto_13961 ) ) ( not ( = ?auto_13957 ?auto_13986 ) ) ( not ( = ?auto_13958 ?auto_13961 ) ) ( not ( = ?auto_13958 ?auto_13986 ) ) ( not ( = ?auto_13959 ?auto_13961 ) ) ( not ( = ?auto_13959 ?auto_13986 ) ) ( not ( = ?auto_13960 ?auto_13961 ) ) ( not ( = ?auto_13960 ?auto_13986 ) ) ( not ( = ?auto_13963 ?auto_13961 ) ) ( not ( = ?auto_13963 ?auto_13986 ) ) ( not ( = ?auto_13961 ?auto_13980 ) ) ( not ( = ?auto_13961 ?auto_13976 ) ) ( not ( = ?auto_13961 ?auto_13973 ) ) ( not ( = ?auto_13961 ?auto_13989 ) ) ( not ( = ?auto_13961 ?auto_13983 ) ) ( not ( = ?auto_13961 ?auto_13995 ) ) ( not ( = ?auto_13961 ?auto_13984 ) ) ( not ( = ?auto_13961 ?auto_13993 ) ) ( not ( = ?auto_13987 ?auto_13981 ) ) ( not ( = ?auto_13987 ?auto_13988 ) ) ( not ( = ?auto_13987 ?auto_13998 ) ) ( not ( = ?auto_13987 ?auto_13992 ) ) ( not ( = ?auto_13987 ?auto_13999 ) ) ( not ( = ?auto_13987 ?auto_13985 ) ) ( not ( = ?auto_13987 ?auto_13972 ) ) ( not ( = ?auto_13978 ?auto_13990 ) ) ( not ( = ?auto_13978 ?auto_13974 ) ) ( not ( = ?auto_13978 ?auto_13979 ) ) ( not ( = ?auto_13978 ?auto_13982 ) ) ( not ( = ?auto_13978 ?auto_13991 ) ) ( not ( = ?auto_13978 ?auto_13994 ) ) ( not ( = ?auto_13978 ?auto_13967 ) ) ( not ( = ?auto_13986 ?auto_13980 ) ) ( not ( = ?auto_13986 ?auto_13976 ) ) ( not ( = ?auto_13986 ?auto_13973 ) ) ( not ( = ?auto_13986 ?auto_13989 ) ) ( not ( = ?auto_13986 ?auto_13983 ) ) ( not ( = ?auto_13986 ?auto_13995 ) ) ( not ( = ?auto_13986 ?auto_13984 ) ) ( not ( = ?auto_13986 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13964 ) ) ( not ( = ?auto_13954 ?auto_13977 ) ) ( not ( = ?auto_13955 ?auto_13964 ) ) ( not ( = ?auto_13955 ?auto_13977 ) ) ( not ( = ?auto_13956 ?auto_13964 ) ) ( not ( = ?auto_13956 ?auto_13977 ) ) ( not ( = ?auto_13957 ?auto_13964 ) ) ( not ( = ?auto_13957 ?auto_13977 ) ) ( not ( = ?auto_13958 ?auto_13964 ) ) ( not ( = ?auto_13958 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13964 ) ) ( not ( = ?auto_13959 ?auto_13977 ) ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13960 ?auto_13977 ) ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13977 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13977 ) ) ( not ( = ?auto_13964 ?auto_13986 ) ) ( not ( = ?auto_13964 ?auto_13980 ) ) ( not ( = ?auto_13964 ?auto_13976 ) ) ( not ( = ?auto_13964 ?auto_13973 ) ) ( not ( = ?auto_13964 ?auto_13989 ) ) ( not ( = ?auto_13964 ?auto_13983 ) ) ( not ( = ?auto_13964 ?auto_13995 ) ) ( not ( = ?auto_13964 ?auto_13984 ) ) ( not ( = ?auto_13964 ?auto_13993 ) ) ( not ( = ?auto_13996 ?auto_13987 ) ) ( not ( = ?auto_13996 ?auto_13981 ) ) ( not ( = ?auto_13996 ?auto_13988 ) ) ( not ( = ?auto_13996 ?auto_13998 ) ) ( not ( = ?auto_13996 ?auto_13992 ) ) ( not ( = ?auto_13996 ?auto_13999 ) ) ( not ( = ?auto_13996 ?auto_13985 ) ) ( not ( = ?auto_13996 ?auto_13972 ) ) ( not ( = ?auto_13975 ?auto_13978 ) ) ( not ( = ?auto_13975 ?auto_13990 ) ) ( not ( = ?auto_13975 ?auto_13974 ) ) ( not ( = ?auto_13975 ?auto_13979 ) ) ( not ( = ?auto_13975 ?auto_13982 ) ) ( not ( = ?auto_13975 ?auto_13991 ) ) ( not ( = ?auto_13975 ?auto_13994 ) ) ( not ( = ?auto_13975 ?auto_13967 ) ) ( not ( = ?auto_13977 ?auto_13986 ) ) ( not ( = ?auto_13977 ?auto_13980 ) ) ( not ( = ?auto_13977 ?auto_13976 ) ) ( not ( = ?auto_13977 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13989 ) ) ( not ( = ?auto_13977 ?auto_13983 ) ) ( not ( = ?auto_13977 ?auto_13995 ) ) ( not ( = ?auto_13977 ?auto_13984 ) ) ( not ( = ?auto_13977 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13965 ) ) ( not ( = ?auto_13954 ?auto_13997 ) ) ( not ( = ?auto_13955 ?auto_13965 ) ) ( not ( = ?auto_13955 ?auto_13997 ) ) ( not ( = ?auto_13956 ?auto_13965 ) ) ( not ( = ?auto_13956 ?auto_13997 ) ) ( not ( = ?auto_13957 ?auto_13965 ) ) ( not ( = ?auto_13957 ?auto_13997 ) ) ( not ( = ?auto_13958 ?auto_13965 ) ) ( not ( = ?auto_13958 ?auto_13997 ) ) ( not ( = ?auto_13959 ?auto_13965 ) ) ( not ( = ?auto_13959 ?auto_13997 ) ) ( not ( = ?auto_13960 ?auto_13965 ) ) ( not ( = ?auto_13960 ?auto_13997 ) ) ( not ( = ?auto_13963 ?auto_13965 ) ) ( not ( = ?auto_13963 ?auto_13997 ) ) ( not ( = ?auto_13962 ?auto_13965 ) ) ( not ( = ?auto_13962 ?auto_13997 ) ) ( not ( = ?auto_13961 ?auto_13965 ) ) ( not ( = ?auto_13961 ?auto_13997 ) ) ( not ( = ?auto_13965 ?auto_13977 ) ) ( not ( = ?auto_13965 ?auto_13986 ) ) ( not ( = ?auto_13965 ?auto_13980 ) ) ( not ( = ?auto_13965 ?auto_13976 ) ) ( not ( = ?auto_13965 ?auto_13973 ) ) ( not ( = ?auto_13965 ?auto_13989 ) ) ( not ( = ?auto_13965 ?auto_13983 ) ) ( not ( = ?auto_13965 ?auto_13995 ) ) ( not ( = ?auto_13965 ?auto_13984 ) ) ( not ( = ?auto_13965 ?auto_13993 ) ) ( not ( = ?auto_13997 ?auto_13977 ) ) ( not ( = ?auto_13997 ?auto_13986 ) ) ( not ( = ?auto_13997 ?auto_13980 ) ) ( not ( = ?auto_13997 ?auto_13976 ) ) ( not ( = ?auto_13997 ?auto_13973 ) ) ( not ( = ?auto_13997 ?auto_13989 ) ) ( not ( = ?auto_13997 ?auto_13983 ) ) ( not ( = ?auto_13997 ?auto_13995 ) ) ( not ( = ?auto_13997 ?auto_13984 ) ) ( not ( = ?auto_13997 ?auto_13993 ) ) ( not ( = ?auto_13954 ?auto_13966 ) ) ( not ( = ?auto_13954 ?auto_13968 ) ) ( not ( = ?auto_13955 ?auto_13966 ) ) ( not ( = ?auto_13955 ?auto_13968 ) ) ( not ( = ?auto_13956 ?auto_13966 ) ) ( not ( = ?auto_13956 ?auto_13968 ) ) ( not ( = ?auto_13957 ?auto_13966 ) ) ( not ( = ?auto_13957 ?auto_13968 ) ) ( not ( = ?auto_13958 ?auto_13966 ) ) ( not ( = ?auto_13958 ?auto_13968 ) ) ( not ( = ?auto_13959 ?auto_13966 ) ) ( not ( = ?auto_13959 ?auto_13968 ) ) ( not ( = ?auto_13960 ?auto_13966 ) ) ( not ( = ?auto_13960 ?auto_13968 ) ) ( not ( = ?auto_13963 ?auto_13966 ) ) ( not ( = ?auto_13963 ?auto_13968 ) ) ( not ( = ?auto_13962 ?auto_13966 ) ) ( not ( = ?auto_13962 ?auto_13968 ) ) ( not ( = ?auto_13961 ?auto_13966 ) ) ( not ( = ?auto_13961 ?auto_13968 ) ) ( not ( = ?auto_13964 ?auto_13966 ) ) ( not ( = ?auto_13964 ?auto_13968 ) ) ( not ( = ?auto_13966 ?auto_13997 ) ) ( not ( = ?auto_13966 ?auto_13977 ) ) ( not ( = ?auto_13966 ?auto_13986 ) ) ( not ( = ?auto_13966 ?auto_13980 ) ) ( not ( = ?auto_13966 ?auto_13976 ) ) ( not ( = ?auto_13966 ?auto_13973 ) ) ( not ( = ?auto_13966 ?auto_13989 ) ) ( not ( = ?auto_13966 ?auto_13983 ) ) ( not ( = ?auto_13966 ?auto_13995 ) ) ( not ( = ?auto_13966 ?auto_13984 ) ) ( not ( = ?auto_13966 ?auto_13993 ) ) ( not ( = ?auto_13968 ?auto_13997 ) ) ( not ( = ?auto_13968 ?auto_13977 ) ) ( not ( = ?auto_13968 ?auto_13986 ) ) ( not ( = ?auto_13968 ?auto_13980 ) ) ( not ( = ?auto_13968 ?auto_13976 ) ) ( not ( = ?auto_13968 ?auto_13973 ) ) ( not ( = ?auto_13968 ?auto_13989 ) ) ( not ( = ?auto_13968 ?auto_13983 ) ) ( not ( = ?auto_13968 ?auto_13995 ) ) ( not ( = ?auto_13968 ?auto_13984 ) ) ( not ( = ?auto_13968 ?auto_13993 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13954 ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ?auto_13959 ?auto_13960 ?auto_13963 ?auto_13962 ?auto_13961 ?auto_13964 ?auto_13965 )
      ( MAKE-1CRATE ?auto_13965 ?auto_13966 )
      ( MAKE-12CRATE-VERIFY ?auto_13954 ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ?auto_13959 ?auto_13960 ?auto_13963 ?auto_13962 ?auto_13961 ?auto_13964 ?auto_13965 ?auto_13966 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14002 - SURFACE
      ?auto_14003 - SURFACE
    )
    :vars
    (
      ?auto_14004 - HOIST
      ?auto_14005 - PLACE
      ?auto_14007 - PLACE
      ?auto_14008 - HOIST
      ?auto_14009 - SURFACE
      ?auto_14006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14004 ?auto_14005 ) ( SURFACE-AT ?auto_14002 ?auto_14005 ) ( CLEAR ?auto_14002 ) ( IS-CRATE ?auto_14003 ) ( AVAILABLE ?auto_14004 ) ( not ( = ?auto_14007 ?auto_14005 ) ) ( HOIST-AT ?auto_14008 ?auto_14007 ) ( AVAILABLE ?auto_14008 ) ( SURFACE-AT ?auto_14003 ?auto_14007 ) ( ON ?auto_14003 ?auto_14009 ) ( CLEAR ?auto_14003 ) ( TRUCK-AT ?auto_14006 ?auto_14005 ) ( not ( = ?auto_14002 ?auto_14003 ) ) ( not ( = ?auto_14002 ?auto_14009 ) ) ( not ( = ?auto_14003 ?auto_14009 ) ) ( not ( = ?auto_14004 ?auto_14008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14006 ?auto_14005 ?auto_14007 )
      ( !LIFT ?auto_14008 ?auto_14003 ?auto_14009 ?auto_14007 )
      ( !LOAD ?auto_14008 ?auto_14003 ?auto_14006 ?auto_14007 )
      ( !DRIVE ?auto_14006 ?auto_14007 ?auto_14005 )
      ( !UNLOAD ?auto_14004 ?auto_14003 ?auto_14006 ?auto_14005 )
      ( !DROP ?auto_14004 ?auto_14003 ?auto_14002 ?auto_14005 )
      ( MAKE-1CRATE-VERIFY ?auto_14002 ?auto_14003 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14024 - SURFACE
      ?auto_14025 - SURFACE
      ?auto_14026 - SURFACE
      ?auto_14027 - SURFACE
      ?auto_14028 - SURFACE
      ?auto_14029 - SURFACE
      ?auto_14030 - SURFACE
      ?auto_14033 - SURFACE
      ?auto_14032 - SURFACE
      ?auto_14031 - SURFACE
      ?auto_14034 - SURFACE
      ?auto_14035 - SURFACE
      ?auto_14036 - SURFACE
      ?auto_14037 - SURFACE
    )
    :vars
    (
      ?auto_14038 - HOIST
      ?auto_14043 - PLACE
      ?auto_14039 - PLACE
      ?auto_14041 - HOIST
      ?auto_14042 - SURFACE
      ?auto_14062 - PLACE
      ?auto_14073 - HOIST
      ?auto_14053 - SURFACE
      ?auto_14052 - PLACE
      ?auto_14059 - HOIST
      ?auto_14064 - SURFACE
      ?auto_14051 - PLACE
      ?auto_14048 - HOIST
      ?auto_14066 - SURFACE
      ?auto_14055 - PLACE
      ?auto_14047 - HOIST
      ?auto_14065 - SURFACE
      ?auto_14069 - PLACE
      ?auto_14054 - HOIST
      ?auto_14045 - SURFACE
      ?auto_14070 - PLACE
      ?auto_14071 - HOIST
      ?auto_14049 - SURFACE
      ?auto_14050 - PLACE
      ?auto_14072 - HOIST
      ?auto_14060 - SURFACE
      ?auto_14057 - PLACE
      ?auto_14046 - HOIST
      ?auto_14044 - SURFACE
      ?auto_14063 - SURFACE
      ?auto_14058 - PLACE
      ?auto_14061 - HOIST
      ?auto_14056 - SURFACE
      ?auto_14067 - SURFACE
      ?auto_14068 - SURFACE
      ?auto_14040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14038 ?auto_14043 ) ( IS-CRATE ?auto_14037 ) ( not ( = ?auto_14039 ?auto_14043 ) ) ( HOIST-AT ?auto_14041 ?auto_14039 ) ( AVAILABLE ?auto_14041 ) ( SURFACE-AT ?auto_14037 ?auto_14039 ) ( ON ?auto_14037 ?auto_14042 ) ( CLEAR ?auto_14037 ) ( not ( = ?auto_14036 ?auto_14037 ) ) ( not ( = ?auto_14036 ?auto_14042 ) ) ( not ( = ?auto_14037 ?auto_14042 ) ) ( not ( = ?auto_14038 ?auto_14041 ) ) ( IS-CRATE ?auto_14036 ) ( not ( = ?auto_14062 ?auto_14043 ) ) ( HOIST-AT ?auto_14073 ?auto_14062 ) ( SURFACE-AT ?auto_14036 ?auto_14062 ) ( ON ?auto_14036 ?auto_14053 ) ( CLEAR ?auto_14036 ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( not ( = ?auto_14035 ?auto_14053 ) ) ( not ( = ?auto_14036 ?auto_14053 ) ) ( not ( = ?auto_14038 ?auto_14073 ) ) ( IS-CRATE ?auto_14035 ) ( not ( = ?auto_14052 ?auto_14043 ) ) ( HOIST-AT ?auto_14059 ?auto_14052 ) ( SURFACE-AT ?auto_14035 ?auto_14052 ) ( ON ?auto_14035 ?auto_14064 ) ( CLEAR ?auto_14035 ) ( not ( = ?auto_14034 ?auto_14035 ) ) ( not ( = ?auto_14034 ?auto_14064 ) ) ( not ( = ?auto_14035 ?auto_14064 ) ) ( not ( = ?auto_14038 ?auto_14059 ) ) ( IS-CRATE ?auto_14034 ) ( not ( = ?auto_14051 ?auto_14043 ) ) ( HOIST-AT ?auto_14048 ?auto_14051 ) ( AVAILABLE ?auto_14048 ) ( SURFACE-AT ?auto_14034 ?auto_14051 ) ( ON ?auto_14034 ?auto_14066 ) ( CLEAR ?auto_14034 ) ( not ( = ?auto_14031 ?auto_14034 ) ) ( not ( = ?auto_14031 ?auto_14066 ) ) ( not ( = ?auto_14034 ?auto_14066 ) ) ( not ( = ?auto_14038 ?auto_14048 ) ) ( IS-CRATE ?auto_14031 ) ( not ( = ?auto_14055 ?auto_14043 ) ) ( HOIST-AT ?auto_14047 ?auto_14055 ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14031 ?auto_14055 ) ( ON ?auto_14031 ?auto_14065 ) ( CLEAR ?auto_14031 ) ( not ( = ?auto_14032 ?auto_14031 ) ) ( not ( = ?auto_14032 ?auto_14065 ) ) ( not ( = ?auto_14031 ?auto_14065 ) ) ( not ( = ?auto_14038 ?auto_14047 ) ) ( IS-CRATE ?auto_14032 ) ( not ( = ?auto_14069 ?auto_14043 ) ) ( HOIST-AT ?auto_14054 ?auto_14069 ) ( AVAILABLE ?auto_14054 ) ( SURFACE-AT ?auto_14032 ?auto_14069 ) ( ON ?auto_14032 ?auto_14045 ) ( CLEAR ?auto_14032 ) ( not ( = ?auto_14033 ?auto_14032 ) ) ( not ( = ?auto_14033 ?auto_14045 ) ) ( not ( = ?auto_14032 ?auto_14045 ) ) ( not ( = ?auto_14038 ?auto_14054 ) ) ( IS-CRATE ?auto_14033 ) ( not ( = ?auto_14070 ?auto_14043 ) ) ( HOIST-AT ?auto_14071 ?auto_14070 ) ( AVAILABLE ?auto_14071 ) ( SURFACE-AT ?auto_14033 ?auto_14070 ) ( ON ?auto_14033 ?auto_14049 ) ( CLEAR ?auto_14033 ) ( not ( = ?auto_14030 ?auto_14033 ) ) ( not ( = ?auto_14030 ?auto_14049 ) ) ( not ( = ?auto_14033 ?auto_14049 ) ) ( not ( = ?auto_14038 ?auto_14071 ) ) ( IS-CRATE ?auto_14030 ) ( not ( = ?auto_14050 ?auto_14043 ) ) ( HOIST-AT ?auto_14072 ?auto_14050 ) ( AVAILABLE ?auto_14072 ) ( SURFACE-AT ?auto_14030 ?auto_14050 ) ( ON ?auto_14030 ?auto_14060 ) ( CLEAR ?auto_14030 ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14060 ) ) ( not ( = ?auto_14030 ?auto_14060 ) ) ( not ( = ?auto_14038 ?auto_14072 ) ) ( IS-CRATE ?auto_14029 ) ( not ( = ?auto_14057 ?auto_14043 ) ) ( HOIST-AT ?auto_14046 ?auto_14057 ) ( SURFACE-AT ?auto_14029 ?auto_14057 ) ( ON ?auto_14029 ?auto_14044 ) ( CLEAR ?auto_14029 ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14044 ) ) ( not ( = ?auto_14029 ?auto_14044 ) ) ( not ( = ?auto_14038 ?auto_14046 ) ) ( IS-CRATE ?auto_14028 ) ( AVAILABLE ?auto_14046 ) ( SURFACE-AT ?auto_14028 ?auto_14057 ) ( ON ?auto_14028 ?auto_14063 ) ( CLEAR ?auto_14028 ) ( not ( = ?auto_14027 ?auto_14028 ) ) ( not ( = ?auto_14027 ?auto_14063 ) ) ( not ( = ?auto_14028 ?auto_14063 ) ) ( IS-CRATE ?auto_14027 ) ( not ( = ?auto_14058 ?auto_14043 ) ) ( HOIST-AT ?auto_14061 ?auto_14058 ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14027 ?auto_14058 ) ( ON ?auto_14027 ?auto_14056 ) ( CLEAR ?auto_14027 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14056 ) ) ( not ( = ?auto_14027 ?auto_14056 ) ) ( not ( = ?auto_14038 ?auto_14061 ) ) ( IS-CRATE ?auto_14026 ) ( AVAILABLE ?auto_14059 ) ( SURFACE-AT ?auto_14026 ?auto_14052 ) ( ON ?auto_14026 ?auto_14067 ) ( CLEAR ?auto_14026 ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14067 ) ) ( not ( = ?auto_14026 ?auto_14067 ) ) ( SURFACE-AT ?auto_14024 ?auto_14043 ) ( CLEAR ?auto_14024 ) ( IS-CRATE ?auto_14025 ) ( AVAILABLE ?auto_14038 ) ( AVAILABLE ?auto_14073 ) ( SURFACE-AT ?auto_14025 ?auto_14062 ) ( ON ?auto_14025 ?auto_14068 ) ( CLEAR ?auto_14025 ) ( TRUCK-AT ?auto_14040 ?auto_14043 ) ( not ( = ?auto_14024 ?auto_14025 ) ) ( not ( = ?auto_14024 ?auto_14068 ) ) ( not ( = ?auto_14025 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14026 ) ) ( not ( = ?auto_14024 ?auto_14067 ) ) ( not ( = ?auto_14026 ?auto_14068 ) ) ( not ( = ?auto_14052 ?auto_14062 ) ) ( not ( = ?auto_14059 ?auto_14073 ) ) ( not ( = ?auto_14067 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14027 ) ) ( not ( = ?auto_14024 ?auto_14056 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14056 ) ) ( not ( = ?auto_14027 ?auto_14067 ) ) ( not ( = ?auto_14027 ?auto_14068 ) ) ( not ( = ?auto_14058 ?auto_14052 ) ) ( not ( = ?auto_14058 ?auto_14062 ) ) ( not ( = ?auto_14061 ?auto_14059 ) ) ( not ( = ?auto_14061 ?auto_14073 ) ) ( not ( = ?auto_14056 ?auto_14067 ) ) ( not ( = ?auto_14056 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14028 ) ) ( not ( = ?auto_14024 ?auto_14063 ) ) ( not ( = ?auto_14025 ?auto_14028 ) ) ( not ( = ?auto_14025 ?auto_14063 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) ( not ( = ?auto_14026 ?auto_14063 ) ) ( not ( = ?auto_14028 ?auto_14056 ) ) ( not ( = ?auto_14028 ?auto_14067 ) ) ( not ( = ?auto_14028 ?auto_14068 ) ) ( not ( = ?auto_14057 ?auto_14058 ) ) ( not ( = ?auto_14057 ?auto_14052 ) ) ( not ( = ?auto_14057 ?auto_14062 ) ) ( not ( = ?auto_14046 ?auto_14061 ) ) ( not ( = ?auto_14046 ?auto_14059 ) ) ( not ( = ?auto_14046 ?auto_14073 ) ) ( not ( = ?auto_14063 ?auto_14056 ) ) ( not ( = ?auto_14063 ?auto_14067 ) ) ( not ( = ?auto_14063 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14029 ) ) ( not ( = ?auto_14024 ?auto_14044 ) ) ( not ( = ?auto_14025 ?auto_14029 ) ) ( not ( = ?auto_14025 ?auto_14044 ) ) ( not ( = ?auto_14026 ?auto_14029 ) ) ( not ( = ?auto_14026 ?auto_14044 ) ) ( not ( = ?auto_14027 ?auto_14029 ) ) ( not ( = ?auto_14027 ?auto_14044 ) ) ( not ( = ?auto_14029 ?auto_14063 ) ) ( not ( = ?auto_14029 ?auto_14056 ) ) ( not ( = ?auto_14029 ?auto_14067 ) ) ( not ( = ?auto_14029 ?auto_14068 ) ) ( not ( = ?auto_14044 ?auto_14063 ) ) ( not ( = ?auto_14044 ?auto_14056 ) ) ( not ( = ?auto_14044 ?auto_14067 ) ) ( not ( = ?auto_14044 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14030 ) ) ( not ( = ?auto_14024 ?auto_14060 ) ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( not ( = ?auto_14025 ?auto_14060 ) ) ( not ( = ?auto_14026 ?auto_14030 ) ) ( not ( = ?auto_14026 ?auto_14060 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14060 ) ) ( not ( = ?auto_14028 ?auto_14030 ) ) ( not ( = ?auto_14028 ?auto_14060 ) ) ( not ( = ?auto_14030 ?auto_14044 ) ) ( not ( = ?auto_14030 ?auto_14063 ) ) ( not ( = ?auto_14030 ?auto_14056 ) ) ( not ( = ?auto_14030 ?auto_14067 ) ) ( not ( = ?auto_14030 ?auto_14068 ) ) ( not ( = ?auto_14050 ?auto_14057 ) ) ( not ( = ?auto_14050 ?auto_14058 ) ) ( not ( = ?auto_14050 ?auto_14052 ) ) ( not ( = ?auto_14050 ?auto_14062 ) ) ( not ( = ?auto_14072 ?auto_14046 ) ) ( not ( = ?auto_14072 ?auto_14061 ) ) ( not ( = ?auto_14072 ?auto_14059 ) ) ( not ( = ?auto_14072 ?auto_14073 ) ) ( not ( = ?auto_14060 ?auto_14044 ) ) ( not ( = ?auto_14060 ?auto_14063 ) ) ( not ( = ?auto_14060 ?auto_14056 ) ) ( not ( = ?auto_14060 ?auto_14067 ) ) ( not ( = ?auto_14060 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14033 ) ) ( not ( = ?auto_14024 ?auto_14049 ) ) ( not ( = ?auto_14025 ?auto_14033 ) ) ( not ( = ?auto_14025 ?auto_14049 ) ) ( not ( = ?auto_14026 ?auto_14033 ) ) ( not ( = ?auto_14026 ?auto_14049 ) ) ( not ( = ?auto_14027 ?auto_14033 ) ) ( not ( = ?auto_14027 ?auto_14049 ) ) ( not ( = ?auto_14028 ?auto_14033 ) ) ( not ( = ?auto_14028 ?auto_14049 ) ) ( not ( = ?auto_14029 ?auto_14033 ) ) ( not ( = ?auto_14029 ?auto_14049 ) ) ( not ( = ?auto_14033 ?auto_14060 ) ) ( not ( = ?auto_14033 ?auto_14044 ) ) ( not ( = ?auto_14033 ?auto_14063 ) ) ( not ( = ?auto_14033 ?auto_14056 ) ) ( not ( = ?auto_14033 ?auto_14067 ) ) ( not ( = ?auto_14033 ?auto_14068 ) ) ( not ( = ?auto_14070 ?auto_14050 ) ) ( not ( = ?auto_14070 ?auto_14057 ) ) ( not ( = ?auto_14070 ?auto_14058 ) ) ( not ( = ?auto_14070 ?auto_14052 ) ) ( not ( = ?auto_14070 ?auto_14062 ) ) ( not ( = ?auto_14071 ?auto_14072 ) ) ( not ( = ?auto_14071 ?auto_14046 ) ) ( not ( = ?auto_14071 ?auto_14061 ) ) ( not ( = ?auto_14071 ?auto_14059 ) ) ( not ( = ?auto_14071 ?auto_14073 ) ) ( not ( = ?auto_14049 ?auto_14060 ) ) ( not ( = ?auto_14049 ?auto_14044 ) ) ( not ( = ?auto_14049 ?auto_14063 ) ) ( not ( = ?auto_14049 ?auto_14056 ) ) ( not ( = ?auto_14049 ?auto_14067 ) ) ( not ( = ?auto_14049 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14032 ) ) ( not ( = ?auto_14024 ?auto_14045 ) ) ( not ( = ?auto_14025 ?auto_14032 ) ) ( not ( = ?auto_14025 ?auto_14045 ) ) ( not ( = ?auto_14026 ?auto_14032 ) ) ( not ( = ?auto_14026 ?auto_14045 ) ) ( not ( = ?auto_14027 ?auto_14032 ) ) ( not ( = ?auto_14027 ?auto_14045 ) ) ( not ( = ?auto_14028 ?auto_14032 ) ) ( not ( = ?auto_14028 ?auto_14045 ) ) ( not ( = ?auto_14029 ?auto_14032 ) ) ( not ( = ?auto_14029 ?auto_14045 ) ) ( not ( = ?auto_14030 ?auto_14032 ) ) ( not ( = ?auto_14030 ?auto_14045 ) ) ( not ( = ?auto_14032 ?auto_14049 ) ) ( not ( = ?auto_14032 ?auto_14060 ) ) ( not ( = ?auto_14032 ?auto_14044 ) ) ( not ( = ?auto_14032 ?auto_14063 ) ) ( not ( = ?auto_14032 ?auto_14056 ) ) ( not ( = ?auto_14032 ?auto_14067 ) ) ( not ( = ?auto_14032 ?auto_14068 ) ) ( not ( = ?auto_14069 ?auto_14070 ) ) ( not ( = ?auto_14069 ?auto_14050 ) ) ( not ( = ?auto_14069 ?auto_14057 ) ) ( not ( = ?auto_14069 ?auto_14058 ) ) ( not ( = ?auto_14069 ?auto_14052 ) ) ( not ( = ?auto_14069 ?auto_14062 ) ) ( not ( = ?auto_14054 ?auto_14071 ) ) ( not ( = ?auto_14054 ?auto_14072 ) ) ( not ( = ?auto_14054 ?auto_14046 ) ) ( not ( = ?auto_14054 ?auto_14061 ) ) ( not ( = ?auto_14054 ?auto_14059 ) ) ( not ( = ?auto_14054 ?auto_14073 ) ) ( not ( = ?auto_14045 ?auto_14049 ) ) ( not ( = ?auto_14045 ?auto_14060 ) ) ( not ( = ?auto_14045 ?auto_14044 ) ) ( not ( = ?auto_14045 ?auto_14063 ) ) ( not ( = ?auto_14045 ?auto_14056 ) ) ( not ( = ?auto_14045 ?auto_14067 ) ) ( not ( = ?auto_14045 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14031 ) ) ( not ( = ?auto_14024 ?auto_14065 ) ) ( not ( = ?auto_14025 ?auto_14031 ) ) ( not ( = ?auto_14025 ?auto_14065 ) ) ( not ( = ?auto_14026 ?auto_14031 ) ) ( not ( = ?auto_14026 ?auto_14065 ) ) ( not ( = ?auto_14027 ?auto_14031 ) ) ( not ( = ?auto_14027 ?auto_14065 ) ) ( not ( = ?auto_14028 ?auto_14031 ) ) ( not ( = ?auto_14028 ?auto_14065 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14065 ) ) ( not ( = ?auto_14030 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14065 ) ) ( not ( = ?auto_14033 ?auto_14031 ) ) ( not ( = ?auto_14033 ?auto_14065 ) ) ( not ( = ?auto_14031 ?auto_14045 ) ) ( not ( = ?auto_14031 ?auto_14049 ) ) ( not ( = ?auto_14031 ?auto_14060 ) ) ( not ( = ?auto_14031 ?auto_14044 ) ) ( not ( = ?auto_14031 ?auto_14063 ) ) ( not ( = ?auto_14031 ?auto_14056 ) ) ( not ( = ?auto_14031 ?auto_14067 ) ) ( not ( = ?auto_14031 ?auto_14068 ) ) ( not ( = ?auto_14055 ?auto_14069 ) ) ( not ( = ?auto_14055 ?auto_14070 ) ) ( not ( = ?auto_14055 ?auto_14050 ) ) ( not ( = ?auto_14055 ?auto_14057 ) ) ( not ( = ?auto_14055 ?auto_14058 ) ) ( not ( = ?auto_14055 ?auto_14052 ) ) ( not ( = ?auto_14055 ?auto_14062 ) ) ( not ( = ?auto_14047 ?auto_14054 ) ) ( not ( = ?auto_14047 ?auto_14071 ) ) ( not ( = ?auto_14047 ?auto_14072 ) ) ( not ( = ?auto_14047 ?auto_14046 ) ) ( not ( = ?auto_14047 ?auto_14061 ) ) ( not ( = ?auto_14047 ?auto_14059 ) ) ( not ( = ?auto_14047 ?auto_14073 ) ) ( not ( = ?auto_14065 ?auto_14045 ) ) ( not ( = ?auto_14065 ?auto_14049 ) ) ( not ( = ?auto_14065 ?auto_14060 ) ) ( not ( = ?auto_14065 ?auto_14044 ) ) ( not ( = ?auto_14065 ?auto_14063 ) ) ( not ( = ?auto_14065 ?auto_14056 ) ) ( not ( = ?auto_14065 ?auto_14067 ) ) ( not ( = ?auto_14065 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14034 ) ) ( not ( = ?auto_14024 ?auto_14066 ) ) ( not ( = ?auto_14025 ?auto_14034 ) ) ( not ( = ?auto_14025 ?auto_14066 ) ) ( not ( = ?auto_14026 ?auto_14034 ) ) ( not ( = ?auto_14026 ?auto_14066 ) ) ( not ( = ?auto_14027 ?auto_14034 ) ) ( not ( = ?auto_14027 ?auto_14066 ) ) ( not ( = ?auto_14028 ?auto_14034 ) ) ( not ( = ?auto_14028 ?auto_14066 ) ) ( not ( = ?auto_14029 ?auto_14034 ) ) ( not ( = ?auto_14029 ?auto_14066 ) ) ( not ( = ?auto_14030 ?auto_14034 ) ) ( not ( = ?auto_14030 ?auto_14066 ) ) ( not ( = ?auto_14033 ?auto_14034 ) ) ( not ( = ?auto_14033 ?auto_14066 ) ) ( not ( = ?auto_14032 ?auto_14034 ) ) ( not ( = ?auto_14032 ?auto_14066 ) ) ( not ( = ?auto_14034 ?auto_14065 ) ) ( not ( = ?auto_14034 ?auto_14045 ) ) ( not ( = ?auto_14034 ?auto_14049 ) ) ( not ( = ?auto_14034 ?auto_14060 ) ) ( not ( = ?auto_14034 ?auto_14044 ) ) ( not ( = ?auto_14034 ?auto_14063 ) ) ( not ( = ?auto_14034 ?auto_14056 ) ) ( not ( = ?auto_14034 ?auto_14067 ) ) ( not ( = ?auto_14034 ?auto_14068 ) ) ( not ( = ?auto_14051 ?auto_14055 ) ) ( not ( = ?auto_14051 ?auto_14069 ) ) ( not ( = ?auto_14051 ?auto_14070 ) ) ( not ( = ?auto_14051 ?auto_14050 ) ) ( not ( = ?auto_14051 ?auto_14057 ) ) ( not ( = ?auto_14051 ?auto_14058 ) ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( not ( = ?auto_14051 ?auto_14062 ) ) ( not ( = ?auto_14048 ?auto_14047 ) ) ( not ( = ?auto_14048 ?auto_14054 ) ) ( not ( = ?auto_14048 ?auto_14071 ) ) ( not ( = ?auto_14048 ?auto_14072 ) ) ( not ( = ?auto_14048 ?auto_14046 ) ) ( not ( = ?auto_14048 ?auto_14061 ) ) ( not ( = ?auto_14048 ?auto_14059 ) ) ( not ( = ?auto_14048 ?auto_14073 ) ) ( not ( = ?auto_14066 ?auto_14065 ) ) ( not ( = ?auto_14066 ?auto_14045 ) ) ( not ( = ?auto_14066 ?auto_14049 ) ) ( not ( = ?auto_14066 ?auto_14060 ) ) ( not ( = ?auto_14066 ?auto_14044 ) ) ( not ( = ?auto_14066 ?auto_14063 ) ) ( not ( = ?auto_14066 ?auto_14056 ) ) ( not ( = ?auto_14066 ?auto_14067 ) ) ( not ( = ?auto_14066 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14035 ) ) ( not ( = ?auto_14024 ?auto_14064 ) ) ( not ( = ?auto_14025 ?auto_14035 ) ) ( not ( = ?auto_14025 ?auto_14064 ) ) ( not ( = ?auto_14026 ?auto_14035 ) ) ( not ( = ?auto_14026 ?auto_14064 ) ) ( not ( = ?auto_14027 ?auto_14035 ) ) ( not ( = ?auto_14027 ?auto_14064 ) ) ( not ( = ?auto_14028 ?auto_14035 ) ) ( not ( = ?auto_14028 ?auto_14064 ) ) ( not ( = ?auto_14029 ?auto_14035 ) ) ( not ( = ?auto_14029 ?auto_14064 ) ) ( not ( = ?auto_14030 ?auto_14035 ) ) ( not ( = ?auto_14030 ?auto_14064 ) ) ( not ( = ?auto_14033 ?auto_14035 ) ) ( not ( = ?auto_14033 ?auto_14064 ) ) ( not ( = ?auto_14032 ?auto_14035 ) ) ( not ( = ?auto_14032 ?auto_14064 ) ) ( not ( = ?auto_14031 ?auto_14035 ) ) ( not ( = ?auto_14031 ?auto_14064 ) ) ( not ( = ?auto_14035 ?auto_14066 ) ) ( not ( = ?auto_14035 ?auto_14065 ) ) ( not ( = ?auto_14035 ?auto_14045 ) ) ( not ( = ?auto_14035 ?auto_14049 ) ) ( not ( = ?auto_14035 ?auto_14060 ) ) ( not ( = ?auto_14035 ?auto_14044 ) ) ( not ( = ?auto_14035 ?auto_14063 ) ) ( not ( = ?auto_14035 ?auto_14056 ) ) ( not ( = ?auto_14035 ?auto_14067 ) ) ( not ( = ?auto_14035 ?auto_14068 ) ) ( not ( = ?auto_14064 ?auto_14066 ) ) ( not ( = ?auto_14064 ?auto_14065 ) ) ( not ( = ?auto_14064 ?auto_14045 ) ) ( not ( = ?auto_14064 ?auto_14049 ) ) ( not ( = ?auto_14064 ?auto_14060 ) ) ( not ( = ?auto_14064 ?auto_14044 ) ) ( not ( = ?auto_14064 ?auto_14063 ) ) ( not ( = ?auto_14064 ?auto_14056 ) ) ( not ( = ?auto_14064 ?auto_14067 ) ) ( not ( = ?auto_14064 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14036 ) ) ( not ( = ?auto_14024 ?auto_14053 ) ) ( not ( = ?auto_14025 ?auto_14036 ) ) ( not ( = ?auto_14025 ?auto_14053 ) ) ( not ( = ?auto_14026 ?auto_14036 ) ) ( not ( = ?auto_14026 ?auto_14053 ) ) ( not ( = ?auto_14027 ?auto_14036 ) ) ( not ( = ?auto_14027 ?auto_14053 ) ) ( not ( = ?auto_14028 ?auto_14036 ) ) ( not ( = ?auto_14028 ?auto_14053 ) ) ( not ( = ?auto_14029 ?auto_14036 ) ) ( not ( = ?auto_14029 ?auto_14053 ) ) ( not ( = ?auto_14030 ?auto_14036 ) ) ( not ( = ?auto_14030 ?auto_14053 ) ) ( not ( = ?auto_14033 ?auto_14036 ) ) ( not ( = ?auto_14033 ?auto_14053 ) ) ( not ( = ?auto_14032 ?auto_14036 ) ) ( not ( = ?auto_14032 ?auto_14053 ) ) ( not ( = ?auto_14031 ?auto_14036 ) ) ( not ( = ?auto_14031 ?auto_14053 ) ) ( not ( = ?auto_14034 ?auto_14036 ) ) ( not ( = ?auto_14034 ?auto_14053 ) ) ( not ( = ?auto_14036 ?auto_14064 ) ) ( not ( = ?auto_14036 ?auto_14066 ) ) ( not ( = ?auto_14036 ?auto_14065 ) ) ( not ( = ?auto_14036 ?auto_14045 ) ) ( not ( = ?auto_14036 ?auto_14049 ) ) ( not ( = ?auto_14036 ?auto_14060 ) ) ( not ( = ?auto_14036 ?auto_14044 ) ) ( not ( = ?auto_14036 ?auto_14063 ) ) ( not ( = ?auto_14036 ?auto_14056 ) ) ( not ( = ?auto_14036 ?auto_14067 ) ) ( not ( = ?auto_14036 ?auto_14068 ) ) ( not ( = ?auto_14053 ?auto_14064 ) ) ( not ( = ?auto_14053 ?auto_14066 ) ) ( not ( = ?auto_14053 ?auto_14065 ) ) ( not ( = ?auto_14053 ?auto_14045 ) ) ( not ( = ?auto_14053 ?auto_14049 ) ) ( not ( = ?auto_14053 ?auto_14060 ) ) ( not ( = ?auto_14053 ?auto_14044 ) ) ( not ( = ?auto_14053 ?auto_14063 ) ) ( not ( = ?auto_14053 ?auto_14056 ) ) ( not ( = ?auto_14053 ?auto_14067 ) ) ( not ( = ?auto_14053 ?auto_14068 ) ) ( not ( = ?auto_14024 ?auto_14037 ) ) ( not ( = ?auto_14024 ?auto_14042 ) ) ( not ( = ?auto_14025 ?auto_14037 ) ) ( not ( = ?auto_14025 ?auto_14042 ) ) ( not ( = ?auto_14026 ?auto_14037 ) ) ( not ( = ?auto_14026 ?auto_14042 ) ) ( not ( = ?auto_14027 ?auto_14037 ) ) ( not ( = ?auto_14027 ?auto_14042 ) ) ( not ( = ?auto_14028 ?auto_14037 ) ) ( not ( = ?auto_14028 ?auto_14042 ) ) ( not ( = ?auto_14029 ?auto_14037 ) ) ( not ( = ?auto_14029 ?auto_14042 ) ) ( not ( = ?auto_14030 ?auto_14037 ) ) ( not ( = ?auto_14030 ?auto_14042 ) ) ( not ( = ?auto_14033 ?auto_14037 ) ) ( not ( = ?auto_14033 ?auto_14042 ) ) ( not ( = ?auto_14032 ?auto_14037 ) ) ( not ( = ?auto_14032 ?auto_14042 ) ) ( not ( = ?auto_14031 ?auto_14037 ) ) ( not ( = ?auto_14031 ?auto_14042 ) ) ( not ( = ?auto_14034 ?auto_14037 ) ) ( not ( = ?auto_14034 ?auto_14042 ) ) ( not ( = ?auto_14035 ?auto_14037 ) ) ( not ( = ?auto_14035 ?auto_14042 ) ) ( not ( = ?auto_14037 ?auto_14053 ) ) ( not ( = ?auto_14037 ?auto_14064 ) ) ( not ( = ?auto_14037 ?auto_14066 ) ) ( not ( = ?auto_14037 ?auto_14065 ) ) ( not ( = ?auto_14037 ?auto_14045 ) ) ( not ( = ?auto_14037 ?auto_14049 ) ) ( not ( = ?auto_14037 ?auto_14060 ) ) ( not ( = ?auto_14037 ?auto_14044 ) ) ( not ( = ?auto_14037 ?auto_14063 ) ) ( not ( = ?auto_14037 ?auto_14056 ) ) ( not ( = ?auto_14037 ?auto_14067 ) ) ( not ( = ?auto_14037 ?auto_14068 ) ) ( not ( = ?auto_14039 ?auto_14062 ) ) ( not ( = ?auto_14039 ?auto_14052 ) ) ( not ( = ?auto_14039 ?auto_14051 ) ) ( not ( = ?auto_14039 ?auto_14055 ) ) ( not ( = ?auto_14039 ?auto_14069 ) ) ( not ( = ?auto_14039 ?auto_14070 ) ) ( not ( = ?auto_14039 ?auto_14050 ) ) ( not ( = ?auto_14039 ?auto_14057 ) ) ( not ( = ?auto_14039 ?auto_14058 ) ) ( not ( = ?auto_14041 ?auto_14073 ) ) ( not ( = ?auto_14041 ?auto_14059 ) ) ( not ( = ?auto_14041 ?auto_14048 ) ) ( not ( = ?auto_14041 ?auto_14047 ) ) ( not ( = ?auto_14041 ?auto_14054 ) ) ( not ( = ?auto_14041 ?auto_14071 ) ) ( not ( = ?auto_14041 ?auto_14072 ) ) ( not ( = ?auto_14041 ?auto_14046 ) ) ( not ( = ?auto_14041 ?auto_14061 ) ) ( not ( = ?auto_14042 ?auto_14053 ) ) ( not ( = ?auto_14042 ?auto_14064 ) ) ( not ( = ?auto_14042 ?auto_14066 ) ) ( not ( = ?auto_14042 ?auto_14065 ) ) ( not ( = ?auto_14042 ?auto_14045 ) ) ( not ( = ?auto_14042 ?auto_14049 ) ) ( not ( = ?auto_14042 ?auto_14060 ) ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14063 ) ) ( not ( = ?auto_14042 ?auto_14056 ) ) ( not ( = ?auto_14042 ?auto_14067 ) ) ( not ( = ?auto_14042 ?auto_14068 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14024 ?auto_14025 ?auto_14026 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14033 ?auto_14032 ?auto_14031 ?auto_14034 ?auto_14035 ?auto_14036 )
      ( MAKE-1CRATE ?auto_14036 ?auto_14037 )
      ( MAKE-13CRATE-VERIFY ?auto_14024 ?auto_14025 ?auto_14026 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14033 ?auto_14032 ?auto_14031 ?auto_14034 ?auto_14035 ?auto_14036 ?auto_14037 ) )
  )

)

