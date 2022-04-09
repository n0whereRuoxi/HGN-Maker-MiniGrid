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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112439 - SURFACE
      ?auto_112440 - SURFACE
    )
    :vars
    (
      ?auto_112441 - HOIST
      ?auto_112442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112441 ?auto_112442 ) ( SURFACE-AT ?auto_112439 ?auto_112442 ) ( CLEAR ?auto_112439 ) ( LIFTING ?auto_112441 ?auto_112440 ) ( IS-CRATE ?auto_112440 ) ( not ( = ?auto_112439 ?auto_112440 ) ) )
    :subtasks
    ( ( !DROP ?auto_112441 ?auto_112440 ?auto_112439 ?auto_112442 )
      ( MAKE-1CRATE-VERIFY ?auto_112439 ?auto_112440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112443 - SURFACE
      ?auto_112444 - SURFACE
    )
    :vars
    (
      ?auto_112446 - HOIST
      ?auto_112445 - PLACE
      ?auto_112447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112446 ?auto_112445 ) ( SURFACE-AT ?auto_112443 ?auto_112445 ) ( CLEAR ?auto_112443 ) ( IS-CRATE ?auto_112444 ) ( not ( = ?auto_112443 ?auto_112444 ) ) ( TRUCK-AT ?auto_112447 ?auto_112445 ) ( AVAILABLE ?auto_112446 ) ( IN ?auto_112444 ?auto_112447 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112446 ?auto_112444 ?auto_112447 ?auto_112445 )
      ( MAKE-1CRATE ?auto_112443 ?auto_112444 )
      ( MAKE-1CRATE-VERIFY ?auto_112443 ?auto_112444 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112448 - SURFACE
      ?auto_112449 - SURFACE
    )
    :vars
    (
      ?auto_112452 - HOIST
      ?auto_112451 - PLACE
      ?auto_112450 - TRUCK
      ?auto_112453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112452 ?auto_112451 ) ( SURFACE-AT ?auto_112448 ?auto_112451 ) ( CLEAR ?auto_112448 ) ( IS-CRATE ?auto_112449 ) ( not ( = ?auto_112448 ?auto_112449 ) ) ( AVAILABLE ?auto_112452 ) ( IN ?auto_112449 ?auto_112450 ) ( TRUCK-AT ?auto_112450 ?auto_112453 ) ( not ( = ?auto_112453 ?auto_112451 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112450 ?auto_112453 ?auto_112451 )
      ( MAKE-1CRATE ?auto_112448 ?auto_112449 )
      ( MAKE-1CRATE-VERIFY ?auto_112448 ?auto_112449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112454 - SURFACE
      ?auto_112455 - SURFACE
    )
    :vars
    (
      ?auto_112457 - HOIST
      ?auto_112459 - PLACE
      ?auto_112456 - TRUCK
      ?auto_112458 - PLACE
      ?auto_112460 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112457 ?auto_112459 ) ( SURFACE-AT ?auto_112454 ?auto_112459 ) ( CLEAR ?auto_112454 ) ( IS-CRATE ?auto_112455 ) ( not ( = ?auto_112454 ?auto_112455 ) ) ( AVAILABLE ?auto_112457 ) ( TRUCK-AT ?auto_112456 ?auto_112458 ) ( not ( = ?auto_112458 ?auto_112459 ) ) ( HOIST-AT ?auto_112460 ?auto_112458 ) ( LIFTING ?auto_112460 ?auto_112455 ) ( not ( = ?auto_112457 ?auto_112460 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112460 ?auto_112455 ?auto_112456 ?auto_112458 )
      ( MAKE-1CRATE ?auto_112454 ?auto_112455 )
      ( MAKE-1CRATE-VERIFY ?auto_112454 ?auto_112455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112461 - SURFACE
      ?auto_112462 - SURFACE
    )
    :vars
    (
      ?auto_112464 - HOIST
      ?auto_112466 - PLACE
      ?auto_112467 - TRUCK
      ?auto_112465 - PLACE
      ?auto_112463 - HOIST
      ?auto_112468 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112464 ?auto_112466 ) ( SURFACE-AT ?auto_112461 ?auto_112466 ) ( CLEAR ?auto_112461 ) ( IS-CRATE ?auto_112462 ) ( not ( = ?auto_112461 ?auto_112462 ) ) ( AVAILABLE ?auto_112464 ) ( TRUCK-AT ?auto_112467 ?auto_112465 ) ( not ( = ?auto_112465 ?auto_112466 ) ) ( HOIST-AT ?auto_112463 ?auto_112465 ) ( not ( = ?auto_112464 ?auto_112463 ) ) ( AVAILABLE ?auto_112463 ) ( SURFACE-AT ?auto_112462 ?auto_112465 ) ( ON ?auto_112462 ?auto_112468 ) ( CLEAR ?auto_112462 ) ( not ( = ?auto_112461 ?auto_112468 ) ) ( not ( = ?auto_112462 ?auto_112468 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112463 ?auto_112462 ?auto_112468 ?auto_112465 )
      ( MAKE-1CRATE ?auto_112461 ?auto_112462 )
      ( MAKE-1CRATE-VERIFY ?auto_112461 ?auto_112462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112469 - SURFACE
      ?auto_112470 - SURFACE
    )
    :vars
    (
      ?auto_112471 - HOIST
      ?auto_112476 - PLACE
      ?auto_112473 - PLACE
      ?auto_112475 - HOIST
      ?auto_112474 - SURFACE
      ?auto_112472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112471 ?auto_112476 ) ( SURFACE-AT ?auto_112469 ?auto_112476 ) ( CLEAR ?auto_112469 ) ( IS-CRATE ?auto_112470 ) ( not ( = ?auto_112469 ?auto_112470 ) ) ( AVAILABLE ?auto_112471 ) ( not ( = ?auto_112473 ?auto_112476 ) ) ( HOIST-AT ?auto_112475 ?auto_112473 ) ( not ( = ?auto_112471 ?auto_112475 ) ) ( AVAILABLE ?auto_112475 ) ( SURFACE-AT ?auto_112470 ?auto_112473 ) ( ON ?auto_112470 ?auto_112474 ) ( CLEAR ?auto_112470 ) ( not ( = ?auto_112469 ?auto_112474 ) ) ( not ( = ?auto_112470 ?auto_112474 ) ) ( TRUCK-AT ?auto_112472 ?auto_112476 ) )
    :subtasks
    ( ( !DRIVE ?auto_112472 ?auto_112476 ?auto_112473 )
      ( MAKE-1CRATE ?auto_112469 ?auto_112470 )
      ( MAKE-1CRATE-VERIFY ?auto_112469 ?auto_112470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112486 - SURFACE
      ?auto_112487 - SURFACE
      ?auto_112488 - SURFACE
    )
    :vars
    (
      ?auto_112489 - HOIST
      ?auto_112490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112489 ?auto_112490 ) ( SURFACE-AT ?auto_112487 ?auto_112490 ) ( CLEAR ?auto_112487 ) ( LIFTING ?auto_112489 ?auto_112488 ) ( IS-CRATE ?auto_112488 ) ( not ( = ?auto_112487 ?auto_112488 ) ) ( ON ?auto_112487 ?auto_112486 ) ( not ( = ?auto_112486 ?auto_112487 ) ) ( not ( = ?auto_112486 ?auto_112488 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112487 ?auto_112488 )
      ( MAKE-2CRATE-VERIFY ?auto_112486 ?auto_112487 ?auto_112488 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112496 - SURFACE
      ?auto_112497 - SURFACE
      ?auto_112498 - SURFACE
    )
    :vars
    (
      ?auto_112500 - HOIST
      ?auto_112501 - PLACE
      ?auto_112499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112500 ?auto_112501 ) ( SURFACE-AT ?auto_112497 ?auto_112501 ) ( CLEAR ?auto_112497 ) ( IS-CRATE ?auto_112498 ) ( not ( = ?auto_112497 ?auto_112498 ) ) ( TRUCK-AT ?auto_112499 ?auto_112501 ) ( AVAILABLE ?auto_112500 ) ( IN ?auto_112498 ?auto_112499 ) ( ON ?auto_112497 ?auto_112496 ) ( not ( = ?auto_112496 ?auto_112497 ) ) ( not ( = ?auto_112496 ?auto_112498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112497 ?auto_112498 )
      ( MAKE-2CRATE-VERIFY ?auto_112496 ?auto_112497 ?auto_112498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112502 - SURFACE
      ?auto_112503 - SURFACE
    )
    :vars
    (
      ?auto_112506 - HOIST
      ?auto_112504 - PLACE
      ?auto_112505 - TRUCK
      ?auto_112507 - SURFACE
      ?auto_112508 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112506 ?auto_112504 ) ( SURFACE-AT ?auto_112502 ?auto_112504 ) ( CLEAR ?auto_112502 ) ( IS-CRATE ?auto_112503 ) ( not ( = ?auto_112502 ?auto_112503 ) ) ( AVAILABLE ?auto_112506 ) ( IN ?auto_112503 ?auto_112505 ) ( ON ?auto_112502 ?auto_112507 ) ( not ( = ?auto_112507 ?auto_112502 ) ) ( not ( = ?auto_112507 ?auto_112503 ) ) ( TRUCK-AT ?auto_112505 ?auto_112508 ) ( not ( = ?auto_112508 ?auto_112504 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112505 ?auto_112508 ?auto_112504 )
      ( MAKE-2CRATE ?auto_112507 ?auto_112502 ?auto_112503 )
      ( MAKE-1CRATE-VERIFY ?auto_112502 ?auto_112503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112509 - SURFACE
      ?auto_112510 - SURFACE
      ?auto_112511 - SURFACE
    )
    :vars
    (
      ?auto_112513 - HOIST
      ?auto_112514 - PLACE
      ?auto_112512 - TRUCK
      ?auto_112515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112513 ?auto_112514 ) ( SURFACE-AT ?auto_112510 ?auto_112514 ) ( CLEAR ?auto_112510 ) ( IS-CRATE ?auto_112511 ) ( not ( = ?auto_112510 ?auto_112511 ) ) ( AVAILABLE ?auto_112513 ) ( IN ?auto_112511 ?auto_112512 ) ( ON ?auto_112510 ?auto_112509 ) ( not ( = ?auto_112509 ?auto_112510 ) ) ( not ( = ?auto_112509 ?auto_112511 ) ) ( TRUCK-AT ?auto_112512 ?auto_112515 ) ( not ( = ?auto_112515 ?auto_112514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112510 ?auto_112511 )
      ( MAKE-2CRATE-VERIFY ?auto_112509 ?auto_112510 ?auto_112511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112516 - SURFACE
      ?auto_112517 - SURFACE
    )
    :vars
    (
      ?auto_112520 - HOIST
      ?auto_112519 - PLACE
      ?auto_112522 - SURFACE
      ?auto_112521 - TRUCK
      ?auto_112518 - PLACE
      ?auto_112523 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112520 ?auto_112519 ) ( SURFACE-AT ?auto_112516 ?auto_112519 ) ( CLEAR ?auto_112516 ) ( IS-CRATE ?auto_112517 ) ( not ( = ?auto_112516 ?auto_112517 ) ) ( AVAILABLE ?auto_112520 ) ( ON ?auto_112516 ?auto_112522 ) ( not ( = ?auto_112522 ?auto_112516 ) ) ( not ( = ?auto_112522 ?auto_112517 ) ) ( TRUCK-AT ?auto_112521 ?auto_112518 ) ( not ( = ?auto_112518 ?auto_112519 ) ) ( HOIST-AT ?auto_112523 ?auto_112518 ) ( LIFTING ?auto_112523 ?auto_112517 ) ( not ( = ?auto_112520 ?auto_112523 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112523 ?auto_112517 ?auto_112521 ?auto_112518 )
      ( MAKE-2CRATE ?auto_112522 ?auto_112516 ?auto_112517 )
      ( MAKE-1CRATE-VERIFY ?auto_112516 ?auto_112517 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112524 - SURFACE
      ?auto_112525 - SURFACE
      ?auto_112526 - SURFACE
    )
    :vars
    (
      ?auto_112528 - HOIST
      ?auto_112529 - PLACE
      ?auto_112531 - TRUCK
      ?auto_112530 - PLACE
      ?auto_112527 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112528 ?auto_112529 ) ( SURFACE-AT ?auto_112525 ?auto_112529 ) ( CLEAR ?auto_112525 ) ( IS-CRATE ?auto_112526 ) ( not ( = ?auto_112525 ?auto_112526 ) ) ( AVAILABLE ?auto_112528 ) ( ON ?auto_112525 ?auto_112524 ) ( not ( = ?auto_112524 ?auto_112525 ) ) ( not ( = ?auto_112524 ?auto_112526 ) ) ( TRUCK-AT ?auto_112531 ?auto_112530 ) ( not ( = ?auto_112530 ?auto_112529 ) ) ( HOIST-AT ?auto_112527 ?auto_112530 ) ( LIFTING ?auto_112527 ?auto_112526 ) ( not ( = ?auto_112528 ?auto_112527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112525 ?auto_112526 )
      ( MAKE-2CRATE-VERIFY ?auto_112524 ?auto_112525 ?auto_112526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112532 - SURFACE
      ?auto_112533 - SURFACE
    )
    :vars
    (
      ?auto_112534 - HOIST
      ?auto_112539 - PLACE
      ?auto_112535 - SURFACE
      ?auto_112537 - TRUCK
      ?auto_112538 - PLACE
      ?auto_112536 - HOIST
      ?auto_112540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112534 ?auto_112539 ) ( SURFACE-AT ?auto_112532 ?auto_112539 ) ( CLEAR ?auto_112532 ) ( IS-CRATE ?auto_112533 ) ( not ( = ?auto_112532 ?auto_112533 ) ) ( AVAILABLE ?auto_112534 ) ( ON ?auto_112532 ?auto_112535 ) ( not ( = ?auto_112535 ?auto_112532 ) ) ( not ( = ?auto_112535 ?auto_112533 ) ) ( TRUCK-AT ?auto_112537 ?auto_112538 ) ( not ( = ?auto_112538 ?auto_112539 ) ) ( HOIST-AT ?auto_112536 ?auto_112538 ) ( not ( = ?auto_112534 ?auto_112536 ) ) ( AVAILABLE ?auto_112536 ) ( SURFACE-AT ?auto_112533 ?auto_112538 ) ( ON ?auto_112533 ?auto_112540 ) ( CLEAR ?auto_112533 ) ( not ( = ?auto_112532 ?auto_112540 ) ) ( not ( = ?auto_112533 ?auto_112540 ) ) ( not ( = ?auto_112535 ?auto_112540 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112536 ?auto_112533 ?auto_112540 ?auto_112538 )
      ( MAKE-2CRATE ?auto_112535 ?auto_112532 ?auto_112533 )
      ( MAKE-1CRATE-VERIFY ?auto_112532 ?auto_112533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112541 - SURFACE
      ?auto_112542 - SURFACE
      ?auto_112543 - SURFACE
    )
    :vars
    (
      ?auto_112549 - HOIST
      ?auto_112544 - PLACE
      ?auto_112545 - TRUCK
      ?auto_112547 - PLACE
      ?auto_112546 - HOIST
      ?auto_112548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112549 ?auto_112544 ) ( SURFACE-AT ?auto_112542 ?auto_112544 ) ( CLEAR ?auto_112542 ) ( IS-CRATE ?auto_112543 ) ( not ( = ?auto_112542 ?auto_112543 ) ) ( AVAILABLE ?auto_112549 ) ( ON ?auto_112542 ?auto_112541 ) ( not ( = ?auto_112541 ?auto_112542 ) ) ( not ( = ?auto_112541 ?auto_112543 ) ) ( TRUCK-AT ?auto_112545 ?auto_112547 ) ( not ( = ?auto_112547 ?auto_112544 ) ) ( HOIST-AT ?auto_112546 ?auto_112547 ) ( not ( = ?auto_112549 ?auto_112546 ) ) ( AVAILABLE ?auto_112546 ) ( SURFACE-AT ?auto_112543 ?auto_112547 ) ( ON ?auto_112543 ?auto_112548 ) ( CLEAR ?auto_112543 ) ( not ( = ?auto_112542 ?auto_112548 ) ) ( not ( = ?auto_112543 ?auto_112548 ) ) ( not ( = ?auto_112541 ?auto_112548 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112542 ?auto_112543 )
      ( MAKE-2CRATE-VERIFY ?auto_112541 ?auto_112542 ?auto_112543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112550 - SURFACE
      ?auto_112551 - SURFACE
    )
    :vars
    (
      ?auto_112557 - HOIST
      ?auto_112555 - PLACE
      ?auto_112558 - SURFACE
      ?auto_112553 - PLACE
      ?auto_112554 - HOIST
      ?auto_112552 - SURFACE
      ?auto_112556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112557 ?auto_112555 ) ( SURFACE-AT ?auto_112550 ?auto_112555 ) ( CLEAR ?auto_112550 ) ( IS-CRATE ?auto_112551 ) ( not ( = ?auto_112550 ?auto_112551 ) ) ( AVAILABLE ?auto_112557 ) ( ON ?auto_112550 ?auto_112558 ) ( not ( = ?auto_112558 ?auto_112550 ) ) ( not ( = ?auto_112558 ?auto_112551 ) ) ( not ( = ?auto_112553 ?auto_112555 ) ) ( HOIST-AT ?auto_112554 ?auto_112553 ) ( not ( = ?auto_112557 ?auto_112554 ) ) ( AVAILABLE ?auto_112554 ) ( SURFACE-AT ?auto_112551 ?auto_112553 ) ( ON ?auto_112551 ?auto_112552 ) ( CLEAR ?auto_112551 ) ( not ( = ?auto_112550 ?auto_112552 ) ) ( not ( = ?auto_112551 ?auto_112552 ) ) ( not ( = ?auto_112558 ?auto_112552 ) ) ( TRUCK-AT ?auto_112556 ?auto_112555 ) )
    :subtasks
    ( ( !DRIVE ?auto_112556 ?auto_112555 ?auto_112553 )
      ( MAKE-2CRATE ?auto_112558 ?auto_112550 ?auto_112551 )
      ( MAKE-1CRATE-VERIFY ?auto_112550 ?auto_112551 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112559 - SURFACE
      ?auto_112560 - SURFACE
      ?auto_112561 - SURFACE
    )
    :vars
    (
      ?auto_112563 - HOIST
      ?auto_112564 - PLACE
      ?auto_112562 - PLACE
      ?auto_112567 - HOIST
      ?auto_112565 - SURFACE
      ?auto_112566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112563 ?auto_112564 ) ( SURFACE-AT ?auto_112560 ?auto_112564 ) ( CLEAR ?auto_112560 ) ( IS-CRATE ?auto_112561 ) ( not ( = ?auto_112560 ?auto_112561 ) ) ( AVAILABLE ?auto_112563 ) ( ON ?auto_112560 ?auto_112559 ) ( not ( = ?auto_112559 ?auto_112560 ) ) ( not ( = ?auto_112559 ?auto_112561 ) ) ( not ( = ?auto_112562 ?auto_112564 ) ) ( HOIST-AT ?auto_112567 ?auto_112562 ) ( not ( = ?auto_112563 ?auto_112567 ) ) ( AVAILABLE ?auto_112567 ) ( SURFACE-AT ?auto_112561 ?auto_112562 ) ( ON ?auto_112561 ?auto_112565 ) ( CLEAR ?auto_112561 ) ( not ( = ?auto_112560 ?auto_112565 ) ) ( not ( = ?auto_112561 ?auto_112565 ) ) ( not ( = ?auto_112559 ?auto_112565 ) ) ( TRUCK-AT ?auto_112566 ?auto_112564 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112560 ?auto_112561 )
      ( MAKE-2CRATE-VERIFY ?auto_112559 ?auto_112560 ?auto_112561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112568 - SURFACE
      ?auto_112569 - SURFACE
    )
    :vars
    (
      ?auto_112572 - HOIST
      ?auto_112573 - PLACE
      ?auto_112571 - SURFACE
      ?auto_112575 - PLACE
      ?auto_112576 - HOIST
      ?auto_112570 - SURFACE
      ?auto_112574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112572 ?auto_112573 ) ( IS-CRATE ?auto_112569 ) ( not ( = ?auto_112568 ?auto_112569 ) ) ( not ( = ?auto_112571 ?auto_112568 ) ) ( not ( = ?auto_112571 ?auto_112569 ) ) ( not ( = ?auto_112575 ?auto_112573 ) ) ( HOIST-AT ?auto_112576 ?auto_112575 ) ( not ( = ?auto_112572 ?auto_112576 ) ) ( AVAILABLE ?auto_112576 ) ( SURFACE-AT ?auto_112569 ?auto_112575 ) ( ON ?auto_112569 ?auto_112570 ) ( CLEAR ?auto_112569 ) ( not ( = ?auto_112568 ?auto_112570 ) ) ( not ( = ?auto_112569 ?auto_112570 ) ) ( not ( = ?auto_112571 ?auto_112570 ) ) ( TRUCK-AT ?auto_112574 ?auto_112573 ) ( SURFACE-AT ?auto_112571 ?auto_112573 ) ( CLEAR ?auto_112571 ) ( LIFTING ?auto_112572 ?auto_112568 ) ( IS-CRATE ?auto_112568 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112571 ?auto_112568 )
      ( MAKE-2CRATE ?auto_112571 ?auto_112568 ?auto_112569 )
      ( MAKE-1CRATE-VERIFY ?auto_112568 ?auto_112569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112577 - SURFACE
      ?auto_112578 - SURFACE
      ?auto_112579 - SURFACE
    )
    :vars
    (
      ?auto_112581 - HOIST
      ?auto_112584 - PLACE
      ?auto_112585 - PLACE
      ?auto_112582 - HOIST
      ?auto_112583 - SURFACE
      ?auto_112580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112581 ?auto_112584 ) ( IS-CRATE ?auto_112579 ) ( not ( = ?auto_112578 ?auto_112579 ) ) ( not ( = ?auto_112577 ?auto_112578 ) ) ( not ( = ?auto_112577 ?auto_112579 ) ) ( not ( = ?auto_112585 ?auto_112584 ) ) ( HOIST-AT ?auto_112582 ?auto_112585 ) ( not ( = ?auto_112581 ?auto_112582 ) ) ( AVAILABLE ?auto_112582 ) ( SURFACE-AT ?auto_112579 ?auto_112585 ) ( ON ?auto_112579 ?auto_112583 ) ( CLEAR ?auto_112579 ) ( not ( = ?auto_112578 ?auto_112583 ) ) ( not ( = ?auto_112579 ?auto_112583 ) ) ( not ( = ?auto_112577 ?auto_112583 ) ) ( TRUCK-AT ?auto_112580 ?auto_112584 ) ( SURFACE-AT ?auto_112577 ?auto_112584 ) ( CLEAR ?auto_112577 ) ( LIFTING ?auto_112581 ?auto_112578 ) ( IS-CRATE ?auto_112578 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112578 ?auto_112579 )
      ( MAKE-2CRATE-VERIFY ?auto_112577 ?auto_112578 ?auto_112579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112586 - SURFACE
      ?auto_112587 - SURFACE
    )
    :vars
    (
      ?auto_112594 - HOIST
      ?auto_112593 - PLACE
      ?auto_112590 - SURFACE
      ?auto_112588 - PLACE
      ?auto_112592 - HOIST
      ?auto_112589 - SURFACE
      ?auto_112591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112594 ?auto_112593 ) ( IS-CRATE ?auto_112587 ) ( not ( = ?auto_112586 ?auto_112587 ) ) ( not ( = ?auto_112590 ?auto_112586 ) ) ( not ( = ?auto_112590 ?auto_112587 ) ) ( not ( = ?auto_112588 ?auto_112593 ) ) ( HOIST-AT ?auto_112592 ?auto_112588 ) ( not ( = ?auto_112594 ?auto_112592 ) ) ( AVAILABLE ?auto_112592 ) ( SURFACE-AT ?auto_112587 ?auto_112588 ) ( ON ?auto_112587 ?auto_112589 ) ( CLEAR ?auto_112587 ) ( not ( = ?auto_112586 ?auto_112589 ) ) ( not ( = ?auto_112587 ?auto_112589 ) ) ( not ( = ?auto_112590 ?auto_112589 ) ) ( TRUCK-AT ?auto_112591 ?auto_112593 ) ( SURFACE-AT ?auto_112590 ?auto_112593 ) ( CLEAR ?auto_112590 ) ( IS-CRATE ?auto_112586 ) ( AVAILABLE ?auto_112594 ) ( IN ?auto_112586 ?auto_112591 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112594 ?auto_112586 ?auto_112591 ?auto_112593 )
      ( MAKE-2CRATE ?auto_112590 ?auto_112586 ?auto_112587 )
      ( MAKE-1CRATE-VERIFY ?auto_112586 ?auto_112587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112595 - SURFACE
      ?auto_112596 - SURFACE
      ?auto_112597 - SURFACE
    )
    :vars
    (
      ?auto_112598 - HOIST
      ?auto_112602 - PLACE
      ?auto_112599 - PLACE
      ?auto_112603 - HOIST
      ?auto_112600 - SURFACE
      ?auto_112601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112598 ?auto_112602 ) ( IS-CRATE ?auto_112597 ) ( not ( = ?auto_112596 ?auto_112597 ) ) ( not ( = ?auto_112595 ?auto_112596 ) ) ( not ( = ?auto_112595 ?auto_112597 ) ) ( not ( = ?auto_112599 ?auto_112602 ) ) ( HOIST-AT ?auto_112603 ?auto_112599 ) ( not ( = ?auto_112598 ?auto_112603 ) ) ( AVAILABLE ?auto_112603 ) ( SURFACE-AT ?auto_112597 ?auto_112599 ) ( ON ?auto_112597 ?auto_112600 ) ( CLEAR ?auto_112597 ) ( not ( = ?auto_112596 ?auto_112600 ) ) ( not ( = ?auto_112597 ?auto_112600 ) ) ( not ( = ?auto_112595 ?auto_112600 ) ) ( TRUCK-AT ?auto_112601 ?auto_112602 ) ( SURFACE-AT ?auto_112595 ?auto_112602 ) ( CLEAR ?auto_112595 ) ( IS-CRATE ?auto_112596 ) ( AVAILABLE ?auto_112598 ) ( IN ?auto_112596 ?auto_112601 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112596 ?auto_112597 )
      ( MAKE-2CRATE-VERIFY ?auto_112595 ?auto_112596 ?auto_112597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112640 - SURFACE
      ?auto_112641 - SURFACE
    )
    :vars
    (
      ?auto_112644 - HOIST
      ?auto_112646 - PLACE
      ?auto_112647 - SURFACE
      ?auto_112645 - PLACE
      ?auto_112643 - HOIST
      ?auto_112648 - SURFACE
      ?auto_112642 - TRUCK
      ?auto_112649 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112644 ?auto_112646 ) ( SURFACE-AT ?auto_112640 ?auto_112646 ) ( CLEAR ?auto_112640 ) ( IS-CRATE ?auto_112641 ) ( not ( = ?auto_112640 ?auto_112641 ) ) ( AVAILABLE ?auto_112644 ) ( ON ?auto_112640 ?auto_112647 ) ( not ( = ?auto_112647 ?auto_112640 ) ) ( not ( = ?auto_112647 ?auto_112641 ) ) ( not ( = ?auto_112645 ?auto_112646 ) ) ( HOIST-AT ?auto_112643 ?auto_112645 ) ( not ( = ?auto_112644 ?auto_112643 ) ) ( AVAILABLE ?auto_112643 ) ( SURFACE-AT ?auto_112641 ?auto_112645 ) ( ON ?auto_112641 ?auto_112648 ) ( CLEAR ?auto_112641 ) ( not ( = ?auto_112640 ?auto_112648 ) ) ( not ( = ?auto_112641 ?auto_112648 ) ) ( not ( = ?auto_112647 ?auto_112648 ) ) ( TRUCK-AT ?auto_112642 ?auto_112649 ) ( not ( = ?auto_112649 ?auto_112646 ) ) ( not ( = ?auto_112645 ?auto_112649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112642 ?auto_112649 ?auto_112646 )
      ( MAKE-1CRATE ?auto_112640 ?auto_112641 )
      ( MAKE-1CRATE-VERIFY ?auto_112640 ?auto_112641 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112679 - SURFACE
      ?auto_112680 - SURFACE
      ?auto_112681 - SURFACE
      ?auto_112682 - SURFACE
    )
    :vars
    (
      ?auto_112684 - HOIST
      ?auto_112683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112684 ?auto_112683 ) ( SURFACE-AT ?auto_112681 ?auto_112683 ) ( CLEAR ?auto_112681 ) ( LIFTING ?auto_112684 ?auto_112682 ) ( IS-CRATE ?auto_112682 ) ( not ( = ?auto_112681 ?auto_112682 ) ) ( ON ?auto_112680 ?auto_112679 ) ( ON ?auto_112681 ?auto_112680 ) ( not ( = ?auto_112679 ?auto_112680 ) ) ( not ( = ?auto_112679 ?auto_112681 ) ) ( not ( = ?auto_112679 ?auto_112682 ) ) ( not ( = ?auto_112680 ?auto_112681 ) ) ( not ( = ?auto_112680 ?auto_112682 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112681 ?auto_112682 )
      ( MAKE-3CRATE-VERIFY ?auto_112679 ?auto_112680 ?auto_112681 ?auto_112682 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112696 - SURFACE
      ?auto_112697 - SURFACE
      ?auto_112698 - SURFACE
      ?auto_112699 - SURFACE
    )
    :vars
    (
      ?auto_112702 - HOIST
      ?auto_112701 - PLACE
      ?auto_112700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112702 ?auto_112701 ) ( SURFACE-AT ?auto_112698 ?auto_112701 ) ( CLEAR ?auto_112698 ) ( IS-CRATE ?auto_112699 ) ( not ( = ?auto_112698 ?auto_112699 ) ) ( TRUCK-AT ?auto_112700 ?auto_112701 ) ( AVAILABLE ?auto_112702 ) ( IN ?auto_112699 ?auto_112700 ) ( ON ?auto_112698 ?auto_112697 ) ( not ( = ?auto_112697 ?auto_112698 ) ) ( not ( = ?auto_112697 ?auto_112699 ) ) ( ON ?auto_112697 ?auto_112696 ) ( not ( = ?auto_112696 ?auto_112697 ) ) ( not ( = ?auto_112696 ?auto_112698 ) ) ( not ( = ?auto_112696 ?auto_112699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112697 ?auto_112698 ?auto_112699 )
      ( MAKE-3CRATE-VERIFY ?auto_112696 ?auto_112697 ?auto_112698 ?auto_112699 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112717 - SURFACE
      ?auto_112718 - SURFACE
      ?auto_112719 - SURFACE
      ?auto_112720 - SURFACE
    )
    :vars
    (
      ?auto_112724 - HOIST
      ?auto_112721 - PLACE
      ?auto_112722 - TRUCK
      ?auto_112723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112724 ?auto_112721 ) ( SURFACE-AT ?auto_112719 ?auto_112721 ) ( CLEAR ?auto_112719 ) ( IS-CRATE ?auto_112720 ) ( not ( = ?auto_112719 ?auto_112720 ) ) ( AVAILABLE ?auto_112724 ) ( IN ?auto_112720 ?auto_112722 ) ( ON ?auto_112719 ?auto_112718 ) ( not ( = ?auto_112718 ?auto_112719 ) ) ( not ( = ?auto_112718 ?auto_112720 ) ) ( TRUCK-AT ?auto_112722 ?auto_112723 ) ( not ( = ?auto_112723 ?auto_112721 ) ) ( ON ?auto_112718 ?auto_112717 ) ( not ( = ?auto_112717 ?auto_112718 ) ) ( not ( = ?auto_112717 ?auto_112719 ) ) ( not ( = ?auto_112717 ?auto_112720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112718 ?auto_112719 ?auto_112720 )
      ( MAKE-3CRATE-VERIFY ?auto_112717 ?auto_112718 ?auto_112719 ?auto_112720 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112741 - SURFACE
      ?auto_112742 - SURFACE
      ?auto_112743 - SURFACE
      ?auto_112744 - SURFACE
    )
    :vars
    (
      ?auto_112745 - HOIST
      ?auto_112749 - PLACE
      ?auto_112747 - TRUCK
      ?auto_112746 - PLACE
      ?auto_112748 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112745 ?auto_112749 ) ( SURFACE-AT ?auto_112743 ?auto_112749 ) ( CLEAR ?auto_112743 ) ( IS-CRATE ?auto_112744 ) ( not ( = ?auto_112743 ?auto_112744 ) ) ( AVAILABLE ?auto_112745 ) ( ON ?auto_112743 ?auto_112742 ) ( not ( = ?auto_112742 ?auto_112743 ) ) ( not ( = ?auto_112742 ?auto_112744 ) ) ( TRUCK-AT ?auto_112747 ?auto_112746 ) ( not ( = ?auto_112746 ?auto_112749 ) ) ( HOIST-AT ?auto_112748 ?auto_112746 ) ( LIFTING ?auto_112748 ?auto_112744 ) ( not ( = ?auto_112745 ?auto_112748 ) ) ( ON ?auto_112742 ?auto_112741 ) ( not ( = ?auto_112741 ?auto_112742 ) ) ( not ( = ?auto_112741 ?auto_112743 ) ) ( not ( = ?auto_112741 ?auto_112744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112742 ?auto_112743 ?auto_112744 )
      ( MAKE-3CRATE-VERIFY ?auto_112741 ?auto_112742 ?auto_112743 ?auto_112744 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112768 - SURFACE
      ?auto_112769 - SURFACE
      ?auto_112770 - SURFACE
      ?auto_112771 - SURFACE
    )
    :vars
    (
      ?auto_112776 - HOIST
      ?auto_112773 - PLACE
      ?auto_112777 - TRUCK
      ?auto_112772 - PLACE
      ?auto_112775 - HOIST
      ?auto_112774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112776 ?auto_112773 ) ( SURFACE-AT ?auto_112770 ?auto_112773 ) ( CLEAR ?auto_112770 ) ( IS-CRATE ?auto_112771 ) ( not ( = ?auto_112770 ?auto_112771 ) ) ( AVAILABLE ?auto_112776 ) ( ON ?auto_112770 ?auto_112769 ) ( not ( = ?auto_112769 ?auto_112770 ) ) ( not ( = ?auto_112769 ?auto_112771 ) ) ( TRUCK-AT ?auto_112777 ?auto_112772 ) ( not ( = ?auto_112772 ?auto_112773 ) ) ( HOIST-AT ?auto_112775 ?auto_112772 ) ( not ( = ?auto_112776 ?auto_112775 ) ) ( AVAILABLE ?auto_112775 ) ( SURFACE-AT ?auto_112771 ?auto_112772 ) ( ON ?auto_112771 ?auto_112774 ) ( CLEAR ?auto_112771 ) ( not ( = ?auto_112770 ?auto_112774 ) ) ( not ( = ?auto_112771 ?auto_112774 ) ) ( not ( = ?auto_112769 ?auto_112774 ) ) ( ON ?auto_112769 ?auto_112768 ) ( not ( = ?auto_112768 ?auto_112769 ) ) ( not ( = ?auto_112768 ?auto_112770 ) ) ( not ( = ?auto_112768 ?auto_112771 ) ) ( not ( = ?auto_112768 ?auto_112774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112769 ?auto_112770 ?auto_112771 )
      ( MAKE-3CRATE-VERIFY ?auto_112768 ?auto_112769 ?auto_112770 ?auto_112771 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112796 - SURFACE
      ?auto_112797 - SURFACE
      ?auto_112798 - SURFACE
      ?auto_112799 - SURFACE
    )
    :vars
    (
      ?auto_112803 - HOIST
      ?auto_112805 - PLACE
      ?auto_112804 - PLACE
      ?auto_112800 - HOIST
      ?auto_112802 - SURFACE
      ?auto_112801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112803 ?auto_112805 ) ( SURFACE-AT ?auto_112798 ?auto_112805 ) ( CLEAR ?auto_112798 ) ( IS-CRATE ?auto_112799 ) ( not ( = ?auto_112798 ?auto_112799 ) ) ( AVAILABLE ?auto_112803 ) ( ON ?auto_112798 ?auto_112797 ) ( not ( = ?auto_112797 ?auto_112798 ) ) ( not ( = ?auto_112797 ?auto_112799 ) ) ( not ( = ?auto_112804 ?auto_112805 ) ) ( HOIST-AT ?auto_112800 ?auto_112804 ) ( not ( = ?auto_112803 ?auto_112800 ) ) ( AVAILABLE ?auto_112800 ) ( SURFACE-AT ?auto_112799 ?auto_112804 ) ( ON ?auto_112799 ?auto_112802 ) ( CLEAR ?auto_112799 ) ( not ( = ?auto_112798 ?auto_112802 ) ) ( not ( = ?auto_112799 ?auto_112802 ) ) ( not ( = ?auto_112797 ?auto_112802 ) ) ( TRUCK-AT ?auto_112801 ?auto_112805 ) ( ON ?auto_112797 ?auto_112796 ) ( not ( = ?auto_112796 ?auto_112797 ) ) ( not ( = ?auto_112796 ?auto_112798 ) ) ( not ( = ?auto_112796 ?auto_112799 ) ) ( not ( = ?auto_112796 ?auto_112802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112797 ?auto_112798 ?auto_112799 )
      ( MAKE-3CRATE-VERIFY ?auto_112796 ?auto_112797 ?auto_112798 ?auto_112799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112824 - SURFACE
      ?auto_112825 - SURFACE
      ?auto_112826 - SURFACE
      ?auto_112827 - SURFACE
    )
    :vars
    (
      ?auto_112833 - HOIST
      ?auto_112828 - PLACE
      ?auto_112832 - PLACE
      ?auto_112831 - HOIST
      ?auto_112830 - SURFACE
      ?auto_112829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112833 ?auto_112828 ) ( IS-CRATE ?auto_112827 ) ( not ( = ?auto_112826 ?auto_112827 ) ) ( not ( = ?auto_112825 ?auto_112826 ) ) ( not ( = ?auto_112825 ?auto_112827 ) ) ( not ( = ?auto_112832 ?auto_112828 ) ) ( HOIST-AT ?auto_112831 ?auto_112832 ) ( not ( = ?auto_112833 ?auto_112831 ) ) ( AVAILABLE ?auto_112831 ) ( SURFACE-AT ?auto_112827 ?auto_112832 ) ( ON ?auto_112827 ?auto_112830 ) ( CLEAR ?auto_112827 ) ( not ( = ?auto_112826 ?auto_112830 ) ) ( not ( = ?auto_112827 ?auto_112830 ) ) ( not ( = ?auto_112825 ?auto_112830 ) ) ( TRUCK-AT ?auto_112829 ?auto_112828 ) ( SURFACE-AT ?auto_112825 ?auto_112828 ) ( CLEAR ?auto_112825 ) ( LIFTING ?auto_112833 ?auto_112826 ) ( IS-CRATE ?auto_112826 ) ( ON ?auto_112825 ?auto_112824 ) ( not ( = ?auto_112824 ?auto_112825 ) ) ( not ( = ?auto_112824 ?auto_112826 ) ) ( not ( = ?auto_112824 ?auto_112827 ) ) ( not ( = ?auto_112824 ?auto_112830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112825 ?auto_112826 ?auto_112827 )
      ( MAKE-3CRATE-VERIFY ?auto_112824 ?auto_112825 ?auto_112826 ?auto_112827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112852 - SURFACE
      ?auto_112853 - SURFACE
      ?auto_112854 - SURFACE
      ?auto_112855 - SURFACE
    )
    :vars
    (
      ?auto_112857 - HOIST
      ?auto_112859 - PLACE
      ?auto_112860 - PLACE
      ?auto_112858 - HOIST
      ?auto_112861 - SURFACE
      ?auto_112856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112857 ?auto_112859 ) ( IS-CRATE ?auto_112855 ) ( not ( = ?auto_112854 ?auto_112855 ) ) ( not ( = ?auto_112853 ?auto_112854 ) ) ( not ( = ?auto_112853 ?auto_112855 ) ) ( not ( = ?auto_112860 ?auto_112859 ) ) ( HOIST-AT ?auto_112858 ?auto_112860 ) ( not ( = ?auto_112857 ?auto_112858 ) ) ( AVAILABLE ?auto_112858 ) ( SURFACE-AT ?auto_112855 ?auto_112860 ) ( ON ?auto_112855 ?auto_112861 ) ( CLEAR ?auto_112855 ) ( not ( = ?auto_112854 ?auto_112861 ) ) ( not ( = ?auto_112855 ?auto_112861 ) ) ( not ( = ?auto_112853 ?auto_112861 ) ) ( TRUCK-AT ?auto_112856 ?auto_112859 ) ( SURFACE-AT ?auto_112853 ?auto_112859 ) ( CLEAR ?auto_112853 ) ( IS-CRATE ?auto_112854 ) ( AVAILABLE ?auto_112857 ) ( IN ?auto_112854 ?auto_112856 ) ( ON ?auto_112853 ?auto_112852 ) ( not ( = ?auto_112852 ?auto_112853 ) ) ( not ( = ?auto_112852 ?auto_112854 ) ) ( not ( = ?auto_112852 ?auto_112855 ) ) ( not ( = ?auto_112852 ?auto_112861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112853 ?auto_112854 ?auto_112855 )
      ( MAKE-3CRATE-VERIFY ?auto_112852 ?auto_112853 ?auto_112854 ?auto_112855 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113143 - SURFACE
      ?auto_113144 - SURFACE
      ?auto_113145 - SURFACE
      ?auto_113146 - SURFACE
      ?auto_113147 - SURFACE
    )
    :vars
    (
      ?auto_113148 - HOIST
      ?auto_113149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113148 ?auto_113149 ) ( SURFACE-AT ?auto_113146 ?auto_113149 ) ( CLEAR ?auto_113146 ) ( LIFTING ?auto_113148 ?auto_113147 ) ( IS-CRATE ?auto_113147 ) ( not ( = ?auto_113146 ?auto_113147 ) ) ( ON ?auto_113144 ?auto_113143 ) ( ON ?auto_113145 ?auto_113144 ) ( ON ?auto_113146 ?auto_113145 ) ( not ( = ?auto_113143 ?auto_113144 ) ) ( not ( = ?auto_113143 ?auto_113145 ) ) ( not ( = ?auto_113143 ?auto_113146 ) ) ( not ( = ?auto_113143 ?auto_113147 ) ) ( not ( = ?auto_113144 ?auto_113145 ) ) ( not ( = ?auto_113144 ?auto_113146 ) ) ( not ( = ?auto_113144 ?auto_113147 ) ) ( not ( = ?auto_113145 ?auto_113146 ) ) ( not ( = ?auto_113145 ?auto_113147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113146 ?auto_113147 )
      ( MAKE-4CRATE-VERIFY ?auto_113143 ?auto_113144 ?auto_113145 ?auto_113146 ?auto_113147 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113168 - SURFACE
      ?auto_113169 - SURFACE
      ?auto_113170 - SURFACE
      ?auto_113171 - SURFACE
      ?auto_113172 - SURFACE
    )
    :vars
    (
      ?auto_113173 - HOIST
      ?auto_113174 - PLACE
      ?auto_113175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113173 ?auto_113174 ) ( SURFACE-AT ?auto_113171 ?auto_113174 ) ( CLEAR ?auto_113171 ) ( IS-CRATE ?auto_113172 ) ( not ( = ?auto_113171 ?auto_113172 ) ) ( TRUCK-AT ?auto_113175 ?auto_113174 ) ( AVAILABLE ?auto_113173 ) ( IN ?auto_113172 ?auto_113175 ) ( ON ?auto_113171 ?auto_113170 ) ( not ( = ?auto_113170 ?auto_113171 ) ) ( not ( = ?auto_113170 ?auto_113172 ) ) ( ON ?auto_113169 ?auto_113168 ) ( ON ?auto_113170 ?auto_113169 ) ( not ( = ?auto_113168 ?auto_113169 ) ) ( not ( = ?auto_113168 ?auto_113170 ) ) ( not ( = ?auto_113168 ?auto_113171 ) ) ( not ( = ?auto_113168 ?auto_113172 ) ) ( not ( = ?auto_113169 ?auto_113170 ) ) ( not ( = ?auto_113169 ?auto_113171 ) ) ( not ( = ?auto_113169 ?auto_113172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113170 ?auto_113171 ?auto_113172 )
      ( MAKE-4CRATE-VERIFY ?auto_113168 ?auto_113169 ?auto_113170 ?auto_113171 ?auto_113172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113198 - SURFACE
      ?auto_113199 - SURFACE
      ?auto_113200 - SURFACE
      ?auto_113201 - SURFACE
      ?auto_113202 - SURFACE
    )
    :vars
    (
      ?auto_113205 - HOIST
      ?auto_113203 - PLACE
      ?auto_113206 - TRUCK
      ?auto_113204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113205 ?auto_113203 ) ( SURFACE-AT ?auto_113201 ?auto_113203 ) ( CLEAR ?auto_113201 ) ( IS-CRATE ?auto_113202 ) ( not ( = ?auto_113201 ?auto_113202 ) ) ( AVAILABLE ?auto_113205 ) ( IN ?auto_113202 ?auto_113206 ) ( ON ?auto_113201 ?auto_113200 ) ( not ( = ?auto_113200 ?auto_113201 ) ) ( not ( = ?auto_113200 ?auto_113202 ) ) ( TRUCK-AT ?auto_113206 ?auto_113204 ) ( not ( = ?auto_113204 ?auto_113203 ) ) ( ON ?auto_113199 ?auto_113198 ) ( ON ?auto_113200 ?auto_113199 ) ( not ( = ?auto_113198 ?auto_113199 ) ) ( not ( = ?auto_113198 ?auto_113200 ) ) ( not ( = ?auto_113198 ?auto_113201 ) ) ( not ( = ?auto_113198 ?auto_113202 ) ) ( not ( = ?auto_113199 ?auto_113200 ) ) ( not ( = ?auto_113199 ?auto_113201 ) ) ( not ( = ?auto_113199 ?auto_113202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113200 ?auto_113201 ?auto_113202 )
      ( MAKE-4CRATE-VERIFY ?auto_113198 ?auto_113199 ?auto_113200 ?auto_113201 ?auto_113202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113232 - SURFACE
      ?auto_113233 - SURFACE
      ?auto_113234 - SURFACE
      ?auto_113235 - SURFACE
      ?auto_113236 - SURFACE
    )
    :vars
    (
      ?auto_113241 - HOIST
      ?auto_113239 - PLACE
      ?auto_113237 - TRUCK
      ?auto_113240 - PLACE
      ?auto_113238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_113241 ?auto_113239 ) ( SURFACE-AT ?auto_113235 ?auto_113239 ) ( CLEAR ?auto_113235 ) ( IS-CRATE ?auto_113236 ) ( not ( = ?auto_113235 ?auto_113236 ) ) ( AVAILABLE ?auto_113241 ) ( ON ?auto_113235 ?auto_113234 ) ( not ( = ?auto_113234 ?auto_113235 ) ) ( not ( = ?auto_113234 ?auto_113236 ) ) ( TRUCK-AT ?auto_113237 ?auto_113240 ) ( not ( = ?auto_113240 ?auto_113239 ) ) ( HOIST-AT ?auto_113238 ?auto_113240 ) ( LIFTING ?auto_113238 ?auto_113236 ) ( not ( = ?auto_113241 ?auto_113238 ) ) ( ON ?auto_113233 ?auto_113232 ) ( ON ?auto_113234 ?auto_113233 ) ( not ( = ?auto_113232 ?auto_113233 ) ) ( not ( = ?auto_113232 ?auto_113234 ) ) ( not ( = ?auto_113232 ?auto_113235 ) ) ( not ( = ?auto_113232 ?auto_113236 ) ) ( not ( = ?auto_113233 ?auto_113234 ) ) ( not ( = ?auto_113233 ?auto_113235 ) ) ( not ( = ?auto_113233 ?auto_113236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113234 ?auto_113235 ?auto_113236 )
      ( MAKE-4CRATE-VERIFY ?auto_113232 ?auto_113233 ?auto_113234 ?auto_113235 ?auto_113236 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113270 - SURFACE
      ?auto_113271 - SURFACE
      ?auto_113272 - SURFACE
      ?auto_113273 - SURFACE
      ?auto_113274 - SURFACE
    )
    :vars
    (
      ?auto_113279 - HOIST
      ?auto_113278 - PLACE
      ?auto_113276 - TRUCK
      ?auto_113277 - PLACE
      ?auto_113275 - HOIST
      ?auto_113280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113279 ?auto_113278 ) ( SURFACE-AT ?auto_113273 ?auto_113278 ) ( CLEAR ?auto_113273 ) ( IS-CRATE ?auto_113274 ) ( not ( = ?auto_113273 ?auto_113274 ) ) ( AVAILABLE ?auto_113279 ) ( ON ?auto_113273 ?auto_113272 ) ( not ( = ?auto_113272 ?auto_113273 ) ) ( not ( = ?auto_113272 ?auto_113274 ) ) ( TRUCK-AT ?auto_113276 ?auto_113277 ) ( not ( = ?auto_113277 ?auto_113278 ) ) ( HOIST-AT ?auto_113275 ?auto_113277 ) ( not ( = ?auto_113279 ?auto_113275 ) ) ( AVAILABLE ?auto_113275 ) ( SURFACE-AT ?auto_113274 ?auto_113277 ) ( ON ?auto_113274 ?auto_113280 ) ( CLEAR ?auto_113274 ) ( not ( = ?auto_113273 ?auto_113280 ) ) ( not ( = ?auto_113274 ?auto_113280 ) ) ( not ( = ?auto_113272 ?auto_113280 ) ) ( ON ?auto_113271 ?auto_113270 ) ( ON ?auto_113272 ?auto_113271 ) ( not ( = ?auto_113270 ?auto_113271 ) ) ( not ( = ?auto_113270 ?auto_113272 ) ) ( not ( = ?auto_113270 ?auto_113273 ) ) ( not ( = ?auto_113270 ?auto_113274 ) ) ( not ( = ?auto_113270 ?auto_113280 ) ) ( not ( = ?auto_113271 ?auto_113272 ) ) ( not ( = ?auto_113271 ?auto_113273 ) ) ( not ( = ?auto_113271 ?auto_113274 ) ) ( not ( = ?auto_113271 ?auto_113280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113272 ?auto_113273 ?auto_113274 )
      ( MAKE-4CRATE-VERIFY ?auto_113270 ?auto_113271 ?auto_113272 ?auto_113273 ?auto_113274 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113309 - SURFACE
      ?auto_113310 - SURFACE
      ?auto_113311 - SURFACE
      ?auto_113312 - SURFACE
      ?auto_113313 - SURFACE
    )
    :vars
    (
      ?auto_113315 - HOIST
      ?auto_113319 - PLACE
      ?auto_113318 - PLACE
      ?auto_113314 - HOIST
      ?auto_113316 - SURFACE
      ?auto_113317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113315 ?auto_113319 ) ( SURFACE-AT ?auto_113312 ?auto_113319 ) ( CLEAR ?auto_113312 ) ( IS-CRATE ?auto_113313 ) ( not ( = ?auto_113312 ?auto_113313 ) ) ( AVAILABLE ?auto_113315 ) ( ON ?auto_113312 ?auto_113311 ) ( not ( = ?auto_113311 ?auto_113312 ) ) ( not ( = ?auto_113311 ?auto_113313 ) ) ( not ( = ?auto_113318 ?auto_113319 ) ) ( HOIST-AT ?auto_113314 ?auto_113318 ) ( not ( = ?auto_113315 ?auto_113314 ) ) ( AVAILABLE ?auto_113314 ) ( SURFACE-AT ?auto_113313 ?auto_113318 ) ( ON ?auto_113313 ?auto_113316 ) ( CLEAR ?auto_113313 ) ( not ( = ?auto_113312 ?auto_113316 ) ) ( not ( = ?auto_113313 ?auto_113316 ) ) ( not ( = ?auto_113311 ?auto_113316 ) ) ( TRUCK-AT ?auto_113317 ?auto_113319 ) ( ON ?auto_113310 ?auto_113309 ) ( ON ?auto_113311 ?auto_113310 ) ( not ( = ?auto_113309 ?auto_113310 ) ) ( not ( = ?auto_113309 ?auto_113311 ) ) ( not ( = ?auto_113309 ?auto_113312 ) ) ( not ( = ?auto_113309 ?auto_113313 ) ) ( not ( = ?auto_113309 ?auto_113316 ) ) ( not ( = ?auto_113310 ?auto_113311 ) ) ( not ( = ?auto_113310 ?auto_113312 ) ) ( not ( = ?auto_113310 ?auto_113313 ) ) ( not ( = ?auto_113310 ?auto_113316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113311 ?auto_113312 ?auto_113313 )
      ( MAKE-4CRATE-VERIFY ?auto_113309 ?auto_113310 ?auto_113311 ?auto_113312 ?auto_113313 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113348 - SURFACE
      ?auto_113349 - SURFACE
      ?auto_113350 - SURFACE
      ?auto_113351 - SURFACE
      ?auto_113352 - SURFACE
    )
    :vars
    (
      ?auto_113353 - HOIST
      ?auto_113356 - PLACE
      ?auto_113354 - PLACE
      ?auto_113358 - HOIST
      ?auto_113357 - SURFACE
      ?auto_113355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113353 ?auto_113356 ) ( IS-CRATE ?auto_113352 ) ( not ( = ?auto_113351 ?auto_113352 ) ) ( not ( = ?auto_113350 ?auto_113351 ) ) ( not ( = ?auto_113350 ?auto_113352 ) ) ( not ( = ?auto_113354 ?auto_113356 ) ) ( HOIST-AT ?auto_113358 ?auto_113354 ) ( not ( = ?auto_113353 ?auto_113358 ) ) ( AVAILABLE ?auto_113358 ) ( SURFACE-AT ?auto_113352 ?auto_113354 ) ( ON ?auto_113352 ?auto_113357 ) ( CLEAR ?auto_113352 ) ( not ( = ?auto_113351 ?auto_113357 ) ) ( not ( = ?auto_113352 ?auto_113357 ) ) ( not ( = ?auto_113350 ?auto_113357 ) ) ( TRUCK-AT ?auto_113355 ?auto_113356 ) ( SURFACE-AT ?auto_113350 ?auto_113356 ) ( CLEAR ?auto_113350 ) ( LIFTING ?auto_113353 ?auto_113351 ) ( IS-CRATE ?auto_113351 ) ( ON ?auto_113349 ?auto_113348 ) ( ON ?auto_113350 ?auto_113349 ) ( not ( = ?auto_113348 ?auto_113349 ) ) ( not ( = ?auto_113348 ?auto_113350 ) ) ( not ( = ?auto_113348 ?auto_113351 ) ) ( not ( = ?auto_113348 ?auto_113352 ) ) ( not ( = ?auto_113348 ?auto_113357 ) ) ( not ( = ?auto_113349 ?auto_113350 ) ) ( not ( = ?auto_113349 ?auto_113351 ) ) ( not ( = ?auto_113349 ?auto_113352 ) ) ( not ( = ?auto_113349 ?auto_113357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113350 ?auto_113351 ?auto_113352 )
      ( MAKE-4CRATE-VERIFY ?auto_113348 ?auto_113349 ?auto_113350 ?auto_113351 ?auto_113352 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113387 - SURFACE
      ?auto_113388 - SURFACE
      ?auto_113389 - SURFACE
      ?auto_113390 - SURFACE
      ?auto_113391 - SURFACE
    )
    :vars
    (
      ?auto_113394 - HOIST
      ?auto_113397 - PLACE
      ?auto_113393 - PLACE
      ?auto_113396 - HOIST
      ?auto_113392 - SURFACE
      ?auto_113395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113394 ?auto_113397 ) ( IS-CRATE ?auto_113391 ) ( not ( = ?auto_113390 ?auto_113391 ) ) ( not ( = ?auto_113389 ?auto_113390 ) ) ( not ( = ?auto_113389 ?auto_113391 ) ) ( not ( = ?auto_113393 ?auto_113397 ) ) ( HOIST-AT ?auto_113396 ?auto_113393 ) ( not ( = ?auto_113394 ?auto_113396 ) ) ( AVAILABLE ?auto_113396 ) ( SURFACE-AT ?auto_113391 ?auto_113393 ) ( ON ?auto_113391 ?auto_113392 ) ( CLEAR ?auto_113391 ) ( not ( = ?auto_113390 ?auto_113392 ) ) ( not ( = ?auto_113391 ?auto_113392 ) ) ( not ( = ?auto_113389 ?auto_113392 ) ) ( TRUCK-AT ?auto_113395 ?auto_113397 ) ( SURFACE-AT ?auto_113389 ?auto_113397 ) ( CLEAR ?auto_113389 ) ( IS-CRATE ?auto_113390 ) ( AVAILABLE ?auto_113394 ) ( IN ?auto_113390 ?auto_113395 ) ( ON ?auto_113388 ?auto_113387 ) ( ON ?auto_113389 ?auto_113388 ) ( not ( = ?auto_113387 ?auto_113388 ) ) ( not ( = ?auto_113387 ?auto_113389 ) ) ( not ( = ?auto_113387 ?auto_113390 ) ) ( not ( = ?auto_113387 ?auto_113391 ) ) ( not ( = ?auto_113387 ?auto_113392 ) ) ( not ( = ?auto_113388 ?auto_113389 ) ) ( not ( = ?auto_113388 ?auto_113390 ) ) ( not ( = ?auto_113388 ?auto_113391 ) ) ( not ( = ?auto_113388 ?auto_113392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113389 ?auto_113390 ?auto_113391 )
      ( MAKE-4CRATE-VERIFY ?auto_113387 ?auto_113388 ?auto_113389 ?auto_113390 ?auto_113391 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114047 - SURFACE
      ?auto_114048 - SURFACE
      ?auto_114049 - SURFACE
      ?auto_114050 - SURFACE
      ?auto_114051 - SURFACE
      ?auto_114052 - SURFACE
    )
    :vars
    (
      ?auto_114054 - HOIST
      ?auto_114053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114054 ?auto_114053 ) ( SURFACE-AT ?auto_114051 ?auto_114053 ) ( CLEAR ?auto_114051 ) ( LIFTING ?auto_114054 ?auto_114052 ) ( IS-CRATE ?auto_114052 ) ( not ( = ?auto_114051 ?auto_114052 ) ) ( ON ?auto_114048 ?auto_114047 ) ( ON ?auto_114049 ?auto_114048 ) ( ON ?auto_114050 ?auto_114049 ) ( ON ?auto_114051 ?auto_114050 ) ( not ( = ?auto_114047 ?auto_114048 ) ) ( not ( = ?auto_114047 ?auto_114049 ) ) ( not ( = ?auto_114047 ?auto_114050 ) ) ( not ( = ?auto_114047 ?auto_114051 ) ) ( not ( = ?auto_114047 ?auto_114052 ) ) ( not ( = ?auto_114048 ?auto_114049 ) ) ( not ( = ?auto_114048 ?auto_114050 ) ) ( not ( = ?auto_114048 ?auto_114051 ) ) ( not ( = ?auto_114048 ?auto_114052 ) ) ( not ( = ?auto_114049 ?auto_114050 ) ) ( not ( = ?auto_114049 ?auto_114051 ) ) ( not ( = ?auto_114049 ?auto_114052 ) ) ( not ( = ?auto_114050 ?auto_114051 ) ) ( not ( = ?auto_114050 ?auto_114052 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_114051 ?auto_114052 )
      ( MAKE-5CRATE-VERIFY ?auto_114047 ?auto_114048 ?auto_114049 ?auto_114050 ?auto_114051 ?auto_114052 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114081 - SURFACE
      ?auto_114082 - SURFACE
      ?auto_114083 - SURFACE
      ?auto_114084 - SURFACE
      ?auto_114085 - SURFACE
      ?auto_114086 - SURFACE
    )
    :vars
    (
      ?auto_114089 - HOIST
      ?auto_114087 - PLACE
      ?auto_114088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114089 ?auto_114087 ) ( SURFACE-AT ?auto_114085 ?auto_114087 ) ( CLEAR ?auto_114085 ) ( IS-CRATE ?auto_114086 ) ( not ( = ?auto_114085 ?auto_114086 ) ) ( TRUCK-AT ?auto_114088 ?auto_114087 ) ( AVAILABLE ?auto_114089 ) ( IN ?auto_114086 ?auto_114088 ) ( ON ?auto_114085 ?auto_114084 ) ( not ( = ?auto_114084 ?auto_114085 ) ) ( not ( = ?auto_114084 ?auto_114086 ) ) ( ON ?auto_114082 ?auto_114081 ) ( ON ?auto_114083 ?auto_114082 ) ( ON ?auto_114084 ?auto_114083 ) ( not ( = ?auto_114081 ?auto_114082 ) ) ( not ( = ?auto_114081 ?auto_114083 ) ) ( not ( = ?auto_114081 ?auto_114084 ) ) ( not ( = ?auto_114081 ?auto_114085 ) ) ( not ( = ?auto_114081 ?auto_114086 ) ) ( not ( = ?auto_114082 ?auto_114083 ) ) ( not ( = ?auto_114082 ?auto_114084 ) ) ( not ( = ?auto_114082 ?auto_114085 ) ) ( not ( = ?auto_114082 ?auto_114086 ) ) ( not ( = ?auto_114083 ?auto_114084 ) ) ( not ( = ?auto_114083 ?auto_114085 ) ) ( not ( = ?auto_114083 ?auto_114086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114084 ?auto_114085 ?auto_114086 )
      ( MAKE-5CRATE-VERIFY ?auto_114081 ?auto_114082 ?auto_114083 ?auto_114084 ?auto_114085 ?auto_114086 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114121 - SURFACE
      ?auto_114122 - SURFACE
      ?auto_114123 - SURFACE
      ?auto_114124 - SURFACE
      ?auto_114125 - SURFACE
      ?auto_114126 - SURFACE
    )
    :vars
    (
      ?auto_114130 - HOIST
      ?auto_114127 - PLACE
      ?auto_114128 - TRUCK
      ?auto_114129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114130 ?auto_114127 ) ( SURFACE-AT ?auto_114125 ?auto_114127 ) ( CLEAR ?auto_114125 ) ( IS-CRATE ?auto_114126 ) ( not ( = ?auto_114125 ?auto_114126 ) ) ( AVAILABLE ?auto_114130 ) ( IN ?auto_114126 ?auto_114128 ) ( ON ?auto_114125 ?auto_114124 ) ( not ( = ?auto_114124 ?auto_114125 ) ) ( not ( = ?auto_114124 ?auto_114126 ) ) ( TRUCK-AT ?auto_114128 ?auto_114129 ) ( not ( = ?auto_114129 ?auto_114127 ) ) ( ON ?auto_114122 ?auto_114121 ) ( ON ?auto_114123 ?auto_114122 ) ( ON ?auto_114124 ?auto_114123 ) ( not ( = ?auto_114121 ?auto_114122 ) ) ( not ( = ?auto_114121 ?auto_114123 ) ) ( not ( = ?auto_114121 ?auto_114124 ) ) ( not ( = ?auto_114121 ?auto_114125 ) ) ( not ( = ?auto_114121 ?auto_114126 ) ) ( not ( = ?auto_114122 ?auto_114123 ) ) ( not ( = ?auto_114122 ?auto_114124 ) ) ( not ( = ?auto_114122 ?auto_114125 ) ) ( not ( = ?auto_114122 ?auto_114126 ) ) ( not ( = ?auto_114123 ?auto_114124 ) ) ( not ( = ?auto_114123 ?auto_114125 ) ) ( not ( = ?auto_114123 ?auto_114126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114124 ?auto_114125 ?auto_114126 )
      ( MAKE-5CRATE-VERIFY ?auto_114121 ?auto_114122 ?auto_114123 ?auto_114124 ?auto_114125 ?auto_114126 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114166 - SURFACE
      ?auto_114167 - SURFACE
      ?auto_114168 - SURFACE
      ?auto_114169 - SURFACE
      ?auto_114170 - SURFACE
      ?auto_114171 - SURFACE
    )
    :vars
    (
      ?auto_114176 - HOIST
      ?auto_114173 - PLACE
      ?auto_114174 - TRUCK
      ?auto_114172 - PLACE
      ?auto_114175 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_114176 ?auto_114173 ) ( SURFACE-AT ?auto_114170 ?auto_114173 ) ( CLEAR ?auto_114170 ) ( IS-CRATE ?auto_114171 ) ( not ( = ?auto_114170 ?auto_114171 ) ) ( AVAILABLE ?auto_114176 ) ( ON ?auto_114170 ?auto_114169 ) ( not ( = ?auto_114169 ?auto_114170 ) ) ( not ( = ?auto_114169 ?auto_114171 ) ) ( TRUCK-AT ?auto_114174 ?auto_114172 ) ( not ( = ?auto_114172 ?auto_114173 ) ) ( HOIST-AT ?auto_114175 ?auto_114172 ) ( LIFTING ?auto_114175 ?auto_114171 ) ( not ( = ?auto_114176 ?auto_114175 ) ) ( ON ?auto_114167 ?auto_114166 ) ( ON ?auto_114168 ?auto_114167 ) ( ON ?auto_114169 ?auto_114168 ) ( not ( = ?auto_114166 ?auto_114167 ) ) ( not ( = ?auto_114166 ?auto_114168 ) ) ( not ( = ?auto_114166 ?auto_114169 ) ) ( not ( = ?auto_114166 ?auto_114170 ) ) ( not ( = ?auto_114166 ?auto_114171 ) ) ( not ( = ?auto_114167 ?auto_114168 ) ) ( not ( = ?auto_114167 ?auto_114169 ) ) ( not ( = ?auto_114167 ?auto_114170 ) ) ( not ( = ?auto_114167 ?auto_114171 ) ) ( not ( = ?auto_114168 ?auto_114169 ) ) ( not ( = ?auto_114168 ?auto_114170 ) ) ( not ( = ?auto_114168 ?auto_114171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114169 ?auto_114170 ?auto_114171 )
      ( MAKE-5CRATE-VERIFY ?auto_114166 ?auto_114167 ?auto_114168 ?auto_114169 ?auto_114170 ?auto_114171 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114216 - SURFACE
      ?auto_114217 - SURFACE
      ?auto_114218 - SURFACE
      ?auto_114219 - SURFACE
      ?auto_114220 - SURFACE
      ?auto_114221 - SURFACE
    )
    :vars
    (
      ?auto_114227 - HOIST
      ?auto_114226 - PLACE
      ?auto_114222 - TRUCK
      ?auto_114225 - PLACE
      ?auto_114223 - HOIST
      ?auto_114224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114227 ?auto_114226 ) ( SURFACE-AT ?auto_114220 ?auto_114226 ) ( CLEAR ?auto_114220 ) ( IS-CRATE ?auto_114221 ) ( not ( = ?auto_114220 ?auto_114221 ) ) ( AVAILABLE ?auto_114227 ) ( ON ?auto_114220 ?auto_114219 ) ( not ( = ?auto_114219 ?auto_114220 ) ) ( not ( = ?auto_114219 ?auto_114221 ) ) ( TRUCK-AT ?auto_114222 ?auto_114225 ) ( not ( = ?auto_114225 ?auto_114226 ) ) ( HOIST-AT ?auto_114223 ?auto_114225 ) ( not ( = ?auto_114227 ?auto_114223 ) ) ( AVAILABLE ?auto_114223 ) ( SURFACE-AT ?auto_114221 ?auto_114225 ) ( ON ?auto_114221 ?auto_114224 ) ( CLEAR ?auto_114221 ) ( not ( = ?auto_114220 ?auto_114224 ) ) ( not ( = ?auto_114221 ?auto_114224 ) ) ( not ( = ?auto_114219 ?auto_114224 ) ) ( ON ?auto_114217 ?auto_114216 ) ( ON ?auto_114218 ?auto_114217 ) ( ON ?auto_114219 ?auto_114218 ) ( not ( = ?auto_114216 ?auto_114217 ) ) ( not ( = ?auto_114216 ?auto_114218 ) ) ( not ( = ?auto_114216 ?auto_114219 ) ) ( not ( = ?auto_114216 ?auto_114220 ) ) ( not ( = ?auto_114216 ?auto_114221 ) ) ( not ( = ?auto_114216 ?auto_114224 ) ) ( not ( = ?auto_114217 ?auto_114218 ) ) ( not ( = ?auto_114217 ?auto_114219 ) ) ( not ( = ?auto_114217 ?auto_114220 ) ) ( not ( = ?auto_114217 ?auto_114221 ) ) ( not ( = ?auto_114217 ?auto_114224 ) ) ( not ( = ?auto_114218 ?auto_114219 ) ) ( not ( = ?auto_114218 ?auto_114220 ) ) ( not ( = ?auto_114218 ?auto_114221 ) ) ( not ( = ?auto_114218 ?auto_114224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114219 ?auto_114220 ?auto_114221 )
      ( MAKE-5CRATE-VERIFY ?auto_114216 ?auto_114217 ?auto_114218 ?auto_114219 ?auto_114220 ?auto_114221 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114267 - SURFACE
      ?auto_114268 - SURFACE
      ?auto_114269 - SURFACE
      ?auto_114270 - SURFACE
      ?auto_114271 - SURFACE
      ?auto_114272 - SURFACE
    )
    :vars
    (
      ?auto_114274 - HOIST
      ?auto_114277 - PLACE
      ?auto_114278 - PLACE
      ?auto_114275 - HOIST
      ?auto_114273 - SURFACE
      ?auto_114276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114274 ?auto_114277 ) ( SURFACE-AT ?auto_114271 ?auto_114277 ) ( CLEAR ?auto_114271 ) ( IS-CRATE ?auto_114272 ) ( not ( = ?auto_114271 ?auto_114272 ) ) ( AVAILABLE ?auto_114274 ) ( ON ?auto_114271 ?auto_114270 ) ( not ( = ?auto_114270 ?auto_114271 ) ) ( not ( = ?auto_114270 ?auto_114272 ) ) ( not ( = ?auto_114278 ?auto_114277 ) ) ( HOIST-AT ?auto_114275 ?auto_114278 ) ( not ( = ?auto_114274 ?auto_114275 ) ) ( AVAILABLE ?auto_114275 ) ( SURFACE-AT ?auto_114272 ?auto_114278 ) ( ON ?auto_114272 ?auto_114273 ) ( CLEAR ?auto_114272 ) ( not ( = ?auto_114271 ?auto_114273 ) ) ( not ( = ?auto_114272 ?auto_114273 ) ) ( not ( = ?auto_114270 ?auto_114273 ) ) ( TRUCK-AT ?auto_114276 ?auto_114277 ) ( ON ?auto_114268 ?auto_114267 ) ( ON ?auto_114269 ?auto_114268 ) ( ON ?auto_114270 ?auto_114269 ) ( not ( = ?auto_114267 ?auto_114268 ) ) ( not ( = ?auto_114267 ?auto_114269 ) ) ( not ( = ?auto_114267 ?auto_114270 ) ) ( not ( = ?auto_114267 ?auto_114271 ) ) ( not ( = ?auto_114267 ?auto_114272 ) ) ( not ( = ?auto_114267 ?auto_114273 ) ) ( not ( = ?auto_114268 ?auto_114269 ) ) ( not ( = ?auto_114268 ?auto_114270 ) ) ( not ( = ?auto_114268 ?auto_114271 ) ) ( not ( = ?auto_114268 ?auto_114272 ) ) ( not ( = ?auto_114268 ?auto_114273 ) ) ( not ( = ?auto_114269 ?auto_114270 ) ) ( not ( = ?auto_114269 ?auto_114271 ) ) ( not ( = ?auto_114269 ?auto_114272 ) ) ( not ( = ?auto_114269 ?auto_114273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114270 ?auto_114271 ?auto_114272 )
      ( MAKE-5CRATE-VERIFY ?auto_114267 ?auto_114268 ?auto_114269 ?auto_114270 ?auto_114271 ?auto_114272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114318 - SURFACE
      ?auto_114319 - SURFACE
      ?auto_114320 - SURFACE
      ?auto_114321 - SURFACE
      ?auto_114322 - SURFACE
      ?auto_114323 - SURFACE
    )
    :vars
    (
      ?auto_114326 - HOIST
      ?auto_114327 - PLACE
      ?auto_114325 - PLACE
      ?auto_114324 - HOIST
      ?auto_114328 - SURFACE
      ?auto_114329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114326 ?auto_114327 ) ( IS-CRATE ?auto_114323 ) ( not ( = ?auto_114322 ?auto_114323 ) ) ( not ( = ?auto_114321 ?auto_114322 ) ) ( not ( = ?auto_114321 ?auto_114323 ) ) ( not ( = ?auto_114325 ?auto_114327 ) ) ( HOIST-AT ?auto_114324 ?auto_114325 ) ( not ( = ?auto_114326 ?auto_114324 ) ) ( AVAILABLE ?auto_114324 ) ( SURFACE-AT ?auto_114323 ?auto_114325 ) ( ON ?auto_114323 ?auto_114328 ) ( CLEAR ?auto_114323 ) ( not ( = ?auto_114322 ?auto_114328 ) ) ( not ( = ?auto_114323 ?auto_114328 ) ) ( not ( = ?auto_114321 ?auto_114328 ) ) ( TRUCK-AT ?auto_114329 ?auto_114327 ) ( SURFACE-AT ?auto_114321 ?auto_114327 ) ( CLEAR ?auto_114321 ) ( LIFTING ?auto_114326 ?auto_114322 ) ( IS-CRATE ?auto_114322 ) ( ON ?auto_114319 ?auto_114318 ) ( ON ?auto_114320 ?auto_114319 ) ( ON ?auto_114321 ?auto_114320 ) ( not ( = ?auto_114318 ?auto_114319 ) ) ( not ( = ?auto_114318 ?auto_114320 ) ) ( not ( = ?auto_114318 ?auto_114321 ) ) ( not ( = ?auto_114318 ?auto_114322 ) ) ( not ( = ?auto_114318 ?auto_114323 ) ) ( not ( = ?auto_114318 ?auto_114328 ) ) ( not ( = ?auto_114319 ?auto_114320 ) ) ( not ( = ?auto_114319 ?auto_114321 ) ) ( not ( = ?auto_114319 ?auto_114322 ) ) ( not ( = ?auto_114319 ?auto_114323 ) ) ( not ( = ?auto_114319 ?auto_114328 ) ) ( not ( = ?auto_114320 ?auto_114321 ) ) ( not ( = ?auto_114320 ?auto_114322 ) ) ( not ( = ?auto_114320 ?auto_114323 ) ) ( not ( = ?auto_114320 ?auto_114328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114321 ?auto_114322 ?auto_114323 )
      ( MAKE-5CRATE-VERIFY ?auto_114318 ?auto_114319 ?auto_114320 ?auto_114321 ?auto_114322 ?auto_114323 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114369 - SURFACE
      ?auto_114370 - SURFACE
      ?auto_114371 - SURFACE
      ?auto_114372 - SURFACE
      ?auto_114373 - SURFACE
      ?auto_114374 - SURFACE
    )
    :vars
    (
      ?auto_114375 - HOIST
      ?auto_114378 - PLACE
      ?auto_114380 - PLACE
      ?auto_114379 - HOIST
      ?auto_114376 - SURFACE
      ?auto_114377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114375 ?auto_114378 ) ( IS-CRATE ?auto_114374 ) ( not ( = ?auto_114373 ?auto_114374 ) ) ( not ( = ?auto_114372 ?auto_114373 ) ) ( not ( = ?auto_114372 ?auto_114374 ) ) ( not ( = ?auto_114380 ?auto_114378 ) ) ( HOIST-AT ?auto_114379 ?auto_114380 ) ( not ( = ?auto_114375 ?auto_114379 ) ) ( AVAILABLE ?auto_114379 ) ( SURFACE-AT ?auto_114374 ?auto_114380 ) ( ON ?auto_114374 ?auto_114376 ) ( CLEAR ?auto_114374 ) ( not ( = ?auto_114373 ?auto_114376 ) ) ( not ( = ?auto_114374 ?auto_114376 ) ) ( not ( = ?auto_114372 ?auto_114376 ) ) ( TRUCK-AT ?auto_114377 ?auto_114378 ) ( SURFACE-AT ?auto_114372 ?auto_114378 ) ( CLEAR ?auto_114372 ) ( IS-CRATE ?auto_114373 ) ( AVAILABLE ?auto_114375 ) ( IN ?auto_114373 ?auto_114377 ) ( ON ?auto_114370 ?auto_114369 ) ( ON ?auto_114371 ?auto_114370 ) ( ON ?auto_114372 ?auto_114371 ) ( not ( = ?auto_114369 ?auto_114370 ) ) ( not ( = ?auto_114369 ?auto_114371 ) ) ( not ( = ?auto_114369 ?auto_114372 ) ) ( not ( = ?auto_114369 ?auto_114373 ) ) ( not ( = ?auto_114369 ?auto_114374 ) ) ( not ( = ?auto_114369 ?auto_114376 ) ) ( not ( = ?auto_114370 ?auto_114371 ) ) ( not ( = ?auto_114370 ?auto_114372 ) ) ( not ( = ?auto_114370 ?auto_114373 ) ) ( not ( = ?auto_114370 ?auto_114374 ) ) ( not ( = ?auto_114370 ?auto_114376 ) ) ( not ( = ?auto_114371 ?auto_114372 ) ) ( not ( = ?auto_114371 ?auto_114373 ) ) ( not ( = ?auto_114371 ?auto_114374 ) ) ( not ( = ?auto_114371 ?auto_114376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114372 ?auto_114373 ?auto_114374 )
      ( MAKE-5CRATE-VERIFY ?auto_114369 ?auto_114370 ?auto_114371 ?auto_114372 ?auto_114373 ?auto_114374 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115578 - SURFACE
      ?auto_115579 - SURFACE
      ?auto_115580 - SURFACE
      ?auto_115581 - SURFACE
      ?auto_115582 - SURFACE
      ?auto_115583 - SURFACE
      ?auto_115584 - SURFACE
    )
    :vars
    (
      ?auto_115586 - HOIST
      ?auto_115585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115586 ?auto_115585 ) ( SURFACE-AT ?auto_115583 ?auto_115585 ) ( CLEAR ?auto_115583 ) ( LIFTING ?auto_115586 ?auto_115584 ) ( IS-CRATE ?auto_115584 ) ( not ( = ?auto_115583 ?auto_115584 ) ) ( ON ?auto_115579 ?auto_115578 ) ( ON ?auto_115580 ?auto_115579 ) ( ON ?auto_115581 ?auto_115580 ) ( ON ?auto_115582 ?auto_115581 ) ( ON ?auto_115583 ?auto_115582 ) ( not ( = ?auto_115578 ?auto_115579 ) ) ( not ( = ?auto_115578 ?auto_115580 ) ) ( not ( = ?auto_115578 ?auto_115581 ) ) ( not ( = ?auto_115578 ?auto_115582 ) ) ( not ( = ?auto_115578 ?auto_115583 ) ) ( not ( = ?auto_115578 ?auto_115584 ) ) ( not ( = ?auto_115579 ?auto_115580 ) ) ( not ( = ?auto_115579 ?auto_115581 ) ) ( not ( = ?auto_115579 ?auto_115582 ) ) ( not ( = ?auto_115579 ?auto_115583 ) ) ( not ( = ?auto_115579 ?auto_115584 ) ) ( not ( = ?auto_115580 ?auto_115581 ) ) ( not ( = ?auto_115580 ?auto_115582 ) ) ( not ( = ?auto_115580 ?auto_115583 ) ) ( not ( = ?auto_115580 ?auto_115584 ) ) ( not ( = ?auto_115581 ?auto_115582 ) ) ( not ( = ?auto_115581 ?auto_115583 ) ) ( not ( = ?auto_115581 ?auto_115584 ) ) ( not ( = ?auto_115582 ?auto_115583 ) ) ( not ( = ?auto_115582 ?auto_115584 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_115583 ?auto_115584 )
      ( MAKE-6CRATE-VERIFY ?auto_115578 ?auto_115579 ?auto_115580 ?auto_115581 ?auto_115582 ?auto_115583 ?auto_115584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115622 - SURFACE
      ?auto_115623 - SURFACE
      ?auto_115624 - SURFACE
      ?auto_115625 - SURFACE
      ?auto_115626 - SURFACE
      ?auto_115627 - SURFACE
      ?auto_115628 - SURFACE
    )
    :vars
    (
      ?auto_115630 - HOIST
      ?auto_115629 - PLACE
      ?auto_115631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115630 ?auto_115629 ) ( SURFACE-AT ?auto_115627 ?auto_115629 ) ( CLEAR ?auto_115627 ) ( IS-CRATE ?auto_115628 ) ( not ( = ?auto_115627 ?auto_115628 ) ) ( TRUCK-AT ?auto_115631 ?auto_115629 ) ( AVAILABLE ?auto_115630 ) ( IN ?auto_115628 ?auto_115631 ) ( ON ?auto_115627 ?auto_115626 ) ( not ( = ?auto_115626 ?auto_115627 ) ) ( not ( = ?auto_115626 ?auto_115628 ) ) ( ON ?auto_115623 ?auto_115622 ) ( ON ?auto_115624 ?auto_115623 ) ( ON ?auto_115625 ?auto_115624 ) ( ON ?auto_115626 ?auto_115625 ) ( not ( = ?auto_115622 ?auto_115623 ) ) ( not ( = ?auto_115622 ?auto_115624 ) ) ( not ( = ?auto_115622 ?auto_115625 ) ) ( not ( = ?auto_115622 ?auto_115626 ) ) ( not ( = ?auto_115622 ?auto_115627 ) ) ( not ( = ?auto_115622 ?auto_115628 ) ) ( not ( = ?auto_115623 ?auto_115624 ) ) ( not ( = ?auto_115623 ?auto_115625 ) ) ( not ( = ?auto_115623 ?auto_115626 ) ) ( not ( = ?auto_115623 ?auto_115627 ) ) ( not ( = ?auto_115623 ?auto_115628 ) ) ( not ( = ?auto_115624 ?auto_115625 ) ) ( not ( = ?auto_115624 ?auto_115626 ) ) ( not ( = ?auto_115624 ?auto_115627 ) ) ( not ( = ?auto_115624 ?auto_115628 ) ) ( not ( = ?auto_115625 ?auto_115626 ) ) ( not ( = ?auto_115625 ?auto_115627 ) ) ( not ( = ?auto_115625 ?auto_115628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115626 ?auto_115627 ?auto_115628 )
      ( MAKE-6CRATE-VERIFY ?auto_115622 ?auto_115623 ?auto_115624 ?auto_115625 ?auto_115626 ?auto_115627 ?auto_115628 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115673 - SURFACE
      ?auto_115674 - SURFACE
      ?auto_115675 - SURFACE
      ?auto_115676 - SURFACE
      ?auto_115677 - SURFACE
      ?auto_115678 - SURFACE
      ?auto_115679 - SURFACE
    )
    :vars
    (
      ?auto_115682 - HOIST
      ?auto_115680 - PLACE
      ?auto_115683 - TRUCK
      ?auto_115681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115682 ?auto_115680 ) ( SURFACE-AT ?auto_115678 ?auto_115680 ) ( CLEAR ?auto_115678 ) ( IS-CRATE ?auto_115679 ) ( not ( = ?auto_115678 ?auto_115679 ) ) ( AVAILABLE ?auto_115682 ) ( IN ?auto_115679 ?auto_115683 ) ( ON ?auto_115678 ?auto_115677 ) ( not ( = ?auto_115677 ?auto_115678 ) ) ( not ( = ?auto_115677 ?auto_115679 ) ) ( TRUCK-AT ?auto_115683 ?auto_115681 ) ( not ( = ?auto_115681 ?auto_115680 ) ) ( ON ?auto_115674 ?auto_115673 ) ( ON ?auto_115675 ?auto_115674 ) ( ON ?auto_115676 ?auto_115675 ) ( ON ?auto_115677 ?auto_115676 ) ( not ( = ?auto_115673 ?auto_115674 ) ) ( not ( = ?auto_115673 ?auto_115675 ) ) ( not ( = ?auto_115673 ?auto_115676 ) ) ( not ( = ?auto_115673 ?auto_115677 ) ) ( not ( = ?auto_115673 ?auto_115678 ) ) ( not ( = ?auto_115673 ?auto_115679 ) ) ( not ( = ?auto_115674 ?auto_115675 ) ) ( not ( = ?auto_115674 ?auto_115676 ) ) ( not ( = ?auto_115674 ?auto_115677 ) ) ( not ( = ?auto_115674 ?auto_115678 ) ) ( not ( = ?auto_115674 ?auto_115679 ) ) ( not ( = ?auto_115675 ?auto_115676 ) ) ( not ( = ?auto_115675 ?auto_115677 ) ) ( not ( = ?auto_115675 ?auto_115678 ) ) ( not ( = ?auto_115675 ?auto_115679 ) ) ( not ( = ?auto_115676 ?auto_115677 ) ) ( not ( = ?auto_115676 ?auto_115678 ) ) ( not ( = ?auto_115676 ?auto_115679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115677 ?auto_115678 ?auto_115679 )
      ( MAKE-6CRATE-VERIFY ?auto_115673 ?auto_115674 ?auto_115675 ?auto_115676 ?auto_115677 ?auto_115678 ?auto_115679 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115730 - SURFACE
      ?auto_115731 - SURFACE
      ?auto_115732 - SURFACE
      ?auto_115733 - SURFACE
      ?auto_115734 - SURFACE
      ?auto_115735 - SURFACE
      ?auto_115736 - SURFACE
    )
    :vars
    (
      ?auto_115741 - HOIST
      ?auto_115738 - PLACE
      ?auto_115737 - TRUCK
      ?auto_115739 - PLACE
      ?auto_115740 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_115741 ?auto_115738 ) ( SURFACE-AT ?auto_115735 ?auto_115738 ) ( CLEAR ?auto_115735 ) ( IS-CRATE ?auto_115736 ) ( not ( = ?auto_115735 ?auto_115736 ) ) ( AVAILABLE ?auto_115741 ) ( ON ?auto_115735 ?auto_115734 ) ( not ( = ?auto_115734 ?auto_115735 ) ) ( not ( = ?auto_115734 ?auto_115736 ) ) ( TRUCK-AT ?auto_115737 ?auto_115739 ) ( not ( = ?auto_115739 ?auto_115738 ) ) ( HOIST-AT ?auto_115740 ?auto_115739 ) ( LIFTING ?auto_115740 ?auto_115736 ) ( not ( = ?auto_115741 ?auto_115740 ) ) ( ON ?auto_115731 ?auto_115730 ) ( ON ?auto_115732 ?auto_115731 ) ( ON ?auto_115733 ?auto_115732 ) ( ON ?auto_115734 ?auto_115733 ) ( not ( = ?auto_115730 ?auto_115731 ) ) ( not ( = ?auto_115730 ?auto_115732 ) ) ( not ( = ?auto_115730 ?auto_115733 ) ) ( not ( = ?auto_115730 ?auto_115734 ) ) ( not ( = ?auto_115730 ?auto_115735 ) ) ( not ( = ?auto_115730 ?auto_115736 ) ) ( not ( = ?auto_115731 ?auto_115732 ) ) ( not ( = ?auto_115731 ?auto_115733 ) ) ( not ( = ?auto_115731 ?auto_115734 ) ) ( not ( = ?auto_115731 ?auto_115735 ) ) ( not ( = ?auto_115731 ?auto_115736 ) ) ( not ( = ?auto_115732 ?auto_115733 ) ) ( not ( = ?auto_115732 ?auto_115734 ) ) ( not ( = ?auto_115732 ?auto_115735 ) ) ( not ( = ?auto_115732 ?auto_115736 ) ) ( not ( = ?auto_115733 ?auto_115734 ) ) ( not ( = ?auto_115733 ?auto_115735 ) ) ( not ( = ?auto_115733 ?auto_115736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115734 ?auto_115735 ?auto_115736 )
      ( MAKE-6CRATE-VERIFY ?auto_115730 ?auto_115731 ?auto_115732 ?auto_115733 ?auto_115734 ?auto_115735 ?auto_115736 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115793 - SURFACE
      ?auto_115794 - SURFACE
      ?auto_115795 - SURFACE
      ?auto_115796 - SURFACE
      ?auto_115797 - SURFACE
      ?auto_115798 - SURFACE
      ?auto_115799 - SURFACE
    )
    :vars
    (
      ?auto_115800 - HOIST
      ?auto_115801 - PLACE
      ?auto_115803 - TRUCK
      ?auto_115802 - PLACE
      ?auto_115805 - HOIST
      ?auto_115804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115800 ?auto_115801 ) ( SURFACE-AT ?auto_115798 ?auto_115801 ) ( CLEAR ?auto_115798 ) ( IS-CRATE ?auto_115799 ) ( not ( = ?auto_115798 ?auto_115799 ) ) ( AVAILABLE ?auto_115800 ) ( ON ?auto_115798 ?auto_115797 ) ( not ( = ?auto_115797 ?auto_115798 ) ) ( not ( = ?auto_115797 ?auto_115799 ) ) ( TRUCK-AT ?auto_115803 ?auto_115802 ) ( not ( = ?auto_115802 ?auto_115801 ) ) ( HOIST-AT ?auto_115805 ?auto_115802 ) ( not ( = ?auto_115800 ?auto_115805 ) ) ( AVAILABLE ?auto_115805 ) ( SURFACE-AT ?auto_115799 ?auto_115802 ) ( ON ?auto_115799 ?auto_115804 ) ( CLEAR ?auto_115799 ) ( not ( = ?auto_115798 ?auto_115804 ) ) ( not ( = ?auto_115799 ?auto_115804 ) ) ( not ( = ?auto_115797 ?auto_115804 ) ) ( ON ?auto_115794 ?auto_115793 ) ( ON ?auto_115795 ?auto_115794 ) ( ON ?auto_115796 ?auto_115795 ) ( ON ?auto_115797 ?auto_115796 ) ( not ( = ?auto_115793 ?auto_115794 ) ) ( not ( = ?auto_115793 ?auto_115795 ) ) ( not ( = ?auto_115793 ?auto_115796 ) ) ( not ( = ?auto_115793 ?auto_115797 ) ) ( not ( = ?auto_115793 ?auto_115798 ) ) ( not ( = ?auto_115793 ?auto_115799 ) ) ( not ( = ?auto_115793 ?auto_115804 ) ) ( not ( = ?auto_115794 ?auto_115795 ) ) ( not ( = ?auto_115794 ?auto_115796 ) ) ( not ( = ?auto_115794 ?auto_115797 ) ) ( not ( = ?auto_115794 ?auto_115798 ) ) ( not ( = ?auto_115794 ?auto_115799 ) ) ( not ( = ?auto_115794 ?auto_115804 ) ) ( not ( = ?auto_115795 ?auto_115796 ) ) ( not ( = ?auto_115795 ?auto_115797 ) ) ( not ( = ?auto_115795 ?auto_115798 ) ) ( not ( = ?auto_115795 ?auto_115799 ) ) ( not ( = ?auto_115795 ?auto_115804 ) ) ( not ( = ?auto_115796 ?auto_115797 ) ) ( not ( = ?auto_115796 ?auto_115798 ) ) ( not ( = ?auto_115796 ?auto_115799 ) ) ( not ( = ?auto_115796 ?auto_115804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115797 ?auto_115798 ?auto_115799 )
      ( MAKE-6CRATE-VERIFY ?auto_115793 ?auto_115794 ?auto_115795 ?auto_115796 ?auto_115797 ?auto_115798 ?auto_115799 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115857 - SURFACE
      ?auto_115858 - SURFACE
      ?auto_115859 - SURFACE
      ?auto_115860 - SURFACE
      ?auto_115861 - SURFACE
      ?auto_115862 - SURFACE
      ?auto_115863 - SURFACE
    )
    :vars
    (
      ?auto_115865 - HOIST
      ?auto_115868 - PLACE
      ?auto_115869 - PLACE
      ?auto_115864 - HOIST
      ?auto_115867 - SURFACE
      ?auto_115866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115865 ?auto_115868 ) ( SURFACE-AT ?auto_115862 ?auto_115868 ) ( CLEAR ?auto_115862 ) ( IS-CRATE ?auto_115863 ) ( not ( = ?auto_115862 ?auto_115863 ) ) ( AVAILABLE ?auto_115865 ) ( ON ?auto_115862 ?auto_115861 ) ( not ( = ?auto_115861 ?auto_115862 ) ) ( not ( = ?auto_115861 ?auto_115863 ) ) ( not ( = ?auto_115869 ?auto_115868 ) ) ( HOIST-AT ?auto_115864 ?auto_115869 ) ( not ( = ?auto_115865 ?auto_115864 ) ) ( AVAILABLE ?auto_115864 ) ( SURFACE-AT ?auto_115863 ?auto_115869 ) ( ON ?auto_115863 ?auto_115867 ) ( CLEAR ?auto_115863 ) ( not ( = ?auto_115862 ?auto_115867 ) ) ( not ( = ?auto_115863 ?auto_115867 ) ) ( not ( = ?auto_115861 ?auto_115867 ) ) ( TRUCK-AT ?auto_115866 ?auto_115868 ) ( ON ?auto_115858 ?auto_115857 ) ( ON ?auto_115859 ?auto_115858 ) ( ON ?auto_115860 ?auto_115859 ) ( ON ?auto_115861 ?auto_115860 ) ( not ( = ?auto_115857 ?auto_115858 ) ) ( not ( = ?auto_115857 ?auto_115859 ) ) ( not ( = ?auto_115857 ?auto_115860 ) ) ( not ( = ?auto_115857 ?auto_115861 ) ) ( not ( = ?auto_115857 ?auto_115862 ) ) ( not ( = ?auto_115857 ?auto_115863 ) ) ( not ( = ?auto_115857 ?auto_115867 ) ) ( not ( = ?auto_115858 ?auto_115859 ) ) ( not ( = ?auto_115858 ?auto_115860 ) ) ( not ( = ?auto_115858 ?auto_115861 ) ) ( not ( = ?auto_115858 ?auto_115862 ) ) ( not ( = ?auto_115858 ?auto_115863 ) ) ( not ( = ?auto_115858 ?auto_115867 ) ) ( not ( = ?auto_115859 ?auto_115860 ) ) ( not ( = ?auto_115859 ?auto_115861 ) ) ( not ( = ?auto_115859 ?auto_115862 ) ) ( not ( = ?auto_115859 ?auto_115863 ) ) ( not ( = ?auto_115859 ?auto_115867 ) ) ( not ( = ?auto_115860 ?auto_115861 ) ) ( not ( = ?auto_115860 ?auto_115862 ) ) ( not ( = ?auto_115860 ?auto_115863 ) ) ( not ( = ?auto_115860 ?auto_115867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115861 ?auto_115862 ?auto_115863 )
      ( MAKE-6CRATE-VERIFY ?auto_115857 ?auto_115858 ?auto_115859 ?auto_115860 ?auto_115861 ?auto_115862 ?auto_115863 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115921 - SURFACE
      ?auto_115922 - SURFACE
      ?auto_115923 - SURFACE
      ?auto_115924 - SURFACE
      ?auto_115925 - SURFACE
      ?auto_115926 - SURFACE
      ?auto_115927 - SURFACE
    )
    :vars
    (
      ?auto_115929 - HOIST
      ?auto_115932 - PLACE
      ?auto_115931 - PLACE
      ?auto_115930 - HOIST
      ?auto_115933 - SURFACE
      ?auto_115928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115929 ?auto_115932 ) ( IS-CRATE ?auto_115927 ) ( not ( = ?auto_115926 ?auto_115927 ) ) ( not ( = ?auto_115925 ?auto_115926 ) ) ( not ( = ?auto_115925 ?auto_115927 ) ) ( not ( = ?auto_115931 ?auto_115932 ) ) ( HOIST-AT ?auto_115930 ?auto_115931 ) ( not ( = ?auto_115929 ?auto_115930 ) ) ( AVAILABLE ?auto_115930 ) ( SURFACE-AT ?auto_115927 ?auto_115931 ) ( ON ?auto_115927 ?auto_115933 ) ( CLEAR ?auto_115927 ) ( not ( = ?auto_115926 ?auto_115933 ) ) ( not ( = ?auto_115927 ?auto_115933 ) ) ( not ( = ?auto_115925 ?auto_115933 ) ) ( TRUCK-AT ?auto_115928 ?auto_115932 ) ( SURFACE-AT ?auto_115925 ?auto_115932 ) ( CLEAR ?auto_115925 ) ( LIFTING ?auto_115929 ?auto_115926 ) ( IS-CRATE ?auto_115926 ) ( ON ?auto_115922 ?auto_115921 ) ( ON ?auto_115923 ?auto_115922 ) ( ON ?auto_115924 ?auto_115923 ) ( ON ?auto_115925 ?auto_115924 ) ( not ( = ?auto_115921 ?auto_115922 ) ) ( not ( = ?auto_115921 ?auto_115923 ) ) ( not ( = ?auto_115921 ?auto_115924 ) ) ( not ( = ?auto_115921 ?auto_115925 ) ) ( not ( = ?auto_115921 ?auto_115926 ) ) ( not ( = ?auto_115921 ?auto_115927 ) ) ( not ( = ?auto_115921 ?auto_115933 ) ) ( not ( = ?auto_115922 ?auto_115923 ) ) ( not ( = ?auto_115922 ?auto_115924 ) ) ( not ( = ?auto_115922 ?auto_115925 ) ) ( not ( = ?auto_115922 ?auto_115926 ) ) ( not ( = ?auto_115922 ?auto_115927 ) ) ( not ( = ?auto_115922 ?auto_115933 ) ) ( not ( = ?auto_115923 ?auto_115924 ) ) ( not ( = ?auto_115923 ?auto_115925 ) ) ( not ( = ?auto_115923 ?auto_115926 ) ) ( not ( = ?auto_115923 ?auto_115927 ) ) ( not ( = ?auto_115923 ?auto_115933 ) ) ( not ( = ?auto_115924 ?auto_115925 ) ) ( not ( = ?auto_115924 ?auto_115926 ) ) ( not ( = ?auto_115924 ?auto_115927 ) ) ( not ( = ?auto_115924 ?auto_115933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115925 ?auto_115926 ?auto_115927 )
      ( MAKE-6CRATE-VERIFY ?auto_115921 ?auto_115922 ?auto_115923 ?auto_115924 ?auto_115925 ?auto_115926 ?auto_115927 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115985 - SURFACE
      ?auto_115986 - SURFACE
      ?auto_115987 - SURFACE
      ?auto_115988 - SURFACE
      ?auto_115989 - SURFACE
      ?auto_115990 - SURFACE
      ?auto_115991 - SURFACE
    )
    :vars
    (
      ?auto_115993 - HOIST
      ?auto_115997 - PLACE
      ?auto_115992 - PLACE
      ?auto_115996 - HOIST
      ?auto_115994 - SURFACE
      ?auto_115995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115993 ?auto_115997 ) ( IS-CRATE ?auto_115991 ) ( not ( = ?auto_115990 ?auto_115991 ) ) ( not ( = ?auto_115989 ?auto_115990 ) ) ( not ( = ?auto_115989 ?auto_115991 ) ) ( not ( = ?auto_115992 ?auto_115997 ) ) ( HOIST-AT ?auto_115996 ?auto_115992 ) ( not ( = ?auto_115993 ?auto_115996 ) ) ( AVAILABLE ?auto_115996 ) ( SURFACE-AT ?auto_115991 ?auto_115992 ) ( ON ?auto_115991 ?auto_115994 ) ( CLEAR ?auto_115991 ) ( not ( = ?auto_115990 ?auto_115994 ) ) ( not ( = ?auto_115991 ?auto_115994 ) ) ( not ( = ?auto_115989 ?auto_115994 ) ) ( TRUCK-AT ?auto_115995 ?auto_115997 ) ( SURFACE-AT ?auto_115989 ?auto_115997 ) ( CLEAR ?auto_115989 ) ( IS-CRATE ?auto_115990 ) ( AVAILABLE ?auto_115993 ) ( IN ?auto_115990 ?auto_115995 ) ( ON ?auto_115986 ?auto_115985 ) ( ON ?auto_115987 ?auto_115986 ) ( ON ?auto_115988 ?auto_115987 ) ( ON ?auto_115989 ?auto_115988 ) ( not ( = ?auto_115985 ?auto_115986 ) ) ( not ( = ?auto_115985 ?auto_115987 ) ) ( not ( = ?auto_115985 ?auto_115988 ) ) ( not ( = ?auto_115985 ?auto_115989 ) ) ( not ( = ?auto_115985 ?auto_115990 ) ) ( not ( = ?auto_115985 ?auto_115991 ) ) ( not ( = ?auto_115985 ?auto_115994 ) ) ( not ( = ?auto_115986 ?auto_115987 ) ) ( not ( = ?auto_115986 ?auto_115988 ) ) ( not ( = ?auto_115986 ?auto_115989 ) ) ( not ( = ?auto_115986 ?auto_115990 ) ) ( not ( = ?auto_115986 ?auto_115991 ) ) ( not ( = ?auto_115986 ?auto_115994 ) ) ( not ( = ?auto_115987 ?auto_115988 ) ) ( not ( = ?auto_115987 ?auto_115989 ) ) ( not ( = ?auto_115987 ?auto_115990 ) ) ( not ( = ?auto_115987 ?auto_115991 ) ) ( not ( = ?auto_115987 ?auto_115994 ) ) ( not ( = ?auto_115988 ?auto_115989 ) ) ( not ( = ?auto_115988 ?auto_115990 ) ) ( not ( = ?auto_115988 ?auto_115991 ) ) ( not ( = ?auto_115988 ?auto_115994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115989 ?auto_115990 ?auto_115991 )
      ( MAKE-6CRATE-VERIFY ?auto_115985 ?auto_115986 ?auto_115987 ?auto_115988 ?auto_115989 ?auto_115990 ?auto_115991 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117941 - SURFACE
      ?auto_117942 - SURFACE
      ?auto_117943 - SURFACE
      ?auto_117944 - SURFACE
      ?auto_117945 - SURFACE
      ?auto_117946 - SURFACE
      ?auto_117947 - SURFACE
      ?auto_117948 - SURFACE
    )
    :vars
    (
      ?auto_117949 - HOIST
      ?auto_117950 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117949 ?auto_117950 ) ( SURFACE-AT ?auto_117947 ?auto_117950 ) ( CLEAR ?auto_117947 ) ( LIFTING ?auto_117949 ?auto_117948 ) ( IS-CRATE ?auto_117948 ) ( not ( = ?auto_117947 ?auto_117948 ) ) ( ON ?auto_117942 ?auto_117941 ) ( ON ?auto_117943 ?auto_117942 ) ( ON ?auto_117944 ?auto_117943 ) ( ON ?auto_117945 ?auto_117944 ) ( ON ?auto_117946 ?auto_117945 ) ( ON ?auto_117947 ?auto_117946 ) ( not ( = ?auto_117941 ?auto_117942 ) ) ( not ( = ?auto_117941 ?auto_117943 ) ) ( not ( = ?auto_117941 ?auto_117944 ) ) ( not ( = ?auto_117941 ?auto_117945 ) ) ( not ( = ?auto_117941 ?auto_117946 ) ) ( not ( = ?auto_117941 ?auto_117947 ) ) ( not ( = ?auto_117941 ?auto_117948 ) ) ( not ( = ?auto_117942 ?auto_117943 ) ) ( not ( = ?auto_117942 ?auto_117944 ) ) ( not ( = ?auto_117942 ?auto_117945 ) ) ( not ( = ?auto_117942 ?auto_117946 ) ) ( not ( = ?auto_117942 ?auto_117947 ) ) ( not ( = ?auto_117942 ?auto_117948 ) ) ( not ( = ?auto_117943 ?auto_117944 ) ) ( not ( = ?auto_117943 ?auto_117945 ) ) ( not ( = ?auto_117943 ?auto_117946 ) ) ( not ( = ?auto_117943 ?auto_117947 ) ) ( not ( = ?auto_117943 ?auto_117948 ) ) ( not ( = ?auto_117944 ?auto_117945 ) ) ( not ( = ?auto_117944 ?auto_117946 ) ) ( not ( = ?auto_117944 ?auto_117947 ) ) ( not ( = ?auto_117944 ?auto_117948 ) ) ( not ( = ?auto_117945 ?auto_117946 ) ) ( not ( = ?auto_117945 ?auto_117947 ) ) ( not ( = ?auto_117945 ?auto_117948 ) ) ( not ( = ?auto_117946 ?auto_117947 ) ) ( not ( = ?auto_117946 ?auto_117948 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_117947 ?auto_117948 )
      ( MAKE-7CRATE-VERIFY ?auto_117941 ?auto_117942 ?auto_117943 ?auto_117944 ?auto_117945 ?auto_117946 ?auto_117947 ?auto_117948 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117996 - SURFACE
      ?auto_117997 - SURFACE
      ?auto_117998 - SURFACE
      ?auto_117999 - SURFACE
      ?auto_118000 - SURFACE
      ?auto_118001 - SURFACE
      ?auto_118002 - SURFACE
      ?auto_118003 - SURFACE
    )
    :vars
    (
      ?auto_118005 - HOIST
      ?auto_118006 - PLACE
      ?auto_118004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118005 ?auto_118006 ) ( SURFACE-AT ?auto_118002 ?auto_118006 ) ( CLEAR ?auto_118002 ) ( IS-CRATE ?auto_118003 ) ( not ( = ?auto_118002 ?auto_118003 ) ) ( TRUCK-AT ?auto_118004 ?auto_118006 ) ( AVAILABLE ?auto_118005 ) ( IN ?auto_118003 ?auto_118004 ) ( ON ?auto_118002 ?auto_118001 ) ( not ( = ?auto_118001 ?auto_118002 ) ) ( not ( = ?auto_118001 ?auto_118003 ) ) ( ON ?auto_117997 ?auto_117996 ) ( ON ?auto_117998 ?auto_117997 ) ( ON ?auto_117999 ?auto_117998 ) ( ON ?auto_118000 ?auto_117999 ) ( ON ?auto_118001 ?auto_118000 ) ( not ( = ?auto_117996 ?auto_117997 ) ) ( not ( = ?auto_117996 ?auto_117998 ) ) ( not ( = ?auto_117996 ?auto_117999 ) ) ( not ( = ?auto_117996 ?auto_118000 ) ) ( not ( = ?auto_117996 ?auto_118001 ) ) ( not ( = ?auto_117996 ?auto_118002 ) ) ( not ( = ?auto_117996 ?auto_118003 ) ) ( not ( = ?auto_117997 ?auto_117998 ) ) ( not ( = ?auto_117997 ?auto_117999 ) ) ( not ( = ?auto_117997 ?auto_118000 ) ) ( not ( = ?auto_117997 ?auto_118001 ) ) ( not ( = ?auto_117997 ?auto_118002 ) ) ( not ( = ?auto_117997 ?auto_118003 ) ) ( not ( = ?auto_117998 ?auto_117999 ) ) ( not ( = ?auto_117998 ?auto_118000 ) ) ( not ( = ?auto_117998 ?auto_118001 ) ) ( not ( = ?auto_117998 ?auto_118002 ) ) ( not ( = ?auto_117998 ?auto_118003 ) ) ( not ( = ?auto_117999 ?auto_118000 ) ) ( not ( = ?auto_117999 ?auto_118001 ) ) ( not ( = ?auto_117999 ?auto_118002 ) ) ( not ( = ?auto_117999 ?auto_118003 ) ) ( not ( = ?auto_118000 ?auto_118001 ) ) ( not ( = ?auto_118000 ?auto_118002 ) ) ( not ( = ?auto_118000 ?auto_118003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118001 ?auto_118002 ?auto_118003 )
      ( MAKE-7CRATE-VERIFY ?auto_117996 ?auto_117997 ?auto_117998 ?auto_117999 ?auto_118000 ?auto_118001 ?auto_118002 ?auto_118003 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118059 - SURFACE
      ?auto_118060 - SURFACE
      ?auto_118061 - SURFACE
      ?auto_118062 - SURFACE
      ?auto_118063 - SURFACE
      ?auto_118064 - SURFACE
      ?auto_118065 - SURFACE
      ?auto_118066 - SURFACE
    )
    :vars
    (
      ?auto_118067 - HOIST
      ?auto_118068 - PLACE
      ?auto_118070 - TRUCK
      ?auto_118069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118067 ?auto_118068 ) ( SURFACE-AT ?auto_118065 ?auto_118068 ) ( CLEAR ?auto_118065 ) ( IS-CRATE ?auto_118066 ) ( not ( = ?auto_118065 ?auto_118066 ) ) ( AVAILABLE ?auto_118067 ) ( IN ?auto_118066 ?auto_118070 ) ( ON ?auto_118065 ?auto_118064 ) ( not ( = ?auto_118064 ?auto_118065 ) ) ( not ( = ?auto_118064 ?auto_118066 ) ) ( TRUCK-AT ?auto_118070 ?auto_118069 ) ( not ( = ?auto_118069 ?auto_118068 ) ) ( ON ?auto_118060 ?auto_118059 ) ( ON ?auto_118061 ?auto_118060 ) ( ON ?auto_118062 ?auto_118061 ) ( ON ?auto_118063 ?auto_118062 ) ( ON ?auto_118064 ?auto_118063 ) ( not ( = ?auto_118059 ?auto_118060 ) ) ( not ( = ?auto_118059 ?auto_118061 ) ) ( not ( = ?auto_118059 ?auto_118062 ) ) ( not ( = ?auto_118059 ?auto_118063 ) ) ( not ( = ?auto_118059 ?auto_118064 ) ) ( not ( = ?auto_118059 ?auto_118065 ) ) ( not ( = ?auto_118059 ?auto_118066 ) ) ( not ( = ?auto_118060 ?auto_118061 ) ) ( not ( = ?auto_118060 ?auto_118062 ) ) ( not ( = ?auto_118060 ?auto_118063 ) ) ( not ( = ?auto_118060 ?auto_118064 ) ) ( not ( = ?auto_118060 ?auto_118065 ) ) ( not ( = ?auto_118060 ?auto_118066 ) ) ( not ( = ?auto_118061 ?auto_118062 ) ) ( not ( = ?auto_118061 ?auto_118063 ) ) ( not ( = ?auto_118061 ?auto_118064 ) ) ( not ( = ?auto_118061 ?auto_118065 ) ) ( not ( = ?auto_118061 ?auto_118066 ) ) ( not ( = ?auto_118062 ?auto_118063 ) ) ( not ( = ?auto_118062 ?auto_118064 ) ) ( not ( = ?auto_118062 ?auto_118065 ) ) ( not ( = ?auto_118062 ?auto_118066 ) ) ( not ( = ?auto_118063 ?auto_118064 ) ) ( not ( = ?auto_118063 ?auto_118065 ) ) ( not ( = ?auto_118063 ?auto_118066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118064 ?auto_118065 ?auto_118066 )
      ( MAKE-7CRATE-VERIFY ?auto_118059 ?auto_118060 ?auto_118061 ?auto_118062 ?auto_118063 ?auto_118064 ?auto_118065 ?auto_118066 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118129 - SURFACE
      ?auto_118130 - SURFACE
      ?auto_118131 - SURFACE
      ?auto_118132 - SURFACE
      ?auto_118133 - SURFACE
      ?auto_118134 - SURFACE
      ?auto_118135 - SURFACE
      ?auto_118136 - SURFACE
    )
    :vars
    (
      ?auto_118138 - HOIST
      ?auto_118140 - PLACE
      ?auto_118137 - TRUCK
      ?auto_118141 - PLACE
      ?auto_118139 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_118138 ?auto_118140 ) ( SURFACE-AT ?auto_118135 ?auto_118140 ) ( CLEAR ?auto_118135 ) ( IS-CRATE ?auto_118136 ) ( not ( = ?auto_118135 ?auto_118136 ) ) ( AVAILABLE ?auto_118138 ) ( ON ?auto_118135 ?auto_118134 ) ( not ( = ?auto_118134 ?auto_118135 ) ) ( not ( = ?auto_118134 ?auto_118136 ) ) ( TRUCK-AT ?auto_118137 ?auto_118141 ) ( not ( = ?auto_118141 ?auto_118140 ) ) ( HOIST-AT ?auto_118139 ?auto_118141 ) ( LIFTING ?auto_118139 ?auto_118136 ) ( not ( = ?auto_118138 ?auto_118139 ) ) ( ON ?auto_118130 ?auto_118129 ) ( ON ?auto_118131 ?auto_118130 ) ( ON ?auto_118132 ?auto_118131 ) ( ON ?auto_118133 ?auto_118132 ) ( ON ?auto_118134 ?auto_118133 ) ( not ( = ?auto_118129 ?auto_118130 ) ) ( not ( = ?auto_118129 ?auto_118131 ) ) ( not ( = ?auto_118129 ?auto_118132 ) ) ( not ( = ?auto_118129 ?auto_118133 ) ) ( not ( = ?auto_118129 ?auto_118134 ) ) ( not ( = ?auto_118129 ?auto_118135 ) ) ( not ( = ?auto_118129 ?auto_118136 ) ) ( not ( = ?auto_118130 ?auto_118131 ) ) ( not ( = ?auto_118130 ?auto_118132 ) ) ( not ( = ?auto_118130 ?auto_118133 ) ) ( not ( = ?auto_118130 ?auto_118134 ) ) ( not ( = ?auto_118130 ?auto_118135 ) ) ( not ( = ?auto_118130 ?auto_118136 ) ) ( not ( = ?auto_118131 ?auto_118132 ) ) ( not ( = ?auto_118131 ?auto_118133 ) ) ( not ( = ?auto_118131 ?auto_118134 ) ) ( not ( = ?auto_118131 ?auto_118135 ) ) ( not ( = ?auto_118131 ?auto_118136 ) ) ( not ( = ?auto_118132 ?auto_118133 ) ) ( not ( = ?auto_118132 ?auto_118134 ) ) ( not ( = ?auto_118132 ?auto_118135 ) ) ( not ( = ?auto_118132 ?auto_118136 ) ) ( not ( = ?auto_118133 ?auto_118134 ) ) ( not ( = ?auto_118133 ?auto_118135 ) ) ( not ( = ?auto_118133 ?auto_118136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118134 ?auto_118135 ?auto_118136 )
      ( MAKE-7CRATE-VERIFY ?auto_118129 ?auto_118130 ?auto_118131 ?auto_118132 ?auto_118133 ?auto_118134 ?auto_118135 ?auto_118136 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118206 - SURFACE
      ?auto_118207 - SURFACE
      ?auto_118208 - SURFACE
      ?auto_118209 - SURFACE
      ?auto_118210 - SURFACE
      ?auto_118211 - SURFACE
      ?auto_118212 - SURFACE
      ?auto_118213 - SURFACE
    )
    :vars
    (
      ?auto_118218 - HOIST
      ?auto_118219 - PLACE
      ?auto_118217 - TRUCK
      ?auto_118216 - PLACE
      ?auto_118215 - HOIST
      ?auto_118214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118218 ?auto_118219 ) ( SURFACE-AT ?auto_118212 ?auto_118219 ) ( CLEAR ?auto_118212 ) ( IS-CRATE ?auto_118213 ) ( not ( = ?auto_118212 ?auto_118213 ) ) ( AVAILABLE ?auto_118218 ) ( ON ?auto_118212 ?auto_118211 ) ( not ( = ?auto_118211 ?auto_118212 ) ) ( not ( = ?auto_118211 ?auto_118213 ) ) ( TRUCK-AT ?auto_118217 ?auto_118216 ) ( not ( = ?auto_118216 ?auto_118219 ) ) ( HOIST-AT ?auto_118215 ?auto_118216 ) ( not ( = ?auto_118218 ?auto_118215 ) ) ( AVAILABLE ?auto_118215 ) ( SURFACE-AT ?auto_118213 ?auto_118216 ) ( ON ?auto_118213 ?auto_118214 ) ( CLEAR ?auto_118213 ) ( not ( = ?auto_118212 ?auto_118214 ) ) ( not ( = ?auto_118213 ?auto_118214 ) ) ( not ( = ?auto_118211 ?auto_118214 ) ) ( ON ?auto_118207 ?auto_118206 ) ( ON ?auto_118208 ?auto_118207 ) ( ON ?auto_118209 ?auto_118208 ) ( ON ?auto_118210 ?auto_118209 ) ( ON ?auto_118211 ?auto_118210 ) ( not ( = ?auto_118206 ?auto_118207 ) ) ( not ( = ?auto_118206 ?auto_118208 ) ) ( not ( = ?auto_118206 ?auto_118209 ) ) ( not ( = ?auto_118206 ?auto_118210 ) ) ( not ( = ?auto_118206 ?auto_118211 ) ) ( not ( = ?auto_118206 ?auto_118212 ) ) ( not ( = ?auto_118206 ?auto_118213 ) ) ( not ( = ?auto_118206 ?auto_118214 ) ) ( not ( = ?auto_118207 ?auto_118208 ) ) ( not ( = ?auto_118207 ?auto_118209 ) ) ( not ( = ?auto_118207 ?auto_118210 ) ) ( not ( = ?auto_118207 ?auto_118211 ) ) ( not ( = ?auto_118207 ?auto_118212 ) ) ( not ( = ?auto_118207 ?auto_118213 ) ) ( not ( = ?auto_118207 ?auto_118214 ) ) ( not ( = ?auto_118208 ?auto_118209 ) ) ( not ( = ?auto_118208 ?auto_118210 ) ) ( not ( = ?auto_118208 ?auto_118211 ) ) ( not ( = ?auto_118208 ?auto_118212 ) ) ( not ( = ?auto_118208 ?auto_118213 ) ) ( not ( = ?auto_118208 ?auto_118214 ) ) ( not ( = ?auto_118209 ?auto_118210 ) ) ( not ( = ?auto_118209 ?auto_118211 ) ) ( not ( = ?auto_118209 ?auto_118212 ) ) ( not ( = ?auto_118209 ?auto_118213 ) ) ( not ( = ?auto_118209 ?auto_118214 ) ) ( not ( = ?auto_118210 ?auto_118211 ) ) ( not ( = ?auto_118210 ?auto_118212 ) ) ( not ( = ?auto_118210 ?auto_118213 ) ) ( not ( = ?auto_118210 ?auto_118214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118211 ?auto_118212 ?auto_118213 )
      ( MAKE-7CRATE-VERIFY ?auto_118206 ?auto_118207 ?auto_118208 ?auto_118209 ?auto_118210 ?auto_118211 ?auto_118212 ?auto_118213 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118284 - SURFACE
      ?auto_118285 - SURFACE
      ?auto_118286 - SURFACE
      ?auto_118287 - SURFACE
      ?auto_118288 - SURFACE
      ?auto_118289 - SURFACE
      ?auto_118290 - SURFACE
      ?auto_118291 - SURFACE
    )
    :vars
    (
      ?auto_118297 - HOIST
      ?auto_118295 - PLACE
      ?auto_118293 - PLACE
      ?auto_118292 - HOIST
      ?auto_118296 - SURFACE
      ?auto_118294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118297 ?auto_118295 ) ( SURFACE-AT ?auto_118290 ?auto_118295 ) ( CLEAR ?auto_118290 ) ( IS-CRATE ?auto_118291 ) ( not ( = ?auto_118290 ?auto_118291 ) ) ( AVAILABLE ?auto_118297 ) ( ON ?auto_118290 ?auto_118289 ) ( not ( = ?auto_118289 ?auto_118290 ) ) ( not ( = ?auto_118289 ?auto_118291 ) ) ( not ( = ?auto_118293 ?auto_118295 ) ) ( HOIST-AT ?auto_118292 ?auto_118293 ) ( not ( = ?auto_118297 ?auto_118292 ) ) ( AVAILABLE ?auto_118292 ) ( SURFACE-AT ?auto_118291 ?auto_118293 ) ( ON ?auto_118291 ?auto_118296 ) ( CLEAR ?auto_118291 ) ( not ( = ?auto_118290 ?auto_118296 ) ) ( not ( = ?auto_118291 ?auto_118296 ) ) ( not ( = ?auto_118289 ?auto_118296 ) ) ( TRUCK-AT ?auto_118294 ?auto_118295 ) ( ON ?auto_118285 ?auto_118284 ) ( ON ?auto_118286 ?auto_118285 ) ( ON ?auto_118287 ?auto_118286 ) ( ON ?auto_118288 ?auto_118287 ) ( ON ?auto_118289 ?auto_118288 ) ( not ( = ?auto_118284 ?auto_118285 ) ) ( not ( = ?auto_118284 ?auto_118286 ) ) ( not ( = ?auto_118284 ?auto_118287 ) ) ( not ( = ?auto_118284 ?auto_118288 ) ) ( not ( = ?auto_118284 ?auto_118289 ) ) ( not ( = ?auto_118284 ?auto_118290 ) ) ( not ( = ?auto_118284 ?auto_118291 ) ) ( not ( = ?auto_118284 ?auto_118296 ) ) ( not ( = ?auto_118285 ?auto_118286 ) ) ( not ( = ?auto_118285 ?auto_118287 ) ) ( not ( = ?auto_118285 ?auto_118288 ) ) ( not ( = ?auto_118285 ?auto_118289 ) ) ( not ( = ?auto_118285 ?auto_118290 ) ) ( not ( = ?auto_118285 ?auto_118291 ) ) ( not ( = ?auto_118285 ?auto_118296 ) ) ( not ( = ?auto_118286 ?auto_118287 ) ) ( not ( = ?auto_118286 ?auto_118288 ) ) ( not ( = ?auto_118286 ?auto_118289 ) ) ( not ( = ?auto_118286 ?auto_118290 ) ) ( not ( = ?auto_118286 ?auto_118291 ) ) ( not ( = ?auto_118286 ?auto_118296 ) ) ( not ( = ?auto_118287 ?auto_118288 ) ) ( not ( = ?auto_118287 ?auto_118289 ) ) ( not ( = ?auto_118287 ?auto_118290 ) ) ( not ( = ?auto_118287 ?auto_118291 ) ) ( not ( = ?auto_118287 ?auto_118296 ) ) ( not ( = ?auto_118288 ?auto_118289 ) ) ( not ( = ?auto_118288 ?auto_118290 ) ) ( not ( = ?auto_118288 ?auto_118291 ) ) ( not ( = ?auto_118288 ?auto_118296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118289 ?auto_118290 ?auto_118291 )
      ( MAKE-7CRATE-VERIFY ?auto_118284 ?auto_118285 ?auto_118286 ?auto_118287 ?auto_118288 ?auto_118289 ?auto_118290 ?auto_118291 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118362 - SURFACE
      ?auto_118363 - SURFACE
      ?auto_118364 - SURFACE
      ?auto_118365 - SURFACE
      ?auto_118366 - SURFACE
      ?auto_118367 - SURFACE
      ?auto_118368 - SURFACE
      ?auto_118369 - SURFACE
    )
    :vars
    (
      ?auto_118371 - HOIST
      ?auto_118372 - PLACE
      ?auto_118375 - PLACE
      ?auto_118370 - HOIST
      ?auto_118374 - SURFACE
      ?auto_118373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118371 ?auto_118372 ) ( IS-CRATE ?auto_118369 ) ( not ( = ?auto_118368 ?auto_118369 ) ) ( not ( = ?auto_118367 ?auto_118368 ) ) ( not ( = ?auto_118367 ?auto_118369 ) ) ( not ( = ?auto_118375 ?auto_118372 ) ) ( HOIST-AT ?auto_118370 ?auto_118375 ) ( not ( = ?auto_118371 ?auto_118370 ) ) ( AVAILABLE ?auto_118370 ) ( SURFACE-AT ?auto_118369 ?auto_118375 ) ( ON ?auto_118369 ?auto_118374 ) ( CLEAR ?auto_118369 ) ( not ( = ?auto_118368 ?auto_118374 ) ) ( not ( = ?auto_118369 ?auto_118374 ) ) ( not ( = ?auto_118367 ?auto_118374 ) ) ( TRUCK-AT ?auto_118373 ?auto_118372 ) ( SURFACE-AT ?auto_118367 ?auto_118372 ) ( CLEAR ?auto_118367 ) ( LIFTING ?auto_118371 ?auto_118368 ) ( IS-CRATE ?auto_118368 ) ( ON ?auto_118363 ?auto_118362 ) ( ON ?auto_118364 ?auto_118363 ) ( ON ?auto_118365 ?auto_118364 ) ( ON ?auto_118366 ?auto_118365 ) ( ON ?auto_118367 ?auto_118366 ) ( not ( = ?auto_118362 ?auto_118363 ) ) ( not ( = ?auto_118362 ?auto_118364 ) ) ( not ( = ?auto_118362 ?auto_118365 ) ) ( not ( = ?auto_118362 ?auto_118366 ) ) ( not ( = ?auto_118362 ?auto_118367 ) ) ( not ( = ?auto_118362 ?auto_118368 ) ) ( not ( = ?auto_118362 ?auto_118369 ) ) ( not ( = ?auto_118362 ?auto_118374 ) ) ( not ( = ?auto_118363 ?auto_118364 ) ) ( not ( = ?auto_118363 ?auto_118365 ) ) ( not ( = ?auto_118363 ?auto_118366 ) ) ( not ( = ?auto_118363 ?auto_118367 ) ) ( not ( = ?auto_118363 ?auto_118368 ) ) ( not ( = ?auto_118363 ?auto_118369 ) ) ( not ( = ?auto_118363 ?auto_118374 ) ) ( not ( = ?auto_118364 ?auto_118365 ) ) ( not ( = ?auto_118364 ?auto_118366 ) ) ( not ( = ?auto_118364 ?auto_118367 ) ) ( not ( = ?auto_118364 ?auto_118368 ) ) ( not ( = ?auto_118364 ?auto_118369 ) ) ( not ( = ?auto_118364 ?auto_118374 ) ) ( not ( = ?auto_118365 ?auto_118366 ) ) ( not ( = ?auto_118365 ?auto_118367 ) ) ( not ( = ?auto_118365 ?auto_118368 ) ) ( not ( = ?auto_118365 ?auto_118369 ) ) ( not ( = ?auto_118365 ?auto_118374 ) ) ( not ( = ?auto_118366 ?auto_118367 ) ) ( not ( = ?auto_118366 ?auto_118368 ) ) ( not ( = ?auto_118366 ?auto_118369 ) ) ( not ( = ?auto_118366 ?auto_118374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118367 ?auto_118368 ?auto_118369 )
      ( MAKE-7CRATE-VERIFY ?auto_118362 ?auto_118363 ?auto_118364 ?auto_118365 ?auto_118366 ?auto_118367 ?auto_118368 ?auto_118369 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118440 - SURFACE
      ?auto_118441 - SURFACE
      ?auto_118442 - SURFACE
      ?auto_118443 - SURFACE
      ?auto_118444 - SURFACE
      ?auto_118445 - SURFACE
      ?auto_118446 - SURFACE
      ?auto_118447 - SURFACE
    )
    :vars
    (
      ?auto_118453 - HOIST
      ?auto_118448 - PLACE
      ?auto_118450 - PLACE
      ?auto_118452 - HOIST
      ?auto_118451 - SURFACE
      ?auto_118449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118453 ?auto_118448 ) ( IS-CRATE ?auto_118447 ) ( not ( = ?auto_118446 ?auto_118447 ) ) ( not ( = ?auto_118445 ?auto_118446 ) ) ( not ( = ?auto_118445 ?auto_118447 ) ) ( not ( = ?auto_118450 ?auto_118448 ) ) ( HOIST-AT ?auto_118452 ?auto_118450 ) ( not ( = ?auto_118453 ?auto_118452 ) ) ( AVAILABLE ?auto_118452 ) ( SURFACE-AT ?auto_118447 ?auto_118450 ) ( ON ?auto_118447 ?auto_118451 ) ( CLEAR ?auto_118447 ) ( not ( = ?auto_118446 ?auto_118451 ) ) ( not ( = ?auto_118447 ?auto_118451 ) ) ( not ( = ?auto_118445 ?auto_118451 ) ) ( TRUCK-AT ?auto_118449 ?auto_118448 ) ( SURFACE-AT ?auto_118445 ?auto_118448 ) ( CLEAR ?auto_118445 ) ( IS-CRATE ?auto_118446 ) ( AVAILABLE ?auto_118453 ) ( IN ?auto_118446 ?auto_118449 ) ( ON ?auto_118441 ?auto_118440 ) ( ON ?auto_118442 ?auto_118441 ) ( ON ?auto_118443 ?auto_118442 ) ( ON ?auto_118444 ?auto_118443 ) ( ON ?auto_118445 ?auto_118444 ) ( not ( = ?auto_118440 ?auto_118441 ) ) ( not ( = ?auto_118440 ?auto_118442 ) ) ( not ( = ?auto_118440 ?auto_118443 ) ) ( not ( = ?auto_118440 ?auto_118444 ) ) ( not ( = ?auto_118440 ?auto_118445 ) ) ( not ( = ?auto_118440 ?auto_118446 ) ) ( not ( = ?auto_118440 ?auto_118447 ) ) ( not ( = ?auto_118440 ?auto_118451 ) ) ( not ( = ?auto_118441 ?auto_118442 ) ) ( not ( = ?auto_118441 ?auto_118443 ) ) ( not ( = ?auto_118441 ?auto_118444 ) ) ( not ( = ?auto_118441 ?auto_118445 ) ) ( not ( = ?auto_118441 ?auto_118446 ) ) ( not ( = ?auto_118441 ?auto_118447 ) ) ( not ( = ?auto_118441 ?auto_118451 ) ) ( not ( = ?auto_118442 ?auto_118443 ) ) ( not ( = ?auto_118442 ?auto_118444 ) ) ( not ( = ?auto_118442 ?auto_118445 ) ) ( not ( = ?auto_118442 ?auto_118446 ) ) ( not ( = ?auto_118442 ?auto_118447 ) ) ( not ( = ?auto_118442 ?auto_118451 ) ) ( not ( = ?auto_118443 ?auto_118444 ) ) ( not ( = ?auto_118443 ?auto_118445 ) ) ( not ( = ?auto_118443 ?auto_118446 ) ) ( not ( = ?auto_118443 ?auto_118447 ) ) ( not ( = ?auto_118443 ?auto_118451 ) ) ( not ( = ?auto_118444 ?auto_118445 ) ) ( not ( = ?auto_118444 ?auto_118446 ) ) ( not ( = ?auto_118444 ?auto_118447 ) ) ( not ( = ?auto_118444 ?auto_118451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118445 ?auto_118446 ?auto_118447 )
      ( MAKE-7CRATE-VERIFY ?auto_118440 ?auto_118441 ?auto_118442 ?auto_118443 ?auto_118444 ?auto_118445 ?auto_118446 ?auto_118447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_121011 - SURFACE
      ?auto_121012 - SURFACE
    )
    :vars
    (
      ?auto_121017 - HOIST
      ?auto_121018 - PLACE
      ?auto_121015 - SURFACE
      ?auto_121014 - TRUCK
      ?auto_121013 - PLACE
      ?auto_121019 - HOIST
      ?auto_121016 - SURFACE
      ?auto_121020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121017 ?auto_121018 ) ( SURFACE-AT ?auto_121011 ?auto_121018 ) ( CLEAR ?auto_121011 ) ( IS-CRATE ?auto_121012 ) ( not ( = ?auto_121011 ?auto_121012 ) ) ( AVAILABLE ?auto_121017 ) ( ON ?auto_121011 ?auto_121015 ) ( not ( = ?auto_121015 ?auto_121011 ) ) ( not ( = ?auto_121015 ?auto_121012 ) ) ( TRUCK-AT ?auto_121014 ?auto_121013 ) ( not ( = ?auto_121013 ?auto_121018 ) ) ( HOIST-AT ?auto_121019 ?auto_121013 ) ( not ( = ?auto_121017 ?auto_121019 ) ) ( SURFACE-AT ?auto_121012 ?auto_121013 ) ( ON ?auto_121012 ?auto_121016 ) ( CLEAR ?auto_121012 ) ( not ( = ?auto_121011 ?auto_121016 ) ) ( not ( = ?auto_121012 ?auto_121016 ) ) ( not ( = ?auto_121015 ?auto_121016 ) ) ( LIFTING ?auto_121019 ?auto_121020 ) ( IS-CRATE ?auto_121020 ) ( not ( = ?auto_121011 ?auto_121020 ) ) ( not ( = ?auto_121012 ?auto_121020 ) ) ( not ( = ?auto_121015 ?auto_121020 ) ) ( not ( = ?auto_121016 ?auto_121020 ) ) )
    :subtasks
    ( ( !LOAD ?auto_121019 ?auto_121020 ?auto_121014 ?auto_121013 )
      ( MAKE-1CRATE ?auto_121011 ?auto_121012 )
      ( MAKE-1CRATE-VERIFY ?auto_121011 ?auto_121012 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121353 - SURFACE
      ?auto_121354 - SURFACE
      ?auto_121355 - SURFACE
      ?auto_121356 - SURFACE
      ?auto_121357 - SURFACE
      ?auto_121358 - SURFACE
      ?auto_121359 - SURFACE
      ?auto_121360 - SURFACE
      ?auto_121361 - SURFACE
    )
    :vars
    (
      ?auto_121363 - HOIST
      ?auto_121362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121363 ?auto_121362 ) ( SURFACE-AT ?auto_121360 ?auto_121362 ) ( CLEAR ?auto_121360 ) ( LIFTING ?auto_121363 ?auto_121361 ) ( IS-CRATE ?auto_121361 ) ( not ( = ?auto_121360 ?auto_121361 ) ) ( ON ?auto_121354 ?auto_121353 ) ( ON ?auto_121355 ?auto_121354 ) ( ON ?auto_121356 ?auto_121355 ) ( ON ?auto_121357 ?auto_121356 ) ( ON ?auto_121358 ?auto_121357 ) ( ON ?auto_121359 ?auto_121358 ) ( ON ?auto_121360 ?auto_121359 ) ( not ( = ?auto_121353 ?auto_121354 ) ) ( not ( = ?auto_121353 ?auto_121355 ) ) ( not ( = ?auto_121353 ?auto_121356 ) ) ( not ( = ?auto_121353 ?auto_121357 ) ) ( not ( = ?auto_121353 ?auto_121358 ) ) ( not ( = ?auto_121353 ?auto_121359 ) ) ( not ( = ?auto_121353 ?auto_121360 ) ) ( not ( = ?auto_121353 ?auto_121361 ) ) ( not ( = ?auto_121354 ?auto_121355 ) ) ( not ( = ?auto_121354 ?auto_121356 ) ) ( not ( = ?auto_121354 ?auto_121357 ) ) ( not ( = ?auto_121354 ?auto_121358 ) ) ( not ( = ?auto_121354 ?auto_121359 ) ) ( not ( = ?auto_121354 ?auto_121360 ) ) ( not ( = ?auto_121354 ?auto_121361 ) ) ( not ( = ?auto_121355 ?auto_121356 ) ) ( not ( = ?auto_121355 ?auto_121357 ) ) ( not ( = ?auto_121355 ?auto_121358 ) ) ( not ( = ?auto_121355 ?auto_121359 ) ) ( not ( = ?auto_121355 ?auto_121360 ) ) ( not ( = ?auto_121355 ?auto_121361 ) ) ( not ( = ?auto_121356 ?auto_121357 ) ) ( not ( = ?auto_121356 ?auto_121358 ) ) ( not ( = ?auto_121356 ?auto_121359 ) ) ( not ( = ?auto_121356 ?auto_121360 ) ) ( not ( = ?auto_121356 ?auto_121361 ) ) ( not ( = ?auto_121357 ?auto_121358 ) ) ( not ( = ?auto_121357 ?auto_121359 ) ) ( not ( = ?auto_121357 ?auto_121360 ) ) ( not ( = ?auto_121357 ?auto_121361 ) ) ( not ( = ?auto_121358 ?auto_121359 ) ) ( not ( = ?auto_121358 ?auto_121360 ) ) ( not ( = ?auto_121358 ?auto_121361 ) ) ( not ( = ?auto_121359 ?auto_121360 ) ) ( not ( = ?auto_121359 ?auto_121361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_121360 ?auto_121361 )
      ( MAKE-8CRATE-VERIFY ?auto_121353 ?auto_121354 ?auto_121355 ?auto_121356 ?auto_121357 ?auto_121358 ?auto_121359 ?auto_121360 ?auto_121361 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121420 - SURFACE
      ?auto_121421 - SURFACE
      ?auto_121422 - SURFACE
      ?auto_121423 - SURFACE
      ?auto_121424 - SURFACE
      ?auto_121425 - SURFACE
      ?auto_121426 - SURFACE
      ?auto_121427 - SURFACE
      ?auto_121428 - SURFACE
    )
    :vars
    (
      ?auto_121430 - HOIST
      ?auto_121429 - PLACE
      ?auto_121431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121430 ?auto_121429 ) ( SURFACE-AT ?auto_121427 ?auto_121429 ) ( CLEAR ?auto_121427 ) ( IS-CRATE ?auto_121428 ) ( not ( = ?auto_121427 ?auto_121428 ) ) ( TRUCK-AT ?auto_121431 ?auto_121429 ) ( AVAILABLE ?auto_121430 ) ( IN ?auto_121428 ?auto_121431 ) ( ON ?auto_121427 ?auto_121426 ) ( not ( = ?auto_121426 ?auto_121427 ) ) ( not ( = ?auto_121426 ?auto_121428 ) ) ( ON ?auto_121421 ?auto_121420 ) ( ON ?auto_121422 ?auto_121421 ) ( ON ?auto_121423 ?auto_121422 ) ( ON ?auto_121424 ?auto_121423 ) ( ON ?auto_121425 ?auto_121424 ) ( ON ?auto_121426 ?auto_121425 ) ( not ( = ?auto_121420 ?auto_121421 ) ) ( not ( = ?auto_121420 ?auto_121422 ) ) ( not ( = ?auto_121420 ?auto_121423 ) ) ( not ( = ?auto_121420 ?auto_121424 ) ) ( not ( = ?auto_121420 ?auto_121425 ) ) ( not ( = ?auto_121420 ?auto_121426 ) ) ( not ( = ?auto_121420 ?auto_121427 ) ) ( not ( = ?auto_121420 ?auto_121428 ) ) ( not ( = ?auto_121421 ?auto_121422 ) ) ( not ( = ?auto_121421 ?auto_121423 ) ) ( not ( = ?auto_121421 ?auto_121424 ) ) ( not ( = ?auto_121421 ?auto_121425 ) ) ( not ( = ?auto_121421 ?auto_121426 ) ) ( not ( = ?auto_121421 ?auto_121427 ) ) ( not ( = ?auto_121421 ?auto_121428 ) ) ( not ( = ?auto_121422 ?auto_121423 ) ) ( not ( = ?auto_121422 ?auto_121424 ) ) ( not ( = ?auto_121422 ?auto_121425 ) ) ( not ( = ?auto_121422 ?auto_121426 ) ) ( not ( = ?auto_121422 ?auto_121427 ) ) ( not ( = ?auto_121422 ?auto_121428 ) ) ( not ( = ?auto_121423 ?auto_121424 ) ) ( not ( = ?auto_121423 ?auto_121425 ) ) ( not ( = ?auto_121423 ?auto_121426 ) ) ( not ( = ?auto_121423 ?auto_121427 ) ) ( not ( = ?auto_121423 ?auto_121428 ) ) ( not ( = ?auto_121424 ?auto_121425 ) ) ( not ( = ?auto_121424 ?auto_121426 ) ) ( not ( = ?auto_121424 ?auto_121427 ) ) ( not ( = ?auto_121424 ?auto_121428 ) ) ( not ( = ?auto_121425 ?auto_121426 ) ) ( not ( = ?auto_121425 ?auto_121427 ) ) ( not ( = ?auto_121425 ?auto_121428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121426 ?auto_121427 ?auto_121428 )
      ( MAKE-8CRATE-VERIFY ?auto_121420 ?auto_121421 ?auto_121422 ?auto_121423 ?auto_121424 ?auto_121425 ?auto_121426 ?auto_121427 ?auto_121428 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121496 - SURFACE
      ?auto_121497 - SURFACE
      ?auto_121498 - SURFACE
      ?auto_121499 - SURFACE
      ?auto_121500 - SURFACE
      ?auto_121501 - SURFACE
      ?auto_121502 - SURFACE
      ?auto_121503 - SURFACE
      ?auto_121504 - SURFACE
    )
    :vars
    (
      ?auto_121505 - HOIST
      ?auto_121506 - PLACE
      ?auto_121507 - TRUCK
      ?auto_121508 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121505 ?auto_121506 ) ( SURFACE-AT ?auto_121503 ?auto_121506 ) ( CLEAR ?auto_121503 ) ( IS-CRATE ?auto_121504 ) ( not ( = ?auto_121503 ?auto_121504 ) ) ( AVAILABLE ?auto_121505 ) ( IN ?auto_121504 ?auto_121507 ) ( ON ?auto_121503 ?auto_121502 ) ( not ( = ?auto_121502 ?auto_121503 ) ) ( not ( = ?auto_121502 ?auto_121504 ) ) ( TRUCK-AT ?auto_121507 ?auto_121508 ) ( not ( = ?auto_121508 ?auto_121506 ) ) ( ON ?auto_121497 ?auto_121496 ) ( ON ?auto_121498 ?auto_121497 ) ( ON ?auto_121499 ?auto_121498 ) ( ON ?auto_121500 ?auto_121499 ) ( ON ?auto_121501 ?auto_121500 ) ( ON ?auto_121502 ?auto_121501 ) ( not ( = ?auto_121496 ?auto_121497 ) ) ( not ( = ?auto_121496 ?auto_121498 ) ) ( not ( = ?auto_121496 ?auto_121499 ) ) ( not ( = ?auto_121496 ?auto_121500 ) ) ( not ( = ?auto_121496 ?auto_121501 ) ) ( not ( = ?auto_121496 ?auto_121502 ) ) ( not ( = ?auto_121496 ?auto_121503 ) ) ( not ( = ?auto_121496 ?auto_121504 ) ) ( not ( = ?auto_121497 ?auto_121498 ) ) ( not ( = ?auto_121497 ?auto_121499 ) ) ( not ( = ?auto_121497 ?auto_121500 ) ) ( not ( = ?auto_121497 ?auto_121501 ) ) ( not ( = ?auto_121497 ?auto_121502 ) ) ( not ( = ?auto_121497 ?auto_121503 ) ) ( not ( = ?auto_121497 ?auto_121504 ) ) ( not ( = ?auto_121498 ?auto_121499 ) ) ( not ( = ?auto_121498 ?auto_121500 ) ) ( not ( = ?auto_121498 ?auto_121501 ) ) ( not ( = ?auto_121498 ?auto_121502 ) ) ( not ( = ?auto_121498 ?auto_121503 ) ) ( not ( = ?auto_121498 ?auto_121504 ) ) ( not ( = ?auto_121499 ?auto_121500 ) ) ( not ( = ?auto_121499 ?auto_121501 ) ) ( not ( = ?auto_121499 ?auto_121502 ) ) ( not ( = ?auto_121499 ?auto_121503 ) ) ( not ( = ?auto_121499 ?auto_121504 ) ) ( not ( = ?auto_121500 ?auto_121501 ) ) ( not ( = ?auto_121500 ?auto_121502 ) ) ( not ( = ?auto_121500 ?auto_121503 ) ) ( not ( = ?auto_121500 ?auto_121504 ) ) ( not ( = ?auto_121501 ?auto_121502 ) ) ( not ( = ?auto_121501 ?auto_121503 ) ) ( not ( = ?auto_121501 ?auto_121504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121502 ?auto_121503 ?auto_121504 )
      ( MAKE-8CRATE-VERIFY ?auto_121496 ?auto_121497 ?auto_121498 ?auto_121499 ?auto_121500 ?auto_121501 ?auto_121502 ?auto_121503 ?auto_121504 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121580 - SURFACE
      ?auto_121581 - SURFACE
      ?auto_121582 - SURFACE
      ?auto_121583 - SURFACE
      ?auto_121584 - SURFACE
      ?auto_121585 - SURFACE
      ?auto_121586 - SURFACE
      ?auto_121587 - SURFACE
      ?auto_121588 - SURFACE
    )
    :vars
    (
      ?auto_121589 - HOIST
      ?auto_121592 - PLACE
      ?auto_121593 - TRUCK
      ?auto_121591 - PLACE
      ?auto_121590 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_121589 ?auto_121592 ) ( SURFACE-AT ?auto_121587 ?auto_121592 ) ( CLEAR ?auto_121587 ) ( IS-CRATE ?auto_121588 ) ( not ( = ?auto_121587 ?auto_121588 ) ) ( AVAILABLE ?auto_121589 ) ( ON ?auto_121587 ?auto_121586 ) ( not ( = ?auto_121586 ?auto_121587 ) ) ( not ( = ?auto_121586 ?auto_121588 ) ) ( TRUCK-AT ?auto_121593 ?auto_121591 ) ( not ( = ?auto_121591 ?auto_121592 ) ) ( HOIST-AT ?auto_121590 ?auto_121591 ) ( LIFTING ?auto_121590 ?auto_121588 ) ( not ( = ?auto_121589 ?auto_121590 ) ) ( ON ?auto_121581 ?auto_121580 ) ( ON ?auto_121582 ?auto_121581 ) ( ON ?auto_121583 ?auto_121582 ) ( ON ?auto_121584 ?auto_121583 ) ( ON ?auto_121585 ?auto_121584 ) ( ON ?auto_121586 ?auto_121585 ) ( not ( = ?auto_121580 ?auto_121581 ) ) ( not ( = ?auto_121580 ?auto_121582 ) ) ( not ( = ?auto_121580 ?auto_121583 ) ) ( not ( = ?auto_121580 ?auto_121584 ) ) ( not ( = ?auto_121580 ?auto_121585 ) ) ( not ( = ?auto_121580 ?auto_121586 ) ) ( not ( = ?auto_121580 ?auto_121587 ) ) ( not ( = ?auto_121580 ?auto_121588 ) ) ( not ( = ?auto_121581 ?auto_121582 ) ) ( not ( = ?auto_121581 ?auto_121583 ) ) ( not ( = ?auto_121581 ?auto_121584 ) ) ( not ( = ?auto_121581 ?auto_121585 ) ) ( not ( = ?auto_121581 ?auto_121586 ) ) ( not ( = ?auto_121581 ?auto_121587 ) ) ( not ( = ?auto_121581 ?auto_121588 ) ) ( not ( = ?auto_121582 ?auto_121583 ) ) ( not ( = ?auto_121582 ?auto_121584 ) ) ( not ( = ?auto_121582 ?auto_121585 ) ) ( not ( = ?auto_121582 ?auto_121586 ) ) ( not ( = ?auto_121582 ?auto_121587 ) ) ( not ( = ?auto_121582 ?auto_121588 ) ) ( not ( = ?auto_121583 ?auto_121584 ) ) ( not ( = ?auto_121583 ?auto_121585 ) ) ( not ( = ?auto_121583 ?auto_121586 ) ) ( not ( = ?auto_121583 ?auto_121587 ) ) ( not ( = ?auto_121583 ?auto_121588 ) ) ( not ( = ?auto_121584 ?auto_121585 ) ) ( not ( = ?auto_121584 ?auto_121586 ) ) ( not ( = ?auto_121584 ?auto_121587 ) ) ( not ( = ?auto_121584 ?auto_121588 ) ) ( not ( = ?auto_121585 ?auto_121586 ) ) ( not ( = ?auto_121585 ?auto_121587 ) ) ( not ( = ?auto_121585 ?auto_121588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121586 ?auto_121587 ?auto_121588 )
      ( MAKE-8CRATE-VERIFY ?auto_121580 ?auto_121581 ?auto_121582 ?auto_121583 ?auto_121584 ?auto_121585 ?auto_121586 ?auto_121587 ?auto_121588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121672 - SURFACE
      ?auto_121673 - SURFACE
      ?auto_121674 - SURFACE
      ?auto_121675 - SURFACE
      ?auto_121676 - SURFACE
      ?auto_121677 - SURFACE
      ?auto_121678 - SURFACE
      ?auto_121679 - SURFACE
      ?auto_121680 - SURFACE
    )
    :vars
    (
      ?auto_121684 - HOIST
      ?auto_121686 - PLACE
      ?auto_121681 - TRUCK
      ?auto_121682 - PLACE
      ?auto_121685 - HOIST
      ?auto_121683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121684 ?auto_121686 ) ( SURFACE-AT ?auto_121679 ?auto_121686 ) ( CLEAR ?auto_121679 ) ( IS-CRATE ?auto_121680 ) ( not ( = ?auto_121679 ?auto_121680 ) ) ( AVAILABLE ?auto_121684 ) ( ON ?auto_121679 ?auto_121678 ) ( not ( = ?auto_121678 ?auto_121679 ) ) ( not ( = ?auto_121678 ?auto_121680 ) ) ( TRUCK-AT ?auto_121681 ?auto_121682 ) ( not ( = ?auto_121682 ?auto_121686 ) ) ( HOIST-AT ?auto_121685 ?auto_121682 ) ( not ( = ?auto_121684 ?auto_121685 ) ) ( AVAILABLE ?auto_121685 ) ( SURFACE-AT ?auto_121680 ?auto_121682 ) ( ON ?auto_121680 ?auto_121683 ) ( CLEAR ?auto_121680 ) ( not ( = ?auto_121679 ?auto_121683 ) ) ( not ( = ?auto_121680 ?auto_121683 ) ) ( not ( = ?auto_121678 ?auto_121683 ) ) ( ON ?auto_121673 ?auto_121672 ) ( ON ?auto_121674 ?auto_121673 ) ( ON ?auto_121675 ?auto_121674 ) ( ON ?auto_121676 ?auto_121675 ) ( ON ?auto_121677 ?auto_121676 ) ( ON ?auto_121678 ?auto_121677 ) ( not ( = ?auto_121672 ?auto_121673 ) ) ( not ( = ?auto_121672 ?auto_121674 ) ) ( not ( = ?auto_121672 ?auto_121675 ) ) ( not ( = ?auto_121672 ?auto_121676 ) ) ( not ( = ?auto_121672 ?auto_121677 ) ) ( not ( = ?auto_121672 ?auto_121678 ) ) ( not ( = ?auto_121672 ?auto_121679 ) ) ( not ( = ?auto_121672 ?auto_121680 ) ) ( not ( = ?auto_121672 ?auto_121683 ) ) ( not ( = ?auto_121673 ?auto_121674 ) ) ( not ( = ?auto_121673 ?auto_121675 ) ) ( not ( = ?auto_121673 ?auto_121676 ) ) ( not ( = ?auto_121673 ?auto_121677 ) ) ( not ( = ?auto_121673 ?auto_121678 ) ) ( not ( = ?auto_121673 ?auto_121679 ) ) ( not ( = ?auto_121673 ?auto_121680 ) ) ( not ( = ?auto_121673 ?auto_121683 ) ) ( not ( = ?auto_121674 ?auto_121675 ) ) ( not ( = ?auto_121674 ?auto_121676 ) ) ( not ( = ?auto_121674 ?auto_121677 ) ) ( not ( = ?auto_121674 ?auto_121678 ) ) ( not ( = ?auto_121674 ?auto_121679 ) ) ( not ( = ?auto_121674 ?auto_121680 ) ) ( not ( = ?auto_121674 ?auto_121683 ) ) ( not ( = ?auto_121675 ?auto_121676 ) ) ( not ( = ?auto_121675 ?auto_121677 ) ) ( not ( = ?auto_121675 ?auto_121678 ) ) ( not ( = ?auto_121675 ?auto_121679 ) ) ( not ( = ?auto_121675 ?auto_121680 ) ) ( not ( = ?auto_121675 ?auto_121683 ) ) ( not ( = ?auto_121676 ?auto_121677 ) ) ( not ( = ?auto_121676 ?auto_121678 ) ) ( not ( = ?auto_121676 ?auto_121679 ) ) ( not ( = ?auto_121676 ?auto_121680 ) ) ( not ( = ?auto_121676 ?auto_121683 ) ) ( not ( = ?auto_121677 ?auto_121678 ) ) ( not ( = ?auto_121677 ?auto_121679 ) ) ( not ( = ?auto_121677 ?auto_121680 ) ) ( not ( = ?auto_121677 ?auto_121683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121678 ?auto_121679 ?auto_121680 )
      ( MAKE-8CRATE-VERIFY ?auto_121672 ?auto_121673 ?auto_121674 ?auto_121675 ?auto_121676 ?auto_121677 ?auto_121678 ?auto_121679 ?auto_121680 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121765 - SURFACE
      ?auto_121766 - SURFACE
      ?auto_121767 - SURFACE
      ?auto_121768 - SURFACE
      ?auto_121769 - SURFACE
      ?auto_121770 - SURFACE
      ?auto_121771 - SURFACE
      ?auto_121772 - SURFACE
      ?auto_121773 - SURFACE
    )
    :vars
    (
      ?auto_121779 - HOIST
      ?auto_121776 - PLACE
      ?auto_121775 - PLACE
      ?auto_121777 - HOIST
      ?auto_121778 - SURFACE
      ?auto_121774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121779 ?auto_121776 ) ( SURFACE-AT ?auto_121772 ?auto_121776 ) ( CLEAR ?auto_121772 ) ( IS-CRATE ?auto_121773 ) ( not ( = ?auto_121772 ?auto_121773 ) ) ( AVAILABLE ?auto_121779 ) ( ON ?auto_121772 ?auto_121771 ) ( not ( = ?auto_121771 ?auto_121772 ) ) ( not ( = ?auto_121771 ?auto_121773 ) ) ( not ( = ?auto_121775 ?auto_121776 ) ) ( HOIST-AT ?auto_121777 ?auto_121775 ) ( not ( = ?auto_121779 ?auto_121777 ) ) ( AVAILABLE ?auto_121777 ) ( SURFACE-AT ?auto_121773 ?auto_121775 ) ( ON ?auto_121773 ?auto_121778 ) ( CLEAR ?auto_121773 ) ( not ( = ?auto_121772 ?auto_121778 ) ) ( not ( = ?auto_121773 ?auto_121778 ) ) ( not ( = ?auto_121771 ?auto_121778 ) ) ( TRUCK-AT ?auto_121774 ?auto_121776 ) ( ON ?auto_121766 ?auto_121765 ) ( ON ?auto_121767 ?auto_121766 ) ( ON ?auto_121768 ?auto_121767 ) ( ON ?auto_121769 ?auto_121768 ) ( ON ?auto_121770 ?auto_121769 ) ( ON ?auto_121771 ?auto_121770 ) ( not ( = ?auto_121765 ?auto_121766 ) ) ( not ( = ?auto_121765 ?auto_121767 ) ) ( not ( = ?auto_121765 ?auto_121768 ) ) ( not ( = ?auto_121765 ?auto_121769 ) ) ( not ( = ?auto_121765 ?auto_121770 ) ) ( not ( = ?auto_121765 ?auto_121771 ) ) ( not ( = ?auto_121765 ?auto_121772 ) ) ( not ( = ?auto_121765 ?auto_121773 ) ) ( not ( = ?auto_121765 ?auto_121778 ) ) ( not ( = ?auto_121766 ?auto_121767 ) ) ( not ( = ?auto_121766 ?auto_121768 ) ) ( not ( = ?auto_121766 ?auto_121769 ) ) ( not ( = ?auto_121766 ?auto_121770 ) ) ( not ( = ?auto_121766 ?auto_121771 ) ) ( not ( = ?auto_121766 ?auto_121772 ) ) ( not ( = ?auto_121766 ?auto_121773 ) ) ( not ( = ?auto_121766 ?auto_121778 ) ) ( not ( = ?auto_121767 ?auto_121768 ) ) ( not ( = ?auto_121767 ?auto_121769 ) ) ( not ( = ?auto_121767 ?auto_121770 ) ) ( not ( = ?auto_121767 ?auto_121771 ) ) ( not ( = ?auto_121767 ?auto_121772 ) ) ( not ( = ?auto_121767 ?auto_121773 ) ) ( not ( = ?auto_121767 ?auto_121778 ) ) ( not ( = ?auto_121768 ?auto_121769 ) ) ( not ( = ?auto_121768 ?auto_121770 ) ) ( not ( = ?auto_121768 ?auto_121771 ) ) ( not ( = ?auto_121768 ?auto_121772 ) ) ( not ( = ?auto_121768 ?auto_121773 ) ) ( not ( = ?auto_121768 ?auto_121778 ) ) ( not ( = ?auto_121769 ?auto_121770 ) ) ( not ( = ?auto_121769 ?auto_121771 ) ) ( not ( = ?auto_121769 ?auto_121772 ) ) ( not ( = ?auto_121769 ?auto_121773 ) ) ( not ( = ?auto_121769 ?auto_121778 ) ) ( not ( = ?auto_121770 ?auto_121771 ) ) ( not ( = ?auto_121770 ?auto_121772 ) ) ( not ( = ?auto_121770 ?auto_121773 ) ) ( not ( = ?auto_121770 ?auto_121778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121771 ?auto_121772 ?auto_121773 )
      ( MAKE-8CRATE-VERIFY ?auto_121765 ?auto_121766 ?auto_121767 ?auto_121768 ?auto_121769 ?auto_121770 ?auto_121771 ?auto_121772 ?auto_121773 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121858 - SURFACE
      ?auto_121859 - SURFACE
      ?auto_121860 - SURFACE
      ?auto_121861 - SURFACE
      ?auto_121862 - SURFACE
      ?auto_121863 - SURFACE
      ?auto_121864 - SURFACE
      ?auto_121865 - SURFACE
      ?auto_121866 - SURFACE
    )
    :vars
    (
      ?auto_121867 - HOIST
      ?auto_121872 - PLACE
      ?auto_121871 - PLACE
      ?auto_121868 - HOIST
      ?auto_121870 - SURFACE
      ?auto_121869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121867 ?auto_121872 ) ( IS-CRATE ?auto_121866 ) ( not ( = ?auto_121865 ?auto_121866 ) ) ( not ( = ?auto_121864 ?auto_121865 ) ) ( not ( = ?auto_121864 ?auto_121866 ) ) ( not ( = ?auto_121871 ?auto_121872 ) ) ( HOIST-AT ?auto_121868 ?auto_121871 ) ( not ( = ?auto_121867 ?auto_121868 ) ) ( AVAILABLE ?auto_121868 ) ( SURFACE-AT ?auto_121866 ?auto_121871 ) ( ON ?auto_121866 ?auto_121870 ) ( CLEAR ?auto_121866 ) ( not ( = ?auto_121865 ?auto_121870 ) ) ( not ( = ?auto_121866 ?auto_121870 ) ) ( not ( = ?auto_121864 ?auto_121870 ) ) ( TRUCK-AT ?auto_121869 ?auto_121872 ) ( SURFACE-AT ?auto_121864 ?auto_121872 ) ( CLEAR ?auto_121864 ) ( LIFTING ?auto_121867 ?auto_121865 ) ( IS-CRATE ?auto_121865 ) ( ON ?auto_121859 ?auto_121858 ) ( ON ?auto_121860 ?auto_121859 ) ( ON ?auto_121861 ?auto_121860 ) ( ON ?auto_121862 ?auto_121861 ) ( ON ?auto_121863 ?auto_121862 ) ( ON ?auto_121864 ?auto_121863 ) ( not ( = ?auto_121858 ?auto_121859 ) ) ( not ( = ?auto_121858 ?auto_121860 ) ) ( not ( = ?auto_121858 ?auto_121861 ) ) ( not ( = ?auto_121858 ?auto_121862 ) ) ( not ( = ?auto_121858 ?auto_121863 ) ) ( not ( = ?auto_121858 ?auto_121864 ) ) ( not ( = ?auto_121858 ?auto_121865 ) ) ( not ( = ?auto_121858 ?auto_121866 ) ) ( not ( = ?auto_121858 ?auto_121870 ) ) ( not ( = ?auto_121859 ?auto_121860 ) ) ( not ( = ?auto_121859 ?auto_121861 ) ) ( not ( = ?auto_121859 ?auto_121862 ) ) ( not ( = ?auto_121859 ?auto_121863 ) ) ( not ( = ?auto_121859 ?auto_121864 ) ) ( not ( = ?auto_121859 ?auto_121865 ) ) ( not ( = ?auto_121859 ?auto_121866 ) ) ( not ( = ?auto_121859 ?auto_121870 ) ) ( not ( = ?auto_121860 ?auto_121861 ) ) ( not ( = ?auto_121860 ?auto_121862 ) ) ( not ( = ?auto_121860 ?auto_121863 ) ) ( not ( = ?auto_121860 ?auto_121864 ) ) ( not ( = ?auto_121860 ?auto_121865 ) ) ( not ( = ?auto_121860 ?auto_121866 ) ) ( not ( = ?auto_121860 ?auto_121870 ) ) ( not ( = ?auto_121861 ?auto_121862 ) ) ( not ( = ?auto_121861 ?auto_121863 ) ) ( not ( = ?auto_121861 ?auto_121864 ) ) ( not ( = ?auto_121861 ?auto_121865 ) ) ( not ( = ?auto_121861 ?auto_121866 ) ) ( not ( = ?auto_121861 ?auto_121870 ) ) ( not ( = ?auto_121862 ?auto_121863 ) ) ( not ( = ?auto_121862 ?auto_121864 ) ) ( not ( = ?auto_121862 ?auto_121865 ) ) ( not ( = ?auto_121862 ?auto_121866 ) ) ( not ( = ?auto_121862 ?auto_121870 ) ) ( not ( = ?auto_121863 ?auto_121864 ) ) ( not ( = ?auto_121863 ?auto_121865 ) ) ( not ( = ?auto_121863 ?auto_121866 ) ) ( not ( = ?auto_121863 ?auto_121870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121864 ?auto_121865 ?auto_121866 )
      ( MAKE-8CRATE-VERIFY ?auto_121858 ?auto_121859 ?auto_121860 ?auto_121861 ?auto_121862 ?auto_121863 ?auto_121864 ?auto_121865 ?auto_121866 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121951 - SURFACE
      ?auto_121952 - SURFACE
      ?auto_121953 - SURFACE
      ?auto_121954 - SURFACE
      ?auto_121955 - SURFACE
      ?auto_121956 - SURFACE
      ?auto_121957 - SURFACE
      ?auto_121958 - SURFACE
      ?auto_121959 - SURFACE
    )
    :vars
    (
      ?auto_121963 - HOIST
      ?auto_121964 - PLACE
      ?auto_121960 - PLACE
      ?auto_121961 - HOIST
      ?auto_121962 - SURFACE
      ?auto_121965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121963 ?auto_121964 ) ( IS-CRATE ?auto_121959 ) ( not ( = ?auto_121958 ?auto_121959 ) ) ( not ( = ?auto_121957 ?auto_121958 ) ) ( not ( = ?auto_121957 ?auto_121959 ) ) ( not ( = ?auto_121960 ?auto_121964 ) ) ( HOIST-AT ?auto_121961 ?auto_121960 ) ( not ( = ?auto_121963 ?auto_121961 ) ) ( AVAILABLE ?auto_121961 ) ( SURFACE-AT ?auto_121959 ?auto_121960 ) ( ON ?auto_121959 ?auto_121962 ) ( CLEAR ?auto_121959 ) ( not ( = ?auto_121958 ?auto_121962 ) ) ( not ( = ?auto_121959 ?auto_121962 ) ) ( not ( = ?auto_121957 ?auto_121962 ) ) ( TRUCK-AT ?auto_121965 ?auto_121964 ) ( SURFACE-AT ?auto_121957 ?auto_121964 ) ( CLEAR ?auto_121957 ) ( IS-CRATE ?auto_121958 ) ( AVAILABLE ?auto_121963 ) ( IN ?auto_121958 ?auto_121965 ) ( ON ?auto_121952 ?auto_121951 ) ( ON ?auto_121953 ?auto_121952 ) ( ON ?auto_121954 ?auto_121953 ) ( ON ?auto_121955 ?auto_121954 ) ( ON ?auto_121956 ?auto_121955 ) ( ON ?auto_121957 ?auto_121956 ) ( not ( = ?auto_121951 ?auto_121952 ) ) ( not ( = ?auto_121951 ?auto_121953 ) ) ( not ( = ?auto_121951 ?auto_121954 ) ) ( not ( = ?auto_121951 ?auto_121955 ) ) ( not ( = ?auto_121951 ?auto_121956 ) ) ( not ( = ?auto_121951 ?auto_121957 ) ) ( not ( = ?auto_121951 ?auto_121958 ) ) ( not ( = ?auto_121951 ?auto_121959 ) ) ( not ( = ?auto_121951 ?auto_121962 ) ) ( not ( = ?auto_121952 ?auto_121953 ) ) ( not ( = ?auto_121952 ?auto_121954 ) ) ( not ( = ?auto_121952 ?auto_121955 ) ) ( not ( = ?auto_121952 ?auto_121956 ) ) ( not ( = ?auto_121952 ?auto_121957 ) ) ( not ( = ?auto_121952 ?auto_121958 ) ) ( not ( = ?auto_121952 ?auto_121959 ) ) ( not ( = ?auto_121952 ?auto_121962 ) ) ( not ( = ?auto_121953 ?auto_121954 ) ) ( not ( = ?auto_121953 ?auto_121955 ) ) ( not ( = ?auto_121953 ?auto_121956 ) ) ( not ( = ?auto_121953 ?auto_121957 ) ) ( not ( = ?auto_121953 ?auto_121958 ) ) ( not ( = ?auto_121953 ?auto_121959 ) ) ( not ( = ?auto_121953 ?auto_121962 ) ) ( not ( = ?auto_121954 ?auto_121955 ) ) ( not ( = ?auto_121954 ?auto_121956 ) ) ( not ( = ?auto_121954 ?auto_121957 ) ) ( not ( = ?auto_121954 ?auto_121958 ) ) ( not ( = ?auto_121954 ?auto_121959 ) ) ( not ( = ?auto_121954 ?auto_121962 ) ) ( not ( = ?auto_121955 ?auto_121956 ) ) ( not ( = ?auto_121955 ?auto_121957 ) ) ( not ( = ?auto_121955 ?auto_121958 ) ) ( not ( = ?auto_121955 ?auto_121959 ) ) ( not ( = ?auto_121955 ?auto_121962 ) ) ( not ( = ?auto_121956 ?auto_121957 ) ) ( not ( = ?auto_121956 ?auto_121958 ) ) ( not ( = ?auto_121956 ?auto_121959 ) ) ( not ( = ?auto_121956 ?auto_121962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121957 ?auto_121958 ?auto_121959 )
      ( MAKE-8CRATE-VERIFY ?auto_121951 ?auto_121952 ?auto_121953 ?auto_121954 ?auto_121955 ?auto_121956 ?auto_121957 ?auto_121958 ?auto_121959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125633 - SURFACE
      ?auto_125634 - SURFACE
    )
    :vars
    (
      ?auto_125641 - HOIST
      ?auto_125640 - PLACE
      ?auto_125635 - SURFACE
      ?auto_125638 - PLACE
      ?auto_125639 - HOIST
      ?auto_125636 - SURFACE
      ?auto_125637 - TRUCK
      ?auto_125642 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125641 ?auto_125640 ) ( SURFACE-AT ?auto_125633 ?auto_125640 ) ( CLEAR ?auto_125633 ) ( IS-CRATE ?auto_125634 ) ( not ( = ?auto_125633 ?auto_125634 ) ) ( ON ?auto_125633 ?auto_125635 ) ( not ( = ?auto_125635 ?auto_125633 ) ) ( not ( = ?auto_125635 ?auto_125634 ) ) ( not ( = ?auto_125638 ?auto_125640 ) ) ( HOIST-AT ?auto_125639 ?auto_125638 ) ( not ( = ?auto_125641 ?auto_125639 ) ) ( AVAILABLE ?auto_125639 ) ( SURFACE-AT ?auto_125634 ?auto_125638 ) ( ON ?auto_125634 ?auto_125636 ) ( CLEAR ?auto_125634 ) ( not ( = ?auto_125633 ?auto_125636 ) ) ( not ( = ?auto_125634 ?auto_125636 ) ) ( not ( = ?auto_125635 ?auto_125636 ) ) ( TRUCK-AT ?auto_125637 ?auto_125640 ) ( LIFTING ?auto_125641 ?auto_125642 ) ( IS-CRATE ?auto_125642 ) ( not ( = ?auto_125633 ?auto_125642 ) ) ( not ( = ?auto_125634 ?auto_125642 ) ) ( not ( = ?auto_125635 ?auto_125642 ) ) ( not ( = ?auto_125636 ?auto_125642 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125641 ?auto_125642 ?auto_125637 ?auto_125640 )
      ( MAKE-1CRATE ?auto_125633 ?auto_125634 )
      ( MAKE-1CRATE-VERIFY ?auto_125633 ?auto_125634 ) )
  )

)

