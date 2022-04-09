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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12420 - SURFACE
      ?auto_12421 - SURFACE
    )
    :vars
    (
      ?auto_12422 - HOIST
      ?auto_12423 - PLACE
      ?auto_12425 - PLACE
      ?auto_12426 - HOIST
      ?auto_12427 - SURFACE
      ?auto_12424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12422 ?auto_12423 ) ( SURFACE-AT ?auto_12420 ?auto_12423 ) ( CLEAR ?auto_12420 ) ( IS-CRATE ?auto_12421 ) ( AVAILABLE ?auto_12422 ) ( not ( = ?auto_12425 ?auto_12423 ) ) ( HOIST-AT ?auto_12426 ?auto_12425 ) ( AVAILABLE ?auto_12426 ) ( SURFACE-AT ?auto_12421 ?auto_12425 ) ( ON ?auto_12421 ?auto_12427 ) ( CLEAR ?auto_12421 ) ( TRUCK-AT ?auto_12424 ?auto_12423 ) ( not ( = ?auto_12420 ?auto_12421 ) ) ( not ( = ?auto_12420 ?auto_12427 ) ) ( not ( = ?auto_12421 ?auto_12427 ) ) ( not ( = ?auto_12422 ?auto_12426 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12424 ?auto_12423 ?auto_12425 )
      ( !LIFT ?auto_12426 ?auto_12421 ?auto_12427 ?auto_12425 )
      ( !LOAD ?auto_12426 ?auto_12421 ?auto_12424 ?auto_12425 )
      ( !DRIVE ?auto_12424 ?auto_12425 ?auto_12423 )
      ( !UNLOAD ?auto_12422 ?auto_12421 ?auto_12424 ?auto_12423 )
      ( !DROP ?auto_12422 ?auto_12421 ?auto_12420 ?auto_12423 )
      ( MAKE-1CRATE-VERIFY ?auto_12420 ?auto_12421 ) )
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
      ?auto_12438 - PLACE
      ?auto_12434 - PLACE
      ?auto_12439 - HOIST
      ?auto_12435 - SURFACE
      ?auto_12441 - PLACE
      ?auto_12442 - HOIST
      ?auto_12440 - SURFACE
      ?auto_12436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12437 ?auto_12438 ) ( IS-CRATE ?auto_12433 ) ( not ( = ?auto_12434 ?auto_12438 ) ) ( HOIST-AT ?auto_12439 ?auto_12434 ) ( AVAILABLE ?auto_12439 ) ( SURFACE-AT ?auto_12433 ?auto_12434 ) ( ON ?auto_12433 ?auto_12435 ) ( CLEAR ?auto_12433 ) ( not ( = ?auto_12432 ?auto_12433 ) ) ( not ( = ?auto_12432 ?auto_12435 ) ) ( not ( = ?auto_12433 ?auto_12435 ) ) ( not ( = ?auto_12437 ?auto_12439 ) ) ( SURFACE-AT ?auto_12431 ?auto_12438 ) ( CLEAR ?auto_12431 ) ( IS-CRATE ?auto_12432 ) ( AVAILABLE ?auto_12437 ) ( not ( = ?auto_12441 ?auto_12438 ) ) ( HOIST-AT ?auto_12442 ?auto_12441 ) ( AVAILABLE ?auto_12442 ) ( SURFACE-AT ?auto_12432 ?auto_12441 ) ( ON ?auto_12432 ?auto_12440 ) ( CLEAR ?auto_12432 ) ( TRUCK-AT ?auto_12436 ?auto_12438 ) ( not ( = ?auto_12431 ?auto_12432 ) ) ( not ( = ?auto_12431 ?auto_12440 ) ) ( not ( = ?auto_12432 ?auto_12440 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( not ( = ?auto_12431 ?auto_12433 ) ) ( not ( = ?auto_12431 ?auto_12435 ) ) ( not ( = ?auto_12433 ?auto_12440 ) ) ( not ( = ?auto_12434 ?auto_12441 ) ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( not ( = ?auto_12435 ?auto_12440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12431 ?auto_12432 )
      ( MAKE-1CRATE ?auto_12432 ?auto_12433 )
      ( MAKE-2CRATE-VERIFY ?auto_12431 ?auto_12432 ?auto_12433 ) )
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
      ?auto_12448 - PLACE
      ?auto_12450 - PLACE
      ?auto_12451 - HOIST
      ?auto_12452 - SURFACE
      ?auto_12449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12447 ?auto_12448 ) ( SURFACE-AT ?auto_12445 ?auto_12448 ) ( CLEAR ?auto_12445 ) ( IS-CRATE ?auto_12446 ) ( AVAILABLE ?auto_12447 ) ( not ( = ?auto_12450 ?auto_12448 ) ) ( HOIST-AT ?auto_12451 ?auto_12450 ) ( AVAILABLE ?auto_12451 ) ( SURFACE-AT ?auto_12446 ?auto_12450 ) ( ON ?auto_12446 ?auto_12452 ) ( CLEAR ?auto_12446 ) ( TRUCK-AT ?auto_12449 ?auto_12448 ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( not ( = ?auto_12445 ?auto_12452 ) ) ( not ( = ?auto_12446 ?auto_12452 ) ) ( not ( = ?auto_12447 ?auto_12451 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12449 ?auto_12448 ?auto_12450 )
      ( !LIFT ?auto_12451 ?auto_12446 ?auto_12452 ?auto_12450 )
      ( !LOAD ?auto_12451 ?auto_12446 ?auto_12449 ?auto_12450 )
      ( !DRIVE ?auto_12449 ?auto_12450 ?auto_12448 )
      ( !UNLOAD ?auto_12447 ?auto_12446 ?auto_12449 ?auto_12448 )
      ( !DROP ?auto_12447 ?auto_12446 ?auto_12445 ?auto_12448 )
      ( MAKE-1CRATE-VERIFY ?auto_12445 ?auto_12446 ) )
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
      ?auto_12464 - PLACE
      ?auto_12461 - HOIST
      ?auto_12462 - SURFACE
      ?auto_12469 - PLACE
      ?auto_12472 - HOIST
      ?auto_12471 - SURFACE
      ?auto_12470 - PLACE
      ?auto_12468 - HOIST
      ?auto_12467 - SURFACE
      ?auto_12463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12466 ?auto_12465 ) ( IS-CRATE ?auto_12460 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( HOIST-AT ?auto_12461 ?auto_12464 ) ( AVAILABLE ?auto_12461 ) ( SURFACE-AT ?auto_12460 ?auto_12464 ) ( ON ?auto_12460 ?auto_12462 ) ( CLEAR ?auto_12460 ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12462 ) ) ( not ( = ?auto_12466 ?auto_12461 ) ) ( IS-CRATE ?auto_12459 ) ( not ( = ?auto_12469 ?auto_12465 ) ) ( HOIST-AT ?auto_12472 ?auto_12469 ) ( AVAILABLE ?auto_12472 ) ( SURFACE-AT ?auto_12459 ?auto_12469 ) ( ON ?auto_12459 ?auto_12471 ) ( CLEAR ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12458 ?auto_12471 ) ) ( not ( = ?auto_12459 ?auto_12471 ) ) ( not ( = ?auto_12466 ?auto_12472 ) ) ( SURFACE-AT ?auto_12457 ?auto_12465 ) ( CLEAR ?auto_12457 ) ( IS-CRATE ?auto_12458 ) ( AVAILABLE ?auto_12466 ) ( not ( = ?auto_12470 ?auto_12465 ) ) ( HOIST-AT ?auto_12468 ?auto_12470 ) ( AVAILABLE ?auto_12468 ) ( SURFACE-AT ?auto_12458 ?auto_12470 ) ( ON ?auto_12458 ?auto_12467 ) ( CLEAR ?auto_12458 ) ( TRUCK-AT ?auto_12463 ?auto_12465 ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12457 ?auto_12467 ) ) ( not ( = ?auto_12458 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( not ( = ?auto_12457 ?auto_12459 ) ) ( not ( = ?auto_12457 ?auto_12471 ) ) ( not ( = ?auto_12459 ?auto_12467 ) ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12472 ?auto_12468 ) ) ( not ( = ?auto_12471 ?auto_12467 ) ) ( not ( = ?auto_12457 ?auto_12460 ) ) ( not ( = ?auto_12457 ?auto_12462 ) ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( not ( = ?auto_12458 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12471 ) ) ( not ( = ?auto_12460 ?auto_12467 ) ) ( not ( = ?auto_12464 ?auto_12469 ) ) ( not ( = ?auto_12464 ?auto_12470 ) ) ( not ( = ?auto_12461 ?auto_12472 ) ) ( not ( = ?auto_12461 ?auto_12468 ) ) ( not ( = ?auto_12462 ?auto_12471 ) ) ( not ( = ?auto_12462 ?auto_12467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12457 ?auto_12458 ?auto_12459 )
      ( MAKE-1CRATE ?auto_12459 ?auto_12460 )
      ( MAKE-3CRATE-VERIFY ?auto_12457 ?auto_12458 ?auto_12459 ?auto_12460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12475 - SURFACE
      ?auto_12476 - SURFACE
    )
    :vars
    (
      ?auto_12477 - HOIST
      ?auto_12478 - PLACE
      ?auto_12480 - PLACE
      ?auto_12481 - HOIST
      ?auto_12482 - SURFACE
      ?auto_12479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12477 ?auto_12478 ) ( SURFACE-AT ?auto_12475 ?auto_12478 ) ( CLEAR ?auto_12475 ) ( IS-CRATE ?auto_12476 ) ( AVAILABLE ?auto_12477 ) ( not ( = ?auto_12480 ?auto_12478 ) ) ( HOIST-AT ?auto_12481 ?auto_12480 ) ( AVAILABLE ?auto_12481 ) ( SURFACE-AT ?auto_12476 ?auto_12480 ) ( ON ?auto_12476 ?auto_12482 ) ( CLEAR ?auto_12476 ) ( TRUCK-AT ?auto_12479 ?auto_12478 ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12482 ) ) ( not ( = ?auto_12476 ?auto_12482 ) ) ( not ( = ?auto_12477 ?auto_12481 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12479 ?auto_12478 ?auto_12480 )
      ( !LIFT ?auto_12481 ?auto_12476 ?auto_12482 ?auto_12480 )
      ( !LOAD ?auto_12481 ?auto_12476 ?auto_12479 ?auto_12480 )
      ( !DRIVE ?auto_12479 ?auto_12480 ?auto_12478 )
      ( !UNLOAD ?auto_12477 ?auto_12476 ?auto_12479 ?auto_12478 )
      ( !DROP ?auto_12477 ?auto_12476 ?auto_12475 ?auto_12478 )
      ( MAKE-1CRATE-VERIFY ?auto_12475 ?auto_12476 ) )
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
      ?auto_12494 - HOIST
      ?auto_12497 - PLACE
      ?auto_12493 - PLACE
      ?auto_12496 - HOIST
      ?auto_12498 - SURFACE
      ?auto_12499 - PLACE
      ?auto_12504 - HOIST
      ?auto_12501 - SURFACE
      ?auto_12507 - PLACE
      ?auto_12500 - HOIST
      ?auto_12505 - SURFACE
      ?auto_12502 - PLACE
      ?auto_12503 - HOIST
      ?auto_12506 - SURFACE
      ?auto_12495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12494 ?auto_12497 ) ( IS-CRATE ?auto_12492 ) ( not ( = ?auto_12493 ?auto_12497 ) ) ( HOIST-AT ?auto_12496 ?auto_12493 ) ( AVAILABLE ?auto_12496 ) ( SURFACE-AT ?auto_12492 ?auto_12493 ) ( ON ?auto_12492 ?auto_12498 ) ( CLEAR ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12498 ) ) ( not ( = ?auto_12492 ?auto_12498 ) ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( IS-CRATE ?auto_12491 ) ( not ( = ?auto_12499 ?auto_12497 ) ) ( HOIST-AT ?auto_12504 ?auto_12499 ) ( AVAILABLE ?auto_12504 ) ( SURFACE-AT ?auto_12491 ?auto_12499 ) ( ON ?auto_12491 ?auto_12501 ) ( CLEAR ?auto_12491 ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12501 ) ) ( not ( = ?auto_12491 ?auto_12501 ) ) ( not ( = ?auto_12494 ?auto_12504 ) ) ( IS-CRATE ?auto_12490 ) ( not ( = ?auto_12507 ?auto_12497 ) ) ( HOIST-AT ?auto_12500 ?auto_12507 ) ( AVAILABLE ?auto_12500 ) ( SURFACE-AT ?auto_12490 ?auto_12507 ) ( ON ?auto_12490 ?auto_12505 ) ( CLEAR ?auto_12490 ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12505 ) ) ( not ( = ?auto_12490 ?auto_12505 ) ) ( not ( = ?auto_12494 ?auto_12500 ) ) ( SURFACE-AT ?auto_12488 ?auto_12497 ) ( CLEAR ?auto_12488 ) ( IS-CRATE ?auto_12489 ) ( AVAILABLE ?auto_12494 ) ( not ( = ?auto_12502 ?auto_12497 ) ) ( HOIST-AT ?auto_12503 ?auto_12502 ) ( AVAILABLE ?auto_12503 ) ( SURFACE-AT ?auto_12489 ?auto_12502 ) ( ON ?auto_12489 ?auto_12506 ) ( CLEAR ?auto_12489 ) ( TRUCK-AT ?auto_12495 ?auto_12497 ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12506 ) ) ( not ( = ?auto_12489 ?auto_12506 ) ) ( not ( = ?auto_12494 ?auto_12503 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12505 ) ) ( not ( = ?auto_12490 ?auto_12506 ) ) ( not ( = ?auto_12507 ?auto_12502 ) ) ( not ( = ?auto_12500 ?auto_12503 ) ) ( not ( = ?auto_12505 ?auto_12506 ) ) ( not ( = ?auto_12488 ?auto_12491 ) ) ( not ( = ?auto_12488 ?auto_12501 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12501 ) ) ( not ( = ?auto_12491 ?auto_12505 ) ) ( not ( = ?auto_12491 ?auto_12506 ) ) ( not ( = ?auto_12499 ?auto_12507 ) ) ( not ( = ?auto_12499 ?auto_12502 ) ) ( not ( = ?auto_12504 ?auto_12500 ) ) ( not ( = ?auto_12504 ?auto_12503 ) ) ( not ( = ?auto_12501 ?auto_12505 ) ) ( not ( = ?auto_12501 ?auto_12506 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12498 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12498 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12498 ) ) ( not ( = ?auto_12492 ?auto_12501 ) ) ( not ( = ?auto_12492 ?auto_12505 ) ) ( not ( = ?auto_12492 ?auto_12506 ) ) ( not ( = ?auto_12493 ?auto_12499 ) ) ( not ( = ?auto_12493 ?auto_12507 ) ) ( not ( = ?auto_12493 ?auto_12502 ) ) ( not ( = ?auto_12496 ?auto_12504 ) ) ( not ( = ?auto_12496 ?auto_12500 ) ) ( not ( = ?auto_12496 ?auto_12503 ) ) ( not ( = ?auto_12498 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12505 ) ) ( not ( = ?auto_12498 ?auto_12506 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 )
      ( MAKE-1CRATE ?auto_12491 ?auto_12492 )
      ( MAKE-4CRATE-VERIFY ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12510 - SURFACE
      ?auto_12511 - SURFACE
    )
    :vars
    (
      ?auto_12512 - HOIST
      ?auto_12513 - PLACE
      ?auto_12515 - PLACE
      ?auto_12516 - HOIST
      ?auto_12517 - SURFACE
      ?auto_12514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12512 ?auto_12513 ) ( SURFACE-AT ?auto_12510 ?auto_12513 ) ( CLEAR ?auto_12510 ) ( IS-CRATE ?auto_12511 ) ( AVAILABLE ?auto_12512 ) ( not ( = ?auto_12515 ?auto_12513 ) ) ( HOIST-AT ?auto_12516 ?auto_12515 ) ( AVAILABLE ?auto_12516 ) ( SURFACE-AT ?auto_12511 ?auto_12515 ) ( ON ?auto_12511 ?auto_12517 ) ( CLEAR ?auto_12511 ) ( TRUCK-AT ?auto_12514 ?auto_12513 ) ( not ( = ?auto_12510 ?auto_12511 ) ) ( not ( = ?auto_12510 ?auto_12517 ) ) ( not ( = ?auto_12511 ?auto_12517 ) ) ( not ( = ?auto_12512 ?auto_12516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12514 ?auto_12513 ?auto_12515 )
      ( !LIFT ?auto_12516 ?auto_12511 ?auto_12517 ?auto_12515 )
      ( !LOAD ?auto_12516 ?auto_12511 ?auto_12514 ?auto_12515 )
      ( !DRIVE ?auto_12514 ?auto_12515 ?auto_12513 )
      ( !UNLOAD ?auto_12512 ?auto_12511 ?auto_12514 ?auto_12513 )
      ( !DROP ?auto_12512 ?auto_12511 ?auto_12510 ?auto_12513 )
      ( MAKE-1CRATE-VERIFY ?auto_12510 ?auto_12511 ) )
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
      ?auto_12530 - HOIST
      ?auto_12531 - PLACE
      ?auto_12534 - PLACE
      ?auto_12533 - HOIST
      ?auto_12532 - SURFACE
      ?auto_12543 - PLACE
      ?auto_12541 - HOIST
      ?auto_12537 - SURFACE
      ?auto_12542 - PLACE
      ?auto_12539 - HOIST
      ?auto_12546 - SURFACE
      ?auto_12547 - PLACE
      ?auto_12545 - HOIST
      ?auto_12538 - SURFACE
      ?auto_12544 - PLACE
      ?auto_12536 - HOIST
      ?auto_12540 - SURFACE
      ?auto_12535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12530 ?auto_12531 ) ( IS-CRATE ?auto_12529 ) ( not ( = ?auto_12534 ?auto_12531 ) ) ( HOIST-AT ?auto_12533 ?auto_12534 ) ( AVAILABLE ?auto_12533 ) ( SURFACE-AT ?auto_12529 ?auto_12534 ) ( ON ?auto_12529 ?auto_12532 ) ( CLEAR ?auto_12529 ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12532 ) ) ( not ( = ?auto_12529 ?auto_12532 ) ) ( not ( = ?auto_12530 ?auto_12533 ) ) ( IS-CRATE ?auto_12528 ) ( not ( = ?auto_12543 ?auto_12531 ) ) ( HOIST-AT ?auto_12541 ?auto_12543 ) ( AVAILABLE ?auto_12541 ) ( SURFACE-AT ?auto_12528 ?auto_12543 ) ( ON ?auto_12528 ?auto_12537 ) ( CLEAR ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12528 ) ) ( not ( = ?auto_12527 ?auto_12537 ) ) ( not ( = ?auto_12528 ?auto_12537 ) ) ( not ( = ?auto_12530 ?auto_12541 ) ) ( IS-CRATE ?auto_12527 ) ( not ( = ?auto_12542 ?auto_12531 ) ) ( HOIST-AT ?auto_12539 ?auto_12542 ) ( AVAILABLE ?auto_12539 ) ( SURFACE-AT ?auto_12527 ?auto_12542 ) ( ON ?auto_12527 ?auto_12546 ) ( CLEAR ?auto_12527 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12546 ) ) ( not ( = ?auto_12527 ?auto_12546 ) ) ( not ( = ?auto_12530 ?auto_12539 ) ) ( IS-CRATE ?auto_12526 ) ( not ( = ?auto_12547 ?auto_12531 ) ) ( HOIST-AT ?auto_12545 ?auto_12547 ) ( AVAILABLE ?auto_12545 ) ( SURFACE-AT ?auto_12526 ?auto_12547 ) ( ON ?auto_12526 ?auto_12538 ) ( CLEAR ?auto_12526 ) ( not ( = ?auto_12525 ?auto_12526 ) ) ( not ( = ?auto_12525 ?auto_12538 ) ) ( not ( = ?auto_12526 ?auto_12538 ) ) ( not ( = ?auto_12530 ?auto_12545 ) ) ( SURFACE-AT ?auto_12524 ?auto_12531 ) ( CLEAR ?auto_12524 ) ( IS-CRATE ?auto_12525 ) ( AVAILABLE ?auto_12530 ) ( not ( = ?auto_12544 ?auto_12531 ) ) ( HOIST-AT ?auto_12536 ?auto_12544 ) ( AVAILABLE ?auto_12536 ) ( SURFACE-AT ?auto_12525 ?auto_12544 ) ( ON ?auto_12525 ?auto_12540 ) ( CLEAR ?auto_12525 ) ( TRUCK-AT ?auto_12535 ?auto_12531 ) ( not ( = ?auto_12524 ?auto_12525 ) ) ( not ( = ?auto_12524 ?auto_12540 ) ) ( not ( = ?auto_12525 ?auto_12540 ) ) ( not ( = ?auto_12530 ?auto_12536 ) ) ( not ( = ?auto_12524 ?auto_12526 ) ) ( not ( = ?auto_12524 ?auto_12538 ) ) ( not ( = ?auto_12526 ?auto_12540 ) ) ( not ( = ?auto_12547 ?auto_12544 ) ) ( not ( = ?auto_12545 ?auto_12536 ) ) ( not ( = ?auto_12538 ?auto_12540 ) ) ( not ( = ?auto_12524 ?auto_12527 ) ) ( not ( = ?auto_12524 ?auto_12546 ) ) ( not ( = ?auto_12525 ?auto_12527 ) ) ( not ( = ?auto_12525 ?auto_12546 ) ) ( not ( = ?auto_12527 ?auto_12538 ) ) ( not ( = ?auto_12527 ?auto_12540 ) ) ( not ( = ?auto_12542 ?auto_12547 ) ) ( not ( = ?auto_12542 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12545 ) ) ( not ( = ?auto_12539 ?auto_12536 ) ) ( not ( = ?auto_12546 ?auto_12538 ) ) ( not ( = ?auto_12546 ?auto_12540 ) ) ( not ( = ?auto_12524 ?auto_12528 ) ) ( not ( = ?auto_12524 ?auto_12537 ) ) ( not ( = ?auto_12525 ?auto_12528 ) ) ( not ( = ?auto_12525 ?auto_12537 ) ) ( not ( = ?auto_12526 ?auto_12528 ) ) ( not ( = ?auto_12526 ?auto_12537 ) ) ( not ( = ?auto_12528 ?auto_12546 ) ) ( not ( = ?auto_12528 ?auto_12538 ) ) ( not ( = ?auto_12528 ?auto_12540 ) ) ( not ( = ?auto_12543 ?auto_12542 ) ) ( not ( = ?auto_12543 ?auto_12547 ) ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( not ( = ?auto_12541 ?auto_12539 ) ) ( not ( = ?auto_12541 ?auto_12545 ) ) ( not ( = ?auto_12541 ?auto_12536 ) ) ( not ( = ?auto_12537 ?auto_12546 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12540 ) ) ( not ( = ?auto_12524 ?auto_12529 ) ) ( not ( = ?auto_12524 ?auto_12532 ) ) ( not ( = ?auto_12525 ?auto_12529 ) ) ( not ( = ?auto_12525 ?auto_12532 ) ) ( not ( = ?auto_12526 ?auto_12529 ) ) ( not ( = ?auto_12526 ?auto_12532 ) ) ( not ( = ?auto_12527 ?auto_12529 ) ) ( not ( = ?auto_12527 ?auto_12532 ) ) ( not ( = ?auto_12529 ?auto_12537 ) ) ( not ( = ?auto_12529 ?auto_12546 ) ) ( not ( = ?auto_12529 ?auto_12538 ) ) ( not ( = ?auto_12529 ?auto_12540 ) ) ( not ( = ?auto_12534 ?auto_12543 ) ) ( not ( = ?auto_12534 ?auto_12542 ) ) ( not ( = ?auto_12534 ?auto_12547 ) ) ( not ( = ?auto_12534 ?auto_12544 ) ) ( not ( = ?auto_12533 ?auto_12541 ) ) ( not ( = ?auto_12533 ?auto_12539 ) ) ( not ( = ?auto_12533 ?auto_12545 ) ) ( not ( = ?auto_12533 ?auto_12536 ) ) ( not ( = ?auto_12532 ?auto_12537 ) ) ( not ( = ?auto_12532 ?auto_12546 ) ) ( not ( = ?auto_12532 ?auto_12538 ) ) ( not ( = ?auto_12532 ?auto_12540 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12524 ?auto_12525 ?auto_12526 ?auto_12527 ?auto_12528 )
      ( MAKE-1CRATE ?auto_12528 ?auto_12529 )
      ( MAKE-5CRATE-VERIFY ?auto_12524 ?auto_12525 ?auto_12526 ?auto_12527 ?auto_12528 ?auto_12529 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12550 - SURFACE
      ?auto_12551 - SURFACE
    )
    :vars
    (
      ?auto_12552 - HOIST
      ?auto_12553 - PLACE
      ?auto_12555 - PLACE
      ?auto_12556 - HOIST
      ?auto_12557 - SURFACE
      ?auto_12554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12552 ?auto_12553 ) ( SURFACE-AT ?auto_12550 ?auto_12553 ) ( CLEAR ?auto_12550 ) ( IS-CRATE ?auto_12551 ) ( AVAILABLE ?auto_12552 ) ( not ( = ?auto_12555 ?auto_12553 ) ) ( HOIST-AT ?auto_12556 ?auto_12555 ) ( AVAILABLE ?auto_12556 ) ( SURFACE-AT ?auto_12551 ?auto_12555 ) ( ON ?auto_12551 ?auto_12557 ) ( CLEAR ?auto_12551 ) ( TRUCK-AT ?auto_12554 ?auto_12553 ) ( not ( = ?auto_12550 ?auto_12551 ) ) ( not ( = ?auto_12550 ?auto_12557 ) ) ( not ( = ?auto_12551 ?auto_12557 ) ) ( not ( = ?auto_12552 ?auto_12556 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12554 ?auto_12553 ?auto_12555 )
      ( !LIFT ?auto_12556 ?auto_12551 ?auto_12557 ?auto_12555 )
      ( !LOAD ?auto_12556 ?auto_12551 ?auto_12554 ?auto_12555 )
      ( !DRIVE ?auto_12554 ?auto_12555 ?auto_12553 )
      ( !UNLOAD ?auto_12552 ?auto_12551 ?auto_12554 ?auto_12553 )
      ( !DROP ?auto_12552 ?auto_12551 ?auto_12550 ?auto_12553 )
      ( MAKE-1CRATE-VERIFY ?auto_12550 ?auto_12551 ) )
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
      ?auto_12574 - HOIST
      ?auto_12577 - PLACE
      ?auto_12573 - PLACE
      ?auto_12575 - HOIST
      ?auto_12572 - SURFACE
      ?auto_12582 - PLACE
      ?auto_12591 - HOIST
      ?auto_12592 - SURFACE
      ?auto_12578 - PLACE
      ?auto_12580 - HOIST
      ?auto_12590 - SURFACE
      ?auto_12579 - PLACE
      ?auto_12585 - HOIST
      ?auto_12586 - SURFACE
      ?auto_12589 - PLACE
      ?auto_12588 - HOIST
      ?auto_12583 - SURFACE
      ?auto_12584 - PLACE
      ?auto_12587 - HOIST
      ?auto_12581 - SURFACE
      ?auto_12576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12574 ?auto_12577 ) ( IS-CRATE ?auto_12571 ) ( not ( = ?auto_12573 ?auto_12577 ) ) ( HOIST-AT ?auto_12575 ?auto_12573 ) ( AVAILABLE ?auto_12575 ) ( SURFACE-AT ?auto_12571 ?auto_12573 ) ( ON ?auto_12571 ?auto_12572 ) ( CLEAR ?auto_12571 ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( IS-CRATE ?auto_12570 ) ( not ( = ?auto_12582 ?auto_12577 ) ) ( HOIST-AT ?auto_12591 ?auto_12582 ) ( AVAILABLE ?auto_12591 ) ( SURFACE-AT ?auto_12570 ?auto_12582 ) ( ON ?auto_12570 ?auto_12592 ) ( CLEAR ?auto_12570 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12592 ) ) ( not ( = ?auto_12570 ?auto_12592 ) ) ( not ( = ?auto_12574 ?auto_12591 ) ) ( IS-CRATE ?auto_12569 ) ( not ( = ?auto_12578 ?auto_12577 ) ) ( HOIST-AT ?auto_12580 ?auto_12578 ) ( AVAILABLE ?auto_12580 ) ( SURFACE-AT ?auto_12569 ?auto_12578 ) ( ON ?auto_12569 ?auto_12590 ) ( CLEAR ?auto_12569 ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12590 ) ) ( not ( = ?auto_12569 ?auto_12590 ) ) ( not ( = ?auto_12574 ?auto_12580 ) ) ( IS-CRATE ?auto_12568 ) ( not ( = ?auto_12579 ?auto_12577 ) ) ( HOIST-AT ?auto_12585 ?auto_12579 ) ( AVAILABLE ?auto_12585 ) ( SURFACE-AT ?auto_12568 ?auto_12579 ) ( ON ?auto_12568 ?auto_12586 ) ( CLEAR ?auto_12568 ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12586 ) ) ( not ( = ?auto_12568 ?auto_12586 ) ) ( not ( = ?auto_12574 ?auto_12585 ) ) ( IS-CRATE ?auto_12567 ) ( not ( = ?auto_12589 ?auto_12577 ) ) ( HOIST-AT ?auto_12588 ?auto_12589 ) ( AVAILABLE ?auto_12588 ) ( SURFACE-AT ?auto_12567 ?auto_12589 ) ( ON ?auto_12567 ?auto_12583 ) ( CLEAR ?auto_12567 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12566 ?auto_12583 ) ) ( not ( = ?auto_12567 ?auto_12583 ) ) ( not ( = ?auto_12574 ?auto_12588 ) ) ( SURFACE-AT ?auto_12565 ?auto_12577 ) ( CLEAR ?auto_12565 ) ( IS-CRATE ?auto_12566 ) ( AVAILABLE ?auto_12574 ) ( not ( = ?auto_12584 ?auto_12577 ) ) ( HOIST-AT ?auto_12587 ?auto_12584 ) ( AVAILABLE ?auto_12587 ) ( SURFACE-AT ?auto_12566 ?auto_12584 ) ( ON ?auto_12566 ?auto_12581 ) ( CLEAR ?auto_12566 ) ( TRUCK-AT ?auto_12576 ?auto_12577 ) ( not ( = ?auto_12565 ?auto_12566 ) ) ( not ( = ?auto_12565 ?auto_12581 ) ) ( not ( = ?auto_12566 ?auto_12581 ) ) ( not ( = ?auto_12574 ?auto_12587 ) ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12583 ) ) ( not ( = ?auto_12567 ?auto_12581 ) ) ( not ( = ?auto_12589 ?auto_12584 ) ) ( not ( = ?auto_12588 ?auto_12587 ) ) ( not ( = ?auto_12583 ?auto_12581 ) ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( not ( = ?auto_12565 ?auto_12586 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12586 ) ) ( not ( = ?auto_12568 ?auto_12583 ) ) ( not ( = ?auto_12568 ?auto_12581 ) ) ( not ( = ?auto_12579 ?auto_12589 ) ) ( not ( = ?auto_12579 ?auto_12584 ) ) ( not ( = ?auto_12585 ?auto_12588 ) ) ( not ( = ?auto_12585 ?auto_12587 ) ) ( not ( = ?auto_12586 ?auto_12583 ) ) ( not ( = ?auto_12586 ?auto_12581 ) ) ( not ( = ?auto_12565 ?auto_12569 ) ) ( not ( = ?auto_12565 ?auto_12590 ) ) ( not ( = ?auto_12566 ?auto_12569 ) ) ( not ( = ?auto_12566 ?auto_12590 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12590 ) ) ( not ( = ?auto_12569 ?auto_12586 ) ) ( not ( = ?auto_12569 ?auto_12583 ) ) ( not ( = ?auto_12569 ?auto_12581 ) ) ( not ( = ?auto_12578 ?auto_12579 ) ) ( not ( = ?auto_12578 ?auto_12589 ) ) ( not ( = ?auto_12578 ?auto_12584 ) ) ( not ( = ?auto_12580 ?auto_12585 ) ) ( not ( = ?auto_12580 ?auto_12588 ) ) ( not ( = ?auto_12580 ?auto_12587 ) ) ( not ( = ?auto_12590 ?auto_12586 ) ) ( not ( = ?auto_12590 ?auto_12583 ) ) ( not ( = ?auto_12590 ?auto_12581 ) ) ( not ( = ?auto_12565 ?auto_12570 ) ) ( not ( = ?auto_12565 ?auto_12592 ) ) ( not ( = ?auto_12566 ?auto_12570 ) ) ( not ( = ?auto_12566 ?auto_12592 ) ) ( not ( = ?auto_12567 ?auto_12570 ) ) ( not ( = ?auto_12567 ?auto_12592 ) ) ( not ( = ?auto_12568 ?auto_12570 ) ) ( not ( = ?auto_12568 ?auto_12592 ) ) ( not ( = ?auto_12570 ?auto_12590 ) ) ( not ( = ?auto_12570 ?auto_12586 ) ) ( not ( = ?auto_12570 ?auto_12583 ) ) ( not ( = ?auto_12570 ?auto_12581 ) ) ( not ( = ?auto_12582 ?auto_12578 ) ) ( not ( = ?auto_12582 ?auto_12579 ) ) ( not ( = ?auto_12582 ?auto_12589 ) ) ( not ( = ?auto_12582 ?auto_12584 ) ) ( not ( = ?auto_12591 ?auto_12580 ) ) ( not ( = ?auto_12591 ?auto_12585 ) ) ( not ( = ?auto_12591 ?auto_12588 ) ) ( not ( = ?auto_12591 ?auto_12587 ) ) ( not ( = ?auto_12592 ?auto_12590 ) ) ( not ( = ?auto_12592 ?auto_12586 ) ) ( not ( = ?auto_12592 ?auto_12583 ) ) ( not ( = ?auto_12592 ?auto_12581 ) ) ( not ( = ?auto_12565 ?auto_12571 ) ) ( not ( = ?auto_12565 ?auto_12572 ) ) ( not ( = ?auto_12566 ?auto_12571 ) ) ( not ( = ?auto_12566 ?auto_12572 ) ) ( not ( = ?auto_12567 ?auto_12571 ) ) ( not ( = ?auto_12567 ?auto_12572 ) ) ( not ( = ?auto_12568 ?auto_12571 ) ) ( not ( = ?auto_12568 ?auto_12572 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12569 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12592 ) ) ( not ( = ?auto_12571 ?auto_12590 ) ) ( not ( = ?auto_12571 ?auto_12586 ) ) ( not ( = ?auto_12571 ?auto_12583 ) ) ( not ( = ?auto_12571 ?auto_12581 ) ) ( not ( = ?auto_12573 ?auto_12582 ) ) ( not ( = ?auto_12573 ?auto_12578 ) ) ( not ( = ?auto_12573 ?auto_12579 ) ) ( not ( = ?auto_12573 ?auto_12589 ) ) ( not ( = ?auto_12573 ?auto_12584 ) ) ( not ( = ?auto_12575 ?auto_12591 ) ) ( not ( = ?auto_12575 ?auto_12580 ) ) ( not ( = ?auto_12575 ?auto_12585 ) ) ( not ( = ?auto_12575 ?auto_12588 ) ) ( not ( = ?auto_12575 ?auto_12587 ) ) ( not ( = ?auto_12572 ?auto_12592 ) ) ( not ( = ?auto_12572 ?auto_12590 ) ) ( not ( = ?auto_12572 ?auto_12586 ) ) ( not ( = ?auto_12572 ?auto_12583 ) ) ( not ( = ?auto_12572 ?auto_12581 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12565 ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 )
      ( MAKE-1CRATE ?auto_12570 ?auto_12571 )
      ( MAKE-6CRATE-VERIFY ?auto_12565 ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12595 - SURFACE
      ?auto_12596 - SURFACE
    )
    :vars
    (
      ?auto_12597 - HOIST
      ?auto_12598 - PLACE
      ?auto_12600 - PLACE
      ?auto_12601 - HOIST
      ?auto_12602 - SURFACE
      ?auto_12599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12597 ?auto_12598 ) ( SURFACE-AT ?auto_12595 ?auto_12598 ) ( CLEAR ?auto_12595 ) ( IS-CRATE ?auto_12596 ) ( AVAILABLE ?auto_12597 ) ( not ( = ?auto_12600 ?auto_12598 ) ) ( HOIST-AT ?auto_12601 ?auto_12600 ) ( AVAILABLE ?auto_12601 ) ( SURFACE-AT ?auto_12596 ?auto_12600 ) ( ON ?auto_12596 ?auto_12602 ) ( CLEAR ?auto_12596 ) ( TRUCK-AT ?auto_12599 ?auto_12598 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12602 ) ) ( not ( = ?auto_12596 ?auto_12602 ) ) ( not ( = ?auto_12597 ?auto_12601 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12599 ?auto_12598 ?auto_12600 )
      ( !LIFT ?auto_12601 ?auto_12596 ?auto_12602 ?auto_12600 )
      ( !LOAD ?auto_12601 ?auto_12596 ?auto_12599 ?auto_12600 )
      ( !DRIVE ?auto_12599 ?auto_12600 ?auto_12598 )
      ( !UNLOAD ?auto_12597 ?auto_12596 ?auto_12599 ?auto_12598 )
      ( !DROP ?auto_12597 ?auto_12596 ?auto_12595 ?auto_12598 )
      ( MAKE-1CRATE-VERIFY ?auto_12595 ?auto_12596 ) )
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
      ?auto_12618 - SURFACE
      ?auto_12617 - SURFACE
    )
    :vars
    (
      ?auto_12624 - HOIST
      ?auto_12622 - PLACE
      ?auto_12619 - PLACE
      ?auto_12623 - HOIST
      ?auto_12621 - SURFACE
      ?auto_12641 - PLACE
      ?auto_12639 - HOIST
      ?auto_12642 - SURFACE
      ?auto_12626 - PLACE
      ?auto_12638 - HOIST
      ?auto_12630 - SURFACE
      ?auto_12632 - PLACE
      ?auto_12629 - HOIST
      ?auto_12636 - SURFACE
      ?auto_12628 - PLACE
      ?auto_12637 - HOIST
      ?auto_12631 - SURFACE
      ?auto_12634 - PLACE
      ?auto_12635 - HOIST
      ?auto_12625 - SURFACE
      ?auto_12640 - PLACE
      ?auto_12633 - HOIST
      ?auto_12627 - SURFACE
      ?auto_12620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12624 ?auto_12622 ) ( IS-CRATE ?auto_12617 ) ( not ( = ?auto_12619 ?auto_12622 ) ) ( HOIST-AT ?auto_12623 ?auto_12619 ) ( AVAILABLE ?auto_12623 ) ( SURFACE-AT ?auto_12617 ?auto_12619 ) ( ON ?auto_12617 ?auto_12621 ) ( CLEAR ?auto_12617 ) ( not ( = ?auto_12618 ?auto_12617 ) ) ( not ( = ?auto_12618 ?auto_12621 ) ) ( not ( = ?auto_12617 ?auto_12621 ) ) ( not ( = ?auto_12624 ?auto_12623 ) ) ( IS-CRATE ?auto_12618 ) ( not ( = ?auto_12641 ?auto_12622 ) ) ( HOIST-AT ?auto_12639 ?auto_12641 ) ( AVAILABLE ?auto_12639 ) ( SURFACE-AT ?auto_12618 ?auto_12641 ) ( ON ?auto_12618 ?auto_12642 ) ( CLEAR ?auto_12618 ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12642 ) ) ( not ( = ?auto_12618 ?auto_12642 ) ) ( not ( = ?auto_12624 ?auto_12639 ) ) ( IS-CRATE ?auto_12616 ) ( not ( = ?auto_12626 ?auto_12622 ) ) ( HOIST-AT ?auto_12638 ?auto_12626 ) ( AVAILABLE ?auto_12638 ) ( SURFACE-AT ?auto_12616 ?auto_12626 ) ( ON ?auto_12616 ?auto_12630 ) ( CLEAR ?auto_12616 ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12630 ) ) ( not ( = ?auto_12616 ?auto_12630 ) ) ( not ( = ?auto_12624 ?auto_12638 ) ) ( IS-CRATE ?auto_12615 ) ( not ( = ?auto_12632 ?auto_12622 ) ) ( HOIST-AT ?auto_12629 ?auto_12632 ) ( AVAILABLE ?auto_12629 ) ( SURFACE-AT ?auto_12615 ?auto_12632 ) ( ON ?auto_12615 ?auto_12636 ) ( CLEAR ?auto_12615 ) ( not ( = ?auto_12614 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12636 ) ) ( not ( = ?auto_12615 ?auto_12636 ) ) ( not ( = ?auto_12624 ?auto_12629 ) ) ( IS-CRATE ?auto_12614 ) ( not ( = ?auto_12628 ?auto_12622 ) ) ( HOIST-AT ?auto_12637 ?auto_12628 ) ( AVAILABLE ?auto_12637 ) ( SURFACE-AT ?auto_12614 ?auto_12628 ) ( ON ?auto_12614 ?auto_12631 ) ( CLEAR ?auto_12614 ) ( not ( = ?auto_12613 ?auto_12614 ) ) ( not ( = ?auto_12613 ?auto_12631 ) ) ( not ( = ?auto_12614 ?auto_12631 ) ) ( not ( = ?auto_12624 ?auto_12637 ) ) ( IS-CRATE ?auto_12613 ) ( not ( = ?auto_12634 ?auto_12622 ) ) ( HOIST-AT ?auto_12635 ?auto_12634 ) ( AVAILABLE ?auto_12635 ) ( SURFACE-AT ?auto_12613 ?auto_12634 ) ( ON ?auto_12613 ?auto_12625 ) ( CLEAR ?auto_12613 ) ( not ( = ?auto_12612 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12625 ) ) ( not ( = ?auto_12613 ?auto_12625 ) ) ( not ( = ?auto_12624 ?auto_12635 ) ) ( SURFACE-AT ?auto_12611 ?auto_12622 ) ( CLEAR ?auto_12611 ) ( IS-CRATE ?auto_12612 ) ( AVAILABLE ?auto_12624 ) ( not ( = ?auto_12640 ?auto_12622 ) ) ( HOIST-AT ?auto_12633 ?auto_12640 ) ( AVAILABLE ?auto_12633 ) ( SURFACE-AT ?auto_12612 ?auto_12640 ) ( ON ?auto_12612 ?auto_12627 ) ( CLEAR ?auto_12612 ) ( TRUCK-AT ?auto_12620 ?auto_12622 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12611 ?auto_12627 ) ) ( not ( = ?auto_12612 ?auto_12627 ) ) ( not ( = ?auto_12624 ?auto_12633 ) ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( not ( = ?auto_12611 ?auto_12625 ) ) ( not ( = ?auto_12613 ?auto_12627 ) ) ( not ( = ?auto_12634 ?auto_12640 ) ) ( not ( = ?auto_12635 ?auto_12633 ) ) ( not ( = ?auto_12625 ?auto_12627 ) ) ( not ( = ?auto_12611 ?auto_12614 ) ) ( not ( = ?auto_12611 ?auto_12631 ) ) ( not ( = ?auto_12612 ?auto_12614 ) ) ( not ( = ?auto_12612 ?auto_12631 ) ) ( not ( = ?auto_12614 ?auto_12625 ) ) ( not ( = ?auto_12614 ?auto_12627 ) ) ( not ( = ?auto_12628 ?auto_12634 ) ) ( not ( = ?auto_12628 ?auto_12640 ) ) ( not ( = ?auto_12637 ?auto_12635 ) ) ( not ( = ?auto_12637 ?auto_12633 ) ) ( not ( = ?auto_12631 ?auto_12625 ) ) ( not ( = ?auto_12631 ?auto_12627 ) ) ( not ( = ?auto_12611 ?auto_12615 ) ) ( not ( = ?auto_12611 ?auto_12636 ) ) ( not ( = ?auto_12612 ?auto_12615 ) ) ( not ( = ?auto_12612 ?auto_12636 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12636 ) ) ( not ( = ?auto_12615 ?auto_12631 ) ) ( not ( = ?auto_12615 ?auto_12625 ) ) ( not ( = ?auto_12615 ?auto_12627 ) ) ( not ( = ?auto_12632 ?auto_12628 ) ) ( not ( = ?auto_12632 ?auto_12634 ) ) ( not ( = ?auto_12632 ?auto_12640 ) ) ( not ( = ?auto_12629 ?auto_12637 ) ) ( not ( = ?auto_12629 ?auto_12635 ) ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( not ( = ?auto_12636 ?auto_12631 ) ) ( not ( = ?auto_12636 ?auto_12625 ) ) ( not ( = ?auto_12636 ?auto_12627 ) ) ( not ( = ?auto_12611 ?auto_12616 ) ) ( not ( = ?auto_12611 ?auto_12630 ) ) ( not ( = ?auto_12612 ?auto_12616 ) ) ( not ( = ?auto_12612 ?auto_12630 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12630 ) ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( not ( = ?auto_12614 ?auto_12630 ) ) ( not ( = ?auto_12616 ?auto_12636 ) ) ( not ( = ?auto_12616 ?auto_12631 ) ) ( not ( = ?auto_12616 ?auto_12625 ) ) ( not ( = ?auto_12616 ?auto_12627 ) ) ( not ( = ?auto_12626 ?auto_12632 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12634 ) ) ( not ( = ?auto_12626 ?auto_12640 ) ) ( not ( = ?auto_12638 ?auto_12629 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( not ( = ?auto_12638 ?auto_12635 ) ) ( not ( = ?auto_12638 ?auto_12633 ) ) ( not ( = ?auto_12630 ?auto_12636 ) ) ( not ( = ?auto_12630 ?auto_12631 ) ) ( not ( = ?auto_12630 ?auto_12625 ) ) ( not ( = ?auto_12630 ?auto_12627 ) ) ( not ( = ?auto_12611 ?auto_12618 ) ) ( not ( = ?auto_12611 ?auto_12642 ) ) ( not ( = ?auto_12612 ?auto_12618 ) ) ( not ( = ?auto_12612 ?auto_12642 ) ) ( not ( = ?auto_12613 ?auto_12618 ) ) ( not ( = ?auto_12613 ?auto_12642 ) ) ( not ( = ?auto_12614 ?auto_12618 ) ) ( not ( = ?auto_12614 ?auto_12642 ) ) ( not ( = ?auto_12615 ?auto_12618 ) ) ( not ( = ?auto_12615 ?auto_12642 ) ) ( not ( = ?auto_12618 ?auto_12630 ) ) ( not ( = ?auto_12618 ?auto_12636 ) ) ( not ( = ?auto_12618 ?auto_12631 ) ) ( not ( = ?auto_12618 ?auto_12625 ) ) ( not ( = ?auto_12618 ?auto_12627 ) ) ( not ( = ?auto_12641 ?auto_12626 ) ) ( not ( = ?auto_12641 ?auto_12632 ) ) ( not ( = ?auto_12641 ?auto_12628 ) ) ( not ( = ?auto_12641 ?auto_12634 ) ) ( not ( = ?auto_12641 ?auto_12640 ) ) ( not ( = ?auto_12639 ?auto_12638 ) ) ( not ( = ?auto_12639 ?auto_12629 ) ) ( not ( = ?auto_12639 ?auto_12637 ) ) ( not ( = ?auto_12639 ?auto_12635 ) ) ( not ( = ?auto_12639 ?auto_12633 ) ) ( not ( = ?auto_12642 ?auto_12630 ) ) ( not ( = ?auto_12642 ?auto_12636 ) ) ( not ( = ?auto_12642 ?auto_12631 ) ) ( not ( = ?auto_12642 ?auto_12625 ) ) ( not ( = ?auto_12642 ?auto_12627 ) ) ( not ( = ?auto_12611 ?auto_12617 ) ) ( not ( = ?auto_12611 ?auto_12621 ) ) ( not ( = ?auto_12612 ?auto_12617 ) ) ( not ( = ?auto_12612 ?auto_12621 ) ) ( not ( = ?auto_12613 ?auto_12617 ) ) ( not ( = ?auto_12613 ?auto_12621 ) ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12614 ?auto_12621 ) ) ( not ( = ?auto_12615 ?auto_12617 ) ) ( not ( = ?auto_12615 ?auto_12621 ) ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12616 ?auto_12621 ) ) ( not ( = ?auto_12617 ?auto_12642 ) ) ( not ( = ?auto_12617 ?auto_12630 ) ) ( not ( = ?auto_12617 ?auto_12636 ) ) ( not ( = ?auto_12617 ?auto_12631 ) ) ( not ( = ?auto_12617 ?auto_12625 ) ) ( not ( = ?auto_12617 ?auto_12627 ) ) ( not ( = ?auto_12619 ?auto_12641 ) ) ( not ( = ?auto_12619 ?auto_12626 ) ) ( not ( = ?auto_12619 ?auto_12632 ) ) ( not ( = ?auto_12619 ?auto_12628 ) ) ( not ( = ?auto_12619 ?auto_12634 ) ) ( not ( = ?auto_12619 ?auto_12640 ) ) ( not ( = ?auto_12623 ?auto_12639 ) ) ( not ( = ?auto_12623 ?auto_12638 ) ) ( not ( = ?auto_12623 ?auto_12629 ) ) ( not ( = ?auto_12623 ?auto_12637 ) ) ( not ( = ?auto_12623 ?auto_12635 ) ) ( not ( = ?auto_12623 ?auto_12633 ) ) ( not ( = ?auto_12621 ?auto_12642 ) ) ( not ( = ?auto_12621 ?auto_12630 ) ) ( not ( = ?auto_12621 ?auto_12636 ) ) ( not ( = ?auto_12621 ?auto_12631 ) ) ( not ( = ?auto_12621 ?auto_12625 ) ) ( not ( = ?auto_12621 ?auto_12627 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12611 ?auto_12612 ?auto_12613 ?auto_12614 ?auto_12615 ?auto_12616 ?auto_12618 )
      ( MAKE-1CRATE ?auto_12618 ?auto_12617 )
      ( MAKE-7CRATE-VERIFY ?auto_12611 ?auto_12612 ?auto_12613 ?auto_12614 ?auto_12615 ?auto_12616 ?auto_12618 ?auto_12617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12645 - SURFACE
      ?auto_12646 - SURFACE
    )
    :vars
    (
      ?auto_12647 - HOIST
      ?auto_12648 - PLACE
      ?auto_12650 - PLACE
      ?auto_12651 - HOIST
      ?auto_12652 - SURFACE
      ?auto_12649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12647 ?auto_12648 ) ( SURFACE-AT ?auto_12645 ?auto_12648 ) ( CLEAR ?auto_12645 ) ( IS-CRATE ?auto_12646 ) ( AVAILABLE ?auto_12647 ) ( not ( = ?auto_12650 ?auto_12648 ) ) ( HOIST-AT ?auto_12651 ?auto_12650 ) ( AVAILABLE ?auto_12651 ) ( SURFACE-AT ?auto_12646 ?auto_12650 ) ( ON ?auto_12646 ?auto_12652 ) ( CLEAR ?auto_12646 ) ( TRUCK-AT ?auto_12649 ?auto_12648 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12652 ) ) ( not ( = ?auto_12646 ?auto_12652 ) ) ( not ( = ?auto_12647 ?auto_12651 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12649 ?auto_12648 ?auto_12650 )
      ( !LIFT ?auto_12651 ?auto_12646 ?auto_12652 ?auto_12650 )
      ( !LOAD ?auto_12651 ?auto_12646 ?auto_12649 ?auto_12650 )
      ( !DRIVE ?auto_12649 ?auto_12650 ?auto_12648 )
      ( !UNLOAD ?auto_12647 ?auto_12646 ?auto_12649 ?auto_12648 )
      ( !DROP ?auto_12647 ?auto_12646 ?auto_12645 ?auto_12648 )
      ( MAKE-1CRATE-VERIFY ?auto_12645 ?auto_12646 ) )
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
      ?auto_12670 - SURFACE
      ?auto_12669 - SURFACE
      ?auto_12668 - SURFACE
    )
    :vars
    (
      ?auto_12673 - HOIST
      ?auto_12676 - PLACE
      ?auto_12674 - PLACE
      ?auto_12675 - HOIST
      ?auto_12671 - SURFACE
      ?auto_12697 - PLACE
      ?auto_12695 - HOIST
      ?auto_12696 - SURFACE
      ?auto_12682 - PLACE
      ?auto_12680 - HOIST
      ?auto_12681 - SURFACE
      ?auto_12678 - PLACE
      ?auto_12690 - HOIST
      ?auto_12693 - SURFACE
      ?auto_12691 - PLACE
      ?auto_12694 - HOIST
      ?auto_12688 - SURFACE
      ?auto_12677 - PLACE
      ?auto_12689 - HOIST
      ?auto_12692 - SURFACE
      ?auto_12687 - PLACE
      ?auto_12686 - HOIST
      ?auto_12683 - SURFACE
      ?auto_12684 - PLACE
      ?auto_12685 - HOIST
      ?auto_12679 - SURFACE
      ?auto_12672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12673 ?auto_12676 ) ( IS-CRATE ?auto_12668 ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( HOIST-AT ?auto_12675 ?auto_12674 ) ( AVAILABLE ?auto_12675 ) ( SURFACE-AT ?auto_12668 ?auto_12674 ) ( ON ?auto_12668 ?auto_12671 ) ( CLEAR ?auto_12668 ) ( not ( = ?auto_12669 ?auto_12668 ) ) ( not ( = ?auto_12669 ?auto_12671 ) ) ( not ( = ?auto_12668 ?auto_12671 ) ) ( not ( = ?auto_12673 ?auto_12675 ) ) ( IS-CRATE ?auto_12669 ) ( not ( = ?auto_12697 ?auto_12676 ) ) ( HOIST-AT ?auto_12695 ?auto_12697 ) ( AVAILABLE ?auto_12695 ) ( SURFACE-AT ?auto_12669 ?auto_12697 ) ( ON ?auto_12669 ?auto_12696 ) ( CLEAR ?auto_12669 ) ( not ( = ?auto_12670 ?auto_12669 ) ) ( not ( = ?auto_12670 ?auto_12696 ) ) ( not ( = ?auto_12669 ?auto_12696 ) ) ( not ( = ?auto_12673 ?auto_12695 ) ) ( IS-CRATE ?auto_12670 ) ( not ( = ?auto_12682 ?auto_12676 ) ) ( HOIST-AT ?auto_12680 ?auto_12682 ) ( AVAILABLE ?auto_12680 ) ( SURFACE-AT ?auto_12670 ?auto_12682 ) ( ON ?auto_12670 ?auto_12681 ) ( CLEAR ?auto_12670 ) ( not ( = ?auto_12667 ?auto_12670 ) ) ( not ( = ?auto_12667 ?auto_12681 ) ) ( not ( = ?auto_12670 ?auto_12681 ) ) ( not ( = ?auto_12673 ?auto_12680 ) ) ( IS-CRATE ?auto_12667 ) ( not ( = ?auto_12678 ?auto_12676 ) ) ( HOIST-AT ?auto_12690 ?auto_12678 ) ( AVAILABLE ?auto_12690 ) ( SURFACE-AT ?auto_12667 ?auto_12678 ) ( ON ?auto_12667 ?auto_12693 ) ( CLEAR ?auto_12667 ) ( not ( = ?auto_12666 ?auto_12667 ) ) ( not ( = ?auto_12666 ?auto_12693 ) ) ( not ( = ?auto_12667 ?auto_12693 ) ) ( not ( = ?auto_12673 ?auto_12690 ) ) ( IS-CRATE ?auto_12666 ) ( not ( = ?auto_12691 ?auto_12676 ) ) ( HOIST-AT ?auto_12694 ?auto_12691 ) ( AVAILABLE ?auto_12694 ) ( SURFACE-AT ?auto_12666 ?auto_12691 ) ( ON ?auto_12666 ?auto_12688 ) ( CLEAR ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12665 ?auto_12688 ) ) ( not ( = ?auto_12666 ?auto_12688 ) ) ( not ( = ?auto_12673 ?auto_12694 ) ) ( IS-CRATE ?auto_12665 ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( HOIST-AT ?auto_12689 ?auto_12677 ) ( AVAILABLE ?auto_12689 ) ( SURFACE-AT ?auto_12665 ?auto_12677 ) ( ON ?auto_12665 ?auto_12692 ) ( CLEAR ?auto_12665 ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12692 ) ) ( not ( = ?auto_12665 ?auto_12692 ) ) ( not ( = ?auto_12673 ?auto_12689 ) ) ( IS-CRATE ?auto_12664 ) ( not ( = ?auto_12687 ?auto_12676 ) ) ( HOIST-AT ?auto_12686 ?auto_12687 ) ( AVAILABLE ?auto_12686 ) ( SURFACE-AT ?auto_12664 ?auto_12687 ) ( ON ?auto_12664 ?auto_12683 ) ( CLEAR ?auto_12664 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( not ( = ?auto_12663 ?auto_12683 ) ) ( not ( = ?auto_12664 ?auto_12683 ) ) ( not ( = ?auto_12673 ?auto_12686 ) ) ( SURFACE-AT ?auto_12662 ?auto_12676 ) ( CLEAR ?auto_12662 ) ( IS-CRATE ?auto_12663 ) ( AVAILABLE ?auto_12673 ) ( not ( = ?auto_12684 ?auto_12676 ) ) ( HOIST-AT ?auto_12685 ?auto_12684 ) ( AVAILABLE ?auto_12685 ) ( SURFACE-AT ?auto_12663 ?auto_12684 ) ( ON ?auto_12663 ?auto_12679 ) ( CLEAR ?auto_12663 ) ( TRUCK-AT ?auto_12672 ?auto_12676 ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( not ( = ?auto_12662 ?auto_12679 ) ) ( not ( = ?auto_12663 ?auto_12679 ) ) ( not ( = ?auto_12673 ?auto_12685 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) ( not ( = ?auto_12662 ?auto_12683 ) ) ( not ( = ?auto_12664 ?auto_12679 ) ) ( not ( = ?auto_12687 ?auto_12684 ) ) ( not ( = ?auto_12686 ?auto_12685 ) ) ( not ( = ?auto_12683 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12665 ) ) ( not ( = ?auto_12662 ?auto_12692 ) ) ( not ( = ?auto_12663 ?auto_12665 ) ) ( not ( = ?auto_12663 ?auto_12692 ) ) ( not ( = ?auto_12665 ?auto_12683 ) ) ( not ( = ?auto_12665 ?auto_12679 ) ) ( not ( = ?auto_12677 ?auto_12687 ) ) ( not ( = ?auto_12677 ?auto_12684 ) ) ( not ( = ?auto_12689 ?auto_12686 ) ) ( not ( = ?auto_12689 ?auto_12685 ) ) ( not ( = ?auto_12692 ?auto_12683 ) ) ( not ( = ?auto_12692 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12666 ) ) ( not ( = ?auto_12662 ?auto_12688 ) ) ( not ( = ?auto_12663 ?auto_12666 ) ) ( not ( = ?auto_12663 ?auto_12688 ) ) ( not ( = ?auto_12664 ?auto_12666 ) ) ( not ( = ?auto_12664 ?auto_12688 ) ) ( not ( = ?auto_12666 ?auto_12692 ) ) ( not ( = ?auto_12666 ?auto_12683 ) ) ( not ( = ?auto_12666 ?auto_12679 ) ) ( not ( = ?auto_12691 ?auto_12677 ) ) ( not ( = ?auto_12691 ?auto_12687 ) ) ( not ( = ?auto_12691 ?auto_12684 ) ) ( not ( = ?auto_12694 ?auto_12689 ) ) ( not ( = ?auto_12694 ?auto_12686 ) ) ( not ( = ?auto_12694 ?auto_12685 ) ) ( not ( = ?auto_12688 ?auto_12692 ) ) ( not ( = ?auto_12688 ?auto_12683 ) ) ( not ( = ?auto_12688 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12667 ) ) ( not ( = ?auto_12662 ?auto_12693 ) ) ( not ( = ?auto_12663 ?auto_12667 ) ) ( not ( = ?auto_12663 ?auto_12693 ) ) ( not ( = ?auto_12664 ?auto_12667 ) ) ( not ( = ?auto_12664 ?auto_12693 ) ) ( not ( = ?auto_12665 ?auto_12667 ) ) ( not ( = ?auto_12665 ?auto_12693 ) ) ( not ( = ?auto_12667 ?auto_12688 ) ) ( not ( = ?auto_12667 ?auto_12692 ) ) ( not ( = ?auto_12667 ?auto_12683 ) ) ( not ( = ?auto_12667 ?auto_12679 ) ) ( not ( = ?auto_12678 ?auto_12691 ) ) ( not ( = ?auto_12678 ?auto_12677 ) ) ( not ( = ?auto_12678 ?auto_12687 ) ) ( not ( = ?auto_12678 ?auto_12684 ) ) ( not ( = ?auto_12690 ?auto_12694 ) ) ( not ( = ?auto_12690 ?auto_12689 ) ) ( not ( = ?auto_12690 ?auto_12686 ) ) ( not ( = ?auto_12690 ?auto_12685 ) ) ( not ( = ?auto_12693 ?auto_12688 ) ) ( not ( = ?auto_12693 ?auto_12692 ) ) ( not ( = ?auto_12693 ?auto_12683 ) ) ( not ( = ?auto_12693 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12670 ) ) ( not ( = ?auto_12662 ?auto_12681 ) ) ( not ( = ?auto_12663 ?auto_12670 ) ) ( not ( = ?auto_12663 ?auto_12681 ) ) ( not ( = ?auto_12664 ?auto_12670 ) ) ( not ( = ?auto_12664 ?auto_12681 ) ) ( not ( = ?auto_12665 ?auto_12670 ) ) ( not ( = ?auto_12665 ?auto_12681 ) ) ( not ( = ?auto_12666 ?auto_12670 ) ) ( not ( = ?auto_12666 ?auto_12681 ) ) ( not ( = ?auto_12670 ?auto_12693 ) ) ( not ( = ?auto_12670 ?auto_12688 ) ) ( not ( = ?auto_12670 ?auto_12692 ) ) ( not ( = ?auto_12670 ?auto_12683 ) ) ( not ( = ?auto_12670 ?auto_12679 ) ) ( not ( = ?auto_12682 ?auto_12678 ) ) ( not ( = ?auto_12682 ?auto_12691 ) ) ( not ( = ?auto_12682 ?auto_12677 ) ) ( not ( = ?auto_12682 ?auto_12687 ) ) ( not ( = ?auto_12682 ?auto_12684 ) ) ( not ( = ?auto_12680 ?auto_12690 ) ) ( not ( = ?auto_12680 ?auto_12694 ) ) ( not ( = ?auto_12680 ?auto_12689 ) ) ( not ( = ?auto_12680 ?auto_12686 ) ) ( not ( = ?auto_12680 ?auto_12685 ) ) ( not ( = ?auto_12681 ?auto_12693 ) ) ( not ( = ?auto_12681 ?auto_12688 ) ) ( not ( = ?auto_12681 ?auto_12692 ) ) ( not ( = ?auto_12681 ?auto_12683 ) ) ( not ( = ?auto_12681 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12669 ) ) ( not ( = ?auto_12662 ?auto_12696 ) ) ( not ( = ?auto_12663 ?auto_12669 ) ) ( not ( = ?auto_12663 ?auto_12696 ) ) ( not ( = ?auto_12664 ?auto_12669 ) ) ( not ( = ?auto_12664 ?auto_12696 ) ) ( not ( = ?auto_12665 ?auto_12669 ) ) ( not ( = ?auto_12665 ?auto_12696 ) ) ( not ( = ?auto_12666 ?auto_12669 ) ) ( not ( = ?auto_12666 ?auto_12696 ) ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( not ( = ?auto_12667 ?auto_12696 ) ) ( not ( = ?auto_12669 ?auto_12681 ) ) ( not ( = ?auto_12669 ?auto_12693 ) ) ( not ( = ?auto_12669 ?auto_12688 ) ) ( not ( = ?auto_12669 ?auto_12692 ) ) ( not ( = ?auto_12669 ?auto_12683 ) ) ( not ( = ?auto_12669 ?auto_12679 ) ) ( not ( = ?auto_12697 ?auto_12682 ) ) ( not ( = ?auto_12697 ?auto_12678 ) ) ( not ( = ?auto_12697 ?auto_12691 ) ) ( not ( = ?auto_12697 ?auto_12677 ) ) ( not ( = ?auto_12697 ?auto_12687 ) ) ( not ( = ?auto_12697 ?auto_12684 ) ) ( not ( = ?auto_12695 ?auto_12680 ) ) ( not ( = ?auto_12695 ?auto_12690 ) ) ( not ( = ?auto_12695 ?auto_12694 ) ) ( not ( = ?auto_12695 ?auto_12689 ) ) ( not ( = ?auto_12695 ?auto_12686 ) ) ( not ( = ?auto_12695 ?auto_12685 ) ) ( not ( = ?auto_12696 ?auto_12681 ) ) ( not ( = ?auto_12696 ?auto_12693 ) ) ( not ( = ?auto_12696 ?auto_12688 ) ) ( not ( = ?auto_12696 ?auto_12692 ) ) ( not ( = ?auto_12696 ?auto_12683 ) ) ( not ( = ?auto_12696 ?auto_12679 ) ) ( not ( = ?auto_12662 ?auto_12668 ) ) ( not ( = ?auto_12662 ?auto_12671 ) ) ( not ( = ?auto_12663 ?auto_12668 ) ) ( not ( = ?auto_12663 ?auto_12671 ) ) ( not ( = ?auto_12664 ?auto_12668 ) ) ( not ( = ?auto_12664 ?auto_12671 ) ) ( not ( = ?auto_12665 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12671 ) ) ( not ( = ?auto_12666 ?auto_12668 ) ) ( not ( = ?auto_12666 ?auto_12671 ) ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12667 ?auto_12671 ) ) ( not ( = ?auto_12670 ?auto_12668 ) ) ( not ( = ?auto_12670 ?auto_12671 ) ) ( not ( = ?auto_12668 ?auto_12696 ) ) ( not ( = ?auto_12668 ?auto_12681 ) ) ( not ( = ?auto_12668 ?auto_12693 ) ) ( not ( = ?auto_12668 ?auto_12688 ) ) ( not ( = ?auto_12668 ?auto_12692 ) ) ( not ( = ?auto_12668 ?auto_12683 ) ) ( not ( = ?auto_12668 ?auto_12679 ) ) ( not ( = ?auto_12674 ?auto_12697 ) ) ( not ( = ?auto_12674 ?auto_12682 ) ) ( not ( = ?auto_12674 ?auto_12678 ) ) ( not ( = ?auto_12674 ?auto_12691 ) ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12674 ?auto_12687 ) ) ( not ( = ?auto_12674 ?auto_12684 ) ) ( not ( = ?auto_12675 ?auto_12695 ) ) ( not ( = ?auto_12675 ?auto_12680 ) ) ( not ( = ?auto_12675 ?auto_12690 ) ) ( not ( = ?auto_12675 ?auto_12694 ) ) ( not ( = ?auto_12675 ?auto_12689 ) ) ( not ( = ?auto_12675 ?auto_12686 ) ) ( not ( = ?auto_12675 ?auto_12685 ) ) ( not ( = ?auto_12671 ?auto_12696 ) ) ( not ( = ?auto_12671 ?auto_12681 ) ) ( not ( = ?auto_12671 ?auto_12693 ) ) ( not ( = ?auto_12671 ?auto_12688 ) ) ( not ( = ?auto_12671 ?auto_12692 ) ) ( not ( = ?auto_12671 ?auto_12683 ) ) ( not ( = ?auto_12671 ?auto_12679 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12662 ?auto_12663 ?auto_12664 ?auto_12665 ?auto_12666 ?auto_12667 ?auto_12670 ?auto_12669 )
      ( MAKE-1CRATE ?auto_12669 ?auto_12668 )
      ( MAKE-8CRATE-VERIFY ?auto_12662 ?auto_12663 ?auto_12664 ?auto_12665 ?auto_12666 ?auto_12667 ?auto_12670 ?auto_12669 ?auto_12668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12700 - SURFACE
      ?auto_12701 - SURFACE
    )
    :vars
    (
      ?auto_12702 - HOIST
      ?auto_12703 - PLACE
      ?auto_12705 - PLACE
      ?auto_12706 - HOIST
      ?auto_12707 - SURFACE
      ?auto_12704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12702 ?auto_12703 ) ( SURFACE-AT ?auto_12700 ?auto_12703 ) ( CLEAR ?auto_12700 ) ( IS-CRATE ?auto_12701 ) ( AVAILABLE ?auto_12702 ) ( not ( = ?auto_12705 ?auto_12703 ) ) ( HOIST-AT ?auto_12706 ?auto_12705 ) ( AVAILABLE ?auto_12706 ) ( SURFACE-AT ?auto_12701 ?auto_12705 ) ( ON ?auto_12701 ?auto_12707 ) ( CLEAR ?auto_12701 ) ( TRUCK-AT ?auto_12704 ?auto_12703 ) ( not ( = ?auto_12700 ?auto_12701 ) ) ( not ( = ?auto_12700 ?auto_12707 ) ) ( not ( = ?auto_12701 ?auto_12707 ) ) ( not ( = ?auto_12702 ?auto_12706 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12704 ?auto_12703 ?auto_12705 )
      ( !LIFT ?auto_12706 ?auto_12701 ?auto_12707 ?auto_12705 )
      ( !LOAD ?auto_12706 ?auto_12701 ?auto_12704 ?auto_12705 )
      ( !DRIVE ?auto_12704 ?auto_12705 ?auto_12703 )
      ( !UNLOAD ?auto_12702 ?auto_12701 ?auto_12704 ?auto_12703 )
      ( !DROP ?auto_12702 ?auto_12701 ?auto_12700 ?auto_12703 )
      ( MAKE-1CRATE-VERIFY ?auto_12700 ?auto_12701 ) )
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
      ?auto_12726 - SURFACE
      ?auto_12725 - SURFACE
      ?auto_12724 - SURFACE
      ?auto_12727 - SURFACE
    )
    :vars
    (
      ?auto_12731 - HOIST
      ?auto_12732 - PLACE
      ?auto_12729 - PLACE
      ?auto_12728 - HOIST
      ?auto_12733 - SURFACE
      ?auto_12735 - SURFACE
      ?auto_12743 - PLACE
      ?auto_12742 - HOIST
      ?auto_12744 - SURFACE
      ?auto_12754 - PLACE
      ?auto_12734 - HOIST
      ?auto_12755 - SURFACE
      ?auto_12738 - PLACE
      ?auto_12751 - HOIST
      ?auto_12741 - SURFACE
      ?auto_12736 - PLACE
      ?auto_12737 - HOIST
      ?auto_12749 - SURFACE
      ?auto_12740 - PLACE
      ?auto_12750 - HOIST
      ?auto_12745 - SURFACE
      ?auto_12747 - PLACE
      ?auto_12748 - HOIST
      ?auto_12753 - SURFACE
      ?auto_12752 - PLACE
      ?auto_12746 - HOIST
      ?auto_12739 - SURFACE
      ?auto_12730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12731 ?auto_12732 ) ( IS-CRATE ?auto_12727 ) ( not ( = ?auto_12729 ?auto_12732 ) ) ( HOIST-AT ?auto_12728 ?auto_12729 ) ( SURFACE-AT ?auto_12727 ?auto_12729 ) ( ON ?auto_12727 ?auto_12733 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12724 ?auto_12727 ) ) ( not ( = ?auto_12724 ?auto_12733 ) ) ( not ( = ?auto_12727 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12728 ) ) ( IS-CRATE ?auto_12724 ) ( AVAILABLE ?auto_12728 ) ( SURFACE-AT ?auto_12724 ?auto_12729 ) ( ON ?auto_12724 ?auto_12735 ) ( CLEAR ?auto_12724 ) ( not ( = ?auto_12725 ?auto_12724 ) ) ( not ( = ?auto_12725 ?auto_12735 ) ) ( not ( = ?auto_12724 ?auto_12735 ) ) ( IS-CRATE ?auto_12725 ) ( not ( = ?auto_12743 ?auto_12732 ) ) ( HOIST-AT ?auto_12742 ?auto_12743 ) ( AVAILABLE ?auto_12742 ) ( SURFACE-AT ?auto_12725 ?auto_12743 ) ( ON ?auto_12725 ?auto_12744 ) ( CLEAR ?auto_12725 ) ( not ( = ?auto_12726 ?auto_12725 ) ) ( not ( = ?auto_12726 ?auto_12744 ) ) ( not ( = ?auto_12725 ?auto_12744 ) ) ( not ( = ?auto_12731 ?auto_12742 ) ) ( IS-CRATE ?auto_12726 ) ( not ( = ?auto_12754 ?auto_12732 ) ) ( HOIST-AT ?auto_12734 ?auto_12754 ) ( AVAILABLE ?auto_12734 ) ( SURFACE-AT ?auto_12726 ?auto_12754 ) ( ON ?auto_12726 ?auto_12755 ) ( CLEAR ?auto_12726 ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12755 ) ) ( not ( = ?auto_12726 ?auto_12755 ) ) ( not ( = ?auto_12731 ?auto_12734 ) ) ( IS-CRATE ?auto_12723 ) ( not ( = ?auto_12738 ?auto_12732 ) ) ( HOIST-AT ?auto_12751 ?auto_12738 ) ( AVAILABLE ?auto_12751 ) ( SURFACE-AT ?auto_12723 ?auto_12738 ) ( ON ?auto_12723 ?auto_12741 ) ( CLEAR ?auto_12723 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12741 ) ) ( not ( = ?auto_12723 ?auto_12741 ) ) ( not ( = ?auto_12731 ?auto_12751 ) ) ( IS-CRATE ?auto_12722 ) ( not ( = ?auto_12736 ?auto_12732 ) ) ( HOIST-AT ?auto_12737 ?auto_12736 ) ( AVAILABLE ?auto_12737 ) ( SURFACE-AT ?auto_12722 ?auto_12736 ) ( ON ?auto_12722 ?auto_12749 ) ( CLEAR ?auto_12722 ) ( not ( = ?auto_12721 ?auto_12722 ) ) ( not ( = ?auto_12721 ?auto_12749 ) ) ( not ( = ?auto_12722 ?auto_12749 ) ) ( not ( = ?auto_12731 ?auto_12737 ) ) ( IS-CRATE ?auto_12721 ) ( not ( = ?auto_12740 ?auto_12732 ) ) ( HOIST-AT ?auto_12750 ?auto_12740 ) ( AVAILABLE ?auto_12750 ) ( SURFACE-AT ?auto_12721 ?auto_12740 ) ( ON ?auto_12721 ?auto_12745 ) ( CLEAR ?auto_12721 ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( not ( = ?auto_12720 ?auto_12745 ) ) ( not ( = ?auto_12721 ?auto_12745 ) ) ( not ( = ?auto_12731 ?auto_12750 ) ) ( IS-CRATE ?auto_12720 ) ( not ( = ?auto_12747 ?auto_12732 ) ) ( HOIST-AT ?auto_12748 ?auto_12747 ) ( AVAILABLE ?auto_12748 ) ( SURFACE-AT ?auto_12720 ?auto_12747 ) ( ON ?auto_12720 ?auto_12753 ) ( CLEAR ?auto_12720 ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12753 ) ) ( not ( = ?auto_12720 ?auto_12753 ) ) ( not ( = ?auto_12731 ?auto_12748 ) ) ( SURFACE-AT ?auto_12718 ?auto_12732 ) ( CLEAR ?auto_12718 ) ( IS-CRATE ?auto_12719 ) ( AVAILABLE ?auto_12731 ) ( not ( = ?auto_12752 ?auto_12732 ) ) ( HOIST-AT ?auto_12746 ?auto_12752 ) ( AVAILABLE ?auto_12746 ) ( SURFACE-AT ?auto_12719 ?auto_12752 ) ( ON ?auto_12719 ?auto_12739 ) ( CLEAR ?auto_12719 ) ( TRUCK-AT ?auto_12730 ?auto_12732 ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12739 ) ) ( not ( = ?auto_12719 ?auto_12739 ) ) ( not ( = ?auto_12731 ?auto_12746 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12753 ) ) ( not ( = ?auto_12720 ?auto_12739 ) ) ( not ( = ?auto_12747 ?auto_12752 ) ) ( not ( = ?auto_12748 ?auto_12746 ) ) ( not ( = ?auto_12753 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12721 ) ) ( not ( = ?auto_12718 ?auto_12745 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12745 ) ) ( not ( = ?auto_12721 ?auto_12753 ) ) ( not ( = ?auto_12721 ?auto_12739 ) ) ( not ( = ?auto_12740 ?auto_12747 ) ) ( not ( = ?auto_12740 ?auto_12752 ) ) ( not ( = ?auto_12750 ?auto_12748 ) ) ( not ( = ?auto_12750 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12753 ) ) ( not ( = ?auto_12745 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( not ( = ?auto_12718 ?auto_12749 ) ) ( not ( = ?auto_12719 ?auto_12722 ) ) ( not ( = ?auto_12719 ?auto_12749 ) ) ( not ( = ?auto_12720 ?auto_12722 ) ) ( not ( = ?auto_12720 ?auto_12749 ) ) ( not ( = ?auto_12722 ?auto_12745 ) ) ( not ( = ?auto_12722 ?auto_12753 ) ) ( not ( = ?auto_12722 ?auto_12739 ) ) ( not ( = ?auto_12736 ?auto_12740 ) ) ( not ( = ?auto_12736 ?auto_12747 ) ) ( not ( = ?auto_12736 ?auto_12752 ) ) ( not ( = ?auto_12737 ?auto_12750 ) ) ( not ( = ?auto_12737 ?auto_12748 ) ) ( not ( = ?auto_12737 ?auto_12746 ) ) ( not ( = ?auto_12749 ?auto_12745 ) ) ( not ( = ?auto_12749 ?auto_12753 ) ) ( not ( = ?auto_12749 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12723 ) ) ( not ( = ?auto_12718 ?auto_12741 ) ) ( not ( = ?auto_12719 ?auto_12723 ) ) ( not ( = ?auto_12719 ?auto_12741 ) ) ( not ( = ?auto_12720 ?auto_12723 ) ) ( not ( = ?auto_12720 ?auto_12741 ) ) ( not ( = ?auto_12721 ?auto_12723 ) ) ( not ( = ?auto_12721 ?auto_12741 ) ) ( not ( = ?auto_12723 ?auto_12749 ) ) ( not ( = ?auto_12723 ?auto_12745 ) ) ( not ( = ?auto_12723 ?auto_12753 ) ) ( not ( = ?auto_12723 ?auto_12739 ) ) ( not ( = ?auto_12738 ?auto_12736 ) ) ( not ( = ?auto_12738 ?auto_12740 ) ) ( not ( = ?auto_12738 ?auto_12747 ) ) ( not ( = ?auto_12738 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12737 ) ) ( not ( = ?auto_12751 ?auto_12750 ) ) ( not ( = ?auto_12751 ?auto_12748 ) ) ( not ( = ?auto_12751 ?auto_12746 ) ) ( not ( = ?auto_12741 ?auto_12749 ) ) ( not ( = ?auto_12741 ?auto_12745 ) ) ( not ( = ?auto_12741 ?auto_12753 ) ) ( not ( = ?auto_12741 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12726 ) ) ( not ( = ?auto_12718 ?auto_12755 ) ) ( not ( = ?auto_12719 ?auto_12726 ) ) ( not ( = ?auto_12719 ?auto_12755 ) ) ( not ( = ?auto_12720 ?auto_12726 ) ) ( not ( = ?auto_12720 ?auto_12755 ) ) ( not ( = ?auto_12721 ?auto_12726 ) ) ( not ( = ?auto_12721 ?auto_12755 ) ) ( not ( = ?auto_12722 ?auto_12726 ) ) ( not ( = ?auto_12722 ?auto_12755 ) ) ( not ( = ?auto_12726 ?auto_12741 ) ) ( not ( = ?auto_12726 ?auto_12749 ) ) ( not ( = ?auto_12726 ?auto_12745 ) ) ( not ( = ?auto_12726 ?auto_12753 ) ) ( not ( = ?auto_12726 ?auto_12739 ) ) ( not ( = ?auto_12754 ?auto_12738 ) ) ( not ( = ?auto_12754 ?auto_12736 ) ) ( not ( = ?auto_12754 ?auto_12740 ) ) ( not ( = ?auto_12754 ?auto_12747 ) ) ( not ( = ?auto_12754 ?auto_12752 ) ) ( not ( = ?auto_12734 ?auto_12751 ) ) ( not ( = ?auto_12734 ?auto_12737 ) ) ( not ( = ?auto_12734 ?auto_12750 ) ) ( not ( = ?auto_12734 ?auto_12748 ) ) ( not ( = ?auto_12734 ?auto_12746 ) ) ( not ( = ?auto_12755 ?auto_12741 ) ) ( not ( = ?auto_12755 ?auto_12749 ) ) ( not ( = ?auto_12755 ?auto_12745 ) ) ( not ( = ?auto_12755 ?auto_12753 ) ) ( not ( = ?auto_12755 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12725 ) ) ( not ( = ?auto_12718 ?auto_12744 ) ) ( not ( = ?auto_12719 ?auto_12725 ) ) ( not ( = ?auto_12719 ?auto_12744 ) ) ( not ( = ?auto_12720 ?auto_12725 ) ) ( not ( = ?auto_12720 ?auto_12744 ) ) ( not ( = ?auto_12721 ?auto_12725 ) ) ( not ( = ?auto_12721 ?auto_12744 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12744 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12744 ) ) ( not ( = ?auto_12725 ?auto_12755 ) ) ( not ( = ?auto_12725 ?auto_12741 ) ) ( not ( = ?auto_12725 ?auto_12749 ) ) ( not ( = ?auto_12725 ?auto_12745 ) ) ( not ( = ?auto_12725 ?auto_12753 ) ) ( not ( = ?auto_12725 ?auto_12739 ) ) ( not ( = ?auto_12743 ?auto_12754 ) ) ( not ( = ?auto_12743 ?auto_12738 ) ) ( not ( = ?auto_12743 ?auto_12736 ) ) ( not ( = ?auto_12743 ?auto_12740 ) ) ( not ( = ?auto_12743 ?auto_12747 ) ) ( not ( = ?auto_12743 ?auto_12752 ) ) ( not ( = ?auto_12742 ?auto_12734 ) ) ( not ( = ?auto_12742 ?auto_12751 ) ) ( not ( = ?auto_12742 ?auto_12737 ) ) ( not ( = ?auto_12742 ?auto_12750 ) ) ( not ( = ?auto_12742 ?auto_12748 ) ) ( not ( = ?auto_12742 ?auto_12746 ) ) ( not ( = ?auto_12744 ?auto_12755 ) ) ( not ( = ?auto_12744 ?auto_12741 ) ) ( not ( = ?auto_12744 ?auto_12749 ) ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12744 ?auto_12753 ) ) ( not ( = ?auto_12744 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12724 ) ) ( not ( = ?auto_12718 ?auto_12735 ) ) ( not ( = ?auto_12719 ?auto_12724 ) ) ( not ( = ?auto_12719 ?auto_12735 ) ) ( not ( = ?auto_12720 ?auto_12724 ) ) ( not ( = ?auto_12720 ?auto_12735 ) ) ( not ( = ?auto_12721 ?auto_12724 ) ) ( not ( = ?auto_12721 ?auto_12735 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12735 ) ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12735 ) ) ( not ( = ?auto_12726 ?auto_12724 ) ) ( not ( = ?auto_12726 ?auto_12735 ) ) ( not ( = ?auto_12724 ?auto_12744 ) ) ( not ( = ?auto_12724 ?auto_12755 ) ) ( not ( = ?auto_12724 ?auto_12741 ) ) ( not ( = ?auto_12724 ?auto_12749 ) ) ( not ( = ?auto_12724 ?auto_12745 ) ) ( not ( = ?auto_12724 ?auto_12753 ) ) ( not ( = ?auto_12724 ?auto_12739 ) ) ( not ( = ?auto_12729 ?auto_12743 ) ) ( not ( = ?auto_12729 ?auto_12754 ) ) ( not ( = ?auto_12729 ?auto_12738 ) ) ( not ( = ?auto_12729 ?auto_12736 ) ) ( not ( = ?auto_12729 ?auto_12740 ) ) ( not ( = ?auto_12729 ?auto_12747 ) ) ( not ( = ?auto_12729 ?auto_12752 ) ) ( not ( = ?auto_12728 ?auto_12742 ) ) ( not ( = ?auto_12728 ?auto_12734 ) ) ( not ( = ?auto_12728 ?auto_12751 ) ) ( not ( = ?auto_12728 ?auto_12737 ) ) ( not ( = ?auto_12728 ?auto_12750 ) ) ( not ( = ?auto_12728 ?auto_12748 ) ) ( not ( = ?auto_12728 ?auto_12746 ) ) ( not ( = ?auto_12735 ?auto_12744 ) ) ( not ( = ?auto_12735 ?auto_12755 ) ) ( not ( = ?auto_12735 ?auto_12741 ) ) ( not ( = ?auto_12735 ?auto_12749 ) ) ( not ( = ?auto_12735 ?auto_12745 ) ) ( not ( = ?auto_12735 ?auto_12753 ) ) ( not ( = ?auto_12735 ?auto_12739 ) ) ( not ( = ?auto_12718 ?auto_12727 ) ) ( not ( = ?auto_12718 ?auto_12733 ) ) ( not ( = ?auto_12719 ?auto_12727 ) ) ( not ( = ?auto_12719 ?auto_12733 ) ) ( not ( = ?auto_12720 ?auto_12727 ) ) ( not ( = ?auto_12720 ?auto_12733 ) ) ( not ( = ?auto_12721 ?auto_12727 ) ) ( not ( = ?auto_12721 ?auto_12733 ) ) ( not ( = ?auto_12722 ?auto_12727 ) ) ( not ( = ?auto_12722 ?auto_12733 ) ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12733 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12733 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12725 ?auto_12733 ) ) ( not ( = ?auto_12727 ?auto_12735 ) ) ( not ( = ?auto_12727 ?auto_12744 ) ) ( not ( = ?auto_12727 ?auto_12755 ) ) ( not ( = ?auto_12727 ?auto_12741 ) ) ( not ( = ?auto_12727 ?auto_12749 ) ) ( not ( = ?auto_12727 ?auto_12745 ) ) ( not ( = ?auto_12727 ?auto_12753 ) ) ( not ( = ?auto_12727 ?auto_12739 ) ) ( not ( = ?auto_12733 ?auto_12735 ) ) ( not ( = ?auto_12733 ?auto_12744 ) ) ( not ( = ?auto_12733 ?auto_12755 ) ) ( not ( = ?auto_12733 ?auto_12741 ) ) ( not ( = ?auto_12733 ?auto_12749 ) ) ( not ( = ?auto_12733 ?auto_12745 ) ) ( not ( = ?auto_12733 ?auto_12753 ) ) ( not ( = ?auto_12733 ?auto_12739 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12722 ?auto_12723 ?auto_12726 ?auto_12725 ?auto_12724 )
      ( MAKE-1CRATE ?auto_12724 ?auto_12727 )
      ( MAKE-9CRATE-VERIFY ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12722 ?auto_12723 ?auto_12726 ?auto_12725 ?auto_12724 ?auto_12727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12758 - SURFACE
      ?auto_12759 - SURFACE
    )
    :vars
    (
      ?auto_12760 - HOIST
      ?auto_12761 - PLACE
      ?auto_12763 - PLACE
      ?auto_12764 - HOIST
      ?auto_12765 - SURFACE
      ?auto_12762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12760 ?auto_12761 ) ( SURFACE-AT ?auto_12758 ?auto_12761 ) ( CLEAR ?auto_12758 ) ( IS-CRATE ?auto_12759 ) ( AVAILABLE ?auto_12760 ) ( not ( = ?auto_12763 ?auto_12761 ) ) ( HOIST-AT ?auto_12764 ?auto_12763 ) ( AVAILABLE ?auto_12764 ) ( SURFACE-AT ?auto_12759 ?auto_12763 ) ( ON ?auto_12759 ?auto_12765 ) ( CLEAR ?auto_12759 ) ( TRUCK-AT ?auto_12762 ?auto_12761 ) ( not ( = ?auto_12758 ?auto_12759 ) ) ( not ( = ?auto_12758 ?auto_12765 ) ) ( not ( = ?auto_12759 ?auto_12765 ) ) ( not ( = ?auto_12760 ?auto_12764 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12762 ?auto_12761 ?auto_12763 )
      ( !LIFT ?auto_12764 ?auto_12759 ?auto_12765 ?auto_12763 )
      ( !LOAD ?auto_12764 ?auto_12759 ?auto_12762 ?auto_12763 )
      ( !DRIVE ?auto_12762 ?auto_12763 ?auto_12761 )
      ( !UNLOAD ?auto_12760 ?auto_12759 ?auto_12762 ?auto_12761 )
      ( !DROP ?auto_12760 ?auto_12759 ?auto_12758 ?auto_12761 )
      ( MAKE-1CRATE-VERIFY ?auto_12758 ?auto_12759 ) )
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
      ?auto_12785 - SURFACE
      ?auto_12784 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12786 - SURFACE
      ?auto_12787 - SURFACE
    )
    :vars
    (
      ?auto_12791 - HOIST
      ?auto_12788 - PLACE
      ?auto_12789 - PLACE
      ?auto_12793 - HOIST
      ?auto_12792 - SURFACE
      ?auto_12810 - PLACE
      ?auto_12797 - HOIST
      ?auto_12813 - SURFACE
      ?auto_12796 - SURFACE
      ?auto_12801 - PLACE
      ?auto_12798 - HOIST
      ?auto_12799 - SURFACE
      ?auto_12803 - PLACE
      ?auto_12816 - HOIST
      ?auto_12794 - SURFACE
      ?auto_12809 - PLACE
      ?auto_12814 - HOIST
      ?auto_12806 - SURFACE
      ?auto_12812 - SURFACE
      ?auto_12807 - PLACE
      ?auto_12800 - HOIST
      ?auto_12802 - SURFACE
      ?auto_12805 - PLACE
      ?auto_12815 - HOIST
      ?auto_12811 - SURFACE
      ?auto_12795 - PLACE
      ?auto_12804 - HOIST
      ?auto_12808 - SURFACE
      ?auto_12790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12791 ?auto_12788 ) ( IS-CRATE ?auto_12787 ) ( not ( = ?auto_12789 ?auto_12788 ) ) ( HOIST-AT ?auto_12793 ?auto_12789 ) ( SURFACE-AT ?auto_12787 ?auto_12789 ) ( ON ?auto_12787 ?auto_12792 ) ( CLEAR ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12792 ) ) ( not ( = ?auto_12787 ?auto_12792 ) ) ( not ( = ?auto_12791 ?auto_12793 ) ) ( IS-CRATE ?auto_12786 ) ( not ( = ?auto_12810 ?auto_12788 ) ) ( HOIST-AT ?auto_12797 ?auto_12810 ) ( SURFACE-AT ?auto_12786 ?auto_12810 ) ( ON ?auto_12786 ?auto_12813 ) ( CLEAR ?auto_12786 ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12783 ?auto_12813 ) ) ( not ( = ?auto_12786 ?auto_12813 ) ) ( not ( = ?auto_12791 ?auto_12797 ) ) ( IS-CRATE ?auto_12783 ) ( AVAILABLE ?auto_12797 ) ( SURFACE-AT ?auto_12783 ?auto_12810 ) ( ON ?auto_12783 ?auto_12796 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12784 ?auto_12783 ) ) ( not ( = ?auto_12784 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12796 ) ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12801 ?auto_12788 ) ) ( HOIST-AT ?auto_12798 ?auto_12801 ) ( AVAILABLE ?auto_12798 ) ( SURFACE-AT ?auto_12784 ?auto_12801 ) ( ON ?auto_12784 ?auto_12799 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12785 ?auto_12784 ) ) ( not ( = ?auto_12785 ?auto_12799 ) ) ( not ( = ?auto_12784 ?auto_12799 ) ) ( not ( = ?auto_12791 ?auto_12798 ) ) ( IS-CRATE ?auto_12785 ) ( not ( = ?auto_12803 ?auto_12788 ) ) ( HOIST-AT ?auto_12816 ?auto_12803 ) ( AVAILABLE ?auto_12816 ) ( SURFACE-AT ?auto_12785 ?auto_12803 ) ( ON ?auto_12785 ?auto_12794 ) ( CLEAR ?auto_12785 ) ( not ( = ?auto_12782 ?auto_12785 ) ) ( not ( = ?auto_12782 ?auto_12794 ) ) ( not ( = ?auto_12785 ?auto_12794 ) ) ( not ( = ?auto_12791 ?auto_12816 ) ) ( IS-CRATE ?auto_12782 ) ( not ( = ?auto_12809 ?auto_12788 ) ) ( HOIST-AT ?auto_12814 ?auto_12809 ) ( AVAILABLE ?auto_12814 ) ( SURFACE-AT ?auto_12782 ?auto_12809 ) ( ON ?auto_12782 ?auto_12806 ) ( CLEAR ?auto_12782 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12806 ) ) ( not ( = ?auto_12782 ?auto_12806 ) ) ( not ( = ?auto_12791 ?auto_12814 ) ) ( IS-CRATE ?auto_12781 ) ( AVAILABLE ?auto_12793 ) ( SURFACE-AT ?auto_12781 ?auto_12789 ) ( ON ?auto_12781 ?auto_12812 ) ( CLEAR ?auto_12781 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12812 ) ) ( not ( = ?auto_12781 ?auto_12812 ) ) ( IS-CRATE ?auto_12780 ) ( not ( = ?auto_12807 ?auto_12788 ) ) ( HOIST-AT ?auto_12800 ?auto_12807 ) ( AVAILABLE ?auto_12800 ) ( SURFACE-AT ?auto_12780 ?auto_12807 ) ( ON ?auto_12780 ?auto_12802 ) ( CLEAR ?auto_12780 ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12802 ) ) ( not ( = ?auto_12780 ?auto_12802 ) ) ( not ( = ?auto_12791 ?auto_12800 ) ) ( IS-CRATE ?auto_12779 ) ( not ( = ?auto_12805 ?auto_12788 ) ) ( HOIST-AT ?auto_12815 ?auto_12805 ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12779 ?auto_12805 ) ( ON ?auto_12779 ?auto_12811 ) ( CLEAR ?auto_12779 ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12811 ) ) ( not ( = ?auto_12779 ?auto_12811 ) ) ( not ( = ?auto_12791 ?auto_12815 ) ) ( SURFACE-AT ?auto_12777 ?auto_12788 ) ( CLEAR ?auto_12777 ) ( IS-CRATE ?auto_12778 ) ( AVAILABLE ?auto_12791 ) ( not ( = ?auto_12795 ?auto_12788 ) ) ( HOIST-AT ?auto_12804 ?auto_12795 ) ( AVAILABLE ?auto_12804 ) ( SURFACE-AT ?auto_12778 ?auto_12795 ) ( ON ?auto_12778 ?auto_12808 ) ( CLEAR ?auto_12778 ) ( TRUCK-AT ?auto_12790 ?auto_12788 ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12808 ) ) ( not ( = ?auto_12778 ?auto_12808 ) ) ( not ( = ?auto_12791 ?auto_12804 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12811 ) ) ( not ( = ?auto_12779 ?auto_12808 ) ) ( not ( = ?auto_12805 ?auto_12795 ) ) ( not ( = ?auto_12815 ?auto_12804 ) ) ( not ( = ?auto_12811 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12780 ) ) ( not ( = ?auto_12777 ?auto_12802 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12802 ) ) ( not ( = ?auto_12780 ?auto_12811 ) ) ( not ( = ?auto_12780 ?auto_12808 ) ) ( not ( = ?auto_12807 ?auto_12805 ) ) ( not ( = ?auto_12807 ?auto_12795 ) ) ( not ( = ?auto_12800 ?auto_12815 ) ) ( not ( = ?auto_12800 ?auto_12804 ) ) ( not ( = ?auto_12802 ?auto_12811 ) ) ( not ( = ?auto_12802 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12781 ) ) ( not ( = ?auto_12777 ?auto_12812 ) ) ( not ( = ?auto_12778 ?auto_12781 ) ) ( not ( = ?auto_12778 ?auto_12812 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12812 ) ) ( not ( = ?auto_12781 ?auto_12802 ) ) ( not ( = ?auto_12781 ?auto_12811 ) ) ( not ( = ?auto_12781 ?auto_12808 ) ) ( not ( = ?auto_12789 ?auto_12807 ) ) ( not ( = ?auto_12789 ?auto_12805 ) ) ( not ( = ?auto_12789 ?auto_12795 ) ) ( not ( = ?auto_12793 ?auto_12800 ) ) ( not ( = ?auto_12793 ?auto_12815 ) ) ( not ( = ?auto_12793 ?auto_12804 ) ) ( not ( = ?auto_12812 ?auto_12802 ) ) ( not ( = ?auto_12812 ?auto_12811 ) ) ( not ( = ?auto_12812 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12806 ) ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12778 ?auto_12806 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) ( not ( = ?auto_12779 ?auto_12806 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12806 ) ) ( not ( = ?auto_12782 ?auto_12812 ) ) ( not ( = ?auto_12782 ?auto_12802 ) ) ( not ( = ?auto_12782 ?auto_12811 ) ) ( not ( = ?auto_12782 ?auto_12808 ) ) ( not ( = ?auto_12809 ?auto_12789 ) ) ( not ( = ?auto_12809 ?auto_12807 ) ) ( not ( = ?auto_12809 ?auto_12805 ) ) ( not ( = ?auto_12809 ?auto_12795 ) ) ( not ( = ?auto_12814 ?auto_12793 ) ) ( not ( = ?auto_12814 ?auto_12800 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12804 ) ) ( not ( = ?auto_12806 ?auto_12812 ) ) ( not ( = ?auto_12806 ?auto_12802 ) ) ( not ( = ?auto_12806 ?auto_12811 ) ) ( not ( = ?auto_12806 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12785 ) ) ( not ( = ?auto_12777 ?auto_12794 ) ) ( not ( = ?auto_12778 ?auto_12785 ) ) ( not ( = ?auto_12778 ?auto_12794 ) ) ( not ( = ?auto_12779 ?auto_12785 ) ) ( not ( = ?auto_12779 ?auto_12794 ) ) ( not ( = ?auto_12780 ?auto_12785 ) ) ( not ( = ?auto_12780 ?auto_12794 ) ) ( not ( = ?auto_12781 ?auto_12785 ) ) ( not ( = ?auto_12781 ?auto_12794 ) ) ( not ( = ?auto_12785 ?auto_12806 ) ) ( not ( = ?auto_12785 ?auto_12812 ) ) ( not ( = ?auto_12785 ?auto_12802 ) ) ( not ( = ?auto_12785 ?auto_12811 ) ) ( not ( = ?auto_12785 ?auto_12808 ) ) ( not ( = ?auto_12803 ?auto_12809 ) ) ( not ( = ?auto_12803 ?auto_12789 ) ) ( not ( = ?auto_12803 ?auto_12807 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12795 ) ) ( not ( = ?auto_12816 ?auto_12814 ) ) ( not ( = ?auto_12816 ?auto_12793 ) ) ( not ( = ?auto_12816 ?auto_12800 ) ) ( not ( = ?auto_12816 ?auto_12815 ) ) ( not ( = ?auto_12816 ?auto_12804 ) ) ( not ( = ?auto_12794 ?auto_12806 ) ) ( not ( = ?auto_12794 ?auto_12812 ) ) ( not ( = ?auto_12794 ?auto_12802 ) ) ( not ( = ?auto_12794 ?auto_12811 ) ) ( not ( = ?auto_12794 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12784 ) ) ( not ( = ?auto_12777 ?auto_12799 ) ) ( not ( = ?auto_12778 ?auto_12784 ) ) ( not ( = ?auto_12778 ?auto_12799 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12799 ) ) ( not ( = ?auto_12780 ?auto_12784 ) ) ( not ( = ?auto_12780 ?auto_12799 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12799 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12799 ) ) ( not ( = ?auto_12784 ?auto_12794 ) ) ( not ( = ?auto_12784 ?auto_12806 ) ) ( not ( = ?auto_12784 ?auto_12812 ) ) ( not ( = ?auto_12784 ?auto_12802 ) ) ( not ( = ?auto_12784 ?auto_12811 ) ) ( not ( = ?auto_12784 ?auto_12808 ) ) ( not ( = ?auto_12801 ?auto_12803 ) ) ( not ( = ?auto_12801 ?auto_12809 ) ) ( not ( = ?auto_12801 ?auto_12789 ) ) ( not ( = ?auto_12801 ?auto_12807 ) ) ( not ( = ?auto_12801 ?auto_12805 ) ) ( not ( = ?auto_12801 ?auto_12795 ) ) ( not ( = ?auto_12798 ?auto_12816 ) ) ( not ( = ?auto_12798 ?auto_12814 ) ) ( not ( = ?auto_12798 ?auto_12793 ) ) ( not ( = ?auto_12798 ?auto_12800 ) ) ( not ( = ?auto_12798 ?auto_12815 ) ) ( not ( = ?auto_12798 ?auto_12804 ) ) ( not ( = ?auto_12799 ?auto_12794 ) ) ( not ( = ?auto_12799 ?auto_12806 ) ) ( not ( = ?auto_12799 ?auto_12812 ) ) ( not ( = ?auto_12799 ?auto_12802 ) ) ( not ( = ?auto_12799 ?auto_12811 ) ) ( not ( = ?auto_12799 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12783 ) ) ( not ( = ?auto_12777 ?auto_12796 ) ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12778 ?auto_12796 ) ) ( not ( = ?auto_12779 ?auto_12783 ) ) ( not ( = ?auto_12779 ?auto_12796 ) ) ( not ( = ?auto_12780 ?auto_12783 ) ) ( not ( = ?auto_12780 ?auto_12796 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12796 ) ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12796 ) ) ( not ( = ?auto_12785 ?auto_12783 ) ) ( not ( = ?auto_12785 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12799 ) ) ( not ( = ?auto_12783 ?auto_12794 ) ) ( not ( = ?auto_12783 ?auto_12806 ) ) ( not ( = ?auto_12783 ?auto_12812 ) ) ( not ( = ?auto_12783 ?auto_12802 ) ) ( not ( = ?auto_12783 ?auto_12811 ) ) ( not ( = ?auto_12783 ?auto_12808 ) ) ( not ( = ?auto_12810 ?auto_12801 ) ) ( not ( = ?auto_12810 ?auto_12803 ) ) ( not ( = ?auto_12810 ?auto_12809 ) ) ( not ( = ?auto_12810 ?auto_12789 ) ) ( not ( = ?auto_12810 ?auto_12807 ) ) ( not ( = ?auto_12810 ?auto_12805 ) ) ( not ( = ?auto_12810 ?auto_12795 ) ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12816 ) ) ( not ( = ?auto_12797 ?auto_12814 ) ) ( not ( = ?auto_12797 ?auto_12793 ) ) ( not ( = ?auto_12797 ?auto_12800 ) ) ( not ( = ?auto_12797 ?auto_12815 ) ) ( not ( = ?auto_12797 ?auto_12804 ) ) ( not ( = ?auto_12796 ?auto_12799 ) ) ( not ( = ?auto_12796 ?auto_12794 ) ) ( not ( = ?auto_12796 ?auto_12806 ) ) ( not ( = ?auto_12796 ?auto_12812 ) ) ( not ( = ?auto_12796 ?auto_12802 ) ) ( not ( = ?auto_12796 ?auto_12811 ) ) ( not ( = ?auto_12796 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12786 ) ) ( not ( = ?auto_12777 ?auto_12813 ) ) ( not ( = ?auto_12778 ?auto_12786 ) ) ( not ( = ?auto_12778 ?auto_12813 ) ) ( not ( = ?auto_12779 ?auto_12786 ) ) ( not ( = ?auto_12779 ?auto_12813 ) ) ( not ( = ?auto_12780 ?auto_12786 ) ) ( not ( = ?auto_12780 ?auto_12813 ) ) ( not ( = ?auto_12781 ?auto_12786 ) ) ( not ( = ?auto_12781 ?auto_12813 ) ) ( not ( = ?auto_12782 ?auto_12786 ) ) ( not ( = ?auto_12782 ?auto_12813 ) ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12813 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12813 ) ) ( not ( = ?auto_12786 ?auto_12796 ) ) ( not ( = ?auto_12786 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12794 ) ) ( not ( = ?auto_12786 ?auto_12806 ) ) ( not ( = ?auto_12786 ?auto_12812 ) ) ( not ( = ?auto_12786 ?auto_12802 ) ) ( not ( = ?auto_12786 ?auto_12811 ) ) ( not ( = ?auto_12786 ?auto_12808 ) ) ( not ( = ?auto_12813 ?auto_12796 ) ) ( not ( = ?auto_12813 ?auto_12799 ) ) ( not ( = ?auto_12813 ?auto_12794 ) ) ( not ( = ?auto_12813 ?auto_12806 ) ) ( not ( = ?auto_12813 ?auto_12812 ) ) ( not ( = ?auto_12813 ?auto_12802 ) ) ( not ( = ?auto_12813 ?auto_12811 ) ) ( not ( = ?auto_12813 ?auto_12808 ) ) ( not ( = ?auto_12777 ?auto_12787 ) ) ( not ( = ?auto_12777 ?auto_12792 ) ) ( not ( = ?auto_12778 ?auto_12787 ) ) ( not ( = ?auto_12778 ?auto_12792 ) ) ( not ( = ?auto_12779 ?auto_12787 ) ) ( not ( = ?auto_12779 ?auto_12792 ) ) ( not ( = ?auto_12780 ?auto_12787 ) ) ( not ( = ?auto_12780 ?auto_12792 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12792 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12782 ?auto_12792 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12792 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12792 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12783 ?auto_12792 ) ) ( not ( = ?auto_12787 ?auto_12813 ) ) ( not ( = ?auto_12787 ?auto_12796 ) ) ( not ( = ?auto_12787 ?auto_12799 ) ) ( not ( = ?auto_12787 ?auto_12794 ) ) ( not ( = ?auto_12787 ?auto_12806 ) ) ( not ( = ?auto_12787 ?auto_12812 ) ) ( not ( = ?auto_12787 ?auto_12802 ) ) ( not ( = ?auto_12787 ?auto_12811 ) ) ( not ( = ?auto_12787 ?auto_12808 ) ) ( not ( = ?auto_12792 ?auto_12813 ) ) ( not ( = ?auto_12792 ?auto_12796 ) ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12806 ) ) ( not ( = ?auto_12792 ?auto_12812 ) ) ( not ( = ?auto_12792 ?auto_12802 ) ) ( not ( = ?auto_12792 ?auto_12811 ) ) ( not ( = ?auto_12792 ?auto_12808 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12785 ?auto_12784 ?auto_12783 ?auto_12786 )
      ( MAKE-1CRATE ?auto_12786 ?auto_12787 )
      ( MAKE-10CRATE-VERIFY ?auto_12777 ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12785 ?auto_12784 ?auto_12783 ?auto_12786 ?auto_12787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12819 - SURFACE
      ?auto_12820 - SURFACE
    )
    :vars
    (
      ?auto_12821 - HOIST
      ?auto_12822 - PLACE
      ?auto_12824 - PLACE
      ?auto_12825 - HOIST
      ?auto_12826 - SURFACE
      ?auto_12823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12821 ?auto_12822 ) ( SURFACE-AT ?auto_12819 ?auto_12822 ) ( CLEAR ?auto_12819 ) ( IS-CRATE ?auto_12820 ) ( AVAILABLE ?auto_12821 ) ( not ( = ?auto_12824 ?auto_12822 ) ) ( HOIST-AT ?auto_12825 ?auto_12824 ) ( AVAILABLE ?auto_12825 ) ( SURFACE-AT ?auto_12820 ?auto_12824 ) ( ON ?auto_12820 ?auto_12826 ) ( CLEAR ?auto_12820 ) ( TRUCK-AT ?auto_12823 ?auto_12822 ) ( not ( = ?auto_12819 ?auto_12820 ) ) ( not ( = ?auto_12819 ?auto_12826 ) ) ( not ( = ?auto_12820 ?auto_12826 ) ) ( not ( = ?auto_12821 ?auto_12825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12823 ?auto_12822 ?auto_12824 )
      ( !LIFT ?auto_12825 ?auto_12820 ?auto_12826 ?auto_12824 )
      ( !LOAD ?auto_12825 ?auto_12820 ?auto_12823 ?auto_12824 )
      ( !DRIVE ?auto_12823 ?auto_12824 ?auto_12822 )
      ( !UNLOAD ?auto_12821 ?auto_12820 ?auto_12823 ?auto_12822 )
      ( !DROP ?auto_12821 ?auto_12820 ?auto_12819 ?auto_12822 )
      ( MAKE-1CRATE-VERIFY ?auto_12819 ?auto_12820 ) )
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
      ?auto_12847 - SURFACE
      ?auto_12846 - SURFACE
      ?auto_12845 - SURFACE
      ?auto_12848 - SURFACE
      ?auto_12850 - SURFACE
      ?auto_12849 - SURFACE
    )
    :vars
    (
      ?auto_12851 - HOIST
      ?auto_12854 - PLACE
      ?auto_12855 - PLACE
      ?auto_12852 - HOIST
      ?auto_12856 - SURFACE
      ?auto_12872 - PLACE
      ?auto_12882 - HOIST
      ?auto_12877 - SURFACE
      ?auto_12866 - PLACE
      ?auto_12865 - HOIST
      ?auto_12859 - SURFACE
      ?auto_12867 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12876 - HOIST
      ?auto_12862 - SURFACE
      ?auto_12869 - PLACE
      ?auto_12857 - HOIST
      ?auto_12863 - SURFACE
      ?auto_12878 - PLACE
      ?auto_12858 - HOIST
      ?auto_12870 - SURFACE
      ?auto_12864 - SURFACE
      ?auto_12871 - PLACE
      ?auto_12879 - HOIST
      ?auto_12873 - SURFACE
      ?auto_12868 - PLACE
      ?auto_12860 - HOIST
      ?auto_12875 - SURFACE
      ?auto_12880 - PLACE
      ?auto_12861 - HOIST
      ?auto_12874 - SURFACE
      ?auto_12853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12851 ?auto_12854 ) ( IS-CRATE ?auto_12849 ) ( not ( = ?auto_12855 ?auto_12854 ) ) ( HOIST-AT ?auto_12852 ?auto_12855 ) ( AVAILABLE ?auto_12852 ) ( SURFACE-AT ?auto_12849 ?auto_12855 ) ( ON ?auto_12849 ?auto_12856 ) ( CLEAR ?auto_12849 ) ( not ( = ?auto_12850 ?auto_12849 ) ) ( not ( = ?auto_12850 ?auto_12856 ) ) ( not ( = ?auto_12849 ?auto_12856 ) ) ( not ( = ?auto_12851 ?auto_12852 ) ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12872 ?auto_12854 ) ) ( HOIST-AT ?auto_12882 ?auto_12872 ) ( SURFACE-AT ?auto_12850 ?auto_12872 ) ( ON ?auto_12850 ?auto_12877 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12848 ?auto_12877 ) ) ( not ( = ?auto_12850 ?auto_12877 ) ) ( not ( = ?auto_12851 ?auto_12882 ) ) ( IS-CRATE ?auto_12848 ) ( not ( = ?auto_12866 ?auto_12854 ) ) ( HOIST-AT ?auto_12865 ?auto_12866 ) ( SURFACE-AT ?auto_12848 ?auto_12866 ) ( ON ?auto_12848 ?auto_12859 ) ( CLEAR ?auto_12848 ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12859 ) ) ( not ( = ?auto_12848 ?auto_12859 ) ) ( not ( = ?auto_12851 ?auto_12865 ) ) ( IS-CRATE ?auto_12845 ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12845 ?auto_12866 ) ( ON ?auto_12845 ?auto_12867 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12846 ?auto_12845 ) ) ( not ( = ?auto_12846 ?auto_12867 ) ) ( not ( = ?auto_12845 ?auto_12867 ) ) ( IS-CRATE ?auto_12846 ) ( not ( = ?auto_12881 ?auto_12854 ) ) ( HOIST-AT ?auto_12876 ?auto_12881 ) ( AVAILABLE ?auto_12876 ) ( SURFACE-AT ?auto_12846 ?auto_12881 ) ( ON ?auto_12846 ?auto_12862 ) ( CLEAR ?auto_12846 ) ( not ( = ?auto_12847 ?auto_12846 ) ) ( not ( = ?auto_12847 ?auto_12862 ) ) ( not ( = ?auto_12846 ?auto_12862 ) ) ( not ( = ?auto_12851 ?auto_12876 ) ) ( IS-CRATE ?auto_12847 ) ( not ( = ?auto_12869 ?auto_12854 ) ) ( HOIST-AT ?auto_12857 ?auto_12869 ) ( AVAILABLE ?auto_12857 ) ( SURFACE-AT ?auto_12847 ?auto_12869 ) ( ON ?auto_12847 ?auto_12863 ) ( CLEAR ?auto_12847 ) ( not ( = ?auto_12844 ?auto_12847 ) ) ( not ( = ?auto_12844 ?auto_12863 ) ) ( not ( = ?auto_12847 ?auto_12863 ) ) ( not ( = ?auto_12851 ?auto_12857 ) ) ( IS-CRATE ?auto_12844 ) ( not ( = ?auto_12878 ?auto_12854 ) ) ( HOIST-AT ?auto_12858 ?auto_12878 ) ( AVAILABLE ?auto_12858 ) ( SURFACE-AT ?auto_12844 ?auto_12878 ) ( ON ?auto_12844 ?auto_12870 ) ( CLEAR ?auto_12844 ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12870 ) ) ( not ( = ?auto_12844 ?auto_12870 ) ) ( not ( = ?auto_12851 ?auto_12858 ) ) ( IS-CRATE ?auto_12843 ) ( AVAILABLE ?auto_12882 ) ( SURFACE-AT ?auto_12843 ?auto_12872 ) ( ON ?auto_12843 ?auto_12864 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12842 ?auto_12864 ) ) ( not ( = ?auto_12843 ?auto_12864 ) ) ( IS-CRATE ?auto_12842 ) ( not ( = ?auto_12871 ?auto_12854 ) ) ( HOIST-AT ?auto_12879 ?auto_12871 ) ( AVAILABLE ?auto_12879 ) ( SURFACE-AT ?auto_12842 ?auto_12871 ) ( ON ?auto_12842 ?auto_12873 ) ( CLEAR ?auto_12842 ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12873 ) ) ( not ( = ?auto_12842 ?auto_12873 ) ) ( not ( = ?auto_12851 ?auto_12879 ) ) ( IS-CRATE ?auto_12841 ) ( not ( = ?auto_12868 ?auto_12854 ) ) ( HOIST-AT ?auto_12860 ?auto_12868 ) ( AVAILABLE ?auto_12860 ) ( SURFACE-AT ?auto_12841 ?auto_12868 ) ( ON ?auto_12841 ?auto_12875 ) ( CLEAR ?auto_12841 ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( not ( = ?auto_12840 ?auto_12875 ) ) ( not ( = ?auto_12841 ?auto_12875 ) ) ( not ( = ?auto_12851 ?auto_12860 ) ) ( SURFACE-AT ?auto_12839 ?auto_12854 ) ( CLEAR ?auto_12839 ) ( IS-CRATE ?auto_12840 ) ( AVAILABLE ?auto_12851 ) ( not ( = ?auto_12880 ?auto_12854 ) ) ( HOIST-AT ?auto_12861 ?auto_12880 ) ( AVAILABLE ?auto_12861 ) ( SURFACE-AT ?auto_12840 ?auto_12880 ) ( ON ?auto_12840 ?auto_12874 ) ( CLEAR ?auto_12840 ) ( TRUCK-AT ?auto_12853 ?auto_12854 ) ( not ( = ?auto_12839 ?auto_12840 ) ) ( not ( = ?auto_12839 ?auto_12874 ) ) ( not ( = ?auto_12840 ?auto_12874 ) ) ( not ( = ?auto_12851 ?auto_12861 ) ) ( not ( = ?auto_12839 ?auto_12841 ) ) ( not ( = ?auto_12839 ?auto_12875 ) ) ( not ( = ?auto_12841 ?auto_12874 ) ) ( not ( = ?auto_12868 ?auto_12880 ) ) ( not ( = ?auto_12860 ?auto_12861 ) ) ( not ( = ?auto_12875 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12842 ) ) ( not ( = ?auto_12839 ?auto_12873 ) ) ( not ( = ?auto_12840 ?auto_12842 ) ) ( not ( = ?auto_12840 ?auto_12873 ) ) ( not ( = ?auto_12842 ?auto_12875 ) ) ( not ( = ?auto_12842 ?auto_12874 ) ) ( not ( = ?auto_12871 ?auto_12868 ) ) ( not ( = ?auto_12871 ?auto_12880 ) ) ( not ( = ?auto_12879 ?auto_12860 ) ) ( not ( = ?auto_12879 ?auto_12861 ) ) ( not ( = ?auto_12873 ?auto_12875 ) ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12843 ) ) ( not ( = ?auto_12839 ?auto_12864 ) ) ( not ( = ?auto_12840 ?auto_12843 ) ) ( not ( = ?auto_12840 ?auto_12864 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12864 ) ) ( not ( = ?auto_12843 ?auto_12873 ) ) ( not ( = ?auto_12843 ?auto_12875 ) ) ( not ( = ?auto_12843 ?auto_12874 ) ) ( not ( = ?auto_12872 ?auto_12871 ) ) ( not ( = ?auto_12872 ?auto_12868 ) ) ( not ( = ?auto_12872 ?auto_12880 ) ) ( not ( = ?auto_12882 ?auto_12879 ) ) ( not ( = ?auto_12882 ?auto_12860 ) ) ( not ( = ?auto_12882 ?auto_12861 ) ) ( not ( = ?auto_12864 ?auto_12873 ) ) ( not ( = ?auto_12864 ?auto_12875 ) ) ( not ( = ?auto_12864 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12844 ) ) ( not ( = ?auto_12839 ?auto_12870 ) ) ( not ( = ?auto_12840 ?auto_12844 ) ) ( not ( = ?auto_12840 ?auto_12870 ) ) ( not ( = ?auto_12841 ?auto_12844 ) ) ( not ( = ?auto_12841 ?auto_12870 ) ) ( not ( = ?auto_12842 ?auto_12844 ) ) ( not ( = ?auto_12842 ?auto_12870 ) ) ( not ( = ?auto_12844 ?auto_12864 ) ) ( not ( = ?auto_12844 ?auto_12873 ) ) ( not ( = ?auto_12844 ?auto_12875 ) ) ( not ( = ?auto_12844 ?auto_12874 ) ) ( not ( = ?auto_12878 ?auto_12872 ) ) ( not ( = ?auto_12878 ?auto_12871 ) ) ( not ( = ?auto_12878 ?auto_12868 ) ) ( not ( = ?auto_12878 ?auto_12880 ) ) ( not ( = ?auto_12858 ?auto_12882 ) ) ( not ( = ?auto_12858 ?auto_12879 ) ) ( not ( = ?auto_12858 ?auto_12860 ) ) ( not ( = ?auto_12858 ?auto_12861 ) ) ( not ( = ?auto_12870 ?auto_12864 ) ) ( not ( = ?auto_12870 ?auto_12873 ) ) ( not ( = ?auto_12870 ?auto_12875 ) ) ( not ( = ?auto_12870 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12847 ) ) ( not ( = ?auto_12839 ?auto_12863 ) ) ( not ( = ?auto_12840 ?auto_12847 ) ) ( not ( = ?auto_12840 ?auto_12863 ) ) ( not ( = ?auto_12841 ?auto_12847 ) ) ( not ( = ?auto_12841 ?auto_12863 ) ) ( not ( = ?auto_12842 ?auto_12847 ) ) ( not ( = ?auto_12842 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12863 ) ) ( not ( = ?auto_12847 ?auto_12870 ) ) ( not ( = ?auto_12847 ?auto_12864 ) ) ( not ( = ?auto_12847 ?auto_12873 ) ) ( not ( = ?auto_12847 ?auto_12875 ) ) ( not ( = ?auto_12847 ?auto_12874 ) ) ( not ( = ?auto_12869 ?auto_12878 ) ) ( not ( = ?auto_12869 ?auto_12872 ) ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12869 ?auto_12868 ) ) ( not ( = ?auto_12869 ?auto_12880 ) ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( not ( = ?auto_12857 ?auto_12882 ) ) ( not ( = ?auto_12857 ?auto_12879 ) ) ( not ( = ?auto_12857 ?auto_12860 ) ) ( not ( = ?auto_12857 ?auto_12861 ) ) ( not ( = ?auto_12863 ?auto_12870 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( not ( = ?auto_12863 ?auto_12873 ) ) ( not ( = ?auto_12863 ?auto_12875 ) ) ( not ( = ?auto_12863 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12846 ) ) ( not ( = ?auto_12839 ?auto_12862 ) ) ( not ( = ?auto_12840 ?auto_12846 ) ) ( not ( = ?auto_12840 ?auto_12862 ) ) ( not ( = ?auto_12841 ?auto_12846 ) ) ( not ( = ?auto_12841 ?auto_12862 ) ) ( not ( = ?auto_12842 ?auto_12846 ) ) ( not ( = ?auto_12842 ?auto_12862 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12843 ?auto_12862 ) ) ( not ( = ?auto_12844 ?auto_12846 ) ) ( not ( = ?auto_12844 ?auto_12862 ) ) ( not ( = ?auto_12846 ?auto_12863 ) ) ( not ( = ?auto_12846 ?auto_12870 ) ) ( not ( = ?auto_12846 ?auto_12864 ) ) ( not ( = ?auto_12846 ?auto_12873 ) ) ( not ( = ?auto_12846 ?auto_12875 ) ) ( not ( = ?auto_12846 ?auto_12874 ) ) ( not ( = ?auto_12881 ?auto_12869 ) ) ( not ( = ?auto_12881 ?auto_12878 ) ) ( not ( = ?auto_12881 ?auto_12872 ) ) ( not ( = ?auto_12881 ?auto_12871 ) ) ( not ( = ?auto_12881 ?auto_12868 ) ) ( not ( = ?auto_12881 ?auto_12880 ) ) ( not ( = ?auto_12876 ?auto_12857 ) ) ( not ( = ?auto_12876 ?auto_12858 ) ) ( not ( = ?auto_12876 ?auto_12882 ) ) ( not ( = ?auto_12876 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12860 ) ) ( not ( = ?auto_12876 ?auto_12861 ) ) ( not ( = ?auto_12862 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12870 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12873 ) ) ( not ( = ?auto_12862 ?auto_12875 ) ) ( not ( = ?auto_12862 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12845 ) ) ( not ( = ?auto_12839 ?auto_12867 ) ) ( not ( = ?auto_12840 ?auto_12845 ) ) ( not ( = ?auto_12840 ?auto_12867 ) ) ( not ( = ?auto_12841 ?auto_12845 ) ) ( not ( = ?auto_12841 ?auto_12867 ) ) ( not ( = ?auto_12842 ?auto_12845 ) ) ( not ( = ?auto_12842 ?auto_12867 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12867 ) ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12844 ?auto_12867 ) ) ( not ( = ?auto_12847 ?auto_12845 ) ) ( not ( = ?auto_12847 ?auto_12867 ) ) ( not ( = ?auto_12845 ?auto_12862 ) ) ( not ( = ?auto_12845 ?auto_12863 ) ) ( not ( = ?auto_12845 ?auto_12870 ) ) ( not ( = ?auto_12845 ?auto_12864 ) ) ( not ( = ?auto_12845 ?auto_12873 ) ) ( not ( = ?auto_12845 ?auto_12875 ) ) ( not ( = ?auto_12845 ?auto_12874 ) ) ( not ( = ?auto_12866 ?auto_12881 ) ) ( not ( = ?auto_12866 ?auto_12869 ) ) ( not ( = ?auto_12866 ?auto_12878 ) ) ( not ( = ?auto_12866 ?auto_12872 ) ) ( not ( = ?auto_12866 ?auto_12871 ) ) ( not ( = ?auto_12866 ?auto_12868 ) ) ( not ( = ?auto_12866 ?auto_12880 ) ) ( not ( = ?auto_12865 ?auto_12876 ) ) ( not ( = ?auto_12865 ?auto_12857 ) ) ( not ( = ?auto_12865 ?auto_12858 ) ) ( not ( = ?auto_12865 ?auto_12882 ) ) ( not ( = ?auto_12865 ?auto_12879 ) ) ( not ( = ?auto_12865 ?auto_12860 ) ) ( not ( = ?auto_12865 ?auto_12861 ) ) ( not ( = ?auto_12867 ?auto_12862 ) ) ( not ( = ?auto_12867 ?auto_12863 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12867 ?auto_12864 ) ) ( not ( = ?auto_12867 ?auto_12873 ) ) ( not ( = ?auto_12867 ?auto_12875 ) ) ( not ( = ?auto_12867 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12848 ) ) ( not ( = ?auto_12839 ?auto_12859 ) ) ( not ( = ?auto_12840 ?auto_12848 ) ) ( not ( = ?auto_12840 ?auto_12859 ) ) ( not ( = ?auto_12841 ?auto_12848 ) ) ( not ( = ?auto_12841 ?auto_12859 ) ) ( not ( = ?auto_12842 ?auto_12848 ) ) ( not ( = ?auto_12842 ?auto_12859 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12859 ) ) ( not ( = ?auto_12844 ?auto_12848 ) ) ( not ( = ?auto_12844 ?auto_12859 ) ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12859 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12859 ) ) ( not ( = ?auto_12848 ?auto_12867 ) ) ( not ( = ?auto_12848 ?auto_12862 ) ) ( not ( = ?auto_12848 ?auto_12863 ) ) ( not ( = ?auto_12848 ?auto_12870 ) ) ( not ( = ?auto_12848 ?auto_12864 ) ) ( not ( = ?auto_12848 ?auto_12873 ) ) ( not ( = ?auto_12848 ?auto_12875 ) ) ( not ( = ?auto_12848 ?auto_12874 ) ) ( not ( = ?auto_12859 ?auto_12867 ) ) ( not ( = ?auto_12859 ?auto_12862 ) ) ( not ( = ?auto_12859 ?auto_12863 ) ) ( not ( = ?auto_12859 ?auto_12870 ) ) ( not ( = ?auto_12859 ?auto_12864 ) ) ( not ( = ?auto_12859 ?auto_12873 ) ) ( not ( = ?auto_12859 ?auto_12875 ) ) ( not ( = ?auto_12859 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12850 ) ) ( not ( = ?auto_12839 ?auto_12877 ) ) ( not ( = ?auto_12840 ?auto_12850 ) ) ( not ( = ?auto_12840 ?auto_12877 ) ) ( not ( = ?auto_12841 ?auto_12850 ) ) ( not ( = ?auto_12841 ?auto_12877 ) ) ( not ( = ?auto_12842 ?auto_12850 ) ) ( not ( = ?auto_12842 ?auto_12877 ) ) ( not ( = ?auto_12843 ?auto_12850 ) ) ( not ( = ?auto_12843 ?auto_12877 ) ) ( not ( = ?auto_12844 ?auto_12850 ) ) ( not ( = ?auto_12844 ?auto_12877 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12877 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12877 ) ) ( not ( = ?auto_12845 ?auto_12850 ) ) ( not ( = ?auto_12845 ?auto_12877 ) ) ( not ( = ?auto_12850 ?auto_12859 ) ) ( not ( = ?auto_12850 ?auto_12867 ) ) ( not ( = ?auto_12850 ?auto_12862 ) ) ( not ( = ?auto_12850 ?auto_12863 ) ) ( not ( = ?auto_12850 ?auto_12870 ) ) ( not ( = ?auto_12850 ?auto_12864 ) ) ( not ( = ?auto_12850 ?auto_12873 ) ) ( not ( = ?auto_12850 ?auto_12875 ) ) ( not ( = ?auto_12850 ?auto_12874 ) ) ( not ( = ?auto_12877 ?auto_12859 ) ) ( not ( = ?auto_12877 ?auto_12867 ) ) ( not ( = ?auto_12877 ?auto_12862 ) ) ( not ( = ?auto_12877 ?auto_12863 ) ) ( not ( = ?auto_12877 ?auto_12870 ) ) ( not ( = ?auto_12877 ?auto_12864 ) ) ( not ( = ?auto_12877 ?auto_12873 ) ) ( not ( = ?auto_12877 ?auto_12875 ) ) ( not ( = ?auto_12877 ?auto_12874 ) ) ( not ( = ?auto_12839 ?auto_12849 ) ) ( not ( = ?auto_12839 ?auto_12856 ) ) ( not ( = ?auto_12840 ?auto_12849 ) ) ( not ( = ?auto_12840 ?auto_12856 ) ) ( not ( = ?auto_12841 ?auto_12849 ) ) ( not ( = ?auto_12841 ?auto_12856 ) ) ( not ( = ?auto_12842 ?auto_12849 ) ) ( not ( = ?auto_12842 ?auto_12856 ) ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12843 ?auto_12856 ) ) ( not ( = ?auto_12844 ?auto_12849 ) ) ( not ( = ?auto_12844 ?auto_12856 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12856 ) ) ( not ( = ?auto_12846 ?auto_12849 ) ) ( not ( = ?auto_12846 ?auto_12856 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12856 ) ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12856 ) ) ( not ( = ?auto_12849 ?auto_12877 ) ) ( not ( = ?auto_12849 ?auto_12859 ) ) ( not ( = ?auto_12849 ?auto_12867 ) ) ( not ( = ?auto_12849 ?auto_12862 ) ) ( not ( = ?auto_12849 ?auto_12863 ) ) ( not ( = ?auto_12849 ?auto_12870 ) ) ( not ( = ?auto_12849 ?auto_12864 ) ) ( not ( = ?auto_12849 ?auto_12873 ) ) ( not ( = ?auto_12849 ?auto_12875 ) ) ( not ( = ?auto_12849 ?auto_12874 ) ) ( not ( = ?auto_12855 ?auto_12872 ) ) ( not ( = ?auto_12855 ?auto_12866 ) ) ( not ( = ?auto_12855 ?auto_12881 ) ) ( not ( = ?auto_12855 ?auto_12869 ) ) ( not ( = ?auto_12855 ?auto_12878 ) ) ( not ( = ?auto_12855 ?auto_12871 ) ) ( not ( = ?auto_12855 ?auto_12868 ) ) ( not ( = ?auto_12855 ?auto_12880 ) ) ( not ( = ?auto_12852 ?auto_12882 ) ) ( not ( = ?auto_12852 ?auto_12865 ) ) ( not ( = ?auto_12852 ?auto_12876 ) ) ( not ( = ?auto_12852 ?auto_12857 ) ) ( not ( = ?auto_12852 ?auto_12858 ) ) ( not ( = ?auto_12852 ?auto_12879 ) ) ( not ( = ?auto_12852 ?auto_12860 ) ) ( not ( = ?auto_12852 ?auto_12861 ) ) ( not ( = ?auto_12856 ?auto_12877 ) ) ( not ( = ?auto_12856 ?auto_12859 ) ) ( not ( = ?auto_12856 ?auto_12867 ) ) ( not ( = ?auto_12856 ?auto_12862 ) ) ( not ( = ?auto_12856 ?auto_12863 ) ) ( not ( = ?auto_12856 ?auto_12870 ) ) ( not ( = ?auto_12856 ?auto_12864 ) ) ( not ( = ?auto_12856 ?auto_12873 ) ) ( not ( = ?auto_12856 ?auto_12875 ) ) ( not ( = ?auto_12856 ?auto_12874 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12839 ?auto_12840 ?auto_12841 ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12847 ?auto_12846 ?auto_12845 ?auto_12848 ?auto_12850 )
      ( MAKE-1CRATE ?auto_12850 ?auto_12849 )
      ( MAKE-11CRATE-VERIFY ?auto_12839 ?auto_12840 ?auto_12841 ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12847 ?auto_12846 ?auto_12845 ?auto_12848 ?auto_12850 ?auto_12849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12885 - SURFACE
      ?auto_12886 - SURFACE
    )
    :vars
    (
      ?auto_12887 - HOIST
      ?auto_12888 - PLACE
      ?auto_12890 - PLACE
      ?auto_12891 - HOIST
      ?auto_12892 - SURFACE
      ?auto_12889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12887 ?auto_12888 ) ( SURFACE-AT ?auto_12885 ?auto_12888 ) ( CLEAR ?auto_12885 ) ( IS-CRATE ?auto_12886 ) ( AVAILABLE ?auto_12887 ) ( not ( = ?auto_12890 ?auto_12888 ) ) ( HOIST-AT ?auto_12891 ?auto_12890 ) ( AVAILABLE ?auto_12891 ) ( SURFACE-AT ?auto_12886 ?auto_12890 ) ( ON ?auto_12886 ?auto_12892 ) ( CLEAR ?auto_12886 ) ( TRUCK-AT ?auto_12889 ?auto_12888 ) ( not ( = ?auto_12885 ?auto_12886 ) ) ( not ( = ?auto_12885 ?auto_12892 ) ) ( not ( = ?auto_12886 ?auto_12892 ) ) ( not ( = ?auto_12887 ?auto_12891 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12889 ?auto_12888 ?auto_12890 )
      ( !LIFT ?auto_12891 ?auto_12886 ?auto_12892 ?auto_12890 )
      ( !LOAD ?auto_12891 ?auto_12886 ?auto_12889 ?auto_12890 )
      ( !DRIVE ?auto_12889 ?auto_12890 ?auto_12888 )
      ( !UNLOAD ?auto_12887 ?auto_12886 ?auto_12889 ?auto_12888 )
      ( !DROP ?auto_12887 ?auto_12886 ?auto_12885 ?auto_12888 )
      ( MAKE-1CRATE-VERIFY ?auto_12885 ?auto_12886 ) )
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
      ?auto_12914 - SURFACE
      ?auto_12913 - SURFACE
      ?auto_12912 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12917 - SURFACE
      ?auto_12916 - SURFACE
      ?auto_12918 - SURFACE
    )
    :vars
    (
      ?auto_12923 - HOIST
      ?auto_12924 - PLACE
      ?auto_12920 - PLACE
      ?auto_12919 - HOIST
      ?auto_12921 - SURFACE
      ?auto_12950 - PLACE
      ?auto_12940 - HOIST
      ?auto_12951 - SURFACE
      ?auto_12937 - PLACE
      ?auto_12929 - HOIST
      ?auto_12947 - SURFACE
      ?auto_12936 - PLACE
      ?auto_12948 - HOIST
      ?auto_12941 - SURFACE
      ?auto_12935 - SURFACE
      ?auto_12930 - PLACE
      ?auto_12927 - HOIST
      ?auto_12953 - SURFACE
      ?auto_12933 - PLACE
      ?auto_12944 - HOIST
      ?auto_12928 - SURFACE
      ?auto_12949 - PLACE
      ?auto_12925 - HOIST
      ?auto_12939 - SURFACE
      ?auto_12932 - SURFACE
      ?auto_12934 - PLACE
      ?auto_12931 - HOIST
      ?auto_12942 - SURFACE
      ?auto_12952 - PLACE
      ?auto_12946 - HOIST
      ?auto_12945 - SURFACE
      ?auto_12926 - PLACE
      ?auto_12938 - HOIST
      ?auto_12943 - SURFACE
      ?auto_12922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12923 ?auto_12924 ) ( IS-CRATE ?auto_12918 ) ( not ( = ?auto_12920 ?auto_12924 ) ) ( HOIST-AT ?auto_12919 ?auto_12920 ) ( AVAILABLE ?auto_12919 ) ( SURFACE-AT ?auto_12918 ?auto_12920 ) ( ON ?auto_12918 ?auto_12921 ) ( CLEAR ?auto_12918 ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12921 ) ) ( not ( = ?auto_12918 ?auto_12921 ) ) ( not ( = ?auto_12923 ?auto_12919 ) ) ( IS-CRATE ?auto_12916 ) ( not ( = ?auto_12950 ?auto_12924 ) ) ( HOIST-AT ?auto_12940 ?auto_12950 ) ( AVAILABLE ?auto_12940 ) ( SURFACE-AT ?auto_12916 ?auto_12950 ) ( ON ?auto_12916 ?auto_12951 ) ( CLEAR ?auto_12916 ) ( not ( = ?auto_12917 ?auto_12916 ) ) ( not ( = ?auto_12917 ?auto_12951 ) ) ( not ( = ?auto_12916 ?auto_12951 ) ) ( not ( = ?auto_12923 ?auto_12940 ) ) ( IS-CRATE ?auto_12917 ) ( not ( = ?auto_12937 ?auto_12924 ) ) ( HOIST-AT ?auto_12929 ?auto_12937 ) ( SURFACE-AT ?auto_12917 ?auto_12937 ) ( ON ?auto_12917 ?auto_12947 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12947 ) ) ( not ( = ?auto_12917 ?auto_12947 ) ) ( not ( = ?auto_12923 ?auto_12929 ) ) ( IS-CRATE ?auto_12915 ) ( not ( = ?auto_12936 ?auto_12924 ) ) ( HOIST-AT ?auto_12948 ?auto_12936 ) ( SURFACE-AT ?auto_12915 ?auto_12936 ) ( ON ?auto_12915 ?auto_12941 ) ( CLEAR ?auto_12915 ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12941 ) ) ( not ( = ?auto_12915 ?auto_12941 ) ) ( not ( = ?auto_12923 ?auto_12948 ) ) ( IS-CRATE ?auto_12912 ) ( AVAILABLE ?auto_12948 ) ( SURFACE-AT ?auto_12912 ?auto_12936 ) ( ON ?auto_12912 ?auto_12935 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12913 ?auto_12912 ) ) ( not ( = ?auto_12913 ?auto_12935 ) ) ( not ( = ?auto_12912 ?auto_12935 ) ) ( IS-CRATE ?auto_12913 ) ( not ( = ?auto_12930 ?auto_12924 ) ) ( HOIST-AT ?auto_12927 ?auto_12930 ) ( AVAILABLE ?auto_12927 ) ( SURFACE-AT ?auto_12913 ?auto_12930 ) ( ON ?auto_12913 ?auto_12953 ) ( CLEAR ?auto_12913 ) ( not ( = ?auto_12914 ?auto_12913 ) ) ( not ( = ?auto_12914 ?auto_12953 ) ) ( not ( = ?auto_12913 ?auto_12953 ) ) ( not ( = ?auto_12923 ?auto_12927 ) ) ( IS-CRATE ?auto_12914 ) ( not ( = ?auto_12933 ?auto_12924 ) ) ( HOIST-AT ?auto_12944 ?auto_12933 ) ( AVAILABLE ?auto_12944 ) ( SURFACE-AT ?auto_12914 ?auto_12933 ) ( ON ?auto_12914 ?auto_12928 ) ( CLEAR ?auto_12914 ) ( not ( = ?auto_12911 ?auto_12914 ) ) ( not ( = ?auto_12911 ?auto_12928 ) ) ( not ( = ?auto_12914 ?auto_12928 ) ) ( not ( = ?auto_12923 ?auto_12944 ) ) ( IS-CRATE ?auto_12911 ) ( not ( = ?auto_12949 ?auto_12924 ) ) ( HOIST-AT ?auto_12925 ?auto_12949 ) ( AVAILABLE ?auto_12925 ) ( SURFACE-AT ?auto_12911 ?auto_12949 ) ( ON ?auto_12911 ?auto_12939 ) ( CLEAR ?auto_12911 ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( not ( = ?auto_12910 ?auto_12939 ) ) ( not ( = ?auto_12911 ?auto_12939 ) ) ( not ( = ?auto_12923 ?auto_12925 ) ) ( IS-CRATE ?auto_12910 ) ( AVAILABLE ?auto_12929 ) ( SURFACE-AT ?auto_12910 ?auto_12937 ) ( ON ?auto_12910 ?auto_12932 ) ( CLEAR ?auto_12910 ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12932 ) ) ( not ( = ?auto_12910 ?auto_12932 ) ) ( IS-CRATE ?auto_12909 ) ( not ( = ?auto_12934 ?auto_12924 ) ) ( HOIST-AT ?auto_12931 ?auto_12934 ) ( AVAILABLE ?auto_12931 ) ( SURFACE-AT ?auto_12909 ?auto_12934 ) ( ON ?auto_12909 ?auto_12942 ) ( CLEAR ?auto_12909 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12942 ) ) ( not ( = ?auto_12909 ?auto_12942 ) ) ( not ( = ?auto_12923 ?auto_12931 ) ) ( IS-CRATE ?auto_12908 ) ( not ( = ?auto_12952 ?auto_12924 ) ) ( HOIST-AT ?auto_12946 ?auto_12952 ) ( AVAILABLE ?auto_12946 ) ( SURFACE-AT ?auto_12908 ?auto_12952 ) ( ON ?auto_12908 ?auto_12945 ) ( CLEAR ?auto_12908 ) ( not ( = ?auto_12907 ?auto_12908 ) ) ( not ( = ?auto_12907 ?auto_12945 ) ) ( not ( = ?auto_12908 ?auto_12945 ) ) ( not ( = ?auto_12923 ?auto_12946 ) ) ( SURFACE-AT ?auto_12906 ?auto_12924 ) ( CLEAR ?auto_12906 ) ( IS-CRATE ?auto_12907 ) ( AVAILABLE ?auto_12923 ) ( not ( = ?auto_12926 ?auto_12924 ) ) ( HOIST-AT ?auto_12938 ?auto_12926 ) ( AVAILABLE ?auto_12938 ) ( SURFACE-AT ?auto_12907 ?auto_12926 ) ( ON ?auto_12907 ?auto_12943 ) ( CLEAR ?auto_12907 ) ( TRUCK-AT ?auto_12922 ?auto_12924 ) ( not ( = ?auto_12906 ?auto_12907 ) ) ( not ( = ?auto_12906 ?auto_12943 ) ) ( not ( = ?auto_12907 ?auto_12943 ) ) ( not ( = ?auto_12923 ?auto_12938 ) ) ( not ( = ?auto_12906 ?auto_12908 ) ) ( not ( = ?auto_12906 ?auto_12945 ) ) ( not ( = ?auto_12908 ?auto_12943 ) ) ( not ( = ?auto_12952 ?auto_12926 ) ) ( not ( = ?auto_12946 ?auto_12938 ) ) ( not ( = ?auto_12945 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12909 ) ) ( not ( = ?auto_12906 ?auto_12942 ) ) ( not ( = ?auto_12907 ?auto_12909 ) ) ( not ( = ?auto_12907 ?auto_12942 ) ) ( not ( = ?auto_12909 ?auto_12945 ) ) ( not ( = ?auto_12909 ?auto_12943 ) ) ( not ( = ?auto_12934 ?auto_12952 ) ) ( not ( = ?auto_12934 ?auto_12926 ) ) ( not ( = ?auto_12931 ?auto_12946 ) ) ( not ( = ?auto_12931 ?auto_12938 ) ) ( not ( = ?auto_12942 ?auto_12945 ) ) ( not ( = ?auto_12942 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12910 ) ) ( not ( = ?auto_12906 ?auto_12932 ) ) ( not ( = ?auto_12907 ?auto_12910 ) ) ( not ( = ?auto_12907 ?auto_12932 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12908 ?auto_12932 ) ) ( not ( = ?auto_12910 ?auto_12942 ) ) ( not ( = ?auto_12910 ?auto_12945 ) ) ( not ( = ?auto_12910 ?auto_12943 ) ) ( not ( = ?auto_12937 ?auto_12934 ) ) ( not ( = ?auto_12937 ?auto_12952 ) ) ( not ( = ?auto_12937 ?auto_12926 ) ) ( not ( = ?auto_12929 ?auto_12931 ) ) ( not ( = ?auto_12929 ?auto_12946 ) ) ( not ( = ?auto_12929 ?auto_12938 ) ) ( not ( = ?auto_12932 ?auto_12942 ) ) ( not ( = ?auto_12932 ?auto_12945 ) ) ( not ( = ?auto_12932 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12911 ) ) ( not ( = ?auto_12906 ?auto_12939 ) ) ( not ( = ?auto_12907 ?auto_12911 ) ) ( not ( = ?auto_12907 ?auto_12939 ) ) ( not ( = ?auto_12908 ?auto_12911 ) ) ( not ( = ?auto_12908 ?auto_12939 ) ) ( not ( = ?auto_12909 ?auto_12911 ) ) ( not ( = ?auto_12909 ?auto_12939 ) ) ( not ( = ?auto_12911 ?auto_12932 ) ) ( not ( = ?auto_12911 ?auto_12942 ) ) ( not ( = ?auto_12911 ?auto_12945 ) ) ( not ( = ?auto_12911 ?auto_12943 ) ) ( not ( = ?auto_12949 ?auto_12937 ) ) ( not ( = ?auto_12949 ?auto_12934 ) ) ( not ( = ?auto_12949 ?auto_12952 ) ) ( not ( = ?auto_12949 ?auto_12926 ) ) ( not ( = ?auto_12925 ?auto_12929 ) ) ( not ( = ?auto_12925 ?auto_12931 ) ) ( not ( = ?auto_12925 ?auto_12946 ) ) ( not ( = ?auto_12925 ?auto_12938 ) ) ( not ( = ?auto_12939 ?auto_12932 ) ) ( not ( = ?auto_12939 ?auto_12942 ) ) ( not ( = ?auto_12939 ?auto_12945 ) ) ( not ( = ?auto_12939 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12914 ) ) ( not ( = ?auto_12906 ?auto_12928 ) ) ( not ( = ?auto_12907 ?auto_12914 ) ) ( not ( = ?auto_12907 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12914 ) ) ( not ( = ?auto_12908 ?auto_12928 ) ) ( not ( = ?auto_12909 ?auto_12914 ) ) ( not ( = ?auto_12909 ?auto_12928 ) ) ( not ( = ?auto_12910 ?auto_12914 ) ) ( not ( = ?auto_12910 ?auto_12928 ) ) ( not ( = ?auto_12914 ?auto_12939 ) ) ( not ( = ?auto_12914 ?auto_12932 ) ) ( not ( = ?auto_12914 ?auto_12942 ) ) ( not ( = ?auto_12914 ?auto_12945 ) ) ( not ( = ?auto_12914 ?auto_12943 ) ) ( not ( = ?auto_12933 ?auto_12949 ) ) ( not ( = ?auto_12933 ?auto_12937 ) ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12933 ?auto_12952 ) ) ( not ( = ?auto_12933 ?auto_12926 ) ) ( not ( = ?auto_12944 ?auto_12925 ) ) ( not ( = ?auto_12944 ?auto_12929 ) ) ( not ( = ?auto_12944 ?auto_12931 ) ) ( not ( = ?auto_12944 ?auto_12946 ) ) ( not ( = ?auto_12944 ?auto_12938 ) ) ( not ( = ?auto_12928 ?auto_12939 ) ) ( not ( = ?auto_12928 ?auto_12932 ) ) ( not ( = ?auto_12928 ?auto_12942 ) ) ( not ( = ?auto_12928 ?auto_12945 ) ) ( not ( = ?auto_12928 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12913 ) ) ( not ( = ?auto_12906 ?auto_12953 ) ) ( not ( = ?auto_12907 ?auto_12913 ) ) ( not ( = ?auto_12907 ?auto_12953 ) ) ( not ( = ?auto_12908 ?auto_12913 ) ) ( not ( = ?auto_12908 ?auto_12953 ) ) ( not ( = ?auto_12909 ?auto_12913 ) ) ( not ( = ?auto_12909 ?auto_12953 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12910 ?auto_12953 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12911 ?auto_12953 ) ) ( not ( = ?auto_12913 ?auto_12928 ) ) ( not ( = ?auto_12913 ?auto_12939 ) ) ( not ( = ?auto_12913 ?auto_12932 ) ) ( not ( = ?auto_12913 ?auto_12942 ) ) ( not ( = ?auto_12913 ?auto_12945 ) ) ( not ( = ?auto_12913 ?auto_12943 ) ) ( not ( = ?auto_12930 ?auto_12933 ) ) ( not ( = ?auto_12930 ?auto_12949 ) ) ( not ( = ?auto_12930 ?auto_12937 ) ) ( not ( = ?auto_12930 ?auto_12934 ) ) ( not ( = ?auto_12930 ?auto_12952 ) ) ( not ( = ?auto_12930 ?auto_12926 ) ) ( not ( = ?auto_12927 ?auto_12944 ) ) ( not ( = ?auto_12927 ?auto_12925 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12931 ) ) ( not ( = ?auto_12927 ?auto_12946 ) ) ( not ( = ?auto_12927 ?auto_12938 ) ) ( not ( = ?auto_12953 ?auto_12928 ) ) ( not ( = ?auto_12953 ?auto_12939 ) ) ( not ( = ?auto_12953 ?auto_12932 ) ) ( not ( = ?auto_12953 ?auto_12942 ) ) ( not ( = ?auto_12953 ?auto_12945 ) ) ( not ( = ?auto_12953 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12912 ) ) ( not ( = ?auto_12906 ?auto_12935 ) ) ( not ( = ?auto_12907 ?auto_12912 ) ) ( not ( = ?auto_12907 ?auto_12935 ) ) ( not ( = ?auto_12908 ?auto_12912 ) ) ( not ( = ?auto_12908 ?auto_12935 ) ) ( not ( = ?auto_12909 ?auto_12912 ) ) ( not ( = ?auto_12909 ?auto_12935 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12935 ) ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12935 ) ) ( not ( = ?auto_12914 ?auto_12912 ) ) ( not ( = ?auto_12914 ?auto_12935 ) ) ( not ( = ?auto_12912 ?auto_12953 ) ) ( not ( = ?auto_12912 ?auto_12928 ) ) ( not ( = ?auto_12912 ?auto_12939 ) ) ( not ( = ?auto_12912 ?auto_12932 ) ) ( not ( = ?auto_12912 ?auto_12942 ) ) ( not ( = ?auto_12912 ?auto_12945 ) ) ( not ( = ?auto_12912 ?auto_12943 ) ) ( not ( = ?auto_12936 ?auto_12930 ) ) ( not ( = ?auto_12936 ?auto_12933 ) ) ( not ( = ?auto_12936 ?auto_12949 ) ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12934 ) ) ( not ( = ?auto_12936 ?auto_12952 ) ) ( not ( = ?auto_12936 ?auto_12926 ) ) ( not ( = ?auto_12948 ?auto_12927 ) ) ( not ( = ?auto_12948 ?auto_12944 ) ) ( not ( = ?auto_12948 ?auto_12925 ) ) ( not ( = ?auto_12948 ?auto_12929 ) ) ( not ( = ?auto_12948 ?auto_12931 ) ) ( not ( = ?auto_12948 ?auto_12946 ) ) ( not ( = ?auto_12948 ?auto_12938 ) ) ( not ( = ?auto_12935 ?auto_12953 ) ) ( not ( = ?auto_12935 ?auto_12928 ) ) ( not ( = ?auto_12935 ?auto_12939 ) ) ( not ( = ?auto_12935 ?auto_12932 ) ) ( not ( = ?auto_12935 ?auto_12942 ) ) ( not ( = ?auto_12935 ?auto_12945 ) ) ( not ( = ?auto_12935 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12915 ) ) ( not ( = ?auto_12906 ?auto_12941 ) ) ( not ( = ?auto_12907 ?auto_12915 ) ) ( not ( = ?auto_12907 ?auto_12941 ) ) ( not ( = ?auto_12908 ?auto_12915 ) ) ( not ( = ?auto_12908 ?auto_12941 ) ) ( not ( = ?auto_12909 ?auto_12915 ) ) ( not ( = ?auto_12909 ?auto_12941 ) ) ( not ( = ?auto_12910 ?auto_12915 ) ) ( not ( = ?auto_12910 ?auto_12941 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12941 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12941 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12941 ) ) ( not ( = ?auto_12915 ?auto_12935 ) ) ( not ( = ?auto_12915 ?auto_12953 ) ) ( not ( = ?auto_12915 ?auto_12928 ) ) ( not ( = ?auto_12915 ?auto_12939 ) ) ( not ( = ?auto_12915 ?auto_12932 ) ) ( not ( = ?auto_12915 ?auto_12942 ) ) ( not ( = ?auto_12915 ?auto_12945 ) ) ( not ( = ?auto_12915 ?auto_12943 ) ) ( not ( = ?auto_12941 ?auto_12935 ) ) ( not ( = ?auto_12941 ?auto_12953 ) ) ( not ( = ?auto_12941 ?auto_12928 ) ) ( not ( = ?auto_12941 ?auto_12939 ) ) ( not ( = ?auto_12941 ?auto_12932 ) ) ( not ( = ?auto_12941 ?auto_12942 ) ) ( not ( = ?auto_12941 ?auto_12945 ) ) ( not ( = ?auto_12941 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12917 ) ) ( not ( = ?auto_12906 ?auto_12947 ) ) ( not ( = ?auto_12907 ?auto_12917 ) ) ( not ( = ?auto_12907 ?auto_12947 ) ) ( not ( = ?auto_12908 ?auto_12917 ) ) ( not ( = ?auto_12908 ?auto_12947 ) ) ( not ( = ?auto_12909 ?auto_12917 ) ) ( not ( = ?auto_12909 ?auto_12947 ) ) ( not ( = ?auto_12910 ?auto_12917 ) ) ( not ( = ?auto_12910 ?auto_12947 ) ) ( not ( = ?auto_12911 ?auto_12917 ) ) ( not ( = ?auto_12911 ?auto_12947 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12947 ) ) ( not ( = ?auto_12913 ?auto_12917 ) ) ( not ( = ?auto_12913 ?auto_12947 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12912 ?auto_12947 ) ) ( not ( = ?auto_12917 ?auto_12941 ) ) ( not ( = ?auto_12917 ?auto_12935 ) ) ( not ( = ?auto_12917 ?auto_12953 ) ) ( not ( = ?auto_12917 ?auto_12928 ) ) ( not ( = ?auto_12917 ?auto_12939 ) ) ( not ( = ?auto_12917 ?auto_12932 ) ) ( not ( = ?auto_12917 ?auto_12942 ) ) ( not ( = ?auto_12917 ?auto_12945 ) ) ( not ( = ?auto_12917 ?auto_12943 ) ) ( not ( = ?auto_12947 ?auto_12941 ) ) ( not ( = ?auto_12947 ?auto_12935 ) ) ( not ( = ?auto_12947 ?auto_12953 ) ) ( not ( = ?auto_12947 ?auto_12928 ) ) ( not ( = ?auto_12947 ?auto_12939 ) ) ( not ( = ?auto_12947 ?auto_12932 ) ) ( not ( = ?auto_12947 ?auto_12942 ) ) ( not ( = ?auto_12947 ?auto_12945 ) ) ( not ( = ?auto_12947 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12916 ) ) ( not ( = ?auto_12906 ?auto_12951 ) ) ( not ( = ?auto_12907 ?auto_12916 ) ) ( not ( = ?auto_12907 ?auto_12951 ) ) ( not ( = ?auto_12908 ?auto_12916 ) ) ( not ( = ?auto_12908 ?auto_12951 ) ) ( not ( = ?auto_12909 ?auto_12916 ) ) ( not ( = ?auto_12909 ?auto_12951 ) ) ( not ( = ?auto_12910 ?auto_12916 ) ) ( not ( = ?auto_12910 ?auto_12951 ) ) ( not ( = ?auto_12911 ?auto_12916 ) ) ( not ( = ?auto_12911 ?auto_12951 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12951 ) ) ( not ( = ?auto_12913 ?auto_12916 ) ) ( not ( = ?auto_12913 ?auto_12951 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12951 ) ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12951 ) ) ( not ( = ?auto_12916 ?auto_12947 ) ) ( not ( = ?auto_12916 ?auto_12941 ) ) ( not ( = ?auto_12916 ?auto_12935 ) ) ( not ( = ?auto_12916 ?auto_12953 ) ) ( not ( = ?auto_12916 ?auto_12928 ) ) ( not ( = ?auto_12916 ?auto_12939 ) ) ( not ( = ?auto_12916 ?auto_12932 ) ) ( not ( = ?auto_12916 ?auto_12942 ) ) ( not ( = ?auto_12916 ?auto_12945 ) ) ( not ( = ?auto_12916 ?auto_12943 ) ) ( not ( = ?auto_12950 ?auto_12937 ) ) ( not ( = ?auto_12950 ?auto_12936 ) ) ( not ( = ?auto_12950 ?auto_12930 ) ) ( not ( = ?auto_12950 ?auto_12933 ) ) ( not ( = ?auto_12950 ?auto_12949 ) ) ( not ( = ?auto_12950 ?auto_12934 ) ) ( not ( = ?auto_12950 ?auto_12952 ) ) ( not ( = ?auto_12950 ?auto_12926 ) ) ( not ( = ?auto_12940 ?auto_12929 ) ) ( not ( = ?auto_12940 ?auto_12948 ) ) ( not ( = ?auto_12940 ?auto_12927 ) ) ( not ( = ?auto_12940 ?auto_12944 ) ) ( not ( = ?auto_12940 ?auto_12925 ) ) ( not ( = ?auto_12940 ?auto_12931 ) ) ( not ( = ?auto_12940 ?auto_12946 ) ) ( not ( = ?auto_12940 ?auto_12938 ) ) ( not ( = ?auto_12951 ?auto_12947 ) ) ( not ( = ?auto_12951 ?auto_12941 ) ) ( not ( = ?auto_12951 ?auto_12935 ) ) ( not ( = ?auto_12951 ?auto_12953 ) ) ( not ( = ?auto_12951 ?auto_12928 ) ) ( not ( = ?auto_12951 ?auto_12939 ) ) ( not ( = ?auto_12951 ?auto_12932 ) ) ( not ( = ?auto_12951 ?auto_12942 ) ) ( not ( = ?auto_12951 ?auto_12945 ) ) ( not ( = ?auto_12951 ?auto_12943 ) ) ( not ( = ?auto_12906 ?auto_12918 ) ) ( not ( = ?auto_12906 ?auto_12921 ) ) ( not ( = ?auto_12907 ?auto_12918 ) ) ( not ( = ?auto_12907 ?auto_12921 ) ) ( not ( = ?auto_12908 ?auto_12918 ) ) ( not ( = ?auto_12908 ?auto_12921 ) ) ( not ( = ?auto_12909 ?auto_12918 ) ) ( not ( = ?auto_12909 ?auto_12921 ) ) ( not ( = ?auto_12910 ?auto_12918 ) ) ( not ( = ?auto_12910 ?auto_12921 ) ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( not ( = ?auto_12911 ?auto_12921 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) ( not ( = ?auto_12914 ?auto_12921 ) ) ( not ( = ?auto_12913 ?auto_12918 ) ) ( not ( = ?auto_12913 ?auto_12921 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12921 ) ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12921 ) ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12921 ) ) ( not ( = ?auto_12918 ?auto_12951 ) ) ( not ( = ?auto_12918 ?auto_12947 ) ) ( not ( = ?auto_12918 ?auto_12941 ) ) ( not ( = ?auto_12918 ?auto_12935 ) ) ( not ( = ?auto_12918 ?auto_12953 ) ) ( not ( = ?auto_12918 ?auto_12928 ) ) ( not ( = ?auto_12918 ?auto_12939 ) ) ( not ( = ?auto_12918 ?auto_12932 ) ) ( not ( = ?auto_12918 ?auto_12942 ) ) ( not ( = ?auto_12918 ?auto_12945 ) ) ( not ( = ?auto_12918 ?auto_12943 ) ) ( not ( = ?auto_12920 ?auto_12950 ) ) ( not ( = ?auto_12920 ?auto_12937 ) ) ( not ( = ?auto_12920 ?auto_12936 ) ) ( not ( = ?auto_12920 ?auto_12930 ) ) ( not ( = ?auto_12920 ?auto_12933 ) ) ( not ( = ?auto_12920 ?auto_12949 ) ) ( not ( = ?auto_12920 ?auto_12934 ) ) ( not ( = ?auto_12920 ?auto_12952 ) ) ( not ( = ?auto_12920 ?auto_12926 ) ) ( not ( = ?auto_12919 ?auto_12940 ) ) ( not ( = ?auto_12919 ?auto_12929 ) ) ( not ( = ?auto_12919 ?auto_12948 ) ) ( not ( = ?auto_12919 ?auto_12927 ) ) ( not ( = ?auto_12919 ?auto_12944 ) ) ( not ( = ?auto_12919 ?auto_12925 ) ) ( not ( = ?auto_12919 ?auto_12931 ) ) ( not ( = ?auto_12919 ?auto_12946 ) ) ( not ( = ?auto_12919 ?auto_12938 ) ) ( not ( = ?auto_12921 ?auto_12951 ) ) ( not ( = ?auto_12921 ?auto_12947 ) ) ( not ( = ?auto_12921 ?auto_12941 ) ) ( not ( = ?auto_12921 ?auto_12935 ) ) ( not ( = ?auto_12921 ?auto_12953 ) ) ( not ( = ?auto_12921 ?auto_12928 ) ) ( not ( = ?auto_12921 ?auto_12939 ) ) ( not ( = ?auto_12921 ?auto_12932 ) ) ( not ( = ?auto_12921 ?auto_12942 ) ) ( not ( = ?auto_12921 ?auto_12945 ) ) ( not ( = ?auto_12921 ?auto_12943 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12906 ?auto_12907 ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12914 ?auto_12913 ?auto_12912 ?auto_12915 ?auto_12917 ?auto_12916 )
      ( MAKE-1CRATE ?auto_12916 ?auto_12918 )
      ( MAKE-12CRATE-VERIFY ?auto_12906 ?auto_12907 ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12914 ?auto_12913 ?auto_12912 ?auto_12915 ?auto_12917 ?auto_12916 ?auto_12918 ) )
  )

)

