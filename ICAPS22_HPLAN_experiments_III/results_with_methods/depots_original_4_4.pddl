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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13449 - SURFACE
      ?auto_13450 - SURFACE
    )
    :vars
    (
      ?auto_13451 - HOIST
      ?auto_13452 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13451 ?auto_13452 ) ( SURFACE-AT ?auto_13449 ?auto_13452 ) ( CLEAR ?auto_13449 ) ( LIFTING ?auto_13451 ?auto_13450 ) ( IS-CRATE ?auto_13450 ) ( not ( = ?auto_13449 ?auto_13450 ) ) )
    :subtasks
    ( ( !DROP ?auto_13451 ?auto_13450 ?auto_13449 ?auto_13452 )
      ( MAKE-1CRATE-VERIFY ?auto_13449 ?auto_13450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13453 - SURFACE
      ?auto_13454 - SURFACE
    )
    :vars
    (
      ?auto_13455 - HOIST
      ?auto_13456 - PLACE
      ?auto_13457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13455 ?auto_13456 ) ( SURFACE-AT ?auto_13453 ?auto_13456 ) ( CLEAR ?auto_13453 ) ( IS-CRATE ?auto_13454 ) ( not ( = ?auto_13453 ?auto_13454 ) ) ( TRUCK-AT ?auto_13457 ?auto_13456 ) ( AVAILABLE ?auto_13455 ) ( IN ?auto_13454 ?auto_13457 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13455 ?auto_13454 ?auto_13457 ?auto_13456 )
      ( MAKE-1CRATE ?auto_13453 ?auto_13454 )
      ( MAKE-1CRATE-VERIFY ?auto_13453 ?auto_13454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13458 - SURFACE
      ?auto_13459 - SURFACE
    )
    :vars
    (
      ?auto_13462 - HOIST
      ?auto_13461 - PLACE
      ?auto_13460 - TRUCK
      ?auto_13463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13462 ?auto_13461 ) ( SURFACE-AT ?auto_13458 ?auto_13461 ) ( CLEAR ?auto_13458 ) ( IS-CRATE ?auto_13459 ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( AVAILABLE ?auto_13462 ) ( IN ?auto_13459 ?auto_13460 ) ( TRUCK-AT ?auto_13460 ?auto_13463 ) ( not ( = ?auto_13463 ?auto_13461 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13460 ?auto_13463 ?auto_13461 )
      ( MAKE-1CRATE ?auto_13458 ?auto_13459 )
      ( MAKE-1CRATE-VERIFY ?auto_13458 ?auto_13459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13464 - SURFACE
      ?auto_13465 - SURFACE
    )
    :vars
    (
      ?auto_13467 - HOIST
      ?auto_13466 - PLACE
      ?auto_13468 - TRUCK
      ?auto_13469 - PLACE
      ?auto_13470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13467 ?auto_13466 ) ( SURFACE-AT ?auto_13464 ?auto_13466 ) ( CLEAR ?auto_13464 ) ( IS-CRATE ?auto_13465 ) ( not ( = ?auto_13464 ?auto_13465 ) ) ( AVAILABLE ?auto_13467 ) ( TRUCK-AT ?auto_13468 ?auto_13469 ) ( not ( = ?auto_13469 ?auto_13466 ) ) ( HOIST-AT ?auto_13470 ?auto_13469 ) ( LIFTING ?auto_13470 ?auto_13465 ) ( not ( = ?auto_13467 ?auto_13470 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13470 ?auto_13465 ?auto_13468 ?auto_13469 )
      ( MAKE-1CRATE ?auto_13464 ?auto_13465 )
      ( MAKE-1CRATE-VERIFY ?auto_13464 ?auto_13465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13471 - SURFACE
      ?auto_13472 - SURFACE
    )
    :vars
    (
      ?auto_13473 - HOIST
      ?auto_13475 - PLACE
      ?auto_13476 - TRUCK
      ?auto_13474 - PLACE
      ?auto_13477 - HOIST
      ?auto_13478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13473 ?auto_13475 ) ( SURFACE-AT ?auto_13471 ?auto_13475 ) ( CLEAR ?auto_13471 ) ( IS-CRATE ?auto_13472 ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( AVAILABLE ?auto_13473 ) ( TRUCK-AT ?auto_13476 ?auto_13474 ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( HOIST-AT ?auto_13477 ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13477 ) ) ( AVAILABLE ?auto_13477 ) ( SURFACE-AT ?auto_13472 ?auto_13474 ) ( ON ?auto_13472 ?auto_13478 ) ( CLEAR ?auto_13472 ) ( not ( = ?auto_13471 ?auto_13478 ) ) ( not ( = ?auto_13472 ?auto_13478 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13477 ?auto_13472 ?auto_13478 ?auto_13474 )
      ( MAKE-1CRATE ?auto_13471 ?auto_13472 )
      ( MAKE-1CRATE-VERIFY ?auto_13471 ?auto_13472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13479 - SURFACE
      ?auto_13480 - SURFACE
    )
    :vars
    (
      ?auto_13483 - HOIST
      ?auto_13485 - PLACE
      ?auto_13484 - PLACE
      ?auto_13482 - HOIST
      ?auto_13481 - SURFACE
      ?auto_13486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13483 ?auto_13485 ) ( SURFACE-AT ?auto_13479 ?auto_13485 ) ( CLEAR ?auto_13479 ) ( IS-CRATE ?auto_13480 ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( AVAILABLE ?auto_13483 ) ( not ( = ?auto_13484 ?auto_13485 ) ) ( HOIST-AT ?auto_13482 ?auto_13484 ) ( not ( = ?auto_13483 ?auto_13482 ) ) ( AVAILABLE ?auto_13482 ) ( SURFACE-AT ?auto_13480 ?auto_13484 ) ( ON ?auto_13480 ?auto_13481 ) ( CLEAR ?auto_13480 ) ( not ( = ?auto_13479 ?auto_13481 ) ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( TRUCK-AT ?auto_13486 ?auto_13485 ) )
    :subtasks
    ( ( !DRIVE ?auto_13486 ?auto_13485 ?auto_13484 )
      ( MAKE-1CRATE ?auto_13479 ?auto_13480 )
      ( MAKE-1CRATE-VERIFY ?auto_13479 ?auto_13480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13492 - SURFACE
      ?auto_13493 - SURFACE
    )
    :vars
    (
      ?auto_13494 - HOIST
      ?auto_13495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13494 ?auto_13495 ) ( SURFACE-AT ?auto_13492 ?auto_13495 ) ( CLEAR ?auto_13492 ) ( LIFTING ?auto_13494 ?auto_13493 ) ( IS-CRATE ?auto_13493 ) ( not ( = ?auto_13492 ?auto_13493 ) ) )
    :subtasks
    ( ( !DROP ?auto_13494 ?auto_13493 ?auto_13492 ?auto_13495 )
      ( MAKE-1CRATE-VERIFY ?auto_13492 ?auto_13493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13496 - SURFACE
      ?auto_13497 - SURFACE
      ?auto_13498 - SURFACE
    )
    :vars
    (
      ?auto_13500 - HOIST
      ?auto_13499 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13500 ?auto_13499 ) ( SURFACE-AT ?auto_13497 ?auto_13499 ) ( CLEAR ?auto_13497 ) ( LIFTING ?auto_13500 ?auto_13498 ) ( IS-CRATE ?auto_13498 ) ( not ( = ?auto_13497 ?auto_13498 ) ) ( ON ?auto_13497 ?auto_13496 ) ( not ( = ?auto_13496 ?auto_13497 ) ) ( not ( = ?auto_13496 ?auto_13498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13497 ?auto_13498 )
      ( MAKE-2CRATE-VERIFY ?auto_13496 ?auto_13497 ?auto_13498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13501 - SURFACE
      ?auto_13502 - SURFACE
    )
    :vars
    (
      ?auto_13504 - HOIST
      ?auto_13503 - PLACE
      ?auto_13505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13504 ?auto_13503 ) ( SURFACE-AT ?auto_13501 ?auto_13503 ) ( CLEAR ?auto_13501 ) ( IS-CRATE ?auto_13502 ) ( not ( = ?auto_13501 ?auto_13502 ) ) ( TRUCK-AT ?auto_13505 ?auto_13503 ) ( AVAILABLE ?auto_13504 ) ( IN ?auto_13502 ?auto_13505 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13504 ?auto_13502 ?auto_13505 ?auto_13503 )
      ( MAKE-1CRATE ?auto_13501 ?auto_13502 )
      ( MAKE-1CRATE-VERIFY ?auto_13501 ?auto_13502 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13506 - SURFACE
      ?auto_13507 - SURFACE
      ?auto_13508 - SURFACE
    )
    :vars
    (
      ?auto_13511 - HOIST
      ?auto_13510 - PLACE
      ?auto_13509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13511 ?auto_13510 ) ( SURFACE-AT ?auto_13507 ?auto_13510 ) ( CLEAR ?auto_13507 ) ( IS-CRATE ?auto_13508 ) ( not ( = ?auto_13507 ?auto_13508 ) ) ( TRUCK-AT ?auto_13509 ?auto_13510 ) ( AVAILABLE ?auto_13511 ) ( IN ?auto_13508 ?auto_13509 ) ( ON ?auto_13507 ?auto_13506 ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13507 ?auto_13508 )
      ( MAKE-2CRATE-VERIFY ?auto_13506 ?auto_13507 ?auto_13508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13512 - SURFACE
      ?auto_13513 - SURFACE
    )
    :vars
    (
      ?auto_13514 - HOIST
      ?auto_13516 - PLACE
      ?auto_13517 - TRUCK
      ?auto_13515 - SURFACE
      ?auto_13518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13514 ?auto_13516 ) ( SURFACE-AT ?auto_13512 ?auto_13516 ) ( CLEAR ?auto_13512 ) ( IS-CRATE ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( AVAILABLE ?auto_13514 ) ( IN ?auto_13513 ?auto_13517 ) ( ON ?auto_13512 ?auto_13515 ) ( not ( = ?auto_13515 ?auto_13512 ) ) ( not ( = ?auto_13515 ?auto_13513 ) ) ( TRUCK-AT ?auto_13517 ?auto_13518 ) ( not ( = ?auto_13518 ?auto_13516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13517 ?auto_13518 ?auto_13516 )
      ( MAKE-2CRATE ?auto_13515 ?auto_13512 ?auto_13513 )
      ( MAKE-1CRATE-VERIFY ?auto_13512 ?auto_13513 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13519 - SURFACE
      ?auto_13520 - SURFACE
      ?auto_13521 - SURFACE
    )
    :vars
    (
      ?auto_13525 - HOIST
      ?auto_13522 - PLACE
      ?auto_13523 - TRUCK
      ?auto_13524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13525 ?auto_13522 ) ( SURFACE-AT ?auto_13520 ?auto_13522 ) ( CLEAR ?auto_13520 ) ( IS-CRATE ?auto_13521 ) ( not ( = ?auto_13520 ?auto_13521 ) ) ( AVAILABLE ?auto_13525 ) ( IN ?auto_13521 ?auto_13523 ) ( ON ?auto_13520 ?auto_13519 ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( not ( = ?auto_13519 ?auto_13521 ) ) ( TRUCK-AT ?auto_13523 ?auto_13524 ) ( not ( = ?auto_13524 ?auto_13522 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13520 ?auto_13521 )
      ( MAKE-2CRATE-VERIFY ?auto_13519 ?auto_13520 ?auto_13521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13526 - SURFACE
      ?auto_13527 - SURFACE
    )
    :vars
    (
      ?auto_13532 - HOIST
      ?auto_13531 - PLACE
      ?auto_13529 - SURFACE
      ?auto_13530 - TRUCK
      ?auto_13528 - PLACE
      ?auto_13533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13532 ?auto_13531 ) ( SURFACE-AT ?auto_13526 ?auto_13531 ) ( CLEAR ?auto_13526 ) ( IS-CRATE ?auto_13527 ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( AVAILABLE ?auto_13532 ) ( ON ?auto_13526 ?auto_13529 ) ( not ( = ?auto_13529 ?auto_13526 ) ) ( not ( = ?auto_13529 ?auto_13527 ) ) ( TRUCK-AT ?auto_13530 ?auto_13528 ) ( not ( = ?auto_13528 ?auto_13531 ) ) ( HOIST-AT ?auto_13533 ?auto_13528 ) ( LIFTING ?auto_13533 ?auto_13527 ) ( not ( = ?auto_13532 ?auto_13533 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13533 ?auto_13527 ?auto_13530 ?auto_13528 )
      ( MAKE-2CRATE ?auto_13529 ?auto_13526 ?auto_13527 )
      ( MAKE-1CRATE-VERIFY ?auto_13526 ?auto_13527 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13534 - SURFACE
      ?auto_13535 - SURFACE
      ?auto_13536 - SURFACE
    )
    :vars
    (
      ?auto_13540 - HOIST
      ?auto_13537 - PLACE
      ?auto_13538 - TRUCK
      ?auto_13541 - PLACE
      ?auto_13539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13540 ?auto_13537 ) ( SURFACE-AT ?auto_13535 ?auto_13537 ) ( CLEAR ?auto_13535 ) ( IS-CRATE ?auto_13536 ) ( not ( = ?auto_13535 ?auto_13536 ) ) ( AVAILABLE ?auto_13540 ) ( ON ?auto_13535 ?auto_13534 ) ( not ( = ?auto_13534 ?auto_13535 ) ) ( not ( = ?auto_13534 ?auto_13536 ) ) ( TRUCK-AT ?auto_13538 ?auto_13541 ) ( not ( = ?auto_13541 ?auto_13537 ) ) ( HOIST-AT ?auto_13539 ?auto_13541 ) ( LIFTING ?auto_13539 ?auto_13536 ) ( not ( = ?auto_13540 ?auto_13539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13535 ?auto_13536 )
      ( MAKE-2CRATE-VERIFY ?auto_13534 ?auto_13535 ?auto_13536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13542 - SURFACE
      ?auto_13543 - SURFACE
    )
    :vars
    (
      ?auto_13548 - HOIST
      ?auto_13545 - PLACE
      ?auto_13547 - SURFACE
      ?auto_13549 - TRUCK
      ?auto_13544 - PLACE
      ?auto_13546 - HOIST
      ?auto_13550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13548 ?auto_13545 ) ( SURFACE-AT ?auto_13542 ?auto_13545 ) ( CLEAR ?auto_13542 ) ( IS-CRATE ?auto_13543 ) ( not ( = ?auto_13542 ?auto_13543 ) ) ( AVAILABLE ?auto_13548 ) ( ON ?auto_13542 ?auto_13547 ) ( not ( = ?auto_13547 ?auto_13542 ) ) ( not ( = ?auto_13547 ?auto_13543 ) ) ( TRUCK-AT ?auto_13549 ?auto_13544 ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( HOIST-AT ?auto_13546 ?auto_13544 ) ( not ( = ?auto_13548 ?auto_13546 ) ) ( AVAILABLE ?auto_13546 ) ( SURFACE-AT ?auto_13543 ?auto_13544 ) ( ON ?auto_13543 ?auto_13550 ) ( CLEAR ?auto_13543 ) ( not ( = ?auto_13542 ?auto_13550 ) ) ( not ( = ?auto_13543 ?auto_13550 ) ) ( not ( = ?auto_13547 ?auto_13550 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13546 ?auto_13543 ?auto_13550 ?auto_13544 )
      ( MAKE-2CRATE ?auto_13547 ?auto_13542 ?auto_13543 )
      ( MAKE-1CRATE-VERIFY ?auto_13542 ?auto_13543 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13551 - SURFACE
      ?auto_13552 - SURFACE
      ?auto_13553 - SURFACE
    )
    :vars
    (
      ?auto_13559 - HOIST
      ?auto_13555 - PLACE
      ?auto_13556 - TRUCK
      ?auto_13554 - PLACE
      ?auto_13558 - HOIST
      ?auto_13557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13559 ?auto_13555 ) ( SURFACE-AT ?auto_13552 ?auto_13555 ) ( CLEAR ?auto_13552 ) ( IS-CRATE ?auto_13553 ) ( not ( = ?auto_13552 ?auto_13553 ) ) ( AVAILABLE ?auto_13559 ) ( ON ?auto_13552 ?auto_13551 ) ( not ( = ?auto_13551 ?auto_13552 ) ) ( not ( = ?auto_13551 ?auto_13553 ) ) ( TRUCK-AT ?auto_13556 ?auto_13554 ) ( not ( = ?auto_13554 ?auto_13555 ) ) ( HOIST-AT ?auto_13558 ?auto_13554 ) ( not ( = ?auto_13559 ?auto_13558 ) ) ( AVAILABLE ?auto_13558 ) ( SURFACE-AT ?auto_13553 ?auto_13554 ) ( ON ?auto_13553 ?auto_13557 ) ( CLEAR ?auto_13553 ) ( not ( = ?auto_13552 ?auto_13557 ) ) ( not ( = ?auto_13553 ?auto_13557 ) ) ( not ( = ?auto_13551 ?auto_13557 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13552 ?auto_13553 )
      ( MAKE-2CRATE-VERIFY ?auto_13551 ?auto_13552 ?auto_13553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13560 - SURFACE
      ?auto_13561 - SURFACE
    )
    :vars
    (
      ?auto_13566 - HOIST
      ?auto_13568 - PLACE
      ?auto_13563 - SURFACE
      ?auto_13567 - PLACE
      ?auto_13562 - HOIST
      ?auto_13565 - SURFACE
      ?auto_13564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13566 ?auto_13568 ) ( SURFACE-AT ?auto_13560 ?auto_13568 ) ( CLEAR ?auto_13560 ) ( IS-CRATE ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( AVAILABLE ?auto_13566 ) ( ON ?auto_13560 ?auto_13563 ) ( not ( = ?auto_13563 ?auto_13560 ) ) ( not ( = ?auto_13563 ?auto_13561 ) ) ( not ( = ?auto_13567 ?auto_13568 ) ) ( HOIST-AT ?auto_13562 ?auto_13567 ) ( not ( = ?auto_13566 ?auto_13562 ) ) ( AVAILABLE ?auto_13562 ) ( SURFACE-AT ?auto_13561 ?auto_13567 ) ( ON ?auto_13561 ?auto_13565 ) ( CLEAR ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13565 ) ) ( not ( = ?auto_13561 ?auto_13565 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( TRUCK-AT ?auto_13564 ?auto_13568 ) )
    :subtasks
    ( ( !DRIVE ?auto_13564 ?auto_13568 ?auto_13567 )
      ( MAKE-2CRATE ?auto_13563 ?auto_13560 ?auto_13561 )
      ( MAKE-1CRATE-VERIFY ?auto_13560 ?auto_13561 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13569 - SURFACE
      ?auto_13570 - SURFACE
      ?auto_13571 - SURFACE
    )
    :vars
    (
      ?auto_13575 - HOIST
      ?auto_13574 - PLACE
      ?auto_13576 - PLACE
      ?auto_13572 - HOIST
      ?auto_13573 - SURFACE
      ?auto_13577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13575 ?auto_13574 ) ( SURFACE-AT ?auto_13570 ?auto_13574 ) ( CLEAR ?auto_13570 ) ( IS-CRATE ?auto_13571 ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( AVAILABLE ?auto_13575 ) ( ON ?auto_13570 ?auto_13569 ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13576 ?auto_13574 ) ) ( HOIST-AT ?auto_13572 ?auto_13576 ) ( not ( = ?auto_13575 ?auto_13572 ) ) ( AVAILABLE ?auto_13572 ) ( SURFACE-AT ?auto_13571 ?auto_13576 ) ( ON ?auto_13571 ?auto_13573 ) ( CLEAR ?auto_13571 ) ( not ( = ?auto_13570 ?auto_13573 ) ) ( not ( = ?auto_13571 ?auto_13573 ) ) ( not ( = ?auto_13569 ?auto_13573 ) ) ( TRUCK-AT ?auto_13577 ?auto_13574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13570 ?auto_13571 )
      ( MAKE-2CRATE-VERIFY ?auto_13569 ?auto_13570 ?auto_13571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13578 - SURFACE
      ?auto_13579 - SURFACE
    )
    :vars
    (
      ?auto_13586 - HOIST
      ?auto_13584 - PLACE
      ?auto_13583 - SURFACE
      ?auto_13585 - PLACE
      ?auto_13581 - HOIST
      ?auto_13580 - SURFACE
      ?auto_13582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13586 ?auto_13584 ) ( IS-CRATE ?auto_13579 ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( not ( = ?auto_13583 ?auto_13578 ) ) ( not ( = ?auto_13583 ?auto_13579 ) ) ( not ( = ?auto_13585 ?auto_13584 ) ) ( HOIST-AT ?auto_13581 ?auto_13585 ) ( not ( = ?auto_13586 ?auto_13581 ) ) ( AVAILABLE ?auto_13581 ) ( SURFACE-AT ?auto_13579 ?auto_13585 ) ( ON ?auto_13579 ?auto_13580 ) ( CLEAR ?auto_13579 ) ( not ( = ?auto_13578 ?auto_13580 ) ) ( not ( = ?auto_13579 ?auto_13580 ) ) ( not ( = ?auto_13583 ?auto_13580 ) ) ( TRUCK-AT ?auto_13582 ?auto_13584 ) ( SURFACE-AT ?auto_13583 ?auto_13584 ) ( CLEAR ?auto_13583 ) ( LIFTING ?auto_13586 ?auto_13578 ) ( IS-CRATE ?auto_13578 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13583 ?auto_13578 )
      ( MAKE-2CRATE ?auto_13583 ?auto_13578 ?auto_13579 )
      ( MAKE-1CRATE-VERIFY ?auto_13578 ?auto_13579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13587 - SURFACE
      ?auto_13588 - SURFACE
      ?auto_13589 - SURFACE
    )
    :vars
    (
      ?auto_13593 - HOIST
      ?auto_13592 - PLACE
      ?auto_13594 - PLACE
      ?auto_13590 - HOIST
      ?auto_13591 - SURFACE
      ?auto_13595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13593 ?auto_13592 ) ( IS-CRATE ?auto_13589 ) ( not ( = ?auto_13588 ?auto_13589 ) ) ( not ( = ?auto_13587 ?auto_13588 ) ) ( not ( = ?auto_13587 ?auto_13589 ) ) ( not ( = ?auto_13594 ?auto_13592 ) ) ( HOIST-AT ?auto_13590 ?auto_13594 ) ( not ( = ?auto_13593 ?auto_13590 ) ) ( AVAILABLE ?auto_13590 ) ( SURFACE-AT ?auto_13589 ?auto_13594 ) ( ON ?auto_13589 ?auto_13591 ) ( CLEAR ?auto_13589 ) ( not ( = ?auto_13588 ?auto_13591 ) ) ( not ( = ?auto_13589 ?auto_13591 ) ) ( not ( = ?auto_13587 ?auto_13591 ) ) ( TRUCK-AT ?auto_13595 ?auto_13592 ) ( SURFACE-AT ?auto_13587 ?auto_13592 ) ( CLEAR ?auto_13587 ) ( LIFTING ?auto_13593 ?auto_13588 ) ( IS-CRATE ?auto_13588 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13588 ?auto_13589 )
      ( MAKE-2CRATE-VERIFY ?auto_13587 ?auto_13588 ?auto_13589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13596 - SURFACE
      ?auto_13597 - SURFACE
    )
    :vars
    (
      ?auto_13598 - HOIST
      ?auto_13601 - PLACE
      ?auto_13599 - SURFACE
      ?auto_13603 - PLACE
      ?auto_13602 - HOIST
      ?auto_13604 - SURFACE
      ?auto_13600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13598 ?auto_13601 ) ( IS-CRATE ?auto_13597 ) ( not ( = ?auto_13596 ?auto_13597 ) ) ( not ( = ?auto_13599 ?auto_13596 ) ) ( not ( = ?auto_13599 ?auto_13597 ) ) ( not ( = ?auto_13603 ?auto_13601 ) ) ( HOIST-AT ?auto_13602 ?auto_13603 ) ( not ( = ?auto_13598 ?auto_13602 ) ) ( AVAILABLE ?auto_13602 ) ( SURFACE-AT ?auto_13597 ?auto_13603 ) ( ON ?auto_13597 ?auto_13604 ) ( CLEAR ?auto_13597 ) ( not ( = ?auto_13596 ?auto_13604 ) ) ( not ( = ?auto_13597 ?auto_13604 ) ) ( not ( = ?auto_13599 ?auto_13604 ) ) ( TRUCK-AT ?auto_13600 ?auto_13601 ) ( SURFACE-AT ?auto_13599 ?auto_13601 ) ( CLEAR ?auto_13599 ) ( IS-CRATE ?auto_13596 ) ( AVAILABLE ?auto_13598 ) ( IN ?auto_13596 ?auto_13600 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13598 ?auto_13596 ?auto_13600 ?auto_13601 )
      ( MAKE-2CRATE ?auto_13599 ?auto_13596 ?auto_13597 )
      ( MAKE-1CRATE-VERIFY ?auto_13596 ?auto_13597 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13605 - SURFACE
      ?auto_13606 - SURFACE
      ?auto_13607 - SURFACE
    )
    :vars
    (
      ?auto_13608 - HOIST
      ?auto_13609 - PLACE
      ?auto_13611 - PLACE
      ?auto_13610 - HOIST
      ?auto_13612 - SURFACE
      ?auto_13613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13608 ?auto_13609 ) ( IS-CRATE ?auto_13607 ) ( not ( = ?auto_13606 ?auto_13607 ) ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( not ( = ?auto_13605 ?auto_13607 ) ) ( not ( = ?auto_13611 ?auto_13609 ) ) ( HOIST-AT ?auto_13610 ?auto_13611 ) ( not ( = ?auto_13608 ?auto_13610 ) ) ( AVAILABLE ?auto_13610 ) ( SURFACE-AT ?auto_13607 ?auto_13611 ) ( ON ?auto_13607 ?auto_13612 ) ( CLEAR ?auto_13607 ) ( not ( = ?auto_13606 ?auto_13612 ) ) ( not ( = ?auto_13607 ?auto_13612 ) ) ( not ( = ?auto_13605 ?auto_13612 ) ) ( TRUCK-AT ?auto_13613 ?auto_13609 ) ( SURFACE-AT ?auto_13605 ?auto_13609 ) ( CLEAR ?auto_13605 ) ( IS-CRATE ?auto_13606 ) ( AVAILABLE ?auto_13608 ) ( IN ?auto_13606 ?auto_13613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13606 ?auto_13607 )
      ( MAKE-2CRATE-VERIFY ?auto_13605 ?auto_13606 ?auto_13607 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13614 - SURFACE
      ?auto_13615 - SURFACE
    )
    :vars
    (
      ?auto_13621 - HOIST
      ?auto_13622 - PLACE
      ?auto_13618 - SURFACE
      ?auto_13616 - PLACE
      ?auto_13619 - HOIST
      ?auto_13617 - SURFACE
      ?auto_13620 - TRUCK
      ?auto_13623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13621 ?auto_13622 ) ( IS-CRATE ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13618 ?auto_13614 ) ) ( not ( = ?auto_13618 ?auto_13615 ) ) ( not ( = ?auto_13616 ?auto_13622 ) ) ( HOIST-AT ?auto_13619 ?auto_13616 ) ( not ( = ?auto_13621 ?auto_13619 ) ) ( AVAILABLE ?auto_13619 ) ( SURFACE-AT ?auto_13615 ?auto_13616 ) ( ON ?auto_13615 ?auto_13617 ) ( CLEAR ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13615 ?auto_13617 ) ) ( not ( = ?auto_13618 ?auto_13617 ) ) ( SURFACE-AT ?auto_13618 ?auto_13622 ) ( CLEAR ?auto_13618 ) ( IS-CRATE ?auto_13614 ) ( AVAILABLE ?auto_13621 ) ( IN ?auto_13614 ?auto_13620 ) ( TRUCK-AT ?auto_13620 ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13622 ) ) ( not ( = ?auto_13616 ?auto_13623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13620 ?auto_13623 ?auto_13622 )
      ( MAKE-2CRATE ?auto_13618 ?auto_13614 ?auto_13615 )
      ( MAKE-1CRATE-VERIFY ?auto_13614 ?auto_13615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13624 - SURFACE
      ?auto_13625 - SURFACE
      ?auto_13626 - SURFACE
    )
    :vars
    (
      ?auto_13629 - HOIST
      ?auto_13632 - PLACE
      ?auto_13633 - PLACE
      ?auto_13627 - HOIST
      ?auto_13630 - SURFACE
      ?auto_13631 - TRUCK
      ?auto_13628 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13629 ?auto_13632 ) ( IS-CRATE ?auto_13626 ) ( not ( = ?auto_13625 ?auto_13626 ) ) ( not ( = ?auto_13624 ?auto_13625 ) ) ( not ( = ?auto_13624 ?auto_13626 ) ) ( not ( = ?auto_13633 ?auto_13632 ) ) ( HOIST-AT ?auto_13627 ?auto_13633 ) ( not ( = ?auto_13629 ?auto_13627 ) ) ( AVAILABLE ?auto_13627 ) ( SURFACE-AT ?auto_13626 ?auto_13633 ) ( ON ?auto_13626 ?auto_13630 ) ( CLEAR ?auto_13626 ) ( not ( = ?auto_13625 ?auto_13630 ) ) ( not ( = ?auto_13626 ?auto_13630 ) ) ( not ( = ?auto_13624 ?auto_13630 ) ) ( SURFACE-AT ?auto_13624 ?auto_13632 ) ( CLEAR ?auto_13624 ) ( IS-CRATE ?auto_13625 ) ( AVAILABLE ?auto_13629 ) ( IN ?auto_13625 ?auto_13631 ) ( TRUCK-AT ?auto_13631 ?auto_13628 ) ( not ( = ?auto_13628 ?auto_13632 ) ) ( not ( = ?auto_13633 ?auto_13628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13625 ?auto_13626 )
      ( MAKE-2CRATE-VERIFY ?auto_13624 ?auto_13625 ?auto_13626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13634 - SURFACE
      ?auto_13635 - SURFACE
    )
    :vars
    (
      ?auto_13640 - HOIST
      ?auto_13643 - PLACE
      ?auto_13639 - SURFACE
      ?auto_13641 - PLACE
      ?auto_13638 - HOIST
      ?auto_13637 - SURFACE
      ?auto_13636 - TRUCK
      ?auto_13642 - PLACE
      ?auto_13644 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13640 ?auto_13643 ) ( IS-CRATE ?auto_13635 ) ( not ( = ?auto_13634 ?auto_13635 ) ) ( not ( = ?auto_13639 ?auto_13634 ) ) ( not ( = ?auto_13639 ?auto_13635 ) ) ( not ( = ?auto_13641 ?auto_13643 ) ) ( HOIST-AT ?auto_13638 ?auto_13641 ) ( not ( = ?auto_13640 ?auto_13638 ) ) ( AVAILABLE ?auto_13638 ) ( SURFACE-AT ?auto_13635 ?auto_13641 ) ( ON ?auto_13635 ?auto_13637 ) ( CLEAR ?auto_13635 ) ( not ( = ?auto_13634 ?auto_13637 ) ) ( not ( = ?auto_13635 ?auto_13637 ) ) ( not ( = ?auto_13639 ?auto_13637 ) ) ( SURFACE-AT ?auto_13639 ?auto_13643 ) ( CLEAR ?auto_13639 ) ( IS-CRATE ?auto_13634 ) ( AVAILABLE ?auto_13640 ) ( TRUCK-AT ?auto_13636 ?auto_13642 ) ( not ( = ?auto_13642 ?auto_13643 ) ) ( not ( = ?auto_13641 ?auto_13642 ) ) ( HOIST-AT ?auto_13644 ?auto_13642 ) ( LIFTING ?auto_13644 ?auto_13634 ) ( not ( = ?auto_13640 ?auto_13644 ) ) ( not ( = ?auto_13638 ?auto_13644 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13644 ?auto_13634 ?auto_13636 ?auto_13642 )
      ( MAKE-2CRATE ?auto_13639 ?auto_13634 ?auto_13635 )
      ( MAKE-1CRATE-VERIFY ?auto_13634 ?auto_13635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13645 - SURFACE
      ?auto_13646 - SURFACE
      ?auto_13647 - SURFACE
    )
    :vars
    (
      ?auto_13653 - HOIST
      ?auto_13648 - PLACE
      ?auto_13655 - PLACE
      ?auto_13649 - HOIST
      ?auto_13651 - SURFACE
      ?auto_13654 - TRUCK
      ?auto_13652 - PLACE
      ?auto_13650 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13653 ?auto_13648 ) ( IS-CRATE ?auto_13647 ) ( not ( = ?auto_13646 ?auto_13647 ) ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( not ( = ?auto_13645 ?auto_13647 ) ) ( not ( = ?auto_13655 ?auto_13648 ) ) ( HOIST-AT ?auto_13649 ?auto_13655 ) ( not ( = ?auto_13653 ?auto_13649 ) ) ( AVAILABLE ?auto_13649 ) ( SURFACE-AT ?auto_13647 ?auto_13655 ) ( ON ?auto_13647 ?auto_13651 ) ( CLEAR ?auto_13647 ) ( not ( = ?auto_13646 ?auto_13651 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) ( not ( = ?auto_13645 ?auto_13651 ) ) ( SURFACE-AT ?auto_13645 ?auto_13648 ) ( CLEAR ?auto_13645 ) ( IS-CRATE ?auto_13646 ) ( AVAILABLE ?auto_13653 ) ( TRUCK-AT ?auto_13654 ?auto_13652 ) ( not ( = ?auto_13652 ?auto_13648 ) ) ( not ( = ?auto_13655 ?auto_13652 ) ) ( HOIST-AT ?auto_13650 ?auto_13652 ) ( LIFTING ?auto_13650 ?auto_13646 ) ( not ( = ?auto_13653 ?auto_13650 ) ) ( not ( = ?auto_13649 ?auto_13650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13646 ?auto_13647 )
      ( MAKE-2CRATE-VERIFY ?auto_13645 ?auto_13646 ?auto_13647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13656 - SURFACE
      ?auto_13657 - SURFACE
    )
    :vars
    (
      ?auto_13662 - HOIST
      ?auto_13658 - PLACE
      ?auto_13666 - SURFACE
      ?auto_13663 - PLACE
      ?auto_13665 - HOIST
      ?auto_13661 - SURFACE
      ?auto_13660 - TRUCK
      ?auto_13659 - PLACE
      ?auto_13664 - HOIST
      ?auto_13667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13662 ?auto_13658 ) ( IS-CRATE ?auto_13657 ) ( not ( = ?auto_13656 ?auto_13657 ) ) ( not ( = ?auto_13666 ?auto_13656 ) ) ( not ( = ?auto_13666 ?auto_13657 ) ) ( not ( = ?auto_13663 ?auto_13658 ) ) ( HOIST-AT ?auto_13665 ?auto_13663 ) ( not ( = ?auto_13662 ?auto_13665 ) ) ( AVAILABLE ?auto_13665 ) ( SURFACE-AT ?auto_13657 ?auto_13663 ) ( ON ?auto_13657 ?auto_13661 ) ( CLEAR ?auto_13657 ) ( not ( = ?auto_13656 ?auto_13661 ) ) ( not ( = ?auto_13657 ?auto_13661 ) ) ( not ( = ?auto_13666 ?auto_13661 ) ) ( SURFACE-AT ?auto_13666 ?auto_13658 ) ( CLEAR ?auto_13666 ) ( IS-CRATE ?auto_13656 ) ( AVAILABLE ?auto_13662 ) ( TRUCK-AT ?auto_13660 ?auto_13659 ) ( not ( = ?auto_13659 ?auto_13658 ) ) ( not ( = ?auto_13663 ?auto_13659 ) ) ( HOIST-AT ?auto_13664 ?auto_13659 ) ( not ( = ?auto_13662 ?auto_13664 ) ) ( not ( = ?auto_13665 ?auto_13664 ) ) ( AVAILABLE ?auto_13664 ) ( SURFACE-AT ?auto_13656 ?auto_13659 ) ( ON ?auto_13656 ?auto_13667 ) ( CLEAR ?auto_13656 ) ( not ( = ?auto_13656 ?auto_13667 ) ) ( not ( = ?auto_13657 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13661 ?auto_13667 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13664 ?auto_13656 ?auto_13667 ?auto_13659 )
      ( MAKE-2CRATE ?auto_13666 ?auto_13656 ?auto_13657 )
      ( MAKE-1CRATE-VERIFY ?auto_13656 ?auto_13657 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13668 - SURFACE
      ?auto_13669 - SURFACE
      ?auto_13670 - SURFACE
    )
    :vars
    (
      ?auto_13678 - HOIST
      ?auto_13677 - PLACE
      ?auto_13673 - PLACE
      ?auto_13671 - HOIST
      ?auto_13674 - SURFACE
      ?auto_13676 - TRUCK
      ?auto_13675 - PLACE
      ?auto_13679 - HOIST
      ?auto_13672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13678 ?auto_13677 ) ( IS-CRATE ?auto_13670 ) ( not ( = ?auto_13669 ?auto_13670 ) ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13670 ) ) ( not ( = ?auto_13673 ?auto_13677 ) ) ( HOIST-AT ?auto_13671 ?auto_13673 ) ( not ( = ?auto_13678 ?auto_13671 ) ) ( AVAILABLE ?auto_13671 ) ( SURFACE-AT ?auto_13670 ?auto_13673 ) ( ON ?auto_13670 ?auto_13674 ) ( CLEAR ?auto_13670 ) ( not ( = ?auto_13669 ?auto_13674 ) ) ( not ( = ?auto_13670 ?auto_13674 ) ) ( not ( = ?auto_13668 ?auto_13674 ) ) ( SURFACE-AT ?auto_13668 ?auto_13677 ) ( CLEAR ?auto_13668 ) ( IS-CRATE ?auto_13669 ) ( AVAILABLE ?auto_13678 ) ( TRUCK-AT ?auto_13676 ?auto_13675 ) ( not ( = ?auto_13675 ?auto_13677 ) ) ( not ( = ?auto_13673 ?auto_13675 ) ) ( HOIST-AT ?auto_13679 ?auto_13675 ) ( not ( = ?auto_13678 ?auto_13679 ) ) ( not ( = ?auto_13671 ?auto_13679 ) ) ( AVAILABLE ?auto_13679 ) ( SURFACE-AT ?auto_13669 ?auto_13675 ) ( ON ?auto_13669 ?auto_13672 ) ( CLEAR ?auto_13669 ) ( not ( = ?auto_13669 ?auto_13672 ) ) ( not ( = ?auto_13670 ?auto_13672 ) ) ( not ( = ?auto_13668 ?auto_13672 ) ) ( not ( = ?auto_13674 ?auto_13672 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13669 ?auto_13670 )
      ( MAKE-2CRATE-VERIFY ?auto_13668 ?auto_13669 ?auto_13670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13680 - SURFACE
      ?auto_13681 - SURFACE
    )
    :vars
    (
      ?auto_13685 - HOIST
      ?auto_13683 - PLACE
      ?auto_13684 - SURFACE
      ?auto_13688 - PLACE
      ?auto_13691 - HOIST
      ?auto_13686 - SURFACE
      ?auto_13682 - PLACE
      ?auto_13690 - HOIST
      ?auto_13689 - SURFACE
      ?auto_13687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13685 ?auto_13683 ) ( IS-CRATE ?auto_13681 ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( not ( = ?auto_13684 ?auto_13680 ) ) ( not ( = ?auto_13684 ?auto_13681 ) ) ( not ( = ?auto_13688 ?auto_13683 ) ) ( HOIST-AT ?auto_13691 ?auto_13688 ) ( not ( = ?auto_13685 ?auto_13691 ) ) ( AVAILABLE ?auto_13691 ) ( SURFACE-AT ?auto_13681 ?auto_13688 ) ( ON ?auto_13681 ?auto_13686 ) ( CLEAR ?auto_13681 ) ( not ( = ?auto_13680 ?auto_13686 ) ) ( not ( = ?auto_13681 ?auto_13686 ) ) ( not ( = ?auto_13684 ?auto_13686 ) ) ( SURFACE-AT ?auto_13684 ?auto_13683 ) ( CLEAR ?auto_13684 ) ( IS-CRATE ?auto_13680 ) ( AVAILABLE ?auto_13685 ) ( not ( = ?auto_13682 ?auto_13683 ) ) ( not ( = ?auto_13688 ?auto_13682 ) ) ( HOIST-AT ?auto_13690 ?auto_13682 ) ( not ( = ?auto_13685 ?auto_13690 ) ) ( not ( = ?auto_13691 ?auto_13690 ) ) ( AVAILABLE ?auto_13690 ) ( SURFACE-AT ?auto_13680 ?auto_13682 ) ( ON ?auto_13680 ?auto_13689 ) ( CLEAR ?auto_13680 ) ( not ( = ?auto_13680 ?auto_13689 ) ) ( not ( = ?auto_13681 ?auto_13689 ) ) ( not ( = ?auto_13684 ?auto_13689 ) ) ( not ( = ?auto_13686 ?auto_13689 ) ) ( TRUCK-AT ?auto_13687 ?auto_13683 ) )
    :subtasks
    ( ( !DRIVE ?auto_13687 ?auto_13683 ?auto_13682 )
      ( MAKE-2CRATE ?auto_13684 ?auto_13680 ?auto_13681 )
      ( MAKE-1CRATE-VERIFY ?auto_13680 ?auto_13681 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13692 - SURFACE
      ?auto_13693 - SURFACE
      ?auto_13694 - SURFACE
    )
    :vars
    (
      ?auto_13699 - HOIST
      ?auto_13695 - PLACE
      ?auto_13701 - PLACE
      ?auto_13697 - HOIST
      ?auto_13702 - SURFACE
      ?auto_13698 - PLACE
      ?auto_13696 - HOIST
      ?auto_13703 - SURFACE
      ?auto_13700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13699 ?auto_13695 ) ( IS-CRATE ?auto_13694 ) ( not ( = ?auto_13693 ?auto_13694 ) ) ( not ( = ?auto_13692 ?auto_13693 ) ) ( not ( = ?auto_13692 ?auto_13694 ) ) ( not ( = ?auto_13701 ?auto_13695 ) ) ( HOIST-AT ?auto_13697 ?auto_13701 ) ( not ( = ?auto_13699 ?auto_13697 ) ) ( AVAILABLE ?auto_13697 ) ( SURFACE-AT ?auto_13694 ?auto_13701 ) ( ON ?auto_13694 ?auto_13702 ) ( CLEAR ?auto_13694 ) ( not ( = ?auto_13693 ?auto_13702 ) ) ( not ( = ?auto_13694 ?auto_13702 ) ) ( not ( = ?auto_13692 ?auto_13702 ) ) ( SURFACE-AT ?auto_13692 ?auto_13695 ) ( CLEAR ?auto_13692 ) ( IS-CRATE ?auto_13693 ) ( AVAILABLE ?auto_13699 ) ( not ( = ?auto_13698 ?auto_13695 ) ) ( not ( = ?auto_13701 ?auto_13698 ) ) ( HOIST-AT ?auto_13696 ?auto_13698 ) ( not ( = ?auto_13699 ?auto_13696 ) ) ( not ( = ?auto_13697 ?auto_13696 ) ) ( AVAILABLE ?auto_13696 ) ( SURFACE-AT ?auto_13693 ?auto_13698 ) ( ON ?auto_13693 ?auto_13703 ) ( CLEAR ?auto_13693 ) ( not ( = ?auto_13693 ?auto_13703 ) ) ( not ( = ?auto_13694 ?auto_13703 ) ) ( not ( = ?auto_13692 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13703 ) ) ( TRUCK-AT ?auto_13700 ?auto_13695 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13693 ?auto_13694 )
      ( MAKE-2CRATE-VERIFY ?auto_13692 ?auto_13693 ?auto_13694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13713 - SURFACE
      ?auto_13714 - SURFACE
    )
    :vars
    (
      ?auto_13715 - HOIST
      ?auto_13716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13715 ?auto_13716 ) ( SURFACE-AT ?auto_13713 ?auto_13716 ) ( CLEAR ?auto_13713 ) ( LIFTING ?auto_13715 ?auto_13714 ) ( IS-CRATE ?auto_13714 ) ( not ( = ?auto_13713 ?auto_13714 ) ) )
    :subtasks
    ( ( !DROP ?auto_13715 ?auto_13714 ?auto_13713 ?auto_13716 )
      ( MAKE-1CRATE-VERIFY ?auto_13713 ?auto_13714 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13717 - SURFACE
      ?auto_13718 - SURFACE
      ?auto_13719 - SURFACE
    )
    :vars
    (
      ?auto_13720 - HOIST
      ?auto_13721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13720 ?auto_13721 ) ( SURFACE-AT ?auto_13718 ?auto_13721 ) ( CLEAR ?auto_13718 ) ( LIFTING ?auto_13720 ?auto_13719 ) ( IS-CRATE ?auto_13719 ) ( not ( = ?auto_13718 ?auto_13719 ) ) ( ON ?auto_13718 ?auto_13717 ) ( not ( = ?auto_13717 ?auto_13718 ) ) ( not ( = ?auto_13717 ?auto_13719 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13718 ?auto_13719 )
      ( MAKE-2CRATE-VERIFY ?auto_13717 ?auto_13718 ?auto_13719 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13722 - SURFACE
      ?auto_13723 - SURFACE
      ?auto_13724 - SURFACE
      ?auto_13725 - SURFACE
    )
    :vars
    (
      ?auto_13726 - HOIST
      ?auto_13727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13726 ?auto_13727 ) ( SURFACE-AT ?auto_13724 ?auto_13727 ) ( CLEAR ?auto_13724 ) ( LIFTING ?auto_13726 ?auto_13725 ) ( IS-CRATE ?auto_13725 ) ( not ( = ?auto_13724 ?auto_13725 ) ) ( ON ?auto_13723 ?auto_13722 ) ( ON ?auto_13724 ?auto_13723 ) ( not ( = ?auto_13722 ?auto_13723 ) ) ( not ( = ?auto_13722 ?auto_13724 ) ) ( not ( = ?auto_13722 ?auto_13725 ) ) ( not ( = ?auto_13723 ?auto_13724 ) ) ( not ( = ?auto_13723 ?auto_13725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13724 ?auto_13725 )
      ( MAKE-3CRATE-VERIFY ?auto_13722 ?auto_13723 ?auto_13724 ?auto_13725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13728 - SURFACE
      ?auto_13729 - SURFACE
    )
    :vars
    (
      ?auto_13730 - HOIST
      ?auto_13731 - PLACE
      ?auto_13732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13730 ?auto_13731 ) ( SURFACE-AT ?auto_13728 ?auto_13731 ) ( CLEAR ?auto_13728 ) ( IS-CRATE ?auto_13729 ) ( not ( = ?auto_13728 ?auto_13729 ) ) ( TRUCK-AT ?auto_13732 ?auto_13731 ) ( AVAILABLE ?auto_13730 ) ( IN ?auto_13729 ?auto_13732 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13730 ?auto_13729 ?auto_13732 ?auto_13731 )
      ( MAKE-1CRATE ?auto_13728 ?auto_13729 )
      ( MAKE-1CRATE-VERIFY ?auto_13728 ?auto_13729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13733 - SURFACE
      ?auto_13734 - SURFACE
      ?auto_13735 - SURFACE
    )
    :vars
    (
      ?auto_13738 - HOIST
      ?auto_13737 - PLACE
      ?auto_13736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13738 ?auto_13737 ) ( SURFACE-AT ?auto_13734 ?auto_13737 ) ( CLEAR ?auto_13734 ) ( IS-CRATE ?auto_13735 ) ( not ( = ?auto_13734 ?auto_13735 ) ) ( TRUCK-AT ?auto_13736 ?auto_13737 ) ( AVAILABLE ?auto_13738 ) ( IN ?auto_13735 ?auto_13736 ) ( ON ?auto_13734 ?auto_13733 ) ( not ( = ?auto_13733 ?auto_13734 ) ) ( not ( = ?auto_13733 ?auto_13735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13734 ?auto_13735 )
      ( MAKE-2CRATE-VERIFY ?auto_13733 ?auto_13734 ?auto_13735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13739 - SURFACE
      ?auto_13740 - SURFACE
      ?auto_13741 - SURFACE
      ?auto_13742 - SURFACE
    )
    :vars
    (
      ?auto_13744 - HOIST
      ?auto_13743 - PLACE
      ?auto_13745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13744 ?auto_13743 ) ( SURFACE-AT ?auto_13741 ?auto_13743 ) ( CLEAR ?auto_13741 ) ( IS-CRATE ?auto_13742 ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( TRUCK-AT ?auto_13745 ?auto_13743 ) ( AVAILABLE ?auto_13744 ) ( IN ?auto_13742 ?auto_13745 ) ( ON ?auto_13741 ?auto_13740 ) ( not ( = ?auto_13740 ?auto_13741 ) ) ( not ( = ?auto_13740 ?auto_13742 ) ) ( ON ?auto_13740 ?auto_13739 ) ( not ( = ?auto_13739 ?auto_13740 ) ) ( not ( = ?auto_13739 ?auto_13741 ) ) ( not ( = ?auto_13739 ?auto_13742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13740 ?auto_13741 ?auto_13742 )
      ( MAKE-3CRATE-VERIFY ?auto_13739 ?auto_13740 ?auto_13741 ?auto_13742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13746 - SURFACE
      ?auto_13747 - SURFACE
    )
    :vars
    (
      ?auto_13749 - HOIST
      ?auto_13748 - PLACE
      ?auto_13750 - TRUCK
      ?auto_13751 - SURFACE
      ?auto_13752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13749 ?auto_13748 ) ( SURFACE-AT ?auto_13746 ?auto_13748 ) ( CLEAR ?auto_13746 ) ( IS-CRATE ?auto_13747 ) ( not ( = ?auto_13746 ?auto_13747 ) ) ( AVAILABLE ?auto_13749 ) ( IN ?auto_13747 ?auto_13750 ) ( ON ?auto_13746 ?auto_13751 ) ( not ( = ?auto_13751 ?auto_13746 ) ) ( not ( = ?auto_13751 ?auto_13747 ) ) ( TRUCK-AT ?auto_13750 ?auto_13752 ) ( not ( = ?auto_13752 ?auto_13748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13750 ?auto_13752 ?auto_13748 )
      ( MAKE-2CRATE ?auto_13751 ?auto_13746 ?auto_13747 )
      ( MAKE-1CRATE-VERIFY ?auto_13746 ?auto_13747 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13753 - SURFACE
      ?auto_13754 - SURFACE
      ?auto_13755 - SURFACE
    )
    :vars
    (
      ?auto_13757 - HOIST
      ?auto_13758 - PLACE
      ?auto_13759 - TRUCK
      ?auto_13756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13757 ?auto_13758 ) ( SURFACE-AT ?auto_13754 ?auto_13758 ) ( CLEAR ?auto_13754 ) ( IS-CRATE ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( AVAILABLE ?auto_13757 ) ( IN ?auto_13755 ?auto_13759 ) ( ON ?auto_13754 ?auto_13753 ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( TRUCK-AT ?auto_13759 ?auto_13756 ) ( not ( = ?auto_13756 ?auto_13758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13754 ?auto_13755 )
      ( MAKE-2CRATE-VERIFY ?auto_13753 ?auto_13754 ?auto_13755 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13760 - SURFACE
      ?auto_13761 - SURFACE
      ?auto_13762 - SURFACE
      ?auto_13763 - SURFACE
    )
    :vars
    (
      ?auto_13765 - HOIST
      ?auto_13764 - PLACE
      ?auto_13766 - TRUCK
      ?auto_13767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13765 ?auto_13764 ) ( SURFACE-AT ?auto_13762 ?auto_13764 ) ( CLEAR ?auto_13762 ) ( IS-CRATE ?auto_13763 ) ( not ( = ?auto_13762 ?auto_13763 ) ) ( AVAILABLE ?auto_13765 ) ( IN ?auto_13763 ?auto_13766 ) ( ON ?auto_13762 ?auto_13761 ) ( not ( = ?auto_13761 ?auto_13762 ) ) ( not ( = ?auto_13761 ?auto_13763 ) ) ( TRUCK-AT ?auto_13766 ?auto_13767 ) ( not ( = ?auto_13767 ?auto_13764 ) ) ( ON ?auto_13761 ?auto_13760 ) ( not ( = ?auto_13760 ?auto_13761 ) ) ( not ( = ?auto_13760 ?auto_13762 ) ) ( not ( = ?auto_13760 ?auto_13763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13761 ?auto_13762 ?auto_13763 )
      ( MAKE-3CRATE-VERIFY ?auto_13760 ?auto_13761 ?auto_13762 ?auto_13763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13768 - SURFACE
      ?auto_13769 - SURFACE
    )
    :vars
    (
      ?auto_13771 - HOIST
      ?auto_13770 - PLACE
      ?auto_13773 - SURFACE
      ?auto_13772 - TRUCK
      ?auto_13774 - PLACE
      ?auto_13775 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13771 ?auto_13770 ) ( SURFACE-AT ?auto_13768 ?auto_13770 ) ( CLEAR ?auto_13768 ) ( IS-CRATE ?auto_13769 ) ( not ( = ?auto_13768 ?auto_13769 ) ) ( AVAILABLE ?auto_13771 ) ( ON ?auto_13768 ?auto_13773 ) ( not ( = ?auto_13773 ?auto_13768 ) ) ( not ( = ?auto_13773 ?auto_13769 ) ) ( TRUCK-AT ?auto_13772 ?auto_13774 ) ( not ( = ?auto_13774 ?auto_13770 ) ) ( HOIST-AT ?auto_13775 ?auto_13774 ) ( LIFTING ?auto_13775 ?auto_13769 ) ( not ( = ?auto_13771 ?auto_13775 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13775 ?auto_13769 ?auto_13772 ?auto_13774 )
      ( MAKE-2CRATE ?auto_13773 ?auto_13768 ?auto_13769 )
      ( MAKE-1CRATE-VERIFY ?auto_13768 ?auto_13769 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13776 - SURFACE
      ?auto_13777 - SURFACE
      ?auto_13778 - SURFACE
    )
    :vars
    (
      ?auto_13779 - HOIST
      ?auto_13780 - PLACE
      ?auto_13783 - TRUCK
      ?auto_13781 - PLACE
      ?auto_13782 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13779 ?auto_13780 ) ( SURFACE-AT ?auto_13777 ?auto_13780 ) ( CLEAR ?auto_13777 ) ( IS-CRATE ?auto_13778 ) ( not ( = ?auto_13777 ?auto_13778 ) ) ( AVAILABLE ?auto_13779 ) ( ON ?auto_13777 ?auto_13776 ) ( not ( = ?auto_13776 ?auto_13777 ) ) ( not ( = ?auto_13776 ?auto_13778 ) ) ( TRUCK-AT ?auto_13783 ?auto_13781 ) ( not ( = ?auto_13781 ?auto_13780 ) ) ( HOIST-AT ?auto_13782 ?auto_13781 ) ( LIFTING ?auto_13782 ?auto_13778 ) ( not ( = ?auto_13779 ?auto_13782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13777 ?auto_13778 )
      ( MAKE-2CRATE-VERIFY ?auto_13776 ?auto_13777 ?auto_13778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13784 - SURFACE
      ?auto_13785 - SURFACE
      ?auto_13786 - SURFACE
      ?auto_13787 - SURFACE
    )
    :vars
    (
      ?auto_13791 - HOIST
      ?auto_13792 - PLACE
      ?auto_13790 - TRUCK
      ?auto_13788 - PLACE
      ?auto_13789 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13791 ?auto_13792 ) ( SURFACE-AT ?auto_13786 ?auto_13792 ) ( CLEAR ?auto_13786 ) ( IS-CRATE ?auto_13787 ) ( not ( = ?auto_13786 ?auto_13787 ) ) ( AVAILABLE ?auto_13791 ) ( ON ?auto_13786 ?auto_13785 ) ( not ( = ?auto_13785 ?auto_13786 ) ) ( not ( = ?auto_13785 ?auto_13787 ) ) ( TRUCK-AT ?auto_13790 ?auto_13788 ) ( not ( = ?auto_13788 ?auto_13792 ) ) ( HOIST-AT ?auto_13789 ?auto_13788 ) ( LIFTING ?auto_13789 ?auto_13787 ) ( not ( = ?auto_13791 ?auto_13789 ) ) ( ON ?auto_13785 ?auto_13784 ) ( not ( = ?auto_13784 ?auto_13785 ) ) ( not ( = ?auto_13784 ?auto_13786 ) ) ( not ( = ?auto_13784 ?auto_13787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13785 ?auto_13786 ?auto_13787 )
      ( MAKE-3CRATE-VERIFY ?auto_13784 ?auto_13785 ?auto_13786 ?auto_13787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13793 - SURFACE
      ?auto_13794 - SURFACE
    )
    :vars
    (
      ?auto_13799 - HOIST
      ?auto_13800 - PLACE
      ?auto_13795 - SURFACE
      ?auto_13798 - TRUCK
      ?auto_13796 - PLACE
      ?auto_13797 - HOIST
      ?auto_13801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13799 ?auto_13800 ) ( SURFACE-AT ?auto_13793 ?auto_13800 ) ( CLEAR ?auto_13793 ) ( IS-CRATE ?auto_13794 ) ( not ( = ?auto_13793 ?auto_13794 ) ) ( AVAILABLE ?auto_13799 ) ( ON ?auto_13793 ?auto_13795 ) ( not ( = ?auto_13795 ?auto_13793 ) ) ( not ( = ?auto_13795 ?auto_13794 ) ) ( TRUCK-AT ?auto_13798 ?auto_13796 ) ( not ( = ?auto_13796 ?auto_13800 ) ) ( HOIST-AT ?auto_13797 ?auto_13796 ) ( not ( = ?auto_13799 ?auto_13797 ) ) ( AVAILABLE ?auto_13797 ) ( SURFACE-AT ?auto_13794 ?auto_13796 ) ( ON ?auto_13794 ?auto_13801 ) ( CLEAR ?auto_13794 ) ( not ( = ?auto_13793 ?auto_13801 ) ) ( not ( = ?auto_13794 ?auto_13801 ) ) ( not ( = ?auto_13795 ?auto_13801 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13797 ?auto_13794 ?auto_13801 ?auto_13796 )
      ( MAKE-2CRATE ?auto_13795 ?auto_13793 ?auto_13794 )
      ( MAKE-1CRATE-VERIFY ?auto_13793 ?auto_13794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13802 - SURFACE
      ?auto_13803 - SURFACE
      ?auto_13804 - SURFACE
    )
    :vars
    (
      ?auto_13805 - HOIST
      ?auto_13807 - PLACE
      ?auto_13810 - TRUCK
      ?auto_13806 - PLACE
      ?auto_13809 - HOIST
      ?auto_13808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13805 ?auto_13807 ) ( SURFACE-AT ?auto_13803 ?auto_13807 ) ( CLEAR ?auto_13803 ) ( IS-CRATE ?auto_13804 ) ( not ( = ?auto_13803 ?auto_13804 ) ) ( AVAILABLE ?auto_13805 ) ( ON ?auto_13803 ?auto_13802 ) ( not ( = ?auto_13802 ?auto_13803 ) ) ( not ( = ?auto_13802 ?auto_13804 ) ) ( TRUCK-AT ?auto_13810 ?auto_13806 ) ( not ( = ?auto_13806 ?auto_13807 ) ) ( HOIST-AT ?auto_13809 ?auto_13806 ) ( not ( = ?auto_13805 ?auto_13809 ) ) ( AVAILABLE ?auto_13809 ) ( SURFACE-AT ?auto_13804 ?auto_13806 ) ( ON ?auto_13804 ?auto_13808 ) ( CLEAR ?auto_13804 ) ( not ( = ?auto_13803 ?auto_13808 ) ) ( not ( = ?auto_13804 ?auto_13808 ) ) ( not ( = ?auto_13802 ?auto_13808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13803 ?auto_13804 )
      ( MAKE-2CRATE-VERIFY ?auto_13802 ?auto_13803 ?auto_13804 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13811 - SURFACE
      ?auto_13812 - SURFACE
      ?auto_13813 - SURFACE
      ?auto_13814 - SURFACE
    )
    :vars
    (
      ?auto_13816 - HOIST
      ?auto_13817 - PLACE
      ?auto_13820 - TRUCK
      ?auto_13818 - PLACE
      ?auto_13819 - HOIST
      ?auto_13815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13816 ?auto_13817 ) ( SURFACE-AT ?auto_13813 ?auto_13817 ) ( CLEAR ?auto_13813 ) ( IS-CRATE ?auto_13814 ) ( not ( = ?auto_13813 ?auto_13814 ) ) ( AVAILABLE ?auto_13816 ) ( ON ?auto_13813 ?auto_13812 ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13812 ?auto_13814 ) ) ( TRUCK-AT ?auto_13820 ?auto_13818 ) ( not ( = ?auto_13818 ?auto_13817 ) ) ( HOIST-AT ?auto_13819 ?auto_13818 ) ( not ( = ?auto_13816 ?auto_13819 ) ) ( AVAILABLE ?auto_13819 ) ( SURFACE-AT ?auto_13814 ?auto_13818 ) ( ON ?auto_13814 ?auto_13815 ) ( CLEAR ?auto_13814 ) ( not ( = ?auto_13813 ?auto_13815 ) ) ( not ( = ?auto_13814 ?auto_13815 ) ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( ON ?auto_13812 ?auto_13811 ) ( not ( = ?auto_13811 ?auto_13812 ) ) ( not ( = ?auto_13811 ?auto_13813 ) ) ( not ( = ?auto_13811 ?auto_13814 ) ) ( not ( = ?auto_13811 ?auto_13815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13812 ?auto_13813 ?auto_13814 )
      ( MAKE-3CRATE-VERIFY ?auto_13811 ?auto_13812 ?auto_13813 ?auto_13814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13821 - SURFACE
      ?auto_13822 - SURFACE
    )
    :vars
    (
      ?auto_13824 - HOIST
      ?auto_13825 - PLACE
      ?auto_13826 - SURFACE
      ?auto_13827 - PLACE
      ?auto_13828 - HOIST
      ?auto_13823 - SURFACE
      ?auto_13829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13824 ?auto_13825 ) ( SURFACE-AT ?auto_13821 ?auto_13825 ) ( CLEAR ?auto_13821 ) ( IS-CRATE ?auto_13822 ) ( not ( = ?auto_13821 ?auto_13822 ) ) ( AVAILABLE ?auto_13824 ) ( ON ?auto_13821 ?auto_13826 ) ( not ( = ?auto_13826 ?auto_13821 ) ) ( not ( = ?auto_13826 ?auto_13822 ) ) ( not ( = ?auto_13827 ?auto_13825 ) ) ( HOIST-AT ?auto_13828 ?auto_13827 ) ( not ( = ?auto_13824 ?auto_13828 ) ) ( AVAILABLE ?auto_13828 ) ( SURFACE-AT ?auto_13822 ?auto_13827 ) ( ON ?auto_13822 ?auto_13823 ) ( CLEAR ?auto_13822 ) ( not ( = ?auto_13821 ?auto_13823 ) ) ( not ( = ?auto_13822 ?auto_13823 ) ) ( not ( = ?auto_13826 ?auto_13823 ) ) ( TRUCK-AT ?auto_13829 ?auto_13825 ) )
    :subtasks
    ( ( !DRIVE ?auto_13829 ?auto_13825 ?auto_13827 )
      ( MAKE-2CRATE ?auto_13826 ?auto_13821 ?auto_13822 )
      ( MAKE-1CRATE-VERIFY ?auto_13821 ?auto_13822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13830 - SURFACE
      ?auto_13831 - SURFACE
      ?auto_13832 - SURFACE
    )
    :vars
    (
      ?auto_13836 - HOIST
      ?auto_13838 - PLACE
      ?auto_13833 - PLACE
      ?auto_13837 - HOIST
      ?auto_13835 - SURFACE
      ?auto_13834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13836 ?auto_13838 ) ( SURFACE-AT ?auto_13831 ?auto_13838 ) ( CLEAR ?auto_13831 ) ( IS-CRATE ?auto_13832 ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( AVAILABLE ?auto_13836 ) ( ON ?auto_13831 ?auto_13830 ) ( not ( = ?auto_13830 ?auto_13831 ) ) ( not ( = ?auto_13830 ?auto_13832 ) ) ( not ( = ?auto_13833 ?auto_13838 ) ) ( HOIST-AT ?auto_13837 ?auto_13833 ) ( not ( = ?auto_13836 ?auto_13837 ) ) ( AVAILABLE ?auto_13837 ) ( SURFACE-AT ?auto_13832 ?auto_13833 ) ( ON ?auto_13832 ?auto_13835 ) ( CLEAR ?auto_13832 ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( not ( = ?auto_13832 ?auto_13835 ) ) ( not ( = ?auto_13830 ?auto_13835 ) ) ( TRUCK-AT ?auto_13834 ?auto_13838 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13831 ?auto_13832 )
      ( MAKE-2CRATE-VERIFY ?auto_13830 ?auto_13831 ?auto_13832 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13839 - SURFACE
      ?auto_13840 - SURFACE
      ?auto_13841 - SURFACE
      ?auto_13842 - SURFACE
    )
    :vars
    (
      ?auto_13848 - HOIST
      ?auto_13844 - PLACE
      ?auto_13845 - PLACE
      ?auto_13843 - HOIST
      ?auto_13846 - SURFACE
      ?auto_13847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13848 ?auto_13844 ) ( SURFACE-AT ?auto_13841 ?auto_13844 ) ( CLEAR ?auto_13841 ) ( IS-CRATE ?auto_13842 ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( AVAILABLE ?auto_13848 ) ( ON ?auto_13841 ?auto_13840 ) ( not ( = ?auto_13840 ?auto_13841 ) ) ( not ( = ?auto_13840 ?auto_13842 ) ) ( not ( = ?auto_13845 ?auto_13844 ) ) ( HOIST-AT ?auto_13843 ?auto_13845 ) ( not ( = ?auto_13848 ?auto_13843 ) ) ( AVAILABLE ?auto_13843 ) ( SURFACE-AT ?auto_13842 ?auto_13845 ) ( ON ?auto_13842 ?auto_13846 ) ( CLEAR ?auto_13842 ) ( not ( = ?auto_13841 ?auto_13846 ) ) ( not ( = ?auto_13842 ?auto_13846 ) ) ( not ( = ?auto_13840 ?auto_13846 ) ) ( TRUCK-AT ?auto_13847 ?auto_13844 ) ( ON ?auto_13840 ?auto_13839 ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( not ( = ?auto_13839 ?auto_13841 ) ) ( not ( = ?auto_13839 ?auto_13842 ) ) ( not ( = ?auto_13839 ?auto_13846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13840 ?auto_13841 ?auto_13842 )
      ( MAKE-3CRATE-VERIFY ?auto_13839 ?auto_13840 ?auto_13841 ?auto_13842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13849 - SURFACE
      ?auto_13850 - SURFACE
    )
    :vars
    (
      ?auto_13857 - HOIST
      ?auto_13852 - PLACE
      ?auto_13853 - SURFACE
      ?auto_13854 - PLACE
      ?auto_13851 - HOIST
      ?auto_13855 - SURFACE
      ?auto_13856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13857 ?auto_13852 ) ( IS-CRATE ?auto_13850 ) ( not ( = ?auto_13849 ?auto_13850 ) ) ( not ( = ?auto_13853 ?auto_13849 ) ) ( not ( = ?auto_13853 ?auto_13850 ) ) ( not ( = ?auto_13854 ?auto_13852 ) ) ( HOIST-AT ?auto_13851 ?auto_13854 ) ( not ( = ?auto_13857 ?auto_13851 ) ) ( AVAILABLE ?auto_13851 ) ( SURFACE-AT ?auto_13850 ?auto_13854 ) ( ON ?auto_13850 ?auto_13855 ) ( CLEAR ?auto_13850 ) ( not ( = ?auto_13849 ?auto_13855 ) ) ( not ( = ?auto_13850 ?auto_13855 ) ) ( not ( = ?auto_13853 ?auto_13855 ) ) ( TRUCK-AT ?auto_13856 ?auto_13852 ) ( SURFACE-AT ?auto_13853 ?auto_13852 ) ( CLEAR ?auto_13853 ) ( LIFTING ?auto_13857 ?auto_13849 ) ( IS-CRATE ?auto_13849 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13853 ?auto_13849 )
      ( MAKE-2CRATE ?auto_13853 ?auto_13849 ?auto_13850 )
      ( MAKE-1CRATE-VERIFY ?auto_13849 ?auto_13850 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13858 - SURFACE
      ?auto_13859 - SURFACE
      ?auto_13860 - SURFACE
    )
    :vars
    (
      ?auto_13863 - HOIST
      ?auto_13864 - PLACE
      ?auto_13865 - PLACE
      ?auto_13866 - HOIST
      ?auto_13862 - SURFACE
      ?auto_13861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13863 ?auto_13864 ) ( IS-CRATE ?auto_13860 ) ( not ( = ?auto_13859 ?auto_13860 ) ) ( not ( = ?auto_13858 ?auto_13859 ) ) ( not ( = ?auto_13858 ?auto_13860 ) ) ( not ( = ?auto_13865 ?auto_13864 ) ) ( HOIST-AT ?auto_13866 ?auto_13865 ) ( not ( = ?auto_13863 ?auto_13866 ) ) ( AVAILABLE ?auto_13866 ) ( SURFACE-AT ?auto_13860 ?auto_13865 ) ( ON ?auto_13860 ?auto_13862 ) ( CLEAR ?auto_13860 ) ( not ( = ?auto_13859 ?auto_13862 ) ) ( not ( = ?auto_13860 ?auto_13862 ) ) ( not ( = ?auto_13858 ?auto_13862 ) ) ( TRUCK-AT ?auto_13861 ?auto_13864 ) ( SURFACE-AT ?auto_13858 ?auto_13864 ) ( CLEAR ?auto_13858 ) ( LIFTING ?auto_13863 ?auto_13859 ) ( IS-CRATE ?auto_13859 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13859 ?auto_13860 )
      ( MAKE-2CRATE-VERIFY ?auto_13858 ?auto_13859 ?auto_13860 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13867 - SURFACE
      ?auto_13868 - SURFACE
      ?auto_13869 - SURFACE
      ?auto_13870 - SURFACE
    )
    :vars
    (
      ?auto_13872 - HOIST
      ?auto_13871 - PLACE
      ?auto_13876 - PLACE
      ?auto_13873 - HOIST
      ?auto_13875 - SURFACE
      ?auto_13874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13872 ?auto_13871 ) ( IS-CRATE ?auto_13870 ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( not ( = ?auto_13868 ?auto_13870 ) ) ( not ( = ?auto_13876 ?auto_13871 ) ) ( HOIST-AT ?auto_13873 ?auto_13876 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( AVAILABLE ?auto_13873 ) ( SURFACE-AT ?auto_13870 ?auto_13876 ) ( ON ?auto_13870 ?auto_13875 ) ( CLEAR ?auto_13870 ) ( not ( = ?auto_13869 ?auto_13875 ) ) ( not ( = ?auto_13870 ?auto_13875 ) ) ( not ( = ?auto_13868 ?auto_13875 ) ) ( TRUCK-AT ?auto_13874 ?auto_13871 ) ( SURFACE-AT ?auto_13868 ?auto_13871 ) ( CLEAR ?auto_13868 ) ( LIFTING ?auto_13872 ?auto_13869 ) ( IS-CRATE ?auto_13869 ) ( ON ?auto_13868 ?auto_13867 ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13869 ) ) ( not ( = ?auto_13867 ?auto_13870 ) ) ( not ( = ?auto_13867 ?auto_13875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13868 ?auto_13869 ?auto_13870 )
      ( MAKE-3CRATE-VERIFY ?auto_13867 ?auto_13868 ?auto_13869 ?auto_13870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13877 - SURFACE
      ?auto_13878 - SURFACE
    )
    :vars
    (
      ?auto_13880 - HOIST
      ?auto_13879 - PLACE
      ?auto_13885 - SURFACE
      ?auto_13884 - PLACE
      ?auto_13881 - HOIST
      ?auto_13883 - SURFACE
      ?auto_13882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13880 ?auto_13879 ) ( IS-CRATE ?auto_13878 ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( not ( = ?auto_13885 ?auto_13877 ) ) ( not ( = ?auto_13885 ?auto_13878 ) ) ( not ( = ?auto_13884 ?auto_13879 ) ) ( HOIST-AT ?auto_13881 ?auto_13884 ) ( not ( = ?auto_13880 ?auto_13881 ) ) ( AVAILABLE ?auto_13881 ) ( SURFACE-AT ?auto_13878 ?auto_13884 ) ( ON ?auto_13878 ?auto_13883 ) ( CLEAR ?auto_13878 ) ( not ( = ?auto_13877 ?auto_13883 ) ) ( not ( = ?auto_13878 ?auto_13883 ) ) ( not ( = ?auto_13885 ?auto_13883 ) ) ( TRUCK-AT ?auto_13882 ?auto_13879 ) ( SURFACE-AT ?auto_13885 ?auto_13879 ) ( CLEAR ?auto_13885 ) ( IS-CRATE ?auto_13877 ) ( AVAILABLE ?auto_13880 ) ( IN ?auto_13877 ?auto_13882 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13880 ?auto_13877 ?auto_13882 ?auto_13879 )
      ( MAKE-2CRATE ?auto_13885 ?auto_13877 ?auto_13878 )
      ( MAKE-1CRATE-VERIFY ?auto_13877 ?auto_13878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13886 - SURFACE
      ?auto_13887 - SURFACE
      ?auto_13888 - SURFACE
    )
    :vars
    (
      ?auto_13889 - HOIST
      ?auto_13894 - PLACE
      ?auto_13892 - PLACE
      ?auto_13891 - HOIST
      ?auto_13890 - SURFACE
      ?auto_13893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13889 ?auto_13894 ) ( IS-CRATE ?auto_13888 ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( not ( = ?auto_13892 ?auto_13894 ) ) ( HOIST-AT ?auto_13891 ?auto_13892 ) ( not ( = ?auto_13889 ?auto_13891 ) ) ( AVAILABLE ?auto_13891 ) ( SURFACE-AT ?auto_13888 ?auto_13892 ) ( ON ?auto_13888 ?auto_13890 ) ( CLEAR ?auto_13888 ) ( not ( = ?auto_13887 ?auto_13890 ) ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( not ( = ?auto_13886 ?auto_13890 ) ) ( TRUCK-AT ?auto_13893 ?auto_13894 ) ( SURFACE-AT ?auto_13886 ?auto_13894 ) ( CLEAR ?auto_13886 ) ( IS-CRATE ?auto_13887 ) ( AVAILABLE ?auto_13889 ) ( IN ?auto_13887 ?auto_13893 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13887 ?auto_13888 )
      ( MAKE-2CRATE-VERIFY ?auto_13886 ?auto_13887 ?auto_13888 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13895 - SURFACE
      ?auto_13896 - SURFACE
      ?auto_13897 - SURFACE
      ?auto_13898 - SURFACE
    )
    :vars
    (
      ?auto_13904 - HOIST
      ?auto_13899 - PLACE
      ?auto_13901 - PLACE
      ?auto_13902 - HOIST
      ?auto_13903 - SURFACE
      ?auto_13900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13904 ?auto_13899 ) ( IS-CRATE ?auto_13898 ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13901 ?auto_13899 ) ) ( HOIST-AT ?auto_13902 ?auto_13901 ) ( not ( = ?auto_13904 ?auto_13902 ) ) ( AVAILABLE ?auto_13902 ) ( SURFACE-AT ?auto_13898 ?auto_13901 ) ( ON ?auto_13898 ?auto_13903 ) ( CLEAR ?auto_13898 ) ( not ( = ?auto_13897 ?auto_13903 ) ) ( not ( = ?auto_13898 ?auto_13903 ) ) ( not ( = ?auto_13896 ?auto_13903 ) ) ( TRUCK-AT ?auto_13900 ?auto_13899 ) ( SURFACE-AT ?auto_13896 ?auto_13899 ) ( CLEAR ?auto_13896 ) ( IS-CRATE ?auto_13897 ) ( AVAILABLE ?auto_13904 ) ( IN ?auto_13897 ?auto_13900 ) ( ON ?auto_13896 ?auto_13895 ) ( not ( = ?auto_13895 ?auto_13896 ) ) ( not ( = ?auto_13895 ?auto_13897 ) ) ( not ( = ?auto_13895 ?auto_13898 ) ) ( not ( = ?auto_13895 ?auto_13903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13896 ?auto_13897 ?auto_13898 )
      ( MAKE-3CRATE-VERIFY ?auto_13895 ?auto_13896 ?auto_13897 ?auto_13898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13905 - SURFACE
      ?auto_13906 - SURFACE
    )
    :vars
    (
      ?auto_13913 - HOIST
      ?auto_13907 - PLACE
      ?auto_13911 - SURFACE
      ?auto_13909 - PLACE
      ?auto_13910 - HOIST
      ?auto_13912 - SURFACE
      ?auto_13908 - TRUCK
      ?auto_13914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13913 ?auto_13907 ) ( IS-CRATE ?auto_13906 ) ( not ( = ?auto_13905 ?auto_13906 ) ) ( not ( = ?auto_13911 ?auto_13905 ) ) ( not ( = ?auto_13911 ?auto_13906 ) ) ( not ( = ?auto_13909 ?auto_13907 ) ) ( HOIST-AT ?auto_13910 ?auto_13909 ) ( not ( = ?auto_13913 ?auto_13910 ) ) ( AVAILABLE ?auto_13910 ) ( SURFACE-AT ?auto_13906 ?auto_13909 ) ( ON ?auto_13906 ?auto_13912 ) ( CLEAR ?auto_13906 ) ( not ( = ?auto_13905 ?auto_13912 ) ) ( not ( = ?auto_13906 ?auto_13912 ) ) ( not ( = ?auto_13911 ?auto_13912 ) ) ( SURFACE-AT ?auto_13911 ?auto_13907 ) ( CLEAR ?auto_13911 ) ( IS-CRATE ?auto_13905 ) ( AVAILABLE ?auto_13913 ) ( IN ?auto_13905 ?auto_13908 ) ( TRUCK-AT ?auto_13908 ?auto_13914 ) ( not ( = ?auto_13914 ?auto_13907 ) ) ( not ( = ?auto_13909 ?auto_13914 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13908 ?auto_13914 ?auto_13907 )
      ( MAKE-2CRATE ?auto_13911 ?auto_13905 ?auto_13906 )
      ( MAKE-1CRATE-VERIFY ?auto_13905 ?auto_13906 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13915 - SURFACE
      ?auto_13916 - SURFACE
      ?auto_13917 - SURFACE
    )
    :vars
    (
      ?auto_13921 - HOIST
      ?auto_13922 - PLACE
      ?auto_13923 - PLACE
      ?auto_13918 - HOIST
      ?auto_13919 - SURFACE
      ?auto_13924 - TRUCK
      ?auto_13920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13921 ?auto_13922 ) ( IS-CRATE ?auto_13917 ) ( not ( = ?auto_13916 ?auto_13917 ) ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) ( not ( = ?auto_13923 ?auto_13922 ) ) ( HOIST-AT ?auto_13918 ?auto_13923 ) ( not ( = ?auto_13921 ?auto_13918 ) ) ( AVAILABLE ?auto_13918 ) ( SURFACE-AT ?auto_13917 ?auto_13923 ) ( ON ?auto_13917 ?auto_13919 ) ( CLEAR ?auto_13917 ) ( not ( = ?auto_13916 ?auto_13919 ) ) ( not ( = ?auto_13917 ?auto_13919 ) ) ( not ( = ?auto_13915 ?auto_13919 ) ) ( SURFACE-AT ?auto_13915 ?auto_13922 ) ( CLEAR ?auto_13915 ) ( IS-CRATE ?auto_13916 ) ( AVAILABLE ?auto_13921 ) ( IN ?auto_13916 ?auto_13924 ) ( TRUCK-AT ?auto_13924 ?auto_13920 ) ( not ( = ?auto_13920 ?auto_13922 ) ) ( not ( = ?auto_13923 ?auto_13920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13916 ?auto_13917 )
      ( MAKE-2CRATE-VERIFY ?auto_13915 ?auto_13916 ?auto_13917 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13925 - SURFACE
      ?auto_13926 - SURFACE
      ?auto_13927 - SURFACE
      ?auto_13928 - SURFACE
    )
    :vars
    (
      ?auto_13934 - HOIST
      ?auto_13933 - PLACE
      ?auto_13932 - PLACE
      ?auto_13935 - HOIST
      ?auto_13930 - SURFACE
      ?auto_13929 - TRUCK
      ?auto_13931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13934 ?auto_13933 ) ( IS-CRATE ?auto_13928 ) ( not ( = ?auto_13927 ?auto_13928 ) ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13928 ) ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( HOIST-AT ?auto_13935 ?auto_13932 ) ( not ( = ?auto_13934 ?auto_13935 ) ) ( AVAILABLE ?auto_13935 ) ( SURFACE-AT ?auto_13928 ?auto_13932 ) ( ON ?auto_13928 ?auto_13930 ) ( CLEAR ?auto_13928 ) ( not ( = ?auto_13927 ?auto_13930 ) ) ( not ( = ?auto_13928 ?auto_13930 ) ) ( not ( = ?auto_13926 ?auto_13930 ) ) ( SURFACE-AT ?auto_13926 ?auto_13933 ) ( CLEAR ?auto_13926 ) ( IS-CRATE ?auto_13927 ) ( AVAILABLE ?auto_13934 ) ( IN ?auto_13927 ?auto_13929 ) ( TRUCK-AT ?auto_13929 ?auto_13931 ) ( not ( = ?auto_13931 ?auto_13933 ) ) ( not ( = ?auto_13932 ?auto_13931 ) ) ( ON ?auto_13926 ?auto_13925 ) ( not ( = ?auto_13925 ?auto_13926 ) ) ( not ( = ?auto_13925 ?auto_13927 ) ) ( not ( = ?auto_13925 ?auto_13928 ) ) ( not ( = ?auto_13925 ?auto_13930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13926 ?auto_13927 ?auto_13928 )
      ( MAKE-3CRATE-VERIFY ?auto_13925 ?auto_13926 ?auto_13927 ?auto_13928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13936 - SURFACE
      ?auto_13937 - SURFACE
    )
    :vars
    (
      ?auto_13944 - HOIST
      ?auto_13943 - PLACE
      ?auto_13941 - SURFACE
      ?auto_13942 - PLACE
      ?auto_13945 - HOIST
      ?auto_13939 - SURFACE
      ?auto_13938 - TRUCK
      ?auto_13940 - PLACE
      ?auto_13946 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13944 ?auto_13943 ) ( IS-CRATE ?auto_13937 ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13941 ?auto_13936 ) ) ( not ( = ?auto_13941 ?auto_13937 ) ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( HOIST-AT ?auto_13945 ?auto_13942 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( AVAILABLE ?auto_13945 ) ( SURFACE-AT ?auto_13937 ?auto_13942 ) ( ON ?auto_13937 ?auto_13939 ) ( CLEAR ?auto_13937 ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13941 ?auto_13939 ) ) ( SURFACE-AT ?auto_13941 ?auto_13943 ) ( CLEAR ?auto_13941 ) ( IS-CRATE ?auto_13936 ) ( AVAILABLE ?auto_13944 ) ( TRUCK-AT ?auto_13938 ?auto_13940 ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13942 ?auto_13940 ) ) ( HOIST-AT ?auto_13946 ?auto_13940 ) ( LIFTING ?auto_13946 ?auto_13936 ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13946 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13946 ?auto_13936 ?auto_13938 ?auto_13940 )
      ( MAKE-2CRATE ?auto_13941 ?auto_13936 ?auto_13937 )
      ( MAKE-1CRATE-VERIFY ?auto_13936 ?auto_13937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13947 - SURFACE
      ?auto_13948 - SURFACE
      ?auto_13949 - SURFACE
    )
    :vars
    (
      ?auto_13950 - HOIST
      ?auto_13955 - PLACE
      ?auto_13957 - PLACE
      ?auto_13951 - HOIST
      ?auto_13952 - SURFACE
      ?auto_13953 - TRUCK
      ?auto_13956 - PLACE
      ?auto_13954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13950 ?auto_13955 ) ( IS-CRATE ?auto_13949 ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13957 ?auto_13955 ) ) ( HOIST-AT ?auto_13951 ?auto_13957 ) ( not ( = ?auto_13950 ?auto_13951 ) ) ( AVAILABLE ?auto_13951 ) ( SURFACE-AT ?auto_13949 ?auto_13957 ) ( ON ?auto_13949 ?auto_13952 ) ( CLEAR ?auto_13949 ) ( not ( = ?auto_13948 ?auto_13952 ) ) ( not ( = ?auto_13949 ?auto_13952 ) ) ( not ( = ?auto_13947 ?auto_13952 ) ) ( SURFACE-AT ?auto_13947 ?auto_13955 ) ( CLEAR ?auto_13947 ) ( IS-CRATE ?auto_13948 ) ( AVAILABLE ?auto_13950 ) ( TRUCK-AT ?auto_13953 ?auto_13956 ) ( not ( = ?auto_13956 ?auto_13955 ) ) ( not ( = ?auto_13957 ?auto_13956 ) ) ( HOIST-AT ?auto_13954 ?auto_13956 ) ( LIFTING ?auto_13954 ?auto_13948 ) ( not ( = ?auto_13950 ?auto_13954 ) ) ( not ( = ?auto_13951 ?auto_13954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13948 ?auto_13949 )
      ( MAKE-2CRATE-VERIFY ?auto_13947 ?auto_13948 ?auto_13949 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13958 - SURFACE
      ?auto_13959 - SURFACE
      ?auto_13960 - SURFACE
      ?auto_13961 - SURFACE
    )
    :vars
    (
      ?auto_13969 - HOIST
      ?auto_13964 - PLACE
      ?auto_13965 - PLACE
      ?auto_13963 - HOIST
      ?auto_13967 - SURFACE
      ?auto_13968 - TRUCK
      ?auto_13966 - PLACE
      ?auto_13962 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13969 ?auto_13964 ) ( IS-CRATE ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13961 ) ) ( not ( = ?auto_13959 ?auto_13960 ) ) ( not ( = ?auto_13959 ?auto_13961 ) ) ( not ( = ?auto_13965 ?auto_13964 ) ) ( HOIST-AT ?auto_13963 ?auto_13965 ) ( not ( = ?auto_13969 ?auto_13963 ) ) ( AVAILABLE ?auto_13963 ) ( SURFACE-AT ?auto_13961 ?auto_13965 ) ( ON ?auto_13961 ?auto_13967 ) ( CLEAR ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13967 ) ) ( not ( = ?auto_13961 ?auto_13967 ) ) ( not ( = ?auto_13959 ?auto_13967 ) ) ( SURFACE-AT ?auto_13959 ?auto_13964 ) ( CLEAR ?auto_13959 ) ( IS-CRATE ?auto_13960 ) ( AVAILABLE ?auto_13969 ) ( TRUCK-AT ?auto_13968 ?auto_13966 ) ( not ( = ?auto_13966 ?auto_13964 ) ) ( not ( = ?auto_13965 ?auto_13966 ) ) ( HOIST-AT ?auto_13962 ?auto_13966 ) ( LIFTING ?auto_13962 ?auto_13960 ) ( not ( = ?auto_13969 ?auto_13962 ) ) ( not ( = ?auto_13963 ?auto_13962 ) ) ( ON ?auto_13959 ?auto_13958 ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( not ( = ?auto_13958 ?auto_13960 ) ) ( not ( = ?auto_13958 ?auto_13961 ) ) ( not ( = ?auto_13958 ?auto_13967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13959 ?auto_13960 ?auto_13961 )
      ( MAKE-3CRATE-VERIFY ?auto_13958 ?auto_13959 ?auto_13960 ?auto_13961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13970 - SURFACE
      ?auto_13971 - SURFACE
    )
    :vars
    (
      ?auto_13979 - HOIST
      ?auto_13974 - PLACE
      ?auto_13980 - SURFACE
      ?auto_13975 - PLACE
      ?auto_13973 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13978 - TRUCK
      ?auto_13976 - PLACE
      ?auto_13972 - HOIST
      ?auto_13981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13979 ?auto_13974 ) ( IS-CRATE ?auto_13971 ) ( not ( = ?auto_13970 ?auto_13971 ) ) ( not ( = ?auto_13980 ?auto_13970 ) ) ( not ( = ?auto_13980 ?auto_13971 ) ) ( not ( = ?auto_13975 ?auto_13974 ) ) ( HOIST-AT ?auto_13973 ?auto_13975 ) ( not ( = ?auto_13979 ?auto_13973 ) ) ( AVAILABLE ?auto_13973 ) ( SURFACE-AT ?auto_13971 ?auto_13975 ) ( ON ?auto_13971 ?auto_13977 ) ( CLEAR ?auto_13971 ) ( not ( = ?auto_13970 ?auto_13977 ) ) ( not ( = ?auto_13971 ?auto_13977 ) ) ( not ( = ?auto_13980 ?auto_13977 ) ) ( SURFACE-AT ?auto_13980 ?auto_13974 ) ( CLEAR ?auto_13980 ) ( IS-CRATE ?auto_13970 ) ( AVAILABLE ?auto_13979 ) ( TRUCK-AT ?auto_13978 ?auto_13976 ) ( not ( = ?auto_13976 ?auto_13974 ) ) ( not ( = ?auto_13975 ?auto_13976 ) ) ( HOIST-AT ?auto_13972 ?auto_13976 ) ( not ( = ?auto_13979 ?auto_13972 ) ) ( not ( = ?auto_13973 ?auto_13972 ) ) ( AVAILABLE ?auto_13972 ) ( SURFACE-AT ?auto_13970 ?auto_13976 ) ( ON ?auto_13970 ?auto_13981 ) ( CLEAR ?auto_13970 ) ( not ( = ?auto_13970 ?auto_13981 ) ) ( not ( = ?auto_13971 ?auto_13981 ) ) ( not ( = ?auto_13980 ?auto_13981 ) ) ( not ( = ?auto_13977 ?auto_13981 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13972 ?auto_13970 ?auto_13981 ?auto_13976 )
      ( MAKE-2CRATE ?auto_13980 ?auto_13970 ?auto_13971 )
      ( MAKE-1CRATE-VERIFY ?auto_13970 ?auto_13971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13982 - SURFACE
      ?auto_13983 - SURFACE
      ?auto_13984 - SURFACE
    )
    :vars
    (
      ?auto_13988 - HOIST
      ?auto_13989 - PLACE
      ?auto_13986 - PLACE
      ?auto_13985 - HOIST
      ?auto_13990 - SURFACE
      ?auto_13991 - TRUCK
      ?auto_13993 - PLACE
      ?auto_13987 - HOIST
      ?auto_13992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13988 ?auto_13989 ) ( IS-CRATE ?auto_13984 ) ( not ( = ?auto_13983 ?auto_13984 ) ) ( not ( = ?auto_13982 ?auto_13983 ) ) ( not ( = ?auto_13982 ?auto_13984 ) ) ( not ( = ?auto_13986 ?auto_13989 ) ) ( HOIST-AT ?auto_13985 ?auto_13986 ) ( not ( = ?auto_13988 ?auto_13985 ) ) ( AVAILABLE ?auto_13985 ) ( SURFACE-AT ?auto_13984 ?auto_13986 ) ( ON ?auto_13984 ?auto_13990 ) ( CLEAR ?auto_13984 ) ( not ( = ?auto_13983 ?auto_13990 ) ) ( not ( = ?auto_13984 ?auto_13990 ) ) ( not ( = ?auto_13982 ?auto_13990 ) ) ( SURFACE-AT ?auto_13982 ?auto_13989 ) ( CLEAR ?auto_13982 ) ( IS-CRATE ?auto_13983 ) ( AVAILABLE ?auto_13988 ) ( TRUCK-AT ?auto_13991 ?auto_13993 ) ( not ( = ?auto_13993 ?auto_13989 ) ) ( not ( = ?auto_13986 ?auto_13993 ) ) ( HOIST-AT ?auto_13987 ?auto_13993 ) ( not ( = ?auto_13988 ?auto_13987 ) ) ( not ( = ?auto_13985 ?auto_13987 ) ) ( AVAILABLE ?auto_13987 ) ( SURFACE-AT ?auto_13983 ?auto_13993 ) ( ON ?auto_13983 ?auto_13992 ) ( CLEAR ?auto_13983 ) ( not ( = ?auto_13983 ?auto_13992 ) ) ( not ( = ?auto_13984 ?auto_13992 ) ) ( not ( = ?auto_13982 ?auto_13992 ) ) ( not ( = ?auto_13990 ?auto_13992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13983 ?auto_13984 )
      ( MAKE-2CRATE-VERIFY ?auto_13982 ?auto_13983 ?auto_13984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13994 - SURFACE
      ?auto_13995 - SURFACE
      ?auto_13996 - SURFACE
      ?auto_13997 - SURFACE
    )
    :vars
    (
      ?auto_14000 - HOIST
      ?auto_14001 - PLACE
      ?auto_14004 - PLACE
      ?auto_13999 - HOIST
      ?auto_14002 - SURFACE
      ?auto_13998 - TRUCK
      ?auto_14005 - PLACE
      ?auto_14003 - HOIST
      ?auto_14006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14000 ?auto_14001 ) ( IS-CRATE ?auto_13997 ) ( not ( = ?auto_13996 ?auto_13997 ) ) ( not ( = ?auto_13995 ?auto_13996 ) ) ( not ( = ?auto_13995 ?auto_13997 ) ) ( not ( = ?auto_14004 ?auto_14001 ) ) ( HOIST-AT ?auto_13999 ?auto_14004 ) ( not ( = ?auto_14000 ?auto_13999 ) ) ( AVAILABLE ?auto_13999 ) ( SURFACE-AT ?auto_13997 ?auto_14004 ) ( ON ?auto_13997 ?auto_14002 ) ( CLEAR ?auto_13997 ) ( not ( = ?auto_13996 ?auto_14002 ) ) ( not ( = ?auto_13997 ?auto_14002 ) ) ( not ( = ?auto_13995 ?auto_14002 ) ) ( SURFACE-AT ?auto_13995 ?auto_14001 ) ( CLEAR ?auto_13995 ) ( IS-CRATE ?auto_13996 ) ( AVAILABLE ?auto_14000 ) ( TRUCK-AT ?auto_13998 ?auto_14005 ) ( not ( = ?auto_14005 ?auto_14001 ) ) ( not ( = ?auto_14004 ?auto_14005 ) ) ( HOIST-AT ?auto_14003 ?auto_14005 ) ( not ( = ?auto_14000 ?auto_14003 ) ) ( not ( = ?auto_13999 ?auto_14003 ) ) ( AVAILABLE ?auto_14003 ) ( SURFACE-AT ?auto_13996 ?auto_14005 ) ( ON ?auto_13996 ?auto_14006 ) ( CLEAR ?auto_13996 ) ( not ( = ?auto_13996 ?auto_14006 ) ) ( not ( = ?auto_13997 ?auto_14006 ) ) ( not ( = ?auto_13995 ?auto_14006 ) ) ( not ( = ?auto_14002 ?auto_14006 ) ) ( ON ?auto_13995 ?auto_13994 ) ( not ( = ?auto_13994 ?auto_13995 ) ) ( not ( = ?auto_13994 ?auto_13996 ) ) ( not ( = ?auto_13994 ?auto_13997 ) ) ( not ( = ?auto_13994 ?auto_14002 ) ) ( not ( = ?auto_13994 ?auto_14006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13995 ?auto_13996 ?auto_13997 )
      ( MAKE-3CRATE-VERIFY ?auto_13994 ?auto_13995 ?auto_13996 ?auto_13997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14007 - SURFACE
      ?auto_14008 - SURFACE
    )
    :vars
    (
      ?auto_14012 - HOIST
      ?auto_14013 - PLACE
      ?auto_14009 - SURFACE
      ?auto_14016 - PLACE
      ?auto_14011 - HOIST
      ?auto_14014 - SURFACE
      ?auto_14017 - PLACE
      ?auto_14015 - HOIST
      ?auto_14018 - SURFACE
      ?auto_14010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14012 ?auto_14013 ) ( IS-CRATE ?auto_14008 ) ( not ( = ?auto_14007 ?auto_14008 ) ) ( not ( = ?auto_14009 ?auto_14007 ) ) ( not ( = ?auto_14009 ?auto_14008 ) ) ( not ( = ?auto_14016 ?auto_14013 ) ) ( HOIST-AT ?auto_14011 ?auto_14016 ) ( not ( = ?auto_14012 ?auto_14011 ) ) ( AVAILABLE ?auto_14011 ) ( SURFACE-AT ?auto_14008 ?auto_14016 ) ( ON ?auto_14008 ?auto_14014 ) ( CLEAR ?auto_14008 ) ( not ( = ?auto_14007 ?auto_14014 ) ) ( not ( = ?auto_14008 ?auto_14014 ) ) ( not ( = ?auto_14009 ?auto_14014 ) ) ( SURFACE-AT ?auto_14009 ?auto_14013 ) ( CLEAR ?auto_14009 ) ( IS-CRATE ?auto_14007 ) ( AVAILABLE ?auto_14012 ) ( not ( = ?auto_14017 ?auto_14013 ) ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( HOIST-AT ?auto_14015 ?auto_14017 ) ( not ( = ?auto_14012 ?auto_14015 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( AVAILABLE ?auto_14015 ) ( SURFACE-AT ?auto_14007 ?auto_14017 ) ( ON ?auto_14007 ?auto_14018 ) ( CLEAR ?auto_14007 ) ( not ( = ?auto_14007 ?auto_14018 ) ) ( not ( = ?auto_14008 ?auto_14018 ) ) ( not ( = ?auto_14009 ?auto_14018 ) ) ( not ( = ?auto_14014 ?auto_14018 ) ) ( TRUCK-AT ?auto_14010 ?auto_14013 ) )
    :subtasks
    ( ( !DRIVE ?auto_14010 ?auto_14013 ?auto_14017 )
      ( MAKE-2CRATE ?auto_14009 ?auto_14007 ?auto_14008 )
      ( MAKE-1CRATE-VERIFY ?auto_14007 ?auto_14008 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14019 - SURFACE
      ?auto_14020 - SURFACE
      ?auto_14021 - SURFACE
    )
    :vars
    (
      ?auto_14029 - HOIST
      ?auto_14023 - PLACE
      ?auto_14026 - PLACE
      ?auto_14028 - HOIST
      ?auto_14022 - SURFACE
      ?auto_14025 - PLACE
      ?auto_14024 - HOIST
      ?auto_14030 - SURFACE
      ?auto_14027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14029 ?auto_14023 ) ( IS-CRATE ?auto_14021 ) ( not ( = ?auto_14020 ?auto_14021 ) ) ( not ( = ?auto_14019 ?auto_14020 ) ) ( not ( = ?auto_14019 ?auto_14021 ) ) ( not ( = ?auto_14026 ?auto_14023 ) ) ( HOIST-AT ?auto_14028 ?auto_14026 ) ( not ( = ?auto_14029 ?auto_14028 ) ) ( AVAILABLE ?auto_14028 ) ( SURFACE-AT ?auto_14021 ?auto_14026 ) ( ON ?auto_14021 ?auto_14022 ) ( CLEAR ?auto_14021 ) ( not ( = ?auto_14020 ?auto_14022 ) ) ( not ( = ?auto_14021 ?auto_14022 ) ) ( not ( = ?auto_14019 ?auto_14022 ) ) ( SURFACE-AT ?auto_14019 ?auto_14023 ) ( CLEAR ?auto_14019 ) ( IS-CRATE ?auto_14020 ) ( AVAILABLE ?auto_14029 ) ( not ( = ?auto_14025 ?auto_14023 ) ) ( not ( = ?auto_14026 ?auto_14025 ) ) ( HOIST-AT ?auto_14024 ?auto_14025 ) ( not ( = ?auto_14029 ?auto_14024 ) ) ( not ( = ?auto_14028 ?auto_14024 ) ) ( AVAILABLE ?auto_14024 ) ( SURFACE-AT ?auto_14020 ?auto_14025 ) ( ON ?auto_14020 ?auto_14030 ) ( CLEAR ?auto_14020 ) ( not ( = ?auto_14020 ?auto_14030 ) ) ( not ( = ?auto_14021 ?auto_14030 ) ) ( not ( = ?auto_14019 ?auto_14030 ) ) ( not ( = ?auto_14022 ?auto_14030 ) ) ( TRUCK-AT ?auto_14027 ?auto_14023 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14020 ?auto_14021 )
      ( MAKE-2CRATE-VERIFY ?auto_14019 ?auto_14020 ?auto_14021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14031 - SURFACE
      ?auto_14032 - SURFACE
      ?auto_14033 - SURFACE
      ?auto_14034 - SURFACE
    )
    :vars
    (
      ?auto_14035 - HOIST
      ?auto_14037 - PLACE
      ?auto_14042 - PLACE
      ?auto_14036 - HOIST
      ?auto_14039 - SURFACE
      ?auto_14038 - PLACE
      ?auto_14043 - HOIST
      ?auto_14041 - SURFACE
      ?auto_14040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14035 ?auto_14037 ) ( IS-CRATE ?auto_14034 ) ( not ( = ?auto_14033 ?auto_14034 ) ) ( not ( = ?auto_14032 ?auto_14033 ) ) ( not ( = ?auto_14032 ?auto_14034 ) ) ( not ( = ?auto_14042 ?auto_14037 ) ) ( HOIST-AT ?auto_14036 ?auto_14042 ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( AVAILABLE ?auto_14036 ) ( SURFACE-AT ?auto_14034 ?auto_14042 ) ( ON ?auto_14034 ?auto_14039 ) ( CLEAR ?auto_14034 ) ( not ( = ?auto_14033 ?auto_14039 ) ) ( not ( = ?auto_14034 ?auto_14039 ) ) ( not ( = ?auto_14032 ?auto_14039 ) ) ( SURFACE-AT ?auto_14032 ?auto_14037 ) ( CLEAR ?auto_14032 ) ( IS-CRATE ?auto_14033 ) ( AVAILABLE ?auto_14035 ) ( not ( = ?auto_14038 ?auto_14037 ) ) ( not ( = ?auto_14042 ?auto_14038 ) ) ( HOIST-AT ?auto_14043 ?auto_14038 ) ( not ( = ?auto_14035 ?auto_14043 ) ) ( not ( = ?auto_14036 ?auto_14043 ) ) ( AVAILABLE ?auto_14043 ) ( SURFACE-AT ?auto_14033 ?auto_14038 ) ( ON ?auto_14033 ?auto_14041 ) ( CLEAR ?auto_14033 ) ( not ( = ?auto_14033 ?auto_14041 ) ) ( not ( = ?auto_14034 ?auto_14041 ) ) ( not ( = ?auto_14032 ?auto_14041 ) ) ( not ( = ?auto_14039 ?auto_14041 ) ) ( TRUCK-AT ?auto_14040 ?auto_14037 ) ( ON ?auto_14032 ?auto_14031 ) ( not ( = ?auto_14031 ?auto_14032 ) ) ( not ( = ?auto_14031 ?auto_14033 ) ) ( not ( = ?auto_14031 ?auto_14034 ) ) ( not ( = ?auto_14031 ?auto_14039 ) ) ( not ( = ?auto_14031 ?auto_14041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14032 ?auto_14033 ?auto_14034 )
      ( MAKE-3CRATE-VERIFY ?auto_14031 ?auto_14032 ?auto_14033 ?auto_14034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14044 - SURFACE
      ?auto_14045 - SURFACE
    )
    :vars
    (
      ?auto_14046 - HOIST
      ?auto_14048 - PLACE
      ?auto_14050 - SURFACE
      ?auto_14054 - PLACE
      ?auto_14047 - HOIST
      ?auto_14051 - SURFACE
      ?auto_14049 - PLACE
      ?auto_14055 - HOIST
      ?auto_14053 - SURFACE
      ?auto_14052 - TRUCK
      ?auto_14056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14046 ?auto_14048 ) ( IS-CRATE ?auto_14045 ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( not ( = ?auto_14050 ?auto_14044 ) ) ( not ( = ?auto_14050 ?auto_14045 ) ) ( not ( = ?auto_14054 ?auto_14048 ) ) ( HOIST-AT ?auto_14047 ?auto_14054 ) ( not ( = ?auto_14046 ?auto_14047 ) ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14045 ?auto_14054 ) ( ON ?auto_14045 ?auto_14051 ) ( CLEAR ?auto_14045 ) ( not ( = ?auto_14044 ?auto_14051 ) ) ( not ( = ?auto_14045 ?auto_14051 ) ) ( not ( = ?auto_14050 ?auto_14051 ) ) ( IS-CRATE ?auto_14044 ) ( not ( = ?auto_14049 ?auto_14048 ) ) ( not ( = ?auto_14054 ?auto_14049 ) ) ( HOIST-AT ?auto_14055 ?auto_14049 ) ( not ( = ?auto_14046 ?auto_14055 ) ) ( not ( = ?auto_14047 ?auto_14055 ) ) ( AVAILABLE ?auto_14055 ) ( SURFACE-AT ?auto_14044 ?auto_14049 ) ( ON ?auto_14044 ?auto_14053 ) ( CLEAR ?auto_14044 ) ( not ( = ?auto_14044 ?auto_14053 ) ) ( not ( = ?auto_14045 ?auto_14053 ) ) ( not ( = ?auto_14050 ?auto_14053 ) ) ( not ( = ?auto_14051 ?auto_14053 ) ) ( TRUCK-AT ?auto_14052 ?auto_14048 ) ( SURFACE-AT ?auto_14056 ?auto_14048 ) ( CLEAR ?auto_14056 ) ( LIFTING ?auto_14046 ?auto_14050 ) ( IS-CRATE ?auto_14050 ) ( not ( = ?auto_14056 ?auto_14050 ) ) ( not ( = ?auto_14044 ?auto_14056 ) ) ( not ( = ?auto_14045 ?auto_14056 ) ) ( not ( = ?auto_14051 ?auto_14056 ) ) ( not ( = ?auto_14053 ?auto_14056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14056 ?auto_14050 )
      ( MAKE-2CRATE ?auto_14050 ?auto_14044 ?auto_14045 )
      ( MAKE-1CRATE-VERIFY ?auto_14044 ?auto_14045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14057 - SURFACE
      ?auto_14058 - SURFACE
      ?auto_14059 - SURFACE
    )
    :vars
    (
      ?auto_14063 - HOIST
      ?auto_14064 - PLACE
      ?auto_14069 - PLACE
      ?auto_14061 - HOIST
      ?auto_14066 - SURFACE
      ?auto_14068 - PLACE
      ?auto_14062 - HOIST
      ?auto_14067 - SURFACE
      ?auto_14065 - TRUCK
      ?auto_14060 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14063 ?auto_14064 ) ( IS-CRATE ?auto_14059 ) ( not ( = ?auto_14058 ?auto_14059 ) ) ( not ( = ?auto_14057 ?auto_14058 ) ) ( not ( = ?auto_14057 ?auto_14059 ) ) ( not ( = ?auto_14069 ?auto_14064 ) ) ( HOIST-AT ?auto_14061 ?auto_14069 ) ( not ( = ?auto_14063 ?auto_14061 ) ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14059 ?auto_14069 ) ( ON ?auto_14059 ?auto_14066 ) ( CLEAR ?auto_14059 ) ( not ( = ?auto_14058 ?auto_14066 ) ) ( not ( = ?auto_14059 ?auto_14066 ) ) ( not ( = ?auto_14057 ?auto_14066 ) ) ( IS-CRATE ?auto_14058 ) ( not ( = ?auto_14068 ?auto_14064 ) ) ( not ( = ?auto_14069 ?auto_14068 ) ) ( HOIST-AT ?auto_14062 ?auto_14068 ) ( not ( = ?auto_14063 ?auto_14062 ) ) ( not ( = ?auto_14061 ?auto_14062 ) ) ( AVAILABLE ?auto_14062 ) ( SURFACE-AT ?auto_14058 ?auto_14068 ) ( ON ?auto_14058 ?auto_14067 ) ( CLEAR ?auto_14058 ) ( not ( = ?auto_14058 ?auto_14067 ) ) ( not ( = ?auto_14059 ?auto_14067 ) ) ( not ( = ?auto_14057 ?auto_14067 ) ) ( not ( = ?auto_14066 ?auto_14067 ) ) ( TRUCK-AT ?auto_14065 ?auto_14064 ) ( SURFACE-AT ?auto_14060 ?auto_14064 ) ( CLEAR ?auto_14060 ) ( LIFTING ?auto_14063 ?auto_14057 ) ( IS-CRATE ?auto_14057 ) ( not ( = ?auto_14060 ?auto_14057 ) ) ( not ( = ?auto_14058 ?auto_14060 ) ) ( not ( = ?auto_14059 ?auto_14060 ) ) ( not ( = ?auto_14066 ?auto_14060 ) ) ( not ( = ?auto_14067 ?auto_14060 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14058 ?auto_14059 )
      ( MAKE-2CRATE-VERIFY ?auto_14057 ?auto_14058 ?auto_14059 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14070 - SURFACE
      ?auto_14071 - SURFACE
      ?auto_14072 - SURFACE
      ?auto_14073 - SURFACE
    )
    :vars
    (
      ?auto_14081 - HOIST
      ?auto_14079 - PLACE
      ?auto_14080 - PLACE
      ?auto_14075 - HOIST
      ?auto_14082 - SURFACE
      ?auto_14076 - PLACE
      ?auto_14078 - HOIST
      ?auto_14077 - SURFACE
      ?auto_14074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14081 ?auto_14079 ) ( IS-CRATE ?auto_14073 ) ( not ( = ?auto_14072 ?auto_14073 ) ) ( not ( = ?auto_14071 ?auto_14072 ) ) ( not ( = ?auto_14071 ?auto_14073 ) ) ( not ( = ?auto_14080 ?auto_14079 ) ) ( HOIST-AT ?auto_14075 ?auto_14080 ) ( not ( = ?auto_14081 ?auto_14075 ) ) ( AVAILABLE ?auto_14075 ) ( SURFACE-AT ?auto_14073 ?auto_14080 ) ( ON ?auto_14073 ?auto_14082 ) ( CLEAR ?auto_14073 ) ( not ( = ?auto_14072 ?auto_14082 ) ) ( not ( = ?auto_14073 ?auto_14082 ) ) ( not ( = ?auto_14071 ?auto_14082 ) ) ( IS-CRATE ?auto_14072 ) ( not ( = ?auto_14076 ?auto_14079 ) ) ( not ( = ?auto_14080 ?auto_14076 ) ) ( HOIST-AT ?auto_14078 ?auto_14076 ) ( not ( = ?auto_14081 ?auto_14078 ) ) ( not ( = ?auto_14075 ?auto_14078 ) ) ( AVAILABLE ?auto_14078 ) ( SURFACE-AT ?auto_14072 ?auto_14076 ) ( ON ?auto_14072 ?auto_14077 ) ( CLEAR ?auto_14072 ) ( not ( = ?auto_14072 ?auto_14077 ) ) ( not ( = ?auto_14073 ?auto_14077 ) ) ( not ( = ?auto_14071 ?auto_14077 ) ) ( not ( = ?auto_14082 ?auto_14077 ) ) ( TRUCK-AT ?auto_14074 ?auto_14079 ) ( SURFACE-AT ?auto_14070 ?auto_14079 ) ( CLEAR ?auto_14070 ) ( LIFTING ?auto_14081 ?auto_14071 ) ( IS-CRATE ?auto_14071 ) ( not ( = ?auto_14070 ?auto_14071 ) ) ( not ( = ?auto_14072 ?auto_14070 ) ) ( not ( = ?auto_14073 ?auto_14070 ) ) ( not ( = ?auto_14082 ?auto_14070 ) ) ( not ( = ?auto_14077 ?auto_14070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14071 ?auto_14072 ?auto_14073 )
      ( MAKE-3CRATE-VERIFY ?auto_14070 ?auto_14071 ?auto_14072 ?auto_14073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14083 - SURFACE
      ?auto_14084 - SURFACE
    )
    :vars
    (
      ?auto_14092 - HOIST
      ?auto_14090 - PLACE
      ?auto_14095 - SURFACE
      ?auto_14091 - PLACE
      ?auto_14086 - HOIST
      ?auto_14094 - SURFACE
      ?auto_14087 - PLACE
      ?auto_14089 - HOIST
      ?auto_14088 - SURFACE
      ?auto_14085 - TRUCK
      ?auto_14093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14092 ?auto_14090 ) ( IS-CRATE ?auto_14084 ) ( not ( = ?auto_14083 ?auto_14084 ) ) ( not ( = ?auto_14095 ?auto_14083 ) ) ( not ( = ?auto_14095 ?auto_14084 ) ) ( not ( = ?auto_14091 ?auto_14090 ) ) ( HOIST-AT ?auto_14086 ?auto_14091 ) ( not ( = ?auto_14092 ?auto_14086 ) ) ( AVAILABLE ?auto_14086 ) ( SURFACE-AT ?auto_14084 ?auto_14091 ) ( ON ?auto_14084 ?auto_14094 ) ( CLEAR ?auto_14084 ) ( not ( = ?auto_14083 ?auto_14094 ) ) ( not ( = ?auto_14084 ?auto_14094 ) ) ( not ( = ?auto_14095 ?auto_14094 ) ) ( IS-CRATE ?auto_14083 ) ( not ( = ?auto_14087 ?auto_14090 ) ) ( not ( = ?auto_14091 ?auto_14087 ) ) ( HOIST-AT ?auto_14089 ?auto_14087 ) ( not ( = ?auto_14092 ?auto_14089 ) ) ( not ( = ?auto_14086 ?auto_14089 ) ) ( AVAILABLE ?auto_14089 ) ( SURFACE-AT ?auto_14083 ?auto_14087 ) ( ON ?auto_14083 ?auto_14088 ) ( CLEAR ?auto_14083 ) ( not ( = ?auto_14083 ?auto_14088 ) ) ( not ( = ?auto_14084 ?auto_14088 ) ) ( not ( = ?auto_14095 ?auto_14088 ) ) ( not ( = ?auto_14094 ?auto_14088 ) ) ( TRUCK-AT ?auto_14085 ?auto_14090 ) ( SURFACE-AT ?auto_14093 ?auto_14090 ) ( CLEAR ?auto_14093 ) ( IS-CRATE ?auto_14095 ) ( not ( = ?auto_14093 ?auto_14095 ) ) ( not ( = ?auto_14083 ?auto_14093 ) ) ( not ( = ?auto_14084 ?auto_14093 ) ) ( not ( = ?auto_14094 ?auto_14093 ) ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( AVAILABLE ?auto_14092 ) ( IN ?auto_14095 ?auto_14085 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14092 ?auto_14095 ?auto_14085 ?auto_14090 )
      ( MAKE-2CRATE ?auto_14095 ?auto_14083 ?auto_14084 )
      ( MAKE-1CRATE-VERIFY ?auto_14083 ?auto_14084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14096 - SURFACE
      ?auto_14097 - SURFACE
      ?auto_14098 - SURFACE
    )
    :vars
    (
      ?auto_14105 - HOIST
      ?auto_14106 - PLACE
      ?auto_14108 - PLACE
      ?auto_14101 - HOIST
      ?auto_14100 - SURFACE
      ?auto_14102 - PLACE
      ?auto_14099 - HOIST
      ?auto_14104 - SURFACE
      ?auto_14107 - TRUCK
      ?auto_14103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14105 ?auto_14106 ) ( IS-CRATE ?auto_14098 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14096 ?auto_14097 ) ) ( not ( = ?auto_14096 ?auto_14098 ) ) ( not ( = ?auto_14108 ?auto_14106 ) ) ( HOIST-AT ?auto_14101 ?auto_14108 ) ( not ( = ?auto_14105 ?auto_14101 ) ) ( AVAILABLE ?auto_14101 ) ( SURFACE-AT ?auto_14098 ?auto_14108 ) ( ON ?auto_14098 ?auto_14100 ) ( CLEAR ?auto_14098 ) ( not ( = ?auto_14097 ?auto_14100 ) ) ( not ( = ?auto_14098 ?auto_14100 ) ) ( not ( = ?auto_14096 ?auto_14100 ) ) ( IS-CRATE ?auto_14097 ) ( not ( = ?auto_14102 ?auto_14106 ) ) ( not ( = ?auto_14108 ?auto_14102 ) ) ( HOIST-AT ?auto_14099 ?auto_14102 ) ( not ( = ?auto_14105 ?auto_14099 ) ) ( not ( = ?auto_14101 ?auto_14099 ) ) ( AVAILABLE ?auto_14099 ) ( SURFACE-AT ?auto_14097 ?auto_14102 ) ( ON ?auto_14097 ?auto_14104 ) ( CLEAR ?auto_14097 ) ( not ( = ?auto_14097 ?auto_14104 ) ) ( not ( = ?auto_14098 ?auto_14104 ) ) ( not ( = ?auto_14096 ?auto_14104 ) ) ( not ( = ?auto_14100 ?auto_14104 ) ) ( TRUCK-AT ?auto_14107 ?auto_14106 ) ( SURFACE-AT ?auto_14103 ?auto_14106 ) ( CLEAR ?auto_14103 ) ( IS-CRATE ?auto_14096 ) ( not ( = ?auto_14103 ?auto_14096 ) ) ( not ( = ?auto_14097 ?auto_14103 ) ) ( not ( = ?auto_14098 ?auto_14103 ) ) ( not ( = ?auto_14100 ?auto_14103 ) ) ( not ( = ?auto_14104 ?auto_14103 ) ) ( AVAILABLE ?auto_14105 ) ( IN ?auto_14096 ?auto_14107 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14097 ?auto_14098 )
      ( MAKE-2CRATE-VERIFY ?auto_14096 ?auto_14097 ?auto_14098 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14109 - SURFACE
      ?auto_14110 - SURFACE
      ?auto_14111 - SURFACE
      ?auto_14112 - SURFACE
    )
    :vars
    (
      ?auto_14120 - HOIST
      ?auto_14116 - PLACE
      ?auto_14121 - PLACE
      ?auto_14115 - HOIST
      ?auto_14117 - SURFACE
      ?auto_14114 - PLACE
      ?auto_14119 - HOIST
      ?auto_14118 - SURFACE
      ?auto_14113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14120 ?auto_14116 ) ( IS-CRATE ?auto_14112 ) ( not ( = ?auto_14111 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14111 ) ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14121 ?auto_14116 ) ) ( HOIST-AT ?auto_14115 ?auto_14121 ) ( not ( = ?auto_14120 ?auto_14115 ) ) ( AVAILABLE ?auto_14115 ) ( SURFACE-AT ?auto_14112 ?auto_14121 ) ( ON ?auto_14112 ?auto_14117 ) ( CLEAR ?auto_14112 ) ( not ( = ?auto_14111 ?auto_14117 ) ) ( not ( = ?auto_14112 ?auto_14117 ) ) ( not ( = ?auto_14110 ?auto_14117 ) ) ( IS-CRATE ?auto_14111 ) ( not ( = ?auto_14114 ?auto_14116 ) ) ( not ( = ?auto_14121 ?auto_14114 ) ) ( HOIST-AT ?auto_14119 ?auto_14114 ) ( not ( = ?auto_14120 ?auto_14119 ) ) ( not ( = ?auto_14115 ?auto_14119 ) ) ( AVAILABLE ?auto_14119 ) ( SURFACE-AT ?auto_14111 ?auto_14114 ) ( ON ?auto_14111 ?auto_14118 ) ( CLEAR ?auto_14111 ) ( not ( = ?auto_14111 ?auto_14118 ) ) ( not ( = ?auto_14112 ?auto_14118 ) ) ( not ( = ?auto_14110 ?auto_14118 ) ) ( not ( = ?auto_14117 ?auto_14118 ) ) ( TRUCK-AT ?auto_14113 ?auto_14116 ) ( SURFACE-AT ?auto_14109 ?auto_14116 ) ( CLEAR ?auto_14109 ) ( IS-CRATE ?auto_14110 ) ( not ( = ?auto_14109 ?auto_14110 ) ) ( not ( = ?auto_14111 ?auto_14109 ) ) ( not ( = ?auto_14112 ?auto_14109 ) ) ( not ( = ?auto_14117 ?auto_14109 ) ) ( not ( = ?auto_14118 ?auto_14109 ) ) ( AVAILABLE ?auto_14120 ) ( IN ?auto_14110 ?auto_14113 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14110 ?auto_14111 ?auto_14112 )
      ( MAKE-3CRATE-VERIFY ?auto_14109 ?auto_14110 ?auto_14111 ?auto_14112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14122 - SURFACE
      ?auto_14123 - SURFACE
    )
    :vars
    (
      ?auto_14132 - HOIST
      ?auto_14128 - PLACE
      ?auto_14124 - SURFACE
      ?auto_14133 - PLACE
      ?auto_14127 - HOIST
      ?auto_14129 - SURFACE
      ?auto_14126 - PLACE
      ?auto_14131 - HOIST
      ?auto_14130 - SURFACE
      ?auto_14134 - SURFACE
      ?auto_14125 - TRUCK
      ?auto_14135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14132 ?auto_14128 ) ( IS-CRATE ?auto_14123 ) ( not ( = ?auto_14122 ?auto_14123 ) ) ( not ( = ?auto_14124 ?auto_14122 ) ) ( not ( = ?auto_14124 ?auto_14123 ) ) ( not ( = ?auto_14133 ?auto_14128 ) ) ( HOIST-AT ?auto_14127 ?auto_14133 ) ( not ( = ?auto_14132 ?auto_14127 ) ) ( AVAILABLE ?auto_14127 ) ( SURFACE-AT ?auto_14123 ?auto_14133 ) ( ON ?auto_14123 ?auto_14129 ) ( CLEAR ?auto_14123 ) ( not ( = ?auto_14122 ?auto_14129 ) ) ( not ( = ?auto_14123 ?auto_14129 ) ) ( not ( = ?auto_14124 ?auto_14129 ) ) ( IS-CRATE ?auto_14122 ) ( not ( = ?auto_14126 ?auto_14128 ) ) ( not ( = ?auto_14133 ?auto_14126 ) ) ( HOIST-AT ?auto_14131 ?auto_14126 ) ( not ( = ?auto_14132 ?auto_14131 ) ) ( not ( = ?auto_14127 ?auto_14131 ) ) ( AVAILABLE ?auto_14131 ) ( SURFACE-AT ?auto_14122 ?auto_14126 ) ( ON ?auto_14122 ?auto_14130 ) ( CLEAR ?auto_14122 ) ( not ( = ?auto_14122 ?auto_14130 ) ) ( not ( = ?auto_14123 ?auto_14130 ) ) ( not ( = ?auto_14124 ?auto_14130 ) ) ( not ( = ?auto_14129 ?auto_14130 ) ) ( SURFACE-AT ?auto_14134 ?auto_14128 ) ( CLEAR ?auto_14134 ) ( IS-CRATE ?auto_14124 ) ( not ( = ?auto_14134 ?auto_14124 ) ) ( not ( = ?auto_14122 ?auto_14134 ) ) ( not ( = ?auto_14123 ?auto_14134 ) ) ( not ( = ?auto_14129 ?auto_14134 ) ) ( not ( = ?auto_14130 ?auto_14134 ) ) ( AVAILABLE ?auto_14132 ) ( IN ?auto_14124 ?auto_14125 ) ( TRUCK-AT ?auto_14125 ?auto_14135 ) ( not ( = ?auto_14135 ?auto_14128 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14126 ?auto_14135 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14125 ?auto_14135 ?auto_14128 )
      ( MAKE-2CRATE ?auto_14124 ?auto_14122 ?auto_14123 )
      ( MAKE-1CRATE-VERIFY ?auto_14122 ?auto_14123 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14136 - SURFACE
      ?auto_14137 - SURFACE
      ?auto_14138 - SURFACE
    )
    :vars
    (
      ?auto_14143 - HOIST
      ?auto_14142 - PLACE
      ?auto_14148 - PLACE
      ?auto_14146 - HOIST
      ?auto_14147 - SURFACE
      ?auto_14139 - PLACE
      ?auto_14140 - HOIST
      ?auto_14145 - SURFACE
      ?auto_14141 - SURFACE
      ?auto_14144 - TRUCK
      ?auto_14149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14143 ?auto_14142 ) ( IS-CRATE ?auto_14138 ) ( not ( = ?auto_14137 ?auto_14138 ) ) ( not ( = ?auto_14136 ?auto_14137 ) ) ( not ( = ?auto_14136 ?auto_14138 ) ) ( not ( = ?auto_14148 ?auto_14142 ) ) ( HOIST-AT ?auto_14146 ?auto_14148 ) ( not ( = ?auto_14143 ?auto_14146 ) ) ( AVAILABLE ?auto_14146 ) ( SURFACE-AT ?auto_14138 ?auto_14148 ) ( ON ?auto_14138 ?auto_14147 ) ( CLEAR ?auto_14138 ) ( not ( = ?auto_14137 ?auto_14147 ) ) ( not ( = ?auto_14138 ?auto_14147 ) ) ( not ( = ?auto_14136 ?auto_14147 ) ) ( IS-CRATE ?auto_14137 ) ( not ( = ?auto_14139 ?auto_14142 ) ) ( not ( = ?auto_14148 ?auto_14139 ) ) ( HOIST-AT ?auto_14140 ?auto_14139 ) ( not ( = ?auto_14143 ?auto_14140 ) ) ( not ( = ?auto_14146 ?auto_14140 ) ) ( AVAILABLE ?auto_14140 ) ( SURFACE-AT ?auto_14137 ?auto_14139 ) ( ON ?auto_14137 ?auto_14145 ) ( CLEAR ?auto_14137 ) ( not ( = ?auto_14137 ?auto_14145 ) ) ( not ( = ?auto_14138 ?auto_14145 ) ) ( not ( = ?auto_14136 ?auto_14145 ) ) ( not ( = ?auto_14147 ?auto_14145 ) ) ( SURFACE-AT ?auto_14141 ?auto_14142 ) ( CLEAR ?auto_14141 ) ( IS-CRATE ?auto_14136 ) ( not ( = ?auto_14141 ?auto_14136 ) ) ( not ( = ?auto_14137 ?auto_14141 ) ) ( not ( = ?auto_14138 ?auto_14141 ) ) ( not ( = ?auto_14147 ?auto_14141 ) ) ( not ( = ?auto_14145 ?auto_14141 ) ) ( AVAILABLE ?auto_14143 ) ( IN ?auto_14136 ?auto_14144 ) ( TRUCK-AT ?auto_14144 ?auto_14149 ) ( not ( = ?auto_14149 ?auto_14142 ) ) ( not ( = ?auto_14148 ?auto_14149 ) ) ( not ( = ?auto_14139 ?auto_14149 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14137 ?auto_14138 )
      ( MAKE-2CRATE-VERIFY ?auto_14136 ?auto_14137 ?auto_14138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14150 - SURFACE
      ?auto_14151 - SURFACE
      ?auto_14152 - SURFACE
      ?auto_14153 - SURFACE
    )
    :vars
    (
      ?auto_14160 - HOIST
      ?auto_14159 - PLACE
      ?auto_14155 - PLACE
      ?auto_14156 - HOIST
      ?auto_14157 - SURFACE
      ?auto_14162 - PLACE
      ?auto_14163 - HOIST
      ?auto_14158 - SURFACE
      ?auto_14154 - TRUCK
      ?auto_14161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14160 ?auto_14159 ) ( IS-CRATE ?auto_14153 ) ( not ( = ?auto_14152 ?auto_14153 ) ) ( not ( = ?auto_14151 ?auto_14152 ) ) ( not ( = ?auto_14151 ?auto_14153 ) ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( HOIST-AT ?auto_14156 ?auto_14155 ) ( not ( = ?auto_14160 ?auto_14156 ) ) ( AVAILABLE ?auto_14156 ) ( SURFACE-AT ?auto_14153 ?auto_14155 ) ( ON ?auto_14153 ?auto_14157 ) ( CLEAR ?auto_14153 ) ( not ( = ?auto_14152 ?auto_14157 ) ) ( not ( = ?auto_14153 ?auto_14157 ) ) ( not ( = ?auto_14151 ?auto_14157 ) ) ( IS-CRATE ?auto_14152 ) ( not ( = ?auto_14162 ?auto_14159 ) ) ( not ( = ?auto_14155 ?auto_14162 ) ) ( HOIST-AT ?auto_14163 ?auto_14162 ) ( not ( = ?auto_14160 ?auto_14163 ) ) ( not ( = ?auto_14156 ?auto_14163 ) ) ( AVAILABLE ?auto_14163 ) ( SURFACE-AT ?auto_14152 ?auto_14162 ) ( ON ?auto_14152 ?auto_14158 ) ( CLEAR ?auto_14152 ) ( not ( = ?auto_14152 ?auto_14158 ) ) ( not ( = ?auto_14153 ?auto_14158 ) ) ( not ( = ?auto_14151 ?auto_14158 ) ) ( not ( = ?auto_14157 ?auto_14158 ) ) ( SURFACE-AT ?auto_14150 ?auto_14159 ) ( CLEAR ?auto_14150 ) ( IS-CRATE ?auto_14151 ) ( not ( = ?auto_14150 ?auto_14151 ) ) ( not ( = ?auto_14152 ?auto_14150 ) ) ( not ( = ?auto_14153 ?auto_14150 ) ) ( not ( = ?auto_14157 ?auto_14150 ) ) ( not ( = ?auto_14158 ?auto_14150 ) ) ( AVAILABLE ?auto_14160 ) ( IN ?auto_14151 ?auto_14154 ) ( TRUCK-AT ?auto_14154 ?auto_14161 ) ( not ( = ?auto_14161 ?auto_14159 ) ) ( not ( = ?auto_14155 ?auto_14161 ) ) ( not ( = ?auto_14162 ?auto_14161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14151 ?auto_14152 ?auto_14153 )
      ( MAKE-3CRATE-VERIFY ?auto_14150 ?auto_14151 ?auto_14152 ?auto_14153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14164 - SURFACE
      ?auto_14165 - SURFACE
    )
    :vars
    (
      ?auto_14174 - HOIST
      ?auto_14172 - PLACE
      ?auto_14171 - SURFACE
      ?auto_14167 - PLACE
      ?auto_14168 - HOIST
      ?auto_14169 - SURFACE
      ?auto_14176 - PLACE
      ?auto_14177 - HOIST
      ?auto_14170 - SURFACE
      ?auto_14173 - SURFACE
      ?auto_14166 - TRUCK
      ?auto_14175 - PLACE
      ?auto_14178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14174 ?auto_14172 ) ( IS-CRATE ?auto_14165 ) ( not ( = ?auto_14164 ?auto_14165 ) ) ( not ( = ?auto_14171 ?auto_14164 ) ) ( not ( = ?auto_14171 ?auto_14165 ) ) ( not ( = ?auto_14167 ?auto_14172 ) ) ( HOIST-AT ?auto_14168 ?auto_14167 ) ( not ( = ?auto_14174 ?auto_14168 ) ) ( AVAILABLE ?auto_14168 ) ( SURFACE-AT ?auto_14165 ?auto_14167 ) ( ON ?auto_14165 ?auto_14169 ) ( CLEAR ?auto_14165 ) ( not ( = ?auto_14164 ?auto_14169 ) ) ( not ( = ?auto_14165 ?auto_14169 ) ) ( not ( = ?auto_14171 ?auto_14169 ) ) ( IS-CRATE ?auto_14164 ) ( not ( = ?auto_14176 ?auto_14172 ) ) ( not ( = ?auto_14167 ?auto_14176 ) ) ( HOIST-AT ?auto_14177 ?auto_14176 ) ( not ( = ?auto_14174 ?auto_14177 ) ) ( not ( = ?auto_14168 ?auto_14177 ) ) ( AVAILABLE ?auto_14177 ) ( SURFACE-AT ?auto_14164 ?auto_14176 ) ( ON ?auto_14164 ?auto_14170 ) ( CLEAR ?auto_14164 ) ( not ( = ?auto_14164 ?auto_14170 ) ) ( not ( = ?auto_14165 ?auto_14170 ) ) ( not ( = ?auto_14171 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( SURFACE-AT ?auto_14173 ?auto_14172 ) ( CLEAR ?auto_14173 ) ( IS-CRATE ?auto_14171 ) ( not ( = ?auto_14173 ?auto_14171 ) ) ( not ( = ?auto_14164 ?auto_14173 ) ) ( not ( = ?auto_14165 ?auto_14173 ) ) ( not ( = ?auto_14169 ?auto_14173 ) ) ( not ( = ?auto_14170 ?auto_14173 ) ) ( AVAILABLE ?auto_14174 ) ( TRUCK-AT ?auto_14166 ?auto_14175 ) ( not ( = ?auto_14175 ?auto_14172 ) ) ( not ( = ?auto_14167 ?auto_14175 ) ) ( not ( = ?auto_14176 ?auto_14175 ) ) ( HOIST-AT ?auto_14178 ?auto_14175 ) ( LIFTING ?auto_14178 ?auto_14171 ) ( not ( = ?auto_14174 ?auto_14178 ) ) ( not ( = ?auto_14168 ?auto_14178 ) ) ( not ( = ?auto_14177 ?auto_14178 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14178 ?auto_14171 ?auto_14166 ?auto_14175 )
      ( MAKE-2CRATE ?auto_14171 ?auto_14164 ?auto_14165 )
      ( MAKE-1CRATE-VERIFY ?auto_14164 ?auto_14165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14179 - SURFACE
      ?auto_14180 - SURFACE
      ?auto_14181 - SURFACE
    )
    :vars
    (
      ?auto_14183 - HOIST
      ?auto_14188 - PLACE
      ?auto_14186 - PLACE
      ?auto_14193 - HOIST
      ?auto_14190 - SURFACE
      ?auto_14185 - PLACE
      ?auto_14192 - HOIST
      ?auto_14191 - SURFACE
      ?auto_14184 - SURFACE
      ?auto_14182 - TRUCK
      ?auto_14189 - PLACE
      ?auto_14187 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14183 ?auto_14188 ) ( IS-CRATE ?auto_14181 ) ( not ( = ?auto_14180 ?auto_14181 ) ) ( not ( = ?auto_14179 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( not ( = ?auto_14186 ?auto_14188 ) ) ( HOIST-AT ?auto_14193 ?auto_14186 ) ( not ( = ?auto_14183 ?auto_14193 ) ) ( AVAILABLE ?auto_14193 ) ( SURFACE-AT ?auto_14181 ?auto_14186 ) ( ON ?auto_14181 ?auto_14190 ) ( CLEAR ?auto_14181 ) ( not ( = ?auto_14180 ?auto_14190 ) ) ( not ( = ?auto_14181 ?auto_14190 ) ) ( not ( = ?auto_14179 ?auto_14190 ) ) ( IS-CRATE ?auto_14180 ) ( not ( = ?auto_14185 ?auto_14188 ) ) ( not ( = ?auto_14186 ?auto_14185 ) ) ( HOIST-AT ?auto_14192 ?auto_14185 ) ( not ( = ?auto_14183 ?auto_14192 ) ) ( not ( = ?auto_14193 ?auto_14192 ) ) ( AVAILABLE ?auto_14192 ) ( SURFACE-AT ?auto_14180 ?auto_14185 ) ( ON ?auto_14180 ?auto_14191 ) ( CLEAR ?auto_14180 ) ( not ( = ?auto_14180 ?auto_14191 ) ) ( not ( = ?auto_14181 ?auto_14191 ) ) ( not ( = ?auto_14179 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( SURFACE-AT ?auto_14184 ?auto_14188 ) ( CLEAR ?auto_14184 ) ( IS-CRATE ?auto_14179 ) ( not ( = ?auto_14184 ?auto_14179 ) ) ( not ( = ?auto_14180 ?auto_14184 ) ) ( not ( = ?auto_14181 ?auto_14184 ) ) ( not ( = ?auto_14190 ?auto_14184 ) ) ( not ( = ?auto_14191 ?auto_14184 ) ) ( AVAILABLE ?auto_14183 ) ( TRUCK-AT ?auto_14182 ?auto_14189 ) ( not ( = ?auto_14189 ?auto_14188 ) ) ( not ( = ?auto_14186 ?auto_14189 ) ) ( not ( = ?auto_14185 ?auto_14189 ) ) ( HOIST-AT ?auto_14187 ?auto_14189 ) ( LIFTING ?auto_14187 ?auto_14179 ) ( not ( = ?auto_14183 ?auto_14187 ) ) ( not ( = ?auto_14193 ?auto_14187 ) ) ( not ( = ?auto_14192 ?auto_14187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14180 ?auto_14181 )
      ( MAKE-2CRATE-VERIFY ?auto_14179 ?auto_14180 ?auto_14181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
      ?auto_14196 - SURFACE
      ?auto_14197 - SURFACE
    )
    :vars
    (
      ?auto_14201 - HOIST
      ?auto_14204 - PLACE
      ?auto_14207 - PLACE
      ?auto_14203 - HOIST
      ?auto_14205 - SURFACE
      ?auto_14199 - PLACE
      ?auto_14208 - HOIST
      ?auto_14206 - SURFACE
      ?auto_14200 - TRUCK
      ?auto_14198 - PLACE
      ?auto_14202 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14201 ?auto_14204 ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14196 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14197 ) ) ( not ( = ?auto_14207 ?auto_14204 ) ) ( HOIST-AT ?auto_14203 ?auto_14207 ) ( not ( = ?auto_14201 ?auto_14203 ) ) ( AVAILABLE ?auto_14203 ) ( SURFACE-AT ?auto_14197 ?auto_14207 ) ( ON ?auto_14197 ?auto_14205 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14196 ?auto_14205 ) ) ( not ( = ?auto_14197 ?auto_14205 ) ) ( not ( = ?auto_14195 ?auto_14205 ) ) ( IS-CRATE ?auto_14196 ) ( not ( = ?auto_14199 ?auto_14204 ) ) ( not ( = ?auto_14207 ?auto_14199 ) ) ( HOIST-AT ?auto_14208 ?auto_14199 ) ( not ( = ?auto_14201 ?auto_14208 ) ) ( not ( = ?auto_14203 ?auto_14208 ) ) ( AVAILABLE ?auto_14208 ) ( SURFACE-AT ?auto_14196 ?auto_14199 ) ( ON ?auto_14196 ?auto_14206 ) ( CLEAR ?auto_14196 ) ( not ( = ?auto_14196 ?auto_14206 ) ) ( not ( = ?auto_14197 ?auto_14206 ) ) ( not ( = ?auto_14195 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( SURFACE-AT ?auto_14194 ?auto_14204 ) ( CLEAR ?auto_14194 ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14196 ?auto_14194 ) ) ( not ( = ?auto_14197 ?auto_14194 ) ) ( not ( = ?auto_14205 ?auto_14194 ) ) ( not ( = ?auto_14206 ?auto_14194 ) ) ( AVAILABLE ?auto_14201 ) ( TRUCK-AT ?auto_14200 ?auto_14198 ) ( not ( = ?auto_14198 ?auto_14204 ) ) ( not ( = ?auto_14207 ?auto_14198 ) ) ( not ( = ?auto_14199 ?auto_14198 ) ) ( HOIST-AT ?auto_14202 ?auto_14198 ) ( LIFTING ?auto_14202 ?auto_14195 ) ( not ( = ?auto_14201 ?auto_14202 ) ) ( not ( = ?auto_14203 ?auto_14202 ) ) ( not ( = ?auto_14208 ?auto_14202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14195 ?auto_14196 ?auto_14197 )
      ( MAKE-3CRATE-VERIFY ?auto_14194 ?auto_14195 ?auto_14196 ?auto_14197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14209 - SURFACE
      ?auto_14210 - SURFACE
    )
    :vars
    (
      ?auto_14215 - HOIST
      ?auto_14219 - PLACE
      ?auto_14211 - SURFACE
      ?auto_14222 - PLACE
      ?auto_14218 - HOIST
      ?auto_14220 - SURFACE
      ?auto_14213 - PLACE
      ?auto_14223 - HOIST
      ?auto_14221 - SURFACE
      ?auto_14216 - SURFACE
      ?auto_14214 - TRUCK
      ?auto_14212 - PLACE
      ?auto_14217 - HOIST
      ?auto_14224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14215 ?auto_14219 ) ( IS-CRATE ?auto_14210 ) ( not ( = ?auto_14209 ?auto_14210 ) ) ( not ( = ?auto_14211 ?auto_14209 ) ) ( not ( = ?auto_14211 ?auto_14210 ) ) ( not ( = ?auto_14222 ?auto_14219 ) ) ( HOIST-AT ?auto_14218 ?auto_14222 ) ( not ( = ?auto_14215 ?auto_14218 ) ) ( AVAILABLE ?auto_14218 ) ( SURFACE-AT ?auto_14210 ?auto_14222 ) ( ON ?auto_14210 ?auto_14220 ) ( CLEAR ?auto_14210 ) ( not ( = ?auto_14209 ?auto_14220 ) ) ( not ( = ?auto_14210 ?auto_14220 ) ) ( not ( = ?auto_14211 ?auto_14220 ) ) ( IS-CRATE ?auto_14209 ) ( not ( = ?auto_14213 ?auto_14219 ) ) ( not ( = ?auto_14222 ?auto_14213 ) ) ( HOIST-AT ?auto_14223 ?auto_14213 ) ( not ( = ?auto_14215 ?auto_14223 ) ) ( not ( = ?auto_14218 ?auto_14223 ) ) ( AVAILABLE ?auto_14223 ) ( SURFACE-AT ?auto_14209 ?auto_14213 ) ( ON ?auto_14209 ?auto_14221 ) ( CLEAR ?auto_14209 ) ( not ( = ?auto_14209 ?auto_14221 ) ) ( not ( = ?auto_14210 ?auto_14221 ) ) ( not ( = ?auto_14211 ?auto_14221 ) ) ( not ( = ?auto_14220 ?auto_14221 ) ) ( SURFACE-AT ?auto_14216 ?auto_14219 ) ( CLEAR ?auto_14216 ) ( IS-CRATE ?auto_14211 ) ( not ( = ?auto_14216 ?auto_14211 ) ) ( not ( = ?auto_14209 ?auto_14216 ) ) ( not ( = ?auto_14210 ?auto_14216 ) ) ( not ( = ?auto_14220 ?auto_14216 ) ) ( not ( = ?auto_14221 ?auto_14216 ) ) ( AVAILABLE ?auto_14215 ) ( TRUCK-AT ?auto_14214 ?auto_14212 ) ( not ( = ?auto_14212 ?auto_14219 ) ) ( not ( = ?auto_14222 ?auto_14212 ) ) ( not ( = ?auto_14213 ?auto_14212 ) ) ( HOIST-AT ?auto_14217 ?auto_14212 ) ( not ( = ?auto_14215 ?auto_14217 ) ) ( not ( = ?auto_14218 ?auto_14217 ) ) ( not ( = ?auto_14223 ?auto_14217 ) ) ( AVAILABLE ?auto_14217 ) ( SURFACE-AT ?auto_14211 ?auto_14212 ) ( ON ?auto_14211 ?auto_14224 ) ( CLEAR ?auto_14211 ) ( not ( = ?auto_14209 ?auto_14224 ) ) ( not ( = ?auto_14210 ?auto_14224 ) ) ( not ( = ?auto_14211 ?auto_14224 ) ) ( not ( = ?auto_14220 ?auto_14224 ) ) ( not ( = ?auto_14221 ?auto_14224 ) ) ( not ( = ?auto_14216 ?auto_14224 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14217 ?auto_14211 ?auto_14224 ?auto_14212 )
      ( MAKE-2CRATE ?auto_14211 ?auto_14209 ?auto_14210 )
      ( MAKE-1CRATE-VERIFY ?auto_14209 ?auto_14210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14225 - SURFACE
      ?auto_14226 - SURFACE
      ?auto_14227 - SURFACE
    )
    :vars
    (
      ?auto_14229 - HOIST
      ?auto_14240 - PLACE
      ?auto_14239 - PLACE
      ?auto_14237 - HOIST
      ?auto_14228 - SURFACE
      ?auto_14233 - PLACE
      ?auto_14236 - HOIST
      ?auto_14232 - SURFACE
      ?auto_14231 - SURFACE
      ?auto_14238 - TRUCK
      ?auto_14230 - PLACE
      ?auto_14235 - HOIST
      ?auto_14234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14229 ?auto_14240 ) ( IS-CRATE ?auto_14227 ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14227 ) ) ( not ( = ?auto_14239 ?auto_14240 ) ) ( HOIST-AT ?auto_14237 ?auto_14239 ) ( not ( = ?auto_14229 ?auto_14237 ) ) ( AVAILABLE ?auto_14237 ) ( SURFACE-AT ?auto_14227 ?auto_14239 ) ( ON ?auto_14227 ?auto_14228 ) ( CLEAR ?auto_14227 ) ( not ( = ?auto_14226 ?auto_14228 ) ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( not ( = ?auto_14225 ?auto_14228 ) ) ( IS-CRATE ?auto_14226 ) ( not ( = ?auto_14233 ?auto_14240 ) ) ( not ( = ?auto_14239 ?auto_14233 ) ) ( HOIST-AT ?auto_14236 ?auto_14233 ) ( not ( = ?auto_14229 ?auto_14236 ) ) ( not ( = ?auto_14237 ?auto_14236 ) ) ( AVAILABLE ?auto_14236 ) ( SURFACE-AT ?auto_14226 ?auto_14233 ) ( ON ?auto_14226 ?auto_14232 ) ( CLEAR ?auto_14226 ) ( not ( = ?auto_14226 ?auto_14232 ) ) ( not ( = ?auto_14227 ?auto_14232 ) ) ( not ( = ?auto_14225 ?auto_14232 ) ) ( not ( = ?auto_14228 ?auto_14232 ) ) ( SURFACE-AT ?auto_14231 ?auto_14240 ) ( CLEAR ?auto_14231 ) ( IS-CRATE ?auto_14225 ) ( not ( = ?auto_14231 ?auto_14225 ) ) ( not ( = ?auto_14226 ?auto_14231 ) ) ( not ( = ?auto_14227 ?auto_14231 ) ) ( not ( = ?auto_14228 ?auto_14231 ) ) ( not ( = ?auto_14232 ?auto_14231 ) ) ( AVAILABLE ?auto_14229 ) ( TRUCK-AT ?auto_14238 ?auto_14230 ) ( not ( = ?auto_14230 ?auto_14240 ) ) ( not ( = ?auto_14239 ?auto_14230 ) ) ( not ( = ?auto_14233 ?auto_14230 ) ) ( HOIST-AT ?auto_14235 ?auto_14230 ) ( not ( = ?auto_14229 ?auto_14235 ) ) ( not ( = ?auto_14237 ?auto_14235 ) ) ( not ( = ?auto_14236 ?auto_14235 ) ) ( AVAILABLE ?auto_14235 ) ( SURFACE-AT ?auto_14225 ?auto_14230 ) ( ON ?auto_14225 ?auto_14234 ) ( CLEAR ?auto_14225 ) ( not ( = ?auto_14226 ?auto_14234 ) ) ( not ( = ?auto_14227 ?auto_14234 ) ) ( not ( = ?auto_14225 ?auto_14234 ) ) ( not ( = ?auto_14228 ?auto_14234 ) ) ( not ( = ?auto_14232 ?auto_14234 ) ) ( not ( = ?auto_14231 ?auto_14234 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14226 ?auto_14227 )
      ( MAKE-2CRATE-VERIFY ?auto_14225 ?auto_14226 ?auto_14227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14241 - SURFACE
      ?auto_14242 - SURFACE
      ?auto_14243 - SURFACE
      ?auto_14244 - SURFACE
    )
    :vars
    (
      ?auto_14250 - HOIST
      ?auto_14245 - PLACE
      ?auto_14254 - PLACE
      ?auto_14248 - HOIST
      ?auto_14251 - SURFACE
      ?auto_14253 - PLACE
      ?auto_14255 - HOIST
      ?auto_14256 - SURFACE
      ?auto_14247 - TRUCK
      ?auto_14252 - PLACE
      ?auto_14246 - HOIST
      ?auto_14249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14250 ?auto_14245 ) ( IS-CRATE ?auto_14244 ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14254 ?auto_14245 ) ) ( HOIST-AT ?auto_14248 ?auto_14254 ) ( not ( = ?auto_14250 ?auto_14248 ) ) ( AVAILABLE ?auto_14248 ) ( SURFACE-AT ?auto_14244 ?auto_14254 ) ( ON ?auto_14244 ?auto_14251 ) ( CLEAR ?auto_14244 ) ( not ( = ?auto_14243 ?auto_14251 ) ) ( not ( = ?auto_14244 ?auto_14251 ) ) ( not ( = ?auto_14242 ?auto_14251 ) ) ( IS-CRATE ?auto_14243 ) ( not ( = ?auto_14253 ?auto_14245 ) ) ( not ( = ?auto_14254 ?auto_14253 ) ) ( HOIST-AT ?auto_14255 ?auto_14253 ) ( not ( = ?auto_14250 ?auto_14255 ) ) ( not ( = ?auto_14248 ?auto_14255 ) ) ( AVAILABLE ?auto_14255 ) ( SURFACE-AT ?auto_14243 ?auto_14253 ) ( ON ?auto_14243 ?auto_14256 ) ( CLEAR ?auto_14243 ) ( not ( = ?auto_14243 ?auto_14256 ) ) ( not ( = ?auto_14244 ?auto_14256 ) ) ( not ( = ?auto_14242 ?auto_14256 ) ) ( not ( = ?auto_14251 ?auto_14256 ) ) ( SURFACE-AT ?auto_14241 ?auto_14245 ) ( CLEAR ?auto_14241 ) ( IS-CRATE ?auto_14242 ) ( not ( = ?auto_14241 ?auto_14242 ) ) ( not ( = ?auto_14243 ?auto_14241 ) ) ( not ( = ?auto_14244 ?auto_14241 ) ) ( not ( = ?auto_14251 ?auto_14241 ) ) ( not ( = ?auto_14256 ?auto_14241 ) ) ( AVAILABLE ?auto_14250 ) ( TRUCK-AT ?auto_14247 ?auto_14252 ) ( not ( = ?auto_14252 ?auto_14245 ) ) ( not ( = ?auto_14254 ?auto_14252 ) ) ( not ( = ?auto_14253 ?auto_14252 ) ) ( HOIST-AT ?auto_14246 ?auto_14252 ) ( not ( = ?auto_14250 ?auto_14246 ) ) ( not ( = ?auto_14248 ?auto_14246 ) ) ( not ( = ?auto_14255 ?auto_14246 ) ) ( AVAILABLE ?auto_14246 ) ( SURFACE-AT ?auto_14242 ?auto_14252 ) ( ON ?auto_14242 ?auto_14249 ) ( CLEAR ?auto_14242 ) ( not ( = ?auto_14243 ?auto_14249 ) ) ( not ( = ?auto_14244 ?auto_14249 ) ) ( not ( = ?auto_14242 ?auto_14249 ) ) ( not ( = ?auto_14251 ?auto_14249 ) ) ( not ( = ?auto_14256 ?auto_14249 ) ) ( not ( = ?auto_14241 ?auto_14249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14242 ?auto_14243 ?auto_14244 )
      ( MAKE-3CRATE-VERIFY ?auto_14241 ?auto_14242 ?auto_14243 ?auto_14244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14257 - SURFACE
      ?auto_14258 - SURFACE
    )
    :vars
    (
      ?auto_14265 - HOIST
      ?auto_14259 - PLACE
      ?auto_14271 - SURFACE
      ?auto_14269 - PLACE
      ?auto_14262 - HOIST
      ?auto_14266 - SURFACE
      ?auto_14268 - PLACE
      ?auto_14270 - HOIST
      ?auto_14272 - SURFACE
      ?auto_14264 - SURFACE
      ?auto_14267 - PLACE
      ?auto_14260 - HOIST
      ?auto_14263 - SURFACE
      ?auto_14261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14265 ?auto_14259 ) ( IS-CRATE ?auto_14258 ) ( not ( = ?auto_14257 ?auto_14258 ) ) ( not ( = ?auto_14271 ?auto_14257 ) ) ( not ( = ?auto_14271 ?auto_14258 ) ) ( not ( = ?auto_14269 ?auto_14259 ) ) ( HOIST-AT ?auto_14262 ?auto_14269 ) ( not ( = ?auto_14265 ?auto_14262 ) ) ( AVAILABLE ?auto_14262 ) ( SURFACE-AT ?auto_14258 ?auto_14269 ) ( ON ?auto_14258 ?auto_14266 ) ( CLEAR ?auto_14258 ) ( not ( = ?auto_14257 ?auto_14266 ) ) ( not ( = ?auto_14258 ?auto_14266 ) ) ( not ( = ?auto_14271 ?auto_14266 ) ) ( IS-CRATE ?auto_14257 ) ( not ( = ?auto_14268 ?auto_14259 ) ) ( not ( = ?auto_14269 ?auto_14268 ) ) ( HOIST-AT ?auto_14270 ?auto_14268 ) ( not ( = ?auto_14265 ?auto_14270 ) ) ( not ( = ?auto_14262 ?auto_14270 ) ) ( AVAILABLE ?auto_14270 ) ( SURFACE-AT ?auto_14257 ?auto_14268 ) ( ON ?auto_14257 ?auto_14272 ) ( CLEAR ?auto_14257 ) ( not ( = ?auto_14257 ?auto_14272 ) ) ( not ( = ?auto_14258 ?auto_14272 ) ) ( not ( = ?auto_14271 ?auto_14272 ) ) ( not ( = ?auto_14266 ?auto_14272 ) ) ( SURFACE-AT ?auto_14264 ?auto_14259 ) ( CLEAR ?auto_14264 ) ( IS-CRATE ?auto_14271 ) ( not ( = ?auto_14264 ?auto_14271 ) ) ( not ( = ?auto_14257 ?auto_14264 ) ) ( not ( = ?auto_14258 ?auto_14264 ) ) ( not ( = ?auto_14266 ?auto_14264 ) ) ( not ( = ?auto_14272 ?auto_14264 ) ) ( AVAILABLE ?auto_14265 ) ( not ( = ?auto_14267 ?auto_14259 ) ) ( not ( = ?auto_14269 ?auto_14267 ) ) ( not ( = ?auto_14268 ?auto_14267 ) ) ( HOIST-AT ?auto_14260 ?auto_14267 ) ( not ( = ?auto_14265 ?auto_14260 ) ) ( not ( = ?auto_14262 ?auto_14260 ) ) ( not ( = ?auto_14270 ?auto_14260 ) ) ( AVAILABLE ?auto_14260 ) ( SURFACE-AT ?auto_14271 ?auto_14267 ) ( ON ?auto_14271 ?auto_14263 ) ( CLEAR ?auto_14271 ) ( not ( = ?auto_14257 ?auto_14263 ) ) ( not ( = ?auto_14258 ?auto_14263 ) ) ( not ( = ?auto_14271 ?auto_14263 ) ) ( not ( = ?auto_14266 ?auto_14263 ) ) ( not ( = ?auto_14272 ?auto_14263 ) ) ( not ( = ?auto_14264 ?auto_14263 ) ) ( TRUCK-AT ?auto_14261 ?auto_14259 ) )
    :subtasks
    ( ( !DRIVE ?auto_14261 ?auto_14259 ?auto_14267 )
      ( MAKE-2CRATE ?auto_14271 ?auto_14257 ?auto_14258 )
      ( MAKE-1CRATE-VERIFY ?auto_14257 ?auto_14258 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14273 - SURFACE
      ?auto_14274 - SURFACE
      ?auto_14275 - SURFACE
    )
    :vars
    (
      ?auto_14285 - HOIST
      ?auto_14276 - PLACE
      ?auto_14281 - PLACE
      ?auto_14284 - HOIST
      ?auto_14286 - SURFACE
      ?auto_14288 - PLACE
      ?auto_14283 - HOIST
      ?auto_14278 - SURFACE
      ?auto_14280 - SURFACE
      ?auto_14287 - PLACE
      ?auto_14279 - HOIST
      ?auto_14277 - SURFACE
      ?auto_14282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14285 ?auto_14276 ) ( IS-CRATE ?auto_14275 ) ( not ( = ?auto_14274 ?auto_14275 ) ) ( not ( = ?auto_14273 ?auto_14274 ) ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14281 ?auto_14276 ) ) ( HOIST-AT ?auto_14284 ?auto_14281 ) ( not ( = ?auto_14285 ?auto_14284 ) ) ( AVAILABLE ?auto_14284 ) ( SURFACE-AT ?auto_14275 ?auto_14281 ) ( ON ?auto_14275 ?auto_14286 ) ( CLEAR ?auto_14275 ) ( not ( = ?auto_14274 ?auto_14286 ) ) ( not ( = ?auto_14275 ?auto_14286 ) ) ( not ( = ?auto_14273 ?auto_14286 ) ) ( IS-CRATE ?auto_14274 ) ( not ( = ?auto_14288 ?auto_14276 ) ) ( not ( = ?auto_14281 ?auto_14288 ) ) ( HOIST-AT ?auto_14283 ?auto_14288 ) ( not ( = ?auto_14285 ?auto_14283 ) ) ( not ( = ?auto_14284 ?auto_14283 ) ) ( AVAILABLE ?auto_14283 ) ( SURFACE-AT ?auto_14274 ?auto_14288 ) ( ON ?auto_14274 ?auto_14278 ) ( CLEAR ?auto_14274 ) ( not ( = ?auto_14274 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14278 ) ) ( not ( = ?auto_14286 ?auto_14278 ) ) ( SURFACE-AT ?auto_14280 ?auto_14276 ) ( CLEAR ?auto_14280 ) ( IS-CRATE ?auto_14273 ) ( not ( = ?auto_14280 ?auto_14273 ) ) ( not ( = ?auto_14274 ?auto_14280 ) ) ( not ( = ?auto_14275 ?auto_14280 ) ) ( not ( = ?auto_14286 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( AVAILABLE ?auto_14285 ) ( not ( = ?auto_14287 ?auto_14276 ) ) ( not ( = ?auto_14281 ?auto_14287 ) ) ( not ( = ?auto_14288 ?auto_14287 ) ) ( HOIST-AT ?auto_14279 ?auto_14287 ) ( not ( = ?auto_14285 ?auto_14279 ) ) ( not ( = ?auto_14284 ?auto_14279 ) ) ( not ( = ?auto_14283 ?auto_14279 ) ) ( AVAILABLE ?auto_14279 ) ( SURFACE-AT ?auto_14273 ?auto_14287 ) ( ON ?auto_14273 ?auto_14277 ) ( CLEAR ?auto_14273 ) ( not ( = ?auto_14274 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14273 ?auto_14277 ) ) ( not ( = ?auto_14286 ?auto_14277 ) ) ( not ( = ?auto_14278 ?auto_14277 ) ) ( not ( = ?auto_14280 ?auto_14277 ) ) ( TRUCK-AT ?auto_14282 ?auto_14276 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14274 ?auto_14275 )
      ( MAKE-2CRATE-VERIFY ?auto_14273 ?auto_14274 ?auto_14275 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14289 - SURFACE
      ?auto_14290 - SURFACE
      ?auto_14291 - SURFACE
      ?auto_14292 - SURFACE
    )
    :vars
    (
      ?auto_14298 - HOIST
      ?auto_14299 - PLACE
      ?auto_14295 - PLACE
      ?auto_14296 - HOIST
      ?auto_14304 - SURFACE
      ?auto_14302 - PLACE
      ?auto_14297 - HOIST
      ?auto_14303 - SURFACE
      ?auto_14294 - PLACE
      ?auto_14301 - HOIST
      ?auto_14293 - SURFACE
      ?auto_14300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14298 ?auto_14299 ) ( IS-CRATE ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14292 ) ) ( not ( = ?auto_14290 ?auto_14291 ) ) ( not ( = ?auto_14290 ?auto_14292 ) ) ( not ( = ?auto_14295 ?auto_14299 ) ) ( HOIST-AT ?auto_14296 ?auto_14295 ) ( not ( = ?auto_14298 ?auto_14296 ) ) ( AVAILABLE ?auto_14296 ) ( SURFACE-AT ?auto_14292 ?auto_14295 ) ( ON ?auto_14292 ?auto_14304 ) ( CLEAR ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14304 ) ) ( not ( = ?auto_14292 ?auto_14304 ) ) ( not ( = ?auto_14290 ?auto_14304 ) ) ( IS-CRATE ?auto_14291 ) ( not ( = ?auto_14302 ?auto_14299 ) ) ( not ( = ?auto_14295 ?auto_14302 ) ) ( HOIST-AT ?auto_14297 ?auto_14302 ) ( not ( = ?auto_14298 ?auto_14297 ) ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( AVAILABLE ?auto_14297 ) ( SURFACE-AT ?auto_14291 ?auto_14302 ) ( ON ?auto_14291 ?auto_14303 ) ( CLEAR ?auto_14291 ) ( not ( = ?auto_14291 ?auto_14303 ) ) ( not ( = ?auto_14292 ?auto_14303 ) ) ( not ( = ?auto_14290 ?auto_14303 ) ) ( not ( = ?auto_14304 ?auto_14303 ) ) ( SURFACE-AT ?auto_14289 ?auto_14299 ) ( CLEAR ?auto_14289 ) ( IS-CRATE ?auto_14290 ) ( not ( = ?auto_14289 ?auto_14290 ) ) ( not ( = ?auto_14291 ?auto_14289 ) ) ( not ( = ?auto_14292 ?auto_14289 ) ) ( not ( = ?auto_14304 ?auto_14289 ) ) ( not ( = ?auto_14303 ?auto_14289 ) ) ( AVAILABLE ?auto_14298 ) ( not ( = ?auto_14294 ?auto_14299 ) ) ( not ( = ?auto_14295 ?auto_14294 ) ) ( not ( = ?auto_14302 ?auto_14294 ) ) ( HOIST-AT ?auto_14301 ?auto_14294 ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14296 ?auto_14301 ) ) ( not ( = ?auto_14297 ?auto_14301 ) ) ( AVAILABLE ?auto_14301 ) ( SURFACE-AT ?auto_14290 ?auto_14294 ) ( ON ?auto_14290 ?auto_14293 ) ( CLEAR ?auto_14290 ) ( not ( = ?auto_14291 ?auto_14293 ) ) ( not ( = ?auto_14292 ?auto_14293 ) ) ( not ( = ?auto_14290 ?auto_14293 ) ) ( not ( = ?auto_14304 ?auto_14293 ) ) ( not ( = ?auto_14303 ?auto_14293 ) ) ( not ( = ?auto_14289 ?auto_14293 ) ) ( TRUCK-AT ?auto_14300 ?auto_14299 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14290 ?auto_14291 ?auto_14292 )
      ( MAKE-3CRATE-VERIFY ?auto_14289 ?auto_14290 ?auto_14291 ?auto_14292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14319 - SURFACE
      ?auto_14320 - SURFACE
    )
    :vars
    (
      ?auto_14321 - HOIST
      ?auto_14322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14321 ?auto_14322 ) ( SURFACE-AT ?auto_14319 ?auto_14322 ) ( CLEAR ?auto_14319 ) ( LIFTING ?auto_14321 ?auto_14320 ) ( IS-CRATE ?auto_14320 ) ( not ( = ?auto_14319 ?auto_14320 ) ) )
    :subtasks
    ( ( !DROP ?auto_14321 ?auto_14320 ?auto_14319 ?auto_14322 )
      ( MAKE-1CRATE-VERIFY ?auto_14319 ?auto_14320 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14323 - SURFACE
      ?auto_14324 - SURFACE
      ?auto_14325 - SURFACE
    )
    :vars
    (
      ?auto_14327 - HOIST
      ?auto_14326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14327 ?auto_14326 ) ( SURFACE-AT ?auto_14324 ?auto_14326 ) ( CLEAR ?auto_14324 ) ( LIFTING ?auto_14327 ?auto_14325 ) ( IS-CRATE ?auto_14325 ) ( not ( = ?auto_14324 ?auto_14325 ) ) ( ON ?auto_14324 ?auto_14323 ) ( not ( = ?auto_14323 ?auto_14324 ) ) ( not ( = ?auto_14323 ?auto_14325 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14324 ?auto_14325 )
      ( MAKE-2CRATE-VERIFY ?auto_14323 ?auto_14324 ?auto_14325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
      ?auto_14330 - SURFACE
      ?auto_14331 - SURFACE
    )
    :vars
    (
      ?auto_14333 - HOIST
      ?auto_14332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14333 ?auto_14332 ) ( SURFACE-AT ?auto_14330 ?auto_14332 ) ( CLEAR ?auto_14330 ) ( LIFTING ?auto_14333 ?auto_14331 ) ( IS-CRATE ?auto_14331 ) ( not ( = ?auto_14330 ?auto_14331 ) ) ( ON ?auto_14329 ?auto_14328 ) ( ON ?auto_14330 ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14330 ?auto_14331 )
      ( MAKE-3CRATE-VERIFY ?auto_14328 ?auto_14329 ?auto_14330 ?auto_14331 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14334 - SURFACE
      ?auto_14335 - SURFACE
      ?auto_14336 - SURFACE
      ?auto_14337 - SURFACE
      ?auto_14338 - SURFACE
    )
    :vars
    (
      ?auto_14340 - HOIST
      ?auto_14339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14340 ?auto_14339 ) ( SURFACE-AT ?auto_14337 ?auto_14339 ) ( CLEAR ?auto_14337 ) ( LIFTING ?auto_14340 ?auto_14338 ) ( IS-CRATE ?auto_14338 ) ( not ( = ?auto_14337 ?auto_14338 ) ) ( ON ?auto_14335 ?auto_14334 ) ( ON ?auto_14336 ?auto_14335 ) ( ON ?auto_14337 ?auto_14336 ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14336 ) ) ( not ( = ?auto_14334 ?auto_14337 ) ) ( not ( = ?auto_14334 ?auto_14338 ) ) ( not ( = ?auto_14335 ?auto_14336 ) ) ( not ( = ?auto_14335 ?auto_14337 ) ) ( not ( = ?auto_14335 ?auto_14338 ) ) ( not ( = ?auto_14336 ?auto_14337 ) ) ( not ( = ?auto_14336 ?auto_14338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14337 ?auto_14338 )
      ( MAKE-4CRATE-VERIFY ?auto_14334 ?auto_14335 ?auto_14336 ?auto_14337 ?auto_14338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14341 - SURFACE
      ?auto_14342 - SURFACE
    )
    :vars
    (
      ?auto_14344 - HOIST
      ?auto_14343 - PLACE
      ?auto_14345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14344 ?auto_14343 ) ( SURFACE-AT ?auto_14341 ?auto_14343 ) ( CLEAR ?auto_14341 ) ( IS-CRATE ?auto_14342 ) ( not ( = ?auto_14341 ?auto_14342 ) ) ( TRUCK-AT ?auto_14345 ?auto_14343 ) ( AVAILABLE ?auto_14344 ) ( IN ?auto_14342 ?auto_14345 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14344 ?auto_14342 ?auto_14345 ?auto_14343 )
      ( MAKE-1CRATE ?auto_14341 ?auto_14342 )
      ( MAKE-1CRATE-VERIFY ?auto_14341 ?auto_14342 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14346 - SURFACE
      ?auto_14347 - SURFACE
      ?auto_14348 - SURFACE
    )
    :vars
    (
      ?auto_14351 - HOIST
      ?auto_14350 - PLACE
      ?auto_14349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14351 ?auto_14350 ) ( SURFACE-AT ?auto_14347 ?auto_14350 ) ( CLEAR ?auto_14347 ) ( IS-CRATE ?auto_14348 ) ( not ( = ?auto_14347 ?auto_14348 ) ) ( TRUCK-AT ?auto_14349 ?auto_14350 ) ( AVAILABLE ?auto_14351 ) ( IN ?auto_14348 ?auto_14349 ) ( ON ?auto_14347 ?auto_14346 ) ( not ( = ?auto_14346 ?auto_14347 ) ) ( not ( = ?auto_14346 ?auto_14348 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14347 ?auto_14348 )
      ( MAKE-2CRATE-VERIFY ?auto_14346 ?auto_14347 ?auto_14348 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14352 - SURFACE
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
      ?auto_14355 - SURFACE
    )
    :vars
    (
      ?auto_14356 - HOIST
      ?auto_14357 - PLACE
      ?auto_14358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14356 ?auto_14357 ) ( SURFACE-AT ?auto_14354 ?auto_14357 ) ( CLEAR ?auto_14354 ) ( IS-CRATE ?auto_14355 ) ( not ( = ?auto_14354 ?auto_14355 ) ) ( TRUCK-AT ?auto_14358 ?auto_14357 ) ( AVAILABLE ?auto_14356 ) ( IN ?auto_14355 ?auto_14358 ) ( ON ?auto_14354 ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( ON ?auto_14353 ?auto_14352 ) ( not ( = ?auto_14352 ?auto_14353 ) ) ( not ( = ?auto_14352 ?auto_14354 ) ) ( not ( = ?auto_14352 ?auto_14355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14353 ?auto_14354 ?auto_14355 )
      ( MAKE-3CRATE-VERIFY ?auto_14352 ?auto_14353 ?auto_14354 ?auto_14355 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14359 - SURFACE
      ?auto_14360 - SURFACE
      ?auto_14361 - SURFACE
      ?auto_14362 - SURFACE
      ?auto_14363 - SURFACE
    )
    :vars
    (
      ?auto_14364 - HOIST
      ?auto_14365 - PLACE
      ?auto_14366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14364 ?auto_14365 ) ( SURFACE-AT ?auto_14362 ?auto_14365 ) ( CLEAR ?auto_14362 ) ( IS-CRATE ?auto_14363 ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( TRUCK-AT ?auto_14366 ?auto_14365 ) ( AVAILABLE ?auto_14364 ) ( IN ?auto_14363 ?auto_14366 ) ( ON ?auto_14362 ?auto_14361 ) ( not ( = ?auto_14361 ?auto_14362 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( ON ?auto_14360 ?auto_14359 ) ( ON ?auto_14361 ?auto_14360 ) ( not ( = ?auto_14359 ?auto_14360 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14362 ) ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14360 ?auto_14363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14361 ?auto_14362 ?auto_14363 )
      ( MAKE-4CRATE-VERIFY ?auto_14359 ?auto_14360 ?auto_14361 ?auto_14362 ?auto_14363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14367 - SURFACE
      ?auto_14368 - SURFACE
    )
    :vars
    (
      ?auto_14370 - HOIST
      ?auto_14371 - PLACE
      ?auto_14372 - TRUCK
      ?auto_14369 - SURFACE
      ?auto_14373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14370 ?auto_14371 ) ( SURFACE-AT ?auto_14367 ?auto_14371 ) ( CLEAR ?auto_14367 ) ( IS-CRATE ?auto_14368 ) ( not ( = ?auto_14367 ?auto_14368 ) ) ( AVAILABLE ?auto_14370 ) ( IN ?auto_14368 ?auto_14372 ) ( ON ?auto_14367 ?auto_14369 ) ( not ( = ?auto_14369 ?auto_14367 ) ) ( not ( = ?auto_14369 ?auto_14368 ) ) ( TRUCK-AT ?auto_14372 ?auto_14373 ) ( not ( = ?auto_14373 ?auto_14371 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14372 ?auto_14373 ?auto_14371 )
      ( MAKE-2CRATE ?auto_14369 ?auto_14367 ?auto_14368 )
      ( MAKE-1CRATE-VERIFY ?auto_14367 ?auto_14368 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14374 - SURFACE
      ?auto_14375 - SURFACE
      ?auto_14376 - SURFACE
    )
    :vars
    (
      ?auto_14379 - HOIST
      ?auto_14377 - PLACE
      ?auto_14380 - TRUCK
      ?auto_14378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14379 ?auto_14377 ) ( SURFACE-AT ?auto_14375 ?auto_14377 ) ( CLEAR ?auto_14375 ) ( IS-CRATE ?auto_14376 ) ( not ( = ?auto_14375 ?auto_14376 ) ) ( AVAILABLE ?auto_14379 ) ( IN ?auto_14376 ?auto_14380 ) ( ON ?auto_14375 ?auto_14374 ) ( not ( = ?auto_14374 ?auto_14375 ) ) ( not ( = ?auto_14374 ?auto_14376 ) ) ( TRUCK-AT ?auto_14380 ?auto_14378 ) ( not ( = ?auto_14378 ?auto_14377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14375 ?auto_14376 )
      ( MAKE-2CRATE-VERIFY ?auto_14374 ?auto_14375 ?auto_14376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14381 - SURFACE
      ?auto_14382 - SURFACE
      ?auto_14383 - SURFACE
      ?auto_14384 - SURFACE
    )
    :vars
    (
      ?auto_14385 - HOIST
      ?auto_14386 - PLACE
      ?auto_14387 - TRUCK
      ?auto_14388 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14385 ?auto_14386 ) ( SURFACE-AT ?auto_14383 ?auto_14386 ) ( CLEAR ?auto_14383 ) ( IS-CRATE ?auto_14384 ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( AVAILABLE ?auto_14385 ) ( IN ?auto_14384 ?auto_14387 ) ( ON ?auto_14383 ?auto_14382 ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14382 ?auto_14384 ) ) ( TRUCK-AT ?auto_14387 ?auto_14388 ) ( not ( = ?auto_14388 ?auto_14386 ) ) ( ON ?auto_14382 ?auto_14381 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14382 ?auto_14383 ?auto_14384 )
      ( MAKE-3CRATE-VERIFY ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14389 - SURFACE
      ?auto_14390 - SURFACE
      ?auto_14391 - SURFACE
      ?auto_14392 - SURFACE
      ?auto_14393 - SURFACE
    )
    :vars
    (
      ?auto_14394 - HOIST
      ?auto_14395 - PLACE
      ?auto_14396 - TRUCK
      ?auto_14397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14394 ?auto_14395 ) ( SURFACE-AT ?auto_14392 ?auto_14395 ) ( CLEAR ?auto_14392 ) ( IS-CRATE ?auto_14393 ) ( not ( = ?auto_14392 ?auto_14393 ) ) ( AVAILABLE ?auto_14394 ) ( IN ?auto_14393 ?auto_14396 ) ( ON ?auto_14392 ?auto_14391 ) ( not ( = ?auto_14391 ?auto_14392 ) ) ( not ( = ?auto_14391 ?auto_14393 ) ) ( TRUCK-AT ?auto_14396 ?auto_14397 ) ( not ( = ?auto_14397 ?auto_14395 ) ) ( ON ?auto_14390 ?auto_14389 ) ( ON ?auto_14391 ?auto_14390 ) ( not ( = ?auto_14389 ?auto_14390 ) ) ( not ( = ?auto_14389 ?auto_14391 ) ) ( not ( = ?auto_14389 ?auto_14392 ) ) ( not ( = ?auto_14389 ?auto_14393 ) ) ( not ( = ?auto_14390 ?auto_14391 ) ) ( not ( = ?auto_14390 ?auto_14392 ) ) ( not ( = ?auto_14390 ?auto_14393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14391 ?auto_14392 ?auto_14393 )
      ( MAKE-4CRATE-VERIFY ?auto_14389 ?auto_14390 ?auto_14391 ?auto_14392 ?auto_14393 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14398 - SURFACE
      ?auto_14399 - SURFACE
    )
    :vars
    (
      ?auto_14400 - HOIST
      ?auto_14402 - PLACE
      ?auto_14401 - SURFACE
      ?auto_14403 - TRUCK
      ?auto_14404 - PLACE
      ?auto_14405 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14400 ?auto_14402 ) ( SURFACE-AT ?auto_14398 ?auto_14402 ) ( CLEAR ?auto_14398 ) ( IS-CRATE ?auto_14399 ) ( not ( = ?auto_14398 ?auto_14399 ) ) ( AVAILABLE ?auto_14400 ) ( ON ?auto_14398 ?auto_14401 ) ( not ( = ?auto_14401 ?auto_14398 ) ) ( not ( = ?auto_14401 ?auto_14399 ) ) ( TRUCK-AT ?auto_14403 ?auto_14404 ) ( not ( = ?auto_14404 ?auto_14402 ) ) ( HOIST-AT ?auto_14405 ?auto_14404 ) ( LIFTING ?auto_14405 ?auto_14399 ) ( not ( = ?auto_14400 ?auto_14405 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14405 ?auto_14399 ?auto_14403 ?auto_14404 )
      ( MAKE-2CRATE ?auto_14401 ?auto_14398 ?auto_14399 )
      ( MAKE-1CRATE-VERIFY ?auto_14398 ?auto_14399 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14406 - SURFACE
      ?auto_14407 - SURFACE
      ?auto_14408 - SURFACE
    )
    :vars
    (
      ?auto_14409 - HOIST
      ?auto_14411 - PLACE
      ?auto_14410 - TRUCK
      ?auto_14413 - PLACE
      ?auto_14412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14409 ?auto_14411 ) ( SURFACE-AT ?auto_14407 ?auto_14411 ) ( CLEAR ?auto_14407 ) ( IS-CRATE ?auto_14408 ) ( not ( = ?auto_14407 ?auto_14408 ) ) ( AVAILABLE ?auto_14409 ) ( ON ?auto_14407 ?auto_14406 ) ( not ( = ?auto_14406 ?auto_14407 ) ) ( not ( = ?auto_14406 ?auto_14408 ) ) ( TRUCK-AT ?auto_14410 ?auto_14413 ) ( not ( = ?auto_14413 ?auto_14411 ) ) ( HOIST-AT ?auto_14412 ?auto_14413 ) ( LIFTING ?auto_14412 ?auto_14408 ) ( not ( = ?auto_14409 ?auto_14412 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14407 ?auto_14408 )
      ( MAKE-2CRATE-VERIFY ?auto_14406 ?auto_14407 ?auto_14408 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14414 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14417 - SURFACE
    )
    :vars
    (
      ?auto_14422 - HOIST
      ?auto_14419 - PLACE
      ?auto_14418 - TRUCK
      ?auto_14421 - PLACE
      ?auto_14420 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14422 ?auto_14419 ) ( SURFACE-AT ?auto_14416 ?auto_14419 ) ( CLEAR ?auto_14416 ) ( IS-CRATE ?auto_14417 ) ( not ( = ?auto_14416 ?auto_14417 ) ) ( AVAILABLE ?auto_14422 ) ( ON ?auto_14416 ?auto_14415 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( TRUCK-AT ?auto_14418 ?auto_14421 ) ( not ( = ?auto_14421 ?auto_14419 ) ) ( HOIST-AT ?auto_14420 ?auto_14421 ) ( LIFTING ?auto_14420 ?auto_14417 ) ( not ( = ?auto_14422 ?auto_14420 ) ) ( ON ?auto_14415 ?auto_14414 ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14415 ?auto_14416 ?auto_14417 )
      ( MAKE-3CRATE-VERIFY ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14423 - SURFACE
      ?auto_14424 - SURFACE
      ?auto_14425 - SURFACE
      ?auto_14426 - SURFACE
      ?auto_14427 - SURFACE
    )
    :vars
    (
      ?auto_14432 - HOIST
      ?auto_14429 - PLACE
      ?auto_14428 - TRUCK
      ?auto_14431 - PLACE
      ?auto_14430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14432 ?auto_14429 ) ( SURFACE-AT ?auto_14426 ?auto_14429 ) ( CLEAR ?auto_14426 ) ( IS-CRATE ?auto_14427 ) ( not ( = ?auto_14426 ?auto_14427 ) ) ( AVAILABLE ?auto_14432 ) ( ON ?auto_14426 ?auto_14425 ) ( not ( = ?auto_14425 ?auto_14426 ) ) ( not ( = ?auto_14425 ?auto_14427 ) ) ( TRUCK-AT ?auto_14428 ?auto_14431 ) ( not ( = ?auto_14431 ?auto_14429 ) ) ( HOIST-AT ?auto_14430 ?auto_14431 ) ( LIFTING ?auto_14430 ?auto_14427 ) ( not ( = ?auto_14432 ?auto_14430 ) ) ( ON ?auto_14424 ?auto_14423 ) ( ON ?auto_14425 ?auto_14424 ) ( not ( = ?auto_14423 ?auto_14424 ) ) ( not ( = ?auto_14423 ?auto_14425 ) ) ( not ( = ?auto_14423 ?auto_14426 ) ) ( not ( = ?auto_14423 ?auto_14427 ) ) ( not ( = ?auto_14424 ?auto_14425 ) ) ( not ( = ?auto_14424 ?auto_14426 ) ) ( not ( = ?auto_14424 ?auto_14427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14425 ?auto_14426 ?auto_14427 )
      ( MAKE-4CRATE-VERIFY ?auto_14423 ?auto_14424 ?auto_14425 ?auto_14426 ?auto_14427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14433 - SURFACE
      ?auto_14434 - SURFACE
    )
    :vars
    (
      ?auto_14440 - HOIST
      ?auto_14437 - PLACE
      ?auto_14436 - SURFACE
      ?auto_14435 - TRUCK
      ?auto_14439 - PLACE
      ?auto_14438 - HOIST
      ?auto_14441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14440 ?auto_14437 ) ( SURFACE-AT ?auto_14433 ?auto_14437 ) ( CLEAR ?auto_14433 ) ( IS-CRATE ?auto_14434 ) ( not ( = ?auto_14433 ?auto_14434 ) ) ( AVAILABLE ?auto_14440 ) ( ON ?auto_14433 ?auto_14436 ) ( not ( = ?auto_14436 ?auto_14433 ) ) ( not ( = ?auto_14436 ?auto_14434 ) ) ( TRUCK-AT ?auto_14435 ?auto_14439 ) ( not ( = ?auto_14439 ?auto_14437 ) ) ( HOIST-AT ?auto_14438 ?auto_14439 ) ( not ( = ?auto_14440 ?auto_14438 ) ) ( AVAILABLE ?auto_14438 ) ( SURFACE-AT ?auto_14434 ?auto_14439 ) ( ON ?auto_14434 ?auto_14441 ) ( CLEAR ?auto_14434 ) ( not ( = ?auto_14433 ?auto_14441 ) ) ( not ( = ?auto_14434 ?auto_14441 ) ) ( not ( = ?auto_14436 ?auto_14441 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14438 ?auto_14434 ?auto_14441 ?auto_14439 )
      ( MAKE-2CRATE ?auto_14436 ?auto_14433 ?auto_14434 )
      ( MAKE-1CRATE-VERIFY ?auto_14433 ?auto_14434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14442 - SURFACE
      ?auto_14443 - SURFACE
      ?auto_14444 - SURFACE
    )
    :vars
    (
      ?auto_14448 - HOIST
      ?auto_14446 - PLACE
      ?auto_14449 - TRUCK
      ?auto_14445 - PLACE
      ?auto_14450 - HOIST
      ?auto_14447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14448 ?auto_14446 ) ( SURFACE-AT ?auto_14443 ?auto_14446 ) ( CLEAR ?auto_14443 ) ( IS-CRATE ?auto_14444 ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( AVAILABLE ?auto_14448 ) ( ON ?auto_14443 ?auto_14442 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( TRUCK-AT ?auto_14449 ?auto_14445 ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( HOIST-AT ?auto_14450 ?auto_14445 ) ( not ( = ?auto_14448 ?auto_14450 ) ) ( AVAILABLE ?auto_14450 ) ( SURFACE-AT ?auto_14444 ?auto_14445 ) ( ON ?auto_14444 ?auto_14447 ) ( CLEAR ?auto_14444 ) ( not ( = ?auto_14443 ?auto_14447 ) ) ( not ( = ?auto_14444 ?auto_14447 ) ) ( not ( = ?auto_14442 ?auto_14447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14443 ?auto_14444 )
      ( MAKE-2CRATE-VERIFY ?auto_14442 ?auto_14443 ?auto_14444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14451 - SURFACE
      ?auto_14452 - SURFACE
      ?auto_14453 - SURFACE
      ?auto_14454 - SURFACE
    )
    :vars
    (
      ?auto_14456 - HOIST
      ?auto_14455 - PLACE
      ?auto_14457 - TRUCK
      ?auto_14458 - PLACE
      ?auto_14460 - HOIST
      ?auto_14459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14456 ?auto_14455 ) ( SURFACE-AT ?auto_14453 ?auto_14455 ) ( CLEAR ?auto_14453 ) ( IS-CRATE ?auto_14454 ) ( not ( = ?auto_14453 ?auto_14454 ) ) ( AVAILABLE ?auto_14456 ) ( ON ?auto_14453 ?auto_14452 ) ( not ( = ?auto_14452 ?auto_14453 ) ) ( not ( = ?auto_14452 ?auto_14454 ) ) ( TRUCK-AT ?auto_14457 ?auto_14458 ) ( not ( = ?auto_14458 ?auto_14455 ) ) ( HOIST-AT ?auto_14460 ?auto_14458 ) ( not ( = ?auto_14456 ?auto_14460 ) ) ( AVAILABLE ?auto_14460 ) ( SURFACE-AT ?auto_14454 ?auto_14458 ) ( ON ?auto_14454 ?auto_14459 ) ( CLEAR ?auto_14454 ) ( not ( = ?auto_14453 ?auto_14459 ) ) ( not ( = ?auto_14454 ?auto_14459 ) ) ( not ( = ?auto_14452 ?auto_14459 ) ) ( ON ?auto_14452 ?auto_14451 ) ( not ( = ?auto_14451 ?auto_14452 ) ) ( not ( = ?auto_14451 ?auto_14453 ) ) ( not ( = ?auto_14451 ?auto_14454 ) ) ( not ( = ?auto_14451 ?auto_14459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14452 ?auto_14453 ?auto_14454 )
      ( MAKE-3CRATE-VERIFY ?auto_14451 ?auto_14452 ?auto_14453 ?auto_14454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14461 - SURFACE
      ?auto_14462 - SURFACE
      ?auto_14463 - SURFACE
      ?auto_14464 - SURFACE
      ?auto_14465 - SURFACE
    )
    :vars
    (
      ?auto_14467 - HOIST
      ?auto_14466 - PLACE
      ?auto_14468 - TRUCK
      ?auto_14469 - PLACE
      ?auto_14471 - HOIST
      ?auto_14470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14467 ?auto_14466 ) ( SURFACE-AT ?auto_14464 ?auto_14466 ) ( CLEAR ?auto_14464 ) ( IS-CRATE ?auto_14465 ) ( not ( = ?auto_14464 ?auto_14465 ) ) ( AVAILABLE ?auto_14467 ) ( ON ?auto_14464 ?auto_14463 ) ( not ( = ?auto_14463 ?auto_14464 ) ) ( not ( = ?auto_14463 ?auto_14465 ) ) ( TRUCK-AT ?auto_14468 ?auto_14469 ) ( not ( = ?auto_14469 ?auto_14466 ) ) ( HOIST-AT ?auto_14471 ?auto_14469 ) ( not ( = ?auto_14467 ?auto_14471 ) ) ( AVAILABLE ?auto_14471 ) ( SURFACE-AT ?auto_14465 ?auto_14469 ) ( ON ?auto_14465 ?auto_14470 ) ( CLEAR ?auto_14465 ) ( not ( = ?auto_14464 ?auto_14470 ) ) ( not ( = ?auto_14465 ?auto_14470 ) ) ( not ( = ?auto_14463 ?auto_14470 ) ) ( ON ?auto_14462 ?auto_14461 ) ( ON ?auto_14463 ?auto_14462 ) ( not ( = ?auto_14461 ?auto_14462 ) ) ( not ( = ?auto_14461 ?auto_14463 ) ) ( not ( = ?auto_14461 ?auto_14464 ) ) ( not ( = ?auto_14461 ?auto_14465 ) ) ( not ( = ?auto_14461 ?auto_14470 ) ) ( not ( = ?auto_14462 ?auto_14463 ) ) ( not ( = ?auto_14462 ?auto_14464 ) ) ( not ( = ?auto_14462 ?auto_14465 ) ) ( not ( = ?auto_14462 ?auto_14470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14463 ?auto_14464 ?auto_14465 )
      ( MAKE-4CRATE-VERIFY ?auto_14461 ?auto_14462 ?auto_14463 ?auto_14464 ?auto_14465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14472 - SURFACE
      ?auto_14473 - SURFACE
    )
    :vars
    (
      ?auto_14475 - HOIST
      ?auto_14474 - PLACE
      ?auto_14480 - SURFACE
      ?auto_14477 - PLACE
      ?auto_14479 - HOIST
      ?auto_14478 - SURFACE
      ?auto_14476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14475 ?auto_14474 ) ( SURFACE-AT ?auto_14472 ?auto_14474 ) ( CLEAR ?auto_14472 ) ( IS-CRATE ?auto_14473 ) ( not ( = ?auto_14472 ?auto_14473 ) ) ( AVAILABLE ?auto_14475 ) ( ON ?auto_14472 ?auto_14480 ) ( not ( = ?auto_14480 ?auto_14472 ) ) ( not ( = ?auto_14480 ?auto_14473 ) ) ( not ( = ?auto_14477 ?auto_14474 ) ) ( HOIST-AT ?auto_14479 ?auto_14477 ) ( not ( = ?auto_14475 ?auto_14479 ) ) ( AVAILABLE ?auto_14479 ) ( SURFACE-AT ?auto_14473 ?auto_14477 ) ( ON ?auto_14473 ?auto_14478 ) ( CLEAR ?auto_14473 ) ( not ( = ?auto_14472 ?auto_14478 ) ) ( not ( = ?auto_14473 ?auto_14478 ) ) ( not ( = ?auto_14480 ?auto_14478 ) ) ( TRUCK-AT ?auto_14476 ?auto_14474 ) )
    :subtasks
    ( ( !DRIVE ?auto_14476 ?auto_14474 ?auto_14477 )
      ( MAKE-2CRATE ?auto_14480 ?auto_14472 ?auto_14473 )
      ( MAKE-1CRATE-VERIFY ?auto_14472 ?auto_14473 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
      ?auto_14483 - SURFACE
    )
    :vars
    (
      ?auto_14486 - HOIST
      ?auto_14487 - PLACE
      ?auto_14489 - PLACE
      ?auto_14484 - HOIST
      ?auto_14488 - SURFACE
      ?auto_14485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14486 ?auto_14487 ) ( SURFACE-AT ?auto_14482 ?auto_14487 ) ( CLEAR ?auto_14482 ) ( IS-CRATE ?auto_14483 ) ( not ( = ?auto_14482 ?auto_14483 ) ) ( AVAILABLE ?auto_14486 ) ( ON ?auto_14482 ?auto_14481 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14483 ) ) ( not ( = ?auto_14489 ?auto_14487 ) ) ( HOIST-AT ?auto_14484 ?auto_14489 ) ( not ( = ?auto_14486 ?auto_14484 ) ) ( AVAILABLE ?auto_14484 ) ( SURFACE-AT ?auto_14483 ?auto_14489 ) ( ON ?auto_14483 ?auto_14488 ) ( CLEAR ?auto_14483 ) ( not ( = ?auto_14482 ?auto_14488 ) ) ( not ( = ?auto_14483 ?auto_14488 ) ) ( not ( = ?auto_14481 ?auto_14488 ) ) ( TRUCK-AT ?auto_14485 ?auto_14487 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14482 ?auto_14483 )
      ( MAKE-2CRATE-VERIFY ?auto_14481 ?auto_14482 ?auto_14483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14490 - SURFACE
      ?auto_14491 - SURFACE
      ?auto_14492 - SURFACE
      ?auto_14493 - SURFACE
    )
    :vars
    (
      ?auto_14498 - HOIST
      ?auto_14494 - PLACE
      ?auto_14496 - PLACE
      ?auto_14497 - HOIST
      ?auto_14499 - SURFACE
      ?auto_14495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14498 ?auto_14494 ) ( SURFACE-AT ?auto_14492 ?auto_14494 ) ( CLEAR ?auto_14492 ) ( IS-CRATE ?auto_14493 ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( AVAILABLE ?auto_14498 ) ( ON ?auto_14492 ?auto_14491 ) ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( not ( = ?auto_14496 ?auto_14494 ) ) ( HOIST-AT ?auto_14497 ?auto_14496 ) ( not ( = ?auto_14498 ?auto_14497 ) ) ( AVAILABLE ?auto_14497 ) ( SURFACE-AT ?auto_14493 ?auto_14496 ) ( ON ?auto_14493 ?auto_14499 ) ( CLEAR ?auto_14493 ) ( not ( = ?auto_14492 ?auto_14499 ) ) ( not ( = ?auto_14493 ?auto_14499 ) ) ( not ( = ?auto_14491 ?auto_14499 ) ) ( TRUCK-AT ?auto_14495 ?auto_14494 ) ( ON ?auto_14491 ?auto_14490 ) ( not ( = ?auto_14490 ?auto_14491 ) ) ( not ( = ?auto_14490 ?auto_14492 ) ) ( not ( = ?auto_14490 ?auto_14493 ) ) ( not ( = ?auto_14490 ?auto_14499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14491 ?auto_14492 ?auto_14493 )
      ( MAKE-3CRATE-VERIFY ?auto_14490 ?auto_14491 ?auto_14492 ?auto_14493 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14500 - SURFACE
      ?auto_14501 - SURFACE
      ?auto_14502 - SURFACE
      ?auto_14503 - SURFACE
      ?auto_14504 - SURFACE
    )
    :vars
    (
      ?auto_14509 - HOIST
      ?auto_14505 - PLACE
      ?auto_14507 - PLACE
      ?auto_14508 - HOIST
      ?auto_14510 - SURFACE
      ?auto_14506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14509 ?auto_14505 ) ( SURFACE-AT ?auto_14503 ?auto_14505 ) ( CLEAR ?auto_14503 ) ( IS-CRATE ?auto_14504 ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( AVAILABLE ?auto_14509 ) ( ON ?auto_14503 ?auto_14502 ) ( not ( = ?auto_14502 ?auto_14503 ) ) ( not ( = ?auto_14502 ?auto_14504 ) ) ( not ( = ?auto_14507 ?auto_14505 ) ) ( HOIST-AT ?auto_14508 ?auto_14507 ) ( not ( = ?auto_14509 ?auto_14508 ) ) ( AVAILABLE ?auto_14508 ) ( SURFACE-AT ?auto_14504 ?auto_14507 ) ( ON ?auto_14504 ?auto_14510 ) ( CLEAR ?auto_14504 ) ( not ( = ?auto_14503 ?auto_14510 ) ) ( not ( = ?auto_14504 ?auto_14510 ) ) ( not ( = ?auto_14502 ?auto_14510 ) ) ( TRUCK-AT ?auto_14506 ?auto_14505 ) ( ON ?auto_14501 ?auto_14500 ) ( ON ?auto_14502 ?auto_14501 ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( not ( = ?auto_14500 ?auto_14503 ) ) ( not ( = ?auto_14500 ?auto_14504 ) ) ( not ( = ?auto_14500 ?auto_14510 ) ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( not ( = ?auto_14501 ?auto_14503 ) ) ( not ( = ?auto_14501 ?auto_14504 ) ) ( not ( = ?auto_14501 ?auto_14510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14502 ?auto_14503 ?auto_14504 )
      ( MAKE-4CRATE-VERIFY ?auto_14500 ?auto_14501 ?auto_14502 ?auto_14503 ?auto_14504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14511 - SURFACE
      ?auto_14512 - SURFACE
    )
    :vars
    (
      ?auto_14518 - HOIST
      ?auto_14513 - PLACE
      ?auto_14514 - SURFACE
      ?auto_14516 - PLACE
      ?auto_14517 - HOIST
      ?auto_14519 - SURFACE
      ?auto_14515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14518 ?auto_14513 ) ( IS-CRATE ?auto_14512 ) ( not ( = ?auto_14511 ?auto_14512 ) ) ( not ( = ?auto_14514 ?auto_14511 ) ) ( not ( = ?auto_14514 ?auto_14512 ) ) ( not ( = ?auto_14516 ?auto_14513 ) ) ( HOIST-AT ?auto_14517 ?auto_14516 ) ( not ( = ?auto_14518 ?auto_14517 ) ) ( AVAILABLE ?auto_14517 ) ( SURFACE-AT ?auto_14512 ?auto_14516 ) ( ON ?auto_14512 ?auto_14519 ) ( CLEAR ?auto_14512 ) ( not ( = ?auto_14511 ?auto_14519 ) ) ( not ( = ?auto_14512 ?auto_14519 ) ) ( not ( = ?auto_14514 ?auto_14519 ) ) ( TRUCK-AT ?auto_14515 ?auto_14513 ) ( SURFACE-AT ?auto_14514 ?auto_14513 ) ( CLEAR ?auto_14514 ) ( LIFTING ?auto_14518 ?auto_14511 ) ( IS-CRATE ?auto_14511 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14514 ?auto_14511 )
      ( MAKE-2CRATE ?auto_14514 ?auto_14511 ?auto_14512 )
      ( MAKE-1CRATE-VERIFY ?auto_14511 ?auto_14512 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14520 - SURFACE
      ?auto_14521 - SURFACE
      ?auto_14522 - SURFACE
    )
    :vars
    (
      ?auto_14527 - HOIST
      ?auto_14526 - PLACE
      ?auto_14523 - PLACE
      ?auto_14525 - HOIST
      ?auto_14528 - SURFACE
      ?auto_14524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14527 ?auto_14526 ) ( IS-CRATE ?auto_14522 ) ( not ( = ?auto_14521 ?auto_14522 ) ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( not ( = ?auto_14520 ?auto_14522 ) ) ( not ( = ?auto_14523 ?auto_14526 ) ) ( HOIST-AT ?auto_14525 ?auto_14523 ) ( not ( = ?auto_14527 ?auto_14525 ) ) ( AVAILABLE ?auto_14525 ) ( SURFACE-AT ?auto_14522 ?auto_14523 ) ( ON ?auto_14522 ?auto_14528 ) ( CLEAR ?auto_14522 ) ( not ( = ?auto_14521 ?auto_14528 ) ) ( not ( = ?auto_14522 ?auto_14528 ) ) ( not ( = ?auto_14520 ?auto_14528 ) ) ( TRUCK-AT ?auto_14524 ?auto_14526 ) ( SURFACE-AT ?auto_14520 ?auto_14526 ) ( CLEAR ?auto_14520 ) ( LIFTING ?auto_14527 ?auto_14521 ) ( IS-CRATE ?auto_14521 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14521 ?auto_14522 )
      ( MAKE-2CRATE-VERIFY ?auto_14520 ?auto_14521 ?auto_14522 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14529 - SURFACE
      ?auto_14530 - SURFACE
      ?auto_14531 - SURFACE
      ?auto_14532 - SURFACE
    )
    :vars
    (
      ?auto_14538 - HOIST
      ?auto_14537 - PLACE
      ?auto_14535 - PLACE
      ?auto_14533 - HOIST
      ?auto_14534 - SURFACE
      ?auto_14536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14538 ?auto_14537 ) ( IS-CRATE ?auto_14532 ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( not ( = ?auto_14530 ?auto_14531 ) ) ( not ( = ?auto_14530 ?auto_14532 ) ) ( not ( = ?auto_14535 ?auto_14537 ) ) ( HOIST-AT ?auto_14533 ?auto_14535 ) ( not ( = ?auto_14538 ?auto_14533 ) ) ( AVAILABLE ?auto_14533 ) ( SURFACE-AT ?auto_14532 ?auto_14535 ) ( ON ?auto_14532 ?auto_14534 ) ( CLEAR ?auto_14532 ) ( not ( = ?auto_14531 ?auto_14534 ) ) ( not ( = ?auto_14532 ?auto_14534 ) ) ( not ( = ?auto_14530 ?auto_14534 ) ) ( TRUCK-AT ?auto_14536 ?auto_14537 ) ( SURFACE-AT ?auto_14530 ?auto_14537 ) ( CLEAR ?auto_14530 ) ( LIFTING ?auto_14538 ?auto_14531 ) ( IS-CRATE ?auto_14531 ) ( ON ?auto_14530 ?auto_14529 ) ( not ( = ?auto_14529 ?auto_14530 ) ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14532 ) ) ( not ( = ?auto_14529 ?auto_14534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14530 ?auto_14531 ?auto_14532 )
      ( MAKE-3CRATE-VERIFY ?auto_14529 ?auto_14530 ?auto_14531 ?auto_14532 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14539 - SURFACE
      ?auto_14540 - SURFACE
      ?auto_14541 - SURFACE
      ?auto_14542 - SURFACE
      ?auto_14543 - SURFACE
    )
    :vars
    (
      ?auto_14549 - HOIST
      ?auto_14548 - PLACE
      ?auto_14546 - PLACE
      ?auto_14544 - HOIST
      ?auto_14545 - SURFACE
      ?auto_14547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14549 ?auto_14548 ) ( IS-CRATE ?auto_14543 ) ( not ( = ?auto_14542 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14542 ) ) ( not ( = ?auto_14541 ?auto_14543 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( HOIST-AT ?auto_14544 ?auto_14546 ) ( not ( = ?auto_14549 ?auto_14544 ) ) ( AVAILABLE ?auto_14544 ) ( SURFACE-AT ?auto_14543 ?auto_14546 ) ( ON ?auto_14543 ?auto_14545 ) ( CLEAR ?auto_14543 ) ( not ( = ?auto_14542 ?auto_14545 ) ) ( not ( = ?auto_14543 ?auto_14545 ) ) ( not ( = ?auto_14541 ?auto_14545 ) ) ( TRUCK-AT ?auto_14547 ?auto_14548 ) ( SURFACE-AT ?auto_14541 ?auto_14548 ) ( CLEAR ?auto_14541 ) ( LIFTING ?auto_14549 ?auto_14542 ) ( IS-CRATE ?auto_14542 ) ( ON ?auto_14540 ?auto_14539 ) ( ON ?auto_14541 ?auto_14540 ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14539 ?auto_14545 ) ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14543 ) ) ( not ( = ?auto_14540 ?auto_14545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14541 ?auto_14542 ?auto_14543 )
      ( MAKE-4CRATE-VERIFY ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14542 ?auto_14543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14550 - SURFACE
      ?auto_14551 - SURFACE
    )
    :vars
    (
      ?auto_14558 - HOIST
      ?auto_14556 - PLACE
      ?auto_14557 - SURFACE
      ?auto_14554 - PLACE
      ?auto_14552 - HOIST
      ?auto_14553 - SURFACE
      ?auto_14555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14558 ?auto_14556 ) ( IS-CRATE ?auto_14551 ) ( not ( = ?auto_14550 ?auto_14551 ) ) ( not ( = ?auto_14557 ?auto_14550 ) ) ( not ( = ?auto_14557 ?auto_14551 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( HOIST-AT ?auto_14552 ?auto_14554 ) ( not ( = ?auto_14558 ?auto_14552 ) ) ( AVAILABLE ?auto_14552 ) ( SURFACE-AT ?auto_14551 ?auto_14554 ) ( ON ?auto_14551 ?auto_14553 ) ( CLEAR ?auto_14551 ) ( not ( = ?auto_14550 ?auto_14553 ) ) ( not ( = ?auto_14551 ?auto_14553 ) ) ( not ( = ?auto_14557 ?auto_14553 ) ) ( TRUCK-AT ?auto_14555 ?auto_14556 ) ( SURFACE-AT ?auto_14557 ?auto_14556 ) ( CLEAR ?auto_14557 ) ( IS-CRATE ?auto_14550 ) ( AVAILABLE ?auto_14558 ) ( IN ?auto_14550 ?auto_14555 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14558 ?auto_14550 ?auto_14555 ?auto_14556 )
      ( MAKE-2CRATE ?auto_14557 ?auto_14550 ?auto_14551 )
      ( MAKE-1CRATE-VERIFY ?auto_14550 ?auto_14551 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14559 - SURFACE
      ?auto_14560 - SURFACE
      ?auto_14561 - SURFACE
    )
    :vars
    (
      ?auto_14567 - HOIST
      ?auto_14562 - PLACE
      ?auto_14566 - PLACE
      ?auto_14564 - HOIST
      ?auto_14563 - SURFACE
      ?auto_14565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14567 ?auto_14562 ) ( IS-CRATE ?auto_14561 ) ( not ( = ?auto_14560 ?auto_14561 ) ) ( not ( = ?auto_14559 ?auto_14560 ) ) ( not ( = ?auto_14559 ?auto_14561 ) ) ( not ( = ?auto_14566 ?auto_14562 ) ) ( HOIST-AT ?auto_14564 ?auto_14566 ) ( not ( = ?auto_14567 ?auto_14564 ) ) ( AVAILABLE ?auto_14564 ) ( SURFACE-AT ?auto_14561 ?auto_14566 ) ( ON ?auto_14561 ?auto_14563 ) ( CLEAR ?auto_14561 ) ( not ( = ?auto_14560 ?auto_14563 ) ) ( not ( = ?auto_14561 ?auto_14563 ) ) ( not ( = ?auto_14559 ?auto_14563 ) ) ( TRUCK-AT ?auto_14565 ?auto_14562 ) ( SURFACE-AT ?auto_14559 ?auto_14562 ) ( CLEAR ?auto_14559 ) ( IS-CRATE ?auto_14560 ) ( AVAILABLE ?auto_14567 ) ( IN ?auto_14560 ?auto_14565 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14560 ?auto_14561 )
      ( MAKE-2CRATE-VERIFY ?auto_14559 ?auto_14560 ?auto_14561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14568 - SURFACE
      ?auto_14569 - SURFACE
      ?auto_14570 - SURFACE
      ?auto_14571 - SURFACE
    )
    :vars
    (
      ?auto_14574 - HOIST
      ?auto_14576 - PLACE
      ?auto_14572 - PLACE
      ?auto_14573 - HOIST
      ?auto_14577 - SURFACE
      ?auto_14575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14574 ?auto_14576 ) ( IS-CRATE ?auto_14571 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( not ( = ?auto_14569 ?auto_14570 ) ) ( not ( = ?auto_14569 ?auto_14571 ) ) ( not ( = ?auto_14572 ?auto_14576 ) ) ( HOIST-AT ?auto_14573 ?auto_14572 ) ( not ( = ?auto_14574 ?auto_14573 ) ) ( AVAILABLE ?auto_14573 ) ( SURFACE-AT ?auto_14571 ?auto_14572 ) ( ON ?auto_14571 ?auto_14577 ) ( CLEAR ?auto_14571 ) ( not ( = ?auto_14570 ?auto_14577 ) ) ( not ( = ?auto_14571 ?auto_14577 ) ) ( not ( = ?auto_14569 ?auto_14577 ) ) ( TRUCK-AT ?auto_14575 ?auto_14576 ) ( SURFACE-AT ?auto_14569 ?auto_14576 ) ( CLEAR ?auto_14569 ) ( IS-CRATE ?auto_14570 ) ( AVAILABLE ?auto_14574 ) ( IN ?auto_14570 ?auto_14575 ) ( ON ?auto_14569 ?auto_14568 ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14570 ) ) ( not ( = ?auto_14568 ?auto_14571 ) ) ( not ( = ?auto_14568 ?auto_14577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14569 ?auto_14570 ?auto_14571 )
      ( MAKE-3CRATE-VERIFY ?auto_14568 ?auto_14569 ?auto_14570 ?auto_14571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14578 - SURFACE
      ?auto_14579 - SURFACE
      ?auto_14580 - SURFACE
      ?auto_14581 - SURFACE
      ?auto_14582 - SURFACE
    )
    :vars
    (
      ?auto_14585 - HOIST
      ?auto_14587 - PLACE
      ?auto_14583 - PLACE
      ?auto_14584 - HOIST
      ?auto_14588 - SURFACE
      ?auto_14586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14585 ?auto_14587 ) ( IS-CRATE ?auto_14582 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14583 ?auto_14587 ) ) ( HOIST-AT ?auto_14584 ?auto_14583 ) ( not ( = ?auto_14585 ?auto_14584 ) ) ( AVAILABLE ?auto_14584 ) ( SURFACE-AT ?auto_14582 ?auto_14583 ) ( ON ?auto_14582 ?auto_14588 ) ( CLEAR ?auto_14582 ) ( not ( = ?auto_14581 ?auto_14588 ) ) ( not ( = ?auto_14582 ?auto_14588 ) ) ( not ( = ?auto_14580 ?auto_14588 ) ) ( TRUCK-AT ?auto_14586 ?auto_14587 ) ( SURFACE-AT ?auto_14580 ?auto_14587 ) ( CLEAR ?auto_14580 ) ( IS-CRATE ?auto_14581 ) ( AVAILABLE ?auto_14585 ) ( IN ?auto_14581 ?auto_14586 ) ( ON ?auto_14579 ?auto_14578 ) ( ON ?auto_14580 ?auto_14579 ) ( not ( = ?auto_14578 ?auto_14579 ) ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14578 ?auto_14582 ) ) ( not ( = ?auto_14578 ?auto_14588 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( not ( = ?auto_14579 ?auto_14588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14580 ?auto_14581 ?auto_14582 )
      ( MAKE-4CRATE-VERIFY ?auto_14578 ?auto_14579 ?auto_14580 ?auto_14581 ?auto_14582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14589 - SURFACE
      ?auto_14590 - SURFACE
    )
    :vars
    (
      ?auto_14593 - HOIST
      ?auto_14595 - PLACE
      ?auto_14597 - SURFACE
      ?auto_14591 - PLACE
      ?auto_14592 - HOIST
      ?auto_14596 - SURFACE
      ?auto_14594 - TRUCK
      ?auto_14598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14593 ?auto_14595 ) ( IS-CRATE ?auto_14590 ) ( not ( = ?auto_14589 ?auto_14590 ) ) ( not ( = ?auto_14597 ?auto_14589 ) ) ( not ( = ?auto_14597 ?auto_14590 ) ) ( not ( = ?auto_14591 ?auto_14595 ) ) ( HOIST-AT ?auto_14592 ?auto_14591 ) ( not ( = ?auto_14593 ?auto_14592 ) ) ( AVAILABLE ?auto_14592 ) ( SURFACE-AT ?auto_14590 ?auto_14591 ) ( ON ?auto_14590 ?auto_14596 ) ( CLEAR ?auto_14590 ) ( not ( = ?auto_14589 ?auto_14596 ) ) ( not ( = ?auto_14590 ?auto_14596 ) ) ( not ( = ?auto_14597 ?auto_14596 ) ) ( SURFACE-AT ?auto_14597 ?auto_14595 ) ( CLEAR ?auto_14597 ) ( IS-CRATE ?auto_14589 ) ( AVAILABLE ?auto_14593 ) ( IN ?auto_14589 ?auto_14594 ) ( TRUCK-AT ?auto_14594 ?auto_14598 ) ( not ( = ?auto_14598 ?auto_14595 ) ) ( not ( = ?auto_14591 ?auto_14598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14594 ?auto_14598 ?auto_14595 )
      ( MAKE-2CRATE ?auto_14597 ?auto_14589 ?auto_14590 )
      ( MAKE-1CRATE-VERIFY ?auto_14589 ?auto_14590 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14599 - SURFACE
      ?auto_14600 - SURFACE
      ?auto_14601 - SURFACE
    )
    :vars
    (
      ?auto_14606 - HOIST
      ?auto_14607 - PLACE
      ?auto_14602 - PLACE
      ?auto_14604 - HOIST
      ?auto_14603 - SURFACE
      ?auto_14605 - TRUCK
      ?auto_14608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14606 ?auto_14607 ) ( IS-CRATE ?auto_14601 ) ( not ( = ?auto_14600 ?auto_14601 ) ) ( not ( = ?auto_14599 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( not ( = ?auto_14602 ?auto_14607 ) ) ( HOIST-AT ?auto_14604 ?auto_14602 ) ( not ( = ?auto_14606 ?auto_14604 ) ) ( AVAILABLE ?auto_14604 ) ( SURFACE-AT ?auto_14601 ?auto_14602 ) ( ON ?auto_14601 ?auto_14603 ) ( CLEAR ?auto_14601 ) ( not ( = ?auto_14600 ?auto_14603 ) ) ( not ( = ?auto_14601 ?auto_14603 ) ) ( not ( = ?auto_14599 ?auto_14603 ) ) ( SURFACE-AT ?auto_14599 ?auto_14607 ) ( CLEAR ?auto_14599 ) ( IS-CRATE ?auto_14600 ) ( AVAILABLE ?auto_14606 ) ( IN ?auto_14600 ?auto_14605 ) ( TRUCK-AT ?auto_14605 ?auto_14608 ) ( not ( = ?auto_14608 ?auto_14607 ) ) ( not ( = ?auto_14602 ?auto_14608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14600 ?auto_14601 )
      ( MAKE-2CRATE-VERIFY ?auto_14599 ?auto_14600 ?auto_14601 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14609 - SURFACE
      ?auto_14610 - SURFACE
      ?auto_14611 - SURFACE
      ?auto_14612 - SURFACE
    )
    :vars
    (
      ?auto_14617 - HOIST
      ?auto_14613 - PLACE
      ?auto_14618 - PLACE
      ?auto_14616 - HOIST
      ?auto_14614 - SURFACE
      ?auto_14619 - TRUCK
      ?auto_14615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14617 ?auto_14613 ) ( IS-CRATE ?auto_14612 ) ( not ( = ?auto_14611 ?auto_14612 ) ) ( not ( = ?auto_14610 ?auto_14611 ) ) ( not ( = ?auto_14610 ?auto_14612 ) ) ( not ( = ?auto_14618 ?auto_14613 ) ) ( HOIST-AT ?auto_14616 ?auto_14618 ) ( not ( = ?auto_14617 ?auto_14616 ) ) ( AVAILABLE ?auto_14616 ) ( SURFACE-AT ?auto_14612 ?auto_14618 ) ( ON ?auto_14612 ?auto_14614 ) ( CLEAR ?auto_14612 ) ( not ( = ?auto_14611 ?auto_14614 ) ) ( not ( = ?auto_14612 ?auto_14614 ) ) ( not ( = ?auto_14610 ?auto_14614 ) ) ( SURFACE-AT ?auto_14610 ?auto_14613 ) ( CLEAR ?auto_14610 ) ( IS-CRATE ?auto_14611 ) ( AVAILABLE ?auto_14617 ) ( IN ?auto_14611 ?auto_14619 ) ( TRUCK-AT ?auto_14619 ?auto_14615 ) ( not ( = ?auto_14615 ?auto_14613 ) ) ( not ( = ?auto_14618 ?auto_14615 ) ) ( ON ?auto_14610 ?auto_14609 ) ( not ( = ?auto_14609 ?auto_14610 ) ) ( not ( = ?auto_14609 ?auto_14611 ) ) ( not ( = ?auto_14609 ?auto_14612 ) ) ( not ( = ?auto_14609 ?auto_14614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14610 ?auto_14611 ?auto_14612 )
      ( MAKE-3CRATE-VERIFY ?auto_14609 ?auto_14610 ?auto_14611 ?auto_14612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14620 - SURFACE
      ?auto_14621 - SURFACE
      ?auto_14622 - SURFACE
      ?auto_14623 - SURFACE
      ?auto_14624 - SURFACE
    )
    :vars
    (
      ?auto_14629 - HOIST
      ?auto_14625 - PLACE
      ?auto_14630 - PLACE
      ?auto_14628 - HOIST
      ?auto_14626 - SURFACE
      ?auto_14631 - TRUCK
      ?auto_14627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14629 ?auto_14625 ) ( IS-CRATE ?auto_14624 ) ( not ( = ?auto_14623 ?auto_14624 ) ) ( not ( = ?auto_14622 ?auto_14623 ) ) ( not ( = ?auto_14622 ?auto_14624 ) ) ( not ( = ?auto_14630 ?auto_14625 ) ) ( HOIST-AT ?auto_14628 ?auto_14630 ) ( not ( = ?auto_14629 ?auto_14628 ) ) ( AVAILABLE ?auto_14628 ) ( SURFACE-AT ?auto_14624 ?auto_14630 ) ( ON ?auto_14624 ?auto_14626 ) ( CLEAR ?auto_14624 ) ( not ( = ?auto_14623 ?auto_14626 ) ) ( not ( = ?auto_14624 ?auto_14626 ) ) ( not ( = ?auto_14622 ?auto_14626 ) ) ( SURFACE-AT ?auto_14622 ?auto_14625 ) ( CLEAR ?auto_14622 ) ( IS-CRATE ?auto_14623 ) ( AVAILABLE ?auto_14629 ) ( IN ?auto_14623 ?auto_14631 ) ( TRUCK-AT ?auto_14631 ?auto_14627 ) ( not ( = ?auto_14627 ?auto_14625 ) ) ( not ( = ?auto_14630 ?auto_14627 ) ) ( ON ?auto_14621 ?auto_14620 ) ( ON ?auto_14622 ?auto_14621 ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( not ( = ?auto_14620 ?auto_14622 ) ) ( not ( = ?auto_14620 ?auto_14623 ) ) ( not ( = ?auto_14620 ?auto_14624 ) ) ( not ( = ?auto_14620 ?auto_14626 ) ) ( not ( = ?auto_14621 ?auto_14622 ) ) ( not ( = ?auto_14621 ?auto_14623 ) ) ( not ( = ?auto_14621 ?auto_14624 ) ) ( not ( = ?auto_14621 ?auto_14626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14622 ?auto_14623 ?auto_14624 )
      ( MAKE-4CRATE-VERIFY ?auto_14620 ?auto_14621 ?auto_14622 ?auto_14623 ?auto_14624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14632 - SURFACE
      ?auto_14633 - SURFACE
    )
    :vars
    (
      ?auto_14639 - HOIST
      ?auto_14634 - PLACE
      ?auto_14636 - SURFACE
      ?auto_14640 - PLACE
      ?auto_14638 - HOIST
      ?auto_14635 - SURFACE
      ?auto_14641 - TRUCK
      ?auto_14637 - PLACE
      ?auto_14642 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14639 ?auto_14634 ) ( IS-CRATE ?auto_14633 ) ( not ( = ?auto_14632 ?auto_14633 ) ) ( not ( = ?auto_14636 ?auto_14632 ) ) ( not ( = ?auto_14636 ?auto_14633 ) ) ( not ( = ?auto_14640 ?auto_14634 ) ) ( HOIST-AT ?auto_14638 ?auto_14640 ) ( not ( = ?auto_14639 ?auto_14638 ) ) ( AVAILABLE ?auto_14638 ) ( SURFACE-AT ?auto_14633 ?auto_14640 ) ( ON ?auto_14633 ?auto_14635 ) ( CLEAR ?auto_14633 ) ( not ( = ?auto_14632 ?auto_14635 ) ) ( not ( = ?auto_14633 ?auto_14635 ) ) ( not ( = ?auto_14636 ?auto_14635 ) ) ( SURFACE-AT ?auto_14636 ?auto_14634 ) ( CLEAR ?auto_14636 ) ( IS-CRATE ?auto_14632 ) ( AVAILABLE ?auto_14639 ) ( TRUCK-AT ?auto_14641 ?auto_14637 ) ( not ( = ?auto_14637 ?auto_14634 ) ) ( not ( = ?auto_14640 ?auto_14637 ) ) ( HOIST-AT ?auto_14642 ?auto_14637 ) ( LIFTING ?auto_14642 ?auto_14632 ) ( not ( = ?auto_14639 ?auto_14642 ) ) ( not ( = ?auto_14638 ?auto_14642 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14642 ?auto_14632 ?auto_14641 ?auto_14637 )
      ( MAKE-2CRATE ?auto_14636 ?auto_14632 ?auto_14633 )
      ( MAKE-1CRATE-VERIFY ?auto_14632 ?auto_14633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14643 - SURFACE
      ?auto_14644 - SURFACE
      ?auto_14645 - SURFACE
    )
    :vars
    (
      ?auto_14650 - HOIST
      ?auto_14647 - PLACE
      ?auto_14646 - PLACE
      ?auto_14649 - HOIST
      ?auto_14653 - SURFACE
      ?auto_14648 - TRUCK
      ?auto_14651 - PLACE
      ?auto_14652 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14650 ?auto_14647 ) ( IS-CRATE ?auto_14645 ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14646 ?auto_14647 ) ) ( HOIST-AT ?auto_14649 ?auto_14646 ) ( not ( = ?auto_14650 ?auto_14649 ) ) ( AVAILABLE ?auto_14649 ) ( SURFACE-AT ?auto_14645 ?auto_14646 ) ( ON ?auto_14645 ?auto_14653 ) ( CLEAR ?auto_14645 ) ( not ( = ?auto_14644 ?auto_14653 ) ) ( not ( = ?auto_14645 ?auto_14653 ) ) ( not ( = ?auto_14643 ?auto_14653 ) ) ( SURFACE-AT ?auto_14643 ?auto_14647 ) ( CLEAR ?auto_14643 ) ( IS-CRATE ?auto_14644 ) ( AVAILABLE ?auto_14650 ) ( TRUCK-AT ?auto_14648 ?auto_14651 ) ( not ( = ?auto_14651 ?auto_14647 ) ) ( not ( = ?auto_14646 ?auto_14651 ) ) ( HOIST-AT ?auto_14652 ?auto_14651 ) ( LIFTING ?auto_14652 ?auto_14644 ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14649 ?auto_14652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14644 ?auto_14645 )
      ( MAKE-2CRATE-VERIFY ?auto_14643 ?auto_14644 ?auto_14645 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14654 - SURFACE
      ?auto_14655 - SURFACE
      ?auto_14656 - SURFACE
      ?auto_14657 - SURFACE
    )
    :vars
    (
      ?auto_14662 - HOIST
      ?auto_14658 - PLACE
      ?auto_14663 - PLACE
      ?auto_14660 - HOIST
      ?auto_14665 - SURFACE
      ?auto_14661 - TRUCK
      ?auto_14664 - PLACE
      ?auto_14659 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14662 ?auto_14658 ) ( IS-CRATE ?auto_14657 ) ( not ( = ?auto_14656 ?auto_14657 ) ) ( not ( = ?auto_14655 ?auto_14656 ) ) ( not ( = ?auto_14655 ?auto_14657 ) ) ( not ( = ?auto_14663 ?auto_14658 ) ) ( HOIST-AT ?auto_14660 ?auto_14663 ) ( not ( = ?auto_14662 ?auto_14660 ) ) ( AVAILABLE ?auto_14660 ) ( SURFACE-AT ?auto_14657 ?auto_14663 ) ( ON ?auto_14657 ?auto_14665 ) ( CLEAR ?auto_14657 ) ( not ( = ?auto_14656 ?auto_14665 ) ) ( not ( = ?auto_14657 ?auto_14665 ) ) ( not ( = ?auto_14655 ?auto_14665 ) ) ( SURFACE-AT ?auto_14655 ?auto_14658 ) ( CLEAR ?auto_14655 ) ( IS-CRATE ?auto_14656 ) ( AVAILABLE ?auto_14662 ) ( TRUCK-AT ?auto_14661 ?auto_14664 ) ( not ( = ?auto_14664 ?auto_14658 ) ) ( not ( = ?auto_14663 ?auto_14664 ) ) ( HOIST-AT ?auto_14659 ?auto_14664 ) ( LIFTING ?auto_14659 ?auto_14656 ) ( not ( = ?auto_14662 ?auto_14659 ) ) ( not ( = ?auto_14660 ?auto_14659 ) ) ( ON ?auto_14655 ?auto_14654 ) ( not ( = ?auto_14654 ?auto_14655 ) ) ( not ( = ?auto_14654 ?auto_14656 ) ) ( not ( = ?auto_14654 ?auto_14657 ) ) ( not ( = ?auto_14654 ?auto_14665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14655 ?auto_14656 ?auto_14657 )
      ( MAKE-3CRATE-VERIFY ?auto_14654 ?auto_14655 ?auto_14656 ?auto_14657 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14666 - SURFACE
      ?auto_14667 - SURFACE
      ?auto_14668 - SURFACE
      ?auto_14669 - SURFACE
      ?auto_14670 - SURFACE
    )
    :vars
    (
      ?auto_14675 - HOIST
      ?auto_14671 - PLACE
      ?auto_14676 - PLACE
      ?auto_14673 - HOIST
      ?auto_14678 - SURFACE
      ?auto_14674 - TRUCK
      ?auto_14677 - PLACE
      ?auto_14672 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14675 ?auto_14671 ) ( IS-CRATE ?auto_14670 ) ( not ( = ?auto_14669 ?auto_14670 ) ) ( not ( = ?auto_14668 ?auto_14669 ) ) ( not ( = ?auto_14668 ?auto_14670 ) ) ( not ( = ?auto_14676 ?auto_14671 ) ) ( HOIST-AT ?auto_14673 ?auto_14676 ) ( not ( = ?auto_14675 ?auto_14673 ) ) ( AVAILABLE ?auto_14673 ) ( SURFACE-AT ?auto_14670 ?auto_14676 ) ( ON ?auto_14670 ?auto_14678 ) ( CLEAR ?auto_14670 ) ( not ( = ?auto_14669 ?auto_14678 ) ) ( not ( = ?auto_14670 ?auto_14678 ) ) ( not ( = ?auto_14668 ?auto_14678 ) ) ( SURFACE-AT ?auto_14668 ?auto_14671 ) ( CLEAR ?auto_14668 ) ( IS-CRATE ?auto_14669 ) ( AVAILABLE ?auto_14675 ) ( TRUCK-AT ?auto_14674 ?auto_14677 ) ( not ( = ?auto_14677 ?auto_14671 ) ) ( not ( = ?auto_14676 ?auto_14677 ) ) ( HOIST-AT ?auto_14672 ?auto_14677 ) ( LIFTING ?auto_14672 ?auto_14669 ) ( not ( = ?auto_14675 ?auto_14672 ) ) ( not ( = ?auto_14673 ?auto_14672 ) ) ( ON ?auto_14667 ?auto_14666 ) ( ON ?auto_14668 ?auto_14667 ) ( not ( = ?auto_14666 ?auto_14667 ) ) ( not ( = ?auto_14666 ?auto_14668 ) ) ( not ( = ?auto_14666 ?auto_14669 ) ) ( not ( = ?auto_14666 ?auto_14670 ) ) ( not ( = ?auto_14666 ?auto_14678 ) ) ( not ( = ?auto_14667 ?auto_14668 ) ) ( not ( = ?auto_14667 ?auto_14669 ) ) ( not ( = ?auto_14667 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14668 ?auto_14669 ?auto_14670 )
      ( MAKE-4CRATE-VERIFY ?auto_14666 ?auto_14667 ?auto_14668 ?auto_14669 ?auto_14670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14679 - SURFACE
      ?auto_14680 - SURFACE
    )
    :vars
    (
      ?auto_14686 - HOIST
      ?auto_14682 - PLACE
      ?auto_14681 - SURFACE
      ?auto_14687 - PLACE
      ?auto_14684 - HOIST
      ?auto_14689 - SURFACE
      ?auto_14685 - TRUCK
      ?auto_14688 - PLACE
      ?auto_14683 - HOIST
      ?auto_14690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14686 ?auto_14682 ) ( IS-CRATE ?auto_14680 ) ( not ( = ?auto_14679 ?auto_14680 ) ) ( not ( = ?auto_14681 ?auto_14679 ) ) ( not ( = ?auto_14681 ?auto_14680 ) ) ( not ( = ?auto_14687 ?auto_14682 ) ) ( HOIST-AT ?auto_14684 ?auto_14687 ) ( not ( = ?auto_14686 ?auto_14684 ) ) ( AVAILABLE ?auto_14684 ) ( SURFACE-AT ?auto_14680 ?auto_14687 ) ( ON ?auto_14680 ?auto_14689 ) ( CLEAR ?auto_14680 ) ( not ( = ?auto_14679 ?auto_14689 ) ) ( not ( = ?auto_14680 ?auto_14689 ) ) ( not ( = ?auto_14681 ?auto_14689 ) ) ( SURFACE-AT ?auto_14681 ?auto_14682 ) ( CLEAR ?auto_14681 ) ( IS-CRATE ?auto_14679 ) ( AVAILABLE ?auto_14686 ) ( TRUCK-AT ?auto_14685 ?auto_14688 ) ( not ( = ?auto_14688 ?auto_14682 ) ) ( not ( = ?auto_14687 ?auto_14688 ) ) ( HOIST-AT ?auto_14683 ?auto_14688 ) ( not ( = ?auto_14686 ?auto_14683 ) ) ( not ( = ?auto_14684 ?auto_14683 ) ) ( AVAILABLE ?auto_14683 ) ( SURFACE-AT ?auto_14679 ?auto_14688 ) ( ON ?auto_14679 ?auto_14690 ) ( CLEAR ?auto_14679 ) ( not ( = ?auto_14679 ?auto_14690 ) ) ( not ( = ?auto_14680 ?auto_14690 ) ) ( not ( = ?auto_14681 ?auto_14690 ) ) ( not ( = ?auto_14689 ?auto_14690 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14683 ?auto_14679 ?auto_14690 ?auto_14688 )
      ( MAKE-2CRATE ?auto_14681 ?auto_14679 ?auto_14680 )
      ( MAKE-1CRATE-VERIFY ?auto_14679 ?auto_14680 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14691 - SURFACE
      ?auto_14692 - SURFACE
      ?auto_14693 - SURFACE
    )
    :vars
    (
      ?auto_14699 - HOIST
      ?auto_14698 - PLACE
      ?auto_14700 - PLACE
      ?auto_14694 - HOIST
      ?auto_14696 - SURFACE
      ?auto_14701 - TRUCK
      ?auto_14695 - PLACE
      ?auto_14702 - HOIST
      ?auto_14697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14699 ?auto_14698 ) ( IS-CRATE ?auto_14693 ) ( not ( = ?auto_14692 ?auto_14693 ) ) ( not ( = ?auto_14691 ?auto_14692 ) ) ( not ( = ?auto_14691 ?auto_14693 ) ) ( not ( = ?auto_14700 ?auto_14698 ) ) ( HOIST-AT ?auto_14694 ?auto_14700 ) ( not ( = ?auto_14699 ?auto_14694 ) ) ( AVAILABLE ?auto_14694 ) ( SURFACE-AT ?auto_14693 ?auto_14700 ) ( ON ?auto_14693 ?auto_14696 ) ( CLEAR ?auto_14693 ) ( not ( = ?auto_14692 ?auto_14696 ) ) ( not ( = ?auto_14693 ?auto_14696 ) ) ( not ( = ?auto_14691 ?auto_14696 ) ) ( SURFACE-AT ?auto_14691 ?auto_14698 ) ( CLEAR ?auto_14691 ) ( IS-CRATE ?auto_14692 ) ( AVAILABLE ?auto_14699 ) ( TRUCK-AT ?auto_14701 ?auto_14695 ) ( not ( = ?auto_14695 ?auto_14698 ) ) ( not ( = ?auto_14700 ?auto_14695 ) ) ( HOIST-AT ?auto_14702 ?auto_14695 ) ( not ( = ?auto_14699 ?auto_14702 ) ) ( not ( = ?auto_14694 ?auto_14702 ) ) ( AVAILABLE ?auto_14702 ) ( SURFACE-AT ?auto_14692 ?auto_14695 ) ( ON ?auto_14692 ?auto_14697 ) ( CLEAR ?auto_14692 ) ( not ( = ?auto_14692 ?auto_14697 ) ) ( not ( = ?auto_14693 ?auto_14697 ) ) ( not ( = ?auto_14691 ?auto_14697 ) ) ( not ( = ?auto_14696 ?auto_14697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14692 ?auto_14693 )
      ( MAKE-2CRATE-VERIFY ?auto_14691 ?auto_14692 ?auto_14693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14703 - SURFACE
      ?auto_14704 - SURFACE
      ?auto_14705 - SURFACE
      ?auto_14706 - SURFACE
    )
    :vars
    (
      ?auto_14707 - HOIST
      ?auto_14710 - PLACE
      ?auto_14714 - PLACE
      ?auto_14712 - HOIST
      ?auto_14708 - SURFACE
      ?auto_14715 - TRUCK
      ?auto_14711 - PLACE
      ?auto_14713 - HOIST
      ?auto_14709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14707 ?auto_14710 ) ( IS-CRATE ?auto_14706 ) ( not ( = ?auto_14705 ?auto_14706 ) ) ( not ( = ?auto_14704 ?auto_14705 ) ) ( not ( = ?auto_14704 ?auto_14706 ) ) ( not ( = ?auto_14714 ?auto_14710 ) ) ( HOIST-AT ?auto_14712 ?auto_14714 ) ( not ( = ?auto_14707 ?auto_14712 ) ) ( AVAILABLE ?auto_14712 ) ( SURFACE-AT ?auto_14706 ?auto_14714 ) ( ON ?auto_14706 ?auto_14708 ) ( CLEAR ?auto_14706 ) ( not ( = ?auto_14705 ?auto_14708 ) ) ( not ( = ?auto_14706 ?auto_14708 ) ) ( not ( = ?auto_14704 ?auto_14708 ) ) ( SURFACE-AT ?auto_14704 ?auto_14710 ) ( CLEAR ?auto_14704 ) ( IS-CRATE ?auto_14705 ) ( AVAILABLE ?auto_14707 ) ( TRUCK-AT ?auto_14715 ?auto_14711 ) ( not ( = ?auto_14711 ?auto_14710 ) ) ( not ( = ?auto_14714 ?auto_14711 ) ) ( HOIST-AT ?auto_14713 ?auto_14711 ) ( not ( = ?auto_14707 ?auto_14713 ) ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( AVAILABLE ?auto_14713 ) ( SURFACE-AT ?auto_14705 ?auto_14711 ) ( ON ?auto_14705 ?auto_14709 ) ( CLEAR ?auto_14705 ) ( not ( = ?auto_14705 ?auto_14709 ) ) ( not ( = ?auto_14706 ?auto_14709 ) ) ( not ( = ?auto_14704 ?auto_14709 ) ) ( not ( = ?auto_14708 ?auto_14709 ) ) ( ON ?auto_14704 ?auto_14703 ) ( not ( = ?auto_14703 ?auto_14704 ) ) ( not ( = ?auto_14703 ?auto_14705 ) ) ( not ( = ?auto_14703 ?auto_14706 ) ) ( not ( = ?auto_14703 ?auto_14708 ) ) ( not ( = ?auto_14703 ?auto_14709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14704 ?auto_14705 ?auto_14706 )
      ( MAKE-3CRATE-VERIFY ?auto_14703 ?auto_14704 ?auto_14705 ?auto_14706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14716 - SURFACE
      ?auto_14717 - SURFACE
      ?auto_14718 - SURFACE
      ?auto_14719 - SURFACE
      ?auto_14720 - SURFACE
    )
    :vars
    (
      ?auto_14721 - HOIST
      ?auto_14724 - PLACE
      ?auto_14728 - PLACE
      ?auto_14726 - HOIST
      ?auto_14722 - SURFACE
      ?auto_14729 - TRUCK
      ?auto_14725 - PLACE
      ?auto_14727 - HOIST
      ?auto_14723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14721 ?auto_14724 ) ( IS-CRATE ?auto_14720 ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( not ( = ?auto_14718 ?auto_14719 ) ) ( not ( = ?auto_14718 ?auto_14720 ) ) ( not ( = ?auto_14728 ?auto_14724 ) ) ( HOIST-AT ?auto_14726 ?auto_14728 ) ( not ( = ?auto_14721 ?auto_14726 ) ) ( AVAILABLE ?auto_14726 ) ( SURFACE-AT ?auto_14720 ?auto_14728 ) ( ON ?auto_14720 ?auto_14722 ) ( CLEAR ?auto_14720 ) ( not ( = ?auto_14719 ?auto_14722 ) ) ( not ( = ?auto_14720 ?auto_14722 ) ) ( not ( = ?auto_14718 ?auto_14722 ) ) ( SURFACE-AT ?auto_14718 ?auto_14724 ) ( CLEAR ?auto_14718 ) ( IS-CRATE ?auto_14719 ) ( AVAILABLE ?auto_14721 ) ( TRUCK-AT ?auto_14729 ?auto_14725 ) ( not ( = ?auto_14725 ?auto_14724 ) ) ( not ( = ?auto_14728 ?auto_14725 ) ) ( HOIST-AT ?auto_14727 ?auto_14725 ) ( not ( = ?auto_14721 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( AVAILABLE ?auto_14727 ) ( SURFACE-AT ?auto_14719 ?auto_14725 ) ( ON ?auto_14719 ?auto_14723 ) ( CLEAR ?auto_14719 ) ( not ( = ?auto_14719 ?auto_14723 ) ) ( not ( = ?auto_14720 ?auto_14723 ) ) ( not ( = ?auto_14718 ?auto_14723 ) ) ( not ( = ?auto_14722 ?auto_14723 ) ) ( ON ?auto_14717 ?auto_14716 ) ( ON ?auto_14718 ?auto_14717 ) ( not ( = ?auto_14716 ?auto_14717 ) ) ( not ( = ?auto_14716 ?auto_14718 ) ) ( not ( = ?auto_14716 ?auto_14719 ) ) ( not ( = ?auto_14716 ?auto_14720 ) ) ( not ( = ?auto_14716 ?auto_14722 ) ) ( not ( = ?auto_14716 ?auto_14723 ) ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14717 ?auto_14719 ) ) ( not ( = ?auto_14717 ?auto_14720 ) ) ( not ( = ?auto_14717 ?auto_14722 ) ) ( not ( = ?auto_14717 ?auto_14723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14718 ?auto_14719 ?auto_14720 )
      ( MAKE-4CRATE-VERIFY ?auto_14716 ?auto_14717 ?auto_14718 ?auto_14719 ?auto_14720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14730 - SURFACE
      ?auto_14731 - SURFACE
    )
    :vars
    (
      ?auto_14733 - HOIST
      ?auto_14736 - PLACE
      ?auto_14732 - SURFACE
      ?auto_14740 - PLACE
      ?auto_14738 - HOIST
      ?auto_14734 - SURFACE
      ?auto_14737 - PLACE
      ?auto_14739 - HOIST
      ?auto_14735 - SURFACE
      ?auto_14741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14733 ?auto_14736 ) ( IS-CRATE ?auto_14731 ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14732 ?auto_14730 ) ) ( not ( = ?auto_14732 ?auto_14731 ) ) ( not ( = ?auto_14740 ?auto_14736 ) ) ( HOIST-AT ?auto_14738 ?auto_14740 ) ( not ( = ?auto_14733 ?auto_14738 ) ) ( AVAILABLE ?auto_14738 ) ( SURFACE-AT ?auto_14731 ?auto_14740 ) ( ON ?auto_14731 ?auto_14734 ) ( CLEAR ?auto_14731 ) ( not ( = ?auto_14730 ?auto_14734 ) ) ( not ( = ?auto_14731 ?auto_14734 ) ) ( not ( = ?auto_14732 ?auto_14734 ) ) ( SURFACE-AT ?auto_14732 ?auto_14736 ) ( CLEAR ?auto_14732 ) ( IS-CRATE ?auto_14730 ) ( AVAILABLE ?auto_14733 ) ( not ( = ?auto_14737 ?auto_14736 ) ) ( not ( = ?auto_14740 ?auto_14737 ) ) ( HOIST-AT ?auto_14739 ?auto_14737 ) ( not ( = ?auto_14733 ?auto_14739 ) ) ( not ( = ?auto_14738 ?auto_14739 ) ) ( AVAILABLE ?auto_14739 ) ( SURFACE-AT ?auto_14730 ?auto_14737 ) ( ON ?auto_14730 ?auto_14735 ) ( CLEAR ?auto_14730 ) ( not ( = ?auto_14730 ?auto_14735 ) ) ( not ( = ?auto_14731 ?auto_14735 ) ) ( not ( = ?auto_14732 ?auto_14735 ) ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( TRUCK-AT ?auto_14741 ?auto_14736 ) )
    :subtasks
    ( ( !DRIVE ?auto_14741 ?auto_14736 ?auto_14737 )
      ( MAKE-2CRATE ?auto_14732 ?auto_14730 ?auto_14731 )
      ( MAKE-1CRATE-VERIFY ?auto_14730 ?auto_14731 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14742 - SURFACE
      ?auto_14743 - SURFACE
      ?auto_14744 - SURFACE
    )
    :vars
    (
      ?auto_14751 - HOIST
      ?auto_14752 - PLACE
      ?auto_14748 - PLACE
      ?auto_14753 - HOIST
      ?auto_14747 - SURFACE
      ?auto_14750 - PLACE
      ?auto_14746 - HOIST
      ?auto_14745 - SURFACE
      ?auto_14749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14751 ?auto_14752 ) ( IS-CRATE ?auto_14744 ) ( not ( = ?auto_14743 ?auto_14744 ) ) ( not ( = ?auto_14742 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14744 ) ) ( not ( = ?auto_14748 ?auto_14752 ) ) ( HOIST-AT ?auto_14753 ?auto_14748 ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( AVAILABLE ?auto_14753 ) ( SURFACE-AT ?auto_14744 ?auto_14748 ) ( ON ?auto_14744 ?auto_14747 ) ( CLEAR ?auto_14744 ) ( not ( = ?auto_14743 ?auto_14747 ) ) ( not ( = ?auto_14744 ?auto_14747 ) ) ( not ( = ?auto_14742 ?auto_14747 ) ) ( SURFACE-AT ?auto_14742 ?auto_14752 ) ( CLEAR ?auto_14742 ) ( IS-CRATE ?auto_14743 ) ( AVAILABLE ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14752 ) ) ( not ( = ?auto_14748 ?auto_14750 ) ) ( HOIST-AT ?auto_14746 ?auto_14750 ) ( not ( = ?auto_14751 ?auto_14746 ) ) ( not ( = ?auto_14753 ?auto_14746 ) ) ( AVAILABLE ?auto_14746 ) ( SURFACE-AT ?auto_14743 ?auto_14750 ) ( ON ?auto_14743 ?auto_14745 ) ( CLEAR ?auto_14743 ) ( not ( = ?auto_14743 ?auto_14745 ) ) ( not ( = ?auto_14744 ?auto_14745 ) ) ( not ( = ?auto_14742 ?auto_14745 ) ) ( not ( = ?auto_14747 ?auto_14745 ) ) ( TRUCK-AT ?auto_14749 ?auto_14752 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14743 ?auto_14744 )
      ( MAKE-2CRATE-VERIFY ?auto_14742 ?auto_14743 ?auto_14744 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14754 - SURFACE
      ?auto_14755 - SURFACE
      ?auto_14756 - SURFACE
      ?auto_14757 - SURFACE
    )
    :vars
    (
      ?auto_14760 - HOIST
      ?auto_14765 - PLACE
      ?auto_14763 - PLACE
      ?auto_14758 - HOIST
      ?auto_14766 - SURFACE
      ?auto_14762 - PLACE
      ?auto_14759 - HOIST
      ?auto_14764 - SURFACE
      ?auto_14761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14760 ?auto_14765 ) ( IS-CRATE ?auto_14757 ) ( not ( = ?auto_14756 ?auto_14757 ) ) ( not ( = ?auto_14755 ?auto_14756 ) ) ( not ( = ?auto_14755 ?auto_14757 ) ) ( not ( = ?auto_14763 ?auto_14765 ) ) ( HOIST-AT ?auto_14758 ?auto_14763 ) ( not ( = ?auto_14760 ?auto_14758 ) ) ( AVAILABLE ?auto_14758 ) ( SURFACE-AT ?auto_14757 ?auto_14763 ) ( ON ?auto_14757 ?auto_14766 ) ( CLEAR ?auto_14757 ) ( not ( = ?auto_14756 ?auto_14766 ) ) ( not ( = ?auto_14757 ?auto_14766 ) ) ( not ( = ?auto_14755 ?auto_14766 ) ) ( SURFACE-AT ?auto_14755 ?auto_14765 ) ( CLEAR ?auto_14755 ) ( IS-CRATE ?auto_14756 ) ( AVAILABLE ?auto_14760 ) ( not ( = ?auto_14762 ?auto_14765 ) ) ( not ( = ?auto_14763 ?auto_14762 ) ) ( HOIST-AT ?auto_14759 ?auto_14762 ) ( not ( = ?auto_14760 ?auto_14759 ) ) ( not ( = ?auto_14758 ?auto_14759 ) ) ( AVAILABLE ?auto_14759 ) ( SURFACE-AT ?auto_14756 ?auto_14762 ) ( ON ?auto_14756 ?auto_14764 ) ( CLEAR ?auto_14756 ) ( not ( = ?auto_14756 ?auto_14764 ) ) ( not ( = ?auto_14757 ?auto_14764 ) ) ( not ( = ?auto_14755 ?auto_14764 ) ) ( not ( = ?auto_14766 ?auto_14764 ) ) ( TRUCK-AT ?auto_14761 ?auto_14765 ) ( ON ?auto_14755 ?auto_14754 ) ( not ( = ?auto_14754 ?auto_14755 ) ) ( not ( = ?auto_14754 ?auto_14756 ) ) ( not ( = ?auto_14754 ?auto_14757 ) ) ( not ( = ?auto_14754 ?auto_14766 ) ) ( not ( = ?auto_14754 ?auto_14764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14755 ?auto_14756 ?auto_14757 )
      ( MAKE-3CRATE-VERIFY ?auto_14754 ?auto_14755 ?auto_14756 ?auto_14757 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14767 - SURFACE
      ?auto_14768 - SURFACE
      ?auto_14769 - SURFACE
      ?auto_14770 - SURFACE
      ?auto_14771 - SURFACE
    )
    :vars
    (
      ?auto_14774 - HOIST
      ?auto_14779 - PLACE
      ?auto_14777 - PLACE
      ?auto_14772 - HOIST
      ?auto_14780 - SURFACE
      ?auto_14776 - PLACE
      ?auto_14773 - HOIST
      ?auto_14778 - SURFACE
      ?auto_14775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14774 ?auto_14779 ) ( IS-CRATE ?auto_14771 ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14769 ?auto_14770 ) ) ( not ( = ?auto_14769 ?auto_14771 ) ) ( not ( = ?auto_14777 ?auto_14779 ) ) ( HOIST-AT ?auto_14772 ?auto_14777 ) ( not ( = ?auto_14774 ?auto_14772 ) ) ( AVAILABLE ?auto_14772 ) ( SURFACE-AT ?auto_14771 ?auto_14777 ) ( ON ?auto_14771 ?auto_14780 ) ( CLEAR ?auto_14771 ) ( not ( = ?auto_14770 ?auto_14780 ) ) ( not ( = ?auto_14771 ?auto_14780 ) ) ( not ( = ?auto_14769 ?auto_14780 ) ) ( SURFACE-AT ?auto_14769 ?auto_14779 ) ( CLEAR ?auto_14769 ) ( IS-CRATE ?auto_14770 ) ( AVAILABLE ?auto_14774 ) ( not ( = ?auto_14776 ?auto_14779 ) ) ( not ( = ?auto_14777 ?auto_14776 ) ) ( HOIST-AT ?auto_14773 ?auto_14776 ) ( not ( = ?auto_14774 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( AVAILABLE ?auto_14773 ) ( SURFACE-AT ?auto_14770 ?auto_14776 ) ( ON ?auto_14770 ?auto_14778 ) ( CLEAR ?auto_14770 ) ( not ( = ?auto_14770 ?auto_14778 ) ) ( not ( = ?auto_14771 ?auto_14778 ) ) ( not ( = ?auto_14769 ?auto_14778 ) ) ( not ( = ?auto_14780 ?auto_14778 ) ) ( TRUCK-AT ?auto_14775 ?auto_14779 ) ( ON ?auto_14768 ?auto_14767 ) ( ON ?auto_14769 ?auto_14768 ) ( not ( = ?auto_14767 ?auto_14768 ) ) ( not ( = ?auto_14767 ?auto_14769 ) ) ( not ( = ?auto_14767 ?auto_14770 ) ) ( not ( = ?auto_14767 ?auto_14771 ) ) ( not ( = ?auto_14767 ?auto_14780 ) ) ( not ( = ?auto_14767 ?auto_14778 ) ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( not ( = ?auto_14768 ?auto_14770 ) ) ( not ( = ?auto_14768 ?auto_14771 ) ) ( not ( = ?auto_14768 ?auto_14780 ) ) ( not ( = ?auto_14768 ?auto_14778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14769 ?auto_14770 ?auto_14771 )
      ( MAKE-4CRATE-VERIFY ?auto_14767 ?auto_14768 ?auto_14769 ?auto_14770 ?auto_14771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14781 - SURFACE
      ?auto_14782 - SURFACE
    )
    :vars
    (
      ?auto_14785 - HOIST
      ?auto_14791 - PLACE
      ?auto_14790 - SURFACE
      ?auto_14788 - PLACE
      ?auto_14783 - HOIST
      ?auto_14792 - SURFACE
      ?auto_14787 - PLACE
      ?auto_14784 - HOIST
      ?auto_14789 - SURFACE
      ?auto_14786 - TRUCK
      ?auto_14793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14785 ?auto_14791 ) ( IS-CRATE ?auto_14782 ) ( not ( = ?auto_14781 ?auto_14782 ) ) ( not ( = ?auto_14790 ?auto_14781 ) ) ( not ( = ?auto_14790 ?auto_14782 ) ) ( not ( = ?auto_14788 ?auto_14791 ) ) ( HOIST-AT ?auto_14783 ?auto_14788 ) ( not ( = ?auto_14785 ?auto_14783 ) ) ( AVAILABLE ?auto_14783 ) ( SURFACE-AT ?auto_14782 ?auto_14788 ) ( ON ?auto_14782 ?auto_14792 ) ( CLEAR ?auto_14782 ) ( not ( = ?auto_14781 ?auto_14792 ) ) ( not ( = ?auto_14782 ?auto_14792 ) ) ( not ( = ?auto_14790 ?auto_14792 ) ) ( IS-CRATE ?auto_14781 ) ( not ( = ?auto_14787 ?auto_14791 ) ) ( not ( = ?auto_14788 ?auto_14787 ) ) ( HOIST-AT ?auto_14784 ?auto_14787 ) ( not ( = ?auto_14785 ?auto_14784 ) ) ( not ( = ?auto_14783 ?auto_14784 ) ) ( AVAILABLE ?auto_14784 ) ( SURFACE-AT ?auto_14781 ?auto_14787 ) ( ON ?auto_14781 ?auto_14789 ) ( CLEAR ?auto_14781 ) ( not ( = ?auto_14781 ?auto_14789 ) ) ( not ( = ?auto_14782 ?auto_14789 ) ) ( not ( = ?auto_14790 ?auto_14789 ) ) ( not ( = ?auto_14792 ?auto_14789 ) ) ( TRUCK-AT ?auto_14786 ?auto_14791 ) ( SURFACE-AT ?auto_14793 ?auto_14791 ) ( CLEAR ?auto_14793 ) ( LIFTING ?auto_14785 ?auto_14790 ) ( IS-CRATE ?auto_14790 ) ( not ( = ?auto_14793 ?auto_14790 ) ) ( not ( = ?auto_14781 ?auto_14793 ) ) ( not ( = ?auto_14782 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14789 ?auto_14793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14793 ?auto_14790 )
      ( MAKE-2CRATE ?auto_14790 ?auto_14781 ?auto_14782 )
      ( MAKE-1CRATE-VERIFY ?auto_14781 ?auto_14782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14794 - SURFACE
      ?auto_14795 - SURFACE
      ?auto_14796 - SURFACE
    )
    :vars
    (
      ?auto_14805 - HOIST
      ?auto_14803 - PLACE
      ?auto_14800 - PLACE
      ?auto_14799 - HOIST
      ?auto_14802 - SURFACE
      ?auto_14798 - PLACE
      ?auto_14797 - HOIST
      ?auto_14804 - SURFACE
      ?auto_14806 - TRUCK
      ?auto_14801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14805 ?auto_14803 ) ( IS-CRATE ?auto_14796 ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14800 ?auto_14803 ) ) ( HOIST-AT ?auto_14799 ?auto_14800 ) ( not ( = ?auto_14805 ?auto_14799 ) ) ( AVAILABLE ?auto_14799 ) ( SURFACE-AT ?auto_14796 ?auto_14800 ) ( ON ?auto_14796 ?auto_14802 ) ( CLEAR ?auto_14796 ) ( not ( = ?auto_14795 ?auto_14802 ) ) ( not ( = ?auto_14796 ?auto_14802 ) ) ( not ( = ?auto_14794 ?auto_14802 ) ) ( IS-CRATE ?auto_14795 ) ( not ( = ?auto_14798 ?auto_14803 ) ) ( not ( = ?auto_14800 ?auto_14798 ) ) ( HOIST-AT ?auto_14797 ?auto_14798 ) ( not ( = ?auto_14805 ?auto_14797 ) ) ( not ( = ?auto_14799 ?auto_14797 ) ) ( AVAILABLE ?auto_14797 ) ( SURFACE-AT ?auto_14795 ?auto_14798 ) ( ON ?auto_14795 ?auto_14804 ) ( CLEAR ?auto_14795 ) ( not ( = ?auto_14795 ?auto_14804 ) ) ( not ( = ?auto_14796 ?auto_14804 ) ) ( not ( = ?auto_14794 ?auto_14804 ) ) ( not ( = ?auto_14802 ?auto_14804 ) ) ( TRUCK-AT ?auto_14806 ?auto_14803 ) ( SURFACE-AT ?auto_14801 ?auto_14803 ) ( CLEAR ?auto_14801 ) ( LIFTING ?auto_14805 ?auto_14794 ) ( IS-CRATE ?auto_14794 ) ( not ( = ?auto_14801 ?auto_14794 ) ) ( not ( = ?auto_14795 ?auto_14801 ) ) ( not ( = ?auto_14796 ?auto_14801 ) ) ( not ( = ?auto_14802 ?auto_14801 ) ) ( not ( = ?auto_14804 ?auto_14801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14795 ?auto_14796 )
      ( MAKE-2CRATE-VERIFY ?auto_14794 ?auto_14795 ?auto_14796 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14807 - SURFACE
      ?auto_14808 - SURFACE
      ?auto_14809 - SURFACE
      ?auto_14810 - SURFACE
    )
    :vars
    (
      ?auto_14815 - HOIST
      ?auto_14814 - PLACE
      ?auto_14818 - PLACE
      ?auto_14817 - HOIST
      ?auto_14812 - SURFACE
      ?auto_14813 - PLACE
      ?auto_14816 - HOIST
      ?auto_14819 - SURFACE
      ?auto_14811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14815 ?auto_14814 ) ( IS-CRATE ?auto_14810 ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14808 ?auto_14810 ) ) ( not ( = ?auto_14818 ?auto_14814 ) ) ( HOIST-AT ?auto_14817 ?auto_14818 ) ( not ( = ?auto_14815 ?auto_14817 ) ) ( AVAILABLE ?auto_14817 ) ( SURFACE-AT ?auto_14810 ?auto_14818 ) ( ON ?auto_14810 ?auto_14812 ) ( CLEAR ?auto_14810 ) ( not ( = ?auto_14809 ?auto_14812 ) ) ( not ( = ?auto_14810 ?auto_14812 ) ) ( not ( = ?auto_14808 ?auto_14812 ) ) ( IS-CRATE ?auto_14809 ) ( not ( = ?auto_14813 ?auto_14814 ) ) ( not ( = ?auto_14818 ?auto_14813 ) ) ( HOIST-AT ?auto_14816 ?auto_14813 ) ( not ( = ?auto_14815 ?auto_14816 ) ) ( not ( = ?auto_14817 ?auto_14816 ) ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14809 ?auto_14813 ) ( ON ?auto_14809 ?auto_14819 ) ( CLEAR ?auto_14809 ) ( not ( = ?auto_14809 ?auto_14819 ) ) ( not ( = ?auto_14810 ?auto_14819 ) ) ( not ( = ?auto_14808 ?auto_14819 ) ) ( not ( = ?auto_14812 ?auto_14819 ) ) ( TRUCK-AT ?auto_14811 ?auto_14814 ) ( SURFACE-AT ?auto_14807 ?auto_14814 ) ( CLEAR ?auto_14807 ) ( LIFTING ?auto_14815 ?auto_14808 ) ( IS-CRATE ?auto_14808 ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14809 ?auto_14807 ) ) ( not ( = ?auto_14810 ?auto_14807 ) ) ( not ( = ?auto_14812 ?auto_14807 ) ) ( not ( = ?auto_14819 ?auto_14807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14808 ?auto_14809 ?auto_14810 )
      ( MAKE-3CRATE-VERIFY ?auto_14807 ?auto_14808 ?auto_14809 ?auto_14810 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14820 - SURFACE
      ?auto_14821 - SURFACE
      ?auto_14822 - SURFACE
      ?auto_14823 - SURFACE
      ?auto_14824 - SURFACE
    )
    :vars
    (
      ?auto_14829 - HOIST
      ?auto_14828 - PLACE
      ?auto_14832 - PLACE
      ?auto_14831 - HOIST
      ?auto_14826 - SURFACE
      ?auto_14827 - PLACE
      ?auto_14830 - HOIST
      ?auto_14833 - SURFACE
      ?auto_14825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14829 ?auto_14828 ) ( IS-CRATE ?auto_14824 ) ( not ( = ?auto_14823 ?auto_14824 ) ) ( not ( = ?auto_14822 ?auto_14823 ) ) ( not ( = ?auto_14822 ?auto_14824 ) ) ( not ( = ?auto_14832 ?auto_14828 ) ) ( HOIST-AT ?auto_14831 ?auto_14832 ) ( not ( = ?auto_14829 ?auto_14831 ) ) ( AVAILABLE ?auto_14831 ) ( SURFACE-AT ?auto_14824 ?auto_14832 ) ( ON ?auto_14824 ?auto_14826 ) ( CLEAR ?auto_14824 ) ( not ( = ?auto_14823 ?auto_14826 ) ) ( not ( = ?auto_14824 ?auto_14826 ) ) ( not ( = ?auto_14822 ?auto_14826 ) ) ( IS-CRATE ?auto_14823 ) ( not ( = ?auto_14827 ?auto_14828 ) ) ( not ( = ?auto_14832 ?auto_14827 ) ) ( HOIST-AT ?auto_14830 ?auto_14827 ) ( not ( = ?auto_14829 ?auto_14830 ) ) ( not ( = ?auto_14831 ?auto_14830 ) ) ( AVAILABLE ?auto_14830 ) ( SURFACE-AT ?auto_14823 ?auto_14827 ) ( ON ?auto_14823 ?auto_14833 ) ( CLEAR ?auto_14823 ) ( not ( = ?auto_14823 ?auto_14833 ) ) ( not ( = ?auto_14824 ?auto_14833 ) ) ( not ( = ?auto_14822 ?auto_14833 ) ) ( not ( = ?auto_14826 ?auto_14833 ) ) ( TRUCK-AT ?auto_14825 ?auto_14828 ) ( SURFACE-AT ?auto_14821 ?auto_14828 ) ( CLEAR ?auto_14821 ) ( LIFTING ?auto_14829 ?auto_14822 ) ( IS-CRATE ?auto_14822 ) ( not ( = ?auto_14821 ?auto_14822 ) ) ( not ( = ?auto_14823 ?auto_14821 ) ) ( not ( = ?auto_14824 ?auto_14821 ) ) ( not ( = ?auto_14826 ?auto_14821 ) ) ( not ( = ?auto_14833 ?auto_14821 ) ) ( ON ?auto_14821 ?auto_14820 ) ( not ( = ?auto_14820 ?auto_14821 ) ) ( not ( = ?auto_14820 ?auto_14822 ) ) ( not ( = ?auto_14820 ?auto_14823 ) ) ( not ( = ?auto_14820 ?auto_14824 ) ) ( not ( = ?auto_14820 ?auto_14826 ) ) ( not ( = ?auto_14820 ?auto_14833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14822 ?auto_14823 ?auto_14824 )
      ( MAKE-4CRATE-VERIFY ?auto_14820 ?auto_14821 ?auto_14822 ?auto_14823 ?auto_14824 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14834 - SURFACE
      ?auto_14835 - SURFACE
    )
    :vars
    (
      ?auto_14841 - HOIST
      ?auto_14840 - PLACE
      ?auto_14843 - SURFACE
      ?auto_14845 - PLACE
      ?auto_14844 - HOIST
      ?auto_14837 - SURFACE
      ?auto_14838 - PLACE
      ?auto_14842 - HOIST
      ?auto_14846 - SURFACE
      ?auto_14836 - TRUCK
      ?auto_14839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14841 ?auto_14840 ) ( IS-CRATE ?auto_14835 ) ( not ( = ?auto_14834 ?auto_14835 ) ) ( not ( = ?auto_14843 ?auto_14834 ) ) ( not ( = ?auto_14843 ?auto_14835 ) ) ( not ( = ?auto_14845 ?auto_14840 ) ) ( HOIST-AT ?auto_14844 ?auto_14845 ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( AVAILABLE ?auto_14844 ) ( SURFACE-AT ?auto_14835 ?auto_14845 ) ( ON ?auto_14835 ?auto_14837 ) ( CLEAR ?auto_14835 ) ( not ( = ?auto_14834 ?auto_14837 ) ) ( not ( = ?auto_14835 ?auto_14837 ) ) ( not ( = ?auto_14843 ?auto_14837 ) ) ( IS-CRATE ?auto_14834 ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( not ( = ?auto_14845 ?auto_14838 ) ) ( HOIST-AT ?auto_14842 ?auto_14838 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14844 ?auto_14842 ) ) ( AVAILABLE ?auto_14842 ) ( SURFACE-AT ?auto_14834 ?auto_14838 ) ( ON ?auto_14834 ?auto_14846 ) ( CLEAR ?auto_14834 ) ( not ( = ?auto_14834 ?auto_14846 ) ) ( not ( = ?auto_14835 ?auto_14846 ) ) ( not ( = ?auto_14843 ?auto_14846 ) ) ( not ( = ?auto_14837 ?auto_14846 ) ) ( TRUCK-AT ?auto_14836 ?auto_14840 ) ( SURFACE-AT ?auto_14839 ?auto_14840 ) ( CLEAR ?auto_14839 ) ( IS-CRATE ?auto_14843 ) ( not ( = ?auto_14839 ?auto_14843 ) ) ( not ( = ?auto_14834 ?auto_14839 ) ) ( not ( = ?auto_14835 ?auto_14839 ) ) ( not ( = ?auto_14837 ?auto_14839 ) ) ( not ( = ?auto_14846 ?auto_14839 ) ) ( AVAILABLE ?auto_14841 ) ( IN ?auto_14843 ?auto_14836 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14841 ?auto_14843 ?auto_14836 ?auto_14840 )
      ( MAKE-2CRATE ?auto_14843 ?auto_14834 ?auto_14835 )
      ( MAKE-1CRATE-VERIFY ?auto_14834 ?auto_14835 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14847 - SURFACE
      ?auto_14848 - SURFACE
      ?auto_14849 - SURFACE
    )
    :vars
    (
      ?auto_14854 - HOIST
      ?auto_14856 - PLACE
      ?auto_14850 - PLACE
      ?auto_14857 - HOIST
      ?auto_14852 - SURFACE
      ?auto_14853 - PLACE
      ?auto_14859 - HOIST
      ?auto_14855 - SURFACE
      ?auto_14851 - TRUCK
      ?auto_14858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14854 ?auto_14856 ) ( IS-CRATE ?auto_14849 ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( not ( = ?auto_14847 ?auto_14848 ) ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( not ( = ?auto_14850 ?auto_14856 ) ) ( HOIST-AT ?auto_14857 ?auto_14850 ) ( not ( = ?auto_14854 ?auto_14857 ) ) ( AVAILABLE ?auto_14857 ) ( SURFACE-AT ?auto_14849 ?auto_14850 ) ( ON ?auto_14849 ?auto_14852 ) ( CLEAR ?auto_14849 ) ( not ( = ?auto_14848 ?auto_14852 ) ) ( not ( = ?auto_14849 ?auto_14852 ) ) ( not ( = ?auto_14847 ?auto_14852 ) ) ( IS-CRATE ?auto_14848 ) ( not ( = ?auto_14853 ?auto_14856 ) ) ( not ( = ?auto_14850 ?auto_14853 ) ) ( HOIST-AT ?auto_14859 ?auto_14853 ) ( not ( = ?auto_14854 ?auto_14859 ) ) ( not ( = ?auto_14857 ?auto_14859 ) ) ( AVAILABLE ?auto_14859 ) ( SURFACE-AT ?auto_14848 ?auto_14853 ) ( ON ?auto_14848 ?auto_14855 ) ( CLEAR ?auto_14848 ) ( not ( = ?auto_14848 ?auto_14855 ) ) ( not ( = ?auto_14849 ?auto_14855 ) ) ( not ( = ?auto_14847 ?auto_14855 ) ) ( not ( = ?auto_14852 ?auto_14855 ) ) ( TRUCK-AT ?auto_14851 ?auto_14856 ) ( SURFACE-AT ?auto_14858 ?auto_14856 ) ( CLEAR ?auto_14858 ) ( IS-CRATE ?auto_14847 ) ( not ( = ?auto_14858 ?auto_14847 ) ) ( not ( = ?auto_14848 ?auto_14858 ) ) ( not ( = ?auto_14849 ?auto_14858 ) ) ( not ( = ?auto_14852 ?auto_14858 ) ) ( not ( = ?auto_14855 ?auto_14858 ) ) ( AVAILABLE ?auto_14854 ) ( IN ?auto_14847 ?auto_14851 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14848 ?auto_14849 )
      ( MAKE-2CRATE-VERIFY ?auto_14847 ?auto_14848 ?auto_14849 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14860 - SURFACE
      ?auto_14861 - SURFACE
      ?auto_14862 - SURFACE
      ?auto_14863 - SURFACE
    )
    :vars
    (
      ?auto_14871 - HOIST
      ?auto_14869 - PLACE
      ?auto_14864 - PLACE
      ?auto_14865 - HOIST
      ?auto_14872 - SURFACE
      ?auto_14868 - PLACE
      ?auto_14867 - HOIST
      ?auto_14870 - SURFACE
      ?auto_14866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14871 ?auto_14869 ) ( IS-CRATE ?auto_14863 ) ( not ( = ?auto_14862 ?auto_14863 ) ) ( not ( = ?auto_14861 ?auto_14862 ) ) ( not ( = ?auto_14861 ?auto_14863 ) ) ( not ( = ?auto_14864 ?auto_14869 ) ) ( HOIST-AT ?auto_14865 ?auto_14864 ) ( not ( = ?auto_14871 ?auto_14865 ) ) ( AVAILABLE ?auto_14865 ) ( SURFACE-AT ?auto_14863 ?auto_14864 ) ( ON ?auto_14863 ?auto_14872 ) ( CLEAR ?auto_14863 ) ( not ( = ?auto_14862 ?auto_14872 ) ) ( not ( = ?auto_14863 ?auto_14872 ) ) ( not ( = ?auto_14861 ?auto_14872 ) ) ( IS-CRATE ?auto_14862 ) ( not ( = ?auto_14868 ?auto_14869 ) ) ( not ( = ?auto_14864 ?auto_14868 ) ) ( HOIST-AT ?auto_14867 ?auto_14868 ) ( not ( = ?auto_14871 ?auto_14867 ) ) ( not ( = ?auto_14865 ?auto_14867 ) ) ( AVAILABLE ?auto_14867 ) ( SURFACE-AT ?auto_14862 ?auto_14868 ) ( ON ?auto_14862 ?auto_14870 ) ( CLEAR ?auto_14862 ) ( not ( = ?auto_14862 ?auto_14870 ) ) ( not ( = ?auto_14863 ?auto_14870 ) ) ( not ( = ?auto_14861 ?auto_14870 ) ) ( not ( = ?auto_14872 ?auto_14870 ) ) ( TRUCK-AT ?auto_14866 ?auto_14869 ) ( SURFACE-AT ?auto_14860 ?auto_14869 ) ( CLEAR ?auto_14860 ) ( IS-CRATE ?auto_14861 ) ( not ( = ?auto_14860 ?auto_14861 ) ) ( not ( = ?auto_14862 ?auto_14860 ) ) ( not ( = ?auto_14863 ?auto_14860 ) ) ( not ( = ?auto_14872 ?auto_14860 ) ) ( not ( = ?auto_14870 ?auto_14860 ) ) ( AVAILABLE ?auto_14871 ) ( IN ?auto_14861 ?auto_14866 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14861 ?auto_14862 ?auto_14863 )
      ( MAKE-3CRATE-VERIFY ?auto_14860 ?auto_14861 ?auto_14862 ?auto_14863 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14873 - SURFACE
      ?auto_14874 - SURFACE
      ?auto_14875 - SURFACE
      ?auto_14876 - SURFACE
      ?auto_14877 - SURFACE
    )
    :vars
    (
      ?auto_14885 - HOIST
      ?auto_14883 - PLACE
      ?auto_14878 - PLACE
      ?auto_14879 - HOIST
      ?auto_14886 - SURFACE
      ?auto_14882 - PLACE
      ?auto_14881 - HOIST
      ?auto_14884 - SURFACE
      ?auto_14880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14885 ?auto_14883 ) ( IS-CRATE ?auto_14877 ) ( not ( = ?auto_14876 ?auto_14877 ) ) ( not ( = ?auto_14875 ?auto_14876 ) ) ( not ( = ?auto_14875 ?auto_14877 ) ) ( not ( = ?auto_14878 ?auto_14883 ) ) ( HOIST-AT ?auto_14879 ?auto_14878 ) ( not ( = ?auto_14885 ?auto_14879 ) ) ( AVAILABLE ?auto_14879 ) ( SURFACE-AT ?auto_14877 ?auto_14878 ) ( ON ?auto_14877 ?auto_14886 ) ( CLEAR ?auto_14877 ) ( not ( = ?auto_14876 ?auto_14886 ) ) ( not ( = ?auto_14877 ?auto_14886 ) ) ( not ( = ?auto_14875 ?auto_14886 ) ) ( IS-CRATE ?auto_14876 ) ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14878 ?auto_14882 ) ) ( HOIST-AT ?auto_14881 ?auto_14882 ) ( not ( = ?auto_14885 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( AVAILABLE ?auto_14881 ) ( SURFACE-AT ?auto_14876 ?auto_14882 ) ( ON ?auto_14876 ?auto_14884 ) ( CLEAR ?auto_14876 ) ( not ( = ?auto_14876 ?auto_14884 ) ) ( not ( = ?auto_14877 ?auto_14884 ) ) ( not ( = ?auto_14875 ?auto_14884 ) ) ( not ( = ?auto_14886 ?auto_14884 ) ) ( TRUCK-AT ?auto_14880 ?auto_14883 ) ( SURFACE-AT ?auto_14874 ?auto_14883 ) ( CLEAR ?auto_14874 ) ( IS-CRATE ?auto_14875 ) ( not ( = ?auto_14874 ?auto_14875 ) ) ( not ( = ?auto_14876 ?auto_14874 ) ) ( not ( = ?auto_14877 ?auto_14874 ) ) ( not ( = ?auto_14886 ?auto_14874 ) ) ( not ( = ?auto_14884 ?auto_14874 ) ) ( AVAILABLE ?auto_14885 ) ( IN ?auto_14875 ?auto_14880 ) ( ON ?auto_14874 ?auto_14873 ) ( not ( = ?auto_14873 ?auto_14874 ) ) ( not ( = ?auto_14873 ?auto_14875 ) ) ( not ( = ?auto_14873 ?auto_14876 ) ) ( not ( = ?auto_14873 ?auto_14877 ) ) ( not ( = ?auto_14873 ?auto_14886 ) ) ( not ( = ?auto_14873 ?auto_14884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14875 ?auto_14876 ?auto_14877 )
      ( MAKE-4CRATE-VERIFY ?auto_14873 ?auto_14874 ?auto_14875 ?auto_14876 ?auto_14877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14887 - SURFACE
      ?auto_14888 - SURFACE
    )
    :vars
    (
      ?auto_14898 - HOIST
      ?auto_14895 - PLACE
      ?auto_14891 - SURFACE
      ?auto_14889 - PLACE
      ?auto_14890 - HOIST
      ?auto_14899 - SURFACE
      ?auto_14894 - PLACE
      ?auto_14893 - HOIST
      ?auto_14897 - SURFACE
      ?auto_14896 - SURFACE
      ?auto_14892 - TRUCK
      ?auto_14900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14898 ?auto_14895 ) ( IS-CRATE ?auto_14888 ) ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14891 ?auto_14887 ) ) ( not ( = ?auto_14891 ?auto_14888 ) ) ( not ( = ?auto_14889 ?auto_14895 ) ) ( HOIST-AT ?auto_14890 ?auto_14889 ) ( not ( = ?auto_14898 ?auto_14890 ) ) ( AVAILABLE ?auto_14890 ) ( SURFACE-AT ?auto_14888 ?auto_14889 ) ( ON ?auto_14888 ?auto_14899 ) ( CLEAR ?auto_14888 ) ( not ( = ?auto_14887 ?auto_14899 ) ) ( not ( = ?auto_14888 ?auto_14899 ) ) ( not ( = ?auto_14891 ?auto_14899 ) ) ( IS-CRATE ?auto_14887 ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14889 ?auto_14894 ) ) ( HOIST-AT ?auto_14893 ?auto_14894 ) ( not ( = ?auto_14898 ?auto_14893 ) ) ( not ( = ?auto_14890 ?auto_14893 ) ) ( AVAILABLE ?auto_14893 ) ( SURFACE-AT ?auto_14887 ?auto_14894 ) ( ON ?auto_14887 ?auto_14897 ) ( CLEAR ?auto_14887 ) ( not ( = ?auto_14887 ?auto_14897 ) ) ( not ( = ?auto_14888 ?auto_14897 ) ) ( not ( = ?auto_14891 ?auto_14897 ) ) ( not ( = ?auto_14899 ?auto_14897 ) ) ( SURFACE-AT ?auto_14896 ?auto_14895 ) ( CLEAR ?auto_14896 ) ( IS-CRATE ?auto_14891 ) ( not ( = ?auto_14896 ?auto_14891 ) ) ( not ( = ?auto_14887 ?auto_14896 ) ) ( not ( = ?auto_14888 ?auto_14896 ) ) ( not ( = ?auto_14899 ?auto_14896 ) ) ( not ( = ?auto_14897 ?auto_14896 ) ) ( AVAILABLE ?auto_14898 ) ( IN ?auto_14891 ?auto_14892 ) ( TRUCK-AT ?auto_14892 ?auto_14900 ) ( not ( = ?auto_14900 ?auto_14895 ) ) ( not ( = ?auto_14889 ?auto_14900 ) ) ( not ( = ?auto_14894 ?auto_14900 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14892 ?auto_14900 ?auto_14895 )
      ( MAKE-2CRATE ?auto_14891 ?auto_14887 ?auto_14888 )
      ( MAKE-1CRATE-VERIFY ?auto_14887 ?auto_14888 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14901 - SURFACE
      ?auto_14902 - SURFACE
      ?auto_14903 - SURFACE
    )
    :vars
    (
      ?auto_14904 - HOIST
      ?auto_14910 - PLACE
      ?auto_14914 - PLACE
      ?auto_14907 - HOIST
      ?auto_14913 - SURFACE
      ?auto_14909 - PLACE
      ?auto_14911 - HOIST
      ?auto_14906 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14905 - TRUCK
      ?auto_14912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14904 ?auto_14910 ) ( IS-CRATE ?auto_14903 ) ( not ( = ?auto_14902 ?auto_14903 ) ) ( not ( = ?auto_14901 ?auto_14902 ) ) ( not ( = ?auto_14901 ?auto_14903 ) ) ( not ( = ?auto_14914 ?auto_14910 ) ) ( HOIST-AT ?auto_14907 ?auto_14914 ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( AVAILABLE ?auto_14907 ) ( SURFACE-AT ?auto_14903 ?auto_14914 ) ( ON ?auto_14903 ?auto_14913 ) ( CLEAR ?auto_14903 ) ( not ( = ?auto_14902 ?auto_14913 ) ) ( not ( = ?auto_14903 ?auto_14913 ) ) ( not ( = ?auto_14901 ?auto_14913 ) ) ( IS-CRATE ?auto_14902 ) ( not ( = ?auto_14909 ?auto_14910 ) ) ( not ( = ?auto_14914 ?auto_14909 ) ) ( HOIST-AT ?auto_14911 ?auto_14909 ) ( not ( = ?auto_14904 ?auto_14911 ) ) ( not ( = ?auto_14907 ?auto_14911 ) ) ( AVAILABLE ?auto_14911 ) ( SURFACE-AT ?auto_14902 ?auto_14909 ) ( ON ?auto_14902 ?auto_14906 ) ( CLEAR ?auto_14902 ) ( not ( = ?auto_14902 ?auto_14906 ) ) ( not ( = ?auto_14903 ?auto_14906 ) ) ( not ( = ?auto_14901 ?auto_14906 ) ) ( not ( = ?auto_14913 ?auto_14906 ) ) ( SURFACE-AT ?auto_14908 ?auto_14910 ) ( CLEAR ?auto_14908 ) ( IS-CRATE ?auto_14901 ) ( not ( = ?auto_14908 ?auto_14901 ) ) ( not ( = ?auto_14902 ?auto_14908 ) ) ( not ( = ?auto_14903 ?auto_14908 ) ) ( not ( = ?auto_14913 ?auto_14908 ) ) ( not ( = ?auto_14906 ?auto_14908 ) ) ( AVAILABLE ?auto_14904 ) ( IN ?auto_14901 ?auto_14905 ) ( TRUCK-AT ?auto_14905 ?auto_14912 ) ( not ( = ?auto_14912 ?auto_14910 ) ) ( not ( = ?auto_14914 ?auto_14912 ) ) ( not ( = ?auto_14909 ?auto_14912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14902 ?auto_14903 )
      ( MAKE-2CRATE-VERIFY ?auto_14901 ?auto_14902 ?auto_14903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14915 - SURFACE
      ?auto_14916 - SURFACE
      ?auto_14917 - SURFACE
      ?auto_14918 - SURFACE
    )
    :vars
    (
      ?auto_14927 - HOIST
      ?auto_14923 - PLACE
      ?auto_14920 - PLACE
      ?auto_14921 - HOIST
      ?auto_14925 - SURFACE
      ?auto_14924 - PLACE
      ?auto_14922 - HOIST
      ?auto_14928 - SURFACE
      ?auto_14926 - TRUCK
      ?auto_14919 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14927 ?auto_14923 ) ( IS-CRATE ?auto_14918 ) ( not ( = ?auto_14917 ?auto_14918 ) ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( not ( = ?auto_14916 ?auto_14918 ) ) ( not ( = ?auto_14920 ?auto_14923 ) ) ( HOIST-AT ?auto_14921 ?auto_14920 ) ( not ( = ?auto_14927 ?auto_14921 ) ) ( AVAILABLE ?auto_14921 ) ( SURFACE-AT ?auto_14918 ?auto_14920 ) ( ON ?auto_14918 ?auto_14925 ) ( CLEAR ?auto_14918 ) ( not ( = ?auto_14917 ?auto_14925 ) ) ( not ( = ?auto_14918 ?auto_14925 ) ) ( not ( = ?auto_14916 ?auto_14925 ) ) ( IS-CRATE ?auto_14917 ) ( not ( = ?auto_14924 ?auto_14923 ) ) ( not ( = ?auto_14920 ?auto_14924 ) ) ( HOIST-AT ?auto_14922 ?auto_14924 ) ( not ( = ?auto_14927 ?auto_14922 ) ) ( not ( = ?auto_14921 ?auto_14922 ) ) ( AVAILABLE ?auto_14922 ) ( SURFACE-AT ?auto_14917 ?auto_14924 ) ( ON ?auto_14917 ?auto_14928 ) ( CLEAR ?auto_14917 ) ( not ( = ?auto_14917 ?auto_14928 ) ) ( not ( = ?auto_14918 ?auto_14928 ) ) ( not ( = ?auto_14916 ?auto_14928 ) ) ( not ( = ?auto_14925 ?auto_14928 ) ) ( SURFACE-AT ?auto_14915 ?auto_14923 ) ( CLEAR ?auto_14915 ) ( IS-CRATE ?auto_14916 ) ( not ( = ?auto_14915 ?auto_14916 ) ) ( not ( = ?auto_14917 ?auto_14915 ) ) ( not ( = ?auto_14918 ?auto_14915 ) ) ( not ( = ?auto_14925 ?auto_14915 ) ) ( not ( = ?auto_14928 ?auto_14915 ) ) ( AVAILABLE ?auto_14927 ) ( IN ?auto_14916 ?auto_14926 ) ( TRUCK-AT ?auto_14926 ?auto_14919 ) ( not ( = ?auto_14919 ?auto_14923 ) ) ( not ( = ?auto_14920 ?auto_14919 ) ) ( not ( = ?auto_14924 ?auto_14919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14916 ?auto_14917 ?auto_14918 )
      ( MAKE-3CRATE-VERIFY ?auto_14915 ?auto_14916 ?auto_14917 ?auto_14918 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14929 - SURFACE
      ?auto_14930 - SURFACE
      ?auto_14931 - SURFACE
      ?auto_14932 - SURFACE
      ?auto_14933 - SURFACE
    )
    :vars
    (
      ?auto_14942 - HOIST
      ?auto_14938 - PLACE
      ?auto_14935 - PLACE
      ?auto_14936 - HOIST
      ?auto_14940 - SURFACE
      ?auto_14939 - PLACE
      ?auto_14937 - HOIST
      ?auto_14943 - SURFACE
      ?auto_14941 - TRUCK
      ?auto_14934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14942 ?auto_14938 ) ( IS-CRATE ?auto_14933 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14933 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( HOIST-AT ?auto_14936 ?auto_14935 ) ( not ( = ?auto_14942 ?auto_14936 ) ) ( AVAILABLE ?auto_14936 ) ( SURFACE-AT ?auto_14933 ?auto_14935 ) ( ON ?auto_14933 ?auto_14940 ) ( CLEAR ?auto_14933 ) ( not ( = ?auto_14932 ?auto_14940 ) ) ( not ( = ?auto_14933 ?auto_14940 ) ) ( not ( = ?auto_14931 ?auto_14940 ) ) ( IS-CRATE ?auto_14932 ) ( not ( = ?auto_14939 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( HOIST-AT ?auto_14937 ?auto_14939 ) ( not ( = ?auto_14942 ?auto_14937 ) ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( AVAILABLE ?auto_14937 ) ( SURFACE-AT ?auto_14932 ?auto_14939 ) ( ON ?auto_14932 ?auto_14943 ) ( CLEAR ?auto_14932 ) ( not ( = ?auto_14932 ?auto_14943 ) ) ( not ( = ?auto_14933 ?auto_14943 ) ) ( not ( = ?auto_14931 ?auto_14943 ) ) ( not ( = ?auto_14940 ?auto_14943 ) ) ( SURFACE-AT ?auto_14930 ?auto_14938 ) ( CLEAR ?auto_14930 ) ( IS-CRATE ?auto_14931 ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14932 ?auto_14930 ) ) ( not ( = ?auto_14933 ?auto_14930 ) ) ( not ( = ?auto_14940 ?auto_14930 ) ) ( not ( = ?auto_14943 ?auto_14930 ) ) ( AVAILABLE ?auto_14942 ) ( IN ?auto_14931 ?auto_14941 ) ( TRUCK-AT ?auto_14941 ?auto_14934 ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14934 ) ) ( not ( = ?auto_14939 ?auto_14934 ) ) ( ON ?auto_14930 ?auto_14929 ) ( not ( = ?auto_14929 ?auto_14930 ) ) ( not ( = ?auto_14929 ?auto_14931 ) ) ( not ( = ?auto_14929 ?auto_14932 ) ) ( not ( = ?auto_14929 ?auto_14933 ) ) ( not ( = ?auto_14929 ?auto_14940 ) ) ( not ( = ?auto_14929 ?auto_14943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14931 ?auto_14932 ?auto_14933 )
      ( MAKE-4CRATE-VERIFY ?auto_14929 ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14944 - SURFACE
      ?auto_14945 - SURFACE
    )
    :vars
    (
      ?auto_14955 - HOIST
      ?auto_14951 - PLACE
      ?auto_14957 - SURFACE
      ?auto_14947 - PLACE
      ?auto_14948 - HOIST
      ?auto_14953 - SURFACE
      ?auto_14952 - PLACE
      ?auto_14949 - HOIST
      ?auto_14956 - SURFACE
      ?auto_14950 - SURFACE
      ?auto_14954 - TRUCK
      ?auto_14946 - PLACE
      ?auto_14958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14955 ?auto_14951 ) ( IS-CRATE ?auto_14945 ) ( not ( = ?auto_14944 ?auto_14945 ) ) ( not ( = ?auto_14957 ?auto_14944 ) ) ( not ( = ?auto_14957 ?auto_14945 ) ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( HOIST-AT ?auto_14948 ?auto_14947 ) ( not ( = ?auto_14955 ?auto_14948 ) ) ( AVAILABLE ?auto_14948 ) ( SURFACE-AT ?auto_14945 ?auto_14947 ) ( ON ?auto_14945 ?auto_14953 ) ( CLEAR ?auto_14945 ) ( not ( = ?auto_14944 ?auto_14953 ) ) ( not ( = ?auto_14945 ?auto_14953 ) ) ( not ( = ?auto_14957 ?auto_14953 ) ) ( IS-CRATE ?auto_14944 ) ( not ( = ?auto_14952 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( HOIST-AT ?auto_14949 ?auto_14952 ) ( not ( = ?auto_14955 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( AVAILABLE ?auto_14949 ) ( SURFACE-AT ?auto_14944 ?auto_14952 ) ( ON ?auto_14944 ?auto_14956 ) ( CLEAR ?auto_14944 ) ( not ( = ?auto_14944 ?auto_14956 ) ) ( not ( = ?auto_14945 ?auto_14956 ) ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( not ( = ?auto_14953 ?auto_14956 ) ) ( SURFACE-AT ?auto_14950 ?auto_14951 ) ( CLEAR ?auto_14950 ) ( IS-CRATE ?auto_14957 ) ( not ( = ?auto_14950 ?auto_14957 ) ) ( not ( = ?auto_14944 ?auto_14950 ) ) ( not ( = ?auto_14945 ?auto_14950 ) ) ( not ( = ?auto_14953 ?auto_14950 ) ) ( not ( = ?auto_14956 ?auto_14950 ) ) ( AVAILABLE ?auto_14955 ) ( TRUCK-AT ?auto_14954 ?auto_14946 ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14946 ) ) ( not ( = ?auto_14952 ?auto_14946 ) ) ( HOIST-AT ?auto_14958 ?auto_14946 ) ( LIFTING ?auto_14958 ?auto_14957 ) ( not ( = ?auto_14955 ?auto_14958 ) ) ( not ( = ?auto_14948 ?auto_14958 ) ) ( not ( = ?auto_14949 ?auto_14958 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14958 ?auto_14957 ?auto_14954 ?auto_14946 )
      ( MAKE-2CRATE ?auto_14957 ?auto_14944 ?auto_14945 )
      ( MAKE-1CRATE-VERIFY ?auto_14944 ?auto_14945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14959 - SURFACE
      ?auto_14960 - SURFACE
      ?auto_14961 - SURFACE
    )
    :vars
    (
      ?auto_14968 - HOIST
      ?auto_14970 - PLACE
      ?auto_14967 - PLACE
      ?auto_14962 - HOIST
      ?auto_14973 - SURFACE
      ?auto_14972 - PLACE
      ?auto_14971 - HOIST
      ?auto_14966 - SURFACE
      ?auto_14965 - SURFACE
      ?auto_14969 - TRUCK
      ?auto_14963 - PLACE
      ?auto_14964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14968 ?auto_14970 ) ( IS-CRATE ?auto_14961 ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( not ( = ?auto_14959 ?auto_14960 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14967 ?auto_14970 ) ) ( HOIST-AT ?auto_14962 ?auto_14967 ) ( not ( = ?auto_14968 ?auto_14962 ) ) ( AVAILABLE ?auto_14962 ) ( SURFACE-AT ?auto_14961 ?auto_14967 ) ( ON ?auto_14961 ?auto_14973 ) ( CLEAR ?auto_14961 ) ( not ( = ?auto_14960 ?auto_14973 ) ) ( not ( = ?auto_14961 ?auto_14973 ) ) ( not ( = ?auto_14959 ?auto_14973 ) ) ( IS-CRATE ?auto_14960 ) ( not ( = ?auto_14972 ?auto_14970 ) ) ( not ( = ?auto_14967 ?auto_14972 ) ) ( HOIST-AT ?auto_14971 ?auto_14972 ) ( not ( = ?auto_14968 ?auto_14971 ) ) ( not ( = ?auto_14962 ?auto_14971 ) ) ( AVAILABLE ?auto_14971 ) ( SURFACE-AT ?auto_14960 ?auto_14972 ) ( ON ?auto_14960 ?auto_14966 ) ( CLEAR ?auto_14960 ) ( not ( = ?auto_14960 ?auto_14966 ) ) ( not ( = ?auto_14961 ?auto_14966 ) ) ( not ( = ?auto_14959 ?auto_14966 ) ) ( not ( = ?auto_14973 ?auto_14966 ) ) ( SURFACE-AT ?auto_14965 ?auto_14970 ) ( CLEAR ?auto_14965 ) ( IS-CRATE ?auto_14959 ) ( not ( = ?auto_14965 ?auto_14959 ) ) ( not ( = ?auto_14960 ?auto_14965 ) ) ( not ( = ?auto_14961 ?auto_14965 ) ) ( not ( = ?auto_14973 ?auto_14965 ) ) ( not ( = ?auto_14966 ?auto_14965 ) ) ( AVAILABLE ?auto_14968 ) ( TRUCK-AT ?auto_14969 ?auto_14963 ) ( not ( = ?auto_14963 ?auto_14970 ) ) ( not ( = ?auto_14967 ?auto_14963 ) ) ( not ( = ?auto_14972 ?auto_14963 ) ) ( HOIST-AT ?auto_14964 ?auto_14963 ) ( LIFTING ?auto_14964 ?auto_14959 ) ( not ( = ?auto_14968 ?auto_14964 ) ) ( not ( = ?auto_14962 ?auto_14964 ) ) ( not ( = ?auto_14971 ?auto_14964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14960 ?auto_14961 )
      ( MAKE-2CRATE-VERIFY ?auto_14959 ?auto_14960 ?auto_14961 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14974 - SURFACE
      ?auto_14975 - SURFACE
      ?auto_14976 - SURFACE
      ?auto_14977 - SURFACE
    )
    :vars
    (
      ?auto_14979 - HOIST
      ?auto_14981 - PLACE
      ?auto_14980 - PLACE
      ?auto_14988 - HOIST
      ?auto_14986 - SURFACE
      ?auto_14983 - PLACE
      ?auto_14987 - HOIST
      ?auto_14978 - SURFACE
      ?auto_14985 - TRUCK
      ?auto_14984 - PLACE
      ?auto_14982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14979 ?auto_14981 ) ( IS-CRATE ?auto_14977 ) ( not ( = ?auto_14976 ?auto_14977 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( not ( = ?auto_14975 ?auto_14977 ) ) ( not ( = ?auto_14980 ?auto_14981 ) ) ( HOIST-AT ?auto_14988 ?auto_14980 ) ( not ( = ?auto_14979 ?auto_14988 ) ) ( AVAILABLE ?auto_14988 ) ( SURFACE-AT ?auto_14977 ?auto_14980 ) ( ON ?auto_14977 ?auto_14986 ) ( CLEAR ?auto_14977 ) ( not ( = ?auto_14976 ?auto_14986 ) ) ( not ( = ?auto_14977 ?auto_14986 ) ) ( not ( = ?auto_14975 ?auto_14986 ) ) ( IS-CRATE ?auto_14976 ) ( not ( = ?auto_14983 ?auto_14981 ) ) ( not ( = ?auto_14980 ?auto_14983 ) ) ( HOIST-AT ?auto_14987 ?auto_14983 ) ( not ( = ?auto_14979 ?auto_14987 ) ) ( not ( = ?auto_14988 ?auto_14987 ) ) ( AVAILABLE ?auto_14987 ) ( SURFACE-AT ?auto_14976 ?auto_14983 ) ( ON ?auto_14976 ?auto_14978 ) ( CLEAR ?auto_14976 ) ( not ( = ?auto_14976 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14978 ) ) ( not ( = ?auto_14975 ?auto_14978 ) ) ( not ( = ?auto_14986 ?auto_14978 ) ) ( SURFACE-AT ?auto_14974 ?auto_14981 ) ( CLEAR ?auto_14974 ) ( IS-CRATE ?auto_14975 ) ( not ( = ?auto_14974 ?auto_14975 ) ) ( not ( = ?auto_14976 ?auto_14974 ) ) ( not ( = ?auto_14977 ?auto_14974 ) ) ( not ( = ?auto_14986 ?auto_14974 ) ) ( not ( = ?auto_14978 ?auto_14974 ) ) ( AVAILABLE ?auto_14979 ) ( TRUCK-AT ?auto_14985 ?auto_14984 ) ( not ( = ?auto_14984 ?auto_14981 ) ) ( not ( = ?auto_14980 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( HOIST-AT ?auto_14982 ?auto_14984 ) ( LIFTING ?auto_14982 ?auto_14975 ) ( not ( = ?auto_14979 ?auto_14982 ) ) ( not ( = ?auto_14988 ?auto_14982 ) ) ( not ( = ?auto_14987 ?auto_14982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14975 ?auto_14976 ?auto_14977 )
      ( MAKE-3CRATE-VERIFY ?auto_14974 ?auto_14975 ?auto_14976 ?auto_14977 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14989 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14991 - SURFACE
      ?auto_14992 - SURFACE
      ?auto_14993 - SURFACE
    )
    :vars
    (
      ?auto_14995 - HOIST
      ?auto_14997 - PLACE
      ?auto_14996 - PLACE
      ?auto_15004 - HOIST
      ?auto_15002 - SURFACE
      ?auto_14999 - PLACE
      ?auto_15003 - HOIST
      ?auto_14994 - SURFACE
      ?auto_15001 - TRUCK
      ?auto_15000 - PLACE
      ?auto_14998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14995 ?auto_14997 ) ( IS-CRATE ?auto_14993 ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14996 ?auto_14997 ) ) ( HOIST-AT ?auto_15004 ?auto_14996 ) ( not ( = ?auto_14995 ?auto_15004 ) ) ( AVAILABLE ?auto_15004 ) ( SURFACE-AT ?auto_14993 ?auto_14996 ) ( ON ?auto_14993 ?auto_15002 ) ( CLEAR ?auto_14993 ) ( not ( = ?auto_14992 ?auto_15002 ) ) ( not ( = ?auto_14993 ?auto_15002 ) ) ( not ( = ?auto_14991 ?auto_15002 ) ) ( IS-CRATE ?auto_14992 ) ( not ( = ?auto_14999 ?auto_14997 ) ) ( not ( = ?auto_14996 ?auto_14999 ) ) ( HOIST-AT ?auto_15003 ?auto_14999 ) ( not ( = ?auto_14995 ?auto_15003 ) ) ( not ( = ?auto_15004 ?auto_15003 ) ) ( AVAILABLE ?auto_15003 ) ( SURFACE-AT ?auto_14992 ?auto_14999 ) ( ON ?auto_14992 ?auto_14994 ) ( CLEAR ?auto_14992 ) ( not ( = ?auto_14992 ?auto_14994 ) ) ( not ( = ?auto_14993 ?auto_14994 ) ) ( not ( = ?auto_14991 ?auto_14994 ) ) ( not ( = ?auto_15002 ?auto_14994 ) ) ( SURFACE-AT ?auto_14990 ?auto_14997 ) ( CLEAR ?auto_14990 ) ( IS-CRATE ?auto_14991 ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14992 ?auto_14990 ) ) ( not ( = ?auto_14993 ?auto_14990 ) ) ( not ( = ?auto_15002 ?auto_14990 ) ) ( not ( = ?auto_14994 ?auto_14990 ) ) ( AVAILABLE ?auto_14995 ) ( TRUCK-AT ?auto_15001 ?auto_15000 ) ( not ( = ?auto_15000 ?auto_14997 ) ) ( not ( = ?auto_14996 ?auto_15000 ) ) ( not ( = ?auto_14999 ?auto_15000 ) ) ( HOIST-AT ?auto_14998 ?auto_15000 ) ( LIFTING ?auto_14998 ?auto_14991 ) ( not ( = ?auto_14995 ?auto_14998 ) ) ( not ( = ?auto_15004 ?auto_14998 ) ) ( not ( = ?auto_15003 ?auto_14998 ) ) ( ON ?auto_14990 ?auto_14989 ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( not ( = ?auto_14989 ?auto_14991 ) ) ( not ( = ?auto_14989 ?auto_14992 ) ) ( not ( = ?auto_14989 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_15002 ) ) ( not ( = ?auto_14989 ?auto_14994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14991 ?auto_14992 ?auto_14993 )
      ( MAKE-4CRATE-VERIFY ?auto_14989 ?auto_14990 ?auto_14991 ?auto_14992 ?auto_14993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15005 - SURFACE
      ?auto_15006 - SURFACE
    )
    :vars
    (
      ?auto_15008 - HOIST
      ?auto_15010 - PLACE
      ?auto_15013 - SURFACE
      ?auto_15009 - PLACE
      ?auto_15019 - HOIST
      ?auto_15017 - SURFACE
      ?auto_15012 - PLACE
      ?auto_15018 - HOIST
      ?auto_15007 - SURFACE
      ?auto_15014 - SURFACE
      ?auto_15016 - TRUCK
      ?auto_15015 - PLACE
      ?auto_15011 - HOIST
      ?auto_15020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15008 ?auto_15010 ) ( IS-CRATE ?auto_15006 ) ( not ( = ?auto_15005 ?auto_15006 ) ) ( not ( = ?auto_15013 ?auto_15005 ) ) ( not ( = ?auto_15013 ?auto_15006 ) ) ( not ( = ?auto_15009 ?auto_15010 ) ) ( HOIST-AT ?auto_15019 ?auto_15009 ) ( not ( = ?auto_15008 ?auto_15019 ) ) ( AVAILABLE ?auto_15019 ) ( SURFACE-AT ?auto_15006 ?auto_15009 ) ( ON ?auto_15006 ?auto_15017 ) ( CLEAR ?auto_15006 ) ( not ( = ?auto_15005 ?auto_15017 ) ) ( not ( = ?auto_15006 ?auto_15017 ) ) ( not ( = ?auto_15013 ?auto_15017 ) ) ( IS-CRATE ?auto_15005 ) ( not ( = ?auto_15012 ?auto_15010 ) ) ( not ( = ?auto_15009 ?auto_15012 ) ) ( HOIST-AT ?auto_15018 ?auto_15012 ) ( not ( = ?auto_15008 ?auto_15018 ) ) ( not ( = ?auto_15019 ?auto_15018 ) ) ( AVAILABLE ?auto_15018 ) ( SURFACE-AT ?auto_15005 ?auto_15012 ) ( ON ?auto_15005 ?auto_15007 ) ( CLEAR ?auto_15005 ) ( not ( = ?auto_15005 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15013 ?auto_15007 ) ) ( not ( = ?auto_15017 ?auto_15007 ) ) ( SURFACE-AT ?auto_15014 ?auto_15010 ) ( CLEAR ?auto_15014 ) ( IS-CRATE ?auto_15013 ) ( not ( = ?auto_15014 ?auto_15013 ) ) ( not ( = ?auto_15005 ?auto_15014 ) ) ( not ( = ?auto_15006 ?auto_15014 ) ) ( not ( = ?auto_15017 ?auto_15014 ) ) ( not ( = ?auto_15007 ?auto_15014 ) ) ( AVAILABLE ?auto_15008 ) ( TRUCK-AT ?auto_15016 ?auto_15015 ) ( not ( = ?auto_15015 ?auto_15010 ) ) ( not ( = ?auto_15009 ?auto_15015 ) ) ( not ( = ?auto_15012 ?auto_15015 ) ) ( HOIST-AT ?auto_15011 ?auto_15015 ) ( not ( = ?auto_15008 ?auto_15011 ) ) ( not ( = ?auto_15019 ?auto_15011 ) ) ( not ( = ?auto_15018 ?auto_15011 ) ) ( AVAILABLE ?auto_15011 ) ( SURFACE-AT ?auto_15013 ?auto_15015 ) ( ON ?auto_15013 ?auto_15020 ) ( CLEAR ?auto_15013 ) ( not ( = ?auto_15005 ?auto_15020 ) ) ( not ( = ?auto_15006 ?auto_15020 ) ) ( not ( = ?auto_15013 ?auto_15020 ) ) ( not ( = ?auto_15017 ?auto_15020 ) ) ( not ( = ?auto_15007 ?auto_15020 ) ) ( not ( = ?auto_15014 ?auto_15020 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15011 ?auto_15013 ?auto_15020 ?auto_15015 )
      ( MAKE-2CRATE ?auto_15013 ?auto_15005 ?auto_15006 )
      ( MAKE-1CRATE-VERIFY ?auto_15005 ?auto_15006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15021 - SURFACE
      ?auto_15022 - SURFACE
      ?auto_15023 - SURFACE
    )
    :vars
    (
      ?auto_15027 - HOIST
      ?auto_15031 - PLACE
      ?auto_15032 - PLACE
      ?auto_15033 - HOIST
      ?auto_15034 - SURFACE
      ?auto_15030 - PLACE
      ?auto_15028 - HOIST
      ?auto_15036 - SURFACE
      ?auto_15029 - SURFACE
      ?auto_15025 - TRUCK
      ?auto_15026 - PLACE
      ?auto_15035 - HOIST
      ?auto_15024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15027 ?auto_15031 ) ( IS-CRATE ?auto_15023 ) ( not ( = ?auto_15022 ?auto_15023 ) ) ( not ( = ?auto_15021 ?auto_15022 ) ) ( not ( = ?auto_15021 ?auto_15023 ) ) ( not ( = ?auto_15032 ?auto_15031 ) ) ( HOIST-AT ?auto_15033 ?auto_15032 ) ( not ( = ?auto_15027 ?auto_15033 ) ) ( AVAILABLE ?auto_15033 ) ( SURFACE-AT ?auto_15023 ?auto_15032 ) ( ON ?auto_15023 ?auto_15034 ) ( CLEAR ?auto_15023 ) ( not ( = ?auto_15022 ?auto_15034 ) ) ( not ( = ?auto_15023 ?auto_15034 ) ) ( not ( = ?auto_15021 ?auto_15034 ) ) ( IS-CRATE ?auto_15022 ) ( not ( = ?auto_15030 ?auto_15031 ) ) ( not ( = ?auto_15032 ?auto_15030 ) ) ( HOIST-AT ?auto_15028 ?auto_15030 ) ( not ( = ?auto_15027 ?auto_15028 ) ) ( not ( = ?auto_15033 ?auto_15028 ) ) ( AVAILABLE ?auto_15028 ) ( SURFACE-AT ?auto_15022 ?auto_15030 ) ( ON ?auto_15022 ?auto_15036 ) ( CLEAR ?auto_15022 ) ( not ( = ?auto_15022 ?auto_15036 ) ) ( not ( = ?auto_15023 ?auto_15036 ) ) ( not ( = ?auto_15021 ?auto_15036 ) ) ( not ( = ?auto_15034 ?auto_15036 ) ) ( SURFACE-AT ?auto_15029 ?auto_15031 ) ( CLEAR ?auto_15029 ) ( IS-CRATE ?auto_15021 ) ( not ( = ?auto_15029 ?auto_15021 ) ) ( not ( = ?auto_15022 ?auto_15029 ) ) ( not ( = ?auto_15023 ?auto_15029 ) ) ( not ( = ?auto_15034 ?auto_15029 ) ) ( not ( = ?auto_15036 ?auto_15029 ) ) ( AVAILABLE ?auto_15027 ) ( TRUCK-AT ?auto_15025 ?auto_15026 ) ( not ( = ?auto_15026 ?auto_15031 ) ) ( not ( = ?auto_15032 ?auto_15026 ) ) ( not ( = ?auto_15030 ?auto_15026 ) ) ( HOIST-AT ?auto_15035 ?auto_15026 ) ( not ( = ?auto_15027 ?auto_15035 ) ) ( not ( = ?auto_15033 ?auto_15035 ) ) ( not ( = ?auto_15028 ?auto_15035 ) ) ( AVAILABLE ?auto_15035 ) ( SURFACE-AT ?auto_15021 ?auto_15026 ) ( ON ?auto_15021 ?auto_15024 ) ( CLEAR ?auto_15021 ) ( not ( = ?auto_15022 ?auto_15024 ) ) ( not ( = ?auto_15023 ?auto_15024 ) ) ( not ( = ?auto_15021 ?auto_15024 ) ) ( not ( = ?auto_15034 ?auto_15024 ) ) ( not ( = ?auto_15036 ?auto_15024 ) ) ( not ( = ?auto_15029 ?auto_15024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15022 ?auto_15023 )
      ( MAKE-2CRATE-VERIFY ?auto_15021 ?auto_15022 ?auto_15023 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15037 - SURFACE
      ?auto_15038 - SURFACE
      ?auto_15039 - SURFACE
      ?auto_15040 - SURFACE
    )
    :vars
    (
      ?auto_15049 - HOIST
      ?auto_15048 - PLACE
      ?auto_15051 - PLACE
      ?auto_15044 - HOIST
      ?auto_15043 - SURFACE
      ?auto_15045 - PLACE
      ?auto_15041 - HOIST
      ?auto_15042 - SURFACE
      ?auto_15050 - TRUCK
      ?auto_15047 - PLACE
      ?auto_15052 - HOIST
      ?auto_15046 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15049 ?auto_15048 ) ( IS-CRATE ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15038 ?auto_15039 ) ) ( not ( = ?auto_15038 ?auto_15040 ) ) ( not ( = ?auto_15051 ?auto_15048 ) ) ( HOIST-AT ?auto_15044 ?auto_15051 ) ( not ( = ?auto_15049 ?auto_15044 ) ) ( AVAILABLE ?auto_15044 ) ( SURFACE-AT ?auto_15040 ?auto_15051 ) ( ON ?auto_15040 ?auto_15043 ) ( CLEAR ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15043 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15038 ?auto_15043 ) ) ( IS-CRATE ?auto_15039 ) ( not ( = ?auto_15045 ?auto_15048 ) ) ( not ( = ?auto_15051 ?auto_15045 ) ) ( HOIST-AT ?auto_15041 ?auto_15045 ) ( not ( = ?auto_15049 ?auto_15041 ) ) ( not ( = ?auto_15044 ?auto_15041 ) ) ( AVAILABLE ?auto_15041 ) ( SURFACE-AT ?auto_15039 ?auto_15045 ) ( ON ?auto_15039 ?auto_15042 ) ( CLEAR ?auto_15039 ) ( not ( = ?auto_15039 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15038 ?auto_15042 ) ) ( not ( = ?auto_15043 ?auto_15042 ) ) ( SURFACE-AT ?auto_15037 ?auto_15048 ) ( CLEAR ?auto_15037 ) ( IS-CRATE ?auto_15038 ) ( not ( = ?auto_15037 ?auto_15038 ) ) ( not ( = ?auto_15039 ?auto_15037 ) ) ( not ( = ?auto_15040 ?auto_15037 ) ) ( not ( = ?auto_15043 ?auto_15037 ) ) ( not ( = ?auto_15042 ?auto_15037 ) ) ( AVAILABLE ?auto_15049 ) ( TRUCK-AT ?auto_15050 ?auto_15047 ) ( not ( = ?auto_15047 ?auto_15048 ) ) ( not ( = ?auto_15051 ?auto_15047 ) ) ( not ( = ?auto_15045 ?auto_15047 ) ) ( HOIST-AT ?auto_15052 ?auto_15047 ) ( not ( = ?auto_15049 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15041 ?auto_15052 ) ) ( AVAILABLE ?auto_15052 ) ( SURFACE-AT ?auto_15038 ?auto_15047 ) ( ON ?auto_15038 ?auto_15046 ) ( CLEAR ?auto_15038 ) ( not ( = ?auto_15039 ?auto_15046 ) ) ( not ( = ?auto_15040 ?auto_15046 ) ) ( not ( = ?auto_15038 ?auto_15046 ) ) ( not ( = ?auto_15043 ?auto_15046 ) ) ( not ( = ?auto_15042 ?auto_15046 ) ) ( not ( = ?auto_15037 ?auto_15046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15038 ?auto_15039 ?auto_15040 )
      ( MAKE-3CRATE-VERIFY ?auto_15037 ?auto_15038 ?auto_15039 ?auto_15040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15053 - SURFACE
      ?auto_15054 - SURFACE
      ?auto_15055 - SURFACE
      ?auto_15056 - SURFACE
      ?auto_15057 - SURFACE
    )
    :vars
    (
      ?auto_15066 - HOIST
      ?auto_15065 - PLACE
      ?auto_15068 - PLACE
      ?auto_15061 - HOIST
      ?auto_15060 - SURFACE
      ?auto_15062 - PLACE
      ?auto_15058 - HOIST
      ?auto_15059 - SURFACE
      ?auto_15067 - TRUCK
      ?auto_15064 - PLACE
      ?auto_15069 - HOIST
      ?auto_15063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15066 ?auto_15065 ) ( IS-CRATE ?auto_15057 ) ( not ( = ?auto_15056 ?auto_15057 ) ) ( not ( = ?auto_15055 ?auto_15056 ) ) ( not ( = ?auto_15055 ?auto_15057 ) ) ( not ( = ?auto_15068 ?auto_15065 ) ) ( HOIST-AT ?auto_15061 ?auto_15068 ) ( not ( = ?auto_15066 ?auto_15061 ) ) ( AVAILABLE ?auto_15061 ) ( SURFACE-AT ?auto_15057 ?auto_15068 ) ( ON ?auto_15057 ?auto_15060 ) ( CLEAR ?auto_15057 ) ( not ( = ?auto_15056 ?auto_15060 ) ) ( not ( = ?auto_15057 ?auto_15060 ) ) ( not ( = ?auto_15055 ?auto_15060 ) ) ( IS-CRATE ?auto_15056 ) ( not ( = ?auto_15062 ?auto_15065 ) ) ( not ( = ?auto_15068 ?auto_15062 ) ) ( HOIST-AT ?auto_15058 ?auto_15062 ) ( not ( = ?auto_15066 ?auto_15058 ) ) ( not ( = ?auto_15061 ?auto_15058 ) ) ( AVAILABLE ?auto_15058 ) ( SURFACE-AT ?auto_15056 ?auto_15062 ) ( ON ?auto_15056 ?auto_15059 ) ( CLEAR ?auto_15056 ) ( not ( = ?auto_15056 ?auto_15059 ) ) ( not ( = ?auto_15057 ?auto_15059 ) ) ( not ( = ?auto_15055 ?auto_15059 ) ) ( not ( = ?auto_15060 ?auto_15059 ) ) ( SURFACE-AT ?auto_15054 ?auto_15065 ) ( CLEAR ?auto_15054 ) ( IS-CRATE ?auto_15055 ) ( not ( = ?auto_15054 ?auto_15055 ) ) ( not ( = ?auto_15056 ?auto_15054 ) ) ( not ( = ?auto_15057 ?auto_15054 ) ) ( not ( = ?auto_15060 ?auto_15054 ) ) ( not ( = ?auto_15059 ?auto_15054 ) ) ( AVAILABLE ?auto_15066 ) ( TRUCK-AT ?auto_15067 ?auto_15064 ) ( not ( = ?auto_15064 ?auto_15065 ) ) ( not ( = ?auto_15068 ?auto_15064 ) ) ( not ( = ?auto_15062 ?auto_15064 ) ) ( HOIST-AT ?auto_15069 ?auto_15064 ) ( not ( = ?auto_15066 ?auto_15069 ) ) ( not ( = ?auto_15061 ?auto_15069 ) ) ( not ( = ?auto_15058 ?auto_15069 ) ) ( AVAILABLE ?auto_15069 ) ( SURFACE-AT ?auto_15055 ?auto_15064 ) ( ON ?auto_15055 ?auto_15063 ) ( CLEAR ?auto_15055 ) ( not ( = ?auto_15056 ?auto_15063 ) ) ( not ( = ?auto_15057 ?auto_15063 ) ) ( not ( = ?auto_15055 ?auto_15063 ) ) ( not ( = ?auto_15060 ?auto_15063 ) ) ( not ( = ?auto_15059 ?auto_15063 ) ) ( not ( = ?auto_15054 ?auto_15063 ) ) ( ON ?auto_15054 ?auto_15053 ) ( not ( = ?auto_15053 ?auto_15054 ) ) ( not ( = ?auto_15053 ?auto_15055 ) ) ( not ( = ?auto_15053 ?auto_15056 ) ) ( not ( = ?auto_15053 ?auto_15057 ) ) ( not ( = ?auto_15053 ?auto_15060 ) ) ( not ( = ?auto_15053 ?auto_15059 ) ) ( not ( = ?auto_15053 ?auto_15063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15055 ?auto_15056 ?auto_15057 )
      ( MAKE-4CRATE-VERIFY ?auto_15053 ?auto_15054 ?auto_15055 ?auto_15056 ?auto_15057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15070 - SURFACE
      ?auto_15071 - SURFACE
    )
    :vars
    (
      ?auto_15081 - HOIST
      ?auto_15080 - PLACE
      ?auto_15072 - SURFACE
      ?auto_15084 - PLACE
      ?auto_15076 - HOIST
      ?auto_15075 - SURFACE
      ?auto_15077 - PLACE
      ?auto_15073 - HOIST
      ?auto_15074 - SURFACE
      ?auto_15082 - SURFACE
      ?auto_15079 - PLACE
      ?auto_15085 - HOIST
      ?auto_15078 - SURFACE
      ?auto_15083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15081 ?auto_15080 ) ( IS-CRATE ?auto_15071 ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15072 ?auto_15070 ) ) ( not ( = ?auto_15072 ?auto_15071 ) ) ( not ( = ?auto_15084 ?auto_15080 ) ) ( HOIST-AT ?auto_15076 ?auto_15084 ) ( not ( = ?auto_15081 ?auto_15076 ) ) ( AVAILABLE ?auto_15076 ) ( SURFACE-AT ?auto_15071 ?auto_15084 ) ( ON ?auto_15071 ?auto_15075 ) ( CLEAR ?auto_15071 ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( not ( = ?auto_15071 ?auto_15075 ) ) ( not ( = ?auto_15072 ?auto_15075 ) ) ( IS-CRATE ?auto_15070 ) ( not ( = ?auto_15077 ?auto_15080 ) ) ( not ( = ?auto_15084 ?auto_15077 ) ) ( HOIST-AT ?auto_15073 ?auto_15077 ) ( not ( = ?auto_15081 ?auto_15073 ) ) ( not ( = ?auto_15076 ?auto_15073 ) ) ( AVAILABLE ?auto_15073 ) ( SURFACE-AT ?auto_15070 ?auto_15077 ) ( ON ?auto_15070 ?auto_15074 ) ( CLEAR ?auto_15070 ) ( not ( = ?auto_15070 ?auto_15074 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15075 ?auto_15074 ) ) ( SURFACE-AT ?auto_15082 ?auto_15080 ) ( CLEAR ?auto_15082 ) ( IS-CRATE ?auto_15072 ) ( not ( = ?auto_15082 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15082 ) ) ( not ( = ?auto_15071 ?auto_15082 ) ) ( not ( = ?auto_15075 ?auto_15082 ) ) ( not ( = ?auto_15074 ?auto_15082 ) ) ( AVAILABLE ?auto_15081 ) ( not ( = ?auto_15079 ?auto_15080 ) ) ( not ( = ?auto_15084 ?auto_15079 ) ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( HOIST-AT ?auto_15085 ?auto_15079 ) ( not ( = ?auto_15081 ?auto_15085 ) ) ( not ( = ?auto_15076 ?auto_15085 ) ) ( not ( = ?auto_15073 ?auto_15085 ) ) ( AVAILABLE ?auto_15085 ) ( SURFACE-AT ?auto_15072 ?auto_15079 ) ( ON ?auto_15072 ?auto_15078 ) ( CLEAR ?auto_15072 ) ( not ( = ?auto_15070 ?auto_15078 ) ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15082 ?auto_15078 ) ) ( TRUCK-AT ?auto_15083 ?auto_15080 ) )
    :subtasks
    ( ( !DRIVE ?auto_15083 ?auto_15080 ?auto_15079 )
      ( MAKE-2CRATE ?auto_15072 ?auto_15070 ?auto_15071 )
      ( MAKE-1CRATE-VERIFY ?auto_15070 ?auto_15071 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15086 - SURFACE
      ?auto_15087 - SURFACE
      ?auto_15088 - SURFACE
    )
    :vars
    (
      ?auto_15099 - HOIST
      ?auto_15095 - PLACE
      ?auto_15100 - PLACE
      ?auto_15101 - HOIST
      ?auto_15096 - SURFACE
      ?auto_15094 - PLACE
      ?auto_15093 - HOIST
      ?auto_15090 - SURFACE
      ?auto_15098 - SURFACE
      ?auto_15092 - PLACE
      ?auto_15089 - HOIST
      ?auto_15097 - SURFACE
      ?auto_15091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15099 ?auto_15095 ) ( IS-CRATE ?auto_15088 ) ( not ( = ?auto_15087 ?auto_15088 ) ) ( not ( = ?auto_15086 ?auto_15087 ) ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15100 ?auto_15095 ) ) ( HOIST-AT ?auto_15101 ?auto_15100 ) ( not ( = ?auto_15099 ?auto_15101 ) ) ( AVAILABLE ?auto_15101 ) ( SURFACE-AT ?auto_15088 ?auto_15100 ) ( ON ?auto_15088 ?auto_15096 ) ( CLEAR ?auto_15088 ) ( not ( = ?auto_15087 ?auto_15096 ) ) ( not ( = ?auto_15088 ?auto_15096 ) ) ( not ( = ?auto_15086 ?auto_15096 ) ) ( IS-CRATE ?auto_15087 ) ( not ( = ?auto_15094 ?auto_15095 ) ) ( not ( = ?auto_15100 ?auto_15094 ) ) ( HOIST-AT ?auto_15093 ?auto_15094 ) ( not ( = ?auto_15099 ?auto_15093 ) ) ( not ( = ?auto_15101 ?auto_15093 ) ) ( AVAILABLE ?auto_15093 ) ( SURFACE-AT ?auto_15087 ?auto_15094 ) ( ON ?auto_15087 ?auto_15090 ) ( CLEAR ?auto_15087 ) ( not ( = ?auto_15087 ?auto_15090 ) ) ( not ( = ?auto_15088 ?auto_15090 ) ) ( not ( = ?auto_15086 ?auto_15090 ) ) ( not ( = ?auto_15096 ?auto_15090 ) ) ( SURFACE-AT ?auto_15098 ?auto_15095 ) ( CLEAR ?auto_15098 ) ( IS-CRATE ?auto_15086 ) ( not ( = ?auto_15098 ?auto_15086 ) ) ( not ( = ?auto_15087 ?auto_15098 ) ) ( not ( = ?auto_15088 ?auto_15098 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( not ( = ?auto_15090 ?auto_15098 ) ) ( AVAILABLE ?auto_15099 ) ( not ( = ?auto_15092 ?auto_15095 ) ) ( not ( = ?auto_15100 ?auto_15092 ) ) ( not ( = ?auto_15094 ?auto_15092 ) ) ( HOIST-AT ?auto_15089 ?auto_15092 ) ( not ( = ?auto_15099 ?auto_15089 ) ) ( not ( = ?auto_15101 ?auto_15089 ) ) ( not ( = ?auto_15093 ?auto_15089 ) ) ( AVAILABLE ?auto_15089 ) ( SURFACE-AT ?auto_15086 ?auto_15092 ) ( ON ?auto_15086 ?auto_15097 ) ( CLEAR ?auto_15086 ) ( not ( = ?auto_15087 ?auto_15097 ) ) ( not ( = ?auto_15088 ?auto_15097 ) ) ( not ( = ?auto_15086 ?auto_15097 ) ) ( not ( = ?auto_15096 ?auto_15097 ) ) ( not ( = ?auto_15090 ?auto_15097 ) ) ( not ( = ?auto_15098 ?auto_15097 ) ) ( TRUCK-AT ?auto_15091 ?auto_15095 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15087 ?auto_15088 )
      ( MAKE-2CRATE-VERIFY ?auto_15086 ?auto_15087 ?auto_15088 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15102 - SURFACE
      ?auto_15103 - SURFACE
      ?auto_15104 - SURFACE
      ?auto_15105 - SURFACE
    )
    :vars
    (
      ?auto_15115 - HOIST
      ?auto_15117 - PLACE
      ?auto_15107 - PLACE
      ?auto_15111 - HOIST
      ?auto_15113 - SURFACE
      ?auto_15114 - PLACE
      ?auto_15112 - HOIST
      ?auto_15110 - SURFACE
      ?auto_15109 - PLACE
      ?auto_15108 - HOIST
      ?auto_15106 - SURFACE
      ?auto_15116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15115 ?auto_15117 ) ( IS-CRATE ?auto_15105 ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15103 ?auto_15104 ) ) ( not ( = ?auto_15103 ?auto_15105 ) ) ( not ( = ?auto_15107 ?auto_15117 ) ) ( HOIST-AT ?auto_15111 ?auto_15107 ) ( not ( = ?auto_15115 ?auto_15111 ) ) ( AVAILABLE ?auto_15111 ) ( SURFACE-AT ?auto_15105 ?auto_15107 ) ( ON ?auto_15105 ?auto_15113 ) ( CLEAR ?auto_15105 ) ( not ( = ?auto_15104 ?auto_15113 ) ) ( not ( = ?auto_15105 ?auto_15113 ) ) ( not ( = ?auto_15103 ?auto_15113 ) ) ( IS-CRATE ?auto_15104 ) ( not ( = ?auto_15114 ?auto_15117 ) ) ( not ( = ?auto_15107 ?auto_15114 ) ) ( HOIST-AT ?auto_15112 ?auto_15114 ) ( not ( = ?auto_15115 ?auto_15112 ) ) ( not ( = ?auto_15111 ?auto_15112 ) ) ( AVAILABLE ?auto_15112 ) ( SURFACE-AT ?auto_15104 ?auto_15114 ) ( ON ?auto_15104 ?auto_15110 ) ( CLEAR ?auto_15104 ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15105 ?auto_15110 ) ) ( not ( = ?auto_15103 ?auto_15110 ) ) ( not ( = ?auto_15113 ?auto_15110 ) ) ( SURFACE-AT ?auto_15102 ?auto_15117 ) ( CLEAR ?auto_15102 ) ( IS-CRATE ?auto_15103 ) ( not ( = ?auto_15102 ?auto_15103 ) ) ( not ( = ?auto_15104 ?auto_15102 ) ) ( not ( = ?auto_15105 ?auto_15102 ) ) ( not ( = ?auto_15113 ?auto_15102 ) ) ( not ( = ?auto_15110 ?auto_15102 ) ) ( AVAILABLE ?auto_15115 ) ( not ( = ?auto_15109 ?auto_15117 ) ) ( not ( = ?auto_15107 ?auto_15109 ) ) ( not ( = ?auto_15114 ?auto_15109 ) ) ( HOIST-AT ?auto_15108 ?auto_15109 ) ( not ( = ?auto_15115 ?auto_15108 ) ) ( not ( = ?auto_15111 ?auto_15108 ) ) ( not ( = ?auto_15112 ?auto_15108 ) ) ( AVAILABLE ?auto_15108 ) ( SURFACE-AT ?auto_15103 ?auto_15109 ) ( ON ?auto_15103 ?auto_15106 ) ( CLEAR ?auto_15103 ) ( not ( = ?auto_15104 ?auto_15106 ) ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( not ( = ?auto_15103 ?auto_15106 ) ) ( not ( = ?auto_15113 ?auto_15106 ) ) ( not ( = ?auto_15110 ?auto_15106 ) ) ( not ( = ?auto_15102 ?auto_15106 ) ) ( TRUCK-AT ?auto_15116 ?auto_15117 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15103 ?auto_15104 ?auto_15105 )
      ( MAKE-3CRATE-VERIFY ?auto_15102 ?auto_15103 ?auto_15104 ?auto_15105 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15118 - SURFACE
      ?auto_15119 - SURFACE
      ?auto_15120 - SURFACE
      ?auto_15121 - SURFACE
      ?auto_15122 - SURFACE
    )
    :vars
    (
      ?auto_15132 - HOIST
      ?auto_15134 - PLACE
      ?auto_15124 - PLACE
      ?auto_15128 - HOIST
      ?auto_15130 - SURFACE
      ?auto_15131 - PLACE
      ?auto_15129 - HOIST
      ?auto_15127 - SURFACE
      ?auto_15126 - PLACE
      ?auto_15125 - HOIST
      ?auto_15123 - SURFACE
      ?auto_15133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15132 ?auto_15134 ) ( IS-CRATE ?auto_15122 ) ( not ( = ?auto_15121 ?auto_15122 ) ) ( not ( = ?auto_15120 ?auto_15121 ) ) ( not ( = ?auto_15120 ?auto_15122 ) ) ( not ( = ?auto_15124 ?auto_15134 ) ) ( HOIST-AT ?auto_15128 ?auto_15124 ) ( not ( = ?auto_15132 ?auto_15128 ) ) ( AVAILABLE ?auto_15128 ) ( SURFACE-AT ?auto_15122 ?auto_15124 ) ( ON ?auto_15122 ?auto_15130 ) ( CLEAR ?auto_15122 ) ( not ( = ?auto_15121 ?auto_15130 ) ) ( not ( = ?auto_15122 ?auto_15130 ) ) ( not ( = ?auto_15120 ?auto_15130 ) ) ( IS-CRATE ?auto_15121 ) ( not ( = ?auto_15131 ?auto_15134 ) ) ( not ( = ?auto_15124 ?auto_15131 ) ) ( HOIST-AT ?auto_15129 ?auto_15131 ) ( not ( = ?auto_15132 ?auto_15129 ) ) ( not ( = ?auto_15128 ?auto_15129 ) ) ( AVAILABLE ?auto_15129 ) ( SURFACE-AT ?auto_15121 ?auto_15131 ) ( ON ?auto_15121 ?auto_15127 ) ( CLEAR ?auto_15121 ) ( not ( = ?auto_15121 ?auto_15127 ) ) ( not ( = ?auto_15122 ?auto_15127 ) ) ( not ( = ?auto_15120 ?auto_15127 ) ) ( not ( = ?auto_15130 ?auto_15127 ) ) ( SURFACE-AT ?auto_15119 ?auto_15134 ) ( CLEAR ?auto_15119 ) ( IS-CRATE ?auto_15120 ) ( not ( = ?auto_15119 ?auto_15120 ) ) ( not ( = ?auto_15121 ?auto_15119 ) ) ( not ( = ?auto_15122 ?auto_15119 ) ) ( not ( = ?auto_15130 ?auto_15119 ) ) ( not ( = ?auto_15127 ?auto_15119 ) ) ( AVAILABLE ?auto_15132 ) ( not ( = ?auto_15126 ?auto_15134 ) ) ( not ( = ?auto_15124 ?auto_15126 ) ) ( not ( = ?auto_15131 ?auto_15126 ) ) ( HOIST-AT ?auto_15125 ?auto_15126 ) ( not ( = ?auto_15132 ?auto_15125 ) ) ( not ( = ?auto_15128 ?auto_15125 ) ) ( not ( = ?auto_15129 ?auto_15125 ) ) ( AVAILABLE ?auto_15125 ) ( SURFACE-AT ?auto_15120 ?auto_15126 ) ( ON ?auto_15120 ?auto_15123 ) ( CLEAR ?auto_15120 ) ( not ( = ?auto_15121 ?auto_15123 ) ) ( not ( = ?auto_15122 ?auto_15123 ) ) ( not ( = ?auto_15120 ?auto_15123 ) ) ( not ( = ?auto_15130 ?auto_15123 ) ) ( not ( = ?auto_15127 ?auto_15123 ) ) ( not ( = ?auto_15119 ?auto_15123 ) ) ( TRUCK-AT ?auto_15133 ?auto_15134 ) ( ON ?auto_15119 ?auto_15118 ) ( not ( = ?auto_15118 ?auto_15119 ) ) ( not ( = ?auto_15118 ?auto_15120 ) ) ( not ( = ?auto_15118 ?auto_15121 ) ) ( not ( = ?auto_15118 ?auto_15122 ) ) ( not ( = ?auto_15118 ?auto_15130 ) ) ( not ( = ?auto_15118 ?auto_15127 ) ) ( not ( = ?auto_15118 ?auto_15123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15120 ?auto_15121 ?auto_15122 )
      ( MAKE-4CRATE-VERIFY ?auto_15118 ?auto_15119 ?auto_15120 ?auto_15121 ?auto_15122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15135 - SURFACE
      ?auto_15136 - SURFACE
    )
    :vars
    (
      ?auto_15148 - HOIST
      ?auto_15150 - PLACE
      ?auto_15146 - SURFACE
      ?auto_15138 - PLACE
      ?auto_15142 - HOIST
      ?auto_15145 - SURFACE
      ?auto_15147 - PLACE
      ?auto_15144 - HOIST
      ?auto_15141 - SURFACE
      ?auto_15143 - SURFACE
      ?auto_15140 - PLACE
      ?auto_15139 - HOIST
      ?auto_15137 - SURFACE
      ?auto_15149 - TRUCK
      ?auto_15151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15148 ?auto_15150 ) ( IS-CRATE ?auto_15136 ) ( not ( = ?auto_15135 ?auto_15136 ) ) ( not ( = ?auto_15146 ?auto_15135 ) ) ( not ( = ?auto_15146 ?auto_15136 ) ) ( not ( = ?auto_15138 ?auto_15150 ) ) ( HOIST-AT ?auto_15142 ?auto_15138 ) ( not ( = ?auto_15148 ?auto_15142 ) ) ( AVAILABLE ?auto_15142 ) ( SURFACE-AT ?auto_15136 ?auto_15138 ) ( ON ?auto_15136 ?auto_15145 ) ( CLEAR ?auto_15136 ) ( not ( = ?auto_15135 ?auto_15145 ) ) ( not ( = ?auto_15136 ?auto_15145 ) ) ( not ( = ?auto_15146 ?auto_15145 ) ) ( IS-CRATE ?auto_15135 ) ( not ( = ?auto_15147 ?auto_15150 ) ) ( not ( = ?auto_15138 ?auto_15147 ) ) ( HOIST-AT ?auto_15144 ?auto_15147 ) ( not ( = ?auto_15148 ?auto_15144 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( AVAILABLE ?auto_15144 ) ( SURFACE-AT ?auto_15135 ?auto_15147 ) ( ON ?auto_15135 ?auto_15141 ) ( CLEAR ?auto_15135 ) ( not ( = ?auto_15135 ?auto_15141 ) ) ( not ( = ?auto_15136 ?auto_15141 ) ) ( not ( = ?auto_15146 ?auto_15141 ) ) ( not ( = ?auto_15145 ?auto_15141 ) ) ( IS-CRATE ?auto_15146 ) ( not ( = ?auto_15143 ?auto_15146 ) ) ( not ( = ?auto_15135 ?auto_15143 ) ) ( not ( = ?auto_15136 ?auto_15143 ) ) ( not ( = ?auto_15145 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15140 ?auto_15150 ) ) ( not ( = ?auto_15138 ?auto_15140 ) ) ( not ( = ?auto_15147 ?auto_15140 ) ) ( HOIST-AT ?auto_15139 ?auto_15140 ) ( not ( = ?auto_15148 ?auto_15139 ) ) ( not ( = ?auto_15142 ?auto_15139 ) ) ( not ( = ?auto_15144 ?auto_15139 ) ) ( AVAILABLE ?auto_15139 ) ( SURFACE-AT ?auto_15146 ?auto_15140 ) ( ON ?auto_15146 ?auto_15137 ) ( CLEAR ?auto_15146 ) ( not ( = ?auto_15135 ?auto_15137 ) ) ( not ( = ?auto_15136 ?auto_15137 ) ) ( not ( = ?auto_15146 ?auto_15137 ) ) ( not ( = ?auto_15145 ?auto_15137 ) ) ( not ( = ?auto_15141 ?auto_15137 ) ) ( not ( = ?auto_15143 ?auto_15137 ) ) ( TRUCK-AT ?auto_15149 ?auto_15150 ) ( SURFACE-AT ?auto_15151 ?auto_15150 ) ( CLEAR ?auto_15151 ) ( LIFTING ?auto_15148 ?auto_15143 ) ( IS-CRATE ?auto_15143 ) ( not ( = ?auto_15151 ?auto_15143 ) ) ( not ( = ?auto_15135 ?auto_15151 ) ) ( not ( = ?auto_15136 ?auto_15151 ) ) ( not ( = ?auto_15146 ?auto_15151 ) ) ( not ( = ?auto_15145 ?auto_15151 ) ) ( not ( = ?auto_15141 ?auto_15151 ) ) ( not ( = ?auto_15137 ?auto_15151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15151 ?auto_15143 )
      ( MAKE-2CRATE ?auto_15146 ?auto_15135 ?auto_15136 )
      ( MAKE-1CRATE-VERIFY ?auto_15135 ?auto_15136 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15152 - SURFACE
      ?auto_15153 - SURFACE
      ?auto_15154 - SURFACE
    )
    :vars
    (
      ?auto_15161 - HOIST
      ?auto_15164 - PLACE
      ?auto_15156 - PLACE
      ?auto_15165 - HOIST
      ?auto_15160 - SURFACE
      ?auto_15159 - PLACE
      ?auto_15158 - HOIST
      ?auto_15168 - SURFACE
      ?auto_15166 - SURFACE
      ?auto_15163 - PLACE
      ?auto_15162 - HOIST
      ?auto_15157 - SURFACE
      ?auto_15155 - TRUCK
      ?auto_15167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15161 ?auto_15164 ) ( IS-CRATE ?auto_15154 ) ( not ( = ?auto_15153 ?auto_15154 ) ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( not ( = ?auto_15156 ?auto_15164 ) ) ( HOIST-AT ?auto_15165 ?auto_15156 ) ( not ( = ?auto_15161 ?auto_15165 ) ) ( AVAILABLE ?auto_15165 ) ( SURFACE-AT ?auto_15154 ?auto_15156 ) ( ON ?auto_15154 ?auto_15160 ) ( CLEAR ?auto_15154 ) ( not ( = ?auto_15153 ?auto_15160 ) ) ( not ( = ?auto_15154 ?auto_15160 ) ) ( not ( = ?auto_15152 ?auto_15160 ) ) ( IS-CRATE ?auto_15153 ) ( not ( = ?auto_15159 ?auto_15164 ) ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( HOIST-AT ?auto_15158 ?auto_15159 ) ( not ( = ?auto_15161 ?auto_15158 ) ) ( not ( = ?auto_15165 ?auto_15158 ) ) ( AVAILABLE ?auto_15158 ) ( SURFACE-AT ?auto_15153 ?auto_15159 ) ( ON ?auto_15153 ?auto_15168 ) ( CLEAR ?auto_15153 ) ( not ( = ?auto_15153 ?auto_15168 ) ) ( not ( = ?auto_15154 ?auto_15168 ) ) ( not ( = ?auto_15152 ?auto_15168 ) ) ( not ( = ?auto_15160 ?auto_15168 ) ) ( IS-CRATE ?auto_15152 ) ( not ( = ?auto_15166 ?auto_15152 ) ) ( not ( = ?auto_15153 ?auto_15166 ) ) ( not ( = ?auto_15154 ?auto_15166 ) ) ( not ( = ?auto_15160 ?auto_15166 ) ) ( not ( = ?auto_15168 ?auto_15166 ) ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( not ( = ?auto_15156 ?auto_15163 ) ) ( not ( = ?auto_15159 ?auto_15163 ) ) ( HOIST-AT ?auto_15162 ?auto_15163 ) ( not ( = ?auto_15161 ?auto_15162 ) ) ( not ( = ?auto_15165 ?auto_15162 ) ) ( not ( = ?auto_15158 ?auto_15162 ) ) ( AVAILABLE ?auto_15162 ) ( SURFACE-AT ?auto_15152 ?auto_15163 ) ( ON ?auto_15152 ?auto_15157 ) ( CLEAR ?auto_15152 ) ( not ( = ?auto_15153 ?auto_15157 ) ) ( not ( = ?auto_15154 ?auto_15157 ) ) ( not ( = ?auto_15152 ?auto_15157 ) ) ( not ( = ?auto_15160 ?auto_15157 ) ) ( not ( = ?auto_15168 ?auto_15157 ) ) ( not ( = ?auto_15166 ?auto_15157 ) ) ( TRUCK-AT ?auto_15155 ?auto_15164 ) ( SURFACE-AT ?auto_15167 ?auto_15164 ) ( CLEAR ?auto_15167 ) ( LIFTING ?auto_15161 ?auto_15166 ) ( IS-CRATE ?auto_15166 ) ( not ( = ?auto_15167 ?auto_15166 ) ) ( not ( = ?auto_15153 ?auto_15167 ) ) ( not ( = ?auto_15154 ?auto_15167 ) ) ( not ( = ?auto_15152 ?auto_15167 ) ) ( not ( = ?auto_15160 ?auto_15167 ) ) ( not ( = ?auto_15168 ?auto_15167 ) ) ( not ( = ?auto_15157 ?auto_15167 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15153 ?auto_15154 )
      ( MAKE-2CRATE-VERIFY ?auto_15152 ?auto_15153 ?auto_15154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15169 - SURFACE
      ?auto_15170 - SURFACE
      ?auto_15171 - SURFACE
      ?auto_15172 - SURFACE
    )
    :vars
    (
      ?auto_15175 - HOIST
      ?auto_15174 - PLACE
      ?auto_15176 - PLACE
      ?auto_15180 - HOIST
      ?auto_15181 - SURFACE
      ?auto_15184 - PLACE
      ?auto_15178 - HOIST
      ?auto_15177 - SURFACE
      ?auto_15182 - PLACE
      ?auto_15185 - HOIST
      ?auto_15173 - SURFACE
      ?auto_15183 - TRUCK
      ?auto_15179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15175 ?auto_15174 ) ( IS-CRATE ?auto_15172 ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( not ( = ?auto_15176 ?auto_15174 ) ) ( HOIST-AT ?auto_15180 ?auto_15176 ) ( not ( = ?auto_15175 ?auto_15180 ) ) ( AVAILABLE ?auto_15180 ) ( SURFACE-AT ?auto_15172 ?auto_15176 ) ( ON ?auto_15172 ?auto_15181 ) ( CLEAR ?auto_15172 ) ( not ( = ?auto_15171 ?auto_15181 ) ) ( not ( = ?auto_15172 ?auto_15181 ) ) ( not ( = ?auto_15170 ?auto_15181 ) ) ( IS-CRATE ?auto_15171 ) ( not ( = ?auto_15184 ?auto_15174 ) ) ( not ( = ?auto_15176 ?auto_15184 ) ) ( HOIST-AT ?auto_15178 ?auto_15184 ) ( not ( = ?auto_15175 ?auto_15178 ) ) ( not ( = ?auto_15180 ?auto_15178 ) ) ( AVAILABLE ?auto_15178 ) ( SURFACE-AT ?auto_15171 ?auto_15184 ) ( ON ?auto_15171 ?auto_15177 ) ( CLEAR ?auto_15171 ) ( not ( = ?auto_15171 ?auto_15177 ) ) ( not ( = ?auto_15172 ?auto_15177 ) ) ( not ( = ?auto_15170 ?auto_15177 ) ) ( not ( = ?auto_15181 ?auto_15177 ) ) ( IS-CRATE ?auto_15170 ) ( not ( = ?auto_15169 ?auto_15170 ) ) ( not ( = ?auto_15171 ?auto_15169 ) ) ( not ( = ?auto_15172 ?auto_15169 ) ) ( not ( = ?auto_15181 ?auto_15169 ) ) ( not ( = ?auto_15177 ?auto_15169 ) ) ( not ( = ?auto_15182 ?auto_15174 ) ) ( not ( = ?auto_15176 ?auto_15182 ) ) ( not ( = ?auto_15184 ?auto_15182 ) ) ( HOIST-AT ?auto_15185 ?auto_15182 ) ( not ( = ?auto_15175 ?auto_15185 ) ) ( not ( = ?auto_15180 ?auto_15185 ) ) ( not ( = ?auto_15178 ?auto_15185 ) ) ( AVAILABLE ?auto_15185 ) ( SURFACE-AT ?auto_15170 ?auto_15182 ) ( ON ?auto_15170 ?auto_15173 ) ( CLEAR ?auto_15170 ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15170 ?auto_15173 ) ) ( not ( = ?auto_15181 ?auto_15173 ) ) ( not ( = ?auto_15177 ?auto_15173 ) ) ( not ( = ?auto_15169 ?auto_15173 ) ) ( TRUCK-AT ?auto_15183 ?auto_15174 ) ( SURFACE-AT ?auto_15179 ?auto_15174 ) ( CLEAR ?auto_15179 ) ( LIFTING ?auto_15175 ?auto_15169 ) ( IS-CRATE ?auto_15169 ) ( not ( = ?auto_15179 ?auto_15169 ) ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15172 ?auto_15179 ) ) ( not ( = ?auto_15170 ?auto_15179 ) ) ( not ( = ?auto_15181 ?auto_15179 ) ) ( not ( = ?auto_15177 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15170 ?auto_15171 ?auto_15172 )
      ( MAKE-3CRATE-VERIFY ?auto_15169 ?auto_15170 ?auto_15171 ?auto_15172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15186 - SURFACE
      ?auto_15187 - SURFACE
      ?auto_15188 - SURFACE
      ?auto_15189 - SURFACE
      ?auto_15190 - SURFACE
    )
    :vars
    (
      ?auto_15193 - HOIST
      ?auto_15192 - PLACE
      ?auto_15194 - PLACE
      ?auto_15197 - HOIST
      ?auto_15198 - SURFACE
      ?auto_15201 - PLACE
      ?auto_15196 - HOIST
      ?auto_15195 - SURFACE
      ?auto_15199 - PLACE
      ?auto_15202 - HOIST
      ?auto_15191 - SURFACE
      ?auto_15200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15193 ?auto_15192 ) ( IS-CRATE ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) ( not ( = ?auto_15194 ?auto_15192 ) ) ( HOIST-AT ?auto_15197 ?auto_15194 ) ( not ( = ?auto_15193 ?auto_15197 ) ) ( AVAILABLE ?auto_15197 ) ( SURFACE-AT ?auto_15190 ?auto_15194 ) ( ON ?auto_15190 ?auto_15198 ) ( CLEAR ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15198 ) ) ( not ( = ?auto_15190 ?auto_15198 ) ) ( not ( = ?auto_15188 ?auto_15198 ) ) ( IS-CRATE ?auto_15189 ) ( not ( = ?auto_15201 ?auto_15192 ) ) ( not ( = ?auto_15194 ?auto_15201 ) ) ( HOIST-AT ?auto_15196 ?auto_15201 ) ( not ( = ?auto_15193 ?auto_15196 ) ) ( not ( = ?auto_15197 ?auto_15196 ) ) ( AVAILABLE ?auto_15196 ) ( SURFACE-AT ?auto_15189 ?auto_15201 ) ( ON ?auto_15189 ?auto_15195 ) ( CLEAR ?auto_15189 ) ( not ( = ?auto_15189 ?auto_15195 ) ) ( not ( = ?auto_15190 ?auto_15195 ) ) ( not ( = ?auto_15188 ?auto_15195 ) ) ( not ( = ?auto_15198 ?auto_15195 ) ) ( IS-CRATE ?auto_15188 ) ( not ( = ?auto_15187 ?auto_15188 ) ) ( not ( = ?auto_15189 ?auto_15187 ) ) ( not ( = ?auto_15190 ?auto_15187 ) ) ( not ( = ?auto_15198 ?auto_15187 ) ) ( not ( = ?auto_15195 ?auto_15187 ) ) ( not ( = ?auto_15199 ?auto_15192 ) ) ( not ( = ?auto_15194 ?auto_15199 ) ) ( not ( = ?auto_15201 ?auto_15199 ) ) ( HOIST-AT ?auto_15202 ?auto_15199 ) ( not ( = ?auto_15193 ?auto_15202 ) ) ( not ( = ?auto_15197 ?auto_15202 ) ) ( not ( = ?auto_15196 ?auto_15202 ) ) ( AVAILABLE ?auto_15202 ) ( SURFACE-AT ?auto_15188 ?auto_15199 ) ( ON ?auto_15188 ?auto_15191 ) ( CLEAR ?auto_15188 ) ( not ( = ?auto_15189 ?auto_15191 ) ) ( not ( = ?auto_15190 ?auto_15191 ) ) ( not ( = ?auto_15188 ?auto_15191 ) ) ( not ( = ?auto_15198 ?auto_15191 ) ) ( not ( = ?auto_15195 ?auto_15191 ) ) ( not ( = ?auto_15187 ?auto_15191 ) ) ( TRUCK-AT ?auto_15200 ?auto_15192 ) ( SURFACE-AT ?auto_15186 ?auto_15192 ) ( CLEAR ?auto_15186 ) ( LIFTING ?auto_15193 ?auto_15187 ) ( IS-CRATE ?auto_15187 ) ( not ( = ?auto_15186 ?auto_15187 ) ) ( not ( = ?auto_15189 ?auto_15186 ) ) ( not ( = ?auto_15190 ?auto_15186 ) ) ( not ( = ?auto_15188 ?auto_15186 ) ) ( not ( = ?auto_15198 ?auto_15186 ) ) ( not ( = ?auto_15195 ?auto_15186 ) ) ( not ( = ?auto_15191 ?auto_15186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15188 ?auto_15189 ?auto_15190 )
      ( MAKE-4CRATE-VERIFY ?auto_15186 ?auto_15187 ?auto_15188 ?auto_15189 ?auto_15190 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15203 - SURFACE
      ?auto_15204 - SURFACE
    )
    :vars
    (
      ?auto_15208 - HOIST
      ?auto_15207 - PLACE
      ?auto_15211 - SURFACE
      ?auto_15209 - PLACE
      ?auto_15214 - HOIST
      ?auto_15215 - SURFACE
      ?auto_15218 - PLACE
      ?auto_15212 - HOIST
      ?auto_15210 - SURFACE
      ?auto_15206 - SURFACE
      ?auto_15216 - PLACE
      ?auto_15219 - HOIST
      ?auto_15205 - SURFACE
      ?auto_15217 - TRUCK
      ?auto_15213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15208 ?auto_15207 ) ( IS-CRATE ?auto_15204 ) ( not ( = ?auto_15203 ?auto_15204 ) ) ( not ( = ?auto_15211 ?auto_15203 ) ) ( not ( = ?auto_15211 ?auto_15204 ) ) ( not ( = ?auto_15209 ?auto_15207 ) ) ( HOIST-AT ?auto_15214 ?auto_15209 ) ( not ( = ?auto_15208 ?auto_15214 ) ) ( AVAILABLE ?auto_15214 ) ( SURFACE-AT ?auto_15204 ?auto_15209 ) ( ON ?auto_15204 ?auto_15215 ) ( CLEAR ?auto_15204 ) ( not ( = ?auto_15203 ?auto_15215 ) ) ( not ( = ?auto_15204 ?auto_15215 ) ) ( not ( = ?auto_15211 ?auto_15215 ) ) ( IS-CRATE ?auto_15203 ) ( not ( = ?auto_15218 ?auto_15207 ) ) ( not ( = ?auto_15209 ?auto_15218 ) ) ( HOIST-AT ?auto_15212 ?auto_15218 ) ( not ( = ?auto_15208 ?auto_15212 ) ) ( not ( = ?auto_15214 ?auto_15212 ) ) ( AVAILABLE ?auto_15212 ) ( SURFACE-AT ?auto_15203 ?auto_15218 ) ( ON ?auto_15203 ?auto_15210 ) ( CLEAR ?auto_15203 ) ( not ( = ?auto_15203 ?auto_15210 ) ) ( not ( = ?auto_15204 ?auto_15210 ) ) ( not ( = ?auto_15211 ?auto_15210 ) ) ( not ( = ?auto_15215 ?auto_15210 ) ) ( IS-CRATE ?auto_15211 ) ( not ( = ?auto_15206 ?auto_15211 ) ) ( not ( = ?auto_15203 ?auto_15206 ) ) ( not ( = ?auto_15204 ?auto_15206 ) ) ( not ( = ?auto_15215 ?auto_15206 ) ) ( not ( = ?auto_15210 ?auto_15206 ) ) ( not ( = ?auto_15216 ?auto_15207 ) ) ( not ( = ?auto_15209 ?auto_15216 ) ) ( not ( = ?auto_15218 ?auto_15216 ) ) ( HOIST-AT ?auto_15219 ?auto_15216 ) ( not ( = ?auto_15208 ?auto_15219 ) ) ( not ( = ?auto_15214 ?auto_15219 ) ) ( not ( = ?auto_15212 ?auto_15219 ) ) ( AVAILABLE ?auto_15219 ) ( SURFACE-AT ?auto_15211 ?auto_15216 ) ( ON ?auto_15211 ?auto_15205 ) ( CLEAR ?auto_15211 ) ( not ( = ?auto_15203 ?auto_15205 ) ) ( not ( = ?auto_15204 ?auto_15205 ) ) ( not ( = ?auto_15211 ?auto_15205 ) ) ( not ( = ?auto_15215 ?auto_15205 ) ) ( not ( = ?auto_15210 ?auto_15205 ) ) ( not ( = ?auto_15206 ?auto_15205 ) ) ( TRUCK-AT ?auto_15217 ?auto_15207 ) ( SURFACE-AT ?auto_15213 ?auto_15207 ) ( CLEAR ?auto_15213 ) ( IS-CRATE ?auto_15206 ) ( not ( = ?auto_15213 ?auto_15206 ) ) ( not ( = ?auto_15203 ?auto_15213 ) ) ( not ( = ?auto_15204 ?auto_15213 ) ) ( not ( = ?auto_15211 ?auto_15213 ) ) ( not ( = ?auto_15215 ?auto_15213 ) ) ( not ( = ?auto_15210 ?auto_15213 ) ) ( not ( = ?auto_15205 ?auto_15213 ) ) ( AVAILABLE ?auto_15208 ) ( IN ?auto_15206 ?auto_15217 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15208 ?auto_15206 ?auto_15217 ?auto_15207 )
      ( MAKE-2CRATE ?auto_15211 ?auto_15203 ?auto_15204 )
      ( MAKE-1CRATE-VERIFY ?auto_15203 ?auto_15204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15220 - SURFACE
      ?auto_15221 - SURFACE
      ?auto_15222 - SURFACE
    )
    :vars
    (
      ?auto_15236 - HOIST
      ?auto_15224 - PLACE
      ?auto_15230 - PLACE
      ?auto_15225 - HOIST
      ?auto_15233 - SURFACE
      ?auto_15232 - PLACE
      ?auto_15227 - HOIST
      ?auto_15235 - SURFACE
      ?auto_15229 - SURFACE
      ?auto_15228 - PLACE
      ?auto_15234 - HOIST
      ?auto_15226 - SURFACE
      ?auto_15223 - TRUCK
      ?auto_15231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15236 ?auto_15224 ) ( IS-CRATE ?auto_15222 ) ( not ( = ?auto_15221 ?auto_15222 ) ) ( not ( = ?auto_15220 ?auto_15221 ) ) ( not ( = ?auto_15220 ?auto_15222 ) ) ( not ( = ?auto_15230 ?auto_15224 ) ) ( HOIST-AT ?auto_15225 ?auto_15230 ) ( not ( = ?auto_15236 ?auto_15225 ) ) ( AVAILABLE ?auto_15225 ) ( SURFACE-AT ?auto_15222 ?auto_15230 ) ( ON ?auto_15222 ?auto_15233 ) ( CLEAR ?auto_15222 ) ( not ( = ?auto_15221 ?auto_15233 ) ) ( not ( = ?auto_15222 ?auto_15233 ) ) ( not ( = ?auto_15220 ?auto_15233 ) ) ( IS-CRATE ?auto_15221 ) ( not ( = ?auto_15232 ?auto_15224 ) ) ( not ( = ?auto_15230 ?auto_15232 ) ) ( HOIST-AT ?auto_15227 ?auto_15232 ) ( not ( = ?auto_15236 ?auto_15227 ) ) ( not ( = ?auto_15225 ?auto_15227 ) ) ( AVAILABLE ?auto_15227 ) ( SURFACE-AT ?auto_15221 ?auto_15232 ) ( ON ?auto_15221 ?auto_15235 ) ( CLEAR ?auto_15221 ) ( not ( = ?auto_15221 ?auto_15235 ) ) ( not ( = ?auto_15222 ?auto_15235 ) ) ( not ( = ?auto_15220 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( IS-CRATE ?auto_15220 ) ( not ( = ?auto_15229 ?auto_15220 ) ) ( not ( = ?auto_15221 ?auto_15229 ) ) ( not ( = ?auto_15222 ?auto_15229 ) ) ( not ( = ?auto_15233 ?auto_15229 ) ) ( not ( = ?auto_15235 ?auto_15229 ) ) ( not ( = ?auto_15228 ?auto_15224 ) ) ( not ( = ?auto_15230 ?auto_15228 ) ) ( not ( = ?auto_15232 ?auto_15228 ) ) ( HOIST-AT ?auto_15234 ?auto_15228 ) ( not ( = ?auto_15236 ?auto_15234 ) ) ( not ( = ?auto_15225 ?auto_15234 ) ) ( not ( = ?auto_15227 ?auto_15234 ) ) ( AVAILABLE ?auto_15234 ) ( SURFACE-AT ?auto_15220 ?auto_15228 ) ( ON ?auto_15220 ?auto_15226 ) ( CLEAR ?auto_15220 ) ( not ( = ?auto_15221 ?auto_15226 ) ) ( not ( = ?auto_15222 ?auto_15226 ) ) ( not ( = ?auto_15220 ?auto_15226 ) ) ( not ( = ?auto_15233 ?auto_15226 ) ) ( not ( = ?auto_15235 ?auto_15226 ) ) ( not ( = ?auto_15229 ?auto_15226 ) ) ( TRUCK-AT ?auto_15223 ?auto_15224 ) ( SURFACE-AT ?auto_15231 ?auto_15224 ) ( CLEAR ?auto_15231 ) ( IS-CRATE ?auto_15229 ) ( not ( = ?auto_15231 ?auto_15229 ) ) ( not ( = ?auto_15221 ?auto_15231 ) ) ( not ( = ?auto_15222 ?auto_15231 ) ) ( not ( = ?auto_15220 ?auto_15231 ) ) ( not ( = ?auto_15233 ?auto_15231 ) ) ( not ( = ?auto_15235 ?auto_15231 ) ) ( not ( = ?auto_15226 ?auto_15231 ) ) ( AVAILABLE ?auto_15236 ) ( IN ?auto_15229 ?auto_15223 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15221 ?auto_15222 )
      ( MAKE-2CRATE-VERIFY ?auto_15220 ?auto_15221 ?auto_15222 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15237 - SURFACE
      ?auto_15238 - SURFACE
      ?auto_15239 - SURFACE
      ?auto_15240 - SURFACE
    )
    :vars
    (
      ?auto_15251 - HOIST
      ?auto_15246 - PLACE
      ?auto_15243 - PLACE
      ?auto_15242 - HOIST
      ?auto_15250 - SURFACE
      ?auto_15241 - PLACE
      ?auto_15248 - HOIST
      ?auto_15252 - SURFACE
      ?auto_15249 - PLACE
      ?auto_15253 - HOIST
      ?auto_15244 - SURFACE
      ?auto_15247 - TRUCK
      ?auto_15245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15251 ?auto_15246 ) ( IS-CRATE ?auto_15240 ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15238 ?auto_15239 ) ) ( not ( = ?auto_15238 ?auto_15240 ) ) ( not ( = ?auto_15243 ?auto_15246 ) ) ( HOIST-AT ?auto_15242 ?auto_15243 ) ( not ( = ?auto_15251 ?auto_15242 ) ) ( AVAILABLE ?auto_15242 ) ( SURFACE-AT ?auto_15240 ?auto_15243 ) ( ON ?auto_15240 ?auto_15250 ) ( CLEAR ?auto_15240 ) ( not ( = ?auto_15239 ?auto_15250 ) ) ( not ( = ?auto_15240 ?auto_15250 ) ) ( not ( = ?auto_15238 ?auto_15250 ) ) ( IS-CRATE ?auto_15239 ) ( not ( = ?auto_15241 ?auto_15246 ) ) ( not ( = ?auto_15243 ?auto_15241 ) ) ( HOIST-AT ?auto_15248 ?auto_15241 ) ( not ( = ?auto_15251 ?auto_15248 ) ) ( not ( = ?auto_15242 ?auto_15248 ) ) ( AVAILABLE ?auto_15248 ) ( SURFACE-AT ?auto_15239 ?auto_15241 ) ( ON ?auto_15239 ?auto_15252 ) ( CLEAR ?auto_15239 ) ( not ( = ?auto_15239 ?auto_15252 ) ) ( not ( = ?auto_15240 ?auto_15252 ) ) ( not ( = ?auto_15238 ?auto_15252 ) ) ( not ( = ?auto_15250 ?auto_15252 ) ) ( IS-CRATE ?auto_15238 ) ( not ( = ?auto_15237 ?auto_15238 ) ) ( not ( = ?auto_15239 ?auto_15237 ) ) ( not ( = ?auto_15240 ?auto_15237 ) ) ( not ( = ?auto_15250 ?auto_15237 ) ) ( not ( = ?auto_15252 ?auto_15237 ) ) ( not ( = ?auto_15249 ?auto_15246 ) ) ( not ( = ?auto_15243 ?auto_15249 ) ) ( not ( = ?auto_15241 ?auto_15249 ) ) ( HOIST-AT ?auto_15253 ?auto_15249 ) ( not ( = ?auto_15251 ?auto_15253 ) ) ( not ( = ?auto_15242 ?auto_15253 ) ) ( not ( = ?auto_15248 ?auto_15253 ) ) ( AVAILABLE ?auto_15253 ) ( SURFACE-AT ?auto_15238 ?auto_15249 ) ( ON ?auto_15238 ?auto_15244 ) ( CLEAR ?auto_15238 ) ( not ( = ?auto_15239 ?auto_15244 ) ) ( not ( = ?auto_15240 ?auto_15244 ) ) ( not ( = ?auto_15238 ?auto_15244 ) ) ( not ( = ?auto_15250 ?auto_15244 ) ) ( not ( = ?auto_15252 ?auto_15244 ) ) ( not ( = ?auto_15237 ?auto_15244 ) ) ( TRUCK-AT ?auto_15247 ?auto_15246 ) ( SURFACE-AT ?auto_15245 ?auto_15246 ) ( CLEAR ?auto_15245 ) ( IS-CRATE ?auto_15237 ) ( not ( = ?auto_15245 ?auto_15237 ) ) ( not ( = ?auto_15239 ?auto_15245 ) ) ( not ( = ?auto_15240 ?auto_15245 ) ) ( not ( = ?auto_15238 ?auto_15245 ) ) ( not ( = ?auto_15250 ?auto_15245 ) ) ( not ( = ?auto_15252 ?auto_15245 ) ) ( not ( = ?auto_15244 ?auto_15245 ) ) ( AVAILABLE ?auto_15251 ) ( IN ?auto_15237 ?auto_15247 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15238 ?auto_15239 ?auto_15240 )
      ( MAKE-3CRATE-VERIFY ?auto_15237 ?auto_15238 ?auto_15239 ?auto_15240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15254 - SURFACE
      ?auto_15255 - SURFACE
      ?auto_15256 - SURFACE
      ?auto_15257 - SURFACE
      ?auto_15258 - SURFACE
    )
    :vars
    (
      ?auto_15268 - HOIST
      ?auto_15263 - PLACE
      ?auto_15261 - PLACE
      ?auto_15260 - HOIST
      ?auto_15267 - SURFACE
      ?auto_15259 - PLACE
      ?auto_15265 - HOIST
      ?auto_15269 - SURFACE
      ?auto_15266 - PLACE
      ?auto_15270 - HOIST
      ?auto_15262 - SURFACE
      ?auto_15264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15268 ?auto_15263 ) ( IS-CRATE ?auto_15258 ) ( not ( = ?auto_15257 ?auto_15258 ) ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( not ( = ?auto_15256 ?auto_15258 ) ) ( not ( = ?auto_15261 ?auto_15263 ) ) ( HOIST-AT ?auto_15260 ?auto_15261 ) ( not ( = ?auto_15268 ?auto_15260 ) ) ( AVAILABLE ?auto_15260 ) ( SURFACE-AT ?auto_15258 ?auto_15261 ) ( ON ?auto_15258 ?auto_15267 ) ( CLEAR ?auto_15258 ) ( not ( = ?auto_15257 ?auto_15267 ) ) ( not ( = ?auto_15258 ?auto_15267 ) ) ( not ( = ?auto_15256 ?auto_15267 ) ) ( IS-CRATE ?auto_15257 ) ( not ( = ?auto_15259 ?auto_15263 ) ) ( not ( = ?auto_15261 ?auto_15259 ) ) ( HOIST-AT ?auto_15265 ?auto_15259 ) ( not ( = ?auto_15268 ?auto_15265 ) ) ( not ( = ?auto_15260 ?auto_15265 ) ) ( AVAILABLE ?auto_15265 ) ( SURFACE-AT ?auto_15257 ?auto_15259 ) ( ON ?auto_15257 ?auto_15269 ) ( CLEAR ?auto_15257 ) ( not ( = ?auto_15257 ?auto_15269 ) ) ( not ( = ?auto_15258 ?auto_15269 ) ) ( not ( = ?auto_15256 ?auto_15269 ) ) ( not ( = ?auto_15267 ?auto_15269 ) ) ( IS-CRATE ?auto_15256 ) ( not ( = ?auto_15255 ?auto_15256 ) ) ( not ( = ?auto_15257 ?auto_15255 ) ) ( not ( = ?auto_15258 ?auto_15255 ) ) ( not ( = ?auto_15267 ?auto_15255 ) ) ( not ( = ?auto_15269 ?auto_15255 ) ) ( not ( = ?auto_15266 ?auto_15263 ) ) ( not ( = ?auto_15261 ?auto_15266 ) ) ( not ( = ?auto_15259 ?auto_15266 ) ) ( HOIST-AT ?auto_15270 ?auto_15266 ) ( not ( = ?auto_15268 ?auto_15270 ) ) ( not ( = ?auto_15260 ?auto_15270 ) ) ( not ( = ?auto_15265 ?auto_15270 ) ) ( AVAILABLE ?auto_15270 ) ( SURFACE-AT ?auto_15256 ?auto_15266 ) ( ON ?auto_15256 ?auto_15262 ) ( CLEAR ?auto_15256 ) ( not ( = ?auto_15257 ?auto_15262 ) ) ( not ( = ?auto_15258 ?auto_15262 ) ) ( not ( = ?auto_15256 ?auto_15262 ) ) ( not ( = ?auto_15267 ?auto_15262 ) ) ( not ( = ?auto_15269 ?auto_15262 ) ) ( not ( = ?auto_15255 ?auto_15262 ) ) ( TRUCK-AT ?auto_15264 ?auto_15263 ) ( SURFACE-AT ?auto_15254 ?auto_15263 ) ( CLEAR ?auto_15254 ) ( IS-CRATE ?auto_15255 ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15257 ?auto_15254 ) ) ( not ( = ?auto_15258 ?auto_15254 ) ) ( not ( = ?auto_15256 ?auto_15254 ) ) ( not ( = ?auto_15267 ?auto_15254 ) ) ( not ( = ?auto_15269 ?auto_15254 ) ) ( not ( = ?auto_15262 ?auto_15254 ) ) ( AVAILABLE ?auto_15268 ) ( IN ?auto_15255 ?auto_15264 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15256 ?auto_15257 ?auto_15258 )
      ( MAKE-4CRATE-VERIFY ?auto_15254 ?auto_15255 ?auto_15256 ?auto_15257 ?auto_15258 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15271 - SURFACE
      ?auto_15272 - SURFACE
    )
    :vars
    (
      ?auto_15285 - HOIST
      ?auto_15279 - PLACE
      ?auto_15281 - SURFACE
      ?auto_15275 - PLACE
      ?auto_15274 - HOIST
      ?auto_15284 - SURFACE
      ?auto_15273 - PLACE
      ?auto_15282 - HOIST
      ?auto_15286 - SURFACE
      ?auto_15277 - SURFACE
      ?auto_15283 - PLACE
      ?auto_15287 - HOIST
      ?auto_15276 - SURFACE
      ?auto_15278 - SURFACE
      ?auto_15280 - TRUCK
      ?auto_15288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15285 ?auto_15279 ) ( IS-CRATE ?auto_15272 ) ( not ( = ?auto_15271 ?auto_15272 ) ) ( not ( = ?auto_15281 ?auto_15271 ) ) ( not ( = ?auto_15281 ?auto_15272 ) ) ( not ( = ?auto_15275 ?auto_15279 ) ) ( HOIST-AT ?auto_15274 ?auto_15275 ) ( not ( = ?auto_15285 ?auto_15274 ) ) ( AVAILABLE ?auto_15274 ) ( SURFACE-AT ?auto_15272 ?auto_15275 ) ( ON ?auto_15272 ?auto_15284 ) ( CLEAR ?auto_15272 ) ( not ( = ?auto_15271 ?auto_15284 ) ) ( not ( = ?auto_15272 ?auto_15284 ) ) ( not ( = ?auto_15281 ?auto_15284 ) ) ( IS-CRATE ?auto_15271 ) ( not ( = ?auto_15273 ?auto_15279 ) ) ( not ( = ?auto_15275 ?auto_15273 ) ) ( HOIST-AT ?auto_15282 ?auto_15273 ) ( not ( = ?auto_15285 ?auto_15282 ) ) ( not ( = ?auto_15274 ?auto_15282 ) ) ( AVAILABLE ?auto_15282 ) ( SURFACE-AT ?auto_15271 ?auto_15273 ) ( ON ?auto_15271 ?auto_15286 ) ( CLEAR ?auto_15271 ) ( not ( = ?auto_15271 ?auto_15286 ) ) ( not ( = ?auto_15272 ?auto_15286 ) ) ( not ( = ?auto_15281 ?auto_15286 ) ) ( not ( = ?auto_15284 ?auto_15286 ) ) ( IS-CRATE ?auto_15281 ) ( not ( = ?auto_15277 ?auto_15281 ) ) ( not ( = ?auto_15271 ?auto_15277 ) ) ( not ( = ?auto_15272 ?auto_15277 ) ) ( not ( = ?auto_15284 ?auto_15277 ) ) ( not ( = ?auto_15286 ?auto_15277 ) ) ( not ( = ?auto_15283 ?auto_15279 ) ) ( not ( = ?auto_15275 ?auto_15283 ) ) ( not ( = ?auto_15273 ?auto_15283 ) ) ( HOIST-AT ?auto_15287 ?auto_15283 ) ( not ( = ?auto_15285 ?auto_15287 ) ) ( not ( = ?auto_15274 ?auto_15287 ) ) ( not ( = ?auto_15282 ?auto_15287 ) ) ( AVAILABLE ?auto_15287 ) ( SURFACE-AT ?auto_15281 ?auto_15283 ) ( ON ?auto_15281 ?auto_15276 ) ( CLEAR ?auto_15281 ) ( not ( = ?auto_15271 ?auto_15276 ) ) ( not ( = ?auto_15272 ?auto_15276 ) ) ( not ( = ?auto_15281 ?auto_15276 ) ) ( not ( = ?auto_15284 ?auto_15276 ) ) ( not ( = ?auto_15286 ?auto_15276 ) ) ( not ( = ?auto_15277 ?auto_15276 ) ) ( SURFACE-AT ?auto_15278 ?auto_15279 ) ( CLEAR ?auto_15278 ) ( IS-CRATE ?auto_15277 ) ( not ( = ?auto_15278 ?auto_15277 ) ) ( not ( = ?auto_15271 ?auto_15278 ) ) ( not ( = ?auto_15272 ?auto_15278 ) ) ( not ( = ?auto_15281 ?auto_15278 ) ) ( not ( = ?auto_15284 ?auto_15278 ) ) ( not ( = ?auto_15286 ?auto_15278 ) ) ( not ( = ?auto_15276 ?auto_15278 ) ) ( AVAILABLE ?auto_15285 ) ( IN ?auto_15277 ?auto_15280 ) ( TRUCK-AT ?auto_15280 ?auto_15288 ) ( not ( = ?auto_15288 ?auto_15279 ) ) ( not ( = ?auto_15275 ?auto_15288 ) ) ( not ( = ?auto_15273 ?auto_15288 ) ) ( not ( = ?auto_15283 ?auto_15288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15280 ?auto_15288 ?auto_15279 )
      ( MAKE-2CRATE ?auto_15281 ?auto_15271 ?auto_15272 )
      ( MAKE-1CRATE-VERIFY ?auto_15271 ?auto_15272 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15289 - SURFACE
      ?auto_15290 - SURFACE
      ?auto_15291 - SURFACE
    )
    :vars
    (
      ?auto_15301 - HOIST
      ?auto_15294 - PLACE
      ?auto_15300 - PLACE
      ?auto_15305 - HOIST
      ?auto_15293 - SURFACE
      ?auto_15304 - PLACE
      ?auto_15296 - HOIST
      ?auto_15302 - SURFACE
      ?auto_15297 - SURFACE
      ?auto_15303 - PLACE
      ?auto_15299 - HOIST
      ?auto_15306 - SURFACE
      ?auto_15295 - SURFACE
      ?auto_15292 - TRUCK
      ?auto_15298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15301 ?auto_15294 ) ( IS-CRATE ?auto_15291 ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( not ( = ?auto_15289 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15291 ) ) ( not ( = ?auto_15300 ?auto_15294 ) ) ( HOIST-AT ?auto_15305 ?auto_15300 ) ( not ( = ?auto_15301 ?auto_15305 ) ) ( AVAILABLE ?auto_15305 ) ( SURFACE-AT ?auto_15291 ?auto_15300 ) ( ON ?auto_15291 ?auto_15293 ) ( CLEAR ?auto_15291 ) ( not ( = ?auto_15290 ?auto_15293 ) ) ( not ( = ?auto_15291 ?auto_15293 ) ) ( not ( = ?auto_15289 ?auto_15293 ) ) ( IS-CRATE ?auto_15290 ) ( not ( = ?auto_15304 ?auto_15294 ) ) ( not ( = ?auto_15300 ?auto_15304 ) ) ( HOIST-AT ?auto_15296 ?auto_15304 ) ( not ( = ?auto_15301 ?auto_15296 ) ) ( not ( = ?auto_15305 ?auto_15296 ) ) ( AVAILABLE ?auto_15296 ) ( SURFACE-AT ?auto_15290 ?auto_15304 ) ( ON ?auto_15290 ?auto_15302 ) ( CLEAR ?auto_15290 ) ( not ( = ?auto_15290 ?auto_15302 ) ) ( not ( = ?auto_15291 ?auto_15302 ) ) ( not ( = ?auto_15289 ?auto_15302 ) ) ( not ( = ?auto_15293 ?auto_15302 ) ) ( IS-CRATE ?auto_15289 ) ( not ( = ?auto_15297 ?auto_15289 ) ) ( not ( = ?auto_15290 ?auto_15297 ) ) ( not ( = ?auto_15291 ?auto_15297 ) ) ( not ( = ?auto_15293 ?auto_15297 ) ) ( not ( = ?auto_15302 ?auto_15297 ) ) ( not ( = ?auto_15303 ?auto_15294 ) ) ( not ( = ?auto_15300 ?auto_15303 ) ) ( not ( = ?auto_15304 ?auto_15303 ) ) ( HOIST-AT ?auto_15299 ?auto_15303 ) ( not ( = ?auto_15301 ?auto_15299 ) ) ( not ( = ?auto_15305 ?auto_15299 ) ) ( not ( = ?auto_15296 ?auto_15299 ) ) ( AVAILABLE ?auto_15299 ) ( SURFACE-AT ?auto_15289 ?auto_15303 ) ( ON ?auto_15289 ?auto_15306 ) ( CLEAR ?auto_15289 ) ( not ( = ?auto_15290 ?auto_15306 ) ) ( not ( = ?auto_15291 ?auto_15306 ) ) ( not ( = ?auto_15289 ?auto_15306 ) ) ( not ( = ?auto_15293 ?auto_15306 ) ) ( not ( = ?auto_15302 ?auto_15306 ) ) ( not ( = ?auto_15297 ?auto_15306 ) ) ( SURFACE-AT ?auto_15295 ?auto_15294 ) ( CLEAR ?auto_15295 ) ( IS-CRATE ?auto_15297 ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15290 ?auto_15295 ) ) ( not ( = ?auto_15291 ?auto_15295 ) ) ( not ( = ?auto_15289 ?auto_15295 ) ) ( not ( = ?auto_15293 ?auto_15295 ) ) ( not ( = ?auto_15302 ?auto_15295 ) ) ( not ( = ?auto_15306 ?auto_15295 ) ) ( AVAILABLE ?auto_15301 ) ( IN ?auto_15297 ?auto_15292 ) ( TRUCK-AT ?auto_15292 ?auto_15298 ) ( not ( = ?auto_15298 ?auto_15294 ) ) ( not ( = ?auto_15300 ?auto_15298 ) ) ( not ( = ?auto_15304 ?auto_15298 ) ) ( not ( = ?auto_15303 ?auto_15298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15290 ?auto_15291 )
      ( MAKE-2CRATE-VERIFY ?auto_15289 ?auto_15290 ?auto_15291 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15307 - SURFACE
      ?auto_15308 - SURFACE
      ?auto_15309 - SURFACE
      ?auto_15310 - SURFACE
    )
    :vars
    (
      ?auto_15321 - HOIST
      ?auto_15317 - PLACE
      ?auto_15320 - PLACE
      ?auto_15315 - HOIST
      ?auto_15319 - SURFACE
      ?auto_15324 - PLACE
      ?auto_15312 - HOIST
      ?auto_15323 - SURFACE
      ?auto_15311 - PLACE
      ?auto_15316 - HOIST
      ?auto_15318 - SURFACE
      ?auto_15314 - SURFACE
      ?auto_15313 - TRUCK
      ?auto_15322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15321 ?auto_15317 ) ( IS-CRATE ?auto_15310 ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15308 ?auto_15309 ) ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15320 ?auto_15317 ) ) ( HOIST-AT ?auto_15315 ?auto_15320 ) ( not ( = ?auto_15321 ?auto_15315 ) ) ( AVAILABLE ?auto_15315 ) ( SURFACE-AT ?auto_15310 ?auto_15320 ) ( ON ?auto_15310 ?auto_15319 ) ( CLEAR ?auto_15310 ) ( not ( = ?auto_15309 ?auto_15319 ) ) ( not ( = ?auto_15310 ?auto_15319 ) ) ( not ( = ?auto_15308 ?auto_15319 ) ) ( IS-CRATE ?auto_15309 ) ( not ( = ?auto_15324 ?auto_15317 ) ) ( not ( = ?auto_15320 ?auto_15324 ) ) ( HOIST-AT ?auto_15312 ?auto_15324 ) ( not ( = ?auto_15321 ?auto_15312 ) ) ( not ( = ?auto_15315 ?auto_15312 ) ) ( AVAILABLE ?auto_15312 ) ( SURFACE-AT ?auto_15309 ?auto_15324 ) ( ON ?auto_15309 ?auto_15323 ) ( CLEAR ?auto_15309 ) ( not ( = ?auto_15309 ?auto_15323 ) ) ( not ( = ?auto_15310 ?auto_15323 ) ) ( not ( = ?auto_15308 ?auto_15323 ) ) ( not ( = ?auto_15319 ?auto_15323 ) ) ( IS-CRATE ?auto_15308 ) ( not ( = ?auto_15307 ?auto_15308 ) ) ( not ( = ?auto_15309 ?auto_15307 ) ) ( not ( = ?auto_15310 ?auto_15307 ) ) ( not ( = ?auto_15319 ?auto_15307 ) ) ( not ( = ?auto_15323 ?auto_15307 ) ) ( not ( = ?auto_15311 ?auto_15317 ) ) ( not ( = ?auto_15320 ?auto_15311 ) ) ( not ( = ?auto_15324 ?auto_15311 ) ) ( HOIST-AT ?auto_15316 ?auto_15311 ) ( not ( = ?auto_15321 ?auto_15316 ) ) ( not ( = ?auto_15315 ?auto_15316 ) ) ( not ( = ?auto_15312 ?auto_15316 ) ) ( AVAILABLE ?auto_15316 ) ( SURFACE-AT ?auto_15308 ?auto_15311 ) ( ON ?auto_15308 ?auto_15318 ) ( CLEAR ?auto_15308 ) ( not ( = ?auto_15309 ?auto_15318 ) ) ( not ( = ?auto_15310 ?auto_15318 ) ) ( not ( = ?auto_15308 ?auto_15318 ) ) ( not ( = ?auto_15319 ?auto_15318 ) ) ( not ( = ?auto_15323 ?auto_15318 ) ) ( not ( = ?auto_15307 ?auto_15318 ) ) ( SURFACE-AT ?auto_15314 ?auto_15317 ) ( CLEAR ?auto_15314 ) ( IS-CRATE ?auto_15307 ) ( not ( = ?auto_15314 ?auto_15307 ) ) ( not ( = ?auto_15309 ?auto_15314 ) ) ( not ( = ?auto_15310 ?auto_15314 ) ) ( not ( = ?auto_15308 ?auto_15314 ) ) ( not ( = ?auto_15319 ?auto_15314 ) ) ( not ( = ?auto_15323 ?auto_15314 ) ) ( not ( = ?auto_15318 ?auto_15314 ) ) ( AVAILABLE ?auto_15321 ) ( IN ?auto_15307 ?auto_15313 ) ( TRUCK-AT ?auto_15313 ?auto_15322 ) ( not ( = ?auto_15322 ?auto_15317 ) ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15324 ?auto_15322 ) ) ( not ( = ?auto_15311 ?auto_15322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15308 ?auto_15309 ?auto_15310 )
      ( MAKE-3CRATE-VERIFY ?auto_15307 ?auto_15308 ?auto_15309 ?auto_15310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15325 - SURFACE
      ?auto_15326 - SURFACE
      ?auto_15327 - SURFACE
      ?auto_15328 - SURFACE
      ?auto_15329 - SURFACE
    )
    :vars
    (
      ?auto_15339 - HOIST
      ?auto_15335 - PLACE
      ?auto_15338 - PLACE
      ?auto_15333 - HOIST
      ?auto_15337 - SURFACE
      ?auto_15342 - PLACE
      ?auto_15331 - HOIST
      ?auto_15341 - SURFACE
      ?auto_15330 - PLACE
      ?auto_15334 - HOIST
      ?auto_15336 - SURFACE
      ?auto_15332 - TRUCK
      ?auto_15340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15339 ?auto_15335 ) ( IS-CRATE ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15329 ) ) ( not ( = ?auto_15338 ?auto_15335 ) ) ( HOIST-AT ?auto_15333 ?auto_15338 ) ( not ( = ?auto_15339 ?auto_15333 ) ) ( AVAILABLE ?auto_15333 ) ( SURFACE-AT ?auto_15329 ?auto_15338 ) ( ON ?auto_15329 ?auto_15337 ) ( CLEAR ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15337 ) ) ( not ( = ?auto_15329 ?auto_15337 ) ) ( not ( = ?auto_15327 ?auto_15337 ) ) ( IS-CRATE ?auto_15328 ) ( not ( = ?auto_15342 ?auto_15335 ) ) ( not ( = ?auto_15338 ?auto_15342 ) ) ( HOIST-AT ?auto_15331 ?auto_15342 ) ( not ( = ?auto_15339 ?auto_15331 ) ) ( not ( = ?auto_15333 ?auto_15331 ) ) ( AVAILABLE ?auto_15331 ) ( SURFACE-AT ?auto_15328 ?auto_15342 ) ( ON ?auto_15328 ?auto_15341 ) ( CLEAR ?auto_15328 ) ( not ( = ?auto_15328 ?auto_15341 ) ) ( not ( = ?auto_15329 ?auto_15341 ) ) ( not ( = ?auto_15327 ?auto_15341 ) ) ( not ( = ?auto_15337 ?auto_15341 ) ) ( IS-CRATE ?auto_15327 ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( not ( = ?auto_15328 ?auto_15326 ) ) ( not ( = ?auto_15329 ?auto_15326 ) ) ( not ( = ?auto_15337 ?auto_15326 ) ) ( not ( = ?auto_15341 ?auto_15326 ) ) ( not ( = ?auto_15330 ?auto_15335 ) ) ( not ( = ?auto_15338 ?auto_15330 ) ) ( not ( = ?auto_15342 ?auto_15330 ) ) ( HOIST-AT ?auto_15334 ?auto_15330 ) ( not ( = ?auto_15339 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( not ( = ?auto_15331 ?auto_15334 ) ) ( AVAILABLE ?auto_15334 ) ( SURFACE-AT ?auto_15327 ?auto_15330 ) ( ON ?auto_15327 ?auto_15336 ) ( CLEAR ?auto_15327 ) ( not ( = ?auto_15328 ?auto_15336 ) ) ( not ( = ?auto_15329 ?auto_15336 ) ) ( not ( = ?auto_15327 ?auto_15336 ) ) ( not ( = ?auto_15337 ?auto_15336 ) ) ( not ( = ?auto_15341 ?auto_15336 ) ) ( not ( = ?auto_15326 ?auto_15336 ) ) ( SURFACE-AT ?auto_15325 ?auto_15335 ) ( CLEAR ?auto_15325 ) ( IS-CRATE ?auto_15326 ) ( not ( = ?auto_15325 ?auto_15326 ) ) ( not ( = ?auto_15328 ?auto_15325 ) ) ( not ( = ?auto_15329 ?auto_15325 ) ) ( not ( = ?auto_15327 ?auto_15325 ) ) ( not ( = ?auto_15337 ?auto_15325 ) ) ( not ( = ?auto_15341 ?auto_15325 ) ) ( not ( = ?auto_15336 ?auto_15325 ) ) ( AVAILABLE ?auto_15339 ) ( IN ?auto_15326 ?auto_15332 ) ( TRUCK-AT ?auto_15332 ?auto_15340 ) ( not ( = ?auto_15340 ?auto_15335 ) ) ( not ( = ?auto_15338 ?auto_15340 ) ) ( not ( = ?auto_15342 ?auto_15340 ) ) ( not ( = ?auto_15330 ?auto_15340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15327 ?auto_15328 ?auto_15329 )
      ( MAKE-4CRATE-VERIFY ?auto_15325 ?auto_15326 ?auto_15327 ?auto_15328 ?auto_15329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15343 - SURFACE
      ?auto_15344 - SURFACE
    )
    :vars
    (
      ?auto_15357 - HOIST
      ?auto_15351 - PLACE
      ?auto_15353 - SURFACE
      ?auto_15356 - PLACE
      ?auto_15349 - HOIST
      ?auto_15355 - SURFACE
      ?auto_15360 - PLACE
      ?auto_15346 - HOIST
      ?auto_15359 - SURFACE
      ?auto_15354 - SURFACE
      ?auto_15345 - PLACE
      ?auto_15350 - HOIST
      ?auto_15352 - SURFACE
      ?auto_15348 - SURFACE
      ?auto_15347 - TRUCK
      ?auto_15358 - PLACE
      ?auto_15361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15357 ?auto_15351 ) ( IS-CRATE ?auto_15344 ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15353 ?auto_15343 ) ) ( not ( = ?auto_15353 ?auto_15344 ) ) ( not ( = ?auto_15356 ?auto_15351 ) ) ( HOIST-AT ?auto_15349 ?auto_15356 ) ( not ( = ?auto_15357 ?auto_15349 ) ) ( AVAILABLE ?auto_15349 ) ( SURFACE-AT ?auto_15344 ?auto_15356 ) ( ON ?auto_15344 ?auto_15355 ) ( CLEAR ?auto_15344 ) ( not ( = ?auto_15343 ?auto_15355 ) ) ( not ( = ?auto_15344 ?auto_15355 ) ) ( not ( = ?auto_15353 ?auto_15355 ) ) ( IS-CRATE ?auto_15343 ) ( not ( = ?auto_15360 ?auto_15351 ) ) ( not ( = ?auto_15356 ?auto_15360 ) ) ( HOIST-AT ?auto_15346 ?auto_15360 ) ( not ( = ?auto_15357 ?auto_15346 ) ) ( not ( = ?auto_15349 ?auto_15346 ) ) ( AVAILABLE ?auto_15346 ) ( SURFACE-AT ?auto_15343 ?auto_15360 ) ( ON ?auto_15343 ?auto_15359 ) ( CLEAR ?auto_15343 ) ( not ( = ?auto_15343 ?auto_15359 ) ) ( not ( = ?auto_15344 ?auto_15359 ) ) ( not ( = ?auto_15353 ?auto_15359 ) ) ( not ( = ?auto_15355 ?auto_15359 ) ) ( IS-CRATE ?auto_15353 ) ( not ( = ?auto_15354 ?auto_15353 ) ) ( not ( = ?auto_15343 ?auto_15354 ) ) ( not ( = ?auto_15344 ?auto_15354 ) ) ( not ( = ?auto_15355 ?auto_15354 ) ) ( not ( = ?auto_15359 ?auto_15354 ) ) ( not ( = ?auto_15345 ?auto_15351 ) ) ( not ( = ?auto_15356 ?auto_15345 ) ) ( not ( = ?auto_15360 ?auto_15345 ) ) ( HOIST-AT ?auto_15350 ?auto_15345 ) ( not ( = ?auto_15357 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( not ( = ?auto_15346 ?auto_15350 ) ) ( AVAILABLE ?auto_15350 ) ( SURFACE-AT ?auto_15353 ?auto_15345 ) ( ON ?auto_15353 ?auto_15352 ) ( CLEAR ?auto_15353 ) ( not ( = ?auto_15343 ?auto_15352 ) ) ( not ( = ?auto_15344 ?auto_15352 ) ) ( not ( = ?auto_15353 ?auto_15352 ) ) ( not ( = ?auto_15355 ?auto_15352 ) ) ( not ( = ?auto_15359 ?auto_15352 ) ) ( not ( = ?auto_15354 ?auto_15352 ) ) ( SURFACE-AT ?auto_15348 ?auto_15351 ) ( CLEAR ?auto_15348 ) ( IS-CRATE ?auto_15354 ) ( not ( = ?auto_15348 ?auto_15354 ) ) ( not ( = ?auto_15343 ?auto_15348 ) ) ( not ( = ?auto_15344 ?auto_15348 ) ) ( not ( = ?auto_15353 ?auto_15348 ) ) ( not ( = ?auto_15355 ?auto_15348 ) ) ( not ( = ?auto_15359 ?auto_15348 ) ) ( not ( = ?auto_15352 ?auto_15348 ) ) ( AVAILABLE ?auto_15357 ) ( TRUCK-AT ?auto_15347 ?auto_15358 ) ( not ( = ?auto_15358 ?auto_15351 ) ) ( not ( = ?auto_15356 ?auto_15358 ) ) ( not ( = ?auto_15360 ?auto_15358 ) ) ( not ( = ?auto_15345 ?auto_15358 ) ) ( HOIST-AT ?auto_15361 ?auto_15358 ) ( LIFTING ?auto_15361 ?auto_15354 ) ( not ( = ?auto_15357 ?auto_15361 ) ) ( not ( = ?auto_15349 ?auto_15361 ) ) ( not ( = ?auto_15346 ?auto_15361 ) ) ( not ( = ?auto_15350 ?auto_15361 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15361 ?auto_15354 ?auto_15347 ?auto_15358 )
      ( MAKE-2CRATE ?auto_15353 ?auto_15343 ?auto_15344 )
      ( MAKE-1CRATE-VERIFY ?auto_15343 ?auto_15344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15362 - SURFACE
      ?auto_15363 - SURFACE
      ?auto_15364 - SURFACE
    )
    :vars
    (
      ?auto_15370 - HOIST
      ?auto_15377 - PLACE
      ?auto_15366 - PLACE
      ?auto_15368 - HOIST
      ?auto_15365 - SURFACE
      ?auto_15379 - PLACE
      ?auto_15378 - HOIST
      ?auto_15367 - SURFACE
      ?auto_15373 - SURFACE
      ?auto_15371 - PLACE
      ?auto_15375 - HOIST
      ?auto_15372 - SURFACE
      ?auto_15376 - SURFACE
      ?auto_15374 - TRUCK
      ?auto_15369 - PLACE
      ?auto_15380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15370 ?auto_15377 ) ( IS-CRATE ?auto_15364 ) ( not ( = ?auto_15363 ?auto_15364 ) ) ( not ( = ?auto_15362 ?auto_15363 ) ) ( not ( = ?auto_15362 ?auto_15364 ) ) ( not ( = ?auto_15366 ?auto_15377 ) ) ( HOIST-AT ?auto_15368 ?auto_15366 ) ( not ( = ?auto_15370 ?auto_15368 ) ) ( AVAILABLE ?auto_15368 ) ( SURFACE-AT ?auto_15364 ?auto_15366 ) ( ON ?auto_15364 ?auto_15365 ) ( CLEAR ?auto_15364 ) ( not ( = ?auto_15363 ?auto_15365 ) ) ( not ( = ?auto_15364 ?auto_15365 ) ) ( not ( = ?auto_15362 ?auto_15365 ) ) ( IS-CRATE ?auto_15363 ) ( not ( = ?auto_15379 ?auto_15377 ) ) ( not ( = ?auto_15366 ?auto_15379 ) ) ( HOIST-AT ?auto_15378 ?auto_15379 ) ( not ( = ?auto_15370 ?auto_15378 ) ) ( not ( = ?auto_15368 ?auto_15378 ) ) ( AVAILABLE ?auto_15378 ) ( SURFACE-AT ?auto_15363 ?auto_15379 ) ( ON ?auto_15363 ?auto_15367 ) ( CLEAR ?auto_15363 ) ( not ( = ?auto_15363 ?auto_15367 ) ) ( not ( = ?auto_15364 ?auto_15367 ) ) ( not ( = ?auto_15362 ?auto_15367 ) ) ( not ( = ?auto_15365 ?auto_15367 ) ) ( IS-CRATE ?auto_15362 ) ( not ( = ?auto_15373 ?auto_15362 ) ) ( not ( = ?auto_15363 ?auto_15373 ) ) ( not ( = ?auto_15364 ?auto_15373 ) ) ( not ( = ?auto_15365 ?auto_15373 ) ) ( not ( = ?auto_15367 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15377 ) ) ( not ( = ?auto_15366 ?auto_15371 ) ) ( not ( = ?auto_15379 ?auto_15371 ) ) ( HOIST-AT ?auto_15375 ?auto_15371 ) ( not ( = ?auto_15370 ?auto_15375 ) ) ( not ( = ?auto_15368 ?auto_15375 ) ) ( not ( = ?auto_15378 ?auto_15375 ) ) ( AVAILABLE ?auto_15375 ) ( SURFACE-AT ?auto_15362 ?auto_15371 ) ( ON ?auto_15362 ?auto_15372 ) ( CLEAR ?auto_15362 ) ( not ( = ?auto_15363 ?auto_15372 ) ) ( not ( = ?auto_15364 ?auto_15372 ) ) ( not ( = ?auto_15362 ?auto_15372 ) ) ( not ( = ?auto_15365 ?auto_15372 ) ) ( not ( = ?auto_15367 ?auto_15372 ) ) ( not ( = ?auto_15373 ?auto_15372 ) ) ( SURFACE-AT ?auto_15376 ?auto_15377 ) ( CLEAR ?auto_15376 ) ( IS-CRATE ?auto_15373 ) ( not ( = ?auto_15376 ?auto_15373 ) ) ( not ( = ?auto_15363 ?auto_15376 ) ) ( not ( = ?auto_15364 ?auto_15376 ) ) ( not ( = ?auto_15362 ?auto_15376 ) ) ( not ( = ?auto_15365 ?auto_15376 ) ) ( not ( = ?auto_15367 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( AVAILABLE ?auto_15370 ) ( TRUCK-AT ?auto_15374 ?auto_15369 ) ( not ( = ?auto_15369 ?auto_15377 ) ) ( not ( = ?auto_15366 ?auto_15369 ) ) ( not ( = ?auto_15379 ?auto_15369 ) ) ( not ( = ?auto_15371 ?auto_15369 ) ) ( HOIST-AT ?auto_15380 ?auto_15369 ) ( LIFTING ?auto_15380 ?auto_15373 ) ( not ( = ?auto_15370 ?auto_15380 ) ) ( not ( = ?auto_15368 ?auto_15380 ) ) ( not ( = ?auto_15378 ?auto_15380 ) ) ( not ( = ?auto_15375 ?auto_15380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15363 ?auto_15364 )
      ( MAKE-2CRATE-VERIFY ?auto_15362 ?auto_15363 ?auto_15364 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15381 - SURFACE
      ?auto_15382 - SURFACE
      ?auto_15383 - SURFACE
      ?auto_15384 - SURFACE
    )
    :vars
    (
      ?auto_15388 - HOIST
      ?auto_15393 - PLACE
      ?auto_15386 - PLACE
      ?auto_15396 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15387 - PLACE
      ?auto_15395 - HOIST
      ?auto_15398 - SURFACE
      ?auto_15392 - PLACE
      ?auto_15394 - HOIST
      ?auto_15399 - SURFACE
      ?auto_15389 - SURFACE
      ?auto_15397 - TRUCK
      ?auto_15391 - PLACE
      ?auto_15390 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15388 ?auto_15393 ) ( IS-CRATE ?auto_15384 ) ( not ( = ?auto_15383 ?auto_15384 ) ) ( not ( = ?auto_15382 ?auto_15383 ) ) ( not ( = ?auto_15382 ?auto_15384 ) ) ( not ( = ?auto_15386 ?auto_15393 ) ) ( HOIST-AT ?auto_15396 ?auto_15386 ) ( not ( = ?auto_15388 ?auto_15396 ) ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15384 ?auto_15386 ) ( ON ?auto_15384 ?auto_15385 ) ( CLEAR ?auto_15384 ) ( not ( = ?auto_15383 ?auto_15385 ) ) ( not ( = ?auto_15384 ?auto_15385 ) ) ( not ( = ?auto_15382 ?auto_15385 ) ) ( IS-CRATE ?auto_15383 ) ( not ( = ?auto_15387 ?auto_15393 ) ) ( not ( = ?auto_15386 ?auto_15387 ) ) ( HOIST-AT ?auto_15395 ?auto_15387 ) ( not ( = ?auto_15388 ?auto_15395 ) ) ( not ( = ?auto_15396 ?auto_15395 ) ) ( AVAILABLE ?auto_15395 ) ( SURFACE-AT ?auto_15383 ?auto_15387 ) ( ON ?auto_15383 ?auto_15398 ) ( CLEAR ?auto_15383 ) ( not ( = ?auto_15383 ?auto_15398 ) ) ( not ( = ?auto_15384 ?auto_15398 ) ) ( not ( = ?auto_15382 ?auto_15398 ) ) ( not ( = ?auto_15385 ?auto_15398 ) ) ( IS-CRATE ?auto_15382 ) ( not ( = ?auto_15381 ?auto_15382 ) ) ( not ( = ?auto_15383 ?auto_15381 ) ) ( not ( = ?auto_15384 ?auto_15381 ) ) ( not ( = ?auto_15385 ?auto_15381 ) ) ( not ( = ?auto_15398 ?auto_15381 ) ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15386 ?auto_15392 ) ) ( not ( = ?auto_15387 ?auto_15392 ) ) ( HOIST-AT ?auto_15394 ?auto_15392 ) ( not ( = ?auto_15388 ?auto_15394 ) ) ( not ( = ?auto_15396 ?auto_15394 ) ) ( not ( = ?auto_15395 ?auto_15394 ) ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15382 ?auto_15392 ) ( ON ?auto_15382 ?auto_15399 ) ( CLEAR ?auto_15382 ) ( not ( = ?auto_15383 ?auto_15399 ) ) ( not ( = ?auto_15384 ?auto_15399 ) ) ( not ( = ?auto_15382 ?auto_15399 ) ) ( not ( = ?auto_15385 ?auto_15399 ) ) ( not ( = ?auto_15398 ?auto_15399 ) ) ( not ( = ?auto_15381 ?auto_15399 ) ) ( SURFACE-AT ?auto_15389 ?auto_15393 ) ( CLEAR ?auto_15389 ) ( IS-CRATE ?auto_15381 ) ( not ( = ?auto_15389 ?auto_15381 ) ) ( not ( = ?auto_15383 ?auto_15389 ) ) ( not ( = ?auto_15384 ?auto_15389 ) ) ( not ( = ?auto_15382 ?auto_15389 ) ) ( not ( = ?auto_15385 ?auto_15389 ) ) ( not ( = ?auto_15398 ?auto_15389 ) ) ( not ( = ?auto_15399 ?auto_15389 ) ) ( AVAILABLE ?auto_15388 ) ( TRUCK-AT ?auto_15397 ?auto_15391 ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15386 ?auto_15391 ) ) ( not ( = ?auto_15387 ?auto_15391 ) ) ( not ( = ?auto_15392 ?auto_15391 ) ) ( HOIST-AT ?auto_15390 ?auto_15391 ) ( LIFTING ?auto_15390 ?auto_15381 ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15396 ?auto_15390 ) ) ( not ( = ?auto_15395 ?auto_15390 ) ) ( not ( = ?auto_15394 ?auto_15390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15382 ?auto_15383 ?auto_15384 )
      ( MAKE-3CRATE-VERIFY ?auto_15381 ?auto_15382 ?auto_15383 ?auto_15384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15400 - SURFACE
      ?auto_15401 - SURFACE
      ?auto_15402 - SURFACE
      ?auto_15403 - SURFACE
      ?auto_15404 - SURFACE
    )
    :vars
    (
      ?auto_15408 - HOIST
      ?auto_15412 - PLACE
      ?auto_15406 - PLACE
      ?auto_15415 - HOIST
      ?auto_15405 - SURFACE
      ?auto_15407 - PLACE
      ?auto_15414 - HOIST
      ?auto_15417 - SURFACE
      ?auto_15411 - PLACE
      ?auto_15413 - HOIST
      ?auto_15418 - SURFACE
      ?auto_15416 - TRUCK
      ?auto_15410 - PLACE
      ?auto_15409 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15408 ?auto_15412 ) ( IS-CRATE ?auto_15404 ) ( not ( = ?auto_15403 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15403 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15406 ?auto_15412 ) ) ( HOIST-AT ?auto_15415 ?auto_15406 ) ( not ( = ?auto_15408 ?auto_15415 ) ) ( AVAILABLE ?auto_15415 ) ( SURFACE-AT ?auto_15404 ?auto_15406 ) ( ON ?auto_15404 ?auto_15405 ) ( CLEAR ?auto_15404 ) ( not ( = ?auto_15403 ?auto_15405 ) ) ( not ( = ?auto_15404 ?auto_15405 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( IS-CRATE ?auto_15403 ) ( not ( = ?auto_15407 ?auto_15412 ) ) ( not ( = ?auto_15406 ?auto_15407 ) ) ( HOIST-AT ?auto_15414 ?auto_15407 ) ( not ( = ?auto_15408 ?auto_15414 ) ) ( not ( = ?auto_15415 ?auto_15414 ) ) ( AVAILABLE ?auto_15414 ) ( SURFACE-AT ?auto_15403 ?auto_15407 ) ( ON ?auto_15403 ?auto_15417 ) ( CLEAR ?auto_15403 ) ( not ( = ?auto_15403 ?auto_15417 ) ) ( not ( = ?auto_15404 ?auto_15417 ) ) ( not ( = ?auto_15402 ?auto_15417 ) ) ( not ( = ?auto_15405 ?auto_15417 ) ) ( IS-CRATE ?auto_15402 ) ( not ( = ?auto_15401 ?auto_15402 ) ) ( not ( = ?auto_15403 ?auto_15401 ) ) ( not ( = ?auto_15404 ?auto_15401 ) ) ( not ( = ?auto_15405 ?auto_15401 ) ) ( not ( = ?auto_15417 ?auto_15401 ) ) ( not ( = ?auto_15411 ?auto_15412 ) ) ( not ( = ?auto_15406 ?auto_15411 ) ) ( not ( = ?auto_15407 ?auto_15411 ) ) ( HOIST-AT ?auto_15413 ?auto_15411 ) ( not ( = ?auto_15408 ?auto_15413 ) ) ( not ( = ?auto_15415 ?auto_15413 ) ) ( not ( = ?auto_15414 ?auto_15413 ) ) ( AVAILABLE ?auto_15413 ) ( SURFACE-AT ?auto_15402 ?auto_15411 ) ( ON ?auto_15402 ?auto_15418 ) ( CLEAR ?auto_15402 ) ( not ( = ?auto_15403 ?auto_15418 ) ) ( not ( = ?auto_15404 ?auto_15418 ) ) ( not ( = ?auto_15402 ?auto_15418 ) ) ( not ( = ?auto_15405 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15401 ?auto_15418 ) ) ( SURFACE-AT ?auto_15400 ?auto_15412 ) ( CLEAR ?auto_15400 ) ( IS-CRATE ?auto_15401 ) ( not ( = ?auto_15400 ?auto_15401 ) ) ( not ( = ?auto_15403 ?auto_15400 ) ) ( not ( = ?auto_15404 ?auto_15400 ) ) ( not ( = ?auto_15402 ?auto_15400 ) ) ( not ( = ?auto_15405 ?auto_15400 ) ) ( not ( = ?auto_15417 ?auto_15400 ) ) ( not ( = ?auto_15418 ?auto_15400 ) ) ( AVAILABLE ?auto_15408 ) ( TRUCK-AT ?auto_15416 ?auto_15410 ) ( not ( = ?auto_15410 ?auto_15412 ) ) ( not ( = ?auto_15406 ?auto_15410 ) ) ( not ( = ?auto_15407 ?auto_15410 ) ) ( not ( = ?auto_15411 ?auto_15410 ) ) ( HOIST-AT ?auto_15409 ?auto_15410 ) ( LIFTING ?auto_15409 ?auto_15401 ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( not ( = ?auto_15415 ?auto_15409 ) ) ( not ( = ?auto_15414 ?auto_15409 ) ) ( not ( = ?auto_15413 ?auto_15409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15402 ?auto_15403 ?auto_15404 )
      ( MAKE-4CRATE-VERIFY ?auto_15400 ?auto_15401 ?auto_15402 ?auto_15403 ?auto_15404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15419 - SURFACE
      ?auto_15420 - SURFACE
    )
    :vars
    (
      ?auto_15425 - HOIST
      ?auto_15431 - PLACE
      ?auto_15427 - SURFACE
      ?auto_15423 - PLACE
      ?auto_15434 - HOIST
      ?auto_15422 - SURFACE
      ?auto_15424 - PLACE
      ?auto_15433 - HOIST
      ?auto_15436 - SURFACE
      ?auto_15421 - SURFACE
      ?auto_15430 - PLACE
      ?auto_15432 - HOIST
      ?auto_15437 - SURFACE
      ?auto_15426 - SURFACE
      ?auto_15435 - TRUCK
      ?auto_15429 - PLACE
      ?auto_15428 - HOIST
      ?auto_15438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15425 ?auto_15431 ) ( IS-CRATE ?auto_15420 ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15427 ?auto_15419 ) ) ( not ( = ?auto_15427 ?auto_15420 ) ) ( not ( = ?auto_15423 ?auto_15431 ) ) ( HOIST-AT ?auto_15434 ?auto_15423 ) ( not ( = ?auto_15425 ?auto_15434 ) ) ( AVAILABLE ?auto_15434 ) ( SURFACE-AT ?auto_15420 ?auto_15423 ) ( ON ?auto_15420 ?auto_15422 ) ( CLEAR ?auto_15420 ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15427 ?auto_15422 ) ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15424 ?auto_15431 ) ) ( not ( = ?auto_15423 ?auto_15424 ) ) ( HOIST-AT ?auto_15433 ?auto_15424 ) ( not ( = ?auto_15425 ?auto_15433 ) ) ( not ( = ?auto_15434 ?auto_15433 ) ) ( AVAILABLE ?auto_15433 ) ( SURFACE-AT ?auto_15419 ?auto_15424 ) ( ON ?auto_15419 ?auto_15436 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15419 ?auto_15436 ) ) ( not ( = ?auto_15420 ?auto_15436 ) ) ( not ( = ?auto_15427 ?auto_15436 ) ) ( not ( = ?auto_15422 ?auto_15436 ) ) ( IS-CRATE ?auto_15427 ) ( not ( = ?auto_15421 ?auto_15427 ) ) ( not ( = ?auto_15419 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( not ( = ?auto_15422 ?auto_15421 ) ) ( not ( = ?auto_15436 ?auto_15421 ) ) ( not ( = ?auto_15430 ?auto_15431 ) ) ( not ( = ?auto_15423 ?auto_15430 ) ) ( not ( = ?auto_15424 ?auto_15430 ) ) ( HOIST-AT ?auto_15432 ?auto_15430 ) ( not ( = ?auto_15425 ?auto_15432 ) ) ( not ( = ?auto_15434 ?auto_15432 ) ) ( not ( = ?auto_15433 ?auto_15432 ) ) ( AVAILABLE ?auto_15432 ) ( SURFACE-AT ?auto_15427 ?auto_15430 ) ( ON ?auto_15427 ?auto_15437 ) ( CLEAR ?auto_15427 ) ( not ( = ?auto_15419 ?auto_15437 ) ) ( not ( = ?auto_15420 ?auto_15437 ) ) ( not ( = ?auto_15427 ?auto_15437 ) ) ( not ( = ?auto_15422 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15421 ?auto_15437 ) ) ( SURFACE-AT ?auto_15426 ?auto_15431 ) ( CLEAR ?auto_15426 ) ( IS-CRATE ?auto_15421 ) ( not ( = ?auto_15426 ?auto_15421 ) ) ( not ( = ?auto_15419 ?auto_15426 ) ) ( not ( = ?auto_15420 ?auto_15426 ) ) ( not ( = ?auto_15427 ?auto_15426 ) ) ( not ( = ?auto_15422 ?auto_15426 ) ) ( not ( = ?auto_15436 ?auto_15426 ) ) ( not ( = ?auto_15437 ?auto_15426 ) ) ( AVAILABLE ?auto_15425 ) ( TRUCK-AT ?auto_15435 ?auto_15429 ) ( not ( = ?auto_15429 ?auto_15431 ) ) ( not ( = ?auto_15423 ?auto_15429 ) ) ( not ( = ?auto_15424 ?auto_15429 ) ) ( not ( = ?auto_15430 ?auto_15429 ) ) ( HOIST-AT ?auto_15428 ?auto_15429 ) ( not ( = ?auto_15425 ?auto_15428 ) ) ( not ( = ?auto_15434 ?auto_15428 ) ) ( not ( = ?auto_15433 ?auto_15428 ) ) ( not ( = ?auto_15432 ?auto_15428 ) ) ( AVAILABLE ?auto_15428 ) ( SURFACE-AT ?auto_15421 ?auto_15429 ) ( ON ?auto_15421 ?auto_15438 ) ( CLEAR ?auto_15421 ) ( not ( = ?auto_15419 ?auto_15438 ) ) ( not ( = ?auto_15420 ?auto_15438 ) ) ( not ( = ?auto_15427 ?auto_15438 ) ) ( not ( = ?auto_15422 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15421 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15426 ?auto_15438 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15428 ?auto_15421 ?auto_15438 ?auto_15429 )
      ( MAKE-2CRATE ?auto_15427 ?auto_15419 ?auto_15420 )
      ( MAKE-1CRATE-VERIFY ?auto_15419 ?auto_15420 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15439 - SURFACE
      ?auto_15440 - SURFACE
      ?auto_15441 - SURFACE
    )
    :vars
    (
      ?auto_15449 - HOIST
      ?auto_15448 - PLACE
      ?auto_15450 - PLACE
      ?auto_15452 - HOIST
      ?auto_15443 - SURFACE
      ?auto_15454 - PLACE
      ?auto_15442 - HOIST
      ?auto_15458 - SURFACE
      ?auto_15451 - SURFACE
      ?auto_15444 - PLACE
      ?auto_15457 - HOIST
      ?auto_15455 - SURFACE
      ?auto_15456 - SURFACE
      ?auto_15447 - TRUCK
      ?auto_15453 - PLACE
      ?auto_15445 - HOIST
      ?auto_15446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15449 ?auto_15448 ) ( IS-CRATE ?auto_15441 ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15450 ?auto_15448 ) ) ( HOIST-AT ?auto_15452 ?auto_15450 ) ( not ( = ?auto_15449 ?auto_15452 ) ) ( AVAILABLE ?auto_15452 ) ( SURFACE-AT ?auto_15441 ?auto_15450 ) ( ON ?auto_15441 ?auto_15443 ) ( CLEAR ?auto_15441 ) ( not ( = ?auto_15440 ?auto_15443 ) ) ( not ( = ?auto_15441 ?auto_15443 ) ) ( not ( = ?auto_15439 ?auto_15443 ) ) ( IS-CRATE ?auto_15440 ) ( not ( = ?auto_15454 ?auto_15448 ) ) ( not ( = ?auto_15450 ?auto_15454 ) ) ( HOIST-AT ?auto_15442 ?auto_15454 ) ( not ( = ?auto_15449 ?auto_15442 ) ) ( not ( = ?auto_15452 ?auto_15442 ) ) ( AVAILABLE ?auto_15442 ) ( SURFACE-AT ?auto_15440 ?auto_15454 ) ( ON ?auto_15440 ?auto_15458 ) ( CLEAR ?auto_15440 ) ( not ( = ?auto_15440 ?auto_15458 ) ) ( not ( = ?auto_15441 ?auto_15458 ) ) ( not ( = ?auto_15439 ?auto_15458 ) ) ( not ( = ?auto_15443 ?auto_15458 ) ) ( IS-CRATE ?auto_15439 ) ( not ( = ?auto_15451 ?auto_15439 ) ) ( not ( = ?auto_15440 ?auto_15451 ) ) ( not ( = ?auto_15441 ?auto_15451 ) ) ( not ( = ?auto_15443 ?auto_15451 ) ) ( not ( = ?auto_15458 ?auto_15451 ) ) ( not ( = ?auto_15444 ?auto_15448 ) ) ( not ( = ?auto_15450 ?auto_15444 ) ) ( not ( = ?auto_15454 ?auto_15444 ) ) ( HOIST-AT ?auto_15457 ?auto_15444 ) ( not ( = ?auto_15449 ?auto_15457 ) ) ( not ( = ?auto_15452 ?auto_15457 ) ) ( not ( = ?auto_15442 ?auto_15457 ) ) ( AVAILABLE ?auto_15457 ) ( SURFACE-AT ?auto_15439 ?auto_15444 ) ( ON ?auto_15439 ?auto_15455 ) ( CLEAR ?auto_15439 ) ( not ( = ?auto_15440 ?auto_15455 ) ) ( not ( = ?auto_15441 ?auto_15455 ) ) ( not ( = ?auto_15439 ?auto_15455 ) ) ( not ( = ?auto_15443 ?auto_15455 ) ) ( not ( = ?auto_15458 ?auto_15455 ) ) ( not ( = ?auto_15451 ?auto_15455 ) ) ( SURFACE-AT ?auto_15456 ?auto_15448 ) ( CLEAR ?auto_15456 ) ( IS-CRATE ?auto_15451 ) ( not ( = ?auto_15456 ?auto_15451 ) ) ( not ( = ?auto_15440 ?auto_15456 ) ) ( not ( = ?auto_15441 ?auto_15456 ) ) ( not ( = ?auto_15439 ?auto_15456 ) ) ( not ( = ?auto_15443 ?auto_15456 ) ) ( not ( = ?auto_15458 ?auto_15456 ) ) ( not ( = ?auto_15455 ?auto_15456 ) ) ( AVAILABLE ?auto_15449 ) ( TRUCK-AT ?auto_15447 ?auto_15453 ) ( not ( = ?auto_15453 ?auto_15448 ) ) ( not ( = ?auto_15450 ?auto_15453 ) ) ( not ( = ?auto_15454 ?auto_15453 ) ) ( not ( = ?auto_15444 ?auto_15453 ) ) ( HOIST-AT ?auto_15445 ?auto_15453 ) ( not ( = ?auto_15449 ?auto_15445 ) ) ( not ( = ?auto_15452 ?auto_15445 ) ) ( not ( = ?auto_15442 ?auto_15445 ) ) ( not ( = ?auto_15457 ?auto_15445 ) ) ( AVAILABLE ?auto_15445 ) ( SURFACE-AT ?auto_15451 ?auto_15453 ) ( ON ?auto_15451 ?auto_15446 ) ( CLEAR ?auto_15451 ) ( not ( = ?auto_15440 ?auto_15446 ) ) ( not ( = ?auto_15441 ?auto_15446 ) ) ( not ( = ?auto_15439 ?auto_15446 ) ) ( not ( = ?auto_15443 ?auto_15446 ) ) ( not ( = ?auto_15458 ?auto_15446 ) ) ( not ( = ?auto_15451 ?auto_15446 ) ) ( not ( = ?auto_15455 ?auto_15446 ) ) ( not ( = ?auto_15456 ?auto_15446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15440 ?auto_15441 )
      ( MAKE-2CRATE-VERIFY ?auto_15439 ?auto_15440 ?auto_15441 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15459 - SURFACE
      ?auto_15460 - SURFACE
      ?auto_15461 - SURFACE
      ?auto_15462 - SURFACE
    )
    :vars
    (
      ?auto_15464 - HOIST
      ?auto_15465 - PLACE
      ?auto_15477 - PLACE
      ?auto_15473 - HOIST
      ?auto_15469 - SURFACE
      ?auto_15474 - PLACE
      ?auto_15471 - HOIST
      ?auto_15463 - SURFACE
      ?auto_15476 - PLACE
      ?auto_15470 - HOIST
      ?auto_15475 - SURFACE
      ?auto_15466 - SURFACE
      ?auto_15468 - TRUCK
      ?auto_15478 - PLACE
      ?auto_15467 - HOIST
      ?auto_15472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15464 ?auto_15465 ) ( IS-CRATE ?auto_15462 ) ( not ( = ?auto_15461 ?auto_15462 ) ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15462 ) ) ( not ( = ?auto_15477 ?auto_15465 ) ) ( HOIST-AT ?auto_15473 ?auto_15477 ) ( not ( = ?auto_15464 ?auto_15473 ) ) ( AVAILABLE ?auto_15473 ) ( SURFACE-AT ?auto_15462 ?auto_15477 ) ( ON ?auto_15462 ?auto_15469 ) ( CLEAR ?auto_15462 ) ( not ( = ?auto_15461 ?auto_15469 ) ) ( not ( = ?auto_15462 ?auto_15469 ) ) ( not ( = ?auto_15460 ?auto_15469 ) ) ( IS-CRATE ?auto_15461 ) ( not ( = ?auto_15474 ?auto_15465 ) ) ( not ( = ?auto_15477 ?auto_15474 ) ) ( HOIST-AT ?auto_15471 ?auto_15474 ) ( not ( = ?auto_15464 ?auto_15471 ) ) ( not ( = ?auto_15473 ?auto_15471 ) ) ( AVAILABLE ?auto_15471 ) ( SURFACE-AT ?auto_15461 ?auto_15474 ) ( ON ?auto_15461 ?auto_15463 ) ( CLEAR ?auto_15461 ) ( not ( = ?auto_15461 ?auto_15463 ) ) ( not ( = ?auto_15462 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15469 ?auto_15463 ) ) ( IS-CRATE ?auto_15460 ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15461 ?auto_15459 ) ) ( not ( = ?auto_15462 ?auto_15459 ) ) ( not ( = ?auto_15469 ?auto_15459 ) ) ( not ( = ?auto_15463 ?auto_15459 ) ) ( not ( = ?auto_15476 ?auto_15465 ) ) ( not ( = ?auto_15477 ?auto_15476 ) ) ( not ( = ?auto_15474 ?auto_15476 ) ) ( HOIST-AT ?auto_15470 ?auto_15476 ) ( not ( = ?auto_15464 ?auto_15470 ) ) ( not ( = ?auto_15473 ?auto_15470 ) ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( AVAILABLE ?auto_15470 ) ( SURFACE-AT ?auto_15460 ?auto_15476 ) ( ON ?auto_15460 ?auto_15475 ) ( CLEAR ?auto_15460 ) ( not ( = ?auto_15461 ?auto_15475 ) ) ( not ( = ?auto_15462 ?auto_15475 ) ) ( not ( = ?auto_15460 ?auto_15475 ) ) ( not ( = ?auto_15469 ?auto_15475 ) ) ( not ( = ?auto_15463 ?auto_15475 ) ) ( not ( = ?auto_15459 ?auto_15475 ) ) ( SURFACE-AT ?auto_15466 ?auto_15465 ) ( CLEAR ?auto_15466 ) ( IS-CRATE ?auto_15459 ) ( not ( = ?auto_15466 ?auto_15459 ) ) ( not ( = ?auto_15461 ?auto_15466 ) ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( not ( = ?auto_15460 ?auto_15466 ) ) ( not ( = ?auto_15469 ?auto_15466 ) ) ( not ( = ?auto_15463 ?auto_15466 ) ) ( not ( = ?auto_15475 ?auto_15466 ) ) ( AVAILABLE ?auto_15464 ) ( TRUCK-AT ?auto_15468 ?auto_15478 ) ( not ( = ?auto_15478 ?auto_15465 ) ) ( not ( = ?auto_15477 ?auto_15478 ) ) ( not ( = ?auto_15474 ?auto_15478 ) ) ( not ( = ?auto_15476 ?auto_15478 ) ) ( HOIST-AT ?auto_15467 ?auto_15478 ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15473 ?auto_15467 ) ) ( not ( = ?auto_15471 ?auto_15467 ) ) ( not ( = ?auto_15470 ?auto_15467 ) ) ( AVAILABLE ?auto_15467 ) ( SURFACE-AT ?auto_15459 ?auto_15478 ) ( ON ?auto_15459 ?auto_15472 ) ( CLEAR ?auto_15459 ) ( not ( = ?auto_15461 ?auto_15472 ) ) ( not ( = ?auto_15462 ?auto_15472 ) ) ( not ( = ?auto_15460 ?auto_15472 ) ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15463 ?auto_15472 ) ) ( not ( = ?auto_15459 ?auto_15472 ) ) ( not ( = ?auto_15475 ?auto_15472 ) ) ( not ( = ?auto_15466 ?auto_15472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15460 ?auto_15461 ?auto_15462 )
      ( MAKE-3CRATE-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15479 - SURFACE
      ?auto_15480 - SURFACE
      ?auto_15481 - SURFACE
      ?auto_15482 - SURFACE
      ?auto_15483 - SURFACE
    )
    :vars
    (
      ?auto_15485 - HOIST
      ?auto_15486 - PLACE
      ?auto_15497 - PLACE
      ?auto_15493 - HOIST
      ?auto_15489 - SURFACE
      ?auto_15494 - PLACE
      ?auto_15491 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15496 - PLACE
      ?auto_15490 - HOIST
      ?auto_15495 - SURFACE
      ?auto_15488 - TRUCK
      ?auto_15498 - PLACE
      ?auto_15487 - HOIST
      ?auto_15492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15485 ?auto_15486 ) ( IS-CRATE ?auto_15483 ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15497 ?auto_15486 ) ) ( HOIST-AT ?auto_15493 ?auto_15497 ) ( not ( = ?auto_15485 ?auto_15493 ) ) ( AVAILABLE ?auto_15493 ) ( SURFACE-AT ?auto_15483 ?auto_15497 ) ( ON ?auto_15483 ?auto_15489 ) ( CLEAR ?auto_15483 ) ( not ( = ?auto_15482 ?auto_15489 ) ) ( not ( = ?auto_15483 ?auto_15489 ) ) ( not ( = ?auto_15481 ?auto_15489 ) ) ( IS-CRATE ?auto_15482 ) ( not ( = ?auto_15494 ?auto_15486 ) ) ( not ( = ?auto_15497 ?auto_15494 ) ) ( HOIST-AT ?auto_15491 ?auto_15494 ) ( not ( = ?auto_15485 ?auto_15491 ) ) ( not ( = ?auto_15493 ?auto_15491 ) ) ( AVAILABLE ?auto_15491 ) ( SURFACE-AT ?auto_15482 ?auto_15494 ) ( ON ?auto_15482 ?auto_15484 ) ( CLEAR ?auto_15482 ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15489 ?auto_15484 ) ) ( IS-CRATE ?auto_15481 ) ( not ( = ?auto_15480 ?auto_15481 ) ) ( not ( = ?auto_15482 ?auto_15480 ) ) ( not ( = ?auto_15483 ?auto_15480 ) ) ( not ( = ?auto_15489 ?auto_15480 ) ) ( not ( = ?auto_15484 ?auto_15480 ) ) ( not ( = ?auto_15496 ?auto_15486 ) ) ( not ( = ?auto_15497 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( HOIST-AT ?auto_15490 ?auto_15496 ) ( not ( = ?auto_15485 ?auto_15490 ) ) ( not ( = ?auto_15493 ?auto_15490 ) ) ( not ( = ?auto_15491 ?auto_15490 ) ) ( AVAILABLE ?auto_15490 ) ( SURFACE-AT ?auto_15481 ?auto_15496 ) ( ON ?auto_15481 ?auto_15495 ) ( CLEAR ?auto_15481 ) ( not ( = ?auto_15482 ?auto_15495 ) ) ( not ( = ?auto_15483 ?auto_15495 ) ) ( not ( = ?auto_15481 ?auto_15495 ) ) ( not ( = ?auto_15489 ?auto_15495 ) ) ( not ( = ?auto_15484 ?auto_15495 ) ) ( not ( = ?auto_15480 ?auto_15495 ) ) ( SURFACE-AT ?auto_15479 ?auto_15486 ) ( CLEAR ?auto_15479 ) ( IS-CRATE ?auto_15480 ) ( not ( = ?auto_15479 ?auto_15480 ) ) ( not ( = ?auto_15482 ?auto_15479 ) ) ( not ( = ?auto_15483 ?auto_15479 ) ) ( not ( = ?auto_15481 ?auto_15479 ) ) ( not ( = ?auto_15489 ?auto_15479 ) ) ( not ( = ?auto_15484 ?auto_15479 ) ) ( not ( = ?auto_15495 ?auto_15479 ) ) ( AVAILABLE ?auto_15485 ) ( TRUCK-AT ?auto_15488 ?auto_15498 ) ( not ( = ?auto_15498 ?auto_15486 ) ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( not ( = ?auto_15494 ?auto_15498 ) ) ( not ( = ?auto_15496 ?auto_15498 ) ) ( HOIST-AT ?auto_15487 ?auto_15498 ) ( not ( = ?auto_15485 ?auto_15487 ) ) ( not ( = ?auto_15493 ?auto_15487 ) ) ( not ( = ?auto_15491 ?auto_15487 ) ) ( not ( = ?auto_15490 ?auto_15487 ) ) ( AVAILABLE ?auto_15487 ) ( SURFACE-AT ?auto_15480 ?auto_15498 ) ( ON ?auto_15480 ?auto_15492 ) ( CLEAR ?auto_15480 ) ( not ( = ?auto_15482 ?auto_15492 ) ) ( not ( = ?auto_15483 ?auto_15492 ) ) ( not ( = ?auto_15481 ?auto_15492 ) ) ( not ( = ?auto_15489 ?auto_15492 ) ) ( not ( = ?auto_15484 ?auto_15492 ) ) ( not ( = ?auto_15480 ?auto_15492 ) ) ( not ( = ?auto_15495 ?auto_15492 ) ) ( not ( = ?auto_15479 ?auto_15492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15481 ?auto_15482 ?auto_15483 )
      ( MAKE-4CRATE-VERIFY ?auto_15479 ?auto_15480 ?auto_15481 ?auto_15482 ?auto_15483 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15499 - SURFACE
      ?auto_15500 - SURFACE
    )
    :vars
    (
      ?auto_15503 - HOIST
      ?auto_15504 - PLACE
      ?auto_15505 - SURFACE
      ?auto_15517 - PLACE
      ?auto_15513 - HOIST
      ?auto_15509 - SURFACE
      ?auto_15514 - PLACE
      ?auto_15511 - HOIST
      ?auto_15501 - SURFACE
      ?auto_15502 - SURFACE
      ?auto_15516 - PLACE
      ?auto_15510 - HOIST
      ?auto_15515 - SURFACE
      ?auto_15506 - SURFACE
      ?auto_15518 - PLACE
      ?auto_15507 - HOIST
      ?auto_15512 - SURFACE
      ?auto_15508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15503 ?auto_15504 ) ( IS-CRATE ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( not ( = ?auto_15505 ?auto_15499 ) ) ( not ( = ?auto_15505 ?auto_15500 ) ) ( not ( = ?auto_15517 ?auto_15504 ) ) ( HOIST-AT ?auto_15513 ?auto_15517 ) ( not ( = ?auto_15503 ?auto_15513 ) ) ( AVAILABLE ?auto_15513 ) ( SURFACE-AT ?auto_15500 ?auto_15517 ) ( ON ?auto_15500 ?auto_15509 ) ( CLEAR ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15509 ) ) ( not ( = ?auto_15500 ?auto_15509 ) ) ( not ( = ?auto_15505 ?auto_15509 ) ) ( IS-CRATE ?auto_15499 ) ( not ( = ?auto_15514 ?auto_15504 ) ) ( not ( = ?auto_15517 ?auto_15514 ) ) ( HOIST-AT ?auto_15511 ?auto_15514 ) ( not ( = ?auto_15503 ?auto_15511 ) ) ( not ( = ?auto_15513 ?auto_15511 ) ) ( AVAILABLE ?auto_15511 ) ( SURFACE-AT ?auto_15499 ?auto_15514 ) ( ON ?auto_15499 ?auto_15501 ) ( CLEAR ?auto_15499 ) ( not ( = ?auto_15499 ?auto_15501 ) ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( not ( = ?auto_15505 ?auto_15501 ) ) ( not ( = ?auto_15509 ?auto_15501 ) ) ( IS-CRATE ?auto_15505 ) ( not ( = ?auto_15502 ?auto_15505 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15500 ?auto_15502 ) ) ( not ( = ?auto_15509 ?auto_15502 ) ) ( not ( = ?auto_15501 ?auto_15502 ) ) ( not ( = ?auto_15516 ?auto_15504 ) ) ( not ( = ?auto_15517 ?auto_15516 ) ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( HOIST-AT ?auto_15510 ?auto_15516 ) ( not ( = ?auto_15503 ?auto_15510 ) ) ( not ( = ?auto_15513 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15510 ) ) ( AVAILABLE ?auto_15510 ) ( SURFACE-AT ?auto_15505 ?auto_15516 ) ( ON ?auto_15505 ?auto_15515 ) ( CLEAR ?auto_15505 ) ( not ( = ?auto_15499 ?auto_15515 ) ) ( not ( = ?auto_15500 ?auto_15515 ) ) ( not ( = ?auto_15505 ?auto_15515 ) ) ( not ( = ?auto_15509 ?auto_15515 ) ) ( not ( = ?auto_15501 ?auto_15515 ) ) ( not ( = ?auto_15502 ?auto_15515 ) ) ( SURFACE-AT ?auto_15506 ?auto_15504 ) ( CLEAR ?auto_15506 ) ( IS-CRATE ?auto_15502 ) ( not ( = ?auto_15506 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15506 ) ) ( not ( = ?auto_15500 ?auto_15506 ) ) ( not ( = ?auto_15505 ?auto_15506 ) ) ( not ( = ?auto_15509 ?auto_15506 ) ) ( not ( = ?auto_15501 ?auto_15506 ) ) ( not ( = ?auto_15515 ?auto_15506 ) ) ( AVAILABLE ?auto_15503 ) ( not ( = ?auto_15518 ?auto_15504 ) ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15514 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( HOIST-AT ?auto_15507 ?auto_15518 ) ( not ( = ?auto_15503 ?auto_15507 ) ) ( not ( = ?auto_15513 ?auto_15507 ) ) ( not ( = ?auto_15511 ?auto_15507 ) ) ( not ( = ?auto_15510 ?auto_15507 ) ) ( AVAILABLE ?auto_15507 ) ( SURFACE-AT ?auto_15502 ?auto_15518 ) ( ON ?auto_15502 ?auto_15512 ) ( CLEAR ?auto_15502 ) ( not ( = ?auto_15499 ?auto_15512 ) ) ( not ( = ?auto_15500 ?auto_15512 ) ) ( not ( = ?auto_15505 ?auto_15512 ) ) ( not ( = ?auto_15509 ?auto_15512 ) ) ( not ( = ?auto_15501 ?auto_15512 ) ) ( not ( = ?auto_15502 ?auto_15512 ) ) ( not ( = ?auto_15515 ?auto_15512 ) ) ( not ( = ?auto_15506 ?auto_15512 ) ) ( TRUCK-AT ?auto_15508 ?auto_15504 ) )
    :subtasks
    ( ( !DRIVE ?auto_15508 ?auto_15504 ?auto_15518 )
      ( MAKE-2CRATE ?auto_15505 ?auto_15499 ?auto_15500 )
      ( MAKE-1CRATE-VERIFY ?auto_15499 ?auto_15500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15519 - SURFACE
      ?auto_15520 - SURFACE
      ?auto_15521 - SURFACE
    )
    :vars
    (
      ?auto_15523 - HOIST
      ?auto_15535 - PLACE
      ?auto_15527 - PLACE
      ?auto_15531 - HOIST
      ?auto_15528 - SURFACE
      ?auto_15522 - PLACE
      ?auto_15537 - HOIST
      ?auto_15526 - SURFACE
      ?auto_15532 - SURFACE
      ?auto_15538 - PLACE
      ?auto_15529 - HOIST
      ?auto_15534 - SURFACE
      ?auto_15533 - SURFACE
      ?auto_15524 - PLACE
      ?auto_15536 - HOIST
      ?auto_15525 - SURFACE
      ?auto_15530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15523 ?auto_15535 ) ( IS-CRATE ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15527 ?auto_15535 ) ) ( HOIST-AT ?auto_15531 ?auto_15527 ) ( not ( = ?auto_15523 ?auto_15531 ) ) ( AVAILABLE ?auto_15531 ) ( SURFACE-AT ?auto_15521 ?auto_15527 ) ( ON ?auto_15521 ?auto_15528 ) ( CLEAR ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15528 ) ) ( not ( = ?auto_15521 ?auto_15528 ) ) ( not ( = ?auto_15519 ?auto_15528 ) ) ( IS-CRATE ?auto_15520 ) ( not ( = ?auto_15522 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15522 ) ) ( HOIST-AT ?auto_15537 ?auto_15522 ) ( not ( = ?auto_15523 ?auto_15537 ) ) ( not ( = ?auto_15531 ?auto_15537 ) ) ( AVAILABLE ?auto_15537 ) ( SURFACE-AT ?auto_15520 ?auto_15522 ) ( ON ?auto_15520 ?auto_15526 ) ( CLEAR ?auto_15520 ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15519 ?auto_15526 ) ) ( not ( = ?auto_15528 ?auto_15526 ) ) ( IS-CRATE ?auto_15519 ) ( not ( = ?auto_15532 ?auto_15519 ) ) ( not ( = ?auto_15520 ?auto_15532 ) ) ( not ( = ?auto_15521 ?auto_15532 ) ) ( not ( = ?auto_15528 ?auto_15532 ) ) ( not ( = ?auto_15526 ?auto_15532 ) ) ( not ( = ?auto_15538 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15538 ) ) ( not ( = ?auto_15522 ?auto_15538 ) ) ( HOIST-AT ?auto_15529 ?auto_15538 ) ( not ( = ?auto_15523 ?auto_15529 ) ) ( not ( = ?auto_15531 ?auto_15529 ) ) ( not ( = ?auto_15537 ?auto_15529 ) ) ( AVAILABLE ?auto_15529 ) ( SURFACE-AT ?auto_15519 ?auto_15538 ) ( ON ?auto_15519 ?auto_15534 ) ( CLEAR ?auto_15519 ) ( not ( = ?auto_15520 ?auto_15534 ) ) ( not ( = ?auto_15521 ?auto_15534 ) ) ( not ( = ?auto_15519 ?auto_15534 ) ) ( not ( = ?auto_15528 ?auto_15534 ) ) ( not ( = ?auto_15526 ?auto_15534 ) ) ( not ( = ?auto_15532 ?auto_15534 ) ) ( SURFACE-AT ?auto_15533 ?auto_15535 ) ( CLEAR ?auto_15533 ) ( IS-CRATE ?auto_15532 ) ( not ( = ?auto_15533 ?auto_15532 ) ) ( not ( = ?auto_15520 ?auto_15533 ) ) ( not ( = ?auto_15521 ?auto_15533 ) ) ( not ( = ?auto_15519 ?auto_15533 ) ) ( not ( = ?auto_15528 ?auto_15533 ) ) ( not ( = ?auto_15526 ?auto_15533 ) ) ( not ( = ?auto_15534 ?auto_15533 ) ) ( AVAILABLE ?auto_15523 ) ( not ( = ?auto_15524 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15524 ) ) ( not ( = ?auto_15522 ?auto_15524 ) ) ( not ( = ?auto_15538 ?auto_15524 ) ) ( HOIST-AT ?auto_15536 ?auto_15524 ) ( not ( = ?auto_15523 ?auto_15536 ) ) ( not ( = ?auto_15531 ?auto_15536 ) ) ( not ( = ?auto_15537 ?auto_15536 ) ) ( not ( = ?auto_15529 ?auto_15536 ) ) ( AVAILABLE ?auto_15536 ) ( SURFACE-AT ?auto_15532 ?auto_15524 ) ( ON ?auto_15532 ?auto_15525 ) ( CLEAR ?auto_15532 ) ( not ( = ?auto_15520 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15519 ?auto_15525 ) ) ( not ( = ?auto_15528 ?auto_15525 ) ) ( not ( = ?auto_15526 ?auto_15525 ) ) ( not ( = ?auto_15532 ?auto_15525 ) ) ( not ( = ?auto_15534 ?auto_15525 ) ) ( not ( = ?auto_15533 ?auto_15525 ) ) ( TRUCK-AT ?auto_15530 ?auto_15535 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15520 ?auto_15521 )
      ( MAKE-2CRATE-VERIFY ?auto_15519 ?auto_15520 ?auto_15521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15539 - SURFACE
      ?auto_15540 - SURFACE
      ?auto_15541 - SURFACE
      ?auto_15542 - SURFACE
    )
    :vars
    (
      ?auto_15554 - HOIST
      ?auto_15552 - PLACE
      ?auto_15545 - PLACE
      ?auto_15549 - HOIST
      ?auto_15556 - SURFACE
      ?auto_15550 - PLACE
      ?auto_15543 - HOIST
      ?auto_15548 - SURFACE
      ?auto_15557 - PLACE
      ?auto_15555 - HOIST
      ?auto_15551 - SURFACE
      ?auto_15553 - SURFACE
      ?auto_15558 - PLACE
      ?auto_15544 - HOIST
      ?auto_15546 - SURFACE
      ?auto_15547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15554 ?auto_15552 ) ( IS-CRATE ?auto_15542 ) ( not ( = ?auto_15541 ?auto_15542 ) ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( not ( = ?auto_15540 ?auto_15542 ) ) ( not ( = ?auto_15545 ?auto_15552 ) ) ( HOIST-AT ?auto_15549 ?auto_15545 ) ( not ( = ?auto_15554 ?auto_15549 ) ) ( AVAILABLE ?auto_15549 ) ( SURFACE-AT ?auto_15542 ?auto_15545 ) ( ON ?auto_15542 ?auto_15556 ) ( CLEAR ?auto_15542 ) ( not ( = ?auto_15541 ?auto_15556 ) ) ( not ( = ?auto_15542 ?auto_15556 ) ) ( not ( = ?auto_15540 ?auto_15556 ) ) ( IS-CRATE ?auto_15541 ) ( not ( = ?auto_15550 ?auto_15552 ) ) ( not ( = ?auto_15545 ?auto_15550 ) ) ( HOIST-AT ?auto_15543 ?auto_15550 ) ( not ( = ?auto_15554 ?auto_15543 ) ) ( not ( = ?auto_15549 ?auto_15543 ) ) ( AVAILABLE ?auto_15543 ) ( SURFACE-AT ?auto_15541 ?auto_15550 ) ( ON ?auto_15541 ?auto_15548 ) ( CLEAR ?auto_15541 ) ( not ( = ?auto_15541 ?auto_15548 ) ) ( not ( = ?auto_15542 ?auto_15548 ) ) ( not ( = ?auto_15540 ?auto_15548 ) ) ( not ( = ?auto_15556 ?auto_15548 ) ) ( IS-CRATE ?auto_15540 ) ( not ( = ?auto_15539 ?auto_15540 ) ) ( not ( = ?auto_15541 ?auto_15539 ) ) ( not ( = ?auto_15542 ?auto_15539 ) ) ( not ( = ?auto_15556 ?auto_15539 ) ) ( not ( = ?auto_15548 ?auto_15539 ) ) ( not ( = ?auto_15557 ?auto_15552 ) ) ( not ( = ?auto_15545 ?auto_15557 ) ) ( not ( = ?auto_15550 ?auto_15557 ) ) ( HOIST-AT ?auto_15555 ?auto_15557 ) ( not ( = ?auto_15554 ?auto_15555 ) ) ( not ( = ?auto_15549 ?auto_15555 ) ) ( not ( = ?auto_15543 ?auto_15555 ) ) ( AVAILABLE ?auto_15555 ) ( SURFACE-AT ?auto_15540 ?auto_15557 ) ( ON ?auto_15540 ?auto_15551 ) ( CLEAR ?auto_15540 ) ( not ( = ?auto_15541 ?auto_15551 ) ) ( not ( = ?auto_15542 ?auto_15551 ) ) ( not ( = ?auto_15540 ?auto_15551 ) ) ( not ( = ?auto_15556 ?auto_15551 ) ) ( not ( = ?auto_15548 ?auto_15551 ) ) ( not ( = ?auto_15539 ?auto_15551 ) ) ( SURFACE-AT ?auto_15553 ?auto_15552 ) ( CLEAR ?auto_15553 ) ( IS-CRATE ?auto_15539 ) ( not ( = ?auto_15553 ?auto_15539 ) ) ( not ( = ?auto_15541 ?auto_15553 ) ) ( not ( = ?auto_15542 ?auto_15553 ) ) ( not ( = ?auto_15540 ?auto_15553 ) ) ( not ( = ?auto_15556 ?auto_15553 ) ) ( not ( = ?auto_15548 ?auto_15553 ) ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( AVAILABLE ?auto_15554 ) ( not ( = ?auto_15558 ?auto_15552 ) ) ( not ( = ?auto_15545 ?auto_15558 ) ) ( not ( = ?auto_15550 ?auto_15558 ) ) ( not ( = ?auto_15557 ?auto_15558 ) ) ( HOIST-AT ?auto_15544 ?auto_15558 ) ( not ( = ?auto_15554 ?auto_15544 ) ) ( not ( = ?auto_15549 ?auto_15544 ) ) ( not ( = ?auto_15543 ?auto_15544 ) ) ( not ( = ?auto_15555 ?auto_15544 ) ) ( AVAILABLE ?auto_15544 ) ( SURFACE-AT ?auto_15539 ?auto_15558 ) ( ON ?auto_15539 ?auto_15546 ) ( CLEAR ?auto_15539 ) ( not ( = ?auto_15541 ?auto_15546 ) ) ( not ( = ?auto_15542 ?auto_15546 ) ) ( not ( = ?auto_15540 ?auto_15546 ) ) ( not ( = ?auto_15556 ?auto_15546 ) ) ( not ( = ?auto_15548 ?auto_15546 ) ) ( not ( = ?auto_15539 ?auto_15546 ) ) ( not ( = ?auto_15551 ?auto_15546 ) ) ( not ( = ?auto_15553 ?auto_15546 ) ) ( TRUCK-AT ?auto_15547 ?auto_15552 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15540 ?auto_15541 ?auto_15542 )
      ( MAKE-3CRATE-VERIFY ?auto_15539 ?auto_15540 ?auto_15541 ?auto_15542 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15559 - SURFACE
      ?auto_15560 - SURFACE
      ?auto_15561 - SURFACE
      ?auto_15562 - SURFACE
      ?auto_15563 - SURFACE
    )
    :vars
    (
      ?auto_15574 - HOIST
      ?auto_15573 - PLACE
      ?auto_15566 - PLACE
      ?auto_15570 - HOIST
      ?auto_15576 - SURFACE
      ?auto_15571 - PLACE
      ?auto_15564 - HOIST
      ?auto_15569 - SURFACE
      ?auto_15577 - PLACE
      ?auto_15575 - HOIST
      ?auto_15572 - SURFACE
      ?auto_15578 - PLACE
      ?auto_15565 - HOIST
      ?auto_15567 - SURFACE
      ?auto_15568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15574 ?auto_15573 ) ( IS-CRATE ?auto_15563 ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( not ( = ?auto_15561 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15563 ) ) ( not ( = ?auto_15566 ?auto_15573 ) ) ( HOIST-AT ?auto_15570 ?auto_15566 ) ( not ( = ?auto_15574 ?auto_15570 ) ) ( AVAILABLE ?auto_15570 ) ( SURFACE-AT ?auto_15563 ?auto_15566 ) ( ON ?auto_15563 ?auto_15576 ) ( CLEAR ?auto_15563 ) ( not ( = ?auto_15562 ?auto_15576 ) ) ( not ( = ?auto_15563 ?auto_15576 ) ) ( not ( = ?auto_15561 ?auto_15576 ) ) ( IS-CRATE ?auto_15562 ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15566 ?auto_15571 ) ) ( HOIST-AT ?auto_15564 ?auto_15571 ) ( not ( = ?auto_15574 ?auto_15564 ) ) ( not ( = ?auto_15570 ?auto_15564 ) ) ( AVAILABLE ?auto_15564 ) ( SURFACE-AT ?auto_15562 ?auto_15571 ) ( ON ?auto_15562 ?auto_15569 ) ( CLEAR ?auto_15562 ) ( not ( = ?auto_15562 ?auto_15569 ) ) ( not ( = ?auto_15563 ?auto_15569 ) ) ( not ( = ?auto_15561 ?auto_15569 ) ) ( not ( = ?auto_15576 ?auto_15569 ) ) ( IS-CRATE ?auto_15561 ) ( not ( = ?auto_15560 ?auto_15561 ) ) ( not ( = ?auto_15562 ?auto_15560 ) ) ( not ( = ?auto_15563 ?auto_15560 ) ) ( not ( = ?auto_15576 ?auto_15560 ) ) ( not ( = ?auto_15569 ?auto_15560 ) ) ( not ( = ?auto_15577 ?auto_15573 ) ) ( not ( = ?auto_15566 ?auto_15577 ) ) ( not ( = ?auto_15571 ?auto_15577 ) ) ( HOIST-AT ?auto_15575 ?auto_15577 ) ( not ( = ?auto_15574 ?auto_15575 ) ) ( not ( = ?auto_15570 ?auto_15575 ) ) ( not ( = ?auto_15564 ?auto_15575 ) ) ( AVAILABLE ?auto_15575 ) ( SURFACE-AT ?auto_15561 ?auto_15577 ) ( ON ?auto_15561 ?auto_15572 ) ( CLEAR ?auto_15561 ) ( not ( = ?auto_15562 ?auto_15572 ) ) ( not ( = ?auto_15563 ?auto_15572 ) ) ( not ( = ?auto_15561 ?auto_15572 ) ) ( not ( = ?auto_15576 ?auto_15572 ) ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( not ( = ?auto_15560 ?auto_15572 ) ) ( SURFACE-AT ?auto_15559 ?auto_15573 ) ( CLEAR ?auto_15559 ) ( IS-CRATE ?auto_15560 ) ( not ( = ?auto_15559 ?auto_15560 ) ) ( not ( = ?auto_15562 ?auto_15559 ) ) ( not ( = ?auto_15563 ?auto_15559 ) ) ( not ( = ?auto_15561 ?auto_15559 ) ) ( not ( = ?auto_15576 ?auto_15559 ) ) ( not ( = ?auto_15569 ?auto_15559 ) ) ( not ( = ?auto_15572 ?auto_15559 ) ) ( AVAILABLE ?auto_15574 ) ( not ( = ?auto_15578 ?auto_15573 ) ) ( not ( = ?auto_15566 ?auto_15578 ) ) ( not ( = ?auto_15571 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( HOIST-AT ?auto_15565 ?auto_15578 ) ( not ( = ?auto_15574 ?auto_15565 ) ) ( not ( = ?auto_15570 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15575 ?auto_15565 ) ) ( AVAILABLE ?auto_15565 ) ( SURFACE-AT ?auto_15560 ?auto_15578 ) ( ON ?auto_15560 ?auto_15567 ) ( CLEAR ?auto_15560 ) ( not ( = ?auto_15562 ?auto_15567 ) ) ( not ( = ?auto_15563 ?auto_15567 ) ) ( not ( = ?auto_15561 ?auto_15567 ) ) ( not ( = ?auto_15576 ?auto_15567 ) ) ( not ( = ?auto_15569 ?auto_15567 ) ) ( not ( = ?auto_15560 ?auto_15567 ) ) ( not ( = ?auto_15572 ?auto_15567 ) ) ( not ( = ?auto_15559 ?auto_15567 ) ) ( TRUCK-AT ?auto_15568 ?auto_15573 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15561 ?auto_15562 ?auto_15563 )
      ( MAKE-4CRATE-VERIFY ?auto_15559 ?auto_15560 ?auto_15561 ?auto_15562 ?auto_15563 ) )
  )

)

