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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24526 - SURFACE
      ?auto_24527 - SURFACE
    )
    :vars
    (
      ?auto_24528 - HOIST
      ?auto_24529 - PLACE
      ?auto_24531 - PLACE
      ?auto_24532 - HOIST
      ?auto_24533 - SURFACE
      ?auto_24530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24528 ?auto_24529 ) ( SURFACE-AT ?auto_24526 ?auto_24529 ) ( CLEAR ?auto_24526 ) ( IS-CRATE ?auto_24527 ) ( AVAILABLE ?auto_24528 ) ( not ( = ?auto_24531 ?auto_24529 ) ) ( HOIST-AT ?auto_24532 ?auto_24531 ) ( AVAILABLE ?auto_24532 ) ( SURFACE-AT ?auto_24527 ?auto_24531 ) ( ON ?auto_24527 ?auto_24533 ) ( CLEAR ?auto_24527 ) ( TRUCK-AT ?auto_24530 ?auto_24529 ) ( not ( = ?auto_24526 ?auto_24527 ) ) ( not ( = ?auto_24526 ?auto_24533 ) ) ( not ( = ?auto_24527 ?auto_24533 ) ) ( not ( = ?auto_24528 ?auto_24532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24530 ?auto_24529 ?auto_24531 )
      ( !LIFT ?auto_24532 ?auto_24527 ?auto_24533 ?auto_24531 )
      ( !LOAD ?auto_24532 ?auto_24527 ?auto_24530 ?auto_24531 )
      ( !DRIVE ?auto_24530 ?auto_24531 ?auto_24529 )
      ( !UNLOAD ?auto_24528 ?auto_24527 ?auto_24530 ?auto_24529 )
      ( !DROP ?auto_24528 ?auto_24527 ?auto_24526 ?auto_24529 )
      ( MAKE-1CRATE-VERIFY ?auto_24526 ?auto_24527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24536 - SURFACE
      ?auto_24537 - SURFACE
    )
    :vars
    (
      ?auto_24538 - HOIST
      ?auto_24539 - PLACE
      ?auto_24541 - PLACE
      ?auto_24542 - HOIST
      ?auto_24543 - SURFACE
      ?auto_24540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24538 ?auto_24539 ) ( SURFACE-AT ?auto_24536 ?auto_24539 ) ( CLEAR ?auto_24536 ) ( IS-CRATE ?auto_24537 ) ( AVAILABLE ?auto_24538 ) ( not ( = ?auto_24541 ?auto_24539 ) ) ( HOIST-AT ?auto_24542 ?auto_24541 ) ( AVAILABLE ?auto_24542 ) ( SURFACE-AT ?auto_24537 ?auto_24541 ) ( ON ?auto_24537 ?auto_24543 ) ( CLEAR ?auto_24537 ) ( TRUCK-AT ?auto_24540 ?auto_24539 ) ( not ( = ?auto_24536 ?auto_24537 ) ) ( not ( = ?auto_24536 ?auto_24543 ) ) ( not ( = ?auto_24537 ?auto_24543 ) ) ( not ( = ?auto_24538 ?auto_24542 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24540 ?auto_24539 ?auto_24541 )
      ( !LIFT ?auto_24542 ?auto_24537 ?auto_24543 ?auto_24541 )
      ( !LOAD ?auto_24542 ?auto_24537 ?auto_24540 ?auto_24541 )
      ( !DRIVE ?auto_24540 ?auto_24541 ?auto_24539 )
      ( !UNLOAD ?auto_24538 ?auto_24537 ?auto_24540 ?auto_24539 )
      ( !DROP ?auto_24538 ?auto_24537 ?auto_24536 ?auto_24539 )
      ( MAKE-1CRATE-VERIFY ?auto_24536 ?auto_24537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24547 - SURFACE
      ?auto_24548 - SURFACE
      ?auto_24549 - SURFACE
    )
    :vars
    (
      ?auto_24553 - HOIST
      ?auto_24550 - PLACE
      ?auto_24551 - PLACE
      ?auto_24555 - HOIST
      ?auto_24554 - SURFACE
      ?auto_24558 - PLACE
      ?auto_24556 - HOIST
      ?auto_24557 - SURFACE
      ?auto_24552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24553 ?auto_24550 ) ( IS-CRATE ?auto_24549 ) ( not ( = ?auto_24551 ?auto_24550 ) ) ( HOIST-AT ?auto_24555 ?auto_24551 ) ( AVAILABLE ?auto_24555 ) ( SURFACE-AT ?auto_24549 ?auto_24551 ) ( ON ?auto_24549 ?auto_24554 ) ( CLEAR ?auto_24549 ) ( not ( = ?auto_24548 ?auto_24549 ) ) ( not ( = ?auto_24548 ?auto_24554 ) ) ( not ( = ?auto_24549 ?auto_24554 ) ) ( not ( = ?auto_24553 ?auto_24555 ) ) ( SURFACE-AT ?auto_24547 ?auto_24550 ) ( CLEAR ?auto_24547 ) ( IS-CRATE ?auto_24548 ) ( AVAILABLE ?auto_24553 ) ( not ( = ?auto_24558 ?auto_24550 ) ) ( HOIST-AT ?auto_24556 ?auto_24558 ) ( AVAILABLE ?auto_24556 ) ( SURFACE-AT ?auto_24548 ?auto_24558 ) ( ON ?auto_24548 ?auto_24557 ) ( CLEAR ?auto_24548 ) ( TRUCK-AT ?auto_24552 ?auto_24550 ) ( not ( = ?auto_24547 ?auto_24548 ) ) ( not ( = ?auto_24547 ?auto_24557 ) ) ( not ( = ?auto_24548 ?auto_24557 ) ) ( not ( = ?auto_24553 ?auto_24556 ) ) ( not ( = ?auto_24547 ?auto_24549 ) ) ( not ( = ?auto_24547 ?auto_24554 ) ) ( not ( = ?auto_24549 ?auto_24557 ) ) ( not ( = ?auto_24551 ?auto_24558 ) ) ( not ( = ?auto_24555 ?auto_24556 ) ) ( not ( = ?auto_24554 ?auto_24557 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24547 ?auto_24548 )
      ( MAKE-1CRATE ?auto_24548 ?auto_24549 )
      ( MAKE-2CRATE-VERIFY ?auto_24547 ?auto_24548 ?auto_24549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24561 - SURFACE
      ?auto_24562 - SURFACE
    )
    :vars
    (
      ?auto_24563 - HOIST
      ?auto_24564 - PLACE
      ?auto_24566 - PLACE
      ?auto_24567 - HOIST
      ?auto_24568 - SURFACE
      ?auto_24565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24563 ?auto_24564 ) ( SURFACE-AT ?auto_24561 ?auto_24564 ) ( CLEAR ?auto_24561 ) ( IS-CRATE ?auto_24562 ) ( AVAILABLE ?auto_24563 ) ( not ( = ?auto_24566 ?auto_24564 ) ) ( HOIST-AT ?auto_24567 ?auto_24566 ) ( AVAILABLE ?auto_24567 ) ( SURFACE-AT ?auto_24562 ?auto_24566 ) ( ON ?auto_24562 ?auto_24568 ) ( CLEAR ?auto_24562 ) ( TRUCK-AT ?auto_24565 ?auto_24564 ) ( not ( = ?auto_24561 ?auto_24562 ) ) ( not ( = ?auto_24561 ?auto_24568 ) ) ( not ( = ?auto_24562 ?auto_24568 ) ) ( not ( = ?auto_24563 ?auto_24567 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24565 ?auto_24564 ?auto_24566 )
      ( !LIFT ?auto_24567 ?auto_24562 ?auto_24568 ?auto_24566 )
      ( !LOAD ?auto_24567 ?auto_24562 ?auto_24565 ?auto_24566 )
      ( !DRIVE ?auto_24565 ?auto_24566 ?auto_24564 )
      ( !UNLOAD ?auto_24563 ?auto_24562 ?auto_24565 ?auto_24564 )
      ( !DROP ?auto_24563 ?auto_24562 ?auto_24561 ?auto_24564 )
      ( MAKE-1CRATE-VERIFY ?auto_24561 ?auto_24562 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24573 - SURFACE
      ?auto_24574 - SURFACE
      ?auto_24575 - SURFACE
      ?auto_24576 - SURFACE
    )
    :vars
    (
      ?auto_24580 - HOIST
      ?auto_24582 - PLACE
      ?auto_24579 - PLACE
      ?auto_24581 - HOIST
      ?auto_24578 - SURFACE
      ?auto_24587 - PLACE
      ?auto_24586 - HOIST
      ?auto_24583 - SURFACE
      ?auto_24585 - PLACE
      ?auto_24584 - HOIST
      ?auto_24588 - SURFACE
      ?auto_24577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24580 ?auto_24582 ) ( IS-CRATE ?auto_24576 ) ( not ( = ?auto_24579 ?auto_24582 ) ) ( HOIST-AT ?auto_24581 ?auto_24579 ) ( AVAILABLE ?auto_24581 ) ( SURFACE-AT ?auto_24576 ?auto_24579 ) ( ON ?auto_24576 ?auto_24578 ) ( CLEAR ?auto_24576 ) ( not ( = ?auto_24575 ?auto_24576 ) ) ( not ( = ?auto_24575 ?auto_24578 ) ) ( not ( = ?auto_24576 ?auto_24578 ) ) ( not ( = ?auto_24580 ?auto_24581 ) ) ( IS-CRATE ?auto_24575 ) ( not ( = ?auto_24587 ?auto_24582 ) ) ( HOIST-AT ?auto_24586 ?auto_24587 ) ( AVAILABLE ?auto_24586 ) ( SURFACE-AT ?auto_24575 ?auto_24587 ) ( ON ?auto_24575 ?auto_24583 ) ( CLEAR ?auto_24575 ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24583 ) ) ( not ( = ?auto_24575 ?auto_24583 ) ) ( not ( = ?auto_24580 ?auto_24586 ) ) ( SURFACE-AT ?auto_24573 ?auto_24582 ) ( CLEAR ?auto_24573 ) ( IS-CRATE ?auto_24574 ) ( AVAILABLE ?auto_24580 ) ( not ( = ?auto_24585 ?auto_24582 ) ) ( HOIST-AT ?auto_24584 ?auto_24585 ) ( AVAILABLE ?auto_24584 ) ( SURFACE-AT ?auto_24574 ?auto_24585 ) ( ON ?auto_24574 ?auto_24588 ) ( CLEAR ?auto_24574 ) ( TRUCK-AT ?auto_24577 ?auto_24582 ) ( not ( = ?auto_24573 ?auto_24574 ) ) ( not ( = ?auto_24573 ?auto_24588 ) ) ( not ( = ?auto_24574 ?auto_24588 ) ) ( not ( = ?auto_24580 ?auto_24584 ) ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( not ( = ?auto_24573 ?auto_24583 ) ) ( not ( = ?auto_24575 ?auto_24588 ) ) ( not ( = ?auto_24587 ?auto_24585 ) ) ( not ( = ?auto_24586 ?auto_24584 ) ) ( not ( = ?auto_24583 ?auto_24588 ) ) ( not ( = ?auto_24573 ?auto_24576 ) ) ( not ( = ?auto_24573 ?auto_24578 ) ) ( not ( = ?auto_24574 ?auto_24576 ) ) ( not ( = ?auto_24574 ?auto_24578 ) ) ( not ( = ?auto_24576 ?auto_24583 ) ) ( not ( = ?auto_24576 ?auto_24588 ) ) ( not ( = ?auto_24579 ?auto_24587 ) ) ( not ( = ?auto_24579 ?auto_24585 ) ) ( not ( = ?auto_24581 ?auto_24586 ) ) ( not ( = ?auto_24581 ?auto_24584 ) ) ( not ( = ?auto_24578 ?auto_24583 ) ) ( not ( = ?auto_24578 ?auto_24588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24573 ?auto_24574 ?auto_24575 )
      ( MAKE-1CRATE ?auto_24575 ?auto_24576 )
      ( MAKE-3CRATE-VERIFY ?auto_24573 ?auto_24574 ?auto_24575 ?auto_24576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24591 - SURFACE
      ?auto_24592 - SURFACE
    )
    :vars
    (
      ?auto_24593 - HOIST
      ?auto_24594 - PLACE
      ?auto_24596 - PLACE
      ?auto_24597 - HOIST
      ?auto_24598 - SURFACE
      ?auto_24595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24593 ?auto_24594 ) ( SURFACE-AT ?auto_24591 ?auto_24594 ) ( CLEAR ?auto_24591 ) ( IS-CRATE ?auto_24592 ) ( AVAILABLE ?auto_24593 ) ( not ( = ?auto_24596 ?auto_24594 ) ) ( HOIST-AT ?auto_24597 ?auto_24596 ) ( AVAILABLE ?auto_24597 ) ( SURFACE-AT ?auto_24592 ?auto_24596 ) ( ON ?auto_24592 ?auto_24598 ) ( CLEAR ?auto_24592 ) ( TRUCK-AT ?auto_24595 ?auto_24594 ) ( not ( = ?auto_24591 ?auto_24592 ) ) ( not ( = ?auto_24591 ?auto_24598 ) ) ( not ( = ?auto_24592 ?auto_24598 ) ) ( not ( = ?auto_24593 ?auto_24597 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24595 ?auto_24594 ?auto_24596 )
      ( !LIFT ?auto_24597 ?auto_24592 ?auto_24598 ?auto_24596 )
      ( !LOAD ?auto_24597 ?auto_24592 ?auto_24595 ?auto_24596 )
      ( !DRIVE ?auto_24595 ?auto_24596 ?auto_24594 )
      ( !UNLOAD ?auto_24593 ?auto_24592 ?auto_24595 ?auto_24594 )
      ( !DROP ?auto_24593 ?auto_24592 ?auto_24591 ?auto_24594 )
      ( MAKE-1CRATE-VERIFY ?auto_24591 ?auto_24592 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24604 - SURFACE
      ?auto_24605 - SURFACE
      ?auto_24606 - SURFACE
      ?auto_24607 - SURFACE
      ?auto_24608 - SURFACE
    )
    :vars
    (
      ?auto_24609 - HOIST
      ?auto_24610 - PLACE
      ?auto_24613 - PLACE
      ?auto_24614 - HOIST
      ?auto_24611 - SURFACE
      ?auto_24619 - PLACE
      ?auto_24617 - HOIST
      ?auto_24621 - SURFACE
      ?auto_24615 - PLACE
      ?auto_24622 - HOIST
      ?auto_24623 - SURFACE
      ?auto_24620 - PLACE
      ?auto_24618 - HOIST
      ?auto_24616 - SURFACE
      ?auto_24612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24609 ?auto_24610 ) ( IS-CRATE ?auto_24608 ) ( not ( = ?auto_24613 ?auto_24610 ) ) ( HOIST-AT ?auto_24614 ?auto_24613 ) ( AVAILABLE ?auto_24614 ) ( SURFACE-AT ?auto_24608 ?auto_24613 ) ( ON ?auto_24608 ?auto_24611 ) ( CLEAR ?auto_24608 ) ( not ( = ?auto_24607 ?auto_24608 ) ) ( not ( = ?auto_24607 ?auto_24611 ) ) ( not ( = ?auto_24608 ?auto_24611 ) ) ( not ( = ?auto_24609 ?auto_24614 ) ) ( IS-CRATE ?auto_24607 ) ( not ( = ?auto_24619 ?auto_24610 ) ) ( HOIST-AT ?auto_24617 ?auto_24619 ) ( AVAILABLE ?auto_24617 ) ( SURFACE-AT ?auto_24607 ?auto_24619 ) ( ON ?auto_24607 ?auto_24621 ) ( CLEAR ?auto_24607 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( not ( = ?auto_24606 ?auto_24621 ) ) ( not ( = ?auto_24607 ?auto_24621 ) ) ( not ( = ?auto_24609 ?auto_24617 ) ) ( IS-CRATE ?auto_24606 ) ( not ( = ?auto_24615 ?auto_24610 ) ) ( HOIST-AT ?auto_24622 ?auto_24615 ) ( AVAILABLE ?auto_24622 ) ( SURFACE-AT ?auto_24606 ?auto_24615 ) ( ON ?auto_24606 ?auto_24623 ) ( CLEAR ?auto_24606 ) ( not ( = ?auto_24605 ?auto_24606 ) ) ( not ( = ?auto_24605 ?auto_24623 ) ) ( not ( = ?auto_24606 ?auto_24623 ) ) ( not ( = ?auto_24609 ?auto_24622 ) ) ( SURFACE-AT ?auto_24604 ?auto_24610 ) ( CLEAR ?auto_24604 ) ( IS-CRATE ?auto_24605 ) ( AVAILABLE ?auto_24609 ) ( not ( = ?auto_24620 ?auto_24610 ) ) ( HOIST-AT ?auto_24618 ?auto_24620 ) ( AVAILABLE ?auto_24618 ) ( SURFACE-AT ?auto_24605 ?auto_24620 ) ( ON ?auto_24605 ?auto_24616 ) ( CLEAR ?auto_24605 ) ( TRUCK-AT ?auto_24612 ?auto_24610 ) ( not ( = ?auto_24604 ?auto_24605 ) ) ( not ( = ?auto_24604 ?auto_24616 ) ) ( not ( = ?auto_24605 ?auto_24616 ) ) ( not ( = ?auto_24609 ?auto_24618 ) ) ( not ( = ?auto_24604 ?auto_24606 ) ) ( not ( = ?auto_24604 ?auto_24623 ) ) ( not ( = ?auto_24606 ?auto_24616 ) ) ( not ( = ?auto_24615 ?auto_24620 ) ) ( not ( = ?auto_24622 ?auto_24618 ) ) ( not ( = ?auto_24623 ?auto_24616 ) ) ( not ( = ?auto_24604 ?auto_24607 ) ) ( not ( = ?auto_24604 ?auto_24621 ) ) ( not ( = ?auto_24605 ?auto_24607 ) ) ( not ( = ?auto_24605 ?auto_24621 ) ) ( not ( = ?auto_24607 ?auto_24623 ) ) ( not ( = ?auto_24607 ?auto_24616 ) ) ( not ( = ?auto_24619 ?auto_24615 ) ) ( not ( = ?auto_24619 ?auto_24620 ) ) ( not ( = ?auto_24617 ?auto_24622 ) ) ( not ( = ?auto_24617 ?auto_24618 ) ) ( not ( = ?auto_24621 ?auto_24623 ) ) ( not ( = ?auto_24621 ?auto_24616 ) ) ( not ( = ?auto_24604 ?auto_24608 ) ) ( not ( = ?auto_24604 ?auto_24611 ) ) ( not ( = ?auto_24605 ?auto_24608 ) ) ( not ( = ?auto_24605 ?auto_24611 ) ) ( not ( = ?auto_24606 ?auto_24608 ) ) ( not ( = ?auto_24606 ?auto_24611 ) ) ( not ( = ?auto_24608 ?auto_24621 ) ) ( not ( = ?auto_24608 ?auto_24623 ) ) ( not ( = ?auto_24608 ?auto_24616 ) ) ( not ( = ?auto_24613 ?auto_24619 ) ) ( not ( = ?auto_24613 ?auto_24615 ) ) ( not ( = ?auto_24613 ?auto_24620 ) ) ( not ( = ?auto_24614 ?auto_24617 ) ) ( not ( = ?auto_24614 ?auto_24622 ) ) ( not ( = ?auto_24614 ?auto_24618 ) ) ( not ( = ?auto_24611 ?auto_24621 ) ) ( not ( = ?auto_24611 ?auto_24623 ) ) ( not ( = ?auto_24611 ?auto_24616 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_24604 ?auto_24605 ?auto_24606 ?auto_24607 )
      ( MAKE-1CRATE ?auto_24607 ?auto_24608 )
      ( MAKE-4CRATE-VERIFY ?auto_24604 ?auto_24605 ?auto_24606 ?auto_24607 ?auto_24608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24626 - SURFACE
      ?auto_24627 - SURFACE
    )
    :vars
    (
      ?auto_24628 - HOIST
      ?auto_24629 - PLACE
      ?auto_24631 - PLACE
      ?auto_24632 - HOIST
      ?auto_24633 - SURFACE
      ?auto_24630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24628 ?auto_24629 ) ( SURFACE-AT ?auto_24626 ?auto_24629 ) ( CLEAR ?auto_24626 ) ( IS-CRATE ?auto_24627 ) ( AVAILABLE ?auto_24628 ) ( not ( = ?auto_24631 ?auto_24629 ) ) ( HOIST-AT ?auto_24632 ?auto_24631 ) ( AVAILABLE ?auto_24632 ) ( SURFACE-AT ?auto_24627 ?auto_24631 ) ( ON ?auto_24627 ?auto_24633 ) ( CLEAR ?auto_24627 ) ( TRUCK-AT ?auto_24630 ?auto_24629 ) ( not ( = ?auto_24626 ?auto_24627 ) ) ( not ( = ?auto_24626 ?auto_24633 ) ) ( not ( = ?auto_24627 ?auto_24633 ) ) ( not ( = ?auto_24628 ?auto_24632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24630 ?auto_24629 ?auto_24631 )
      ( !LIFT ?auto_24632 ?auto_24627 ?auto_24633 ?auto_24631 )
      ( !LOAD ?auto_24632 ?auto_24627 ?auto_24630 ?auto_24631 )
      ( !DRIVE ?auto_24630 ?auto_24631 ?auto_24629 )
      ( !UNLOAD ?auto_24628 ?auto_24627 ?auto_24630 ?auto_24629 )
      ( !DROP ?auto_24628 ?auto_24627 ?auto_24626 ?auto_24629 )
      ( MAKE-1CRATE-VERIFY ?auto_24626 ?auto_24627 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_24640 - SURFACE
      ?auto_24641 - SURFACE
      ?auto_24642 - SURFACE
      ?auto_24643 - SURFACE
      ?auto_24644 - SURFACE
      ?auto_24645 - SURFACE
    )
    :vars
    (
      ?auto_24650 - HOIST
      ?auto_24647 - PLACE
      ?auto_24646 - PLACE
      ?auto_24648 - HOIST
      ?auto_24651 - SURFACE
      ?auto_24658 - PLACE
      ?auto_24652 - HOIST
      ?auto_24655 - SURFACE
      ?auto_24653 - PLACE
      ?auto_24657 - HOIST
      ?auto_24659 - SURFACE
      ?auto_24656 - PLACE
      ?auto_24663 - HOIST
      ?auto_24662 - SURFACE
      ?auto_24660 - PLACE
      ?auto_24654 - HOIST
      ?auto_24661 - SURFACE
      ?auto_24649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24650 ?auto_24647 ) ( IS-CRATE ?auto_24645 ) ( not ( = ?auto_24646 ?auto_24647 ) ) ( HOIST-AT ?auto_24648 ?auto_24646 ) ( AVAILABLE ?auto_24648 ) ( SURFACE-AT ?auto_24645 ?auto_24646 ) ( ON ?auto_24645 ?auto_24651 ) ( CLEAR ?auto_24645 ) ( not ( = ?auto_24644 ?auto_24645 ) ) ( not ( = ?auto_24644 ?auto_24651 ) ) ( not ( = ?auto_24645 ?auto_24651 ) ) ( not ( = ?auto_24650 ?auto_24648 ) ) ( IS-CRATE ?auto_24644 ) ( not ( = ?auto_24658 ?auto_24647 ) ) ( HOIST-AT ?auto_24652 ?auto_24658 ) ( AVAILABLE ?auto_24652 ) ( SURFACE-AT ?auto_24644 ?auto_24658 ) ( ON ?auto_24644 ?auto_24655 ) ( CLEAR ?auto_24644 ) ( not ( = ?auto_24643 ?auto_24644 ) ) ( not ( = ?auto_24643 ?auto_24655 ) ) ( not ( = ?auto_24644 ?auto_24655 ) ) ( not ( = ?auto_24650 ?auto_24652 ) ) ( IS-CRATE ?auto_24643 ) ( not ( = ?auto_24653 ?auto_24647 ) ) ( HOIST-AT ?auto_24657 ?auto_24653 ) ( AVAILABLE ?auto_24657 ) ( SURFACE-AT ?auto_24643 ?auto_24653 ) ( ON ?auto_24643 ?auto_24659 ) ( CLEAR ?auto_24643 ) ( not ( = ?auto_24642 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24659 ) ) ( not ( = ?auto_24643 ?auto_24659 ) ) ( not ( = ?auto_24650 ?auto_24657 ) ) ( IS-CRATE ?auto_24642 ) ( not ( = ?auto_24656 ?auto_24647 ) ) ( HOIST-AT ?auto_24663 ?auto_24656 ) ( AVAILABLE ?auto_24663 ) ( SURFACE-AT ?auto_24642 ?auto_24656 ) ( ON ?auto_24642 ?auto_24662 ) ( CLEAR ?auto_24642 ) ( not ( = ?auto_24641 ?auto_24642 ) ) ( not ( = ?auto_24641 ?auto_24662 ) ) ( not ( = ?auto_24642 ?auto_24662 ) ) ( not ( = ?auto_24650 ?auto_24663 ) ) ( SURFACE-AT ?auto_24640 ?auto_24647 ) ( CLEAR ?auto_24640 ) ( IS-CRATE ?auto_24641 ) ( AVAILABLE ?auto_24650 ) ( not ( = ?auto_24660 ?auto_24647 ) ) ( HOIST-AT ?auto_24654 ?auto_24660 ) ( AVAILABLE ?auto_24654 ) ( SURFACE-AT ?auto_24641 ?auto_24660 ) ( ON ?auto_24641 ?auto_24661 ) ( CLEAR ?auto_24641 ) ( TRUCK-AT ?auto_24649 ?auto_24647 ) ( not ( = ?auto_24640 ?auto_24641 ) ) ( not ( = ?auto_24640 ?auto_24661 ) ) ( not ( = ?auto_24641 ?auto_24661 ) ) ( not ( = ?auto_24650 ?auto_24654 ) ) ( not ( = ?auto_24640 ?auto_24642 ) ) ( not ( = ?auto_24640 ?auto_24662 ) ) ( not ( = ?auto_24642 ?auto_24661 ) ) ( not ( = ?auto_24656 ?auto_24660 ) ) ( not ( = ?auto_24663 ?auto_24654 ) ) ( not ( = ?auto_24662 ?auto_24661 ) ) ( not ( = ?auto_24640 ?auto_24643 ) ) ( not ( = ?auto_24640 ?auto_24659 ) ) ( not ( = ?auto_24641 ?auto_24643 ) ) ( not ( = ?auto_24641 ?auto_24659 ) ) ( not ( = ?auto_24643 ?auto_24662 ) ) ( not ( = ?auto_24643 ?auto_24661 ) ) ( not ( = ?auto_24653 ?auto_24656 ) ) ( not ( = ?auto_24653 ?auto_24660 ) ) ( not ( = ?auto_24657 ?auto_24663 ) ) ( not ( = ?auto_24657 ?auto_24654 ) ) ( not ( = ?auto_24659 ?auto_24662 ) ) ( not ( = ?auto_24659 ?auto_24661 ) ) ( not ( = ?auto_24640 ?auto_24644 ) ) ( not ( = ?auto_24640 ?auto_24655 ) ) ( not ( = ?auto_24641 ?auto_24644 ) ) ( not ( = ?auto_24641 ?auto_24655 ) ) ( not ( = ?auto_24642 ?auto_24644 ) ) ( not ( = ?auto_24642 ?auto_24655 ) ) ( not ( = ?auto_24644 ?auto_24659 ) ) ( not ( = ?auto_24644 ?auto_24662 ) ) ( not ( = ?auto_24644 ?auto_24661 ) ) ( not ( = ?auto_24658 ?auto_24653 ) ) ( not ( = ?auto_24658 ?auto_24656 ) ) ( not ( = ?auto_24658 ?auto_24660 ) ) ( not ( = ?auto_24652 ?auto_24657 ) ) ( not ( = ?auto_24652 ?auto_24663 ) ) ( not ( = ?auto_24652 ?auto_24654 ) ) ( not ( = ?auto_24655 ?auto_24659 ) ) ( not ( = ?auto_24655 ?auto_24662 ) ) ( not ( = ?auto_24655 ?auto_24661 ) ) ( not ( = ?auto_24640 ?auto_24645 ) ) ( not ( = ?auto_24640 ?auto_24651 ) ) ( not ( = ?auto_24641 ?auto_24645 ) ) ( not ( = ?auto_24641 ?auto_24651 ) ) ( not ( = ?auto_24642 ?auto_24645 ) ) ( not ( = ?auto_24642 ?auto_24651 ) ) ( not ( = ?auto_24643 ?auto_24645 ) ) ( not ( = ?auto_24643 ?auto_24651 ) ) ( not ( = ?auto_24645 ?auto_24655 ) ) ( not ( = ?auto_24645 ?auto_24659 ) ) ( not ( = ?auto_24645 ?auto_24662 ) ) ( not ( = ?auto_24645 ?auto_24661 ) ) ( not ( = ?auto_24646 ?auto_24658 ) ) ( not ( = ?auto_24646 ?auto_24653 ) ) ( not ( = ?auto_24646 ?auto_24656 ) ) ( not ( = ?auto_24646 ?auto_24660 ) ) ( not ( = ?auto_24648 ?auto_24652 ) ) ( not ( = ?auto_24648 ?auto_24657 ) ) ( not ( = ?auto_24648 ?auto_24663 ) ) ( not ( = ?auto_24648 ?auto_24654 ) ) ( not ( = ?auto_24651 ?auto_24655 ) ) ( not ( = ?auto_24651 ?auto_24659 ) ) ( not ( = ?auto_24651 ?auto_24662 ) ) ( not ( = ?auto_24651 ?auto_24661 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_24640 ?auto_24641 ?auto_24642 ?auto_24643 ?auto_24644 )
      ( MAKE-1CRATE ?auto_24644 ?auto_24645 )
      ( MAKE-5CRATE-VERIFY ?auto_24640 ?auto_24641 ?auto_24642 ?auto_24643 ?auto_24644 ?auto_24645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24666 - SURFACE
      ?auto_24667 - SURFACE
    )
    :vars
    (
      ?auto_24668 - HOIST
      ?auto_24669 - PLACE
      ?auto_24671 - PLACE
      ?auto_24672 - HOIST
      ?auto_24673 - SURFACE
      ?auto_24670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24668 ?auto_24669 ) ( SURFACE-AT ?auto_24666 ?auto_24669 ) ( CLEAR ?auto_24666 ) ( IS-CRATE ?auto_24667 ) ( AVAILABLE ?auto_24668 ) ( not ( = ?auto_24671 ?auto_24669 ) ) ( HOIST-AT ?auto_24672 ?auto_24671 ) ( AVAILABLE ?auto_24672 ) ( SURFACE-AT ?auto_24667 ?auto_24671 ) ( ON ?auto_24667 ?auto_24673 ) ( CLEAR ?auto_24667 ) ( TRUCK-AT ?auto_24670 ?auto_24669 ) ( not ( = ?auto_24666 ?auto_24667 ) ) ( not ( = ?auto_24666 ?auto_24673 ) ) ( not ( = ?auto_24667 ?auto_24673 ) ) ( not ( = ?auto_24668 ?auto_24672 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24670 ?auto_24669 ?auto_24671 )
      ( !LIFT ?auto_24672 ?auto_24667 ?auto_24673 ?auto_24671 )
      ( !LOAD ?auto_24672 ?auto_24667 ?auto_24670 ?auto_24671 )
      ( !DRIVE ?auto_24670 ?auto_24671 ?auto_24669 )
      ( !UNLOAD ?auto_24668 ?auto_24667 ?auto_24670 ?auto_24669 )
      ( !DROP ?auto_24668 ?auto_24667 ?auto_24666 ?auto_24669 )
      ( MAKE-1CRATE-VERIFY ?auto_24666 ?auto_24667 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_24681 - SURFACE
      ?auto_24682 - SURFACE
      ?auto_24683 - SURFACE
      ?auto_24684 - SURFACE
      ?auto_24685 - SURFACE
      ?auto_24686 - SURFACE
      ?auto_24687 - SURFACE
    )
    :vars
    (
      ?auto_24688 - HOIST
      ?auto_24689 - PLACE
      ?auto_24692 - PLACE
      ?auto_24693 - HOIST
      ?auto_24691 - SURFACE
      ?auto_24697 - PLACE
      ?auto_24699 - HOIST
      ?auto_24701 - SURFACE
      ?auto_24705 - PLACE
      ?auto_24695 - HOIST
      ?auto_24700 - SURFACE
      ?auto_24696 - SURFACE
      ?auto_24702 - PLACE
      ?auto_24706 - HOIST
      ?auto_24694 - SURFACE
      ?auto_24698 - PLACE
      ?auto_24704 - HOIST
      ?auto_24703 - SURFACE
      ?auto_24690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24688 ?auto_24689 ) ( IS-CRATE ?auto_24687 ) ( not ( = ?auto_24692 ?auto_24689 ) ) ( HOIST-AT ?auto_24693 ?auto_24692 ) ( SURFACE-AT ?auto_24687 ?auto_24692 ) ( ON ?auto_24687 ?auto_24691 ) ( CLEAR ?auto_24687 ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24691 ) ) ( not ( = ?auto_24687 ?auto_24691 ) ) ( not ( = ?auto_24688 ?auto_24693 ) ) ( IS-CRATE ?auto_24686 ) ( not ( = ?auto_24697 ?auto_24689 ) ) ( HOIST-AT ?auto_24699 ?auto_24697 ) ( AVAILABLE ?auto_24699 ) ( SURFACE-AT ?auto_24686 ?auto_24697 ) ( ON ?auto_24686 ?auto_24701 ) ( CLEAR ?auto_24686 ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24701 ) ) ( not ( = ?auto_24686 ?auto_24701 ) ) ( not ( = ?auto_24688 ?auto_24699 ) ) ( IS-CRATE ?auto_24685 ) ( not ( = ?auto_24705 ?auto_24689 ) ) ( HOIST-AT ?auto_24695 ?auto_24705 ) ( AVAILABLE ?auto_24695 ) ( SURFACE-AT ?auto_24685 ?auto_24705 ) ( ON ?auto_24685 ?auto_24700 ) ( CLEAR ?auto_24685 ) ( not ( = ?auto_24684 ?auto_24685 ) ) ( not ( = ?auto_24684 ?auto_24700 ) ) ( not ( = ?auto_24685 ?auto_24700 ) ) ( not ( = ?auto_24688 ?auto_24695 ) ) ( IS-CRATE ?auto_24684 ) ( AVAILABLE ?auto_24693 ) ( SURFACE-AT ?auto_24684 ?auto_24692 ) ( ON ?auto_24684 ?auto_24696 ) ( CLEAR ?auto_24684 ) ( not ( = ?auto_24683 ?auto_24684 ) ) ( not ( = ?auto_24683 ?auto_24696 ) ) ( not ( = ?auto_24684 ?auto_24696 ) ) ( IS-CRATE ?auto_24683 ) ( not ( = ?auto_24702 ?auto_24689 ) ) ( HOIST-AT ?auto_24706 ?auto_24702 ) ( AVAILABLE ?auto_24706 ) ( SURFACE-AT ?auto_24683 ?auto_24702 ) ( ON ?auto_24683 ?auto_24694 ) ( CLEAR ?auto_24683 ) ( not ( = ?auto_24682 ?auto_24683 ) ) ( not ( = ?auto_24682 ?auto_24694 ) ) ( not ( = ?auto_24683 ?auto_24694 ) ) ( not ( = ?auto_24688 ?auto_24706 ) ) ( SURFACE-AT ?auto_24681 ?auto_24689 ) ( CLEAR ?auto_24681 ) ( IS-CRATE ?auto_24682 ) ( AVAILABLE ?auto_24688 ) ( not ( = ?auto_24698 ?auto_24689 ) ) ( HOIST-AT ?auto_24704 ?auto_24698 ) ( AVAILABLE ?auto_24704 ) ( SURFACE-AT ?auto_24682 ?auto_24698 ) ( ON ?auto_24682 ?auto_24703 ) ( CLEAR ?auto_24682 ) ( TRUCK-AT ?auto_24690 ?auto_24689 ) ( not ( = ?auto_24681 ?auto_24682 ) ) ( not ( = ?auto_24681 ?auto_24703 ) ) ( not ( = ?auto_24682 ?auto_24703 ) ) ( not ( = ?auto_24688 ?auto_24704 ) ) ( not ( = ?auto_24681 ?auto_24683 ) ) ( not ( = ?auto_24681 ?auto_24694 ) ) ( not ( = ?auto_24683 ?auto_24703 ) ) ( not ( = ?auto_24702 ?auto_24698 ) ) ( not ( = ?auto_24706 ?auto_24704 ) ) ( not ( = ?auto_24694 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24684 ) ) ( not ( = ?auto_24681 ?auto_24696 ) ) ( not ( = ?auto_24682 ?auto_24684 ) ) ( not ( = ?auto_24682 ?auto_24696 ) ) ( not ( = ?auto_24684 ?auto_24694 ) ) ( not ( = ?auto_24684 ?auto_24703 ) ) ( not ( = ?auto_24692 ?auto_24702 ) ) ( not ( = ?auto_24692 ?auto_24698 ) ) ( not ( = ?auto_24693 ?auto_24706 ) ) ( not ( = ?auto_24693 ?auto_24704 ) ) ( not ( = ?auto_24696 ?auto_24694 ) ) ( not ( = ?auto_24696 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24685 ) ) ( not ( = ?auto_24681 ?auto_24700 ) ) ( not ( = ?auto_24682 ?auto_24685 ) ) ( not ( = ?auto_24682 ?auto_24700 ) ) ( not ( = ?auto_24683 ?auto_24685 ) ) ( not ( = ?auto_24683 ?auto_24700 ) ) ( not ( = ?auto_24685 ?auto_24696 ) ) ( not ( = ?auto_24685 ?auto_24694 ) ) ( not ( = ?auto_24685 ?auto_24703 ) ) ( not ( = ?auto_24705 ?auto_24692 ) ) ( not ( = ?auto_24705 ?auto_24702 ) ) ( not ( = ?auto_24705 ?auto_24698 ) ) ( not ( = ?auto_24695 ?auto_24693 ) ) ( not ( = ?auto_24695 ?auto_24706 ) ) ( not ( = ?auto_24695 ?auto_24704 ) ) ( not ( = ?auto_24700 ?auto_24696 ) ) ( not ( = ?auto_24700 ?auto_24694 ) ) ( not ( = ?auto_24700 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24686 ) ) ( not ( = ?auto_24681 ?auto_24701 ) ) ( not ( = ?auto_24682 ?auto_24686 ) ) ( not ( = ?auto_24682 ?auto_24701 ) ) ( not ( = ?auto_24683 ?auto_24686 ) ) ( not ( = ?auto_24683 ?auto_24701 ) ) ( not ( = ?auto_24684 ?auto_24686 ) ) ( not ( = ?auto_24684 ?auto_24701 ) ) ( not ( = ?auto_24686 ?auto_24700 ) ) ( not ( = ?auto_24686 ?auto_24696 ) ) ( not ( = ?auto_24686 ?auto_24694 ) ) ( not ( = ?auto_24686 ?auto_24703 ) ) ( not ( = ?auto_24697 ?auto_24705 ) ) ( not ( = ?auto_24697 ?auto_24692 ) ) ( not ( = ?auto_24697 ?auto_24702 ) ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24699 ?auto_24695 ) ) ( not ( = ?auto_24699 ?auto_24693 ) ) ( not ( = ?auto_24699 ?auto_24706 ) ) ( not ( = ?auto_24699 ?auto_24704 ) ) ( not ( = ?auto_24701 ?auto_24700 ) ) ( not ( = ?auto_24701 ?auto_24696 ) ) ( not ( = ?auto_24701 ?auto_24694 ) ) ( not ( = ?auto_24701 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24687 ) ) ( not ( = ?auto_24681 ?auto_24691 ) ) ( not ( = ?auto_24682 ?auto_24687 ) ) ( not ( = ?auto_24682 ?auto_24691 ) ) ( not ( = ?auto_24683 ?auto_24687 ) ) ( not ( = ?auto_24683 ?auto_24691 ) ) ( not ( = ?auto_24684 ?auto_24687 ) ) ( not ( = ?auto_24684 ?auto_24691 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24691 ) ) ( not ( = ?auto_24687 ?auto_24701 ) ) ( not ( = ?auto_24687 ?auto_24700 ) ) ( not ( = ?auto_24687 ?auto_24696 ) ) ( not ( = ?auto_24687 ?auto_24694 ) ) ( not ( = ?auto_24687 ?auto_24703 ) ) ( not ( = ?auto_24691 ?auto_24701 ) ) ( not ( = ?auto_24691 ?auto_24700 ) ) ( not ( = ?auto_24691 ?auto_24696 ) ) ( not ( = ?auto_24691 ?auto_24694 ) ) ( not ( = ?auto_24691 ?auto_24703 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_24681 ?auto_24682 ?auto_24683 ?auto_24684 ?auto_24685 ?auto_24686 )
      ( MAKE-1CRATE ?auto_24686 ?auto_24687 )
      ( MAKE-6CRATE-VERIFY ?auto_24681 ?auto_24682 ?auto_24683 ?auto_24684 ?auto_24685 ?auto_24686 ?auto_24687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24709 - SURFACE
      ?auto_24710 - SURFACE
    )
    :vars
    (
      ?auto_24711 - HOIST
      ?auto_24712 - PLACE
      ?auto_24714 - PLACE
      ?auto_24715 - HOIST
      ?auto_24716 - SURFACE
      ?auto_24713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24711 ?auto_24712 ) ( SURFACE-AT ?auto_24709 ?auto_24712 ) ( CLEAR ?auto_24709 ) ( IS-CRATE ?auto_24710 ) ( AVAILABLE ?auto_24711 ) ( not ( = ?auto_24714 ?auto_24712 ) ) ( HOIST-AT ?auto_24715 ?auto_24714 ) ( AVAILABLE ?auto_24715 ) ( SURFACE-AT ?auto_24710 ?auto_24714 ) ( ON ?auto_24710 ?auto_24716 ) ( CLEAR ?auto_24710 ) ( TRUCK-AT ?auto_24713 ?auto_24712 ) ( not ( = ?auto_24709 ?auto_24710 ) ) ( not ( = ?auto_24709 ?auto_24716 ) ) ( not ( = ?auto_24710 ?auto_24716 ) ) ( not ( = ?auto_24711 ?auto_24715 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24713 ?auto_24712 ?auto_24714 )
      ( !LIFT ?auto_24715 ?auto_24710 ?auto_24716 ?auto_24714 )
      ( !LOAD ?auto_24715 ?auto_24710 ?auto_24713 ?auto_24714 )
      ( !DRIVE ?auto_24713 ?auto_24714 ?auto_24712 )
      ( !UNLOAD ?auto_24711 ?auto_24710 ?auto_24713 ?auto_24712 )
      ( !DROP ?auto_24711 ?auto_24710 ?auto_24709 ?auto_24712 )
      ( MAKE-1CRATE-VERIFY ?auto_24709 ?auto_24710 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_24725 - SURFACE
      ?auto_24726 - SURFACE
      ?auto_24727 - SURFACE
      ?auto_24728 - SURFACE
      ?auto_24729 - SURFACE
      ?auto_24730 - SURFACE
      ?auto_24731 - SURFACE
      ?auto_24732 - SURFACE
    )
    :vars
    (
      ?auto_24738 - HOIST
      ?auto_24737 - PLACE
      ?auto_24736 - PLACE
      ?auto_24735 - HOIST
      ?auto_24733 - SURFACE
      ?auto_24749 - PLACE
      ?auto_24748 - HOIST
      ?auto_24739 - SURFACE
      ?auto_24750 - PLACE
      ?auto_24752 - HOIST
      ?auto_24746 - SURFACE
      ?auto_24740 - PLACE
      ?auto_24754 - HOIST
      ?auto_24751 - SURFACE
      ?auto_24747 - SURFACE
      ?auto_24744 - PLACE
      ?auto_24741 - HOIST
      ?auto_24745 - SURFACE
      ?auto_24753 - PLACE
      ?auto_24743 - HOIST
      ?auto_24742 - SURFACE
      ?auto_24734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24738 ?auto_24737 ) ( IS-CRATE ?auto_24732 ) ( not ( = ?auto_24736 ?auto_24737 ) ) ( HOIST-AT ?auto_24735 ?auto_24736 ) ( AVAILABLE ?auto_24735 ) ( SURFACE-AT ?auto_24732 ?auto_24736 ) ( ON ?auto_24732 ?auto_24733 ) ( CLEAR ?auto_24732 ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24733 ) ) ( not ( = ?auto_24738 ?auto_24735 ) ) ( IS-CRATE ?auto_24731 ) ( not ( = ?auto_24749 ?auto_24737 ) ) ( HOIST-AT ?auto_24748 ?auto_24749 ) ( SURFACE-AT ?auto_24731 ?auto_24749 ) ( ON ?auto_24731 ?auto_24739 ) ( CLEAR ?auto_24731 ) ( not ( = ?auto_24730 ?auto_24731 ) ) ( not ( = ?auto_24730 ?auto_24739 ) ) ( not ( = ?auto_24731 ?auto_24739 ) ) ( not ( = ?auto_24738 ?auto_24748 ) ) ( IS-CRATE ?auto_24730 ) ( not ( = ?auto_24750 ?auto_24737 ) ) ( HOIST-AT ?auto_24752 ?auto_24750 ) ( AVAILABLE ?auto_24752 ) ( SURFACE-AT ?auto_24730 ?auto_24750 ) ( ON ?auto_24730 ?auto_24746 ) ( CLEAR ?auto_24730 ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24746 ) ) ( not ( = ?auto_24730 ?auto_24746 ) ) ( not ( = ?auto_24738 ?auto_24752 ) ) ( IS-CRATE ?auto_24729 ) ( not ( = ?auto_24740 ?auto_24737 ) ) ( HOIST-AT ?auto_24754 ?auto_24740 ) ( AVAILABLE ?auto_24754 ) ( SURFACE-AT ?auto_24729 ?auto_24740 ) ( ON ?auto_24729 ?auto_24751 ) ( CLEAR ?auto_24729 ) ( not ( = ?auto_24728 ?auto_24729 ) ) ( not ( = ?auto_24728 ?auto_24751 ) ) ( not ( = ?auto_24729 ?auto_24751 ) ) ( not ( = ?auto_24738 ?auto_24754 ) ) ( IS-CRATE ?auto_24728 ) ( AVAILABLE ?auto_24748 ) ( SURFACE-AT ?auto_24728 ?auto_24749 ) ( ON ?auto_24728 ?auto_24747 ) ( CLEAR ?auto_24728 ) ( not ( = ?auto_24727 ?auto_24728 ) ) ( not ( = ?auto_24727 ?auto_24747 ) ) ( not ( = ?auto_24728 ?auto_24747 ) ) ( IS-CRATE ?auto_24727 ) ( not ( = ?auto_24744 ?auto_24737 ) ) ( HOIST-AT ?auto_24741 ?auto_24744 ) ( AVAILABLE ?auto_24741 ) ( SURFACE-AT ?auto_24727 ?auto_24744 ) ( ON ?auto_24727 ?auto_24745 ) ( CLEAR ?auto_24727 ) ( not ( = ?auto_24726 ?auto_24727 ) ) ( not ( = ?auto_24726 ?auto_24745 ) ) ( not ( = ?auto_24727 ?auto_24745 ) ) ( not ( = ?auto_24738 ?auto_24741 ) ) ( SURFACE-AT ?auto_24725 ?auto_24737 ) ( CLEAR ?auto_24725 ) ( IS-CRATE ?auto_24726 ) ( AVAILABLE ?auto_24738 ) ( not ( = ?auto_24753 ?auto_24737 ) ) ( HOIST-AT ?auto_24743 ?auto_24753 ) ( AVAILABLE ?auto_24743 ) ( SURFACE-AT ?auto_24726 ?auto_24753 ) ( ON ?auto_24726 ?auto_24742 ) ( CLEAR ?auto_24726 ) ( TRUCK-AT ?auto_24734 ?auto_24737 ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24742 ) ) ( not ( = ?auto_24726 ?auto_24742 ) ) ( not ( = ?auto_24738 ?auto_24743 ) ) ( not ( = ?auto_24725 ?auto_24727 ) ) ( not ( = ?auto_24725 ?auto_24745 ) ) ( not ( = ?auto_24727 ?auto_24742 ) ) ( not ( = ?auto_24744 ?auto_24753 ) ) ( not ( = ?auto_24741 ?auto_24743 ) ) ( not ( = ?auto_24745 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24728 ) ) ( not ( = ?auto_24725 ?auto_24747 ) ) ( not ( = ?auto_24726 ?auto_24728 ) ) ( not ( = ?auto_24726 ?auto_24747 ) ) ( not ( = ?auto_24728 ?auto_24745 ) ) ( not ( = ?auto_24728 ?auto_24742 ) ) ( not ( = ?auto_24749 ?auto_24744 ) ) ( not ( = ?auto_24749 ?auto_24753 ) ) ( not ( = ?auto_24748 ?auto_24741 ) ) ( not ( = ?auto_24748 ?auto_24743 ) ) ( not ( = ?auto_24747 ?auto_24745 ) ) ( not ( = ?auto_24747 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24729 ) ) ( not ( = ?auto_24725 ?auto_24751 ) ) ( not ( = ?auto_24726 ?auto_24729 ) ) ( not ( = ?auto_24726 ?auto_24751 ) ) ( not ( = ?auto_24727 ?auto_24729 ) ) ( not ( = ?auto_24727 ?auto_24751 ) ) ( not ( = ?auto_24729 ?auto_24747 ) ) ( not ( = ?auto_24729 ?auto_24745 ) ) ( not ( = ?auto_24729 ?auto_24742 ) ) ( not ( = ?auto_24740 ?auto_24749 ) ) ( not ( = ?auto_24740 ?auto_24744 ) ) ( not ( = ?auto_24740 ?auto_24753 ) ) ( not ( = ?auto_24754 ?auto_24748 ) ) ( not ( = ?auto_24754 ?auto_24741 ) ) ( not ( = ?auto_24754 ?auto_24743 ) ) ( not ( = ?auto_24751 ?auto_24747 ) ) ( not ( = ?auto_24751 ?auto_24745 ) ) ( not ( = ?auto_24751 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24730 ) ) ( not ( = ?auto_24725 ?auto_24746 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24726 ?auto_24746 ) ) ( not ( = ?auto_24727 ?auto_24730 ) ) ( not ( = ?auto_24727 ?auto_24746 ) ) ( not ( = ?auto_24728 ?auto_24730 ) ) ( not ( = ?auto_24728 ?auto_24746 ) ) ( not ( = ?auto_24730 ?auto_24751 ) ) ( not ( = ?auto_24730 ?auto_24747 ) ) ( not ( = ?auto_24730 ?auto_24745 ) ) ( not ( = ?auto_24730 ?auto_24742 ) ) ( not ( = ?auto_24750 ?auto_24740 ) ) ( not ( = ?auto_24750 ?auto_24749 ) ) ( not ( = ?auto_24750 ?auto_24744 ) ) ( not ( = ?auto_24750 ?auto_24753 ) ) ( not ( = ?auto_24752 ?auto_24754 ) ) ( not ( = ?auto_24752 ?auto_24748 ) ) ( not ( = ?auto_24752 ?auto_24741 ) ) ( not ( = ?auto_24752 ?auto_24743 ) ) ( not ( = ?auto_24746 ?auto_24751 ) ) ( not ( = ?auto_24746 ?auto_24747 ) ) ( not ( = ?auto_24746 ?auto_24745 ) ) ( not ( = ?auto_24746 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24731 ) ) ( not ( = ?auto_24725 ?auto_24739 ) ) ( not ( = ?auto_24726 ?auto_24731 ) ) ( not ( = ?auto_24726 ?auto_24739 ) ) ( not ( = ?auto_24727 ?auto_24731 ) ) ( not ( = ?auto_24727 ?auto_24739 ) ) ( not ( = ?auto_24728 ?auto_24731 ) ) ( not ( = ?auto_24728 ?auto_24739 ) ) ( not ( = ?auto_24729 ?auto_24731 ) ) ( not ( = ?auto_24729 ?auto_24739 ) ) ( not ( = ?auto_24731 ?auto_24746 ) ) ( not ( = ?auto_24731 ?auto_24751 ) ) ( not ( = ?auto_24731 ?auto_24747 ) ) ( not ( = ?auto_24731 ?auto_24745 ) ) ( not ( = ?auto_24731 ?auto_24742 ) ) ( not ( = ?auto_24739 ?auto_24746 ) ) ( not ( = ?auto_24739 ?auto_24751 ) ) ( not ( = ?auto_24739 ?auto_24747 ) ) ( not ( = ?auto_24739 ?auto_24745 ) ) ( not ( = ?auto_24739 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24732 ) ) ( not ( = ?auto_24725 ?auto_24733 ) ) ( not ( = ?auto_24726 ?auto_24732 ) ) ( not ( = ?auto_24726 ?auto_24733 ) ) ( not ( = ?auto_24727 ?auto_24732 ) ) ( not ( = ?auto_24727 ?auto_24733 ) ) ( not ( = ?auto_24728 ?auto_24732 ) ) ( not ( = ?auto_24728 ?auto_24733 ) ) ( not ( = ?auto_24729 ?auto_24732 ) ) ( not ( = ?auto_24729 ?auto_24733 ) ) ( not ( = ?auto_24730 ?auto_24732 ) ) ( not ( = ?auto_24730 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24739 ) ) ( not ( = ?auto_24732 ?auto_24746 ) ) ( not ( = ?auto_24732 ?auto_24751 ) ) ( not ( = ?auto_24732 ?auto_24747 ) ) ( not ( = ?auto_24732 ?auto_24745 ) ) ( not ( = ?auto_24732 ?auto_24742 ) ) ( not ( = ?auto_24736 ?auto_24749 ) ) ( not ( = ?auto_24736 ?auto_24750 ) ) ( not ( = ?auto_24736 ?auto_24740 ) ) ( not ( = ?auto_24736 ?auto_24744 ) ) ( not ( = ?auto_24736 ?auto_24753 ) ) ( not ( = ?auto_24735 ?auto_24748 ) ) ( not ( = ?auto_24735 ?auto_24752 ) ) ( not ( = ?auto_24735 ?auto_24754 ) ) ( not ( = ?auto_24735 ?auto_24741 ) ) ( not ( = ?auto_24735 ?auto_24743 ) ) ( not ( = ?auto_24733 ?auto_24739 ) ) ( not ( = ?auto_24733 ?auto_24746 ) ) ( not ( = ?auto_24733 ?auto_24751 ) ) ( not ( = ?auto_24733 ?auto_24747 ) ) ( not ( = ?auto_24733 ?auto_24745 ) ) ( not ( = ?auto_24733 ?auto_24742 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_24725 ?auto_24726 ?auto_24727 ?auto_24728 ?auto_24729 ?auto_24730 ?auto_24731 )
      ( MAKE-1CRATE ?auto_24731 ?auto_24732 )
      ( MAKE-7CRATE-VERIFY ?auto_24725 ?auto_24726 ?auto_24727 ?auto_24728 ?auto_24729 ?auto_24730 ?auto_24731 ?auto_24732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24757 - SURFACE
      ?auto_24758 - SURFACE
    )
    :vars
    (
      ?auto_24759 - HOIST
      ?auto_24760 - PLACE
      ?auto_24762 - PLACE
      ?auto_24763 - HOIST
      ?auto_24764 - SURFACE
      ?auto_24761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24759 ?auto_24760 ) ( SURFACE-AT ?auto_24757 ?auto_24760 ) ( CLEAR ?auto_24757 ) ( IS-CRATE ?auto_24758 ) ( AVAILABLE ?auto_24759 ) ( not ( = ?auto_24762 ?auto_24760 ) ) ( HOIST-AT ?auto_24763 ?auto_24762 ) ( AVAILABLE ?auto_24763 ) ( SURFACE-AT ?auto_24758 ?auto_24762 ) ( ON ?auto_24758 ?auto_24764 ) ( CLEAR ?auto_24758 ) ( TRUCK-AT ?auto_24761 ?auto_24760 ) ( not ( = ?auto_24757 ?auto_24758 ) ) ( not ( = ?auto_24757 ?auto_24764 ) ) ( not ( = ?auto_24758 ?auto_24764 ) ) ( not ( = ?auto_24759 ?auto_24763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24761 ?auto_24760 ?auto_24762 )
      ( !LIFT ?auto_24763 ?auto_24758 ?auto_24764 ?auto_24762 )
      ( !LOAD ?auto_24763 ?auto_24758 ?auto_24761 ?auto_24762 )
      ( !DRIVE ?auto_24761 ?auto_24762 ?auto_24760 )
      ( !UNLOAD ?auto_24759 ?auto_24758 ?auto_24761 ?auto_24760 )
      ( !DROP ?auto_24759 ?auto_24758 ?auto_24757 ?auto_24760 )
      ( MAKE-1CRATE-VERIFY ?auto_24757 ?auto_24758 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_24774 - SURFACE
      ?auto_24775 - SURFACE
      ?auto_24776 - SURFACE
      ?auto_24777 - SURFACE
      ?auto_24778 - SURFACE
      ?auto_24779 - SURFACE
      ?auto_24780 - SURFACE
      ?auto_24782 - SURFACE
      ?auto_24781 - SURFACE
    )
    :vars
    (
      ?auto_24786 - HOIST
      ?auto_24788 - PLACE
      ?auto_24784 - PLACE
      ?auto_24783 - HOIST
      ?auto_24787 - SURFACE
      ?auto_24804 - SURFACE
      ?auto_24793 - PLACE
      ?auto_24794 - HOIST
      ?auto_24790 - SURFACE
      ?auto_24795 - PLACE
      ?auto_24799 - HOIST
      ?auto_24800 - SURFACE
      ?auto_24796 - PLACE
      ?auto_24791 - HOIST
      ?auto_24798 - SURFACE
      ?auto_24792 - SURFACE
      ?auto_24802 - PLACE
      ?auto_24797 - HOIST
      ?auto_24801 - SURFACE
      ?auto_24789 - PLACE
      ?auto_24803 - HOIST
      ?auto_24805 - SURFACE
      ?auto_24785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24786 ?auto_24788 ) ( IS-CRATE ?auto_24781 ) ( not ( = ?auto_24784 ?auto_24788 ) ) ( HOIST-AT ?auto_24783 ?auto_24784 ) ( SURFACE-AT ?auto_24781 ?auto_24784 ) ( ON ?auto_24781 ?auto_24787 ) ( CLEAR ?auto_24781 ) ( not ( = ?auto_24782 ?auto_24781 ) ) ( not ( = ?auto_24782 ?auto_24787 ) ) ( not ( = ?auto_24781 ?auto_24787 ) ) ( not ( = ?auto_24786 ?auto_24783 ) ) ( IS-CRATE ?auto_24782 ) ( AVAILABLE ?auto_24783 ) ( SURFACE-AT ?auto_24782 ?auto_24784 ) ( ON ?auto_24782 ?auto_24804 ) ( CLEAR ?auto_24782 ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24804 ) ) ( not ( = ?auto_24782 ?auto_24804 ) ) ( IS-CRATE ?auto_24780 ) ( not ( = ?auto_24793 ?auto_24788 ) ) ( HOIST-AT ?auto_24794 ?auto_24793 ) ( SURFACE-AT ?auto_24780 ?auto_24793 ) ( ON ?auto_24780 ?auto_24790 ) ( CLEAR ?auto_24780 ) ( not ( = ?auto_24779 ?auto_24780 ) ) ( not ( = ?auto_24779 ?auto_24790 ) ) ( not ( = ?auto_24780 ?auto_24790 ) ) ( not ( = ?auto_24786 ?auto_24794 ) ) ( IS-CRATE ?auto_24779 ) ( not ( = ?auto_24795 ?auto_24788 ) ) ( HOIST-AT ?auto_24799 ?auto_24795 ) ( AVAILABLE ?auto_24799 ) ( SURFACE-AT ?auto_24779 ?auto_24795 ) ( ON ?auto_24779 ?auto_24800 ) ( CLEAR ?auto_24779 ) ( not ( = ?auto_24778 ?auto_24779 ) ) ( not ( = ?auto_24778 ?auto_24800 ) ) ( not ( = ?auto_24779 ?auto_24800 ) ) ( not ( = ?auto_24786 ?auto_24799 ) ) ( IS-CRATE ?auto_24778 ) ( not ( = ?auto_24796 ?auto_24788 ) ) ( HOIST-AT ?auto_24791 ?auto_24796 ) ( AVAILABLE ?auto_24791 ) ( SURFACE-AT ?auto_24778 ?auto_24796 ) ( ON ?auto_24778 ?auto_24798 ) ( CLEAR ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24778 ) ) ( not ( = ?auto_24777 ?auto_24798 ) ) ( not ( = ?auto_24778 ?auto_24798 ) ) ( not ( = ?auto_24786 ?auto_24791 ) ) ( IS-CRATE ?auto_24777 ) ( AVAILABLE ?auto_24794 ) ( SURFACE-AT ?auto_24777 ?auto_24793 ) ( ON ?auto_24777 ?auto_24792 ) ( CLEAR ?auto_24777 ) ( not ( = ?auto_24776 ?auto_24777 ) ) ( not ( = ?auto_24776 ?auto_24792 ) ) ( not ( = ?auto_24777 ?auto_24792 ) ) ( IS-CRATE ?auto_24776 ) ( not ( = ?auto_24802 ?auto_24788 ) ) ( HOIST-AT ?auto_24797 ?auto_24802 ) ( AVAILABLE ?auto_24797 ) ( SURFACE-AT ?auto_24776 ?auto_24802 ) ( ON ?auto_24776 ?auto_24801 ) ( CLEAR ?auto_24776 ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24801 ) ) ( not ( = ?auto_24776 ?auto_24801 ) ) ( not ( = ?auto_24786 ?auto_24797 ) ) ( SURFACE-AT ?auto_24774 ?auto_24788 ) ( CLEAR ?auto_24774 ) ( IS-CRATE ?auto_24775 ) ( AVAILABLE ?auto_24786 ) ( not ( = ?auto_24789 ?auto_24788 ) ) ( HOIST-AT ?auto_24803 ?auto_24789 ) ( AVAILABLE ?auto_24803 ) ( SURFACE-AT ?auto_24775 ?auto_24789 ) ( ON ?auto_24775 ?auto_24805 ) ( CLEAR ?auto_24775 ) ( TRUCK-AT ?auto_24785 ?auto_24788 ) ( not ( = ?auto_24774 ?auto_24775 ) ) ( not ( = ?auto_24774 ?auto_24805 ) ) ( not ( = ?auto_24775 ?auto_24805 ) ) ( not ( = ?auto_24786 ?auto_24803 ) ) ( not ( = ?auto_24774 ?auto_24776 ) ) ( not ( = ?auto_24774 ?auto_24801 ) ) ( not ( = ?auto_24776 ?auto_24805 ) ) ( not ( = ?auto_24802 ?auto_24789 ) ) ( not ( = ?auto_24797 ?auto_24803 ) ) ( not ( = ?auto_24801 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24777 ) ) ( not ( = ?auto_24774 ?auto_24792 ) ) ( not ( = ?auto_24775 ?auto_24777 ) ) ( not ( = ?auto_24775 ?auto_24792 ) ) ( not ( = ?auto_24777 ?auto_24801 ) ) ( not ( = ?auto_24777 ?auto_24805 ) ) ( not ( = ?auto_24793 ?auto_24802 ) ) ( not ( = ?auto_24793 ?auto_24789 ) ) ( not ( = ?auto_24794 ?auto_24797 ) ) ( not ( = ?auto_24794 ?auto_24803 ) ) ( not ( = ?auto_24792 ?auto_24801 ) ) ( not ( = ?auto_24792 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24778 ) ) ( not ( = ?auto_24774 ?auto_24798 ) ) ( not ( = ?auto_24775 ?auto_24778 ) ) ( not ( = ?auto_24775 ?auto_24798 ) ) ( not ( = ?auto_24776 ?auto_24778 ) ) ( not ( = ?auto_24776 ?auto_24798 ) ) ( not ( = ?auto_24778 ?auto_24792 ) ) ( not ( = ?auto_24778 ?auto_24801 ) ) ( not ( = ?auto_24778 ?auto_24805 ) ) ( not ( = ?auto_24796 ?auto_24793 ) ) ( not ( = ?auto_24796 ?auto_24802 ) ) ( not ( = ?auto_24796 ?auto_24789 ) ) ( not ( = ?auto_24791 ?auto_24794 ) ) ( not ( = ?auto_24791 ?auto_24797 ) ) ( not ( = ?auto_24791 ?auto_24803 ) ) ( not ( = ?auto_24798 ?auto_24792 ) ) ( not ( = ?auto_24798 ?auto_24801 ) ) ( not ( = ?auto_24798 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24779 ) ) ( not ( = ?auto_24774 ?auto_24800 ) ) ( not ( = ?auto_24775 ?auto_24779 ) ) ( not ( = ?auto_24775 ?auto_24800 ) ) ( not ( = ?auto_24776 ?auto_24779 ) ) ( not ( = ?auto_24776 ?auto_24800 ) ) ( not ( = ?auto_24777 ?auto_24779 ) ) ( not ( = ?auto_24777 ?auto_24800 ) ) ( not ( = ?auto_24779 ?auto_24798 ) ) ( not ( = ?auto_24779 ?auto_24792 ) ) ( not ( = ?auto_24779 ?auto_24801 ) ) ( not ( = ?auto_24779 ?auto_24805 ) ) ( not ( = ?auto_24795 ?auto_24796 ) ) ( not ( = ?auto_24795 ?auto_24793 ) ) ( not ( = ?auto_24795 ?auto_24802 ) ) ( not ( = ?auto_24795 ?auto_24789 ) ) ( not ( = ?auto_24799 ?auto_24791 ) ) ( not ( = ?auto_24799 ?auto_24794 ) ) ( not ( = ?auto_24799 ?auto_24797 ) ) ( not ( = ?auto_24799 ?auto_24803 ) ) ( not ( = ?auto_24800 ?auto_24798 ) ) ( not ( = ?auto_24800 ?auto_24792 ) ) ( not ( = ?auto_24800 ?auto_24801 ) ) ( not ( = ?auto_24800 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24780 ) ) ( not ( = ?auto_24774 ?auto_24790 ) ) ( not ( = ?auto_24775 ?auto_24780 ) ) ( not ( = ?auto_24775 ?auto_24790 ) ) ( not ( = ?auto_24776 ?auto_24780 ) ) ( not ( = ?auto_24776 ?auto_24790 ) ) ( not ( = ?auto_24777 ?auto_24780 ) ) ( not ( = ?auto_24777 ?auto_24790 ) ) ( not ( = ?auto_24778 ?auto_24780 ) ) ( not ( = ?auto_24778 ?auto_24790 ) ) ( not ( = ?auto_24780 ?auto_24800 ) ) ( not ( = ?auto_24780 ?auto_24798 ) ) ( not ( = ?auto_24780 ?auto_24792 ) ) ( not ( = ?auto_24780 ?auto_24801 ) ) ( not ( = ?auto_24780 ?auto_24805 ) ) ( not ( = ?auto_24790 ?auto_24800 ) ) ( not ( = ?auto_24790 ?auto_24798 ) ) ( not ( = ?auto_24790 ?auto_24792 ) ) ( not ( = ?auto_24790 ?auto_24801 ) ) ( not ( = ?auto_24790 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24782 ) ) ( not ( = ?auto_24774 ?auto_24804 ) ) ( not ( = ?auto_24775 ?auto_24782 ) ) ( not ( = ?auto_24775 ?auto_24804 ) ) ( not ( = ?auto_24776 ?auto_24782 ) ) ( not ( = ?auto_24776 ?auto_24804 ) ) ( not ( = ?auto_24777 ?auto_24782 ) ) ( not ( = ?auto_24777 ?auto_24804 ) ) ( not ( = ?auto_24778 ?auto_24782 ) ) ( not ( = ?auto_24778 ?auto_24804 ) ) ( not ( = ?auto_24779 ?auto_24782 ) ) ( not ( = ?auto_24779 ?auto_24804 ) ) ( not ( = ?auto_24782 ?auto_24790 ) ) ( not ( = ?auto_24782 ?auto_24800 ) ) ( not ( = ?auto_24782 ?auto_24798 ) ) ( not ( = ?auto_24782 ?auto_24792 ) ) ( not ( = ?auto_24782 ?auto_24801 ) ) ( not ( = ?auto_24782 ?auto_24805 ) ) ( not ( = ?auto_24784 ?auto_24793 ) ) ( not ( = ?auto_24784 ?auto_24795 ) ) ( not ( = ?auto_24784 ?auto_24796 ) ) ( not ( = ?auto_24784 ?auto_24802 ) ) ( not ( = ?auto_24784 ?auto_24789 ) ) ( not ( = ?auto_24783 ?auto_24794 ) ) ( not ( = ?auto_24783 ?auto_24799 ) ) ( not ( = ?auto_24783 ?auto_24791 ) ) ( not ( = ?auto_24783 ?auto_24797 ) ) ( not ( = ?auto_24783 ?auto_24803 ) ) ( not ( = ?auto_24804 ?auto_24790 ) ) ( not ( = ?auto_24804 ?auto_24800 ) ) ( not ( = ?auto_24804 ?auto_24798 ) ) ( not ( = ?auto_24804 ?auto_24792 ) ) ( not ( = ?auto_24804 ?auto_24801 ) ) ( not ( = ?auto_24804 ?auto_24805 ) ) ( not ( = ?auto_24774 ?auto_24781 ) ) ( not ( = ?auto_24774 ?auto_24787 ) ) ( not ( = ?auto_24775 ?auto_24781 ) ) ( not ( = ?auto_24775 ?auto_24787 ) ) ( not ( = ?auto_24776 ?auto_24781 ) ) ( not ( = ?auto_24776 ?auto_24787 ) ) ( not ( = ?auto_24777 ?auto_24781 ) ) ( not ( = ?auto_24777 ?auto_24787 ) ) ( not ( = ?auto_24778 ?auto_24781 ) ) ( not ( = ?auto_24778 ?auto_24787 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24787 ) ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24787 ) ) ( not ( = ?auto_24781 ?auto_24804 ) ) ( not ( = ?auto_24781 ?auto_24790 ) ) ( not ( = ?auto_24781 ?auto_24800 ) ) ( not ( = ?auto_24781 ?auto_24798 ) ) ( not ( = ?auto_24781 ?auto_24792 ) ) ( not ( = ?auto_24781 ?auto_24801 ) ) ( not ( = ?auto_24781 ?auto_24805 ) ) ( not ( = ?auto_24787 ?auto_24804 ) ) ( not ( = ?auto_24787 ?auto_24790 ) ) ( not ( = ?auto_24787 ?auto_24800 ) ) ( not ( = ?auto_24787 ?auto_24798 ) ) ( not ( = ?auto_24787 ?auto_24792 ) ) ( not ( = ?auto_24787 ?auto_24801 ) ) ( not ( = ?auto_24787 ?auto_24805 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_24774 ?auto_24775 ?auto_24776 ?auto_24777 ?auto_24778 ?auto_24779 ?auto_24780 ?auto_24782 )
      ( MAKE-1CRATE ?auto_24782 ?auto_24781 )
      ( MAKE-8CRATE-VERIFY ?auto_24774 ?auto_24775 ?auto_24776 ?auto_24777 ?auto_24778 ?auto_24779 ?auto_24780 ?auto_24782 ?auto_24781 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24808 - SURFACE
      ?auto_24809 - SURFACE
    )
    :vars
    (
      ?auto_24810 - HOIST
      ?auto_24811 - PLACE
      ?auto_24813 - PLACE
      ?auto_24814 - HOIST
      ?auto_24815 - SURFACE
      ?auto_24812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24810 ?auto_24811 ) ( SURFACE-AT ?auto_24808 ?auto_24811 ) ( CLEAR ?auto_24808 ) ( IS-CRATE ?auto_24809 ) ( AVAILABLE ?auto_24810 ) ( not ( = ?auto_24813 ?auto_24811 ) ) ( HOIST-AT ?auto_24814 ?auto_24813 ) ( AVAILABLE ?auto_24814 ) ( SURFACE-AT ?auto_24809 ?auto_24813 ) ( ON ?auto_24809 ?auto_24815 ) ( CLEAR ?auto_24809 ) ( TRUCK-AT ?auto_24812 ?auto_24811 ) ( not ( = ?auto_24808 ?auto_24809 ) ) ( not ( = ?auto_24808 ?auto_24815 ) ) ( not ( = ?auto_24809 ?auto_24815 ) ) ( not ( = ?auto_24810 ?auto_24814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24812 ?auto_24811 ?auto_24813 )
      ( !LIFT ?auto_24814 ?auto_24809 ?auto_24815 ?auto_24813 )
      ( !LOAD ?auto_24814 ?auto_24809 ?auto_24812 ?auto_24813 )
      ( !DRIVE ?auto_24812 ?auto_24813 ?auto_24811 )
      ( !UNLOAD ?auto_24810 ?auto_24809 ?auto_24812 ?auto_24811 )
      ( !DROP ?auto_24810 ?auto_24809 ?auto_24808 ?auto_24811 )
      ( MAKE-1CRATE-VERIFY ?auto_24808 ?auto_24809 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_24826 - SURFACE
      ?auto_24827 - SURFACE
      ?auto_24828 - SURFACE
      ?auto_24829 - SURFACE
      ?auto_24830 - SURFACE
      ?auto_24831 - SURFACE
      ?auto_24832 - SURFACE
      ?auto_24835 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24833 - SURFACE
    )
    :vars
    (
      ?auto_24840 - HOIST
      ?auto_24837 - PLACE
      ?auto_24836 - PLACE
      ?auto_24841 - HOIST
      ?auto_24838 - SURFACE
      ?auto_24846 - PLACE
      ?auto_24847 - HOIST
      ?auto_24845 - SURFACE
      ?auto_24850 - SURFACE
      ?auto_24843 - PLACE
      ?auto_24842 - HOIST
      ?auto_24859 - SURFACE
      ?auto_24858 - PLACE
      ?auto_24852 - HOIST
      ?auto_24854 - SURFACE
      ?auto_24857 - PLACE
      ?auto_24848 - HOIST
      ?auto_24853 - SURFACE
      ?auto_24844 - SURFACE
      ?auto_24856 - PLACE
      ?auto_24851 - HOIST
      ?auto_24855 - SURFACE
      ?auto_24849 - SURFACE
      ?auto_24839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24840 ?auto_24837 ) ( IS-CRATE ?auto_24833 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( HOIST-AT ?auto_24841 ?auto_24836 ) ( SURFACE-AT ?auto_24833 ?auto_24836 ) ( ON ?auto_24833 ?auto_24838 ) ( CLEAR ?auto_24833 ) ( not ( = ?auto_24834 ?auto_24833 ) ) ( not ( = ?auto_24834 ?auto_24838 ) ) ( not ( = ?auto_24833 ?auto_24838 ) ) ( not ( = ?auto_24840 ?auto_24841 ) ) ( IS-CRATE ?auto_24834 ) ( not ( = ?auto_24846 ?auto_24837 ) ) ( HOIST-AT ?auto_24847 ?auto_24846 ) ( SURFACE-AT ?auto_24834 ?auto_24846 ) ( ON ?auto_24834 ?auto_24845 ) ( CLEAR ?auto_24834 ) ( not ( = ?auto_24835 ?auto_24834 ) ) ( not ( = ?auto_24835 ?auto_24845 ) ) ( not ( = ?auto_24834 ?auto_24845 ) ) ( not ( = ?auto_24840 ?auto_24847 ) ) ( IS-CRATE ?auto_24835 ) ( AVAILABLE ?auto_24847 ) ( SURFACE-AT ?auto_24835 ?auto_24846 ) ( ON ?auto_24835 ?auto_24850 ) ( CLEAR ?auto_24835 ) ( not ( = ?auto_24832 ?auto_24835 ) ) ( not ( = ?auto_24832 ?auto_24850 ) ) ( not ( = ?auto_24835 ?auto_24850 ) ) ( IS-CRATE ?auto_24832 ) ( not ( = ?auto_24843 ?auto_24837 ) ) ( HOIST-AT ?auto_24842 ?auto_24843 ) ( SURFACE-AT ?auto_24832 ?auto_24843 ) ( ON ?auto_24832 ?auto_24859 ) ( CLEAR ?auto_24832 ) ( not ( = ?auto_24831 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24859 ) ) ( not ( = ?auto_24832 ?auto_24859 ) ) ( not ( = ?auto_24840 ?auto_24842 ) ) ( IS-CRATE ?auto_24831 ) ( not ( = ?auto_24858 ?auto_24837 ) ) ( HOIST-AT ?auto_24852 ?auto_24858 ) ( AVAILABLE ?auto_24852 ) ( SURFACE-AT ?auto_24831 ?auto_24858 ) ( ON ?auto_24831 ?auto_24854 ) ( CLEAR ?auto_24831 ) ( not ( = ?auto_24830 ?auto_24831 ) ) ( not ( = ?auto_24830 ?auto_24854 ) ) ( not ( = ?auto_24831 ?auto_24854 ) ) ( not ( = ?auto_24840 ?auto_24852 ) ) ( IS-CRATE ?auto_24830 ) ( not ( = ?auto_24857 ?auto_24837 ) ) ( HOIST-AT ?auto_24848 ?auto_24857 ) ( AVAILABLE ?auto_24848 ) ( SURFACE-AT ?auto_24830 ?auto_24857 ) ( ON ?auto_24830 ?auto_24853 ) ( CLEAR ?auto_24830 ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24829 ?auto_24853 ) ) ( not ( = ?auto_24830 ?auto_24853 ) ) ( not ( = ?auto_24840 ?auto_24848 ) ) ( IS-CRATE ?auto_24829 ) ( AVAILABLE ?auto_24842 ) ( SURFACE-AT ?auto_24829 ?auto_24843 ) ( ON ?auto_24829 ?auto_24844 ) ( CLEAR ?auto_24829 ) ( not ( = ?auto_24828 ?auto_24829 ) ) ( not ( = ?auto_24828 ?auto_24844 ) ) ( not ( = ?auto_24829 ?auto_24844 ) ) ( IS-CRATE ?auto_24828 ) ( not ( = ?auto_24856 ?auto_24837 ) ) ( HOIST-AT ?auto_24851 ?auto_24856 ) ( AVAILABLE ?auto_24851 ) ( SURFACE-AT ?auto_24828 ?auto_24856 ) ( ON ?auto_24828 ?auto_24855 ) ( CLEAR ?auto_24828 ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( not ( = ?auto_24827 ?auto_24855 ) ) ( not ( = ?auto_24828 ?auto_24855 ) ) ( not ( = ?auto_24840 ?auto_24851 ) ) ( SURFACE-AT ?auto_24826 ?auto_24837 ) ( CLEAR ?auto_24826 ) ( IS-CRATE ?auto_24827 ) ( AVAILABLE ?auto_24840 ) ( AVAILABLE ?auto_24841 ) ( SURFACE-AT ?auto_24827 ?auto_24836 ) ( ON ?auto_24827 ?auto_24849 ) ( CLEAR ?auto_24827 ) ( TRUCK-AT ?auto_24839 ?auto_24837 ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24849 ) ) ( not ( = ?auto_24827 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24828 ) ) ( not ( = ?auto_24826 ?auto_24855 ) ) ( not ( = ?auto_24828 ?auto_24849 ) ) ( not ( = ?auto_24856 ?auto_24836 ) ) ( not ( = ?auto_24851 ?auto_24841 ) ) ( not ( = ?auto_24855 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24829 ) ) ( not ( = ?auto_24826 ?auto_24844 ) ) ( not ( = ?auto_24827 ?auto_24829 ) ) ( not ( = ?auto_24827 ?auto_24844 ) ) ( not ( = ?auto_24829 ?auto_24855 ) ) ( not ( = ?auto_24829 ?auto_24849 ) ) ( not ( = ?auto_24843 ?auto_24856 ) ) ( not ( = ?auto_24843 ?auto_24836 ) ) ( not ( = ?auto_24842 ?auto_24851 ) ) ( not ( = ?auto_24842 ?auto_24841 ) ) ( not ( = ?auto_24844 ?auto_24855 ) ) ( not ( = ?auto_24844 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24830 ) ) ( not ( = ?auto_24826 ?auto_24853 ) ) ( not ( = ?auto_24827 ?auto_24830 ) ) ( not ( = ?auto_24827 ?auto_24853 ) ) ( not ( = ?auto_24828 ?auto_24830 ) ) ( not ( = ?auto_24828 ?auto_24853 ) ) ( not ( = ?auto_24830 ?auto_24844 ) ) ( not ( = ?auto_24830 ?auto_24855 ) ) ( not ( = ?auto_24830 ?auto_24849 ) ) ( not ( = ?auto_24857 ?auto_24843 ) ) ( not ( = ?auto_24857 ?auto_24856 ) ) ( not ( = ?auto_24857 ?auto_24836 ) ) ( not ( = ?auto_24848 ?auto_24842 ) ) ( not ( = ?auto_24848 ?auto_24851 ) ) ( not ( = ?auto_24848 ?auto_24841 ) ) ( not ( = ?auto_24853 ?auto_24844 ) ) ( not ( = ?auto_24853 ?auto_24855 ) ) ( not ( = ?auto_24853 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24831 ) ) ( not ( = ?auto_24826 ?auto_24854 ) ) ( not ( = ?auto_24827 ?auto_24831 ) ) ( not ( = ?auto_24827 ?auto_24854 ) ) ( not ( = ?auto_24828 ?auto_24831 ) ) ( not ( = ?auto_24828 ?auto_24854 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) ( not ( = ?auto_24829 ?auto_24854 ) ) ( not ( = ?auto_24831 ?auto_24853 ) ) ( not ( = ?auto_24831 ?auto_24844 ) ) ( not ( = ?auto_24831 ?auto_24855 ) ) ( not ( = ?auto_24831 ?auto_24849 ) ) ( not ( = ?auto_24858 ?auto_24857 ) ) ( not ( = ?auto_24858 ?auto_24843 ) ) ( not ( = ?auto_24858 ?auto_24856 ) ) ( not ( = ?auto_24858 ?auto_24836 ) ) ( not ( = ?auto_24852 ?auto_24848 ) ) ( not ( = ?auto_24852 ?auto_24842 ) ) ( not ( = ?auto_24852 ?auto_24851 ) ) ( not ( = ?auto_24852 ?auto_24841 ) ) ( not ( = ?auto_24854 ?auto_24853 ) ) ( not ( = ?auto_24854 ?auto_24844 ) ) ( not ( = ?auto_24854 ?auto_24855 ) ) ( not ( = ?auto_24854 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24832 ) ) ( not ( = ?auto_24826 ?auto_24859 ) ) ( not ( = ?auto_24827 ?auto_24832 ) ) ( not ( = ?auto_24827 ?auto_24859 ) ) ( not ( = ?auto_24828 ?auto_24832 ) ) ( not ( = ?auto_24828 ?auto_24859 ) ) ( not ( = ?auto_24829 ?auto_24832 ) ) ( not ( = ?auto_24829 ?auto_24859 ) ) ( not ( = ?auto_24830 ?auto_24832 ) ) ( not ( = ?auto_24830 ?auto_24859 ) ) ( not ( = ?auto_24832 ?auto_24854 ) ) ( not ( = ?auto_24832 ?auto_24853 ) ) ( not ( = ?auto_24832 ?auto_24844 ) ) ( not ( = ?auto_24832 ?auto_24855 ) ) ( not ( = ?auto_24832 ?auto_24849 ) ) ( not ( = ?auto_24859 ?auto_24854 ) ) ( not ( = ?auto_24859 ?auto_24853 ) ) ( not ( = ?auto_24859 ?auto_24844 ) ) ( not ( = ?auto_24859 ?auto_24855 ) ) ( not ( = ?auto_24859 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24835 ) ) ( not ( = ?auto_24826 ?auto_24850 ) ) ( not ( = ?auto_24827 ?auto_24835 ) ) ( not ( = ?auto_24827 ?auto_24850 ) ) ( not ( = ?auto_24828 ?auto_24835 ) ) ( not ( = ?auto_24828 ?auto_24850 ) ) ( not ( = ?auto_24829 ?auto_24835 ) ) ( not ( = ?auto_24829 ?auto_24850 ) ) ( not ( = ?auto_24830 ?auto_24835 ) ) ( not ( = ?auto_24830 ?auto_24850 ) ) ( not ( = ?auto_24831 ?auto_24835 ) ) ( not ( = ?auto_24831 ?auto_24850 ) ) ( not ( = ?auto_24835 ?auto_24859 ) ) ( not ( = ?auto_24835 ?auto_24854 ) ) ( not ( = ?auto_24835 ?auto_24853 ) ) ( not ( = ?auto_24835 ?auto_24844 ) ) ( not ( = ?auto_24835 ?auto_24855 ) ) ( not ( = ?auto_24835 ?auto_24849 ) ) ( not ( = ?auto_24846 ?auto_24843 ) ) ( not ( = ?auto_24846 ?auto_24858 ) ) ( not ( = ?auto_24846 ?auto_24857 ) ) ( not ( = ?auto_24846 ?auto_24856 ) ) ( not ( = ?auto_24846 ?auto_24836 ) ) ( not ( = ?auto_24847 ?auto_24842 ) ) ( not ( = ?auto_24847 ?auto_24852 ) ) ( not ( = ?auto_24847 ?auto_24848 ) ) ( not ( = ?auto_24847 ?auto_24851 ) ) ( not ( = ?auto_24847 ?auto_24841 ) ) ( not ( = ?auto_24850 ?auto_24859 ) ) ( not ( = ?auto_24850 ?auto_24854 ) ) ( not ( = ?auto_24850 ?auto_24853 ) ) ( not ( = ?auto_24850 ?auto_24844 ) ) ( not ( = ?auto_24850 ?auto_24855 ) ) ( not ( = ?auto_24850 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24834 ) ) ( not ( = ?auto_24826 ?auto_24845 ) ) ( not ( = ?auto_24827 ?auto_24834 ) ) ( not ( = ?auto_24827 ?auto_24845 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( not ( = ?auto_24828 ?auto_24845 ) ) ( not ( = ?auto_24829 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24845 ) ) ( not ( = ?auto_24830 ?auto_24834 ) ) ( not ( = ?auto_24830 ?auto_24845 ) ) ( not ( = ?auto_24831 ?auto_24834 ) ) ( not ( = ?auto_24831 ?auto_24845 ) ) ( not ( = ?auto_24832 ?auto_24834 ) ) ( not ( = ?auto_24832 ?auto_24845 ) ) ( not ( = ?auto_24834 ?auto_24850 ) ) ( not ( = ?auto_24834 ?auto_24859 ) ) ( not ( = ?auto_24834 ?auto_24854 ) ) ( not ( = ?auto_24834 ?auto_24853 ) ) ( not ( = ?auto_24834 ?auto_24844 ) ) ( not ( = ?auto_24834 ?auto_24855 ) ) ( not ( = ?auto_24834 ?auto_24849 ) ) ( not ( = ?auto_24845 ?auto_24850 ) ) ( not ( = ?auto_24845 ?auto_24859 ) ) ( not ( = ?auto_24845 ?auto_24854 ) ) ( not ( = ?auto_24845 ?auto_24853 ) ) ( not ( = ?auto_24845 ?auto_24844 ) ) ( not ( = ?auto_24845 ?auto_24855 ) ) ( not ( = ?auto_24845 ?auto_24849 ) ) ( not ( = ?auto_24826 ?auto_24833 ) ) ( not ( = ?auto_24826 ?auto_24838 ) ) ( not ( = ?auto_24827 ?auto_24833 ) ) ( not ( = ?auto_24827 ?auto_24838 ) ) ( not ( = ?auto_24828 ?auto_24833 ) ) ( not ( = ?auto_24828 ?auto_24838 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24838 ) ) ( not ( = ?auto_24830 ?auto_24833 ) ) ( not ( = ?auto_24830 ?auto_24838 ) ) ( not ( = ?auto_24831 ?auto_24833 ) ) ( not ( = ?auto_24831 ?auto_24838 ) ) ( not ( = ?auto_24832 ?auto_24833 ) ) ( not ( = ?auto_24832 ?auto_24838 ) ) ( not ( = ?auto_24835 ?auto_24833 ) ) ( not ( = ?auto_24835 ?auto_24838 ) ) ( not ( = ?auto_24833 ?auto_24845 ) ) ( not ( = ?auto_24833 ?auto_24850 ) ) ( not ( = ?auto_24833 ?auto_24859 ) ) ( not ( = ?auto_24833 ?auto_24854 ) ) ( not ( = ?auto_24833 ?auto_24853 ) ) ( not ( = ?auto_24833 ?auto_24844 ) ) ( not ( = ?auto_24833 ?auto_24855 ) ) ( not ( = ?auto_24833 ?auto_24849 ) ) ( not ( = ?auto_24838 ?auto_24845 ) ) ( not ( = ?auto_24838 ?auto_24850 ) ) ( not ( = ?auto_24838 ?auto_24859 ) ) ( not ( = ?auto_24838 ?auto_24854 ) ) ( not ( = ?auto_24838 ?auto_24853 ) ) ( not ( = ?auto_24838 ?auto_24844 ) ) ( not ( = ?auto_24838 ?auto_24855 ) ) ( not ( = ?auto_24838 ?auto_24849 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_24826 ?auto_24827 ?auto_24828 ?auto_24829 ?auto_24830 ?auto_24831 ?auto_24832 ?auto_24835 ?auto_24834 )
      ( MAKE-1CRATE ?auto_24834 ?auto_24833 )
      ( MAKE-9CRATE-VERIFY ?auto_24826 ?auto_24827 ?auto_24828 ?auto_24829 ?auto_24830 ?auto_24831 ?auto_24832 ?auto_24835 ?auto_24834 ?auto_24833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24862 - SURFACE
      ?auto_24863 - SURFACE
    )
    :vars
    (
      ?auto_24864 - HOIST
      ?auto_24865 - PLACE
      ?auto_24867 - PLACE
      ?auto_24868 - HOIST
      ?auto_24869 - SURFACE
      ?auto_24866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24864 ?auto_24865 ) ( SURFACE-AT ?auto_24862 ?auto_24865 ) ( CLEAR ?auto_24862 ) ( IS-CRATE ?auto_24863 ) ( AVAILABLE ?auto_24864 ) ( not ( = ?auto_24867 ?auto_24865 ) ) ( HOIST-AT ?auto_24868 ?auto_24867 ) ( AVAILABLE ?auto_24868 ) ( SURFACE-AT ?auto_24863 ?auto_24867 ) ( ON ?auto_24863 ?auto_24869 ) ( CLEAR ?auto_24863 ) ( TRUCK-AT ?auto_24866 ?auto_24865 ) ( not ( = ?auto_24862 ?auto_24863 ) ) ( not ( = ?auto_24862 ?auto_24869 ) ) ( not ( = ?auto_24863 ?auto_24869 ) ) ( not ( = ?auto_24864 ?auto_24868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24866 ?auto_24865 ?auto_24867 )
      ( !LIFT ?auto_24868 ?auto_24863 ?auto_24869 ?auto_24867 )
      ( !LOAD ?auto_24868 ?auto_24863 ?auto_24866 ?auto_24867 )
      ( !DRIVE ?auto_24866 ?auto_24867 ?auto_24865 )
      ( !UNLOAD ?auto_24864 ?auto_24863 ?auto_24866 ?auto_24865 )
      ( !DROP ?auto_24864 ?auto_24863 ?auto_24862 ?auto_24865 )
      ( MAKE-1CRATE-VERIFY ?auto_24862 ?auto_24863 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_24881 - SURFACE
      ?auto_24882 - SURFACE
      ?auto_24883 - SURFACE
      ?auto_24884 - SURFACE
      ?auto_24885 - SURFACE
      ?auto_24886 - SURFACE
      ?auto_24887 - SURFACE
      ?auto_24890 - SURFACE
      ?auto_24889 - SURFACE
      ?auto_24888 - SURFACE
      ?auto_24891 - SURFACE
    )
    :vars
    (
      ?auto_24893 - HOIST
      ?auto_24892 - PLACE
      ?auto_24897 - PLACE
      ?auto_24895 - HOIST
      ?auto_24896 - SURFACE
      ?auto_24908 - PLACE
      ?auto_24914 - HOIST
      ?auto_24903 - SURFACE
      ?auto_24913 - PLACE
      ?auto_24899 - HOIST
      ?auto_24900 - SURFACE
      ?auto_24909 - SURFACE
      ?auto_24912 - PLACE
      ?auto_24898 - HOIST
      ?auto_24901 - SURFACE
      ?auto_24904 - PLACE
      ?auto_24907 - HOIST
      ?auto_24918 - SURFACE
      ?auto_24917 - PLACE
      ?auto_24906 - HOIST
      ?auto_24916 - SURFACE
      ?auto_24905 - SURFACE
      ?auto_24902 - PLACE
      ?auto_24910 - HOIST
      ?auto_24911 - SURFACE
      ?auto_24915 - SURFACE
      ?auto_24894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24893 ?auto_24892 ) ( IS-CRATE ?auto_24891 ) ( not ( = ?auto_24897 ?auto_24892 ) ) ( HOIST-AT ?auto_24895 ?auto_24897 ) ( AVAILABLE ?auto_24895 ) ( SURFACE-AT ?auto_24891 ?auto_24897 ) ( ON ?auto_24891 ?auto_24896 ) ( CLEAR ?auto_24891 ) ( not ( = ?auto_24888 ?auto_24891 ) ) ( not ( = ?auto_24888 ?auto_24896 ) ) ( not ( = ?auto_24891 ?auto_24896 ) ) ( not ( = ?auto_24893 ?auto_24895 ) ) ( IS-CRATE ?auto_24888 ) ( not ( = ?auto_24908 ?auto_24892 ) ) ( HOIST-AT ?auto_24914 ?auto_24908 ) ( SURFACE-AT ?auto_24888 ?auto_24908 ) ( ON ?auto_24888 ?auto_24903 ) ( CLEAR ?auto_24888 ) ( not ( = ?auto_24889 ?auto_24888 ) ) ( not ( = ?auto_24889 ?auto_24903 ) ) ( not ( = ?auto_24888 ?auto_24903 ) ) ( not ( = ?auto_24893 ?auto_24914 ) ) ( IS-CRATE ?auto_24889 ) ( not ( = ?auto_24913 ?auto_24892 ) ) ( HOIST-AT ?auto_24899 ?auto_24913 ) ( SURFACE-AT ?auto_24889 ?auto_24913 ) ( ON ?auto_24889 ?auto_24900 ) ( CLEAR ?auto_24889 ) ( not ( = ?auto_24890 ?auto_24889 ) ) ( not ( = ?auto_24890 ?auto_24900 ) ) ( not ( = ?auto_24889 ?auto_24900 ) ) ( not ( = ?auto_24893 ?auto_24899 ) ) ( IS-CRATE ?auto_24890 ) ( AVAILABLE ?auto_24899 ) ( SURFACE-AT ?auto_24890 ?auto_24913 ) ( ON ?auto_24890 ?auto_24909 ) ( CLEAR ?auto_24890 ) ( not ( = ?auto_24887 ?auto_24890 ) ) ( not ( = ?auto_24887 ?auto_24909 ) ) ( not ( = ?auto_24890 ?auto_24909 ) ) ( IS-CRATE ?auto_24887 ) ( not ( = ?auto_24912 ?auto_24892 ) ) ( HOIST-AT ?auto_24898 ?auto_24912 ) ( SURFACE-AT ?auto_24887 ?auto_24912 ) ( ON ?auto_24887 ?auto_24901 ) ( CLEAR ?auto_24887 ) ( not ( = ?auto_24886 ?auto_24887 ) ) ( not ( = ?auto_24886 ?auto_24901 ) ) ( not ( = ?auto_24887 ?auto_24901 ) ) ( not ( = ?auto_24893 ?auto_24898 ) ) ( IS-CRATE ?auto_24886 ) ( not ( = ?auto_24904 ?auto_24892 ) ) ( HOIST-AT ?auto_24907 ?auto_24904 ) ( AVAILABLE ?auto_24907 ) ( SURFACE-AT ?auto_24886 ?auto_24904 ) ( ON ?auto_24886 ?auto_24918 ) ( CLEAR ?auto_24886 ) ( not ( = ?auto_24885 ?auto_24886 ) ) ( not ( = ?auto_24885 ?auto_24918 ) ) ( not ( = ?auto_24886 ?auto_24918 ) ) ( not ( = ?auto_24893 ?auto_24907 ) ) ( IS-CRATE ?auto_24885 ) ( not ( = ?auto_24917 ?auto_24892 ) ) ( HOIST-AT ?auto_24906 ?auto_24917 ) ( AVAILABLE ?auto_24906 ) ( SURFACE-AT ?auto_24885 ?auto_24917 ) ( ON ?auto_24885 ?auto_24916 ) ( CLEAR ?auto_24885 ) ( not ( = ?auto_24884 ?auto_24885 ) ) ( not ( = ?auto_24884 ?auto_24916 ) ) ( not ( = ?auto_24885 ?auto_24916 ) ) ( not ( = ?auto_24893 ?auto_24906 ) ) ( IS-CRATE ?auto_24884 ) ( AVAILABLE ?auto_24898 ) ( SURFACE-AT ?auto_24884 ?auto_24912 ) ( ON ?auto_24884 ?auto_24905 ) ( CLEAR ?auto_24884 ) ( not ( = ?auto_24883 ?auto_24884 ) ) ( not ( = ?auto_24883 ?auto_24905 ) ) ( not ( = ?auto_24884 ?auto_24905 ) ) ( IS-CRATE ?auto_24883 ) ( not ( = ?auto_24902 ?auto_24892 ) ) ( HOIST-AT ?auto_24910 ?auto_24902 ) ( AVAILABLE ?auto_24910 ) ( SURFACE-AT ?auto_24883 ?auto_24902 ) ( ON ?auto_24883 ?auto_24911 ) ( CLEAR ?auto_24883 ) ( not ( = ?auto_24882 ?auto_24883 ) ) ( not ( = ?auto_24882 ?auto_24911 ) ) ( not ( = ?auto_24883 ?auto_24911 ) ) ( not ( = ?auto_24893 ?auto_24910 ) ) ( SURFACE-AT ?auto_24881 ?auto_24892 ) ( CLEAR ?auto_24881 ) ( IS-CRATE ?auto_24882 ) ( AVAILABLE ?auto_24893 ) ( AVAILABLE ?auto_24914 ) ( SURFACE-AT ?auto_24882 ?auto_24908 ) ( ON ?auto_24882 ?auto_24915 ) ( CLEAR ?auto_24882 ) ( TRUCK-AT ?auto_24894 ?auto_24892 ) ( not ( = ?auto_24881 ?auto_24882 ) ) ( not ( = ?auto_24881 ?auto_24915 ) ) ( not ( = ?auto_24882 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24883 ) ) ( not ( = ?auto_24881 ?auto_24911 ) ) ( not ( = ?auto_24883 ?auto_24915 ) ) ( not ( = ?auto_24902 ?auto_24908 ) ) ( not ( = ?auto_24910 ?auto_24914 ) ) ( not ( = ?auto_24911 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24884 ) ) ( not ( = ?auto_24881 ?auto_24905 ) ) ( not ( = ?auto_24882 ?auto_24884 ) ) ( not ( = ?auto_24882 ?auto_24905 ) ) ( not ( = ?auto_24884 ?auto_24911 ) ) ( not ( = ?auto_24884 ?auto_24915 ) ) ( not ( = ?auto_24912 ?auto_24902 ) ) ( not ( = ?auto_24912 ?auto_24908 ) ) ( not ( = ?auto_24898 ?auto_24910 ) ) ( not ( = ?auto_24898 ?auto_24914 ) ) ( not ( = ?auto_24905 ?auto_24911 ) ) ( not ( = ?auto_24905 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24885 ) ) ( not ( = ?auto_24881 ?auto_24916 ) ) ( not ( = ?auto_24882 ?auto_24885 ) ) ( not ( = ?auto_24882 ?auto_24916 ) ) ( not ( = ?auto_24883 ?auto_24885 ) ) ( not ( = ?auto_24883 ?auto_24916 ) ) ( not ( = ?auto_24885 ?auto_24905 ) ) ( not ( = ?auto_24885 ?auto_24911 ) ) ( not ( = ?auto_24885 ?auto_24915 ) ) ( not ( = ?auto_24917 ?auto_24912 ) ) ( not ( = ?auto_24917 ?auto_24902 ) ) ( not ( = ?auto_24917 ?auto_24908 ) ) ( not ( = ?auto_24906 ?auto_24898 ) ) ( not ( = ?auto_24906 ?auto_24910 ) ) ( not ( = ?auto_24906 ?auto_24914 ) ) ( not ( = ?auto_24916 ?auto_24905 ) ) ( not ( = ?auto_24916 ?auto_24911 ) ) ( not ( = ?auto_24916 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24886 ) ) ( not ( = ?auto_24881 ?auto_24918 ) ) ( not ( = ?auto_24882 ?auto_24886 ) ) ( not ( = ?auto_24882 ?auto_24918 ) ) ( not ( = ?auto_24883 ?auto_24886 ) ) ( not ( = ?auto_24883 ?auto_24918 ) ) ( not ( = ?auto_24884 ?auto_24886 ) ) ( not ( = ?auto_24884 ?auto_24918 ) ) ( not ( = ?auto_24886 ?auto_24916 ) ) ( not ( = ?auto_24886 ?auto_24905 ) ) ( not ( = ?auto_24886 ?auto_24911 ) ) ( not ( = ?auto_24886 ?auto_24915 ) ) ( not ( = ?auto_24904 ?auto_24917 ) ) ( not ( = ?auto_24904 ?auto_24912 ) ) ( not ( = ?auto_24904 ?auto_24902 ) ) ( not ( = ?auto_24904 ?auto_24908 ) ) ( not ( = ?auto_24907 ?auto_24906 ) ) ( not ( = ?auto_24907 ?auto_24898 ) ) ( not ( = ?auto_24907 ?auto_24910 ) ) ( not ( = ?auto_24907 ?auto_24914 ) ) ( not ( = ?auto_24918 ?auto_24916 ) ) ( not ( = ?auto_24918 ?auto_24905 ) ) ( not ( = ?auto_24918 ?auto_24911 ) ) ( not ( = ?auto_24918 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24887 ) ) ( not ( = ?auto_24881 ?auto_24901 ) ) ( not ( = ?auto_24882 ?auto_24887 ) ) ( not ( = ?auto_24882 ?auto_24901 ) ) ( not ( = ?auto_24883 ?auto_24887 ) ) ( not ( = ?auto_24883 ?auto_24901 ) ) ( not ( = ?auto_24884 ?auto_24887 ) ) ( not ( = ?auto_24884 ?auto_24901 ) ) ( not ( = ?auto_24885 ?auto_24887 ) ) ( not ( = ?auto_24885 ?auto_24901 ) ) ( not ( = ?auto_24887 ?auto_24918 ) ) ( not ( = ?auto_24887 ?auto_24916 ) ) ( not ( = ?auto_24887 ?auto_24905 ) ) ( not ( = ?auto_24887 ?auto_24911 ) ) ( not ( = ?auto_24887 ?auto_24915 ) ) ( not ( = ?auto_24901 ?auto_24918 ) ) ( not ( = ?auto_24901 ?auto_24916 ) ) ( not ( = ?auto_24901 ?auto_24905 ) ) ( not ( = ?auto_24901 ?auto_24911 ) ) ( not ( = ?auto_24901 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24890 ) ) ( not ( = ?auto_24881 ?auto_24909 ) ) ( not ( = ?auto_24882 ?auto_24890 ) ) ( not ( = ?auto_24882 ?auto_24909 ) ) ( not ( = ?auto_24883 ?auto_24890 ) ) ( not ( = ?auto_24883 ?auto_24909 ) ) ( not ( = ?auto_24884 ?auto_24890 ) ) ( not ( = ?auto_24884 ?auto_24909 ) ) ( not ( = ?auto_24885 ?auto_24890 ) ) ( not ( = ?auto_24885 ?auto_24909 ) ) ( not ( = ?auto_24886 ?auto_24890 ) ) ( not ( = ?auto_24886 ?auto_24909 ) ) ( not ( = ?auto_24890 ?auto_24901 ) ) ( not ( = ?auto_24890 ?auto_24918 ) ) ( not ( = ?auto_24890 ?auto_24916 ) ) ( not ( = ?auto_24890 ?auto_24905 ) ) ( not ( = ?auto_24890 ?auto_24911 ) ) ( not ( = ?auto_24890 ?auto_24915 ) ) ( not ( = ?auto_24913 ?auto_24912 ) ) ( not ( = ?auto_24913 ?auto_24904 ) ) ( not ( = ?auto_24913 ?auto_24917 ) ) ( not ( = ?auto_24913 ?auto_24902 ) ) ( not ( = ?auto_24913 ?auto_24908 ) ) ( not ( = ?auto_24899 ?auto_24898 ) ) ( not ( = ?auto_24899 ?auto_24907 ) ) ( not ( = ?auto_24899 ?auto_24906 ) ) ( not ( = ?auto_24899 ?auto_24910 ) ) ( not ( = ?auto_24899 ?auto_24914 ) ) ( not ( = ?auto_24909 ?auto_24901 ) ) ( not ( = ?auto_24909 ?auto_24918 ) ) ( not ( = ?auto_24909 ?auto_24916 ) ) ( not ( = ?auto_24909 ?auto_24905 ) ) ( not ( = ?auto_24909 ?auto_24911 ) ) ( not ( = ?auto_24909 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24889 ) ) ( not ( = ?auto_24881 ?auto_24900 ) ) ( not ( = ?auto_24882 ?auto_24889 ) ) ( not ( = ?auto_24882 ?auto_24900 ) ) ( not ( = ?auto_24883 ?auto_24889 ) ) ( not ( = ?auto_24883 ?auto_24900 ) ) ( not ( = ?auto_24884 ?auto_24889 ) ) ( not ( = ?auto_24884 ?auto_24900 ) ) ( not ( = ?auto_24885 ?auto_24889 ) ) ( not ( = ?auto_24885 ?auto_24900 ) ) ( not ( = ?auto_24886 ?auto_24889 ) ) ( not ( = ?auto_24886 ?auto_24900 ) ) ( not ( = ?auto_24887 ?auto_24889 ) ) ( not ( = ?auto_24887 ?auto_24900 ) ) ( not ( = ?auto_24889 ?auto_24909 ) ) ( not ( = ?auto_24889 ?auto_24901 ) ) ( not ( = ?auto_24889 ?auto_24918 ) ) ( not ( = ?auto_24889 ?auto_24916 ) ) ( not ( = ?auto_24889 ?auto_24905 ) ) ( not ( = ?auto_24889 ?auto_24911 ) ) ( not ( = ?auto_24889 ?auto_24915 ) ) ( not ( = ?auto_24900 ?auto_24909 ) ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( not ( = ?auto_24900 ?auto_24918 ) ) ( not ( = ?auto_24900 ?auto_24916 ) ) ( not ( = ?auto_24900 ?auto_24905 ) ) ( not ( = ?auto_24900 ?auto_24911 ) ) ( not ( = ?auto_24900 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24888 ) ) ( not ( = ?auto_24881 ?auto_24903 ) ) ( not ( = ?auto_24882 ?auto_24888 ) ) ( not ( = ?auto_24882 ?auto_24903 ) ) ( not ( = ?auto_24883 ?auto_24888 ) ) ( not ( = ?auto_24883 ?auto_24903 ) ) ( not ( = ?auto_24884 ?auto_24888 ) ) ( not ( = ?auto_24884 ?auto_24903 ) ) ( not ( = ?auto_24885 ?auto_24888 ) ) ( not ( = ?auto_24885 ?auto_24903 ) ) ( not ( = ?auto_24886 ?auto_24888 ) ) ( not ( = ?auto_24886 ?auto_24903 ) ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24903 ) ) ( not ( = ?auto_24890 ?auto_24888 ) ) ( not ( = ?auto_24890 ?auto_24903 ) ) ( not ( = ?auto_24888 ?auto_24900 ) ) ( not ( = ?auto_24888 ?auto_24909 ) ) ( not ( = ?auto_24888 ?auto_24901 ) ) ( not ( = ?auto_24888 ?auto_24918 ) ) ( not ( = ?auto_24888 ?auto_24916 ) ) ( not ( = ?auto_24888 ?auto_24905 ) ) ( not ( = ?auto_24888 ?auto_24911 ) ) ( not ( = ?auto_24888 ?auto_24915 ) ) ( not ( = ?auto_24903 ?auto_24900 ) ) ( not ( = ?auto_24903 ?auto_24909 ) ) ( not ( = ?auto_24903 ?auto_24901 ) ) ( not ( = ?auto_24903 ?auto_24918 ) ) ( not ( = ?auto_24903 ?auto_24916 ) ) ( not ( = ?auto_24903 ?auto_24905 ) ) ( not ( = ?auto_24903 ?auto_24911 ) ) ( not ( = ?auto_24903 ?auto_24915 ) ) ( not ( = ?auto_24881 ?auto_24891 ) ) ( not ( = ?auto_24881 ?auto_24896 ) ) ( not ( = ?auto_24882 ?auto_24891 ) ) ( not ( = ?auto_24882 ?auto_24896 ) ) ( not ( = ?auto_24883 ?auto_24891 ) ) ( not ( = ?auto_24883 ?auto_24896 ) ) ( not ( = ?auto_24884 ?auto_24891 ) ) ( not ( = ?auto_24884 ?auto_24896 ) ) ( not ( = ?auto_24885 ?auto_24891 ) ) ( not ( = ?auto_24885 ?auto_24896 ) ) ( not ( = ?auto_24886 ?auto_24891 ) ) ( not ( = ?auto_24886 ?auto_24896 ) ) ( not ( = ?auto_24887 ?auto_24891 ) ) ( not ( = ?auto_24887 ?auto_24896 ) ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( not ( = ?auto_24890 ?auto_24896 ) ) ( not ( = ?auto_24889 ?auto_24891 ) ) ( not ( = ?auto_24889 ?auto_24896 ) ) ( not ( = ?auto_24891 ?auto_24903 ) ) ( not ( = ?auto_24891 ?auto_24900 ) ) ( not ( = ?auto_24891 ?auto_24909 ) ) ( not ( = ?auto_24891 ?auto_24901 ) ) ( not ( = ?auto_24891 ?auto_24918 ) ) ( not ( = ?auto_24891 ?auto_24916 ) ) ( not ( = ?auto_24891 ?auto_24905 ) ) ( not ( = ?auto_24891 ?auto_24911 ) ) ( not ( = ?auto_24891 ?auto_24915 ) ) ( not ( = ?auto_24897 ?auto_24908 ) ) ( not ( = ?auto_24897 ?auto_24913 ) ) ( not ( = ?auto_24897 ?auto_24912 ) ) ( not ( = ?auto_24897 ?auto_24904 ) ) ( not ( = ?auto_24897 ?auto_24917 ) ) ( not ( = ?auto_24897 ?auto_24902 ) ) ( not ( = ?auto_24895 ?auto_24914 ) ) ( not ( = ?auto_24895 ?auto_24899 ) ) ( not ( = ?auto_24895 ?auto_24898 ) ) ( not ( = ?auto_24895 ?auto_24907 ) ) ( not ( = ?auto_24895 ?auto_24906 ) ) ( not ( = ?auto_24895 ?auto_24910 ) ) ( not ( = ?auto_24896 ?auto_24903 ) ) ( not ( = ?auto_24896 ?auto_24900 ) ) ( not ( = ?auto_24896 ?auto_24909 ) ) ( not ( = ?auto_24896 ?auto_24901 ) ) ( not ( = ?auto_24896 ?auto_24918 ) ) ( not ( = ?auto_24896 ?auto_24916 ) ) ( not ( = ?auto_24896 ?auto_24905 ) ) ( not ( = ?auto_24896 ?auto_24911 ) ) ( not ( = ?auto_24896 ?auto_24915 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24881 ?auto_24882 ?auto_24883 ?auto_24884 ?auto_24885 ?auto_24886 ?auto_24887 ?auto_24890 ?auto_24889 ?auto_24888 )
      ( MAKE-1CRATE ?auto_24888 ?auto_24891 )
      ( MAKE-10CRATE-VERIFY ?auto_24881 ?auto_24882 ?auto_24883 ?auto_24884 ?auto_24885 ?auto_24886 ?auto_24887 ?auto_24890 ?auto_24889 ?auto_24888 ?auto_24891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24921 - SURFACE
      ?auto_24922 - SURFACE
    )
    :vars
    (
      ?auto_24923 - HOIST
      ?auto_24924 - PLACE
      ?auto_24926 - PLACE
      ?auto_24927 - HOIST
      ?auto_24928 - SURFACE
      ?auto_24925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24923 ?auto_24924 ) ( SURFACE-AT ?auto_24921 ?auto_24924 ) ( CLEAR ?auto_24921 ) ( IS-CRATE ?auto_24922 ) ( AVAILABLE ?auto_24923 ) ( not ( = ?auto_24926 ?auto_24924 ) ) ( HOIST-AT ?auto_24927 ?auto_24926 ) ( AVAILABLE ?auto_24927 ) ( SURFACE-AT ?auto_24922 ?auto_24926 ) ( ON ?auto_24922 ?auto_24928 ) ( CLEAR ?auto_24922 ) ( TRUCK-AT ?auto_24925 ?auto_24924 ) ( not ( = ?auto_24921 ?auto_24922 ) ) ( not ( = ?auto_24921 ?auto_24928 ) ) ( not ( = ?auto_24922 ?auto_24928 ) ) ( not ( = ?auto_24923 ?auto_24927 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24925 ?auto_24924 ?auto_24926 )
      ( !LIFT ?auto_24927 ?auto_24922 ?auto_24928 ?auto_24926 )
      ( !LOAD ?auto_24927 ?auto_24922 ?auto_24925 ?auto_24926 )
      ( !DRIVE ?auto_24925 ?auto_24926 ?auto_24924 )
      ( !UNLOAD ?auto_24923 ?auto_24922 ?auto_24925 ?auto_24924 )
      ( !DROP ?auto_24923 ?auto_24922 ?auto_24921 ?auto_24924 )
      ( MAKE-1CRATE-VERIFY ?auto_24921 ?auto_24922 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24941 - SURFACE
      ?auto_24942 - SURFACE
      ?auto_24943 - SURFACE
      ?auto_24944 - SURFACE
      ?auto_24945 - SURFACE
      ?auto_24946 - SURFACE
      ?auto_24947 - SURFACE
      ?auto_24950 - SURFACE
      ?auto_24949 - SURFACE
      ?auto_24948 - SURFACE
      ?auto_24951 - SURFACE
      ?auto_24952 - SURFACE
    )
    :vars
    (
      ?auto_24957 - HOIST
      ?auto_24956 - PLACE
      ?auto_24954 - PLACE
      ?auto_24955 - HOIST
      ?auto_24953 - SURFACE
      ?auto_24979 - PLACE
      ?auto_24980 - HOIST
      ?auto_24975 - SURFACE
      ?auto_24977 - PLACE
      ?auto_24962 - HOIST
      ?auto_24982 - SURFACE
      ?auto_24970 - PLACE
      ?auto_24967 - HOIST
      ?auto_24963 - SURFACE
      ?auto_24964 - SURFACE
      ?auto_24976 - PLACE
      ?auto_24959 - HOIST
      ?auto_24961 - SURFACE
      ?auto_24968 - PLACE
      ?auto_24978 - HOIST
      ?auto_24973 - SURFACE
      ?auto_24974 - PLACE
      ?auto_24981 - HOIST
      ?auto_24960 - SURFACE
      ?auto_24971 - SURFACE
      ?auto_24966 - PLACE
      ?auto_24972 - HOIST
      ?auto_24969 - SURFACE
      ?auto_24965 - SURFACE
      ?auto_24958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24957 ?auto_24956 ) ( IS-CRATE ?auto_24952 ) ( not ( = ?auto_24954 ?auto_24956 ) ) ( HOIST-AT ?auto_24955 ?auto_24954 ) ( AVAILABLE ?auto_24955 ) ( SURFACE-AT ?auto_24952 ?auto_24954 ) ( ON ?auto_24952 ?auto_24953 ) ( CLEAR ?auto_24952 ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( not ( = ?auto_24951 ?auto_24953 ) ) ( not ( = ?auto_24952 ?auto_24953 ) ) ( not ( = ?auto_24957 ?auto_24955 ) ) ( IS-CRATE ?auto_24951 ) ( not ( = ?auto_24979 ?auto_24956 ) ) ( HOIST-AT ?auto_24980 ?auto_24979 ) ( AVAILABLE ?auto_24980 ) ( SURFACE-AT ?auto_24951 ?auto_24979 ) ( ON ?auto_24951 ?auto_24975 ) ( CLEAR ?auto_24951 ) ( not ( = ?auto_24948 ?auto_24951 ) ) ( not ( = ?auto_24948 ?auto_24975 ) ) ( not ( = ?auto_24951 ?auto_24975 ) ) ( not ( = ?auto_24957 ?auto_24980 ) ) ( IS-CRATE ?auto_24948 ) ( not ( = ?auto_24977 ?auto_24956 ) ) ( HOIST-AT ?auto_24962 ?auto_24977 ) ( SURFACE-AT ?auto_24948 ?auto_24977 ) ( ON ?auto_24948 ?auto_24982 ) ( CLEAR ?auto_24948 ) ( not ( = ?auto_24949 ?auto_24948 ) ) ( not ( = ?auto_24949 ?auto_24982 ) ) ( not ( = ?auto_24948 ?auto_24982 ) ) ( not ( = ?auto_24957 ?auto_24962 ) ) ( IS-CRATE ?auto_24949 ) ( not ( = ?auto_24970 ?auto_24956 ) ) ( HOIST-AT ?auto_24967 ?auto_24970 ) ( SURFACE-AT ?auto_24949 ?auto_24970 ) ( ON ?auto_24949 ?auto_24963 ) ( CLEAR ?auto_24949 ) ( not ( = ?auto_24950 ?auto_24949 ) ) ( not ( = ?auto_24950 ?auto_24963 ) ) ( not ( = ?auto_24949 ?auto_24963 ) ) ( not ( = ?auto_24957 ?auto_24967 ) ) ( IS-CRATE ?auto_24950 ) ( AVAILABLE ?auto_24967 ) ( SURFACE-AT ?auto_24950 ?auto_24970 ) ( ON ?auto_24950 ?auto_24964 ) ( CLEAR ?auto_24950 ) ( not ( = ?auto_24947 ?auto_24950 ) ) ( not ( = ?auto_24947 ?auto_24964 ) ) ( not ( = ?auto_24950 ?auto_24964 ) ) ( IS-CRATE ?auto_24947 ) ( not ( = ?auto_24976 ?auto_24956 ) ) ( HOIST-AT ?auto_24959 ?auto_24976 ) ( SURFACE-AT ?auto_24947 ?auto_24976 ) ( ON ?auto_24947 ?auto_24961 ) ( CLEAR ?auto_24947 ) ( not ( = ?auto_24946 ?auto_24947 ) ) ( not ( = ?auto_24946 ?auto_24961 ) ) ( not ( = ?auto_24947 ?auto_24961 ) ) ( not ( = ?auto_24957 ?auto_24959 ) ) ( IS-CRATE ?auto_24946 ) ( not ( = ?auto_24968 ?auto_24956 ) ) ( HOIST-AT ?auto_24978 ?auto_24968 ) ( AVAILABLE ?auto_24978 ) ( SURFACE-AT ?auto_24946 ?auto_24968 ) ( ON ?auto_24946 ?auto_24973 ) ( CLEAR ?auto_24946 ) ( not ( = ?auto_24945 ?auto_24946 ) ) ( not ( = ?auto_24945 ?auto_24973 ) ) ( not ( = ?auto_24946 ?auto_24973 ) ) ( not ( = ?auto_24957 ?auto_24978 ) ) ( IS-CRATE ?auto_24945 ) ( not ( = ?auto_24974 ?auto_24956 ) ) ( HOIST-AT ?auto_24981 ?auto_24974 ) ( AVAILABLE ?auto_24981 ) ( SURFACE-AT ?auto_24945 ?auto_24974 ) ( ON ?auto_24945 ?auto_24960 ) ( CLEAR ?auto_24945 ) ( not ( = ?auto_24944 ?auto_24945 ) ) ( not ( = ?auto_24944 ?auto_24960 ) ) ( not ( = ?auto_24945 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24981 ) ) ( IS-CRATE ?auto_24944 ) ( AVAILABLE ?auto_24959 ) ( SURFACE-AT ?auto_24944 ?auto_24976 ) ( ON ?auto_24944 ?auto_24971 ) ( CLEAR ?auto_24944 ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24971 ) ) ( not ( = ?auto_24944 ?auto_24971 ) ) ( IS-CRATE ?auto_24943 ) ( not ( = ?auto_24966 ?auto_24956 ) ) ( HOIST-AT ?auto_24972 ?auto_24966 ) ( AVAILABLE ?auto_24972 ) ( SURFACE-AT ?auto_24943 ?auto_24966 ) ( ON ?auto_24943 ?auto_24969 ) ( CLEAR ?auto_24943 ) ( not ( = ?auto_24942 ?auto_24943 ) ) ( not ( = ?auto_24942 ?auto_24969 ) ) ( not ( = ?auto_24943 ?auto_24969 ) ) ( not ( = ?auto_24957 ?auto_24972 ) ) ( SURFACE-AT ?auto_24941 ?auto_24956 ) ( CLEAR ?auto_24941 ) ( IS-CRATE ?auto_24942 ) ( AVAILABLE ?auto_24957 ) ( AVAILABLE ?auto_24962 ) ( SURFACE-AT ?auto_24942 ?auto_24977 ) ( ON ?auto_24942 ?auto_24965 ) ( CLEAR ?auto_24942 ) ( TRUCK-AT ?auto_24958 ?auto_24956 ) ( not ( = ?auto_24941 ?auto_24942 ) ) ( not ( = ?auto_24941 ?auto_24965 ) ) ( not ( = ?auto_24942 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24943 ) ) ( not ( = ?auto_24941 ?auto_24969 ) ) ( not ( = ?auto_24943 ?auto_24965 ) ) ( not ( = ?auto_24966 ?auto_24977 ) ) ( not ( = ?auto_24972 ?auto_24962 ) ) ( not ( = ?auto_24969 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24944 ) ) ( not ( = ?auto_24941 ?auto_24971 ) ) ( not ( = ?auto_24942 ?auto_24944 ) ) ( not ( = ?auto_24942 ?auto_24971 ) ) ( not ( = ?auto_24944 ?auto_24969 ) ) ( not ( = ?auto_24944 ?auto_24965 ) ) ( not ( = ?auto_24976 ?auto_24966 ) ) ( not ( = ?auto_24976 ?auto_24977 ) ) ( not ( = ?auto_24959 ?auto_24972 ) ) ( not ( = ?auto_24959 ?auto_24962 ) ) ( not ( = ?auto_24971 ?auto_24969 ) ) ( not ( = ?auto_24971 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24945 ) ) ( not ( = ?auto_24941 ?auto_24960 ) ) ( not ( = ?auto_24942 ?auto_24945 ) ) ( not ( = ?auto_24942 ?auto_24960 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24943 ?auto_24960 ) ) ( not ( = ?auto_24945 ?auto_24971 ) ) ( not ( = ?auto_24945 ?auto_24969 ) ) ( not ( = ?auto_24945 ?auto_24965 ) ) ( not ( = ?auto_24974 ?auto_24976 ) ) ( not ( = ?auto_24974 ?auto_24966 ) ) ( not ( = ?auto_24974 ?auto_24977 ) ) ( not ( = ?auto_24981 ?auto_24959 ) ) ( not ( = ?auto_24981 ?auto_24972 ) ) ( not ( = ?auto_24981 ?auto_24962 ) ) ( not ( = ?auto_24960 ?auto_24971 ) ) ( not ( = ?auto_24960 ?auto_24969 ) ) ( not ( = ?auto_24960 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24946 ) ) ( not ( = ?auto_24941 ?auto_24973 ) ) ( not ( = ?auto_24942 ?auto_24946 ) ) ( not ( = ?auto_24942 ?auto_24973 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24943 ?auto_24973 ) ) ( not ( = ?auto_24944 ?auto_24946 ) ) ( not ( = ?auto_24944 ?auto_24973 ) ) ( not ( = ?auto_24946 ?auto_24960 ) ) ( not ( = ?auto_24946 ?auto_24971 ) ) ( not ( = ?auto_24946 ?auto_24969 ) ) ( not ( = ?auto_24946 ?auto_24965 ) ) ( not ( = ?auto_24968 ?auto_24974 ) ) ( not ( = ?auto_24968 ?auto_24976 ) ) ( not ( = ?auto_24968 ?auto_24966 ) ) ( not ( = ?auto_24968 ?auto_24977 ) ) ( not ( = ?auto_24978 ?auto_24981 ) ) ( not ( = ?auto_24978 ?auto_24959 ) ) ( not ( = ?auto_24978 ?auto_24972 ) ) ( not ( = ?auto_24978 ?auto_24962 ) ) ( not ( = ?auto_24973 ?auto_24960 ) ) ( not ( = ?auto_24973 ?auto_24971 ) ) ( not ( = ?auto_24973 ?auto_24969 ) ) ( not ( = ?auto_24973 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24947 ) ) ( not ( = ?auto_24941 ?auto_24961 ) ) ( not ( = ?auto_24942 ?auto_24947 ) ) ( not ( = ?auto_24942 ?auto_24961 ) ) ( not ( = ?auto_24943 ?auto_24947 ) ) ( not ( = ?auto_24943 ?auto_24961 ) ) ( not ( = ?auto_24944 ?auto_24947 ) ) ( not ( = ?auto_24944 ?auto_24961 ) ) ( not ( = ?auto_24945 ?auto_24947 ) ) ( not ( = ?auto_24945 ?auto_24961 ) ) ( not ( = ?auto_24947 ?auto_24973 ) ) ( not ( = ?auto_24947 ?auto_24960 ) ) ( not ( = ?auto_24947 ?auto_24971 ) ) ( not ( = ?auto_24947 ?auto_24969 ) ) ( not ( = ?auto_24947 ?auto_24965 ) ) ( not ( = ?auto_24961 ?auto_24973 ) ) ( not ( = ?auto_24961 ?auto_24960 ) ) ( not ( = ?auto_24961 ?auto_24971 ) ) ( not ( = ?auto_24961 ?auto_24969 ) ) ( not ( = ?auto_24961 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24950 ) ) ( not ( = ?auto_24941 ?auto_24964 ) ) ( not ( = ?auto_24942 ?auto_24950 ) ) ( not ( = ?auto_24942 ?auto_24964 ) ) ( not ( = ?auto_24943 ?auto_24950 ) ) ( not ( = ?auto_24943 ?auto_24964 ) ) ( not ( = ?auto_24944 ?auto_24950 ) ) ( not ( = ?auto_24944 ?auto_24964 ) ) ( not ( = ?auto_24945 ?auto_24950 ) ) ( not ( = ?auto_24945 ?auto_24964 ) ) ( not ( = ?auto_24946 ?auto_24950 ) ) ( not ( = ?auto_24946 ?auto_24964 ) ) ( not ( = ?auto_24950 ?auto_24961 ) ) ( not ( = ?auto_24950 ?auto_24973 ) ) ( not ( = ?auto_24950 ?auto_24960 ) ) ( not ( = ?auto_24950 ?auto_24971 ) ) ( not ( = ?auto_24950 ?auto_24969 ) ) ( not ( = ?auto_24950 ?auto_24965 ) ) ( not ( = ?auto_24970 ?auto_24976 ) ) ( not ( = ?auto_24970 ?auto_24968 ) ) ( not ( = ?auto_24970 ?auto_24974 ) ) ( not ( = ?auto_24970 ?auto_24966 ) ) ( not ( = ?auto_24970 ?auto_24977 ) ) ( not ( = ?auto_24967 ?auto_24959 ) ) ( not ( = ?auto_24967 ?auto_24978 ) ) ( not ( = ?auto_24967 ?auto_24981 ) ) ( not ( = ?auto_24967 ?auto_24972 ) ) ( not ( = ?auto_24967 ?auto_24962 ) ) ( not ( = ?auto_24964 ?auto_24961 ) ) ( not ( = ?auto_24964 ?auto_24973 ) ) ( not ( = ?auto_24964 ?auto_24960 ) ) ( not ( = ?auto_24964 ?auto_24971 ) ) ( not ( = ?auto_24964 ?auto_24969 ) ) ( not ( = ?auto_24964 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24949 ) ) ( not ( = ?auto_24941 ?auto_24963 ) ) ( not ( = ?auto_24942 ?auto_24949 ) ) ( not ( = ?auto_24942 ?auto_24963 ) ) ( not ( = ?auto_24943 ?auto_24949 ) ) ( not ( = ?auto_24943 ?auto_24963 ) ) ( not ( = ?auto_24944 ?auto_24949 ) ) ( not ( = ?auto_24944 ?auto_24963 ) ) ( not ( = ?auto_24945 ?auto_24949 ) ) ( not ( = ?auto_24945 ?auto_24963 ) ) ( not ( = ?auto_24946 ?auto_24949 ) ) ( not ( = ?auto_24946 ?auto_24963 ) ) ( not ( = ?auto_24947 ?auto_24949 ) ) ( not ( = ?auto_24947 ?auto_24963 ) ) ( not ( = ?auto_24949 ?auto_24964 ) ) ( not ( = ?auto_24949 ?auto_24961 ) ) ( not ( = ?auto_24949 ?auto_24973 ) ) ( not ( = ?auto_24949 ?auto_24960 ) ) ( not ( = ?auto_24949 ?auto_24971 ) ) ( not ( = ?auto_24949 ?auto_24969 ) ) ( not ( = ?auto_24949 ?auto_24965 ) ) ( not ( = ?auto_24963 ?auto_24964 ) ) ( not ( = ?auto_24963 ?auto_24961 ) ) ( not ( = ?auto_24963 ?auto_24973 ) ) ( not ( = ?auto_24963 ?auto_24960 ) ) ( not ( = ?auto_24963 ?auto_24971 ) ) ( not ( = ?auto_24963 ?auto_24969 ) ) ( not ( = ?auto_24963 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24948 ) ) ( not ( = ?auto_24941 ?auto_24982 ) ) ( not ( = ?auto_24942 ?auto_24948 ) ) ( not ( = ?auto_24942 ?auto_24982 ) ) ( not ( = ?auto_24943 ?auto_24948 ) ) ( not ( = ?auto_24943 ?auto_24982 ) ) ( not ( = ?auto_24944 ?auto_24948 ) ) ( not ( = ?auto_24944 ?auto_24982 ) ) ( not ( = ?auto_24945 ?auto_24948 ) ) ( not ( = ?auto_24945 ?auto_24982 ) ) ( not ( = ?auto_24946 ?auto_24948 ) ) ( not ( = ?auto_24946 ?auto_24982 ) ) ( not ( = ?auto_24947 ?auto_24948 ) ) ( not ( = ?auto_24947 ?auto_24982 ) ) ( not ( = ?auto_24950 ?auto_24948 ) ) ( not ( = ?auto_24950 ?auto_24982 ) ) ( not ( = ?auto_24948 ?auto_24963 ) ) ( not ( = ?auto_24948 ?auto_24964 ) ) ( not ( = ?auto_24948 ?auto_24961 ) ) ( not ( = ?auto_24948 ?auto_24973 ) ) ( not ( = ?auto_24948 ?auto_24960 ) ) ( not ( = ?auto_24948 ?auto_24971 ) ) ( not ( = ?auto_24948 ?auto_24969 ) ) ( not ( = ?auto_24948 ?auto_24965 ) ) ( not ( = ?auto_24982 ?auto_24963 ) ) ( not ( = ?auto_24982 ?auto_24964 ) ) ( not ( = ?auto_24982 ?auto_24961 ) ) ( not ( = ?auto_24982 ?auto_24973 ) ) ( not ( = ?auto_24982 ?auto_24960 ) ) ( not ( = ?auto_24982 ?auto_24971 ) ) ( not ( = ?auto_24982 ?auto_24969 ) ) ( not ( = ?auto_24982 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24951 ) ) ( not ( = ?auto_24941 ?auto_24975 ) ) ( not ( = ?auto_24942 ?auto_24951 ) ) ( not ( = ?auto_24942 ?auto_24975 ) ) ( not ( = ?auto_24943 ?auto_24951 ) ) ( not ( = ?auto_24943 ?auto_24975 ) ) ( not ( = ?auto_24944 ?auto_24951 ) ) ( not ( = ?auto_24944 ?auto_24975 ) ) ( not ( = ?auto_24945 ?auto_24951 ) ) ( not ( = ?auto_24945 ?auto_24975 ) ) ( not ( = ?auto_24946 ?auto_24951 ) ) ( not ( = ?auto_24946 ?auto_24975 ) ) ( not ( = ?auto_24947 ?auto_24951 ) ) ( not ( = ?auto_24947 ?auto_24975 ) ) ( not ( = ?auto_24950 ?auto_24951 ) ) ( not ( = ?auto_24950 ?auto_24975 ) ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( not ( = ?auto_24949 ?auto_24975 ) ) ( not ( = ?auto_24951 ?auto_24982 ) ) ( not ( = ?auto_24951 ?auto_24963 ) ) ( not ( = ?auto_24951 ?auto_24964 ) ) ( not ( = ?auto_24951 ?auto_24961 ) ) ( not ( = ?auto_24951 ?auto_24973 ) ) ( not ( = ?auto_24951 ?auto_24960 ) ) ( not ( = ?auto_24951 ?auto_24971 ) ) ( not ( = ?auto_24951 ?auto_24969 ) ) ( not ( = ?auto_24951 ?auto_24965 ) ) ( not ( = ?auto_24979 ?auto_24977 ) ) ( not ( = ?auto_24979 ?auto_24970 ) ) ( not ( = ?auto_24979 ?auto_24976 ) ) ( not ( = ?auto_24979 ?auto_24968 ) ) ( not ( = ?auto_24979 ?auto_24974 ) ) ( not ( = ?auto_24979 ?auto_24966 ) ) ( not ( = ?auto_24980 ?auto_24962 ) ) ( not ( = ?auto_24980 ?auto_24967 ) ) ( not ( = ?auto_24980 ?auto_24959 ) ) ( not ( = ?auto_24980 ?auto_24978 ) ) ( not ( = ?auto_24980 ?auto_24981 ) ) ( not ( = ?auto_24980 ?auto_24972 ) ) ( not ( = ?auto_24975 ?auto_24982 ) ) ( not ( = ?auto_24975 ?auto_24963 ) ) ( not ( = ?auto_24975 ?auto_24964 ) ) ( not ( = ?auto_24975 ?auto_24961 ) ) ( not ( = ?auto_24975 ?auto_24973 ) ) ( not ( = ?auto_24975 ?auto_24960 ) ) ( not ( = ?auto_24975 ?auto_24971 ) ) ( not ( = ?auto_24975 ?auto_24969 ) ) ( not ( = ?auto_24975 ?auto_24965 ) ) ( not ( = ?auto_24941 ?auto_24952 ) ) ( not ( = ?auto_24941 ?auto_24953 ) ) ( not ( = ?auto_24942 ?auto_24952 ) ) ( not ( = ?auto_24942 ?auto_24953 ) ) ( not ( = ?auto_24943 ?auto_24952 ) ) ( not ( = ?auto_24943 ?auto_24953 ) ) ( not ( = ?auto_24944 ?auto_24952 ) ) ( not ( = ?auto_24944 ?auto_24953 ) ) ( not ( = ?auto_24945 ?auto_24952 ) ) ( not ( = ?auto_24945 ?auto_24953 ) ) ( not ( = ?auto_24946 ?auto_24952 ) ) ( not ( = ?auto_24946 ?auto_24953 ) ) ( not ( = ?auto_24947 ?auto_24952 ) ) ( not ( = ?auto_24947 ?auto_24953 ) ) ( not ( = ?auto_24950 ?auto_24952 ) ) ( not ( = ?auto_24950 ?auto_24953 ) ) ( not ( = ?auto_24949 ?auto_24952 ) ) ( not ( = ?auto_24949 ?auto_24953 ) ) ( not ( = ?auto_24948 ?auto_24952 ) ) ( not ( = ?auto_24948 ?auto_24953 ) ) ( not ( = ?auto_24952 ?auto_24975 ) ) ( not ( = ?auto_24952 ?auto_24982 ) ) ( not ( = ?auto_24952 ?auto_24963 ) ) ( not ( = ?auto_24952 ?auto_24964 ) ) ( not ( = ?auto_24952 ?auto_24961 ) ) ( not ( = ?auto_24952 ?auto_24973 ) ) ( not ( = ?auto_24952 ?auto_24960 ) ) ( not ( = ?auto_24952 ?auto_24971 ) ) ( not ( = ?auto_24952 ?auto_24969 ) ) ( not ( = ?auto_24952 ?auto_24965 ) ) ( not ( = ?auto_24954 ?auto_24979 ) ) ( not ( = ?auto_24954 ?auto_24977 ) ) ( not ( = ?auto_24954 ?auto_24970 ) ) ( not ( = ?auto_24954 ?auto_24976 ) ) ( not ( = ?auto_24954 ?auto_24968 ) ) ( not ( = ?auto_24954 ?auto_24974 ) ) ( not ( = ?auto_24954 ?auto_24966 ) ) ( not ( = ?auto_24955 ?auto_24980 ) ) ( not ( = ?auto_24955 ?auto_24962 ) ) ( not ( = ?auto_24955 ?auto_24967 ) ) ( not ( = ?auto_24955 ?auto_24959 ) ) ( not ( = ?auto_24955 ?auto_24978 ) ) ( not ( = ?auto_24955 ?auto_24981 ) ) ( not ( = ?auto_24955 ?auto_24972 ) ) ( not ( = ?auto_24953 ?auto_24975 ) ) ( not ( = ?auto_24953 ?auto_24982 ) ) ( not ( = ?auto_24953 ?auto_24963 ) ) ( not ( = ?auto_24953 ?auto_24964 ) ) ( not ( = ?auto_24953 ?auto_24961 ) ) ( not ( = ?auto_24953 ?auto_24973 ) ) ( not ( = ?auto_24953 ?auto_24960 ) ) ( not ( = ?auto_24953 ?auto_24971 ) ) ( not ( = ?auto_24953 ?auto_24969 ) ) ( not ( = ?auto_24953 ?auto_24965 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24941 ?auto_24942 ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ?auto_24947 ?auto_24950 ?auto_24949 ?auto_24948 ?auto_24951 )
      ( MAKE-1CRATE ?auto_24951 ?auto_24952 )
      ( MAKE-11CRATE-VERIFY ?auto_24941 ?auto_24942 ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ?auto_24947 ?auto_24950 ?auto_24949 ?auto_24948 ?auto_24951 ?auto_24952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24985 - SURFACE
      ?auto_24986 - SURFACE
    )
    :vars
    (
      ?auto_24987 - HOIST
      ?auto_24988 - PLACE
      ?auto_24990 - PLACE
      ?auto_24991 - HOIST
      ?auto_24992 - SURFACE
      ?auto_24989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24987 ?auto_24988 ) ( SURFACE-AT ?auto_24985 ?auto_24988 ) ( CLEAR ?auto_24985 ) ( IS-CRATE ?auto_24986 ) ( AVAILABLE ?auto_24987 ) ( not ( = ?auto_24990 ?auto_24988 ) ) ( HOIST-AT ?auto_24991 ?auto_24990 ) ( AVAILABLE ?auto_24991 ) ( SURFACE-AT ?auto_24986 ?auto_24990 ) ( ON ?auto_24986 ?auto_24992 ) ( CLEAR ?auto_24986 ) ( TRUCK-AT ?auto_24989 ?auto_24988 ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( not ( = ?auto_24985 ?auto_24992 ) ) ( not ( = ?auto_24986 ?auto_24992 ) ) ( not ( = ?auto_24987 ?auto_24991 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24989 ?auto_24988 ?auto_24990 )
      ( !LIFT ?auto_24991 ?auto_24986 ?auto_24992 ?auto_24990 )
      ( !LOAD ?auto_24991 ?auto_24986 ?auto_24989 ?auto_24990 )
      ( !DRIVE ?auto_24989 ?auto_24990 ?auto_24988 )
      ( !UNLOAD ?auto_24987 ?auto_24986 ?auto_24989 ?auto_24988 )
      ( !DROP ?auto_24987 ?auto_24986 ?auto_24985 ?auto_24988 )
      ( MAKE-1CRATE-VERIFY ?auto_24985 ?auto_24986 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_25006 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25008 - SURFACE
      ?auto_25009 - SURFACE
      ?auto_25010 - SURFACE
      ?auto_25011 - SURFACE
      ?auto_25012 - SURFACE
      ?auto_25015 - SURFACE
      ?auto_25014 - SURFACE
      ?auto_25013 - SURFACE
      ?auto_25016 - SURFACE
      ?auto_25017 - SURFACE
      ?auto_25018 - SURFACE
    )
    :vars
    (
      ?auto_25021 - HOIST
      ?auto_25020 - PLACE
      ?auto_25019 - PLACE
      ?auto_25024 - HOIST
      ?auto_25022 - SURFACE
      ?auto_25033 - PLACE
      ?auto_25027 - HOIST
      ?auto_25030 - SURFACE
      ?auto_25046 - SURFACE
      ?auto_25035 - PLACE
      ?auto_25036 - HOIST
      ?auto_25039 - SURFACE
      ?auto_25034 - PLACE
      ?auto_25029 - HOIST
      ?auto_25047 - SURFACE
      ?auto_25028 - SURFACE
      ?auto_25043 - PLACE
      ?auto_25037 - HOIST
      ?auto_25040 - SURFACE
      ?auto_25032 - PLACE
      ?auto_25041 - HOIST
      ?auto_25049 - SURFACE
      ?auto_25048 - PLACE
      ?auto_25038 - HOIST
      ?auto_25042 - SURFACE
      ?auto_25044 - SURFACE
      ?auto_25025 - PLACE
      ?auto_25026 - HOIST
      ?auto_25031 - SURFACE
      ?auto_25045 - SURFACE
      ?auto_25023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25021 ?auto_25020 ) ( IS-CRATE ?auto_25018 ) ( not ( = ?auto_25019 ?auto_25020 ) ) ( HOIST-AT ?auto_25024 ?auto_25019 ) ( SURFACE-AT ?auto_25018 ?auto_25019 ) ( ON ?auto_25018 ?auto_25022 ) ( CLEAR ?auto_25018 ) ( not ( = ?auto_25017 ?auto_25018 ) ) ( not ( = ?auto_25017 ?auto_25022 ) ) ( not ( = ?auto_25018 ?auto_25022 ) ) ( not ( = ?auto_25021 ?auto_25024 ) ) ( IS-CRATE ?auto_25017 ) ( not ( = ?auto_25033 ?auto_25020 ) ) ( HOIST-AT ?auto_25027 ?auto_25033 ) ( AVAILABLE ?auto_25027 ) ( SURFACE-AT ?auto_25017 ?auto_25033 ) ( ON ?auto_25017 ?auto_25030 ) ( CLEAR ?auto_25017 ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( not ( = ?auto_25016 ?auto_25030 ) ) ( not ( = ?auto_25017 ?auto_25030 ) ) ( not ( = ?auto_25021 ?auto_25027 ) ) ( IS-CRATE ?auto_25016 ) ( AVAILABLE ?auto_25024 ) ( SURFACE-AT ?auto_25016 ?auto_25019 ) ( ON ?auto_25016 ?auto_25046 ) ( CLEAR ?auto_25016 ) ( not ( = ?auto_25013 ?auto_25016 ) ) ( not ( = ?auto_25013 ?auto_25046 ) ) ( not ( = ?auto_25016 ?auto_25046 ) ) ( IS-CRATE ?auto_25013 ) ( not ( = ?auto_25035 ?auto_25020 ) ) ( HOIST-AT ?auto_25036 ?auto_25035 ) ( SURFACE-AT ?auto_25013 ?auto_25035 ) ( ON ?auto_25013 ?auto_25039 ) ( CLEAR ?auto_25013 ) ( not ( = ?auto_25014 ?auto_25013 ) ) ( not ( = ?auto_25014 ?auto_25039 ) ) ( not ( = ?auto_25013 ?auto_25039 ) ) ( not ( = ?auto_25021 ?auto_25036 ) ) ( IS-CRATE ?auto_25014 ) ( not ( = ?auto_25034 ?auto_25020 ) ) ( HOIST-AT ?auto_25029 ?auto_25034 ) ( SURFACE-AT ?auto_25014 ?auto_25034 ) ( ON ?auto_25014 ?auto_25047 ) ( CLEAR ?auto_25014 ) ( not ( = ?auto_25015 ?auto_25014 ) ) ( not ( = ?auto_25015 ?auto_25047 ) ) ( not ( = ?auto_25014 ?auto_25047 ) ) ( not ( = ?auto_25021 ?auto_25029 ) ) ( IS-CRATE ?auto_25015 ) ( AVAILABLE ?auto_25029 ) ( SURFACE-AT ?auto_25015 ?auto_25034 ) ( ON ?auto_25015 ?auto_25028 ) ( CLEAR ?auto_25015 ) ( not ( = ?auto_25012 ?auto_25015 ) ) ( not ( = ?auto_25012 ?auto_25028 ) ) ( not ( = ?auto_25015 ?auto_25028 ) ) ( IS-CRATE ?auto_25012 ) ( not ( = ?auto_25043 ?auto_25020 ) ) ( HOIST-AT ?auto_25037 ?auto_25043 ) ( SURFACE-AT ?auto_25012 ?auto_25043 ) ( ON ?auto_25012 ?auto_25040 ) ( CLEAR ?auto_25012 ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( not ( = ?auto_25011 ?auto_25040 ) ) ( not ( = ?auto_25012 ?auto_25040 ) ) ( not ( = ?auto_25021 ?auto_25037 ) ) ( IS-CRATE ?auto_25011 ) ( not ( = ?auto_25032 ?auto_25020 ) ) ( HOIST-AT ?auto_25041 ?auto_25032 ) ( AVAILABLE ?auto_25041 ) ( SURFACE-AT ?auto_25011 ?auto_25032 ) ( ON ?auto_25011 ?auto_25049 ) ( CLEAR ?auto_25011 ) ( not ( = ?auto_25010 ?auto_25011 ) ) ( not ( = ?auto_25010 ?auto_25049 ) ) ( not ( = ?auto_25011 ?auto_25049 ) ) ( not ( = ?auto_25021 ?auto_25041 ) ) ( IS-CRATE ?auto_25010 ) ( not ( = ?auto_25048 ?auto_25020 ) ) ( HOIST-AT ?auto_25038 ?auto_25048 ) ( AVAILABLE ?auto_25038 ) ( SURFACE-AT ?auto_25010 ?auto_25048 ) ( ON ?auto_25010 ?auto_25042 ) ( CLEAR ?auto_25010 ) ( not ( = ?auto_25009 ?auto_25010 ) ) ( not ( = ?auto_25009 ?auto_25042 ) ) ( not ( = ?auto_25010 ?auto_25042 ) ) ( not ( = ?auto_25021 ?auto_25038 ) ) ( IS-CRATE ?auto_25009 ) ( AVAILABLE ?auto_25037 ) ( SURFACE-AT ?auto_25009 ?auto_25043 ) ( ON ?auto_25009 ?auto_25044 ) ( CLEAR ?auto_25009 ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25044 ) ) ( not ( = ?auto_25009 ?auto_25044 ) ) ( IS-CRATE ?auto_25008 ) ( not ( = ?auto_25025 ?auto_25020 ) ) ( HOIST-AT ?auto_25026 ?auto_25025 ) ( AVAILABLE ?auto_25026 ) ( SURFACE-AT ?auto_25008 ?auto_25025 ) ( ON ?auto_25008 ?auto_25031 ) ( CLEAR ?auto_25008 ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25031 ) ) ( not ( = ?auto_25008 ?auto_25031 ) ) ( not ( = ?auto_25021 ?auto_25026 ) ) ( SURFACE-AT ?auto_25006 ?auto_25020 ) ( CLEAR ?auto_25006 ) ( IS-CRATE ?auto_25007 ) ( AVAILABLE ?auto_25021 ) ( AVAILABLE ?auto_25036 ) ( SURFACE-AT ?auto_25007 ?auto_25035 ) ( ON ?auto_25007 ?auto_25045 ) ( CLEAR ?auto_25007 ) ( TRUCK-AT ?auto_25023 ?auto_25020 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25045 ) ) ( not ( = ?auto_25007 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25006 ?auto_25031 ) ) ( not ( = ?auto_25008 ?auto_25045 ) ) ( not ( = ?auto_25025 ?auto_25035 ) ) ( not ( = ?auto_25026 ?auto_25036 ) ) ( not ( = ?auto_25031 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25044 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25044 ) ) ( not ( = ?auto_25009 ?auto_25031 ) ) ( not ( = ?auto_25009 ?auto_25045 ) ) ( not ( = ?auto_25043 ?auto_25025 ) ) ( not ( = ?auto_25043 ?auto_25035 ) ) ( not ( = ?auto_25037 ?auto_25026 ) ) ( not ( = ?auto_25037 ?auto_25036 ) ) ( not ( = ?auto_25044 ?auto_25031 ) ) ( not ( = ?auto_25044 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25010 ) ) ( not ( = ?auto_25006 ?auto_25042 ) ) ( not ( = ?auto_25007 ?auto_25010 ) ) ( not ( = ?auto_25007 ?auto_25042 ) ) ( not ( = ?auto_25008 ?auto_25010 ) ) ( not ( = ?auto_25008 ?auto_25042 ) ) ( not ( = ?auto_25010 ?auto_25044 ) ) ( not ( = ?auto_25010 ?auto_25031 ) ) ( not ( = ?auto_25010 ?auto_25045 ) ) ( not ( = ?auto_25048 ?auto_25043 ) ) ( not ( = ?auto_25048 ?auto_25025 ) ) ( not ( = ?auto_25048 ?auto_25035 ) ) ( not ( = ?auto_25038 ?auto_25037 ) ) ( not ( = ?auto_25038 ?auto_25026 ) ) ( not ( = ?auto_25038 ?auto_25036 ) ) ( not ( = ?auto_25042 ?auto_25044 ) ) ( not ( = ?auto_25042 ?auto_25031 ) ) ( not ( = ?auto_25042 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25011 ) ) ( not ( = ?auto_25006 ?auto_25049 ) ) ( not ( = ?auto_25007 ?auto_25011 ) ) ( not ( = ?auto_25007 ?auto_25049 ) ) ( not ( = ?auto_25008 ?auto_25011 ) ) ( not ( = ?auto_25008 ?auto_25049 ) ) ( not ( = ?auto_25009 ?auto_25011 ) ) ( not ( = ?auto_25009 ?auto_25049 ) ) ( not ( = ?auto_25011 ?auto_25042 ) ) ( not ( = ?auto_25011 ?auto_25044 ) ) ( not ( = ?auto_25011 ?auto_25031 ) ) ( not ( = ?auto_25011 ?auto_25045 ) ) ( not ( = ?auto_25032 ?auto_25048 ) ) ( not ( = ?auto_25032 ?auto_25043 ) ) ( not ( = ?auto_25032 ?auto_25025 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( not ( = ?auto_25041 ?auto_25038 ) ) ( not ( = ?auto_25041 ?auto_25037 ) ) ( not ( = ?auto_25041 ?auto_25026 ) ) ( not ( = ?auto_25041 ?auto_25036 ) ) ( not ( = ?auto_25049 ?auto_25042 ) ) ( not ( = ?auto_25049 ?auto_25044 ) ) ( not ( = ?auto_25049 ?auto_25031 ) ) ( not ( = ?auto_25049 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25012 ) ) ( not ( = ?auto_25006 ?auto_25040 ) ) ( not ( = ?auto_25007 ?auto_25012 ) ) ( not ( = ?auto_25007 ?auto_25040 ) ) ( not ( = ?auto_25008 ?auto_25012 ) ) ( not ( = ?auto_25008 ?auto_25040 ) ) ( not ( = ?auto_25009 ?auto_25012 ) ) ( not ( = ?auto_25009 ?auto_25040 ) ) ( not ( = ?auto_25010 ?auto_25012 ) ) ( not ( = ?auto_25010 ?auto_25040 ) ) ( not ( = ?auto_25012 ?auto_25049 ) ) ( not ( = ?auto_25012 ?auto_25042 ) ) ( not ( = ?auto_25012 ?auto_25044 ) ) ( not ( = ?auto_25012 ?auto_25031 ) ) ( not ( = ?auto_25012 ?auto_25045 ) ) ( not ( = ?auto_25040 ?auto_25049 ) ) ( not ( = ?auto_25040 ?auto_25042 ) ) ( not ( = ?auto_25040 ?auto_25044 ) ) ( not ( = ?auto_25040 ?auto_25031 ) ) ( not ( = ?auto_25040 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25015 ) ) ( not ( = ?auto_25006 ?auto_25028 ) ) ( not ( = ?auto_25007 ?auto_25015 ) ) ( not ( = ?auto_25007 ?auto_25028 ) ) ( not ( = ?auto_25008 ?auto_25015 ) ) ( not ( = ?auto_25008 ?auto_25028 ) ) ( not ( = ?auto_25009 ?auto_25015 ) ) ( not ( = ?auto_25009 ?auto_25028 ) ) ( not ( = ?auto_25010 ?auto_25015 ) ) ( not ( = ?auto_25010 ?auto_25028 ) ) ( not ( = ?auto_25011 ?auto_25015 ) ) ( not ( = ?auto_25011 ?auto_25028 ) ) ( not ( = ?auto_25015 ?auto_25040 ) ) ( not ( = ?auto_25015 ?auto_25049 ) ) ( not ( = ?auto_25015 ?auto_25042 ) ) ( not ( = ?auto_25015 ?auto_25044 ) ) ( not ( = ?auto_25015 ?auto_25031 ) ) ( not ( = ?auto_25015 ?auto_25045 ) ) ( not ( = ?auto_25034 ?auto_25043 ) ) ( not ( = ?auto_25034 ?auto_25032 ) ) ( not ( = ?auto_25034 ?auto_25048 ) ) ( not ( = ?auto_25034 ?auto_25025 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( not ( = ?auto_25029 ?auto_25037 ) ) ( not ( = ?auto_25029 ?auto_25041 ) ) ( not ( = ?auto_25029 ?auto_25038 ) ) ( not ( = ?auto_25029 ?auto_25026 ) ) ( not ( = ?auto_25029 ?auto_25036 ) ) ( not ( = ?auto_25028 ?auto_25040 ) ) ( not ( = ?auto_25028 ?auto_25049 ) ) ( not ( = ?auto_25028 ?auto_25042 ) ) ( not ( = ?auto_25028 ?auto_25044 ) ) ( not ( = ?auto_25028 ?auto_25031 ) ) ( not ( = ?auto_25028 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25014 ) ) ( not ( = ?auto_25006 ?auto_25047 ) ) ( not ( = ?auto_25007 ?auto_25014 ) ) ( not ( = ?auto_25007 ?auto_25047 ) ) ( not ( = ?auto_25008 ?auto_25014 ) ) ( not ( = ?auto_25008 ?auto_25047 ) ) ( not ( = ?auto_25009 ?auto_25014 ) ) ( not ( = ?auto_25009 ?auto_25047 ) ) ( not ( = ?auto_25010 ?auto_25014 ) ) ( not ( = ?auto_25010 ?auto_25047 ) ) ( not ( = ?auto_25011 ?auto_25014 ) ) ( not ( = ?auto_25011 ?auto_25047 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25047 ) ) ( not ( = ?auto_25014 ?auto_25028 ) ) ( not ( = ?auto_25014 ?auto_25040 ) ) ( not ( = ?auto_25014 ?auto_25049 ) ) ( not ( = ?auto_25014 ?auto_25042 ) ) ( not ( = ?auto_25014 ?auto_25044 ) ) ( not ( = ?auto_25014 ?auto_25031 ) ) ( not ( = ?auto_25014 ?auto_25045 ) ) ( not ( = ?auto_25047 ?auto_25028 ) ) ( not ( = ?auto_25047 ?auto_25040 ) ) ( not ( = ?auto_25047 ?auto_25049 ) ) ( not ( = ?auto_25047 ?auto_25042 ) ) ( not ( = ?auto_25047 ?auto_25044 ) ) ( not ( = ?auto_25047 ?auto_25031 ) ) ( not ( = ?auto_25047 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25013 ) ) ( not ( = ?auto_25006 ?auto_25039 ) ) ( not ( = ?auto_25007 ?auto_25013 ) ) ( not ( = ?auto_25007 ?auto_25039 ) ) ( not ( = ?auto_25008 ?auto_25013 ) ) ( not ( = ?auto_25008 ?auto_25039 ) ) ( not ( = ?auto_25009 ?auto_25013 ) ) ( not ( = ?auto_25009 ?auto_25039 ) ) ( not ( = ?auto_25010 ?auto_25013 ) ) ( not ( = ?auto_25010 ?auto_25039 ) ) ( not ( = ?auto_25011 ?auto_25013 ) ) ( not ( = ?auto_25011 ?auto_25039 ) ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25039 ) ) ( not ( = ?auto_25015 ?auto_25013 ) ) ( not ( = ?auto_25015 ?auto_25039 ) ) ( not ( = ?auto_25013 ?auto_25047 ) ) ( not ( = ?auto_25013 ?auto_25028 ) ) ( not ( = ?auto_25013 ?auto_25040 ) ) ( not ( = ?auto_25013 ?auto_25049 ) ) ( not ( = ?auto_25013 ?auto_25042 ) ) ( not ( = ?auto_25013 ?auto_25044 ) ) ( not ( = ?auto_25013 ?auto_25031 ) ) ( not ( = ?auto_25013 ?auto_25045 ) ) ( not ( = ?auto_25039 ?auto_25047 ) ) ( not ( = ?auto_25039 ?auto_25028 ) ) ( not ( = ?auto_25039 ?auto_25040 ) ) ( not ( = ?auto_25039 ?auto_25049 ) ) ( not ( = ?auto_25039 ?auto_25042 ) ) ( not ( = ?auto_25039 ?auto_25044 ) ) ( not ( = ?auto_25039 ?auto_25031 ) ) ( not ( = ?auto_25039 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25016 ) ) ( not ( = ?auto_25006 ?auto_25046 ) ) ( not ( = ?auto_25007 ?auto_25016 ) ) ( not ( = ?auto_25007 ?auto_25046 ) ) ( not ( = ?auto_25008 ?auto_25016 ) ) ( not ( = ?auto_25008 ?auto_25046 ) ) ( not ( = ?auto_25009 ?auto_25016 ) ) ( not ( = ?auto_25009 ?auto_25046 ) ) ( not ( = ?auto_25010 ?auto_25016 ) ) ( not ( = ?auto_25010 ?auto_25046 ) ) ( not ( = ?auto_25011 ?auto_25016 ) ) ( not ( = ?auto_25011 ?auto_25046 ) ) ( not ( = ?auto_25012 ?auto_25016 ) ) ( not ( = ?auto_25012 ?auto_25046 ) ) ( not ( = ?auto_25015 ?auto_25016 ) ) ( not ( = ?auto_25015 ?auto_25046 ) ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( not ( = ?auto_25014 ?auto_25046 ) ) ( not ( = ?auto_25016 ?auto_25039 ) ) ( not ( = ?auto_25016 ?auto_25047 ) ) ( not ( = ?auto_25016 ?auto_25028 ) ) ( not ( = ?auto_25016 ?auto_25040 ) ) ( not ( = ?auto_25016 ?auto_25049 ) ) ( not ( = ?auto_25016 ?auto_25042 ) ) ( not ( = ?auto_25016 ?auto_25044 ) ) ( not ( = ?auto_25016 ?auto_25031 ) ) ( not ( = ?auto_25016 ?auto_25045 ) ) ( not ( = ?auto_25019 ?auto_25035 ) ) ( not ( = ?auto_25019 ?auto_25034 ) ) ( not ( = ?auto_25019 ?auto_25043 ) ) ( not ( = ?auto_25019 ?auto_25032 ) ) ( not ( = ?auto_25019 ?auto_25048 ) ) ( not ( = ?auto_25019 ?auto_25025 ) ) ( not ( = ?auto_25024 ?auto_25036 ) ) ( not ( = ?auto_25024 ?auto_25029 ) ) ( not ( = ?auto_25024 ?auto_25037 ) ) ( not ( = ?auto_25024 ?auto_25041 ) ) ( not ( = ?auto_25024 ?auto_25038 ) ) ( not ( = ?auto_25024 ?auto_25026 ) ) ( not ( = ?auto_25046 ?auto_25039 ) ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25028 ) ) ( not ( = ?auto_25046 ?auto_25040 ) ) ( not ( = ?auto_25046 ?auto_25049 ) ) ( not ( = ?auto_25046 ?auto_25042 ) ) ( not ( = ?auto_25046 ?auto_25044 ) ) ( not ( = ?auto_25046 ?auto_25031 ) ) ( not ( = ?auto_25046 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25017 ) ) ( not ( = ?auto_25006 ?auto_25030 ) ) ( not ( = ?auto_25007 ?auto_25017 ) ) ( not ( = ?auto_25007 ?auto_25030 ) ) ( not ( = ?auto_25008 ?auto_25017 ) ) ( not ( = ?auto_25008 ?auto_25030 ) ) ( not ( = ?auto_25009 ?auto_25017 ) ) ( not ( = ?auto_25009 ?auto_25030 ) ) ( not ( = ?auto_25010 ?auto_25017 ) ) ( not ( = ?auto_25010 ?auto_25030 ) ) ( not ( = ?auto_25011 ?auto_25017 ) ) ( not ( = ?auto_25011 ?auto_25030 ) ) ( not ( = ?auto_25012 ?auto_25017 ) ) ( not ( = ?auto_25012 ?auto_25030 ) ) ( not ( = ?auto_25015 ?auto_25017 ) ) ( not ( = ?auto_25015 ?auto_25030 ) ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25014 ?auto_25030 ) ) ( not ( = ?auto_25013 ?auto_25017 ) ) ( not ( = ?auto_25013 ?auto_25030 ) ) ( not ( = ?auto_25017 ?auto_25046 ) ) ( not ( = ?auto_25017 ?auto_25039 ) ) ( not ( = ?auto_25017 ?auto_25047 ) ) ( not ( = ?auto_25017 ?auto_25028 ) ) ( not ( = ?auto_25017 ?auto_25040 ) ) ( not ( = ?auto_25017 ?auto_25049 ) ) ( not ( = ?auto_25017 ?auto_25042 ) ) ( not ( = ?auto_25017 ?auto_25044 ) ) ( not ( = ?auto_25017 ?auto_25031 ) ) ( not ( = ?auto_25017 ?auto_25045 ) ) ( not ( = ?auto_25033 ?auto_25019 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25043 ) ) ( not ( = ?auto_25033 ?auto_25032 ) ) ( not ( = ?auto_25033 ?auto_25048 ) ) ( not ( = ?auto_25033 ?auto_25025 ) ) ( not ( = ?auto_25027 ?auto_25024 ) ) ( not ( = ?auto_25027 ?auto_25036 ) ) ( not ( = ?auto_25027 ?auto_25029 ) ) ( not ( = ?auto_25027 ?auto_25037 ) ) ( not ( = ?auto_25027 ?auto_25041 ) ) ( not ( = ?auto_25027 ?auto_25038 ) ) ( not ( = ?auto_25027 ?auto_25026 ) ) ( not ( = ?auto_25030 ?auto_25046 ) ) ( not ( = ?auto_25030 ?auto_25039 ) ) ( not ( = ?auto_25030 ?auto_25047 ) ) ( not ( = ?auto_25030 ?auto_25028 ) ) ( not ( = ?auto_25030 ?auto_25040 ) ) ( not ( = ?auto_25030 ?auto_25049 ) ) ( not ( = ?auto_25030 ?auto_25042 ) ) ( not ( = ?auto_25030 ?auto_25044 ) ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25030 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25018 ) ) ( not ( = ?auto_25006 ?auto_25022 ) ) ( not ( = ?auto_25007 ?auto_25018 ) ) ( not ( = ?auto_25007 ?auto_25022 ) ) ( not ( = ?auto_25008 ?auto_25018 ) ) ( not ( = ?auto_25008 ?auto_25022 ) ) ( not ( = ?auto_25009 ?auto_25018 ) ) ( not ( = ?auto_25009 ?auto_25022 ) ) ( not ( = ?auto_25010 ?auto_25018 ) ) ( not ( = ?auto_25010 ?auto_25022 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( not ( = ?auto_25011 ?auto_25022 ) ) ( not ( = ?auto_25012 ?auto_25018 ) ) ( not ( = ?auto_25012 ?auto_25022 ) ) ( not ( = ?auto_25015 ?auto_25018 ) ) ( not ( = ?auto_25015 ?auto_25022 ) ) ( not ( = ?auto_25014 ?auto_25018 ) ) ( not ( = ?auto_25014 ?auto_25022 ) ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25013 ?auto_25022 ) ) ( not ( = ?auto_25016 ?auto_25018 ) ) ( not ( = ?auto_25016 ?auto_25022 ) ) ( not ( = ?auto_25018 ?auto_25030 ) ) ( not ( = ?auto_25018 ?auto_25046 ) ) ( not ( = ?auto_25018 ?auto_25039 ) ) ( not ( = ?auto_25018 ?auto_25047 ) ) ( not ( = ?auto_25018 ?auto_25028 ) ) ( not ( = ?auto_25018 ?auto_25040 ) ) ( not ( = ?auto_25018 ?auto_25049 ) ) ( not ( = ?auto_25018 ?auto_25042 ) ) ( not ( = ?auto_25018 ?auto_25044 ) ) ( not ( = ?auto_25018 ?auto_25031 ) ) ( not ( = ?auto_25018 ?auto_25045 ) ) ( not ( = ?auto_25022 ?auto_25030 ) ) ( not ( = ?auto_25022 ?auto_25046 ) ) ( not ( = ?auto_25022 ?auto_25039 ) ) ( not ( = ?auto_25022 ?auto_25047 ) ) ( not ( = ?auto_25022 ?auto_25028 ) ) ( not ( = ?auto_25022 ?auto_25040 ) ) ( not ( = ?auto_25022 ?auto_25049 ) ) ( not ( = ?auto_25022 ?auto_25042 ) ) ( not ( = ?auto_25022 ?auto_25044 ) ) ( not ( = ?auto_25022 ?auto_25031 ) ) ( not ( = ?auto_25022 ?auto_25045 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25015 ?auto_25014 ?auto_25013 ?auto_25016 ?auto_25017 )
      ( MAKE-1CRATE ?auto_25017 ?auto_25018 )
      ( MAKE-12CRATE-VERIFY ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25015 ?auto_25014 ?auto_25013 ?auto_25016 ?auto_25017 ?auto_25018 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25052 - SURFACE
      ?auto_25053 - SURFACE
    )
    :vars
    (
      ?auto_25054 - HOIST
      ?auto_25055 - PLACE
      ?auto_25057 - PLACE
      ?auto_25058 - HOIST
      ?auto_25059 - SURFACE
      ?auto_25056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25054 ?auto_25055 ) ( SURFACE-AT ?auto_25052 ?auto_25055 ) ( CLEAR ?auto_25052 ) ( IS-CRATE ?auto_25053 ) ( AVAILABLE ?auto_25054 ) ( not ( = ?auto_25057 ?auto_25055 ) ) ( HOIST-AT ?auto_25058 ?auto_25057 ) ( AVAILABLE ?auto_25058 ) ( SURFACE-AT ?auto_25053 ?auto_25057 ) ( ON ?auto_25053 ?auto_25059 ) ( CLEAR ?auto_25053 ) ( TRUCK-AT ?auto_25056 ?auto_25055 ) ( not ( = ?auto_25052 ?auto_25053 ) ) ( not ( = ?auto_25052 ?auto_25059 ) ) ( not ( = ?auto_25053 ?auto_25059 ) ) ( not ( = ?auto_25054 ?auto_25058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25056 ?auto_25055 ?auto_25057 )
      ( !LIFT ?auto_25058 ?auto_25053 ?auto_25059 ?auto_25057 )
      ( !LOAD ?auto_25058 ?auto_25053 ?auto_25056 ?auto_25057 )
      ( !DRIVE ?auto_25056 ?auto_25057 ?auto_25055 )
      ( !UNLOAD ?auto_25054 ?auto_25053 ?auto_25056 ?auto_25055 )
      ( !DROP ?auto_25054 ?auto_25053 ?auto_25052 ?auto_25055 )
      ( MAKE-1CRATE-VERIFY ?auto_25052 ?auto_25053 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
      ?auto_25077 - SURFACE
      ?auto_25078 - SURFACE
      ?auto_25079 - SURFACE
      ?auto_25080 - SURFACE
      ?auto_25083 - SURFACE
      ?auto_25082 - SURFACE
      ?auto_25081 - SURFACE
      ?auto_25084 - SURFACE
      ?auto_25085 - SURFACE
      ?auto_25086 - SURFACE
      ?auto_25087 - SURFACE
    )
    :vars
    (
      ?auto_25091 - HOIST
      ?auto_25090 - PLACE
      ?auto_25093 - PLACE
      ?auto_25089 - HOIST
      ?auto_25088 - SURFACE
      ?auto_25110 - PLACE
      ?auto_25107 - HOIST
      ?auto_25101 - SURFACE
      ?auto_25097 - PLACE
      ?auto_25116 - HOIST
      ?auto_25117 - SURFACE
      ?auto_25119 - SURFACE
      ?auto_25108 - PLACE
      ?auto_25095 - HOIST
      ?auto_25103 - SURFACE
      ?auto_25118 - PLACE
      ?auto_25094 - HOIST
      ?auto_25104 - SURFACE
      ?auto_25115 - SURFACE
      ?auto_25112 - PLACE
      ?auto_25109 - HOIST
      ?auto_25098 - SURFACE
      ?auto_25106 - SURFACE
      ?auto_25111 - PLACE
      ?auto_25102 - HOIST
      ?auto_25105 - SURFACE
      ?auto_25114 - SURFACE
      ?auto_25113 - PLACE
      ?auto_25099 - HOIST
      ?auto_25100 - SURFACE
      ?auto_25096 - SURFACE
      ?auto_25092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25091 ?auto_25090 ) ( IS-CRATE ?auto_25087 ) ( not ( = ?auto_25093 ?auto_25090 ) ) ( HOIST-AT ?auto_25089 ?auto_25093 ) ( SURFACE-AT ?auto_25087 ?auto_25093 ) ( ON ?auto_25087 ?auto_25088 ) ( CLEAR ?auto_25087 ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25088 ) ) ( not ( = ?auto_25087 ?auto_25088 ) ) ( not ( = ?auto_25091 ?auto_25089 ) ) ( IS-CRATE ?auto_25086 ) ( not ( = ?auto_25110 ?auto_25090 ) ) ( HOIST-AT ?auto_25107 ?auto_25110 ) ( SURFACE-AT ?auto_25086 ?auto_25110 ) ( ON ?auto_25086 ?auto_25101 ) ( CLEAR ?auto_25086 ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25101 ) ) ( not ( = ?auto_25086 ?auto_25101 ) ) ( not ( = ?auto_25091 ?auto_25107 ) ) ( IS-CRATE ?auto_25085 ) ( not ( = ?auto_25097 ?auto_25090 ) ) ( HOIST-AT ?auto_25116 ?auto_25097 ) ( AVAILABLE ?auto_25116 ) ( SURFACE-AT ?auto_25085 ?auto_25097 ) ( ON ?auto_25085 ?auto_25117 ) ( CLEAR ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25117 ) ) ( not ( = ?auto_25085 ?auto_25117 ) ) ( not ( = ?auto_25091 ?auto_25116 ) ) ( IS-CRATE ?auto_25084 ) ( AVAILABLE ?auto_25107 ) ( SURFACE-AT ?auto_25084 ?auto_25110 ) ( ON ?auto_25084 ?auto_25119 ) ( CLEAR ?auto_25084 ) ( not ( = ?auto_25081 ?auto_25084 ) ) ( not ( = ?auto_25081 ?auto_25119 ) ) ( not ( = ?auto_25084 ?auto_25119 ) ) ( IS-CRATE ?auto_25081 ) ( not ( = ?auto_25108 ?auto_25090 ) ) ( HOIST-AT ?auto_25095 ?auto_25108 ) ( SURFACE-AT ?auto_25081 ?auto_25108 ) ( ON ?auto_25081 ?auto_25103 ) ( CLEAR ?auto_25081 ) ( not ( = ?auto_25082 ?auto_25081 ) ) ( not ( = ?auto_25082 ?auto_25103 ) ) ( not ( = ?auto_25081 ?auto_25103 ) ) ( not ( = ?auto_25091 ?auto_25095 ) ) ( IS-CRATE ?auto_25082 ) ( not ( = ?auto_25118 ?auto_25090 ) ) ( HOIST-AT ?auto_25094 ?auto_25118 ) ( SURFACE-AT ?auto_25082 ?auto_25118 ) ( ON ?auto_25082 ?auto_25104 ) ( CLEAR ?auto_25082 ) ( not ( = ?auto_25083 ?auto_25082 ) ) ( not ( = ?auto_25083 ?auto_25104 ) ) ( not ( = ?auto_25082 ?auto_25104 ) ) ( not ( = ?auto_25091 ?auto_25094 ) ) ( IS-CRATE ?auto_25083 ) ( AVAILABLE ?auto_25094 ) ( SURFACE-AT ?auto_25083 ?auto_25118 ) ( ON ?auto_25083 ?auto_25115 ) ( CLEAR ?auto_25083 ) ( not ( = ?auto_25080 ?auto_25083 ) ) ( not ( = ?auto_25080 ?auto_25115 ) ) ( not ( = ?auto_25083 ?auto_25115 ) ) ( IS-CRATE ?auto_25080 ) ( not ( = ?auto_25112 ?auto_25090 ) ) ( HOIST-AT ?auto_25109 ?auto_25112 ) ( SURFACE-AT ?auto_25080 ?auto_25112 ) ( ON ?auto_25080 ?auto_25098 ) ( CLEAR ?auto_25080 ) ( not ( = ?auto_25079 ?auto_25080 ) ) ( not ( = ?auto_25079 ?auto_25098 ) ) ( not ( = ?auto_25080 ?auto_25098 ) ) ( not ( = ?auto_25091 ?auto_25109 ) ) ( IS-CRATE ?auto_25079 ) ( AVAILABLE ?auto_25089 ) ( SURFACE-AT ?auto_25079 ?auto_25093 ) ( ON ?auto_25079 ?auto_25106 ) ( CLEAR ?auto_25079 ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( not ( = ?auto_25078 ?auto_25106 ) ) ( not ( = ?auto_25079 ?auto_25106 ) ) ( IS-CRATE ?auto_25078 ) ( not ( = ?auto_25111 ?auto_25090 ) ) ( HOIST-AT ?auto_25102 ?auto_25111 ) ( AVAILABLE ?auto_25102 ) ( SURFACE-AT ?auto_25078 ?auto_25111 ) ( ON ?auto_25078 ?auto_25105 ) ( CLEAR ?auto_25078 ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25105 ) ) ( not ( = ?auto_25078 ?auto_25105 ) ) ( not ( = ?auto_25091 ?auto_25102 ) ) ( IS-CRATE ?auto_25077 ) ( AVAILABLE ?auto_25109 ) ( SURFACE-AT ?auto_25077 ?auto_25112 ) ( ON ?auto_25077 ?auto_25114 ) ( CLEAR ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25114 ) ) ( not ( = ?auto_25077 ?auto_25114 ) ) ( IS-CRATE ?auto_25076 ) ( not ( = ?auto_25113 ?auto_25090 ) ) ( HOIST-AT ?auto_25099 ?auto_25113 ) ( AVAILABLE ?auto_25099 ) ( SURFACE-AT ?auto_25076 ?auto_25113 ) ( ON ?auto_25076 ?auto_25100 ) ( CLEAR ?auto_25076 ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25100 ) ) ( not ( = ?auto_25076 ?auto_25100 ) ) ( not ( = ?auto_25091 ?auto_25099 ) ) ( SURFACE-AT ?auto_25074 ?auto_25090 ) ( CLEAR ?auto_25074 ) ( IS-CRATE ?auto_25075 ) ( AVAILABLE ?auto_25091 ) ( AVAILABLE ?auto_25095 ) ( SURFACE-AT ?auto_25075 ?auto_25108 ) ( ON ?auto_25075 ?auto_25096 ) ( CLEAR ?auto_25075 ) ( TRUCK-AT ?auto_25092 ?auto_25090 ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25096 ) ) ( not ( = ?auto_25075 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25100 ) ) ( not ( = ?auto_25076 ?auto_25096 ) ) ( not ( = ?auto_25113 ?auto_25108 ) ) ( not ( = ?auto_25099 ?auto_25095 ) ) ( not ( = ?auto_25100 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) ( not ( = ?auto_25074 ?auto_25114 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25114 ) ) ( not ( = ?auto_25077 ?auto_25100 ) ) ( not ( = ?auto_25077 ?auto_25096 ) ) ( not ( = ?auto_25112 ?auto_25113 ) ) ( not ( = ?auto_25112 ?auto_25108 ) ) ( not ( = ?auto_25109 ?auto_25099 ) ) ( not ( = ?auto_25109 ?auto_25095 ) ) ( not ( = ?auto_25114 ?auto_25100 ) ) ( not ( = ?auto_25114 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25078 ) ) ( not ( = ?auto_25074 ?auto_25105 ) ) ( not ( = ?auto_25075 ?auto_25078 ) ) ( not ( = ?auto_25075 ?auto_25105 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25076 ?auto_25105 ) ) ( not ( = ?auto_25078 ?auto_25114 ) ) ( not ( = ?auto_25078 ?auto_25100 ) ) ( not ( = ?auto_25078 ?auto_25096 ) ) ( not ( = ?auto_25111 ?auto_25112 ) ) ( not ( = ?auto_25111 ?auto_25113 ) ) ( not ( = ?auto_25111 ?auto_25108 ) ) ( not ( = ?auto_25102 ?auto_25109 ) ) ( not ( = ?auto_25102 ?auto_25099 ) ) ( not ( = ?auto_25102 ?auto_25095 ) ) ( not ( = ?auto_25105 ?auto_25114 ) ) ( not ( = ?auto_25105 ?auto_25100 ) ) ( not ( = ?auto_25105 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25079 ) ) ( not ( = ?auto_25074 ?auto_25106 ) ) ( not ( = ?auto_25075 ?auto_25079 ) ) ( not ( = ?auto_25075 ?auto_25106 ) ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25076 ?auto_25106 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25106 ) ) ( not ( = ?auto_25079 ?auto_25105 ) ) ( not ( = ?auto_25079 ?auto_25114 ) ) ( not ( = ?auto_25079 ?auto_25100 ) ) ( not ( = ?auto_25079 ?auto_25096 ) ) ( not ( = ?auto_25093 ?auto_25111 ) ) ( not ( = ?auto_25093 ?auto_25112 ) ) ( not ( = ?auto_25093 ?auto_25113 ) ) ( not ( = ?auto_25093 ?auto_25108 ) ) ( not ( = ?auto_25089 ?auto_25102 ) ) ( not ( = ?auto_25089 ?auto_25109 ) ) ( not ( = ?auto_25089 ?auto_25099 ) ) ( not ( = ?auto_25089 ?auto_25095 ) ) ( not ( = ?auto_25106 ?auto_25105 ) ) ( not ( = ?auto_25106 ?auto_25114 ) ) ( not ( = ?auto_25106 ?auto_25100 ) ) ( not ( = ?auto_25106 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25080 ) ) ( not ( = ?auto_25074 ?auto_25098 ) ) ( not ( = ?auto_25075 ?auto_25080 ) ) ( not ( = ?auto_25075 ?auto_25098 ) ) ( not ( = ?auto_25076 ?auto_25080 ) ) ( not ( = ?auto_25076 ?auto_25098 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25098 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25098 ) ) ( not ( = ?auto_25080 ?auto_25106 ) ) ( not ( = ?auto_25080 ?auto_25105 ) ) ( not ( = ?auto_25080 ?auto_25114 ) ) ( not ( = ?auto_25080 ?auto_25100 ) ) ( not ( = ?auto_25080 ?auto_25096 ) ) ( not ( = ?auto_25098 ?auto_25106 ) ) ( not ( = ?auto_25098 ?auto_25105 ) ) ( not ( = ?auto_25098 ?auto_25114 ) ) ( not ( = ?auto_25098 ?auto_25100 ) ) ( not ( = ?auto_25098 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25083 ) ) ( not ( = ?auto_25074 ?auto_25115 ) ) ( not ( = ?auto_25075 ?auto_25083 ) ) ( not ( = ?auto_25075 ?auto_25115 ) ) ( not ( = ?auto_25076 ?auto_25083 ) ) ( not ( = ?auto_25076 ?auto_25115 ) ) ( not ( = ?auto_25077 ?auto_25083 ) ) ( not ( = ?auto_25077 ?auto_25115 ) ) ( not ( = ?auto_25078 ?auto_25083 ) ) ( not ( = ?auto_25078 ?auto_25115 ) ) ( not ( = ?auto_25079 ?auto_25083 ) ) ( not ( = ?auto_25079 ?auto_25115 ) ) ( not ( = ?auto_25083 ?auto_25098 ) ) ( not ( = ?auto_25083 ?auto_25106 ) ) ( not ( = ?auto_25083 ?auto_25105 ) ) ( not ( = ?auto_25083 ?auto_25114 ) ) ( not ( = ?auto_25083 ?auto_25100 ) ) ( not ( = ?auto_25083 ?auto_25096 ) ) ( not ( = ?auto_25118 ?auto_25112 ) ) ( not ( = ?auto_25118 ?auto_25093 ) ) ( not ( = ?auto_25118 ?auto_25111 ) ) ( not ( = ?auto_25118 ?auto_25113 ) ) ( not ( = ?auto_25118 ?auto_25108 ) ) ( not ( = ?auto_25094 ?auto_25109 ) ) ( not ( = ?auto_25094 ?auto_25089 ) ) ( not ( = ?auto_25094 ?auto_25102 ) ) ( not ( = ?auto_25094 ?auto_25099 ) ) ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25115 ?auto_25098 ) ) ( not ( = ?auto_25115 ?auto_25106 ) ) ( not ( = ?auto_25115 ?auto_25105 ) ) ( not ( = ?auto_25115 ?auto_25114 ) ) ( not ( = ?auto_25115 ?auto_25100 ) ) ( not ( = ?auto_25115 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25082 ) ) ( not ( = ?auto_25074 ?auto_25104 ) ) ( not ( = ?auto_25075 ?auto_25082 ) ) ( not ( = ?auto_25075 ?auto_25104 ) ) ( not ( = ?auto_25076 ?auto_25082 ) ) ( not ( = ?auto_25076 ?auto_25104 ) ) ( not ( = ?auto_25077 ?auto_25082 ) ) ( not ( = ?auto_25077 ?auto_25104 ) ) ( not ( = ?auto_25078 ?auto_25082 ) ) ( not ( = ?auto_25078 ?auto_25104 ) ) ( not ( = ?auto_25079 ?auto_25082 ) ) ( not ( = ?auto_25079 ?auto_25104 ) ) ( not ( = ?auto_25080 ?auto_25082 ) ) ( not ( = ?auto_25080 ?auto_25104 ) ) ( not ( = ?auto_25082 ?auto_25115 ) ) ( not ( = ?auto_25082 ?auto_25098 ) ) ( not ( = ?auto_25082 ?auto_25106 ) ) ( not ( = ?auto_25082 ?auto_25105 ) ) ( not ( = ?auto_25082 ?auto_25114 ) ) ( not ( = ?auto_25082 ?auto_25100 ) ) ( not ( = ?auto_25082 ?auto_25096 ) ) ( not ( = ?auto_25104 ?auto_25115 ) ) ( not ( = ?auto_25104 ?auto_25098 ) ) ( not ( = ?auto_25104 ?auto_25106 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25114 ) ) ( not ( = ?auto_25104 ?auto_25100 ) ) ( not ( = ?auto_25104 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25081 ) ) ( not ( = ?auto_25074 ?auto_25103 ) ) ( not ( = ?auto_25075 ?auto_25081 ) ) ( not ( = ?auto_25075 ?auto_25103 ) ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( not ( = ?auto_25076 ?auto_25103 ) ) ( not ( = ?auto_25077 ?auto_25081 ) ) ( not ( = ?auto_25077 ?auto_25103 ) ) ( not ( = ?auto_25078 ?auto_25081 ) ) ( not ( = ?auto_25078 ?auto_25103 ) ) ( not ( = ?auto_25079 ?auto_25081 ) ) ( not ( = ?auto_25079 ?auto_25103 ) ) ( not ( = ?auto_25080 ?auto_25081 ) ) ( not ( = ?auto_25080 ?auto_25103 ) ) ( not ( = ?auto_25083 ?auto_25081 ) ) ( not ( = ?auto_25083 ?auto_25103 ) ) ( not ( = ?auto_25081 ?auto_25104 ) ) ( not ( = ?auto_25081 ?auto_25115 ) ) ( not ( = ?auto_25081 ?auto_25098 ) ) ( not ( = ?auto_25081 ?auto_25106 ) ) ( not ( = ?auto_25081 ?auto_25105 ) ) ( not ( = ?auto_25081 ?auto_25114 ) ) ( not ( = ?auto_25081 ?auto_25100 ) ) ( not ( = ?auto_25081 ?auto_25096 ) ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25115 ) ) ( not ( = ?auto_25103 ?auto_25098 ) ) ( not ( = ?auto_25103 ?auto_25106 ) ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( not ( = ?auto_25103 ?auto_25114 ) ) ( not ( = ?auto_25103 ?auto_25100 ) ) ( not ( = ?auto_25103 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25084 ) ) ( not ( = ?auto_25074 ?auto_25119 ) ) ( not ( = ?auto_25075 ?auto_25084 ) ) ( not ( = ?auto_25075 ?auto_25119 ) ) ( not ( = ?auto_25076 ?auto_25084 ) ) ( not ( = ?auto_25076 ?auto_25119 ) ) ( not ( = ?auto_25077 ?auto_25084 ) ) ( not ( = ?auto_25077 ?auto_25119 ) ) ( not ( = ?auto_25078 ?auto_25084 ) ) ( not ( = ?auto_25078 ?auto_25119 ) ) ( not ( = ?auto_25079 ?auto_25084 ) ) ( not ( = ?auto_25079 ?auto_25119 ) ) ( not ( = ?auto_25080 ?auto_25084 ) ) ( not ( = ?auto_25080 ?auto_25119 ) ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( not ( = ?auto_25083 ?auto_25119 ) ) ( not ( = ?auto_25082 ?auto_25084 ) ) ( not ( = ?auto_25082 ?auto_25119 ) ) ( not ( = ?auto_25084 ?auto_25103 ) ) ( not ( = ?auto_25084 ?auto_25104 ) ) ( not ( = ?auto_25084 ?auto_25115 ) ) ( not ( = ?auto_25084 ?auto_25098 ) ) ( not ( = ?auto_25084 ?auto_25106 ) ) ( not ( = ?auto_25084 ?auto_25105 ) ) ( not ( = ?auto_25084 ?auto_25114 ) ) ( not ( = ?auto_25084 ?auto_25100 ) ) ( not ( = ?auto_25084 ?auto_25096 ) ) ( not ( = ?auto_25110 ?auto_25108 ) ) ( not ( = ?auto_25110 ?auto_25118 ) ) ( not ( = ?auto_25110 ?auto_25112 ) ) ( not ( = ?auto_25110 ?auto_25093 ) ) ( not ( = ?auto_25110 ?auto_25111 ) ) ( not ( = ?auto_25110 ?auto_25113 ) ) ( not ( = ?auto_25107 ?auto_25095 ) ) ( not ( = ?auto_25107 ?auto_25094 ) ) ( not ( = ?auto_25107 ?auto_25109 ) ) ( not ( = ?auto_25107 ?auto_25089 ) ) ( not ( = ?auto_25107 ?auto_25102 ) ) ( not ( = ?auto_25107 ?auto_25099 ) ) ( not ( = ?auto_25119 ?auto_25103 ) ) ( not ( = ?auto_25119 ?auto_25104 ) ) ( not ( = ?auto_25119 ?auto_25115 ) ) ( not ( = ?auto_25119 ?auto_25098 ) ) ( not ( = ?auto_25119 ?auto_25106 ) ) ( not ( = ?auto_25119 ?auto_25105 ) ) ( not ( = ?auto_25119 ?auto_25114 ) ) ( not ( = ?auto_25119 ?auto_25100 ) ) ( not ( = ?auto_25119 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25085 ) ) ( not ( = ?auto_25074 ?auto_25117 ) ) ( not ( = ?auto_25075 ?auto_25085 ) ) ( not ( = ?auto_25075 ?auto_25117 ) ) ( not ( = ?auto_25076 ?auto_25085 ) ) ( not ( = ?auto_25076 ?auto_25117 ) ) ( not ( = ?auto_25077 ?auto_25085 ) ) ( not ( = ?auto_25077 ?auto_25117 ) ) ( not ( = ?auto_25078 ?auto_25085 ) ) ( not ( = ?auto_25078 ?auto_25117 ) ) ( not ( = ?auto_25079 ?auto_25085 ) ) ( not ( = ?auto_25079 ?auto_25117 ) ) ( not ( = ?auto_25080 ?auto_25085 ) ) ( not ( = ?auto_25080 ?auto_25117 ) ) ( not ( = ?auto_25083 ?auto_25085 ) ) ( not ( = ?auto_25083 ?auto_25117 ) ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25082 ?auto_25117 ) ) ( not ( = ?auto_25081 ?auto_25085 ) ) ( not ( = ?auto_25081 ?auto_25117 ) ) ( not ( = ?auto_25085 ?auto_25119 ) ) ( not ( = ?auto_25085 ?auto_25103 ) ) ( not ( = ?auto_25085 ?auto_25104 ) ) ( not ( = ?auto_25085 ?auto_25115 ) ) ( not ( = ?auto_25085 ?auto_25098 ) ) ( not ( = ?auto_25085 ?auto_25106 ) ) ( not ( = ?auto_25085 ?auto_25105 ) ) ( not ( = ?auto_25085 ?auto_25114 ) ) ( not ( = ?auto_25085 ?auto_25100 ) ) ( not ( = ?auto_25085 ?auto_25096 ) ) ( not ( = ?auto_25097 ?auto_25110 ) ) ( not ( = ?auto_25097 ?auto_25108 ) ) ( not ( = ?auto_25097 ?auto_25118 ) ) ( not ( = ?auto_25097 ?auto_25112 ) ) ( not ( = ?auto_25097 ?auto_25093 ) ) ( not ( = ?auto_25097 ?auto_25111 ) ) ( not ( = ?auto_25097 ?auto_25113 ) ) ( not ( = ?auto_25116 ?auto_25107 ) ) ( not ( = ?auto_25116 ?auto_25095 ) ) ( not ( = ?auto_25116 ?auto_25094 ) ) ( not ( = ?auto_25116 ?auto_25109 ) ) ( not ( = ?auto_25116 ?auto_25089 ) ) ( not ( = ?auto_25116 ?auto_25102 ) ) ( not ( = ?auto_25116 ?auto_25099 ) ) ( not ( = ?auto_25117 ?auto_25119 ) ) ( not ( = ?auto_25117 ?auto_25103 ) ) ( not ( = ?auto_25117 ?auto_25104 ) ) ( not ( = ?auto_25117 ?auto_25115 ) ) ( not ( = ?auto_25117 ?auto_25098 ) ) ( not ( = ?auto_25117 ?auto_25106 ) ) ( not ( = ?auto_25117 ?auto_25105 ) ) ( not ( = ?auto_25117 ?auto_25114 ) ) ( not ( = ?auto_25117 ?auto_25100 ) ) ( not ( = ?auto_25117 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25086 ) ) ( not ( = ?auto_25074 ?auto_25101 ) ) ( not ( = ?auto_25075 ?auto_25086 ) ) ( not ( = ?auto_25075 ?auto_25101 ) ) ( not ( = ?auto_25076 ?auto_25086 ) ) ( not ( = ?auto_25076 ?auto_25101 ) ) ( not ( = ?auto_25077 ?auto_25086 ) ) ( not ( = ?auto_25077 ?auto_25101 ) ) ( not ( = ?auto_25078 ?auto_25086 ) ) ( not ( = ?auto_25078 ?auto_25101 ) ) ( not ( = ?auto_25079 ?auto_25086 ) ) ( not ( = ?auto_25079 ?auto_25101 ) ) ( not ( = ?auto_25080 ?auto_25086 ) ) ( not ( = ?auto_25080 ?auto_25101 ) ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25083 ?auto_25101 ) ) ( not ( = ?auto_25082 ?auto_25086 ) ) ( not ( = ?auto_25082 ?auto_25101 ) ) ( not ( = ?auto_25081 ?auto_25086 ) ) ( not ( = ?auto_25081 ?auto_25101 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25101 ) ) ( not ( = ?auto_25086 ?auto_25117 ) ) ( not ( = ?auto_25086 ?auto_25119 ) ) ( not ( = ?auto_25086 ?auto_25103 ) ) ( not ( = ?auto_25086 ?auto_25104 ) ) ( not ( = ?auto_25086 ?auto_25115 ) ) ( not ( = ?auto_25086 ?auto_25098 ) ) ( not ( = ?auto_25086 ?auto_25106 ) ) ( not ( = ?auto_25086 ?auto_25105 ) ) ( not ( = ?auto_25086 ?auto_25114 ) ) ( not ( = ?auto_25086 ?auto_25100 ) ) ( not ( = ?auto_25086 ?auto_25096 ) ) ( not ( = ?auto_25101 ?auto_25117 ) ) ( not ( = ?auto_25101 ?auto_25119 ) ) ( not ( = ?auto_25101 ?auto_25103 ) ) ( not ( = ?auto_25101 ?auto_25104 ) ) ( not ( = ?auto_25101 ?auto_25115 ) ) ( not ( = ?auto_25101 ?auto_25098 ) ) ( not ( = ?auto_25101 ?auto_25106 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25114 ) ) ( not ( = ?auto_25101 ?auto_25100 ) ) ( not ( = ?auto_25101 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25087 ) ) ( not ( = ?auto_25074 ?auto_25088 ) ) ( not ( = ?auto_25075 ?auto_25087 ) ) ( not ( = ?auto_25075 ?auto_25088 ) ) ( not ( = ?auto_25076 ?auto_25087 ) ) ( not ( = ?auto_25076 ?auto_25088 ) ) ( not ( = ?auto_25077 ?auto_25087 ) ) ( not ( = ?auto_25077 ?auto_25088 ) ) ( not ( = ?auto_25078 ?auto_25087 ) ) ( not ( = ?auto_25078 ?auto_25088 ) ) ( not ( = ?auto_25079 ?auto_25087 ) ) ( not ( = ?auto_25079 ?auto_25088 ) ) ( not ( = ?auto_25080 ?auto_25087 ) ) ( not ( = ?auto_25080 ?auto_25088 ) ) ( not ( = ?auto_25083 ?auto_25087 ) ) ( not ( = ?auto_25083 ?auto_25088 ) ) ( not ( = ?auto_25082 ?auto_25087 ) ) ( not ( = ?auto_25082 ?auto_25088 ) ) ( not ( = ?auto_25081 ?auto_25087 ) ) ( not ( = ?auto_25081 ?auto_25088 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25088 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25088 ) ) ( not ( = ?auto_25087 ?auto_25101 ) ) ( not ( = ?auto_25087 ?auto_25117 ) ) ( not ( = ?auto_25087 ?auto_25119 ) ) ( not ( = ?auto_25087 ?auto_25103 ) ) ( not ( = ?auto_25087 ?auto_25104 ) ) ( not ( = ?auto_25087 ?auto_25115 ) ) ( not ( = ?auto_25087 ?auto_25098 ) ) ( not ( = ?auto_25087 ?auto_25106 ) ) ( not ( = ?auto_25087 ?auto_25105 ) ) ( not ( = ?auto_25087 ?auto_25114 ) ) ( not ( = ?auto_25087 ?auto_25100 ) ) ( not ( = ?auto_25087 ?auto_25096 ) ) ( not ( = ?auto_25088 ?auto_25101 ) ) ( not ( = ?auto_25088 ?auto_25117 ) ) ( not ( = ?auto_25088 ?auto_25119 ) ) ( not ( = ?auto_25088 ?auto_25103 ) ) ( not ( = ?auto_25088 ?auto_25104 ) ) ( not ( = ?auto_25088 ?auto_25115 ) ) ( not ( = ?auto_25088 ?auto_25098 ) ) ( not ( = ?auto_25088 ?auto_25106 ) ) ( not ( = ?auto_25088 ?auto_25105 ) ) ( not ( = ?auto_25088 ?auto_25114 ) ) ( not ( = ?auto_25088 ?auto_25100 ) ) ( not ( = ?auto_25088 ?auto_25096 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25083 ?auto_25082 ?auto_25081 ?auto_25084 ?auto_25085 ?auto_25086 )
      ( MAKE-1CRATE ?auto_25086 ?auto_25087 )
      ( MAKE-13CRATE-VERIFY ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25083 ?auto_25082 ?auto_25081 ?auto_25084 ?auto_25085 ?auto_25086 ?auto_25087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25122 - SURFACE
      ?auto_25123 - SURFACE
    )
    :vars
    (
      ?auto_25124 - HOIST
      ?auto_25125 - PLACE
      ?auto_25127 - PLACE
      ?auto_25128 - HOIST
      ?auto_25129 - SURFACE
      ?auto_25126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25124 ?auto_25125 ) ( SURFACE-AT ?auto_25122 ?auto_25125 ) ( CLEAR ?auto_25122 ) ( IS-CRATE ?auto_25123 ) ( AVAILABLE ?auto_25124 ) ( not ( = ?auto_25127 ?auto_25125 ) ) ( HOIST-AT ?auto_25128 ?auto_25127 ) ( AVAILABLE ?auto_25128 ) ( SURFACE-AT ?auto_25123 ?auto_25127 ) ( ON ?auto_25123 ?auto_25129 ) ( CLEAR ?auto_25123 ) ( TRUCK-AT ?auto_25126 ?auto_25125 ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25129 ) ) ( not ( = ?auto_25123 ?auto_25129 ) ) ( not ( = ?auto_25124 ?auto_25128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25126 ?auto_25125 ?auto_25127 )
      ( !LIFT ?auto_25128 ?auto_25123 ?auto_25129 ?auto_25127 )
      ( !LOAD ?auto_25128 ?auto_25123 ?auto_25126 ?auto_25127 )
      ( !DRIVE ?auto_25126 ?auto_25127 ?auto_25125 )
      ( !UNLOAD ?auto_25124 ?auto_25123 ?auto_25126 ?auto_25125 )
      ( !DROP ?auto_25124 ?auto_25123 ?auto_25122 ?auto_25125 )
      ( MAKE-1CRATE-VERIFY ?auto_25122 ?auto_25123 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25145 - SURFACE
      ?auto_25146 - SURFACE
      ?auto_25147 - SURFACE
      ?auto_25148 - SURFACE
      ?auto_25149 - SURFACE
      ?auto_25150 - SURFACE
      ?auto_25151 - SURFACE
      ?auto_25154 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25152 - SURFACE
      ?auto_25155 - SURFACE
      ?auto_25156 - SURFACE
      ?auto_25157 - SURFACE
      ?auto_25158 - SURFACE
      ?auto_25159 - SURFACE
    )
    :vars
    (
      ?auto_25160 - HOIST
      ?auto_25165 - PLACE
      ?auto_25162 - PLACE
      ?auto_25164 - HOIST
      ?auto_25163 - SURFACE
      ?auto_25180 - PLACE
      ?auto_25190 - HOIST
      ?auto_25181 - SURFACE
      ?auto_25170 - PLACE
      ?auto_25188 - HOIST
      ?auto_25166 - SURFACE
      ?auto_25184 - PLACE
      ?auto_25175 - HOIST
      ?auto_25177 - SURFACE
      ?auto_25179 - SURFACE
      ?auto_25167 - PLACE
      ?auto_25186 - HOIST
      ?auto_25176 - SURFACE
      ?auto_25173 - SURFACE
      ?auto_25169 - SURFACE
      ?auto_25192 - PLACE
      ?auto_25171 - HOIST
      ?auto_25185 - SURFACE
      ?auto_25172 - SURFACE
      ?auto_25178 - PLACE
      ?auto_25187 - HOIST
      ?auto_25182 - SURFACE
      ?auto_25191 - SURFACE
      ?auto_25183 - PLACE
      ?auto_25174 - HOIST
      ?auto_25168 - SURFACE
      ?auto_25189 - SURFACE
      ?auto_25161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25160 ?auto_25165 ) ( IS-CRATE ?auto_25159 ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( HOIST-AT ?auto_25164 ?auto_25162 ) ( SURFACE-AT ?auto_25159 ?auto_25162 ) ( ON ?auto_25159 ?auto_25163 ) ( CLEAR ?auto_25159 ) ( not ( = ?auto_25158 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25163 ) ) ( not ( = ?auto_25159 ?auto_25163 ) ) ( not ( = ?auto_25160 ?auto_25164 ) ) ( IS-CRATE ?auto_25158 ) ( not ( = ?auto_25180 ?auto_25165 ) ) ( HOIST-AT ?auto_25190 ?auto_25180 ) ( SURFACE-AT ?auto_25158 ?auto_25180 ) ( ON ?auto_25158 ?auto_25181 ) ( CLEAR ?auto_25158 ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25181 ) ) ( not ( = ?auto_25158 ?auto_25181 ) ) ( not ( = ?auto_25160 ?auto_25190 ) ) ( IS-CRATE ?auto_25157 ) ( not ( = ?auto_25170 ?auto_25165 ) ) ( HOIST-AT ?auto_25188 ?auto_25170 ) ( SURFACE-AT ?auto_25157 ?auto_25170 ) ( ON ?auto_25157 ?auto_25166 ) ( CLEAR ?auto_25157 ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25166 ) ) ( not ( = ?auto_25157 ?auto_25166 ) ) ( not ( = ?auto_25160 ?auto_25188 ) ) ( IS-CRATE ?auto_25156 ) ( not ( = ?auto_25184 ?auto_25165 ) ) ( HOIST-AT ?auto_25175 ?auto_25184 ) ( AVAILABLE ?auto_25175 ) ( SURFACE-AT ?auto_25156 ?auto_25184 ) ( ON ?auto_25156 ?auto_25177 ) ( CLEAR ?auto_25156 ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25177 ) ) ( not ( = ?auto_25156 ?auto_25177 ) ) ( not ( = ?auto_25160 ?auto_25175 ) ) ( IS-CRATE ?auto_25155 ) ( AVAILABLE ?auto_25188 ) ( SURFACE-AT ?auto_25155 ?auto_25170 ) ( ON ?auto_25155 ?auto_25179 ) ( CLEAR ?auto_25155 ) ( not ( = ?auto_25152 ?auto_25155 ) ) ( not ( = ?auto_25152 ?auto_25179 ) ) ( not ( = ?auto_25155 ?auto_25179 ) ) ( IS-CRATE ?auto_25152 ) ( not ( = ?auto_25167 ?auto_25165 ) ) ( HOIST-AT ?auto_25186 ?auto_25167 ) ( SURFACE-AT ?auto_25152 ?auto_25167 ) ( ON ?auto_25152 ?auto_25176 ) ( CLEAR ?auto_25152 ) ( not ( = ?auto_25153 ?auto_25152 ) ) ( not ( = ?auto_25153 ?auto_25176 ) ) ( not ( = ?auto_25152 ?auto_25176 ) ) ( not ( = ?auto_25160 ?auto_25186 ) ) ( IS-CRATE ?auto_25153 ) ( SURFACE-AT ?auto_25153 ?auto_25162 ) ( ON ?auto_25153 ?auto_25173 ) ( CLEAR ?auto_25153 ) ( not ( = ?auto_25154 ?auto_25153 ) ) ( not ( = ?auto_25154 ?auto_25173 ) ) ( not ( = ?auto_25153 ?auto_25173 ) ) ( IS-CRATE ?auto_25154 ) ( AVAILABLE ?auto_25164 ) ( SURFACE-AT ?auto_25154 ?auto_25162 ) ( ON ?auto_25154 ?auto_25169 ) ( CLEAR ?auto_25154 ) ( not ( = ?auto_25151 ?auto_25154 ) ) ( not ( = ?auto_25151 ?auto_25169 ) ) ( not ( = ?auto_25154 ?auto_25169 ) ) ( IS-CRATE ?auto_25151 ) ( not ( = ?auto_25192 ?auto_25165 ) ) ( HOIST-AT ?auto_25171 ?auto_25192 ) ( SURFACE-AT ?auto_25151 ?auto_25192 ) ( ON ?auto_25151 ?auto_25185 ) ( CLEAR ?auto_25151 ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25150 ?auto_25185 ) ) ( not ( = ?auto_25151 ?auto_25185 ) ) ( not ( = ?auto_25160 ?auto_25171 ) ) ( IS-CRATE ?auto_25150 ) ( AVAILABLE ?auto_25190 ) ( SURFACE-AT ?auto_25150 ?auto_25180 ) ( ON ?auto_25150 ?auto_25172 ) ( CLEAR ?auto_25150 ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25149 ?auto_25172 ) ) ( not ( = ?auto_25150 ?auto_25172 ) ) ( IS-CRATE ?auto_25149 ) ( not ( = ?auto_25178 ?auto_25165 ) ) ( HOIST-AT ?auto_25187 ?auto_25178 ) ( AVAILABLE ?auto_25187 ) ( SURFACE-AT ?auto_25149 ?auto_25178 ) ( ON ?auto_25149 ?auto_25182 ) ( CLEAR ?auto_25149 ) ( not ( = ?auto_25148 ?auto_25149 ) ) ( not ( = ?auto_25148 ?auto_25182 ) ) ( not ( = ?auto_25149 ?auto_25182 ) ) ( not ( = ?auto_25160 ?auto_25187 ) ) ( IS-CRATE ?auto_25148 ) ( AVAILABLE ?auto_25171 ) ( SURFACE-AT ?auto_25148 ?auto_25192 ) ( ON ?auto_25148 ?auto_25191 ) ( CLEAR ?auto_25148 ) ( not ( = ?auto_25147 ?auto_25148 ) ) ( not ( = ?auto_25147 ?auto_25191 ) ) ( not ( = ?auto_25148 ?auto_25191 ) ) ( IS-CRATE ?auto_25147 ) ( not ( = ?auto_25183 ?auto_25165 ) ) ( HOIST-AT ?auto_25174 ?auto_25183 ) ( AVAILABLE ?auto_25174 ) ( SURFACE-AT ?auto_25147 ?auto_25183 ) ( ON ?auto_25147 ?auto_25168 ) ( CLEAR ?auto_25147 ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25168 ) ) ( not ( = ?auto_25147 ?auto_25168 ) ) ( not ( = ?auto_25160 ?auto_25174 ) ) ( SURFACE-AT ?auto_25145 ?auto_25165 ) ( CLEAR ?auto_25145 ) ( IS-CRATE ?auto_25146 ) ( AVAILABLE ?auto_25160 ) ( AVAILABLE ?auto_25186 ) ( SURFACE-AT ?auto_25146 ?auto_25167 ) ( ON ?auto_25146 ?auto_25189 ) ( CLEAR ?auto_25146 ) ( TRUCK-AT ?auto_25161 ?auto_25165 ) ( not ( = ?auto_25145 ?auto_25146 ) ) ( not ( = ?auto_25145 ?auto_25189 ) ) ( not ( = ?auto_25146 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( not ( = ?auto_25145 ?auto_25168 ) ) ( not ( = ?auto_25147 ?auto_25189 ) ) ( not ( = ?auto_25183 ?auto_25167 ) ) ( not ( = ?auto_25174 ?auto_25186 ) ) ( not ( = ?auto_25168 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25191 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25191 ) ) ( not ( = ?auto_25148 ?auto_25168 ) ) ( not ( = ?auto_25148 ?auto_25189 ) ) ( not ( = ?auto_25192 ?auto_25183 ) ) ( not ( = ?auto_25192 ?auto_25167 ) ) ( not ( = ?auto_25171 ?auto_25174 ) ) ( not ( = ?auto_25171 ?auto_25186 ) ) ( not ( = ?auto_25191 ?auto_25168 ) ) ( not ( = ?auto_25191 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25149 ) ) ( not ( = ?auto_25145 ?auto_25182 ) ) ( not ( = ?auto_25146 ?auto_25149 ) ) ( not ( = ?auto_25146 ?auto_25182 ) ) ( not ( = ?auto_25147 ?auto_25149 ) ) ( not ( = ?auto_25147 ?auto_25182 ) ) ( not ( = ?auto_25149 ?auto_25191 ) ) ( not ( = ?auto_25149 ?auto_25168 ) ) ( not ( = ?auto_25149 ?auto_25189 ) ) ( not ( = ?auto_25178 ?auto_25192 ) ) ( not ( = ?auto_25178 ?auto_25183 ) ) ( not ( = ?auto_25178 ?auto_25167 ) ) ( not ( = ?auto_25187 ?auto_25171 ) ) ( not ( = ?auto_25187 ?auto_25174 ) ) ( not ( = ?auto_25187 ?auto_25186 ) ) ( not ( = ?auto_25182 ?auto_25191 ) ) ( not ( = ?auto_25182 ?auto_25168 ) ) ( not ( = ?auto_25182 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25150 ) ) ( not ( = ?auto_25145 ?auto_25172 ) ) ( not ( = ?auto_25146 ?auto_25150 ) ) ( not ( = ?auto_25146 ?auto_25172 ) ) ( not ( = ?auto_25147 ?auto_25150 ) ) ( not ( = ?auto_25147 ?auto_25172 ) ) ( not ( = ?auto_25148 ?auto_25150 ) ) ( not ( = ?auto_25148 ?auto_25172 ) ) ( not ( = ?auto_25150 ?auto_25182 ) ) ( not ( = ?auto_25150 ?auto_25191 ) ) ( not ( = ?auto_25150 ?auto_25168 ) ) ( not ( = ?auto_25150 ?auto_25189 ) ) ( not ( = ?auto_25180 ?auto_25178 ) ) ( not ( = ?auto_25180 ?auto_25192 ) ) ( not ( = ?auto_25180 ?auto_25183 ) ) ( not ( = ?auto_25180 ?auto_25167 ) ) ( not ( = ?auto_25190 ?auto_25187 ) ) ( not ( = ?auto_25190 ?auto_25171 ) ) ( not ( = ?auto_25190 ?auto_25174 ) ) ( not ( = ?auto_25190 ?auto_25186 ) ) ( not ( = ?auto_25172 ?auto_25182 ) ) ( not ( = ?auto_25172 ?auto_25191 ) ) ( not ( = ?auto_25172 ?auto_25168 ) ) ( not ( = ?auto_25172 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25151 ) ) ( not ( = ?auto_25145 ?auto_25185 ) ) ( not ( = ?auto_25146 ?auto_25151 ) ) ( not ( = ?auto_25146 ?auto_25185 ) ) ( not ( = ?auto_25147 ?auto_25151 ) ) ( not ( = ?auto_25147 ?auto_25185 ) ) ( not ( = ?auto_25148 ?auto_25151 ) ) ( not ( = ?auto_25148 ?auto_25185 ) ) ( not ( = ?auto_25149 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25185 ) ) ( not ( = ?auto_25151 ?auto_25172 ) ) ( not ( = ?auto_25151 ?auto_25182 ) ) ( not ( = ?auto_25151 ?auto_25191 ) ) ( not ( = ?auto_25151 ?auto_25168 ) ) ( not ( = ?auto_25151 ?auto_25189 ) ) ( not ( = ?auto_25185 ?auto_25172 ) ) ( not ( = ?auto_25185 ?auto_25182 ) ) ( not ( = ?auto_25185 ?auto_25191 ) ) ( not ( = ?auto_25185 ?auto_25168 ) ) ( not ( = ?auto_25185 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25154 ) ) ( not ( = ?auto_25145 ?auto_25169 ) ) ( not ( = ?auto_25146 ?auto_25154 ) ) ( not ( = ?auto_25146 ?auto_25169 ) ) ( not ( = ?auto_25147 ?auto_25154 ) ) ( not ( = ?auto_25147 ?auto_25169 ) ) ( not ( = ?auto_25148 ?auto_25154 ) ) ( not ( = ?auto_25148 ?auto_25169 ) ) ( not ( = ?auto_25149 ?auto_25154 ) ) ( not ( = ?auto_25149 ?auto_25169 ) ) ( not ( = ?auto_25150 ?auto_25154 ) ) ( not ( = ?auto_25150 ?auto_25169 ) ) ( not ( = ?auto_25154 ?auto_25185 ) ) ( not ( = ?auto_25154 ?auto_25172 ) ) ( not ( = ?auto_25154 ?auto_25182 ) ) ( not ( = ?auto_25154 ?auto_25191 ) ) ( not ( = ?auto_25154 ?auto_25168 ) ) ( not ( = ?auto_25154 ?auto_25189 ) ) ( not ( = ?auto_25162 ?auto_25192 ) ) ( not ( = ?auto_25162 ?auto_25180 ) ) ( not ( = ?auto_25162 ?auto_25178 ) ) ( not ( = ?auto_25162 ?auto_25183 ) ) ( not ( = ?auto_25162 ?auto_25167 ) ) ( not ( = ?auto_25164 ?auto_25171 ) ) ( not ( = ?auto_25164 ?auto_25190 ) ) ( not ( = ?auto_25164 ?auto_25187 ) ) ( not ( = ?auto_25164 ?auto_25174 ) ) ( not ( = ?auto_25164 ?auto_25186 ) ) ( not ( = ?auto_25169 ?auto_25185 ) ) ( not ( = ?auto_25169 ?auto_25172 ) ) ( not ( = ?auto_25169 ?auto_25182 ) ) ( not ( = ?auto_25169 ?auto_25191 ) ) ( not ( = ?auto_25169 ?auto_25168 ) ) ( not ( = ?auto_25169 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25153 ) ) ( not ( = ?auto_25145 ?auto_25173 ) ) ( not ( = ?auto_25146 ?auto_25153 ) ) ( not ( = ?auto_25146 ?auto_25173 ) ) ( not ( = ?auto_25147 ?auto_25153 ) ) ( not ( = ?auto_25147 ?auto_25173 ) ) ( not ( = ?auto_25148 ?auto_25153 ) ) ( not ( = ?auto_25148 ?auto_25173 ) ) ( not ( = ?auto_25149 ?auto_25153 ) ) ( not ( = ?auto_25149 ?auto_25173 ) ) ( not ( = ?auto_25150 ?auto_25153 ) ) ( not ( = ?auto_25150 ?auto_25173 ) ) ( not ( = ?auto_25151 ?auto_25153 ) ) ( not ( = ?auto_25151 ?auto_25173 ) ) ( not ( = ?auto_25153 ?auto_25169 ) ) ( not ( = ?auto_25153 ?auto_25185 ) ) ( not ( = ?auto_25153 ?auto_25172 ) ) ( not ( = ?auto_25153 ?auto_25182 ) ) ( not ( = ?auto_25153 ?auto_25191 ) ) ( not ( = ?auto_25153 ?auto_25168 ) ) ( not ( = ?auto_25153 ?auto_25189 ) ) ( not ( = ?auto_25173 ?auto_25169 ) ) ( not ( = ?auto_25173 ?auto_25185 ) ) ( not ( = ?auto_25173 ?auto_25172 ) ) ( not ( = ?auto_25173 ?auto_25182 ) ) ( not ( = ?auto_25173 ?auto_25191 ) ) ( not ( = ?auto_25173 ?auto_25168 ) ) ( not ( = ?auto_25173 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25152 ) ) ( not ( = ?auto_25145 ?auto_25176 ) ) ( not ( = ?auto_25146 ?auto_25152 ) ) ( not ( = ?auto_25146 ?auto_25176 ) ) ( not ( = ?auto_25147 ?auto_25152 ) ) ( not ( = ?auto_25147 ?auto_25176 ) ) ( not ( = ?auto_25148 ?auto_25152 ) ) ( not ( = ?auto_25148 ?auto_25176 ) ) ( not ( = ?auto_25149 ?auto_25152 ) ) ( not ( = ?auto_25149 ?auto_25176 ) ) ( not ( = ?auto_25150 ?auto_25152 ) ) ( not ( = ?auto_25150 ?auto_25176 ) ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( not ( = ?auto_25151 ?auto_25176 ) ) ( not ( = ?auto_25154 ?auto_25152 ) ) ( not ( = ?auto_25154 ?auto_25176 ) ) ( not ( = ?auto_25152 ?auto_25173 ) ) ( not ( = ?auto_25152 ?auto_25169 ) ) ( not ( = ?auto_25152 ?auto_25185 ) ) ( not ( = ?auto_25152 ?auto_25172 ) ) ( not ( = ?auto_25152 ?auto_25182 ) ) ( not ( = ?auto_25152 ?auto_25191 ) ) ( not ( = ?auto_25152 ?auto_25168 ) ) ( not ( = ?auto_25152 ?auto_25189 ) ) ( not ( = ?auto_25176 ?auto_25173 ) ) ( not ( = ?auto_25176 ?auto_25169 ) ) ( not ( = ?auto_25176 ?auto_25185 ) ) ( not ( = ?auto_25176 ?auto_25172 ) ) ( not ( = ?auto_25176 ?auto_25182 ) ) ( not ( = ?auto_25176 ?auto_25191 ) ) ( not ( = ?auto_25176 ?auto_25168 ) ) ( not ( = ?auto_25176 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25155 ) ) ( not ( = ?auto_25145 ?auto_25179 ) ) ( not ( = ?auto_25146 ?auto_25155 ) ) ( not ( = ?auto_25146 ?auto_25179 ) ) ( not ( = ?auto_25147 ?auto_25155 ) ) ( not ( = ?auto_25147 ?auto_25179 ) ) ( not ( = ?auto_25148 ?auto_25155 ) ) ( not ( = ?auto_25148 ?auto_25179 ) ) ( not ( = ?auto_25149 ?auto_25155 ) ) ( not ( = ?auto_25149 ?auto_25179 ) ) ( not ( = ?auto_25150 ?auto_25155 ) ) ( not ( = ?auto_25150 ?auto_25179 ) ) ( not ( = ?auto_25151 ?auto_25155 ) ) ( not ( = ?auto_25151 ?auto_25179 ) ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25179 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25179 ) ) ( not ( = ?auto_25155 ?auto_25176 ) ) ( not ( = ?auto_25155 ?auto_25173 ) ) ( not ( = ?auto_25155 ?auto_25169 ) ) ( not ( = ?auto_25155 ?auto_25185 ) ) ( not ( = ?auto_25155 ?auto_25172 ) ) ( not ( = ?auto_25155 ?auto_25182 ) ) ( not ( = ?auto_25155 ?auto_25191 ) ) ( not ( = ?auto_25155 ?auto_25168 ) ) ( not ( = ?auto_25155 ?auto_25189 ) ) ( not ( = ?auto_25170 ?auto_25167 ) ) ( not ( = ?auto_25170 ?auto_25162 ) ) ( not ( = ?auto_25170 ?auto_25192 ) ) ( not ( = ?auto_25170 ?auto_25180 ) ) ( not ( = ?auto_25170 ?auto_25178 ) ) ( not ( = ?auto_25170 ?auto_25183 ) ) ( not ( = ?auto_25188 ?auto_25186 ) ) ( not ( = ?auto_25188 ?auto_25164 ) ) ( not ( = ?auto_25188 ?auto_25171 ) ) ( not ( = ?auto_25188 ?auto_25190 ) ) ( not ( = ?auto_25188 ?auto_25187 ) ) ( not ( = ?auto_25188 ?auto_25174 ) ) ( not ( = ?auto_25179 ?auto_25176 ) ) ( not ( = ?auto_25179 ?auto_25173 ) ) ( not ( = ?auto_25179 ?auto_25169 ) ) ( not ( = ?auto_25179 ?auto_25185 ) ) ( not ( = ?auto_25179 ?auto_25172 ) ) ( not ( = ?auto_25179 ?auto_25182 ) ) ( not ( = ?auto_25179 ?auto_25191 ) ) ( not ( = ?auto_25179 ?auto_25168 ) ) ( not ( = ?auto_25179 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25156 ) ) ( not ( = ?auto_25145 ?auto_25177 ) ) ( not ( = ?auto_25146 ?auto_25156 ) ) ( not ( = ?auto_25146 ?auto_25177 ) ) ( not ( = ?auto_25147 ?auto_25156 ) ) ( not ( = ?auto_25147 ?auto_25177 ) ) ( not ( = ?auto_25148 ?auto_25156 ) ) ( not ( = ?auto_25148 ?auto_25177 ) ) ( not ( = ?auto_25149 ?auto_25156 ) ) ( not ( = ?auto_25149 ?auto_25177 ) ) ( not ( = ?auto_25150 ?auto_25156 ) ) ( not ( = ?auto_25150 ?auto_25177 ) ) ( not ( = ?auto_25151 ?auto_25156 ) ) ( not ( = ?auto_25151 ?auto_25177 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25154 ?auto_25177 ) ) ( not ( = ?auto_25153 ?auto_25156 ) ) ( not ( = ?auto_25153 ?auto_25177 ) ) ( not ( = ?auto_25152 ?auto_25156 ) ) ( not ( = ?auto_25152 ?auto_25177 ) ) ( not ( = ?auto_25156 ?auto_25179 ) ) ( not ( = ?auto_25156 ?auto_25176 ) ) ( not ( = ?auto_25156 ?auto_25173 ) ) ( not ( = ?auto_25156 ?auto_25169 ) ) ( not ( = ?auto_25156 ?auto_25185 ) ) ( not ( = ?auto_25156 ?auto_25172 ) ) ( not ( = ?auto_25156 ?auto_25182 ) ) ( not ( = ?auto_25156 ?auto_25191 ) ) ( not ( = ?auto_25156 ?auto_25168 ) ) ( not ( = ?auto_25156 ?auto_25189 ) ) ( not ( = ?auto_25184 ?auto_25170 ) ) ( not ( = ?auto_25184 ?auto_25167 ) ) ( not ( = ?auto_25184 ?auto_25162 ) ) ( not ( = ?auto_25184 ?auto_25192 ) ) ( not ( = ?auto_25184 ?auto_25180 ) ) ( not ( = ?auto_25184 ?auto_25178 ) ) ( not ( = ?auto_25184 ?auto_25183 ) ) ( not ( = ?auto_25175 ?auto_25188 ) ) ( not ( = ?auto_25175 ?auto_25186 ) ) ( not ( = ?auto_25175 ?auto_25164 ) ) ( not ( = ?auto_25175 ?auto_25171 ) ) ( not ( = ?auto_25175 ?auto_25190 ) ) ( not ( = ?auto_25175 ?auto_25187 ) ) ( not ( = ?auto_25175 ?auto_25174 ) ) ( not ( = ?auto_25177 ?auto_25179 ) ) ( not ( = ?auto_25177 ?auto_25176 ) ) ( not ( = ?auto_25177 ?auto_25173 ) ) ( not ( = ?auto_25177 ?auto_25169 ) ) ( not ( = ?auto_25177 ?auto_25185 ) ) ( not ( = ?auto_25177 ?auto_25172 ) ) ( not ( = ?auto_25177 ?auto_25182 ) ) ( not ( = ?auto_25177 ?auto_25191 ) ) ( not ( = ?auto_25177 ?auto_25168 ) ) ( not ( = ?auto_25177 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25157 ) ) ( not ( = ?auto_25145 ?auto_25166 ) ) ( not ( = ?auto_25146 ?auto_25157 ) ) ( not ( = ?auto_25146 ?auto_25166 ) ) ( not ( = ?auto_25147 ?auto_25157 ) ) ( not ( = ?auto_25147 ?auto_25166 ) ) ( not ( = ?auto_25148 ?auto_25157 ) ) ( not ( = ?auto_25148 ?auto_25166 ) ) ( not ( = ?auto_25149 ?auto_25157 ) ) ( not ( = ?auto_25149 ?auto_25166 ) ) ( not ( = ?auto_25150 ?auto_25157 ) ) ( not ( = ?auto_25150 ?auto_25166 ) ) ( not ( = ?auto_25151 ?auto_25157 ) ) ( not ( = ?auto_25151 ?auto_25166 ) ) ( not ( = ?auto_25154 ?auto_25157 ) ) ( not ( = ?auto_25154 ?auto_25166 ) ) ( not ( = ?auto_25153 ?auto_25157 ) ) ( not ( = ?auto_25153 ?auto_25166 ) ) ( not ( = ?auto_25152 ?auto_25157 ) ) ( not ( = ?auto_25152 ?auto_25166 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( not ( = ?auto_25155 ?auto_25166 ) ) ( not ( = ?auto_25157 ?auto_25177 ) ) ( not ( = ?auto_25157 ?auto_25179 ) ) ( not ( = ?auto_25157 ?auto_25176 ) ) ( not ( = ?auto_25157 ?auto_25173 ) ) ( not ( = ?auto_25157 ?auto_25169 ) ) ( not ( = ?auto_25157 ?auto_25185 ) ) ( not ( = ?auto_25157 ?auto_25172 ) ) ( not ( = ?auto_25157 ?auto_25182 ) ) ( not ( = ?auto_25157 ?auto_25191 ) ) ( not ( = ?auto_25157 ?auto_25168 ) ) ( not ( = ?auto_25157 ?auto_25189 ) ) ( not ( = ?auto_25166 ?auto_25177 ) ) ( not ( = ?auto_25166 ?auto_25179 ) ) ( not ( = ?auto_25166 ?auto_25176 ) ) ( not ( = ?auto_25166 ?auto_25173 ) ) ( not ( = ?auto_25166 ?auto_25169 ) ) ( not ( = ?auto_25166 ?auto_25185 ) ) ( not ( = ?auto_25166 ?auto_25172 ) ) ( not ( = ?auto_25166 ?auto_25182 ) ) ( not ( = ?auto_25166 ?auto_25191 ) ) ( not ( = ?auto_25166 ?auto_25168 ) ) ( not ( = ?auto_25166 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25158 ) ) ( not ( = ?auto_25145 ?auto_25181 ) ) ( not ( = ?auto_25146 ?auto_25158 ) ) ( not ( = ?auto_25146 ?auto_25181 ) ) ( not ( = ?auto_25147 ?auto_25158 ) ) ( not ( = ?auto_25147 ?auto_25181 ) ) ( not ( = ?auto_25148 ?auto_25158 ) ) ( not ( = ?auto_25148 ?auto_25181 ) ) ( not ( = ?auto_25149 ?auto_25158 ) ) ( not ( = ?auto_25149 ?auto_25181 ) ) ( not ( = ?auto_25150 ?auto_25158 ) ) ( not ( = ?auto_25150 ?auto_25181 ) ) ( not ( = ?auto_25151 ?auto_25158 ) ) ( not ( = ?auto_25151 ?auto_25181 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25154 ?auto_25181 ) ) ( not ( = ?auto_25153 ?auto_25158 ) ) ( not ( = ?auto_25153 ?auto_25181 ) ) ( not ( = ?auto_25152 ?auto_25158 ) ) ( not ( = ?auto_25152 ?auto_25181 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25181 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25181 ) ) ( not ( = ?auto_25158 ?auto_25166 ) ) ( not ( = ?auto_25158 ?auto_25177 ) ) ( not ( = ?auto_25158 ?auto_25179 ) ) ( not ( = ?auto_25158 ?auto_25176 ) ) ( not ( = ?auto_25158 ?auto_25173 ) ) ( not ( = ?auto_25158 ?auto_25169 ) ) ( not ( = ?auto_25158 ?auto_25185 ) ) ( not ( = ?auto_25158 ?auto_25172 ) ) ( not ( = ?auto_25158 ?auto_25182 ) ) ( not ( = ?auto_25158 ?auto_25191 ) ) ( not ( = ?auto_25158 ?auto_25168 ) ) ( not ( = ?auto_25158 ?auto_25189 ) ) ( not ( = ?auto_25181 ?auto_25166 ) ) ( not ( = ?auto_25181 ?auto_25177 ) ) ( not ( = ?auto_25181 ?auto_25179 ) ) ( not ( = ?auto_25181 ?auto_25176 ) ) ( not ( = ?auto_25181 ?auto_25173 ) ) ( not ( = ?auto_25181 ?auto_25169 ) ) ( not ( = ?auto_25181 ?auto_25185 ) ) ( not ( = ?auto_25181 ?auto_25172 ) ) ( not ( = ?auto_25181 ?auto_25182 ) ) ( not ( = ?auto_25181 ?auto_25191 ) ) ( not ( = ?auto_25181 ?auto_25168 ) ) ( not ( = ?auto_25181 ?auto_25189 ) ) ( not ( = ?auto_25145 ?auto_25159 ) ) ( not ( = ?auto_25145 ?auto_25163 ) ) ( not ( = ?auto_25146 ?auto_25159 ) ) ( not ( = ?auto_25146 ?auto_25163 ) ) ( not ( = ?auto_25147 ?auto_25159 ) ) ( not ( = ?auto_25147 ?auto_25163 ) ) ( not ( = ?auto_25148 ?auto_25159 ) ) ( not ( = ?auto_25148 ?auto_25163 ) ) ( not ( = ?auto_25149 ?auto_25159 ) ) ( not ( = ?auto_25149 ?auto_25163 ) ) ( not ( = ?auto_25150 ?auto_25159 ) ) ( not ( = ?auto_25150 ?auto_25163 ) ) ( not ( = ?auto_25151 ?auto_25159 ) ) ( not ( = ?auto_25151 ?auto_25163 ) ) ( not ( = ?auto_25154 ?auto_25159 ) ) ( not ( = ?auto_25154 ?auto_25163 ) ) ( not ( = ?auto_25153 ?auto_25159 ) ) ( not ( = ?auto_25153 ?auto_25163 ) ) ( not ( = ?auto_25152 ?auto_25159 ) ) ( not ( = ?auto_25152 ?auto_25163 ) ) ( not ( = ?auto_25155 ?auto_25159 ) ) ( not ( = ?auto_25155 ?auto_25163 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25163 ) ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25163 ) ) ( not ( = ?auto_25159 ?auto_25181 ) ) ( not ( = ?auto_25159 ?auto_25166 ) ) ( not ( = ?auto_25159 ?auto_25177 ) ) ( not ( = ?auto_25159 ?auto_25179 ) ) ( not ( = ?auto_25159 ?auto_25176 ) ) ( not ( = ?auto_25159 ?auto_25173 ) ) ( not ( = ?auto_25159 ?auto_25169 ) ) ( not ( = ?auto_25159 ?auto_25185 ) ) ( not ( = ?auto_25159 ?auto_25172 ) ) ( not ( = ?auto_25159 ?auto_25182 ) ) ( not ( = ?auto_25159 ?auto_25191 ) ) ( not ( = ?auto_25159 ?auto_25168 ) ) ( not ( = ?auto_25159 ?auto_25189 ) ) ( not ( = ?auto_25163 ?auto_25181 ) ) ( not ( = ?auto_25163 ?auto_25166 ) ) ( not ( = ?auto_25163 ?auto_25177 ) ) ( not ( = ?auto_25163 ?auto_25179 ) ) ( not ( = ?auto_25163 ?auto_25176 ) ) ( not ( = ?auto_25163 ?auto_25173 ) ) ( not ( = ?auto_25163 ?auto_25169 ) ) ( not ( = ?auto_25163 ?auto_25185 ) ) ( not ( = ?auto_25163 ?auto_25172 ) ) ( not ( = ?auto_25163 ?auto_25182 ) ) ( not ( = ?auto_25163 ?auto_25191 ) ) ( not ( = ?auto_25163 ?auto_25168 ) ) ( not ( = ?auto_25163 ?auto_25189 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25145 ?auto_25146 ?auto_25147 ?auto_25148 ?auto_25149 ?auto_25150 ?auto_25151 ?auto_25154 ?auto_25153 ?auto_25152 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25158 )
      ( MAKE-1CRATE ?auto_25158 ?auto_25159 )
      ( MAKE-14CRATE-VERIFY ?auto_25145 ?auto_25146 ?auto_25147 ?auto_25148 ?auto_25149 ?auto_25150 ?auto_25151 ?auto_25154 ?auto_25153 ?auto_25152 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25158 ?auto_25159 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25195 - SURFACE
      ?auto_25196 - SURFACE
    )
    :vars
    (
      ?auto_25197 - HOIST
      ?auto_25198 - PLACE
      ?auto_25200 - PLACE
      ?auto_25201 - HOIST
      ?auto_25202 - SURFACE
      ?auto_25199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25197 ?auto_25198 ) ( SURFACE-AT ?auto_25195 ?auto_25198 ) ( CLEAR ?auto_25195 ) ( IS-CRATE ?auto_25196 ) ( AVAILABLE ?auto_25197 ) ( not ( = ?auto_25200 ?auto_25198 ) ) ( HOIST-AT ?auto_25201 ?auto_25200 ) ( AVAILABLE ?auto_25201 ) ( SURFACE-AT ?auto_25196 ?auto_25200 ) ( ON ?auto_25196 ?auto_25202 ) ( CLEAR ?auto_25196 ) ( TRUCK-AT ?auto_25199 ?auto_25198 ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( not ( = ?auto_25195 ?auto_25202 ) ) ( not ( = ?auto_25196 ?auto_25202 ) ) ( not ( = ?auto_25197 ?auto_25201 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25199 ?auto_25198 ?auto_25200 )
      ( !LIFT ?auto_25201 ?auto_25196 ?auto_25202 ?auto_25200 )
      ( !LOAD ?auto_25201 ?auto_25196 ?auto_25199 ?auto_25200 )
      ( !DRIVE ?auto_25199 ?auto_25200 ?auto_25198 )
      ( !UNLOAD ?auto_25197 ?auto_25196 ?auto_25199 ?auto_25198 )
      ( !DROP ?auto_25197 ?auto_25196 ?auto_25195 ?auto_25198 )
      ( MAKE-1CRATE-VERIFY ?auto_25195 ?auto_25196 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_25219 - SURFACE
      ?auto_25220 - SURFACE
      ?auto_25221 - SURFACE
      ?auto_25222 - SURFACE
      ?auto_25223 - SURFACE
      ?auto_25224 - SURFACE
      ?auto_25225 - SURFACE
      ?auto_25228 - SURFACE
      ?auto_25227 - SURFACE
      ?auto_25226 - SURFACE
      ?auto_25229 - SURFACE
      ?auto_25230 - SURFACE
      ?auto_25231 - SURFACE
      ?auto_25232 - SURFACE
      ?auto_25234 - SURFACE
      ?auto_25233 - SURFACE
    )
    :vars
    (
      ?auto_25237 - HOIST
      ?auto_25240 - PLACE
      ?auto_25239 - PLACE
      ?auto_25236 - HOIST
      ?auto_25238 - SURFACE
      ?auto_25255 - PLACE
      ?auto_25267 - HOIST
      ?auto_25262 - SURFACE
      ?auto_25247 - SURFACE
      ?auto_25250 - PLACE
      ?auto_25243 - HOIST
      ?auto_25254 - SURFACE
      ?auto_25251 - PLACE
      ?auto_25258 - HOIST
      ?auto_25241 - SURFACE
      ?auto_25252 - SURFACE
      ?auto_25265 - PLACE
      ?auto_25263 - HOIST
      ?auto_25244 - SURFACE
      ?auto_25259 - SURFACE
      ?auto_25248 - SURFACE
      ?auto_25246 - PLACE
      ?auto_25264 - HOIST
      ?auto_25260 - SURFACE
      ?auto_25257 - SURFACE
      ?auto_25245 - PLACE
      ?auto_25249 - HOIST
      ?auto_25253 - SURFACE
      ?auto_25266 - SURFACE
      ?auto_25261 - PLACE
      ?auto_25256 - HOIST
      ?auto_25268 - SURFACE
      ?auto_25242 - SURFACE
      ?auto_25235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25237 ?auto_25240 ) ( IS-CRATE ?auto_25233 ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( HOIST-AT ?auto_25236 ?auto_25239 ) ( SURFACE-AT ?auto_25233 ?auto_25239 ) ( ON ?auto_25233 ?auto_25238 ) ( CLEAR ?auto_25233 ) ( not ( = ?auto_25234 ?auto_25233 ) ) ( not ( = ?auto_25234 ?auto_25238 ) ) ( not ( = ?auto_25233 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25236 ) ) ( IS-CRATE ?auto_25234 ) ( not ( = ?auto_25255 ?auto_25240 ) ) ( HOIST-AT ?auto_25267 ?auto_25255 ) ( SURFACE-AT ?auto_25234 ?auto_25255 ) ( ON ?auto_25234 ?auto_25262 ) ( CLEAR ?auto_25234 ) ( not ( = ?auto_25232 ?auto_25234 ) ) ( not ( = ?auto_25232 ?auto_25262 ) ) ( not ( = ?auto_25234 ?auto_25262 ) ) ( not ( = ?auto_25237 ?auto_25267 ) ) ( IS-CRATE ?auto_25232 ) ( SURFACE-AT ?auto_25232 ?auto_25239 ) ( ON ?auto_25232 ?auto_25247 ) ( CLEAR ?auto_25232 ) ( not ( = ?auto_25231 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25247 ) ) ( not ( = ?auto_25232 ?auto_25247 ) ) ( IS-CRATE ?auto_25231 ) ( not ( = ?auto_25250 ?auto_25240 ) ) ( HOIST-AT ?auto_25243 ?auto_25250 ) ( SURFACE-AT ?auto_25231 ?auto_25250 ) ( ON ?auto_25231 ?auto_25254 ) ( CLEAR ?auto_25231 ) ( not ( = ?auto_25230 ?auto_25231 ) ) ( not ( = ?auto_25230 ?auto_25254 ) ) ( not ( = ?auto_25231 ?auto_25254 ) ) ( not ( = ?auto_25237 ?auto_25243 ) ) ( IS-CRATE ?auto_25230 ) ( not ( = ?auto_25251 ?auto_25240 ) ) ( HOIST-AT ?auto_25258 ?auto_25251 ) ( AVAILABLE ?auto_25258 ) ( SURFACE-AT ?auto_25230 ?auto_25251 ) ( ON ?auto_25230 ?auto_25241 ) ( CLEAR ?auto_25230 ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25241 ) ) ( not ( = ?auto_25230 ?auto_25241 ) ) ( not ( = ?auto_25237 ?auto_25258 ) ) ( IS-CRATE ?auto_25229 ) ( AVAILABLE ?auto_25243 ) ( SURFACE-AT ?auto_25229 ?auto_25250 ) ( ON ?auto_25229 ?auto_25252 ) ( CLEAR ?auto_25229 ) ( not ( = ?auto_25226 ?auto_25229 ) ) ( not ( = ?auto_25226 ?auto_25252 ) ) ( not ( = ?auto_25229 ?auto_25252 ) ) ( IS-CRATE ?auto_25226 ) ( not ( = ?auto_25265 ?auto_25240 ) ) ( HOIST-AT ?auto_25263 ?auto_25265 ) ( SURFACE-AT ?auto_25226 ?auto_25265 ) ( ON ?auto_25226 ?auto_25244 ) ( CLEAR ?auto_25226 ) ( not ( = ?auto_25227 ?auto_25226 ) ) ( not ( = ?auto_25227 ?auto_25244 ) ) ( not ( = ?auto_25226 ?auto_25244 ) ) ( not ( = ?auto_25237 ?auto_25263 ) ) ( IS-CRATE ?auto_25227 ) ( SURFACE-AT ?auto_25227 ?auto_25255 ) ( ON ?auto_25227 ?auto_25259 ) ( CLEAR ?auto_25227 ) ( not ( = ?auto_25228 ?auto_25227 ) ) ( not ( = ?auto_25228 ?auto_25259 ) ) ( not ( = ?auto_25227 ?auto_25259 ) ) ( IS-CRATE ?auto_25228 ) ( AVAILABLE ?auto_25267 ) ( SURFACE-AT ?auto_25228 ?auto_25255 ) ( ON ?auto_25228 ?auto_25248 ) ( CLEAR ?auto_25228 ) ( not ( = ?auto_25225 ?auto_25228 ) ) ( not ( = ?auto_25225 ?auto_25248 ) ) ( not ( = ?auto_25228 ?auto_25248 ) ) ( IS-CRATE ?auto_25225 ) ( not ( = ?auto_25246 ?auto_25240 ) ) ( HOIST-AT ?auto_25264 ?auto_25246 ) ( SURFACE-AT ?auto_25225 ?auto_25246 ) ( ON ?auto_25225 ?auto_25260 ) ( CLEAR ?auto_25225 ) ( not ( = ?auto_25224 ?auto_25225 ) ) ( not ( = ?auto_25224 ?auto_25260 ) ) ( not ( = ?auto_25225 ?auto_25260 ) ) ( not ( = ?auto_25237 ?auto_25264 ) ) ( IS-CRATE ?auto_25224 ) ( AVAILABLE ?auto_25236 ) ( SURFACE-AT ?auto_25224 ?auto_25239 ) ( ON ?auto_25224 ?auto_25257 ) ( CLEAR ?auto_25224 ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( not ( = ?auto_25223 ?auto_25257 ) ) ( not ( = ?auto_25224 ?auto_25257 ) ) ( IS-CRATE ?auto_25223 ) ( not ( = ?auto_25245 ?auto_25240 ) ) ( HOIST-AT ?auto_25249 ?auto_25245 ) ( AVAILABLE ?auto_25249 ) ( SURFACE-AT ?auto_25223 ?auto_25245 ) ( ON ?auto_25223 ?auto_25253 ) ( CLEAR ?auto_25223 ) ( not ( = ?auto_25222 ?auto_25223 ) ) ( not ( = ?auto_25222 ?auto_25253 ) ) ( not ( = ?auto_25223 ?auto_25253 ) ) ( not ( = ?auto_25237 ?auto_25249 ) ) ( IS-CRATE ?auto_25222 ) ( AVAILABLE ?auto_25264 ) ( SURFACE-AT ?auto_25222 ?auto_25246 ) ( ON ?auto_25222 ?auto_25266 ) ( CLEAR ?auto_25222 ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25266 ) ) ( not ( = ?auto_25222 ?auto_25266 ) ) ( IS-CRATE ?auto_25221 ) ( not ( = ?auto_25261 ?auto_25240 ) ) ( HOIST-AT ?auto_25256 ?auto_25261 ) ( AVAILABLE ?auto_25256 ) ( SURFACE-AT ?auto_25221 ?auto_25261 ) ( ON ?auto_25221 ?auto_25268 ) ( CLEAR ?auto_25221 ) ( not ( = ?auto_25220 ?auto_25221 ) ) ( not ( = ?auto_25220 ?auto_25268 ) ) ( not ( = ?auto_25221 ?auto_25268 ) ) ( not ( = ?auto_25237 ?auto_25256 ) ) ( SURFACE-AT ?auto_25219 ?auto_25240 ) ( CLEAR ?auto_25219 ) ( IS-CRATE ?auto_25220 ) ( AVAILABLE ?auto_25237 ) ( AVAILABLE ?auto_25263 ) ( SURFACE-AT ?auto_25220 ?auto_25265 ) ( ON ?auto_25220 ?auto_25242 ) ( CLEAR ?auto_25220 ) ( TRUCK-AT ?auto_25235 ?auto_25240 ) ( not ( = ?auto_25219 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25242 ) ) ( not ( = ?auto_25220 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25221 ) ) ( not ( = ?auto_25219 ?auto_25268 ) ) ( not ( = ?auto_25221 ?auto_25242 ) ) ( not ( = ?auto_25261 ?auto_25265 ) ) ( not ( = ?auto_25256 ?auto_25263 ) ) ( not ( = ?auto_25268 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25222 ) ) ( not ( = ?auto_25219 ?auto_25266 ) ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25220 ?auto_25266 ) ) ( not ( = ?auto_25222 ?auto_25268 ) ) ( not ( = ?auto_25222 ?auto_25242 ) ) ( not ( = ?auto_25246 ?auto_25261 ) ) ( not ( = ?auto_25246 ?auto_25265 ) ) ( not ( = ?auto_25264 ?auto_25256 ) ) ( not ( = ?auto_25264 ?auto_25263 ) ) ( not ( = ?auto_25266 ?auto_25268 ) ) ( not ( = ?auto_25266 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25223 ) ) ( not ( = ?auto_25219 ?auto_25253 ) ) ( not ( = ?auto_25220 ?auto_25223 ) ) ( not ( = ?auto_25220 ?auto_25253 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25253 ) ) ( not ( = ?auto_25223 ?auto_25266 ) ) ( not ( = ?auto_25223 ?auto_25268 ) ) ( not ( = ?auto_25223 ?auto_25242 ) ) ( not ( = ?auto_25245 ?auto_25246 ) ) ( not ( = ?auto_25245 ?auto_25261 ) ) ( not ( = ?auto_25245 ?auto_25265 ) ) ( not ( = ?auto_25249 ?auto_25264 ) ) ( not ( = ?auto_25249 ?auto_25256 ) ) ( not ( = ?auto_25249 ?auto_25263 ) ) ( not ( = ?auto_25253 ?auto_25266 ) ) ( not ( = ?auto_25253 ?auto_25268 ) ) ( not ( = ?auto_25253 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25224 ) ) ( not ( = ?auto_25219 ?auto_25257 ) ) ( not ( = ?auto_25220 ?auto_25224 ) ) ( not ( = ?auto_25220 ?auto_25257 ) ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( not ( = ?auto_25221 ?auto_25257 ) ) ( not ( = ?auto_25222 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25257 ) ) ( not ( = ?auto_25224 ?auto_25253 ) ) ( not ( = ?auto_25224 ?auto_25266 ) ) ( not ( = ?auto_25224 ?auto_25268 ) ) ( not ( = ?auto_25224 ?auto_25242 ) ) ( not ( = ?auto_25239 ?auto_25245 ) ) ( not ( = ?auto_25239 ?auto_25246 ) ) ( not ( = ?auto_25239 ?auto_25261 ) ) ( not ( = ?auto_25239 ?auto_25265 ) ) ( not ( = ?auto_25236 ?auto_25249 ) ) ( not ( = ?auto_25236 ?auto_25264 ) ) ( not ( = ?auto_25236 ?auto_25256 ) ) ( not ( = ?auto_25236 ?auto_25263 ) ) ( not ( = ?auto_25257 ?auto_25253 ) ) ( not ( = ?auto_25257 ?auto_25266 ) ) ( not ( = ?auto_25257 ?auto_25268 ) ) ( not ( = ?auto_25257 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25225 ) ) ( not ( = ?auto_25219 ?auto_25260 ) ) ( not ( = ?auto_25220 ?auto_25225 ) ) ( not ( = ?auto_25220 ?auto_25260 ) ) ( not ( = ?auto_25221 ?auto_25225 ) ) ( not ( = ?auto_25221 ?auto_25260 ) ) ( not ( = ?auto_25222 ?auto_25225 ) ) ( not ( = ?auto_25222 ?auto_25260 ) ) ( not ( = ?auto_25223 ?auto_25225 ) ) ( not ( = ?auto_25223 ?auto_25260 ) ) ( not ( = ?auto_25225 ?auto_25257 ) ) ( not ( = ?auto_25225 ?auto_25253 ) ) ( not ( = ?auto_25225 ?auto_25266 ) ) ( not ( = ?auto_25225 ?auto_25268 ) ) ( not ( = ?auto_25225 ?auto_25242 ) ) ( not ( = ?auto_25260 ?auto_25257 ) ) ( not ( = ?auto_25260 ?auto_25253 ) ) ( not ( = ?auto_25260 ?auto_25266 ) ) ( not ( = ?auto_25260 ?auto_25268 ) ) ( not ( = ?auto_25260 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25228 ) ) ( not ( = ?auto_25219 ?auto_25248 ) ) ( not ( = ?auto_25220 ?auto_25228 ) ) ( not ( = ?auto_25220 ?auto_25248 ) ) ( not ( = ?auto_25221 ?auto_25228 ) ) ( not ( = ?auto_25221 ?auto_25248 ) ) ( not ( = ?auto_25222 ?auto_25228 ) ) ( not ( = ?auto_25222 ?auto_25248 ) ) ( not ( = ?auto_25223 ?auto_25228 ) ) ( not ( = ?auto_25223 ?auto_25248 ) ) ( not ( = ?auto_25224 ?auto_25228 ) ) ( not ( = ?auto_25224 ?auto_25248 ) ) ( not ( = ?auto_25228 ?auto_25260 ) ) ( not ( = ?auto_25228 ?auto_25257 ) ) ( not ( = ?auto_25228 ?auto_25253 ) ) ( not ( = ?auto_25228 ?auto_25266 ) ) ( not ( = ?auto_25228 ?auto_25268 ) ) ( not ( = ?auto_25228 ?auto_25242 ) ) ( not ( = ?auto_25255 ?auto_25246 ) ) ( not ( = ?auto_25255 ?auto_25239 ) ) ( not ( = ?auto_25255 ?auto_25245 ) ) ( not ( = ?auto_25255 ?auto_25261 ) ) ( not ( = ?auto_25255 ?auto_25265 ) ) ( not ( = ?auto_25267 ?auto_25264 ) ) ( not ( = ?auto_25267 ?auto_25236 ) ) ( not ( = ?auto_25267 ?auto_25249 ) ) ( not ( = ?auto_25267 ?auto_25256 ) ) ( not ( = ?auto_25267 ?auto_25263 ) ) ( not ( = ?auto_25248 ?auto_25260 ) ) ( not ( = ?auto_25248 ?auto_25257 ) ) ( not ( = ?auto_25248 ?auto_25253 ) ) ( not ( = ?auto_25248 ?auto_25266 ) ) ( not ( = ?auto_25248 ?auto_25268 ) ) ( not ( = ?auto_25248 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25227 ) ) ( not ( = ?auto_25219 ?auto_25259 ) ) ( not ( = ?auto_25220 ?auto_25227 ) ) ( not ( = ?auto_25220 ?auto_25259 ) ) ( not ( = ?auto_25221 ?auto_25227 ) ) ( not ( = ?auto_25221 ?auto_25259 ) ) ( not ( = ?auto_25222 ?auto_25227 ) ) ( not ( = ?auto_25222 ?auto_25259 ) ) ( not ( = ?auto_25223 ?auto_25227 ) ) ( not ( = ?auto_25223 ?auto_25259 ) ) ( not ( = ?auto_25224 ?auto_25227 ) ) ( not ( = ?auto_25224 ?auto_25259 ) ) ( not ( = ?auto_25225 ?auto_25227 ) ) ( not ( = ?auto_25225 ?auto_25259 ) ) ( not ( = ?auto_25227 ?auto_25248 ) ) ( not ( = ?auto_25227 ?auto_25260 ) ) ( not ( = ?auto_25227 ?auto_25257 ) ) ( not ( = ?auto_25227 ?auto_25253 ) ) ( not ( = ?auto_25227 ?auto_25266 ) ) ( not ( = ?auto_25227 ?auto_25268 ) ) ( not ( = ?auto_25227 ?auto_25242 ) ) ( not ( = ?auto_25259 ?auto_25248 ) ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25259 ?auto_25257 ) ) ( not ( = ?auto_25259 ?auto_25253 ) ) ( not ( = ?auto_25259 ?auto_25266 ) ) ( not ( = ?auto_25259 ?auto_25268 ) ) ( not ( = ?auto_25259 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25226 ) ) ( not ( = ?auto_25219 ?auto_25244 ) ) ( not ( = ?auto_25220 ?auto_25226 ) ) ( not ( = ?auto_25220 ?auto_25244 ) ) ( not ( = ?auto_25221 ?auto_25226 ) ) ( not ( = ?auto_25221 ?auto_25244 ) ) ( not ( = ?auto_25222 ?auto_25226 ) ) ( not ( = ?auto_25222 ?auto_25244 ) ) ( not ( = ?auto_25223 ?auto_25226 ) ) ( not ( = ?auto_25223 ?auto_25244 ) ) ( not ( = ?auto_25224 ?auto_25226 ) ) ( not ( = ?auto_25224 ?auto_25244 ) ) ( not ( = ?auto_25225 ?auto_25226 ) ) ( not ( = ?auto_25225 ?auto_25244 ) ) ( not ( = ?auto_25228 ?auto_25226 ) ) ( not ( = ?auto_25228 ?auto_25244 ) ) ( not ( = ?auto_25226 ?auto_25259 ) ) ( not ( = ?auto_25226 ?auto_25248 ) ) ( not ( = ?auto_25226 ?auto_25260 ) ) ( not ( = ?auto_25226 ?auto_25257 ) ) ( not ( = ?auto_25226 ?auto_25253 ) ) ( not ( = ?auto_25226 ?auto_25266 ) ) ( not ( = ?auto_25226 ?auto_25268 ) ) ( not ( = ?auto_25226 ?auto_25242 ) ) ( not ( = ?auto_25244 ?auto_25259 ) ) ( not ( = ?auto_25244 ?auto_25248 ) ) ( not ( = ?auto_25244 ?auto_25260 ) ) ( not ( = ?auto_25244 ?auto_25257 ) ) ( not ( = ?auto_25244 ?auto_25253 ) ) ( not ( = ?auto_25244 ?auto_25266 ) ) ( not ( = ?auto_25244 ?auto_25268 ) ) ( not ( = ?auto_25244 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25229 ) ) ( not ( = ?auto_25219 ?auto_25252 ) ) ( not ( = ?auto_25220 ?auto_25229 ) ) ( not ( = ?auto_25220 ?auto_25252 ) ) ( not ( = ?auto_25221 ?auto_25229 ) ) ( not ( = ?auto_25221 ?auto_25252 ) ) ( not ( = ?auto_25222 ?auto_25229 ) ) ( not ( = ?auto_25222 ?auto_25252 ) ) ( not ( = ?auto_25223 ?auto_25229 ) ) ( not ( = ?auto_25223 ?auto_25252 ) ) ( not ( = ?auto_25224 ?auto_25229 ) ) ( not ( = ?auto_25224 ?auto_25252 ) ) ( not ( = ?auto_25225 ?auto_25229 ) ) ( not ( = ?auto_25225 ?auto_25252 ) ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25252 ) ) ( not ( = ?auto_25227 ?auto_25229 ) ) ( not ( = ?auto_25227 ?auto_25252 ) ) ( not ( = ?auto_25229 ?auto_25244 ) ) ( not ( = ?auto_25229 ?auto_25259 ) ) ( not ( = ?auto_25229 ?auto_25248 ) ) ( not ( = ?auto_25229 ?auto_25260 ) ) ( not ( = ?auto_25229 ?auto_25257 ) ) ( not ( = ?auto_25229 ?auto_25253 ) ) ( not ( = ?auto_25229 ?auto_25266 ) ) ( not ( = ?auto_25229 ?auto_25268 ) ) ( not ( = ?auto_25229 ?auto_25242 ) ) ( not ( = ?auto_25250 ?auto_25265 ) ) ( not ( = ?auto_25250 ?auto_25255 ) ) ( not ( = ?auto_25250 ?auto_25246 ) ) ( not ( = ?auto_25250 ?auto_25239 ) ) ( not ( = ?auto_25250 ?auto_25245 ) ) ( not ( = ?auto_25250 ?auto_25261 ) ) ( not ( = ?auto_25243 ?auto_25263 ) ) ( not ( = ?auto_25243 ?auto_25267 ) ) ( not ( = ?auto_25243 ?auto_25264 ) ) ( not ( = ?auto_25243 ?auto_25236 ) ) ( not ( = ?auto_25243 ?auto_25249 ) ) ( not ( = ?auto_25243 ?auto_25256 ) ) ( not ( = ?auto_25252 ?auto_25244 ) ) ( not ( = ?auto_25252 ?auto_25259 ) ) ( not ( = ?auto_25252 ?auto_25248 ) ) ( not ( = ?auto_25252 ?auto_25260 ) ) ( not ( = ?auto_25252 ?auto_25257 ) ) ( not ( = ?auto_25252 ?auto_25253 ) ) ( not ( = ?auto_25252 ?auto_25266 ) ) ( not ( = ?auto_25252 ?auto_25268 ) ) ( not ( = ?auto_25252 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25230 ) ) ( not ( = ?auto_25219 ?auto_25241 ) ) ( not ( = ?auto_25220 ?auto_25230 ) ) ( not ( = ?auto_25220 ?auto_25241 ) ) ( not ( = ?auto_25221 ?auto_25230 ) ) ( not ( = ?auto_25221 ?auto_25241 ) ) ( not ( = ?auto_25222 ?auto_25230 ) ) ( not ( = ?auto_25222 ?auto_25241 ) ) ( not ( = ?auto_25223 ?auto_25230 ) ) ( not ( = ?auto_25223 ?auto_25241 ) ) ( not ( = ?auto_25224 ?auto_25230 ) ) ( not ( = ?auto_25224 ?auto_25241 ) ) ( not ( = ?auto_25225 ?auto_25230 ) ) ( not ( = ?auto_25225 ?auto_25241 ) ) ( not ( = ?auto_25228 ?auto_25230 ) ) ( not ( = ?auto_25228 ?auto_25241 ) ) ( not ( = ?auto_25227 ?auto_25230 ) ) ( not ( = ?auto_25227 ?auto_25241 ) ) ( not ( = ?auto_25226 ?auto_25230 ) ) ( not ( = ?auto_25226 ?auto_25241 ) ) ( not ( = ?auto_25230 ?auto_25252 ) ) ( not ( = ?auto_25230 ?auto_25244 ) ) ( not ( = ?auto_25230 ?auto_25259 ) ) ( not ( = ?auto_25230 ?auto_25248 ) ) ( not ( = ?auto_25230 ?auto_25260 ) ) ( not ( = ?auto_25230 ?auto_25257 ) ) ( not ( = ?auto_25230 ?auto_25253 ) ) ( not ( = ?auto_25230 ?auto_25266 ) ) ( not ( = ?auto_25230 ?auto_25268 ) ) ( not ( = ?auto_25230 ?auto_25242 ) ) ( not ( = ?auto_25251 ?auto_25250 ) ) ( not ( = ?auto_25251 ?auto_25265 ) ) ( not ( = ?auto_25251 ?auto_25255 ) ) ( not ( = ?auto_25251 ?auto_25246 ) ) ( not ( = ?auto_25251 ?auto_25239 ) ) ( not ( = ?auto_25251 ?auto_25245 ) ) ( not ( = ?auto_25251 ?auto_25261 ) ) ( not ( = ?auto_25258 ?auto_25243 ) ) ( not ( = ?auto_25258 ?auto_25263 ) ) ( not ( = ?auto_25258 ?auto_25267 ) ) ( not ( = ?auto_25258 ?auto_25264 ) ) ( not ( = ?auto_25258 ?auto_25236 ) ) ( not ( = ?auto_25258 ?auto_25249 ) ) ( not ( = ?auto_25258 ?auto_25256 ) ) ( not ( = ?auto_25241 ?auto_25252 ) ) ( not ( = ?auto_25241 ?auto_25244 ) ) ( not ( = ?auto_25241 ?auto_25259 ) ) ( not ( = ?auto_25241 ?auto_25248 ) ) ( not ( = ?auto_25241 ?auto_25260 ) ) ( not ( = ?auto_25241 ?auto_25257 ) ) ( not ( = ?auto_25241 ?auto_25253 ) ) ( not ( = ?auto_25241 ?auto_25266 ) ) ( not ( = ?auto_25241 ?auto_25268 ) ) ( not ( = ?auto_25241 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25231 ) ) ( not ( = ?auto_25219 ?auto_25254 ) ) ( not ( = ?auto_25220 ?auto_25231 ) ) ( not ( = ?auto_25220 ?auto_25254 ) ) ( not ( = ?auto_25221 ?auto_25231 ) ) ( not ( = ?auto_25221 ?auto_25254 ) ) ( not ( = ?auto_25222 ?auto_25231 ) ) ( not ( = ?auto_25222 ?auto_25254 ) ) ( not ( = ?auto_25223 ?auto_25231 ) ) ( not ( = ?auto_25223 ?auto_25254 ) ) ( not ( = ?auto_25224 ?auto_25231 ) ) ( not ( = ?auto_25224 ?auto_25254 ) ) ( not ( = ?auto_25225 ?auto_25231 ) ) ( not ( = ?auto_25225 ?auto_25254 ) ) ( not ( = ?auto_25228 ?auto_25231 ) ) ( not ( = ?auto_25228 ?auto_25254 ) ) ( not ( = ?auto_25227 ?auto_25231 ) ) ( not ( = ?auto_25227 ?auto_25254 ) ) ( not ( = ?auto_25226 ?auto_25231 ) ) ( not ( = ?auto_25226 ?auto_25254 ) ) ( not ( = ?auto_25229 ?auto_25231 ) ) ( not ( = ?auto_25229 ?auto_25254 ) ) ( not ( = ?auto_25231 ?auto_25241 ) ) ( not ( = ?auto_25231 ?auto_25252 ) ) ( not ( = ?auto_25231 ?auto_25244 ) ) ( not ( = ?auto_25231 ?auto_25259 ) ) ( not ( = ?auto_25231 ?auto_25248 ) ) ( not ( = ?auto_25231 ?auto_25260 ) ) ( not ( = ?auto_25231 ?auto_25257 ) ) ( not ( = ?auto_25231 ?auto_25253 ) ) ( not ( = ?auto_25231 ?auto_25266 ) ) ( not ( = ?auto_25231 ?auto_25268 ) ) ( not ( = ?auto_25231 ?auto_25242 ) ) ( not ( = ?auto_25254 ?auto_25241 ) ) ( not ( = ?auto_25254 ?auto_25252 ) ) ( not ( = ?auto_25254 ?auto_25244 ) ) ( not ( = ?auto_25254 ?auto_25259 ) ) ( not ( = ?auto_25254 ?auto_25248 ) ) ( not ( = ?auto_25254 ?auto_25260 ) ) ( not ( = ?auto_25254 ?auto_25257 ) ) ( not ( = ?auto_25254 ?auto_25253 ) ) ( not ( = ?auto_25254 ?auto_25266 ) ) ( not ( = ?auto_25254 ?auto_25268 ) ) ( not ( = ?auto_25254 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25232 ) ) ( not ( = ?auto_25219 ?auto_25247 ) ) ( not ( = ?auto_25220 ?auto_25232 ) ) ( not ( = ?auto_25220 ?auto_25247 ) ) ( not ( = ?auto_25221 ?auto_25232 ) ) ( not ( = ?auto_25221 ?auto_25247 ) ) ( not ( = ?auto_25222 ?auto_25232 ) ) ( not ( = ?auto_25222 ?auto_25247 ) ) ( not ( = ?auto_25223 ?auto_25232 ) ) ( not ( = ?auto_25223 ?auto_25247 ) ) ( not ( = ?auto_25224 ?auto_25232 ) ) ( not ( = ?auto_25224 ?auto_25247 ) ) ( not ( = ?auto_25225 ?auto_25232 ) ) ( not ( = ?auto_25225 ?auto_25247 ) ) ( not ( = ?auto_25228 ?auto_25232 ) ) ( not ( = ?auto_25228 ?auto_25247 ) ) ( not ( = ?auto_25227 ?auto_25232 ) ) ( not ( = ?auto_25227 ?auto_25247 ) ) ( not ( = ?auto_25226 ?auto_25232 ) ) ( not ( = ?auto_25226 ?auto_25247 ) ) ( not ( = ?auto_25229 ?auto_25232 ) ) ( not ( = ?auto_25229 ?auto_25247 ) ) ( not ( = ?auto_25230 ?auto_25232 ) ) ( not ( = ?auto_25230 ?auto_25247 ) ) ( not ( = ?auto_25232 ?auto_25254 ) ) ( not ( = ?auto_25232 ?auto_25241 ) ) ( not ( = ?auto_25232 ?auto_25252 ) ) ( not ( = ?auto_25232 ?auto_25244 ) ) ( not ( = ?auto_25232 ?auto_25259 ) ) ( not ( = ?auto_25232 ?auto_25248 ) ) ( not ( = ?auto_25232 ?auto_25260 ) ) ( not ( = ?auto_25232 ?auto_25257 ) ) ( not ( = ?auto_25232 ?auto_25253 ) ) ( not ( = ?auto_25232 ?auto_25266 ) ) ( not ( = ?auto_25232 ?auto_25268 ) ) ( not ( = ?auto_25232 ?auto_25242 ) ) ( not ( = ?auto_25247 ?auto_25254 ) ) ( not ( = ?auto_25247 ?auto_25241 ) ) ( not ( = ?auto_25247 ?auto_25252 ) ) ( not ( = ?auto_25247 ?auto_25244 ) ) ( not ( = ?auto_25247 ?auto_25259 ) ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25247 ?auto_25260 ) ) ( not ( = ?auto_25247 ?auto_25257 ) ) ( not ( = ?auto_25247 ?auto_25253 ) ) ( not ( = ?auto_25247 ?auto_25266 ) ) ( not ( = ?auto_25247 ?auto_25268 ) ) ( not ( = ?auto_25247 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25234 ) ) ( not ( = ?auto_25219 ?auto_25262 ) ) ( not ( = ?auto_25220 ?auto_25234 ) ) ( not ( = ?auto_25220 ?auto_25262 ) ) ( not ( = ?auto_25221 ?auto_25234 ) ) ( not ( = ?auto_25221 ?auto_25262 ) ) ( not ( = ?auto_25222 ?auto_25234 ) ) ( not ( = ?auto_25222 ?auto_25262 ) ) ( not ( = ?auto_25223 ?auto_25234 ) ) ( not ( = ?auto_25223 ?auto_25262 ) ) ( not ( = ?auto_25224 ?auto_25234 ) ) ( not ( = ?auto_25224 ?auto_25262 ) ) ( not ( = ?auto_25225 ?auto_25234 ) ) ( not ( = ?auto_25225 ?auto_25262 ) ) ( not ( = ?auto_25228 ?auto_25234 ) ) ( not ( = ?auto_25228 ?auto_25262 ) ) ( not ( = ?auto_25227 ?auto_25234 ) ) ( not ( = ?auto_25227 ?auto_25262 ) ) ( not ( = ?auto_25226 ?auto_25234 ) ) ( not ( = ?auto_25226 ?auto_25262 ) ) ( not ( = ?auto_25229 ?auto_25234 ) ) ( not ( = ?auto_25229 ?auto_25262 ) ) ( not ( = ?auto_25230 ?auto_25234 ) ) ( not ( = ?auto_25230 ?auto_25262 ) ) ( not ( = ?auto_25231 ?auto_25234 ) ) ( not ( = ?auto_25231 ?auto_25262 ) ) ( not ( = ?auto_25234 ?auto_25247 ) ) ( not ( = ?auto_25234 ?auto_25254 ) ) ( not ( = ?auto_25234 ?auto_25241 ) ) ( not ( = ?auto_25234 ?auto_25252 ) ) ( not ( = ?auto_25234 ?auto_25244 ) ) ( not ( = ?auto_25234 ?auto_25259 ) ) ( not ( = ?auto_25234 ?auto_25248 ) ) ( not ( = ?auto_25234 ?auto_25260 ) ) ( not ( = ?auto_25234 ?auto_25257 ) ) ( not ( = ?auto_25234 ?auto_25253 ) ) ( not ( = ?auto_25234 ?auto_25266 ) ) ( not ( = ?auto_25234 ?auto_25268 ) ) ( not ( = ?auto_25234 ?auto_25242 ) ) ( not ( = ?auto_25262 ?auto_25247 ) ) ( not ( = ?auto_25262 ?auto_25254 ) ) ( not ( = ?auto_25262 ?auto_25241 ) ) ( not ( = ?auto_25262 ?auto_25252 ) ) ( not ( = ?auto_25262 ?auto_25244 ) ) ( not ( = ?auto_25262 ?auto_25259 ) ) ( not ( = ?auto_25262 ?auto_25248 ) ) ( not ( = ?auto_25262 ?auto_25260 ) ) ( not ( = ?auto_25262 ?auto_25257 ) ) ( not ( = ?auto_25262 ?auto_25253 ) ) ( not ( = ?auto_25262 ?auto_25266 ) ) ( not ( = ?auto_25262 ?auto_25268 ) ) ( not ( = ?auto_25262 ?auto_25242 ) ) ( not ( = ?auto_25219 ?auto_25233 ) ) ( not ( = ?auto_25219 ?auto_25238 ) ) ( not ( = ?auto_25220 ?auto_25233 ) ) ( not ( = ?auto_25220 ?auto_25238 ) ) ( not ( = ?auto_25221 ?auto_25233 ) ) ( not ( = ?auto_25221 ?auto_25238 ) ) ( not ( = ?auto_25222 ?auto_25233 ) ) ( not ( = ?auto_25222 ?auto_25238 ) ) ( not ( = ?auto_25223 ?auto_25233 ) ) ( not ( = ?auto_25223 ?auto_25238 ) ) ( not ( = ?auto_25224 ?auto_25233 ) ) ( not ( = ?auto_25224 ?auto_25238 ) ) ( not ( = ?auto_25225 ?auto_25233 ) ) ( not ( = ?auto_25225 ?auto_25238 ) ) ( not ( = ?auto_25228 ?auto_25233 ) ) ( not ( = ?auto_25228 ?auto_25238 ) ) ( not ( = ?auto_25227 ?auto_25233 ) ) ( not ( = ?auto_25227 ?auto_25238 ) ) ( not ( = ?auto_25226 ?auto_25233 ) ) ( not ( = ?auto_25226 ?auto_25238 ) ) ( not ( = ?auto_25229 ?auto_25233 ) ) ( not ( = ?auto_25229 ?auto_25238 ) ) ( not ( = ?auto_25230 ?auto_25233 ) ) ( not ( = ?auto_25230 ?auto_25238 ) ) ( not ( = ?auto_25231 ?auto_25233 ) ) ( not ( = ?auto_25231 ?auto_25238 ) ) ( not ( = ?auto_25232 ?auto_25233 ) ) ( not ( = ?auto_25232 ?auto_25238 ) ) ( not ( = ?auto_25233 ?auto_25262 ) ) ( not ( = ?auto_25233 ?auto_25247 ) ) ( not ( = ?auto_25233 ?auto_25254 ) ) ( not ( = ?auto_25233 ?auto_25241 ) ) ( not ( = ?auto_25233 ?auto_25252 ) ) ( not ( = ?auto_25233 ?auto_25244 ) ) ( not ( = ?auto_25233 ?auto_25259 ) ) ( not ( = ?auto_25233 ?auto_25248 ) ) ( not ( = ?auto_25233 ?auto_25260 ) ) ( not ( = ?auto_25233 ?auto_25257 ) ) ( not ( = ?auto_25233 ?auto_25253 ) ) ( not ( = ?auto_25233 ?auto_25266 ) ) ( not ( = ?auto_25233 ?auto_25268 ) ) ( not ( = ?auto_25233 ?auto_25242 ) ) ( not ( = ?auto_25238 ?auto_25262 ) ) ( not ( = ?auto_25238 ?auto_25247 ) ) ( not ( = ?auto_25238 ?auto_25254 ) ) ( not ( = ?auto_25238 ?auto_25241 ) ) ( not ( = ?auto_25238 ?auto_25252 ) ) ( not ( = ?auto_25238 ?auto_25244 ) ) ( not ( = ?auto_25238 ?auto_25259 ) ) ( not ( = ?auto_25238 ?auto_25248 ) ) ( not ( = ?auto_25238 ?auto_25260 ) ) ( not ( = ?auto_25238 ?auto_25257 ) ) ( not ( = ?auto_25238 ?auto_25253 ) ) ( not ( = ?auto_25238 ?auto_25266 ) ) ( not ( = ?auto_25238 ?auto_25268 ) ) ( not ( = ?auto_25238 ?auto_25242 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25222 ?auto_25223 ?auto_25224 ?auto_25225 ?auto_25228 ?auto_25227 ?auto_25226 ?auto_25229 ?auto_25230 ?auto_25231 ?auto_25232 ?auto_25234 )
      ( MAKE-1CRATE ?auto_25234 ?auto_25233 )
      ( MAKE-15CRATE-VERIFY ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25222 ?auto_25223 ?auto_25224 ?auto_25225 ?auto_25228 ?auto_25227 ?auto_25226 ?auto_25229 ?auto_25230 ?auto_25231 ?auto_25232 ?auto_25234 ?auto_25233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25271 - SURFACE
      ?auto_25272 - SURFACE
    )
    :vars
    (
      ?auto_25273 - HOIST
      ?auto_25274 - PLACE
      ?auto_25276 - PLACE
      ?auto_25277 - HOIST
      ?auto_25278 - SURFACE
      ?auto_25275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25273 ?auto_25274 ) ( SURFACE-AT ?auto_25271 ?auto_25274 ) ( CLEAR ?auto_25271 ) ( IS-CRATE ?auto_25272 ) ( AVAILABLE ?auto_25273 ) ( not ( = ?auto_25276 ?auto_25274 ) ) ( HOIST-AT ?auto_25277 ?auto_25276 ) ( AVAILABLE ?auto_25277 ) ( SURFACE-AT ?auto_25272 ?auto_25276 ) ( ON ?auto_25272 ?auto_25278 ) ( CLEAR ?auto_25272 ) ( TRUCK-AT ?auto_25275 ?auto_25274 ) ( not ( = ?auto_25271 ?auto_25272 ) ) ( not ( = ?auto_25271 ?auto_25278 ) ) ( not ( = ?auto_25272 ?auto_25278 ) ) ( not ( = ?auto_25273 ?auto_25277 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25275 ?auto_25274 ?auto_25276 )
      ( !LIFT ?auto_25277 ?auto_25272 ?auto_25278 ?auto_25276 )
      ( !LOAD ?auto_25277 ?auto_25272 ?auto_25275 ?auto_25276 )
      ( !DRIVE ?auto_25275 ?auto_25276 ?auto_25274 )
      ( !UNLOAD ?auto_25273 ?auto_25272 ?auto_25275 ?auto_25274 )
      ( !DROP ?auto_25273 ?auto_25272 ?auto_25271 ?auto_25274 )
      ( MAKE-1CRATE-VERIFY ?auto_25271 ?auto_25272 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_25296 - SURFACE
      ?auto_25297 - SURFACE
      ?auto_25298 - SURFACE
      ?auto_25299 - SURFACE
      ?auto_25300 - SURFACE
      ?auto_25301 - SURFACE
      ?auto_25302 - SURFACE
      ?auto_25305 - SURFACE
      ?auto_25304 - SURFACE
      ?auto_25303 - SURFACE
      ?auto_25306 - SURFACE
      ?auto_25307 - SURFACE
      ?auto_25308 - SURFACE
      ?auto_25309 - SURFACE
      ?auto_25311 - SURFACE
      ?auto_25310 - SURFACE
      ?auto_25312 - SURFACE
    )
    :vars
    (
      ?auto_25313 - HOIST
      ?auto_25318 - PLACE
      ?auto_25317 - PLACE
      ?auto_25316 - HOIST
      ?auto_25314 - SURFACE
      ?auto_25337 - PLACE
      ?auto_25335 - HOIST
      ?auto_25346 - SURFACE
      ?auto_25348 - PLACE
      ?auto_25342 - HOIST
      ?auto_25344 - SURFACE
      ?auto_25325 - SURFACE
      ?auto_25343 - PLACE
      ?auto_25332 - HOIST
      ?auto_25322 - SURFACE
      ?auto_25331 - PLACE
      ?auto_25347 - HOIST
      ?auto_25349 - SURFACE
      ?auto_25341 - SURFACE
      ?auto_25321 - PLACE
      ?auto_25338 - HOIST
      ?auto_25334 - SURFACE
      ?auto_25319 - SURFACE
      ?auto_25329 - SURFACE
      ?auto_25330 - PLACE
      ?auto_25320 - HOIST
      ?auto_25328 - SURFACE
      ?auto_25324 - SURFACE
      ?auto_25333 - PLACE
      ?auto_25327 - HOIST
      ?auto_25323 - SURFACE
      ?auto_25340 - SURFACE
      ?auto_25345 - PLACE
      ?auto_25339 - HOIST
      ?auto_25336 - SURFACE
      ?auto_25326 - SURFACE
      ?auto_25315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25313 ?auto_25318 ) ( IS-CRATE ?auto_25312 ) ( not ( = ?auto_25317 ?auto_25318 ) ) ( HOIST-AT ?auto_25316 ?auto_25317 ) ( AVAILABLE ?auto_25316 ) ( SURFACE-AT ?auto_25312 ?auto_25317 ) ( ON ?auto_25312 ?auto_25314 ) ( CLEAR ?auto_25312 ) ( not ( = ?auto_25310 ?auto_25312 ) ) ( not ( = ?auto_25310 ?auto_25314 ) ) ( not ( = ?auto_25312 ?auto_25314 ) ) ( not ( = ?auto_25313 ?auto_25316 ) ) ( IS-CRATE ?auto_25310 ) ( not ( = ?auto_25337 ?auto_25318 ) ) ( HOIST-AT ?auto_25335 ?auto_25337 ) ( SURFACE-AT ?auto_25310 ?auto_25337 ) ( ON ?auto_25310 ?auto_25346 ) ( CLEAR ?auto_25310 ) ( not ( = ?auto_25311 ?auto_25310 ) ) ( not ( = ?auto_25311 ?auto_25346 ) ) ( not ( = ?auto_25310 ?auto_25346 ) ) ( not ( = ?auto_25313 ?auto_25335 ) ) ( IS-CRATE ?auto_25311 ) ( not ( = ?auto_25348 ?auto_25318 ) ) ( HOIST-AT ?auto_25342 ?auto_25348 ) ( SURFACE-AT ?auto_25311 ?auto_25348 ) ( ON ?auto_25311 ?auto_25344 ) ( CLEAR ?auto_25311 ) ( not ( = ?auto_25309 ?auto_25311 ) ) ( not ( = ?auto_25309 ?auto_25344 ) ) ( not ( = ?auto_25311 ?auto_25344 ) ) ( not ( = ?auto_25313 ?auto_25342 ) ) ( IS-CRATE ?auto_25309 ) ( SURFACE-AT ?auto_25309 ?auto_25337 ) ( ON ?auto_25309 ?auto_25325 ) ( CLEAR ?auto_25309 ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25308 ?auto_25325 ) ) ( not ( = ?auto_25309 ?auto_25325 ) ) ( IS-CRATE ?auto_25308 ) ( not ( = ?auto_25343 ?auto_25318 ) ) ( HOIST-AT ?auto_25332 ?auto_25343 ) ( SURFACE-AT ?auto_25308 ?auto_25343 ) ( ON ?auto_25308 ?auto_25322 ) ( CLEAR ?auto_25308 ) ( not ( = ?auto_25307 ?auto_25308 ) ) ( not ( = ?auto_25307 ?auto_25322 ) ) ( not ( = ?auto_25308 ?auto_25322 ) ) ( not ( = ?auto_25313 ?auto_25332 ) ) ( IS-CRATE ?auto_25307 ) ( not ( = ?auto_25331 ?auto_25318 ) ) ( HOIST-AT ?auto_25347 ?auto_25331 ) ( AVAILABLE ?auto_25347 ) ( SURFACE-AT ?auto_25307 ?auto_25331 ) ( ON ?auto_25307 ?auto_25349 ) ( CLEAR ?auto_25307 ) ( not ( = ?auto_25306 ?auto_25307 ) ) ( not ( = ?auto_25306 ?auto_25349 ) ) ( not ( = ?auto_25307 ?auto_25349 ) ) ( not ( = ?auto_25313 ?auto_25347 ) ) ( IS-CRATE ?auto_25306 ) ( AVAILABLE ?auto_25332 ) ( SURFACE-AT ?auto_25306 ?auto_25343 ) ( ON ?auto_25306 ?auto_25341 ) ( CLEAR ?auto_25306 ) ( not ( = ?auto_25303 ?auto_25306 ) ) ( not ( = ?auto_25303 ?auto_25341 ) ) ( not ( = ?auto_25306 ?auto_25341 ) ) ( IS-CRATE ?auto_25303 ) ( not ( = ?auto_25321 ?auto_25318 ) ) ( HOIST-AT ?auto_25338 ?auto_25321 ) ( SURFACE-AT ?auto_25303 ?auto_25321 ) ( ON ?auto_25303 ?auto_25334 ) ( CLEAR ?auto_25303 ) ( not ( = ?auto_25304 ?auto_25303 ) ) ( not ( = ?auto_25304 ?auto_25334 ) ) ( not ( = ?auto_25303 ?auto_25334 ) ) ( not ( = ?auto_25313 ?auto_25338 ) ) ( IS-CRATE ?auto_25304 ) ( SURFACE-AT ?auto_25304 ?auto_25348 ) ( ON ?auto_25304 ?auto_25319 ) ( CLEAR ?auto_25304 ) ( not ( = ?auto_25305 ?auto_25304 ) ) ( not ( = ?auto_25305 ?auto_25319 ) ) ( not ( = ?auto_25304 ?auto_25319 ) ) ( IS-CRATE ?auto_25305 ) ( AVAILABLE ?auto_25342 ) ( SURFACE-AT ?auto_25305 ?auto_25348 ) ( ON ?auto_25305 ?auto_25329 ) ( CLEAR ?auto_25305 ) ( not ( = ?auto_25302 ?auto_25305 ) ) ( not ( = ?auto_25302 ?auto_25329 ) ) ( not ( = ?auto_25305 ?auto_25329 ) ) ( IS-CRATE ?auto_25302 ) ( not ( = ?auto_25330 ?auto_25318 ) ) ( HOIST-AT ?auto_25320 ?auto_25330 ) ( SURFACE-AT ?auto_25302 ?auto_25330 ) ( ON ?auto_25302 ?auto_25328 ) ( CLEAR ?auto_25302 ) ( not ( = ?auto_25301 ?auto_25302 ) ) ( not ( = ?auto_25301 ?auto_25328 ) ) ( not ( = ?auto_25302 ?auto_25328 ) ) ( not ( = ?auto_25313 ?auto_25320 ) ) ( IS-CRATE ?auto_25301 ) ( AVAILABLE ?auto_25335 ) ( SURFACE-AT ?auto_25301 ?auto_25337 ) ( ON ?auto_25301 ?auto_25324 ) ( CLEAR ?auto_25301 ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( not ( = ?auto_25300 ?auto_25324 ) ) ( not ( = ?auto_25301 ?auto_25324 ) ) ( IS-CRATE ?auto_25300 ) ( not ( = ?auto_25333 ?auto_25318 ) ) ( HOIST-AT ?auto_25327 ?auto_25333 ) ( AVAILABLE ?auto_25327 ) ( SURFACE-AT ?auto_25300 ?auto_25333 ) ( ON ?auto_25300 ?auto_25323 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25323 ) ) ( not ( = ?auto_25300 ?auto_25323 ) ) ( not ( = ?auto_25313 ?auto_25327 ) ) ( IS-CRATE ?auto_25299 ) ( AVAILABLE ?auto_25320 ) ( SURFACE-AT ?auto_25299 ?auto_25330 ) ( ON ?auto_25299 ?auto_25340 ) ( CLEAR ?auto_25299 ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25340 ) ) ( not ( = ?auto_25299 ?auto_25340 ) ) ( IS-CRATE ?auto_25298 ) ( not ( = ?auto_25345 ?auto_25318 ) ) ( HOIST-AT ?auto_25339 ?auto_25345 ) ( AVAILABLE ?auto_25339 ) ( SURFACE-AT ?auto_25298 ?auto_25345 ) ( ON ?auto_25298 ?auto_25336 ) ( CLEAR ?auto_25298 ) ( not ( = ?auto_25297 ?auto_25298 ) ) ( not ( = ?auto_25297 ?auto_25336 ) ) ( not ( = ?auto_25298 ?auto_25336 ) ) ( not ( = ?auto_25313 ?auto_25339 ) ) ( SURFACE-AT ?auto_25296 ?auto_25318 ) ( CLEAR ?auto_25296 ) ( IS-CRATE ?auto_25297 ) ( AVAILABLE ?auto_25313 ) ( AVAILABLE ?auto_25338 ) ( SURFACE-AT ?auto_25297 ?auto_25321 ) ( ON ?auto_25297 ?auto_25326 ) ( CLEAR ?auto_25297 ) ( TRUCK-AT ?auto_25315 ?auto_25318 ) ( not ( = ?auto_25296 ?auto_25297 ) ) ( not ( = ?auto_25296 ?auto_25326 ) ) ( not ( = ?auto_25297 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25298 ) ) ( not ( = ?auto_25296 ?auto_25336 ) ) ( not ( = ?auto_25298 ?auto_25326 ) ) ( not ( = ?auto_25345 ?auto_25321 ) ) ( not ( = ?auto_25339 ?auto_25338 ) ) ( not ( = ?auto_25336 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25299 ) ) ( not ( = ?auto_25296 ?auto_25340 ) ) ( not ( = ?auto_25297 ?auto_25299 ) ) ( not ( = ?auto_25297 ?auto_25340 ) ) ( not ( = ?auto_25299 ?auto_25336 ) ) ( not ( = ?auto_25299 ?auto_25326 ) ) ( not ( = ?auto_25330 ?auto_25345 ) ) ( not ( = ?auto_25330 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25339 ) ) ( not ( = ?auto_25320 ?auto_25338 ) ) ( not ( = ?auto_25340 ?auto_25336 ) ) ( not ( = ?auto_25340 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25300 ) ) ( not ( = ?auto_25296 ?auto_25323 ) ) ( not ( = ?auto_25297 ?auto_25300 ) ) ( not ( = ?auto_25297 ?auto_25323 ) ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25298 ?auto_25323 ) ) ( not ( = ?auto_25300 ?auto_25340 ) ) ( not ( = ?auto_25300 ?auto_25336 ) ) ( not ( = ?auto_25300 ?auto_25326 ) ) ( not ( = ?auto_25333 ?auto_25330 ) ) ( not ( = ?auto_25333 ?auto_25345 ) ) ( not ( = ?auto_25333 ?auto_25321 ) ) ( not ( = ?auto_25327 ?auto_25320 ) ) ( not ( = ?auto_25327 ?auto_25339 ) ) ( not ( = ?auto_25327 ?auto_25338 ) ) ( not ( = ?auto_25323 ?auto_25340 ) ) ( not ( = ?auto_25323 ?auto_25336 ) ) ( not ( = ?auto_25323 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25301 ) ) ( not ( = ?auto_25296 ?auto_25324 ) ) ( not ( = ?auto_25297 ?auto_25301 ) ) ( not ( = ?auto_25297 ?auto_25324 ) ) ( not ( = ?auto_25298 ?auto_25301 ) ) ( not ( = ?auto_25298 ?auto_25324 ) ) ( not ( = ?auto_25299 ?auto_25301 ) ) ( not ( = ?auto_25299 ?auto_25324 ) ) ( not ( = ?auto_25301 ?auto_25323 ) ) ( not ( = ?auto_25301 ?auto_25340 ) ) ( not ( = ?auto_25301 ?auto_25336 ) ) ( not ( = ?auto_25301 ?auto_25326 ) ) ( not ( = ?auto_25337 ?auto_25333 ) ) ( not ( = ?auto_25337 ?auto_25330 ) ) ( not ( = ?auto_25337 ?auto_25345 ) ) ( not ( = ?auto_25337 ?auto_25321 ) ) ( not ( = ?auto_25335 ?auto_25327 ) ) ( not ( = ?auto_25335 ?auto_25320 ) ) ( not ( = ?auto_25335 ?auto_25339 ) ) ( not ( = ?auto_25335 ?auto_25338 ) ) ( not ( = ?auto_25324 ?auto_25323 ) ) ( not ( = ?auto_25324 ?auto_25340 ) ) ( not ( = ?auto_25324 ?auto_25336 ) ) ( not ( = ?auto_25324 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25302 ) ) ( not ( = ?auto_25296 ?auto_25328 ) ) ( not ( = ?auto_25297 ?auto_25302 ) ) ( not ( = ?auto_25297 ?auto_25328 ) ) ( not ( = ?auto_25298 ?auto_25302 ) ) ( not ( = ?auto_25298 ?auto_25328 ) ) ( not ( = ?auto_25299 ?auto_25302 ) ) ( not ( = ?auto_25299 ?auto_25328 ) ) ( not ( = ?auto_25300 ?auto_25302 ) ) ( not ( = ?auto_25300 ?auto_25328 ) ) ( not ( = ?auto_25302 ?auto_25324 ) ) ( not ( = ?auto_25302 ?auto_25323 ) ) ( not ( = ?auto_25302 ?auto_25340 ) ) ( not ( = ?auto_25302 ?auto_25336 ) ) ( not ( = ?auto_25302 ?auto_25326 ) ) ( not ( = ?auto_25328 ?auto_25324 ) ) ( not ( = ?auto_25328 ?auto_25323 ) ) ( not ( = ?auto_25328 ?auto_25340 ) ) ( not ( = ?auto_25328 ?auto_25336 ) ) ( not ( = ?auto_25328 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25305 ) ) ( not ( = ?auto_25296 ?auto_25329 ) ) ( not ( = ?auto_25297 ?auto_25305 ) ) ( not ( = ?auto_25297 ?auto_25329 ) ) ( not ( = ?auto_25298 ?auto_25305 ) ) ( not ( = ?auto_25298 ?auto_25329 ) ) ( not ( = ?auto_25299 ?auto_25305 ) ) ( not ( = ?auto_25299 ?auto_25329 ) ) ( not ( = ?auto_25300 ?auto_25305 ) ) ( not ( = ?auto_25300 ?auto_25329 ) ) ( not ( = ?auto_25301 ?auto_25305 ) ) ( not ( = ?auto_25301 ?auto_25329 ) ) ( not ( = ?auto_25305 ?auto_25328 ) ) ( not ( = ?auto_25305 ?auto_25324 ) ) ( not ( = ?auto_25305 ?auto_25323 ) ) ( not ( = ?auto_25305 ?auto_25340 ) ) ( not ( = ?auto_25305 ?auto_25336 ) ) ( not ( = ?auto_25305 ?auto_25326 ) ) ( not ( = ?auto_25348 ?auto_25330 ) ) ( not ( = ?auto_25348 ?auto_25337 ) ) ( not ( = ?auto_25348 ?auto_25333 ) ) ( not ( = ?auto_25348 ?auto_25345 ) ) ( not ( = ?auto_25348 ?auto_25321 ) ) ( not ( = ?auto_25342 ?auto_25320 ) ) ( not ( = ?auto_25342 ?auto_25335 ) ) ( not ( = ?auto_25342 ?auto_25327 ) ) ( not ( = ?auto_25342 ?auto_25339 ) ) ( not ( = ?auto_25342 ?auto_25338 ) ) ( not ( = ?auto_25329 ?auto_25328 ) ) ( not ( = ?auto_25329 ?auto_25324 ) ) ( not ( = ?auto_25329 ?auto_25323 ) ) ( not ( = ?auto_25329 ?auto_25340 ) ) ( not ( = ?auto_25329 ?auto_25336 ) ) ( not ( = ?auto_25329 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25304 ) ) ( not ( = ?auto_25296 ?auto_25319 ) ) ( not ( = ?auto_25297 ?auto_25304 ) ) ( not ( = ?auto_25297 ?auto_25319 ) ) ( not ( = ?auto_25298 ?auto_25304 ) ) ( not ( = ?auto_25298 ?auto_25319 ) ) ( not ( = ?auto_25299 ?auto_25304 ) ) ( not ( = ?auto_25299 ?auto_25319 ) ) ( not ( = ?auto_25300 ?auto_25304 ) ) ( not ( = ?auto_25300 ?auto_25319 ) ) ( not ( = ?auto_25301 ?auto_25304 ) ) ( not ( = ?auto_25301 ?auto_25319 ) ) ( not ( = ?auto_25302 ?auto_25304 ) ) ( not ( = ?auto_25302 ?auto_25319 ) ) ( not ( = ?auto_25304 ?auto_25329 ) ) ( not ( = ?auto_25304 ?auto_25328 ) ) ( not ( = ?auto_25304 ?auto_25324 ) ) ( not ( = ?auto_25304 ?auto_25323 ) ) ( not ( = ?auto_25304 ?auto_25340 ) ) ( not ( = ?auto_25304 ?auto_25336 ) ) ( not ( = ?auto_25304 ?auto_25326 ) ) ( not ( = ?auto_25319 ?auto_25329 ) ) ( not ( = ?auto_25319 ?auto_25328 ) ) ( not ( = ?auto_25319 ?auto_25324 ) ) ( not ( = ?auto_25319 ?auto_25323 ) ) ( not ( = ?auto_25319 ?auto_25340 ) ) ( not ( = ?auto_25319 ?auto_25336 ) ) ( not ( = ?auto_25319 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25303 ) ) ( not ( = ?auto_25296 ?auto_25334 ) ) ( not ( = ?auto_25297 ?auto_25303 ) ) ( not ( = ?auto_25297 ?auto_25334 ) ) ( not ( = ?auto_25298 ?auto_25303 ) ) ( not ( = ?auto_25298 ?auto_25334 ) ) ( not ( = ?auto_25299 ?auto_25303 ) ) ( not ( = ?auto_25299 ?auto_25334 ) ) ( not ( = ?auto_25300 ?auto_25303 ) ) ( not ( = ?auto_25300 ?auto_25334 ) ) ( not ( = ?auto_25301 ?auto_25303 ) ) ( not ( = ?auto_25301 ?auto_25334 ) ) ( not ( = ?auto_25302 ?auto_25303 ) ) ( not ( = ?auto_25302 ?auto_25334 ) ) ( not ( = ?auto_25305 ?auto_25303 ) ) ( not ( = ?auto_25305 ?auto_25334 ) ) ( not ( = ?auto_25303 ?auto_25319 ) ) ( not ( = ?auto_25303 ?auto_25329 ) ) ( not ( = ?auto_25303 ?auto_25328 ) ) ( not ( = ?auto_25303 ?auto_25324 ) ) ( not ( = ?auto_25303 ?auto_25323 ) ) ( not ( = ?auto_25303 ?auto_25340 ) ) ( not ( = ?auto_25303 ?auto_25336 ) ) ( not ( = ?auto_25303 ?auto_25326 ) ) ( not ( = ?auto_25334 ?auto_25319 ) ) ( not ( = ?auto_25334 ?auto_25329 ) ) ( not ( = ?auto_25334 ?auto_25328 ) ) ( not ( = ?auto_25334 ?auto_25324 ) ) ( not ( = ?auto_25334 ?auto_25323 ) ) ( not ( = ?auto_25334 ?auto_25340 ) ) ( not ( = ?auto_25334 ?auto_25336 ) ) ( not ( = ?auto_25334 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25306 ) ) ( not ( = ?auto_25296 ?auto_25341 ) ) ( not ( = ?auto_25297 ?auto_25306 ) ) ( not ( = ?auto_25297 ?auto_25341 ) ) ( not ( = ?auto_25298 ?auto_25306 ) ) ( not ( = ?auto_25298 ?auto_25341 ) ) ( not ( = ?auto_25299 ?auto_25306 ) ) ( not ( = ?auto_25299 ?auto_25341 ) ) ( not ( = ?auto_25300 ?auto_25306 ) ) ( not ( = ?auto_25300 ?auto_25341 ) ) ( not ( = ?auto_25301 ?auto_25306 ) ) ( not ( = ?auto_25301 ?auto_25341 ) ) ( not ( = ?auto_25302 ?auto_25306 ) ) ( not ( = ?auto_25302 ?auto_25341 ) ) ( not ( = ?auto_25305 ?auto_25306 ) ) ( not ( = ?auto_25305 ?auto_25341 ) ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25304 ?auto_25341 ) ) ( not ( = ?auto_25306 ?auto_25334 ) ) ( not ( = ?auto_25306 ?auto_25319 ) ) ( not ( = ?auto_25306 ?auto_25329 ) ) ( not ( = ?auto_25306 ?auto_25328 ) ) ( not ( = ?auto_25306 ?auto_25324 ) ) ( not ( = ?auto_25306 ?auto_25323 ) ) ( not ( = ?auto_25306 ?auto_25340 ) ) ( not ( = ?auto_25306 ?auto_25336 ) ) ( not ( = ?auto_25306 ?auto_25326 ) ) ( not ( = ?auto_25343 ?auto_25321 ) ) ( not ( = ?auto_25343 ?auto_25348 ) ) ( not ( = ?auto_25343 ?auto_25330 ) ) ( not ( = ?auto_25343 ?auto_25337 ) ) ( not ( = ?auto_25343 ?auto_25333 ) ) ( not ( = ?auto_25343 ?auto_25345 ) ) ( not ( = ?auto_25332 ?auto_25338 ) ) ( not ( = ?auto_25332 ?auto_25342 ) ) ( not ( = ?auto_25332 ?auto_25320 ) ) ( not ( = ?auto_25332 ?auto_25335 ) ) ( not ( = ?auto_25332 ?auto_25327 ) ) ( not ( = ?auto_25332 ?auto_25339 ) ) ( not ( = ?auto_25341 ?auto_25334 ) ) ( not ( = ?auto_25341 ?auto_25319 ) ) ( not ( = ?auto_25341 ?auto_25329 ) ) ( not ( = ?auto_25341 ?auto_25328 ) ) ( not ( = ?auto_25341 ?auto_25324 ) ) ( not ( = ?auto_25341 ?auto_25323 ) ) ( not ( = ?auto_25341 ?auto_25340 ) ) ( not ( = ?auto_25341 ?auto_25336 ) ) ( not ( = ?auto_25341 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25307 ) ) ( not ( = ?auto_25296 ?auto_25349 ) ) ( not ( = ?auto_25297 ?auto_25307 ) ) ( not ( = ?auto_25297 ?auto_25349 ) ) ( not ( = ?auto_25298 ?auto_25307 ) ) ( not ( = ?auto_25298 ?auto_25349 ) ) ( not ( = ?auto_25299 ?auto_25307 ) ) ( not ( = ?auto_25299 ?auto_25349 ) ) ( not ( = ?auto_25300 ?auto_25307 ) ) ( not ( = ?auto_25300 ?auto_25349 ) ) ( not ( = ?auto_25301 ?auto_25307 ) ) ( not ( = ?auto_25301 ?auto_25349 ) ) ( not ( = ?auto_25302 ?auto_25307 ) ) ( not ( = ?auto_25302 ?auto_25349 ) ) ( not ( = ?auto_25305 ?auto_25307 ) ) ( not ( = ?auto_25305 ?auto_25349 ) ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( not ( = ?auto_25304 ?auto_25349 ) ) ( not ( = ?auto_25303 ?auto_25307 ) ) ( not ( = ?auto_25303 ?auto_25349 ) ) ( not ( = ?auto_25307 ?auto_25341 ) ) ( not ( = ?auto_25307 ?auto_25334 ) ) ( not ( = ?auto_25307 ?auto_25319 ) ) ( not ( = ?auto_25307 ?auto_25329 ) ) ( not ( = ?auto_25307 ?auto_25328 ) ) ( not ( = ?auto_25307 ?auto_25324 ) ) ( not ( = ?auto_25307 ?auto_25323 ) ) ( not ( = ?auto_25307 ?auto_25340 ) ) ( not ( = ?auto_25307 ?auto_25336 ) ) ( not ( = ?auto_25307 ?auto_25326 ) ) ( not ( = ?auto_25331 ?auto_25343 ) ) ( not ( = ?auto_25331 ?auto_25321 ) ) ( not ( = ?auto_25331 ?auto_25348 ) ) ( not ( = ?auto_25331 ?auto_25330 ) ) ( not ( = ?auto_25331 ?auto_25337 ) ) ( not ( = ?auto_25331 ?auto_25333 ) ) ( not ( = ?auto_25331 ?auto_25345 ) ) ( not ( = ?auto_25347 ?auto_25332 ) ) ( not ( = ?auto_25347 ?auto_25338 ) ) ( not ( = ?auto_25347 ?auto_25342 ) ) ( not ( = ?auto_25347 ?auto_25320 ) ) ( not ( = ?auto_25347 ?auto_25335 ) ) ( not ( = ?auto_25347 ?auto_25327 ) ) ( not ( = ?auto_25347 ?auto_25339 ) ) ( not ( = ?auto_25349 ?auto_25341 ) ) ( not ( = ?auto_25349 ?auto_25334 ) ) ( not ( = ?auto_25349 ?auto_25319 ) ) ( not ( = ?auto_25349 ?auto_25329 ) ) ( not ( = ?auto_25349 ?auto_25328 ) ) ( not ( = ?auto_25349 ?auto_25324 ) ) ( not ( = ?auto_25349 ?auto_25323 ) ) ( not ( = ?auto_25349 ?auto_25340 ) ) ( not ( = ?auto_25349 ?auto_25336 ) ) ( not ( = ?auto_25349 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25308 ) ) ( not ( = ?auto_25296 ?auto_25322 ) ) ( not ( = ?auto_25297 ?auto_25308 ) ) ( not ( = ?auto_25297 ?auto_25322 ) ) ( not ( = ?auto_25298 ?auto_25308 ) ) ( not ( = ?auto_25298 ?auto_25322 ) ) ( not ( = ?auto_25299 ?auto_25308 ) ) ( not ( = ?auto_25299 ?auto_25322 ) ) ( not ( = ?auto_25300 ?auto_25308 ) ) ( not ( = ?auto_25300 ?auto_25322 ) ) ( not ( = ?auto_25301 ?auto_25308 ) ) ( not ( = ?auto_25301 ?auto_25322 ) ) ( not ( = ?auto_25302 ?auto_25308 ) ) ( not ( = ?auto_25302 ?auto_25322 ) ) ( not ( = ?auto_25305 ?auto_25308 ) ) ( not ( = ?auto_25305 ?auto_25322 ) ) ( not ( = ?auto_25304 ?auto_25308 ) ) ( not ( = ?auto_25304 ?auto_25322 ) ) ( not ( = ?auto_25303 ?auto_25308 ) ) ( not ( = ?auto_25303 ?auto_25322 ) ) ( not ( = ?auto_25306 ?auto_25308 ) ) ( not ( = ?auto_25306 ?auto_25322 ) ) ( not ( = ?auto_25308 ?auto_25349 ) ) ( not ( = ?auto_25308 ?auto_25341 ) ) ( not ( = ?auto_25308 ?auto_25334 ) ) ( not ( = ?auto_25308 ?auto_25319 ) ) ( not ( = ?auto_25308 ?auto_25329 ) ) ( not ( = ?auto_25308 ?auto_25328 ) ) ( not ( = ?auto_25308 ?auto_25324 ) ) ( not ( = ?auto_25308 ?auto_25323 ) ) ( not ( = ?auto_25308 ?auto_25340 ) ) ( not ( = ?auto_25308 ?auto_25336 ) ) ( not ( = ?auto_25308 ?auto_25326 ) ) ( not ( = ?auto_25322 ?auto_25349 ) ) ( not ( = ?auto_25322 ?auto_25341 ) ) ( not ( = ?auto_25322 ?auto_25334 ) ) ( not ( = ?auto_25322 ?auto_25319 ) ) ( not ( = ?auto_25322 ?auto_25329 ) ) ( not ( = ?auto_25322 ?auto_25328 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25323 ) ) ( not ( = ?auto_25322 ?auto_25340 ) ) ( not ( = ?auto_25322 ?auto_25336 ) ) ( not ( = ?auto_25322 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25309 ) ) ( not ( = ?auto_25296 ?auto_25325 ) ) ( not ( = ?auto_25297 ?auto_25309 ) ) ( not ( = ?auto_25297 ?auto_25325 ) ) ( not ( = ?auto_25298 ?auto_25309 ) ) ( not ( = ?auto_25298 ?auto_25325 ) ) ( not ( = ?auto_25299 ?auto_25309 ) ) ( not ( = ?auto_25299 ?auto_25325 ) ) ( not ( = ?auto_25300 ?auto_25309 ) ) ( not ( = ?auto_25300 ?auto_25325 ) ) ( not ( = ?auto_25301 ?auto_25309 ) ) ( not ( = ?auto_25301 ?auto_25325 ) ) ( not ( = ?auto_25302 ?auto_25309 ) ) ( not ( = ?auto_25302 ?auto_25325 ) ) ( not ( = ?auto_25305 ?auto_25309 ) ) ( not ( = ?auto_25305 ?auto_25325 ) ) ( not ( = ?auto_25304 ?auto_25309 ) ) ( not ( = ?auto_25304 ?auto_25325 ) ) ( not ( = ?auto_25303 ?auto_25309 ) ) ( not ( = ?auto_25303 ?auto_25325 ) ) ( not ( = ?auto_25306 ?auto_25309 ) ) ( not ( = ?auto_25306 ?auto_25325 ) ) ( not ( = ?auto_25307 ?auto_25309 ) ) ( not ( = ?auto_25307 ?auto_25325 ) ) ( not ( = ?auto_25309 ?auto_25322 ) ) ( not ( = ?auto_25309 ?auto_25349 ) ) ( not ( = ?auto_25309 ?auto_25341 ) ) ( not ( = ?auto_25309 ?auto_25334 ) ) ( not ( = ?auto_25309 ?auto_25319 ) ) ( not ( = ?auto_25309 ?auto_25329 ) ) ( not ( = ?auto_25309 ?auto_25328 ) ) ( not ( = ?auto_25309 ?auto_25324 ) ) ( not ( = ?auto_25309 ?auto_25323 ) ) ( not ( = ?auto_25309 ?auto_25340 ) ) ( not ( = ?auto_25309 ?auto_25336 ) ) ( not ( = ?auto_25309 ?auto_25326 ) ) ( not ( = ?auto_25325 ?auto_25322 ) ) ( not ( = ?auto_25325 ?auto_25349 ) ) ( not ( = ?auto_25325 ?auto_25341 ) ) ( not ( = ?auto_25325 ?auto_25334 ) ) ( not ( = ?auto_25325 ?auto_25319 ) ) ( not ( = ?auto_25325 ?auto_25329 ) ) ( not ( = ?auto_25325 ?auto_25328 ) ) ( not ( = ?auto_25325 ?auto_25324 ) ) ( not ( = ?auto_25325 ?auto_25323 ) ) ( not ( = ?auto_25325 ?auto_25340 ) ) ( not ( = ?auto_25325 ?auto_25336 ) ) ( not ( = ?auto_25325 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25311 ) ) ( not ( = ?auto_25296 ?auto_25344 ) ) ( not ( = ?auto_25297 ?auto_25311 ) ) ( not ( = ?auto_25297 ?auto_25344 ) ) ( not ( = ?auto_25298 ?auto_25311 ) ) ( not ( = ?auto_25298 ?auto_25344 ) ) ( not ( = ?auto_25299 ?auto_25311 ) ) ( not ( = ?auto_25299 ?auto_25344 ) ) ( not ( = ?auto_25300 ?auto_25311 ) ) ( not ( = ?auto_25300 ?auto_25344 ) ) ( not ( = ?auto_25301 ?auto_25311 ) ) ( not ( = ?auto_25301 ?auto_25344 ) ) ( not ( = ?auto_25302 ?auto_25311 ) ) ( not ( = ?auto_25302 ?auto_25344 ) ) ( not ( = ?auto_25305 ?auto_25311 ) ) ( not ( = ?auto_25305 ?auto_25344 ) ) ( not ( = ?auto_25304 ?auto_25311 ) ) ( not ( = ?auto_25304 ?auto_25344 ) ) ( not ( = ?auto_25303 ?auto_25311 ) ) ( not ( = ?auto_25303 ?auto_25344 ) ) ( not ( = ?auto_25306 ?auto_25311 ) ) ( not ( = ?auto_25306 ?auto_25344 ) ) ( not ( = ?auto_25307 ?auto_25311 ) ) ( not ( = ?auto_25307 ?auto_25344 ) ) ( not ( = ?auto_25308 ?auto_25311 ) ) ( not ( = ?auto_25308 ?auto_25344 ) ) ( not ( = ?auto_25311 ?auto_25325 ) ) ( not ( = ?auto_25311 ?auto_25322 ) ) ( not ( = ?auto_25311 ?auto_25349 ) ) ( not ( = ?auto_25311 ?auto_25341 ) ) ( not ( = ?auto_25311 ?auto_25334 ) ) ( not ( = ?auto_25311 ?auto_25319 ) ) ( not ( = ?auto_25311 ?auto_25329 ) ) ( not ( = ?auto_25311 ?auto_25328 ) ) ( not ( = ?auto_25311 ?auto_25324 ) ) ( not ( = ?auto_25311 ?auto_25323 ) ) ( not ( = ?auto_25311 ?auto_25340 ) ) ( not ( = ?auto_25311 ?auto_25336 ) ) ( not ( = ?auto_25311 ?auto_25326 ) ) ( not ( = ?auto_25344 ?auto_25325 ) ) ( not ( = ?auto_25344 ?auto_25322 ) ) ( not ( = ?auto_25344 ?auto_25349 ) ) ( not ( = ?auto_25344 ?auto_25341 ) ) ( not ( = ?auto_25344 ?auto_25334 ) ) ( not ( = ?auto_25344 ?auto_25319 ) ) ( not ( = ?auto_25344 ?auto_25329 ) ) ( not ( = ?auto_25344 ?auto_25328 ) ) ( not ( = ?auto_25344 ?auto_25324 ) ) ( not ( = ?auto_25344 ?auto_25323 ) ) ( not ( = ?auto_25344 ?auto_25340 ) ) ( not ( = ?auto_25344 ?auto_25336 ) ) ( not ( = ?auto_25344 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25310 ) ) ( not ( = ?auto_25296 ?auto_25346 ) ) ( not ( = ?auto_25297 ?auto_25310 ) ) ( not ( = ?auto_25297 ?auto_25346 ) ) ( not ( = ?auto_25298 ?auto_25310 ) ) ( not ( = ?auto_25298 ?auto_25346 ) ) ( not ( = ?auto_25299 ?auto_25310 ) ) ( not ( = ?auto_25299 ?auto_25346 ) ) ( not ( = ?auto_25300 ?auto_25310 ) ) ( not ( = ?auto_25300 ?auto_25346 ) ) ( not ( = ?auto_25301 ?auto_25310 ) ) ( not ( = ?auto_25301 ?auto_25346 ) ) ( not ( = ?auto_25302 ?auto_25310 ) ) ( not ( = ?auto_25302 ?auto_25346 ) ) ( not ( = ?auto_25305 ?auto_25310 ) ) ( not ( = ?auto_25305 ?auto_25346 ) ) ( not ( = ?auto_25304 ?auto_25310 ) ) ( not ( = ?auto_25304 ?auto_25346 ) ) ( not ( = ?auto_25303 ?auto_25310 ) ) ( not ( = ?auto_25303 ?auto_25346 ) ) ( not ( = ?auto_25306 ?auto_25310 ) ) ( not ( = ?auto_25306 ?auto_25346 ) ) ( not ( = ?auto_25307 ?auto_25310 ) ) ( not ( = ?auto_25307 ?auto_25346 ) ) ( not ( = ?auto_25308 ?auto_25310 ) ) ( not ( = ?auto_25308 ?auto_25346 ) ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25346 ) ) ( not ( = ?auto_25310 ?auto_25344 ) ) ( not ( = ?auto_25310 ?auto_25325 ) ) ( not ( = ?auto_25310 ?auto_25322 ) ) ( not ( = ?auto_25310 ?auto_25349 ) ) ( not ( = ?auto_25310 ?auto_25341 ) ) ( not ( = ?auto_25310 ?auto_25334 ) ) ( not ( = ?auto_25310 ?auto_25319 ) ) ( not ( = ?auto_25310 ?auto_25329 ) ) ( not ( = ?auto_25310 ?auto_25328 ) ) ( not ( = ?auto_25310 ?auto_25324 ) ) ( not ( = ?auto_25310 ?auto_25323 ) ) ( not ( = ?auto_25310 ?auto_25340 ) ) ( not ( = ?auto_25310 ?auto_25336 ) ) ( not ( = ?auto_25310 ?auto_25326 ) ) ( not ( = ?auto_25346 ?auto_25344 ) ) ( not ( = ?auto_25346 ?auto_25325 ) ) ( not ( = ?auto_25346 ?auto_25322 ) ) ( not ( = ?auto_25346 ?auto_25349 ) ) ( not ( = ?auto_25346 ?auto_25341 ) ) ( not ( = ?auto_25346 ?auto_25334 ) ) ( not ( = ?auto_25346 ?auto_25319 ) ) ( not ( = ?auto_25346 ?auto_25329 ) ) ( not ( = ?auto_25346 ?auto_25328 ) ) ( not ( = ?auto_25346 ?auto_25324 ) ) ( not ( = ?auto_25346 ?auto_25323 ) ) ( not ( = ?auto_25346 ?auto_25340 ) ) ( not ( = ?auto_25346 ?auto_25336 ) ) ( not ( = ?auto_25346 ?auto_25326 ) ) ( not ( = ?auto_25296 ?auto_25312 ) ) ( not ( = ?auto_25296 ?auto_25314 ) ) ( not ( = ?auto_25297 ?auto_25312 ) ) ( not ( = ?auto_25297 ?auto_25314 ) ) ( not ( = ?auto_25298 ?auto_25312 ) ) ( not ( = ?auto_25298 ?auto_25314 ) ) ( not ( = ?auto_25299 ?auto_25312 ) ) ( not ( = ?auto_25299 ?auto_25314 ) ) ( not ( = ?auto_25300 ?auto_25312 ) ) ( not ( = ?auto_25300 ?auto_25314 ) ) ( not ( = ?auto_25301 ?auto_25312 ) ) ( not ( = ?auto_25301 ?auto_25314 ) ) ( not ( = ?auto_25302 ?auto_25312 ) ) ( not ( = ?auto_25302 ?auto_25314 ) ) ( not ( = ?auto_25305 ?auto_25312 ) ) ( not ( = ?auto_25305 ?auto_25314 ) ) ( not ( = ?auto_25304 ?auto_25312 ) ) ( not ( = ?auto_25304 ?auto_25314 ) ) ( not ( = ?auto_25303 ?auto_25312 ) ) ( not ( = ?auto_25303 ?auto_25314 ) ) ( not ( = ?auto_25306 ?auto_25312 ) ) ( not ( = ?auto_25306 ?auto_25314 ) ) ( not ( = ?auto_25307 ?auto_25312 ) ) ( not ( = ?auto_25307 ?auto_25314 ) ) ( not ( = ?auto_25308 ?auto_25312 ) ) ( not ( = ?auto_25308 ?auto_25314 ) ) ( not ( = ?auto_25309 ?auto_25312 ) ) ( not ( = ?auto_25309 ?auto_25314 ) ) ( not ( = ?auto_25311 ?auto_25312 ) ) ( not ( = ?auto_25311 ?auto_25314 ) ) ( not ( = ?auto_25312 ?auto_25346 ) ) ( not ( = ?auto_25312 ?auto_25344 ) ) ( not ( = ?auto_25312 ?auto_25325 ) ) ( not ( = ?auto_25312 ?auto_25322 ) ) ( not ( = ?auto_25312 ?auto_25349 ) ) ( not ( = ?auto_25312 ?auto_25341 ) ) ( not ( = ?auto_25312 ?auto_25334 ) ) ( not ( = ?auto_25312 ?auto_25319 ) ) ( not ( = ?auto_25312 ?auto_25329 ) ) ( not ( = ?auto_25312 ?auto_25328 ) ) ( not ( = ?auto_25312 ?auto_25324 ) ) ( not ( = ?auto_25312 ?auto_25323 ) ) ( not ( = ?auto_25312 ?auto_25340 ) ) ( not ( = ?auto_25312 ?auto_25336 ) ) ( not ( = ?auto_25312 ?auto_25326 ) ) ( not ( = ?auto_25317 ?auto_25337 ) ) ( not ( = ?auto_25317 ?auto_25348 ) ) ( not ( = ?auto_25317 ?auto_25343 ) ) ( not ( = ?auto_25317 ?auto_25331 ) ) ( not ( = ?auto_25317 ?auto_25321 ) ) ( not ( = ?auto_25317 ?auto_25330 ) ) ( not ( = ?auto_25317 ?auto_25333 ) ) ( not ( = ?auto_25317 ?auto_25345 ) ) ( not ( = ?auto_25316 ?auto_25335 ) ) ( not ( = ?auto_25316 ?auto_25342 ) ) ( not ( = ?auto_25316 ?auto_25332 ) ) ( not ( = ?auto_25316 ?auto_25347 ) ) ( not ( = ?auto_25316 ?auto_25338 ) ) ( not ( = ?auto_25316 ?auto_25320 ) ) ( not ( = ?auto_25316 ?auto_25327 ) ) ( not ( = ?auto_25316 ?auto_25339 ) ) ( not ( = ?auto_25314 ?auto_25346 ) ) ( not ( = ?auto_25314 ?auto_25344 ) ) ( not ( = ?auto_25314 ?auto_25325 ) ) ( not ( = ?auto_25314 ?auto_25322 ) ) ( not ( = ?auto_25314 ?auto_25349 ) ) ( not ( = ?auto_25314 ?auto_25341 ) ) ( not ( = ?auto_25314 ?auto_25334 ) ) ( not ( = ?auto_25314 ?auto_25319 ) ) ( not ( = ?auto_25314 ?auto_25329 ) ) ( not ( = ?auto_25314 ?auto_25328 ) ) ( not ( = ?auto_25314 ?auto_25324 ) ) ( not ( = ?auto_25314 ?auto_25323 ) ) ( not ( = ?auto_25314 ?auto_25340 ) ) ( not ( = ?auto_25314 ?auto_25336 ) ) ( not ( = ?auto_25314 ?auto_25326 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_25296 ?auto_25297 ?auto_25298 ?auto_25299 ?auto_25300 ?auto_25301 ?auto_25302 ?auto_25305 ?auto_25304 ?auto_25303 ?auto_25306 ?auto_25307 ?auto_25308 ?auto_25309 ?auto_25311 ?auto_25310 )
      ( MAKE-1CRATE ?auto_25310 ?auto_25312 )
      ( MAKE-16CRATE-VERIFY ?auto_25296 ?auto_25297 ?auto_25298 ?auto_25299 ?auto_25300 ?auto_25301 ?auto_25302 ?auto_25305 ?auto_25304 ?auto_25303 ?auto_25306 ?auto_25307 ?auto_25308 ?auto_25309 ?auto_25311 ?auto_25310 ?auto_25312 ) )
  )

)

