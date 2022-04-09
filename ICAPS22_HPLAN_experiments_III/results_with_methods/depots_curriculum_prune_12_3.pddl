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
      ?auto_12416 - SURFACE
      ?auto_12417 - SURFACE
    )
    :vars
    (
      ?auto_12418 - HOIST
      ?auto_12419 - PLACE
      ?auto_12421 - PLACE
      ?auto_12422 - HOIST
      ?auto_12423 - SURFACE
      ?auto_12420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12418 ?auto_12419 ) ( SURFACE-AT ?auto_12416 ?auto_12419 ) ( CLEAR ?auto_12416 ) ( IS-CRATE ?auto_12417 ) ( AVAILABLE ?auto_12418 ) ( not ( = ?auto_12421 ?auto_12419 ) ) ( HOIST-AT ?auto_12422 ?auto_12421 ) ( AVAILABLE ?auto_12422 ) ( SURFACE-AT ?auto_12417 ?auto_12421 ) ( ON ?auto_12417 ?auto_12423 ) ( CLEAR ?auto_12417 ) ( TRUCK-AT ?auto_12420 ?auto_12419 ) ( not ( = ?auto_12416 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12423 ) ) ( not ( = ?auto_12417 ?auto_12423 ) ) ( not ( = ?auto_12418 ?auto_12422 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12420 ?auto_12419 ?auto_12421 )
      ( !LIFT ?auto_12422 ?auto_12417 ?auto_12423 ?auto_12421 )
      ( !LOAD ?auto_12422 ?auto_12417 ?auto_12420 ?auto_12421 )
      ( !DRIVE ?auto_12420 ?auto_12421 ?auto_12419 )
      ( !UNLOAD ?auto_12418 ?auto_12417 ?auto_12420 ?auto_12419 )
      ( !DROP ?auto_12418 ?auto_12417 ?auto_12416 ?auto_12419 )
      ( MAKE-1CRATE-VERIFY ?auto_12416 ?auto_12417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12437 - SURFACE
      ?auto_12438 - SURFACE
      ?auto_12439 - SURFACE
    )
    :vars
    (
      ?auto_12443 - HOIST
      ?auto_12444 - PLACE
      ?auto_12440 - PLACE
      ?auto_12441 - HOIST
      ?auto_12442 - SURFACE
      ?auto_12447 - PLACE
      ?auto_12448 - HOIST
      ?auto_12446 - SURFACE
      ?auto_12445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12443 ?auto_12444 ) ( IS-CRATE ?auto_12439 ) ( not ( = ?auto_12440 ?auto_12444 ) ) ( HOIST-AT ?auto_12441 ?auto_12440 ) ( AVAILABLE ?auto_12441 ) ( SURFACE-AT ?auto_12439 ?auto_12440 ) ( ON ?auto_12439 ?auto_12442 ) ( CLEAR ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12439 ) ) ( not ( = ?auto_12438 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( not ( = ?auto_12443 ?auto_12441 ) ) ( SURFACE-AT ?auto_12437 ?auto_12444 ) ( CLEAR ?auto_12437 ) ( IS-CRATE ?auto_12438 ) ( AVAILABLE ?auto_12443 ) ( not ( = ?auto_12447 ?auto_12444 ) ) ( HOIST-AT ?auto_12448 ?auto_12447 ) ( AVAILABLE ?auto_12448 ) ( SURFACE-AT ?auto_12438 ?auto_12447 ) ( ON ?auto_12438 ?auto_12446 ) ( CLEAR ?auto_12438 ) ( TRUCK-AT ?auto_12445 ?auto_12444 ) ( not ( = ?auto_12437 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12446 ) ) ( not ( = ?auto_12438 ?auto_12446 ) ) ( not ( = ?auto_12443 ?auto_12448 ) ) ( not ( = ?auto_12437 ?auto_12439 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12446 ) ) ( not ( = ?auto_12440 ?auto_12447 ) ) ( not ( = ?auto_12441 ?auto_12448 ) ) ( not ( = ?auto_12442 ?auto_12446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12437 ?auto_12438 )
      ( MAKE-1CRATE ?auto_12438 ?auto_12439 )
      ( MAKE-2CRATE-VERIFY ?auto_12437 ?auto_12438 ?auto_12439 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12463 - SURFACE
      ?auto_12464 - SURFACE
      ?auto_12465 - SURFACE
      ?auto_12466 - SURFACE
    )
    :vars
    (
      ?auto_12470 - HOIST
      ?auto_12469 - PLACE
      ?auto_12467 - PLACE
      ?auto_12472 - HOIST
      ?auto_12468 - SURFACE
      ?auto_12474 - PLACE
      ?auto_12473 - HOIST
      ?auto_12478 - SURFACE
      ?auto_12476 - PLACE
      ?auto_12477 - HOIST
      ?auto_12475 - SURFACE
      ?auto_12471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12470 ?auto_12469 ) ( IS-CRATE ?auto_12466 ) ( not ( = ?auto_12467 ?auto_12469 ) ) ( HOIST-AT ?auto_12472 ?auto_12467 ) ( AVAILABLE ?auto_12472 ) ( SURFACE-AT ?auto_12466 ?auto_12467 ) ( ON ?auto_12466 ?auto_12468 ) ( CLEAR ?auto_12466 ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( not ( = ?auto_12470 ?auto_12472 ) ) ( IS-CRATE ?auto_12465 ) ( not ( = ?auto_12474 ?auto_12469 ) ) ( HOIST-AT ?auto_12473 ?auto_12474 ) ( AVAILABLE ?auto_12473 ) ( SURFACE-AT ?auto_12465 ?auto_12474 ) ( ON ?auto_12465 ?auto_12478 ) ( CLEAR ?auto_12465 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12478 ) ) ( not ( = ?auto_12465 ?auto_12478 ) ) ( not ( = ?auto_12470 ?auto_12473 ) ) ( SURFACE-AT ?auto_12463 ?auto_12469 ) ( CLEAR ?auto_12463 ) ( IS-CRATE ?auto_12464 ) ( AVAILABLE ?auto_12470 ) ( not ( = ?auto_12476 ?auto_12469 ) ) ( HOIST-AT ?auto_12477 ?auto_12476 ) ( AVAILABLE ?auto_12477 ) ( SURFACE-AT ?auto_12464 ?auto_12476 ) ( ON ?auto_12464 ?auto_12475 ) ( CLEAR ?auto_12464 ) ( TRUCK-AT ?auto_12471 ?auto_12469 ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12475 ) ) ( not ( = ?auto_12464 ?auto_12475 ) ) ( not ( = ?auto_12470 ?auto_12477 ) ) ( not ( = ?auto_12463 ?auto_12465 ) ) ( not ( = ?auto_12463 ?auto_12478 ) ) ( not ( = ?auto_12465 ?auto_12475 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( not ( = ?auto_12473 ?auto_12477 ) ) ( not ( = ?auto_12478 ?auto_12475 ) ) ( not ( = ?auto_12463 ?auto_12466 ) ) ( not ( = ?auto_12463 ?auto_12468 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12478 ) ) ( not ( = ?auto_12466 ?auto_12475 ) ) ( not ( = ?auto_12467 ?auto_12474 ) ) ( not ( = ?auto_12467 ?auto_12476 ) ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( not ( = ?auto_12472 ?auto_12477 ) ) ( not ( = ?auto_12468 ?auto_12478 ) ) ( not ( = ?auto_12468 ?auto_12475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12463 ?auto_12464 ?auto_12465 )
      ( MAKE-1CRATE ?auto_12465 ?auto_12466 )
      ( MAKE-3CRATE-VERIFY ?auto_12463 ?auto_12464 ?auto_12465 ?auto_12466 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12494 - SURFACE
      ?auto_12495 - SURFACE
      ?auto_12496 - SURFACE
      ?auto_12497 - SURFACE
      ?auto_12498 - SURFACE
    )
    :vars
    (
      ?auto_12502 - HOIST
      ?auto_12500 - PLACE
      ?auto_12504 - PLACE
      ?auto_12503 - HOIST
      ?auto_12501 - SURFACE
      ?auto_12506 - PLACE
      ?auto_12505 - HOIST
      ?auto_12508 - SURFACE
      ?auto_12512 - PLACE
      ?auto_12507 - HOIST
      ?auto_12513 - SURFACE
      ?auto_12511 - PLACE
      ?auto_12509 - HOIST
      ?auto_12510 - SURFACE
      ?auto_12499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12502 ?auto_12500 ) ( IS-CRATE ?auto_12498 ) ( not ( = ?auto_12504 ?auto_12500 ) ) ( HOIST-AT ?auto_12503 ?auto_12504 ) ( AVAILABLE ?auto_12503 ) ( SURFACE-AT ?auto_12498 ?auto_12504 ) ( ON ?auto_12498 ?auto_12501 ) ( CLEAR ?auto_12498 ) ( not ( = ?auto_12497 ?auto_12498 ) ) ( not ( = ?auto_12497 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12501 ) ) ( not ( = ?auto_12502 ?auto_12503 ) ) ( IS-CRATE ?auto_12497 ) ( not ( = ?auto_12506 ?auto_12500 ) ) ( HOIST-AT ?auto_12505 ?auto_12506 ) ( AVAILABLE ?auto_12505 ) ( SURFACE-AT ?auto_12497 ?auto_12506 ) ( ON ?auto_12497 ?auto_12508 ) ( CLEAR ?auto_12497 ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12508 ) ) ( not ( = ?auto_12497 ?auto_12508 ) ) ( not ( = ?auto_12502 ?auto_12505 ) ) ( IS-CRATE ?auto_12496 ) ( not ( = ?auto_12512 ?auto_12500 ) ) ( HOIST-AT ?auto_12507 ?auto_12512 ) ( AVAILABLE ?auto_12507 ) ( SURFACE-AT ?auto_12496 ?auto_12512 ) ( ON ?auto_12496 ?auto_12513 ) ( CLEAR ?auto_12496 ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12513 ) ) ( not ( = ?auto_12496 ?auto_12513 ) ) ( not ( = ?auto_12502 ?auto_12507 ) ) ( SURFACE-AT ?auto_12494 ?auto_12500 ) ( CLEAR ?auto_12494 ) ( IS-CRATE ?auto_12495 ) ( AVAILABLE ?auto_12502 ) ( not ( = ?auto_12511 ?auto_12500 ) ) ( HOIST-AT ?auto_12509 ?auto_12511 ) ( AVAILABLE ?auto_12509 ) ( SURFACE-AT ?auto_12495 ?auto_12511 ) ( ON ?auto_12495 ?auto_12510 ) ( CLEAR ?auto_12495 ) ( TRUCK-AT ?auto_12499 ?auto_12500 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( not ( = ?auto_12494 ?auto_12510 ) ) ( not ( = ?auto_12495 ?auto_12510 ) ) ( not ( = ?auto_12502 ?auto_12509 ) ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( not ( = ?auto_12494 ?auto_12513 ) ) ( not ( = ?auto_12496 ?auto_12510 ) ) ( not ( = ?auto_12512 ?auto_12511 ) ) ( not ( = ?auto_12507 ?auto_12509 ) ) ( not ( = ?auto_12513 ?auto_12510 ) ) ( not ( = ?auto_12494 ?auto_12497 ) ) ( not ( = ?auto_12494 ?auto_12508 ) ) ( not ( = ?auto_12495 ?auto_12497 ) ) ( not ( = ?auto_12495 ?auto_12508 ) ) ( not ( = ?auto_12497 ?auto_12513 ) ) ( not ( = ?auto_12497 ?auto_12510 ) ) ( not ( = ?auto_12506 ?auto_12512 ) ) ( not ( = ?auto_12506 ?auto_12511 ) ) ( not ( = ?auto_12505 ?auto_12507 ) ) ( not ( = ?auto_12505 ?auto_12509 ) ) ( not ( = ?auto_12508 ?auto_12513 ) ) ( not ( = ?auto_12508 ?auto_12510 ) ) ( not ( = ?auto_12494 ?auto_12498 ) ) ( not ( = ?auto_12494 ?auto_12501 ) ) ( not ( = ?auto_12495 ?auto_12498 ) ) ( not ( = ?auto_12495 ?auto_12501 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( not ( = ?auto_12496 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12508 ) ) ( not ( = ?auto_12498 ?auto_12513 ) ) ( not ( = ?auto_12498 ?auto_12510 ) ) ( not ( = ?auto_12504 ?auto_12506 ) ) ( not ( = ?auto_12504 ?auto_12512 ) ) ( not ( = ?auto_12504 ?auto_12511 ) ) ( not ( = ?auto_12503 ?auto_12505 ) ) ( not ( = ?auto_12503 ?auto_12507 ) ) ( not ( = ?auto_12503 ?auto_12509 ) ) ( not ( = ?auto_12501 ?auto_12508 ) ) ( not ( = ?auto_12501 ?auto_12513 ) ) ( not ( = ?auto_12501 ?auto_12510 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12494 ?auto_12495 ?auto_12496 ?auto_12497 )
      ( MAKE-1CRATE ?auto_12497 ?auto_12498 )
      ( MAKE-4CRATE-VERIFY ?auto_12494 ?auto_12495 ?auto_12496 ?auto_12497 ?auto_12498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12530 - SURFACE
      ?auto_12531 - SURFACE
      ?auto_12532 - SURFACE
      ?auto_12533 - SURFACE
      ?auto_12534 - SURFACE
      ?auto_12535 - SURFACE
    )
    :vars
    (
      ?auto_12541 - HOIST
      ?auto_12536 - PLACE
      ?auto_12539 - PLACE
      ?auto_12538 - HOIST
      ?auto_12537 - SURFACE
      ?auto_12547 - PLACE
      ?auto_12546 - HOIST
      ?auto_12545 - SURFACE
      ?auto_12551 - PLACE
      ?auto_12553 - HOIST
      ?auto_12550 - SURFACE
      ?auto_12544 - PLACE
      ?auto_12542 - HOIST
      ?auto_12552 - SURFACE
      ?auto_12543 - PLACE
      ?auto_12549 - HOIST
      ?auto_12548 - SURFACE
      ?auto_12540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12541 ?auto_12536 ) ( IS-CRATE ?auto_12535 ) ( not ( = ?auto_12539 ?auto_12536 ) ) ( HOIST-AT ?auto_12538 ?auto_12539 ) ( AVAILABLE ?auto_12538 ) ( SURFACE-AT ?auto_12535 ?auto_12539 ) ( ON ?auto_12535 ?auto_12537 ) ( CLEAR ?auto_12535 ) ( not ( = ?auto_12534 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12541 ?auto_12538 ) ) ( IS-CRATE ?auto_12534 ) ( not ( = ?auto_12547 ?auto_12536 ) ) ( HOIST-AT ?auto_12546 ?auto_12547 ) ( AVAILABLE ?auto_12546 ) ( SURFACE-AT ?auto_12534 ?auto_12547 ) ( ON ?auto_12534 ?auto_12545 ) ( CLEAR ?auto_12534 ) ( not ( = ?auto_12533 ?auto_12534 ) ) ( not ( = ?auto_12533 ?auto_12545 ) ) ( not ( = ?auto_12534 ?auto_12545 ) ) ( not ( = ?auto_12541 ?auto_12546 ) ) ( IS-CRATE ?auto_12533 ) ( not ( = ?auto_12551 ?auto_12536 ) ) ( HOIST-AT ?auto_12553 ?auto_12551 ) ( AVAILABLE ?auto_12553 ) ( SURFACE-AT ?auto_12533 ?auto_12551 ) ( ON ?auto_12533 ?auto_12550 ) ( CLEAR ?auto_12533 ) ( not ( = ?auto_12532 ?auto_12533 ) ) ( not ( = ?auto_12532 ?auto_12550 ) ) ( not ( = ?auto_12533 ?auto_12550 ) ) ( not ( = ?auto_12541 ?auto_12553 ) ) ( IS-CRATE ?auto_12532 ) ( not ( = ?auto_12544 ?auto_12536 ) ) ( HOIST-AT ?auto_12542 ?auto_12544 ) ( AVAILABLE ?auto_12542 ) ( SURFACE-AT ?auto_12532 ?auto_12544 ) ( ON ?auto_12532 ?auto_12552 ) ( CLEAR ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( not ( = ?auto_12531 ?auto_12552 ) ) ( not ( = ?auto_12532 ?auto_12552 ) ) ( not ( = ?auto_12541 ?auto_12542 ) ) ( SURFACE-AT ?auto_12530 ?auto_12536 ) ( CLEAR ?auto_12530 ) ( IS-CRATE ?auto_12531 ) ( AVAILABLE ?auto_12541 ) ( not ( = ?auto_12543 ?auto_12536 ) ) ( HOIST-AT ?auto_12549 ?auto_12543 ) ( AVAILABLE ?auto_12549 ) ( SURFACE-AT ?auto_12531 ?auto_12543 ) ( ON ?auto_12531 ?auto_12548 ) ( CLEAR ?auto_12531 ) ( TRUCK-AT ?auto_12540 ?auto_12536 ) ( not ( = ?auto_12530 ?auto_12531 ) ) ( not ( = ?auto_12530 ?auto_12548 ) ) ( not ( = ?auto_12531 ?auto_12548 ) ) ( not ( = ?auto_12541 ?auto_12549 ) ) ( not ( = ?auto_12530 ?auto_12532 ) ) ( not ( = ?auto_12530 ?auto_12552 ) ) ( not ( = ?auto_12532 ?auto_12548 ) ) ( not ( = ?auto_12544 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12549 ) ) ( not ( = ?auto_12552 ?auto_12548 ) ) ( not ( = ?auto_12530 ?auto_12533 ) ) ( not ( = ?auto_12530 ?auto_12550 ) ) ( not ( = ?auto_12531 ?auto_12533 ) ) ( not ( = ?auto_12531 ?auto_12550 ) ) ( not ( = ?auto_12533 ?auto_12552 ) ) ( not ( = ?auto_12533 ?auto_12548 ) ) ( not ( = ?auto_12551 ?auto_12544 ) ) ( not ( = ?auto_12551 ?auto_12543 ) ) ( not ( = ?auto_12553 ?auto_12542 ) ) ( not ( = ?auto_12553 ?auto_12549 ) ) ( not ( = ?auto_12550 ?auto_12552 ) ) ( not ( = ?auto_12550 ?auto_12548 ) ) ( not ( = ?auto_12530 ?auto_12534 ) ) ( not ( = ?auto_12530 ?auto_12545 ) ) ( not ( = ?auto_12531 ?auto_12534 ) ) ( not ( = ?auto_12531 ?auto_12545 ) ) ( not ( = ?auto_12532 ?auto_12534 ) ) ( not ( = ?auto_12532 ?auto_12545 ) ) ( not ( = ?auto_12534 ?auto_12550 ) ) ( not ( = ?auto_12534 ?auto_12552 ) ) ( not ( = ?auto_12534 ?auto_12548 ) ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( not ( = ?auto_12547 ?auto_12544 ) ) ( not ( = ?auto_12547 ?auto_12543 ) ) ( not ( = ?auto_12546 ?auto_12553 ) ) ( not ( = ?auto_12546 ?auto_12542 ) ) ( not ( = ?auto_12546 ?auto_12549 ) ) ( not ( = ?auto_12545 ?auto_12550 ) ) ( not ( = ?auto_12545 ?auto_12552 ) ) ( not ( = ?auto_12545 ?auto_12548 ) ) ( not ( = ?auto_12530 ?auto_12535 ) ) ( not ( = ?auto_12530 ?auto_12537 ) ) ( not ( = ?auto_12531 ?auto_12535 ) ) ( not ( = ?auto_12531 ?auto_12537 ) ) ( not ( = ?auto_12532 ?auto_12535 ) ) ( not ( = ?auto_12532 ?auto_12537 ) ) ( not ( = ?auto_12533 ?auto_12535 ) ) ( not ( = ?auto_12533 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12545 ) ) ( not ( = ?auto_12535 ?auto_12550 ) ) ( not ( = ?auto_12535 ?auto_12552 ) ) ( not ( = ?auto_12535 ?auto_12548 ) ) ( not ( = ?auto_12539 ?auto_12547 ) ) ( not ( = ?auto_12539 ?auto_12551 ) ) ( not ( = ?auto_12539 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12543 ) ) ( not ( = ?auto_12538 ?auto_12546 ) ) ( not ( = ?auto_12538 ?auto_12553 ) ) ( not ( = ?auto_12538 ?auto_12542 ) ) ( not ( = ?auto_12538 ?auto_12549 ) ) ( not ( = ?auto_12537 ?auto_12545 ) ) ( not ( = ?auto_12537 ?auto_12550 ) ) ( not ( = ?auto_12537 ?auto_12552 ) ) ( not ( = ?auto_12537 ?auto_12548 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12530 ?auto_12531 ?auto_12532 ?auto_12533 ?auto_12534 )
      ( MAKE-1CRATE ?auto_12534 ?auto_12535 )
      ( MAKE-5CRATE-VERIFY ?auto_12530 ?auto_12531 ?auto_12532 ?auto_12533 ?auto_12534 ?auto_12535 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12571 - SURFACE
      ?auto_12572 - SURFACE
      ?auto_12573 - SURFACE
      ?auto_12574 - SURFACE
      ?auto_12575 - SURFACE
      ?auto_12576 - SURFACE
      ?auto_12577 - SURFACE
    )
    :vars
    (
      ?auto_12581 - HOIST
      ?auto_12583 - PLACE
      ?auto_12580 - PLACE
      ?auto_12579 - HOIST
      ?auto_12582 - SURFACE
      ?auto_12585 - PLACE
      ?auto_12584 - HOIST
      ?auto_12595 - SURFACE
      ?auto_12586 - PLACE
      ?auto_12587 - HOIST
      ?auto_12589 - SURFACE
      ?auto_12593 - PLACE
      ?auto_12596 - HOIST
      ?auto_12588 - SURFACE
      ?auto_12591 - PLACE
      ?auto_12594 - HOIST
      ?auto_12590 - SURFACE
      ?auto_12592 - PLACE
      ?auto_12597 - HOIST
      ?auto_12598 - SURFACE
      ?auto_12578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12581 ?auto_12583 ) ( IS-CRATE ?auto_12577 ) ( not ( = ?auto_12580 ?auto_12583 ) ) ( HOIST-AT ?auto_12579 ?auto_12580 ) ( AVAILABLE ?auto_12579 ) ( SURFACE-AT ?auto_12577 ?auto_12580 ) ( ON ?auto_12577 ?auto_12582 ) ( CLEAR ?auto_12577 ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12582 ) ) ( not ( = ?auto_12577 ?auto_12582 ) ) ( not ( = ?auto_12581 ?auto_12579 ) ) ( IS-CRATE ?auto_12576 ) ( not ( = ?auto_12585 ?auto_12583 ) ) ( HOIST-AT ?auto_12584 ?auto_12585 ) ( AVAILABLE ?auto_12584 ) ( SURFACE-AT ?auto_12576 ?auto_12585 ) ( ON ?auto_12576 ?auto_12595 ) ( CLEAR ?auto_12576 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12595 ) ) ( not ( = ?auto_12576 ?auto_12595 ) ) ( not ( = ?auto_12581 ?auto_12584 ) ) ( IS-CRATE ?auto_12575 ) ( not ( = ?auto_12586 ?auto_12583 ) ) ( HOIST-AT ?auto_12587 ?auto_12586 ) ( AVAILABLE ?auto_12587 ) ( SURFACE-AT ?auto_12575 ?auto_12586 ) ( ON ?auto_12575 ?auto_12589 ) ( CLEAR ?auto_12575 ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( not ( = ?auto_12574 ?auto_12589 ) ) ( not ( = ?auto_12575 ?auto_12589 ) ) ( not ( = ?auto_12581 ?auto_12587 ) ) ( IS-CRATE ?auto_12574 ) ( not ( = ?auto_12593 ?auto_12583 ) ) ( HOIST-AT ?auto_12596 ?auto_12593 ) ( AVAILABLE ?auto_12596 ) ( SURFACE-AT ?auto_12574 ?auto_12593 ) ( ON ?auto_12574 ?auto_12588 ) ( CLEAR ?auto_12574 ) ( not ( = ?auto_12573 ?auto_12574 ) ) ( not ( = ?auto_12573 ?auto_12588 ) ) ( not ( = ?auto_12574 ?auto_12588 ) ) ( not ( = ?auto_12581 ?auto_12596 ) ) ( IS-CRATE ?auto_12573 ) ( not ( = ?auto_12591 ?auto_12583 ) ) ( HOIST-AT ?auto_12594 ?auto_12591 ) ( AVAILABLE ?auto_12594 ) ( SURFACE-AT ?auto_12573 ?auto_12591 ) ( ON ?auto_12573 ?auto_12590 ) ( CLEAR ?auto_12573 ) ( not ( = ?auto_12572 ?auto_12573 ) ) ( not ( = ?auto_12572 ?auto_12590 ) ) ( not ( = ?auto_12573 ?auto_12590 ) ) ( not ( = ?auto_12581 ?auto_12594 ) ) ( SURFACE-AT ?auto_12571 ?auto_12583 ) ( CLEAR ?auto_12571 ) ( IS-CRATE ?auto_12572 ) ( AVAILABLE ?auto_12581 ) ( not ( = ?auto_12592 ?auto_12583 ) ) ( HOIST-AT ?auto_12597 ?auto_12592 ) ( AVAILABLE ?auto_12597 ) ( SURFACE-AT ?auto_12572 ?auto_12592 ) ( ON ?auto_12572 ?auto_12598 ) ( CLEAR ?auto_12572 ) ( TRUCK-AT ?auto_12578 ?auto_12583 ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12598 ) ) ( not ( = ?auto_12572 ?auto_12598 ) ) ( not ( = ?auto_12581 ?auto_12597 ) ) ( not ( = ?auto_12571 ?auto_12573 ) ) ( not ( = ?auto_12571 ?auto_12590 ) ) ( not ( = ?auto_12573 ?auto_12598 ) ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( not ( = ?auto_12594 ?auto_12597 ) ) ( not ( = ?auto_12590 ?auto_12598 ) ) ( not ( = ?auto_12571 ?auto_12574 ) ) ( not ( = ?auto_12571 ?auto_12588 ) ) ( not ( = ?auto_12572 ?auto_12574 ) ) ( not ( = ?auto_12572 ?auto_12588 ) ) ( not ( = ?auto_12574 ?auto_12590 ) ) ( not ( = ?auto_12574 ?auto_12598 ) ) ( not ( = ?auto_12593 ?auto_12591 ) ) ( not ( = ?auto_12593 ?auto_12592 ) ) ( not ( = ?auto_12596 ?auto_12594 ) ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12588 ?auto_12590 ) ) ( not ( = ?auto_12588 ?auto_12598 ) ) ( not ( = ?auto_12571 ?auto_12575 ) ) ( not ( = ?auto_12571 ?auto_12589 ) ) ( not ( = ?auto_12572 ?auto_12575 ) ) ( not ( = ?auto_12572 ?auto_12589 ) ) ( not ( = ?auto_12573 ?auto_12575 ) ) ( not ( = ?auto_12573 ?auto_12589 ) ) ( not ( = ?auto_12575 ?auto_12588 ) ) ( not ( = ?auto_12575 ?auto_12590 ) ) ( not ( = ?auto_12575 ?auto_12598 ) ) ( not ( = ?auto_12586 ?auto_12593 ) ) ( not ( = ?auto_12586 ?auto_12591 ) ) ( not ( = ?auto_12586 ?auto_12592 ) ) ( not ( = ?auto_12587 ?auto_12596 ) ) ( not ( = ?auto_12587 ?auto_12594 ) ) ( not ( = ?auto_12587 ?auto_12597 ) ) ( not ( = ?auto_12589 ?auto_12588 ) ) ( not ( = ?auto_12589 ?auto_12590 ) ) ( not ( = ?auto_12589 ?auto_12598 ) ) ( not ( = ?auto_12571 ?auto_12576 ) ) ( not ( = ?auto_12571 ?auto_12595 ) ) ( not ( = ?auto_12572 ?auto_12576 ) ) ( not ( = ?auto_12572 ?auto_12595 ) ) ( not ( = ?auto_12573 ?auto_12576 ) ) ( not ( = ?auto_12573 ?auto_12595 ) ) ( not ( = ?auto_12574 ?auto_12576 ) ) ( not ( = ?auto_12574 ?auto_12595 ) ) ( not ( = ?auto_12576 ?auto_12589 ) ) ( not ( = ?auto_12576 ?auto_12588 ) ) ( not ( = ?auto_12576 ?auto_12590 ) ) ( not ( = ?auto_12576 ?auto_12598 ) ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( not ( = ?auto_12585 ?auto_12593 ) ) ( not ( = ?auto_12585 ?auto_12591 ) ) ( not ( = ?auto_12585 ?auto_12592 ) ) ( not ( = ?auto_12584 ?auto_12587 ) ) ( not ( = ?auto_12584 ?auto_12596 ) ) ( not ( = ?auto_12584 ?auto_12594 ) ) ( not ( = ?auto_12584 ?auto_12597 ) ) ( not ( = ?auto_12595 ?auto_12589 ) ) ( not ( = ?auto_12595 ?auto_12588 ) ) ( not ( = ?auto_12595 ?auto_12590 ) ) ( not ( = ?auto_12595 ?auto_12598 ) ) ( not ( = ?auto_12571 ?auto_12577 ) ) ( not ( = ?auto_12571 ?auto_12582 ) ) ( not ( = ?auto_12572 ?auto_12577 ) ) ( not ( = ?auto_12572 ?auto_12582 ) ) ( not ( = ?auto_12573 ?auto_12577 ) ) ( not ( = ?auto_12573 ?auto_12582 ) ) ( not ( = ?auto_12574 ?auto_12577 ) ) ( not ( = ?auto_12574 ?auto_12582 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12575 ?auto_12582 ) ) ( not ( = ?auto_12577 ?auto_12595 ) ) ( not ( = ?auto_12577 ?auto_12589 ) ) ( not ( = ?auto_12577 ?auto_12588 ) ) ( not ( = ?auto_12577 ?auto_12590 ) ) ( not ( = ?auto_12577 ?auto_12598 ) ) ( not ( = ?auto_12580 ?auto_12585 ) ) ( not ( = ?auto_12580 ?auto_12586 ) ) ( not ( = ?auto_12580 ?auto_12593 ) ) ( not ( = ?auto_12580 ?auto_12591 ) ) ( not ( = ?auto_12580 ?auto_12592 ) ) ( not ( = ?auto_12579 ?auto_12584 ) ) ( not ( = ?auto_12579 ?auto_12587 ) ) ( not ( = ?auto_12579 ?auto_12596 ) ) ( not ( = ?auto_12579 ?auto_12594 ) ) ( not ( = ?auto_12579 ?auto_12597 ) ) ( not ( = ?auto_12582 ?auto_12595 ) ) ( not ( = ?auto_12582 ?auto_12589 ) ) ( not ( = ?auto_12582 ?auto_12588 ) ) ( not ( = ?auto_12582 ?auto_12590 ) ) ( not ( = ?auto_12582 ?auto_12598 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12571 ?auto_12572 ?auto_12573 ?auto_12574 ?auto_12575 ?auto_12576 )
      ( MAKE-1CRATE ?auto_12576 ?auto_12577 )
      ( MAKE-6CRATE-VERIFY ?auto_12571 ?auto_12572 ?auto_12573 ?auto_12574 ?auto_12575 ?auto_12576 ?auto_12577 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12617 - SURFACE
      ?auto_12618 - SURFACE
      ?auto_12619 - SURFACE
      ?auto_12620 - SURFACE
      ?auto_12621 - SURFACE
      ?auto_12622 - SURFACE
      ?auto_12623 - SURFACE
      ?auto_12624 - SURFACE
    )
    :vars
    (
      ?auto_12626 - HOIST
      ?auto_12625 - PLACE
      ?auto_12627 - PLACE
      ?auto_12629 - HOIST
      ?auto_12628 - SURFACE
      ?auto_12643 - PLACE
      ?auto_12636 - HOIST
      ?auto_12644 - SURFACE
      ?auto_12646 - PLACE
      ?auto_12640 - HOIST
      ?auto_12635 - SURFACE
      ?auto_12647 - PLACE
      ?auto_12645 - HOIST
      ?auto_12638 - SURFACE
      ?auto_12631 - PLACE
      ?auto_12632 - HOIST
      ?auto_12639 - SURFACE
      ?auto_12634 - PLACE
      ?auto_12642 - HOIST
      ?auto_12637 - SURFACE
      ?auto_12641 - PLACE
      ?auto_12633 - HOIST
      ?auto_12648 - SURFACE
      ?auto_12630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12626 ?auto_12625 ) ( IS-CRATE ?auto_12624 ) ( not ( = ?auto_12627 ?auto_12625 ) ) ( HOIST-AT ?auto_12629 ?auto_12627 ) ( AVAILABLE ?auto_12629 ) ( SURFACE-AT ?auto_12624 ?auto_12627 ) ( ON ?auto_12624 ?auto_12628 ) ( CLEAR ?auto_12624 ) ( not ( = ?auto_12623 ?auto_12624 ) ) ( not ( = ?auto_12623 ?auto_12628 ) ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12629 ) ) ( IS-CRATE ?auto_12623 ) ( not ( = ?auto_12643 ?auto_12625 ) ) ( HOIST-AT ?auto_12636 ?auto_12643 ) ( AVAILABLE ?auto_12636 ) ( SURFACE-AT ?auto_12623 ?auto_12643 ) ( ON ?auto_12623 ?auto_12644 ) ( CLEAR ?auto_12623 ) ( not ( = ?auto_12622 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12644 ) ) ( not ( = ?auto_12623 ?auto_12644 ) ) ( not ( = ?auto_12626 ?auto_12636 ) ) ( IS-CRATE ?auto_12622 ) ( not ( = ?auto_12646 ?auto_12625 ) ) ( HOIST-AT ?auto_12640 ?auto_12646 ) ( AVAILABLE ?auto_12640 ) ( SURFACE-AT ?auto_12622 ?auto_12646 ) ( ON ?auto_12622 ?auto_12635 ) ( CLEAR ?auto_12622 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( not ( = ?auto_12621 ?auto_12635 ) ) ( not ( = ?auto_12622 ?auto_12635 ) ) ( not ( = ?auto_12626 ?auto_12640 ) ) ( IS-CRATE ?auto_12621 ) ( not ( = ?auto_12647 ?auto_12625 ) ) ( HOIST-AT ?auto_12645 ?auto_12647 ) ( AVAILABLE ?auto_12645 ) ( SURFACE-AT ?auto_12621 ?auto_12647 ) ( ON ?auto_12621 ?auto_12638 ) ( CLEAR ?auto_12621 ) ( not ( = ?auto_12620 ?auto_12621 ) ) ( not ( = ?auto_12620 ?auto_12638 ) ) ( not ( = ?auto_12621 ?auto_12638 ) ) ( not ( = ?auto_12626 ?auto_12645 ) ) ( IS-CRATE ?auto_12620 ) ( not ( = ?auto_12631 ?auto_12625 ) ) ( HOIST-AT ?auto_12632 ?auto_12631 ) ( AVAILABLE ?auto_12632 ) ( SURFACE-AT ?auto_12620 ?auto_12631 ) ( ON ?auto_12620 ?auto_12639 ) ( CLEAR ?auto_12620 ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12619 ?auto_12639 ) ) ( not ( = ?auto_12620 ?auto_12639 ) ) ( not ( = ?auto_12626 ?auto_12632 ) ) ( IS-CRATE ?auto_12619 ) ( not ( = ?auto_12634 ?auto_12625 ) ) ( HOIST-AT ?auto_12642 ?auto_12634 ) ( AVAILABLE ?auto_12642 ) ( SURFACE-AT ?auto_12619 ?auto_12634 ) ( ON ?auto_12619 ?auto_12637 ) ( CLEAR ?auto_12619 ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12637 ) ) ( not ( = ?auto_12619 ?auto_12637 ) ) ( not ( = ?auto_12626 ?auto_12642 ) ) ( SURFACE-AT ?auto_12617 ?auto_12625 ) ( CLEAR ?auto_12617 ) ( IS-CRATE ?auto_12618 ) ( AVAILABLE ?auto_12626 ) ( not ( = ?auto_12641 ?auto_12625 ) ) ( HOIST-AT ?auto_12633 ?auto_12641 ) ( AVAILABLE ?auto_12633 ) ( SURFACE-AT ?auto_12618 ?auto_12641 ) ( ON ?auto_12618 ?auto_12648 ) ( CLEAR ?auto_12618 ) ( TRUCK-AT ?auto_12630 ?auto_12625 ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12648 ) ) ( not ( = ?auto_12618 ?auto_12648 ) ) ( not ( = ?auto_12626 ?auto_12633 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12637 ) ) ( not ( = ?auto_12619 ?auto_12648 ) ) ( not ( = ?auto_12634 ?auto_12641 ) ) ( not ( = ?auto_12642 ?auto_12633 ) ) ( not ( = ?auto_12637 ?auto_12648 ) ) ( not ( = ?auto_12617 ?auto_12620 ) ) ( not ( = ?auto_12617 ?auto_12639 ) ) ( not ( = ?auto_12618 ?auto_12620 ) ) ( not ( = ?auto_12618 ?auto_12639 ) ) ( not ( = ?auto_12620 ?auto_12637 ) ) ( not ( = ?auto_12620 ?auto_12648 ) ) ( not ( = ?auto_12631 ?auto_12634 ) ) ( not ( = ?auto_12631 ?auto_12641 ) ) ( not ( = ?auto_12632 ?auto_12642 ) ) ( not ( = ?auto_12632 ?auto_12633 ) ) ( not ( = ?auto_12639 ?auto_12637 ) ) ( not ( = ?auto_12639 ?auto_12648 ) ) ( not ( = ?auto_12617 ?auto_12621 ) ) ( not ( = ?auto_12617 ?auto_12638 ) ) ( not ( = ?auto_12618 ?auto_12621 ) ) ( not ( = ?auto_12618 ?auto_12638 ) ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( not ( = ?auto_12619 ?auto_12638 ) ) ( not ( = ?auto_12621 ?auto_12639 ) ) ( not ( = ?auto_12621 ?auto_12637 ) ) ( not ( = ?auto_12621 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12631 ) ) ( not ( = ?auto_12647 ?auto_12634 ) ) ( not ( = ?auto_12647 ?auto_12641 ) ) ( not ( = ?auto_12645 ?auto_12632 ) ) ( not ( = ?auto_12645 ?auto_12642 ) ) ( not ( = ?auto_12645 ?auto_12633 ) ) ( not ( = ?auto_12638 ?auto_12639 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( not ( = ?auto_12638 ?auto_12648 ) ) ( not ( = ?auto_12617 ?auto_12622 ) ) ( not ( = ?auto_12617 ?auto_12635 ) ) ( not ( = ?auto_12618 ?auto_12622 ) ) ( not ( = ?auto_12618 ?auto_12635 ) ) ( not ( = ?auto_12619 ?auto_12622 ) ) ( not ( = ?auto_12619 ?auto_12635 ) ) ( not ( = ?auto_12620 ?auto_12622 ) ) ( not ( = ?auto_12620 ?auto_12635 ) ) ( not ( = ?auto_12622 ?auto_12638 ) ) ( not ( = ?auto_12622 ?auto_12639 ) ) ( not ( = ?auto_12622 ?auto_12637 ) ) ( not ( = ?auto_12622 ?auto_12648 ) ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12631 ) ) ( not ( = ?auto_12646 ?auto_12634 ) ) ( not ( = ?auto_12646 ?auto_12641 ) ) ( not ( = ?auto_12640 ?auto_12645 ) ) ( not ( = ?auto_12640 ?auto_12632 ) ) ( not ( = ?auto_12640 ?auto_12642 ) ) ( not ( = ?auto_12640 ?auto_12633 ) ) ( not ( = ?auto_12635 ?auto_12638 ) ) ( not ( = ?auto_12635 ?auto_12639 ) ) ( not ( = ?auto_12635 ?auto_12637 ) ) ( not ( = ?auto_12635 ?auto_12648 ) ) ( not ( = ?auto_12617 ?auto_12623 ) ) ( not ( = ?auto_12617 ?auto_12644 ) ) ( not ( = ?auto_12618 ?auto_12623 ) ) ( not ( = ?auto_12618 ?auto_12644 ) ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( not ( = ?auto_12619 ?auto_12644 ) ) ( not ( = ?auto_12620 ?auto_12623 ) ) ( not ( = ?auto_12620 ?auto_12644 ) ) ( not ( = ?auto_12621 ?auto_12623 ) ) ( not ( = ?auto_12621 ?auto_12644 ) ) ( not ( = ?auto_12623 ?auto_12635 ) ) ( not ( = ?auto_12623 ?auto_12638 ) ) ( not ( = ?auto_12623 ?auto_12639 ) ) ( not ( = ?auto_12623 ?auto_12637 ) ) ( not ( = ?auto_12623 ?auto_12648 ) ) ( not ( = ?auto_12643 ?auto_12646 ) ) ( not ( = ?auto_12643 ?auto_12647 ) ) ( not ( = ?auto_12643 ?auto_12631 ) ) ( not ( = ?auto_12643 ?auto_12634 ) ) ( not ( = ?auto_12643 ?auto_12641 ) ) ( not ( = ?auto_12636 ?auto_12640 ) ) ( not ( = ?auto_12636 ?auto_12645 ) ) ( not ( = ?auto_12636 ?auto_12632 ) ) ( not ( = ?auto_12636 ?auto_12642 ) ) ( not ( = ?auto_12636 ?auto_12633 ) ) ( not ( = ?auto_12644 ?auto_12635 ) ) ( not ( = ?auto_12644 ?auto_12638 ) ) ( not ( = ?auto_12644 ?auto_12639 ) ) ( not ( = ?auto_12644 ?auto_12637 ) ) ( not ( = ?auto_12644 ?auto_12648 ) ) ( not ( = ?auto_12617 ?auto_12624 ) ) ( not ( = ?auto_12617 ?auto_12628 ) ) ( not ( = ?auto_12618 ?auto_12624 ) ) ( not ( = ?auto_12618 ?auto_12628 ) ) ( not ( = ?auto_12619 ?auto_12624 ) ) ( not ( = ?auto_12619 ?auto_12628 ) ) ( not ( = ?auto_12620 ?auto_12624 ) ) ( not ( = ?auto_12620 ?auto_12628 ) ) ( not ( = ?auto_12621 ?auto_12624 ) ) ( not ( = ?auto_12621 ?auto_12628 ) ) ( not ( = ?auto_12622 ?auto_12624 ) ) ( not ( = ?auto_12622 ?auto_12628 ) ) ( not ( = ?auto_12624 ?auto_12644 ) ) ( not ( = ?auto_12624 ?auto_12635 ) ) ( not ( = ?auto_12624 ?auto_12638 ) ) ( not ( = ?auto_12624 ?auto_12639 ) ) ( not ( = ?auto_12624 ?auto_12637 ) ) ( not ( = ?auto_12624 ?auto_12648 ) ) ( not ( = ?auto_12627 ?auto_12643 ) ) ( not ( = ?auto_12627 ?auto_12646 ) ) ( not ( = ?auto_12627 ?auto_12647 ) ) ( not ( = ?auto_12627 ?auto_12631 ) ) ( not ( = ?auto_12627 ?auto_12634 ) ) ( not ( = ?auto_12627 ?auto_12641 ) ) ( not ( = ?auto_12629 ?auto_12636 ) ) ( not ( = ?auto_12629 ?auto_12640 ) ) ( not ( = ?auto_12629 ?auto_12645 ) ) ( not ( = ?auto_12629 ?auto_12632 ) ) ( not ( = ?auto_12629 ?auto_12642 ) ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( not ( = ?auto_12628 ?auto_12644 ) ) ( not ( = ?auto_12628 ?auto_12635 ) ) ( not ( = ?auto_12628 ?auto_12638 ) ) ( not ( = ?auto_12628 ?auto_12639 ) ) ( not ( = ?auto_12628 ?auto_12637 ) ) ( not ( = ?auto_12628 ?auto_12648 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12620 ?auto_12621 ?auto_12622 ?auto_12623 )
      ( MAKE-1CRATE ?auto_12623 ?auto_12624 )
      ( MAKE-7CRATE-VERIFY ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12620 ?auto_12621 ?auto_12622 ?auto_12623 ?auto_12624 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12668 - SURFACE
      ?auto_12669 - SURFACE
      ?auto_12670 - SURFACE
      ?auto_12671 - SURFACE
      ?auto_12672 - SURFACE
      ?auto_12673 - SURFACE
      ?auto_12674 - SURFACE
      ?auto_12675 - SURFACE
      ?auto_12676 - SURFACE
    )
    :vars
    (
      ?auto_12678 - HOIST
      ?auto_12681 - PLACE
      ?auto_12680 - PLACE
      ?auto_12682 - HOIST
      ?auto_12677 - SURFACE
      ?auto_12697 - PLACE
      ?auto_12698 - HOIST
      ?auto_12692 - SURFACE
      ?auto_12683 - PLACE
      ?auto_12687 - HOIST
      ?auto_12684 - SURFACE
      ?auto_12695 - PLACE
      ?auto_12699 - HOIST
      ?auto_12688 - SURFACE
      ?auto_12693 - PLACE
      ?auto_12696 - HOIST
      ?auto_12685 - SURFACE
      ?auto_12694 - PLACE
      ?auto_12689 - HOIST
      ?auto_12700 - SURFACE
      ?auto_12686 - SURFACE
      ?auto_12701 - PLACE
      ?auto_12690 - HOIST
      ?auto_12691 - SURFACE
      ?auto_12679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12678 ?auto_12681 ) ( IS-CRATE ?auto_12676 ) ( not ( = ?auto_12680 ?auto_12681 ) ) ( HOIST-AT ?auto_12682 ?auto_12680 ) ( SURFACE-AT ?auto_12676 ?auto_12680 ) ( ON ?auto_12676 ?auto_12677 ) ( CLEAR ?auto_12676 ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( not ( = ?auto_12675 ?auto_12677 ) ) ( not ( = ?auto_12676 ?auto_12677 ) ) ( not ( = ?auto_12678 ?auto_12682 ) ) ( IS-CRATE ?auto_12675 ) ( not ( = ?auto_12697 ?auto_12681 ) ) ( HOIST-AT ?auto_12698 ?auto_12697 ) ( AVAILABLE ?auto_12698 ) ( SURFACE-AT ?auto_12675 ?auto_12697 ) ( ON ?auto_12675 ?auto_12692 ) ( CLEAR ?auto_12675 ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12674 ?auto_12692 ) ) ( not ( = ?auto_12675 ?auto_12692 ) ) ( not ( = ?auto_12678 ?auto_12698 ) ) ( IS-CRATE ?auto_12674 ) ( not ( = ?auto_12683 ?auto_12681 ) ) ( HOIST-AT ?auto_12687 ?auto_12683 ) ( AVAILABLE ?auto_12687 ) ( SURFACE-AT ?auto_12674 ?auto_12683 ) ( ON ?auto_12674 ?auto_12684 ) ( CLEAR ?auto_12674 ) ( not ( = ?auto_12673 ?auto_12674 ) ) ( not ( = ?auto_12673 ?auto_12684 ) ) ( not ( = ?auto_12674 ?auto_12684 ) ) ( not ( = ?auto_12678 ?auto_12687 ) ) ( IS-CRATE ?auto_12673 ) ( not ( = ?auto_12695 ?auto_12681 ) ) ( HOIST-AT ?auto_12699 ?auto_12695 ) ( AVAILABLE ?auto_12699 ) ( SURFACE-AT ?auto_12673 ?auto_12695 ) ( ON ?auto_12673 ?auto_12688 ) ( CLEAR ?auto_12673 ) ( not ( = ?auto_12672 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12688 ) ) ( not ( = ?auto_12673 ?auto_12688 ) ) ( not ( = ?auto_12678 ?auto_12699 ) ) ( IS-CRATE ?auto_12672 ) ( not ( = ?auto_12693 ?auto_12681 ) ) ( HOIST-AT ?auto_12696 ?auto_12693 ) ( AVAILABLE ?auto_12696 ) ( SURFACE-AT ?auto_12672 ?auto_12693 ) ( ON ?auto_12672 ?auto_12685 ) ( CLEAR ?auto_12672 ) ( not ( = ?auto_12671 ?auto_12672 ) ) ( not ( = ?auto_12671 ?auto_12685 ) ) ( not ( = ?auto_12672 ?auto_12685 ) ) ( not ( = ?auto_12678 ?auto_12696 ) ) ( IS-CRATE ?auto_12671 ) ( not ( = ?auto_12694 ?auto_12681 ) ) ( HOIST-AT ?auto_12689 ?auto_12694 ) ( AVAILABLE ?auto_12689 ) ( SURFACE-AT ?auto_12671 ?auto_12694 ) ( ON ?auto_12671 ?auto_12700 ) ( CLEAR ?auto_12671 ) ( not ( = ?auto_12670 ?auto_12671 ) ) ( not ( = ?auto_12670 ?auto_12700 ) ) ( not ( = ?auto_12671 ?auto_12700 ) ) ( not ( = ?auto_12678 ?auto_12689 ) ) ( IS-CRATE ?auto_12670 ) ( AVAILABLE ?auto_12682 ) ( SURFACE-AT ?auto_12670 ?auto_12680 ) ( ON ?auto_12670 ?auto_12686 ) ( CLEAR ?auto_12670 ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( not ( = ?auto_12669 ?auto_12686 ) ) ( not ( = ?auto_12670 ?auto_12686 ) ) ( SURFACE-AT ?auto_12668 ?auto_12681 ) ( CLEAR ?auto_12668 ) ( IS-CRATE ?auto_12669 ) ( AVAILABLE ?auto_12678 ) ( not ( = ?auto_12701 ?auto_12681 ) ) ( HOIST-AT ?auto_12690 ?auto_12701 ) ( AVAILABLE ?auto_12690 ) ( SURFACE-AT ?auto_12669 ?auto_12701 ) ( ON ?auto_12669 ?auto_12691 ) ( CLEAR ?auto_12669 ) ( TRUCK-AT ?auto_12679 ?auto_12681 ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12668 ?auto_12691 ) ) ( not ( = ?auto_12669 ?auto_12691 ) ) ( not ( = ?auto_12678 ?auto_12690 ) ) ( not ( = ?auto_12668 ?auto_12670 ) ) ( not ( = ?auto_12668 ?auto_12686 ) ) ( not ( = ?auto_12670 ?auto_12691 ) ) ( not ( = ?auto_12680 ?auto_12701 ) ) ( not ( = ?auto_12682 ?auto_12690 ) ) ( not ( = ?auto_12686 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12671 ) ) ( not ( = ?auto_12668 ?auto_12700 ) ) ( not ( = ?auto_12669 ?auto_12671 ) ) ( not ( = ?auto_12669 ?auto_12700 ) ) ( not ( = ?auto_12671 ?auto_12686 ) ) ( not ( = ?auto_12671 ?auto_12691 ) ) ( not ( = ?auto_12694 ?auto_12680 ) ) ( not ( = ?auto_12694 ?auto_12701 ) ) ( not ( = ?auto_12689 ?auto_12682 ) ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( not ( = ?auto_12700 ?auto_12686 ) ) ( not ( = ?auto_12700 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12672 ) ) ( not ( = ?auto_12668 ?auto_12685 ) ) ( not ( = ?auto_12669 ?auto_12672 ) ) ( not ( = ?auto_12669 ?auto_12685 ) ) ( not ( = ?auto_12670 ?auto_12672 ) ) ( not ( = ?auto_12670 ?auto_12685 ) ) ( not ( = ?auto_12672 ?auto_12700 ) ) ( not ( = ?auto_12672 ?auto_12686 ) ) ( not ( = ?auto_12672 ?auto_12691 ) ) ( not ( = ?auto_12693 ?auto_12694 ) ) ( not ( = ?auto_12693 ?auto_12680 ) ) ( not ( = ?auto_12693 ?auto_12701 ) ) ( not ( = ?auto_12696 ?auto_12689 ) ) ( not ( = ?auto_12696 ?auto_12682 ) ) ( not ( = ?auto_12696 ?auto_12690 ) ) ( not ( = ?auto_12685 ?auto_12700 ) ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12673 ) ) ( not ( = ?auto_12668 ?auto_12688 ) ) ( not ( = ?auto_12669 ?auto_12673 ) ) ( not ( = ?auto_12669 ?auto_12688 ) ) ( not ( = ?auto_12670 ?auto_12673 ) ) ( not ( = ?auto_12670 ?auto_12688 ) ) ( not ( = ?auto_12671 ?auto_12673 ) ) ( not ( = ?auto_12671 ?auto_12688 ) ) ( not ( = ?auto_12673 ?auto_12685 ) ) ( not ( = ?auto_12673 ?auto_12700 ) ) ( not ( = ?auto_12673 ?auto_12686 ) ) ( not ( = ?auto_12673 ?auto_12691 ) ) ( not ( = ?auto_12695 ?auto_12693 ) ) ( not ( = ?auto_12695 ?auto_12694 ) ) ( not ( = ?auto_12695 ?auto_12680 ) ) ( not ( = ?auto_12695 ?auto_12701 ) ) ( not ( = ?auto_12699 ?auto_12696 ) ) ( not ( = ?auto_12699 ?auto_12689 ) ) ( not ( = ?auto_12699 ?auto_12682 ) ) ( not ( = ?auto_12699 ?auto_12690 ) ) ( not ( = ?auto_12688 ?auto_12685 ) ) ( not ( = ?auto_12688 ?auto_12700 ) ) ( not ( = ?auto_12688 ?auto_12686 ) ) ( not ( = ?auto_12688 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12674 ) ) ( not ( = ?auto_12668 ?auto_12684 ) ) ( not ( = ?auto_12669 ?auto_12674 ) ) ( not ( = ?auto_12669 ?auto_12684 ) ) ( not ( = ?auto_12670 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12684 ) ) ( not ( = ?auto_12671 ?auto_12674 ) ) ( not ( = ?auto_12671 ?auto_12684 ) ) ( not ( = ?auto_12672 ?auto_12674 ) ) ( not ( = ?auto_12672 ?auto_12684 ) ) ( not ( = ?auto_12674 ?auto_12688 ) ) ( not ( = ?auto_12674 ?auto_12685 ) ) ( not ( = ?auto_12674 ?auto_12700 ) ) ( not ( = ?auto_12674 ?auto_12686 ) ) ( not ( = ?auto_12674 ?auto_12691 ) ) ( not ( = ?auto_12683 ?auto_12695 ) ) ( not ( = ?auto_12683 ?auto_12693 ) ) ( not ( = ?auto_12683 ?auto_12694 ) ) ( not ( = ?auto_12683 ?auto_12680 ) ) ( not ( = ?auto_12683 ?auto_12701 ) ) ( not ( = ?auto_12687 ?auto_12699 ) ) ( not ( = ?auto_12687 ?auto_12696 ) ) ( not ( = ?auto_12687 ?auto_12689 ) ) ( not ( = ?auto_12687 ?auto_12682 ) ) ( not ( = ?auto_12687 ?auto_12690 ) ) ( not ( = ?auto_12684 ?auto_12688 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12700 ) ) ( not ( = ?auto_12684 ?auto_12686 ) ) ( not ( = ?auto_12684 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12675 ) ) ( not ( = ?auto_12668 ?auto_12692 ) ) ( not ( = ?auto_12669 ?auto_12675 ) ) ( not ( = ?auto_12669 ?auto_12692 ) ) ( not ( = ?auto_12670 ?auto_12675 ) ) ( not ( = ?auto_12670 ?auto_12692 ) ) ( not ( = ?auto_12671 ?auto_12675 ) ) ( not ( = ?auto_12671 ?auto_12692 ) ) ( not ( = ?auto_12672 ?auto_12675 ) ) ( not ( = ?auto_12672 ?auto_12692 ) ) ( not ( = ?auto_12673 ?auto_12675 ) ) ( not ( = ?auto_12673 ?auto_12692 ) ) ( not ( = ?auto_12675 ?auto_12684 ) ) ( not ( = ?auto_12675 ?auto_12688 ) ) ( not ( = ?auto_12675 ?auto_12685 ) ) ( not ( = ?auto_12675 ?auto_12700 ) ) ( not ( = ?auto_12675 ?auto_12686 ) ) ( not ( = ?auto_12675 ?auto_12691 ) ) ( not ( = ?auto_12697 ?auto_12683 ) ) ( not ( = ?auto_12697 ?auto_12695 ) ) ( not ( = ?auto_12697 ?auto_12693 ) ) ( not ( = ?auto_12697 ?auto_12694 ) ) ( not ( = ?auto_12697 ?auto_12680 ) ) ( not ( = ?auto_12697 ?auto_12701 ) ) ( not ( = ?auto_12698 ?auto_12687 ) ) ( not ( = ?auto_12698 ?auto_12699 ) ) ( not ( = ?auto_12698 ?auto_12696 ) ) ( not ( = ?auto_12698 ?auto_12689 ) ) ( not ( = ?auto_12698 ?auto_12682 ) ) ( not ( = ?auto_12698 ?auto_12690 ) ) ( not ( = ?auto_12692 ?auto_12684 ) ) ( not ( = ?auto_12692 ?auto_12688 ) ) ( not ( = ?auto_12692 ?auto_12685 ) ) ( not ( = ?auto_12692 ?auto_12700 ) ) ( not ( = ?auto_12692 ?auto_12686 ) ) ( not ( = ?auto_12692 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12676 ) ) ( not ( = ?auto_12668 ?auto_12677 ) ) ( not ( = ?auto_12669 ?auto_12676 ) ) ( not ( = ?auto_12669 ?auto_12677 ) ) ( not ( = ?auto_12670 ?auto_12676 ) ) ( not ( = ?auto_12670 ?auto_12677 ) ) ( not ( = ?auto_12671 ?auto_12676 ) ) ( not ( = ?auto_12671 ?auto_12677 ) ) ( not ( = ?auto_12672 ?auto_12676 ) ) ( not ( = ?auto_12672 ?auto_12677 ) ) ( not ( = ?auto_12673 ?auto_12676 ) ) ( not ( = ?auto_12673 ?auto_12677 ) ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12676 ?auto_12692 ) ) ( not ( = ?auto_12676 ?auto_12684 ) ) ( not ( = ?auto_12676 ?auto_12688 ) ) ( not ( = ?auto_12676 ?auto_12685 ) ) ( not ( = ?auto_12676 ?auto_12700 ) ) ( not ( = ?auto_12676 ?auto_12686 ) ) ( not ( = ?auto_12676 ?auto_12691 ) ) ( not ( = ?auto_12677 ?auto_12692 ) ) ( not ( = ?auto_12677 ?auto_12684 ) ) ( not ( = ?auto_12677 ?auto_12688 ) ) ( not ( = ?auto_12677 ?auto_12685 ) ) ( not ( = ?auto_12677 ?auto_12700 ) ) ( not ( = ?auto_12677 ?auto_12686 ) ) ( not ( = ?auto_12677 ?auto_12691 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12671 ?auto_12672 ?auto_12673 ?auto_12674 ?auto_12675 )
      ( MAKE-1CRATE ?auto_12675 ?auto_12676 )
      ( MAKE-8CRATE-VERIFY ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12671 ?auto_12672 ?auto_12673 ?auto_12674 ?auto_12675 ?auto_12676 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12722 - SURFACE
      ?auto_12723 - SURFACE
      ?auto_12724 - SURFACE
      ?auto_12725 - SURFACE
      ?auto_12726 - SURFACE
      ?auto_12727 - SURFACE
      ?auto_12728 - SURFACE
      ?auto_12729 - SURFACE
      ?auto_12730 - SURFACE
      ?auto_12731 - SURFACE
    )
    :vars
    (
      ?auto_12736 - HOIST
      ?auto_12732 - PLACE
      ?auto_12737 - PLACE
      ?auto_12734 - HOIST
      ?auto_12733 - SURFACE
      ?auto_12747 - PLACE
      ?auto_12739 - HOIST
      ?auto_12749 - SURFACE
      ?auto_12743 - PLACE
      ?auto_12751 - HOIST
      ?auto_12752 - SURFACE
      ?auto_12746 - PLACE
      ?auto_12759 - HOIST
      ?auto_12738 - SURFACE
      ?auto_12755 - PLACE
      ?auto_12744 - HOIST
      ?auto_12758 - SURFACE
      ?auto_12754 - PLACE
      ?auto_12745 - HOIST
      ?auto_12742 - SURFACE
      ?auto_12756 - PLACE
      ?auto_12757 - HOIST
      ?auto_12748 - SURFACE
      ?auto_12741 - SURFACE
      ?auto_12750 - PLACE
      ?auto_12740 - HOIST
      ?auto_12753 - SURFACE
      ?auto_12735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12736 ?auto_12732 ) ( IS-CRATE ?auto_12731 ) ( not ( = ?auto_12737 ?auto_12732 ) ) ( HOIST-AT ?auto_12734 ?auto_12737 ) ( AVAILABLE ?auto_12734 ) ( SURFACE-AT ?auto_12731 ?auto_12737 ) ( ON ?auto_12731 ?auto_12733 ) ( CLEAR ?auto_12731 ) ( not ( = ?auto_12730 ?auto_12731 ) ) ( not ( = ?auto_12730 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12733 ) ) ( not ( = ?auto_12736 ?auto_12734 ) ) ( IS-CRATE ?auto_12730 ) ( not ( = ?auto_12747 ?auto_12732 ) ) ( HOIST-AT ?auto_12739 ?auto_12747 ) ( SURFACE-AT ?auto_12730 ?auto_12747 ) ( ON ?auto_12730 ?auto_12749 ) ( CLEAR ?auto_12730 ) ( not ( = ?auto_12729 ?auto_12730 ) ) ( not ( = ?auto_12729 ?auto_12749 ) ) ( not ( = ?auto_12730 ?auto_12749 ) ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( IS-CRATE ?auto_12729 ) ( not ( = ?auto_12743 ?auto_12732 ) ) ( HOIST-AT ?auto_12751 ?auto_12743 ) ( AVAILABLE ?auto_12751 ) ( SURFACE-AT ?auto_12729 ?auto_12743 ) ( ON ?auto_12729 ?auto_12752 ) ( CLEAR ?auto_12729 ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12752 ) ) ( not ( = ?auto_12729 ?auto_12752 ) ) ( not ( = ?auto_12736 ?auto_12751 ) ) ( IS-CRATE ?auto_12728 ) ( not ( = ?auto_12746 ?auto_12732 ) ) ( HOIST-AT ?auto_12759 ?auto_12746 ) ( AVAILABLE ?auto_12759 ) ( SURFACE-AT ?auto_12728 ?auto_12746 ) ( ON ?auto_12728 ?auto_12738 ) ( CLEAR ?auto_12728 ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( not ( = ?auto_12727 ?auto_12738 ) ) ( not ( = ?auto_12728 ?auto_12738 ) ) ( not ( = ?auto_12736 ?auto_12759 ) ) ( IS-CRATE ?auto_12727 ) ( not ( = ?auto_12755 ?auto_12732 ) ) ( HOIST-AT ?auto_12744 ?auto_12755 ) ( AVAILABLE ?auto_12744 ) ( SURFACE-AT ?auto_12727 ?auto_12755 ) ( ON ?auto_12727 ?auto_12758 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12758 ) ) ( not ( = ?auto_12727 ?auto_12758 ) ) ( not ( = ?auto_12736 ?auto_12744 ) ) ( IS-CRATE ?auto_12726 ) ( not ( = ?auto_12754 ?auto_12732 ) ) ( HOIST-AT ?auto_12745 ?auto_12754 ) ( AVAILABLE ?auto_12745 ) ( SURFACE-AT ?auto_12726 ?auto_12754 ) ( ON ?auto_12726 ?auto_12742 ) ( CLEAR ?auto_12726 ) ( not ( = ?auto_12725 ?auto_12726 ) ) ( not ( = ?auto_12725 ?auto_12742 ) ) ( not ( = ?auto_12726 ?auto_12742 ) ) ( not ( = ?auto_12736 ?auto_12745 ) ) ( IS-CRATE ?auto_12725 ) ( not ( = ?auto_12756 ?auto_12732 ) ) ( HOIST-AT ?auto_12757 ?auto_12756 ) ( AVAILABLE ?auto_12757 ) ( SURFACE-AT ?auto_12725 ?auto_12756 ) ( ON ?auto_12725 ?auto_12748 ) ( CLEAR ?auto_12725 ) ( not ( = ?auto_12724 ?auto_12725 ) ) ( not ( = ?auto_12724 ?auto_12748 ) ) ( not ( = ?auto_12725 ?auto_12748 ) ) ( not ( = ?auto_12736 ?auto_12757 ) ) ( IS-CRATE ?auto_12724 ) ( AVAILABLE ?auto_12739 ) ( SURFACE-AT ?auto_12724 ?auto_12747 ) ( ON ?auto_12724 ?auto_12741 ) ( CLEAR ?auto_12724 ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12741 ) ) ( not ( = ?auto_12724 ?auto_12741 ) ) ( SURFACE-AT ?auto_12722 ?auto_12732 ) ( CLEAR ?auto_12722 ) ( IS-CRATE ?auto_12723 ) ( AVAILABLE ?auto_12736 ) ( not ( = ?auto_12750 ?auto_12732 ) ) ( HOIST-AT ?auto_12740 ?auto_12750 ) ( AVAILABLE ?auto_12740 ) ( SURFACE-AT ?auto_12723 ?auto_12750 ) ( ON ?auto_12723 ?auto_12753 ) ( CLEAR ?auto_12723 ) ( TRUCK-AT ?auto_12735 ?auto_12732 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12753 ) ) ( not ( = ?auto_12723 ?auto_12753 ) ) ( not ( = ?auto_12736 ?auto_12740 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12741 ) ) ( not ( = ?auto_12724 ?auto_12753 ) ) ( not ( = ?auto_12747 ?auto_12750 ) ) ( not ( = ?auto_12739 ?auto_12740 ) ) ( not ( = ?auto_12741 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12748 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12748 ) ) ( not ( = ?auto_12725 ?auto_12741 ) ) ( not ( = ?auto_12725 ?auto_12753 ) ) ( not ( = ?auto_12756 ?auto_12747 ) ) ( not ( = ?auto_12756 ?auto_12750 ) ) ( not ( = ?auto_12757 ?auto_12739 ) ) ( not ( = ?auto_12757 ?auto_12740 ) ) ( not ( = ?auto_12748 ?auto_12741 ) ) ( not ( = ?auto_12748 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12726 ) ) ( not ( = ?auto_12722 ?auto_12742 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12742 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12742 ) ) ( not ( = ?auto_12726 ?auto_12748 ) ) ( not ( = ?auto_12726 ?auto_12741 ) ) ( not ( = ?auto_12726 ?auto_12753 ) ) ( not ( = ?auto_12754 ?auto_12756 ) ) ( not ( = ?auto_12754 ?auto_12747 ) ) ( not ( = ?auto_12754 ?auto_12750 ) ) ( not ( = ?auto_12745 ?auto_12757 ) ) ( not ( = ?auto_12745 ?auto_12739 ) ) ( not ( = ?auto_12745 ?auto_12740 ) ) ( not ( = ?auto_12742 ?auto_12748 ) ) ( not ( = ?auto_12742 ?auto_12741 ) ) ( not ( = ?auto_12742 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12727 ) ) ( not ( = ?auto_12722 ?auto_12758 ) ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12758 ) ) ( not ( = ?auto_12724 ?auto_12727 ) ) ( not ( = ?auto_12724 ?auto_12758 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12725 ?auto_12758 ) ) ( not ( = ?auto_12727 ?auto_12742 ) ) ( not ( = ?auto_12727 ?auto_12748 ) ) ( not ( = ?auto_12727 ?auto_12741 ) ) ( not ( = ?auto_12727 ?auto_12753 ) ) ( not ( = ?auto_12755 ?auto_12754 ) ) ( not ( = ?auto_12755 ?auto_12756 ) ) ( not ( = ?auto_12755 ?auto_12747 ) ) ( not ( = ?auto_12755 ?auto_12750 ) ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12744 ?auto_12757 ) ) ( not ( = ?auto_12744 ?auto_12739 ) ) ( not ( = ?auto_12744 ?auto_12740 ) ) ( not ( = ?auto_12758 ?auto_12742 ) ) ( not ( = ?auto_12758 ?auto_12748 ) ) ( not ( = ?auto_12758 ?auto_12741 ) ) ( not ( = ?auto_12758 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( not ( = ?auto_12722 ?auto_12738 ) ) ( not ( = ?auto_12723 ?auto_12728 ) ) ( not ( = ?auto_12723 ?auto_12738 ) ) ( not ( = ?auto_12724 ?auto_12728 ) ) ( not ( = ?auto_12724 ?auto_12738 ) ) ( not ( = ?auto_12725 ?auto_12728 ) ) ( not ( = ?auto_12725 ?auto_12738 ) ) ( not ( = ?auto_12726 ?auto_12728 ) ) ( not ( = ?auto_12726 ?auto_12738 ) ) ( not ( = ?auto_12728 ?auto_12758 ) ) ( not ( = ?auto_12728 ?auto_12742 ) ) ( not ( = ?auto_12728 ?auto_12748 ) ) ( not ( = ?auto_12728 ?auto_12741 ) ) ( not ( = ?auto_12728 ?auto_12753 ) ) ( not ( = ?auto_12746 ?auto_12755 ) ) ( not ( = ?auto_12746 ?auto_12754 ) ) ( not ( = ?auto_12746 ?auto_12756 ) ) ( not ( = ?auto_12746 ?auto_12747 ) ) ( not ( = ?auto_12746 ?auto_12750 ) ) ( not ( = ?auto_12759 ?auto_12744 ) ) ( not ( = ?auto_12759 ?auto_12745 ) ) ( not ( = ?auto_12759 ?auto_12757 ) ) ( not ( = ?auto_12759 ?auto_12739 ) ) ( not ( = ?auto_12759 ?auto_12740 ) ) ( not ( = ?auto_12738 ?auto_12758 ) ) ( not ( = ?auto_12738 ?auto_12742 ) ) ( not ( = ?auto_12738 ?auto_12748 ) ) ( not ( = ?auto_12738 ?auto_12741 ) ) ( not ( = ?auto_12738 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12729 ) ) ( not ( = ?auto_12722 ?auto_12752 ) ) ( not ( = ?auto_12723 ?auto_12729 ) ) ( not ( = ?auto_12723 ?auto_12752 ) ) ( not ( = ?auto_12724 ?auto_12729 ) ) ( not ( = ?auto_12724 ?auto_12752 ) ) ( not ( = ?auto_12725 ?auto_12729 ) ) ( not ( = ?auto_12725 ?auto_12752 ) ) ( not ( = ?auto_12726 ?auto_12729 ) ) ( not ( = ?auto_12726 ?auto_12752 ) ) ( not ( = ?auto_12727 ?auto_12729 ) ) ( not ( = ?auto_12727 ?auto_12752 ) ) ( not ( = ?auto_12729 ?auto_12738 ) ) ( not ( = ?auto_12729 ?auto_12758 ) ) ( not ( = ?auto_12729 ?auto_12742 ) ) ( not ( = ?auto_12729 ?auto_12748 ) ) ( not ( = ?auto_12729 ?auto_12741 ) ) ( not ( = ?auto_12729 ?auto_12753 ) ) ( not ( = ?auto_12743 ?auto_12746 ) ) ( not ( = ?auto_12743 ?auto_12755 ) ) ( not ( = ?auto_12743 ?auto_12754 ) ) ( not ( = ?auto_12743 ?auto_12756 ) ) ( not ( = ?auto_12743 ?auto_12747 ) ) ( not ( = ?auto_12743 ?auto_12750 ) ) ( not ( = ?auto_12751 ?auto_12759 ) ) ( not ( = ?auto_12751 ?auto_12744 ) ) ( not ( = ?auto_12751 ?auto_12745 ) ) ( not ( = ?auto_12751 ?auto_12757 ) ) ( not ( = ?auto_12751 ?auto_12739 ) ) ( not ( = ?auto_12751 ?auto_12740 ) ) ( not ( = ?auto_12752 ?auto_12738 ) ) ( not ( = ?auto_12752 ?auto_12758 ) ) ( not ( = ?auto_12752 ?auto_12742 ) ) ( not ( = ?auto_12752 ?auto_12748 ) ) ( not ( = ?auto_12752 ?auto_12741 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12730 ) ) ( not ( = ?auto_12722 ?auto_12749 ) ) ( not ( = ?auto_12723 ?auto_12730 ) ) ( not ( = ?auto_12723 ?auto_12749 ) ) ( not ( = ?auto_12724 ?auto_12730 ) ) ( not ( = ?auto_12724 ?auto_12749 ) ) ( not ( = ?auto_12725 ?auto_12730 ) ) ( not ( = ?auto_12725 ?auto_12749 ) ) ( not ( = ?auto_12726 ?auto_12730 ) ) ( not ( = ?auto_12726 ?auto_12749 ) ) ( not ( = ?auto_12727 ?auto_12730 ) ) ( not ( = ?auto_12727 ?auto_12749 ) ) ( not ( = ?auto_12728 ?auto_12730 ) ) ( not ( = ?auto_12728 ?auto_12749 ) ) ( not ( = ?auto_12730 ?auto_12752 ) ) ( not ( = ?auto_12730 ?auto_12738 ) ) ( not ( = ?auto_12730 ?auto_12758 ) ) ( not ( = ?auto_12730 ?auto_12742 ) ) ( not ( = ?auto_12730 ?auto_12748 ) ) ( not ( = ?auto_12730 ?auto_12741 ) ) ( not ( = ?auto_12730 ?auto_12753 ) ) ( not ( = ?auto_12749 ?auto_12752 ) ) ( not ( = ?auto_12749 ?auto_12738 ) ) ( not ( = ?auto_12749 ?auto_12758 ) ) ( not ( = ?auto_12749 ?auto_12742 ) ) ( not ( = ?auto_12749 ?auto_12748 ) ) ( not ( = ?auto_12749 ?auto_12741 ) ) ( not ( = ?auto_12749 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12731 ) ) ( not ( = ?auto_12722 ?auto_12733 ) ) ( not ( = ?auto_12723 ?auto_12731 ) ) ( not ( = ?auto_12723 ?auto_12733 ) ) ( not ( = ?auto_12724 ?auto_12731 ) ) ( not ( = ?auto_12724 ?auto_12733 ) ) ( not ( = ?auto_12725 ?auto_12731 ) ) ( not ( = ?auto_12725 ?auto_12733 ) ) ( not ( = ?auto_12726 ?auto_12731 ) ) ( not ( = ?auto_12726 ?auto_12733 ) ) ( not ( = ?auto_12727 ?auto_12731 ) ) ( not ( = ?auto_12727 ?auto_12733 ) ) ( not ( = ?auto_12728 ?auto_12731 ) ) ( not ( = ?auto_12728 ?auto_12733 ) ) ( not ( = ?auto_12729 ?auto_12731 ) ) ( not ( = ?auto_12729 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12749 ) ) ( not ( = ?auto_12731 ?auto_12752 ) ) ( not ( = ?auto_12731 ?auto_12738 ) ) ( not ( = ?auto_12731 ?auto_12758 ) ) ( not ( = ?auto_12731 ?auto_12742 ) ) ( not ( = ?auto_12731 ?auto_12748 ) ) ( not ( = ?auto_12731 ?auto_12741 ) ) ( not ( = ?auto_12731 ?auto_12753 ) ) ( not ( = ?auto_12737 ?auto_12747 ) ) ( not ( = ?auto_12737 ?auto_12743 ) ) ( not ( = ?auto_12737 ?auto_12746 ) ) ( not ( = ?auto_12737 ?auto_12755 ) ) ( not ( = ?auto_12737 ?auto_12754 ) ) ( not ( = ?auto_12737 ?auto_12756 ) ) ( not ( = ?auto_12737 ?auto_12750 ) ) ( not ( = ?auto_12734 ?auto_12739 ) ) ( not ( = ?auto_12734 ?auto_12751 ) ) ( not ( = ?auto_12734 ?auto_12759 ) ) ( not ( = ?auto_12734 ?auto_12744 ) ) ( not ( = ?auto_12734 ?auto_12745 ) ) ( not ( = ?auto_12734 ?auto_12757 ) ) ( not ( = ?auto_12734 ?auto_12740 ) ) ( not ( = ?auto_12733 ?auto_12749 ) ) ( not ( = ?auto_12733 ?auto_12752 ) ) ( not ( = ?auto_12733 ?auto_12738 ) ) ( not ( = ?auto_12733 ?auto_12758 ) ) ( not ( = ?auto_12733 ?auto_12742 ) ) ( not ( = ?auto_12733 ?auto_12748 ) ) ( not ( = ?auto_12733 ?auto_12741 ) ) ( not ( = ?auto_12733 ?auto_12753 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ?auto_12727 ?auto_12728 ?auto_12729 ?auto_12730 )
      ( MAKE-1CRATE ?auto_12730 ?auto_12731 )
      ( MAKE-9CRATE-VERIFY ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ?auto_12727 ?auto_12728 ?auto_12729 ?auto_12730 ?auto_12731 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12781 - SURFACE
      ?auto_12782 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
      ?auto_12785 - SURFACE
      ?auto_12786 - SURFACE
      ?auto_12787 - SURFACE
      ?auto_12788 - SURFACE
      ?auto_12789 - SURFACE
      ?auto_12790 - SURFACE
      ?auto_12791 - SURFACE
    )
    :vars
    (
      ?auto_12796 - HOIST
      ?auto_12792 - PLACE
      ?auto_12793 - PLACE
      ?auto_12794 - HOIST
      ?auto_12797 - SURFACE
      ?auto_12809 - PLACE
      ?auto_12813 - HOIST
      ?auto_12817 - SURFACE
      ?auto_12801 - PLACE
      ?auto_12815 - HOIST
      ?auto_12814 - SURFACE
      ?auto_12820 - PLACE
      ?auto_12805 - HOIST
      ?auto_12798 - SURFACE
      ?auto_12811 - PLACE
      ?auto_12806 - HOIST
      ?auto_12816 - SURFACE
      ?auto_12799 - SURFACE
      ?auto_12808 - PLACE
      ?auto_12804 - HOIST
      ?auto_12819 - SURFACE
      ?auto_12810 - PLACE
      ?auto_12807 - HOIST
      ?auto_12800 - SURFACE
      ?auto_12812 - SURFACE
      ?auto_12802 - PLACE
      ?auto_12803 - HOIST
      ?auto_12818 - SURFACE
      ?auto_12795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12796 ?auto_12792 ) ( IS-CRATE ?auto_12791 ) ( not ( = ?auto_12793 ?auto_12792 ) ) ( HOIST-AT ?auto_12794 ?auto_12793 ) ( SURFACE-AT ?auto_12791 ?auto_12793 ) ( ON ?auto_12791 ?auto_12797 ) ( CLEAR ?auto_12791 ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12797 ) ) ( not ( = ?auto_12791 ?auto_12797 ) ) ( not ( = ?auto_12796 ?auto_12794 ) ) ( IS-CRATE ?auto_12790 ) ( not ( = ?auto_12809 ?auto_12792 ) ) ( HOIST-AT ?auto_12813 ?auto_12809 ) ( AVAILABLE ?auto_12813 ) ( SURFACE-AT ?auto_12790 ?auto_12809 ) ( ON ?auto_12790 ?auto_12817 ) ( CLEAR ?auto_12790 ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( not ( = ?auto_12789 ?auto_12817 ) ) ( not ( = ?auto_12790 ?auto_12817 ) ) ( not ( = ?auto_12796 ?auto_12813 ) ) ( IS-CRATE ?auto_12789 ) ( not ( = ?auto_12801 ?auto_12792 ) ) ( HOIST-AT ?auto_12815 ?auto_12801 ) ( SURFACE-AT ?auto_12789 ?auto_12801 ) ( ON ?auto_12789 ?auto_12814 ) ( CLEAR ?auto_12789 ) ( not ( = ?auto_12788 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12814 ) ) ( not ( = ?auto_12789 ?auto_12814 ) ) ( not ( = ?auto_12796 ?auto_12815 ) ) ( IS-CRATE ?auto_12788 ) ( not ( = ?auto_12820 ?auto_12792 ) ) ( HOIST-AT ?auto_12805 ?auto_12820 ) ( AVAILABLE ?auto_12805 ) ( SURFACE-AT ?auto_12788 ?auto_12820 ) ( ON ?auto_12788 ?auto_12798 ) ( CLEAR ?auto_12788 ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12798 ) ) ( not ( = ?auto_12788 ?auto_12798 ) ) ( not ( = ?auto_12796 ?auto_12805 ) ) ( IS-CRATE ?auto_12787 ) ( not ( = ?auto_12811 ?auto_12792 ) ) ( HOIST-AT ?auto_12806 ?auto_12811 ) ( AVAILABLE ?auto_12806 ) ( SURFACE-AT ?auto_12787 ?auto_12811 ) ( ON ?auto_12787 ?auto_12816 ) ( CLEAR ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12816 ) ) ( not ( = ?auto_12787 ?auto_12816 ) ) ( not ( = ?auto_12796 ?auto_12806 ) ) ( IS-CRATE ?auto_12786 ) ( AVAILABLE ?auto_12794 ) ( SURFACE-AT ?auto_12786 ?auto_12793 ) ( ON ?auto_12786 ?auto_12799 ) ( CLEAR ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12799 ) ) ( IS-CRATE ?auto_12785 ) ( not ( = ?auto_12808 ?auto_12792 ) ) ( HOIST-AT ?auto_12804 ?auto_12808 ) ( AVAILABLE ?auto_12804 ) ( SURFACE-AT ?auto_12785 ?auto_12808 ) ( ON ?auto_12785 ?auto_12819 ) ( CLEAR ?auto_12785 ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12819 ) ) ( not ( = ?auto_12785 ?auto_12819 ) ) ( not ( = ?auto_12796 ?auto_12804 ) ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12810 ?auto_12792 ) ) ( HOIST-AT ?auto_12807 ?auto_12810 ) ( AVAILABLE ?auto_12807 ) ( SURFACE-AT ?auto_12784 ?auto_12810 ) ( ON ?auto_12784 ?auto_12800 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12800 ) ) ( not ( = ?auto_12784 ?auto_12800 ) ) ( not ( = ?auto_12796 ?auto_12807 ) ) ( IS-CRATE ?auto_12783 ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12783 ?auto_12801 ) ( ON ?auto_12783 ?auto_12812 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12812 ) ) ( not ( = ?auto_12783 ?auto_12812 ) ) ( SURFACE-AT ?auto_12781 ?auto_12792 ) ( CLEAR ?auto_12781 ) ( IS-CRATE ?auto_12782 ) ( AVAILABLE ?auto_12796 ) ( not ( = ?auto_12802 ?auto_12792 ) ) ( HOIST-AT ?auto_12803 ?auto_12802 ) ( AVAILABLE ?auto_12803 ) ( SURFACE-AT ?auto_12782 ?auto_12802 ) ( ON ?auto_12782 ?auto_12818 ) ( CLEAR ?auto_12782 ) ( TRUCK-AT ?auto_12795 ?auto_12792 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12818 ) ) ( not ( = ?auto_12782 ?auto_12818 ) ) ( not ( = ?auto_12796 ?auto_12803 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12812 ) ) ( not ( = ?auto_12783 ?auto_12818 ) ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( not ( = ?auto_12815 ?auto_12803 ) ) ( not ( = ?auto_12812 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12800 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12800 ) ) ( not ( = ?auto_12784 ?auto_12812 ) ) ( not ( = ?auto_12784 ?auto_12818 ) ) ( not ( = ?auto_12810 ?auto_12801 ) ) ( not ( = ?auto_12810 ?auto_12802 ) ) ( not ( = ?auto_12807 ?auto_12815 ) ) ( not ( = ?auto_12807 ?auto_12803 ) ) ( not ( = ?auto_12800 ?auto_12812 ) ) ( not ( = ?auto_12800 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12785 ) ) ( not ( = ?auto_12781 ?auto_12819 ) ) ( not ( = ?auto_12782 ?auto_12785 ) ) ( not ( = ?auto_12782 ?auto_12819 ) ) ( not ( = ?auto_12783 ?auto_12785 ) ) ( not ( = ?auto_12783 ?auto_12819 ) ) ( not ( = ?auto_12785 ?auto_12800 ) ) ( not ( = ?auto_12785 ?auto_12812 ) ) ( not ( = ?auto_12785 ?auto_12818 ) ) ( not ( = ?auto_12808 ?auto_12810 ) ) ( not ( = ?auto_12808 ?auto_12801 ) ) ( not ( = ?auto_12808 ?auto_12802 ) ) ( not ( = ?auto_12804 ?auto_12807 ) ) ( not ( = ?auto_12804 ?auto_12815 ) ) ( not ( = ?auto_12804 ?auto_12803 ) ) ( not ( = ?auto_12819 ?auto_12800 ) ) ( not ( = ?auto_12819 ?auto_12812 ) ) ( not ( = ?auto_12819 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12786 ) ) ( not ( = ?auto_12781 ?auto_12799 ) ) ( not ( = ?auto_12782 ?auto_12786 ) ) ( not ( = ?auto_12782 ?auto_12799 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12783 ?auto_12799 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12819 ) ) ( not ( = ?auto_12786 ?auto_12800 ) ) ( not ( = ?auto_12786 ?auto_12812 ) ) ( not ( = ?auto_12786 ?auto_12818 ) ) ( not ( = ?auto_12793 ?auto_12808 ) ) ( not ( = ?auto_12793 ?auto_12810 ) ) ( not ( = ?auto_12793 ?auto_12801 ) ) ( not ( = ?auto_12793 ?auto_12802 ) ) ( not ( = ?auto_12794 ?auto_12804 ) ) ( not ( = ?auto_12794 ?auto_12807 ) ) ( not ( = ?auto_12794 ?auto_12815 ) ) ( not ( = ?auto_12794 ?auto_12803 ) ) ( not ( = ?auto_12799 ?auto_12819 ) ) ( not ( = ?auto_12799 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12812 ) ) ( not ( = ?auto_12799 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12816 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12782 ?auto_12816 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12783 ?auto_12816 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12816 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12816 ) ) ( not ( = ?auto_12787 ?auto_12799 ) ) ( not ( = ?auto_12787 ?auto_12819 ) ) ( not ( = ?auto_12787 ?auto_12800 ) ) ( not ( = ?auto_12787 ?auto_12812 ) ) ( not ( = ?auto_12787 ?auto_12818 ) ) ( not ( = ?auto_12811 ?auto_12793 ) ) ( not ( = ?auto_12811 ?auto_12808 ) ) ( not ( = ?auto_12811 ?auto_12810 ) ) ( not ( = ?auto_12811 ?auto_12801 ) ) ( not ( = ?auto_12811 ?auto_12802 ) ) ( not ( = ?auto_12806 ?auto_12794 ) ) ( not ( = ?auto_12806 ?auto_12804 ) ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12815 ) ) ( not ( = ?auto_12806 ?auto_12803 ) ) ( not ( = ?auto_12816 ?auto_12799 ) ) ( not ( = ?auto_12816 ?auto_12819 ) ) ( not ( = ?auto_12816 ?auto_12800 ) ) ( not ( = ?auto_12816 ?auto_12812 ) ) ( not ( = ?auto_12816 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12788 ) ) ( not ( = ?auto_12781 ?auto_12798 ) ) ( not ( = ?auto_12782 ?auto_12788 ) ) ( not ( = ?auto_12782 ?auto_12798 ) ) ( not ( = ?auto_12783 ?auto_12788 ) ) ( not ( = ?auto_12783 ?auto_12798 ) ) ( not ( = ?auto_12784 ?auto_12788 ) ) ( not ( = ?auto_12784 ?auto_12798 ) ) ( not ( = ?auto_12785 ?auto_12788 ) ) ( not ( = ?auto_12785 ?auto_12798 ) ) ( not ( = ?auto_12786 ?auto_12788 ) ) ( not ( = ?auto_12786 ?auto_12798 ) ) ( not ( = ?auto_12788 ?auto_12816 ) ) ( not ( = ?auto_12788 ?auto_12799 ) ) ( not ( = ?auto_12788 ?auto_12819 ) ) ( not ( = ?auto_12788 ?auto_12800 ) ) ( not ( = ?auto_12788 ?auto_12812 ) ) ( not ( = ?auto_12788 ?auto_12818 ) ) ( not ( = ?auto_12820 ?auto_12811 ) ) ( not ( = ?auto_12820 ?auto_12793 ) ) ( not ( = ?auto_12820 ?auto_12808 ) ) ( not ( = ?auto_12820 ?auto_12810 ) ) ( not ( = ?auto_12820 ?auto_12801 ) ) ( not ( = ?auto_12820 ?auto_12802 ) ) ( not ( = ?auto_12805 ?auto_12806 ) ) ( not ( = ?auto_12805 ?auto_12794 ) ) ( not ( = ?auto_12805 ?auto_12804 ) ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( not ( = ?auto_12805 ?auto_12815 ) ) ( not ( = ?auto_12805 ?auto_12803 ) ) ( not ( = ?auto_12798 ?auto_12816 ) ) ( not ( = ?auto_12798 ?auto_12799 ) ) ( not ( = ?auto_12798 ?auto_12819 ) ) ( not ( = ?auto_12798 ?auto_12800 ) ) ( not ( = ?auto_12798 ?auto_12812 ) ) ( not ( = ?auto_12798 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12789 ) ) ( not ( = ?auto_12781 ?auto_12814 ) ) ( not ( = ?auto_12782 ?auto_12789 ) ) ( not ( = ?auto_12782 ?auto_12814 ) ) ( not ( = ?auto_12783 ?auto_12789 ) ) ( not ( = ?auto_12783 ?auto_12814 ) ) ( not ( = ?auto_12784 ?auto_12789 ) ) ( not ( = ?auto_12784 ?auto_12814 ) ) ( not ( = ?auto_12785 ?auto_12789 ) ) ( not ( = ?auto_12785 ?auto_12814 ) ) ( not ( = ?auto_12786 ?auto_12789 ) ) ( not ( = ?auto_12786 ?auto_12814 ) ) ( not ( = ?auto_12787 ?auto_12789 ) ) ( not ( = ?auto_12787 ?auto_12814 ) ) ( not ( = ?auto_12789 ?auto_12798 ) ) ( not ( = ?auto_12789 ?auto_12816 ) ) ( not ( = ?auto_12789 ?auto_12799 ) ) ( not ( = ?auto_12789 ?auto_12819 ) ) ( not ( = ?auto_12789 ?auto_12800 ) ) ( not ( = ?auto_12789 ?auto_12812 ) ) ( not ( = ?auto_12789 ?auto_12818 ) ) ( not ( = ?auto_12814 ?auto_12798 ) ) ( not ( = ?auto_12814 ?auto_12816 ) ) ( not ( = ?auto_12814 ?auto_12799 ) ) ( not ( = ?auto_12814 ?auto_12819 ) ) ( not ( = ?auto_12814 ?auto_12800 ) ) ( not ( = ?auto_12814 ?auto_12812 ) ) ( not ( = ?auto_12814 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12790 ) ) ( not ( = ?auto_12781 ?auto_12817 ) ) ( not ( = ?auto_12782 ?auto_12790 ) ) ( not ( = ?auto_12782 ?auto_12817 ) ) ( not ( = ?auto_12783 ?auto_12790 ) ) ( not ( = ?auto_12783 ?auto_12817 ) ) ( not ( = ?auto_12784 ?auto_12790 ) ) ( not ( = ?auto_12784 ?auto_12817 ) ) ( not ( = ?auto_12785 ?auto_12790 ) ) ( not ( = ?auto_12785 ?auto_12817 ) ) ( not ( = ?auto_12786 ?auto_12790 ) ) ( not ( = ?auto_12786 ?auto_12817 ) ) ( not ( = ?auto_12787 ?auto_12790 ) ) ( not ( = ?auto_12787 ?auto_12817 ) ) ( not ( = ?auto_12788 ?auto_12790 ) ) ( not ( = ?auto_12788 ?auto_12817 ) ) ( not ( = ?auto_12790 ?auto_12814 ) ) ( not ( = ?auto_12790 ?auto_12798 ) ) ( not ( = ?auto_12790 ?auto_12816 ) ) ( not ( = ?auto_12790 ?auto_12799 ) ) ( not ( = ?auto_12790 ?auto_12819 ) ) ( not ( = ?auto_12790 ?auto_12800 ) ) ( not ( = ?auto_12790 ?auto_12812 ) ) ( not ( = ?auto_12790 ?auto_12818 ) ) ( not ( = ?auto_12809 ?auto_12801 ) ) ( not ( = ?auto_12809 ?auto_12820 ) ) ( not ( = ?auto_12809 ?auto_12811 ) ) ( not ( = ?auto_12809 ?auto_12793 ) ) ( not ( = ?auto_12809 ?auto_12808 ) ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12809 ?auto_12802 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) ( not ( = ?auto_12813 ?auto_12805 ) ) ( not ( = ?auto_12813 ?auto_12806 ) ) ( not ( = ?auto_12813 ?auto_12794 ) ) ( not ( = ?auto_12813 ?auto_12804 ) ) ( not ( = ?auto_12813 ?auto_12807 ) ) ( not ( = ?auto_12813 ?auto_12803 ) ) ( not ( = ?auto_12817 ?auto_12814 ) ) ( not ( = ?auto_12817 ?auto_12798 ) ) ( not ( = ?auto_12817 ?auto_12816 ) ) ( not ( = ?auto_12817 ?auto_12799 ) ) ( not ( = ?auto_12817 ?auto_12819 ) ) ( not ( = ?auto_12817 ?auto_12800 ) ) ( not ( = ?auto_12817 ?auto_12812 ) ) ( not ( = ?auto_12817 ?auto_12818 ) ) ( not ( = ?auto_12781 ?auto_12791 ) ) ( not ( = ?auto_12781 ?auto_12797 ) ) ( not ( = ?auto_12782 ?auto_12791 ) ) ( not ( = ?auto_12782 ?auto_12797 ) ) ( not ( = ?auto_12783 ?auto_12791 ) ) ( not ( = ?auto_12783 ?auto_12797 ) ) ( not ( = ?auto_12784 ?auto_12791 ) ) ( not ( = ?auto_12784 ?auto_12797 ) ) ( not ( = ?auto_12785 ?auto_12791 ) ) ( not ( = ?auto_12785 ?auto_12797 ) ) ( not ( = ?auto_12786 ?auto_12791 ) ) ( not ( = ?auto_12786 ?auto_12797 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12797 ) ) ( not ( = ?auto_12788 ?auto_12791 ) ) ( not ( = ?auto_12788 ?auto_12797 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12797 ) ) ( not ( = ?auto_12791 ?auto_12817 ) ) ( not ( = ?auto_12791 ?auto_12814 ) ) ( not ( = ?auto_12791 ?auto_12798 ) ) ( not ( = ?auto_12791 ?auto_12816 ) ) ( not ( = ?auto_12791 ?auto_12799 ) ) ( not ( = ?auto_12791 ?auto_12819 ) ) ( not ( = ?auto_12791 ?auto_12800 ) ) ( not ( = ?auto_12791 ?auto_12812 ) ) ( not ( = ?auto_12791 ?auto_12818 ) ) ( not ( = ?auto_12797 ?auto_12817 ) ) ( not ( = ?auto_12797 ?auto_12814 ) ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12816 ) ) ( not ( = ?auto_12797 ?auto_12799 ) ) ( not ( = ?auto_12797 ?auto_12819 ) ) ( not ( = ?auto_12797 ?auto_12800 ) ) ( not ( = ?auto_12797 ?auto_12812 ) ) ( not ( = ?auto_12797 ?auto_12818 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ?auto_12788 ?auto_12789 ?auto_12790 )
      ( MAKE-1CRATE ?auto_12790 ?auto_12791 )
      ( MAKE-10CRATE-VERIFY ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ?auto_12788 ?auto_12789 ?auto_12790 ?auto_12791 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12845 - SURFACE
      ?auto_12846 - SURFACE
      ?auto_12847 - SURFACE
      ?auto_12848 - SURFACE
      ?auto_12849 - SURFACE
      ?auto_12850 - SURFACE
      ?auto_12851 - SURFACE
      ?auto_12852 - SURFACE
      ?auto_12853 - SURFACE
      ?auto_12854 - SURFACE
    )
    :vars
    (
      ?auto_12860 - HOIST
      ?auto_12858 - PLACE
      ?auto_12857 - PLACE
      ?auto_12859 - HOIST
      ?auto_12855 - SURFACE
      ?auto_12879 - PLACE
      ?auto_12864 - HOIST
      ?auto_12867 - SURFACE
      ?auto_12875 - PLACE
      ?auto_12862 - HOIST
      ?auto_12881 - SURFACE
      ?auto_12878 - PLACE
      ?auto_12874 - HOIST
      ?auto_12883 - SURFACE
      ?auto_12866 - PLACE
      ?auto_12880 - HOIST
      ?auto_12876 - SURFACE
      ?auto_12877 - PLACE
      ?auto_12870 - HOIST
      ?auto_12873 - SURFACE
      ?auto_12861 - SURFACE
      ?auto_12869 - SURFACE
      ?auto_12871 - PLACE
      ?auto_12872 - HOIST
      ?auto_12884 - SURFACE
      ?auto_12865 - SURFACE
      ?auto_12863 - PLACE
      ?auto_12868 - HOIST
      ?auto_12882 - SURFACE
      ?auto_12856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12860 ?auto_12858 ) ( IS-CRATE ?auto_12854 ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( HOIST-AT ?auto_12859 ?auto_12857 ) ( SURFACE-AT ?auto_12854 ?auto_12857 ) ( ON ?auto_12854 ?auto_12855 ) ( CLEAR ?auto_12854 ) ( not ( = ?auto_12853 ?auto_12854 ) ) ( not ( = ?auto_12853 ?auto_12855 ) ) ( not ( = ?auto_12854 ?auto_12855 ) ) ( not ( = ?auto_12860 ?auto_12859 ) ) ( IS-CRATE ?auto_12853 ) ( not ( = ?auto_12879 ?auto_12858 ) ) ( HOIST-AT ?auto_12864 ?auto_12879 ) ( SURFACE-AT ?auto_12853 ?auto_12879 ) ( ON ?auto_12853 ?auto_12867 ) ( CLEAR ?auto_12853 ) ( not ( = ?auto_12852 ?auto_12853 ) ) ( not ( = ?auto_12852 ?auto_12867 ) ) ( not ( = ?auto_12853 ?auto_12867 ) ) ( not ( = ?auto_12860 ?auto_12864 ) ) ( IS-CRATE ?auto_12852 ) ( not ( = ?auto_12875 ?auto_12858 ) ) ( HOIST-AT ?auto_12862 ?auto_12875 ) ( AVAILABLE ?auto_12862 ) ( SURFACE-AT ?auto_12852 ?auto_12875 ) ( ON ?auto_12852 ?auto_12881 ) ( CLEAR ?auto_12852 ) ( not ( = ?auto_12851 ?auto_12852 ) ) ( not ( = ?auto_12851 ?auto_12881 ) ) ( not ( = ?auto_12852 ?auto_12881 ) ) ( not ( = ?auto_12860 ?auto_12862 ) ) ( IS-CRATE ?auto_12851 ) ( not ( = ?auto_12878 ?auto_12858 ) ) ( HOIST-AT ?auto_12874 ?auto_12878 ) ( SURFACE-AT ?auto_12851 ?auto_12878 ) ( ON ?auto_12851 ?auto_12883 ) ( CLEAR ?auto_12851 ) ( not ( = ?auto_12850 ?auto_12851 ) ) ( not ( = ?auto_12850 ?auto_12883 ) ) ( not ( = ?auto_12851 ?auto_12883 ) ) ( not ( = ?auto_12860 ?auto_12874 ) ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12866 ?auto_12858 ) ) ( HOIST-AT ?auto_12880 ?auto_12866 ) ( AVAILABLE ?auto_12880 ) ( SURFACE-AT ?auto_12850 ?auto_12866 ) ( ON ?auto_12850 ?auto_12876 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12876 ) ) ( not ( = ?auto_12850 ?auto_12876 ) ) ( not ( = ?auto_12860 ?auto_12880 ) ) ( IS-CRATE ?auto_12849 ) ( not ( = ?auto_12877 ?auto_12858 ) ) ( HOIST-AT ?auto_12870 ?auto_12877 ) ( AVAILABLE ?auto_12870 ) ( SURFACE-AT ?auto_12849 ?auto_12877 ) ( ON ?auto_12849 ?auto_12873 ) ( CLEAR ?auto_12849 ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12873 ) ) ( not ( = ?auto_12849 ?auto_12873 ) ) ( not ( = ?auto_12860 ?auto_12870 ) ) ( IS-CRATE ?auto_12848 ) ( AVAILABLE ?auto_12864 ) ( SURFACE-AT ?auto_12848 ?auto_12879 ) ( ON ?auto_12848 ?auto_12861 ) ( CLEAR ?auto_12848 ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12861 ) ) ( not ( = ?auto_12848 ?auto_12861 ) ) ( IS-CRATE ?auto_12847 ) ( AVAILABLE ?auto_12859 ) ( SURFACE-AT ?auto_12847 ?auto_12857 ) ( ON ?auto_12847 ?auto_12869 ) ( CLEAR ?auto_12847 ) ( not ( = ?auto_12846 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12869 ) ) ( not ( = ?auto_12847 ?auto_12869 ) ) ( IS-CRATE ?auto_12846 ) ( not ( = ?auto_12871 ?auto_12858 ) ) ( HOIST-AT ?auto_12872 ?auto_12871 ) ( AVAILABLE ?auto_12872 ) ( SURFACE-AT ?auto_12846 ?auto_12871 ) ( ON ?auto_12846 ?auto_12884 ) ( CLEAR ?auto_12846 ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( not ( = ?auto_12845 ?auto_12884 ) ) ( not ( = ?auto_12846 ?auto_12884 ) ) ( not ( = ?auto_12860 ?auto_12872 ) ) ( IS-CRATE ?auto_12845 ) ( AVAILABLE ?auto_12874 ) ( SURFACE-AT ?auto_12845 ?auto_12878 ) ( ON ?auto_12845 ?auto_12865 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12844 ?auto_12865 ) ) ( not ( = ?auto_12845 ?auto_12865 ) ) ( SURFACE-AT ?auto_12843 ?auto_12858 ) ( CLEAR ?auto_12843 ) ( IS-CRATE ?auto_12844 ) ( AVAILABLE ?auto_12860 ) ( not ( = ?auto_12863 ?auto_12858 ) ) ( HOIST-AT ?auto_12868 ?auto_12863 ) ( AVAILABLE ?auto_12868 ) ( SURFACE-AT ?auto_12844 ?auto_12863 ) ( ON ?auto_12844 ?auto_12882 ) ( CLEAR ?auto_12844 ) ( TRUCK-AT ?auto_12856 ?auto_12858 ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12882 ) ) ( not ( = ?auto_12844 ?auto_12882 ) ) ( not ( = ?auto_12860 ?auto_12868 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12865 ) ) ( not ( = ?auto_12845 ?auto_12882 ) ) ( not ( = ?auto_12878 ?auto_12863 ) ) ( not ( = ?auto_12874 ?auto_12868 ) ) ( not ( = ?auto_12865 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12843 ?auto_12884 ) ) ( not ( = ?auto_12844 ?auto_12846 ) ) ( not ( = ?auto_12844 ?auto_12884 ) ) ( not ( = ?auto_12846 ?auto_12865 ) ) ( not ( = ?auto_12846 ?auto_12882 ) ) ( not ( = ?auto_12871 ?auto_12878 ) ) ( not ( = ?auto_12871 ?auto_12863 ) ) ( not ( = ?auto_12872 ?auto_12874 ) ) ( not ( = ?auto_12872 ?auto_12868 ) ) ( not ( = ?auto_12884 ?auto_12865 ) ) ( not ( = ?auto_12884 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12869 ) ) ( not ( = ?auto_12844 ?auto_12847 ) ) ( not ( = ?auto_12844 ?auto_12869 ) ) ( not ( = ?auto_12845 ?auto_12847 ) ) ( not ( = ?auto_12845 ?auto_12869 ) ) ( not ( = ?auto_12847 ?auto_12884 ) ) ( not ( = ?auto_12847 ?auto_12865 ) ) ( not ( = ?auto_12847 ?auto_12882 ) ) ( not ( = ?auto_12857 ?auto_12871 ) ) ( not ( = ?auto_12857 ?auto_12878 ) ) ( not ( = ?auto_12857 ?auto_12863 ) ) ( not ( = ?auto_12859 ?auto_12872 ) ) ( not ( = ?auto_12859 ?auto_12874 ) ) ( not ( = ?auto_12859 ?auto_12868 ) ) ( not ( = ?auto_12869 ?auto_12884 ) ) ( not ( = ?auto_12869 ?auto_12865 ) ) ( not ( = ?auto_12869 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12861 ) ) ( not ( = ?auto_12844 ?auto_12848 ) ) ( not ( = ?auto_12844 ?auto_12861 ) ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12861 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12861 ) ) ( not ( = ?auto_12848 ?auto_12869 ) ) ( not ( = ?auto_12848 ?auto_12884 ) ) ( not ( = ?auto_12848 ?auto_12865 ) ) ( not ( = ?auto_12848 ?auto_12882 ) ) ( not ( = ?auto_12879 ?auto_12857 ) ) ( not ( = ?auto_12879 ?auto_12871 ) ) ( not ( = ?auto_12879 ?auto_12878 ) ) ( not ( = ?auto_12879 ?auto_12863 ) ) ( not ( = ?auto_12864 ?auto_12859 ) ) ( not ( = ?auto_12864 ?auto_12872 ) ) ( not ( = ?auto_12864 ?auto_12874 ) ) ( not ( = ?auto_12864 ?auto_12868 ) ) ( not ( = ?auto_12861 ?auto_12869 ) ) ( not ( = ?auto_12861 ?auto_12884 ) ) ( not ( = ?auto_12861 ?auto_12865 ) ) ( not ( = ?auto_12861 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12843 ?auto_12873 ) ) ( not ( = ?auto_12844 ?auto_12849 ) ) ( not ( = ?auto_12844 ?auto_12873 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12873 ) ) ( not ( = ?auto_12846 ?auto_12849 ) ) ( not ( = ?auto_12846 ?auto_12873 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12873 ) ) ( not ( = ?auto_12849 ?auto_12861 ) ) ( not ( = ?auto_12849 ?auto_12869 ) ) ( not ( = ?auto_12849 ?auto_12884 ) ) ( not ( = ?auto_12849 ?auto_12865 ) ) ( not ( = ?auto_12849 ?auto_12882 ) ) ( not ( = ?auto_12877 ?auto_12879 ) ) ( not ( = ?auto_12877 ?auto_12857 ) ) ( not ( = ?auto_12877 ?auto_12871 ) ) ( not ( = ?auto_12877 ?auto_12878 ) ) ( not ( = ?auto_12877 ?auto_12863 ) ) ( not ( = ?auto_12870 ?auto_12864 ) ) ( not ( = ?auto_12870 ?auto_12859 ) ) ( not ( = ?auto_12870 ?auto_12872 ) ) ( not ( = ?auto_12870 ?auto_12874 ) ) ( not ( = ?auto_12870 ?auto_12868 ) ) ( not ( = ?auto_12873 ?auto_12861 ) ) ( not ( = ?auto_12873 ?auto_12869 ) ) ( not ( = ?auto_12873 ?auto_12884 ) ) ( not ( = ?auto_12873 ?auto_12865 ) ) ( not ( = ?auto_12873 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12850 ) ) ( not ( = ?auto_12843 ?auto_12876 ) ) ( not ( = ?auto_12844 ?auto_12850 ) ) ( not ( = ?auto_12844 ?auto_12876 ) ) ( not ( = ?auto_12845 ?auto_12850 ) ) ( not ( = ?auto_12845 ?auto_12876 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12876 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12876 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12848 ?auto_12876 ) ) ( not ( = ?auto_12850 ?auto_12873 ) ) ( not ( = ?auto_12850 ?auto_12861 ) ) ( not ( = ?auto_12850 ?auto_12869 ) ) ( not ( = ?auto_12850 ?auto_12884 ) ) ( not ( = ?auto_12850 ?auto_12865 ) ) ( not ( = ?auto_12850 ?auto_12882 ) ) ( not ( = ?auto_12866 ?auto_12877 ) ) ( not ( = ?auto_12866 ?auto_12879 ) ) ( not ( = ?auto_12866 ?auto_12857 ) ) ( not ( = ?auto_12866 ?auto_12871 ) ) ( not ( = ?auto_12866 ?auto_12878 ) ) ( not ( = ?auto_12866 ?auto_12863 ) ) ( not ( = ?auto_12880 ?auto_12870 ) ) ( not ( = ?auto_12880 ?auto_12864 ) ) ( not ( = ?auto_12880 ?auto_12859 ) ) ( not ( = ?auto_12880 ?auto_12872 ) ) ( not ( = ?auto_12880 ?auto_12874 ) ) ( not ( = ?auto_12880 ?auto_12868 ) ) ( not ( = ?auto_12876 ?auto_12873 ) ) ( not ( = ?auto_12876 ?auto_12861 ) ) ( not ( = ?auto_12876 ?auto_12869 ) ) ( not ( = ?auto_12876 ?auto_12884 ) ) ( not ( = ?auto_12876 ?auto_12865 ) ) ( not ( = ?auto_12876 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12851 ) ) ( not ( = ?auto_12843 ?auto_12883 ) ) ( not ( = ?auto_12844 ?auto_12851 ) ) ( not ( = ?auto_12844 ?auto_12883 ) ) ( not ( = ?auto_12845 ?auto_12851 ) ) ( not ( = ?auto_12845 ?auto_12883 ) ) ( not ( = ?auto_12846 ?auto_12851 ) ) ( not ( = ?auto_12846 ?auto_12883 ) ) ( not ( = ?auto_12847 ?auto_12851 ) ) ( not ( = ?auto_12847 ?auto_12883 ) ) ( not ( = ?auto_12848 ?auto_12851 ) ) ( not ( = ?auto_12848 ?auto_12883 ) ) ( not ( = ?auto_12849 ?auto_12851 ) ) ( not ( = ?auto_12849 ?auto_12883 ) ) ( not ( = ?auto_12851 ?auto_12876 ) ) ( not ( = ?auto_12851 ?auto_12873 ) ) ( not ( = ?auto_12851 ?auto_12861 ) ) ( not ( = ?auto_12851 ?auto_12869 ) ) ( not ( = ?auto_12851 ?auto_12884 ) ) ( not ( = ?auto_12851 ?auto_12865 ) ) ( not ( = ?auto_12851 ?auto_12882 ) ) ( not ( = ?auto_12883 ?auto_12876 ) ) ( not ( = ?auto_12883 ?auto_12873 ) ) ( not ( = ?auto_12883 ?auto_12861 ) ) ( not ( = ?auto_12883 ?auto_12869 ) ) ( not ( = ?auto_12883 ?auto_12884 ) ) ( not ( = ?auto_12883 ?auto_12865 ) ) ( not ( = ?auto_12883 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12852 ) ) ( not ( = ?auto_12843 ?auto_12881 ) ) ( not ( = ?auto_12844 ?auto_12852 ) ) ( not ( = ?auto_12844 ?auto_12881 ) ) ( not ( = ?auto_12845 ?auto_12852 ) ) ( not ( = ?auto_12845 ?auto_12881 ) ) ( not ( = ?auto_12846 ?auto_12852 ) ) ( not ( = ?auto_12846 ?auto_12881 ) ) ( not ( = ?auto_12847 ?auto_12852 ) ) ( not ( = ?auto_12847 ?auto_12881 ) ) ( not ( = ?auto_12848 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12881 ) ) ( not ( = ?auto_12849 ?auto_12852 ) ) ( not ( = ?auto_12849 ?auto_12881 ) ) ( not ( = ?auto_12850 ?auto_12852 ) ) ( not ( = ?auto_12850 ?auto_12881 ) ) ( not ( = ?auto_12852 ?auto_12883 ) ) ( not ( = ?auto_12852 ?auto_12876 ) ) ( not ( = ?auto_12852 ?auto_12873 ) ) ( not ( = ?auto_12852 ?auto_12861 ) ) ( not ( = ?auto_12852 ?auto_12869 ) ) ( not ( = ?auto_12852 ?auto_12884 ) ) ( not ( = ?auto_12852 ?auto_12865 ) ) ( not ( = ?auto_12852 ?auto_12882 ) ) ( not ( = ?auto_12875 ?auto_12878 ) ) ( not ( = ?auto_12875 ?auto_12866 ) ) ( not ( = ?auto_12875 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12879 ) ) ( not ( = ?auto_12875 ?auto_12857 ) ) ( not ( = ?auto_12875 ?auto_12871 ) ) ( not ( = ?auto_12875 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12874 ) ) ( not ( = ?auto_12862 ?auto_12880 ) ) ( not ( = ?auto_12862 ?auto_12870 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12859 ) ) ( not ( = ?auto_12862 ?auto_12872 ) ) ( not ( = ?auto_12862 ?auto_12868 ) ) ( not ( = ?auto_12881 ?auto_12883 ) ) ( not ( = ?auto_12881 ?auto_12876 ) ) ( not ( = ?auto_12881 ?auto_12873 ) ) ( not ( = ?auto_12881 ?auto_12861 ) ) ( not ( = ?auto_12881 ?auto_12869 ) ) ( not ( = ?auto_12881 ?auto_12884 ) ) ( not ( = ?auto_12881 ?auto_12865 ) ) ( not ( = ?auto_12881 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12853 ) ) ( not ( = ?auto_12843 ?auto_12867 ) ) ( not ( = ?auto_12844 ?auto_12853 ) ) ( not ( = ?auto_12844 ?auto_12867 ) ) ( not ( = ?auto_12845 ?auto_12853 ) ) ( not ( = ?auto_12845 ?auto_12867 ) ) ( not ( = ?auto_12846 ?auto_12853 ) ) ( not ( = ?auto_12846 ?auto_12867 ) ) ( not ( = ?auto_12847 ?auto_12853 ) ) ( not ( = ?auto_12847 ?auto_12867 ) ) ( not ( = ?auto_12848 ?auto_12853 ) ) ( not ( = ?auto_12848 ?auto_12867 ) ) ( not ( = ?auto_12849 ?auto_12853 ) ) ( not ( = ?auto_12849 ?auto_12867 ) ) ( not ( = ?auto_12850 ?auto_12853 ) ) ( not ( = ?auto_12850 ?auto_12867 ) ) ( not ( = ?auto_12851 ?auto_12853 ) ) ( not ( = ?auto_12851 ?auto_12867 ) ) ( not ( = ?auto_12853 ?auto_12881 ) ) ( not ( = ?auto_12853 ?auto_12883 ) ) ( not ( = ?auto_12853 ?auto_12876 ) ) ( not ( = ?auto_12853 ?auto_12873 ) ) ( not ( = ?auto_12853 ?auto_12861 ) ) ( not ( = ?auto_12853 ?auto_12869 ) ) ( not ( = ?auto_12853 ?auto_12884 ) ) ( not ( = ?auto_12853 ?auto_12865 ) ) ( not ( = ?auto_12853 ?auto_12882 ) ) ( not ( = ?auto_12867 ?auto_12881 ) ) ( not ( = ?auto_12867 ?auto_12883 ) ) ( not ( = ?auto_12867 ?auto_12876 ) ) ( not ( = ?auto_12867 ?auto_12873 ) ) ( not ( = ?auto_12867 ?auto_12861 ) ) ( not ( = ?auto_12867 ?auto_12869 ) ) ( not ( = ?auto_12867 ?auto_12884 ) ) ( not ( = ?auto_12867 ?auto_12865 ) ) ( not ( = ?auto_12867 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12854 ) ) ( not ( = ?auto_12843 ?auto_12855 ) ) ( not ( = ?auto_12844 ?auto_12854 ) ) ( not ( = ?auto_12844 ?auto_12855 ) ) ( not ( = ?auto_12845 ?auto_12854 ) ) ( not ( = ?auto_12845 ?auto_12855 ) ) ( not ( = ?auto_12846 ?auto_12854 ) ) ( not ( = ?auto_12846 ?auto_12855 ) ) ( not ( = ?auto_12847 ?auto_12854 ) ) ( not ( = ?auto_12847 ?auto_12855 ) ) ( not ( = ?auto_12848 ?auto_12854 ) ) ( not ( = ?auto_12848 ?auto_12855 ) ) ( not ( = ?auto_12849 ?auto_12854 ) ) ( not ( = ?auto_12849 ?auto_12855 ) ) ( not ( = ?auto_12850 ?auto_12854 ) ) ( not ( = ?auto_12850 ?auto_12855 ) ) ( not ( = ?auto_12851 ?auto_12854 ) ) ( not ( = ?auto_12851 ?auto_12855 ) ) ( not ( = ?auto_12852 ?auto_12854 ) ) ( not ( = ?auto_12852 ?auto_12855 ) ) ( not ( = ?auto_12854 ?auto_12867 ) ) ( not ( = ?auto_12854 ?auto_12881 ) ) ( not ( = ?auto_12854 ?auto_12883 ) ) ( not ( = ?auto_12854 ?auto_12876 ) ) ( not ( = ?auto_12854 ?auto_12873 ) ) ( not ( = ?auto_12854 ?auto_12861 ) ) ( not ( = ?auto_12854 ?auto_12869 ) ) ( not ( = ?auto_12854 ?auto_12884 ) ) ( not ( = ?auto_12854 ?auto_12865 ) ) ( not ( = ?auto_12854 ?auto_12882 ) ) ( not ( = ?auto_12855 ?auto_12867 ) ) ( not ( = ?auto_12855 ?auto_12881 ) ) ( not ( = ?auto_12855 ?auto_12883 ) ) ( not ( = ?auto_12855 ?auto_12876 ) ) ( not ( = ?auto_12855 ?auto_12873 ) ) ( not ( = ?auto_12855 ?auto_12861 ) ) ( not ( = ?auto_12855 ?auto_12869 ) ) ( not ( = ?auto_12855 ?auto_12884 ) ) ( not ( = ?auto_12855 ?auto_12865 ) ) ( not ( = ?auto_12855 ?auto_12882 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12850 ?auto_12851 ?auto_12852 ?auto_12853 )
      ( MAKE-1CRATE ?auto_12853 ?auto_12854 )
      ( MAKE-11CRATE-VERIFY ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12850 ?auto_12851 ?auto_12852 ?auto_12853 ?auto_12854 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12908 - SURFACE
      ?auto_12909 - SURFACE
      ?auto_12910 - SURFACE
      ?auto_12911 - SURFACE
      ?auto_12912 - SURFACE
      ?auto_12913 - SURFACE
      ?auto_12914 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12916 - SURFACE
      ?auto_12917 - SURFACE
      ?auto_12918 - SURFACE
      ?auto_12919 - SURFACE
      ?auto_12920 - SURFACE
    )
    :vars
    (
      ?auto_12924 - HOIST
      ?auto_12923 - PLACE
      ?auto_12921 - PLACE
      ?auto_12926 - HOIST
      ?auto_12925 - SURFACE
      ?auto_12931 - PLACE
      ?auto_12927 - HOIST
      ?auto_12943 - SURFACE
      ?auto_12937 - PLACE
      ?auto_12939 - HOIST
      ?auto_12929 - SURFACE
      ?auto_12951 - PLACE
      ?auto_12928 - HOIST
      ?auto_12947 - SURFACE
      ?auto_12930 - PLACE
      ?auto_12935 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12945 - SURFACE
      ?auto_12934 - PLACE
      ?auto_12944 - HOIST
      ?auto_12949 - SURFACE
      ?auto_12940 - SURFACE
      ?auto_12948 - SURFACE
      ?auto_12942 - PLACE
      ?auto_12941 - HOIST
      ?auto_12932 - SURFACE
      ?auto_12936 - SURFACE
      ?auto_12933 - PLACE
      ?auto_12950 - HOIST
      ?auto_12938 - SURFACE
      ?auto_12922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12924 ?auto_12923 ) ( IS-CRATE ?auto_12920 ) ( not ( = ?auto_12921 ?auto_12923 ) ) ( HOIST-AT ?auto_12926 ?auto_12921 ) ( SURFACE-AT ?auto_12920 ?auto_12921 ) ( ON ?auto_12920 ?auto_12925 ) ( CLEAR ?auto_12920 ) ( not ( = ?auto_12919 ?auto_12920 ) ) ( not ( = ?auto_12919 ?auto_12925 ) ) ( not ( = ?auto_12920 ?auto_12925 ) ) ( not ( = ?auto_12924 ?auto_12926 ) ) ( IS-CRATE ?auto_12919 ) ( not ( = ?auto_12931 ?auto_12923 ) ) ( HOIST-AT ?auto_12927 ?auto_12931 ) ( SURFACE-AT ?auto_12919 ?auto_12931 ) ( ON ?auto_12919 ?auto_12943 ) ( CLEAR ?auto_12919 ) ( not ( = ?auto_12918 ?auto_12919 ) ) ( not ( = ?auto_12918 ?auto_12943 ) ) ( not ( = ?auto_12919 ?auto_12943 ) ) ( not ( = ?auto_12924 ?auto_12927 ) ) ( IS-CRATE ?auto_12918 ) ( not ( = ?auto_12937 ?auto_12923 ) ) ( HOIST-AT ?auto_12939 ?auto_12937 ) ( SURFACE-AT ?auto_12918 ?auto_12937 ) ( ON ?auto_12918 ?auto_12929 ) ( CLEAR ?auto_12918 ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12929 ) ) ( not ( = ?auto_12918 ?auto_12929 ) ) ( not ( = ?auto_12924 ?auto_12939 ) ) ( IS-CRATE ?auto_12917 ) ( not ( = ?auto_12951 ?auto_12923 ) ) ( HOIST-AT ?auto_12928 ?auto_12951 ) ( AVAILABLE ?auto_12928 ) ( SURFACE-AT ?auto_12917 ?auto_12951 ) ( ON ?auto_12917 ?auto_12947 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12947 ) ) ( not ( = ?auto_12917 ?auto_12947 ) ) ( not ( = ?auto_12924 ?auto_12928 ) ) ( IS-CRATE ?auto_12916 ) ( not ( = ?auto_12930 ?auto_12923 ) ) ( HOIST-AT ?auto_12935 ?auto_12930 ) ( SURFACE-AT ?auto_12916 ?auto_12930 ) ( ON ?auto_12916 ?auto_12946 ) ( CLEAR ?auto_12916 ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12946 ) ) ( not ( = ?auto_12916 ?auto_12946 ) ) ( not ( = ?auto_12924 ?auto_12935 ) ) ( IS-CRATE ?auto_12915 ) ( AVAILABLE ?auto_12926 ) ( SURFACE-AT ?auto_12915 ?auto_12921 ) ( ON ?auto_12915 ?auto_12945 ) ( CLEAR ?auto_12915 ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12945 ) ) ( not ( = ?auto_12915 ?auto_12945 ) ) ( IS-CRATE ?auto_12914 ) ( not ( = ?auto_12934 ?auto_12923 ) ) ( HOIST-AT ?auto_12944 ?auto_12934 ) ( AVAILABLE ?auto_12944 ) ( SURFACE-AT ?auto_12914 ?auto_12934 ) ( ON ?auto_12914 ?auto_12949 ) ( CLEAR ?auto_12914 ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12949 ) ) ( not ( = ?auto_12914 ?auto_12949 ) ) ( not ( = ?auto_12924 ?auto_12944 ) ) ( IS-CRATE ?auto_12913 ) ( AVAILABLE ?auto_12939 ) ( SURFACE-AT ?auto_12913 ?auto_12937 ) ( ON ?auto_12913 ?auto_12940 ) ( CLEAR ?auto_12913 ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12940 ) ) ( not ( = ?auto_12913 ?auto_12940 ) ) ( IS-CRATE ?auto_12912 ) ( AVAILABLE ?auto_12927 ) ( SURFACE-AT ?auto_12912 ?auto_12931 ) ( ON ?auto_12912 ?auto_12948 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12948 ) ) ( not ( = ?auto_12912 ?auto_12948 ) ) ( IS-CRATE ?auto_12911 ) ( not ( = ?auto_12942 ?auto_12923 ) ) ( HOIST-AT ?auto_12941 ?auto_12942 ) ( AVAILABLE ?auto_12941 ) ( SURFACE-AT ?auto_12911 ?auto_12942 ) ( ON ?auto_12911 ?auto_12932 ) ( CLEAR ?auto_12911 ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( not ( = ?auto_12910 ?auto_12932 ) ) ( not ( = ?auto_12911 ?auto_12932 ) ) ( not ( = ?auto_12924 ?auto_12941 ) ) ( IS-CRATE ?auto_12910 ) ( AVAILABLE ?auto_12935 ) ( SURFACE-AT ?auto_12910 ?auto_12930 ) ( ON ?auto_12910 ?auto_12936 ) ( CLEAR ?auto_12910 ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12936 ) ) ( not ( = ?auto_12910 ?auto_12936 ) ) ( SURFACE-AT ?auto_12908 ?auto_12923 ) ( CLEAR ?auto_12908 ) ( IS-CRATE ?auto_12909 ) ( AVAILABLE ?auto_12924 ) ( not ( = ?auto_12933 ?auto_12923 ) ) ( HOIST-AT ?auto_12950 ?auto_12933 ) ( AVAILABLE ?auto_12950 ) ( SURFACE-AT ?auto_12909 ?auto_12933 ) ( ON ?auto_12909 ?auto_12938 ) ( CLEAR ?auto_12909 ) ( TRUCK-AT ?auto_12922 ?auto_12923 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12938 ) ) ( not ( = ?auto_12909 ?auto_12938 ) ) ( not ( = ?auto_12924 ?auto_12950 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12908 ?auto_12936 ) ) ( not ( = ?auto_12910 ?auto_12938 ) ) ( not ( = ?auto_12930 ?auto_12933 ) ) ( not ( = ?auto_12935 ?auto_12950 ) ) ( not ( = ?auto_12936 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12911 ) ) ( not ( = ?auto_12908 ?auto_12932 ) ) ( not ( = ?auto_12909 ?auto_12911 ) ) ( not ( = ?auto_12909 ?auto_12932 ) ) ( not ( = ?auto_12911 ?auto_12936 ) ) ( not ( = ?auto_12911 ?auto_12938 ) ) ( not ( = ?auto_12942 ?auto_12930 ) ) ( not ( = ?auto_12942 ?auto_12933 ) ) ( not ( = ?auto_12941 ?auto_12935 ) ) ( not ( = ?auto_12941 ?auto_12950 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12932 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12912 ) ) ( not ( = ?auto_12908 ?auto_12948 ) ) ( not ( = ?auto_12909 ?auto_12912 ) ) ( not ( = ?auto_12909 ?auto_12948 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12948 ) ) ( not ( = ?auto_12912 ?auto_12932 ) ) ( not ( = ?auto_12912 ?auto_12936 ) ) ( not ( = ?auto_12912 ?auto_12938 ) ) ( not ( = ?auto_12931 ?auto_12942 ) ) ( not ( = ?auto_12931 ?auto_12930 ) ) ( not ( = ?auto_12931 ?auto_12933 ) ) ( not ( = ?auto_12927 ?auto_12941 ) ) ( not ( = ?auto_12927 ?auto_12935 ) ) ( not ( = ?auto_12927 ?auto_12950 ) ) ( not ( = ?auto_12948 ?auto_12932 ) ) ( not ( = ?auto_12948 ?auto_12936 ) ) ( not ( = ?auto_12948 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12913 ) ) ( not ( = ?auto_12908 ?auto_12940 ) ) ( not ( = ?auto_12909 ?auto_12913 ) ) ( not ( = ?auto_12909 ?auto_12940 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12910 ?auto_12940 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12911 ?auto_12940 ) ) ( not ( = ?auto_12913 ?auto_12948 ) ) ( not ( = ?auto_12913 ?auto_12932 ) ) ( not ( = ?auto_12913 ?auto_12936 ) ) ( not ( = ?auto_12913 ?auto_12938 ) ) ( not ( = ?auto_12937 ?auto_12931 ) ) ( not ( = ?auto_12937 ?auto_12942 ) ) ( not ( = ?auto_12937 ?auto_12930 ) ) ( not ( = ?auto_12937 ?auto_12933 ) ) ( not ( = ?auto_12939 ?auto_12927 ) ) ( not ( = ?auto_12939 ?auto_12941 ) ) ( not ( = ?auto_12939 ?auto_12935 ) ) ( not ( = ?auto_12939 ?auto_12950 ) ) ( not ( = ?auto_12940 ?auto_12948 ) ) ( not ( = ?auto_12940 ?auto_12932 ) ) ( not ( = ?auto_12940 ?auto_12936 ) ) ( not ( = ?auto_12940 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12914 ) ) ( not ( = ?auto_12908 ?auto_12949 ) ) ( not ( = ?auto_12909 ?auto_12914 ) ) ( not ( = ?auto_12909 ?auto_12949 ) ) ( not ( = ?auto_12910 ?auto_12914 ) ) ( not ( = ?auto_12910 ?auto_12949 ) ) ( not ( = ?auto_12911 ?auto_12914 ) ) ( not ( = ?auto_12911 ?auto_12949 ) ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12949 ) ) ( not ( = ?auto_12914 ?auto_12940 ) ) ( not ( = ?auto_12914 ?auto_12948 ) ) ( not ( = ?auto_12914 ?auto_12932 ) ) ( not ( = ?auto_12914 ?auto_12936 ) ) ( not ( = ?auto_12914 ?auto_12938 ) ) ( not ( = ?auto_12934 ?auto_12937 ) ) ( not ( = ?auto_12934 ?auto_12931 ) ) ( not ( = ?auto_12934 ?auto_12942 ) ) ( not ( = ?auto_12934 ?auto_12930 ) ) ( not ( = ?auto_12934 ?auto_12933 ) ) ( not ( = ?auto_12944 ?auto_12939 ) ) ( not ( = ?auto_12944 ?auto_12927 ) ) ( not ( = ?auto_12944 ?auto_12941 ) ) ( not ( = ?auto_12944 ?auto_12935 ) ) ( not ( = ?auto_12944 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12940 ) ) ( not ( = ?auto_12949 ?auto_12948 ) ) ( not ( = ?auto_12949 ?auto_12932 ) ) ( not ( = ?auto_12949 ?auto_12936 ) ) ( not ( = ?auto_12949 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12915 ) ) ( not ( = ?auto_12908 ?auto_12945 ) ) ( not ( = ?auto_12909 ?auto_12915 ) ) ( not ( = ?auto_12909 ?auto_12945 ) ) ( not ( = ?auto_12910 ?auto_12915 ) ) ( not ( = ?auto_12910 ?auto_12945 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12945 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12945 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12945 ) ) ( not ( = ?auto_12915 ?auto_12949 ) ) ( not ( = ?auto_12915 ?auto_12940 ) ) ( not ( = ?auto_12915 ?auto_12948 ) ) ( not ( = ?auto_12915 ?auto_12932 ) ) ( not ( = ?auto_12915 ?auto_12936 ) ) ( not ( = ?auto_12915 ?auto_12938 ) ) ( not ( = ?auto_12921 ?auto_12934 ) ) ( not ( = ?auto_12921 ?auto_12937 ) ) ( not ( = ?auto_12921 ?auto_12931 ) ) ( not ( = ?auto_12921 ?auto_12942 ) ) ( not ( = ?auto_12921 ?auto_12930 ) ) ( not ( = ?auto_12921 ?auto_12933 ) ) ( not ( = ?auto_12926 ?auto_12944 ) ) ( not ( = ?auto_12926 ?auto_12939 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12941 ) ) ( not ( = ?auto_12926 ?auto_12935 ) ) ( not ( = ?auto_12926 ?auto_12950 ) ) ( not ( = ?auto_12945 ?auto_12949 ) ) ( not ( = ?auto_12945 ?auto_12940 ) ) ( not ( = ?auto_12945 ?auto_12948 ) ) ( not ( = ?auto_12945 ?auto_12932 ) ) ( not ( = ?auto_12945 ?auto_12936 ) ) ( not ( = ?auto_12945 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12916 ) ) ( not ( = ?auto_12908 ?auto_12946 ) ) ( not ( = ?auto_12909 ?auto_12916 ) ) ( not ( = ?auto_12909 ?auto_12946 ) ) ( not ( = ?auto_12910 ?auto_12916 ) ) ( not ( = ?auto_12910 ?auto_12946 ) ) ( not ( = ?auto_12911 ?auto_12916 ) ) ( not ( = ?auto_12911 ?auto_12946 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12946 ) ) ( not ( = ?auto_12913 ?auto_12916 ) ) ( not ( = ?auto_12913 ?auto_12946 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12946 ) ) ( not ( = ?auto_12916 ?auto_12945 ) ) ( not ( = ?auto_12916 ?auto_12949 ) ) ( not ( = ?auto_12916 ?auto_12940 ) ) ( not ( = ?auto_12916 ?auto_12948 ) ) ( not ( = ?auto_12916 ?auto_12932 ) ) ( not ( = ?auto_12916 ?auto_12936 ) ) ( not ( = ?auto_12916 ?auto_12938 ) ) ( not ( = ?auto_12946 ?auto_12945 ) ) ( not ( = ?auto_12946 ?auto_12949 ) ) ( not ( = ?auto_12946 ?auto_12940 ) ) ( not ( = ?auto_12946 ?auto_12948 ) ) ( not ( = ?auto_12946 ?auto_12932 ) ) ( not ( = ?auto_12946 ?auto_12936 ) ) ( not ( = ?auto_12946 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12917 ) ) ( not ( = ?auto_12908 ?auto_12947 ) ) ( not ( = ?auto_12909 ?auto_12917 ) ) ( not ( = ?auto_12909 ?auto_12947 ) ) ( not ( = ?auto_12910 ?auto_12917 ) ) ( not ( = ?auto_12910 ?auto_12947 ) ) ( not ( = ?auto_12911 ?auto_12917 ) ) ( not ( = ?auto_12911 ?auto_12947 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12912 ?auto_12947 ) ) ( not ( = ?auto_12913 ?auto_12917 ) ) ( not ( = ?auto_12913 ?auto_12947 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12947 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12947 ) ) ( not ( = ?auto_12917 ?auto_12946 ) ) ( not ( = ?auto_12917 ?auto_12945 ) ) ( not ( = ?auto_12917 ?auto_12949 ) ) ( not ( = ?auto_12917 ?auto_12940 ) ) ( not ( = ?auto_12917 ?auto_12948 ) ) ( not ( = ?auto_12917 ?auto_12932 ) ) ( not ( = ?auto_12917 ?auto_12936 ) ) ( not ( = ?auto_12917 ?auto_12938 ) ) ( not ( = ?auto_12951 ?auto_12930 ) ) ( not ( = ?auto_12951 ?auto_12921 ) ) ( not ( = ?auto_12951 ?auto_12934 ) ) ( not ( = ?auto_12951 ?auto_12937 ) ) ( not ( = ?auto_12951 ?auto_12931 ) ) ( not ( = ?auto_12951 ?auto_12942 ) ) ( not ( = ?auto_12951 ?auto_12933 ) ) ( not ( = ?auto_12928 ?auto_12935 ) ) ( not ( = ?auto_12928 ?auto_12926 ) ) ( not ( = ?auto_12928 ?auto_12944 ) ) ( not ( = ?auto_12928 ?auto_12939 ) ) ( not ( = ?auto_12928 ?auto_12927 ) ) ( not ( = ?auto_12928 ?auto_12941 ) ) ( not ( = ?auto_12928 ?auto_12950 ) ) ( not ( = ?auto_12947 ?auto_12946 ) ) ( not ( = ?auto_12947 ?auto_12945 ) ) ( not ( = ?auto_12947 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12940 ) ) ( not ( = ?auto_12947 ?auto_12948 ) ) ( not ( = ?auto_12947 ?auto_12932 ) ) ( not ( = ?auto_12947 ?auto_12936 ) ) ( not ( = ?auto_12947 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12918 ) ) ( not ( = ?auto_12908 ?auto_12929 ) ) ( not ( = ?auto_12909 ?auto_12918 ) ) ( not ( = ?auto_12909 ?auto_12929 ) ) ( not ( = ?auto_12910 ?auto_12918 ) ) ( not ( = ?auto_12910 ?auto_12929 ) ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( not ( = ?auto_12911 ?auto_12929 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12929 ) ) ( not ( = ?auto_12913 ?auto_12918 ) ) ( not ( = ?auto_12913 ?auto_12929 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) ( not ( = ?auto_12914 ?auto_12929 ) ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12929 ) ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12929 ) ) ( not ( = ?auto_12918 ?auto_12947 ) ) ( not ( = ?auto_12918 ?auto_12946 ) ) ( not ( = ?auto_12918 ?auto_12945 ) ) ( not ( = ?auto_12918 ?auto_12949 ) ) ( not ( = ?auto_12918 ?auto_12940 ) ) ( not ( = ?auto_12918 ?auto_12948 ) ) ( not ( = ?auto_12918 ?auto_12932 ) ) ( not ( = ?auto_12918 ?auto_12936 ) ) ( not ( = ?auto_12918 ?auto_12938 ) ) ( not ( = ?auto_12929 ?auto_12947 ) ) ( not ( = ?auto_12929 ?auto_12946 ) ) ( not ( = ?auto_12929 ?auto_12945 ) ) ( not ( = ?auto_12929 ?auto_12949 ) ) ( not ( = ?auto_12929 ?auto_12940 ) ) ( not ( = ?auto_12929 ?auto_12948 ) ) ( not ( = ?auto_12929 ?auto_12932 ) ) ( not ( = ?auto_12929 ?auto_12936 ) ) ( not ( = ?auto_12929 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12919 ) ) ( not ( = ?auto_12908 ?auto_12943 ) ) ( not ( = ?auto_12909 ?auto_12919 ) ) ( not ( = ?auto_12909 ?auto_12943 ) ) ( not ( = ?auto_12910 ?auto_12919 ) ) ( not ( = ?auto_12910 ?auto_12943 ) ) ( not ( = ?auto_12911 ?auto_12919 ) ) ( not ( = ?auto_12911 ?auto_12943 ) ) ( not ( = ?auto_12912 ?auto_12919 ) ) ( not ( = ?auto_12912 ?auto_12943 ) ) ( not ( = ?auto_12913 ?auto_12919 ) ) ( not ( = ?auto_12913 ?auto_12943 ) ) ( not ( = ?auto_12914 ?auto_12919 ) ) ( not ( = ?auto_12914 ?auto_12943 ) ) ( not ( = ?auto_12915 ?auto_12919 ) ) ( not ( = ?auto_12915 ?auto_12943 ) ) ( not ( = ?auto_12916 ?auto_12919 ) ) ( not ( = ?auto_12916 ?auto_12943 ) ) ( not ( = ?auto_12917 ?auto_12919 ) ) ( not ( = ?auto_12917 ?auto_12943 ) ) ( not ( = ?auto_12919 ?auto_12929 ) ) ( not ( = ?auto_12919 ?auto_12947 ) ) ( not ( = ?auto_12919 ?auto_12946 ) ) ( not ( = ?auto_12919 ?auto_12945 ) ) ( not ( = ?auto_12919 ?auto_12949 ) ) ( not ( = ?auto_12919 ?auto_12940 ) ) ( not ( = ?auto_12919 ?auto_12948 ) ) ( not ( = ?auto_12919 ?auto_12932 ) ) ( not ( = ?auto_12919 ?auto_12936 ) ) ( not ( = ?auto_12919 ?auto_12938 ) ) ( not ( = ?auto_12943 ?auto_12929 ) ) ( not ( = ?auto_12943 ?auto_12947 ) ) ( not ( = ?auto_12943 ?auto_12946 ) ) ( not ( = ?auto_12943 ?auto_12945 ) ) ( not ( = ?auto_12943 ?auto_12949 ) ) ( not ( = ?auto_12943 ?auto_12940 ) ) ( not ( = ?auto_12943 ?auto_12948 ) ) ( not ( = ?auto_12943 ?auto_12932 ) ) ( not ( = ?auto_12943 ?auto_12936 ) ) ( not ( = ?auto_12943 ?auto_12938 ) ) ( not ( = ?auto_12908 ?auto_12920 ) ) ( not ( = ?auto_12908 ?auto_12925 ) ) ( not ( = ?auto_12909 ?auto_12920 ) ) ( not ( = ?auto_12909 ?auto_12925 ) ) ( not ( = ?auto_12910 ?auto_12920 ) ) ( not ( = ?auto_12910 ?auto_12925 ) ) ( not ( = ?auto_12911 ?auto_12920 ) ) ( not ( = ?auto_12911 ?auto_12925 ) ) ( not ( = ?auto_12912 ?auto_12920 ) ) ( not ( = ?auto_12912 ?auto_12925 ) ) ( not ( = ?auto_12913 ?auto_12920 ) ) ( not ( = ?auto_12913 ?auto_12925 ) ) ( not ( = ?auto_12914 ?auto_12920 ) ) ( not ( = ?auto_12914 ?auto_12925 ) ) ( not ( = ?auto_12915 ?auto_12920 ) ) ( not ( = ?auto_12915 ?auto_12925 ) ) ( not ( = ?auto_12916 ?auto_12920 ) ) ( not ( = ?auto_12916 ?auto_12925 ) ) ( not ( = ?auto_12917 ?auto_12920 ) ) ( not ( = ?auto_12917 ?auto_12925 ) ) ( not ( = ?auto_12918 ?auto_12920 ) ) ( not ( = ?auto_12918 ?auto_12925 ) ) ( not ( = ?auto_12920 ?auto_12943 ) ) ( not ( = ?auto_12920 ?auto_12929 ) ) ( not ( = ?auto_12920 ?auto_12947 ) ) ( not ( = ?auto_12920 ?auto_12946 ) ) ( not ( = ?auto_12920 ?auto_12945 ) ) ( not ( = ?auto_12920 ?auto_12949 ) ) ( not ( = ?auto_12920 ?auto_12940 ) ) ( not ( = ?auto_12920 ?auto_12948 ) ) ( not ( = ?auto_12920 ?auto_12932 ) ) ( not ( = ?auto_12920 ?auto_12936 ) ) ( not ( = ?auto_12920 ?auto_12938 ) ) ( not ( = ?auto_12925 ?auto_12943 ) ) ( not ( = ?auto_12925 ?auto_12929 ) ) ( not ( = ?auto_12925 ?auto_12947 ) ) ( not ( = ?auto_12925 ?auto_12946 ) ) ( not ( = ?auto_12925 ?auto_12945 ) ) ( not ( = ?auto_12925 ?auto_12949 ) ) ( not ( = ?auto_12925 ?auto_12940 ) ) ( not ( = ?auto_12925 ?auto_12948 ) ) ( not ( = ?auto_12925 ?auto_12932 ) ) ( not ( = ?auto_12925 ?auto_12936 ) ) ( not ( = ?auto_12925 ?auto_12938 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 ?auto_12918 ?auto_12919 )
      ( MAKE-1CRATE ?auto_12919 ?auto_12920 )
      ( MAKE-12CRATE-VERIFY ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 ?auto_12918 ?auto_12919 ?auto_12920 ) )
  )

)

