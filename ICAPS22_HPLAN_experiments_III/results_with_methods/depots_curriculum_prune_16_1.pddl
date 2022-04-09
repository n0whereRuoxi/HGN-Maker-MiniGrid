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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24547 - SURFACE
      ?auto_24548 - SURFACE
      ?auto_24549 - SURFACE
    )
    :vars
    (
      ?auto_24550 - HOIST
      ?auto_24551 - PLACE
      ?auto_24554 - PLACE
      ?auto_24553 - HOIST
      ?auto_24555 - SURFACE
      ?auto_24556 - PLACE
      ?auto_24557 - HOIST
      ?auto_24558 - SURFACE
      ?auto_24552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24550 ?auto_24551 ) ( IS-CRATE ?auto_24549 ) ( not ( = ?auto_24554 ?auto_24551 ) ) ( HOIST-AT ?auto_24553 ?auto_24554 ) ( AVAILABLE ?auto_24553 ) ( SURFACE-AT ?auto_24549 ?auto_24554 ) ( ON ?auto_24549 ?auto_24555 ) ( CLEAR ?auto_24549 ) ( not ( = ?auto_24548 ?auto_24549 ) ) ( not ( = ?auto_24548 ?auto_24555 ) ) ( not ( = ?auto_24549 ?auto_24555 ) ) ( not ( = ?auto_24550 ?auto_24553 ) ) ( SURFACE-AT ?auto_24547 ?auto_24551 ) ( CLEAR ?auto_24547 ) ( IS-CRATE ?auto_24548 ) ( AVAILABLE ?auto_24550 ) ( not ( = ?auto_24556 ?auto_24551 ) ) ( HOIST-AT ?auto_24557 ?auto_24556 ) ( AVAILABLE ?auto_24557 ) ( SURFACE-AT ?auto_24548 ?auto_24556 ) ( ON ?auto_24548 ?auto_24558 ) ( CLEAR ?auto_24548 ) ( TRUCK-AT ?auto_24552 ?auto_24551 ) ( not ( = ?auto_24547 ?auto_24548 ) ) ( not ( = ?auto_24547 ?auto_24558 ) ) ( not ( = ?auto_24548 ?auto_24558 ) ) ( not ( = ?auto_24550 ?auto_24557 ) ) ( not ( = ?auto_24547 ?auto_24549 ) ) ( not ( = ?auto_24547 ?auto_24555 ) ) ( not ( = ?auto_24549 ?auto_24558 ) ) ( not ( = ?auto_24554 ?auto_24556 ) ) ( not ( = ?auto_24553 ?auto_24557 ) ) ( not ( = ?auto_24555 ?auto_24558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24547 ?auto_24548 )
      ( MAKE-1CRATE ?auto_24548 ?auto_24549 )
      ( MAKE-2CRATE-VERIFY ?auto_24547 ?auto_24548 ?auto_24549 ) )
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
      ?auto_24578 - HOIST
      ?auto_24577 - PLACE
      ?auto_24580 - PLACE
      ?auto_24582 - HOIST
      ?auto_24581 - SURFACE
      ?auto_24588 - PLACE
      ?auto_24584 - HOIST
      ?auto_24586 - SURFACE
      ?auto_24583 - PLACE
      ?auto_24587 - HOIST
      ?auto_24585 - SURFACE
      ?auto_24579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24578 ?auto_24577 ) ( IS-CRATE ?auto_24576 ) ( not ( = ?auto_24580 ?auto_24577 ) ) ( HOIST-AT ?auto_24582 ?auto_24580 ) ( AVAILABLE ?auto_24582 ) ( SURFACE-AT ?auto_24576 ?auto_24580 ) ( ON ?auto_24576 ?auto_24581 ) ( CLEAR ?auto_24576 ) ( not ( = ?auto_24575 ?auto_24576 ) ) ( not ( = ?auto_24575 ?auto_24581 ) ) ( not ( = ?auto_24576 ?auto_24581 ) ) ( not ( = ?auto_24578 ?auto_24582 ) ) ( IS-CRATE ?auto_24575 ) ( not ( = ?auto_24588 ?auto_24577 ) ) ( HOIST-AT ?auto_24584 ?auto_24588 ) ( AVAILABLE ?auto_24584 ) ( SURFACE-AT ?auto_24575 ?auto_24588 ) ( ON ?auto_24575 ?auto_24586 ) ( CLEAR ?auto_24575 ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24586 ) ) ( not ( = ?auto_24575 ?auto_24586 ) ) ( not ( = ?auto_24578 ?auto_24584 ) ) ( SURFACE-AT ?auto_24573 ?auto_24577 ) ( CLEAR ?auto_24573 ) ( IS-CRATE ?auto_24574 ) ( AVAILABLE ?auto_24578 ) ( not ( = ?auto_24583 ?auto_24577 ) ) ( HOIST-AT ?auto_24587 ?auto_24583 ) ( AVAILABLE ?auto_24587 ) ( SURFACE-AT ?auto_24574 ?auto_24583 ) ( ON ?auto_24574 ?auto_24585 ) ( CLEAR ?auto_24574 ) ( TRUCK-AT ?auto_24579 ?auto_24577 ) ( not ( = ?auto_24573 ?auto_24574 ) ) ( not ( = ?auto_24573 ?auto_24585 ) ) ( not ( = ?auto_24574 ?auto_24585 ) ) ( not ( = ?auto_24578 ?auto_24587 ) ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( not ( = ?auto_24573 ?auto_24586 ) ) ( not ( = ?auto_24575 ?auto_24585 ) ) ( not ( = ?auto_24588 ?auto_24583 ) ) ( not ( = ?auto_24584 ?auto_24587 ) ) ( not ( = ?auto_24586 ?auto_24585 ) ) ( not ( = ?auto_24573 ?auto_24576 ) ) ( not ( = ?auto_24573 ?auto_24581 ) ) ( not ( = ?auto_24574 ?auto_24576 ) ) ( not ( = ?auto_24574 ?auto_24581 ) ) ( not ( = ?auto_24576 ?auto_24586 ) ) ( not ( = ?auto_24576 ?auto_24585 ) ) ( not ( = ?auto_24580 ?auto_24588 ) ) ( not ( = ?auto_24580 ?auto_24583 ) ) ( not ( = ?auto_24582 ?auto_24584 ) ) ( not ( = ?auto_24582 ?auto_24587 ) ) ( not ( = ?auto_24581 ?auto_24586 ) ) ( not ( = ?auto_24581 ?auto_24585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24573 ?auto_24574 ?auto_24575 )
      ( MAKE-1CRATE ?auto_24575 ?auto_24576 )
      ( MAKE-3CRATE-VERIFY ?auto_24573 ?auto_24574 ?auto_24575 ?auto_24576 ) )
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
      ?auto_24614 - HOIST
      ?auto_24609 - PLACE
      ?auto_24613 - PLACE
      ?auto_24610 - HOIST
      ?auto_24612 - SURFACE
      ?auto_24622 - PLACE
      ?auto_24623 - HOIST
      ?auto_24616 - SURFACE
      ?auto_24618 - PLACE
      ?auto_24615 - HOIST
      ?auto_24621 - SURFACE
      ?auto_24620 - PLACE
      ?auto_24617 - HOIST
      ?auto_24619 - SURFACE
      ?auto_24611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24614 ?auto_24609 ) ( IS-CRATE ?auto_24608 ) ( not ( = ?auto_24613 ?auto_24609 ) ) ( HOIST-AT ?auto_24610 ?auto_24613 ) ( AVAILABLE ?auto_24610 ) ( SURFACE-AT ?auto_24608 ?auto_24613 ) ( ON ?auto_24608 ?auto_24612 ) ( CLEAR ?auto_24608 ) ( not ( = ?auto_24607 ?auto_24608 ) ) ( not ( = ?auto_24607 ?auto_24612 ) ) ( not ( = ?auto_24608 ?auto_24612 ) ) ( not ( = ?auto_24614 ?auto_24610 ) ) ( IS-CRATE ?auto_24607 ) ( not ( = ?auto_24622 ?auto_24609 ) ) ( HOIST-AT ?auto_24623 ?auto_24622 ) ( AVAILABLE ?auto_24623 ) ( SURFACE-AT ?auto_24607 ?auto_24622 ) ( ON ?auto_24607 ?auto_24616 ) ( CLEAR ?auto_24607 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( not ( = ?auto_24606 ?auto_24616 ) ) ( not ( = ?auto_24607 ?auto_24616 ) ) ( not ( = ?auto_24614 ?auto_24623 ) ) ( IS-CRATE ?auto_24606 ) ( not ( = ?auto_24618 ?auto_24609 ) ) ( HOIST-AT ?auto_24615 ?auto_24618 ) ( AVAILABLE ?auto_24615 ) ( SURFACE-AT ?auto_24606 ?auto_24618 ) ( ON ?auto_24606 ?auto_24621 ) ( CLEAR ?auto_24606 ) ( not ( = ?auto_24605 ?auto_24606 ) ) ( not ( = ?auto_24605 ?auto_24621 ) ) ( not ( = ?auto_24606 ?auto_24621 ) ) ( not ( = ?auto_24614 ?auto_24615 ) ) ( SURFACE-AT ?auto_24604 ?auto_24609 ) ( CLEAR ?auto_24604 ) ( IS-CRATE ?auto_24605 ) ( AVAILABLE ?auto_24614 ) ( not ( = ?auto_24620 ?auto_24609 ) ) ( HOIST-AT ?auto_24617 ?auto_24620 ) ( AVAILABLE ?auto_24617 ) ( SURFACE-AT ?auto_24605 ?auto_24620 ) ( ON ?auto_24605 ?auto_24619 ) ( CLEAR ?auto_24605 ) ( TRUCK-AT ?auto_24611 ?auto_24609 ) ( not ( = ?auto_24604 ?auto_24605 ) ) ( not ( = ?auto_24604 ?auto_24619 ) ) ( not ( = ?auto_24605 ?auto_24619 ) ) ( not ( = ?auto_24614 ?auto_24617 ) ) ( not ( = ?auto_24604 ?auto_24606 ) ) ( not ( = ?auto_24604 ?auto_24621 ) ) ( not ( = ?auto_24606 ?auto_24619 ) ) ( not ( = ?auto_24618 ?auto_24620 ) ) ( not ( = ?auto_24615 ?auto_24617 ) ) ( not ( = ?auto_24621 ?auto_24619 ) ) ( not ( = ?auto_24604 ?auto_24607 ) ) ( not ( = ?auto_24604 ?auto_24616 ) ) ( not ( = ?auto_24605 ?auto_24607 ) ) ( not ( = ?auto_24605 ?auto_24616 ) ) ( not ( = ?auto_24607 ?auto_24621 ) ) ( not ( = ?auto_24607 ?auto_24619 ) ) ( not ( = ?auto_24622 ?auto_24618 ) ) ( not ( = ?auto_24622 ?auto_24620 ) ) ( not ( = ?auto_24623 ?auto_24615 ) ) ( not ( = ?auto_24623 ?auto_24617 ) ) ( not ( = ?auto_24616 ?auto_24621 ) ) ( not ( = ?auto_24616 ?auto_24619 ) ) ( not ( = ?auto_24604 ?auto_24608 ) ) ( not ( = ?auto_24604 ?auto_24612 ) ) ( not ( = ?auto_24605 ?auto_24608 ) ) ( not ( = ?auto_24605 ?auto_24612 ) ) ( not ( = ?auto_24606 ?auto_24608 ) ) ( not ( = ?auto_24606 ?auto_24612 ) ) ( not ( = ?auto_24608 ?auto_24616 ) ) ( not ( = ?auto_24608 ?auto_24621 ) ) ( not ( = ?auto_24608 ?auto_24619 ) ) ( not ( = ?auto_24613 ?auto_24622 ) ) ( not ( = ?auto_24613 ?auto_24618 ) ) ( not ( = ?auto_24613 ?auto_24620 ) ) ( not ( = ?auto_24610 ?auto_24623 ) ) ( not ( = ?auto_24610 ?auto_24615 ) ) ( not ( = ?auto_24610 ?auto_24617 ) ) ( not ( = ?auto_24612 ?auto_24616 ) ) ( not ( = ?auto_24612 ?auto_24621 ) ) ( not ( = ?auto_24612 ?auto_24619 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_24604 ?auto_24605 ?auto_24606 ?auto_24607 )
      ( MAKE-1CRATE ?auto_24607 ?auto_24608 )
      ( MAKE-4CRATE-VERIFY ?auto_24604 ?auto_24605 ?auto_24606 ?auto_24607 ?auto_24608 ) )
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
      ?auto_24647 - HOIST
      ?auto_24650 - PLACE
      ?auto_24649 - PLACE
      ?auto_24648 - HOIST
      ?auto_24646 - SURFACE
      ?auto_24656 - PLACE
      ?auto_24654 - HOIST
      ?auto_24663 - SURFACE
      ?auto_24657 - PLACE
      ?auto_24661 - HOIST
      ?auto_24652 - SURFACE
      ?auto_24658 - PLACE
      ?auto_24653 - HOIST
      ?auto_24659 - SURFACE
      ?auto_24662 - PLACE
      ?auto_24660 - HOIST
      ?auto_24655 - SURFACE
      ?auto_24651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24647 ?auto_24650 ) ( IS-CRATE ?auto_24645 ) ( not ( = ?auto_24649 ?auto_24650 ) ) ( HOIST-AT ?auto_24648 ?auto_24649 ) ( AVAILABLE ?auto_24648 ) ( SURFACE-AT ?auto_24645 ?auto_24649 ) ( ON ?auto_24645 ?auto_24646 ) ( CLEAR ?auto_24645 ) ( not ( = ?auto_24644 ?auto_24645 ) ) ( not ( = ?auto_24644 ?auto_24646 ) ) ( not ( = ?auto_24645 ?auto_24646 ) ) ( not ( = ?auto_24647 ?auto_24648 ) ) ( IS-CRATE ?auto_24644 ) ( not ( = ?auto_24656 ?auto_24650 ) ) ( HOIST-AT ?auto_24654 ?auto_24656 ) ( AVAILABLE ?auto_24654 ) ( SURFACE-AT ?auto_24644 ?auto_24656 ) ( ON ?auto_24644 ?auto_24663 ) ( CLEAR ?auto_24644 ) ( not ( = ?auto_24643 ?auto_24644 ) ) ( not ( = ?auto_24643 ?auto_24663 ) ) ( not ( = ?auto_24644 ?auto_24663 ) ) ( not ( = ?auto_24647 ?auto_24654 ) ) ( IS-CRATE ?auto_24643 ) ( not ( = ?auto_24657 ?auto_24650 ) ) ( HOIST-AT ?auto_24661 ?auto_24657 ) ( AVAILABLE ?auto_24661 ) ( SURFACE-AT ?auto_24643 ?auto_24657 ) ( ON ?auto_24643 ?auto_24652 ) ( CLEAR ?auto_24643 ) ( not ( = ?auto_24642 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24652 ) ) ( not ( = ?auto_24643 ?auto_24652 ) ) ( not ( = ?auto_24647 ?auto_24661 ) ) ( IS-CRATE ?auto_24642 ) ( not ( = ?auto_24658 ?auto_24650 ) ) ( HOIST-AT ?auto_24653 ?auto_24658 ) ( AVAILABLE ?auto_24653 ) ( SURFACE-AT ?auto_24642 ?auto_24658 ) ( ON ?auto_24642 ?auto_24659 ) ( CLEAR ?auto_24642 ) ( not ( = ?auto_24641 ?auto_24642 ) ) ( not ( = ?auto_24641 ?auto_24659 ) ) ( not ( = ?auto_24642 ?auto_24659 ) ) ( not ( = ?auto_24647 ?auto_24653 ) ) ( SURFACE-AT ?auto_24640 ?auto_24650 ) ( CLEAR ?auto_24640 ) ( IS-CRATE ?auto_24641 ) ( AVAILABLE ?auto_24647 ) ( not ( = ?auto_24662 ?auto_24650 ) ) ( HOIST-AT ?auto_24660 ?auto_24662 ) ( AVAILABLE ?auto_24660 ) ( SURFACE-AT ?auto_24641 ?auto_24662 ) ( ON ?auto_24641 ?auto_24655 ) ( CLEAR ?auto_24641 ) ( TRUCK-AT ?auto_24651 ?auto_24650 ) ( not ( = ?auto_24640 ?auto_24641 ) ) ( not ( = ?auto_24640 ?auto_24655 ) ) ( not ( = ?auto_24641 ?auto_24655 ) ) ( not ( = ?auto_24647 ?auto_24660 ) ) ( not ( = ?auto_24640 ?auto_24642 ) ) ( not ( = ?auto_24640 ?auto_24659 ) ) ( not ( = ?auto_24642 ?auto_24655 ) ) ( not ( = ?auto_24658 ?auto_24662 ) ) ( not ( = ?auto_24653 ?auto_24660 ) ) ( not ( = ?auto_24659 ?auto_24655 ) ) ( not ( = ?auto_24640 ?auto_24643 ) ) ( not ( = ?auto_24640 ?auto_24652 ) ) ( not ( = ?auto_24641 ?auto_24643 ) ) ( not ( = ?auto_24641 ?auto_24652 ) ) ( not ( = ?auto_24643 ?auto_24659 ) ) ( not ( = ?auto_24643 ?auto_24655 ) ) ( not ( = ?auto_24657 ?auto_24658 ) ) ( not ( = ?auto_24657 ?auto_24662 ) ) ( not ( = ?auto_24661 ?auto_24653 ) ) ( not ( = ?auto_24661 ?auto_24660 ) ) ( not ( = ?auto_24652 ?auto_24659 ) ) ( not ( = ?auto_24652 ?auto_24655 ) ) ( not ( = ?auto_24640 ?auto_24644 ) ) ( not ( = ?auto_24640 ?auto_24663 ) ) ( not ( = ?auto_24641 ?auto_24644 ) ) ( not ( = ?auto_24641 ?auto_24663 ) ) ( not ( = ?auto_24642 ?auto_24644 ) ) ( not ( = ?auto_24642 ?auto_24663 ) ) ( not ( = ?auto_24644 ?auto_24652 ) ) ( not ( = ?auto_24644 ?auto_24659 ) ) ( not ( = ?auto_24644 ?auto_24655 ) ) ( not ( = ?auto_24656 ?auto_24657 ) ) ( not ( = ?auto_24656 ?auto_24658 ) ) ( not ( = ?auto_24656 ?auto_24662 ) ) ( not ( = ?auto_24654 ?auto_24661 ) ) ( not ( = ?auto_24654 ?auto_24653 ) ) ( not ( = ?auto_24654 ?auto_24660 ) ) ( not ( = ?auto_24663 ?auto_24652 ) ) ( not ( = ?auto_24663 ?auto_24659 ) ) ( not ( = ?auto_24663 ?auto_24655 ) ) ( not ( = ?auto_24640 ?auto_24645 ) ) ( not ( = ?auto_24640 ?auto_24646 ) ) ( not ( = ?auto_24641 ?auto_24645 ) ) ( not ( = ?auto_24641 ?auto_24646 ) ) ( not ( = ?auto_24642 ?auto_24645 ) ) ( not ( = ?auto_24642 ?auto_24646 ) ) ( not ( = ?auto_24643 ?auto_24645 ) ) ( not ( = ?auto_24643 ?auto_24646 ) ) ( not ( = ?auto_24645 ?auto_24663 ) ) ( not ( = ?auto_24645 ?auto_24652 ) ) ( not ( = ?auto_24645 ?auto_24659 ) ) ( not ( = ?auto_24645 ?auto_24655 ) ) ( not ( = ?auto_24649 ?auto_24656 ) ) ( not ( = ?auto_24649 ?auto_24657 ) ) ( not ( = ?auto_24649 ?auto_24658 ) ) ( not ( = ?auto_24649 ?auto_24662 ) ) ( not ( = ?auto_24648 ?auto_24654 ) ) ( not ( = ?auto_24648 ?auto_24661 ) ) ( not ( = ?auto_24648 ?auto_24653 ) ) ( not ( = ?auto_24648 ?auto_24660 ) ) ( not ( = ?auto_24646 ?auto_24663 ) ) ( not ( = ?auto_24646 ?auto_24652 ) ) ( not ( = ?auto_24646 ?auto_24659 ) ) ( not ( = ?auto_24646 ?auto_24655 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_24640 ?auto_24641 ?auto_24642 ?auto_24643 ?auto_24644 )
      ( MAKE-1CRATE ?auto_24644 ?auto_24645 )
      ( MAKE-5CRATE-VERIFY ?auto_24640 ?auto_24641 ?auto_24642 ?auto_24643 ?auto_24644 ?auto_24645 ) )
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
      ?auto_24692 - HOIST
      ?auto_24693 - PLACE
      ?auto_24691 - PLACE
      ?auto_24690 - HOIST
      ?auto_24688 - SURFACE
      ?auto_24697 - PLACE
      ?auto_24698 - HOIST
      ?auto_24706 - SURFACE
      ?auto_24704 - PLACE
      ?auto_24700 - HOIST
      ?auto_24696 - SURFACE
      ?auto_24701 - SURFACE
      ?auto_24705 - PLACE
      ?auto_24699 - HOIST
      ?auto_24694 - SURFACE
      ?auto_24702 - PLACE
      ?auto_24695 - HOIST
      ?auto_24703 - SURFACE
      ?auto_24689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24692 ?auto_24693 ) ( IS-CRATE ?auto_24687 ) ( not ( = ?auto_24691 ?auto_24693 ) ) ( HOIST-AT ?auto_24690 ?auto_24691 ) ( SURFACE-AT ?auto_24687 ?auto_24691 ) ( ON ?auto_24687 ?auto_24688 ) ( CLEAR ?auto_24687 ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24692 ?auto_24690 ) ) ( IS-CRATE ?auto_24686 ) ( not ( = ?auto_24697 ?auto_24693 ) ) ( HOIST-AT ?auto_24698 ?auto_24697 ) ( AVAILABLE ?auto_24698 ) ( SURFACE-AT ?auto_24686 ?auto_24697 ) ( ON ?auto_24686 ?auto_24706 ) ( CLEAR ?auto_24686 ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24706 ) ) ( not ( = ?auto_24686 ?auto_24706 ) ) ( not ( = ?auto_24692 ?auto_24698 ) ) ( IS-CRATE ?auto_24685 ) ( not ( = ?auto_24704 ?auto_24693 ) ) ( HOIST-AT ?auto_24700 ?auto_24704 ) ( AVAILABLE ?auto_24700 ) ( SURFACE-AT ?auto_24685 ?auto_24704 ) ( ON ?auto_24685 ?auto_24696 ) ( CLEAR ?auto_24685 ) ( not ( = ?auto_24684 ?auto_24685 ) ) ( not ( = ?auto_24684 ?auto_24696 ) ) ( not ( = ?auto_24685 ?auto_24696 ) ) ( not ( = ?auto_24692 ?auto_24700 ) ) ( IS-CRATE ?auto_24684 ) ( AVAILABLE ?auto_24690 ) ( SURFACE-AT ?auto_24684 ?auto_24691 ) ( ON ?auto_24684 ?auto_24701 ) ( CLEAR ?auto_24684 ) ( not ( = ?auto_24683 ?auto_24684 ) ) ( not ( = ?auto_24683 ?auto_24701 ) ) ( not ( = ?auto_24684 ?auto_24701 ) ) ( IS-CRATE ?auto_24683 ) ( not ( = ?auto_24705 ?auto_24693 ) ) ( HOIST-AT ?auto_24699 ?auto_24705 ) ( AVAILABLE ?auto_24699 ) ( SURFACE-AT ?auto_24683 ?auto_24705 ) ( ON ?auto_24683 ?auto_24694 ) ( CLEAR ?auto_24683 ) ( not ( = ?auto_24682 ?auto_24683 ) ) ( not ( = ?auto_24682 ?auto_24694 ) ) ( not ( = ?auto_24683 ?auto_24694 ) ) ( not ( = ?auto_24692 ?auto_24699 ) ) ( SURFACE-AT ?auto_24681 ?auto_24693 ) ( CLEAR ?auto_24681 ) ( IS-CRATE ?auto_24682 ) ( AVAILABLE ?auto_24692 ) ( not ( = ?auto_24702 ?auto_24693 ) ) ( HOIST-AT ?auto_24695 ?auto_24702 ) ( AVAILABLE ?auto_24695 ) ( SURFACE-AT ?auto_24682 ?auto_24702 ) ( ON ?auto_24682 ?auto_24703 ) ( CLEAR ?auto_24682 ) ( TRUCK-AT ?auto_24689 ?auto_24693 ) ( not ( = ?auto_24681 ?auto_24682 ) ) ( not ( = ?auto_24681 ?auto_24703 ) ) ( not ( = ?auto_24682 ?auto_24703 ) ) ( not ( = ?auto_24692 ?auto_24695 ) ) ( not ( = ?auto_24681 ?auto_24683 ) ) ( not ( = ?auto_24681 ?auto_24694 ) ) ( not ( = ?auto_24683 ?auto_24703 ) ) ( not ( = ?auto_24705 ?auto_24702 ) ) ( not ( = ?auto_24699 ?auto_24695 ) ) ( not ( = ?auto_24694 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24684 ) ) ( not ( = ?auto_24681 ?auto_24701 ) ) ( not ( = ?auto_24682 ?auto_24684 ) ) ( not ( = ?auto_24682 ?auto_24701 ) ) ( not ( = ?auto_24684 ?auto_24694 ) ) ( not ( = ?auto_24684 ?auto_24703 ) ) ( not ( = ?auto_24691 ?auto_24705 ) ) ( not ( = ?auto_24691 ?auto_24702 ) ) ( not ( = ?auto_24690 ?auto_24699 ) ) ( not ( = ?auto_24690 ?auto_24695 ) ) ( not ( = ?auto_24701 ?auto_24694 ) ) ( not ( = ?auto_24701 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24685 ) ) ( not ( = ?auto_24681 ?auto_24696 ) ) ( not ( = ?auto_24682 ?auto_24685 ) ) ( not ( = ?auto_24682 ?auto_24696 ) ) ( not ( = ?auto_24683 ?auto_24685 ) ) ( not ( = ?auto_24683 ?auto_24696 ) ) ( not ( = ?auto_24685 ?auto_24701 ) ) ( not ( = ?auto_24685 ?auto_24694 ) ) ( not ( = ?auto_24685 ?auto_24703 ) ) ( not ( = ?auto_24704 ?auto_24691 ) ) ( not ( = ?auto_24704 ?auto_24705 ) ) ( not ( = ?auto_24704 ?auto_24702 ) ) ( not ( = ?auto_24700 ?auto_24690 ) ) ( not ( = ?auto_24700 ?auto_24699 ) ) ( not ( = ?auto_24700 ?auto_24695 ) ) ( not ( = ?auto_24696 ?auto_24701 ) ) ( not ( = ?auto_24696 ?auto_24694 ) ) ( not ( = ?auto_24696 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24686 ) ) ( not ( = ?auto_24681 ?auto_24706 ) ) ( not ( = ?auto_24682 ?auto_24686 ) ) ( not ( = ?auto_24682 ?auto_24706 ) ) ( not ( = ?auto_24683 ?auto_24686 ) ) ( not ( = ?auto_24683 ?auto_24706 ) ) ( not ( = ?auto_24684 ?auto_24686 ) ) ( not ( = ?auto_24684 ?auto_24706 ) ) ( not ( = ?auto_24686 ?auto_24696 ) ) ( not ( = ?auto_24686 ?auto_24701 ) ) ( not ( = ?auto_24686 ?auto_24694 ) ) ( not ( = ?auto_24686 ?auto_24703 ) ) ( not ( = ?auto_24697 ?auto_24704 ) ) ( not ( = ?auto_24697 ?auto_24691 ) ) ( not ( = ?auto_24697 ?auto_24705 ) ) ( not ( = ?auto_24697 ?auto_24702 ) ) ( not ( = ?auto_24698 ?auto_24700 ) ) ( not ( = ?auto_24698 ?auto_24690 ) ) ( not ( = ?auto_24698 ?auto_24699 ) ) ( not ( = ?auto_24698 ?auto_24695 ) ) ( not ( = ?auto_24706 ?auto_24696 ) ) ( not ( = ?auto_24706 ?auto_24701 ) ) ( not ( = ?auto_24706 ?auto_24694 ) ) ( not ( = ?auto_24706 ?auto_24703 ) ) ( not ( = ?auto_24681 ?auto_24687 ) ) ( not ( = ?auto_24681 ?auto_24688 ) ) ( not ( = ?auto_24682 ?auto_24687 ) ) ( not ( = ?auto_24682 ?auto_24688 ) ) ( not ( = ?auto_24683 ?auto_24687 ) ) ( not ( = ?auto_24683 ?auto_24688 ) ) ( not ( = ?auto_24684 ?auto_24687 ) ) ( not ( = ?auto_24684 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24706 ) ) ( not ( = ?auto_24687 ?auto_24696 ) ) ( not ( = ?auto_24687 ?auto_24701 ) ) ( not ( = ?auto_24687 ?auto_24694 ) ) ( not ( = ?auto_24687 ?auto_24703 ) ) ( not ( = ?auto_24688 ?auto_24706 ) ) ( not ( = ?auto_24688 ?auto_24696 ) ) ( not ( = ?auto_24688 ?auto_24701 ) ) ( not ( = ?auto_24688 ?auto_24694 ) ) ( not ( = ?auto_24688 ?auto_24703 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_24681 ?auto_24682 ?auto_24683 ?auto_24684 ?auto_24685 ?auto_24686 )
      ( MAKE-1CRATE ?auto_24686 ?auto_24687 )
      ( MAKE-6CRATE-VERIFY ?auto_24681 ?auto_24682 ?auto_24683 ?auto_24684 ?auto_24685 ?auto_24686 ?auto_24687 ) )
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
      ?auto_24737 - HOIST
      ?auto_24736 - PLACE
      ?auto_24738 - PLACE
      ?auto_24734 - HOIST
      ?auto_24733 - SURFACE
      ?auto_24745 - PLACE
      ?auto_24751 - HOIST
      ?auto_24753 - SURFACE
      ?auto_24747 - PLACE
      ?auto_24740 - HOIST
      ?auto_24741 - SURFACE
      ?auto_24739 - PLACE
      ?auto_24743 - HOIST
      ?auto_24754 - SURFACE
      ?auto_24744 - SURFACE
      ?auto_24746 - PLACE
      ?auto_24750 - HOIST
      ?auto_24748 - SURFACE
      ?auto_24749 - PLACE
      ?auto_24742 - HOIST
      ?auto_24752 - SURFACE
      ?auto_24735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24737 ?auto_24736 ) ( IS-CRATE ?auto_24732 ) ( not ( = ?auto_24738 ?auto_24736 ) ) ( HOIST-AT ?auto_24734 ?auto_24738 ) ( AVAILABLE ?auto_24734 ) ( SURFACE-AT ?auto_24732 ?auto_24738 ) ( ON ?auto_24732 ?auto_24733 ) ( CLEAR ?auto_24732 ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24733 ) ) ( not ( = ?auto_24737 ?auto_24734 ) ) ( IS-CRATE ?auto_24731 ) ( not ( = ?auto_24745 ?auto_24736 ) ) ( HOIST-AT ?auto_24751 ?auto_24745 ) ( SURFACE-AT ?auto_24731 ?auto_24745 ) ( ON ?auto_24731 ?auto_24753 ) ( CLEAR ?auto_24731 ) ( not ( = ?auto_24730 ?auto_24731 ) ) ( not ( = ?auto_24730 ?auto_24753 ) ) ( not ( = ?auto_24731 ?auto_24753 ) ) ( not ( = ?auto_24737 ?auto_24751 ) ) ( IS-CRATE ?auto_24730 ) ( not ( = ?auto_24747 ?auto_24736 ) ) ( HOIST-AT ?auto_24740 ?auto_24747 ) ( AVAILABLE ?auto_24740 ) ( SURFACE-AT ?auto_24730 ?auto_24747 ) ( ON ?auto_24730 ?auto_24741 ) ( CLEAR ?auto_24730 ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24741 ) ) ( not ( = ?auto_24730 ?auto_24741 ) ) ( not ( = ?auto_24737 ?auto_24740 ) ) ( IS-CRATE ?auto_24729 ) ( not ( = ?auto_24739 ?auto_24736 ) ) ( HOIST-AT ?auto_24743 ?auto_24739 ) ( AVAILABLE ?auto_24743 ) ( SURFACE-AT ?auto_24729 ?auto_24739 ) ( ON ?auto_24729 ?auto_24754 ) ( CLEAR ?auto_24729 ) ( not ( = ?auto_24728 ?auto_24729 ) ) ( not ( = ?auto_24728 ?auto_24754 ) ) ( not ( = ?auto_24729 ?auto_24754 ) ) ( not ( = ?auto_24737 ?auto_24743 ) ) ( IS-CRATE ?auto_24728 ) ( AVAILABLE ?auto_24751 ) ( SURFACE-AT ?auto_24728 ?auto_24745 ) ( ON ?auto_24728 ?auto_24744 ) ( CLEAR ?auto_24728 ) ( not ( = ?auto_24727 ?auto_24728 ) ) ( not ( = ?auto_24727 ?auto_24744 ) ) ( not ( = ?auto_24728 ?auto_24744 ) ) ( IS-CRATE ?auto_24727 ) ( not ( = ?auto_24746 ?auto_24736 ) ) ( HOIST-AT ?auto_24750 ?auto_24746 ) ( AVAILABLE ?auto_24750 ) ( SURFACE-AT ?auto_24727 ?auto_24746 ) ( ON ?auto_24727 ?auto_24748 ) ( CLEAR ?auto_24727 ) ( not ( = ?auto_24726 ?auto_24727 ) ) ( not ( = ?auto_24726 ?auto_24748 ) ) ( not ( = ?auto_24727 ?auto_24748 ) ) ( not ( = ?auto_24737 ?auto_24750 ) ) ( SURFACE-AT ?auto_24725 ?auto_24736 ) ( CLEAR ?auto_24725 ) ( IS-CRATE ?auto_24726 ) ( AVAILABLE ?auto_24737 ) ( not ( = ?auto_24749 ?auto_24736 ) ) ( HOIST-AT ?auto_24742 ?auto_24749 ) ( AVAILABLE ?auto_24742 ) ( SURFACE-AT ?auto_24726 ?auto_24749 ) ( ON ?auto_24726 ?auto_24752 ) ( CLEAR ?auto_24726 ) ( TRUCK-AT ?auto_24735 ?auto_24736 ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24752 ) ) ( not ( = ?auto_24726 ?auto_24752 ) ) ( not ( = ?auto_24737 ?auto_24742 ) ) ( not ( = ?auto_24725 ?auto_24727 ) ) ( not ( = ?auto_24725 ?auto_24748 ) ) ( not ( = ?auto_24727 ?auto_24752 ) ) ( not ( = ?auto_24746 ?auto_24749 ) ) ( not ( = ?auto_24750 ?auto_24742 ) ) ( not ( = ?auto_24748 ?auto_24752 ) ) ( not ( = ?auto_24725 ?auto_24728 ) ) ( not ( = ?auto_24725 ?auto_24744 ) ) ( not ( = ?auto_24726 ?auto_24728 ) ) ( not ( = ?auto_24726 ?auto_24744 ) ) ( not ( = ?auto_24728 ?auto_24748 ) ) ( not ( = ?auto_24728 ?auto_24752 ) ) ( not ( = ?auto_24745 ?auto_24746 ) ) ( not ( = ?auto_24745 ?auto_24749 ) ) ( not ( = ?auto_24751 ?auto_24750 ) ) ( not ( = ?auto_24751 ?auto_24742 ) ) ( not ( = ?auto_24744 ?auto_24748 ) ) ( not ( = ?auto_24744 ?auto_24752 ) ) ( not ( = ?auto_24725 ?auto_24729 ) ) ( not ( = ?auto_24725 ?auto_24754 ) ) ( not ( = ?auto_24726 ?auto_24729 ) ) ( not ( = ?auto_24726 ?auto_24754 ) ) ( not ( = ?auto_24727 ?auto_24729 ) ) ( not ( = ?auto_24727 ?auto_24754 ) ) ( not ( = ?auto_24729 ?auto_24744 ) ) ( not ( = ?auto_24729 ?auto_24748 ) ) ( not ( = ?auto_24729 ?auto_24752 ) ) ( not ( = ?auto_24739 ?auto_24745 ) ) ( not ( = ?auto_24739 ?auto_24746 ) ) ( not ( = ?auto_24739 ?auto_24749 ) ) ( not ( = ?auto_24743 ?auto_24751 ) ) ( not ( = ?auto_24743 ?auto_24750 ) ) ( not ( = ?auto_24743 ?auto_24742 ) ) ( not ( = ?auto_24754 ?auto_24744 ) ) ( not ( = ?auto_24754 ?auto_24748 ) ) ( not ( = ?auto_24754 ?auto_24752 ) ) ( not ( = ?auto_24725 ?auto_24730 ) ) ( not ( = ?auto_24725 ?auto_24741 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24726 ?auto_24741 ) ) ( not ( = ?auto_24727 ?auto_24730 ) ) ( not ( = ?auto_24727 ?auto_24741 ) ) ( not ( = ?auto_24728 ?auto_24730 ) ) ( not ( = ?auto_24728 ?auto_24741 ) ) ( not ( = ?auto_24730 ?auto_24754 ) ) ( not ( = ?auto_24730 ?auto_24744 ) ) ( not ( = ?auto_24730 ?auto_24748 ) ) ( not ( = ?auto_24730 ?auto_24752 ) ) ( not ( = ?auto_24747 ?auto_24739 ) ) ( not ( = ?auto_24747 ?auto_24745 ) ) ( not ( = ?auto_24747 ?auto_24746 ) ) ( not ( = ?auto_24747 ?auto_24749 ) ) ( not ( = ?auto_24740 ?auto_24743 ) ) ( not ( = ?auto_24740 ?auto_24751 ) ) ( not ( = ?auto_24740 ?auto_24750 ) ) ( not ( = ?auto_24740 ?auto_24742 ) ) ( not ( = ?auto_24741 ?auto_24754 ) ) ( not ( = ?auto_24741 ?auto_24744 ) ) ( not ( = ?auto_24741 ?auto_24748 ) ) ( not ( = ?auto_24741 ?auto_24752 ) ) ( not ( = ?auto_24725 ?auto_24731 ) ) ( not ( = ?auto_24725 ?auto_24753 ) ) ( not ( = ?auto_24726 ?auto_24731 ) ) ( not ( = ?auto_24726 ?auto_24753 ) ) ( not ( = ?auto_24727 ?auto_24731 ) ) ( not ( = ?auto_24727 ?auto_24753 ) ) ( not ( = ?auto_24728 ?auto_24731 ) ) ( not ( = ?auto_24728 ?auto_24753 ) ) ( not ( = ?auto_24729 ?auto_24731 ) ) ( not ( = ?auto_24729 ?auto_24753 ) ) ( not ( = ?auto_24731 ?auto_24741 ) ) ( not ( = ?auto_24731 ?auto_24754 ) ) ( not ( = ?auto_24731 ?auto_24744 ) ) ( not ( = ?auto_24731 ?auto_24748 ) ) ( not ( = ?auto_24731 ?auto_24752 ) ) ( not ( = ?auto_24753 ?auto_24741 ) ) ( not ( = ?auto_24753 ?auto_24754 ) ) ( not ( = ?auto_24753 ?auto_24744 ) ) ( not ( = ?auto_24753 ?auto_24748 ) ) ( not ( = ?auto_24753 ?auto_24752 ) ) ( not ( = ?auto_24725 ?auto_24732 ) ) ( not ( = ?auto_24725 ?auto_24733 ) ) ( not ( = ?auto_24726 ?auto_24732 ) ) ( not ( = ?auto_24726 ?auto_24733 ) ) ( not ( = ?auto_24727 ?auto_24732 ) ) ( not ( = ?auto_24727 ?auto_24733 ) ) ( not ( = ?auto_24728 ?auto_24732 ) ) ( not ( = ?auto_24728 ?auto_24733 ) ) ( not ( = ?auto_24729 ?auto_24732 ) ) ( not ( = ?auto_24729 ?auto_24733 ) ) ( not ( = ?auto_24730 ?auto_24732 ) ) ( not ( = ?auto_24730 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24753 ) ) ( not ( = ?auto_24732 ?auto_24741 ) ) ( not ( = ?auto_24732 ?auto_24754 ) ) ( not ( = ?auto_24732 ?auto_24744 ) ) ( not ( = ?auto_24732 ?auto_24748 ) ) ( not ( = ?auto_24732 ?auto_24752 ) ) ( not ( = ?auto_24738 ?auto_24745 ) ) ( not ( = ?auto_24738 ?auto_24747 ) ) ( not ( = ?auto_24738 ?auto_24739 ) ) ( not ( = ?auto_24738 ?auto_24746 ) ) ( not ( = ?auto_24738 ?auto_24749 ) ) ( not ( = ?auto_24734 ?auto_24751 ) ) ( not ( = ?auto_24734 ?auto_24740 ) ) ( not ( = ?auto_24734 ?auto_24743 ) ) ( not ( = ?auto_24734 ?auto_24750 ) ) ( not ( = ?auto_24734 ?auto_24742 ) ) ( not ( = ?auto_24733 ?auto_24753 ) ) ( not ( = ?auto_24733 ?auto_24741 ) ) ( not ( = ?auto_24733 ?auto_24754 ) ) ( not ( = ?auto_24733 ?auto_24744 ) ) ( not ( = ?auto_24733 ?auto_24748 ) ) ( not ( = ?auto_24733 ?auto_24752 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_24725 ?auto_24726 ?auto_24727 ?auto_24728 ?auto_24729 ?auto_24730 ?auto_24731 )
      ( MAKE-1CRATE ?auto_24731 ?auto_24732 )
      ( MAKE-7CRATE-VERIFY ?auto_24725 ?auto_24726 ?auto_24727 ?auto_24728 ?auto_24729 ?auto_24730 ?auto_24731 ?auto_24732 ) )
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
      ?auto_24781 - SURFACE
      ?auto_24782 - SURFACE
    )
    :vars
    (
      ?auto_24783 - HOIST
      ?auto_24784 - PLACE
      ?auto_24786 - PLACE
      ?auto_24787 - HOIST
      ?auto_24788 - SURFACE
      ?auto_24790 - SURFACE
      ?auto_24795 - PLACE
      ?auto_24792 - HOIST
      ?auto_24789 - SURFACE
      ?auto_24803 - PLACE
      ?auto_24800 - HOIST
      ?auto_24801 - SURFACE
      ?auto_24805 - PLACE
      ?auto_24797 - HOIST
      ?auto_24799 - SURFACE
      ?auto_24793 - SURFACE
      ?auto_24798 - PLACE
      ?auto_24794 - HOIST
      ?auto_24791 - SURFACE
      ?auto_24804 - PLACE
      ?auto_24796 - HOIST
      ?auto_24802 - SURFACE
      ?auto_24785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24783 ?auto_24784 ) ( IS-CRATE ?auto_24782 ) ( not ( = ?auto_24786 ?auto_24784 ) ) ( HOIST-AT ?auto_24787 ?auto_24786 ) ( SURFACE-AT ?auto_24782 ?auto_24786 ) ( ON ?auto_24782 ?auto_24788 ) ( CLEAR ?auto_24782 ) ( not ( = ?auto_24781 ?auto_24782 ) ) ( not ( = ?auto_24781 ?auto_24788 ) ) ( not ( = ?auto_24782 ?auto_24788 ) ) ( not ( = ?auto_24783 ?auto_24787 ) ) ( IS-CRATE ?auto_24781 ) ( AVAILABLE ?auto_24787 ) ( SURFACE-AT ?auto_24781 ?auto_24786 ) ( ON ?auto_24781 ?auto_24790 ) ( CLEAR ?auto_24781 ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24790 ) ) ( not ( = ?auto_24781 ?auto_24790 ) ) ( IS-CRATE ?auto_24780 ) ( not ( = ?auto_24795 ?auto_24784 ) ) ( HOIST-AT ?auto_24792 ?auto_24795 ) ( SURFACE-AT ?auto_24780 ?auto_24795 ) ( ON ?auto_24780 ?auto_24789 ) ( CLEAR ?auto_24780 ) ( not ( = ?auto_24779 ?auto_24780 ) ) ( not ( = ?auto_24779 ?auto_24789 ) ) ( not ( = ?auto_24780 ?auto_24789 ) ) ( not ( = ?auto_24783 ?auto_24792 ) ) ( IS-CRATE ?auto_24779 ) ( not ( = ?auto_24803 ?auto_24784 ) ) ( HOIST-AT ?auto_24800 ?auto_24803 ) ( AVAILABLE ?auto_24800 ) ( SURFACE-AT ?auto_24779 ?auto_24803 ) ( ON ?auto_24779 ?auto_24801 ) ( CLEAR ?auto_24779 ) ( not ( = ?auto_24778 ?auto_24779 ) ) ( not ( = ?auto_24778 ?auto_24801 ) ) ( not ( = ?auto_24779 ?auto_24801 ) ) ( not ( = ?auto_24783 ?auto_24800 ) ) ( IS-CRATE ?auto_24778 ) ( not ( = ?auto_24805 ?auto_24784 ) ) ( HOIST-AT ?auto_24797 ?auto_24805 ) ( AVAILABLE ?auto_24797 ) ( SURFACE-AT ?auto_24778 ?auto_24805 ) ( ON ?auto_24778 ?auto_24799 ) ( CLEAR ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24778 ) ) ( not ( = ?auto_24777 ?auto_24799 ) ) ( not ( = ?auto_24778 ?auto_24799 ) ) ( not ( = ?auto_24783 ?auto_24797 ) ) ( IS-CRATE ?auto_24777 ) ( AVAILABLE ?auto_24792 ) ( SURFACE-AT ?auto_24777 ?auto_24795 ) ( ON ?auto_24777 ?auto_24793 ) ( CLEAR ?auto_24777 ) ( not ( = ?auto_24776 ?auto_24777 ) ) ( not ( = ?auto_24776 ?auto_24793 ) ) ( not ( = ?auto_24777 ?auto_24793 ) ) ( IS-CRATE ?auto_24776 ) ( not ( = ?auto_24798 ?auto_24784 ) ) ( HOIST-AT ?auto_24794 ?auto_24798 ) ( AVAILABLE ?auto_24794 ) ( SURFACE-AT ?auto_24776 ?auto_24798 ) ( ON ?auto_24776 ?auto_24791 ) ( CLEAR ?auto_24776 ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24791 ) ) ( not ( = ?auto_24776 ?auto_24791 ) ) ( not ( = ?auto_24783 ?auto_24794 ) ) ( SURFACE-AT ?auto_24774 ?auto_24784 ) ( CLEAR ?auto_24774 ) ( IS-CRATE ?auto_24775 ) ( AVAILABLE ?auto_24783 ) ( not ( = ?auto_24804 ?auto_24784 ) ) ( HOIST-AT ?auto_24796 ?auto_24804 ) ( AVAILABLE ?auto_24796 ) ( SURFACE-AT ?auto_24775 ?auto_24804 ) ( ON ?auto_24775 ?auto_24802 ) ( CLEAR ?auto_24775 ) ( TRUCK-AT ?auto_24785 ?auto_24784 ) ( not ( = ?auto_24774 ?auto_24775 ) ) ( not ( = ?auto_24774 ?auto_24802 ) ) ( not ( = ?auto_24775 ?auto_24802 ) ) ( not ( = ?auto_24783 ?auto_24796 ) ) ( not ( = ?auto_24774 ?auto_24776 ) ) ( not ( = ?auto_24774 ?auto_24791 ) ) ( not ( = ?auto_24776 ?auto_24802 ) ) ( not ( = ?auto_24798 ?auto_24804 ) ) ( not ( = ?auto_24794 ?auto_24796 ) ) ( not ( = ?auto_24791 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24777 ) ) ( not ( = ?auto_24774 ?auto_24793 ) ) ( not ( = ?auto_24775 ?auto_24777 ) ) ( not ( = ?auto_24775 ?auto_24793 ) ) ( not ( = ?auto_24777 ?auto_24791 ) ) ( not ( = ?auto_24777 ?auto_24802 ) ) ( not ( = ?auto_24795 ?auto_24798 ) ) ( not ( = ?auto_24795 ?auto_24804 ) ) ( not ( = ?auto_24792 ?auto_24794 ) ) ( not ( = ?auto_24792 ?auto_24796 ) ) ( not ( = ?auto_24793 ?auto_24791 ) ) ( not ( = ?auto_24793 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24778 ) ) ( not ( = ?auto_24774 ?auto_24799 ) ) ( not ( = ?auto_24775 ?auto_24778 ) ) ( not ( = ?auto_24775 ?auto_24799 ) ) ( not ( = ?auto_24776 ?auto_24778 ) ) ( not ( = ?auto_24776 ?auto_24799 ) ) ( not ( = ?auto_24778 ?auto_24793 ) ) ( not ( = ?auto_24778 ?auto_24791 ) ) ( not ( = ?auto_24778 ?auto_24802 ) ) ( not ( = ?auto_24805 ?auto_24795 ) ) ( not ( = ?auto_24805 ?auto_24798 ) ) ( not ( = ?auto_24805 ?auto_24804 ) ) ( not ( = ?auto_24797 ?auto_24792 ) ) ( not ( = ?auto_24797 ?auto_24794 ) ) ( not ( = ?auto_24797 ?auto_24796 ) ) ( not ( = ?auto_24799 ?auto_24793 ) ) ( not ( = ?auto_24799 ?auto_24791 ) ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24779 ) ) ( not ( = ?auto_24774 ?auto_24801 ) ) ( not ( = ?auto_24775 ?auto_24779 ) ) ( not ( = ?auto_24775 ?auto_24801 ) ) ( not ( = ?auto_24776 ?auto_24779 ) ) ( not ( = ?auto_24776 ?auto_24801 ) ) ( not ( = ?auto_24777 ?auto_24779 ) ) ( not ( = ?auto_24777 ?auto_24801 ) ) ( not ( = ?auto_24779 ?auto_24799 ) ) ( not ( = ?auto_24779 ?auto_24793 ) ) ( not ( = ?auto_24779 ?auto_24791 ) ) ( not ( = ?auto_24779 ?auto_24802 ) ) ( not ( = ?auto_24803 ?auto_24805 ) ) ( not ( = ?auto_24803 ?auto_24795 ) ) ( not ( = ?auto_24803 ?auto_24798 ) ) ( not ( = ?auto_24803 ?auto_24804 ) ) ( not ( = ?auto_24800 ?auto_24797 ) ) ( not ( = ?auto_24800 ?auto_24792 ) ) ( not ( = ?auto_24800 ?auto_24794 ) ) ( not ( = ?auto_24800 ?auto_24796 ) ) ( not ( = ?auto_24801 ?auto_24799 ) ) ( not ( = ?auto_24801 ?auto_24793 ) ) ( not ( = ?auto_24801 ?auto_24791 ) ) ( not ( = ?auto_24801 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24780 ) ) ( not ( = ?auto_24774 ?auto_24789 ) ) ( not ( = ?auto_24775 ?auto_24780 ) ) ( not ( = ?auto_24775 ?auto_24789 ) ) ( not ( = ?auto_24776 ?auto_24780 ) ) ( not ( = ?auto_24776 ?auto_24789 ) ) ( not ( = ?auto_24777 ?auto_24780 ) ) ( not ( = ?auto_24777 ?auto_24789 ) ) ( not ( = ?auto_24778 ?auto_24780 ) ) ( not ( = ?auto_24778 ?auto_24789 ) ) ( not ( = ?auto_24780 ?auto_24801 ) ) ( not ( = ?auto_24780 ?auto_24799 ) ) ( not ( = ?auto_24780 ?auto_24793 ) ) ( not ( = ?auto_24780 ?auto_24791 ) ) ( not ( = ?auto_24780 ?auto_24802 ) ) ( not ( = ?auto_24789 ?auto_24801 ) ) ( not ( = ?auto_24789 ?auto_24799 ) ) ( not ( = ?auto_24789 ?auto_24793 ) ) ( not ( = ?auto_24789 ?auto_24791 ) ) ( not ( = ?auto_24789 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24781 ) ) ( not ( = ?auto_24774 ?auto_24790 ) ) ( not ( = ?auto_24775 ?auto_24781 ) ) ( not ( = ?auto_24775 ?auto_24790 ) ) ( not ( = ?auto_24776 ?auto_24781 ) ) ( not ( = ?auto_24776 ?auto_24790 ) ) ( not ( = ?auto_24777 ?auto_24781 ) ) ( not ( = ?auto_24777 ?auto_24790 ) ) ( not ( = ?auto_24778 ?auto_24781 ) ) ( not ( = ?auto_24778 ?auto_24790 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24790 ) ) ( not ( = ?auto_24781 ?auto_24789 ) ) ( not ( = ?auto_24781 ?auto_24801 ) ) ( not ( = ?auto_24781 ?auto_24799 ) ) ( not ( = ?auto_24781 ?auto_24793 ) ) ( not ( = ?auto_24781 ?auto_24791 ) ) ( not ( = ?auto_24781 ?auto_24802 ) ) ( not ( = ?auto_24786 ?auto_24795 ) ) ( not ( = ?auto_24786 ?auto_24803 ) ) ( not ( = ?auto_24786 ?auto_24805 ) ) ( not ( = ?auto_24786 ?auto_24798 ) ) ( not ( = ?auto_24786 ?auto_24804 ) ) ( not ( = ?auto_24787 ?auto_24792 ) ) ( not ( = ?auto_24787 ?auto_24800 ) ) ( not ( = ?auto_24787 ?auto_24797 ) ) ( not ( = ?auto_24787 ?auto_24794 ) ) ( not ( = ?auto_24787 ?auto_24796 ) ) ( not ( = ?auto_24790 ?auto_24789 ) ) ( not ( = ?auto_24790 ?auto_24801 ) ) ( not ( = ?auto_24790 ?auto_24799 ) ) ( not ( = ?auto_24790 ?auto_24793 ) ) ( not ( = ?auto_24790 ?auto_24791 ) ) ( not ( = ?auto_24790 ?auto_24802 ) ) ( not ( = ?auto_24774 ?auto_24782 ) ) ( not ( = ?auto_24774 ?auto_24788 ) ) ( not ( = ?auto_24775 ?auto_24782 ) ) ( not ( = ?auto_24775 ?auto_24788 ) ) ( not ( = ?auto_24776 ?auto_24782 ) ) ( not ( = ?auto_24776 ?auto_24788 ) ) ( not ( = ?auto_24777 ?auto_24782 ) ) ( not ( = ?auto_24777 ?auto_24788 ) ) ( not ( = ?auto_24778 ?auto_24782 ) ) ( not ( = ?auto_24778 ?auto_24788 ) ) ( not ( = ?auto_24779 ?auto_24782 ) ) ( not ( = ?auto_24779 ?auto_24788 ) ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24788 ) ) ( not ( = ?auto_24782 ?auto_24790 ) ) ( not ( = ?auto_24782 ?auto_24789 ) ) ( not ( = ?auto_24782 ?auto_24801 ) ) ( not ( = ?auto_24782 ?auto_24799 ) ) ( not ( = ?auto_24782 ?auto_24793 ) ) ( not ( = ?auto_24782 ?auto_24791 ) ) ( not ( = ?auto_24782 ?auto_24802 ) ) ( not ( = ?auto_24788 ?auto_24790 ) ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( not ( = ?auto_24788 ?auto_24801 ) ) ( not ( = ?auto_24788 ?auto_24799 ) ) ( not ( = ?auto_24788 ?auto_24793 ) ) ( not ( = ?auto_24788 ?auto_24791 ) ) ( not ( = ?auto_24788 ?auto_24802 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_24774 ?auto_24775 ?auto_24776 ?auto_24777 ?auto_24778 ?auto_24779 ?auto_24780 ?auto_24781 )
      ( MAKE-1CRATE ?auto_24781 ?auto_24782 )
      ( MAKE-8CRATE-VERIFY ?auto_24774 ?auto_24775 ?auto_24776 ?auto_24777 ?auto_24778 ?auto_24779 ?auto_24780 ?auto_24781 ?auto_24782 ) )
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
      ?auto_24833 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24835 - SURFACE
    )
    :vars
    (
      ?auto_24841 - HOIST
      ?auto_24838 - PLACE
      ?auto_24839 - PLACE
      ?auto_24837 - HOIST
      ?auto_24836 - SURFACE
      ?auto_24847 - PLACE
      ?auto_24848 - HOIST
      ?auto_24858 - SURFACE
      ?auto_24843 - SURFACE
      ?auto_24854 - PLACE
      ?auto_24852 - HOIST
      ?auto_24846 - SURFACE
      ?auto_24859 - PLACE
      ?auto_24845 - HOIST
      ?auto_24853 - SURFACE
      ?auto_24850 - PLACE
      ?auto_24844 - HOIST
      ?auto_24849 - SURFACE
      ?auto_24856 - SURFACE
      ?auto_24855 - PLACE
      ?auto_24842 - HOIST
      ?auto_24851 - SURFACE
      ?auto_24857 - SURFACE
      ?auto_24840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24841 ?auto_24838 ) ( IS-CRATE ?auto_24835 ) ( not ( = ?auto_24839 ?auto_24838 ) ) ( HOIST-AT ?auto_24837 ?auto_24839 ) ( SURFACE-AT ?auto_24835 ?auto_24839 ) ( ON ?auto_24835 ?auto_24836 ) ( CLEAR ?auto_24835 ) ( not ( = ?auto_24834 ?auto_24835 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( not ( = ?auto_24841 ?auto_24837 ) ) ( IS-CRATE ?auto_24834 ) ( not ( = ?auto_24847 ?auto_24838 ) ) ( HOIST-AT ?auto_24848 ?auto_24847 ) ( SURFACE-AT ?auto_24834 ?auto_24847 ) ( ON ?auto_24834 ?auto_24858 ) ( CLEAR ?auto_24834 ) ( not ( = ?auto_24833 ?auto_24834 ) ) ( not ( = ?auto_24833 ?auto_24858 ) ) ( not ( = ?auto_24834 ?auto_24858 ) ) ( not ( = ?auto_24841 ?auto_24848 ) ) ( IS-CRATE ?auto_24833 ) ( AVAILABLE ?auto_24848 ) ( SURFACE-AT ?auto_24833 ?auto_24847 ) ( ON ?auto_24833 ?auto_24843 ) ( CLEAR ?auto_24833 ) ( not ( = ?auto_24832 ?auto_24833 ) ) ( not ( = ?auto_24832 ?auto_24843 ) ) ( not ( = ?auto_24833 ?auto_24843 ) ) ( IS-CRATE ?auto_24832 ) ( not ( = ?auto_24854 ?auto_24838 ) ) ( HOIST-AT ?auto_24852 ?auto_24854 ) ( SURFACE-AT ?auto_24832 ?auto_24854 ) ( ON ?auto_24832 ?auto_24846 ) ( CLEAR ?auto_24832 ) ( not ( = ?auto_24831 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24846 ) ) ( not ( = ?auto_24832 ?auto_24846 ) ) ( not ( = ?auto_24841 ?auto_24852 ) ) ( IS-CRATE ?auto_24831 ) ( not ( = ?auto_24859 ?auto_24838 ) ) ( HOIST-AT ?auto_24845 ?auto_24859 ) ( AVAILABLE ?auto_24845 ) ( SURFACE-AT ?auto_24831 ?auto_24859 ) ( ON ?auto_24831 ?auto_24853 ) ( CLEAR ?auto_24831 ) ( not ( = ?auto_24830 ?auto_24831 ) ) ( not ( = ?auto_24830 ?auto_24853 ) ) ( not ( = ?auto_24831 ?auto_24853 ) ) ( not ( = ?auto_24841 ?auto_24845 ) ) ( IS-CRATE ?auto_24830 ) ( not ( = ?auto_24850 ?auto_24838 ) ) ( HOIST-AT ?auto_24844 ?auto_24850 ) ( AVAILABLE ?auto_24844 ) ( SURFACE-AT ?auto_24830 ?auto_24850 ) ( ON ?auto_24830 ?auto_24849 ) ( CLEAR ?auto_24830 ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24829 ?auto_24849 ) ) ( not ( = ?auto_24830 ?auto_24849 ) ) ( not ( = ?auto_24841 ?auto_24844 ) ) ( IS-CRATE ?auto_24829 ) ( AVAILABLE ?auto_24852 ) ( SURFACE-AT ?auto_24829 ?auto_24854 ) ( ON ?auto_24829 ?auto_24856 ) ( CLEAR ?auto_24829 ) ( not ( = ?auto_24828 ?auto_24829 ) ) ( not ( = ?auto_24828 ?auto_24856 ) ) ( not ( = ?auto_24829 ?auto_24856 ) ) ( IS-CRATE ?auto_24828 ) ( not ( = ?auto_24855 ?auto_24838 ) ) ( HOIST-AT ?auto_24842 ?auto_24855 ) ( AVAILABLE ?auto_24842 ) ( SURFACE-AT ?auto_24828 ?auto_24855 ) ( ON ?auto_24828 ?auto_24851 ) ( CLEAR ?auto_24828 ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( not ( = ?auto_24827 ?auto_24851 ) ) ( not ( = ?auto_24828 ?auto_24851 ) ) ( not ( = ?auto_24841 ?auto_24842 ) ) ( SURFACE-AT ?auto_24826 ?auto_24838 ) ( CLEAR ?auto_24826 ) ( IS-CRATE ?auto_24827 ) ( AVAILABLE ?auto_24841 ) ( AVAILABLE ?auto_24837 ) ( SURFACE-AT ?auto_24827 ?auto_24839 ) ( ON ?auto_24827 ?auto_24857 ) ( CLEAR ?auto_24827 ) ( TRUCK-AT ?auto_24840 ?auto_24838 ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24857 ) ) ( not ( = ?auto_24827 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24828 ) ) ( not ( = ?auto_24826 ?auto_24851 ) ) ( not ( = ?auto_24828 ?auto_24857 ) ) ( not ( = ?auto_24855 ?auto_24839 ) ) ( not ( = ?auto_24842 ?auto_24837 ) ) ( not ( = ?auto_24851 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24829 ) ) ( not ( = ?auto_24826 ?auto_24856 ) ) ( not ( = ?auto_24827 ?auto_24829 ) ) ( not ( = ?auto_24827 ?auto_24856 ) ) ( not ( = ?auto_24829 ?auto_24851 ) ) ( not ( = ?auto_24829 ?auto_24857 ) ) ( not ( = ?auto_24854 ?auto_24855 ) ) ( not ( = ?auto_24854 ?auto_24839 ) ) ( not ( = ?auto_24852 ?auto_24842 ) ) ( not ( = ?auto_24852 ?auto_24837 ) ) ( not ( = ?auto_24856 ?auto_24851 ) ) ( not ( = ?auto_24856 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24830 ) ) ( not ( = ?auto_24826 ?auto_24849 ) ) ( not ( = ?auto_24827 ?auto_24830 ) ) ( not ( = ?auto_24827 ?auto_24849 ) ) ( not ( = ?auto_24828 ?auto_24830 ) ) ( not ( = ?auto_24828 ?auto_24849 ) ) ( not ( = ?auto_24830 ?auto_24856 ) ) ( not ( = ?auto_24830 ?auto_24851 ) ) ( not ( = ?auto_24830 ?auto_24857 ) ) ( not ( = ?auto_24850 ?auto_24854 ) ) ( not ( = ?auto_24850 ?auto_24855 ) ) ( not ( = ?auto_24850 ?auto_24839 ) ) ( not ( = ?auto_24844 ?auto_24852 ) ) ( not ( = ?auto_24844 ?auto_24842 ) ) ( not ( = ?auto_24844 ?auto_24837 ) ) ( not ( = ?auto_24849 ?auto_24856 ) ) ( not ( = ?auto_24849 ?auto_24851 ) ) ( not ( = ?auto_24849 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24831 ) ) ( not ( = ?auto_24826 ?auto_24853 ) ) ( not ( = ?auto_24827 ?auto_24831 ) ) ( not ( = ?auto_24827 ?auto_24853 ) ) ( not ( = ?auto_24828 ?auto_24831 ) ) ( not ( = ?auto_24828 ?auto_24853 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) ( not ( = ?auto_24829 ?auto_24853 ) ) ( not ( = ?auto_24831 ?auto_24849 ) ) ( not ( = ?auto_24831 ?auto_24856 ) ) ( not ( = ?auto_24831 ?auto_24851 ) ) ( not ( = ?auto_24831 ?auto_24857 ) ) ( not ( = ?auto_24859 ?auto_24850 ) ) ( not ( = ?auto_24859 ?auto_24854 ) ) ( not ( = ?auto_24859 ?auto_24855 ) ) ( not ( = ?auto_24859 ?auto_24839 ) ) ( not ( = ?auto_24845 ?auto_24844 ) ) ( not ( = ?auto_24845 ?auto_24852 ) ) ( not ( = ?auto_24845 ?auto_24842 ) ) ( not ( = ?auto_24845 ?auto_24837 ) ) ( not ( = ?auto_24853 ?auto_24849 ) ) ( not ( = ?auto_24853 ?auto_24856 ) ) ( not ( = ?auto_24853 ?auto_24851 ) ) ( not ( = ?auto_24853 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24832 ) ) ( not ( = ?auto_24826 ?auto_24846 ) ) ( not ( = ?auto_24827 ?auto_24832 ) ) ( not ( = ?auto_24827 ?auto_24846 ) ) ( not ( = ?auto_24828 ?auto_24832 ) ) ( not ( = ?auto_24828 ?auto_24846 ) ) ( not ( = ?auto_24829 ?auto_24832 ) ) ( not ( = ?auto_24829 ?auto_24846 ) ) ( not ( = ?auto_24830 ?auto_24832 ) ) ( not ( = ?auto_24830 ?auto_24846 ) ) ( not ( = ?auto_24832 ?auto_24853 ) ) ( not ( = ?auto_24832 ?auto_24849 ) ) ( not ( = ?auto_24832 ?auto_24856 ) ) ( not ( = ?auto_24832 ?auto_24851 ) ) ( not ( = ?auto_24832 ?auto_24857 ) ) ( not ( = ?auto_24846 ?auto_24853 ) ) ( not ( = ?auto_24846 ?auto_24849 ) ) ( not ( = ?auto_24846 ?auto_24856 ) ) ( not ( = ?auto_24846 ?auto_24851 ) ) ( not ( = ?auto_24846 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24833 ) ) ( not ( = ?auto_24826 ?auto_24843 ) ) ( not ( = ?auto_24827 ?auto_24833 ) ) ( not ( = ?auto_24827 ?auto_24843 ) ) ( not ( = ?auto_24828 ?auto_24833 ) ) ( not ( = ?auto_24828 ?auto_24843 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24843 ) ) ( not ( = ?auto_24830 ?auto_24833 ) ) ( not ( = ?auto_24830 ?auto_24843 ) ) ( not ( = ?auto_24831 ?auto_24833 ) ) ( not ( = ?auto_24831 ?auto_24843 ) ) ( not ( = ?auto_24833 ?auto_24846 ) ) ( not ( = ?auto_24833 ?auto_24853 ) ) ( not ( = ?auto_24833 ?auto_24849 ) ) ( not ( = ?auto_24833 ?auto_24856 ) ) ( not ( = ?auto_24833 ?auto_24851 ) ) ( not ( = ?auto_24833 ?auto_24857 ) ) ( not ( = ?auto_24847 ?auto_24854 ) ) ( not ( = ?auto_24847 ?auto_24859 ) ) ( not ( = ?auto_24847 ?auto_24850 ) ) ( not ( = ?auto_24847 ?auto_24855 ) ) ( not ( = ?auto_24847 ?auto_24839 ) ) ( not ( = ?auto_24848 ?auto_24852 ) ) ( not ( = ?auto_24848 ?auto_24845 ) ) ( not ( = ?auto_24848 ?auto_24844 ) ) ( not ( = ?auto_24848 ?auto_24842 ) ) ( not ( = ?auto_24848 ?auto_24837 ) ) ( not ( = ?auto_24843 ?auto_24846 ) ) ( not ( = ?auto_24843 ?auto_24853 ) ) ( not ( = ?auto_24843 ?auto_24849 ) ) ( not ( = ?auto_24843 ?auto_24856 ) ) ( not ( = ?auto_24843 ?auto_24851 ) ) ( not ( = ?auto_24843 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24834 ) ) ( not ( = ?auto_24826 ?auto_24858 ) ) ( not ( = ?auto_24827 ?auto_24834 ) ) ( not ( = ?auto_24827 ?auto_24858 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( not ( = ?auto_24828 ?auto_24858 ) ) ( not ( = ?auto_24829 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24858 ) ) ( not ( = ?auto_24830 ?auto_24834 ) ) ( not ( = ?auto_24830 ?auto_24858 ) ) ( not ( = ?auto_24831 ?auto_24834 ) ) ( not ( = ?auto_24831 ?auto_24858 ) ) ( not ( = ?auto_24832 ?auto_24834 ) ) ( not ( = ?auto_24832 ?auto_24858 ) ) ( not ( = ?auto_24834 ?auto_24843 ) ) ( not ( = ?auto_24834 ?auto_24846 ) ) ( not ( = ?auto_24834 ?auto_24853 ) ) ( not ( = ?auto_24834 ?auto_24849 ) ) ( not ( = ?auto_24834 ?auto_24856 ) ) ( not ( = ?auto_24834 ?auto_24851 ) ) ( not ( = ?auto_24834 ?auto_24857 ) ) ( not ( = ?auto_24858 ?auto_24843 ) ) ( not ( = ?auto_24858 ?auto_24846 ) ) ( not ( = ?auto_24858 ?auto_24853 ) ) ( not ( = ?auto_24858 ?auto_24849 ) ) ( not ( = ?auto_24858 ?auto_24856 ) ) ( not ( = ?auto_24858 ?auto_24851 ) ) ( not ( = ?auto_24858 ?auto_24857 ) ) ( not ( = ?auto_24826 ?auto_24835 ) ) ( not ( = ?auto_24826 ?auto_24836 ) ) ( not ( = ?auto_24827 ?auto_24835 ) ) ( not ( = ?auto_24827 ?auto_24836 ) ) ( not ( = ?auto_24828 ?auto_24835 ) ) ( not ( = ?auto_24828 ?auto_24836 ) ) ( not ( = ?auto_24829 ?auto_24835 ) ) ( not ( = ?auto_24829 ?auto_24836 ) ) ( not ( = ?auto_24830 ?auto_24835 ) ) ( not ( = ?auto_24830 ?auto_24836 ) ) ( not ( = ?auto_24831 ?auto_24835 ) ) ( not ( = ?auto_24831 ?auto_24836 ) ) ( not ( = ?auto_24832 ?auto_24835 ) ) ( not ( = ?auto_24832 ?auto_24836 ) ) ( not ( = ?auto_24833 ?auto_24835 ) ) ( not ( = ?auto_24833 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24858 ) ) ( not ( = ?auto_24835 ?auto_24843 ) ) ( not ( = ?auto_24835 ?auto_24846 ) ) ( not ( = ?auto_24835 ?auto_24853 ) ) ( not ( = ?auto_24835 ?auto_24849 ) ) ( not ( = ?auto_24835 ?auto_24856 ) ) ( not ( = ?auto_24835 ?auto_24851 ) ) ( not ( = ?auto_24835 ?auto_24857 ) ) ( not ( = ?auto_24836 ?auto_24858 ) ) ( not ( = ?auto_24836 ?auto_24843 ) ) ( not ( = ?auto_24836 ?auto_24846 ) ) ( not ( = ?auto_24836 ?auto_24853 ) ) ( not ( = ?auto_24836 ?auto_24849 ) ) ( not ( = ?auto_24836 ?auto_24856 ) ) ( not ( = ?auto_24836 ?auto_24851 ) ) ( not ( = ?auto_24836 ?auto_24857 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_24826 ?auto_24827 ?auto_24828 ?auto_24829 ?auto_24830 ?auto_24831 ?auto_24832 ?auto_24833 ?auto_24834 )
      ( MAKE-1CRATE ?auto_24834 ?auto_24835 )
      ( MAKE-9CRATE-VERIFY ?auto_24826 ?auto_24827 ?auto_24828 ?auto_24829 ?auto_24830 ?auto_24831 ?auto_24832 ?auto_24833 ?auto_24834 ?auto_24835 ) )
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
      ?auto_24888 - SURFACE
      ?auto_24889 - SURFACE
      ?auto_24890 - SURFACE
      ?auto_24891 - SURFACE
    )
    :vars
    (
      ?auto_24892 - HOIST
      ?auto_24897 - PLACE
      ?auto_24894 - PLACE
      ?auto_24896 - HOIST
      ?auto_24895 - SURFACE
      ?auto_24910 - PLACE
      ?auto_24911 - HOIST
      ?auto_24904 - SURFACE
      ?auto_24914 - PLACE
      ?auto_24918 - HOIST
      ?auto_24915 - SURFACE
      ?auto_24907 - SURFACE
      ?auto_24898 - PLACE
      ?auto_24901 - HOIST
      ?auto_24903 - SURFACE
      ?auto_24916 - PLACE
      ?auto_24905 - HOIST
      ?auto_24913 - SURFACE
      ?auto_24908 - PLACE
      ?auto_24902 - HOIST
      ?auto_24899 - SURFACE
      ?auto_24909 - SURFACE
      ?auto_24912 - PLACE
      ?auto_24906 - HOIST
      ?auto_24917 - SURFACE
      ?auto_24900 - SURFACE
      ?auto_24893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24892 ?auto_24897 ) ( IS-CRATE ?auto_24891 ) ( not ( = ?auto_24894 ?auto_24897 ) ) ( HOIST-AT ?auto_24896 ?auto_24894 ) ( AVAILABLE ?auto_24896 ) ( SURFACE-AT ?auto_24891 ?auto_24894 ) ( ON ?auto_24891 ?auto_24895 ) ( CLEAR ?auto_24891 ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( not ( = ?auto_24890 ?auto_24895 ) ) ( not ( = ?auto_24891 ?auto_24895 ) ) ( not ( = ?auto_24892 ?auto_24896 ) ) ( IS-CRATE ?auto_24890 ) ( not ( = ?auto_24910 ?auto_24897 ) ) ( HOIST-AT ?auto_24911 ?auto_24910 ) ( SURFACE-AT ?auto_24890 ?auto_24910 ) ( ON ?auto_24890 ?auto_24904 ) ( CLEAR ?auto_24890 ) ( not ( = ?auto_24889 ?auto_24890 ) ) ( not ( = ?auto_24889 ?auto_24904 ) ) ( not ( = ?auto_24890 ?auto_24904 ) ) ( not ( = ?auto_24892 ?auto_24911 ) ) ( IS-CRATE ?auto_24889 ) ( not ( = ?auto_24914 ?auto_24897 ) ) ( HOIST-AT ?auto_24918 ?auto_24914 ) ( SURFACE-AT ?auto_24889 ?auto_24914 ) ( ON ?auto_24889 ?auto_24915 ) ( CLEAR ?auto_24889 ) ( not ( = ?auto_24888 ?auto_24889 ) ) ( not ( = ?auto_24888 ?auto_24915 ) ) ( not ( = ?auto_24889 ?auto_24915 ) ) ( not ( = ?auto_24892 ?auto_24918 ) ) ( IS-CRATE ?auto_24888 ) ( AVAILABLE ?auto_24918 ) ( SURFACE-AT ?auto_24888 ?auto_24914 ) ( ON ?auto_24888 ?auto_24907 ) ( CLEAR ?auto_24888 ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24907 ) ) ( not ( = ?auto_24888 ?auto_24907 ) ) ( IS-CRATE ?auto_24887 ) ( not ( = ?auto_24898 ?auto_24897 ) ) ( HOIST-AT ?auto_24901 ?auto_24898 ) ( SURFACE-AT ?auto_24887 ?auto_24898 ) ( ON ?auto_24887 ?auto_24903 ) ( CLEAR ?auto_24887 ) ( not ( = ?auto_24886 ?auto_24887 ) ) ( not ( = ?auto_24886 ?auto_24903 ) ) ( not ( = ?auto_24887 ?auto_24903 ) ) ( not ( = ?auto_24892 ?auto_24901 ) ) ( IS-CRATE ?auto_24886 ) ( not ( = ?auto_24916 ?auto_24897 ) ) ( HOIST-AT ?auto_24905 ?auto_24916 ) ( AVAILABLE ?auto_24905 ) ( SURFACE-AT ?auto_24886 ?auto_24916 ) ( ON ?auto_24886 ?auto_24913 ) ( CLEAR ?auto_24886 ) ( not ( = ?auto_24885 ?auto_24886 ) ) ( not ( = ?auto_24885 ?auto_24913 ) ) ( not ( = ?auto_24886 ?auto_24913 ) ) ( not ( = ?auto_24892 ?auto_24905 ) ) ( IS-CRATE ?auto_24885 ) ( not ( = ?auto_24908 ?auto_24897 ) ) ( HOIST-AT ?auto_24902 ?auto_24908 ) ( AVAILABLE ?auto_24902 ) ( SURFACE-AT ?auto_24885 ?auto_24908 ) ( ON ?auto_24885 ?auto_24899 ) ( CLEAR ?auto_24885 ) ( not ( = ?auto_24884 ?auto_24885 ) ) ( not ( = ?auto_24884 ?auto_24899 ) ) ( not ( = ?auto_24885 ?auto_24899 ) ) ( not ( = ?auto_24892 ?auto_24902 ) ) ( IS-CRATE ?auto_24884 ) ( AVAILABLE ?auto_24901 ) ( SURFACE-AT ?auto_24884 ?auto_24898 ) ( ON ?auto_24884 ?auto_24909 ) ( CLEAR ?auto_24884 ) ( not ( = ?auto_24883 ?auto_24884 ) ) ( not ( = ?auto_24883 ?auto_24909 ) ) ( not ( = ?auto_24884 ?auto_24909 ) ) ( IS-CRATE ?auto_24883 ) ( not ( = ?auto_24912 ?auto_24897 ) ) ( HOIST-AT ?auto_24906 ?auto_24912 ) ( AVAILABLE ?auto_24906 ) ( SURFACE-AT ?auto_24883 ?auto_24912 ) ( ON ?auto_24883 ?auto_24917 ) ( CLEAR ?auto_24883 ) ( not ( = ?auto_24882 ?auto_24883 ) ) ( not ( = ?auto_24882 ?auto_24917 ) ) ( not ( = ?auto_24883 ?auto_24917 ) ) ( not ( = ?auto_24892 ?auto_24906 ) ) ( SURFACE-AT ?auto_24881 ?auto_24897 ) ( CLEAR ?auto_24881 ) ( IS-CRATE ?auto_24882 ) ( AVAILABLE ?auto_24892 ) ( AVAILABLE ?auto_24911 ) ( SURFACE-AT ?auto_24882 ?auto_24910 ) ( ON ?auto_24882 ?auto_24900 ) ( CLEAR ?auto_24882 ) ( TRUCK-AT ?auto_24893 ?auto_24897 ) ( not ( = ?auto_24881 ?auto_24882 ) ) ( not ( = ?auto_24881 ?auto_24900 ) ) ( not ( = ?auto_24882 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24883 ) ) ( not ( = ?auto_24881 ?auto_24917 ) ) ( not ( = ?auto_24883 ?auto_24900 ) ) ( not ( = ?auto_24912 ?auto_24910 ) ) ( not ( = ?auto_24906 ?auto_24911 ) ) ( not ( = ?auto_24917 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24884 ) ) ( not ( = ?auto_24881 ?auto_24909 ) ) ( not ( = ?auto_24882 ?auto_24884 ) ) ( not ( = ?auto_24882 ?auto_24909 ) ) ( not ( = ?auto_24884 ?auto_24917 ) ) ( not ( = ?auto_24884 ?auto_24900 ) ) ( not ( = ?auto_24898 ?auto_24912 ) ) ( not ( = ?auto_24898 ?auto_24910 ) ) ( not ( = ?auto_24901 ?auto_24906 ) ) ( not ( = ?auto_24901 ?auto_24911 ) ) ( not ( = ?auto_24909 ?auto_24917 ) ) ( not ( = ?auto_24909 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24885 ) ) ( not ( = ?auto_24881 ?auto_24899 ) ) ( not ( = ?auto_24882 ?auto_24885 ) ) ( not ( = ?auto_24882 ?auto_24899 ) ) ( not ( = ?auto_24883 ?auto_24885 ) ) ( not ( = ?auto_24883 ?auto_24899 ) ) ( not ( = ?auto_24885 ?auto_24909 ) ) ( not ( = ?auto_24885 ?auto_24917 ) ) ( not ( = ?auto_24885 ?auto_24900 ) ) ( not ( = ?auto_24908 ?auto_24898 ) ) ( not ( = ?auto_24908 ?auto_24912 ) ) ( not ( = ?auto_24908 ?auto_24910 ) ) ( not ( = ?auto_24902 ?auto_24901 ) ) ( not ( = ?auto_24902 ?auto_24906 ) ) ( not ( = ?auto_24902 ?auto_24911 ) ) ( not ( = ?auto_24899 ?auto_24909 ) ) ( not ( = ?auto_24899 ?auto_24917 ) ) ( not ( = ?auto_24899 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24886 ) ) ( not ( = ?auto_24881 ?auto_24913 ) ) ( not ( = ?auto_24882 ?auto_24886 ) ) ( not ( = ?auto_24882 ?auto_24913 ) ) ( not ( = ?auto_24883 ?auto_24886 ) ) ( not ( = ?auto_24883 ?auto_24913 ) ) ( not ( = ?auto_24884 ?auto_24886 ) ) ( not ( = ?auto_24884 ?auto_24913 ) ) ( not ( = ?auto_24886 ?auto_24899 ) ) ( not ( = ?auto_24886 ?auto_24909 ) ) ( not ( = ?auto_24886 ?auto_24917 ) ) ( not ( = ?auto_24886 ?auto_24900 ) ) ( not ( = ?auto_24916 ?auto_24908 ) ) ( not ( = ?auto_24916 ?auto_24898 ) ) ( not ( = ?auto_24916 ?auto_24912 ) ) ( not ( = ?auto_24916 ?auto_24910 ) ) ( not ( = ?auto_24905 ?auto_24902 ) ) ( not ( = ?auto_24905 ?auto_24901 ) ) ( not ( = ?auto_24905 ?auto_24906 ) ) ( not ( = ?auto_24905 ?auto_24911 ) ) ( not ( = ?auto_24913 ?auto_24899 ) ) ( not ( = ?auto_24913 ?auto_24909 ) ) ( not ( = ?auto_24913 ?auto_24917 ) ) ( not ( = ?auto_24913 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24887 ) ) ( not ( = ?auto_24881 ?auto_24903 ) ) ( not ( = ?auto_24882 ?auto_24887 ) ) ( not ( = ?auto_24882 ?auto_24903 ) ) ( not ( = ?auto_24883 ?auto_24887 ) ) ( not ( = ?auto_24883 ?auto_24903 ) ) ( not ( = ?auto_24884 ?auto_24887 ) ) ( not ( = ?auto_24884 ?auto_24903 ) ) ( not ( = ?auto_24885 ?auto_24887 ) ) ( not ( = ?auto_24885 ?auto_24903 ) ) ( not ( = ?auto_24887 ?auto_24913 ) ) ( not ( = ?auto_24887 ?auto_24899 ) ) ( not ( = ?auto_24887 ?auto_24909 ) ) ( not ( = ?auto_24887 ?auto_24917 ) ) ( not ( = ?auto_24887 ?auto_24900 ) ) ( not ( = ?auto_24903 ?auto_24913 ) ) ( not ( = ?auto_24903 ?auto_24899 ) ) ( not ( = ?auto_24903 ?auto_24909 ) ) ( not ( = ?auto_24903 ?auto_24917 ) ) ( not ( = ?auto_24903 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24888 ) ) ( not ( = ?auto_24881 ?auto_24907 ) ) ( not ( = ?auto_24882 ?auto_24888 ) ) ( not ( = ?auto_24882 ?auto_24907 ) ) ( not ( = ?auto_24883 ?auto_24888 ) ) ( not ( = ?auto_24883 ?auto_24907 ) ) ( not ( = ?auto_24884 ?auto_24888 ) ) ( not ( = ?auto_24884 ?auto_24907 ) ) ( not ( = ?auto_24885 ?auto_24888 ) ) ( not ( = ?auto_24885 ?auto_24907 ) ) ( not ( = ?auto_24886 ?auto_24888 ) ) ( not ( = ?auto_24886 ?auto_24907 ) ) ( not ( = ?auto_24888 ?auto_24903 ) ) ( not ( = ?auto_24888 ?auto_24913 ) ) ( not ( = ?auto_24888 ?auto_24899 ) ) ( not ( = ?auto_24888 ?auto_24909 ) ) ( not ( = ?auto_24888 ?auto_24917 ) ) ( not ( = ?auto_24888 ?auto_24900 ) ) ( not ( = ?auto_24914 ?auto_24898 ) ) ( not ( = ?auto_24914 ?auto_24916 ) ) ( not ( = ?auto_24914 ?auto_24908 ) ) ( not ( = ?auto_24914 ?auto_24912 ) ) ( not ( = ?auto_24914 ?auto_24910 ) ) ( not ( = ?auto_24918 ?auto_24901 ) ) ( not ( = ?auto_24918 ?auto_24905 ) ) ( not ( = ?auto_24918 ?auto_24902 ) ) ( not ( = ?auto_24918 ?auto_24906 ) ) ( not ( = ?auto_24918 ?auto_24911 ) ) ( not ( = ?auto_24907 ?auto_24903 ) ) ( not ( = ?auto_24907 ?auto_24913 ) ) ( not ( = ?auto_24907 ?auto_24899 ) ) ( not ( = ?auto_24907 ?auto_24909 ) ) ( not ( = ?auto_24907 ?auto_24917 ) ) ( not ( = ?auto_24907 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24889 ) ) ( not ( = ?auto_24881 ?auto_24915 ) ) ( not ( = ?auto_24882 ?auto_24889 ) ) ( not ( = ?auto_24882 ?auto_24915 ) ) ( not ( = ?auto_24883 ?auto_24889 ) ) ( not ( = ?auto_24883 ?auto_24915 ) ) ( not ( = ?auto_24884 ?auto_24889 ) ) ( not ( = ?auto_24884 ?auto_24915 ) ) ( not ( = ?auto_24885 ?auto_24889 ) ) ( not ( = ?auto_24885 ?auto_24915 ) ) ( not ( = ?auto_24886 ?auto_24889 ) ) ( not ( = ?auto_24886 ?auto_24915 ) ) ( not ( = ?auto_24887 ?auto_24889 ) ) ( not ( = ?auto_24887 ?auto_24915 ) ) ( not ( = ?auto_24889 ?auto_24907 ) ) ( not ( = ?auto_24889 ?auto_24903 ) ) ( not ( = ?auto_24889 ?auto_24913 ) ) ( not ( = ?auto_24889 ?auto_24899 ) ) ( not ( = ?auto_24889 ?auto_24909 ) ) ( not ( = ?auto_24889 ?auto_24917 ) ) ( not ( = ?auto_24889 ?auto_24900 ) ) ( not ( = ?auto_24915 ?auto_24907 ) ) ( not ( = ?auto_24915 ?auto_24903 ) ) ( not ( = ?auto_24915 ?auto_24913 ) ) ( not ( = ?auto_24915 ?auto_24899 ) ) ( not ( = ?auto_24915 ?auto_24909 ) ) ( not ( = ?auto_24915 ?auto_24917 ) ) ( not ( = ?auto_24915 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24890 ) ) ( not ( = ?auto_24881 ?auto_24904 ) ) ( not ( = ?auto_24882 ?auto_24890 ) ) ( not ( = ?auto_24882 ?auto_24904 ) ) ( not ( = ?auto_24883 ?auto_24890 ) ) ( not ( = ?auto_24883 ?auto_24904 ) ) ( not ( = ?auto_24884 ?auto_24890 ) ) ( not ( = ?auto_24884 ?auto_24904 ) ) ( not ( = ?auto_24885 ?auto_24890 ) ) ( not ( = ?auto_24885 ?auto_24904 ) ) ( not ( = ?auto_24886 ?auto_24890 ) ) ( not ( = ?auto_24886 ?auto_24904 ) ) ( not ( = ?auto_24887 ?auto_24890 ) ) ( not ( = ?auto_24887 ?auto_24904 ) ) ( not ( = ?auto_24888 ?auto_24890 ) ) ( not ( = ?auto_24888 ?auto_24904 ) ) ( not ( = ?auto_24890 ?auto_24915 ) ) ( not ( = ?auto_24890 ?auto_24907 ) ) ( not ( = ?auto_24890 ?auto_24903 ) ) ( not ( = ?auto_24890 ?auto_24913 ) ) ( not ( = ?auto_24890 ?auto_24899 ) ) ( not ( = ?auto_24890 ?auto_24909 ) ) ( not ( = ?auto_24890 ?auto_24917 ) ) ( not ( = ?auto_24890 ?auto_24900 ) ) ( not ( = ?auto_24904 ?auto_24915 ) ) ( not ( = ?auto_24904 ?auto_24907 ) ) ( not ( = ?auto_24904 ?auto_24903 ) ) ( not ( = ?auto_24904 ?auto_24913 ) ) ( not ( = ?auto_24904 ?auto_24899 ) ) ( not ( = ?auto_24904 ?auto_24909 ) ) ( not ( = ?auto_24904 ?auto_24917 ) ) ( not ( = ?auto_24904 ?auto_24900 ) ) ( not ( = ?auto_24881 ?auto_24891 ) ) ( not ( = ?auto_24881 ?auto_24895 ) ) ( not ( = ?auto_24882 ?auto_24891 ) ) ( not ( = ?auto_24882 ?auto_24895 ) ) ( not ( = ?auto_24883 ?auto_24891 ) ) ( not ( = ?auto_24883 ?auto_24895 ) ) ( not ( = ?auto_24884 ?auto_24891 ) ) ( not ( = ?auto_24884 ?auto_24895 ) ) ( not ( = ?auto_24885 ?auto_24891 ) ) ( not ( = ?auto_24885 ?auto_24895 ) ) ( not ( = ?auto_24886 ?auto_24891 ) ) ( not ( = ?auto_24886 ?auto_24895 ) ) ( not ( = ?auto_24887 ?auto_24891 ) ) ( not ( = ?auto_24887 ?auto_24895 ) ) ( not ( = ?auto_24888 ?auto_24891 ) ) ( not ( = ?auto_24888 ?auto_24895 ) ) ( not ( = ?auto_24889 ?auto_24891 ) ) ( not ( = ?auto_24889 ?auto_24895 ) ) ( not ( = ?auto_24891 ?auto_24904 ) ) ( not ( = ?auto_24891 ?auto_24915 ) ) ( not ( = ?auto_24891 ?auto_24907 ) ) ( not ( = ?auto_24891 ?auto_24903 ) ) ( not ( = ?auto_24891 ?auto_24913 ) ) ( not ( = ?auto_24891 ?auto_24899 ) ) ( not ( = ?auto_24891 ?auto_24909 ) ) ( not ( = ?auto_24891 ?auto_24917 ) ) ( not ( = ?auto_24891 ?auto_24900 ) ) ( not ( = ?auto_24894 ?auto_24910 ) ) ( not ( = ?auto_24894 ?auto_24914 ) ) ( not ( = ?auto_24894 ?auto_24898 ) ) ( not ( = ?auto_24894 ?auto_24916 ) ) ( not ( = ?auto_24894 ?auto_24908 ) ) ( not ( = ?auto_24894 ?auto_24912 ) ) ( not ( = ?auto_24896 ?auto_24911 ) ) ( not ( = ?auto_24896 ?auto_24918 ) ) ( not ( = ?auto_24896 ?auto_24901 ) ) ( not ( = ?auto_24896 ?auto_24905 ) ) ( not ( = ?auto_24896 ?auto_24902 ) ) ( not ( = ?auto_24896 ?auto_24906 ) ) ( not ( = ?auto_24895 ?auto_24904 ) ) ( not ( = ?auto_24895 ?auto_24915 ) ) ( not ( = ?auto_24895 ?auto_24907 ) ) ( not ( = ?auto_24895 ?auto_24903 ) ) ( not ( = ?auto_24895 ?auto_24913 ) ) ( not ( = ?auto_24895 ?auto_24899 ) ) ( not ( = ?auto_24895 ?auto_24909 ) ) ( not ( = ?auto_24895 ?auto_24917 ) ) ( not ( = ?auto_24895 ?auto_24900 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24881 ?auto_24882 ?auto_24883 ?auto_24884 ?auto_24885 ?auto_24886 ?auto_24887 ?auto_24888 ?auto_24889 ?auto_24890 )
      ( MAKE-1CRATE ?auto_24890 ?auto_24891 )
      ( MAKE-10CRATE-VERIFY ?auto_24881 ?auto_24882 ?auto_24883 ?auto_24884 ?auto_24885 ?auto_24886 ?auto_24887 ?auto_24888 ?auto_24889 ?auto_24890 ?auto_24891 ) )
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
      ?auto_24948 - SURFACE
      ?auto_24949 - SURFACE
      ?auto_24950 - SURFACE
      ?auto_24951 - SURFACE
      ?auto_24952 - SURFACE
    )
    :vars
    (
      ?auto_24957 - HOIST
      ?auto_24953 - PLACE
      ?auto_24955 - PLACE
      ?auto_24954 - HOIST
      ?auto_24958 - SURFACE
      ?auto_24978 - PLACE
      ?auto_24982 - HOIST
      ?auto_24965 - SURFACE
      ?auto_24961 - PLACE
      ?auto_24962 - HOIST
      ?auto_24960 - SURFACE
      ?auto_24975 - PLACE
      ?auto_24967 - HOIST
      ?auto_24977 - SURFACE
      ?auto_24972 - SURFACE
      ?auto_24969 - PLACE
      ?auto_24971 - HOIST
      ?auto_24964 - SURFACE
      ?auto_24970 - PLACE
      ?auto_24974 - HOIST
      ?auto_24963 - SURFACE
      ?auto_24959 - PLACE
      ?auto_24966 - HOIST
      ?auto_24968 - SURFACE
      ?auto_24976 - SURFACE
      ?auto_24981 - PLACE
      ?auto_24979 - HOIST
      ?auto_24980 - SURFACE
      ?auto_24973 - SURFACE
      ?auto_24956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24957 ?auto_24953 ) ( IS-CRATE ?auto_24952 ) ( not ( = ?auto_24955 ?auto_24953 ) ) ( HOIST-AT ?auto_24954 ?auto_24955 ) ( AVAILABLE ?auto_24954 ) ( SURFACE-AT ?auto_24952 ?auto_24955 ) ( ON ?auto_24952 ?auto_24958 ) ( CLEAR ?auto_24952 ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( not ( = ?auto_24951 ?auto_24958 ) ) ( not ( = ?auto_24952 ?auto_24958 ) ) ( not ( = ?auto_24957 ?auto_24954 ) ) ( IS-CRATE ?auto_24951 ) ( not ( = ?auto_24978 ?auto_24953 ) ) ( HOIST-AT ?auto_24982 ?auto_24978 ) ( AVAILABLE ?auto_24982 ) ( SURFACE-AT ?auto_24951 ?auto_24978 ) ( ON ?auto_24951 ?auto_24965 ) ( CLEAR ?auto_24951 ) ( not ( = ?auto_24950 ?auto_24951 ) ) ( not ( = ?auto_24950 ?auto_24965 ) ) ( not ( = ?auto_24951 ?auto_24965 ) ) ( not ( = ?auto_24957 ?auto_24982 ) ) ( IS-CRATE ?auto_24950 ) ( not ( = ?auto_24961 ?auto_24953 ) ) ( HOIST-AT ?auto_24962 ?auto_24961 ) ( SURFACE-AT ?auto_24950 ?auto_24961 ) ( ON ?auto_24950 ?auto_24960 ) ( CLEAR ?auto_24950 ) ( not ( = ?auto_24949 ?auto_24950 ) ) ( not ( = ?auto_24949 ?auto_24960 ) ) ( not ( = ?auto_24950 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24962 ) ) ( IS-CRATE ?auto_24949 ) ( not ( = ?auto_24975 ?auto_24953 ) ) ( HOIST-AT ?auto_24967 ?auto_24975 ) ( SURFACE-AT ?auto_24949 ?auto_24975 ) ( ON ?auto_24949 ?auto_24977 ) ( CLEAR ?auto_24949 ) ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24948 ?auto_24977 ) ) ( not ( = ?auto_24949 ?auto_24977 ) ) ( not ( = ?auto_24957 ?auto_24967 ) ) ( IS-CRATE ?auto_24948 ) ( AVAILABLE ?auto_24967 ) ( SURFACE-AT ?auto_24948 ?auto_24975 ) ( ON ?auto_24948 ?auto_24972 ) ( CLEAR ?auto_24948 ) ( not ( = ?auto_24947 ?auto_24948 ) ) ( not ( = ?auto_24947 ?auto_24972 ) ) ( not ( = ?auto_24948 ?auto_24972 ) ) ( IS-CRATE ?auto_24947 ) ( not ( = ?auto_24969 ?auto_24953 ) ) ( HOIST-AT ?auto_24971 ?auto_24969 ) ( SURFACE-AT ?auto_24947 ?auto_24969 ) ( ON ?auto_24947 ?auto_24964 ) ( CLEAR ?auto_24947 ) ( not ( = ?auto_24946 ?auto_24947 ) ) ( not ( = ?auto_24946 ?auto_24964 ) ) ( not ( = ?auto_24947 ?auto_24964 ) ) ( not ( = ?auto_24957 ?auto_24971 ) ) ( IS-CRATE ?auto_24946 ) ( not ( = ?auto_24970 ?auto_24953 ) ) ( HOIST-AT ?auto_24974 ?auto_24970 ) ( AVAILABLE ?auto_24974 ) ( SURFACE-AT ?auto_24946 ?auto_24970 ) ( ON ?auto_24946 ?auto_24963 ) ( CLEAR ?auto_24946 ) ( not ( = ?auto_24945 ?auto_24946 ) ) ( not ( = ?auto_24945 ?auto_24963 ) ) ( not ( = ?auto_24946 ?auto_24963 ) ) ( not ( = ?auto_24957 ?auto_24974 ) ) ( IS-CRATE ?auto_24945 ) ( not ( = ?auto_24959 ?auto_24953 ) ) ( HOIST-AT ?auto_24966 ?auto_24959 ) ( AVAILABLE ?auto_24966 ) ( SURFACE-AT ?auto_24945 ?auto_24959 ) ( ON ?auto_24945 ?auto_24968 ) ( CLEAR ?auto_24945 ) ( not ( = ?auto_24944 ?auto_24945 ) ) ( not ( = ?auto_24944 ?auto_24968 ) ) ( not ( = ?auto_24945 ?auto_24968 ) ) ( not ( = ?auto_24957 ?auto_24966 ) ) ( IS-CRATE ?auto_24944 ) ( AVAILABLE ?auto_24971 ) ( SURFACE-AT ?auto_24944 ?auto_24969 ) ( ON ?auto_24944 ?auto_24976 ) ( CLEAR ?auto_24944 ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24976 ) ) ( not ( = ?auto_24944 ?auto_24976 ) ) ( IS-CRATE ?auto_24943 ) ( not ( = ?auto_24981 ?auto_24953 ) ) ( HOIST-AT ?auto_24979 ?auto_24981 ) ( AVAILABLE ?auto_24979 ) ( SURFACE-AT ?auto_24943 ?auto_24981 ) ( ON ?auto_24943 ?auto_24980 ) ( CLEAR ?auto_24943 ) ( not ( = ?auto_24942 ?auto_24943 ) ) ( not ( = ?auto_24942 ?auto_24980 ) ) ( not ( = ?auto_24943 ?auto_24980 ) ) ( not ( = ?auto_24957 ?auto_24979 ) ) ( SURFACE-AT ?auto_24941 ?auto_24953 ) ( CLEAR ?auto_24941 ) ( IS-CRATE ?auto_24942 ) ( AVAILABLE ?auto_24957 ) ( AVAILABLE ?auto_24962 ) ( SURFACE-AT ?auto_24942 ?auto_24961 ) ( ON ?auto_24942 ?auto_24973 ) ( CLEAR ?auto_24942 ) ( TRUCK-AT ?auto_24956 ?auto_24953 ) ( not ( = ?auto_24941 ?auto_24942 ) ) ( not ( = ?auto_24941 ?auto_24973 ) ) ( not ( = ?auto_24942 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24943 ) ) ( not ( = ?auto_24941 ?auto_24980 ) ) ( not ( = ?auto_24943 ?auto_24973 ) ) ( not ( = ?auto_24981 ?auto_24961 ) ) ( not ( = ?auto_24979 ?auto_24962 ) ) ( not ( = ?auto_24980 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24944 ) ) ( not ( = ?auto_24941 ?auto_24976 ) ) ( not ( = ?auto_24942 ?auto_24944 ) ) ( not ( = ?auto_24942 ?auto_24976 ) ) ( not ( = ?auto_24944 ?auto_24980 ) ) ( not ( = ?auto_24944 ?auto_24973 ) ) ( not ( = ?auto_24969 ?auto_24981 ) ) ( not ( = ?auto_24969 ?auto_24961 ) ) ( not ( = ?auto_24971 ?auto_24979 ) ) ( not ( = ?auto_24971 ?auto_24962 ) ) ( not ( = ?auto_24976 ?auto_24980 ) ) ( not ( = ?auto_24976 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24945 ) ) ( not ( = ?auto_24941 ?auto_24968 ) ) ( not ( = ?auto_24942 ?auto_24945 ) ) ( not ( = ?auto_24942 ?auto_24968 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24943 ?auto_24968 ) ) ( not ( = ?auto_24945 ?auto_24976 ) ) ( not ( = ?auto_24945 ?auto_24980 ) ) ( not ( = ?auto_24945 ?auto_24973 ) ) ( not ( = ?auto_24959 ?auto_24969 ) ) ( not ( = ?auto_24959 ?auto_24981 ) ) ( not ( = ?auto_24959 ?auto_24961 ) ) ( not ( = ?auto_24966 ?auto_24971 ) ) ( not ( = ?auto_24966 ?auto_24979 ) ) ( not ( = ?auto_24966 ?auto_24962 ) ) ( not ( = ?auto_24968 ?auto_24976 ) ) ( not ( = ?auto_24968 ?auto_24980 ) ) ( not ( = ?auto_24968 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24946 ) ) ( not ( = ?auto_24941 ?auto_24963 ) ) ( not ( = ?auto_24942 ?auto_24946 ) ) ( not ( = ?auto_24942 ?auto_24963 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24943 ?auto_24963 ) ) ( not ( = ?auto_24944 ?auto_24946 ) ) ( not ( = ?auto_24944 ?auto_24963 ) ) ( not ( = ?auto_24946 ?auto_24968 ) ) ( not ( = ?auto_24946 ?auto_24976 ) ) ( not ( = ?auto_24946 ?auto_24980 ) ) ( not ( = ?auto_24946 ?auto_24973 ) ) ( not ( = ?auto_24970 ?auto_24959 ) ) ( not ( = ?auto_24970 ?auto_24969 ) ) ( not ( = ?auto_24970 ?auto_24981 ) ) ( not ( = ?auto_24970 ?auto_24961 ) ) ( not ( = ?auto_24974 ?auto_24966 ) ) ( not ( = ?auto_24974 ?auto_24971 ) ) ( not ( = ?auto_24974 ?auto_24979 ) ) ( not ( = ?auto_24974 ?auto_24962 ) ) ( not ( = ?auto_24963 ?auto_24968 ) ) ( not ( = ?auto_24963 ?auto_24976 ) ) ( not ( = ?auto_24963 ?auto_24980 ) ) ( not ( = ?auto_24963 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24947 ) ) ( not ( = ?auto_24941 ?auto_24964 ) ) ( not ( = ?auto_24942 ?auto_24947 ) ) ( not ( = ?auto_24942 ?auto_24964 ) ) ( not ( = ?auto_24943 ?auto_24947 ) ) ( not ( = ?auto_24943 ?auto_24964 ) ) ( not ( = ?auto_24944 ?auto_24947 ) ) ( not ( = ?auto_24944 ?auto_24964 ) ) ( not ( = ?auto_24945 ?auto_24947 ) ) ( not ( = ?auto_24945 ?auto_24964 ) ) ( not ( = ?auto_24947 ?auto_24963 ) ) ( not ( = ?auto_24947 ?auto_24968 ) ) ( not ( = ?auto_24947 ?auto_24976 ) ) ( not ( = ?auto_24947 ?auto_24980 ) ) ( not ( = ?auto_24947 ?auto_24973 ) ) ( not ( = ?auto_24964 ?auto_24963 ) ) ( not ( = ?auto_24964 ?auto_24968 ) ) ( not ( = ?auto_24964 ?auto_24976 ) ) ( not ( = ?auto_24964 ?auto_24980 ) ) ( not ( = ?auto_24964 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24948 ) ) ( not ( = ?auto_24941 ?auto_24972 ) ) ( not ( = ?auto_24942 ?auto_24948 ) ) ( not ( = ?auto_24942 ?auto_24972 ) ) ( not ( = ?auto_24943 ?auto_24948 ) ) ( not ( = ?auto_24943 ?auto_24972 ) ) ( not ( = ?auto_24944 ?auto_24948 ) ) ( not ( = ?auto_24944 ?auto_24972 ) ) ( not ( = ?auto_24945 ?auto_24948 ) ) ( not ( = ?auto_24945 ?auto_24972 ) ) ( not ( = ?auto_24946 ?auto_24948 ) ) ( not ( = ?auto_24946 ?auto_24972 ) ) ( not ( = ?auto_24948 ?auto_24964 ) ) ( not ( = ?auto_24948 ?auto_24963 ) ) ( not ( = ?auto_24948 ?auto_24968 ) ) ( not ( = ?auto_24948 ?auto_24976 ) ) ( not ( = ?auto_24948 ?auto_24980 ) ) ( not ( = ?auto_24948 ?auto_24973 ) ) ( not ( = ?auto_24975 ?auto_24969 ) ) ( not ( = ?auto_24975 ?auto_24970 ) ) ( not ( = ?auto_24975 ?auto_24959 ) ) ( not ( = ?auto_24975 ?auto_24981 ) ) ( not ( = ?auto_24975 ?auto_24961 ) ) ( not ( = ?auto_24967 ?auto_24971 ) ) ( not ( = ?auto_24967 ?auto_24974 ) ) ( not ( = ?auto_24967 ?auto_24966 ) ) ( not ( = ?auto_24967 ?auto_24979 ) ) ( not ( = ?auto_24967 ?auto_24962 ) ) ( not ( = ?auto_24972 ?auto_24964 ) ) ( not ( = ?auto_24972 ?auto_24963 ) ) ( not ( = ?auto_24972 ?auto_24968 ) ) ( not ( = ?auto_24972 ?auto_24976 ) ) ( not ( = ?auto_24972 ?auto_24980 ) ) ( not ( = ?auto_24972 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24949 ) ) ( not ( = ?auto_24941 ?auto_24977 ) ) ( not ( = ?auto_24942 ?auto_24949 ) ) ( not ( = ?auto_24942 ?auto_24977 ) ) ( not ( = ?auto_24943 ?auto_24949 ) ) ( not ( = ?auto_24943 ?auto_24977 ) ) ( not ( = ?auto_24944 ?auto_24949 ) ) ( not ( = ?auto_24944 ?auto_24977 ) ) ( not ( = ?auto_24945 ?auto_24949 ) ) ( not ( = ?auto_24945 ?auto_24977 ) ) ( not ( = ?auto_24946 ?auto_24949 ) ) ( not ( = ?auto_24946 ?auto_24977 ) ) ( not ( = ?auto_24947 ?auto_24949 ) ) ( not ( = ?auto_24947 ?auto_24977 ) ) ( not ( = ?auto_24949 ?auto_24972 ) ) ( not ( = ?auto_24949 ?auto_24964 ) ) ( not ( = ?auto_24949 ?auto_24963 ) ) ( not ( = ?auto_24949 ?auto_24968 ) ) ( not ( = ?auto_24949 ?auto_24976 ) ) ( not ( = ?auto_24949 ?auto_24980 ) ) ( not ( = ?auto_24949 ?auto_24973 ) ) ( not ( = ?auto_24977 ?auto_24972 ) ) ( not ( = ?auto_24977 ?auto_24964 ) ) ( not ( = ?auto_24977 ?auto_24963 ) ) ( not ( = ?auto_24977 ?auto_24968 ) ) ( not ( = ?auto_24977 ?auto_24976 ) ) ( not ( = ?auto_24977 ?auto_24980 ) ) ( not ( = ?auto_24977 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24950 ) ) ( not ( = ?auto_24941 ?auto_24960 ) ) ( not ( = ?auto_24942 ?auto_24950 ) ) ( not ( = ?auto_24942 ?auto_24960 ) ) ( not ( = ?auto_24943 ?auto_24950 ) ) ( not ( = ?auto_24943 ?auto_24960 ) ) ( not ( = ?auto_24944 ?auto_24950 ) ) ( not ( = ?auto_24944 ?auto_24960 ) ) ( not ( = ?auto_24945 ?auto_24950 ) ) ( not ( = ?auto_24945 ?auto_24960 ) ) ( not ( = ?auto_24946 ?auto_24950 ) ) ( not ( = ?auto_24946 ?auto_24960 ) ) ( not ( = ?auto_24947 ?auto_24950 ) ) ( not ( = ?auto_24947 ?auto_24960 ) ) ( not ( = ?auto_24948 ?auto_24950 ) ) ( not ( = ?auto_24948 ?auto_24960 ) ) ( not ( = ?auto_24950 ?auto_24977 ) ) ( not ( = ?auto_24950 ?auto_24972 ) ) ( not ( = ?auto_24950 ?auto_24964 ) ) ( not ( = ?auto_24950 ?auto_24963 ) ) ( not ( = ?auto_24950 ?auto_24968 ) ) ( not ( = ?auto_24950 ?auto_24976 ) ) ( not ( = ?auto_24950 ?auto_24980 ) ) ( not ( = ?auto_24950 ?auto_24973 ) ) ( not ( = ?auto_24960 ?auto_24977 ) ) ( not ( = ?auto_24960 ?auto_24972 ) ) ( not ( = ?auto_24960 ?auto_24964 ) ) ( not ( = ?auto_24960 ?auto_24963 ) ) ( not ( = ?auto_24960 ?auto_24968 ) ) ( not ( = ?auto_24960 ?auto_24976 ) ) ( not ( = ?auto_24960 ?auto_24980 ) ) ( not ( = ?auto_24960 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24951 ) ) ( not ( = ?auto_24941 ?auto_24965 ) ) ( not ( = ?auto_24942 ?auto_24951 ) ) ( not ( = ?auto_24942 ?auto_24965 ) ) ( not ( = ?auto_24943 ?auto_24951 ) ) ( not ( = ?auto_24943 ?auto_24965 ) ) ( not ( = ?auto_24944 ?auto_24951 ) ) ( not ( = ?auto_24944 ?auto_24965 ) ) ( not ( = ?auto_24945 ?auto_24951 ) ) ( not ( = ?auto_24945 ?auto_24965 ) ) ( not ( = ?auto_24946 ?auto_24951 ) ) ( not ( = ?auto_24946 ?auto_24965 ) ) ( not ( = ?auto_24947 ?auto_24951 ) ) ( not ( = ?auto_24947 ?auto_24965 ) ) ( not ( = ?auto_24948 ?auto_24951 ) ) ( not ( = ?auto_24948 ?auto_24965 ) ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( not ( = ?auto_24949 ?auto_24965 ) ) ( not ( = ?auto_24951 ?auto_24960 ) ) ( not ( = ?auto_24951 ?auto_24977 ) ) ( not ( = ?auto_24951 ?auto_24972 ) ) ( not ( = ?auto_24951 ?auto_24964 ) ) ( not ( = ?auto_24951 ?auto_24963 ) ) ( not ( = ?auto_24951 ?auto_24968 ) ) ( not ( = ?auto_24951 ?auto_24976 ) ) ( not ( = ?auto_24951 ?auto_24980 ) ) ( not ( = ?auto_24951 ?auto_24973 ) ) ( not ( = ?auto_24978 ?auto_24961 ) ) ( not ( = ?auto_24978 ?auto_24975 ) ) ( not ( = ?auto_24978 ?auto_24969 ) ) ( not ( = ?auto_24978 ?auto_24970 ) ) ( not ( = ?auto_24978 ?auto_24959 ) ) ( not ( = ?auto_24978 ?auto_24981 ) ) ( not ( = ?auto_24982 ?auto_24962 ) ) ( not ( = ?auto_24982 ?auto_24967 ) ) ( not ( = ?auto_24982 ?auto_24971 ) ) ( not ( = ?auto_24982 ?auto_24974 ) ) ( not ( = ?auto_24982 ?auto_24966 ) ) ( not ( = ?auto_24982 ?auto_24979 ) ) ( not ( = ?auto_24965 ?auto_24960 ) ) ( not ( = ?auto_24965 ?auto_24977 ) ) ( not ( = ?auto_24965 ?auto_24972 ) ) ( not ( = ?auto_24965 ?auto_24964 ) ) ( not ( = ?auto_24965 ?auto_24963 ) ) ( not ( = ?auto_24965 ?auto_24968 ) ) ( not ( = ?auto_24965 ?auto_24976 ) ) ( not ( = ?auto_24965 ?auto_24980 ) ) ( not ( = ?auto_24965 ?auto_24973 ) ) ( not ( = ?auto_24941 ?auto_24952 ) ) ( not ( = ?auto_24941 ?auto_24958 ) ) ( not ( = ?auto_24942 ?auto_24952 ) ) ( not ( = ?auto_24942 ?auto_24958 ) ) ( not ( = ?auto_24943 ?auto_24952 ) ) ( not ( = ?auto_24943 ?auto_24958 ) ) ( not ( = ?auto_24944 ?auto_24952 ) ) ( not ( = ?auto_24944 ?auto_24958 ) ) ( not ( = ?auto_24945 ?auto_24952 ) ) ( not ( = ?auto_24945 ?auto_24958 ) ) ( not ( = ?auto_24946 ?auto_24952 ) ) ( not ( = ?auto_24946 ?auto_24958 ) ) ( not ( = ?auto_24947 ?auto_24952 ) ) ( not ( = ?auto_24947 ?auto_24958 ) ) ( not ( = ?auto_24948 ?auto_24952 ) ) ( not ( = ?auto_24948 ?auto_24958 ) ) ( not ( = ?auto_24949 ?auto_24952 ) ) ( not ( = ?auto_24949 ?auto_24958 ) ) ( not ( = ?auto_24950 ?auto_24952 ) ) ( not ( = ?auto_24950 ?auto_24958 ) ) ( not ( = ?auto_24952 ?auto_24965 ) ) ( not ( = ?auto_24952 ?auto_24960 ) ) ( not ( = ?auto_24952 ?auto_24977 ) ) ( not ( = ?auto_24952 ?auto_24972 ) ) ( not ( = ?auto_24952 ?auto_24964 ) ) ( not ( = ?auto_24952 ?auto_24963 ) ) ( not ( = ?auto_24952 ?auto_24968 ) ) ( not ( = ?auto_24952 ?auto_24976 ) ) ( not ( = ?auto_24952 ?auto_24980 ) ) ( not ( = ?auto_24952 ?auto_24973 ) ) ( not ( = ?auto_24955 ?auto_24978 ) ) ( not ( = ?auto_24955 ?auto_24961 ) ) ( not ( = ?auto_24955 ?auto_24975 ) ) ( not ( = ?auto_24955 ?auto_24969 ) ) ( not ( = ?auto_24955 ?auto_24970 ) ) ( not ( = ?auto_24955 ?auto_24959 ) ) ( not ( = ?auto_24955 ?auto_24981 ) ) ( not ( = ?auto_24954 ?auto_24982 ) ) ( not ( = ?auto_24954 ?auto_24962 ) ) ( not ( = ?auto_24954 ?auto_24967 ) ) ( not ( = ?auto_24954 ?auto_24971 ) ) ( not ( = ?auto_24954 ?auto_24974 ) ) ( not ( = ?auto_24954 ?auto_24966 ) ) ( not ( = ?auto_24954 ?auto_24979 ) ) ( not ( = ?auto_24958 ?auto_24965 ) ) ( not ( = ?auto_24958 ?auto_24960 ) ) ( not ( = ?auto_24958 ?auto_24977 ) ) ( not ( = ?auto_24958 ?auto_24972 ) ) ( not ( = ?auto_24958 ?auto_24964 ) ) ( not ( = ?auto_24958 ?auto_24963 ) ) ( not ( = ?auto_24958 ?auto_24968 ) ) ( not ( = ?auto_24958 ?auto_24976 ) ) ( not ( = ?auto_24958 ?auto_24980 ) ) ( not ( = ?auto_24958 ?auto_24973 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24941 ?auto_24942 ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ?auto_24947 ?auto_24948 ?auto_24949 ?auto_24950 ?auto_24951 )
      ( MAKE-1CRATE ?auto_24951 ?auto_24952 )
      ( MAKE-11CRATE-VERIFY ?auto_24941 ?auto_24942 ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ?auto_24947 ?auto_24948 ?auto_24949 ?auto_24950 ?auto_24951 ?auto_24952 ) )
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
      ?auto_25013 - SURFACE
      ?auto_25014 - SURFACE
      ?auto_25015 - SURFACE
      ?auto_25016 - SURFACE
      ?auto_25017 - SURFACE
      ?auto_25018 - SURFACE
    )
    :vars
    (
      ?auto_25023 - HOIST
      ?auto_25022 - PLACE
      ?auto_25020 - PLACE
      ?auto_25019 - HOIST
      ?auto_25024 - SURFACE
      ?auto_25044 - PLACE
      ?auto_25042 - HOIST
      ?auto_25025 - SURFACE
      ?auto_25045 - SURFACE
      ?auto_25040 - PLACE
      ?auto_25033 - HOIST
      ?auto_25049 - SURFACE
      ?auto_25046 - PLACE
      ?auto_25037 - HOIST
      ?auto_25027 - SURFACE
      ?auto_25032 - SURFACE
      ?auto_25047 - PLACE
      ?auto_25041 - HOIST
      ?auto_25036 - SURFACE
      ?auto_25043 - PLACE
      ?auto_25030 - HOIST
      ?auto_25028 - SURFACE
      ?auto_25039 - PLACE
      ?auto_25031 - HOIST
      ?auto_25048 - SURFACE
      ?auto_25035 - SURFACE
      ?auto_25038 - PLACE
      ?auto_25029 - HOIST
      ?auto_25026 - SURFACE
      ?auto_25034 - SURFACE
      ?auto_25021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25023 ?auto_25022 ) ( IS-CRATE ?auto_25018 ) ( not ( = ?auto_25020 ?auto_25022 ) ) ( HOIST-AT ?auto_25019 ?auto_25020 ) ( SURFACE-AT ?auto_25018 ?auto_25020 ) ( ON ?auto_25018 ?auto_25024 ) ( CLEAR ?auto_25018 ) ( not ( = ?auto_25017 ?auto_25018 ) ) ( not ( = ?auto_25017 ?auto_25024 ) ) ( not ( = ?auto_25018 ?auto_25024 ) ) ( not ( = ?auto_25023 ?auto_25019 ) ) ( IS-CRATE ?auto_25017 ) ( not ( = ?auto_25044 ?auto_25022 ) ) ( HOIST-AT ?auto_25042 ?auto_25044 ) ( AVAILABLE ?auto_25042 ) ( SURFACE-AT ?auto_25017 ?auto_25044 ) ( ON ?auto_25017 ?auto_25025 ) ( CLEAR ?auto_25017 ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( not ( = ?auto_25016 ?auto_25025 ) ) ( not ( = ?auto_25017 ?auto_25025 ) ) ( not ( = ?auto_25023 ?auto_25042 ) ) ( IS-CRATE ?auto_25016 ) ( AVAILABLE ?auto_25019 ) ( SURFACE-AT ?auto_25016 ?auto_25020 ) ( ON ?auto_25016 ?auto_25045 ) ( CLEAR ?auto_25016 ) ( not ( = ?auto_25015 ?auto_25016 ) ) ( not ( = ?auto_25015 ?auto_25045 ) ) ( not ( = ?auto_25016 ?auto_25045 ) ) ( IS-CRATE ?auto_25015 ) ( not ( = ?auto_25040 ?auto_25022 ) ) ( HOIST-AT ?auto_25033 ?auto_25040 ) ( SURFACE-AT ?auto_25015 ?auto_25040 ) ( ON ?auto_25015 ?auto_25049 ) ( CLEAR ?auto_25015 ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( not ( = ?auto_25014 ?auto_25049 ) ) ( not ( = ?auto_25015 ?auto_25049 ) ) ( not ( = ?auto_25023 ?auto_25033 ) ) ( IS-CRATE ?auto_25014 ) ( not ( = ?auto_25046 ?auto_25022 ) ) ( HOIST-AT ?auto_25037 ?auto_25046 ) ( SURFACE-AT ?auto_25014 ?auto_25046 ) ( ON ?auto_25014 ?auto_25027 ) ( CLEAR ?auto_25014 ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( not ( = ?auto_25013 ?auto_25027 ) ) ( not ( = ?auto_25014 ?auto_25027 ) ) ( not ( = ?auto_25023 ?auto_25037 ) ) ( IS-CRATE ?auto_25013 ) ( AVAILABLE ?auto_25037 ) ( SURFACE-AT ?auto_25013 ?auto_25046 ) ( ON ?auto_25013 ?auto_25032 ) ( CLEAR ?auto_25013 ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25032 ) ) ( not ( = ?auto_25013 ?auto_25032 ) ) ( IS-CRATE ?auto_25012 ) ( not ( = ?auto_25047 ?auto_25022 ) ) ( HOIST-AT ?auto_25041 ?auto_25047 ) ( SURFACE-AT ?auto_25012 ?auto_25047 ) ( ON ?auto_25012 ?auto_25036 ) ( CLEAR ?auto_25012 ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( not ( = ?auto_25011 ?auto_25036 ) ) ( not ( = ?auto_25012 ?auto_25036 ) ) ( not ( = ?auto_25023 ?auto_25041 ) ) ( IS-CRATE ?auto_25011 ) ( not ( = ?auto_25043 ?auto_25022 ) ) ( HOIST-AT ?auto_25030 ?auto_25043 ) ( AVAILABLE ?auto_25030 ) ( SURFACE-AT ?auto_25011 ?auto_25043 ) ( ON ?auto_25011 ?auto_25028 ) ( CLEAR ?auto_25011 ) ( not ( = ?auto_25010 ?auto_25011 ) ) ( not ( = ?auto_25010 ?auto_25028 ) ) ( not ( = ?auto_25011 ?auto_25028 ) ) ( not ( = ?auto_25023 ?auto_25030 ) ) ( IS-CRATE ?auto_25010 ) ( not ( = ?auto_25039 ?auto_25022 ) ) ( HOIST-AT ?auto_25031 ?auto_25039 ) ( AVAILABLE ?auto_25031 ) ( SURFACE-AT ?auto_25010 ?auto_25039 ) ( ON ?auto_25010 ?auto_25048 ) ( CLEAR ?auto_25010 ) ( not ( = ?auto_25009 ?auto_25010 ) ) ( not ( = ?auto_25009 ?auto_25048 ) ) ( not ( = ?auto_25010 ?auto_25048 ) ) ( not ( = ?auto_25023 ?auto_25031 ) ) ( IS-CRATE ?auto_25009 ) ( AVAILABLE ?auto_25041 ) ( SURFACE-AT ?auto_25009 ?auto_25047 ) ( ON ?auto_25009 ?auto_25035 ) ( CLEAR ?auto_25009 ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25035 ) ) ( not ( = ?auto_25009 ?auto_25035 ) ) ( IS-CRATE ?auto_25008 ) ( not ( = ?auto_25038 ?auto_25022 ) ) ( HOIST-AT ?auto_25029 ?auto_25038 ) ( AVAILABLE ?auto_25029 ) ( SURFACE-AT ?auto_25008 ?auto_25038 ) ( ON ?auto_25008 ?auto_25026 ) ( CLEAR ?auto_25008 ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25026 ) ) ( not ( = ?auto_25008 ?auto_25026 ) ) ( not ( = ?auto_25023 ?auto_25029 ) ) ( SURFACE-AT ?auto_25006 ?auto_25022 ) ( CLEAR ?auto_25006 ) ( IS-CRATE ?auto_25007 ) ( AVAILABLE ?auto_25023 ) ( AVAILABLE ?auto_25033 ) ( SURFACE-AT ?auto_25007 ?auto_25040 ) ( ON ?auto_25007 ?auto_25034 ) ( CLEAR ?auto_25007 ) ( TRUCK-AT ?auto_25021 ?auto_25022 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25034 ) ) ( not ( = ?auto_25007 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25006 ?auto_25026 ) ) ( not ( = ?auto_25008 ?auto_25034 ) ) ( not ( = ?auto_25038 ?auto_25040 ) ) ( not ( = ?auto_25029 ?auto_25033 ) ) ( not ( = ?auto_25026 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25035 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25035 ) ) ( not ( = ?auto_25009 ?auto_25026 ) ) ( not ( = ?auto_25009 ?auto_25034 ) ) ( not ( = ?auto_25047 ?auto_25038 ) ) ( not ( = ?auto_25047 ?auto_25040 ) ) ( not ( = ?auto_25041 ?auto_25029 ) ) ( not ( = ?auto_25041 ?auto_25033 ) ) ( not ( = ?auto_25035 ?auto_25026 ) ) ( not ( = ?auto_25035 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25010 ) ) ( not ( = ?auto_25006 ?auto_25048 ) ) ( not ( = ?auto_25007 ?auto_25010 ) ) ( not ( = ?auto_25007 ?auto_25048 ) ) ( not ( = ?auto_25008 ?auto_25010 ) ) ( not ( = ?auto_25008 ?auto_25048 ) ) ( not ( = ?auto_25010 ?auto_25035 ) ) ( not ( = ?auto_25010 ?auto_25026 ) ) ( not ( = ?auto_25010 ?auto_25034 ) ) ( not ( = ?auto_25039 ?auto_25047 ) ) ( not ( = ?auto_25039 ?auto_25038 ) ) ( not ( = ?auto_25039 ?auto_25040 ) ) ( not ( = ?auto_25031 ?auto_25041 ) ) ( not ( = ?auto_25031 ?auto_25029 ) ) ( not ( = ?auto_25031 ?auto_25033 ) ) ( not ( = ?auto_25048 ?auto_25035 ) ) ( not ( = ?auto_25048 ?auto_25026 ) ) ( not ( = ?auto_25048 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25011 ) ) ( not ( = ?auto_25006 ?auto_25028 ) ) ( not ( = ?auto_25007 ?auto_25011 ) ) ( not ( = ?auto_25007 ?auto_25028 ) ) ( not ( = ?auto_25008 ?auto_25011 ) ) ( not ( = ?auto_25008 ?auto_25028 ) ) ( not ( = ?auto_25009 ?auto_25011 ) ) ( not ( = ?auto_25009 ?auto_25028 ) ) ( not ( = ?auto_25011 ?auto_25048 ) ) ( not ( = ?auto_25011 ?auto_25035 ) ) ( not ( = ?auto_25011 ?auto_25026 ) ) ( not ( = ?auto_25011 ?auto_25034 ) ) ( not ( = ?auto_25043 ?auto_25039 ) ) ( not ( = ?auto_25043 ?auto_25047 ) ) ( not ( = ?auto_25043 ?auto_25038 ) ) ( not ( = ?auto_25043 ?auto_25040 ) ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25030 ?auto_25041 ) ) ( not ( = ?auto_25030 ?auto_25029 ) ) ( not ( = ?auto_25030 ?auto_25033 ) ) ( not ( = ?auto_25028 ?auto_25048 ) ) ( not ( = ?auto_25028 ?auto_25035 ) ) ( not ( = ?auto_25028 ?auto_25026 ) ) ( not ( = ?auto_25028 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25012 ) ) ( not ( = ?auto_25006 ?auto_25036 ) ) ( not ( = ?auto_25007 ?auto_25012 ) ) ( not ( = ?auto_25007 ?auto_25036 ) ) ( not ( = ?auto_25008 ?auto_25012 ) ) ( not ( = ?auto_25008 ?auto_25036 ) ) ( not ( = ?auto_25009 ?auto_25012 ) ) ( not ( = ?auto_25009 ?auto_25036 ) ) ( not ( = ?auto_25010 ?auto_25012 ) ) ( not ( = ?auto_25010 ?auto_25036 ) ) ( not ( = ?auto_25012 ?auto_25028 ) ) ( not ( = ?auto_25012 ?auto_25048 ) ) ( not ( = ?auto_25012 ?auto_25035 ) ) ( not ( = ?auto_25012 ?auto_25026 ) ) ( not ( = ?auto_25012 ?auto_25034 ) ) ( not ( = ?auto_25036 ?auto_25028 ) ) ( not ( = ?auto_25036 ?auto_25048 ) ) ( not ( = ?auto_25036 ?auto_25035 ) ) ( not ( = ?auto_25036 ?auto_25026 ) ) ( not ( = ?auto_25036 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25013 ) ) ( not ( = ?auto_25006 ?auto_25032 ) ) ( not ( = ?auto_25007 ?auto_25013 ) ) ( not ( = ?auto_25007 ?auto_25032 ) ) ( not ( = ?auto_25008 ?auto_25013 ) ) ( not ( = ?auto_25008 ?auto_25032 ) ) ( not ( = ?auto_25009 ?auto_25013 ) ) ( not ( = ?auto_25009 ?auto_25032 ) ) ( not ( = ?auto_25010 ?auto_25013 ) ) ( not ( = ?auto_25010 ?auto_25032 ) ) ( not ( = ?auto_25011 ?auto_25013 ) ) ( not ( = ?auto_25011 ?auto_25032 ) ) ( not ( = ?auto_25013 ?auto_25036 ) ) ( not ( = ?auto_25013 ?auto_25028 ) ) ( not ( = ?auto_25013 ?auto_25048 ) ) ( not ( = ?auto_25013 ?auto_25035 ) ) ( not ( = ?auto_25013 ?auto_25026 ) ) ( not ( = ?auto_25013 ?auto_25034 ) ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25043 ) ) ( not ( = ?auto_25046 ?auto_25039 ) ) ( not ( = ?auto_25046 ?auto_25038 ) ) ( not ( = ?auto_25046 ?auto_25040 ) ) ( not ( = ?auto_25037 ?auto_25041 ) ) ( not ( = ?auto_25037 ?auto_25030 ) ) ( not ( = ?auto_25037 ?auto_25031 ) ) ( not ( = ?auto_25037 ?auto_25029 ) ) ( not ( = ?auto_25037 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25036 ) ) ( not ( = ?auto_25032 ?auto_25028 ) ) ( not ( = ?auto_25032 ?auto_25048 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( not ( = ?auto_25032 ?auto_25026 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25014 ) ) ( not ( = ?auto_25006 ?auto_25027 ) ) ( not ( = ?auto_25007 ?auto_25014 ) ) ( not ( = ?auto_25007 ?auto_25027 ) ) ( not ( = ?auto_25008 ?auto_25014 ) ) ( not ( = ?auto_25008 ?auto_25027 ) ) ( not ( = ?auto_25009 ?auto_25014 ) ) ( not ( = ?auto_25009 ?auto_25027 ) ) ( not ( = ?auto_25010 ?auto_25014 ) ) ( not ( = ?auto_25010 ?auto_25027 ) ) ( not ( = ?auto_25011 ?auto_25014 ) ) ( not ( = ?auto_25011 ?auto_25027 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25027 ) ) ( not ( = ?auto_25014 ?auto_25032 ) ) ( not ( = ?auto_25014 ?auto_25036 ) ) ( not ( = ?auto_25014 ?auto_25028 ) ) ( not ( = ?auto_25014 ?auto_25048 ) ) ( not ( = ?auto_25014 ?auto_25035 ) ) ( not ( = ?auto_25014 ?auto_25026 ) ) ( not ( = ?auto_25014 ?auto_25034 ) ) ( not ( = ?auto_25027 ?auto_25032 ) ) ( not ( = ?auto_25027 ?auto_25036 ) ) ( not ( = ?auto_25027 ?auto_25028 ) ) ( not ( = ?auto_25027 ?auto_25048 ) ) ( not ( = ?auto_25027 ?auto_25035 ) ) ( not ( = ?auto_25027 ?auto_25026 ) ) ( not ( = ?auto_25027 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25015 ) ) ( not ( = ?auto_25006 ?auto_25049 ) ) ( not ( = ?auto_25007 ?auto_25015 ) ) ( not ( = ?auto_25007 ?auto_25049 ) ) ( not ( = ?auto_25008 ?auto_25015 ) ) ( not ( = ?auto_25008 ?auto_25049 ) ) ( not ( = ?auto_25009 ?auto_25015 ) ) ( not ( = ?auto_25009 ?auto_25049 ) ) ( not ( = ?auto_25010 ?auto_25015 ) ) ( not ( = ?auto_25010 ?auto_25049 ) ) ( not ( = ?auto_25011 ?auto_25015 ) ) ( not ( = ?auto_25011 ?auto_25049 ) ) ( not ( = ?auto_25012 ?auto_25015 ) ) ( not ( = ?auto_25012 ?auto_25049 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( not ( = ?auto_25013 ?auto_25049 ) ) ( not ( = ?auto_25015 ?auto_25027 ) ) ( not ( = ?auto_25015 ?auto_25032 ) ) ( not ( = ?auto_25015 ?auto_25036 ) ) ( not ( = ?auto_25015 ?auto_25028 ) ) ( not ( = ?auto_25015 ?auto_25048 ) ) ( not ( = ?auto_25015 ?auto_25035 ) ) ( not ( = ?auto_25015 ?auto_25026 ) ) ( not ( = ?auto_25015 ?auto_25034 ) ) ( not ( = ?auto_25049 ?auto_25027 ) ) ( not ( = ?auto_25049 ?auto_25032 ) ) ( not ( = ?auto_25049 ?auto_25036 ) ) ( not ( = ?auto_25049 ?auto_25028 ) ) ( not ( = ?auto_25049 ?auto_25048 ) ) ( not ( = ?auto_25049 ?auto_25035 ) ) ( not ( = ?auto_25049 ?auto_25026 ) ) ( not ( = ?auto_25049 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25016 ) ) ( not ( = ?auto_25006 ?auto_25045 ) ) ( not ( = ?auto_25007 ?auto_25016 ) ) ( not ( = ?auto_25007 ?auto_25045 ) ) ( not ( = ?auto_25008 ?auto_25016 ) ) ( not ( = ?auto_25008 ?auto_25045 ) ) ( not ( = ?auto_25009 ?auto_25016 ) ) ( not ( = ?auto_25009 ?auto_25045 ) ) ( not ( = ?auto_25010 ?auto_25016 ) ) ( not ( = ?auto_25010 ?auto_25045 ) ) ( not ( = ?auto_25011 ?auto_25016 ) ) ( not ( = ?auto_25011 ?auto_25045 ) ) ( not ( = ?auto_25012 ?auto_25016 ) ) ( not ( = ?auto_25012 ?auto_25045 ) ) ( not ( = ?auto_25013 ?auto_25016 ) ) ( not ( = ?auto_25013 ?auto_25045 ) ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( not ( = ?auto_25014 ?auto_25045 ) ) ( not ( = ?auto_25016 ?auto_25049 ) ) ( not ( = ?auto_25016 ?auto_25027 ) ) ( not ( = ?auto_25016 ?auto_25032 ) ) ( not ( = ?auto_25016 ?auto_25036 ) ) ( not ( = ?auto_25016 ?auto_25028 ) ) ( not ( = ?auto_25016 ?auto_25048 ) ) ( not ( = ?auto_25016 ?auto_25035 ) ) ( not ( = ?auto_25016 ?auto_25026 ) ) ( not ( = ?auto_25016 ?auto_25034 ) ) ( not ( = ?auto_25020 ?auto_25040 ) ) ( not ( = ?auto_25020 ?auto_25046 ) ) ( not ( = ?auto_25020 ?auto_25047 ) ) ( not ( = ?auto_25020 ?auto_25043 ) ) ( not ( = ?auto_25020 ?auto_25039 ) ) ( not ( = ?auto_25020 ?auto_25038 ) ) ( not ( = ?auto_25019 ?auto_25033 ) ) ( not ( = ?auto_25019 ?auto_25037 ) ) ( not ( = ?auto_25019 ?auto_25041 ) ) ( not ( = ?auto_25019 ?auto_25030 ) ) ( not ( = ?auto_25019 ?auto_25031 ) ) ( not ( = ?auto_25019 ?auto_25029 ) ) ( not ( = ?auto_25045 ?auto_25049 ) ) ( not ( = ?auto_25045 ?auto_25027 ) ) ( not ( = ?auto_25045 ?auto_25032 ) ) ( not ( = ?auto_25045 ?auto_25036 ) ) ( not ( = ?auto_25045 ?auto_25028 ) ) ( not ( = ?auto_25045 ?auto_25048 ) ) ( not ( = ?auto_25045 ?auto_25035 ) ) ( not ( = ?auto_25045 ?auto_25026 ) ) ( not ( = ?auto_25045 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25017 ) ) ( not ( = ?auto_25006 ?auto_25025 ) ) ( not ( = ?auto_25007 ?auto_25017 ) ) ( not ( = ?auto_25007 ?auto_25025 ) ) ( not ( = ?auto_25008 ?auto_25017 ) ) ( not ( = ?auto_25008 ?auto_25025 ) ) ( not ( = ?auto_25009 ?auto_25017 ) ) ( not ( = ?auto_25009 ?auto_25025 ) ) ( not ( = ?auto_25010 ?auto_25017 ) ) ( not ( = ?auto_25010 ?auto_25025 ) ) ( not ( = ?auto_25011 ?auto_25017 ) ) ( not ( = ?auto_25011 ?auto_25025 ) ) ( not ( = ?auto_25012 ?auto_25017 ) ) ( not ( = ?auto_25012 ?auto_25025 ) ) ( not ( = ?auto_25013 ?auto_25017 ) ) ( not ( = ?auto_25013 ?auto_25025 ) ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25014 ?auto_25025 ) ) ( not ( = ?auto_25015 ?auto_25017 ) ) ( not ( = ?auto_25015 ?auto_25025 ) ) ( not ( = ?auto_25017 ?auto_25045 ) ) ( not ( = ?auto_25017 ?auto_25049 ) ) ( not ( = ?auto_25017 ?auto_25027 ) ) ( not ( = ?auto_25017 ?auto_25032 ) ) ( not ( = ?auto_25017 ?auto_25036 ) ) ( not ( = ?auto_25017 ?auto_25028 ) ) ( not ( = ?auto_25017 ?auto_25048 ) ) ( not ( = ?auto_25017 ?auto_25035 ) ) ( not ( = ?auto_25017 ?auto_25026 ) ) ( not ( = ?auto_25017 ?auto_25034 ) ) ( not ( = ?auto_25044 ?auto_25020 ) ) ( not ( = ?auto_25044 ?auto_25040 ) ) ( not ( = ?auto_25044 ?auto_25046 ) ) ( not ( = ?auto_25044 ?auto_25047 ) ) ( not ( = ?auto_25044 ?auto_25043 ) ) ( not ( = ?auto_25044 ?auto_25039 ) ) ( not ( = ?auto_25044 ?auto_25038 ) ) ( not ( = ?auto_25042 ?auto_25019 ) ) ( not ( = ?auto_25042 ?auto_25033 ) ) ( not ( = ?auto_25042 ?auto_25037 ) ) ( not ( = ?auto_25042 ?auto_25041 ) ) ( not ( = ?auto_25042 ?auto_25030 ) ) ( not ( = ?auto_25042 ?auto_25031 ) ) ( not ( = ?auto_25042 ?auto_25029 ) ) ( not ( = ?auto_25025 ?auto_25045 ) ) ( not ( = ?auto_25025 ?auto_25049 ) ) ( not ( = ?auto_25025 ?auto_25027 ) ) ( not ( = ?auto_25025 ?auto_25032 ) ) ( not ( = ?auto_25025 ?auto_25036 ) ) ( not ( = ?auto_25025 ?auto_25028 ) ) ( not ( = ?auto_25025 ?auto_25048 ) ) ( not ( = ?auto_25025 ?auto_25035 ) ) ( not ( = ?auto_25025 ?auto_25026 ) ) ( not ( = ?auto_25025 ?auto_25034 ) ) ( not ( = ?auto_25006 ?auto_25018 ) ) ( not ( = ?auto_25006 ?auto_25024 ) ) ( not ( = ?auto_25007 ?auto_25018 ) ) ( not ( = ?auto_25007 ?auto_25024 ) ) ( not ( = ?auto_25008 ?auto_25018 ) ) ( not ( = ?auto_25008 ?auto_25024 ) ) ( not ( = ?auto_25009 ?auto_25018 ) ) ( not ( = ?auto_25009 ?auto_25024 ) ) ( not ( = ?auto_25010 ?auto_25018 ) ) ( not ( = ?auto_25010 ?auto_25024 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( not ( = ?auto_25011 ?auto_25024 ) ) ( not ( = ?auto_25012 ?auto_25018 ) ) ( not ( = ?auto_25012 ?auto_25024 ) ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25013 ?auto_25024 ) ) ( not ( = ?auto_25014 ?auto_25018 ) ) ( not ( = ?auto_25014 ?auto_25024 ) ) ( not ( = ?auto_25015 ?auto_25018 ) ) ( not ( = ?auto_25015 ?auto_25024 ) ) ( not ( = ?auto_25016 ?auto_25018 ) ) ( not ( = ?auto_25016 ?auto_25024 ) ) ( not ( = ?auto_25018 ?auto_25025 ) ) ( not ( = ?auto_25018 ?auto_25045 ) ) ( not ( = ?auto_25018 ?auto_25049 ) ) ( not ( = ?auto_25018 ?auto_25027 ) ) ( not ( = ?auto_25018 ?auto_25032 ) ) ( not ( = ?auto_25018 ?auto_25036 ) ) ( not ( = ?auto_25018 ?auto_25028 ) ) ( not ( = ?auto_25018 ?auto_25048 ) ) ( not ( = ?auto_25018 ?auto_25035 ) ) ( not ( = ?auto_25018 ?auto_25026 ) ) ( not ( = ?auto_25018 ?auto_25034 ) ) ( not ( = ?auto_25024 ?auto_25025 ) ) ( not ( = ?auto_25024 ?auto_25045 ) ) ( not ( = ?auto_25024 ?auto_25049 ) ) ( not ( = ?auto_25024 ?auto_25027 ) ) ( not ( = ?auto_25024 ?auto_25032 ) ) ( not ( = ?auto_25024 ?auto_25036 ) ) ( not ( = ?auto_25024 ?auto_25028 ) ) ( not ( = ?auto_25024 ?auto_25048 ) ) ( not ( = ?auto_25024 ?auto_25035 ) ) ( not ( = ?auto_25024 ?auto_25026 ) ) ( not ( = ?auto_25024 ?auto_25034 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25013 ?auto_25014 ?auto_25015 ?auto_25016 ?auto_25017 )
      ( MAKE-1CRATE ?auto_25017 ?auto_25018 )
      ( MAKE-12CRATE-VERIFY ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25013 ?auto_25014 ?auto_25015 ?auto_25016 ?auto_25017 ?auto_25018 ) )
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
      ?auto_25081 - SURFACE
      ?auto_25082 - SURFACE
      ?auto_25083 - SURFACE
      ?auto_25084 - SURFACE
      ?auto_25085 - SURFACE
      ?auto_25086 - SURFACE
      ?auto_25087 - SURFACE
    )
    :vars
    (
      ?auto_25088 - HOIST
      ?auto_25092 - PLACE
      ?auto_25089 - PLACE
      ?auto_25093 - HOIST
      ?auto_25091 - SURFACE
      ?auto_25118 - PLACE
      ?auto_25111 - HOIST
      ?auto_25104 - SURFACE
      ?auto_25098 - PLACE
      ?auto_25106 - HOIST
      ?auto_25102 - SURFACE
      ?auto_25112 - SURFACE
      ?auto_25097 - PLACE
      ?auto_25107 - HOIST
      ?auto_25105 - SURFACE
      ?auto_25117 - PLACE
      ?auto_25115 - HOIST
      ?auto_25094 - SURFACE
      ?auto_25113 - SURFACE
      ?auto_25099 - PLACE
      ?auto_25116 - HOIST
      ?auto_25108 - SURFACE
      ?auto_25096 - SURFACE
      ?auto_25100 - PLACE
      ?auto_25114 - HOIST
      ?auto_25119 - SURFACE
      ?auto_25103 - SURFACE
      ?auto_25110 - PLACE
      ?auto_25109 - HOIST
      ?auto_25101 - SURFACE
      ?auto_25095 - SURFACE
      ?auto_25090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25088 ?auto_25092 ) ( IS-CRATE ?auto_25087 ) ( not ( = ?auto_25089 ?auto_25092 ) ) ( HOIST-AT ?auto_25093 ?auto_25089 ) ( SURFACE-AT ?auto_25087 ?auto_25089 ) ( ON ?auto_25087 ?auto_25091 ) ( CLEAR ?auto_25087 ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25091 ) ) ( not ( = ?auto_25087 ?auto_25091 ) ) ( not ( = ?auto_25088 ?auto_25093 ) ) ( IS-CRATE ?auto_25086 ) ( not ( = ?auto_25118 ?auto_25092 ) ) ( HOIST-AT ?auto_25111 ?auto_25118 ) ( SURFACE-AT ?auto_25086 ?auto_25118 ) ( ON ?auto_25086 ?auto_25104 ) ( CLEAR ?auto_25086 ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25104 ) ) ( not ( = ?auto_25086 ?auto_25104 ) ) ( not ( = ?auto_25088 ?auto_25111 ) ) ( IS-CRATE ?auto_25085 ) ( not ( = ?auto_25098 ?auto_25092 ) ) ( HOIST-AT ?auto_25106 ?auto_25098 ) ( AVAILABLE ?auto_25106 ) ( SURFACE-AT ?auto_25085 ?auto_25098 ) ( ON ?auto_25085 ?auto_25102 ) ( CLEAR ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25102 ) ) ( not ( = ?auto_25085 ?auto_25102 ) ) ( not ( = ?auto_25088 ?auto_25106 ) ) ( IS-CRATE ?auto_25084 ) ( AVAILABLE ?auto_25111 ) ( SURFACE-AT ?auto_25084 ?auto_25118 ) ( ON ?auto_25084 ?auto_25112 ) ( CLEAR ?auto_25084 ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( not ( = ?auto_25083 ?auto_25112 ) ) ( not ( = ?auto_25084 ?auto_25112 ) ) ( IS-CRATE ?auto_25083 ) ( not ( = ?auto_25097 ?auto_25092 ) ) ( HOIST-AT ?auto_25107 ?auto_25097 ) ( SURFACE-AT ?auto_25083 ?auto_25097 ) ( ON ?auto_25083 ?auto_25105 ) ( CLEAR ?auto_25083 ) ( not ( = ?auto_25082 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25105 ) ) ( not ( = ?auto_25083 ?auto_25105 ) ) ( not ( = ?auto_25088 ?auto_25107 ) ) ( IS-CRATE ?auto_25082 ) ( not ( = ?auto_25117 ?auto_25092 ) ) ( HOIST-AT ?auto_25115 ?auto_25117 ) ( SURFACE-AT ?auto_25082 ?auto_25117 ) ( ON ?auto_25082 ?auto_25094 ) ( CLEAR ?auto_25082 ) ( not ( = ?auto_25081 ?auto_25082 ) ) ( not ( = ?auto_25081 ?auto_25094 ) ) ( not ( = ?auto_25082 ?auto_25094 ) ) ( not ( = ?auto_25088 ?auto_25115 ) ) ( IS-CRATE ?auto_25081 ) ( AVAILABLE ?auto_25115 ) ( SURFACE-AT ?auto_25081 ?auto_25117 ) ( ON ?auto_25081 ?auto_25113 ) ( CLEAR ?auto_25081 ) ( not ( = ?auto_25080 ?auto_25081 ) ) ( not ( = ?auto_25080 ?auto_25113 ) ) ( not ( = ?auto_25081 ?auto_25113 ) ) ( IS-CRATE ?auto_25080 ) ( not ( = ?auto_25099 ?auto_25092 ) ) ( HOIST-AT ?auto_25116 ?auto_25099 ) ( SURFACE-AT ?auto_25080 ?auto_25099 ) ( ON ?auto_25080 ?auto_25108 ) ( CLEAR ?auto_25080 ) ( not ( = ?auto_25079 ?auto_25080 ) ) ( not ( = ?auto_25079 ?auto_25108 ) ) ( not ( = ?auto_25080 ?auto_25108 ) ) ( not ( = ?auto_25088 ?auto_25116 ) ) ( IS-CRATE ?auto_25079 ) ( AVAILABLE ?auto_25093 ) ( SURFACE-AT ?auto_25079 ?auto_25089 ) ( ON ?auto_25079 ?auto_25096 ) ( CLEAR ?auto_25079 ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( not ( = ?auto_25078 ?auto_25096 ) ) ( not ( = ?auto_25079 ?auto_25096 ) ) ( IS-CRATE ?auto_25078 ) ( not ( = ?auto_25100 ?auto_25092 ) ) ( HOIST-AT ?auto_25114 ?auto_25100 ) ( AVAILABLE ?auto_25114 ) ( SURFACE-AT ?auto_25078 ?auto_25100 ) ( ON ?auto_25078 ?auto_25119 ) ( CLEAR ?auto_25078 ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25119 ) ) ( not ( = ?auto_25078 ?auto_25119 ) ) ( not ( = ?auto_25088 ?auto_25114 ) ) ( IS-CRATE ?auto_25077 ) ( AVAILABLE ?auto_25116 ) ( SURFACE-AT ?auto_25077 ?auto_25099 ) ( ON ?auto_25077 ?auto_25103 ) ( CLEAR ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25103 ) ) ( not ( = ?auto_25077 ?auto_25103 ) ) ( IS-CRATE ?auto_25076 ) ( not ( = ?auto_25110 ?auto_25092 ) ) ( HOIST-AT ?auto_25109 ?auto_25110 ) ( AVAILABLE ?auto_25109 ) ( SURFACE-AT ?auto_25076 ?auto_25110 ) ( ON ?auto_25076 ?auto_25101 ) ( CLEAR ?auto_25076 ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25101 ) ) ( not ( = ?auto_25076 ?auto_25101 ) ) ( not ( = ?auto_25088 ?auto_25109 ) ) ( SURFACE-AT ?auto_25074 ?auto_25092 ) ( CLEAR ?auto_25074 ) ( IS-CRATE ?auto_25075 ) ( AVAILABLE ?auto_25088 ) ( AVAILABLE ?auto_25107 ) ( SURFACE-AT ?auto_25075 ?auto_25097 ) ( ON ?auto_25075 ?auto_25095 ) ( CLEAR ?auto_25075 ) ( TRUCK-AT ?auto_25090 ?auto_25092 ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25095 ) ) ( not ( = ?auto_25075 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25101 ) ) ( not ( = ?auto_25076 ?auto_25095 ) ) ( not ( = ?auto_25110 ?auto_25097 ) ) ( not ( = ?auto_25109 ?auto_25107 ) ) ( not ( = ?auto_25101 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) ( not ( = ?auto_25074 ?auto_25103 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25103 ) ) ( not ( = ?auto_25077 ?auto_25101 ) ) ( not ( = ?auto_25077 ?auto_25095 ) ) ( not ( = ?auto_25099 ?auto_25110 ) ) ( not ( = ?auto_25099 ?auto_25097 ) ) ( not ( = ?auto_25116 ?auto_25109 ) ) ( not ( = ?auto_25116 ?auto_25107 ) ) ( not ( = ?auto_25103 ?auto_25101 ) ) ( not ( = ?auto_25103 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25078 ) ) ( not ( = ?auto_25074 ?auto_25119 ) ) ( not ( = ?auto_25075 ?auto_25078 ) ) ( not ( = ?auto_25075 ?auto_25119 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25076 ?auto_25119 ) ) ( not ( = ?auto_25078 ?auto_25103 ) ) ( not ( = ?auto_25078 ?auto_25101 ) ) ( not ( = ?auto_25078 ?auto_25095 ) ) ( not ( = ?auto_25100 ?auto_25099 ) ) ( not ( = ?auto_25100 ?auto_25110 ) ) ( not ( = ?auto_25100 ?auto_25097 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25114 ?auto_25109 ) ) ( not ( = ?auto_25114 ?auto_25107 ) ) ( not ( = ?auto_25119 ?auto_25103 ) ) ( not ( = ?auto_25119 ?auto_25101 ) ) ( not ( = ?auto_25119 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25079 ) ) ( not ( = ?auto_25074 ?auto_25096 ) ) ( not ( = ?auto_25075 ?auto_25079 ) ) ( not ( = ?auto_25075 ?auto_25096 ) ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25076 ?auto_25096 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25096 ) ) ( not ( = ?auto_25079 ?auto_25119 ) ) ( not ( = ?auto_25079 ?auto_25103 ) ) ( not ( = ?auto_25079 ?auto_25101 ) ) ( not ( = ?auto_25079 ?auto_25095 ) ) ( not ( = ?auto_25089 ?auto_25100 ) ) ( not ( = ?auto_25089 ?auto_25099 ) ) ( not ( = ?auto_25089 ?auto_25110 ) ) ( not ( = ?auto_25089 ?auto_25097 ) ) ( not ( = ?auto_25093 ?auto_25114 ) ) ( not ( = ?auto_25093 ?auto_25116 ) ) ( not ( = ?auto_25093 ?auto_25109 ) ) ( not ( = ?auto_25093 ?auto_25107 ) ) ( not ( = ?auto_25096 ?auto_25119 ) ) ( not ( = ?auto_25096 ?auto_25103 ) ) ( not ( = ?auto_25096 ?auto_25101 ) ) ( not ( = ?auto_25096 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25080 ) ) ( not ( = ?auto_25074 ?auto_25108 ) ) ( not ( = ?auto_25075 ?auto_25080 ) ) ( not ( = ?auto_25075 ?auto_25108 ) ) ( not ( = ?auto_25076 ?auto_25080 ) ) ( not ( = ?auto_25076 ?auto_25108 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25108 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25108 ) ) ( not ( = ?auto_25080 ?auto_25096 ) ) ( not ( = ?auto_25080 ?auto_25119 ) ) ( not ( = ?auto_25080 ?auto_25103 ) ) ( not ( = ?auto_25080 ?auto_25101 ) ) ( not ( = ?auto_25080 ?auto_25095 ) ) ( not ( = ?auto_25108 ?auto_25096 ) ) ( not ( = ?auto_25108 ?auto_25119 ) ) ( not ( = ?auto_25108 ?auto_25103 ) ) ( not ( = ?auto_25108 ?auto_25101 ) ) ( not ( = ?auto_25108 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25081 ) ) ( not ( = ?auto_25074 ?auto_25113 ) ) ( not ( = ?auto_25075 ?auto_25081 ) ) ( not ( = ?auto_25075 ?auto_25113 ) ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( not ( = ?auto_25076 ?auto_25113 ) ) ( not ( = ?auto_25077 ?auto_25081 ) ) ( not ( = ?auto_25077 ?auto_25113 ) ) ( not ( = ?auto_25078 ?auto_25081 ) ) ( not ( = ?auto_25078 ?auto_25113 ) ) ( not ( = ?auto_25079 ?auto_25081 ) ) ( not ( = ?auto_25079 ?auto_25113 ) ) ( not ( = ?auto_25081 ?auto_25108 ) ) ( not ( = ?auto_25081 ?auto_25096 ) ) ( not ( = ?auto_25081 ?auto_25119 ) ) ( not ( = ?auto_25081 ?auto_25103 ) ) ( not ( = ?auto_25081 ?auto_25101 ) ) ( not ( = ?auto_25081 ?auto_25095 ) ) ( not ( = ?auto_25117 ?auto_25099 ) ) ( not ( = ?auto_25117 ?auto_25089 ) ) ( not ( = ?auto_25117 ?auto_25100 ) ) ( not ( = ?auto_25117 ?auto_25110 ) ) ( not ( = ?auto_25117 ?auto_25097 ) ) ( not ( = ?auto_25115 ?auto_25116 ) ) ( not ( = ?auto_25115 ?auto_25093 ) ) ( not ( = ?auto_25115 ?auto_25114 ) ) ( not ( = ?auto_25115 ?auto_25109 ) ) ( not ( = ?auto_25115 ?auto_25107 ) ) ( not ( = ?auto_25113 ?auto_25108 ) ) ( not ( = ?auto_25113 ?auto_25096 ) ) ( not ( = ?auto_25113 ?auto_25119 ) ) ( not ( = ?auto_25113 ?auto_25103 ) ) ( not ( = ?auto_25113 ?auto_25101 ) ) ( not ( = ?auto_25113 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25082 ) ) ( not ( = ?auto_25074 ?auto_25094 ) ) ( not ( = ?auto_25075 ?auto_25082 ) ) ( not ( = ?auto_25075 ?auto_25094 ) ) ( not ( = ?auto_25076 ?auto_25082 ) ) ( not ( = ?auto_25076 ?auto_25094 ) ) ( not ( = ?auto_25077 ?auto_25082 ) ) ( not ( = ?auto_25077 ?auto_25094 ) ) ( not ( = ?auto_25078 ?auto_25082 ) ) ( not ( = ?auto_25078 ?auto_25094 ) ) ( not ( = ?auto_25079 ?auto_25082 ) ) ( not ( = ?auto_25079 ?auto_25094 ) ) ( not ( = ?auto_25080 ?auto_25082 ) ) ( not ( = ?auto_25080 ?auto_25094 ) ) ( not ( = ?auto_25082 ?auto_25113 ) ) ( not ( = ?auto_25082 ?auto_25108 ) ) ( not ( = ?auto_25082 ?auto_25096 ) ) ( not ( = ?auto_25082 ?auto_25119 ) ) ( not ( = ?auto_25082 ?auto_25103 ) ) ( not ( = ?auto_25082 ?auto_25101 ) ) ( not ( = ?auto_25082 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25113 ) ) ( not ( = ?auto_25094 ?auto_25108 ) ) ( not ( = ?auto_25094 ?auto_25096 ) ) ( not ( = ?auto_25094 ?auto_25119 ) ) ( not ( = ?auto_25094 ?auto_25103 ) ) ( not ( = ?auto_25094 ?auto_25101 ) ) ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25083 ) ) ( not ( = ?auto_25074 ?auto_25105 ) ) ( not ( = ?auto_25075 ?auto_25083 ) ) ( not ( = ?auto_25075 ?auto_25105 ) ) ( not ( = ?auto_25076 ?auto_25083 ) ) ( not ( = ?auto_25076 ?auto_25105 ) ) ( not ( = ?auto_25077 ?auto_25083 ) ) ( not ( = ?auto_25077 ?auto_25105 ) ) ( not ( = ?auto_25078 ?auto_25083 ) ) ( not ( = ?auto_25078 ?auto_25105 ) ) ( not ( = ?auto_25079 ?auto_25083 ) ) ( not ( = ?auto_25079 ?auto_25105 ) ) ( not ( = ?auto_25080 ?auto_25083 ) ) ( not ( = ?auto_25080 ?auto_25105 ) ) ( not ( = ?auto_25081 ?auto_25083 ) ) ( not ( = ?auto_25081 ?auto_25105 ) ) ( not ( = ?auto_25083 ?auto_25094 ) ) ( not ( = ?auto_25083 ?auto_25113 ) ) ( not ( = ?auto_25083 ?auto_25108 ) ) ( not ( = ?auto_25083 ?auto_25096 ) ) ( not ( = ?auto_25083 ?auto_25119 ) ) ( not ( = ?auto_25083 ?auto_25103 ) ) ( not ( = ?auto_25083 ?auto_25101 ) ) ( not ( = ?auto_25083 ?auto_25095 ) ) ( not ( = ?auto_25105 ?auto_25094 ) ) ( not ( = ?auto_25105 ?auto_25113 ) ) ( not ( = ?auto_25105 ?auto_25108 ) ) ( not ( = ?auto_25105 ?auto_25096 ) ) ( not ( = ?auto_25105 ?auto_25119 ) ) ( not ( = ?auto_25105 ?auto_25103 ) ) ( not ( = ?auto_25105 ?auto_25101 ) ) ( not ( = ?auto_25105 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25084 ) ) ( not ( = ?auto_25074 ?auto_25112 ) ) ( not ( = ?auto_25075 ?auto_25084 ) ) ( not ( = ?auto_25075 ?auto_25112 ) ) ( not ( = ?auto_25076 ?auto_25084 ) ) ( not ( = ?auto_25076 ?auto_25112 ) ) ( not ( = ?auto_25077 ?auto_25084 ) ) ( not ( = ?auto_25077 ?auto_25112 ) ) ( not ( = ?auto_25078 ?auto_25084 ) ) ( not ( = ?auto_25078 ?auto_25112 ) ) ( not ( = ?auto_25079 ?auto_25084 ) ) ( not ( = ?auto_25079 ?auto_25112 ) ) ( not ( = ?auto_25080 ?auto_25084 ) ) ( not ( = ?auto_25080 ?auto_25112 ) ) ( not ( = ?auto_25081 ?auto_25084 ) ) ( not ( = ?auto_25081 ?auto_25112 ) ) ( not ( = ?auto_25082 ?auto_25084 ) ) ( not ( = ?auto_25082 ?auto_25112 ) ) ( not ( = ?auto_25084 ?auto_25105 ) ) ( not ( = ?auto_25084 ?auto_25094 ) ) ( not ( = ?auto_25084 ?auto_25113 ) ) ( not ( = ?auto_25084 ?auto_25108 ) ) ( not ( = ?auto_25084 ?auto_25096 ) ) ( not ( = ?auto_25084 ?auto_25119 ) ) ( not ( = ?auto_25084 ?auto_25103 ) ) ( not ( = ?auto_25084 ?auto_25101 ) ) ( not ( = ?auto_25084 ?auto_25095 ) ) ( not ( = ?auto_25118 ?auto_25097 ) ) ( not ( = ?auto_25118 ?auto_25117 ) ) ( not ( = ?auto_25118 ?auto_25099 ) ) ( not ( = ?auto_25118 ?auto_25089 ) ) ( not ( = ?auto_25118 ?auto_25100 ) ) ( not ( = ?auto_25118 ?auto_25110 ) ) ( not ( = ?auto_25111 ?auto_25107 ) ) ( not ( = ?auto_25111 ?auto_25115 ) ) ( not ( = ?auto_25111 ?auto_25116 ) ) ( not ( = ?auto_25111 ?auto_25093 ) ) ( not ( = ?auto_25111 ?auto_25114 ) ) ( not ( = ?auto_25111 ?auto_25109 ) ) ( not ( = ?auto_25112 ?auto_25105 ) ) ( not ( = ?auto_25112 ?auto_25094 ) ) ( not ( = ?auto_25112 ?auto_25113 ) ) ( not ( = ?auto_25112 ?auto_25108 ) ) ( not ( = ?auto_25112 ?auto_25096 ) ) ( not ( = ?auto_25112 ?auto_25119 ) ) ( not ( = ?auto_25112 ?auto_25103 ) ) ( not ( = ?auto_25112 ?auto_25101 ) ) ( not ( = ?auto_25112 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25085 ) ) ( not ( = ?auto_25074 ?auto_25102 ) ) ( not ( = ?auto_25075 ?auto_25085 ) ) ( not ( = ?auto_25075 ?auto_25102 ) ) ( not ( = ?auto_25076 ?auto_25085 ) ) ( not ( = ?auto_25076 ?auto_25102 ) ) ( not ( = ?auto_25077 ?auto_25085 ) ) ( not ( = ?auto_25077 ?auto_25102 ) ) ( not ( = ?auto_25078 ?auto_25085 ) ) ( not ( = ?auto_25078 ?auto_25102 ) ) ( not ( = ?auto_25079 ?auto_25085 ) ) ( not ( = ?auto_25079 ?auto_25102 ) ) ( not ( = ?auto_25080 ?auto_25085 ) ) ( not ( = ?auto_25080 ?auto_25102 ) ) ( not ( = ?auto_25081 ?auto_25085 ) ) ( not ( = ?auto_25081 ?auto_25102 ) ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25082 ?auto_25102 ) ) ( not ( = ?auto_25083 ?auto_25085 ) ) ( not ( = ?auto_25083 ?auto_25102 ) ) ( not ( = ?auto_25085 ?auto_25112 ) ) ( not ( = ?auto_25085 ?auto_25105 ) ) ( not ( = ?auto_25085 ?auto_25094 ) ) ( not ( = ?auto_25085 ?auto_25113 ) ) ( not ( = ?auto_25085 ?auto_25108 ) ) ( not ( = ?auto_25085 ?auto_25096 ) ) ( not ( = ?auto_25085 ?auto_25119 ) ) ( not ( = ?auto_25085 ?auto_25103 ) ) ( not ( = ?auto_25085 ?auto_25101 ) ) ( not ( = ?auto_25085 ?auto_25095 ) ) ( not ( = ?auto_25098 ?auto_25118 ) ) ( not ( = ?auto_25098 ?auto_25097 ) ) ( not ( = ?auto_25098 ?auto_25117 ) ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25089 ) ) ( not ( = ?auto_25098 ?auto_25100 ) ) ( not ( = ?auto_25098 ?auto_25110 ) ) ( not ( = ?auto_25106 ?auto_25111 ) ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25115 ) ) ( not ( = ?auto_25106 ?auto_25116 ) ) ( not ( = ?auto_25106 ?auto_25093 ) ) ( not ( = ?auto_25106 ?auto_25114 ) ) ( not ( = ?auto_25106 ?auto_25109 ) ) ( not ( = ?auto_25102 ?auto_25112 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25094 ) ) ( not ( = ?auto_25102 ?auto_25113 ) ) ( not ( = ?auto_25102 ?auto_25108 ) ) ( not ( = ?auto_25102 ?auto_25096 ) ) ( not ( = ?auto_25102 ?auto_25119 ) ) ( not ( = ?auto_25102 ?auto_25103 ) ) ( not ( = ?auto_25102 ?auto_25101 ) ) ( not ( = ?auto_25102 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25086 ) ) ( not ( = ?auto_25074 ?auto_25104 ) ) ( not ( = ?auto_25075 ?auto_25086 ) ) ( not ( = ?auto_25075 ?auto_25104 ) ) ( not ( = ?auto_25076 ?auto_25086 ) ) ( not ( = ?auto_25076 ?auto_25104 ) ) ( not ( = ?auto_25077 ?auto_25086 ) ) ( not ( = ?auto_25077 ?auto_25104 ) ) ( not ( = ?auto_25078 ?auto_25086 ) ) ( not ( = ?auto_25078 ?auto_25104 ) ) ( not ( = ?auto_25079 ?auto_25086 ) ) ( not ( = ?auto_25079 ?auto_25104 ) ) ( not ( = ?auto_25080 ?auto_25086 ) ) ( not ( = ?auto_25080 ?auto_25104 ) ) ( not ( = ?auto_25081 ?auto_25086 ) ) ( not ( = ?auto_25081 ?auto_25104 ) ) ( not ( = ?auto_25082 ?auto_25086 ) ) ( not ( = ?auto_25082 ?auto_25104 ) ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25083 ?auto_25104 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25104 ) ) ( not ( = ?auto_25086 ?auto_25102 ) ) ( not ( = ?auto_25086 ?auto_25112 ) ) ( not ( = ?auto_25086 ?auto_25105 ) ) ( not ( = ?auto_25086 ?auto_25094 ) ) ( not ( = ?auto_25086 ?auto_25113 ) ) ( not ( = ?auto_25086 ?auto_25108 ) ) ( not ( = ?auto_25086 ?auto_25096 ) ) ( not ( = ?auto_25086 ?auto_25119 ) ) ( not ( = ?auto_25086 ?auto_25103 ) ) ( not ( = ?auto_25086 ?auto_25101 ) ) ( not ( = ?auto_25086 ?auto_25095 ) ) ( not ( = ?auto_25104 ?auto_25102 ) ) ( not ( = ?auto_25104 ?auto_25112 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25094 ) ) ( not ( = ?auto_25104 ?auto_25113 ) ) ( not ( = ?auto_25104 ?auto_25108 ) ) ( not ( = ?auto_25104 ?auto_25096 ) ) ( not ( = ?auto_25104 ?auto_25119 ) ) ( not ( = ?auto_25104 ?auto_25103 ) ) ( not ( = ?auto_25104 ?auto_25101 ) ) ( not ( = ?auto_25104 ?auto_25095 ) ) ( not ( = ?auto_25074 ?auto_25087 ) ) ( not ( = ?auto_25074 ?auto_25091 ) ) ( not ( = ?auto_25075 ?auto_25087 ) ) ( not ( = ?auto_25075 ?auto_25091 ) ) ( not ( = ?auto_25076 ?auto_25087 ) ) ( not ( = ?auto_25076 ?auto_25091 ) ) ( not ( = ?auto_25077 ?auto_25087 ) ) ( not ( = ?auto_25077 ?auto_25091 ) ) ( not ( = ?auto_25078 ?auto_25087 ) ) ( not ( = ?auto_25078 ?auto_25091 ) ) ( not ( = ?auto_25079 ?auto_25087 ) ) ( not ( = ?auto_25079 ?auto_25091 ) ) ( not ( = ?auto_25080 ?auto_25087 ) ) ( not ( = ?auto_25080 ?auto_25091 ) ) ( not ( = ?auto_25081 ?auto_25087 ) ) ( not ( = ?auto_25081 ?auto_25091 ) ) ( not ( = ?auto_25082 ?auto_25087 ) ) ( not ( = ?auto_25082 ?auto_25091 ) ) ( not ( = ?auto_25083 ?auto_25087 ) ) ( not ( = ?auto_25083 ?auto_25091 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25091 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25091 ) ) ( not ( = ?auto_25087 ?auto_25104 ) ) ( not ( = ?auto_25087 ?auto_25102 ) ) ( not ( = ?auto_25087 ?auto_25112 ) ) ( not ( = ?auto_25087 ?auto_25105 ) ) ( not ( = ?auto_25087 ?auto_25094 ) ) ( not ( = ?auto_25087 ?auto_25113 ) ) ( not ( = ?auto_25087 ?auto_25108 ) ) ( not ( = ?auto_25087 ?auto_25096 ) ) ( not ( = ?auto_25087 ?auto_25119 ) ) ( not ( = ?auto_25087 ?auto_25103 ) ) ( not ( = ?auto_25087 ?auto_25101 ) ) ( not ( = ?auto_25087 ?auto_25095 ) ) ( not ( = ?auto_25091 ?auto_25104 ) ) ( not ( = ?auto_25091 ?auto_25102 ) ) ( not ( = ?auto_25091 ?auto_25112 ) ) ( not ( = ?auto_25091 ?auto_25105 ) ) ( not ( = ?auto_25091 ?auto_25094 ) ) ( not ( = ?auto_25091 ?auto_25113 ) ) ( not ( = ?auto_25091 ?auto_25108 ) ) ( not ( = ?auto_25091 ?auto_25096 ) ) ( not ( = ?auto_25091 ?auto_25119 ) ) ( not ( = ?auto_25091 ?auto_25103 ) ) ( not ( = ?auto_25091 ?auto_25101 ) ) ( not ( = ?auto_25091 ?auto_25095 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25081 ?auto_25082 ?auto_25083 ?auto_25084 ?auto_25085 ?auto_25086 )
      ( MAKE-1CRATE ?auto_25086 ?auto_25087 )
      ( MAKE-13CRATE-VERIFY ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25081 ?auto_25082 ?auto_25083 ?auto_25084 ?auto_25085 ?auto_25086 ?auto_25087 ) )
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
      ?auto_25152 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25154 - SURFACE
      ?auto_25155 - SURFACE
      ?auto_25156 - SURFACE
      ?auto_25157 - SURFACE
      ?auto_25159 - SURFACE
      ?auto_25158 - SURFACE
    )
    :vars
    (
      ?auto_25164 - HOIST
      ?auto_25162 - PLACE
      ?auto_25161 - PLACE
      ?auto_25165 - HOIST
      ?auto_25160 - SURFACE
      ?auto_25170 - PLACE
      ?auto_25189 - HOIST
      ?auto_25169 - SURFACE
      ?auto_25172 - PLACE
      ?auto_25173 - HOIST
      ?auto_25183 - SURFACE
      ?auto_25167 - PLACE
      ?auto_25181 - HOIST
      ?auto_25176 - SURFACE
      ?auto_25178 - SURFACE
      ?auto_25180 - PLACE
      ?auto_25171 - HOIST
      ?auto_25185 - SURFACE
      ?auto_25192 - SURFACE
      ?auto_25174 - SURFACE
      ?auto_25186 - PLACE
      ?auto_25188 - HOIST
      ?auto_25179 - SURFACE
      ?auto_25190 - SURFACE
      ?auto_25182 - PLACE
      ?auto_25191 - HOIST
      ?auto_25184 - SURFACE
      ?auto_25175 - SURFACE
      ?auto_25187 - PLACE
      ?auto_25166 - HOIST
      ?auto_25177 - SURFACE
      ?auto_25168 - SURFACE
      ?auto_25163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25164 ?auto_25162 ) ( IS-CRATE ?auto_25158 ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( HOIST-AT ?auto_25165 ?auto_25161 ) ( SURFACE-AT ?auto_25158 ?auto_25161 ) ( ON ?auto_25158 ?auto_25160 ) ( CLEAR ?auto_25158 ) ( not ( = ?auto_25159 ?auto_25158 ) ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) ( not ( = ?auto_25164 ?auto_25165 ) ) ( IS-CRATE ?auto_25159 ) ( not ( = ?auto_25170 ?auto_25162 ) ) ( HOIST-AT ?auto_25189 ?auto_25170 ) ( SURFACE-AT ?auto_25159 ?auto_25170 ) ( ON ?auto_25159 ?auto_25169 ) ( CLEAR ?auto_25159 ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25169 ) ) ( not ( = ?auto_25159 ?auto_25169 ) ) ( not ( = ?auto_25164 ?auto_25189 ) ) ( IS-CRATE ?auto_25157 ) ( not ( = ?auto_25172 ?auto_25162 ) ) ( HOIST-AT ?auto_25173 ?auto_25172 ) ( SURFACE-AT ?auto_25157 ?auto_25172 ) ( ON ?auto_25157 ?auto_25183 ) ( CLEAR ?auto_25157 ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25183 ) ) ( not ( = ?auto_25157 ?auto_25183 ) ) ( not ( = ?auto_25164 ?auto_25173 ) ) ( IS-CRATE ?auto_25156 ) ( not ( = ?auto_25167 ?auto_25162 ) ) ( HOIST-AT ?auto_25181 ?auto_25167 ) ( AVAILABLE ?auto_25181 ) ( SURFACE-AT ?auto_25156 ?auto_25167 ) ( ON ?auto_25156 ?auto_25176 ) ( CLEAR ?auto_25156 ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25176 ) ) ( not ( = ?auto_25156 ?auto_25176 ) ) ( not ( = ?auto_25164 ?auto_25181 ) ) ( IS-CRATE ?auto_25155 ) ( AVAILABLE ?auto_25173 ) ( SURFACE-AT ?auto_25155 ?auto_25172 ) ( ON ?auto_25155 ?auto_25178 ) ( CLEAR ?auto_25155 ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25178 ) ) ( not ( = ?auto_25155 ?auto_25178 ) ) ( IS-CRATE ?auto_25154 ) ( not ( = ?auto_25180 ?auto_25162 ) ) ( HOIST-AT ?auto_25171 ?auto_25180 ) ( SURFACE-AT ?auto_25154 ?auto_25180 ) ( ON ?auto_25154 ?auto_25185 ) ( CLEAR ?auto_25154 ) ( not ( = ?auto_25153 ?auto_25154 ) ) ( not ( = ?auto_25153 ?auto_25185 ) ) ( not ( = ?auto_25154 ?auto_25185 ) ) ( not ( = ?auto_25164 ?auto_25171 ) ) ( IS-CRATE ?auto_25153 ) ( SURFACE-AT ?auto_25153 ?auto_25161 ) ( ON ?auto_25153 ?auto_25192 ) ( CLEAR ?auto_25153 ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25192 ) ) ( not ( = ?auto_25153 ?auto_25192 ) ) ( IS-CRATE ?auto_25152 ) ( AVAILABLE ?auto_25165 ) ( SURFACE-AT ?auto_25152 ?auto_25161 ) ( ON ?auto_25152 ?auto_25174 ) ( CLEAR ?auto_25152 ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( not ( = ?auto_25151 ?auto_25174 ) ) ( not ( = ?auto_25152 ?auto_25174 ) ) ( IS-CRATE ?auto_25151 ) ( not ( = ?auto_25186 ?auto_25162 ) ) ( HOIST-AT ?auto_25188 ?auto_25186 ) ( SURFACE-AT ?auto_25151 ?auto_25186 ) ( ON ?auto_25151 ?auto_25179 ) ( CLEAR ?auto_25151 ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25150 ?auto_25179 ) ) ( not ( = ?auto_25151 ?auto_25179 ) ) ( not ( = ?auto_25164 ?auto_25188 ) ) ( IS-CRATE ?auto_25150 ) ( AVAILABLE ?auto_25189 ) ( SURFACE-AT ?auto_25150 ?auto_25170 ) ( ON ?auto_25150 ?auto_25190 ) ( CLEAR ?auto_25150 ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25149 ?auto_25190 ) ) ( not ( = ?auto_25150 ?auto_25190 ) ) ( IS-CRATE ?auto_25149 ) ( not ( = ?auto_25182 ?auto_25162 ) ) ( HOIST-AT ?auto_25191 ?auto_25182 ) ( AVAILABLE ?auto_25191 ) ( SURFACE-AT ?auto_25149 ?auto_25182 ) ( ON ?auto_25149 ?auto_25184 ) ( CLEAR ?auto_25149 ) ( not ( = ?auto_25148 ?auto_25149 ) ) ( not ( = ?auto_25148 ?auto_25184 ) ) ( not ( = ?auto_25149 ?auto_25184 ) ) ( not ( = ?auto_25164 ?auto_25191 ) ) ( IS-CRATE ?auto_25148 ) ( AVAILABLE ?auto_25188 ) ( SURFACE-AT ?auto_25148 ?auto_25186 ) ( ON ?auto_25148 ?auto_25175 ) ( CLEAR ?auto_25148 ) ( not ( = ?auto_25147 ?auto_25148 ) ) ( not ( = ?auto_25147 ?auto_25175 ) ) ( not ( = ?auto_25148 ?auto_25175 ) ) ( IS-CRATE ?auto_25147 ) ( not ( = ?auto_25187 ?auto_25162 ) ) ( HOIST-AT ?auto_25166 ?auto_25187 ) ( AVAILABLE ?auto_25166 ) ( SURFACE-AT ?auto_25147 ?auto_25187 ) ( ON ?auto_25147 ?auto_25177 ) ( CLEAR ?auto_25147 ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25177 ) ) ( not ( = ?auto_25147 ?auto_25177 ) ) ( not ( = ?auto_25164 ?auto_25166 ) ) ( SURFACE-AT ?auto_25145 ?auto_25162 ) ( CLEAR ?auto_25145 ) ( IS-CRATE ?auto_25146 ) ( AVAILABLE ?auto_25164 ) ( AVAILABLE ?auto_25171 ) ( SURFACE-AT ?auto_25146 ?auto_25180 ) ( ON ?auto_25146 ?auto_25168 ) ( CLEAR ?auto_25146 ) ( TRUCK-AT ?auto_25163 ?auto_25162 ) ( not ( = ?auto_25145 ?auto_25146 ) ) ( not ( = ?auto_25145 ?auto_25168 ) ) ( not ( = ?auto_25146 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( not ( = ?auto_25145 ?auto_25177 ) ) ( not ( = ?auto_25147 ?auto_25168 ) ) ( not ( = ?auto_25187 ?auto_25180 ) ) ( not ( = ?auto_25166 ?auto_25171 ) ) ( not ( = ?auto_25177 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25175 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25175 ) ) ( not ( = ?auto_25148 ?auto_25177 ) ) ( not ( = ?auto_25148 ?auto_25168 ) ) ( not ( = ?auto_25186 ?auto_25187 ) ) ( not ( = ?auto_25186 ?auto_25180 ) ) ( not ( = ?auto_25188 ?auto_25166 ) ) ( not ( = ?auto_25188 ?auto_25171 ) ) ( not ( = ?auto_25175 ?auto_25177 ) ) ( not ( = ?auto_25175 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25149 ) ) ( not ( = ?auto_25145 ?auto_25184 ) ) ( not ( = ?auto_25146 ?auto_25149 ) ) ( not ( = ?auto_25146 ?auto_25184 ) ) ( not ( = ?auto_25147 ?auto_25149 ) ) ( not ( = ?auto_25147 ?auto_25184 ) ) ( not ( = ?auto_25149 ?auto_25175 ) ) ( not ( = ?auto_25149 ?auto_25177 ) ) ( not ( = ?auto_25149 ?auto_25168 ) ) ( not ( = ?auto_25182 ?auto_25186 ) ) ( not ( = ?auto_25182 ?auto_25187 ) ) ( not ( = ?auto_25182 ?auto_25180 ) ) ( not ( = ?auto_25191 ?auto_25188 ) ) ( not ( = ?auto_25191 ?auto_25166 ) ) ( not ( = ?auto_25191 ?auto_25171 ) ) ( not ( = ?auto_25184 ?auto_25175 ) ) ( not ( = ?auto_25184 ?auto_25177 ) ) ( not ( = ?auto_25184 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25150 ) ) ( not ( = ?auto_25145 ?auto_25190 ) ) ( not ( = ?auto_25146 ?auto_25150 ) ) ( not ( = ?auto_25146 ?auto_25190 ) ) ( not ( = ?auto_25147 ?auto_25150 ) ) ( not ( = ?auto_25147 ?auto_25190 ) ) ( not ( = ?auto_25148 ?auto_25150 ) ) ( not ( = ?auto_25148 ?auto_25190 ) ) ( not ( = ?auto_25150 ?auto_25184 ) ) ( not ( = ?auto_25150 ?auto_25175 ) ) ( not ( = ?auto_25150 ?auto_25177 ) ) ( not ( = ?auto_25150 ?auto_25168 ) ) ( not ( = ?auto_25170 ?auto_25182 ) ) ( not ( = ?auto_25170 ?auto_25186 ) ) ( not ( = ?auto_25170 ?auto_25187 ) ) ( not ( = ?auto_25170 ?auto_25180 ) ) ( not ( = ?auto_25189 ?auto_25191 ) ) ( not ( = ?auto_25189 ?auto_25188 ) ) ( not ( = ?auto_25189 ?auto_25166 ) ) ( not ( = ?auto_25189 ?auto_25171 ) ) ( not ( = ?auto_25190 ?auto_25184 ) ) ( not ( = ?auto_25190 ?auto_25175 ) ) ( not ( = ?auto_25190 ?auto_25177 ) ) ( not ( = ?auto_25190 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25151 ) ) ( not ( = ?auto_25145 ?auto_25179 ) ) ( not ( = ?auto_25146 ?auto_25151 ) ) ( not ( = ?auto_25146 ?auto_25179 ) ) ( not ( = ?auto_25147 ?auto_25151 ) ) ( not ( = ?auto_25147 ?auto_25179 ) ) ( not ( = ?auto_25148 ?auto_25151 ) ) ( not ( = ?auto_25148 ?auto_25179 ) ) ( not ( = ?auto_25149 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25179 ) ) ( not ( = ?auto_25151 ?auto_25190 ) ) ( not ( = ?auto_25151 ?auto_25184 ) ) ( not ( = ?auto_25151 ?auto_25175 ) ) ( not ( = ?auto_25151 ?auto_25177 ) ) ( not ( = ?auto_25151 ?auto_25168 ) ) ( not ( = ?auto_25179 ?auto_25190 ) ) ( not ( = ?auto_25179 ?auto_25184 ) ) ( not ( = ?auto_25179 ?auto_25175 ) ) ( not ( = ?auto_25179 ?auto_25177 ) ) ( not ( = ?auto_25179 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25152 ) ) ( not ( = ?auto_25145 ?auto_25174 ) ) ( not ( = ?auto_25146 ?auto_25152 ) ) ( not ( = ?auto_25146 ?auto_25174 ) ) ( not ( = ?auto_25147 ?auto_25152 ) ) ( not ( = ?auto_25147 ?auto_25174 ) ) ( not ( = ?auto_25148 ?auto_25152 ) ) ( not ( = ?auto_25148 ?auto_25174 ) ) ( not ( = ?auto_25149 ?auto_25152 ) ) ( not ( = ?auto_25149 ?auto_25174 ) ) ( not ( = ?auto_25150 ?auto_25152 ) ) ( not ( = ?auto_25150 ?auto_25174 ) ) ( not ( = ?auto_25152 ?auto_25179 ) ) ( not ( = ?auto_25152 ?auto_25190 ) ) ( not ( = ?auto_25152 ?auto_25184 ) ) ( not ( = ?auto_25152 ?auto_25175 ) ) ( not ( = ?auto_25152 ?auto_25177 ) ) ( not ( = ?auto_25152 ?auto_25168 ) ) ( not ( = ?auto_25161 ?auto_25186 ) ) ( not ( = ?auto_25161 ?auto_25170 ) ) ( not ( = ?auto_25161 ?auto_25182 ) ) ( not ( = ?auto_25161 ?auto_25187 ) ) ( not ( = ?auto_25161 ?auto_25180 ) ) ( not ( = ?auto_25165 ?auto_25188 ) ) ( not ( = ?auto_25165 ?auto_25189 ) ) ( not ( = ?auto_25165 ?auto_25191 ) ) ( not ( = ?auto_25165 ?auto_25166 ) ) ( not ( = ?auto_25165 ?auto_25171 ) ) ( not ( = ?auto_25174 ?auto_25179 ) ) ( not ( = ?auto_25174 ?auto_25190 ) ) ( not ( = ?auto_25174 ?auto_25184 ) ) ( not ( = ?auto_25174 ?auto_25175 ) ) ( not ( = ?auto_25174 ?auto_25177 ) ) ( not ( = ?auto_25174 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25153 ) ) ( not ( = ?auto_25145 ?auto_25192 ) ) ( not ( = ?auto_25146 ?auto_25153 ) ) ( not ( = ?auto_25146 ?auto_25192 ) ) ( not ( = ?auto_25147 ?auto_25153 ) ) ( not ( = ?auto_25147 ?auto_25192 ) ) ( not ( = ?auto_25148 ?auto_25153 ) ) ( not ( = ?auto_25148 ?auto_25192 ) ) ( not ( = ?auto_25149 ?auto_25153 ) ) ( not ( = ?auto_25149 ?auto_25192 ) ) ( not ( = ?auto_25150 ?auto_25153 ) ) ( not ( = ?auto_25150 ?auto_25192 ) ) ( not ( = ?auto_25151 ?auto_25153 ) ) ( not ( = ?auto_25151 ?auto_25192 ) ) ( not ( = ?auto_25153 ?auto_25174 ) ) ( not ( = ?auto_25153 ?auto_25179 ) ) ( not ( = ?auto_25153 ?auto_25190 ) ) ( not ( = ?auto_25153 ?auto_25184 ) ) ( not ( = ?auto_25153 ?auto_25175 ) ) ( not ( = ?auto_25153 ?auto_25177 ) ) ( not ( = ?auto_25153 ?auto_25168 ) ) ( not ( = ?auto_25192 ?auto_25174 ) ) ( not ( = ?auto_25192 ?auto_25179 ) ) ( not ( = ?auto_25192 ?auto_25190 ) ) ( not ( = ?auto_25192 ?auto_25184 ) ) ( not ( = ?auto_25192 ?auto_25175 ) ) ( not ( = ?auto_25192 ?auto_25177 ) ) ( not ( = ?auto_25192 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25154 ) ) ( not ( = ?auto_25145 ?auto_25185 ) ) ( not ( = ?auto_25146 ?auto_25154 ) ) ( not ( = ?auto_25146 ?auto_25185 ) ) ( not ( = ?auto_25147 ?auto_25154 ) ) ( not ( = ?auto_25147 ?auto_25185 ) ) ( not ( = ?auto_25148 ?auto_25154 ) ) ( not ( = ?auto_25148 ?auto_25185 ) ) ( not ( = ?auto_25149 ?auto_25154 ) ) ( not ( = ?auto_25149 ?auto_25185 ) ) ( not ( = ?auto_25150 ?auto_25154 ) ) ( not ( = ?auto_25150 ?auto_25185 ) ) ( not ( = ?auto_25151 ?auto_25154 ) ) ( not ( = ?auto_25151 ?auto_25185 ) ) ( not ( = ?auto_25152 ?auto_25154 ) ) ( not ( = ?auto_25152 ?auto_25185 ) ) ( not ( = ?auto_25154 ?auto_25192 ) ) ( not ( = ?auto_25154 ?auto_25174 ) ) ( not ( = ?auto_25154 ?auto_25179 ) ) ( not ( = ?auto_25154 ?auto_25190 ) ) ( not ( = ?auto_25154 ?auto_25184 ) ) ( not ( = ?auto_25154 ?auto_25175 ) ) ( not ( = ?auto_25154 ?auto_25177 ) ) ( not ( = ?auto_25154 ?auto_25168 ) ) ( not ( = ?auto_25185 ?auto_25192 ) ) ( not ( = ?auto_25185 ?auto_25174 ) ) ( not ( = ?auto_25185 ?auto_25179 ) ) ( not ( = ?auto_25185 ?auto_25190 ) ) ( not ( = ?auto_25185 ?auto_25184 ) ) ( not ( = ?auto_25185 ?auto_25175 ) ) ( not ( = ?auto_25185 ?auto_25177 ) ) ( not ( = ?auto_25185 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25155 ) ) ( not ( = ?auto_25145 ?auto_25178 ) ) ( not ( = ?auto_25146 ?auto_25155 ) ) ( not ( = ?auto_25146 ?auto_25178 ) ) ( not ( = ?auto_25147 ?auto_25155 ) ) ( not ( = ?auto_25147 ?auto_25178 ) ) ( not ( = ?auto_25148 ?auto_25155 ) ) ( not ( = ?auto_25148 ?auto_25178 ) ) ( not ( = ?auto_25149 ?auto_25155 ) ) ( not ( = ?auto_25149 ?auto_25178 ) ) ( not ( = ?auto_25150 ?auto_25155 ) ) ( not ( = ?auto_25150 ?auto_25178 ) ) ( not ( = ?auto_25151 ?auto_25155 ) ) ( not ( = ?auto_25151 ?auto_25178 ) ) ( not ( = ?auto_25152 ?auto_25155 ) ) ( not ( = ?auto_25152 ?auto_25178 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25178 ) ) ( not ( = ?auto_25155 ?auto_25185 ) ) ( not ( = ?auto_25155 ?auto_25192 ) ) ( not ( = ?auto_25155 ?auto_25174 ) ) ( not ( = ?auto_25155 ?auto_25179 ) ) ( not ( = ?auto_25155 ?auto_25190 ) ) ( not ( = ?auto_25155 ?auto_25184 ) ) ( not ( = ?auto_25155 ?auto_25175 ) ) ( not ( = ?auto_25155 ?auto_25177 ) ) ( not ( = ?auto_25155 ?auto_25168 ) ) ( not ( = ?auto_25172 ?auto_25180 ) ) ( not ( = ?auto_25172 ?auto_25161 ) ) ( not ( = ?auto_25172 ?auto_25186 ) ) ( not ( = ?auto_25172 ?auto_25170 ) ) ( not ( = ?auto_25172 ?auto_25182 ) ) ( not ( = ?auto_25172 ?auto_25187 ) ) ( not ( = ?auto_25173 ?auto_25171 ) ) ( not ( = ?auto_25173 ?auto_25165 ) ) ( not ( = ?auto_25173 ?auto_25188 ) ) ( not ( = ?auto_25173 ?auto_25189 ) ) ( not ( = ?auto_25173 ?auto_25191 ) ) ( not ( = ?auto_25173 ?auto_25166 ) ) ( not ( = ?auto_25178 ?auto_25185 ) ) ( not ( = ?auto_25178 ?auto_25192 ) ) ( not ( = ?auto_25178 ?auto_25174 ) ) ( not ( = ?auto_25178 ?auto_25179 ) ) ( not ( = ?auto_25178 ?auto_25190 ) ) ( not ( = ?auto_25178 ?auto_25184 ) ) ( not ( = ?auto_25178 ?auto_25175 ) ) ( not ( = ?auto_25178 ?auto_25177 ) ) ( not ( = ?auto_25178 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25156 ) ) ( not ( = ?auto_25145 ?auto_25176 ) ) ( not ( = ?auto_25146 ?auto_25156 ) ) ( not ( = ?auto_25146 ?auto_25176 ) ) ( not ( = ?auto_25147 ?auto_25156 ) ) ( not ( = ?auto_25147 ?auto_25176 ) ) ( not ( = ?auto_25148 ?auto_25156 ) ) ( not ( = ?auto_25148 ?auto_25176 ) ) ( not ( = ?auto_25149 ?auto_25156 ) ) ( not ( = ?auto_25149 ?auto_25176 ) ) ( not ( = ?auto_25150 ?auto_25156 ) ) ( not ( = ?auto_25150 ?auto_25176 ) ) ( not ( = ?auto_25151 ?auto_25156 ) ) ( not ( = ?auto_25151 ?auto_25176 ) ) ( not ( = ?auto_25152 ?auto_25156 ) ) ( not ( = ?auto_25152 ?auto_25176 ) ) ( not ( = ?auto_25153 ?auto_25156 ) ) ( not ( = ?auto_25153 ?auto_25176 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25154 ?auto_25176 ) ) ( not ( = ?auto_25156 ?auto_25178 ) ) ( not ( = ?auto_25156 ?auto_25185 ) ) ( not ( = ?auto_25156 ?auto_25192 ) ) ( not ( = ?auto_25156 ?auto_25174 ) ) ( not ( = ?auto_25156 ?auto_25179 ) ) ( not ( = ?auto_25156 ?auto_25190 ) ) ( not ( = ?auto_25156 ?auto_25184 ) ) ( not ( = ?auto_25156 ?auto_25175 ) ) ( not ( = ?auto_25156 ?auto_25177 ) ) ( not ( = ?auto_25156 ?auto_25168 ) ) ( not ( = ?auto_25167 ?auto_25172 ) ) ( not ( = ?auto_25167 ?auto_25180 ) ) ( not ( = ?auto_25167 ?auto_25161 ) ) ( not ( = ?auto_25167 ?auto_25186 ) ) ( not ( = ?auto_25167 ?auto_25170 ) ) ( not ( = ?auto_25167 ?auto_25182 ) ) ( not ( = ?auto_25167 ?auto_25187 ) ) ( not ( = ?auto_25181 ?auto_25173 ) ) ( not ( = ?auto_25181 ?auto_25171 ) ) ( not ( = ?auto_25181 ?auto_25165 ) ) ( not ( = ?auto_25181 ?auto_25188 ) ) ( not ( = ?auto_25181 ?auto_25189 ) ) ( not ( = ?auto_25181 ?auto_25191 ) ) ( not ( = ?auto_25181 ?auto_25166 ) ) ( not ( = ?auto_25176 ?auto_25178 ) ) ( not ( = ?auto_25176 ?auto_25185 ) ) ( not ( = ?auto_25176 ?auto_25192 ) ) ( not ( = ?auto_25176 ?auto_25174 ) ) ( not ( = ?auto_25176 ?auto_25179 ) ) ( not ( = ?auto_25176 ?auto_25190 ) ) ( not ( = ?auto_25176 ?auto_25184 ) ) ( not ( = ?auto_25176 ?auto_25175 ) ) ( not ( = ?auto_25176 ?auto_25177 ) ) ( not ( = ?auto_25176 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25157 ) ) ( not ( = ?auto_25145 ?auto_25183 ) ) ( not ( = ?auto_25146 ?auto_25157 ) ) ( not ( = ?auto_25146 ?auto_25183 ) ) ( not ( = ?auto_25147 ?auto_25157 ) ) ( not ( = ?auto_25147 ?auto_25183 ) ) ( not ( = ?auto_25148 ?auto_25157 ) ) ( not ( = ?auto_25148 ?auto_25183 ) ) ( not ( = ?auto_25149 ?auto_25157 ) ) ( not ( = ?auto_25149 ?auto_25183 ) ) ( not ( = ?auto_25150 ?auto_25157 ) ) ( not ( = ?auto_25150 ?auto_25183 ) ) ( not ( = ?auto_25151 ?auto_25157 ) ) ( not ( = ?auto_25151 ?auto_25183 ) ) ( not ( = ?auto_25152 ?auto_25157 ) ) ( not ( = ?auto_25152 ?auto_25183 ) ) ( not ( = ?auto_25153 ?auto_25157 ) ) ( not ( = ?auto_25153 ?auto_25183 ) ) ( not ( = ?auto_25154 ?auto_25157 ) ) ( not ( = ?auto_25154 ?auto_25183 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( not ( = ?auto_25155 ?auto_25183 ) ) ( not ( = ?auto_25157 ?auto_25176 ) ) ( not ( = ?auto_25157 ?auto_25178 ) ) ( not ( = ?auto_25157 ?auto_25185 ) ) ( not ( = ?auto_25157 ?auto_25192 ) ) ( not ( = ?auto_25157 ?auto_25174 ) ) ( not ( = ?auto_25157 ?auto_25179 ) ) ( not ( = ?auto_25157 ?auto_25190 ) ) ( not ( = ?auto_25157 ?auto_25184 ) ) ( not ( = ?auto_25157 ?auto_25175 ) ) ( not ( = ?auto_25157 ?auto_25177 ) ) ( not ( = ?auto_25157 ?auto_25168 ) ) ( not ( = ?auto_25183 ?auto_25176 ) ) ( not ( = ?auto_25183 ?auto_25178 ) ) ( not ( = ?auto_25183 ?auto_25185 ) ) ( not ( = ?auto_25183 ?auto_25192 ) ) ( not ( = ?auto_25183 ?auto_25174 ) ) ( not ( = ?auto_25183 ?auto_25179 ) ) ( not ( = ?auto_25183 ?auto_25190 ) ) ( not ( = ?auto_25183 ?auto_25184 ) ) ( not ( = ?auto_25183 ?auto_25175 ) ) ( not ( = ?auto_25183 ?auto_25177 ) ) ( not ( = ?auto_25183 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25159 ) ) ( not ( = ?auto_25145 ?auto_25169 ) ) ( not ( = ?auto_25146 ?auto_25159 ) ) ( not ( = ?auto_25146 ?auto_25169 ) ) ( not ( = ?auto_25147 ?auto_25159 ) ) ( not ( = ?auto_25147 ?auto_25169 ) ) ( not ( = ?auto_25148 ?auto_25159 ) ) ( not ( = ?auto_25148 ?auto_25169 ) ) ( not ( = ?auto_25149 ?auto_25159 ) ) ( not ( = ?auto_25149 ?auto_25169 ) ) ( not ( = ?auto_25150 ?auto_25159 ) ) ( not ( = ?auto_25150 ?auto_25169 ) ) ( not ( = ?auto_25151 ?auto_25159 ) ) ( not ( = ?auto_25151 ?auto_25169 ) ) ( not ( = ?auto_25152 ?auto_25159 ) ) ( not ( = ?auto_25152 ?auto_25169 ) ) ( not ( = ?auto_25153 ?auto_25159 ) ) ( not ( = ?auto_25153 ?auto_25169 ) ) ( not ( = ?auto_25154 ?auto_25159 ) ) ( not ( = ?auto_25154 ?auto_25169 ) ) ( not ( = ?auto_25155 ?auto_25159 ) ) ( not ( = ?auto_25155 ?auto_25169 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25169 ) ) ( not ( = ?auto_25159 ?auto_25183 ) ) ( not ( = ?auto_25159 ?auto_25176 ) ) ( not ( = ?auto_25159 ?auto_25178 ) ) ( not ( = ?auto_25159 ?auto_25185 ) ) ( not ( = ?auto_25159 ?auto_25192 ) ) ( not ( = ?auto_25159 ?auto_25174 ) ) ( not ( = ?auto_25159 ?auto_25179 ) ) ( not ( = ?auto_25159 ?auto_25190 ) ) ( not ( = ?auto_25159 ?auto_25184 ) ) ( not ( = ?auto_25159 ?auto_25175 ) ) ( not ( = ?auto_25159 ?auto_25177 ) ) ( not ( = ?auto_25159 ?auto_25168 ) ) ( not ( = ?auto_25169 ?auto_25183 ) ) ( not ( = ?auto_25169 ?auto_25176 ) ) ( not ( = ?auto_25169 ?auto_25178 ) ) ( not ( = ?auto_25169 ?auto_25185 ) ) ( not ( = ?auto_25169 ?auto_25192 ) ) ( not ( = ?auto_25169 ?auto_25174 ) ) ( not ( = ?auto_25169 ?auto_25179 ) ) ( not ( = ?auto_25169 ?auto_25190 ) ) ( not ( = ?auto_25169 ?auto_25184 ) ) ( not ( = ?auto_25169 ?auto_25175 ) ) ( not ( = ?auto_25169 ?auto_25177 ) ) ( not ( = ?auto_25169 ?auto_25168 ) ) ( not ( = ?auto_25145 ?auto_25158 ) ) ( not ( = ?auto_25145 ?auto_25160 ) ) ( not ( = ?auto_25146 ?auto_25158 ) ) ( not ( = ?auto_25146 ?auto_25160 ) ) ( not ( = ?auto_25147 ?auto_25158 ) ) ( not ( = ?auto_25147 ?auto_25160 ) ) ( not ( = ?auto_25148 ?auto_25158 ) ) ( not ( = ?auto_25148 ?auto_25160 ) ) ( not ( = ?auto_25149 ?auto_25158 ) ) ( not ( = ?auto_25149 ?auto_25160 ) ) ( not ( = ?auto_25150 ?auto_25158 ) ) ( not ( = ?auto_25150 ?auto_25160 ) ) ( not ( = ?auto_25151 ?auto_25158 ) ) ( not ( = ?auto_25151 ?auto_25160 ) ) ( not ( = ?auto_25152 ?auto_25158 ) ) ( not ( = ?auto_25152 ?auto_25160 ) ) ( not ( = ?auto_25153 ?auto_25158 ) ) ( not ( = ?auto_25153 ?auto_25160 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25154 ?auto_25160 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25160 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25160 ) ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25169 ) ) ( not ( = ?auto_25158 ?auto_25183 ) ) ( not ( = ?auto_25158 ?auto_25176 ) ) ( not ( = ?auto_25158 ?auto_25178 ) ) ( not ( = ?auto_25158 ?auto_25185 ) ) ( not ( = ?auto_25158 ?auto_25192 ) ) ( not ( = ?auto_25158 ?auto_25174 ) ) ( not ( = ?auto_25158 ?auto_25179 ) ) ( not ( = ?auto_25158 ?auto_25190 ) ) ( not ( = ?auto_25158 ?auto_25184 ) ) ( not ( = ?auto_25158 ?auto_25175 ) ) ( not ( = ?auto_25158 ?auto_25177 ) ) ( not ( = ?auto_25158 ?auto_25168 ) ) ( not ( = ?auto_25160 ?auto_25169 ) ) ( not ( = ?auto_25160 ?auto_25183 ) ) ( not ( = ?auto_25160 ?auto_25176 ) ) ( not ( = ?auto_25160 ?auto_25178 ) ) ( not ( = ?auto_25160 ?auto_25185 ) ) ( not ( = ?auto_25160 ?auto_25192 ) ) ( not ( = ?auto_25160 ?auto_25174 ) ) ( not ( = ?auto_25160 ?auto_25179 ) ) ( not ( = ?auto_25160 ?auto_25190 ) ) ( not ( = ?auto_25160 ?auto_25184 ) ) ( not ( = ?auto_25160 ?auto_25175 ) ) ( not ( = ?auto_25160 ?auto_25177 ) ) ( not ( = ?auto_25160 ?auto_25168 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25145 ?auto_25146 ?auto_25147 ?auto_25148 ?auto_25149 ?auto_25150 ?auto_25151 ?auto_25152 ?auto_25153 ?auto_25154 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25159 )
      ( MAKE-1CRATE ?auto_25159 ?auto_25158 )
      ( MAKE-14CRATE-VERIFY ?auto_25145 ?auto_25146 ?auto_25147 ?auto_25148 ?auto_25149 ?auto_25150 ?auto_25151 ?auto_25152 ?auto_25153 ?auto_25154 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25159 ?auto_25158 ) )
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
      ?auto_25226 - SURFACE
      ?auto_25227 - SURFACE
      ?auto_25228 - SURFACE
      ?auto_25229 - SURFACE
      ?auto_25230 - SURFACE
      ?auto_25231 - SURFACE
      ?auto_25233 - SURFACE
      ?auto_25232 - SURFACE
      ?auto_25234 - SURFACE
    )
    :vars
    (
      ?auto_25238 - HOIST
      ?auto_25239 - PLACE
      ?auto_25240 - PLACE
      ?auto_25235 - HOIST
      ?auto_25237 - SURFACE
      ?auto_25265 - PLACE
      ?auto_25246 - HOIST
      ?auto_25261 - SURFACE
      ?auto_25259 - SURFACE
      ?auto_25255 - PLACE
      ?auto_25252 - HOIST
      ?auto_25263 - SURFACE
      ?auto_25242 - PLACE
      ?auto_25244 - HOIST
      ?auto_25249 - SURFACE
      ?auto_25248 - SURFACE
      ?auto_25268 - PLACE
      ?auto_25262 - HOIST
      ?auto_25251 - SURFACE
      ?auto_25257 - SURFACE
      ?auto_25256 - SURFACE
      ?auto_25250 - PLACE
      ?auto_25247 - HOIST
      ?auto_25264 - SURFACE
      ?auto_25258 - SURFACE
      ?auto_25243 - PLACE
      ?auto_25266 - HOIST
      ?auto_25267 - SURFACE
      ?auto_25254 - SURFACE
      ?auto_25245 - PLACE
      ?auto_25241 - HOIST
      ?auto_25260 - SURFACE
      ?auto_25253 - SURFACE
      ?auto_25236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25238 ?auto_25239 ) ( IS-CRATE ?auto_25234 ) ( not ( = ?auto_25240 ?auto_25239 ) ) ( HOIST-AT ?auto_25235 ?auto_25240 ) ( SURFACE-AT ?auto_25234 ?auto_25240 ) ( ON ?auto_25234 ?auto_25237 ) ( CLEAR ?auto_25234 ) ( not ( = ?auto_25232 ?auto_25234 ) ) ( not ( = ?auto_25232 ?auto_25237 ) ) ( not ( = ?auto_25234 ?auto_25237 ) ) ( not ( = ?auto_25238 ?auto_25235 ) ) ( IS-CRATE ?auto_25232 ) ( not ( = ?auto_25265 ?auto_25239 ) ) ( HOIST-AT ?auto_25246 ?auto_25265 ) ( SURFACE-AT ?auto_25232 ?auto_25265 ) ( ON ?auto_25232 ?auto_25261 ) ( CLEAR ?auto_25232 ) ( not ( = ?auto_25233 ?auto_25232 ) ) ( not ( = ?auto_25233 ?auto_25261 ) ) ( not ( = ?auto_25232 ?auto_25261 ) ) ( not ( = ?auto_25238 ?auto_25246 ) ) ( IS-CRATE ?auto_25233 ) ( SURFACE-AT ?auto_25233 ?auto_25240 ) ( ON ?auto_25233 ?auto_25259 ) ( CLEAR ?auto_25233 ) ( not ( = ?auto_25231 ?auto_25233 ) ) ( not ( = ?auto_25231 ?auto_25259 ) ) ( not ( = ?auto_25233 ?auto_25259 ) ) ( IS-CRATE ?auto_25231 ) ( not ( = ?auto_25255 ?auto_25239 ) ) ( HOIST-AT ?auto_25252 ?auto_25255 ) ( SURFACE-AT ?auto_25231 ?auto_25255 ) ( ON ?auto_25231 ?auto_25263 ) ( CLEAR ?auto_25231 ) ( not ( = ?auto_25230 ?auto_25231 ) ) ( not ( = ?auto_25230 ?auto_25263 ) ) ( not ( = ?auto_25231 ?auto_25263 ) ) ( not ( = ?auto_25238 ?auto_25252 ) ) ( IS-CRATE ?auto_25230 ) ( not ( = ?auto_25242 ?auto_25239 ) ) ( HOIST-AT ?auto_25244 ?auto_25242 ) ( AVAILABLE ?auto_25244 ) ( SURFACE-AT ?auto_25230 ?auto_25242 ) ( ON ?auto_25230 ?auto_25249 ) ( CLEAR ?auto_25230 ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25249 ) ) ( not ( = ?auto_25230 ?auto_25249 ) ) ( not ( = ?auto_25238 ?auto_25244 ) ) ( IS-CRATE ?auto_25229 ) ( AVAILABLE ?auto_25252 ) ( SURFACE-AT ?auto_25229 ?auto_25255 ) ( ON ?auto_25229 ?auto_25248 ) ( CLEAR ?auto_25229 ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25248 ) ) ( not ( = ?auto_25229 ?auto_25248 ) ) ( IS-CRATE ?auto_25228 ) ( not ( = ?auto_25268 ?auto_25239 ) ) ( HOIST-AT ?auto_25262 ?auto_25268 ) ( SURFACE-AT ?auto_25228 ?auto_25268 ) ( ON ?auto_25228 ?auto_25251 ) ( CLEAR ?auto_25228 ) ( not ( = ?auto_25227 ?auto_25228 ) ) ( not ( = ?auto_25227 ?auto_25251 ) ) ( not ( = ?auto_25228 ?auto_25251 ) ) ( not ( = ?auto_25238 ?auto_25262 ) ) ( IS-CRATE ?auto_25227 ) ( SURFACE-AT ?auto_25227 ?auto_25265 ) ( ON ?auto_25227 ?auto_25257 ) ( CLEAR ?auto_25227 ) ( not ( = ?auto_25226 ?auto_25227 ) ) ( not ( = ?auto_25226 ?auto_25257 ) ) ( not ( = ?auto_25227 ?auto_25257 ) ) ( IS-CRATE ?auto_25226 ) ( AVAILABLE ?auto_25246 ) ( SURFACE-AT ?auto_25226 ?auto_25265 ) ( ON ?auto_25226 ?auto_25256 ) ( CLEAR ?auto_25226 ) ( not ( = ?auto_25225 ?auto_25226 ) ) ( not ( = ?auto_25225 ?auto_25256 ) ) ( not ( = ?auto_25226 ?auto_25256 ) ) ( IS-CRATE ?auto_25225 ) ( not ( = ?auto_25250 ?auto_25239 ) ) ( HOIST-AT ?auto_25247 ?auto_25250 ) ( SURFACE-AT ?auto_25225 ?auto_25250 ) ( ON ?auto_25225 ?auto_25264 ) ( CLEAR ?auto_25225 ) ( not ( = ?auto_25224 ?auto_25225 ) ) ( not ( = ?auto_25224 ?auto_25264 ) ) ( not ( = ?auto_25225 ?auto_25264 ) ) ( not ( = ?auto_25238 ?auto_25247 ) ) ( IS-CRATE ?auto_25224 ) ( AVAILABLE ?auto_25235 ) ( SURFACE-AT ?auto_25224 ?auto_25240 ) ( ON ?auto_25224 ?auto_25258 ) ( CLEAR ?auto_25224 ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( not ( = ?auto_25223 ?auto_25258 ) ) ( not ( = ?auto_25224 ?auto_25258 ) ) ( IS-CRATE ?auto_25223 ) ( not ( = ?auto_25243 ?auto_25239 ) ) ( HOIST-AT ?auto_25266 ?auto_25243 ) ( AVAILABLE ?auto_25266 ) ( SURFACE-AT ?auto_25223 ?auto_25243 ) ( ON ?auto_25223 ?auto_25267 ) ( CLEAR ?auto_25223 ) ( not ( = ?auto_25222 ?auto_25223 ) ) ( not ( = ?auto_25222 ?auto_25267 ) ) ( not ( = ?auto_25223 ?auto_25267 ) ) ( not ( = ?auto_25238 ?auto_25266 ) ) ( IS-CRATE ?auto_25222 ) ( AVAILABLE ?auto_25247 ) ( SURFACE-AT ?auto_25222 ?auto_25250 ) ( ON ?auto_25222 ?auto_25254 ) ( CLEAR ?auto_25222 ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25254 ) ) ( not ( = ?auto_25222 ?auto_25254 ) ) ( IS-CRATE ?auto_25221 ) ( not ( = ?auto_25245 ?auto_25239 ) ) ( HOIST-AT ?auto_25241 ?auto_25245 ) ( AVAILABLE ?auto_25241 ) ( SURFACE-AT ?auto_25221 ?auto_25245 ) ( ON ?auto_25221 ?auto_25260 ) ( CLEAR ?auto_25221 ) ( not ( = ?auto_25220 ?auto_25221 ) ) ( not ( = ?auto_25220 ?auto_25260 ) ) ( not ( = ?auto_25221 ?auto_25260 ) ) ( not ( = ?auto_25238 ?auto_25241 ) ) ( SURFACE-AT ?auto_25219 ?auto_25239 ) ( CLEAR ?auto_25219 ) ( IS-CRATE ?auto_25220 ) ( AVAILABLE ?auto_25238 ) ( AVAILABLE ?auto_25262 ) ( SURFACE-AT ?auto_25220 ?auto_25268 ) ( ON ?auto_25220 ?auto_25253 ) ( CLEAR ?auto_25220 ) ( TRUCK-AT ?auto_25236 ?auto_25239 ) ( not ( = ?auto_25219 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25253 ) ) ( not ( = ?auto_25220 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25221 ) ) ( not ( = ?auto_25219 ?auto_25260 ) ) ( not ( = ?auto_25221 ?auto_25253 ) ) ( not ( = ?auto_25245 ?auto_25268 ) ) ( not ( = ?auto_25241 ?auto_25262 ) ) ( not ( = ?auto_25260 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25222 ) ) ( not ( = ?auto_25219 ?auto_25254 ) ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25220 ?auto_25254 ) ) ( not ( = ?auto_25222 ?auto_25260 ) ) ( not ( = ?auto_25222 ?auto_25253 ) ) ( not ( = ?auto_25250 ?auto_25245 ) ) ( not ( = ?auto_25250 ?auto_25268 ) ) ( not ( = ?auto_25247 ?auto_25241 ) ) ( not ( = ?auto_25247 ?auto_25262 ) ) ( not ( = ?auto_25254 ?auto_25260 ) ) ( not ( = ?auto_25254 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25223 ) ) ( not ( = ?auto_25219 ?auto_25267 ) ) ( not ( = ?auto_25220 ?auto_25223 ) ) ( not ( = ?auto_25220 ?auto_25267 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25267 ) ) ( not ( = ?auto_25223 ?auto_25254 ) ) ( not ( = ?auto_25223 ?auto_25260 ) ) ( not ( = ?auto_25223 ?auto_25253 ) ) ( not ( = ?auto_25243 ?auto_25250 ) ) ( not ( = ?auto_25243 ?auto_25245 ) ) ( not ( = ?auto_25243 ?auto_25268 ) ) ( not ( = ?auto_25266 ?auto_25247 ) ) ( not ( = ?auto_25266 ?auto_25241 ) ) ( not ( = ?auto_25266 ?auto_25262 ) ) ( not ( = ?auto_25267 ?auto_25254 ) ) ( not ( = ?auto_25267 ?auto_25260 ) ) ( not ( = ?auto_25267 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25224 ) ) ( not ( = ?auto_25219 ?auto_25258 ) ) ( not ( = ?auto_25220 ?auto_25224 ) ) ( not ( = ?auto_25220 ?auto_25258 ) ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( not ( = ?auto_25221 ?auto_25258 ) ) ( not ( = ?auto_25222 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25258 ) ) ( not ( = ?auto_25224 ?auto_25267 ) ) ( not ( = ?auto_25224 ?auto_25254 ) ) ( not ( = ?auto_25224 ?auto_25260 ) ) ( not ( = ?auto_25224 ?auto_25253 ) ) ( not ( = ?auto_25240 ?auto_25243 ) ) ( not ( = ?auto_25240 ?auto_25250 ) ) ( not ( = ?auto_25240 ?auto_25245 ) ) ( not ( = ?auto_25240 ?auto_25268 ) ) ( not ( = ?auto_25235 ?auto_25266 ) ) ( not ( = ?auto_25235 ?auto_25247 ) ) ( not ( = ?auto_25235 ?auto_25241 ) ) ( not ( = ?auto_25235 ?auto_25262 ) ) ( not ( = ?auto_25258 ?auto_25267 ) ) ( not ( = ?auto_25258 ?auto_25254 ) ) ( not ( = ?auto_25258 ?auto_25260 ) ) ( not ( = ?auto_25258 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25225 ) ) ( not ( = ?auto_25219 ?auto_25264 ) ) ( not ( = ?auto_25220 ?auto_25225 ) ) ( not ( = ?auto_25220 ?auto_25264 ) ) ( not ( = ?auto_25221 ?auto_25225 ) ) ( not ( = ?auto_25221 ?auto_25264 ) ) ( not ( = ?auto_25222 ?auto_25225 ) ) ( not ( = ?auto_25222 ?auto_25264 ) ) ( not ( = ?auto_25223 ?auto_25225 ) ) ( not ( = ?auto_25223 ?auto_25264 ) ) ( not ( = ?auto_25225 ?auto_25258 ) ) ( not ( = ?auto_25225 ?auto_25267 ) ) ( not ( = ?auto_25225 ?auto_25254 ) ) ( not ( = ?auto_25225 ?auto_25260 ) ) ( not ( = ?auto_25225 ?auto_25253 ) ) ( not ( = ?auto_25264 ?auto_25258 ) ) ( not ( = ?auto_25264 ?auto_25267 ) ) ( not ( = ?auto_25264 ?auto_25254 ) ) ( not ( = ?auto_25264 ?auto_25260 ) ) ( not ( = ?auto_25264 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25226 ) ) ( not ( = ?auto_25219 ?auto_25256 ) ) ( not ( = ?auto_25220 ?auto_25226 ) ) ( not ( = ?auto_25220 ?auto_25256 ) ) ( not ( = ?auto_25221 ?auto_25226 ) ) ( not ( = ?auto_25221 ?auto_25256 ) ) ( not ( = ?auto_25222 ?auto_25226 ) ) ( not ( = ?auto_25222 ?auto_25256 ) ) ( not ( = ?auto_25223 ?auto_25226 ) ) ( not ( = ?auto_25223 ?auto_25256 ) ) ( not ( = ?auto_25224 ?auto_25226 ) ) ( not ( = ?auto_25224 ?auto_25256 ) ) ( not ( = ?auto_25226 ?auto_25264 ) ) ( not ( = ?auto_25226 ?auto_25258 ) ) ( not ( = ?auto_25226 ?auto_25267 ) ) ( not ( = ?auto_25226 ?auto_25254 ) ) ( not ( = ?auto_25226 ?auto_25260 ) ) ( not ( = ?auto_25226 ?auto_25253 ) ) ( not ( = ?auto_25265 ?auto_25250 ) ) ( not ( = ?auto_25265 ?auto_25240 ) ) ( not ( = ?auto_25265 ?auto_25243 ) ) ( not ( = ?auto_25265 ?auto_25245 ) ) ( not ( = ?auto_25265 ?auto_25268 ) ) ( not ( = ?auto_25246 ?auto_25247 ) ) ( not ( = ?auto_25246 ?auto_25235 ) ) ( not ( = ?auto_25246 ?auto_25266 ) ) ( not ( = ?auto_25246 ?auto_25241 ) ) ( not ( = ?auto_25246 ?auto_25262 ) ) ( not ( = ?auto_25256 ?auto_25264 ) ) ( not ( = ?auto_25256 ?auto_25258 ) ) ( not ( = ?auto_25256 ?auto_25267 ) ) ( not ( = ?auto_25256 ?auto_25254 ) ) ( not ( = ?auto_25256 ?auto_25260 ) ) ( not ( = ?auto_25256 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25227 ) ) ( not ( = ?auto_25219 ?auto_25257 ) ) ( not ( = ?auto_25220 ?auto_25227 ) ) ( not ( = ?auto_25220 ?auto_25257 ) ) ( not ( = ?auto_25221 ?auto_25227 ) ) ( not ( = ?auto_25221 ?auto_25257 ) ) ( not ( = ?auto_25222 ?auto_25227 ) ) ( not ( = ?auto_25222 ?auto_25257 ) ) ( not ( = ?auto_25223 ?auto_25227 ) ) ( not ( = ?auto_25223 ?auto_25257 ) ) ( not ( = ?auto_25224 ?auto_25227 ) ) ( not ( = ?auto_25224 ?auto_25257 ) ) ( not ( = ?auto_25225 ?auto_25227 ) ) ( not ( = ?auto_25225 ?auto_25257 ) ) ( not ( = ?auto_25227 ?auto_25256 ) ) ( not ( = ?auto_25227 ?auto_25264 ) ) ( not ( = ?auto_25227 ?auto_25258 ) ) ( not ( = ?auto_25227 ?auto_25267 ) ) ( not ( = ?auto_25227 ?auto_25254 ) ) ( not ( = ?auto_25227 ?auto_25260 ) ) ( not ( = ?auto_25227 ?auto_25253 ) ) ( not ( = ?auto_25257 ?auto_25256 ) ) ( not ( = ?auto_25257 ?auto_25264 ) ) ( not ( = ?auto_25257 ?auto_25258 ) ) ( not ( = ?auto_25257 ?auto_25267 ) ) ( not ( = ?auto_25257 ?auto_25254 ) ) ( not ( = ?auto_25257 ?auto_25260 ) ) ( not ( = ?auto_25257 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25228 ) ) ( not ( = ?auto_25219 ?auto_25251 ) ) ( not ( = ?auto_25220 ?auto_25228 ) ) ( not ( = ?auto_25220 ?auto_25251 ) ) ( not ( = ?auto_25221 ?auto_25228 ) ) ( not ( = ?auto_25221 ?auto_25251 ) ) ( not ( = ?auto_25222 ?auto_25228 ) ) ( not ( = ?auto_25222 ?auto_25251 ) ) ( not ( = ?auto_25223 ?auto_25228 ) ) ( not ( = ?auto_25223 ?auto_25251 ) ) ( not ( = ?auto_25224 ?auto_25228 ) ) ( not ( = ?auto_25224 ?auto_25251 ) ) ( not ( = ?auto_25225 ?auto_25228 ) ) ( not ( = ?auto_25225 ?auto_25251 ) ) ( not ( = ?auto_25226 ?auto_25228 ) ) ( not ( = ?auto_25226 ?auto_25251 ) ) ( not ( = ?auto_25228 ?auto_25257 ) ) ( not ( = ?auto_25228 ?auto_25256 ) ) ( not ( = ?auto_25228 ?auto_25264 ) ) ( not ( = ?auto_25228 ?auto_25258 ) ) ( not ( = ?auto_25228 ?auto_25267 ) ) ( not ( = ?auto_25228 ?auto_25254 ) ) ( not ( = ?auto_25228 ?auto_25260 ) ) ( not ( = ?auto_25228 ?auto_25253 ) ) ( not ( = ?auto_25251 ?auto_25257 ) ) ( not ( = ?auto_25251 ?auto_25256 ) ) ( not ( = ?auto_25251 ?auto_25264 ) ) ( not ( = ?auto_25251 ?auto_25258 ) ) ( not ( = ?auto_25251 ?auto_25267 ) ) ( not ( = ?auto_25251 ?auto_25254 ) ) ( not ( = ?auto_25251 ?auto_25260 ) ) ( not ( = ?auto_25251 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25229 ) ) ( not ( = ?auto_25219 ?auto_25248 ) ) ( not ( = ?auto_25220 ?auto_25229 ) ) ( not ( = ?auto_25220 ?auto_25248 ) ) ( not ( = ?auto_25221 ?auto_25229 ) ) ( not ( = ?auto_25221 ?auto_25248 ) ) ( not ( = ?auto_25222 ?auto_25229 ) ) ( not ( = ?auto_25222 ?auto_25248 ) ) ( not ( = ?auto_25223 ?auto_25229 ) ) ( not ( = ?auto_25223 ?auto_25248 ) ) ( not ( = ?auto_25224 ?auto_25229 ) ) ( not ( = ?auto_25224 ?auto_25248 ) ) ( not ( = ?auto_25225 ?auto_25229 ) ) ( not ( = ?auto_25225 ?auto_25248 ) ) ( not ( = ?auto_25226 ?auto_25229 ) ) ( not ( = ?auto_25226 ?auto_25248 ) ) ( not ( = ?auto_25227 ?auto_25229 ) ) ( not ( = ?auto_25227 ?auto_25248 ) ) ( not ( = ?auto_25229 ?auto_25251 ) ) ( not ( = ?auto_25229 ?auto_25257 ) ) ( not ( = ?auto_25229 ?auto_25256 ) ) ( not ( = ?auto_25229 ?auto_25264 ) ) ( not ( = ?auto_25229 ?auto_25258 ) ) ( not ( = ?auto_25229 ?auto_25267 ) ) ( not ( = ?auto_25229 ?auto_25254 ) ) ( not ( = ?auto_25229 ?auto_25260 ) ) ( not ( = ?auto_25229 ?auto_25253 ) ) ( not ( = ?auto_25255 ?auto_25268 ) ) ( not ( = ?auto_25255 ?auto_25265 ) ) ( not ( = ?auto_25255 ?auto_25250 ) ) ( not ( = ?auto_25255 ?auto_25240 ) ) ( not ( = ?auto_25255 ?auto_25243 ) ) ( not ( = ?auto_25255 ?auto_25245 ) ) ( not ( = ?auto_25252 ?auto_25262 ) ) ( not ( = ?auto_25252 ?auto_25246 ) ) ( not ( = ?auto_25252 ?auto_25247 ) ) ( not ( = ?auto_25252 ?auto_25235 ) ) ( not ( = ?auto_25252 ?auto_25266 ) ) ( not ( = ?auto_25252 ?auto_25241 ) ) ( not ( = ?auto_25248 ?auto_25251 ) ) ( not ( = ?auto_25248 ?auto_25257 ) ) ( not ( = ?auto_25248 ?auto_25256 ) ) ( not ( = ?auto_25248 ?auto_25264 ) ) ( not ( = ?auto_25248 ?auto_25258 ) ) ( not ( = ?auto_25248 ?auto_25267 ) ) ( not ( = ?auto_25248 ?auto_25254 ) ) ( not ( = ?auto_25248 ?auto_25260 ) ) ( not ( = ?auto_25248 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25230 ) ) ( not ( = ?auto_25219 ?auto_25249 ) ) ( not ( = ?auto_25220 ?auto_25230 ) ) ( not ( = ?auto_25220 ?auto_25249 ) ) ( not ( = ?auto_25221 ?auto_25230 ) ) ( not ( = ?auto_25221 ?auto_25249 ) ) ( not ( = ?auto_25222 ?auto_25230 ) ) ( not ( = ?auto_25222 ?auto_25249 ) ) ( not ( = ?auto_25223 ?auto_25230 ) ) ( not ( = ?auto_25223 ?auto_25249 ) ) ( not ( = ?auto_25224 ?auto_25230 ) ) ( not ( = ?auto_25224 ?auto_25249 ) ) ( not ( = ?auto_25225 ?auto_25230 ) ) ( not ( = ?auto_25225 ?auto_25249 ) ) ( not ( = ?auto_25226 ?auto_25230 ) ) ( not ( = ?auto_25226 ?auto_25249 ) ) ( not ( = ?auto_25227 ?auto_25230 ) ) ( not ( = ?auto_25227 ?auto_25249 ) ) ( not ( = ?auto_25228 ?auto_25230 ) ) ( not ( = ?auto_25228 ?auto_25249 ) ) ( not ( = ?auto_25230 ?auto_25248 ) ) ( not ( = ?auto_25230 ?auto_25251 ) ) ( not ( = ?auto_25230 ?auto_25257 ) ) ( not ( = ?auto_25230 ?auto_25256 ) ) ( not ( = ?auto_25230 ?auto_25264 ) ) ( not ( = ?auto_25230 ?auto_25258 ) ) ( not ( = ?auto_25230 ?auto_25267 ) ) ( not ( = ?auto_25230 ?auto_25254 ) ) ( not ( = ?auto_25230 ?auto_25260 ) ) ( not ( = ?auto_25230 ?auto_25253 ) ) ( not ( = ?auto_25242 ?auto_25255 ) ) ( not ( = ?auto_25242 ?auto_25268 ) ) ( not ( = ?auto_25242 ?auto_25265 ) ) ( not ( = ?auto_25242 ?auto_25250 ) ) ( not ( = ?auto_25242 ?auto_25240 ) ) ( not ( = ?auto_25242 ?auto_25243 ) ) ( not ( = ?auto_25242 ?auto_25245 ) ) ( not ( = ?auto_25244 ?auto_25252 ) ) ( not ( = ?auto_25244 ?auto_25262 ) ) ( not ( = ?auto_25244 ?auto_25246 ) ) ( not ( = ?auto_25244 ?auto_25247 ) ) ( not ( = ?auto_25244 ?auto_25235 ) ) ( not ( = ?auto_25244 ?auto_25266 ) ) ( not ( = ?auto_25244 ?auto_25241 ) ) ( not ( = ?auto_25249 ?auto_25248 ) ) ( not ( = ?auto_25249 ?auto_25251 ) ) ( not ( = ?auto_25249 ?auto_25257 ) ) ( not ( = ?auto_25249 ?auto_25256 ) ) ( not ( = ?auto_25249 ?auto_25264 ) ) ( not ( = ?auto_25249 ?auto_25258 ) ) ( not ( = ?auto_25249 ?auto_25267 ) ) ( not ( = ?auto_25249 ?auto_25254 ) ) ( not ( = ?auto_25249 ?auto_25260 ) ) ( not ( = ?auto_25249 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25231 ) ) ( not ( = ?auto_25219 ?auto_25263 ) ) ( not ( = ?auto_25220 ?auto_25231 ) ) ( not ( = ?auto_25220 ?auto_25263 ) ) ( not ( = ?auto_25221 ?auto_25231 ) ) ( not ( = ?auto_25221 ?auto_25263 ) ) ( not ( = ?auto_25222 ?auto_25231 ) ) ( not ( = ?auto_25222 ?auto_25263 ) ) ( not ( = ?auto_25223 ?auto_25231 ) ) ( not ( = ?auto_25223 ?auto_25263 ) ) ( not ( = ?auto_25224 ?auto_25231 ) ) ( not ( = ?auto_25224 ?auto_25263 ) ) ( not ( = ?auto_25225 ?auto_25231 ) ) ( not ( = ?auto_25225 ?auto_25263 ) ) ( not ( = ?auto_25226 ?auto_25231 ) ) ( not ( = ?auto_25226 ?auto_25263 ) ) ( not ( = ?auto_25227 ?auto_25231 ) ) ( not ( = ?auto_25227 ?auto_25263 ) ) ( not ( = ?auto_25228 ?auto_25231 ) ) ( not ( = ?auto_25228 ?auto_25263 ) ) ( not ( = ?auto_25229 ?auto_25231 ) ) ( not ( = ?auto_25229 ?auto_25263 ) ) ( not ( = ?auto_25231 ?auto_25249 ) ) ( not ( = ?auto_25231 ?auto_25248 ) ) ( not ( = ?auto_25231 ?auto_25251 ) ) ( not ( = ?auto_25231 ?auto_25257 ) ) ( not ( = ?auto_25231 ?auto_25256 ) ) ( not ( = ?auto_25231 ?auto_25264 ) ) ( not ( = ?auto_25231 ?auto_25258 ) ) ( not ( = ?auto_25231 ?auto_25267 ) ) ( not ( = ?auto_25231 ?auto_25254 ) ) ( not ( = ?auto_25231 ?auto_25260 ) ) ( not ( = ?auto_25231 ?auto_25253 ) ) ( not ( = ?auto_25263 ?auto_25249 ) ) ( not ( = ?auto_25263 ?auto_25248 ) ) ( not ( = ?auto_25263 ?auto_25251 ) ) ( not ( = ?auto_25263 ?auto_25257 ) ) ( not ( = ?auto_25263 ?auto_25256 ) ) ( not ( = ?auto_25263 ?auto_25264 ) ) ( not ( = ?auto_25263 ?auto_25258 ) ) ( not ( = ?auto_25263 ?auto_25267 ) ) ( not ( = ?auto_25263 ?auto_25254 ) ) ( not ( = ?auto_25263 ?auto_25260 ) ) ( not ( = ?auto_25263 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25233 ) ) ( not ( = ?auto_25219 ?auto_25259 ) ) ( not ( = ?auto_25220 ?auto_25233 ) ) ( not ( = ?auto_25220 ?auto_25259 ) ) ( not ( = ?auto_25221 ?auto_25233 ) ) ( not ( = ?auto_25221 ?auto_25259 ) ) ( not ( = ?auto_25222 ?auto_25233 ) ) ( not ( = ?auto_25222 ?auto_25259 ) ) ( not ( = ?auto_25223 ?auto_25233 ) ) ( not ( = ?auto_25223 ?auto_25259 ) ) ( not ( = ?auto_25224 ?auto_25233 ) ) ( not ( = ?auto_25224 ?auto_25259 ) ) ( not ( = ?auto_25225 ?auto_25233 ) ) ( not ( = ?auto_25225 ?auto_25259 ) ) ( not ( = ?auto_25226 ?auto_25233 ) ) ( not ( = ?auto_25226 ?auto_25259 ) ) ( not ( = ?auto_25227 ?auto_25233 ) ) ( not ( = ?auto_25227 ?auto_25259 ) ) ( not ( = ?auto_25228 ?auto_25233 ) ) ( not ( = ?auto_25228 ?auto_25259 ) ) ( not ( = ?auto_25229 ?auto_25233 ) ) ( not ( = ?auto_25229 ?auto_25259 ) ) ( not ( = ?auto_25230 ?auto_25233 ) ) ( not ( = ?auto_25230 ?auto_25259 ) ) ( not ( = ?auto_25233 ?auto_25263 ) ) ( not ( = ?auto_25233 ?auto_25249 ) ) ( not ( = ?auto_25233 ?auto_25248 ) ) ( not ( = ?auto_25233 ?auto_25251 ) ) ( not ( = ?auto_25233 ?auto_25257 ) ) ( not ( = ?auto_25233 ?auto_25256 ) ) ( not ( = ?auto_25233 ?auto_25264 ) ) ( not ( = ?auto_25233 ?auto_25258 ) ) ( not ( = ?auto_25233 ?auto_25267 ) ) ( not ( = ?auto_25233 ?auto_25254 ) ) ( not ( = ?auto_25233 ?auto_25260 ) ) ( not ( = ?auto_25233 ?auto_25253 ) ) ( not ( = ?auto_25259 ?auto_25263 ) ) ( not ( = ?auto_25259 ?auto_25249 ) ) ( not ( = ?auto_25259 ?auto_25248 ) ) ( not ( = ?auto_25259 ?auto_25251 ) ) ( not ( = ?auto_25259 ?auto_25257 ) ) ( not ( = ?auto_25259 ?auto_25256 ) ) ( not ( = ?auto_25259 ?auto_25264 ) ) ( not ( = ?auto_25259 ?auto_25258 ) ) ( not ( = ?auto_25259 ?auto_25267 ) ) ( not ( = ?auto_25259 ?auto_25254 ) ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25259 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25232 ) ) ( not ( = ?auto_25219 ?auto_25261 ) ) ( not ( = ?auto_25220 ?auto_25232 ) ) ( not ( = ?auto_25220 ?auto_25261 ) ) ( not ( = ?auto_25221 ?auto_25232 ) ) ( not ( = ?auto_25221 ?auto_25261 ) ) ( not ( = ?auto_25222 ?auto_25232 ) ) ( not ( = ?auto_25222 ?auto_25261 ) ) ( not ( = ?auto_25223 ?auto_25232 ) ) ( not ( = ?auto_25223 ?auto_25261 ) ) ( not ( = ?auto_25224 ?auto_25232 ) ) ( not ( = ?auto_25224 ?auto_25261 ) ) ( not ( = ?auto_25225 ?auto_25232 ) ) ( not ( = ?auto_25225 ?auto_25261 ) ) ( not ( = ?auto_25226 ?auto_25232 ) ) ( not ( = ?auto_25226 ?auto_25261 ) ) ( not ( = ?auto_25227 ?auto_25232 ) ) ( not ( = ?auto_25227 ?auto_25261 ) ) ( not ( = ?auto_25228 ?auto_25232 ) ) ( not ( = ?auto_25228 ?auto_25261 ) ) ( not ( = ?auto_25229 ?auto_25232 ) ) ( not ( = ?auto_25229 ?auto_25261 ) ) ( not ( = ?auto_25230 ?auto_25232 ) ) ( not ( = ?auto_25230 ?auto_25261 ) ) ( not ( = ?auto_25231 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25261 ) ) ( not ( = ?auto_25232 ?auto_25259 ) ) ( not ( = ?auto_25232 ?auto_25263 ) ) ( not ( = ?auto_25232 ?auto_25249 ) ) ( not ( = ?auto_25232 ?auto_25248 ) ) ( not ( = ?auto_25232 ?auto_25251 ) ) ( not ( = ?auto_25232 ?auto_25257 ) ) ( not ( = ?auto_25232 ?auto_25256 ) ) ( not ( = ?auto_25232 ?auto_25264 ) ) ( not ( = ?auto_25232 ?auto_25258 ) ) ( not ( = ?auto_25232 ?auto_25267 ) ) ( not ( = ?auto_25232 ?auto_25254 ) ) ( not ( = ?auto_25232 ?auto_25260 ) ) ( not ( = ?auto_25232 ?auto_25253 ) ) ( not ( = ?auto_25261 ?auto_25259 ) ) ( not ( = ?auto_25261 ?auto_25263 ) ) ( not ( = ?auto_25261 ?auto_25249 ) ) ( not ( = ?auto_25261 ?auto_25248 ) ) ( not ( = ?auto_25261 ?auto_25251 ) ) ( not ( = ?auto_25261 ?auto_25257 ) ) ( not ( = ?auto_25261 ?auto_25256 ) ) ( not ( = ?auto_25261 ?auto_25264 ) ) ( not ( = ?auto_25261 ?auto_25258 ) ) ( not ( = ?auto_25261 ?auto_25267 ) ) ( not ( = ?auto_25261 ?auto_25254 ) ) ( not ( = ?auto_25261 ?auto_25260 ) ) ( not ( = ?auto_25261 ?auto_25253 ) ) ( not ( = ?auto_25219 ?auto_25234 ) ) ( not ( = ?auto_25219 ?auto_25237 ) ) ( not ( = ?auto_25220 ?auto_25234 ) ) ( not ( = ?auto_25220 ?auto_25237 ) ) ( not ( = ?auto_25221 ?auto_25234 ) ) ( not ( = ?auto_25221 ?auto_25237 ) ) ( not ( = ?auto_25222 ?auto_25234 ) ) ( not ( = ?auto_25222 ?auto_25237 ) ) ( not ( = ?auto_25223 ?auto_25234 ) ) ( not ( = ?auto_25223 ?auto_25237 ) ) ( not ( = ?auto_25224 ?auto_25234 ) ) ( not ( = ?auto_25224 ?auto_25237 ) ) ( not ( = ?auto_25225 ?auto_25234 ) ) ( not ( = ?auto_25225 ?auto_25237 ) ) ( not ( = ?auto_25226 ?auto_25234 ) ) ( not ( = ?auto_25226 ?auto_25237 ) ) ( not ( = ?auto_25227 ?auto_25234 ) ) ( not ( = ?auto_25227 ?auto_25237 ) ) ( not ( = ?auto_25228 ?auto_25234 ) ) ( not ( = ?auto_25228 ?auto_25237 ) ) ( not ( = ?auto_25229 ?auto_25234 ) ) ( not ( = ?auto_25229 ?auto_25237 ) ) ( not ( = ?auto_25230 ?auto_25234 ) ) ( not ( = ?auto_25230 ?auto_25237 ) ) ( not ( = ?auto_25231 ?auto_25234 ) ) ( not ( = ?auto_25231 ?auto_25237 ) ) ( not ( = ?auto_25233 ?auto_25234 ) ) ( not ( = ?auto_25233 ?auto_25237 ) ) ( not ( = ?auto_25234 ?auto_25261 ) ) ( not ( = ?auto_25234 ?auto_25259 ) ) ( not ( = ?auto_25234 ?auto_25263 ) ) ( not ( = ?auto_25234 ?auto_25249 ) ) ( not ( = ?auto_25234 ?auto_25248 ) ) ( not ( = ?auto_25234 ?auto_25251 ) ) ( not ( = ?auto_25234 ?auto_25257 ) ) ( not ( = ?auto_25234 ?auto_25256 ) ) ( not ( = ?auto_25234 ?auto_25264 ) ) ( not ( = ?auto_25234 ?auto_25258 ) ) ( not ( = ?auto_25234 ?auto_25267 ) ) ( not ( = ?auto_25234 ?auto_25254 ) ) ( not ( = ?auto_25234 ?auto_25260 ) ) ( not ( = ?auto_25234 ?auto_25253 ) ) ( not ( = ?auto_25237 ?auto_25261 ) ) ( not ( = ?auto_25237 ?auto_25259 ) ) ( not ( = ?auto_25237 ?auto_25263 ) ) ( not ( = ?auto_25237 ?auto_25249 ) ) ( not ( = ?auto_25237 ?auto_25248 ) ) ( not ( = ?auto_25237 ?auto_25251 ) ) ( not ( = ?auto_25237 ?auto_25257 ) ) ( not ( = ?auto_25237 ?auto_25256 ) ) ( not ( = ?auto_25237 ?auto_25264 ) ) ( not ( = ?auto_25237 ?auto_25258 ) ) ( not ( = ?auto_25237 ?auto_25267 ) ) ( not ( = ?auto_25237 ?auto_25254 ) ) ( not ( = ?auto_25237 ?auto_25260 ) ) ( not ( = ?auto_25237 ?auto_25253 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25222 ?auto_25223 ?auto_25224 ?auto_25225 ?auto_25226 ?auto_25227 ?auto_25228 ?auto_25229 ?auto_25230 ?auto_25231 ?auto_25233 ?auto_25232 )
      ( MAKE-1CRATE ?auto_25232 ?auto_25234 )
      ( MAKE-15CRATE-VERIFY ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25222 ?auto_25223 ?auto_25224 ?auto_25225 ?auto_25226 ?auto_25227 ?auto_25228 ?auto_25229 ?auto_25230 ?auto_25231 ?auto_25233 ?auto_25232 ?auto_25234 ) )
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
      ?auto_25303 - SURFACE
      ?auto_25304 - SURFACE
      ?auto_25305 - SURFACE
      ?auto_25306 - SURFACE
      ?auto_25307 - SURFACE
      ?auto_25308 - SURFACE
      ?auto_25310 - SURFACE
      ?auto_25309 - SURFACE
      ?auto_25312 - SURFACE
      ?auto_25311 - SURFACE
    )
    :vars
    (
      ?auto_25314 - HOIST
      ?auto_25313 - PLACE
      ?auto_25315 - PLACE
      ?auto_25318 - HOIST
      ?auto_25317 - SURFACE
      ?auto_25336 - PLACE
      ?auto_25322 - HOIST
      ?auto_25341 - SURFACE
      ?auto_25321 - PLACE
      ?auto_25342 - HOIST
      ?auto_25335 - SURFACE
      ?auto_25329 - SURFACE
      ?auto_25338 - PLACE
      ?auto_25333 - HOIST
      ?auto_25330 - SURFACE
      ?auto_25347 - PLACE
      ?auto_25325 - HOIST
      ?auto_25346 - SURFACE
      ?auto_25345 - SURFACE
      ?auto_25337 - PLACE
      ?auto_25339 - HOIST
      ?auto_25344 - SURFACE
      ?auto_25323 - SURFACE
      ?auto_25331 - SURFACE
      ?auto_25349 - PLACE
      ?auto_25324 - HOIST
      ?auto_25328 - SURFACE
      ?auto_25340 - SURFACE
      ?auto_25348 - PLACE
      ?auto_25332 - HOIST
      ?auto_25319 - SURFACE
      ?auto_25326 - SURFACE
      ?auto_25343 - PLACE
      ?auto_25327 - HOIST
      ?auto_25320 - SURFACE
      ?auto_25334 - SURFACE
      ?auto_25316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25314 ?auto_25313 ) ( IS-CRATE ?auto_25311 ) ( not ( = ?auto_25315 ?auto_25313 ) ) ( HOIST-AT ?auto_25318 ?auto_25315 ) ( AVAILABLE ?auto_25318 ) ( SURFACE-AT ?auto_25311 ?auto_25315 ) ( ON ?auto_25311 ?auto_25317 ) ( CLEAR ?auto_25311 ) ( not ( = ?auto_25312 ?auto_25311 ) ) ( not ( = ?auto_25312 ?auto_25317 ) ) ( not ( = ?auto_25311 ?auto_25317 ) ) ( not ( = ?auto_25314 ?auto_25318 ) ) ( IS-CRATE ?auto_25312 ) ( not ( = ?auto_25336 ?auto_25313 ) ) ( HOIST-AT ?auto_25322 ?auto_25336 ) ( SURFACE-AT ?auto_25312 ?auto_25336 ) ( ON ?auto_25312 ?auto_25341 ) ( CLEAR ?auto_25312 ) ( not ( = ?auto_25309 ?auto_25312 ) ) ( not ( = ?auto_25309 ?auto_25341 ) ) ( not ( = ?auto_25312 ?auto_25341 ) ) ( not ( = ?auto_25314 ?auto_25322 ) ) ( IS-CRATE ?auto_25309 ) ( not ( = ?auto_25321 ?auto_25313 ) ) ( HOIST-AT ?auto_25342 ?auto_25321 ) ( SURFACE-AT ?auto_25309 ?auto_25321 ) ( ON ?auto_25309 ?auto_25335 ) ( CLEAR ?auto_25309 ) ( not ( = ?auto_25310 ?auto_25309 ) ) ( not ( = ?auto_25310 ?auto_25335 ) ) ( not ( = ?auto_25309 ?auto_25335 ) ) ( not ( = ?auto_25314 ?auto_25342 ) ) ( IS-CRATE ?auto_25310 ) ( SURFACE-AT ?auto_25310 ?auto_25336 ) ( ON ?auto_25310 ?auto_25329 ) ( CLEAR ?auto_25310 ) ( not ( = ?auto_25308 ?auto_25310 ) ) ( not ( = ?auto_25308 ?auto_25329 ) ) ( not ( = ?auto_25310 ?auto_25329 ) ) ( IS-CRATE ?auto_25308 ) ( not ( = ?auto_25338 ?auto_25313 ) ) ( HOIST-AT ?auto_25333 ?auto_25338 ) ( SURFACE-AT ?auto_25308 ?auto_25338 ) ( ON ?auto_25308 ?auto_25330 ) ( CLEAR ?auto_25308 ) ( not ( = ?auto_25307 ?auto_25308 ) ) ( not ( = ?auto_25307 ?auto_25330 ) ) ( not ( = ?auto_25308 ?auto_25330 ) ) ( not ( = ?auto_25314 ?auto_25333 ) ) ( IS-CRATE ?auto_25307 ) ( not ( = ?auto_25347 ?auto_25313 ) ) ( HOIST-AT ?auto_25325 ?auto_25347 ) ( AVAILABLE ?auto_25325 ) ( SURFACE-AT ?auto_25307 ?auto_25347 ) ( ON ?auto_25307 ?auto_25346 ) ( CLEAR ?auto_25307 ) ( not ( = ?auto_25306 ?auto_25307 ) ) ( not ( = ?auto_25306 ?auto_25346 ) ) ( not ( = ?auto_25307 ?auto_25346 ) ) ( not ( = ?auto_25314 ?auto_25325 ) ) ( IS-CRATE ?auto_25306 ) ( AVAILABLE ?auto_25333 ) ( SURFACE-AT ?auto_25306 ?auto_25338 ) ( ON ?auto_25306 ?auto_25345 ) ( CLEAR ?auto_25306 ) ( not ( = ?auto_25305 ?auto_25306 ) ) ( not ( = ?auto_25305 ?auto_25345 ) ) ( not ( = ?auto_25306 ?auto_25345 ) ) ( IS-CRATE ?auto_25305 ) ( not ( = ?auto_25337 ?auto_25313 ) ) ( HOIST-AT ?auto_25339 ?auto_25337 ) ( SURFACE-AT ?auto_25305 ?auto_25337 ) ( ON ?auto_25305 ?auto_25344 ) ( CLEAR ?auto_25305 ) ( not ( = ?auto_25304 ?auto_25305 ) ) ( not ( = ?auto_25304 ?auto_25344 ) ) ( not ( = ?auto_25305 ?auto_25344 ) ) ( not ( = ?auto_25314 ?auto_25339 ) ) ( IS-CRATE ?auto_25304 ) ( SURFACE-AT ?auto_25304 ?auto_25321 ) ( ON ?auto_25304 ?auto_25323 ) ( CLEAR ?auto_25304 ) ( not ( = ?auto_25303 ?auto_25304 ) ) ( not ( = ?auto_25303 ?auto_25323 ) ) ( not ( = ?auto_25304 ?auto_25323 ) ) ( IS-CRATE ?auto_25303 ) ( AVAILABLE ?auto_25342 ) ( SURFACE-AT ?auto_25303 ?auto_25321 ) ( ON ?auto_25303 ?auto_25331 ) ( CLEAR ?auto_25303 ) ( not ( = ?auto_25302 ?auto_25303 ) ) ( not ( = ?auto_25302 ?auto_25331 ) ) ( not ( = ?auto_25303 ?auto_25331 ) ) ( IS-CRATE ?auto_25302 ) ( not ( = ?auto_25349 ?auto_25313 ) ) ( HOIST-AT ?auto_25324 ?auto_25349 ) ( SURFACE-AT ?auto_25302 ?auto_25349 ) ( ON ?auto_25302 ?auto_25328 ) ( CLEAR ?auto_25302 ) ( not ( = ?auto_25301 ?auto_25302 ) ) ( not ( = ?auto_25301 ?auto_25328 ) ) ( not ( = ?auto_25302 ?auto_25328 ) ) ( not ( = ?auto_25314 ?auto_25324 ) ) ( IS-CRATE ?auto_25301 ) ( AVAILABLE ?auto_25322 ) ( SURFACE-AT ?auto_25301 ?auto_25336 ) ( ON ?auto_25301 ?auto_25340 ) ( CLEAR ?auto_25301 ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( not ( = ?auto_25300 ?auto_25340 ) ) ( not ( = ?auto_25301 ?auto_25340 ) ) ( IS-CRATE ?auto_25300 ) ( not ( = ?auto_25348 ?auto_25313 ) ) ( HOIST-AT ?auto_25332 ?auto_25348 ) ( AVAILABLE ?auto_25332 ) ( SURFACE-AT ?auto_25300 ?auto_25348 ) ( ON ?auto_25300 ?auto_25319 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25319 ) ) ( not ( = ?auto_25300 ?auto_25319 ) ) ( not ( = ?auto_25314 ?auto_25332 ) ) ( IS-CRATE ?auto_25299 ) ( AVAILABLE ?auto_25324 ) ( SURFACE-AT ?auto_25299 ?auto_25349 ) ( ON ?auto_25299 ?auto_25326 ) ( CLEAR ?auto_25299 ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25326 ) ) ( not ( = ?auto_25299 ?auto_25326 ) ) ( IS-CRATE ?auto_25298 ) ( not ( = ?auto_25343 ?auto_25313 ) ) ( HOIST-AT ?auto_25327 ?auto_25343 ) ( AVAILABLE ?auto_25327 ) ( SURFACE-AT ?auto_25298 ?auto_25343 ) ( ON ?auto_25298 ?auto_25320 ) ( CLEAR ?auto_25298 ) ( not ( = ?auto_25297 ?auto_25298 ) ) ( not ( = ?auto_25297 ?auto_25320 ) ) ( not ( = ?auto_25298 ?auto_25320 ) ) ( not ( = ?auto_25314 ?auto_25327 ) ) ( SURFACE-AT ?auto_25296 ?auto_25313 ) ( CLEAR ?auto_25296 ) ( IS-CRATE ?auto_25297 ) ( AVAILABLE ?auto_25314 ) ( AVAILABLE ?auto_25339 ) ( SURFACE-AT ?auto_25297 ?auto_25337 ) ( ON ?auto_25297 ?auto_25334 ) ( CLEAR ?auto_25297 ) ( TRUCK-AT ?auto_25316 ?auto_25313 ) ( not ( = ?auto_25296 ?auto_25297 ) ) ( not ( = ?auto_25296 ?auto_25334 ) ) ( not ( = ?auto_25297 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25298 ) ) ( not ( = ?auto_25296 ?auto_25320 ) ) ( not ( = ?auto_25298 ?auto_25334 ) ) ( not ( = ?auto_25343 ?auto_25337 ) ) ( not ( = ?auto_25327 ?auto_25339 ) ) ( not ( = ?auto_25320 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25299 ) ) ( not ( = ?auto_25296 ?auto_25326 ) ) ( not ( = ?auto_25297 ?auto_25299 ) ) ( not ( = ?auto_25297 ?auto_25326 ) ) ( not ( = ?auto_25299 ?auto_25320 ) ) ( not ( = ?auto_25299 ?auto_25334 ) ) ( not ( = ?auto_25349 ?auto_25343 ) ) ( not ( = ?auto_25349 ?auto_25337 ) ) ( not ( = ?auto_25324 ?auto_25327 ) ) ( not ( = ?auto_25324 ?auto_25339 ) ) ( not ( = ?auto_25326 ?auto_25320 ) ) ( not ( = ?auto_25326 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25300 ) ) ( not ( = ?auto_25296 ?auto_25319 ) ) ( not ( = ?auto_25297 ?auto_25300 ) ) ( not ( = ?auto_25297 ?auto_25319 ) ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25298 ?auto_25319 ) ) ( not ( = ?auto_25300 ?auto_25326 ) ) ( not ( = ?auto_25300 ?auto_25320 ) ) ( not ( = ?auto_25300 ?auto_25334 ) ) ( not ( = ?auto_25348 ?auto_25349 ) ) ( not ( = ?auto_25348 ?auto_25343 ) ) ( not ( = ?auto_25348 ?auto_25337 ) ) ( not ( = ?auto_25332 ?auto_25324 ) ) ( not ( = ?auto_25332 ?auto_25327 ) ) ( not ( = ?auto_25332 ?auto_25339 ) ) ( not ( = ?auto_25319 ?auto_25326 ) ) ( not ( = ?auto_25319 ?auto_25320 ) ) ( not ( = ?auto_25319 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25301 ) ) ( not ( = ?auto_25296 ?auto_25340 ) ) ( not ( = ?auto_25297 ?auto_25301 ) ) ( not ( = ?auto_25297 ?auto_25340 ) ) ( not ( = ?auto_25298 ?auto_25301 ) ) ( not ( = ?auto_25298 ?auto_25340 ) ) ( not ( = ?auto_25299 ?auto_25301 ) ) ( not ( = ?auto_25299 ?auto_25340 ) ) ( not ( = ?auto_25301 ?auto_25319 ) ) ( not ( = ?auto_25301 ?auto_25326 ) ) ( not ( = ?auto_25301 ?auto_25320 ) ) ( not ( = ?auto_25301 ?auto_25334 ) ) ( not ( = ?auto_25336 ?auto_25348 ) ) ( not ( = ?auto_25336 ?auto_25349 ) ) ( not ( = ?auto_25336 ?auto_25343 ) ) ( not ( = ?auto_25336 ?auto_25337 ) ) ( not ( = ?auto_25322 ?auto_25332 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25327 ) ) ( not ( = ?auto_25322 ?auto_25339 ) ) ( not ( = ?auto_25340 ?auto_25319 ) ) ( not ( = ?auto_25340 ?auto_25326 ) ) ( not ( = ?auto_25340 ?auto_25320 ) ) ( not ( = ?auto_25340 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25302 ) ) ( not ( = ?auto_25296 ?auto_25328 ) ) ( not ( = ?auto_25297 ?auto_25302 ) ) ( not ( = ?auto_25297 ?auto_25328 ) ) ( not ( = ?auto_25298 ?auto_25302 ) ) ( not ( = ?auto_25298 ?auto_25328 ) ) ( not ( = ?auto_25299 ?auto_25302 ) ) ( not ( = ?auto_25299 ?auto_25328 ) ) ( not ( = ?auto_25300 ?auto_25302 ) ) ( not ( = ?auto_25300 ?auto_25328 ) ) ( not ( = ?auto_25302 ?auto_25340 ) ) ( not ( = ?auto_25302 ?auto_25319 ) ) ( not ( = ?auto_25302 ?auto_25326 ) ) ( not ( = ?auto_25302 ?auto_25320 ) ) ( not ( = ?auto_25302 ?auto_25334 ) ) ( not ( = ?auto_25328 ?auto_25340 ) ) ( not ( = ?auto_25328 ?auto_25319 ) ) ( not ( = ?auto_25328 ?auto_25326 ) ) ( not ( = ?auto_25328 ?auto_25320 ) ) ( not ( = ?auto_25328 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25303 ) ) ( not ( = ?auto_25296 ?auto_25331 ) ) ( not ( = ?auto_25297 ?auto_25303 ) ) ( not ( = ?auto_25297 ?auto_25331 ) ) ( not ( = ?auto_25298 ?auto_25303 ) ) ( not ( = ?auto_25298 ?auto_25331 ) ) ( not ( = ?auto_25299 ?auto_25303 ) ) ( not ( = ?auto_25299 ?auto_25331 ) ) ( not ( = ?auto_25300 ?auto_25303 ) ) ( not ( = ?auto_25300 ?auto_25331 ) ) ( not ( = ?auto_25301 ?auto_25303 ) ) ( not ( = ?auto_25301 ?auto_25331 ) ) ( not ( = ?auto_25303 ?auto_25328 ) ) ( not ( = ?auto_25303 ?auto_25340 ) ) ( not ( = ?auto_25303 ?auto_25319 ) ) ( not ( = ?auto_25303 ?auto_25326 ) ) ( not ( = ?auto_25303 ?auto_25320 ) ) ( not ( = ?auto_25303 ?auto_25334 ) ) ( not ( = ?auto_25321 ?auto_25349 ) ) ( not ( = ?auto_25321 ?auto_25336 ) ) ( not ( = ?auto_25321 ?auto_25348 ) ) ( not ( = ?auto_25321 ?auto_25343 ) ) ( not ( = ?auto_25321 ?auto_25337 ) ) ( not ( = ?auto_25342 ?auto_25324 ) ) ( not ( = ?auto_25342 ?auto_25322 ) ) ( not ( = ?auto_25342 ?auto_25332 ) ) ( not ( = ?auto_25342 ?auto_25327 ) ) ( not ( = ?auto_25342 ?auto_25339 ) ) ( not ( = ?auto_25331 ?auto_25328 ) ) ( not ( = ?auto_25331 ?auto_25340 ) ) ( not ( = ?auto_25331 ?auto_25319 ) ) ( not ( = ?auto_25331 ?auto_25326 ) ) ( not ( = ?auto_25331 ?auto_25320 ) ) ( not ( = ?auto_25331 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25304 ) ) ( not ( = ?auto_25296 ?auto_25323 ) ) ( not ( = ?auto_25297 ?auto_25304 ) ) ( not ( = ?auto_25297 ?auto_25323 ) ) ( not ( = ?auto_25298 ?auto_25304 ) ) ( not ( = ?auto_25298 ?auto_25323 ) ) ( not ( = ?auto_25299 ?auto_25304 ) ) ( not ( = ?auto_25299 ?auto_25323 ) ) ( not ( = ?auto_25300 ?auto_25304 ) ) ( not ( = ?auto_25300 ?auto_25323 ) ) ( not ( = ?auto_25301 ?auto_25304 ) ) ( not ( = ?auto_25301 ?auto_25323 ) ) ( not ( = ?auto_25302 ?auto_25304 ) ) ( not ( = ?auto_25302 ?auto_25323 ) ) ( not ( = ?auto_25304 ?auto_25331 ) ) ( not ( = ?auto_25304 ?auto_25328 ) ) ( not ( = ?auto_25304 ?auto_25340 ) ) ( not ( = ?auto_25304 ?auto_25319 ) ) ( not ( = ?auto_25304 ?auto_25326 ) ) ( not ( = ?auto_25304 ?auto_25320 ) ) ( not ( = ?auto_25304 ?auto_25334 ) ) ( not ( = ?auto_25323 ?auto_25331 ) ) ( not ( = ?auto_25323 ?auto_25328 ) ) ( not ( = ?auto_25323 ?auto_25340 ) ) ( not ( = ?auto_25323 ?auto_25319 ) ) ( not ( = ?auto_25323 ?auto_25326 ) ) ( not ( = ?auto_25323 ?auto_25320 ) ) ( not ( = ?auto_25323 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25305 ) ) ( not ( = ?auto_25296 ?auto_25344 ) ) ( not ( = ?auto_25297 ?auto_25305 ) ) ( not ( = ?auto_25297 ?auto_25344 ) ) ( not ( = ?auto_25298 ?auto_25305 ) ) ( not ( = ?auto_25298 ?auto_25344 ) ) ( not ( = ?auto_25299 ?auto_25305 ) ) ( not ( = ?auto_25299 ?auto_25344 ) ) ( not ( = ?auto_25300 ?auto_25305 ) ) ( not ( = ?auto_25300 ?auto_25344 ) ) ( not ( = ?auto_25301 ?auto_25305 ) ) ( not ( = ?auto_25301 ?auto_25344 ) ) ( not ( = ?auto_25302 ?auto_25305 ) ) ( not ( = ?auto_25302 ?auto_25344 ) ) ( not ( = ?auto_25303 ?auto_25305 ) ) ( not ( = ?auto_25303 ?auto_25344 ) ) ( not ( = ?auto_25305 ?auto_25323 ) ) ( not ( = ?auto_25305 ?auto_25331 ) ) ( not ( = ?auto_25305 ?auto_25328 ) ) ( not ( = ?auto_25305 ?auto_25340 ) ) ( not ( = ?auto_25305 ?auto_25319 ) ) ( not ( = ?auto_25305 ?auto_25326 ) ) ( not ( = ?auto_25305 ?auto_25320 ) ) ( not ( = ?auto_25305 ?auto_25334 ) ) ( not ( = ?auto_25344 ?auto_25323 ) ) ( not ( = ?auto_25344 ?auto_25331 ) ) ( not ( = ?auto_25344 ?auto_25328 ) ) ( not ( = ?auto_25344 ?auto_25340 ) ) ( not ( = ?auto_25344 ?auto_25319 ) ) ( not ( = ?auto_25344 ?auto_25326 ) ) ( not ( = ?auto_25344 ?auto_25320 ) ) ( not ( = ?auto_25344 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25306 ) ) ( not ( = ?auto_25296 ?auto_25345 ) ) ( not ( = ?auto_25297 ?auto_25306 ) ) ( not ( = ?auto_25297 ?auto_25345 ) ) ( not ( = ?auto_25298 ?auto_25306 ) ) ( not ( = ?auto_25298 ?auto_25345 ) ) ( not ( = ?auto_25299 ?auto_25306 ) ) ( not ( = ?auto_25299 ?auto_25345 ) ) ( not ( = ?auto_25300 ?auto_25306 ) ) ( not ( = ?auto_25300 ?auto_25345 ) ) ( not ( = ?auto_25301 ?auto_25306 ) ) ( not ( = ?auto_25301 ?auto_25345 ) ) ( not ( = ?auto_25302 ?auto_25306 ) ) ( not ( = ?auto_25302 ?auto_25345 ) ) ( not ( = ?auto_25303 ?auto_25306 ) ) ( not ( = ?auto_25303 ?auto_25345 ) ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25304 ?auto_25345 ) ) ( not ( = ?auto_25306 ?auto_25344 ) ) ( not ( = ?auto_25306 ?auto_25323 ) ) ( not ( = ?auto_25306 ?auto_25331 ) ) ( not ( = ?auto_25306 ?auto_25328 ) ) ( not ( = ?auto_25306 ?auto_25340 ) ) ( not ( = ?auto_25306 ?auto_25319 ) ) ( not ( = ?auto_25306 ?auto_25326 ) ) ( not ( = ?auto_25306 ?auto_25320 ) ) ( not ( = ?auto_25306 ?auto_25334 ) ) ( not ( = ?auto_25338 ?auto_25337 ) ) ( not ( = ?auto_25338 ?auto_25321 ) ) ( not ( = ?auto_25338 ?auto_25349 ) ) ( not ( = ?auto_25338 ?auto_25336 ) ) ( not ( = ?auto_25338 ?auto_25348 ) ) ( not ( = ?auto_25338 ?auto_25343 ) ) ( not ( = ?auto_25333 ?auto_25339 ) ) ( not ( = ?auto_25333 ?auto_25342 ) ) ( not ( = ?auto_25333 ?auto_25324 ) ) ( not ( = ?auto_25333 ?auto_25322 ) ) ( not ( = ?auto_25333 ?auto_25332 ) ) ( not ( = ?auto_25333 ?auto_25327 ) ) ( not ( = ?auto_25345 ?auto_25344 ) ) ( not ( = ?auto_25345 ?auto_25323 ) ) ( not ( = ?auto_25345 ?auto_25331 ) ) ( not ( = ?auto_25345 ?auto_25328 ) ) ( not ( = ?auto_25345 ?auto_25340 ) ) ( not ( = ?auto_25345 ?auto_25319 ) ) ( not ( = ?auto_25345 ?auto_25326 ) ) ( not ( = ?auto_25345 ?auto_25320 ) ) ( not ( = ?auto_25345 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25307 ) ) ( not ( = ?auto_25296 ?auto_25346 ) ) ( not ( = ?auto_25297 ?auto_25307 ) ) ( not ( = ?auto_25297 ?auto_25346 ) ) ( not ( = ?auto_25298 ?auto_25307 ) ) ( not ( = ?auto_25298 ?auto_25346 ) ) ( not ( = ?auto_25299 ?auto_25307 ) ) ( not ( = ?auto_25299 ?auto_25346 ) ) ( not ( = ?auto_25300 ?auto_25307 ) ) ( not ( = ?auto_25300 ?auto_25346 ) ) ( not ( = ?auto_25301 ?auto_25307 ) ) ( not ( = ?auto_25301 ?auto_25346 ) ) ( not ( = ?auto_25302 ?auto_25307 ) ) ( not ( = ?auto_25302 ?auto_25346 ) ) ( not ( = ?auto_25303 ?auto_25307 ) ) ( not ( = ?auto_25303 ?auto_25346 ) ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( not ( = ?auto_25304 ?auto_25346 ) ) ( not ( = ?auto_25305 ?auto_25307 ) ) ( not ( = ?auto_25305 ?auto_25346 ) ) ( not ( = ?auto_25307 ?auto_25345 ) ) ( not ( = ?auto_25307 ?auto_25344 ) ) ( not ( = ?auto_25307 ?auto_25323 ) ) ( not ( = ?auto_25307 ?auto_25331 ) ) ( not ( = ?auto_25307 ?auto_25328 ) ) ( not ( = ?auto_25307 ?auto_25340 ) ) ( not ( = ?auto_25307 ?auto_25319 ) ) ( not ( = ?auto_25307 ?auto_25326 ) ) ( not ( = ?auto_25307 ?auto_25320 ) ) ( not ( = ?auto_25307 ?auto_25334 ) ) ( not ( = ?auto_25347 ?auto_25338 ) ) ( not ( = ?auto_25347 ?auto_25337 ) ) ( not ( = ?auto_25347 ?auto_25321 ) ) ( not ( = ?auto_25347 ?auto_25349 ) ) ( not ( = ?auto_25347 ?auto_25336 ) ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25343 ) ) ( not ( = ?auto_25325 ?auto_25333 ) ) ( not ( = ?auto_25325 ?auto_25339 ) ) ( not ( = ?auto_25325 ?auto_25342 ) ) ( not ( = ?auto_25325 ?auto_25324 ) ) ( not ( = ?auto_25325 ?auto_25322 ) ) ( not ( = ?auto_25325 ?auto_25332 ) ) ( not ( = ?auto_25325 ?auto_25327 ) ) ( not ( = ?auto_25346 ?auto_25345 ) ) ( not ( = ?auto_25346 ?auto_25344 ) ) ( not ( = ?auto_25346 ?auto_25323 ) ) ( not ( = ?auto_25346 ?auto_25331 ) ) ( not ( = ?auto_25346 ?auto_25328 ) ) ( not ( = ?auto_25346 ?auto_25340 ) ) ( not ( = ?auto_25346 ?auto_25319 ) ) ( not ( = ?auto_25346 ?auto_25326 ) ) ( not ( = ?auto_25346 ?auto_25320 ) ) ( not ( = ?auto_25346 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25308 ) ) ( not ( = ?auto_25296 ?auto_25330 ) ) ( not ( = ?auto_25297 ?auto_25308 ) ) ( not ( = ?auto_25297 ?auto_25330 ) ) ( not ( = ?auto_25298 ?auto_25308 ) ) ( not ( = ?auto_25298 ?auto_25330 ) ) ( not ( = ?auto_25299 ?auto_25308 ) ) ( not ( = ?auto_25299 ?auto_25330 ) ) ( not ( = ?auto_25300 ?auto_25308 ) ) ( not ( = ?auto_25300 ?auto_25330 ) ) ( not ( = ?auto_25301 ?auto_25308 ) ) ( not ( = ?auto_25301 ?auto_25330 ) ) ( not ( = ?auto_25302 ?auto_25308 ) ) ( not ( = ?auto_25302 ?auto_25330 ) ) ( not ( = ?auto_25303 ?auto_25308 ) ) ( not ( = ?auto_25303 ?auto_25330 ) ) ( not ( = ?auto_25304 ?auto_25308 ) ) ( not ( = ?auto_25304 ?auto_25330 ) ) ( not ( = ?auto_25305 ?auto_25308 ) ) ( not ( = ?auto_25305 ?auto_25330 ) ) ( not ( = ?auto_25306 ?auto_25308 ) ) ( not ( = ?auto_25306 ?auto_25330 ) ) ( not ( = ?auto_25308 ?auto_25346 ) ) ( not ( = ?auto_25308 ?auto_25345 ) ) ( not ( = ?auto_25308 ?auto_25344 ) ) ( not ( = ?auto_25308 ?auto_25323 ) ) ( not ( = ?auto_25308 ?auto_25331 ) ) ( not ( = ?auto_25308 ?auto_25328 ) ) ( not ( = ?auto_25308 ?auto_25340 ) ) ( not ( = ?auto_25308 ?auto_25319 ) ) ( not ( = ?auto_25308 ?auto_25326 ) ) ( not ( = ?auto_25308 ?auto_25320 ) ) ( not ( = ?auto_25308 ?auto_25334 ) ) ( not ( = ?auto_25330 ?auto_25346 ) ) ( not ( = ?auto_25330 ?auto_25345 ) ) ( not ( = ?auto_25330 ?auto_25344 ) ) ( not ( = ?auto_25330 ?auto_25323 ) ) ( not ( = ?auto_25330 ?auto_25331 ) ) ( not ( = ?auto_25330 ?auto_25328 ) ) ( not ( = ?auto_25330 ?auto_25340 ) ) ( not ( = ?auto_25330 ?auto_25319 ) ) ( not ( = ?auto_25330 ?auto_25326 ) ) ( not ( = ?auto_25330 ?auto_25320 ) ) ( not ( = ?auto_25330 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25310 ) ) ( not ( = ?auto_25296 ?auto_25329 ) ) ( not ( = ?auto_25297 ?auto_25310 ) ) ( not ( = ?auto_25297 ?auto_25329 ) ) ( not ( = ?auto_25298 ?auto_25310 ) ) ( not ( = ?auto_25298 ?auto_25329 ) ) ( not ( = ?auto_25299 ?auto_25310 ) ) ( not ( = ?auto_25299 ?auto_25329 ) ) ( not ( = ?auto_25300 ?auto_25310 ) ) ( not ( = ?auto_25300 ?auto_25329 ) ) ( not ( = ?auto_25301 ?auto_25310 ) ) ( not ( = ?auto_25301 ?auto_25329 ) ) ( not ( = ?auto_25302 ?auto_25310 ) ) ( not ( = ?auto_25302 ?auto_25329 ) ) ( not ( = ?auto_25303 ?auto_25310 ) ) ( not ( = ?auto_25303 ?auto_25329 ) ) ( not ( = ?auto_25304 ?auto_25310 ) ) ( not ( = ?auto_25304 ?auto_25329 ) ) ( not ( = ?auto_25305 ?auto_25310 ) ) ( not ( = ?auto_25305 ?auto_25329 ) ) ( not ( = ?auto_25306 ?auto_25310 ) ) ( not ( = ?auto_25306 ?auto_25329 ) ) ( not ( = ?auto_25307 ?auto_25310 ) ) ( not ( = ?auto_25307 ?auto_25329 ) ) ( not ( = ?auto_25310 ?auto_25330 ) ) ( not ( = ?auto_25310 ?auto_25346 ) ) ( not ( = ?auto_25310 ?auto_25345 ) ) ( not ( = ?auto_25310 ?auto_25344 ) ) ( not ( = ?auto_25310 ?auto_25323 ) ) ( not ( = ?auto_25310 ?auto_25331 ) ) ( not ( = ?auto_25310 ?auto_25328 ) ) ( not ( = ?auto_25310 ?auto_25340 ) ) ( not ( = ?auto_25310 ?auto_25319 ) ) ( not ( = ?auto_25310 ?auto_25326 ) ) ( not ( = ?auto_25310 ?auto_25320 ) ) ( not ( = ?auto_25310 ?auto_25334 ) ) ( not ( = ?auto_25329 ?auto_25330 ) ) ( not ( = ?auto_25329 ?auto_25346 ) ) ( not ( = ?auto_25329 ?auto_25345 ) ) ( not ( = ?auto_25329 ?auto_25344 ) ) ( not ( = ?auto_25329 ?auto_25323 ) ) ( not ( = ?auto_25329 ?auto_25331 ) ) ( not ( = ?auto_25329 ?auto_25328 ) ) ( not ( = ?auto_25329 ?auto_25340 ) ) ( not ( = ?auto_25329 ?auto_25319 ) ) ( not ( = ?auto_25329 ?auto_25326 ) ) ( not ( = ?auto_25329 ?auto_25320 ) ) ( not ( = ?auto_25329 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25309 ) ) ( not ( = ?auto_25296 ?auto_25335 ) ) ( not ( = ?auto_25297 ?auto_25309 ) ) ( not ( = ?auto_25297 ?auto_25335 ) ) ( not ( = ?auto_25298 ?auto_25309 ) ) ( not ( = ?auto_25298 ?auto_25335 ) ) ( not ( = ?auto_25299 ?auto_25309 ) ) ( not ( = ?auto_25299 ?auto_25335 ) ) ( not ( = ?auto_25300 ?auto_25309 ) ) ( not ( = ?auto_25300 ?auto_25335 ) ) ( not ( = ?auto_25301 ?auto_25309 ) ) ( not ( = ?auto_25301 ?auto_25335 ) ) ( not ( = ?auto_25302 ?auto_25309 ) ) ( not ( = ?auto_25302 ?auto_25335 ) ) ( not ( = ?auto_25303 ?auto_25309 ) ) ( not ( = ?auto_25303 ?auto_25335 ) ) ( not ( = ?auto_25304 ?auto_25309 ) ) ( not ( = ?auto_25304 ?auto_25335 ) ) ( not ( = ?auto_25305 ?auto_25309 ) ) ( not ( = ?auto_25305 ?auto_25335 ) ) ( not ( = ?auto_25306 ?auto_25309 ) ) ( not ( = ?auto_25306 ?auto_25335 ) ) ( not ( = ?auto_25307 ?auto_25309 ) ) ( not ( = ?auto_25307 ?auto_25335 ) ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25308 ?auto_25335 ) ) ( not ( = ?auto_25309 ?auto_25329 ) ) ( not ( = ?auto_25309 ?auto_25330 ) ) ( not ( = ?auto_25309 ?auto_25346 ) ) ( not ( = ?auto_25309 ?auto_25345 ) ) ( not ( = ?auto_25309 ?auto_25344 ) ) ( not ( = ?auto_25309 ?auto_25323 ) ) ( not ( = ?auto_25309 ?auto_25331 ) ) ( not ( = ?auto_25309 ?auto_25328 ) ) ( not ( = ?auto_25309 ?auto_25340 ) ) ( not ( = ?auto_25309 ?auto_25319 ) ) ( not ( = ?auto_25309 ?auto_25326 ) ) ( not ( = ?auto_25309 ?auto_25320 ) ) ( not ( = ?auto_25309 ?auto_25334 ) ) ( not ( = ?auto_25335 ?auto_25329 ) ) ( not ( = ?auto_25335 ?auto_25330 ) ) ( not ( = ?auto_25335 ?auto_25346 ) ) ( not ( = ?auto_25335 ?auto_25345 ) ) ( not ( = ?auto_25335 ?auto_25344 ) ) ( not ( = ?auto_25335 ?auto_25323 ) ) ( not ( = ?auto_25335 ?auto_25331 ) ) ( not ( = ?auto_25335 ?auto_25328 ) ) ( not ( = ?auto_25335 ?auto_25340 ) ) ( not ( = ?auto_25335 ?auto_25319 ) ) ( not ( = ?auto_25335 ?auto_25326 ) ) ( not ( = ?auto_25335 ?auto_25320 ) ) ( not ( = ?auto_25335 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25312 ) ) ( not ( = ?auto_25296 ?auto_25341 ) ) ( not ( = ?auto_25297 ?auto_25312 ) ) ( not ( = ?auto_25297 ?auto_25341 ) ) ( not ( = ?auto_25298 ?auto_25312 ) ) ( not ( = ?auto_25298 ?auto_25341 ) ) ( not ( = ?auto_25299 ?auto_25312 ) ) ( not ( = ?auto_25299 ?auto_25341 ) ) ( not ( = ?auto_25300 ?auto_25312 ) ) ( not ( = ?auto_25300 ?auto_25341 ) ) ( not ( = ?auto_25301 ?auto_25312 ) ) ( not ( = ?auto_25301 ?auto_25341 ) ) ( not ( = ?auto_25302 ?auto_25312 ) ) ( not ( = ?auto_25302 ?auto_25341 ) ) ( not ( = ?auto_25303 ?auto_25312 ) ) ( not ( = ?auto_25303 ?auto_25341 ) ) ( not ( = ?auto_25304 ?auto_25312 ) ) ( not ( = ?auto_25304 ?auto_25341 ) ) ( not ( = ?auto_25305 ?auto_25312 ) ) ( not ( = ?auto_25305 ?auto_25341 ) ) ( not ( = ?auto_25306 ?auto_25312 ) ) ( not ( = ?auto_25306 ?auto_25341 ) ) ( not ( = ?auto_25307 ?auto_25312 ) ) ( not ( = ?auto_25307 ?auto_25341 ) ) ( not ( = ?auto_25308 ?auto_25312 ) ) ( not ( = ?auto_25308 ?auto_25341 ) ) ( not ( = ?auto_25310 ?auto_25312 ) ) ( not ( = ?auto_25310 ?auto_25341 ) ) ( not ( = ?auto_25312 ?auto_25335 ) ) ( not ( = ?auto_25312 ?auto_25329 ) ) ( not ( = ?auto_25312 ?auto_25330 ) ) ( not ( = ?auto_25312 ?auto_25346 ) ) ( not ( = ?auto_25312 ?auto_25345 ) ) ( not ( = ?auto_25312 ?auto_25344 ) ) ( not ( = ?auto_25312 ?auto_25323 ) ) ( not ( = ?auto_25312 ?auto_25331 ) ) ( not ( = ?auto_25312 ?auto_25328 ) ) ( not ( = ?auto_25312 ?auto_25340 ) ) ( not ( = ?auto_25312 ?auto_25319 ) ) ( not ( = ?auto_25312 ?auto_25326 ) ) ( not ( = ?auto_25312 ?auto_25320 ) ) ( not ( = ?auto_25312 ?auto_25334 ) ) ( not ( = ?auto_25341 ?auto_25335 ) ) ( not ( = ?auto_25341 ?auto_25329 ) ) ( not ( = ?auto_25341 ?auto_25330 ) ) ( not ( = ?auto_25341 ?auto_25346 ) ) ( not ( = ?auto_25341 ?auto_25345 ) ) ( not ( = ?auto_25341 ?auto_25344 ) ) ( not ( = ?auto_25341 ?auto_25323 ) ) ( not ( = ?auto_25341 ?auto_25331 ) ) ( not ( = ?auto_25341 ?auto_25328 ) ) ( not ( = ?auto_25341 ?auto_25340 ) ) ( not ( = ?auto_25341 ?auto_25319 ) ) ( not ( = ?auto_25341 ?auto_25326 ) ) ( not ( = ?auto_25341 ?auto_25320 ) ) ( not ( = ?auto_25341 ?auto_25334 ) ) ( not ( = ?auto_25296 ?auto_25311 ) ) ( not ( = ?auto_25296 ?auto_25317 ) ) ( not ( = ?auto_25297 ?auto_25311 ) ) ( not ( = ?auto_25297 ?auto_25317 ) ) ( not ( = ?auto_25298 ?auto_25311 ) ) ( not ( = ?auto_25298 ?auto_25317 ) ) ( not ( = ?auto_25299 ?auto_25311 ) ) ( not ( = ?auto_25299 ?auto_25317 ) ) ( not ( = ?auto_25300 ?auto_25311 ) ) ( not ( = ?auto_25300 ?auto_25317 ) ) ( not ( = ?auto_25301 ?auto_25311 ) ) ( not ( = ?auto_25301 ?auto_25317 ) ) ( not ( = ?auto_25302 ?auto_25311 ) ) ( not ( = ?auto_25302 ?auto_25317 ) ) ( not ( = ?auto_25303 ?auto_25311 ) ) ( not ( = ?auto_25303 ?auto_25317 ) ) ( not ( = ?auto_25304 ?auto_25311 ) ) ( not ( = ?auto_25304 ?auto_25317 ) ) ( not ( = ?auto_25305 ?auto_25311 ) ) ( not ( = ?auto_25305 ?auto_25317 ) ) ( not ( = ?auto_25306 ?auto_25311 ) ) ( not ( = ?auto_25306 ?auto_25317 ) ) ( not ( = ?auto_25307 ?auto_25311 ) ) ( not ( = ?auto_25307 ?auto_25317 ) ) ( not ( = ?auto_25308 ?auto_25311 ) ) ( not ( = ?auto_25308 ?auto_25317 ) ) ( not ( = ?auto_25310 ?auto_25311 ) ) ( not ( = ?auto_25310 ?auto_25317 ) ) ( not ( = ?auto_25309 ?auto_25311 ) ) ( not ( = ?auto_25309 ?auto_25317 ) ) ( not ( = ?auto_25311 ?auto_25341 ) ) ( not ( = ?auto_25311 ?auto_25335 ) ) ( not ( = ?auto_25311 ?auto_25329 ) ) ( not ( = ?auto_25311 ?auto_25330 ) ) ( not ( = ?auto_25311 ?auto_25346 ) ) ( not ( = ?auto_25311 ?auto_25345 ) ) ( not ( = ?auto_25311 ?auto_25344 ) ) ( not ( = ?auto_25311 ?auto_25323 ) ) ( not ( = ?auto_25311 ?auto_25331 ) ) ( not ( = ?auto_25311 ?auto_25328 ) ) ( not ( = ?auto_25311 ?auto_25340 ) ) ( not ( = ?auto_25311 ?auto_25319 ) ) ( not ( = ?auto_25311 ?auto_25326 ) ) ( not ( = ?auto_25311 ?auto_25320 ) ) ( not ( = ?auto_25311 ?auto_25334 ) ) ( not ( = ?auto_25315 ?auto_25336 ) ) ( not ( = ?auto_25315 ?auto_25321 ) ) ( not ( = ?auto_25315 ?auto_25338 ) ) ( not ( = ?auto_25315 ?auto_25347 ) ) ( not ( = ?auto_25315 ?auto_25337 ) ) ( not ( = ?auto_25315 ?auto_25349 ) ) ( not ( = ?auto_25315 ?auto_25348 ) ) ( not ( = ?auto_25315 ?auto_25343 ) ) ( not ( = ?auto_25318 ?auto_25322 ) ) ( not ( = ?auto_25318 ?auto_25342 ) ) ( not ( = ?auto_25318 ?auto_25333 ) ) ( not ( = ?auto_25318 ?auto_25325 ) ) ( not ( = ?auto_25318 ?auto_25339 ) ) ( not ( = ?auto_25318 ?auto_25324 ) ) ( not ( = ?auto_25318 ?auto_25332 ) ) ( not ( = ?auto_25318 ?auto_25327 ) ) ( not ( = ?auto_25317 ?auto_25341 ) ) ( not ( = ?auto_25317 ?auto_25335 ) ) ( not ( = ?auto_25317 ?auto_25329 ) ) ( not ( = ?auto_25317 ?auto_25330 ) ) ( not ( = ?auto_25317 ?auto_25346 ) ) ( not ( = ?auto_25317 ?auto_25345 ) ) ( not ( = ?auto_25317 ?auto_25344 ) ) ( not ( = ?auto_25317 ?auto_25323 ) ) ( not ( = ?auto_25317 ?auto_25331 ) ) ( not ( = ?auto_25317 ?auto_25328 ) ) ( not ( = ?auto_25317 ?auto_25340 ) ) ( not ( = ?auto_25317 ?auto_25319 ) ) ( not ( = ?auto_25317 ?auto_25326 ) ) ( not ( = ?auto_25317 ?auto_25320 ) ) ( not ( = ?auto_25317 ?auto_25334 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_25296 ?auto_25297 ?auto_25298 ?auto_25299 ?auto_25300 ?auto_25301 ?auto_25302 ?auto_25303 ?auto_25304 ?auto_25305 ?auto_25306 ?auto_25307 ?auto_25308 ?auto_25310 ?auto_25309 ?auto_25312 )
      ( MAKE-1CRATE ?auto_25312 ?auto_25311 )
      ( MAKE-16CRATE-VERIFY ?auto_25296 ?auto_25297 ?auto_25298 ?auto_25299 ?auto_25300 ?auto_25301 ?auto_25302 ?auto_25303 ?auto_25304 ?auto_25305 ?auto_25306 ?auto_25307 ?auto_25308 ?auto_25310 ?auto_25309 ?auto_25312 ?auto_25311 ) )
  )

)

