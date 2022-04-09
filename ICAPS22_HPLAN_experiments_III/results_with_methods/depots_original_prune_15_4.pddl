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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021539 - SURFACE
      ?auto_2021540 - SURFACE
    )
    :vars
    (
      ?auto_2021541 - HOIST
      ?auto_2021542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021541 ?auto_2021542 ) ( SURFACE-AT ?auto_2021539 ?auto_2021542 ) ( CLEAR ?auto_2021539 ) ( LIFTING ?auto_2021541 ?auto_2021540 ) ( IS-CRATE ?auto_2021540 ) ( not ( = ?auto_2021539 ?auto_2021540 ) ) )
    :subtasks
    ( ( !DROP ?auto_2021541 ?auto_2021540 ?auto_2021539 ?auto_2021542 )
      ( MAKE-1CRATE-VERIFY ?auto_2021539 ?auto_2021540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021543 - SURFACE
      ?auto_2021544 - SURFACE
    )
    :vars
    (
      ?auto_2021545 - HOIST
      ?auto_2021546 - PLACE
      ?auto_2021547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021545 ?auto_2021546 ) ( SURFACE-AT ?auto_2021543 ?auto_2021546 ) ( CLEAR ?auto_2021543 ) ( IS-CRATE ?auto_2021544 ) ( not ( = ?auto_2021543 ?auto_2021544 ) ) ( TRUCK-AT ?auto_2021547 ?auto_2021546 ) ( AVAILABLE ?auto_2021545 ) ( IN ?auto_2021544 ?auto_2021547 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021545 ?auto_2021544 ?auto_2021547 ?auto_2021546 )
      ( MAKE-1CRATE ?auto_2021543 ?auto_2021544 )
      ( MAKE-1CRATE-VERIFY ?auto_2021543 ?auto_2021544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021548 - SURFACE
      ?auto_2021549 - SURFACE
    )
    :vars
    (
      ?auto_2021552 - HOIST
      ?auto_2021551 - PLACE
      ?auto_2021550 - TRUCK
      ?auto_2021553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021552 ?auto_2021551 ) ( SURFACE-AT ?auto_2021548 ?auto_2021551 ) ( CLEAR ?auto_2021548 ) ( IS-CRATE ?auto_2021549 ) ( not ( = ?auto_2021548 ?auto_2021549 ) ) ( AVAILABLE ?auto_2021552 ) ( IN ?auto_2021549 ?auto_2021550 ) ( TRUCK-AT ?auto_2021550 ?auto_2021553 ) ( not ( = ?auto_2021553 ?auto_2021551 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021550 ?auto_2021553 ?auto_2021551 )
      ( MAKE-1CRATE ?auto_2021548 ?auto_2021549 )
      ( MAKE-1CRATE-VERIFY ?auto_2021548 ?auto_2021549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021554 - SURFACE
      ?auto_2021555 - SURFACE
    )
    :vars
    (
      ?auto_2021556 - HOIST
      ?auto_2021558 - PLACE
      ?auto_2021557 - TRUCK
      ?auto_2021559 - PLACE
      ?auto_2021560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021556 ?auto_2021558 ) ( SURFACE-AT ?auto_2021554 ?auto_2021558 ) ( CLEAR ?auto_2021554 ) ( IS-CRATE ?auto_2021555 ) ( not ( = ?auto_2021554 ?auto_2021555 ) ) ( AVAILABLE ?auto_2021556 ) ( TRUCK-AT ?auto_2021557 ?auto_2021559 ) ( not ( = ?auto_2021559 ?auto_2021558 ) ) ( HOIST-AT ?auto_2021560 ?auto_2021559 ) ( LIFTING ?auto_2021560 ?auto_2021555 ) ( not ( = ?auto_2021556 ?auto_2021560 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021560 ?auto_2021555 ?auto_2021557 ?auto_2021559 )
      ( MAKE-1CRATE ?auto_2021554 ?auto_2021555 )
      ( MAKE-1CRATE-VERIFY ?auto_2021554 ?auto_2021555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021561 - SURFACE
      ?auto_2021562 - SURFACE
    )
    :vars
    (
      ?auto_2021565 - HOIST
      ?auto_2021563 - PLACE
      ?auto_2021567 - TRUCK
      ?auto_2021564 - PLACE
      ?auto_2021566 - HOIST
      ?auto_2021568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021565 ?auto_2021563 ) ( SURFACE-AT ?auto_2021561 ?auto_2021563 ) ( CLEAR ?auto_2021561 ) ( IS-CRATE ?auto_2021562 ) ( not ( = ?auto_2021561 ?auto_2021562 ) ) ( AVAILABLE ?auto_2021565 ) ( TRUCK-AT ?auto_2021567 ?auto_2021564 ) ( not ( = ?auto_2021564 ?auto_2021563 ) ) ( HOIST-AT ?auto_2021566 ?auto_2021564 ) ( not ( = ?auto_2021565 ?auto_2021566 ) ) ( AVAILABLE ?auto_2021566 ) ( SURFACE-AT ?auto_2021562 ?auto_2021564 ) ( ON ?auto_2021562 ?auto_2021568 ) ( CLEAR ?auto_2021562 ) ( not ( = ?auto_2021561 ?auto_2021568 ) ) ( not ( = ?auto_2021562 ?auto_2021568 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021566 ?auto_2021562 ?auto_2021568 ?auto_2021564 )
      ( MAKE-1CRATE ?auto_2021561 ?auto_2021562 )
      ( MAKE-1CRATE-VERIFY ?auto_2021561 ?auto_2021562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021569 - SURFACE
      ?auto_2021570 - SURFACE
    )
    :vars
    (
      ?auto_2021573 - HOIST
      ?auto_2021575 - PLACE
      ?auto_2021571 - PLACE
      ?auto_2021574 - HOIST
      ?auto_2021572 - SURFACE
      ?auto_2021576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021573 ?auto_2021575 ) ( SURFACE-AT ?auto_2021569 ?auto_2021575 ) ( CLEAR ?auto_2021569 ) ( IS-CRATE ?auto_2021570 ) ( not ( = ?auto_2021569 ?auto_2021570 ) ) ( AVAILABLE ?auto_2021573 ) ( not ( = ?auto_2021571 ?auto_2021575 ) ) ( HOIST-AT ?auto_2021574 ?auto_2021571 ) ( not ( = ?auto_2021573 ?auto_2021574 ) ) ( AVAILABLE ?auto_2021574 ) ( SURFACE-AT ?auto_2021570 ?auto_2021571 ) ( ON ?auto_2021570 ?auto_2021572 ) ( CLEAR ?auto_2021570 ) ( not ( = ?auto_2021569 ?auto_2021572 ) ) ( not ( = ?auto_2021570 ?auto_2021572 ) ) ( TRUCK-AT ?auto_2021576 ?auto_2021575 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021576 ?auto_2021575 ?auto_2021571 )
      ( MAKE-1CRATE ?auto_2021569 ?auto_2021570 )
      ( MAKE-1CRATE-VERIFY ?auto_2021569 ?auto_2021570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021586 - SURFACE
      ?auto_2021587 - SURFACE
      ?auto_2021588 - SURFACE
    )
    :vars
    (
      ?auto_2021589 - HOIST
      ?auto_2021590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021589 ?auto_2021590 ) ( SURFACE-AT ?auto_2021587 ?auto_2021590 ) ( CLEAR ?auto_2021587 ) ( LIFTING ?auto_2021589 ?auto_2021588 ) ( IS-CRATE ?auto_2021588 ) ( not ( = ?auto_2021587 ?auto_2021588 ) ) ( ON ?auto_2021587 ?auto_2021586 ) ( not ( = ?auto_2021586 ?auto_2021587 ) ) ( not ( = ?auto_2021586 ?auto_2021588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021587 ?auto_2021588 )
      ( MAKE-2CRATE-VERIFY ?auto_2021586 ?auto_2021587 ?auto_2021588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021596 - SURFACE
      ?auto_2021597 - SURFACE
      ?auto_2021598 - SURFACE
    )
    :vars
    (
      ?auto_2021599 - HOIST
      ?auto_2021601 - PLACE
      ?auto_2021600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021599 ?auto_2021601 ) ( SURFACE-AT ?auto_2021597 ?auto_2021601 ) ( CLEAR ?auto_2021597 ) ( IS-CRATE ?auto_2021598 ) ( not ( = ?auto_2021597 ?auto_2021598 ) ) ( TRUCK-AT ?auto_2021600 ?auto_2021601 ) ( AVAILABLE ?auto_2021599 ) ( IN ?auto_2021598 ?auto_2021600 ) ( ON ?auto_2021597 ?auto_2021596 ) ( not ( = ?auto_2021596 ?auto_2021597 ) ) ( not ( = ?auto_2021596 ?auto_2021598 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021597 ?auto_2021598 )
      ( MAKE-2CRATE-VERIFY ?auto_2021596 ?auto_2021597 ?auto_2021598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021602 - SURFACE
      ?auto_2021603 - SURFACE
    )
    :vars
    (
      ?auto_2021607 - HOIST
      ?auto_2021606 - PLACE
      ?auto_2021604 - TRUCK
      ?auto_2021605 - SURFACE
      ?auto_2021608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021607 ?auto_2021606 ) ( SURFACE-AT ?auto_2021602 ?auto_2021606 ) ( CLEAR ?auto_2021602 ) ( IS-CRATE ?auto_2021603 ) ( not ( = ?auto_2021602 ?auto_2021603 ) ) ( AVAILABLE ?auto_2021607 ) ( IN ?auto_2021603 ?auto_2021604 ) ( ON ?auto_2021602 ?auto_2021605 ) ( not ( = ?auto_2021605 ?auto_2021602 ) ) ( not ( = ?auto_2021605 ?auto_2021603 ) ) ( TRUCK-AT ?auto_2021604 ?auto_2021608 ) ( not ( = ?auto_2021608 ?auto_2021606 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021604 ?auto_2021608 ?auto_2021606 )
      ( MAKE-2CRATE ?auto_2021605 ?auto_2021602 ?auto_2021603 )
      ( MAKE-1CRATE-VERIFY ?auto_2021602 ?auto_2021603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021609 - SURFACE
      ?auto_2021610 - SURFACE
      ?auto_2021611 - SURFACE
    )
    :vars
    (
      ?auto_2021612 - HOIST
      ?auto_2021614 - PLACE
      ?auto_2021615 - TRUCK
      ?auto_2021613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021612 ?auto_2021614 ) ( SURFACE-AT ?auto_2021610 ?auto_2021614 ) ( CLEAR ?auto_2021610 ) ( IS-CRATE ?auto_2021611 ) ( not ( = ?auto_2021610 ?auto_2021611 ) ) ( AVAILABLE ?auto_2021612 ) ( IN ?auto_2021611 ?auto_2021615 ) ( ON ?auto_2021610 ?auto_2021609 ) ( not ( = ?auto_2021609 ?auto_2021610 ) ) ( not ( = ?auto_2021609 ?auto_2021611 ) ) ( TRUCK-AT ?auto_2021615 ?auto_2021613 ) ( not ( = ?auto_2021613 ?auto_2021614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021610 ?auto_2021611 )
      ( MAKE-2CRATE-VERIFY ?auto_2021609 ?auto_2021610 ?auto_2021611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021616 - SURFACE
      ?auto_2021617 - SURFACE
    )
    :vars
    (
      ?auto_2021621 - HOIST
      ?auto_2021619 - PLACE
      ?auto_2021618 - SURFACE
      ?auto_2021620 - TRUCK
      ?auto_2021622 - PLACE
      ?auto_2021623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021621 ?auto_2021619 ) ( SURFACE-AT ?auto_2021616 ?auto_2021619 ) ( CLEAR ?auto_2021616 ) ( IS-CRATE ?auto_2021617 ) ( not ( = ?auto_2021616 ?auto_2021617 ) ) ( AVAILABLE ?auto_2021621 ) ( ON ?auto_2021616 ?auto_2021618 ) ( not ( = ?auto_2021618 ?auto_2021616 ) ) ( not ( = ?auto_2021618 ?auto_2021617 ) ) ( TRUCK-AT ?auto_2021620 ?auto_2021622 ) ( not ( = ?auto_2021622 ?auto_2021619 ) ) ( HOIST-AT ?auto_2021623 ?auto_2021622 ) ( LIFTING ?auto_2021623 ?auto_2021617 ) ( not ( = ?auto_2021621 ?auto_2021623 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021623 ?auto_2021617 ?auto_2021620 ?auto_2021622 )
      ( MAKE-2CRATE ?auto_2021618 ?auto_2021616 ?auto_2021617 )
      ( MAKE-1CRATE-VERIFY ?auto_2021616 ?auto_2021617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021624 - SURFACE
      ?auto_2021625 - SURFACE
      ?auto_2021626 - SURFACE
    )
    :vars
    (
      ?auto_2021628 - HOIST
      ?auto_2021630 - PLACE
      ?auto_2021631 - TRUCK
      ?auto_2021627 - PLACE
      ?auto_2021629 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021628 ?auto_2021630 ) ( SURFACE-AT ?auto_2021625 ?auto_2021630 ) ( CLEAR ?auto_2021625 ) ( IS-CRATE ?auto_2021626 ) ( not ( = ?auto_2021625 ?auto_2021626 ) ) ( AVAILABLE ?auto_2021628 ) ( ON ?auto_2021625 ?auto_2021624 ) ( not ( = ?auto_2021624 ?auto_2021625 ) ) ( not ( = ?auto_2021624 ?auto_2021626 ) ) ( TRUCK-AT ?auto_2021631 ?auto_2021627 ) ( not ( = ?auto_2021627 ?auto_2021630 ) ) ( HOIST-AT ?auto_2021629 ?auto_2021627 ) ( LIFTING ?auto_2021629 ?auto_2021626 ) ( not ( = ?auto_2021628 ?auto_2021629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021625 ?auto_2021626 )
      ( MAKE-2CRATE-VERIFY ?auto_2021624 ?auto_2021625 ?auto_2021626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021632 - SURFACE
      ?auto_2021633 - SURFACE
    )
    :vars
    (
      ?auto_2021635 - HOIST
      ?auto_2021634 - PLACE
      ?auto_2021639 - SURFACE
      ?auto_2021637 - TRUCK
      ?auto_2021638 - PLACE
      ?auto_2021636 - HOIST
      ?auto_2021640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021635 ?auto_2021634 ) ( SURFACE-AT ?auto_2021632 ?auto_2021634 ) ( CLEAR ?auto_2021632 ) ( IS-CRATE ?auto_2021633 ) ( not ( = ?auto_2021632 ?auto_2021633 ) ) ( AVAILABLE ?auto_2021635 ) ( ON ?auto_2021632 ?auto_2021639 ) ( not ( = ?auto_2021639 ?auto_2021632 ) ) ( not ( = ?auto_2021639 ?auto_2021633 ) ) ( TRUCK-AT ?auto_2021637 ?auto_2021638 ) ( not ( = ?auto_2021638 ?auto_2021634 ) ) ( HOIST-AT ?auto_2021636 ?auto_2021638 ) ( not ( = ?auto_2021635 ?auto_2021636 ) ) ( AVAILABLE ?auto_2021636 ) ( SURFACE-AT ?auto_2021633 ?auto_2021638 ) ( ON ?auto_2021633 ?auto_2021640 ) ( CLEAR ?auto_2021633 ) ( not ( = ?auto_2021632 ?auto_2021640 ) ) ( not ( = ?auto_2021633 ?auto_2021640 ) ) ( not ( = ?auto_2021639 ?auto_2021640 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021636 ?auto_2021633 ?auto_2021640 ?auto_2021638 )
      ( MAKE-2CRATE ?auto_2021639 ?auto_2021632 ?auto_2021633 )
      ( MAKE-1CRATE-VERIFY ?auto_2021632 ?auto_2021633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021641 - SURFACE
      ?auto_2021642 - SURFACE
      ?auto_2021643 - SURFACE
    )
    :vars
    (
      ?auto_2021649 - HOIST
      ?auto_2021644 - PLACE
      ?auto_2021648 - TRUCK
      ?auto_2021646 - PLACE
      ?auto_2021647 - HOIST
      ?auto_2021645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021649 ?auto_2021644 ) ( SURFACE-AT ?auto_2021642 ?auto_2021644 ) ( CLEAR ?auto_2021642 ) ( IS-CRATE ?auto_2021643 ) ( not ( = ?auto_2021642 ?auto_2021643 ) ) ( AVAILABLE ?auto_2021649 ) ( ON ?auto_2021642 ?auto_2021641 ) ( not ( = ?auto_2021641 ?auto_2021642 ) ) ( not ( = ?auto_2021641 ?auto_2021643 ) ) ( TRUCK-AT ?auto_2021648 ?auto_2021646 ) ( not ( = ?auto_2021646 ?auto_2021644 ) ) ( HOIST-AT ?auto_2021647 ?auto_2021646 ) ( not ( = ?auto_2021649 ?auto_2021647 ) ) ( AVAILABLE ?auto_2021647 ) ( SURFACE-AT ?auto_2021643 ?auto_2021646 ) ( ON ?auto_2021643 ?auto_2021645 ) ( CLEAR ?auto_2021643 ) ( not ( = ?auto_2021642 ?auto_2021645 ) ) ( not ( = ?auto_2021643 ?auto_2021645 ) ) ( not ( = ?auto_2021641 ?auto_2021645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021642 ?auto_2021643 )
      ( MAKE-2CRATE-VERIFY ?auto_2021641 ?auto_2021642 ?auto_2021643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021650 - SURFACE
      ?auto_2021651 - SURFACE
    )
    :vars
    (
      ?auto_2021655 - HOIST
      ?auto_2021653 - PLACE
      ?auto_2021654 - SURFACE
      ?auto_2021658 - PLACE
      ?auto_2021657 - HOIST
      ?auto_2021656 - SURFACE
      ?auto_2021652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021655 ?auto_2021653 ) ( SURFACE-AT ?auto_2021650 ?auto_2021653 ) ( CLEAR ?auto_2021650 ) ( IS-CRATE ?auto_2021651 ) ( not ( = ?auto_2021650 ?auto_2021651 ) ) ( AVAILABLE ?auto_2021655 ) ( ON ?auto_2021650 ?auto_2021654 ) ( not ( = ?auto_2021654 ?auto_2021650 ) ) ( not ( = ?auto_2021654 ?auto_2021651 ) ) ( not ( = ?auto_2021658 ?auto_2021653 ) ) ( HOIST-AT ?auto_2021657 ?auto_2021658 ) ( not ( = ?auto_2021655 ?auto_2021657 ) ) ( AVAILABLE ?auto_2021657 ) ( SURFACE-AT ?auto_2021651 ?auto_2021658 ) ( ON ?auto_2021651 ?auto_2021656 ) ( CLEAR ?auto_2021651 ) ( not ( = ?auto_2021650 ?auto_2021656 ) ) ( not ( = ?auto_2021651 ?auto_2021656 ) ) ( not ( = ?auto_2021654 ?auto_2021656 ) ) ( TRUCK-AT ?auto_2021652 ?auto_2021653 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021652 ?auto_2021653 ?auto_2021658 )
      ( MAKE-2CRATE ?auto_2021654 ?auto_2021650 ?auto_2021651 )
      ( MAKE-1CRATE-VERIFY ?auto_2021650 ?auto_2021651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021659 - SURFACE
      ?auto_2021660 - SURFACE
      ?auto_2021661 - SURFACE
    )
    :vars
    (
      ?auto_2021667 - HOIST
      ?auto_2021666 - PLACE
      ?auto_2021662 - PLACE
      ?auto_2021665 - HOIST
      ?auto_2021663 - SURFACE
      ?auto_2021664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021667 ?auto_2021666 ) ( SURFACE-AT ?auto_2021660 ?auto_2021666 ) ( CLEAR ?auto_2021660 ) ( IS-CRATE ?auto_2021661 ) ( not ( = ?auto_2021660 ?auto_2021661 ) ) ( AVAILABLE ?auto_2021667 ) ( ON ?auto_2021660 ?auto_2021659 ) ( not ( = ?auto_2021659 ?auto_2021660 ) ) ( not ( = ?auto_2021659 ?auto_2021661 ) ) ( not ( = ?auto_2021662 ?auto_2021666 ) ) ( HOIST-AT ?auto_2021665 ?auto_2021662 ) ( not ( = ?auto_2021667 ?auto_2021665 ) ) ( AVAILABLE ?auto_2021665 ) ( SURFACE-AT ?auto_2021661 ?auto_2021662 ) ( ON ?auto_2021661 ?auto_2021663 ) ( CLEAR ?auto_2021661 ) ( not ( = ?auto_2021660 ?auto_2021663 ) ) ( not ( = ?auto_2021661 ?auto_2021663 ) ) ( not ( = ?auto_2021659 ?auto_2021663 ) ) ( TRUCK-AT ?auto_2021664 ?auto_2021666 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021660 ?auto_2021661 )
      ( MAKE-2CRATE-VERIFY ?auto_2021659 ?auto_2021660 ?auto_2021661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021668 - SURFACE
      ?auto_2021669 - SURFACE
    )
    :vars
    (
      ?auto_2021671 - HOIST
      ?auto_2021674 - PLACE
      ?auto_2021676 - SURFACE
      ?auto_2021672 - PLACE
      ?auto_2021673 - HOIST
      ?auto_2021675 - SURFACE
      ?auto_2021670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021671 ?auto_2021674 ) ( IS-CRATE ?auto_2021669 ) ( not ( = ?auto_2021668 ?auto_2021669 ) ) ( not ( = ?auto_2021676 ?auto_2021668 ) ) ( not ( = ?auto_2021676 ?auto_2021669 ) ) ( not ( = ?auto_2021672 ?auto_2021674 ) ) ( HOIST-AT ?auto_2021673 ?auto_2021672 ) ( not ( = ?auto_2021671 ?auto_2021673 ) ) ( AVAILABLE ?auto_2021673 ) ( SURFACE-AT ?auto_2021669 ?auto_2021672 ) ( ON ?auto_2021669 ?auto_2021675 ) ( CLEAR ?auto_2021669 ) ( not ( = ?auto_2021668 ?auto_2021675 ) ) ( not ( = ?auto_2021669 ?auto_2021675 ) ) ( not ( = ?auto_2021676 ?auto_2021675 ) ) ( TRUCK-AT ?auto_2021670 ?auto_2021674 ) ( SURFACE-AT ?auto_2021676 ?auto_2021674 ) ( CLEAR ?auto_2021676 ) ( LIFTING ?auto_2021671 ?auto_2021668 ) ( IS-CRATE ?auto_2021668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021676 ?auto_2021668 )
      ( MAKE-2CRATE ?auto_2021676 ?auto_2021668 ?auto_2021669 )
      ( MAKE-1CRATE-VERIFY ?auto_2021668 ?auto_2021669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021677 - SURFACE
      ?auto_2021678 - SURFACE
      ?auto_2021679 - SURFACE
    )
    :vars
    (
      ?auto_2021683 - HOIST
      ?auto_2021680 - PLACE
      ?auto_2021682 - PLACE
      ?auto_2021684 - HOIST
      ?auto_2021685 - SURFACE
      ?auto_2021681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021683 ?auto_2021680 ) ( IS-CRATE ?auto_2021679 ) ( not ( = ?auto_2021678 ?auto_2021679 ) ) ( not ( = ?auto_2021677 ?auto_2021678 ) ) ( not ( = ?auto_2021677 ?auto_2021679 ) ) ( not ( = ?auto_2021682 ?auto_2021680 ) ) ( HOIST-AT ?auto_2021684 ?auto_2021682 ) ( not ( = ?auto_2021683 ?auto_2021684 ) ) ( AVAILABLE ?auto_2021684 ) ( SURFACE-AT ?auto_2021679 ?auto_2021682 ) ( ON ?auto_2021679 ?auto_2021685 ) ( CLEAR ?auto_2021679 ) ( not ( = ?auto_2021678 ?auto_2021685 ) ) ( not ( = ?auto_2021679 ?auto_2021685 ) ) ( not ( = ?auto_2021677 ?auto_2021685 ) ) ( TRUCK-AT ?auto_2021681 ?auto_2021680 ) ( SURFACE-AT ?auto_2021677 ?auto_2021680 ) ( CLEAR ?auto_2021677 ) ( LIFTING ?auto_2021683 ?auto_2021678 ) ( IS-CRATE ?auto_2021678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021678 ?auto_2021679 )
      ( MAKE-2CRATE-VERIFY ?auto_2021677 ?auto_2021678 ?auto_2021679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021686 - SURFACE
      ?auto_2021687 - SURFACE
    )
    :vars
    (
      ?auto_2021691 - HOIST
      ?auto_2021689 - PLACE
      ?auto_2021693 - SURFACE
      ?auto_2021694 - PLACE
      ?auto_2021690 - HOIST
      ?auto_2021692 - SURFACE
      ?auto_2021688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021691 ?auto_2021689 ) ( IS-CRATE ?auto_2021687 ) ( not ( = ?auto_2021686 ?auto_2021687 ) ) ( not ( = ?auto_2021693 ?auto_2021686 ) ) ( not ( = ?auto_2021693 ?auto_2021687 ) ) ( not ( = ?auto_2021694 ?auto_2021689 ) ) ( HOIST-AT ?auto_2021690 ?auto_2021694 ) ( not ( = ?auto_2021691 ?auto_2021690 ) ) ( AVAILABLE ?auto_2021690 ) ( SURFACE-AT ?auto_2021687 ?auto_2021694 ) ( ON ?auto_2021687 ?auto_2021692 ) ( CLEAR ?auto_2021687 ) ( not ( = ?auto_2021686 ?auto_2021692 ) ) ( not ( = ?auto_2021687 ?auto_2021692 ) ) ( not ( = ?auto_2021693 ?auto_2021692 ) ) ( TRUCK-AT ?auto_2021688 ?auto_2021689 ) ( SURFACE-AT ?auto_2021693 ?auto_2021689 ) ( CLEAR ?auto_2021693 ) ( IS-CRATE ?auto_2021686 ) ( AVAILABLE ?auto_2021691 ) ( IN ?auto_2021686 ?auto_2021688 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021691 ?auto_2021686 ?auto_2021688 ?auto_2021689 )
      ( MAKE-2CRATE ?auto_2021693 ?auto_2021686 ?auto_2021687 )
      ( MAKE-1CRATE-VERIFY ?auto_2021686 ?auto_2021687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021695 - SURFACE
      ?auto_2021696 - SURFACE
      ?auto_2021697 - SURFACE
    )
    :vars
    (
      ?auto_2021699 - HOIST
      ?auto_2021703 - PLACE
      ?auto_2021702 - PLACE
      ?auto_2021698 - HOIST
      ?auto_2021701 - SURFACE
      ?auto_2021700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021699 ?auto_2021703 ) ( IS-CRATE ?auto_2021697 ) ( not ( = ?auto_2021696 ?auto_2021697 ) ) ( not ( = ?auto_2021695 ?auto_2021696 ) ) ( not ( = ?auto_2021695 ?auto_2021697 ) ) ( not ( = ?auto_2021702 ?auto_2021703 ) ) ( HOIST-AT ?auto_2021698 ?auto_2021702 ) ( not ( = ?auto_2021699 ?auto_2021698 ) ) ( AVAILABLE ?auto_2021698 ) ( SURFACE-AT ?auto_2021697 ?auto_2021702 ) ( ON ?auto_2021697 ?auto_2021701 ) ( CLEAR ?auto_2021697 ) ( not ( = ?auto_2021696 ?auto_2021701 ) ) ( not ( = ?auto_2021697 ?auto_2021701 ) ) ( not ( = ?auto_2021695 ?auto_2021701 ) ) ( TRUCK-AT ?auto_2021700 ?auto_2021703 ) ( SURFACE-AT ?auto_2021695 ?auto_2021703 ) ( CLEAR ?auto_2021695 ) ( IS-CRATE ?auto_2021696 ) ( AVAILABLE ?auto_2021699 ) ( IN ?auto_2021696 ?auto_2021700 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021696 ?auto_2021697 )
      ( MAKE-2CRATE-VERIFY ?auto_2021695 ?auto_2021696 ?auto_2021697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021740 - SURFACE
      ?auto_2021741 - SURFACE
    )
    :vars
    (
      ?auto_2021748 - HOIST
      ?auto_2021744 - PLACE
      ?auto_2021743 - SURFACE
      ?auto_2021747 - PLACE
      ?auto_2021742 - HOIST
      ?auto_2021746 - SURFACE
      ?auto_2021745 - TRUCK
      ?auto_2021749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021748 ?auto_2021744 ) ( SURFACE-AT ?auto_2021740 ?auto_2021744 ) ( CLEAR ?auto_2021740 ) ( IS-CRATE ?auto_2021741 ) ( not ( = ?auto_2021740 ?auto_2021741 ) ) ( AVAILABLE ?auto_2021748 ) ( ON ?auto_2021740 ?auto_2021743 ) ( not ( = ?auto_2021743 ?auto_2021740 ) ) ( not ( = ?auto_2021743 ?auto_2021741 ) ) ( not ( = ?auto_2021747 ?auto_2021744 ) ) ( HOIST-AT ?auto_2021742 ?auto_2021747 ) ( not ( = ?auto_2021748 ?auto_2021742 ) ) ( AVAILABLE ?auto_2021742 ) ( SURFACE-AT ?auto_2021741 ?auto_2021747 ) ( ON ?auto_2021741 ?auto_2021746 ) ( CLEAR ?auto_2021741 ) ( not ( = ?auto_2021740 ?auto_2021746 ) ) ( not ( = ?auto_2021741 ?auto_2021746 ) ) ( not ( = ?auto_2021743 ?auto_2021746 ) ) ( TRUCK-AT ?auto_2021745 ?auto_2021749 ) ( not ( = ?auto_2021749 ?auto_2021744 ) ) ( not ( = ?auto_2021747 ?auto_2021749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021745 ?auto_2021749 ?auto_2021744 )
      ( MAKE-1CRATE ?auto_2021740 ?auto_2021741 )
      ( MAKE-1CRATE-VERIFY ?auto_2021740 ?auto_2021741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021779 - SURFACE
      ?auto_2021780 - SURFACE
      ?auto_2021781 - SURFACE
      ?auto_2021782 - SURFACE
    )
    :vars
    (
      ?auto_2021784 - HOIST
      ?auto_2021783 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021784 ?auto_2021783 ) ( SURFACE-AT ?auto_2021781 ?auto_2021783 ) ( CLEAR ?auto_2021781 ) ( LIFTING ?auto_2021784 ?auto_2021782 ) ( IS-CRATE ?auto_2021782 ) ( not ( = ?auto_2021781 ?auto_2021782 ) ) ( ON ?auto_2021780 ?auto_2021779 ) ( ON ?auto_2021781 ?auto_2021780 ) ( not ( = ?auto_2021779 ?auto_2021780 ) ) ( not ( = ?auto_2021779 ?auto_2021781 ) ) ( not ( = ?auto_2021779 ?auto_2021782 ) ) ( not ( = ?auto_2021780 ?auto_2021781 ) ) ( not ( = ?auto_2021780 ?auto_2021782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021781 ?auto_2021782 )
      ( MAKE-3CRATE-VERIFY ?auto_2021779 ?auto_2021780 ?auto_2021781 ?auto_2021782 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021796 - SURFACE
      ?auto_2021797 - SURFACE
      ?auto_2021798 - SURFACE
      ?auto_2021799 - SURFACE
    )
    :vars
    (
      ?auto_2021801 - HOIST
      ?auto_2021802 - PLACE
      ?auto_2021800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021801 ?auto_2021802 ) ( SURFACE-AT ?auto_2021798 ?auto_2021802 ) ( CLEAR ?auto_2021798 ) ( IS-CRATE ?auto_2021799 ) ( not ( = ?auto_2021798 ?auto_2021799 ) ) ( TRUCK-AT ?auto_2021800 ?auto_2021802 ) ( AVAILABLE ?auto_2021801 ) ( IN ?auto_2021799 ?auto_2021800 ) ( ON ?auto_2021798 ?auto_2021797 ) ( not ( = ?auto_2021797 ?auto_2021798 ) ) ( not ( = ?auto_2021797 ?auto_2021799 ) ) ( ON ?auto_2021797 ?auto_2021796 ) ( not ( = ?auto_2021796 ?auto_2021797 ) ) ( not ( = ?auto_2021796 ?auto_2021798 ) ) ( not ( = ?auto_2021796 ?auto_2021799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021797 ?auto_2021798 ?auto_2021799 )
      ( MAKE-3CRATE-VERIFY ?auto_2021796 ?auto_2021797 ?auto_2021798 ?auto_2021799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021817 - SURFACE
      ?auto_2021818 - SURFACE
      ?auto_2021819 - SURFACE
      ?auto_2021820 - SURFACE
    )
    :vars
    (
      ?auto_2021822 - HOIST
      ?auto_2021823 - PLACE
      ?auto_2021824 - TRUCK
      ?auto_2021821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021822 ?auto_2021823 ) ( SURFACE-AT ?auto_2021819 ?auto_2021823 ) ( CLEAR ?auto_2021819 ) ( IS-CRATE ?auto_2021820 ) ( not ( = ?auto_2021819 ?auto_2021820 ) ) ( AVAILABLE ?auto_2021822 ) ( IN ?auto_2021820 ?auto_2021824 ) ( ON ?auto_2021819 ?auto_2021818 ) ( not ( = ?auto_2021818 ?auto_2021819 ) ) ( not ( = ?auto_2021818 ?auto_2021820 ) ) ( TRUCK-AT ?auto_2021824 ?auto_2021821 ) ( not ( = ?auto_2021821 ?auto_2021823 ) ) ( ON ?auto_2021818 ?auto_2021817 ) ( not ( = ?auto_2021817 ?auto_2021818 ) ) ( not ( = ?auto_2021817 ?auto_2021819 ) ) ( not ( = ?auto_2021817 ?auto_2021820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021818 ?auto_2021819 ?auto_2021820 )
      ( MAKE-3CRATE-VERIFY ?auto_2021817 ?auto_2021818 ?auto_2021819 ?auto_2021820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021841 - SURFACE
      ?auto_2021842 - SURFACE
      ?auto_2021843 - SURFACE
      ?auto_2021844 - SURFACE
    )
    :vars
    (
      ?auto_2021846 - HOIST
      ?auto_2021849 - PLACE
      ?auto_2021848 - TRUCK
      ?auto_2021845 - PLACE
      ?auto_2021847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021846 ?auto_2021849 ) ( SURFACE-AT ?auto_2021843 ?auto_2021849 ) ( CLEAR ?auto_2021843 ) ( IS-CRATE ?auto_2021844 ) ( not ( = ?auto_2021843 ?auto_2021844 ) ) ( AVAILABLE ?auto_2021846 ) ( ON ?auto_2021843 ?auto_2021842 ) ( not ( = ?auto_2021842 ?auto_2021843 ) ) ( not ( = ?auto_2021842 ?auto_2021844 ) ) ( TRUCK-AT ?auto_2021848 ?auto_2021845 ) ( not ( = ?auto_2021845 ?auto_2021849 ) ) ( HOIST-AT ?auto_2021847 ?auto_2021845 ) ( LIFTING ?auto_2021847 ?auto_2021844 ) ( not ( = ?auto_2021846 ?auto_2021847 ) ) ( ON ?auto_2021842 ?auto_2021841 ) ( not ( = ?auto_2021841 ?auto_2021842 ) ) ( not ( = ?auto_2021841 ?auto_2021843 ) ) ( not ( = ?auto_2021841 ?auto_2021844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021842 ?auto_2021843 ?auto_2021844 )
      ( MAKE-3CRATE-VERIFY ?auto_2021841 ?auto_2021842 ?auto_2021843 ?auto_2021844 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021868 - SURFACE
      ?auto_2021869 - SURFACE
      ?auto_2021870 - SURFACE
      ?auto_2021871 - SURFACE
    )
    :vars
    (
      ?auto_2021877 - HOIST
      ?auto_2021875 - PLACE
      ?auto_2021873 - TRUCK
      ?auto_2021876 - PLACE
      ?auto_2021872 - HOIST
      ?auto_2021874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021877 ?auto_2021875 ) ( SURFACE-AT ?auto_2021870 ?auto_2021875 ) ( CLEAR ?auto_2021870 ) ( IS-CRATE ?auto_2021871 ) ( not ( = ?auto_2021870 ?auto_2021871 ) ) ( AVAILABLE ?auto_2021877 ) ( ON ?auto_2021870 ?auto_2021869 ) ( not ( = ?auto_2021869 ?auto_2021870 ) ) ( not ( = ?auto_2021869 ?auto_2021871 ) ) ( TRUCK-AT ?auto_2021873 ?auto_2021876 ) ( not ( = ?auto_2021876 ?auto_2021875 ) ) ( HOIST-AT ?auto_2021872 ?auto_2021876 ) ( not ( = ?auto_2021877 ?auto_2021872 ) ) ( AVAILABLE ?auto_2021872 ) ( SURFACE-AT ?auto_2021871 ?auto_2021876 ) ( ON ?auto_2021871 ?auto_2021874 ) ( CLEAR ?auto_2021871 ) ( not ( = ?auto_2021870 ?auto_2021874 ) ) ( not ( = ?auto_2021871 ?auto_2021874 ) ) ( not ( = ?auto_2021869 ?auto_2021874 ) ) ( ON ?auto_2021869 ?auto_2021868 ) ( not ( = ?auto_2021868 ?auto_2021869 ) ) ( not ( = ?auto_2021868 ?auto_2021870 ) ) ( not ( = ?auto_2021868 ?auto_2021871 ) ) ( not ( = ?auto_2021868 ?auto_2021874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021869 ?auto_2021870 ?auto_2021871 )
      ( MAKE-3CRATE-VERIFY ?auto_2021868 ?auto_2021869 ?auto_2021870 ?auto_2021871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021896 - SURFACE
      ?auto_2021897 - SURFACE
      ?auto_2021898 - SURFACE
      ?auto_2021899 - SURFACE
    )
    :vars
    (
      ?auto_2021903 - HOIST
      ?auto_2021902 - PLACE
      ?auto_2021904 - PLACE
      ?auto_2021900 - HOIST
      ?auto_2021905 - SURFACE
      ?auto_2021901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021903 ?auto_2021902 ) ( SURFACE-AT ?auto_2021898 ?auto_2021902 ) ( CLEAR ?auto_2021898 ) ( IS-CRATE ?auto_2021899 ) ( not ( = ?auto_2021898 ?auto_2021899 ) ) ( AVAILABLE ?auto_2021903 ) ( ON ?auto_2021898 ?auto_2021897 ) ( not ( = ?auto_2021897 ?auto_2021898 ) ) ( not ( = ?auto_2021897 ?auto_2021899 ) ) ( not ( = ?auto_2021904 ?auto_2021902 ) ) ( HOIST-AT ?auto_2021900 ?auto_2021904 ) ( not ( = ?auto_2021903 ?auto_2021900 ) ) ( AVAILABLE ?auto_2021900 ) ( SURFACE-AT ?auto_2021899 ?auto_2021904 ) ( ON ?auto_2021899 ?auto_2021905 ) ( CLEAR ?auto_2021899 ) ( not ( = ?auto_2021898 ?auto_2021905 ) ) ( not ( = ?auto_2021899 ?auto_2021905 ) ) ( not ( = ?auto_2021897 ?auto_2021905 ) ) ( TRUCK-AT ?auto_2021901 ?auto_2021902 ) ( ON ?auto_2021897 ?auto_2021896 ) ( not ( = ?auto_2021896 ?auto_2021897 ) ) ( not ( = ?auto_2021896 ?auto_2021898 ) ) ( not ( = ?auto_2021896 ?auto_2021899 ) ) ( not ( = ?auto_2021896 ?auto_2021905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021897 ?auto_2021898 ?auto_2021899 )
      ( MAKE-3CRATE-VERIFY ?auto_2021896 ?auto_2021897 ?auto_2021898 ?auto_2021899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021924 - SURFACE
      ?auto_2021925 - SURFACE
      ?auto_2021926 - SURFACE
      ?auto_2021927 - SURFACE
    )
    :vars
    (
      ?auto_2021929 - HOIST
      ?auto_2021928 - PLACE
      ?auto_2021931 - PLACE
      ?auto_2021933 - HOIST
      ?auto_2021932 - SURFACE
      ?auto_2021930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021929 ?auto_2021928 ) ( IS-CRATE ?auto_2021927 ) ( not ( = ?auto_2021926 ?auto_2021927 ) ) ( not ( = ?auto_2021925 ?auto_2021926 ) ) ( not ( = ?auto_2021925 ?auto_2021927 ) ) ( not ( = ?auto_2021931 ?auto_2021928 ) ) ( HOIST-AT ?auto_2021933 ?auto_2021931 ) ( not ( = ?auto_2021929 ?auto_2021933 ) ) ( AVAILABLE ?auto_2021933 ) ( SURFACE-AT ?auto_2021927 ?auto_2021931 ) ( ON ?auto_2021927 ?auto_2021932 ) ( CLEAR ?auto_2021927 ) ( not ( = ?auto_2021926 ?auto_2021932 ) ) ( not ( = ?auto_2021927 ?auto_2021932 ) ) ( not ( = ?auto_2021925 ?auto_2021932 ) ) ( TRUCK-AT ?auto_2021930 ?auto_2021928 ) ( SURFACE-AT ?auto_2021925 ?auto_2021928 ) ( CLEAR ?auto_2021925 ) ( LIFTING ?auto_2021929 ?auto_2021926 ) ( IS-CRATE ?auto_2021926 ) ( ON ?auto_2021925 ?auto_2021924 ) ( not ( = ?auto_2021924 ?auto_2021925 ) ) ( not ( = ?auto_2021924 ?auto_2021926 ) ) ( not ( = ?auto_2021924 ?auto_2021927 ) ) ( not ( = ?auto_2021924 ?auto_2021932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021925 ?auto_2021926 ?auto_2021927 )
      ( MAKE-3CRATE-VERIFY ?auto_2021924 ?auto_2021925 ?auto_2021926 ?auto_2021927 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2021952 - SURFACE
      ?auto_2021953 - SURFACE
      ?auto_2021954 - SURFACE
      ?auto_2021955 - SURFACE
    )
    :vars
    (
      ?auto_2021956 - HOIST
      ?auto_2021957 - PLACE
      ?auto_2021961 - PLACE
      ?auto_2021960 - HOIST
      ?auto_2021958 - SURFACE
      ?auto_2021959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021956 ?auto_2021957 ) ( IS-CRATE ?auto_2021955 ) ( not ( = ?auto_2021954 ?auto_2021955 ) ) ( not ( = ?auto_2021953 ?auto_2021954 ) ) ( not ( = ?auto_2021953 ?auto_2021955 ) ) ( not ( = ?auto_2021961 ?auto_2021957 ) ) ( HOIST-AT ?auto_2021960 ?auto_2021961 ) ( not ( = ?auto_2021956 ?auto_2021960 ) ) ( AVAILABLE ?auto_2021960 ) ( SURFACE-AT ?auto_2021955 ?auto_2021961 ) ( ON ?auto_2021955 ?auto_2021958 ) ( CLEAR ?auto_2021955 ) ( not ( = ?auto_2021954 ?auto_2021958 ) ) ( not ( = ?auto_2021955 ?auto_2021958 ) ) ( not ( = ?auto_2021953 ?auto_2021958 ) ) ( TRUCK-AT ?auto_2021959 ?auto_2021957 ) ( SURFACE-AT ?auto_2021953 ?auto_2021957 ) ( CLEAR ?auto_2021953 ) ( IS-CRATE ?auto_2021954 ) ( AVAILABLE ?auto_2021956 ) ( IN ?auto_2021954 ?auto_2021959 ) ( ON ?auto_2021953 ?auto_2021952 ) ( not ( = ?auto_2021952 ?auto_2021953 ) ) ( not ( = ?auto_2021952 ?auto_2021954 ) ) ( not ( = ?auto_2021952 ?auto_2021955 ) ) ( not ( = ?auto_2021952 ?auto_2021958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2021953 ?auto_2021954 ?auto_2021955 )
      ( MAKE-3CRATE-VERIFY ?auto_2021952 ?auto_2021953 ?auto_2021954 ?auto_2021955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022243 - SURFACE
      ?auto_2022244 - SURFACE
      ?auto_2022245 - SURFACE
      ?auto_2022246 - SURFACE
      ?auto_2022247 - SURFACE
    )
    :vars
    (
      ?auto_2022249 - HOIST
      ?auto_2022248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022249 ?auto_2022248 ) ( SURFACE-AT ?auto_2022246 ?auto_2022248 ) ( CLEAR ?auto_2022246 ) ( LIFTING ?auto_2022249 ?auto_2022247 ) ( IS-CRATE ?auto_2022247 ) ( not ( = ?auto_2022246 ?auto_2022247 ) ) ( ON ?auto_2022244 ?auto_2022243 ) ( ON ?auto_2022245 ?auto_2022244 ) ( ON ?auto_2022246 ?auto_2022245 ) ( not ( = ?auto_2022243 ?auto_2022244 ) ) ( not ( = ?auto_2022243 ?auto_2022245 ) ) ( not ( = ?auto_2022243 ?auto_2022246 ) ) ( not ( = ?auto_2022243 ?auto_2022247 ) ) ( not ( = ?auto_2022244 ?auto_2022245 ) ) ( not ( = ?auto_2022244 ?auto_2022246 ) ) ( not ( = ?auto_2022244 ?auto_2022247 ) ) ( not ( = ?auto_2022245 ?auto_2022246 ) ) ( not ( = ?auto_2022245 ?auto_2022247 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022246 ?auto_2022247 )
      ( MAKE-4CRATE-VERIFY ?auto_2022243 ?auto_2022244 ?auto_2022245 ?auto_2022246 ?auto_2022247 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022268 - SURFACE
      ?auto_2022269 - SURFACE
      ?auto_2022270 - SURFACE
      ?auto_2022271 - SURFACE
      ?auto_2022272 - SURFACE
    )
    :vars
    (
      ?auto_2022274 - HOIST
      ?auto_2022273 - PLACE
      ?auto_2022275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022274 ?auto_2022273 ) ( SURFACE-AT ?auto_2022271 ?auto_2022273 ) ( CLEAR ?auto_2022271 ) ( IS-CRATE ?auto_2022272 ) ( not ( = ?auto_2022271 ?auto_2022272 ) ) ( TRUCK-AT ?auto_2022275 ?auto_2022273 ) ( AVAILABLE ?auto_2022274 ) ( IN ?auto_2022272 ?auto_2022275 ) ( ON ?auto_2022271 ?auto_2022270 ) ( not ( = ?auto_2022270 ?auto_2022271 ) ) ( not ( = ?auto_2022270 ?auto_2022272 ) ) ( ON ?auto_2022269 ?auto_2022268 ) ( ON ?auto_2022270 ?auto_2022269 ) ( not ( = ?auto_2022268 ?auto_2022269 ) ) ( not ( = ?auto_2022268 ?auto_2022270 ) ) ( not ( = ?auto_2022268 ?auto_2022271 ) ) ( not ( = ?auto_2022268 ?auto_2022272 ) ) ( not ( = ?auto_2022269 ?auto_2022270 ) ) ( not ( = ?auto_2022269 ?auto_2022271 ) ) ( not ( = ?auto_2022269 ?auto_2022272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022270 ?auto_2022271 ?auto_2022272 )
      ( MAKE-4CRATE-VERIFY ?auto_2022268 ?auto_2022269 ?auto_2022270 ?auto_2022271 ?auto_2022272 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022298 - SURFACE
      ?auto_2022299 - SURFACE
      ?auto_2022300 - SURFACE
      ?auto_2022301 - SURFACE
      ?auto_2022302 - SURFACE
    )
    :vars
    (
      ?auto_2022306 - HOIST
      ?auto_2022305 - PLACE
      ?auto_2022303 - TRUCK
      ?auto_2022304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022306 ?auto_2022305 ) ( SURFACE-AT ?auto_2022301 ?auto_2022305 ) ( CLEAR ?auto_2022301 ) ( IS-CRATE ?auto_2022302 ) ( not ( = ?auto_2022301 ?auto_2022302 ) ) ( AVAILABLE ?auto_2022306 ) ( IN ?auto_2022302 ?auto_2022303 ) ( ON ?auto_2022301 ?auto_2022300 ) ( not ( = ?auto_2022300 ?auto_2022301 ) ) ( not ( = ?auto_2022300 ?auto_2022302 ) ) ( TRUCK-AT ?auto_2022303 ?auto_2022304 ) ( not ( = ?auto_2022304 ?auto_2022305 ) ) ( ON ?auto_2022299 ?auto_2022298 ) ( ON ?auto_2022300 ?auto_2022299 ) ( not ( = ?auto_2022298 ?auto_2022299 ) ) ( not ( = ?auto_2022298 ?auto_2022300 ) ) ( not ( = ?auto_2022298 ?auto_2022301 ) ) ( not ( = ?auto_2022298 ?auto_2022302 ) ) ( not ( = ?auto_2022299 ?auto_2022300 ) ) ( not ( = ?auto_2022299 ?auto_2022301 ) ) ( not ( = ?auto_2022299 ?auto_2022302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022300 ?auto_2022301 ?auto_2022302 )
      ( MAKE-4CRATE-VERIFY ?auto_2022298 ?auto_2022299 ?auto_2022300 ?auto_2022301 ?auto_2022302 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022332 - SURFACE
      ?auto_2022333 - SURFACE
      ?auto_2022334 - SURFACE
      ?auto_2022335 - SURFACE
      ?auto_2022336 - SURFACE
    )
    :vars
    (
      ?auto_2022337 - HOIST
      ?auto_2022341 - PLACE
      ?auto_2022340 - TRUCK
      ?auto_2022338 - PLACE
      ?auto_2022339 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022337 ?auto_2022341 ) ( SURFACE-AT ?auto_2022335 ?auto_2022341 ) ( CLEAR ?auto_2022335 ) ( IS-CRATE ?auto_2022336 ) ( not ( = ?auto_2022335 ?auto_2022336 ) ) ( AVAILABLE ?auto_2022337 ) ( ON ?auto_2022335 ?auto_2022334 ) ( not ( = ?auto_2022334 ?auto_2022335 ) ) ( not ( = ?auto_2022334 ?auto_2022336 ) ) ( TRUCK-AT ?auto_2022340 ?auto_2022338 ) ( not ( = ?auto_2022338 ?auto_2022341 ) ) ( HOIST-AT ?auto_2022339 ?auto_2022338 ) ( LIFTING ?auto_2022339 ?auto_2022336 ) ( not ( = ?auto_2022337 ?auto_2022339 ) ) ( ON ?auto_2022333 ?auto_2022332 ) ( ON ?auto_2022334 ?auto_2022333 ) ( not ( = ?auto_2022332 ?auto_2022333 ) ) ( not ( = ?auto_2022332 ?auto_2022334 ) ) ( not ( = ?auto_2022332 ?auto_2022335 ) ) ( not ( = ?auto_2022332 ?auto_2022336 ) ) ( not ( = ?auto_2022333 ?auto_2022334 ) ) ( not ( = ?auto_2022333 ?auto_2022335 ) ) ( not ( = ?auto_2022333 ?auto_2022336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022334 ?auto_2022335 ?auto_2022336 )
      ( MAKE-4CRATE-VERIFY ?auto_2022332 ?auto_2022333 ?auto_2022334 ?auto_2022335 ?auto_2022336 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022370 - SURFACE
      ?auto_2022371 - SURFACE
      ?auto_2022372 - SURFACE
      ?auto_2022373 - SURFACE
      ?auto_2022374 - SURFACE
    )
    :vars
    (
      ?auto_2022375 - HOIST
      ?auto_2022376 - PLACE
      ?auto_2022380 - TRUCK
      ?auto_2022378 - PLACE
      ?auto_2022377 - HOIST
      ?auto_2022379 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022375 ?auto_2022376 ) ( SURFACE-AT ?auto_2022373 ?auto_2022376 ) ( CLEAR ?auto_2022373 ) ( IS-CRATE ?auto_2022374 ) ( not ( = ?auto_2022373 ?auto_2022374 ) ) ( AVAILABLE ?auto_2022375 ) ( ON ?auto_2022373 ?auto_2022372 ) ( not ( = ?auto_2022372 ?auto_2022373 ) ) ( not ( = ?auto_2022372 ?auto_2022374 ) ) ( TRUCK-AT ?auto_2022380 ?auto_2022378 ) ( not ( = ?auto_2022378 ?auto_2022376 ) ) ( HOIST-AT ?auto_2022377 ?auto_2022378 ) ( not ( = ?auto_2022375 ?auto_2022377 ) ) ( AVAILABLE ?auto_2022377 ) ( SURFACE-AT ?auto_2022374 ?auto_2022378 ) ( ON ?auto_2022374 ?auto_2022379 ) ( CLEAR ?auto_2022374 ) ( not ( = ?auto_2022373 ?auto_2022379 ) ) ( not ( = ?auto_2022374 ?auto_2022379 ) ) ( not ( = ?auto_2022372 ?auto_2022379 ) ) ( ON ?auto_2022371 ?auto_2022370 ) ( ON ?auto_2022372 ?auto_2022371 ) ( not ( = ?auto_2022370 ?auto_2022371 ) ) ( not ( = ?auto_2022370 ?auto_2022372 ) ) ( not ( = ?auto_2022370 ?auto_2022373 ) ) ( not ( = ?auto_2022370 ?auto_2022374 ) ) ( not ( = ?auto_2022370 ?auto_2022379 ) ) ( not ( = ?auto_2022371 ?auto_2022372 ) ) ( not ( = ?auto_2022371 ?auto_2022373 ) ) ( not ( = ?auto_2022371 ?auto_2022374 ) ) ( not ( = ?auto_2022371 ?auto_2022379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022372 ?auto_2022373 ?auto_2022374 )
      ( MAKE-4CRATE-VERIFY ?auto_2022370 ?auto_2022371 ?auto_2022372 ?auto_2022373 ?auto_2022374 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022409 - SURFACE
      ?auto_2022410 - SURFACE
      ?auto_2022411 - SURFACE
      ?auto_2022412 - SURFACE
      ?auto_2022413 - SURFACE
    )
    :vars
    (
      ?auto_2022416 - HOIST
      ?auto_2022417 - PLACE
      ?auto_2022415 - PLACE
      ?auto_2022414 - HOIST
      ?auto_2022419 - SURFACE
      ?auto_2022418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022416 ?auto_2022417 ) ( SURFACE-AT ?auto_2022412 ?auto_2022417 ) ( CLEAR ?auto_2022412 ) ( IS-CRATE ?auto_2022413 ) ( not ( = ?auto_2022412 ?auto_2022413 ) ) ( AVAILABLE ?auto_2022416 ) ( ON ?auto_2022412 ?auto_2022411 ) ( not ( = ?auto_2022411 ?auto_2022412 ) ) ( not ( = ?auto_2022411 ?auto_2022413 ) ) ( not ( = ?auto_2022415 ?auto_2022417 ) ) ( HOIST-AT ?auto_2022414 ?auto_2022415 ) ( not ( = ?auto_2022416 ?auto_2022414 ) ) ( AVAILABLE ?auto_2022414 ) ( SURFACE-AT ?auto_2022413 ?auto_2022415 ) ( ON ?auto_2022413 ?auto_2022419 ) ( CLEAR ?auto_2022413 ) ( not ( = ?auto_2022412 ?auto_2022419 ) ) ( not ( = ?auto_2022413 ?auto_2022419 ) ) ( not ( = ?auto_2022411 ?auto_2022419 ) ) ( TRUCK-AT ?auto_2022418 ?auto_2022417 ) ( ON ?auto_2022410 ?auto_2022409 ) ( ON ?auto_2022411 ?auto_2022410 ) ( not ( = ?auto_2022409 ?auto_2022410 ) ) ( not ( = ?auto_2022409 ?auto_2022411 ) ) ( not ( = ?auto_2022409 ?auto_2022412 ) ) ( not ( = ?auto_2022409 ?auto_2022413 ) ) ( not ( = ?auto_2022409 ?auto_2022419 ) ) ( not ( = ?auto_2022410 ?auto_2022411 ) ) ( not ( = ?auto_2022410 ?auto_2022412 ) ) ( not ( = ?auto_2022410 ?auto_2022413 ) ) ( not ( = ?auto_2022410 ?auto_2022419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022411 ?auto_2022412 ?auto_2022413 )
      ( MAKE-4CRATE-VERIFY ?auto_2022409 ?auto_2022410 ?auto_2022411 ?auto_2022412 ?auto_2022413 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022448 - SURFACE
      ?auto_2022449 - SURFACE
      ?auto_2022450 - SURFACE
      ?auto_2022451 - SURFACE
      ?auto_2022452 - SURFACE
    )
    :vars
    (
      ?auto_2022454 - HOIST
      ?auto_2022455 - PLACE
      ?auto_2022458 - PLACE
      ?auto_2022457 - HOIST
      ?auto_2022453 - SURFACE
      ?auto_2022456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022454 ?auto_2022455 ) ( IS-CRATE ?auto_2022452 ) ( not ( = ?auto_2022451 ?auto_2022452 ) ) ( not ( = ?auto_2022450 ?auto_2022451 ) ) ( not ( = ?auto_2022450 ?auto_2022452 ) ) ( not ( = ?auto_2022458 ?auto_2022455 ) ) ( HOIST-AT ?auto_2022457 ?auto_2022458 ) ( not ( = ?auto_2022454 ?auto_2022457 ) ) ( AVAILABLE ?auto_2022457 ) ( SURFACE-AT ?auto_2022452 ?auto_2022458 ) ( ON ?auto_2022452 ?auto_2022453 ) ( CLEAR ?auto_2022452 ) ( not ( = ?auto_2022451 ?auto_2022453 ) ) ( not ( = ?auto_2022452 ?auto_2022453 ) ) ( not ( = ?auto_2022450 ?auto_2022453 ) ) ( TRUCK-AT ?auto_2022456 ?auto_2022455 ) ( SURFACE-AT ?auto_2022450 ?auto_2022455 ) ( CLEAR ?auto_2022450 ) ( LIFTING ?auto_2022454 ?auto_2022451 ) ( IS-CRATE ?auto_2022451 ) ( ON ?auto_2022449 ?auto_2022448 ) ( ON ?auto_2022450 ?auto_2022449 ) ( not ( = ?auto_2022448 ?auto_2022449 ) ) ( not ( = ?auto_2022448 ?auto_2022450 ) ) ( not ( = ?auto_2022448 ?auto_2022451 ) ) ( not ( = ?auto_2022448 ?auto_2022452 ) ) ( not ( = ?auto_2022448 ?auto_2022453 ) ) ( not ( = ?auto_2022449 ?auto_2022450 ) ) ( not ( = ?auto_2022449 ?auto_2022451 ) ) ( not ( = ?auto_2022449 ?auto_2022452 ) ) ( not ( = ?auto_2022449 ?auto_2022453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022450 ?auto_2022451 ?auto_2022452 )
      ( MAKE-4CRATE-VERIFY ?auto_2022448 ?auto_2022449 ?auto_2022450 ?auto_2022451 ?auto_2022452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022487 - SURFACE
      ?auto_2022488 - SURFACE
      ?auto_2022489 - SURFACE
      ?auto_2022490 - SURFACE
      ?auto_2022491 - SURFACE
    )
    :vars
    (
      ?auto_2022492 - HOIST
      ?auto_2022494 - PLACE
      ?auto_2022495 - PLACE
      ?auto_2022493 - HOIST
      ?auto_2022497 - SURFACE
      ?auto_2022496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022492 ?auto_2022494 ) ( IS-CRATE ?auto_2022491 ) ( not ( = ?auto_2022490 ?auto_2022491 ) ) ( not ( = ?auto_2022489 ?auto_2022490 ) ) ( not ( = ?auto_2022489 ?auto_2022491 ) ) ( not ( = ?auto_2022495 ?auto_2022494 ) ) ( HOIST-AT ?auto_2022493 ?auto_2022495 ) ( not ( = ?auto_2022492 ?auto_2022493 ) ) ( AVAILABLE ?auto_2022493 ) ( SURFACE-AT ?auto_2022491 ?auto_2022495 ) ( ON ?auto_2022491 ?auto_2022497 ) ( CLEAR ?auto_2022491 ) ( not ( = ?auto_2022490 ?auto_2022497 ) ) ( not ( = ?auto_2022491 ?auto_2022497 ) ) ( not ( = ?auto_2022489 ?auto_2022497 ) ) ( TRUCK-AT ?auto_2022496 ?auto_2022494 ) ( SURFACE-AT ?auto_2022489 ?auto_2022494 ) ( CLEAR ?auto_2022489 ) ( IS-CRATE ?auto_2022490 ) ( AVAILABLE ?auto_2022492 ) ( IN ?auto_2022490 ?auto_2022496 ) ( ON ?auto_2022488 ?auto_2022487 ) ( ON ?auto_2022489 ?auto_2022488 ) ( not ( = ?auto_2022487 ?auto_2022488 ) ) ( not ( = ?auto_2022487 ?auto_2022489 ) ) ( not ( = ?auto_2022487 ?auto_2022490 ) ) ( not ( = ?auto_2022487 ?auto_2022491 ) ) ( not ( = ?auto_2022487 ?auto_2022497 ) ) ( not ( = ?auto_2022488 ?auto_2022489 ) ) ( not ( = ?auto_2022488 ?auto_2022490 ) ) ( not ( = ?auto_2022488 ?auto_2022491 ) ) ( not ( = ?auto_2022488 ?auto_2022497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022489 ?auto_2022490 ?auto_2022491 )
      ( MAKE-4CRATE-VERIFY ?auto_2022487 ?auto_2022488 ?auto_2022489 ?auto_2022490 ?auto_2022491 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023147 - SURFACE
      ?auto_2023148 - SURFACE
      ?auto_2023149 - SURFACE
      ?auto_2023150 - SURFACE
      ?auto_2023151 - SURFACE
      ?auto_2023152 - SURFACE
    )
    :vars
    (
      ?auto_2023153 - HOIST
      ?auto_2023154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023153 ?auto_2023154 ) ( SURFACE-AT ?auto_2023151 ?auto_2023154 ) ( CLEAR ?auto_2023151 ) ( LIFTING ?auto_2023153 ?auto_2023152 ) ( IS-CRATE ?auto_2023152 ) ( not ( = ?auto_2023151 ?auto_2023152 ) ) ( ON ?auto_2023148 ?auto_2023147 ) ( ON ?auto_2023149 ?auto_2023148 ) ( ON ?auto_2023150 ?auto_2023149 ) ( ON ?auto_2023151 ?auto_2023150 ) ( not ( = ?auto_2023147 ?auto_2023148 ) ) ( not ( = ?auto_2023147 ?auto_2023149 ) ) ( not ( = ?auto_2023147 ?auto_2023150 ) ) ( not ( = ?auto_2023147 ?auto_2023151 ) ) ( not ( = ?auto_2023147 ?auto_2023152 ) ) ( not ( = ?auto_2023148 ?auto_2023149 ) ) ( not ( = ?auto_2023148 ?auto_2023150 ) ) ( not ( = ?auto_2023148 ?auto_2023151 ) ) ( not ( = ?auto_2023148 ?auto_2023152 ) ) ( not ( = ?auto_2023149 ?auto_2023150 ) ) ( not ( = ?auto_2023149 ?auto_2023151 ) ) ( not ( = ?auto_2023149 ?auto_2023152 ) ) ( not ( = ?auto_2023150 ?auto_2023151 ) ) ( not ( = ?auto_2023150 ?auto_2023152 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2023151 ?auto_2023152 )
      ( MAKE-5CRATE-VERIFY ?auto_2023147 ?auto_2023148 ?auto_2023149 ?auto_2023150 ?auto_2023151 ?auto_2023152 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023181 - SURFACE
      ?auto_2023182 - SURFACE
      ?auto_2023183 - SURFACE
      ?auto_2023184 - SURFACE
      ?auto_2023185 - SURFACE
      ?auto_2023186 - SURFACE
    )
    :vars
    (
      ?auto_2023188 - HOIST
      ?auto_2023189 - PLACE
      ?auto_2023187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023188 ?auto_2023189 ) ( SURFACE-AT ?auto_2023185 ?auto_2023189 ) ( CLEAR ?auto_2023185 ) ( IS-CRATE ?auto_2023186 ) ( not ( = ?auto_2023185 ?auto_2023186 ) ) ( TRUCK-AT ?auto_2023187 ?auto_2023189 ) ( AVAILABLE ?auto_2023188 ) ( IN ?auto_2023186 ?auto_2023187 ) ( ON ?auto_2023185 ?auto_2023184 ) ( not ( = ?auto_2023184 ?auto_2023185 ) ) ( not ( = ?auto_2023184 ?auto_2023186 ) ) ( ON ?auto_2023182 ?auto_2023181 ) ( ON ?auto_2023183 ?auto_2023182 ) ( ON ?auto_2023184 ?auto_2023183 ) ( not ( = ?auto_2023181 ?auto_2023182 ) ) ( not ( = ?auto_2023181 ?auto_2023183 ) ) ( not ( = ?auto_2023181 ?auto_2023184 ) ) ( not ( = ?auto_2023181 ?auto_2023185 ) ) ( not ( = ?auto_2023181 ?auto_2023186 ) ) ( not ( = ?auto_2023182 ?auto_2023183 ) ) ( not ( = ?auto_2023182 ?auto_2023184 ) ) ( not ( = ?auto_2023182 ?auto_2023185 ) ) ( not ( = ?auto_2023182 ?auto_2023186 ) ) ( not ( = ?auto_2023183 ?auto_2023184 ) ) ( not ( = ?auto_2023183 ?auto_2023185 ) ) ( not ( = ?auto_2023183 ?auto_2023186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023184 ?auto_2023185 ?auto_2023186 )
      ( MAKE-5CRATE-VERIFY ?auto_2023181 ?auto_2023182 ?auto_2023183 ?auto_2023184 ?auto_2023185 ?auto_2023186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023221 - SURFACE
      ?auto_2023222 - SURFACE
      ?auto_2023223 - SURFACE
      ?auto_2023224 - SURFACE
      ?auto_2023225 - SURFACE
      ?auto_2023226 - SURFACE
    )
    :vars
    (
      ?auto_2023228 - HOIST
      ?auto_2023230 - PLACE
      ?auto_2023229 - TRUCK
      ?auto_2023227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023228 ?auto_2023230 ) ( SURFACE-AT ?auto_2023225 ?auto_2023230 ) ( CLEAR ?auto_2023225 ) ( IS-CRATE ?auto_2023226 ) ( not ( = ?auto_2023225 ?auto_2023226 ) ) ( AVAILABLE ?auto_2023228 ) ( IN ?auto_2023226 ?auto_2023229 ) ( ON ?auto_2023225 ?auto_2023224 ) ( not ( = ?auto_2023224 ?auto_2023225 ) ) ( not ( = ?auto_2023224 ?auto_2023226 ) ) ( TRUCK-AT ?auto_2023229 ?auto_2023227 ) ( not ( = ?auto_2023227 ?auto_2023230 ) ) ( ON ?auto_2023222 ?auto_2023221 ) ( ON ?auto_2023223 ?auto_2023222 ) ( ON ?auto_2023224 ?auto_2023223 ) ( not ( = ?auto_2023221 ?auto_2023222 ) ) ( not ( = ?auto_2023221 ?auto_2023223 ) ) ( not ( = ?auto_2023221 ?auto_2023224 ) ) ( not ( = ?auto_2023221 ?auto_2023225 ) ) ( not ( = ?auto_2023221 ?auto_2023226 ) ) ( not ( = ?auto_2023222 ?auto_2023223 ) ) ( not ( = ?auto_2023222 ?auto_2023224 ) ) ( not ( = ?auto_2023222 ?auto_2023225 ) ) ( not ( = ?auto_2023222 ?auto_2023226 ) ) ( not ( = ?auto_2023223 ?auto_2023224 ) ) ( not ( = ?auto_2023223 ?auto_2023225 ) ) ( not ( = ?auto_2023223 ?auto_2023226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023224 ?auto_2023225 ?auto_2023226 )
      ( MAKE-5CRATE-VERIFY ?auto_2023221 ?auto_2023222 ?auto_2023223 ?auto_2023224 ?auto_2023225 ?auto_2023226 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023266 - SURFACE
      ?auto_2023267 - SURFACE
      ?auto_2023268 - SURFACE
      ?auto_2023269 - SURFACE
      ?auto_2023270 - SURFACE
      ?auto_2023271 - SURFACE
    )
    :vars
    (
      ?auto_2023273 - HOIST
      ?auto_2023272 - PLACE
      ?auto_2023276 - TRUCK
      ?auto_2023275 - PLACE
      ?auto_2023274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023273 ?auto_2023272 ) ( SURFACE-AT ?auto_2023270 ?auto_2023272 ) ( CLEAR ?auto_2023270 ) ( IS-CRATE ?auto_2023271 ) ( not ( = ?auto_2023270 ?auto_2023271 ) ) ( AVAILABLE ?auto_2023273 ) ( ON ?auto_2023270 ?auto_2023269 ) ( not ( = ?auto_2023269 ?auto_2023270 ) ) ( not ( = ?auto_2023269 ?auto_2023271 ) ) ( TRUCK-AT ?auto_2023276 ?auto_2023275 ) ( not ( = ?auto_2023275 ?auto_2023272 ) ) ( HOIST-AT ?auto_2023274 ?auto_2023275 ) ( LIFTING ?auto_2023274 ?auto_2023271 ) ( not ( = ?auto_2023273 ?auto_2023274 ) ) ( ON ?auto_2023267 ?auto_2023266 ) ( ON ?auto_2023268 ?auto_2023267 ) ( ON ?auto_2023269 ?auto_2023268 ) ( not ( = ?auto_2023266 ?auto_2023267 ) ) ( not ( = ?auto_2023266 ?auto_2023268 ) ) ( not ( = ?auto_2023266 ?auto_2023269 ) ) ( not ( = ?auto_2023266 ?auto_2023270 ) ) ( not ( = ?auto_2023266 ?auto_2023271 ) ) ( not ( = ?auto_2023267 ?auto_2023268 ) ) ( not ( = ?auto_2023267 ?auto_2023269 ) ) ( not ( = ?auto_2023267 ?auto_2023270 ) ) ( not ( = ?auto_2023267 ?auto_2023271 ) ) ( not ( = ?auto_2023268 ?auto_2023269 ) ) ( not ( = ?auto_2023268 ?auto_2023270 ) ) ( not ( = ?auto_2023268 ?auto_2023271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023269 ?auto_2023270 ?auto_2023271 )
      ( MAKE-5CRATE-VERIFY ?auto_2023266 ?auto_2023267 ?auto_2023268 ?auto_2023269 ?auto_2023270 ?auto_2023271 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023316 - SURFACE
      ?auto_2023317 - SURFACE
      ?auto_2023318 - SURFACE
      ?auto_2023319 - SURFACE
      ?auto_2023320 - SURFACE
      ?auto_2023321 - SURFACE
    )
    :vars
    (
      ?auto_2023327 - HOIST
      ?auto_2023322 - PLACE
      ?auto_2023323 - TRUCK
      ?auto_2023325 - PLACE
      ?auto_2023326 - HOIST
      ?auto_2023324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023327 ?auto_2023322 ) ( SURFACE-AT ?auto_2023320 ?auto_2023322 ) ( CLEAR ?auto_2023320 ) ( IS-CRATE ?auto_2023321 ) ( not ( = ?auto_2023320 ?auto_2023321 ) ) ( AVAILABLE ?auto_2023327 ) ( ON ?auto_2023320 ?auto_2023319 ) ( not ( = ?auto_2023319 ?auto_2023320 ) ) ( not ( = ?auto_2023319 ?auto_2023321 ) ) ( TRUCK-AT ?auto_2023323 ?auto_2023325 ) ( not ( = ?auto_2023325 ?auto_2023322 ) ) ( HOIST-AT ?auto_2023326 ?auto_2023325 ) ( not ( = ?auto_2023327 ?auto_2023326 ) ) ( AVAILABLE ?auto_2023326 ) ( SURFACE-AT ?auto_2023321 ?auto_2023325 ) ( ON ?auto_2023321 ?auto_2023324 ) ( CLEAR ?auto_2023321 ) ( not ( = ?auto_2023320 ?auto_2023324 ) ) ( not ( = ?auto_2023321 ?auto_2023324 ) ) ( not ( = ?auto_2023319 ?auto_2023324 ) ) ( ON ?auto_2023317 ?auto_2023316 ) ( ON ?auto_2023318 ?auto_2023317 ) ( ON ?auto_2023319 ?auto_2023318 ) ( not ( = ?auto_2023316 ?auto_2023317 ) ) ( not ( = ?auto_2023316 ?auto_2023318 ) ) ( not ( = ?auto_2023316 ?auto_2023319 ) ) ( not ( = ?auto_2023316 ?auto_2023320 ) ) ( not ( = ?auto_2023316 ?auto_2023321 ) ) ( not ( = ?auto_2023316 ?auto_2023324 ) ) ( not ( = ?auto_2023317 ?auto_2023318 ) ) ( not ( = ?auto_2023317 ?auto_2023319 ) ) ( not ( = ?auto_2023317 ?auto_2023320 ) ) ( not ( = ?auto_2023317 ?auto_2023321 ) ) ( not ( = ?auto_2023317 ?auto_2023324 ) ) ( not ( = ?auto_2023318 ?auto_2023319 ) ) ( not ( = ?auto_2023318 ?auto_2023320 ) ) ( not ( = ?auto_2023318 ?auto_2023321 ) ) ( not ( = ?auto_2023318 ?auto_2023324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023319 ?auto_2023320 ?auto_2023321 )
      ( MAKE-5CRATE-VERIFY ?auto_2023316 ?auto_2023317 ?auto_2023318 ?auto_2023319 ?auto_2023320 ?auto_2023321 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023367 - SURFACE
      ?auto_2023368 - SURFACE
      ?auto_2023369 - SURFACE
      ?auto_2023370 - SURFACE
      ?auto_2023371 - SURFACE
      ?auto_2023372 - SURFACE
    )
    :vars
    (
      ?auto_2023378 - HOIST
      ?auto_2023373 - PLACE
      ?auto_2023377 - PLACE
      ?auto_2023374 - HOIST
      ?auto_2023376 - SURFACE
      ?auto_2023375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023378 ?auto_2023373 ) ( SURFACE-AT ?auto_2023371 ?auto_2023373 ) ( CLEAR ?auto_2023371 ) ( IS-CRATE ?auto_2023372 ) ( not ( = ?auto_2023371 ?auto_2023372 ) ) ( AVAILABLE ?auto_2023378 ) ( ON ?auto_2023371 ?auto_2023370 ) ( not ( = ?auto_2023370 ?auto_2023371 ) ) ( not ( = ?auto_2023370 ?auto_2023372 ) ) ( not ( = ?auto_2023377 ?auto_2023373 ) ) ( HOIST-AT ?auto_2023374 ?auto_2023377 ) ( not ( = ?auto_2023378 ?auto_2023374 ) ) ( AVAILABLE ?auto_2023374 ) ( SURFACE-AT ?auto_2023372 ?auto_2023377 ) ( ON ?auto_2023372 ?auto_2023376 ) ( CLEAR ?auto_2023372 ) ( not ( = ?auto_2023371 ?auto_2023376 ) ) ( not ( = ?auto_2023372 ?auto_2023376 ) ) ( not ( = ?auto_2023370 ?auto_2023376 ) ) ( TRUCK-AT ?auto_2023375 ?auto_2023373 ) ( ON ?auto_2023368 ?auto_2023367 ) ( ON ?auto_2023369 ?auto_2023368 ) ( ON ?auto_2023370 ?auto_2023369 ) ( not ( = ?auto_2023367 ?auto_2023368 ) ) ( not ( = ?auto_2023367 ?auto_2023369 ) ) ( not ( = ?auto_2023367 ?auto_2023370 ) ) ( not ( = ?auto_2023367 ?auto_2023371 ) ) ( not ( = ?auto_2023367 ?auto_2023372 ) ) ( not ( = ?auto_2023367 ?auto_2023376 ) ) ( not ( = ?auto_2023368 ?auto_2023369 ) ) ( not ( = ?auto_2023368 ?auto_2023370 ) ) ( not ( = ?auto_2023368 ?auto_2023371 ) ) ( not ( = ?auto_2023368 ?auto_2023372 ) ) ( not ( = ?auto_2023368 ?auto_2023376 ) ) ( not ( = ?auto_2023369 ?auto_2023370 ) ) ( not ( = ?auto_2023369 ?auto_2023371 ) ) ( not ( = ?auto_2023369 ?auto_2023372 ) ) ( not ( = ?auto_2023369 ?auto_2023376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023370 ?auto_2023371 ?auto_2023372 )
      ( MAKE-5CRATE-VERIFY ?auto_2023367 ?auto_2023368 ?auto_2023369 ?auto_2023370 ?auto_2023371 ?auto_2023372 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023418 - SURFACE
      ?auto_2023419 - SURFACE
      ?auto_2023420 - SURFACE
      ?auto_2023421 - SURFACE
      ?auto_2023422 - SURFACE
      ?auto_2023423 - SURFACE
    )
    :vars
    (
      ?auto_2023427 - HOIST
      ?auto_2023426 - PLACE
      ?auto_2023424 - PLACE
      ?auto_2023425 - HOIST
      ?auto_2023429 - SURFACE
      ?auto_2023428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023427 ?auto_2023426 ) ( IS-CRATE ?auto_2023423 ) ( not ( = ?auto_2023422 ?auto_2023423 ) ) ( not ( = ?auto_2023421 ?auto_2023422 ) ) ( not ( = ?auto_2023421 ?auto_2023423 ) ) ( not ( = ?auto_2023424 ?auto_2023426 ) ) ( HOIST-AT ?auto_2023425 ?auto_2023424 ) ( not ( = ?auto_2023427 ?auto_2023425 ) ) ( AVAILABLE ?auto_2023425 ) ( SURFACE-AT ?auto_2023423 ?auto_2023424 ) ( ON ?auto_2023423 ?auto_2023429 ) ( CLEAR ?auto_2023423 ) ( not ( = ?auto_2023422 ?auto_2023429 ) ) ( not ( = ?auto_2023423 ?auto_2023429 ) ) ( not ( = ?auto_2023421 ?auto_2023429 ) ) ( TRUCK-AT ?auto_2023428 ?auto_2023426 ) ( SURFACE-AT ?auto_2023421 ?auto_2023426 ) ( CLEAR ?auto_2023421 ) ( LIFTING ?auto_2023427 ?auto_2023422 ) ( IS-CRATE ?auto_2023422 ) ( ON ?auto_2023419 ?auto_2023418 ) ( ON ?auto_2023420 ?auto_2023419 ) ( ON ?auto_2023421 ?auto_2023420 ) ( not ( = ?auto_2023418 ?auto_2023419 ) ) ( not ( = ?auto_2023418 ?auto_2023420 ) ) ( not ( = ?auto_2023418 ?auto_2023421 ) ) ( not ( = ?auto_2023418 ?auto_2023422 ) ) ( not ( = ?auto_2023418 ?auto_2023423 ) ) ( not ( = ?auto_2023418 ?auto_2023429 ) ) ( not ( = ?auto_2023419 ?auto_2023420 ) ) ( not ( = ?auto_2023419 ?auto_2023421 ) ) ( not ( = ?auto_2023419 ?auto_2023422 ) ) ( not ( = ?auto_2023419 ?auto_2023423 ) ) ( not ( = ?auto_2023419 ?auto_2023429 ) ) ( not ( = ?auto_2023420 ?auto_2023421 ) ) ( not ( = ?auto_2023420 ?auto_2023422 ) ) ( not ( = ?auto_2023420 ?auto_2023423 ) ) ( not ( = ?auto_2023420 ?auto_2023429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023421 ?auto_2023422 ?auto_2023423 )
      ( MAKE-5CRATE-VERIFY ?auto_2023418 ?auto_2023419 ?auto_2023420 ?auto_2023421 ?auto_2023422 ?auto_2023423 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023469 - SURFACE
      ?auto_2023470 - SURFACE
      ?auto_2023471 - SURFACE
      ?auto_2023472 - SURFACE
      ?auto_2023473 - SURFACE
      ?auto_2023474 - SURFACE
    )
    :vars
    (
      ?auto_2023480 - HOIST
      ?auto_2023478 - PLACE
      ?auto_2023479 - PLACE
      ?auto_2023476 - HOIST
      ?auto_2023475 - SURFACE
      ?auto_2023477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023480 ?auto_2023478 ) ( IS-CRATE ?auto_2023474 ) ( not ( = ?auto_2023473 ?auto_2023474 ) ) ( not ( = ?auto_2023472 ?auto_2023473 ) ) ( not ( = ?auto_2023472 ?auto_2023474 ) ) ( not ( = ?auto_2023479 ?auto_2023478 ) ) ( HOIST-AT ?auto_2023476 ?auto_2023479 ) ( not ( = ?auto_2023480 ?auto_2023476 ) ) ( AVAILABLE ?auto_2023476 ) ( SURFACE-AT ?auto_2023474 ?auto_2023479 ) ( ON ?auto_2023474 ?auto_2023475 ) ( CLEAR ?auto_2023474 ) ( not ( = ?auto_2023473 ?auto_2023475 ) ) ( not ( = ?auto_2023474 ?auto_2023475 ) ) ( not ( = ?auto_2023472 ?auto_2023475 ) ) ( TRUCK-AT ?auto_2023477 ?auto_2023478 ) ( SURFACE-AT ?auto_2023472 ?auto_2023478 ) ( CLEAR ?auto_2023472 ) ( IS-CRATE ?auto_2023473 ) ( AVAILABLE ?auto_2023480 ) ( IN ?auto_2023473 ?auto_2023477 ) ( ON ?auto_2023470 ?auto_2023469 ) ( ON ?auto_2023471 ?auto_2023470 ) ( ON ?auto_2023472 ?auto_2023471 ) ( not ( = ?auto_2023469 ?auto_2023470 ) ) ( not ( = ?auto_2023469 ?auto_2023471 ) ) ( not ( = ?auto_2023469 ?auto_2023472 ) ) ( not ( = ?auto_2023469 ?auto_2023473 ) ) ( not ( = ?auto_2023469 ?auto_2023474 ) ) ( not ( = ?auto_2023469 ?auto_2023475 ) ) ( not ( = ?auto_2023470 ?auto_2023471 ) ) ( not ( = ?auto_2023470 ?auto_2023472 ) ) ( not ( = ?auto_2023470 ?auto_2023473 ) ) ( not ( = ?auto_2023470 ?auto_2023474 ) ) ( not ( = ?auto_2023470 ?auto_2023475 ) ) ( not ( = ?auto_2023471 ?auto_2023472 ) ) ( not ( = ?auto_2023471 ?auto_2023473 ) ) ( not ( = ?auto_2023471 ?auto_2023474 ) ) ( not ( = ?auto_2023471 ?auto_2023475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023472 ?auto_2023473 ?auto_2023474 )
      ( MAKE-5CRATE-VERIFY ?auto_2023469 ?auto_2023470 ?auto_2023471 ?auto_2023472 ?auto_2023473 ?auto_2023474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2024149 - SURFACE
      ?auto_2024150 - SURFACE
    )
    :vars
    (
      ?auto_2024151 - HOIST
      ?auto_2024153 - PLACE
      ?auto_2024154 - SURFACE
      ?auto_2024157 - TRUCK
      ?auto_2024155 - PLACE
      ?auto_2024152 - HOIST
      ?auto_2024156 - SURFACE
      ?auto_2024158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024151 ?auto_2024153 ) ( SURFACE-AT ?auto_2024149 ?auto_2024153 ) ( CLEAR ?auto_2024149 ) ( IS-CRATE ?auto_2024150 ) ( not ( = ?auto_2024149 ?auto_2024150 ) ) ( AVAILABLE ?auto_2024151 ) ( ON ?auto_2024149 ?auto_2024154 ) ( not ( = ?auto_2024154 ?auto_2024149 ) ) ( not ( = ?auto_2024154 ?auto_2024150 ) ) ( TRUCK-AT ?auto_2024157 ?auto_2024155 ) ( not ( = ?auto_2024155 ?auto_2024153 ) ) ( HOIST-AT ?auto_2024152 ?auto_2024155 ) ( not ( = ?auto_2024151 ?auto_2024152 ) ) ( SURFACE-AT ?auto_2024150 ?auto_2024155 ) ( ON ?auto_2024150 ?auto_2024156 ) ( CLEAR ?auto_2024150 ) ( not ( = ?auto_2024149 ?auto_2024156 ) ) ( not ( = ?auto_2024150 ?auto_2024156 ) ) ( not ( = ?auto_2024154 ?auto_2024156 ) ) ( LIFTING ?auto_2024152 ?auto_2024158 ) ( IS-CRATE ?auto_2024158 ) ( not ( = ?auto_2024149 ?auto_2024158 ) ) ( not ( = ?auto_2024150 ?auto_2024158 ) ) ( not ( = ?auto_2024154 ?auto_2024158 ) ) ( not ( = ?auto_2024156 ?auto_2024158 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2024152 ?auto_2024158 ?auto_2024157 ?auto_2024155 )
      ( MAKE-1CRATE ?auto_2024149 ?auto_2024150 )
      ( MAKE-1CRATE-VERIFY ?auto_2024149 ?auto_2024150 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024675 - SURFACE
      ?auto_2024676 - SURFACE
      ?auto_2024677 - SURFACE
      ?auto_2024678 - SURFACE
      ?auto_2024679 - SURFACE
      ?auto_2024680 - SURFACE
      ?auto_2024681 - SURFACE
    )
    :vars
    (
      ?auto_2024682 - HOIST
      ?auto_2024683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024682 ?auto_2024683 ) ( SURFACE-AT ?auto_2024680 ?auto_2024683 ) ( CLEAR ?auto_2024680 ) ( LIFTING ?auto_2024682 ?auto_2024681 ) ( IS-CRATE ?auto_2024681 ) ( not ( = ?auto_2024680 ?auto_2024681 ) ) ( ON ?auto_2024676 ?auto_2024675 ) ( ON ?auto_2024677 ?auto_2024676 ) ( ON ?auto_2024678 ?auto_2024677 ) ( ON ?auto_2024679 ?auto_2024678 ) ( ON ?auto_2024680 ?auto_2024679 ) ( not ( = ?auto_2024675 ?auto_2024676 ) ) ( not ( = ?auto_2024675 ?auto_2024677 ) ) ( not ( = ?auto_2024675 ?auto_2024678 ) ) ( not ( = ?auto_2024675 ?auto_2024679 ) ) ( not ( = ?auto_2024675 ?auto_2024680 ) ) ( not ( = ?auto_2024675 ?auto_2024681 ) ) ( not ( = ?auto_2024676 ?auto_2024677 ) ) ( not ( = ?auto_2024676 ?auto_2024678 ) ) ( not ( = ?auto_2024676 ?auto_2024679 ) ) ( not ( = ?auto_2024676 ?auto_2024680 ) ) ( not ( = ?auto_2024676 ?auto_2024681 ) ) ( not ( = ?auto_2024677 ?auto_2024678 ) ) ( not ( = ?auto_2024677 ?auto_2024679 ) ) ( not ( = ?auto_2024677 ?auto_2024680 ) ) ( not ( = ?auto_2024677 ?auto_2024681 ) ) ( not ( = ?auto_2024678 ?auto_2024679 ) ) ( not ( = ?auto_2024678 ?auto_2024680 ) ) ( not ( = ?auto_2024678 ?auto_2024681 ) ) ( not ( = ?auto_2024679 ?auto_2024680 ) ) ( not ( = ?auto_2024679 ?auto_2024681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2024680 ?auto_2024681 )
      ( MAKE-6CRATE-VERIFY ?auto_2024675 ?auto_2024676 ?auto_2024677 ?auto_2024678 ?auto_2024679 ?auto_2024680 ?auto_2024681 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024719 - SURFACE
      ?auto_2024720 - SURFACE
      ?auto_2024721 - SURFACE
      ?auto_2024722 - SURFACE
      ?auto_2024723 - SURFACE
      ?auto_2024724 - SURFACE
      ?auto_2024725 - SURFACE
    )
    :vars
    (
      ?auto_2024727 - HOIST
      ?auto_2024726 - PLACE
      ?auto_2024728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024727 ?auto_2024726 ) ( SURFACE-AT ?auto_2024724 ?auto_2024726 ) ( CLEAR ?auto_2024724 ) ( IS-CRATE ?auto_2024725 ) ( not ( = ?auto_2024724 ?auto_2024725 ) ) ( TRUCK-AT ?auto_2024728 ?auto_2024726 ) ( AVAILABLE ?auto_2024727 ) ( IN ?auto_2024725 ?auto_2024728 ) ( ON ?auto_2024724 ?auto_2024723 ) ( not ( = ?auto_2024723 ?auto_2024724 ) ) ( not ( = ?auto_2024723 ?auto_2024725 ) ) ( ON ?auto_2024720 ?auto_2024719 ) ( ON ?auto_2024721 ?auto_2024720 ) ( ON ?auto_2024722 ?auto_2024721 ) ( ON ?auto_2024723 ?auto_2024722 ) ( not ( = ?auto_2024719 ?auto_2024720 ) ) ( not ( = ?auto_2024719 ?auto_2024721 ) ) ( not ( = ?auto_2024719 ?auto_2024722 ) ) ( not ( = ?auto_2024719 ?auto_2024723 ) ) ( not ( = ?auto_2024719 ?auto_2024724 ) ) ( not ( = ?auto_2024719 ?auto_2024725 ) ) ( not ( = ?auto_2024720 ?auto_2024721 ) ) ( not ( = ?auto_2024720 ?auto_2024722 ) ) ( not ( = ?auto_2024720 ?auto_2024723 ) ) ( not ( = ?auto_2024720 ?auto_2024724 ) ) ( not ( = ?auto_2024720 ?auto_2024725 ) ) ( not ( = ?auto_2024721 ?auto_2024722 ) ) ( not ( = ?auto_2024721 ?auto_2024723 ) ) ( not ( = ?auto_2024721 ?auto_2024724 ) ) ( not ( = ?auto_2024721 ?auto_2024725 ) ) ( not ( = ?auto_2024722 ?auto_2024723 ) ) ( not ( = ?auto_2024722 ?auto_2024724 ) ) ( not ( = ?auto_2024722 ?auto_2024725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024723 ?auto_2024724 ?auto_2024725 )
      ( MAKE-6CRATE-VERIFY ?auto_2024719 ?auto_2024720 ?auto_2024721 ?auto_2024722 ?auto_2024723 ?auto_2024724 ?auto_2024725 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024770 - SURFACE
      ?auto_2024771 - SURFACE
      ?auto_2024772 - SURFACE
      ?auto_2024773 - SURFACE
      ?auto_2024774 - SURFACE
      ?auto_2024775 - SURFACE
      ?auto_2024776 - SURFACE
    )
    :vars
    (
      ?auto_2024780 - HOIST
      ?auto_2024778 - PLACE
      ?auto_2024779 - TRUCK
      ?auto_2024777 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024780 ?auto_2024778 ) ( SURFACE-AT ?auto_2024775 ?auto_2024778 ) ( CLEAR ?auto_2024775 ) ( IS-CRATE ?auto_2024776 ) ( not ( = ?auto_2024775 ?auto_2024776 ) ) ( AVAILABLE ?auto_2024780 ) ( IN ?auto_2024776 ?auto_2024779 ) ( ON ?auto_2024775 ?auto_2024774 ) ( not ( = ?auto_2024774 ?auto_2024775 ) ) ( not ( = ?auto_2024774 ?auto_2024776 ) ) ( TRUCK-AT ?auto_2024779 ?auto_2024777 ) ( not ( = ?auto_2024777 ?auto_2024778 ) ) ( ON ?auto_2024771 ?auto_2024770 ) ( ON ?auto_2024772 ?auto_2024771 ) ( ON ?auto_2024773 ?auto_2024772 ) ( ON ?auto_2024774 ?auto_2024773 ) ( not ( = ?auto_2024770 ?auto_2024771 ) ) ( not ( = ?auto_2024770 ?auto_2024772 ) ) ( not ( = ?auto_2024770 ?auto_2024773 ) ) ( not ( = ?auto_2024770 ?auto_2024774 ) ) ( not ( = ?auto_2024770 ?auto_2024775 ) ) ( not ( = ?auto_2024770 ?auto_2024776 ) ) ( not ( = ?auto_2024771 ?auto_2024772 ) ) ( not ( = ?auto_2024771 ?auto_2024773 ) ) ( not ( = ?auto_2024771 ?auto_2024774 ) ) ( not ( = ?auto_2024771 ?auto_2024775 ) ) ( not ( = ?auto_2024771 ?auto_2024776 ) ) ( not ( = ?auto_2024772 ?auto_2024773 ) ) ( not ( = ?auto_2024772 ?auto_2024774 ) ) ( not ( = ?auto_2024772 ?auto_2024775 ) ) ( not ( = ?auto_2024772 ?auto_2024776 ) ) ( not ( = ?auto_2024773 ?auto_2024774 ) ) ( not ( = ?auto_2024773 ?auto_2024775 ) ) ( not ( = ?auto_2024773 ?auto_2024776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024774 ?auto_2024775 ?auto_2024776 )
      ( MAKE-6CRATE-VERIFY ?auto_2024770 ?auto_2024771 ?auto_2024772 ?auto_2024773 ?auto_2024774 ?auto_2024775 ?auto_2024776 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024827 - SURFACE
      ?auto_2024828 - SURFACE
      ?auto_2024829 - SURFACE
      ?auto_2024830 - SURFACE
      ?auto_2024831 - SURFACE
      ?auto_2024832 - SURFACE
      ?auto_2024833 - SURFACE
    )
    :vars
    (
      ?auto_2024837 - HOIST
      ?auto_2024834 - PLACE
      ?auto_2024835 - TRUCK
      ?auto_2024838 - PLACE
      ?auto_2024836 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024837 ?auto_2024834 ) ( SURFACE-AT ?auto_2024832 ?auto_2024834 ) ( CLEAR ?auto_2024832 ) ( IS-CRATE ?auto_2024833 ) ( not ( = ?auto_2024832 ?auto_2024833 ) ) ( AVAILABLE ?auto_2024837 ) ( ON ?auto_2024832 ?auto_2024831 ) ( not ( = ?auto_2024831 ?auto_2024832 ) ) ( not ( = ?auto_2024831 ?auto_2024833 ) ) ( TRUCK-AT ?auto_2024835 ?auto_2024838 ) ( not ( = ?auto_2024838 ?auto_2024834 ) ) ( HOIST-AT ?auto_2024836 ?auto_2024838 ) ( LIFTING ?auto_2024836 ?auto_2024833 ) ( not ( = ?auto_2024837 ?auto_2024836 ) ) ( ON ?auto_2024828 ?auto_2024827 ) ( ON ?auto_2024829 ?auto_2024828 ) ( ON ?auto_2024830 ?auto_2024829 ) ( ON ?auto_2024831 ?auto_2024830 ) ( not ( = ?auto_2024827 ?auto_2024828 ) ) ( not ( = ?auto_2024827 ?auto_2024829 ) ) ( not ( = ?auto_2024827 ?auto_2024830 ) ) ( not ( = ?auto_2024827 ?auto_2024831 ) ) ( not ( = ?auto_2024827 ?auto_2024832 ) ) ( not ( = ?auto_2024827 ?auto_2024833 ) ) ( not ( = ?auto_2024828 ?auto_2024829 ) ) ( not ( = ?auto_2024828 ?auto_2024830 ) ) ( not ( = ?auto_2024828 ?auto_2024831 ) ) ( not ( = ?auto_2024828 ?auto_2024832 ) ) ( not ( = ?auto_2024828 ?auto_2024833 ) ) ( not ( = ?auto_2024829 ?auto_2024830 ) ) ( not ( = ?auto_2024829 ?auto_2024831 ) ) ( not ( = ?auto_2024829 ?auto_2024832 ) ) ( not ( = ?auto_2024829 ?auto_2024833 ) ) ( not ( = ?auto_2024830 ?auto_2024831 ) ) ( not ( = ?auto_2024830 ?auto_2024832 ) ) ( not ( = ?auto_2024830 ?auto_2024833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024831 ?auto_2024832 ?auto_2024833 )
      ( MAKE-6CRATE-VERIFY ?auto_2024827 ?auto_2024828 ?auto_2024829 ?auto_2024830 ?auto_2024831 ?auto_2024832 ?auto_2024833 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024890 - SURFACE
      ?auto_2024891 - SURFACE
      ?auto_2024892 - SURFACE
      ?auto_2024893 - SURFACE
      ?auto_2024894 - SURFACE
      ?auto_2024895 - SURFACE
      ?auto_2024896 - SURFACE
    )
    :vars
    (
      ?auto_2024898 - HOIST
      ?auto_2024900 - PLACE
      ?auto_2024897 - TRUCK
      ?auto_2024902 - PLACE
      ?auto_2024901 - HOIST
      ?auto_2024899 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024898 ?auto_2024900 ) ( SURFACE-AT ?auto_2024895 ?auto_2024900 ) ( CLEAR ?auto_2024895 ) ( IS-CRATE ?auto_2024896 ) ( not ( = ?auto_2024895 ?auto_2024896 ) ) ( AVAILABLE ?auto_2024898 ) ( ON ?auto_2024895 ?auto_2024894 ) ( not ( = ?auto_2024894 ?auto_2024895 ) ) ( not ( = ?auto_2024894 ?auto_2024896 ) ) ( TRUCK-AT ?auto_2024897 ?auto_2024902 ) ( not ( = ?auto_2024902 ?auto_2024900 ) ) ( HOIST-AT ?auto_2024901 ?auto_2024902 ) ( not ( = ?auto_2024898 ?auto_2024901 ) ) ( AVAILABLE ?auto_2024901 ) ( SURFACE-AT ?auto_2024896 ?auto_2024902 ) ( ON ?auto_2024896 ?auto_2024899 ) ( CLEAR ?auto_2024896 ) ( not ( = ?auto_2024895 ?auto_2024899 ) ) ( not ( = ?auto_2024896 ?auto_2024899 ) ) ( not ( = ?auto_2024894 ?auto_2024899 ) ) ( ON ?auto_2024891 ?auto_2024890 ) ( ON ?auto_2024892 ?auto_2024891 ) ( ON ?auto_2024893 ?auto_2024892 ) ( ON ?auto_2024894 ?auto_2024893 ) ( not ( = ?auto_2024890 ?auto_2024891 ) ) ( not ( = ?auto_2024890 ?auto_2024892 ) ) ( not ( = ?auto_2024890 ?auto_2024893 ) ) ( not ( = ?auto_2024890 ?auto_2024894 ) ) ( not ( = ?auto_2024890 ?auto_2024895 ) ) ( not ( = ?auto_2024890 ?auto_2024896 ) ) ( not ( = ?auto_2024890 ?auto_2024899 ) ) ( not ( = ?auto_2024891 ?auto_2024892 ) ) ( not ( = ?auto_2024891 ?auto_2024893 ) ) ( not ( = ?auto_2024891 ?auto_2024894 ) ) ( not ( = ?auto_2024891 ?auto_2024895 ) ) ( not ( = ?auto_2024891 ?auto_2024896 ) ) ( not ( = ?auto_2024891 ?auto_2024899 ) ) ( not ( = ?auto_2024892 ?auto_2024893 ) ) ( not ( = ?auto_2024892 ?auto_2024894 ) ) ( not ( = ?auto_2024892 ?auto_2024895 ) ) ( not ( = ?auto_2024892 ?auto_2024896 ) ) ( not ( = ?auto_2024892 ?auto_2024899 ) ) ( not ( = ?auto_2024893 ?auto_2024894 ) ) ( not ( = ?auto_2024893 ?auto_2024895 ) ) ( not ( = ?auto_2024893 ?auto_2024896 ) ) ( not ( = ?auto_2024893 ?auto_2024899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024894 ?auto_2024895 ?auto_2024896 )
      ( MAKE-6CRATE-VERIFY ?auto_2024890 ?auto_2024891 ?auto_2024892 ?auto_2024893 ?auto_2024894 ?auto_2024895 ?auto_2024896 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024954 - SURFACE
      ?auto_2024955 - SURFACE
      ?auto_2024956 - SURFACE
      ?auto_2024957 - SURFACE
      ?auto_2024958 - SURFACE
      ?auto_2024959 - SURFACE
      ?auto_2024960 - SURFACE
    )
    :vars
    (
      ?auto_2024962 - HOIST
      ?auto_2024965 - PLACE
      ?auto_2024966 - PLACE
      ?auto_2024963 - HOIST
      ?auto_2024964 - SURFACE
      ?auto_2024961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024962 ?auto_2024965 ) ( SURFACE-AT ?auto_2024959 ?auto_2024965 ) ( CLEAR ?auto_2024959 ) ( IS-CRATE ?auto_2024960 ) ( not ( = ?auto_2024959 ?auto_2024960 ) ) ( AVAILABLE ?auto_2024962 ) ( ON ?auto_2024959 ?auto_2024958 ) ( not ( = ?auto_2024958 ?auto_2024959 ) ) ( not ( = ?auto_2024958 ?auto_2024960 ) ) ( not ( = ?auto_2024966 ?auto_2024965 ) ) ( HOIST-AT ?auto_2024963 ?auto_2024966 ) ( not ( = ?auto_2024962 ?auto_2024963 ) ) ( AVAILABLE ?auto_2024963 ) ( SURFACE-AT ?auto_2024960 ?auto_2024966 ) ( ON ?auto_2024960 ?auto_2024964 ) ( CLEAR ?auto_2024960 ) ( not ( = ?auto_2024959 ?auto_2024964 ) ) ( not ( = ?auto_2024960 ?auto_2024964 ) ) ( not ( = ?auto_2024958 ?auto_2024964 ) ) ( TRUCK-AT ?auto_2024961 ?auto_2024965 ) ( ON ?auto_2024955 ?auto_2024954 ) ( ON ?auto_2024956 ?auto_2024955 ) ( ON ?auto_2024957 ?auto_2024956 ) ( ON ?auto_2024958 ?auto_2024957 ) ( not ( = ?auto_2024954 ?auto_2024955 ) ) ( not ( = ?auto_2024954 ?auto_2024956 ) ) ( not ( = ?auto_2024954 ?auto_2024957 ) ) ( not ( = ?auto_2024954 ?auto_2024958 ) ) ( not ( = ?auto_2024954 ?auto_2024959 ) ) ( not ( = ?auto_2024954 ?auto_2024960 ) ) ( not ( = ?auto_2024954 ?auto_2024964 ) ) ( not ( = ?auto_2024955 ?auto_2024956 ) ) ( not ( = ?auto_2024955 ?auto_2024957 ) ) ( not ( = ?auto_2024955 ?auto_2024958 ) ) ( not ( = ?auto_2024955 ?auto_2024959 ) ) ( not ( = ?auto_2024955 ?auto_2024960 ) ) ( not ( = ?auto_2024955 ?auto_2024964 ) ) ( not ( = ?auto_2024956 ?auto_2024957 ) ) ( not ( = ?auto_2024956 ?auto_2024958 ) ) ( not ( = ?auto_2024956 ?auto_2024959 ) ) ( not ( = ?auto_2024956 ?auto_2024960 ) ) ( not ( = ?auto_2024956 ?auto_2024964 ) ) ( not ( = ?auto_2024957 ?auto_2024958 ) ) ( not ( = ?auto_2024957 ?auto_2024959 ) ) ( not ( = ?auto_2024957 ?auto_2024960 ) ) ( not ( = ?auto_2024957 ?auto_2024964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024958 ?auto_2024959 ?auto_2024960 )
      ( MAKE-6CRATE-VERIFY ?auto_2024954 ?auto_2024955 ?auto_2024956 ?auto_2024957 ?auto_2024958 ?auto_2024959 ?auto_2024960 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025018 - SURFACE
      ?auto_2025019 - SURFACE
      ?auto_2025020 - SURFACE
      ?auto_2025021 - SURFACE
      ?auto_2025022 - SURFACE
      ?auto_2025023 - SURFACE
      ?auto_2025024 - SURFACE
    )
    :vars
    (
      ?auto_2025029 - HOIST
      ?auto_2025027 - PLACE
      ?auto_2025025 - PLACE
      ?auto_2025030 - HOIST
      ?auto_2025026 - SURFACE
      ?auto_2025028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025029 ?auto_2025027 ) ( IS-CRATE ?auto_2025024 ) ( not ( = ?auto_2025023 ?auto_2025024 ) ) ( not ( = ?auto_2025022 ?auto_2025023 ) ) ( not ( = ?auto_2025022 ?auto_2025024 ) ) ( not ( = ?auto_2025025 ?auto_2025027 ) ) ( HOIST-AT ?auto_2025030 ?auto_2025025 ) ( not ( = ?auto_2025029 ?auto_2025030 ) ) ( AVAILABLE ?auto_2025030 ) ( SURFACE-AT ?auto_2025024 ?auto_2025025 ) ( ON ?auto_2025024 ?auto_2025026 ) ( CLEAR ?auto_2025024 ) ( not ( = ?auto_2025023 ?auto_2025026 ) ) ( not ( = ?auto_2025024 ?auto_2025026 ) ) ( not ( = ?auto_2025022 ?auto_2025026 ) ) ( TRUCK-AT ?auto_2025028 ?auto_2025027 ) ( SURFACE-AT ?auto_2025022 ?auto_2025027 ) ( CLEAR ?auto_2025022 ) ( LIFTING ?auto_2025029 ?auto_2025023 ) ( IS-CRATE ?auto_2025023 ) ( ON ?auto_2025019 ?auto_2025018 ) ( ON ?auto_2025020 ?auto_2025019 ) ( ON ?auto_2025021 ?auto_2025020 ) ( ON ?auto_2025022 ?auto_2025021 ) ( not ( = ?auto_2025018 ?auto_2025019 ) ) ( not ( = ?auto_2025018 ?auto_2025020 ) ) ( not ( = ?auto_2025018 ?auto_2025021 ) ) ( not ( = ?auto_2025018 ?auto_2025022 ) ) ( not ( = ?auto_2025018 ?auto_2025023 ) ) ( not ( = ?auto_2025018 ?auto_2025024 ) ) ( not ( = ?auto_2025018 ?auto_2025026 ) ) ( not ( = ?auto_2025019 ?auto_2025020 ) ) ( not ( = ?auto_2025019 ?auto_2025021 ) ) ( not ( = ?auto_2025019 ?auto_2025022 ) ) ( not ( = ?auto_2025019 ?auto_2025023 ) ) ( not ( = ?auto_2025019 ?auto_2025024 ) ) ( not ( = ?auto_2025019 ?auto_2025026 ) ) ( not ( = ?auto_2025020 ?auto_2025021 ) ) ( not ( = ?auto_2025020 ?auto_2025022 ) ) ( not ( = ?auto_2025020 ?auto_2025023 ) ) ( not ( = ?auto_2025020 ?auto_2025024 ) ) ( not ( = ?auto_2025020 ?auto_2025026 ) ) ( not ( = ?auto_2025021 ?auto_2025022 ) ) ( not ( = ?auto_2025021 ?auto_2025023 ) ) ( not ( = ?auto_2025021 ?auto_2025024 ) ) ( not ( = ?auto_2025021 ?auto_2025026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025022 ?auto_2025023 ?auto_2025024 )
      ( MAKE-6CRATE-VERIFY ?auto_2025018 ?auto_2025019 ?auto_2025020 ?auto_2025021 ?auto_2025022 ?auto_2025023 ?auto_2025024 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025082 - SURFACE
      ?auto_2025083 - SURFACE
      ?auto_2025084 - SURFACE
      ?auto_2025085 - SURFACE
      ?auto_2025086 - SURFACE
      ?auto_2025087 - SURFACE
      ?auto_2025088 - SURFACE
    )
    :vars
    (
      ?auto_2025091 - HOIST
      ?auto_2025093 - PLACE
      ?auto_2025094 - PLACE
      ?auto_2025092 - HOIST
      ?auto_2025090 - SURFACE
      ?auto_2025089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025091 ?auto_2025093 ) ( IS-CRATE ?auto_2025088 ) ( not ( = ?auto_2025087 ?auto_2025088 ) ) ( not ( = ?auto_2025086 ?auto_2025087 ) ) ( not ( = ?auto_2025086 ?auto_2025088 ) ) ( not ( = ?auto_2025094 ?auto_2025093 ) ) ( HOIST-AT ?auto_2025092 ?auto_2025094 ) ( not ( = ?auto_2025091 ?auto_2025092 ) ) ( AVAILABLE ?auto_2025092 ) ( SURFACE-AT ?auto_2025088 ?auto_2025094 ) ( ON ?auto_2025088 ?auto_2025090 ) ( CLEAR ?auto_2025088 ) ( not ( = ?auto_2025087 ?auto_2025090 ) ) ( not ( = ?auto_2025088 ?auto_2025090 ) ) ( not ( = ?auto_2025086 ?auto_2025090 ) ) ( TRUCK-AT ?auto_2025089 ?auto_2025093 ) ( SURFACE-AT ?auto_2025086 ?auto_2025093 ) ( CLEAR ?auto_2025086 ) ( IS-CRATE ?auto_2025087 ) ( AVAILABLE ?auto_2025091 ) ( IN ?auto_2025087 ?auto_2025089 ) ( ON ?auto_2025083 ?auto_2025082 ) ( ON ?auto_2025084 ?auto_2025083 ) ( ON ?auto_2025085 ?auto_2025084 ) ( ON ?auto_2025086 ?auto_2025085 ) ( not ( = ?auto_2025082 ?auto_2025083 ) ) ( not ( = ?auto_2025082 ?auto_2025084 ) ) ( not ( = ?auto_2025082 ?auto_2025085 ) ) ( not ( = ?auto_2025082 ?auto_2025086 ) ) ( not ( = ?auto_2025082 ?auto_2025087 ) ) ( not ( = ?auto_2025082 ?auto_2025088 ) ) ( not ( = ?auto_2025082 ?auto_2025090 ) ) ( not ( = ?auto_2025083 ?auto_2025084 ) ) ( not ( = ?auto_2025083 ?auto_2025085 ) ) ( not ( = ?auto_2025083 ?auto_2025086 ) ) ( not ( = ?auto_2025083 ?auto_2025087 ) ) ( not ( = ?auto_2025083 ?auto_2025088 ) ) ( not ( = ?auto_2025083 ?auto_2025090 ) ) ( not ( = ?auto_2025084 ?auto_2025085 ) ) ( not ( = ?auto_2025084 ?auto_2025086 ) ) ( not ( = ?auto_2025084 ?auto_2025087 ) ) ( not ( = ?auto_2025084 ?auto_2025088 ) ) ( not ( = ?auto_2025084 ?auto_2025090 ) ) ( not ( = ?auto_2025085 ?auto_2025086 ) ) ( not ( = ?auto_2025085 ?auto_2025087 ) ) ( not ( = ?auto_2025085 ?auto_2025088 ) ) ( not ( = ?auto_2025085 ?auto_2025090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025086 ?auto_2025087 ?auto_2025088 )
      ( MAKE-6CRATE-VERIFY ?auto_2025082 ?auto_2025083 ?auto_2025084 ?auto_2025085 ?auto_2025086 ?auto_2025087 ?auto_2025088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2026356 - SURFACE
      ?auto_2026357 - SURFACE
    )
    :vars
    (
      ?auto_2026358 - HOIST
      ?auto_2026360 - PLACE
      ?auto_2026362 - SURFACE
      ?auto_2026361 - PLACE
      ?auto_2026359 - HOIST
      ?auto_2026363 - SURFACE
      ?auto_2026364 - TRUCK
      ?auto_2026365 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2026358 ?auto_2026360 ) ( SURFACE-AT ?auto_2026356 ?auto_2026360 ) ( CLEAR ?auto_2026356 ) ( IS-CRATE ?auto_2026357 ) ( not ( = ?auto_2026356 ?auto_2026357 ) ) ( ON ?auto_2026356 ?auto_2026362 ) ( not ( = ?auto_2026362 ?auto_2026356 ) ) ( not ( = ?auto_2026362 ?auto_2026357 ) ) ( not ( = ?auto_2026361 ?auto_2026360 ) ) ( HOIST-AT ?auto_2026359 ?auto_2026361 ) ( not ( = ?auto_2026358 ?auto_2026359 ) ) ( AVAILABLE ?auto_2026359 ) ( SURFACE-AT ?auto_2026357 ?auto_2026361 ) ( ON ?auto_2026357 ?auto_2026363 ) ( CLEAR ?auto_2026357 ) ( not ( = ?auto_2026356 ?auto_2026363 ) ) ( not ( = ?auto_2026357 ?auto_2026363 ) ) ( not ( = ?auto_2026362 ?auto_2026363 ) ) ( TRUCK-AT ?auto_2026364 ?auto_2026360 ) ( LIFTING ?auto_2026358 ?auto_2026365 ) ( IS-CRATE ?auto_2026365 ) ( not ( = ?auto_2026356 ?auto_2026365 ) ) ( not ( = ?auto_2026357 ?auto_2026365 ) ) ( not ( = ?auto_2026362 ?auto_2026365 ) ) ( not ( = ?auto_2026363 ?auto_2026365 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2026358 ?auto_2026365 ?auto_2026364 ?auto_2026360 )
      ( MAKE-1CRATE ?auto_2026356 ?auto_2026357 )
      ( MAKE-1CRATE-VERIFY ?auto_2026356 ?auto_2026357 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027033 - SURFACE
      ?auto_2027034 - SURFACE
      ?auto_2027035 - SURFACE
      ?auto_2027036 - SURFACE
      ?auto_2027037 - SURFACE
      ?auto_2027038 - SURFACE
      ?auto_2027039 - SURFACE
      ?auto_2027040 - SURFACE
    )
    :vars
    (
      ?auto_2027041 - HOIST
      ?auto_2027042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027041 ?auto_2027042 ) ( SURFACE-AT ?auto_2027039 ?auto_2027042 ) ( CLEAR ?auto_2027039 ) ( LIFTING ?auto_2027041 ?auto_2027040 ) ( IS-CRATE ?auto_2027040 ) ( not ( = ?auto_2027039 ?auto_2027040 ) ) ( ON ?auto_2027034 ?auto_2027033 ) ( ON ?auto_2027035 ?auto_2027034 ) ( ON ?auto_2027036 ?auto_2027035 ) ( ON ?auto_2027037 ?auto_2027036 ) ( ON ?auto_2027038 ?auto_2027037 ) ( ON ?auto_2027039 ?auto_2027038 ) ( not ( = ?auto_2027033 ?auto_2027034 ) ) ( not ( = ?auto_2027033 ?auto_2027035 ) ) ( not ( = ?auto_2027033 ?auto_2027036 ) ) ( not ( = ?auto_2027033 ?auto_2027037 ) ) ( not ( = ?auto_2027033 ?auto_2027038 ) ) ( not ( = ?auto_2027033 ?auto_2027039 ) ) ( not ( = ?auto_2027033 ?auto_2027040 ) ) ( not ( = ?auto_2027034 ?auto_2027035 ) ) ( not ( = ?auto_2027034 ?auto_2027036 ) ) ( not ( = ?auto_2027034 ?auto_2027037 ) ) ( not ( = ?auto_2027034 ?auto_2027038 ) ) ( not ( = ?auto_2027034 ?auto_2027039 ) ) ( not ( = ?auto_2027034 ?auto_2027040 ) ) ( not ( = ?auto_2027035 ?auto_2027036 ) ) ( not ( = ?auto_2027035 ?auto_2027037 ) ) ( not ( = ?auto_2027035 ?auto_2027038 ) ) ( not ( = ?auto_2027035 ?auto_2027039 ) ) ( not ( = ?auto_2027035 ?auto_2027040 ) ) ( not ( = ?auto_2027036 ?auto_2027037 ) ) ( not ( = ?auto_2027036 ?auto_2027038 ) ) ( not ( = ?auto_2027036 ?auto_2027039 ) ) ( not ( = ?auto_2027036 ?auto_2027040 ) ) ( not ( = ?auto_2027037 ?auto_2027038 ) ) ( not ( = ?auto_2027037 ?auto_2027039 ) ) ( not ( = ?auto_2027037 ?auto_2027040 ) ) ( not ( = ?auto_2027038 ?auto_2027039 ) ) ( not ( = ?auto_2027038 ?auto_2027040 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2027039 ?auto_2027040 )
      ( MAKE-7CRATE-VERIFY ?auto_2027033 ?auto_2027034 ?auto_2027035 ?auto_2027036 ?auto_2027037 ?auto_2027038 ?auto_2027039 ?auto_2027040 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027088 - SURFACE
      ?auto_2027089 - SURFACE
      ?auto_2027090 - SURFACE
      ?auto_2027091 - SURFACE
      ?auto_2027092 - SURFACE
      ?auto_2027093 - SURFACE
      ?auto_2027094 - SURFACE
      ?auto_2027095 - SURFACE
    )
    :vars
    (
      ?auto_2027098 - HOIST
      ?auto_2027097 - PLACE
      ?auto_2027096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027098 ?auto_2027097 ) ( SURFACE-AT ?auto_2027094 ?auto_2027097 ) ( CLEAR ?auto_2027094 ) ( IS-CRATE ?auto_2027095 ) ( not ( = ?auto_2027094 ?auto_2027095 ) ) ( TRUCK-AT ?auto_2027096 ?auto_2027097 ) ( AVAILABLE ?auto_2027098 ) ( IN ?auto_2027095 ?auto_2027096 ) ( ON ?auto_2027094 ?auto_2027093 ) ( not ( = ?auto_2027093 ?auto_2027094 ) ) ( not ( = ?auto_2027093 ?auto_2027095 ) ) ( ON ?auto_2027089 ?auto_2027088 ) ( ON ?auto_2027090 ?auto_2027089 ) ( ON ?auto_2027091 ?auto_2027090 ) ( ON ?auto_2027092 ?auto_2027091 ) ( ON ?auto_2027093 ?auto_2027092 ) ( not ( = ?auto_2027088 ?auto_2027089 ) ) ( not ( = ?auto_2027088 ?auto_2027090 ) ) ( not ( = ?auto_2027088 ?auto_2027091 ) ) ( not ( = ?auto_2027088 ?auto_2027092 ) ) ( not ( = ?auto_2027088 ?auto_2027093 ) ) ( not ( = ?auto_2027088 ?auto_2027094 ) ) ( not ( = ?auto_2027088 ?auto_2027095 ) ) ( not ( = ?auto_2027089 ?auto_2027090 ) ) ( not ( = ?auto_2027089 ?auto_2027091 ) ) ( not ( = ?auto_2027089 ?auto_2027092 ) ) ( not ( = ?auto_2027089 ?auto_2027093 ) ) ( not ( = ?auto_2027089 ?auto_2027094 ) ) ( not ( = ?auto_2027089 ?auto_2027095 ) ) ( not ( = ?auto_2027090 ?auto_2027091 ) ) ( not ( = ?auto_2027090 ?auto_2027092 ) ) ( not ( = ?auto_2027090 ?auto_2027093 ) ) ( not ( = ?auto_2027090 ?auto_2027094 ) ) ( not ( = ?auto_2027090 ?auto_2027095 ) ) ( not ( = ?auto_2027091 ?auto_2027092 ) ) ( not ( = ?auto_2027091 ?auto_2027093 ) ) ( not ( = ?auto_2027091 ?auto_2027094 ) ) ( not ( = ?auto_2027091 ?auto_2027095 ) ) ( not ( = ?auto_2027092 ?auto_2027093 ) ) ( not ( = ?auto_2027092 ?auto_2027094 ) ) ( not ( = ?auto_2027092 ?auto_2027095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027093 ?auto_2027094 ?auto_2027095 )
      ( MAKE-7CRATE-VERIFY ?auto_2027088 ?auto_2027089 ?auto_2027090 ?auto_2027091 ?auto_2027092 ?auto_2027093 ?auto_2027094 ?auto_2027095 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027151 - SURFACE
      ?auto_2027152 - SURFACE
      ?auto_2027153 - SURFACE
      ?auto_2027154 - SURFACE
      ?auto_2027155 - SURFACE
      ?auto_2027156 - SURFACE
      ?auto_2027157 - SURFACE
      ?auto_2027158 - SURFACE
    )
    :vars
    (
      ?auto_2027159 - HOIST
      ?auto_2027162 - PLACE
      ?auto_2027160 - TRUCK
      ?auto_2027161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027159 ?auto_2027162 ) ( SURFACE-AT ?auto_2027157 ?auto_2027162 ) ( CLEAR ?auto_2027157 ) ( IS-CRATE ?auto_2027158 ) ( not ( = ?auto_2027157 ?auto_2027158 ) ) ( AVAILABLE ?auto_2027159 ) ( IN ?auto_2027158 ?auto_2027160 ) ( ON ?auto_2027157 ?auto_2027156 ) ( not ( = ?auto_2027156 ?auto_2027157 ) ) ( not ( = ?auto_2027156 ?auto_2027158 ) ) ( TRUCK-AT ?auto_2027160 ?auto_2027161 ) ( not ( = ?auto_2027161 ?auto_2027162 ) ) ( ON ?auto_2027152 ?auto_2027151 ) ( ON ?auto_2027153 ?auto_2027152 ) ( ON ?auto_2027154 ?auto_2027153 ) ( ON ?auto_2027155 ?auto_2027154 ) ( ON ?auto_2027156 ?auto_2027155 ) ( not ( = ?auto_2027151 ?auto_2027152 ) ) ( not ( = ?auto_2027151 ?auto_2027153 ) ) ( not ( = ?auto_2027151 ?auto_2027154 ) ) ( not ( = ?auto_2027151 ?auto_2027155 ) ) ( not ( = ?auto_2027151 ?auto_2027156 ) ) ( not ( = ?auto_2027151 ?auto_2027157 ) ) ( not ( = ?auto_2027151 ?auto_2027158 ) ) ( not ( = ?auto_2027152 ?auto_2027153 ) ) ( not ( = ?auto_2027152 ?auto_2027154 ) ) ( not ( = ?auto_2027152 ?auto_2027155 ) ) ( not ( = ?auto_2027152 ?auto_2027156 ) ) ( not ( = ?auto_2027152 ?auto_2027157 ) ) ( not ( = ?auto_2027152 ?auto_2027158 ) ) ( not ( = ?auto_2027153 ?auto_2027154 ) ) ( not ( = ?auto_2027153 ?auto_2027155 ) ) ( not ( = ?auto_2027153 ?auto_2027156 ) ) ( not ( = ?auto_2027153 ?auto_2027157 ) ) ( not ( = ?auto_2027153 ?auto_2027158 ) ) ( not ( = ?auto_2027154 ?auto_2027155 ) ) ( not ( = ?auto_2027154 ?auto_2027156 ) ) ( not ( = ?auto_2027154 ?auto_2027157 ) ) ( not ( = ?auto_2027154 ?auto_2027158 ) ) ( not ( = ?auto_2027155 ?auto_2027156 ) ) ( not ( = ?auto_2027155 ?auto_2027157 ) ) ( not ( = ?auto_2027155 ?auto_2027158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027156 ?auto_2027157 ?auto_2027158 )
      ( MAKE-7CRATE-VERIFY ?auto_2027151 ?auto_2027152 ?auto_2027153 ?auto_2027154 ?auto_2027155 ?auto_2027156 ?auto_2027157 ?auto_2027158 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027221 - SURFACE
      ?auto_2027222 - SURFACE
      ?auto_2027223 - SURFACE
      ?auto_2027224 - SURFACE
      ?auto_2027225 - SURFACE
      ?auto_2027226 - SURFACE
      ?auto_2027227 - SURFACE
      ?auto_2027228 - SURFACE
    )
    :vars
    (
      ?auto_2027232 - HOIST
      ?auto_2027231 - PLACE
      ?auto_2027233 - TRUCK
      ?auto_2027230 - PLACE
      ?auto_2027229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027232 ?auto_2027231 ) ( SURFACE-AT ?auto_2027227 ?auto_2027231 ) ( CLEAR ?auto_2027227 ) ( IS-CRATE ?auto_2027228 ) ( not ( = ?auto_2027227 ?auto_2027228 ) ) ( AVAILABLE ?auto_2027232 ) ( ON ?auto_2027227 ?auto_2027226 ) ( not ( = ?auto_2027226 ?auto_2027227 ) ) ( not ( = ?auto_2027226 ?auto_2027228 ) ) ( TRUCK-AT ?auto_2027233 ?auto_2027230 ) ( not ( = ?auto_2027230 ?auto_2027231 ) ) ( HOIST-AT ?auto_2027229 ?auto_2027230 ) ( LIFTING ?auto_2027229 ?auto_2027228 ) ( not ( = ?auto_2027232 ?auto_2027229 ) ) ( ON ?auto_2027222 ?auto_2027221 ) ( ON ?auto_2027223 ?auto_2027222 ) ( ON ?auto_2027224 ?auto_2027223 ) ( ON ?auto_2027225 ?auto_2027224 ) ( ON ?auto_2027226 ?auto_2027225 ) ( not ( = ?auto_2027221 ?auto_2027222 ) ) ( not ( = ?auto_2027221 ?auto_2027223 ) ) ( not ( = ?auto_2027221 ?auto_2027224 ) ) ( not ( = ?auto_2027221 ?auto_2027225 ) ) ( not ( = ?auto_2027221 ?auto_2027226 ) ) ( not ( = ?auto_2027221 ?auto_2027227 ) ) ( not ( = ?auto_2027221 ?auto_2027228 ) ) ( not ( = ?auto_2027222 ?auto_2027223 ) ) ( not ( = ?auto_2027222 ?auto_2027224 ) ) ( not ( = ?auto_2027222 ?auto_2027225 ) ) ( not ( = ?auto_2027222 ?auto_2027226 ) ) ( not ( = ?auto_2027222 ?auto_2027227 ) ) ( not ( = ?auto_2027222 ?auto_2027228 ) ) ( not ( = ?auto_2027223 ?auto_2027224 ) ) ( not ( = ?auto_2027223 ?auto_2027225 ) ) ( not ( = ?auto_2027223 ?auto_2027226 ) ) ( not ( = ?auto_2027223 ?auto_2027227 ) ) ( not ( = ?auto_2027223 ?auto_2027228 ) ) ( not ( = ?auto_2027224 ?auto_2027225 ) ) ( not ( = ?auto_2027224 ?auto_2027226 ) ) ( not ( = ?auto_2027224 ?auto_2027227 ) ) ( not ( = ?auto_2027224 ?auto_2027228 ) ) ( not ( = ?auto_2027225 ?auto_2027226 ) ) ( not ( = ?auto_2027225 ?auto_2027227 ) ) ( not ( = ?auto_2027225 ?auto_2027228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027226 ?auto_2027227 ?auto_2027228 )
      ( MAKE-7CRATE-VERIFY ?auto_2027221 ?auto_2027222 ?auto_2027223 ?auto_2027224 ?auto_2027225 ?auto_2027226 ?auto_2027227 ?auto_2027228 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027298 - SURFACE
      ?auto_2027299 - SURFACE
      ?auto_2027300 - SURFACE
      ?auto_2027301 - SURFACE
      ?auto_2027302 - SURFACE
      ?auto_2027303 - SURFACE
      ?auto_2027304 - SURFACE
      ?auto_2027305 - SURFACE
    )
    :vars
    (
      ?auto_2027309 - HOIST
      ?auto_2027310 - PLACE
      ?auto_2027308 - TRUCK
      ?auto_2027311 - PLACE
      ?auto_2027307 - HOIST
      ?auto_2027306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027309 ?auto_2027310 ) ( SURFACE-AT ?auto_2027304 ?auto_2027310 ) ( CLEAR ?auto_2027304 ) ( IS-CRATE ?auto_2027305 ) ( not ( = ?auto_2027304 ?auto_2027305 ) ) ( AVAILABLE ?auto_2027309 ) ( ON ?auto_2027304 ?auto_2027303 ) ( not ( = ?auto_2027303 ?auto_2027304 ) ) ( not ( = ?auto_2027303 ?auto_2027305 ) ) ( TRUCK-AT ?auto_2027308 ?auto_2027311 ) ( not ( = ?auto_2027311 ?auto_2027310 ) ) ( HOIST-AT ?auto_2027307 ?auto_2027311 ) ( not ( = ?auto_2027309 ?auto_2027307 ) ) ( AVAILABLE ?auto_2027307 ) ( SURFACE-AT ?auto_2027305 ?auto_2027311 ) ( ON ?auto_2027305 ?auto_2027306 ) ( CLEAR ?auto_2027305 ) ( not ( = ?auto_2027304 ?auto_2027306 ) ) ( not ( = ?auto_2027305 ?auto_2027306 ) ) ( not ( = ?auto_2027303 ?auto_2027306 ) ) ( ON ?auto_2027299 ?auto_2027298 ) ( ON ?auto_2027300 ?auto_2027299 ) ( ON ?auto_2027301 ?auto_2027300 ) ( ON ?auto_2027302 ?auto_2027301 ) ( ON ?auto_2027303 ?auto_2027302 ) ( not ( = ?auto_2027298 ?auto_2027299 ) ) ( not ( = ?auto_2027298 ?auto_2027300 ) ) ( not ( = ?auto_2027298 ?auto_2027301 ) ) ( not ( = ?auto_2027298 ?auto_2027302 ) ) ( not ( = ?auto_2027298 ?auto_2027303 ) ) ( not ( = ?auto_2027298 ?auto_2027304 ) ) ( not ( = ?auto_2027298 ?auto_2027305 ) ) ( not ( = ?auto_2027298 ?auto_2027306 ) ) ( not ( = ?auto_2027299 ?auto_2027300 ) ) ( not ( = ?auto_2027299 ?auto_2027301 ) ) ( not ( = ?auto_2027299 ?auto_2027302 ) ) ( not ( = ?auto_2027299 ?auto_2027303 ) ) ( not ( = ?auto_2027299 ?auto_2027304 ) ) ( not ( = ?auto_2027299 ?auto_2027305 ) ) ( not ( = ?auto_2027299 ?auto_2027306 ) ) ( not ( = ?auto_2027300 ?auto_2027301 ) ) ( not ( = ?auto_2027300 ?auto_2027302 ) ) ( not ( = ?auto_2027300 ?auto_2027303 ) ) ( not ( = ?auto_2027300 ?auto_2027304 ) ) ( not ( = ?auto_2027300 ?auto_2027305 ) ) ( not ( = ?auto_2027300 ?auto_2027306 ) ) ( not ( = ?auto_2027301 ?auto_2027302 ) ) ( not ( = ?auto_2027301 ?auto_2027303 ) ) ( not ( = ?auto_2027301 ?auto_2027304 ) ) ( not ( = ?auto_2027301 ?auto_2027305 ) ) ( not ( = ?auto_2027301 ?auto_2027306 ) ) ( not ( = ?auto_2027302 ?auto_2027303 ) ) ( not ( = ?auto_2027302 ?auto_2027304 ) ) ( not ( = ?auto_2027302 ?auto_2027305 ) ) ( not ( = ?auto_2027302 ?auto_2027306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027303 ?auto_2027304 ?auto_2027305 )
      ( MAKE-7CRATE-VERIFY ?auto_2027298 ?auto_2027299 ?auto_2027300 ?auto_2027301 ?auto_2027302 ?auto_2027303 ?auto_2027304 ?auto_2027305 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027376 - SURFACE
      ?auto_2027377 - SURFACE
      ?auto_2027378 - SURFACE
      ?auto_2027379 - SURFACE
      ?auto_2027380 - SURFACE
      ?auto_2027381 - SURFACE
      ?auto_2027382 - SURFACE
      ?auto_2027383 - SURFACE
    )
    :vars
    (
      ?auto_2027388 - HOIST
      ?auto_2027385 - PLACE
      ?auto_2027386 - PLACE
      ?auto_2027384 - HOIST
      ?auto_2027387 - SURFACE
      ?auto_2027389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027388 ?auto_2027385 ) ( SURFACE-AT ?auto_2027382 ?auto_2027385 ) ( CLEAR ?auto_2027382 ) ( IS-CRATE ?auto_2027383 ) ( not ( = ?auto_2027382 ?auto_2027383 ) ) ( AVAILABLE ?auto_2027388 ) ( ON ?auto_2027382 ?auto_2027381 ) ( not ( = ?auto_2027381 ?auto_2027382 ) ) ( not ( = ?auto_2027381 ?auto_2027383 ) ) ( not ( = ?auto_2027386 ?auto_2027385 ) ) ( HOIST-AT ?auto_2027384 ?auto_2027386 ) ( not ( = ?auto_2027388 ?auto_2027384 ) ) ( AVAILABLE ?auto_2027384 ) ( SURFACE-AT ?auto_2027383 ?auto_2027386 ) ( ON ?auto_2027383 ?auto_2027387 ) ( CLEAR ?auto_2027383 ) ( not ( = ?auto_2027382 ?auto_2027387 ) ) ( not ( = ?auto_2027383 ?auto_2027387 ) ) ( not ( = ?auto_2027381 ?auto_2027387 ) ) ( TRUCK-AT ?auto_2027389 ?auto_2027385 ) ( ON ?auto_2027377 ?auto_2027376 ) ( ON ?auto_2027378 ?auto_2027377 ) ( ON ?auto_2027379 ?auto_2027378 ) ( ON ?auto_2027380 ?auto_2027379 ) ( ON ?auto_2027381 ?auto_2027380 ) ( not ( = ?auto_2027376 ?auto_2027377 ) ) ( not ( = ?auto_2027376 ?auto_2027378 ) ) ( not ( = ?auto_2027376 ?auto_2027379 ) ) ( not ( = ?auto_2027376 ?auto_2027380 ) ) ( not ( = ?auto_2027376 ?auto_2027381 ) ) ( not ( = ?auto_2027376 ?auto_2027382 ) ) ( not ( = ?auto_2027376 ?auto_2027383 ) ) ( not ( = ?auto_2027376 ?auto_2027387 ) ) ( not ( = ?auto_2027377 ?auto_2027378 ) ) ( not ( = ?auto_2027377 ?auto_2027379 ) ) ( not ( = ?auto_2027377 ?auto_2027380 ) ) ( not ( = ?auto_2027377 ?auto_2027381 ) ) ( not ( = ?auto_2027377 ?auto_2027382 ) ) ( not ( = ?auto_2027377 ?auto_2027383 ) ) ( not ( = ?auto_2027377 ?auto_2027387 ) ) ( not ( = ?auto_2027378 ?auto_2027379 ) ) ( not ( = ?auto_2027378 ?auto_2027380 ) ) ( not ( = ?auto_2027378 ?auto_2027381 ) ) ( not ( = ?auto_2027378 ?auto_2027382 ) ) ( not ( = ?auto_2027378 ?auto_2027383 ) ) ( not ( = ?auto_2027378 ?auto_2027387 ) ) ( not ( = ?auto_2027379 ?auto_2027380 ) ) ( not ( = ?auto_2027379 ?auto_2027381 ) ) ( not ( = ?auto_2027379 ?auto_2027382 ) ) ( not ( = ?auto_2027379 ?auto_2027383 ) ) ( not ( = ?auto_2027379 ?auto_2027387 ) ) ( not ( = ?auto_2027380 ?auto_2027381 ) ) ( not ( = ?auto_2027380 ?auto_2027382 ) ) ( not ( = ?auto_2027380 ?auto_2027383 ) ) ( not ( = ?auto_2027380 ?auto_2027387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027381 ?auto_2027382 ?auto_2027383 )
      ( MAKE-7CRATE-VERIFY ?auto_2027376 ?auto_2027377 ?auto_2027378 ?auto_2027379 ?auto_2027380 ?auto_2027381 ?auto_2027382 ?auto_2027383 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027454 - SURFACE
      ?auto_2027455 - SURFACE
      ?auto_2027456 - SURFACE
      ?auto_2027457 - SURFACE
      ?auto_2027458 - SURFACE
      ?auto_2027459 - SURFACE
      ?auto_2027460 - SURFACE
      ?auto_2027461 - SURFACE
    )
    :vars
    (
      ?auto_2027467 - HOIST
      ?auto_2027464 - PLACE
      ?auto_2027463 - PLACE
      ?auto_2027466 - HOIST
      ?auto_2027462 - SURFACE
      ?auto_2027465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027467 ?auto_2027464 ) ( IS-CRATE ?auto_2027461 ) ( not ( = ?auto_2027460 ?auto_2027461 ) ) ( not ( = ?auto_2027459 ?auto_2027460 ) ) ( not ( = ?auto_2027459 ?auto_2027461 ) ) ( not ( = ?auto_2027463 ?auto_2027464 ) ) ( HOIST-AT ?auto_2027466 ?auto_2027463 ) ( not ( = ?auto_2027467 ?auto_2027466 ) ) ( AVAILABLE ?auto_2027466 ) ( SURFACE-AT ?auto_2027461 ?auto_2027463 ) ( ON ?auto_2027461 ?auto_2027462 ) ( CLEAR ?auto_2027461 ) ( not ( = ?auto_2027460 ?auto_2027462 ) ) ( not ( = ?auto_2027461 ?auto_2027462 ) ) ( not ( = ?auto_2027459 ?auto_2027462 ) ) ( TRUCK-AT ?auto_2027465 ?auto_2027464 ) ( SURFACE-AT ?auto_2027459 ?auto_2027464 ) ( CLEAR ?auto_2027459 ) ( LIFTING ?auto_2027467 ?auto_2027460 ) ( IS-CRATE ?auto_2027460 ) ( ON ?auto_2027455 ?auto_2027454 ) ( ON ?auto_2027456 ?auto_2027455 ) ( ON ?auto_2027457 ?auto_2027456 ) ( ON ?auto_2027458 ?auto_2027457 ) ( ON ?auto_2027459 ?auto_2027458 ) ( not ( = ?auto_2027454 ?auto_2027455 ) ) ( not ( = ?auto_2027454 ?auto_2027456 ) ) ( not ( = ?auto_2027454 ?auto_2027457 ) ) ( not ( = ?auto_2027454 ?auto_2027458 ) ) ( not ( = ?auto_2027454 ?auto_2027459 ) ) ( not ( = ?auto_2027454 ?auto_2027460 ) ) ( not ( = ?auto_2027454 ?auto_2027461 ) ) ( not ( = ?auto_2027454 ?auto_2027462 ) ) ( not ( = ?auto_2027455 ?auto_2027456 ) ) ( not ( = ?auto_2027455 ?auto_2027457 ) ) ( not ( = ?auto_2027455 ?auto_2027458 ) ) ( not ( = ?auto_2027455 ?auto_2027459 ) ) ( not ( = ?auto_2027455 ?auto_2027460 ) ) ( not ( = ?auto_2027455 ?auto_2027461 ) ) ( not ( = ?auto_2027455 ?auto_2027462 ) ) ( not ( = ?auto_2027456 ?auto_2027457 ) ) ( not ( = ?auto_2027456 ?auto_2027458 ) ) ( not ( = ?auto_2027456 ?auto_2027459 ) ) ( not ( = ?auto_2027456 ?auto_2027460 ) ) ( not ( = ?auto_2027456 ?auto_2027461 ) ) ( not ( = ?auto_2027456 ?auto_2027462 ) ) ( not ( = ?auto_2027457 ?auto_2027458 ) ) ( not ( = ?auto_2027457 ?auto_2027459 ) ) ( not ( = ?auto_2027457 ?auto_2027460 ) ) ( not ( = ?auto_2027457 ?auto_2027461 ) ) ( not ( = ?auto_2027457 ?auto_2027462 ) ) ( not ( = ?auto_2027458 ?auto_2027459 ) ) ( not ( = ?auto_2027458 ?auto_2027460 ) ) ( not ( = ?auto_2027458 ?auto_2027461 ) ) ( not ( = ?auto_2027458 ?auto_2027462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027459 ?auto_2027460 ?auto_2027461 )
      ( MAKE-7CRATE-VERIFY ?auto_2027454 ?auto_2027455 ?auto_2027456 ?auto_2027457 ?auto_2027458 ?auto_2027459 ?auto_2027460 ?auto_2027461 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027532 - SURFACE
      ?auto_2027533 - SURFACE
      ?auto_2027534 - SURFACE
      ?auto_2027535 - SURFACE
      ?auto_2027536 - SURFACE
      ?auto_2027537 - SURFACE
      ?auto_2027538 - SURFACE
      ?auto_2027539 - SURFACE
    )
    :vars
    (
      ?auto_2027543 - HOIST
      ?auto_2027541 - PLACE
      ?auto_2027542 - PLACE
      ?auto_2027544 - HOIST
      ?auto_2027540 - SURFACE
      ?auto_2027545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027543 ?auto_2027541 ) ( IS-CRATE ?auto_2027539 ) ( not ( = ?auto_2027538 ?auto_2027539 ) ) ( not ( = ?auto_2027537 ?auto_2027538 ) ) ( not ( = ?auto_2027537 ?auto_2027539 ) ) ( not ( = ?auto_2027542 ?auto_2027541 ) ) ( HOIST-AT ?auto_2027544 ?auto_2027542 ) ( not ( = ?auto_2027543 ?auto_2027544 ) ) ( AVAILABLE ?auto_2027544 ) ( SURFACE-AT ?auto_2027539 ?auto_2027542 ) ( ON ?auto_2027539 ?auto_2027540 ) ( CLEAR ?auto_2027539 ) ( not ( = ?auto_2027538 ?auto_2027540 ) ) ( not ( = ?auto_2027539 ?auto_2027540 ) ) ( not ( = ?auto_2027537 ?auto_2027540 ) ) ( TRUCK-AT ?auto_2027545 ?auto_2027541 ) ( SURFACE-AT ?auto_2027537 ?auto_2027541 ) ( CLEAR ?auto_2027537 ) ( IS-CRATE ?auto_2027538 ) ( AVAILABLE ?auto_2027543 ) ( IN ?auto_2027538 ?auto_2027545 ) ( ON ?auto_2027533 ?auto_2027532 ) ( ON ?auto_2027534 ?auto_2027533 ) ( ON ?auto_2027535 ?auto_2027534 ) ( ON ?auto_2027536 ?auto_2027535 ) ( ON ?auto_2027537 ?auto_2027536 ) ( not ( = ?auto_2027532 ?auto_2027533 ) ) ( not ( = ?auto_2027532 ?auto_2027534 ) ) ( not ( = ?auto_2027532 ?auto_2027535 ) ) ( not ( = ?auto_2027532 ?auto_2027536 ) ) ( not ( = ?auto_2027532 ?auto_2027537 ) ) ( not ( = ?auto_2027532 ?auto_2027538 ) ) ( not ( = ?auto_2027532 ?auto_2027539 ) ) ( not ( = ?auto_2027532 ?auto_2027540 ) ) ( not ( = ?auto_2027533 ?auto_2027534 ) ) ( not ( = ?auto_2027533 ?auto_2027535 ) ) ( not ( = ?auto_2027533 ?auto_2027536 ) ) ( not ( = ?auto_2027533 ?auto_2027537 ) ) ( not ( = ?auto_2027533 ?auto_2027538 ) ) ( not ( = ?auto_2027533 ?auto_2027539 ) ) ( not ( = ?auto_2027533 ?auto_2027540 ) ) ( not ( = ?auto_2027534 ?auto_2027535 ) ) ( not ( = ?auto_2027534 ?auto_2027536 ) ) ( not ( = ?auto_2027534 ?auto_2027537 ) ) ( not ( = ?auto_2027534 ?auto_2027538 ) ) ( not ( = ?auto_2027534 ?auto_2027539 ) ) ( not ( = ?auto_2027534 ?auto_2027540 ) ) ( not ( = ?auto_2027535 ?auto_2027536 ) ) ( not ( = ?auto_2027535 ?auto_2027537 ) ) ( not ( = ?auto_2027535 ?auto_2027538 ) ) ( not ( = ?auto_2027535 ?auto_2027539 ) ) ( not ( = ?auto_2027535 ?auto_2027540 ) ) ( not ( = ?auto_2027536 ?auto_2027537 ) ) ( not ( = ?auto_2027536 ?auto_2027538 ) ) ( not ( = ?auto_2027536 ?auto_2027539 ) ) ( not ( = ?auto_2027536 ?auto_2027540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027537 ?auto_2027538 ?auto_2027539 )
      ( MAKE-7CRATE-VERIFY ?auto_2027532 ?auto_2027533 ?auto_2027534 ?auto_2027535 ?auto_2027536 ?auto_2027537 ?auto_2027538 ?auto_2027539 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030451 - SURFACE
      ?auto_2030452 - SURFACE
      ?auto_2030453 - SURFACE
      ?auto_2030454 - SURFACE
      ?auto_2030455 - SURFACE
      ?auto_2030456 - SURFACE
      ?auto_2030457 - SURFACE
      ?auto_2030458 - SURFACE
      ?auto_2030459 - SURFACE
    )
    :vars
    (
      ?auto_2030460 - HOIST
      ?auto_2030461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030460 ?auto_2030461 ) ( SURFACE-AT ?auto_2030458 ?auto_2030461 ) ( CLEAR ?auto_2030458 ) ( LIFTING ?auto_2030460 ?auto_2030459 ) ( IS-CRATE ?auto_2030459 ) ( not ( = ?auto_2030458 ?auto_2030459 ) ) ( ON ?auto_2030452 ?auto_2030451 ) ( ON ?auto_2030453 ?auto_2030452 ) ( ON ?auto_2030454 ?auto_2030453 ) ( ON ?auto_2030455 ?auto_2030454 ) ( ON ?auto_2030456 ?auto_2030455 ) ( ON ?auto_2030457 ?auto_2030456 ) ( ON ?auto_2030458 ?auto_2030457 ) ( not ( = ?auto_2030451 ?auto_2030452 ) ) ( not ( = ?auto_2030451 ?auto_2030453 ) ) ( not ( = ?auto_2030451 ?auto_2030454 ) ) ( not ( = ?auto_2030451 ?auto_2030455 ) ) ( not ( = ?auto_2030451 ?auto_2030456 ) ) ( not ( = ?auto_2030451 ?auto_2030457 ) ) ( not ( = ?auto_2030451 ?auto_2030458 ) ) ( not ( = ?auto_2030451 ?auto_2030459 ) ) ( not ( = ?auto_2030452 ?auto_2030453 ) ) ( not ( = ?auto_2030452 ?auto_2030454 ) ) ( not ( = ?auto_2030452 ?auto_2030455 ) ) ( not ( = ?auto_2030452 ?auto_2030456 ) ) ( not ( = ?auto_2030452 ?auto_2030457 ) ) ( not ( = ?auto_2030452 ?auto_2030458 ) ) ( not ( = ?auto_2030452 ?auto_2030459 ) ) ( not ( = ?auto_2030453 ?auto_2030454 ) ) ( not ( = ?auto_2030453 ?auto_2030455 ) ) ( not ( = ?auto_2030453 ?auto_2030456 ) ) ( not ( = ?auto_2030453 ?auto_2030457 ) ) ( not ( = ?auto_2030453 ?auto_2030458 ) ) ( not ( = ?auto_2030453 ?auto_2030459 ) ) ( not ( = ?auto_2030454 ?auto_2030455 ) ) ( not ( = ?auto_2030454 ?auto_2030456 ) ) ( not ( = ?auto_2030454 ?auto_2030457 ) ) ( not ( = ?auto_2030454 ?auto_2030458 ) ) ( not ( = ?auto_2030454 ?auto_2030459 ) ) ( not ( = ?auto_2030455 ?auto_2030456 ) ) ( not ( = ?auto_2030455 ?auto_2030457 ) ) ( not ( = ?auto_2030455 ?auto_2030458 ) ) ( not ( = ?auto_2030455 ?auto_2030459 ) ) ( not ( = ?auto_2030456 ?auto_2030457 ) ) ( not ( = ?auto_2030456 ?auto_2030458 ) ) ( not ( = ?auto_2030456 ?auto_2030459 ) ) ( not ( = ?auto_2030457 ?auto_2030458 ) ) ( not ( = ?auto_2030457 ?auto_2030459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2030458 ?auto_2030459 )
      ( MAKE-8CRATE-VERIFY ?auto_2030451 ?auto_2030452 ?auto_2030453 ?auto_2030454 ?auto_2030455 ?auto_2030456 ?auto_2030457 ?auto_2030458 ?auto_2030459 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030518 - SURFACE
      ?auto_2030519 - SURFACE
      ?auto_2030520 - SURFACE
      ?auto_2030521 - SURFACE
      ?auto_2030522 - SURFACE
      ?auto_2030523 - SURFACE
      ?auto_2030524 - SURFACE
      ?auto_2030525 - SURFACE
      ?auto_2030526 - SURFACE
    )
    :vars
    (
      ?auto_2030528 - HOIST
      ?auto_2030527 - PLACE
      ?auto_2030529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030528 ?auto_2030527 ) ( SURFACE-AT ?auto_2030525 ?auto_2030527 ) ( CLEAR ?auto_2030525 ) ( IS-CRATE ?auto_2030526 ) ( not ( = ?auto_2030525 ?auto_2030526 ) ) ( TRUCK-AT ?auto_2030529 ?auto_2030527 ) ( AVAILABLE ?auto_2030528 ) ( IN ?auto_2030526 ?auto_2030529 ) ( ON ?auto_2030525 ?auto_2030524 ) ( not ( = ?auto_2030524 ?auto_2030525 ) ) ( not ( = ?auto_2030524 ?auto_2030526 ) ) ( ON ?auto_2030519 ?auto_2030518 ) ( ON ?auto_2030520 ?auto_2030519 ) ( ON ?auto_2030521 ?auto_2030520 ) ( ON ?auto_2030522 ?auto_2030521 ) ( ON ?auto_2030523 ?auto_2030522 ) ( ON ?auto_2030524 ?auto_2030523 ) ( not ( = ?auto_2030518 ?auto_2030519 ) ) ( not ( = ?auto_2030518 ?auto_2030520 ) ) ( not ( = ?auto_2030518 ?auto_2030521 ) ) ( not ( = ?auto_2030518 ?auto_2030522 ) ) ( not ( = ?auto_2030518 ?auto_2030523 ) ) ( not ( = ?auto_2030518 ?auto_2030524 ) ) ( not ( = ?auto_2030518 ?auto_2030525 ) ) ( not ( = ?auto_2030518 ?auto_2030526 ) ) ( not ( = ?auto_2030519 ?auto_2030520 ) ) ( not ( = ?auto_2030519 ?auto_2030521 ) ) ( not ( = ?auto_2030519 ?auto_2030522 ) ) ( not ( = ?auto_2030519 ?auto_2030523 ) ) ( not ( = ?auto_2030519 ?auto_2030524 ) ) ( not ( = ?auto_2030519 ?auto_2030525 ) ) ( not ( = ?auto_2030519 ?auto_2030526 ) ) ( not ( = ?auto_2030520 ?auto_2030521 ) ) ( not ( = ?auto_2030520 ?auto_2030522 ) ) ( not ( = ?auto_2030520 ?auto_2030523 ) ) ( not ( = ?auto_2030520 ?auto_2030524 ) ) ( not ( = ?auto_2030520 ?auto_2030525 ) ) ( not ( = ?auto_2030520 ?auto_2030526 ) ) ( not ( = ?auto_2030521 ?auto_2030522 ) ) ( not ( = ?auto_2030521 ?auto_2030523 ) ) ( not ( = ?auto_2030521 ?auto_2030524 ) ) ( not ( = ?auto_2030521 ?auto_2030525 ) ) ( not ( = ?auto_2030521 ?auto_2030526 ) ) ( not ( = ?auto_2030522 ?auto_2030523 ) ) ( not ( = ?auto_2030522 ?auto_2030524 ) ) ( not ( = ?auto_2030522 ?auto_2030525 ) ) ( not ( = ?auto_2030522 ?auto_2030526 ) ) ( not ( = ?auto_2030523 ?auto_2030524 ) ) ( not ( = ?auto_2030523 ?auto_2030525 ) ) ( not ( = ?auto_2030523 ?auto_2030526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030524 ?auto_2030525 ?auto_2030526 )
      ( MAKE-8CRATE-VERIFY ?auto_2030518 ?auto_2030519 ?auto_2030520 ?auto_2030521 ?auto_2030522 ?auto_2030523 ?auto_2030524 ?auto_2030525 ?auto_2030526 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030594 - SURFACE
      ?auto_2030595 - SURFACE
      ?auto_2030596 - SURFACE
      ?auto_2030597 - SURFACE
      ?auto_2030598 - SURFACE
      ?auto_2030599 - SURFACE
      ?auto_2030600 - SURFACE
      ?auto_2030601 - SURFACE
      ?auto_2030602 - SURFACE
    )
    :vars
    (
      ?auto_2030604 - HOIST
      ?auto_2030606 - PLACE
      ?auto_2030603 - TRUCK
      ?auto_2030605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030604 ?auto_2030606 ) ( SURFACE-AT ?auto_2030601 ?auto_2030606 ) ( CLEAR ?auto_2030601 ) ( IS-CRATE ?auto_2030602 ) ( not ( = ?auto_2030601 ?auto_2030602 ) ) ( AVAILABLE ?auto_2030604 ) ( IN ?auto_2030602 ?auto_2030603 ) ( ON ?auto_2030601 ?auto_2030600 ) ( not ( = ?auto_2030600 ?auto_2030601 ) ) ( not ( = ?auto_2030600 ?auto_2030602 ) ) ( TRUCK-AT ?auto_2030603 ?auto_2030605 ) ( not ( = ?auto_2030605 ?auto_2030606 ) ) ( ON ?auto_2030595 ?auto_2030594 ) ( ON ?auto_2030596 ?auto_2030595 ) ( ON ?auto_2030597 ?auto_2030596 ) ( ON ?auto_2030598 ?auto_2030597 ) ( ON ?auto_2030599 ?auto_2030598 ) ( ON ?auto_2030600 ?auto_2030599 ) ( not ( = ?auto_2030594 ?auto_2030595 ) ) ( not ( = ?auto_2030594 ?auto_2030596 ) ) ( not ( = ?auto_2030594 ?auto_2030597 ) ) ( not ( = ?auto_2030594 ?auto_2030598 ) ) ( not ( = ?auto_2030594 ?auto_2030599 ) ) ( not ( = ?auto_2030594 ?auto_2030600 ) ) ( not ( = ?auto_2030594 ?auto_2030601 ) ) ( not ( = ?auto_2030594 ?auto_2030602 ) ) ( not ( = ?auto_2030595 ?auto_2030596 ) ) ( not ( = ?auto_2030595 ?auto_2030597 ) ) ( not ( = ?auto_2030595 ?auto_2030598 ) ) ( not ( = ?auto_2030595 ?auto_2030599 ) ) ( not ( = ?auto_2030595 ?auto_2030600 ) ) ( not ( = ?auto_2030595 ?auto_2030601 ) ) ( not ( = ?auto_2030595 ?auto_2030602 ) ) ( not ( = ?auto_2030596 ?auto_2030597 ) ) ( not ( = ?auto_2030596 ?auto_2030598 ) ) ( not ( = ?auto_2030596 ?auto_2030599 ) ) ( not ( = ?auto_2030596 ?auto_2030600 ) ) ( not ( = ?auto_2030596 ?auto_2030601 ) ) ( not ( = ?auto_2030596 ?auto_2030602 ) ) ( not ( = ?auto_2030597 ?auto_2030598 ) ) ( not ( = ?auto_2030597 ?auto_2030599 ) ) ( not ( = ?auto_2030597 ?auto_2030600 ) ) ( not ( = ?auto_2030597 ?auto_2030601 ) ) ( not ( = ?auto_2030597 ?auto_2030602 ) ) ( not ( = ?auto_2030598 ?auto_2030599 ) ) ( not ( = ?auto_2030598 ?auto_2030600 ) ) ( not ( = ?auto_2030598 ?auto_2030601 ) ) ( not ( = ?auto_2030598 ?auto_2030602 ) ) ( not ( = ?auto_2030599 ?auto_2030600 ) ) ( not ( = ?auto_2030599 ?auto_2030601 ) ) ( not ( = ?auto_2030599 ?auto_2030602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030600 ?auto_2030601 ?auto_2030602 )
      ( MAKE-8CRATE-VERIFY ?auto_2030594 ?auto_2030595 ?auto_2030596 ?auto_2030597 ?auto_2030598 ?auto_2030599 ?auto_2030600 ?auto_2030601 ?auto_2030602 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030678 - SURFACE
      ?auto_2030679 - SURFACE
      ?auto_2030680 - SURFACE
      ?auto_2030681 - SURFACE
      ?auto_2030682 - SURFACE
      ?auto_2030683 - SURFACE
      ?auto_2030684 - SURFACE
      ?auto_2030685 - SURFACE
      ?auto_2030686 - SURFACE
    )
    :vars
    (
      ?auto_2030690 - HOIST
      ?auto_2030687 - PLACE
      ?auto_2030689 - TRUCK
      ?auto_2030691 - PLACE
      ?auto_2030688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030690 ?auto_2030687 ) ( SURFACE-AT ?auto_2030685 ?auto_2030687 ) ( CLEAR ?auto_2030685 ) ( IS-CRATE ?auto_2030686 ) ( not ( = ?auto_2030685 ?auto_2030686 ) ) ( AVAILABLE ?auto_2030690 ) ( ON ?auto_2030685 ?auto_2030684 ) ( not ( = ?auto_2030684 ?auto_2030685 ) ) ( not ( = ?auto_2030684 ?auto_2030686 ) ) ( TRUCK-AT ?auto_2030689 ?auto_2030691 ) ( not ( = ?auto_2030691 ?auto_2030687 ) ) ( HOIST-AT ?auto_2030688 ?auto_2030691 ) ( LIFTING ?auto_2030688 ?auto_2030686 ) ( not ( = ?auto_2030690 ?auto_2030688 ) ) ( ON ?auto_2030679 ?auto_2030678 ) ( ON ?auto_2030680 ?auto_2030679 ) ( ON ?auto_2030681 ?auto_2030680 ) ( ON ?auto_2030682 ?auto_2030681 ) ( ON ?auto_2030683 ?auto_2030682 ) ( ON ?auto_2030684 ?auto_2030683 ) ( not ( = ?auto_2030678 ?auto_2030679 ) ) ( not ( = ?auto_2030678 ?auto_2030680 ) ) ( not ( = ?auto_2030678 ?auto_2030681 ) ) ( not ( = ?auto_2030678 ?auto_2030682 ) ) ( not ( = ?auto_2030678 ?auto_2030683 ) ) ( not ( = ?auto_2030678 ?auto_2030684 ) ) ( not ( = ?auto_2030678 ?auto_2030685 ) ) ( not ( = ?auto_2030678 ?auto_2030686 ) ) ( not ( = ?auto_2030679 ?auto_2030680 ) ) ( not ( = ?auto_2030679 ?auto_2030681 ) ) ( not ( = ?auto_2030679 ?auto_2030682 ) ) ( not ( = ?auto_2030679 ?auto_2030683 ) ) ( not ( = ?auto_2030679 ?auto_2030684 ) ) ( not ( = ?auto_2030679 ?auto_2030685 ) ) ( not ( = ?auto_2030679 ?auto_2030686 ) ) ( not ( = ?auto_2030680 ?auto_2030681 ) ) ( not ( = ?auto_2030680 ?auto_2030682 ) ) ( not ( = ?auto_2030680 ?auto_2030683 ) ) ( not ( = ?auto_2030680 ?auto_2030684 ) ) ( not ( = ?auto_2030680 ?auto_2030685 ) ) ( not ( = ?auto_2030680 ?auto_2030686 ) ) ( not ( = ?auto_2030681 ?auto_2030682 ) ) ( not ( = ?auto_2030681 ?auto_2030683 ) ) ( not ( = ?auto_2030681 ?auto_2030684 ) ) ( not ( = ?auto_2030681 ?auto_2030685 ) ) ( not ( = ?auto_2030681 ?auto_2030686 ) ) ( not ( = ?auto_2030682 ?auto_2030683 ) ) ( not ( = ?auto_2030682 ?auto_2030684 ) ) ( not ( = ?auto_2030682 ?auto_2030685 ) ) ( not ( = ?auto_2030682 ?auto_2030686 ) ) ( not ( = ?auto_2030683 ?auto_2030684 ) ) ( not ( = ?auto_2030683 ?auto_2030685 ) ) ( not ( = ?auto_2030683 ?auto_2030686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030684 ?auto_2030685 ?auto_2030686 )
      ( MAKE-8CRATE-VERIFY ?auto_2030678 ?auto_2030679 ?auto_2030680 ?auto_2030681 ?auto_2030682 ?auto_2030683 ?auto_2030684 ?auto_2030685 ?auto_2030686 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030770 - SURFACE
      ?auto_2030771 - SURFACE
      ?auto_2030772 - SURFACE
      ?auto_2030773 - SURFACE
      ?auto_2030774 - SURFACE
      ?auto_2030775 - SURFACE
      ?auto_2030776 - SURFACE
      ?auto_2030777 - SURFACE
      ?auto_2030778 - SURFACE
    )
    :vars
    (
      ?auto_2030782 - HOIST
      ?auto_2030784 - PLACE
      ?auto_2030783 - TRUCK
      ?auto_2030780 - PLACE
      ?auto_2030781 - HOIST
      ?auto_2030779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030782 ?auto_2030784 ) ( SURFACE-AT ?auto_2030777 ?auto_2030784 ) ( CLEAR ?auto_2030777 ) ( IS-CRATE ?auto_2030778 ) ( not ( = ?auto_2030777 ?auto_2030778 ) ) ( AVAILABLE ?auto_2030782 ) ( ON ?auto_2030777 ?auto_2030776 ) ( not ( = ?auto_2030776 ?auto_2030777 ) ) ( not ( = ?auto_2030776 ?auto_2030778 ) ) ( TRUCK-AT ?auto_2030783 ?auto_2030780 ) ( not ( = ?auto_2030780 ?auto_2030784 ) ) ( HOIST-AT ?auto_2030781 ?auto_2030780 ) ( not ( = ?auto_2030782 ?auto_2030781 ) ) ( AVAILABLE ?auto_2030781 ) ( SURFACE-AT ?auto_2030778 ?auto_2030780 ) ( ON ?auto_2030778 ?auto_2030779 ) ( CLEAR ?auto_2030778 ) ( not ( = ?auto_2030777 ?auto_2030779 ) ) ( not ( = ?auto_2030778 ?auto_2030779 ) ) ( not ( = ?auto_2030776 ?auto_2030779 ) ) ( ON ?auto_2030771 ?auto_2030770 ) ( ON ?auto_2030772 ?auto_2030771 ) ( ON ?auto_2030773 ?auto_2030772 ) ( ON ?auto_2030774 ?auto_2030773 ) ( ON ?auto_2030775 ?auto_2030774 ) ( ON ?auto_2030776 ?auto_2030775 ) ( not ( = ?auto_2030770 ?auto_2030771 ) ) ( not ( = ?auto_2030770 ?auto_2030772 ) ) ( not ( = ?auto_2030770 ?auto_2030773 ) ) ( not ( = ?auto_2030770 ?auto_2030774 ) ) ( not ( = ?auto_2030770 ?auto_2030775 ) ) ( not ( = ?auto_2030770 ?auto_2030776 ) ) ( not ( = ?auto_2030770 ?auto_2030777 ) ) ( not ( = ?auto_2030770 ?auto_2030778 ) ) ( not ( = ?auto_2030770 ?auto_2030779 ) ) ( not ( = ?auto_2030771 ?auto_2030772 ) ) ( not ( = ?auto_2030771 ?auto_2030773 ) ) ( not ( = ?auto_2030771 ?auto_2030774 ) ) ( not ( = ?auto_2030771 ?auto_2030775 ) ) ( not ( = ?auto_2030771 ?auto_2030776 ) ) ( not ( = ?auto_2030771 ?auto_2030777 ) ) ( not ( = ?auto_2030771 ?auto_2030778 ) ) ( not ( = ?auto_2030771 ?auto_2030779 ) ) ( not ( = ?auto_2030772 ?auto_2030773 ) ) ( not ( = ?auto_2030772 ?auto_2030774 ) ) ( not ( = ?auto_2030772 ?auto_2030775 ) ) ( not ( = ?auto_2030772 ?auto_2030776 ) ) ( not ( = ?auto_2030772 ?auto_2030777 ) ) ( not ( = ?auto_2030772 ?auto_2030778 ) ) ( not ( = ?auto_2030772 ?auto_2030779 ) ) ( not ( = ?auto_2030773 ?auto_2030774 ) ) ( not ( = ?auto_2030773 ?auto_2030775 ) ) ( not ( = ?auto_2030773 ?auto_2030776 ) ) ( not ( = ?auto_2030773 ?auto_2030777 ) ) ( not ( = ?auto_2030773 ?auto_2030778 ) ) ( not ( = ?auto_2030773 ?auto_2030779 ) ) ( not ( = ?auto_2030774 ?auto_2030775 ) ) ( not ( = ?auto_2030774 ?auto_2030776 ) ) ( not ( = ?auto_2030774 ?auto_2030777 ) ) ( not ( = ?auto_2030774 ?auto_2030778 ) ) ( not ( = ?auto_2030774 ?auto_2030779 ) ) ( not ( = ?auto_2030775 ?auto_2030776 ) ) ( not ( = ?auto_2030775 ?auto_2030777 ) ) ( not ( = ?auto_2030775 ?auto_2030778 ) ) ( not ( = ?auto_2030775 ?auto_2030779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030776 ?auto_2030777 ?auto_2030778 )
      ( MAKE-8CRATE-VERIFY ?auto_2030770 ?auto_2030771 ?auto_2030772 ?auto_2030773 ?auto_2030774 ?auto_2030775 ?auto_2030776 ?auto_2030777 ?auto_2030778 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030863 - SURFACE
      ?auto_2030864 - SURFACE
      ?auto_2030865 - SURFACE
      ?auto_2030866 - SURFACE
      ?auto_2030867 - SURFACE
      ?auto_2030868 - SURFACE
      ?auto_2030869 - SURFACE
      ?auto_2030870 - SURFACE
      ?auto_2030871 - SURFACE
    )
    :vars
    (
      ?auto_2030875 - HOIST
      ?auto_2030876 - PLACE
      ?auto_2030873 - PLACE
      ?auto_2030877 - HOIST
      ?auto_2030872 - SURFACE
      ?auto_2030874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030875 ?auto_2030876 ) ( SURFACE-AT ?auto_2030870 ?auto_2030876 ) ( CLEAR ?auto_2030870 ) ( IS-CRATE ?auto_2030871 ) ( not ( = ?auto_2030870 ?auto_2030871 ) ) ( AVAILABLE ?auto_2030875 ) ( ON ?auto_2030870 ?auto_2030869 ) ( not ( = ?auto_2030869 ?auto_2030870 ) ) ( not ( = ?auto_2030869 ?auto_2030871 ) ) ( not ( = ?auto_2030873 ?auto_2030876 ) ) ( HOIST-AT ?auto_2030877 ?auto_2030873 ) ( not ( = ?auto_2030875 ?auto_2030877 ) ) ( AVAILABLE ?auto_2030877 ) ( SURFACE-AT ?auto_2030871 ?auto_2030873 ) ( ON ?auto_2030871 ?auto_2030872 ) ( CLEAR ?auto_2030871 ) ( not ( = ?auto_2030870 ?auto_2030872 ) ) ( not ( = ?auto_2030871 ?auto_2030872 ) ) ( not ( = ?auto_2030869 ?auto_2030872 ) ) ( TRUCK-AT ?auto_2030874 ?auto_2030876 ) ( ON ?auto_2030864 ?auto_2030863 ) ( ON ?auto_2030865 ?auto_2030864 ) ( ON ?auto_2030866 ?auto_2030865 ) ( ON ?auto_2030867 ?auto_2030866 ) ( ON ?auto_2030868 ?auto_2030867 ) ( ON ?auto_2030869 ?auto_2030868 ) ( not ( = ?auto_2030863 ?auto_2030864 ) ) ( not ( = ?auto_2030863 ?auto_2030865 ) ) ( not ( = ?auto_2030863 ?auto_2030866 ) ) ( not ( = ?auto_2030863 ?auto_2030867 ) ) ( not ( = ?auto_2030863 ?auto_2030868 ) ) ( not ( = ?auto_2030863 ?auto_2030869 ) ) ( not ( = ?auto_2030863 ?auto_2030870 ) ) ( not ( = ?auto_2030863 ?auto_2030871 ) ) ( not ( = ?auto_2030863 ?auto_2030872 ) ) ( not ( = ?auto_2030864 ?auto_2030865 ) ) ( not ( = ?auto_2030864 ?auto_2030866 ) ) ( not ( = ?auto_2030864 ?auto_2030867 ) ) ( not ( = ?auto_2030864 ?auto_2030868 ) ) ( not ( = ?auto_2030864 ?auto_2030869 ) ) ( not ( = ?auto_2030864 ?auto_2030870 ) ) ( not ( = ?auto_2030864 ?auto_2030871 ) ) ( not ( = ?auto_2030864 ?auto_2030872 ) ) ( not ( = ?auto_2030865 ?auto_2030866 ) ) ( not ( = ?auto_2030865 ?auto_2030867 ) ) ( not ( = ?auto_2030865 ?auto_2030868 ) ) ( not ( = ?auto_2030865 ?auto_2030869 ) ) ( not ( = ?auto_2030865 ?auto_2030870 ) ) ( not ( = ?auto_2030865 ?auto_2030871 ) ) ( not ( = ?auto_2030865 ?auto_2030872 ) ) ( not ( = ?auto_2030866 ?auto_2030867 ) ) ( not ( = ?auto_2030866 ?auto_2030868 ) ) ( not ( = ?auto_2030866 ?auto_2030869 ) ) ( not ( = ?auto_2030866 ?auto_2030870 ) ) ( not ( = ?auto_2030866 ?auto_2030871 ) ) ( not ( = ?auto_2030866 ?auto_2030872 ) ) ( not ( = ?auto_2030867 ?auto_2030868 ) ) ( not ( = ?auto_2030867 ?auto_2030869 ) ) ( not ( = ?auto_2030867 ?auto_2030870 ) ) ( not ( = ?auto_2030867 ?auto_2030871 ) ) ( not ( = ?auto_2030867 ?auto_2030872 ) ) ( not ( = ?auto_2030868 ?auto_2030869 ) ) ( not ( = ?auto_2030868 ?auto_2030870 ) ) ( not ( = ?auto_2030868 ?auto_2030871 ) ) ( not ( = ?auto_2030868 ?auto_2030872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030869 ?auto_2030870 ?auto_2030871 )
      ( MAKE-8CRATE-VERIFY ?auto_2030863 ?auto_2030864 ?auto_2030865 ?auto_2030866 ?auto_2030867 ?auto_2030868 ?auto_2030869 ?auto_2030870 ?auto_2030871 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030956 - SURFACE
      ?auto_2030957 - SURFACE
      ?auto_2030958 - SURFACE
      ?auto_2030959 - SURFACE
      ?auto_2030960 - SURFACE
      ?auto_2030961 - SURFACE
      ?auto_2030962 - SURFACE
      ?auto_2030963 - SURFACE
      ?auto_2030964 - SURFACE
    )
    :vars
    (
      ?auto_2030969 - HOIST
      ?auto_2030967 - PLACE
      ?auto_2030970 - PLACE
      ?auto_2030966 - HOIST
      ?auto_2030968 - SURFACE
      ?auto_2030965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030969 ?auto_2030967 ) ( IS-CRATE ?auto_2030964 ) ( not ( = ?auto_2030963 ?auto_2030964 ) ) ( not ( = ?auto_2030962 ?auto_2030963 ) ) ( not ( = ?auto_2030962 ?auto_2030964 ) ) ( not ( = ?auto_2030970 ?auto_2030967 ) ) ( HOIST-AT ?auto_2030966 ?auto_2030970 ) ( not ( = ?auto_2030969 ?auto_2030966 ) ) ( AVAILABLE ?auto_2030966 ) ( SURFACE-AT ?auto_2030964 ?auto_2030970 ) ( ON ?auto_2030964 ?auto_2030968 ) ( CLEAR ?auto_2030964 ) ( not ( = ?auto_2030963 ?auto_2030968 ) ) ( not ( = ?auto_2030964 ?auto_2030968 ) ) ( not ( = ?auto_2030962 ?auto_2030968 ) ) ( TRUCK-AT ?auto_2030965 ?auto_2030967 ) ( SURFACE-AT ?auto_2030962 ?auto_2030967 ) ( CLEAR ?auto_2030962 ) ( LIFTING ?auto_2030969 ?auto_2030963 ) ( IS-CRATE ?auto_2030963 ) ( ON ?auto_2030957 ?auto_2030956 ) ( ON ?auto_2030958 ?auto_2030957 ) ( ON ?auto_2030959 ?auto_2030958 ) ( ON ?auto_2030960 ?auto_2030959 ) ( ON ?auto_2030961 ?auto_2030960 ) ( ON ?auto_2030962 ?auto_2030961 ) ( not ( = ?auto_2030956 ?auto_2030957 ) ) ( not ( = ?auto_2030956 ?auto_2030958 ) ) ( not ( = ?auto_2030956 ?auto_2030959 ) ) ( not ( = ?auto_2030956 ?auto_2030960 ) ) ( not ( = ?auto_2030956 ?auto_2030961 ) ) ( not ( = ?auto_2030956 ?auto_2030962 ) ) ( not ( = ?auto_2030956 ?auto_2030963 ) ) ( not ( = ?auto_2030956 ?auto_2030964 ) ) ( not ( = ?auto_2030956 ?auto_2030968 ) ) ( not ( = ?auto_2030957 ?auto_2030958 ) ) ( not ( = ?auto_2030957 ?auto_2030959 ) ) ( not ( = ?auto_2030957 ?auto_2030960 ) ) ( not ( = ?auto_2030957 ?auto_2030961 ) ) ( not ( = ?auto_2030957 ?auto_2030962 ) ) ( not ( = ?auto_2030957 ?auto_2030963 ) ) ( not ( = ?auto_2030957 ?auto_2030964 ) ) ( not ( = ?auto_2030957 ?auto_2030968 ) ) ( not ( = ?auto_2030958 ?auto_2030959 ) ) ( not ( = ?auto_2030958 ?auto_2030960 ) ) ( not ( = ?auto_2030958 ?auto_2030961 ) ) ( not ( = ?auto_2030958 ?auto_2030962 ) ) ( not ( = ?auto_2030958 ?auto_2030963 ) ) ( not ( = ?auto_2030958 ?auto_2030964 ) ) ( not ( = ?auto_2030958 ?auto_2030968 ) ) ( not ( = ?auto_2030959 ?auto_2030960 ) ) ( not ( = ?auto_2030959 ?auto_2030961 ) ) ( not ( = ?auto_2030959 ?auto_2030962 ) ) ( not ( = ?auto_2030959 ?auto_2030963 ) ) ( not ( = ?auto_2030959 ?auto_2030964 ) ) ( not ( = ?auto_2030959 ?auto_2030968 ) ) ( not ( = ?auto_2030960 ?auto_2030961 ) ) ( not ( = ?auto_2030960 ?auto_2030962 ) ) ( not ( = ?auto_2030960 ?auto_2030963 ) ) ( not ( = ?auto_2030960 ?auto_2030964 ) ) ( not ( = ?auto_2030960 ?auto_2030968 ) ) ( not ( = ?auto_2030961 ?auto_2030962 ) ) ( not ( = ?auto_2030961 ?auto_2030963 ) ) ( not ( = ?auto_2030961 ?auto_2030964 ) ) ( not ( = ?auto_2030961 ?auto_2030968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030962 ?auto_2030963 ?auto_2030964 )
      ( MAKE-8CRATE-VERIFY ?auto_2030956 ?auto_2030957 ?auto_2030958 ?auto_2030959 ?auto_2030960 ?auto_2030961 ?auto_2030962 ?auto_2030963 ?auto_2030964 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2031049 - SURFACE
      ?auto_2031050 - SURFACE
      ?auto_2031051 - SURFACE
      ?auto_2031052 - SURFACE
      ?auto_2031053 - SURFACE
      ?auto_2031054 - SURFACE
      ?auto_2031055 - SURFACE
      ?auto_2031056 - SURFACE
      ?auto_2031057 - SURFACE
    )
    :vars
    (
      ?auto_2031061 - HOIST
      ?auto_2031058 - PLACE
      ?auto_2031063 - PLACE
      ?auto_2031062 - HOIST
      ?auto_2031060 - SURFACE
      ?auto_2031059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031061 ?auto_2031058 ) ( IS-CRATE ?auto_2031057 ) ( not ( = ?auto_2031056 ?auto_2031057 ) ) ( not ( = ?auto_2031055 ?auto_2031056 ) ) ( not ( = ?auto_2031055 ?auto_2031057 ) ) ( not ( = ?auto_2031063 ?auto_2031058 ) ) ( HOIST-AT ?auto_2031062 ?auto_2031063 ) ( not ( = ?auto_2031061 ?auto_2031062 ) ) ( AVAILABLE ?auto_2031062 ) ( SURFACE-AT ?auto_2031057 ?auto_2031063 ) ( ON ?auto_2031057 ?auto_2031060 ) ( CLEAR ?auto_2031057 ) ( not ( = ?auto_2031056 ?auto_2031060 ) ) ( not ( = ?auto_2031057 ?auto_2031060 ) ) ( not ( = ?auto_2031055 ?auto_2031060 ) ) ( TRUCK-AT ?auto_2031059 ?auto_2031058 ) ( SURFACE-AT ?auto_2031055 ?auto_2031058 ) ( CLEAR ?auto_2031055 ) ( IS-CRATE ?auto_2031056 ) ( AVAILABLE ?auto_2031061 ) ( IN ?auto_2031056 ?auto_2031059 ) ( ON ?auto_2031050 ?auto_2031049 ) ( ON ?auto_2031051 ?auto_2031050 ) ( ON ?auto_2031052 ?auto_2031051 ) ( ON ?auto_2031053 ?auto_2031052 ) ( ON ?auto_2031054 ?auto_2031053 ) ( ON ?auto_2031055 ?auto_2031054 ) ( not ( = ?auto_2031049 ?auto_2031050 ) ) ( not ( = ?auto_2031049 ?auto_2031051 ) ) ( not ( = ?auto_2031049 ?auto_2031052 ) ) ( not ( = ?auto_2031049 ?auto_2031053 ) ) ( not ( = ?auto_2031049 ?auto_2031054 ) ) ( not ( = ?auto_2031049 ?auto_2031055 ) ) ( not ( = ?auto_2031049 ?auto_2031056 ) ) ( not ( = ?auto_2031049 ?auto_2031057 ) ) ( not ( = ?auto_2031049 ?auto_2031060 ) ) ( not ( = ?auto_2031050 ?auto_2031051 ) ) ( not ( = ?auto_2031050 ?auto_2031052 ) ) ( not ( = ?auto_2031050 ?auto_2031053 ) ) ( not ( = ?auto_2031050 ?auto_2031054 ) ) ( not ( = ?auto_2031050 ?auto_2031055 ) ) ( not ( = ?auto_2031050 ?auto_2031056 ) ) ( not ( = ?auto_2031050 ?auto_2031057 ) ) ( not ( = ?auto_2031050 ?auto_2031060 ) ) ( not ( = ?auto_2031051 ?auto_2031052 ) ) ( not ( = ?auto_2031051 ?auto_2031053 ) ) ( not ( = ?auto_2031051 ?auto_2031054 ) ) ( not ( = ?auto_2031051 ?auto_2031055 ) ) ( not ( = ?auto_2031051 ?auto_2031056 ) ) ( not ( = ?auto_2031051 ?auto_2031057 ) ) ( not ( = ?auto_2031051 ?auto_2031060 ) ) ( not ( = ?auto_2031052 ?auto_2031053 ) ) ( not ( = ?auto_2031052 ?auto_2031054 ) ) ( not ( = ?auto_2031052 ?auto_2031055 ) ) ( not ( = ?auto_2031052 ?auto_2031056 ) ) ( not ( = ?auto_2031052 ?auto_2031057 ) ) ( not ( = ?auto_2031052 ?auto_2031060 ) ) ( not ( = ?auto_2031053 ?auto_2031054 ) ) ( not ( = ?auto_2031053 ?auto_2031055 ) ) ( not ( = ?auto_2031053 ?auto_2031056 ) ) ( not ( = ?auto_2031053 ?auto_2031057 ) ) ( not ( = ?auto_2031053 ?auto_2031060 ) ) ( not ( = ?auto_2031054 ?auto_2031055 ) ) ( not ( = ?auto_2031054 ?auto_2031056 ) ) ( not ( = ?auto_2031054 ?auto_2031057 ) ) ( not ( = ?auto_2031054 ?auto_2031060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031055 ?auto_2031056 ?auto_2031057 )
      ( MAKE-8CRATE-VERIFY ?auto_2031049 ?auto_2031050 ?auto_2031051 ?auto_2031052 ?auto_2031053 ?auto_2031054 ?auto_2031055 ?auto_2031056 ?auto_2031057 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035165 - SURFACE
      ?auto_2035166 - SURFACE
      ?auto_2035167 - SURFACE
      ?auto_2035168 - SURFACE
      ?auto_2035169 - SURFACE
      ?auto_2035170 - SURFACE
      ?auto_2035171 - SURFACE
      ?auto_2035172 - SURFACE
      ?auto_2035173 - SURFACE
      ?auto_2035174 - SURFACE
    )
    :vars
    (
      ?auto_2035175 - HOIST
      ?auto_2035176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035175 ?auto_2035176 ) ( SURFACE-AT ?auto_2035173 ?auto_2035176 ) ( CLEAR ?auto_2035173 ) ( LIFTING ?auto_2035175 ?auto_2035174 ) ( IS-CRATE ?auto_2035174 ) ( not ( = ?auto_2035173 ?auto_2035174 ) ) ( ON ?auto_2035166 ?auto_2035165 ) ( ON ?auto_2035167 ?auto_2035166 ) ( ON ?auto_2035168 ?auto_2035167 ) ( ON ?auto_2035169 ?auto_2035168 ) ( ON ?auto_2035170 ?auto_2035169 ) ( ON ?auto_2035171 ?auto_2035170 ) ( ON ?auto_2035172 ?auto_2035171 ) ( ON ?auto_2035173 ?auto_2035172 ) ( not ( = ?auto_2035165 ?auto_2035166 ) ) ( not ( = ?auto_2035165 ?auto_2035167 ) ) ( not ( = ?auto_2035165 ?auto_2035168 ) ) ( not ( = ?auto_2035165 ?auto_2035169 ) ) ( not ( = ?auto_2035165 ?auto_2035170 ) ) ( not ( = ?auto_2035165 ?auto_2035171 ) ) ( not ( = ?auto_2035165 ?auto_2035172 ) ) ( not ( = ?auto_2035165 ?auto_2035173 ) ) ( not ( = ?auto_2035165 ?auto_2035174 ) ) ( not ( = ?auto_2035166 ?auto_2035167 ) ) ( not ( = ?auto_2035166 ?auto_2035168 ) ) ( not ( = ?auto_2035166 ?auto_2035169 ) ) ( not ( = ?auto_2035166 ?auto_2035170 ) ) ( not ( = ?auto_2035166 ?auto_2035171 ) ) ( not ( = ?auto_2035166 ?auto_2035172 ) ) ( not ( = ?auto_2035166 ?auto_2035173 ) ) ( not ( = ?auto_2035166 ?auto_2035174 ) ) ( not ( = ?auto_2035167 ?auto_2035168 ) ) ( not ( = ?auto_2035167 ?auto_2035169 ) ) ( not ( = ?auto_2035167 ?auto_2035170 ) ) ( not ( = ?auto_2035167 ?auto_2035171 ) ) ( not ( = ?auto_2035167 ?auto_2035172 ) ) ( not ( = ?auto_2035167 ?auto_2035173 ) ) ( not ( = ?auto_2035167 ?auto_2035174 ) ) ( not ( = ?auto_2035168 ?auto_2035169 ) ) ( not ( = ?auto_2035168 ?auto_2035170 ) ) ( not ( = ?auto_2035168 ?auto_2035171 ) ) ( not ( = ?auto_2035168 ?auto_2035172 ) ) ( not ( = ?auto_2035168 ?auto_2035173 ) ) ( not ( = ?auto_2035168 ?auto_2035174 ) ) ( not ( = ?auto_2035169 ?auto_2035170 ) ) ( not ( = ?auto_2035169 ?auto_2035171 ) ) ( not ( = ?auto_2035169 ?auto_2035172 ) ) ( not ( = ?auto_2035169 ?auto_2035173 ) ) ( not ( = ?auto_2035169 ?auto_2035174 ) ) ( not ( = ?auto_2035170 ?auto_2035171 ) ) ( not ( = ?auto_2035170 ?auto_2035172 ) ) ( not ( = ?auto_2035170 ?auto_2035173 ) ) ( not ( = ?auto_2035170 ?auto_2035174 ) ) ( not ( = ?auto_2035171 ?auto_2035172 ) ) ( not ( = ?auto_2035171 ?auto_2035173 ) ) ( not ( = ?auto_2035171 ?auto_2035174 ) ) ( not ( = ?auto_2035172 ?auto_2035173 ) ) ( not ( = ?auto_2035172 ?auto_2035174 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2035173 ?auto_2035174 )
      ( MAKE-9CRATE-VERIFY ?auto_2035165 ?auto_2035166 ?auto_2035167 ?auto_2035168 ?auto_2035169 ?auto_2035170 ?auto_2035171 ?auto_2035172 ?auto_2035173 ?auto_2035174 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035245 - SURFACE
      ?auto_2035246 - SURFACE
      ?auto_2035247 - SURFACE
      ?auto_2035248 - SURFACE
      ?auto_2035249 - SURFACE
      ?auto_2035250 - SURFACE
      ?auto_2035251 - SURFACE
      ?auto_2035252 - SURFACE
      ?auto_2035253 - SURFACE
      ?auto_2035254 - SURFACE
    )
    :vars
    (
      ?auto_2035256 - HOIST
      ?auto_2035257 - PLACE
      ?auto_2035255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035256 ?auto_2035257 ) ( SURFACE-AT ?auto_2035253 ?auto_2035257 ) ( CLEAR ?auto_2035253 ) ( IS-CRATE ?auto_2035254 ) ( not ( = ?auto_2035253 ?auto_2035254 ) ) ( TRUCK-AT ?auto_2035255 ?auto_2035257 ) ( AVAILABLE ?auto_2035256 ) ( IN ?auto_2035254 ?auto_2035255 ) ( ON ?auto_2035253 ?auto_2035252 ) ( not ( = ?auto_2035252 ?auto_2035253 ) ) ( not ( = ?auto_2035252 ?auto_2035254 ) ) ( ON ?auto_2035246 ?auto_2035245 ) ( ON ?auto_2035247 ?auto_2035246 ) ( ON ?auto_2035248 ?auto_2035247 ) ( ON ?auto_2035249 ?auto_2035248 ) ( ON ?auto_2035250 ?auto_2035249 ) ( ON ?auto_2035251 ?auto_2035250 ) ( ON ?auto_2035252 ?auto_2035251 ) ( not ( = ?auto_2035245 ?auto_2035246 ) ) ( not ( = ?auto_2035245 ?auto_2035247 ) ) ( not ( = ?auto_2035245 ?auto_2035248 ) ) ( not ( = ?auto_2035245 ?auto_2035249 ) ) ( not ( = ?auto_2035245 ?auto_2035250 ) ) ( not ( = ?auto_2035245 ?auto_2035251 ) ) ( not ( = ?auto_2035245 ?auto_2035252 ) ) ( not ( = ?auto_2035245 ?auto_2035253 ) ) ( not ( = ?auto_2035245 ?auto_2035254 ) ) ( not ( = ?auto_2035246 ?auto_2035247 ) ) ( not ( = ?auto_2035246 ?auto_2035248 ) ) ( not ( = ?auto_2035246 ?auto_2035249 ) ) ( not ( = ?auto_2035246 ?auto_2035250 ) ) ( not ( = ?auto_2035246 ?auto_2035251 ) ) ( not ( = ?auto_2035246 ?auto_2035252 ) ) ( not ( = ?auto_2035246 ?auto_2035253 ) ) ( not ( = ?auto_2035246 ?auto_2035254 ) ) ( not ( = ?auto_2035247 ?auto_2035248 ) ) ( not ( = ?auto_2035247 ?auto_2035249 ) ) ( not ( = ?auto_2035247 ?auto_2035250 ) ) ( not ( = ?auto_2035247 ?auto_2035251 ) ) ( not ( = ?auto_2035247 ?auto_2035252 ) ) ( not ( = ?auto_2035247 ?auto_2035253 ) ) ( not ( = ?auto_2035247 ?auto_2035254 ) ) ( not ( = ?auto_2035248 ?auto_2035249 ) ) ( not ( = ?auto_2035248 ?auto_2035250 ) ) ( not ( = ?auto_2035248 ?auto_2035251 ) ) ( not ( = ?auto_2035248 ?auto_2035252 ) ) ( not ( = ?auto_2035248 ?auto_2035253 ) ) ( not ( = ?auto_2035248 ?auto_2035254 ) ) ( not ( = ?auto_2035249 ?auto_2035250 ) ) ( not ( = ?auto_2035249 ?auto_2035251 ) ) ( not ( = ?auto_2035249 ?auto_2035252 ) ) ( not ( = ?auto_2035249 ?auto_2035253 ) ) ( not ( = ?auto_2035249 ?auto_2035254 ) ) ( not ( = ?auto_2035250 ?auto_2035251 ) ) ( not ( = ?auto_2035250 ?auto_2035252 ) ) ( not ( = ?auto_2035250 ?auto_2035253 ) ) ( not ( = ?auto_2035250 ?auto_2035254 ) ) ( not ( = ?auto_2035251 ?auto_2035252 ) ) ( not ( = ?auto_2035251 ?auto_2035253 ) ) ( not ( = ?auto_2035251 ?auto_2035254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035252 ?auto_2035253 ?auto_2035254 )
      ( MAKE-9CRATE-VERIFY ?auto_2035245 ?auto_2035246 ?auto_2035247 ?auto_2035248 ?auto_2035249 ?auto_2035250 ?auto_2035251 ?auto_2035252 ?auto_2035253 ?auto_2035254 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035335 - SURFACE
      ?auto_2035336 - SURFACE
      ?auto_2035337 - SURFACE
      ?auto_2035338 - SURFACE
      ?auto_2035339 - SURFACE
      ?auto_2035340 - SURFACE
      ?auto_2035341 - SURFACE
      ?auto_2035342 - SURFACE
      ?auto_2035343 - SURFACE
      ?auto_2035344 - SURFACE
    )
    :vars
    (
      ?auto_2035345 - HOIST
      ?auto_2035347 - PLACE
      ?auto_2035348 - TRUCK
      ?auto_2035346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035345 ?auto_2035347 ) ( SURFACE-AT ?auto_2035343 ?auto_2035347 ) ( CLEAR ?auto_2035343 ) ( IS-CRATE ?auto_2035344 ) ( not ( = ?auto_2035343 ?auto_2035344 ) ) ( AVAILABLE ?auto_2035345 ) ( IN ?auto_2035344 ?auto_2035348 ) ( ON ?auto_2035343 ?auto_2035342 ) ( not ( = ?auto_2035342 ?auto_2035343 ) ) ( not ( = ?auto_2035342 ?auto_2035344 ) ) ( TRUCK-AT ?auto_2035348 ?auto_2035346 ) ( not ( = ?auto_2035346 ?auto_2035347 ) ) ( ON ?auto_2035336 ?auto_2035335 ) ( ON ?auto_2035337 ?auto_2035336 ) ( ON ?auto_2035338 ?auto_2035337 ) ( ON ?auto_2035339 ?auto_2035338 ) ( ON ?auto_2035340 ?auto_2035339 ) ( ON ?auto_2035341 ?auto_2035340 ) ( ON ?auto_2035342 ?auto_2035341 ) ( not ( = ?auto_2035335 ?auto_2035336 ) ) ( not ( = ?auto_2035335 ?auto_2035337 ) ) ( not ( = ?auto_2035335 ?auto_2035338 ) ) ( not ( = ?auto_2035335 ?auto_2035339 ) ) ( not ( = ?auto_2035335 ?auto_2035340 ) ) ( not ( = ?auto_2035335 ?auto_2035341 ) ) ( not ( = ?auto_2035335 ?auto_2035342 ) ) ( not ( = ?auto_2035335 ?auto_2035343 ) ) ( not ( = ?auto_2035335 ?auto_2035344 ) ) ( not ( = ?auto_2035336 ?auto_2035337 ) ) ( not ( = ?auto_2035336 ?auto_2035338 ) ) ( not ( = ?auto_2035336 ?auto_2035339 ) ) ( not ( = ?auto_2035336 ?auto_2035340 ) ) ( not ( = ?auto_2035336 ?auto_2035341 ) ) ( not ( = ?auto_2035336 ?auto_2035342 ) ) ( not ( = ?auto_2035336 ?auto_2035343 ) ) ( not ( = ?auto_2035336 ?auto_2035344 ) ) ( not ( = ?auto_2035337 ?auto_2035338 ) ) ( not ( = ?auto_2035337 ?auto_2035339 ) ) ( not ( = ?auto_2035337 ?auto_2035340 ) ) ( not ( = ?auto_2035337 ?auto_2035341 ) ) ( not ( = ?auto_2035337 ?auto_2035342 ) ) ( not ( = ?auto_2035337 ?auto_2035343 ) ) ( not ( = ?auto_2035337 ?auto_2035344 ) ) ( not ( = ?auto_2035338 ?auto_2035339 ) ) ( not ( = ?auto_2035338 ?auto_2035340 ) ) ( not ( = ?auto_2035338 ?auto_2035341 ) ) ( not ( = ?auto_2035338 ?auto_2035342 ) ) ( not ( = ?auto_2035338 ?auto_2035343 ) ) ( not ( = ?auto_2035338 ?auto_2035344 ) ) ( not ( = ?auto_2035339 ?auto_2035340 ) ) ( not ( = ?auto_2035339 ?auto_2035341 ) ) ( not ( = ?auto_2035339 ?auto_2035342 ) ) ( not ( = ?auto_2035339 ?auto_2035343 ) ) ( not ( = ?auto_2035339 ?auto_2035344 ) ) ( not ( = ?auto_2035340 ?auto_2035341 ) ) ( not ( = ?auto_2035340 ?auto_2035342 ) ) ( not ( = ?auto_2035340 ?auto_2035343 ) ) ( not ( = ?auto_2035340 ?auto_2035344 ) ) ( not ( = ?auto_2035341 ?auto_2035342 ) ) ( not ( = ?auto_2035341 ?auto_2035343 ) ) ( not ( = ?auto_2035341 ?auto_2035344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035342 ?auto_2035343 ?auto_2035344 )
      ( MAKE-9CRATE-VERIFY ?auto_2035335 ?auto_2035336 ?auto_2035337 ?auto_2035338 ?auto_2035339 ?auto_2035340 ?auto_2035341 ?auto_2035342 ?auto_2035343 ?auto_2035344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035434 - SURFACE
      ?auto_2035435 - SURFACE
      ?auto_2035436 - SURFACE
      ?auto_2035437 - SURFACE
      ?auto_2035438 - SURFACE
      ?auto_2035439 - SURFACE
      ?auto_2035440 - SURFACE
      ?auto_2035441 - SURFACE
      ?auto_2035442 - SURFACE
      ?auto_2035443 - SURFACE
    )
    :vars
    (
      ?auto_2035448 - HOIST
      ?auto_2035446 - PLACE
      ?auto_2035445 - TRUCK
      ?auto_2035444 - PLACE
      ?auto_2035447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035448 ?auto_2035446 ) ( SURFACE-AT ?auto_2035442 ?auto_2035446 ) ( CLEAR ?auto_2035442 ) ( IS-CRATE ?auto_2035443 ) ( not ( = ?auto_2035442 ?auto_2035443 ) ) ( AVAILABLE ?auto_2035448 ) ( ON ?auto_2035442 ?auto_2035441 ) ( not ( = ?auto_2035441 ?auto_2035442 ) ) ( not ( = ?auto_2035441 ?auto_2035443 ) ) ( TRUCK-AT ?auto_2035445 ?auto_2035444 ) ( not ( = ?auto_2035444 ?auto_2035446 ) ) ( HOIST-AT ?auto_2035447 ?auto_2035444 ) ( LIFTING ?auto_2035447 ?auto_2035443 ) ( not ( = ?auto_2035448 ?auto_2035447 ) ) ( ON ?auto_2035435 ?auto_2035434 ) ( ON ?auto_2035436 ?auto_2035435 ) ( ON ?auto_2035437 ?auto_2035436 ) ( ON ?auto_2035438 ?auto_2035437 ) ( ON ?auto_2035439 ?auto_2035438 ) ( ON ?auto_2035440 ?auto_2035439 ) ( ON ?auto_2035441 ?auto_2035440 ) ( not ( = ?auto_2035434 ?auto_2035435 ) ) ( not ( = ?auto_2035434 ?auto_2035436 ) ) ( not ( = ?auto_2035434 ?auto_2035437 ) ) ( not ( = ?auto_2035434 ?auto_2035438 ) ) ( not ( = ?auto_2035434 ?auto_2035439 ) ) ( not ( = ?auto_2035434 ?auto_2035440 ) ) ( not ( = ?auto_2035434 ?auto_2035441 ) ) ( not ( = ?auto_2035434 ?auto_2035442 ) ) ( not ( = ?auto_2035434 ?auto_2035443 ) ) ( not ( = ?auto_2035435 ?auto_2035436 ) ) ( not ( = ?auto_2035435 ?auto_2035437 ) ) ( not ( = ?auto_2035435 ?auto_2035438 ) ) ( not ( = ?auto_2035435 ?auto_2035439 ) ) ( not ( = ?auto_2035435 ?auto_2035440 ) ) ( not ( = ?auto_2035435 ?auto_2035441 ) ) ( not ( = ?auto_2035435 ?auto_2035442 ) ) ( not ( = ?auto_2035435 ?auto_2035443 ) ) ( not ( = ?auto_2035436 ?auto_2035437 ) ) ( not ( = ?auto_2035436 ?auto_2035438 ) ) ( not ( = ?auto_2035436 ?auto_2035439 ) ) ( not ( = ?auto_2035436 ?auto_2035440 ) ) ( not ( = ?auto_2035436 ?auto_2035441 ) ) ( not ( = ?auto_2035436 ?auto_2035442 ) ) ( not ( = ?auto_2035436 ?auto_2035443 ) ) ( not ( = ?auto_2035437 ?auto_2035438 ) ) ( not ( = ?auto_2035437 ?auto_2035439 ) ) ( not ( = ?auto_2035437 ?auto_2035440 ) ) ( not ( = ?auto_2035437 ?auto_2035441 ) ) ( not ( = ?auto_2035437 ?auto_2035442 ) ) ( not ( = ?auto_2035437 ?auto_2035443 ) ) ( not ( = ?auto_2035438 ?auto_2035439 ) ) ( not ( = ?auto_2035438 ?auto_2035440 ) ) ( not ( = ?auto_2035438 ?auto_2035441 ) ) ( not ( = ?auto_2035438 ?auto_2035442 ) ) ( not ( = ?auto_2035438 ?auto_2035443 ) ) ( not ( = ?auto_2035439 ?auto_2035440 ) ) ( not ( = ?auto_2035439 ?auto_2035441 ) ) ( not ( = ?auto_2035439 ?auto_2035442 ) ) ( not ( = ?auto_2035439 ?auto_2035443 ) ) ( not ( = ?auto_2035440 ?auto_2035441 ) ) ( not ( = ?auto_2035440 ?auto_2035442 ) ) ( not ( = ?auto_2035440 ?auto_2035443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035441 ?auto_2035442 ?auto_2035443 )
      ( MAKE-9CRATE-VERIFY ?auto_2035434 ?auto_2035435 ?auto_2035436 ?auto_2035437 ?auto_2035438 ?auto_2035439 ?auto_2035440 ?auto_2035441 ?auto_2035442 ?auto_2035443 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035542 - SURFACE
      ?auto_2035543 - SURFACE
      ?auto_2035544 - SURFACE
      ?auto_2035545 - SURFACE
      ?auto_2035546 - SURFACE
      ?auto_2035547 - SURFACE
      ?auto_2035548 - SURFACE
      ?auto_2035549 - SURFACE
      ?auto_2035550 - SURFACE
      ?auto_2035551 - SURFACE
    )
    :vars
    (
      ?auto_2035556 - HOIST
      ?auto_2035552 - PLACE
      ?auto_2035554 - TRUCK
      ?auto_2035553 - PLACE
      ?auto_2035555 - HOIST
      ?auto_2035557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035556 ?auto_2035552 ) ( SURFACE-AT ?auto_2035550 ?auto_2035552 ) ( CLEAR ?auto_2035550 ) ( IS-CRATE ?auto_2035551 ) ( not ( = ?auto_2035550 ?auto_2035551 ) ) ( AVAILABLE ?auto_2035556 ) ( ON ?auto_2035550 ?auto_2035549 ) ( not ( = ?auto_2035549 ?auto_2035550 ) ) ( not ( = ?auto_2035549 ?auto_2035551 ) ) ( TRUCK-AT ?auto_2035554 ?auto_2035553 ) ( not ( = ?auto_2035553 ?auto_2035552 ) ) ( HOIST-AT ?auto_2035555 ?auto_2035553 ) ( not ( = ?auto_2035556 ?auto_2035555 ) ) ( AVAILABLE ?auto_2035555 ) ( SURFACE-AT ?auto_2035551 ?auto_2035553 ) ( ON ?auto_2035551 ?auto_2035557 ) ( CLEAR ?auto_2035551 ) ( not ( = ?auto_2035550 ?auto_2035557 ) ) ( not ( = ?auto_2035551 ?auto_2035557 ) ) ( not ( = ?auto_2035549 ?auto_2035557 ) ) ( ON ?auto_2035543 ?auto_2035542 ) ( ON ?auto_2035544 ?auto_2035543 ) ( ON ?auto_2035545 ?auto_2035544 ) ( ON ?auto_2035546 ?auto_2035545 ) ( ON ?auto_2035547 ?auto_2035546 ) ( ON ?auto_2035548 ?auto_2035547 ) ( ON ?auto_2035549 ?auto_2035548 ) ( not ( = ?auto_2035542 ?auto_2035543 ) ) ( not ( = ?auto_2035542 ?auto_2035544 ) ) ( not ( = ?auto_2035542 ?auto_2035545 ) ) ( not ( = ?auto_2035542 ?auto_2035546 ) ) ( not ( = ?auto_2035542 ?auto_2035547 ) ) ( not ( = ?auto_2035542 ?auto_2035548 ) ) ( not ( = ?auto_2035542 ?auto_2035549 ) ) ( not ( = ?auto_2035542 ?auto_2035550 ) ) ( not ( = ?auto_2035542 ?auto_2035551 ) ) ( not ( = ?auto_2035542 ?auto_2035557 ) ) ( not ( = ?auto_2035543 ?auto_2035544 ) ) ( not ( = ?auto_2035543 ?auto_2035545 ) ) ( not ( = ?auto_2035543 ?auto_2035546 ) ) ( not ( = ?auto_2035543 ?auto_2035547 ) ) ( not ( = ?auto_2035543 ?auto_2035548 ) ) ( not ( = ?auto_2035543 ?auto_2035549 ) ) ( not ( = ?auto_2035543 ?auto_2035550 ) ) ( not ( = ?auto_2035543 ?auto_2035551 ) ) ( not ( = ?auto_2035543 ?auto_2035557 ) ) ( not ( = ?auto_2035544 ?auto_2035545 ) ) ( not ( = ?auto_2035544 ?auto_2035546 ) ) ( not ( = ?auto_2035544 ?auto_2035547 ) ) ( not ( = ?auto_2035544 ?auto_2035548 ) ) ( not ( = ?auto_2035544 ?auto_2035549 ) ) ( not ( = ?auto_2035544 ?auto_2035550 ) ) ( not ( = ?auto_2035544 ?auto_2035551 ) ) ( not ( = ?auto_2035544 ?auto_2035557 ) ) ( not ( = ?auto_2035545 ?auto_2035546 ) ) ( not ( = ?auto_2035545 ?auto_2035547 ) ) ( not ( = ?auto_2035545 ?auto_2035548 ) ) ( not ( = ?auto_2035545 ?auto_2035549 ) ) ( not ( = ?auto_2035545 ?auto_2035550 ) ) ( not ( = ?auto_2035545 ?auto_2035551 ) ) ( not ( = ?auto_2035545 ?auto_2035557 ) ) ( not ( = ?auto_2035546 ?auto_2035547 ) ) ( not ( = ?auto_2035546 ?auto_2035548 ) ) ( not ( = ?auto_2035546 ?auto_2035549 ) ) ( not ( = ?auto_2035546 ?auto_2035550 ) ) ( not ( = ?auto_2035546 ?auto_2035551 ) ) ( not ( = ?auto_2035546 ?auto_2035557 ) ) ( not ( = ?auto_2035547 ?auto_2035548 ) ) ( not ( = ?auto_2035547 ?auto_2035549 ) ) ( not ( = ?auto_2035547 ?auto_2035550 ) ) ( not ( = ?auto_2035547 ?auto_2035551 ) ) ( not ( = ?auto_2035547 ?auto_2035557 ) ) ( not ( = ?auto_2035548 ?auto_2035549 ) ) ( not ( = ?auto_2035548 ?auto_2035550 ) ) ( not ( = ?auto_2035548 ?auto_2035551 ) ) ( not ( = ?auto_2035548 ?auto_2035557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035549 ?auto_2035550 ?auto_2035551 )
      ( MAKE-9CRATE-VERIFY ?auto_2035542 ?auto_2035543 ?auto_2035544 ?auto_2035545 ?auto_2035546 ?auto_2035547 ?auto_2035548 ?auto_2035549 ?auto_2035550 ?auto_2035551 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035651 - SURFACE
      ?auto_2035652 - SURFACE
      ?auto_2035653 - SURFACE
      ?auto_2035654 - SURFACE
      ?auto_2035655 - SURFACE
      ?auto_2035656 - SURFACE
      ?auto_2035657 - SURFACE
      ?auto_2035658 - SURFACE
      ?auto_2035659 - SURFACE
      ?auto_2035660 - SURFACE
    )
    :vars
    (
      ?auto_2035663 - HOIST
      ?auto_2035666 - PLACE
      ?auto_2035662 - PLACE
      ?auto_2035665 - HOIST
      ?auto_2035664 - SURFACE
      ?auto_2035661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035663 ?auto_2035666 ) ( SURFACE-AT ?auto_2035659 ?auto_2035666 ) ( CLEAR ?auto_2035659 ) ( IS-CRATE ?auto_2035660 ) ( not ( = ?auto_2035659 ?auto_2035660 ) ) ( AVAILABLE ?auto_2035663 ) ( ON ?auto_2035659 ?auto_2035658 ) ( not ( = ?auto_2035658 ?auto_2035659 ) ) ( not ( = ?auto_2035658 ?auto_2035660 ) ) ( not ( = ?auto_2035662 ?auto_2035666 ) ) ( HOIST-AT ?auto_2035665 ?auto_2035662 ) ( not ( = ?auto_2035663 ?auto_2035665 ) ) ( AVAILABLE ?auto_2035665 ) ( SURFACE-AT ?auto_2035660 ?auto_2035662 ) ( ON ?auto_2035660 ?auto_2035664 ) ( CLEAR ?auto_2035660 ) ( not ( = ?auto_2035659 ?auto_2035664 ) ) ( not ( = ?auto_2035660 ?auto_2035664 ) ) ( not ( = ?auto_2035658 ?auto_2035664 ) ) ( TRUCK-AT ?auto_2035661 ?auto_2035666 ) ( ON ?auto_2035652 ?auto_2035651 ) ( ON ?auto_2035653 ?auto_2035652 ) ( ON ?auto_2035654 ?auto_2035653 ) ( ON ?auto_2035655 ?auto_2035654 ) ( ON ?auto_2035656 ?auto_2035655 ) ( ON ?auto_2035657 ?auto_2035656 ) ( ON ?auto_2035658 ?auto_2035657 ) ( not ( = ?auto_2035651 ?auto_2035652 ) ) ( not ( = ?auto_2035651 ?auto_2035653 ) ) ( not ( = ?auto_2035651 ?auto_2035654 ) ) ( not ( = ?auto_2035651 ?auto_2035655 ) ) ( not ( = ?auto_2035651 ?auto_2035656 ) ) ( not ( = ?auto_2035651 ?auto_2035657 ) ) ( not ( = ?auto_2035651 ?auto_2035658 ) ) ( not ( = ?auto_2035651 ?auto_2035659 ) ) ( not ( = ?auto_2035651 ?auto_2035660 ) ) ( not ( = ?auto_2035651 ?auto_2035664 ) ) ( not ( = ?auto_2035652 ?auto_2035653 ) ) ( not ( = ?auto_2035652 ?auto_2035654 ) ) ( not ( = ?auto_2035652 ?auto_2035655 ) ) ( not ( = ?auto_2035652 ?auto_2035656 ) ) ( not ( = ?auto_2035652 ?auto_2035657 ) ) ( not ( = ?auto_2035652 ?auto_2035658 ) ) ( not ( = ?auto_2035652 ?auto_2035659 ) ) ( not ( = ?auto_2035652 ?auto_2035660 ) ) ( not ( = ?auto_2035652 ?auto_2035664 ) ) ( not ( = ?auto_2035653 ?auto_2035654 ) ) ( not ( = ?auto_2035653 ?auto_2035655 ) ) ( not ( = ?auto_2035653 ?auto_2035656 ) ) ( not ( = ?auto_2035653 ?auto_2035657 ) ) ( not ( = ?auto_2035653 ?auto_2035658 ) ) ( not ( = ?auto_2035653 ?auto_2035659 ) ) ( not ( = ?auto_2035653 ?auto_2035660 ) ) ( not ( = ?auto_2035653 ?auto_2035664 ) ) ( not ( = ?auto_2035654 ?auto_2035655 ) ) ( not ( = ?auto_2035654 ?auto_2035656 ) ) ( not ( = ?auto_2035654 ?auto_2035657 ) ) ( not ( = ?auto_2035654 ?auto_2035658 ) ) ( not ( = ?auto_2035654 ?auto_2035659 ) ) ( not ( = ?auto_2035654 ?auto_2035660 ) ) ( not ( = ?auto_2035654 ?auto_2035664 ) ) ( not ( = ?auto_2035655 ?auto_2035656 ) ) ( not ( = ?auto_2035655 ?auto_2035657 ) ) ( not ( = ?auto_2035655 ?auto_2035658 ) ) ( not ( = ?auto_2035655 ?auto_2035659 ) ) ( not ( = ?auto_2035655 ?auto_2035660 ) ) ( not ( = ?auto_2035655 ?auto_2035664 ) ) ( not ( = ?auto_2035656 ?auto_2035657 ) ) ( not ( = ?auto_2035656 ?auto_2035658 ) ) ( not ( = ?auto_2035656 ?auto_2035659 ) ) ( not ( = ?auto_2035656 ?auto_2035660 ) ) ( not ( = ?auto_2035656 ?auto_2035664 ) ) ( not ( = ?auto_2035657 ?auto_2035658 ) ) ( not ( = ?auto_2035657 ?auto_2035659 ) ) ( not ( = ?auto_2035657 ?auto_2035660 ) ) ( not ( = ?auto_2035657 ?auto_2035664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035658 ?auto_2035659 ?auto_2035660 )
      ( MAKE-9CRATE-VERIFY ?auto_2035651 ?auto_2035652 ?auto_2035653 ?auto_2035654 ?auto_2035655 ?auto_2035656 ?auto_2035657 ?auto_2035658 ?auto_2035659 ?auto_2035660 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035760 - SURFACE
      ?auto_2035761 - SURFACE
      ?auto_2035762 - SURFACE
      ?auto_2035763 - SURFACE
      ?auto_2035764 - SURFACE
      ?auto_2035765 - SURFACE
      ?auto_2035766 - SURFACE
      ?auto_2035767 - SURFACE
      ?auto_2035768 - SURFACE
      ?auto_2035769 - SURFACE
    )
    :vars
    (
      ?auto_2035774 - HOIST
      ?auto_2035770 - PLACE
      ?auto_2035772 - PLACE
      ?auto_2035773 - HOIST
      ?auto_2035775 - SURFACE
      ?auto_2035771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035774 ?auto_2035770 ) ( IS-CRATE ?auto_2035769 ) ( not ( = ?auto_2035768 ?auto_2035769 ) ) ( not ( = ?auto_2035767 ?auto_2035768 ) ) ( not ( = ?auto_2035767 ?auto_2035769 ) ) ( not ( = ?auto_2035772 ?auto_2035770 ) ) ( HOIST-AT ?auto_2035773 ?auto_2035772 ) ( not ( = ?auto_2035774 ?auto_2035773 ) ) ( AVAILABLE ?auto_2035773 ) ( SURFACE-AT ?auto_2035769 ?auto_2035772 ) ( ON ?auto_2035769 ?auto_2035775 ) ( CLEAR ?auto_2035769 ) ( not ( = ?auto_2035768 ?auto_2035775 ) ) ( not ( = ?auto_2035769 ?auto_2035775 ) ) ( not ( = ?auto_2035767 ?auto_2035775 ) ) ( TRUCK-AT ?auto_2035771 ?auto_2035770 ) ( SURFACE-AT ?auto_2035767 ?auto_2035770 ) ( CLEAR ?auto_2035767 ) ( LIFTING ?auto_2035774 ?auto_2035768 ) ( IS-CRATE ?auto_2035768 ) ( ON ?auto_2035761 ?auto_2035760 ) ( ON ?auto_2035762 ?auto_2035761 ) ( ON ?auto_2035763 ?auto_2035762 ) ( ON ?auto_2035764 ?auto_2035763 ) ( ON ?auto_2035765 ?auto_2035764 ) ( ON ?auto_2035766 ?auto_2035765 ) ( ON ?auto_2035767 ?auto_2035766 ) ( not ( = ?auto_2035760 ?auto_2035761 ) ) ( not ( = ?auto_2035760 ?auto_2035762 ) ) ( not ( = ?auto_2035760 ?auto_2035763 ) ) ( not ( = ?auto_2035760 ?auto_2035764 ) ) ( not ( = ?auto_2035760 ?auto_2035765 ) ) ( not ( = ?auto_2035760 ?auto_2035766 ) ) ( not ( = ?auto_2035760 ?auto_2035767 ) ) ( not ( = ?auto_2035760 ?auto_2035768 ) ) ( not ( = ?auto_2035760 ?auto_2035769 ) ) ( not ( = ?auto_2035760 ?auto_2035775 ) ) ( not ( = ?auto_2035761 ?auto_2035762 ) ) ( not ( = ?auto_2035761 ?auto_2035763 ) ) ( not ( = ?auto_2035761 ?auto_2035764 ) ) ( not ( = ?auto_2035761 ?auto_2035765 ) ) ( not ( = ?auto_2035761 ?auto_2035766 ) ) ( not ( = ?auto_2035761 ?auto_2035767 ) ) ( not ( = ?auto_2035761 ?auto_2035768 ) ) ( not ( = ?auto_2035761 ?auto_2035769 ) ) ( not ( = ?auto_2035761 ?auto_2035775 ) ) ( not ( = ?auto_2035762 ?auto_2035763 ) ) ( not ( = ?auto_2035762 ?auto_2035764 ) ) ( not ( = ?auto_2035762 ?auto_2035765 ) ) ( not ( = ?auto_2035762 ?auto_2035766 ) ) ( not ( = ?auto_2035762 ?auto_2035767 ) ) ( not ( = ?auto_2035762 ?auto_2035768 ) ) ( not ( = ?auto_2035762 ?auto_2035769 ) ) ( not ( = ?auto_2035762 ?auto_2035775 ) ) ( not ( = ?auto_2035763 ?auto_2035764 ) ) ( not ( = ?auto_2035763 ?auto_2035765 ) ) ( not ( = ?auto_2035763 ?auto_2035766 ) ) ( not ( = ?auto_2035763 ?auto_2035767 ) ) ( not ( = ?auto_2035763 ?auto_2035768 ) ) ( not ( = ?auto_2035763 ?auto_2035769 ) ) ( not ( = ?auto_2035763 ?auto_2035775 ) ) ( not ( = ?auto_2035764 ?auto_2035765 ) ) ( not ( = ?auto_2035764 ?auto_2035766 ) ) ( not ( = ?auto_2035764 ?auto_2035767 ) ) ( not ( = ?auto_2035764 ?auto_2035768 ) ) ( not ( = ?auto_2035764 ?auto_2035769 ) ) ( not ( = ?auto_2035764 ?auto_2035775 ) ) ( not ( = ?auto_2035765 ?auto_2035766 ) ) ( not ( = ?auto_2035765 ?auto_2035767 ) ) ( not ( = ?auto_2035765 ?auto_2035768 ) ) ( not ( = ?auto_2035765 ?auto_2035769 ) ) ( not ( = ?auto_2035765 ?auto_2035775 ) ) ( not ( = ?auto_2035766 ?auto_2035767 ) ) ( not ( = ?auto_2035766 ?auto_2035768 ) ) ( not ( = ?auto_2035766 ?auto_2035769 ) ) ( not ( = ?auto_2035766 ?auto_2035775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035767 ?auto_2035768 ?auto_2035769 )
      ( MAKE-9CRATE-VERIFY ?auto_2035760 ?auto_2035761 ?auto_2035762 ?auto_2035763 ?auto_2035764 ?auto_2035765 ?auto_2035766 ?auto_2035767 ?auto_2035768 ?auto_2035769 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035869 - SURFACE
      ?auto_2035870 - SURFACE
      ?auto_2035871 - SURFACE
      ?auto_2035872 - SURFACE
      ?auto_2035873 - SURFACE
      ?auto_2035874 - SURFACE
      ?auto_2035875 - SURFACE
      ?auto_2035876 - SURFACE
      ?auto_2035877 - SURFACE
      ?auto_2035878 - SURFACE
    )
    :vars
    (
      ?auto_2035884 - HOIST
      ?auto_2035883 - PLACE
      ?auto_2035882 - PLACE
      ?auto_2035879 - HOIST
      ?auto_2035880 - SURFACE
      ?auto_2035881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035884 ?auto_2035883 ) ( IS-CRATE ?auto_2035878 ) ( not ( = ?auto_2035877 ?auto_2035878 ) ) ( not ( = ?auto_2035876 ?auto_2035877 ) ) ( not ( = ?auto_2035876 ?auto_2035878 ) ) ( not ( = ?auto_2035882 ?auto_2035883 ) ) ( HOIST-AT ?auto_2035879 ?auto_2035882 ) ( not ( = ?auto_2035884 ?auto_2035879 ) ) ( AVAILABLE ?auto_2035879 ) ( SURFACE-AT ?auto_2035878 ?auto_2035882 ) ( ON ?auto_2035878 ?auto_2035880 ) ( CLEAR ?auto_2035878 ) ( not ( = ?auto_2035877 ?auto_2035880 ) ) ( not ( = ?auto_2035878 ?auto_2035880 ) ) ( not ( = ?auto_2035876 ?auto_2035880 ) ) ( TRUCK-AT ?auto_2035881 ?auto_2035883 ) ( SURFACE-AT ?auto_2035876 ?auto_2035883 ) ( CLEAR ?auto_2035876 ) ( IS-CRATE ?auto_2035877 ) ( AVAILABLE ?auto_2035884 ) ( IN ?auto_2035877 ?auto_2035881 ) ( ON ?auto_2035870 ?auto_2035869 ) ( ON ?auto_2035871 ?auto_2035870 ) ( ON ?auto_2035872 ?auto_2035871 ) ( ON ?auto_2035873 ?auto_2035872 ) ( ON ?auto_2035874 ?auto_2035873 ) ( ON ?auto_2035875 ?auto_2035874 ) ( ON ?auto_2035876 ?auto_2035875 ) ( not ( = ?auto_2035869 ?auto_2035870 ) ) ( not ( = ?auto_2035869 ?auto_2035871 ) ) ( not ( = ?auto_2035869 ?auto_2035872 ) ) ( not ( = ?auto_2035869 ?auto_2035873 ) ) ( not ( = ?auto_2035869 ?auto_2035874 ) ) ( not ( = ?auto_2035869 ?auto_2035875 ) ) ( not ( = ?auto_2035869 ?auto_2035876 ) ) ( not ( = ?auto_2035869 ?auto_2035877 ) ) ( not ( = ?auto_2035869 ?auto_2035878 ) ) ( not ( = ?auto_2035869 ?auto_2035880 ) ) ( not ( = ?auto_2035870 ?auto_2035871 ) ) ( not ( = ?auto_2035870 ?auto_2035872 ) ) ( not ( = ?auto_2035870 ?auto_2035873 ) ) ( not ( = ?auto_2035870 ?auto_2035874 ) ) ( not ( = ?auto_2035870 ?auto_2035875 ) ) ( not ( = ?auto_2035870 ?auto_2035876 ) ) ( not ( = ?auto_2035870 ?auto_2035877 ) ) ( not ( = ?auto_2035870 ?auto_2035878 ) ) ( not ( = ?auto_2035870 ?auto_2035880 ) ) ( not ( = ?auto_2035871 ?auto_2035872 ) ) ( not ( = ?auto_2035871 ?auto_2035873 ) ) ( not ( = ?auto_2035871 ?auto_2035874 ) ) ( not ( = ?auto_2035871 ?auto_2035875 ) ) ( not ( = ?auto_2035871 ?auto_2035876 ) ) ( not ( = ?auto_2035871 ?auto_2035877 ) ) ( not ( = ?auto_2035871 ?auto_2035878 ) ) ( not ( = ?auto_2035871 ?auto_2035880 ) ) ( not ( = ?auto_2035872 ?auto_2035873 ) ) ( not ( = ?auto_2035872 ?auto_2035874 ) ) ( not ( = ?auto_2035872 ?auto_2035875 ) ) ( not ( = ?auto_2035872 ?auto_2035876 ) ) ( not ( = ?auto_2035872 ?auto_2035877 ) ) ( not ( = ?auto_2035872 ?auto_2035878 ) ) ( not ( = ?auto_2035872 ?auto_2035880 ) ) ( not ( = ?auto_2035873 ?auto_2035874 ) ) ( not ( = ?auto_2035873 ?auto_2035875 ) ) ( not ( = ?auto_2035873 ?auto_2035876 ) ) ( not ( = ?auto_2035873 ?auto_2035877 ) ) ( not ( = ?auto_2035873 ?auto_2035878 ) ) ( not ( = ?auto_2035873 ?auto_2035880 ) ) ( not ( = ?auto_2035874 ?auto_2035875 ) ) ( not ( = ?auto_2035874 ?auto_2035876 ) ) ( not ( = ?auto_2035874 ?auto_2035877 ) ) ( not ( = ?auto_2035874 ?auto_2035878 ) ) ( not ( = ?auto_2035874 ?auto_2035880 ) ) ( not ( = ?auto_2035875 ?auto_2035876 ) ) ( not ( = ?auto_2035875 ?auto_2035877 ) ) ( not ( = ?auto_2035875 ?auto_2035878 ) ) ( not ( = ?auto_2035875 ?auto_2035880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035876 ?auto_2035877 ?auto_2035878 )
      ( MAKE-9CRATE-VERIFY ?auto_2035869 ?auto_2035870 ?auto_2035871 ?auto_2035872 ?auto_2035873 ?auto_2035874 ?auto_2035875 ?auto_2035876 ?auto_2035877 ?auto_2035878 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041434 - SURFACE
      ?auto_2041435 - SURFACE
      ?auto_2041436 - SURFACE
      ?auto_2041437 - SURFACE
      ?auto_2041438 - SURFACE
      ?auto_2041439 - SURFACE
      ?auto_2041440 - SURFACE
      ?auto_2041441 - SURFACE
      ?auto_2041442 - SURFACE
      ?auto_2041443 - SURFACE
      ?auto_2041444 - SURFACE
    )
    :vars
    (
      ?auto_2041445 - HOIST
      ?auto_2041446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041445 ?auto_2041446 ) ( SURFACE-AT ?auto_2041443 ?auto_2041446 ) ( CLEAR ?auto_2041443 ) ( LIFTING ?auto_2041445 ?auto_2041444 ) ( IS-CRATE ?auto_2041444 ) ( not ( = ?auto_2041443 ?auto_2041444 ) ) ( ON ?auto_2041435 ?auto_2041434 ) ( ON ?auto_2041436 ?auto_2041435 ) ( ON ?auto_2041437 ?auto_2041436 ) ( ON ?auto_2041438 ?auto_2041437 ) ( ON ?auto_2041439 ?auto_2041438 ) ( ON ?auto_2041440 ?auto_2041439 ) ( ON ?auto_2041441 ?auto_2041440 ) ( ON ?auto_2041442 ?auto_2041441 ) ( ON ?auto_2041443 ?auto_2041442 ) ( not ( = ?auto_2041434 ?auto_2041435 ) ) ( not ( = ?auto_2041434 ?auto_2041436 ) ) ( not ( = ?auto_2041434 ?auto_2041437 ) ) ( not ( = ?auto_2041434 ?auto_2041438 ) ) ( not ( = ?auto_2041434 ?auto_2041439 ) ) ( not ( = ?auto_2041434 ?auto_2041440 ) ) ( not ( = ?auto_2041434 ?auto_2041441 ) ) ( not ( = ?auto_2041434 ?auto_2041442 ) ) ( not ( = ?auto_2041434 ?auto_2041443 ) ) ( not ( = ?auto_2041434 ?auto_2041444 ) ) ( not ( = ?auto_2041435 ?auto_2041436 ) ) ( not ( = ?auto_2041435 ?auto_2041437 ) ) ( not ( = ?auto_2041435 ?auto_2041438 ) ) ( not ( = ?auto_2041435 ?auto_2041439 ) ) ( not ( = ?auto_2041435 ?auto_2041440 ) ) ( not ( = ?auto_2041435 ?auto_2041441 ) ) ( not ( = ?auto_2041435 ?auto_2041442 ) ) ( not ( = ?auto_2041435 ?auto_2041443 ) ) ( not ( = ?auto_2041435 ?auto_2041444 ) ) ( not ( = ?auto_2041436 ?auto_2041437 ) ) ( not ( = ?auto_2041436 ?auto_2041438 ) ) ( not ( = ?auto_2041436 ?auto_2041439 ) ) ( not ( = ?auto_2041436 ?auto_2041440 ) ) ( not ( = ?auto_2041436 ?auto_2041441 ) ) ( not ( = ?auto_2041436 ?auto_2041442 ) ) ( not ( = ?auto_2041436 ?auto_2041443 ) ) ( not ( = ?auto_2041436 ?auto_2041444 ) ) ( not ( = ?auto_2041437 ?auto_2041438 ) ) ( not ( = ?auto_2041437 ?auto_2041439 ) ) ( not ( = ?auto_2041437 ?auto_2041440 ) ) ( not ( = ?auto_2041437 ?auto_2041441 ) ) ( not ( = ?auto_2041437 ?auto_2041442 ) ) ( not ( = ?auto_2041437 ?auto_2041443 ) ) ( not ( = ?auto_2041437 ?auto_2041444 ) ) ( not ( = ?auto_2041438 ?auto_2041439 ) ) ( not ( = ?auto_2041438 ?auto_2041440 ) ) ( not ( = ?auto_2041438 ?auto_2041441 ) ) ( not ( = ?auto_2041438 ?auto_2041442 ) ) ( not ( = ?auto_2041438 ?auto_2041443 ) ) ( not ( = ?auto_2041438 ?auto_2041444 ) ) ( not ( = ?auto_2041439 ?auto_2041440 ) ) ( not ( = ?auto_2041439 ?auto_2041441 ) ) ( not ( = ?auto_2041439 ?auto_2041442 ) ) ( not ( = ?auto_2041439 ?auto_2041443 ) ) ( not ( = ?auto_2041439 ?auto_2041444 ) ) ( not ( = ?auto_2041440 ?auto_2041441 ) ) ( not ( = ?auto_2041440 ?auto_2041442 ) ) ( not ( = ?auto_2041440 ?auto_2041443 ) ) ( not ( = ?auto_2041440 ?auto_2041444 ) ) ( not ( = ?auto_2041441 ?auto_2041442 ) ) ( not ( = ?auto_2041441 ?auto_2041443 ) ) ( not ( = ?auto_2041441 ?auto_2041444 ) ) ( not ( = ?auto_2041442 ?auto_2041443 ) ) ( not ( = ?auto_2041442 ?auto_2041444 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2041443 ?auto_2041444 )
      ( MAKE-10CRATE-VERIFY ?auto_2041434 ?auto_2041435 ?auto_2041436 ?auto_2041437 ?auto_2041438 ?auto_2041439 ?auto_2041440 ?auto_2041441 ?auto_2041442 ?auto_2041443 ?auto_2041444 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041528 - SURFACE
      ?auto_2041529 - SURFACE
      ?auto_2041530 - SURFACE
      ?auto_2041531 - SURFACE
      ?auto_2041532 - SURFACE
      ?auto_2041533 - SURFACE
      ?auto_2041534 - SURFACE
      ?auto_2041535 - SURFACE
      ?auto_2041536 - SURFACE
      ?auto_2041537 - SURFACE
      ?auto_2041538 - SURFACE
    )
    :vars
    (
      ?auto_2041540 - HOIST
      ?auto_2041539 - PLACE
      ?auto_2041541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041540 ?auto_2041539 ) ( SURFACE-AT ?auto_2041537 ?auto_2041539 ) ( CLEAR ?auto_2041537 ) ( IS-CRATE ?auto_2041538 ) ( not ( = ?auto_2041537 ?auto_2041538 ) ) ( TRUCK-AT ?auto_2041541 ?auto_2041539 ) ( AVAILABLE ?auto_2041540 ) ( IN ?auto_2041538 ?auto_2041541 ) ( ON ?auto_2041537 ?auto_2041536 ) ( not ( = ?auto_2041536 ?auto_2041537 ) ) ( not ( = ?auto_2041536 ?auto_2041538 ) ) ( ON ?auto_2041529 ?auto_2041528 ) ( ON ?auto_2041530 ?auto_2041529 ) ( ON ?auto_2041531 ?auto_2041530 ) ( ON ?auto_2041532 ?auto_2041531 ) ( ON ?auto_2041533 ?auto_2041532 ) ( ON ?auto_2041534 ?auto_2041533 ) ( ON ?auto_2041535 ?auto_2041534 ) ( ON ?auto_2041536 ?auto_2041535 ) ( not ( = ?auto_2041528 ?auto_2041529 ) ) ( not ( = ?auto_2041528 ?auto_2041530 ) ) ( not ( = ?auto_2041528 ?auto_2041531 ) ) ( not ( = ?auto_2041528 ?auto_2041532 ) ) ( not ( = ?auto_2041528 ?auto_2041533 ) ) ( not ( = ?auto_2041528 ?auto_2041534 ) ) ( not ( = ?auto_2041528 ?auto_2041535 ) ) ( not ( = ?auto_2041528 ?auto_2041536 ) ) ( not ( = ?auto_2041528 ?auto_2041537 ) ) ( not ( = ?auto_2041528 ?auto_2041538 ) ) ( not ( = ?auto_2041529 ?auto_2041530 ) ) ( not ( = ?auto_2041529 ?auto_2041531 ) ) ( not ( = ?auto_2041529 ?auto_2041532 ) ) ( not ( = ?auto_2041529 ?auto_2041533 ) ) ( not ( = ?auto_2041529 ?auto_2041534 ) ) ( not ( = ?auto_2041529 ?auto_2041535 ) ) ( not ( = ?auto_2041529 ?auto_2041536 ) ) ( not ( = ?auto_2041529 ?auto_2041537 ) ) ( not ( = ?auto_2041529 ?auto_2041538 ) ) ( not ( = ?auto_2041530 ?auto_2041531 ) ) ( not ( = ?auto_2041530 ?auto_2041532 ) ) ( not ( = ?auto_2041530 ?auto_2041533 ) ) ( not ( = ?auto_2041530 ?auto_2041534 ) ) ( not ( = ?auto_2041530 ?auto_2041535 ) ) ( not ( = ?auto_2041530 ?auto_2041536 ) ) ( not ( = ?auto_2041530 ?auto_2041537 ) ) ( not ( = ?auto_2041530 ?auto_2041538 ) ) ( not ( = ?auto_2041531 ?auto_2041532 ) ) ( not ( = ?auto_2041531 ?auto_2041533 ) ) ( not ( = ?auto_2041531 ?auto_2041534 ) ) ( not ( = ?auto_2041531 ?auto_2041535 ) ) ( not ( = ?auto_2041531 ?auto_2041536 ) ) ( not ( = ?auto_2041531 ?auto_2041537 ) ) ( not ( = ?auto_2041531 ?auto_2041538 ) ) ( not ( = ?auto_2041532 ?auto_2041533 ) ) ( not ( = ?auto_2041532 ?auto_2041534 ) ) ( not ( = ?auto_2041532 ?auto_2041535 ) ) ( not ( = ?auto_2041532 ?auto_2041536 ) ) ( not ( = ?auto_2041532 ?auto_2041537 ) ) ( not ( = ?auto_2041532 ?auto_2041538 ) ) ( not ( = ?auto_2041533 ?auto_2041534 ) ) ( not ( = ?auto_2041533 ?auto_2041535 ) ) ( not ( = ?auto_2041533 ?auto_2041536 ) ) ( not ( = ?auto_2041533 ?auto_2041537 ) ) ( not ( = ?auto_2041533 ?auto_2041538 ) ) ( not ( = ?auto_2041534 ?auto_2041535 ) ) ( not ( = ?auto_2041534 ?auto_2041536 ) ) ( not ( = ?auto_2041534 ?auto_2041537 ) ) ( not ( = ?auto_2041534 ?auto_2041538 ) ) ( not ( = ?auto_2041535 ?auto_2041536 ) ) ( not ( = ?auto_2041535 ?auto_2041537 ) ) ( not ( = ?auto_2041535 ?auto_2041538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041536 ?auto_2041537 ?auto_2041538 )
      ( MAKE-10CRATE-VERIFY ?auto_2041528 ?auto_2041529 ?auto_2041530 ?auto_2041531 ?auto_2041532 ?auto_2041533 ?auto_2041534 ?auto_2041535 ?auto_2041536 ?auto_2041537 ?auto_2041538 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041633 - SURFACE
      ?auto_2041634 - SURFACE
      ?auto_2041635 - SURFACE
      ?auto_2041636 - SURFACE
      ?auto_2041637 - SURFACE
      ?auto_2041638 - SURFACE
      ?auto_2041639 - SURFACE
      ?auto_2041640 - SURFACE
      ?auto_2041641 - SURFACE
      ?auto_2041642 - SURFACE
      ?auto_2041643 - SURFACE
    )
    :vars
    (
      ?auto_2041644 - HOIST
      ?auto_2041646 - PLACE
      ?auto_2041645 - TRUCK
      ?auto_2041647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041644 ?auto_2041646 ) ( SURFACE-AT ?auto_2041642 ?auto_2041646 ) ( CLEAR ?auto_2041642 ) ( IS-CRATE ?auto_2041643 ) ( not ( = ?auto_2041642 ?auto_2041643 ) ) ( AVAILABLE ?auto_2041644 ) ( IN ?auto_2041643 ?auto_2041645 ) ( ON ?auto_2041642 ?auto_2041641 ) ( not ( = ?auto_2041641 ?auto_2041642 ) ) ( not ( = ?auto_2041641 ?auto_2041643 ) ) ( TRUCK-AT ?auto_2041645 ?auto_2041647 ) ( not ( = ?auto_2041647 ?auto_2041646 ) ) ( ON ?auto_2041634 ?auto_2041633 ) ( ON ?auto_2041635 ?auto_2041634 ) ( ON ?auto_2041636 ?auto_2041635 ) ( ON ?auto_2041637 ?auto_2041636 ) ( ON ?auto_2041638 ?auto_2041637 ) ( ON ?auto_2041639 ?auto_2041638 ) ( ON ?auto_2041640 ?auto_2041639 ) ( ON ?auto_2041641 ?auto_2041640 ) ( not ( = ?auto_2041633 ?auto_2041634 ) ) ( not ( = ?auto_2041633 ?auto_2041635 ) ) ( not ( = ?auto_2041633 ?auto_2041636 ) ) ( not ( = ?auto_2041633 ?auto_2041637 ) ) ( not ( = ?auto_2041633 ?auto_2041638 ) ) ( not ( = ?auto_2041633 ?auto_2041639 ) ) ( not ( = ?auto_2041633 ?auto_2041640 ) ) ( not ( = ?auto_2041633 ?auto_2041641 ) ) ( not ( = ?auto_2041633 ?auto_2041642 ) ) ( not ( = ?auto_2041633 ?auto_2041643 ) ) ( not ( = ?auto_2041634 ?auto_2041635 ) ) ( not ( = ?auto_2041634 ?auto_2041636 ) ) ( not ( = ?auto_2041634 ?auto_2041637 ) ) ( not ( = ?auto_2041634 ?auto_2041638 ) ) ( not ( = ?auto_2041634 ?auto_2041639 ) ) ( not ( = ?auto_2041634 ?auto_2041640 ) ) ( not ( = ?auto_2041634 ?auto_2041641 ) ) ( not ( = ?auto_2041634 ?auto_2041642 ) ) ( not ( = ?auto_2041634 ?auto_2041643 ) ) ( not ( = ?auto_2041635 ?auto_2041636 ) ) ( not ( = ?auto_2041635 ?auto_2041637 ) ) ( not ( = ?auto_2041635 ?auto_2041638 ) ) ( not ( = ?auto_2041635 ?auto_2041639 ) ) ( not ( = ?auto_2041635 ?auto_2041640 ) ) ( not ( = ?auto_2041635 ?auto_2041641 ) ) ( not ( = ?auto_2041635 ?auto_2041642 ) ) ( not ( = ?auto_2041635 ?auto_2041643 ) ) ( not ( = ?auto_2041636 ?auto_2041637 ) ) ( not ( = ?auto_2041636 ?auto_2041638 ) ) ( not ( = ?auto_2041636 ?auto_2041639 ) ) ( not ( = ?auto_2041636 ?auto_2041640 ) ) ( not ( = ?auto_2041636 ?auto_2041641 ) ) ( not ( = ?auto_2041636 ?auto_2041642 ) ) ( not ( = ?auto_2041636 ?auto_2041643 ) ) ( not ( = ?auto_2041637 ?auto_2041638 ) ) ( not ( = ?auto_2041637 ?auto_2041639 ) ) ( not ( = ?auto_2041637 ?auto_2041640 ) ) ( not ( = ?auto_2041637 ?auto_2041641 ) ) ( not ( = ?auto_2041637 ?auto_2041642 ) ) ( not ( = ?auto_2041637 ?auto_2041643 ) ) ( not ( = ?auto_2041638 ?auto_2041639 ) ) ( not ( = ?auto_2041638 ?auto_2041640 ) ) ( not ( = ?auto_2041638 ?auto_2041641 ) ) ( not ( = ?auto_2041638 ?auto_2041642 ) ) ( not ( = ?auto_2041638 ?auto_2041643 ) ) ( not ( = ?auto_2041639 ?auto_2041640 ) ) ( not ( = ?auto_2041639 ?auto_2041641 ) ) ( not ( = ?auto_2041639 ?auto_2041642 ) ) ( not ( = ?auto_2041639 ?auto_2041643 ) ) ( not ( = ?auto_2041640 ?auto_2041641 ) ) ( not ( = ?auto_2041640 ?auto_2041642 ) ) ( not ( = ?auto_2041640 ?auto_2041643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041641 ?auto_2041642 ?auto_2041643 )
      ( MAKE-10CRATE-VERIFY ?auto_2041633 ?auto_2041634 ?auto_2041635 ?auto_2041636 ?auto_2041637 ?auto_2041638 ?auto_2041639 ?auto_2041640 ?auto_2041641 ?auto_2041642 ?auto_2041643 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041748 - SURFACE
      ?auto_2041749 - SURFACE
      ?auto_2041750 - SURFACE
      ?auto_2041751 - SURFACE
      ?auto_2041752 - SURFACE
      ?auto_2041753 - SURFACE
      ?auto_2041754 - SURFACE
      ?auto_2041755 - SURFACE
      ?auto_2041756 - SURFACE
      ?auto_2041757 - SURFACE
      ?auto_2041758 - SURFACE
    )
    :vars
    (
      ?auto_2041759 - HOIST
      ?auto_2041760 - PLACE
      ?auto_2041761 - TRUCK
      ?auto_2041763 - PLACE
      ?auto_2041762 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041759 ?auto_2041760 ) ( SURFACE-AT ?auto_2041757 ?auto_2041760 ) ( CLEAR ?auto_2041757 ) ( IS-CRATE ?auto_2041758 ) ( not ( = ?auto_2041757 ?auto_2041758 ) ) ( AVAILABLE ?auto_2041759 ) ( ON ?auto_2041757 ?auto_2041756 ) ( not ( = ?auto_2041756 ?auto_2041757 ) ) ( not ( = ?auto_2041756 ?auto_2041758 ) ) ( TRUCK-AT ?auto_2041761 ?auto_2041763 ) ( not ( = ?auto_2041763 ?auto_2041760 ) ) ( HOIST-AT ?auto_2041762 ?auto_2041763 ) ( LIFTING ?auto_2041762 ?auto_2041758 ) ( not ( = ?auto_2041759 ?auto_2041762 ) ) ( ON ?auto_2041749 ?auto_2041748 ) ( ON ?auto_2041750 ?auto_2041749 ) ( ON ?auto_2041751 ?auto_2041750 ) ( ON ?auto_2041752 ?auto_2041751 ) ( ON ?auto_2041753 ?auto_2041752 ) ( ON ?auto_2041754 ?auto_2041753 ) ( ON ?auto_2041755 ?auto_2041754 ) ( ON ?auto_2041756 ?auto_2041755 ) ( not ( = ?auto_2041748 ?auto_2041749 ) ) ( not ( = ?auto_2041748 ?auto_2041750 ) ) ( not ( = ?auto_2041748 ?auto_2041751 ) ) ( not ( = ?auto_2041748 ?auto_2041752 ) ) ( not ( = ?auto_2041748 ?auto_2041753 ) ) ( not ( = ?auto_2041748 ?auto_2041754 ) ) ( not ( = ?auto_2041748 ?auto_2041755 ) ) ( not ( = ?auto_2041748 ?auto_2041756 ) ) ( not ( = ?auto_2041748 ?auto_2041757 ) ) ( not ( = ?auto_2041748 ?auto_2041758 ) ) ( not ( = ?auto_2041749 ?auto_2041750 ) ) ( not ( = ?auto_2041749 ?auto_2041751 ) ) ( not ( = ?auto_2041749 ?auto_2041752 ) ) ( not ( = ?auto_2041749 ?auto_2041753 ) ) ( not ( = ?auto_2041749 ?auto_2041754 ) ) ( not ( = ?auto_2041749 ?auto_2041755 ) ) ( not ( = ?auto_2041749 ?auto_2041756 ) ) ( not ( = ?auto_2041749 ?auto_2041757 ) ) ( not ( = ?auto_2041749 ?auto_2041758 ) ) ( not ( = ?auto_2041750 ?auto_2041751 ) ) ( not ( = ?auto_2041750 ?auto_2041752 ) ) ( not ( = ?auto_2041750 ?auto_2041753 ) ) ( not ( = ?auto_2041750 ?auto_2041754 ) ) ( not ( = ?auto_2041750 ?auto_2041755 ) ) ( not ( = ?auto_2041750 ?auto_2041756 ) ) ( not ( = ?auto_2041750 ?auto_2041757 ) ) ( not ( = ?auto_2041750 ?auto_2041758 ) ) ( not ( = ?auto_2041751 ?auto_2041752 ) ) ( not ( = ?auto_2041751 ?auto_2041753 ) ) ( not ( = ?auto_2041751 ?auto_2041754 ) ) ( not ( = ?auto_2041751 ?auto_2041755 ) ) ( not ( = ?auto_2041751 ?auto_2041756 ) ) ( not ( = ?auto_2041751 ?auto_2041757 ) ) ( not ( = ?auto_2041751 ?auto_2041758 ) ) ( not ( = ?auto_2041752 ?auto_2041753 ) ) ( not ( = ?auto_2041752 ?auto_2041754 ) ) ( not ( = ?auto_2041752 ?auto_2041755 ) ) ( not ( = ?auto_2041752 ?auto_2041756 ) ) ( not ( = ?auto_2041752 ?auto_2041757 ) ) ( not ( = ?auto_2041752 ?auto_2041758 ) ) ( not ( = ?auto_2041753 ?auto_2041754 ) ) ( not ( = ?auto_2041753 ?auto_2041755 ) ) ( not ( = ?auto_2041753 ?auto_2041756 ) ) ( not ( = ?auto_2041753 ?auto_2041757 ) ) ( not ( = ?auto_2041753 ?auto_2041758 ) ) ( not ( = ?auto_2041754 ?auto_2041755 ) ) ( not ( = ?auto_2041754 ?auto_2041756 ) ) ( not ( = ?auto_2041754 ?auto_2041757 ) ) ( not ( = ?auto_2041754 ?auto_2041758 ) ) ( not ( = ?auto_2041755 ?auto_2041756 ) ) ( not ( = ?auto_2041755 ?auto_2041757 ) ) ( not ( = ?auto_2041755 ?auto_2041758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041756 ?auto_2041757 ?auto_2041758 )
      ( MAKE-10CRATE-VERIFY ?auto_2041748 ?auto_2041749 ?auto_2041750 ?auto_2041751 ?auto_2041752 ?auto_2041753 ?auto_2041754 ?auto_2041755 ?auto_2041756 ?auto_2041757 ?auto_2041758 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041873 - SURFACE
      ?auto_2041874 - SURFACE
      ?auto_2041875 - SURFACE
      ?auto_2041876 - SURFACE
      ?auto_2041877 - SURFACE
      ?auto_2041878 - SURFACE
      ?auto_2041879 - SURFACE
      ?auto_2041880 - SURFACE
      ?auto_2041881 - SURFACE
      ?auto_2041882 - SURFACE
      ?auto_2041883 - SURFACE
    )
    :vars
    (
      ?auto_2041888 - HOIST
      ?auto_2041889 - PLACE
      ?auto_2041885 - TRUCK
      ?auto_2041886 - PLACE
      ?auto_2041887 - HOIST
      ?auto_2041884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041888 ?auto_2041889 ) ( SURFACE-AT ?auto_2041882 ?auto_2041889 ) ( CLEAR ?auto_2041882 ) ( IS-CRATE ?auto_2041883 ) ( not ( = ?auto_2041882 ?auto_2041883 ) ) ( AVAILABLE ?auto_2041888 ) ( ON ?auto_2041882 ?auto_2041881 ) ( not ( = ?auto_2041881 ?auto_2041882 ) ) ( not ( = ?auto_2041881 ?auto_2041883 ) ) ( TRUCK-AT ?auto_2041885 ?auto_2041886 ) ( not ( = ?auto_2041886 ?auto_2041889 ) ) ( HOIST-AT ?auto_2041887 ?auto_2041886 ) ( not ( = ?auto_2041888 ?auto_2041887 ) ) ( AVAILABLE ?auto_2041887 ) ( SURFACE-AT ?auto_2041883 ?auto_2041886 ) ( ON ?auto_2041883 ?auto_2041884 ) ( CLEAR ?auto_2041883 ) ( not ( = ?auto_2041882 ?auto_2041884 ) ) ( not ( = ?auto_2041883 ?auto_2041884 ) ) ( not ( = ?auto_2041881 ?auto_2041884 ) ) ( ON ?auto_2041874 ?auto_2041873 ) ( ON ?auto_2041875 ?auto_2041874 ) ( ON ?auto_2041876 ?auto_2041875 ) ( ON ?auto_2041877 ?auto_2041876 ) ( ON ?auto_2041878 ?auto_2041877 ) ( ON ?auto_2041879 ?auto_2041878 ) ( ON ?auto_2041880 ?auto_2041879 ) ( ON ?auto_2041881 ?auto_2041880 ) ( not ( = ?auto_2041873 ?auto_2041874 ) ) ( not ( = ?auto_2041873 ?auto_2041875 ) ) ( not ( = ?auto_2041873 ?auto_2041876 ) ) ( not ( = ?auto_2041873 ?auto_2041877 ) ) ( not ( = ?auto_2041873 ?auto_2041878 ) ) ( not ( = ?auto_2041873 ?auto_2041879 ) ) ( not ( = ?auto_2041873 ?auto_2041880 ) ) ( not ( = ?auto_2041873 ?auto_2041881 ) ) ( not ( = ?auto_2041873 ?auto_2041882 ) ) ( not ( = ?auto_2041873 ?auto_2041883 ) ) ( not ( = ?auto_2041873 ?auto_2041884 ) ) ( not ( = ?auto_2041874 ?auto_2041875 ) ) ( not ( = ?auto_2041874 ?auto_2041876 ) ) ( not ( = ?auto_2041874 ?auto_2041877 ) ) ( not ( = ?auto_2041874 ?auto_2041878 ) ) ( not ( = ?auto_2041874 ?auto_2041879 ) ) ( not ( = ?auto_2041874 ?auto_2041880 ) ) ( not ( = ?auto_2041874 ?auto_2041881 ) ) ( not ( = ?auto_2041874 ?auto_2041882 ) ) ( not ( = ?auto_2041874 ?auto_2041883 ) ) ( not ( = ?auto_2041874 ?auto_2041884 ) ) ( not ( = ?auto_2041875 ?auto_2041876 ) ) ( not ( = ?auto_2041875 ?auto_2041877 ) ) ( not ( = ?auto_2041875 ?auto_2041878 ) ) ( not ( = ?auto_2041875 ?auto_2041879 ) ) ( not ( = ?auto_2041875 ?auto_2041880 ) ) ( not ( = ?auto_2041875 ?auto_2041881 ) ) ( not ( = ?auto_2041875 ?auto_2041882 ) ) ( not ( = ?auto_2041875 ?auto_2041883 ) ) ( not ( = ?auto_2041875 ?auto_2041884 ) ) ( not ( = ?auto_2041876 ?auto_2041877 ) ) ( not ( = ?auto_2041876 ?auto_2041878 ) ) ( not ( = ?auto_2041876 ?auto_2041879 ) ) ( not ( = ?auto_2041876 ?auto_2041880 ) ) ( not ( = ?auto_2041876 ?auto_2041881 ) ) ( not ( = ?auto_2041876 ?auto_2041882 ) ) ( not ( = ?auto_2041876 ?auto_2041883 ) ) ( not ( = ?auto_2041876 ?auto_2041884 ) ) ( not ( = ?auto_2041877 ?auto_2041878 ) ) ( not ( = ?auto_2041877 ?auto_2041879 ) ) ( not ( = ?auto_2041877 ?auto_2041880 ) ) ( not ( = ?auto_2041877 ?auto_2041881 ) ) ( not ( = ?auto_2041877 ?auto_2041882 ) ) ( not ( = ?auto_2041877 ?auto_2041883 ) ) ( not ( = ?auto_2041877 ?auto_2041884 ) ) ( not ( = ?auto_2041878 ?auto_2041879 ) ) ( not ( = ?auto_2041878 ?auto_2041880 ) ) ( not ( = ?auto_2041878 ?auto_2041881 ) ) ( not ( = ?auto_2041878 ?auto_2041882 ) ) ( not ( = ?auto_2041878 ?auto_2041883 ) ) ( not ( = ?auto_2041878 ?auto_2041884 ) ) ( not ( = ?auto_2041879 ?auto_2041880 ) ) ( not ( = ?auto_2041879 ?auto_2041881 ) ) ( not ( = ?auto_2041879 ?auto_2041882 ) ) ( not ( = ?auto_2041879 ?auto_2041883 ) ) ( not ( = ?auto_2041879 ?auto_2041884 ) ) ( not ( = ?auto_2041880 ?auto_2041881 ) ) ( not ( = ?auto_2041880 ?auto_2041882 ) ) ( not ( = ?auto_2041880 ?auto_2041883 ) ) ( not ( = ?auto_2041880 ?auto_2041884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041881 ?auto_2041882 ?auto_2041883 )
      ( MAKE-10CRATE-VERIFY ?auto_2041873 ?auto_2041874 ?auto_2041875 ?auto_2041876 ?auto_2041877 ?auto_2041878 ?auto_2041879 ?auto_2041880 ?auto_2041881 ?auto_2041882 ?auto_2041883 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041999 - SURFACE
      ?auto_2042000 - SURFACE
      ?auto_2042001 - SURFACE
      ?auto_2042002 - SURFACE
      ?auto_2042003 - SURFACE
      ?auto_2042004 - SURFACE
      ?auto_2042005 - SURFACE
      ?auto_2042006 - SURFACE
      ?auto_2042007 - SURFACE
      ?auto_2042008 - SURFACE
      ?auto_2042009 - SURFACE
    )
    :vars
    (
      ?auto_2042014 - HOIST
      ?auto_2042010 - PLACE
      ?auto_2042011 - PLACE
      ?auto_2042012 - HOIST
      ?auto_2042015 - SURFACE
      ?auto_2042013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042014 ?auto_2042010 ) ( SURFACE-AT ?auto_2042008 ?auto_2042010 ) ( CLEAR ?auto_2042008 ) ( IS-CRATE ?auto_2042009 ) ( not ( = ?auto_2042008 ?auto_2042009 ) ) ( AVAILABLE ?auto_2042014 ) ( ON ?auto_2042008 ?auto_2042007 ) ( not ( = ?auto_2042007 ?auto_2042008 ) ) ( not ( = ?auto_2042007 ?auto_2042009 ) ) ( not ( = ?auto_2042011 ?auto_2042010 ) ) ( HOIST-AT ?auto_2042012 ?auto_2042011 ) ( not ( = ?auto_2042014 ?auto_2042012 ) ) ( AVAILABLE ?auto_2042012 ) ( SURFACE-AT ?auto_2042009 ?auto_2042011 ) ( ON ?auto_2042009 ?auto_2042015 ) ( CLEAR ?auto_2042009 ) ( not ( = ?auto_2042008 ?auto_2042015 ) ) ( not ( = ?auto_2042009 ?auto_2042015 ) ) ( not ( = ?auto_2042007 ?auto_2042015 ) ) ( TRUCK-AT ?auto_2042013 ?auto_2042010 ) ( ON ?auto_2042000 ?auto_2041999 ) ( ON ?auto_2042001 ?auto_2042000 ) ( ON ?auto_2042002 ?auto_2042001 ) ( ON ?auto_2042003 ?auto_2042002 ) ( ON ?auto_2042004 ?auto_2042003 ) ( ON ?auto_2042005 ?auto_2042004 ) ( ON ?auto_2042006 ?auto_2042005 ) ( ON ?auto_2042007 ?auto_2042006 ) ( not ( = ?auto_2041999 ?auto_2042000 ) ) ( not ( = ?auto_2041999 ?auto_2042001 ) ) ( not ( = ?auto_2041999 ?auto_2042002 ) ) ( not ( = ?auto_2041999 ?auto_2042003 ) ) ( not ( = ?auto_2041999 ?auto_2042004 ) ) ( not ( = ?auto_2041999 ?auto_2042005 ) ) ( not ( = ?auto_2041999 ?auto_2042006 ) ) ( not ( = ?auto_2041999 ?auto_2042007 ) ) ( not ( = ?auto_2041999 ?auto_2042008 ) ) ( not ( = ?auto_2041999 ?auto_2042009 ) ) ( not ( = ?auto_2041999 ?auto_2042015 ) ) ( not ( = ?auto_2042000 ?auto_2042001 ) ) ( not ( = ?auto_2042000 ?auto_2042002 ) ) ( not ( = ?auto_2042000 ?auto_2042003 ) ) ( not ( = ?auto_2042000 ?auto_2042004 ) ) ( not ( = ?auto_2042000 ?auto_2042005 ) ) ( not ( = ?auto_2042000 ?auto_2042006 ) ) ( not ( = ?auto_2042000 ?auto_2042007 ) ) ( not ( = ?auto_2042000 ?auto_2042008 ) ) ( not ( = ?auto_2042000 ?auto_2042009 ) ) ( not ( = ?auto_2042000 ?auto_2042015 ) ) ( not ( = ?auto_2042001 ?auto_2042002 ) ) ( not ( = ?auto_2042001 ?auto_2042003 ) ) ( not ( = ?auto_2042001 ?auto_2042004 ) ) ( not ( = ?auto_2042001 ?auto_2042005 ) ) ( not ( = ?auto_2042001 ?auto_2042006 ) ) ( not ( = ?auto_2042001 ?auto_2042007 ) ) ( not ( = ?auto_2042001 ?auto_2042008 ) ) ( not ( = ?auto_2042001 ?auto_2042009 ) ) ( not ( = ?auto_2042001 ?auto_2042015 ) ) ( not ( = ?auto_2042002 ?auto_2042003 ) ) ( not ( = ?auto_2042002 ?auto_2042004 ) ) ( not ( = ?auto_2042002 ?auto_2042005 ) ) ( not ( = ?auto_2042002 ?auto_2042006 ) ) ( not ( = ?auto_2042002 ?auto_2042007 ) ) ( not ( = ?auto_2042002 ?auto_2042008 ) ) ( not ( = ?auto_2042002 ?auto_2042009 ) ) ( not ( = ?auto_2042002 ?auto_2042015 ) ) ( not ( = ?auto_2042003 ?auto_2042004 ) ) ( not ( = ?auto_2042003 ?auto_2042005 ) ) ( not ( = ?auto_2042003 ?auto_2042006 ) ) ( not ( = ?auto_2042003 ?auto_2042007 ) ) ( not ( = ?auto_2042003 ?auto_2042008 ) ) ( not ( = ?auto_2042003 ?auto_2042009 ) ) ( not ( = ?auto_2042003 ?auto_2042015 ) ) ( not ( = ?auto_2042004 ?auto_2042005 ) ) ( not ( = ?auto_2042004 ?auto_2042006 ) ) ( not ( = ?auto_2042004 ?auto_2042007 ) ) ( not ( = ?auto_2042004 ?auto_2042008 ) ) ( not ( = ?auto_2042004 ?auto_2042009 ) ) ( not ( = ?auto_2042004 ?auto_2042015 ) ) ( not ( = ?auto_2042005 ?auto_2042006 ) ) ( not ( = ?auto_2042005 ?auto_2042007 ) ) ( not ( = ?auto_2042005 ?auto_2042008 ) ) ( not ( = ?auto_2042005 ?auto_2042009 ) ) ( not ( = ?auto_2042005 ?auto_2042015 ) ) ( not ( = ?auto_2042006 ?auto_2042007 ) ) ( not ( = ?auto_2042006 ?auto_2042008 ) ) ( not ( = ?auto_2042006 ?auto_2042009 ) ) ( not ( = ?auto_2042006 ?auto_2042015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042007 ?auto_2042008 ?auto_2042009 )
      ( MAKE-10CRATE-VERIFY ?auto_2041999 ?auto_2042000 ?auto_2042001 ?auto_2042002 ?auto_2042003 ?auto_2042004 ?auto_2042005 ?auto_2042006 ?auto_2042007 ?auto_2042008 ?auto_2042009 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042125 - SURFACE
      ?auto_2042126 - SURFACE
      ?auto_2042127 - SURFACE
      ?auto_2042128 - SURFACE
      ?auto_2042129 - SURFACE
      ?auto_2042130 - SURFACE
      ?auto_2042131 - SURFACE
      ?auto_2042132 - SURFACE
      ?auto_2042133 - SURFACE
      ?auto_2042134 - SURFACE
      ?auto_2042135 - SURFACE
    )
    :vars
    (
      ?auto_2042138 - HOIST
      ?auto_2042136 - PLACE
      ?auto_2042141 - PLACE
      ?auto_2042140 - HOIST
      ?auto_2042139 - SURFACE
      ?auto_2042137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042138 ?auto_2042136 ) ( IS-CRATE ?auto_2042135 ) ( not ( = ?auto_2042134 ?auto_2042135 ) ) ( not ( = ?auto_2042133 ?auto_2042134 ) ) ( not ( = ?auto_2042133 ?auto_2042135 ) ) ( not ( = ?auto_2042141 ?auto_2042136 ) ) ( HOIST-AT ?auto_2042140 ?auto_2042141 ) ( not ( = ?auto_2042138 ?auto_2042140 ) ) ( AVAILABLE ?auto_2042140 ) ( SURFACE-AT ?auto_2042135 ?auto_2042141 ) ( ON ?auto_2042135 ?auto_2042139 ) ( CLEAR ?auto_2042135 ) ( not ( = ?auto_2042134 ?auto_2042139 ) ) ( not ( = ?auto_2042135 ?auto_2042139 ) ) ( not ( = ?auto_2042133 ?auto_2042139 ) ) ( TRUCK-AT ?auto_2042137 ?auto_2042136 ) ( SURFACE-AT ?auto_2042133 ?auto_2042136 ) ( CLEAR ?auto_2042133 ) ( LIFTING ?auto_2042138 ?auto_2042134 ) ( IS-CRATE ?auto_2042134 ) ( ON ?auto_2042126 ?auto_2042125 ) ( ON ?auto_2042127 ?auto_2042126 ) ( ON ?auto_2042128 ?auto_2042127 ) ( ON ?auto_2042129 ?auto_2042128 ) ( ON ?auto_2042130 ?auto_2042129 ) ( ON ?auto_2042131 ?auto_2042130 ) ( ON ?auto_2042132 ?auto_2042131 ) ( ON ?auto_2042133 ?auto_2042132 ) ( not ( = ?auto_2042125 ?auto_2042126 ) ) ( not ( = ?auto_2042125 ?auto_2042127 ) ) ( not ( = ?auto_2042125 ?auto_2042128 ) ) ( not ( = ?auto_2042125 ?auto_2042129 ) ) ( not ( = ?auto_2042125 ?auto_2042130 ) ) ( not ( = ?auto_2042125 ?auto_2042131 ) ) ( not ( = ?auto_2042125 ?auto_2042132 ) ) ( not ( = ?auto_2042125 ?auto_2042133 ) ) ( not ( = ?auto_2042125 ?auto_2042134 ) ) ( not ( = ?auto_2042125 ?auto_2042135 ) ) ( not ( = ?auto_2042125 ?auto_2042139 ) ) ( not ( = ?auto_2042126 ?auto_2042127 ) ) ( not ( = ?auto_2042126 ?auto_2042128 ) ) ( not ( = ?auto_2042126 ?auto_2042129 ) ) ( not ( = ?auto_2042126 ?auto_2042130 ) ) ( not ( = ?auto_2042126 ?auto_2042131 ) ) ( not ( = ?auto_2042126 ?auto_2042132 ) ) ( not ( = ?auto_2042126 ?auto_2042133 ) ) ( not ( = ?auto_2042126 ?auto_2042134 ) ) ( not ( = ?auto_2042126 ?auto_2042135 ) ) ( not ( = ?auto_2042126 ?auto_2042139 ) ) ( not ( = ?auto_2042127 ?auto_2042128 ) ) ( not ( = ?auto_2042127 ?auto_2042129 ) ) ( not ( = ?auto_2042127 ?auto_2042130 ) ) ( not ( = ?auto_2042127 ?auto_2042131 ) ) ( not ( = ?auto_2042127 ?auto_2042132 ) ) ( not ( = ?auto_2042127 ?auto_2042133 ) ) ( not ( = ?auto_2042127 ?auto_2042134 ) ) ( not ( = ?auto_2042127 ?auto_2042135 ) ) ( not ( = ?auto_2042127 ?auto_2042139 ) ) ( not ( = ?auto_2042128 ?auto_2042129 ) ) ( not ( = ?auto_2042128 ?auto_2042130 ) ) ( not ( = ?auto_2042128 ?auto_2042131 ) ) ( not ( = ?auto_2042128 ?auto_2042132 ) ) ( not ( = ?auto_2042128 ?auto_2042133 ) ) ( not ( = ?auto_2042128 ?auto_2042134 ) ) ( not ( = ?auto_2042128 ?auto_2042135 ) ) ( not ( = ?auto_2042128 ?auto_2042139 ) ) ( not ( = ?auto_2042129 ?auto_2042130 ) ) ( not ( = ?auto_2042129 ?auto_2042131 ) ) ( not ( = ?auto_2042129 ?auto_2042132 ) ) ( not ( = ?auto_2042129 ?auto_2042133 ) ) ( not ( = ?auto_2042129 ?auto_2042134 ) ) ( not ( = ?auto_2042129 ?auto_2042135 ) ) ( not ( = ?auto_2042129 ?auto_2042139 ) ) ( not ( = ?auto_2042130 ?auto_2042131 ) ) ( not ( = ?auto_2042130 ?auto_2042132 ) ) ( not ( = ?auto_2042130 ?auto_2042133 ) ) ( not ( = ?auto_2042130 ?auto_2042134 ) ) ( not ( = ?auto_2042130 ?auto_2042135 ) ) ( not ( = ?auto_2042130 ?auto_2042139 ) ) ( not ( = ?auto_2042131 ?auto_2042132 ) ) ( not ( = ?auto_2042131 ?auto_2042133 ) ) ( not ( = ?auto_2042131 ?auto_2042134 ) ) ( not ( = ?auto_2042131 ?auto_2042135 ) ) ( not ( = ?auto_2042131 ?auto_2042139 ) ) ( not ( = ?auto_2042132 ?auto_2042133 ) ) ( not ( = ?auto_2042132 ?auto_2042134 ) ) ( not ( = ?auto_2042132 ?auto_2042135 ) ) ( not ( = ?auto_2042132 ?auto_2042139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042133 ?auto_2042134 ?auto_2042135 )
      ( MAKE-10CRATE-VERIFY ?auto_2042125 ?auto_2042126 ?auto_2042127 ?auto_2042128 ?auto_2042129 ?auto_2042130 ?auto_2042131 ?auto_2042132 ?auto_2042133 ?auto_2042134 ?auto_2042135 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042251 - SURFACE
      ?auto_2042252 - SURFACE
      ?auto_2042253 - SURFACE
      ?auto_2042254 - SURFACE
      ?auto_2042255 - SURFACE
      ?auto_2042256 - SURFACE
      ?auto_2042257 - SURFACE
      ?auto_2042258 - SURFACE
      ?auto_2042259 - SURFACE
      ?auto_2042260 - SURFACE
      ?auto_2042261 - SURFACE
    )
    :vars
    (
      ?auto_2042266 - HOIST
      ?auto_2042267 - PLACE
      ?auto_2042264 - PLACE
      ?auto_2042263 - HOIST
      ?auto_2042262 - SURFACE
      ?auto_2042265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042266 ?auto_2042267 ) ( IS-CRATE ?auto_2042261 ) ( not ( = ?auto_2042260 ?auto_2042261 ) ) ( not ( = ?auto_2042259 ?auto_2042260 ) ) ( not ( = ?auto_2042259 ?auto_2042261 ) ) ( not ( = ?auto_2042264 ?auto_2042267 ) ) ( HOIST-AT ?auto_2042263 ?auto_2042264 ) ( not ( = ?auto_2042266 ?auto_2042263 ) ) ( AVAILABLE ?auto_2042263 ) ( SURFACE-AT ?auto_2042261 ?auto_2042264 ) ( ON ?auto_2042261 ?auto_2042262 ) ( CLEAR ?auto_2042261 ) ( not ( = ?auto_2042260 ?auto_2042262 ) ) ( not ( = ?auto_2042261 ?auto_2042262 ) ) ( not ( = ?auto_2042259 ?auto_2042262 ) ) ( TRUCK-AT ?auto_2042265 ?auto_2042267 ) ( SURFACE-AT ?auto_2042259 ?auto_2042267 ) ( CLEAR ?auto_2042259 ) ( IS-CRATE ?auto_2042260 ) ( AVAILABLE ?auto_2042266 ) ( IN ?auto_2042260 ?auto_2042265 ) ( ON ?auto_2042252 ?auto_2042251 ) ( ON ?auto_2042253 ?auto_2042252 ) ( ON ?auto_2042254 ?auto_2042253 ) ( ON ?auto_2042255 ?auto_2042254 ) ( ON ?auto_2042256 ?auto_2042255 ) ( ON ?auto_2042257 ?auto_2042256 ) ( ON ?auto_2042258 ?auto_2042257 ) ( ON ?auto_2042259 ?auto_2042258 ) ( not ( = ?auto_2042251 ?auto_2042252 ) ) ( not ( = ?auto_2042251 ?auto_2042253 ) ) ( not ( = ?auto_2042251 ?auto_2042254 ) ) ( not ( = ?auto_2042251 ?auto_2042255 ) ) ( not ( = ?auto_2042251 ?auto_2042256 ) ) ( not ( = ?auto_2042251 ?auto_2042257 ) ) ( not ( = ?auto_2042251 ?auto_2042258 ) ) ( not ( = ?auto_2042251 ?auto_2042259 ) ) ( not ( = ?auto_2042251 ?auto_2042260 ) ) ( not ( = ?auto_2042251 ?auto_2042261 ) ) ( not ( = ?auto_2042251 ?auto_2042262 ) ) ( not ( = ?auto_2042252 ?auto_2042253 ) ) ( not ( = ?auto_2042252 ?auto_2042254 ) ) ( not ( = ?auto_2042252 ?auto_2042255 ) ) ( not ( = ?auto_2042252 ?auto_2042256 ) ) ( not ( = ?auto_2042252 ?auto_2042257 ) ) ( not ( = ?auto_2042252 ?auto_2042258 ) ) ( not ( = ?auto_2042252 ?auto_2042259 ) ) ( not ( = ?auto_2042252 ?auto_2042260 ) ) ( not ( = ?auto_2042252 ?auto_2042261 ) ) ( not ( = ?auto_2042252 ?auto_2042262 ) ) ( not ( = ?auto_2042253 ?auto_2042254 ) ) ( not ( = ?auto_2042253 ?auto_2042255 ) ) ( not ( = ?auto_2042253 ?auto_2042256 ) ) ( not ( = ?auto_2042253 ?auto_2042257 ) ) ( not ( = ?auto_2042253 ?auto_2042258 ) ) ( not ( = ?auto_2042253 ?auto_2042259 ) ) ( not ( = ?auto_2042253 ?auto_2042260 ) ) ( not ( = ?auto_2042253 ?auto_2042261 ) ) ( not ( = ?auto_2042253 ?auto_2042262 ) ) ( not ( = ?auto_2042254 ?auto_2042255 ) ) ( not ( = ?auto_2042254 ?auto_2042256 ) ) ( not ( = ?auto_2042254 ?auto_2042257 ) ) ( not ( = ?auto_2042254 ?auto_2042258 ) ) ( not ( = ?auto_2042254 ?auto_2042259 ) ) ( not ( = ?auto_2042254 ?auto_2042260 ) ) ( not ( = ?auto_2042254 ?auto_2042261 ) ) ( not ( = ?auto_2042254 ?auto_2042262 ) ) ( not ( = ?auto_2042255 ?auto_2042256 ) ) ( not ( = ?auto_2042255 ?auto_2042257 ) ) ( not ( = ?auto_2042255 ?auto_2042258 ) ) ( not ( = ?auto_2042255 ?auto_2042259 ) ) ( not ( = ?auto_2042255 ?auto_2042260 ) ) ( not ( = ?auto_2042255 ?auto_2042261 ) ) ( not ( = ?auto_2042255 ?auto_2042262 ) ) ( not ( = ?auto_2042256 ?auto_2042257 ) ) ( not ( = ?auto_2042256 ?auto_2042258 ) ) ( not ( = ?auto_2042256 ?auto_2042259 ) ) ( not ( = ?auto_2042256 ?auto_2042260 ) ) ( not ( = ?auto_2042256 ?auto_2042261 ) ) ( not ( = ?auto_2042256 ?auto_2042262 ) ) ( not ( = ?auto_2042257 ?auto_2042258 ) ) ( not ( = ?auto_2042257 ?auto_2042259 ) ) ( not ( = ?auto_2042257 ?auto_2042260 ) ) ( not ( = ?auto_2042257 ?auto_2042261 ) ) ( not ( = ?auto_2042257 ?auto_2042262 ) ) ( not ( = ?auto_2042258 ?auto_2042259 ) ) ( not ( = ?auto_2042258 ?auto_2042260 ) ) ( not ( = ?auto_2042258 ?auto_2042261 ) ) ( not ( = ?auto_2042258 ?auto_2042262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042259 ?auto_2042260 ?auto_2042261 )
      ( MAKE-10CRATE-VERIFY ?auto_2042251 ?auto_2042252 ?auto_2042253 ?auto_2042254 ?auto_2042255 ?auto_2042256 ?auto_2042257 ?auto_2042258 ?auto_2042259 ?auto_2042260 ?auto_2042261 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049518 - SURFACE
      ?auto_2049519 - SURFACE
      ?auto_2049520 - SURFACE
      ?auto_2049521 - SURFACE
      ?auto_2049522 - SURFACE
      ?auto_2049523 - SURFACE
      ?auto_2049524 - SURFACE
      ?auto_2049525 - SURFACE
      ?auto_2049526 - SURFACE
      ?auto_2049527 - SURFACE
      ?auto_2049528 - SURFACE
      ?auto_2049529 - SURFACE
    )
    :vars
    (
      ?auto_2049531 - HOIST
      ?auto_2049530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049531 ?auto_2049530 ) ( SURFACE-AT ?auto_2049528 ?auto_2049530 ) ( CLEAR ?auto_2049528 ) ( LIFTING ?auto_2049531 ?auto_2049529 ) ( IS-CRATE ?auto_2049529 ) ( not ( = ?auto_2049528 ?auto_2049529 ) ) ( ON ?auto_2049519 ?auto_2049518 ) ( ON ?auto_2049520 ?auto_2049519 ) ( ON ?auto_2049521 ?auto_2049520 ) ( ON ?auto_2049522 ?auto_2049521 ) ( ON ?auto_2049523 ?auto_2049522 ) ( ON ?auto_2049524 ?auto_2049523 ) ( ON ?auto_2049525 ?auto_2049524 ) ( ON ?auto_2049526 ?auto_2049525 ) ( ON ?auto_2049527 ?auto_2049526 ) ( ON ?auto_2049528 ?auto_2049527 ) ( not ( = ?auto_2049518 ?auto_2049519 ) ) ( not ( = ?auto_2049518 ?auto_2049520 ) ) ( not ( = ?auto_2049518 ?auto_2049521 ) ) ( not ( = ?auto_2049518 ?auto_2049522 ) ) ( not ( = ?auto_2049518 ?auto_2049523 ) ) ( not ( = ?auto_2049518 ?auto_2049524 ) ) ( not ( = ?auto_2049518 ?auto_2049525 ) ) ( not ( = ?auto_2049518 ?auto_2049526 ) ) ( not ( = ?auto_2049518 ?auto_2049527 ) ) ( not ( = ?auto_2049518 ?auto_2049528 ) ) ( not ( = ?auto_2049518 ?auto_2049529 ) ) ( not ( = ?auto_2049519 ?auto_2049520 ) ) ( not ( = ?auto_2049519 ?auto_2049521 ) ) ( not ( = ?auto_2049519 ?auto_2049522 ) ) ( not ( = ?auto_2049519 ?auto_2049523 ) ) ( not ( = ?auto_2049519 ?auto_2049524 ) ) ( not ( = ?auto_2049519 ?auto_2049525 ) ) ( not ( = ?auto_2049519 ?auto_2049526 ) ) ( not ( = ?auto_2049519 ?auto_2049527 ) ) ( not ( = ?auto_2049519 ?auto_2049528 ) ) ( not ( = ?auto_2049519 ?auto_2049529 ) ) ( not ( = ?auto_2049520 ?auto_2049521 ) ) ( not ( = ?auto_2049520 ?auto_2049522 ) ) ( not ( = ?auto_2049520 ?auto_2049523 ) ) ( not ( = ?auto_2049520 ?auto_2049524 ) ) ( not ( = ?auto_2049520 ?auto_2049525 ) ) ( not ( = ?auto_2049520 ?auto_2049526 ) ) ( not ( = ?auto_2049520 ?auto_2049527 ) ) ( not ( = ?auto_2049520 ?auto_2049528 ) ) ( not ( = ?auto_2049520 ?auto_2049529 ) ) ( not ( = ?auto_2049521 ?auto_2049522 ) ) ( not ( = ?auto_2049521 ?auto_2049523 ) ) ( not ( = ?auto_2049521 ?auto_2049524 ) ) ( not ( = ?auto_2049521 ?auto_2049525 ) ) ( not ( = ?auto_2049521 ?auto_2049526 ) ) ( not ( = ?auto_2049521 ?auto_2049527 ) ) ( not ( = ?auto_2049521 ?auto_2049528 ) ) ( not ( = ?auto_2049521 ?auto_2049529 ) ) ( not ( = ?auto_2049522 ?auto_2049523 ) ) ( not ( = ?auto_2049522 ?auto_2049524 ) ) ( not ( = ?auto_2049522 ?auto_2049525 ) ) ( not ( = ?auto_2049522 ?auto_2049526 ) ) ( not ( = ?auto_2049522 ?auto_2049527 ) ) ( not ( = ?auto_2049522 ?auto_2049528 ) ) ( not ( = ?auto_2049522 ?auto_2049529 ) ) ( not ( = ?auto_2049523 ?auto_2049524 ) ) ( not ( = ?auto_2049523 ?auto_2049525 ) ) ( not ( = ?auto_2049523 ?auto_2049526 ) ) ( not ( = ?auto_2049523 ?auto_2049527 ) ) ( not ( = ?auto_2049523 ?auto_2049528 ) ) ( not ( = ?auto_2049523 ?auto_2049529 ) ) ( not ( = ?auto_2049524 ?auto_2049525 ) ) ( not ( = ?auto_2049524 ?auto_2049526 ) ) ( not ( = ?auto_2049524 ?auto_2049527 ) ) ( not ( = ?auto_2049524 ?auto_2049528 ) ) ( not ( = ?auto_2049524 ?auto_2049529 ) ) ( not ( = ?auto_2049525 ?auto_2049526 ) ) ( not ( = ?auto_2049525 ?auto_2049527 ) ) ( not ( = ?auto_2049525 ?auto_2049528 ) ) ( not ( = ?auto_2049525 ?auto_2049529 ) ) ( not ( = ?auto_2049526 ?auto_2049527 ) ) ( not ( = ?auto_2049526 ?auto_2049528 ) ) ( not ( = ?auto_2049526 ?auto_2049529 ) ) ( not ( = ?auto_2049527 ?auto_2049528 ) ) ( not ( = ?auto_2049527 ?auto_2049529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2049528 ?auto_2049529 )
      ( MAKE-11CRATE-VERIFY ?auto_2049518 ?auto_2049519 ?auto_2049520 ?auto_2049521 ?auto_2049522 ?auto_2049523 ?auto_2049524 ?auto_2049525 ?auto_2049526 ?auto_2049527 ?auto_2049528 ?auto_2049529 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049627 - SURFACE
      ?auto_2049628 - SURFACE
      ?auto_2049629 - SURFACE
      ?auto_2049630 - SURFACE
      ?auto_2049631 - SURFACE
      ?auto_2049632 - SURFACE
      ?auto_2049633 - SURFACE
      ?auto_2049634 - SURFACE
      ?auto_2049635 - SURFACE
      ?auto_2049636 - SURFACE
      ?auto_2049637 - SURFACE
      ?auto_2049638 - SURFACE
    )
    :vars
    (
      ?auto_2049639 - HOIST
      ?auto_2049641 - PLACE
      ?auto_2049640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049639 ?auto_2049641 ) ( SURFACE-AT ?auto_2049637 ?auto_2049641 ) ( CLEAR ?auto_2049637 ) ( IS-CRATE ?auto_2049638 ) ( not ( = ?auto_2049637 ?auto_2049638 ) ) ( TRUCK-AT ?auto_2049640 ?auto_2049641 ) ( AVAILABLE ?auto_2049639 ) ( IN ?auto_2049638 ?auto_2049640 ) ( ON ?auto_2049637 ?auto_2049636 ) ( not ( = ?auto_2049636 ?auto_2049637 ) ) ( not ( = ?auto_2049636 ?auto_2049638 ) ) ( ON ?auto_2049628 ?auto_2049627 ) ( ON ?auto_2049629 ?auto_2049628 ) ( ON ?auto_2049630 ?auto_2049629 ) ( ON ?auto_2049631 ?auto_2049630 ) ( ON ?auto_2049632 ?auto_2049631 ) ( ON ?auto_2049633 ?auto_2049632 ) ( ON ?auto_2049634 ?auto_2049633 ) ( ON ?auto_2049635 ?auto_2049634 ) ( ON ?auto_2049636 ?auto_2049635 ) ( not ( = ?auto_2049627 ?auto_2049628 ) ) ( not ( = ?auto_2049627 ?auto_2049629 ) ) ( not ( = ?auto_2049627 ?auto_2049630 ) ) ( not ( = ?auto_2049627 ?auto_2049631 ) ) ( not ( = ?auto_2049627 ?auto_2049632 ) ) ( not ( = ?auto_2049627 ?auto_2049633 ) ) ( not ( = ?auto_2049627 ?auto_2049634 ) ) ( not ( = ?auto_2049627 ?auto_2049635 ) ) ( not ( = ?auto_2049627 ?auto_2049636 ) ) ( not ( = ?auto_2049627 ?auto_2049637 ) ) ( not ( = ?auto_2049627 ?auto_2049638 ) ) ( not ( = ?auto_2049628 ?auto_2049629 ) ) ( not ( = ?auto_2049628 ?auto_2049630 ) ) ( not ( = ?auto_2049628 ?auto_2049631 ) ) ( not ( = ?auto_2049628 ?auto_2049632 ) ) ( not ( = ?auto_2049628 ?auto_2049633 ) ) ( not ( = ?auto_2049628 ?auto_2049634 ) ) ( not ( = ?auto_2049628 ?auto_2049635 ) ) ( not ( = ?auto_2049628 ?auto_2049636 ) ) ( not ( = ?auto_2049628 ?auto_2049637 ) ) ( not ( = ?auto_2049628 ?auto_2049638 ) ) ( not ( = ?auto_2049629 ?auto_2049630 ) ) ( not ( = ?auto_2049629 ?auto_2049631 ) ) ( not ( = ?auto_2049629 ?auto_2049632 ) ) ( not ( = ?auto_2049629 ?auto_2049633 ) ) ( not ( = ?auto_2049629 ?auto_2049634 ) ) ( not ( = ?auto_2049629 ?auto_2049635 ) ) ( not ( = ?auto_2049629 ?auto_2049636 ) ) ( not ( = ?auto_2049629 ?auto_2049637 ) ) ( not ( = ?auto_2049629 ?auto_2049638 ) ) ( not ( = ?auto_2049630 ?auto_2049631 ) ) ( not ( = ?auto_2049630 ?auto_2049632 ) ) ( not ( = ?auto_2049630 ?auto_2049633 ) ) ( not ( = ?auto_2049630 ?auto_2049634 ) ) ( not ( = ?auto_2049630 ?auto_2049635 ) ) ( not ( = ?auto_2049630 ?auto_2049636 ) ) ( not ( = ?auto_2049630 ?auto_2049637 ) ) ( not ( = ?auto_2049630 ?auto_2049638 ) ) ( not ( = ?auto_2049631 ?auto_2049632 ) ) ( not ( = ?auto_2049631 ?auto_2049633 ) ) ( not ( = ?auto_2049631 ?auto_2049634 ) ) ( not ( = ?auto_2049631 ?auto_2049635 ) ) ( not ( = ?auto_2049631 ?auto_2049636 ) ) ( not ( = ?auto_2049631 ?auto_2049637 ) ) ( not ( = ?auto_2049631 ?auto_2049638 ) ) ( not ( = ?auto_2049632 ?auto_2049633 ) ) ( not ( = ?auto_2049632 ?auto_2049634 ) ) ( not ( = ?auto_2049632 ?auto_2049635 ) ) ( not ( = ?auto_2049632 ?auto_2049636 ) ) ( not ( = ?auto_2049632 ?auto_2049637 ) ) ( not ( = ?auto_2049632 ?auto_2049638 ) ) ( not ( = ?auto_2049633 ?auto_2049634 ) ) ( not ( = ?auto_2049633 ?auto_2049635 ) ) ( not ( = ?auto_2049633 ?auto_2049636 ) ) ( not ( = ?auto_2049633 ?auto_2049637 ) ) ( not ( = ?auto_2049633 ?auto_2049638 ) ) ( not ( = ?auto_2049634 ?auto_2049635 ) ) ( not ( = ?auto_2049634 ?auto_2049636 ) ) ( not ( = ?auto_2049634 ?auto_2049637 ) ) ( not ( = ?auto_2049634 ?auto_2049638 ) ) ( not ( = ?auto_2049635 ?auto_2049636 ) ) ( not ( = ?auto_2049635 ?auto_2049637 ) ) ( not ( = ?auto_2049635 ?auto_2049638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049636 ?auto_2049637 ?auto_2049638 )
      ( MAKE-11CRATE-VERIFY ?auto_2049627 ?auto_2049628 ?auto_2049629 ?auto_2049630 ?auto_2049631 ?auto_2049632 ?auto_2049633 ?auto_2049634 ?auto_2049635 ?auto_2049636 ?auto_2049637 ?auto_2049638 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049748 - SURFACE
      ?auto_2049749 - SURFACE
      ?auto_2049750 - SURFACE
      ?auto_2049751 - SURFACE
      ?auto_2049752 - SURFACE
      ?auto_2049753 - SURFACE
      ?auto_2049754 - SURFACE
      ?auto_2049755 - SURFACE
      ?auto_2049756 - SURFACE
      ?auto_2049757 - SURFACE
      ?auto_2049758 - SURFACE
      ?auto_2049759 - SURFACE
    )
    :vars
    (
      ?auto_2049760 - HOIST
      ?auto_2049763 - PLACE
      ?auto_2049762 - TRUCK
      ?auto_2049761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049760 ?auto_2049763 ) ( SURFACE-AT ?auto_2049758 ?auto_2049763 ) ( CLEAR ?auto_2049758 ) ( IS-CRATE ?auto_2049759 ) ( not ( = ?auto_2049758 ?auto_2049759 ) ) ( AVAILABLE ?auto_2049760 ) ( IN ?auto_2049759 ?auto_2049762 ) ( ON ?auto_2049758 ?auto_2049757 ) ( not ( = ?auto_2049757 ?auto_2049758 ) ) ( not ( = ?auto_2049757 ?auto_2049759 ) ) ( TRUCK-AT ?auto_2049762 ?auto_2049761 ) ( not ( = ?auto_2049761 ?auto_2049763 ) ) ( ON ?auto_2049749 ?auto_2049748 ) ( ON ?auto_2049750 ?auto_2049749 ) ( ON ?auto_2049751 ?auto_2049750 ) ( ON ?auto_2049752 ?auto_2049751 ) ( ON ?auto_2049753 ?auto_2049752 ) ( ON ?auto_2049754 ?auto_2049753 ) ( ON ?auto_2049755 ?auto_2049754 ) ( ON ?auto_2049756 ?auto_2049755 ) ( ON ?auto_2049757 ?auto_2049756 ) ( not ( = ?auto_2049748 ?auto_2049749 ) ) ( not ( = ?auto_2049748 ?auto_2049750 ) ) ( not ( = ?auto_2049748 ?auto_2049751 ) ) ( not ( = ?auto_2049748 ?auto_2049752 ) ) ( not ( = ?auto_2049748 ?auto_2049753 ) ) ( not ( = ?auto_2049748 ?auto_2049754 ) ) ( not ( = ?auto_2049748 ?auto_2049755 ) ) ( not ( = ?auto_2049748 ?auto_2049756 ) ) ( not ( = ?auto_2049748 ?auto_2049757 ) ) ( not ( = ?auto_2049748 ?auto_2049758 ) ) ( not ( = ?auto_2049748 ?auto_2049759 ) ) ( not ( = ?auto_2049749 ?auto_2049750 ) ) ( not ( = ?auto_2049749 ?auto_2049751 ) ) ( not ( = ?auto_2049749 ?auto_2049752 ) ) ( not ( = ?auto_2049749 ?auto_2049753 ) ) ( not ( = ?auto_2049749 ?auto_2049754 ) ) ( not ( = ?auto_2049749 ?auto_2049755 ) ) ( not ( = ?auto_2049749 ?auto_2049756 ) ) ( not ( = ?auto_2049749 ?auto_2049757 ) ) ( not ( = ?auto_2049749 ?auto_2049758 ) ) ( not ( = ?auto_2049749 ?auto_2049759 ) ) ( not ( = ?auto_2049750 ?auto_2049751 ) ) ( not ( = ?auto_2049750 ?auto_2049752 ) ) ( not ( = ?auto_2049750 ?auto_2049753 ) ) ( not ( = ?auto_2049750 ?auto_2049754 ) ) ( not ( = ?auto_2049750 ?auto_2049755 ) ) ( not ( = ?auto_2049750 ?auto_2049756 ) ) ( not ( = ?auto_2049750 ?auto_2049757 ) ) ( not ( = ?auto_2049750 ?auto_2049758 ) ) ( not ( = ?auto_2049750 ?auto_2049759 ) ) ( not ( = ?auto_2049751 ?auto_2049752 ) ) ( not ( = ?auto_2049751 ?auto_2049753 ) ) ( not ( = ?auto_2049751 ?auto_2049754 ) ) ( not ( = ?auto_2049751 ?auto_2049755 ) ) ( not ( = ?auto_2049751 ?auto_2049756 ) ) ( not ( = ?auto_2049751 ?auto_2049757 ) ) ( not ( = ?auto_2049751 ?auto_2049758 ) ) ( not ( = ?auto_2049751 ?auto_2049759 ) ) ( not ( = ?auto_2049752 ?auto_2049753 ) ) ( not ( = ?auto_2049752 ?auto_2049754 ) ) ( not ( = ?auto_2049752 ?auto_2049755 ) ) ( not ( = ?auto_2049752 ?auto_2049756 ) ) ( not ( = ?auto_2049752 ?auto_2049757 ) ) ( not ( = ?auto_2049752 ?auto_2049758 ) ) ( not ( = ?auto_2049752 ?auto_2049759 ) ) ( not ( = ?auto_2049753 ?auto_2049754 ) ) ( not ( = ?auto_2049753 ?auto_2049755 ) ) ( not ( = ?auto_2049753 ?auto_2049756 ) ) ( not ( = ?auto_2049753 ?auto_2049757 ) ) ( not ( = ?auto_2049753 ?auto_2049758 ) ) ( not ( = ?auto_2049753 ?auto_2049759 ) ) ( not ( = ?auto_2049754 ?auto_2049755 ) ) ( not ( = ?auto_2049754 ?auto_2049756 ) ) ( not ( = ?auto_2049754 ?auto_2049757 ) ) ( not ( = ?auto_2049754 ?auto_2049758 ) ) ( not ( = ?auto_2049754 ?auto_2049759 ) ) ( not ( = ?auto_2049755 ?auto_2049756 ) ) ( not ( = ?auto_2049755 ?auto_2049757 ) ) ( not ( = ?auto_2049755 ?auto_2049758 ) ) ( not ( = ?auto_2049755 ?auto_2049759 ) ) ( not ( = ?auto_2049756 ?auto_2049757 ) ) ( not ( = ?auto_2049756 ?auto_2049758 ) ) ( not ( = ?auto_2049756 ?auto_2049759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049757 ?auto_2049758 ?auto_2049759 )
      ( MAKE-11CRATE-VERIFY ?auto_2049748 ?auto_2049749 ?auto_2049750 ?auto_2049751 ?auto_2049752 ?auto_2049753 ?auto_2049754 ?auto_2049755 ?auto_2049756 ?auto_2049757 ?auto_2049758 ?auto_2049759 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049880 - SURFACE
      ?auto_2049881 - SURFACE
      ?auto_2049882 - SURFACE
      ?auto_2049883 - SURFACE
      ?auto_2049884 - SURFACE
      ?auto_2049885 - SURFACE
      ?auto_2049886 - SURFACE
      ?auto_2049887 - SURFACE
      ?auto_2049888 - SURFACE
      ?auto_2049889 - SURFACE
      ?auto_2049890 - SURFACE
      ?auto_2049891 - SURFACE
    )
    :vars
    (
      ?auto_2049894 - HOIST
      ?auto_2049895 - PLACE
      ?auto_2049892 - TRUCK
      ?auto_2049893 - PLACE
      ?auto_2049896 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049894 ?auto_2049895 ) ( SURFACE-AT ?auto_2049890 ?auto_2049895 ) ( CLEAR ?auto_2049890 ) ( IS-CRATE ?auto_2049891 ) ( not ( = ?auto_2049890 ?auto_2049891 ) ) ( AVAILABLE ?auto_2049894 ) ( ON ?auto_2049890 ?auto_2049889 ) ( not ( = ?auto_2049889 ?auto_2049890 ) ) ( not ( = ?auto_2049889 ?auto_2049891 ) ) ( TRUCK-AT ?auto_2049892 ?auto_2049893 ) ( not ( = ?auto_2049893 ?auto_2049895 ) ) ( HOIST-AT ?auto_2049896 ?auto_2049893 ) ( LIFTING ?auto_2049896 ?auto_2049891 ) ( not ( = ?auto_2049894 ?auto_2049896 ) ) ( ON ?auto_2049881 ?auto_2049880 ) ( ON ?auto_2049882 ?auto_2049881 ) ( ON ?auto_2049883 ?auto_2049882 ) ( ON ?auto_2049884 ?auto_2049883 ) ( ON ?auto_2049885 ?auto_2049884 ) ( ON ?auto_2049886 ?auto_2049885 ) ( ON ?auto_2049887 ?auto_2049886 ) ( ON ?auto_2049888 ?auto_2049887 ) ( ON ?auto_2049889 ?auto_2049888 ) ( not ( = ?auto_2049880 ?auto_2049881 ) ) ( not ( = ?auto_2049880 ?auto_2049882 ) ) ( not ( = ?auto_2049880 ?auto_2049883 ) ) ( not ( = ?auto_2049880 ?auto_2049884 ) ) ( not ( = ?auto_2049880 ?auto_2049885 ) ) ( not ( = ?auto_2049880 ?auto_2049886 ) ) ( not ( = ?auto_2049880 ?auto_2049887 ) ) ( not ( = ?auto_2049880 ?auto_2049888 ) ) ( not ( = ?auto_2049880 ?auto_2049889 ) ) ( not ( = ?auto_2049880 ?auto_2049890 ) ) ( not ( = ?auto_2049880 ?auto_2049891 ) ) ( not ( = ?auto_2049881 ?auto_2049882 ) ) ( not ( = ?auto_2049881 ?auto_2049883 ) ) ( not ( = ?auto_2049881 ?auto_2049884 ) ) ( not ( = ?auto_2049881 ?auto_2049885 ) ) ( not ( = ?auto_2049881 ?auto_2049886 ) ) ( not ( = ?auto_2049881 ?auto_2049887 ) ) ( not ( = ?auto_2049881 ?auto_2049888 ) ) ( not ( = ?auto_2049881 ?auto_2049889 ) ) ( not ( = ?auto_2049881 ?auto_2049890 ) ) ( not ( = ?auto_2049881 ?auto_2049891 ) ) ( not ( = ?auto_2049882 ?auto_2049883 ) ) ( not ( = ?auto_2049882 ?auto_2049884 ) ) ( not ( = ?auto_2049882 ?auto_2049885 ) ) ( not ( = ?auto_2049882 ?auto_2049886 ) ) ( not ( = ?auto_2049882 ?auto_2049887 ) ) ( not ( = ?auto_2049882 ?auto_2049888 ) ) ( not ( = ?auto_2049882 ?auto_2049889 ) ) ( not ( = ?auto_2049882 ?auto_2049890 ) ) ( not ( = ?auto_2049882 ?auto_2049891 ) ) ( not ( = ?auto_2049883 ?auto_2049884 ) ) ( not ( = ?auto_2049883 ?auto_2049885 ) ) ( not ( = ?auto_2049883 ?auto_2049886 ) ) ( not ( = ?auto_2049883 ?auto_2049887 ) ) ( not ( = ?auto_2049883 ?auto_2049888 ) ) ( not ( = ?auto_2049883 ?auto_2049889 ) ) ( not ( = ?auto_2049883 ?auto_2049890 ) ) ( not ( = ?auto_2049883 ?auto_2049891 ) ) ( not ( = ?auto_2049884 ?auto_2049885 ) ) ( not ( = ?auto_2049884 ?auto_2049886 ) ) ( not ( = ?auto_2049884 ?auto_2049887 ) ) ( not ( = ?auto_2049884 ?auto_2049888 ) ) ( not ( = ?auto_2049884 ?auto_2049889 ) ) ( not ( = ?auto_2049884 ?auto_2049890 ) ) ( not ( = ?auto_2049884 ?auto_2049891 ) ) ( not ( = ?auto_2049885 ?auto_2049886 ) ) ( not ( = ?auto_2049885 ?auto_2049887 ) ) ( not ( = ?auto_2049885 ?auto_2049888 ) ) ( not ( = ?auto_2049885 ?auto_2049889 ) ) ( not ( = ?auto_2049885 ?auto_2049890 ) ) ( not ( = ?auto_2049885 ?auto_2049891 ) ) ( not ( = ?auto_2049886 ?auto_2049887 ) ) ( not ( = ?auto_2049886 ?auto_2049888 ) ) ( not ( = ?auto_2049886 ?auto_2049889 ) ) ( not ( = ?auto_2049886 ?auto_2049890 ) ) ( not ( = ?auto_2049886 ?auto_2049891 ) ) ( not ( = ?auto_2049887 ?auto_2049888 ) ) ( not ( = ?auto_2049887 ?auto_2049889 ) ) ( not ( = ?auto_2049887 ?auto_2049890 ) ) ( not ( = ?auto_2049887 ?auto_2049891 ) ) ( not ( = ?auto_2049888 ?auto_2049889 ) ) ( not ( = ?auto_2049888 ?auto_2049890 ) ) ( not ( = ?auto_2049888 ?auto_2049891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049889 ?auto_2049890 ?auto_2049891 )
      ( MAKE-11CRATE-VERIFY ?auto_2049880 ?auto_2049881 ?auto_2049882 ?auto_2049883 ?auto_2049884 ?auto_2049885 ?auto_2049886 ?auto_2049887 ?auto_2049888 ?auto_2049889 ?auto_2049890 ?auto_2049891 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050023 - SURFACE
      ?auto_2050024 - SURFACE
      ?auto_2050025 - SURFACE
      ?auto_2050026 - SURFACE
      ?auto_2050027 - SURFACE
      ?auto_2050028 - SURFACE
      ?auto_2050029 - SURFACE
      ?auto_2050030 - SURFACE
      ?auto_2050031 - SURFACE
      ?auto_2050032 - SURFACE
      ?auto_2050033 - SURFACE
      ?auto_2050034 - SURFACE
    )
    :vars
    (
      ?auto_2050037 - HOIST
      ?auto_2050035 - PLACE
      ?auto_2050039 - TRUCK
      ?auto_2050038 - PLACE
      ?auto_2050040 - HOIST
      ?auto_2050036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050037 ?auto_2050035 ) ( SURFACE-AT ?auto_2050033 ?auto_2050035 ) ( CLEAR ?auto_2050033 ) ( IS-CRATE ?auto_2050034 ) ( not ( = ?auto_2050033 ?auto_2050034 ) ) ( AVAILABLE ?auto_2050037 ) ( ON ?auto_2050033 ?auto_2050032 ) ( not ( = ?auto_2050032 ?auto_2050033 ) ) ( not ( = ?auto_2050032 ?auto_2050034 ) ) ( TRUCK-AT ?auto_2050039 ?auto_2050038 ) ( not ( = ?auto_2050038 ?auto_2050035 ) ) ( HOIST-AT ?auto_2050040 ?auto_2050038 ) ( not ( = ?auto_2050037 ?auto_2050040 ) ) ( AVAILABLE ?auto_2050040 ) ( SURFACE-AT ?auto_2050034 ?auto_2050038 ) ( ON ?auto_2050034 ?auto_2050036 ) ( CLEAR ?auto_2050034 ) ( not ( = ?auto_2050033 ?auto_2050036 ) ) ( not ( = ?auto_2050034 ?auto_2050036 ) ) ( not ( = ?auto_2050032 ?auto_2050036 ) ) ( ON ?auto_2050024 ?auto_2050023 ) ( ON ?auto_2050025 ?auto_2050024 ) ( ON ?auto_2050026 ?auto_2050025 ) ( ON ?auto_2050027 ?auto_2050026 ) ( ON ?auto_2050028 ?auto_2050027 ) ( ON ?auto_2050029 ?auto_2050028 ) ( ON ?auto_2050030 ?auto_2050029 ) ( ON ?auto_2050031 ?auto_2050030 ) ( ON ?auto_2050032 ?auto_2050031 ) ( not ( = ?auto_2050023 ?auto_2050024 ) ) ( not ( = ?auto_2050023 ?auto_2050025 ) ) ( not ( = ?auto_2050023 ?auto_2050026 ) ) ( not ( = ?auto_2050023 ?auto_2050027 ) ) ( not ( = ?auto_2050023 ?auto_2050028 ) ) ( not ( = ?auto_2050023 ?auto_2050029 ) ) ( not ( = ?auto_2050023 ?auto_2050030 ) ) ( not ( = ?auto_2050023 ?auto_2050031 ) ) ( not ( = ?auto_2050023 ?auto_2050032 ) ) ( not ( = ?auto_2050023 ?auto_2050033 ) ) ( not ( = ?auto_2050023 ?auto_2050034 ) ) ( not ( = ?auto_2050023 ?auto_2050036 ) ) ( not ( = ?auto_2050024 ?auto_2050025 ) ) ( not ( = ?auto_2050024 ?auto_2050026 ) ) ( not ( = ?auto_2050024 ?auto_2050027 ) ) ( not ( = ?auto_2050024 ?auto_2050028 ) ) ( not ( = ?auto_2050024 ?auto_2050029 ) ) ( not ( = ?auto_2050024 ?auto_2050030 ) ) ( not ( = ?auto_2050024 ?auto_2050031 ) ) ( not ( = ?auto_2050024 ?auto_2050032 ) ) ( not ( = ?auto_2050024 ?auto_2050033 ) ) ( not ( = ?auto_2050024 ?auto_2050034 ) ) ( not ( = ?auto_2050024 ?auto_2050036 ) ) ( not ( = ?auto_2050025 ?auto_2050026 ) ) ( not ( = ?auto_2050025 ?auto_2050027 ) ) ( not ( = ?auto_2050025 ?auto_2050028 ) ) ( not ( = ?auto_2050025 ?auto_2050029 ) ) ( not ( = ?auto_2050025 ?auto_2050030 ) ) ( not ( = ?auto_2050025 ?auto_2050031 ) ) ( not ( = ?auto_2050025 ?auto_2050032 ) ) ( not ( = ?auto_2050025 ?auto_2050033 ) ) ( not ( = ?auto_2050025 ?auto_2050034 ) ) ( not ( = ?auto_2050025 ?auto_2050036 ) ) ( not ( = ?auto_2050026 ?auto_2050027 ) ) ( not ( = ?auto_2050026 ?auto_2050028 ) ) ( not ( = ?auto_2050026 ?auto_2050029 ) ) ( not ( = ?auto_2050026 ?auto_2050030 ) ) ( not ( = ?auto_2050026 ?auto_2050031 ) ) ( not ( = ?auto_2050026 ?auto_2050032 ) ) ( not ( = ?auto_2050026 ?auto_2050033 ) ) ( not ( = ?auto_2050026 ?auto_2050034 ) ) ( not ( = ?auto_2050026 ?auto_2050036 ) ) ( not ( = ?auto_2050027 ?auto_2050028 ) ) ( not ( = ?auto_2050027 ?auto_2050029 ) ) ( not ( = ?auto_2050027 ?auto_2050030 ) ) ( not ( = ?auto_2050027 ?auto_2050031 ) ) ( not ( = ?auto_2050027 ?auto_2050032 ) ) ( not ( = ?auto_2050027 ?auto_2050033 ) ) ( not ( = ?auto_2050027 ?auto_2050034 ) ) ( not ( = ?auto_2050027 ?auto_2050036 ) ) ( not ( = ?auto_2050028 ?auto_2050029 ) ) ( not ( = ?auto_2050028 ?auto_2050030 ) ) ( not ( = ?auto_2050028 ?auto_2050031 ) ) ( not ( = ?auto_2050028 ?auto_2050032 ) ) ( not ( = ?auto_2050028 ?auto_2050033 ) ) ( not ( = ?auto_2050028 ?auto_2050034 ) ) ( not ( = ?auto_2050028 ?auto_2050036 ) ) ( not ( = ?auto_2050029 ?auto_2050030 ) ) ( not ( = ?auto_2050029 ?auto_2050031 ) ) ( not ( = ?auto_2050029 ?auto_2050032 ) ) ( not ( = ?auto_2050029 ?auto_2050033 ) ) ( not ( = ?auto_2050029 ?auto_2050034 ) ) ( not ( = ?auto_2050029 ?auto_2050036 ) ) ( not ( = ?auto_2050030 ?auto_2050031 ) ) ( not ( = ?auto_2050030 ?auto_2050032 ) ) ( not ( = ?auto_2050030 ?auto_2050033 ) ) ( not ( = ?auto_2050030 ?auto_2050034 ) ) ( not ( = ?auto_2050030 ?auto_2050036 ) ) ( not ( = ?auto_2050031 ?auto_2050032 ) ) ( not ( = ?auto_2050031 ?auto_2050033 ) ) ( not ( = ?auto_2050031 ?auto_2050034 ) ) ( not ( = ?auto_2050031 ?auto_2050036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050032 ?auto_2050033 ?auto_2050034 )
      ( MAKE-11CRATE-VERIFY ?auto_2050023 ?auto_2050024 ?auto_2050025 ?auto_2050026 ?auto_2050027 ?auto_2050028 ?auto_2050029 ?auto_2050030 ?auto_2050031 ?auto_2050032 ?auto_2050033 ?auto_2050034 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050167 - SURFACE
      ?auto_2050168 - SURFACE
      ?auto_2050169 - SURFACE
      ?auto_2050170 - SURFACE
      ?auto_2050171 - SURFACE
      ?auto_2050172 - SURFACE
      ?auto_2050173 - SURFACE
      ?auto_2050174 - SURFACE
      ?auto_2050175 - SURFACE
      ?auto_2050176 - SURFACE
      ?auto_2050177 - SURFACE
      ?auto_2050178 - SURFACE
    )
    :vars
    (
      ?auto_2050182 - HOIST
      ?auto_2050184 - PLACE
      ?auto_2050183 - PLACE
      ?auto_2050180 - HOIST
      ?auto_2050181 - SURFACE
      ?auto_2050179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050182 ?auto_2050184 ) ( SURFACE-AT ?auto_2050177 ?auto_2050184 ) ( CLEAR ?auto_2050177 ) ( IS-CRATE ?auto_2050178 ) ( not ( = ?auto_2050177 ?auto_2050178 ) ) ( AVAILABLE ?auto_2050182 ) ( ON ?auto_2050177 ?auto_2050176 ) ( not ( = ?auto_2050176 ?auto_2050177 ) ) ( not ( = ?auto_2050176 ?auto_2050178 ) ) ( not ( = ?auto_2050183 ?auto_2050184 ) ) ( HOIST-AT ?auto_2050180 ?auto_2050183 ) ( not ( = ?auto_2050182 ?auto_2050180 ) ) ( AVAILABLE ?auto_2050180 ) ( SURFACE-AT ?auto_2050178 ?auto_2050183 ) ( ON ?auto_2050178 ?auto_2050181 ) ( CLEAR ?auto_2050178 ) ( not ( = ?auto_2050177 ?auto_2050181 ) ) ( not ( = ?auto_2050178 ?auto_2050181 ) ) ( not ( = ?auto_2050176 ?auto_2050181 ) ) ( TRUCK-AT ?auto_2050179 ?auto_2050184 ) ( ON ?auto_2050168 ?auto_2050167 ) ( ON ?auto_2050169 ?auto_2050168 ) ( ON ?auto_2050170 ?auto_2050169 ) ( ON ?auto_2050171 ?auto_2050170 ) ( ON ?auto_2050172 ?auto_2050171 ) ( ON ?auto_2050173 ?auto_2050172 ) ( ON ?auto_2050174 ?auto_2050173 ) ( ON ?auto_2050175 ?auto_2050174 ) ( ON ?auto_2050176 ?auto_2050175 ) ( not ( = ?auto_2050167 ?auto_2050168 ) ) ( not ( = ?auto_2050167 ?auto_2050169 ) ) ( not ( = ?auto_2050167 ?auto_2050170 ) ) ( not ( = ?auto_2050167 ?auto_2050171 ) ) ( not ( = ?auto_2050167 ?auto_2050172 ) ) ( not ( = ?auto_2050167 ?auto_2050173 ) ) ( not ( = ?auto_2050167 ?auto_2050174 ) ) ( not ( = ?auto_2050167 ?auto_2050175 ) ) ( not ( = ?auto_2050167 ?auto_2050176 ) ) ( not ( = ?auto_2050167 ?auto_2050177 ) ) ( not ( = ?auto_2050167 ?auto_2050178 ) ) ( not ( = ?auto_2050167 ?auto_2050181 ) ) ( not ( = ?auto_2050168 ?auto_2050169 ) ) ( not ( = ?auto_2050168 ?auto_2050170 ) ) ( not ( = ?auto_2050168 ?auto_2050171 ) ) ( not ( = ?auto_2050168 ?auto_2050172 ) ) ( not ( = ?auto_2050168 ?auto_2050173 ) ) ( not ( = ?auto_2050168 ?auto_2050174 ) ) ( not ( = ?auto_2050168 ?auto_2050175 ) ) ( not ( = ?auto_2050168 ?auto_2050176 ) ) ( not ( = ?auto_2050168 ?auto_2050177 ) ) ( not ( = ?auto_2050168 ?auto_2050178 ) ) ( not ( = ?auto_2050168 ?auto_2050181 ) ) ( not ( = ?auto_2050169 ?auto_2050170 ) ) ( not ( = ?auto_2050169 ?auto_2050171 ) ) ( not ( = ?auto_2050169 ?auto_2050172 ) ) ( not ( = ?auto_2050169 ?auto_2050173 ) ) ( not ( = ?auto_2050169 ?auto_2050174 ) ) ( not ( = ?auto_2050169 ?auto_2050175 ) ) ( not ( = ?auto_2050169 ?auto_2050176 ) ) ( not ( = ?auto_2050169 ?auto_2050177 ) ) ( not ( = ?auto_2050169 ?auto_2050178 ) ) ( not ( = ?auto_2050169 ?auto_2050181 ) ) ( not ( = ?auto_2050170 ?auto_2050171 ) ) ( not ( = ?auto_2050170 ?auto_2050172 ) ) ( not ( = ?auto_2050170 ?auto_2050173 ) ) ( not ( = ?auto_2050170 ?auto_2050174 ) ) ( not ( = ?auto_2050170 ?auto_2050175 ) ) ( not ( = ?auto_2050170 ?auto_2050176 ) ) ( not ( = ?auto_2050170 ?auto_2050177 ) ) ( not ( = ?auto_2050170 ?auto_2050178 ) ) ( not ( = ?auto_2050170 ?auto_2050181 ) ) ( not ( = ?auto_2050171 ?auto_2050172 ) ) ( not ( = ?auto_2050171 ?auto_2050173 ) ) ( not ( = ?auto_2050171 ?auto_2050174 ) ) ( not ( = ?auto_2050171 ?auto_2050175 ) ) ( not ( = ?auto_2050171 ?auto_2050176 ) ) ( not ( = ?auto_2050171 ?auto_2050177 ) ) ( not ( = ?auto_2050171 ?auto_2050178 ) ) ( not ( = ?auto_2050171 ?auto_2050181 ) ) ( not ( = ?auto_2050172 ?auto_2050173 ) ) ( not ( = ?auto_2050172 ?auto_2050174 ) ) ( not ( = ?auto_2050172 ?auto_2050175 ) ) ( not ( = ?auto_2050172 ?auto_2050176 ) ) ( not ( = ?auto_2050172 ?auto_2050177 ) ) ( not ( = ?auto_2050172 ?auto_2050178 ) ) ( not ( = ?auto_2050172 ?auto_2050181 ) ) ( not ( = ?auto_2050173 ?auto_2050174 ) ) ( not ( = ?auto_2050173 ?auto_2050175 ) ) ( not ( = ?auto_2050173 ?auto_2050176 ) ) ( not ( = ?auto_2050173 ?auto_2050177 ) ) ( not ( = ?auto_2050173 ?auto_2050178 ) ) ( not ( = ?auto_2050173 ?auto_2050181 ) ) ( not ( = ?auto_2050174 ?auto_2050175 ) ) ( not ( = ?auto_2050174 ?auto_2050176 ) ) ( not ( = ?auto_2050174 ?auto_2050177 ) ) ( not ( = ?auto_2050174 ?auto_2050178 ) ) ( not ( = ?auto_2050174 ?auto_2050181 ) ) ( not ( = ?auto_2050175 ?auto_2050176 ) ) ( not ( = ?auto_2050175 ?auto_2050177 ) ) ( not ( = ?auto_2050175 ?auto_2050178 ) ) ( not ( = ?auto_2050175 ?auto_2050181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050176 ?auto_2050177 ?auto_2050178 )
      ( MAKE-11CRATE-VERIFY ?auto_2050167 ?auto_2050168 ?auto_2050169 ?auto_2050170 ?auto_2050171 ?auto_2050172 ?auto_2050173 ?auto_2050174 ?auto_2050175 ?auto_2050176 ?auto_2050177 ?auto_2050178 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050311 - SURFACE
      ?auto_2050312 - SURFACE
      ?auto_2050313 - SURFACE
      ?auto_2050314 - SURFACE
      ?auto_2050315 - SURFACE
      ?auto_2050316 - SURFACE
      ?auto_2050317 - SURFACE
      ?auto_2050318 - SURFACE
      ?auto_2050319 - SURFACE
      ?auto_2050320 - SURFACE
      ?auto_2050321 - SURFACE
      ?auto_2050322 - SURFACE
    )
    :vars
    (
      ?auto_2050324 - HOIST
      ?auto_2050325 - PLACE
      ?auto_2050326 - PLACE
      ?auto_2050327 - HOIST
      ?auto_2050323 - SURFACE
      ?auto_2050328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050324 ?auto_2050325 ) ( IS-CRATE ?auto_2050322 ) ( not ( = ?auto_2050321 ?auto_2050322 ) ) ( not ( = ?auto_2050320 ?auto_2050321 ) ) ( not ( = ?auto_2050320 ?auto_2050322 ) ) ( not ( = ?auto_2050326 ?auto_2050325 ) ) ( HOIST-AT ?auto_2050327 ?auto_2050326 ) ( not ( = ?auto_2050324 ?auto_2050327 ) ) ( AVAILABLE ?auto_2050327 ) ( SURFACE-AT ?auto_2050322 ?auto_2050326 ) ( ON ?auto_2050322 ?auto_2050323 ) ( CLEAR ?auto_2050322 ) ( not ( = ?auto_2050321 ?auto_2050323 ) ) ( not ( = ?auto_2050322 ?auto_2050323 ) ) ( not ( = ?auto_2050320 ?auto_2050323 ) ) ( TRUCK-AT ?auto_2050328 ?auto_2050325 ) ( SURFACE-AT ?auto_2050320 ?auto_2050325 ) ( CLEAR ?auto_2050320 ) ( LIFTING ?auto_2050324 ?auto_2050321 ) ( IS-CRATE ?auto_2050321 ) ( ON ?auto_2050312 ?auto_2050311 ) ( ON ?auto_2050313 ?auto_2050312 ) ( ON ?auto_2050314 ?auto_2050313 ) ( ON ?auto_2050315 ?auto_2050314 ) ( ON ?auto_2050316 ?auto_2050315 ) ( ON ?auto_2050317 ?auto_2050316 ) ( ON ?auto_2050318 ?auto_2050317 ) ( ON ?auto_2050319 ?auto_2050318 ) ( ON ?auto_2050320 ?auto_2050319 ) ( not ( = ?auto_2050311 ?auto_2050312 ) ) ( not ( = ?auto_2050311 ?auto_2050313 ) ) ( not ( = ?auto_2050311 ?auto_2050314 ) ) ( not ( = ?auto_2050311 ?auto_2050315 ) ) ( not ( = ?auto_2050311 ?auto_2050316 ) ) ( not ( = ?auto_2050311 ?auto_2050317 ) ) ( not ( = ?auto_2050311 ?auto_2050318 ) ) ( not ( = ?auto_2050311 ?auto_2050319 ) ) ( not ( = ?auto_2050311 ?auto_2050320 ) ) ( not ( = ?auto_2050311 ?auto_2050321 ) ) ( not ( = ?auto_2050311 ?auto_2050322 ) ) ( not ( = ?auto_2050311 ?auto_2050323 ) ) ( not ( = ?auto_2050312 ?auto_2050313 ) ) ( not ( = ?auto_2050312 ?auto_2050314 ) ) ( not ( = ?auto_2050312 ?auto_2050315 ) ) ( not ( = ?auto_2050312 ?auto_2050316 ) ) ( not ( = ?auto_2050312 ?auto_2050317 ) ) ( not ( = ?auto_2050312 ?auto_2050318 ) ) ( not ( = ?auto_2050312 ?auto_2050319 ) ) ( not ( = ?auto_2050312 ?auto_2050320 ) ) ( not ( = ?auto_2050312 ?auto_2050321 ) ) ( not ( = ?auto_2050312 ?auto_2050322 ) ) ( not ( = ?auto_2050312 ?auto_2050323 ) ) ( not ( = ?auto_2050313 ?auto_2050314 ) ) ( not ( = ?auto_2050313 ?auto_2050315 ) ) ( not ( = ?auto_2050313 ?auto_2050316 ) ) ( not ( = ?auto_2050313 ?auto_2050317 ) ) ( not ( = ?auto_2050313 ?auto_2050318 ) ) ( not ( = ?auto_2050313 ?auto_2050319 ) ) ( not ( = ?auto_2050313 ?auto_2050320 ) ) ( not ( = ?auto_2050313 ?auto_2050321 ) ) ( not ( = ?auto_2050313 ?auto_2050322 ) ) ( not ( = ?auto_2050313 ?auto_2050323 ) ) ( not ( = ?auto_2050314 ?auto_2050315 ) ) ( not ( = ?auto_2050314 ?auto_2050316 ) ) ( not ( = ?auto_2050314 ?auto_2050317 ) ) ( not ( = ?auto_2050314 ?auto_2050318 ) ) ( not ( = ?auto_2050314 ?auto_2050319 ) ) ( not ( = ?auto_2050314 ?auto_2050320 ) ) ( not ( = ?auto_2050314 ?auto_2050321 ) ) ( not ( = ?auto_2050314 ?auto_2050322 ) ) ( not ( = ?auto_2050314 ?auto_2050323 ) ) ( not ( = ?auto_2050315 ?auto_2050316 ) ) ( not ( = ?auto_2050315 ?auto_2050317 ) ) ( not ( = ?auto_2050315 ?auto_2050318 ) ) ( not ( = ?auto_2050315 ?auto_2050319 ) ) ( not ( = ?auto_2050315 ?auto_2050320 ) ) ( not ( = ?auto_2050315 ?auto_2050321 ) ) ( not ( = ?auto_2050315 ?auto_2050322 ) ) ( not ( = ?auto_2050315 ?auto_2050323 ) ) ( not ( = ?auto_2050316 ?auto_2050317 ) ) ( not ( = ?auto_2050316 ?auto_2050318 ) ) ( not ( = ?auto_2050316 ?auto_2050319 ) ) ( not ( = ?auto_2050316 ?auto_2050320 ) ) ( not ( = ?auto_2050316 ?auto_2050321 ) ) ( not ( = ?auto_2050316 ?auto_2050322 ) ) ( not ( = ?auto_2050316 ?auto_2050323 ) ) ( not ( = ?auto_2050317 ?auto_2050318 ) ) ( not ( = ?auto_2050317 ?auto_2050319 ) ) ( not ( = ?auto_2050317 ?auto_2050320 ) ) ( not ( = ?auto_2050317 ?auto_2050321 ) ) ( not ( = ?auto_2050317 ?auto_2050322 ) ) ( not ( = ?auto_2050317 ?auto_2050323 ) ) ( not ( = ?auto_2050318 ?auto_2050319 ) ) ( not ( = ?auto_2050318 ?auto_2050320 ) ) ( not ( = ?auto_2050318 ?auto_2050321 ) ) ( not ( = ?auto_2050318 ?auto_2050322 ) ) ( not ( = ?auto_2050318 ?auto_2050323 ) ) ( not ( = ?auto_2050319 ?auto_2050320 ) ) ( not ( = ?auto_2050319 ?auto_2050321 ) ) ( not ( = ?auto_2050319 ?auto_2050322 ) ) ( not ( = ?auto_2050319 ?auto_2050323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050320 ?auto_2050321 ?auto_2050322 )
      ( MAKE-11CRATE-VERIFY ?auto_2050311 ?auto_2050312 ?auto_2050313 ?auto_2050314 ?auto_2050315 ?auto_2050316 ?auto_2050317 ?auto_2050318 ?auto_2050319 ?auto_2050320 ?auto_2050321 ?auto_2050322 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050455 - SURFACE
      ?auto_2050456 - SURFACE
      ?auto_2050457 - SURFACE
      ?auto_2050458 - SURFACE
      ?auto_2050459 - SURFACE
      ?auto_2050460 - SURFACE
      ?auto_2050461 - SURFACE
      ?auto_2050462 - SURFACE
      ?auto_2050463 - SURFACE
      ?auto_2050464 - SURFACE
      ?auto_2050465 - SURFACE
      ?auto_2050466 - SURFACE
    )
    :vars
    (
      ?auto_2050472 - HOIST
      ?auto_2050467 - PLACE
      ?auto_2050468 - PLACE
      ?auto_2050471 - HOIST
      ?auto_2050469 - SURFACE
      ?auto_2050470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050472 ?auto_2050467 ) ( IS-CRATE ?auto_2050466 ) ( not ( = ?auto_2050465 ?auto_2050466 ) ) ( not ( = ?auto_2050464 ?auto_2050465 ) ) ( not ( = ?auto_2050464 ?auto_2050466 ) ) ( not ( = ?auto_2050468 ?auto_2050467 ) ) ( HOIST-AT ?auto_2050471 ?auto_2050468 ) ( not ( = ?auto_2050472 ?auto_2050471 ) ) ( AVAILABLE ?auto_2050471 ) ( SURFACE-AT ?auto_2050466 ?auto_2050468 ) ( ON ?auto_2050466 ?auto_2050469 ) ( CLEAR ?auto_2050466 ) ( not ( = ?auto_2050465 ?auto_2050469 ) ) ( not ( = ?auto_2050466 ?auto_2050469 ) ) ( not ( = ?auto_2050464 ?auto_2050469 ) ) ( TRUCK-AT ?auto_2050470 ?auto_2050467 ) ( SURFACE-AT ?auto_2050464 ?auto_2050467 ) ( CLEAR ?auto_2050464 ) ( IS-CRATE ?auto_2050465 ) ( AVAILABLE ?auto_2050472 ) ( IN ?auto_2050465 ?auto_2050470 ) ( ON ?auto_2050456 ?auto_2050455 ) ( ON ?auto_2050457 ?auto_2050456 ) ( ON ?auto_2050458 ?auto_2050457 ) ( ON ?auto_2050459 ?auto_2050458 ) ( ON ?auto_2050460 ?auto_2050459 ) ( ON ?auto_2050461 ?auto_2050460 ) ( ON ?auto_2050462 ?auto_2050461 ) ( ON ?auto_2050463 ?auto_2050462 ) ( ON ?auto_2050464 ?auto_2050463 ) ( not ( = ?auto_2050455 ?auto_2050456 ) ) ( not ( = ?auto_2050455 ?auto_2050457 ) ) ( not ( = ?auto_2050455 ?auto_2050458 ) ) ( not ( = ?auto_2050455 ?auto_2050459 ) ) ( not ( = ?auto_2050455 ?auto_2050460 ) ) ( not ( = ?auto_2050455 ?auto_2050461 ) ) ( not ( = ?auto_2050455 ?auto_2050462 ) ) ( not ( = ?auto_2050455 ?auto_2050463 ) ) ( not ( = ?auto_2050455 ?auto_2050464 ) ) ( not ( = ?auto_2050455 ?auto_2050465 ) ) ( not ( = ?auto_2050455 ?auto_2050466 ) ) ( not ( = ?auto_2050455 ?auto_2050469 ) ) ( not ( = ?auto_2050456 ?auto_2050457 ) ) ( not ( = ?auto_2050456 ?auto_2050458 ) ) ( not ( = ?auto_2050456 ?auto_2050459 ) ) ( not ( = ?auto_2050456 ?auto_2050460 ) ) ( not ( = ?auto_2050456 ?auto_2050461 ) ) ( not ( = ?auto_2050456 ?auto_2050462 ) ) ( not ( = ?auto_2050456 ?auto_2050463 ) ) ( not ( = ?auto_2050456 ?auto_2050464 ) ) ( not ( = ?auto_2050456 ?auto_2050465 ) ) ( not ( = ?auto_2050456 ?auto_2050466 ) ) ( not ( = ?auto_2050456 ?auto_2050469 ) ) ( not ( = ?auto_2050457 ?auto_2050458 ) ) ( not ( = ?auto_2050457 ?auto_2050459 ) ) ( not ( = ?auto_2050457 ?auto_2050460 ) ) ( not ( = ?auto_2050457 ?auto_2050461 ) ) ( not ( = ?auto_2050457 ?auto_2050462 ) ) ( not ( = ?auto_2050457 ?auto_2050463 ) ) ( not ( = ?auto_2050457 ?auto_2050464 ) ) ( not ( = ?auto_2050457 ?auto_2050465 ) ) ( not ( = ?auto_2050457 ?auto_2050466 ) ) ( not ( = ?auto_2050457 ?auto_2050469 ) ) ( not ( = ?auto_2050458 ?auto_2050459 ) ) ( not ( = ?auto_2050458 ?auto_2050460 ) ) ( not ( = ?auto_2050458 ?auto_2050461 ) ) ( not ( = ?auto_2050458 ?auto_2050462 ) ) ( not ( = ?auto_2050458 ?auto_2050463 ) ) ( not ( = ?auto_2050458 ?auto_2050464 ) ) ( not ( = ?auto_2050458 ?auto_2050465 ) ) ( not ( = ?auto_2050458 ?auto_2050466 ) ) ( not ( = ?auto_2050458 ?auto_2050469 ) ) ( not ( = ?auto_2050459 ?auto_2050460 ) ) ( not ( = ?auto_2050459 ?auto_2050461 ) ) ( not ( = ?auto_2050459 ?auto_2050462 ) ) ( not ( = ?auto_2050459 ?auto_2050463 ) ) ( not ( = ?auto_2050459 ?auto_2050464 ) ) ( not ( = ?auto_2050459 ?auto_2050465 ) ) ( not ( = ?auto_2050459 ?auto_2050466 ) ) ( not ( = ?auto_2050459 ?auto_2050469 ) ) ( not ( = ?auto_2050460 ?auto_2050461 ) ) ( not ( = ?auto_2050460 ?auto_2050462 ) ) ( not ( = ?auto_2050460 ?auto_2050463 ) ) ( not ( = ?auto_2050460 ?auto_2050464 ) ) ( not ( = ?auto_2050460 ?auto_2050465 ) ) ( not ( = ?auto_2050460 ?auto_2050466 ) ) ( not ( = ?auto_2050460 ?auto_2050469 ) ) ( not ( = ?auto_2050461 ?auto_2050462 ) ) ( not ( = ?auto_2050461 ?auto_2050463 ) ) ( not ( = ?auto_2050461 ?auto_2050464 ) ) ( not ( = ?auto_2050461 ?auto_2050465 ) ) ( not ( = ?auto_2050461 ?auto_2050466 ) ) ( not ( = ?auto_2050461 ?auto_2050469 ) ) ( not ( = ?auto_2050462 ?auto_2050463 ) ) ( not ( = ?auto_2050462 ?auto_2050464 ) ) ( not ( = ?auto_2050462 ?auto_2050465 ) ) ( not ( = ?auto_2050462 ?auto_2050466 ) ) ( not ( = ?auto_2050462 ?auto_2050469 ) ) ( not ( = ?auto_2050463 ?auto_2050464 ) ) ( not ( = ?auto_2050463 ?auto_2050465 ) ) ( not ( = ?auto_2050463 ?auto_2050466 ) ) ( not ( = ?auto_2050463 ?auto_2050469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050464 ?auto_2050465 ?auto_2050466 )
      ( MAKE-11CRATE-VERIFY ?auto_2050455 ?auto_2050456 ?auto_2050457 ?auto_2050458 ?auto_2050459 ?auto_2050460 ?auto_2050461 ?auto_2050462 ?auto_2050463 ?auto_2050464 ?auto_2050465 ?auto_2050466 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059727 - SURFACE
      ?auto_2059728 - SURFACE
      ?auto_2059729 - SURFACE
      ?auto_2059730 - SURFACE
      ?auto_2059731 - SURFACE
      ?auto_2059732 - SURFACE
      ?auto_2059733 - SURFACE
      ?auto_2059734 - SURFACE
      ?auto_2059735 - SURFACE
      ?auto_2059736 - SURFACE
      ?auto_2059737 - SURFACE
      ?auto_2059738 - SURFACE
      ?auto_2059739 - SURFACE
    )
    :vars
    (
      ?auto_2059741 - HOIST
      ?auto_2059740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059741 ?auto_2059740 ) ( SURFACE-AT ?auto_2059738 ?auto_2059740 ) ( CLEAR ?auto_2059738 ) ( LIFTING ?auto_2059741 ?auto_2059739 ) ( IS-CRATE ?auto_2059739 ) ( not ( = ?auto_2059738 ?auto_2059739 ) ) ( ON ?auto_2059728 ?auto_2059727 ) ( ON ?auto_2059729 ?auto_2059728 ) ( ON ?auto_2059730 ?auto_2059729 ) ( ON ?auto_2059731 ?auto_2059730 ) ( ON ?auto_2059732 ?auto_2059731 ) ( ON ?auto_2059733 ?auto_2059732 ) ( ON ?auto_2059734 ?auto_2059733 ) ( ON ?auto_2059735 ?auto_2059734 ) ( ON ?auto_2059736 ?auto_2059735 ) ( ON ?auto_2059737 ?auto_2059736 ) ( ON ?auto_2059738 ?auto_2059737 ) ( not ( = ?auto_2059727 ?auto_2059728 ) ) ( not ( = ?auto_2059727 ?auto_2059729 ) ) ( not ( = ?auto_2059727 ?auto_2059730 ) ) ( not ( = ?auto_2059727 ?auto_2059731 ) ) ( not ( = ?auto_2059727 ?auto_2059732 ) ) ( not ( = ?auto_2059727 ?auto_2059733 ) ) ( not ( = ?auto_2059727 ?auto_2059734 ) ) ( not ( = ?auto_2059727 ?auto_2059735 ) ) ( not ( = ?auto_2059727 ?auto_2059736 ) ) ( not ( = ?auto_2059727 ?auto_2059737 ) ) ( not ( = ?auto_2059727 ?auto_2059738 ) ) ( not ( = ?auto_2059727 ?auto_2059739 ) ) ( not ( = ?auto_2059728 ?auto_2059729 ) ) ( not ( = ?auto_2059728 ?auto_2059730 ) ) ( not ( = ?auto_2059728 ?auto_2059731 ) ) ( not ( = ?auto_2059728 ?auto_2059732 ) ) ( not ( = ?auto_2059728 ?auto_2059733 ) ) ( not ( = ?auto_2059728 ?auto_2059734 ) ) ( not ( = ?auto_2059728 ?auto_2059735 ) ) ( not ( = ?auto_2059728 ?auto_2059736 ) ) ( not ( = ?auto_2059728 ?auto_2059737 ) ) ( not ( = ?auto_2059728 ?auto_2059738 ) ) ( not ( = ?auto_2059728 ?auto_2059739 ) ) ( not ( = ?auto_2059729 ?auto_2059730 ) ) ( not ( = ?auto_2059729 ?auto_2059731 ) ) ( not ( = ?auto_2059729 ?auto_2059732 ) ) ( not ( = ?auto_2059729 ?auto_2059733 ) ) ( not ( = ?auto_2059729 ?auto_2059734 ) ) ( not ( = ?auto_2059729 ?auto_2059735 ) ) ( not ( = ?auto_2059729 ?auto_2059736 ) ) ( not ( = ?auto_2059729 ?auto_2059737 ) ) ( not ( = ?auto_2059729 ?auto_2059738 ) ) ( not ( = ?auto_2059729 ?auto_2059739 ) ) ( not ( = ?auto_2059730 ?auto_2059731 ) ) ( not ( = ?auto_2059730 ?auto_2059732 ) ) ( not ( = ?auto_2059730 ?auto_2059733 ) ) ( not ( = ?auto_2059730 ?auto_2059734 ) ) ( not ( = ?auto_2059730 ?auto_2059735 ) ) ( not ( = ?auto_2059730 ?auto_2059736 ) ) ( not ( = ?auto_2059730 ?auto_2059737 ) ) ( not ( = ?auto_2059730 ?auto_2059738 ) ) ( not ( = ?auto_2059730 ?auto_2059739 ) ) ( not ( = ?auto_2059731 ?auto_2059732 ) ) ( not ( = ?auto_2059731 ?auto_2059733 ) ) ( not ( = ?auto_2059731 ?auto_2059734 ) ) ( not ( = ?auto_2059731 ?auto_2059735 ) ) ( not ( = ?auto_2059731 ?auto_2059736 ) ) ( not ( = ?auto_2059731 ?auto_2059737 ) ) ( not ( = ?auto_2059731 ?auto_2059738 ) ) ( not ( = ?auto_2059731 ?auto_2059739 ) ) ( not ( = ?auto_2059732 ?auto_2059733 ) ) ( not ( = ?auto_2059732 ?auto_2059734 ) ) ( not ( = ?auto_2059732 ?auto_2059735 ) ) ( not ( = ?auto_2059732 ?auto_2059736 ) ) ( not ( = ?auto_2059732 ?auto_2059737 ) ) ( not ( = ?auto_2059732 ?auto_2059738 ) ) ( not ( = ?auto_2059732 ?auto_2059739 ) ) ( not ( = ?auto_2059733 ?auto_2059734 ) ) ( not ( = ?auto_2059733 ?auto_2059735 ) ) ( not ( = ?auto_2059733 ?auto_2059736 ) ) ( not ( = ?auto_2059733 ?auto_2059737 ) ) ( not ( = ?auto_2059733 ?auto_2059738 ) ) ( not ( = ?auto_2059733 ?auto_2059739 ) ) ( not ( = ?auto_2059734 ?auto_2059735 ) ) ( not ( = ?auto_2059734 ?auto_2059736 ) ) ( not ( = ?auto_2059734 ?auto_2059737 ) ) ( not ( = ?auto_2059734 ?auto_2059738 ) ) ( not ( = ?auto_2059734 ?auto_2059739 ) ) ( not ( = ?auto_2059735 ?auto_2059736 ) ) ( not ( = ?auto_2059735 ?auto_2059737 ) ) ( not ( = ?auto_2059735 ?auto_2059738 ) ) ( not ( = ?auto_2059735 ?auto_2059739 ) ) ( not ( = ?auto_2059736 ?auto_2059737 ) ) ( not ( = ?auto_2059736 ?auto_2059738 ) ) ( not ( = ?auto_2059736 ?auto_2059739 ) ) ( not ( = ?auto_2059737 ?auto_2059738 ) ) ( not ( = ?auto_2059737 ?auto_2059739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2059738 ?auto_2059739 )
      ( MAKE-12CRATE-VERIFY ?auto_2059727 ?auto_2059728 ?auto_2059729 ?auto_2059730 ?auto_2059731 ?auto_2059732 ?auto_2059733 ?auto_2059734 ?auto_2059735 ?auto_2059736 ?auto_2059737 ?auto_2059738 ?auto_2059739 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059852 - SURFACE
      ?auto_2059853 - SURFACE
      ?auto_2059854 - SURFACE
      ?auto_2059855 - SURFACE
      ?auto_2059856 - SURFACE
      ?auto_2059857 - SURFACE
      ?auto_2059858 - SURFACE
      ?auto_2059859 - SURFACE
      ?auto_2059860 - SURFACE
      ?auto_2059861 - SURFACE
      ?auto_2059862 - SURFACE
      ?auto_2059863 - SURFACE
      ?auto_2059864 - SURFACE
    )
    :vars
    (
      ?auto_2059866 - HOIST
      ?auto_2059867 - PLACE
      ?auto_2059865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2059866 ?auto_2059867 ) ( SURFACE-AT ?auto_2059863 ?auto_2059867 ) ( CLEAR ?auto_2059863 ) ( IS-CRATE ?auto_2059864 ) ( not ( = ?auto_2059863 ?auto_2059864 ) ) ( TRUCK-AT ?auto_2059865 ?auto_2059867 ) ( AVAILABLE ?auto_2059866 ) ( IN ?auto_2059864 ?auto_2059865 ) ( ON ?auto_2059863 ?auto_2059862 ) ( not ( = ?auto_2059862 ?auto_2059863 ) ) ( not ( = ?auto_2059862 ?auto_2059864 ) ) ( ON ?auto_2059853 ?auto_2059852 ) ( ON ?auto_2059854 ?auto_2059853 ) ( ON ?auto_2059855 ?auto_2059854 ) ( ON ?auto_2059856 ?auto_2059855 ) ( ON ?auto_2059857 ?auto_2059856 ) ( ON ?auto_2059858 ?auto_2059857 ) ( ON ?auto_2059859 ?auto_2059858 ) ( ON ?auto_2059860 ?auto_2059859 ) ( ON ?auto_2059861 ?auto_2059860 ) ( ON ?auto_2059862 ?auto_2059861 ) ( not ( = ?auto_2059852 ?auto_2059853 ) ) ( not ( = ?auto_2059852 ?auto_2059854 ) ) ( not ( = ?auto_2059852 ?auto_2059855 ) ) ( not ( = ?auto_2059852 ?auto_2059856 ) ) ( not ( = ?auto_2059852 ?auto_2059857 ) ) ( not ( = ?auto_2059852 ?auto_2059858 ) ) ( not ( = ?auto_2059852 ?auto_2059859 ) ) ( not ( = ?auto_2059852 ?auto_2059860 ) ) ( not ( = ?auto_2059852 ?auto_2059861 ) ) ( not ( = ?auto_2059852 ?auto_2059862 ) ) ( not ( = ?auto_2059852 ?auto_2059863 ) ) ( not ( = ?auto_2059852 ?auto_2059864 ) ) ( not ( = ?auto_2059853 ?auto_2059854 ) ) ( not ( = ?auto_2059853 ?auto_2059855 ) ) ( not ( = ?auto_2059853 ?auto_2059856 ) ) ( not ( = ?auto_2059853 ?auto_2059857 ) ) ( not ( = ?auto_2059853 ?auto_2059858 ) ) ( not ( = ?auto_2059853 ?auto_2059859 ) ) ( not ( = ?auto_2059853 ?auto_2059860 ) ) ( not ( = ?auto_2059853 ?auto_2059861 ) ) ( not ( = ?auto_2059853 ?auto_2059862 ) ) ( not ( = ?auto_2059853 ?auto_2059863 ) ) ( not ( = ?auto_2059853 ?auto_2059864 ) ) ( not ( = ?auto_2059854 ?auto_2059855 ) ) ( not ( = ?auto_2059854 ?auto_2059856 ) ) ( not ( = ?auto_2059854 ?auto_2059857 ) ) ( not ( = ?auto_2059854 ?auto_2059858 ) ) ( not ( = ?auto_2059854 ?auto_2059859 ) ) ( not ( = ?auto_2059854 ?auto_2059860 ) ) ( not ( = ?auto_2059854 ?auto_2059861 ) ) ( not ( = ?auto_2059854 ?auto_2059862 ) ) ( not ( = ?auto_2059854 ?auto_2059863 ) ) ( not ( = ?auto_2059854 ?auto_2059864 ) ) ( not ( = ?auto_2059855 ?auto_2059856 ) ) ( not ( = ?auto_2059855 ?auto_2059857 ) ) ( not ( = ?auto_2059855 ?auto_2059858 ) ) ( not ( = ?auto_2059855 ?auto_2059859 ) ) ( not ( = ?auto_2059855 ?auto_2059860 ) ) ( not ( = ?auto_2059855 ?auto_2059861 ) ) ( not ( = ?auto_2059855 ?auto_2059862 ) ) ( not ( = ?auto_2059855 ?auto_2059863 ) ) ( not ( = ?auto_2059855 ?auto_2059864 ) ) ( not ( = ?auto_2059856 ?auto_2059857 ) ) ( not ( = ?auto_2059856 ?auto_2059858 ) ) ( not ( = ?auto_2059856 ?auto_2059859 ) ) ( not ( = ?auto_2059856 ?auto_2059860 ) ) ( not ( = ?auto_2059856 ?auto_2059861 ) ) ( not ( = ?auto_2059856 ?auto_2059862 ) ) ( not ( = ?auto_2059856 ?auto_2059863 ) ) ( not ( = ?auto_2059856 ?auto_2059864 ) ) ( not ( = ?auto_2059857 ?auto_2059858 ) ) ( not ( = ?auto_2059857 ?auto_2059859 ) ) ( not ( = ?auto_2059857 ?auto_2059860 ) ) ( not ( = ?auto_2059857 ?auto_2059861 ) ) ( not ( = ?auto_2059857 ?auto_2059862 ) ) ( not ( = ?auto_2059857 ?auto_2059863 ) ) ( not ( = ?auto_2059857 ?auto_2059864 ) ) ( not ( = ?auto_2059858 ?auto_2059859 ) ) ( not ( = ?auto_2059858 ?auto_2059860 ) ) ( not ( = ?auto_2059858 ?auto_2059861 ) ) ( not ( = ?auto_2059858 ?auto_2059862 ) ) ( not ( = ?auto_2059858 ?auto_2059863 ) ) ( not ( = ?auto_2059858 ?auto_2059864 ) ) ( not ( = ?auto_2059859 ?auto_2059860 ) ) ( not ( = ?auto_2059859 ?auto_2059861 ) ) ( not ( = ?auto_2059859 ?auto_2059862 ) ) ( not ( = ?auto_2059859 ?auto_2059863 ) ) ( not ( = ?auto_2059859 ?auto_2059864 ) ) ( not ( = ?auto_2059860 ?auto_2059861 ) ) ( not ( = ?auto_2059860 ?auto_2059862 ) ) ( not ( = ?auto_2059860 ?auto_2059863 ) ) ( not ( = ?auto_2059860 ?auto_2059864 ) ) ( not ( = ?auto_2059861 ?auto_2059862 ) ) ( not ( = ?auto_2059861 ?auto_2059863 ) ) ( not ( = ?auto_2059861 ?auto_2059864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2059862 ?auto_2059863 ?auto_2059864 )
      ( MAKE-12CRATE-VERIFY ?auto_2059852 ?auto_2059853 ?auto_2059854 ?auto_2059855 ?auto_2059856 ?auto_2059857 ?auto_2059858 ?auto_2059859 ?auto_2059860 ?auto_2059861 ?auto_2059862 ?auto_2059863 ?auto_2059864 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2059990 - SURFACE
      ?auto_2059991 - SURFACE
      ?auto_2059992 - SURFACE
      ?auto_2059993 - SURFACE
      ?auto_2059994 - SURFACE
      ?auto_2059995 - SURFACE
      ?auto_2059996 - SURFACE
      ?auto_2059997 - SURFACE
      ?auto_2059998 - SURFACE
      ?auto_2059999 - SURFACE
      ?auto_2060000 - SURFACE
      ?auto_2060001 - SURFACE
      ?auto_2060002 - SURFACE
    )
    :vars
    (
      ?auto_2060003 - HOIST
      ?auto_2060005 - PLACE
      ?auto_2060006 - TRUCK
      ?auto_2060004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060003 ?auto_2060005 ) ( SURFACE-AT ?auto_2060001 ?auto_2060005 ) ( CLEAR ?auto_2060001 ) ( IS-CRATE ?auto_2060002 ) ( not ( = ?auto_2060001 ?auto_2060002 ) ) ( AVAILABLE ?auto_2060003 ) ( IN ?auto_2060002 ?auto_2060006 ) ( ON ?auto_2060001 ?auto_2060000 ) ( not ( = ?auto_2060000 ?auto_2060001 ) ) ( not ( = ?auto_2060000 ?auto_2060002 ) ) ( TRUCK-AT ?auto_2060006 ?auto_2060004 ) ( not ( = ?auto_2060004 ?auto_2060005 ) ) ( ON ?auto_2059991 ?auto_2059990 ) ( ON ?auto_2059992 ?auto_2059991 ) ( ON ?auto_2059993 ?auto_2059992 ) ( ON ?auto_2059994 ?auto_2059993 ) ( ON ?auto_2059995 ?auto_2059994 ) ( ON ?auto_2059996 ?auto_2059995 ) ( ON ?auto_2059997 ?auto_2059996 ) ( ON ?auto_2059998 ?auto_2059997 ) ( ON ?auto_2059999 ?auto_2059998 ) ( ON ?auto_2060000 ?auto_2059999 ) ( not ( = ?auto_2059990 ?auto_2059991 ) ) ( not ( = ?auto_2059990 ?auto_2059992 ) ) ( not ( = ?auto_2059990 ?auto_2059993 ) ) ( not ( = ?auto_2059990 ?auto_2059994 ) ) ( not ( = ?auto_2059990 ?auto_2059995 ) ) ( not ( = ?auto_2059990 ?auto_2059996 ) ) ( not ( = ?auto_2059990 ?auto_2059997 ) ) ( not ( = ?auto_2059990 ?auto_2059998 ) ) ( not ( = ?auto_2059990 ?auto_2059999 ) ) ( not ( = ?auto_2059990 ?auto_2060000 ) ) ( not ( = ?auto_2059990 ?auto_2060001 ) ) ( not ( = ?auto_2059990 ?auto_2060002 ) ) ( not ( = ?auto_2059991 ?auto_2059992 ) ) ( not ( = ?auto_2059991 ?auto_2059993 ) ) ( not ( = ?auto_2059991 ?auto_2059994 ) ) ( not ( = ?auto_2059991 ?auto_2059995 ) ) ( not ( = ?auto_2059991 ?auto_2059996 ) ) ( not ( = ?auto_2059991 ?auto_2059997 ) ) ( not ( = ?auto_2059991 ?auto_2059998 ) ) ( not ( = ?auto_2059991 ?auto_2059999 ) ) ( not ( = ?auto_2059991 ?auto_2060000 ) ) ( not ( = ?auto_2059991 ?auto_2060001 ) ) ( not ( = ?auto_2059991 ?auto_2060002 ) ) ( not ( = ?auto_2059992 ?auto_2059993 ) ) ( not ( = ?auto_2059992 ?auto_2059994 ) ) ( not ( = ?auto_2059992 ?auto_2059995 ) ) ( not ( = ?auto_2059992 ?auto_2059996 ) ) ( not ( = ?auto_2059992 ?auto_2059997 ) ) ( not ( = ?auto_2059992 ?auto_2059998 ) ) ( not ( = ?auto_2059992 ?auto_2059999 ) ) ( not ( = ?auto_2059992 ?auto_2060000 ) ) ( not ( = ?auto_2059992 ?auto_2060001 ) ) ( not ( = ?auto_2059992 ?auto_2060002 ) ) ( not ( = ?auto_2059993 ?auto_2059994 ) ) ( not ( = ?auto_2059993 ?auto_2059995 ) ) ( not ( = ?auto_2059993 ?auto_2059996 ) ) ( not ( = ?auto_2059993 ?auto_2059997 ) ) ( not ( = ?auto_2059993 ?auto_2059998 ) ) ( not ( = ?auto_2059993 ?auto_2059999 ) ) ( not ( = ?auto_2059993 ?auto_2060000 ) ) ( not ( = ?auto_2059993 ?auto_2060001 ) ) ( not ( = ?auto_2059993 ?auto_2060002 ) ) ( not ( = ?auto_2059994 ?auto_2059995 ) ) ( not ( = ?auto_2059994 ?auto_2059996 ) ) ( not ( = ?auto_2059994 ?auto_2059997 ) ) ( not ( = ?auto_2059994 ?auto_2059998 ) ) ( not ( = ?auto_2059994 ?auto_2059999 ) ) ( not ( = ?auto_2059994 ?auto_2060000 ) ) ( not ( = ?auto_2059994 ?auto_2060001 ) ) ( not ( = ?auto_2059994 ?auto_2060002 ) ) ( not ( = ?auto_2059995 ?auto_2059996 ) ) ( not ( = ?auto_2059995 ?auto_2059997 ) ) ( not ( = ?auto_2059995 ?auto_2059998 ) ) ( not ( = ?auto_2059995 ?auto_2059999 ) ) ( not ( = ?auto_2059995 ?auto_2060000 ) ) ( not ( = ?auto_2059995 ?auto_2060001 ) ) ( not ( = ?auto_2059995 ?auto_2060002 ) ) ( not ( = ?auto_2059996 ?auto_2059997 ) ) ( not ( = ?auto_2059996 ?auto_2059998 ) ) ( not ( = ?auto_2059996 ?auto_2059999 ) ) ( not ( = ?auto_2059996 ?auto_2060000 ) ) ( not ( = ?auto_2059996 ?auto_2060001 ) ) ( not ( = ?auto_2059996 ?auto_2060002 ) ) ( not ( = ?auto_2059997 ?auto_2059998 ) ) ( not ( = ?auto_2059997 ?auto_2059999 ) ) ( not ( = ?auto_2059997 ?auto_2060000 ) ) ( not ( = ?auto_2059997 ?auto_2060001 ) ) ( not ( = ?auto_2059997 ?auto_2060002 ) ) ( not ( = ?auto_2059998 ?auto_2059999 ) ) ( not ( = ?auto_2059998 ?auto_2060000 ) ) ( not ( = ?auto_2059998 ?auto_2060001 ) ) ( not ( = ?auto_2059998 ?auto_2060002 ) ) ( not ( = ?auto_2059999 ?auto_2060000 ) ) ( not ( = ?auto_2059999 ?auto_2060001 ) ) ( not ( = ?auto_2059999 ?auto_2060002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060000 ?auto_2060001 ?auto_2060002 )
      ( MAKE-12CRATE-VERIFY ?auto_2059990 ?auto_2059991 ?auto_2059992 ?auto_2059993 ?auto_2059994 ?auto_2059995 ?auto_2059996 ?auto_2059997 ?auto_2059998 ?auto_2059999 ?auto_2060000 ?auto_2060001 ?auto_2060002 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060140 - SURFACE
      ?auto_2060141 - SURFACE
      ?auto_2060142 - SURFACE
      ?auto_2060143 - SURFACE
      ?auto_2060144 - SURFACE
      ?auto_2060145 - SURFACE
      ?auto_2060146 - SURFACE
      ?auto_2060147 - SURFACE
      ?auto_2060148 - SURFACE
      ?auto_2060149 - SURFACE
      ?auto_2060150 - SURFACE
      ?auto_2060151 - SURFACE
      ?auto_2060152 - SURFACE
    )
    :vars
    (
      ?auto_2060157 - HOIST
      ?auto_2060154 - PLACE
      ?auto_2060156 - TRUCK
      ?auto_2060155 - PLACE
      ?auto_2060153 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060157 ?auto_2060154 ) ( SURFACE-AT ?auto_2060151 ?auto_2060154 ) ( CLEAR ?auto_2060151 ) ( IS-CRATE ?auto_2060152 ) ( not ( = ?auto_2060151 ?auto_2060152 ) ) ( AVAILABLE ?auto_2060157 ) ( ON ?auto_2060151 ?auto_2060150 ) ( not ( = ?auto_2060150 ?auto_2060151 ) ) ( not ( = ?auto_2060150 ?auto_2060152 ) ) ( TRUCK-AT ?auto_2060156 ?auto_2060155 ) ( not ( = ?auto_2060155 ?auto_2060154 ) ) ( HOIST-AT ?auto_2060153 ?auto_2060155 ) ( LIFTING ?auto_2060153 ?auto_2060152 ) ( not ( = ?auto_2060157 ?auto_2060153 ) ) ( ON ?auto_2060141 ?auto_2060140 ) ( ON ?auto_2060142 ?auto_2060141 ) ( ON ?auto_2060143 ?auto_2060142 ) ( ON ?auto_2060144 ?auto_2060143 ) ( ON ?auto_2060145 ?auto_2060144 ) ( ON ?auto_2060146 ?auto_2060145 ) ( ON ?auto_2060147 ?auto_2060146 ) ( ON ?auto_2060148 ?auto_2060147 ) ( ON ?auto_2060149 ?auto_2060148 ) ( ON ?auto_2060150 ?auto_2060149 ) ( not ( = ?auto_2060140 ?auto_2060141 ) ) ( not ( = ?auto_2060140 ?auto_2060142 ) ) ( not ( = ?auto_2060140 ?auto_2060143 ) ) ( not ( = ?auto_2060140 ?auto_2060144 ) ) ( not ( = ?auto_2060140 ?auto_2060145 ) ) ( not ( = ?auto_2060140 ?auto_2060146 ) ) ( not ( = ?auto_2060140 ?auto_2060147 ) ) ( not ( = ?auto_2060140 ?auto_2060148 ) ) ( not ( = ?auto_2060140 ?auto_2060149 ) ) ( not ( = ?auto_2060140 ?auto_2060150 ) ) ( not ( = ?auto_2060140 ?auto_2060151 ) ) ( not ( = ?auto_2060140 ?auto_2060152 ) ) ( not ( = ?auto_2060141 ?auto_2060142 ) ) ( not ( = ?auto_2060141 ?auto_2060143 ) ) ( not ( = ?auto_2060141 ?auto_2060144 ) ) ( not ( = ?auto_2060141 ?auto_2060145 ) ) ( not ( = ?auto_2060141 ?auto_2060146 ) ) ( not ( = ?auto_2060141 ?auto_2060147 ) ) ( not ( = ?auto_2060141 ?auto_2060148 ) ) ( not ( = ?auto_2060141 ?auto_2060149 ) ) ( not ( = ?auto_2060141 ?auto_2060150 ) ) ( not ( = ?auto_2060141 ?auto_2060151 ) ) ( not ( = ?auto_2060141 ?auto_2060152 ) ) ( not ( = ?auto_2060142 ?auto_2060143 ) ) ( not ( = ?auto_2060142 ?auto_2060144 ) ) ( not ( = ?auto_2060142 ?auto_2060145 ) ) ( not ( = ?auto_2060142 ?auto_2060146 ) ) ( not ( = ?auto_2060142 ?auto_2060147 ) ) ( not ( = ?auto_2060142 ?auto_2060148 ) ) ( not ( = ?auto_2060142 ?auto_2060149 ) ) ( not ( = ?auto_2060142 ?auto_2060150 ) ) ( not ( = ?auto_2060142 ?auto_2060151 ) ) ( not ( = ?auto_2060142 ?auto_2060152 ) ) ( not ( = ?auto_2060143 ?auto_2060144 ) ) ( not ( = ?auto_2060143 ?auto_2060145 ) ) ( not ( = ?auto_2060143 ?auto_2060146 ) ) ( not ( = ?auto_2060143 ?auto_2060147 ) ) ( not ( = ?auto_2060143 ?auto_2060148 ) ) ( not ( = ?auto_2060143 ?auto_2060149 ) ) ( not ( = ?auto_2060143 ?auto_2060150 ) ) ( not ( = ?auto_2060143 ?auto_2060151 ) ) ( not ( = ?auto_2060143 ?auto_2060152 ) ) ( not ( = ?auto_2060144 ?auto_2060145 ) ) ( not ( = ?auto_2060144 ?auto_2060146 ) ) ( not ( = ?auto_2060144 ?auto_2060147 ) ) ( not ( = ?auto_2060144 ?auto_2060148 ) ) ( not ( = ?auto_2060144 ?auto_2060149 ) ) ( not ( = ?auto_2060144 ?auto_2060150 ) ) ( not ( = ?auto_2060144 ?auto_2060151 ) ) ( not ( = ?auto_2060144 ?auto_2060152 ) ) ( not ( = ?auto_2060145 ?auto_2060146 ) ) ( not ( = ?auto_2060145 ?auto_2060147 ) ) ( not ( = ?auto_2060145 ?auto_2060148 ) ) ( not ( = ?auto_2060145 ?auto_2060149 ) ) ( not ( = ?auto_2060145 ?auto_2060150 ) ) ( not ( = ?auto_2060145 ?auto_2060151 ) ) ( not ( = ?auto_2060145 ?auto_2060152 ) ) ( not ( = ?auto_2060146 ?auto_2060147 ) ) ( not ( = ?auto_2060146 ?auto_2060148 ) ) ( not ( = ?auto_2060146 ?auto_2060149 ) ) ( not ( = ?auto_2060146 ?auto_2060150 ) ) ( not ( = ?auto_2060146 ?auto_2060151 ) ) ( not ( = ?auto_2060146 ?auto_2060152 ) ) ( not ( = ?auto_2060147 ?auto_2060148 ) ) ( not ( = ?auto_2060147 ?auto_2060149 ) ) ( not ( = ?auto_2060147 ?auto_2060150 ) ) ( not ( = ?auto_2060147 ?auto_2060151 ) ) ( not ( = ?auto_2060147 ?auto_2060152 ) ) ( not ( = ?auto_2060148 ?auto_2060149 ) ) ( not ( = ?auto_2060148 ?auto_2060150 ) ) ( not ( = ?auto_2060148 ?auto_2060151 ) ) ( not ( = ?auto_2060148 ?auto_2060152 ) ) ( not ( = ?auto_2060149 ?auto_2060150 ) ) ( not ( = ?auto_2060149 ?auto_2060151 ) ) ( not ( = ?auto_2060149 ?auto_2060152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060150 ?auto_2060151 ?auto_2060152 )
      ( MAKE-12CRATE-VERIFY ?auto_2060140 ?auto_2060141 ?auto_2060142 ?auto_2060143 ?auto_2060144 ?auto_2060145 ?auto_2060146 ?auto_2060147 ?auto_2060148 ?auto_2060149 ?auto_2060150 ?auto_2060151 ?auto_2060152 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060302 - SURFACE
      ?auto_2060303 - SURFACE
      ?auto_2060304 - SURFACE
      ?auto_2060305 - SURFACE
      ?auto_2060306 - SURFACE
      ?auto_2060307 - SURFACE
      ?auto_2060308 - SURFACE
      ?auto_2060309 - SURFACE
      ?auto_2060310 - SURFACE
      ?auto_2060311 - SURFACE
      ?auto_2060312 - SURFACE
      ?auto_2060313 - SURFACE
      ?auto_2060314 - SURFACE
    )
    :vars
    (
      ?auto_2060320 - HOIST
      ?auto_2060319 - PLACE
      ?auto_2060316 - TRUCK
      ?auto_2060315 - PLACE
      ?auto_2060318 - HOIST
      ?auto_2060317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060320 ?auto_2060319 ) ( SURFACE-AT ?auto_2060313 ?auto_2060319 ) ( CLEAR ?auto_2060313 ) ( IS-CRATE ?auto_2060314 ) ( not ( = ?auto_2060313 ?auto_2060314 ) ) ( AVAILABLE ?auto_2060320 ) ( ON ?auto_2060313 ?auto_2060312 ) ( not ( = ?auto_2060312 ?auto_2060313 ) ) ( not ( = ?auto_2060312 ?auto_2060314 ) ) ( TRUCK-AT ?auto_2060316 ?auto_2060315 ) ( not ( = ?auto_2060315 ?auto_2060319 ) ) ( HOIST-AT ?auto_2060318 ?auto_2060315 ) ( not ( = ?auto_2060320 ?auto_2060318 ) ) ( AVAILABLE ?auto_2060318 ) ( SURFACE-AT ?auto_2060314 ?auto_2060315 ) ( ON ?auto_2060314 ?auto_2060317 ) ( CLEAR ?auto_2060314 ) ( not ( = ?auto_2060313 ?auto_2060317 ) ) ( not ( = ?auto_2060314 ?auto_2060317 ) ) ( not ( = ?auto_2060312 ?auto_2060317 ) ) ( ON ?auto_2060303 ?auto_2060302 ) ( ON ?auto_2060304 ?auto_2060303 ) ( ON ?auto_2060305 ?auto_2060304 ) ( ON ?auto_2060306 ?auto_2060305 ) ( ON ?auto_2060307 ?auto_2060306 ) ( ON ?auto_2060308 ?auto_2060307 ) ( ON ?auto_2060309 ?auto_2060308 ) ( ON ?auto_2060310 ?auto_2060309 ) ( ON ?auto_2060311 ?auto_2060310 ) ( ON ?auto_2060312 ?auto_2060311 ) ( not ( = ?auto_2060302 ?auto_2060303 ) ) ( not ( = ?auto_2060302 ?auto_2060304 ) ) ( not ( = ?auto_2060302 ?auto_2060305 ) ) ( not ( = ?auto_2060302 ?auto_2060306 ) ) ( not ( = ?auto_2060302 ?auto_2060307 ) ) ( not ( = ?auto_2060302 ?auto_2060308 ) ) ( not ( = ?auto_2060302 ?auto_2060309 ) ) ( not ( = ?auto_2060302 ?auto_2060310 ) ) ( not ( = ?auto_2060302 ?auto_2060311 ) ) ( not ( = ?auto_2060302 ?auto_2060312 ) ) ( not ( = ?auto_2060302 ?auto_2060313 ) ) ( not ( = ?auto_2060302 ?auto_2060314 ) ) ( not ( = ?auto_2060302 ?auto_2060317 ) ) ( not ( = ?auto_2060303 ?auto_2060304 ) ) ( not ( = ?auto_2060303 ?auto_2060305 ) ) ( not ( = ?auto_2060303 ?auto_2060306 ) ) ( not ( = ?auto_2060303 ?auto_2060307 ) ) ( not ( = ?auto_2060303 ?auto_2060308 ) ) ( not ( = ?auto_2060303 ?auto_2060309 ) ) ( not ( = ?auto_2060303 ?auto_2060310 ) ) ( not ( = ?auto_2060303 ?auto_2060311 ) ) ( not ( = ?auto_2060303 ?auto_2060312 ) ) ( not ( = ?auto_2060303 ?auto_2060313 ) ) ( not ( = ?auto_2060303 ?auto_2060314 ) ) ( not ( = ?auto_2060303 ?auto_2060317 ) ) ( not ( = ?auto_2060304 ?auto_2060305 ) ) ( not ( = ?auto_2060304 ?auto_2060306 ) ) ( not ( = ?auto_2060304 ?auto_2060307 ) ) ( not ( = ?auto_2060304 ?auto_2060308 ) ) ( not ( = ?auto_2060304 ?auto_2060309 ) ) ( not ( = ?auto_2060304 ?auto_2060310 ) ) ( not ( = ?auto_2060304 ?auto_2060311 ) ) ( not ( = ?auto_2060304 ?auto_2060312 ) ) ( not ( = ?auto_2060304 ?auto_2060313 ) ) ( not ( = ?auto_2060304 ?auto_2060314 ) ) ( not ( = ?auto_2060304 ?auto_2060317 ) ) ( not ( = ?auto_2060305 ?auto_2060306 ) ) ( not ( = ?auto_2060305 ?auto_2060307 ) ) ( not ( = ?auto_2060305 ?auto_2060308 ) ) ( not ( = ?auto_2060305 ?auto_2060309 ) ) ( not ( = ?auto_2060305 ?auto_2060310 ) ) ( not ( = ?auto_2060305 ?auto_2060311 ) ) ( not ( = ?auto_2060305 ?auto_2060312 ) ) ( not ( = ?auto_2060305 ?auto_2060313 ) ) ( not ( = ?auto_2060305 ?auto_2060314 ) ) ( not ( = ?auto_2060305 ?auto_2060317 ) ) ( not ( = ?auto_2060306 ?auto_2060307 ) ) ( not ( = ?auto_2060306 ?auto_2060308 ) ) ( not ( = ?auto_2060306 ?auto_2060309 ) ) ( not ( = ?auto_2060306 ?auto_2060310 ) ) ( not ( = ?auto_2060306 ?auto_2060311 ) ) ( not ( = ?auto_2060306 ?auto_2060312 ) ) ( not ( = ?auto_2060306 ?auto_2060313 ) ) ( not ( = ?auto_2060306 ?auto_2060314 ) ) ( not ( = ?auto_2060306 ?auto_2060317 ) ) ( not ( = ?auto_2060307 ?auto_2060308 ) ) ( not ( = ?auto_2060307 ?auto_2060309 ) ) ( not ( = ?auto_2060307 ?auto_2060310 ) ) ( not ( = ?auto_2060307 ?auto_2060311 ) ) ( not ( = ?auto_2060307 ?auto_2060312 ) ) ( not ( = ?auto_2060307 ?auto_2060313 ) ) ( not ( = ?auto_2060307 ?auto_2060314 ) ) ( not ( = ?auto_2060307 ?auto_2060317 ) ) ( not ( = ?auto_2060308 ?auto_2060309 ) ) ( not ( = ?auto_2060308 ?auto_2060310 ) ) ( not ( = ?auto_2060308 ?auto_2060311 ) ) ( not ( = ?auto_2060308 ?auto_2060312 ) ) ( not ( = ?auto_2060308 ?auto_2060313 ) ) ( not ( = ?auto_2060308 ?auto_2060314 ) ) ( not ( = ?auto_2060308 ?auto_2060317 ) ) ( not ( = ?auto_2060309 ?auto_2060310 ) ) ( not ( = ?auto_2060309 ?auto_2060311 ) ) ( not ( = ?auto_2060309 ?auto_2060312 ) ) ( not ( = ?auto_2060309 ?auto_2060313 ) ) ( not ( = ?auto_2060309 ?auto_2060314 ) ) ( not ( = ?auto_2060309 ?auto_2060317 ) ) ( not ( = ?auto_2060310 ?auto_2060311 ) ) ( not ( = ?auto_2060310 ?auto_2060312 ) ) ( not ( = ?auto_2060310 ?auto_2060313 ) ) ( not ( = ?auto_2060310 ?auto_2060314 ) ) ( not ( = ?auto_2060310 ?auto_2060317 ) ) ( not ( = ?auto_2060311 ?auto_2060312 ) ) ( not ( = ?auto_2060311 ?auto_2060313 ) ) ( not ( = ?auto_2060311 ?auto_2060314 ) ) ( not ( = ?auto_2060311 ?auto_2060317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060312 ?auto_2060313 ?auto_2060314 )
      ( MAKE-12CRATE-VERIFY ?auto_2060302 ?auto_2060303 ?auto_2060304 ?auto_2060305 ?auto_2060306 ?auto_2060307 ?auto_2060308 ?auto_2060309 ?auto_2060310 ?auto_2060311 ?auto_2060312 ?auto_2060313 ?auto_2060314 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060465 - SURFACE
      ?auto_2060466 - SURFACE
      ?auto_2060467 - SURFACE
      ?auto_2060468 - SURFACE
      ?auto_2060469 - SURFACE
      ?auto_2060470 - SURFACE
      ?auto_2060471 - SURFACE
      ?auto_2060472 - SURFACE
      ?auto_2060473 - SURFACE
      ?auto_2060474 - SURFACE
      ?auto_2060475 - SURFACE
      ?auto_2060476 - SURFACE
      ?auto_2060477 - SURFACE
    )
    :vars
    (
      ?auto_2060483 - HOIST
      ?auto_2060481 - PLACE
      ?auto_2060478 - PLACE
      ?auto_2060480 - HOIST
      ?auto_2060482 - SURFACE
      ?auto_2060479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060483 ?auto_2060481 ) ( SURFACE-AT ?auto_2060476 ?auto_2060481 ) ( CLEAR ?auto_2060476 ) ( IS-CRATE ?auto_2060477 ) ( not ( = ?auto_2060476 ?auto_2060477 ) ) ( AVAILABLE ?auto_2060483 ) ( ON ?auto_2060476 ?auto_2060475 ) ( not ( = ?auto_2060475 ?auto_2060476 ) ) ( not ( = ?auto_2060475 ?auto_2060477 ) ) ( not ( = ?auto_2060478 ?auto_2060481 ) ) ( HOIST-AT ?auto_2060480 ?auto_2060478 ) ( not ( = ?auto_2060483 ?auto_2060480 ) ) ( AVAILABLE ?auto_2060480 ) ( SURFACE-AT ?auto_2060477 ?auto_2060478 ) ( ON ?auto_2060477 ?auto_2060482 ) ( CLEAR ?auto_2060477 ) ( not ( = ?auto_2060476 ?auto_2060482 ) ) ( not ( = ?auto_2060477 ?auto_2060482 ) ) ( not ( = ?auto_2060475 ?auto_2060482 ) ) ( TRUCK-AT ?auto_2060479 ?auto_2060481 ) ( ON ?auto_2060466 ?auto_2060465 ) ( ON ?auto_2060467 ?auto_2060466 ) ( ON ?auto_2060468 ?auto_2060467 ) ( ON ?auto_2060469 ?auto_2060468 ) ( ON ?auto_2060470 ?auto_2060469 ) ( ON ?auto_2060471 ?auto_2060470 ) ( ON ?auto_2060472 ?auto_2060471 ) ( ON ?auto_2060473 ?auto_2060472 ) ( ON ?auto_2060474 ?auto_2060473 ) ( ON ?auto_2060475 ?auto_2060474 ) ( not ( = ?auto_2060465 ?auto_2060466 ) ) ( not ( = ?auto_2060465 ?auto_2060467 ) ) ( not ( = ?auto_2060465 ?auto_2060468 ) ) ( not ( = ?auto_2060465 ?auto_2060469 ) ) ( not ( = ?auto_2060465 ?auto_2060470 ) ) ( not ( = ?auto_2060465 ?auto_2060471 ) ) ( not ( = ?auto_2060465 ?auto_2060472 ) ) ( not ( = ?auto_2060465 ?auto_2060473 ) ) ( not ( = ?auto_2060465 ?auto_2060474 ) ) ( not ( = ?auto_2060465 ?auto_2060475 ) ) ( not ( = ?auto_2060465 ?auto_2060476 ) ) ( not ( = ?auto_2060465 ?auto_2060477 ) ) ( not ( = ?auto_2060465 ?auto_2060482 ) ) ( not ( = ?auto_2060466 ?auto_2060467 ) ) ( not ( = ?auto_2060466 ?auto_2060468 ) ) ( not ( = ?auto_2060466 ?auto_2060469 ) ) ( not ( = ?auto_2060466 ?auto_2060470 ) ) ( not ( = ?auto_2060466 ?auto_2060471 ) ) ( not ( = ?auto_2060466 ?auto_2060472 ) ) ( not ( = ?auto_2060466 ?auto_2060473 ) ) ( not ( = ?auto_2060466 ?auto_2060474 ) ) ( not ( = ?auto_2060466 ?auto_2060475 ) ) ( not ( = ?auto_2060466 ?auto_2060476 ) ) ( not ( = ?auto_2060466 ?auto_2060477 ) ) ( not ( = ?auto_2060466 ?auto_2060482 ) ) ( not ( = ?auto_2060467 ?auto_2060468 ) ) ( not ( = ?auto_2060467 ?auto_2060469 ) ) ( not ( = ?auto_2060467 ?auto_2060470 ) ) ( not ( = ?auto_2060467 ?auto_2060471 ) ) ( not ( = ?auto_2060467 ?auto_2060472 ) ) ( not ( = ?auto_2060467 ?auto_2060473 ) ) ( not ( = ?auto_2060467 ?auto_2060474 ) ) ( not ( = ?auto_2060467 ?auto_2060475 ) ) ( not ( = ?auto_2060467 ?auto_2060476 ) ) ( not ( = ?auto_2060467 ?auto_2060477 ) ) ( not ( = ?auto_2060467 ?auto_2060482 ) ) ( not ( = ?auto_2060468 ?auto_2060469 ) ) ( not ( = ?auto_2060468 ?auto_2060470 ) ) ( not ( = ?auto_2060468 ?auto_2060471 ) ) ( not ( = ?auto_2060468 ?auto_2060472 ) ) ( not ( = ?auto_2060468 ?auto_2060473 ) ) ( not ( = ?auto_2060468 ?auto_2060474 ) ) ( not ( = ?auto_2060468 ?auto_2060475 ) ) ( not ( = ?auto_2060468 ?auto_2060476 ) ) ( not ( = ?auto_2060468 ?auto_2060477 ) ) ( not ( = ?auto_2060468 ?auto_2060482 ) ) ( not ( = ?auto_2060469 ?auto_2060470 ) ) ( not ( = ?auto_2060469 ?auto_2060471 ) ) ( not ( = ?auto_2060469 ?auto_2060472 ) ) ( not ( = ?auto_2060469 ?auto_2060473 ) ) ( not ( = ?auto_2060469 ?auto_2060474 ) ) ( not ( = ?auto_2060469 ?auto_2060475 ) ) ( not ( = ?auto_2060469 ?auto_2060476 ) ) ( not ( = ?auto_2060469 ?auto_2060477 ) ) ( not ( = ?auto_2060469 ?auto_2060482 ) ) ( not ( = ?auto_2060470 ?auto_2060471 ) ) ( not ( = ?auto_2060470 ?auto_2060472 ) ) ( not ( = ?auto_2060470 ?auto_2060473 ) ) ( not ( = ?auto_2060470 ?auto_2060474 ) ) ( not ( = ?auto_2060470 ?auto_2060475 ) ) ( not ( = ?auto_2060470 ?auto_2060476 ) ) ( not ( = ?auto_2060470 ?auto_2060477 ) ) ( not ( = ?auto_2060470 ?auto_2060482 ) ) ( not ( = ?auto_2060471 ?auto_2060472 ) ) ( not ( = ?auto_2060471 ?auto_2060473 ) ) ( not ( = ?auto_2060471 ?auto_2060474 ) ) ( not ( = ?auto_2060471 ?auto_2060475 ) ) ( not ( = ?auto_2060471 ?auto_2060476 ) ) ( not ( = ?auto_2060471 ?auto_2060477 ) ) ( not ( = ?auto_2060471 ?auto_2060482 ) ) ( not ( = ?auto_2060472 ?auto_2060473 ) ) ( not ( = ?auto_2060472 ?auto_2060474 ) ) ( not ( = ?auto_2060472 ?auto_2060475 ) ) ( not ( = ?auto_2060472 ?auto_2060476 ) ) ( not ( = ?auto_2060472 ?auto_2060477 ) ) ( not ( = ?auto_2060472 ?auto_2060482 ) ) ( not ( = ?auto_2060473 ?auto_2060474 ) ) ( not ( = ?auto_2060473 ?auto_2060475 ) ) ( not ( = ?auto_2060473 ?auto_2060476 ) ) ( not ( = ?auto_2060473 ?auto_2060477 ) ) ( not ( = ?auto_2060473 ?auto_2060482 ) ) ( not ( = ?auto_2060474 ?auto_2060475 ) ) ( not ( = ?auto_2060474 ?auto_2060476 ) ) ( not ( = ?auto_2060474 ?auto_2060477 ) ) ( not ( = ?auto_2060474 ?auto_2060482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060475 ?auto_2060476 ?auto_2060477 )
      ( MAKE-12CRATE-VERIFY ?auto_2060465 ?auto_2060466 ?auto_2060467 ?auto_2060468 ?auto_2060469 ?auto_2060470 ?auto_2060471 ?auto_2060472 ?auto_2060473 ?auto_2060474 ?auto_2060475 ?auto_2060476 ?auto_2060477 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060628 - SURFACE
      ?auto_2060629 - SURFACE
      ?auto_2060630 - SURFACE
      ?auto_2060631 - SURFACE
      ?auto_2060632 - SURFACE
      ?auto_2060633 - SURFACE
      ?auto_2060634 - SURFACE
      ?auto_2060635 - SURFACE
      ?auto_2060636 - SURFACE
      ?auto_2060637 - SURFACE
      ?auto_2060638 - SURFACE
      ?auto_2060639 - SURFACE
      ?auto_2060640 - SURFACE
    )
    :vars
    (
      ?auto_2060644 - HOIST
      ?auto_2060642 - PLACE
      ?auto_2060641 - PLACE
      ?auto_2060643 - HOIST
      ?auto_2060646 - SURFACE
      ?auto_2060645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060644 ?auto_2060642 ) ( IS-CRATE ?auto_2060640 ) ( not ( = ?auto_2060639 ?auto_2060640 ) ) ( not ( = ?auto_2060638 ?auto_2060639 ) ) ( not ( = ?auto_2060638 ?auto_2060640 ) ) ( not ( = ?auto_2060641 ?auto_2060642 ) ) ( HOIST-AT ?auto_2060643 ?auto_2060641 ) ( not ( = ?auto_2060644 ?auto_2060643 ) ) ( AVAILABLE ?auto_2060643 ) ( SURFACE-AT ?auto_2060640 ?auto_2060641 ) ( ON ?auto_2060640 ?auto_2060646 ) ( CLEAR ?auto_2060640 ) ( not ( = ?auto_2060639 ?auto_2060646 ) ) ( not ( = ?auto_2060640 ?auto_2060646 ) ) ( not ( = ?auto_2060638 ?auto_2060646 ) ) ( TRUCK-AT ?auto_2060645 ?auto_2060642 ) ( SURFACE-AT ?auto_2060638 ?auto_2060642 ) ( CLEAR ?auto_2060638 ) ( LIFTING ?auto_2060644 ?auto_2060639 ) ( IS-CRATE ?auto_2060639 ) ( ON ?auto_2060629 ?auto_2060628 ) ( ON ?auto_2060630 ?auto_2060629 ) ( ON ?auto_2060631 ?auto_2060630 ) ( ON ?auto_2060632 ?auto_2060631 ) ( ON ?auto_2060633 ?auto_2060632 ) ( ON ?auto_2060634 ?auto_2060633 ) ( ON ?auto_2060635 ?auto_2060634 ) ( ON ?auto_2060636 ?auto_2060635 ) ( ON ?auto_2060637 ?auto_2060636 ) ( ON ?auto_2060638 ?auto_2060637 ) ( not ( = ?auto_2060628 ?auto_2060629 ) ) ( not ( = ?auto_2060628 ?auto_2060630 ) ) ( not ( = ?auto_2060628 ?auto_2060631 ) ) ( not ( = ?auto_2060628 ?auto_2060632 ) ) ( not ( = ?auto_2060628 ?auto_2060633 ) ) ( not ( = ?auto_2060628 ?auto_2060634 ) ) ( not ( = ?auto_2060628 ?auto_2060635 ) ) ( not ( = ?auto_2060628 ?auto_2060636 ) ) ( not ( = ?auto_2060628 ?auto_2060637 ) ) ( not ( = ?auto_2060628 ?auto_2060638 ) ) ( not ( = ?auto_2060628 ?auto_2060639 ) ) ( not ( = ?auto_2060628 ?auto_2060640 ) ) ( not ( = ?auto_2060628 ?auto_2060646 ) ) ( not ( = ?auto_2060629 ?auto_2060630 ) ) ( not ( = ?auto_2060629 ?auto_2060631 ) ) ( not ( = ?auto_2060629 ?auto_2060632 ) ) ( not ( = ?auto_2060629 ?auto_2060633 ) ) ( not ( = ?auto_2060629 ?auto_2060634 ) ) ( not ( = ?auto_2060629 ?auto_2060635 ) ) ( not ( = ?auto_2060629 ?auto_2060636 ) ) ( not ( = ?auto_2060629 ?auto_2060637 ) ) ( not ( = ?auto_2060629 ?auto_2060638 ) ) ( not ( = ?auto_2060629 ?auto_2060639 ) ) ( not ( = ?auto_2060629 ?auto_2060640 ) ) ( not ( = ?auto_2060629 ?auto_2060646 ) ) ( not ( = ?auto_2060630 ?auto_2060631 ) ) ( not ( = ?auto_2060630 ?auto_2060632 ) ) ( not ( = ?auto_2060630 ?auto_2060633 ) ) ( not ( = ?auto_2060630 ?auto_2060634 ) ) ( not ( = ?auto_2060630 ?auto_2060635 ) ) ( not ( = ?auto_2060630 ?auto_2060636 ) ) ( not ( = ?auto_2060630 ?auto_2060637 ) ) ( not ( = ?auto_2060630 ?auto_2060638 ) ) ( not ( = ?auto_2060630 ?auto_2060639 ) ) ( not ( = ?auto_2060630 ?auto_2060640 ) ) ( not ( = ?auto_2060630 ?auto_2060646 ) ) ( not ( = ?auto_2060631 ?auto_2060632 ) ) ( not ( = ?auto_2060631 ?auto_2060633 ) ) ( not ( = ?auto_2060631 ?auto_2060634 ) ) ( not ( = ?auto_2060631 ?auto_2060635 ) ) ( not ( = ?auto_2060631 ?auto_2060636 ) ) ( not ( = ?auto_2060631 ?auto_2060637 ) ) ( not ( = ?auto_2060631 ?auto_2060638 ) ) ( not ( = ?auto_2060631 ?auto_2060639 ) ) ( not ( = ?auto_2060631 ?auto_2060640 ) ) ( not ( = ?auto_2060631 ?auto_2060646 ) ) ( not ( = ?auto_2060632 ?auto_2060633 ) ) ( not ( = ?auto_2060632 ?auto_2060634 ) ) ( not ( = ?auto_2060632 ?auto_2060635 ) ) ( not ( = ?auto_2060632 ?auto_2060636 ) ) ( not ( = ?auto_2060632 ?auto_2060637 ) ) ( not ( = ?auto_2060632 ?auto_2060638 ) ) ( not ( = ?auto_2060632 ?auto_2060639 ) ) ( not ( = ?auto_2060632 ?auto_2060640 ) ) ( not ( = ?auto_2060632 ?auto_2060646 ) ) ( not ( = ?auto_2060633 ?auto_2060634 ) ) ( not ( = ?auto_2060633 ?auto_2060635 ) ) ( not ( = ?auto_2060633 ?auto_2060636 ) ) ( not ( = ?auto_2060633 ?auto_2060637 ) ) ( not ( = ?auto_2060633 ?auto_2060638 ) ) ( not ( = ?auto_2060633 ?auto_2060639 ) ) ( not ( = ?auto_2060633 ?auto_2060640 ) ) ( not ( = ?auto_2060633 ?auto_2060646 ) ) ( not ( = ?auto_2060634 ?auto_2060635 ) ) ( not ( = ?auto_2060634 ?auto_2060636 ) ) ( not ( = ?auto_2060634 ?auto_2060637 ) ) ( not ( = ?auto_2060634 ?auto_2060638 ) ) ( not ( = ?auto_2060634 ?auto_2060639 ) ) ( not ( = ?auto_2060634 ?auto_2060640 ) ) ( not ( = ?auto_2060634 ?auto_2060646 ) ) ( not ( = ?auto_2060635 ?auto_2060636 ) ) ( not ( = ?auto_2060635 ?auto_2060637 ) ) ( not ( = ?auto_2060635 ?auto_2060638 ) ) ( not ( = ?auto_2060635 ?auto_2060639 ) ) ( not ( = ?auto_2060635 ?auto_2060640 ) ) ( not ( = ?auto_2060635 ?auto_2060646 ) ) ( not ( = ?auto_2060636 ?auto_2060637 ) ) ( not ( = ?auto_2060636 ?auto_2060638 ) ) ( not ( = ?auto_2060636 ?auto_2060639 ) ) ( not ( = ?auto_2060636 ?auto_2060640 ) ) ( not ( = ?auto_2060636 ?auto_2060646 ) ) ( not ( = ?auto_2060637 ?auto_2060638 ) ) ( not ( = ?auto_2060637 ?auto_2060639 ) ) ( not ( = ?auto_2060637 ?auto_2060640 ) ) ( not ( = ?auto_2060637 ?auto_2060646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060638 ?auto_2060639 ?auto_2060640 )
      ( MAKE-12CRATE-VERIFY ?auto_2060628 ?auto_2060629 ?auto_2060630 ?auto_2060631 ?auto_2060632 ?auto_2060633 ?auto_2060634 ?auto_2060635 ?auto_2060636 ?auto_2060637 ?auto_2060638 ?auto_2060639 ?auto_2060640 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060791 - SURFACE
      ?auto_2060792 - SURFACE
      ?auto_2060793 - SURFACE
      ?auto_2060794 - SURFACE
      ?auto_2060795 - SURFACE
      ?auto_2060796 - SURFACE
      ?auto_2060797 - SURFACE
      ?auto_2060798 - SURFACE
      ?auto_2060799 - SURFACE
      ?auto_2060800 - SURFACE
      ?auto_2060801 - SURFACE
      ?auto_2060802 - SURFACE
      ?auto_2060803 - SURFACE
    )
    :vars
    (
      ?auto_2060804 - HOIST
      ?auto_2060809 - PLACE
      ?auto_2060807 - PLACE
      ?auto_2060806 - HOIST
      ?auto_2060805 - SURFACE
      ?auto_2060808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060804 ?auto_2060809 ) ( IS-CRATE ?auto_2060803 ) ( not ( = ?auto_2060802 ?auto_2060803 ) ) ( not ( = ?auto_2060801 ?auto_2060802 ) ) ( not ( = ?auto_2060801 ?auto_2060803 ) ) ( not ( = ?auto_2060807 ?auto_2060809 ) ) ( HOIST-AT ?auto_2060806 ?auto_2060807 ) ( not ( = ?auto_2060804 ?auto_2060806 ) ) ( AVAILABLE ?auto_2060806 ) ( SURFACE-AT ?auto_2060803 ?auto_2060807 ) ( ON ?auto_2060803 ?auto_2060805 ) ( CLEAR ?auto_2060803 ) ( not ( = ?auto_2060802 ?auto_2060805 ) ) ( not ( = ?auto_2060803 ?auto_2060805 ) ) ( not ( = ?auto_2060801 ?auto_2060805 ) ) ( TRUCK-AT ?auto_2060808 ?auto_2060809 ) ( SURFACE-AT ?auto_2060801 ?auto_2060809 ) ( CLEAR ?auto_2060801 ) ( IS-CRATE ?auto_2060802 ) ( AVAILABLE ?auto_2060804 ) ( IN ?auto_2060802 ?auto_2060808 ) ( ON ?auto_2060792 ?auto_2060791 ) ( ON ?auto_2060793 ?auto_2060792 ) ( ON ?auto_2060794 ?auto_2060793 ) ( ON ?auto_2060795 ?auto_2060794 ) ( ON ?auto_2060796 ?auto_2060795 ) ( ON ?auto_2060797 ?auto_2060796 ) ( ON ?auto_2060798 ?auto_2060797 ) ( ON ?auto_2060799 ?auto_2060798 ) ( ON ?auto_2060800 ?auto_2060799 ) ( ON ?auto_2060801 ?auto_2060800 ) ( not ( = ?auto_2060791 ?auto_2060792 ) ) ( not ( = ?auto_2060791 ?auto_2060793 ) ) ( not ( = ?auto_2060791 ?auto_2060794 ) ) ( not ( = ?auto_2060791 ?auto_2060795 ) ) ( not ( = ?auto_2060791 ?auto_2060796 ) ) ( not ( = ?auto_2060791 ?auto_2060797 ) ) ( not ( = ?auto_2060791 ?auto_2060798 ) ) ( not ( = ?auto_2060791 ?auto_2060799 ) ) ( not ( = ?auto_2060791 ?auto_2060800 ) ) ( not ( = ?auto_2060791 ?auto_2060801 ) ) ( not ( = ?auto_2060791 ?auto_2060802 ) ) ( not ( = ?auto_2060791 ?auto_2060803 ) ) ( not ( = ?auto_2060791 ?auto_2060805 ) ) ( not ( = ?auto_2060792 ?auto_2060793 ) ) ( not ( = ?auto_2060792 ?auto_2060794 ) ) ( not ( = ?auto_2060792 ?auto_2060795 ) ) ( not ( = ?auto_2060792 ?auto_2060796 ) ) ( not ( = ?auto_2060792 ?auto_2060797 ) ) ( not ( = ?auto_2060792 ?auto_2060798 ) ) ( not ( = ?auto_2060792 ?auto_2060799 ) ) ( not ( = ?auto_2060792 ?auto_2060800 ) ) ( not ( = ?auto_2060792 ?auto_2060801 ) ) ( not ( = ?auto_2060792 ?auto_2060802 ) ) ( not ( = ?auto_2060792 ?auto_2060803 ) ) ( not ( = ?auto_2060792 ?auto_2060805 ) ) ( not ( = ?auto_2060793 ?auto_2060794 ) ) ( not ( = ?auto_2060793 ?auto_2060795 ) ) ( not ( = ?auto_2060793 ?auto_2060796 ) ) ( not ( = ?auto_2060793 ?auto_2060797 ) ) ( not ( = ?auto_2060793 ?auto_2060798 ) ) ( not ( = ?auto_2060793 ?auto_2060799 ) ) ( not ( = ?auto_2060793 ?auto_2060800 ) ) ( not ( = ?auto_2060793 ?auto_2060801 ) ) ( not ( = ?auto_2060793 ?auto_2060802 ) ) ( not ( = ?auto_2060793 ?auto_2060803 ) ) ( not ( = ?auto_2060793 ?auto_2060805 ) ) ( not ( = ?auto_2060794 ?auto_2060795 ) ) ( not ( = ?auto_2060794 ?auto_2060796 ) ) ( not ( = ?auto_2060794 ?auto_2060797 ) ) ( not ( = ?auto_2060794 ?auto_2060798 ) ) ( not ( = ?auto_2060794 ?auto_2060799 ) ) ( not ( = ?auto_2060794 ?auto_2060800 ) ) ( not ( = ?auto_2060794 ?auto_2060801 ) ) ( not ( = ?auto_2060794 ?auto_2060802 ) ) ( not ( = ?auto_2060794 ?auto_2060803 ) ) ( not ( = ?auto_2060794 ?auto_2060805 ) ) ( not ( = ?auto_2060795 ?auto_2060796 ) ) ( not ( = ?auto_2060795 ?auto_2060797 ) ) ( not ( = ?auto_2060795 ?auto_2060798 ) ) ( not ( = ?auto_2060795 ?auto_2060799 ) ) ( not ( = ?auto_2060795 ?auto_2060800 ) ) ( not ( = ?auto_2060795 ?auto_2060801 ) ) ( not ( = ?auto_2060795 ?auto_2060802 ) ) ( not ( = ?auto_2060795 ?auto_2060803 ) ) ( not ( = ?auto_2060795 ?auto_2060805 ) ) ( not ( = ?auto_2060796 ?auto_2060797 ) ) ( not ( = ?auto_2060796 ?auto_2060798 ) ) ( not ( = ?auto_2060796 ?auto_2060799 ) ) ( not ( = ?auto_2060796 ?auto_2060800 ) ) ( not ( = ?auto_2060796 ?auto_2060801 ) ) ( not ( = ?auto_2060796 ?auto_2060802 ) ) ( not ( = ?auto_2060796 ?auto_2060803 ) ) ( not ( = ?auto_2060796 ?auto_2060805 ) ) ( not ( = ?auto_2060797 ?auto_2060798 ) ) ( not ( = ?auto_2060797 ?auto_2060799 ) ) ( not ( = ?auto_2060797 ?auto_2060800 ) ) ( not ( = ?auto_2060797 ?auto_2060801 ) ) ( not ( = ?auto_2060797 ?auto_2060802 ) ) ( not ( = ?auto_2060797 ?auto_2060803 ) ) ( not ( = ?auto_2060797 ?auto_2060805 ) ) ( not ( = ?auto_2060798 ?auto_2060799 ) ) ( not ( = ?auto_2060798 ?auto_2060800 ) ) ( not ( = ?auto_2060798 ?auto_2060801 ) ) ( not ( = ?auto_2060798 ?auto_2060802 ) ) ( not ( = ?auto_2060798 ?auto_2060803 ) ) ( not ( = ?auto_2060798 ?auto_2060805 ) ) ( not ( = ?auto_2060799 ?auto_2060800 ) ) ( not ( = ?auto_2060799 ?auto_2060801 ) ) ( not ( = ?auto_2060799 ?auto_2060802 ) ) ( not ( = ?auto_2060799 ?auto_2060803 ) ) ( not ( = ?auto_2060799 ?auto_2060805 ) ) ( not ( = ?auto_2060800 ?auto_2060801 ) ) ( not ( = ?auto_2060800 ?auto_2060802 ) ) ( not ( = ?auto_2060800 ?auto_2060803 ) ) ( not ( = ?auto_2060800 ?auto_2060805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060801 ?auto_2060802 ?auto_2060803 )
      ( MAKE-12CRATE-VERIFY ?auto_2060791 ?auto_2060792 ?auto_2060793 ?auto_2060794 ?auto_2060795 ?auto_2060796 ?auto_2060797 ?auto_2060798 ?auto_2060799 ?auto_2060800 ?auto_2060801 ?auto_2060802 ?auto_2060803 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072395 - SURFACE
      ?auto_2072396 - SURFACE
      ?auto_2072397 - SURFACE
      ?auto_2072398 - SURFACE
      ?auto_2072399 - SURFACE
      ?auto_2072400 - SURFACE
      ?auto_2072401 - SURFACE
      ?auto_2072402 - SURFACE
      ?auto_2072403 - SURFACE
      ?auto_2072404 - SURFACE
      ?auto_2072405 - SURFACE
      ?auto_2072406 - SURFACE
      ?auto_2072407 - SURFACE
      ?auto_2072408 - SURFACE
    )
    :vars
    (
      ?auto_2072410 - HOIST
      ?auto_2072409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072410 ?auto_2072409 ) ( SURFACE-AT ?auto_2072407 ?auto_2072409 ) ( CLEAR ?auto_2072407 ) ( LIFTING ?auto_2072410 ?auto_2072408 ) ( IS-CRATE ?auto_2072408 ) ( not ( = ?auto_2072407 ?auto_2072408 ) ) ( ON ?auto_2072396 ?auto_2072395 ) ( ON ?auto_2072397 ?auto_2072396 ) ( ON ?auto_2072398 ?auto_2072397 ) ( ON ?auto_2072399 ?auto_2072398 ) ( ON ?auto_2072400 ?auto_2072399 ) ( ON ?auto_2072401 ?auto_2072400 ) ( ON ?auto_2072402 ?auto_2072401 ) ( ON ?auto_2072403 ?auto_2072402 ) ( ON ?auto_2072404 ?auto_2072403 ) ( ON ?auto_2072405 ?auto_2072404 ) ( ON ?auto_2072406 ?auto_2072405 ) ( ON ?auto_2072407 ?auto_2072406 ) ( not ( = ?auto_2072395 ?auto_2072396 ) ) ( not ( = ?auto_2072395 ?auto_2072397 ) ) ( not ( = ?auto_2072395 ?auto_2072398 ) ) ( not ( = ?auto_2072395 ?auto_2072399 ) ) ( not ( = ?auto_2072395 ?auto_2072400 ) ) ( not ( = ?auto_2072395 ?auto_2072401 ) ) ( not ( = ?auto_2072395 ?auto_2072402 ) ) ( not ( = ?auto_2072395 ?auto_2072403 ) ) ( not ( = ?auto_2072395 ?auto_2072404 ) ) ( not ( = ?auto_2072395 ?auto_2072405 ) ) ( not ( = ?auto_2072395 ?auto_2072406 ) ) ( not ( = ?auto_2072395 ?auto_2072407 ) ) ( not ( = ?auto_2072395 ?auto_2072408 ) ) ( not ( = ?auto_2072396 ?auto_2072397 ) ) ( not ( = ?auto_2072396 ?auto_2072398 ) ) ( not ( = ?auto_2072396 ?auto_2072399 ) ) ( not ( = ?auto_2072396 ?auto_2072400 ) ) ( not ( = ?auto_2072396 ?auto_2072401 ) ) ( not ( = ?auto_2072396 ?auto_2072402 ) ) ( not ( = ?auto_2072396 ?auto_2072403 ) ) ( not ( = ?auto_2072396 ?auto_2072404 ) ) ( not ( = ?auto_2072396 ?auto_2072405 ) ) ( not ( = ?auto_2072396 ?auto_2072406 ) ) ( not ( = ?auto_2072396 ?auto_2072407 ) ) ( not ( = ?auto_2072396 ?auto_2072408 ) ) ( not ( = ?auto_2072397 ?auto_2072398 ) ) ( not ( = ?auto_2072397 ?auto_2072399 ) ) ( not ( = ?auto_2072397 ?auto_2072400 ) ) ( not ( = ?auto_2072397 ?auto_2072401 ) ) ( not ( = ?auto_2072397 ?auto_2072402 ) ) ( not ( = ?auto_2072397 ?auto_2072403 ) ) ( not ( = ?auto_2072397 ?auto_2072404 ) ) ( not ( = ?auto_2072397 ?auto_2072405 ) ) ( not ( = ?auto_2072397 ?auto_2072406 ) ) ( not ( = ?auto_2072397 ?auto_2072407 ) ) ( not ( = ?auto_2072397 ?auto_2072408 ) ) ( not ( = ?auto_2072398 ?auto_2072399 ) ) ( not ( = ?auto_2072398 ?auto_2072400 ) ) ( not ( = ?auto_2072398 ?auto_2072401 ) ) ( not ( = ?auto_2072398 ?auto_2072402 ) ) ( not ( = ?auto_2072398 ?auto_2072403 ) ) ( not ( = ?auto_2072398 ?auto_2072404 ) ) ( not ( = ?auto_2072398 ?auto_2072405 ) ) ( not ( = ?auto_2072398 ?auto_2072406 ) ) ( not ( = ?auto_2072398 ?auto_2072407 ) ) ( not ( = ?auto_2072398 ?auto_2072408 ) ) ( not ( = ?auto_2072399 ?auto_2072400 ) ) ( not ( = ?auto_2072399 ?auto_2072401 ) ) ( not ( = ?auto_2072399 ?auto_2072402 ) ) ( not ( = ?auto_2072399 ?auto_2072403 ) ) ( not ( = ?auto_2072399 ?auto_2072404 ) ) ( not ( = ?auto_2072399 ?auto_2072405 ) ) ( not ( = ?auto_2072399 ?auto_2072406 ) ) ( not ( = ?auto_2072399 ?auto_2072407 ) ) ( not ( = ?auto_2072399 ?auto_2072408 ) ) ( not ( = ?auto_2072400 ?auto_2072401 ) ) ( not ( = ?auto_2072400 ?auto_2072402 ) ) ( not ( = ?auto_2072400 ?auto_2072403 ) ) ( not ( = ?auto_2072400 ?auto_2072404 ) ) ( not ( = ?auto_2072400 ?auto_2072405 ) ) ( not ( = ?auto_2072400 ?auto_2072406 ) ) ( not ( = ?auto_2072400 ?auto_2072407 ) ) ( not ( = ?auto_2072400 ?auto_2072408 ) ) ( not ( = ?auto_2072401 ?auto_2072402 ) ) ( not ( = ?auto_2072401 ?auto_2072403 ) ) ( not ( = ?auto_2072401 ?auto_2072404 ) ) ( not ( = ?auto_2072401 ?auto_2072405 ) ) ( not ( = ?auto_2072401 ?auto_2072406 ) ) ( not ( = ?auto_2072401 ?auto_2072407 ) ) ( not ( = ?auto_2072401 ?auto_2072408 ) ) ( not ( = ?auto_2072402 ?auto_2072403 ) ) ( not ( = ?auto_2072402 ?auto_2072404 ) ) ( not ( = ?auto_2072402 ?auto_2072405 ) ) ( not ( = ?auto_2072402 ?auto_2072406 ) ) ( not ( = ?auto_2072402 ?auto_2072407 ) ) ( not ( = ?auto_2072402 ?auto_2072408 ) ) ( not ( = ?auto_2072403 ?auto_2072404 ) ) ( not ( = ?auto_2072403 ?auto_2072405 ) ) ( not ( = ?auto_2072403 ?auto_2072406 ) ) ( not ( = ?auto_2072403 ?auto_2072407 ) ) ( not ( = ?auto_2072403 ?auto_2072408 ) ) ( not ( = ?auto_2072404 ?auto_2072405 ) ) ( not ( = ?auto_2072404 ?auto_2072406 ) ) ( not ( = ?auto_2072404 ?auto_2072407 ) ) ( not ( = ?auto_2072404 ?auto_2072408 ) ) ( not ( = ?auto_2072405 ?auto_2072406 ) ) ( not ( = ?auto_2072405 ?auto_2072407 ) ) ( not ( = ?auto_2072405 ?auto_2072408 ) ) ( not ( = ?auto_2072406 ?auto_2072407 ) ) ( not ( = ?auto_2072406 ?auto_2072408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2072407 ?auto_2072408 )
      ( MAKE-13CRATE-VERIFY ?auto_2072395 ?auto_2072396 ?auto_2072397 ?auto_2072398 ?auto_2072399 ?auto_2072400 ?auto_2072401 ?auto_2072402 ?auto_2072403 ?auto_2072404 ?auto_2072405 ?auto_2072406 ?auto_2072407 ?auto_2072408 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072537 - SURFACE
      ?auto_2072538 - SURFACE
      ?auto_2072539 - SURFACE
      ?auto_2072540 - SURFACE
      ?auto_2072541 - SURFACE
      ?auto_2072542 - SURFACE
      ?auto_2072543 - SURFACE
      ?auto_2072544 - SURFACE
      ?auto_2072545 - SURFACE
      ?auto_2072546 - SURFACE
      ?auto_2072547 - SURFACE
      ?auto_2072548 - SURFACE
      ?auto_2072549 - SURFACE
      ?auto_2072550 - SURFACE
    )
    :vars
    (
      ?auto_2072552 - HOIST
      ?auto_2072553 - PLACE
      ?auto_2072551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072552 ?auto_2072553 ) ( SURFACE-AT ?auto_2072549 ?auto_2072553 ) ( CLEAR ?auto_2072549 ) ( IS-CRATE ?auto_2072550 ) ( not ( = ?auto_2072549 ?auto_2072550 ) ) ( TRUCK-AT ?auto_2072551 ?auto_2072553 ) ( AVAILABLE ?auto_2072552 ) ( IN ?auto_2072550 ?auto_2072551 ) ( ON ?auto_2072549 ?auto_2072548 ) ( not ( = ?auto_2072548 ?auto_2072549 ) ) ( not ( = ?auto_2072548 ?auto_2072550 ) ) ( ON ?auto_2072538 ?auto_2072537 ) ( ON ?auto_2072539 ?auto_2072538 ) ( ON ?auto_2072540 ?auto_2072539 ) ( ON ?auto_2072541 ?auto_2072540 ) ( ON ?auto_2072542 ?auto_2072541 ) ( ON ?auto_2072543 ?auto_2072542 ) ( ON ?auto_2072544 ?auto_2072543 ) ( ON ?auto_2072545 ?auto_2072544 ) ( ON ?auto_2072546 ?auto_2072545 ) ( ON ?auto_2072547 ?auto_2072546 ) ( ON ?auto_2072548 ?auto_2072547 ) ( not ( = ?auto_2072537 ?auto_2072538 ) ) ( not ( = ?auto_2072537 ?auto_2072539 ) ) ( not ( = ?auto_2072537 ?auto_2072540 ) ) ( not ( = ?auto_2072537 ?auto_2072541 ) ) ( not ( = ?auto_2072537 ?auto_2072542 ) ) ( not ( = ?auto_2072537 ?auto_2072543 ) ) ( not ( = ?auto_2072537 ?auto_2072544 ) ) ( not ( = ?auto_2072537 ?auto_2072545 ) ) ( not ( = ?auto_2072537 ?auto_2072546 ) ) ( not ( = ?auto_2072537 ?auto_2072547 ) ) ( not ( = ?auto_2072537 ?auto_2072548 ) ) ( not ( = ?auto_2072537 ?auto_2072549 ) ) ( not ( = ?auto_2072537 ?auto_2072550 ) ) ( not ( = ?auto_2072538 ?auto_2072539 ) ) ( not ( = ?auto_2072538 ?auto_2072540 ) ) ( not ( = ?auto_2072538 ?auto_2072541 ) ) ( not ( = ?auto_2072538 ?auto_2072542 ) ) ( not ( = ?auto_2072538 ?auto_2072543 ) ) ( not ( = ?auto_2072538 ?auto_2072544 ) ) ( not ( = ?auto_2072538 ?auto_2072545 ) ) ( not ( = ?auto_2072538 ?auto_2072546 ) ) ( not ( = ?auto_2072538 ?auto_2072547 ) ) ( not ( = ?auto_2072538 ?auto_2072548 ) ) ( not ( = ?auto_2072538 ?auto_2072549 ) ) ( not ( = ?auto_2072538 ?auto_2072550 ) ) ( not ( = ?auto_2072539 ?auto_2072540 ) ) ( not ( = ?auto_2072539 ?auto_2072541 ) ) ( not ( = ?auto_2072539 ?auto_2072542 ) ) ( not ( = ?auto_2072539 ?auto_2072543 ) ) ( not ( = ?auto_2072539 ?auto_2072544 ) ) ( not ( = ?auto_2072539 ?auto_2072545 ) ) ( not ( = ?auto_2072539 ?auto_2072546 ) ) ( not ( = ?auto_2072539 ?auto_2072547 ) ) ( not ( = ?auto_2072539 ?auto_2072548 ) ) ( not ( = ?auto_2072539 ?auto_2072549 ) ) ( not ( = ?auto_2072539 ?auto_2072550 ) ) ( not ( = ?auto_2072540 ?auto_2072541 ) ) ( not ( = ?auto_2072540 ?auto_2072542 ) ) ( not ( = ?auto_2072540 ?auto_2072543 ) ) ( not ( = ?auto_2072540 ?auto_2072544 ) ) ( not ( = ?auto_2072540 ?auto_2072545 ) ) ( not ( = ?auto_2072540 ?auto_2072546 ) ) ( not ( = ?auto_2072540 ?auto_2072547 ) ) ( not ( = ?auto_2072540 ?auto_2072548 ) ) ( not ( = ?auto_2072540 ?auto_2072549 ) ) ( not ( = ?auto_2072540 ?auto_2072550 ) ) ( not ( = ?auto_2072541 ?auto_2072542 ) ) ( not ( = ?auto_2072541 ?auto_2072543 ) ) ( not ( = ?auto_2072541 ?auto_2072544 ) ) ( not ( = ?auto_2072541 ?auto_2072545 ) ) ( not ( = ?auto_2072541 ?auto_2072546 ) ) ( not ( = ?auto_2072541 ?auto_2072547 ) ) ( not ( = ?auto_2072541 ?auto_2072548 ) ) ( not ( = ?auto_2072541 ?auto_2072549 ) ) ( not ( = ?auto_2072541 ?auto_2072550 ) ) ( not ( = ?auto_2072542 ?auto_2072543 ) ) ( not ( = ?auto_2072542 ?auto_2072544 ) ) ( not ( = ?auto_2072542 ?auto_2072545 ) ) ( not ( = ?auto_2072542 ?auto_2072546 ) ) ( not ( = ?auto_2072542 ?auto_2072547 ) ) ( not ( = ?auto_2072542 ?auto_2072548 ) ) ( not ( = ?auto_2072542 ?auto_2072549 ) ) ( not ( = ?auto_2072542 ?auto_2072550 ) ) ( not ( = ?auto_2072543 ?auto_2072544 ) ) ( not ( = ?auto_2072543 ?auto_2072545 ) ) ( not ( = ?auto_2072543 ?auto_2072546 ) ) ( not ( = ?auto_2072543 ?auto_2072547 ) ) ( not ( = ?auto_2072543 ?auto_2072548 ) ) ( not ( = ?auto_2072543 ?auto_2072549 ) ) ( not ( = ?auto_2072543 ?auto_2072550 ) ) ( not ( = ?auto_2072544 ?auto_2072545 ) ) ( not ( = ?auto_2072544 ?auto_2072546 ) ) ( not ( = ?auto_2072544 ?auto_2072547 ) ) ( not ( = ?auto_2072544 ?auto_2072548 ) ) ( not ( = ?auto_2072544 ?auto_2072549 ) ) ( not ( = ?auto_2072544 ?auto_2072550 ) ) ( not ( = ?auto_2072545 ?auto_2072546 ) ) ( not ( = ?auto_2072545 ?auto_2072547 ) ) ( not ( = ?auto_2072545 ?auto_2072548 ) ) ( not ( = ?auto_2072545 ?auto_2072549 ) ) ( not ( = ?auto_2072545 ?auto_2072550 ) ) ( not ( = ?auto_2072546 ?auto_2072547 ) ) ( not ( = ?auto_2072546 ?auto_2072548 ) ) ( not ( = ?auto_2072546 ?auto_2072549 ) ) ( not ( = ?auto_2072546 ?auto_2072550 ) ) ( not ( = ?auto_2072547 ?auto_2072548 ) ) ( not ( = ?auto_2072547 ?auto_2072549 ) ) ( not ( = ?auto_2072547 ?auto_2072550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072548 ?auto_2072549 ?auto_2072550 )
      ( MAKE-13CRATE-VERIFY ?auto_2072537 ?auto_2072538 ?auto_2072539 ?auto_2072540 ?auto_2072541 ?auto_2072542 ?auto_2072543 ?auto_2072544 ?auto_2072545 ?auto_2072546 ?auto_2072547 ?auto_2072548 ?auto_2072549 ?auto_2072550 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072693 - SURFACE
      ?auto_2072694 - SURFACE
      ?auto_2072695 - SURFACE
      ?auto_2072696 - SURFACE
      ?auto_2072697 - SURFACE
      ?auto_2072698 - SURFACE
      ?auto_2072699 - SURFACE
      ?auto_2072700 - SURFACE
      ?auto_2072701 - SURFACE
      ?auto_2072702 - SURFACE
      ?auto_2072703 - SURFACE
      ?auto_2072704 - SURFACE
      ?auto_2072705 - SURFACE
      ?auto_2072706 - SURFACE
    )
    :vars
    (
      ?auto_2072709 - HOIST
      ?auto_2072707 - PLACE
      ?auto_2072710 - TRUCK
      ?auto_2072708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072709 ?auto_2072707 ) ( SURFACE-AT ?auto_2072705 ?auto_2072707 ) ( CLEAR ?auto_2072705 ) ( IS-CRATE ?auto_2072706 ) ( not ( = ?auto_2072705 ?auto_2072706 ) ) ( AVAILABLE ?auto_2072709 ) ( IN ?auto_2072706 ?auto_2072710 ) ( ON ?auto_2072705 ?auto_2072704 ) ( not ( = ?auto_2072704 ?auto_2072705 ) ) ( not ( = ?auto_2072704 ?auto_2072706 ) ) ( TRUCK-AT ?auto_2072710 ?auto_2072708 ) ( not ( = ?auto_2072708 ?auto_2072707 ) ) ( ON ?auto_2072694 ?auto_2072693 ) ( ON ?auto_2072695 ?auto_2072694 ) ( ON ?auto_2072696 ?auto_2072695 ) ( ON ?auto_2072697 ?auto_2072696 ) ( ON ?auto_2072698 ?auto_2072697 ) ( ON ?auto_2072699 ?auto_2072698 ) ( ON ?auto_2072700 ?auto_2072699 ) ( ON ?auto_2072701 ?auto_2072700 ) ( ON ?auto_2072702 ?auto_2072701 ) ( ON ?auto_2072703 ?auto_2072702 ) ( ON ?auto_2072704 ?auto_2072703 ) ( not ( = ?auto_2072693 ?auto_2072694 ) ) ( not ( = ?auto_2072693 ?auto_2072695 ) ) ( not ( = ?auto_2072693 ?auto_2072696 ) ) ( not ( = ?auto_2072693 ?auto_2072697 ) ) ( not ( = ?auto_2072693 ?auto_2072698 ) ) ( not ( = ?auto_2072693 ?auto_2072699 ) ) ( not ( = ?auto_2072693 ?auto_2072700 ) ) ( not ( = ?auto_2072693 ?auto_2072701 ) ) ( not ( = ?auto_2072693 ?auto_2072702 ) ) ( not ( = ?auto_2072693 ?auto_2072703 ) ) ( not ( = ?auto_2072693 ?auto_2072704 ) ) ( not ( = ?auto_2072693 ?auto_2072705 ) ) ( not ( = ?auto_2072693 ?auto_2072706 ) ) ( not ( = ?auto_2072694 ?auto_2072695 ) ) ( not ( = ?auto_2072694 ?auto_2072696 ) ) ( not ( = ?auto_2072694 ?auto_2072697 ) ) ( not ( = ?auto_2072694 ?auto_2072698 ) ) ( not ( = ?auto_2072694 ?auto_2072699 ) ) ( not ( = ?auto_2072694 ?auto_2072700 ) ) ( not ( = ?auto_2072694 ?auto_2072701 ) ) ( not ( = ?auto_2072694 ?auto_2072702 ) ) ( not ( = ?auto_2072694 ?auto_2072703 ) ) ( not ( = ?auto_2072694 ?auto_2072704 ) ) ( not ( = ?auto_2072694 ?auto_2072705 ) ) ( not ( = ?auto_2072694 ?auto_2072706 ) ) ( not ( = ?auto_2072695 ?auto_2072696 ) ) ( not ( = ?auto_2072695 ?auto_2072697 ) ) ( not ( = ?auto_2072695 ?auto_2072698 ) ) ( not ( = ?auto_2072695 ?auto_2072699 ) ) ( not ( = ?auto_2072695 ?auto_2072700 ) ) ( not ( = ?auto_2072695 ?auto_2072701 ) ) ( not ( = ?auto_2072695 ?auto_2072702 ) ) ( not ( = ?auto_2072695 ?auto_2072703 ) ) ( not ( = ?auto_2072695 ?auto_2072704 ) ) ( not ( = ?auto_2072695 ?auto_2072705 ) ) ( not ( = ?auto_2072695 ?auto_2072706 ) ) ( not ( = ?auto_2072696 ?auto_2072697 ) ) ( not ( = ?auto_2072696 ?auto_2072698 ) ) ( not ( = ?auto_2072696 ?auto_2072699 ) ) ( not ( = ?auto_2072696 ?auto_2072700 ) ) ( not ( = ?auto_2072696 ?auto_2072701 ) ) ( not ( = ?auto_2072696 ?auto_2072702 ) ) ( not ( = ?auto_2072696 ?auto_2072703 ) ) ( not ( = ?auto_2072696 ?auto_2072704 ) ) ( not ( = ?auto_2072696 ?auto_2072705 ) ) ( not ( = ?auto_2072696 ?auto_2072706 ) ) ( not ( = ?auto_2072697 ?auto_2072698 ) ) ( not ( = ?auto_2072697 ?auto_2072699 ) ) ( not ( = ?auto_2072697 ?auto_2072700 ) ) ( not ( = ?auto_2072697 ?auto_2072701 ) ) ( not ( = ?auto_2072697 ?auto_2072702 ) ) ( not ( = ?auto_2072697 ?auto_2072703 ) ) ( not ( = ?auto_2072697 ?auto_2072704 ) ) ( not ( = ?auto_2072697 ?auto_2072705 ) ) ( not ( = ?auto_2072697 ?auto_2072706 ) ) ( not ( = ?auto_2072698 ?auto_2072699 ) ) ( not ( = ?auto_2072698 ?auto_2072700 ) ) ( not ( = ?auto_2072698 ?auto_2072701 ) ) ( not ( = ?auto_2072698 ?auto_2072702 ) ) ( not ( = ?auto_2072698 ?auto_2072703 ) ) ( not ( = ?auto_2072698 ?auto_2072704 ) ) ( not ( = ?auto_2072698 ?auto_2072705 ) ) ( not ( = ?auto_2072698 ?auto_2072706 ) ) ( not ( = ?auto_2072699 ?auto_2072700 ) ) ( not ( = ?auto_2072699 ?auto_2072701 ) ) ( not ( = ?auto_2072699 ?auto_2072702 ) ) ( not ( = ?auto_2072699 ?auto_2072703 ) ) ( not ( = ?auto_2072699 ?auto_2072704 ) ) ( not ( = ?auto_2072699 ?auto_2072705 ) ) ( not ( = ?auto_2072699 ?auto_2072706 ) ) ( not ( = ?auto_2072700 ?auto_2072701 ) ) ( not ( = ?auto_2072700 ?auto_2072702 ) ) ( not ( = ?auto_2072700 ?auto_2072703 ) ) ( not ( = ?auto_2072700 ?auto_2072704 ) ) ( not ( = ?auto_2072700 ?auto_2072705 ) ) ( not ( = ?auto_2072700 ?auto_2072706 ) ) ( not ( = ?auto_2072701 ?auto_2072702 ) ) ( not ( = ?auto_2072701 ?auto_2072703 ) ) ( not ( = ?auto_2072701 ?auto_2072704 ) ) ( not ( = ?auto_2072701 ?auto_2072705 ) ) ( not ( = ?auto_2072701 ?auto_2072706 ) ) ( not ( = ?auto_2072702 ?auto_2072703 ) ) ( not ( = ?auto_2072702 ?auto_2072704 ) ) ( not ( = ?auto_2072702 ?auto_2072705 ) ) ( not ( = ?auto_2072702 ?auto_2072706 ) ) ( not ( = ?auto_2072703 ?auto_2072704 ) ) ( not ( = ?auto_2072703 ?auto_2072705 ) ) ( not ( = ?auto_2072703 ?auto_2072706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072704 ?auto_2072705 ?auto_2072706 )
      ( MAKE-13CRATE-VERIFY ?auto_2072693 ?auto_2072694 ?auto_2072695 ?auto_2072696 ?auto_2072697 ?auto_2072698 ?auto_2072699 ?auto_2072700 ?auto_2072701 ?auto_2072702 ?auto_2072703 ?auto_2072704 ?auto_2072705 ?auto_2072706 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072862 - SURFACE
      ?auto_2072863 - SURFACE
      ?auto_2072864 - SURFACE
      ?auto_2072865 - SURFACE
      ?auto_2072866 - SURFACE
      ?auto_2072867 - SURFACE
      ?auto_2072868 - SURFACE
      ?auto_2072869 - SURFACE
      ?auto_2072870 - SURFACE
      ?auto_2072871 - SURFACE
      ?auto_2072872 - SURFACE
      ?auto_2072873 - SURFACE
      ?auto_2072874 - SURFACE
      ?auto_2072875 - SURFACE
    )
    :vars
    (
      ?auto_2072876 - HOIST
      ?auto_2072879 - PLACE
      ?auto_2072880 - TRUCK
      ?auto_2072877 - PLACE
      ?auto_2072878 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072876 ?auto_2072879 ) ( SURFACE-AT ?auto_2072874 ?auto_2072879 ) ( CLEAR ?auto_2072874 ) ( IS-CRATE ?auto_2072875 ) ( not ( = ?auto_2072874 ?auto_2072875 ) ) ( AVAILABLE ?auto_2072876 ) ( ON ?auto_2072874 ?auto_2072873 ) ( not ( = ?auto_2072873 ?auto_2072874 ) ) ( not ( = ?auto_2072873 ?auto_2072875 ) ) ( TRUCK-AT ?auto_2072880 ?auto_2072877 ) ( not ( = ?auto_2072877 ?auto_2072879 ) ) ( HOIST-AT ?auto_2072878 ?auto_2072877 ) ( LIFTING ?auto_2072878 ?auto_2072875 ) ( not ( = ?auto_2072876 ?auto_2072878 ) ) ( ON ?auto_2072863 ?auto_2072862 ) ( ON ?auto_2072864 ?auto_2072863 ) ( ON ?auto_2072865 ?auto_2072864 ) ( ON ?auto_2072866 ?auto_2072865 ) ( ON ?auto_2072867 ?auto_2072866 ) ( ON ?auto_2072868 ?auto_2072867 ) ( ON ?auto_2072869 ?auto_2072868 ) ( ON ?auto_2072870 ?auto_2072869 ) ( ON ?auto_2072871 ?auto_2072870 ) ( ON ?auto_2072872 ?auto_2072871 ) ( ON ?auto_2072873 ?auto_2072872 ) ( not ( = ?auto_2072862 ?auto_2072863 ) ) ( not ( = ?auto_2072862 ?auto_2072864 ) ) ( not ( = ?auto_2072862 ?auto_2072865 ) ) ( not ( = ?auto_2072862 ?auto_2072866 ) ) ( not ( = ?auto_2072862 ?auto_2072867 ) ) ( not ( = ?auto_2072862 ?auto_2072868 ) ) ( not ( = ?auto_2072862 ?auto_2072869 ) ) ( not ( = ?auto_2072862 ?auto_2072870 ) ) ( not ( = ?auto_2072862 ?auto_2072871 ) ) ( not ( = ?auto_2072862 ?auto_2072872 ) ) ( not ( = ?auto_2072862 ?auto_2072873 ) ) ( not ( = ?auto_2072862 ?auto_2072874 ) ) ( not ( = ?auto_2072862 ?auto_2072875 ) ) ( not ( = ?auto_2072863 ?auto_2072864 ) ) ( not ( = ?auto_2072863 ?auto_2072865 ) ) ( not ( = ?auto_2072863 ?auto_2072866 ) ) ( not ( = ?auto_2072863 ?auto_2072867 ) ) ( not ( = ?auto_2072863 ?auto_2072868 ) ) ( not ( = ?auto_2072863 ?auto_2072869 ) ) ( not ( = ?auto_2072863 ?auto_2072870 ) ) ( not ( = ?auto_2072863 ?auto_2072871 ) ) ( not ( = ?auto_2072863 ?auto_2072872 ) ) ( not ( = ?auto_2072863 ?auto_2072873 ) ) ( not ( = ?auto_2072863 ?auto_2072874 ) ) ( not ( = ?auto_2072863 ?auto_2072875 ) ) ( not ( = ?auto_2072864 ?auto_2072865 ) ) ( not ( = ?auto_2072864 ?auto_2072866 ) ) ( not ( = ?auto_2072864 ?auto_2072867 ) ) ( not ( = ?auto_2072864 ?auto_2072868 ) ) ( not ( = ?auto_2072864 ?auto_2072869 ) ) ( not ( = ?auto_2072864 ?auto_2072870 ) ) ( not ( = ?auto_2072864 ?auto_2072871 ) ) ( not ( = ?auto_2072864 ?auto_2072872 ) ) ( not ( = ?auto_2072864 ?auto_2072873 ) ) ( not ( = ?auto_2072864 ?auto_2072874 ) ) ( not ( = ?auto_2072864 ?auto_2072875 ) ) ( not ( = ?auto_2072865 ?auto_2072866 ) ) ( not ( = ?auto_2072865 ?auto_2072867 ) ) ( not ( = ?auto_2072865 ?auto_2072868 ) ) ( not ( = ?auto_2072865 ?auto_2072869 ) ) ( not ( = ?auto_2072865 ?auto_2072870 ) ) ( not ( = ?auto_2072865 ?auto_2072871 ) ) ( not ( = ?auto_2072865 ?auto_2072872 ) ) ( not ( = ?auto_2072865 ?auto_2072873 ) ) ( not ( = ?auto_2072865 ?auto_2072874 ) ) ( not ( = ?auto_2072865 ?auto_2072875 ) ) ( not ( = ?auto_2072866 ?auto_2072867 ) ) ( not ( = ?auto_2072866 ?auto_2072868 ) ) ( not ( = ?auto_2072866 ?auto_2072869 ) ) ( not ( = ?auto_2072866 ?auto_2072870 ) ) ( not ( = ?auto_2072866 ?auto_2072871 ) ) ( not ( = ?auto_2072866 ?auto_2072872 ) ) ( not ( = ?auto_2072866 ?auto_2072873 ) ) ( not ( = ?auto_2072866 ?auto_2072874 ) ) ( not ( = ?auto_2072866 ?auto_2072875 ) ) ( not ( = ?auto_2072867 ?auto_2072868 ) ) ( not ( = ?auto_2072867 ?auto_2072869 ) ) ( not ( = ?auto_2072867 ?auto_2072870 ) ) ( not ( = ?auto_2072867 ?auto_2072871 ) ) ( not ( = ?auto_2072867 ?auto_2072872 ) ) ( not ( = ?auto_2072867 ?auto_2072873 ) ) ( not ( = ?auto_2072867 ?auto_2072874 ) ) ( not ( = ?auto_2072867 ?auto_2072875 ) ) ( not ( = ?auto_2072868 ?auto_2072869 ) ) ( not ( = ?auto_2072868 ?auto_2072870 ) ) ( not ( = ?auto_2072868 ?auto_2072871 ) ) ( not ( = ?auto_2072868 ?auto_2072872 ) ) ( not ( = ?auto_2072868 ?auto_2072873 ) ) ( not ( = ?auto_2072868 ?auto_2072874 ) ) ( not ( = ?auto_2072868 ?auto_2072875 ) ) ( not ( = ?auto_2072869 ?auto_2072870 ) ) ( not ( = ?auto_2072869 ?auto_2072871 ) ) ( not ( = ?auto_2072869 ?auto_2072872 ) ) ( not ( = ?auto_2072869 ?auto_2072873 ) ) ( not ( = ?auto_2072869 ?auto_2072874 ) ) ( not ( = ?auto_2072869 ?auto_2072875 ) ) ( not ( = ?auto_2072870 ?auto_2072871 ) ) ( not ( = ?auto_2072870 ?auto_2072872 ) ) ( not ( = ?auto_2072870 ?auto_2072873 ) ) ( not ( = ?auto_2072870 ?auto_2072874 ) ) ( not ( = ?auto_2072870 ?auto_2072875 ) ) ( not ( = ?auto_2072871 ?auto_2072872 ) ) ( not ( = ?auto_2072871 ?auto_2072873 ) ) ( not ( = ?auto_2072871 ?auto_2072874 ) ) ( not ( = ?auto_2072871 ?auto_2072875 ) ) ( not ( = ?auto_2072872 ?auto_2072873 ) ) ( not ( = ?auto_2072872 ?auto_2072874 ) ) ( not ( = ?auto_2072872 ?auto_2072875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072873 ?auto_2072874 ?auto_2072875 )
      ( MAKE-13CRATE-VERIFY ?auto_2072862 ?auto_2072863 ?auto_2072864 ?auto_2072865 ?auto_2072866 ?auto_2072867 ?auto_2072868 ?auto_2072869 ?auto_2072870 ?auto_2072871 ?auto_2072872 ?auto_2072873 ?auto_2072874 ?auto_2072875 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073044 - SURFACE
      ?auto_2073045 - SURFACE
      ?auto_2073046 - SURFACE
      ?auto_2073047 - SURFACE
      ?auto_2073048 - SURFACE
      ?auto_2073049 - SURFACE
      ?auto_2073050 - SURFACE
      ?auto_2073051 - SURFACE
      ?auto_2073052 - SURFACE
      ?auto_2073053 - SURFACE
      ?auto_2073054 - SURFACE
      ?auto_2073055 - SURFACE
      ?auto_2073056 - SURFACE
      ?auto_2073057 - SURFACE
    )
    :vars
    (
      ?auto_2073060 - HOIST
      ?auto_2073062 - PLACE
      ?auto_2073058 - TRUCK
      ?auto_2073061 - PLACE
      ?auto_2073063 - HOIST
      ?auto_2073059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073060 ?auto_2073062 ) ( SURFACE-AT ?auto_2073056 ?auto_2073062 ) ( CLEAR ?auto_2073056 ) ( IS-CRATE ?auto_2073057 ) ( not ( = ?auto_2073056 ?auto_2073057 ) ) ( AVAILABLE ?auto_2073060 ) ( ON ?auto_2073056 ?auto_2073055 ) ( not ( = ?auto_2073055 ?auto_2073056 ) ) ( not ( = ?auto_2073055 ?auto_2073057 ) ) ( TRUCK-AT ?auto_2073058 ?auto_2073061 ) ( not ( = ?auto_2073061 ?auto_2073062 ) ) ( HOIST-AT ?auto_2073063 ?auto_2073061 ) ( not ( = ?auto_2073060 ?auto_2073063 ) ) ( AVAILABLE ?auto_2073063 ) ( SURFACE-AT ?auto_2073057 ?auto_2073061 ) ( ON ?auto_2073057 ?auto_2073059 ) ( CLEAR ?auto_2073057 ) ( not ( = ?auto_2073056 ?auto_2073059 ) ) ( not ( = ?auto_2073057 ?auto_2073059 ) ) ( not ( = ?auto_2073055 ?auto_2073059 ) ) ( ON ?auto_2073045 ?auto_2073044 ) ( ON ?auto_2073046 ?auto_2073045 ) ( ON ?auto_2073047 ?auto_2073046 ) ( ON ?auto_2073048 ?auto_2073047 ) ( ON ?auto_2073049 ?auto_2073048 ) ( ON ?auto_2073050 ?auto_2073049 ) ( ON ?auto_2073051 ?auto_2073050 ) ( ON ?auto_2073052 ?auto_2073051 ) ( ON ?auto_2073053 ?auto_2073052 ) ( ON ?auto_2073054 ?auto_2073053 ) ( ON ?auto_2073055 ?auto_2073054 ) ( not ( = ?auto_2073044 ?auto_2073045 ) ) ( not ( = ?auto_2073044 ?auto_2073046 ) ) ( not ( = ?auto_2073044 ?auto_2073047 ) ) ( not ( = ?auto_2073044 ?auto_2073048 ) ) ( not ( = ?auto_2073044 ?auto_2073049 ) ) ( not ( = ?auto_2073044 ?auto_2073050 ) ) ( not ( = ?auto_2073044 ?auto_2073051 ) ) ( not ( = ?auto_2073044 ?auto_2073052 ) ) ( not ( = ?auto_2073044 ?auto_2073053 ) ) ( not ( = ?auto_2073044 ?auto_2073054 ) ) ( not ( = ?auto_2073044 ?auto_2073055 ) ) ( not ( = ?auto_2073044 ?auto_2073056 ) ) ( not ( = ?auto_2073044 ?auto_2073057 ) ) ( not ( = ?auto_2073044 ?auto_2073059 ) ) ( not ( = ?auto_2073045 ?auto_2073046 ) ) ( not ( = ?auto_2073045 ?auto_2073047 ) ) ( not ( = ?auto_2073045 ?auto_2073048 ) ) ( not ( = ?auto_2073045 ?auto_2073049 ) ) ( not ( = ?auto_2073045 ?auto_2073050 ) ) ( not ( = ?auto_2073045 ?auto_2073051 ) ) ( not ( = ?auto_2073045 ?auto_2073052 ) ) ( not ( = ?auto_2073045 ?auto_2073053 ) ) ( not ( = ?auto_2073045 ?auto_2073054 ) ) ( not ( = ?auto_2073045 ?auto_2073055 ) ) ( not ( = ?auto_2073045 ?auto_2073056 ) ) ( not ( = ?auto_2073045 ?auto_2073057 ) ) ( not ( = ?auto_2073045 ?auto_2073059 ) ) ( not ( = ?auto_2073046 ?auto_2073047 ) ) ( not ( = ?auto_2073046 ?auto_2073048 ) ) ( not ( = ?auto_2073046 ?auto_2073049 ) ) ( not ( = ?auto_2073046 ?auto_2073050 ) ) ( not ( = ?auto_2073046 ?auto_2073051 ) ) ( not ( = ?auto_2073046 ?auto_2073052 ) ) ( not ( = ?auto_2073046 ?auto_2073053 ) ) ( not ( = ?auto_2073046 ?auto_2073054 ) ) ( not ( = ?auto_2073046 ?auto_2073055 ) ) ( not ( = ?auto_2073046 ?auto_2073056 ) ) ( not ( = ?auto_2073046 ?auto_2073057 ) ) ( not ( = ?auto_2073046 ?auto_2073059 ) ) ( not ( = ?auto_2073047 ?auto_2073048 ) ) ( not ( = ?auto_2073047 ?auto_2073049 ) ) ( not ( = ?auto_2073047 ?auto_2073050 ) ) ( not ( = ?auto_2073047 ?auto_2073051 ) ) ( not ( = ?auto_2073047 ?auto_2073052 ) ) ( not ( = ?auto_2073047 ?auto_2073053 ) ) ( not ( = ?auto_2073047 ?auto_2073054 ) ) ( not ( = ?auto_2073047 ?auto_2073055 ) ) ( not ( = ?auto_2073047 ?auto_2073056 ) ) ( not ( = ?auto_2073047 ?auto_2073057 ) ) ( not ( = ?auto_2073047 ?auto_2073059 ) ) ( not ( = ?auto_2073048 ?auto_2073049 ) ) ( not ( = ?auto_2073048 ?auto_2073050 ) ) ( not ( = ?auto_2073048 ?auto_2073051 ) ) ( not ( = ?auto_2073048 ?auto_2073052 ) ) ( not ( = ?auto_2073048 ?auto_2073053 ) ) ( not ( = ?auto_2073048 ?auto_2073054 ) ) ( not ( = ?auto_2073048 ?auto_2073055 ) ) ( not ( = ?auto_2073048 ?auto_2073056 ) ) ( not ( = ?auto_2073048 ?auto_2073057 ) ) ( not ( = ?auto_2073048 ?auto_2073059 ) ) ( not ( = ?auto_2073049 ?auto_2073050 ) ) ( not ( = ?auto_2073049 ?auto_2073051 ) ) ( not ( = ?auto_2073049 ?auto_2073052 ) ) ( not ( = ?auto_2073049 ?auto_2073053 ) ) ( not ( = ?auto_2073049 ?auto_2073054 ) ) ( not ( = ?auto_2073049 ?auto_2073055 ) ) ( not ( = ?auto_2073049 ?auto_2073056 ) ) ( not ( = ?auto_2073049 ?auto_2073057 ) ) ( not ( = ?auto_2073049 ?auto_2073059 ) ) ( not ( = ?auto_2073050 ?auto_2073051 ) ) ( not ( = ?auto_2073050 ?auto_2073052 ) ) ( not ( = ?auto_2073050 ?auto_2073053 ) ) ( not ( = ?auto_2073050 ?auto_2073054 ) ) ( not ( = ?auto_2073050 ?auto_2073055 ) ) ( not ( = ?auto_2073050 ?auto_2073056 ) ) ( not ( = ?auto_2073050 ?auto_2073057 ) ) ( not ( = ?auto_2073050 ?auto_2073059 ) ) ( not ( = ?auto_2073051 ?auto_2073052 ) ) ( not ( = ?auto_2073051 ?auto_2073053 ) ) ( not ( = ?auto_2073051 ?auto_2073054 ) ) ( not ( = ?auto_2073051 ?auto_2073055 ) ) ( not ( = ?auto_2073051 ?auto_2073056 ) ) ( not ( = ?auto_2073051 ?auto_2073057 ) ) ( not ( = ?auto_2073051 ?auto_2073059 ) ) ( not ( = ?auto_2073052 ?auto_2073053 ) ) ( not ( = ?auto_2073052 ?auto_2073054 ) ) ( not ( = ?auto_2073052 ?auto_2073055 ) ) ( not ( = ?auto_2073052 ?auto_2073056 ) ) ( not ( = ?auto_2073052 ?auto_2073057 ) ) ( not ( = ?auto_2073052 ?auto_2073059 ) ) ( not ( = ?auto_2073053 ?auto_2073054 ) ) ( not ( = ?auto_2073053 ?auto_2073055 ) ) ( not ( = ?auto_2073053 ?auto_2073056 ) ) ( not ( = ?auto_2073053 ?auto_2073057 ) ) ( not ( = ?auto_2073053 ?auto_2073059 ) ) ( not ( = ?auto_2073054 ?auto_2073055 ) ) ( not ( = ?auto_2073054 ?auto_2073056 ) ) ( not ( = ?auto_2073054 ?auto_2073057 ) ) ( not ( = ?auto_2073054 ?auto_2073059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073055 ?auto_2073056 ?auto_2073057 )
      ( MAKE-13CRATE-VERIFY ?auto_2073044 ?auto_2073045 ?auto_2073046 ?auto_2073047 ?auto_2073048 ?auto_2073049 ?auto_2073050 ?auto_2073051 ?auto_2073052 ?auto_2073053 ?auto_2073054 ?auto_2073055 ?auto_2073056 ?auto_2073057 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073227 - SURFACE
      ?auto_2073228 - SURFACE
      ?auto_2073229 - SURFACE
      ?auto_2073230 - SURFACE
      ?auto_2073231 - SURFACE
      ?auto_2073232 - SURFACE
      ?auto_2073233 - SURFACE
      ?auto_2073234 - SURFACE
      ?auto_2073235 - SURFACE
      ?auto_2073236 - SURFACE
      ?auto_2073237 - SURFACE
      ?auto_2073238 - SURFACE
      ?auto_2073239 - SURFACE
      ?auto_2073240 - SURFACE
    )
    :vars
    (
      ?auto_2073242 - HOIST
      ?auto_2073241 - PLACE
      ?auto_2073243 - PLACE
      ?auto_2073246 - HOIST
      ?auto_2073244 - SURFACE
      ?auto_2073245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073242 ?auto_2073241 ) ( SURFACE-AT ?auto_2073239 ?auto_2073241 ) ( CLEAR ?auto_2073239 ) ( IS-CRATE ?auto_2073240 ) ( not ( = ?auto_2073239 ?auto_2073240 ) ) ( AVAILABLE ?auto_2073242 ) ( ON ?auto_2073239 ?auto_2073238 ) ( not ( = ?auto_2073238 ?auto_2073239 ) ) ( not ( = ?auto_2073238 ?auto_2073240 ) ) ( not ( = ?auto_2073243 ?auto_2073241 ) ) ( HOIST-AT ?auto_2073246 ?auto_2073243 ) ( not ( = ?auto_2073242 ?auto_2073246 ) ) ( AVAILABLE ?auto_2073246 ) ( SURFACE-AT ?auto_2073240 ?auto_2073243 ) ( ON ?auto_2073240 ?auto_2073244 ) ( CLEAR ?auto_2073240 ) ( not ( = ?auto_2073239 ?auto_2073244 ) ) ( not ( = ?auto_2073240 ?auto_2073244 ) ) ( not ( = ?auto_2073238 ?auto_2073244 ) ) ( TRUCK-AT ?auto_2073245 ?auto_2073241 ) ( ON ?auto_2073228 ?auto_2073227 ) ( ON ?auto_2073229 ?auto_2073228 ) ( ON ?auto_2073230 ?auto_2073229 ) ( ON ?auto_2073231 ?auto_2073230 ) ( ON ?auto_2073232 ?auto_2073231 ) ( ON ?auto_2073233 ?auto_2073232 ) ( ON ?auto_2073234 ?auto_2073233 ) ( ON ?auto_2073235 ?auto_2073234 ) ( ON ?auto_2073236 ?auto_2073235 ) ( ON ?auto_2073237 ?auto_2073236 ) ( ON ?auto_2073238 ?auto_2073237 ) ( not ( = ?auto_2073227 ?auto_2073228 ) ) ( not ( = ?auto_2073227 ?auto_2073229 ) ) ( not ( = ?auto_2073227 ?auto_2073230 ) ) ( not ( = ?auto_2073227 ?auto_2073231 ) ) ( not ( = ?auto_2073227 ?auto_2073232 ) ) ( not ( = ?auto_2073227 ?auto_2073233 ) ) ( not ( = ?auto_2073227 ?auto_2073234 ) ) ( not ( = ?auto_2073227 ?auto_2073235 ) ) ( not ( = ?auto_2073227 ?auto_2073236 ) ) ( not ( = ?auto_2073227 ?auto_2073237 ) ) ( not ( = ?auto_2073227 ?auto_2073238 ) ) ( not ( = ?auto_2073227 ?auto_2073239 ) ) ( not ( = ?auto_2073227 ?auto_2073240 ) ) ( not ( = ?auto_2073227 ?auto_2073244 ) ) ( not ( = ?auto_2073228 ?auto_2073229 ) ) ( not ( = ?auto_2073228 ?auto_2073230 ) ) ( not ( = ?auto_2073228 ?auto_2073231 ) ) ( not ( = ?auto_2073228 ?auto_2073232 ) ) ( not ( = ?auto_2073228 ?auto_2073233 ) ) ( not ( = ?auto_2073228 ?auto_2073234 ) ) ( not ( = ?auto_2073228 ?auto_2073235 ) ) ( not ( = ?auto_2073228 ?auto_2073236 ) ) ( not ( = ?auto_2073228 ?auto_2073237 ) ) ( not ( = ?auto_2073228 ?auto_2073238 ) ) ( not ( = ?auto_2073228 ?auto_2073239 ) ) ( not ( = ?auto_2073228 ?auto_2073240 ) ) ( not ( = ?auto_2073228 ?auto_2073244 ) ) ( not ( = ?auto_2073229 ?auto_2073230 ) ) ( not ( = ?auto_2073229 ?auto_2073231 ) ) ( not ( = ?auto_2073229 ?auto_2073232 ) ) ( not ( = ?auto_2073229 ?auto_2073233 ) ) ( not ( = ?auto_2073229 ?auto_2073234 ) ) ( not ( = ?auto_2073229 ?auto_2073235 ) ) ( not ( = ?auto_2073229 ?auto_2073236 ) ) ( not ( = ?auto_2073229 ?auto_2073237 ) ) ( not ( = ?auto_2073229 ?auto_2073238 ) ) ( not ( = ?auto_2073229 ?auto_2073239 ) ) ( not ( = ?auto_2073229 ?auto_2073240 ) ) ( not ( = ?auto_2073229 ?auto_2073244 ) ) ( not ( = ?auto_2073230 ?auto_2073231 ) ) ( not ( = ?auto_2073230 ?auto_2073232 ) ) ( not ( = ?auto_2073230 ?auto_2073233 ) ) ( not ( = ?auto_2073230 ?auto_2073234 ) ) ( not ( = ?auto_2073230 ?auto_2073235 ) ) ( not ( = ?auto_2073230 ?auto_2073236 ) ) ( not ( = ?auto_2073230 ?auto_2073237 ) ) ( not ( = ?auto_2073230 ?auto_2073238 ) ) ( not ( = ?auto_2073230 ?auto_2073239 ) ) ( not ( = ?auto_2073230 ?auto_2073240 ) ) ( not ( = ?auto_2073230 ?auto_2073244 ) ) ( not ( = ?auto_2073231 ?auto_2073232 ) ) ( not ( = ?auto_2073231 ?auto_2073233 ) ) ( not ( = ?auto_2073231 ?auto_2073234 ) ) ( not ( = ?auto_2073231 ?auto_2073235 ) ) ( not ( = ?auto_2073231 ?auto_2073236 ) ) ( not ( = ?auto_2073231 ?auto_2073237 ) ) ( not ( = ?auto_2073231 ?auto_2073238 ) ) ( not ( = ?auto_2073231 ?auto_2073239 ) ) ( not ( = ?auto_2073231 ?auto_2073240 ) ) ( not ( = ?auto_2073231 ?auto_2073244 ) ) ( not ( = ?auto_2073232 ?auto_2073233 ) ) ( not ( = ?auto_2073232 ?auto_2073234 ) ) ( not ( = ?auto_2073232 ?auto_2073235 ) ) ( not ( = ?auto_2073232 ?auto_2073236 ) ) ( not ( = ?auto_2073232 ?auto_2073237 ) ) ( not ( = ?auto_2073232 ?auto_2073238 ) ) ( not ( = ?auto_2073232 ?auto_2073239 ) ) ( not ( = ?auto_2073232 ?auto_2073240 ) ) ( not ( = ?auto_2073232 ?auto_2073244 ) ) ( not ( = ?auto_2073233 ?auto_2073234 ) ) ( not ( = ?auto_2073233 ?auto_2073235 ) ) ( not ( = ?auto_2073233 ?auto_2073236 ) ) ( not ( = ?auto_2073233 ?auto_2073237 ) ) ( not ( = ?auto_2073233 ?auto_2073238 ) ) ( not ( = ?auto_2073233 ?auto_2073239 ) ) ( not ( = ?auto_2073233 ?auto_2073240 ) ) ( not ( = ?auto_2073233 ?auto_2073244 ) ) ( not ( = ?auto_2073234 ?auto_2073235 ) ) ( not ( = ?auto_2073234 ?auto_2073236 ) ) ( not ( = ?auto_2073234 ?auto_2073237 ) ) ( not ( = ?auto_2073234 ?auto_2073238 ) ) ( not ( = ?auto_2073234 ?auto_2073239 ) ) ( not ( = ?auto_2073234 ?auto_2073240 ) ) ( not ( = ?auto_2073234 ?auto_2073244 ) ) ( not ( = ?auto_2073235 ?auto_2073236 ) ) ( not ( = ?auto_2073235 ?auto_2073237 ) ) ( not ( = ?auto_2073235 ?auto_2073238 ) ) ( not ( = ?auto_2073235 ?auto_2073239 ) ) ( not ( = ?auto_2073235 ?auto_2073240 ) ) ( not ( = ?auto_2073235 ?auto_2073244 ) ) ( not ( = ?auto_2073236 ?auto_2073237 ) ) ( not ( = ?auto_2073236 ?auto_2073238 ) ) ( not ( = ?auto_2073236 ?auto_2073239 ) ) ( not ( = ?auto_2073236 ?auto_2073240 ) ) ( not ( = ?auto_2073236 ?auto_2073244 ) ) ( not ( = ?auto_2073237 ?auto_2073238 ) ) ( not ( = ?auto_2073237 ?auto_2073239 ) ) ( not ( = ?auto_2073237 ?auto_2073240 ) ) ( not ( = ?auto_2073237 ?auto_2073244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073238 ?auto_2073239 ?auto_2073240 )
      ( MAKE-13CRATE-VERIFY ?auto_2073227 ?auto_2073228 ?auto_2073229 ?auto_2073230 ?auto_2073231 ?auto_2073232 ?auto_2073233 ?auto_2073234 ?auto_2073235 ?auto_2073236 ?auto_2073237 ?auto_2073238 ?auto_2073239 ?auto_2073240 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073410 - SURFACE
      ?auto_2073411 - SURFACE
      ?auto_2073412 - SURFACE
      ?auto_2073413 - SURFACE
      ?auto_2073414 - SURFACE
      ?auto_2073415 - SURFACE
      ?auto_2073416 - SURFACE
      ?auto_2073417 - SURFACE
      ?auto_2073418 - SURFACE
      ?auto_2073419 - SURFACE
      ?auto_2073420 - SURFACE
      ?auto_2073421 - SURFACE
      ?auto_2073422 - SURFACE
      ?auto_2073423 - SURFACE
    )
    :vars
    (
      ?auto_2073424 - HOIST
      ?auto_2073428 - PLACE
      ?auto_2073425 - PLACE
      ?auto_2073429 - HOIST
      ?auto_2073426 - SURFACE
      ?auto_2073427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073424 ?auto_2073428 ) ( IS-CRATE ?auto_2073423 ) ( not ( = ?auto_2073422 ?auto_2073423 ) ) ( not ( = ?auto_2073421 ?auto_2073422 ) ) ( not ( = ?auto_2073421 ?auto_2073423 ) ) ( not ( = ?auto_2073425 ?auto_2073428 ) ) ( HOIST-AT ?auto_2073429 ?auto_2073425 ) ( not ( = ?auto_2073424 ?auto_2073429 ) ) ( AVAILABLE ?auto_2073429 ) ( SURFACE-AT ?auto_2073423 ?auto_2073425 ) ( ON ?auto_2073423 ?auto_2073426 ) ( CLEAR ?auto_2073423 ) ( not ( = ?auto_2073422 ?auto_2073426 ) ) ( not ( = ?auto_2073423 ?auto_2073426 ) ) ( not ( = ?auto_2073421 ?auto_2073426 ) ) ( TRUCK-AT ?auto_2073427 ?auto_2073428 ) ( SURFACE-AT ?auto_2073421 ?auto_2073428 ) ( CLEAR ?auto_2073421 ) ( LIFTING ?auto_2073424 ?auto_2073422 ) ( IS-CRATE ?auto_2073422 ) ( ON ?auto_2073411 ?auto_2073410 ) ( ON ?auto_2073412 ?auto_2073411 ) ( ON ?auto_2073413 ?auto_2073412 ) ( ON ?auto_2073414 ?auto_2073413 ) ( ON ?auto_2073415 ?auto_2073414 ) ( ON ?auto_2073416 ?auto_2073415 ) ( ON ?auto_2073417 ?auto_2073416 ) ( ON ?auto_2073418 ?auto_2073417 ) ( ON ?auto_2073419 ?auto_2073418 ) ( ON ?auto_2073420 ?auto_2073419 ) ( ON ?auto_2073421 ?auto_2073420 ) ( not ( = ?auto_2073410 ?auto_2073411 ) ) ( not ( = ?auto_2073410 ?auto_2073412 ) ) ( not ( = ?auto_2073410 ?auto_2073413 ) ) ( not ( = ?auto_2073410 ?auto_2073414 ) ) ( not ( = ?auto_2073410 ?auto_2073415 ) ) ( not ( = ?auto_2073410 ?auto_2073416 ) ) ( not ( = ?auto_2073410 ?auto_2073417 ) ) ( not ( = ?auto_2073410 ?auto_2073418 ) ) ( not ( = ?auto_2073410 ?auto_2073419 ) ) ( not ( = ?auto_2073410 ?auto_2073420 ) ) ( not ( = ?auto_2073410 ?auto_2073421 ) ) ( not ( = ?auto_2073410 ?auto_2073422 ) ) ( not ( = ?auto_2073410 ?auto_2073423 ) ) ( not ( = ?auto_2073410 ?auto_2073426 ) ) ( not ( = ?auto_2073411 ?auto_2073412 ) ) ( not ( = ?auto_2073411 ?auto_2073413 ) ) ( not ( = ?auto_2073411 ?auto_2073414 ) ) ( not ( = ?auto_2073411 ?auto_2073415 ) ) ( not ( = ?auto_2073411 ?auto_2073416 ) ) ( not ( = ?auto_2073411 ?auto_2073417 ) ) ( not ( = ?auto_2073411 ?auto_2073418 ) ) ( not ( = ?auto_2073411 ?auto_2073419 ) ) ( not ( = ?auto_2073411 ?auto_2073420 ) ) ( not ( = ?auto_2073411 ?auto_2073421 ) ) ( not ( = ?auto_2073411 ?auto_2073422 ) ) ( not ( = ?auto_2073411 ?auto_2073423 ) ) ( not ( = ?auto_2073411 ?auto_2073426 ) ) ( not ( = ?auto_2073412 ?auto_2073413 ) ) ( not ( = ?auto_2073412 ?auto_2073414 ) ) ( not ( = ?auto_2073412 ?auto_2073415 ) ) ( not ( = ?auto_2073412 ?auto_2073416 ) ) ( not ( = ?auto_2073412 ?auto_2073417 ) ) ( not ( = ?auto_2073412 ?auto_2073418 ) ) ( not ( = ?auto_2073412 ?auto_2073419 ) ) ( not ( = ?auto_2073412 ?auto_2073420 ) ) ( not ( = ?auto_2073412 ?auto_2073421 ) ) ( not ( = ?auto_2073412 ?auto_2073422 ) ) ( not ( = ?auto_2073412 ?auto_2073423 ) ) ( not ( = ?auto_2073412 ?auto_2073426 ) ) ( not ( = ?auto_2073413 ?auto_2073414 ) ) ( not ( = ?auto_2073413 ?auto_2073415 ) ) ( not ( = ?auto_2073413 ?auto_2073416 ) ) ( not ( = ?auto_2073413 ?auto_2073417 ) ) ( not ( = ?auto_2073413 ?auto_2073418 ) ) ( not ( = ?auto_2073413 ?auto_2073419 ) ) ( not ( = ?auto_2073413 ?auto_2073420 ) ) ( not ( = ?auto_2073413 ?auto_2073421 ) ) ( not ( = ?auto_2073413 ?auto_2073422 ) ) ( not ( = ?auto_2073413 ?auto_2073423 ) ) ( not ( = ?auto_2073413 ?auto_2073426 ) ) ( not ( = ?auto_2073414 ?auto_2073415 ) ) ( not ( = ?auto_2073414 ?auto_2073416 ) ) ( not ( = ?auto_2073414 ?auto_2073417 ) ) ( not ( = ?auto_2073414 ?auto_2073418 ) ) ( not ( = ?auto_2073414 ?auto_2073419 ) ) ( not ( = ?auto_2073414 ?auto_2073420 ) ) ( not ( = ?auto_2073414 ?auto_2073421 ) ) ( not ( = ?auto_2073414 ?auto_2073422 ) ) ( not ( = ?auto_2073414 ?auto_2073423 ) ) ( not ( = ?auto_2073414 ?auto_2073426 ) ) ( not ( = ?auto_2073415 ?auto_2073416 ) ) ( not ( = ?auto_2073415 ?auto_2073417 ) ) ( not ( = ?auto_2073415 ?auto_2073418 ) ) ( not ( = ?auto_2073415 ?auto_2073419 ) ) ( not ( = ?auto_2073415 ?auto_2073420 ) ) ( not ( = ?auto_2073415 ?auto_2073421 ) ) ( not ( = ?auto_2073415 ?auto_2073422 ) ) ( not ( = ?auto_2073415 ?auto_2073423 ) ) ( not ( = ?auto_2073415 ?auto_2073426 ) ) ( not ( = ?auto_2073416 ?auto_2073417 ) ) ( not ( = ?auto_2073416 ?auto_2073418 ) ) ( not ( = ?auto_2073416 ?auto_2073419 ) ) ( not ( = ?auto_2073416 ?auto_2073420 ) ) ( not ( = ?auto_2073416 ?auto_2073421 ) ) ( not ( = ?auto_2073416 ?auto_2073422 ) ) ( not ( = ?auto_2073416 ?auto_2073423 ) ) ( not ( = ?auto_2073416 ?auto_2073426 ) ) ( not ( = ?auto_2073417 ?auto_2073418 ) ) ( not ( = ?auto_2073417 ?auto_2073419 ) ) ( not ( = ?auto_2073417 ?auto_2073420 ) ) ( not ( = ?auto_2073417 ?auto_2073421 ) ) ( not ( = ?auto_2073417 ?auto_2073422 ) ) ( not ( = ?auto_2073417 ?auto_2073423 ) ) ( not ( = ?auto_2073417 ?auto_2073426 ) ) ( not ( = ?auto_2073418 ?auto_2073419 ) ) ( not ( = ?auto_2073418 ?auto_2073420 ) ) ( not ( = ?auto_2073418 ?auto_2073421 ) ) ( not ( = ?auto_2073418 ?auto_2073422 ) ) ( not ( = ?auto_2073418 ?auto_2073423 ) ) ( not ( = ?auto_2073418 ?auto_2073426 ) ) ( not ( = ?auto_2073419 ?auto_2073420 ) ) ( not ( = ?auto_2073419 ?auto_2073421 ) ) ( not ( = ?auto_2073419 ?auto_2073422 ) ) ( not ( = ?auto_2073419 ?auto_2073423 ) ) ( not ( = ?auto_2073419 ?auto_2073426 ) ) ( not ( = ?auto_2073420 ?auto_2073421 ) ) ( not ( = ?auto_2073420 ?auto_2073422 ) ) ( not ( = ?auto_2073420 ?auto_2073423 ) ) ( not ( = ?auto_2073420 ?auto_2073426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073421 ?auto_2073422 ?auto_2073423 )
      ( MAKE-13CRATE-VERIFY ?auto_2073410 ?auto_2073411 ?auto_2073412 ?auto_2073413 ?auto_2073414 ?auto_2073415 ?auto_2073416 ?auto_2073417 ?auto_2073418 ?auto_2073419 ?auto_2073420 ?auto_2073421 ?auto_2073422 ?auto_2073423 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073593 - SURFACE
      ?auto_2073594 - SURFACE
      ?auto_2073595 - SURFACE
      ?auto_2073596 - SURFACE
      ?auto_2073597 - SURFACE
      ?auto_2073598 - SURFACE
      ?auto_2073599 - SURFACE
      ?auto_2073600 - SURFACE
      ?auto_2073601 - SURFACE
      ?auto_2073602 - SURFACE
      ?auto_2073603 - SURFACE
      ?auto_2073604 - SURFACE
      ?auto_2073605 - SURFACE
      ?auto_2073606 - SURFACE
    )
    :vars
    (
      ?auto_2073610 - HOIST
      ?auto_2073612 - PLACE
      ?auto_2073609 - PLACE
      ?auto_2073608 - HOIST
      ?auto_2073607 - SURFACE
      ?auto_2073611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073610 ?auto_2073612 ) ( IS-CRATE ?auto_2073606 ) ( not ( = ?auto_2073605 ?auto_2073606 ) ) ( not ( = ?auto_2073604 ?auto_2073605 ) ) ( not ( = ?auto_2073604 ?auto_2073606 ) ) ( not ( = ?auto_2073609 ?auto_2073612 ) ) ( HOIST-AT ?auto_2073608 ?auto_2073609 ) ( not ( = ?auto_2073610 ?auto_2073608 ) ) ( AVAILABLE ?auto_2073608 ) ( SURFACE-AT ?auto_2073606 ?auto_2073609 ) ( ON ?auto_2073606 ?auto_2073607 ) ( CLEAR ?auto_2073606 ) ( not ( = ?auto_2073605 ?auto_2073607 ) ) ( not ( = ?auto_2073606 ?auto_2073607 ) ) ( not ( = ?auto_2073604 ?auto_2073607 ) ) ( TRUCK-AT ?auto_2073611 ?auto_2073612 ) ( SURFACE-AT ?auto_2073604 ?auto_2073612 ) ( CLEAR ?auto_2073604 ) ( IS-CRATE ?auto_2073605 ) ( AVAILABLE ?auto_2073610 ) ( IN ?auto_2073605 ?auto_2073611 ) ( ON ?auto_2073594 ?auto_2073593 ) ( ON ?auto_2073595 ?auto_2073594 ) ( ON ?auto_2073596 ?auto_2073595 ) ( ON ?auto_2073597 ?auto_2073596 ) ( ON ?auto_2073598 ?auto_2073597 ) ( ON ?auto_2073599 ?auto_2073598 ) ( ON ?auto_2073600 ?auto_2073599 ) ( ON ?auto_2073601 ?auto_2073600 ) ( ON ?auto_2073602 ?auto_2073601 ) ( ON ?auto_2073603 ?auto_2073602 ) ( ON ?auto_2073604 ?auto_2073603 ) ( not ( = ?auto_2073593 ?auto_2073594 ) ) ( not ( = ?auto_2073593 ?auto_2073595 ) ) ( not ( = ?auto_2073593 ?auto_2073596 ) ) ( not ( = ?auto_2073593 ?auto_2073597 ) ) ( not ( = ?auto_2073593 ?auto_2073598 ) ) ( not ( = ?auto_2073593 ?auto_2073599 ) ) ( not ( = ?auto_2073593 ?auto_2073600 ) ) ( not ( = ?auto_2073593 ?auto_2073601 ) ) ( not ( = ?auto_2073593 ?auto_2073602 ) ) ( not ( = ?auto_2073593 ?auto_2073603 ) ) ( not ( = ?auto_2073593 ?auto_2073604 ) ) ( not ( = ?auto_2073593 ?auto_2073605 ) ) ( not ( = ?auto_2073593 ?auto_2073606 ) ) ( not ( = ?auto_2073593 ?auto_2073607 ) ) ( not ( = ?auto_2073594 ?auto_2073595 ) ) ( not ( = ?auto_2073594 ?auto_2073596 ) ) ( not ( = ?auto_2073594 ?auto_2073597 ) ) ( not ( = ?auto_2073594 ?auto_2073598 ) ) ( not ( = ?auto_2073594 ?auto_2073599 ) ) ( not ( = ?auto_2073594 ?auto_2073600 ) ) ( not ( = ?auto_2073594 ?auto_2073601 ) ) ( not ( = ?auto_2073594 ?auto_2073602 ) ) ( not ( = ?auto_2073594 ?auto_2073603 ) ) ( not ( = ?auto_2073594 ?auto_2073604 ) ) ( not ( = ?auto_2073594 ?auto_2073605 ) ) ( not ( = ?auto_2073594 ?auto_2073606 ) ) ( not ( = ?auto_2073594 ?auto_2073607 ) ) ( not ( = ?auto_2073595 ?auto_2073596 ) ) ( not ( = ?auto_2073595 ?auto_2073597 ) ) ( not ( = ?auto_2073595 ?auto_2073598 ) ) ( not ( = ?auto_2073595 ?auto_2073599 ) ) ( not ( = ?auto_2073595 ?auto_2073600 ) ) ( not ( = ?auto_2073595 ?auto_2073601 ) ) ( not ( = ?auto_2073595 ?auto_2073602 ) ) ( not ( = ?auto_2073595 ?auto_2073603 ) ) ( not ( = ?auto_2073595 ?auto_2073604 ) ) ( not ( = ?auto_2073595 ?auto_2073605 ) ) ( not ( = ?auto_2073595 ?auto_2073606 ) ) ( not ( = ?auto_2073595 ?auto_2073607 ) ) ( not ( = ?auto_2073596 ?auto_2073597 ) ) ( not ( = ?auto_2073596 ?auto_2073598 ) ) ( not ( = ?auto_2073596 ?auto_2073599 ) ) ( not ( = ?auto_2073596 ?auto_2073600 ) ) ( not ( = ?auto_2073596 ?auto_2073601 ) ) ( not ( = ?auto_2073596 ?auto_2073602 ) ) ( not ( = ?auto_2073596 ?auto_2073603 ) ) ( not ( = ?auto_2073596 ?auto_2073604 ) ) ( not ( = ?auto_2073596 ?auto_2073605 ) ) ( not ( = ?auto_2073596 ?auto_2073606 ) ) ( not ( = ?auto_2073596 ?auto_2073607 ) ) ( not ( = ?auto_2073597 ?auto_2073598 ) ) ( not ( = ?auto_2073597 ?auto_2073599 ) ) ( not ( = ?auto_2073597 ?auto_2073600 ) ) ( not ( = ?auto_2073597 ?auto_2073601 ) ) ( not ( = ?auto_2073597 ?auto_2073602 ) ) ( not ( = ?auto_2073597 ?auto_2073603 ) ) ( not ( = ?auto_2073597 ?auto_2073604 ) ) ( not ( = ?auto_2073597 ?auto_2073605 ) ) ( not ( = ?auto_2073597 ?auto_2073606 ) ) ( not ( = ?auto_2073597 ?auto_2073607 ) ) ( not ( = ?auto_2073598 ?auto_2073599 ) ) ( not ( = ?auto_2073598 ?auto_2073600 ) ) ( not ( = ?auto_2073598 ?auto_2073601 ) ) ( not ( = ?auto_2073598 ?auto_2073602 ) ) ( not ( = ?auto_2073598 ?auto_2073603 ) ) ( not ( = ?auto_2073598 ?auto_2073604 ) ) ( not ( = ?auto_2073598 ?auto_2073605 ) ) ( not ( = ?auto_2073598 ?auto_2073606 ) ) ( not ( = ?auto_2073598 ?auto_2073607 ) ) ( not ( = ?auto_2073599 ?auto_2073600 ) ) ( not ( = ?auto_2073599 ?auto_2073601 ) ) ( not ( = ?auto_2073599 ?auto_2073602 ) ) ( not ( = ?auto_2073599 ?auto_2073603 ) ) ( not ( = ?auto_2073599 ?auto_2073604 ) ) ( not ( = ?auto_2073599 ?auto_2073605 ) ) ( not ( = ?auto_2073599 ?auto_2073606 ) ) ( not ( = ?auto_2073599 ?auto_2073607 ) ) ( not ( = ?auto_2073600 ?auto_2073601 ) ) ( not ( = ?auto_2073600 ?auto_2073602 ) ) ( not ( = ?auto_2073600 ?auto_2073603 ) ) ( not ( = ?auto_2073600 ?auto_2073604 ) ) ( not ( = ?auto_2073600 ?auto_2073605 ) ) ( not ( = ?auto_2073600 ?auto_2073606 ) ) ( not ( = ?auto_2073600 ?auto_2073607 ) ) ( not ( = ?auto_2073601 ?auto_2073602 ) ) ( not ( = ?auto_2073601 ?auto_2073603 ) ) ( not ( = ?auto_2073601 ?auto_2073604 ) ) ( not ( = ?auto_2073601 ?auto_2073605 ) ) ( not ( = ?auto_2073601 ?auto_2073606 ) ) ( not ( = ?auto_2073601 ?auto_2073607 ) ) ( not ( = ?auto_2073602 ?auto_2073603 ) ) ( not ( = ?auto_2073602 ?auto_2073604 ) ) ( not ( = ?auto_2073602 ?auto_2073605 ) ) ( not ( = ?auto_2073602 ?auto_2073606 ) ) ( not ( = ?auto_2073602 ?auto_2073607 ) ) ( not ( = ?auto_2073603 ?auto_2073604 ) ) ( not ( = ?auto_2073603 ?auto_2073605 ) ) ( not ( = ?auto_2073603 ?auto_2073606 ) ) ( not ( = ?auto_2073603 ?auto_2073607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073604 ?auto_2073605 ?auto_2073606 )
      ( MAKE-13CRATE-VERIFY ?auto_2073593 ?auto_2073594 ?auto_2073595 ?auto_2073596 ?auto_2073597 ?auto_2073598 ?auto_2073599 ?auto_2073600 ?auto_2073601 ?auto_2073602 ?auto_2073603 ?auto_2073604 ?auto_2073605 ?auto_2073606 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087806 - SURFACE
      ?auto_2087807 - SURFACE
      ?auto_2087808 - SURFACE
      ?auto_2087809 - SURFACE
      ?auto_2087810 - SURFACE
      ?auto_2087811 - SURFACE
      ?auto_2087812 - SURFACE
      ?auto_2087813 - SURFACE
      ?auto_2087814 - SURFACE
      ?auto_2087815 - SURFACE
      ?auto_2087816 - SURFACE
      ?auto_2087817 - SURFACE
      ?auto_2087818 - SURFACE
      ?auto_2087819 - SURFACE
      ?auto_2087820 - SURFACE
    )
    :vars
    (
      ?auto_2087822 - HOIST
      ?auto_2087821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087822 ?auto_2087821 ) ( SURFACE-AT ?auto_2087819 ?auto_2087821 ) ( CLEAR ?auto_2087819 ) ( LIFTING ?auto_2087822 ?auto_2087820 ) ( IS-CRATE ?auto_2087820 ) ( not ( = ?auto_2087819 ?auto_2087820 ) ) ( ON ?auto_2087807 ?auto_2087806 ) ( ON ?auto_2087808 ?auto_2087807 ) ( ON ?auto_2087809 ?auto_2087808 ) ( ON ?auto_2087810 ?auto_2087809 ) ( ON ?auto_2087811 ?auto_2087810 ) ( ON ?auto_2087812 ?auto_2087811 ) ( ON ?auto_2087813 ?auto_2087812 ) ( ON ?auto_2087814 ?auto_2087813 ) ( ON ?auto_2087815 ?auto_2087814 ) ( ON ?auto_2087816 ?auto_2087815 ) ( ON ?auto_2087817 ?auto_2087816 ) ( ON ?auto_2087818 ?auto_2087817 ) ( ON ?auto_2087819 ?auto_2087818 ) ( not ( = ?auto_2087806 ?auto_2087807 ) ) ( not ( = ?auto_2087806 ?auto_2087808 ) ) ( not ( = ?auto_2087806 ?auto_2087809 ) ) ( not ( = ?auto_2087806 ?auto_2087810 ) ) ( not ( = ?auto_2087806 ?auto_2087811 ) ) ( not ( = ?auto_2087806 ?auto_2087812 ) ) ( not ( = ?auto_2087806 ?auto_2087813 ) ) ( not ( = ?auto_2087806 ?auto_2087814 ) ) ( not ( = ?auto_2087806 ?auto_2087815 ) ) ( not ( = ?auto_2087806 ?auto_2087816 ) ) ( not ( = ?auto_2087806 ?auto_2087817 ) ) ( not ( = ?auto_2087806 ?auto_2087818 ) ) ( not ( = ?auto_2087806 ?auto_2087819 ) ) ( not ( = ?auto_2087806 ?auto_2087820 ) ) ( not ( = ?auto_2087807 ?auto_2087808 ) ) ( not ( = ?auto_2087807 ?auto_2087809 ) ) ( not ( = ?auto_2087807 ?auto_2087810 ) ) ( not ( = ?auto_2087807 ?auto_2087811 ) ) ( not ( = ?auto_2087807 ?auto_2087812 ) ) ( not ( = ?auto_2087807 ?auto_2087813 ) ) ( not ( = ?auto_2087807 ?auto_2087814 ) ) ( not ( = ?auto_2087807 ?auto_2087815 ) ) ( not ( = ?auto_2087807 ?auto_2087816 ) ) ( not ( = ?auto_2087807 ?auto_2087817 ) ) ( not ( = ?auto_2087807 ?auto_2087818 ) ) ( not ( = ?auto_2087807 ?auto_2087819 ) ) ( not ( = ?auto_2087807 ?auto_2087820 ) ) ( not ( = ?auto_2087808 ?auto_2087809 ) ) ( not ( = ?auto_2087808 ?auto_2087810 ) ) ( not ( = ?auto_2087808 ?auto_2087811 ) ) ( not ( = ?auto_2087808 ?auto_2087812 ) ) ( not ( = ?auto_2087808 ?auto_2087813 ) ) ( not ( = ?auto_2087808 ?auto_2087814 ) ) ( not ( = ?auto_2087808 ?auto_2087815 ) ) ( not ( = ?auto_2087808 ?auto_2087816 ) ) ( not ( = ?auto_2087808 ?auto_2087817 ) ) ( not ( = ?auto_2087808 ?auto_2087818 ) ) ( not ( = ?auto_2087808 ?auto_2087819 ) ) ( not ( = ?auto_2087808 ?auto_2087820 ) ) ( not ( = ?auto_2087809 ?auto_2087810 ) ) ( not ( = ?auto_2087809 ?auto_2087811 ) ) ( not ( = ?auto_2087809 ?auto_2087812 ) ) ( not ( = ?auto_2087809 ?auto_2087813 ) ) ( not ( = ?auto_2087809 ?auto_2087814 ) ) ( not ( = ?auto_2087809 ?auto_2087815 ) ) ( not ( = ?auto_2087809 ?auto_2087816 ) ) ( not ( = ?auto_2087809 ?auto_2087817 ) ) ( not ( = ?auto_2087809 ?auto_2087818 ) ) ( not ( = ?auto_2087809 ?auto_2087819 ) ) ( not ( = ?auto_2087809 ?auto_2087820 ) ) ( not ( = ?auto_2087810 ?auto_2087811 ) ) ( not ( = ?auto_2087810 ?auto_2087812 ) ) ( not ( = ?auto_2087810 ?auto_2087813 ) ) ( not ( = ?auto_2087810 ?auto_2087814 ) ) ( not ( = ?auto_2087810 ?auto_2087815 ) ) ( not ( = ?auto_2087810 ?auto_2087816 ) ) ( not ( = ?auto_2087810 ?auto_2087817 ) ) ( not ( = ?auto_2087810 ?auto_2087818 ) ) ( not ( = ?auto_2087810 ?auto_2087819 ) ) ( not ( = ?auto_2087810 ?auto_2087820 ) ) ( not ( = ?auto_2087811 ?auto_2087812 ) ) ( not ( = ?auto_2087811 ?auto_2087813 ) ) ( not ( = ?auto_2087811 ?auto_2087814 ) ) ( not ( = ?auto_2087811 ?auto_2087815 ) ) ( not ( = ?auto_2087811 ?auto_2087816 ) ) ( not ( = ?auto_2087811 ?auto_2087817 ) ) ( not ( = ?auto_2087811 ?auto_2087818 ) ) ( not ( = ?auto_2087811 ?auto_2087819 ) ) ( not ( = ?auto_2087811 ?auto_2087820 ) ) ( not ( = ?auto_2087812 ?auto_2087813 ) ) ( not ( = ?auto_2087812 ?auto_2087814 ) ) ( not ( = ?auto_2087812 ?auto_2087815 ) ) ( not ( = ?auto_2087812 ?auto_2087816 ) ) ( not ( = ?auto_2087812 ?auto_2087817 ) ) ( not ( = ?auto_2087812 ?auto_2087818 ) ) ( not ( = ?auto_2087812 ?auto_2087819 ) ) ( not ( = ?auto_2087812 ?auto_2087820 ) ) ( not ( = ?auto_2087813 ?auto_2087814 ) ) ( not ( = ?auto_2087813 ?auto_2087815 ) ) ( not ( = ?auto_2087813 ?auto_2087816 ) ) ( not ( = ?auto_2087813 ?auto_2087817 ) ) ( not ( = ?auto_2087813 ?auto_2087818 ) ) ( not ( = ?auto_2087813 ?auto_2087819 ) ) ( not ( = ?auto_2087813 ?auto_2087820 ) ) ( not ( = ?auto_2087814 ?auto_2087815 ) ) ( not ( = ?auto_2087814 ?auto_2087816 ) ) ( not ( = ?auto_2087814 ?auto_2087817 ) ) ( not ( = ?auto_2087814 ?auto_2087818 ) ) ( not ( = ?auto_2087814 ?auto_2087819 ) ) ( not ( = ?auto_2087814 ?auto_2087820 ) ) ( not ( = ?auto_2087815 ?auto_2087816 ) ) ( not ( = ?auto_2087815 ?auto_2087817 ) ) ( not ( = ?auto_2087815 ?auto_2087818 ) ) ( not ( = ?auto_2087815 ?auto_2087819 ) ) ( not ( = ?auto_2087815 ?auto_2087820 ) ) ( not ( = ?auto_2087816 ?auto_2087817 ) ) ( not ( = ?auto_2087816 ?auto_2087818 ) ) ( not ( = ?auto_2087816 ?auto_2087819 ) ) ( not ( = ?auto_2087816 ?auto_2087820 ) ) ( not ( = ?auto_2087817 ?auto_2087818 ) ) ( not ( = ?auto_2087817 ?auto_2087819 ) ) ( not ( = ?auto_2087817 ?auto_2087820 ) ) ( not ( = ?auto_2087818 ?auto_2087819 ) ) ( not ( = ?auto_2087818 ?auto_2087820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2087819 ?auto_2087820 )
      ( MAKE-14CRATE-VERIFY ?auto_2087806 ?auto_2087807 ?auto_2087808 ?auto_2087809 ?auto_2087810 ?auto_2087811 ?auto_2087812 ?auto_2087813 ?auto_2087814 ?auto_2087815 ?auto_2087816 ?auto_2087817 ?auto_2087818 ?auto_2087819 ?auto_2087820 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2087966 - SURFACE
      ?auto_2087967 - SURFACE
      ?auto_2087968 - SURFACE
      ?auto_2087969 - SURFACE
      ?auto_2087970 - SURFACE
      ?auto_2087971 - SURFACE
      ?auto_2087972 - SURFACE
      ?auto_2087973 - SURFACE
      ?auto_2087974 - SURFACE
      ?auto_2087975 - SURFACE
      ?auto_2087976 - SURFACE
      ?auto_2087977 - SURFACE
      ?auto_2087978 - SURFACE
      ?auto_2087979 - SURFACE
      ?auto_2087980 - SURFACE
    )
    :vars
    (
      ?auto_2087982 - HOIST
      ?auto_2087981 - PLACE
      ?auto_2087983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087982 ?auto_2087981 ) ( SURFACE-AT ?auto_2087979 ?auto_2087981 ) ( CLEAR ?auto_2087979 ) ( IS-CRATE ?auto_2087980 ) ( not ( = ?auto_2087979 ?auto_2087980 ) ) ( TRUCK-AT ?auto_2087983 ?auto_2087981 ) ( AVAILABLE ?auto_2087982 ) ( IN ?auto_2087980 ?auto_2087983 ) ( ON ?auto_2087979 ?auto_2087978 ) ( not ( = ?auto_2087978 ?auto_2087979 ) ) ( not ( = ?auto_2087978 ?auto_2087980 ) ) ( ON ?auto_2087967 ?auto_2087966 ) ( ON ?auto_2087968 ?auto_2087967 ) ( ON ?auto_2087969 ?auto_2087968 ) ( ON ?auto_2087970 ?auto_2087969 ) ( ON ?auto_2087971 ?auto_2087970 ) ( ON ?auto_2087972 ?auto_2087971 ) ( ON ?auto_2087973 ?auto_2087972 ) ( ON ?auto_2087974 ?auto_2087973 ) ( ON ?auto_2087975 ?auto_2087974 ) ( ON ?auto_2087976 ?auto_2087975 ) ( ON ?auto_2087977 ?auto_2087976 ) ( ON ?auto_2087978 ?auto_2087977 ) ( not ( = ?auto_2087966 ?auto_2087967 ) ) ( not ( = ?auto_2087966 ?auto_2087968 ) ) ( not ( = ?auto_2087966 ?auto_2087969 ) ) ( not ( = ?auto_2087966 ?auto_2087970 ) ) ( not ( = ?auto_2087966 ?auto_2087971 ) ) ( not ( = ?auto_2087966 ?auto_2087972 ) ) ( not ( = ?auto_2087966 ?auto_2087973 ) ) ( not ( = ?auto_2087966 ?auto_2087974 ) ) ( not ( = ?auto_2087966 ?auto_2087975 ) ) ( not ( = ?auto_2087966 ?auto_2087976 ) ) ( not ( = ?auto_2087966 ?auto_2087977 ) ) ( not ( = ?auto_2087966 ?auto_2087978 ) ) ( not ( = ?auto_2087966 ?auto_2087979 ) ) ( not ( = ?auto_2087966 ?auto_2087980 ) ) ( not ( = ?auto_2087967 ?auto_2087968 ) ) ( not ( = ?auto_2087967 ?auto_2087969 ) ) ( not ( = ?auto_2087967 ?auto_2087970 ) ) ( not ( = ?auto_2087967 ?auto_2087971 ) ) ( not ( = ?auto_2087967 ?auto_2087972 ) ) ( not ( = ?auto_2087967 ?auto_2087973 ) ) ( not ( = ?auto_2087967 ?auto_2087974 ) ) ( not ( = ?auto_2087967 ?auto_2087975 ) ) ( not ( = ?auto_2087967 ?auto_2087976 ) ) ( not ( = ?auto_2087967 ?auto_2087977 ) ) ( not ( = ?auto_2087967 ?auto_2087978 ) ) ( not ( = ?auto_2087967 ?auto_2087979 ) ) ( not ( = ?auto_2087967 ?auto_2087980 ) ) ( not ( = ?auto_2087968 ?auto_2087969 ) ) ( not ( = ?auto_2087968 ?auto_2087970 ) ) ( not ( = ?auto_2087968 ?auto_2087971 ) ) ( not ( = ?auto_2087968 ?auto_2087972 ) ) ( not ( = ?auto_2087968 ?auto_2087973 ) ) ( not ( = ?auto_2087968 ?auto_2087974 ) ) ( not ( = ?auto_2087968 ?auto_2087975 ) ) ( not ( = ?auto_2087968 ?auto_2087976 ) ) ( not ( = ?auto_2087968 ?auto_2087977 ) ) ( not ( = ?auto_2087968 ?auto_2087978 ) ) ( not ( = ?auto_2087968 ?auto_2087979 ) ) ( not ( = ?auto_2087968 ?auto_2087980 ) ) ( not ( = ?auto_2087969 ?auto_2087970 ) ) ( not ( = ?auto_2087969 ?auto_2087971 ) ) ( not ( = ?auto_2087969 ?auto_2087972 ) ) ( not ( = ?auto_2087969 ?auto_2087973 ) ) ( not ( = ?auto_2087969 ?auto_2087974 ) ) ( not ( = ?auto_2087969 ?auto_2087975 ) ) ( not ( = ?auto_2087969 ?auto_2087976 ) ) ( not ( = ?auto_2087969 ?auto_2087977 ) ) ( not ( = ?auto_2087969 ?auto_2087978 ) ) ( not ( = ?auto_2087969 ?auto_2087979 ) ) ( not ( = ?auto_2087969 ?auto_2087980 ) ) ( not ( = ?auto_2087970 ?auto_2087971 ) ) ( not ( = ?auto_2087970 ?auto_2087972 ) ) ( not ( = ?auto_2087970 ?auto_2087973 ) ) ( not ( = ?auto_2087970 ?auto_2087974 ) ) ( not ( = ?auto_2087970 ?auto_2087975 ) ) ( not ( = ?auto_2087970 ?auto_2087976 ) ) ( not ( = ?auto_2087970 ?auto_2087977 ) ) ( not ( = ?auto_2087970 ?auto_2087978 ) ) ( not ( = ?auto_2087970 ?auto_2087979 ) ) ( not ( = ?auto_2087970 ?auto_2087980 ) ) ( not ( = ?auto_2087971 ?auto_2087972 ) ) ( not ( = ?auto_2087971 ?auto_2087973 ) ) ( not ( = ?auto_2087971 ?auto_2087974 ) ) ( not ( = ?auto_2087971 ?auto_2087975 ) ) ( not ( = ?auto_2087971 ?auto_2087976 ) ) ( not ( = ?auto_2087971 ?auto_2087977 ) ) ( not ( = ?auto_2087971 ?auto_2087978 ) ) ( not ( = ?auto_2087971 ?auto_2087979 ) ) ( not ( = ?auto_2087971 ?auto_2087980 ) ) ( not ( = ?auto_2087972 ?auto_2087973 ) ) ( not ( = ?auto_2087972 ?auto_2087974 ) ) ( not ( = ?auto_2087972 ?auto_2087975 ) ) ( not ( = ?auto_2087972 ?auto_2087976 ) ) ( not ( = ?auto_2087972 ?auto_2087977 ) ) ( not ( = ?auto_2087972 ?auto_2087978 ) ) ( not ( = ?auto_2087972 ?auto_2087979 ) ) ( not ( = ?auto_2087972 ?auto_2087980 ) ) ( not ( = ?auto_2087973 ?auto_2087974 ) ) ( not ( = ?auto_2087973 ?auto_2087975 ) ) ( not ( = ?auto_2087973 ?auto_2087976 ) ) ( not ( = ?auto_2087973 ?auto_2087977 ) ) ( not ( = ?auto_2087973 ?auto_2087978 ) ) ( not ( = ?auto_2087973 ?auto_2087979 ) ) ( not ( = ?auto_2087973 ?auto_2087980 ) ) ( not ( = ?auto_2087974 ?auto_2087975 ) ) ( not ( = ?auto_2087974 ?auto_2087976 ) ) ( not ( = ?auto_2087974 ?auto_2087977 ) ) ( not ( = ?auto_2087974 ?auto_2087978 ) ) ( not ( = ?auto_2087974 ?auto_2087979 ) ) ( not ( = ?auto_2087974 ?auto_2087980 ) ) ( not ( = ?auto_2087975 ?auto_2087976 ) ) ( not ( = ?auto_2087975 ?auto_2087977 ) ) ( not ( = ?auto_2087975 ?auto_2087978 ) ) ( not ( = ?auto_2087975 ?auto_2087979 ) ) ( not ( = ?auto_2087975 ?auto_2087980 ) ) ( not ( = ?auto_2087976 ?auto_2087977 ) ) ( not ( = ?auto_2087976 ?auto_2087978 ) ) ( not ( = ?auto_2087976 ?auto_2087979 ) ) ( not ( = ?auto_2087976 ?auto_2087980 ) ) ( not ( = ?auto_2087977 ?auto_2087978 ) ) ( not ( = ?auto_2087977 ?auto_2087979 ) ) ( not ( = ?auto_2087977 ?auto_2087980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2087978 ?auto_2087979 ?auto_2087980 )
      ( MAKE-14CRATE-VERIFY ?auto_2087966 ?auto_2087967 ?auto_2087968 ?auto_2087969 ?auto_2087970 ?auto_2087971 ?auto_2087972 ?auto_2087973 ?auto_2087974 ?auto_2087975 ?auto_2087976 ?auto_2087977 ?auto_2087978 ?auto_2087979 ?auto_2087980 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088141 - SURFACE
      ?auto_2088142 - SURFACE
      ?auto_2088143 - SURFACE
      ?auto_2088144 - SURFACE
      ?auto_2088145 - SURFACE
      ?auto_2088146 - SURFACE
      ?auto_2088147 - SURFACE
      ?auto_2088148 - SURFACE
      ?auto_2088149 - SURFACE
      ?auto_2088150 - SURFACE
      ?auto_2088151 - SURFACE
      ?auto_2088152 - SURFACE
      ?auto_2088153 - SURFACE
      ?auto_2088154 - SURFACE
      ?auto_2088155 - SURFACE
    )
    :vars
    (
      ?auto_2088156 - HOIST
      ?auto_2088159 - PLACE
      ?auto_2088157 - TRUCK
      ?auto_2088158 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088156 ?auto_2088159 ) ( SURFACE-AT ?auto_2088154 ?auto_2088159 ) ( CLEAR ?auto_2088154 ) ( IS-CRATE ?auto_2088155 ) ( not ( = ?auto_2088154 ?auto_2088155 ) ) ( AVAILABLE ?auto_2088156 ) ( IN ?auto_2088155 ?auto_2088157 ) ( ON ?auto_2088154 ?auto_2088153 ) ( not ( = ?auto_2088153 ?auto_2088154 ) ) ( not ( = ?auto_2088153 ?auto_2088155 ) ) ( TRUCK-AT ?auto_2088157 ?auto_2088158 ) ( not ( = ?auto_2088158 ?auto_2088159 ) ) ( ON ?auto_2088142 ?auto_2088141 ) ( ON ?auto_2088143 ?auto_2088142 ) ( ON ?auto_2088144 ?auto_2088143 ) ( ON ?auto_2088145 ?auto_2088144 ) ( ON ?auto_2088146 ?auto_2088145 ) ( ON ?auto_2088147 ?auto_2088146 ) ( ON ?auto_2088148 ?auto_2088147 ) ( ON ?auto_2088149 ?auto_2088148 ) ( ON ?auto_2088150 ?auto_2088149 ) ( ON ?auto_2088151 ?auto_2088150 ) ( ON ?auto_2088152 ?auto_2088151 ) ( ON ?auto_2088153 ?auto_2088152 ) ( not ( = ?auto_2088141 ?auto_2088142 ) ) ( not ( = ?auto_2088141 ?auto_2088143 ) ) ( not ( = ?auto_2088141 ?auto_2088144 ) ) ( not ( = ?auto_2088141 ?auto_2088145 ) ) ( not ( = ?auto_2088141 ?auto_2088146 ) ) ( not ( = ?auto_2088141 ?auto_2088147 ) ) ( not ( = ?auto_2088141 ?auto_2088148 ) ) ( not ( = ?auto_2088141 ?auto_2088149 ) ) ( not ( = ?auto_2088141 ?auto_2088150 ) ) ( not ( = ?auto_2088141 ?auto_2088151 ) ) ( not ( = ?auto_2088141 ?auto_2088152 ) ) ( not ( = ?auto_2088141 ?auto_2088153 ) ) ( not ( = ?auto_2088141 ?auto_2088154 ) ) ( not ( = ?auto_2088141 ?auto_2088155 ) ) ( not ( = ?auto_2088142 ?auto_2088143 ) ) ( not ( = ?auto_2088142 ?auto_2088144 ) ) ( not ( = ?auto_2088142 ?auto_2088145 ) ) ( not ( = ?auto_2088142 ?auto_2088146 ) ) ( not ( = ?auto_2088142 ?auto_2088147 ) ) ( not ( = ?auto_2088142 ?auto_2088148 ) ) ( not ( = ?auto_2088142 ?auto_2088149 ) ) ( not ( = ?auto_2088142 ?auto_2088150 ) ) ( not ( = ?auto_2088142 ?auto_2088151 ) ) ( not ( = ?auto_2088142 ?auto_2088152 ) ) ( not ( = ?auto_2088142 ?auto_2088153 ) ) ( not ( = ?auto_2088142 ?auto_2088154 ) ) ( not ( = ?auto_2088142 ?auto_2088155 ) ) ( not ( = ?auto_2088143 ?auto_2088144 ) ) ( not ( = ?auto_2088143 ?auto_2088145 ) ) ( not ( = ?auto_2088143 ?auto_2088146 ) ) ( not ( = ?auto_2088143 ?auto_2088147 ) ) ( not ( = ?auto_2088143 ?auto_2088148 ) ) ( not ( = ?auto_2088143 ?auto_2088149 ) ) ( not ( = ?auto_2088143 ?auto_2088150 ) ) ( not ( = ?auto_2088143 ?auto_2088151 ) ) ( not ( = ?auto_2088143 ?auto_2088152 ) ) ( not ( = ?auto_2088143 ?auto_2088153 ) ) ( not ( = ?auto_2088143 ?auto_2088154 ) ) ( not ( = ?auto_2088143 ?auto_2088155 ) ) ( not ( = ?auto_2088144 ?auto_2088145 ) ) ( not ( = ?auto_2088144 ?auto_2088146 ) ) ( not ( = ?auto_2088144 ?auto_2088147 ) ) ( not ( = ?auto_2088144 ?auto_2088148 ) ) ( not ( = ?auto_2088144 ?auto_2088149 ) ) ( not ( = ?auto_2088144 ?auto_2088150 ) ) ( not ( = ?auto_2088144 ?auto_2088151 ) ) ( not ( = ?auto_2088144 ?auto_2088152 ) ) ( not ( = ?auto_2088144 ?auto_2088153 ) ) ( not ( = ?auto_2088144 ?auto_2088154 ) ) ( not ( = ?auto_2088144 ?auto_2088155 ) ) ( not ( = ?auto_2088145 ?auto_2088146 ) ) ( not ( = ?auto_2088145 ?auto_2088147 ) ) ( not ( = ?auto_2088145 ?auto_2088148 ) ) ( not ( = ?auto_2088145 ?auto_2088149 ) ) ( not ( = ?auto_2088145 ?auto_2088150 ) ) ( not ( = ?auto_2088145 ?auto_2088151 ) ) ( not ( = ?auto_2088145 ?auto_2088152 ) ) ( not ( = ?auto_2088145 ?auto_2088153 ) ) ( not ( = ?auto_2088145 ?auto_2088154 ) ) ( not ( = ?auto_2088145 ?auto_2088155 ) ) ( not ( = ?auto_2088146 ?auto_2088147 ) ) ( not ( = ?auto_2088146 ?auto_2088148 ) ) ( not ( = ?auto_2088146 ?auto_2088149 ) ) ( not ( = ?auto_2088146 ?auto_2088150 ) ) ( not ( = ?auto_2088146 ?auto_2088151 ) ) ( not ( = ?auto_2088146 ?auto_2088152 ) ) ( not ( = ?auto_2088146 ?auto_2088153 ) ) ( not ( = ?auto_2088146 ?auto_2088154 ) ) ( not ( = ?auto_2088146 ?auto_2088155 ) ) ( not ( = ?auto_2088147 ?auto_2088148 ) ) ( not ( = ?auto_2088147 ?auto_2088149 ) ) ( not ( = ?auto_2088147 ?auto_2088150 ) ) ( not ( = ?auto_2088147 ?auto_2088151 ) ) ( not ( = ?auto_2088147 ?auto_2088152 ) ) ( not ( = ?auto_2088147 ?auto_2088153 ) ) ( not ( = ?auto_2088147 ?auto_2088154 ) ) ( not ( = ?auto_2088147 ?auto_2088155 ) ) ( not ( = ?auto_2088148 ?auto_2088149 ) ) ( not ( = ?auto_2088148 ?auto_2088150 ) ) ( not ( = ?auto_2088148 ?auto_2088151 ) ) ( not ( = ?auto_2088148 ?auto_2088152 ) ) ( not ( = ?auto_2088148 ?auto_2088153 ) ) ( not ( = ?auto_2088148 ?auto_2088154 ) ) ( not ( = ?auto_2088148 ?auto_2088155 ) ) ( not ( = ?auto_2088149 ?auto_2088150 ) ) ( not ( = ?auto_2088149 ?auto_2088151 ) ) ( not ( = ?auto_2088149 ?auto_2088152 ) ) ( not ( = ?auto_2088149 ?auto_2088153 ) ) ( not ( = ?auto_2088149 ?auto_2088154 ) ) ( not ( = ?auto_2088149 ?auto_2088155 ) ) ( not ( = ?auto_2088150 ?auto_2088151 ) ) ( not ( = ?auto_2088150 ?auto_2088152 ) ) ( not ( = ?auto_2088150 ?auto_2088153 ) ) ( not ( = ?auto_2088150 ?auto_2088154 ) ) ( not ( = ?auto_2088150 ?auto_2088155 ) ) ( not ( = ?auto_2088151 ?auto_2088152 ) ) ( not ( = ?auto_2088151 ?auto_2088153 ) ) ( not ( = ?auto_2088151 ?auto_2088154 ) ) ( not ( = ?auto_2088151 ?auto_2088155 ) ) ( not ( = ?auto_2088152 ?auto_2088153 ) ) ( not ( = ?auto_2088152 ?auto_2088154 ) ) ( not ( = ?auto_2088152 ?auto_2088155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088153 ?auto_2088154 ?auto_2088155 )
      ( MAKE-14CRATE-VERIFY ?auto_2088141 ?auto_2088142 ?auto_2088143 ?auto_2088144 ?auto_2088145 ?auto_2088146 ?auto_2088147 ?auto_2088148 ?auto_2088149 ?auto_2088150 ?auto_2088151 ?auto_2088152 ?auto_2088153 ?auto_2088154 ?auto_2088155 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088330 - SURFACE
      ?auto_2088331 - SURFACE
      ?auto_2088332 - SURFACE
      ?auto_2088333 - SURFACE
      ?auto_2088334 - SURFACE
      ?auto_2088335 - SURFACE
      ?auto_2088336 - SURFACE
      ?auto_2088337 - SURFACE
      ?auto_2088338 - SURFACE
      ?auto_2088339 - SURFACE
      ?auto_2088340 - SURFACE
      ?auto_2088341 - SURFACE
      ?auto_2088342 - SURFACE
      ?auto_2088343 - SURFACE
      ?auto_2088344 - SURFACE
    )
    :vars
    (
      ?auto_2088349 - HOIST
      ?auto_2088346 - PLACE
      ?auto_2088348 - TRUCK
      ?auto_2088345 - PLACE
      ?auto_2088347 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088349 ?auto_2088346 ) ( SURFACE-AT ?auto_2088343 ?auto_2088346 ) ( CLEAR ?auto_2088343 ) ( IS-CRATE ?auto_2088344 ) ( not ( = ?auto_2088343 ?auto_2088344 ) ) ( AVAILABLE ?auto_2088349 ) ( ON ?auto_2088343 ?auto_2088342 ) ( not ( = ?auto_2088342 ?auto_2088343 ) ) ( not ( = ?auto_2088342 ?auto_2088344 ) ) ( TRUCK-AT ?auto_2088348 ?auto_2088345 ) ( not ( = ?auto_2088345 ?auto_2088346 ) ) ( HOIST-AT ?auto_2088347 ?auto_2088345 ) ( LIFTING ?auto_2088347 ?auto_2088344 ) ( not ( = ?auto_2088349 ?auto_2088347 ) ) ( ON ?auto_2088331 ?auto_2088330 ) ( ON ?auto_2088332 ?auto_2088331 ) ( ON ?auto_2088333 ?auto_2088332 ) ( ON ?auto_2088334 ?auto_2088333 ) ( ON ?auto_2088335 ?auto_2088334 ) ( ON ?auto_2088336 ?auto_2088335 ) ( ON ?auto_2088337 ?auto_2088336 ) ( ON ?auto_2088338 ?auto_2088337 ) ( ON ?auto_2088339 ?auto_2088338 ) ( ON ?auto_2088340 ?auto_2088339 ) ( ON ?auto_2088341 ?auto_2088340 ) ( ON ?auto_2088342 ?auto_2088341 ) ( not ( = ?auto_2088330 ?auto_2088331 ) ) ( not ( = ?auto_2088330 ?auto_2088332 ) ) ( not ( = ?auto_2088330 ?auto_2088333 ) ) ( not ( = ?auto_2088330 ?auto_2088334 ) ) ( not ( = ?auto_2088330 ?auto_2088335 ) ) ( not ( = ?auto_2088330 ?auto_2088336 ) ) ( not ( = ?auto_2088330 ?auto_2088337 ) ) ( not ( = ?auto_2088330 ?auto_2088338 ) ) ( not ( = ?auto_2088330 ?auto_2088339 ) ) ( not ( = ?auto_2088330 ?auto_2088340 ) ) ( not ( = ?auto_2088330 ?auto_2088341 ) ) ( not ( = ?auto_2088330 ?auto_2088342 ) ) ( not ( = ?auto_2088330 ?auto_2088343 ) ) ( not ( = ?auto_2088330 ?auto_2088344 ) ) ( not ( = ?auto_2088331 ?auto_2088332 ) ) ( not ( = ?auto_2088331 ?auto_2088333 ) ) ( not ( = ?auto_2088331 ?auto_2088334 ) ) ( not ( = ?auto_2088331 ?auto_2088335 ) ) ( not ( = ?auto_2088331 ?auto_2088336 ) ) ( not ( = ?auto_2088331 ?auto_2088337 ) ) ( not ( = ?auto_2088331 ?auto_2088338 ) ) ( not ( = ?auto_2088331 ?auto_2088339 ) ) ( not ( = ?auto_2088331 ?auto_2088340 ) ) ( not ( = ?auto_2088331 ?auto_2088341 ) ) ( not ( = ?auto_2088331 ?auto_2088342 ) ) ( not ( = ?auto_2088331 ?auto_2088343 ) ) ( not ( = ?auto_2088331 ?auto_2088344 ) ) ( not ( = ?auto_2088332 ?auto_2088333 ) ) ( not ( = ?auto_2088332 ?auto_2088334 ) ) ( not ( = ?auto_2088332 ?auto_2088335 ) ) ( not ( = ?auto_2088332 ?auto_2088336 ) ) ( not ( = ?auto_2088332 ?auto_2088337 ) ) ( not ( = ?auto_2088332 ?auto_2088338 ) ) ( not ( = ?auto_2088332 ?auto_2088339 ) ) ( not ( = ?auto_2088332 ?auto_2088340 ) ) ( not ( = ?auto_2088332 ?auto_2088341 ) ) ( not ( = ?auto_2088332 ?auto_2088342 ) ) ( not ( = ?auto_2088332 ?auto_2088343 ) ) ( not ( = ?auto_2088332 ?auto_2088344 ) ) ( not ( = ?auto_2088333 ?auto_2088334 ) ) ( not ( = ?auto_2088333 ?auto_2088335 ) ) ( not ( = ?auto_2088333 ?auto_2088336 ) ) ( not ( = ?auto_2088333 ?auto_2088337 ) ) ( not ( = ?auto_2088333 ?auto_2088338 ) ) ( not ( = ?auto_2088333 ?auto_2088339 ) ) ( not ( = ?auto_2088333 ?auto_2088340 ) ) ( not ( = ?auto_2088333 ?auto_2088341 ) ) ( not ( = ?auto_2088333 ?auto_2088342 ) ) ( not ( = ?auto_2088333 ?auto_2088343 ) ) ( not ( = ?auto_2088333 ?auto_2088344 ) ) ( not ( = ?auto_2088334 ?auto_2088335 ) ) ( not ( = ?auto_2088334 ?auto_2088336 ) ) ( not ( = ?auto_2088334 ?auto_2088337 ) ) ( not ( = ?auto_2088334 ?auto_2088338 ) ) ( not ( = ?auto_2088334 ?auto_2088339 ) ) ( not ( = ?auto_2088334 ?auto_2088340 ) ) ( not ( = ?auto_2088334 ?auto_2088341 ) ) ( not ( = ?auto_2088334 ?auto_2088342 ) ) ( not ( = ?auto_2088334 ?auto_2088343 ) ) ( not ( = ?auto_2088334 ?auto_2088344 ) ) ( not ( = ?auto_2088335 ?auto_2088336 ) ) ( not ( = ?auto_2088335 ?auto_2088337 ) ) ( not ( = ?auto_2088335 ?auto_2088338 ) ) ( not ( = ?auto_2088335 ?auto_2088339 ) ) ( not ( = ?auto_2088335 ?auto_2088340 ) ) ( not ( = ?auto_2088335 ?auto_2088341 ) ) ( not ( = ?auto_2088335 ?auto_2088342 ) ) ( not ( = ?auto_2088335 ?auto_2088343 ) ) ( not ( = ?auto_2088335 ?auto_2088344 ) ) ( not ( = ?auto_2088336 ?auto_2088337 ) ) ( not ( = ?auto_2088336 ?auto_2088338 ) ) ( not ( = ?auto_2088336 ?auto_2088339 ) ) ( not ( = ?auto_2088336 ?auto_2088340 ) ) ( not ( = ?auto_2088336 ?auto_2088341 ) ) ( not ( = ?auto_2088336 ?auto_2088342 ) ) ( not ( = ?auto_2088336 ?auto_2088343 ) ) ( not ( = ?auto_2088336 ?auto_2088344 ) ) ( not ( = ?auto_2088337 ?auto_2088338 ) ) ( not ( = ?auto_2088337 ?auto_2088339 ) ) ( not ( = ?auto_2088337 ?auto_2088340 ) ) ( not ( = ?auto_2088337 ?auto_2088341 ) ) ( not ( = ?auto_2088337 ?auto_2088342 ) ) ( not ( = ?auto_2088337 ?auto_2088343 ) ) ( not ( = ?auto_2088337 ?auto_2088344 ) ) ( not ( = ?auto_2088338 ?auto_2088339 ) ) ( not ( = ?auto_2088338 ?auto_2088340 ) ) ( not ( = ?auto_2088338 ?auto_2088341 ) ) ( not ( = ?auto_2088338 ?auto_2088342 ) ) ( not ( = ?auto_2088338 ?auto_2088343 ) ) ( not ( = ?auto_2088338 ?auto_2088344 ) ) ( not ( = ?auto_2088339 ?auto_2088340 ) ) ( not ( = ?auto_2088339 ?auto_2088341 ) ) ( not ( = ?auto_2088339 ?auto_2088342 ) ) ( not ( = ?auto_2088339 ?auto_2088343 ) ) ( not ( = ?auto_2088339 ?auto_2088344 ) ) ( not ( = ?auto_2088340 ?auto_2088341 ) ) ( not ( = ?auto_2088340 ?auto_2088342 ) ) ( not ( = ?auto_2088340 ?auto_2088343 ) ) ( not ( = ?auto_2088340 ?auto_2088344 ) ) ( not ( = ?auto_2088341 ?auto_2088342 ) ) ( not ( = ?auto_2088341 ?auto_2088343 ) ) ( not ( = ?auto_2088341 ?auto_2088344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088342 ?auto_2088343 ?auto_2088344 )
      ( MAKE-14CRATE-VERIFY ?auto_2088330 ?auto_2088331 ?auto_2088332 ?auto_2088333 ?auto_2088334 ?auto_2088335 ?auto_2088336 ?auto_2088337 ?auto_2088338 ?auto_2088339 ?auto_2088340 ?auto_2088341 ?auto_2088342 ?auto_2088343 ?auto_2088344 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088533 - SURFACE
      ?auto_2088534 - SURFACE
      ?auto_2088535 - SURFACE
      ?auto_2088536 - SURFACE
      ?auto_2088537 - SURFACE
      ?auto_2088538 - SURFACE
      ?auto_2088539 - SURFACE
      ?auto_2088540 - SURFACE
      ?auto_2088541 - SURFACE
      ?auto_2088542 - SURFACE
      ?auto_2088543 - SURFACE
      ?auto_2088544 - SURFACE
      ?auto_2088545 - SURFACE
      ?auto_2088546 - SURFACE
      ?auto_2088547 - SURFACE
    )
    :vars
    (
      ?auto_2088552 - HOIST
      ?auto_2088550 - PLACE
      ?auto_2088549 - TRUCK
      ?auto_2088553 - PLACE
      ?auto_2088551 - HOIST
      ?auto_2088548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088552 ?auto_2088550 ) ( SURFACE-AT ?auto_2088546 ?auto_2088550 ) ( CLEAR ?auto_2088546 ) ( IS-CRATE ?auto_2088547 ) ( not ( = ?auto_2088546 ?auto_2088547 ) ) ( AVAILABLE ?auto_2088552 ) ( ON ?auto_2088546 ?auto_2088545 ) ( not ( = ?auto_2088545 ?auto_2088546 ) ) ( not ( = ?auto_2088545 ?auto_2088547 ) ) ( TRUCK-AT ?auto_2088549 ?auto_2088553 ) ( not ( = ?auto_2088553 ?auto_2088550 ) ) ( HOIST-AT ?auto_2088551 ?auto_2088553 ) ( not ( = ?auto_2088552 ?auto_2088551 ) ) ( AVAILABLE ?auto_2088551 ) ( SURFACE-AT ?auto_2088547 ?auto_2088553 ) ( ON ?auto_2088547 ?auto_2088548 ) ( CLEAR ?auto_2088547 ) ( not ( = ?auto_2088546 ?auto_2088548 ) ) ( not ( = ?auto_2088547 ?auto_2088548 ) ) ( not ( = ?auto_2088545 ?auto_2088548 ) ) ( ON ?auto_2088534 ?auto_2088533 ) ( ON ?auto_2088535 ?auto_2088534 ) ( ON ?auto_2088536 ?auto_2088535 ) ( ON ?auto_2088537 ?auto_2088536 ) ( ON ?auto_2088538 ?auto_2088537 ) ( ON ?auto_2088539 ?auto_2088538 ) ( ON ?auto_2088540 ?auto_2088539 ) ( ON ?auto_2088541 ?auto_2088540 ) ( ON ?auto_2088542 ?auto_2088541 ) ( ON ?auto_2088543 ?auto_2088542 ) ( ON ?auto_2088544 ?auto_2088543 ) ( ON ?auto_2088545 ?auto_2088544 ) ( not ( = ?auto_2088533 ?auto_2088534 ) ) ( not ( = ?auto_2088533 ?auto_2088535 ) ) ( not ( = ?auto_2088533 ?auto_2088536 ) ) ( not ( = ?auto_2088533 ?auto_2088537 ) ) ( not ( = ?auto_2088533 ?auto_2088538 ) ) ( not ( = ?auto_2088533 ?auto_2088539 ) ) ( not ( = ?auto_2088533 ?auto_2088540 ) ) ( not ( = ?auto_2088533 ?auto_2088541 ) ) ( not ( = ?auto_2088533 ?auto_2088542 ) ) ( not ( = ?auto_2088533 ?auto_2088543 ) ) ( not ( = ?auto_2088533 ?auto_2088544 ) ) ( not ( = ?auto_2088533 ?auto_2088545 ) ) ( not ( = ?auto_2088533 ?auto_2088546 ) ) ( not ( = ?auto_2088533 ?auto_2088547 ) ) ( not ( = ?auto_2088533 ?auto_2088548 ) ) ( not ( = ?auto_2088534 ?auto_2088535 ) ) ( not ( = ?auto_2088534 ?auto_2088536 ) ) ( not ( = ?auto_2088534 ?auto_2088537 ) ) ( not ( = ?auto_2088534 ?auto_2088538 ) ) ( not ( = ?auto_2088534 ?auto_2088539 ) ) ( not ( = ?auto_2088534 ?auto_2088540 ) ) ( not ( = ?auto_2088534 ?auto_2088541 ) ) ( not ( = ?auto_2088534 ?auto_2088542 ) ) ( not ( = ?auto_2088534 ?auto_2088543 ) ) ( not ( = ?auto_2088534 ?auto_2088544 ) ) ( not ( = ?auto_2088534 ?auto_2088545 ) ) ( not ( = ?auto_2088534 ?auto_2088546 ) ) ( not ( = ?auto_2088534 ?auto_2088547 ) ) ( not ( = ?auto_2088534 ?auto_2088548 ) ) ( not ( = ?auto_2088535 ?auto_2088536 ) ) ( not ( = ?auto_2088535 ?auto_2088537 ) ) ( not ( = ?auto_2088535 ?auto_2088538 ) ) ( not ( = ?auto_2088535 ?auto_2088539 ) ) ( not ( = ?auto_2088535 ?auto_2088540 ) ) ( not ( = ?auto_2088535 ?auto_2088541 ) ) ( not ( = ?auto_2088535 ?auto_2088542 ) ) ( not ( = ?auto_2088535 ?auto_2088543 ) ) ( not ( = ?auto_2088535 ?auto_2088544 ) ) ( not ( = ?auto_2088535 ?auto_2088545 ) ) ( not ( = ?auto_2088535 ?auto_2088546 ) ) ( not ( = ?auto_2088535 ?auto_2088547 ) ) ( not ( = ?auto_2088535 ?auto_2088548 ) ) ( not ( = ?auto_2088536 ?auto_2088537 ) ) ( not ( = ?auto_2088536 ?auto_2088538 ) ) ( not ( = ?auto_2088536 ?auto_2088539 ) ) ( not ( = ?auto_2088536 ?auto_2088540 ) ) ( not ( = ?auto_2088536 ?auto_2088541 ) ) ( not ( = ?auto_2088536 ?auto_2088542 ) ) ( not ( = ?auto_2088536 ?auto_2088543 ) ) ( not ( = ?auto_2088536 ?auto_2088544 ) ) ( not ( = ?auto_2088536 ?auto_2088545 ) ) ( not ( = ?auto_2088536 ?auto_2088546 ) ) ( not ( = ?auto_2088536 ?auto_2088547 ) ) ( not ( = ?auto_2088536 ?auto_2088548 ) ) ( not ( = ?auto_2088537 ?auto_2088538 ) ) ( not ( = ?auto_2088537 ?auto_2088539 ) ) ( not ( = ?auto_2088537 ?auto_2088540 ) ) ( not ( = ?auto_2088537 ?auto_2088541 ) ) ( not ( = ?auto_2088537 ?auto_2088542 ) ) ( not ( = ?auto_2088537 ?auto_2088543 ) ) ( not ( = ?auto_2088537 ?auto_2088544 ) ) ( not ( = ?auto_2088537 ?auto_2088545 ) ) ( not ( = ?auto_2088537 ?auto_2088546 ) ) ( not ( = ?auto_2088537 ?auto_2088547 ) ) ( not ( = ?auto_2088537 ?auto_2088548 ) ) ( not ( = ?auto_2088538 ?auto_2088539 ) ) ( not ( = ?auto_2088538 ?auto_2088540 ) ) ( not ( = ?auto_2088538 ?auto_2088541 ) ) ( not ( = ?auto_2088538 ?auto_2088542 ) ) ( not ( = ?auto_2088538 ?auto_2088543 ) ) ( not ( = ?auto_2088538 ?auto_2088544 ) ) ( not ( = ?auto_2088538 ?auto_2088545 ) ) ( not ( = ?auto_2088538 ?auto_2088546 ) ) ( not ( = ?auto_2088538 ?auto_2088547 ) ) ( not ( = ?auto_2088538 ?auto_2088548 ) ) ( not ( = ?auto_2088539 ?auto_2088540 ) ) ( not ( = ?auto_2088539 ?auto_2088541 ) ) ( not ( = ?auto_2088539 ?auto_2088542 ) ) ( not ( = ?auto_2088539 ?auto_2088543 ) ) ( not ( = ?auto_2088539 ?auto_2088544 ) ) ( not ( = ?auto_2088539 ?auto_2088545 ) ) ( not ( = ?auto_2088539 ?auto_2088546 ) ) ( not ( = ?auto_2088539 ?auto_2088547 ) ) ( not ( = ?auto_2088539 ?auto_2088548 ) ) ( not ( = ?auto_2088540 ?auto_2088541 ) ) ( not ( = ?auto_2088540 ?auto_2088542 ) ) ( not ( = ?auto_2088540 ?auto_2088543 ) ) ( not ( = ?auto_2088540 ?auto_2088544 ) ) ( not ( = ?auto_2088540 ?auto_2088545 ) ) ( not ( = ?auto_2088540 ?auto_2088546 ) ) ( not ( = ?auto_2088540 ?auto_2088547 ) ) ( not ( = ?auto_2088540 ?auto_2088548 ) ) ( not ( = ?auto_2088541 ?auto_2088542 ) ) ( not ( = ?auto_2088541 ?auto_2088543 ) ) ( not ( = ?auto_2088541 ?auto_2088544 ) ) ( not ( = ?auto_2088541 ?auto_2088545 ) ) ( not ( = ?auto_2088541 ?auto_2088546 ) ) ( not ( = ?auto_2088541 ?auto_2088547 ) ) ( not ( = ?auto_2088541 ?auto_2088548 ) ) ( not ( = ?auto_2088542 ?auto_2088543 ) ) ( not ( = ?auto_2088542 ?auto_2088544 ) ) ( not ( = ?auto_2088542 ?auto_2088545 ) ) ( not ( = ?auto_2088542 ?auto_2088546 ) ) ( not ( = ?auto_2088542 ?auto_2088547 ) ) ( not ( = ?auto_2088542 ?auto_2088548 ) ) ( not ( = ?auto_2088543 ?auto_2088544 ) ) ( not ( = ?auto_2088543 ?auto_2088545 ) ) ( not ( = ?auto_2088543 ?auto_2088546 ) ) ( not ( = ?auto_2088543 ?auto_2088547 ) ) ( not ( = ?auto_2088543 ?auto_2088548 ) ) ( not ( = ?auto_2088544 ?auto_2088545 ) ) ( not ( = ?auto_2088544 ?auto_2088546 ) ) ( not ( = ?auto_2088544 ?auto_2088547 ) ) ( not ( = ?auto_2088544 ?auto_2088548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088545 ?auto_2088546 ?auto_2088547 )
      ( MAKE-14CRATE-VERIFY ?auto_2088533 ?auto_2088534 ?auto_2088535 ?auto_2088536 ?auto_2088537 ?auto_2088538 ?auto_2088539 ?auto_2088540 ?auto_2088541 ?auto_2088542 ?auto_2088543 ?auto_2088544 ?auto_2088545 ?auto_2088546 ?auto_2088547 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088737 - SURFACE
      ?auto_2088738 - SURFACE
      ?auto_2088739 - SURFACE
      ?auto_2088740 - SURFACE
      ?auto_2088741 - SURFACE
      ?auto_2088742 - SURFACE
      ?auto_2088743 - SURFACE
      ?auto_2088744 - SURFACE
      ?auto_2088745 - SURFACE
      ?auto_2088746 - SURFACE
      ?auto_2088747 - SURFACE
      ?auto_2088748 - SURFACE
      ?auto_2088749 - SURFACE
      ?auto_2088750 - SURFACE
      ?auto_2088751 - SURFACE
    )
    :vars
    (
      ?auto_2088754 - HOIST
      ?auto_2088755 - PLACE
      ?auto_2088752 - PLACE
      ?auto_2088757 - HOIST
      ?auto_2088753 - SURFACE
      ?auto_2088756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088754 ?auto_2088755 ) ( SURFACE-AT ?auto_2088750 ?auto_2088755 ) ( CLEAR ?auto_2088750 ) ( IS-CRATE ?auto_2088751 ) ( not ( = ?auto_2088750 ?auto_2088751 ) ) ( AVAILABLE ?auto_2088754 ) ( ON ?auto_2088750 ?auto_2088749 ) ( not ( = ?auto_2088749 ?auto_2088750 ) ) ( not ( = ?auto_2088749 ?auto_2088751 ) ) ( not ( = ?auto_2088752 ?auto_2088755 ) ) ( HOIST-AT ?auto_2088757 ?auto_2088752 ) ( not ( = ?auto_2088754 ?auto_2088757 ) ) ( AVAILABLE ?auto_2088757 ) ( SURFACE-AT ?auto_2088751 ?auto_2088752 ) ( ON ?auto_2088751 ?auto_2088753 ) ( CLEAR ?auto_2088751 ) ( not ( = ?auto_2088750 ?auto_2088753 ) ) ( not ( = ?auto_2088751 ?auto_2088753 ) ) ( not ( = ?auto_2088749 ?auto_2088753 ) ) ( TRUCK-AT ?auto_2088756 ?auto_2088755 ) ( ON ?auto_2088738 ?auto_2088737 ) ( ON ?auto_2088739 ?auto_2088738 ) ( ON ?auto_2088740 ?auto_2088739 ) ( ON ?auto_2088741 ?auto_2088740 ) ( ON ?auto_2088742 ?auto_2088741 ) ( ON ?auto_2088743 ?auto_2088742 ) ( ON ?auto_2088744 ?auto_2088743 ) ( ON ?auto_2088745 ?auto_2088744 ) ( ON ?auto_2088746 ?auto_2088745 ) ( ON ?auto_2088747 ?auto_2088746 ) ( ON ?auto_2088748 ?auto_2088747 ) ( ON ?auto_2088749 ?auto_2088748 ) ( not ( = ?auto_2088737 ?auto_2088738 ) ) ( not ( = ?auto_2088737 ?auto_2088739 ) ) ( not ( = ?auto_2088737 ?auto_2088740 ) ) ( not ( = ?auto_2088737 ?auto_2088741 ) ) ( not ( = ?auto_2088737 ?auto_2088742 ) ) ( not ( = ?auto_2088737 ?auto_2088743 ) ) ( not ( = ?auto_2088737 ?auto_2088744 ) ) ( not ( = ?auto_2088737 ?auto_2088745 ) ) ( not ( = ?auto_2088737 ?auto_2088746 ) ) ( not ( = ?auto_2088737 ?auto_2088747 ) ) ( not ( = ?auto_2088737 ?auto_2088748 ) ) ( not ( = ?auto_2088737 ?auto_2088749 ) ) ( not ( = ?auto_2088737 ?auto_2088750 ) ) ( not ( = ?auto_2088737 ?auto_2088751 ) ) ( not ( = ?auto_2088737 ?auto_2088753 ) ) ( not ( = ?auto_2088738 ?auto_2088739 ) ) ( not ( = ?auto_2088738 ?auto_2088740 ) ) ( not ( = ?auto_2088738 ?auto_2088741 ) ) ( not ( = ?auto_2088738 ?auto_2088742 ) ) ( not ( = ?auto_2088738 ?auto_2088743 ) ) ( not ( = ?auto_2088738 ?auto_2088744 ) ) ( not ( = ?auto_2088738 ?auto_2088745 ) ) ( not ( = ?auto_2088738 ?auto_2088746 ) ) ( not ( = ?auto_2088738 ?auto_2088747 ) ) ( not ( = ?auto_2088738 ?auto_2088748 ) ) ( not ( = ?auto_2088738 ?auto_2088749 ) ) ( not ( = ?auto_2088738 ?auto_2088750 ) ) ( not ( = ?auto_2088738 ?auto_2088751 ) ) ( not ( = ?auto_2088738 ?auto_2088753 ) ) ( not ( = ?auto_2088739 ?auto_2088740 ) ) ( not ( = ?auto_2088739 ?auto_2088741 ) ) ( not ( = ?auto_2088739 ?auto_2088742 ) ) ( not ( = ?auto_2088739 ?auto_2088743 ) ) ( not ( = ?auto_2088739 ?auto_2088744 ) ) ( not ( = ?auto_2088739 ?auto_2088745 ) ) ( not ( = ?auto_2088739 ?auto_2088746 ) ) ( not ( = ?auto_2088739 ?auto_2088747 ) ) ( not ( = ?auto_2088739 ?auto_2088748 ) ) ( not ( = ?auto_2088739 ?auto_2088749 ) ) ( not ( = ?auto_2088739 ?auto_2088750 ) ) ( not ( = ?auto_2088739 ?auto_2088751 ) ) ( not ( = ?auto_2088739 ?auto_2088753 ) ) ( not ( = ?auto_2088740 ?auto_2088741 ) ) ( not ( = ?auto_2088740 ?auto_2088742 ) ) ( not ( = ?auto_2088740 ?auto_2088743 ) ) ( not ( = ?auto_2088740 ?auto_2088744 ) ) ( not ( = ?auto_2088740 ?auto_2088745 ) ) ( not ( = ?auto_2088740 ?auto_2088746 ) ) ( not ( = ?auto_2088740 ?auto_2088747 ) ) ( not ( = ?auto_2088740 ?auto_2088748 ) ) ( not ( = ?auto_2088740 ?auto_2088749 ) ) ( not ( = ?auto_2088740 ?auto_2088750 ) ) ( not ( = ?auto_2088740 ?auto_2088751 ) ) ( not ( = ?auto_2088740 ?auto_2088753 ) ) ( not ( = ?auto_2088741 ?auto_2088742 ) ) ( not ( = ?auto_2088741 ?auto_2088743 ) ) ( not ( = ?auto_2088741 ?auto_2088744 ) ) ( not ( = ?auto_2088741 ?auto_2088745 ) ) ( not ( = ?auto_2088741 ?auto_2088746 ) ) ( not ( = ?auto_2088741 ?auto_2088747 ) ) ( not ( = ?auto_2088741 ?auto_2088748 ) ) ( not ( = ?auto_2088741 ?auto_2088749 ) ) ( not ( = ?auto_2088741 ?auto_2088750 ) ) ( not ( = ?auto_2088741 ?auto_2088751 ) ) ( not ( = ?auto_2088741 ?auto_2088753 ) ) ( not ( = ?auto_2088742 ?auto_2088743 ) ) ( not ( = ?auto_2088742 ?auto_2088744 ) ) ( not ( = ?auto_2088742 ?auto_2088745 ) ) ( not ( = ?auto_2088742 ?auto_2088746 ) ) ( not ( = ?auto_2088742 ?auto_2088747 ) ) ( not ( = ?auto_2088742 ?auto_2088748 ) ) ( not ( = ?auto_2088742 ?auto_2088749 ) ) ( not ( = ?auto_2088742 ?auto_2088750 ) ) ( not ( = ?auto_2088742 ?auto_2088751 ) ) ( not ( = ?auto_2088742 ?auto_2088753 ) ) ( not ( = ?auto_2088743 ?auto_2088744 ) ) ( not ( = ?auto_2088743 ?auto_2088745 ) ) ( not ( = ?auto_2088743 ?auto_2088746 ) ) ( not ( = ?auto_2088743 ?auto_2088747 ) ) ( not ( = ?auto_2088743 ?auto_2088748 ) ) ( not ( = ?auto_2088743 ?auto_2088749 ) ) ( not ( = ?auto_2088743 ?auto_2088750 ) ) ( not ( = ?auto_2088743 ?auto_2088751 ) ) ( not ( = ?auto_2088743 ?auto_2088753 ) ) ( not ( = ?auto_2088744 ?auto_2088745 ) ) ( not ( = ?auto_2088744 ?auto_2088746 ) ) ( not ( = ?auto_2088744 ?auto_2088747 ) ) ( not ( = ?auto_2088744 ?auto_2088748 ) ) ( not ( = ?auto_2088744 ?auto_2088749 ) ) ( not ( = ?auto_2088744 ?auto_2088750 ) ) ( not ( = ?auto_2088744 ?auto_2088751 ) ) ( not ( = ?auto_2088744 ?auto_2088753 ) ) ( not ( = ?auto_2088745 ?auto_2088746 ) ) ( not ( = ?auto_2088745 ?auto_2088747 ) ) ( not ( = ?auto_2088745 ?auto_2088748 ) ) ( not ( = ?auto_2088745 ?auto_2088749 ) ) ( not ( = ?auto_2088745 ?auto_2088750 ) ) ( not ( = ?auto_2088745 ?auto_2088751 ) ) ( not ( = ?auto_2088745 ?auto_2088753 ) ) ( not ( = ?auto_2088746 ?auto_2088747 ) ) ( not ( = ?auto_2088746 ?auto_2088748 ) ) ( not ( = ?auto_2088746 ?auto_2088749 ) ) ( not ( = ?auto_2088746 ?auto_2088750 ) ) ( not ( = ?auto_2088746 ?auto_2088751 ) ) ( not ( = ?auto_2088746 ?auto_2088753 ) ) ( not ( = ?auto_2088747 ?auto_2088748 ) ) ( not ( = ?auto_2088747 ?auto_2088749 ) ) ( not ( = ?auto_2088747 ?auto_2088750 ) ) ( not ( = ?auto_2088747 ?auto_2088751 ) ) ( not ( = ?auto_2088747 ?auto_2088753 ) ) ( not ( = ?auto_2088748 ?auto_2088749 ) ) ( not ( = ?auto_2088748 ?auto_2088750 ) ) ( not ( = ?auto_2088748 ?auto_2088751 ) ) ( not ( = ?auto_2088748 ?auto_2088753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088749 ?auto_2088750 ?auto_2088751 )
      ( MAKE-14CRATE-VERIFY ?auto_2088737 ?auto_2088738 ?auto_2088739 ?auto_2088740 ?auto_2088741 ?auto_2088742 ?auto_2088743 ?auto_2088744 ?auto_2088745 ?auto_2088746 ?auto_2088747 ?auto_2088748 ?auto_2088749 ?auto_2088750 ?auto_2088751 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088941 - SURFACE
      ?auto_2088942 - SURFACE
      ?auto_2088943 - SURFACE
      ?auto_2088944 - SURFACE
      ?auto_2088945 - SURFACE
      ?auto_2088946 - SURFACE
      ?auto_2088947 - SURFACE
      ?auto_2088948 - SURFACE
      ?auto_2088949 - SURFACE
      ?auto_2088950 - SURFACE
      ?auto_2088951 - SURFACE
      ?auto_2088952 - SURFACE
      ?auto_2088953 - SURFACE
      ?auto_2088954 - SURFACE
      ?auto_2088955 - SURFACE
    )
    :vars
    (
      ?auto_2088959 - HOIST
      ?auto_2088960 - PLACE
      ?auto_2088956 - PLACE
      ?auto_2088958 - HOIST
      ?auto_2088957 - SURFACE
      ?auto_2088961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088959 ?auto_2088960 ) ( IS-CRATE ?auto_2088955 ) ( not ( = ?auto_2088954 ?auto_2088955 ) ) ( not ( = ?auto_2088953 ?auto_2088954 ) ) ( not ( = ?auto_2088953 ?auto_2088955 ) ) ( not ( = ?auto_2088956 ?auto_2088960 ) ) ( HOIST-AT ?auto_2088958 ?auto_2088956 ) ( not ( = ?auto_2088959 ?auto_2088958 ) ) ( AVAILABLE ?auto_2088958 ) ( SURFACE-AT ?auto_2088955 ?auto_2088956 ) ( ON ?auto_2088955 ?auto_2088957 ) ( CLEAR ?auto_2088955 ) ( not ( = ?auto_2088954 ?auto_2088957 ) ) ( not ( = ?auto_2088955 ?auto_2088957 ) ) ( not ( = ?auto_2088953 ?auto_2088957 ) ) ( TRUCK-AT ?auto_2088961 ?auto_2088960 ) ( SURFACE-AT ?auto_2088953 ?auto_2088960 ) ( CLEAR ?auto_2088953 ) ( LIFTING ?auto_2088959 ?auto_2088954 ) ( IS-CRATE ?auto_2088954 ) ( ON ?auto_2088942 ?auto_2088941 ) ( ON ?auto_2088943 ?auto_2088942 ) ( ON ?auto_2088944 ?auto_2088943 ) ( ON ?auto_2088945 ?auto_2088944 ) ( ON ?auto_2088946 ?auto_2088945 ) ( ON ?auto_2088947 ?auto_2088946 ) ( ON ?auto_2088948 ?auto_2088947 ) ( ON ?auto_2088949 ?auto_2088948 ) ( ON ?auto_2088950 ?auto_2088949 ) ( ON ?auto_2088951 ?auto_2088950 ) ( ON ?auto_2088952 ?auto_2088951 ) ( ON ?auto_2088953 ?auto_2088952 ) ( not ( = ?auto_2088941 ?auto_2088942 ) ) ( not ( = ?auto_2088941 ?auto_2088943 ) ) ( not ( = ?auto_2088941 ?auto_2088944 ) ) ( not ( = ?auto_2088941 ?auto_2088945 ) ) ( not ( = ?auto_2088941 ?auto_2088946 ) ) ( not ( = ?auto_2088941 ?auto_2088947 ) ) ( not ( = ?auto_2088941 ?auto_2088948 ) ) ( not ( = ?auto_2088941 ?auto_2088949 ) ) ( not ( = ?auto_2088941 ?auto_2088950 ) ) ( not ( = ?auto_2088941 ?auto_2088951 ) ) ( not ( = ?auto_2088941 ?auto_2088952 ) ) ( not ( = ?auto_2088941 ?auto_2088953 ) ) ( not ( = ?auto_2088941 ?auto_2088954 ) ) ( not ( = ?auto_2088941 ?auto_2088955 ) ) ( not ( = ?auto_2088941 ?auto_2088957 ) ) ( not ( = ?auto_2088942 ?auto_2088943 ) ) ( not ( = ?auto_2088942 ?auto_2088944 ) ) ( not ( = ?auto_2088942 ?auto_2088945 ) ) ( not ( = ?auto_2088942 ?auto_2088946 ) ) ( not ( = ?auto_2088942 ?auto_2088947 ) ) ( not ( = ?auto_2088942 ?auto_2088948 ) ) ( not ( = ?auto_2088942 ?auto_2088949 ) ) ( not ( = ?auto_2088942 ?auto_2088950 ) ) ( not ( = ?auto_2088942 ?auto_2088951 ) ) ( not ( = ?auto_2088942 ?auto_2088952 ) ) ( not ( = ?auto_2088942 ?auto_2088953 ) ) ( not ( = ?auto_2088942 ?auto_2088954 ) ) ( not ( = ?auto_2088942 ?auto_2088955 ) ) ( not ( = ?auto_2088942 ?auto_2088957 ) ) ( not ( = ?auto_2088943 ?auto_2088944 ) ) ( not ( = ?auto_2088943 ?auto_2088945 ) ) ( not ( = ?auto_2088943 ?auto_2088946 ) ) ( not ( = ?auto_2088943 ?auto_2088947 ) ) ( not ( = ?auto_2088943 ?auto_2088948 ) ) ( not ( = ?auto_2088943 ?auto_2088949 ) ) ( not ( = ?auto_2088943 ?auto_2088950 ) ) ( not ( = ?auto_2088943 ?auto_2088951 ) ) ( not ( = ?auto_2088943 ?auto_2088952 ) ) ( not ( = ?auto_2088943 ?auto_2088953 ) ) ( not ( = ?auto_2088943 ?auto_2088954 ) ) ( not ( = ?auto_2088943 ?auto_2088955 ) ) ( not ( = ?auto_2088943 ?auto_2088957 ) ) ( not ( = ?auto_2088944 ?auto_2088945 ) ) ( not ( = ?auto_2088944 ?auto_2088946 ) ) ( not ( = ?auto_2088944 ?auto_2088947 ) ) ( not ( = ?auto_2088944 ?auto_2088948 ) ) ( not ( = ?auto_2088944 ?auto_2088949 ) ) ( not ( = ?auto_2088944 ?auto_2088950 ) ) ( not ( = ?auto_2088944 ?auto_2088951 ) ) ( not ( = ?auto_2088944 ?auto_2088952 ) ) ( not ( = ?auto_2088944 ?auto_2088953 ) ) ( not ( = ?auto_2088944 ?auto_2088954 ) ) ( not ( = ?auto_2088944 ?auto_2088955 ) ) ( not ( = ?auto_2088944 ?auto_2088957 ) ) ( not ( = ?auto_2088945 ?auto_2088946 ) ) ( not ( = ?auto_2088945 ?auto_2088947 ) ) ( not ( = ?auto_2088945 ?auto_2088948 ) ) ( not ( = ?auto_2088945 ?auto_2088949 ) ) ( not ( = ?auto_2088945 ?auto_2088950 ) ) ( not ( = ?auto_2088945 ?auto_2088951 ) ) ( not ( = ?auto_2088945 ?auto_2088952 ) ) ( not ( = ?auto_2088945 ?auto_2088953 ) ) ( not ( = ?auto_2088945 ?auto_2088954 ) ) ( not ( = ?auto_2088945 ?auto_2088955 ) ) ( not ( = ?auto_2088945 ?auto_2088957 ) ) ( not ( = ?auto_2088946 ?auto_2088947 ) ) ( not ( = ?auto_2088946 ?auto_2088948 ) ) ( not ( = ?auto_2088946 ?auto_2088949 ) ) ( not ( = ?auto_2088946 ?auto_2088950 ) ) ( not ( = ?auto_2088946 ?auto_2088951 ) ) ( not ( = ?auto_2088946 ?auto_2088952 ) ) ( not ( = ?auto_2088946 ?auto_2088953 ) ) ( not ( = ?auto_2088946 ?auto_2088954 ) ) ( not ( = ?auto_2088946 ?auto_2088955 ) ) ( not ( = ?auto_2088946 ?auto_2088957 ) ) ( not ( = ?auto_2088947 ?auto_2088948 ) ) ( not ( = ?auto_2088947 ?auto_2088949 ) ) ( not ( = ?auto_2088947 ?auto_2088950 ) ) ( not ( = ?auto_2088947 ?auto_2088951 ) ) ( not ( = ?auto_2088947 ?auto_2088952 ) ) ( not ( = ?auto_2088947 ?auto_2088953 ) ) ( not ( = ?auto_2088947 ?auto_2088954 ) ) ( not ( = ?auto_2088947 ?auto_2088955 ) ) ( not ( = ?auto_2088947 ?auto_2088957 ) ) ( not ( = ?auto_2088948 ?auto_2088949 ) ) ( not ( = ?auto_2088948 ?auto_2088950 ) ) ( not ( = ?auto_2088948 ?auto_2088951 ) ) ( not ( = ?auto_2088948 ?auto_2088952 ) ) ( not ( = ?auto_2088948 ?auto_2088953 ) ) ( not ( = ?auto_2088948 ?auto_2088954 ) ) ( not ( = ?auto_2088948 ?auto_2088955 ) ) ( not ( = ?auto_2088948 ?auto_2088957 ) ) ( not ( = ?auto_2088949 ?auto_2088950 ) ) ( not ( = ?auto_2088949 ?auto_2088951 ) ) ( not ( = ?auto_2088949 ?auto_2088952 ) ) ( not ( = ?auto_2088949 ?auto_2088953 ) ) ( not ( = ?auto_2088949 ?auto_2088954 ) ) ( not ( = ?auto_2088949 ?auto_2088955 ) ) ( not ( = ?auto_2088949 ?auto_2088957 ) ) ( not ( = ?auto_2088950 ?auto_2088951 ) ) ( not ( = ?auto_2088950 ?auto_2088952 ) ) ( not ( = ?auto_2088950 ?auto_2088953 ) ) ( not ( = ?auto_2088950 ?auto_2088954 ) ) ( not ( = ?auto_2088950 ?auto_2088955 ) ) ( not ( = ?auto_2088950 ?auto_2088957 ) ) ( not ( = ?auto_2088951 ?auto_2088952 ) ) ( not ( = ?auto_2088951 ?auto_2088953 ) ) ( not ( = ?auto_2088951 ?auto_2088954 ) ) ( not ( = ?auto_2088951 ?auto_2088955 ) ) ( not ( = ?auto_2088951 ?auto_2088957 ) ) ( not ( = ?auto_2088952 ?auto_2088953 ) ) ( not ( = ?auto_2088952 ?auto_2088954 ) ) ( not ( = ?auto_2088952 ?auto_2088955 ) ) ( not ( = ?auto_2088952 ?auto_2088957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088953 ?auto_2088954 ?auto_2088955 )
      ( MAKE-14CRATE-VERIFY ?auto_2088941 ?auto_2088942 ?auto_2088943 ?auto_2088944 ?auto_2088945 ?auto_2088946 ?auto_2088947 ?auto_2088948 ?auto_2088949 ?auto_2088950 ?auto_2088951 ?auto_2088952 ?auto_2088953 ?auto_2088954 ?auto_2088955 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089145 - SURFACE
      ?auto_2089146 - SURFACE
      ?auto_2089147 - SURFACE
      ?auto_2089148 - SURFACE
      ?auto_2089149 - SURFACE
      ?auto_2089150 - SURFACE
      ?auto_2089151 - SURFACE
      ?auto_2089152 - SURFACE
      ?auto_2089153 - SURFACE
      ?auto_2089154 - SURFACE
      ?auto_2089155 - SURFACE
      ?auto_2089156 - SURFACE
      ?auto_2089157 - SURFACE
      ?auto_2089158 - SURFACE
      ?auto_2089159 - SURFACE
    )
    :vars
    (
      ?auto_2089163 - HOIST
      ?auto_2089161 - PLACE
      ?auto_2089164 - PLACE
      ?auto_2089162 - HOIST
      ?auto_2089165 - SURFACE
      ?auto_2089160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089163 ?auto_2089161 ) ( IS-CRATE ?auto_2089159 ) ( not ( = ?auto_2089158 ?auto_2089159 ) ) ( not ( = ?auto_2089157 ?auto_2089158 ) ) ( not ( = ?auto_2089157 ?auto_2089159 ) ) ( not ( = ?auto_2089164 ?auto_2089161 ) ) ( HOIST-AT ?auto_2089162 ?auto_2089164 ) ( not ( = ?auto_2089163 ?auto_2089162 ) ) ( AVAILABLE ?auto_2089162 ) ( SURFACE-AT ?auto_2089159 ?auto_2089164 ) ( ON ?auto_2089159 ?auto_2089165 ) ( CLEAR ?auto_2089159 ) ( not ( = ?auto_2089158 ?auto_2089165 ) ) ( not ( = ?auto_2089159 ?auto_2089165 ) ) ( not ( = ?auto_2089157 ?auto_2089165 ) ) ( TRUCK-AT ?auto_2089160 ?auto_2089161 ) ( SURFACE-AT ?auto_2089157 ?auto_2089161 ) ( CLEAR ?auto_2089157 ) ( IS-CRATE ?auto_2089158 ) ( AVAILABLE ?auto_2089163 ) ( IN ?auto_2089158 ?auto_2089160 ) ( ON ?auto_2089146 ?auto_2089145 ) ( ON ?auto_2089147 ?auto_2089146 ) ( ON ?auto_2089148 ?auto_2089147 ) ( ON ?auto_2089149 ?auto_2089148 ) ( ON ?auto_2089150 ?auto_2089149 ) ( ON ?auto_2089151 ?auto_2089150 ) ( ON ?auto_2089152 ?auto_2089151 ) ( ON ?auto_2089153 ?auto_2089152 ) ( ON ?auto_2089154 ?auto_2089153 ) ( ON ?auto_2089155 ?auto_2089154 ) ( ON ?auto_2089156 ?auto_2089155 ) ( ON ?auto_2089157 ?auto_2089156 ) ( not ( = ?auto_2089145 ?auto_2089146 ) ) ( not ( = ?auto_2089145 ?auto_2089147 ) ) ( not ( = ?auto_2089145 ?auto_2089148 ) ) ( not ( = ?auto_2089145 ?auto_2089149 ) ) ( not ( = ?auto_2089145 ?auto_2089150 ) ) ( not ( = ?auto_2089145 ?auto_2089151 ) ) ( not ( = ?auto_2089145 ?auto_2089152 ) ) ( not ( = ?auto_2089145 ?auto_2089153 ) ) ( not ( = ?auto_2089145 ?auto_2089154 ) ) ( not ( = ?auto_2089145 ?auto_2089155 ) ) ( not ( = ?auto_2089145 ?auto_2089156 ) ) ( not ( = ?auto_2089145 ?auto_2089157 ) ) ( not ( = ?auto_2089145 ?auto_2089158 ) ) ( not ( = ?auto_2089145 ?auto_2089159 ) ) ( not ( = ?auto_2089145 ?auto_2089165 ) ) ( not ( = ?auto_2089146 ?auto_2089147 ) ) ( not ( = ?auto_2089146 ?auto_2089148 ) ) ( not ( = ?auto_2089146 ?auto_2089149 ) ) ( not ( = ?auto_2089146 ?auto_2089150 ) ) ( not ( = ?auto_2089146 ?auto_2089151 ) ) ( not ( = ?auto_2089146 ?auto_2089152 ) ) ( not ( = ?auto_2089146 ?auto_2089153 ) ) ( not ( = ?auto_2089146 ?auto_2089154 ) ) ( not ( = ?auto_2089146 ?auto_2089155 ) ) ( not ( = ?auto_2089146 ?auto_2089156 ) ) ( not ( = ?auto_2089146 ?auto_2089157 ) ) ( not ( = ?auto_2089146 ?auto_2089158 ) ) ( not ( = ?auto_2089146 ?auto_2089159 ) ) ( not ( = ?auto_2089146 ?auto_2089165 ) ) ( not ( = ?auto_2089147 ?auto_2089148 ) ) ( not ( = ?auto_2089147 ?auto_2089149 ) ) ( not ( = ?auto_2089147 ?auto_2089150 ) ) ( not ( = ?auto_2089147 ?auto_2089151 ) ) ( not ( = ?auto_2089147 ?auto_2089152 ) ) ( not ( = ?auto_2089147 ?auto_2089153 ) ) ( not ( = ?auto_2089147 ?auto_2089154 ) ) ( not ( = ?auto_2089147 ?auto_2089155 ) ) ( not ( = ?auto_2089147 ?auto_2089156 ) ) ( not ( = ?auto_2089147 ?auto_2089157 ) ) ( not ( = ?auto_2089147 ?auto_2089158 ) ) ( not ( = ?auto_2089147 ?auto_2089159 ) ) ( not ( = ?auto_2089147 ?auto_2089165 ) ) ( not ( = ?auto_2089148 ?auto_2089149 ) ) ( not ( = ?auto_2089148 ?auto_2089150 ) ) ( not ( = ?auto_2089148 ?auto_2089151 ) ) ( not ( = ?auto_2089148 ?auto_2089152 ) ) ( not ( = ?auto_2089148 ?auto_2089153 ) ) ( not ( = ?auto_2089148 ?auto_2089154 ) ) ( not ( = ?auto_2089148 ?auto_2089155 ) ) ( not ( = ?auto_2089148 ?auto_2089156 ) ) ( not ( = ?auto_2089148 ?auto_2089157 ) ) ( not ( = ?auto_2089148 ?auto_2089158 ) ) ( not ( = ?auto_2089148 ?auto_2089159 ) ) ( not ( = ?auto_2089148 ?auto_2089165 ) ) ( not ( = ?auto_2089149 ?auto_2089150 ) ) ( not ( = ?auto_2089149 ?auto_2089151 ) ) ( not ( = ?auto_2089149 ?auto_2089152 ) ) ( not ( = ?auto_2089149 ?auto_2089153 ) ) ( not ( = ?auto_2089149 ?auto_2089154 ) ) ( not ( = ?auto_2089149 ?auto_2089155 ) ) ( not ( = ?auto_2089149 ?auto_2089156 ) ) ( not ( = ?auto_2089149 ?auto_2089157 ) ) ( not ( = ?auto_2089149 ?auto_2089158 ) ) ( not ( = ?auto_2089149 ?auto_2089159 ) ) ( not ( = ?auto_2089149 ?auto_2089165 ) ) ( not ( = ?auto_2089150 ?auto_2089151 ) ) ( not ( = ?auto_2089150 ?auto_2089152 ) ) ( not ( = ?auto_2089150 ?auto_2089153 ) ) ( not ( = ?auto_2089150 ?auto_2089154 ) ) ( not ( = ?auto_2089150 ?auto_2089155 ) ) ( not ( = ?auto_2089150 ?auto_2089156 ) ) ( not ( = ?auto_2089150 ?auto_2089157 ) ) ( not ( = ?auto_2089150 ?auto_2089158 ) ) ( not ( = ?auto_2089150 ?auto_2089159 ) ) ( not ( = ?auto_2089150 ?auto_2089165 ) ) ( not ( = ?auto_2089151 ?auto_2089152 ) ) ( not ( = ?auto_2089151 ?auto_2089153 ) ) ( not ( = ?auto_2089151 ?auto_2089154 ) ) ( not ( = ?auto_2089151 ?auto_2089155 ) ) ( not ( = ?auto_2089151 ?auto_2089156 ) ) ( not ( = ?auto_2089151 ?auto_2089157 ) ) ( not ( = ?auto_2089151 ?auto_2089158 ) ) ( not ( = ?auto_2089151 ?auto_2089159 ) ) ( not ( = ?auto_2089151 ?auto_2089165 ) ) ( not ( = ?auto_2089152 ?auto_2089153 ) ) ( not ( = ?auto_2089152 ?auto_2089154 ) ) ( not ( = ?auto_2089152 ?auto_2089155 ) ) ( not ( = ?auto_2089152 ?auto_2089156 ) ) ( not ( = ?auto_2089152 ?auto_2089157 ) ) ( not ( = ?auto_2089152 ?auto_2089158 ) ) ( not ( = ?auto_2089152 ?auto_2089159 ) ) ( not ( = ?auto_2089152 ?auto_2089165 ) ) ( not ( = ?auto_2089153 ?auto_2089154 ) ) ( not ( = ?auto_2089153 ?auto_2089155 ) ) ( not ( = ?auto_2089153 ?auto_2089156 ) ) ( not ( = ?auto_2089153 ?auto_2089157 ) ) ( not ( = ?auto_2089153 ?auto_2089158 ) ) ( not ( = ?auto_2089153 ?auto_2089159 ) ) ( not ( = ?auto_2089153 ?auto_2089165 ) ) ( not ( = ?auto_2089154 ?auto_2089155 ) ) ( not ( = ?auto_2089154 ?auto_2089156 ) ) ( not ( = ?auto_2089154 ?auto_2089157 ) ) ( not ( = ?auto_2089154 ?auto_2089158 ) ) ( not ( = ?auto_2089154 ?auto_2089159 ) ) ( not ( = ?auto_2089154 ?auto_2089165 ) ) ( not ( = ?auto_2089155 ?auto_2089156 ) ) ( not ( = ?auto_2089155 ?auto_2089157 ) ) ( not ( = ?auto_2089155 ?auto_2089158 ) ) ( not ( = ?auto_2089155 ?auto_2089159 ) ) ( not ( = ?auto_2089155 ?auto_2089165 ) ) ( not ( = ?auto_2089156 ?auto_2089157 ) ) ( not ( = ?auto_2089156 ?auto_2089158 ) ) ( not ( = ?auto_2089156 ?auto_2089159 ) ) ( not ( = ?auto_2089156 ?auto_2089165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089157 ?auto_2089158 ?auto_2089159 )
      ( MAKE-14CRATE-VERIFY ?auto_2089145 ?auto_2089146 ?auto_2089147 ?auto_2089148 ?auto_2089149 ?auto_2089150 ?auto_2089151 ?auto_2089152 ?auto_2089153 ?auto_2089154 ?auto_2089155 ?auto_2089156 ?auto_2089157 ?auto_2089158 ?auto_2089159 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106335 - SURFACE
      ?auto_2106336 - SURFACE
      ?auto_2106337 - SURFACE
      ?auto_2106338 - SURFACE
      ?auto_2106339 - SURFACE
      ?auto_2106340 - SURFACE
      ?auto_2106341 - SURFACE
      ?auto_2106342 - SURFACE
      ?auto_2106343 - SURFACE
      ?auto_2106344 - SURFACE
      ?auto_2106345 - SURFACE
      ?auto_2106346 - SURFACE
      ?auto_2106347 - SURFACE
      ?auto_2106348 - SURFACE
      ?auto_2106349 - SURFACE
      ?auto_2106350 - SURFACE
    )
    :vars
    (
      ?auto_2106352 - HOIST
      ?auto_2106351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106352 ?auto_2106351 ) ( SURFACE-AT ?auto_2106349 ?auto_2106351 ) ( CLEAR ?auto_2106349 ) ( LIFTING ?auto_2106352 ?auto_2106350 ) ( IS-CRATE ?auto_2106350 ) ( not ( = ?auto_2106349 ?auto_2106350 ) ) ( ON ?auto_2106336 ?auto_2106335 ) ( ON ?auto_2106337 ?auto_2106336 ) ( ON ?auto_2106338 ?auto_2106337 ) ( ON ?auto_2106339 ?auto_2106338 ) ( ON ?auto_2106340 ?auto_2106339 ) ( ON ?auto_2106341 ?auto_2106340 ) ( ON ?auto_2106342 ?auto_2106341 ) ( ON ?auto_2106343 ?auto_2106342 ) ( ON ?auto_2106344 ?auto_2106343 ) ( ON ?auto_2106345 ?auto_2106344 ) ( ON ?auto_2106346 ?auto_2106345 ) ( ON ?auto_2106347 ?auto_2106346 ) ( ON ?auto_2106348 ?auto_2106347 ) ( ON ?auto_2106349 ?auto_2106348 ) ( not ( = ?auto_2106335 ?auto_2106336 ) ) ( not ( = ?auto_2106335 ?auto_2106337 ) ) ( not ( = ?auto_2106335 ?auto_2106338 ) ) ( not ( = ?auto_2106335 ?auto_2106339 ) ) ( not ( = ?auto_2106335 ?auto_2106340 ) ) ( not ( = ?auto_2106335 ?auto_2106341 ) ) ( not ( = ?auto_2106335 ?auto_2106342 ) ) ( not ( = ?auto_2106335 ?auto_2106343 ) ) ( not ( = ?auto_2106335 ?auto_2106344 ) ) ( not ( = ?auto_2106335 ?auto_2106345 ) ) ( not ( = ?auto_2106335 ?auto_2106346 ) ) ( not ( = ?auto_2106335 ?auto_2106347 ) ) ( not ( = ?auto_2106335 ?auto_2106348 ) ) ( not ( = ?auto_2106335 ?auto_2106349 ) ) ( not ( = ?auto_2106335 ?auto_2106350 ) ) ( not ( = ?auto_2106336 ?auto_2106337 ) ) ( not ( = ?auto_2106336 ?auto_2106338 ) ) ( not ( = ?auto_2106336 ?auto_2106339 ) ) ( not ( = ?auto_2106336 ?auto_2106340 ) ) ( not ( = ?auto_2106336 ?auto_2106341 ) ) ( not ( = ?auto_2106336 ?auto_2106342 ) ) ( not ( = ?auto_2106336 ?auto_2106343 ) ) ( not ( = ?auto_2106336 ?auto_2106344 ) ) ( not ( = ?auto_2106336 ?auto_2106345 ) ) ( not ( = ?auto_2106336 ?auto_2106346 ) ) ( not ( = ?auto_2106336 ?auto_2106347 ) ) ( not ( = ?auto_2106336 ?auto_2106348 ) ) ( not ( = ?auto_2106336 ?auto_2106349 ) ) ( not ( = ?auto_2106336 ?auto_2106350 ) ) ( not ( = ?auto_2106337 ?auto_2106338 ) ) ( not ( = ?auto_2106337 ?auto_2106339 ) ) ( not ( = ?auto_2106337 ?auto_2106340 ) ) ( not ( = ?auto_2106337 ?auto_2106341 ) ) ( not ( = ?auto_2106337 ?auto_2106342 ) ) ( not ( = ?auto_2106337 ?auto_2106343 ) ) ( not ( = ?auto_2106337 ?auto_2106344 ) ) ( not ( = ?auto_2106337 ?auto_2106345 ) ) ( not ( = ?auto_2106337 ?auto_2106346 ) ) ( not ( = ?auto_2106337 ?auto_2106347 ) ) ( not ( = ?auto_2106337 ?auto_2106348 ) ) ( not ( = ?auto_2106337 ?auto_2106349 ) ) ( not ( = ?auto_2106337 ?auto_2106350 ) ) ( not ( = ?auto_2106338 ?auto_2106339 ) ) ( not ( = ?auto_2106338 ?auto_2106340 ) ) ( not ( = ?auto_2106338 ?auto_2106341 ) ) ( not ( = ?auto_2106338 ?auto_2106342 ) ) ( not ( = ?auto_2106338 ?auto_2106343 ) ) ( not ( = ?auto_2106338 ?auto_2106344 ) ) ( not ( = ?auto_2106338 ?auto_2106345 ) ) ( not ( = ?auto_2106338 ?auto_2106346 ) ) ( not ( = ?auto_2106338 ?auto_2106347 ) ) ( not ( = ?auto_2106338 ?auto_2106348 ) ) ( not ( = ?auto_2106338 ?auto_2106349 ) ) ( not ( = ?auto_2106338 ?auto_2106350 ) ) ( not ( = ?auto_2106339 ?auto_2106340 ) ) ( not ( = ?auto_2106339 ?auto_2106341 ) ) ( not ( = ?auto_2106339 ?auto_2106342 ) ) ( not ( = ?auto_2106339 ?auto_2106343 ) ) ( not ( = ?auto_2106339 ?auto_2106344 ) ) ( not ( = ?auto_2106339 ?auto_2106345 ) ) ( not ( = ?auto_2106339 ?auto_2106346 ) ) ( not ( = ?auto_2106339 ?auto_2106347 ) ) ( not ( = ?auto_2106339 ?auto_2106348 ) ) ( not ( = ?auto_2106339 ?auto_2106349 ) ) ( not ( = ?auto_2106339 ?auto_2106350 ) ) ( not ( = ?auto_2106340 ?auto_2106341 ) ) ( not ( = ?auto_2106340 ?auto_2106342 ) ) ( not ( = ?auto_2106340 ?auto_2106343 ) ) ( not ( = ?auto_2106340 ?auto_2106344 ) ) ( not ( = ?auto_2106340 ?auto_2106345 ) ) ( not ( = ?auto_2106340 ?auto_2106346 ) ) ( not ( = ?auto_2106340 ?auto_2106347 ) ) ( not ( = ?auto_2106340 ?auto_2106348 ) ) ( not ( = ?auto_2106340 ?auto_2106349 ) ) ( not ( = ?auto_2106340 ?auto_2106350 ) ) ( not ( = ?auto_2106341 ?auto_2106342 ) ) ( not ( = ?auto_2106341 ?auto_2106343 ) ) ( not ( = ?auto_2106341 ?auto_2106344 ) ) ( not ( = ?auto_2106341 ?auto_2106345 ) ) ( not ( = ?auto_2106341 ?auto_2106346 ) ) ( not ( = ?auto_2106341 ?auto_2106347 ) ) ( not ( = ?auto_2106341 ?auto_2106348 ) ) ( not ( = ?auto_2106341 ?auto_2106349 ) ) ( not ( = ?auto_2106341 ?auto_2106350 ) ) ( not ( = ?auto_2106342 ?auto_2106343 ) ) ( not ( = ?auto_2106342 ?auto_2106344 ) ) ( not ( = ?auto_2106342 ?auto_2106345 ) ) ( not ( = ?auto_2106342 ?auto_2106346 ) ) ( not ( = ?auto_2106342 ?auto_2106347 ) ) ( not ( = ?auto_2106342 ?auto_2106348 ) ) ( not ( = ?auto_2106342 ?auto_2106349 ) ) ( not ( = ?auto_2106342 ?auto_2106350 ) ) ( not ( = ?auto_2106343 ?auto_2106344 ) ) ( not ( = ?auto_2106343 ?auto_2106345 ) ) ( not ( = ?auto_2106343 ?auto_2106346 ) ) ( not ( = ?auto_2106343 ?auto_2106347 ) ) ( not ( = ?auto_2106343 ?auto_2106348 ) ) ( not ( = ?auto_2106343 ?auto_2106349 ) ) ( not ( = ?auto_2106343 ?auto_2106350 ) ) ( not ( = ?auto_2106344 ?auto_2106345 ) ) ( not ( = ?auto_2106344 ?auto_2106346 ) ) ( not ( = ?auto_2106344 ?auto_2106347 ) ) ( not ( = ?auto_2106344 ?auto_2106348 ) ) ( not ( = ?auto_2106344 ?auto_2106349 ) ) ( not ( = ?auto_2106344 ?auto_2106350 ) ) ( not ( = ?auto_2106345 ?auto_2106346 ) ) ( not ( = ?auto_2106345 ?auto_2106347 ) ) ( not ( = ?auto_2106345 ?auto_2106348 ) ) ( not ( = ?auto_2106345 ?auto_2106349 ) ) ( not ( = ?auto_2106345 ?auto_2106350 ) ) ( not ( = ?auto_2106346 ?auto_2106347 ) ) ( not ( = ?auto_2106346 ?auto_2106348 ) ) ( not ( = ?auto_2106346 ?auto_2106349 ) ) ( not ( = ?auto_2106346 ?auto_2106350 ) ) ( not ( = ?auto_2106347 ?auto_2106348 ) ) ( not ( = ?auto_2106347 ?auto_2106349 ) ) ( not ( = ?auto_2106347 ?auto_2106350 ) ) ( not ( = ?auto_2106348 ?auto_2106349 ) ) ( not ( = ?auto_2106348 ?auto_2106350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2106349 ?auto_2106350 )
      ( MAKE-15CRATE-VERIFY ?auto_2106335 ?auto_2106336 ?auto_2106337 ?auto_2106338 ?auto_2106339 ?auto_2106340 ?auto_2106341 ?auto_2106342 ?auto_2106343 ?auto_2106344 ?auto_2106345 ?auto_2106346 ?auto_2106347 ?auto_2106348 ?auto_2106349 ?auto_2106350 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106514 - SURFACE
      ?auto_2106515 - SURFACE
      ?auto_2106516 - SURFACE
      ?auto_2106517 - SURFACE
      ?auto_2106518 - SURFACE
      ?auto_2106519 - SURFACE
      ?auto_2106520 - SURFACE
      ?auto_2106521 - SURFACE
      ?auto_2106522 - SURFACE
      ?auto_2106523 - SURFACE
      ?auto_2106524 - SURFACE
      ?auto_2106525 - SURFACE
      ?auto_2106526 - SURFACE
      ?auto_2106527 - SURFACE
      ?auto_2106528 - SURFACE
      ?auto_2106529 - SURFACE
    )
    :vars
    (
      ?auto_2106530 - HOIST
      ?auto_2106531 - PLACE
      ?auto_2106532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106530 ?auto_2106531 ) ( SURFACE-AT ?auto_2106528 ?auto_2106531 ) ( CLEAR ?auto_2106528 ) ( IS-CRATE ?auto_2106529 ) ( not ( = ?auto_2106528 ?auto_2106529 ) ) ( TRUCK-AT ?auto_2106532 ?auto_2106531 ) ( AVAILABLE ?auto_2106530 ) ( IN ?auto_2106529 ?auto_2106532 ) ( ON ?auto_2106528 ?auto_2106527 ) ( not ( = ?auto_2106527 ?auto_2106528 ) ) ( not ( = ?auto_2106527 ?auto_2106529 ) ) ( ON ?auto_2106515 ?auto_2106514 ) ( ON ?auto_2106516 ?auto_2106515 ) ( ON ?auto_2106517 ?auto_2106516 ) ( ON ?auto_2106518 ?auto_2106517 ) ( ON ?auto_2106519 ?auto_2106518 ) ( ON ?auto_2106520 ?auto_2106519 ) ( ON ?auto_2106521 ?auto_2106520 ) ( ON ?auto_2106522 ?auto_2106521 ) ( ON ?auto_2106523 ?auto_2106522 ) ( ON ?auto_2106524 ?auto_2106523 ) ( ON ?auto_2106525 ?auto_2106524 ) ( ON ?auto_2106526 ?auto_2106525 ) ( ON ?auto_2106527 ?auto_2106526 ) ( not ( = ?auto_2106514 ?auto_2106515 ) ) ( not ( = ?auto_2106514 ?auto_2106516 ) ) ( not ( = ?auto_2106514 ?auto_2106517 ) ) ( not ( = ?auto_2106514 ?auto_2106518 ) ) ( not ( = ?auto_2106514 ?auto_2106519 ) ) ( not ( = ?auto_2106514 ?auto_2106520 ) ) ( not ( = ?auto_2106514 ?auto_2106521 ) ) ( not ( = ?auto_2106514 ?auto_2106522 ) ) ( not ( = ?auto_2106514 ?auto_2106523 ) ) ( not ( = ?auto_2106514 ?auto_2106524 ) ) ( not ( = ?auto_2106514 ?auto_2106525 ) ) ( not ( = ?auto_2106514 ?auto_2106526 ) ) ( not ( = ?auto_2106514 ?auto_2106527 ) ) ( not ( = ?auto_2106514 ?auto_2106528 ) ) ( not ( = ?auto_2106514 ?auto_2106529 ) ) ( not ( = ?auto_2106515 ?auto_2106516 ) ) ( not ( = ?auto_2106515 ?auto_2106517 ) ) ( not ( = ?auto_2106515 ?auto_2106518 ) ) ( not ( = ?auto_2106515 ?auto_2106519 ) ) ( not ( = ?auto_2106515 ?auto_2106520 ) ) ( not ( = ?auto_2106515 ?auto_2106521 ) ) ( not ( = ?auto_2106515 ?auto_2106522 ) ) ( not ( = ?auto_2106515 ?auto_2106523 ) ) ( not ( = ?auto_2106515 ?auto_2106524 ) ) ( not ( = ?auto_2106515 ?auto_2106525 ) ) ( not ( = ?auto_2106515 ?auto_2106526 ) ) ( not ( = ?auto_2106515 ?auto_2106527 ) ) ( not ( = ?auto_2106515 ?auto_2106528 ) ) ( not ( = ?auto_2106515 ?auto_2106529 ) ) ( not ( = ?auto_2106516 ?auto_2106517 ) ) ( not ( = ?auto_2106516 ?auto_2106518 ) ) ( not ( = ?auto_2106516 ?auto_2106519 ) ) ( not ( = ?auto_2106516 ?auto_2106520 ) ) ( not ( = ?auto_2106516 ?auto_2106521 ) ) ( not ( = ?auto_2106516 ?auto_2106522 ) ) ( not ( = ?auto_2106516 ?auto_2106523 ) ) ( not ( = ?auto_2106516 ?auto_2106524 ) ) ( not ( = ?auto_2106516 ?auto_2106525 ) ) ( not ( = ?auto_2106516 ?auto_2106526 ) ) ( not ( = ?auto_2106516 ?auto_2106527 ) ) ( not ( = ?auto_2106516 ?auto_2106528 ) ) ( not ( = ?auto_2106516 ?auto_2106529 ) ) ( not ( = ?auto_2106517 ?auto_2106518 ) ) ( not ( = ?auto_2106517 ?auto_2106519 ) ) ( not ( = ?auto_2106517 ?auto_2106520 ) ) ( not ( = ?auto_2106517 ?auto_2106521 ) ) ( not ( = ?auto_2106517 ?auto_2106522 ) ) ( not ( = ?auto_2106517 ?auto_2106523 ) ) ( not ( = ?auto_2106517 ?auto_2106524 ) ) ( not ( = ?auto_2106517 ?auto_2106525 ) ) ( not ( = ?auto_2106517 ?auto_2106526 ) ) ( not ( = ?auto_2106517 ?auto_2106527 ) ) ( not ( = ?auto_2106517 ?auto_2106528 ) ) ( not ( = ?auto_2106517 ?auto_2106529 ) ) ( not ( = ?auto_2106518 ?auto_2106519 ) ) ( not ( = ?auto_2106518 ?auto_2106520 ) ) ( not ( = ?auto_2106518 ?auto_2106521 ) ) ( not ( = ?auto_2106518 ?auto_2106522 ) ) ( not ( = ?auto_2106518 ?auto_2106523 ) ) ( not ( = ?auto_2106518 ?auto_2106524 ) ) ( not ( = ?auto_2106518 ?auto_2106525 ) ) ( not ( = ?auto_2106518 ?auto_2106526 ) ) ( not ( = ?auto_2106518 ?auto_2106527 ) ) ( not ( = ?auto_2106518 ?auto_2106528 ) ) ( not ( = ?auto_2106518 ?auto_2106529 ) ) ( not ( = ?auto_2106519 ?auto_2106520 ) ) ( not ( = ?auto_2106519 ?auto_2106521 ) ) ( not ( = ?auto_2106519 ?auto_2106522 ) ) ( not ( = ?auto_2106519 ?auto_2106523 ) ) ( not ( = ?auto_2106519 ?auto_2106524 ) ) ( not ( = ?auto_2106519 ?auto_2106525 ) ) ( not ( = ?auto_2106519 ?auto_2106526 ) ) ( not ( = ?auto_2106519 ?auto_2106527 ) ) ( not ( = ?auto_2106519 ?auto_2106528 ) ) ( not ( = ?auto_2106519 ?auto_2106529 ) ) ( not ( = ?auto_2106520 ?auto_2106521 ) ) ( not ( = ?auto_2106520 ?auto_2106522 ) ) ( not ( = ?auto_2106520 ?auto_2106523 ) ) ( not ( = ?auto_2106520 ?auto_2106524 ) ) ( not ( = ?auto_2106520 ?auto_2106525 ) ) ( not ( = ?auto_2106520 ?auto_2106526 ) ) ( not ( = ?auto_2106520 ?auto_2106527 ) ) ( not ( = ?auto_2106520 ?auto_2106528 ) ) ( not ( = ?auto_2106520 ?auto_2106529 ) ) ( not ( = ?auto_2106521 ?auto_2106522 ) ) ( not ( = ?auto_2106521 ?auto_2106523 ) ) ( not ( = ?auto_2106521 ?auto_2106524 ) ) ( not ( = ?auto_2106521 ?auto_2106525 ) ) ( not ( = ?auto_2106521 ?auto_2106526 ) ) ( not ( = ?auto_2106521 ?auto_2106527 ) ) ( not ( = ?auto_2106521 ?auto_2106528 ) ) ( not ( = ?auto_2106521 ?auto_2106529 ) ) ( not ( = ?auto_2106522 ?auto_2106523 ) ) ( not ( = ?auto_2106522 ?auto_2106524 ) ) ( not ( = ?auto_2106522 ?auto_2106525 ) ) ( not ( = ?auto_2106522 ?auto_2106526 ) ) ( not ( = ?auto_2106522 ?auto_2106527 ) ) ( not ( = ?auto_2106522 ?auto_2106528 ) ) ( not ( = ?auto_2106522 ?auto_2106529 ) ) ( not ( = ?auto_2106523 ?auto_2106524 ) ) ( not ( = ?auto_2106523 ?auto_2106525 ) ) ( not ( = ?auto_2106523 ?auto_2106526 ) ) ( not ( = ?auto_2106523 ?auto_2106527 ) ) ( not ( = ?auto_2106523 ?auto_2106528 ) ) ( not ( = ?auto_2106523 ?auto_2106529 ) ) ( not ( = ?auto_2106524 ?auto_2106525 ) ) ( not ( = ?auto_2106524 ?auto_2106526 ) ) ( not ( = ?auto_2106524 ?auto_2106527 ) ) ( not ( = ?auto_2106524 ?auto_2106528 ) ) ( not ( = ?auto_2106524 ?auto_2106529 ) ) ( not ( = ?auto_2106525 ?auto_2106526 ) ) ( not ( = ?auto_2106525 ?auto_2106527 ) ) ( not ( = ?auto_2106525 ?auto_2106528 ) ) ( not ( = ?auto_2106525 ?auto_2106529 ) ) ( not ( = ?auto_2106526 ?auto_2106527 ) ) ( not ( = ?auto_2106526 ?auto_2106528 ) ) ( not ( = ?auto_2106526 ?auto_2106529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106527 ?auto_2106528 ?auto_2106529 )
      ( MAKE-15CRATE-VERIFY ?auto_2106514 ?auto_2106515 ?auto_2106516 ?auto_2106517 ?auto_2106518 ?auto_2106519 ?auto_2106520 ?auto_2106521 ?auto_2106522 ?auto_2106523 ?auto_2106524 ?auto_2106525 ?auto_2106526 ?auto_2106527 ?auto_2106528 ?auto_2106529 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106709 - SURFACE
      ?auto_2106710 - SURFACE
      ?auto_2106711 - SURFACE
      ?auto_2106712 - SURFACE
      ?auto_2106713 - SURFACE
      ?auto_2106714 - SURFACE
      ?auto_2106715 - SURFACE
      ?auto_2106716 - SURFACE
      ?auto_2106717 - SURFACE
      ?auto_2106718 - SURFACE
      ?auto_2106719 - SURFACE
      ?auto_2106720 - SURFACE
      ?auto_2106721 - SURFACE
      ?auto_2106722 - SURFACE
      ?auto_2106723 - SURFACE
      ?auto_2106724 - SURFACE
    )
    :vars
    (
      ?auto_2106728 - HOIST
      ?auto_2106725 - PLACE
      ?auto_2106727 - TRUCK
      ?auto_2106726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106728 ?auto_2106725 ) ( SURFACE-AT ?auto_2106723 ?auto_2106725 ) ( CLEAR ?auto_2106723 ) ( IS-CRATE ?auto_2106724 ) ( not ( = ?auto_2106723 ?auto_2106724 ) ) ( AVAILABLE ?auto_2106728 ) ( IN ?auto_2106724 ?auto_2106727 ) ( ON ?auto_2106723 ?auto_2106722 ) ( not ( = ?auto_2106722 ?auto_2106723 ) ) ( not ( = ?auto_2106722 ?auto_2106724 ) ) ( TRUCK-AT ?auto_2106727 ?auto_2106726 ) ( not ( = ?auto_2106726 ?auto_2106725 ) ) ( ON ?auto_2106710 ?auto_2106709 ) ( ON ?auto_2106711 ?auto_2106710 ) ( ON ?auto_2106712 ?auto_2106711 ) ( ON ?auto_2106713 ?auto_2106712 ) ( ON ?auto_2106714 ?auto_2106713 ) ( ON ?auto_2106715 ?auto_2106714 ) ( ON ?auto_2106716 ?auto_2106715 ) ( ON ?auto_2106717 ?auto_2106716 ) ( ON ?auto_2106718 ?auto_2106717 ) ( ON ?auto_2106719 ?auto_2106718 ) ( ON ?auto_2106720 ?auto_2106719 ) ( ON ?auto_2106721 ?auto_2106720 ) ( ON ?auto_2106722 ?auto_2106721 ) ( not ( = ?auto_2106709 ?auto_2106710 ) ) ( not ( = ?auto_2106709 ?auto_2106711 ) ) ( not ( = ?auto_2106709 ?auto_2106712 ) ) ( not ( = ?auto_2106709 ?auto_2106713 ) ) ( not ( = ?auto_2106709 ?auto_2106714 ) ) ( not ( = ?auto_2106709 ?auto_2106715 ) ) ( not ( = ?auto_2106709 ?auto_2106716 ) ) ( not ( = ?auto_2106709 ?auto_2106717 ) ) ( not ( = ?auto_2106709 ?auto_2106718 ) ) ( not ( = ?auto_2106709 ?auto_2106719 ) ) ( not ( = ?auto_2106709 ?auto_2106720 ) ) ( not ( = ?auto_2106709 ?auto_2106721 ) ) ( not ( = ?auto_2106709 ?auto_2106722 ) ) ( not ( = ?auto_2106709 ?auto_2106723 ) ) ( not ( = ?auto_2106709 ?auto_2106724 ) ) ( not ( = ?auto_2106710 ?auto_2106711 ) ) ( not ( = ?auto_2106710 ?auto_2106712 ) ) ( not ( = ?auto_2106710 ?auto_2106713 ) ) ( not ( = ?auto_2106710 ?auto_2106714 ) ) ( not ( = ?auto_2106710 ?auto_2106715 ) ) ( not ( = ?auto_2106710 ?auto_2106716 ) ) ( not ( = ?auto_2106710 ?auto_2106717 ) ) ( not ( = ?auto_2106710 ?auto_2106718 ) ) ( not ( = ?auto_2106710 ?auto_2106719 ) ) ( not ( = ?auto_2106710 ?auto_2106720 ) ) ( not ( = ?auto_2106710 ?auto_2106721 ) ) ( not ( = ?auto_2106710 ?auto_2106722 ) ) ( not ( = ?auto_2106710 ?auto_2106723 ) ) ( not ( = ?auto_2106710 ?auto_2106724 ) ) ( not ( = ?auto_2106711 ?auto_2106712 ) ) ( not ( = ?auto_2106711 ?auto_2106713 ) ) ( not ( = ?auto_2106711 ?auto_2106714 ) ) ( not ( = ?auto_2106711 ?auto_2106715 ) ) ( not ( = ?auto_2106711 ?auto_2106716 ) ) ( not ( = ?auto_2106711 ?auto_2106717 ) ) ( not ( = ?auto_2106711 ?auto_2106718 ) ) ( not ( = ?auto_2106711 ?auto_2106719 ) ) ( not ( = ?auto_2106711 ?auto_2106720 ) ) ( not ( = ?auto_2106711 ?auto_2106721 ) ) ( not ( = ?auto_2106711 ?auto_2106722 ) ) ( not ( = ?auto_2106711 ?auto_2106723 ) ) ( not ( = ?auto_2106711 ?auto_2106724 ) ) ( not ( = ?auto_2106712 ?auto_2106713 ) ) ( not ( = ?auto_2106712 ?auto_2106714 ) ) ( not ( = ?auto_2106712 ?auto_2106715 ) ) ( not ( = ?auto_2106712 ?auto_2106716 ) ) ( not ( = ?auto_2106712 ?auto_2106717 ) ) ( not ( = ?auto_2106712 ?auto_2106718 ) ) ( not ( = ?auto_2106712 ?auto_2106719 ) ) ( not ( = ?auto_2106712 ?auto_2106720 ) ) ( not ( = ?auto_2106712 ?auto_2106721 ) ) ( not ( = ?auto_2106712 ?auto_2106722 ) ) ( not ( = ?auto_2106712 ?auto_2106723 ) ) ( not ( = ?auto_2106712 ?auto_2106724 ) ) ( not ( = ?auto_2106713 ?auto_2106714 ) ) ( not ( = ?auto_2106713 ?auto_2106715 ) ) ( not ( = ?auto_2106713 ?auto_2106716 ) ) ( not ( = ?auto_2106713 ?auto_2106717 ) ) ( not ( = ?auto_2106713 ?auto_2106718 ) ) ( not ( = ?auto_2106713 ?auto_2106719 ) ) ( not ( = ?auto_2106713 ?auto_2106720 ) ) ( not ( = ?auto_2106713 ?auto_2106721 ) ) ( not ( = ?auto_2106713 ?auto_2106722 ) ) ( not ( = ?auto_2106713 ?auto_2106723 ) ) ( not ( = ?auto_2106713 ?auto_2106724 ) ) ( not ( = ?auto_2106714 ?auto_2106715 ) ) ( not ( = ?auto_2106714 ?auto_2106716 ) ) ( not ( = ?auto_2106714 ?auto_2106717 ) ) ( not ( = ?auto_2106714 ?auto_2106718 ) ) ( not ( = ?auto_2106714 ?auto_2106719 ) ) ( not ( = ?auto_2106714 ?auto_2106720 ) ) ( not ( = ?auto_2106714 ?auto_2106721 ) ) ( not ( = ?auto_2106714 ?auto_2106722 ) ) ( not ( = ?auto_2106714 ?auto_2106723 ) ) ( not ( = ?auto_2106714 ?auto_2106724 ) ) ( not ( = ?auto_2106715 ?auto_2106716 ) ) ( not ( = ?auto_2106715 ?auto_2106717 ) ) ( not ( = ?auto_2106715 ?auto_2106718 ) ) ( not ( = ?auto_2106715 ?auto_2106719 ) ) ( not ( = ?auto_2106715 ?auto_2106720 ) ) ( not ( = ?auto_2106715 ?auto_2106721 ) ) ( not ( = ?auto_2106715 ?auto_2106722 ) ) ( not ( = ?auto_2106715 ?auto_2106723 ) ) ( not ( = ?auto_2106715 ?auto_2106724 ) ) ( not ( = ?auto_2106716 ?auto_2106717 ) ) ( not ( = ?auto_2106716 ?auto_2106718 ) ) ( not ( = ?auto_2106716 ?auto_2106719 ) ) ( not ( = ?auto_2106716 ?auto_2106720 ) ) ( not ( = ?auto_2106716 ?auto_2106721 ) ) ( not ( = ?auto_2106716 ?auto_2106722 ) ) ( not ( = ?auto_2106716 ?auto_2106723 ) ) ( not ( = ?auto_2106716 ?auto_2106724 ) ) ( not ( = ?auto_2106717 ?auto_2106718 ) ) ( not ( = ?auto_2106717 ?auto_2106719 ) ) ( not ( = ?auto_2106717 ?auto_2106720 ) ) ( not ( = ?auto_2106717 ?auto_2106721 ) ) ( not ( = ?auto_2106717 ?auto_2106722 ) ) ( not ( = ?auto_2106717 ?auto_2106723 ) ) ( not ( = ?auto_2106717 ?auto_2106724 ) ) ( not ( = ?auto_2106718 ?auto_2106719 ) ) ( not ( = ?auto_2106718 ?auto_2106720 ) ) ( not ( = ?auto_2106718 ?auto_2106721 ) ) ( not ( = ?auto_2106718 ?auto_2106722 ) ) ( not ( = ?auto_2106718 ?auto_2106723 ) ) ( not ( = ?auto_2106718 ?auto_2106724 ) ) ( not ( = ?auto_2106719 ?auto_2106720 ) ) ( not ( = ?auto_2106719 ?auto_2106721 ) ) ( not ( = ?auto_2106719 ?auto_2106722 ) ) ( not ( = ?auto_2106719 ?auto_2106723 ) ) ( not ( = ?auto_2106719 ?auto_2106724 ) ) ( not ( = ?auto_2106720 ?auto_2106721 ) ) ( not ( = ?auto_2106720 ?auto_2106722 ) ) ( not ( = ?auto_2106720 ?auto_2106723 ) ) ( not ( = ?auto_2106720 ?auto_2106724 ) ) ( not ( = ?auto_2106721 ?auto_2106722 ) ) ( not ( = ?auto_2106721 ?auto_2106723 ) ) ( not ( = ?auto_2106721 ?auto_2106724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106722 ?auto_2106723 ?auto_2106724 )
      ( MAKE-15CRATE-VERIFY ?auto_2106709 ?auto_2106710 ?auto_2106711 ?auto_2106712 ?auto_2106713 ?auto_2106714 ?auto_2106715 ?auto_2106716 ?auto_2106717 ?auto_2106718 ?auto_2106719 ?auto_2106720 ?auto_2106721 ?auto_2106722 ?auto_2106723 ?auto_2106724 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106919 - SURFACE
      ?auto_2106920 - SURFACE
      ?auto_2106921 - SURFACE
      ?auto_2106922 - SURFACE
      ?auto_2106923 - SURFACE
      ?auto_2106924 - SURFACE
      ?auto_2106925 - SURFACE
      ?auto_2106926 - SURFACE
      ?auto_2106927 - SURFACE
      ?auto_2106928 - SURFACE
      ?auto_2106929 - SURFACE
      ?auto_2106930 - SURFACE
      ?auto_2106931 - SURFACE
      ?auto_2106932 - SURFACE
      ?auto_2106933 - SURFACE
      ?auto_2106934 - SURFACE
    )
    :vars
    (
      ?auto_2106935 - HOIST
      ?auto_2106939 - PLACE
      ?auto_2106936 - TRUCK
      ?auto_2106937 - PLACE
      ?auto_2106938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106935 ?auto_2106939 ) ( SURFACE-AT ?auto_2106933 ?auto_2106939 ) ( CLEAR ?auto_2106933 ) ( IS-CRATE ?auto_2106934 ) ( not ( = ?auto_2106933 ?auto_2106934 ) ) ( AVAILABLE ?auto_2106935 ) ( ON ?auto_2106933 ?auto_2106932 ) ( not ( = ?auto_2106932 ?auto_2106933 ) ) ( not ( = ?auto_2106932 ?auto_2106934 ) ) ( TRUCK-AT ?auto_2106936 ?auto_2106937 ) ( not ( = ?auto_2106937 ?auto_2106939 ) ) ( HOIST-AT ?auto_2106938 ?auto_2106937 ) ( LIFTING ?auto_2106938 ?auto_2106934 ) ( not ( = ?auto_2106935 ?auto_2106938 ) ) ( ON ?auto_2106920 ?auto_2106919 ) ( ON ?auto_2106921 ?auto_2106920 ) ( ON ?auto_2106922 ?auto_2106921 ) ( ON ?auto_2106923 ?auto_2106922 ) ( ON ?auto_2106924 ?auto_2106923 ) ( ON ?auto_2106925 ?auto_2106924 ) ( ON ?auto_2106926 ?auto_2106925 ) ( ON ?auto_2106927 ?auto_2106926 ) ( ON ?auto_2106928 ?auto_2106927 ) ( ON ?auto_2106929 ?auto_2106928 ) ( ON ?auto_2106930 ?auto_2106929 ) ( ON ?auto_2106931 ?auto_2106930 ) ( ON ?auto_2106932 ?auto_2106931 ) ( not ( = ?auto_2106919 ?auto_2106920 ) ) ( not ( = ?auto_2106919 ?auto_2106921 ) ) ( not ( = ?auto_2106919 ?auto_2106922 ) ) ( not ( = ?auto_2106919 ?auto_2106923 ) ) ( not ( = ?auto_2106919 ?auto_2106924 ) ) ( not ( = ?auto_2106919 ?auto_2106925 ) ) ( not ( = ?auto_2106919 ?auto_2106926 ) ) ( not ( = ?auto_2106919 ?auto_2106927 ) ) ( not ( = ?auto_2106919 ?auto_2106928 ) ) ( not ( = ?auto_2106919 ?auto_2106929 ) ) ( not ( = ?auto_2106919 ?auto_2106930 ) ) ( not ( = ?auto_2106919 ?auto_2106931 ) ) ( not ( = ?auto_2106919 ?auto_2106932 ) ) ( not ( = ?auto_2106919 ?auto_2106933 ) ) ( not ( = ?auto_2106919 ?auto_2106934 ) ) ( not ( = ?auto_2106920 ?auto_2106921 ) ) ( not ( = ?auto_2106920 ?auto_2106922 ) ) ( not ( = ?auto_2106920 ?auto_2106923 ) ) ( not ( = ?auto_2106920 ?auto_2106924 ) ) ( not ( = ?auto_2106920 ?auto_2106925 ) ) ( not ( = ?auto_2106920 ?auto_2106926 ) ) ( not ( = ?auto_2106920 ?auto_2106927 ) ) ( not ( = ?auto_2106920 ?auto_2106928 ) ) ( not ( = ?auto_2106920 ?auto_2106929 ) ) ( not ( = ?auto_2106920 ?auto_2106930 ) ) ( not ( = ?auto_2106920 ?auto_2106931 ) ) ( not ( = ?auto_2106920 ?auto_2106932 ) ) ( not ( = ?auto_2106920 ?auto_2106933 ) ) ( not ( = ?auto_2106920 ?auto_2106934 ) ) ( not ( = ?auto_2106921 ?auto_2106922 ) ) ( not ( = ?auto_2106921 ?auto_2106923 ) ) ( not ( = ?auto_2106921 ?auto_2106924 ) ) ( not ( = ?auto_2106921 ?auto_2106925 ) ) ( not ( = ?auto_2106921 ?auto_2106926 ) ) ( not ( = ?auto_2106921 ?auto_2106927 ) ) ( not ( = ?auto_2106921 ?auto_2106928 ) ) ( not ( = ?auto_2106921 ?auto_2106929 ) ) ( not ( = ?auto_2106921 ?auto_2106930 ) ) ( not ( = ?auto_2106921 ?auto_2106931 ) ) ( not ( = ?auto_2106921 ?auto_2106932 ) ) ( not ( = ?auto_2106921 ?auto_2106933 ) ) ( not ( = ?auto_2106921 ?auto_2106934 ) ) ( not ( = ?auto_2106922 ?auto_2106923 ) ) ( not ( = ?auto_2106922 ?auto_2106924 ) ) ( not ( = ?auto_2106922 ?auto_2106925 ) ) ( not ( = ?auto_2106922 ?auto_2106926 ) ) ( not ( = ?auto_2106922 ?auto_2106927 ) ) ( not ( = ?auto_2106922 ?auto_2106928 ) ) ( not ( = ?auto_2106922 ?auto_2106929 ) ) ( not ( = ?auto_2106922 ?auto_2106930 ) ) ( not ( = ?auto_2106922 ?auto_2106931 ) ) ( not ( = ?auto_2106922 ?auto_2106932 ) ) ( not ( = ?auto_2106922 ?auto_2106933 ) ) ( not ( = ?auto_2106922 ?auto_2106934 ) ) ( not ( = ?auto_2106923 ?auto_2106924 ) ) ( not ( = ?auto_2106923 ?auto_2106925 ) ) ( not ( = ?auto_2106923 ?auto_2106926 ) ) ( not ( = ?auto_2106923 ?auto_2106927 ) ) ( not ( = ?auto_2106923 ?auto_2106928 ) ) ( not ( = ?auto_2106923 ?auto_2106929 ) ) ( not ( = ?auto_2106923 ?auto_2106930 ) ) ( not ( = ?auto_2106923 ?auto_2106931 ) ) ( not ( = ?auto_2106923 ?auto_2106932 ) ) ( not ( = ?auto_2106923 ?auto_2106933 ) ) ( not ( = ?auto_2106923 ?auto_2106934 ) ) ( not ( = ?auto_2106924 ?auto_2106925 ) ) ( not ( = ?auto_2106924 ?auto_2106926 ) ) ( not ( = ?auto_2106924 ?auto_2106927 ) ) ( not ( = ?auto_2106924 ?auto_2106928 ) ) ( not ( = ?auto_2106924 ?auto_2106929 ) ) ( not ( = ?auto_2106924 ?auto_2106930 ) ) ( not ( = ?auto_2106924 ?auto_2106931 ) ) ( not ( = ?auto_2106924 ?auto_2106932 ) ) ( not ( = ?auto_2106924 ?auto_2106933 ) ) ( not ( = ?auto_2106924 ?auto_2106934 ) ) ( not ( = ?auto_2106925 ?auto_2106926 ) ) ( not ( = ?auto_2106925 ?auto_2106927 ) ) ( not ( = ?auto_2106925 ?auto_2106928 ) ) ( not ( = ?auto_2106925 ?auto_2106929 ) ) ( not ( = ?auto_2106925 ?auto_2106930 ) ) ( not ( = ?auto_2106925 ?auto_2106931 ) ) ( not ( = ?auto_2106925 ?auto_2106932 ) ) ( not ( = ?auto_2106925 ?auto_2106933 ) ) ( not ( = ?auto_2106925 ?auto_2106934 ) ) ( not ( = ?auto_2106926 ?auto_2106927 ) ) ( not ( = ?auto_2106926 ?auto_2106928 ) ) ( not ( = ?auto_2106926 ?auto_2106929 ) ) ( not ( = ?auto_2106926 ?auto_2106930 ) ) ( not ( = ?auto_2106926 ?auto_2106931 ) ) ( not ( = ?auto_2106926 ?auto_2106932 ) ) ( not ( = ?auto_2106926 ?auto_2106933 ) ) ( not ( = ?auto_2106926 ?auto_2106934 ) ) ( not ( = ?auto_2106927 ?auto_2106928 ) ) ( not ( = ?auto_2106927 ?auto_2106929 ) ) ( not ( = ?auto_2106927 ?auto_2106930 ) ) ( not ( = ?auto_2106927 ?auto_2106931 ) ) ( not ( = ?auto_2106927 ?auto_2106932 ) ) ( not ( = ?auto_2106927 ?auto_2106933 ) ) ( not ( = ?auto_2106927 ?auto_2106934 ) ) ( not ( = ?auto_2106928 ?auto_2106929 ) ) ( not ( = ?auto_2106928 ?auto_2106930 ) ) ( not ( = ?auto_2106928 ?auto_2106931 ) ) ( not ( = ?auto_2106928 ?auto_2106932 ) ) ( not ( = ?auto_2106928 ?auto_2106933 ) ) ( not ( = ?auto_2106928 ?auto_2106934 ) ) ( not ( = ?auto_2106929 ?auto_2106930 ) ) ( not ( = ?auto_2106929 ?auto_2106931 ) ) ( not ( = ?auto_2106929 ?auto_2106932 ) ) ( not ( = ?auto_2106929 ?auto_2106933 ) ) ( not ( = ?auto_2106929 ?auto_2106934 ) ) ( not ( = ?auto_2106930 ?auto_2106931 ) ) ( not ( = ?auto_2106930 ?auto_2106932 ) ) ( not ( = ?auto_2106930 ?auto_2106933 ) ) ( not ( = ?auto_2106930 ?auto_2106934 ) ) ( not ( = ?auto_2106931 ?auto_2106932 ) ) ( not ( = ?auto_2106931 ?auto_2106933 ) ) ( not ( = ?auto_2106931 ?auto_2106934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106932 ?auto_2106933 ?auto_2106934 )
      ( MAKE-15CRATE-VERIFY ?auto_2106919 ?auto_2106920 ?auto_2106921 ?auto_2106922 ?auto_2106923 ?auto_2106924 ?auto_2106925 ?auto_2106926 ?auto_2106927 ?auto_2106928 ?auto_2106929 ?auto_2106930 ?auto_2106931 ?auto_2106932 ?auto_2106933 ?auto_2106934 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107144 - SURFACE
      ?auto_2107145 - SURFACE
      ?auto_2107146 - SURFACE
      ?auto_2107147 - SURFACE
      ?auto_2107148 - SURFACE
      ?auto_2107149 - SURFACE
      ?auto_2107150 - SURFACE
      ?auto_2107151 - SURFACE
      ?auto_2107152 - SURFACE
      ?auto_2107153 - SURFACE
      ?auto_2107154 - SURFACE
      ?auto_2107155 - SURFACE
      ?auto_2107156 - SURFACE
      ?auto_2107157 - SURFACE
      ?auto_2107158 - SURFACE
      ?auto_2107159 - SURFACE
    )
    :vars
    (
      ?auto_2107161 - HOIST
      ?auto_2107165 - PLACE
      ?auto_2107163 - TRUCK
      ?auto_2107162 - PLACE
      ?auto_2107160 - HOIST
      ?auto_2107164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107161 ?auto_2107165 ) ( SURFACE-AT ?auto_2107158 ?auto_2107165 ) ( CLEAR ?auto_2107158 ) ( IS-CRATE ?auto_2107159 ) ( not ( = ?auto_2107158 ?auto_2107159 ) ) ( AVAILABLE ?auto_2107161 ) ( ON ?auto_2107158 ?auto_2107157 ) ( not ( = ?auto_2107157 ?auto_2107158 ) ) ( not ( = ?auto_2107157 ?auto_2107159 ) ) ( TRUCK-AT ?auto_2107163 ?auto_2107162 ) ( not ( = ?auto_2107162 ?auto_2107165 ) ) ( HOIST-AT ?auto_2107160 ?auto_2107162 ) ( not ( = ?auto_2107161 ?auto_2107160 ) ) ( AVAILABLE ?auto_2107160 ) ( SURFACE-AT ?auto_2107159 ?auto_2107162 ) ( ON ?auto_2107159 ?auto_2107164 ) ( CLEAR ?auto_2107159 ) ( not ( = ?auto_2107158 ?auto_2107164 ) ) ( not ( = ?auto_2107159 ?auto_2107164 ) ) ( not ( = ?auto_2107157 ?auto_2107164 ) ) ( ON ?auto_2107145 ?auto_2107144 ) ( ON ?auto_2107146 ?auto_2107145 ) ( ON ?auto_2107147 ?auto_2107146 ) ( ON ?auto_2107148 ?auto_2107147 ) ( ON ?auto_2107149 ?auto_2107148 ) ( ON ?auto_2107150 ?auto_2107149 ) ( ON ?auto_2107151 ?auto_2107150 ) ( ON ?auto_2107152 ?auto_2107151 ) ( ON ?auto_2107153 ?auto_2107152 ) ( ON ?auto_2107154 ?auto_2107153 ) ( ON ?auto_2107155 ?auto_2107154 ) ( ON ?auto_2107156 ?auto_2107155 ) ( ON ?auto_2107157 ?auto_2107156 ) ( not ( = ?auto_2107144 ?auto_2107145 ) ) ( not ( = ?auto_2107144 ?auto_2107146 ) ) ( not ( = ?auto_2107144 ?auto_2107147 ) ) ( not ( = ?auto_2107144 ?auto_2107148 ) ) ( not ( = ?auto_2107144 ?auto_2107149 ) ) ( not ( = ?auto_2107144 ?auto_2107150 ) ) ( not ( = ?auto_2107144 ?auto_2107151 ) ) ( not ( = ?auto_2107144 ?auto_2107152 ) ) ( not ( = ?auto_2107144 ?auto_2107153 ) ) ( not ( = ?auto_2107144 ?auto_2107154 ) ) ( not ( = ?auto_2107144 ?auto_2107155 ) ) ( not ( = ?auto_2107144 ?auto_2107156 ) ) ( not ( = ?auto_2107144 ?auto_2107157 ) ) ( not ( = ?auto_2107144 ?auto_2107158 ) ) ( not ( = ?auto_2107144 ?auto_2107159 ) ) ( not ( = ?auto_2107144 ?auto_2107164 ) ) ( not ( = ?auto_2107145 ?auto_2107146 ) ) ( not ( = ?auto_2107145 ?auto_2107147 ) ) ( not ( = ?auto_2107145 ?auto_2107148 ) ) ( not ( = ?auto_2107145 ?auto_2107149 ) ) ( not ( = ?auto_2107145 ?auto_2107150 ) ) ( not ( = ?auto_2107145 ?auto_2107151 ) ) ( not ( = ?auto_2107145 ?auto_2107152 ) ) ( not ( = ?auto_2107145 ?auto_2107153 ) ) ( not ( = ?auto_2107145 ?auto_2107154 ) ) ( not ( = ?auto_2107145 ?auto_2107155 ) ) ( not ( = ?auto_2107145 ?auto_2107156 ) ) ( not ( = ?auto_2107145 ?auto_2107157 ) ) ( not ( = ?auto_2107145 ?auto_2107158 ) ) ( not ( = ?auto_2107145 ?auto_2107159 ) ) ( not ( = ?auto_2107145 ?auto_2107164 ) ) ( not ( = ?auto_2107146 ?auto_2107147 ) ) ( not ( = ?auto_2107146 ?auto_2107148 ) ) ( not ( = ?auto_2107146 ?auto_2107149 ) ) ( not ( = ?auto_2107146 ?auto_2107150 ) ) ( not ( = ?auto_2107146 ?auto_2107151 ) ) ( not ( = ?auto_2107146 ?auto_2107152 ) ) ( not ( = ?auto_2107146 ?auto_2107153 ) ) ( not ( = ?auto_2107146 ?auto_2107154 ) ) ( not ( = ?auto_2107146 ?auto_2107155 ) ) ( not ( = ?auto_2107146 ?auto_2107156 ) ) ( not ( = ?auto_2107146 ?auto_2107157 ) ) ( not ( = ?auto_2107146 ?auto_2107158 ) ) ( not ( = ?auto_2107146 ?auto_2107159 ) ) ( not ( = ?auto_2107146 ?auto_2107164 ) ) ( not ( = ?auto_2107147 ?auto_2107148 ) ) ( not ( = ?auto_2107147 ?auto_2107149 ) ) ( not ( = ?auto_2107147 ?auto_2107150 ) ) ( not ( = ?auto_2107147 ?auto_2107151 ) ) ( not ( = ?auto_2107147 ?auto_2107152 ) ) ( not ( = ?auto_2107147 ?auto_2107153 ) ) ( not ( = ?auto_2107147 ?auto_2107154 ) ) ( not ( = ?auto_2107147 ?auto_2107155 ) ) ( not ( = ?auto_2107147 ?auto_2107156 ) ) ( not ( = ?auto_2107147 ?auto_2107157 ) ) ( not ( = ?auto_2107147 ?auto_2107158 ) ) ( not ( = ?auto_2107147 ?auto_2107159 ) ) ( not ( = ?auto_2107147 ?auto_2107164 ) ) ( not ( = ?auto_2107148 ?auto_2107149 ) ) ( not ( = ?auto_2107148 ?auto_2107150 ) ) ( not ( = ?auto_2107148 ?auto_2107151 ) ) ( not ( = ?auto_2107148 ?auto_2107152 ) ) ( not ( = ?auto_2107148 ?auto_2107153 ) ) ( not ( = ?auto_2107148 ?auto_2107154 ) ) ( not ( = ?auto_2107148 ?auto_2107155 ) ) ( not ( = ?auto_2107148 ?auto_2107156 ) ) ( not ( = ?auto_2107148 ?auto_2107157 ) ) ( not ( = ?auto_2107148 ?auto_2107158 ) ) ( not ( = ?auto_2107148 ?auto_2107159 ) ) ( not ( = ?auto_2107148 ?auto_2107164 ) ) ( not ( = ?auto_2107149 ?auto_2107150 ) ) ( not ( = ?auto_2107149 ?auto_2107151 ) ) ( not ( = ?auto_2107149 ?auto_2107152 ) ) ( not ( = ?auto_2107149 ?auto_2107153 ) ) ( not ( = ?auto_2107149 ?auto_2107154 ) ) ( not ( = ?auto_2107149 ?auto_2107155 ) ) ( not ( = ?auto_2107149 ?auto_2107156 ) ) ( not ( = ?auto_2107149 ?auto_2107157 ) ) ( not ( = ?auto_2107149 ?auto_2107158 ) ) ( not ( = ?auto_2107149 ?auto_2107159 ) ) ( not ( = ?auto_2107149 ?auto_2107164 ) ) ( not ( = ?auto_2107150 ?auto_2107151 ) ) ( not ( = ?auto_2107150 ?auto_2107152 ) ) ( not ( = ?auto_2107150 ?auto_2107153 ) ) ( not ( = ?auto_2107150 ?auto_2107154 ) ) ( not ( = ?auto_2107150 ?auto_2107155 ) ) ( not ( = ?auto_2107150 ?auto_2107156 ) ) ( not ( = ?auto_2107150 ?auto_2107157 ) ) ( not ( = ?auto_2107150 ?auto_2107158 ) ) ( not ( = ?auto_2107150 ?auto_2107159 ) ) ( not ( = ?auto_2107150 ?auto_2107164 ) ) ( not ( = ?auto_2107151 ?auto_2107152 ) ) ( not ( = ?auto_2107151 ?auto_2107153 ) ) ( not ( = ?auto_2107151 ?auto_2107154 ) ) ( not ( = ?auto_2107151 ?auto_2107155 ) ) ( not ( = ?auto_2107151 ?auto_2107156 ) ) ( not ( = ?auto_2107151 ?auto_2107157 ) ) ( not ( = ?auto_2107151 ?auto_2107158 ) ) ( not ( = ?auto_2107151 ?auto_2107159 ) ) ( not ( = ?auto_2107151 ?auto_2107164 ) ) ( not ( = ?auto_2107152 ?auto_2107153 ) ) ( not ( = ?auto_2107152 ?auto_2107154 ) ) ( not ( = ?auto_2107152 ?auto_2107155 ) ) ( not ( = ?auto_2107152 ?auto_2107156 ) ) ( not ( = ?auto_2107152 ?auto_2107157 ) ) ( not ( = ?auto_2107152 ?auto_2107158 ) ) ( not ( = ?auto_2107152 ?auto_2107159 ) ) ( not ( = ?auto_2107152 ?auto_2107164 ) ) ( not ( = ?auto_2107153 ?auto_2107154 ) ) ( not ( = ?auto_2107153 ?auto_2107155 ) ) ( not ( = ?auto_2107153 ?auto_2107156 ) ) ( not ( = ?auto_2107153 ?auto_2107157 ) ) ( not ( = ?auto_2107153 ?auto_2107158 ) ) ( not ( = ?auto_2107153 ?auto_2107159 ) ) ( not ( = ?auto_2107153 ?auto_2107164 ) ) ( not ( = ?auto_2107154 ?auto_2107155 ) ) ( not ( = ?auto_2107154 ?auto_2107156 ) ) ( not ( = ?auto_2107154 ?auto_2107157 ) ) ( not ( = ?auto_2107154 ?auto_2107158 ) ) ( not ( = ?auto_2107154 ?auto_2107159 ) ) ( not ( = ?auto_2107154 ?auto_2107164 ) ) ( not ( = ?auto_2107155 ?auto_2107156 ) ) ( not ( = ?auto_2107155 ?auto_2107157 ) ) ( not ( = ?auto_2107155 ?auto_2107158 ) ) ( not ( = ?auto_2107155 ?auto_2107159 ) ) ( not ( = ?auto_2107155 ?auto_2107164 ) ) ( not ( = ?auto_2107156 ?auto_2107157 ) ) ( not ( = ?auto_2107156 ?auto_2107158 ) ) ( not ( = ?auto_2107156 ?auto_2107159 ) ) ( not ( = ?auto_2107156 ?auto_2107164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107157 ?auto_2107158 ?auto_2107159 )
      ( MAKE-15CRATE-VERIFY ?auto_2107144 ?auto_2107145 ?auto_2107146 ?auto_2107147 ?auto_2107148 ?auto_2107149 ?auto_2107150 ?auto_2107151 ?auto_2107152 ?auto_2107153 ?auto_2107154 ?auto_2107155 ?auto_2107156 ?auto_2107157 ?auto_2107158 ?auto_2107159 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107370 - SURFACE
      ?auto_2107371 - SURFACE
      ?auto_2107372 - SURFACE
      ?auto_2107373 - SURFACE
      ?auto_2107374 - SURFACE
      ?auto_2107375 - SURFACE
      ?auto_2107376 - SURFACE
      ?auto_2107377 - SURFACE
      ?auto_2107378 - SURFACE
      ?auto_2107379 - SURFACE
      ?auto_2107380 - SURFACE
      ?auto_2107381 - SURFACE
      ?auto_2107382 - SURFACE
      ?auto_2107383 - SURFACE
      ?auto_2107384 - SURFACE
      ?auto_2107385 - SURFACE
    )
    :vars
    (
      ?auto_2107389 - HOIST
      ?auto_2107390 - PLACE
      ?auto_2107388 - PLACE
      ?auto_2107391 - HOIST
      ?auto_2107386 - SURFACE
      ?auto_2107387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107389 ?auto_2107390 ) ( SURFACE-AT ?auto_2107384 ?auto_2107390 ) ( CLEAR ?auto_2107384 ) ( IS-CRATE ?auto_2107385 ) ( not ( = ?auto_2107384 ?auto_2107385 ) ) ( AVAILABLE ?auto_2107389 ) ( ON ?auto_2107384 ?auto_2107383 ) ( not ( = ?auto_2107383 ?auto_2107384 ) ) ( not ( = ?auto_2107383 ?auto_2107385 ) ) ( not ( = ?auto_2107388 ?auto_2107390 ) ) ( HOIST-AT ?auto_2107391 ?auto_2107388 ) ( not ( = ?auto_2107389 ?auto_2107391 ) ) ( AVAILABLE ?auto_2107391 ) ( SURFACE-AT ?auto_2107385 ?auto_2107388 ) ( ON ?auto_2107385 ?auto_2107386 ) ( CLEAR ?auto_2107385 ) ( not ( = ?auto_2107384 ?auto_2107386 ) ) ( not ( = ?auto_2107385 ?auto_2107386 ) ) ( not ( = ?auto_2107383 ?auto_2107386 ) ) ( TRUCK-AT ?auto_2107387 ?auto_2107390 ) ( ON ?auto_2107371 ?auto_2107370 ) ( ON ?auto_2107372 ?auto_2107371 ) ( ON ?auto_2107373 ?auto_2107372 ) ( ON ?auto_2107374 ?auto_2107373 ) ( ON ?auto_2107375 ?auto_2107374 ) ( ON ?auto_2107376 ?auto_2107375 ) ( ON ?auto_2107377 ?auto_2107376 ) ( ON ?auto_2107378 ?auto_2107377 ) ( ON ?auto_2107379 ?auto_2107378 ) ( ON ?auto_2107380 ?auto_2107379 ) ( ON ?auto_2107381 ?auto_2107380 ) ( ON ?auto_2107382 ?auto_2107381 ) ( ON ?auto_2107383 ?auto_2107382 ) ( not ( = ?auto_2107370 ?auto_2107371 ) ) ( not ( = ?auto_2107370 ?auto_2107372 ) ) ( not ( = ?auto_2107370 ?auto_2107373 ) ) ( not ( = ?auto_2107370 ?auto_2107374 ) ) ( not ( = ?auto_2107370 ?auto_2107375 ) ) ( not ( = ?auto_2107370 ?auto_2107376 ) ) ( not ( = ?auto_2107370 ?auto_2107377 ) ) ( not ( = ?auto_2107370 ?auto_2107378 ) ) ( not ( = ?auto_2107370 ?auto_2107379 ) ) ( not ( = ?auto_2107370 ?auto_2107380 ) ) ( not ( = ?auto_2107370 ?auto_2107381 ) ) ( not ( = ?auto_2107370 ?auto_2107382 ) ) ( not ( = ?auto_2107370 ?auto_2107383 ) ) ( not ( = ?auto_2107370 ?auto_2107384 ) ) ( not ( = ?auto_2107370 ?auto_2107385 ) ) ( not ( = ?auto_2107370 ?auto_2107386 ) ) ( not ( = ?auto_2107371 ?auto_2107372 ) ) ( not ( = ?auto_2107371 ?auto_2107373 ) ) ( not ( = ?auto_2107371 ?auto_2107374 ) ) ( not ( = ?auto_2107371 ?auto_2107375 ) ) ( not ( = ?auto_2107371 ?auto_2107376 ) ) ( not ( = ?auto_2107371 ?auto_2107377 ) ) ( not ( = ?auto_2107371 ?auto_2107378 ) ) ( not ( = ?auto_2107371 ?auto_2107379 ) ) ( not ( = ?auto_2107371 ?auto_2107380 ) ) ( not ( = ?auto_2107371 ?auto_2107381 ) ) ( not ( = ?auto_2107371 ?auto_2107382 ) ) ( not ( = ?auto_2107371 ?auto_2107383 ) ) ( not ( = ?auto_2107371 ?auto_2107384 ) ) ( not ( = ?auto_2107371 ?auto_2107385 ) ) ( not ( = ?auto_2107371 ?auto_2107386 ) ) ( not ( = ?auto_2107372 ?auto_2107373 ) ) ( not ( = ?auto_2107372 ?auto_2107374 ) ) ( not ( = ?auto_2107372 ?auto_2107375 ) ) ( not ( = ?auto_2107372 ?auto_2107376 ) ) ( not ( = ?auto_2107372 ?auto_2107377 ) ) ( not ( = ?auto_2107372 ?auto_2107378 ) ) ( not ( = ?auto_2107372 ?auto_2107379 ) ) ( not ( = ?auto_2107372 ?auto_2107380 ) ) ( not ( = ?auto_2107372 ?auto_2107381 ) ) ( not ( = ?auto_2107372 ?auto_2107382 ) ) ( not ( = ?auto_2107372 ?auto_2107383 ) ) ( not ( = ?auto_2107372 ?auto_2107384 ) ) ( not ( = ?auto_2107372 ?auto_2107385 ) ) ( not ( = ?auto_2107372 ?auto_2107386 ) ) ( not ( = ?auto_2107373 ?auto_2107374 ) ) ( not ( = ?auto_2107373 ?auto_2107375 ) ) ( not ( = ?auto_2107373 ?auto_2107376 ) ) ( not ( = ?auto_2107373 ?auto_2107377 ) ) ( not ( = ?auto_2107373 ?auto_2107378 ) ) ( not ( = ?auto_2107373 ?auto_2107379 ) ) ( not ( = ?auto_2107373 ?auto_2107380 ) ) ( not ( = ?auto_2107373 ?auto_2107381 ) ) ( not ( = ?auto_2107373 ?auto_2107382 ) ) ( not ( = ?auto_2107373 ?auto_2107383 ) ) ( not ( = ?auto_2107373 ?auto_2107384 ) ) ( not ( = ?auto_2107373 ?auto_2107385 ) ) ( not ( = ?auto_2107373 ?auto_2107386 ) ) ( not ( = ?auto_2107374 ?auto_2107375 ) ) ( not ( = ?auto_2107374 ?auto_2107376 ) ) ( not ( = ?auto_2107374 ?auto_2107377 ) ) ( not ( = ?auto_2107374 ?auto_2107378 ) ) ( not ( = ?auto_2107374 ?auto_2107379 ) ) ( not ( = ?auto_2107374 ?auto_2107380 ) ) ( not ( = ?auto_2107374 ?auto_2107381 ) ) ( not ( = ?auto_2107374 ?auto_2107382 ) ) ( not ( = ?auto_2107374 ?auto_2107383 ) ) ( not ( = ?auto_2107374 ?auto_2107384 ) ) ( not ( = ?auto_2107374 ?auto_2107385 ) ) ( not ( = ?auto_2107374 ?auto_2107386 ) ) ( not ( = ?auto_2107375 ?auto_2107376 ) ) ( not ( = ?auto_2107375 ?auto_2107377 ) ) ( not ( = ?auto_2107375 ?auto_2107378 ) ) ( not ( = ?auto_2107375 ?auto_2107379 ) ) ( not ( = ?auto_2107375 ?auto_2107380 ) ) ( not ( = ?auto_2107375 ?auto_2107381 ) ) ( not ( = ?auto_2107375 ?auto_2107382 ) ) ( not ( = ?auto_2107375 ?auto_2107383 ) ) ( not ( = ?auto_2107375 ?auto_2107384 ) ) ( not ( = ?auto_2107375 ?auto_2107385 ) ) ( not ( = ?auto_2107375 ?auto_2107386 ) ) ( not ( = ?auto_2107376 ?auto_2107377 ) ) ( not ( = ?auto_2107376 ?auto_2107378 ) ) ( not ( = ?auto_2107376 ?auto_2107379 ) ) ( not ( = ?auto_2107376 ?auto_2107380 ) ) ( not ( = ?auto_2107376 ?auto_2107381 ) ) ( not ( = ?auto_2107376 ?auto_2107382 ) ) ( not ( = ?auto_2107376 ?auto_2107383 ) ) ( not ( = ?auto_2107376 ?auto_2107384 ) ) ( not ( = ?auto_2107376 ?auto_2107385 ) ) ( not ( = ?auto_2107376 ?auto_2107386 ) ) ( not ( = ?auto_2107377 ?auto_2107378 ) ) ( not ( = ?auto_2107377 ?auto_2107379 ) ) ( not ( = ?auto_2107377 ?auto_2107380 ) ) ( not ( = ?auto_2107377 ?auto_2107381 ) ) ( not ( = ?auto_2107377 ?auto_2107382 ) ) ( not ( = ?auto_2107377 ?auto_2107383 ) ) ( not ( = ?auto_2107377 ?auto_2107384 ) ) ( not ( = ?auto_2107377 ?auto_2107385 ) ) ( not ( = ?auto_2107377 ?auto_2107386 ) ) ( not ( = ?auto_2107378 ?auto_2107379 ) ) ( not ( = ?auto_2107378 ?auto_2107380 ) ) ( not ( = ?auto_2107378 ?auto_2107381 ) ) ( not ( = ?auto_2107378 ?auto_2107382 ) ) ( not ( = ?auto_2107378 ?auto_2107383 ) ) ( not ( = ?auto_2107378 ?auto_2107384 ) ) ( not ( = ?auto_2107378 ?auto_2107385 ) ) ( not ( = ?auto_2107378 ?auto_2107386 ) ) ( not ( = ?auto_2107379 ?auto_2107380 ) ) ( not ( = ?auto_2107379 ?auto_2107381 ) ) ( not ( = ?auto_2107379 ?auto_2107382 ) ) ( not ( = ?auto_2107379 ?auto_2107383 ) ) ( not ( = ?auto_2107379 ?auto_2107384 ) ) ( not ( = ?auto_2107379 ?auto_2107385 ) ) ( not ( = ?auto_2107379 ?auto_2107386 ) ) ( not ( = ?auto_2107380 ?auto_2107381 ) ) ( not ( = ?auto_2107380 ?auto_2107382 ) ) ( not ( = ?auto_2107380 ?auto_2107383 ) ) ( not ( = ?auto_2107380 ?auto_2107384 ) ) ( not ( = ?auto_2107380 ?auto_2107385 ) ) ( not ( = ?auto_2107380 ?auto_2107386 ) ) ( not ( = ?auto_2107381 ?auto_2107382 ) ) ( not ( = ?auto_2107381 ?auto_2107383 ) ) ( not ( = ?auto_2107381 ?auto_2107384 ) ) ( not ( = ?auto_2107381 ?auto_2107385 ) ) ( not ( = ?auto_2107381 ?auto_2107386 ) ) ( not ( = ?auto_2107382 ?auto_2107383 ) ) ( not ( = ?auto_2107382 ?auto_2107384 ) ) ( not ( = ?auto_2107382 ?auto_2107385 ) ) ( not ( = ?auto_2107382 ?auto_2107386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107383 ?auto_2107384 ?auto_2107385 )
      ( MAKE-15CRATE-VERIFY ?auto_2107370 ?auto_2107371 ?auto_2107372 ?auto_2107373 ?auto_2107374 ?auto_2107375 ?auto_2107376 ?auto_2107377 ?auto_2107378 ?auto_2107379 ?auto_2107380 ?auto_2107381 ?auto_2107382 ?auto_2107383 ?auto_2107384 ?auto_2107385 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107596 - SURFACE
      ?auto_2107597 - SURFACE
      ?auto_2107598 - SURFACE
      ?auto_2107599 - SURFACE
      ?auto_2107600 - SURFACE
      ?auto_2107601 - SURFACE
      ?auto_2107602 - SURFACE
      ?auto_2107603 - SURFACE
      ?auto_2107604 - SURFACE
      ?auto_2107605 - SURFACE
      ?auto_2107606 - SURFACE
      ?auto_2107607 - SURFACE
      ?auto_2107608 - SURFACE
      ?auto_2107609 - SURFACE
      ?auto_2107610 - SURFACE
      ?auto_2107611 - SURFACE
    )
    :vars
    (
      ?auto_2107617 - HOIST
      ?auto_2107615 - PLACE
      ?auto_2107612 - PLACE
      ?auto_2107614 - HOIST
      ?auto_2107616 - SURFACE
      ?auto_2107613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107617 ?auto_2107615 ) ( IS-CRATE ?auto_2107611 ) ( not ( = ?auto_2107610 ?auto_2107611 ) ) ( not ( = ?auto_2107609 ?auto_2107610 ) ) ( not ( = ?auto_2107609 ?auto_2107611 ) ) ( not ( = ?auto_2107612 ?auto_2107615 ) ) ( HOIST-AT ?auto_2107614 ?auto_2107612 ) ( not ( = ?auto_2107617 ?auto_2107614 ) ) ( AVAILABLE ?auto_2107614 ) ( SURFACE-AT ?auto_2107611 ?auto_2107612 ) ( ON ?auto_2107611 ?auto_2107616 ) ( CLEAR ?auto_2107611 ) ( not ( = ?auto_2107610 ?auto_2107616 ) ) ( not ( = ?auto_2107611 ?auto_2107616 ) ) ( not ( = ?auto_2107609 ?auto_2107616 ) ) ( TRUCK-AT ?auto_2107613 ?auto_2107615 ) ( SURFACE-AT ?auto_2107609 ?auto_2107615 ) ( CLEAR ?auto_2107609 ) ( LIFTING ?auto_2107617 ?auto_2107610 ) ( IS-CRATE ?auto_2107610 ) ( ON ?auto_2107597 ?auto_2107596 ) ( ON ?auto_2107598 ?auto_2107597 ) ( ON ?auto_2107599 ?auto_2107598 ) ( ON ?auto_2107600 ?auto_2107599 ) ( ON ?auto_2107601 ?auto_2107600 ) ( ON ?auto_2107602 ?auto_2107601 ) ( ON ?auto_2107603 ?auto_2107602 ) ( ON ?auto_2107604 ?auto_2107603 ) ( ON ?auto_2107605 ?auto_2107604 ) ( ON ?auto_2107606 ?auto_2107605 ) ( ON ?auto_2107607 ?auto_2107606 ) ( ON ?auto_2107608 ?auto_2107607 ) ( ON ?auto_2107609 ?auto_2107608 ) ( not ( = ?auto_2107596 ?auto_2107597 ) ) ( not ( = ?auto_2107596 ?auto_2107598 ) ) ( not ( = ?auto_2107596 ?auto_2107599 ) ) ( not ( = ?auto_2107596 ?auto_2107600 ) ) ( not ( = ?auto_2107596 ?auto_2107601 ) ) ( not ( = ?auto_2107596 ?auto_2107602 ) ) ( not ( = ?auto_2107596 ?auto_2107603 ) ) ( not ( = ?auto_2107596 ?auto_2107604 ) ) ( not ( = ?auto_2107596 ?auto_2107605 ) ) ( not ( = ?auto_2107596 ?auto_2107606 ) ) ( not ( = ?auto_2107596 ?auto_2107607 ) ) ( not ( = ?auto_2107596 ?auto_2107608 ) ) ( not ( = ?auto_2107596 ?auto_2107609 ) ) ( not ( = ?auto_2107596 ?auto_2107610 ) ) ( not ( = ?auto_2107596 ?auto_2107611 ) ) ( not ( = ?auto_2107596 ?auto_2107616 ) ) ( not ( = ?auto_2107597 ?auto_2107598 ) ) ( not ( = ?auto_2107597 ?auto_2107599 ) ) ( not ( = ?auto_2107597 ?auto_2107600 ) ) ( not ( = ?auto_2107597 ?auto_2107601 ) ) ( not ( = ?auto_2107597 ?auto_2107602 ) ) ( not ( = ?auto_2107597 ?auto_2107603 ) ) ( not ( = ?auto_2107597 ?auto_2107604 ) ) ( not ( = ?auto_2107597 ?auto_2107605 ) ) ( not ( = ?auto_2107597 ?auto_2107606 ) ) ( not ( = ?auto_2107597 ?auto_2107607 ) ) ( not ( = ?auto_2107597 ?auto_2107608 ) ) ( not ( = ?auto_2107597 ?auto_2107609 ) ) ( not ( = ?auto_2107597 ?auto_2107610 ) ) ( not ( = ?auto_2107597 ?auto_2107611 ) ) ( not ( = ?auto_2107597 ?auto_2107616 ) ) ( not ( = ?auto_2107598 ?auto_2107599 ) ) ( not ( = ?auto_2107598 ?auto_2107600 ) ) ( not ( = ?auto_2107598 ?auto_2107601 ) ) ( not ( = ?auto_2107598 ?auto_2107602 ) ) ( not ( = ?auto_2107598 ?auto_2107603 ) ) ( not ( = ?auto_2107598 ?auto_2107604 ) ) ( not ( = ?auto_2107598 ?auto_2107605 ) ) ( not ( = ?auto_2107598 ?auto_2107606 ) ) ( not ( = ?auto_2107598 ?auto_2107607 ) ) ( not ( = ?auto_2107598 ?auto_2107608 ) ) ( not ( = ?auto_2107598 ?auto_2107609 ) ) ( not ( = ?auto_2107598 ?auto_2107610 ) ) ( not ( = ?auto_2107598 ?auto_2107611 ) ) ( not ( = ?auto_2107598 ?auto_2107616 ) ) ( not ( = ?auto_2107599 ?auto_2107600 ) ) ( not ( = ?auto_2107599 ?auto_2107601 ) ) ( not ( = ?auto_2107599 ?auto_2107602 ) ) ( not ( = ?auto_2107599 ?auto_2107603 ) ) ( not ( = ?auto_2107599 ?auto_2107604 ) ) ( not ( = ?auto_2107599 ?auto_2107605 ) ) ( not ( = ?auto_2107599 ?auto_2107606 ) ) ( not ( = ?auto_2107599 ?auto_2107607 ) ) ( not ( = ?auto_2107599 ?auto_2107608 ) ) ( not ( = ?auto_2107599 ?auto_2107609 ) ) ( not ( = ?auto_2107599 ?auto_2107610 ) ) ( not ( = ?auto_2107599 ?auto_2107611 ) ) ( not ( = ?auto_2107599 ?auto_2107616 ) ) ( not ( = ?auto_2107600 ?auto_2107601 ) ) ( not ( = ?auto_2107600 ?auto_2107602 ) ) ( not ( = ?auto_2107600 ?auto_2107603 ) ) ( not ( = ?auto_2107600 ?auto_2107604 ) ) ( not ( = ?auto_2107600 ?auto_2107605 ) ) ( not ( = ?auto_2107600 ?auto_2107606 ) ) ( not ( = ?auto_2107600 ?auto_2107607 ) ) ( not ( = ?auto_2107600 ?auto_2107608 ) ) ( not ( = ?auto_2107600 ?auto_2107609 ) ) ( not ( = ?auto_2107600 ?auto_2107610 ) ) ( not ( = ?auto_2107600 ?auto_2107611 ) ) ( not ( = ?auto_2107600 ?auto_2107616 ) ) ( not ( = ?auto_2107601 ?auto_2107602 ) ) ( not ( = ?auto_2107601 ?auto_2107603 ) ) ( not ( = ?auto_2107601 ?auto_2107604 ) ) ( not ( = ?auto_2107601 ?auto_2107605 ) ) ( not ( = ?auto_2107601 ?auto_2107606 ) ) ( not ( = ?auto_2107601 ?auto_2107607 ) ) ( not ( = ?auto_2107601 ?auto_2107608 ) ) ( not ( = ?auto_2107601 ?auto_2107609 ) ) ( not ( = ?auto_2107601 ?auto_2107610 ) ) ( not ( = ?auto_2107601 ?auto_2107611 ) ) ( not ( = ?auto_2107601 ?auto_2107616 ) ) ( not ( = ?auto_2107602 ?auto_2107603 ) ) ( not ( = ?auto_2107602 ?auto_2107604 ) ) ( not ( = ?auto_2107602 ?auto_2107605 ) ) ( not ( = ?auto_2107602 ?auto_2107606 ) ) ( not ( = ?auto_2107602 ?auto_2107607 ) ) ( not ( = ?auto_2107602 ?auto_2107608 ) ) ( not ( = ?auto_2107602 ?auto_2107609 ) ) ( not ( = ?auto_2107602 ?auto_2107610 ) ) ( not ( = ?auto_2107602 ?auto_2107611 ) ) ( not ( = ?auto_2107602 ?auto_2107616 ) ) ( not ( = ?auto_2107603 ?auto_2107604 ) ) ( not ( = ?auto_2107603 ?auto_2107605 ) ) ( not ( = ?auto_2107603 ?auto_2107606 ) ) ( not ( = ?auto_2107603 ?auto_2107607 ) ) ( not ( = ?auto_2107603 ?auto_2107608 ) ) ( not ( = ?auto_2107603 ?auto_2107609 ) ) ( not ( = ?auto_2107603 ?auto_2107610 ) ) ( not ( = ?auto_2107603 ?auto_2107611 ) ) ( not ( = ?auto_2107603 ?auto_2107616 ) ) ( not ( = ?auto_2107604 ?auto_2107605 ) ) ( not ( = ?auto_2107604 ?auto_2107606 ) ) ( not ( = ?auto_2107604 ?auto_2107607 ) ) ( not ( = ?auto_2107604 ?auto_2107608 ) ) ( not ( = ?auto_2107604 ?auto_2107609 ) ) ( not ( = ?auto_2107604 ?auto_2107610 ) ) ( not ( = ?auto_2107604 ?auto_2107611 ) ) ( not ( = ?auto_2107604 ?auto_2107616 ) ) ( not ( = ?auto_2107605 ?auto_2107606 ) ) ( not ( = ?auto_2107605 ?auto_2107607 ) ) ( not ( = ?auto_2107605 ?auto_2107608 ) ) ( not ( = ?auto_2107605 ?auto_2107609 ) ) ( not ( = ?auto_2107605 ?auto_2107610 ) ) ( not ( = ?auto_2107605 ?auto_2107611 ) ) ( not ( = ?auto_2107605 ?auto_2107616 ) ) ( not ( = ?auto_2107606 ?auto_2107607 ) ) ( not ( = ?auto_2107606 ?auto_2107608 ) ) ( not ( = ?auto_2107606 ?auto_2107609 ) ) ( not ( = ?auto_2107606 ?auto_2107610 ) ) ( not ( = ?auto_2107606 ?auto_2107611 ) ) ( not ( = ?auto_2107606 ?auto_2107616 ) ) ( not ( = ?auto_2107607 ?auto_2107608 ) ) ( not ( = ?auto_2107607 ?auto_2107609 ) ) ( not ( = ?auto_2107607 ?auto_2107610 ) ) ( not ( = ?auto_2107607 ?auto_2107611 ) ) ( not ( = ?auto_2107607 ?auto_2107616 ) ) ( not ( = ?auto_2107608 ?auto_2107609 ) ) ( not ( = ?auto_2107608 ?auto_2107610 ) ) ( not ( = ?auto_2107608 ?auto_2107611 ) ) ( not ( = ?auto_2107608 ?auto_2107616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107609 ?auto_2107610 ?auto_2107611 )
      ( MAKE-15CRATE-VERIFY ?auto_2107596 ?auto_2107597 ?auto_2107598 ?auto_2107599 ?auto_2107600 ?auto_2107601 ?auto_2107602 ?auto_2107603 ?auto_2107604 ?auto_2107605 ?auto_2107606 ?auto_2107607 ?auto_2107608 ?auto_2107609 ?auto_2107610 ?auto_2107611 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107822 - SURFACE
      ?auto_2107823 - SURFACE
      ?auto_2107824 - SURFACE
      ?auto_2107825 - SURFACE
      ?auto_2107826 - SURFACE
      ?auto_2107827 - SURFACE
      ?auto_2107828 - SURFACE
      ?auto_2107829 - SURFACE
      ?auto_2107830 - SURFACE
      ?auto_2107831 - SURFACE
      ?auto_2107832 - SURFACE
      ?auto_2107833 - SURFACE
      ?auto_2107834 - SURFACE
      ?auto_2107835 - SURFACE
      ?auto_2107836 - SURFACE
      ?auto_2107837 - SURFACE
    )
    :vars
    (
      ?auto_2107839 - HOIST
      ?auto_2107841 - PLACE
      ?auto_2107843 - PLACE
      ?auto_2107838 - HOIST
      ?auto_2107840 - SURFACE
      ?auto_2107842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107839 ?auto_2107841 ) ( IS-CRATE ?auto_2107837 ) ( not ( = ?auto_2107836 ?auto_2107837 ) ) ( not ( = ?auto_2107835 ?auto_2107836 ) ) ( not ( = ?auto_2107835 ?auto_2107837 ) ) ( not ( = ?auto_2107843 ?auto_2107841 ) ) ( HOIST-AT ?auto_2107838 ?auto_2107843 ) ( not ( = ?auto_2107839 ?auto_2107838 ) ) ( AVAILABLE ?auto_2107838 ) ( SURFACE-AT ?auto_2107837 ?auto_2107843 ) ( ON ?auto_2107837 ?auto_2107840 ) ( CLEAR ?auto_2107837 ) ( not ( = ?auto_2107836 ?auto_2107840 ) ) ( not ( = ?auto_2107837 ?auto_2107840 ) ) ( not ( = ?auto_2107835 ?auto_2107840 ) ) ( TRUCK-AT ?auto_2107842 ?auto_2107841 ) ( SURFACE-AT ?auto_2107835 ?auto_2107841 ) ( CLEAR ?auto_2107835 ) ( IS-CRATE ?auto_2107836 ) ( AVAILABLE ?auto_2107839 ) ( IN ?auto_2107836 ?auto_2107842 ) ( ON ?auto_2107823 ?auto_2107822 ) ( ON ?auto_2107824 ?auto_2107823 ) ( ON ?auto_2107825 ?auto_2107824 ) ( ON ?auto_2107826 ?auto_2107825 ) ( ON ?auto_2107827 ?auto_2107826 ) ( ON ?auto_2107828 ?auto_2107827 ) ( ON ?auto_2107829 ?auto_2107828 ) ( ON ?auto_2107830 ?auto_2107829 ) ( ON ?auto_2107831 ?auto_2107830 ) ( ON ?auto_2107832 ?auto_2107831 ) ( ON ?auto_2107833 ?auto_2107832 ) ( ON ?auto_2107834 ?auto_2107833 ) ( ON ?auto_2107835 ?auto_2107834 ) ( not ( = ?auto_2107822 ?auto_2107823 ) ) ( not ( = ?auto_2107822 ?auto_2107824 ) ) ( not ( = ?auto_2107822 ?auto_2107825 ) ) ( not ( = ?auto_2107822 ?auto_2107826 ) ) ( not ( = ?auto_2107822 ?auto_2107827 ) ) ( not ( = ?auto_2107822 ?auto_2107828 ) ) ( not ( = ?auto_2107822 ?auto_2107829 ) ) ( not ( = ?auto_2107822 ?auto_2107830 ) ) ( not ( = ?auto_2107822 ?auto_2107831 ) ) ( not ( = ?auto_2107822 ?auto_2107832 ) ) ( not ( = ?auto_2107822 ?auto_2107833 ) ) ( not ( = ?auto_2107822 ?auto_2107834 ) ) ( not ( = ?auto_2107822 ?auto_2107835 ) ) ( not ( = ?auto_2107822 ?auto_2107836 ) ) ( not ( = ?auto_2107822 ?auto_2107837 ) ) ( not ( = ?auto_2107822 ?auto_2107840 ) ) ( not ( = ?auto_2107823 ?auto_2107824 ) ) ( not ( = ?auto_2107823 ?auto_2107825 ) ) ( not ( = ?auto_2107823 ?auto_2107826 ) ) ( not ( = ?auto_2107823 ?auto_2107827 ) ) ( not ( = ?auto_2107823 ?auto_2107828 ) ) ( not ( = ?auto_2107823 ?auto_2107829 ) ) ( not ( = ?auto_2107823 ?auto_2107830 ) ) ( not ( = ?auto_2107823 ?auto_2107831 ) ) ( not ( = ?auto_2107823 ?auto_2107832 ) ) ( not ( = ?auto_2107823 ?auto_2107833 ) ) ( not ( = ?auto_2107823 ?auto_2107834 ) ) ( not ( = ?auto_2107823 ?auto_2107835 ) ) ( not ( = ?auto_2107823 ?auto_2107836 ) ) ( not ( = ?auto_2107823 ?auto_2107837 ) ) ( not ( = ?auto_2107823 ?auto_2107840 ) ) ( not ( = ?auto_2107824 ?auto_2107825 ) ) ( not ( = ?auto_2107824 ?auto_2107826 ) ) ( not ( = ?auto_2107824 ?auto_2107827 ) ) ( not ( = ?auto_2107824 ?auto_2107828 ) ) ( not ( = ?auto_2107824 ?auto_2107829 ) ) ( not ( = ?auto_2107824 ?auto_2107830 ) ) ( not ( = ?auto_2107824 ?auto_2107831 ) ) ( not ( = ?auto_2107824 ?auto_2107832 ) ) ( not ( = ?auto_2107824 ?auto_2107833 ) ) ( not ( = ?auto_2107824 ?auto_2107834 ) ) ( not ( = ?auto_2107824 ?auto_2107835 ) ) ( not ( = ?auto_2107824 ?auto_2107836 ) ) ( not ( = ?auto_2107824 ?auto_2107837 ) ) ( not ( = ?auto_2107824 ?auto_2107840 ) ) ( not ( = ?auto_2107825 ?auto_2107826 ) ) ( not ( = ?auto_2107825 ?auto_2107827 ) ) ( not ( = ?auto_2107825 ?auto_2107828 ) ) ( not ( = ?auto_2107825 ?auto_2107829 ) ) ( not ( = ?auto_2107825 ?auto_2107830 ) ) ( not ( = ?auto_2107825 ?auto_2107831 ) ) ( not ( = ?auto_2107825 ?auto_2107832 ) ) ( not ( = ?auto_2107825 ?auto_2107833 ) ) ( not ( = ?auto_2107825 ?auto_2107834 ) ) ( not ( = ?auto_2107825 ?auto_2107835 ) ) ( not ( = ?auto_2107825 ?auto_2107836 ) ) ( not ( = ?auto_2107825 ?auto_2107837 ) ) ( not ( = ?auto_2107825 ?auto_2107840 ) ) ( not ( = ?auto_2107826 ?auto_2107827 ) ) ( not ( = ?auto_2107826 ?auto_2107828 ) ) ( not ( = ?auto_2107826 ?auto_2107829 ) ) ( not ( = ?auto_2107826 ?auto_2107830 ) ) ( not ( = ?auto_2107826 ?auto_2107831 ) ) ( not ( = ?auto_2107826 ?auto_2107832 ) ) ( not ( = ?auto_2107826 ?auto_2107833 ) ) ( not ( = ?auto_2107826 ?auto_2107834 ) ) ( not ( = ?auto_2107826 ?auto_2107835 ) ) ( not ( = ?auto_2107826 ?auto_2107836 ) ) ( not ( = ?auto_2107826 ?auto_2107837 ) ) ( not ( = ?auto_2107826 ?auto_2107840 ) ) ( not ( = ?auto_2107827 ?auto_2107828 ) ) ( not ( = ?auto_2107827 ?auto_2107829 ) ) ( not ( = ?auto_2107827 ?auto_2107830 ) ) ( not ( = ?auto_2107827 ?auto_2107831 ) ) ( not ( = ?auto_2107827 ?auto_2107832 ) ) ( not ( = ?auto_2107827 ?auto_2107833 ) ) ( not ( = ?auto_2107827 ?auto_2107834 ) ) ( not ( = ?auto_2107827 ?auto_2107835 ) ) ( not ( = ?auto_2107827 ?auto_2107836 ) ) ( not ( = ?auto_2107827 ?auto_2107837 ) ) ( not ( = ?auto_2107827 ?auto_2107840 ) ) ( not ( = ?auto_2107828 ?auto_2107829 ) ) ( not ( = ?auto_2107828 ?auto_2107830 ) ) ( not ( = ?auto_2107828 ?auto_2107831 ) ) ( not ( = ?auto_2107828 ?auto_2107832 ) ) ( not ( = ?auto_2107828 ?auto_2107833 ) ) ( not ( = ?auto_2107828 ?auto_2107834 ) ) ( not ( = ?auto_2107828 ?auto_2107835 ) ) ( not ( = ?auto_2107828 ?auto_2107836 ) ) ( not ( = ?auto_2107828 ?auto_2107837 ) ) ( not ( = ?auto_2107828 ?auto_2107840 ) ) ( not ( = ?auto_2107829 ?auto_2107830 ) ) ( not ( = ?auto_2107829 ?auto_2107831 ) ) ( not ( = ?auto_2107829 ?auto_2107832 ) ) ( not ( = ?auto_2107829 ?auto_2107833 ) ) ( not ( = ?auto_2107829 ?auto_2107834 ) ) ( not ( = ?auto_2107829 ?auto_2107835 ) ) ( not ( = ?auto_2107829 ?auto_2107836 ) ) ( not ( = ?auto_2107829 ?auto_2107837 ) ) ( not ( = ?auto_2107829 ?auto_2107840 ) ) ( not ( = ?auto_2107830 ?auto_2107831 ) ) ( not ( = ?auto_2107830 ?auto_2107832 ) ) ( not ( = ?auto_2107830 ?auto_2107833 ) ) ( not ( = ?auto_2107830 ?auto_2107834 ) ) ( not ( = ?auto_2107830 ?auto_2107835 ) ) ( not ( = ?auto_2107830 ?auto_2107836 ) ) ( not ( = ?auto_2107830 ?auto_2107837 ) ) ( not ( = ?auto_2107830 ?auto_2107840 ) ) ( not ( = ?auto_2107831 ?auto_2107832 ) ) ( not ( = ?auto_2107831 ?auto_2107833 ) ) ( not ( = ?auto_2107831 ?auto_2107834 ) ) ( not ( = ?auto_2107831 ?auto_2107835 ) ) ( not ( = ?auto_2107831 ?auto_2107836 ) ) ( not ( = ?auto_2107831 ?auto_2107837 ) ) ( not ( = ?auto_2107831 ?auto_2107840 ) ) ( not ( = ?auto_2107832 ?auto_2107833 ) ) ( not ( = ?auto_2107832 ?auto_2107834 ) ) ( not ( = ?auto_2107832 ?auto_2107835 ) ) ( not ( = ?auto_2107832 ?auto_2107836 ) ) ( not ( = ?auto_2107832 ?auto_2107837 ) ) ( not ( = ?auto_2107832 ?auto_2107840 ) ) ( not ( = ?auto_2107833 ?auto_2107834 ) ) ( not ( = ?auto_2107833 ?auto_2107835 ) ) ( not ( = ?auto_2107833 ?auto_2107836 ) ) ( not ( = ?auto_2107833 ?auto_2107837 ) ) ( not ( = ?auto_2107833 ?auto_2107840 ) ) ( not ( = ?auto_2107834 ?auto_2107835 ) ) ( not ( = ?auto_2107834 ?auto_2107836 ) ) ( not ( = ?auto_2107834 ?auto_2107837 ) ) ( not ( = ?auto_2107834 ?auto_2107840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107835 ?auto_2107836 ?auto_2107837 )
      ( MAKE-15CRATE-VERIFY ?auto_2107822 ?auto_2107823 ?auto_2107824 ?auto_2107825 ?auto_2107826 ?auto_2107827 ?auto_2107828 ?auto_2107829 ?auto_2107830 ?auto_2107831 ?auto_2107832 ?auto_2107833 ?auto_2107834 ?auto_2107835 ?auto_2107836 ?auto_2107837 ) )
  )

)

