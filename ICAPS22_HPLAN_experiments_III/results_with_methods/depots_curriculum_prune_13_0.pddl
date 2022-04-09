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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13485 - SURFACE
      ?auto_13486 - SURFACE
      ?auto_13487 - SURFACE
    )
    :vars
    (
      ?auto_13488 - HOIST
      ?auto_13492 - PLACE
      ?auto_13489 - PLACE
      ?auto_13493 - HOIST
      ?auto_13490 - SURFACE
      ?auto_13494 - PLACE
      ?auto_13495 - HOIST
      ?auto_13496 - SURFACE
      ?auto_13491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13488 ?auto_13492 ) ( IS-CRATE ?auto_13487 ) ( not ( = ?auto_13489 ?auto_13492 ) ) ( HOIST-AT ?auto_13493 ?auto_13489 ) ( AVAILABLE ?auto_13493 ) ( SURFACE-AT ?auto_13487 ?auto_13489 ) ( ON ?auto_13487 ?auto_13490 ) ( CLEAR ?auto_13487 ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( not ( = ?auto_13486 ?auto_13490 ) ) ( not ( = ?auto_13487 ?auto_13490 ) ) ( not ( = ?auto_13488 ?auto_13493 ) ) ( SURFACE-AT ?auto_13485 ?auto_13492 ) ( CLEAR ?auto_13485 ) ( IS-CRATE ?auto_13486 ) ( AVAILABLE ?auto_13488 ) ( not ( = ?auto_13494 ?auto_13492 ) ) ( HOIST-AT ?auto_13495 ?auto_13494 ) ( AVAILABLE ?auto_13495 ) ( SURFACE-AT ?auto_13486 ?auto_13494 ) ( ON ?auto_13486 ?auto_13496 ) ( CLEAR ?auto_13486 ) ( TRUCK-AT ?auto_13491 ?auto_13492 ) ( not ( = ?auto_13485 ?auto_13486 ) ) ( not ( = ?auto_13485 ?auto_13496 ) ) ( not ( = ?auto_13486 ?auto_13496 ) ) ( not ( = ?auto_13488 ?auto_13495 ) ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13485 ?auto_13490 ) ) ( not ( = ?auto_13487 ?auto_13496 ) ) ( not ( = ?auto_13489 ?auto_13494 ) ) ( not ( = ?auto_13493 ?auto_13495 ) ) ( not ( = ?auto_13490 ?auto_13496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13485 ?auto_13486 )
      ( MAKE-1CRATE ?auto_13486 ?auto_13487 )
      ( MAKE-2CRATE-VERIFY ?auto_13485 ?auto_13486 ?auto_13487 ) )
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
      ?auto_13516 - PLACE
      ?auto_13520 - PLACE
      ?auto_13515 - HOIST
      ?auto_13518 - SURFACE
      ?auto_13524 - PLACE
      ?auto_13525 - HOIST
      ?auto_13526 - SURFACE
      ?auto_13521 - PLACE
      ?auto_13522 - HOIST
      ?auto_13523 - SURFACE
      ?auto_13517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13519 ?auto_13516 ) ( IS-CRATE ?auto_13514 ) ( not ( = ?auto_13520 ?auto_13516 ) ) ( HOIST-AT ?auto_13515 ?auto_13520 ) ( AVAILABLE ?auto_13515 ) ( SURFACE-AT ?auto_13514 ?auto_13520 ) ( ON ?auto_13514 ?auto_13518 ) ( CLEAR ?auto_13514 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13518 ) ) ( not ( = ?auto_13514 ?auto_13518 ) ) ( not ( = ?auto_13519 ?auto_13515 ) ) ( IS-CRATE ?auto_13513 ) ( not ( = ?auto_13524 ?auto_13516 ) ) ( HOIST-AT ?auto_13525 ?auto_13524 ) ( AVAILABLE ?auto_13525 ) ( SURFACE-AT ?auto_13513 ?auto_13524 ) ( ON ?auto_13513 ?auto_13526 ) ( CLEAR ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13526 ) ) ( not ( = ?auto_13513 ?auto_13526 ) ) ( not ( = ?auto_13519 ?auto_13525 ) ) ( SURFACE-AT ?auto_13511 ?auto_13516 ) ( CLEAR ?auto_13511 ) ( IS-CRATE ?auto_13512 ) ( AVAILABLE ?auto_13519 ) ( not ( = ?auto_13521 ?auto_13516 ) ) ( HOIST-AT ?auto_13522 ?auto_13521 ) ( AVAILABLE ?auto_13522 ) ( SURFACE-AT ?auto_13512 ?auto_13521 ) ( ON ?auto_13512 ?auto_13523 ) ( CLEAR ?auto_13512 ) ( TRUCK-AT ?auto_13517 ?auto_13516 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13523 ) ) ( not ( = ?auto_13512 ?auto_13523 ) ) ( not ( = ?auto_13519 ?auto_13522 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13526 ) ) ( not ( = ?auto_13513 ?auto_13523 ) ) ( not ( = ?auto_13524 ?auto_13521 ) ) ( not ( = ?auto_13525 ?auto_13522 ) ) ( not ( = ?auto_13526 ?auto_13523 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13511 ?auto_13518 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13518 ) ) ( not ( = ?auto_13514 ?auto_13526 ) ) ( not ( = ?auto_13514 ?auto_13523 ) ) ( not ( = ?auto_13520 ?auto_13524 ) ) ( not ( = ?auto_13520 ?auto_13521 ) ) ( not ( = ?auto_13515 ?auto_13525 ) ) ( not ( = ?auto_13515 ?auto_13522 ) ) ( not ( = ?auto_13518 ?auto_13526 ) ) ( not ( = ?auto_13518 ?auto_13523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13511 ?auto_13512 ?auto_13513 )
      ( MAKE-1CRATE ?auto_13513 ?auto_13514 )
      ( MAKE-3CRATE-VERIFY ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ) )
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
      ?auto_13549 - HOIST
      ?auto_13550 - PLACE
      ?auto_13548 - PLACE
      ?auto_13552 - HOIST
      ?auto_13551 - SURFACE
      ?auto_13557 - PLACE
      ?auto_13558 - HOIST
      ?auto_13556 - SURFACE
      ?auto_13559 - PLACE
      ?auto_13555 - HOIST
      ?auto_13553 - SURFACE
      ?auto_13560 - PLACE
      ?auto_13561 - HOIST
      ?auto_13554 - SURFACE
      ?auto_13547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13549 ?auto_13550 ) ( IS-CRATE ?auto_13546 ) ( not ( = ?auto_13548 ?auto_13550 ) ) ( HOIST-AT ?auto_13552 ?auto_13548 ) ( AVAILABLE ?auto_13552 ) ( SURFACE-AT ?auto_13546 ?auto_13548 ) ( ON ?auto_13546 ?auto_13551 ) ( CLEAR ?auto_13546 ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13551 ) ) ( not ( = ?auto_13546 ?auto_13551 ) ) ( not ( = ?auto_13549 ?auto_13552 ) ) ( IS-CRATE ?auto_13545 ) ( not ( = ?auto_13557 ?auto_13550 ) ) ( HOIST-AT ?auto_13558 ?auto_13557 ) ( AVAILABLE ?auto_13558 ) ( SURFACE-AT ?auto_13545 ?auto_13557 ) ( ON ?auto_13545 ?auto_13556 ) ( CLEAR ?auto_13545 ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( not ( = ?auto_13544 ?auto_13556 ) ) ( not ( = ?auto_13545 ?auto_13556 ) ) ( not ( = ?auto_13549 ?auto_13558 ) ) ( IS-CRATE ?auto_13544 ) ( not ( = ?auto_13559 ?auto_13550 ) ) ( HOIST-AT ?auto_13555 ?auto_13559 ) ( AVAILABLE ?auto_13555 ) ( SURFACE-AT ?auto_13544 ?auto_13559 ) ( ON ?auto_13544 ?auto_13553 ) ( CLEAR ?auto_13544 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( not ( = ?auto_13543 ?auto_13553 ) ) ( not ( = ?auto_13544 ?auto_13553 ) ) ( not ( = ?auto_13549 ?auto_13555 ) ) ( SURFACE-AT ?auto_13542 ?auto_13550 ) ( CLEAR ?auto_13542 ) ( IS-CRATE ?auto_13543 ) ( AVAILABLE ?auto_13549 ) ( not ( = ?auto_13560 ?auto_13550 ) ) ( HOIST-AT ?auto_13561 ?auto_13560 ) ( AVAILABLE ?auto_13561 ) ( SURFACE-AT ?auto_13543 ?auto_13560 ) ( ON ?auto_13543 ?auto_13554 ) ( CLEAR ?auto_13543 ) ( TRUCK-AT ?auto_13547 ?auto_13550 ) ( not ( = ?auto_13542 ?auto_13543 ) ) ( not ( = ?auto_13542 ?auto_13554 ) ) ( not ( = ?auto_13543 ?auto_13554 ) ) ( not ( = ?auto_13549 ?auto_13561 ) ) ( not ( = ?auto_13542 ?auto_13544 ) ) ( not ( = ?auto_13542 ?auto_13553 ) ) ( not ( = ?auto_13544 ?auto_13554 ) ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13555 ?auto_13561 ) ) ( not ( = ?auto_13553 ?auto_13554 ) ) ( not ( = ?auto_13542 ?auto_13545 ) ) ( not ( = ?auto_13542 ?auto_13556 ) ) ( not ( = ?auto_13543 ?auto_13545 ) ) ( not ( = ?auto_13543 ?auto_13556 ) ) ( not ( = ?auto_13545 ?auto_13553 ) ) ( not ( = ?auto_13545 ?auto_13554 ) ) ( not ( = ?auto_13557 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13555 ) ) ( not ( = ?auto_13558 ?auto_13561 ) ) ( not ( = ?auto_13556 ?auto_13553 ) ) ( not ( = ?auto_13556 ?auto_13554 ) ) ( not ( = ?auto_13542 ?auto_13546 ) ) ( not ( = ?auto_13542 ?auto_13551 ) ) ( not ( = ?auto_13543 ?auto_13546 ) ) ( not ( = ?auto_13543 ?auto_13551 ) ) ( not ( = ?auto_13544 ?auto_13546 ) ) ( not ( = ?auto_13544 ?auto_13551 ) ) ( not ( = ?auto_13546 ?auto_13556 ) ) ( not ( = ?auto_13546 ?auto_13553 ) ) ( not ( = ?auto_13546 ?auto_13554 ) ) ( not ( = ?auto_13548 ?auto_13557 ) ) ( not ( = ?auto_13548 ?auto_13559 ) ) ( not ( = ?auto_13548 ?auto_13560 ) ) ( not ( = ?auto_13552 ?auto_13558 ) ) ( not ( = ?auto_13552 ?auto_13555 ) ) ( not ( = ?auto_13552 ?auto_13561 ) ) ( not ( = ?auto_13551 ?auto_13556 ) ) ( not ( = ?auto_13551 ?auto_13553 ) ) ( not ( = ?auto_13551 ?auto_13554 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13542 ?auto_13543 ?auto_13544 ?auto_13545 )
      ( MAKE-1CRATE ?auto_13545 ?auto_13546 )
      ( MAKE-4CRATE-VERIFY ?auto_13542 ?auto_13543 ?auto_13544 ?auto_13545 ?auto_13546 ) )
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
      ?auto_13586 - PLACE
      ?auto_13585 - PLACE
      ?auto_13584 - HOIST
      ?auto_13588 - SURFACE
      ?auto_13595 - SURFACE
      ?auto_13591 - PLACE
      ?auto_13592 - HOIST
      ?auto_13590 - SURFACE
      ?auto_13596 - PLACE
      ?auto_13598 - HOIST
      ?auto_13594 - SURFACE
      ?auto_13599 - PLACE
      ?auto_13597 - HOIST
      ?auto_13593 - SURFACE
      ?auto_13589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13587 ?auto_13586 ) ( IS-CRATE ?auto_13583 ) ( not ( = ?auto_13585 ?auto_13586 ) ) ( HOIST-AT ?auto_13584 ?auto_13585 ) ( SURFACE-AT ?auto_13583 ?auto_13585 ) ( ON ?auto_13583 ?auto_13588 ) ( CLEAR ?auto_13583 ) ( not ( = ?auto_13582 ?auto_13583 ) ) ( not ( = ?auto_13582 ?auto_13588 ) ) ( not ( = ?auto_13583 ?auto_13588 ) ) ( not ( = ?auto_13587 ?auto_13584 ) ) ( IS-CRATE ?auto_13582 ) ( AVAILABLE ?auto_13584 ) ( SURFACE-AT ?auto_13582 ?auto_13585 ) ( ON ?auto_13582 ?auto_13595 ) ( CLEAR ?auto_13582 ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13581 ?auto_13595 ) ) ( not ( = ?auto_13582 ?auto_13595 ) ) ( IS-CRATE ?auto_13581 ) ( not ( = ?auto_13591 ?auto_13586 ) ) ( HOIST-AT ?auto_13592 ?auto_13591 ) ( AVAILABLE ?auto_13592 ) ( SURFACE-AT ?auto_13581 ?auto_13591 ) ( ON ?auto_13581 ?auto_13590 ) ( CLEAR ?auto_13581 ) ( not ( = ?auto_13580 ?auto_13581 ) ) ( not ( = ?auto_13580 ?auto_13590 ) ) ( not ( = ?auto_13581 ?auto_13590 ) ) ( not ( = ?auto_13587 ?auto_13592 ) ) ( IS-CRATE ?auto_13580 ) ( not ( = ?auto_13596 ?auto_13586 ) ) ( HOIST-AT ?auto_13598 ?auto_13596 ) ( AVAILABLE ?auto_13598 ) ( SURFACE-AT ?auto_13580 ?auto_13596 ) ( ON ?auto_13580 ?auto_13594 ) ( CLEAR ?auto_13580 ) ( not ( = ?auto_13579 ?auto_13580 ) ) ( not ( = ?auto_13579 ?auto_13594 ) ) ( not ( = ?auto_13580 ?auto_13594 ) ) ( not ( = ?auto_13587 ?auto_13598 ) ) ( SURFACE-AT ?auto_13578 ?auto_13586 ) ( CLEAR ?auto_13578 ) ( IS-CRATE ?auto_13579 ) ( AVAILABLE ?auto_13587 ) ( not ( = ?auto_13599 ?auto_13586 ) ) ( HOIST-AT ?auto_13597 ?auto_13599 ) ( AVAILABLE ?auto_13597 ) ( SURFACE-AT ?auto_13579 ?auto_13599 ) ( ON ?auto_13579 ?auto_13593 ) ( CLEAR ?auto_13579 ) ( TRUCK-AT ?auto_13589 ?auto_13586 ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13593 ) ) ( not ( = ?auto_13579 ?auto_13593 ) ) ( not ( = ?auto_13587 ?auto_13597 ) ) ( not ( = ?auto_13578 ?auto_13580 ) ) ( not ( = ?auto_13578 ?auto_13594 ) ) ( not ( = ?auto_13580 ?auto_13593 ) ) ( not ( = ?auto_13596 ?auto_13599 ) ) ( not ( = ?auto_13598 ?auto_13597 ) ) ( not ( = ?auto_13594 ?auto_13593 ) ) ( not ( = ?auto_13578 ?auto_13581 ) ) ( not ( = ?auto_13578 ?auto_13590 ) ) ( not ( = ?auto_13579 ?auto_13581 ) ) ( not ( = ?auto_13579 ?auto_13590 ) ) ( not ( = ?auto_13581 ?auto_13594 ) ) ( not ( = ?auto_13581 ?auto_13593 ) ) ( not ( = ?auto_13591 ?auto_13596 ) ) ( not ( = ?auto_13591 ?auto_13599 ) ) ( not ( = ?auto_13592 ?auto_13598 ) ) ( not ( = ?auto_13592 ?auto_13597 ) ) ( not ( = ?auto_13590 ?auto_13594 ) ) ( not ( = ?auto_13590 ?auto_13593 ) ) ( not ( = ?auto_13578 ?auto_13582 ) ) ( not ( = ?auto_13578 ?auto_13595 ) ) ( not ( = ?auto_13579 ?auto_13582 ) ) ( not ( = ?auto_13579 ?auto_13595 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13580 ?auto_13595 ) ) ( not ( = ?auto_13582 ?auto_13590 ) ) ( not ( = ?auto_13582 ?auto_13594 ) ) ( not ( = ?auto_13582 ?auto_13593 ) ) ( not ( = ?auto_13585 ?auto_13591 ) ) ( not ( = ?auto_13585 ?auto_13596 ) ) ( not ( = ?auto_13585 ?auto_13599 ) ) ( not ( = ?auto_13584 ?auto_13592 ) ) ( not ( = ?auto_13584 ?auto_13598 ) ) ( not ( = ?auto_13584 ?auto_13597 ) ) ( not ( = ?auto_13595 ?auto_13590 ) ) ( not ( = ?auto_13595 ?auto_13594 ) ) ( not ( = ?auto_13595 ?auto_13593 ) ) ( not ( = ?auto_13578 ?auto_13583 ) ) ( not ( = ?auto_13578 ?auto_13588 ) ) ( not ( = ?auto_13579 ?auto_13583 ) ) ( not ( = ?auto_13579 ?auto_13588 ) ) ( not ( = ?auto_13580 ?auto_13583 ) ) ( not ( = ?auto_13580 ?auto_13588 ) ) ( not ( = ?auto_13581 ?auto_13583 ) ) ( not ( = ?auto_13581 ?auto_13588 ) ) ( not ( = ?auto_13583 ?auto_13595 ) ) ( not ( = ?auto_13583 ?auto_13590 ) ) ( not ( = ?auto_13583 ?auto_13594 ) ) ( not ( = ?auto_13583 ?auto_13593 ) ) ( not ( = ?auto_13588 ?auto_13595 ) ) ( not ( = ?auto_13588 ?auto_13590 ) ) ( not ( = ?auto_13588 ?auto_13594 ) ) ( not ( = ?auto_13588 ?auto_13593 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13578 ?auto_13579 ?auto_13580 ?auto_13581 ?auto_13582 )
      ( MAKE-1CRATE ?auto_13582 ?auto_13583 )
      ( MAKE-5CRATE-VERIFY ?auto_13578 ?auto_13579 ?auto_13580 ?auto_13581 ?auto_13582 ?auto_13583 ) )
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
      ?auto_13624 - HOIST
      ?auto_13628 - PLACE
      ?auto_13629 - PLACE
      ?auto_13626 - HOIST
      ?auto_13625 - SURFACE
      ?auto_13639 - PLACE
      ?auto_13636 - HOIST
      ?auto_13630 - SURFACE
      ?auto_13641 - SURFACE
      ?auto_13638 - PLACE
      ?auto_13632 - HOIST
      ?auto_13631 - SURFACE
      ?auto_13635 - PLACE
      ?auto_13640 - HOIST
      ?auto_13634 - SURFACE
      ?auto_13637 - PLACE
      ?auto_13642 - HOIST
      ?auto_13633 - SURFACE
      ?auto_13627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13624 ?auto_13628 ) ( IS-CRATE ?auto_13623 ) ( not ( = ?auto_13629 ?auto_13628 ) ) ( HOIST-AT ?auto_13626 ?auto_13629 ) ( AVAILABLE ?auto_13626 ) ( SURFACE-AT ?auto_13623 ?auto_13629 ) ( ON ?auto_13623 ?auto_13625 ) ( CLEAR ?auto_13623 ) ( not ( = ?auto_13622 ?auto_13623 ) ) ( not ( = ?auto_13622 ?auto_13625 ) ) ( not ( = ?auto_13623 ?auto_13625 ) ) ( not ( = ?auto_13624 ?auto_13626 ) ) ( IS-CRATE ?auto_13622 ) ( not ( = ?auto_13639 ?auto_13628 ) ) ( HOIST-AT ?auto_13636 ?auto_13639 ) ( SURFACE-AT ?auto_13622 ?auto_13639 ) ( ON ?auto_13622 ?auto_13630 ) ( CLEAR ?auto_13622 ) ( not ( = ?auto_13621 ?auto_13622 ) ) ( not ( = ?auto_13621 ?auto_13630 ) ) ( not ( = ?auto_13622 ?auto_13630 ) ) ( not ( = ?auto_13624 ?auto_13636 ) ) ( IS-CRATE ?auto_13621 ) ( AVAILABLE ?auto_13636 ) ( SURFACE-AT ?auto_13621 ?auto_13639 ) ( ON ?auto_13621 ?auto_13641 ) ( CLEAR ?auto_13621 ) ( not ( = ?auto_13620 ?auto_13621 ) ) ( not ( = ?auto_13620 ?auto_13641 ) ) ( not ( = ?auto_13621 ?auto_13641 ) ) ( IS-CRATE ?auto_13620 ) ( not ( = ?auto_13638 ?auto_13628 ) ) ( HOIST-AT ?auto_13632 ?auto_13638 ) ( AVAILABLE ?auto_13632 ) ( SURFACE-AT ?auto_13620 ?auto_13638 ) ( ON ?auto_13620 ?auto_13631 ) ( CLEAR ?auto_13620 ) ( not ( = ?auto_13619 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13631 ) ) ( not ( = ?auto_13620 ?auto_13631 ) ) ( not ( = ?auto_13624 ?auto_13632 ) ) ( IS-CRATE ?auto_13619 ) ( not ( = ?auto_13635 ?auto_13628 ) ) ( HOIST-AT ?auto_13640 ?auto_13635 ) ( AVAILABLE ?auto_13640 ) ( SURFACE-AT ?auto_13619 ?auto_13635 ) ( ON ?auto_13619 ?auto_13634 ) ( CLEAR ?auto_13619 ) ( not ( = ?auto_13618 ?auto_13619 ) ) ( not ( = ?auto_13618 ?auto_13634 ) ) ( not ( = ?auto_13619 ?auto_13634 ) ) ( not ( = ?auto_13624 ?auto_13640 ) ) ( SURFACE-AT ?auto_13617 ?auto_13628 ) ( CLEAR ?auto_13617 ) ( IS-CRATE ?auto_13618 ) ( AVAILABLE ?auto_13624 ) ( not ( = ?auto_13637 ?auto_13628 ) ) ( HOIST-AT ?auto_13642 ?auto_13637 ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13618 ?auto_13637 ) ( ON ?auto_13618 ?auto_13633 ) ( CLEAR ?auto_13618 ) ( TRUCK-AT ?auto_13627 ?auto_13628 ) ( not ( = ?auto_13617 ?auto_13618 ) ) ( not ( = ?auto_13617 ?auto_13633 ) ) ( not ( = ?auto_13618 ?auto_13633 ) ) ( not ( = ?auto_13624 ?auto_13642 ) ) ( not ( = ?auto_13617 ?auto_13619 ) ) ( not ( = ?auto_13617 ?auto_13634 ) ) ( not ( = ?auto_13619 ?auto_13633 ) ) ( not ( = ?auto_13635 ?auto_13637 ) ) ( not ( = ?auto_13640 ?auto_13642 ) ) ( not ( = ?auto_13634 ?auto_13633 ) ) ( not ( = ?auto_13617 ?auto_13620 ) ) ( not ( = ?auto_13617 ?auto_13631 ) ) ( not ( = ?auto_13618 ?auto_13620 ) ) ( not ( = ?auto_13618 ?auto_13631 ) ) ( not ( = ?auto_13620 ?auto_13634 ) ) ( not ( = ?auto_13620 ?auto_13633 ) ) ( not ( = ?auto_13638 ?auto_13635 ) ) ( not ( = ?auto_13638 ?auto_13637 ) ) ( not ( = ?auto_13632 ?auto_13640 ) ) ( not ( = ?auto_13632 ?auto_13642 ) ) ( not ( = ?auto_13631 ?auto_13634 ) ) ( not ( = ?auto_13631 ?auto_13633 ) ) ( not ( = ?auto_13617 ?auto_13621 ) ) ( not ( = ?auto_13617 ?auto_13641 ) ) ( not ( = ?auto_13618 ?auto_13621 ) ) ( not ( = ?auto_13618 ?auto_13641 ) ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( not ( = ?auto_13619 ?auto_13641 ) ) ( not ( = ?auto_13621 ?auto_13631 ) ) ( not ( = ?auto_13621 ?auto_13634 ) ) ( not ( = ?auto_13621 ?auto_13633 ) ) ( not ( = ?auto_13639 ?auto_13638 ) ) ( not ( = ?auto_13639 ?auto_13635 ) ) ( not ( = ?auto_13639 ?auto_13637 ) ) ( not ( = ?auto_13636 ?auto_13632 ) ) ( not ( = ?auto_13636 ?auto_13640 ) ) ( not ( = ?auto_13636 ?auto_13642 ) ) ( not ( = ?auto_13641 ?auto_13631 ) ) ( not ( = ?auto_13641 ?auto_13634 ) ) ( not ( = ?auto_13641 ?auto_13633 ) ) ( not ( = ?auto_13617 ?auto_13622 ) ) ( not ( = ?auto_13617 ?auto_13630 ) ) ( not ( = ?auto_13618 ?auto_13622 ) ) ( not ( = ?auto_13618 ?auto_13630 ) ) ( not ( = ?auto_13619 ?auto_13622 ) ) ( not ( = ?auto_13619 ?auto_13630 ) ) ( not ( = ?auto_13620 ?auto_13622 ) ) ( not ( = ?auto_13620 ?auto_13630 ) ) ( not ( = ?auto_13622 ?auto_13641 ) ) ( not ( = ?auto_13622 ?auto_13631 ) ) ( not ( = ?auto_13622 ?auto_13634 ) ) ( not ( = ?auto_13622 ?auto_13633 ) ) ( not ( = ?auto_13630 ?auto_13641 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13634 ) ) ( not ( = ?auto_13630 ?auto_13633 ) ) ( not ( = ?auto_13617 ?auto_13623 ) ) ( not ( = ?auto_13617 ?auto_13625 ) ) ( not ( = ?auto_13618 ?auto_13623 ) ) ( not ( = ?auto_13618 ?auto_13625 ) ) ( not ( = ?auto_13619 ?auto_13623 ) ) ( not ( = ?auto_13619 ?auto_13625 ) ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( not ( = ?auto_13620 ?auto_13625 ) ) ( not ( = ?auto_13621 ?auto_13623 ) ) ( not ( = ?auto_13621 ?auto_13625 ) ) ( not ( = ?auto_13623 ?auto_13630 ) ) ( not ( = ?auto_13623 ?auto_13641 ) ) ( not ( = ?auto_13623 ?auto_13631 ) ) ( not ( = ?auto_13623 ?auto_13634 ) ) ( not ( = ?auto_13623 ?auto_13633 ) ) ( not ( = ?auto_13629 ?auto_13639 ) ) ( not ( = ?auto_13629 ?auto_13638 ) ) ( not ( = ?auto_13629 ?auto_13635 ) ) ( not ( = ?auto_13629 ?auto_13637 ) ) ( not ( = ?auto_13626 ?auto_13636 ) ) ( not ( = ?auto_13626 ?auto_13632 ) ) ( not ( = ?auto_13626 ?auto_13640 ) ) ( not ( = ?auto_13626 ?auto_13642 ) ) ( not ( = ?auto_13625 ?auto_13630 ) ) ( not ( = ?auto_13625 ?auto_13641 ) ) ( not ( = ?auto_13625 ?auto_13631 ) ) ( not ( = ?auto_13625 ?auto_13634 ) ) ( not ( = ?auto_13625 ?auto_13633 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13620 ?auto_13621 ?auto_13622 )
      ( MAKE-1CRATE ?auto_13622 ?auto_13623 )
      ( MAKE-6CRATE-VERIFY ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13620 ?auto_13621 ?auto_13622 ?auto_13623 ) )
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
      ?auto_13669 - HOIST
      ?auto_13674 - PLACE
      ?auto_13671 - PLACE
      ?auto_13673 - HOIST
      ?auto_13672 - SURFACE
      ?auto_13689 - PLACE
      ?auto_13676 - HOIST
      ?auto_13685 - SURFACE
      ?auto_13678 - PLACE
      ?auto_13681 - HOIST
      ?auto_13687 - SURFACE
      ?auto_13682 - SURFACE
      ?auto_13683 - PLACE
      ?auto_13679 - HOIST
      ?auto_13677 - SURFACE
      ?auto_13686 - PLACE
      ?auto_13684 - HOIST
      ?auto_13690 - SURFACE
      ?auto_13688 - PLACE
      ?auto_13675 - HOIST
      ?auto_13680 - SURFACE
      ?auto_13670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13669 ?auto_13674 ) ( IS-CRATE ?auto_13668 ) ( not ( = ?auto_13671 ?auto_13674 ) ) ( HOIST-AT ?auto_13673 ?auto_13671 ) ( AVAILABLE ?auto_13673 ) ( SURFACE-AT ?auto_13668 ?auto_13671 ) ( ON ?auto_13668 ?auto_13672 ) ( CLEAR ?auto_13668 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13672 ) ) ( not ( = ?auto_13668 ?auto_13672 ) ) ( not ( = ?auto_13669 ?auto_13673 ) ) ( IS-CRATE ?auto_13667 ) ( not ( = ?auto_13689 ?auto_13674 ) ) ( HOIST-AT ?auto_13676 ?auto_13689 ) ( AVAILABLE ?auto_13676 ) ( SURFACE-AT ?auto_13667 ?auto_13689 ) ( ON ?auto_13667 ?auto_13685 ) ( CLEAR ?auto_13667 ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13685 ) ) ( not ( = ?auto_13667 ?auto_13685 ) ) ( not ( = ?auto_13669 ?auto_13676 ) ) ( IS-CRATE ?auto_13666 ) ( not ( = ?auto_13678 ?auto_13674 ) ) ( HOIST-AT ?auto_13681 ?auto_13678 ) ( SURFACE-AT ?auto_13666 ?auto_13678 ) ( ON ?auto_13666 ?auto_13687 ) ( CLEAR ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13687 ) ) ( not ( = ?auto_13666 ?auto_13687 ) ) ( not ( = ?auto_13669 ?auto_13681 ) ) ( IS-CRATE ?auto_13665 ) ( AVAILABLE ?auto_13681 ) ( SURFACE-AT ?auto_13665 ?auto_13678 ) ( ON ?auto_13665 ?auto_13682 ) ( CLEAR ?auto_13665 ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13682 ) ) ( not ( = ?auto_13665 ?auto_13682 ) ) ( IS-CRATE ?auto_13664 ) ( not ( = ?auto_13683 ?auto_13674 ) ) ( HOIST-AT ?auto_13679 ?auto_13683 ) ( AVAILABLE ?auto_13679 ) ( SURFACE-AT ?auto_13664 ?auto_13683 ) ( ON ?auto_13664 ?auto_13677 ) ( CLEAR ?auto_13664 ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13663 ?auto_13677 ) ) ( not ( = ?auto_13664 ?auto_13677 ) ) ( not ( = ?auto_13669 ?auto_13679 ) ) ( IS-CRATE ?auto_13663 ) ( not ( = ?auto_13686 ?auto_13674 ) ) ( HOIST-AT ?auto_13684 ?auto_13686 ) ( AVAILABLE ?auto_13684 ) ( SURFACE-AT ?auto_13663 ?auto_13686 ) ( ON ?auto_13663 ?auto_13690 ) ( CLEAR ?auto_13663 ) ( not ( = ?auto_13662 ?auto_13663 ) ) ( not ( = ?auto_13662 ?auto_13690 ) ) ( not ( = ?auto_13663 ?auto_13690 ) ) ( not ( = ?auto_13669 ?auto_13684 ) ) ( SURFACE-AT ?auto_13661 ?auto_13674 ) ( CLEAR ?auto_13661 ) ( IS-CRATE ?auto_13662 ) ( AVAILABLE ?auto_13669 ) ( not ( = ?auto_13688 ?auto_13674 ) ) ( HOIST-AT ?auto_13675 ?auto_13688 ) ( AVAILABLE ?auto_13675 ) ( SURFACE-AT ?auto_13662 ?auto_13688 ) ( ON ?auto_13662 ?auto_13680 ) ( CLEAR ?auto_13662 ) ( TRUCK-AT ?auto_13670 ?auto_13674 ) ( not ( = ?auto_13661 ?auto_13662 ) ) ( not ( = ?auto_13661 ?auto_13680 ) ) ( not ( = ?auto_13662 ?auto_13680 ) ) ( not ( = ?auto_13669 ?auto_13675 ) ) ( not ( = ?auto_13661 ?auto_13663 ) ) ( not ( = ?auto_13661 ?auto_13690 ) ) ( not ( = ?auto_13663 ?auto_13680 ) ) ( not ( = ?auto_13686 ?auto_13688 ) ) ( not ( = ?auto_13684 ?auto_13675 ) ) ( not ( = ?auto_13690 ?auto_13680 ) ) ( not ( = ?auto_13661 ?auto_13664 ) ) ( not ( = ?auto_13661 ?auto_13677 ) ) ( not ( = ?auto_13662 ?auto_13664 ) ) ( not ( = ?auto_13662 ?auto_13677 ) ) ( not ( = ?auto_13664 ?auto_13690 ) ) ( not ( = ?auto_13664 ?auto_13680 ) ) ( not ( = ?auto_13683 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13688 ) ) ( not ( = ?auto_13679 ?auto_13684 ) ) ( not ( = ?auto_13679 ?auto_13675 ) ) ( not ( = ?auto_13677 ?auto_13690 ) ) ( not ( = ?auto_13677 ?auto_13680 ) ) ( not ( = ?auto_13661 ?auto_13665 ) ) ( not ( = ?auto_13661 ?auto_13682 ) ) ( not ( = ?auto_13662 ?auto_13665 ) ) ( not ( = ?auto_13662 ?auto_13682 ) ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( not ( = ?auto_13663 ?auto_13682 ) ) ( not ( = ?auto_13665 ?auto_13677 ) ) ( not ( = ?auto_13665 ?auto_13690 ) ) ( not ( = ?auto_13665 ?auto_13680 ) ) ( not ( = ?auto_13678 ?auto_13683 ) ) ( not ( = ?auto_13678 ?auto_13686 ) ) ( not ( = ?auto_13678 ?auto_13688 ) ) ( not ( = ?auto_13681 ?auto_13679 ) ) ( not ( = ?auto_13681 ?auto_13684 ) ) ( not ( = ?auto_13681 ?auto_13675 ) ) ( not ( = ?auto_13682 ?auto_13677 ) ) ( not ( = ?auto_13682 ?auto_13690 ) ) ( not ( = ?auto_13682 ?auto_13680 ) ) ( not ( = ?auto_13661 ?auto_13666 ) ) ( not ( = ?auto_13661 ?auto_13687 ) ) ( not ( = ?auto_13662 ?auto_13666 ) ) ( not ( = ?auto_13662 ?auto_13687 ) ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( not ( = ?auto_13663 ?auto_13687 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13687 ) ) ( not ( = ?auto_13666 ?auto_13682 ) ) ( not ( = ?auto_13666 ?auto_13677 ) ) ( not ( = ?auto_13666 ?auto_13690 ) ) ( not ( = ?auto_13666 ?auto_13680 ) ) ( not ( = ?auto_13687 ?auto_13682 ) ) ( not ( = ?auto_13687 ?auto_13677 ) ) ( not ( = ?auto_13687 ?auto_13690 ) ) ( not ( = ?auto_13687 ?auto_13680 ) ) ( not ( = ?auto_13661 ?auto_13667 ) ) ( not ( = ?auto_13661 ?auto_13685 ) ) ( not ( = ?auto_13662 ?auto_13667 ) ) ( not ( = ?auto_13662 ?auto_13685 ) ) ( not ( = ?auto_13663 ?auto_13667 ) ) ( not ( = ?auto_13663 ?auto_13685 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13664 ?auto_13685 ) ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13685 ) ) ( not ( = ?auto_13667 ?auto_13687 ) ) ( not ( = ?auto_13667 ?auto_13682 ) ) ( not ( = ?auto_13667 ?auto_13677 ) ) ( not ( = ?auto_13667 ?auto_13690 ) ) ( not ( = ?auto_13667 ?auto_13680 ) ) ( not ( = ?auto_13689 ?auto_13678 ) ) ( not ( = ?auto_13689 ?auto_13683 ) ) ( not ( = ?auto_13689 ?auto_13686 ) ) ( not ( = ?auto_13689 ?auto_13688 ) ) ( not ( = ?auto_13676 ?auto_13681 ) ) ( not ( = ?auto_13676 ?auto_13679 ) ) ( not ( = ?auto_13676 ?auto_13684 ) ) ( not ( = ?auto_13676 ?auto_13675 ) ) ( not ( = ?auto_13685 ?auto_13687 ) ) ( not ( = ?auto_13685 ?auto_13682 ) ) ( not ( = ?auto_13685 ?auto_13677 ) ) ( not ( = ?auto_13685 ?auto_13690 ) ) ( not ( = ?auto_13685 ?auto_13680 ) ) ( not ( = ?auto_13661 ?auto_13668 ) ) ( not ( = ?auto_13661 ?auto_13672 ) ) ( not ( = ?auto_13662 ?auto_13668 ) ) ( not ( = ?auto_13662 ?auto_13672 ) ) ( not ( = ?auto_13663 ?auto_13668 ) ) ( not ( = ?auto_13663 ?auto_13672 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13672 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13672 ) ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13666 ?auto_13672 ) ) ( not ( = ?auto_13668 ?auto_13685 ) ) ( not ( = ?auto_13668 ?auto_13687 ) ) ( not ( = ?auto_13668 ?auto_13682 ) ) ( not ( = ?auto_13668 ?auto_13677 ) ) ( not ( = ?auto_13668 ?auto_13690 ) ) ( not ( = ?auto_13668 ?auto_13680 ) ) ( not ( = ?auto_13671 ?auto_13689 ) ) ( not ( = ?auto_13671 ?auto_13678 ) ) ( not ( = ?auto_13671 ?auto_13683 ) ) ( not ( = ?auto_13671 ?auto_13686 ) ) ( not ( = ?auto_13671 ?auto_13688 ) ) ( not ( = ?auto_13673 ?auto_13676 ) ) ( not ( = ?auto_13673 ?auto_13681 ) ) ( not ( = ?auto_13673 ?auto_13679 ) ) ( not ( = ?auto_13673 ?auto_13684 ) ) ( not ( = ?auto_13673 ?auto_13675 ) ) ( not ( = ?auto_13672 ?auto_13685 ) ) ( not ( = ?auto_13672 ?auto_13687 ) ) ( not ( = ?auto_13672 ?auto_13682 ) ) ( not ( = ?auto_13672 ?auto_13677 ) ) ( not ( = ?auto_13672 ?auto_13690 ) ) ( not ( = ?auto_13672 ?auto_13680 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13661 ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 )
      ( MAKE-1CRATE ?auto_13667 ?auto_13668 )
      ( MAKE-7CRATE-VERIFY ?auto_13661 ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ) )
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
      ?auto_13717 - SURFACE
      ?auto_13718 - SURFACE
    )
    :vars
    (
      ?auto_13722 - HOIST
      ?auto_13721 - PLACE
      ?auto_13720 - PLACE
      ?auto_13723 - HOIST
      ?auto_13724 - SURFACE
      ?auto_13728 - PLACE
      ?auto_13743 - HOIST
      ?auto_13727 - SURFACE
      ?auto_13740 - PLACE
      ?auto_13742 - HOIST
      ?auto_13731 - SURFACE
      ?auto_13730 - PLACE
      ?auto_13735 - HOIST
      ?auto_13733 - SURFACE
      ?auto_13732 - SURFACE
      ?auto_13729 - PLACE
      ?auto_13725 - HOIST
      ?auto_13739 - SURFACE
      ?auto_13734 - PLACE
      ?auto_13738 - HOIST
      ?auto_13741 - SURFACE
      ?auto_13726 - PLACE
      ?auto_13736 - HOIST
      ?auto_13737 - SURFACE
      ?auto_13719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13722 ?auto_13721 ) ( IS-CRATE ?auto_13718 ) ( not ( = ?auto_13720 ?auto_13721 ) ) ( HOIST-AT ?auto_13723 ?auto_13720 ) ( AVAILABLE ?auto_13723 ) ( SURFACE-AT ?auto_13718 ?auto_13720 ) ( ON ?auto_13718 ?auto_13724 ) ( CLEAR ?auto_13718 ) ( not ( = ?auto_13717 ?auto_13718 ) ) ( not ( = ?auto_13717 ?auto_13724 ) ) ( not ( = ?auto_13718 ?auto_13724 ) ) ( not ( = ?auto_13722 ?auto_13723 ) ) ( IS-CRATE ?auto_13717 ) ( not ( = ?auto_13728 ?auto_13721 ) ) ( HOIST-AT ?auto_13743 ?auto_13728 ) ( AVAILABLE ?auto_13743 ) ( SURFACE-AT ?auto_13717 ?auto_13728 ) ( ON ?auto_13717 ?auto_13727 ) ( CLEAR ?auto_13717 ) ( not ( = ?auto_13716 ?auto_13717 ) ) ( not ( = ?auto_13716 ?auto_13727 ) ) ( not ( = ?auto_13717 ?auto_13727 ) ) ( not ( = ?auto_13722 ?auto_13743 ) ) ( IS-CRATE ?auto_13716 ) ( not ( = ?auto_13740 ?auto_13721 ) ) ( HOIST-AT ?auto_13742 ?auto_13740 ) ( AVAILABLE ?auto_13742 ) ( SURFACE-AT ?auto_13716 ?auto_13740 ) ( ON ?auto_13716 ?auto_13731 ) ( CLEAR ?auto_13716 ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( not ( = ?auto_13715 ?auto_13731 ) ) ( not ( = ?auto_13716 ?auto_13731 ) ) ( not ( = ?auto_13722 ?auto_13742 ) ) ( IS-CRATE ?auto_13715 ) ( not ( = ?auto_13730 ?auto_13721 ) ) ( HOIST-AT ?auto_13735 ?auto_13730 ) ( SURFACE-AT ?auto_13715 ?auto_13730 ) ( ON ?auto_13715 ?auto_13733 ) ( CLEAR ?auto_13715 ) ( not ( = ?auto_13714 ?auto_13715 ) ) ( not ( = ?auto_13714 ?auto_13733 ) ) ( not ( = ?auto_13715 ?auto_13733 ) ) ( not ( = ?auto_13722 ?auto_13735 ) ) ( IS-CRATE ?auto_13714 ) ( AVAILABLE ?auto_13735 ) ( SURFACE-AT ?auto_13714 ?auto_13730 ) ( ON ?auto_13714 ?auto_13732 ) ( CLEAR ?auto_13714 ) ( not ( = ?auto_13713 ?auto_13714 ) ) ( not ( = ?auto_13713 ?auto_13732 ) ) ( not ( = ?auto_13714 ?auto_13732 ) ) ( IS-CRATE ?auto_13713 ) ( not ( = ?auto_13729 ?auto_13721 ) ) ( HOIST-AT ?auto_13725 ?auto_13729 ) ( AVAILABLE ?auto_13725 ) ( SURFACE-AT ?auto_13713 ?auto_13729 ) ( ON ?auto_13713 ?auto_13739 ) ( CLEAR ?auto_13713 ) ( not ( = ?auto_13712 ?auto_13713 ) ) ( not ( = ?auto_13712 ?auto_13739 ) ) ( not ( = ?auto_13713 ?auto_13739 ) ) ( not ( = ?auto_13722 ?auto_13725 ) ) ( IS-CRATE ?auto_13712 ) ( not ( = ?auto_13734 ?auto_13721 ) ) ( HOIST-AT ?auto_13738 ?auto_13734 ) ( AVAILABLE ?auto_13738 ) ( SURFACE-AT ?auto_13712 ?auto_13734 ) ( ON ?auto_13712 ?auto_13741 ) ( CLEAR ?auto_13712 ) ( not ( = ?auto_13711 ?auto_13712 ) ) ( not ( = ?auto_13711 ?auto_13741 ) ) ( not ( = ?auto_13712 ?auto_13741 ) ) ( not ( = ?auto_13722 ?auto_13738 ) ) ( SURFACE-AT ?auto_13710 ?auto_13721 ) ( CLEAR ?auto_13710 ) ( IS-CRATE ?auto_13711 ) ( AVAILABLE ?auto_13722 ) ( not ( = ?auto_13726 ?auto_13721 ) ) ( HOIST-AT ?auto_13736 ?auto_13726 ) ( AVAILABLE ?auto_13736 ) ( SURFACE-AT ?auto_13711 ?auto_13726 ) ( ON ?auto_13711 ?auto_13737 ) ( CLEAR ?auto_13711 ) ( TRUCK-AT ?auto_13719 ?auto_13721 ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13737 ) ) ( not ( = ?auto_13711 ?auto_13737 ) ) ( not ( = ?auto_13722 ?auto_13736 ) ) ( not ( = ?auto_13710 ?auto_13712 ) ) ( not ( = ?auto_13710 ?auto_13741 ) ) ( not ( = ?auto_13712 ?auto_13737 ) ) ( not ( = ?auto_13734 ?auto_13726 ) ) ( not ( = ?auto_13738 ?auto_13736 ) ) ( not ( = ?auto_13741 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13713 ) ) ( not ( = ?auto_13710 ?auto_13739 ) ) ( not ( = ?auto_13711 ?auto_13713 ) ) ( not ( = ?auto_13711 ?auto_13739 ) ) ( not ( = ?auto_13713 ?auto_13741 ) ) ( not ( = ?auto_13713 ?auto_13737 ) ) ( not ( = ?auto_13729 ?auto_13734 ) ) ( not ( = ?auto_13729 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13738 ) ) ( not ( = ?auto_13725 ?auto_13736 ) ) ( not ( = ?auto_13739 ?auto_13741 ) ) ( not ( = ?auto_13739 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13714 ) ) ( not ( = ?auto_13710 ?auto_13732 ) ) ( not ( = ?auto_13711 ?auto_13714 ) ) ( not ( = ?auto_13711 ?auto_13732 ) ) ( not ( = ?auto_13712 ?auto_13714 ) ) ( not ( = ?auto_13712 ?auto_13732 ) ) ( not ( = ?auto_13714 ?auto_13739 ) ) ( not ( = ?auto_13714 ?auto_13741 ) ) ( not ( = ?auto_13714 ?auto_13737 ) ) ( not ( = ?auto_13730 ?auto_13729 ) ) ( not ( = ?auto_13730 ?auto_13734 ) ) ( not ( = ?auto_13730 ?auto_13726 ) ) ( not ( = ?auto_13735 ?auto_13725 ) ) ( not ( = ?auto_13735 ?auto_13738 ) ) ( not ( = ?auto_13735 ?auto_13736 ) ) ( not ( = ?auto_13732 ?auto_13739 ) ) ( not ( = ?auto_13732 ?auto_13741 ) ) ( not ( = ?auto_13732 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13715 ) ) ( not ( = ?auto_13710 ?auto_13733 ) ) ( not ( = ?auto_13711 ?auto_13715 ) ) ( not ( = ?auto_13711 ?auto_13733 ) ) ( not ( = ?auto_13712 ?auto_13715 ) ) ( not ( = ?auto_13712 ?auto_13733 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) ( not ( = ?auto_13713 ?auto_13733 ) ) ( not ( = ?auto_13715 ?auto_13732 ) ) ( not ( = ?auto_13715 ?auto_13739 ) ) ( not ( = ?auto_13715 ?auto_13741 ) ) ( not ( = ?auto_13715 ?auto_13737 ) ) ( not ( = ?auto_13733 ?auto_13732 ) ) ( not ( = ?auto_13733 ?auto_13739 ) ) ( not ( = ?auto_13733 ?auto_13741 ) ) ( not ( = ?auto_13733 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13716 ) ) ( not ( = ?auto_13710 ?auto_13731 ) ) ( not ( = ?auto_13711 ?auto_13716 ) ) ( not ( = ?auto_13711 ?auto_13731 ) ) ( not ( = ?auto_13712 ?auto_13716 ) ) ( not ( = ?auto_13712 ?auto_13731 ) ) ( not ( = ?auto_13713 ?auto_13716 ) ) ( not ( = ?auto_13713 ?auto_13731 ) ) ( not ( = ?auto_13714 ?auto_13716 ) ) ( not ( = ?auto_13714 ?auto_13731 ) ) ( not ( = ?auto_13716 ?auto_13733 ) ) ( not ( = ?auto_13716 ?auto_13732 ) ) ( not ( = ?auto_13716 ?auto_13739 ) ) ( not ( = ?auto_13716 ?auto_13741 ) ) ( not ( = ?auto_13716 ?auto_13737 ) ) ( not ( = ?auto_13740 ?auto_13730 ) ) ( not ( = ?auto_13740 ?auto_13729 ) ) ( not ( = ?auto_13740 ?auto_13734 ) ) ( not ( = ?auto_13740 ?auto_13726 ) ) ( not ( = ?auto_13742 ?auto_13735 ) ) ( not ( = ?auto_13742 ?auto_13725 ) ) ( not ( = ?auto_13742 ?auto_13738 ) ) ( not ( = ?auto_13742 ?auto_13736 ) ) ( not ( = ?auto_13731 ?auto_13733 ) ) ( not ( = ?auto_13731 ?auto_13732 ) ) ( not ( = ?auto_13731 ?auto_13739 ) ) ( not ( = ?auto_13731 ?auto_13741 ) ) ( not ( = ?auto_13731 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13717 ) ) ( not ( = ?auto_13710 ?auto_13727 ) ) ( not ( = ?auto_13711 ?auto_13717 ) ) ( not ( = ?auto_13711 ?auto_13727 ) ) ( not ( = ?auto_13712 ?auto_13717 ) ) ( not ( = ?auto_13712 ?auto_13727 ) ) ( not ( = ?auto_13713 ?auto_13717 ) ) ( not ( = ?auto_13713 ?auto_13727 ) ) ( not ( = ?auto_13714 ?auto_13717 ) ) ( not ( = ?auto_13714 ?auto_13727 ) ) ( not ( = ?auto_13715 ?auto_13717 ) ) ( not ( = ?auto_13715 ?auto_13727 ) ) ( not ( = ?auto_13717 ?auto_13731 ) ) ( not ( = ?auto_13717 ?auto_13733 ) ) ( not ( = ?auto_13717 ?auto_13732 ) ) ( not ( = ?auto_13717 ?auto_13739 ) ) ( not ( = ?auto_13717 ?auto_13741 ) ) ( not ( = ?auto_13717 ?auto_13737 ) ) ( not ( = ?auto_13728 ?auto_13740 ) ) ( not ( = ?auto_13728 ?auto_13730 ) ) ( not ( = ?auto_13728 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13734 ) ) ( not ( = ?auto_13728 ?auto_13726 ) ) ( not ( = ?auto_13743 ?auto_13742 ) ) ( not ( = ?auto_13743 ?auto_13735 ) ) ( not ( = ?auto_13743 ?auto_13725 ) ) ( not ( = ?auto_13743 ?auto_13738 ) ) ( not ( = ?auto_13743 ?auto_13736 ) ) ( not ( = ?auto_13727 ?auto_13731 ) ) ( not ( = ?auto_13727 ?auto_13733 ) ) ( not ( = ?auto_13727 ?auto_13732 ) ) ( not ( = ?auto_13727 ?auto_13739 ) ) ( not ( = ?auto_13727 ?auto_13741 ) ) ( not ( = ?auto_13727 ?auto_13737 ) ) ( not ( = ?auto_13710 ?auto_13718 ) ) ( not ( = ?auto_13710 ?auto_13724 ) ) ( not ( = ?auto_13711 ?auto_13718 ) ) ( not ( = ?auto_13711 ?auto_13724 ) ) ( not ( = ?auto_13712 ?auto_13718 ) ) ( not ( = ?auto_13712 ?auto_13724 ) ) ( not ( = ?auto_13713 ?auto_13718 ) ) ( not ( = ?auto_13713 ?auto_13724 ) ) ( not ( = ?auto_13714 ?auto_13718 ) ) ( not ( = ?auto_13714 ?auto_13724 ) ) ( not ( = ?auto_13715 ?auto_13718 ) ) ( not ( = ?auto_13715 ?auto_13724 ) ) ( not ( = ?auto_13716 ?auto_13718 ) ) ( not ( = ?auto_13716 ?auto_13724 ) ) ( not ( = ?auto_13718 ?auto_13727 ) ) ( not ( = ?auto_13718 ?auto_13731 ) ) ( not ( = ?auto_13718 ?auto_13733 ) ) ( not ( = ?auto_13718 ?auto_13732 ) ) ( not ( = ?auto_13718 ?auto_13739 ) ) ( not ( = ?auto_13718 ?auto_13741 ) ) ( not ( = ?auto_13718 ?auto_13737 ) ) ( not ( = ?auto_13720 ?auto_13728 ) ) ( not ( = ?auto_13720 ?auto_13740 ) ) ( not ( = ?auto_13720 ?auto_13730 ) ) ( not ( = ?auto_13720 ?auto_13729 ) ) ( not ( = ?auto_13720 ?auto_13734 ) ) ( not ( = ?auto_13720 ?auto_13726 ) ) ( not ( = ?auto_13723 ?auto_13743 ) ) ( not ( = ?auto_13723 ?auto_13742 ) ) ( not ( = ?auto_13723 ?auto_13735 ) ) ( not ( = ?auto_13723 ?auto_13725 ) ) ( not ( = ?auto_13723 ?auto_13738 ) ) ( not ( = ?auto_13723 ?auto_13736 ) ) ( not ( = ?auto_13724 ?auto_13727 ) ) ( not ( = ?auto_13724 ?auto_13731 ) ) ( not ( = ?auto_13724 ?auto_13733 ) ) ( not ( = ?auto_13724 ?auto_13732 ) ) ( not ( = ?auto_13724 ?auto_13739 ) ) ( not ( = ?auto_13724 ?auto_13741 ) ) ( not ( = ?auto_13724 ?auto_13737 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13710 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13714 ?auto_13715 ?auto_13716 ?auto_13717 )
      ( MAKE-1CRATE ?auto_13717 ?auto_13718 )
      ( MAKE-8CRATE-VERIFY ?auto_13710 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13714 ?auto_13715 ?auto_13716 ?auto_13717 ?auto_13718 ) )
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
      ?auto_13771 - SURFACE
      ?auto_13772 - SURFACE
      ?auto_13773 - SURFACE
    )
    :vars
    (
      ?auto_13775 - HOIST
      ?auto_13777 - PLACE
      ?auto_13774 - PLACE
      ?auto_13779 - HOIST
      ?auto_13776 - SURFACE
      ?auto_13790 - PLACE
      ?auto_13799 - HOIST
      ?auto_13794 - SURFACE
      ?auto_13789 - PLACE
      ?auto_13784 - HOIST
      ?auto_13788 - SURFACE
      ?auto_13783 - PLACE
      ?auto_13786 - HOIST
      ?auto_13792 - SURFACE
      ?auto_13800 - PLACE
      ?auto_13801 - HOIST
      ?auto_13782 - SURFACE
      ?auto_13787 - SURFACE
      ?auto_13797 - PLACE
      ?auto_13795 - HOIST
      ?auto_13796 - SURFACE
      ?auto_13791 - PLACE
      ?auto_13780 - HOIST
      ?auto_13798 - SURFACE
      ?auto_13781 - PLACE
      ?auto_13785 - HOIST
      ?auto_13793 - SURFACE
      ?auto_13778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13775 ?auto_13777 ) ( IS-CRATE ?auto_13773 ) ( not ( = ?auto_13774 ?auto_13777 ) ) ( HOIST-AT ?auto_13779 ?auto_13774 ) ( AVAILABLE ?auto_13779 ) ( SURFACE-AT ?auto_13773 ?auto_13774 ) ( ON ?auto_13773 ?auto_13776 ) ( CLEAR ?auto_13773 ) ( not ( = ?auto_13772 ?auto_13773 ) ) ( not ( = ?auto_13772 ?auto_13776 ) ) ( not ( = ?auto_13773 ?auto_13776 ) ) ( not ( = ?auto_13775 ?auto_13779 ) ) ( IS-CRATE ?auto_13772 ) ( not ( = ?auto_13790 ?auto_13777 ) ) ( HOIST-AT ?auto_13799 ?auto_13790 ) ( AVAILABLE ?auto_13799 ) ( SURFACE-AT ?auto_13772 ?auto_13790 ) ( ON ?auto_13772 ?auto_13794 ) ( CLEAR ?auto_13772 ) ( not ( = ?auto_13771 ?auto_13772 ) ) ( not ( = ?auto_13771 ?auto_13794 ) ) ( not ( = ?auto_13772 ?auto_13794 ) ) ( not ( = ?auto_13775 ?auto_13799 ) ) ( IS-CRATE ?auto_13771 ) ( not ( = ?auto_13789 ?auto_13777 ) ) ( HOIST-AT ?auto_13784 ?auto_13789 ) ( AVAILABLE ?auto_13784 ) ( SURFACE-AT ?auto_13771 ?auto_13789 ) ( ON ?auto_13771 ?auto_13788 ) ( CLEAR ?auto_13771 ) ( not ( = ?auto_13770 ?auto_13771 ) ) ( not ( = ?auto_13770 ?auto_13788 ) ) ( not ( = ?auto_13771 ?auto_13788 ) ) ( not ( = ?auto_13775 ?auto_13784 ) ) ( IS-CRATE ?auto_13770 ) ( not ( = ?auto_13783 ?auto_13777 ) ) ( HOIST-AT ?auto_13786 ?auto_13783 ) ( AVAILABLE ?auto_13786 ) ( SURFACE-AT ?auto_13770 ?auto_13783 ) ( ON ?auto_13770 ?auto_13792 ) ( CLEAR ?auto_13770 ) ( not ( = ?auto_13769 ?auto_13770 ) ) ( not ( = ?auto_13769 ?auto_13792 ) ) ( not ( = ?auto_13770 ?auto_13792 ) ) ( not ( = ?auto_13775 ?auto_13786 ) ) ( IS-CRATE ?auto_13769 ) ( not ( = ?auto_13800 ?auto_13777 ) ) ( HOIST-AT ?auto_13801 ?auto_13800 ) ( SURFACE-AT ?auto_13769 ?auto_13800 ) ( ON ?auto_13769 ?auto_13782 ) ( CLEAR ?auto_13769 ) ( not ( = ?auto_13768 ?auto_13769 ) ) ( not ( = ?auto_13768 ?auto_13782 ) ) ( not ( = ?auto_13769 ?auto_13782 ) ) ( not ( = ?auto_13775 ?auto_13801 ) ) ( IS-CRATE ?auto_13768 ) ( AVAILABLE ?auto_13801 ) ( SURFACE-AT ?auto_13768 ?auto_13800 ) ( ON ?auto_13768 ?auto_13787 ) ( CLEAR ?auto_13768 ) ( not ( = ?auto_13767 ?auto_13768 ) ) ( not ( = ?auto_13767 ?auto_13787 ) ) ( not ( = ?auto_13768 ?auto_13787 ) ) ( IS-CRATE ?auto_13767 ) ( not ( = ?auto_13797 ?auto_13777 ) ) ( HOIST-AT ?auto_13795 ?auto_13797 ) ( AVAILABLE ?auto_13795 ) ( SURFACE-AT ?auto_13767 ?auto_13797 ) ( ON ?auto_13767 ?auto_13796 ) ( CLEAR ?auto_13767 ) ( not ( = ?auto_13766 ?auto_13767 ) ) ( not ( = ?auto_13766 ?auto_13796 ) ) ( not ( = ?auto_13767 ?auto_13796 ) ) ( not ( = ?auto_13775 ?auto_13795 ) ) ( IS-CRATE ?auto_13766 ) ( not ( = ?auto_13791 ?auto_13777 ) ) ( HOIST-AT ?auto_13780 ?auto_13791 ) ( AVAILABLE ?auto_13780 ) ( SURFACE-AT ?auto_13766 ?auto_13791 ) ( ON ?auto_13766 ?auto_13798 ) ( CLEAR ?auto_13766 ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13798 ) ) ( not ( = ?auto_13766 ?auto_13798 ) ) ( not ( = ?auto_13775 ?auto_13780 ) ) ( SURFACE-AT ?auto_13764 ?auto_13777 ) ( CLEAR ?auto_13764 ) ( IS-CRATE ?auto_13765 ) ( AVAILABLE ?auto_13775 ) ( not ( = ?auto_13781 ?auto_13777 ) ) ( HOIST-AT ?auto_13785 ?auto_13781 ) ( AVAILABLE ?auto_13785 ) ( SURFACE-AT ?auto_13765 ?auto_13781 ) ( ON ?auto_13765 ?auto_13793 ) ( CLEAR ?auto_13765 ) ( TRUCK-AT ?auto_13778 ?auto_13777 ) ( not ( = ?auto_13764 ?auto_13765 ) ) ( not ( = ?auto_13764 ?auto_13793 ) ) ( not ( = ?auto_13765 ?auto_13793 ) ) ( not ( = ?auto_13775 ?auto_13785 ) ) ( not ( = ?auto_13764 ?auto_13766 ) ) ( not ( = ?auto_13764 ?auto_13798 ) ) ( not ( = ?auto_13766 ?auto_13793 ) ) ( not ( = ?auto_13791 ?auto_13781 ) ) ( not ( = ?auto_13780 ?auto_13785 ) ) ( not ( = ?auto_13798 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13767 ) ) ( not ( = ?auto_13764 ?auto_13796 ) ) ( not ( = ?auto_13765 ?auto_13767 ) ) ( not ( = ?auto_13765 ?auto_13796 ) ) ( not ( = ?auto_13767 ?auto_13798 ) ) ( not ( = ?auto_13767 ?auto_13793 ) ) ( not ( = ?auto_13797 ?auto_13791 ) ) ( not ( = ?auto_13797 ?auto_13781 ) ) ( not ( = ?auto_13795 ?auto_13780 ) ) ( not ( = ?auto_13795 ?auto_13785 ) ) ( not ( = ?auto_13796 ?auto_13798 ) ) ( not ( = ?auto_13796 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13768 ) ) ( not ( = ?auto_13764 ?auto_13787 ) ) ( not ( = ?auto_13765 ?auto_13768 ) ) ( not ( = ?auto_13765 ?auto_13787 ) ) ( not ( = ?auto_13766 ?auto_13768 ) ) ( not ( = ?auto_13766 ?auto_13787 ) ) ( not ( = ?auto_13768 ?auto_13796 ) ) ( not ( = ?auto_13768 ?auto_13798 ) ) ( not ( = ?auto_13768 ?auto_13793 ) ) ( not ( = ?auto_13800 ?auto_13797 ) ) ( not ( = ?auto_13800 ?auto_13791 ) ) ( not ( = ?auto_13800 ?auto_13781 ) ) ( not ( = ?auto_13801 ?auto_13795 ) ) ( not ( = ?auto_13801 ?auto_13780 ) ) ( not ( = ?auto_13801 ?auto_13785 ) ) ( not ( = ?auto_13787 ?auto_13796 ) ) ( not ( = ?auto_13787 ?auto_13798 ) ) ( not ( = ?auto_13787 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13769 ) ) ( not ( = ?auto_13764 ?auto_13782 ) ) ( not ( = ?auto_13765 ?auto_13769 ) ) ( not ( = ?auto_13765 ?auto_13782 ) ) ( not ( = ?auto_13766 ?auto_13769 ) ) ( not ( = ?auto_13766 ?auto_13782 ) ) ( not ( = ?auto_13767 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13782 ) ) ( not ( = ?auto_13769 ?auto_13787 ) ) ( not ( = ?auto_13769 ?auto_13796 ) ) ( not ( = ?auto_13769 ?auto_13798 ) ) ( not ( = ?auto_13769 ?auto_13793 ) ) ( not ( = ?auto_13782 ?auto_13787 ) ) ( not ( = ?auto_13782 ?auto_13796 ) ) ( not ( = ?auto_13782 ?auto_13798 ) ) ( not ( = ?auto_13782 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13770 ) ) ( not ( = ?auto_13764 ?auto_13792 ) ) ( not ( = ?auto_13765 ?auto_13770 ) ) ( not ( = ?auto_13765 ?auto_13792 ) ) ( not ( = ?auto_13766 ?auto_13770 ) ) ( not ( = ?auto_13766 ?auto_13792 ) ) ( not ( = ?auto_13767 ?auto_13770 ) ) ( not ( = ?auto_13767 ?auto_13792 ) ) ( not ( = ?auto_13768 ?auto_13770 ) ) ( not ( = ?auto_13768 ?auto_13792 ) ) ( not ( = ?auto_13770 ?auto_13782 ) ) ( not ( = ?auto_13770 ?auto_13787 ) ) ( not ( = ?auto_13770 ?auto_13796 ) ) ( not ( = ?auto_13770 ?auto_13798 ) ) ( not ( = ?auto_13770 ?auto_13793 ) ) ( not ( = ?auto_13783 ?auto_13800 ) ) ( not ( = ?auto_13783 ?auto_13797 ) ) ( not ( = ?auto_13783 ?auto_13791 ) ) ( not ( = ?auto_13783 ?auto_13781 ) ) ( not ( = ?auto_13786 ?auto_13801 ) ) ( not ( = ?auto_13786 ?auto_13795 ) ) ( not ( = ?auto_13786 ?auto_13780 ) ) ( not ( = ?auto_13786 ?auto_13785 ) ) ( not ( = ?auto_13792 ?auto_13782 ) ) ( not ( = ?auto_13792 ?auto_13787 ) ) ( not ( = ?auto_13792 ?auto_13796 ) ) ( not ( = ?auto_13792 ?auto_13798 ) ) ( not ( = ?auto_13792 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13771 ) ) ( not ( = ?auto_13764 ?auto_13788 ) ) ( not ( = ?auto_13765 ?auto_13771 ) ) ( not ( = ?auto_13765 ?auto_13788 ) ) ( not ( = ?auto_13766 ?auto_13771 ) ) ( not ( = ?auto_13766 ?auto_13788 ) ) ( not ( = ?auto_13767 ?auto_13771 ) ) ( not ( = ?auto_13767 ?auto_13788 ) ) ( not ( = ?auto_13768 ?auto_13771 ) ) ( not ( = ?auto_13768 ?auto_13788 ) ) ( not ( = ?auto_13769 ?auto_13771 ) ) ( not ( = ?auto_13769 ?auto_13788 ) ) ( not ( = ?auto_13771 ?auto_13792 ) ) ( not ( = ?auto_13771 ?auto_13782 ) ) ( not ( = ?auto_13771 ?auto_13787 ) ) ( not ( = ?auto_13771 ?auto_13796 ) ) ( not ( = ?auto_13771 ?auto_13798 ) ) ( not ( = ?auto_13771 ?auto_13793 ) ) ( not ( = ?auto_13789 ?auto_13783 ) ) ( not ( = ?auto_13789 ?auto_13800 ) ) ( not ( = ?auto_13789 ?auto_13797 ) ) ( not ( = ?auto_13789 ?auto_13791 ) ) ( not ( = ?auto_13789 ?auto_13781 ) ) ( not ( = ?auto_13784 ?auto_13786 ) ) ( not ( = ?auto_13784 ?auto_13801 ) ) ( not ( = ?auto_13784 ?auto_13795 ) ) ( not ( = ?auto_13784 ?auto_13780 ) ) ( not ( = ?auto_13784 ?auto_13785 ) ) ( not ( = ?auto_13788 ?auto_13792 ) ) ( not ( = ?auto_13788 ?auto_13782 ) ) ( not ( = ?auto_13788 ?auto_13787 ) ) ( not ( = ?auto_13788 ?auto_13796 ) ) ( not ( = ?auto_13788 ?auto_13798 ) ) ( not ( = ?auto_13788 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13772 ) ) ( not ( = ?auto_13764 ?auto_13794 ) ) ( not ( = ?auto_13765 ?auto_13772 ) ) ( not ( = ?auto_13765 ?auto_13794 ) ) ( not ( = ?auto_13766 ?auto_13772 ) ) ( not ( = ?auto_13766 ?auto_13794 ) ) ( not ( = ?auto_13767 ?auto_13772 ) ) ( not ( = ?auto_13767 ?auto_13794 ) ) ( not ( = ?auto_13768 ?auto_13772 ) ) ( not ( = ?auto_13768 ?auto_13794 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( not ( = ?auto_13769 ?auto_13794 ) ) ( not ( = ?auto_13770 ?auto_13772 ) ) ( not ( = ?auto_13770 ?auto_13794 ) ) ( not ( = ?auto_13772 ?auto_13788 ) ) ( not ( = ?auto_13772 ?auto_13792 ) ) ( not ( = ?auto_13772 ?auto_13782 ) ) ( not ( = ?auto_13772 ?auto_13787 ) ) ( not ( = ?auto_13772 ?auto_13796 ) ) ( not ( = ?auto_13772 ?auto_13798 ) ) ( not ( = ?auto_13772 ?auto_13793 ) ) ( not ( = ?auto_13790 ?auto_13789 ) ) ( not ( = ?auto_13790 ?auto_13783 ) ) ( not ( = ?auto_13790 ?auto_13800 ) ) ( not ( = ?auto_13790 ?auto_13797 ) ) ( not ( = ?auto_13790 ?auto_13791 ) ) ( not ( = ?auto_13790 ?auto_13781 ) ) ( not ( = ?auto_13799 ?auto_13784 ) ) ( not ( = ?auto_13799 ?auto_13786 ) ) ( not ( = ?auto_13799 ?auto_13801 ) ) ( not ( = ?auto_13799 ?auto_13795 ) ) ( not ( = ?auto_13799 ?auto_13780 ) ) ( not ( = ?auto_13799 ?auto_13785 ) ) ( not ( = ?auto_13794 ?auto_13788 ) ) ( not ( = ?auto_13794 ?auto_13792 ) ) ( not ( = ?auto_13794 ?auto_13782 ) ) ( not ( = ?auto_13794 ?auto_13787 ) ) ( not ( = ?auto_13794 ?auto_13796 ) ) ( not ( = ?auto_13794 ?auto_13798 ) ) ( not ( = ?auto_13794 ?auto_13793 ) ) ( not ( = ?auto_13764 ?auto_13773 ) ) ( not ( = ?auto_13764 ?auto_13776 ) ) ( not ( = ?auto_13765 ?auto_13773 ) ) ( not ( = ?auto_13765 ?auto_13776 ) ) ( not ( = ?auto_13766 ?auto_13773 ) ) ( not ( = ?auto_13766 ?auto_13776 ) ) ( not ( = ?auto_13767 ?auto_13773 ) ) ( not ( = ?auto_13767 ?auto_13776 ) ) ( not ( = ?auto_13768 ?auto_13773 ) ) ( not ( = ?auto_13768 ?auto_13776 ) ) ( not ( = ?auto_13769 ?auto_13773 ) ) ( not ( = ?auto_13769 ?auto_13776 ) ) ( not ( = ?auto_13770 ?auto_13773 ) ) ( not ( = ?auto_13770 ?auto_13776 ) ) ( not ( = ?auto_13771 ?auto_13773 ) ) ( not ( = ?auto_13771 ?auto_13776 ) ) ( not ( = ?auto_13773 ?auto_13794 ) ) ( not ( = ?auto_13773 ?auto_13788 ) ) ( not ( = ?auto_13773 ?auto_13792 ) ) ( not ( = ?auto_13773 ?auto_13782 ) ) ( not ( = ?auto_13773 ?auto_13787 ) ) ( not ( = ?auto_13773 ?auto_13796 ) ) ( not ( = ?auto_13773 ?auto_13798 ) ) ( not ( = ?auto_13773 ?auto_13793 ) ) ( not ( = ?auto_13774 ?auto_13790 ) ) ( not ( = ?auto_13774 ?auto_13789 ) ) ( not ( = ?auto_13774 ?auto_13783 ) ) ( not ( = ?auto_13774 ?auto_13800 ) ) ( not ( = ?auto_13774 ?auto_13797 ) ) ( not ( = ?auto_13774 ?auto_13791 ) ) ( not ( = ?auto_13774 ?auto_13781 ) ) ( not ( = ?auto_13779 ?auto_13799 ) ) ( not ( = ?auto_13779 ?auto_13784 ) ) ( not ( = ?auto_13779 ?auto_13786 ) ) ( not ( = ?auto_13779 ?auto_13801 ) ) ( not ( = ?auto_13779 ?auto_13795 ) ) ( not ( = ?auto_13779 ?auto_13780 ) ) ( not ( = ?auto_13779 ?auto_13785 ) ) ( not ( = ?auto_13776 ?auto_13794 ) ) ( not ( = ?auto_13776 ?auto_13788 ) ) ( not ( = ?auto_13776 ?auto_13792 ) ) ( not ( = ?auto_13776 ?auto_13782 ) ) ( not ( = ?auto_13776 ?auto_13787 ) ) ( not ( = ?auto_13776 ?auto_13796 ) ) ( not ( = ?auto_13776 ?auto_13798 ) ) ( not ( = ?auto_13776 ?auto_13793 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13764 ?auto_13765 ?auto_13766 ?auto_13767 ?auto_13768 ?auto_13769 ?auto_13770 ?auto_13771 ?auto_13772 )
      ( MAKE-1CRATE ?auto_13772 ?auto_13773 )
      ( MAKE-9CRATE-VERIFY ?auto_13764 ?auto_13765 ?auto_13766 ?auto_13767 ?auto_13768 ?auto_13769 ?auto_13770 ?auto_13771 ?auto_13772 ?auto_13773 ) )
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
      ?auto_13830 - SURFACE
      ?auto_13831 - SURFACE
      ?auto_13832 - SURFACE
      ?auto_13833 - SURFACE
    )
    :vars
    (
      ?auto_13837 - HOIST
      ?auto_13838 - PLACE
      ?auto_13834 - PLACE
      ?auto_13839 - HOIST
      ?auto_13836 - SURFACE
      ?auto_13848 - PLACE
      ?auto_13847 - HOIST
      ?auto_13850 - SURFACE
      ?auto_13852 - PLACE
      ?auto_13846 - HOIST
      ?auto_13860 - SURFACE
      ?auto_13861 - PLACE
      ?auto_13845 - HOIST
      ?auto_13863 - SURFACE
      ?auto_13864 - PLACE
      ?auto_13862 - HOIST
      ?auto_13857 - SURFACE
      ?auto_13842 - PLACE
      ?auto_13843 - HOIST
      ?auto_13844 - SURFACE
      ?auto_13853 - SURFACE
      ?auto_13851 - PLACE
      ?auto_13854 - HOIST
      ?auto_13840 - SURFACE
      ?auto_13858 - PLACE
      ?auto_13855 - HOIST
      ?auto_13849 - SURFACE
      ?auto_13856 - PLACE
      ?auto_13859 - HOIST
      ?auto_13841 - SURFACE
      ?auto_13835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13837 ?auto_13838 ) ( IS-CRATE ?auto_13833 ) ( not ( = ?auto_13834 ?auto_13838 ) ) ( HOIST-AT ?auto_13839 ?auto_13834 ) ( AVAILABLE ?auto_13839 ) ( SURFACE-AT ?auto_13833 ?auto_13834 ) ( ON ?auto_13833 ?auto_13836 ) ( CLEAR ?auto_13833 ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13836 ) ) ( not ( = ?auto_13833 ?auto_13836 ) ) ( not ( = ?auto_13837 ?auto_13839 ) ) ( IS-CRATE ?auto_13832 ) ( not ( = ?auto_13848 ?auto_13838 ) ) ( HOIST-AT ?auto_13847 ?auto_13848 ) ( AVAILABLE ?auto_13847 ) ( SURFACE-AT ?auto_13832 ?auto_13848 ) ( ON ?auto_13832 ?auto_13850 ) ( CLEAR ?auto_13832 ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( not ( = ?auto_13831 ?auto_13850 ) ) ( not ( = ?auto_13832 ?auto_13850 ) ) ( not ( = ?auto_13837 ?auto_13847 ) ) ( IS-CRATE ?auto_13831 ) ( not ( = ?auto_13852 ?auto_13838 ) ) ( HOIST-AT ?auto_13846 ?auto_13852 ) ( AVAILABLE ?auto_13846 ) ( SURFACE-AT ?auto_13831 ?auto_13852 ) ( ON ?auto_13831 ?auto_13860 ) ( CLEAR ?auto_13831 ) ( not ( = ?auto_13830 ?auto_13831 ) ) ( not ( = ?auto_13830 ?auto_13860 ) ) ( not ( = ?auto_13831 ?auto_13860 ) ) ( not ( = ?auto_13837 ?auto_13846 ) ) ( IS-CRATE ?auto_13830 ) ( not ( = ?auto_13861 ?auto_13838 ) ) ( HOIST-AT ?auto_13845 ?auto_13861 ) ( AVAILABLE ?auto_13845 ) ( SURFACE-AT ?auto_13830 ?auto_13861 ) ( ON ?auto_13830 ?auto_13863 ) ( CLEAR ?auto_13830 ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13863 ) ) ( not ( = ?auto_13830 ?auto_13863 ) ) ( not ( = ?auto_13837 ?auto_13845 ) ) ( IS-CRATE ?auto_13829 ) ( not ( = ?auto_13864 ?auto_13838 ) ) ( HOIST-AT ?auto_13862 ?auto_13864 ) ( AVAILABLE ?auto_13862 ) ( SURFACE-AT ?auto_13829 ?auto_13864 ) ( ON ?auto_13829 ?auto_13857 ) ( CLEAR ?auto_13829 ) ( not ( = ?auto_13828 ?auto_13829 ) ) ( not ( = ?auto_13828 ?auto_13857 ) ) ( not ( = ?auto_13829 ?auto_13857 ) ) ( not ( = ?auto_13837 ?auto_13862 ) ) ( IS-CRATE ?auto_13828 ) ( not ( = ?auto_13842 ?auto_13838 ) ) ( HOIST-AT ?auto_13843 ?auto_13842 ) ( SURFACE-AT ?auto_13828 ?auto_13842 ) ( ON ?auto_13828 ?auto_13844 ) ( CLEAR ?auto_13828 ) ( not ( = ?auto_13827 ?auto_13828 ) ) ( not ( = ?auto_13827 ?auto_13844 ) ) ( not ( = ?auto_13828 ?auto_13844 ) ) ( not ( = ?auto_13837 ?auto_13843 ) ) ( IS-CRATE ?auto_13827 ) ( AVAILABLE ?auto_13843 ) ( SURFACE-AT ?auto_13827 ?auto_13842 ) ( ON ?auto_13827 ?auto_13853 ) ( CLEAR ?auto_13827 ) ( not ( = ?auto_13826 ?auto_13827 ) ) ( not ( = ?auto_13826 ?auto_13853 ) ) ( not ( = ?auto_13827 ?auto_13853 ) ) ( IS-CRATE ?auto_13826 ) ( not ( = ?auto_13851 ?auto_13838 ) ) ( HOIST-AT ?auto_13854 ?auto_13851 ) ( AVAILABLE ?auto_13854 ) ( SURFACE-AT ?auto_13826 ?auto_13851 ) ( ON ?auto_13826 ?auto_13840 ) ( CLEAR ?auto_13826 ) ( not ( = ?auto_13825 ?auto_13826 ) ) ( not ( = ?auto_13825 ?auto_13840 ) ) ( not ( = ?auto_13826 ?auto_13840 ) ) ( not ( = ?auto_13837 ?auto_13854 ) ) ( IS-CRATE ?auto_13825 ) ( not ( = ?auto_13858 ?auto_13838 ) ) ( HOIST-AT ?auto_13855 ?auto_13858 ) ( AVAILABLE ?auto_13855 ) ( SURFACE-AT ?auto_13825 ?auto_13858 ) ( ON ?auto_13825 ?auto_13849 ) ( CLEAR ?auto_13825 ) ( not ( = ?auto_13824 ?auto_13825 ) ) ( not ( = ?auto_13824 ?auto_13849 ) ) ( not ( = ?auto_13825 ?auto_13849 ) ) ( not ( = ?auto_13837 ?auto_13855 ) ) ( SURFACE-AT ?auto_13823 ?auto_13838 ) ( CLEAR ?auto_13823 ) ( IS-CRATE ?auto_13824 ) ( AVAILABLE ?auto_13837 ) ( not ( = ?auto_13856 ?auto_13838 ) ) ( HOIST-AT ?auto_13859 ?auto_13856 ) ( AVAILABLE ?auto_13859 ) ( SURFACE-AT ?auto_13824 ?auto_13856 ) ( ON ?auto_13824 ?auto_13841 ) ( CLEAR ?auto_13824 ) ( TRUCK-AT ?auto_13835 ?auto_13838 ) ( not ( = ?auto_13823 ?auto_13824 ) ) ( not ( = ?auto_13823 ?auto_13841 ) ) ( not ( = ?auto_13824 ?auto_13841 ) ) ( not ( = ?auto_13837 ?auto_13859 ) ) ( not ( = ?auto_13823 ?auto_13825 ) ) ( not ( = ?auto_13823 ?auto_13849 ) ) ( not ( = ?auto_13825 ?auto_13841 ) ) ( not ( = ?auto_13858 ?auto_13856 ) ) ( not ( = ?auto_13855 ?auto_13859 ) ) ( not ( = ?auto_13849 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13826 ) ) ( not ( = ?auto_13823 ?auto_13840 ) ) ( not ( = ?auto_13824 ?auto_13826 ) ) ( not ( = ?auto_13824 ?auto_13840 ) ) ( not ( = ?auto_13826 ?auto_13849 ) ) ( not ( = ?auto_13826 ?auto_13841 ) ) ( not ( = ?auto_13851 ?auto_13858 ) ) ( not ( = ?auto_13851 ?auto_13856 ) ) ( not ( = ?auto_13854 ?auto_13855 ) ) ( not ( = ?auto_13854 ?auto_13859 ) ) ( not ( = ?auto_13840 ?auto_13849 ) ) ( not ( = ?auto_13840 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13827 ) ) ( not ( = ?auto_13823 ?auto_13853 ) ) ( not ( = ?auto_13824 ?auto_13827 ) ) ( not ( = ?auto_13824 ?auto_13853 ) ) ( not ( = ?auto_13825 ?auto_13827 ) ) ( not ( = ?auto_13825 ?auto_13853 ) ) ( not ( = ?auto_13827 ?auto_13840 ) ) ( not ( = ?auto_13827 ?auto_13849 ) ) ( not ( = ?auto_13827 ?auto_13841 ) ) ( not ( = ?auto_13842 ?auto_13851 ) ) ( not ( = ?auto_13842 ?auto_13858 ) ) ( not ( = ?auto_13842 ?auto_13856 ) ) ( not ( = ?auto_13843 ?auto_13854 ) ) ( not ( = ?auto_13843 ?auto_13855 ) ) ( not ( = ?auto_13843 ?auto_13859 ) ) ( not ( = ?auto_13853 ?auto_13840 ) ) ( not ( = ?auto_13853 ?auto_13849 ) ) ( not ( = ?auto_13853 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13828 ) ) ( not ( = ?auto_13823 ?auto_13844 ) ) ( not ( = ?auto_13824 ?auto_13828 ) ) ( not ( = ?auto_13824 ?auto_13844 ) ) ( not ( = ?auto_13825 ?auto_13828 ) ) ( not ( = ?auto_13825 ?auto_13844 ) ) ( not ( = ?auto_13826 ?auto_13828 ) ) ( not ( = ?auto_13826 ?auto_13844 ) ) ( not ( = ?auto_13828 ?auto_13853 ) ) ( not ( = ?auto_13828 ?auto_13840 ) ) ( not ( = ?auto_13828 ?auto_13849 ) ) ( not ( = ?auto_13828 ?auto_13841 ) ) ( not ( = ?auto_13844 ?auto_13853 ) ) ( not ( = ?auto_13844 ?auto_13840 ) ) ( not ( = ?auto_13844 ?auto_13849 ) ) ( not ( = ?auto_13844 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13829 ) ) ( not ( = ?auto_13823 ?auto_13857 ) ) ( not ( = ?auto_13824 ?auto_13829 ) ) ( not ( = ?auto_13824 ?auto_13857 ) ) ( not ( = ?auto_13825 ?auto_13829 ) ) ( not ( = ?auto_13825 ?auto_13857 ) ) ( not ( = ?auto_13826 ?auto_13829 ) ) ( not ( = ?auto_13826 ?auto_13857 ) ) ( not ( = ?auto_13827 ?auto_13829 ) ) ( not ( = ?auto_13827 ?auto_13857 ) ) ( not ( = ?auto_13829 ?auto_13844 ) ) ( not ( = ?auto_13829 ?auto_13853 ) ) ( not ( = ?auto_13829 ?auto_13840 ) ) ( not ( = ?auto_13829 ?auto_13849 ) ) ( not ( = ?auto_13829 ?auto_13841 ) ) ( not ( = ?auto_13864 ?auto_13842 ) ) ( not ( = ?auto_13864 ?auto_13851 ) ) ( not ( = ?auto_13864 ?auto_13858 ) ) ( not ( = ?auto_13864 ?auto_13856 ) ) ( not ( = ?auto_13862 ?auto_13843 ) ) ( not ( = ?auto_13862 ?auto_13854 ) ) ( not ( = ?auto_13862 ?auto_13855 ) ) ( not ( = ?auto_13862 ?auto_13859 ) ) ( not ( = ?auto_13857 ?auto_13844 ) ) ( not ( = ?auto_13857 ?auto_13853 ) ) ( not ( = ?auto_13857 ?auto_13840 ) ) ( not ( = ?auto_13857 ?auto_13849 ) ) ( not ( = ?auto_13857 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13830 ) ) ( not ( = ?auto_13823 ?auto_13863 ) ) ( not ( = ?auto_13824 ?auto_13830 ) ) ( not ( = ?auto_13824 ?auto_13863 ) ) ( not ( = ?auto_13825 ?auto_13830 ) ) ( not ( = ?auto_13825 ?auto_13863 ) ) ( not ( = ?auto_13826 ?auto_13830 ) ) ( not ( = ?auto_13826 ?auto_13863 ) ) ( not ( = ?auto_13827 ?auto_13830 ) ) ( not ( = ?auto_13827 ?auto_13863 ) ) ( not ( = ?auto_13828 ?auto_13830 ) ) ( not ( = ?auto_13828 ?auto_13863 ) ) ( not ( = ?auto_13830 ?auto_13857 ) ) ( not ( = ?auto_13830 ?auto_13844 ) ) ( not ( = ?auto_13830 ?auto_13853 ) ) ( not ( = ?auto_13830 ?auto_13840 ) ) ( not ( = ?auto_13830 ?auto_13849 ) ) ( not ( = ?auto_13830 ?auto_13841 ) ) ( not ( = ?auto_13861 ?auto_13864 ) ) ( not ( = ?auto_13861 ?auto_13842 ) ) ( not ( = ?auto_13861 ?auto_13851 ) ) ( not ( = ?auto_13861 ?auto_13858 ) ) ( not ( = ?auto_13861 ?auto_13856 ) ) ( not ( = ?auto_13845 ?auto_13862 ) ) ( not ( = ?auto_13845 ?auto_13843 ) ) ( not ( = ?auto_13845 ?auto_13854 ) ) ( not ( = ?auto_13845 ?auto_13855 ) ) ( not ( = ?auto_13845 ?auto_13859 ) ) ( not ( = ?auto_13863 ?auto_13857 ) ) ( not ( = ?auto_13863 ?auto_13844 ) ) ( not ( = ?auto_13863 ?auto_13853 ) ) ( not ( = ?auto_13863 ?auto_13840 ) ) ( not ( = ?auto_13863 ?auto_13849 ) ) ( not ( = ?auto_13863 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13831 ) ) ( not ( = ?auto_13823 ?auto_13860 ) ) ( not ( = ?auto_13824 ?auto_13831 ) ) ( not ( = ?auto_13824 ?auto_13860 ) ) ( not ( = ?auto_13825 ?auto_13831 ) ) ( not ( = ?auto_13825 ?auto_13860 ) ) ( not ( = ?auto_13826 ?auto_13831 ) ) ( not ( = ?auto_13826 ?auto_13860 ) ) ( not ( = ?auto_13827 ?auto_13831 ) ) ( not ( = ?auto_13827 ?auto_13860 ) ) ( not ( = ?auto_13828 ?auto_13831 ) ) ( not ( = ?auto_13828 ?auto_13860 ) ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13829 ?auto_13860 ) ) ( not ( = ?auto_13831 ?auto_13863 ) ) ( not ( = ?auto_13831 ?auto_13857 ) ) ( not ( = ?auto_13831 ?auto_13844 ) ) ( not ( = ?auto_13831 ?auto_13853 ) ) ( not ( = ?auto_13831 ?auto_13840 ) ) ( not ( = ?auto_13831 ?auto_13849 ) ) ( not ( = ?auto_13831 ?auto_13841 ) ) ( not ( = ?auto_13852 ?auto_13861 ) ) ( not ( = ?auto_13852 ?auto_13864 ) ) ( not ( = ?auto_13852 ?auto_13842 ) ) ( not ( = ?auto_13852 ?auto_13851 ) ) ( not ( = ?auto_13852 ?auto_13858 ) ) ( not ( = ?auto_13852 ?auto_13856 ) ) ( not ( = ?auto_13846 ?auto_13845 ) ) ( not ( = ?auto_13846 ?auto_13862 ) ) ( not ( = ?auto_13846 ?auto_13843 ) ) ( not ( = ?auto_13846 ?auto_13854 ) ) ( not ( = ?auto_13846 ?auto_13855 ) ) ( not ( = ?auto_13846 ?auto_13859 ) ) ( not ( = ?auto_13860 ?auto_13863 ) ) ( not ( = ?auto_13860 ?auto_13857 ) ) ( not ( = ?auto_13860 ?auto_13844 ) ) ( not ( = ?auto_13860 ?auto_13853 ) ) ( not ( = ?auto_13860 ?auto_13840 ) ) ( not ( = ?auto_13860 ?auto_13849 ) ) ( not ( = ?auto_13860 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13832 ) ) ( not ( = ?auto_13823 ?auto_13850 ) ) ( not ( = ?auto_13824 ?auto_13832 ) ) ( not ( = ?auto_13824 ?auto_13850 ) ) ( not ( = ?auto_13825 ?auto_13832 ) ) ( not ( = ?auto_13825 ?auto_13850 ) ) ( not ( = ?auto_13826 ?auto_13832 ) ) ( not ( = ?auto_13826 ?auto_13850 ) ) ( not ( = ?auto_13827 ?auto_13832 ) ) ( not ( = ?auto_13827 ?auto_13850 ) ) ( not ( = ?auto_13828 ?auto_13832 ) ) ( not ( = ?auto_13828 ?auto_13850 ) ) ( not ( = ?auto_13829 ?auto_13832 ) ) ( not ( = ?auto_13829 ?auto_13850 ) ) ( not ( = ?auto_13830 ?auto_13832 ) ) ( not ( = ?auto_13830 ?auto_13850 ) ) ( not ( = ?auto_13832 ?auto_13860 ) ) ( not ( = ?auto_13832 ?auto_13863 ) ) ( not ( = ?auto_13832 ?auto_13857 ) ) ( not ( = ?auto_13832 ?auto_13844 ) ) ( not ( = ?auto_13832 ?auto_13853 ) ) ( not ( = ?auto_13832 ?auto_13840 ) ) ( not ( = ?auto_13832 ?auto_13849 ) ) ( not ( = ?auto_13832 ?auto_13841 ) ) ( not ( = ?auto_13848 ?auto_13852 ) ) ( not ( = ?auto_13848 ?auto_13861 ) ) ( not ( = ?auto_13848 ?auto_13864 ) ) ( not ( = ?auto_13848 ?auto_13842 ) ) ( not ( = ?auto_13848 ?auto_13851 ) ) ( not ( = ?auto_13848 ?auto_13858 ) ) ( not ( = ?auto_13848 ?auto_13856 ) ) ( not ( = ?auto_13847 ?auto_13846 ) ) ( not ( = ?auto_13847 ?auto_13845 ) ) ( not ( = ?auto_13847 ?auto_13862 ) ) ( not ( = ?auto_13847 ?auto_13843 ) ) ( not ( = ?auto_13847 ?auto_13854 ) ) ( not ( = ?auto_13847 ?auto_13855 ) ) ( not ( = ?auto_13847 ?auto_13859 ) ) ( not ( = ?auto_13850 ?auto_13860 ) ) ( not ( = ?auto_13850 ?auto_13863 ) ) ( not ( = ?auto_13850 ?auto_13857 ) ) ( not ( = ?auto_13850 ?auto_13844 ) ) ( not ( = ?auto_13850 ?auto_13853 ) ) ( not ( = ?auto_13850 ?auto_13840 ) ) ( not ( = ?auto_13850 ?auto_13849 ) ) ( not ( = ?auto_13850 ?auto_13841 ) ) ( not ( = ?auto_13823 ?auto_13833 ) ) ( not ( = ?auto_13823 ?auto_13836 ) ) ( not ( = ?auto_13824 ?auto_13833 ) ) ( not ( = ?auto_13824 ?auto_13836 ) ) ( not ( = ?auto_13825 ?auto_13833 ) ) ( not ( = ?auto_13825 ?auto_13836 ) ) ( not ( = ?auto_13826 ?auto_13833 ) ) ( not ( = ?auto_13826 ?auto_13836 ) ) ( not ( = ?auto_13827 ?auto_13833 ) ) ( not ( = ?auto_13827 ?auto_13836 ) ) ( not ( = ?auto_13828 ?auto_13833 ) ) ( not ( = ?auto_13828 ?auto_13836 ) ) ( not ( = ?auto_13829 ?auto_13833 ) ) ( not ( = ?auto_13829 ?auto_13836 ) ) ( not ( = ?auto_13830 ?auto_13833 ) ) ( not ( = ?auto_13830 ?auto_13836 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13831 ?auto_13836 ) ) ( not ( = ?auto_13833 ?auto_13850 ) ) ( not ( = ?auto_13833 ?auto_13860 ) ) ( not ( = ?auto_13833 ?auto_13863 ) ) ( not ( = ?auto_13833 ?auto_13857 ) ) ( not ( = ?auto_13833 ?auto_13844 ) ) ( not ( = ?auto_13833 ?auto_13853 ) ) ( not ( = ?auto_13833 ?auto_13840 ) ) ( not ( = ?auto_13833 ?auto_13849 ) ) ( not ( = ?auto_13833 ?auto_13841 ) ) ( not ( = ?auto_13834 ?auto_13848 ) ) ( not ( = ?auto_13834 ?auto_13852 ) ) ( not ( = ?auto_13834 ?auto_13861 ) ) ( not ( = ?auto_13834 ?auto_13864 ) ) ( not ( = ?auto_13834 ?auto_13842 ) ) ( not ( = ?auto_13834 ?auto_13851 ) ) ( not ( = ?auto_13834 ?auto_13858 ) ) ( not ( = ?auto_13834 ?auto_13856 ) ) ( not ( = ?auto_13839 ?auto_13847 ) ) ( not ( = ?auto_13839 ?auto_13846 ) ) ( not ( = ?auto_13839 ?auto_13845 ) ) ( not ( = ?auto_13839 ?auto_13862 ) ) ( not ( = ?auto_13839 ?auto_13843 ) ) ( not ( = ?auto_13839 ?auto_13854 ) ) ( not ( = ?auto_13839 ?auto_13855 ) ) ( not ( = ?auto_13839 ?auto_13859 ) ) ( not ( = ?auto_13836 ?auto_13850 ) ) ( not ( = ?auto_13836 ?auto_13860 ) ) ( not ( = ?auto_13836 ?auto_13863 ) ) ( not ( = ?auto_13836 ?auto_13857 ) ) ( not ( = ?auto_13836 ?auto_13844 ) ) ( not ( = ?auto_13836 ?auto_13853 ) ) ( not ( = ?auto_13836 ?auto_13840 ) ) ( not ( = ?auto_13836 ?auto_13849 ) ) ( not ( = ?auto_13836 ?auto_13841 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13823 ?auto_13824 ?auto_13825 ?auto_13826 ?auto_13827 ?auto_13828 ?auto_13829 ?auto_13830 ?auto_13831 ?auto_13832 )
      ( MAKE-1CRATE ?auto_13832 ?auto_13833 )
      ( MAKE-10CRATE-VERIFY ?auto_13823 ?auto_13824 ?auto_13825 ?auto_13826 ?auto_13827 ?auto_13828 ?auto_13829 ?auto_13830 ?auto_13831 ?auto_13832 ?auto_13833 ) )
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
      ?auto_13894 - SURFACE
      ?auto_13895 - SURFACE
      ?auto_13896 - SURFACE
      ?auto_13897 - SURFACE
      ?auto_13898 - SURFACE
    )
    :vars
    (
      ?auto_13903 - HOIST
      ?auto_13904 - PLACE
      ?auto_13901 - PLACE
      ?auto_13900 - HOIST
      ?auto_13902 - SURFACE
      ?auto_13917 - PLACE
      ?auto_13918 - HOIST
      ?auto_13925 - SURFACE
      ?auto_13926 - PLACE
      ?auto_13909 - HOIST
      ?auto_13920 - SURFACE
      ?auto_13913 - PLACE
      ?auto_13930 - HOIST
      ?auto_13927 - SURFACE
      ?auto_13924 - PLACE
      ?auto_13922 - HOIST
      ?auto_13914 - SURFACE
      ?auto_13928 - PLACE
      ?auto_13916 - HOIST
      ?auto_13910 - SURFACE
      ?auto_13906 - PLACE
      ?auto_13923 - HOIST
      ?auto_13908 - SURFACE
      ?auto_13929 - SURFACE
      ?auto_13905 - PLACE
      ?auto_13915 - HOIST
      ?auto_13907 - SURFACE
      ?auto_13921 - SURFACE
      ?auto_13911 - PLACE
      ?auto_13919 - HOIST
      ?auto_13912 - SURFACE
      ?auto_13899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13903 ?auto_13904 ) ( IS-CRATE ?auto_13898 ) ( not ( = ?auto_13901 ?auto_13904 ) ) ( HOIST-AT ?auto_13900 ?auto_13901 ) ( SURFACE-AT ?auto_13898 ?auto_13901 ) ( ON ?auto_13898 ?auto_13902 ) ( CLEAR ?auto_13898 ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13897 ?auto_13902 ) ) ( not ( = ?auto_13898 ?auto_13902 ) ) ( not ( = ?auto_13903 ?auto_13900 ) ) ( IS-CRATE ?auto_13897 ) ( not ( = ?auto_13917 ?auto_13904 ) ) ( HOIST-AT ?auto_13918 ?auto_13917 ) ( AVAILABLE ?auto_13918 ) ( SURFACE-AT ?auto_13897 ?auto_13917 ) ( ON ?auto_13897 ?auto_13925 ) ( CLEAR ?auto_13897 ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13925 ) ) ( not ( = ?auto_13897 ?auto_13925 ) ) ( not ( = ?auto_13903 ?auto_13918 ) ) ( IS-CRATE ?auto_13896 ) ( not ( = ?auto_13926 ?auto_13904 ) ) ( HOIST-AT ?auto_13909 ?auto_13926 ) ( AVAILABLE ?auto_13909 ) ( SURFACE-AT ?auto_13896 ?auto_13926 ) ( ON ?auto_13896 ?auto_13920 ) ( CLEAR ?auto_13896 ) ( not ( = ?auto_13895 ?auto_13896 ) ) ( not ( = ?auto_13895 ?auto_13920 ) ) ( not ( = ?auto_13896 ?auto_13920 ) ) ( not ( = ?auto_13903 ?auto_13909 ) ) ( IS-CRATE ?auto_13895 ) ( not ( = ?auto_13913 ?auto_13904 ) ) ( HOIST-AT ?auto_13930 ?auto_13913 ) ( AVAILABLE ?auto_13930 ) ( SURFACE-AT ?auto_13895 ?auto_13913 ) ( ON ?auto_13895 ?auto_13927 ) ( CLEAR ?auto_13895 ) ( not ( = ?auto_13894 ?auto_13895 ) ) ( not ( = ?auto_13894 ?auto_13927 ) ) ( not ( = ?auto_13895 ?auto_13927 ) ) ( not ( = ?auto_13903 ?auto_13930 ) ) ( IS-CRATE ?auto_13894 ) ( not ( = ?auto_13924 ?auto_13904 ) ) ( HOIST-AT ?auto_13922 ?auto_13924 ) ( AVAILABLE ?auto_13922 ) ( SURFACE-AT ?auto_13894 ?auto_13924 ) ( ON ?auto_13894 ?auto_13914 ) ( CLEAR ?auto_13894 ) ( not ( = ?auto_13893 ?auto_13894 ) ) ( not ( = ?auto_13893 ?auto_13914 ) ) ( not ( = ?auto_13894 ?auto_13914 ) ) ( not ( = ?auto_13903 ?auto_13922 ) ) ( IS-CRATE ?auto_13893 ) ( not ( = ?auto_13928 ?auto_13904 ) ) ( HOIST-AT ?auto_13916 ?auto_13928 ) ( AVAILABLE ?auto_13916 ) ( SURFACE-AT ?auto_13893 ?auto_13928 ) ( ON ?auto_13893 ?auto_13910 ) ( CLEAR ?auto_13893 ) ( not ( = ?auto_13892 ?auto_13893 ) ) ( not ( = ?auto_13892 ?auto_13910 ) ) ( not ( = ?auto_13893 ?auto_13910 ) ) ( not ( = ?auto_13903 ?auto_13916 ) ) ( IS-CRATE ?auto_13892 ) ( not ( = ?auto_13906 ?auto_13904 ) ) ( HOIST-AT ?auto_13923 ?auto_13906 ) ( SURFACE-AT ?auto_13892 ?auto_13906 ) ( ON ?auto_13892 ?auto_13908 ) ( CLEAR ?auto_13892 ) ( not ( = ?auto_13891 ?auto_13892 ) ) ( not ( = ?auto_13891 ?auto_13908 ) ) ( not ( = ?auto_13892 ?auto_13908 ) ) ( not ( = ?auto_13903 ?auto_13923 ) ) ( IS-CRATE ?auto_13891 ) ( AVAILABLE ?auto_13923 ) ( SURFACE-AT ?auto_13891 ?auto_13906 ) ( ON ?auto_13891 ?auto_13929 ) ( CLEAR ?auto_13891 ) ( not ( = ?auto_13890 ?auto_13891 ) ) ( not ( = ?auto_13890 ?auto_13929 ) ) ( not ( = ?auto_13891 ?auto_13929 ) ) ( IS-CRATE ?auto_13890 ) ( not ( = ?auto_13905 ?auto_13904 ) ) ( HOIST-AT ?auto_13915 ?auto_13905 ) ( AVAILABLE ?auto_13915 ) ( SURFACE-AT ?auto_13890 ?auto_13905 ) ( ON ?auto_13890 ?auto_13907 ) ( CLEAR ?auto_13890 ) ( not ( = ?auto_13889 ?auto_13890 ) ) ( not ( = ?auto_13889 ?auto_13907 ) ) ( not ( = ?auto_13890 ?auto_13907 ) ) ( not ( = ?auto_13903 ?auto_13915 ) ) ( IS-CRATE ?auto_13889 ) ( AVAILABLE ?auto_13900 ) ( SURFACE-AT ?auto_13889 ?auto_13901 ) ( ON ?auto_13889 ?auto_13921 ) ( CLEAR ?auto_13889 ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( not ( = ?auto_13888 ?auto_13921 ) ) ( not ( = ?auto_13889 ?auto_13921 ) ) ( SURFACE-AT ?auto_13887 ?auto_13904 ) ( CLEAR ?auto_13887 ) ( IS-CRATE ?auto_13888 ) ( AVAILABLE ?auto_13903 ) ( not ( = ?auto_13911 ?auto_13904 ) ) ( HOIST-AT ?auto_13919 ?auto_13911 ) ( AVAILABLE ?auto_13919 ) ( SURFACE-AT ?auto_13888 ?auto_13911 ) ( ON ?auto_13888 ?auto_13912 ) ( CLEAR ?auto_13888 ) ( TRUCK-AT ?auto_13899 ?auto_13904 ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13912 ) ) ( not ( = ?auto_13888 ?auto_13912 ) ) ( not ( = ?auto_13903 ?auto_13919 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13921 ) ) ( not ( = ?auto_13889 ?auto_13912 ) ) ( not ( = ?auto_13901 ?auto_13911 ) ) ( not ( = ?auto_13900 ?auto_13919 ) ) ( not ( = ?auto_13921 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13890 ) ) ( not ( = ?auto_13887 ?auto_13907 ) ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( not ( = ?auto_13888 ?auto_13907 ) ) ( not ( = ?auto_13890 ?auto_13921 ) ) ( not ( = ?auto_13890 ?auto_13912 ) ) ( not ( = ?auto_13905 ?auto_13901 ) ) ( not ( = ?auto_13905 ?auto_13911 ) ) ( not ( = ?auto_13915 ?auto_13900 ) ) ( not ( = ?auto_13915 ?auto_13919 ) ) ( not ( = ?auto_13907 ?auto_13921 ) ) ( not ( = ?auto_13907 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13891 ) ) ( not ( = ?auto_13887 ?auto_13929 ) ) ( not ( = ?auto_13888 ?auto_13891 ) ) ( not ( = ?auto_13888 ?auto_13929 ) ) ( not ( = ?auto_13889 ?auto_13891 ) ) ( not ( = ?auto_13889 ?auto_13929 ) ) ( not ( = ?auto_13891 ?auto_13907 ) ) ( not ( = ?auto_13891 ?auto_13921 ) ) ( not ( = ?auto_13891 ?auto_13912 ) ) ( not ( = ?auto_13906 ?auto_13905 ) ) ( not ( = ?auto_13906 ?auto_13901 ) ) ( not ( = ?auto_13906 ?auto_13911 ) ) ( not ( = ?auto_13923 ?auto_13915 ) ) ( not ( = ?auto_13923 ?auto_13900 ) ) ( not ( = ?auto_13923 ?auto_13919 ) ) ( not ( = ?auto_13929 ?auto_13907 ) ) ( not ( = ?auto_13929 ?auto_13921 ) ) ( not ( = ?auto_13929 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13892 ) ) ( not ( = ?auto_13887 ?auto_13908 ) ) ( not ( = ?auto_13888 ?auto_13892 ) ) ( not ( = ?auto_13888 ?auto_13908 ) ) ( not ( = ?auto_13889 ?auto_13892 ) ) ( not ( = ?auto_13889 ?auto_13908 ) ) ( not ( = ?auto_13890 ?auto_13892 ) ) ( not ( = ?auto_13890 ?auto_13908 ) ) ( not ( = ?auto_13892 ?auto_13929 ) ) ( not ( = ?auto_13892 ?auto_13907 ) ) ( not ( = ?auto_13892 ?auto_13921 ) ) ( not ( = ?auto_13892 ?auto_13912 ) ) ( not ( = ?auto_13908 ?auto_13929 ) ) ( not ( = ?auto_13908 ?auto_13907 ) ) ( not ( = ?auto_13908 ?auto_13921 ) ) ( not ( = ?auto_13908 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13893 ) ) ( not ( = ?auto_13887 ?auto_13910 ) ) ( not ( = ?auto_13888 ?auto_13893 ) ) ( not ( = ?auto_13888 ?auto_13910 ) ) ( not ( = ?auto_13889 ?auto_13893 ) ) ( not ( = ?auto_13889 ?auto_13910 ) ) ( not ( = ?auto_13890 ?auto_13893 ) ) ( not ( = ?auto_13890 ?auto_13910 ) ) ( not ( = ?auto_13891 ?auto_13893 ) ) ( not ( = ?auto_13891 ?auto_13910 ) ) ( not ( = ?auto_13893 ?auto_13908 ) ) ( not ( = ?auto_13893 ?auto_13929 ) ) ( not ( = ?auto_13893 ?auto_13907 ) ) ( not ( = ?auto_13893 ?auto_13921 ) ) ( not ( = ?auto_13893 ?auto_13912 ) ) ( not ( = ?auto_13928 ?auto_13906 ) ) ( not ( = ?auto_13928 ?auto_13905 ) ) ( not ( = ?auto_13928 ?auto_13901 ) ) ( not ( = ?auto_13928 ?auto_13911 ) ) ( not ( = ?auto_13916 ?auto_13923 ) ) ( not ( = ?auto_13916 ?auto_13915 ) ) ( not ( = ?auto_13916 ?auto_13900 ) ) ( not ( = ?auto_13916 ?auto_13919 ) ) ( not ( = ?auto_13910 ?auto_13908 ) ) ( not ( = ?auto_13910 ?auto_13929 ) ) ( not ( = ?auto_13910 ?auto_13907 ) ) ( not ( = ?auto_13910 ?auto_13921 ) ) ( not ( = ?auto_13910 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13894 ) ) ( not ( = ?auto_13887 ?auto_13914 ) ) ( not ( = ?auto_13888 ?auto_13894 ) ) ( not ( = ?auto_13888 ?auto_13914 ) ) ( not ( = ?auto_13889 ?auto_13894 ) ) ( not ( = ?auto_13889 ?auto_13914 ) ) ( not ( = ?auto_13890 ?auto_13894 ) ) ( not ( = ?auto_13890 ?auto_13914 ) ) ( not ( = ?auto_13891 ?auto_13894 ) ) ( not ( = ?auto_13891 ?auto_13914 ) ) ( not ( = ?auto_13892 ?auto_13894 ) ) ( not ( = ?auto_13892 ?auto_13914 ) ) ( not ( = ?auto_13894 ?auto_13910 ) ) ( not ( = ?auto_13894 ?auto_13908 ) ) ( not ( = ?auto_13894 ?auto_13929 ) ) ( not ( = ?auto_13894 ?auto_13907 ) ) ( not ( = ?auto_13894 ?auto_13921 ) ) ( not ( = ?auto_13894 ?auto_13912 ) ) ( not ( = ?auto_13924 ?auto_13928 ) ) ( not ( = ?auto_13924 ?auto_13906 ) ) ( not ( = ?auto_13924 ?auto_13905 ) ) ( not ( = ?auto_13924 ?auto_13901 ) ) ( not ( = ?auto_13924 ?auto_13911 ) ) ( not ( = ?auto_13922 ?auto_13916 ) ) ( not ( = ?auto_13922 ?auto_13923 ) ) ( not ( = ?auto_13922 ?auto_13915 ) ) ( not ( = ?auto_13922 ?auto_13900 ) ) ( not ( = ?auto_13922 ?auto_13919 ) ) ( not ( = ?auto_13914 ?auto_13910 ) ) ( not ( = ?auto_13914 ?auto_13908 ) ) ( not ( = ?auto_13914 ?auto_13929 ) ) ( not ( = ?auto_13914 ?auto_13907 ) ) ( not ( = ?auto_13914 ?auto_13921 ) ) ( not ( = ?auto_13914 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13895 ) ) ( not ( = ?auto_13887 ?auto_13927 ) ) ( not ( = ?auto_13888 ?auto_13895 ) ) ( not ( = ?auto_13888 ?auto_13927 ) ) ( not ( = ?auto_13889 ?auto_13895 ) ) ( not ( = ?auto_13889 ?auto_13927 ) ) ( not ( = ?auto_13890 ?auto_13895 ) ) ( not ( = ?auto_13890 ?auto_13927 ) ) ( not ( = ?auto_13891 ?auto_13895 ) ) ( not ( = ?auto_13891 ?auto_13927 ) ) ( not ( = ?auto_13892 ?auto_13895 ) ) ( not ( = ?auto_13892 ?auto_13927 ) ) ( not ( = ?auto_13893 ?auto_13895 ) ) ( not ( = ?auto_13893 ?auto_13927 ) ) ( not ( = ?auto_13895 ?auto_13914 ) ) ( not ( = ?auto_13895 ?auto_13910 ) ) ( not ( = ?auto_13895 ?auto_13908 ) ) ( not ( = ?auto_13895 ?auto_13929 ) ) ( not ( = ?auto_13895 ?auto_13907 ) ) ( not ( = ?auto_13895 ?auto_13921 ) ) ( not ( = ?auto_13895 ?auto_13912 ) ) ( not ( = ?auto_13913 ?auto_13924 ) ) ( not ( = ?auto_13913 ?auto_13928 ) ) ( not ( = ?auto_13913 ?auto_13906 ) ) ( not ( = ?auto_13913 ?auto_13905 ) ) ( not ( = ?auto_13913 ?auto_13901 ) ) ( not ( = ?auto_13913 ?auto_13911 ) ) ( not ( = ?auto_13930 ?auto_13922 ) ) ( not ( = ?auto_13930 ?auto_13916 ) ) ( not ( = ?auto_13930 ?auto_13923 ) ) ( not ( = ?auto_13930 ?auto_13915 ) ) ( not ( = ?auto_13930 ?auto_13900 ) ) ( not ( = ?auto_13930 ?auto_13919 ) ) ( not ( = ?auto_13927 ?auto_13914 ) ) ( not ( = ?auto_13927 ?auto_13910 ) ) ( not ( = ?auto_13927 ?auto_13908 ) ) ( not ( = ?auto_13927 ?auto_13929 ) ) ( not ( = ?auto_13927 ?auto_13907 ) ) ( not ( = ?auto_13927 ?auto_13921 ) ) ( not ( = ?auto_13927 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13896 ) ) ( not ( = ?auto_13887 ?auto_13920 ) ) ( not ( = ?auto_13888 ?auto_13896 ) ) ( not ( = ?auto_13888 ?auto_13920 ) ) ( not ( = ?auto_13889 ?auto_13896 ) ) ( not ( = ?auto_13889 ?auto_13920 ) ) ( not ( = ?auto_13890 ?auto_13896 ) ) ( not ( = ?auto_13890 ?auto_13920 ) ) ( not ( = ?auto_13891 ?auto_13896 ) ) ( not ( = ?auto_13891 ?auto_13920 ) ) ( not ( = ?auto_13892 ?auto_13896 ) ) ( not ( = ?auto_13892 ?auto_13920 ) ) ( not ( = ?auto_13893 ?auto_13896 ) ) ( not ( = ?auto_13893 ?auto_13920 ) ) ( not ( = ?auto_13894 ?auto_13896 ) ) ( not ( = ?auto_13894 ?auto_13920 ) ) ( not ( = ?auto_13896 ?auto_13927 ) ) ( not ( = ?auto_13896 ?auto_13914 ) ) ( not ( = ?auto_13896 ?auto_13910 ) ) ( not ( = ?auto_13896 ?auto_13908 ) ) ( not ( = ?auto_13896 ?auto_13929 ) ) ( not ( = ?auto_13896 ?auto_13907 ) ) ( not ( = ?auto_13896 ?auto_13921 ) ) ( not ( = ?auto_13896 ?auto_13912 ) ) ( not ( = ?auto_13926 ?auto_13913 ) ) ( not ( = ?auto_13926 ?auto_13924 ) ) ( not ( = ?auto_13926 ?auto_13928 ) ) ( not ( = ?auto_13926 ?auto_13906 ) ) ( not ( = ?auto_13926 ?auto_13905 ) ) ( not ( = ?auto_13926 ?auto_13901 ) ) ( not ( = ?auto_13926 ?auto_13911 ) ) ( not ( = ?auto_13909 ?auto_13930 ) ) ( not ( = ?auto_13909 ?auto_13922 ) ) ( not ( = ?auto_13909 ?auto_13916 ) ) ( not ( = ?auto_13909 ?auto_13923 ) ) ( not ( = ?auto_13909 ?auto_13915 ) ) ( not ( = ?auto_13909 ?auto_13900 ) ) ( not ( = ?auto_13909 ?auto_13919 ) ) ( not ( = ?auto_13920 ?auto_13927 ) ) ( not ( = ?auto_13920 ?auto_13914 ) ) ( not ( = ?auto_13920 ?auto_13910 ) ) ( not ( = ?auto_13920 ?auto_13908 ) ) ( not ( = ?auto_13920 ?auto_13929 ) ) ( not ( = ?auto_13920 ?auto_13907 ) ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( not ( = ?auto_13920 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13897 ) ) ( not ( = ?auto_13887 ?auto_13925 ) ) ( not ( = ?auto_13888 ?auto_13897 ) ) ( not ( = ?auto_13888 ?auto_13925 ) ) ( not ( = ?auto_13889 ?auto_13897 ) ) ( not ( = ?auto_13889 ?auto_13925 ) ) ( not ( = ?auto_13890 ?auto_13897 ) ) ( not ( = ?auto_13890 ?auto_13925 ) ) ( not ( = ?auto_13891 ?auto_13897 ) ) ( not ( = ?auto_13891 ?auto_13925 ) ) ( not ( = ?auto_13892 ?auto_13897 ) ) ( not ( = ?auto_13892 ?auto_13925 ) ) ( not ( = ?auto_13893 ?auto_13897 ) ) ( not ( = ?auto_13893 ?auto_13925 ) ) ( not ( = ?auto_13894 ?auto_13897 ) ) ( not ( = ?auto_13894 ?auto_13925 ) ) ( not ( = ?auto_13895 ?auto_13897 ) ) ( not ( = ?auto_13895 ?auto_13925 ) ) ( not ( = ?auto_13897 ?auto_13920 ) ) ( not ( = ?auto_13897 ?auto_13927 ) ) ( not ( = ?auto_13897 ?auto_13914 ) ) ( not ( = ?auto_13897 ?auto_13910 ) ) ( not ( = ?auto_13897 ?auto_13908 ) ) ( not ( = ?auto_13897 ?auto_13929 ) ) ( not ( = ?auto_13897 ?auto_13907 ) ) ( not ( = ?auto_13897 ?auto_13921 ) ) ( not ( = ?auto_13897 ?auto_13912 ) ) ( not ( = ?auto_13917 ?auto_13926 ) ) ( not ( = ?auto_13917 ?auto_13913 ) ) ( not ( = ?auto_13917 ?auto_13924 ) ) ( not ( = ?auto_13917 ?auto_13928 ) ) ( not ( = ?auto_13917 ?auto_13906 ) ) ( not ( = ?auto_13917 ?auto_13905 ) ) ( not ( = ?auto_13917 ?auto_13901 ) ) ( not ( = ?auto_13917 ?auto_13911 ) ) ( not ( = ?auto_13918 ?auto_13909 ) ) ( not ( = ?auto_13918 ?auto_13930 ) ) ( not ( = ?auto_13918 ?auto_13922 ) ) ( not ( = ?auto_13918 ?auto_13916 ) ) ( not ( = ?auto_13918 ?auto_13923 ) ) ( not ( = ?auto_13918 ?auto_13915 ) ) ( not ( = ?auto_13918 ?auto_13900 ) ) ( not ( = ?auto_13918 ?auto_13919 ) ) ( not ( = ?auto_13925 ?auto_13920 ) ) ( not ( = ?auto_13925 ?auto_13927 ) ) ( not ( = ?auto_13925 ?auto_13914 ) ) ( not ( = ?auto_13925 ?auto_13910 ) ) ( not ( = ?auto_13925 ?auto_13908 ) ) ( not ( = ?auto_13925 ?auto_13929 ) ) ( not ( = ?auto_13925 ?auto_13907 ) ) ( not ( = ?auto_13925 ?auto_13921 ) ) ( not ( = ?auto_13925 ?auto_13912 ) ) ( not ( = ?auto_13887 ?auto_13898 ) ) ( not ( = ?auto_13887 ?auto_13902 ) ) ( not ( = ?auto_13888 ?auto_13898 ) ) ( not ( = ?auto_13888 ?auto_13902 ) ) ( not ( = ?auto_13889 ?auto_13898 ) ) ( not ( = ?auto_13889 ?auto_13902 ) ) ( not ( = ?auto_13890 ?auto_13898 ) ) ( not ( = ?auto_13890 ?auto_13902 ) ) ( not ( = ?auto_13891 ?auto_13898 ) ) ( not ( = ?auto_13891 ?auto_13902 ) ) ( not ( = ?auto_13892 ?auto_13898 ) ) ( not ( = ?auto_13892 ?auto_13902 ) ) ( not ( = ?auto_13893 ?auto_13898 ) ) ( not ( = ?auto_13893 ?auto_13902 ) ) ( not ( = ?auto_13894 ?auto_13898 ) ) ( not ( = ?auto_13894 ?auto_13902 ) ) ( not ( = ?auto_13895 ?auto_13898 ) ) ( not ( = ?auto_13895 ?auto_13902 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13902 ) ) ( not ( = ?auto_13898 ?auto_13925 ) ) ( not ( = ?auto_13898 ?auto_13920 ) ) ( not ( = ?auto_13898 ?auto_13927 ) ) ( not ( = ?auto_13898 ?auto_13914 ) ) ( not ( = ?auto_13898 ?auto_13910 ) ) ( not ( = ?auto_13898 ?auto_13908 ) ) ( not ( = ?auto_13898 ?auto_13929 ) ) ( not ( = ?auto_13898 ?auto_13907 ) ) ( not ( = ?auto_13898 ?auto_13921 ) ) ( not ( = ?auto_13898 ?auto_13912 ) ) ( not ( = ?auto_13902 ?auto_13925 ) ) ( not ( = ?auto_13902 ?auto_13920 ) ) ( not ( = ?auto_13902 ?auto_13927 ) ) ( not ( = ?auto_13902 ?auto_13914 ) ) ( not ( = ?auto_13902 ?auto_13910 ) ) ( not ( = ?auto_13902 ?auto_13908 ) ) ( not ( = ?auto_13902 ?auto_13929 ) ) ( not ( = ?auto_13902 ?auto_13907 ) ) ( not ( = ?auto_13902 ?auto_13921 ) ) ( not ( = ?auto_13902 ?auto_13912 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13890 ?auto_13891 ?auto_13892 ?auto_13893 ?auto_13894 ?auto_13895 ?auto_13896 ?auto_13897 )
      ( MAKE-1CRATE ?auto_13897 ?auto_13898 )
      ( MAKE-11CRATE-VERIFY ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13890 ?auto_13891 ?auto_13892 ?auto_13893 ?auto_13894 ?auto_13895 ?auto_13896 ?auto_13897 ?auto_13898 ) )
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
      ?auto_13961 - SURFACE
      ?auto_13962 - SURFACE
      ?auto_13963 - SURFACE
      ?auto_13964 - SURFACE
      ?auto_13965 - SURFACE
      ?auto_13966 - SURFACE
    )
    :vars
    (
      ?auto_13970 - HOIST
      ?auto_13972 - PLACE
      ?auto_13968 - PLACE
      ?auto_13967 - HOIST
      ?auto_13969 - SURFACE
      ?auto_13997 - PLACE
      ?auto_13999 - HOIST
      ?auto_13996 - SURFACE
      ?auto_13994 - PLACE
      ?auto_13978 - HOIST
      ?auto_13989 - SURFACE
      ?auto_13974 - PLACE
      ?auto_13998 - HOIST
      ?auto_13985 - SURFACE
      ?auto_13984 - PLACE
      ?auto_13980 - HOIST
      ?auto_13983 - SURFACE
      ?auto_13992 - PLACE
      ?auto_13995 - HOIST
      ?auto_13990 - SURFACE
      ?auto_13976 - PLACE
      ?auto_13993 - HOIST
      ?auto_13975 - SURFACE
      ?auto_13979 - PLACE
      ?auto_13987 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13982 - SURFACE
      ?auto_13988 - PLACE
      ?auto_13991 - HOIST
      ?auto_13973 - SURFACE
      ?auto_13986 - SURFACE
      ?auto_13981 - SURFACE
      ?auto_13971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13970 ?auto_13972 ) ( IS-CRATE ?auto_13966 ) ( not ( = ?auto_13968 ?auto_13972 ) ) ( HOIST-AT ?auto_13967 ?auto_13968 ) ( SURFACE-AT ?auto_13966 ?auto_13968 ) ( ON ?auto_13966 ?auto_13969 ) ( CLEAR ?auto_13966 ) ( not ( = ?auto_13965 ?auto_13966 ) ) ( not ( = ?auto_13965 ?auto_13969 ) ) ( not ( = ?auto_13966 ?auto_13969 ) ) ( not ( = ?auto_13970 ?auto_13967 ) ) ( IS-CRATE ?auto_13965 ) ( not ( = ?auto_13997 ?auto_13972 ) ) ( HOIST-AT ?auto_13999 ?auto_13997 ) ( SURFACE-AT ?auto_13965 ?auto_13997 ) ( ON ?auto_13965 ?auto_13996 ) ( CLEAR ?auto_13965 ) ( not ( = ?auto_13964 ?auto_13965 ) ) ( not ( = ?auto_13964 ?auto_13996 ) ) ( not ( = ?auto_13965 ?auto_13996 ) ) ( not ( = ?auto_13970 ?auto_13999 ) ) ( IS-CRATE ?auto_13964 ) ( not ( = ?auto_13994 ?auto_13972 ) ) ( HOIST-AT ?auto_13978 ?auto_13994 ) ( AVAILABLE ?auto_13978 ) ( SURFACE-AT ?auto_13964 ?auto_13994 ) ( ON ?auto_13964 ?auto_13989 ) ( CLEAR ?auto_13964 ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13989 ) ) ( not ( = ?auto_13964 ?auto_13989 ) ) ( not ( = ?auto_13970 ?auto_13978 ) ) ( IS-CRATE ?auto_13963 ) ( not ( = ?auto_13974 ?auto_13972 ) ) ( HOIST-AT ?auto_13998 ?auto_13974 ) ( AVAILABLE ?auto_13998 ) ( SURFACE-AT ?auto_13963 ?auto_13974 ) ( ON ?auto_13963 ?auto_13985 ) ( CLEAR ?auto_13963 ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( not ( = ?auto_13962 ?auto_13985 ) ) ( not ( = ?auto_13963 ?auto_13985 ) ) ( not ( = ?auto_13970 ?auto_13998 ) ) ( IS-CRATE ?auto_13962 ) ( not ( = ?auto_13984 ?auto_13972 ) ) ( HOIST-AT ?auto_13980 ?auto_13984 ) ( AVAILABLE ?auto_13980 ) ( SURFACE-AT ?auto_13962 ?auto_13984 ) ( ON ?auto_13962 ?auto_13983 ) ( CLEAR ?auto_13962 ) ( not ( = ?auto_13961 ?auto_13962 ) ) ( not ( = ?auto_13961 ?auto_13983 ) ) ( not ( = ?auto_13962 ?auto_13983 ) ) ( not ( = ?auto_13970 ?auto_13980 ) ) ( IS-CRATE ?auto_13961 ) ( not ( = ?auto_13992 ?auto_13972 ) ) ( HOIST-AT ?auto_13995 ?auto_13992 ) ( AVAILABLE ?auto_13995 ) ( SURFACE-AT ?auto_13961 ?auto_13992 ) ( ON ?auto_13961 ?auto_13990 ) ( CLEAR ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13961 ) ) ( not ( = ?auto_13960 ?auto_13990 ) ) ( not ( = ?auto_13961 ?auto_13990 ) ) ( not ( = ?auto_13970 ?auto_13995 ) ) ( IS-CRATE ?auto_13960 ) ( not ( = ?auto_13976 ?auto_13972 ) ) ( HOIST-AT ?auto_13993 ?auto_13976 ) ( AVAILABLE ?auto_13993 ) ( SURFACE-AT ?auto_13960 ?auto_13976 ) ( ON ?auto_13960 ?auto_13975 ) ( CLEAR ?auto_13960 ) ( not ( = ?auto_13959 ?auto_13960 ) ) ( not ( = ?auto_13959 ?auto_13975 ) ) ( not ( = ?auto_13960 ?auto_13975 ) ) ( not ( = ?auto_13970 ?auto_13993 ) ) ( IS-CRATE ?auto_13959 ) ( not ( = ?auto_13979 ?auto_13972 ) ) ( HOIST-AT ?auto_13987 ?auto_13979 ) ( SURFACE-AT ?auto_13959 ?auto_13979 ) ( ON ?auto_13959 ?auto_13977 ) ( CLEAR ?auto_13959 ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( not ( = ?auto_13958 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13977 ) ) ( not ( = ?auto_13970 ?auto_13987 ) ) ( IS-CRATE ?auto_13958 ) ( AVAILABLE ?auto_13987 ) ( SURFACE-AT ?auto_13958 ?auto_13979 ) ( ON ?auto_13958 ?auto_13982 ) ( CLEAR ?auto_13958 ) ( not ( = ?auto_13957 ?auto_13958 ) ) ( not ( = ?auto_13957 ?auto_13982 ) ) ( not ( = ?auto_13958 ?auto_13982 ) ) ( IS-CRATE ?auto_13957 ) ( not ( = ?auto_13988 ?auto_13972 ) ) ( HOIST-AT ?auto_13991 ?auto_13988 ) ( AVAILABLE ?auto_13991 ) ( SURFACE-AT ?auto_13957 ?auto_13988 ) ( ON ?auto_13957 ?auto_13973 ) ( CLEAR ?auto_13957 ) ( not ( = ?auto_13956 ?auto_13957 ) ) ( not ( = ?auto_13956 ?auto_13973 ) ) ( not ( = ?auto_13957 ?auto_13973 ) ) ( not ( = ?auto_13970 ?auto_13991 ) ) ( IS-CRATE ?auto_13956 ) ( AVAILABLE ?auto_13999 ) ( SURFACE-AT ?auto_13956 ?auto_13997 ) ( ON ?auto_13956 ?auto_13986 ) ( CLEAR ?auto_13956 ) ( not ( = ?auto_13955 ?auto_13956 ) ) ( not ( = ?auto_13955 ?auto_13986 ) ) ( not ( = ?auto_13956 ?auto_13986 ) ) ( SURFACE-AT ?auto_13954 ?auto_13972 ) ( CLEAR ?auto_13954 ) ( IS-CRATE ?auto_13955 ) ( AVAILABLE ?auto_13970 ) ( AVAILABLE ?auto_13967 ) ( SURFACE-AT ?auto_13955 ?auto_13968 ) ( ON ?auto_13955 ?auto_13981 ) ( CLEAR ?auto_13955 ) ( TRUCK-AT ?auto_13971 ?auto_13972 ) ( not ( = ?auto_13954 ?auto_13955 ) ) ( not ( = ?auto_13954 ?auto_13981 ) ) ( not ( = ?auto_13955 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13956 ) ) ( not ( = ?auto_13954 ?auto_13986 ) ) ( not ( = ?auto_13956 ?auto_13981 ) ) ( not ( = ?auto_13997 ?auto_13968 ) ) ( not ( = ?auto_13999 ?auto_13967 ) ) ( not ( = ?auto_13986 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13957 ) ) ( not ( = ?auto_13954 ?auto_13973 ) ) ( not ( = ?auto_13955 ?auto_13957 ) ) ( not ( = ?auto_13955 ?auto_13973 ) ) ( not ( = ?auto_13957 ?auto_13986 ) ) ( not ( = ?auto_13957 ?auto_13981 ) ) ( not ( = ?auto_13988 ?auto_13997 ) ) ( not ( = ?auto_13988 ?auto_13968 ) ) ( not ( = ?auto_13991 ?auto_13999 ) ) ( not ( = ?auto_13991 ?auto_13967 ) ) ( not ( = ?auto_13973 ?auto_13986 ) ) ( not ( = ?auto_13973 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13958 ) ) ( not ( = ?auto_13954 ?auto_13982 ) ) ( not ( = ?auto_13955 ?auto_13958 ) ) ( not ( = ?auto_13955 ?auto_13982 ) ) ( not ( = ?auto_13956 ?auto_13958 ) ) ( not ( = ?auto_13956 ?auto_13982 ) ) ( not ( = ?auto_13958 ?auto_13973 ) ) ( not ( = ?auto_13958 ?auto_13986 ) ) ( not ( = ?auto_13958 ?auto_13981 ) ) ( not ( = ?auto_13979 ?auto_13988 ) ) ( not ( = ?auto_13979 ?auto_13997 ) ) ( not ( = ?auto_13979 ?auto_13968 ) ) ( not ( = ?auto_13987 ?auto_13991 ) ) ( not ( = ?auto_13987 ?auto_13999 ) ) ( not ( = ?auto_13987 ?auto_13967 ) ) ( not ( = ?auto_13982 ?auto_13973 ) ) ( not ( = ?auto_13982 ?auto_13986 ) ) ( not ( = ?auto_13982 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13959 ) ) ( not ( = ?auto_13954 ?auto_13977 ) ) ( not ( = ?auto_13955 ?auto_13959 ) ) ( not ( = ?auto_13955 ?auto_13977 ) ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( not ( = ?auto_13956 ?auto_13977 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13982 ) ) ( not ( = ?auto_13959 ?auto_13973 ) ) ( not ( = ?auto_13959 ?auto_13986 ) ) ( not ( = ?auto_13959 ?auto_13981 ) ) ( not ( = ?auto_13977 ?auto_13982 ) ) ( not ( = ?auto_13977 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13986 ) ) ( not ( = ?auto_13977 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13960 ) ) ( not ( = ?auto_13954 ?auto_13975 ) ) ( not ( = ?auto_13955 ?auto_13960 ) ) ( not ( = ?auto_13955 ?auto_13975 ) ) ( not ( = ?auto_13956 ?auto_13960 ) ) ( not ( = ?auto_13956 ?auto_13975 ) ) ( not ( = ?auto_13957 ?auto_13960 ) ) ( not ( = ?auto_13957 ?auto_13975 ) ) ( not ( = ?auto_13958 ?auto_13960 ) ) ( not ( = ?auto_13958 ?auto_13975 ) ) ( not ( = ?auto_13960 ?auto_13977 ) ) ( not ( = ?auto_13960 ?auto_13982 ) ) ( not ( = ?auto_13960 ?auto_13973 ) ) ( not ( = ?auto_13960 ?auto_13986 ) ) ( not ( = ?auto_13960 ?auto_13981 ) ) ( not ( = ?auto_13976 ?auto_13979 ) ) ( not ( = ?auto_13976 ?auto_13988 ) ) ( not ( = ?auto_13976 ?auto_13997 ) ) ( not ( = ?auto_13976 ?auto_13968 ) ) ( not ( = ?auto_13993 ?auto_13987 ) ) ( not ( = ?auto_13993 ?auto_13991 ) ) ( not ( = ?auto_13993 ?auto_13999 ) ) ( not ( = ?auto_13993 ?auto_13967 ) ) ( not ( = ?auto_13975 ?auto_13977 ) ) ( not ( = ?auto_13975 ?auto_13982 ) ) ( not ( = ?auto_13975 ?auto_13973 ) ) ( not ( = ?auto_13975 ?auto_13986 ) ) ( not ( = ?auto_13975 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13961 ) ) ( not ( = ?auto_13954 ?auto_13990 ) ) ( not ( = ?auto_13955 ?auto_13961 ) ) ( not ( = ?auto_13955 ?auto_13990 ) ) ( not ( = ?auto_13956 ?auto_13961 ) ) ( not ( = ?auto_13956 ?auto_13990 ) ) ( not ( = ?auto_13957 ?auto_13961 ) ) ( not ( = ?auto_13957 ?auto_13990 ) ) ( not ( = ?auto_13958 ?auto_13961 ) ) ( not ( = ?auto_13958 ?auto_13990 ) ) ( not ( = ?auto_13959 ?auto_13961 ) ) ( not ( = ?auto_13959 ?auto_13990 ) ) ( not ( = ?auto_13961 ?auto_13975 ) ) ( not ( = ?auto_13961 ?auto_13977 ) ) ( not ( = ?auto_13961 ?auto_13982 ) ) ( not ( = ?auto_13961 ?auto_13973 ) ) ( not ( = ?auto_13961 ?auto_13986 ) ) ( not ( = ?auto_13961 ?auto_13981 ) ) ( not ( = ?auto_13992 ?auto_13976 ) ) ( not ( = ?auto_13992 ?auto_13979 ) ) ( not ( = ?auto_13992 ?auto_13988 ) ) ( not ( = ?auto_13992 ?auto_13997 ) ) ( not ( = ?auto_13992 ?auto_13968 ) ) ( not ( = ?auto_13995 ?auto_13993 ) ) ( not ( = ?auto_13995 ?auto_13987 ) ) ( not ( = ?auto_13995 ?auto_13991 ) ) ( not ( = ?auto_13995 ?auto_13999 ) ) ( not ( = ?auto_13995 ?auto_13967 ) ) ( not ( = ?auto_13990 ?auto_13975 ) ) ( not ( = ?auto_13990 ?auto_13977 ) ) ( not ( = ?auto_13990 ?auto_13982 ) ) ( not ( = ?auto_13990 ?auto_13973 ) ) ( not ( = ?auto_13990 ?auto_13986 ) ) ( not ( = ?auto_13990 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13962 ) ) ( not ( = ?auto_13954 ?auto_13983 ) ) ( not ( = ?auto_13955 ?auto_13962 ) ) ( not ( = ?auto_13955 ?auto_13983 ) ) ( not ( = ?auto_13956 ?auto_13962 ) ) ( not ( = ?auto_13956 ?auto_13983 ) ) ( not ( = ?auto_13957 ?auto_13962 ) ) ( not ( = ?auto_13957 ?auto_13983 ) ) ( not ( = ?auto_13958 ?auto_13962 ) ) ( not ( = ?auto_13958 ?auto_13983 ) ) ( not ( = ?auto_13959 ?auto_13962 ) ) ( not ( = ?auto_13959 ?auto_13983 ) ) ( not ( = ?auto_13960 ?auto_13962 ) ) ( not ( = ?auto_13960 ?auto_13983 ) ) ( not ( = ?auto_13962 ?auto_13990 ) ) ( not ( = ?auto_13962 ?auto_13975 ) ) ( not ( = ?auto_13962 ?auto_13977 ) ) ( not ( = ?auto_13962 ?auto_13982 ) ) ( not ( = ?auto_13962 ?auto_13973 ) ) ( not ( = ?auto_13962 ?auto_13986 ) ) ( not ( = ?auto_13962 ?auto_13981 ) ) ( not ( = ?auto_13984 ?auto_13992 ) ) ( not ( = ?auto_13984 ?auto_13976 ) ) ( not ( = ?auto_13984 ?auto_13979 ) ) ( not ( = ?auto_13984 ?auto_13988 ) ) ( not ( = ?auto_13984 ?auto_13997 ) ) ( not ( = ?auto_13984 ?auto_13968 ) ) ( not ( = ?auto_13980 ?auto_13995 ) ) ( not ( = ?auto_13980 ?auto_13993 ) ) ( not ( = ?auto_13980 ?auto_13987 ) ) ( not ( = ?auto_13980 ?auto_13991 ) ) ( not ( = ?auto_13980 ?auto_13999 ) ) ( not ( = ?auto_13980 ?auto_13967 ) ) ( not ( = ?auto_13983 ?auto_13990 ) ) ( not ( = ?auto_13983 ?auto_13975 ) ) ( not ( = ?auto_13983 ?auto_13977 ) ) ( not ( = ?auto_13983 ?auto_13982 ) ) ( not ( = ?auto_13983 ?auto_13973 ) ) ( not ( = ?auto_13983 ?auto_13986 ) ) ( not ( = ?auto_13983 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13963 ) ) ( not ( = ?auto_13954 ?auto_13985 ) ) ( not ( = ?auto_13955 ?auto_13963 ) ) ( not ( = ?auto_13955 ?auto_13985 ) ) ( not ( = ?auto_13956 ?auto_13963 ) ) ( not ( = ?auto_13956 ?auto_13985 ) ) ( not ( = ?auto_13957 ?auto_13963 ) ) ( not ( = ?auto_13957 ?auto_13985 ) ) ( not ( = ?auto_13958 ?auto_13963 ) ) ( not ( = ?auto_13958 ?auto_13985 ) ) ( not ( = ?auto_13959 ?auto_13963 ) ) ( not ( = ?auto_13959 ?auto_13985 ) ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13960 ?auto_13985 ) ) ( not ( = ?auto_13961 ?auto_13963 ) ) ( not ( = ?auto_13961 ?auto_13985 ) ) ( not ( = ?auto_13963 ?auto_13983 ) ) ( not ( = ?auto_13963 ?auto_13990 ) ) ( not ( = ?auto_13963 ?auto_13975 ) ) ( not ( = ?auto_13963 ?auto_13977 ) ) ( not ( = ?auto_13963 ?auto_13982 ) ) ( not ( = ?auto_13963 ?auto_13973 ) ) ( not ( = ?auto_13963 ?auto_13986 ) ) ( not ( = ?auto_13963 ?auto_13981 ) ) ( not ( = ?auto_13974 ?auto_13984 ) ) ( not ( = ?auto_13974 ?auto_13992 ) ) ( not ( = ?auto_13974 ?auto_13976 ) ) ( not ( = ?auto_13974 ?auto_13979 ) ) ( not ( = ?auto_13974 ?auto_13988 ) ) ( not ( = ?auto_13974 ?auto_13997 ) ) ( not ( = ?auto_13974 ?auto_13968 ) ) ( not ( = ?auto_13998 ?auto_13980 ) ) ( not ( = ?auto_13998 ?auto_13995 ) ) ( not ( = ?auto_13998 ?auto_13993 ) ) ( not ( = ?auto_13998 ?auto_13987 ) ) ( not ( = ?auto_13998 ?auto_13991 ) ) ( not ( = ?auto_13998 ?auto_13999 ) ) ( not ( = ?auto_13998 ?auto_13967 ) ) ( not ( = ?auto_13985 ?auto_13983 ) ) ( not ( = ?auto_13985 ?auto_13990 ) ) ( not ( = ?auto_13985 ?auto_13975 ) ) ( not ( = ?auto_13985 ?auto_13977 ) ) ( not ( = ?auto_13985 ?auto_13982 ) ) ( not ( = ?auto_13985 ?auto_13973 ) ) ( not ( = ?auto_13985 ?auto_13986 ) ) ( not ( = ?auto_13985 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13964 ) ) ( not ( = ?auto_13954 ?auto_13989 ) ) ( not ( = ?auto_13955 ?auto_13964 ) ) ( not ( = ?auto_13955 ?auto_13989 ) ) ( not ( = ?auto_13956 ?auto_13964 ) ) ( not ( = ?auto_13956 ?auto_13989 ) ) ( not ( = ?auto_13957 ?auto_13964 ) ) ( not ( = ?auto_13957 ?auto_13989 ) ) ( not ( = ?auto_13958 ?auto_13964 ) ) ( not ( = ?auto_13958 ?auto_13989 ) ) ( not ( = ?auto_13959 ?auto_13964 ) ) ( not ( = ?auto_13959 ?auto_13989 ) ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13960 ?auto_13989 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13989 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13989 ) ) ( not ( = ?auto_13964 ?auto_13985 ) ) ( not ( = ?auto_13964 ?auto_13983 ) ) ( not ( = ?auto_13964 ?auto_13990 ) ) ( not ( = ?auto_13964 ?auto_13975 ) ) ( not ( = ?auto_13964 ?auto_13977 ) ) ( not ( = ?auto_13964 ?auto_13982 ) ) ( not ( = ?auto_13964 ?auto_13973 ) ) ( not ( = ?auto_13964 ?auto_13986 ) ) ( not ( = ?auto_13964 ?auto_13981 ) ) ( not ( = ?auto_13994 ?auto_13974 ) ) ( not ( = ?auto_13994 ?auto_13984 ) ) ( not ( = ?auto_13994 ?auto_13992 ) ) ( not ( = ?auto_13994 ?auto_13976 ) ) ( not ( = ?auto_13994 ?auto_13979 ) ) ( not ( = ?auto_13994 ?auto_13988 ) ) ( not ( = ?auto_13994 ?auto_13997 ) ) ( not ( = ?auto_13994 ?auto_13968 ) ) ( not ( = ?auto_13978 ?auto_13998 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13995 ) ) ( not ( = ?auto_13978 ?auto_13993 ) ) ( not ( = ?auto_13978 ?auto_13987 ) ) ( not ( = ?auto_13978 ?auto_13991 ) ) ( not ( = ?auto_13978 ?auto_13999 ) ) ( not ( = ?auto_13978 ?auto_13967 ) ) ( not ( = ?auto_13989 ?auto_13985 ) ) ( not ( = ?auto_13989 ?auto_13983 ) ) ( not ( = ?auto_13989 ?auto_13990 ) ) ( not ( = ?auto_13989 ?auto_13975 ) ) ( not ( = ?auto_13989 ?auto_13977 ) ) ( not ( = ?auto_13989 ?auto_13982 ) ) ( not ( = ?auto_13989 ?auto_13973 ) ) ( not ( = ?auto_13989 ?auto_13986 ) ) ( not ( = ?auto_13989 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13965 ) ) ( not ( = ?auto_13954 ?auto_13996 ) ) ( not ( = ?auto_13955 ?auto_13965 ) ) ( not ( = ?auto_13955 ?auto_13996 ) ) ( not ( = ?auto_13956 ?auto_13965 ) ) ( not ( = ?auto_13956 ?auto_13996 ) ) ( not ( = ?auto_13957 ?auto_13965 ) ) ( not ( = ?auto_13957 ?auto_13996 ) ) ( not ( = ?auto_13958 ?auto_13965 ) ) ( not ( = ?auto_13958 ?auto_13996 ) ) ( not ( = ?auto_13959 ?auto_13965 ) ) ( not ( = ?auto_13959 ?auto_13996 ) ) ( not ( = ?auto_13960 ?auto_13965 ) ) ( not ( = ?auto_13960 ?auto_13996 ) ) ( not ( = ?auto_13961 ?auto_13965 ) ) ( not ( = ?auto_13961 ?auto_13996 ) ) ( not ( = ?auto_13962 ?auto_13965 ) ) ( not ( = ?auto_13962 ?auto_13996 ) ) ( not ( = ?auto_13963 ?auto_13965 ) ) ( not ( = ?auto_13963 ?auto_13996 ) ) ( not ( = ?auto_13965 ?auto_13989 ) ) ( not ( = ?auto_13965 ?auto_13985 ) ) ( not ( = ?auto_13965 ?auto_13983 ) ) ( not ( = ?auto_13965 ?auto_13990 ) ) ( not ( = ?auto_13965 ?auto_13975 ) ) ( not ( = ?auto_13965 ?auto_13977 ) ) ( not ( = ?auto_13965 ?auto_13982 ) ) ( not ( = ?auto_13965 ?auto_13973 ) ) ( not ( = ?auto_13965 ?auto_13986 ) ) ( not ( = ?auto_13965 ?auto_13981 ) ) ( not ( = ?auto_13996 ?auto_13989 ) ) ( not ( = ?auto_13996 ?auto_13985 ) ) ( not ( = ?auto_13996 ?auto_13983 ) ) ( not ( = ?auto_13996 ?auto_13990 ) ) ( not ( = ?auto_13996 ?auto_13975 ) ) ( not ( = ?auto_13996 ?auto_13977 ) ) ( not ( = ?auto_13996 ?auto_13982 ) ) ( not ( = ?auto_13996 ?auto_13973 ) ) ( not ( = ?auto_13996 ?auto_13986 ) ) ( not ( = ?auto_13996 ?auto_13981 ) ) ( not ( = ?auto_13954 ?auto_13966 ) ) ( not ( = ?auto_13954 ?auto_13969 ) ) ( not ( = ?auto_13955 ?auto_13966 ) ) ( not ( = ?auto_13955 ?auto_13969 ) ) ( not ( = ?auto_13956 ?auto_13966 ) ) ( not ( = ?auto_13956 ?auto_13969 ) ) ( not ( = ?auto_13957 ?auto_13966 ) ) ( not ( = ?auto_13957 ?auto_13969 ) ) ( not ( = ?auto_13958 ?auto_13966 ) ) ( not ( = ?auto_13958 ?auto_13969 ) ) ( not ( = ?auto_13959 ?auto_13966 ) ) ( not ( = ?auto_13959 ?auto_13969 ) ) ( not ( = ?auto_13960 ?auto_13966 ) ) ( not ( = ?auto_13960 ?auto_13969 ) ) ( not ( = ?auto_13961 ?auto_13966 ) ) ( not ( = ?auto_13961 ?auto_13969 ) ) ( not ( = ?auto_13962 ?auto_13966 ) ) ( not ( = ?auto_13962 ?auto_13969 ) ) ( not ( = ?auto_13963 ?auto_13966 ) ) ( not ( = ?auto_13963 ?auto_13969 ) ) ( not ( = ?auto_13964 ?auto_13966 ) ) ( not ( = ?auto_13964 ?auto_13969 ) ) ( not ( = ?auto_13966 ?auto_13996 ) ) ( not ( = ?auto_13966 ?auto_13989 ) ) ( not ( = ?auto_13966 ?auto_13985 ) ) ( not ( = ?auto_13966 ?auto_13983 ) ) ( not ( = ?auto_13966 ?auto_13990 ) ) ( not ( = ?auto_13966 ?auto_13975 ) ) ( not ( = ?auto_13966 ?auto_13977 ) ) ( not ( = ?auto_13966 ?auto_13982 ) ) ( not ( = ?auto_13966 ?auto_13973 ) ) ( not ( = ?auto_13966 ?auto_13986 ) ) ( not ( = ?auto_13966 ?auto_13981 ) ) ( not ( = ?auto_13969 ?auto_13996 ) ) ( not ( = ?auto_13969 ?auto_13989 ) ) ( not ( = ?auto_13969 ?auto_13985 ) ) ( not ( = ?auto_13969 ?auto_13983 ) ) ( not ( = ?auto_13969 ?auto_13990 ) ) ( not ( = ?auto_13969 ?auto_13975 ) ) ( not ( = ?auto_13969 ?auto_13977 ) ) ( not ( = ?auto_13969 ?auto_13982 ) ) ( not ( = ?auto_13969 ?auto_13973 ) ) ( not ( = ?auto_13969 ?auto_13986 ) ) ( not ( = ?auto_13969 ?auto_13981 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13954 ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ?auto_13959 ?auto_13960 ?auto_13961 ?auto_13962 ?auto_13963 ?auto_13964 ?auto_13965 )
      ( MAKE-1CRATE ?auto_13965 ?auto_13966 )
      ( MAKE-12CRATE-VERIFY ?auto_13954 ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ?auto_13959 ?auto_13960 ?auto_13961 ?auto_13962 ?auto_13963 ?auto_13964 ?auto_13965 ?auto_13966 ) )
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
      ?auto_14031 - SURFACE
      ?auto_14032 - SURFACE
      ?auto_14033 - SURFACE
      ?auto_14034 - SURFACE
      ?auto_14035 - SURFACE
      ?auto_14036 - SURFACE
      ?auto_14037 - SURFACE
    )
    :vars
    (
      ?auto_14043 - HOIST
      ?auto_14038 - PLACE
      ?auto_14039 - PLACE
      ?auto_14042 - HOIST
      ?auto_14041 - SURFACE
      ?auto_14069 - PLACE
      ?auto_14051 - HOIST
      ?auto_14067 - SURFACE
      ?auto_14061 - PLACE
      ?auto_14044 - HOIST
      ?auto_14049 - SURFACE
      ?auto_14066 - PLACE
      ?auto_14062 - HOIST
      ?auto_14052 - SURFACE
      ?auto_14053 - PLACE
      ?auto_14045 - HOIST
      ?auto_14048 - SURFACE
      ?auto_14055 - PLACE
      ?auto_14057 - HOIST
      ?auto_14073 - SURFACE
      ?auto_14046 - PLACE
      ?auto_14068 - HOIST
      ?auto_14054 - SURFACE
      ?auto_14072 - PLACE
      ?auto_14058 - HOIST
      ?auto_14063 - SURFACE
      ?auto_14056 - PLACE
      ?auto_14047 - HOIST
      ?auto_14059 - SURFACE
      ?auto_14064 - SURFACE
      ?auto_14060 - PLACE
      ?auto_14071 - HOIST
      ?auto_14070 - SURFACE
      ?auto_14050 - SURFACE
      ?auto_14065 - SURFACE
      ?auto_14040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14043 ?auto_14038 ) ( IS-CRATE ?auto_14037 ) ( not ( = ?auto_14039 ?auto_14038 ) ) ( HOIST-AT ?auto_14042 ?auto_14039 ) ( AVAILABLE ?auto_14042 ) ( SURFACE-AT ?auto_14037 ?auto_14039 ) ( ON ?auto_14037 ?auto_14041 ) ( CLEAR ?auto_14037 ) ( not ( = ?auto_14036 ?auto_14037 ) ) ( not ( = ?auto_14036 ?auto_14041 ) ) ( not ( = ?auto_14037 ?auto_14041 ) ) ( not ( = ?auto_14043 ?auto_14042 ) ) ( IS-CRATE ?auto_14036 ) ( not ( = ?auto_14069 ?auto_14038 ) ) ( HOIST-AT ?auto_14051 ?auto_14069 ) ( SURFACE-AT ?auto_14036 ?auto_14069 ) ( ON ?auto_14036 ?auto_14067 ) ( CLEAR ?auto_14036 ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( not ( = ?auto_14035 ?auto_14067 ) ) ( not ( = ?auto_14036 ?auto_14067 ) ) ( not ( = ?auto_14043 ?auto_14051 ) ) ( IS-CRATE ?auto_14035 ) ( not ( = ?auto_14061 ?auto_14038 ) ) ( HOIST-AT ?auto_14044 ?auto_14061 ) ( SURFACE-AT ?auto_14035 ?auto_14061 ) ( ON ?auto_14035 ?auto_14049 ) ( CLEAR ?auto_14035 ) ( not ( = ?auto_14034 ?auto_14035 ) ) ( not ( = ?auto_14034 ?auto_14049 ) ) ( not ( = ?auto_14035 ?auto_14049 ) ) ( not ( = ?auto_14043 ?auto_14044 ) ) ( IS-CRATE ?auto_14034 ) ( not ( = ?auto_14066 ?auto_14038 ) ) ( HOIST-AT ?auto_14062 ?auto_14066 ) ( AVAILABLE ?auto_14062 ) ( SURFACE-AT ?auto_14034 ?auto_14066 ) ( ON ?auto_14034 ?auto_14052 ) ( CLEAR ?auto_14034 ) ( not ( = ?auto_14033 ?auto_14034 ) ) ( not ( = ?auto_14033 ?auto_14052 ) ) ( not ( = ?auto_14034 ?auto_14052 ) ) ( not ( = ?auto_14043 ?auto_14062 ) ) ( IS-CRATE ?auto_14033 ) ( not ( = ?auto_14053 ?auto_14038 ) ) ( HOIST-AT ?auto_14045 ?auto_14053 ) ( AVAILABLE ?auto_14045 ) ( SURFACE-AT ?auto_14033 ?auto_14053 ) ( ON ?auto_14033 ?auto_14048 ) ( CLEAR ?auto_14033 ) ( not ( = ?auto_14032 ?auto_14033 ) ) ( not ( = ?auto_14032 ?auto_14048 ) ) ( not ( = ?auto_14033 ?auto_14048 ) ) ( not ( = ?auto_14043 ?auto_14045 ) ) ( IS-CRATE ?auto_14032 ) ( not ( = ?auto_14055 ?auto_14038 ) ) ( HOIST-AT ?auto_14057 ?auto_14055 ) ( AVAILABLE ?auto_14057 ) ( SURFACE-AT ?auto_14032 ?auto_14055 ) ( ON ?auto_14032 ?auto_14073 ) ( CLEAR ?auto_14032 ) ( not ( = ?auto_14031 ?auto_14032 ) ) ( not ( = ?auto_14031 ?auto_14073 ) ) ( not ( = ?auto_14032 ?auto_14073 ) ) ( not ( = ?auto_14043 ?auto_14057 ) ) ( IS-CRATE ?auto_14031 ) ( not ( = ?auto_14046 ?auto_14038 ) ) ( HOIST-AT ?auto_14068 ?auto_14046 ) ( AVAILABLE ?auto_14068 ) ( SURFACE-AT ?auto_14031 ?auto_14046 ) ( ON ?auto_14031 ?auto_14054 ) ( CLEAR ?auto_14031 ) ( not ( = ?auto_14030 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14054 ) ) ( not ( = ?auto_14031 ?auto_14054 ) ) ( not ( = ?auto_14043 ?auto_14068 ) ) ( IS-CRATE ?auto_14030 ) ( not ( = ?auto_14072 ?auto_14038 ) ) ( HOIST-AT ?auto_14058 ?auto_14072 ) ( AVAILABLE ?auto_14058 ) ( SURFACE-AT ?auto_14030 ?auto_14072 ) ( ON ?auto_14030 ?auto_14063 ) ( CLEAR ?auto_14030 ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14063 ) ) ( not ( = ?auto_14030 ?auto_14063 ) ) ( not ( = ?auto_14043 ?auto_14058 ) ) ( IS-CRATE ?auto_14029 ) ( not ( = ?auto_14056 ?auto_14038 ) ) ( HOIST-AT ?auto_14047 ?auto_14056 ) ( SURFACE-AT ?auto_14029 ?auto_14056 ) ( ON ?auto_14029 ?auto_14059 ) ( CLEAR ?auto_14029 ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14059 ) ) ( not ( = ?auto_14029 ?auto_14059 ) ) ( not ( = ?auto_14043 ?auto_14047 ) ) ( IS-CRATE ?auto_14028 ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14028 ?auto_14056 ) ( ON ?auto_14028 ?auto_14064 ) ( CLEAR ?auto_14028 ) ( not ( = ?auto_14027 ?auto_14028 ) ) ( not ( = ?auto_14027 ?auto_14064 ) ) ( not ( = ?auto_14028 ?auto_14064 ) ) ( IS-CRATE ?auto_14027 ) ( not ( = ?auto_14060 ?auto_14038 ) ) ( HOIST-AT ?auto_14071 ?auto_14060 ) ( AVAILABLE ?auto_14071 ) ( SURFACE-AT ?auto_14027 ?auto_14060 ) ( ON ?auto_14027 ?auto_14070 ) ( CLEAR ?auto_14027 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14070 ) ) ( not ( = ?auto_14027 ?auto_14070 ) ) ( not ( = ?auto_14043 ?auto_14071 ) ) ( IS-CRATE ?auto_14026 ) ( AVAILABLE ?auto_14044 ) ( SURFACE-AT ?auto_14026 ?auto_14061 ) ( ON ?auto_14026 ?auto_14050 ) ( CLEAR ?auto_14026 ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14050 ) ) ( not ( = ?auto_14026 ?auto_14050 ) ) ( SURFACE-AT ?auto_14024 ?auto_14038 ) ( CLEAR ?auto_14024 ) ( IS-CRATE ?auto_14025 ) ( AVAILABLE ?auto_14043 ) ( AVAILABLE ?auto_14051 ) ( SURFACE-AT ?auto_14025 ?auto_14069 ) ( ON ?auto_14025 ?auto_14065 ) ( CLEAR ?auto_14025 ) ( TRUCK-AT ?auto_14040 ?auto_14038 ) ( not ( = ?auto_14024 ?auto_14025 ) ) ( not ( = ?auto_14024 ?auto_14065 ) ) ( not ( = ?auto_14025 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14026 ) ) ( not ( = ?auto_14024 ?auto_14050 ) ) ( not ( = ?auto_14026 ?auto_14065 ) ) ( not ( = ?auto_14061 ?auto_14069 ) ) ( not ( = ?auto_14044 ?auto_14051 ) ) ( not ( = ?auto_14050 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14027 ) ) ( not ( = ?auto_14024 ?auto_14070 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14070 ) ) ( not ( = ?auto_14027 ?auto_14050 ) ) ( not ( = ?auto_14027 ?auto_14065 ) ) ( not ( = ?auto_14060 ?auto_14061 ) ) ( not ( = ?auto_14060 ?auto_14069 ) ) ( not ( = ?auto_14071 ?auto_14044 ) ) ( not ( = ?auto_14071 ?auto_14051 ) ) ( not ( = ?auto_14070 ?auto_14050 ) ) ( not ( = ?auto_14070 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14028 ) ) ( not ( = ?auto_14024 ?auto_14064 ) ) ( not ( = ?auto_14025 ?auto_14028 ) ) ( not ( = ?auto_14025 ?auto_14064 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) ( not ( = ?auto_14026 ?auto_14064 ) ) ( not ( = ?auto_14028 ?auto_14070 ) ) ( not ( = ?auto_14028 ?auto_14050 ) ) ( not ( = ?auto_14028 ?auto_14065 ) ) ( not ( = ?auto_14056 ?auto_14060 ) ) ( not ( = ?auto_14056 ?auto_14061 ) ) ( not ( = ?auto_14056 ?auto_14069 ) ) ( not ( = ?auto_14047 ?auto_14071 ) ) ( not ( = ?auto_14047 ?auto_14044 ) ) ( not ( = ?auto_14047 ?auto_14051 ) ) ( not ( = ?auto_14064 ?auto_14070 ) ) ( not ( = ?auto_14064 ?auto_14050 ) ) ( not ( = ?auto_14064 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14029 ) ) ( not ( = ?auto_14024 ?auto_14059 ) ) ( not ( = ?auto_14025 ?auto_14029 ) ) ( not ( = ?auto_14025 ?auto_14059 ) ) ( not ( = ?auto_14026 ?auto_14029 ) ) ( not ( = ?auto_14026 ?auto_14059 ) ) ( not ( = ?auto_14027 ?auto_14029 ) ) ( not ( = ?auto_14027 ?auto_14059 ) ) ( not ( = ?auto_14029 ?auto_14064 ) ) ( not ( = ?auto_14029 ?auto_14070 ) ) ( not ( = ?auto_14029 ?auto_14050 ) ) ( not ( = ?auto_14029 ?auto_14065 ) ) ( not ( = ?auto_14059 ?auto_14064 ) ) ( not ( = ?auto_14059 ?auto_14070 ) ) ( not ( = ?auto_14059 ?auto_14050 ) ) ( not ( = ?auto_14059 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14030 ) ) ( not ( = ?auto_14024 ?auto_14063 ) ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( not ( = ?auto_14025 ?auto_14063 ) ) ( not ( = ?auto_14026 ?auto_14030 ) ) ( not ( = ?auto_14026 ?auto_14063 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14063 ) ) ( not ( = ?auto_14028 ?auto_14030 ) ) ( not ( = ?auto_14028 ?auto_14063 ) ) ( not ( = ?auto_14030 ?auto_14059 ) ) ( not ( = ?auto_14030 ?auto_14064 ) ) ( not ( = ?auto_14030 ?auto_14070 ) ) ( not ( = ?auto_14030 ?auto_14050 ) ) ( not ( = ?auto_14030 ?auto_14065 ) ) ( not ( = ?auto_14072 ?auto_14056 ) ) ( not ( = ?auto_14072 ?auto_14060 ) ) ( not ( = ?auto_14072 ?auto_14061 ) ) ( not ( = ?auto_14072 ?auto_14069 ) ) ( not ( = ?auto_14058 ?auto_14047 ) ) ( not ( = ?auto_14058 ?auto_14071 ) ) ( not ( = ?auto_14058 ?auto_14044 ) ) ( not ( = ?auto_14058 ?auto_14051 ) ) ( not ( = ?auto_14063 ?auto_14059 ) ) ( not ( = ?auto_14063 ?auto_14064 ) ) ( not ( = ?auto_14063 ?auto_14070 ) ) ( not ( = ?auto_14063 ?auto_14050 ) ) ( not ( = ?auto_14063 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14031 ) ) ( not ( = ?auto_14024 ?auto_14054 ) ) ( not ( = ?auto_14025 ?auto_14031 ) ) ( not ( = ?auto_14025 ?auto_14054 ) ) ( not ( = ?auto_14026 ?auto_14031 ) ) ( not ( = ?auto_14026 ?auto_14054 ) ) ( not ( = ?auto_14027 ?auto_14031 ) ) ( not ( = ?auto_14027 ?auto_14054 ) ) ( not ( = ?auto_14028 ?auto_14031 ) ) ( not ( = ?auto_14028 ?auto_14054 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14054 ) ) ( not ( = ?auto_14031 ?auto_14063 ) ) ( not ( = ?auto_14031 ?auto_14059 ) ) ( not ( = ?auto_14031 ?auto_14064 ) ) ( not ( = ?auto_14031 ?auto_14070 ) ) ( not ( = ?auto_14031 ?auto_14050 ) ) ( not ( = ?auto_14031 ?auto_14065 ) ) ( not ( = ?auto_14046 ?auto_14072 ) ) ( not ( = ?auto_14046 ?auto_14056 ) ) ( not ( = ?auto_14046 ?auto_14060 ) ) ( not ( = ?auto_14046 ?auto_14061 ) ) ( not ( = ?auto_14046 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14058 ) ) ( not ( = ?auto_14068 ?auto_14047 ) ) ( not ( = ?auto_14068 ?auto_14071 ) ) ( not ( = ?auto_14068 ?auto_14044 ) ) ( not ( = ?auto_14068 ?auto_14051 ) ) ( not ( = ?auto_14054 ?auto_14063 ) ) ( not ( = ?auto_14054 ?auto_14059 ) ) ( not ( = ?auto_14054 ?auto_14064 ) ) ( not ( = ?auto_14054 ?auto_14070 ) ) ( not ( = ?auto_14054 ?auto_14050 ) ) ( not ( = ?auto_14054 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14032 ) ) ( not ( = ?auto_14024 ?auto_14073 ) ) ( not ( = ?auto_14025 ?auto_14032 ) ) ( not ( = ?auto_14025 ?auto_14073 ) ) ( not ( = ?auto_14026 ?auto_14032 ) ) ( not ( = ?auto_14026 ?auto_14073 ) ) ( not ( = ?auto_14027 ?auto_14032 ) ) ( not ( = ?auto_14027 ?auto_14073 ) ) ( not ( = ?auto_14028 ?auto_14032 ) ) ( not ( = ?auto_14028 ?auto_14073 ) ) ( not ( = ?auto_14029 ?auto_14032 ) ) ( not ( = ?auto_14029 ?auto_14073 ) ) ( not ( = ?auto_14030 ?auto_14032 ) ) ( not ( = ?auto_14030 ?auto_14073 ) ) ( not ( = ?auto_14032 ?auto_14054 ) ) ( not ( = ?auto_14032 ?auto_14063 ) ) ( not ( = ?auto_14032 ?auto_14059 ) ) ( not ( = ?auto_14032 ?auto_14064 ) ) ( not ( = ?auto_14032 ?auto_14070 ) ) ( not ( = ?auto_14032 ?auto_14050 ) ) ( not ( = ?auto_14032 ?auto_14065 ) ) ( not ( = ?auto_14055 ?auto_14046 ) ) ( not ( = ?auto_14055 ?auto_14072 ) ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( not ( = ?auto_14055 ?auto_14060 ) ) ( not ( = ?auto_14055 ?auto_14061 ) ) ( not ( = ?auto_14055 ?auto_14069 ) ) ( not ( = ?auto_14057 ?auto_14068 ) ) ( not ( = ?auto_14057 ?auto_14058 ) ) ( not ( = ?auto_14057 ?auto_14047 ) ) ( not ( = ?auto_14057 ?auto_14071 ) ) ( not ( = ?auto_14057 ?auto_14044 ) ) ( not ( = ?auto_14057 ?auto_14051 ) ) ( not ( = ?auto_14073 ?auto_14054 ) ) ( not ( = ?auto_14073 ?auto_14063 ) ) ( not ( = ?auto_14073 ?auto_14059 ) ) ( not ( = ?auto_14073 ?auto_14064 ) ) ( not ( = ?auto_14073 ?auto_14070 ) ) ( not ( = ?auto_14073 ?auto_14050 ) ) ( not ( = ?auto_14073 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14033 ) ) ( not ( = ?auto_14024 ?auto_14048 ) ) ( not ( = ?auto_14025 ?auto_14033 ) ) ( not ( = ?auto_14025 ?auto_14048 ) ) ( not ( = ?auto_14026 ?auto_14033 ) ) ( not ( = ?auto_14026 ?auto_14048 ) ) ( not ( = ?auto_14027 ?auto_14033 ) ) ( not ( = ?auto_14027 ?auto_14048 ) ) ( not ( = ?auto_14028 ?auto_14033 ) ) ( not ( = ?auto_14028 ?auto_14048 ) ) ( not ( = ?auto_14029 ?auto_14033 ) ) ( not ( = ?auto_14029 ?auto_14048 ) ) ( not ( = ?auto_14030 ?auto_14033 ) ) ( not ( = ?auto_14030 ?auto_14048 ) ) ( not ( = ?auto_14031 ?auto_14033 ) ) ( not ( = ?auto_14031 ?auto_14048 ) ) ( not ( = ?auto_14033 ?auto_14073 ) ) ( not ( = ?auto_14033 ?auto_14054 ) ) ( not ( = ?auto_14033 ?auto_14063 ) ) ( not ( = ?auto_14033 ?auto_14059 ) ) ( not ( = ?auto_14033 ?auto_14064 ) ) ( not ( = ?auto_14033 ?auto_14070 ) ) ( not ( = ?auto_14033 ?auto_14050 ) ) ( not ( = ?auto_14033 ?auto_14065 ) ) ( not ( = ?auto_14053 ?auto_14055 ) ) ( not ( = ?auto_14053 ?auto_14046 ) ) ( not ( = ?auto_14053 ?auto_14072 ) ) ( not ( = ?auto_14053 ?auto_14056 ) ) ( not ( = ?auto_14053 ?auto_14060 ) ) ( not ( = ?auto_14053 ?auto_14061 ) ) ( not ( = ?auto_14053 ?auto_14069 ) ) ( not ( = ?auto_14045 ?auto_14057 ) ) ( not ( = ?auto_14045 ?auto_14068 ) ) ( not ( = ?auto_14045 ?auto_14058 ) ) ( not ( = ?auto_14045 ?auto_14047 ) ) ( not ( = ?auto_14045 ?auto_14071 ) ) ( not ( = ?auto_14045 ?auto_14044 ) ) ( not ( = ?auto_14045 ?auto_14051 ) ) ( not ( = ?auto_14048 ?auto_14073 ) ) ( not ( = ?auto_14048 ?auto_14054 ) ) ( not ( = ?auto_14048 ?auto_14063 ) ) ( not ( = ?auto_14048 ?auto_14059 ) ) ( not ( = ?auto_14048 ?auto_14064 ) ) ( not ( = ?auto_14048 ?auto_14070 ) ) ( not ( = ?auto_14048 ?auto_14050 ) ) ( not ( = ?auto_14048 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14034 ) ) ( not ( = ?auto_14024 ?auto_14052 ) ) ( not ( = ?auto_14025 ?auto_14034 ) ) ( not ( = ?auto_14025 ?auto_14052 ) ) ( not ( = ?auto_14026 ?auto_14034 ) ) ( not ( = ?auto_14026 ?auto_14052 ) ) ( not ( = ?auto_14027 ?auto_14034 ) ) ( not ( = ?auto_14027 ?auto_14052 ) ) ( not ( = ?auto_14028 ?auto_14034 ) ) ( not ( = ?auto_14028 ?auto_14052 ) ) ( not ( = ?auto_14029 ?auto_14034 ) ) ( not ( = ?auto_14029 ?auto_14052 ) ) ( not ( = ?auto_14030 ?auto_14034 ) ) ( not ( = ?auto_14030 ?auto_14052 ) ) ( not ( = ?auto_14031 ?auto_14034 ) ) ( not ( = ?auto_14031 ?auto_14052 ) ) ( not ( = ?auto_14032 ?auto_14034 ) ) ( not ( = ?auto_14032 ?auto_14052 ) ) ( not ( = ?auto_14034 ?auto_14048 ) ) ( not ( = ?auto_14034 ?auto_14073 ) ) ( not ( = ?auto_14034 ?auto_14054 ) ) ( not ( = ?auto_14034 ?auto_14063 ) ) ( not ( = ?auto_14034 ?auto_14059 ) ) ( not ( = ?auto_14034 ?auto_14064 ) ) ( not ( = ?auto_14034 ?auto_14070 ) ) ( not ( = ?auto_14034 ?auto_14050 ) ) ( not ( = ?auto_14034 ?auto_14065 ) ) ( not ( = ?auto_14066 ?auto_14053 ) ) ( not ( = ?auto_14066 ?auto_14055 ) ) ( not ( = ?auto_14066 ?auto_14046 ) ) ( not ( = ?auto_14066 ?auto_14072 ) ) ( not ( = ?auto_14066 ?auto_14056 ) ) ( not ( = ?auto_14066 ?auto_14060 ) ) ( not ( = ?auto_14066 ?auto_14061 ) ) ( not ( = ?auto_14066 ?auto_14069 ) ) ( not ( = ?auto_14062 ?auto_14045 ) ) ( not ( = ?auto_14062 ?auto_14057 ) ) ( not ( = ?auto_14062 ?auto_14068 ) ) ( not ( = ?auto_14062 ?auto_14058 ) ) ( not ( = ?auto_14062 ?auto_14047 ) ) ( not ( = ?auto_14062 ?auto_14071 ) ) ( not ( = ?auto_14062 ?auto_14044 ) ) ( not ( = ?auto_14062 ?auto_14051 ) ) ( not ( = ?auto_14052 ?auto_14048 ) ) ( not ( = ?auto_14052 ?auto_14073 ) ) ( not ( = ?auto_14052 ?auto_14054 ) ) ( not ( = ?auto_14052 ?auto_14063 ) ) ( not ( = ?auto_14052 ?auto_14059 ) ) ( not ( = ?auto_14052 ?auto_14064 ) ) ( not ( = ?auto_14052 ?auto_14070 ) ) ( not ( = ?auto_14052 ?auto_14050 ) ) ( not ( = ?auto_14052 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14035 ) ) ( not ( = ?auto_14024 ?auto_14049 ) ) ( not ( = ?auto_14025 ?auto_14035 ) ) ( not ( = ?auto_14025 ?auto_14049 ) ) ( not ( = ?auto_14026 ?auto_14035 ) ) ( not ( = ?auto_14026 ?auto_14049 ) ) ( not ( = ?auto_14027 ?auto_14035 ) ) ( not ( = ?auto_14027 ?auto_14049 ) ) ( not ( = ?auto_14028 ?auto_14035 ) ) ( not ( = ?auto_14028 ?auto_14049 ) ) ( not ( = ?auto_14029 ?auto_14035 ) ) ( not ( = ?auto_14029 ?auto_14049 ) ) ( not ( = ?auto_14030 ?auto_14035 ) ) ( not ( = ?auto_14030 ?auto_14049 ) ) ( not ( = ?auto_14031 ?auto_14035 ) ) ( not ( = ?auto_14031 ?auto_14049 ) ) ( not ( = ?auto_14032 ?auto_14035 ) ) ( not ( = ?auto_14032 ?auto_14049 ) ) ( not ( = ?auto_14033 ?auto_14035 ) ) ( not ( = ?auto_14033 ?auto_14049 ) ) ( not ( = ?auto_14035 ?auto_14052 ) ) ( not ( = ?auto_14035 ?auto_14048 ) ) ( not ( = ?auto_14035 ?auto_14073 ) ) ( not ( = ?auto_14035 ?auto_14054 ) ) ( not ( = ?auto_14035 ?auto_14063 ) ) ( not ( = ?auto_14035 ?auto_14059 ) ) ( not ( = ?auto_14035 ?auto_14064 ) ) ( not ( = ?auto_14035 ?auto_14070 ) ) ( not ( = ?auto_14035 ?auto_14050 ) ) ( not ( = ?auto_14035 ?auto_14065 ) ) ( not ( = ?auto_14049 ?auto_14052 ) ) ( not ( = ?auto_14049 ?auto_14048 ) ) ( not ( = ?auto_14049 ?auto_14073 ) ) ( not ( = ?auto_14049 ?auto_14054 ) ) ( not ( = ?auto_14049 ?auto_14063 ) ) ( not ( = ?auto_14049 ?auto_14059 ) ) ( not ( = ?auto_14049 ?auto_14064 ) ) ( not ( = ?auto_14049 ?auto_14070 ) ) ( not ( = ?auto_14049 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14036 ) ) ( not ( = ?auto_14024 ?auto_14067 ) ) ( not ( = ?auto_14025 ?auto_14036 ) ) ( not ( = ?auto_14025 ?auto_14067 ) ) ( not ( = ?auto_14026 ?auto_14036 ) ) ( not ( = ?auto_14026 ?auto_14067 ) ) ( not ( = ?auto_14027 ?auto_14036 ) ) ( not ( = ?auto_14027 ?auto_14067 ) ) ( not ( = ?auto_14028 ?auto_14036 ) ) ( not ( = ?auto_14028 ?auto_14067 ) ) ( not ( = ?auto_14029 ?auto_14036 ) ) ( not ( = ?auto_14029 ?auto_14067 ) ) ( not ( = ?auto_14030 ?auto_14036 ) ) ( not ( = ?auto_14030 ?auto_14067 ) ) ( not ( = ?auto_14031 ?auto_14036 ) ) ( not ( = ?auto_14031 ?auto_14067 ) ) ( not ( = ?auto_14032 ?auto_14036 ) ) ( not ( = ?auto_14032 ?auto_14067 ) ) ( not ( = ?auto_14033 ?auto_14036 ) ) ( not ( = ?auto_14033 ?auto_14067 ) ) ( not ( = ?auto_14034 ?auto_14036 ) ) ( not ( = ?auto_14034 ?auto_14067 ) ) ( not ( = ?auto_14036 ?auto_14049 ) ) ( not ( = ?auto_14036 ?auto_14052 ) ) ( not ( = ?auto_14036 ?auto_14048 ) ) ( not ( = ?auto_14036 ?auto_14073 ) ) ( not ( = ?auto_14036 ?auto_14054 ) ) ( not ( = ?auto_14036 ?auto_14063 ) ) ( not ( = ?auto_14036 ?auto_14059 ) ) ( not ( = ?auto_14036 ?auto_14064 ) ) ( not ( = ?auto_14036 ?auto_14070 ) ) ( not ( = ?auto_14036 ?auto_14050 ) ) ( not ( = ?auto_14036 ?auto_14065 ) ) ( not ( = ?auto_14067 ?auto_14049 ) ) ( not ( = ?auto_14067 ?auto_14052 ) ) ( not ( = ?auto_14067 ?auto_14048 ) ) ( not ( = ?auto_14067 ?auto_14073 ) ) ( not ( = ?auto_14067 ?auto_14054 ) ) ( not ( = ?auto_14067 ?auto_14063 ) ) ( not ( = ?auto_14067 ?auto_14059 ) ) ( not ( = ?auto_14067 ?auto_14064 ) ) ( not ( = ?auto_14067 ?auto_14070 ) ) ( not ( = ?auto_14067 ?auto_14050 ) ) ( not ( = ?auto_14067 ?auto_14065 ) ) ( not ( = ?auto_14024 ?auto_14037 ) ) ( not ( = ?auto_14024 ?auto_14041 ) ) ( not ( = ?auto_14025 ?auto_14037 ) ) ( not ( = ?auto_14025 ?auto_14041 ) ) ( not ( = ?auto_14026 ?auto_14037 ) ) ( not ( = ?auto_14026 ?auto_14041 ) ) ( not ( = ?auto_14027 ?auto_14037 ) ) ( not ( = ?auto_14027 ?auto_14041 ) ) ( not ( = ?auto_14028 ?auto_14037 ) ) ( not ( = ?auto_14028 ?auto_14041 ) ) ( not ( = ?auto_14029 ?auto_14037 ) ) ( not ( = ?auto_14029 ?auto_14041 ) ) ( not ( = ?auto_14030 ?auto_14037 ) ) ( not ( = ?auto_14030 ?auto_14041 ) ) ( not ( = ?auto_14031 ?auto_14037 ) ) ( not ( = ?auto_14031 ?auto_14041 ) ) ( not ( = ?auto_14032 ?auto_14037 ) ) ( not ( = ?auto_14032 ?auto_14041 ) ) ( not ( = ?auto_14033 ?auto_14037 ) ) ( not ( = ?auto_14033 ?auto_14041 ) ) ( not ( = ?auto_14034 ?auto_14037 ) ) ( not ( = ?auto_14034 ?auto_14041 ) ) ( not ( = ?auto_14035 ?auto_14037 ) ) ( not ( = ?auto_14035 ?auto_14041 ) ) ( not ( = ?auto_14037 ?auto_14067 ) ) ( not ( = ?auto_14037 ?auto_14049 ) ) ( not ( = ?auto_14037 ?auto_14052 ) ) ( not ( = ?auto_14037 ?auto_14048 ) ) ( not ( = ?auto_14037 ?auto_14073 ) ) ( not ( = ?auto_14037 ?auto_14054 ) ) ( not ( = ?auto_14037 ?auto_14063 ) ) ( not ( = ?auto_14037 ?auto_14059 ) ) ( not ( = ?auto_14037 ?auto_14064 ) ) ( not ( = ?auto_14037 ?auto_14070 ) ) ( not ( = ?auto_14037 ?auto_14050 ) ) ( not ( = ?auto_14037 ?auto_14065 ) ) ( not ( = ?auto_14039 ?auto_14069 ) ) ( not ( = ?auto_14039 ?auto_14061 ) ) ( not ( = ?auto_14039 ?auto_14066 ) ) ( not ( = ?auto_14039 ?auto_14053 ) ) ( not ( = ?auto_14039 ?auto_14055 ) ) ( not ( = ?auto_14039 ?auto_14046 ) ) ( not ( = ?auto_14039 ?auto_14072 ) ) ( not ( = ?auto_14039 ?auto_14056 ) ) ( not ( = ?auto_14039 ?auto_14060 ) ) ( not ( = ?auto_14042 ?auto_14051 ) ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14062 ) ) ( not ( = ?auto_14042 ?auto_14045 ) ) ( not ( = ?auto_14042 ?auto_14057 ) ) ( not ( = ?auto_14042 ?auto_14068 ) ) ( not ( = ?auto_14042 ?auto_14058 ) ) ( not ( = ?auto_14042 ?auto_14047 ) ) ( not ( = ?auto_14042 ?auto_14071 ) ) ( not ( = ?auto_14041 ?auto_14067 ) ) ( not ( = ?auto_14041 ?auto_14049 ) ) ( not ( = ?auto_14041 ?auto_14052 ) ) ( not ( = ?auto_14041 ?auto_14048 ) ) ( not ( = ?auto_14041 ?auto_14073 ) ) ( not ( = ?auto_14041 ?auto_14054 ) ) ( not ( = ?auto_14041 ?auto_14063 ) ) ( not ( = ?auto_14041 ?auto_14059 ) ) ( not ( = ?auto_14041 ?auto_14064 ) ) ( not ( = ?auto_14041 ?auto_14070 ) ) ( not ( = ?auto_14041 ?auto_14050 ) ) ( not ( = ?auto_14041 ?auto_14065 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14024 ?auto_14025 ?auto_14026 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14031 ?auto_14032 ?auto_14033 ?auto_14034 ?auto_14035 ?auto_14036 )
      ( MAKE-1CRATE ?auto_14036 ?auto_14037 )
      ( MAKE-13CRATE-VERIFY ?auto_14024 ?auto_14025 ?auto_14026 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14031 ?auto_14032 ?auto_14033 ?auto_14034 ?auto_14035 ?auto_14036 ?auto_14037 ) )
  )

)

