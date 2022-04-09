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
      ?auto_12410 - SURFACE
      ?auto_12411 - SURFACE
    )
    :vars
    (
      ?auto_12412 - HOIST
      ?auto_12413 - PLACE
      ?auto_12415 - PLACE
      ?auto_12416 - HOIST
      ?auto_12417 - SURFACE
      ?auto_12414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12412 ?auto_12413 ) ( SURFACE-AT ?auto_12410 ?auto_12413 ) ( CLEAR ?auto_12410 ) ( IS-CRATE ?auto_12411 ) ( AVAILABLE ?auto_12412 ) ( not ( = ?auto_12415 ?auto_12413 ) ) ( HOIST-AT ?auto_12416 ?auto_12415 ) ( AVAILABLE ?auto_12416 ) ( SURFACE-AT ?auto_12411 ?auto_12415 ) ( ON ?auto_12411 ?auto_12417 ) ( CLEAR ?auto_12411 ) ( TRUCK-AT ?auto_12414 ?auto_12413 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12417 ) ) ( not ( = ?auto_12411 ?auto_12417 ) ) ( not ( = ?auto_12412 ?auto_12416 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12414 ?auto_12413 ?auto_12415 )
      ( !LIFT ?auto_12416 ?auto_12411 ?auto_12417 ?auto_12415 )
      ( !LOAD ?auto_12416 ?auto_12411 ?auto_12414 ?auto_12415 )
      ( !DRIVE ?auto_12414 ?auto_12415 ?auto_12413 )
      ( !UNLOAD ?auto_12412 ?auto_12411 ?auto_12414 ?auto_12413 )
      ( !DROP ?auto_12412 ?auto_12411 ?auto_12410 ?auto_12413 )
      ( MAKE-1CRATE-VERIFY ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12431 - SURFACE
      ?auto_12432 - SURFACE
      ?auto_12433 - SURFACE
    )
    :vars
    (
      ?auto_12437 - HOIST
      ?auto_12434 - PLACE
      ?auto_12438 - PLACE
      ?auto_12435 - HOIST
      ?auto_12439 - SURFACE
      ?auto_12441 - PLACE
      ?auto_12442 - HOIST
      ?auto_12440 - SURFACE
      ?auto_12436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12437 ?auto_12434 ) ( IS-CRATE ?auto_12433 ) ( not ( = ?auto_12438 ?auto_12434 ) ) ( HOIST-AT ?auto_12435 ?auto_12438 ) ( AVAILABLE ?auto_12435 ) ( SURFACE-AT ?auto_12433 ?auto_12438 ) ( ON ?auto_12433 ?auto_12439 ) ( CLEAR ?auto_12433 ) ( not ( = ?auto_12432 ?auto_12433 ) ) ( not ( = ?auto_12432 ?auto_12439 ) ) ( not ( = ?auto_12433 ?auto_12439 ) ) ( not ( = ?auto_12437 ?auto_12435 ) ) ( SURFACE-AT ?auto_12431 ?auto_12434 ) ( CLEAR ?auto_12431 ) ( IS-CRATE ?auto_12432 ) ( AVAILABLE ?auto_12437 ) ( not ( = ?auto_12441 ?auto_12434 ) ) ( HOIST-AT ?auto_12442 ?auto_12441 ) ( AVAILABLE ?auto_12442 ) ( SURFACE-AT ?auto_12432 ?auto_12441 ) ( ON ?auto_12432 ?auto_12440 ) ( CLEAR ?auto_12432 ) ( TRUCK-AT ?auto_12436 ?auto_12434 ) ( not ( = ?auto_12431 ?auto_12432 ) ) ( not ( = ?auto_12431 ?auto_12440 ) ) ( not ( = ?auto_12432 ?auto_12440 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( not ( = ?auto_12431 ?auto_12433 ) ) ( not ( = ?auto_12431 ?auto_12439 ) ) ( not ( = ?auto_12433 ?auto_12440 ) ) ( not ( = ?auto_12438 ?auto_12441 ) ) ( not ( = ?auto_12435 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12431 ?auto_12432 )
      ( MAKE-1CRATE ?auto_12432 ?auto_12433 )
      ( MAKE-2CRATE-VERIFY ?auto_12431 ?auto_12432 ?auto_12433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12457 - SURFACE
      ?auto_12458 - SURFACE
      ?auto_12459 - SURFACE
      ?auto_12460 - SURFACE
    )
    :vars
    (
      ?auto_12466 - HOIST
      ?auto_12465 - PLACE
      ?auto_12463 - PLACE
      ?auto_12462 - HOIST
      ?auto_12461 - SURFACE
      ?auto_12472 - PLACE
      ?auto_12471 - HOIST
      ?auto_12467 - SURFACE
      ?auto_12469 - PLACE
      ?auto_12470 - HOIST
      ?auto_12468 - SURFACE
      ?auto_12464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12466 ?auto_12465 ) ( IS-CRATE ?auto_12460 ) ( not ( = ?auto_12463 ?auto_12465 ) ) ( HOIST-AT ?auto_12462 ?auto_12463 ) ( AVAILABLE ?auto_12462 ) ( SURFACE-AT ?auto_12460 ?auto_12463 ) ( ON ?auto_12460 ?auto_12461 ) ( CLEAR ?auto_12460 ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( not ( = ?auto_12466 ?auto_12462 ) ) ( IS-CRATE ?auto_12459 ) ( not ( = ?auto_12472 ?auto_12465 ) ) ( HOIST-AT ?auto_12471 ?auto_12472 ) ( AVAILABLE ?auto_12471 ) ( SURFACE-AT ?auto_12459 ?auto_12472 ) ( ON ?auto_12459 ?auto_12467 ) ( CLEAR ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12458 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12471 ) ) ( SURFACE-AT ?auto_12457 ?auto_12465 ) ( CLEAR ?auto_12457 ) ( IS-CRATE ?auto_12458 ) ( AVAILABLE ?auto_12466 ) ( not ( = ?auto_12469 ?auto_12465 ) ) ( HOIST-AT ?auto_12470 ?auto_12469 ) ( AVAILABLE ?auto_12470 ) ( SURFACE-AT ?auto_12458 ?auto_12469 ) ( ON ?auto_12458 ?auto_12468 ) ( CLEAR ?auto_12458 ) ( TRUCK-AT ?auto_12464 ?auto_12465 ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12457 ?auto_12468 ) ) ( not ( = ?auto_12458 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12470 ) ) ( not ( = ?auto_12457 ?auto_12459 ) ) ( not ( = ?auto_12457 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12468 ) ) ( not ( = ?auto_12472 ?auto_12469 ) ) ( not ( = ?auto_12471 ?auto_12470 ) ) ( not ( = ?auto_12467 ?auto_12468 ) ) ( not ( = ?auto_12457 ?auto_12460 ) ) ( not ( = ?auto_12457 ?auto_12461 ) ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( not ( = ?auto_12458 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12467 ) ) ( not ( = ?auto_12460 ?auto_12468 ) ) ( not ( = ?auto_12463 ?auto_12472 ) ) ( not ( = ?auto_12463 ?auto_12469 ) ) ( not ( = ?auto_12462 ?auto_12471 ) ) ( not ( = ?auto_12462 ?auto_12470 ) ) ( not ( = ?auto_12461 ?auto_12467 ) ) ( not ( = ?auto_12461 ?auto_12468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12457 ?auto_12458 ?auto_12459 )
      ( MAKE-1CRATE ?auto_12459 ?auto_12460 )
      ( MAKE-3CRATE-VERIFY ?auto_12457 ?auto_12458 ?auto_12459 ?auto_12460 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12488 - SURFACE
      ?auto_12489 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12491 - SURFACE
      ?auto_12492 - SURFACE
    )
    :vars
    (
      ?auto_12497 - HOIST
      ?auto_12494 - PLACE
      ?auto_12496 - PLACE
      ?auto_12493 - HOIST
      ?auto_12498 - SURFACE
      ?auto_12503 - PLACE
      ?auto_12507 - HOIST
      ?auto_12506 - SURFACE
      ?auto_12500 - PLACE
      ?auto_12501 - HOIST
      ?auto_12499 - SURFACE
      ?auto_12504 - PLACE
      ?auto_12505 - HOIST
      ?auto_12502 - SURFACE
      ?auto_12495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12497 ?auto_12494 ) ( IS-CRATE ?auto_12492 ) ( not ( = ?auto_12496 ?auto_12494 ) ) ( HOIST-AT ?auto_12493 ?auto_12496 ) ( AVAILABLE ?auto_12493 ) ( SURFACE-AT ?auto_12492 ?auto_12496 ) ( ON ?auto_12492 ?auto_12498 ) ( CLEAR ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12498 ) ) ( not ( = ?auto_12492 ?auto_12498 ) ) ( not ( = ?auto_12497 ?auto_12493 ) ) ( IS-CRATE ?auto_12491 ) ( not ( = ?auto_12503 ?auto_12494 ) ) ( HOIST-AT ?auto_12507 ?auto_12503 ) ( AVAILABLE ?auto_12507 ) ( SURFACE-AT ?auto_12491 ?auto_12503 ) ( ON ?auto_12491 ?auto_12506 ) ( CLEAR ?auto_12491 ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12506 ) ) ( not ( = ?auto_12491 ?auto_12506 ) ) ( not ( = ?auto_12497 ?auto_12507 ) ) ( IS-CRATE ?auto_12490 ) ( not ( = ?auto_12500 ?auto_12494 ) ) ( HOIST-AT ?auto_12501 ?auto_12500 ) ( AVAILABLE ?auto_12501 ) ( SURFACE-AT ?auto_12490 ?auto_12500 ) ( ON ?auto_12490 ?auto_12499 ) ( CLEAR ?auto_12490 ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12499 ) ) ( not ( = ?auto_12490 ?auto_12499 ) ) ( not ( = ?auto_12497 ?auto_12501 ) ) ( SURFACE-AT ?auto_12488 ?auto_12494 ) ( CLEAR ?auto_12488 ) ( IS-CRATE ?auto_12489 ) ( AVAILABLE ?auto_12497 ) ( not ( = ?auto_12504 ?auto_12494 ) ) ( HOIST-AT ?auto_12505 ?auto_12504 ) ( AVAILABLE ?auto_12505 ) ( SURFACE-AT ?auto_12489 ?auto_12504 ) ( ON ?auto_12489 ?auto_12502 ) ( CLEAR ?auto_12489 ) ( TRUCK-AT ?auto_12495 ?auto_12494 ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12502 ) ) ( not ( = ?auto_12489 ?auto_12502 ) ) ( not ( = ?auto_12497 ?auto_12505 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12499 ) ) ( not ( = ?auto_12490 ?auto_12502 ) ) ( not ( = ?auto_12500 ?auto_12504 ) ) ( not ( = ?auto_12501 ?auto_12505 ) ) ( not ( = ?auto_12499 ?auto_12502 ) ) ( not ( = ?auto_12488 ?auto_12491 ) ) ( not ( = ?auto_12488 ?auto_12506 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12506 ) ) ( not ( = ?auto_12491 ?auto_12499 ) ) ( not ( = ?auto_12491 ?auto_12502 ) ) ( not ( = ?auto_12503 ?auto_12500 ) ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( not ( = ?auto_12507 ?auto_12501 ) ) ( not ( = ?auto_12507 ?auto_12505 ) ) ( not ( = ?auto_12506 ?auto_12499 ) ) ( not ( = ?auto_12506 ?auto_12502 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12498 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12498 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12498 ) ) ( not ( = ?auto_12492 ?auto_12506 ) ) ( not ( = ?auto_12492 ?auto_12499 ) ) ( not ( = ?auto_12492 ?auto_12502 ) ) ( not ( = ?auto_12496 ?auto_12503 ) ) ( not ( = ?auto_12496 ?auto_12500 ) ) ( not ( = ?auto_12496 ?auto_12504 ) ) ( not ( = ?auto_12493 ?auto_12507 ) ) ( not ( = ?auto_12493 ?auto_12501 ) ) ( not ( = ?auto_12493 ?auto_12505 ) ) ( not ( = ?auto_12498 ?auto_12506 ) ) ( not ( = ?auto_12498 ?auto_12499 ) ) ( not ( = ?auto_12498 ?auto_12502 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 )
      ( MAKE-1CRATE ?auto_12491 ?auto_12492 )
      ( MAKE-4CRATE-VERIFY ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12524 - SURFACE
      ?auto_12525 - SURFACE
      ?auto_12526 - SURFACE
      ?auto_12527 - SURFACE
      ?auto_12528 - SURFACE
      ?auto_12529 - SURFACE
    )
    :vars
    (
      ?auto_12534 - HOIST
      ?auto_12533 - PLACE
      ?auto_12532 - PLACE
      ?auto_12530 - HOIST
      ?auto_12535 - SURFACE
      ?auto_12547 - PLACE
      ?auto_12546 - HOIST
      ?auto_12542 - SURFACE
      ?auto_12539 - PLACE
      ?auto_12540 - HOIST
      ?auto_12536 - SURFACE
      ?auto_12544 - PLACE
      ?auto_12545 - HOIST
      ?auto_12541 - SURFACE
      ?auto_12538 - PLACE
      ?auto_12537 - HOIST
      ?auto_12543 - SURFACE
      ?auto_12531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12534 ?auto_12533 ) ( IS-CRATE ?auto_12529 ) ( not ( = ?auto_12532 ?auto_12533 ) ) ( HOIST-AT ?auto_12530 ?auto_12532 ) ( AVAILABLE ?auto_12530 ) ( SURFACE-AT ?auto_12529 ?auto_12532 ) ( ON ?auto_12529 ?auto_12535 ) ( CLEAR ?auto_12529 ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12535 ) ) ( not ( = ?auto_12529 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12530 ) ) ( IS-CRATE ?auto_12528 ) ( not ( = ?auto_12547 ?auto_12533 ) ) ( HOIST-AT ?auto_12546 ?auto_12547 ) ( AVAILABLE ?auto_12546 ) ( SURFACE-AT ?auto_12528 ?auto_12547 ) ( ON ?auto_12528 ?auto_12542 ) ( CLEAR ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12528 ) ) ( not ( = ?auto_12527 ?auto_12542 ) ) ( not ( = ?auto_12528 ?auto_12542 ) ) ( not ( = ?auto_12534 ?auto_12546 ) ) ( IS-CRATE ?auto_12527 ) ( not ( = ?auto_12539 ?auto_12533 ) ) ( HOIST-AT ?auto_12540 ?auto_12539 ) ( AVAILABLE ?auto_12540 ) ( SURFACE-AT ?auto_12527 ?auto_12539 ) ( ON ?auto_12527 ?auto_12536 ) ( CLEAR ?auto_12527 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12536 ) ) ( not ( = ?auto_12527 ?auto_12536 ) ) ( not ( = ?auto_12534 ?auto_12540 ) ) ( IS-CRATE ?auto_12526 ) ( not ( = ?auto_12544 ?auto_12533 ) ) ( HOIST-AT ?auto_12545 ?auto_12544 ) ( AVAILABLE ?auto_12545 ) ( SURFACE-AT ?auto_12526 ?auto_12544 ) ( ON ?auto_12526 ?auto_12541 ) ( CLEAR ?auto_12526 ) ( not ( = ?auto_12525 ?auto_12526 ) ) ( not ( = ?auto_12525 ?auto_12541 ) ) ( not ( = ?auto_12526 ?auto_12541 ) ) ( not ( = ?auto_12534 ?auto_12545 ) ) ( SURFACE-AT ?auto_12524 ?auto_12533 ) ( CLEAR ?auto_12524 ) ( IS-CRATE ?auto_12525 ) ( AVAILABLE ?auto_12534 ) ( not ( = ?auto_12538 ?auto_12533 ) ) ( HOIST-AT ?auto_12537 ?auto_12538 ) ( AVAILABLE ?auto_12537 ) ( SURFACE-AT ?auto_12525 ?auto_12538 ) ( ON ?auto_12525 ?auto_12543 ) ( CLEAR ?auto_12525 ) ( TRUCK-AT ?auto_12531 ?auto_12533 ) ( not ( = ?auto_12524 ?auto_12525 ) ) ( not ( = ?auto_12524 ?auto_12543 ) ) ( not ( = ?auto_12525 ?auto_12543 ) ) ( not ( = ?auto_12534 ?auto_12537 ) ) ( not ( = ?auto_12524 ?auto_12526 ) ) ( not ( = ?auto_12524 ?auto_12541 ) ) ( not ( = ?auto_12526 ?auto_12543 ) ) ( not ( = ?auto_12544 ?auto_12538 ) ) ( not ( = ?auto_12545 ?auto_12537 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( not ( = ?auto_12524 ?auto_12527 ) ) ( not ( = ?auto_12524 ?auto_12536 ) ) ( not ( = ?auto_12525 ?auto_12527 ) ) ( not ( = ?auto_12525 ?auto_12536 ) ) ( not ( = ?auto_12527 ?auto_12541 ) ) ( not ( = ?auto_12527 ?auto_12543 ) ) ( not ( = ?auto_12539 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12538 ) ) ( not ( = ?auto_12540 ?auto_12545 ) ) ( not ( = ?auto_12540 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12541 ) ) ( not ( = ?auto_12536 ?auto_12543 ) ) ( not ( = ?auto_12524 ?auto_12528 ) ) ( not ( = ?auto_12524 ?auto_12542 ) ) ( not ( = ?auto_12525 ?auto_12528 ) ) ( not ( = ?auto_12525 ?auto_12542 ) ) ( not ( = ?auto_12526 ?auto_12528 ) ) ( not ( = ?auto_12526 ?auto_12542 ) ) ( not ( = ?auto_12528 ?auto_12536 ) ) ( not ( = ?auto_12528 ?auto_12541 ) ) ( not ( = ?auto_12528 ?auto_12543 ) ) ( not ( = ?auto_12547 ?auto_12539 ) ) ( not ( = ?auto_12547 ?auto_12544 ) ) ( not ( = ?auto_12547 ?auto_12538 ) ) ( not ( = ?auto_12546 ?auto_12540 ) ) ( not ( = ?auto_12546 ?auto_12545 ) ) ( not ( = ?auto_12546 ?auto_12537 ) ) ( not ( = ?auto_12542 ?auto_12536 ) ) ( not ( = ?auto_12542 ?auto_12541 ) ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12524 ?auto_12529 ) ) ( not ( = ?auto_12524 ?auto_12535 ) ) ( not ( = ?auto_12525 ?auto_12529 ) ) ( not ( = ?auto_12525 ?auto_12535 ) ) ( not ( = ?auto_12526 ?auto_12529 ) ) ( not ( = ?auto_12526 ?auto_12535 ) ) ( not ( = ?auto_12527 ?auto_12529 ) ) ( not ( = ?auto_12527 ?auto_12535 ) ) ( not ( = ?auto_12529 ?auto_12542 ) ) ( not ( = ?auto_12529 ?auto_12536 ) ) ( not ( = ?auto_12529 ?auto_12541 ) ) ( not ( = ?auto_12529 ?auto_12543 ) ) ( not ( = ?auto_12532 ?auto_12547 ) ) ( not ( = ?auto_12532 ?auto_12539 ) ) ( not ( = ?auto_12532 ?auto_12544 ) ) ( not ( = ?auto_12532 ?auto_12538 ) ) ( not ( = ?auto_12530 ?auto_12546 ) ) ( not ( = ?auto_12530 ?auto_12540 ) ) ( not ( = ?auto_12530 ?auto_12545 ) ) ( not ( = ?auto_12530 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12542 ) ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12541 ) ) ( not ( = ?auto_12535 ?auto_12543 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12524 ?auto_12525 ?auto_12526 ?auto_12527 ?auto_12528 )
      ( MAKE-1CRATE ?auto_12528 ?auto_12529 )
      ( MAKE-5CRATE-VERIFY ?auto_12524 ?auto_12525 ?auto_12526 ?auto_12527 ?auto_12528 ?auto_12529 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12565 - SURFACE
      ?auto_12566 - SURFACE
      ?auto_12567 - SURFACE
      ?auto_12568 - SURFACE
      ?auto_12569 - SURFACE
      ?auto_12570 - SURFACE
      ?auto_12571 - SURFACE
    )
    :vars
    (
      ?auto_12575 - HOIST
      ?auto_12573 - PLACE
      ?auto_12577 - PLACE
      ?auto_12576 - HOIST
      ?auto_12572 - SURFACE
      ?auto_12592 - PLACE
      ?auto_12588 - HOIST
      ?auto_12587 - SURFACE
      ?auto_12591 - PLACE
      ?auto_12578 - HOIST
      ?auto_12579 - SURFACE
      ?auto_12583 - PLACE
      ?auto_12581 - HOIST
      ?auto_12589 - SURFACE
      ?auto_12582 - PLACE
      ?auto_12590 - HOIST
      ?auto_12580 - SURFACE
      ?auto_12586 - PLACE
      ?auto_12585 - HOIST
      ?auto_12584 - SURFACE
      ?auto_12574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12575 ?auto_12573 ) ( IS-CRATE ?auto_12571 ) ( not ( = ?auto_12577 ?auto_12573 ) ) ( HOIST-AT ?auto_12576 ?auto_12577 ) ( AVAILABLE ?auto_12576 ) ( SURFACE-AT ?auto_12571 ?auto_12577 ) ( ON ?auto_12571 ?auto_12572 ) ( CLEAR ?auto_12571 ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( IS-CRATE ?auto_12570 ) ( not ( = ?auto_12592 ?auto_12573 ) ) ( HOIST-AT ?auto_12588 ?auto_12592 ) ( AVAILABLE ?auto_12588 ) ( SURFACE-AT ?auto_12570 ?auto_12592 ) ( ON ?auto_12570 ?auto_12587 ) ( CLEAR ?auto_12570 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12587 ) ) ( not ( = ?auto_12570 ?auto_12587 ) ) ( not ( = ?auto_12575 ?auto_12588 ) ) ( IS-CRATE ?auto_12569 ) ( not ( = ?auto_12591 ?auto_12573 ) ) ( HOIST-AT ?auto_12578 ?auto_12591 ) ( AVAILABLE ?auto_12578 ) ( SURFACE-AT ?auto_12569 ?auto_12591 ) ( ON ?auto_12569 ?auto_12579 ) ( CLEAR ?auto_12569 ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12579 ) ) ( not ( = ?auto_12569 ?auto_12579 ) ) ( not ( = ?auto_12575 ?auto_12578 ) ) ( IS-CRATE ?auto_12568 ) ( not ( = ?auto_12583 ?auto_12573 ) ) ( HOIST-AT ?auto_12581 ?auto_12583 ) ( AVAILABLE ?auto_12581 ) ( SURFACE-AT ?auto_12568 ?auto_12583 ) ( ON ?auto_12568 ?auto_12589 ) ( CLEAR ?auto_12568 ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12589 ) ) ( not ( = ?auto_12568 ?auto_12589 ) ) ( not ( = ?auto_12575 ?auto_12581 ) ) ( IS-CRATE ?auto_12567 ) ( not ( = ?auto_12582 ?auto_12573 ) ) ( HOIST-AT ?auto_12590 ?auto_12582 ) ( AVAILABLE ?auto_12590 ) ( SURFACE-AT ?auto_12567 ?auto_12582 ) ( ON ?auto_12567 ?auto_12580 ) ( CLEAR ?auto_12567 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12566 ?auto_12580 ) ) ( not ( = ?auto_12567 ?auto_12580 ) ) ( not ( = ?auto_12575 ?auto_12590 ) ) ( SURFACE-AT ?auto_12565 ?auto_12573 ) ( CLEAR ?auto_12565 ) ( IS-CRATE ?auto_12566 ) ( AVAILABLE ?auto_12575 ) ( not ( = ?auto_12586 ?auto_12573 ) ) ( HOIST-AT ?auto_12585 ?auto_12586 ) ( AVAILABLE ?auto_12585 ) ( SURFACE-AT ?auto_12566 ?auto_12586 ) ( ON ?auto_12566 ?auto_12584 ) ( CLEAR ?auto_12566 ) ( TRUCK-AT ?auto_12574 ?auto_12573 ) ( not ( = ?auto_12565 ?auto_12566 ) ) ( not ( = ?auto_12565 ?auto_12584 ) ) ( not ( = ?auto_12566 ?auto_12584 ) ) ( not ( = ?auto_12575 ?auto_12585 ) ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12580 ) ) ( not ( = ?auto_12567 ?auto_12584 ) ) ( not ( = ?auto_12582 ?auto_12586 ) ) ( not ( = ?auto_12590 ?auto_12585 ) ) ( not ( = ?auto_12580 ?auto_12584 ) ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( not ( = ?auto_12565 ?auto_12589 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12589 ) ) ( not ( = ?auto_12568 ?auto_12580 ) ) ( not ( = ?auto_12568 ?auto_12584 ) ) ( not ( = ?auto_12583 ?auto_12582 ) ) ( not ( = ?auto_12583 ?auto_12586 ) ) ( not ( = ?auto_12581 ?auto_12590 ) ) ( not ( = ?auto_12581 ?auto_12585 ) ) ( not ( = ?auto_12589 ?auto_12580 ) ) ( not ( = ?auto_12589 ?auto_12584 ) ) ( not ( = ?auto_12565 ?auto_12569 ) ) ( not ( = ?auto_12565 ?auto_12579 ) ) ( not ( = ?auto_12566 ?auto_12569 ) ) ( not ( = ?auto_12566 ?auto_12579 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12579 ) ) ( not ( = ?auto_12569 ?auto_12589 ) ) ( not ( = ?auto_12569 ?auto_12580 ) ) ( not ( = ?auto_12569 ?auto_12584 ) ) ( not ( = ?auto_12591 ?auto_12583 ) ) ( not ( = ?auto_12591 ?auto_12582 ) ) ( not ( = ?auto_12591 ?auto_12586 ) ) ( not ( = ?auto_12578 ?auto_12581 ) ) ( not ( = ?auto_12578 ?auto_12590 ) ) ( not ( = ?auto_12578 ?auto_12585 ) ) ( not ( = ?auto_12579 ?auto_12589 ) ) ( not ( = ?auto_12579 ?auto_12580 ) ) ( not ( = ?auto_12579 ?auto_12584 ) ) ( not ( = ?auto_12565 ?auto_12570 ) ) ( not ( = ?auto_12565 ?auto_12587 ) ) ( not ( = ?auto_12566 ?auto_12570 ) ) ( not ( = ?auto_12566 ?auto_12587 ) ) ( not ( = ?auto_12567 ?auto_12570 ) ) ( not ( = ?auto_12567 ?auto_12587 ) ) ( not ( = ?auto_12568 ?auto_12570 ) ) ( not ( = ?auto_12568 ?auto_12587 ) ) ( not ( = ?auto_12570 ?auto_12579 ) ) ( not ( = ?auto_12570 ?auto_12589 ) ) ( not ( = ?auto_12570 ?auto_12580 ) ) ( not ( = ?auto_12570 ?auto_12584 ) ) ( not ( = ?auto_12592 ?auto_12591 ) ) ( not ( = ?auto_12592 ?auto_12583 ) ) ( not ( = ?auto_12592 ?auto_12582 ) ) ( not ( = ?auto_12592 ?auto_12586 ) ) ( not ( = ?auto_12588 ?auto_12578 ) ) ( not ( = ?auto_12588 ?auto_12581 ) ) ( not ( = ?auto_12588 ?auto_12590 ) ) ( not ( = ?auto_12588 ?auto_12585 ) ) ( not ( = ?auto_12587 ?auto_12579 ) ) ( not ( = ?auto_12587 ?auto_12589 ) ) ( not ( = ?auto_12587 ?auto_12580 ) ) ( not ( = ?auto_12587 ?auto_12584 ) ) ( not ( = ?auto_12565 ?auto_12571 ) ) ( not ( = ?auto_12565 ?auto_12572 ) ) ( not ( = ?auto_12566 ?auto_12571 ) ) ( not ( = ?auto_12566 ?auto_12572 ) ) ( not ( = ?auto_12567 ?auto_12571 ) ) ( not ( = ?auto_12567 ?auto_12572 ) ) ( not ( = ?auto_12568 ?auto_12571 ) ) ( not ( = ?auto_12568 ?auto_12572 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12569 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12587 ) ) ( not ( = ?auto_12571 ?auto_12579 ) ) ( not ( = ?auto_12571 ?auto_12589 ) ) ( not ( = ?auto_12571 ?auto_12580 ) ) ( not ( = ?auto_12571 ?auto_12584 ) ) ( not ( = ?auto_12577 ?auto_12592 ) ) ( not ( = ?auto_12577 ?auto_12591 ) ) ( not ( = ?auto_12577 ?auto_12583 ) ) ( not ( = ?auto_12577 ?auto_12582 ) ) ( not ( = ?auto_12577 ?auto_12586 ) ) ( not ( = ?auto_12576 ?auto_12588 ) ) ( not ( = ?auto_12576 ?auto_12578 ) ) ( not ( = ?auto_12576 ?auto_12581 ) ) ( not ( = ?auto_12576 ?auto_12590 ) ) ( not ( = ?auto_12576 ?auto_12585 ) ) ( not ( = ?auto_12572 ?auto_12587 ) ) ( not ( = ?auto_12572 ?auto_12579 ) ) ( not ( = ?auto_12572 ?auto_12589 ) ) ( not ( = ?auto_12572 ?auto_12580 ) ) ( not ( = ?auto_12572 ?auto_12584 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12565 ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 )
      ( MAKE-1CRATE ?auto_12570 ?auto_12571 )
      ( MAKE-6CRATE-VERIFY ?auto_12565 ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12571 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12611 - SURFACE
      ?auto_12612 - SURFACE
      ?auto_12613 - SURFACE
      ?auto_12614 - SURFACE
      ?auto_12615 - SURFACE
      ?auto_12616 - SURFACE
      ?auto_12617 - SURFACE
      ?auto_12618 - SURFACE
    )
    :vars
    (
      ?auto_12623 - HOIST
      ?auto_12622 - PLACE
      ?auto_12621 - PLACE
      ?auto_12619 - HOIST
      ?auto_12624 - SURFACE
      ?auto_12640 - PLACE
      ?auto_12637 - HOIST
      ?auto_12641 - SURFACE
      ?auto_12639 - PLACE
      ?auto_12627 - HOIST
      ?auto_12628 - SURFACE
      ?auto_12631 - PLACE
      ?auto_12638 - HOIST
      ?auto_12625 - SURFACE
      ?auto_12634 - PLACE
      ?auto_12642 - HOIST
      ?auto_12629 - SURFACE
      ?auto_12635 - PLACE
      ?auto_12630 - HOIST
      ?auto_12636 - SURFACE
      ?auto_12626 - PLACE
      ?auto_12632 - HOIST
      ?auto_12633 - SURFACE
      ?auto_12620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12623 ?auto_12622 ) ( IS-CRATE ?auto_12618 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( HOIST-AT ?auto_12619 ?auto_12621 ) ( AVAILABLE ?auto_12619 ) ( SURFACE-AT ?auto_12618 ?auto_12621 ) ( ON ?auto_12618 ?auto_12624 ) ( CLEAR ?auto_12618 ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12624 ) ) ( not ( = ?auto_12618 ?auto_12624 ) ) ( not ( = ?auto_12623 ?auto_12619 ) ) ( IS-CRATE ?auto_12617 ) ( not ( = ?auto_12640 ?auto_12622 ) ) ( HOIST-AT ?auto_12637 ?auto_12640 ) ( AVAILABLE ?auto_12637 ) ( SURFACE-AT ?auto_12617 ?auto_12640 ) ( ON ?auto_12617 ?auto_12641 ) ( CLEAR ?auto_12617 ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12616 ?auto_12641 ) ) ( not ( = ?auto_12617 ?auto_12641 ) ) ( not ( = ?auto_12623 ?auto_12637 ) ) ( IS-CRATE ?auto_12616 ) ( not ( = ?auto_12639 ?auto_12622 ) ) ( HOIST-AT ?auto_12627 ?auto_12639 ) ( AVAILABLE ?auto_12627 ) ( SURFACE-AT ?auto_12616 ?auto_12639 ) ( ON ?auto_12616 ?auto_12628 ) ( CLEAR ?auto_12616 ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12628 ) ) ( not ( = ?auto_12616 ?auto_12628 ) ) ( not ( = ?auto_12623 ?auto_12627 ) ) ( IS-CRATE ?auto_12615 ) ( not ( = ?auto_12631 ?auto_12622 ) ) ( HOIST-AT ?auto_12638 ?auto_12631 ) ( AVAILABLE ?auto_12638 ) ( SURFACE-AT ?auto_12615 ?auto_12631 ) ( ON ?auto_12615 ?auto_12625 ) ( CLEAR ?auto_12615 ) ( not ( = ?auto_12614 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12625 ) ) ( not ( = ?auto_12615 ?auto_12625 ) ) ( not ( = ?auto_12623 ?auto_12638 ) ) ( IS-CRATE ?auto_12614 ) ( not ( = ?auto_12634 ?auto_12622 ) ) ( HOIST-AT ?auto_12642 ?auto_12634 ) ( AVAILABLE ?auto_12642 ) ( SURFACE-AT ?auto_12614 ?auto_12634 ) ( ON ?auto_12614 ?auto_12629 ) ( CLEAR ?auto_12614 ) ( not ( = ?auto_12613 ?auto_12614 ) ) ( not ( = ?auto_12613 ?auto_12629 ) ) ( not ( = ?auto_12614 ?auto_12629 ) ) ( not ( = ?auto_12623 ?auto_12642 ) ) ( IS-CRATE ?auto_12613 ) ( not ( = ?auto_12635 ?auto_12622 ) ) ( HOIST-AT ?auto_12630 ?auto_12635 ) ( AVAILABLE ?auto_12630 ) ( SURFACE-AT ?auto_12613 ?auto_12635 ) ( ON ?auto_12613 ?auto_12636 ) ( CLEAR ?auto_12613 ) ( not ( = ?auto_12612 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12636 ) ) ( not ( = ?auto_12613 ?auto_12636 ) ) ( not ( = ?auto_12623 ?auto_12630 ) ) ( SURFACE-AT ?auto_12611 ?auto_12622 ) ( CLEAR ?auto_12611 ) ( IS-CRATE ?auto_12612 ) ( AVAILABLE ?auto_12623 ) ( not ( = ?auto_12626 ?auto_12622 ) ) ( HOIST-AT ?auto_12632 ?auto_12626 ) ( AVAILABLE ?auto_12632 ) ( SURFACE-AT ?auto_12612 ?auto_12626 ) ( ON ?auto_12612 ?auto_12633 ) ( CLEAR ?auto_12612 ) ( TRUCK-AT ?auto_12620 ?auto_12622 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12611 ?auto_12633 ) ) ( not ( = ?auto_12612 ?auto_12633 ) ) ( not ( = ?auto_12623 ?auto_12632 ) ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( not ( = ?auto_12611 ?auto_12636 ) ) ( not ( = ?auto_12613 ?auto_12633 ) ) ( not ( = ?auto_12635 ?auto_12626 ) ) ( not ( = ?auto_12630 ?auto_12632 ) ) ( not ( = ?auto_12636 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12614 ) ) ( not ( = ?auto_12611 ?auto_12629 ) ) ( not ( = ?auto_12612 ?auto_12614 ) ) ( not ( = ?auto_12612 ?auto_12629 ) ) ( not ( = ?auto_12614 ?auto_12636 ) ) ( not ( = ?auto_12614 ?auto_12633 ) ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12626 ) ) ( not ( = ?auto_12642 ?auto_12630 ) ) ( not ( = ?auto_12642 ?auto_12632 ) ) ( not ( = ?auto_12629 ?auto_12636 ) ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12615 ) ) ( not ( = ?auto_12611 ?auto_12625 ) ) ( not ( = ?auto_12612 ?auto_12615 ) ) ( not ( = ?auto_12612 ?auto_12625 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12625 ) ) ( not ( = ?auto_12615 ?auto_12629 ) ) ( not ( = ?auto_12615 ?auto_12636 ) ) ( not ( = ?auto_12615 ?auto_12633 ) ) ( not ( = ?auto_12631 ?auto_12634 ) ) ( not ( = ?auto_12631 ?auto_12635 ) ) ( not ( = ?auto_12631 ?auto_12626 ) ) ( not ( = ?auto_12638 ?auto_12642 ) ) ( not ( = ?auto_12638 ?auto_12630 ) ) ( not ( = ?auto_12638 ?auto_12632 ) ) ( not ( = ?auto_12625 ?auto_12629 ) ) ( not ( = ?auto_12625 ?auto_12636 ) ) ( not ( = ?auto_12625 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12616 ) ) ( not ( = ?auto_12611 ?auto_12628 ) ) ( not ( = ?auto_12612 ?auto_12616 ) ) ( not ( = ?auto_12612 ?auto_12628 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12628 ) ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( not ( = ?auto_12614 ?auto_12628 ) ) ( not ( = ?auto_12616 ?auto_12625 ) ) ( not ( = ?auto_12616 ?auto_12629 ) ) ( not ( = ?auto_12616 ?auto_12636 ) ) ( not ( = ?auto_12616 ?auto_12633 ) ) ( not ( = ?auto_12639 ?auto_12631 ) ) ( not ( = ?auto_12639 ?auto_12634 ) ) ( not ( = ?auto_12639 ?auto_12635 ) ) ( not ( = ?auto_12639 ?auto_12626 ) ) ( not ( = ?auto_12627 ?auto_12638 ) ) ( not ( = ?auto_12627 ?auto_12642 ) ) ( not ( = ?auto_12627 ?auto_12630 ) ) ( not ( = ?auto_12627 ?auto_12632 ) ) ( not ( = ?auto_12628 ?auto_12625 ) ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12628 ?auto_12636 ) ) ( not ( = ?auto_12628 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12617 ) ) ( not ( = ?auto_12611 ?auto_12641 ) ) ( not ( = ?auto_12612 ?auto_12617 ) ) ( not ( = ?auto_12612 ?auto_12641 ) ) ( not ( = ?auto_12613 ?auto_12617 ) ) ( not ( = ?auto_12613 ?auto_12641 ) ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12614 ?auto_12641 ) ) ( not ( = ?auto_12615 ?auto_12617 ) ) ( not ( = ?auto_12615 ?auto_12641 ) ) ( not ( = ?auto_12617 ?auto_12628 ) ) ( not ( = ?auto_12617 ?auto_12625 ) ) ( not ( = ?auto_12617 ?auto_12629 ) ) ( not ( = ?auto_12617 ?auto_12636 ) ) ( not ( = ?auto_12617 ?auto_12633 ) ) ( not ( = ?auto_12640 ?auto_12639 ) ) ( not ( = ?auto_12640 ?auto_12631 ) ) ( not ( = ?auto_12640 ?auto_12634 ) ) ( not ( = ?auto_12640 ?auto_12635 ) ) ( not ( = ?auto_12640 ?auto_12626 ) ) ( not ( = ?auto_12637 ?auto_12627 ) ) ( not ( = ?auto_12637 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12642 ) ) ( not ( = ?auto_12637 ?auto_12630 ) ) ( not ( = ?auto_12637 ?auto_12632 ) ) ( not ( = ?auto_12641 ?auto_12628 ) ) ( not ( = ?auto_12641 ?auto_12625 ) ) ( not ( = ?auto_12641 ?auto_12629 ) ) ( not ( = ?auto_12641 ?auto_12636 ) ) ( not ( = ?auto_12641 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12618 ) ) ( not ( = ?auto_12611 ?auto_12624 ) ) ( not ( = ?auto_12612 ?auto_12618 ) ) ( not ( = ?auto_12612 ?auto_12624 ) ) ( not ( = ?auto_12613 ?auto_12618 ) ) ( not ( = ?auto_12613 ?auto_12624 ) ) ( not ( = ?auto_12614 ?auto_12618 ) ) ( not ( = ?auto_12614 ?auto_12624 ) ) ( not ( = ?auto_12615 ?auto_12618 ) ) ( not ( = ?auto_12615 ?auto_12624 ) ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12624 ) ) ( not ( = ?auto_12618 ?auto_12641 ) ) ( not ( = ?auto_12618 ?auto_12628 ) ) ( not ( = ?auto_12618 ?auto_12625 ) ) ( not ( = ?auto_12618 ?auto_12629 ) ) ( not ( = ?auto_12618 ?auto_12636 ) ) ( not ( = ?auto_12618 ?auto_12633 ) ) ( not ( = ?auto_12621 ?auto_12640 ) ) ( not ( = ?auto_12621 ?auto_12639 ) ) ( not ( = ?auto_12621 ?auto_12631 ) ) ( not ( = ?auto_12621 ?auto_12634 ) ) ( not ( = ?auto_12621 ?auto_12635 ) ) ( not ( = ?auto_12621 ?auto_12626 ) ) ( not ( = ?auto_12619 ?auto_12637 ) ) ( not ( = ?auto_12619 ?auto_12627 ) ) ( not ( = ?auto_12619 ?auto_12638 ) ) ( not ( = ?auto_12619 ?auto_12642 ) ) ( not ( = ?auto_12619 ?auto_12630 ) ) ( not ( = ?auto_12619 ?auto_12632 ) ) ( not ( = ?auto_12624 ?auto_12641 ) ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( not ( = ?auto_12624 ?auto_12625 ) ) ( not ( = ?auto_12624 ?auto_12629 ) ) ( not ( = ?auto_12624 ?auto_12636 ) ) ( not ( = ?auto_12624 ?auto_12633 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12611 ?auto_12612 ?auto_12613 ?auto_12614 ?auto_12615 ?auto_12616 ?auto_12617 )
      ( MAKE-1CRATE ?auto_12617 ?auto_12618 )
      ( MAKE-7CRATE-VERIFY ?auto_12611 ?auto_12612 ?auto_12613 ?auto_12614 ?auto_12615 ?auto_12616 ?auto_12617 ?auto_12618 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12662 - SURFACE
      ?auto_12663 - SURFACE
      ?auto_12664 - SURFACE
      ?auto_12665 - SURFACE
      ?auto_12666 - SURFACE
      ?auto_12667 - SURFACE
      ?auto_12668 - SURFACE
      ?auto_12669 - SURFACE
      ?auto_12670 - SURFACE
    )
    :vars
    (
      ?auto_12675 - HOIST
      ?auto_12676 - PLACE
      ?auto_12672 - PLACE
      ?auto_12671 - HOIST
      ?auto_12674 - SURFACE
      ?auto_12681 - PLACE
      ?auto_12695 - HOIST
      ?auto_12677 - SURFACE
      ?auto_12692 - PLACE
      ?auto_12679 - HOIST
      ?auto_12697 - SURFACE
      ?auto_12690 - PLACE
      ?auto_12689 - HOIST
      ?auto_12687 - SURFACE
      ?auto_12684 - PLACE
      ?auto_12682 - HOIST
      ?auto_12691 - SURFACE
      ?auto_12680 - PLACE
      ?auto_12696 - HOIST
      ?auto_12686 - SURFACE
      ?auto_12694 - PLACE
      ?auto_12685 - HOIST
      ?auto_12678 - SURFACE
      ?auto_12688 - PLACE
      ?auto_12683 - HOIST
      ?auto_12693 - SURFACE
      ?auto_12673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12675 ?auto_12676 ) ( IS-CRATE ?auto_12670 ) ( not ( = ?auto_12672 ?auto_12676 ) ) ( HOIST-AT ?auto_12671 ?auto_12672 ) ( AVAILABLE ?auto_12671 ) ( SURFACE-AT ?auto_12670 ?auto_12672 ) ( ON ?auto_12670 ?auto_12674 ) ( CLEAR ?auto_12670 ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( not ( = ?auto_12669 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12674 ) ) ( not ( = ?auto_12675 ?auto_12671 ) ) ( IS-CRATE ?auto_12669 ) ( not ( = ?auto_12681 ?auto_12676 ) ) ( HOIST-AT ?auto_12695 ?auto_12681 ) ( AVAILABLE ?auto_12695 ) ( SURFACE-AT ?auto_12669 ?auto_12681 ) ( ON ?auto_12669 ?auto_12677 ) ( CLEAR ?auto_12669 ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12668 ?auto_12677 ) ) ( not ( = ?auto_12669 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12695 ) ) ( IS-CRATE ?auto_12668 ) ( not ( = ?auto_12692 ?auto_12676 ) ) ( HOIST-AT ?auto_12679 ?auto_12692 ) ( AVAILABLE ?auto_12679 ) ( SURFACE-AT ?auto_12668 ?auto_12692 ) ( ON ?auto_12668 ?auto_12697 ) ( CLEAR ?auto_12668 ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12667 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12697 ) ) ( not ( = ?auto_12675 ?auto_12679 ) ) ( IS-CRATE ?auto_12667 ) ( not ( = ?auto_12690 ?auto_12676 ) ) ( HOIST-AT ?auto_12689 ?auto_12690 ) ( AVAILABLE ?auto_12689 ) ( SURFACE-AT ?auto_12667 ?auto_12690 ) ( ON ?auto_12667 ?auto_12687 ) ( CLEAR ?auto_12667 ) ( not ( = ?auto_12666 ?auto_12667 ) ) ( not ( = ?auto_12666 ?auto_12687 ) ) ( not ( = ?auto_12667 ?auto_12687 ) ) ( not ( = ?auto_12675 ?auto_12689 ) ) ( IS-CRATE ?auto_12666 ) ( not ( = ?auto_12684 ?auto_12676 ) ) ( HOIST-AT ?auto_12682 ?auto_12684 ) ( AVAILABLE ?auto_12682 ) ( SURFACE-AT ?auto_12666 ?auto_12684 ) ( ON ?auto_12666 ?auto_12691 ) ( CLEAR ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12665 ?auto_12691 ) ) ( not ( = ?auto_12666 ?auto_12691 ) ) ( not ( = ?auto_12675 ?auto_12682 ) ) ( IS-CRATE ?auto_12665 ) ( not ( = ?auto_12680 ?auto_12676 ) ) ( HOIST-AT ?auto_12696 ?auto_12680 ) ( AVAILABLE ?auto_12696 ) ( SURFACE-AT ?auto_12665 ?auto_12680 ) ( ON ?auto_12665 ?auto_12686 ) ( CLEAR ?auto_12665 ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12686 ) ) ( not ( = ?auto_12665 ?auto_12686 ) ) ( not ( = ?auto_12675 ?auto_12696 ) ) ( IS-CRATE ?auto_12664 ) ( not ( = ?auto_12694 ?auto_12676 ) ) ( HOIST-AT ?auto_12685 ?auto_12694 ) ( AVAILABLE ?auto_12685 ) ( SURFACE-AT ?auto_12664 ?auto_12694 ) ( ON ?auto_12664 ?auto_12678 ) ( CLEAR ?auto_12664 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( not ( = ?auto_12663 ?auto_12678 ) ) ( not ( = ?auto_12664 ?auto_12678 ) ) ( not ( = ?auto_12675 ?auto_12685 ) ) ( SURFACE-AT ?auto_12662 ?auto_12676 ) ( CLEAR ?auto_12662 ) ( IS-CRATE ?auto_12663 ) ( AVAILABLE ?auto_12675 ) ( not ( = ?auto_12688 ?auto_12676 ) ) ( HOIST-AT ?auto_12683 ?auto_12688 ) ( AVAILABLE ?auto_12683 ) ( SURFACE-AT ?auto_12663 ?auto_12688 ) ( ON ?auto_12663 ?auto_12693 ) ( CLEAR ?auto_12663 ) ( TRUCK-AT ?auto_12673 ?auto_12676 ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( not ( = ?auto_12662 ?auto_12693 ) ) ( not ( = ?auto_12663 ?auto_12693 ) ) ( not ( = ?auto_12675 ?auto_12683 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) ( not ( = ?auto_12662 ?auto_12678 ) ) ( not ( = ?auto_12664 ?auto_12693 ) ) ( not ( = ?auto_12694 ?auto_12688 ) ) ( not ( = ?auto_12685 ?auto_12683 ) ) ( not ( = ?auto_12678 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12665 ) ) ( not ( = ?auto_12662 ?auto_12686 ) ) ( not ( = ?auto_12663 ?auto_12665 ) ) ( not ( = ?auto_12663 ?auto_12686 ) ) ( not ( = ?auto_12665 ?auto_12678 ) ) ( not ( = ?auto_12665 ?auto_12693 ) ) ( not ( = ?auto_12680 ?auto_12694 ) ) ( not ( = ?auto_12680 ?auto_12688 ) ) ( not ( = ?auto_12696 ?auto_12685 ) ) ( not ( = ?auto_12696 ?auto_12683 ) ) ( not ( = ?auto_12686 ?auto_12678 ) ) ( not ( = ?auto_12686 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12666 ) ) ( not ( = ?auto_12662 ?auto_12691 ) ) ( not ( = ?auto_12663 ?auto_12666 ) ) ( not ( = ?auto_12663 ?auto_12691 ) ) ( not ( = ?auto_12664 ?auto_12666 ) ) ( not ( = ?auto_12664 ?auto_12691 ) ) ( not ( = ?auto_12666 ?auto_12686 ) ) ( not ( = ?auto_12666 ?auto_12678 ) ) ( not ( = ?auto_12666 ?auto_12693 ) ) ( not ( = ?auto_12684 ?auto_12680 ) ) ( not ( = ?auto_12684 ?auto_12694 ) ) ( not ( = ?auto_12684 ?auto_12688 ) ) ( not ( = ?auto_12682 ?auto_12696 ) ) ( not ( = ?auto_12682 ?auto_12685 ) ) ( not ( = ?auto_12682 ?auto_12683 ) ) ( not ( = ?auto_12691 ?auto_12686 ) ) ( not ( = ?auto_12691 ?auto_12678 ) ) ( not ( = ?auto_12691 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12667 ) ) ( not ( = ?auto_12662 ?auto_12687 ) ) ( not ( = ?auto_12663 ?auto_12667 ) ) ( not ( = ?auto_12663 ?auto_12687 ) ) ( not ( = ?auto_12664 ?auto_12667 ) ) ( not ( = ?auto_12664 ?auto_12687 ) ) ( not ( = ?auto_12665 ?auto_12667 ) ) ( not ( = ?auto_12665 ?auto_12687 ) ) ( not ( = ?auto_12667 ?auto_12691 ) ) ( not ( = ?auto_12667 ?auto_12686 ) ) ( not ( = ?auto_12667 ?auto_12678 ) ) ( not ( = ?auto_12667 ?auto_12693 ) ) ( not ( = ?auto_12690 ?auto_12684 ) ) ( not ( = ?auto_12690 ?auto_12680 ) ) ( not ( = ?auto_12690 ?auto_12694 ) ) ( not ( = ?auto_12690 ?auto_12688 ) ) ( not ( = ?auto_12689 ?auto_12682 ) ) ( not ( = ?auto_12689 ?auto_12696 ) ) ( not ( = ?auto_12689 ?auto_12685 ) ) ( not ( = ?auto_12689 ?auto_12683 ) ) ( not ( = ?auto_12687 ?auto_12691 ) ) ( not ( = ?auto_12687 ?auto_12686 ) ) ( not ( = ?auto_12687 ?auto_12678 ) ) ( not ( = ?auto_12687 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12668 ) ) ( not ( = ?auto_12662 ?auto_12697 ) ) ( not ( = ?auto_12663 ?auto_12668 ) ) ( not ( = ?auto_12663 ?auto_12697 ) ) ( not ( = ?auto_12664 ?auto_12668 ) ) ( not ( = ?auto_12664 ?auto_12697 ) ) ( not ( = ?auto_12665 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12697 ) ) ( not ( = ?auto_12666 ?auto_12668 ) ) ( not ( = ?auto_12666 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12687 ) ) ( not ( = ?auto_12668 ?auto_12691 ) ) ( not ( = ?auto_12668 ?auto_12686 ) ) ( not ( = ?auto_12668 ?auto_12678 ) ) ( not ( = ?auto_12668 ?auto_12693 ) ) ( not ( = ?auto_12692 ?auto_12690 ) ) ( not ( = ?auto_12692 ?auto_12684 ) ) ( not ( = ?auto_12692 ?auto_12680 ) ) ( not ( = ?auto_12692 ?auto_12694 ) ) ( not ( = ?auto_12692 ?auto_12688 ) ) ( not ( = ?auto_12679 ?auto_12689 ) ) ( not ( = ?auto_12679 ?auto_12682 ) ) ( not ( = ?auto_12679 ?auto_12696 ) ) ( not ( = ?auto_12679 ?auto_12685 ) ) ( not ( = ?auto_12679 ?auto_12683 ) ) ( not ( = ?auto_12697 ?auto_12687 ) ) ( not ( = ?auto_12697 ?auto_12691 ) ) ( not ( = ?auto_12697 ?auto_12686 ) ) ( not ( = ?auto_12697 ?auto_12678 ) ) ( not ( = ?auto_12697 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12669 ) ) ( not ( = ?auto_12662 ?auto_12677 ) ) ( not ( = ?auto_12663 ?auto_12669 ) ) ( not ( = ?auto_12663 ?auto_12677 ) ) ( not ( = ?auto_12664 ?auto_12669 ) ) ( not ( = ?auto_12664 ?auto_12677 ) ) ( not ( = ?auto_12665 ?auto_12669 ) ) ( not ( = ?auto_12665 ?auto_12677 ) ) ( not ( = ?auto_12666 ?auto_12669 ) ) ( not ( = ?auto_12666 ?auto_12677 ) ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( not ( = ?auto_12667 ?auto_12677 ) ) ( not ( = ?auto_12669 ?auto_12697 ) ) ( not ( = ?auto_12669 ?auto_12687 ) ) ( not ( = ?auto_12669 ?auto_12691 ) ) ( not ( = ?auto_12669 ?auto_12686 ) ) ( not ( = ?auto_12669 ?auto_12678 ) ) ( not ( = ?auto_12669 ?auto_12693 ) ) ( not ( = ?auto_12681 ?auto_12692 ) ) ( not ( = ?auto_12681 ?auto_12690 ) ) ( not ( = ?auto_12681 ?auto_12684 ) ) ( not ( = ?auto_12681 ?auto_12680 ) ) ( not ( = ?auto_12681 ?auto_12694 ) ) ( not ( = ?auto_12681 ?auto_12688 ) ) ( not ( = ?auto_12695 ?auto_12679 ) ) ( not ( = ?auto_12695 ?auto_12689 ) ) ( not ( = ?auto_12695 ?auto_12682 ) ) ( not ( = ?auto_12695 ?auto_12696 ) ) ( not ( = ?auto_12695 ?auto_12685 ) ) ( not ( = ?auto_12695 ?auto_12683 ) ) ( not ( = ?auto_12677 ?auto_12697 ) ) ( not ( = ?auto_12677 ?auto_12687 ) ) ( not ( = ?auto_12677 ?auto_12691 ) ) ( not ( = ?auto_12677 ?auto_12686 ) ) ( not ( = ?auto_12677 ?auto_12678 ) ) ( not ( = ?auto_12677 ?auto_12693 ) ) ( not ( = ?auto_12662 ?auto_12670 ) ) ( not ( = ?auto_12662 ?auto_12674 ) ) ( not ( = ?auto_12663 ?auto_12670 ) ) ( not ( = ?auto_12663 ?auto_12674 ) ) ( not ( = ?auto_12664 ?auto_12670 ) ) ( not ( = ?auto_12664 ?auto_12674 ) ) ( not ( = ?auto_12665 ?auto_12670 ) ) ( not ( = ?auto_12665 ?auto_12674 ) ) ( not ( = ?auto_12666 ?auto_12670 ) ) ( not ( = ?auto_12666 ?auto_12674 ) ) ( not ( = ?auto_12667 ?auto_12670 ) ) ( not ( = ?auto_12667 ?auto_12674 ) ) ( not ( = ?auto_12668 ?auto_12670 ) ) ( not ( = ?auto_12668 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12677 ) ) ( not ( = ?auto_12670 ?auto_12697 ) ) ( not ( = ?auto_12670 ?auto_12687 ) ) ( not ( = ?auto_12670 ?auto_12691 ) ) ( not ( = ?auto_12670 ?auto_12686 ) ) ( not ( = ?auto_12670 ?auto_12678 ) ) ( not ( = ?auto_12670 ?auto_12693 ) ) ( not ( = ?auto_12672 ?auto_12681 ) ) ( not ( = ?auto_12672 ?auto_12692 ) ) ( not ( = ?auto_12672 ?auto_12690 ) ) ( not ( = ?auto_12672 ?auto_12684 ) ) ( not ( = ?auto_12672 ?auto_12680 ) ) ( not ( = ?auto_12672 ?auto_12694 ) ) ( not ( = ?auto_12672 ?auto_12688 ) ) ( not ( = ?auto_12671 ?auto_12695 ) ) ( not ( = ?auto_12671 ?auto_12679 ) ) ( not ( = ?auto_12671 ?auto_12689 ) ) ( not ( = ?auto_12671 ?auto_12682 ) ) ( not ( = ?auto_12671 ?auto_12696 ) ) ( not ( = ?auto_12671 ?auto_12685 ) ) ( not ( = ?auto_12671 ?auto_12683 ) ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12674 ?auto_12697 ) ) ( not ( = ?auto_12674 ?auto_12687 ) ) ( not ( = ?auto_12674 ?auto_12691 ) ) ( not ( = ?auto_12674 ?auto_12686 ) ) ( not ( = ?auto_12674 ?auto_12678 ) ) ( not ( = ?auto_12674 ?auto_12693 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12662 ?auto_12663 ?auto_12664 ?auto_12665 ?auto_12666 ?auto_12667 ?auto_12668 ?auto_12669 )
      ( MAKE-1CRATE ?auto_12669 ?auto_12670 )
      ( MAKE-8CRATE-VERIFY ?auto_12662 ?auto_12663 ?auto_12664 ?auto_12665 ?auto_12666 ?auto_12667 ?auto_12668 ?auto_12669 ?auto_12670 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12718 - SURFACE
      ?auto_12719 - SURFACE
      ?auto_12720 - SURFACE
      ?auto_12721 - SURFACE
      ?auto_12722 - SURFACE
      ?auto_12723 - SURFACE
      ?auto_12724 - SURFACE
      ?auto_12725 - SURFACE
      ?auto_12726 - SURFACE
      ?auto_12727 - SURFACE
    )
    :vars
    (
      ?auto_12732 - HOIST
      ?auto_12733 - PLACE
      ?auto_12731 - PLACE
      ?auto_12730 - HOIST
      ?auto_12728 - SURFACE
      ?auto_12754 - SURFACE
      ?auto_12742 - PLACE
      ?auto_12746 - HOIST
      ?auto_12750 - SURFACE
      ?auto_12751 - PLACE
      ?auto_12737 - HOIST
      ?auto_12753 - SURFACE
      ?auto_12738 - PLACE
      ?auto_12735 - HOIST
      ?auto_12744 - SURFACE
      ?auto_12739 - PLACE
      ?auto_12741 - HOIST
      ?auto_12743 - SURFACE
      ?auto_12755 - PLACE
      ?auto_12752 - HOIST
      ?auto_12745 - SURFACE
      ?auto_12749 - PLACE
      ?auto_12748 - HOIST
      ?auto_12736 - SURFACE
      ?auto_12734 - PLACE
      ?auto_12740 - HOIST
      ?auto_12747 - SURFACE
      ?auto_12729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12732 ?auto_12733 ) ( IS-CRATE ?auto_12727 ) ( not ( = ?auto_12731 ?auto_12733 ) ) ( HOIST-AT ?auto_12730 ?auto_12731 ) ( SURFACE-AT ?auto_12727 ?auto_12731 ) ( ON ?auto_12727 ?auto_12728 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12728 ) ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( not ( = ?auto_12732 ?auto_12730 ) ) ( IS-CRATE ?auto_12726 ) ( AVAILABLE ?auto_12730 ) ( SURFACE-AT ?auto_12726 ?auto_12731 ) ( ON ?auto_12726 ?auto_12754 ) ( CLEAR ?auto_12726 ) ( not ( = ?auto_12725 ?auto_12726 ) ) ( not ( = ?auto_12725 ?auto_12754 ) ) ( not ( = ?auto_12726 ?auto_12754 ) ) ( IS-CRATE ?auto_12725 ) ( not ( = ?auto_12742 ?auto_12733 ) ) ( HOIST-AT ?auto_12746 ?auto_12742 ) ( AVAILABLE ?auto_12746 ) ( SURFACE-AT ?auto_12725 ?auto_12742 ) ( ON ?auto_12725 ?auto_12750 ) ( CLEAR ?auto_12725 ) ( not ( = ?auto_12724 ?auto_12725 ) ) ( not ( = ?auto_12724 ?auto_12750 ) ) ( not ( = ?auto_12725 ?auto_12750 ) ) ( not ( = ?auto_12732 ?auto_12746 ) ) ( IS-CRATE ?auto_12724 ) ( not ( = ?auto_12751 ?auto_12733 ) ) ( HOIST-AT ?auto_12737 ?auto_12751 ) ( AVAILABLE ?auto_12737 ) ( SURFACE-AT ?auto_12724 ?auto_12751 ) ( ON ?auto_12724 ?auto_12753 ) ( CLEAR ?auto_12724 ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12753 ) ) ( not ( = ?auto_12724 ?auto_12753 ) ) ( not ( = ?auto_12732 ?auto_12737 ) ) ( IS-CRATE ?auto_12723 ) ( not ( = ?auto_12738 ?auto_12733 ) ) ( HOIST-AT ?auto_12735 ?auto_12738 ) ( AVAILABLE ?auto_12735 ) ( SURFACE-AT ?auto_12723 ?auto_12738 ) ( ON ?auto_12723 ?auto_12744 ) ( CLEAR ?auto_12723 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12744 ) ) ( not ( = ?auto_12723 ?auto_12744 ) ) ( not ( = ?auto_12732 ?auto_12735 ) ) ( IS-CRATE ?auto_12722 ) ( not ( = ?auto_12739 ?auto_12733 ) ) ( HOIST-AT ?auto_12741 ?auto_12739 ) ( AVAILABLE ?auto_12741 ) ( SURFACE-AT ?auto_12722 ?auto_12739 ) ( ON ?auto_12722 ?auto_12743 ) ( CLEAR ?auto_12722 ) ( not ( = ?auto_12721 ?auto_12722 ) ) ( not ( = ?auto_12721 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12743 ) ) ( not ( = ?auto_12732 ?auto_12741 ) ) ( IS-CRATE ?auto_12721 ) ( not ( = ?auto_12755 ?auto_12733 ) ) ( HOIST-AT ?auto_12752 ?auto_12755 ) ( AVAILABLE ?auto_12752 ) ( SURFACE-AT ?auto_12721 ?auto_12755 ) ( ON ?auto_12721 ?auto_12745 ) ( CLEAR ?auto_12721 ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( not ( = ?auto_12720 ?auto_12745 ) ) ( not ( = ?auto_12721 ?auto_12745 ) ) ( not ( = ?auto_12732 ?auto_12752 ) ) ( IS-CRATE ?auto_12720 ) ( not ( = ?auto_12749 ?auto_12733 ) ) ( HOIST-AT ?auto_12748 ?auto_12749 ) ( AVAILABLE ?auto_12748 ) ( SURFACE-AT ?auto_12720 ?auto_12749 ) ( ON ?auto_12720 ?auto_12736 ) ( CLEAR ?auto_12720 ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12736 ) ) ( not ( = ?auto_12720 ?auto_12736 ) ) ( not ( = ?auto_12732 ?auto_12748 ) ) ( SURFACE-AT ?auto_12718 ?auto_12733 ) ( CLEAR ?auto_12718 ) ( IS-CRATE ?auto_12719 ) ( AVAILABLE ?auto_12732 ) ( not ( = ?auto_12734 ?auto_12733 ) ) ( HOIST-AT ?auto_12740 ?auto_12734 ) ( AVAILABLE ?auto_12740 ) ( SURFACE-AT ?auto_12719 ?auto_12734 ) ( ON ?auto_12719 ?auto_12747 ) ( CLEAR ?auto_12719 ) ( TRUCK-AT ?auto_12729 ?auto_12733 ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12747 ) ) ( not ( = ?auto_12719 ?auto_12747 ) ) ( not ( = ?auto_12732 ?auto_12740 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12736 ) ) ( not ( = ?auto_12720 ?auto_12747 ) ) ( not ( = ?auto_12749 ?auto_12734 ) ) ( not ( = ?auto_12748 ?auto_12740 ) ) ( not ( = ?auto_12736 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12721 ) ) ( not ( = ?auto_12718 ?auto_12745 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12745 ) ) ( not ( = ?auto_12721 ?auto_12736 ) ) ( not ( = ?auto_12721 ?auto_12747 ) ) ( not ( = ?auto_12755 ?auto_12749 ) ) ( not ( = ?auto_12755 ?auto_12734 ) ) ( not ( = ?auto_12752 ?auto_12748 ) ) ( not ( = ?auto_12752 ?auto_12740 ) ) ( not ( = ?auto_12745 ?auto_12736 ) ) ( not ( = ?auto_12745 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( not ( = ?auto_12718 ?auto_12743 ) ) ( not ( = ?auto_12719 ?auto_12722 ) ) ( not ( = ?auto_12719 ?auto_12743 ) ) ( not ( = ?auto_12720 ?auto_12722 ) ) ( not ( = ?auto_12720 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12745 ) ) ( not ( = ?auto_12722 ?auto_12736 ) ) ( not ( = ?auto_12722 ?auto_12747 ) ) ( not ( = ?auto_12739 ?auto_12755 ) ) ( not ( = ?auto_12739 ?auto_12749 ) ) ( not ( = ?auto_12739 ?auto_12734 ) ) ( not ( = ?auto_12741 ?auto_12752 ) ) ( not ( = ?auto_12741 ?auto_12748 ) ) ( not ( = ?auto_12741 ?auto_12740 ) ) ( not ( = ?auto_12743 ?auto_12745 ) ) ( not ( = ?auto_12743 ?auto_12736 ) ) ( not ( = ?auto_12743 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12723 ) ) ( not ( = ?auto_12718 ?auto_12744 ) ) ( not ( = ?auto_12719 ?auto_12723 ) ) ( not ( = ?auto_12719 ?auto_12744 ) ) ( not ( = ?auto_12720 ?auto_12723 ) ) ( not ( = ?auto_12720 ?auto_12744 ) ) ( not ( = ?auto_12721 ?auto_12723 ) ) ( not ( = ?auto_12721 ?auto_12744 ) ) ( not ( = ?auto_12723 ?auto_12743 ) ) ( not ( = ?auto_12723 ?auto_12745 ) ) ( not ( = ?auto_12723 ?auto_12736 ) ) ( not ( = ?auto_12723 ?auto_12747 ) ) ( not ( = ?auto_12738 ?auto_12739 ) ) ( not ( = ?auto_12738 ?auto_12755 ) ) ( not ( = ?auto_12738 ?auto_12749 ) ) ( not ( = ?auto_12738 ?auto_12734 ) ) ( not ( = ?auto_12735 ?auto_12741 ) ) ( not ( = ?auto_12735 ?auto_12752 ) ) ( not ( = ?auto_12735 ?auto_12748 ) ) ( not ( = ?auto_12735 ?auto_12740 ) ) ( not ( = ?auto_12744 ?auto_12743 ) ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12744 ?auto_12736 ) ) ( not ( = ?auto_12744 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12724 ) ) ( not ( = ?auto_12718 ?auto_12753 ) ) ( not ( = ?auto_12719 ?auto_12724 ) ) ( not ( = ?auto_12719 ?auto_12753 ) ) ( not ( = ?auto_12720 ?auto_12724 ) ) ( not ( = ?auto_12720 ?auto_12753 ) ) ( not ( = ?auto_12721 ?auto_12724 ) ) ( not ( = ?auto_12721 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12753 ) ) ( not ( = ?auto_12724 ?auto_12744 ) ) ( not ( = ?auto_12724 ?auto_12743 ) ) ( not ( = ?auto_12724 ?auto_12745 ) ) ( not ( = ?auto_12724 ?auto_12736 ) ) ( not ( = ?auto_12724 ?auto_12747 ) ) ( not ( = ?auto_12751 ?auto_12738 ) ) ( not ( = ?auto_12751 ?auto_12739 ) ) ( not ( = ?auto_12751 ?auto_12755 ) ) ( not ( = ?auto_12751 ?auto_12749 ) ) ( not ( = ?auto_12751 ?auto_12734 ) ) ( not ( = ?auto_12737 ?auto_12735 ) ) ( not ( = ?auto_12737 ?auto_12741 ) ) ( not ( = ?auto_12737 ?auto_12752 ) ) ( not ( = ?auto_12737 ?auto_12748 ) ) ( not ( = ?auto_12737 ?auto_12740 ) ) ( not ( = ?auto_12753 ?auto_12744 ) ) ( not ( = ?auto_12753 ?auto_12743 ) ) ( not ( = ?auto_12753 ?auto_12745 ) ) ( not ( = ?auto_12753 ?auto_12736 ) ) ( not ( = ?auto_12753 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12725 ) ) ( not ( = ?auto_12718 ?auto_12750 ) ) ( not ( = ?auto_12719 ?auto_12725 ) ) ( not ( = ?auto_12719 ?auto_12750 ) ) ( not ( = ?auto_12720 ?auto_12725 ) ) ( not ( = ?auto_12720 ?auto_12750 ) ) ( not ( = ?auto_12721 ?auto_12725 ) ) ( not ( = ?auto_12721 ?auto_12750 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12750 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12750 ) ) ( not ( = ?auto_12725 ?auto_12753 ) ) ( not ( = ?auto_12725 ?auto_12744 ) ) ( not ( = ?auto_12725 ?auto_12743 ) ) ( not ( = ?auto_12725 ?auto_12745 ) ) ( not ( = ?auto_12725 ?auto_12736 ) ) ( not ( = ?auto_12725 ?auto_12747 ) ) ( not ( = ?auto_12742 ?auto_12751 ) ) ( not ( = ?auto_12742 ?auto_12738 ) ) ( not ( = ?auto_12742 ?auto_12739 ) ) ( not ( = ?auto_12742 ?auto_12755 ) ) ( not ( = ?auto_12742 ?auto_12749 ) ) ( not ( = ?auto_12742 ?auto_12734 ) ) ( not ( = ?auto_12746 ?auto_12737 ) ) ( not ( = ?auto_12746 ?auto_12735 ) ) ( not ( = ?auto_12746 ?auto_12741 ) ) ( not ( = ?auto_12746 ?auto_12752 ) ) ( not ( = ?auto_12746 ?auto_12748 ) ) ( not ( = ?auto_12746 ?auto_12740 ) ) ( not ( = ?auto_12750 ?auto_12753 ) ) ( not ( = ?auto_12750 ?auto_12744 ) ) ( not ( = ?auto_12750 ?auto_12743 ) ) ( not ( = ?auto_12750 ?auto_12745 ) ) ( not ( = ?auto_12750 ?auto_12736 ) ) ( not ( = ?auto_12750 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12726 ) ) ( not ( = ?auto_12718 ?auto_12754 ) ) ( not ( = ?auto_12719 ?auto_12726 ) ) ( not ( = ?auto_12719 ?auto_12754 ) ) ( not ( = ?auto_12720 ?auto_12726 ) ) ( not ( = ?auto_12720 ?auto_12754 ) ) ( not ( = ?auto_12721 ?auto_12726 ) ) ( not ( = ?auto_12721 ?auto_12754 ) ) ( not ( = ?auto_12722 ?auto_12726 ) ) ( not ( = ?auto_12722 ?auto_12754 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12754 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12754 ) ) ( not ( = ?auto_12726 ?auto_12750 ) ) ( not ( = ?auto_12726 ?auto_12753 ) ) ( not ( = ?auto_12726 ?auto_12744 ) ) ( not ( = ?auto_12726 ?auto_12743 ) ) ( not ( = ?auto_12726 ?auto_12745 ) ) ( not ( = ?auto_12726 ?auto_12736 ) ) ( not ( = ?auto_12726 ?auto_12747 ) ) ( not ( = ?auto_12731 ?auto_12742 ) ) ( not ( = ?auto_12731 ?auto_12751 ) ) ( not ( = ?auto_12731 ?auto_12738 ) ) ( not ( = ?auto_12731 ?auto_12739 ) ) ( not ( = ?auto_12731 ?auto_12755 ) ) ( not ( = ?auto_12731 ?auto_12749 ) ) ( not ( = ?auto_12731 ?auto_12734 ) ) ( not ( = ?auto_12730 ?auto_12746 ) ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( not ( = ?auto_12730 ?auto_12735 ) ) ( not ( = ?auto_12730 ?auto_12741 ) ) ( not ( = ?auto_12730 ?auto_12752 ) ) ( not ( = ?auto_12730 ?auto_12748 ) ) ( not ( = ?auto_12730 ?auto_12740 ) ) ( not ( = ?auto_12754 ?auto_12750 ) ) ( not ( = ?auto_12754 ?auto_12753 ) ) ( not ( = ?auto_12754 ?auto_12744 ) ) ( not ( = ?auto_12754 ?auto_12743 ) ) ( not ( = ?auto_12754 ?auto_12745 ) ) ( not ( = ?auto_12754 ?auto_12736 ) ) ( not ( = ?auto_12754 ?auto_12747 ) ) ( not ( = ?auto_12718 ?auto_12727 ) ) ( not ( = ?auto_12718 ?auto_12728 ) ) ( not ( = ?auto_12719 ?auto_12727 ) ) ( not ( = ?auto_12719 ?auto_12728 ) ) ( not ( = ?auto_12720 ?auto_12727 ) ) ( not ( = ?auto_12720 ?auto_12728 ) ) ( not ( = ?auto_12721 ?auto_12727 ) ) ( not ( = ?auto_12721 ?auto_12728 ) ) ( not ( = ?auto_12722 ?auto_12727 ) ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12728 ) ) ( not ( = ?auto_12724 ?auto_12727 ) ) ( not ( = ?auto_12724 ?auto_12728 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12725 ?auto_12728 ) ) ( not ( = ?auto_12727 ?auto_12754 ) ) ( not ( = ?auto_12727 ?auto_12750 ) ) ( not ( = ?auto_12727 ?auto_12753 ) ) ( not ( = ?auto_12727 ?auto_12744 ) ) ( not ( = ?auto_12727 ?auto_12743 ) ) ( not ( = ?auto_12727 ?auto_12745 ) ) ( not ( = ?auto_12727 ?auto_12736 ) ) ( not ( = ?auto_12727 ?auto_12747 ) ) ( not ( = ?auto_12728 ?auto_12754 ) ) ( not ( = ?auto_12728 ?auto_12750 ) ) ( not ( = ?auto_12728 ?auto_12753 ) ) ( not ( = ?auto_12728 ?auto_12744 ) ) ( not ( = ?auto_12728 ?auto_12743 ) ) ( not ( = ?auto_12728 ?auto_12745 ) ) ( not ( = ?auto_12728 ?auto_12736 ) ) ( not ( = ?auto_12728 ?auto_12747 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 )
      ( MAKE-1CRATE ?auto_12726 ?auto_12727 )
      ( MAKE-9CRATE-VERIFY ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ?auto_12727 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12777 - SURFACE
      ?auto_12778 - SURFACE
      ?auto_12779 - SURFACE
      ?auto_12780 - SURFACE
      ?auto_12781 - SURFACE
      ?auto_12782 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
      ?auto_12785 - SURFACE
      ?auto_12786 - SURFACE
      ?auto_12787 - SURFACE
    )
    :vars
    (
      ?auto_12791 - HOIST
      ?auto_12790 - PLACE
      ?auto_12792 - PLACE
      ?auto_12789 - HOIST
      ?auto_12788 - SURFACE
      ?auto_12806 - PLACE
      ?auto_12807 - HOIST
      ?auto_12800 - SURFACE
      ?auto_12803 - SURFACE
      ?auto_12810 - PLACE
      ?auto_12816 - HOIST
      ?auto_12798 - SURFACE
      ?auto_12794 - PLACE
      ?auto_12808 - HOIST
      ?auto_12811 - SURFACE
      ?auto_12797 - PLACE
      ?auto_12815 - HOIST
      ?auto_12801 - SURFACE
      ?auto_12795 - SURFACE
      ?auto_12799 - PLACE
      ?auto_12812 - HOIST
      ?auto_12796 - SURFACE
      ?auto_12813 - PLACE
      ?auto_12805 - HOIST
      ?auto_12802 - SURFACE
      ?auto_12809 - PLACE
      ?auto_12814 - HOIST
      ?auto_12804 - SURFACE
      ?auto_12793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12791 ?auto_12790 ) ( IS-CRATE ?auto_12787 ) ( not ( = ?auto_12792 ?auto_12790 ) ) ( HOIST-AT ?auto_12789 ?auto_12792 ) ( SURFACE-AT ?auto_12787 ?auto_12792 ) ( ON ?auto_12787 ?auto_12788 ) ( CLEAR ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12791 ?auto_12789 ) ) ( IS-CRATE ?auto_12786 ) ( not ( = ?auto_12806 ?auto_12790 ) ) ( HOIST-AT ?auto_12807 ?auto_12806 ) ( SURFACE-AT ?auto_12786 ?auto_12806 ) ( ON ?auto_12786 ?auto_12800 ) ( CLEAR ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12800 ) ) ( not ( = ?auto_12786 ?auto_12800 ) ) ( not ( = ?auto_12791 ?auto_12807 ) ) ( IS-CRATE ?auto_12785 ) ( AVAILABLE ?auto_12807 ) ( SURFACE-AT ?auto_12785 ?auto_12806 ) ( ON ?auto_12785 ?auto_12803 ) ( CLEAR ?auto_12785 ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12803 ) ) ( not ( = ?auto_12785 ?auto_12803 ) ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12810 ?auto_12790 ) ) ( HOIST-AT ?auto_12816 ?auto_12810 ) ( AVAILABLE ?auto_12816 ) ( SURFACE-AT ?auto_12784 ?auto_12810 ) ( ON ?auto_12784 ?auto_12798 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12798 ) ) ( not ( = ?auto_12784 ?auto_12798 ) ) ( not ( = ?auto_12791 ?auto_12816 ) ) ( IS-CRATE ?auto_12783 ) ( not ( = ?auto_12794 ?auto_12790 ) ) ( HOIST-AT ?auto_12808 ?auto_12794 ) ( AVAILABLE ?auto_12808 ) ( SURFACE-AT ?auto_12783 ?auto_12794 ) ( ON ?auto_12783 ?auto_12811 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12811 ) ) ( not ( = ?auto_12783 ?auto_12811 ) ) ( not ( = ?auto_12791 ?auto_12808 ) ) ( IS-CRATE ?auto_12782 ) ( not ( = ?auto_12797 ?auto_12790 ) ) ( HOIST-AT ?auto_12815 ?auto_12797 ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12782 ?auto_12797 ) ( ON ?auto_12782 ?auto_12801 ) ( CLEAR ?auto_12782 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12801 ) ) ( not ( = ?auto_12782 ?auto_12801 ) ) ( not ( = ?auto_12791 ?auto_12815 ) ) ( IS-CRATE ?auto_12781 ) ( AVAILABLE ?auto_12789 ) ( SURFACE-AT ?auto_12781 ?auto_12792 ) ( ON ?auto_12781 ?auto_12795 ) ( CLEAR ?auto_12781 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12795 ) ) ( not ( = ?auto_12781 ?auto_12795 ) ) ( IS-CRATE ?auto_12780 ) ( not ( = ?auto_12799 ?auto_12790 ) ) ( HOIST-AT ?auto_12812 ?auto_12799 ) ( AVAILABLE ?auto_12812 ) ( SURFACE-AT ?auto_12780 ?auto_12799 ) ( ON ?auto_12780 ?auto_12796 ) ( CLEAR ?auto_12780 ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12796 ) ) ( not ( = ?auto_12780 ?auto_12796 ) ) ( not ( = ?auto_12791 ?auto_12812 ) ) ( IS-CRATE ?auto_12779 ) ( not ( = ?auto_12813 ?auto_12790 ) ) ( HOIST-AT ?auto_12805 ?auto_12813 ) ( AVAILABLE ?auto_12805 ) ( SURFACE-AT ?auto_12779 ?auto_12813 ) ( ON ?auto_12779 ?auto_12802 ) ( CLEAR ?auto_12779 ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12802 ) ) ( not ( = ?auto_12779 ?auto_12802 ) ) ( not ( = ?auto_12791 ?auto_12805 ) ) ( SURFACE-AT ?auto_12777 ?auto_12790 ) ( CLEAR ?auto_12777 ) ( IS-CRATE ?auto_12778 ) ( AVAILABLE ?auto_12791 ) ( not ( = ?auto_12809 ?auto_12790 ) ) ( HOIST-AT ?auto_12814 ?auto_12809 ) ( AVAILABLE ?auto_12814 ) ( SURFACE-AT ?auto_12778 ?auto_12809 ) ( ON ?auto_12778 ?auto_12804 ) ( CLEAR ?auto_12778 ) ( TRUCK-AT ?auto_12793 ?auto_12790 ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12804 ) ) ( not ( = ?auto_12778 ?auto_12804 ) ) ( not ( = ?auto_12791 ?auto_12814 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12802 ) ) ( not ( = ?auto_12779 ?auto_12804 ) ) ( not ( = ?auto_12813 ?auto_12809 ) ) ( not ( = ?auto_12805 ?auto_12814 ) ) ( not ( = ?auto_12802 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12780 ) ) ( not ( = ?auto_12777 ?auto_12796 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12796 ) ) ( not ( = ?auto_12780 ?auto_12802 ) ) ( not ( = ?auto_12780 ?auto_12804 ) ) ( not ( = ?auto_12799 ?auto_12813 ) ) ( not ( = ?auto_12799 ?auto_12809 ) ) ( not ( = ?auto_12812 ?auto_12805 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( not ( = ?auto_12796 ?auto_12802 ) ) ( not ( = ?auto_12796 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12781 ) ) ( not ( = ?auto_12777 ?auto_12795 ) ) ( not ( = ?auto_12778 ?auto_12781 ) ) ( not ( = ?auto_12778 ?auto_12795 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12795 ) ) ( not ( = ?auto_12781 ?auto_12796 ) ) ( not ( = ?auto_12781 ?auto_12802 ) ) ( not ( = ?auto_12781 ?auto_12804 ) ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12792 ?auto_12813 ) ) ( not ( = ?auto_12792 ?auto_12809 ) ) ( not ( = ?auto_12789 ?auto_12812 ) ) ( not ( = ?auto_12789 ?auto_12805 ) ) ( not ( = ?auto_12789 ?auto_12814 ) ) ( not ( = ?auto_12795 ?auto_12796 ) ) ( not ( = ?auto_12795 ?auto_12802 ) ) ( not ( = ?auto_12795 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12801 ) ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12778 ?auto_12801 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) ( not ( = ?auto_12779 ?auto_12801 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12801 ) ) ( not ( = ?auto_12782 ?auto_12795 ) ) ( not ( = ?auto_12782 ?auto_12796 ) ) ( not ( = ?auto_12782 ?auto_12802 ) ) ( not ( = ?auto_12782 ?auto_12804 ) ) ( not ( = ?auto_12797 ?auto_12792 ) ) ( not ( = ?auto_12797 ?auto_12799 ) ) ( not ( = ?auto_12797 ?auto_12813 ) ) ( not ( = ?auto_12797 ?auto_12809 ) ) ( not ( = ?auto_12815 ?auto_12789 ) ) ( not ( = ?auto_12815 ?auto_12812 ) ) ( not ( = ?auto_12815 ?auto_12805 ) ) ( not ( = ?auto_12815 ?auto_12814 ) ) ( not ( = ?auto_12801 ?auto_12795 ) ) ( not ( = ?auto_12801 ?auto_12796 ) ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( not ( = ?auto_12801 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12783 ) ) ( not ( = ?auto_12777 ?auto_12811 ) ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12778 ?auto_12811 ) ) ( not ( = ?auto_12779 ?auto_12783 ) ) ( not ( = ?auto_12779 ?auto_12811 ) ) ( not ( = ?auto_12780 ?auto_12783 ) ) ( not ( = ?auto_12780 ?auto_12811 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12811 ) ) ( not ( = ?auto_12783 ?auto_12801 ) ) ( not ( = ?auto_12783 ?auto_12795 ) ) ( not ( = ?auto_12783 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12802 ) ) ( not ( = ?auto_12783 ?auto_12804 ) ) ( not ( = ?auto_12794 ?auto_12797 ) ) ( not ( = ?auto_12794 ?auto_12792 ) ) ( not ( = ?auto_12794 ?auto_12799 ) ) ( not ( = ?auto_12794 ?auto_12813 ) ) ( not ( = ?auto_12794 ?auto_12809 ) ) ( not ( = ?auto_12808 ?auto_12815 ) ) ( not ( = ?auto_12808 ?auto_12789 ) ) ( not ( = ?auto_12808 ?auto_12812 ) ) ( not ( = ?auto_12808 ?auto_12805 ) ) ( not ( = ?auto_12808 ?auto_12814 ) ) ( not ( = ?auto_12811 ?auto_12801 ) ) ( not ( = ?auto_12811 ?auto_12795 ) ) ( not ( = ?auto_12811 ?auto_12796 ) ) ( not ( = ?auto_12811 ?auto_12802 ) ) ( not ( = ?auto_12811 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12784 ) ) ( not ( = ?auto_12777 ?auto_12798 ) ) ( not ( = ?auto_12778 ?auto_12784 ) ) ( not ( = ?auto_12778 ?auto_12798 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12798 ) ) ( not ( = ?auto_12780 ?auto_12784 ) ) ( not ( = ?auto_12780 ?auto_12798 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12798 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12798 ) ) ( not ( = ?auto_12784 ?auto_12811 ) ) ( not ( = ?auto_12784 ?auto_12801 ) ) ( not ( = ?auto_12784 ?auto_12795 ) ) ( not ( = ?auto_12784 ?auto_12796 ) ) ( not ( = ?auto_12784 ?auto_12802 ) ) ( not ( = ?auto_12784 ?auto_12804 ) ) ( not ( = ?auto_12810 ?auto_12794 ) ) ( not ( = ?auto_12810 ?auto_12797 ) ) ( not ( = ?auto_12810 ?auto_12792 ) ) ( not ( = ?auto_12810 ?auto_12799 ) ) ( not ( = ?auto_12810 ?auto_12813 ) ) ( not ( = ?auto_12810 ?auto_12809 ) ) ( not ( = ?auto_12816 ?auto_12808 ) ) ( not ( = ?auto_12816 ?auto_12815 ) ) ( not ( = ?auto_12816 ?auto_12789 ) ) ( not ( = ?auto_12816 ?auto_12812 ) ) ( not ( = ?auto_12816 ?auto_12805 ) ) ( not ( = ?auto_12816 ?auto_12814 ) ) ( not ( = ?auto_12798 ?auto_12811 ) ) ( not ( = ?auto_12798 ?auto_12801 ) ) ( not ( = ?auto_12798 ?auto_12795 ) ) ( not ( = ?auto_12798 ?auto_12796 ) ) ( not ( = ?auto_12798 ?auto_12802 ) ) ( not ( = ?auto_12798 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12785 ) ) ( not ( = ?auto_12777 ?auto_12803 ) ) ( not ( = ?auto_12778 ?auto_12785 ) ) ( not ( = ?auto_12778 ?auto_12803 ) ) ( not ( = ?auto_12779 ?auto_12785 ) ) ( not ( = ?auto_12779 ?auto_12803 ) ) ( not ( = ?auto_12780 ?auto_12785 ) ) ( not ( = ?auto_12780 ?auto_12803 ) ) ( not ( = ?auto_12781 ?auto_12785 ) ) ( not ( = ?auto_12781 ?auto_12803 ) ) ( not ( = ?auto_12782 ?auto_12785 ) ) ( not ( = ?auto_12782 ?auto_12803 ) ) ( not ( = ?auto_12783 ?auto_12785 ) ) ( not ( = ?auto_12783 ?auto_12803 ) ) ( not ( = ?auto_12785 ?auto_12798 ) ) ( not ( = ?auto_12785 ?auto_12811 ) ) ( not ( = ?auto_12785 ?auto_12801 ) ) ( not ( = ?auto_12785 ?auto_12795 ) ) ( not ( = ?auto_12785 ?auto_12796 ) ) ( not ( = ?auto_12785 ?auto_12802 ) ) ( not ( = ?auto_12785 ?auto_12804 ) ) ( not ( = ?auto_12806 ?auto_12810 ) ) ( not ( = ?auto_12806 ?auto_12794 ) ) ( not ( = ?auto_12806 ?auto_12797 ) ) ( not ( = ?auto_12806 ?auto_12792 ) ) ( not ( = ?auto_12806 ?auto_12799 ) ) ( not ( = ?auto_12806 ?auto_12813 ) ) ( not ( = ?auto_12806 ?auto_12809 ) ) ( not ( = ?auto_12807 ?auto_12816 ) ) ( not ( = ?auto_12807 ?auto_12808 ) ) ( not ( = ?auto_12807 ?auto_12815 ) ) ( not ( = ?auto_12807 ?auto_12789 ) ) ( not ( = ?auto_12807 ?auto_12812 ) ) ( not ( = ?auto_12807 ?auto_12805 ) ) ( not ( = ?auto_12807 ?auto_12814 ) ) ( not ( = ?auto_12803 ?auto_12798 ) ) ( not ( = ?auto_12803 ?auto_12811 ) ) ( not ( = ?auto_12803 ?auto_12801 ) ) ( not ( = ?auto_12803 ?auto_12795 ) ) ( not ( = ?auto_12803 ?auto_12796 ) ) ( not ( = ?auto_12803 ?auto_12802 ) ) ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12786 ) ) ( not ( = ?auto_12777 ?auto_12800 ) ) ( not ( = ?auto_12778 ?auto_12786 ) ) ( not ( = ?auto_12778 ?auto_12800 ) ) ( not ( = ?auto_12779 ?auto_12786 ) ) ( not ( = ?auto_12779 ?auto_12800 ) ) ( not ( = ?auto_12780 ?auto_12786 ) ) ( not ( = ?auto_12780 ?auto_12800 ) ) ( not ( = ?auto_12781 ?auto_12786 ) ) ( not ( = ?auto_12781 ?auto_12800 ) ) ( not ( = ?auto_12782 ?auto_12786 ) ) ( not ( = ?auto_12782 ?auto_12800 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12783 ?auto_12800 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12800 ) ) ( not ( = ?auto_12786 ?auto_12803 ) ) ( not ( = ?auto_12786 ?auto_12798 ) ) ( not ( = ?auto_12786 ?auto_12811 ) ) ( not ( = ?auto_12786 ?auto_12801 ) ) ( not ( = ?auto_12786 ?auto_12795 ) ) ( not ( = ?auto_12786 ?auto_12796 ) ) ( not ( = ?auto_12786 ?auto_12802 ) ) ( not ( = ?auto_12786 ?auto_12804 ) ) ( not ( = ?auto_12800 ?auto_12803 ) ) ( not ( = ?auto_12800 ?auto_12798 ) ) ( not ( = ?auto_12800 ?auto_12811 ) ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12795 ) ) ( not ( = ?auto_12800 ?auto_12796 ) ) ( not ( = ?auto_12800 ?auto_12802 ) ) ( not ( = ?auto_12800 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12787 ) ) ( not ( = ?auto_12777 ?auto_12788 ) ) ( not ( = ?auto_12778 ?auto_12787 ) ) ( not ( = ?auto_12778 ?auto_12788 ) ) ( not ( = ?auto_12779 ?auto_12787 ) ) ( not ( = ?auto_12779 ?auto_12788 ) ) ( not ( = ?auto_12780 ?auto_12787 ) ) ( not ( = ?auto_12780 ?auto_12788 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12788 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12782 ?auto_12788 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12783 ?auto_12788 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12788 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12800 ) ) ( not ( = ?auto_12787 ?auto_12803 ) ) ( not ( = ?auto_12787 ?auto_12798 ) ) ( not ( = ?auto_12787 ?auto_12811 ) ) ( not ( = ?auto_12787 ?auto_12801 ) ) ( not ( = ?auto_12787 ?auto_12795 ) ) ( not ( = ?auto_12787 ?auto_12796 ) ) ( not ( = ?auto_12787 ?auto_12802 ) ) ( not ( = ?auto_12787 ?auto_12804 ) ) ( not ( = ?auto_12788 ?auto_12800 ) ) ( not ( = ?auto_12788 ?auto_12803 ) ) ( not ( = ?auto_12788 ?auto_12798 ) ) ( not ( = ?auto_12788 ?auto_12811 ) ) ( not ( = ?auto_12788 ?auto_12801 ) ) ( not ( = ?auto_12788 ?auto_12795 ) ) ( not ( = ?auto_12788 ?auto_12796 ) ) ( not ( = ?auto_12788 ?auto_12802 ) ) ( not ( = ?auto_12788 ?auto_12804 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 )
      ( MAKE-1CRATE ?auto_12786 ?auto_12787 )
      ( MAKE-10CRATE-VERIFY ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12839 - SURFACE
      ?auto_12840 - SURFACE
      ?auto_12841 - SURFACE
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12845 - SURFACE
      ?auto_12846 - SURFACE
      ?auto_12847 - SURFACE
      ?auto_12848 - SURFACE
      ?auto_12849 - SURFACE
      ?auto_12850 - SURFACE
    )
    :vars
    (
      ?auto_12852 - HOIST
      ?auto_12851 - PLACE
      ?auto_12856 - PLACE
      ?auto_12855 - HOIST
      ?auto_12853 - SURFACE
      ?auto_12861 - PLACE
      ?auto_12860 - HOIST
      ?auto_12859 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12868 - HOIST
      ?auto_12867 - SURFACE
      ?auto_12882 - SURFACE
      ?auto_12877 - PLACE
      ?auto_12857 - HOIST
      ?auto_12870 - SURFACE
      ?auto_12879 - PLACE
      ?auto_12869 - HOIST
      ?auto_12873 - SURFACE
      ?auto_12875 - PLACE
      ?auto_12866 - HOIST
      ?auto_12858 - SURFACE
      ?auto_12871 - SURFACE
      ?auto_12862 - PLACE
      ?auto_12878 - HOIST
      ?auto_12876 - SURFACE
      ?auto_12864 - PLACE
      ?auto_12874 - HOIST
      ?auto_12863 - SURFACE
      ?auto_12872 - PLACE
      ?auto_12865 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12852 ?auto_12851 ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12856 ?auto_12851 ) ) ( HOIST-AT ?auto_12855 ?auto_12856 ) ( AVAILABLE ?auto_12855 ) ( SURFACE-AT ?auto_12850 ?auto_12856 ) ( ON ?auto_12850 ?auto_12853 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12853 ) ) ( not ( = ?auto_12850 ?auto_12853 ) ) ( not ( = ?auto_12852 ?auto_12855 ) ) ( IS-CRATE ?auto_12849 ) ( not ( = ?auto_12861 ?auto_12851 ) ) ( HOIST-AT ?auto_12860 ?auto_12861 ) ( SURFACE-AT ?auto_12849 ?auto_12861 ) ( ON ?auto_12849 ?auto_12859 ) ( CLEAR ?auto_12849 ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12859 ) ) ( not ( = ?auto_12849 ?auto_12859 ) ) ( not ( = ?auto_12852 ?auto_12860 ) ) ( IS-CRATE ?auto_12848 ) ( not ( = ?auto_12881 ?auto_12851 ) ) ( HOIST-AT ?auto_12868 ?auto_12881 ) ( SURFACE-AT ?auto_12848 ?auto_12881 ) ( ON ?auto_12848 ?auto_12867 ) ( CLEAR ?auto_12848 ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12867 ) ) ( not ( = ?auto_12848 ?auto_12867 ) ) ( not ( = ?auto_12852 ?auto_12868 ) ) ( IS-CRATE ?auto_12847 ) ( AVAILABLE ?auto_12868 ) ( SURFACE-AT ?auto_12847 ?auto_12881 ) ( ON ?auto_12847 ?auto_12882 ) ( CLEAR ?auto_12847 ) ( not ( = ?auto_12846 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12882 ) ) ( not ( = ?auto_12847 ?auto_12882 ) ) ( IS-CRATE ?auto_12846 ) ( not ( = ?auto_12877 ?auto_12851 ) ) ( HOIST-AT ?auto_12857 ?auto_12877 ) ( AVAILABLE ?auto_12857 ) ( SURFACE-AT ?auto_12846 ?auto_12877 ) ( ON ?auto_12846 ?auto_12870 ) ( CLEAR ?auto_12846 ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( not ( = ?auto_12845 ?auto_12870 ) ) ( not ( = ?auto_12846 ?auto_12870 ) ) ( not ( = ?auto_12852 ?auto_12857 ) ) ( IS-CRATE ?auto_12845 ) ( not ( = ?auto_12879 ?auto_12851 ) ) ( HOIST-AT ?auto_12869 ?auto_12879 ) ( AVAILABLE ?auto_12869 ) ( SURFACE-AT ?auto_12845 ?auto_12879 ) ( ON ?auto_12845 ?auto_12873 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12844 ?auto_12873 ) ) ( not ( = ?auto_12845 ?auto_12873 ) ) ( not ( = ?auto_12852 ?auto_12869 ) ) ( IS-CRATE ?auto_12844 ) ( not ( = ?auto_12875 ?auto_12851 ) ) ( HOIST-AT ?auto_12866 ?auto_12875 ) ( AVAILABLE ?auto_12866 ) ( SURFACE-AT ?auto_12844 ?auto_12875 ) ( ON ?auto_12844 ?auto_12858 ) ( CLEAR ?auto_12844 ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12858 ) ) ( not ( = ?auto_12844 ?auto_12858 ) ) ( not ( = ?auto_12852 ?auto_12866 ) ) ( IS-CRATE ?auto_12843 ) ( AVAILABLE ?auto_12860 ) ( SURFACE-AT ?auto_12843 ?auto_12861 ) ( ON ?auto_12843 ?auto_12871 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12842 ?auto_12871 ) ) ( not ( = ?auto_12843 ?auto_12871 ) ) ( IS-CRATE ?auto_12842 ) ( not ( = ?auto_12862 ?auto_12851 ) ) ( HOIST-AT ?auto_12878 ?auto_12862 ) ( AVAILABLE ?auto_12878 ) ( SURFACE-AT ?auto_12842 ?auto_12862 ) ( ON ?auto_12842 ?auto_12876 ) ( CLEAR ?auto_12842 ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12876 ) ) ( not ( = ?auto_12842 ?auto_12876 ) ) ( not ( = ?auto_12852 ?auto_12878 ) ) ( IS-CRATE ?auto_12841 ) ( not ( = ?auto_12864 ?auto_12851 ) ) ( HOIST-AT ?auto_12874 ?auto_12864 ) ( AVAILABLE ?auto_12874 ) ( SURFACE-AT ?auto_12841 ?auto_12864 ) ( ON ?auto_12841 ?auto_12863 ) ( CLEAR ?auto_12841 ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( not ( = ?auto_12840 ?auto_12863 ) ) ( not ( = ?auto_12841 ?auto_12863 ) ) ( not ( = ?auto_12852 ?auto_12874 ) ) ( SURFACE-AT ?auto_12839 ?auto_12851 ) ( CLEAR ?auto_12839 ) ( IS-CRATE ?auto_12840 ) ( AVAILABLE ?auto_12852 ) ( not ( = ?auto_12872 ?auto_12851 ) ) ( HOIST-AT ?auto_12865 ?auto_12872 ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12840 ?auto_12872 ) ( ON ?auto_12840 ?auto_12880 ) ( CLEAR ?auto_12840 ) ( TRUCK-AT ?auto_12854 ?auto_12851 ) ( not ( = ?auto_12839 ?auto_12840 ) ) ( not ( = ?auto_12839 ?auto_12880 ) ) ( not ( = ?auto_12840 ?auto_12880 ) ) ( not ( = ?auto_12852 ?auto_12865 ) ) ( not ( = ?auto_12839 ?auto_12841 ) ) ( not ( = ?auto_12839 ?auto_12863 ) ) ( not ( = ?auto_12841 ?auto_12880 ) ) ( not ( = ?auto_12864 ?auto_12872 ) ) ( not ( = ?auto_12874 ?auto_12865 ) ) ( not ( = ?auto_12863 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12842 ) ) ( not ( = ?auto_12839 ?auto_12876 ) ) ( not ( = ?auto_12840 ?auto_12842 ) ) ( not ( = ?auto_12840 ?auto_12876 ) ) ( not ( = ?auto_12842 ?auto_12863 ) ) ( not ( = ?auto_12842 ?auto_12880 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12872 ) ) ( not ( = ?auto_12878 ?auto_12874 ) ) ( not ( = ?auto_12878 ?auto_12865 ) ) ( not ( = ?auto_12876 ?auto_12863 ) ) ( not ( = ?auto_12876 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12843 ) ) ( not ( = ?auto_12839 ?auto_12871 ) ) ( not ( = ?auto_12840 ?auto_12843 ) ) ( not ( = ?auto_12840 ?auto_12871 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12871 ) ) ( not ( = ?auto_12843 ?auto_12876 ) ) ( not ( = ?auto_12843 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12880 ) ) ( not ( = ?auto_12861 ?auto_12862 ) ) ( not ( = ?auto_12861 ?auto_12864 ) ) ( not ( = ?auto_12861 ?auto_12872 ) ) ( not ( = ?auto_12860 ?auto_12878 ) ) ( not ( = ?auto_12860 ?auto_12874 ) ) ( not ( = ?auto_12860 ?auto_12865 ) ) ( not ( = ?auto_12871 ?auto_12876 ) ) ( not ( = ?auto_12871 ?auto_12863 ) ) ( not ( = ?auto_12871 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12844 ) ) ( not ( = ?auto_12839 ?auto_12858 ) ) ( not ( = ?auto_12840 ?auto_12844 ) ) ( not ( = ?auto_12840 ?auto_12858 ) ) ( not ( = ?auto_12841 ?auto_12844 ) ) ( not ( = ?auto_12841 ?auto_12858 ) ) ( not ( = ?auto_12842 ?auto_12844 ) ) ( not ( = ?auto_12842 ?auto_12858 ) ) ( not ( = ?auto_12844 ?auto_12871 ) ) ( not ( = ?auto_12844 ?auto_12876 ) ) ( not ( = ?auto_12844 ?auto_12863 ) ) ( not ( = ?auto_12844 ?auto_12880 ) ) ( not ( = ?auto_12875 ?auto_12861 ) ) ( not ( = ?auto_12875 ?auto_12862 ) ) ( not ( = ?auto_12875 ?auto_12864 ) ) ( not ( = ?auto_12875 ?auto_12872 ) ) ( not ( = ?auto_12866 ?auto_12860 ) ) ( not ( = ?auto_12866 ?auto_12878 ) ) ( not ( = ?auto_12866 ?auto_12874 ) ) ( not ( = ?auto_12866 ?auto_12865 ) ) ( not ( = ?auto_12858 ?auto_12871 ) ) ( not ( = ?auto_12858 ?auto_12876 ) ) ( not ( = ?auto_12858 ?auto_12863 ) ) ( not ( = ?auto_12858 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12845 ) ) ( not ( = ?auto_12839 ?auto_12873 ) ) ( not ( = ?auto_12840 ?auto_12845 ) ) ( not ( = ?auto_12840 ?auto_12873 ) ) ( not ( = ?auto_12841 ?auto_12845 ) ) ( not ( = ?auto_12841 ?auto_12873 ) ) ( not ( = ?auto_12842 ?auto_12845 ) ) ( not ( = ?auto_12842 ?auto_12873 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12873 ) ) ( not ( = ?auto_12845 ?auto_12858 ) ) ( not ( = ?auto_12845 ?auto_12871 ) ) ( not ( = ?auto_12845 ?auto_12876 ) ) ( not ( = ?auto_12845 ?auto_12863 ) ) ( not ( = ?auto_12845 ?auto_12880 ) ) ( not ( = ?auto_12879 ?auto_12875 ) ) ( not ( = ?auto_12879 ?auto_12861 ) ) ( not ( = ?auto_12879 ?auto_12862 ) ) ( not ( = ?auto_12879 ?auto_12864 ) ) ( not ( = ?auto_12879 ?auto_12872 ) ) ( not ( = ?auto_12869 ?auto_12866 ) ) ( not ( = ?auto_12869 ?auto_12860 ) ) ( not ( = ?auto_12869 ?auto_12878 ) ) ( not ( = ?auto_12869 ?auto_12874 ) ) ( not ( = ?auto_12869 ?auto_12865 ) ) ( not ( = ?auto_12873 ?auto_12858 ) ) ( not ( = ?auto_12873 ?auto_12871 ) ) ( not ( = ?auto_12873 ?auto_12876 ) ) ( not ( = ?auto_12873 ?auto_12863 ) ) ( not ( = ?auto_12873 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12846 ) ) ( not ( = ?auto_12839 ?auto_12870 ) ) ( not ( = ?auto_12840 ?auto_12846 ) ) ( not ( = ?auto_12840 ?auto_12870 ) ) ( not ( = ?auto_12841 ?auto_12846 ) ) ( not ( = ?auto_12841 ?auto_12870 ) ) ( not ( = ?auto_12842 ?auto_12846 ) ) ( not ( = ?auto_12842 ?auto_12870 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12843 ?auto_12870 ) ) ( not ( = ?auto_12844 ?auto_12846 ) ) ( not ( = ?auto_12844 ?auto_12870 ) ) ( not ( = ?auto_12846 ?auto_12873 ) ) ( not ( = ?auto_12846 ?auto_12858 ) ) ( not ( = ?auto_12846 ?auto_12871 ) ) ( not ( = ?auto_12846 ?auto_12876 ) ) ( not ( = ?auto_12846 ?auto_12863 ) ) ( not ( = ?auto_12846 ?auto_12880 ) ) ( not ( = ?auto_12877 ?auto_12879 ) ) ( not ( = ?auto_12877 ?auto_12875 ) ) ( not ( = ?auto_12877 ?auto_12861 ) ) ( not ( = ?auto_12877 ?auto_12862 ) ) ( not ( = ?auto_12877 ?auto_12864 ) ) ( not ( = ?auto_12877 ?auto_12872 ) ) ( not ( = ?auto_12857 ?auto_12869 ) ) ( not ( = ?auto_12857 ?auto_12866 ) ) ( not ( = ?auto_12857 ?auto_12860 ) ) ( not ( = ?auto_12857 ?auto_12878 ) ) ( not ( = ?auto_12857 ?auto_12874 ) ) ( not ( = ?auto_12857 ?auto_12865 ) ) ( not ( = ?auto_12870 ?auto_12873 ) ) ( not ( = ?auto_12870 ?auto_12858 ) ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( not ( = ?auto_12870 ?auto_12876 ) ) ( not ( = ?auto_12870 ?auto_12863 ) ) ( not ( = ?auto_12870 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12847 ) ) ( not ( = ?auto_12839 ?auto_12882 ) ) ( not ( = ?auto_12840 ?auto_12847 ) ) ( not ( = ?auto_12840 ?auto_12882 ) ) ( not ( = ?auto_12841 ?auto_12847 ) ) ( not ( = ?auto_12841 ?auto_12882 ) ) ( not ( = ?auto_12842 ?auto_12847 ) ) ( not ( = ?auto_12842 ?auto_12882 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12882 ) ) ( not ( = ?auto_12844 ?auto_12847 ) ) ( not ( = ?auto_12844 ?auto_12882 ) ) ( not ( = ?auto_12845 ?auto_12847 ) ) ( not ( = ?auto_12845 ?auto_12882 ) ) ( not ( = ?auto_12847 ?auto_12870 ) ) ( not ( = ?auto_12847 ?auto_12873 ) ) ( not ( = ?auto_12847 ?auto_12858 ) ) ( not ( = ?auto_12847 ?auto_12871 ) ) ( not ( = ?auto_12847 ?auto_12876 ) ) ( not ( = ?auto_12847 ?auto_12863 ) ) ( not ( = ?auto_12847 ?auto_12880 ) ) ( not ( = ?auto_12881 ?auto_12877 ) ) ( not ( = ?auto_12881 ?auto_12879 ) ) ( not ( = ?auto_12881 ?auto_12875 ) ) ( not ( = ?auto_12881 ?auto_12861 ) ) ( not ( = ?auto_12881 ?auto_12862 ) ) ( not ( = ?auto_12881 ?auto_12864 ) ) ( not ( = ?auto_12881 ?auto_12872 ) ) ( not ( = ?auto_12868 ?auto_12857 ) ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12866 ) ) ( not ( = ?auto_12868 ?auto_12860 ) ) ( not ( = ?auto_12868 ?auto_12878 ) ) ( not ( = ?auto_12868 ?auto_12874 ) ) ( not ( = ?auto_12868 ?auto_12865 ) ) ( not ( = ?auto_12882 ?auto_12870 ) ) ( not ( = ?auto_12882 ?auto_12873 ) ) ( not ( = ?auto_12882 ?auto_12858 ) ) ( not ( = ?auto_12882 ?auto_12871 ) ) ( not ( = ?auto_12882 ?auto_12876 ) ) ( not ( = ?auto_12882 ?auto_12863 ) ) ( not ( = ?auto_12882 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12848 ) ) ( not ( = ?auto_12839 ?auto_12867 ) ) ( not ( = ?auto_12840 ?auto_12848 ) ) ( not ( = ?auto_12840 ?auto_12867 ) ) ( not ( = ?auto_12841 ?auto_12848 ) ) ( not ( = ?auto_12841 ?auto_12867 ) ) ( not ( = ?auto_12842 ?auto_12848 ) ) ( not ( = ?auto_12842 ?auto_12867 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12867 ) ) ( not ( = ?auto_12844 ?auto_12848 ) ) ( not ( = ?auto_12844 ?auto_12867 ) ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12867 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12867 ) ) ( not ( = ?auto_12848 ?auto_12882 ) ) ( not ( = ?auto_12848 ?auto_12870 ) ) ( not ( = ?auto_12848 ?auto_12873 ) ) ( not ( = ?auto_12848 ?auto_12858 ) ) ( not ( = ?auto_12848 ?auto_12871 ) ) ( not ( = ?auto_12848 ?auto_12876 ) ) ( not ( = ?auto_12848 ?auto_12863 ) ) ( not ( = ?auto_12848 ?auto_12880 ) ) ( not ( = ?auto_12867 ?auto_12882 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12867 ?auto_12873 ) ) ( not ( = ?auto_12867 ?auto_12858 ) ) ( not ( = ?auto_12867 ?auto_12871 ) ) ( not ( = ?auto_12867 ?auto_12876 ) ) ( not ( = ?auto_12867 ?auto_12863 ) ) ( not ( = ?auto_12867 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12849 ) ) ( not ( = ?auto_12839 ?auto_12859 ) ) ( not ( = ?auto_12840 ?auto_12849 ) ) ( not ( = ?auto_12840 ?auto_12859 ) ) ( not ( = ?auto_12841 ?auto_12849 ) ) ( not ( = ?auto_12841 ?auto_12859 ) ) ( not ( = ?auto_12842 ?auto_12849 ) ) ( not ( = ?auto_12842 ?auto_12859 ) ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12843 ?auto_12859 ) ) ( not ( = ?auto_12844 ?auto_12849 ) ) ( not ( = ?auto_12844 ?auto_12859 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12859 ) ) ( not ( = ?auto_12846 ?auto_12849 ) ) ( not ( = ?auto_12846 ?auto_12859 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12859 ) ) ( not ( = ?auto_12849 ?auto_12867 ) ) ( not ( = ?auto_12849 ?auto_12882 ) ) ( not ( = ?auto_12849 ?auto_12870 ) ) ( not ( = ?auto_12849 ?auto_12873 ) ) ( not ( = ?auto_12849 ?auto_12858 ) ) ( not ( = ?auto_12849 ?auto_12871 ) ) ( not ( = ?auto_12849 ?auto_12876 ) ) ( not ( = ?auto_12849 ?auto_12863 ) ) ( not ( = ?auto_12849 ?auto_12880 ) ) ( not ( = ?auto_12859 ?auto_12867 ) ) ( not ( = ?auto_12859 ?auto_12882 ) ) ( not ( = ?auto_12859 ?auto_12870 ) ) ( not ( = ?auto_12859 ?auto_12873 ) ) ( not ( = ?auto_12859 ?auto_12858 ) ) ( not ( = ?auto_12859 ?auto_12871 ) ) ( not ( = ?auto_12859 ?auto_12876 ) ) ( not ( = ?auto_12859 ?auto_12863 ) ) ( not ( = ?auto_12859 ?auto_12880 ) ) ( not ( = ?auto_12839 ?auto_12850 ) ) ( not ( = ?auto_12839 ?auto_12853 ) ) ( not ( = ?auto_12840 ?auto_12850 ) ) ( not ( = ?auto_12840 ?auto_12853 ) ) ( not ( = ?auto_12841 ?auto_12850 ) ) ( not ( = ?auto_12841 ?auto_12853 ) ) ( not ( = ?auto_12842 ?auto_12850 ) ) ( not ( = ?auto_12842 ?auto_12853 ) ) ( not ( = ?auto_12843 ?auto_12850 ) ) ( not ( = ?auto_12843 ?auto_12853 ) ) ( not ( = ?auto_12844 ?auto_12850 ) ) ( not ( = ?auto_12844 ?auto_12853 ) ) ( not ( = ?auto_12845 ?auto_12850 ) ) ( not ( = ?auto_12845 ?auto_12853 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12853 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12853 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12848 ?auto_12853 ) ) ( not ( = ?auto_12850 ?auto_12859 ) ) ( not ( = ?auto_12850 ?auto_12867 ) ) ( not ( = ?auto_12850 ?auto_12882 ) ) ( not ( = ?auto_12850 ?auto_12870 ) ) ( not ( = ?auto_12850 ?auto_12873 ) ) ( not ( = ?auto_12850 ?auto_12858 ) ) ( not ( = ?auto_12850 ?auto_12871 ) ) ( not ( = ?auto_12850 ?auto_12876 ) ) ( not ( = ?auto_12850 ?auto_12863 ) ) ( not ( = ?auto_12850 ?auto_12880 ) ) ( not ( = ?auto_12856 ?auto_12861 ) ) ( not ( = ?auto_12856 ?auto_12881 ) ) ( not ( = ?auto_12856 ?auto_12877 ) ) ( not ( = ?auto_12856 ?auto_12879 ) ) ( not ( = ?auto_12856 ?auto_12875 ) ) ( not ( = ?auto_12856 ?auto_12862 ) ) ( not ( = ?auto_12856 ?auto_12864 ) ) ( not ( = ?auto_12856 ?auto_12872 ) ) ( not ( = ?auto_12855 ?auto_12860 ) ) ( not ( = ?auto_12855 ?auto_12868 ) ) ( not ( = ?auto_12855 ?auto_12857 ) ) ( not ( = ?auto_12855 ?auto_12869 ) ) ( not ( = ?auto_12855 ?auto_12866 ) ) ( not ( = ?auto_12855 ?auto_12878 ) ) ( not ( = ?auto_12855 ?auto_12874 ) ) ( not ( = ?auto_12855 ?auto_12865 ) ) ( not ( = ?auto_12853 ?auto_12859 ) ) ( not ( = ?auto_12853 ?auto_12867 ) ) ( not ( = ?auto_12853 ?auto_12882 ) ) ( not ( = ?auto_12853 ?auto_12870 ) ) ( not ( = ?auto_12853 ?auto_12873 ) ) ( not ( = ?auto_12853 ?auto_12858 ) ) ( not ( = ?auto_12853 ?auto_12871 ) ) ( not ( = ?auto_12853 ?auto_12876 ) ) ( not ( = ?auto_12853 ?auto_12863 ) ) ( not ( = ?auto_12853 ?auto_12880 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12839 ?auto_12840 ?auto_12841 ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 )
      ( MAKE-1CRATE ?auto_12849 ?auto_12850 )
      ( MAKE-11CRATE-VERIFY ?auto_12839 ?auto_12840 ?auto_12841 ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12850 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12906 - SURFACE
      ?auto_12907 - SURFACE
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
    )
    :vars
    (
      ?auto_12921 - HOIST
      ?auto_12919 - PLACE
      ?auto_12920 - PLACE
      ?auto_12924 - HOIST
      ?auto_12923 - SURFACE
      ?auto_12948 - PLACE
      ?auto_12947 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12938 - PLACE
      ?auto_12949 - HOIST
      ?auto_12925 - SURFACE
      ?auto_12944 - PLACE
      ?auto_12951 - HOIST
      ?auto_12934 - SURFACE
      ?auto_12931 - SURFACE
      ?auto_12940 - PLACE
      ?auto_12950 - HOIST
      ?auto_12939 - SURFACE
      ?auto_12953 - PLACE
      ?auto_12932 - HOIST
      ?auto_12942 - SURFACE
      ?auto_12952 - PLACE
      ?auto_12935 - HOIST
      ?auto_12926 - SURFACE
      ?auto_12927 - SURFACE
      ?auto_12937 - PLACE
      ?auto_12941 - HOIST
      ?auto_12933 - SURFACE
      ?auto_12930 - PLACE
      ?auto_12928 - HOIST
      ?auto_12929 - SURFACE
      ?auto_12943 - PLACE
      ?auto_12936 - HOIST
      ?auto_12945 - SURFACE
      ?auto_12922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12921 ?auto_12919 ) ( IS-CRATE ?auto_12918 ) ( not ( = ?auto_12920 ?auto_12919 ) ) ( HOIST-AT ?auto_12924 ?auto_12920 ) ( AVAILABLE ?auto_12924 ) ( SURFACE-AT ?auto_12918 ?auto_12920 ) ( ON ?auto_12918 ?auto_12923 ) ( CLEAR ?auto_12918 ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12923 ) ) ( not ( = ?auto_12918 ?auto_12923 ) ) ( not ( = ?auto_12921 ?auto_12924 ) ) ( IS-CRATE ?auto_12917 ) ( not ( = ?auto_12948 ?auto_12919 ) ) ( HOIST-AT ?auto_12947 ?auto_12948 ) ( AVAILABLE ?auto_12947 ) ( SURFACE-AT ?auto_12917 ?auto_12948 ) ( ON ?auto_12917 ?auto_12946 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12946 ) ) ( not ( = ?auto_12917 ?auto_12946 ) ) ( not ( = ?auto_12921 ?auto_12947 ) ) ( IS-CRATE ?auto_12916 ) ( not ( = ?auto_12938 ?auto_12919 ) ) ( HOIST-AT ?auto_12949 ?auto_12938 ) ( SURFACE-AT ?auto_12916 ?auto_12938 ) ( ON ?auto_12916 ?auto_12925 ) ( CLEAR ?auto_12916 ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12925 ) ) ( not ( = ?auto_12916 ?auto_12925 ) ) ( not ( = ?auto_12921 ?auto_12949 ) ) ( IS-CRATE ?auto_12915 ) ( not ( = ?auto_12944 ?auto_12919 ) ) ( HOIST-AT ?auto_12951 ?auto_12944 ) ( SURFACE-AT ?auto_12915 ?auto_12944 ) ( ON ?auto_12915 ?auto_12934 ) ( CLEAR ?auto_12915 ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12934 ) ) ( not ( = ?auto_12915 ?auto_12934 ) ) ( not ( = ?auto_12921 ?auto_12951 ) ) ( IS-CRATE ?auto_12914 ) ( AVAILABLE ?auto_12951 ) ( SURFACE-AT ?auto_12914 ?auto_12944 ) ( ON ?auto_12914 ?auto_12931 ) ( CLEAR ?auto_12914 ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12931 ) ) ( not ( = ?auto_12914 ?auto_12931 ) ) ( IS-CRATE ?auto_12913 ) ( not ( = ?auto_12940 ?auto_12919 ) ) ( HOIST-AT ?auto_12950 ?auto_12940 ) ( AVAILABLE ?auto_12950 ) ( SURFACE-AT ?auto_12913 ?auto_12940 ) ( ON ?auto_12913 ?auto_12939 ) ( CLEAR ?auto_12913 ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12939 ) ) ( not ( = ?auto_12913 ?auto_12939 ) ) ( not ( = ?auto_12921 ?auto_12950 ) ) ( IS-CRATE ?auto_12912 ) ( not ( = ?auto_12953 ?auto_12919 ) ) ( HOIST-AT ?auto_12932 ?auto_12953 ) ( AVAILABLE ?auto_12932 ) ( SURFACE-AT ?auto_12912 ?auto_12953 ) ( ON ?auto_12912 ?auto_12942 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12942 ) ) ( not ( = ?auto_12912 ?auto_12942 ) ) ( not ( = ?auto_12921 ?auto_12932 ) ) ( IS-CRATE ?auto_12911 ) ( not ( = ?auto_12952 ?auto_12919 ) ) ( HOIST-AT ?auto_12935 ?auto_12952 ) ( AVAILABLE ?auto_12935 ) ( SURFACE-AT ?auto_12911 ?auto_12952 ) ( ON ?auto_12911 ?auto_12926 ) ( CLEAR ?auto_12911 ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( not ( = ?auto_12910 ?auto_12926 ) ) ( not ( = ?auto_12911 ?auto_12926 ) ) ( not ( = ?auto_12921 ?auto_12935 ) ) ( IS-CRATE ?auto_12910 ) ( AVAILABLE ?auto_12949 ) ( SURFACE-AT ?auto_12910 ?auto_12938 ) ( ON ?auto_12910 ?auto_12927 ) ( CLEAR ?auto_12910 ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12927 ) ) ( not ( = ?auto_12910 ?auto_12927 ) ) ( IS-CRATE ?auto_12909 ) ( not ( = ?auto_12937 ?auto_12919 ) ) ( HOIST-AT ?auto_12941 ?auto_12937 ) ( AVAILABLE ?auto_12941 ) ( SURFACE-AT ?auto_12909 ?auto_12937 ) ( ON ?auto_12909 ?auto_12933 ) ( CLEAR ?auto_12909 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12933 ) ) ( not ( = ?auto_12909 ?auto_12933 ) ) ( not ( = ?auto_12921 ?auto_12941 ) ) ( IS-CRATE ?auto_12908 ) ( not ( = ?auto_12930 ?auto_12919 ) ) ( HOIST-AT ?auto_12928 ?auto_12930 ) ( AVAILABLE ?auto_12928 ) ( SURFACE-AT ?auto_12908 ?auto_12930 ) ( ON ?auto_12908 ?auto_12929 ) ( CLEAR ?auto_12908 ) ( not ( = ?auto_12907 ?auto_12908 ) ) ( not ( = ?auto_12907 ?auto_12929 ) ) ( not ( = ?auto_12908 ?auto_12929 ) ) ( not ( = ?auto_12921 ?auto_12928 ) ) ( SURFACE-AT ?auto_12906 ?auto_12919 ) ( CLEAR ?auto_12906 ) ( IS-CRATE ?auto_12907 ) ( AVAILABLE ?auto_12921 ) ( not ( = ?auto_12943 ?auto_12919 ) ) ( HOIST-AT ?auto_12936 ?auto_12943 ) ( AVAILABLE ?auto_12936 ) ( SURFACE-AT ?auto_12907 ?auto_12943 ) ( ON ?auto_12907 ?auto_12945 ) ( CLEAR ?auto_12907 ) ( TRUCK-AT ?auto_12922 ?auto_12919 ) ( not ( = ?auto_12906 ?auto_12907 ) ) ( not ( = ?auto_12906 ?auto_12945 ) ) ( not ( = ?auto_12907 ?auto_12945 ) ) ( not ( = ?auto_12921 ?auto_12936 ) ) ( not ( = ?auto_12906 ?auto_12908 ) ) ( not ( = ?auto_12906 ?auto_12929 ) ) ( not ( = ?auto_12908 ?auto_12945 ) ) ( not ( = ?auto_12930 ?auto_12943 ) ) ( not ( = ?auto_12928 ?auto_12936 ) ) ( not ( = ?auto_12929 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12909 ) ) ( not ( = ?auto_12906 ?auto_12933 ) ) ( not ( = ?auto_12907 ?auto_12909 ) ) ( not ( = ?auto_12907 ?auto_12933 ) ) ( not ( = ?auto_12909 ?auto_12929 ) ) ( not ( = ?auto_12909 ?auto_12945 ) ) ( not ( = ?auto_12937 ?auto_12930 ) ) ( not ( = ?auto_12937 ?auto_12943 ) ) ( not ( = ?auto_12941 ?auto_12928 ) ) ( not ( = ?auto_12941 ?auto_12936 ) ) ( not ( = ?auto_12933 ?auto_12929 ) ) ( not ( = ?auto_12933 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12910 ) ) ( not ( = ?auto_12906 ?auto_12927 ) ) ( not ( = ?auto_12907 ?auto_12910 ) ) ( not ( = ?auto_12907 ?auto_12927 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12908 ?auto_12927 ) ) ( not ( = ?auto_12910 ?auto_12933 ) ) ( not ( = ?auto_12910 ?auto_12929 ) ) ( not ( = ?auto_12910 ?auto_12945 ) ) ( not ( = ?auto_12938 ?auto_12937 ) ) ( not ( = ?auto_12938 ?auto_12930 ) ) ( not ( = ?auto_12938 ?auto_12943 ) ) ( not ( = ?auto_12949 ?auto_12941 ) ) ( not ( = ?auto_12949 ?auto_12928 ) ) ( not ( = ?auto_12949 ?auto_12936 ) ) ( not ( = ?auto_12927 ?auto_12933 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12911 ) ) ( not ( = ?auto_12906 ?auto_12926 ) ) ( not ( = ?auto_12907 ?auto_12911 ) ) ( not ( = ?auto_12907 ?auto_12926 ) ) ( not ( = ?auto_12908 ?auto_12911 ) ) ( not ( = ?auto_12908 ?auto_12926 ) ) ( not ( = ?auto_12909 ?auto_12911 ) ) ( not ( = ?auto_12909 ?auto_12926 ) ) ( not ( = ?auto_12911 ?auto_12927 ) ) ( not ( = ?auto_12911 ?auto_12933 ) ) ( not ( = ?auto_12911 ?auto_12929 ) ) ( not ( = ?auto_12911 ?auto_12945 ) ) ( not ( = ?auto_12952 ?auto_12938 ) ) ( not ( = ?auto_12952 ?auto_12937 ) ) ( not ( = ?auto_12952 ?auto_12930 ) ) ( not ( = ?auto_12952 ?auto_12943 ) ) ( not ( = ?auto_12935 ?auto_12949 ) ) ( not ( = ?auto_12935 ?auto_12941 ) ) ( not ( = ?auto_12935 ?auto_12928 ) ) ( not ( = ?auto_12935 ?auto_12936 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12933 ) ) ( not ( = ?auto_12926 ?auto_12929 ) ) ( not ( = ?auto_12926 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12912 ) ) ( not ( = ?auto_12906 ?auto_12942 ) ) ( not ( = ?auto_12907 ?auto_12912 ) ) ( not ( = ?auto_12907 ?auto_12942 ) ) ( not ( = ?auto_12908 ?auto_12912 ) ) ( not ( = ?auto_12908 ?auto_12942 ) ) ( not ( = ?auto_12909 ?auto_12912 ) ) ( not ( = ?auto_12909 ?auto_12942 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12942 ) ) ( not ( = ?auto_12912 ?auto_12926 ) ) ( not ( = ?auto_12912 ?auto_12927 ) ) ( not ( = ?auto_12912 ?auto_12933 ) ) ( not ( = ?auto_12912 ?auto_12929 ) ) ( not ( = ?auto_12912 ?auto_12945 ) ) ( not ( = ?auto_12953 ?auto_12952 ) ) ( not ( = ?auto_12953 ?auto_12938 ) ) ( not ( = ?auto_12953 ?auto_12937 ) ) ( not ( = ?auto_12953 ?auto_12930 ) ) ( not ( = ?auto_12953 ?auto_12943 ) ) ( not ( = ?auto_12932 ?auto_12935 ) ) ( not ( = ?auto_12932 ?auto_12949 ) ) ( not ( = ?auto_12932 ?auto_12941 ) ) ( not ( = ?auto_12932 ?auto_12928 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12942 ?auto_12926 ) ) ( not ( = ?auto_12942 ?auto_12927 ) ) ( not ( = ?auto_12942 ?auto_12933 ) ) ( not ( = ?auto_12942 ?auto_12929 ) ) ( not ( = ?auto_12942 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12913 ) ) ( not ( = ?auto_12906 ?auto_12939 ) ) ( not ( = ?auto_12907 ?auto_12913 ) ) ( not ( = ?auto_12907 ?auto_12939 ) ) ( not ( = ?auto_12908 ?auto_12913 ) ) ( not ( = ?auto_12908 ?auto_12939 ) ) ( not ( = ?auto_12909 ?auto_12913 ) ) ( not ( = ?auto_12909 ?auto_12939 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12910 ?auto_12939 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12911 ?auto_12939 ) ) ( not ( = ?auto_12913 ?auto_12942 ) ) ( not ( = ?auto_12913 ?auto_12926 ) ) ( not ( = ?auto_12913 ?auto_12927 ) ) ( not ( = ?auto_12913 ?auto_12933 ) ) ( not ( = ?auto_12913 ?auto_12929 ) ) ( not ( = ?auto_12913 ?auto_12945 ) ) ( not ( = ?auto_12940 ?auto_12953 ) ) ( not ( = ?auto_12940 ?auto_12952 ) ) ( not ( = ?auto_12940 ?auto_12938 ) ) ( not ( = ?auto_12940 ?auto_12937 ) ) ( not ( = ?auto_12940 ?auto_12930 ) ) ( not ( = ?auto_12940 ?auto_12943 ) ) ( not ( = ?auto_12950 ?auto_12932 ) ) ( not ( = ?auto_12950 ?auto_12935 ) ) ( not ( = ?auto_12950 ?auto_12949 ) ) ( not ( = ?auto_12950 ?auto_12941 ) ) ( not ( = ?auto_12950 ?auto_12928 ) ) ( not ( = ?auto_12950 ?auto_12936 ) ) ( not ( = ?auto_12939 ?auto_12942 ) ) ( not ( = ?auto_12939 ?auto_12926 ) ) ( not ( = ?auto_12939 ?auto_12927 ) ) ( not ( = ?auto_12939 ?auto_12933 ) ) ( not ( = ?auto_12939 ?auto_12929 ) ) ( not ( = ?auto_12939 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12914 ) ) ( not ( = ?auto_12906 ?auto_12931 ) ) ( not ( = ?auto_12907 ?auto_12914 ) ) ( not ( = ?auto_12907 ?auto_12931 ) ) ( not ( = ?auto_12908 ?auto_12914 ) ) ( not ( = ?auto_12908 ?auto_12931 ) ) ( not ( = ?auto_12909 ?auto_12914 ) ) ( not ( = ?auto_12909 ?auto_12931 ) ) ( not ( = ?auto_12910 ?auto_12914 ) ) ( not ( = ?auto_12910 ?auto_12931 ) ) ( not ( = ?auto_12911 ?auto_12914 ) ) ( not ( = ?auto_12911 ?auto_12931 ) ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12931 ) ) ( not ( = ?auto_12914 ?auto_12939 ) ) ( not ( = ?auto_12914 ?auto_12942 ) ) ( not ( = ?auto_12914 ?auto_12926 ) ) ( not ( = ?auto_12914 ?auto_12927 ) ) ( not ( = ?auto_12914 ?auto_12933 ) ) ( not ( = ?auto_12914 ?auto_12929 ) ) ( not ( = ?auto_12914 ?auto_12945 ) ) ( not ( = ?auto_12944 ?auto_12940 ) ) ( not ( = ?auto_12944 ?auto_12953 ) ) ( not ( = ?auto_12944 ?auto_12952 ) ) ( not ( = ?auto_12944 ?auto_12938 ) ) ( not ( = ?auto_12944 ?auto_12937 ) ) ( not ( = ?auto_12944 ?auto_12930 ) ) ( not ( = ?auto_12944 ?auto_12943 ) ) ( not ( = ?auto_12951 ?auto_12950 ) ) ( not ( = ?auto_12951 ?auto_12932 ) ) ( not ( = ?auto_12951 ?auto_12935 ) ) ( not ( = ?auto_12951 ?auto_12949 ) ) ( not ( = ?auto_12951 ?auto_12941 ) ) ( not ( = ?auto_12951 ?auto_12928 ) ) ( not ( = ?auto_12951 ?auto_12936 ) ) ( not ( = ?auto_12931 ?auto_12939 ) ) ( not ( = ?auto_12931 ?auto_12942 ) ) ( not ( = ?auto_12931 ?auto_12926 ) ) ( not ( = ?auto_12931 ?auto_12927 ) ) ( not ( = ?auto_12931 ?auto_12933 ) ) ( not ( = ?auto_12931 ?auto_12929 ) ) ( not ( = ?auto_12931 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12915 ) ) ( not ( = ?auto_12906 ?auto_12934 ) ) ( not ( = ?auto_12907 ?auto_12915 ) ) ( not ( = ?auto_12907 ?auto_12934 ) ) ( not ( = ?auto_12908 ?auto_12915 ) ) ( not ( = ?auto_12908 ?auto_12934 ) ) ( not ( = ?auto_12909 ?auto_12915 ) ) ( not ( = ?auto_12909 ?auto_12934 ) ) ( not ( = ?auto_12910 ?auto_12915 ) ) ( not ( = ?auto_12910 ?auto_12934 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12934 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12934 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12934 ) ) ( not ( = ?auto_12915 ?auto_12931 ) ) ( not ( = ?auto_12915 ?auto_12939 ) ) ( not ( = ?auto_12915 ?auto_12942 ) ) ( not ( = ?auto_12915 ?auto_12926 ) ) ( not ( = ?auto_12915 ?auto_12927 ) ) ( not ( = ?auto_12915 ?auto_12933 ) ) ( not ( = ?auto_12915 ?auto_12929 ) ) ( not ( = ?auto_12915 ?auto_12945 ) ) ( not ( = ?auto_12934 ?auto_12931 ) ) ( not ( = ?auto_12934 ?auto_12939 ) ) ( not ( = ?auto_12934 ?auto_12942 ) ) ( not ( = ?auto_12934 ?auto_12926 ) ) ( not ( = ?auto_12934 ?auto_12927 ) ) ( not ( = ?auto_12934 ?auto_12933 ) ) ( not ( = ?auto_12934 ?auto_12929 ) ) ( not ( = ?auto_12934 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12916 ) ) ( not ( = ?auto_12906 ?auto_12925 ) ) ( not ( = ?auto_12907 ?auto_12916 ) ) ( not ( = ?auto_12907 ?auto_12925 ) ) ( not ( = ?auto_12908 ?auto_12916 ) ) ( not ( = ?auto_12908 ?auto_12925 ) ) ( not ( = ?auto_12909 ?auto_12916 ) ) ( not ( = ?auto_12909 ?auto_12925 ) ) ( not ( = ?auto_12910 ?auto_12916 ) ) ( not ( = ?auto_12910 ?auto_12925 ) ) ( not ( = ?auto_12911 ?auto_12916 ) ) ( not ( = ?auto_12911 ?auto_12925 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12925 ) ) ( not ( = ?auto_12913 ?auto_12916 ) ) ( not ( = ?auto_12913 ?auto_12925 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12925 ) ) ( not ( = ?auto_12916 ?auto_12934 ) ) ( not ( = ?auto_12916 ?auto_12931 ) ) ( not ( = ?auto_12916 ?auto_12939 ) ) ( not ( = ?auto_12916 ?auto_12942 ) ) ( not ( = ?auto_12916 ?auto_12926 ) ) ( not ( = ?auto_12916 ?auto_12927 ) ) ( not ( = ?auto_12916 ?auto_12933 ) ) ( not ( = ?auto_12916 ?auto_12929 ) ) ( not ( = ?auto_12916 ?auto_12945 ) ) ( not ( = ?auto_12925 ?auto_12934 ) ) ( not ( = ?auto_12925 ?auto_12931 ) ) ( not ( = ?auto_12925 ?auto_12939 ) ) ( not ( = ?auto_12925 ?auto_12942 ) ) ( not ( = ?auto_12925 ?auto_12926 ) ) ( not ( = ?auto_12925 ?auto_12927 ) ) ( not ( = ?auto_12925 ?auto_12933 ) ) ( not ( = ?auto_12925 ?auto_12929 ) ) ( not ( = ?auto_12925 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12917 ) ) ( not ( = ?auto_12906 ?auto_12946 ) ) ( not ( = ?auto_12907 ?auto_12917 ) ) ( not ( = ?auto_12907 ?auto_12946 ) ) ( not ( = ?auto_12908 ?auto_12917 ) ) ( not ( = ?auto_12908 ?auto_12946 ) ) ( not ( = ?auto_12909 ?auto_12917 ) ) ( not ( = ?auto_12909 ?auto_12946 ) ) ( not ( = ?auto_12910 ?auto_12917 ) ) ( not ( = ?auto_12910 ?auto_12946 ) ) ( not ( = ?auto_12911 ?auto_12917 ) ) ( not ( = ?auto_12911 ?auto_12946 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12912 ?auto_12946 ) ) ( not ( = ?auto_12913 ?auto_12917 ) ) ( not ( = ?auto_12913 ?auto_12946 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12946 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12946 ) ) ( not ( = ?auto_12917 ?auto_12925 ) ) ( not ( = ?auto_12917 ?auto_12934 ) ) ( not ( = ?auto_12917 ?auto_12931 ) ) ( not ( = ?auto_12917 ?auto_12939 ) ) ( not ( = ?auto_12917 ?auto_12942 ) ) ( not ( = ?auto_12917 ?auto_12926 ) ) ( not ( = ?auto_12917 ?auto_12927 ) ) ( not ( = ?auto_12917 ?auto_12933 ) ) ( not ( = ?auto_12917 ?auto_12929 ) ) ( not ( = ?auto_12917 ?auto_12945 ) ) ( not ( = ?auto_12948 ?auto_12938 ) ) ( not ( = ?auto_12948 ?auto_12944 ) ) ( not ( = ?auto_12948 ?auto_12940 ) ) ( not ( = ?auto_12948 ?auto_12953 ) ) ( not ( = ?auto_12948 ?auto_12952 ) ) ( not ( = ?auto_12948 ?auto_12937 ) ) ( not ( = ?auto_12948 ?auto_12930 ) ) ( not ( = ?auto_12948 ?auto_12943 ) ) ( not ( = ?auto_12947 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12951 ) ) ( not ( = ?auto_12947 ?auto_12950 ) ) ( not ( = ?auto_12947 ?auto_12932 ) ) ( not ( = ?auto_12947 ?auto_12935 ) ) ( not ( = ?auto_12947 ?auto_12941 ) ) ( not ( = ?auto_12947 ?auto_12928 ) ) ( not ( = ?auto_12947 ?auto_12936 ) ) ( not ( = ?auto_12946 ?auto_12925 ) ) ( not ( = ?auto_12946 ?auto_12934 ) ) ( not ( = ?auto_12946 ?auto_12931 ) ) ( not ( = ?auto_12946 ?auto_12939 ) ) ( not ( = ?auto_12946 ?auto_12942 ) ) ( not ( = ?auto_12946 ?auto_12926 ) ) ( not ( = ?auto_12946 ?auto_12927 ) ) ( not ( = ?auto_12946 ?auto_12933 ) ) ( not ( = ?auto_12946 ?auto_12929 ) ) ( not ( = ?auto_12946 ?auto_12945 ) ) ( not ( = ?auto_12906 ?auto_12918 ) ) ( not ( = ?auto_12906 ?auto_12923 ) ) ( not ( = ?auto_12907 ?auto_12918 ) ) ( not ( = ?auto_12907 ?auto_12923 ) ) ( not ( = ?auto_12908 ?auto_12918 ) ) ( not ( = ?auto_12908 ?auto_12923 ) ) ( not ( = ?auto_12909 ?auto_12918 ) ) ( not ( = ?auto_12909 ?auto_12923 ) ) ( not ( = ?auto_12910 ?auto_12918 ) ) ( not ( = ?auto_12910 ?auto_12923 ) ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( not ( = ?auto_12911 ?auto_12923 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12923 ) ) ( not ( = ?auto_12913 ?auto_12918 ) ) ( not ( = ?auto_12913 ?auto_12923 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) ( not ( = ?auto_12914 ?auto_12923 ) ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12923 ) ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12923 ) ) ( not ( = ?auto_12918 ?auto_12946 ) ) ( not ( = ?auto_12918 ?auto_12925 ) ) ( not ( = ?auto_12918 ?auto_12934 ) ) ( not ( = ?auto_12918 ?auto_12931 ) ) ( not ( = ?auto_12918 ?auto_12939 ) ) ( not ( = ?auto_12918 ?auto_12942 ) ) ( not ( = ?auto_12918 ?auto_12926 ) ) ( not ( = ?auto_12918 ?auto_12927 ) ) ( not ( = ?auto_12918 ?auto_12933 ) ) ( not ( = ?auto_12918 ?auto_12929 ) ) ( not ( = ?auto_12918 ?auto_12945 ) ) ( not ( = ?auto_12920 ?auto_12948 ) ) ( not ( = ?auto_12920 ?auto_12938 ) ) ( not ( = ?auto_12920 ?auto_12944 ) ) ( not ( = ?auto_12920 ?auto_12940 ) ) ( not ( = ?auto_12920 ?auto_12953 ) ) ( not ( = ?auto_12920 ?auto_12952 ) ) ( not ( = ?auto_12920 ?auto_12937 ) ) ( not ( = ?auto_12920 ?auto_12930 ) ) ( not ( = ?auto_12920 ?auto_12943 ) ) ( not ( = ?auto_12924 ?auto_12947 ) ) ( not ( = ?auto_12924 ?auto_12949 ) ) ( not ( = ?auto_12924 ?auto_12951 ) ) ( not ( = ?auto_12924 ?auto_12950 ) ) ( not ( = ?auto_12924 ?auto_12932 ) ) ( not ( = ?auto_12924 ?auto_12935 ) ) ( not ( = ?auto_12924 ?auto_12941 ) ) ( not ( = ?auto_12924 ?auto_12928 ) ) ( not ( = ?auto_12924 ?auto_12936 ) ) ( not ( = ?auto_12923 ?auto_12946 ) ) ( not ( = ?auto_12923 ?auto_12925 ) ) ( not ( = ?auto_12923 ?auto_12934 ) ) ( not ( = ?auto_12923 ?auto_12931 ) ) ( not ( = ?auto_12923 ?auto_12939 ) ) ( not ( = ?auto_12923 ?auto_12942 ) ) ( not ( = ?auto_12923 ?auto_12926 ) ) ( not ( = ?auto_12923 ?auto_12927 ) ) ( not ( = ?auto_12923 ?auto_12933 ) ) ( not ( = ?auto_12923 ?auto_12929 ) ) ( not ( = ?auto_12923 ?auto_12945 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12906 ?auto_12907 ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 )
      ( MAKE-1CRATE ?auto_12917 ?auto_12918 )
      ( MAKE-12CRATE-VERIFY ?auto_12906 ?auto_12907 ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 ?auto_12918 ) )
  )

)

