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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12436 - SURFACE
      ?auto_12437 - SURFACE
    )
    :vars
    (
      ?auto_12438 - HOIST
      ?auto_12439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12438 ?auto_12439 ) ( SURFACE-AT ?auto_12436 ?auto_12439 ) ( CLEAR ?auto_12436 ) ( LIFTING ?auto_12438 ?auto_12437 ) ( IS-CRATE ?auto_12437 ) ( not ( = ?auto_12436 ?auto_12437 ) ) )
    :subtasks
    ( ( !DROP ?auto_12438 ?auto_12437 ?auto_12436 ?auto_12439 )
      ( MAKE-1CRATE-VERIFY ?auto_12436 ?auto_12437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12440 - SURFACE
      ?auto_12441 - SURFACE
    )
    :vars
    (
      ?auto_12443 - HOIST
      ?auto_12442 - PLACE
      ?auto_12444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12443 ?auto_12442 ) ( SURFACE-AT ?auto_12440 ?auto_12442 ) ( CLEAR ?auto_12440 ) ( IS-CRATE ?auto_12441 ) ( not ( = ?auto_12440 ?auto_12441 ) ) ( TRUCK-AT ?auto_12444 ?auto_12442 ) ( AVAILABLE ?auto_12443 ) ( IN ?auto_12441 ?auto_12444 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12443 ?auto_12441 ?auto_12444 ?auto_12442 )
      ( MAKE-1CRATE ?auto_12440 ?auto_12441 )
      ( MAKE-1CRATE-VERIFY ?auto_12440 ?auto_12441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12445 - SURFACE
      ?auto_12446 - SURFACE
    )
    :vars
    (
      ?auto_12447 - HOIST
      ?auto_12449 - PLACE
      ?auto_12448 - TRUCK
      ?auto_12450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12447 ?auto_12449 ) ( SURFACE-AT ?auto_12445 ?auto_12449 ) ( CLEAR ?auto_12445 ) ( IS-CRATE ?auto_12446 ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( AVAILABLE ?auto_12447 ) ( IN ?auto_12446 ?auto_12448 ) ( TRUCK-AT ?auto_12448 ?auto_12450 ) ( not ( = ?auto_12450 ?auto_12449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12448 ?auto_12450 ?auto_12449 )
      ( MAKE-1CRATE ?auto_12445 ?auto_12446 )
      ( MAKE-1CRATE-VERIFY ?auto_12445 ?auto_12446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12451 - SURFACE
      ?auto_12452 - SURFACE
    )
    :vars
    (
      ?auto_12454 - HOIST
      ?auto_12455 - PLACE
      ?auto_12453 - TRUCK
      ?auto_12456 - PLACE
      ?auto_12457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12454 ?auto_12455 ) ( SURFACE-AT ?auto_12451 ?auto_12455 ) ( CLEAR ?auto_12451 ) ( IS-CRATE ?auto_12452 ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( AVAILABLE ?auto_12454 ) ( TRUCK-AT ?auto_12453 ?auto_12456 ) ( not ( = ?auto_12456 ?auto_12455 ) ) ( HOIST-AT ?auto_12457 ?auto_12456 ) ( LIFTING ?auto_12457 ?auto_12452 ) ( not ( = ?auto_12454 ?auto_12457 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12457 ?auto_12452 ?auto_12453 ?auto_12456 )
      ( MAKE-1CRATE ?auto_12451 ?auto_12452 )
      ( MAKE-1CRATE-VERIFY ?auto_12451 ?auto_12452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12458 - SURFACE
      ?auto_12459 - SURFACE
    )
    :vars
    (
      ?auto_12462 - HOIST
      ?auto_12460 - PLACE
      ?auto_12463 - TRUCK
      ?auto_12461 - PLACE
      ?auto_12464 - HOIST
      ?auto_12465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12462 ?auto_12460 ) ( SURFACE-AT ?auto_12458 ?auto_12460 ) ( CLEAR ?auto_12458 ) ( IS-CRATE ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( AVAILABLE ?auto_12462 ) ( TRUCK-AT ?auto_12463 ?auto_12461 ) ( not ( = ?auto_12461 ?auto_12460 ) ) ( HOIST-AT ?auto_12464 ?auto_12461 ) ( not ( = ?auto_12462 ?auto_12464 ) ) ( AVAILABLE ?auto_12464 ) ( SURFACE-AT ?auto_12459 ?auto_12461 ) ( ON ?auto_12459 ?auto_12465 ) ( CLEAR ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12465 ) ) ( not ( = ?auto_12459 ?auto_12465 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12464 ?auto_12459 ?auto_12465 ?auto_12461 )
      ( MAKE-1CRATE ?auto_12458 ?auto_12459 )
      ( MAKE-1CRATE-VERIFY ?auto_12458 ?auto_12459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12466 - SURFACE
      ?auto_12467 - SURFACE
    )
    :vars
    (
      ?auto_12468 - HOIST
      ?auto_12471 - PLACE
      ?auto_12473 - PLACE
      ?auto_12469 - HOIST
      ?auto_12472 - SURFACE
      ?auto_12470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12468 ?auto_12471 ) ( SURFACE-AT ?auto_12466 ?auto_12471 ) ( CLEAR ?auto_12466 ) ( IS-CRATE ?auto_12467 ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( AVAILABLE ?auto_12468 ) ( not ( = ?auto_12473 ?auto_12471 ) ) ( HOIST-AT ?auto_12469 ?auto_12473 ) ( not ( = ?auto_12468 ?auto_12469 ) ) ( AVAILABLE ?auto_12469 ) ( SURFACE-AT ?auto_12467 ?auto_12473 ) ( ON ?auto_12467 ?auto_12472 ) ( CLEAR ?auto_12467 ) ( not ( = ?auto_12466 ?auto_12472 ) ) ( not ( = ?auto_12467 ?auto_12472 ) ) ( TRUCK-AT ?auto_12470 ?auto_12471 ) )
    :subtasks
    ( ( !DRIVE ?auto_12470 ?auto_12471 ?auto_12473 )
      ( MAKE-1CRATE ?auto_12466 ?auto_12467 )
      ( MAKE-1CRATE-VERIFY ?auto_12466 ?auto_12467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12483 - SURFACE
      ?auto_12484 - SURFACE
      ?auto_12485 - SURFACE
    )
    :vars
    (
      ?auto_12486 - HOIST
      ?auto_12487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12486 ?auto_12487 ) ( SURFACE-AT ?auto_12484 ?auto_12487 ) ( CLEAR ?auto_12484 ) ( LIFTING ?auto_12486 ?auto_12485 ) ( IS-CRATE ?auto_12485 ) ( not ( = ?auto_12484 ?auto_12485 ) ) ( ON ?auto_12484 ?auto_12483 ) ( not ( = ?auto_12483 ?auto_12484 ) ) ( not ( = ?auto_12483 ?auto_12485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12484 ?auto_12485 )
      ( MAKE-2CRATE-VERIFY ?auto_12483 ?auto_12484 ?auto_12485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12493 - SURFACE
      ?auto_12494 - SURFACE
      ?auto_12495 - SURFACE
    )
    :vars
    (
      ?auto_12498 - HOIST
      ?auto_12497 - PLACE
      ?auto_12496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12498 ?auto_12497 ) ( SURFACE-AT ?auto_12494 ?auto_12497 ) ( CLEAR ?auto_12494 ) ( IS-CRATE ?auto_12495 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( TRUCK-AT ?auto_12496 ?auto_12497 ) ( AVAILABLE ?auto_12498 ) ( IN ?auto_12495 ?auto_12496 ) ( ON ?auto_12494 ?auto_12493 ) ( not ( = ?auto_12493 ?auto_12494 ) ) ( not ( = ?auto_12493 ?auto_12495 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12494 ?auto_12495 )
      ( MAKE-2CRATE-VERIFY ?auto_12493 ?auto_12494 ?auto_12495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12499 - SURFACE
      ?auto_12500 - SURFACE
    )
    :vars
    (
      ?auto_12502 - HOIST
      ?auto_12504 - PLACE
      ?auto_12503 - TRUCK
      ?auto_12501 - SURFACE
      ?auto_12505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12502 ?auto_12504 ) ( SURFACE-AT ?auto_12499 ?auto_12504 ) ( CLEAR ?auto_12499 ) ( IS-CRATE ?auto_12500 ) ( not ( = ?auto_12499 ?auto_12500 ) ) ( AVAILABLE ?auto_12502 ) ( IN ?auto_12500 ?auto_12503 ) ( ON ?auto_12499 ?auto_12501 ) ( not ( = ?auto_12501 ?auto_12499 ) ) ( not ( = ?auto_12501 ?auto_12500 ) ) ( TRUCK-AT ?auto_12503 ?auto_12505 ) ( not ( = ?auto_12505 ?auto_12504 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12503 ?auto_12505 ?auto_12504 )
      ( MAKE-2CRATE ?auto_12501 ?auto_12499 ?auto_12500 )
      ( MAKE-1CRATE-VERIFY ?auto_12499 ?auto_12500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12506 - SURFACE
      ?auto_12507 - SURFACE
      ?auto_12508 - SURFACE
    )
    :vars
    (
      ?auto_12510 - HOIST
      ?auto_12511 - PLACE
      ?auto_12509 - TRUCK
      ?auto_12512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12510 ?auto_12511 ) ( SURFACE-AT ?auto_12507 ?auto_12511 ) ( CLEAR ?auto_12507 ) ( IS-CRATE ?auto_12508 ) ( not ( = ?auto_12507 ?auto_12508 ) ) ( AVAILABLE ?auto_12510 ) ( IN ?auto_12508 ?auto_12509 ) ( ON ?auto_12507 ?auto_12506 ) ( not ( = ?auto_12506 ?auto_12507 ) ) ( not ( = ?auto_12506 ?auto_12508 ) ) ( TRUCK-AT ?auto_12509 ?auto_12512 ) ( not ( = ?auto_12512 ?auto_12511 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12507 ?auto_12508 )
      ( MAKE-2CRATE-VERIFY ?auto_12506 ?auto_12507 ?auto_12508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12513 - SURFACE
      ?auto_12514 - SURFACE
    )
    :vars
    (
      ?auto_12517 - HOIST
      ?auto_12516 - PLACE
      ?auto_12519 - SURFACE
      ?auto_12518 - TRUCK
      ?auto_12515 - PLACE
      ?auto_12520 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12517 ?auto_12516 ) ( SURFACE-AT ?auto_12513 ?auto_12516 ) ( CLEAR ?auto_12513 ) ( IS-CRATE ?auto_12514 ) ( not ( = ?auto_12513 ?auto_12514 ) ) ( AVAILABLE ?auto_12517 ) ( ON ?auto_12513 ?auto_12519 ) ( not ( = ?auto_12519 ?auto_12513 ) ) ( not ( = ?auto_12519 ?auto_12514 ) ) ( TRUCK-AT ?auto_12518 ?auto_12515 ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( HOIST-AT ?auto_12520 ?auto_12515 ) ( LIFTING ?auto_12520 ?auto_12514 ) ( not ( = ?auto_12517 ?auto_12520 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12520 ?auto_12514 ?auto_12518 ?auto_12515 )
      ( MAKE-2CRATE ?auto_12519 ?auto_12513 ?auto_12514 )
      ( MAKE-1CRATE-VERIFY ?auto_12513 ?auto_12514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12521 - SURFACE
      ?auto_12522 - SURFACE
      ?auto_12523 - SURFACE
    )
    :vars
    (
      ?auto_12528 - HOIST
      ?auto_12527 - PLACE
      ?auto_12526 - TRUCK
      ?auto_12524 - PLACE
      ?auto_12525 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12528 ?auto_12527 ) ( SURFACE-AT ?auto_12522 ?auto_12527 ) ( CLEAR ?auto_12522 ) ( IS-CRATE ?auto_12523 ) ( not ( = ?auto_12522 ?auto_12523 ) ) ( AVAILABLE ?auto_12528 ) ( ON ?auto_12522 ?auto_12521 ) ( not ( = ?auto_12521 ?auto_12522 ) ) ( not ( = ?auto_12521 ?auto_12523 ) ) ( TRUCK-AT ?auto_12526 ?auto_12524 ) ( not ( = ?auto_12524 ?auto_12527 ) ) ( HOIST-AT ?auto_12525 ?auto_12524 ) ( LIFTING ?auto_12525 ?auto_12523 ) ( not ( = ?auto_12528 ?auto_12525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12522 ?auto_12523 )
      ( MAKE-2CRATE-VERIFY ?auto_12521 ?auto_12522 ?auto_12523 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12529 - SURFACE
      ?auto_12530 - SURFACE
    )
    :vars
    (
      ?auto_12533 - HOIST
      ?auto_12532 - PLACE
      ?auto_12536 - SURFACE
      ?auto_12534 - TRUCK
      ?auto_12535 - PLACE
      ?auto_12531 - HOIST
      ?auto_12537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12533 ?auto_12532 ) ( SURFACE-AT ?auto_12529 ?auto_12532 ) ( CLEAR ?auto_12529 ) ( IS-CRATE ?auto_12530 ) ( not ( = ?auto_12529 ?auto_12530 ) ) ( AVAILABLE ?auto_12533 ) ( ON ?auto_12529 ?auto_12536 ) ( not ( = ?auto_12536 ?auto_12529 ) ) ( not ( = ?auto_12536 ?auto_12530 ) ) ( TRUCK-AT ?auto_12534 ?auto_12535 ) ( not ( = ?auto_12535 ?auto_12532 ) ) ( HOIST-AT ?auto_12531 ?auto_12535 ) ( not ( = ?auto_12533 ?auto_12531 ) ) ( AVAILABLE ?auto_12531 ) ( SURFACE-AT ?auto_12530 ?auto_12535 ) ( ON ?auto_12530 ?auto_12537 ) ( CLEAR ?auto_12530 ) ( not ( = ?auto_12529 ?auto_12537 ) ) ( not ( = ?auto_12530 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12537 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12531 ?auto_12530 ?auto_12537 ?auto_12535 )
      ( MAKE-2CRATE ?auto_12536 ?auto_12529 ?auto_12530 )
      ( MAKE-1CRATE-VERIFY ?auto_12529 ?auto_12530 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12538 - SURFACE
      ?auto_12539 - SURFACE
      ?auto_12540 - SURFACE
    )
    :vars
    (
      ?auto_12546 - HOIST
      ?auto_12544 - PLACE
      ?auto_12541 - TRUCK
      ?auto_12545 - PLACE
      ?auto_12542 - HOIST
      ?auto_12543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12546 ?auto_12544 ) ( SURFACE-AT ?auto_12539 ?auto_12544 ) ( CLEAR ?auto_12539 ) ( IS-CRATE ?auto_12540 ) ( not ( = ?auto_12539 ?auto_12540 ) ) ( AVAILABLE ?auto_12546 ) ( ON ?auto_12539 ?auto_12538 ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( not ( = ?auto_12538 ?auto_12540 ) ) ( TRUCK-AT ?auto_12541 ?auto_12545 ) ( not ( = ?auto_12545 ?auto_12544 ) ) ( HOIST-AT ?auto_12542 ?auto_12545 ) ( not ( = ?auto_12546 ?auto_12542 ) ) ( AVAILABLE ?auto_12542 ) ( SURFACE-AT ?auto_12540 ?auto_12545 ) ( ON ?auto_12540 ?auto_12543 ) ( CLEAR ?auto_12540 ) ( not ( = ?auto_12539 ?auto_12543 ) ) ( not ( = ?auto_12540 ?auto_12543 ) ) ( not ( = ?auto_12538 ?auto_12543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12539 ?auto_12540 )
      ( MAKE-2CRATE-VERIFY ?auto_12538 ?auto_12539 ?auto_12540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12547 - SURFACE
      ?auto_12548 - SURFACE
    )
    :vars
    (
      ?auto_12554 - HOIST
      ?auto_12549 - PLACE
      ?auto_12555 - SURFACE
      ?auto_12553 - PLACE
      ?auto_12550 - HOIST
      ?auto_12551 - SURFACE
      ?auto_12552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12554 ?auto_12549 ) ( SURFACE-AT ?auto_12547 ?auto_12549 ) ( CLEAR ?auto_12547 ) ( IS-CRATE ?auto_12548 ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( AVAILABLE ?auto_12554 ) ( ON ?auto_12547 ?auto_12555 ) ( not ( = ?auto_12555 ?auto_12547 ) ) ( not ( = ?auto_12555 ?auto_12548 ) ) ( not ( = ?auto_12553 ?auto_12549 ) ) ( HOIST-AT ?auto_12550 ?auto_12553 ) ( not ( = ?auto_12554 ?auto_12550 ) ) ( AVAILABLE ?auto_12550 ) ( SURFACE-AT ?auto_12548 ?auto_12553 ) ( ON ?auto_12548 ?auto_12551 ) ( CLEAR ?auto_12548 ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( not ( = ?auto_12548 ?auto_12551 ) ) ( not ( = ?auto_12555 ?auto_12551 ) ) ( TRUCK-AT ?auto_12552 ?auto_12549 ) )
    :subtasks
    ( ( !DRIVE ?auto_12552 ?auto_12549 ?auto_12553 )
      ( MAKE-2CRATE ?auto_12555 ?auto_12547 ?auto_12548 )
      ( MAKE-1CRATE-VERIFY ?auto_12547 ?auto_12548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12556 - SURFACE
      ?auto_12557 - SURFACE
      ?auto_12558 - SURFACE
    )
    :vars
    (
      ?auto_12559 - HOIST
      ?auto_12562 - PLACE
      ?auto_12563 - PLACE
      ?auto_12561 - HOIST
      ?auto_12564 - SURFACE
      ?auto_12560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12559 ?auto_12562 ) ( SURFACE-AT ?auto_12557 ?auto_12562 ) ( CLEAR ?auto_12557 ) ( IS-CRATE ?auto_12558 ) ( not ( = ?auto_12557 ?auto_12558 ) ) ( AVAILABLE ?auto_12559 ) ( ON ?auto_12557 ?auto_12556 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12558 ) ) ( not ( = ?auto_12563 ?auto_12562 ) ) ( HOIST-AT ?auto_12561 ?auto_12563 ) ( not ( = ?auto_12559 ?auto_12561 ) ) ( AVAILABLE ?auto_12561 ) ( SURFACE-AT ?auto_12558 ?auto_12563 ) ( ON ?auto_12558 ?auto_12564 ) ( CLEAR ?auto_12558 ) ( not ( = ?auto_12557 ?auto_12564 ) ) ( not ( = ?auto_12558 ?auto_12564 ) ) ( not ( = ?auto_12556 ?auto_12564 ) ) ( TRUCK-AT ?auto_12560 ?auto_12562 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12557 ?auto_12558 )
      ( MAKE-2CRATE-VERIFY ?auto_12556 ?auto_12557 ?auto_12558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12565 - SURFACE
      ?auto_12566 - SURFACE
    )
    :vars
    (
      ?auto_12573 - HOIST
      ?auto_12570 - PLACE
      ?auto_12567 - SURFACE
      ?auto_12572 - PLACE
      ?auto_12571 - HOIST
      ?auto_12568 - SURFACE
      ?auto_12569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12573 ?auto_12570 ) ( IS-CRATE ?auto_12566 ) ( not ( = ?auto_12565 ?auto_12566 ) ) ( not ( = ?auto_12567 ?auto_12565 ) ) ( not ( = ?auto_12567 ?auto_12566 ) ) ( not ( = ?auto_12572 ?auto_12570 ) ) ( HOIST-AT ?auto_12571 ?auto_12572 ) ( not ( = ?auto_12573 ?auto_12571 ) ) ( AVAILABLE ?auto_12571 ) ( SURFACE-AT ?auto_12566 ?auto_12572 ) ( ON ?auto_12566 ?auto_12568 ) ( CLEAR ?auto_12566 ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( TRUCK-AT ?auto_12569 ?auto_12570 ) ( SURFACE-AT ?auto_12567 ?auto_12570 ) ( CLEAR ?auto_12567 ) ( LIFTING ?auto_12573 ?auto_12565 ) ( IS-CRATE ?auto_12565 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12567 ?auto_12565 )
      ( MAKE-2CRATE ?auto_12567 ?auto_12565 ?auto_12566 )
      ( MAKE-1CRATE-VERIFY ?auto_12565 ?auto_12566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12574 - SURFACE
      ?auto_12575 - SURFACE
      ?auto_12576 - SURFACE
    )
    :vars
    (
      ?auto_12581 - HOIST
      ?auto_12577 - PLACE
      ?auto_12578 - PLACE
      ?auto_12580 - HOIST
      ?auto_12579 - SURFACE
      ?auto_12582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12581 ?auto_12577 ) ( IS-CRATE ?auto_12576 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( not ( = ?auto_12574 ?auto_12576 ) ) ( not ( = ?auto_12578 ?auto_12577 ) ) ( HOIST-AT ?auto_12580 ?auto_12578 ) ( not ( = ?auto_12581 ?auto_12580 ) ) ( AVAILABLE ?auto_12580 ) ( SURFACE-AT ?auto_12576 ?auto_12578 ) ( ON ?auto_12576 ?auto_12579 ) ( CLEAR ?auto_12576 ) ( not ( = ?auto_12575 ?auto_12579 ) ) ( not ( = ?auto_12576 ?auto_12579 ) ) ( not ( = ?auto_12574 ?auto_12579 ) ) ( TRUCK-AT ?auto_12582 ?auto_12577 ) ( SURFACE-AT ?auto_12574 ?auto_12577 ) ( CLEAR ?auto_12574 ) ( LIFTING ?auto_12581 ?auto_12575 ) ( IS-CRATE ?auto_12575 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12575 ?auto_12576 )
      ( MAKE-2CRATE-VERIFY ?auto_12574 ?auto_12575 ?auto_12576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12583 - SURFACE
      ?auto_12584 - SURFACE
    )
    :vars
    (
      ?auto_12586 - HOIST
      ?auto_12585 - PLACE
      ?auto_12587 - SURFACE
      ?auto_12590 - PLACE
      ?auto_12591 - HOIST
      ?auto_12589 - SURFACE
      ?auto_12588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12586 ?auto_12585 ) ( IS-CRATE ?auto_12584 ) ( not ( = ?auto_12583 ?auto_12584 ) ) ( not ( = ?auto_12587 ?auto_12583 ) ) ( not ( = ?auto_12587 ?auto_12584 ) ) ( not ( = ?auto_12590 ?auto_12585 ) ) ( HOIST-AT ?auto_12591 ?auto_12590 ) ( not ( = ?auto_12586 ?auto_12591 ) ) ( AVAILABLE ?auto_12591 ) ( SURFACE-AT ?auto_12584 ?auto_12590 ) ( ON ?auto_12584 ?auto_12589 ) ( CLEAR ?auto_12584 ) ( not ( = ?auto_12583 ?auto_12589 ) ) ( not ( = ?auto_12584 ?auto_12589 ) ) ( not ( = ?auto_12587 ?auto_12589 ) ) ( TRUCK-AT ?auto_12588 ?auto_12585 ) ( SURFACE-AT ?auto_12587 ?auto_12585 ) ( CLEAR ?auto_12587 ) ( IS-CRATE ?auto_12583 ) ( AVAILABLE ?auto_12586 ) ( IN ?auto_12583 ?auto_12588 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12586 ?auto_12583 ?auto_12588 ?auto_12585 )
      ( MAKE-2CRATE ?auto_12587 ?auto_12583 ?auto_12584 )
      ( MAKE-1CRATE-VERIFY ?auto_12583 ?auto_12584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12592 - SURFACE
      ?auto_12593 - SURFACE
      ?auto_12594 - SURFACE
    )
    :vars
    (
      ?auto_12595 - HOIST
      ?auto_12596 - PLACE
      ?auto_12599 - PLACE
      ?auto_12600 - HOIST
      ?auto_12597 - SURFACE
      ?auto_12598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12595 ?auto_12596 ) ( IS-CRATE ?auto_12594 ) ( not ( = ?auto_12593 ?auto_12594 ) ) ( not ( = ?auto_12592 ?auto_12593 ) ) ( not ( = ?auto_12592 ?auto_12594 ) ) ( not ( = ?auto_12599 ?auto_12596 ) ) ( HOIST-AT ?auto_12600 ?auto_12599 ) ( not ( = ?auto_12595 ?auto_12600 ) ) ( AVAILABLE ?auto_12600 ) ( SURFACE-AT ?auto_12594 ?auto_12599 ) ( ON ?auto_12594 ?auto_12597 ) ( CLEAR ?auto_12594 ) ( not ( = ?auto_12593 ?auto_12597 ) ) ( not ( = ?auto_12594 ?auto_12597 ) ) ( not ( = ?auto_12592 ?auto_12597 ) ) ( TRUCK-AT ?auto_12598 ?auto_12596 ) ( SURFACE-AT ?auto_12592 ?auto_12596 ) ( CLEAR ?auto_12592 ) ( IS-CRATE ?auto_12593 ) ( AVAILABLE ?auto_12595 ) ( IN ?auto_12593 ?auto_12598 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12593 ?auto_12594 )
      ( MAKE-2CRATE-VERIFY ?auto_12592 ?auto_12593 ?auto_12594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12601 - SURFACE
      ?auto_12602 - SURFACE
    )
    :vars
    (
      ?auto_12605 - HOIST
      ?auto_12609 - PLACE
      ?auto_12603 - SURFACE
      ?auto_12606 - PLACE
      ?auto_12608 - HOIST
      ?auto_12607 - SURFACE
      ?auto_12604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12605 ?auto_12609 ) ( IS-CRATE ?auto_12602 ) ( not ( = ?auto_12601 ?auto_12602 ) ) ( not ( = ?auto_12603 ?auto_12601 ) ) ( not ( = ?auto_12603 ?auto_12602 ) ) ( not ( = ?auto_12606 ?auto_12609 ) ) ( HOIST-AT ?auto_12608 ?auto_12606 ) ( not ( = ?auto_12605 ?auto_12608 ) ) ( AVAILABLE ?auto_12608 ) ( SURFACE-AT ?auto_12602 ?auto_12606 ) ( ON ?auto_12602 ?auto_12607 ) ( CLEAR ?auto_12602 ) ( not ( = ?auto_12601 ?auto_12607 ) ) ( not ( = ?auto_12602 ?auto_12607 ) ) ( not ( = ?auto_12603 ?auto_12607 ) ) ( SURFACE-AT ?auto_12603 ?auto_12609 ) ( CLEAR ?auto_12603 ) ( IS-CRATE ?auto_12601 ) ( AVAILABLE ?auto_12605 ) ( IN ?auto_12601 ?auto_12604 ) ( TRUCK-AT ?auto_12604 ?auto_12606 ) )
    :subtasks
    ( ( !DRIVE ?auto_12604 ?auto_12606 ?auto_12609 )
      ( MAKE-2CRATE ?auto_12603 ?auto_12601 ?auto_12602 )
      ( MAKE-1CRATE-VERIFY ?auto_12601 ?auto_12602 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12610 - SURFACE
      ?auto_12611 - SURFACE
      ?auto_12612 - SURFACE
    )
    :vars
    (
      ?auto_12613 - HOIST
      ?auto_12618 - PLACE
      ?auto_12616 - PLACE
      ?auto_12617 - HOIST
      ?auto_12615 - SURFACE
      ?auto_12614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12613 ?auto_12618 ) ( IS-CRATE ?auto_12612 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12612 ) ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( HOIST-AT ?auto_12617 ?auto_12616 ) ( not ( = ?auto_12613 ?auto_12617 ) ) ( AVAILABLE ?auto_12617 ) ( SURFACE-AT ?auto_12612 ?auto_12616 ) ( ON ?auto_12612 ?auto_12615 ) ( CLEAR ?auto_12612 ) ( not ( = ?auto_12611 ?auto_12615 ) ) ( not ( = ?auto_12612 ?auto_12615 ) ) ( not ( = ?auto_12610 ?auto_12615 ) ) ( SURFACE-AT ?auto_12610 ?auto_12618 ) ( CLEAR ?auto_12610 ) ( IS-CRATE ?auto_12611 ) ( AVAILABLE ?auto_12613 ) ( IN ?auto_12611 ?auto_12614 ) ( TRUCK-AT ?auto_12614 ?auto_12616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12611 ?auto_12612 )
      ( MAKE-2CRATE-VERIFY ?auto_12610 ?auto_12611 ?auto_12612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12619 - SURFACE
      ?auto_12620 - SURFACE
    )
    :vars
    (
      ?auto_12621 - HOIST
      ?auto_12627 - PLACE
      ?auto_12626 - SURFACE
      ?auto_12624 - PLACE
      ?auto_12622 - HOIST
      ?auto_12623 - SURFACE
      ?auto_12625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12621 ?auto_12627 ) ( IS-CRATE ?auto_12620 ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12626 ?auto_12619 ) ) ( not ( = ?auto_12626 ?auto_12620 ) ) ( not ( = ?auto_12624 ?auto_12627 ) ) ( HOIST-AT ?auto_12622 ?auto_12624 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( SURFACE-AT ?auto_12620 ?auto_12624 ) ( ON ?auto_12620 ?auto_12623 ) ( CLEAR ?auto_12620 ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( not ( = ?auto_12620 ?auto_12623 ) ) ( not ( = ?auto_12626 ?auto_12623 ) ) ( SURFACE-AT ?auto_12626 ?auto_12627 ) ( CLEAR ?auto_12626 ) ( IS-CRATE ?auto_12619 ) ( AVAILABLE ?auto_12621 ) ( TRUCK-AT ?auto_12625 ?auto_12624 ) ( LIFTING ?auto_12622 ?auto_12619 ) )
    :subtasks
    ( ( !LOAD ?auto_12622 ?auto_12619 ?auto_12625 ?auto_12624 )
      ( MAKE-2CRATE ?auto_12626 ?auto_12619 ?auto_12620 )
      ( MAKE-1CRATE-VERIFY ?auto_12619 ?auto_12620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12628 - SURFACE
      ?auto_12629 - SURFACE
      ?auto_12630 - SURFACE
    )
    :vars
    (
      ?auto_12633 - HOIST
      ?auto_12634 - PLACE
      ?auto_12635 - PLACE
      ?auto_12631 - HOIST
      ?auto_12636 - SURFACE
      ?auto_12632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12633 ?auto_12634 ) ( IS-CRATE ?auto_12630 ) ( not ( = ?auto_12629 ?auto_12630 ) ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12628 ?auto_12630 ) ) ( not ( = ?auto_12635 ?auto_12634 ) ) ( HOIST-AT ?auto_12631 ?auto_12635 ) ( not ( = ?auto_12633 ?auto_12631 ) ) ( SURFACE-AT ?auto_12630 ?auto_12635 ) ( ON ?auto_12630 ?auto_12636 ) ( CLEAR ?auto_12630 ) ( not ( = ?auto_12629 ?auto_12636 ) ) ( not ( = ?auto_12630 ?auto_12636 ) ) ( not ( = ?auto_12628 ?auto_12636 ) ) ( SURFACE-AT ?auto_12628 ?auto_12634 ) ( CLEAR ?auto_12628 ) ( IS-CRATE ?auto_12629 ) ( AVAILABLE ?auto_12633 ) ( TRUCK-AT ?auto_12632 ?auto_12635 ) ( LIFTING ?auto_12631 ?auto_12629 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12629 ?auto_12630 )
      ( MAKE-2CRATE-VERIFY ?auto_12628 ?auto_12629 ?auto_12630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12637 - SURFACE
      ?auto_12638 - SURFACE
    )
    :vars
    (
      ?auto_12643 - HOIST
      ?auto_12639 - PLACE
      ?auto_12642 - SURFACE
      ?auto_12644 - PLACE
      ?auto_12645 - HOIST
      ?auto_12640 - SURFACE
      ?auto_12641 - TRUCK
      ?auto_12646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12643 ?auto_12639 ) ( IS-CRATE ?auto_12638 ) ( not ( = ?auto_12637 ?auto_12638 ) ) ( not ( = ?auto_12642 ?auto_12637 ) ) ( not ( = ?auto_12642 ?auto_12638 ) ) ( not ( = ?auto_12644 ?auto_12639 ) ) ( HOIST-AT ?auto_12645 ?auto_12644 ) ( not ( = ?auto_12643 ?auto_12645 ) ) ( SURFACE-AT ?auto_12638 ?auto_12644 ) ( ON ?auto_12638 ?auto_12640 ) ( CLEAR ?auto_12638 ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( not ( = ?auto_12642 ?auto_12640 ) ) ( SURFACE-AT ?auto_12642 ?auto_12639 ) ( CLEAR ?auto_12642 ) ( IS-CRATE ?auto_12637 ) ( AVAILABLE ?auto_12643 ) ( TRUCK-AT ?auto_12641 ?auto_12644 ) ( AVAILABLE ?auto_12645 ) ( SURFACE-AT ?auto_12637 ?auto_12644 ) ( ON ?auto_12637 ?auto_12646 ) ( CLEAR ?auto_12637 ) ( not ( = ?auto_12637 ?auto_12646 ) ) ( not ( = ?auto_12638 ?auto_12646 ) ) ( not ( = ?auto_12642 ?auto_12646 ) ) ( not ( = ?auto_12640 ?auto_12646 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12645 ?auto_12637 ?auto_12646 ?auto_12644 )
      ( MAKE-2CRATE ?auto_12642 ?auto_12637 ?auto_12638 )
      ( MAKE-1CRATE-VERIFY ?auto_12637 ?auto_12638 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12647 - SURFACE
      ?auto_12648 - SURFACE
      ?auto_12649 - SURFACE
    )
    :vars
    (
      ?auto_12650 - HOIST
      ?auto_12655 - PLACE
      ?auto_12652 - PLACE
      ?auto_12653 - HOIST
      ?auto_12656 - SURFACE
      ?auto_12651 - TRUCK
      ?auto_12654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12650 ?auto_12655 ) ( IS-CRATE ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12649 ) ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( HOIST-AT ?auto_12653 ?auto_12652 ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( SURFACE-AT ?auto_12649 ?auto_12652 ) ( ON ?auto_12649 ?auto_12656 ) ( CLEAR ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12656 ) ) ( not ( = ?auto_12649 ?auto_12656 ) ) ( not ( = ?auto_12647 ?auto_12656 ) ) ( SURFACE-AT ?auto_12647 ?auto_12655 ) ( CLEAR ?auto_12647 ) ( IS-CRATE ?auto_12648 ) ( AVAILABLE ?auto_12650 ) ( TRUCK-AT ?auto_12651 ?auto_12652 ) ( AVAILABLE ?auto_12653 ) ( SURFACE-AT ?auto_12648 ?auto_12652 ) ( ON ?auto_12648 ?auto_12654 ) ( CLEAR ?auto_12648 ) ( not ( = ?auto_12648 ?auto_12654 ) ) ( not ( = ?auto_12649 ?auto_12654 ) ) ( not ( = ?auto_12647 ?auto_12654 ) ) ( not ( = ?auto_12656 ?auto_12654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12648 ?auto_12649 )
      ( MAKE-2CRATE-VERIFY ?auto_12647 ?auto_12648 ?auto_12649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12657 - SURFACE
      ?auto_12658 - SURFACE
    )
    :vars
    (
      ?auto_12664 - HOIST
      ?auto_12662 - PLACE
      ?auto_12663 - SURFACE
      ?auto_12666 - PLACE
      ?auto_12659 - HOIST
      ?auto_12661 - SURFACE
      ?auto_12665 - SURFACE
      ?auto_12660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12664 ?auto_12662 ) ( IS-CRATE ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12658 ) ) ( not ( = ?auto_12663 ?auto_12657 ) ) ( not ( = ?auto_12663 ?auto_12658 ) ) ( not ( = ?auto_12666 ?auto_12662 ) ) ( HOIST-AT ?auto_12659 ?auto_12666 ) ( not ( = ?auto_12664 ?auto_12659 ) ) ( SURFACE-AT ?auto_12658 ?auto_12666 ) ( ON ?auto_12658 ?auto_12661 ) ( CLEAR ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12661 ) ) ( not ( = ?auto_12658 ?auto_12661 ) ) ( not ( = ?auto_12663 ?auto_12661 ) ) ( SURFACE-AT ?auto_12663 ?auto_12662 ) ( CLEAR ?auto_12663 ) ( IS-CRATE ?auto_12657 ) ( AVAILABLE ?auto_12664 ) ( AVAILABLE ?auto_12659 ) ( SURFACE-AT ?auto_12657 ?auto_12666 ) ( ON ?auto_12657 ?auto_12665 ) ( CLEAR ?auto_12657 ) ( not ( = ?auto_12657 ?auto_12665 ) ) ( not ( = ?auto_12658 ?auto_12665 ) ) ( not ( = ?auto_12663 ?auto_12665 ) ) ( not ( = ?auto_12661 ?auto_12665 ) ) ( TRUCK-AT ?auto_12660 ?auto_12662 ) )
    :subtasks
    ( ( !DRIVE ?auto_12660 ?auto_12662 ?auto_12666 )
      ( MAKE-2CRATE ?auto_12663 ?auto_12657 ?auto_12658 )
      ( MAKE-1CRATE-VERIFY ?auto_12657 ?auto_12658 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12667 - SURFACE
      ?auto_12668 - SURFACE
      ?auto_12669 - SURFACE
    )
    :vars
    (
      ?auto_12676 - HOIST
      ?auto_12670 - PLACE
      ?auto_12672 - PLACE
      ?auto_12674 - HOIST
      ?auto_12671 - SURFACE
      ?auto_12675 - SURFACE
      ?auto_12673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12676 ?auto_12670 ) ( IS-CRATE ?auto_12669 ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( not ( = ?auto_12672 ?auto_12670 ) ) ( HOIST-AT ?auto_12674 ?auto_12672 ) ( not ( = ?auto_12676 ?auto_12674 ) ) ( SURFACE-AT ?auto_12669 ?auto_12672 ) ( ON ?auto_12669 ?auto_12671 ) ( CLEAR ?auto_12669 ) ( not ( = ?auto_12668 ?auto_12671 ) ) ( not ( = ?auto_12669 ?auto_12671 ) ) ( not ( = ?auto_12667 ?auto_12671 ) ) ( SURFACE-AT ?auto_12667 ?auto_12670 ) ( CLEAR ?auto_12667 ) ( IS-CRATE ?auto_12668 ) ( AVAILABLE ?auto_12676 ) ( AVAILABLE ?auto_12674 ) ( SURFACE-AT ?auto_12668 ?auto_12672 ) ( ON ?auto_12668 ?auto_12675 ) ( CLEAR ?auto_12668 ) ( not ( = ?auto_12668 ?auto_12675 ) ) ( not ( = ?auto_12669 ?auto_12675 ) ) ( not ( = ?auto_12667 ?auto_12675 ) ) ( not ( = ?auto_12671 ?auto_12675 ) ) ( TRUCK-AT ?auto_12673 ?auto_12670 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12668 ?auto_12669 )
      ( MAKE-2CRATE-VERIFY ?auto_12667 ?auto_12668 ?auto_12669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12695 - SURFACE
      ?auto_12696 - SURFACE
      ?auto_12697 - SURFACE
      ?auto_12698 - SURFACE
    )
    :vars
    (
      ?auto_12700 - HOIST
      ?auto_12699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12700 ?auto_12699 ) ( SURFACE-AT ?auto_12697 ?auto_12699 ) ( CLEAR ?auto_12697 ) ( LIFTING ?auto_12700 ?auto_12698 ) ( IS-CRATE ?auto_12698 ) ( not ( = ?auto_12697 ?auto_12698 ) ) ( ON ?auto_12696 ?auto_12695 ) ( ON ?auto_12697 ?auto_12696 ) ( not ( = ?auto_12695 ?auto_12696 ) ) ( not ( = ?auto_12695 ?auto_12697 ) ) ( not ( = ?auto_12695 ?auto_12698 ) ) ( not ( = ?auto_12696 ?auto_12697 ) ) ( not ( = ?auto_12696 ?auto_12698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12697 ?auto_12698 )
      ( MAKE-3CRATE-VERIFY ?auto_12695 ?auto_12696 ?auto_12697 ?auto_12698 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12712 - SURFACE
      ?auto_12713 - SURFACE
      ?auto_12714 - SURFACE
      ?auto_12715 - SURFACE
    )
    :vars
    (
      ?auto_12716 - HOIST
      ?auto_12718 - PLACE
      ?auto_12717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12716 ?auto_12718 ) ( SURFACE-AT ?auto_12714 ?auto_12718 ) ( CLEAR ?auto_12714 ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( TRUCK-AT ?auto_12717 ?auto_12718 ) ( AVAILABLE ?auto_12716 ) ( IN ?auto_12715 ?auto_12717 ) ( ON ?auto_12714 ?auto_12713 ) ( not ( = ?auto_12713 ?auto_12714 ) ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( ON ?auto_12713 ?auto_12712 ) ( not ( = ?auto_12712 ?auto_12713 ) ) ( not ( = ?auto_12712 ?auto_12714 ) ) ( not ( = ?auto_12712 ?auto_12715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12713 ?auto_12714 ?auto_12715 )
      ( MAKE-3CRATE-VERIFY ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12733 - SURFACE
      ?auto_12734 - SURFACE
      ?auto_12735 - SURFACE
      ?auto_12736 - SURFACE
    )
    :vars
    (
      ?auto_12740 - HOIST
      ?auto_12739 - PLACE
      ?auto_12738 - TRUCK
      ?auto_12737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12740 ?auto_12739 ) ( SURFACE-AT ?auto_12735 ?auto_12739 ) ( CLEAR ?auto_12735 ) ( IS-CRATE ?auto_12736 ) ( not ( = ?auto_12735 ?auto_12736 ) ) ( AVAILABLE ?auto_12740 ) ( IN ?auto_12736 ?auto_12738 ) ( ON ?auto_12735 ?auto_12734 ) ( not ( = ?auto_12734 ?auto_12735 ) ) ( not ( = ?auto_12734 ?auto_12736 ) ) ( TRUCK-AT ?auto_12738 ?auto_12737 ) ( not ( = ?auto_12737 ?auto_12739 ) ) ( ON ?auto_12734 ?auto_12733 ) ( not ( = ?auto_12733 ?auto_12734 ) ) ( not ( = ?auto_12733 ?auto_12735 ) ) ( not ( = ?auto_12733 ?auto_12736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12734 ?auto_12735 ?auto_12736 )
      ( MAKE-3CRATE-VERIFY ?auto_12733 ?auto_12734 ?auto_12735 ?auto_12736 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12757 - SURFACE
      ?auto_12758 - SURFACE
      ?auto_12759 - SURFACE
      ?auto_12760 - SURFACE
    )
    :vars
    (
      ?auto_12764 - HOIST
      ?auto_12763 - PLACE
      ?auto_12765 - TRUCK
      ?auto_12762 - PLACE
      ?auto_12761 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12764 ?auto_12763 ) ( SURFACE-AT ?auto_12759 ?auto_12763 ) ( CLEAR ?auto_12759 ) ( IS-CRATE ?auto_12760 ) ( not ( = ?auto_12759 ?auto_12760 ) ) ( AVAILABLE ?auto_12764 ) ( ON ?auto_12759 ?auto_12758 ) ( not ( = ?auto_12758 ?auto_12759 ) ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( TRUCK-AT ?auto_12765 ?auto_12762 ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( HOIST-AT ?auto_12761 ?auto_12762 ) ( LIFTING ?auto_12761 ?auto_12760 ) ( not ( = ?auto_12764 ?auto_12761 ) ) ( ON ?auto_12758 ?auto_12757 ) ( not ( = ?auto_12757 ?auto_12758 ) ) ( not ( = ?auto_12757 ?auto_12759 ) ) ( not ( = ?auto_12757 ?auto_12760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12758 ?auto_12759 ?auto_12760 )
      ( MAKE-3CRATE-VERIFY ?auto_12757 ?auto_12758 ?auto_12759 ?auto_12760 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12784 - SURFACE
      ?auto_12785 - SURFACE
      ?auto_12786 - SURFACE
      ?auto_12787 - SURFACE
    )
    :vars
    (
      ?auto_12790 - HOIST
      ?auto_12792 - PLACE
      ?auto_12789 - TRUCK
      ?auto_12788 - PLACE
      ?auto_12793 - HOIST
      ?auto_12791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12790 ?auto_12792 ) ( SURFACE-AT ?auto_12786 ?auto_12792 ) ( CLEAR ?auto_12786 ) ( IS-CRATE ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( AVAILABLE ?auto_12790 ) ( ON ?auto_12786 ?auto_12785 ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( TRUCK-AT ?auto_12789 ?auto_12788 ) ( not ( = ?auto_12788 ?auto_12792 ) ) ( HOIST-AT ?auto_12793 ?auto_12788 ) ( not ( = ?auto_12790 ?auto_12793 ) ) ( AVAILABLE ?auto_12793 ) ( SURFACE-AT ?auto_12787 ?auto_12788 ) ( ON ?auto_12787 ?auto_12791 ) ( CLEAR ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( not ( = ?auto_12785 ?auto_12791 ) ) ( ON ?auto_12785 ?auto_12784 ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12785 ?auto_12786 ?auto_12787 )
      ( MAKE-3CRATE-VERIFY ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12812 - SURFACE
      ?auto_12813 - SURFACE
      ?auto_12814 - SURFACE
      ?auto_12815 - SURFACE
    )
    :vars
    (
      ?auto_12818 - HOIST
      ?auto_12819 - PLACE
      ?auto_12816 - PLACE
      ?auto_12820 - HOIST
      ?auto_12821 - SURFACE
      ?auto_12817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12818 ?auto_12819 ) ( SURFACE-AT ?auto_12814 ?auto_12819 ) ( CLEAR ?auto_12814 ) ( IS-CRATE ?auto_12815 ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( AVAILABLE ?auto_12818 ) ( ON ?auto_12814 ?auto_12813 ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) ( not ( = ?auto_12816 ?auto_12819 ) ) ( HOIST-AT ?auto_12820 ?auto_12816 ) ( not ( = ?auto_12818 ?auto_12820 ) ) ( AVAILABLE ?auto_12820 ) ( SURFACE-AT ?auto_12815 ?auto_12816 ) ( ON ?auto_12815 ?auto_12821 ) ( CLEAR ?auto_12815 ) ( not ( = ?auto_12814 ?auto_12821 ) ) ( not ( = ?auto_12815 ?auto_12821 ) ) ( not ( = ?auto_12813 ?auto_12821 ) ) ( TRUCK-AT ?auto_12817 ?auto_12819 ) ( ON ?auto_12813 ?auto_12812 ) ( not ( = ?auto_12812 ?auto_12813 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12815 ) ) ( not ( = ?auto_12812 ?auto_12821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12813 ?auto_12814 ?auto_12815 )
      ( MAKE-3CRATE-VERIFY ?auto_12812 ?auto_12813 ?auto_12814 ?auto_12815 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12840 - SURFACE
      ?auto_12841 - SURFACE
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
    )
    :vars
    (
      ?auto_12849 - HOIST
      ?auto_12844 - PLACE
      ?auto_12845 - PLACE
      ?auto_12846 - HOIST
      ?auto_12847 - SURFACE
      ?auto_12848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12849 ?auto_12844 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12845 ?auto_12844 ) ) ( HOIST-AT ?auto_12846 ?auto_12845 ) ( not ( = ?auto_12849 ?auto_12846 ) ) ( AVAILABLE ?auto_12846 ) ( SURFACE-AT ?auto_12843 ?auto_12845 ) ( ON ?auto_12843 ?auto_12847 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12841 ?auto_12847 ) ) ( TRUCK-AT ?auto_12848 ?auto_12844 ) ( SURFACE-AT ?auto_12841 ?auto_12844 ) ( CLEAR ?auto_12841 ) ( LIFTING ?auto_12849 ?auto_12842 ) ( IS-CRATE ?auto_12842 ) ( ON ?auto_12841 ?auto_12840 ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( not ( = ?auto_12840 ?auto_12842 ) ) ( not ( = ?auto_12840 ?auto_12843 ) ) ( not ( = ?auto_12840 ?auto_12847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12841 ?auto_12842 ?auto_12843 )
      ( MAKE-3CRATE-VERIFY ?auto_12840 ?auto_12841 ?auto_12842 ?auto_12843 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12868 - SURFACE
      ?auto_12869 - SURFACE
      ?auto_12870 - SURFACE
      ?auto_12871 - SURFACE
    )
    :vars
    (
      ?auto_12876 - HOIST
      ?auto_12877 - PLACE
      ?auto_12872 - PLACE
      ?auto_12873 - HOIST
      ?auto_12875 - SURFACE
      ?auto_12874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12876 ?auto_12877 ) ( IS-CRATE ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12872 ?auto_12877 ) ) ( HOIST-AT ?auto_12873 ?auto_12872 ) ( not ( = ?auto_12876 ?auto_12873 ) ) ( AVAILABLE ?auto_12873 ) ( SURFACE-AT ?auto_12871 ?auto_12872 ) ( ON ?auto_12871 ?auto_12875 ) ( CLEAR ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12875 ) ) ( not ( = ?auto_12871 ?auto_12875 ) ) ( not ( = ?auto_12869 ?auto_12875 ) ) ( TRUCK-AT ?auto_12874 ?auto_12877 ) ( SURFACE-AT ?auto_12869 ?auto_12877 ) ( CLEAR ?auto_12869 ) ( IS-CRATE ?auto_12870 ) ( AVAILABLE ?auto_12876 ) ( IN ?auto_12870 ?auto_12874 ) ( ON ?auto_12869 ?auto_12868 ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12870 ) ) ( not ( = ?auto_12868 ?auto_12871 ) ) ( not ( = ?auto_12868 ?auto_12875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12869 ?auto_12870 ?auto_12871 )
      ( MAKE-3CRATE-VERIFY ?auto_12868 ?auto_12869 ?auto_12870 ?auto_12871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12947 - SURFACE
      ?auto_12948 - SURFACE
    )
    :vars
    (
      ?auto_12952 - HOIST
      ?auto_12950 - PLACE
      ?auto_12951 - SURFACE
      ?auto_12949 - PLACE
      ?auto_12954 - HOIST
      ?auto_12955 - SURFACE
      ?auto_12953 - TRUCK
      ?auto_12956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12952 ?auto_12950 ) ( SURFACE-AT ?auto_12947 ?auto_12950 ) ( CLEAR ?auto_12947 ) ( IS-CRATE ?auto_12948 ) ( not ( = ?auto_12947 ?auto_12948 ) ) ( AVAILABLE ?auto_12952 ) ( ON ?auto_12947 ?auto_12951 ) ( not ( = ?auto_12951 ?auto_12947 ) ) ( not ( = ?auto_12951 ?auto_12948 ) ) ( not ( = ?auto_12949 ?auto_12950 ) ) ( HOIST-AT ?auto_12954 ?auto_12949 ) ( not ( = ?auto_12952 ?auto_12954 ) ) ( AVAILABLE ?auto_12954 ) ( SURFACE-AT ?auto_12948 ?auto_12949 ) ( ON ?auto_12948 ?auto_12955 ) ( CLEAR ?auto_12948 ) ( not ( = ?auto_12947 ?auto_12955 ) ) ( not ( = ?auto_12948 ?auto_12955 ) ) ( not ( = ?auto_12951 ?auto_12955 ) ) ( TRUCK-AT ?auto_12953 ?auto_12956 ) ( not ( = ?auto_12956 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12953 ?auto_12956 ?auto_12950 )
      ( MAKE-1CRATE ?auto_12947 ?auto_12948 )
      ( MAKE-1CRATE-VERIFY ?auto_12947 ?auto_12948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13053 - SURFACE
      ?auto_13054 - SURFACE
    )
    :vars
    (
      ?auto_13057 - HOIST
      ?auto_13061 - PLACE
      ?auto_13060 - SURFACE
      ?auto_13058 - PLACE
      ?auto_13056 - HOIST
      ?auto_13055 - SURFACE
      ?auto_13059 - TRUCK
      ?auto_13062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13057 ?auto_13061 ) ( SURFACE-AT ?auto_13053 ?auto_13061 ) ( CLEAR ?auto_13053 ) ( IS-CRATE ?auto_13054 ) ( not ( = ?auto_13053 ?auto_13054 ) ) ( ON ?auto_13053 ?auto_13060 ) ( not ( = ?auto_13060 ?auto_13053 ) ) ( not ( = ?auto_13060 ?auto_13054 ) ) ( not ( = ?auto_13058 ?auto_13061 ) ) ( HOIST-AT ?auto_13056 ?auto_13058 ) ( not ( = ?auto_13057 ?auto_13056 ) ) ( AVAILABLE ?auto_13056 ) ( SURFACE-AT ?auto_13054 ?auto_13058 ) ( ON ?auto_13054 ?auto_13055 ) ( CLEAR ?auto_13054 ) ( not ( = ?auto_13053 ?auto_13055 ) ) ( not ( = ?auto_13054 ?auto_13055 ) ) ( not ( = ?auto_13060 ?auto_13055 ) ) ( TRUCK-AT ?auto_13059 ?auto_13061 ) ( LIFTING ?auto_13057 ?auto_13062 ) ( IS-CRATE ?auto_13062 ) ( not ( = ?auto_13053 ?auto_13062 ) ) ( not ( = ?auto_13054 ?auto_13062 ) ) ( not ( = ?auto_13060 ?auto_13062 ) ) ( not ( = ?auto_13055 ?auto_13062 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13057 ?auto_13062 ?auto_13059 ?auto_13061 )
      ( MAKE-1CRATE ?auto_13053 ?auto_13054 )
      ( MAKE-1CRATE-VERIFY ?auto_13053 ?auto_13054 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13161 - SURFACE
      ?auto_13162 - SURFACE
      ?auto_13163 - SURFACE
      ?auto_13165 - SURFACE
      ?auto_13164 - SURFACE
    )
    :vars
    (
      ?auto_13167 - HOIST
      ?auto_13166 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13167 ?auto_13166 ) ( SURFACE-AT ?auto_13165 ?auto_13166 ) ( CLEAR ?auto_13165 ) ( LIFTING ?auto_13167 ?auto_13164 ) ( IS-CRATE ?auto_13164 ) ( not ( = ?auto_13165 ?auto_13164 ) ) ( ON ?auto_13162 ?auto_13161 ) ( ON ?auto_13163 ?auto_13162 ) ( ON ?auto_13165 ?auto_13163 ) ( not ( = ?auto_13161 ?auto_13162 ) ) ( not ( = ?auto_13161 ?auto_13163 ) ) ( not ( = ?auto_13161 ?auto_13165 ) ) ( not ( = ?auto_13161 ?auto_13164 ) ) ( not ( = ?auto_13162 ?auto_13163 ) ) ( not ( = ?auto_13162 ?auto_13165 ) ) ( not ( = ?auto_13162 ?auto_13164 ) ) ( not ( = ?auto_13163 ?auto_13165 ) ) ( not ( = ?auto_13163 ?auto_13164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13165 ?auto_13164 )
      ( MAKE-4CRATE-VERIFY ?auto_13161 ?auto_13162 ?auto_13163 ?auto_13165 ?auto_13164 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13186 - SURFACE
      ?auto_13187 - SURFACE
      ?auto_13188 - SURFACE
      ?auto_13190 - SURFACE
      ?auto_13189 - SURFACE
    )
    :vars
    (
      ?auto_13191 - HOIST
      ?auto_13193 - PLACE
      ?auto_13192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13191 ?auto_13193 ) ( SURFACE-AT ?auto_13190 ?auto_13193 ) ( CLEAR ?auto_13190 ) ( IS-CRATE ?auto_13189 ) ( not ( = ?auto_13190 ?auto_13189 ) ) ( TRUCK-AT ?auto_13192 ?auto_13193 ) ( AVAILABLE ?auto_13191 ) ( IN ?auto_13189 ?auto_13192 ) ( ON ?auto_13190 ?auto_13188 ) ( not ( = ?auto_13188 ?auto_13190 ) ) ( not ( = ?auto_13188 ?auto_13189 ) ) ( ON ?auto_13187 ?auto_13186 ) ( ON ?auto_13188 ?auto_13187 ) ( not ( = ?auto_13186 ?auto_13187 ) ) ( not ( = ?auto_13186 ?auto_13188 ) ) ( not ( = ?auto_13186 ?auto_13190 ) ) ( not ( = ?auto_13186 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13188 ) ) ( not ( = ?auto_13187 ?auto_13190 ) ) ( not ( = ?auto_13187 ?auto_13189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13188 ?auto_13190 ?auto_13189 )
      ( MAKE-4CRATE-VERIFY ?auto_13186 ?auto_13187 ?auto_13188 ?auto_13190 ?auto_13189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13216 - SURFACE
      ?auto_13217 - SURFACE
      ?auto_13218 - SURFACE
      ?auto_13220 - SURFACE
      ?auto_13219 - SURFACE
    )
    :vars
    (
      ?auto_13221 - HOIST
      ?auto_13222 - PLACE
      ?auto_13224 - TRUCK
      ?auto_13223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13221 ?auto_13222 ) ( SURFACE-AT ?auto_13220 ?auto_13222 ) ( CLEAR ?auto_13220 ) ( IS-CRATE ?auto_13219 ) ( not ( = ?auto_13220 ?auto_13219 ) ) ( AVAILABLE ?auto_13221 ) ( IN ?auto_13219 ?auto_13224 ) ( ON ?auto_13220 ?auto_13218 ) ( not ( = ?auto_13218 ?auto_13220 ) ) ( not ( = ?auto_13218 ?auto_13219 ) ) ( TRUCK-AT ?auto_13224 ?auto_13223 ) ( not ( = ?auto_13223 ?auto_13222 ) ) ( ON ?auto_13217 ?auto_13216 ) ( ON ?auto_13218 ?auto_13217 ) ( not ( = ?auto_13216 ?auto_13217 ) ) ( not ( = ?auto_13216 ?auto_13218 ) ) ( not ( = ?auto_13216 ?auto_13220 ) ) ( not ( = ?auto_13216 ?auto_13219 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13220 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13218 ?auto_13220 ?auto_13219 )
      ( MAKE-4CRATE-VERIFY ?auto_13216 ?auto_13217 ?auto_13218 ?auto_13220 ?auto_13219 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13250 - SURFACE
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
      ?auto_13254 - SURFACE
      ?auto_13253 - SURFACE
    )
    :vars
    (
      ?auto_13258 - HOIST
      ?auto_13256 - PLACE
      ?auto_13255 - TRUCK
      ?auto_13259 - PLACE
      ?auto_13257 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13258 ?auto_13256 ) ( SURFACE-AT ?auto_13254 ?auto_13256 ) ( CLEAR ?auto_13254 ) ( IS-CRATE ?auto_13253 ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( AVAILABLE ?auto_13258 ) ( ON ?auto_13254 ?auto_13252 ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( TRUCK-AT ?auto_13255 ?auto_13259 ) ( not ( = ?auto_13259 ?auto_13256 ) ) ( HOIST-AT ?auto_13257 ?auto_13259 ) ( LIFTING ?auto_13257 ?auto_13253 ) ( not ( = ?auto_13258 ?auto_13257 ) ) ( ON ?auto_13251 ?auto_13250 ) ( ON ?auto_13252 ?auto_13251 ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13254 ) ) ( not ( = ?auto_13250 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13254 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13252 ?auto_13254 ?auto_13253 )
      ( MAKE-4CRATE-VERIFY ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13254 ?auto_13253 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13288 - SURFACE
      ?auto_13289 - SURFACE
      ?auto_13290 - SURFACE
      ?auto_13292 - SURFACE
      ?auto_13291 - SURFACE
    )
    :vars
    (
      ?auto_13296 - HOIST
      ?auto_13297 - PLACE
      ?auto_13293 - TRUCK
      ?auto_13295 - PLACE
      ?auto_13298 - HOIST
      ?auto_13294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13296 ?auto_13297 ) ( SURFACE-AT ?auto_13292 ?auto_13297 ) ( CLEAR ?auto_13292 ) ( IS-CRATE ?auto_13291 ) ( not ( = ?auto_13292 ?auto_13291 ) ) ( AVAILABLE ?auto_13296 ) ( ON ?auto_13292 ?auto_13290 ) ( not ( = ?auto_13290 ?auto_13292 ) ) ( not ( = ?auto_13290 ?auto_13291 ) ) ( TRUCK-AT ?auto_13293 ?auto_13295 ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( HOIST-AT ?auto_13298 ?auto_13295 ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( AVAILABLE ?auto_13298 ) ( SURFACE-AT ?auto_13291 ?auto_13295 ) ( ON ?auto_13291 ?auto_13294 ) ( CLEAR ?auto_13291 ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13294 ) ) ( not ( = ?auto_13290 ?auto_13294 ) ) ( ON ?auto_13289 ?auto_13288 ) ( ON ?auto_13290 ?auto_13289 ) ( not ( = ?auto_13288 ?auto_13289 ) ) ( not ( = ?auto_13288 ?auto_13290 ) ) ( not ( = ?auto_13288 ?auto_13292 ) ) ( not ( = ?auto_13288 ?auto_13291 ) ) ( not ( = ?auto_13288 ?auto_13294 ) ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13289 ?auto_13292 ) ) ( not ( = ?auto_13289 ?auto_13291 ) ) ( not ( = ?auto_13289 ?auto_13294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13290 ?auto_13292 ?auto_13291 )
      ( MAKE-4CRATE-VERIFY ?auto_13288 ?auto_13289 ?auto_13290 ?auto_13292 ?auto_13291 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13327 - SURFACE
      ?auto_13328 - SURFACE
      ?auto_13329 - SURFACE
      ?auto_13331 - SURFACE
      ?auto_13330 - SURFACE
    )
    :vars
    (
      ?auto_13333 - HOIST
      ?auto_13337 - PLACE
      ?auto_13334 - PLACE
      ?auto_13335 - HOIST
      ?auto_13332 - SURFACE
      ?auto_13336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13333 ?auto_13337 ) ( SURFACE-AT ?auto_13331 ?auto_13337 ) ( CLEAR ?auto_13331 ) ( IS-CRATE ?auto_13330 ) ( not ( = ?auto_13331 ?auto_13330 ) ) ( AVAILABLE ?auto_13333 ) ( ON ?auto_13331 ?auto_13329 ) ( not ( = ?auto_13329 ?auto_13331 ) ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( not ( = ?auto_13334 ?auto_13337 ) ) ( HOIST-AT ?auto_13335 ?auto_13334 ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( AVAILABLE ?auto_13335 ) ( SURFACE-AT ?auto_13330 ?auto_13334 ) ( ON ?auto_13330 ?auto_13332 ) ( CLEAR ?auto_13330 ) ( not ( = ?auto_13331 ?auto_13332 ) ) ( not ( = ?auto_13330 ?auto_13332 ) ) ( not ( = ?auto_13329 ?auto_13332 ) ) ( TRUCK-AT ?auto_13336 ?auto_13337 ) ( ON ?auto_13328 ?auto_13327 ) ( ON ?auto_13329 ?auto_13328 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13327 ?auto_13331 ) ) ( not ( = ?auto_13327 ?auto_13330 ) ) ( not ( = ?auto_13327 ?auto_13332 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13331 ) ) ( not ( = ?auto_13328 ?auto_13330 ) ) ( not ( = ?auto_13328 ?auto_13332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13329 ?auto_13331 ?auto_13330 )
      ( MAKE-4CRATE-VERIFY ?auto_13327 ?auto_13328 ?auto_13329 ?auto_13331 ?auto_13330 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13366 - SURFACE
      ?auto_13367 - SURFACE
      ?auto_13368 - SURFACE
      ?auto_13370 - SURFACE
      ?auto_13369 - SURFACE
    )
    :vars
    (
      ?auto_13373 - HOIST
      ?auto_13375 - PLACE
      ?auto_13371 - PLACE
      ?auto_13372 - HOIST
      ?auto_13376 - SURFACE
      ?auto_13374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13373 ?auto_13375 ) ( IS-CRATE ?auto_13369 ) ( not ( = ?auto_13370 ?auto_13369 ) ) ( not ( = ?auto_13368 ?auto_13370 ) ) ( not ( = ?auto_13368 ?auto_13369 ) ) ( not ( = ?auto_13371 ?auto_13375 ) ) ( HOIST-AT ?auto_13372 ?auto_13371 ) ( not ( = ?auto_13373 ?auto_13372 ) ) ( AVAILABLE ?auto_13372 ) ( SURFACE-AT ?auto_13369 ?auto_13371 ) ( ON ?auto_13369 ?auto_13376 ) ( CLEAR ?auto_13369 ) ( not ( = ?auto_13370 ?auto_13376 ) ) ( not ( = ?auto_13369 ?auto_13376 ) ) ( not ( = ?auto_13368 ?auto_13376 ) ) ( TRUCK-AT ?auto_13374 ?auto_13375 ) ( SURFACE-AT ?auto_13368 ?auto_13375 ) ( CLEAR ?auto_13368 ) ( LIFTING ?auto_13373 ?auto_13370 ) ( IS-CRATE ?auto_13370 ) ( ON ?auto_13367 ?auto_13366 ) ( ON ?auto_13368 ?auto_13367 ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13370 ) ) ( not ( = ?auto_13366 ?auto_13369 ) ) ( not ( = ?auto_13366 ?auto_13376 ) ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( not ( = ?auto_13367 ?auto_13370 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( not ( = ?auto_13367 ?auto_13376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13368 ?auto_13370 ?auto_13369 )
      ( MAKE-4CRATE-VERIFY ?auto_13366 ?auto_13367 ?auto_13368 ?auto_13370 ?auto_13369 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13405 - SURFACE
      ?auto_13406 - SURFACE
      ?auto_13407 - SURFACE
      ?auto_13409 - SURFACE
      ?auto_13408 - SURFACE
    )
    :vars
    (
      ?auto_13415 - HOIST
      ?auto_13410 - PLACE
      ?auto_13412 - PLACE
      ?auto_13411 - HOIST
      ?auto_13413 - SURFACE
      ?auto_13414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13415 ?auto_13410 ) ( IS-CRATE ?auto_13408 ) ( not ( = ?auto_13409 ?auto_13408 ) ) ( not ( = ?auto_13407 ?auto_13409 ) ) ( not ( = ?auto_13407 ?auto_13408 ) ) ( not ( = ?auto_13412 ?auto_13410 ) ) ( HOIST-AT ?auto_13411 ?auto_13412 ) ( not ( = ?auto_13415 ?auto_13411 ) ) ( AVAILABLE ?auto_13411 ) ( SURFACE-AT ?auto_13408 ?auto_13412 ) ( ON ?auto_13408 ?auto_13413 ) ( CLEAR ?auto_13408 ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13408 ?auto_13413 ) ) ( not ( = ?auto_13407 ?auto_13413 ) ) ( TRUCK-AT ?auto_13414 ?auto_13410 ) ( SURFACE-AT ?auto_13407 ?auto_13410 ) ( CLEAR ?auto_13407 ) ( IS-CRATE ?auto_13409 ) ( AVAILABLE ?auto_13415 ) ( IN ?auto_13409 ?auto_13414 ) ( ON ?auto_13406 ?auto_13405 ) ( ON ?auto_13407 ?auto_13406 ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13407 ) ) ( not ( = ?auto_13405 ?auto_13409 ) ) ( not ( = ?auto_13405 ?auto_13408 ) ) ( not ( = ?auto_13405 ?auto_13413 ) ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13409 ) ) ( not ( = ?auto_13406 ?auto_13408 ) ) ( not ( = ?auto_13406 ?auto_13413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13407 ?auto_13409 ?auto_13408 )
      ( MAKE-4CRATE-VERIFY ?auto_13405 ?auto_13406 ?auto_13407 ?auto_13409 ?auto_13408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13678 - SURFACE
      ?auto_13679 - SURFACE
    )
    :vars
    (
      ?auto_13686 - HOIST
      ?auto_13685 - PLACE
      ?auto_13680 - SURFACE
      ?auto_13684 - TRUCK
      ?auto_13683 - PLACE
      ?auto_13682 - HOIST
      ?auto_13681 - SURFACE
      ?auto_13687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13686 ?auto_13685 ) ( SURFACE-AT ?auto_13678 ?auto_13685 ) ( CLEAR ?auto_13678 ) ( IS-CRATE ?auto_13679 ) ( not ( = ?auto_13678 ?auto_13679 ) ) ( AVAILABLE ?auto_13686 ) ( ON ?auto_13678 ?auto_13680 ) ( not ( = ?auto_13680 ?auto_13678 ) ) ( not ( = ?auto_13680 ?auto_13679 ) ) ( TRUCK-AT ?auto_13684 ?auto_13683 ) ( not ( = ?auto_13683 ?auto_13685 ) ) ( HOIST-AT ?auto_13682 ?auto_13683 ) ( not ( = ?auto_13686 ?auto_13682 ) ) ( SURFACE-AT ?auto_13679 ?auto_13683 ) ( ON ?auto_13679 ?auto_13681 ) ( CLEAR ?auto_13679 ) ( not ( = ?auto_13678 ?auto_13681 ) ) ( not ( = ?auto_13679 ?auto_13681 ) ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( LIFTING ?auto_13682 ?auto_13687 ) ( IS-CRATE ?auto_13687 ) ( not ( = ?auto_13678 ?auto_13687 ) ) ( not ( = ?auto_13679 ?auto_13687 ) ) ( not ( = ?auto_13680 ?auto_13687 ) ) ( not ( = ?auto_13681 ?auto_13687 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13682 ?auto_13687 ?auto_13684 ?auto_13683 )
      ( MAKE-1CRATE ?auto_13678 ?auto_13679 )
      ( MAKE-1CRATE-VERIFY ?auto_13678 ?auto_13679 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14056 - SURFACE
      ?auto_14057 - SURFACE
      ?auto_14058 - SURFACE
      ?auto_14060 - SURFACE
      ?auto_14059 - SURFACE
      ?auto_14061 - SURFACE
    )
    :vars
    (
      ?auto_14062 - HOIST
      ?auto_14063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14062 ?auto_14063 ) ( SURFACE-AT ?auto_14059 ?auto_14063 ) ( CLEAR ?auto_14059 ) ( LIFTING ?auto_14062 ?auto_14061 ) ( IS-CRATE ?auto_14061 ) ( not ( = ?auto_14059 ?auto_14061 ) ) ( ON ?auto_14057 ?auto_14056 ) ( ON ?auto_14058 ?auto_14057 ) ( ON ?auto_14060 ?auto_14058 ) ( ON ?auto_14059 ?auto_14060 ) ( not ( = ?auto_14056 ?auto_14057 ) ) ( not ( = ?auto_14056 ?auto_14058 ) ) ( not ( = ?auto_14056 ?auto_14060 ) ) ( not ( = ?auto_14056 ?auto_14059 ) ) ( not ( = ?auto_14056 ?auto_14061 ) ) ( not ( = ?auto_14057 ?auto_14058 ) ) ( not ( = ?auto_14057 ?auto_14060 ) ) ( not ( = ?auto_14057 ?auto_14059 ) ) ( not ( = ?auto_14057 ?auto_14061 ) ) ( not ( = ?auto_14058 ?auto_14060 ) ) ( not ( = ?auto_14058 ?auto_14059 ) ) ( not ( = ?auto_14058 ?auto_14061 ) ) ( not ( = ?auto_14060 ?auto_14059 ) ) ( not ( = ?auto_14060 ?auto_14061 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14059 ?auto_14061 )
      ( MAKE-5CRATE-VERIFY ?auto_14056 ?auto_14057 ?auto_14058 ?auto_14060 ?auto_14059 ?auto_14061 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14090 - SURFACE
      ?auto_14091 - SURFACE
      ?auto_14092 - SURFACE
      ?auto_14094 - SURFACE
      ?auto_14093 - SURFACE
      ?auto_14095 - SURFACE
    )
    :vars
    (
      ?auto_14098 - HOIST
      ?auto_14096 - PLACE
      ?auto_14097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14098 ?auto_14096 ) ( SURFACE-AT ?auto_14093 ?auto_14096 ) ( CLEAR ?auto_14093 ) ( IS-CRATE ?auto_14095 ) ( not ( = ?auto_14093 ?auto_14095 ) ) ( TRUCK-AT ?auto_14097 ?auto_14096 ) ( AVAILABLE ?auto_14098 ) ( IN ?auto_14095 ?auto_14097 ) ( ON ?auto_14093 ?auto_14094 ) ( not ( = ?auto_14094 ?auto_14093 ) ) ( not ( = ?auto_14094 ?auto_14095 ) ) ( ON ?auto_14091 ?auto_14090 ) ( ON ?auto_14092 ?auto_14091 ) ( ON ?auto_14094 ?auto_14092 ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14092 ) ) ( not ( = ?auto_14090 ?auto_14094 ) ) ( not ( = ?auto_14090 ?auto_14093 ) ) ( not ( = ?auto_14090 ?auto_14095 ) ) ( not ( = ?auto_14091 ?auto_14092 ) ) ( not ( = ?auto_14091 ?auto_14094 ) ) ( not ( = ?auto_14091 ?auto_14093 ) ) ( not ( = ?auto_14091 ?auto_14095 ) ) ( not ( = ?auto_14092 ?auto_14094 ) ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( not ( = ?auto_14092 ?auto_14095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14094 ?auto_14093 ?auto_14095 )
      ( MAKE-5CRATE-VERIFY ?auto_14090 ?auto_14091 ?auto_14092 ?auto_14094 ?auto_14093 ?auto_14095 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14130 - SURFACE
      ?auto_14131 - SURFACE
      ?auto_14132 - SURFACE
      ?auto_14134 - SURFACE
      ?auto_14133 - SURFACE
      ?auto_14135 - SURFACE
    )
    :vars
    (
      ?auto_14138 - HOIST
      ?auto_14137 - PLACE
      ?auto_14139 - TRUCK
      ?auto_14136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14138 ?auto_14137 ) ( SURFACE-AT ?auto_14133 ?auto_14137 ) ( CLEAR ?auto_14133 ) ( IS-CRATE ?auto_14135 ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( AVAILABLE ?auto_14138 ) ( IN ?auto_14135 ?auto_14139 ) ( ON ?auto_14133 ?auto_14134 ) ( not ( = ?auto_14134 ?auto_14133 ) ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( TRUCK-AT ?auto_14139 ?auto_14136 ) ( not ( = ?auto_14136 ?auto_14137 ) ) ( ON ?auto_14131 ?auto_14130 ) ( ON ?auto_14132 ?auto_14131 ) ( ON ?auto_14134 ?auto_14132 ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( not ( = ?auto_14130 ?auto_14132 ) ) ( not ( = ?auto_14130 ?auto_14134 ) ) ( not ( = ?auto_14130 ?auto_14133 ) ) ( not ( = ?auto_14130 ?auto_14135 ) ) ( not ( = ?auto_14131 ?auto_14132 ) ) ( not ( = ?auto_14131 ?auto_14134 ) ) ( not ( = ?auto_14131 ?auto_14133 ) ) ( not ( = ?auto_14131 ?auto_14135 ) ) ( not ( = ?auto_14132 ?auto_14134 ) ) ( not ( = ?auto_14132 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14134 ?auto_14133 ?auto_14135 )
      ( MAKE-5CRATE-VERIFY ?auto_14130 ?auto_14131 ?auto_14132 ?auto_14134 ?auto_14133 ?auto_14135 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14175 - SURFACE
      ?auto_14176 - SURFACE
      ?auto_14177 - SURFACE
      ?auto_14179 - SURFACE
      ?auto_14178 - SURFACE
      ?auto_14180 - SURFACE
    )
    :vars
    (
      ?auto_14182 - HOIST
      ?auto_14181 - PLACE
      ?auto_14184 - TRUCK
      ?auto_14183 - PLACE
      ?auto_14185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14182 ?auto_14181 ) ( SURFACE-AT ?auto_14178 ?auto_14181 ) ( CLEAR ?auto_14178 ) ( IS-CRATE ?auto_14180 ) ( not ( = ?auto_14178 ?auto_14180 ) ) ( AVAILABLE ?auto_14182 ) ( ON ?auto_14178 ?auto_14179 ) ( not ( = ?auto_14179 ?auto_14178 ) ) ( not ( = ?auto_14179 ?auto_14180 ) ) ( TRUCK-AT ?auto_14184 ?auto_14183 ) ( not ( = ?auto_14183 ?auto_14181 ) ) ( HOIST-AT ?auto_14185 ?auto_14183 ) ( LIFTING ?auto_14185 ?auto_14180 ) ( not ( = ?auto_14182 ?auto_14185 ) ) ( ON ?auto_14176 ?auto_14175 ) ( ON ?auto_14177 ?auto_14176 ) ( ON ?auto_14179 ?auto_14177 ) ( not ( = ?auto_14175 ?auto_14176 ) ) ( not ( = ?auto_14175 ?auto_14177 ) ) ( not ( = ?auto_14175 ?auto_14179 ) ) ( not ( = ?auto_14175 ?auto_14178 ) ) ( not ( = ?auto_14175 ?auto_14180 ) ) ( not ( = ?auto_14176 ?auto_14177 ) ) ( not ( = ?auto_14176 ?auto_14179 ) ) ( not ( = ?auto_14176 ?auto_14178 ) ) ( not ( = ?auto_14176 ?auto_14180 ) ) ( not ( = ?auto_14177 ?auto_14179 ) ) ( not ( = ?auto_14177 ?auto_14178 ) ) ( not ( = ?auto_14177 ?auto_14180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14179 ?auto_14178 ?auto_14180 )
      ( MAKE-5CRATE-VERIFY ?auto_14175 ?auto_14176 ?auto_14177 ?auto_14179 ?auto_14178 ?auto_14180 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14225 - SURFACE
      ?auto_14226 - SURFACE
      ?auto_14227 - SURFACE
      ?auto_14229 - SURFACE
      ?auto_14228 - SURFACE
      ?auto_14230 - SURFACE
    )
    :vars
    (
      ?auto_14232 - HOIST
      ?auto_14233 - PLACE
      ?auto_14234 - TRUCK
      ?auto_14231 - PLACE
      ?auto_14236 - HOIST
      ?auto_14235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14232 ?auto_14233 ) ( SURFACE-AT ?auto_14228 ?auto_14233 ) ( CLEAR ?auto_14228 ) ( IS-CRATE ?auto_14230 ) ( not ( = ?auto_14228 ?auto_14230 ) ) ( AVAILABLE ?auto_14232 ) ( ON ?auto_14228 ?auto_14229 ) ( not ( = ?auto_14229 ?auto_14228 ) ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( TRUCK-AT ?auto_14234 ?auto_14231 ) ( not ( = ?auto_14231 ?auto_14233 ) ) ( HOIST-AT ?auto_14236 ?auto_14231 ) ( not ( = ?auto_14232 ?auto_14236 ) ) ( AVAILABLE ?auto_14236 ) ( SURFACE-AT ?auto_14230 ?auto_14231 ) ( ON ?auto_14230 ?auto_14235 ) ( CLEAR ?auto_14230 ) ( not ( = ?auto_14228 ?auto_14235 ) ) ( not ( = ?auto_14230 ?auto_14235 ) ) ( not ( = ?auto_14229 ?auto_14235 ) ) ( ON ?auto_14226 ?auto_14225 ) ( ON ?auto_14227 ?auto_14226 ) ( ON ?auto_14229 ?auto_14227 ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14227 ) ) ( not ( = ?auto_14225 ?auto_14229 ) ) ( not ( = ?auto_14225 ?auto_14228 ) ) ( not ( = ?auto_14225 ?auto_14230 ) ) ( not ( = ?auto_14225 ?auto_14235 ) ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( not ( = ?auto_14226 ?auto_14229 ) ) ( not ( = ?auto_14226 ?auto_14228 ) ) ( not ( = ?auto_14226 ?auto_14230 ) ) ( not ( = ?auto_14226 ?auto_14235 ) ) ( not ( = ?auto_14227 ?auto_14229 ) ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( not ( = ?auto_14227 ?auto_14230 ) ) ( not ( = ?auto_14227 ?auto_14235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14229 ?auto_14228 ?auto_14230 )
      ( MAKE-5CRATE-VERIFY ?auto_14225 ?auto_14226 ?auto_14227 ?auto_14229 ?auto_14228 ?auto_14230 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14276 - SURFACE
      ?auto_14277 - SURFACE
      ?auto_14278 - SURFACE
      ?auto_14280 - SURFACE
      ?auto_14279 - SURFACE
      ?auto_14281 - SURFACE
    )
    :vars
    (
      ?auto_14284 - HOIST
      ?auto_14283 - PLACE
      ?auto_14287 - PLACE
      ?auto_14282 - HOIST
      ?auto_14286 - SURFACE
      ?auto_14285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14284 ?auto_14283 ) ( SURFACE-AT ?auto_14279 ?auto_14283 ) ( CLEAR ?auto_14279 ) ( IS-CRATE ?auto_14281 ) ( not ( = ?auto_14279 ?auto_14281 ) ) ( AVAILABLE ?auto_14284 ) ( ON ?auto_14279 ?auto_14280 ) ( not ( = ?auto_14280 ?auto_14279 ) ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14287 ?auto_14283 ) ) ( HOIST-AT ?auto_14282 ?auto_14287 ) ( not ( = ?auto_14284 ?auto_14282 ) ) ( AVAILABLE ?auto_14282 ) ( SURFACE-AT ?auto_14281 ?auto_14287 ) ( ON ?auto_14281 ?auto_14286 ) ( CLEAR ?auto_14281 ) ( not ( = ?auto_14279 ?auto_14286 ) ) ( not ( = ?auto_14281 ?auto_14286 ) ) ( not ( = ?auto_14280 ?auto_14286 ) ) ( TRUCK-AT ?auto_14285 ?auto_14283 ) ( ON ?auto_14277 ?auto_14276 ) ( ON ?auto_14278 ?auto_14277 ) ( ON ?auto_14280 ?auto_14278 ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14278 ) ) ( not ( = ?auto_14276 ?auto_14280 ) ) ( not ( = ?auto_14276 ?auto_14279 ) ) ( not ( = ?auto_14276 ?auto_14281 ) ) ( not ( = ?auto_14276 ?auto_14286 ) ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14280 ) ) ( not ( = ?auto_14277 ?auto_14279 ) ) ( not ( = ?auto_14277 ?auto_14281 ) ) ( not ( = ?auto_14277 ?auto_14286 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14281 ) ) ( not ( = ?auto_14278 ?auto_14286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14280 ?auto_14279 ?auto_14281 )
      ( MAKE-5CRATE-VERIFY ?auto_14276 ?auto_14277 ?auto_14278 ?auto_14280 ?auto_14279 ?auto_14281 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14327 - SURFACE
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
      ?auto_14331 - SURFACE
      ?auto_14330 - SURFACE
      ?auto_14332 - SURFACE
    )
    :vars
    (
      ?auto_14335 - HOIST
      ?auto_14333 - PLACE
      ?auto_14334 - PLACE
      ?auto_14337 - HOIST
      ?auto_14338 - SURFACE
      ?auto_14336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14335 ?auto_14333 ) ( IS-CRATE ?auto_14332 ) ( not ( = ?auto_14330 ?auto_14332 ) ) ( not ( = ?auto_14331 ?auto_14330 ) ) ( not ( = ?auto_14331 ?auto_14332 ) ) ( not ( = ?auto_14334 ?auto_14333 ) ) ( HOIST-AT ?auto_14337 ?auto_14334 ) ( not ( = ?auto_14335 ?auto_14337 ) ) ( AVAILABLE ?auto_14337 ) ( SURFACE-AT ?auto_14332 ?auto_14334 ) ( ON ?auto_14332 ?auto_14338 ) ( CLEAR ?auto_14332 ) ( not ( = ?auto_14330 ?auto_14338 ) ) ( not ( = ?auto_14332 ?auto_14338 ) ) ( not ( = ?auto_14331 ?auto_14338 ) ) ( TRUCK-AT ?auto_14336 ?auto_14333 ) ( SURFACE-AT ?auto_14331 ?auto_14333 ) ( CLEAR ?auto_14331 ) ( LIFTING ?auto_14335 ?auto_14330 ) ( IS-CRATE ?auto_14330 ) ( ON ?auto_14328 ?auto_14327 ) ( ON ?auto_14329 ?auto_14328 ) ( ON ?auto_14331 ?auto_14329 ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14338 ) ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14328 ?auto_14331 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14332 ) ) ( not ( = ?auto_14328 ?auto_14338 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14331 ?auto_14330 ?auto_14332 )
      ( MAKE-5CRATE-VERIFY ?auto_14327 ?auto_14328 ?auto_14329 ?auto_14331 ?auto_14330 ?auto_14332 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14378 - SURFACE
      ?auto_14379 - SURFACE
      ?auto_14380 - SURFACE
      ?auto_14382 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14383 - SURFACE
    )
    :vars
    (
      ?auto_14385 - HOIST
      ?auto_14389 - PLACE
      ?auto_14387 - PLACE
      ?auto_14386 - HOIST
      ?auto_14384 - SURFACE
      ?auto_14388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14385 ?auto_14389 ) ( IS-CRATE ?auto_14383 ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14382 ?auto_14381 ) ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14387 ?auto_14389 ) ) ( HOIST-AT ?auto_14386 ?auto_14387 ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( AVAILABLE ?auto_14386 ) ( SURFACE-AT ?auto_14383 ?auto_14387 ) ( ON ?auto_14383 ?auto_14384 ) ( CLEAR ?auto_14383 ) ( not ( = ?auto_14381 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14382 ?auto_14384 ) ) ( TRUCK-AT ?auto_14388 ?auto_14389 ) ( SURFACE-AT ?auto_14382 ?auto_14389 ) ( CLEAR ?auto_14382 ) ( IS-CRATE ?auto_14381 ) ( AVAILABLE ?auto_14385 ) ( IN ?auto_14381 ?auto_14388 ) ( ON ?auto_14379 ?auto_14378 ) ( ON ?auto_14380 ?auto_14379 ) ( ON ?auto_14382 ?auto_14380 ) ( not ( = ?auto_14378 ?auto_14379 ) ) ( not ( = ?auto_14378 ?auto_14380 ) ) ( not ( = ?auto_14378 ?auto_14382 ) ) ( not ( = ?auto_14378 ?auto_14381 ) ) ( not ( = ?auto_14378 ?auto_14383 ) ) ( not ( = ?auto_14378 ?auto_14384 ) ) ( not ( = ?auto_14379 ?auto_14380 ) ) ( not ( = ?auto_14379 ?auto_14382 ) ) ( not ( = ?auto_14379 ?auto_14381 ) ) ( not ( = ?auto_14379 ?auto_14383 ) ) ( not ( = ?auto_14379 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14382 ) ) ( not ( = ?auto_14380 ?auto_14381 ) ) ( not ( = ?auto_14380 ?auto_14383 ) ) ( not ( = ?auto_14380 ?auto_14384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14382 ?auto_14381 ?auto_14383 )
      ( MAKE-5CRATE-VERIFY ?auto_14378 ?auto_14379 ?auto_14380 ?auto_14382 ?auto_14381 ?auto_14383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14408 - SURFACE
      ?auto_14409 - SURFACE
      ?auto_14410 - SURFACE
      ?auto_14411 - SURFACE
    )
    :vars
    (
      ?auto_14415 - HOIST
      ?auto_14416 - PLACE
      ?auto_14412 - PLACE
      ?auto_14417 - HOIST
      ?auto_14413 - SURFACE
      ?auto_14414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14415 ?auto_14416 ) ( IS-CRATE ?auto_14411 ) ( not ( = ?auto_14410 ?auto_14411 ) ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( not ( = ?auto_14409 ?auto_14411 ) ) ( not ( = ?auto_14412 ?auto_14416 ) ) ( HOIST-AT ?auto_14417 ?auto_14412 ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( AVAILABLE ?auto_14417 ) ( SURFACE-AT ?auto_14411 ?auto_14412 ) ( ON ?auto_14411 ?auto_14413 ) ( CLEAR ?auto_14411 ) ( not ( = ?auto_14410 ?auto_14413 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14409 ?auto_14413 ) ) ( SURFACE-AT ?auto_14409 ?auto_14416 ) ( CLEAR ?auto_14409 ) ( IS-CRATE ?auto_14410 ) ( AVAILABLE ?auto_14415 ) ( IN ?auto_14410 ?auto_14414 ) ( TRUCK-AT ?auto_14414 ?auto_14412 ) ( ON ?auto_14409 ?auto_14408 ) ( not ( = ?auto_14408 ?auto_14409 ) ) ( not ( = ?auto_14408 ?auto_14410 ) ) ( not ( = ?auto_14408 ?auto_14411 ) ) ( not ( = ?auto_14408 ?auto_14413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14409 ?auto_14410 ?auto_14411 )
      ( MAKE-3CRATE-VERIFY ?auto_14408 ?auto_14409 ?auto_14410 ?auto_14411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14418 - SURFACE
      ?auto_14419 - SURFACE
      ?auto_14420 - SURFACE
      ?auto_14422 - SURFACE
      ?auto_14421 - SURFACE
    )
    :vars
    (
      ?auto_14426 - HOIST
      ?auto_14427 - PLACE
      ?auto_14423 - PLACE
      ?auto_14428 - HOIST
      ?auto_14424 - SURFACE
      ?auto_14425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14426 ?auto_14427 ) ( IS-CRATE ?auto_14421 ) ( not ( = ?auto_14422 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14422 ) ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14423 ?auto_14427 ) ) ( HOIST-AT ?auto_14428 ?auto_14423 ) ( not ( = ?auto_14426 ?auto_14428 ) ) ( AVAILABLE ?auto_14428 ) ( SURFACE-AT ?auto_14421 ?auto_14423 ) ( ON ?auto_14421 ?auto_14424 ) ( CLEAR ?auto_14421 ) ( not ( = ?auto_14422 ?auto_14424 ) ) ( not ( = ?auto_14421 ?auto_14424 ) ) ( not ( = ?auto_14420 ?auto_14424 ) ) ( SURFACE-AT ?auto_14420 ?auto_14427 ) ( CLEAR ?auto_14420 ) ( IS-CRATE ?auto_14422 ) ( AVAILABLE ?auto_14426 ) ( IN ?auto_14422 ?auto_14425 ) ( TRUCK-AT ?auto_14425 ?auto_14423 ) ( ON ?auto_14419 ?auto_14418 ) ( ON ?auto_14420 ?auto_14419 ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14420 ) ) ( not ( = ?auto_14418 ?auto_14422 ) ) ( not ( = ?auto_14418 ?auto_14421 ) ) ( not ( = ?auto_14418 ?auto_14424 ) ) ( not ( = ?auto_14419 ?auto_14420 ) ) ( not ( = ?auto_14419 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14420 ?auto_14422 ?auto_14421 )
      ( MAKE-4CRATE-VERIFY ?auto_14418 ?auto_14419 ?auto_14420 ?auto_14422 ?auto_14421 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14429 - SURFACE
      ?auto_14430 - SURFACE
      ?auto_14431 - SURFACE
      ?auto_14433 - SURFACE
      ?auto_14432 - SURFACE
      ?auto_14434 - SURFACE
    )
    :vars
    (
      ?auto_14438 - HOIST
      ?auto_14439 - PLACE
      ?auto_14435 - PLACE
      ?auto_14440 - HOIST
      ?auto_14436 - SURFACE
      ?auto_14437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14438 ?auto_14439 ) ( IS-CRATE ?auto_14434 ) ( not ( = ?auto_14432 ?auto_14434 ) ) ( not ( = ?auto_14433 ?auto_14432 ) ) ( not ( = ?auto_14433 ?auto_14434 ) ) ( not ( = ?auto_14435 ?auto_14439 ) ) ( HOIST-AT ?auto_14440 ?auto_14435 ) ( not ( = ?auto_14438 ?auto_14440 ) ) ( AVAILABLE ?auto_14440 ) ( SURFACE-AT ?auto_14434 ?auto_14435 ) ( ON ?auto_14434 ?auto_14436 ) ( CLEAR ?auto_14434 ) ( not ( = ?auto_14432 ?auto_14436 ) ) ( not ( = ?auto_14434 ?auto_14436 ) ) ( not ( = ?auto_14433 ?auto_14436 ) ) ( SURFACE-AT ?auto_14433 ?auto_14439 ) ( CLEAR ?auto_14433 ) ( IS-CRATE ?auto_14432 ) ( AVAILABLE ?auto_14438 ) ( IN ?auto_14432 ?auto_14437 ) ( TRUCK-AT ?auto_14437 ?auto_14435 ) ( ON ?auto_14430 ?auto_14429 ) ( ON ?auto_14431 ?auto_14430 ) ( ON ?auto_14433 ?auto_14431 ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14429 ?auto_14433 ) ) ( not ( = ?auto_14429 ?auto_14432 ) ) ( not ( = ?auto_14429 ?auto_14434 ) ) ( not ( = ?auto_14429 ?auto_14436 ) ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14430 ?auto_14434 ) ) ( not ( = ?auto_14430 ?auto_14436 ) ) ( not ( = ?auto_14431 ?auto_14433 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14434 ) ) ( not ( = ?auto_14431 ?auto_14436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14433 ?auto_14432 ?auto_14434 )
      ( MAKE-5CRATE-VERIFY ?auto_14429 ?auto_14430 ?auto_14431 ?auto_14433 ?auto_14432 ?auto_14434 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14459 - SURFACE
      ?auto_14460 - SURFACE
      ?auto_14461 - SURFACE
      ?auto_14462 - SURFACE
    )
    :vars
    (
      ?auto_14468 - HOIST
      ?auto_14465 - PLACE
      ?auto_14464 - PLACE
      ?auto_14466 - HOIST
      ?auto_14463 - SURFACE
      ?auto_14467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14468 ?auto_14465 ) ( IS-CRATE ?auto_14462 ) ( not ( = ?auto_14461 ?auto_14462 ) ) ( not ( = ?auto_14460 ?auto_14461 ) ) ( not ( = ?auto_14460 ?auto_14462 ) ) ( not ( = ?auto_14464 ?auto_14465 ) ) ( HOIST-AT ?auto_14466 ?auto_14464 ) ( not ( = ?auto_14468 ?auto_14466 ) ) ( SURFACE-AT ?auto_14462 ?auto_14464 ) ( ON ?auto_14462 ?auto_14463 ) ( CLEAR ?auto_14462 ) ( not ( = ?auto_14461 ?auto_14463 ) ) ( not ( = ?auto_14462 ?auto_14463 ) ) ( not ( = ?auto_14460 ?auto_14463 ) ) ( SURFACE-AT ?auto_14460 ?auto_14465 ) ( CLEAR ?auto_14460 ) ( IS-CRATE ?auto_14461 ) ( AVAILABLE ?auto_14468 ) ( TRUCK-AT ?auto_14467 ?auto_14464 ) ( LIFTING ?auto_14466 ?auto_14461 ) ( ON ?auto_14460 ?auto_14459 ) ( not ( = ?auto_14459 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14461 ) ) ( not ( = ?auto_14459 ?auto_14462 ) ) ( not ( = ?auto_14459 ?auto_14463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14460 ?auto_14461 ?auto_14462 )
      ( MAKE-3CRATE-VERIFY ?auto_14459 ?auto_14460 ?auto_14461 ?auto_14462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14469 - SURFACE
      ?auto_14470 - SURFACE
      ?auto_14471 - SURFACE
      ?auto_14473 - SURFACE
      ?auto_14472 - SURFACE
    )
    :vars
    (
      ?auto_14479 - HOIST
      ?auto_14476 - PLACE
      ?auto_14475 - PLACE
      ?auto_14477 - HOIST
      ?auto_14474 - SURFACE
      ?auto_14478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14479 ?auto_14476 ) ( IS-CRATE ?auto_14472 ) ( not ( = ?auto_14473 ?auto_14472 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14471 ?auto_14472 ) ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( HOIST-AT ?auto_14477 ?auto_14475 ) ( not ( = ?auto_14479 ?auto_14477 ) ) ( SURFACE-AT ?auto_14472 ?auto_14475 ) ( ON ?auto_14472 ?auto_14474 ) ( CLEAR ?auto_14472 ) ( not ( = ?auto_14473 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14474 ) ) ( not ( = ?auto_14471 ?auto_14474 ) ) ( SURFACE-AT ?auto_14471 ?auto_14476 ) ( CLEAR ?auto_14471 ) ( IS-CRATE ?auto_14473 ) ( AVAILABLE ?auto_14479 ) ( TRUCK-AT ?auto_14478 ?auto_14475 ) ( LIFTING ?auto_14477 ?auto_14473 ) ( ON ?auto_14470 ?auto_14469 ) ( ON ?auto_14471 ?auto_14470 ) ( not ( = ?auto_14469 ?auto_14470 ) ) ( not ( = ?auto_14469 ?auto_14471 ) ) ( not ( = ?auto_14469 ?auto_14473 ) ) ( not ( = ?auto_14469 ?auto_14472 ) ) ( not ( = ?auto_14469 ?auto_14474 ) ) ( not ( = ?auto_14470 ?auto_14471 ) ) ( not ( = ?auto_14470 ?auto_14473 ) ) ( not ( = ?auto_14470 ?auto_14472 ) ) ( not ( = ?auto_14470 ?auto_14474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14471 ?auto_14473 ?auto_14472 )
      ( MAKE-4CRATE-VERIFY ?auto_14469 ?auto_14470 ?auto_14471 ?auto_14473 ?auto_14472 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14480 - SURFACE
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
      ?auto_14484 - SURFACE
      ?auto_14483 - SURFACE
      ?auto_14485 - SURFACE
    )
    :vars
    (
      ?auto_14491 - HOIST
      ?auto_14488 - PLACE
      ?auto_14487 - PLACE
      ?auto_14489 - HOIST
      ?auto_14486 - SURFACE
      ?auto_14490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14491 ?auto_14488 ) ( IS-CRATE ?auto_14485 ) ( not ( = ?auto_14483 ?auto_14485 ) ) ( not ( = ?auto_14484 ?auto_14483 ) ) ( not ( = ?auto_14484 ?auto_14485 ) ) ( not ( = ?auto_14487 ?auto_14488 ) ) ( HOIST-AT ?auto_14489 ?auto_14487 ) ( not ( = ?auto_14491 ?auto_14489 ) ) ( SURFACE-AT ?auto_14485 ?auto_14487 ) ( ON ?auto_14485 ?auto_14486 ) ( CLEAR ?auto_14485 ) ( not ( = ?auto_14483 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( not ( = ?auto_14484 ?auto_14486 ) ) ( SURFACE-AT ?auto_14484 ?auto_14488 ) ( CLEAR ?auto_14484 ) ( IS-CRATE ?auto_14483 ) ( AVAILABLE ?auto_14491 ) ( TRUCK-AT ?auto_14490 ?auto_14487 ) ( LIFTING ?auto_14489 ?auto_14483 ) ( ON ?auto_14481 ?auto_14480 ) ( ON ?auto_14482 ?auto_14481 ) ( ON ?auto_14484 ?auto_14482 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14484 ) ) ( not ( = ?auto_14480 ?auto_14483 ) ) ( not ( = ?auto_14480 ?auto_14485 ) ) ( not ( = ?auto_14480 ?auto_14486 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14484 ) ) ( not ( = ?auto_14481 ?auto_14483 ) ) ( not ( = ?auto_14481 ?auto_14485 ) ) ( not ( = ?auto_14481 ?auto_14486 ) ) ( not ( = ?auto_14482 ?auto_14484 ) ) ( not ( = ?auto_14482 ?auto_14483 ) ) ( not ( = ?auto_14482 ?auto_14485 ) ) ( not ( = ?auto_14482 ?auto_14486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14484 ?auto_14483 ?auto_14485 )
      ( MAKE-5CRATE-VERIFY ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14484 ?auto_14483 ?auto_14485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14512 - SURFACE
      ?auto_14513 - SURFACE
      ?auto_14514 - SURFACE
      ?auto_14515 - SURFACE
    )
    :vars
    (
      ?auto_14519 - HOIST
      ?auto_14521 - PLACE
      ?auto_14520 - PLACE
      ?auto_14518 - HOIST
      ?auto_14517 - SURFACE
      ?auto_14522 - TRUCK
      ?auto_14516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14519 ?auto_14521 ) ( IS-CRATE ?auto_14515 ) ( not ( = ?auto_14514 ?auto_14515 ) ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14515 ) ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( HOIST-AT ?auto_14518 ?auto_14520 ) ( not ( = ?auto_14519 ?auto_14518 ) ) ( SURFACE-AT ?auto_14515 ?auto_14520 ) ( ON ?auto_14515 ?auto_14517 ) ( CLEAR ?auto_14515 ) ( not ( = ?auto_14514 ?auto_14517 ) ) ( not ( = ?auto_14515 ?auto_14517 ) ) ( not ( = ?auto_14513 ?auto_14517 ) ) ( SURFACE-AT ?auto_14513 ?auto_14521 ) ( CLEAR ?auto_14513 ) ( IS-CRATE ?auto_14514 ) ( AVAILABLE ?auto_14519 ) ( TRUCK-AT ?auto_14522 ?auto_14520 ) ( AVAILABLE ?auto_14518 ) ( SURFACE-AT ?auto_14514 ?auto_14520 ) ( ON ?auto_14514 ?auto_14516 ) ( CLEAR ?auto_14514 ) ( not ( = ?auto_14514 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14513 ?auto_14516 ) ) ( not ( = ?auto_14517 ?auto_14516 ) ) ( ON ?auto_14513 ?auto_14512 ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14515 ) ) ( not ( = ?auto_14512 ?auto_14517 ) ) ( not ( = ?auto_14512 ?auto_14516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14513 ?auto_14514 ?auto_14515 )
      ( MAKE-3CRATE-VERIFY ?auto_14512 ?auto_14513 ?auto_14514 ?auto_14515 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14523 - SURFACE
      ?auto_14524 - SURFACE
      ?auto_14525 - SURFACE
      ?auto_14527 - SURFACE
      ?auto_14526 - SURFACE
    )
    :vars
    (
      ?auto_14531 - HOIST
      ?auto_14533 - PLACE
      ?auto_14532 - PLACE
      ?auto_14530 - HOIST
      ?auto_14529 - SURFACE
      ?auto_14534 - TRUCK
      ?auto_14528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14531 ?auto_14533 ) ( IS-CRATE ?auto_14526 ) ( not ( = ?auto_14527 ?auto_14526 ) ) ( not ( = ?auto_14525 ?auto_14527 ) ) ( not ( = ?auto_14525 ?auto_14526 ) ) ( not ( = ?auto_14532 ?auto_14533 ) ) ( HOIST-AT ?auto_14530 ?auto_14532 ) ( not ( = ?auto_14531 ?auto_14530 ) ) ( SURFACE-AT ?auto_14526 ?auto_14532 ) ( ON ?auto_14526 ?auto_14529 ) ( CLEAR ?auto_14526 ) ( not ( = ?auto_14527 ?auto_14529 ) ) ( not ( = ?auto_14526 ?auto_14529 ) ) ( not ( = ?auto_14525 ?auto_14529 ) ) ( SURFACE-AT ?auto_14525 ?auto_14533 ) ( CLEAR ?auto_14525 ) ( IS-CRATE ?auto_14527 ) ( AVAILABLE ?auto_14531 ) ( TRUCK-AT ?auto_14534 ?auto_14532 ) ( AVAILABLE ?auto_14530 ) ( SURFACE-AT ?auto_14527 ?auto_14532 ) ( ON ?auto_14527 ?auto_14528 ) ( CLEAR ?auto_14527 ) ( not ( = ?auto_14527 ?auto_14528 ) ) ( not ( = ?auto_14526 ?auto_14528 ) ) ( not ( = ?auto_14525 ?auto_14528 ) ) ( not ( = ?auto_14529 ?auto_14528 ) ) ( ON ?auto_14524 ?auto_14523 ) ( ON ?auto_14525 ?auto_14524 ) ( not ( = ?auto_14523 ?auto_14524 ) ) ( not ( = ?auto_14523 ?auto_14525 ) ) ( not ( = ?auto_14523 ?auto_14527 ) ) ( not ( = ?auto_14523 ?auto_14526 ) ) ( not ( = ?auto_14523 ?auto_14529 ) ) ( not ( = ?auto_14523 ?auto_14528 ) ) ( not ( = ?auto_14524 ?auto_14525 ) ) ( not ( = ?auto_14524 ?auto_14527 ) ) ( not ( = ?auto_14524 ?auto_14526 ) ) ( not ( = ?auto_14524 ?auto_14529 ) ) ( not ( = ?auto_14524 ?auto_14528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14525 ?auto_14527 ?auto_14526 )
      ( MAKE-4CRATE-VERIFY ?auto_14523 ?auto_14524 ?auto_14525 ?auto_14527 ?auto_14526 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14535 - SURFACE
      ?auto_14536 - SURFACE
      ?auto_14537 - SURFACE
      ?auto_14539 - SURFACE
      ?auto_14538 - SURFACE
      ?auto_14540 - SURFACE
    )
    :vars
    (
      ?auto_14544 - HOIST
      ?auto_14546 - PLACE
      ?auto_14545 - PLACE
      ?auto_14543 - HOIST
      ?auto_14542 - SURFACE
      ?auto_14547 - TRUCK
      ?auto_14541 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14544 ?auto_14546 ) ( IS-CRATE ?auto_14540 ) ( not ( = ?auto_14538 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14538 ) ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14545 ?auto_14546 ) ) ( HOIST-AT ?auto_14543 ?auto_14545 ) ( not ( = ?auto_14544 ?auto_14543 ) ) ( SURFACE-AT ?auto_14540 ?auto_14545 ) ( ON ?auto_14540 ?auto_14542 ) ( CLEAR ?auto_14540 ) ( not ( = ?auto_14538 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( SURFACE-AT ?auto_14539 ?auto_14546 ) ( CLEAR ?auto_14539 ) ( IS-CRATE ?auto_14538 ) ( AVAILABLE ?auto_14544 ) ( TRUCK-AT ?auto_14547 ?auto_14545 ) ( AVAILABLE ?auto_14543 ) ( SURFACE-AT ?auto_14538 ?auto_14545 ) ( ON ?auto_14538 ?auto_14541 ) ( CLEAR ?auto_14538 ) ( not ( = ?auto_14538 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14542 ?auto_14541 ) ) ( ON ?auto_14536 ?auto_14535 ) ( ON ?auto_14537 ?auto_14536 ) ( ON ?auto_14539 ?auto_14537 ) ( not ( = ?auto_14535 ?auto_14536 ) ) ( not ( = ?auto_14535 ?auto_14537 ) ) ( not ( = ?auto_14535 ?auto_14539 ) ) ( not ( = ?auto_14535 ?auto_14538 ) ) ( not ( = ?auto_14535 ?auto_14540 ) ) ( not ( = ?auto_14535 ?auto_14542 ) ) ( not ( = ?auto_14535 ?auto_14541 ) ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14539 ) ) ( not ( = ?auto_14536 ?auto_14538 ) ) ( not ( = ?auto_14536 ?auto_14540 ) ) ( not ( = ?auto_14536 ?auto_14542 ) ) ( not ( = ?auto_14536 ?auto_14541 ) ) ( not ( = ?auto_14537 ?auto_14539 ) ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( not ( = ?auto_14537 ?auto_14540 ) ) ( not ( = ?auto_14537 ?auto_14542 ) ) ( not ( = ?auto_14537 ?auto_14541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14539 ?auto_14538 ?auto_14540 )
      ( MAKE-5CRATE-VERIFY ?auto_14535 ?auto_14536 ?auto_14537 ?auto_14539 ?auto_14538 ?auto_14540 ) )
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
      ?auto_14578 - HOIST
      ?auto_14577 - PLACE
      ?auto_14572 - PLACE
      ?auto_14575 - HOIST
      ?auto_14573 - SURFACE
      ?auto_14576 - SURFACE
      ?auto_14574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14578 ?auto_14577 ) ( IS-CRATE ?auto_14571 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( not ( = ?auto_14569 ?auto_14570 ) ) ( not ( = ?auto_14569 ?auto_14571 ) ) ( not ( = ?auto_14572 ?auto_14577 ) ) ( HOIST-AT ?auto_14575 ?auto_14572 ) ( not ( = ?auto_14578 ?auto_14575 ) ) ( SURFACE-AT ?auto_14571 ?auto_14572 ) ( ON ?auto_14571 ?auto_14573 ) ( CLEAR ?auto_14571 ) ( not ( = ?auto_14570 ?auto_14573 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14569 ?auto_14573 ) ) ( SURFACE-AT ?auto_14569 ?auto_14577 ) ( CLEAR ?auto_14569 ) ( IS-CRATE ?auto_14570 ) ( AVAILABLE ?auto_14578 ) ( AVAILABLE ?auto_14575 ) ( SURFACE-AT ?auto_14570 ?auto_14572 ) ( ON ?auto_14570 ?auto_14576 ) ( CLEAR ?auto_14570 ) ( not ( = ?auto_14570 ?auto_14576 ) ) ( not ( = ?auto_14571 ?auto_14576 ) ) ( not ( = ?auto_14569 ?auto_14576 ) ) ( not ( = ?auto_14573 ?auto_14576 ) ) ( TRUCK-AT ?auto_14574 ?auto_14577 ) ( ON ?auto_14569 ?auto_14568 ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14570 ) ) ( not ( = ?auto_14568 ?auto_14571 ) ) ( not ( = ?auto_14568 ?auto_14573 ) ) ( not ( = ?auto_14568 ?auto_14576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14569 ?auto_14570 ?auto_14571 )
      ( MAKE-3CRATE-VERIFY ?auto_14568 ?auto_14569 ?auto_14570 ?auto_14571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14579 - SURFACE
      ?auto_14580 - SURFACE
      ?auto_14581 - SURFACE
      ?auto_14583 - SURFACE
      ?auto_14582 - SURFACE
    )
    :vars
    (
      ?auto_14590 - HOIST
      ?auto_14589 - PLACE
      ?auto_14584 - PLACE
      ?auto_14587 - HOIST
      ?auto_14585 - SURFACE
      ?auto_14588 - SURFACE
      ?auto_14586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14590 ?auto_14589 ) ( IS-CRATE ?auto_14582 ) ( not ( = ?auto_14583 ?auto_14582 ) ) ( not ( = ?auto_14581 ?auto_14583 ) ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14584 ?auto_14589 ) ) ( HOIST-AT ?auto_14587 ?auto_14584 ) ( not ( = ?auto_14590 ?auto_14587 ) ) ( SURFACE-AT ?auto_14582 ?auto_14584 ) ( ON ?auto_14582 ?auto_14585 ) ( CLEAR ?auto_14582 ) ( not ( = ?auto_14583 ?auto_14585 ) ) ( not ( = ?auto_14582 ?auto_14585 ) ) ( not ( = ?auto_14581 ?auto_14585 ) ) ( SURFACE-AT ?auto_14581 ?auto_14589 ) ( CLEAR ?auto_14581 ) ( IS-CRATE ?auto_14583 ) ( AVAILABLE ?auto_14590 ) ( AVAILABLE ?auto_14587 ) ( SURFACE-AT ?auto_14583 ?auto_14584 ) ( ON ?auto_14583 ?auto_14588 ) ( CLEAR ?auto_14583 ) ( not ( = ?auto_14583 ?auto_14588 ) ) ( not ( = ?auto_14582 ?auto_14588 ) ) ( not ( = ?auto_14581 ?auto_14588 ) ) ( not ( = ?auto_14585 ?auto_14588 ) ) ( TRUCK-AT ?auto_14586 ?auto_14589 ) ( ON ?auto_14580 ?auto_14579 ) ( ON ?auto_14581 ?auto_14580 ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14583 ) ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( not ( = ?auto_14579 ?auto_14585 ) ) ( not ( = ?auto_14579 ?auto_14588 ) ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14583 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14580 ?auto_14585 ) ) ( not ( = ?auto_14580 ?auto_14588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14581 ?auto_14583 ?auto_14582 )
      ( MAKE-4CRATE-VERIFY ?auto_14579 ?auto_14580 ?auto_14581 ?auto_14583 ?auto_14582 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14591 - SURFACE
      ?auto_14592 - SURFACE
      ?auto_14593 - SURFACE
      ?auto_14595 - SURFACE
      ?auto_14594 - SURFACE
      ?auto_14596 - SURFACE
    )
    :vars
    (
      ?auto_14603 - HOIST
      ?auto_14602 - PLACE
      ?auto_14597 - PLACE
      ?auto_14600 - HOIST
      ?auto_14598 - SURFACE
      ?auto_14601 - SURFACE
      ?auto_14599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14603 ?auto_14602 ) ( IS-CRATE ?auto_14596 ) ( not ( = ?auto_14594 ?auto_14596 ) ) ( not ( = ?auto_14595 ?auto_14594 ) ) ( not ( = ?auto_14595 ?auto_14596 ) ) ( not ( = ?auto_14597 ?auto_14602 ) ) ( HOIST-AT ?auto_14600 ?auto_14597 ) ( not ( = ?auto_14603 ?auto_14600 ) ) ( SURFACE-AT ?auto_14596 ?auto_14597 ) ( ON ?auto_14596 ?auto_14598 ) ( CLEAR ?auto_14596 ) ( not ( = ?auto_14594 ?auto_14598 ) ) ( not ( = ?auto_14596 ?auto_14598 ) ) ( not ( = ?auto_14595 ?auto_14598 ) ) ( SURFACE-AT ?auto_14595 ?auto_14602 ) ( CLEAR ?auto_14595 ) ( IS-CRATE ?auto_14594 ) ( AVAILABLE ?auto_14603 ) ( AVAILABLE ?auto_14600 ) ( SURFACE-AT ?auto_14594 ?auto_14597 ) ( ON ?auto_14594 ?auto_14601 ) ( CLEAR ?auto_14594 ) ( not ( = ?auto_14594 ?auto_14601 ) ) ( not ( = ?auto_14596 ?auto_14601 ) ) ( not ( = ?auto_14595 ?auto_14601 ) ) ( not ( = ?auto_14598 ?auto_14601 ) ) ( TRUCK-AT ?auto_14599 ?auto_14602 ) ( ON ?auto_14592 ?auto_14591 ) ( ON ?auto_14593 ?auto_14592 ) ( ON ?auto_14595 ?auto_14593 ) ( not ( = ?auto_14591 ?auto_14592 ) ) ( not ( = ?auto_14591 ?auto_14593 ) ) ( not ( = ?auto_14591 ?auto_14595 ) ) ( not ( = ?auto_14591 ?auto_14594 ) ) ( not ( = ?auto_14591 ?auto_14596 ) ) ( not ( = ?auto_14591 ?auto_14598 ) ) ( not ( = ?auto_14591 ?auto_14601 ) ) ( not ( = ?auto_14592 ?auto_14593 ) ) ( not ( = ?auto_14592 ?auto_14595 ) ) ( not ( = ?auto_14592 ?auto_14594 ) ) ( not ( = ?auto_14592 ?auto_14596 ) ) ( not ( = ?auto_14592 ?auto_14598 ) ) ( not ( = ?auto_14592 ?auto_14601 ) ) ( not ( = ?auto_14593 ?auto_14595 ) ) ( not ( = ?auto_14593 ?auto_14594 ) ) ( not ( = ?auto_14593 ?auto_14596 ) ) ( not ( = ?auto_14593 ?auto_14598 ) ) ( not ( = ?auto_14593 ?auto_14601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14595 ?auto_14594 ?auto_14596 )
      ( MAKE-5CRATE-VERIFY ?auto_14591 ?auto_14592 ?auto_14593 ?auto_14595 ?auto_14594 ?auto_14596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14604 - SURFACE
      ?auto_14605 - SURFACE
    )
    :vars
    (
      ?auto_14613 - HOIST
      ?auto_14612 - PLACE
      ?auto_14611 - SURFACE
      ?auto_14606 - PLACE
      ?auto_14609 - HOIST
      ?auto_14607 - SURFACE
      ?auto_14610 - SURFACE
      ?auto_14608 - TRUCK
      ?auto_14614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14613 ?auto_14612 ) ( IS-CRATE ?auto_14605 ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14611 ?auto_14604 ) ) ( not ( = ?auto_14611 ?auto_14605 ) ) ( not ( = ?auto_14606 ?auto_14612 ) ) ( HOIST-AT ?auto_14609 ?auto_14606 ) ( not ( = ?auto_14613 ?auto_14609 ) ) ( SURFACE-AT ?auto_14605 ?auto_14606 ) ( ON ?auto_14605 ?auto_14607 ) ( CLEAR ?auto_14605 ) ( not ( = ?auto_14604 ?auto_14607 ) ) ( not ( = ?auto_14605 ?auto_14607 ) ) ( not ( = ?auto_14611 ?auto_14607 ) ) ( IS-CRATE ?auto_14604 ) ( AVAILABLE ?auto_14609 ) ( SURFACE-AT ?auto_14604 ?auto_14606 ) ( ON ?auto_14604 ?auto_14610 ) ( CLEAR ?auto_14604 ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( not ( = ?auto_14605 ?auto_14610 ) ) ( not ( = ?auto_14611 ?auto_14610 ) ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( TRUCK-AT ?auto_14608 ?auto_14612 ) ( SURFACE-AT ?auto_14614 ?auto_14612 ) ( CLEAR ?auto_14614 ) ( LIFTING ?auto_14613 ?auto_14611 ) ( IS-CRATE ?auto_14611 ) ( not ( = ?auto_14614 ?auto_14611 ) ) ( not ( = ?auto_14604 ?auto_14614 ) ) ( not ( = ?auto_14605 ?auto_14614 ) ) ( not ( = ?auto_14607 ?auto_14614 ) ) ( not ( = ?auto_14610 ?auto_14614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14614 ?auto_14611 )
      ( MAKE-2CRATE ?auto_14611 ?auto_14604 ?auto_14605 )
      ( MAKE-1CRATE-VERIFY ?auto_14604 ?auto_14605 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14615 - SURFACE
      ?auto_14616 - SURFACE
      ?auto_14617 - SURFACE
    )
    :vars
    (
      ?auto_14624 - HOIST
      ?auto_14618 - PLACE
      ?auto_14623 - PLACE
      ?auto_14620 - HOIST
      ?auto_14622 - SURFACE
      ?auto_14619 - SURFACE
      ?auto_14625 - TRUCK
      ?auto_14621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14624 ?auto_14618 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14623 ?auto_14618 ) ) ( HOIST-AT ?auto_14620 ?auto_14623 ) ( not ( = ?auto_14624 ?auto_14620 ) ) ( SURFACE-AT ?auto_14617 ?auto_14623 ) ( ON ?auto_14617 ?auto_14622 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14622 ) ) ( not ( = ?auto_14617 ?auto_14622 ) ) ( not ( = ?auto_14615 ?auto_14622 ) ) ( IS-CRATE ?auto_14616 ) ( AVAILABLE ?auto_14620 ) ( SURFACE-AT ?auto_14616 ?auto_14623 ) ( ON ?auto_14616 ?auto_14619 ) ( CLEAR ?auto_14616 ) ( not ( = ?auto_14616 ?auto_14619 ) ) ( not ( = ?auto_14617 ?auto_14619 ) ) ( not ( = ?auto_14615 ?auto_14619 ) ) ( not ( = ?auto_14622 ?auto_14619 ) ) ( TRUCK-AT ?auto_14625 ?auto_14618 ) ( SURFACE-AT ?auto_14621 ?auto_14618 ) ( CLEAR ?auto_14621 ) ( LIFTING ?auto_14624 ?auto_14615 ) ( IS-CRATE ?auto_14615 ) ( not ( = ?auto_14621 ?auto_14615 ) ) ( not ( = ?auto_14616 ?auto_14621 ) ) ( not ( = ?auto_14617 ?auto_14621 ) ) ( not ( = ?auto_14622 ?auto_14621 ) ) ( not ( = ?auto_14619 ?auto_14621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14616 ?auto_14617 )
      ( MAKE-2CRATE-VERIFY ?auto_14615 ?auto_14616 ?auto_14617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14626 - SURFACE
      ?auto_14627 - SURFACE
      ?auto_14628 - SURFACE
      ?auto_14629 - SURFACE
    )
    :vars
    (
      ?auto_14630 - HOIST
      ?auto_14636 - PLACE
      ?auto_14632 - PLACE
      ?auto_14633 - HOIST
      ?auto_14635 - SURFACE
      ?auto_14634 - SURFACE
      ?auto_14631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14630 ?auto_14636 ) ( IS-CRATE ?auto_14629 ) ( not ( = ?auto_14628 ?auto_14629 ) ) ( not ( = ?auto_14627 ?auto_14628 ) ) ( not ( = ?auto_14627 ?auto_14629 ) ) ( not ( = ?auto_14632 ?auto_14636 ) ) ( HOIST-AT ?auto_14633 ?auto_14632 ) ( not ( = ?auto_14630 ?auto_14633 ) ) ( SURFACE-AT ?auto_14629 ?auto_14632 ) ( ON ?auto_14629 ?auto_14635 ) ( CLEAR ?auto_14629 ) ( not ( = ?auto_14628 ?auto_14635 ) ) ( not ( = ?auto_14629 ?auto_14635 ) ) ( not ( = ?auto_14627 ?auto_14635 ) ) ( IS-CRATE ?auto_14628 ) ( AVAILABLE ?auto_14633 ) ( SURFACE-AT ?auto_14628 ?auto_14632 ) ( ON ?auto_14628 ?auto_14634 ) ( CLEAR ?auto_14628 ) ( not ( = ?auto_14628 ?auto_14634 ) ) ( not ( = ?auto_14629 ?auto_14634 ) ) ( not ( = ?auto_14627 ?auto_14634 ) ) ( not ( = ?auto_14635 ?auto_14634 ) ) ( TRUCK-AT ?auto_14631 ?auto_14636 ) ( SURFACE-AT ?auto_14626 ?auto_14636 ) ( CLEAR ?auto_14626 ) ( LIFTING ?auto_14630 ?auto_14627 ) ( IS-CRATE ?auto_14627 ) ( not ( = ?auto_14626 ?auto_14627 ) ) ( not ( = ?auto_14628 ?auto_14626 ) ) ( not ( = ?auto_14629 ?auto_14626 ) ) ( not ( = ?auto_14635 ?auto_14626 ) ) ( not ( = ?auto_14634 ?auto_14626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14627 ?auto_14628 ?auto_14629 )
      ( MAKE-3CRATE-VERIFY ?auto_14626 ?auto_14627 ?auto_14628 ?auto_14629 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14637 - SURFACE
      ?auto_14638 - SURFACE
      ?auto_14639 - SURFACE
      ?auto_14641 - SURFACE
      ?auto_14640 - SURFACE
    )
    :vars
    (
      ?auto_14642 - HOIST
      ?auto_14648 - PLACE
      ?auto_14644 - PLACE
      ?auto_14645 - HOIST
      ?auto_14647 - SURFACE
      ?auto_14646 - SURFACE
      ?auto_14643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14642 ?auto_14648 ) ( IS-CRATE ?auto_14640 ) ( not ( = ?auto_14641 ?auto_14640 ) ) ( not ( = ?auto_14639 ?auto_14641 ) ) ( not ( = ?auto_14639 ?auto_14640 ) ) ( not ( = ?auto_14644 ?auto_14648 ) ) ( HOIST-AT ?auto_14645 ?auto_14644 ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( SURFACE-AT ?auto_14640 ?auto_14644 ) ( ON ?auto_14640 ?auto_14647 ) ( CLEAR ?auto_14640 ) ( not ( = ?auto_14641 ?auto_14647 ) ) ( not ( = ?auto_14640 ?auto_14647 ) ) ( not ( = ?auto_14639 ?auto_14647 ) ) ( IS-CRATE ?auto_14641 ) ( AVAILABLE ?auto_14645 ) ( SURFACE-AT ?auto_14641 ?auto_14644 ) ( ON ?auto_14641 ?auto_14646 ) ( CLEAR ?auto_14641 ) ( not ( = ?auto_14641 ?auto_14646 ) ) ( not ( = ?auto_14640 ?auto_14646 ) ) ( not ( = ?auto_14639 ?auto_14646 ) ) ( not ( = ?auto_14647 ?auto_14646 ) ) ( TRUCK-AT ?auto_14643 ?auto_14648 ) ( SURFACE-AT ?auto_14638 ?auto_14648 ) ( CLEAR ?auto_14638 ) ( LIFTING ?auto_14642 ?auto_14639 ) ( IS-CRATE ?auto_14639 ) ( not ( = ?auto_14638 ?auto_14639 ) ) ( not ( = ?auto_14641 ?auto_14638 ) ) ( not ( = ?auto_14640 ?auto_14638 ) ) ( not ( = ?auto_14647 ?auto_14638 ) ) ( not ( = ?auto_14646 ?auto_14638 ) ) ( ON ?auto_14638 ?auto_14637 ) ( not ( = ?auto_14637 ?auto_14638 ) ) ( not ( = ?auto_14637 ?auto_14639 ) ) ( not ( = ?auto_14637 ?auto_14641 ) ) ( not ( = ?auto_14637 ?auto_14640 ) ) ( not ( = ?auto_14637 ?auto_14647 ) ) ( not ( = ?auto_14637 ?auto_14646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14639 ?auto_14641 ?auto_14640 )
      ( MAKE-4CRATE-VERIFY ?auto_14637 ?auto_14638 ?auto_14639 ?auto_14641 ?auto_14640 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14649 - SURFACE
      ?auto_14650 - SURFACE
      ?auto_14651 - SURFACE
      ?auto_14653 - SURFACE
      ?auto_14652 - SURFACE
      ?auto_14654 - SURFACE
    )
    :vars
    (
      ?auto_14655 - HOIST
      ?auto_14661 - PLACE
      ?auto_14657 - PLACE
      ?auto_14658 - HOIST
      ?auto_14660 - SURFACE
      ?auto_14659 - SURFACE
      ?auto_14656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14655 ?auto_14661 ) ( IS-CRATE ?auto_14654 ) ( not ( = ?auto_14652 ?auto_14654 ) ) ( not ( = ?auto_14653 ?auto_14652 ) ) ( not ( = ?auto_14653 ?auto_14654 ) ) ( not ( = ?auto_14657 ?auto_14661 ) ) ( HOIST-AT ?auto_14658 ?auto_14657 ) ( not ( = ?auto_14655 ?auto_14658 ) ) ( SURFACE-AT ?auto_14654 ?auto_14657 ) ( ON ?auto_14654 ?auto_14660 ) ( CLEAR ?auto_14654 ) ( not ( = ?auto_14652 ?auto_14660 ) ) ( not ( = ?auto_14654 ?auto_14660 ) ) ( not ( = ?auto_14653 ?auto_14660 ) ) ( IS-CRATE ?auto_14652 ) ( AVAILABLE ?auto_14658 ) ( SURFACE-AT ?auto_14652 ?auto_14657 ) ( ON ?auto_14652 ?auto_14659 ) ( CLEAR ?auto_14652 ) ( not ( = ?auto_14652 ?auto_14659 ) ) ( not ( = ?auto_14654 ?auto_14659 ) ) ( not ( = ?auto_14653 ?auto_14659 ) ) ( not ( = ?auto_14660 ?auto_14659 ) ) ( TRUCK-AT ?auto_14656 ?auto_14661 ) ( SURFACE-AT ?auto_14651 ?auto_14661 ) ( CLEAR ?auto_14651 ) ( LIFTING ?auto_14655 ?auto_14653 ) ( IS-CRATE ?auto_14653 ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14651 ) ) ( not ( = ?auto_14654 ?auto_14651 ) ) ( not ( = ?auto_14660 ?auto_14651 ) ) ( not ( = ?auto_14659 ?auto_14651 ) ) ( ON ?auto_14650 ?auto_14649 ) ( ON ?auto_14651 ?auto_14650 ) ( not ( = ?auto_14649 ?auto_14650 ) ) ( not ( = ?auto_14649 ?auto_14651 ) ) ( not ( = ?auto_14649 ?auto_14653 ) ) ( not ( = ?auto_14649 ?auto_14652 ) ) ( not ( = ?auto_14649 ?auto_14654 ) ) ( not ( = ?auto_14649 ?auto_14660 ) ) ( not ( = ?auto_14649 ?auto_14659 ) ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14650 ?auto_14653 ) ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14650 ?auto_14654 ) ) ( not ( = ?auto_14650 ?auto_14660 ) ) ( not ( = ?auto_14650 ?auto_14659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14653 ?auto_14652 ?auto_14654 )
      ( MAKE-5CRATE-VERIFY ?auto_14649 ?auto_14650 ?auto_14651 ?auto_14653 ?auto_14652 ?auto_14654 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15039 - SURFACE
      ?auto_15040 - SURFACE
    )
    :vars
    (
      ?auto_15042 - HOIST
      ?auto_15048 - PLACE
      ?auto_15046 - SURFACE
      ?auto_15047 - PLACE
      ?auto_15044 - HOIST
      ?auto_15043 - SURFACE
      ?auto_15041 - TRUCK
      ?auto_15045 - SURFACE
      ?auto_15049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15042 ?auto_15048 ) ( IS-CRATE ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15046 ?auto_15039 ) ) ( not ( = ?auto_15046 ?auto_15040 ) ) ( not ( = ?auto_15047 ?auto_15048 ) ) ( HOIST-AT ?auto_15044 ?auto_15047 ) ( not ( = ?auto_15042 ?auto_15044 ) ) ( SURFACE-AT ?auto_15040 ?auto_15047 ) ( ON ?auto_15040 ?auto_15043 ) ( CLEAR ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15043 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15046 ?auto_15043 ) ) ( SURFACE-AT ?auto_15046 ?auto_15048 ) ( CLEAR ?auto_15046 ) ( IS-CRATE ?auto_15039 ) ( AVAILABLE ?auto_15042 ) ( TRUCK-AT ?auto_15041 ?auto_15047 ) ( SURFACE-AT ?auto_15039 ?auto_15047 ) ( ON ?auto_15039 ?auto_15045 ) ( CLEAR ?auto_15039 ) ( not ( = ?auto_15039 ?auto_15045 ) ) ( not ( = ?auto_15040 ?auto_15045 ) ) ( not ( = ?auto_15046 ?auto_15045 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( LIFTING ?auto_15044 ?auto_15049 ) ( IS-CRATE ?auto_15049 ) ( not ( = ?auto_15039 ?auto_15049 ) ) ( not ( = ?auto_15040 ?auto_15049 ) ) ( not ( = ?auto_15046 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15049 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15044 ?auto_15049 ?auto_15041 ?auto_15047 )
      ( MAKE-2CRATE ?auto_15046 ?auto_15039 ?auto_15040 )
      ( MAKE-1CRATE-VERIFY ?auto_15039 ?auto_15040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15050 - SURFACE
      ?auto_15051 - SURFACE
      ?auto_15052 - SURFACE
    )
    :vars
    (
      ?auto_15060 - HOIST
      ?auto_15056 - PLACE
      ?auto_15054 - PLACE
      ?auto_15055 - HOIST
      ?auto_15057 - SURFACE
      ?auto_15059 - TRUCK
      ?auto_15053 - SURFACE
      ?auto_15058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15060 ?auto_15056 ) ( IS-CRATE ?auto_15052 ) ( not ( = ?auto_15051 ?auto_15052 ) ) ( not ( = ?auto_15050 ?auto_15051 ) ) ( not ( = ?auto_15050 ?auto_15052 ) ) ( not ( = ?auto_15054 ?auto_15056 ) ) ( HOIST-AT ?auto_15055 ?auto_15054 ) ( not ( = ?auto_15060 ?auto_15055 ) ) ( SURFACE-AT ?auto_15052 ?auto_15054 ) ( ON ?auto_15052 ?auto_15057 ) ( CLEAR ?auto_15052 ) ( not ( = ?auto_15051 ?auto_15057 ) ) ( not ( = ?auto_15052 ?auto_15057 ) ) ( not ( = ?auto_15050 ?auto_15057 ) ) ( SURFACE-AT ?auto_15050 ?auto_15056 ) ( CLEAR ?auto_15050 ) ( IS-CRATE ?auto_15051 ) ( AVAILABLE ?auto_15060 ) ( TRUCK-AT ?auto_15059 ?auto_15054 ) ( SURFACE-AT ?auto_15051 ?auto_15054 ) ( ON ?auto_15051 ?auto_15053 ) ( CLEAR ?auto_15051 ) ( not ( = ?auto_15051 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15050 ?auto_15053 ) ) ( not ( = ?auto_15057 ?auto_15053 ) ) ( LIFTING ?auto_15055 ?auto_15058 ) ( IS-CRATE ?auto_15058 ) ( not ( = ?auto_15051 ?auto_15058 ) ) ( not ( = ?auto_15052 ?auto_15058 ) ) ( not ( = ?auto_15050 ?auto_15058 ) ) ( not ( = ?auto_15057 ?auto_15058 ) ) ( not ( = ?auto_15053 ?auto_15058 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15051 ?auto_15052 )
      ( MAKE-2CRATE-VERIFY ?auto_15050 ?auto_15051 ?auto_15052 ) )
  )

)

