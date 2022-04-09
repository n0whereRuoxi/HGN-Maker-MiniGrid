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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16516 - SURFACE
      ?auto_16517 - SURFACE
    )
    :vars
    (
      ?auto_16518 - HOIST
      ?auto_16519 - PLACE
      ?auto_16521 - PLACE
      ?auto_16522 - HOIST
      ?auto_16523 - SURFACE
      ?auto_16520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16518 ?auto_16519 ) ( SURFACE-AT ?auto_16516 ?auto_16519 ) ( CLEAR ?auto_16516 ) ( IS-CRATE ?auto_16517 ) ( AVAILABLE ?auto_16518 ) ( not ( = ?auto_16521 ?auto_16519 ) ) ( HOIST-AT ?auto_16522 ?auto_16521 ) ( AVAILABLE ?auto_16522 ) ( SURFACE-AT ?auto_16517 ?auto_16521 ) ( ON ?auto_16517 ?auto_16523 ) ( CLEAR ?auto_16517 ) ( TRUCK-AT ?auto_16520 ?auto_16519 ) ( not ( = ?auto_16516 ?auto_16517 ) ) ( not ( = ?auto_16516 ?auto_16523 ) ) ( not ( = ?auto_16517 ?auto_16523 ) ) ( not ( = ?auto_16518 ?auto_16522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16520 ?auto_16519 ?auto_16521 )
      ( !LIFT ?auto_16522 ?auto_16517 ?auto_16523 ?auto_16521 )
      ( !LOAD ?auto_16522 ?auto_16517 ?auto_16520 ?auto_16521 )
      ( !DRIVE ?auto_16520 ?auto_16521 ?auto_16519 )
      ( !UNLOAD ?auto_16518 ?auto_16517 ?auto_16520 ?auto_16519 )
      ( !DROP ?auto_16518 ?auto_16517 ?auto_16516 ?auto_16519 )
      ( MAKE-1CRATE-VERIFY ?auto_16516 ?auto_16517 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16537 - SURFACE
      ?auto_16538 - SURFACE
      ?auto_16539 - SURFACE
    )
    :vars
    (
      ?auto_16541 - HOIST
      ?auto_16540 - PLACE
      ?auto_16544 - PLACE
      ?auto_16543 - HOIST
      ?auto_16542 - SURFACE
      ?auto_16548 - PLACE
      ?auto_16546 - HOIST
      ?auto_16547 - SURFACE
      ?auto_16545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16541 ?auto_16540 ) ( IS-CRATE ?auto_16539 ) ( not ( = ?auto_16544 ?auto_16540 ) ) ( HOIST-AT ?auto_16543 ?auto_16544 ) ( AVAILABLE ?auto_16543 ) ( SURFACE-AT ?auto_16539 ?auto_16544 ) ( ON ?auto_16539 ?auto_16542 ) ( CLEAR ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16542 ) ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( SURFACE-AT ?auto_16537 ?auto_16540 ) ( CLEAR ?auto_16537 ) ( IS-CRATE ?auto_16538 ) ( AVAILABLE ?auto_16541 ) ( not ( = ?auto_16548 ?auto_16540 ) ) ( HOIST-AT ?auto_16546 ?auto_16548 ) ( AVAILABLE ?auto_16546 ) ( SURFACE-AT ?auto_16538 ?auto_16548 ) ( ON ?auto_16538 ?auto_16547 ) ( CLEAR ?auto_16538 ) ( TRUCK-AT ?auto_16545 ?auto_16540 ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16547 ) ) ( not ( = ?auto_16538 ?auto_16547 ) ) ( not ( = ?auto_16541 ?auto_16546 ) ) ( not ( = ?auto_16537 ?auto_16539 ) ) ( not ( = ?auto_16537 ?auto_16542 ) ) ( not ( = ?auto_16539 ?auto_16547 ) ) ( not ( = ?auto_16544 ?auto_16548 ) ) ( not ( = ?auto_16543 ?auto_16546 ) ) ( not ( = ?auto_16542 ?auto_16547 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16537 ?auto_16538 )
      ( MAKE-1CRATE ?auto_16538 ?auto_16539 )
      ( MAKE-2CRATE-VERIFY ?auto_16537 ?auto_16538 ?auto_16539 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16563 - SURFACE
      ?auto_16564 - SURFACE
      ?auto_16565 - SURFACE
      ?auto_16566 - SURFACE
    )
    :vars
    (
      ?auto_16569 - HOIST
      ?auto_16568 - PLACE
      ?auto_16572 - PLACE
      ?auto_16567 - HOIST
      ?auto_16571 - SURFACE
      ?auto_16573 - PLACE
      ?auto_16575 - HOIST
      ?auto_16578 - SURFACE
      ?auto_16574 - PLACE
      ?auto_16577 - HOIST
      ?auto_16576 - SURFACE
      ?auto_16570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16569 ?auto_16568 ) ( IS-CRATE ?auto_16566 ) ( not ( = ?auto_16572 ?auto_16568 ) ) ( HOIST-AT ?auto_16567 ?auto_16572 ) ( AVAILABLE ?auto_16567 ) ( SURFACE-AT ?auto_16566 ?auto_16572 ) ( ON ?auto_16566 ?auto_16571 ) ( CLEAR ?auto_16566 ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16571 ) ) ( not ( = ?auto_16566 ?auto_16571 ) ) ( not ( = ?auto_16569 ?auto_16567 ) ) ( IS-CRATE ?auto_16565 ) ( not ( = ?auto_16573 ?auto_16568 ) ) ( HOIST-AT ?auto_16575 ?auto_16573 ) ( AVAILABLE ?auto_16575 ) ( SURFACE-AT ?auto_16565 ?auto_16573 ) ( ON ?auto_16565 ?auto_16578 ) ( CLEAR ?auto_16565 ) ( not ( = ?auto_16564 ?auto_16565 ) ) ( not ( = ?auto_16564 ?auto_16578 ) ) ( not ( = ?auto_16565 ?auto_16578 ) ) ( not ( = ?auto_16569 ?auto_16575 ) ) ( SURFACE-AT ?auto_16563 ?auto_16568 ) ( CLEAR ?auto_16563 ) ( IS-CRATE ?auto_16564 ) ( AVAILABLE ?auto_16569 ) ( not ( = ?auto_16574 ?auto_16568 ) ) ( HOIST-AT ?auto_16577 ?auto_16574 ) ( AVAILABLE ?auto_16577 ) ( SURFACE-AT ?auto_16564 ?auto_16574 ) ( ON ?auto_16564 ?auto_16576 ) ( CLEAR ?auto_16564 ) ( TRUCK-AT ?auto_16570 ?auto_16568 ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16576 ) ) ( not ( = ?auto_16564 ?auto_16576 ) ) ( not ( = ?auto_16569 ?auto_16577 ) ) ( not ( = ?auto_16563 ?auto_16565 ) ) ( not ( = ?auto_16563 ?auto_16578 ) ) ( not ( = ?auto_16565 ?auto_16576 ) ) ( not ( = ?auto_16573 ?auto_16574 ) ) ( not ( = ?auto_16575 ?auto_16577 ) ) ( not ( = ?auto_16578 ?auto_16576 ) ) ( not ( = ?auto_16563 ?auto_16566 ) ) ( not ( = ?auto_16563 ?auto_16571 ) ) ( not ( = ?auto_16564 ?auto_16566 ) ) ( not ( = ?auto_16564 ?auto_16571 ) ) ( not ( = ?auto_16566 ?auto_16578 ) ) ( not ( = ?auto_16566 ?auto_16576 ) ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16572 ?auto_16574 ) ) ( not ( = ?auto_16567 ?auto_16575 ) ) ( not ( = ?auto_16567 ?auto_16577 ) ) ( not ( = ?auto_16571 ?auto_16578 ) ) ( not ( = ?auto_16571 ?auto_16576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16563 ?auto_16564 ?auto_16565 )
      ( MAKE-1CRATE ?auto_16565 ?auto_16566 )
      ( MAKE-3CRATE-VERIFY ?auto_16563 ?auto_16564 ?auto_16565 ?auto_16566 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16594 - SURFACE
      ?auto_16595 - SURFACE
      ?auto_16596 - SURFACE
      ?auto_16597 - SURFACE
      ?auto_16598 - SURFACE
    )
    :vars
    (
      ?auto_16604 - HOIST
      ?auto_16603 - PLACE
      ?auto_16600 - PLACE
      ?auto_16599 - HOIST
      ?auto_16602 - SURFACE
      ?auto_16605 - PLACE
      ?auto_16608 - HOIST
      ?auto_16606 - SURFACE
      ?auto_16609 - PLACE
      ?auto_16612 - HOIST
      ?auto_16610 - SURFACE
      ?auto_16607 - PLACE
      ?auto_16611 - HOIST
      ?auto_16613 - SURFACE
      ?auto_16601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16604 ?auto_16603 ) ( IS-CRATE ?auto_16598 ) ( not ( = ?auto_16600 ?auto_16603 ) ) ( HOIST-AT ?auto_16599 ?auto_16600 ) ( AVAILABLE ?auto_16599 ) ( SURFACE-AT ?auto_16598 ?auto_16600 ) ( ON ?auto_16598 ?auto_16602 ) ( CLEAR ?auto_16598 ) ( not ( = ?auto_16597 ?auto_16598 ) ) ( not ( = ?auto_16597 ?auto_16602 ) ) ( not ( = ?auto_16598 ?auto_16602 ) ) ( not ( = ?auto_16604 ?auto_16599 ) ) ( IS-CRATE ?auto_16597 ) ( not ( = ?auto_16605 ?auto_16603 ) ) ( HOIST-AT ?auto_16608 ?auto_16605 ) ( AVAILABLE ?auto_16608 ) ( SURFACE-AT ?auto_16597 ?auto_16605 ) ( ON ?auto_16597 ?auto_16606 ) ( CLEAR ?auto_16597 ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16606 ) ) ( not ( = ?auto_16597 ?auto_16606 ) ) ( not ( = ?auto_16604 ?auto_16608 ) ) ( IS-CRATE ?auto_16596 ) ( not ( = ?auto_16609 ?auto_16603 ) ) ( HOIST-AT ?auto_16612 ?auto_16609 ) ( AVAILABLE ?auto_16612 ) ( SURFACE-AT ?auto_16596 ?auto_16609 ) ( ON ?auto_16596 ?auto_16610 ) ( CLEAR ?auto_16596 ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16610 ) ) ( not ( = ?auto_16596 ?auto_16610 ) ) ( not ( = ?auto_16604 ?auto_16612 ) ) ( SURFACE-AT ?auto_16594 ?auto_16603 ) ( CLEAR ?auto_16594 ) ( IS-CRATE ?auto_16595 ) ( AVAILABLE ?auto_16604 ) ( not ( = ?auto_16607 ?auto_16603 ) ) ( HOIST-AT ?auto_16611 ?auto_16607 ) ( AVAILABLE ?auto_16611 ) ( SURFACE-AT ?auto_16595 ?auto_16607 ) ( ON ?auto_16595 ?auto_16613 ) ( CLEAR ?auto_16595 ) ( TRUCK-AT ?auto_16601 ?auto_16603 ) ( not ( = ?auto_16594 ?auto_16595 ) ) ( not ( = ?auto_16594 ?auto_16613 ) ) ( not ( = ?auto_16595 ?auto_16613 ) ) ( not ( = ?auto_16604 ?auto_16611 ) ) ( not ( = ?auto_16594 ?auto_16596 ) ) ( not ( = ?auto_16594 ?auto_16610 ) ) ( not ( = ?auto_16596 ?auto_16613 ) ) ( not ( = ?auto_16609 ?auto_16607 ) ) ( not ( = ?auto_16612 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16613 ) ) ( not ( = ?auto_16594 ?auto_16597 ) ) ( not ( = ?auto_16594 ?auto_16606 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16606 ) ) ( not ( = ?auto_16597 ?auto_16610 ) ) ( not ( = ?auto_16597 ?auto_16613 ) ) ( not ( = ?auto_16605 ?auto_16609 ) ) ( not ( = ?auto_16605 ?auto_16607 ) ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16606 ?auto_16610 ) ) ( not ( = ?auto_16606 ?auto_16613 ) ) ( not ( = ?auto_16594 ?auto_16598 ) ) ( not ( = ?auto_16594 ?auto_16602 ) ) ( not ( = ?auto_16595 ?auto_16598 ) ) ( not ( = ?auto_16595 ?auto_16602 ) ) ( not ( = ?auto_16596 ?auto_16598 ) ) ( not ( = ?auto_16596 ?auto_16602 ) ) ( not ( = ?auto_16598 ?auto_16606 ) ) ( not ( = ?auto_16598 ?auto_16610 ) ) ( not ( = ?auto_16598 ?auto_16613 ) ) ( not ( = ?auto_16600 ?auto_16605 ) ) ( not ( = ?auto_16600 ?auto_16609 ) ) ( not ( = ?auto_16600 ?auto_16607 ) ) ( not ( = ?auto_16599 ?auto_16608 ) ) ( not ( = ?auto_16599 ?auto_16612 ) ) ( not ( = ?auto_16599 ?auto_16611 ) ) ( not ( = ?auto_16602 ?auto_16606 ) ) ( not ( = ?auto_16602 ?auto_16610 ) ) ( not ( = ?auto_16602 ?auto_16613 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_16594 ?auto_16595 ?auto_16596 ?auto_16597 )
      ( MAKE-1CRATE ?auto_16597 ?auto_16598 )
      ( MAKE-4CRATE-VERIFY ?auto_16594 ?auto_16595 ?auto_16596 ?auto_16597 ?auto_16598 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_16630 - SURFACE
      ?auto_16631 - SURFACE
      ?auto_16632 - SURFACE
      ?auto_16633 - SURFACE
      ?auto_16634 - SURFACE
      ?auto_16635 - SURFACE
    )
    :vars
    (
      ?auto_16636 - HOIST
      ?auto_16637 - PLACE
      ?auto_16640 - PLACE
      ?auto_16638 - HOIST
      ?auto_16639 - SURFACE
      ?auto_16649 - PLACE
      ?auto_16650 - HOIST
      ?auto_16643 - SURFACE
      ?auto_16648 - PLACE
      ?auto_16653 - HOIST
      ?auto_16652 - SURFACE
      ?auto_16642 - PLACE
      ?auto_16644 - HOIST
      ?auto_16646 - SURFACE
      ?auto_16651 - PLACE
      ?auto_16645 - HOIST
      ?auto_16647 - SURFACE
      ?auto_16641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16636 ?auto_16637 ) ( IS-CRATE ?auto_16635 ) ( not ( = ?auto_16640 ?auto_16637 ) ) ( HOIST-AT ?auto_16638 ?auto_16640 ) ( AVAILABLE ?auto_16638 ) ( SURFACE-AT ?auto_16635 ?auto_16640 ) ( ON ?auto_16635 ?auto_16639 ) ( CLEAR ?auto_16635 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) ( IS-CRATE ?auto_16634 ) ( not ( = ?auto_16649 ?auto_16637 ) ) ( HOIST-AT ?auto_16650 ?auto_16649 ) ( AVAILABLE ?auto_16650 ) ( SURFACE-AT ?auto_16634 ?auto_16649 ) ( ON ?auto_16634 ?auto_16643 ) ( CLEAR ?auto_16634 ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16643 ) ) ( not ( = ?auto_16634 ?auto_16643 ) ) ( not ( = ?auto_16636 ?auto_16650 ) ) ( IS-CRATE ?auto_16633 ) ( not ( = ?auto_16648 ?auto_16637 ) ) ( HOIST-AT ?auto_16653 ?auto_16648 ) ( AVAILABLE ?auto_16653 ) ( SURFACE-AT ?auto_16633 ?auto_16648 ) ( ON ?auto_16633 ?auto_16652 ) ( CLEAR ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16633 ) ) ( not ( = ?auto_16632 ?auto_16652 ) ) ( not ( = ?auto_16633 ?auto_16652 ) ) ( not ( = ?auto_16636 ?auto_16653 ) ) ( IS-CRATE ?auto_16632 ) ( not ( = ?auto_16642 ?auto_16637 ) ) ( HOIST-AT ?auto_16644 ?auto_16642 ) ( AVAILABLE ?auto_16644 ) ( SURFACE-AT ?auto_16632 ?auto_16642 ) ( ON ?auto_16632 ?auto_16646 ) ( CLEAR ?auto_16632 ) ( not ( = ?auto_16631 ?auto_16632 ) ) ( not ( = ?auto_16631 ?auto_16646 ) ) ( not ( = ?auto_16632 ?auto_16646 ) ) ( not ( = ?auto_16636 ?auto_16644 ) ) ( SURFACE-AT ?auto_16630 ?auto_16637 ) ( CLEAR ?auto_16630 ) ( IS-CRATE ?auto_16631 ) ( AVAILABLE ?auto_16636 ) ( not ( = ?auto_16651 ?auto_16637 ) ) ( HOIST-AT ?auto_16645 ?auto_16651 ) ( AVAILABLE ?auto_16645 ) ( SURFACE-AT ?auto_16631 ?auto_16651 ) ( ON ?auto_16631 ?auto_16647 ) ( CLEAR ?auto_16631 ) ( TRUCK-AT ?auto_16641 ?auto_16637 ) ( not ( = ?auto_16630 ?auto_16631 ) ) ( not ( = ?auto_16630 ?auto_16647 ) ) ( not ( = ?auto_16631 ?auto_16647 ) ) ( not ( = ?auto_16636 ?auto_16645 ) ) ( not ( = ?auto_16630 ?auto_16632 ) ) ( not ( = ?auto_16630 ?auto_16646 ) ) ( not ( = ?auto_16632 ?auto_16647 ) ) ( not ( = ?auto_16642 ?auto_16651 ) ) ( not ( = ?auto_16644 ?auto_16645 ) ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( not ( = ?auto_16630 ?auto_16633 ) ) ( not ( = ?auto_16630 ?auto_16652 ) ) ( not ( = ?auto_16631 ?auto_16633 ) ) ( not ( = ?auto_16631 ?auto_16652 ) ) ( not ( = ?auto_16633 ?auto_16646 ) ) ( not ( = ?auto_16633 ?auto_16647 ) ) ( not ( = ?auto_16648 ?auto_16642 ) ) ( not ( = ?auto_16648 ?auto_16651 ) ) ( not ( = ?auto_16653 ?auto_16644 ) ) ( not ( = ?auto_16653 ?auto_16645 ) ) ( not ( = ?auto_16652 ?auto_16646 ) ) ( not ( = ?auto_16652 ?auto_16647 ) ) ( not ( = ?auto_16630 ?auto_16634 ) ) ( not ( = ?auto_16630 ?auto_16643 ) ) ( not ( = ?auto_16631 ?auto_16634 ) ) ( not ( = ?auto_16631 ?auto_16643 ) ) ( not ( = ?auto_16632 ?auto_16634 ) ) ( not ( = ?auto_16632 ?auto_16643 ) ) ( not ( = ?auto_16634 ?auto_16652 ) ) ( not ( = ?auto_16634 ?auto_16646 ) ) ( not ( = ?auto_16634 ?auto_16647 ) ) ( not ( = ?auto_16649 ?auto_16648 ) ) ( not ( = ?auto_16649 ?auto_16642 ) ) ( not ( = ?auto_16649 ?auto_16651 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16650 ?auto_16644 ) ) ( not ( = ?auto_16650 ?auto_16645 ) ) ( not ( = ?auto_16643 ?auto_16652 ) ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16647 ) ) ( not ( = ?auto_16630 ?auto_16635 ) ) ( not ( = ?auto_16630 ?auto_16639 ) ) ( not ( = ?auto_16631 ?auto_16635 ) ) ( not ( = ?auto_16631 ?auto_16639 ) ) ( not ( = ?auto_16632 ?auto_16635 ) ) ( not ( = ?auto_16632 ?auto_16639 ) ) ( not ( = ?auto_16633 ?auto_16635 ) ) ( not ( = ?auto_16633 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16643 ) ) ( not ( = ?auto_16635 ?auto_16652 ) ) ( not ( = ?auto_16635 ?auto_16646 ) ) ( not ( = ?auto_16635 ?auto_16647 ) ) ( not ( = ?auto_16640 ?auto_16649 ) ) ( not ( = ?auto_16640 ?auto_16648 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16651 ) ) ( not ( = ?auto_16638 ?auto_16650 ) ) ( not ( = ?auto_16638 ?auto_16653 ) ) ( not ( = ?auto_16638 ?auto_16644 ) ) ( not ( = ?auto_16638 ?auto_16645 ) ) ( not ( = ?auto_16639 ?auto_16643 ) ) ( not ( = ?auto_16639 ?auto_16652 ) ) ( not ( = ?auto_16639 ?auto_16646 ) ) ( not ( = ?auto_16639 ?auto_16647 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_16630 ?auto_16631 ?auto_16632 ?auto_16633 ?auto_16634 )
      ( MAKE-1CRATE ?auto_16634 ?auto_16635 )
      ( MAKE-5CRATE-VERIFY ?auto_16630 ?auto_16631 ?auto_16632 ?auto_16633 ?auto_16634 ?auto_16635 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_16671 - SURFACE
      ?auto_16672 - SURFACE
      ?auto_16673 - SURFACE
      ?auto_16674 - SURFACE
      ?auto_16675 - SURFACE
      ?auto_16676 - SURFACE
      ?auto_16677 - SURFACE
    )
    :vars
    (
      ?auto_16681 - HOIST
      ?auto_16682 - PLACE
      ?auto_16683 - PLACE
      ?auto_16679 - HOIST
      ?auto_16678 - SURFACE
      ?auto_16693 - PLACE
      ?auto_16687 - HOIST
      ?auto_16698 - SURFACE
      ?auto_16691 - PLACE
      ?auto_16684 - HOIST
      ?auto_16692 - SURFACE
      ?auto_16686 - PLACE
      ?auto_16690 - HOIST
      ?auto_16696 - SURFACE
      ?auto_16697 - PLACE
      ?auto_16695 - HOIST
      ?auto_16688 - SURFACE
      ?auto_16689 - PLACE
      ?auto_16694 - HOIST
      ?auto_16685 - SURFACE
      ?auto_16680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16681 ?auto_16682 ) ( IS-CRATE ?auto_16677 ) ( not ( = ?auto_16683 ?auto_16682 ) ) ( HOIST-AT ?auto_16679 ?auto_16683 ) ( AVAILABLE ?auto_16679 ) ( SURFACE-AT ?auto_16677 ?auto_16683 ) ( ON ?auto_16677 ?auto_16678 ) ( CLEAR ?auto_16677 ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( not ( = ?auto_16681 ?auto_16679 ) ) ( IS-CRATE ?auto_16676 ) ( not ( = ?auto_16693 ?auto_16682 ) ) ( HOIST-AT ?auto_16687 ?auto_16693 ) ( AVAILABLE ?auto_16687 ) ( SURFACE-AT ?auto_16676 ?auto_16693 ) ( ON ?auto_16676 ?auto_16698 ) ( CLEAR ?auto_16676 ) ( not ( = ?auto_16675 ?auto_16676 ) ) ( not ( = ?auto_16675 ?auto_16698 ) ) ( not ( = ?auto_16676 ?auto_16698 ) ) ( not ( = ?auto_16681 ?auto_16687 ) ) ( IS-CRATE ?auto_16675 ) ( not ( = ?auto_16691 ?auto_16682 ) ) ( HOIST-AT ?auto_16684 ?auto_16691 ) ( AVAILABLE ?auto_16684 ) ( SURFACE-AT ?auto_16675 ?auto_16691 ) ( ON ?auto_16675 ?auto_16692 ) ( CLEAR ?auto_16675 ) ( not ( = ?auto_16674 ?auto_16675 ) ) ( not ( = ?auto_16674 ?auto_16692 ) ) ( not ( = ?auto_16675 ?auto_16692 ) ) ( not ( = ?auto_16681 ?auto_16684 ) ) ( IS-CRATE ?auto_16674 ) ( not ( = ?auto_16686 ?auto_16682 ) ) ( HOIST-AT ?auto_16690 ?auto_16686 ) ( AVAILABLE ?auto_16690 ) ( SURFACE-AT ?auto_16674 ?auto_16686 ) ( ON ?auto_16674 ?auto_16696 ) ( CLEAR ?auto_16674 ) ( not ( = ?auto_16673 ?auto_16674 ) ) ( not ( = ?auto_16673 ?auto_16696 ) ) ( not ( = ?auto_16674 ?auto_16696 ) ) ( not ( = ?auto_16681 ?auto_16690 ) ) ( IS-CRATE ?auto_16673 ) ( not ( = ?auto_16697 ?auto_16682 ) ) ( HOIST-AT ?auto_16695 ?auto_16697 ) ( AVAILABLE ?auto_16695 ) ( SURFACE-AT ?auto_16673 ?auto_16697 ) ( ON ?auto_16673 ?auto_16688 ) ( CLEAR ?auto_16673 ) ( not ( = ?auto_16672 ?auto_16673 ) ) ( not ( = ?auto_16672 ?auto_16688 ) ) ( not ( = ?auto_16673 ?auto_16688 ) ) ( not ( = ?auto_16681 ?auto_16695 ) ) ( SURFACE-AT ?auto_16671 ?auto_16682 ) ( CLEAR ?auto_16671 ) ( IS-CRATE ?auto_16672 ) ( AVAILABLE ?auto_16681 ) ( not ( = ?auto_16689 ?auto_16682 ) ) ( HOIST-AT ?auto_16694 ?auto_16689 ) ( AVAILABLE ?auto_16694 ) ( SURFACE-AT ?auto_16672 ?auto_16689 ) ( ON ?auto_16672 ?auto_16685 ) ( CLEAR ?auto_16672 ) ( TRUCK-AT ?auto_16680 ?auto_16682 ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( not ( = ?auto_16671 ?auto_16685 ) ) ( not ( = ?auto_16672 ?auto_16685 ) ) ( not ( = ?auto_16681 ?auto_16694 ) ) ( not ( = ?auto_16671 ?auto_16673 ) ) ( not ( = ?auto_16671 ?auto_16688 ) ) ( not ( = ?auto_16673 ?auto_16685 ) ) ( not ( = ?auto_16697 ?auto_16689 ) ) ( not ( = ?auto_16695 ?auto_16694 ) ) ( not ( = ?auto_16688 ?auto_16685 ) ) ( not ( = ?auto_16671 ?auto_16674 ) ) ( not ( = ?auto_16671 ?auto_16696 ) ) ( not ( = ?auto_16672 ?auto_16674 ) ) ( not ( = ?auto_16672 ?auto_16696 ) ) ( not ( = ?auto_16674 ?auto_16688 ) ) ( not ( = ?auto_16674 ?auto_16685 ) ) ( not ( = ?auto_16686 ?auto_16697 ) ) ( not ( = ?auto_16686 ?auto_16689 ) ) ( not ( = ?auto_16690 ?auto_16695 ) ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16688 ) ) ( not ( = ?auto_16696 ?auto_16685 ) ) ( not ( = ?auto_16671 ?auto_16675 ) ) ( not ( = ?auto_16671 ?auto_16692 ) ) ( not ( = ?auto_16672 ?auto_16675 ) ) ( not ( = ?auto_16672 ?auto_16692 ) ) ( not ( = ?auto_16673 ?auto_16675 ) ) ( not ( = ?auto_16673 ?auto_16692 ) ) ( not ( = ?auto_16675 ?auto_16696 ) ) ( not ( = ?auto_16675 ?auto_16688 ) ) ( not ( = ?auto_16675 ?auto_16685 ) ) ( not ( = ?auto_16691 ?auto_16686 ) ) ( not ( = ?auto_16691 ?auto_16697 ) ) ( not ( = ?auto_16691 ?auto_16689 ) ) ( not ( = ?auto_16684 ?auto_16690 ) ) ( not ( = ?auto_16684 ?auto_16695 ) ) ( not ( = ?auto_16684 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16692 ?auto_16688 ) ) ( not ( = ?auto_16692 ?auto_16685 ) ) ( not ( = ?auto_16671 ?auto_16676 ) ) ( not ( = ?auto_16671 ?auto_16698 ) ) ( not ( = ?auto_16672 ?auto_16676 ) ) ( not ( = ?auto_16672 ?auto_16698 ) ) ( not ( = ?auto_16673 ?auto_16676 ) ) ( not ( = ?auto_16673 ?auto_16698 ) ) ( not ( = ?auto_16674 ?auto_16676 ) ) ( not ( = ?auto_16674 ?auto_16698 ) ) ( not ( = ?auto_16676 ?auto_16692 ) ) ( not ( = ?auto_16676 ?auto_16696 ) ) ( not ( = ?auto_16676 ?auto_16688 ) ) ( not ( = ?auto_16676 ?auto_16685 ) ) ( not ( = ?auto_16693 ?auto_16691 ) ) ( not ( = ?auto_16693 ?auto_16686 ) ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16693 ?auto_16689 ) ) ( not ( = ?auto_16687 ?auto_16684 ) ) ( not ( = ?auto_16687 ?auto_16690 ) ) ( not ( = ?auto_16687 ?auto_16695 ) ) ( not ( = ?auto_16687 ?auto_16694 ) ) ( not ( = ?auto_16698 ?auto_16692 ) ) ( not ( = ?auto_16698 ?auto_16696 ) ) ( not ( = ?auto_16698 ?auto_16688 ) ) ( not ( = ?auto_16698 ?auto_16685 ) ) ( not ( = ?auto_16671 ?auto_16677 ) ) ( not ( = ?auto_16671 ?auto_16678 ) ) ( not ( = ?auto_16672 ?auto_16677 ) ) ( not ( = ?auto_16672 ?auto_16678 ) ) ( not ( = ?auto_16673 ?auto_16677 ) ) ( not ( = ?auto_16673 ?auto_16678 ) ) ( not ( = ?auto_16674 ?auto_16677 ) ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( not ( = ?auto_16675 ?auto_16677 ) ) ( not ( = ?auto_16675 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16698 ) ) ( not ( = ?auto_16677 ?auto_16692 ) ) ( not ( = ?auto_16677 ?auto_16696 ) ) ( not ( = ?auto_16677 ?auto_16688 ) ) ( not ( = ?auto_16677 ?auto_16685 ) ) ( not ( = ?auto_16683 ?auto_16693 ) ) ( not ( = ?auto_16683 ?auto_16691 ) ) ( not ( = ?auto_16683 ?auto_16686 ) ) ( not ( = ?auto_16683 ?auto_16697 ) ) ( not ( = ?auto_16683 ?auto_16689 ) ) ( not ( = ?auto_16679 ?auto_16687 ) ) ( not ( = ?auto_16679 ?auto_16684 ) ) ( not ( = ?auto_16679 ?auto_16690 ) ) ( not ( = ?auto_16679 ?auto_16695 ) ) ( not ( = ?auto_16679 ?auto_16694 ) ) ( not ( = ?auto_16678 ?auto_16698 ) ) ( not ( = ?auto_16678 ?auto_16692 ) ) ( not ( = ?auto_16678 ?auto_16696 ) ) ( not ( = ?auto_16678 ?auto_16688 ) ) ( not ( = ?auto_16678 ?auto_16685 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16671 ?auto_16672 ?auto_16673 ?auto_16674 ?auto_16675 ?auto_16676 )
      ( MAKE-1CRATE ?auto_16676 ?auto_16677 )
      ( MAKE-6CRATE-VERIFY ?auto_16671 ?auto_16672 ?auto_16673 ?auto_16674 ?auto_16675 ?auto_16676 ?auto_16677 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16717 - SURFACE
      ?auto_16718 - SURFACE
      ?auto_16719 - SURFACE
      ?auto_16720 - SURFACE
      ?auto_16721 - SURFACE
      ?auto_16722 - SURFACE
      ?auto_16723 - SURFACE
      ?auto_16724 - SURFACE
    )
    :vars
    (
      ?auto_16727 - HOIST
      ?auto_16730 - PLACE
      ?auto_16726 - PLACE
      ?auto_16725 - HOIST
      ?auto_16729 - SURFACE
      ?auto_16737 - PLACE
      ?auto_16738 - HOIST
      ?auto_16739 - SURFACE
      ?auto_16731 - PLACE
      ?auto_16745 - HOIST
      ?auto_16748 - SURFACE
      ?auto_16741 - PLACE
      ?auto_16734 - HOIST
      ?auto_16733 - SURFACE
      ?auto_16747 - PLACE
      ?auto_16742 - HOIST
      ?auto_16736 - SURFACE
      ?auto_16740 - PLACE
      ?auto_16735 - HOIST
      ?auto_16744 - SURFACE
      ?auto_16743 - PLACE
      ?auto_16732 - HOIST
      ?auto_16746 - SURFACE
      ?auto_16728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16727 ?auto_16730 ) ( IS-CRATE ?auto_16724 ) ( not ( = ?auto_16726 ?auto_16730 ) ) ( HOIST-AT ?auto_16725 ?auto_16726 ) ( AVAILABLE ?auto_16725 ) ( SURFACE-AT ?auto_16724 ?auto_16726 ) ( ON ?auto_16724 ?auto_16729 ) ( CLEAR ?auto_16724 ) ( not ( = ?auto_16723 ?auto_16724 ) ) ( not ( = ?auto_16723 ?auto_16729 ) ) ( not ( = ?auto_16724 ?auto_16729 ) ) ( not ( = ?auto_16727 ?auto_16725 ) ) ( IS-CRATE ?auto_16723 ) ( not ( = ?auto_16737 ?auto_16730 ) ) ( HOIST-AT ?auto_16738 ?auto_16737 ) ( AVAILABLE ?auto_16738 ) ( SURFACE-AT ?auto_16723 ?auto_16737 ) ( ON ?auto_16723 ?auto_16739 ) ( CLEAR ?auto_16723 ) ( not ( = ?auto_16722 ?auto_16723 ) ) ( not ( = ?auto_16722 ?auto_16739 ) ) ( not ( = ?auto_16723 ?auto_16739 ) ) ( not ( = ?auto_16727 ?auto_16738 ) ) ( IS-CRATE ?auto_16722 ) ( not ( = ?auto_16731 ?auto_16730 ) ) ( HOIST-AT ?auto_16745 ?auto_16731 ) ( AVAILABLE ?auto_16745 ) ( SURFACE-AT ?auto_16722 ?auto_16731 ) ( ON ?auto_16722 ?auto_16748 ) ( CLEAR ?auto_16722 ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( not ( = ?auto_16721 ?auto_16748 ) ) ( not ( = ?auto_16722 ?auto_16748 ) ) ( not ( = ?auto_16727 ?auto_16745 ) ) ( IS-CRATE ?auto_16721 ) ( not ( = ?auto_16741 ?auto_16730 ) ) ( HOIST-AT ?auto_16734 ?auto_16741 ) ( AVAILABLE ?auto_16734 ) ( SURFACE-AT ?auto_16721 ?auto_16741 ) ( ON ?auto_16721 ?auto_16733 ) ( CLEAR ?auto_16721 ) ( not ( = ?auto_16720 ?auto_16721 ) ) ( not ( = ?auto_16720 ?auto_16733 ) ) ( not ( = ?auto_16721 ?auto_16733 ) ) ( not ( = ?auto_16727 ?auto_16734 ) ) ( IS-CRATE ?auto_16720 ) ( not ( = ?auto_16747 ?auto_16730 ) ) ( HOIST-AT ?auto_16742 ?auto_16747 ) ( AVAILABLE ?auto_16742 ) ( SURFACE-AT ?auto_16720 ?auto_16747 ) ( ON ?auto_16720 ?auto_16736 ) ( CLEAR ?auto_16720 ) ( not ( = ?auto_16719 ?auto_16720 ) ) ( not ( = ?auto_16719 ?auto_16736 ) ) ( not ( = ?auto_16720 ?auto_16736 ) ) ( not ( = ?auto_16727 ?auto_16742 ) ) ( IS-CRATE ?auto_16719 ) ( not ( = ?auto_16740 ?auto_16730 ) ) ( HOIST-AT ?auto_16735 ?auto_16740 ) ( AVAILABLE ?auto_16735 ) ( SURFACE-AT ?auto_16719 ?auto_16740 ) ( ON ?auto_16719 ?auto_16744 ) ( CLEAR ?auto_16719 ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( not ( = ?auto_16718 ?auto_16744 ) ) ( not ( = ?auto_16719 ?auto_16744 ) ) ( not ( = ?auto_16727 ?auto_16735 ) ) ( SURFACE-AT ?auto_16717 ?auto_16730 ) ( CLEAR ?auto_16717 ) ( IS-CRATE ?auto_16718 ) ( AVAILABLE ?auto_16727 ) ( not ( = ?auto_16743 ?auto_16730 ) ) ( HOIST-AT ?auto_16732 ?auto_16743 ) ( AVAILABLE ?auto_16732 ) ( SURFACE-AT ?auto_16718 ?auto_16743 ) ( ON ?auto_16718 ?auto_16746 ) ( CLEAR ?auto_16718 ) ( TRUCK-AT ?auto_16728 ?auto_16730 ) ( not ( = ?auto_16717 ?auto_16718 ) ) ( not ( = ?auto_16717 ?auto_16746 ) ) ( not ( = ?auto_16718 ?auto_16746 ) ) ( not ( = ?auto_16727 ?auto_16732 ) ) ( not ( = ?auto_16717 ?auto_16719 ) ) ( not ( = ?auto_16717 ?auto_16744 ) ) ( not ( = ?auto_16719 ?auto_16746 ) ) ( not ( = ?auto_16740 ?auto_16743 ) ) ( not ( = ?auto_16735 ?auto_16732 ) ) ( not ( = ?auto_16744 ?auto_16746 ) ) ( not ( = ?auto_16717 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16736 ) ) ( not ( = ?auto_16718 ?auto_16720 ) ) ( not ( = ?auto_16718 ?auto_16736 ) ) ( not ( = ?auto_16720 ?auto_16744 ) ) ( not ( = ?auto_16720 ?auto_16746 ) ) ( not ( = ?auto_16747 ?auto_16740 ) ) ( not ( = ?auto_16747 ?auto_16743 ) ) ( not ( = ?auto_16742 ?auto_16735 ) ) ( not ( = ?auto_16742 ?auto_16732 ) ) ( not ( = ?auto_16736 ?auto_16744 ) ) ( not ( = ?auto_16736 ?auto_16746 ) ) ( not ( = ?auto_16717 ?auto_16721 ) ) ( not ( = ?auto_16717 ?auto_16733 ) ) ( not ( = ?auto_16718 ?auto_16721 ) ) ( not ( = ?auto_16718 ?auto_16733 ) ) ( not ( = ?auto_16719 ?auto_16721 ) ) ( not ( = ?auto_16719 ?auto_16733 ) ) ( not ( = ?auto_16721 ?auto_16736 ) ) ( not ( = ?auto_16721 ?auto_16744 ) ) ( not ( = ?auto_16721 ?auto_16746 ) ) ( not ( = ?auto_16741 ?auto_16747 ) ) ( not ( = ?auto_16741 ?auto_16740 ) ) ( not ( = ?auto_16741 ?auto_16743 ) ) ( not ( = ?auto_16734 ?auto_16742 ) ) ( not ( = ?auto_16734 ?auto_16735 ) ) ( not ( = ?auto_16734 ?auto_16732 ) ) ( not ( = ?auto_16733 ?auto_16736 ) ) ( not ( = ?auto_16733 ?auto_16744 ) ) ( not ( = ?auto_16733 ?auto_16746 ) ) ( not ( = ?auto_16717 ?auto_16722 ) ) ( not ( = ?auto_16717 ?auto_16748 ) ) ( not ( = ?auto_16718 ?auto_16722 ) ) ( not ( = ?auto_16718 ?auto_16748 ) ) ( not ( = ?auto_16719 ?auto_16722 ) ) ( not ( = ?auto_16719 ?auto_16748 ) ) ( not ( = ?auto_16720 ?auto_16722 ) ) ( not ( = ?auto_16720 ?auto_16748 ) ) ( not ( = ?auto_16722 ?auto_16733 ) ) ( not ( = ?auto_16722 ?auto_16736 ) ) ( not ( = ?auto_16722 ?auto_16744 ) ) ( not ( = ?auto_16722 ?auto_16746 ) ) ( not ( = ?auto_16731 ?auto_16741 ) ) ( not ( = ?auto_16731 ?auto_16747 ) ) ( not ( = ?auto_16731 ?auto_16740 ) ) ( not ( = ?auto_16731 ?auto_16743 ) ) ( not ( = ?auto_16745 ?auto_16734 ) ) ( not ( = ?auto_16745 ?auto_16742 ) ) ( not ( = ?auto_16745 ?auto_16735 ) ) ( not ( = ?auto_16745 ?auto_16732 ) ) ( not ( = ?auto_16748 ?auto_16733 ) ) ( not ( = ?auto_16748 ?auto_16736 ) ) ( not ( = ?auto_16748 ?auto_16744 ) ) ( not ( = ?auto_16748 ?auto_16746 ) ) ( not ( = ?auto_16717 ?auto_16723 ) ) ( not ( = ?auto_16717 ?auto_16739 ) ) ( not ( = ?auto_16718 ?auto_16723 ) ) ( not ( = ?auto_16718 ?auto_16739 ) ) ( not ( = ?auto_16719 ?auto_16723 ) ) ( not ( = ?auto_16719 ?auto_16739 ) ) ( not ( = ?auto_16720 ?auto_16723 ) ) ( not ( = ?auto_16720 ?auto_16739 ) ) ( not ( = ?auto_16721 ?auto_16723 ) ) ( not ( = ?auto_16721 ?auto_16739 ) ) ( not ( = ?auto_16723 ?auto_16748 ) ) ( not ( = ?auto_16723 ?auto_16733 ) ) ( not ( = ?auto_16723 ?auto_16736 ) ) ( not ( = ?auto_16723 ?auto_16744 ) ) ( not ( = ?auto_16723 ?auto_16746 ) ) ( not ( = ?auto_16737 ?auto_16731 ) ) ( not ( = ?auto_16737 ?auto_16741 ) ) ( not ( = ?auto_16737 ?auto_16747 ) ) ( not ( = ?auto_16737 ?auto_16740 ) ) ( not ( = ?auto_16737 ?auto_16743 ) ) ( not ( = ?auto_16738 ?auto_16745 ) ) ( not ( = ?auto_16738 ?auto_16734 ) ) ( not ( = ?auto_16738 ?auto_16742 ) ) ( not ( = ?auto_16738 ?auto_16735 ) ) ( not ( = ?auto_16738 ?auto_16732 ) ) ( not ( = ?auto_16739 ?auto_16748 ) ) ( not ( = ?auto_16739 ?auto_16733 ) ) ( not ( = ?auto_16739 ?auto_16736 ) ) ( not ( = ?auto_16739 ?auto_16744 ) ) ( not ( = ?auto_16739 ?auto_16746 ) ) ( not ( = ?auto_16717 ?auto_16724 ) ) ( not ( = ?auto_16717 ?auto_16729 ) ) ( not ( = ?auto_16718 ?auto_16724 ) ) ( not ( = ?auto_16718 ?auto_16729 ) ) ( not ( = ?auto_16719 ?auto_16724 ) ) ( not ( = ?auto_16719 ?auto_16729 ) ) ( not ( = ?auto_16720 ?auto_16724 ) ) ( not ( = ?auto_16720 ?auto_16729 ) ) ( not ( = ?auto_16721 ?auto_16724 ) ) ( not ( = ?auto_16721 ?auto_16729 ) ) ( not ( = ?auto_16722 ?auto_16724 ) ) ( not ( = ?auto_16722 ?auto_16729 ) ) ( not ( = ?auto_16724 ?auto_16739 ) ) ( not ( = ?auto_16724 ?auto_16748 ) ) ( not ( = ?auto_16724 ?auto_16733 ) ) ( not ( = ?auto_16724 ?auto_16736 ) ) ( not ( = ?auto_16724 ?auto_16744 ) ) ( not ( = ?auto_16724 ?auto_16746 ) ) ( not ( = ?auto_16726 ?auto_16737 ) ) ( not ( = ?auto_16726 ?auto_16731 ) ) ( not ( = ?auto_16726 ?auto_16741 ) ) ( not ( = ?auto_16726 ?auto_16747 ) ) ( not ( = ?auto_16726 ?auto_16740 ) ) ( not ( = ?auto_16726 ?auto_16743 ) ) ( not ( = ?auto_16725 ?auto_16738 ) ) ( not ( = ?auto_16725 ?auto_16745 ) ) ( not ( = ?auto_16725 ?auto_16734 ) ) ( not ( = ?auto_16725 ?auto_16742 ) ) ( not ( = ?auto_16725 ?auto_16735 ) ) ( not ( = ?auto_16725 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16739 ) ) ( not ( = ?auto_16729 ?auto_16748 ) ) ( not ( = ?auto_16729 ?auto_16733 ) ) ( not ( = ?auto_16729 ?auto_16736 ) ) ( not ( = ?auto_16729 ?auto_16744 ) ) ( not ( = ?auto_16729 ?auto_16746 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16717 ?auto_16718 ?auto_16719 ?auto_16720 ?auto_16721 ?auto_16722 ?auto_16723 )
      ( MAKE-1CRATE ?auto_16723 ?auto_16724 )
      ( MAKE-7CRATE-VERIFY ?auto_16717 ?auto_16718 ?auto_16719 ?auto_16720 ?auto_16721 ?auto_16722 ?auto_16723 ?auto_16724 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16768 - SURFACE
      ?auto_16769 - SURFACE
      ?auto_16770 - SURFACE
      ?auto_16771 - SURFACE
      ?auto_16772 - SURFACE
      ?auto_16773 - SURFACE
      ?auto_16774 - SURFACE
      ?auto_16775 - SURFACE
      ?auto_16776 - SURFACE
    )
    :vars
    (
      ?auto_16779 - HOIST
      ?auto_16781 - PLACE
      ?auto_16782 - PLACE
      ?auto_16778 - HOIST
      ?auto_16777 - SURFACE
      ?auto_16800 - PLACE
      ?auto_16787 - HOIST
      ?auto_16801 - SURFACE
      ?auto_16794 - PLACE
      ?auto_16793 - HOIST
      ?auto_16788 - SURFACE
      ?auto_16785 - PLACE
      ?auto_16783 - HOIST
      ?auto_16784 - SURFACE
      ?auto_16789 - PLACE
      ?auto_16798 - HOIST
      ?auto_16797 - SURFACE
      ?auto_16795 - SURFACE
      ?auto_16790 - PLACE
      ?auto_16796 - HOIST
      ?auto_16792 - SURFACE
      ?auto_16791 - PLACE
      ?auto_16799 - HOIST
      ?auto_16786 - SURFACE
      ?auto_16780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16779 ?auto_16781 ) ( IS-CRATE ?auto_16776 ) ( not ( = ?auto_16782 ?auto_16781 ) ) ( HOIST-AT ?auto_16778 ?auto_16782 ) ( SURFACE-AT ?auto_16776 ?auto_16782 ) ( ON ?auto_16776 ?auto_16777 ) ( CLEAR ?auto_16776 ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( not ( = ?auto_16779 ?auto_16778 ) ) ( IS-CRATE ?auto_16775 ) ( not ( = ?auto_16800 ?auto_16781 ) ) ( HOIST-AT ?auto_16787 ?auto_16800 ) ( AVAILABLE ?auto_16787 ) ( SURFACE-AT ?auto_16775 ?auto_16800 ) ( ON ?auto_16775 ?auto_16801 ) ( CLEAR ?auto_16775 ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16801 ) ) ( not ( = ?auto_16775 ?auto_16801 ) ) ( not ( = ?auto_16779 ?auto_16787 ) ) ( IS-CRATE ?auto_16774 ) ( not ( = ?auto_16794 ?auto_16781 ) ) ( HOIST-AT ?auto_16793 ?auto_16794 ) ( AVAILABLE ?auto_16793 ) ( SURFACE-AT ?auto_16774 ?auto_16794 ) ( ON ?auto_16774 ?auto_16788 ) ( CLEAR ?auto_16774 ) ( not ( = ?auto_16773 ?auto_16774 ) ) ( not ( = ?auto_16773 ?auto_16788 ) ) ( not ( = ?auto_16774 ?auto_16788 ) ) ( not ( = ?auto_16779 ?auto_16793 ) ) ( IS-CRATE ?auto_16773 ) ( not ( = ?auto_16785 ?auto_16781 ) ) ( HOIST-AT ?auto_16783 ?auto_16785 ) ( AVAILABLE ?auto_16783 ) ( SURFACE-AT ?auto_16773 ?auto_16785 ) ( ON ?auto_16773 ?auto_16784 ) ( CLEAR ?auto_16773 ) ( not ( = ?auto_16772 ?auto_16773 ) ) ( not ( = ?auto_16772 ?auto_16784 ) ) ( not ( = ?auto_16773 ?auto_16784 ) ) ( not ( = ?auto_16779 ?auto_16783 ) ) ( IS-CRATE ?auto_16772 ) ( not ( = ?auto_16789 ?auto_16781 ) ) ( HOIST-AT ?auto_16798 ?auto_16789 ) ( AVAILABLE ?auto_16798 ) ( SURFACE-AT ?auto_16772 ?auto_16789 ) ( ON ?auto_16772 ?auto_16797 ) ( CLEAR ?auto_16772 ) ( not ( = ?auto_16771 ?auto_16772 ) ) ( not ( = ?auto_16771 ?auto_16797 ) ) ( not ( = ?auto_16772 ?auto_16797 ) ) ( not ( = ?auto_16779 ?auto_16798 ) ) ( IS-CRATE ?auto_16771 ) ( AVAILABLE ?auto_16778 ) ( SURFACE-AT ?auto_16771 ?auto_16782 ) ( ON ?auto_16771 ?auto_16795 ) ( CLEAR ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16795 ) ) ( not ( = ?auto_16771 ?auto_16795 ) ) ( IS-CRATE ?auto_16770 ) ( not ( = ?auto_16790 ?auto_16781 ) ) ( HOIST-AT ?auto_16796 ?auto_16790 ) ( AVAILABLE ?auto_16796 ) ( SURFACE-AT ?auto_16770 ?auto_16790 ) ( ON ?auto_16770 ?auto_16792 ) ( CLEAR ?auto_16770 ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16792 ) ) ( not ( = ?auto_16770 ?auto_16792 ) ) ( not ( = ?auto_16779 ?auto_16796 ) ) ( SURFACE-AT ?auto_16768 ?auto_16781 ) ( CLEAR ?auto_16768 ) ( IS-CRATE ?auto_16769 ) ( AVAILABLE ?auto_16779 ) ( not ( = ?auto_16791 ?auto_16781 ) ) ( HOIST-AT ?auto_16799 ?auto_16791 ) ( AVAILABLE ?auto_16799 ) ( SURFACE-AT ?auto_16769 ?auto_16791 ) ( ON ?auto_16769 ?auto_16786 ) ( CLEAR ?auto_16769 ) ( TRUCK-AT ?auto_16780 ?auto_16781 ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16786 ) ) ( not ( = ?auto_16769 ?auto_16786 ) ) ( not ( = ?auto_16779 ?auto_16799 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16792 ) ) ( not ( = ?auto_16770 ?auto_16786 ) ) ( not ( = ?auto_16790 ?auto_16791 ) ) ( not ( = ?auto_16796 ?auto_16799 ) ) ( not ( = ?auto_16792 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16795 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16795 ) ) ( not ( = ?auto_16771 ?auto_16792 ) ) ( not ( = ?auto_16771 ?auto_16786 ) ) ( not ( = ?auto_16782 ?auto_16790 ) ) ( not ( = ?auto_16782 ?auto_16791 ) ) ( not ( = ?auto_16778 ?auto_16796 ) ) ( not ( = ?auto_16778 ?auto_16799 ) ) ( not ( = ?auto_16795 ?auto_16792 ) ) ( not ( = ?auto_16795 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16772 ) ) ( not ( = ?auto_16768 ?auto_16797 ) ) ( not ( = ?auto_16769 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16797 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16797 ) ) ( not ( = ?auto_16772 ?auto_16795 ) ) ( not ( = ?auto_16772 ?auto_16792 ) ) ( not ( = ?auto_16772 ?auto_16786 ) ) ( not ( = ?auto_16789 ?auto_16782 ) ) ( not ( = ?auto_16789 ?auto_16790 ) ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16798 ?auto_16778 ) ) ( not ( = ?auto_16798 ?auto_16796 ) ) ( not ( = ?auto_16798 ?auto_16799 ) ) ( not ( = ?auto_16797 ?auto_16795 ) ) ( not ( = ?auto_16797 ?auto_16792 ) ) ( not ( = ?auto_16797 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16773 ) ) ( not ( = ?auto_16768 ?auto_16784 ) ) ( not ( = ?auto_16769 ?auto_16773 ) ) ( not ( = ?auto_16769 ?auto_16784 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16784 ) ) ( not ( = ?auto_16771 ?auto_16773 ) ) ( not ( = ?auto_16771 ?auto_16784 ) ) ( not ( = ?auto_16773 ?auto_16797 ) ) ( not ( = ?auto_16773 ?auto_16795 ) ) ( not ( = ?auto_16773 ?auto_16792 ) ) ( not ( = ?auto_16773 ?auto_16786 ) ) ( not ( = ?auto_16785 ?auto_16789 ) ) ( not ( = ?auto_16785 ?auto_16782 ) ) ( not ( = ?auto_16785 ?auto_16790 ) ) ( not ( = ?auto_16785 ?auto_16791 ) ) ( not ( = ?auto_16783 ?auto_16798 ) ) ( not ( = ?auto_16783 ?auto_16778 ) ) ( not ( = ?auto_16783 ?auto_16796 ) ) ( not ( = ?auto_16783 ?auto_16799 ) ) ( not ( = ?auto_16784 ?auto_16797 ) ) ( not ( = ?auto_16784 ?auto_16795 ) ) ( not ( = ?auto_16784 ?auto_16792 ) ) ( not ( = ?auto_16784 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16774 ) ) ( not ( = ?auto_16768 ?auto_16788 ) ) ( not ( = ?auto_16769 ?auto_16774 ) ) ( not ( = ?auto_16769 ?auto_16788 ) ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( not ( = ?auto_16770 ?auto_16788 ) ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( not ( = ?auto_16771 ?auto_16788 ) ) ( not ( = ?auto_16772 ?auto_16774 ) ) ( not ( = ?auto_16772 ?auto_16788 ) ) ( not ( = ?auto_16774 ?auto_16784 ) ) ( not ( = ?auto_16774 ?auto_16797 ) ) ( not ( = ?auto_16774 ?auto_16795 ) ) ( not ( = ?auto_16774 ?auto_16792 ) ) ( not ( = ?auto_16774 ?auto_16786 ) ) ( not ( = ?auto_16794 ?auto_16785 ) ) ( not ( = ?auto_16794 ?auto_16789 ) ) ( not ( = ?auto_16794 ?auto_16782 ) ) ( not ( = ?auto_16794 ?auto_16790 ) ) ( not ( = ?auto_16794 ?auto_16791 ) ) ( not ( = ?auto_16793 ?auto_16783 ) ) ( not ( = ?auto_16793 ?auto_16798 ) ) ( not ( = ?auto_16793 ?auto_16778 ) ) ( not ( = ?auto_16793 ?auto_16796 ) ) ( not ( = ?auto_16793 ?auto_16799 ) ) ( not ( = ?auto_16788 ?auto_16784 ) ) ( not ( = ?auto_16788 ?auto_16797 ) ) ( not ( = ?auto_16788 ?auto_16795 ) ) ( not ( = ?auto_16788 ?auto_16792 ) ) ( not ( = ?auto_16788 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16775 ) ) ( not ( = ?auto_16768 ?auto_16801 ) ) ( not ( = ?auto_16769 ?auto_16775 ) ) ( not ( = ?auto_16769 ?auto_16801 ) ) ( not ( = ?auto_16770 ?auto_16775 ) ) ( not ( = ?auto_16770 ?auto_16801 ) ) ( not ( = ?auto_16771 ?auto_16775 ) ) ( not ( = ?auto_16771 ?auto_16801 ) ) ( not ( = ?auto_16772 ?auto_16775 ) ) ( not ( = ?auto_16772 ?auto_16801 ) ) ( not ( = ?auto_16773 ?auto_16775 ) ) ( not ( = ?auto_16773 ?auto_16801 ) ) ( not ( = ?auto_16775 ?auto_16788 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16775 ?auto_16797 ) ) ( not ( = ?auto_16775 ?auto_16795 ) ) ( not ( = ?auto_16775 ?auto_16792 ) ) ( not ( = ?auto_16775 ?auto_16786 ) ) ( not ( = ?auto_16800 ?auto_16794 ) ) ( not ( = ?auto_16800 ?auto_16785 ) ) ( not ( = ?auto_16800 ?auto_16789 ) ) ( not ( = ?auto_16800 ?auto_16782 ) ) ( not ( = ?auto_16800 ?auto_16790 ) ) ( not ( = ?auto_16800 ?auto_16791 ) ) ( not ( = ?auto_16787 ?auto_16793 ) ) ( not ( = ?auto_16787 ?auto_16783 ) ) ( not ( = ?auto_16787 ?auto_16798 ) ) ( not ( = ?auto_16787 ?auto_16778 ) ) ( not ( = ?auto_16787 ?auto_16796 ) ) ( not ( = ?auto_16787 ?auto_16799 ) ) ( not ( = ?auto_16801 ?auto_16788 ) ) ( not ( = ?auto_16801 ?auto_16784 ) ) ( not ( = ?auto_16801 ?auto_16797 ) ) ( not ( = ?auto_16801 ?auto_16795 ) ) ( not ( = ?auto_16801 ?auto_16792 ) ) ( not ( = ?auto_16801 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16776 ) ) ( not ( = ?auto_16768 ?auto_16777 ) ) ( not ( = ?auto_16769 ?auto_16776 ) ) ( not ( = ?auto_16769 ?auto_16777 ) ) ( not ( = ?auto_16770 ?auto_16776 ) ) ( not ( = ?auto_16770 ?auto_16777 ) ) ( not ( = ?auto_16771 ?auto_16776 ) ) ( not ( = ?auto_16771 ?auto_16777 ) ) ( not ( = ?auto_16772 ?auto_16776 ) ) ( not ( = ?auto_16772 ?auto_16777 ) ) ( not ( = ?auto_16773 ?auto_16776 ) ) ( not ( = ?auto_16773 ?auto_16777 ) ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( not ( = ?auto_16774 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16801 ) ) ( not ( = ?auto_16776 ?auto_16788 ) ) ( not ( = ?auto_16776 ?auto_16784 ) ) ( not ( = ?auto_16776 ?auto_16797 ) ) ( not ( = ?auto_16776 ?auto_16795 ) ) ( not ( = ?auto_16776 ?auto_16792 ) ) ( not ( = ?auto_16776 ?auto_16786 ) ) ( not ( = ?auto_16777 ?auto_16801 ) ) ( not ( = ?auto_16777 ?auto_16788 ) ) ( not ( = ?auto_16777 ?auto_16784 ) ) ( not ( = ?auto_16777 ?auto_16797 ) ) ( not ( = ?auto_16777 ?auto_16795 ) ) ( not ( = ?auto_16777 ?auto_16792 ) ) ( not ( = ?auto_16777 ?auto_16786 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16768 ?auto_16769 ?auto_16770 ?auto_16771 ?auto_16772 ?auto_16773 ?auto_16774 ?auto_16775 )
      ( MAKE-1CRATE ?auto_16775 ?auto_16776 )
      ( MAKE-8CRATE-VERIFY ?auto_16768 ?auto_16769 ?auto_16770 ?auto_16771 ?auto_16772 ?auto_16773 ?auto_16774 ?auto_16775 ?auto_16776 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16822 - SURFACE
      ?auto_16823 - SURFACE
      ?auto_16824 - SURFACE
      ?auto_16825 - SURFACE
      ?auto_16826 - SURFACE
      ?auto_16827 - SURFACE
      ?auto_16828 - SURFACE
      ?auto_16829 - SURFACE
      ?auto_16830 - SURFACE
      ?auto_16831 - SURFACE
    )
    :vars
    (
      ?auto_16836 - HOIST
      ?auto_16833 - PLACE
      ?auto_16832 - PLACE
      ?auto_16834 - HOIST
      ?auto_16835 - SURFACE
      ?auto_16850 - PLACE
      ?auto_16846 - HOIST
      ?auto_16859 - SURFACE
      ?auto_16847 - PLACE
      ?auto_16857 - HOIST
      ?auto_16839 - SURFACE
      ?auto_16844 - PLACE
      ?auto_16842 - HOIST
      ?auto_16856 - SURFACE
      ?auto_16852 - PLACE
      ?auto_16849 - HOIST
      ?auto_16851 - SURFACE
      ?auto_16855 - PLACE
      ?auto_16840 - HOIST
      ?auto_16858 - SURFACE
      ?auto_16845 - SURFACE
      ?auto_16854 - PLACE
      ?auto_16853 - HOIST
      ?auto_16843 - SURFACE
      ?auto_16841 - PLACE
      ?auto_16838 - HOIST
      ?auto_16848 - SURFACE
      ?auto_16837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16836 ?auto_16833 ) ( IS-CRATE ?auto_16831 ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( HOIST-AT ?auto_16834 ?auto_16832 ) ( AVAILABLE ?auto_16834 ) ( SURFACE-AT ?auto_16831 ?auto_16832 ) ( ON ?auto_16831 ?auto_16835 ) ( CLEAR ?auto_16831 ) ( not ( = ?auto_16830 ?auto_16831 ) ) ( not ( = ?auto_16830 ?auto_16835 ) ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( not ( = ?auto_16836 ?auto_16834 ) ) ( IS-CRATE ?auto_16830 ) ( not ( = ?auto_16850 ?auto_16833 ) ) ( HOIST-AT ?auto_16846 ?auto_16850 ) ( SURFACE-AT ?auto_16830 ?auto_16850 ) ( ON ?auto_16830 ?auto_16859 ) ( CLEAR ?auto_16830 ) ( not ( = ?auto_16829 ?auto_16830 ) ) ( not ( = ?auto_16829 ?auto_16859 ) ) ( not ( = ?auto_16830 ?auto_16859 ) ) ( not ( = ?auto_16836 ?auto_16846 ) ) ( IS-CRATE ?auto_16829 ) ( not ( = ?auto_16847 ?auto_16833 ) ) ( HOIST-AT ?auto_16857 ?auto_16847 ) ( AVAILABLE ?auto_16857 ) ( SURFACE-AT ?auto_16829 ?auto_16847 ) ( ON ?auto_16829 ?auto_16839 ) ( CLEAR ?auto_16829 ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16839 ) ) ( not ( = ?auto_16829 ?auto_16839 ) ) ( not ( = ?auto_16836 ?auto_16857 ) ) ( IS-CRATE ?auto_16828 ) ( not ( = ?auto_16844 ?auto_16833 ) ) ( HOIST-AT ?auto_16842 ?auto_16844 ) ( AVAILABLE ?auto_16842 ) ( SURFACE-AT ?auto_16828 ?auto_16844 ) ( ON ?auto_16828 ?auto_16856 ) ( CLEAR ?auto_16828 ) ( not ( = ?auto_16827 ?auto_16828 ) ) ( not ( = ?auto_16827 ?auto_16856 ) ) ( not ( = ?auto_16828 ?auto_16856 ) ) ( not ( = ?auto_16836 ?auto_16842 ) ) ( IS-CRATE ?auto_16827 ) ( not ( = ?auto_16852 ?auto_16833 ) ) ( HOIST-AT ?auto_16849 ?auto_16852 ) ( AVAILABLE ?auto_16849 ) ( SURFACE-AT ?auto_16827 ?auto_16852 ) ( ON ?auto_16827 ?auto_16851 ) ( CLEAR ?auto_16827 ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16851 ) ) ( not ( = ?auto_16827 ?auto_16851 ) ) ( not ( = ?auto_16836 ?auto_16849 ) ) ( IS-CRATE ?auto_16826 ) ( not ( = ?auto_16855 ?auto_16833 ) ) ( HOIST-AT ?auto_16840 ?auto_16855 ) ( AVAILABLE ?auto_16840 ) ( SURFACE-AT ?auto_16826 ?auto_16855 ) ( ON ?auto_16826 ?auto_16858 ) ( CLEAR ?auto_16826 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16858 ) ) ( not ( = ?auto_16826 ?auto_16858 ) ) ( not ( = ?auto_16836 ?auto_16840 ) ) ( IS-CRATE ?auto_16825 ) ( AVAILABLE ?auto_16846 ) ( SURFACE-AT ?auto_16825 ?auto_16850 ) ( ON ?auto_16825 ?auto_16845 ) ( CLEAR ?auto_16825 ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( not ( = ?auto_16824 ?auto_16845 ) ) ( not ( = ?auto_16825 ?auto_16845 ) ) ( IS-CRATE ?auto_16824 ) ( not ( = ?auto_16854 ?auto_16833 ) ) ( HOIST-AT ?auto_16853 ?auto_16854 ) ( AVAILABLE ?auto_16853 ) ( SURFACE-AT ?auto_16824 ?auto_16854 ) ( ON ?auto_16824 ?auto_16843 ) ( CLEAR ?auto_16824 ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16843 ) ) ( not ( = ?auto_16824 ?auto_16843 ) ) ( not ( = ?auto_16836 ?auto_16853 ) ) ( SURFACE-AT ?auto_16822 ?auto_16833 ) ( CLEAR ?auto_16822 ) ( IS-CRATE ?auto_16823 ) ( AVAILABLE ?auto_16836 ) ( not ( = ?auto_16841 ?auto_16833 ) ) ( HOIST-AT ?auto_16838 ?auto_16841 ) ( AVAILABLE ?auto_16838 ) ( SURFACE-AT ?auto_16823 ?auto_16841 ) ( ON ?auto_16823 ?auto_16848 ) ( CLEAR ?auto_16823 ) ( TRUCK-AT ?auto_16837 ?auto_16833 ) ( not ( = ?auto_16822 ?auto_16823 ) ) ( not ( = ?auto_16822 ?auto_16848 ) ) ( not ( = ?auto_16823 ?auto_16848 ) ) ( not ( = ?auto_16836 ?auto_16838 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16822 ?auto_16843 ) ) ( not ( = ?auto_16824 ?auto_16848 ) ) ( not ( = ?auto_16854 ?auto_16841 ) ) ( not ( = ?auto_16853 ?auto_16838 ) ) ( not ( = ?auto_16843 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16845 ) ) ( not ( = ?auto_16823 ?auto_16825 ) ) ( not ( = ?auto_16823 ?auto_16845 ) ) ( not ( = ?auto_16825 ?auto_16843 ) ) ( not ( = ?auto_16825 ?auto_16848 ) ) ( not ( = ?auto_16850 ?auto_16854 ) ) ( not ( = ?auto_16850 ?auto_16841 ) ) ( not ( = ?auto_16846 ?auto_16853 ) ) ( not ( = ?auto_16846 ?auto_16838 ) ) ( not ( = ?auto_16845 ?auto_16843 ) ) ( not ( = ?auto_16845 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16826 ) ) ( not ( = ?auto_16822 ?auto_16858 ) ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16823 ?auto_16858 ) ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( not ( = ?auto_16824 ?auto_16858 ) ) ( not ( = ?auto_16826 ?auto_16845 ) ) ( not ( = ?auto_16826 ?auto_16843 ) ) ( not ( = ?auto_16826 ?auto_16848 ) ) ( not ( = ?auto_16855 ?auto_16850 ) ) ( not ( = ?auto_16855 ?auto_16854 ) ) ( not ( = ?auto_16855 ?auto_16841 ) ) ( not ( = ?auto_16840 ?auto_16846 ) ) ( not ( = ?auto_16840 ?auto_16853 ) ) ( not ( = ?auto_16840 ?auto_16838 ) ) ( not ( = ?auto_16858 ?auto_16845 ) ) ( not ( = ?auto_16858 ?auto_16843 ) ) ( not ( = ?auto_16858 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16827 ) ) ( not ( = ?auto_16822 ?auto_16851 ) ) ( not ( = ?auto_16823 ?auto_16827 ) ) ( not ( = ?auto_16823 ?auto_16851 ) ) ( not ( = ?auto_16824 ?auto_16827 ) ) ( not ( = ?auto_16824 ?auto_16851 ) ) ( not ( = ?auto_16825 ?auto_16827 ) ) ( not ( = ?auto_16825 ?auto_16851 ) ) ( not ( = ?auto_16827 ?auto_16858 ) ) ( not ( = ?auto_16827 ?auto_16845 ) ) ( not ( = ?auto_16827 ?auto_16843 ) ) ( not ( = ?auto_16827 ?auto_16848 ) ) ( not ( = ?auto_16852 ?auto_16855 ) ) ( not ( = ?auto_16852 ?auto_16850 ) ) ( not ( = ?auto_16852 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16841 ) ) ( not ( = ?auto_16849 ?auto_16840 ) ) ( not ( = ?auto_16849 ?auto_16846 ) ) ( not ( = ?auto_16849 ?auto_16853 ) ) ( not ( = ?auto_16849 ?auto_16838 ) ) ( not ( = ?auto_16851 ?auto_16858 ) ) ( not ( = ?auto_16851 ?auto_16845 ) ) ( not ( = ?auto_16851 ?auto_16843 ) ) ( not ( = ?auto_16851 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16828 ) ) ( not ( = ?auto_16822 ?auto_16856 ) ) ( not ( = ?auto_16823 ?auto_16828 ) ) ( not ( = ?auto_16823 ?auto_16856 ) ) ( not ( = ?auto_16824 ?auto_16828 ) ) ( not ( = ?auto_16824 ?auto_16856 ) ) ( not ( = ?auto_16825 ?auto_16828 ) ) ( not ( = ?auto_16825 ?auto_16856 ) ) ( not ( = ?auto_16826 ?auto_16828 ) ) ( not ( = ?auto_16826 ?auto_16856 ) ) ( not ( = ?auto_16828 ?auto_16851 ) ) ( not ( = ?auto_16828 ?auto_16858 ) ) ( not ( = ?auto_16828 ?auto_16845 ) ) ( not ( = ?auto_16828 ?auto_16843 ) ) ( not ( = ?auto_16828 ?auto_16848 ) ) ( not ( = ?auto_16844 ?auto_16852 ) ) ( not ( = ?auto_16844 ?auto_16855 ) ) ( not ( = ?auto_16844 ?auto_16850 ) ) ( not ( = ?auto_16844 ?auto_16854 ) ) ( not ( = ?auto_16844 ?auto_16841 ) ) ( not ( = ?auto_16842 ?auto_16849 ) ) ( not ( = ?auto_16842 ?auto_16840 ) ) ( not ( = ?auto_16842 ?auto_16846 ) ) ( not ( = ?auto_16842 ?auto_16853 ) ) ( not ( = ?auto_16842 ?auto_16838 ) ) ( not ( = ?auto_16856 ?auto_16851 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16845 ) ) ( not ( = ?auto_16856 ?auto_16843 ) ) ( not ( = ?auto_16856 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16829 ) ) ( not ( = ?auto_16822 ?auto_16839 ) ) ( not ( = ?auto_16823 ?auto_16829 ) ) ( not ( = ?auto_16823 ?auto_16839 ) ) ( not ( = ?auto_16824 ?auto_16829 ) ) ( not ( = ?auto_16824 ?auto_16839 ) ) ( not ( = ?auto_16825 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16839 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16826 ?auto_16839 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16839 ) ) ( not ( = ?auto_16829 ?auto_16856 ) ) ( not ( = ?auto_16829 ?auto_16851 ) ) ( not ( = ?auto_16829 ?auto_16858 ) ) ( not ( = ?auto_16829 ?auto_16845 ) ) ( not ( = ?auto_16829 ?auto_16843 ) ) ( not ( = ?auto_16829 ?auto_16848 ) ) ( not ( = ?auto_16847 ?auto_16844 ) ) ( not ( = ?auto_16847 ?auto_16852 ) ) ( not ( = ?auto_16847 ?auto_16855 ) ) ( not ( = ?auto_16847 ?auto_16850 ) ) ( not ( = ?auto_16847 ?auto_16854 ) ) ( not ( = ?auto_16847 ?auto_16841 ) ) ( not ( = ?auto_16857 ?auto_16842 ) ) ( not ( = ?auto_16857 ?auto_16849 ) ) ( not ( = ?auto_16857 ?auto_16840 ) ) ( not ( = ?auto_16857 ?auto_16846 ) ) ( not ( = ?auto_16857 ?auto_16853 ) ) ( not ( = ?auto_16857 ?auto_16838 ) ) ( not ( = ?auto_16839 ?auto_16856 ) ) ( not ( = ?auto_16839 ?auto_16851 ) ) ( not ( = ?auto_16839 ?auto_16858 ) ) ( not ( = ?auto_16839 ?auto_16845 ) ) ( not ( = ?auto_16839 ?auto_16843 ) ) ( not ( = ?auto_16839 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16830 ) ) ( not ( = ?auto_16822 ?auto_16859 ) ) ( not ( = ?auto_16823 ?auto_16830 ) ) ( not ( = ?auto_16823 ?auto_16859 ) ) ( not ( = ?auto_16824 ?auto_16830 ) ) ( not ( = ?auto_16824 ?auto_16859 ) ) ( not ( = ?auto_16825 ?auto_16830 ) ) ( not ( = ?auto_16825 ?auto_16859 ) ) ( not ( = ?auto_16826 ?auto_16830 ) ) ( not ( = ?auto_16826 ?auto_16859 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16859 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16859 ) ) ( not ( = ?auto_16830 ?auto_16839 ) ) ( not ( = ?auto_16830 ?auto_16856 ) ) ( not ( = ?auto_16830 ?auto_16851 ) ) ( not ( = ?auto_16830 ?auto_16858 ) ) ( not ( = ?auto_16830 ?auto_16845 ) ) ( not ( = ?auto_16830 ?auto_16843 ) ) ( not ( = ?auto_16830 ?auto_16848 ) ) ( not ( = ?auto_16859 ?auto_16839 ) ) ( not ( = ?auto_16859 ?auto_16856 ) ) ( not ( = ?auto_16859 ?auto_16851 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( not ( = ?auto_16859 ?auto_16845 ) ) ( not ( = ?auto_16859 ?auto_16843 ) ) ( not ( = ?auto_16859 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16831 ) ) ( not ( = ?auto_16822 ?auto_16835 ) ) ( not ( = ?auto_16823 ?auto_16831 ) ) ( not ( = ?auto_16823 ?auto_16835 ) ) ( not ( = ?auto_16824 ?auto_16831 ) ) ( not ( = ?auto_16824 ?auto_16835 ) ) ( not ( = ?auto_16825 ?auto_16831 ) ) ( not ( = ?auto_16825 ?auto_16835 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) ( not ( = ?auto_16826 ?auto_16835 ) ) ( not ( = ?auto_16827 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16835 ) ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16828 ?auto_16835 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) ( not ( = ?auto_16829 ?auto_16835 ) ) ( not ( = ?auto_16831 ?auto_16859 ) ) ( not ( = ?auto_16831 ?auto_16839 ) ) ( not ( = ?auto_16831 ?auto_16856 ) ) ( not ( = ?auto_16831 ?auto_16851 ) ) ( not ( = ?auto_16831 ?auto_16858 ) ) ( not ( = ?auto_16831 ?auto_16845 ) ) ( not ( = ?auto_16831 ?auto_16843 ) ) ( not ( = ?auto_16831 ?auto_16848 ) ) ( not ( = ?auto_16832 ?auto_16850 ) ) ( not ( = ?auto_16832 ?auto_16847 ) ) ( not ( = ?auto_16832 ?auto_16844 ) ) ( not ( = ?auto_16832 ?auto_16852 ) ) ( not ( = ?auto_16832 ?auto_16855 ) ) ( not ( = ?auto_16832 ?auto_16854 ) ) ( not ( = ?auto_16832 ?auto_16841 ) ) ( not ( = ?auto_16834 ?auto_16846 ) ) ( not ( = ?auto_16834 ?auto_16857 ) ) ( not ( = ?auto_16834 ?auto_16842 ) ) ( not ( = ?auto_16834 ?auto_16849 ) ) ( not ( = ?auto_16834 ?auto_16840 ) ) ( not ( = ?auto_16834 ?auto_16853 ) ) ( not ( = ?auto_16834 ?auto_16838 ) ) ( not ( = ?auto_16835 ?auto_16859 ) ) ( not ( = ?auto_16835 ?auto_16839 ) ) ( not ( = ?auto_16835 ?auto_16856 ) ) ( not ( = ?auto_16835 ?auto_16851 ) ) ( not ( = ?auto_16835 ?auto_16858 ) ) ( not ( = ?auto_16835 ?auto_16845 ) ) ( not ( = ?auto_16835 ?auto_16843 ) ) ( not ( = ?auto_16835 ?auto_16848 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16822 ?auto_16823 ?auto_16824 ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 )
      ( MAKE-1CRATE ?auto_16830 ?auto_16831 )
      ( MAKE-9CRATE-VERIFY ?auto_16822 ?auto_16823 ?auto_16824 ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 ?auto_16831 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16881 - SURFACE
      ?auto_16882 - SURFACE
      ?auto_16883 - SURFACE
      ?auto_16884 - SURFACE
      ?auto_16885 - SURFACE
      ?auto_16886 - SURFACE
      ?auto_16887 - SURFACE
      ?auto_16888 - SURFACE
      ?auto_16889 - SURFACE
      ?auto_16890 - SURFACE
      ?auto_16891 - SURFACE
    )
    :vars
    (
      ?auto_16894 - HOIST
      ?auto_16892 - PLACE
      ?auto_16896 - PLACE
      ?auto_16895 - HOIST
      ?auto_16893 - SURFACE
      ?auto_16917 - PLACE
      ?auto_16914 - HOIST
      ?auto_16915 - SURFACE
      ?auto_16899 - PLACE
      ?auto_16921 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16909 - PLACE
      ?auto_16912 - HOIST
      ?auto_16901 - SURFACE
      ?auto_16910 - PLACE
      ?auto_16904 - HOIST
      ?auto_16900 - SURFACE
      ?auto_16898 - PLACE
      ?auto_16919 - HOIST
      ?auto_16918 - SURFACE
      ?auto_16907 - PLACE
      ?auto_16913 - HOIST
      ?auto_16903 - SURFACE
      ?auto_16908 - SURFACE
      ?auto_16902 - PLACE
      ?auto_16916 - HOIST
      ?auto_16922 - SURFACE
      ?auto_16911 - PLACE
      ?auto_16905 - HOIST
      ?auto_16920 - SURFACE
      ?auto_16897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16894 ?auto_16892 ) ( IS-CRATE ?auto_16891 ) ( not ( = ?auto_16896 ?auto_16892 ) ) ( HOIST-AT ?auto_16895 ?auto_16896 ) ( AVAILABLE ?auto_16895 ) ( SURFACE-AT ?auto_16891 ?auto_16896 ) ( ON ?auto_16891 ?auto_16893 ) ( CLEAR ?auto_16891 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( IS-CRATE ?auto_16890 ) ( not ( = ?auto_16917 ?auto_16892 ) ) ( HOIST-AT ?auto_16914 ?auto_16917 ) ( AVAILABLE ?auto_16914 ) ( SURFACE-AT ?auto_16890 ?auto_16917 ) ( ON ?auto_16890 ?auto_16915 ) ( CLEAR ?auto_16890 ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16915 ) ) ( not ( = ?auto_16890 ?auto_16915 ) ) ( not ( = ?auto_16894 ?auto_16914 ) ) ( IS-CRATE ?auto_16889 ) ( not ( = ?auto_16899 ?auto_16892 ) ) ( HOIST-AT ?auto_16921 ?auto_16899 ) ( SURFACE-AT ?auto_16889 ?auto_16899 ) ( ON ?auto_16889 ?auto_16906 ) ( CLEAR ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16906 ) ) ( not ( = ?auto_16889 ?auto_16906 ) ) ( not ( = ?auto_16894 ?auto_16921 ) ) ( IS-CRATE ?auto_16888 ) ( not ( = ?auto_16909 ?auto_16892 ) ) ( HOIST-AT ?auto_16912 ?auto_16909 ) ( AVAILABLE ?auto_16912 ) ( SURFACE-AT ?auto_16888 ?auto_16909 ) ( ON ?auto_16888 ?auto_16901 ) ( CLEAR ?auto_16888 ) ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16901 ) ) ( not ( = ?auto_16888 ?auto_16901 ) ) ( not ( = ?auto_16894 ?auto_16912 ) ) ( IS-CRATE ?auto_16887 ) ( not ( = ?auto_16910 ?auto_16892 ) ) ( HOIST-AT ?auto_16904 ?auto_16910 ) ( AVAILABLE ?auto_16904 ) ( SURFACE-AT ?auto_16887 ?auto_16910 ) ( ON ?auto_16887 ?auto_16900 ) ( CLEAR ?auto_16887 ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16900 ) ) ( not ( = ?auto_16887 ?auto_16900 ) ) ( not ( = ?auto_16894 ?auto_16904 ) ) ( IS-CRATE ?auto_16886 ) ( not ( = ?auto_16898 ?auto_16892 ) ) ( HOIST-AT ?auto_16919 ?auto_16898 ) ( AVAILABLE ?auto_16919 ) ( SURFACE-AT ?auto_16886 ?auto_16898 ) ( ON ?auto_16886 ?auto_16918 ) ( CLEAR ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16918 ) ) ( not ( = ?auto_16886 ?auto_16918 ) ) ( not ( = ?auto_16894 ?auto_16919 ) ) ( IS-CRATE ?auto_16885 ) ( not ( = ?auto_16907 ?auto_16892 ) ) ( HOIST-AT ?auto_16913 ?auto_16907 ) ( AVAILABLE ?auto_16913 ) ( SURFACE-AT ?auto_16885 ?auto_16907 ) ( ON ?auto_16885 ?auto_16903 ) ( CLEAR ?auto_16885 ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16903 ) ) ( not ( = ?auto_16885 ?auto_16903 ) ) ( not ( = ?auto_16894 ?auto_16913 ) ) ( IS-CRATE ?auto_16884 ) ( AVAILABLE ?auto_16921 ) ( SURFACE-AT ?auto_16884 ?auto_16899 ) ( ON ?auto_16884 ?auto_16908 ) ( CLEAR ?auto_16884 ) ( not ( = ?auto_16883 ?auto_16884 ) ) ( not ( = ?auto_16883 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16908 ) ) ( IS-CRATE ?auto_16883 ) ( not ( = ?auto_16902 ?auto_16892 ) ) ( HOIST-AT ?auto_16916 ?auto_16902 ) ( AVAILABLE ?auto_16916 ) ( SURFACE-AT ?auto_16883 ?auto_16902 ) ( ON ?auto_16883 ?auto_16922 ) ( CLEAR ?auto_16883 ) ( not ( = ?auto_16882 ?auto_16883 ) ) ( not ( = ?auto_16882 ?auto_16922 ) ) ( not ( = ?auto_16883 ?auto_16922 ) ) ( not ( = ?auto_16894 ?auto_16916 ) ) ( SURFACE-AT ?auto_16881 ?auto_16892 ) ( CLEAR ?auto_16881 ) ( IS-CRATE ?auto_16882 ) ( AVAILABLE ?auto_16894 ) ( not ( = ?auto_16911 ?auto_16892 ) ) ( HOIST-AT ?auto_16905 ?auto_16911 ) ( AVAILABLE ?auto_16905 ) ( SURFACE-AT ?auto_16882 ?auto_16911 ) ( ON ?auto_16882 ?auto_16920 ) ( CLEAR ?auto_16882 ) ( TRUCK-AT ?auto_16897 ?auto_16892 ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( not ( = ?auto_16881 ?auto_16920 ) ) ( not ( = ?auto_16882 ?auto_16920 ) ) ( not ( = ?auto_16894 ?auto_16905 ) ) ( not ( = ?auto_16881 ?auto_16883 ) ) ( not ( = ?auto_16881 ?auto_16922 ) ) ( not ( = ?auto_16883 ?auto_16920 ) ) ( not ( = ?auto_16902 ?auto_16911 ) ) ( not ( = ?auto_16916 ?auto_16905 ) ) ( not ( = ?auto_16922 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16884 ) ) ( not ( = ?auto_16881 ?auto_16908 ) ) ( not ( = ?auto_16882 ?auto_16884 ) ) ( not ( = ?auto_16882 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16922 ) ) ( not ( = ?auto_16884 ?auto_16920 ) ) ( not ( = ?auto_16899 ?auto_16902 ) ) ( not ( = ?auto_16899 ?auto_16911 ) ) ( not ( = ?auto_16921 ?auto_16916 ) ) ( not ( = ?auto_16921 ?auto_16905 ) ) ( not ( = ?auto_16908 ?auto_16922 ) ) ( not ( = ?auto_16908 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16885 ) ) ( not ( = ?auto_16881 ?auto_16903 ) ) ( not ( = ?auto_16882 ?auto_16885 ) ) ( not ( = ?auto_16882 ?auto_16903 ) ) ( not ( = ?auto_16883 ?auto_16885 ) ) ( not ( = ?auto_16883 ?auto_16903 ) ) ( not ( = ?auto_16885 ?auto_16908 ) ) ( not ( = ?auto_16885 ?auto_16922 ) ) ( not ( = ?auto_16885 ?auto_16920 ) ) ( not ( = ?auto_16907 ?auto_16899 ) ) ( not ( = ?auto_16907 ?auto_16902 ) ) ( not ( = ?auto_16907 ?auto_16911 ) ) ( not ( = ?auto_16913 ?auto_16921 ) ) ( not ( = ?auto_16913 ?auto_16916 ) ) ( not ( = ?auto_16913 ?auto_16905 ) ) ( not ( = ?auto_16903 ?auto_16908 ) ) ( not ( = ?auto_16903 ?auto_16922 ) ) ( not ( = ?auto_16903 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16886 ) ) ( not ( = ?auto_16881 ?auto_16918 ) ) ( not ( = ?auto_16882 ?auto_16886 ) ) ( not ( = ?auto_16882 ?auto_16918 ) ) ( not ( = ?auto_16883 ?auto_16886 ) ) ( not ( = ?auto_16883 ?auto_16918 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16884 ?auto_16918 ) ) ( not ( = ?auto_16886 ?auto_16903 ) ) ( not ( = ?auto_16886 ?auto_16908 ) ) ( not ( = ?auto_16886 ?auto_16922 ) ) ( not ( = ?auto_16886 ?auto_16920 ) ) ( not ( = ?auto_16898 ?auto_16907 ) ) ( not ( = ?auto_16898 ?auto_16899 ) ) ( not ( = ?auto_16898 ?auto_16902 ) ) ( not ( = ?auto_16898 ?auto_16911 ) ) ( not ( = ?auto_16919 ?auto_16913 ) ) ( not ( = ?auto_16919 ?auto_16921 ) ) ( not ( = ?auto_16919 ?auto_16916 ) ) ( not ( = ?auto_16919 ?auto_16905 ) ) ( not ( = ?auto_16918 ?auto_16903 ) ) ( not ( = ?auto_16918 ?auto_16908 ) ) ( not ( = ?auto_16918 ?auto_16922 ) ) ( not ( = ?auto_16918 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16887 ) ) ( not ( = ?auto_16881 ?auto_16900 ) ) ( not ( = ?auto_16882 ?auto_16887 ) ) ( not ( = ?auto_16882 ?auto_16900 ) ) ( not ( = ?auto_16883 ?auto_16887 ) ) ( not ( = ?auto_16883 ?auto_16900 ) ) ( not ( = ?auto_16884 ?auto_16887 ) ) ( not ( = ?auto_16884 ?auto_16900 ) ) ( not ( = ?auto_16885 ?auto_16887 ) ) ( not ( = ?auto_16885 ?auto_16900 ) ) ( not ( = ?auto_16887 ?auto_16918 ) ) ( not ( = ?auto_16887 ?auto_16903 ) ) ( not ( = ?auto_16887 ?auto_16908 ) ) ( not ( = ?auto_16887 ?auto_16922 ) ) ( not ( = ?auto_16887 ?auto_16920 ) ) ( not ( = ?auto_16910 ?auto_16898 ) ) ( not ( = ?auto_16910 ?auto_16907 ) ) ( not ( = ?auto_16910 ?auto_16899 ) ) ( not ( = ?auto_16910 ?auto_16902 ) ) ( not ( = ?auto_16910 ?auto_16911 ) ) ( not ( = ?auto_16904 ?auto_16919 ) ) ( not ( = ?auto_16904 ?auto_16913 ) ) ( not ( = ?auto_16904 ?auto_16921 ) ) ( not ( = ?auto_16904 ?auto_16916 ) ) ( not ( = ?auto_16904 ?auto_16905 ) ) ( not ( = ?auto_16900 ?auto_16918 ) ) ( not ( = ?auto_16900 ?auto_16903 ) ) ( not ( = ?auto_16900 ?auto_16908 ) ) ( not ( = ?auto_16900 ?auto_16922 ) ) ( not ( = ?auto_16900 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16888 ) ) ( not ( = ?auto_16881 ?auto_16901 ) ) ( not ( = ?auto_16882 ?auto_16888 ) ) ( not ( = ?auto_16882 ?auto_16901 ) ) ( not ( = ?auto_16883 ?auto_16888 ) ) ( not ( = ?auto_16883 ?auto_16901 ) ) ( not ( = ?auto_16884 ?auto_16888 ) ) ( not ( = ?auto_16884 ?auto_16901 ) ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16885 ?auto_16901 ) ) ( not ( = ?auto_16886 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16901 ) ) ( not ( = ?auto_16888 ?auto_16900 ) ) ( not ( = ?auto_16888 ?auto_16918 ) ) ( not ( = ?auto_16888 ?auto_16903 ) ) ( not ( = ?auto_16888 ?auto_16908 ) ) ( not ( = ?auto_16888 ?auto_16922 ) ) ( not ( = ?auto_16888 ?auto_16920 ) ) ( not ( = ?auto_16909 ?auto_16910 ) ) ( not ( = ?auto_16909 ?auto_16898 ) ) ( not ( = ?auto_16909 ?auto_16907 ) ) ( not ( = ?auto_16909 ?auto_16899 ) ) ( not ( = ?auto_16909 ?auto_16902 ) ) ( not ( = ?auto_16909 ?auto_16911 ) ) ( not ( = ?auto_16912 ?auto_16904 ) ) ( not ( = ?auto_16912 ?auto_16919 ) ) ( not ( = ?auto_16912 ?auto_16913 ) ) ( not ( = ?auto_16912 ?auto_16921 ) ) ( not ( = ?auto_16912 ?auto_16916 ) ) ( not ( = ?auto_16912 ?auto_16905 ) ) ( not ( = ?auto_16901 ?auto_16900 ) ) ( not ( = ?auto_16901 ?auto_16918 ) ) ( not ( = ?auto_16901 ?auto_16903 ) ) ( not ( = ?auto_16901 ?auto_16908 ) ) ( not ( = ?auto_16901 ?auto_16922 ) ) ( not ( = ?auto_16901 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16889 ) ) ( not ( = ?auto_16881 ?auto_16906 ) ) ( not ( = ?auto_16882 ?auto_16889 ) ) ( not ( = ?auto_16882 ?auto_16906 ) ) ( not ( = ?auto_16883 ?auto_16889 ) ) ( not ( = ?auto_16883 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16889 ) ) ( not ( = ?auto_16884 ?auto_16906 ) ) ( not ( = ?auto_16885 ?auto_16889 ) ) ( not ( = ?auto_16885 ?auto_16906 ) ) ( not ( = ?auto_16886 ?auto_16889 ) ) ( not ( = ?auto_16886 ?auto_16906 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16906 ) ) ( not ( = ?auto_16889 ?auto_16901 ) ) ( not ( = ?auto_16889 ?auto_16900 ) ) ( not ( = ?auto_16889 ?auto_16918 ) ) ( not ( = ?auto_16889 ?auto_16903 ) ) ( not ( = ?auto_16889 ?auto_16908 ) ) ( not ( = ?auto_16889 ?auto_16922 ) ) ( not ( = ?auto_16889 ?auto_16920 ) ) ( not ( = ?auto_16906 ?auto_16901 ) ) ( not ( = ?auto_16906 ?auto_16900 ) ) ( not ( = ?auto_16906 ?auto_16918 ) ) ( not ( = ?auto_16906 ?auto_16903 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16906 ?auto_16922 ) ) ( not ( = ?auto_16906 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16890 ) ) ( not ( = ?auto_16881 ?auto_16915 ) ) ( not ( = ?auto_16882 ?auto_16890 ) ) ( not ( = ?auto_16882 ?auto_16915 ) ) ( not ( = ?auto_16883 ?auto_16890 ) ) ( not ( = ?auto_16883 ?auto_16915 ) ) ( not ( = ?auto_16884 ?auto_16890 ) ) ( not ( = ?auto_16884 ?auto_16915 ) ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16915 ) ) ( not ( = ?auto_16886 ?auto_16890 ) ) ( not ( = ?auto_16886 ?auto_16915 ) ) ( not ( = ?auto_16887 ?auto_16890 ) ) ( not ( = ?auto_16887 ?auto_16915 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16915 ) ) ( not ( = ?auto_16890 ?auto_16906 ) ) ( not ( = ?auto_16890 ?auto_16901 ) ) ( not ( = ?auto_16890 ?auto_16900 ) ) ( not ( = ?auto_16890 ?auto_16918 ) ) ( not ( = ?auto_16890 ?auto_16903 ) ) ( not ( = ?auto_16890 ?auto_16908 ) ) ( not ( = ?auto_16890 ?auto_16922 ) ) ( not ( = ?auto_16890 ?auto_16920 ) ) ( not ( = ?auto_16917 ?auto_16899 ) ) ( not ( = ?auto_16917 ?auto_16909 ) ) ( not ( = ?auto_16917 ?auto_16910 ) ) ( not ( = ?auto_16917 ?auto_16898 ) ) ( not ( = ?auto_16917 ?auto_16907 ) ) ( not ( = ?auto_16917 ?auto_16902 ) ) ( not ( = ?auto_16917 ?auto_16911 ) ) ( not ( = ?auto_16914 ?auto_16921 ) ) ( not ( = ?auto_16914 ?auto_16912 ) ) ( not ( = ?auto_16914 ?auto_16904 ) ) ( not ( = ?auto_16914 ?auto_16919 ) ) ( not ( = ?auto_16914 ?auto_16913 ) ) ( not ( = ?auto_16914 ?auto_16916 ) ) ( not ( = ?auto_16914 ?auto_16905 ) ) ( not ( = ?auto_16915 ?auto_16906 ) ) ( not ( = ?auto_16915 ?auto_16901 ) ) ( not ( = ?auto_16915 ?auto_16900 ) ) ( not ( = ?auto_16915 ?auto_16918 ) ) ( not ( = ?auto_16915 ?auto_16903 ) ) ( not ( = ?auto_16915 ?auto_16908 ) ) ( not ( = ?auto_16915 ?auto_16922 ) ) ( not ( = ?auto_16915 ?auto_16920 ) ) ( not ( = ?auto_16881 ?auto_16891 ) ) ( not ( = ?auto_16881 ?auto_16893 ) ) ( not ( = ?auto_16882 ?auto_16891 ) ) ( not ( = ?auto_16882 ?auto_16893 ) ) ( not ( = ?auto_16883 ?auto_16891 ) ) ( not ( = ?auto_16883 ?auto_16893 ) ) ( not ( = ?auto_16884 ?auto_16891 ) ) ( not ( = ?auto_16884 ?auto_16893 ) ) ( not ( = ?auto_16885 ?auto_16891 ) ) ( not ( = ?auto_16885 ?auto_16893 ) ) ( not ( = ?auto_16886 ?auto_16891 ) ) ( not ( = ?auto_16886 ?auto_16893 ) ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16887 ?auto_16893 ) ) ( not ( = ?auto_16888 ?auto_16891 ) ) ( not ( = ?auto_16888 ?auto_16893 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16915 ) ) ( not ( = ?auto_16891 ?auto_16906 ) ) ( not ( = ?auto_16891 ?auto_16901 ) ) ( not ( = ?auto_16891 ?auto_16900 ) ) ( not ( = ?auto_16891 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16903 ) ) ( not ( = ?auto_16891 ?auto_16908 ) ) ( not ( = ?auto_16891 ?auto_16922 ) ) ( not ( = ?auto_16891 ?auto_16920 ) ) ( not ( = ?auto_16896 ?auto_16917 ) ) ( not ( = ?auto_16896 ?auto_16899 ) ) ( not ( = ?auto_16896 ?auto_16909 ) ) ( not ( = ?auto_16896 ?auto_16910 ) ) ( not ( = ?auto_16896 ?auto_16898 ) ) ( not ( = ?auto_16896 ?auto_16907 ) ) ( not ( = ?auto_16896 ?auto_16902 ) ) ( not ( = ?auto_16896 ?auto_16911 ) ) ( not ( = ?auto_16895 ?auto_16914 ) ) ( not ( = ?auto_16895 ?auto_16921 ) ) ( not ( = ?auto_16895 ?auto_16912 ) ) ( not ( = ?auto_16895 ?auto_16904 ) ) ( not ( = ?auto_16895 ?auto_16919 ) ) ( not ( = ?auto_16895 ?auto_16913 ) ) ( not ( = ?auto_16895 ?auto_16916 ) ) ( not ( = ?auto_16895 ?auto_16905 ) ) ( not ( = ?auto_16893 ?auto_16915 ) ) ( not ( = ?auto_16893 ?auto_16906 ) ) ( not ( = ?auto_16893 ?auto_16901 ) ) ( not ( = ?auto_16893 ?auto_16900 ) ) ( not ( = ?auto_16893 ?auto_16918 ) ) ( not ( = ?auto_16893 ?auto_16903 ) ) ( not ( = ?auto_16893 ?auto_16908 ) ) ( not ( = ?auto_16893 ?auto_16922 ) ) ( not ( = ?auto_16893 ?auto_16920 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16881 ?auto_16882 ?auto_16883 ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16890 )
      ( MAKE-1CRATE ?auto_16890 ?auto_16891 )
      ( MAKE-10CRATE-VERIFY ?auto_16881 ?auto_16882 ?auto_16883 ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16890 ?auto_16891 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16945 - SURFACE
      ?auto_16946 - SURFACE
      ?auto_16947 - SURFACE
      ?auto_16948 - SURFACE
      ?auto_16949 - SURFACE
      ?auto_16950 - SURFACE
      ?auto_16951 - SURFACE
      ?auto_16952 - SURFACE
      ?auto_16953 - SURFACE
      ?auto_16954 - SURFACE
      ?auto_16955 - SURFACE
      ?auto_16956 - SURFACE
    )
    :vars
    (
      ?auto_16959 - HOIST
      ?auto_16957 - PLACE
      ?auto_16962 - PLACE
      ?auto_16960 - HOIST
      ?auto_16961 - SURFACE
      ?auto_16978 - PLACE
      ?auto_16990 - HOIST
      ?auto_16967 - SURFACE
      ?auto_16976 - PLACE
      ?auto_16970 - HOIST
      ?auto_16982 - SURFACE
      ?auto_16986 - PLACE
      ?auto_16979 - HOIST
      ?auto_16965 - SURFACE
      ?auto_16973 - PLACE
      ?auto_16966 - HOIST
      ?auto_16983 - SURFACE
      ?auto_16984 - PLACE
      ?auto_16988 - HOIST
      ?auto_16972 - SURFACE
      ?auto_16963 - PLACE
      ?auto_16977 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16985 - PLACE
      ?auto_16987 - HOIST
      ?auto_16964 - SURFACE
      ?auto_16969 - SURFACE
      ?auto_16981 - PLACE
      ?auto_16971 - HOIST
      ?auto_16968 - SURFACE
      ?auto_16989 - PLACE
      ?auto_16975 - HOIST
      ?auto_16980 - SURFACE
      ?auto_16958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16959 ?auto_16957 ) ( IS-CRATE ?auto_16956 ) ( not ( = ?auto_16962 ?auto_16957 ) ) ( HOIST-AT ?auto_16960 ?auto_16962 ) ( AVAILABLE ?auto_16960 ) ( SURFACE-AT ?auto_16956 ?auto_16962 ) ( ON ?auto_16956 ?auto_16961 ) ( CLEAR ?auto_16956 ) ( not ( = ?auto_16955 ?auto_16956 ) ) ( not ( = ?auto_16955 ?auto_16961 ) ) ( not ( = ?auto_16956 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( IS-CRATE ?auto_16955 ) ( not ( = ?auto_16978 ?auto_16957 ) ) ( HOIST-AT ?auto_16990 ?auto_16978 ) ( AVAILABLE ?auto_16990 ) ( SURFACE-AT ?auto_16955 ?auto_16978 ) ( ON ?auto_16955 ?auto_16967 ) ( CLEAR ?auto_16955 ) ( not ( = ?auto_16954 ?auto_16955 ) ) ( not ( = ?auto_16954 ?auto_16967 ) ) ( not ( = ?auto_16955 ?auto_16967 ) ) ( not ( = ?auto_16959 ?auto_16990 ) ) ( IS-CRATE ?auto_16954 ) ( not ( = ?auto_16976 ?auto_16957 ) ) ( HOIST-AT ?auto_16970 ?auto_16976 ) ( AVAILABLE ?auto_16970 ) ( SURFACE-AT ?auto_16954 ?auto_16976 ) ( ON ?auto_16954 ?auto_16982 ) ( CLEAR ?auto_16954 ) ( not ( = ?auto_16953 ?auto_16954 ) ) ( not ( = ?auto_16953 ?auto_16982 ) ) ( not ( = ?auto_16954 ?auto_16982 ) ) ( not ( = ?auto_16959 ?auto_16970 ) ) ( IS-CRATE ?auto_16953 ) ( not ( = ?auto_16986 ?auto_16957 ) ) ( HOIST-AT ?auto_16979 ?auto_16986 ) ( SURFACE-AT ?auto_16953 ?auto_16986 ) ( ON ?auto_16953 ?auto_16965 ) ( CLEAR ?auto_16953 ) ( not ( = ?auto_16952 ?auto_16953 ) ) ( not ( = ?auto_16952 ?auto_16965 ) ) ( not ( = ?auto_16953 ?auto_16965 ) ) ( not ( = ?auto_16959 ?auto_16979 ) ) ( IS-CRATE ?auto_16952 ) ( not ( = ?auto_16973 ?auto_16957 ) ) ( HOIST-AT ?auto_16966 ?auto_16973 ) ( AVAILABLE ?auto_16966 ) ( SURFACE-AT ?auto_16952 ?auto_16973 ) ( ON ?auto_16952 ?auto_16983 ) ( CLEAR ?auto_16952 ) ( not ( = ?auto_16951 ?auto_16952 ) ) ( not ( = ?auto_16951 ?auto_16983 ) ) ( not ( = ?auto_16952 ?auto_16983 ) ) ( not ( = ?auto_16959 ?auto_16966 ) ) ( IS-CRATE ?auto_16951 ) ( not ( = ?auto_16984 ?auto_16957 ) ) ( HOIST-AT ?auto_16988 ?auto_16984 ) ( AVAILABLE ?auto_16988 ) ( SURFACE-AT ?auto_16951 ?auto_16984 ) ( ON ?auto_16951 ?auto_16972 ) ( CLEAR ?auto_16951 ) ( not ( = ?auto_16950 ?auto_16951 ) ) ( not ( = ?auto_16950 ?auto_16972 ) ) ( not ( = ?auto_16951 ?auto_16972 ) ) ( not ( = ?auto_16959 ?auto_16988 ) ) ( IS-CRATE ?auto_16950 ) ( not ( = ?auto_16963 ?auto_16957 ) ) ( HOIST-AT ?auto_16977 ?auto_16963 ) ( AVAILABLE ?auto_16977 ) ( SURFACE-AT ?auto_16950 ?auto_16963 ) ( ON ?auto_16950 ?auto_16974 ) ( CLEAR ?auto_16950 ) ( not ( = ?auto_16949 ?auto_16950 ) ) ( not ( = ?auto_16949 ?auto_16974 ) ) ( not ( = ?auto_16950 ?auto_16974 ) ) ( not ( = ?auto_16959 ?auto_16977 ) ) ( IS-CRATE ?auto_16949 ) ( not ( = ?auto_16985 ?auto_16957 ) ) ( HOIST-AT ?auto_16987 ?auto_16985 ) ( AVAILABLE ?auto_16987 ) ( SURFACE-AT ?auto_16949 ?auto_16985 ) ( ON ?auto_16949 ?auto_16964 ) ( CLEAR ?auto_16949 ) ( not ( = ?auto_16948 ?auto_16949 ) ) ( not ( = ?auto_16948 ?auto_16964 ) ) ( not ( = ?auto_16949 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_16987 ) ) ( IS-CRATE ?auto_16948 ) ( AVAILABLE ?auto_16979 ) ( SURFACE-AT ?auto_16948 ?auto_16986 ) ( ON ?auto_16948 ?auto_16969 ) ( CLEAR ?auto_16948 ) ( not ( = ?auto_16947 ?auto_16948 ) ) ( not ( = ?auto_16947 ?auto_16969 ) ) ( not ( = ?auto_16948 ?auto_16969 ) ) ( IS-CRATE ?auto_16947 ) ( not ( = ?auto_16981 ?auto_16957 ) ) ( HOIST-AT ?auto_16971 ?auto_16981 ) ( AVAILABLE ?auto_16971 ) ( SURFACE-AT ?auto_16947 ?auto_16981 ) ( ON ?auto_16947 ?auto_16968 ) ( CLEAR ?auto_16947 ) ( not ( = ?auto_16946 ?auto_16947 ) ) ( not ( = ?auto_16946 ?auto_16968 ) ) ( not ( = ?auto_16947 ?auto_16968 ) ) ( not ( = ?auto_16959 ?auto_16971 ) ) ( SURFACE-AT ?auto_16945 ?auto_16957 ) ( CLEAR ?auto_16945 ) ( IS-CRATE ?auto_16946 ) ( AVAILABLE ?auto_16959 ) ( not ( = ?auto_16989 ?auto_16957 ) ) ( HOIST-AT ?auto_16975 ?auto_16989 ) ( AVAILABLE ?auto_16975 ) ( SURFACE-AT ?auto_16946 ?auto_16989 ) ( ON ?auto_16946 ?auto_16980 ) ( CLEAR ?auto_16946 ) ( TRUCK-AT ?auto_16958 ?auto_16957 ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( not ( = ?auto_16945 ?auto_16980 ) ) ( not ( = ?auto_16946 ?auto_16980 ) ) ( not ( = ?auto_16959 ?auto_16975 ) ) ( not ( = ?auto_16945 ?auto_16947 ) ) ( not ( = ?auto_16945 ?auto_16968 ) ) ( not ( = ?auto_16947 ?auto_16980 ) ) ( not ( = ?auto_16981 ?auto_16989 ) ) ( not ( = ?auto_16971 ?auto_16975 ) ) ( not ( = ?auto_16968 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16948 ) ) ( not ( = ?auto_16945 ?auto_16969 ) ) ( not ( = ?auto_16946 ?auto_16948 ) ) ( not ( = ?auto_16946 ?auto_16969 ) ) ( not ( = ?auto_16948 ?auto_16968 ) ) ( not ( = ?auto_16948 ?auto_16980 ) ) ( not ( = ?auto_16986 ?auto_16981 ) ) ( not ( = ?auto_16986 ?auto_16989 ) ) ( not ( = ?auto_16979 ?auto_16971 ) ) ( not ( = ?auto_16979 ?auto_16975 ) ) ( not ( = ?auto_16969 ?auto_16968 ) ) ( not ( = ?auto_16969 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16949 ) ) ( not ( = ?auto_16945 ?auto_16964 ) ) ( not ( = ?auto_16946 ?auto_16949 ) ) ( not ( = ?auto_16946 ?auto_16964 ) ) ( not ( = ?auto_16947 ?auto_16949 ) ) ( not ( = ?auto_16947 ?auto_16964 ) ) ( not ( = ?auto_16949 ?auto_16969 ) ) ( not ( = ?auto_16949 ?auto_16968 ) ) ( not ( = ?auto_16949 ?auto_16980 ) ) ( not ( = ?auto_16985 ?auto_16986 ) ) ( not ( = ?auto_16985 ?auto_16981 ) ) ( not ( = ?auto_16985 ?auto_16989 ) ) ( not ( = ?auto_16987 ?auto_16979 ) ) ( not ( = ?auto_16987 ?auto_16971 ) ) ( not ( = ?auto_16987 ?auto_16975 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16950 ) ) ( not ( = ?auto_16945 ?auto_16974 ) ) ( not ( = ?auto_16946 ?auto_16950 ) ) ( not ( = ?auto_16946 ?auto_16974 ) ) ( not ( = ?auto_16947 ?auto_16950 ) ) ( not ( = ?auto_16947 ?auto_16974 ) ) ( not ( = ?auto_16948 ?auto_16950 ) ) ( not ( = ?auto_16948 ?auto_16974 ) ) ( not ( = ?auto_16950 ?auto_16964 ) ) ( not ( = ?auto_16950 ?auto_16969 ) ) ( not ( = ?auto_16950 ?auto_16968 ) ) ( not ( = ?auto_16950 ?auto_16980 ) ) ( not ( = ?auto_16963 ?auto_16985 ) ) ( not ( = ?auto_16963 ?auto_16986 ) ) ( not ( = ?auto_16963 ?auto_16981 ) ) ( not ( = ?auto_16963 ?auto_16989 ) ) ( not ( = ?auto_16977 ?auto_16987 ) ) ( not ( = ?auto_16977 ?auto_16979 ) ) ( not ( = ?auto_16977 ?auto_16971 ) ) ( not ( = ?auto_16977 ?auto_16975 ) ) ( not ( = ?auto_16974 ?auto_16964 ) ) ( not ( = ?auto_16974 ?auto_16969 ) ) ( not ( = ?auto_16974 ?auto_16968 ) ) ( not ( = ?auto_16974 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16951 ) ) ( not ( = ?auto_16945 ?auto_16972 ) ) ( not ( = ?auto_16946 ?auto_16951 ) ) ( not ( = ?auto_16946 ?auto_16972 ) ) ( not ( = ?auto_16947 ?auto_16951 ) ) ( not ( = ?auto_16947 ?auto_16972 ) ) ( not ( = ?auto_16948 ?auto_16951 ) ) ( not ( = ?auto_16948 ?auto_16972 ) ) ( not ( = ?auto_16949 ?auto_16951 ) ) ( not ( = ?auto_16949 ?auto_16972 ) ) ( not ( = ?auto_16951 ?auto_16974 ) ) ( not ( = ?auto_16951 ?auto_16964 ) ) ( not ( = ?auto_16951 ?auto_16969 ) ) ( not ( = ?auto_16951 ?auto_16968 ) ) ( not ( = ?auto_16951 ?auto_16980 ) ) ( not ( = ?auto_16984 ?auto_16963 ) ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_16986 ) ) ( not ( = ?auto_16984 ?auto_16981 ) ) ( not ( = ?auto_16984 ?auto_16989 ) ) ( not ( = ?auto_16988 ?auto_16977 ) ) ( not ( = ?auto_16988 ?auto_16987 ) ) ( not ( = ?auto_16988 ?auto_16979 ) ) ( not ( = ?auto_16988 ?auto_16971 ) ) ( not ( = ?auto_16988 ?auto_16975 ) ) ( not ( = ?auto_16972 ?auto_16974 ) ) ( not ( = ?auto_16972 ?auto_16964 ) ) ( not ( = ?auto_16972 ?auto_16969 ) ) ( not ( = ?auto_16972 ?auto_16968 ) ) ( not ( = ?auto_16972 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16952 ) ) ( not ( = ?auto_16945 ?auto_16983 ) ) ( not ( = ?auto_16946 ?auto_16952 ) ) ( not ( = ?auto_16946 ?auto_16983 ) ) ( not ( = ?auto_16947 ?auto_16952 ) ) ( not ( = ?auto_16947 ?auto_16983 ) ) ( not ( = ?auto_16948 ?auto_16952 ) ) ( not ( = ?auto_16948 ?auto_16983 ) ) ( not ( = ?auto_16949 ?auto_16952 ) ) ( not ( = ?auto_16949 ?auto_16983 ) ) ( not ( = ?auto_16950 ?auto_16952 ) ) ( not ( = ?auto_16950 ?auto_16983 ) ) ( not ( = ?auto_16952 ?auto_16972 ) ) ( not ( = ?auto_16952 ?auto_16974 ) ) ( not ( = ?auto_16952 ?auto_16964 ) ) ( not ( = ?auto_16952 ?auto_16969 ) ) ( not ( = ?auto_16952 ?auto_16968 ) ) ( not ( = ?auto_16952 ?auto_16980 ) ) ( not ( = ?auto_16973 ?auto_16984 ) ) ( not ( = ?auto_16973 ?auto_16963 ) ) ( not ( = ?auto_16973 ?auto_16985 ) ) ( not ( = ?auto_16973 ?auto_16986 ) ) ( not ( = ?auto_16973 ?auto_16981 ) ) ( not ( = ?auto_16973 ?auto_16989 ) ) ( not ( = ?auto_16966 ?auto_16988 ) ) ( not ( = ?auto_16966 ?auto_16977 ) ) ( not ( = ?auto_16966 ?auto_16987 ) ) ( not ( = ?auto_16966 ?auto_16979 ) ) ( not ( = ?auto_16966 ?auto_16971 ) ) ( not ( = ?auto_16966 ?auto_16975 ) ) ( not ( = ?auto_16983 ?auto_16972 ) ) ( not ( = ?auto_16983 ?auto_16974 ) ) ( not ( = ?auto_16983 ?auto_16964 ) ) ( not ( = ?auto_16983 ?auto_16969 ) ) ( not ( = ?auto_16983 ?auto_16968 ) ) ( not ( = ?auto_16983 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16953 ) ) ( not ( = ?auto_16945 ?auto_16965 ) ) ( not ( = ?auto_16946 ?auto_16953 ) ) ( not ( = ?auto_16946 ?auto_16965 ) ) ( not ( = ?auto_16947 ?auto_16953 ) ) ( not ( = ?auto_16947 ?auto_16965 ) ) ( not ( = ?auto_16948 ?auto_16953 ) ) ( not ( = ?auto_16948 ?auto_16965 ) ) ( not ( = ?auto_16949 ?auto_16953 ) ) ( not ( = ?auto_16949 ?auto_16965 ) ) ( not ( = ?auto_16950 ?auto_16953 ) ) ( not ( = ?auto_16950 ?auto_16965 ) ) ( not ( = ?auto_16951 ?auto_16953 ) ) ( not ( = ?auto_16951 ?auto_16965 ) ) ( not ( = ?auto_16953 ?auto_16983 ) ) ( not ( = ?auto_16953 ?auto_16972 ) ) ( not ( = ?auto_16953 ?auto_16974 ) ) ( not ( = ?auto_16953 ?auto_16964 ) ) ( not ( = ?auto_16953 ?auto_16969 ) ) ( not ( = ?auto_16953 ?auto_16968 ) ) ( not ( = ?auto_16953 ?auto_16980 ) ) ( not ( = ?auto_16965 ?auto_16983 ) ) ( not ( = ?auto_16965 ?auto_16972 ) ) ( not ( = ?auto_16965 ?auto_16974 ) ) ( not ( = ?auto_16965 ?auto_16964 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16954 ) ) ( not ( = ?auto_16945 ?auto_16982 ) ) ( not ( = ?auto_16946 ?auto_16954 ) ) ( not ( = ?auto_16946 ?auto_16982 ) ) ( not ( = ?auto_16947 ?auto_16954 ) ) ( not ( = ?auto_16947 ?auto_16982 ) ) ( not ( = ?auto_16948 ?auto_16954 ) ) ( not ( = ?auto_16948 ?auto_16982 ) ) ( not ( = ?auto_16949 ?auto_16954 ) ) ( not ( = ?auto_16949 ?auto_16982 ) ) ( not ( = ?auto_16950 ?auto_16954 ) ) ( not ( = ?auto_16950 ?auto_16982 ) ) ( not ( = ?auto_16951 ?auto_16954 ) ) ( not ( = ?auto_16951 ?auto_16982 ) ) ( not ( = ?auto_16952 ?auto_16954 ) ) ( not ( = ?auto_16952 ?auto_16982 ) ) ( not ( = ?auto_16954 ?auto_16965 ) ) ( not ( = ?auto_16954 ?auto_16983 ) ) ( not ( = ?auto_16954 ?auto_16972 ) ) ( not ( = ?auto_16954 ?auto_16974 ) ) ( not ( = ?auto_16954 ?auto_16964 ) ) ( not ( = ?auto_16954 ?auto_16969 ) ) ( not ( = ?auto_16954 ?auto_16968 ) ) ( not ( = ?auto_16954 ?auto_16980 ) ) ( not ( = ?auto_16976 ?auto_16986 ) ) ( not ( = ?auto_16976 ?auto_16973 ) ) ( not ( = ?auto_16976 ?auto_16984 ) ) ( not ( = ?auto_16976 ?auto_16963 ) ) ( not ( = ?auto_16976 ?auto_16985 ) ) ( not ( = ?auto_16976 ?auto_16981 ) ) ( not ( = ?auto_16976 ?auto_16989 ) ) ( not ( = ?auto_16970 ?auto_16979 ) ) ( not ( = ?auto_16970 ?auto_16966 ) ) ( not ( = ?auto_16970 ?auto_16988 ) ) ( not ( = ?auto_16970 ?auto_16977 ) ) ( not ( = ?auto_16970 ?auto_16987 ) ) ( not ( = ?auto_16970 ?auto_16971 ) ) ( not ( = ?auto_16970 ?auto_16975 ) ) ( not ( = ?auto_16982 ?auto_16965 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_16972 ) ) ( not ( = ?auto_16982 ?auto_16974 ) ) ( not ( = ?auto_16982 ?auto_16964 ) ) ( not ( = ?auto_16982 ?auto_16969 ) ) ( not ( = ?auto_16982 ?auto_16968 ) ) ( not ( = ?auto_16982 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16955 ) ) ( not ( = ?auto_16945 ?auto_16967 ) ) ( not ( = ?auto_16946 ?auto_16955 ) ) ( not ( = ?auto_16946 ?auto_16967 ) ) ( not ( = ?auto_16947 ?auto_16955 ) ) ( not ( = ?auto_16947 ?auto_16967 ) ) ( not ( = ?auto_16948 ?auto_16955 ) ) ( not ( = ?auto_16948 ?auto_16967 ) ) ( not ( = ?auto_16949 ?auto_16955 ) ) ( not ( = ?auto_16949 ?auto_16967 ) ) ( not ( = ?auto_16950 ?auto_16955 ) ) ( not ( = ?auto_16950 ?auto_16967 ) ) ( not ( = ?auto_16951 ?auto_16955 ) ) ( not ( = ?auto_16951 ?auto_16967 ) ) ( not ( = ?auto_16952 ?auto_16955 ) ) ( not ( = ?auto_16952 ?auto_16967 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16967 ) ) ( not ( = ?auto_16955 ?auto_16982 ) ) ( not ( = ?auto_16955 ?auto_16965 ) ) ( not ( = ?auto_16955 ?auto_16983 ) ) ( not ( = ?auto_16955 ?auto_16972 ) ) ( not ( = ?auto_16955 ?auto_16974 ) ) ( not ( = ?auto_16955 ?auto_16964 ) ) ( not ( = ?auto_16955 ?auto_16969 ) ) ( not ( = ?auto_16955 ?auto_16968 ) ) ( not ( = ?auto_16955 ?auto_16980 ) ) ( not ( = ?auto_16978 ?auto_16976 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( not ( = ?auto_16978 ?auto_16973 ) ) ( not ( = ?auto_16978 ?auto_16984 ) ) ( not ( = ?auto_16978 ?auto_16963 ) ) ( not ( = ?auto_16978 ?auto_16985 ) ) ( not ( = ?auto_16978 ?auto_16981 ) ) ( not ( = ?auto_16978 ?auto_16989 ) ) ( not ( = ?auto_16990 ?auto_16970 ) ) ( not ( = ?auto_16990 ?auto_16979 ) ) ( not ( = ?auto_16990 ?auto_16966 ) ) ( not ( = ?auto_16990 ?auto_16988 ) ) ( not ( = ?auto_16990 ?auto_16977 ) ) ( not ( = ?auto_16990 ?auto_16987 ) ) ( not ( = ?auto_16990 ?auto_16971 ) ) ( not ( = ?auto_16990 ?auto_16975 ) ) ( not ( = ?auto_16967 ?auto_16982 ) ) ( not ( = ?auto_16967 ?auto_16965 ) ) ( not ( = ?auto_16967 ?auto_16983 ) ) ( not ( = ?auto_16967 ?auto_16972 ) ) ( not ( = ?auto_16967 ?auto_16974 ) ) ( not ( = ?auto_16967 ?auto_16964 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16980 ) ) ( not ( = ?auto_16945 ?auto_16956 ) ) ( not ( = ?auto_16945 ?auto_16961 ) ) ( not ( = ?auto_16946 ?auto_16956 ) ) ( not ( = ?auto_16946 ?auto_16961 ) ) ( not ( = ?auto_16947 ?auto_16956 ) ) ( not ( = ?auto_16947 ?auto_16961 ) ) ( not ( = ?auto_16948 ?auto_16956 ) ) ( not ( = ?auto_16948 ?auto_16961 ) ) ( not ( = ?auto_16949 ?auto_16956 ) ) ( not ( = ?auto_16949 ?auto_16961 ) ) ( not ( = ?auto_16950 ?auto_16956 ) ) ( not ( = ?auto_16950 ?auto_16961 ) ) ( not ( = ?auto_16951 ?auto_16956 ) ) ( not ( = ?auto_16951 ?auto_16961 ) ) ( not ( = ?auto_16952 ?auto_16956 ) ) ( not ( = ?auto_16952 ?auto_16961 ) ) ( not ( = ?auto_16953 ?auto_16956 ) ) ( not ( = ?auto_16953 ?auto_16961 ) ) ( not ( = ?auto_16954 ?auto_16956 ) ) ( not ( = ?auto_16954 ?auto_16961 ) ) ( not ( = ?auto_16956 ?auto_16967 ) ) ( not ( = ?auto_16956 ?auto_16982 ) ) ( not ( = ?auto_16956 ?auto_16965 ) ) ( not ( = ?auto_16956 ?auto_16983 ) ) ( not ( = ?auto_16956 ?auto_16972 ) ) ( not ( = ?auto_16956 ?auto_16974 ) ) ( not ( = ?auto_16956 ?auto_16964 ) ) ( not ( = ?auto_16956 ?auto_16969 ) ) ( not ( = ?auto_16956 ?auto_16968 ) ) ( not ( = ?auto_16956 ?auto_16980 ) ) ( not ( = ?auto_16962 ?auto_16978 ) ) ( not ( = ?auto_16962 ?auto_16976 ) ) ( not ( = ?auto_16962 ?auto_16986 ) ) ( not ( = ?auto_16962 ?auto_16973 ) ) ( not ( = ?auto_16962 ?auto_16984 ) ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_16985 ) ) ( not ( = ?auto_16962 ?auto_16981 ) ) ( not ( = ?auto_16962 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16990 ) ) ( not ( = ?auto_16960 ?auto_16970 ) ) ( not ( = ?auto_16960 ?auto_16979 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_16988 ) ) ( not ( = ?auto_16960 ?auto_16977 ) ) ( not ( = ?auto_16960 ?auto_16987 ) ) ( not ( = ?auto_16960 ?auto_16971 ) ) ( not ( = ?auto_16960 ?auto_16975 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_16982 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16983 ) ) ( not ( = ?auto_16961 ?auto_16972 ) ) ( not ( = ?auto_16961 ?auto_16974 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16980 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16945 ?auto_16946 ?auto_16947 ?auto_16948 ?auto_16949 ?auto_16950 ?auto_16951 ?auto_16952 ?auto_16953 ?auto_16954 ?auto_16955 )
      ( MAKE-1CRATE ?auto_16955 ?auto_16956 )
      ( MAKE-11CRATE-VERIFY ?auto_16945 ?auto_16946 ?auto_16947 ?auto_16948 ?auto_16949 ?auto_16950 ?auto_16951 ?auto_16952 ?auto_16953 ?auto_16954 ?auto_16955 ?auto_16956 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17014 - SURFACE
      ?auto_17015 - SURFACE
      ?auto_17016 - SURFACE
      ?auto_17017 - SURFACE
      ?auto_17018 - SURFACE
      ?auto_17019 - SURFACE
      ?auto_17020 - SURFACE
      ?auto_17021 - SURFACE
      ?auto_17022 - SURFACE
      ?auto_17023 - SURFACE
      ?auto_17024 - SURFACE
      ?auto_17025 - SURFACE
      ?auto_17026 - SURFACE
    )
    :vars
    (
      ?auto_17028 - HOIST
      ?auto_17031 - PLACE
      ?auto_17032 - PLACE
      ?auto_17027 - HOIST
      ?auto_17030 - SURFACE
      ?auto_17056 - PLACE
      ?auto_17040 - HOIST
      ?auto_17061 - SURFACE
      ?auto_17045 - PLACE
      ?auto_17047 - HOIST
      ?auto_17053 - SURFACE
      ?auto_17060 - PLACE
      ?auto_17049 - HOIST
      ?auto_17062 - SURFACE
      ?auto_17033 - PLACE
      ?auto_17043 - HOIST
      ?auto_17034 - SURFACE
      ?auto_17063 - PLACE
      ?auto_17039 - HOIST
      ?auto_17055 - SURFACE
      ?auto_17054 - PLACE
      ?auto_17050 - HOIST
      ?auto_17058 - SURFACE
      ?auto_17041 - PLACE
      ?auto_17059 - HOIST
      ?auto_17052 - SURFACE
      ?auto_17042 - PLACE
      ?auto_17035 - HOIST
      ?auto_17057 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17046 - PLACE
      ?auto_17038 - HOIST
      ?auto_17036 - SURFACE
      ?auto_17037 - PLACE
      ?auto_17051 - HOIST
      ?auto_17048 - SURFACE
      ?auto_17029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17028 ?auto_17031 ) ( IS-CRATE ?auto_17026 ) ( not ( = ?auto_17032 ?auto_17031 ) ) ( HOIST-AT ?auto_17027 ?auto_17032 ) ( AVAILABLE ?auto_17027 ) ( SURFACE-AT ?auto_17026 ?auto_17032 ) ( ON ?auto_17026 ?auto_17030 ) ( CLEAR ?auto_17026 ) ( not ( = ?auto_17025 ?auto_17026 ) ) ( not ( = ?auto_17025 ?auto_17030 ) ) ( not ( = ?auto_17026 ?auto_17030 ) ) ( not ( = ?auto_17028 ?auto_17027 ) ) ( IS-CRATE ?auto_17025 ) ( not ( = ?auto_17056 ?auto_17031 ) ) ( HOIST-AT ?auto_17040 ?auto_17056 ) ( AVAILABLE ?auto_17040 ) ( SURFACE-AT ?auto_17025 ?auto_17056 ) ( ON ?auto_17025 ?auto_17061 ) ( CLEAR ?auto_17025 ) ( not ( = ?auto_17024 ?auto_17025 ) ) ( not ( = ?auto_17024 ?auto_17061 ) ) ( not ( = ?auto_17025 ?auto_17061 ) ) ( not ( = ?auto_17028 ?auto_17040 ) ) ( IS-CRATE ?auto_17024 ) ( not ( = ?auto_17045 ?auto_17031 ) ) ( HOIST-AT ?auto_17047 ?auto_17045 ) ( AVAILABLE ?auto_17047 ) ( SURFACE-AT ?auto_17024 ?auto_17045 ) ( ON ?auto_17024 ?auto_17053 ) ( CLEAR ?auto_17024 ) ( not ( = ?auto_17023 ?auto_17024 ) ) ( not ( = ?auto_17023 ?auto_17053 ) ) ( not ( = ?auto_17024 ?auto_17053 ) ) ( not ( = ?auto_17028 ?auto_17047 ) ) ( IS-CRATE ?auto_17023 ) ( not ( = ?auto_17060 ?auto_17031 ) ) ( HOIST-AT ?auto_17049 ?auto_17060 ) ( AVAILABLE ?auto_17049 ) ( SURFACE-AT ?auto_17023 ?auto_17060 ) ( ON ?auto_17023 ?auto_17062 ) ( CLEAR ?auto_17023 ) ( not ( = ?auto_17022 ?auto_17023 ) ) ( not ( = ?auto_17022 ?auto_17062 ) ) ( not ( = ?auto_17023 ?auto_17062 ) ) ( not ( = ?auto_17028 ?auto_17049 ) ) ( IS-CRATE ?auto_17022 ) ( not ( = ?auto_17033 ?auto_17031 ) ) ( HOIST-AT ?auto_17043 ?auto_17033 ) ( SURFACE-AT ?auto_17022 ?auto_17033 ) ( ON ?auto_17022 ?auto_17034 ) ( CLEAR ?auto_17022 ) ( not ( = ?auto_17021 ?auto_17022 ) ) ( not ( = ?auto_17021 ?auto_17034 ) ) ( not ( = ?auto_17022 ?auto_17034 ) ) ( not ( = ?auto_17028 ?auto_17043 ) ) ( IS-CRATE ?auto_17021 ) ( not ( = ?auto_17063 ?auto_17031 ) ) ( HOIST-AT ?auto_17039 ?auto_17063 ) ( AVAILABLE ?auto_17039 ) ( SURFACE-AT ?auto_17021 ?auto_17063 ) ( ON ?auto_17021 ?auto_17055 ) ( CLEAR ?auto_17021 ) ( not ( = ?auto_17020 ?auto_17021 ) ) ( not ( = ?auto_17020 ?auto_17055 ) ) ( not ( = ?auto_17021 ?auto_17055 ) ) ( not ( = ?auto_17028 ?auto_17039 ) ) ( IS-CRATE ?auto_17020 ) ( not ( = ?auto_17054 ?auto_17031 ) ) ( HOIST-AT ?auto_17050 ?auto_17054 ) ( AVAILABLE ?auto_17050 ) ( SURFACE-AT ?auto_17020 ?auto_17054 ) ( ON ?auto_17020 ?auto_17058 ) ( CLEAR ?auto_17020 ) ( not ( = ?auto_17019 ?auto_17020 ) ) ( not ( = ?auto_17019 ?auto_17058 ) ) ( not ( = ?auto_17020 ?auto_17058 ) ) ( not ( = ?auto_17028 ?auto_17050 ) ) ( IS-CRATE ?auto_17019 ) ( not ( = ?auto_17041 ?auto_17031 ) ) ( HOIST-AT ?auto_17059 ?auto_17041 ) ( AVAILABLE ?auto_17059 ) ( SURFACE-AT ?auto_17019 ?auto_17041 ) ( ON ?auto_17019 ?auto_17052 ) ( CLEAR ?auto_17019 ) ( not ( = ?auto_17018 ?auto_17019 ) ) ( not ( = ?auto_17018 ?auto_17052 ) ) ( not ( = ?auto_17019 ?auto_17052 ) ) ( not ( = ?auto_17028 ?auto_17059 ) ) ( IS-CRATE ?auto_17018 ) ( not ( = ?auto_17042 ?auto_17031 ) ) ( HOIST-AT ?auto_17035 ?auto_17042 ) ( AVAILABLE ?auto_17035 ) ( SURFACE-AT ?auto_17018 ?auto_17042 ) ( ON ?auto_17018 ?auto_17057 ) ( CLEAR ?auto_17018 ) ( not ( = ?auto_17017 ?auto_17018 ) ) ( not ( = ?auto_17017 ?auto_17057 ) ) ( not ( = ?auto_17018 ?auto_17057 ) ) ( not ( = ?auto_17028 ?auto_17035 ) ) ( IS-CRATE ?auto_17017 ) ( AVAILABLE ?auto_17043 ) ( SURFACE-AT ?auto_17017 ?auto_17033 ) ( ON ?auto_17017 ?auto_17044 ) ( CLEAR ?auto_17017 ) ( not ( = ?auto_17016 ?auto_17017 ) ) ( not ( = ?auto_17016 ?auto_17044 ) ) ( not ( = ?auto_17017 ?auto_17044 ) ) ( IS-CRATE ?auto_17016 ) ( not ( = ?auto_17046 ?auto_17031 ) ) ( HOIST-AT ?auto_17038 ?auto_17046 ) ( AVAILABLE ?auto_17038 ) ( SURFACE-AT ?auto_17016 ?auto_17046 ) ( ON ?auto_17016 ?auto_17036 ) ( CLEAR ?auto_17016 ) ( not ( = ?auto_17015 ?auto_17016 ) ) ( not ( = ?auto_17015 ?auto_17036 ) ) ( not ( = ?auto_17016 ?auto_17036 ) ) ( not ( = ?auto_17028 ?auto_17038 ) ) ( SURFACE-AT ?auto_17014 ?auto_17031 ) ( CLEAR ?auto_17014 ) ( IS-CRATE ?auto_17015 ) ( AVAILABLE ?auto_17028 ) ( not ( = ?auto_17037 ?auto_17031 ) ) ( HOIST-AT ?auto_17051 ?auto_17037 ) ( AVAILABLE ?auto_17051 ) ( SURFACE-AT ?auto_17015 ?auto_17037 ) ( ON ?auto_17015 ?auto_17048 ) ( CLEAR ?auto_17015 ) ( TRUCK-AT ?auto_17029 ?auto_17031 ) ( not ( = ?auto_17014 ?auto_17015 ) ) ( not ( = ?auto_17014 ?auto_17048 ) ) ( not ( = ?auto_17015 ?auto_17048 ) ) ( not ( = ?auto_17028 ?auto_17051 ) ) ( not ( = ?auto_17014 ?auto_17016 ) ) ( not ( = ?auto_17014 ?auto_17036 ) ) ( not ( = ?auto_17016 ?auto_17048 ) ) ( not ( = ?auto_17046 ?auto_17037 ) ) ( not ( = ?auto_17038 ?auto_17051 ) ) ( not ( = ?auto_17036 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17017 ) ) ( not ( = ?auto_17014 ?auto_17044 ) ) ( not ( = ?auto_17015 ?auto_17017 ) ) ( not ( = ?auto_17015 ?auto_17044 ) ) ( not ( = ?auto_17017 ?auto_17036 ) ) ( not ( = ?auto_17017 ?auto_17048 ) ) ( not ( = ?auto_17033 ?auto_17046 ) ) ( not ( = ?auto_17033 ?auto_17037 ) ) ( not ( = ?auto_17043 ?auto_17038 ) ) ( not ( = ?auto_17043 ?auto_17051 ) ) ( not ( = ?auto_17044 ?auto_17036 ) ) ( not ( = ?auto_17044 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17018 ) ) ( not ( = ?auto_17014 ?auto_17057 ) ) ( not ( = ?auto_17015 ?auto_17018 ) ) ( not ( = ?auto_17015 ?auto_17057 ) ) ( not ( = ?auto_17016 ?auto_17018 ) ) ( not ( = ?auto_17016 ?auto_17057 ) ) ( not ( = ?auto_17018 ?auto_17044 ) ) ( not ( = ?auto_17018 ?auto_17036 ) ) ( not ( = ?auto_17018 ?auto_17048 ) ) ( not ( = ?auto_17042 ?auto_17033 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17051 ) ) ( not ( = ?auto_17057 ?auto_17044 ) ) ( not ( = ?auto_17057 ?auto_17036 ) ) ( not ( = ?auto_17057 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17019 ) ) ( not ( = ?auto_17014 ?auto_17052 ) ) ( not ( = ?auto_17015 ?auto_17019 ) ) ( not ( = ?auto_17015 ?auto_17052 ) ) ( not ( = ?auto_17016 ?auto_17019 ) ) ( not ( = ?auto_17016 ?auto_17052 ) ) ( not ( = ?auto_17017 ?auto_17019 ) ) ( not ( = ?auto_17017 ?auto_17052 ) ) ( not ( = ?auto_17019 ?auto_17057 ) ) ( not ( = ?auto_17019 ?auto_17044 ) ) ( not ( = ?auto_17019 ?auto_17036 ) ) ( not ( = ?auto_17019 ?auto_17048 ) ) ( not ( = ?auto_17041 ?auto_17042 ) ) ( not ( = ?auto_17041 ?auto_17033 ) ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17037 ) ) ( not ( = ?auto_17059 ?auto_17035 ) ) ( not ( = ?auto_17059 ?auto_17043 ) ) ( not ( = ?auto_17059 ?auto_17038 ) ) ( not ( = ?auto_17059 ?auto_17051 ) ) ( not ( = ?auto_17052 ?auto_17057 ) ) ( not ( = ?auto_17052 ?auto_17044 ) ) ( not ( = ?auto_17052 ?auto_17036 ) ) ( not ( = ?auto_17052 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17020 ) ) ( not ( = ?auto_17014 ?auto_17058 ) ) ( not ( = ?auto_17015 ?auto_17020 ) ) ( not ( = ?auto_17015 ?auto_17058 ) ) ( not ( = ?auto_17016 ?auto_17020 ) ) ( not ( = ?auto_17016 ?auto_17058 ) ) ( not ( = ?auto_17017 ?auto_17020 ) ) ( not ( = ?auto_17017 ?auto_17058 ) ) ( not ( = ?auto_17018 ?auto_17020 ) ) ( not ( = ?auto_17018 ?auto_17058 ) ) ( not ( = ?auto_17020 ?auto_17052 ) ) ( not ( = ?auto_17020 ?auto_17057 ) ) ( not ( = ?auto_17020 ?auto_17044 ) ) ( not ( = ?auto_17020 ?auto_17036 ) ) ( not ( = ?auto_17020 ?auto_17048 ) ) ( not ( = ?auto_17054 ?auto_17041 ) ) ( not ( = ?auto_17054 ?auto_17042 ) ) ( not ( = ?auto_17054 ?auto_17033 ) ) ( not ( = ?auto_17054 ?auto_17046 ) ) ( not ( = ?auto_17054 ?auto_17037 ) ) ( not ( = ?auto_17050 ?auto_17059 ) ) ( not ( = ?auto_17050 ?auto_17035 ) ) ( not ( = ?auto_17050 ?auto_17043 ) ) ( not ( = ?auto_17050 ?auto_17038 ) ) ( not ( = ?auto_17050 ?auto_17051 ) ) ( not ( = ?auto_17058 ?auto_17052 ) ) ( not ( = ?auto_17058 ?auto_17057 ) ) ( not ( = ?auto_17058 ?auto_17044 ) ) ( not ( = ?auto_17058 ?auto_17036 ) ) ( not ( = ?auto_17058 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17021 ) ) ( not ( = ?auto_17014 ?auto_17055 ) ) ( not ( = ?auto_17015 ?auto_17021 ) ) ( not ( = ?auto_17015 ?auto_17055 ) ) ( not ( = ?auto_17016 ?auto_17021 ) ) ( not ( = ?auto_17016 ?auto_17055 ) ) ( not ( = ?auto_17017 ?auto_17021 ) ) ( not ( = ?auto_17017 ?auto_17055 ) ) ( not ( = ?auto_17018 ?auto_17021 ) ) ( not ( = ?auto_17018 ?auto_17055 ) ) ( not ( = ?auto_17019 ?auto_17021 ) ) ( not ( = ?auto_17019 ?auto_17055 ) ) ( not ( = ?auto_17021 ?auto_17058 ) ) ( not ( = ?auto_17021 ?auto_17052 ) ) ( not ( = ?auto_17021 ?auto_17057 ) ) ( not ( = ?auto_17021 ?auto_17044 ) ) ( not ( = ?auto_17021 ?auto_17036 ) ) ( not ( = ?auto_17021 ?auto_17048 ) ) ( not ( = ?auto_17063 ?auto_17054 ) ) ( not ( = ?auto_17063 ?auto_17041 ) ) ( not ( = ?auto_17063 ?auto_17042 ) ) ( not ( = ?auto_17063 ?auto_17033 ) ) ( not ( = ?auto_17063 ?auto_17046 ) ) ( not ( = ?auto_17063 ?auto_17037 ) ) ( not ( = ?auto_17039 ?auto_17050 ) ) ( not ( = ?auto_17039 ?auto_17059 ) ) ( not ( = ?auto_17039 ?auto_17035 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17038 ) ) ( not ( = ?auto_17039 ?auto_17051 ) ) ( not ( = ?auto_17055 ?auto_17058 ) ) ( not ( = ?auto_17055 ?auto_17052 ) ) ( not ( = ?auto_17055 ?auto_17057 ) ) ( not ( = ?auto_17055 ?auto_17044 ) ) ( not ( = ?auto_17055 ?auto_17036 ) ) ( not ( = ?auto_17055 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17022 ) ) ( not ( = ?auto_17014 ?auto_17034 ) ) ( not ( = ?auto_17015 ?auto_17022 ) ) ( not ( = ?auto_17015 ?auto_17034 ) ) ( not ( = ?auto_17016 ?auto_17022 ) ) ( not ( = ?auto_17016 ?auto_17034 ) ) ( not ( = ?auto_17017 ?auto_17022 ) ) ( not ( = ?auto_17017 ?auto_17034 ) ) ( not ( = ?auto_17018 ?auto_17022 ) ) ( not ( = ?auto_17018 ?auto_17034 ) ) ( not ( = ?auto_17019 ?auto_17022 ) ) ( not ( = ?auto_17019 ?auto_17034 ) ) ( not ( = ?auto_17020 ?auto_17022 ) ) ( not ( = ?auto_17020 ?auto_17034 ) ) ( not ( = ?auto_17022 ?auto_17055 ) ) ( not ( = ?auto_17022 ?auto_17058 ) ) ( not ( = ?auto_17022 ?auto_17052 ) ) ( not ( = ?auto_17022 ?auto_17057 ) ) ( not ( = ?auto_17022 ?auto_17044 ) ) ( not ( = ?auto_17022 ?auto_17036 ) ) ( not ( = ?auto_17022 ?auto_17048 ) ) ( not ( = ?auto_17034 ?auto_17055 ) ) ( not ( = ?auto_17034 ?auto_17058 ) ) ( not ( = ?auto_17034 ?auto_17052 ) ) ( not ( = ?auto_17034 ?auto_17057 ) ) ( not ( = ?auto_17034 ?auto_17044 ) ) ( not ( = ?auto_17034 ?auto_17036 ) ) ( not ( = ?auto_17034 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17023 ) ) ( not ( = ?auto_17014 ?auto_17062 ) ) ( not ( = ?auto_17015 ?auto_17023 ) ) ( not ( = ?auto_17015 ?auto_17062 ) ) ( not ( = ?auto_17016 ?auto_17023 ) ) ( not ( = ?auto_17016 ?auto_17062 ) ) ( not ( = ?auto_17017 ?auto_17023 ) ) ( not ( = ?auto_17017 ?auto_17062 ) ) ( not ( = ?auto_17018 ?auto_17023 ) ) ( not ( = ?auto_17018 ?auto_17062 ) ) ( not ( = ?auto_17019 ?auto_17023 ) ) ( not ( = ?auto_17019 ?auto_17062 ) ) ( not ( = ?auto_17020 ?auto_17023 ) ) ( not ( = ?auto_17020 ?auto_17062 ) ) ( not ( = ?auto_17021 ?auto_17023 ) ) ( not ( = ?auto_17021 ?auto_17062 ) ) ( not ( = ?auto_17023 ?auto_17034 ) ) ( not ( = ?auto_17023 ?auto_17055 ) ) ( not ( = ?auto_17023 ?auto_17058 ) ) ( not ( = ?auto_17023 ?auto_17052 ) ) ( not ( = ?auto_17023 ?auto_17057 ) ) ( not ( = ?auto_17023 ?auto_17044 ) ) ( not ( = ?auto_17023 ?auto_17036 ) ) ( not ( = ?auto_17023 ?auto_17048 ) ) ( not ( = ?auto_17060 ?auto_17033 ) ) ( not ( = ?auto_17060 ?auto_17063 ) ) ( not ( = ?auto_17060 ?auto_17054 ) ) ( not ( = ?auto_17060 ?auto_17041 ) ) ( not ( = ?auto_17060 ?auto_17042 ) ) ( not ( = ?auto_17060 ?auto_17046 ) ) ( not ( = ?auto_17060 ?auto_17037 ) ) ( not ( = ?auto_17049 ?auto_17043 ) ) ( not ( = ?auto_17049 ?auto_17039 ) ) ( not ( = ?auto_17049 ?auto_17050 ) ) ( not ( = ?auto_17049 ?auto_17059 ) ) ( not ( = ?auto_17049 ?auto_17035 ) ) ( not ( = ?auto_17049 ?auto_17038 ) ) ( not ( = ?auto_17049 ?auto_17051 ) ) ( not ( = ?auto_17062 ?auto_17034 ) ) ( not ( = ?auto_17062 ?auto_17055 ) ) ( not ( = ?auto_17062 ?auto_17058 ) ) ( not ( = ?auto_17062 ?auto_17052 ) ) ( not ( = ?auto_17062 ?auto_17057 ) ) ( not ( = ?auto_17062 ?auto_17044 ) ) ( not ( = ?auto_17062 ?auto_17036 ) ) ( not ( = ?auto_17062 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17024 ) ) ( not ( = ?auto_17014 ?auto_17053 ) ) ( not ( = ?auto_17015 ?auto_17024 ) ) ( not ( = ?auto_17015 ?auto_17053 ) ) ( not ( = ?auto_17016 ?auto_17024 ) ) ( not ( = ?auto_17016 ?auto_17053 ) ) ( not ( = ?auto_17017 ?auto_17024 ) ) ( not ( = ?auto_17017 ?auto_17053 ) ) ( not ( = ?auto_17018 ?auto_17024 ) ) ( not ( = ?auto_17018 ?auto_17053 ) ) ( not ( = ?auto_17019 ?auto_17024 ) ) ( not ( = ?auto_17019 ?auto_17053 ) ) ( not ( = ?auto_17020 ?auto_17024 ) ) ( not ( = ?auto_17020 ?auto_17053 ) ) ( not ( = ?auto_17021 ?auto_17024 ) ) ( not ( = ?auto_17021 ?auto_17053 ) ) ( not ( = ?auto_17022 ?auto_17024 ) ) ( not ( = ?auto_17022 ?auto_17053 ) ) ( not ( = ?auto_17024 ?auto_17062 ) ) ( not ( = ?auto_17024 ?auto_17034 ) ) ( not ( = ?auto_17024 ?auto_17055 ) ) ( not ( = ?auto_17024 ?auto_17058 ) ) ( not ( = ?auto_17024 ?auto_17052 ) ) ( not ( = ?auto_17024 ?auto_17057 ) ) ( not ( = ?auto_17024 ?auto_17044 ) ) ( not ( = ?auto_17024 ?auto_17036 ) ) ( not ( = ?auto_17024 ?auto_17048 ) ) ( not ( = ?auto_17045 ?auto_17060 ) ) ( not ( = ?auto_17045 ?auto_17033 ) ) ( not ( = ?auto_17045 ?auto_17063 ) ) ( not ( = ?auto_17045 ?auto_17054 ) ) ( not ( = ?auto_17045 ?auto_17041 ) ) ( not ( = ?auto_17045 ?auto_17042 ) ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17037 ) ) ( not ( = ?auto_17047 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17043 ) ) ( not ( = ?auto_17047 ?auto_17039 ) ) ( not ( = ?auto_17047 ?auto_17050 ) ) ( not ( = ?auto_17047 ?auto_17059 ) ) ( not ( = ?auto_17047 ?auto_17035 ) ) ( not ( = ?auto_17047 ?auto_17038 ) ) ( not ( = ?auto_17047 ?auto_17051 ) ) ( not ( = ?auto_17053 ?auto_17062 ) ) ( not ( = ?auto_17053 ?auto_17034 ) ) ( not ( = ?auto_17053 ?auto_17055 ) ) ( not ( = ?auto_17053 ?auto_17058 ) ) ( not ( = ?auto_17053 ?auto_17052 ) ) ( not ( = ?auto_17053 ?auto_17057 ) ) ( not ( = ?auto_17053 ?auto_17044 ) ) ( not ( = ?auto_17053 ?auto_17036 ) ) ( not ( = ?auto_17053 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17025 ) ) ( not ( = ?auto_17014 ?auto_17061 ) ) ( not ( = ?auto_17015 ?auto_17025 ) ) ( not ( = ?auto_17015 ?auto_17061 ) ) ( not ( = ?auto_17016 ?auto_17025 ) ) ( not ( = ?auto_17016 ?auto_17061 ) ) ( not ( = ?auto_17017 ?auto_17025 ) ) ( not ( = ?auto_17017 ?auto_17061 ) ) ( not ( = ?auto_17018 ?auto_17025 ) ) ( not ( = ?auto_17018 ?auto_17061 ) ) ( not ( = ?auto_17019 ?auto_17025 ) ) ( not ( = ?auto_17019 ?auto_17061 ) ) ( not ( = ?auto_17020 ?auto_17025 ) ) ( not ( = ?auto_17020 ?auto_17061 ) ) ( not ( = ?auto_17021 ?auto_17025 ) ) ( not ( = ?auto_17021 ?auto_17061 ) ) ( not ( = ?auto_17022 ?auto_17025 ) ) ( not ( = ?auto_17022 ?auto_17061 ) ) ( not ( = ?auto_17023 ?auto_17025 ) ) ( not ( = ?auto_17023 ?auto_17061 ) ) ( not ( = ?auto_17025 ?auto_17053 ) ) ( not ( = ?auto_17025 ?auto_17062 ) ) ( not ( = ?auto_17025 ?auto_17034 ) ) ( not ( = ?auto_17025 ?auto_17055 ) ) ( not ( = ?auto_17025 ?auto_17058 ) ) ( not ( = ?auto_17025 ?auto_17052 ) ) ( not ( = ?auto_17025 ?auto_17057 ) ) ( not ( = ?auto_17025 ?auto_17044 ) ) ( not ( = ?auto_17025 ?auto_17036 ) ) ( not ( = ?auto_17025 ?auto_17048 ) ) ( not ( = ?auto_17056 ?auto_17045 ) ) ( not ( = ?auto_17056 ?auto_17060 ) ) ( not ( = ?auto_17056 ?auto_17033 ) ) ( not ( = ?auto_17056 ?auto_17063 ) ) ( not ( = ?auto_17056 ?auto_17054 ) ) ( not ( = ?auto_17056 ?auto_17041 ) ) ( not ( = ?auto_17056 ?auto_17042 ) ) ( not ( = ?auto_17056 ?auto_17046 ) ) ( not ( = ?auto_17056 ?auto_17037 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17049 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17039 ) ) ( not ( = ?auto_17040 ?auto_17050 ) ) ( not ( = ?auto_17040 ?auto_17059 ) ) ( not ( = ?auto_17040 ?auto_17035 ) ) ( not ( = ?auto_17040 ?auto_17038 ) ) ( not ( = ?auto_17040 ?auto_17051 ) ) ( not ( = ?auto_17061 ?auto_17053 ) ) ( not ( = ?auto_17061 ?auto_17062 ) ) ( not ( = ?auto_17061 ?auto_17034 ) ) ( not ( = ?auto_17061 ?auto_17055 ) ) ( not ( = ?auto_17061 ?auto_17058 ) ) ( not ( = ?auto_17061 ?auto_17052 ) ) ( not ( = ?auto_17061 ?auto_17057 ) ) ( not ( = ?auto_17061 ?auto_17044 ) ) ( not ( = ?auto_17061 ?auto_17036 ) ) ( not ( = ?auto_17061 ?auto_17048 ) ) ( not ( = ?auto_17014 ?auto_17026 ) ) ( not ( = ?auto_17014 ?auto_17030 ) ) ( not ( = ?auto_17015 ?auto_17026 ) ) ( not ( = ?auto_17015 ?auto_17030 ) ) ( not ( = ?auto_17016 ?auto_17026 ) ) ( not ( = ?auto_17016 ?auto_17030 ) ) ( not ( = ?auto_17017 ?auto_17026 ) ) ( not ( = ?auto_17017 ?auto_17030 ) ) ( not ( = ?auto_17018 ?auto_17026 ) ) ( not ( = ?auto_17018 ?auto_17030 ) ) ( not ( = ?auto_17019 ?auto_17026 ) ) ( not ( = ?auto_17019 ?auto_17030 ) ) ( not ( = ?auto_17020 ?auto_17026 ) ) ( not ( = ?auto_17020 ?auto_17030 ) ) ( not ( = ?auto_17021 ?auto_17026 ) ) ( not ( = ?auto_17021 ?auto_17030 ) ) ( not ( = ?auto_17022 ?auto_17026 ) ) ( not ( = ?auto_17022 ?auto_17030 ) ) ( not ( = ?auto_17023 ?auto_17026 ) ) ( not ( = ?auto_17023 ?auto_17030 ) ) ( not ( = ?auto_17024 ?auto_17026 ) ) ( not ( = ?auto_17024 ?auto_17030 ) ) ( not ( = ?auto_17026 ?auto_17061 ) ) ( not ( = ?auto_17026 ?auto_17053 ) ) ( not ( = ?auto_17026 ?auto_17062 ) ) ( not ( = ?auto_17026 ?auto_17034 ) ) ( not ( = ?auto_17026 ?auto_17055 ) ) ( not ( = ?auto_17026 ?auto_17058 ) ) ( not ( = ?auto_17026 ?auto_17052 ) ) ( not ( = ?auto_17026 ?auto_17057 ) ) ( not ( = ?auto_17026 ?auto_17044 ) ) ( not ( = ?auto_17026 ?auto_17036 ) ) ( not ( = ?auto_17026 ?auto_17048 ) ) ( not ( = ?auto_17032 ?auto_17056 ) ) ( not ( = ?auto_17032 ?auto_17045 ) ) ( not ( = ?auto_17032 ?auto_17060 ) ) ( not ( = ?auto_17032 ?auto_17033 ) ) ( not ( = ?auto_17032 ?auto_17063 ) ) ( not ( = ?auto_17032 ?auto_17054 ) ) ( not ( = ?auto_17032 ?auto_17041 ) ) ( not ( = ?auto_17032 ?auto_17042 ) ) ( not ( = ?auto_17032 ?auto_17046 ) ) ( not ( = ?auto_17032 ?auto_17037 ) ) ( not ( = ?auto_17027 ?auto_17040 ) ) ( not ( = ?auto_17027 ?auto_17047 ) ) ( not ( = ?auto_17027 ?auto_17049 ) ) ( not ( = ?auto_17027 ?auto_17043 ) ) ( not ( = ?auto_17027 ?auto_17039 ) ) ( not ( = ?auto_17027 ?auto_17050 ) ) ( not ( = ?auto_17027 ?auto_17059 ) ) ( not ( = ?auto_17027 ?auto_17035 ) ) ( not ( = ?auto_17027 ?auto_17038 ) ) ( not ( = ?auto_17027 ?auto_17051 ) ) ( not ( = ?auto_17030 ?auto_17061 ) ) ( not ( = ?auto_17030 ?auto_17053 ) ) ( not ( = ?auto_17030 ?auto_17062 ) ) ( not ( = ?auto_17030 ?auto_17034 ) ) ( not ( = ?auto_17030 ?auto_17055 ) ) ( not ( = ?auto_17030 ?auto_17058 ) ) ( not ( = ?auto_17030 ?auto_17052 ) ) ( not ( = ?auto_17030 ?auto_17057 ) ) ( not ( = ?auto_17030 ?auto_17044 ) ) ( not ( = ?auto_17030 ?auto_17036 ) ) ( not ( = ?auto_17030 ?auto_17048 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17014 ?auto_17015 ?auto_17016 ?auto_17017 ?auto_17018 ?auto_17019 ?auto_17020 ?auto_17021 ?auto_17022 ?auto_17023 ?auto_17024 ?auto_17025 )
      ( MAKE-1CRATE ?auto_17025 ?auto_17026 )
      ( MAKE-12CRATE-VERIFY ?auto_17014 ?auto_17015 ?auto_17016 ?auto_17017 ?auto_17018 ?auto_17019 ?auto_17020 ?auto_17021 ?auto_17022 ?auto_17023 ?auto_17024 ?auto_17025 ?auto_17026 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17088 - SURFACE
      ?auto_17089 - SURFACE
      ?auto_17090 - SURFACE
      ?auto_17091 - SURFACE
      ?auto_17092 - SURFACE
      ?auto_17093 - SURFACE
      ?auto_17094 - SURFACE
      ?auto_17095 - SURFACE
      ?auto_17096 - SURFACE
      ?auto_17097 - SURFACE
      ?auto_17098 - SURFACE
      ?auto_17099 - SURFACE
      ?auto_17100 - SURFACE
      ?auto_17101 - SURFACE
    )
    :vars
    (
      ?auto_17103 - HOIST
      ?auto_17102 - PLACE
      ?auto_17106 - PLACE
      ?auto_17104 - HOIST
      ?auto_17105 - SURFACE
      ?auto_17123 - PLACE
      ?auto_17128 - HOIST
      ?auto_17133 - SURFACE
      ?auto_17130 - PLACE
      ?auto_17136 - HOIST
      ?auto_17140 - SURFACE
      ?auto_17134 - PLACE
      ?auto_17121 - HOIST
      ?auto_17108 - SURFACE
      ?auto_17132 - PLACE
      ?auto_17118 - HOIST
      ?auto_17141 - SURFACE
      ?auto_17137 - PLACE
      ?auto_17124 - HOIST
      ?auto_17111 - SURFACE
      ?auto_17139 - PLACE
      ?auto_17113 - HOIST
      ?auto_17120 - SURFACE
      ?auto_17115 - PLACE
      ?auto_17129 - HOIST
      ?auto_17131 - SURFACE
      ?auto_17112 - PLACE
      ?auto_17138 - HOIST
      ?auto_17122 - SURFACE
      ?auto_17114 - PLACE
      ?auto_17125 - HOIST
      ?auto_17117 - SURFACE
      ?auto_17109 - SURFACE
      ?auto_17127 - PLACE
      ?auto_17126 - HOIST
      ?auto_17116 - SURFACE
      ?auto_17135 - PLACE
      ?auto_17119 - HOIST
      ?auto_17110 - SURFACE
      ?auto_17107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17103 ?auto_17102 ) ( IS-CRATE ?auto_17101 ) ( not ( = ?auto_17106 ?auto_17102 ) ) ( HOIST-AT ?auto_17104 ?auto_17106 ) ( AVAILABLE ?auto_17104 ) ( SURFACE-AT ?auto_17101 ?auto_17106 ) ( ON ?auto_17101 ?auto_17105 ) ( CLEAR ?auto_17101 ) ( not ( = ?auto_17100 ?auto_17101 ) ) ( not ( = ?auto_17100 ?auto_17105 ) ) ( not ( = ?auto_17101 ?auto_17105 ) ) ( not ( = ?auto_17103 ?auto_17104 ) ) ( IS-CRATE ?auto_17100 ) ( not ( = ?auto_17123 ?auto_17102 ) ) ( HOIST-AT ?auto_17128 ?auto_17123 ) ( AVAILABLE ?auto_17128 ) ( SURFACE-AT ?auto_17100 ?auto_17123 ) ( ON ?auto_17100 ?auto_17133 ) ( CLEAR ?auto_17100 ) ( not ( = ?auto_17099 ?auto_17100 ) ) ( not ( = ?auto_17099 ?auto_17133 ) ) ( not ( = ?auto_17100 ?auto_17133 ) ) ( not ( = ?auto_17103 ?auto_17128 ) ) ( IS-CRATE ?auto_17099 ) ( not ( = ?auto_17130 ?auto_17102 ) ) ( HOIST-AT ?auto_17136 ?auto_17130 ) ( AVAILABLE ?auto_17136 ) ( SURFACE-AT ?auto_17099 ?auto_17130 ) ( ON ?auto_17099 ?auto_17140 ) ( CLEAR ?auto_17099 ) ( not ( = ?auto_17098 ?auto_17099 ) ) ( not ( = ?auto_17098 ?auto_17140 ) ) ( not ( = ?auto_17099 ?auto_17140 ) ) ( not ( = ?auto_17103 ?auto_17136 ) ) ( IS-CRATE ?auto_17098 ) ( not ( = ?auto_17134 ?auto_17102 ) ) ( HOIST-AT ?auto_17121 ?auto_17134 ) ( AVAILABLE ?auto_17121 ) ( SURFACE-AT ?auto_17098 ?auto_17134 ) ( ON ?auto_17098 ?auto_17108 ) ( CLEAR ?auto_17098 ) ( not ( = ?auto_17097 ?auto_17098 ) ) ( not ( = ?auto_17097 ?auto_17108 ) ) ( not ( = ?auto_17098 ?auto_17108 ) ) ( not ( = ?auto_17103 ?auto_17121 ) ) ( IS-CRATE ?auto_17097 ) ( not ( = ?auto_17132 ?auto_17102 ) ) ( HOIST-AT ?auto_17118 ?auto_17132 ) ( AVAILABLE ?auto_17118 ) ( SURFACE-AT ?auto_17097 ?auto_17132 ) ( ON ?auto_17097 ?auto_17141 ) ( CLEAR ?auto_17097 ) ( not ( = ?auto_17096 ?auto_17097 ) ) ( not ( = ?auto_17096 ?auto_17141 ) ) ( not ( = ?auto_17097 ?auto_17141 ) ) ( not ( = ?auto_17103 ?auto_17118 ) ) ( IS-CRATE ?auto_17096 ) ( not ( = ?auto_17137 ?auto_17102 ) ) ( HOIST-AT ?auto_17124 ?auto_17137 ) ( SURFACE-AT ?auto_17096 ?auto_17137 ) ( ON ?auto_17096 ?auto_17111 ) ( CLEAR ?auto_17096 ) ( not ( = ?auto_17095 ?auto_17096 ) ) ( not ( = ?auto_17095 ?auto_17111 ) ) ( not ( = ?auto_17096 ?auto_17111 ) ) ( not ( = ?auto_17103 ?auto_17124 ) ) ( IS-CRATE ?auto_17095 ) ( not ( = ?auto_17139 ?auto_17102 ) ) ( HOIST-AT ?auto_17113 ?auto_17139 ) ( AVAILABLE ?auto_17113 ) ( SURFACE-AT ?auto_17095 ?auto_17139 ) ( ON ?auto_17095 ?auto_17120 ) ( CLEAR ?auto_17095 ) ( not ( = ?auto_17094 ?auto_17095 ) ) ( not ( = ?auto_17094 ?auto_17120 ) ) ( not ( = ?auto_17095 ?auto_17120 ) ) ( not ( = ?auto_17103 ?auto_17113 ) ) ( IS-CRATE ?auto_17094 ) ( not ( = ?auto_17115 ?auto_17102 ) ) ( HOIST-AT ?auto_17129 ?auto_17115 ) ( AVAILABLE ?auto_17129 ) ( SURFACE-AT ?auto_17094 ?auto_17115 ) ( ON ?auto_17094 ?auto_17131 ) ( CLEAR ?auto_17094 ) ( not ( = ?auto_17093 ?auto_17094 ) ) ( not ( = ?auto_17093 ?auto_17131 ) ) ( not ( = ?auto_17094 ?auto_17131 ) ) ( not ( = ?auto_17103 ?auto_17129 ) ) ( IS-CRATE ?auto_17093 ) ( not ( = ?auto_17112 ?auto_17102 ) ) ( HOIST-AT ?auto_17138 ?auto_17112 ) ( AVAILABLE ?auto_17138 ) ( SURFACE-AT ?auto_17093 ?auto_17112 ) ( ON ?auto_17093 ?auto_17122 ) ( CLEAR ?auto_17093 ) ( not ( = ?auto_17092 ?auto_17093 ) ) ( not ( = ?auto_17092 ?auto_17122 ) ) ( not ( = ?auto_17093 ?auto_17122 ) ) ( not ( = ?auto_17103 ?auto_17138 ) ) ( IS-CRATE ?auto_17092 ) ( not ( = ?auto_17114 ?auto_17102 ) ) ( HOIST-AT ?auto_17125 ?auto_17114 ) ( AVAILABLE ?auto_17125 ) ( SURFACE-AT ?auto_17092 ?auto_17114 ) ( ON ?auto_17092 ?auto_17117 ) ( CLEAR ?auto_17092 ) ( not ( = ?auto_17091 ?auto_17092 ) ) ( not ( = ?auto_17091 ?auto_17117 ) ) ( not ( = ?auto_17092 ?auto_17117 ) ) ( not ( = ?auto_17103 ?auto_17125 ) ) ( IS-CRATE ?auto_17091 ) ( AVAILABLE ?auto_17124 ) ( SURFACE-AT ?auto_17091 ?auto_17137 ) ( ON ?auto_17091 ?auto_17109 ) ( CLEAR ?auto_17091 ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17090 ?auto_17109 ) ) ( not ( = ?auto_17091 ?auto_17109 ) ) ( IS-CRATE ?auto_17090 ) ( not ( = ?auto_17127 ?auto_17102 ) ) ( HOIST-AT ?auto_17126 ?auto_17127 ) ( AVAILABLE ?auto_17126 ) ( SURFACE-AT ?auto_17090 ?auto_17127 ) ( ON ?auto_17090 ?auto_17116 ) ( CLEAR ?auto_17090 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17116 ) ) ( not ( = ?auto_17090 ?auto_17116 ) ) ( not ( = ?auto_17103 ?auto_17126 ) ) ( SURFACE-AT ?auto_17088 ?auto_17102 ) ( CLEAR ?auto_17088 ) ( IS-CRATE ?auto_17089 ) ( AVAILABLE ?auto_17103 ) ( not ( = ?auto_17135 ?auto_17102 ) ) ( HOIST-AT ?auto_17119 ?auto_17135 ) ( AVAILABLE ?auto_17119 ) ( SURFACE-AT ?auto_17089 ?auto_17135 ) ( ON ?auto_17089 ?auto_17110 ) ( CLEAR ?auto_17089 ) ( TRUCK-AT ?auto_17107 ?auto_17102 ) ( not ( = ?auto_17088 ?auto_17089 ) ) ( not ( = ?auto_17088 ?auto_17110 ) ) ( not ( = ?auto_17089 ?auto_17110 ) ) ( not ( = ?auto_17103 ?auto_17119 ) ) ( not ( = ?auto_17088 ?auto_17090 ) ) ( not ( = ?auto_17088 ?auto_17116 ) ) ( not ( = ?auto_17090 ?auto_17110 ) ) ( not ( = ?auto_17127 ?auto_17135 ) ) ( not ( = ?auto_17126 ?auto_17119 ) ) ( not ( = ?auto_17116 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17091 ) ) ( not ( = ?auto_17088 ?auto_17109 ) ) ( not ( = ?auto_17089 ?auto_17091 ) ) ( not ( = ?auto_17089 ?auto_17109 ) ) ( not ( = ?auto_17091 ?auto_17116 ) ) ( not ( = ?auto_17091 ?auto_17110 ) ) ( not ( = ?auto_17137 ?auto_17127 ) ) ( not ( = ?auto_17137 ?auto_17135 ) ) ( not ( = ?auto_17124 ?auto_17126 ) ) ( not ( = ?auto_17124 ?auto_17119 ) ) ( not ( = ?auto_17109 ?auto_17116 ) ) ( not ( = ?auto_17109 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17092 ) ) ( not ( = ?auto_17088 ?auto_17117 ) ) ( not ( = ?auto_17089 ?auto_17092 ) ) ( not ( = ?auto_17089 ?auto_17117 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17117 ) ) ( not ( = ?auto_17092 ?auto_17109 ) ) ( not ( = ?auto_17092 ?auto_17116 ) ) ( not ( = ?auto_17092 ?auto_17110 ) ) ( not ( = ?auto_17114 ?auto_17137 ) ) ( not ( = ?auto_17114 ?auto_17127 ) ) ( not ( = ?auto_17114 ?auto_17135 ) ) ( not ( = ?auto_17125 ?auto_17124 ) ) ( not ( = ?auto_17125 ?auto_17126 ) ) ( not ( = ?auto_17125 ?auto_17119 ) ) ( not ( = ?auto_17117 ?auto_17109 ) ) ( not ( = ?auto_17117 ?auto_17116 ) ) ( not ( = ?auto_17117 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17093 ) ) ( not ( = ?auto_17088 ?auto_17122 ) ) ( not ( = ?auto_17089 ?auto_17093 ) ) ( not ( = ?auto_17089 ?auto_17122 ) ) ( not ( = ?auto_17090 ?auto_17093 ) ) ( not ( = ?auto_17090 ?auto_17122 ) ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17091 ?auto_17122 ) ) ( not ( = ?auto_17093 ?auto_17117 ) ) ( not ( = ?auto_17093 ?auto_17109 ) ) ( not ( = ?auto_17093 ?auto_17116 ) ) ( not ( = ?auto_17093 ?auto_17110 ) ) ( not ( = ?auto_17112 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17137 ) ) ( not ( = ?auto_17112 ?auto_17127 ) ) ( not ( = ?auto_17112 ?auto_17135 ) ) ( not ( = ?auto_17138 ?auto_17125 ) ) ( not ( = ?auto_17138 ?auto_17124 ) ) ( not ( = ?auto_17138 ?auto_17126 ) ) ( not ( = ?auto_17138 ?auto_17119 ) ) ( not ( = ?auto_17122 ?auto_17117 ) ) ( not ( = ?auto_17122 ?auto_17109 ) ) ( not ( = ?auto_17122 ?auto_17116 ) ) ( not ( = ?auto_17122 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17094 ) ) ( not ( = ?auto_17088 ?auto_17131 ) ) ( not ( = ?auto_17089 ?auto_17094 ) ) ( not ( = ?auto_17089 ?auto_17131 ) ) ( not ( = ?auto_17090 ?auto_17094 ) ) ( not ( = ?auto_17090 ?auto_17131 ) ) ( not ( = ?auto_17091 ?auto_17094 ) ) ( not ( = ?auto_17091 ?auto_17131 ) ) ( not ( = ?auto_17092 ?auto_17094 ) ) ( not ( = ?auto_17092 ?auto_17131 ) ) ( not ( = ?auto_17094 ?auto_17122 ) ) ( not ( = ?auto_17094 ?auto_17117 ) ) ( not ( = ?auto_17094 ?auto_17109 ) ) ( not ( = ?auto_17094 ?auto_17116 ) ) ( not ( = ?auto_17094 ?auto_17110 ) ) ( not ( = ?auto_17115 ?auto_17112 ) ) ( not ( = ?auto_17115 ?auto_17114 ) ) ( not ( = ?auto_17115 ?auto_17137 ) ) ( not ( = ?auto_17115 ?auto_17127 ) ) ( not ( = ?auto_17115 ?auto_17135 ) ) ( not ( = ?auto_17129 ?auto_17138 ) ) ( not ( = ?auto_17129 ?auto_17125 ) ) ( not ( = ?auto_17129 ?auto_17124 ) ) ( not ( = ?auto_17129 ?auto_17126 ) ) ( not ( = ?auto_17129 ?auto_17119 ) ) ( not ( = ?auto_17131 ?auto_17122 ) ) ( not ( = ?auto_17131 ?auto_17117 ) ) ( not ( = ?auto_17131 ?auto_17109 ) ) ( not ( = ?auto_17131 ?auto_17116 ) ) ( not ( = ?auto_17131 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17095 ) ) ( not ( = ?auto_17088 ?auto_17120 ) ) ( not ( = ?auto_17089 ?auto_17095 ) ) ( not ( = ?auto_17089 ?auto_17120 ) ) ( not ( = ?auto_17090 ?auto_17095 ) ) ( not ( = ?auto_17090 ?auto_17120 ) ) ( not ( = ?auto_17091 ?auto_17095 ) ) ( not ( = ?auto_17091 ?auto_17120 ) ) ( not ( = ?auto_17092 ?auto_17095 ) ) ( not ( = ?auto_17092 ?auto_17120 ) ) ( not ( = ?auto_17093 ?auto_17095 ) ) ( not ( = ?auto_17093 ?auto_17120 ) ) ( not ( = ?auto_17095 ?auto_17131 ) ) ( not ( = ?auto_17095 ?auto_17122 ) ) ( not ( = ?auto_17095 ?auto_17117 ) ) ( not ( = ?auto_17095 ?auto_17109 ) ) ( not ( = ?auto_17095 ?auto_17116 ) ) ( not ( = ?auto_17095 ?auto_17110 ) ) ( not ( = ?auto_17139 ?auto_17115 ) ) ( not ( = ?auto_17139 ?auto_17112 ) ) ( not ( = ?auto_17139 ?auto_17114 ) ) ( not ( = ?auto_17139 ?auto_17137 ) ) ( not ( = ?auto_17139 ?auto_17127 ) ) ( not ( = ?auto_17139 ?auto_17135 ) ) ( not ( = ?auto_17113 ?auto_17129 ) ) ( not ( = ?auto_17113 ?auto_17138 ) ) ( not ( = ?auto_17113 ?auto_17125 ) ) ( not ( = ?auto_17113 ?auto_17124 ) ) ( not ( = ?auto_17113 ?auto_17126 ) ) ( not ( = ?auto_17113 ?auto_17119 ) ) ( not ( = ?auto_17120 ?auto_17131 ) ) ( not ( = ?auto_17120 ?auto_17122 ) ) ( not ( = ?auto_17120 ?auto_17117 ) ) ( not ( = ?auto_17120 ?auto_17109 ) ) ( not ( = ?auto_17120 ?auto_17116 ) ) ( not ( = ?auto_17120 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17096 ) ) ( not ( = ?auto_17088 ?auto_17111 ) ) ( not ( = ?auto_17089 ?auto_17096 ) ) ( not ( = ?auto_17089 ?auto_17111 ) ) ( not ( = ?auto_17090 ?auto_17096 ) ) ( not ( = ?auto_17090 ?auto_17111 ) ) ( not ( = ?auto_17091 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17111 ) ) ( not ( = ?auto_17092 ?auto_17096 ) ) ( not ( = ?auto_17092 ?auto_17111 ) ) ( not ( = ?auto_17093 ?auto_17096 ) ) ( not ( = ?auto_17093 ?auto_17111 ) ) ( not ( = ?auto_17094 ?auto_17096 ) ) ( not ( = ?auto_17094 ?auto_17111 ) ) ( not ( = ?auto_17096 ?auto_17120 ) ) ( not ( = ?auto_17096 ?auto_17131 ) ) ( not ( = ?auto_17096 ?auto_17122 ) ) ( not ( = ?auto_17096 ?auto_17117 ) ) ( not ( = ?auto_17096 ?auto_17109 ) ) ( not ( = ?auto_17096 ?auto_17116 ) ) ( not ( = ?auto_17096 ?auto_17110 ) ) ( not ( = ?auto_17111 ?auto_17120 ) ) ( not ( = ?auto_17111 ?auto_17131 ) ) ( not ( = ?auto_17111 ?auto_17122 ) ) ( not ( = ?auto_17111 ?auto_17117 ) ) ( not ( = ?auto_17111 ?auto_17109 ) ) ( not ( = ?auto_17111 ?auto_17116 ) ) ( not ( = ?auto_17111 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17097 ) ) ( not ( = ?auto_17088 ?auto_17141 ) ) ( not ( = ?auto_17089 ?auto_17097 ) ) ( not ( = ?auto_17089 ?auto_17141 ) ) ( not ( = ?auto_17090 ?auto_17097 ) ) ( not ( = ?auto_17090 ?auto_17141 ) ) ( not ( = ?auto_17091 ?auto_17097 ) ) ( not ( = ?auto_17091 ?auto_17141 ) ) ( not ( = ?auto_17092 ?auto_17097 ) ) ( not ( = ?auto_17092 ?auto_17141 ) ) ( not ( = ?auto_17093 ?auto_17097 ) ) ( not ( = ?auto_17093 ?auto_17141 ) ) ( not ( = ?auto_17094 ?auto_17097 ) ) ( not ( = ?auto_17094 ?auto_17141 ) ) ( not ( = ?auto_17095 ?auto_17097 ) ) ( not ( = ?auto_17095 ?auto_17141 ) ) ( not ( = ?auto_17097 ?auto_17111 ) ) ( not ( = ?auto_17097 ?auto_17120 ) ) ( not ( = ?auto_17097 ?auto_17131 ) ) ( not ( = ?auto_17097 ?auto_17122 ) ) ( not ( = ?auto_17097 ?auto_17117 ) ) ( not ( = ?auto_17097 ?auto_17109 ) ) ( not ( = ?auto_17097 ?auto_17116 ) ) ( not ( = ?auto_17097 ?auto_17110 ) ) ( not ( = ?auto_17132 ?auto_17137 ) ) ( not ( = ?auto_17132 ?auto_17139 ) ) ( not ( = ?auto_17132 ?auto_17115 ) ) ( not ( = ?auto_17132 ?auto_17112 ) ) ( not ( = ?auto_17132 ?auto_17114 ) ) ( not ( = ?auto_17132 ?auto_17127 ) ) ( not ( = ?auto_17132 ?auto_17135 ) ) ( not ( = ?auto_17118 ?auto_17124 ) ) ( not ( = ?auto_17118 ?auto_17113 ) ) ( not ( = ?auto_17118 ?auto_17129 ) ) ( not ( = ?auto_17118 ?auto_17138 ) ) ( not ( = ?auto_17118 ?auto_17125 ) ) ( not ( = ?auto_17118 ?auto_17126 ) ) ( not ( = ?auto_17118 ?auto_17119 ) ) ( not ( = ?auto_17141 ?auto_17111 ) ) ( not ( = ?auto_17141 ?auto_17120 ) ) ( not ( = ?auto_17141 ?auto_17131 ) ) ( not ( = ?auto_17141 ?auto_17122 ) ) ( not ( = ?auto_17141 ?auto_17117 ) ) ( not ( = ?auto_17141 ?auto_17109 ) ) ( not ( = ?auto_17141 ?auto_17116 ) ) ( not ( = ?auto_17141 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17098 ) ) ( not ( = ?auto_17088 ?auto_17108 ) ) ( not ( = ?auto_17089 ?auto_17098 ) ) ( not ( = ?auto_17089 ?auto_17108 ) ) ( not ( = ?auto_17090 ?auto_17098 ) ) ( not ( = ?auto_17090 ?auto_17108 ) ) ( not ( = ?auto_17091 ?auto_17098 ) ) ( not ( = ?auto_17091 ?auto_17108 ) ) ( not ( = ?auto_17092 ?auto_17098 ) ) ( not ( = ?auto_17092 ?auto_17108 ) ) ( not ( = ?auto_17093 ?auto_17098 ) ) ( not ( = ?auto_17093 ?auto_17108 ) ) ( not ( = ?auto_17094 ?auto_17098 ) ) ( not ( = ?auto_17094 ?auto_17108 ) ) ( not ( = ?auto_17095 ?auto_17098 ) ) ( not ( = ?auto_17095 ?auto_17108 ) ) ( not ( = ?auto_17096 ?auto_17098 ) ) ( not ( = ?auto_17096 ?auto_17108 ) ) ( not ( = ?auto_17098 ?auto_17141 ) ) ( not ( = ?auto_17098 ?auto_17111 ) ) ( not ( = ?auto_17098 ?auto_17120 ) ) ( not ( = ?auto_17098 ?auto_17131 ) ) ( not ( = ?auto_17098 ?auto_17122 ) ) ( not ( = ?auto_17098 ?auto_17117 ) ) ( not ( = ?auto_17098 ?auto_17109 ) ) ( not ( = ?auto_17098 ?auto_17116 ) ) ( not ( = ?auto_17098 ?auto_17110 ) ) ( not ( = ?auto_17134 ?auto_17132 ) ) ( not ( = ?auto_17134 ?auto_17137 ) ) ( not ( = ?auto_17134 ?auto_17139 ) ) ( not ( = ?auto_17134 ?auto_17115 ) ) ( not ( = ?auto_17134 ?auto_17112 ) ) ( not ( = ?auto_17134 ?auto_17114 ) ) ( not ( = ?auto_17134 ?auto_17127 ) ) ( not ( = ?auto_17134 ?auto_17135 ) ) ( not ( = ?auto_17121 ?auto_17118 ) ) ( not ( = ?auto_17121 ?auto_17124 ) ) ( not ( = ?auto_17121 ?auto_17113 ) ) ( not ( = ?auto_17121 ?auto_17129 ) ) ( not ( = ?auto_17121 ?auto_17138 ) ) ( not ( = ?auto_17121 ?auto_17125 ) ) ( not ( = ?auto_17121 ?auto_17126 ) ) ( not ( = ?auto_17121 ?auto_17119 ) ) ( not ( = ?auto_17108 ?auto_17141 ) ) ( not ( = ?auto_17108 ?auto_17111 ) ) ( not ( = ?auto_17108 ?auto_17120 ) ) ( not ( = ?auto_17108 ?auto_17131 ) ) ( not ( = ?auto_17108 ?auto_17122 ) ) ( not ( = ?auto_17108 ?auto_17117 ) ) ( not ( = ?auto_17108 ?auto_17109 ) ) ( not ( = ?auto_17108 ?auto_17116 ) ) ( not ( = ?auto_17108 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17099 ) ) ( not ( = ?auto_17088 ?auto_17140 ) ) ( not ( = ?auto_17089 ?auto_17099 ) ) ( not ( = ?auto_17089 ?auto_17140 ) ) ( not ( = ?auto_17090 ?auto_17099 ) ) ( not ( = ?auto_17090 ?auto_17140 ) ) ( not ( = ?auto_17091 ?auto_17099 ) ) ( not ( = ?auto_17091 ?auto_17140 ) ) ( not ( = ?auto_17092 ?auto_17099 ) ) ( not ( = ?auto_17092 ?auto_17140 ) ) ( not ( = ?auto_17093 ?auto_17099 ) ) ( not ( = ?auto_17093 ?auto_17140 ) ) ( not ( = ?auto_17094 ?auto_17099 ) ) ( not ( = ?auto_17094 ?auto_17140 ) ) ( not ( = ?auto_17095 ?auto_17099 ) ) ( not ( = ?auto_17095 ?auto_17140 ) ) ( not ( = ?auto_17096 ?auto_17099 ) ) ( not ( = ?auto_17096 ?auto_17140 ) ) ( not ( = ?auto_17097 ?auto_17099 ) ) ( not ( = ?auto_17097 ?auto_17140 ) ) ( not ( = ?auto_17099 ?auto_17108 ) ) ( not ( = ?auto_17099 ?auto_17141 ) ) ( not ( = ?auto_17099 ?auto_17111 ) ) ( not ( = ?auto_17099 ?auto_17120 ) ) ( not ( = ?auto_17099 ?auto_17131 ) ) ( not ( = ?auto_17099 ?auto_17122 ) ) ( not ( = ?auto_17099 ?auto_17117 ) ) ( not ( = ?auto_17099 ?auto_17109 ) ) ( not ( = ?auto_17099 ?auto_17116 ) ) ( not ( = ?auto_17099 ?auto_17110 ) ) ( not ( = ?auto_17130 ?auto_17134 ) ) ( not ( = ?auto_17130 ?auto_17132 ) ) ( not ( = ?auto_17130 ?auto_17137 ) ) ( not ( = ?auto_17130 ?auto_17139 ) ) ( not ( = ?auto_17130 ?auto_17115 ) ) ( not ( = ?auto_17130 ?auto_17112 ) ) ( not ( = ?auto_17130 ?auto_17114 ) ) ( not ( = ?auto_17130 ?auto_17127 ) ) ( not ( = ?auto_17130 ?auto_17135 ) ) ( not ( = ?auto_17136 ?auto_17121 ) ) ( not ( = ?auto_17136 ?auto_17118 ) ) ( not ( = ?auto_17136 ?auto_17124 ) ) ( not ( = ?auto_17136 ?auto_17113 ) ) ( not ( = ?auto_17136 ?auto_17129 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17125 ) ) ( not ( = ?auto_17136 ?auto_17126 ) ) ( not ( = ?auto_17136 ?auto_17119 ) ) ( not ( = ?auto_17140 ?auto_17108 ) ) ( not ( = ?auto_17140 ?auto_17141 ) ) ( not ( = ?auto_17140 ?auto_17111 ) ) ( not ( = ?auto_17140 ?auto_17120 ) ) ( not ( = ?auto_17140 ?auto_17131 ) ) ( not ( = ?auto_17140 ?auto_17122 ) ) ( not ( = ?auto_17140 ?auto_17117 ) ) ( not ( = ?auto_17140 ?auto_17109 ) ) ( not ( = ?auto_17140 ?auto_17116 ) ) ( not ( = ?auto_17140 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17100 ) ) ( not ( = ?auto_17088 ?auto_17133 ) ) ( not ( = ?auto_17089 ?auto_17100 ) ) ( not ( = ?auto_17089 ?auto_17133 ) ) ( not ( = ?auto_17090 ?auto_17100 ) ) ( not ( = ?auto_17090 ?auto_17133 ) ) ( not ( = ?auto_17091 ?auto_17100 ) ) ( not ( = ?auto_17091 ?auto_17133 ) ) ( not ( = ?auto_17092 ?auto_17100 ) ) ( not ( = ?auto_17092 ?auto_17133 ) ) ( not ( = ?auto_17093 ?auto_17100 ) ) ( not ( = ?auto_17093 ?auto_17133 ) ) ( not ( = ?auto_17094 ?auto_17100 ) ) ( not ( = ?auto_17094 ?auto_17133 ) ) ( not ( = ?auto_17095 ?auto_17100 ) ) ( not ( = ?auto_17095 ?auto_17133 ) ) ( not ( = ?auto_17096 ?auto_17100 ) ) ( not ( = ?auto_17096 ?auto_17133 ) ) ( not ( = ?auto_17097 ?auto_17100 ) ) ( not ( = ?auto_17097 ?auto_17133 ) ) ( not ( = ?auto_17098 ?auto_17100 ) ) ( not ( = ?auto_17098 ?auto_17133 ) ) ( not ( = ?auto_17100 ?auto_17140 ) ) ( not ( = ?auto_17100 ?auto_17108 ) ) ( not ( = ?auto_17100 ?auto_17141 ) ) ( not ( = ?auto_17100 ?auto_17111 ) ) ( not ( = ?auto_17100 ?auto_17120 ) ) ( not ( = ?auto_17100 ?auto_17131 ) ) ( not ( = ?auto_17100 ?auto_17122 ) ) ( not ( = ?auto_17100 ?auto_17117 ) ) ( not ( = ?auto_17100 ?auto_17109 ) ) ( not ( = ?auto_17100 ?auto_17116 ) ) ( not ( = ?auto_17100 ?auto_17110 ) ) ( not ( = ?auto_17123 ?auto_17130 ) ) ( not ( = ?auto_17123 ?auto_17134 ) ) ( not ( = ?auto_17123 ?auto_17132 ) ) ( not ( = ?auto_17123 ?auto_17137 ) ) ( not ( = ?auto_17123 ?auto_17139 ) ) ( not ( = ?auto_17123 ?auto_17115 ) ) ( not ( = ?auto_17123 ?auto_17112 ) ) ( not ( = ?auto_17123 ?auto_17114 ) ) ( not ( = ?auto_17123 ?auto_17127 ) ) ( not ( = ?auto_17123 ?auto_17135 ) ) ( not ( = ?auto_17128 ?auto_17136 ) ) ( not ( = ?auto_17128 ?auto_17121 ) ) ( not ( = ?auto_17128 ?auto_17118 ) ) ( not ( = ?auto_17128 ?auto_17124 ) ) ( not ( = ?auto_17128 ?auto_17113 ) ) ( not ( = ?auto_17128 ?auto_17129 ) ) ( not ( = ?auto_17128 ?auto_17138 ) ) ( not ( = ?auto_17128 ?auto_17125 ) ) ( not ( = ?auto_17128 ?auto_17126 ) ) ( not ( = ?auto_17128 ?auto_17119 ) ) ( not ( = ?auto_17133 ?auto_17140 ) ) ( not ( = ?auto_17133 ?auto_17108 ) ) ( not ( = ?auto_17133 ?auto_17141 ) ) ( not ( = ?auto_17133 ?auto_17111 ) ) ( not ( = ?auto_17133 ?auto_17120 ) ) ( not ( = ?auto_17133 ?auto_17131 ) ) ( not ( = ?auto_17133 ?auto_17122 ) ) ( not ( = ?auto_17133 ?auto_17117 ) ) ( not ( = ?auto_17133 ?auto_17109 ) ) ( not ( = ?auto_17133 ?auto_17116 ) ) ( not ( = ?auto_17133 ?auto_17110 ) ) ( not ( = ?auto_17088 ?auto_17101 ) ) ( not ( = ?auto_17088 ?auto_17105 ) ) ( not ( = ?auto_17089 ?auto_17101 ) ) ( not ( = ?auto_17089 ?auto_17105 ) ) ( not ( = ?auto_17090 ?auto_17101 ) ) ( not ( = ?auto_17090 ?auto_17105 ) ) ( not ( = ?auto_17091 ?auto_17101 ) ) ( not ( = ?auto_17091 ?auto_17105 ) ) ( not ( = ?auto_17092 ?auto_17101 ) ) ( not ( = ?auto_17092 ?auto_17105 ) ) ( not ( = ?auto_17093 ?auto_17101 ) ) ( not ( = ?auto_17093 ?auto_17105 ) ) ( not ( = ?auto_17094 ?auto_17101 ) ) ( not ( = ?auto_17094 ?auto_17105 ) ) ( not ( = ?auto_17095 ?auto_17101 ) ) ( not ( = ?auto_17095 ?auto_17105 ) ) ( not ( = ?auto_17096 ?auto_17101 ) ) ( not ( = ?auto_17096 ?auto_17105 ) ) ( not ( = ?auto_17097 ?auto_17101 ) ) ( not ( = ?auto_17097 ?auto_17105 ) ) ( not ( = ?auto_17098 ?auto_17101 ) ) ( not ( = ?auto_17098 ?auto_17105 ) ) ( not ( = ?auto_17099 ?auto_17101 ) ) ( not ( = ?auto_17099 ?auto_17105 ) ) ( not ( = ?auto_17101 ?auto_17133 ) ) ( not ( = ?auto_17101 ?auto_17140 ) ) ( not ( = ?auto_17101 ?auto_17108 ) ) ( not ( = ?auto_17101 ?auto_17141 ) ) ( not ( = ?auto_17101 ?auto_17111 ) ) ( not ( = ?auto_17101 ?auto_17120 ) ) ( not ( = ?auto_17101 ?auto_17131 ) ) ( not ( = ?auto_17101 ?auto_17122 ) ) ( not ( = ?auto_17101 ?auto_17117 ) ) ( not ( = ?auto_17101 ?auto_17109 ) ) ( not ( = ?auto_17101 ?auto_17116 ) ) ( not ( = ?auto_17101 ?auto_17110 ) ) ( not ( = ?auto_17106 ?auto_17123 ) ) ( not ( = ?auto_17106 ?auto_17130 ) ) ( not ( = ?auto_17106 ?auto_17134 ) ) ( not ( = ?auto_17106 ?auto_17132 ) ) ( not ( = ?auto_17106 ?auto_17137 ) ) ( not ( = ?auto_17106 ?auto_17139 ) ) ( not ( = ?auto_17106 ?auto_17115 ) ) ( not ( = ?auto_17106 ?auto_17112 ) ) ( not ( = ?auto_17106 ?auto_17114 ) ) ( not ( = ?auto_17106 ?auto_17127 ) ) ( not ( = ?auto_17106 ?auto_17135 ) ) ( not ( = ?auto_17104 ?auto_17128 ) ) ( not ( = ?auto_17104 ?auto_17136 ) ) ( not ( = ?auto_17104 ?auto_17121 ) ) ( not ( = ?auto_17104 ?auto_17118 ) ) ( not ( = ?auto_17104 ?auto_17124 ) ) ( not ( = ?auto_17104 ?auto_17113 ) ) ( not ( = ?auto_17104 ?auto_17129 ) ) ( not ( = ?auto_17104 ?auto_17138 ) ) ( not ( = ?auto_17104 ?auto_17125 ) ) ( not ( = ?auto_17104 ?auto_17126 ) ) ( not ( = ?auto_17104 ?auto_17119 ) ) ( not ( = ?auto_17105 ?auto_17133 ) ) ( not ( = ?auto_17105 ?auto_17140 ) ) ( not ( = ?auto_17105 ?auto_17108 ) ) ( not ( = ?auto_17105 ?auto_17141 ) ) ( not ( = ?auto_17105 ?auto_17111 ) ) ( not ( = ?auto_17105 ?auto_17120 ) ) ( not ( = ?auto_17105 ?auto_17131 ) ) ( not ( = ?auto_17105 ?auto_17122 ) ) ( not ( = ?auto_17105 ?auto_17117 ) ) ( not ( = ?auto_17105 ?auto_17109 ) ) ( not ( = ?auto_17105 ?auto_17116 ) ) ( not ( = ?auto_17105 ?auto_17110 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17088 ?auto_17089 ?auto_17090 ?auto_17091 ?auto_17092 ?auto_17093 ?auto_17094 ?auto_17095 ?auto_17096 ?auto_17097 ?auto_17098 ?auto_17099 ?auto_17100 )
      ( MAKE-1CRATE ?auto_17100 ?auto_17101 )
      ( MAKE-13CRATE-VERIFY ?auto_17088 ?auto_17089 ?auto_17090 ?auto_17091 ?auto_17092 ?auto_17093 ?auto_17094 ?auto_17095 ?auto_17096 ?auto_17097 ?auto_17098 ?auto_17099 ?auto_17100 ?auto_17101 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17167 - SURFACE
      ?auto_17168 - SURFACE
      ?auto_17169 - SURFACE
      ?auto_17170 - SURFACE
      ?auto_17171 - SURFACE
      ?auto_17172 - SURFACE
      ?auto_17173 - SURFACE
      ?auto_17174 - SURFACE
      ?auto_17175 - SURFACE
      ?auto_17176 - SURFACE
      ?auto_17177 - SURFACE
      ?auto_17178 - SURFACE
      ?auto_17179 - SURFACE
      ?auto_17181 - SURFACE
      ?auto_17180 - SURFACE
    )
    :vars
    (
      ?auto_17187 - HOIST
      ?auto_17186 - PLACE
      ?auto_17183 - PLACE
      ?auto_17182 - HOIST
      ?auto_17185 - SURFACE
      ?auto_17194 - PLACE
      ?auto_17197 - HOIST
      ?auto_17189 - SURFACE
      ?auto_17213 - PLACE
      ?auto_17198 - HOIST
      ?auto_17188 - SURFACE
      ?auto_17193 - PLACE
      ?auto_17204 - HOIST
      ?auto_17215 - SURFACE
      ?auto_17218 - PLACE
      ?auto_17192 - HOIST
      ?auto_17223 - SURFACE
      ?auto_17199 - PLACE
      ?auto_17216 - HOIST
      ?auto_17196 - SURFACE
      ?auto_17209 - PLACE
      ?auto_17212 - HOIST
      ?auto_17207 - SURFACE
      ?auto_17206 - PLACE
      ?auto_17221 - HOIST
      ?auto_17217 - SURFACE
      ?auto_17224 - PLACE
      ?auto_17210 - HOIST
      ?auto_17200 - SURFACE
      ?auto_17208 - PLACE
      ?auto_17203 - HOIST
      ?auto_17222 - SURFACE
      ?auto_17211 - PLACE
      ?auto_17201 - HOIST
      ?auto_17202 - SURFACE
      ?auto_17205 - SURFACE
      ?auto_17219 - PLACE
      ?auto_17220 - HOIST
      ?auto_17190 - SURFACE
      ?auto_17214 - PLACE
      ?auto_17191 - HOIST
      ?auto_17195 - SURFACE
      ?auto_17184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17187 ?auto_17186 ) ( IS-CRATE ?auto_17180 ) ( not ( = ?auto_17183 ?auto_17186 ) ) ( HOIST-AT ?auto_17182 ?auto_17183 ) ( AVAILABLE ?auto_17182 ) ( SURFACE-AT ?auto_17180 ?auto_17183 ) ( ON ?auto_17180 ?auto_17185 ) ( CLEAR ?auto_17180 ) ( not ( = ?auto_17181 ?auto_17180 ) ) ( not ( = ?auto_17181 ?auto_17185 ) ) ( not ( = ?auto_17180 ?auto_17185 ) ) ( not ( = ?auto_17187 ?auto_17182 ) ) ( IS-CRATE ?auto_17181 ) ( not ( = ?auto_17194 ?auto_17186 ) ) ( HOIST-AT ?auto_17197 ?auto_17194 ) ( AVAILABLE ?auto_17197 ) ( SURFACE-AT ?auto_17181 ?auto_17194 ) ( ON ?auto_17181 ?auto_17189 ) ( CLEAR ?auto_17181 ) ( not ( = ?auto_17179 ?auto_17181 ) ) ( not ( = ?auto_17179 ?auto_17189 ) ) ( not ( = ?auto_17181 ?auto_17189 ) ) ( not ( = ?auto_17187 ?auto_17197 ) ) ( IS-CRATE ?auto_17179 ) ( not ( = ?auto_17213 ?auto_17186 ) ) ( HOIST-AT ?auto_17198 ?auto_17213 ) ( AVAILABLE ?auto_17198 ) ( SURFACE-AT ?auto_17179 ?auto_17213 ) ( ON ?auto_17179 ?auto_17188 ) ( CLEAR ?auto_17179 ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17188 ) ) ( not ( = ?auto_17179 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17198 ) ) ( IS-CRATE ?auto_17178 ) ( not ( = ?auto_17193 ?auto_17186 ) ) ( HOIST-AT ?auto_17204 ?auto_17193 ) ( AVAILABLE ?auto_17204 ) ( SURFACE-AT ?auto_17178 ?auto_17193 ) ( ON ?auto_17178 ?auto_17215 ) ( CLEAR ?auto_17178 ) ( not ( = ?auto_17177 ?auto_17178 ) ) ( not ( = ?auto_17177 ?auto_17215 ) ) ( not ( = ?auto_17178 ?auto_17215 ) ) ( not ( = ?auto_17187 ?auto_17204 ) ) ( IS-CRATE ?auto_17177 ) ( not ( = ?auto_17218 ?auto_17186 ) ) ( HOIST-AT ?auto_17192 ?auto_17218 ) ( AVAILABLE ?auto_17192 ) ( SURFACE-AT ?auto_17177 ?auto_17218 ) ( ON ?auto_17177 ?auto_17223 ) ( CLEAR ?auto_17177 ) ( not ( = ?auto_17176 ?auto_17177 ) ) ( not ( = ?auto_17176 ?auto_17223 ) ) ( not ( = ?auto_17177 ?auto_17223 ) ) ( not ( = ?auto_17187 ?auto_17192 ) ) ( IS-CRATE ?auto_17176 ) ( not ( = ?auto_17199 ?auto_17186 ) ) ( HOIST-AT ?auto_17216 ?auto_17199 ) ( AVAILABLE ?auto_17216 ) ( SURFACE-AT ?auto_17176 ?auto_17199 ) ( ON ?auto_17176 ?auto_17196 ) ( CLEAR ?auto_17176 ) ( not ( = ?auto_17175 ?auto_17176 ) ) ( not ( = ?auto_17175 ?auto_17196 ) ) ( not ( = ?auto_17176 ?auto_17196 ) ) ( not ( = ?auto_17187 ?auto_17216 ) ) ( IS-CRATE ?auto_17175 ) ( not ( = ?auto_17209 ?auto_17186 ) ) ( HOIST-AT ?auto_17212 ?auto_17209 ) ( SURFACE-AT ?auto_17175 ?auto_17209 ) ( ON ?auto_17175 ?auto_17207 ) ( CLEAR ?auto_17175 ) ( not ( = ?auto_17174 ?auto_17175 ) ) ( not ( = ?auto_17174 ?auto_17207 ) ) ( not ( = ?auto_17175 ?auto_17207 ) ) ( not ( = ?auto_17187 ?auto_17212 ) ) ( IS-CRATE ?auto_17174 ) ( not ( = ?auto_17206 ?auto_17186 ) ) ( HOIST-AT ?auto_17221 ?auto_17206 ) ( AVAILABLE ?auto_17221 ) ( SURFACE-AT ?auto_17174 ?auto_17206 ) ( ON ?auto_17174 ?auto_17217 ) ( CLEAR ?auto_17174 ) ( not ( = ?auto_17173 ?auto_17174 ) ) ( not ( = ?auto_17173 ?auto_17217 ) ) ( not ( = ?auto_17174 ?auto_17217 ) ) ( not ( = ?auto_17187 ?auto_17221 ) ) ( IS-CRATE ?auto_17173 ) ( not ( = ?auto_17224 ?auto_17186 ) ) ( HOIST-AT ?auto_17210 ?auto_17224 ) ( AVAILABLE ?auto_17210 ) ( SURFACE-AT ?auto_17173 ?auto_17224 ) ( ON ?auto_17173 ?auto_17200 ) ( CLEAR ?auto_17173 ) ( not ( = ?auto_17172 ?auto_17173 ) ) ( not ( = ?auto_17172 ?auto_17200 ) ) ( not ( = ?auto_17173 ?auto_17200 ) ) ( not ( = ?auto_17187 ?auto_17210 ) ) ( IS-CRATE ?auto_17172 ) ( not ( = ?auto_17208 ?auto_17186 ) ) ( HOIST-AT ?auto_17203 ?auto_17208 ) ( AVAILABLE ?auto_17203 ) ( SURFACE-AT ?auto_17172 ?auto_17208 ) ( ON ?auto_17172 ?auto_17222 ) ( CLEAR ?auto_17172 ) ( not ( = ?auto_17171 ?auto_17172 ) ) ( not ( = ?auto_17171 ?auto_17222 ) ) ( not ( = ?auto_17172 ?auto_17222 ) ) ( not ( = ?auto_17187 ?auto_17203 ) ) ( IS-CRATE ?auto_17171 ) ( not ( = ?auto_17211 ?auto_17186 ) ) ( HOIST-AT ?auto_17201 ?auto_17211 ) ( AVAILABLE ?auto_17201 ) ( SURFACE-AT ?auto_17171 ?auto_17211 ) ( ON ?auto_17171 ?auto_17202 ) ( CLEAR ?auto_17171 ) ( not ( = ?auto_17170 ?auto_17171 ) ) ( not ( = ?auto_17170 ?auto_17202 ) ) ( not ( = ?auto_17171 ?auto_17202 ) ) ( not ( = ?auto_17187 ?auto_17201 ) ) ( IS-CRATE ?auto_17170 ) ( AVAILABLE ?auto_17212 ) ( SURFACE-AT ?auto_17170 ?auto_17209 ) ( ON ?auto_17170 ?auto_17205 ) ( CLEAR ?auto_17170 ) ( not ( = ?auto_17169 ?auto_17170 ) ) ( not ( = ?auto_17169 ?auto_17205 ) ) ( not ( = ?auto_17170 ?auto_17205 ) ) ( IS-CRATE ?auto_17169 ) ( not ( = ?auto_17219 ?auto_17186 ) ) ( HOIST-AT ?auto_17220 ?auto_17219 ) ( AVAILABLE ?auto_17220 ) ( SURFACE-AT ?auto_17169 ?auto_17219 ) ( ON ?auto_17169 ?auto_17190 ) ( CLEAR ?auto_17169 ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17190 ) ) ( not ( = ?auto_17169 ?auto_17190 ) ) ( not ( = ?auto_17187 ?auto_17220 ) ) ( SURFACE-AT ?auto_17167 ?auto_17186 ) ( CLEAR ?auto_17167 ) ( IS-CRATE ?auto_17168 ) ( AVAILABLE ?auto_17187 ) ( not ( = ?auto_17214 ?auto_17186 ) ) ( HOIST-AT ?auto_17191 ?auto_17214 ) ( AVAILABLE ?auto_17191 ) ( SURFACE-AT ?auto_17168 ?auto_17214 ) ( ON ?auto_17168 ?auto_17195 ) ( CLEAR ?auto_17168 ) ( TRUCK-AT ?auto_17184 ?auto_17186 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17195 ) ) ( not ( = ?auto_17168 ?auto_17195 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17190 ) ) ( not ( = ?auto_17169 ?auto_17195 ) ) ( not ( = ?auto_17219 ?auto_17214 ) ) ( not ( = ?auto_17220 ?auto_17191 ) ) ( not ( = ?auto_17190 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17170 ) ) ( not ( = ?auto_17167 ?auto_17205 ) ) ( not ( = ?auto_17168 ?auto_17170 ) ) ( not ( = ?auto_17168 ?auto_17205 ) ) ( not ( = ?auto_17170 ?auto_17190 ) ) ( not ( = ?auto_17170 ?auto_17195 ) ) ( not ( = ?auto_17209 ?auto_17219 ) ) ( not ( = ?auto_17209 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17220 ) ) ( not ( = ?auto_17212 ?auto_17191 ) ) ( not ( = ?auto_17205 ?auto_17190 ) ) ( not ( = ?auto_17205 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17171 ) ) ( not ( = ?auto_17167 ?auto_17202 ) ) ( not ( = ?auto_17168 ?auto_17171 ) ) ( not ( = ?auto_17168 ?auto_17202 ) ) ( not ( = ?auto_17169 ?auto_17171 ) ) ( not ( = ?auto_17169 ?auto_17202 ) ) ( not ( = ?auto_17171 ?auto_17205 ) ) ( not ( = ?auto_17171 ?auto_17190 ) ) ( not ( = ?auto_17171 ?auto_17195 ) ) ( not ( = ?auto_17211 ?auto_17209 ) ) ( not ( = ?auto_17211 ?auto_17219 ) ) ( not ( = ?auto_17211 ?auto_17214 ) ) ( not ( = ?auto_17201 ?auto_17212 ) ) ( not ( = ?auto_17201 ?auto_17220 ) ) ( not ( = ?auto_17201 ?auto_17191 ) ) ( not ( = ?auto_17202 ?auto_17205 ) ) ( not ( = ?auto_17202 ?auto_17190 ) ) ( not ( = ?auto_17202 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17172 ) ) ( not ( = ?auto_17167 ?auto_17222 ) ) ( not ( = ?auto_17168 ?auto_17172 ) ) ( not ( = ?auto_17168 ?auto_17222 ) ) ( not ( = ?auto_17169 ?auto_17172 ) ) ( not ( = ?auto_17169 ?auto_17222 ) ) ( not ( = ?auto_17170 ?auto_17172 ) ) ( not ( = ?auto_17170 ?auto_17222 ) ) ( not ( = ?auto_17172 ?auto_17202 ) ) ( not ( = ?auto_17172 ?auto_17205 ) ) ( not ( = ?auto_17172 ?auto_17190 ) ) ( not ( = ?auto_17172 ?auto_17195 ) ) ( not ( = ?auto_17208 ?auto_17211 ) ) ( not ( = ?auto_17208 ?auto_17209 ) ) ( not ( = ?auto_17208 ?auto_17219 ) ) ( not ( = ?auto_17208 ?auto_17214 ) ) ( not ( = ?auto_17203 ?auto_17201 ) ) ( not ( = ?auto_17203 ?auto_17212 ) ) ( not ( = ?auto_17203 ?auto_17220 ) ) ( not ( = ?auto_17203 ?auto_17191 ) ) ( not ( = ?auto_17222 ?auto_17202 ) ) ( not ( = ?auto_17222 ?auto_17205 ) ) ( not ( = ?auto_17222 ?auto_17190 ) ) ( not ( = ?auto_17222 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17173 ) ) ( not ( = ?auto_17167 ?auto_17200 ) ) ( not ( = ?auto_17168 ?auto_17173 ) ) ( not ( = ?auto_17168 ?auto_17200 ) ) ( not ( = ?auto_17169 ?auto_17173 ) ) ( not ( = ?auto_17169 ?auto_17200 ) ) ( not ( = ?auto_17170 ?auto_17173 ) ) ( not ( = ?auto_17170 ?auto_17200 ) ) ( not ( = ?auto_17171 ?auto_17173 ) ) ( not ( = ?auto_17171 ?auto_17200 ) ) ( not ( = ?auto_17173 ?auto_17222 ) ) ( not ( = ?auto_17173 ?auto_17202 ) ) ( not ( = ?auto_17173 ?auto_17205 ) ) ( not ( = ?auto_17173 ?auto_17190 ) ) ( not ( = ?auto_17173 ?auto_17195 ) ) ( not ( = ?auto_17224 ?auto_17208 ) ) ( not ( = ?auto_17224 ?auto_17211 ) ) ( not ( = ?auto_17224 ?auto_17209 ) ) ( not ( = ?auto_17224 ?auto_17219 ) ) ( not ( = ?auto_17224 ?auto_17214 ) ) ( not ( = ?auto_17210 ?auto_17203 ) ) ( not ( = ?auto_17210 ?auto_17201 ) ) ( not ( = ?auto_17210 ?auto_17212 ) ) ( not ( = ?auto_17210 ?auto_17220 ) ) ( not ( = ?auto_17210 ?auto_17191 ) ) ( not ( = ?auto_17200 ?auto_17222 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17205 ) ) ( not ( = ?auto_17200 ?auto_17190 ) ) ( not ( = ?auto_17200 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17174 ) ) ( not ( = ?auto_17167 ?auto_17217 ) ) ( not ( = ?auto_17168 ?auto_17174 ) ) ( not ( = ?auto_17168 ?auto_17217 ) ) ( not ( = ?auto_17169 ?auto_17174 ) ) ( not ( = ?auto_17169 ?auto_17217 ) ) ( not ( = ?auto_17170 ?auto_17174 ) ) ( not ( = ?auto_17170 ?auto_17217 ) ) ( not ( = ?auto_17171 ?auto_17174 ) ) ( not ( = ?auto_17171 ?auto_17217 ) ) ( not ( = ?auto_17172 ?auto_17174 ) ) ( not ( = ?auto_17172 ?auto_17217 ) ) ( not ( = ?auto_17174 ?auto_17200 ) ) ( not ( = ?auto_17174 ?auto_17222 ) ) ( not ( = ?auto_17174 ?auto_17202 ) ) ( not ( = ?auto_17174 ?auto_17205 ) ) ( not ( = ?auto_17174 ?auto_17190 ) ) ( not ( = ?auto_17174 ?auto_17195 ) ) ( not ( = ?auto_17206 ?auto_17224 ) ) ( not ( = ?auto_17206 ?auto_17208 ) ) ( not ( = ?auto_17206 ?auto_17211 ) ) ( not ( = ?auto_17206 ?auto_17209 ) ) ( not ( = ?auto_17206 ?auto_17219 ) ) ( not ( = ?auto_17206 ?auto_17214 ) ) ( not ( = ?auto_17221 ?auto_17210 ) ) ( not ( = ?auto_17221 ?auto_17203 ) ) ( not ( = ?auto_17221 ?auto_17201 ) ) ( not ( = ?auto_17221 ?auto_17212 ) ) ( not ( = ?auto_17221 ?auto_17220 ) ) ( not ( = ?auto_17221 ?auto_17191 ) ) ( not ( = ?auto_17217 ?auto_17200 ) ) ( not ( = ?auto_17217 ?auto_17222 ) ) ( not ( = ?auto_17217 ?auto_17202 ) ) ( not ( = ?auto_17217 ?auto_17205 ) ) ( not ( = ?auto_17217 ?auto_17190 ) ) ( not ( = ?auto_17217 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17175 ) ) ( not ( = ?auto_17167 ?auto_17207 ) ) ( not ( = ?auto_17168 ?auto_17175 ) ) ( not ( = ?auto_17168 ?auto_17207 ) ) ( not ( = ?auto_17169 ?auto_17175 ) ) ( not ( = ?auto_17169 ?auto_17207 ) ) ( not ( = ?auto_17170 ?auto_17175 ) ) ( not ( = ?auto_17170 ?auto_17207 ) ) ( not ( = ?auto_17171 ?auto_17175 ) ) ( not ( = ?auto_17171 ?auto_17207 ) ) ( not ( = ?auto_17172 ?auto_17175 ) ) ( not ( = ?auto_17172 ?auto_17207 ) ) ( not ( = ?auto_17173 ?auto_17175 ) ) ( not ( = ?auto_17173 ?auto_17207 ) ) ( not ( = ?auto_17175 ?auto_17217 ) ) ( not ( = ?auto_17175 ?auto_17200 ) ) ( not ( = ?auto_17175 ?auto_17222 ) ) ( not ( = ?auto_17175 ?auto_17202 ) ) ( not ( = ?auto_17175 ?auto_17205 ) ) ( not ( = ?auto_17175 ?auto_17190 ) ) ( not ( = ?auto_17175 ?auto_17195 ) ) ( not ( = ?auto_17207 ?auto_17217 ) ) ( not ( = ?auto_17207 ?auto_17200 ) ) ( not ( = ?auto_17207 ?auto_17222 ) ) ( not ( = ?auto_17207 ?auto_17202 ) ) ( not ( = ?auto_17207 ?auto_17205 ) ) ( not ( = ?auto_17207 ?auto_17190 ) ) ( not ( = ?auto_17207 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17176 ) ) ( not ( = ?auto_17167 ?auto_17196 ) ) ( not ( = ?auto_17168 ?auto_17176 ) ) ( not ( = ?auto_17168 ?auto_17196 ) ) ( not ( = ?auto_17169 ?auto_17176 ) ) ( not ( = ?auto_17169 ?auto_17196 ) ) ( not ( = ?auto_17170 ?auto_17176 ) ) ( not ( = ?auto_17170 ?auto_17196 ) ) ( not ( = ?auto_17171 ?auto_17176 ) ) ( not ( = ?auto_17171 ?auto_17196 ) ) ( not ( = ?auto_17172 ?auto_17176 ) ) ( not ( = ?auto_17172 ?auto_17196 ) ) ( not ( = ?auto_17173 ?auto_17176 ) ) ( not ( = ?auto_17173 ?auto_17196 ) ) ( not ( = ?auto_17174 ?auto_17176 ) ) ( not ( = ?auto_17174 ?auto_17196 ) ) ( not ( = ?auto_17176 ?auto_17207 ) ) ( not ( = ?auto_17176 ?auto_17217 ) ) ( not ( = ?auto_17176 ?auto_17200 ) ) ( not ( = ?auto_17176 ?auto_17222 ) ) ( not ( = ?auto_17176 ?auto_17202 ) ) ( not ( = ?auto_17176 ?auto_17205 ) ) ( not ( = ?auto_17176 ?auto_17190 ) ) ( not ( = ?auto_17176 ?auto_17195 ) ) ( not ( = ?auto_17199 ?auto_17209 ) ) ( not ( = ?auto_17199 ?auto_17206 ) ) ( not ( = ?auto_17199 ?auto_17224 ) ) ( not ( = ?auto_17199 ?auto_17208 ) ) ( not ( = ?auto_17199 ?auto_17211 ) ) ( not ( = ?auto_17199 ?auto_17219 ) ) ( not ( = ?auto_17199 ?auto_17214 ) ) ( not ( = ?auto_17216 ?auto_17212 ) ) ( not ( = ?auto_17216 ?auto_17221 ) ) ( not ( = ?auto_17216 ?auto_17210 ) ) ( not ( = ?auto_17216 ?auto_17203 ) ) ( not ( = ?auto_17216 ?auto_17201 ) ) ( not ( = ?auto_17216 ?auto_17220 ) ) ( not ( = ?auto_17216 ?auto_17191 ) ) ( not ( = ?auto_17196 ?auto_17207 ) ) ( not ( = ?auto_17196 ?auto_17217 ) ) ( not ( = ?auto_17196 ?auto_17200 ) ) ( not ( = ?auto_17196 ?auto_17222 ) ) ( not ( = ?auto_17196 ?auto_17202 ) ) ( not ( = ?auto_17196 ?auto_17205 ) ) ( not ( = ?auto_17196 ?auto_17190 ) ) ( not ( = ?auto_17196 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17223 ) ) ( not ( = ?auto_17168 ?auto_17177 ) ) ( not ( = ?auto_17168 ?auto_17223 ) ) ( not ( = ?auto_17169 ?auto_17177 ) ) ( not ( = ?auto_17169 ?auto_17223 ) ) ( not ( = ?auto_17170 ?auto_17177 ) ) ( not ( = ?auto_17170 ?auto_17223 ) ) ( not ( = ?auto_17171 ?auto_17177 ) ) ( not ( = ?auto_17171 ?auto_17223 ) ) ( not ( = ?auto_17172 ?auto_17177 ) ) ( not ( = ?auto_17172 ?auto_17223 ) ) ( not ( = ?auto_17173 ?auto_17177 ) ) ( not ( = ?auto_17173 ?auto_17223 ) ) ( not ( = ?auto_17174 ?auto_17177 ) ) ( not ( = ?auto_17174 ?auto_17223 ) ) ( not ( = ?auto_17175 ?auto_17177 ) ) ( not ( = ?auto_17175 ?auto_17223 ) ) ( not ( = ?auto_17177 ?auto_17196 ) ) ( not ( = ?auto_17177 ?auto_17207 ) ) ( not ( = ?auto_17177 ?auto_17217 ) ) ( not ( = ?auto_17177 ?auto_17200 ) ) ( not ( = ?auto_17177 ?auto_17222 ) ) ( not ( = ?auto_17177 ?auto_17202 ) ) ( not ( = ?auto_17177 ?auto_17205 ) ) ( not ( = ?auto_17177 ?auto_17190 ) ) ( not ( = ?auto_17177 ?auto_17195 ) ) ( not ( = ?auto_17218 ?auto_17199 ) ) ( not ( = ?auto_17218 ?auto_17209 ) ) ( not ( = ?auto_17218 ?auto_17206 ) ) ( not ( = ?auto_17218 ?auto_17224 ) ) ( not ( = ?auto_17218 ?auto_17208 ) ) ( not ( = ?auto_17218 ?auto_17211 ) ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( not ( = ?auto_17218 ?auto_17214 ) ) ( not ( = ?auto_17192 ?auto_17216 ) ) ( not ( = ?auto_17192 ?auto_17212 ) ) ( not ( = ?auto_17192 ?auto_17221 ) ) ( not ( = ?auto_17192 ?auto_17210 ) ) ( not ( = ?auto_17192 ?auto_17203 ) ) ( not ( = ?auto_17192 ?auto_17201 ) ) ( not ( = ?auto_17192 ?auto_17220 ) ) ( not ( = ?auto_17192 ?auto_17191 ) ) ( not ( = ?auto_17223 ?auto_17196 ) ) ( not ( = ?auto_17223 ?auto_17207 ) ) ( not ( = ?auto_17223 ?auto_17217 ) ) ( not ( = ?auto_17223 ?auto_17200 ) ) ( not ( = ?auto_17223 ?auto_17222 ) ) ( not ( = ?auto_17223 ?auto_17202 ) ) ( not ( = ?auto_17223 ?auto_17205 ) ) ( not ( = ?auto_17223 ?auto_17190 ) ) ( not ( = ?auto_17223 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17178 ) ) ( not ( = ?auto_17167 ?auto_17215 ) ) ( not ( = ?auto_17168 ?auto_17178 ) ) ( not ( = ?auto_17168 ?auto_17215 ) ) ( not ( = ?auto_17169 ?auto_17178 ) ) ( not ( = ?auto_17169 ?auto_17215 ) ) ( not ( = ?auto_17170 ?auto_17178 ) ) ( not ( = ?auto_17170 ?auto_17215 ) ) ( not ( = ?auto_17171 ?auto_17178 ) ) ( not ( = ?auto_17171 ?auto_17215 ) ) ( not ( = ?auto_17172 ?auto_17178 ) ) ( not ( = ?auto_17172 ?auto_17215 ) ) ( not ( = ?auto_17173 ?auto_17178 ) ) ( not ( = ?auto_17173 ?auto_17215 ) ) ( not ( = ?auto_17174 ?auto_17178 ) ) ( not ( = ?auto_17174 ?auto_17215 ) ) ( not ( = ?auto_17175 ?auto_17178 ) ) ( not ( = ?auto_17175 ?auto_17215 ) ) ( not ( = ?auto_17176 ?auto_17178 ) ) ( not ( = ?auto_17176 ?auto_17215 ) ) ( not ( = ?auto_17178 ?auto_17223 ) ) ( not ( = ?auto_17178 ?auto_17196 ) ) ( not ( = ?auto_17178 ?auto_17207 ) ) ( not ( = ?auto_17178 ?auto_17217 ) ) ( not ( = ?auto_17178 ?auto_17200 ) ) ( not ( = ?auto_17178 ?auto_17222 ) ) ( not ( = ?auto_17178 ?auto_17202 ) ) ( not ( = ?auto_17178 ?auto_17205 ) ) ( not ( = ?auto_17178 ?auto_17190 ) ) ( not ( = ?auto_17178 ?auto_17195 ) ) ( not ( = ?auto_17193 ?auto_17218 ) ) ( not ( = ?auto_17193 ?auto_17199 ) ) ( not ( = ?auto_17193 ?auto_17209 ) ) ( not ( = ?auto_17193 ?auto_17206 ) ) ( not ( = ?auto_17193 ?auto_17224 ) ) ( not ( = ?auto_17193 ?auto_17208 ) ) ( not ( = ?auto_17193 ?auto_17211 ) ) ( not ( = ?auto_17193 ?auto_17219 ) ) ( not ( = ?auto_17193 ?auto_17214 ) ) ( not ( = ?auto_17204 ?auto_17192 ) ) ( not ( = ?auto_17204 ?auto_17216 ) ) ( not ( = ?auto_17204 ?auto_17212 ) ) ( not ( = ?auto_17204 ?auto_17221 ) ) ( not ( = ?auto_17204 ?auto_17210 ) ) ( not ( = ?auto_17204 ?auto_17203 ) ) ( not ( = ?auto_17204 ?auto_17201 ) ) ( not ( = ?auto_17204 ?auto_17220 ) ) ( not ( = ?auto_17204 ?auto_17191 ) ) ( not ( = ?auto_17215 ?auto_17223 ) ) ( not ( = ?auto_17215 ?auto_17196 ) ) ( not ( = ?auto_17215 ?auto_17207 ) ) ( not ( = ?auto_17215 ?auto_17217 ) ) ( not ( = ?auto_17215 ?auto_17200 ) ) ( not ( = ?auto_17215 ?auto_17222 ) ) ( not ( = ?auto_17215 ?auto_17202 ) ) ( not ( = ?auto_17215 ?auto_17205 ) ) ( not ( = ?auto_17215 ?auto_17190 ) ) ( not ( = ?auto_17215 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17179 ) ) ( not ( = ?auto_17167 ?auto_17188 ) ) ( not ( = ?auto_17168 ?auto_17179 ) ) ( not ( = ?auto_17168 ?auto_17188 ) ) ( not ( = ?auto_17169 ?auto_17179 ) ) ( not ( = ?auto_17169 ?auto_17188 ) ) ( not ( = ?auto_17170 ?auto_17179 ) ) ( not ( = ?auto_17170 ?auto_17188 ) ) ( not ( = ?auto_17171 ?auto_17179 ) ) ( not ( = ?auto_17171 ?auto_17188 ) ) ( not ( = ?auto_17172 ?auto_17179 ) ) ( not ( = ?auto_17172 ?auto_17188 ) ) ( not ( = ?auto_17173 ?auto_17179 ) ) ( not ( = ?auto_17173 ?auto_17188 ) ) ( not ( = ?auto_17174 ?auto_17179 ) ) ( not ( = ?auto_17174 ?auto_17188 ) ) ( not ( = ?auto_17175 ?auto_17179 ) ) ( not ( = ?auto_17175 ?auto_17188 ) ) ( not ( = ?auto_17176 ?auto_17179 ) ) ( not ( = ?auto_17176 ?auto_17188 ) ) ( not ( = ?auto_17177 ?auto_17179 ) ) ( not ( = ?auto_17177 ?auto_17188 ) ) ( not ( = ?auto_17179 ?auto_17215 ) ) ( not ( = ?auto_17179 ?auto_17223 ) ) ( not ( = ?auto_17179 ?auto_17196 ) ) ( not ( = ?auto_17179 ?auto_17207 ) ) ( not ( = ?auto_17179 ?auto_17217 ) ) ( not ( = ?auto_17179 ?auto_17200 ) ) ( not ( = ?auto_17179 ?auto_17222 ) ) ( not ( = ?auto_17179 ?auto_17202 ) ) ( not ( = ?auto_17179 ?auto_17205 ) ) ( not ( = ?auto_17179 ?auto_17190 ) ) ( not ( = ?auto_17179 ?auto_17195 ) ) ( not ( = ?auto_17213 ?auto_17193 ) ) ( not ( = ?auto_17213 ?auto_17218 ) ) ( not ( = ?auto_17213 ?auto_17199 ) ) ( not ( = ?auto_17213 ?auto_17209 ) ) ( not ( = ?auto_17213 ?auto_17206 ) ) ( not ( = ?auto_17213 ?auto_17224 ) ) ( not ( = ?auto_17213 ?auto_17208 ) ) ( not ( = ?auto_17213 ?auto_17211 ) ) ( not ( = ?auto_17213 ?auto_17219 ) ) ( not ( = ?auto_17213 ?auto_17214 ) ) ( not ( = ?auto_17198 ?auto_17204 ) ) ( not ( = ?auto_17198 ?auto_17192 ) ) ( not ( = ?auto_17198 ?auto_17216 ) ) ( not ( = ?auto_17198 ?auto_17212 ) ) ( not ( = ?auto_17198 ?auto_17221 ) ) ( not ( = ?auto_17198 ?auto_17210 ) ) ( not ( = ?auto_17198 ?auto_17203 ) ) ( not ( = ?auto_17198 ?auto_17201 ) ) ( not ( = ?auto_17198 ?auto_17220 ) ) ( not ( = ?auto_17198 ?auto_17191 ) ) ( not ( = ?auto_17188 ?auto_17215 ) ) ( not ( = ?auto_17188 ?auto_17223 ) ) ( not ( = ?auto_17188 ?auto_17196 ) ) ( not ( = ?auto_17188 ?auto_17207 ) ) ( not ( = ?auto_17188 ?auto_17217 ) ) ( not ( = ?auto_17188 ?auto_17200 ) ) ( not ( = ?auto_17188 ?auto_17222 ) ) ( not ( = ?auto_17188 ?auto_17202 ) ) ( not ( = ?auto_17188 ?auto_17205 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17188 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17181 ) ) ( not ( = ?auto_17167 ?auto_17189 ) ) ( not ( = ?auto_17168 ?auto_17181 ) ) ( not ( = ?auto_17168 ?auto_17189 ) ) ( not ( = ?auto_17169 ?auto_17181 ) ) ( not ( = ?auto_17169 ?auto_17189 ) ) ( not ( = ?auto_17170 ?auto_17181 ) ) ( not ( = ?auto_17170 ?auto_17189 ) ) ( not ( = ?auto_17171 ?auto_17181 ) ) ( not ( = ?auto_17171 ?auto_17189 ) ) ( not ( = ?auto_17172 ?auto_17181 ) ) ( not ( = ?auto_17172 ?auto_17189 ) ) ( not ( = ?auto_17173 ?auto_17181 ) ) ( not ( = ?auto_17173 ?auto_17189 ) ) ( not ( = ?auto_17174 ?auto_17181 ) ) ( not ( = ?auto_17174 ?auto_17189 ) ) ( not ( = ?auto_17175 ?auto_17181 ) ) ( not ( = ?auto_17175 ?auto_17189 ) ) ( not ( = ?auto_17176 ?auto_17181 ) ) ( not ( = ?auto_17176 ?auto_17189 ) ) ( not ( = ?auto_17177 ?auto_17181 ) ) ( not ( = ?auto_17177 ?auto_17189 ) ) ( not ( = ?auto_17178 ?auto_17181 ) ) ( not ( = ?auto_17178 ?auto_17189 ) ) ( not ( = ?auto_17181 ?auto_17188 ) ) ( not ( = ?auto_17181 ?auto_17215 ) ) ( not ( = ?auto_17181 ?auto_17223 ) ) ( not ( = ?auto_17181 ?auto_17196 ) ) ( not ( = ?auto_17181 ?auto_17207 ) ) ( not ( = ?auto_17181 ?auto_17217 ) ) ( not ( = ?auto_17181 ?auto_17200 ) ) ( not ( = ?auto_17181 ?auto_17222 ) ) ( not ( = ?auto_17181 ?auto_17202 ) ) ( not ( = ?auto_17181 ?auto_17205 ) ) ( not ( = ?auto_17181 ?auto_17190 ) ) ( not ( = ?auto_17181 ?auto_17195 ) ) ( not ( = ?auto_17194 ?auto_17213 ) ) ( not ( = ?auto_17194 ?auto_17193 ) ) ( not ( = ?auto_17194 ?auto_17218 ) ) ( not ( = ?auto_17194 ?auto_17199 ) ) ( not ( = ?auto_17194 ?auto_17209 ) ) ( not ( = ?auto_17194 ?auto_17206 ) ) ( not ( = ?auto_17194 ?auto_17224 ) ) ( not ( = ?auto_17194 ?auto_17208 ) ) ( not ( = ?auto_17194 ?auto_17211 ) ) ( not ( = ?auto_17194 ?auto_17219 ) ) ( not ( = ?auto_17194 ?auto_17214 ) ) ( not ( = ?auto_17197 ?auto_17198 ) ) ( not ( = ?auto_17197 ?auto_17204 ) ) ( not ( = ?auto_17197 ?auto_17192 ) ) ( not ( = ?auto_17197 ?auto_17216 ) ) ( not ( = ?auto_17197 ?auto_17212 ) ) ( not ( = ?auto_17197 ?auto_17221 ) ) ( not ( = ?auto_17197 ?auto_17210 ) ) ( not ( = ?auto_17197 ?auto_17203 ) ) ( not ( = ?auto_17197 ?auto_17201 ) ) ( not ( = ?auto_17197 ?auto_17220 ) ) ( not ( = ?auto_17197 ?auto_17191 ) ) ( not ( = ?auto_17189 ?auto_17188 ) ) ( not ( = ?auto_17189 ?auto_17215 ) ) ( not ( = ?auto_17189 ?auto_17223 ) ) ( not ( = ?auto_17189 ?auto_17196 ) ) ( not ( = ?auto_17189 ?auto_17207 ) ) ( not ( = ?auto_17189 ?auto_17217 ) ) ( not ( = ?auto_17189 ?auto_17200 ) ) ( not ( = ?auto_17189 ?auto_17222 ) ) ( not ( = ?auto_17189 ?auto_17202 ) ) ( not ( = ?auto_17189 ?auto_17205 ) ) ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17195 ) ) ( not ( = ?auto_17167 ?auto_17180 ) ) ( not ( = ?auto_17167 ?auto_17185 ) ) ( not ( = ?auto_17168 ?auto_17180 ) ) ( not ( = ?auto_17168 ?auto_17185 ) ) ( not ( = ?auto_17169 ?auto_17180 ) ) ( not ( = ?auto_17169 ?auto_17185 ) ) ( not ( = ?auto_17170 ?auto_17180 ) ) ( not ( = ?auto_17170 ?auto_17185 ) ) ( not ( = ?auto_17171 ?auto_17180 ) ) ( not ( = ?auto_17171 ?auto_17185 ) ) ( not ( = ?auto_17172 ?auto_17180 ) ) ( not ( = ?auto_17172 ?auto_17185 ) ) ( not ( = ?auto_17173 ?auto_17180 ) ) ( not ( = ?auto_17173 ?auto_17185 ) ) ( not ( = ?auto_17174 ?auto_17180 ) ) ( not ( = ?auto_17174 ?auto_17185 ) ) ( not ( = ?auto_17175 ?auto_17180 ) ) ( not ( = ?auto_17175 ?auto_17185 ) ) ( not ( = ?auto_17176 ?auto_17180 ) ) ( not ( = ?auto_17176 ?auto_17185 ) ) ( not ( = ?auto_17177 ?auto_17180 ) ) ( not ( = ?auto_17177 ?auto_17185 ) ) ( not ( = ?auto_17178 ?auto_17180 ) ) ( not ( = ?auto_17178 ?auto_17185 ) ) ( not ( = ?auto_17179 ?auto_17180 ) ) ( not ( = ?auto_17179 ?auto_17185 ) ) ( not ( = ?auto_17180 ?auto_17189 ) ) ( not ( = ?auto_17180 ?auto_17188 ) ) ( not ( = ?auto_17180 ?auto_17215 ) ) ( not ( = ?auto_17180 ?auto_17223 ) ) ( not ( = ?auto_17180 ?auto_17196 ) ) ( not ( = ?auto_17180 ?auto_17207 ) ) ( not ( = ?auto_17180 ?auto_17217 ) ) ( not ( = ?auto_17180 ?auto_17200 ) ) ( not ( = ?auto_17180 ?auto_17222 ) ) ( not ( = ?auto_17180 ?auto_17202 ) ) ( not ( = ?auto_17180 ?auto_17205 ) ) ( not ( = ?auto_17180 ?auto_17190 ) ) ( not ( = ?auto_17180 ?auto_17195 ) ) ( not ( = ?auto_17183 ?auto_17194 ) ) ( not ( = ?auto_17183 ?auto_17213 ) ) ( not ( = ?auto_17183 ?auto_17193 ) ) ( not ( = ?auto_17183 ?auto_17218 ) ) ( not ( = ?auto_17183 ?auto_17199 ) ) ( not ( = ?auto_17183 ?auto_17209 ) ) ( not ( = ?auto_17183 ?auto_17206 ) ) ( not ( = ?auto_17183 ?auto_17224 ) ) ( not ( = ?auto_17183 ?auto_17208 ) ) ( not ( = ?auto_17183 ?auto_17211 ) ) ( not ( = ?auto_17183 ?auto_17219 ) ) ( not ( = ?auto_17183 ?auto_17214 ) ) ( not ( = ?auto_17182 ?auto_17197 ) ) ( not ( = ?auto_17182 ?auto_17198 ) ) ( not ( = ?auto_17182 ?auto_17204 ) ) ( not ( = ?auto_17182 ?auto_17192 ) ) ( not ( = ?auto_17182 ?auto_17216 ) ) ( not ( = ?auto_17182 ?auto_17212 ) ) ( not ( = ?auto_17182 ?auto_17221 ) ) ( not ( = ?auto_17182 ?auto_17210 ) ) ( not ( = ?auto_17182 ?auto_17203 ) ) ( not ( = ?auto_17182 ?auto_17201 ) ) ( not ( = ?auto_17182 ?auto_17220 ) ) ( not ( = ?auto_17182 ?auto_17191 ) ) ( not ( = ?auto_17185 ?auto_17189 ) ) ( not ( = ?auto_17185 ?auto_17188 ) ) ( not ( = ?auto_17185 ?auto_17215 ) ) ( not ( = ?auto_17185 ?auto_17223 ) ) ( not ( = ?auto_17185 ?auto_17196 ) ) ( not ( = ?auto_17185 ?auto_17207 ) ) ( not ( = ?auto_17185 ?auto_17217 ) ) ( not ( = ?auto_17185 ?auto_17200 ) ) ( not ( = ?auto_17185 ?auto_17222 ) ) ( not ( = ?auto_17185 ?auto_17202 ) ) ( not ( = ?auto_17185 ?auto_17205 ) ) ( not ( = ?auto_17185 ?auto_17190 ) ) ( not ( = ?auto_17185 ?auto_17195 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17167 ?auto_17168 ?auto_17169 ?auto_17170 ?auto_17171 ?auto_17172 ?auto_17173 ?auto_17174 ?auto_17175 ?auto_17176 ?auto_17177 ?auto_17178 ?auto_17179 ?auto_17181 )
      ( MAKE-1CRATE ?auto_17181 ?auto_17180 )
      ( MAKE-14CRATE-VERIFY ?auto_17167 ?auto_17168 ?auto_17169 ?auto_17170 ?auto_17171 ?auto_17172 ?auto_17173 ?auto_17174 ?auto_17175 ?auto_17176 ?auto_17177 ?auto_17178 ?auto_17179 ?auto_17181 ?auto_17180 ) )
  )

)

