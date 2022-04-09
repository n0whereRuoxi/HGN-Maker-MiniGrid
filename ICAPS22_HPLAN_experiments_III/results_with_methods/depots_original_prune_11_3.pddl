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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516562 - SURFACE
      ?auto_516563 - SURFACE
    )
    :vars
    (
      ?auto_516564 - HOIST
      ?auto_516565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516564 ?auto_516565 ) ( SURFACE-AT ?auto_516562 ?auto_516565 ) ( CLEAR ?auto_516562 ) ( LIFTING ?auto_516564 ?auto_516563 ) ( IS-CRATE ?auto_516563 ) ( not ( = ?auto_516562 ?auto_516563 ) ) )
    :subtasks
    ( ( !DROP ?auto_516564 ?auto_516563 ?auto_516562 ?auto_516565 )
      ( MAKE-1CRATE-VERIFY ?auto_516562 ?auto_516563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516566 - SURFACE
      ?auto_516567 - SURFACE
    )
    :vars
    (
      ?auto_516569 - HOIST
      ?auto_516568 - PLACE
      ?auto_516570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516569 ?auto_516568 ) ( SURFACE-AT ?auto_516566 ?auto_516568 ) ( CLEAR ?auto_516566 ) ( IS-CRATE ?auto_516567 ) ( not ( = ?auto_516566 ?auto_516567 ) ) ( TRUCK-AT ?auto_516570 ?auto_516568 ) ( AVAILABLE ?auto_516569 ) ( IN ?auto_516567 ?auto_516570 ) )
    :subtasks
    ( ( !UNLOAD ?auto_516569 ?auto_516567 ?auto_516570 ?auto_516568 )
      ( MAKE-1CRATE ?auto_516566 ?auto_516567 )
      ( MAKE-1CRATE-VERIFY ?auto_516566 ?auto_516567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516571 - SURFACE
      ?auto_516572 - SURFACE
    )
    :vars
    (
      ?auto_516575 - HOIST
      ?auto_516573 - PLACE
      ?auto_516574 - TRUCK
      ?auto_516576 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516575 ?auto_516573 ) ( SURFACE-AT ?auto_516571 ?auto_516573 ) ( CLEAR ?auto_516571 ) ( IS-CRATE ?auto_516572 ) ( not ( = ?auto_516571 ?auto_516572 ) ) ( AVAILABLE ?auto_516575 ) ( IN ?auto_516572 ?auto_516574 ) ( TRUCK-AT ?auto_516574 ?auto_516576 ) ( not ( = ?auto_516576 ?auto_516573 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_516574 ?auto_516576 ?auto_516573 )
      ( MAKE-1CRATE ?auto_516571 ?auto_516572 )
      ( MAKE-1CRATE-VERIFY ?auto_516571 ?auto_516572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516577 - SURFACE
      ?auto_516578 - SURFACE
    )
    :vars
    (
      ?auto_516581 - HOIST
      ?auto_516580 - PLACE
      ?auto_516582 - TRUCK
      ?auto_516579 - PLACE
      ?auto_516583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_516581 ?auto_516580 ) ( SURFACE-AT ?auto_516577 ?auto_516580 ) ( CLEAR ?auto_516577 ) ( IS-CRATE ?auto_516578 ) ( not ( = ?auto_516577 ?auto_516578 ) ) ( AVAILABLE ?auto_516581 ) ( TRUCK-AT ?auto_516582 ?auto_516579 ) ( not ( = ?auto_516579 ?auto_516580 ) ) ( HOIST-AT ?auto_516583 ?auto_516579 ) ( LIFTING ?auto_516583 ?auto_516578 ) ( not ( = ?auto_516581 ?auto_516583 ) ) )
    :subtasks
    ( ( !LOAD ?auto_516583 ?auto_516578 ?auto_516582 ?auto_516579 )
      ( MAKE-1CRATE ?auto_516577 ?auto_516578 )
      ( MAKE-1CRATE-VERIFY ?auto_516577 ?auto_516578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516584 - SURFACE
      ?auto_516585 - SURFACE
    )
    :vars
    (
      ?auto_516587 - HOIST
      ?auto_516590 - PLACE
      ?auto_516588 - TRUCK
      ?auto_516589 - PLACE
      ?auto_516586 - HOIST
      ?auto_516591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516587 ?auto_516590 ) ( SURFACE-AT ?auto_516584 ?auto_516590 ) ( CLEAR ?auto_516584 ) ( IS-CRATE ?auto_516585 ) ( not ( = ?auto_516584 ?auto_516585 ) ) ( AVAILABLE ?auto_516587 ) ( TRUCK-AT ?auto_516588 ?auto_516589 ) ( not ( = ?auto_516589 ?auto_516590 ) ) ( HOIST-AT ?auto_516586 ?auto_516589 ) ( not ( = ?auto_516587 ?auto_516586 ) ) ( AVAILABLE ?auto_516586 ) ( SURFACE-AT ?auto_516585 ?auto_516589 ) ( ON ?auto_516585 ?auto_516591 ) ( CLEAR ?auto_516585 ) ( not ( = ?auto_516584 ?auto_516591 ) ) ( not ( = ?auto_516585 ?auto_516591 ) ) )
    :subtasks
    ( ( !LIFT ?auto_516586 ?auto_516585 ?auto_516591 ?auto_516589 )
      ( MAKE-1CRATE ?auto_516584 ?auto_516585 )
      ( MAKE-1CRATE-VERIFY ?auto_516584 ?auto_516585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516592 - SURFACE
      ?auto_516593 - SURFACE
    )
    :vars
    (
      ?auto_516596 - HOIST
      ?auto_516595 - PLACE
      ?auto_516597 - PLACE
      ?auto_516594 - HOIST
      ?auto_516598 - SURFACE
      ?auto_516599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516596 ?auto_516595 ) ( SURFACE-AT ?auto_516592 ?auto_516595 ) ( CLEAR ?auto_516592 ) ( IS-CRATE ?auto_516593 ) ( not ( = ?auto_516592 ?auto_516593 ) ) ( AVAILABLE ?auto_516596 ) ( not ( = ?auto_516597 ?auto_516595 ) ) ( HOIST-AT ?auto_516594 ?auto_516597 ) ( not ( = ?auto_516596 ?auto_516594 ) ) ( AVAILABLE ?auto_516594 ) ( SURFACE-AT ?auto_516593 ?auto_516597 ) ( ON ?auto_516593 ?auto_516598 ) ( CLEAR ?auto_516593 ) ( not ( = ?auto_516592 ?auto_516598 ) ) ( not ( = ?auto_516593 ?auto_516598 ) ) ( TRUCK-AT ?auto_516599 ?auto_516595 ) )
    :subtasks
    ( ( !DRIVE ?auto_516599 ?auto_516595 ?auto_516597 )
      ( MAKE-1CRATE ?auto_516592 ?auto_516593 )
      ( MAKE-1CRATE-VERIFY ?auto_516592 ?auto_516593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516609 - SURFACE
      ?auto_516610 - SURFACE
      ?auto_516611 - SURFACE
    )
    :vars
    (
      ?auto_516613 - HOIST
      ?auto_516612 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516613 ?auto_516612 ) ( SURFACE-AT ?auto_516610 ?auto_516612 ) ( CLEAR ?auto_516610 ) ( LIFTING ?auto_516613 ?auto_516611 ) ( IS-CRATE ?auto_516611 ) ( not ( = ?auto_516610 ?auto_516611 ) ) ( ON ?auto_516610 ?auto_516609 ) ( not ( = ?auto_516609 ?auto_516610 ) ) ( not ( = ?auto_516609 ?auto_516611 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516610 ?auto_516611 )
      ( MAKE-2CRATE-VERIFY ?auto_516609 ?auto_516610 ?auto_516611 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516619 - SURFACE
      ?auto_516620 - SURFACE
      ?auto_516621 - SURFACE
    )
    :vars
    (
      ?auto_516622 - HOIST
      ?auto_516624 - PLACE
      ?auto_516623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516622 ?auto_516624 ) ( SURFACE-AT ?auto_516620 ?auto_516624 ) ( CLEAR ?auto_516620 ) ( IS-CRATE ?auto_516621 ) ( not ( = ?auto_516620 ?auto_516621 ) ) ( TRUCK-AT ?auto_516623 ?auto_516624 ) ( AVAILABLE ?auto_516622 ) ( IN ?auto_516621 ?auto_516623 ) ( ON ?auto_516620 ?auto_516619 ) ( not ( = ?auto_516619 ?auto_516620 ) ) ( not ( = ?auto_516619 ?auto_516621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516620 ?auto_516621 )
      ( MAKE-2CRATE-VERIFY ?auto_516619 ?auto_516620 ?auto_516621 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516625 - SURFACE
      ?auto_516626 - SURFACE
    )
    :vars
    (
      ?auto_516628 - HOIST
      ?auto_516629 - PLACE
      ?auto_516627 - TRUCK
      ?auto_516630 - SURFACE
      ?auto_516631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516628 ?auto_516629 ) ( SURFACE-AT ?auto_516625 ?auto_516629 ) ( CLEAR ?auto_516625 ) ( IS-CRATE ?auto_516626 ) ( not ( = ?auto_516625 ?auto_516626 ) ) ( AVAILABLE ?auto_516628 ) ( IN ?auto_516626 ?auto_516627 ) ( ON ?auto_516625 ?auto_516630 ) ( not ( = ?auto_516630 ?auto_516625 ) ) ( not ( = ?auto_516630 ?auto_516626 ) ) ( TRUCK-AT ?auto_516627 ?auto_516631 ) ( not ( = ?auto_516631 ?auto_516629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_516627 ?auto_516631 ?auto_516629 )
      ( MAKE-2CRATE ?auto_516630 ?auto_516625 ?auto_516626 )
      ( MAKE-1CRATE-VERIFY ?auto_516625 ?auto_516626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516632 - SURFACE
      ?auto_516633 - SURFACE
      ?auto_516634 - SURFACE
    )
    :vars
    (
      ?auto_516637 - HOIST
      ?auto_516638 - PLACE
      ?auto_516636 - TRUCK
      ?auto_516635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516637 ?auto_516638 ) ( SURFACE-AT ?auto_516633 ?auto_516638 ) ( CLEAR ?auto_516633 ) ( IS-CRATE ?auto_516634 ) ( not ( = ?auto_516633 ?auto_516634 ) ) ( AVAILABLE ?auto_516637 ) ( IN ?auto_516634 ?auto_516636 ) ( ON ?auto_516633 ?auto_516632 ) ( not ( = ?auto_516632 ?auto_516633 ) ) ( not ( = ?auto_516632 ?auto_516634 ) ) ( TRUCK-AT ?auto_516636 ?auto_516635 ) ( not ( = ?auto_516635 ?auto_516638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516633 ?auto_516634 )
      ( MAKE-2CRATE-VERIFY ?auto_516632 ?auto_516633 ?auto_516634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516639 - SURFACE
      ?auto_516640 - SURFACE
    )
    :vars
    (
      ?auto_516644 - HOIST
      ?auto_516643 - PLACE
      ?auto_516641 - SURFACE
      ?auto_516642 - TRUCK
      ?auto_516645 - PLACE
      ?auto_516646 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_516644 ?auto_516643 ) ( SURFACE-AT ?auto_516639 ?auto_516643 ) ( CLEAR ?auto_516639 ) ( IS-CRATE ?auto_516640 ) ( not ( = ?auto_516639 ?auto_516640 ) ) ( AVAILABLE ?auto_516644 ) ( ON ?auto_516639 ?auto_516641 ) ( not ( = ?auto_516641 ?auto_516639 ) ) ( not ( = ?auto_516641 ?auto_516640 ) ) ( TRUCK-AT ?auto_516642 ?auto_516645 ) ( not ( = ?auto_516645 ?auto_516643 ) ) ( HOIST-AT ?auto_516646 ?auto_516645 ) ( LIFTING ?auto_516646 ?auto_516640 ) ( not ( = ?auto_516644 ?auto_516646 ) ) )
    :subtasks
    ( ( !LOAD ?auto_516646 ?auto_516640 ?auto_516642 ?auto_516645 )
      ( MAKE-2CRATE ?auto_516641 ?auto_516639 ?auto_516640 )
      ( MAKE-1CRATE-VERIFY ?auto_516639 ?auto_516640 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516647 - SURFACE
      ?auto_516648 - SURFACE
      ?auto_516649 - SURFACE
    )
    :vars
    (
      ?auto_516654 - HOIST
      ?auto_516653 - PLACE
      ?auto_516651 - TRUCK
      ?auto_516652 - PLACE
      ?auto_516650 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_516654 ?auto_516653 ) ( SURFACE-AT ?auto_516648 ?auto_516653 ) ( CLEAR ?auto_516648 ) ( IS-CRATE ?auto_516649 ) ( not ( = ?auto_516648 ?auto_516649 ) ) ( AVAILABLE ?auto_516654 ) ( ON ?auto_516648 ?auto_516647 ) ( not ( = ?auto_516647 ?auto_516648 ) ) ( not ( = ?auto_516647 ?auto_516649 ) ) ( TRUCK-AT ?auto_516651 ?auto_516652 ) ( not ( = ?auto_516652 ?auto_516653 ) ) ( HOIST-AT ?auto_516650 ?auto_516652 ) ( LIFTING ?auto_516650 ?auto_516649 ) ( not ( = ?auto_516654 ?auto_516650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516648 ?auto_516649 )
      ( MAKE-2CRATE-VERIFY ?auto_516647 ?auto_516648 ?auto_516649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516655 - SURFACE
      ?auto_516656 - SURFACE
    )
    :vars
    (
      ?auto_516657 - HOIST
      ?auto_516659 - PLACE
      ?auto_516658 - SURFACE
      ?auto_516662 - TRUCK
      ?auto_516661 - PLACE
      ?auto_516660 - HOIST
      ?auto_516663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516657 ?auto_516659 ) ( SURFACE-AT ?auto_516655 ?auto_516659 ) ( CLEAR ?auto_516655 ) ( IS-CRATE ?auto_516656 ) ( not ( = ?auto_516655 ?auto_516656 ) ) ( AVAILABLE ?auto_516657 ) ( ON ?auto_516655 ?auto_516658 ) ( not ( = ?auto_516658 ?auto_516655 ) ) ( not ( = ?auto_516658 ?auto_516656 ) ) ( TRUCK-AT ?auto_516662 ?auto_516661 ) ( not ( = ?auto_516661 ?auto_516659 ) ) ( HOIST-AT ?auto_516660 ?auto_516661 ) ( not ( = ?auto_516657 ?auto_516660 ) ) ( AVAILABLE ?auto_516660 ) ( SURFACE-AT ?auto_516656 ?auto_516661 ) ( ON ?auto_516656 ?auto_516663 ) ( CLEAR ?auto_516656 ) ( not ( = ?auto_516655 ?auto_516663 ) ) ( not ( = ?auto_516656 ?auto_516663 ) ) ( not ( = ?auto_516658 ?auto_516663 ) ) )
    :subtasks
    ( ( !LIFT ?auto_516660 ?auto_516656 ?auto_516663 ?auto_516661 )
      ( MAKE-2CRATE ?auto_516658 ?auto_516655 ?auto_516656 )
      ( MAKE-1CRATE-VERIFY ?auto_516655 ?auto_516656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516664 - SURFACE
      ?auto_516665 - SURFACE
      ?auto_516666 - SURFACE
    )
    :vars
    (
      ?auto_516668 - HOIST
      ?auto_516670 - PLACE
      ?auto_516672 - TRUCK
      ?auto_516667 - PLACE
      ?auto_516671 - HOIST
      ?auto_516669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516668 ?auto_516670 ) ( SURFACE-AT ?auto_516665 ?auto_516670 ) ( CLEAR ?auto_516665 ) ( IS-CRATE ?auto_516666 ) ( not ( = ?auto_516665 ?auto_516666 ) ) ( AVAILABLE ?auto_516668 ) ( ON ?auto_516665 ?auto_516664 ) ( not ( = ?auto_516664 ?auto_516665 ) ) ( not ( = ?auto_516664 ?auto_516666 ) ) ( TRUCK-AT ?auto_516672 ?auto_516667 ) ( not ( = ?auto_516667 ?auto_516670 ) ) ( HOIST-AT ?auto_516671 ?auto_516667 ) ( not ( = ?auto_516668 ?auto_516671 ) ) ( AVAILABLE ?auto_516671 ) ( SURFACE-AT ?auto_516666 ?auto_516667 ) ( ON ?auto_516666 ?auto_516669 ) ( CLEAR ?auto_516666 ) ( not ( = ?auto_516665 ?auto_516669 ) ) ( not ( = ?auto_516666 ?auto_516669 ) ) ( not ( = ?auto_516664 ?auto_516669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516665 ?auto_516666 )
      ( MAKE-2CRATE-VERIFY ?auto_516664 ?auto_516665 ?auto_516666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516673 - SURFACE
      ?auto_516674 - SURFACE
    )
    :vars
    (
      ?auto_516676 - HOIST
      ?auto_516678 - PLACE
      ?auto_516680 - SURFACE
      ?auto_516681 - PLACE
      ?auto_516677 - HOIST
      ?auto_516679 - SURFACE
      ?auto_516675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516676 ?auto_516678 ) ( SURFACE-AT ?auto_516673 ?auto_516678 ) ( CLEAR ?auto_516673 ) ( IS-CRATE ?auto_516674 ) ( not ( = ?auto_516673 ?auto_516674 ) ) ( AVAILABLE ?auto_516676 ) ( ON ?auto_516673 ?auto_516680 ) ( not ( = ?auto_516680 ?auto_516673 ) ) ( not ( = ?auto_516680 ?auto_516674 ) ) ( not ( = ?auto_516681 ?auto_516678 ) ) ( HOIST-AT ?auto_516677 ?auto_516681 ) ( not ( = ?auto_516676 ?auto_516677 ) ) ( AVAILABLE ?auto_516677 ) ( SURFACE-AT ?auto_516674 ?auto_516681 ) ( ON ?auto_516674 ?auto_516679 ) ( CLEAR ?auto_516674 ) ( not ( = ?auto_516673 ?auto_516679 ) ) ( not ( = ?auto_516674 ?auto_516679 ) ) ( not ( = ?auto_516680 ?auto_516679 ) ) ( TRUCK-AT ?auto_516675 ?auto_516678 ) )
    :subtasks
    ( ( !DRIVE ?auto_516675 ?auto_516678 ?auto_516681 )
      ( MAKE-2CRATE ?auto_516680 ?auto_516673 ?auto_516674 )
      ( MAKE-1CRATE-VERIFY ?auto_516673 ?auto_516674 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516682 - SURFACE
      ?auto_516683 - SURFACE
      ?auto_516684 - SURFACE
    )
    :vars
    (
      ?auto_516690 - HOIST
      ?auto_516687 - PLACE
      ?auto_516689 - PLACE
      ?auto_516688 - HOIST
      ?auto_516686 - SURFACE
      ?auto_516685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516690 ?auto_516687 ) ( SURFACE-AT ?auto_516683 ?auto_516687 ) ( CLEAR ?auto_516683 ) ( IS-CRATE ?auto_516684 ) ( not ( = ?auto_516683 ?auto_516684 ) ) ( AVAILABLE ?auto_516690 ) ( ON ?auto_516683 ?auto_516682 ) ( not ( = ?auto_516682 ?auto_516683 ) ) ( not ( = ?auto_516682 ?auto_516684 ) ) ( not ( = ?auto_516689 ?auto_516687 ) ) ( HOIST-AT ?auto_516688 ?auto_516689 ) ( not ( = ?auto_516690 ?auto_516688 ) ) ( AVAILABLE ?auto_516688 ) ( SURFACE-AT ?auto_516684 ?auto_516689 ) ( ON ?auto_516684 ?auto_516686 ) ( CLEAR ?auto_516684 ) ( not ( = ?auto_516683 ?auto_516686 ) ) ( not ( = ?auto_516684 ?auto_516686 ) ) ( not ( = ?auto_516682 ?auto_516686 ) ) ( TRUCK-AT ?auto_516685 ?auto_516687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516683 ?auto_516684 )
      ( MAKE-2CRATE-VERIFY ?auto_516682 ?auto_516683 ?auto_516684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516691 - SURFACE
      ?auto_516692 - SURFACE
    )
    :vars
    (
      ?auto_516698 - HOIST
      ?auto_516699 - PLACE
      ?auto_516693 - SURFACE
      ?auto_516695 - PLACE
      ?auto_516697 - HOIST
      ?auto_516694 - SURFACE
      ?auto_516696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516698 ?auto_516699 ) ( IS-CRATE ?auto_516692 ) ( not ( = ?auto_516691 ?auto_516692 ) ) ( not ( = ?auto_516693 ?auto_516691 ) ) ( not ( = ?auto_516693 ?auto_516692 ) ) ( not ( = ?auto_516695 ?auto_516699 ) ) ( HOIST-AT ?auto_516697 ?auto_516695 ) ( not ( = ?auto_516698 ?auto_516697 ) ) ( AVAILABLE ?auto_516697 ) ( SURFACE-AT ?auto_516692 ?auto_516695 ) ( ON ?auto_516692 ?auto_516694 ) ( CLEAR ?auto_516692 ) ( not ( = ?auto_516691 ?auto_516694 ) ) ( not ( = ?auto_516692 ?auto_516694 ) ) ( not ( = ?auto_516693 ?auto_516694 ) ) ( TRUCK-AT ?auto_516696 ?auto_516699 ) ( SURFACE-AT ?auto_516693 ?auto_516699 ) ( CLEAR ?auto_516693 ) ( LIFTING ?auto_516698 ?auto_516691 ) ( IS-CRATE ?auto_516691 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516693 ?auto_516691 )
      ( MAKE-2CRATE ?auto_516693 ?auto_516691 ?auto_516692 )
      ( MAKE-1CRATE-VERIFY ?auto_516691 ?auto_516692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516700 - SURFACE
      ?auto_516701 - SURFACE
      ?auto_516702 - SURFACE
    )
    :vars
    (
      ?auto_516703 - HOIST
      ?auto_516707 - PLACE
      ?auto_516708 - PLACE
      ?auto_516705 - HOIST
      ?auto_516706 - SURFACE
      ?auto_516704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516703 ?auto_516707 ) ( IS-CRATE ?auto_516702 ) ( not ( = ?auto_516701 ?auto_516702 ) ) ( not ( = ?auto_516700 ?auto_516701 ) ) ( not ( = ?auto_516700 ?auto_516702 ) ) ( not ( = ?auto_516708 ?auto_516707 ) ) ( HOIST-AT ?auto_516705 ?auto_516708 ) ( not ( = ?auto_516703 ?auto_516705 ) ) ( AVAILABLE ?auto_516705 ) ( SURFACE-AT ?auto_516702 ?auto_516708 ) ( ON ?auto_516702 ?auto_516706 ) ( CLEAR ?auto_516702 ) ( not ( = ?auto_516701 ?auto_516706 ) ) ( not ( = ?auto_516702 ?auto_516706 ) ) ( not ( = ?auto_516700 ?auto_516706 ) ) ( TRUCK-AT ?auto_516704 ?auto_516707 ) ( SURFACE-AT ?auto_516700 ?auto_516707 ) ( CLEAR ?auto_516700 ) ( LIFTING ?auto_516703 ?auto_516701 ) ( IS-CRATE ?auto_516701 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516701 ?auto_516702 )
      ( MAKE-2CRATE-VERIFY ?auto_516700 ?auto_516701 ?auto_516702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516709 - SURFACE
      ?auto_516710 - SURFACE
    )
    :vars
    (
      ?auto_516717 - HOIST
      ?auto_516713 - PLACE
      ?auto_516716 - SURFACE
      ?auto_516714 - PLACE
      ?auto_516715 - HOIST
      ?auto_516712 - SURFACE
      ?auto_516711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516717 ?auto_516713 ) ( IS-CRATE ?auto_516710 ) ( not ( = ?auto_516709 ?auto_516710 ) ) ( not ( = ?auto_516716 ?auto_516709 ) ) ( not ( = ?auto_516716 ?auto_516710 ) ) ( not ( = ?auto_516714 ?auto_516713 ) ) ( HOIST-AT ?auto_516715 ?auto_516714 ) ( not ( = ?auto_516717 ?auto_516715 ) ) ( AVAILABLE ?auto_516715 ) ( SURFACE-AT ?auto_516710 ?auto_516714 ) ( ON ?auto_516710 ?auto_516712 ) ( CLEAR ?auto_516710 ) ( not ( = ?auto_516709 ?auto_516712 ) ) ( not ( = ?auto_516710 ?auto_516712 ) ) ( not ( = ?auto_516716 ?auto_516712 ) ) ( TRUCK-AT ?auto_516711 ?auto_516713 ) ( SURFACE-AT ?auto_516716 ?auto_516713 ) ( CLEAR ?auto_516716 ) ( IS-CRATE ?auto_516709 ) ( AVAILABLE ?auto_516717 ) ( IN ?auto_516709 ?auto_516711 ) )
    :subtasks
    ( ( !UNLOAD ?auto_516717 ?auto_516709 ?auto_516711 ?auto_516713 )
      ( MAKE-2CRATE ?auto_516716 ?auto_516709 ?auto_516710 )
      ( MAKE-1CRATE-VERIFY ?auto_516709 ?auto_516710 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516718 - SURFACE
      ?auto_516719 - SURFACE
      ?auto_516720 - SURFACE
    )
    :vars
    (
      ?auto_516722 - HOIST
      ?auto_516724 - PLACE
      ?auto_516726 - PLACE
      ?auto_516723 - HOIST
      ?auto_516721 - SURFACE
      ?auto_516725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516722 ?auto_516724 ) ( IS-CRATE ?auto_516720 ) ( not ( = ?auto_516719 ?auto_516720 ) ) ( not ( = ?auto_516718 ?auto_516719 ) ) ( not ( = ?auto_516718 ?auto_516720 ) ) ( not ( = ?auto_516726 ?auto_516724 ) ) ( HOIST-AT ?auto_516723 ?auto_516726 ) ( not ( = ?auto_516722 ?auto_516723 ) ) ( AVAILABLE ?auto_516723 ) ( SURFACE-AT ?auto_516720 ?auto_516726 ) ( ON ?auto_516720 ?auto_516721 ) ( CLEAR ?auto_516720 ) ( not ( = ?auto_516719 ?auto_516721 ) ) ( not ( = ?auto_516720 ?auto_516721 ) ) ( not ( = ?auto_516718 ?auto_516721 ) ) ( TRUCK-AT ?auto_516725 ?auto_516724 ) ( SURFACE-AT ?auto_516718 ?auto_516724 ) ( CLEAR ?auto_516718 ) ( IS-CRATE ?auto_516719 ) ( AVAILABLE ?auto_516722 ) ( IN ?auto_516719 ?auto_516725 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516719 ?auto_516720 )
      ( MAKE-2CRATE-VERIFY ?auto_516718 ?auto_516719 ?auto_516720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516763 - SURFACE
      ?auto_516764 - SURFACE
    )
    :vars
    (
      ?auto_516765 - HOIST
      ?auto_516767 - PLACE
      ?auto_516770 - SURFACE
      ?auto_516771 - PLACE
      ?auto_516769 - HOIST
      ?auto_516768 - SURFACE
      ?auto_516766 - TRUCK
      ?auto_516772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516765 ?auto_516767 ) ( SURFACE-AT ?auto_516763 ?auto_516767 ) ( CLEAR ?auto_516763 ) ( IS-CRATE ?auto_516764 ) ( not ( = ?auto_516763 ?auto_516764 ) ) ( AVAILABLE ?auto_516765 ) ( ON ?auto_516763 ?auto_516770 ) ( not ( = ?auto_516770 ?auto_516763 ) ) ( not ( = ?auto_516770 ?auto_516764 ) ) ( not ( = ?auto_516771 ?auto_516767 ) ) ( HOIST-AT ?auto_516769 ?auto_516771 ) ( not ( = ?auto_516765 ?auto_516769 ) ) ( AVAILABLE ?auto_516769 ) ( SURFACE-AT ?auto_516764 ?auto_516771 ) ( ON ?auto_516764 ?auto_516768 ) ( CLEAR ?auto_516764 ) ( not ( = ?auto_516763 ?auto_516768 ) ) ( not ( = ?auto_516764 ?auto_516768 ) ) ( not ( = ?auto_516770 ?auto_516768 ) ) ( TRUCK-AT ?auto_516766 ?auto_516772 ) ( not ( = ?auto_516772 ?auto_516767 ) ) ( not ( = ?auto_516771 ?auto_516772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_516766 ?auto_516772 ?auto_516767 )
      ( MAKE-1CRATE ?auto_516763 ?auto_516764 )
      ( MAKE-1CRATE-VERIFY ?auto_516763 ?auto_516764 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516802 - SURFACE
      ?auto_516803 - SURFACE
      ?auto_516804 - SURFACE
      ?auto_516805 - SURFACE
    )
    :vars
    (
      ?auto_516807 - HOIST
      ?auto_516806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516807 ?auto_516806 ) ( SURFACE-AT ?auto_516804 ?auto_516806 ) ( CLEAR ?auto_516804 ) ( LIFTING ?auto_516807 ?auto_516805 ) ( IS-CRATE ?auto_516805 ) ( not ( = ?auto_516804 ?auto_516805 ) ) ( ON ?auto_516803 ?auto_516802 ) ( ON ?auto_516804 ?auto_516803 ) ( not ( = ?auto_516802 ?auto_516803 ) ) ( not ( = ?auto_516802 ?auto_516804 ) ) ( not ( = ?auto_516802 ?auto_516805 ) ) ( not ( = ?auto_516803 ?auto_516804 ) ) ( not ( = ?auto_516803 ?auto_516805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_516804 ?auto_516805 )
      ( MAKE-3CRATE-VERIFY ?auto_516802 ?auto_516803 ?auto_516804 ?auto_516805 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516819 - SURFACE
      ?auto_516820 - SURFACE
      ?auto_516821 - SURFACE
      ?auto_516822 - SURFACE
    )
    :vars
    (
      ?auto_516825 - HOIST
      ?auto_516823 - PLACE
      ?auto_516824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516825 ?auto_516823 ) ( SURFACE-AT ?auto_516821 ?auto_516823 ) ( CLEAR ?auto_516821 ) ( IS-CRATE ?auto_516822 ) ( not ( = ?auto_516821 ?auto_516822 ) ) ( TRUCK-AT ?auto_516824 ?auto_516823 ) ( AVAILABLE ?auto_516825 ) ( IN ?auto_516822 ?auto_516824 ) ( ON ?auto_516821 ?auto_516820 ) ( not ( = ?auto_516820 ?auto_516821 ) ) ( not ( = ?auto_516820 ?auto_516822 ) ) ( ON ?auto_516820 ?auto_516819 ) ( not ( = ?auto_516819 ?auto_516820 ) ) ( not ( = ?auto_516819 ?auto_516821 ) ) ( not ( = ?auto_516819 ?auto_516822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516820 ?auto_516821 ?auto_516822 )
      ( MAKE-3CRATE-VERIFY ?auto_516819 ?auto_516820 ?auto_516821 ?auto_516822 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516840 - SURFACE
      ?auto_516841 - SURFACE
      ?auto_516842 - SURFACE
      ?auto_516843 - SURFACE
    )
    :vars
    (
      ?auto_516845 - HOIST
      ?auto_516844 - PLACE
      ?auto_516847 - TRUCK
      ?auto_516846 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516845 ?auto_516844 ) ( SURFACE-AT ?auto_516842 ?auto_516844 ) ( CLEAR ?auto_516842 ) ( IS-CRATE ?auto_516843 ) ( not ( = ?auto_516842 ?auto_516843 ) ) ( AVAILABLE ?auto_516845 ) ( IN ?auto_516843 ?auto_516847 ) ( ON ?auto_516842 ?auto_516841 ) ( not ( = ?auto_516841 ?auto_516842 ) ) ( not ( = ?auto_516841 ?auto_516843 ) ) ( TRUCK-AT ?auto_516847 ?auto_516846 ) ( not ( = ?auto_516846 ?auto_516844 ) ) ( ON ?auto_516841 ?auto_516840 ) ( not ( = ?auto_516840 ?auto_516841 ) ) ( not ( = ?auto_516840 ?auto_516842 ) ) ( not ( = ?auto_516840 ?auto_516843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516841 ?auto_516842 ?auto_516843 )
      ( MAKE-3CRATE-VERIFY ?auto_516840 ?auto_516841 ?auto_516842 ?auto_516843 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516864 - SURFACE
      ?auto_516865 - SURFACE
      ?auto_516866 - SURFACE
      ?auto_516867 - SURFACE
    )
    :vars
    (
      ?auto_516870 - HOIST
      ?auto_516871 - PLACE
      ?auto_516869 - TRUCK
      ?auto_516868 - PLACE
      ?auto_516872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_516870 ?auto_516871 ) ( SURFACE-AT ?auto_516866 ?auto_516871 ) ( CLEAR ?auto_516866 ) ( IS-CRATE ?auto_516867 ) ( not ( = ?auto_516866 ?auto_516867 ) ) ( AVAILABLE ?auto_516870 ) ( ON ?auto_516866 ?auto_516865 ) ( not ( = ?auto_516865 ?auto_516866 ) ) ( not ( = ?auto_516865 ?auto_516867 ) ) ( TRUCK-AT ?auto_516869 ?auto_516868 ) ( not ( = ?auto_516868 ?auto_516871 ) ) ( HOIST-AT ?auto_516872 ?auto_516868 ) ( LIFTING ?auto_516872 ?auto_516867 ) ( not ( = ?auto_516870 ?auto_516872 ) ) ( ON ?auto_516865 ?auto_516864 ) ( not ( = ?auto_516864 ?auto_516865 ) ) ( not ( = ?auto_516864 ?auto_516866 ) ) ( not ( = ?auto_516864 ?auto_516867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516865 ?auto_516866 ?auto_516867 )
      ( MAKE-3CRATE-VERIFY ?auto_516864 ?auto_516865 ?auto_516866 ?auto_516867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516891 - SURFACE
      ?auto_516892 - SURFACE
      ?auto_516893 - SURFACE
      ?auto_516894 - SURFACE
    )
    :vars
    (
      ?auto_516895 - HOIST
      ?auto_516899 - PLACE
      ?auto_516897 - TRUCK
      ?auto_516896 - PLACE
      ?auto_516900 - HOIST
      ?auto_516898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_516895 ?auto_516899 ) ( SURFACE-AT ?auto_516893 ?auto_516899 ) ( CLEAR ?auto_516893 ) ( IS-CRATE ?auto_516894 ) ( not ( = ?auto_516893 ?auto_516894 ) ) ( AVAILABLE ?auto_516895 ) ( ON ?auto_516893 ?auto_516892 ) ( not ( = ?auto_516892 ?auto_516893 ) ) ( not ( = ?auto_516892 ?auto_516894 ) ) ( TRUCK-AT ?auto_516897 ?auto_516896 ) ( not ( = ?auto_516896 ?auto_516899 ) ) ( HOIST-AT ?auto_516900 ?auto_516896 ) ( not ( = ?auto_516895 ?auto_516900 ) ) ( AVAILABLE ?auto_516900 ) ( SURFACE-AT ?auto_516894 ?auto_516896 ) ( ON ?auto_516894 ?auto_516898 ) ( CLEAR ?auto_516894 ) ( not ( = ?auto_516893 ?auto_516898 ) ) ( not ( = ?auto_516894 ?auto_516898 ) ) ( not ( = ?auto_516892 ?auto_516898 ) ) ( ON ?auto_516892 ?auto_516891 ) ( not ( = ?auto_516891 ?auto_516892 ) ) ( not ( = ?auto_516891 ?auto_516893 ) ) ( not ( = ?auto_516891 ?auto_516894 ) ) ( not ( = ?auto_516891 ?auto_516898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516892 ?auto_516893 ?auto_516894 )
      ( MAKE-3CRATE-VERIFY ?auto_516891 ?auto_516892 ?auto_516893 ?auto_516894 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516919 - SURFACE
      ?auto_516920 - SURFACE
      ?auto_516921 - SURFACE
      ?auto_516922 - SURFACE
    )
    :vars
    (
      ?auto_516927 - HOIST
      ?auto_516928 - PLACE
      ?auto_516925 - PLACE
      ?auto_516924 - HOIST
      ?auto_516926 - SURFACE
      ?auto_516923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516927 ?auto_516928 ) ( SURFACE-AT ?auto_516921 ?auto_516928 ) ( CLEAR ?auto_516921 ) ( IS-CRATE ?auto_516922 ) ( not ( = ?auto_516921 ?auto_516922 ) ) ( AVAILABLE ?auto_516927 ) ( ON ?auto_516921 ?auto_516920 ) ( not ( = ?auto_516920 ?auto_516921 ) ) ( not ( = ?auto_516920 ?auto_516922 ) ) ( not ( = ?auto_516925 ?auto_516928 ) ) ( HOIST-AT ?auto_516924 ?auto_516925 ) ( not ( = ?auto_516927 ?auto_516924 ) ) ( AVAILABLE ?auto_516924 ) ( SURFACE-AT ?auto_516922 ?auto_516925 ) ( ON ?auto_516922 ?auto_516926 ) ( CLEAR ?auto_516922 ) ( not ( = ?auto_516921 ?auto_516926 ) ) ( not ( = ?auto_516922 ?auto_516926 ) ) ( not ( = ?auto_516920 ?auto_516926 ) ) ( TRUCK-AT ?auto_516923 ?auto_516928 ) ( ON ?auto_516920 ?auto_516919 ) ( not ( = ?auto_516919 ?auto_516920 ) ) ( not ( = ?auto_516919 ?auto_516921 ) ) ( not ( = ?auto_516919 ?auto_516922 ) ) ( not ( = ?auto_516919 ?auto_516926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516920 ?auto_516921 ?auto_516922 )
      ( MAKE-3CRATE-VERIFY ?auto_516919 ?auto_516920 ?auto_516921 ?auto_516922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516947 - SURFACE
      ?auto_516948 - SURFACE
      ?auto_516949 - SURFACE
      ?auto_516950 - SURFACE
    )
    :vars
    (
      ?auto_516952 - HOIST
      ?auto_516953 - PLACE
      ?auto_516954 - PLACE
      ?auto_516956 - HOIST
      ?auto_516951 - SURFACE
      ?auto_516955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516952 ?auto_516953 ) ( IS-CRATE ?auto_516950 ) ( not ( = ?auto_516949 ?auto_516950 ) ) ( not ( = ?auto_516948 ?auto_516949 ) ) ( not ( = ?auto_516948 ?auto_516950 ) ) ( not ( = ?auto_516954 ?auto_516953 ) ) ( HOIST-AT ?auto_516956 ?auto_516954 ) ( not ( = ?auto_516952 ?auto_516956 ) ) ( AVAILABLE ?auto_516956 ) ( SURFACE-AT ?auto_516950 ?auto_516954 ) ( ON ?auto_516950 ?auto_516951 ) ( CLEAR ?auto_516950 ) ( not ( = ?auto_516949 ?auto_516951 ) ) ( not ( = ?auto_516950 ?auto_516951 ) ) ( not ( = ?auto_516948 ?auto_516951 ) ) ( TRUCK-AT ?auto_516955 ?auto_516953 ) ( SURFACE-AT ?auto_516948 ?auto_516953 ) ( CLEAR ?auto_516948 ) ( LIFTING ?auto_516952 ?auto_516949 ) ( IS-CRATE ?auto_516949 ) ( ON ?auto_516948 ?auto_516947 ) ( not ( = ?auto_516947 ?auto_516948 ) ) ( not ( = ?auto_516947 ?auto_516949 ) ) ( not ( = ?auto_516947 ?auto_516950 ) ) ( not ( = ?auto_516947 ?auto_516951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516948 ?auto_516949 ?auto_516950 )
      ( MAKE-3CRATE-VERIFY ?auto_516947 ?auto_516948 ?auto_516949 ?auto_516950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_516975 - SURFACE
      ?auto_516976 - SURFACE
      ?auto_516977 - SURFACE
      ?auto_516978 - SURFACE
    )
    :vars
    (
      ?auto_516979 - HOIST
      ?auto_516981 - PLACE
      ?auto_516984 - PLACE
      ?auto_516983 - HOIST
      ?auto_516982 - SURFACE
      ?auto_516980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516979 ?auto_516981 ) ( IS-CRATE ?auto_516978 ) ( not ( = ?auto_516977 ?auto_516978 ) ) ( not ( = ?auto_516976 ?auto_516977 ) ) ( not ( = ?auto_516976 ?auto_516978 ) ) ( not ( = ?auto_516984 ?auto_516981 ) ) ( HOIST-AT ?auto_516983 ?auto_516984 ) ( not ( = ?auto_516979 ?auto_516983 ) ) ( AVAILABLE ?auto_516983 ) ( SURFACE-AT ?auto_516978 ?auto_516984 ) ( ON ?auto_516978 ?auto_516982 ) ( CLEAR ?auto_516978 ) ( not ( = ?auto_516977 ?auto_516982 ) ) ( not ( = ?auto_516978 ?auto_516982 ) ) ( not ( = ?auto_516976 ?auto_516982 ) ) ( TRUCK-AT ?auto_516980 ?auto_516981 ) ( SURFACE-AT ?auto_516976 ?auto_516981 ) ( CLEAR ?auto_516976 ) ( IS-CRATE ?auto_516977 ) ( AVAILABLE ?auto_516979 ) ( IN ?auto_516977 ?auto_516980 ) ( ON ?auto_516976 ?auto_516975 ) ( not ( = ?auto_516975 ?auto_516976 ) ) ( not ( = ?auto_516975 ?auto_516977 ) ) ( not ( = ?auto_516975 ?auto_516978 ) ) ( not ( = ?auto_516975 ?auto_516982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_516976 ?auto_516977 ?auto_516978 )
      ( MAKE-3CRATE-VERIFY ?auto_516975 ?auto_516976 ?auto_516977 ?auto_516978 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517266 - SURFACE
      ?auto_517267 - SURFACE
      ?auto_517268 - SURFACE
      ?auto_517270 - SURFACE
      ?auto_517269 - SURFACE
    )
    :vars
    (
      ?auto_517272 - HOIST
      ?auto_517271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517272 ?auto_517271 ) ( SURFACE-AT ?auto_517270 ?auto_517271 ) ( CLEAR ?auto_517270 ) ( LIFTING ?auto_517272 ?auto_517269 ) ( IS-CRATE ?auto_517269 ) ( not ( = ?auto_517270 ?auto_517269 ) ) ( ON ?auto_517267 ?auto_517266 ) ( ON ?auto_517268 ?auto_517267 ) ( ON ?auto_517270 ?auto_517268 ) ( not ( = ?auto_517266 ?auto_517267 ) ) ( not ( = ?auto_517266 ?auto_517268 ) ) ( not ( = ?auto_517266 ?auto_517270 ) ) ( not ( = ?auto_517266 ?auto_517269 ) ) ( not ( = ?auto_517267 ?auto_517268 ) ) ( not ( = ?auto_517267 ?auto_517270 ) ) ( not ( = ?auto_517267 ?auto_517269 ) ) ( not ( = ?auto_517268 ?auto_517270 ) ) ( not ( = ?auto_517268 ?auto_517269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517270 ?auto_517269 )
      ( MAKE-4CRATE-VERIFY ?auto_517266 ?auto_517267 ?auto_517268 ?auto_517270 ?auto_517269 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517291 - SURFACE
      ?auto_517292 - SURFACE
      ?auto_517293 - SURFACE
      ?auto_517295 - SURFACE
      ?auto_517294 - SURFACE
    )
    :vars
    (
      ?auto_517296 - HOIST
      ?auto_517298 - PLACE
      ?auto_517297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517296 ?auto_517298 ) ( SURFACE-AT ?auto_517295 ?auto_517298 ) ( CLEAR ?auto_517295 ) ( IS-CRATE ?auto_517294 ) ( not ( = ?auto_517295 ?auto_517294 ) ) ( TRUCK-AT ?auto_517297 ?auto_517298 ) ( AVAILABLE ?auto_517296 ) ( IN ?auto_517294 ?auto_517297 ) ( ON ?auto_517295 ?auto_517293 ) ( not ( = ?auto_517293 ?auto_517295 ) ) ( not ( = ?auto_517293 ?auto_517294 ) ) ( ON ?auto_517292 ?auto_517291 ) ( ON ?auto_517293 ?auto_517292 ) ( not ( = ?auto_517291 ?auto_517292 ) ) ( not ( = ?auto_517291 ?auto_517293 ) ) ( not ( = ?auto_517291 ?auto_517295 ) ) ( not ( = ?auto_517291 ?auto_517294 ) ) ( not ( = ?auto_517292 ?auto_517293 ) ) ( not ( = ?auto_517292 ?auto_517295 ) ) ( not ( = ?auto_517292 ?auto_517294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517293 ?auto_517295 ?auto_517294 )
      ( MAKE-4CRATE-VERIFY ?auto_517291 ?auto_517292 ?auto_517293 ?auto_517295 ?auto_517294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517321 - SURFACE
      ?auto_517322 - SURFACE
      ?auto_517323 - SURFACE
      ?auto_517325 - SURFACE
      ?auto_517324 - SURFACE
    )
    :vars
    (
      ?auto_517329 - HOIST
      ?auto_517326 - PLACE
      ?auto_517328 - TRUCK
      ?auto_517327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517329 ?auto_517326 ) ( SURFACE-AT ?auto_517325 ?auto_517326 ) ( CLEAR ?auto_517325 ) ( IS-CRATE ?auto_517324 ) ( not ( = ?auto_517325 ?auto_517324 ) ) ( AVAILABLE ?auto_517329 ) ( IN ?auto_517324 ?auto_517328 ) ( ON ?auto_517325 ?auto_517323 ) ( not ( = ?auto_517323 ?auto_517325 ) ) ( not ( = ?auto_517323 ?auto_517324 ) ) ( TRUCK-AT ?auto_517328 ?auto_517327 ) ( not ( = ?auto_517327 ?auto_517326 ) ) ( ON ?auto_517322 ?auto_517321 ) ( ON ?auto_517323 ?auto_517322 ) ( not ( = ?auto_517321 ?auto_517322 ) ) ( not ( = ?auto_517321 ?auto_517323 ) ) ( not ( = ?auto_517321 ?auto_517325 ) ) ( not ( = ?auto_517321 ?auto_517324 ) ) ( not ( = ?auto_517322 ?auto_517323 ) ) ( not ( = ?auto_517322 ?auto_517325 ) ) ( not ( = ?auto_517322 ?auto_517324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517323 ?auto_517325 ?auto_517324 )
      ( MAKE-4CRATE-VERIFY ?auto_517321 ?auto_517322 ?auto_517323 ?auto_517325 ?auto_517324 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517355 - SURFACE
      ?auto_517356 - SURFACE
      ?auto_517357 - SURFACE
      ?auto_517359 - SURFACE
      ?auto_517358 - SURFACE
    )
    :vars
    (
      ?auto_517362 - HOIST
      ?auto_517364 - PLACE
      ?auto_517360 - TRUCK
      ?auto_517361 - PLACE
      ?auto_517363 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517362 ?auto_517364 ) ( SURFACE-AT ?auto_517359 ?auto_517364 ) ( CLEAR ?auto_517359 ) ( IS-CRATE ?auto_517358 ) ( not ( = ?auto_517359 ?auto_517358 ) ) ( AVAILABLE ?auto_517362 ) ( ON ?auto_517359 ?auto_517357 ) ( not ( = ?auto_517357 ?auto_517359 ) ) ( not ( = ?auto_517357 ?auto_517358 ) ) ( TRUCK-AT ?auto_517360 ?auto_517361 ) ( not ( = ?auto_517361 ?auto_517364 ) ) ( HOIST-AT ?auto_517363 ?auto_517361 ) ( LIFTING ?auto_517363 ?auto_517358 ) ( not ( = ?auto_517362 ?auto_517363 ) ) ( ON ?auto_517356 ?auto_517355 ) ( ON ?auto_517357 ?auto_517356 ) ( not ( = ?auto_517355 ?auto_517356 ) ) ( not ( = ?auto_517355 ?auto_517357 ) ) ( not ( = ?auto_517355 ?auto_517359 ) ) ( not ( = ?auto_517355 ?auto_517358 ) ) ( not ( = ?auto_517356 ?auto_517357 ) ) ( not ( = ?auto_517356 ?auto_517359 ) ) ( not ( = ?auto_517356 ?auto_517358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517357 ?auto_517359 ?auto_517358 )
      ( MAKE-4CRATE-VERIFY ?auto_517355 ?auto_517356 ?auto_517357 ?auto_517359 ?auto_517358 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517393 - SURFACE
      ?auto_517394 - SURFACE
      ?auto_517395 - SURFACE
      ?auto_517397 - SURFACE
      ?auto_517396 - SURFACE
    )
    :vars
    (
      ?auto_517398 - HOIST
      ?auto_517401 - PLACE
      ?auto_517402 - TRUCK
      ?auto_517400 - PLACE
      ?auto_517403 - HOIST
      ?auto_517399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517398 ?auto_517401 ) ( SURFACE-AT ?auto_517397 ?auto_517401 ) ( CLEAR ?auto_517397 ) ( IS-CRATE ?auto_517396 ) ( not ( = ?auto_517397 ?auto_517396 ) ) ( AVAILABLE ?auto_517398 ) ( ON ?auto_517397 ?auto_517395 ) ( not ( = ?auto_517395 ?auto_517397 ) ) ( not ( = ?auto_517395 ?auto_517396 ) ) ( TRUCK-AT ?auto_517402 ?auto_517400 ) ( not ( = ?auto_517400 ?auto_517401 ) ) ( HOIST-AT ?auto_517403 ?auto_517400 ) ( not ( = ?auto_517398 ?auto_517403 ) ) ( AVAILABLE ?auto_517403 ) ( SURFACE-AT ?auto_517396 ?auto_517400 ) ( ON ?auto_517396 ?auto_517399 ) ( CLEAR ?auto_517396 ) ( not ( = ?auto_517397 ?auto_517399 ) ) ( not ( = ?auto_517396 ?auto_517399 ) ) ( not ( = ?auto_517395 ?auto_517399 ) ) ( ON ?auto_517394 ?auto_517393 ) ( ON ?auto_517395 ?auto_517394 ) ( not ( = ?auto_517393 ?auto_517394 ) ) ( not ( = ?auto_517393 ?auto_517395 ) ) ( not ( = ?auto_517393 ?auto_517397 ) ) ( not ( = ?auto_517393 ?auto_517396 ) ) ( not ( = ?auto_517393 ?auto_517399 ) ) ( not ( = ?auto_517394 ?auto_517395 ) ) ( not ( = ?auto_517394 ?auto_517397 ) ) ( not ( = ?auto_517394 ?auto_517396 ) ) ( not ( = ?auto_517394 ?auto_517399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517395 ?auto_517397 ?auto_517396 )
      ( MAKE-4CRATE-VERIFY ?auto_517393 ?auto_517394 ?auto_517395 ?auto_517397 ?auto_517396 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517432 - SURFACE
      ?auto_517433 - SURFACE
      ?auto_517434 - SURFACE
      ?auto_517436 - SURFACE
      ?auto_517435 - SURFACE
    )
    :vars
    (
      ?auto_517437 - HOIST
      ?auto_517442 - PLACE
      ?auto_517438 - PLACE
      ?auto_517439 - HOIST
      ?auto_517441 - SURFACE
      ?auto_517440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517437 ?auto_517442 ) ( SURFACE-AT ?auto_517436 ?auto_517442 ) ( CLEAR ?auto_517436 ) ( IS-CRATE ?auto_517435 ) ( not ( = ?auto_517436 ?auto_517435 ) ) ( AVAILABLE ?auto_517437 ) ( ON ?auto_517436 ?auto_517434 ) ( not ( = ?auto_517434 ?auto_517436 ) ) ( not ( = ?auto_517434 ?auto_517435 ) ) ( not ( = ?auto_517438 ?auto_517442 ) ) ( HOIST-AT ?auto_517439 ?auto_517438 ) ( not ( = ?auto_517437 ?auto_517439 ) ) ( AVAILABLE ?auto_517439 ) ( SURFACE-AT ?auto_517435 ?auto_517438 ) ( ON ?auto_517435 ?auto_517441 ) ( CLEAR ?auto_517435 ) ( not ( = ?auto_517436 ?auto_517441 ) ) ( not ( = ?auto_517435 ?auto_517441 ) ) ( not ( = ?auto_517434 ?auto_517441 ) ) ( TRUCK-AT ?auto_517440 ?auto_517442 ) ( ON ?auto_517433 ?auto_517432 ) ( ON ?auto_517434 ?auto_517433 ) ( not ( = ?auto_517432 ?auto_517433 ) ) ( not ( = ?auto_517432 ?auto_517434 ) ) ( not ( = ?auto_517432 ?auto_517436 ) ) ( not ( = ?auto_517432 ?auto_517435 ) ) ( not ( = ?auto_517432 ?auto_517441 ) ) ( not ( = ?auto_517433 ?auto_517434 ) ) ( not ( = ?auto_517433 ?auto_517436 ) ) ( not ( = ?auto_517433 ?auto_517435 ) ) ( not ( = ?auto_517433 ?auto_517441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517434 ?auto_517436 ?auto_517435 )
      ( MAKE-4CRATE-VERIFY ?auto_517432 ?auto_517433 ?auto_517434 ?auto_517436 ?auto_517435 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517471 - SURFACE
      ?auto_517472 - SURFACE
      ?auto_517473 - SURFACE
      ?auto_517475 - SURFACE
      ?auto_517474 - SURFACE
    )
    :vars
    (
      ?auto_517477 - HOIST
      ?auto_517478 - PLACE
      ?auto_517481 - PLACE
      ?auto_517476 - HOIST
      ?auto_517480 - SURFACE
      ?auto_517479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517477 ?auto_517478 ) ( IS-CRATE ?auto_517474 ) ( not ( = ?auto_517475 ?auto_517474 ) ) ( not ( = ?auto_517473 ?auto_517475 ) ) ( not ( = ?auto_517473 ?auto_517474 ) ) ( not ( = ?auto_517481 ?auto_517478 ) ) ( HOIST-AT ?auto_517476 ?auto_517481 ) ( not ( = ?auto_517477 ?auto_517476 ) ) ( AVAILABLE ?auto_517476 ) ( SURFACE-AT ?auto_517474 ?auto_517481 ) ( ON ?auto_517474 ?auto_517480 ) ( CLEAR ?auto_517474 ) ( not ( = ?auto_517475 ?auto_517480 ) ) ( not ( = ?auto_517474 ?auto_517480 ) ) ( not ( = ?auto_517473 ?auto_517480 ) ) ( TRUCK-AT ?auto_517479 ?auto_517478 ) ( SURFACE-AT ?auto_517473 ?auto_517478 ) ( CLEAR ?auto_517473 ) ( LIFTING ?auto_517477 ?auto_517475 ) ( IS-CRATE ?auto_517475 ) ( ON ?auto_517472 ?auto_517471 ) ( ON ?auto_517473 ?auto_517472 ) ( not ( = ?auto_517471 ?auto_517472 ) ) ( not ( = ?auto_517471 ?auto_517473 ) ) ( not ( = ?auto_517471 ?auto_517475 ) ) ( not ( = ?auto_517471 ?auto_517474 ) ) ( not ( = ?auto_517471 ?auto_517480 ) ) ( not ( = ?auto_517472 ?auto_517473 ) ) ( not ( = ?auto_517472 ?auto_517475 ) ) ( not ( = ?auto_517472 ?auto_517474 ) ) ( not ( = ?auto_517472 ?auto_517480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517473 ?auto_517475 ?auto_517474 )
      ( MAKE-4CRATE-VERIFY ?auto_517471 ?auto_517472 ?auto_517473 ?auto_517475 ?auto_517474 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517510 - SURFACE
      ?auto_517511 - SURFACE
      ?auto_517512 - SURFACE
      ?auto_517514 - SURFACE
      ?auto_517513 - SURFACE
    )
    :vars
    (
      ?auto_517516 - HOIST
      ?auto_517517 - PLACE
      ?auto_517515 - PLACE
      ?auto_517519 - HOIST
      ?auto_517520 - SURFACE
      ?auto_517518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517516 ?auto_517517 ) ( IS-CRATE ?auto_517513 ) ( not ( = ?auto_517514 ?auto_517513 ) ) ( not ( = ?auto_517512 ?auto_517514 ) ) ( not ( = ?auto_517512 ?auto_517513 ) ) ( not ( = ?auto_517515 ?auto_517517 ) ) ( HOIST-AT ?auto_517519 ?auto_517515 ) ( not ( = ?auto_517516 ?auto_517519 ) ) ( AVAILABLE ?auto_517519 ) ( SURFACE-AT ?auto_517513 ?auto_517515 ) ( ON ?auto_517513 ?auto_517520 ) ( CLEAR ?auto_517513 ) ( not ( = ?auto_517514 ?auto_517520 ) ) ( not ( = ?auto_517513 ?auto_517520 ) ) ( not ( = ?auto_517512 ?auto_517520 ) ) ( TRUCK-AT ?auto_517518 ?auto_517517 ) ( SURFACE-AT ?auto_517512 ?auto_517517 ) ( CLEAR ?auto_517512 ) ( IS-CRATE ?auto_517514 ) ( AVAILABLE ?auto_517516 ) ( IN ?auto_517514 ?auto_517518 ) ( ON ?auto_517511 ?auto_517510 ) ( ON ?auto_517512 ?auto_517511 ) ( not ( = ?auto_517510 ?auto_517511 ) ) ( not ( = ?auto_517510 ?auto_517512 ) ) ( not ( = ?auto_517510 ?auto_517514 ) ) ( not ( = ?auto_517510 ?auto_517513 ) ) ( not ( = ?auto_517510 ?auto_517520 ) ) ( not ( = ?auto_517511 ?auto_517512 ) ) ( not ( = ?auto_517511 ?auto_517514 ) ) ( not ( = ?auto_517511 ?auto_517513 ) ) ( not ( = ?auto_517511 ?auto_517520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517512 ?auto_517514 ?auto_517513 )
      ( MAKE-4CRATE-VERIFY ?auto_517510 ?auto_517511 ?auto_517512 ?auto_517514 ?auto_517513 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518170 - SURFACE
      ?auto_518171 - SURFACE
      ?auto_518172 - SURFACE
      ?auto_518174 - SURFACE
      ?auto_518173 - SURFACE
      ?auto_518175 - SURFACE
    )
    :vars
    (
      ?auto_518176 - HOIST
      ?auto_518177 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518176 ?auto_518177 ) ( SURFACE-AT ?auto_518173 ?auto_518177 ) ( CLEAR ?auto_518173 ) ( LIFTING ?auto_518176 ?auto_518175 ) ( IS-CRATE ?auto_518175 ) ( not ( = ?auto_518173 ?auto_518175 ) ) ( ON ?auto_518171 ?auto_518170 ) ( ON ?auto_518172 ?auto_518171 ) ( ON ?auto_518174 ?auto_518172 ) ( ON ?auto_518173 ?auto_518174 ) ( not ( = ?auto_518170 ?auto_518171 ) ) ( not ( = ?auto_518170 ?auto_518172 ) ) ( not ( = ?auto_518170 ?auto_518174 ) ) ( not ( = ?auto_518170 ?auto_518173 ) ) ( not ( = ?auto_518170 ?auto_518175 ) ) ( not ( = ?auto_518171 ?auto_518172 ) ) ( not ( = ?auto_518171 ?auto_518174 ) ) ( not ( = ?auto_518171 ?auto_518173 ) ) ( not ( = ?auto_518171 ?auto_518175 ) ) ( not ( = ?auto_518172 ?auto_518174 ) ) ( not ( = ?auto_518172 ?auto_518173 ) ) ( not ( = ?auto_518172 ?auto_518175 ) ) ( not ( = ?auto_518174 ?auto_518173 ) ) ( not ( = ?auto_518174 ?auto_518175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_518173 ?auto_518175 )
      ( MAKE-5CRATE-VERIFY ?auto_518170 ?auto_518171 ?auto_518172 ?auto_518174 ?auto_518173 ?auto_518175 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518204 - SURFACE
      ?auto_518205 - SURFACE
      ?auto_518206 - SURFACE
      ?auto_518208 - SURFACE
      ?auto_518207 - SURFACE
      ?auto_518209 - SURFACE
    )
    :vars
    (
      ?auto_518211 - HOIST
      ?auto_518210 - PLACE
      ?auto_518212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518211 ?auto_518210 ) ( SURFACE-AT ?auto_518207 ?auto_518210 ) ( CLEAR ?auto_518207 ) ( IS-CRATE ?auto_518209 ) ( not ( = ?auto_518207 ?auto_518209 ) ) ( TRUCK-AT ?auto_518212 ?auto_518210 ) ( AVAILABLE ?auto_518211 ) ( IN ?auto_518209 ?auto_518212 ) ( ON ?auto_518207 ?auto_518208 ) ( not ( = ?auto_518208 ?auto_518207 ) ) ( not ( = ?auto_518208 ?auto_518209 ) ) ( ON ?auto_518205 ?auto_518204 ) ( ON ?auto_518206 ?auto_518205 ) ( ON ?auto_518208 ?auto_518206 ) ( not ( = ?auto_518204 ?auto_518205 ) ) ( not ( = ?auto_518204 ?auto_518206 ) ) ( not ( = ?auto_518204 ?auto_518208 ) ) ( not ( = ?auto_518204 ?auto_518207 ) ) ( not ( = ?auto_518204 ?auto_518209 ) ) ( not ( = ?auto_518205 ?auto_518206 ) ) ( not ( = ?auto_518205 ?auto_518208 ) ) ( not ( = ?auto_518205 ?auto_518207 ) ) ( not ( = ?auto_518205 ?auto_518209 ) ) ( not ( = ?auto_518206 ?auto_518208 ) ) ( not ( = ?auto_518206 ?auto_518207 ) ) ( not ( = ?auto_518206 ?auto_518209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518208 ?auto_518207 ?auto_518209 )
      ( MAKE-5CRATE-VERIFY ?auto_518204 ?auto_518205 ?auto_518206 ?auto_518208 ?auto_518207 ?auto_518209 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518244 - SURFACE
      ?auto_518245 - SURFACE
      ?auto_518246 - SURFACE
      ?auto_518248 - SURFACE
      ?auto_518247 - SURFACE
      ?auto_518249 - SURFACE
    )
    :vars
    (
      ?auto_518250 - HOIST
      ?auto_518251 - PLACE
      ?auto_518252 - TRUCK
      ?auto_518253 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518250 ?auto_518251 ) ( SURFACE-AT ?auto_518247 ?auto_518251 ) ( CLEAR ?auto_518247 ) ( IS-CRATE ?auto_518249 ) ( not ( = ?auto_518247 ?auto_518249 ) ) ( AVAILABLE ?auto_518250 ) ( IN ?auto_518249 ?auto_518252 ) ( ON ?auto_518247 ?auto_518248 ) ( not ( = ?auto_518248 ?auto_518247 ) ) ( not ( = ?auto_518248 ?auto_518249 ) ) ( TRUCK-AT ?auto_518252 ?auto_518253 ) ( not ( = ?auto_518253 ?auto_518251 ) ) ( ON ?auto_518245 ?auto_518244 ) ( ON ?auto_518246 ?auto_518245 ) ( ON ?auto_518248 ?auto_518246 ) ( not ( = ?auto_518244 ?auto_518245 ) ) ( not ( = ?auto_518244 ?auto_518246 ) ) ( not ( = ?auto_518244 ?auto_518248 ) ) ( not ( = ?auto_518244 ?auto_518247 ) ) ( not ( = ?auto_518244 ?auto_518249 ) ) ( not ( = ?auto_518245 ?auto_518246 ) ) ( not ( = ?auto_518245 ?auto_518248 ) ) ( not ( = ?auto_518245 ?auto_518247 ) ) ( not ( = ?auto_518245 ?auto_518249 ) ) ( not ( = ?auto_518246 ?auto_518248 ) ) ( not ( = ?auto_518246 ?auto_518247 ) ) ( not ( = ?auto_518246 ?auto_518249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518248 ?auto_518247 ?auto_518249 )
      ( MAKE-5CRATE-VERIFY ?auto_518244 ?auto_518245 ?auto_518246 ?auto_518248 ?auto_518247 ?auto_518249 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518289 - SURFACE
      ?auto_518290 - SURFACE
      ?auto_518291 - SURFACE
      ?auto_518293 - SURFACE
      ?auto_518292 - SURFACE
      ?auto_518294 - SURFACE
    )
    :vars
    (
      ?auto_518295 - HOIST
      ?auto_518296 - PLACE
      ?auto_518299 - TRUCK
      ?auto_518298 - PLACE
      ?auto_518297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_518295 ?auto_518296 ) ( SURFACE-AT ?auto_518292 ?auto_518296 ) ( CLEAR ?auto_518292 ) ( IS-CRATE ?auto_518294 ) ( not ( = ?auto_518292 ?auto_518294 ) ) ( AVAILABLE ?auto_518295 ) ( ON ?auto_518292 ?auto_518293 ) ( not ( = ?auto_518293 ?auto_518292 ) ) ( not ( = ?auto_518293 ?auto_518294 ) ) ( TRUCK-AT ?auto_518299 ?auto_518298 ) ( not ( = ?auto_518298 ?auto_518296 ) ) ( HOIST-AT ?auto_518297 ?auto_518298 ) ( LIFTING ?auto_518297 ?auto_518294 ) ( not ( = ?auto_518295 ?auto_518297 ) ) ( ON ?auto_518290 ?auto_518289 ) ( ON ?auto_518291 ?auto_518290 ) ( ON ?auto_518293 ?auto_518291 ) ( not ( = ?auto_518289 ?auto_518290 ) ) ( not ( = ?auto_518289 ?auto_518291 ) ) ( not ( = ?auto_518289 ?auto_518293 ) ) ( not ( = ?auto_518289 ?auto_518292 ) ) ( not ( = ?auto_518289 ?auto_518294 ) ) ( not ( = ?auto_518290 ?auto_518291 ) ) ( not ( = ?auto_518290 ?auto_518293 ) ) ( not ( = ?auto_518290 ?auto_518292 ) ) ( not ( = ?auto_518290 ?auto_518294 ) ) ( not ( = ?auto_518291 ?auto_518293 ) ) ( not ( = ?auto_518291 ?auto_518292 ) ) ( not ( = ?auto_518291 ?auto_518294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518293 ?auto_518292 ?auto_518294 )
      ( MAKE-5CRATE-VERIFY ?auto_518289 ?auto_518290 ?auto_518291 ?auto_518293 ?auto_518292 ?auto_518294 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518339 - SURFACE
      ?auto_518340 - SURFACE
      ?auto_518341 - SURFACE
      ?auto_518343 - SURFACE
      ?auto_518342 - SURFACE
      ?auto_518344 - SURFACE
    )
    :vars
    (
      ?auto_518346 - HOIST
      ?auto_518350 - PLACE
      ?auto_518347 - TRUCK
      ?auto_518348 - PLACE
      ?auto_518349 - HOIST
      ?auto_518345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518346 ?auto_518350 ) ( SURFACE-AT ?auto_518342 ?auto_518350 ) ( CLEAR ?auto_518342 ) ( IS-CRATE ?auto_518344 ) ( not ( = ?auto_518342 ?auto_518344 ) ) ( AVAILABLE ?auto_518346 ) ( ON ?auto_518342 ?auto_518343 ) ( not ( = ?auto_518343 ?auto_518342 ) ) ( not ( = ?auto_518343 ?auto_518344 ) ) ( TRUCK-AT ?auto_518347 ?auto_518348 ) ( not ( = ?auto_518348 ?auto_518350 ) ) ( HOIST-AT ?auto_518349 ?auto_518348 ) ( not ( = ?auto_518346 ?auto_518349 ) ) ( AVAILABLE ?auto_518349 ) ( SURFACE-AT ?auto_518344 ?auto_518348 ) ( ON ?auto_518344 ?auto_518345 ) ( CLEAR ?auto_518344 ) ( not ( = ?auto_518342 ?auto_518345 ) ) ( not ( = ?auto_518344 ?auto_518345 ) ) ( not ( = ?auto_518343 ?auto_518345 ) ) ( ON ?auto_518340 ?auto_518339 ) ( ON ?auto_518341 ?auto_518340 ) ( ON ?auto_518343 ?auto_518341 ) ( not ( = ?auto_518339 ?auto_518340 ) ) ( not ( = ?auto_518339 ?auto_518341 ) ) ( not ( = ?auto_518339 ?auto_518343 ) ) ( not ( = ?auto_518339 ?auto_518342 ) ) ( not ( = ?auto_518339 ?auto_518344 ) ) ( not ( = ?auto_518339 ?auto_518345 ) ) ( not ( = ?auto_518340 ?auto_518341 ) ) ( not ( = ?auto_518340 ?auto_518343 ) ) ( not ( = ?auto_518340 ?auto_518342 ) ) ( not ( = ?auto_518340 ?auto_518344 ) ) ( not ( = ?auto_518340 ?auto_518345 ) ) ( not ( = ?auto_518341 ?auto_518343 ) ) ( not ( = ?auto_518341 ?auto_518342 ) ) ( not ( = ?auto_518341 ?auto_518344 ) ) ( not ( = ?auto_518341 ?auto_518345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518343 ?auto_518342 ?auto_518344 )
      ( MAKE-5CRATE-VERIFY ?auto_518339 ?auto_518340 ?auto_518341 ?auto_518343 ?auto_518342 ?auto_518344 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518390 - SURFACE
      ?auto_518391 - SURFACE
      ?auto_518392 - SURFACE
      ?auto_518394 - SURFACE
      ?auto_518393 - SURFACE
      ?auto_518395 - SURFACE
    )
    :vars
    (
      ?auto_518398 - HOIST
      ?auto_518399 - PLACE
      ?auto_518396 - PLACE
      ?auto_518401 - HOIST
      ?auto_518397 - SURFACE
      ?auto_518400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518398 ?auto_518399 ) ( SURFACE-AT ?auto_518393 ?auto_518399 ) ( CLEAR ?auto_518393 ) ( IS-CRATE ?auto_518395 ) ( not ( = ?auto_518393 ?auto_518395 ) ) ( AVAILABLE ?auto_518398 ) ( ON ?auto_518393 ?auto_518394 ) ( not ( = ?auto_518394 ?auto_518393 ) ) ( not ( = ?auto_518394 ?auto_518395 ) ) ( not ( = ?auto_518396 ?auto_518399 ) ) ( HOIST-AT ?auto_518401 ?auto_518396 ) ( not ( = ?auto_518398 ?auto_518401 ) ) ( AVAILABLE ?auto_518401 ) ( SURFACE-AT ?auto_518395 ?auto_518396 ) ( ON ?auto_518395 ?auto_518397 ) ( CLEAR ?auto_518395 ) ( not ( = ?auto_518393 ?auto_518397 ) ) ( not ( = ?auto_518395 ?auto_518397 ) ) ( not ( = ?auto_518394 ?auto_518397 ) ) ( TRUCK-AT ?auto_518400 ?auto_518399 ) ( ON ?auto_518391 ?auto_518390 ) ( ON ?auto_518392 ?auto_518391 ) ( ON ?auto_518394 ?auto_518392 ) ( not ( = ?auto_518390 ?auto_518391 ) ) ( not ( = ?auto_518390 ?auto_518392 ) ) ( not ( = ?auto_518390 ?auto_518394 ) ) ( not ( = ?auto_518390 ?auto_518393 ) ) ( not ( = ?auto_518390 ?auto_518395 ) ) ( not ( = ?auto_518390 ?auto_518397 ) ) ( not ( = ?auto_518391 ?auto_518392 ) ) ( not ( = ?auto_518391 ?auto_518394 ) ) ( not ( = ?auto_518391 ?auto_518393 ) ) ( not ( = ?auto_518391 ?auto_518395 ) ) ( not ( = ?auto_518391 ?auto_518397 ) ) ( not ( = ?auto_518392 ?auto_518394 ) ) ( not ( = ?auto_518392 ?auto_518393 ) ) ( not ( = ?auto_518392 ?auto_518395 ) ) ( not ( = ?auto_518392 ?auto_518397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518394 ?auto_518393 ?auto_518395 )
      ( MAKE-5CRATE-VERIFY ?auto_518390 ?auto_518391 ?auto_518392 ?auto_518394 ?auto_518393 ?auto_518395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518441 - SURFACE
      ?auto_518442 - SURFACE
      ?auto_518443 - SURFACE
      ?auto_518445 - SURFACE
      ?auto_518444 - SURFACE
      ?auto_518446 - SURFACE
    )
    :vars
    (
      ?auto_518449 - HOIST
      ?auto_518451 - PLACE
      ?auto_518452 - PLACE
      ?auto_518448 - HOIST
      ?auto_518447 - SURFACE
      ?auto_518450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518449 ?auto_518451 ) ( IS-CRATE ?auto_518446 ) ( not ( = ?auto_518444 ?auto_518446 ) ) ( not ( = ?auto_518445 ?auto_518444 ) ) ( not ( = ?auto_518445 ?auto_518446 ) ) ( not ( = ?auto_518452 ?auto_518451 ) ) ( HOIST-AT ?auto_518448 ?auto_518452 ) ( not ( = ?auto_518449 ?auto_518448 ) ) ( AVAILABLE ?auto_518448 ) ( SURFACE-AT ?auto_518446 ?auto_518452 ) ( ON ?auto_518446 ?auto_518447 ) ( CLEAR ?auto_518446 ) ( not ( = ?auto_518444 ?auto_518447 ) ) ( not ( = ?auto_518446 ?auto_518447 ) ) ( not ( = ?auto_518445 ?auto_518447 ) ) ( TRUCK-AT ?auto_518450 ?auto_518451 ) ( SURFACE-AT ?auto_518445 ?auto_518451 ) ( CLEAR ?auto_518445 ) ( LIFTING ?auto_518449 ?auto_518444 ) ( IS-CRATE ?auto_518444 ) ( ON ?auto_518442 ?auto_518441 ) ( ON ?auto_518443 ?auto_518442 ) ( ON ?auto_518445 ?auto_518443 ) ( not ( = ?auto_518441 ?auto_518442 ) ) ( not ( = ?auto_518441 ?auto_518443 ) ) ( not ( = ?auto_518441 ?auto_518445 ) ) ( not ( = ?auto_518441 ?auto_518444 ) ) ( not ( = ?auto_518441 ?auto_518446 ) ) ( not ( = ?auto_518441 ?auto_518447 ) ) ( not ( = ?auto_518442 ?auto_518443 ) ) ( not ( = ?auto_518442 ?auto_518445 ) ) ( not ( = ?auto_518442 ?auto_518444 ) ) ( not ( = ?auto_518442 ?auto_518446 ) ) ( not ( = ?auto_518442 ?auto_518447 ) ) ( not ( = ?auto_518443 ?auto_518445 ) ) ( not ( = ?auto_518443 ?auto_518444 ) ) ( not ( = ?auto_518443 ?auto_518446 ) ) ( not ( = ?auto_518443 ?auto_518447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518445 ?auto_518444 ?auto_518446 )
      ( MAKE-5CRATE-VERIFY ?auto_518441 ?auto_518442 ?auto_518443 ?auto_518445 ?auto_518444 ?auto_518446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518492 - SURFACE
      ?auto_518493 - SURFACE
      ?auto_518494 - SURFACE
      ?auto_518496 - SURFACE
      ?auto_518495 - SURFACE
      ?auto_518497 - SURFACE
    )
    :vars
    (
      ?auto_518501 - HOIST
      ?auto_518498 - PLACE
      ?auto_518502 - PLACE
      ?auto_518503 - HOIST
      ?auto_518500 - SURFACE
      ?auto_518499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518501 ?auto_518498 ) ( IS-CRATE ?auto_518497 ) ( not ( = ?auto_518495 ?auto_518497 ) ) ( not ( = ?auto_518496 ?auto_518495 ) ) ( not ( = ?auto_518496 ?auto_518497 ) ) ( not ( = ?auto_518502 ?auto_518498 ) ) ( HOIST-AT ?auto_518503 ?auto_518502 ) ( not ( = ?auto_518501 ?auto_518503 ) ) ( AVAILABLE ?auto_518503 ) ( SURFACE-AT ?auto_518497 ?auto_518502 ) ( ON ?auto_518497 ?auto_518500 ) ( CLEAR ?auto_518497 ) ( not ( = ?auto_518495 ?auto_518500 ) ) ( not ( = ?auto_518497 ?auto_518500 ) ) ( not ( = ?auto_518496 ?auto_518500 ) ) ( TRUCK-AT ?auto_518499 ?auto_518498 ) ( SURFACE-AT ?auto_518496 ?auto_518498 ) ( CLEAR ?auto_518496 ) ( IS-CRATE ?auto_518495 ) ( AVAILABLE ?auto_518501 ) ( IN ?auto_518495 ?auto_518499 ) ( ON ?auto_518493 ?auto_518492 ) ( ON ?auto_518494 ?auto_518493 ) ( ON ?auto_518496 ?auto_518494 ) ( not ( = ?auto_518492 ?auto_518493 ) ) ( not ( = ?auto_518492 ?auto_518494 ) ) ( not ( = ?auto_518492 ?auto_518496 ) ) ( not ( = ?auto_518492 ?auto_518495 ) ) ( not ( = ?auto_518492 ?auto_518497 ) ) ( not ( = ?auto_518492 ?auto_518500 ) ) ( not ( = ?auto_518493 ?auto_518494 ) ) ( not ( = ?auto_518493 ?auto_518496 ) ) ( not ( = ?auto_518493 ?auto_518495 ) ) ( not ( = ?auto_518493 ?auto_518497 ) ) ( not ( = ?auto_518493 ?auto_518500 ) ) ( not ( = ?auto_518494 ?auto_518496 ) ) ( not ( = ?auto_518494 ?auto_518495 ) ) ( not ( = ?auto_518494 ?auto_518497 ) ) ( not ( = ?auto_518494 ?auto_518500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518496 ?auto_518495 ?auto_518497 )
      ( MAKE-5CRATE-VERIFY ?auto_518492 ?auto_518493 ?auto_518494 ?auto_518496 ?auto_518495 ?auto_518497 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519701 - SURFACE
      ?auto_519702 - SURFACE
      ?auto_519703 - SURFACE
      ?auto_519705 - SURFACE
      ?auto_519704 - SURFACE
      ?auto_519706 - SURFACE
      ?auto_519707 - SURFACE
    )
    :vars
    (
      ?auto_519708 - HOIST
      ?auto_519709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519708 ?auto_519709 ) ( SURFACE-AT ?auto_519706 ?auto_519709 ) ( CLEAR ?auto_519706 ) ( LIFTING ?auto_519708 ?auto_519707 ) ( IS-CRATE ?auto_519707 ) ( not ( = ?auto_519706 ?auto_519707 ) ) ( ON ?auto_519702 ?auto_519701 ) ( ON ?auto_519703 ?auto_519702 ) ( ON ?auto_519705 ?auto_519703 ) ( ON ?auto_519704 ?auto_519705 ) ( ON ?auto_519706 ?auto_519704 ) ( not ( = ?auto_519701 ?auto_519702 ) ) ( not ( = ?auto_519701 ?auto_519703 ) ) ( not ( = ?auto_519701 ?auto_519705 ) ) ( not ( = ?auto_519701 ?auto_519704 ) ) ( not ( = ?auto_519701 ?auto_519706 ) ) ( not ( = ?auto_519701 ?auto_519707 ) ) ( not ( = ?auto_519702 ?auto_519703 ) ) ( not ( = ?auto_519702 ?auto_519705 ) ) ( not ( = ?auto_519702 ?auto_519704 ) ) ( not ( = ?auto_519702 ?auto_519706 ) ) ( not ( = ?auto_519702 ?auto_519707 ) ) ( not ( = ?auto_519703 ?auto_519705 ) ) ( not ( = ?auto_519703 ?auto_519704 ) ) ( not ( = ?auto_519703 ?auto_519706 ) ) ( not ( = ?auto_519703 ?auto_519707 ) ) ( not ( = ?auto_519705 ?auto_519704 ) ) ( not ( = ?auto_519705 ?auto_519706 ) ) ( not ( = ?auto_519705 ?auto_519707 ) ) ( not ( = ?auto_519704 ?auto_519706 ) ) ( not ( = ?auto_519704 ?auto_519707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_519706 ?auto_519707 )
      ( MAKE-6CRATE-VERIFY ?auto_519701 ?auto_519702 ?auto_519703 ?auto_519705 ?auto_519704 ?auto_519706 ?auto_519707 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519745 - SURFACE
      ?auto_519746 - SURFACE
      ?auto_519747 - SURFACE
      ?auto_519749 - SURFACE
      ?auto_519748 - SURFACE
      ?auto_519750 - SURFACE
      ?auto_519751 - SURFACE
    )
    :vars
    (
      ?auto_519753 - HOIST
      ?auto_519752 - PLACE
      ?auto_519754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519753 ?auto_519752 ) ( SURFACE-AT ?auto_519750 ?auto_519752 ) ( CLEAR ?auto_519750 ) ( IS-CRATE ?auto_519751 ) ( not ( = ?auto_519750 ?auto_519751 ) ) ( TRUCK-AT ?auto_519754 ?auto_519752 ) ( AVAILABLE ?auto_519753 ) ( IN ?auto_519751 ?auto_519754 ) ( ON ?auto_519750 ?auto_519748 ) ( not ( = ?auto_519748 ?auto_519750 ) ) ( not ( = ?auto_519748 ?auto_519751 ) ) ( ON ?auto_519746 ?auto_519745 ) ( ON ?auto_519747 ?auto_519746 ) ( ON ?auto_519749 ?auto_519747 ) ( ON ?auto_519748 ?auto_519749 ) ( not ( = ?auto_519745 ?auto_519746 ) ) ( not ( = ?auto_519745 ?auto_519747 ) ) ( not ( = ?auto_519745 ?auto_519749 ) ) ( not ( = ?auto_519745 ?auto_519748 ) ) ( not ( = ?auto_519745 ?auto_519750 ) ) ( not ( = ?auto_519745 ?auto_519751 ) ) ( not ( = ?auto_519746 ?auto_519747 ) ) ( not ( = ?auto_519746 ?auto_519749 ) ) ( not ( = ?auto_519746 ?auto_519748 ) ) ( not ( = ?auto_519746 ?auto_519750 ) ) ( not ( = ?auto_519746 ?auto_519751 ) ) ( not ( = ?auto_519747 ?auto_519749 ) ) ( not ( = ?auto_519747 ?auto_519748 ) ) ( not ( = ?auto_519747 ?auto_519750 ) ) ( not ( = ?auto_519747 ?auto_519751 ) ) ( not ( = ?auto_519749 ?auto_519748 ) ) ( not ( = ?auto_519749 ?auto_519750 ) ) ( not ( = ?auto_519749 ?auto_519751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519748 ?auto_519750 ?auto_519751 )
      ( MAKE-6CRATE-VERIFY ?auto_519745 ?auto_519746 ?auto_519747 ?auto_519749 ?auto_519748 ?auto_519750 ?auto_519751 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519796 - SURFACE
      ?auto_519797 - SURFACE
      ?auto_519798 - SURFACE
      ?auto_519800 - SURFACE
      ?auto_519799 - SURFACE
      ?auto_519801 - SURFACE
      ?auto_519802 - SURFACE
    )
    :vars
    (
      ?auto_519804 - HOIST
      ?auto_519805 - PLACE
      ?auto_519803 - TRUCK
      ?auto_519806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519804 ?auto_519805 ) ( SURFACE-AT ?auto_519801 ?auto_519805 ) ( CLEAR ?auto_519801 ) ( IS-CRATE ?auto_519802 ) ( not ( = ?auto_519801 ?auto_519802 ) ) ( AVAILABLE ?auto_519804 ) ( IN ?auto_519802 ?auto_519803 ) ( ON ?auto_519801 ?auto_519799 ) ( not ( = ?auto_519799 ?auto_519801 ) ) ( not ( = ?auto_519799 ?auto_519802 ) ) ( TRUCK-AT ?auto_519803 ?auto_519806 ) ( not ( = ?auto_519806 ?auto_519805 ) ) ( ON ?auto_519797 ?auto_519796 ) ( ON ?auto_519798 ?auto_519797 ) ( ON ?auto_519800 ?auto_519798 ) ( ON ?auto_519799 ?auto_519800 ) ( not ( = ?auto_519796 ?auto_519797 ) ) ( not ( = ?auto_519796 ?auto_519798 ) ) ( not ( = ?auto_519796 ?auto_519800 ) ) ( not ( = ?auto_519796 ?auto_519799 ) ) ( not ( = ?auto_519796 ?auto_519801 ) ) ( not ( = ?auto_519796 ?auto_519802 ) ) ( not ( = ?auto_519797 ?auto_519798 ) ) ( not ( = ?auto_519797 ?auto_519800 ) ) ( not ( = ?auto_519797 ?auto_519799 ) ) ( not ( = ?auto_519797 ?auto_519801 ) ) ( not ( = ?auto_519797 ?auto_519802 ) ) ( not ( = ?auto_519798 ?auto_519800 ) ) ( not ( = ?auto_519798 ?auto_519799 ) ) ( not ( = ?auto_519798 ?auto_519801 ) ) ( not ( = ?auto_519798 ?auto_519802 ) ) ( not ( = ?auto_519800 ?auto_519799 ) ) ( not ( = ?auto_519800 ?auto_519801 ) ) ( not ( = ?auto_519800 ?auto_519802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519799 ?auto_519801 ?auto_519802 )
      ( MAKE-6CRATE-VERIFY ?auto_519796 ?auto_519797 ?auto_519798 ?auto_519800 ?auto_519799 ?auto_519801 ?auto_519802 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519853 - SURFACE
      ?auto_519854 - SURFACE
      ?auto_519855 - SURFACE
      ?auto_519857 - SURFACE
      ?auto_519856 - SURFACE
      ?auto_519858 - SURFACE
      ?auto_519859 - SURFACE
    )
    :vars
    (
      ?auto_519860 - HOIST
      ?auto_519861 - PLACE
      ?auto_519863 - TRUCK
      ?auto_519864 - PLACE
      ?auto_519862 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_519860 ?auto_519861 ) ( SURFACE-AT ?auto_519858 ?auto_519861 ) ( CLEAR ?auto_519858 ) ( IS-CRATE ?auto_519859 ) ( not ( = ?auto_519858 ?auto_519859 ) ) ( AVAILABLE ?auto_519860 ) ( ON ?auto_519858 ?auto_519856 ) ( not ( = ?auto_519856 ?auto_519858 ) ) ( not ( = ?auto_519856 ?auto_519859 ) ) ( TRUCK-AT ?auto_519863 ?auto_519864 ) ( not ( = ?auto_519864 ?auto_519861 ) ) ( HOIST-AT ?auto_519862 ?auto_519864 ) ( LIFTING ?auto_519862 ?auto_519859 ) ( not ( = ?auto_519860 ?auto_519862 ) ) ( ON ?auto_519854 ?auto_519853 ) ( ON ?auto_519855 ?auto_519854 ) ( ON ?auto_519857 ?auto_519855 ) ( ON ?auto_519856 ?auto_519857 ) ( not ( = ?auto_519853 ?auto_519854 ) ) ( not ( = ?auto_519853 ?auto_519855 ) ) ( not ( = ?auto_519853 ?auto_519857 ) ) ( not ( = ?auto_519853 ?auto_519856 ) ) ( not ( = ?auto_519853 ?auto_519858 ) ) ( not ( = ?auto_519853 ?auto_519859 ) ) ( not ( = ?auto_519854 ?auto_519855 ) ) ( not ( = ?auto_519854 ?auto_519857 ) ) ( not ( = ?auto_519854 ?auto_519856 ) ) ( not ( = ?auto_519854 ?auto_519858 ) ) ( not ( = ?auto_519854 ?auto_519859 ) ) ( not ( = ?auto_519855 ?auto_519857 ) ) ( not ( = ?auto_519855 ?auto_519856 ) ) ( not ( = ?auto_519855 ?auto_519858 ) ) ( not ( = ?auto_519855 ?auto_519859 ) ) ( not ( = ?auto_519857 ?auto_519856 ) ) ( not ( = ?auto_519857 ?auto_519858 ) ) ( not ( = ?auto_519857 ?auto_519859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519856 ?auto_519858 ?auto_519859 )
      ( MAKE-6CRATE-VERIFY ?auto_519853 ?auto_519854 ?auto_519855 ?auto_519857 ?auto_519856 ?auto_519858 ?auto_519859 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519916 - SURFACE
      ?auto_519917 - SURFACE
      ?auto_519918 - SURFACE
      ?auto_519920 - SURFACE
      ?auto_519919 - SURFACE
      ?auto_519921 - SURFACE
      ?auto_519922 - SURFACE
    )
    :vars
    (
      ?auto_519923 - HOIST
      ?auto_519925 - PLACE
      ?auto_519926 - TRUCK
      ?auto_519927 - PLACE
      ?auto_519928 - HOIST
      ?auto_519924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519923 ?auto_519925 ) ( SURFACE-AT ?auto_519921 ?auto_519925 ) ( CLEAR ?auto_519921 ) ( IS-CRATE ?auto_519922 ) ( not ( = ?auto_519921 ?auto_519922 ) ) ( AVAILABLE ?auto_519923 ) ( ON ?auto_519921 ?auto_519919 ) ( not ( = ?auto_519919 ?auto_519921 ) ) ( not ( = ?auto_519919 ?auto_519922 ) ) ( TRUCK-AT ?auto_519926 ?auto_519927 ) ( not ( = ?auto_519927 ?auto_519925 ) ) ( HOIST-AT ?auto_519928 ?auto_519927 ) ( not ( = ?auto_519923 ?auto_519928 ) ) ( AVAILABLE ?auto_519928 ) ( SURFACE-AT ?auto_519922 ?auto_519927 ) ( ON ?auto_519922 ?auto_519924 ) ( CLEAR ?auto_519922 ) ( not ( = ?auto_519921 ?auto_519924 ) ) ( not ( = ?auto_519922 ?auto_519924 ) ) ( not ( = ?auto_519919 ?auto_519924 ) ) ( ON ?auto_519917 ?auto_519916 ) ( ON ?auto_519918 ?auto_519917 ) ( ON ?auto_519920 ?auto_519918 ) ( ON ?auto_519919 ?auto_519920 ) ( not ( = ?auto_519916 ?auto_519917 ) ) ( not ( = ?auto_519916 ?auto_519918 ) ) ( not ( = ?auto_519916 ?auto_519920 ) ) ( not ( = ?auto_519916 ?auto_519919 ) ) ( not ( = ?auto_519916 ?auto_519921 ) ) ( not ( = ?auto_519916 ?auto_519922 ) ) ( not ( = ?auto_519916 ?auto_519924 ) ) ( not ( = ?auto_519917 ?auto_519918 ) ) ( not ( = ?auto_519917 ?auto_519920 ) ) ( not ( = ?auto_519917 ?auto_519919 ) ) ( not ( = ?auto_519917 ?auto_519921 ) ) ( not ( = ?auto_519917 ?auto_519922 ) ) ( not ( = ?auto_519917 ?auto_519924 ) ) ( not ( = ?auto_519918 ?auto_519920 ) ) ( not ( = ?auto_519918 ?auto_519919 ) ) ( not ( = ?auto_519918 ?auto_519921 ) ) ( not ( = ?auto_519918 ?auto_519922 ) ) ( not ( = ?auto_519918 ?auto_519924 ) ) ( not ( = ?auto_519920 ?auto_519919 ) ) ( not ( = ?auto_519920 ?auto_519921 ) ) ( not ( = ?auto_519920 ?auto_519922 ) ) ( not ( = ?auto_519920 ?auto_519924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519919 ?auto_519921 ?auto_519922 )
      ( MAKE-6CRATE-VERIFY ?auto_519916 ?auto_519917 ?auto_519918 ?auto_519920 ?auto_519919 ?auto_519921 ?auto_519922 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_519980 - SURFACE
      ?auto_519981 - SURFACE
      ?auto_519982 - SURFACE
      ?auto_519984 - SURFACE
      ?auto_519983 - SURFACE
      ?auto_519985 - SURFACE
      ?auto_519986 - SURFACE
    )
    :vars
    (
      ?auto_519991 - HOIST
      ?auto_519992 - PLACE
      ?auto_519989 - PLACE
      ?auto_519987 - HOIST
      ?auto_519990 - SURFACE
      ?auto_519988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519991 ?auto_519992 ) ( SURFACE-AT ?auto_519985 ?auto_519992 ) ( CLEAR ?auto_519985 ) ( IS-CRATE ?auto_519986 ) ( not ( = ?auto_519985 ?auto_519986 ) ) ( AVAILABLE ?auto_519991 ) ( ON ?auto_519985 ?auto_519983 ) ( not ( = ?auto_519983 ?auto_519985 ) ) ( not ( = ?auto_519983 ?auto_519986 ) ) ( not ( = ?auto_519989 ?auto_519992 ) ) ( HOIST-AT ?auto_519987 ?auto_519989 ) ( not ( = ?auto_519991 ?auto_519987 ) ) ( AVAILABLE ?auto_519987 ) ( SURFACE-AT ?auto_519986 ?auto_519989 ) ( ON ?auto_519986 ?auto_519990 ) ( CLEAR ?auto_519986 ) ( not ( = ?auto_519985 ?auto_519990 ) ) ( not ( = ?auto_519986 ?auto_519990 ) ) ( not ( = ?auto_519983 ?auto_519990 ) ) ( TRUCK-AT ?auto_519988 ?auto_519992 ) ( ON ?auto_519981 ?auto_519980 ) ( ON ?auto_519982 ?auto_519981 ) ( ON ?auto_519984 ?auto_519982 ) ( ON ?auto_519983 ?auto_519984 ) ( not ( = ?auto_519980 ?auto_519981 ) ) ( not ( = ?auto_519980 ?auto_519982 ) ) ( not ( = ?auto_519980 ?auto_519984 ) ) ( not ( = ?auto_519980 ?auto_519983 ) ) ( not ( = ?auto_519980 ?auto_519985 ) ) ( not ( = ?auto_519980 ?auto_519986 ) ) ( not ( = ?auto_519980 ?auto_519990 ) ) ( not ( = ?auto_519981 ?auto_519982 ) ) ( not ( = ?auto_519981 ?auto_519984 ) ) ( not ( = ?auto_519981 ?auto_519983 ) ) ( not ( = ?auto_519981 ?auto_519985 ) ) ( not ( = ?auto_519981 ?auto_519986 ) ) ( not ( = ?auto_519981 ?auto_519990 ) ) ( not ( = ?auto_519982 ?auto_519984 ) ) ( not ( = ?auto_519982 ?auto_519983 ) ) ( not ( = ?auto_519982 ?auto_519985 ) ) ( not ( = ?auto_519982 ?auto_519986 ) ) ( not ( = ?auto_519982 ?auto_519990 ) ) ( not ( = ?auto_519984 ?auto_519983 ) ) ( not ( = ?auto_519984 ?auto_519985 ) ) ( not ( = ?auto_519984 ?auto_519986 ) ) ( not ( = ?auto_519984 ?auto_519990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_519983 ?auto_519985 ?auto_519986 )
      ( MAKE-6CRATE-VERIFY ?auto_519980 ?auto_519981 ?auto_519982 ?auto_519984 ?auto_519983 ?auto_519985 ?auto_519986 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520044 - SURFACE
      ?auto_520045 - SURFACE
      ?auto_520046 - SURFACE
      ?auto_520048 - SURFACE
      ?auto_520047 - SURFACE
      ?auto_520049 - SURFACE
      ?auto_520050 - SURFACE
    )
    :vars
    (
      ?auto_520052 - HOIST
      ?auto_520056 - PLACE
      ?auto_520053 - PLACE
      ?auto_520054 - HOIST
      ?auto_520051 - SURFACE
      ?auto_520055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520052 ?auto_520056 ) ( IS-CRATE ?auto_520050 ) ( not ( = ?auto_520049 ?auto_520050 ) ) ( not ( = ?auto_520047 ?auto_520049 ) ) ( not ( = ?auto_520047 ?auto_520050 ) ) ( not ( = ?auto_520053 ?auto_520056 ) ) ( HOIST-AT ?auto_520054 ?auto_520053 ) ( not ( = ?auto_520052 ?auto_520054 ) ) ( AVAILABLE ?auto_520054 ) ( SURFACE-AT ?auto_520050 ?auto_520053 ) ( ON ?auto_520050 ?auto_520051 ) ( CLEAR ?auto_520050 ) ( not ( = ?auto_520049 ?auto_520051 ) ) ( not ( = ?auto_520050 ?auto_520051 ) ) ( not ( = ?auto_520047 ?auto_520051 ) ) ( TRUCK-AT ?auto_520055 ?auto_520056 ) ( SURFACE-AT ?auto_520047 ?auto_520056 ) ( CLEAR ?auto_520047 ) ( LIFTING ?auto_520052 ?auto_520049 ) ( IS-CRATE ?auto_520049 ) ( ON ?auto_520045 ?auto_520044 ) ( ON ?auto_520046 ?auto_520045 ) ( ON ?auto_520048 ?auto_520046 ) ( ON ?auto_520047 ?auto_520048 ) ( not ( = ?auto_520044 ?auto_520045 ) ) ( not ( = ?auto_520044 ?auto_520046 ) ) ( not ( = ?auto_520044 ?auto_520048 ) ) ( not ( = ?auto_520044 ?auto_520047 ) ) ( not ( = ?auto_520044 ?auto_520049 ) ) ( not ( = ?auto_520044 ?auto_520050 ) ) ( not ( = ?auto_520044 ?auto_520051 ) ) ( not ( = ?auto_520045 ?auto_520046 ) ) ( not ( = ?auto_520045 ?auto_520048 ) ) ( not ( = ?auto_520045 ?auto_520047 ) ) ( not ( = ?auto_520045 ?auto_520049 ) ) ( not ( = ?auto_520045 ?auto_520050 ) ) ( not ( = ?auto_520045 ?auto_520051 ) ) ( not ( = ?auto_520046 ?auto_520048 ) ) ( not ( = ?auto_520046 ?auto_520047 ) ) ( not ( = ?auto_520046 ?auto_520049 ) ) ( not ( = ?auto_520046 ?auto_520050 ) ) ( not ( = ?auto_520046 ?auto_520051 ) ) ( not ( = ?auto_520048 ?auto_520047 ) ) ( not ( = ?auto_520048 ?auto_520049 ) ) ( not ( = ?auto_520048 ?auto_520050 ) ) ( not ( = ?auto_520048 ?auto_520051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520047 ?auto_520049 ?auto_520050 )
      ( MAKE-6CRATE-VERIFY ?auto_520044 ?auto_520045 ?auto_520046 ?auto_520048 ?auto_520047 ?auto_520049 ?auto_520050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520108 - SURFACE
      ?auto_520109 - SURFACE
      ?auto_520110 - SURFACE
      ?auto_520112 - SURFACE
      ?auto_520111 - SURFACE
      ?auto_520113 - SURFACE
      ?auto_520114 - SURFACE
    )
    :vars
    (
      ?auto_520116 - HOIST
      ?auto_520115 - PLACE
      ?auto_520119 - PLACE
      ?auto_520118 - HOIST
      ?auto_520117 - SURFACE
      ?auto_520120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520116 ?auto_520115 ) ( IS-CRATE ?auto_520114 ) ( not ( = ?auto_520113 ?auto_520114 ) ) ( not ( = ?auto_520111 ?auto_520113 ) ) ( not ( = ?auto_520111 ?auto_520114 ) ) ( not ( = ?auto_520119 ?auto_520115 ) ) ( HOIST-AT ?auto_520118 ?auto_520119 ) ( not ( = ?auto_520116 ?auto_520118 ) ) ( AVAILABLE ?auto_520118 ) ( SURFACE-AT ?auto_520114 ?auto_520119 ) ( ON ?auto_520114 ?auto_520117 ) ( CLEAR ?auto_520114 ) ( not ( = ?auto_520113 ?auto_520117 ) ) ( not ( = ?auto_520114 ?auto_520117 ) ) ( not ( = ?auto_520111 ?auto_520117 ) ) ( TRUCK-AT ?auto_520120 ?auto_520115 ) ( SURFACE-AT ?auto_520111 ?auto_520115 ) ( CLEAR ?auto_520111 ) ( IS-CRATE ?auto_520113 ) ( AVAILABLE ?auto_520116 ) ( IN ?auto_520113 ?auto_520120 ) ( ON ?auto_520109 ?auto_520108 ) ( ON ?auto_520110 ?auto_520109 ) ( ON ?auto_520112 ?auto_520110 ) ( ON ?auto_520111 ?auto_520112 ) ( not ( = ?auto_520108 ?auto_520109 ) ) ( not ( = ?auto_520108 ?auto_520110 ) ) ( not ( = ?auto_520108 ?auto_520112 ) ) ( not ( = ?auto_520108 ?auto_520111 ) ) ( not ( = ?auto_520108 ?auto_520113 ) ) ( not ( = ?auto_520108 ?auto_520114 ) ) ( not ( = ?auto_520108 ?auto_520117 ) ) ( not ( = ?auto_520109 ?auto_520110 ) ) ( not ( = ?auto_520109 ?auto_520112 ) ) ( not ( = ?auto_520109 ?auto_520111 ) ) ( not ( = ?auto_520109 ?auto_520113 ) ) ( not ( = ?auto_520109 ?auto_520114 ) ) ( not ( = ?auto_520109 ?auto_520117 ) ) ( not ( = ?auto_520110 ?auto_520112 ) ) ( not ( = ?auto_520110 ?auto_520111 ) ) ( not ( = ?auto_520110 ?auto_520113 ) ) ( not ( = ?auto_520110 ?auto_520114 ) ) ( not ( = ?auto_520110 ?auto_520117 ) ) ( not ( = ?auto_520112 ?auto_520111 ) ) ( not ( = ?auto_520112 ?auto_520113 ) ) ( not ( = ?auto_520112 ?auto_520114 ) ) ( not ( = ?auto_520112 ?auto_520117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520111 ?auto_520113 ?auto_520114 )
      ( MAKE-6CRATE-VERIFY ?auto_520108 ?auto_520109 ?auto_520110 ?auto_520112 ?auto_520111 ?auto_520113 ?auto_520114 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522064 - SURFACE
      ?auto_522065 - SURFACE
      ?auto_522066 - SURFACE
      ?auto_522068 - SURFACE
      ?auto_522067 - SURFACE
      ?auto_522069 - SURFACE
      ?auto_522070 - SURFACE
      ?auto_522071 - SURFACE
    )
    :vars
    (
      ?auto_522072 - HOIST
      ?auto_522073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522072 ?auto_522073 ) ( SURFACE-AT ?auto_522070 ?auto_522073 ) ( CLEAR ?auto_522070 ) ( LIFTING ?auto_522072 ?auto_522071 ) ( IS-CRATE ?auto_522071 ) ( not ( = ?auto_522070 ?auto_522071 ) ) ( ON ?auto_522065 ?auto_522064 ) ( ON ?auto_522066 ?auto_522065 ) ( ON ?auto_522068 ?auto_522066 ) ( ON ?auto_522067 ?auto_522068 ) ( ON ?auto_522069 ?auto_522067 ) ( ON ?auto_522070 ?auto_522069 ) ( not ( = ?auto_522064 ?auto_522065 ) ) ( not ( = ?auto_522064 ?auto_522066 ) ) ( not ( = ?auto_522064 ?auto_522068 ) ) ( not ( = ?auto_522064 ?auto_522067 ) ) ( not ( = ?auto_522064 ?auto_522069 ) ) ( not ( = ?auto_522064 ?auto_522070 ) ) ( not ( = ?auto_522064 ?auto_522071 ) ) ( not ( = ?auto_522065 ?auto_522066 ) ) ( not ( = ?auto_522065 ?auto_522068 ) ) ( not ( = ?auto_522065 ?auto_522067 ) ) ( not ( = ?auto_522065 ?auto_522069 ) ) ( not ( = ?auto_522065 ?auto_522070 ) ) ( not ( = ?auto_522065 ?auto_522071 ) ) ( not ( = ?auto_522066 ?auto_522068 ) ) ( not ( = ?auto_522066 ?auto_522067 ) ) ( not ( = ?auto_522066 ?auto_522069 ) ) ( not ( = ?auto_522066 ?auto_522070 ) ) ( not ( = ?auto_522066 ?auto_522071 ) ) ( not ( = ?auto_522068 ?auto_522067 ) ) ( not ( = ?auto_522068 ?auto_522069 ) ) ( not ( = ?auto_522068 ?auto_522070 ) ) ( not ( = ?auto_522068 ?auto_522071 ) ) ( not ( = ?auto_522067 ?auto_522069 ) ) ( not ( = ?auto_522067 ?auto_522070 ) ) ( not ( = ?auto_522067 ?auto_522071 ) ) ( not ( = ?auto_522069 ?auto_522070 ) ) ( not ( = ?auto_522069 ?auto_522071 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_522070 ?auto_522071 )
      ( MAKE-7CRATE-VERIFY ?auto_522064 ?auto_522065 ?auto_522066 ?auto_522068 ?auto_522067 ?auto_522069 ?auto_522070 ?auto_522071 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522119 - SURFACE
      ?auto_522120 - SURFACE
      ?auto_522121 - SURFACE
      ?auto_522123 - SURFACE
      ?auto_522122 - SURFACE
      ?auto_522124 - SURFACE
      ?auto_522125 - SURFACE
      ?auto_522126 - SURFACE
    )
    :vars
    (
      ?auto_522128 - HOIST
      ?auto_522127 - PLACE
      ?auto_522129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522128 ?auto_522127 ) ( SURFACE-AT ?auto_522125 ?auto_522127 ) ( CLEAR ?auto_522125 ) ( IS-CRATE ?auto_522126 ) ( not ( = ?auto_522125 ?auto_522126 ) ) ( TRUCK-AT ?auto_522129 ?auto_522127 ) ( AVAILABLE ?auto_522128 ) ( IN ?auto_522126 ?auto_522129 ) ( ON ?auto_522125 ?auto_522124 ) ( not ( = ?auto_522124 ?auto_522125 ) ) ( not ( = ?auto_522124 ?auto_522126 ) ) ( ON ?auto_522120 ?auto_522119 ) ( ON ?auto_522121 ?auto_522120 ) ( ON ?auto_522123 ?auto_522121 ) ( ON ?auto_522122 ?auto_522123 ) ( ON ?auto_522124 ?auto_522122 ) ( not ( = ?auto_522119 ?auto_522120 ) ) ( not ( = ?auto_522119 ?auto_522121 ) ) ( not ( = ?auto_522119 ?auto_522123 ) ) ( not ( = ?auto_522119 ?auto_522122 ) ) ( not ( = ?auto_522119 ?auto_522124 ) ) ( not ( = ?auto_522119 ?auto_522125 ) ) ( not ( = ?auto_522119 ?auto_522126 ) ) ( not ( = ?auto_522120 ?auto_522121 ) ) ( not ( = ?auto_522120 ?auto_522123 ) ) ( not ( = ?auto_522120 ?auto_522122 ) ) ( not ( = ?auto_522120 ?auto_522124 ) ) ( not ( = ?auto_522120 ?auto_522125 ) ) ( not ( = ?auto_522120 ?auto_522126 ) ) ( not ( = ?auto_522121 ?auto_522123 ) ) ( not ( = ?auto_522121 ?auto_522122 ) ) ( not ( = ?auto_522121 ?auto_522124 ) ) ( not ( = ?auto_522121 ?auto_522125 ) ) ( not ( = ?auto_522121 ?auto_522126 ) ) ( not ( = ?auto_522123 ?auto_522122 ) ) ( not ( = ?auto_522123 ?auto_522124 ) ) ( not ( = ?auto_522123 ?auto_522125 ) ) ( not ( = ?auto_522123 ?auto_522126 ) ) ( not ( = ?auto_522122 ?auto_522124 ) ) ( not ( = ?auto_522122 ?auto_522125 ) ) ( not ( = ?auto_522122 ?auto_522126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522124 ?auto_522125 ?auto_522126 )
      ( MAKE-7CRATE-VERIFY ?auto_522119 ?auto_522120 ?auto_522121 ?auto_522123 ?auto_522122 ?auto_522124 ?auto_522125 ?auto_522126 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522182 - SURFACE
      ?auto_522183 - SURFACE
      ?auto_522184 - SURFACE
      ?auto_522186 - SURFACE
      ?auto_522185 - SURFACE
      ?auto_522187 - SURFACE
      ?auto_522188 - SURFACE
      ?auto_522189 - SURFACE
    )
    :vars
    (
      ?auto_522190 - HOIST
      ?auto_522192 - PLACE
      ?auto_522193 - TRUCK
      ?auto_522191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522190 ?auto_522192 ) ( SURFACE-AT ?auto_522188 ?auto_522192 ) ( CLEAR ?auto_522188 ) ( IS-CRATE ?auto_522189 ) ( not ( = ?auto_522188 ?auto_522189 ) ) ( AVAILABLE ?auto_522190 ) ( IN ?auto_522189 ?auto_522193 ) ( ON ?auto_522188 ?auto_522187 ) ( not ( = ?auto_522187 ?auto_522188 ) ) ( not ( = ?auto_522187 ?auto_522189 ) ) ( TRUCK-AT ?auto_522193 ?auto_522191 ) ( not ( = ?auto_522191 ?auto_522192 ) ) ( ON ?auto_522183 ?auto_522182 ) ( ON ?auto_522184 ?auto_522183 ) ( ON ?auto_522186 ?auto_522184 ) ( ON ?auto_522185 ?auto_522186 ) ( ON ?auto_522187 ?auto_522185 ) ( not ( = ?auto_522182 ?auto_522183 ) ) ( not ( = ?auto_522182 ?auto_522184 ) ) ( not ( = ?auto_522182 ?auto_522186 ) ) ( not ( = ?auto_522182 ?auto_522185 ) ) ( not ( = ?auto_522182 ?auto_522187 ) ) ( not ( = ?auto_522182 ?auto_522188 ) ) ( not ( = ?auto_522182 ?auto_522189 ) ) ( not ( = ?auto_522183 ?auto_522184 ) ) ( not ( = ?auto_522183 ?auto_522186 ) ) ( not ( = ?auto_522183 ?auto_522185 ) ) ( not ( = ?auto_522183 ?auto_522187 ) ) ( not ( = ?auto_522183 ?auto_522188 ) ) ( not ( = ?auto_522183 ?auto_522189 ) ) ( not ( = ?auto_522184 ?auto_522186 ) ) ( not ( = ?auto_522184 ?auto_522185 ) ) ( not ( = ?auto_522184 ?auto_522187 ) ) ( not ( = ?auto_522184 ?auto_522188 ) ) ( not ( = ?auto_522184 ?auto_522189 ) ) ( not ( = ?auto_522186 ?auto_522185 ) ) ( not ( = ?auto_522186 ?auto_522187 ) ) ( not ( = ?auto_522186 ?auto_522188 ) ) ( not ( = ?auto_522186 ?auto_522189 ) ) ( not ( = ?auto_522185 ?auto_522187 ) ) ( not ( = ?auto_522185 ?auto_522188 ) ) ( not ( = ?auto_522185 ?auto_522189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522187 ?auto_522188 ?auto_522189 )
      ( MAKE-7CRATE-VERIFY ?auto_522182 ?auto_522183 ?auto_522184 ?auto_522186 ?auto_522185 ?auto_522187 ?auto_522188 ?auto_522189 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522252 - SURFACE
      ?auto_522253 - SURFACE
      ?auto_522254 - SURFACE
      ?auto_522256 - SURFACE
      ?auto_522255 - SURFACE
      ?auto_522257 - SURFACE
      ?auto_522258 - SURFACE
      ?auto_522259 - SURFACE
    )
    :vars
    (
      ?auto_522262 - HOIST
      ?auto_522261 - PLACE
      ?auto_522260 - TRUCK
      ?auto_522263 - PLACE
      ?auto_522264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_522262 ?auto_522261 ) ( SURFACE-AT ?auto_522258 ?auto_522261 ) ( CLEAR ?auto_522258 ) ( IS-CRATE ?auto_522259 ) ( not ( = ?auto_522258 ?auto_522259 ) ) ( AVAILABLE ?auto_522262 ) ( ON ?auto_522258 ?auto_522257 ) ( not ( = ?auto_522257 ?auto_522258 ) ) ( not ( = ?auto_522257 ?auto_522259 ) ) ( TRUCK-AT ?auto_522260 ?auto_522263 ) ( not ( = ?auto_522263 ?auto_522261 ) ) ( HOIST-AT ?auto_522264 ?auto_522263 ) ( LIFTING ?auto_522264 ?auto_522259 ) ( not ( = ?auto_522262 ?auto_522264 ) ) ( ON ?auto_522253 ?auto_522252 ) ( ON ?auto_522254 ?auto_522253 ) ( ON ?auto_522256 ?auto_522254 ) ( ON ?auto_522255 ?auto_522256 ) ( ON ?auto_522257 ?auto_522255 ) ( not ( = ?auto_522252 ?auto_522253 ) ) ( not ( = ?auto_522252 ?auto_522254 ) ) ( not ( = ?auto_522252 ?auto_522256 ) ) ( not ( = ?auto_522252 ?auto_522255 ) ) ( not ( = ?auto_522252 ?auto_522257 ) ) ( not ( = ?auto_522252 ?auto_522258 ) ) ( not ( = ?auto_522252 ?auto_522259 ) ) ( not ( = ?auto_522253 ?auto_522254 ) ) ( not ( = ?auto_522253 ?auto_522256 ) ) ( not ( = ?auto_522253 ?auto_522255 ) ) ( not ( = ?auto_522253 ?auto_522257 ) ) ( not ( = ?auto_522253 ?auto_522258 ) ) ( not ( = ?auto_522253 ?auto_522259 ) ) ( not ( = ?auto_522254 ?auto_522256 ) ) ( not ( = ?auto_522254 ?auto_522255 ) ) ( not ( = ?auto_522254 ?auto_522257 ) ) ( not ( = ?auto_522254 ?auto_522258 ) ) ( not ( = ?auto_522254 ?auto_522259 ) ) ( not ( = ?auto_522256 ?auto_522255 ) ) ( not ( = ?auto_522256 ?auto_522257 ) ) ( not ( = ?auto_522256 ?auto_522258 ) ) ( not ( = ?auto_522256 ?auto_522259 ) ) ( not ( = ?auto_522255 ?auto_522257 ) ) ( not ( = ?auto_522255 ?auto_522258 ) ) ( not ( = ?auto_522255 ?auto_522259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522257 ?auto_522258 ?auto_522259 )
      ( MAKE-7CRATE-VERIFY ?auto_522252 ?auto_522253 ?auto_522254 ?auto_522256 ?auto_522255 ?auto_522257 ?auto_522258 ?auto_522259 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522329 - SURFACE
      ?auto_522330 - SURFACE
      ?auto_522331 - SURFACE
      ?auto_522333 - SURFACE
      ?auto_522332 - SURFACE
      ?auto_522334 - SURFACE
      ?auto_522335 - SURFACE
      ?auto_522336 - SURFACE
    )
    :vars
    (
      ?auto_522337 - HOIST
      ?auto_522341 - PLACE
      ?auto_522339 - TRUCK
      ?auto_522340 - PLACE
      ?auto_522338 - HOIST
      ?auto_522342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522337 ?auto_522341 ) ( SURFACE-AT ?auto_522335 ?auto_522341 ) ( CLEAR ?auto_522335 ) ( IS-CRATE ?auto_522336 ) ( not ( = ?auto_522335 ?auto_522336 ) ) ( AVAILABLE ?auto_522337 ) ( ON ?auto_522335 ?auto_522334 ) ( not ( = ?auto_522334 ?auto_522335 ) ) ( not ( = ?auto_522334 ?auto_522336 ) ) ( TRUCK-AT ?auto_522339 ?auto_522340 ) ( not ( = ?auto_522340 ?auto_522341 ) ) ( HOIST-AT ?auto_522338 ?auto_522340 ) ( not ( = ?auto_522337 ?auto_522338 ) ) ( AVAILABLE ?auto_522338 ) ( SURFACE-AT ?auto_522336 ?auto_522340 ) ( ON ?auto_522336 ?auto_522342 ) ( CLEAR ?auto_522336 ) ( not ( = ?auto_522335 ?auto_522342 ) ) ( not ( = ?auto_522336 ?auto_522342 ) ) ( not ( = ?auto_522334 ?auto_522342 ) ) ( ON ?auto_522330 ?auto_522329 ) ( ON ?auto_522331 ?auto_522330 ) ( ON ?auto_522333 ?auto_522331 ) ( ON ?auto_522332 ?auto_522333 ) ( ON ?auto_522334 ?auto_522332 ) ( not ( = ?auto_522329 ?auto_522330 ) ) ( not ( = ?auto_522329 ?auto_522331 ) ) ( not ( = ?auto_522329 ?auto_522333 ) ) ( not ( = ?auto_522329 ?auto_522332 ) ) ( not ( = ?auto_522329 ?auto_522334 ) ) ( not ( = ?auto_522329 ?auto_522335 ) ) ( not ( = ?auto_522329 ?auto_522336 ) ) ( not ( = ?auto_522329 ?auto_522342 ) ) ( not ( = ?auto_522330 ?auto_522331 ) ) ( not ( = ?auto_522330 ?auto_522333 ) ) ( not ( = ?auto_522330 ?auto_522332 ) ) ( not ( = ?auto_522330 ?auto_522334 ) ) ( not ( = ?auto_522330 ?auto_522335 ) ) ( not ( = ?auto_522330 ?auto_522336 ) ) ( not ( = ?auto_522330 ?auto_522342 ) ) ( not ( = ?auto_522331 ?auto_522333 ) ) ( not ( = ?auto_522331 ?auto_522332 ) ) ( not ( = ?auto_522331 ?auto_522334 ) ) ( not ( = ?auto_522331 ?auto_522335 ) ) ( not ( = ?auto_522331 ?auto_522336 ) ) ( not ( = ?auto_522331 ?auto_522342 ) ) ( not ( = ?auto_522333 ?auto_522332 ) ) ( not ( = ?auto_522333 ?auto_522334 ) ) ( not ( = ?auto_522333 ?auto_522335 ) ) ( not ( = ?auto_522333 ?auto_522336 ) ) ( not ( = ?auto_522333 ?auto_522342 ) ) ( not ( = ?auto_522332 ?auto_522334 ) ) ( not ( = ?auto_522332 ?auto_522335 ) ) ( not ( = ?auto_522332 ?auto_522336 ) ) ( not ( = ?auto_522332 ?auto_522342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522334 ?auto_522335 ?auto_522336 )
      ( MAKE-7CRATE-VERIFY ?auto_522329 ?auto_522330 ?auto_522331 ?auto_522333 ?auto_522332 ?auto_522334 ?auto_522335 ?auto_522336 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522407 - SURFACE
      ?auto_522408 - SURFACE
      ?auto_522409 - SURFACE
      ?auto_522411 - SURFACE
      ?auto_522410 - SURFACE
      ?auto_522412 - SURFACE
      ?auto_522413 - SURFACE
      ?auto_522414 - SURFACE
    )
    :vars
    (
      ?auto_522420 - HOIST
      ?auto_522415 - PLACE
      ?auto_522418 - PLACE
      ?auto_522417 - HOIST
      ?auto_522419 - SURFACE
      ?auto_522416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522420 ?auto_522415 ) ( SURFACE-AT ?auto_522413 ?auto_522415 ) ( CLEAR ?auto_522413 ) ( IS-CRATE ?auto_522414 ) ( not ( = ?auto_522413 ?auto_522414 ) ) ( AVAILABLE ?auto_522420 ) ( ON ?auto_522413 ?auto_522412 ) ( not ( = ?auto_522412 ?auto_522413 ) ) ( not ( = ?auto_522412 ?auto_522414 ) ) ( not ( = ?auto_522418 ?auto_522415 ) ) ( HOIST-AT ?auto_522417 ?auto_522418 ) ( not ( = ?auto_522420 ?auto_522417 ) ) ( AVAILABLE ?auto_522417 ) ( SURFACE-AT ?auto_522414 ?auto_522418 ) ( ON ?auto_522414 ?auto_522419 ) ( CLEAR ?auto_522414 ) ( not ( = ?auto_522413 ?auto_522419 ) ) ( not ( = ?auto_522414 ?auto_522419 ) ) ( not ( = ?auto_522412 ?auto_522419 ) ) ( TRUCK-AT ?auto_522416 ?auto_522415 ) ( ON ?auto_522408 ?auto_522407 ) ( ON ?auto_522409 ?auto_522408 ) ( ON ?auto_522411 ?auto_522409 ) ( ON ?auto_522410 ?auto_522411 ) ( ON ?auto_522412 ?auto_522410 ) ( not ( = ?auto_522407 ?auto_522408 ) ) ( not ( = ?auto_522407 ?auto_522409 ) ) ( not ( = ?auto_522407 ?auto_522411 ) ) ( not ( = ?auto_522407 ?auto_522410 ) ) ( not ( = ?auto_522407 ?auto_522412 ) ) ( not ( = ?auto_522407 ?auto_522413 ) ) ( not ( = ?auto_522407 ?auto_522414 ) ) ( not ( = ?auto_522407 ?auto_522419 ) ) ( not ( = ?auto_522408 ?auto_522409 ) ) ( not ( = ?auto_522408 ?auto_522411 ) ) ( not ( = ?auto_522408 ?auto_522410 ) ) ( not ( = ?auto_522408 ?auto_522412 ) ) ( not ( = ?auto_522408 ?auto_522413 ) ) ( not ( = ?auto_522408 ?auto_522414 ) ) ( not ( = ?auto_522408 ?auto_522419 ) ) ( not ( = ?auto_522409 ?auto_522411 ) ) ( not ( = ?auto_522409 ?auto_522410 ) ) ( not ( = ?auto_522409 ?auto_522412 ) ) ( not ( = ?auto_522409 ?auto_522413 ) ) ( not ( = ?auto_522409 ?auto_522414 ) ) ( not ( = ?auto_522409 ?auto_522419 ) ) ( not ( = ?auto_522411 ?auto_522410 ) ) ( not ( = ?auto_522411 ?auto_522412 ) ) ( not ( = ?auto_522411 ?auto_522413 ) ) ( not ( = ?auto_522411 ?auto_522414 ) ) ( not ( = ?auto_522411 ?auto_522419 ) ) ( not ( = ?auto_522410 ?auto_522412 ) ) ( not ( = ?auto_522410 ?auto_522413 ) ) ( not ( = ?auto_522410 ?auto_522414 ) ) ( not ( = ?auto_522410 ?auto_522419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522412 ?auto_522413 ?auto_522414 )
      ( MAKE-7CRATE-VERIFY ?auto_522407 ?auto_522408 ?auto_522409 ?auto_522411 ?auto_522410 ?auto_522412 ?auto_522413 ?auto_522414 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522485 - SURFACE
      ?auto_522486 - SURFACE
      ?auto_522487 - SURFACE
      ?auto_522489 - SURFACE
      ?auto_522488 - SURFACE
      ?auto_522490 - SURFACE
      ?auto_522491 - SURFACE
      ?auto_522492 - SURFACE
    )
    :vars
    (
      ?auto_522496 - HOIST
      ?auto_522493 - PLACE
      ?auto_522497 - PLACE
      ?auto_522498 - HOIST
      ?auto_522494 - SURFACE
      ?auto_522495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522496 ?auto_522493 ) ( IS-CRATE ?auto_522492 ) ( not ( = ?auto_522491 ?auto_522492 ) ) ( not ( = ?auto_522490 ?auto_522491 ) ) ( not ( = ?auto_522490 ?auto_522492 ) ) ( not ( = ?auto_522497 ?auto_522493 ) ) ( HOIST-AT ?auto_522498 ?auto_522497 ) ( not ( = ?auto_522496 ?auto_522498 ) ) ( AVAILABLE ?auto_522498 ) ( SURFACE-AT ?auto_522492 ?auto_522497 ) ( ON ?auto_522492 ?auto_522494 ) ( CLEAR ?auto_522492 ) ( not ( = ?auto_522491 ?auto_522494 ) ) ( not ( = ?auto_522492 ?auto_522494 ) ) ( not ( = ?auto_522490 ?auto_522494 ) ) ( TRUCK-AT ?auto_522495 ?auto_522493 ) ( SURFACE-AT ?auto_522490 ?auto_522493 ) ( CLEAR ?auto_522490 ) ( LIFTING ?auto_522496 ?auto_522491 ) ( IS-CRATE ?auto_522491 ) ( ON ?auto_522486 ?auto_522485 ) ( ON ?auto_522487 ?auto_522486 ) ( ON ?auto_522489 ?auto_522487 ) ( ON ?auto_522488 ?auto_522489 ) ( ON ?auto_522490 ?auto_522488 ) ( not ( = ?auto_522485 ?auto_522486 ) ) ( not ( = ?auto_522485 ?auto_522487 ) ) ( not ( = ?auto_522485 ?auto_522489 ) ) ( not ( = ?auto_522485 ?auto_522488 ) ) ( not ( = ?auto_522485 ?auto_522490 ) ) ( not ( = ?auto_522485 ?auto_522491 ) ) ( not ( = ?auto_522485 ?auto_522492 ) ) ( not ( = ?auto_522485 ?auto_522494 ) ) ( not ( = ?auto_522486 ?auto_522487 ) ) ( not ( = ?auto_522486 ?auto_522489 ) ) ( not ( = ?auto_522486 ?auto_522488 ) ) ( not ( = ?auto_522486 ?auto_522490 ) ) ( not ( = ?auto_522486 ?auto_522491 ) ) ( not ( = ?auto_522486 ?auto_522492 ) ) ( not ( = ?auto_522486 ?auto_522494 ) ) ( not ( = ?auto_522487 ?auto_522489 ) ) ( not ( = ?auto_522487 ?auto_522488 ) ) ( not ( = ?auto_522487 ?auto_522490 ) ) ( not ( = ?auto_522487 ?auto_522491 ) ) ( not ( = ?auto_522487 ?auto_522492 ) ) ( not ( = ?auto_522487 ?auto_522494 ) ) ( not ( = ?auto_522489 ?auto_522488 ) ) ( not ( = ?auto_522489 ?auto_522490 ) ) ( not ( = ?auto_522489 ?auto_522491 ) ) ( not ( = ?auto_522489 ?auto_522492 ) ) ( not ( = ?auto_522489 ?auto_522494 ) ) ( not ( = ?auto_522488 ?auto_522490 ) ) ( not ( = ?auto_522488 ?auto_522491 ) ) ( not ( = ?auto_522488 ?auto_522492 ) ) ( not ( = ?auto_522488 ?auto_522494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522490 ?auto_522491 ?auto_522492 )
      ( MAKE-7CRATE-VERIFY ?auto_522485 ?auto_522486 ?auto_522487 ?auto_522489 ?auto_522488 ?auto_522490 ?auto_522491 ?auto_522492 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522563 - SURFACE
      ?auto_522564 - SURFACE
      ?auto_522565 - SURFACE
      ?auto_522567 - SURFACE
      ?auto_522566 - SURFACE
      ?auto_522568 - SURFACE
      ?auto_522569 - SURFACE
      ?auto_522570 - SURFACE
    )
    :vars
    (
      ?auto_522576 - HOIST
      ?auto_522572 - PLACE
      ?auto_522571 - PLACE
      ?auto_522574 - HOIST
      ?auto_522575 - SURFACE
      ?auto_522573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522576 ?auto_522572 ) ( IS-CRATE ?auto_522570 ) ( not ( = ?auto_522569 ?auto_522570 ) ) ( not ( = ?auto_522568 ?auto_522569 ) ) ( not ( = ?auto_522568 ?auto_522570 ) ) ( not ( = ?auto_522571 ?auto_522572 ) ) ( HOIST-AT ?auto_522574 ?auto_522571 ) ( not ( = ?auto_522576 ?auto_522574 ) ) ( AVAILABLE ?auto_522574 ) ( SURFACE-AT ?auto_522570 ?auto_522571 ) ( ON ?auto_522570 ?auto_522575 ) ( CLEAR ?auto_522570 ) ( not ( = ?auto_522569 ?auto_522575 ) ) ( not ( = ?auto_522570 ?auto_522575 ) ) ( not ( = ?auto_522568 ?auto_522575 ) ) ( TRUCK-AT ?auto_522573 ?auto_522572 ) ( SURFACE-AT ?auto_522568 ?auto_522572 ) ( CLEAR ?auto_522568 ) ( IS-CRATE ?auto_522569 ) ( AVAILABLE ?auto_522576 ) ( IN ?auto_522569 ?auto_522573 ) ( ON ?auto_522564 ?auto_522563 ) ( ON ?auto_522565 ?auto_522564 ) ( ON ?auto_522567 ?auto_522565 ) ( ON ?auto_522566 ?auto_522567 ) ( ON ?auto_522568 ?auto_522566 ) ( not ( = ?auto_522563 ?auto_522564 ) ) ( not ( = ?auto_522563 ?auto_522565 ) ) ( not ( = ?auto_522563 ?auto_522567 ) ) ( not ( = ?auto_522563 ?auto_522566 ) ) ( not ( = ?auto_522563 ?auto_522568 ) ) ( not ( = ?auto_522563 ?auto_522569 ) ) ( not ( = ?auto_522563 ?auto_522570 ) ) ( not ( = ?auto_522563 ?auto_522575 ) ) ( not ( = ?auto_522564 ?auto_522565 ) ) ( not ( = ?auto_522564 ?auto_522567 ) ) ( not ( = ?auto_522564 ?auto_522566 ) ) ( not ( = ?auto_522564 ?auto_522568 ) ) ( not ( = ?auto_522564 ?auto_522569 ) ) ( not ( = ?auto_522564 ?auto_522570 ) ) ( not ( = ?auto_522564 ?auto_522575 ) ) ( not ( = ?auto_522565 ?auto_522567 ) ) ( not ( = ?auto_522565 ?auto_522566 ) ) ( not ( = ?auto_522565 ?auto_522568 ) ) ( not ( = ?auto_522565 ?auto_522569 ) ) ( not ( = ?auto_522565 ?auto_522570 ) ) ( not ( = ?auto_522565 ?auto_522575 ) ) ( not ( = ?auto_522567 ?auto_522566 ) ) ( not ( = ?auto_522567 ?auto_522568 ) ) ( not ( = ?auto_522567 ?auto_522569 ) ) ( not ( = ?auto_522567 ?auto_522570 ) ) ( not ( = ?auto_522567 ?auto_522575 ) ) ( not ( = ?auto_522566 ?auto_522568 ) ) ( not ( = ?auto_522566 ?auto_522569 ) ) ( not ( = ?auto_522566 ?auto_522570 ) ) ( not ( = ?auto_522566 ?auto_522575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522568 ?auto_522569 ?auto_522570 )
      ( MAKE-7CRATE-VERIFY ?auto_522563 ?auto_522564 ?auto_522565 ?auto_522567 ?auto_522566 ?auto_522568 ?auto_522569 ?auto_522570 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525482 - SURFACE
      ?auto_525483 - SURFACE
      ?auto_525484 - SURFACE
      ?auto_525486 - SURFACE
      ?auto_525485 - SURFACE
      ?auto_525487 - SURFACE
      ?auto_525488 - SURFACE
      ?auto_525489 - SURFACE
      ?auto_525490 - SURFACE
    )
    :vars
    (
      ?auto_525491 - HOIST
      ?auto_525492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525491 ?auto_525492 ) ( SURFACE-AT ?auto_525489 ?auto_525492 ) ( CLEAR ?auto_525489 ) ( LIFTING ?auto_525491 ?auto_525490 ) ( IS-CRATE ?auto_525490 ) ( not ( = ?auto_525489 ?auto_525490 ) ) ( ON ?auto_525483 ?auto_525482 ) ( ON ?auto_525484 ?auto_525483 ) ( ON ?auto_525486 ?auto_525484 ) ( ON ?auto_525485 ?auto_525486 ) ( ON ?auto_525487 ?auto_525485 ) ( ON ?auto_525488 ?auto_525487 ) ( ON ?auto_525489 ?auto_525488 ) ( not ( = ?auto_525482 ?auto_525483 ) ) ( not ( = ?auto_525482 ?auto_525484 ) ) ( not ( = ?auto_525482 ?auto_525486 ) ) ( not ( = ?auto_525482 ?auto_525485 ) ) ( not ( = ?auto_525482 ?auto_525487 ) ) ( not ( = ?auto_525482 ?auto_525488 ) ) ( not ( = ?auto_525482 ?auto_525489 ) ) ( not ( = ?auto_525482 ?auto_525490 ) ) ( not ( = ?auto_525483 ?auto_525484 ) ) ( not ( = ?auto_525483 ?auto_525486 ) ) ( not ( = ?auto_525483 ?auto_525485 ) ) ( not ( = ?auto_525483 ?auto_525487 ) ) ( not ( = ?auto_525483 ?auto_525488 ) ) ( not ( = ?auto_525483 ?auto_525489 ) ) ( not ( = ?auto_525483 ?auto_525490 ) ) ( not ( = ?auto_525484 ?auto_525486 ) ) ( not ( = ?auto_525484 ?auto_525485 ) ) ( not ( = ?auto_525484 ?auto_525487 ) ) ( not ( = ?auto_525484 ?auto_525488 ) ) ( not ( = ?auto_525484 ?auto_525489 ) ) ( not ( = ?auto_525484 ?auto_525490 ) ) ( not ( = ?auto_525486 ?auto_525485 ) ) ( not ( = ?auto_525486 ?auto_525487 ) ) ( not ( = ?auto_525486 ?auto_525488 ) ) ( not ( = ?auto_525486 ?auto_525489 ) ) ( not ( = ?auto_525486 ?auto_525490 ) ) ( not ( = ?auto_525485 ?auto_525487 ) ) ( not ( = ?auto_525485 ?auto_525488 ) ) ( not ( = ?auto_525485 ?auto_525489 ) ) ( not ( = ?auto_525485 ?auto_525490 ) ) ( not ( = ?auto_525487 ?auto_525488 ) ) ( not ( = ?auto_525487 ?auto_525489 ) ) ( not ( = ?auto_525487 ?auto_525490 ) ) ( not ( = ?auto_525488 ?auto_525489 ) ) ( not ( = ?auto_525488 ?auto_525490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_525489 ?auto_525490 )
      ( MAKE-8CRATE-VERIFY ?auto_525482 ?auto_525483 ?auto_525484 ?auto_525486 ?auto_525485 ?auto_525487 ?auto_525488 ?auto_525489 ?auto_525490 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525549 - SURFACE
      ?auto_525550 - SURFACE
      ?auto_525551 - SURFACE
      ?auto_525553 - SURFACE
      ?auto_525552 - SURFACE
      ?auto_525554 - SURFACE
      ?auto_525555 - SURFACE
      ?auto_525556 - SURFACE
      ?auto_525557 - SURFACE
    )
    :vars
    (
      ?auto_525558 - HOIST
      ?auto_525560 - PLACE
      ?auto_525559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_525558 ?auto_525560 ) ( SURFACE-AT ?auto_525556 ?auto_525560 ) ( CLEAR ?auto_525556 ) ( IS-CRATE ?auto_525557 ) ( not ( = ?auto_525556 ?auto_525557 ) ) ( TRUCK-AT ?auto_525559 ?auto_525560 ) ( AVAILABLE ?auto_525558 ) ( IN ?auto_525557 ?auto_525559 ) ( ON ?auto_525556 ?auto_525555 ) ( not ( = ?auto_525555 ?auto_525556 ) ) ( not ( = ?auto_525555 ?auto_525557 ) ) ( ON ?auto_525550 ?auto_525549 ) ( ON ?auto_525551 ?auto_525550 ) ( ON ?auto_525553 ?auto_525551 ) ( ON ?auto_525552 ?auto_525553 ) ( ON ?auto_525554 ?auto_525552 ) ( ON ?auto_525555 ?auto_525554 ) ( not ( = ?auto_525549 ?auto_525550 ) ) ( not ( = ?auto_525549 ?auto_525551 ) ) ( not ( = ?auto_525549 ?auto_525553 ) ) ( not ( = ?auto_525549 ?auto_525552 ) ) ( not ( = ?auto_525549 ?auto_525554 ) ) ( not ( = ?auto_525549 ?auto_525555 ) ) ( not ( = ?auto_525549 ?auto_525556 ) ) ( not ( = ?auto_525549 ?auto_525557 ) ) ( not ( = ?auto_525550 ?auto_525551 ) ) ( not ( = ?auto_525550 ?auto_525553 ) ) ( not ( = ?auto_525550 ?auto_525552 ) ) ( not ( = ?auto_525550 ?auto_525554 ) ) ( not ( = ?auto_525550 ?auto_525555 ) ) ( not ( = ?auto_525550 ?auto_525556 ) ) ( not ( = ?auto_525550 ?auto_525557 ) ) ( not ( = ?auto_525551 ?auto_525553 ) ) ( not ( = ?auto_525551 ?auto_525552 ) ) ( not ( = ?auto_525551 ?auto_525554 ) ) ( not ( = ?auto_525551 ?auto_525555 ) ) ( not ( = ?auto_525551 ?auto_525556 ) ) ( not ( = ?auto_525551 ?auto_525557 ) ) ( not ( = ?auto_525553 ?auto_525552 ) ) ( not ( = ?auto_525553 ?auto_525554 ) ) ( not ( = ?auto_525553 ?auto_525555 ) ) ( not ( = ?auto_525553 ?auto_525556 ) ) ( not ( = ?auto_525553 ?auto_525557 ) ) ( not ( = ?auto_525552 ?auto_525554 ) ) ( not ( = ?auto_525552 ?auto_525555 ) ) ( not ( = ?auto_525552 ?auto_525556 ) ) ( not ( = ?auto_525552 ?auto_525557 ) ) ( not ( = ?auto_525554 ?auto_525555 ) ) ( not ( = ?auto_525554 ?auto_525556 ) ) ( not ( = ?auto_525554 ?auto_525557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525555 ?auto_525556 ?auto_525557 )
      ( MAKE-8CRATE-VERIFY ?auto_525549 ?auto_525550 ?auto_525551 ?auto_525553 ?auto_525552 ?auto_525554 ?auto_525555 ?auto_525556 ?auto_525557 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525625 - SURFACE
      ?auto_525626 - SURFACE
      ?auto_525627 - SURFACE
      ?auto_525629 - SURFACE
      ?auto_525628 - SURFACE
      ?auto_525630 - SURFACE
      ?auto_525631 - SURFACE
      ?auto_525632 - SURFACE
      ?auto_525633 - SURFACE
    )
    :vars
    (
      ?auto_525635 - HOIST
      ?auto_525637 - PLACE
      ?auto_525634 - TRUCK
      ?auto_525636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525635 ?auto_525637 ) ( SURFACE-AT ?auto_525632 ?auto_525637 ) ( CLEAR ?auto_525632 ) ( IS-CRATE ?auto_525633 ) ( not ( = ?auto_525632 ?auto_525633 ) ) ( AVAILABLE ?auto_525635 ) ( IN ?auto_525633 ?auto_525634 ) ( ON ?auto_525632 ?auto_525631 ) ( not ( = ?auto_525631 ?auto_525632 ) ) ( not ( = ?auto_525631 ?auto_525633 ) ) ( TRUCK-AT ?auto_525634 ?auto_525636 ) ( not ( = ?auto_525636 ?auto_525637 ) ) ( ON ?auto_525626 ?auto_525625 ) ( ON ?auto_525627 ?auto_525626 ) ( ON ?auto_525629 ?auto_525627 ) ( ON ?auto_525628 ?auto_525629 ) ( ON ?auto_525630 ?auto_525628 ) ( ON ?auto_525631 ?auto_525630 ) ( not ( = ?auto_525625 ?auto_525626 ) ) ( not ( = ?auto_525625 ?auto_525627 ) ) ( not ( = ?auto_525625 ?auto_525629 ) ) ( not ( = ?auto_525625 ?auto_525628 ) ) ( not ( = ?auto_525625 ?auto_525630 ) ) ( not ( = ?auto_525625 ?auto_525631 ) ) ( not ( = ?auto_525625 ?auto_525632 ) ) ( not ( = ?auto_525625 ?auto_525633 ) ) ( not ( = ?auto_525626 ?auto_525627 ) ) ( not ( = ?auto_525626 ?auto_525629 ) ) ( not ( = ?auto_525626 ?auto_525628 ) ) ( not ( = ?auto_525626 ?auto_525630 ) ) ( not ( = ?auto_525626 ?auto_525631 ) ) ( not ( = ?auto_525626 ?auto_525632 ) ) ( not ( = ?auto_525626 ?auto_525633 ) ) ( not ( = ?auto_525627 ?auto_525629 ) ) ( not ( = ?auto_525627 ?auto_525628 ) ) ( not ( = ?auto_525627 ?auto_525630 ) ) ( not ( = ?auto_525627 ?auto_525631 ) ) ( not ( = ?auto_525627 ?auto_525632 ) ) ( not ( = ?auto_525627 ?auto_525633 ) ) ( not ( = ?auto_525629 ?auto_525628 ) ) ( not ( = ?auto_525629 ?auto_525630 ) ) ( not ( = ?auto_525629 ?auto_525631 ) ) ( not ( = ?auto_525629 ?auto_525632 ) ) ( not ( = ?auto_525629 ?auto_525633 ) ) ( not ( = ?auto_525628 ?auto_525630 ) ) ( not ( = ?auto_525628 ?auto_525631 ) ) ( not ( = ?auto_525628 ?auto_525632 ) ) ( not ( = ?auto_525628 ?auto_525633 ) ) ( not ( = ?auto_525630 ?auto_525631 ) ) ( not ( = ?auto_525630 ?auto_525632 ) ) ( not ( = ?auto_525630 ?auto_525633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525631 ?auto_525632 ?auto_525633 )
      ( MAKE-8CRATE-VERIFY ?auto_525625 ?auto_525626 ?auto_525627 ?auto_525629 ?auto_525628 ?auto_525630 ?auto_525631 ?auto_525632 ?auto_525633 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525709 - SURFACE
      ?auto_525710 - SURFACE
      ?auto_525711 - SURFACE
      ?auto_525713 - SURFACE
      ?auto_525712 - SURFACE
      ?auto_525714 - SURFACE
      ?auto_525715 - SURFACE
      ?auto_525716 - SURFACE
      ?auto_525717 - SURFACE
    )
    :vars
    (
      ?auto_525722 - HOIST
      ?auto_525718 - PLACE
      ?auto_525721 - TRUCK
      ?auto_525720 - PLACE
      ?auto_525719 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_525722 ?auto_525718 ) ( SURFACE-AT ?auto_525716 ?auto_525718 ) ( CLEAR ?auto_525716 ) ( IS-CRATE ?auto_525717 ) ( not ( = ?auto_525716 ?auto_525717 ) ) ( AVAILABLE ?auto_525722 ) ( ON ?auto_525716 ?auto_525715 ) ( not ( = ?auto_525715 ?auto_525716 ) ) ( not ( = ?auto_525715 ?auto_525717 ) ) ( TRUCK-AT ?auto_525721 ?auto_525720 ) ( not ( = ?auto_525720 ?auto_525718 ) ) ( HOIST-AT ?auto_525719 ?auto_525720 ) ( LIFTING ?auto_525719 ?auto_525717 ) ( not ( = ?auto_525722 ?auto_525719 ) ) ( ON ?auto_525710 ?auto_525709 ) ( ON ?auto_525711 ?auto_525710 ) ( ON ?auto_525713 ?auto_525711 ) ( ON ?auto_525712 ?auto_525713 ) ( ON ?auto_525714 ?auto_525712 ) ( ON ?auto_525715 ?auto_525714 ) ( not ( = ?auto_525709 ?auto_525710 ) ) ( not ( = ?auto_525709 ?auto_525711 ) ) ( not ( = ?auto_525709 ?auto_525713 ) ) ( not ( = ?auto_525709 ?auto_525712 ) ) ( not ( = ?auto_525709 ?auto_525714 ) ) ( not ( = ?auto_525709 ?auto_525715 ) ) ( not ( = ?auto_525709 ?auto_525716 ) ) ( not ( = ?auto_525709 ?auto_525717 ) ) ( not ( = ?auto_525710 ?auto_525711 ) ) ( not ( = ?auto_525710 ?auto_525713 ) ) ( not ( = ?auto_525710 ?auto_525712 ) ) ( not ( = ?auto_525710 ?auto_525714 ) ) ( not ( = ?auto_525710 ?auto_525715 ) ) ( not ( = ?auto_525710 ?auto_525716 ) ) ( not ( = ?auto_525710 ?auto_525717 ) ) ( not ( = ?auto_525711 ?auto_525713 ) ) ( not ( = ?auto_525711 ?auto_525712 ) ) ( not ( = ?auto_525711 ?auto_525714 ) ) ( not ( = ?auto_525711 ?auto_525715 ) ) ( not ( = ?auto_525711 ?auto_525716 ) ) ( not ( = ?auto_525711 ?auto_525717 ) ) ( not ( = ?auto_525713 ?auto_525712 ) ) ( not ( = ?auto_525713 ?auto_525714 ) ) ( not ( = ?auto_525713 ?auto_525715 ) ) ( not ( = ?auto_525713 ?auto_525716 ) ) ( not ( = ?auto_525713 ?auto_525717 ) ) ( not ( = ?auto_525712 ?auto_525714 ) ) ( not ( = ?auto_525712 ?auto_525715 ) ) ( not ( = ?auto_525712 ?auto_525716 ) ) ( not ( = ?auto_525712 ?auto_525717 ) ) ( not ( = ?auto_525714 ?auto_525715 ) ) ( not ( = ?auto_525714 ?auto_525716 ) ) ( not ( = ?auto_525714 ?auto_525717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525715 ?auto_525716 ?auto_525717 )
      ( MAKE-8CRATE-VERIFY ?auto_525709 ?auto_525710 ?auto_525711 ?auto_525713 ?auto_525712 ?auto_525714 ?auto_525715 ?auto_525716 ?auto_525717 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525801 - SURFACE
      ?auto_525802 - SURFACE
      ?auto_525803 - SURFACE
      ?auto_525805 - SURFACE
      ?auto_525804 - SURFACE
      ?auto_525806 - SURFACE
      ?auto_525807 - SURFACE
      ?auto_525808 - SURFACE
      ?auto_525809 - SURFACE
    )
    :vars
    (
      ?auto_525811 - HOIST
      ?auto_525812 - PLACE
      ?auto_525810 - TRUCK
      ?auto_525813 - PLACE
      ?auto_525815 - HOIST
      ?auto_525814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525811 ?auto_525812 ) ( SURFACE-AT ?auto_525808 ?auto_525812 ) ( CLEAR ?auto_525808 ) ( IS-CRATE ?auto_525809 ) ( not ( = ?auto_525808 ?auto_525809 ) ) ( AVAILABLE ?auto_525811 ) ( ON ?auto_525808 ?auto_525807 ) ( not ( = ?auto_525807 ?auto_525808 ) ) ( not ( = ?auto_525807 ?auto_525809 ) ) ( TRUCK-AT ?auto_525810 ?auto_525813 ) ( not ( = ?auto_525813 ?auto_525812 ) ) ( HOIST-AT ?auto_525815 ?auto_525813 ) ( not ( = ?auto_525811 ?auto_525815 ) ) ( AVAILABLE ?auto_525815 ) ( SURFACE-AT ?auto_525809 ?auto_525813 ) ( ON ?auto_525809 ?auto_525814 ) ( CLEAR ?auto_525809 ) ( not ( = ?auto_525808 ?auto_525814 ) ) ( not ( = ?auto_525809 ?auto_525814 ) ) ( not ( = ?auto_525807 ?auto_525814 ) ) ( ON ?auto_525802 ?auto_525801 ) ( ON ?auto_525803 ?auto_525802 ) ( ON ?auto_525805 ?auto_525803 ) ( ON ?auto_525804 ?auto_525805 ) ( ON ?auto_525806 ?auto_525804 ) ( ON ?auto_525807 ?auto_525806 ) ( not ( = ?auto_525801 ?auto_525802 ) ) ( not ( = ?auto_525801 ?auto_525803 ) ) ( not ( = ?auto_525801 ?auto_525805 ) ) ( not ( = ?auto_525801 ?auto_525804 ) ) ( not ( = ?auto_525801 ?auto_525806 ) ) ( not ( = ?auto_525801 ?auto_525807 ) ) ( not ( = ?auto_525801 ?auto_525808 ) ) ( not ( = ?auto_525801 ?auto_525809 ) ) ( not ( = ?auto_525801 ?auto_525814 ) ) ( not ( = ?auto_525802 ?auto_525803 ) ) ( not ( = ?auto_525802 ?auto_525805 ) ) ( not ( = ?auto_525802 ?auto_525804 ) ) ( not ( = ?auto_525802 ?auto_525806 ) ) ( not ( = ?auto_525802 ?auto_525807 ) ) ( not ( = ?auto_525802 ?auto_525808 ) ) ( not ( = ?auto_525802 ?auto_525809 ) ) ( not ( = ?auto_525802 ?auto_525814 ) ) ( not ( = ?auto_525803 ?auto_525805 ) ) ( not ( = ?auto_525803 ?auto_525804 ) ) ( not ( = ?auto_525803 ?auto_525806 ) ) ( not ( = ?auto_525803 ?auto_525807 ) ) ( not ( = ?auto_525803 ?auto_525808 ) ) ( not ( = ?auto_525803 ?auto_525809 ) ) ( not ( = ?auto_525803 ?auto_525814 ) ) ( not ( = ?auto_525805 ?auto_525804 ) ) ( not ( = ?auto_525805 ?auto_525806 ) ) ( not ( = ?auto_525805 ?auto_525807 ) ) ( not ( = ?auto_525805 ?auto_525808 ) ) ( not ( = ?auto_525805 ?auto_525809 ) ) ( not ( = ?auto_525805 ?auto_525814 ) ) ( not ( = ?auto_525804 ?auto_525806 ) ) ( not ( = ?auto_525804 ?auto_525807 ) ) ( not ( = ?auto_525804 ?auto_525808 ) ) ( not ( = ?auto_525804 ?auto_525809 ) ) ( not ( = ?auto_525804 ?auto_525814 ) ) ( not ( = ?auto_525806 ?auto_525807 ) ) ( not ( = ?auto_525806 ?auto_525808 ) ) ( not ( = ?auto_525806 ?auto_525809 ) ) ( not ( = ?auto_525806 ?auto_525814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525807 ?auto_525808 ?auto_525809 )
      ( MAKE-8CRATE-VERIFY ?auto_525801 ?auto_525802 ?auto_525803 ?auto_525805 ?auto_525804 ?auto_525806 ?auto_525807 ?auto_525808 ?auto_525809 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525894 - SURFACE
      ?auto_525895 - SURFACE
      ?auto_525896 - SURFACE
      ?auto_525898 - SURFACE
      ?auto_525897 - SURFACE
      ?auto_525899 - SURFACE
      ?auto_525900 - SURFACE
      ?auto_525901 - SURFACE
      ?auto_525902 - SURFACE
    )
    :vars
    (
      ?auto_525904 - HOIST
      ?auto_525903 - PLACE
      ?auto_525905 - PLACE
      ?auto_525906 - HOIST
      ?auto_525908 - SURFACE
      ?auto_525907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_525904 ?auto_525903 ) ( SURFACE-AT ?auto_525901 ?auto_525903 ) ( CLEAR ?auto_525901 ) ( IS-CRATE ?auto_525902 ) ( not ( = ?auto_525901 ?auto_525902 ) ) ( AVAILABLE ?auto_525904 ) ( ON ?auto_525901 ?auto_525900 ) ( not ( = ?auto_525900 ?auto_525901 ) ) ( not ( = ?auto_525900 ?auto_525902 ) ) ( not ( = ?auto_525905 ?auto_525903 ) ) ( HOIST-AT ?auto_525906 ?auto_525905 ) ( not ( = ?auto_525904 ?auto_525906 ) ) ( AVAILABLE ?auto_525906 ) ( SURFACE-AT ?auto_525902 ?auto_525905 ) ( ON ?auto_525902 ?auto_525908 ) ( CLEAR ?auto_525902 ) ( not ( = ?auto_525901 ?auto_525908 ) ) ( not ( = ?auto_525902 ?auto_525908 ) ) ( not ( = ?auto_525900 ?auto_525908 ) ) ( TRUCK-AT ?auto_525907 ?auto_525903 ) ( ON ?auto_525895 ?auto_525894 ) ( ON ?auto_525896 ?auto_525895 ) ( ON ?auto_525898 ?auto_525896 ) ( ON ?auto_525897 ?auto_525898 ) ( ON ?auto_525899 ?auto_525897 ) ( ON ?auto_525900 ?auto_525899 ) ( not ( = ?auto_525894 ?auto_525895 ) ) ( not ( = ?auto_525894 ?auto_525896 ) ) ( not ( = ?auto_525894 ?auto_525898 ) ) ( not ( = ?auto_525894 ?auto_525897 ) ) ( not ( = ?auto_525894 ?auto_525899 ) ) ( not ( = ?auto_525894 ?auto_525900 ) ) ( not ( = ?auto_525894 ?auto_525901 ) ) ( not ( = ?auto_525894 ?auto_525902 ) ) ( not ( = ?auto_525894 ?auto_525908 ) ) ( not ( = ?auto_525895 ?auto_525896 ) ) ( not ( = ?auto_525895 ?auto_525898 ) ) ( not ( = ?auto_525895 ?auto_525897 ) ) ( not ( = ?auto_525895 ?auto_525899 ) ) ( not ( = ?auto_525895 ?auto_525900 ) ) ( not ( = ?auto_525895 ?auto_525901 ) ) ( not ( = ?auto_525895 ?auto_525902 ) ) ( not ( = ?auto_525895 ?auto_525908 ) ) ( not ( = ?auto_525896 ?auto_525898 ) ) ( not ( = ?auto_525896 ?auto_525897 ) ) ( not ( = ?auto_525896 ?auto_525899 ) ) ( not ( = ?auto_525896 ?auto_525900 ) ) ( not ( = ?auto_525896 ?auto_525901 ) ) ( not ( = ?auto_525896 ?auto_525902 ) ) ( not ( = ?auto_525896 ?auto_525908 ) ) ( not ( = ?auto_525898 ?auto_525897 ) ) ( not ( = ?auto_525898 ?auto_525899 ) ) ( not ( = ?auto_525898 ?auto_525900 ) ) ( not ( = ?auto_525898 ?auto_525901 ) ) ( not ( = ?auto_525898 ?auto_525902 ) ) ( not ( = ?auto_525898 ?auto_525908 ) ) ( not ( = ?auto_525897 ?auto_525899 ) ) ( not ( = ?auto_525897 ?auto_525900 ) ) ( not ( = ?auto_525897 ?auto_525901 ) ) ( not ( = ?auto_525897 ?auto_525902 ) ) ( not ( = ?auto_525897 ?auto_525908 ) ) ( not ( = ?auto_525899 ?auto_525900 ) ) ( not ( = ?auto_525899 ?auto_525901 ) ) ( not ( = ?auto_525899 ?auto_525902 ) ) ( not ( = ?auto_525899 ?auto_525908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525900 ?auto_525901 ?auto_525902 )
      ( MAKE-8CRATE-VERIFY ?auto_525894 ?auto_525895 ?auto_525896 ?auto_525898 ?auto_525897 ?auto_525899 ?auto_525900 ?auto_525901 ?auto_525902 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525987 - SURFACE
      ?auto_525988 - SURFACE
      ?auto_525989 - SURFACE
      ?auto_525991 - SURFACE
      ?auto_525990 - SURFACE
      ?auto_525992 - SURFACE
      ?auto_525993 - SURFACE
      ?auto_525994 - SURFACE
      ?auto_525995 - SURFACE
    )
    :vars
    (
      ?auto_525996 - HOIST
      ?auto_526000 - PLACE
      ?auto_525997 - PLACE
      ?auto_526001 - HOIST
      ?auto_525999 - SURFACE
      ?auto_525998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_525996 ?auto_526000 ) ( IS-CRATE ?auto_525995 ) ( not ( = ?auto_525994 ?auto_525995 ) ) ( not ( = ?auto_525993 ?auto_525994 ) ) ( not ( = ?auto_525993 ?auto_525995 ) ) ( not ( = ?auto_525997 ?auto_526000 ) ) ( HOIST-AT ?auto_526001 ?auto_525997 ) ( not ( = ?auto_525996 ?auto_526001 ) ) ( AVAILABLE ?auto_526001 ) ( SURFACE-AT ?auto_525995 ?auto_525997 ) ( ON ?auto_525995 ?auto_525999 ) ( CLEAR ?auto_525995 ) ( not ( = ?auto_525994 ?auto_525999 ) ) ( not ( = ?auto_525995 ?auto_525999 ) ) ( not ( = ?auto_525993 ?auto_525999 ) ) ( TRUCK-AT ?auto_525998 ?auto_526000 ) ( SURFACE-AT ?auto_525993 ?auto_526000 ) ( CLEAR ?auto_525993 ) ( LIFTING ?auto_525996 ?auto_525994 ) ( IS-CRATE ?auto_525994 ) ( ON ?auto_525988 ?auto_525987 ) ( ON ?auto_525989 ?auto_525988 ) ( ON ?auto_525991 ?auto_525989 ) ( ON ?auto_525990 ?auto_525991 ) ( ON ?auto_525992 ?auto_525990 ) ( ON ?auto_525993 ?auto_525992 ) ( not ( = ?auto_525987 ?auto_525988 ) ) ( not ( = ?auto_525987 ?auto_525989 ) ) ( not ( = ?auto_525987 ?auto_525991 ) ) ( not ( = ?auto_525987 ?auto_525990 ) ) ( not ( = ?auto_525987 ?auto_525992 ) ) ( not ( = ?auto_525987 ?auto_525993 ) ) ( not ( = ?auto_525987 ?auto_525994 ) ) ( not ( = ?auto_525987 ?auto_525995 ) ) ( not ( = ?auto_525987 ?auto_525999 ) ) ( not ( = ?auto_525988 ?auto_525989 ) ) ( not ( = ?auto_525988 ?auto_525991 ) ) ( not ( = ?auto_525988 ?auto_525990 ) ) ( not ( = ?auto_525988 ?auto_525992 ) ) ( not ( = ?auto_525988 ?auto_525993 ) ) ( not ( = ?auto_525988 ?auto_525994 ) ) ( not ( = ?auto_525988 ?auto_525995 ) ) ( not ( = ?auto_525988 ?auto_525999 ) ) ( not ( = ?auto_525989 ?auto_525991 ) ) ( not ( = ?auto_525989 ?auto_525990 ) ) ( not ( = ?auto_525989 ?auto_525992 ) ) ( not ( = ?auto_525989 ?auto_525993 ) ) ( not ( = ?auto_525989 ?auto_525994 ) ) ( not ( = ?auto_525989 ?auto_525995 ) ) ( not ( = ?auto_525989 ?auto_525999 ) ) ( not ( = ?auto_525991 ?auto_525990 ) ) ( not ( = ?auto_525991 ?auto_525992 ) ) ( not ( = ?auto_525991 ?auto_525993 ) ) ( not ( = ?auto_525991 ?auto_525994 ) ) ( not ( = ?auto_525991 ?auto_525995 ) ) ( not ( = ?auto_525991 ?auto_525999 ) ) ( not ( = ?auto_525990 ?auto_525992 ) ) ( not ( = ?auto_525990 ?auto_525993 ) ) ( not ( = ?auto_525990 ?auto_525994 ) ) ( not ( = ?auto_525990 ?auto_525995 ) ) ( not ( = ?auto_525990 ?auto_525999 ) ) ( not ( = ?auto_525992 ?auto_525993 ) ) ( not ( = ?auto_525992 ?auto_525994 ) ) ( not ( = ?auto_525992 ?auto_525995 ) ) ( not ( = ?auto_525992 ?auto_525999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_525993 ?auto_525994 ?auto_525995 )
      ( MAKE-8CRATE-VERIFY ?auto_525987 ?auto_525988 ?auto_525989 ?auto_525991 ?auto_525990 ?auto_525992 ?auto_525993 ?auto_525994 ?auto_525995 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526080 - SURFACE
      ?auto_526081 - SURFACE
      ?auto_526082 - SURFACE
      ?auto_526084 - SURFACE
      ?auto_526083 - SURFACE
      ?auto_526085 - SURFACE
      ?auto_526086 - SURFACE
      ?auto_526087 - SURFACE
      ?auto_526088 - SURFACE
    )
    :vars
    (
      ?auto_526093 - HOIST
      ?auto_526092 - PLACE
      ?auto_526091 - PLACE
      ?auto_526090 - HOIST
      ?auto_526089 - SURFACE
      ?auto_526094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526093 ?auto_526092 ) ( IS-CRATE ?auto_526088 ) ( not ( = ?auto_526087 ?auto_526088 ) ) ( not ( = ?auto_526086 ?auto_526087 ) ) ( not ( = ?auto_526086 ?auto_526088 ) ) ( not ( = ?auto_526091 ?auto_526092 ) ) ( HOIST-AT ?auto_526090 ?auto_526091 ) ( not ( = ?auto_526093 ?auto_526090 ) ) ( AVAILABLE ?auto_526090 ) ( SURFACE-AT ?auto_526088 ?auto_526091 ) ( ON ?auto_526088 ?auto_526089 ) ( CLEAR ?auto_526088 ) ( not ( = ?auto_526087 ?auto_526089 ) ) ( not ( = ?auto_526088 ?auto_526089 ) ) ( not ( = ?auto_526086 ?auto_526089 ) ) ( TRUCK-AT ?auto_526094 ?auto_526092 ) ( SURFACE-AT ?auto_526086 ?auto_526092 ) ( CLEAR ?auto_526086 ) ( IS-CRATE ?auto_526087 ) ( AVAILABLE ?auto_526093 ) ( IN ?auto_526087 ?auto_526094 ) ( ON ?auto_526081 ?auto_526080 ) ( ON ?auto_526082 ?auto_526081 ) ( ON ?auto_526084 ?auto_526082 ) ( ON ?auto_526083 ?auto_526084 ) ( ON ?auto_526085 ?auto_526083 ) ( ON ?auto_526086 ?auto_526085 ) ( not ( = ?auto_526080 ?auto_526081 ) ) ( not ( = ?auto_526080 ?auto_526082 ) ) ( not ( = ?auto_526080 ?auto_526084 ) ) ( not ( = ?auto_526080 ?auto_526083 ) ) ( not ( = ?auto_526080 ?auto_526085 ) ) ( not ( = ?auto_526080 ?auto_526086 ) ) ( not ( = ?auto_526080 ?auto_526087 ) ) ( not ( = ?auto_526080 ?auto_526088 ) ) ( not ( = ?auto_526080 ?auto_526089 ) ) ( not ( = ?auto_526081 ?auto_526082 ) ) ( not ( = ?auto_526081 ?auto_526084 ) ) ( not ( = ?auto_526081 ?auto_526083 ) ) ( not ( = ?auto_526081 ?auto_526085 ) ) ( not ( = ?auto_526081 ?auto_526086 ) ) ( not ( = ?auto_526081 ?auto_526087 ) ) ( not ( = ?auto_526081 ?auto_526088 ) ) ( not ( = ?auto_526081 ?auto_526089 ) ) ( not ( = ?auto_526082 ?auto_526084 ) ) ( not ( = ?auto_526082 ?auto_526083 ) ) ( not ( = ?auto_526082 ?auto_526085 ) ) ( not ( = ?auto_526082 ?auto_526086 ) ) ( not ( = ?auto_526082 ?auto_526087 ) ) ( not ( = ?auto_526082 ?auto_526088 ) ) ( not ( = ?auto_526082 ?auto_526089 ) ) ( not ( = ?auto_526084 ?auto_526083 ) ) ( not ( = ?auto_526084 ?auto_526085 ) ) ( not ( = ?auto_526084 ?auto_526086 ) ) ( not ( = ?auto_526084 ?auto_526087 ) ) ( not ( = ?auto_526084 ?auto_526088 ) ) ( not ( = ?auto_526084 ?auto_526089 ) ) ( not ( = ?auto_526083 ?auto_526085 ) ) ( not ( = ?auto_526083 ?auto_526086 ) ) ( not ( = ?auto_526083 ?auto_526087 ) ) ( not ( = ?auto_526083 ?auto_526088 ) ) ( not ( = ?auto_526083 ?auto_526089 ) ) ( not ( = ?auto_526085 ?auto_526086 ) ) ( not ( = ?auto_526085 ?auto_526087 ) ) ( not ( = ?auto_526085 ?auto_526088 ) ) ( not ( = ?auto_526085 ?auto_526089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526086 ?auto_526087 ?auto_526088 )
      ( MAKE-8CRATE-VERIFY ?auto_526080 ?auto_526081 ?auto_526082 ?auto_526084 ?auto_526083 ?auto_526085 ?auto_526086 ?auto_526087 ?auto_526088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_526775 - SURFACE
      ?auto_526776 - SURFACE
    )
    :vars
    (
      ?auto_526780 - HOIST
      ?auto_526778 - PLACE
      ?auto_526777 - SURFACE
      ?auto_526782 - TRUCK
      ?auto_526783 - PLACE
      ?auto_526779 - HOIST
      ?auto_526781 - SURFACE
      ?auto_526784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526780 ?auto_526778 ) ( SURFACE-AT ?auto_526775 ?auto_526778 ) ( CLEAR ?auto_526775 ) ( IS-CRATE ?auto_526776 ) ( not ( = ?auto_526775 ?auto_526776 ) ) ( AVAILABLE ?auto_526780 ) ( ON ?auto_526775 ?auto_526777 ) ( not ( = ?auto_526777 ?auto_526775 ) ) ( not ( = ?auto_526777 ?auto_526776 ) ) ( TRUCK-AT ?auto_526782 ?auto_526783 ) ( not ( = ?auto_526783 ?auto_526778 ) ) ( HOIST-AT ?auto_526779 ?auto_526783 ) ( not ( = ?auto_526780 ?auto_526779 ) ) ( SURFACE-AT ?auto_526776 ?auto_526783 ) ( ON ?auto_526776 ?auto_526781 ) ( CLEAR ?auto_526776 ) ( not ( = ?auto_526775 ?auto_526781 ) ) ( not ( = ?auto_526776 ?auto_526781 ) ) ( not ( = ?auto_526777 ?auto_526781 ) ) ( LIFTING ?auto_526779 ?auto_526784 ) ( IS-CRATE ?auto_526784 ) ( not ( = ?auto_526775 ?auto_526784 ) ) ( not ( = ?auto_526776 ?auto_526784 ) ) ( not ( = ?auto_526777 ?auto_526784 ) ) ( not ( = ?auto_526781 ?auto_526784 ) ) )
    :subtasks
    ( ( !LOAD ?auto_526779 ?auto_526784 ?auto_526782 ?auto_526783 )
      ( MAKE-1CRATE ?auto_526775 ?auto_526776 )
      ( MAKE-1CRATE-VERIFY ?auto_526775 ?auto_526776 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530183 - SURFACE
      ?auto_530184 - SURFACE
      ?auto_530185 - SURFACE
      ?auto_530187 - SURFACE
      ?auto_530186 - SURFACE
      ?auto_530188 - SURFACE
      ?auto_530189 - SURFACE
      ?auto_530190 - SURFACE
      ?auto_530191 - SURFACE
      ?auto_530192 - SURFACE
    )
    :vars
    (
      ?auto_530193 - HOIST
      ?auto_530194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530193 ?auto_530194 ) ( SURFACE-AT ?auto_530191 ?auto_530194 ) ( CLEAR ?auto_530191 ) ( LIFTING ?auto_530193 ?auto_530192 ) ( IS-CRATE ?auto_530192 ) ( not ( = ?auto_530191 ?auto_530192 ) ) ( ON ?auto_530184 ?auto_530183 ) ( ON ?auto_530185 ?auto_530184 ) ( ON ?auto_530187 ?auto_530185 ) ( ON ?auto_530186 ?auto_530187 ) ( ON ?auto_530188 ?auto_530186 ) ( ON ?auto_530189 ?auto_530188 ) ( ON ?auto_530190 ?auto_530189 ) ( ON ?auto_530191 ?auto_530190 ) ( not ( = ?auto_530183 ?auto_530184 ) ) ( not ( = ?auto_530183 ?auto_530185 ) ) ( not ( = ?auto_530183 ?auto_530187 ) ) ( not ( = ?auto_530183 ?auto_530186 ) ) ( not ( = ?auto_530183 ?auto_530188 ) ) ( not ( = ?auto_530183 ?auto_530189 ) ) ( not ( = ?auto_530183 ?auto_530190 ) ) ( not ( = ?auto_530183 ?auto_530191 ) ) ( not ( = ?auto_530183 ?auto_530192 ) ) ( not ( = ?auto_530184 ?auto_530185 ) ) ( not ( = ?auto_530184 ?auto_530187 ) ) ( not ( = ?auto_530184 ?auto_530186 ) ) ( not ( = ?auto_530184 ?auto_530188 ) ) ( not ( = ?auto_530184 ?auto_530189 ) ) ( not ( = ?auto_530184 ?auto_530190 ) ) ( not ( = ?auto_530184 ?auto_530191 ) ) ( not ( = ?auto_530184 ?auto_530192 ) ) ( not ( = ?auto_530185 ?auto_530187 ) ) ( not ( = ?auto_530185 ?auto_530186 ) ) ( not ( = ?auto_530185 ?auto_530188 ) ) ( not ( = ?auto_530185 ?auto_530189 ) ) ( not ( = ?auto_530185 ?auto_530190 ) ) ( not ( = ?auto_530185 ?auto_530191 ) ) ( not ( = ?auto_530185 ?auto_530192 ) ) ( not ( = ?auto_530187 ?auto_530186 ) ) ( not ( = ?auto_530187 ?auto_530188 ) ) ( not ( = ?auto_530187 ?auto_530189 ) ) ( not ( = ?auto_530187 ?auto_530190 ) ) ( not ( = ?auto_530187 ?auto_530191 ) ) ( not ( = ?auto_530187 ?auto_530192 ) ) ( not ( = ?auto_530186 ?auto_530188 ) ) ( not ( = ?auto_530186 ?auto_530189 ) ) ( not ( = ?auto_530186 ?auto_530190 ) ) ( not ( = ?auto_530186 ?auto_530191 ) ) ( not ( = ?auto_530186 ?auto_530192 ) ) ( not ( = ?auto_530188 ?auto_530189 ) ) ( not ( = ?auto_530188 ?auto_530190 ) ) ( not ( = ?auto_530188 ?auto_530191 ) ) ( not ( = ?auto_530188 ?auto_530192 ) ) ( not ( = ?auto_530189 ?auto_530190 ) ) ( not ( = ?auto_530189 ?auto_530191 ) ) ( not ( = ?auto_530189 ?auto_530192 ) ) ( not ( = ?auto_530190 ?auto_530191 ) ) ( not ( = ?auto_530190 ?auto_530192 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_530191 ?auto_530192 )
      ( MAKE-9CRATE-VERIFY ?auto_530183 ?auto_530184 ?auto_530185 ?auto_530187 ?auto_530186 ?auto_530188 ?auto_530189 ?auto_530190 ?auto_530191 ?auto_530192 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530263 - SURFACE
      ?auto_530264 - SURFACE
      ?auto_530265 - SURFACE
      ?auto_530267 - SURFACE
      ?auto_530266 - SURFACE
      ?auto_530268 - SURFACE
      ?auto_530269 - SURFACE
      ?auto_530270 - SURFACE
      ?auto_530271 - SURFACE
      ?auto_530272 - SURFACE
    )
    :vars
    (
      ?auto_530274 - HOIST
      ?auto_530275 - PLACE
      ?auto_530273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530274 ?auto_530275 ) ( SURFACE-AT ?auto_530271 ?auto_530275 ) ( CLEAR ?auto_530271 ) ( IS-CRATE ?auto_530272 ) ( not ( = ?auto_530271 ?auto_530272 ) ) ( TRUCK-AT ?auto_530273 ?auto_530275 ) ( AVAILABLE ?auto_530274 ) ( IN ?auto_530272 ?auto_530273 ) ( ON ?auto_530271 ?auto_530270 ) ( not ( = ?auto_530270 ?auto_530271 ) ) ( not ( = ?auto_530270 ?auto_530272 ) ) ( ON ?auto_530264 ?auto_530263 ) ( ON ?auto_530265 ?auto_530264 ) ( ON ?auto_530267 ?auto_530265 ) ( ON ?auto_530266 ?auto_530267 ) ( ON ?auto_530268 ?auto_530266 ) ( ON ?auto_530269 ?auto_530268 ) ( ON ?auto_530270 ?auto_530269 ) ( not ( = ?auto_530263 ?auto_530264 ) ) ( not ( = ?auto_530263 ?auto_530265 ) ) ( not ( = ?auto_530263 ?auto_530267 ) ) ( not ( = ?auto_530263 ?auto_530266 ) ) ( not ( = ?auto_530263 ?auto_530268 ) ) ( not ( = ?auto_530263 ?auto_530269 ) ) ( not ( = ?auto_530263 ?auto_530270 ) ) ( not ( = ?auto_530263 ?auto_530271 ) ) ( not ( = ?auto_530263 ?auto_530272 ) ) ( not ( = ?auto_530264 ?auto_530265 ) ) ( not ( = ?auto_530264 ?auto_530267 ) ) ( not ( = ?auto_530264 ?auto_530266 ) ) ( not ( = ?auto_530264 ?auto_530268 ) ) ( not ( = ?auto_530264 ?auto_530269 ) ) ( not ( = ?auto_530264 ?auto_530270 ) ) ( not ( = ?auto_530264 ?auto_530271 ) ) ( not ( = ?auto_530264 ?auto_530272 ) ) ( not ( = ?auto_530265 ?auto_530267 ) ) ( not ( = ?auto_530265 ?auto_530266 ) ) ( not ( = ?auto_530265 ?auto_530268 ) ) ( not ( = ?auto_530265 ?auto_530269 ) ) ( not ( = ?auto_530265 ?auto_530270 ) ) ( not ( = ?auto_530265 ?auto_530271 ) ) ( not ( = ?auto_530265 ?auto_530272 ) ) ( not ( = ?auto_530267 ?auto_530266 ) ) ( not ( = ?auto_530267 ?auto_530268 ) ) ( not ( = ?auto_530267 ?auto_530269 ) ) ( not ( = ?auto_530267 ?auto_530270 ) ) ( not ( = ?auto_530267 ?auto_530271 ) ) ( not ( = ?auto_530267 ?auto_530272 ) ) ( not ( = ?auto_530266 ?auto_530268 ) ) ( not ( = ?auto_530266 ?auto_530269 ) ) ( not ( = ?auto_530266 ?auto_530270 ) ) ( not ( = ?auto_530266 ?auto_530271 ) ) ( not ( = ?auto_530266 ?auto_530272 ) ) ( not ( = ?auto_530268 ?auto_530269 ) ) ( not ( = ?auto_530268 ?auto_530270 ) ) ( not ( = ?auto_530268 ?auto_530271 ) ) ( not ( = ?auto_530268 ?auto_530272 ) ) ( not ( = ?auto_530269 ?auto_530270 ) ) ( not ( = ?auto_530269 ?auto_530271 ) ) ( not ( = ?auto_530269 ?auto_530272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530270 ?auto_530271 ?auto_530272 )
      ( MAKE-9CRATE-VERIFY ?auto_530263 ?auto_530264 ?auto_530265 ?auto_530267 ?auto_530266 ?auto_530268 ?auto_530269 ?auto_530270 ?auto_530271 ?auto_530272 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530353 - SURFACE
      ?auto_530354 - SURFACE
      ?auto_530355 - SURFACE
      ?auto_530357 - SURFACE
      ?auto_530356 - SURFACE
      ?auto_530358 - SURFACE
      ?auto_530359 - SURFACE
      ?auto_530360 - SURFACE
      ?auto_530361 - SURFACE
      ?auto_530362 - SURFACE
    )
    :vars
    (
      ?auto_530366 - HOIST
      ?auto_530363 - PLACE
      ?auto_530365 - TRUCK
      ?auto_530364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530366 ?auto_530363 ) ( SURFACE-AT ?auto_530361 ?auto_530363 ) ( CLEAR ?auto_530361 ) ( IS-CRATE ?auto_530362 ) ( not ( = ?auto_530361 ?auto_530362 ) ) ( AVAILABLE ?auto_530366 ) ( IN ?auto_530362 ?auto_530365 ) ( ON ?auto_530361 ?auto_530360 ) ( not ( = ?auto_530360 ?auto_530361 ) ) ( not ( = ?auto_530360 ?auto_530362 ) ) ( TRUCK-AT ?auto_530365 ?auto_530364 ) ( not ( = ?auto_530364 ?auto_530363 ) ) ( ON ?auto_530354 ?auto_530353 ) ( ON ?auto_530355 ?auto_530354 ) ( ON ?auto_530357 ?auto_530355 ) ( ON ?auto_530356 ?auto_530357 ) ( ON ?auto_530358 ?auto_530356 ) ( ON ?auto_530359 ?auto_530358 ) ( ON ?auto_530360 ?auto_530359 ) ( not ( = ?auto_530353 ?auto_530354 ) ) ( not ( = ?auto_530353 ?auto_530355 ) ) ( not ( = ?auto_530353 ?auto_530357 ) ) ( not ( = ?auto_530353 ?auto_530356 ) ) ( not ( = ?auto_530353 ?auto_530358 ) ) ( not ( = ?auto_530353 ?auto_530359 ) ) ( not ( = ?auto_530353 ?auto_530360 ) ) ( not ( = ?auto_530353 ?auto_530361 ) ) ( not ( = ?auto_530353 ?auto_530362 ) ) ( not ( = ?auto_530354 ?auto_530355 ) ) ( not ( = ?auto_530354 ?auto_530357 ) ) ( not ( = ?auto_530354 ?auto_530356 ) ) ( not ( = ?auto_530354 ?auto_530358 ) ) ( not ( = ?auto_530354 ?auto_530359 ) ) ( not ( = ?auto_530354 ?auto_530360 ) ) ( not ( = ?auto_530354 ?auto_530361 ) ) ( not ( = ?auto_530354 ?auto_530362 ) ) ( not ( = ?auto_530355 ?auto_530357 ) ) ( not ( = ?auto_530355 ?auto_530356 ) ) ( not ( = ?auto_530355 ?auto_530358 ) ) ( not ( = ?auto_530355 ?auto_530359 ) ) ( not ( = ?auto_530355 ?auto_530360 ) ) ( not ( = ?auto_530355 ?auto_530361 ) ) ( not ( = ?auto_530355 ?auto_530362 ) ) ( not ( = ?auto_530357 ?auto_530356 ) ) ( not ( = ?auto_530357 ?auto_530358 ) ) ( not ( = ?auto_530357 ?auto_530359 ) ) ( not ( = ?auto_530357 ?auto_530360 ) ) ( not ( = ?auto_530357 ?auto_530361 ) ) ( not ( = ?auto_530357 ?auto_530362 ) ) ( not ( = ?auto_530356 ?auto_530358 ) ) ( not ( = ?auto_530356 ?auto_530359 ) ) ( not ( = ?auto_530356 ?auto_530360 ) ) ( not ( = ?auto_530356 ?auto_530361 ) ) ( not ( = ?auto_530356 ?auto_530362 ) ) ( not ( = ?auto_530358 ?auto_530359 ) ) ( not ( = ?auto_530358 ?auto_530360 ) ) ( not ( = ?auto_530358 ?auto_530361 ) ) ( not ( = ?auto_530358 ?auto_530362 ) ) ( not ( = ?auto_530359 ?auto_530360 ) ) ( not ( = ?auto_530359 ?auto_530361 ) ) ( not ( = ?auto_530359 ?auto_530362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530360 ?auto_530361 ?auto_530362 )
      ( MAKE-9CRATE-VERIFY ?auto_530353 ?auto_530354 ?auto_530355 ?auto_530357 ?auto_530356 ?auto_530358 ?auto_530359 ?auto_530360 ?auto_530361 ?auto_530362 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530452 - SURFACE
      ?auto_530453 - SURFACE
      ?auto_530454 - SURFACE
      ?auto_530456 - SURFACE
      ?auto_530455 - SURFACE
      ?auto_530457 - SURFACE
      ?auto_530458 - SURFACE
      ?auto_530459 - SURFACE
      ?auto_530460 - SURFACE
      ?auto_530461 - SURFACE
    )
    :vars
    (
      ?auto_530466 - HOIST
      ?auto_530463 - PLACE
      ?auto_530462 - TRUCK
      ?auto_530465 - PLACE
      ?auto_530464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_530466 ?auto_530463 ) ( SURFACE-AT ?auto_530460 ?auto_530463 ) ( CLEAR ?auto_530460 ) ( IS-CRATE ?auto_530461 ) ( not ( = ?auto_530460 ?auto_530461 ) ) ( AVAILABLE ?auto_530466 ) ( ON ?auto_530460 ?auto_530459 ) ( not ( = ?auto_530459 ?auto_530460 ) ) ( not ( = ?auto_530459 ?auto_530461 ) ) ( TRUCK-AT ?auto_530462 ?auto_530465 ) ( not ( = ?auto_530465 ?auto_530463 ) ) ( HOIST-AT ?auto_530464 ?auto_530465 ) ( LIFTING ?auto_530464 ?auto_530461 ) ( not ( = ?auto_530466 ?auto_530464 ) ) ( ON ?auto_530453 ?auto_530452 ) ( ON ?auto_530454 ?auto_530453 ) ( ON ?auto_530456 ?auto_530454 ) ( ON ?auto_530455 ?auto_530456 ) ( ON ?auto_530457 ?auto_530455 ) ( ON ?auto_530458 ?auto_530457 ) ( ON ?auto_530459 ?auto_530458 ) ( not ( = ?auto_530452 ?auto_530453 ) ) ( not ( = ?auto_530452 ?auto_530454 ) ) ( not ( = ?auto_530452 ?auto_530456 ) ) ( not ( = ?auto_530452 ?auto_530455 ) ) ( not ( = ?auto_530452 ?auto_530457 ) ) ( not ( = ?auto_530452 ?auto_530458 ) ) ( not ( = ?auto_530452 ?auto_530459 ) ) ( not ( = ?auto_530452 ?auto_530460 ) ) ( not ( = ?auto_530452 ?auto_530461 ) ) ( not ( = ?auto_530453 ?auto_530454 ) ) ( not ( = ?auto_530453 ?auto_530456 ) ) ( not ( = ?auto_530453 ?auto_530455 ) ) ( not ( = ?auto_530453 ?auto_530457 ) ) ( not ( = ?auto_530453 ?auto_530458 ) ) ( not ( = ?auto_530453 ?auto_530459 ) ) ( not ( = ?auto_530453 ?auto_530460 ) ) ( not ( = ?auto_530453 ?auto_530461 ) ) ( not ( = ?auto_530454 ?auto_530456 ) ) ( not ( = ?auto_530454 ?auto_530455 ) ) ( not ( = ?auto_530454 ?auto_530457 ) ) ( not ( = ?auto_530454 ?auto_530458 ) ) ( not ( = ?auto_530454 ?auto_530459 ) ) ( not ( = ?auto_530454 ?auto_530460 ) ) ( not ( = ?auto_530454 ?auto_530461 ) ) ( not ( = ?auto_530456 ?auto_530455 ) ) ( not ( = ?auto_530456 ?auto_530457 ) ) ( not ( = ?auto_530456 ?auto_530458 ) ) ( not ( = ?auto_530456 ?auto_530459 ) ) ( not ( = ?auto_530456 ?auto_530460 ) ) ( not ( = ?auto_530456 ?auto_530461 ) ) ( not ( = ?auto_530455 ?auto_530457 ) ) ( not ( = ?auto_530455 ?auto_530458 ) ) ( not ( = ?auto_530455 ?auto_530459 ) ) ( not ( = ?auto_530455 ?auto_530460 ) ) ( not ( = ?auto_530455 ?auto_530461 ) ) ( not ( = ?auto_530457 ?auto_530458 ) ) ( not ( = ?auto_530457 ?auto_530459 ) ) ( not ( = ?auto_530457 ?auto_530460 ) ) ( not ( = ?auto_530457 ?auto_530461 ) ) ( not ( = ?auto_530458 ?auto_530459 ) ) ( not ( = ?auto_530458 ?auto_530460 ) ) ( not ( = ?auto_530458 ?auto_530461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530459 ?auto_530460 ?auto_530461 )
      ( MAKE-9CRATE-VERIFY ?auto_530452 ?auto_530453 ?auto_530454 ?auto_530456 ?auto_530455 ?auto_530457 ?auto_530458 ?auto_530459 ?auto_530460 ?auto_530461 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530560 - SURFACE
      ?auto_530561 - SURFACE
      ?auto_530562 - SURFACE
      ?auto_530564 - SURFACE
      ?auto_530563 - SURFACE
      ?auto_530565 - SURFACE
      ?auto_530566 - SURFACE
      ?auto_530567 - SURFACE
      ?auto_530568 - SURFACE
      ?auto_530569 - SURFACE
    )
    :vars
    (
      ?auto_530575 - HOIST
      ?auto_530573 - PLACE
      ?auto_530574 - TRUCK
      ?auto_530572 - PLACE
      ?auto_530571 - HOIST
      ?auto_530570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530575 ?auto_530573 ) ( SURFACE-AT ?auto_530568 ?auto_530573 ) ( CLEAR ?auto_530568 ) ( IS-CRATE ?auto_530569 ) ( not ( = ?auto_530568 ?auto_530569 ) ) ( AVAILABLE ?auto_530575 ) ( ON ?auto_530568 ?auto_530567 ) ( not ( = ?auto_530567 ?auto_530568 ) ) ( not ( = ?auto_530567 ?auto_530569 ) ) ( TRUCK-AT ?auto_530574 ?auto_530572 ) ( not ( = ?auto_530572 ?auto_530573 ) ) ( HOIST-AT ?auto_530571 ?auto_530572 ) ( not ( = ?auto_530575 ?auto_530571 ) ) ( AVAILABLE ?auto_530571 ) ( SURFACE-AT ?auto_530569 ?auto_530572 ) ( ON ?auto_530569 ?auto_530570 ) ( CLEAR ?auto_530569 ) ( not ( = ?auto_530568 ?auto_530570 ) ) ( not ( = ?auto_530569 ?auto_530570 ) ) ( not ( = ?auto_530567 ?auto_530570 ) ) ( ON ?auto_530561 ?auto_530560 ) ( ON ?auto_530562 ?auto_530561 ) ( ON ?auto_530564 ?auto_530562 ) ( ON ?auto_530563 ?auto_530564 ) ( ON ?auto_530565 ?auto_530563 ) ( ON ?auto_530566 ?auto_530565 ) ( ON ?auto_530567 ?auto_530566 ) ( not ( = ?auto_530560 ?auto_530561 ) ) ( not ( = ?auto_530560 ?auto_530562 ) ) ( not ( = ?auto_530560 ?auto_530564 ) ) ( not ( = ?auto_530560 ?auto_530563 ) ) ( not ( = ?auto_530560 ?auto_530565 ) ) ( not ( = ?auto_530560 ?auto_530566 ) ) ( not ( = ?auto_530560 ?auto_530567 ) ) ( not ( = ?auto_530560 ?auto_530568 ) ) ( not ( = ?auto_530560 ?auto_530569 ) ) ( not ( = ?auto_530560 ?auto_530570 ) ) ( not ( = ?auto_530561 ?auto_530562 ) ) ( not ( = ?auto_530561 ?auto_530564 ) ) ( not ( = ?auto_530561 ?auto_530563 ) ) ( not ( = ?auto_530561 ?auto_530565 ) ) ( not ( = ?auto_530561 ?auto_530566 ) ) ( not ( = ?auto_530561 ?auto_530567 ) ) ( not ( = ?auto_530561 ?auto_530568 ) ) ( not ( = ?auto_530561 ?auto_530569 ) ) ( not ( = ?auto_530561 ?auto_530570 ) ) ( not ( = ?auto_530562 ?auto_530564 ) ) ( not ( = ?auto_530562 ?auto_530563 ) ) ( not ( = ?auto_530562 ?auto_530565 ) ) ( not ( = ?auto_530562 ?auto_530566 ) ) ( not ( = ?auto_530562 ?auto_530567 ) ) ( not ( = ?auto_530562 ?auto_530568 ) ) ( not ( = ?auto_530562 ?auto_530569 ) ) ( not ( = ?auto_530562 ?auto_530570 ) ) ( not ( = ?auto_530564 ?auto_530563 ) ) ( not ( = ?auto_530564 ?auto_530565 ) ) ( not ( = ?auto_530564 ?auto_530566 ) ) ( not ( = ?auto_530564 ?auto_530567 ) ) ( not ( = ?auto_530564 ?auto_530568 ) ) ( not ( = ?auto_530564 ?auto_530569 ) ) ( not ( = ?auto_530564 ?auto_530570 ) ) ( not ( = ?auto_530563 ?auto_530565 ) ) ( not ( = ?auto_530563 ?auto_530566 ) ) ( not ( = ?auto_530563 ?auto_530567 ) ) ( not ( = ?auto_530563 ?auto_530568 ) ) ( not ( = ?auto_530563 ?auto_530569 ) ) ( not ( = ?auto_530563 ?auto_530570 ) ) ( not ( = ?auto_530565 ?auto_530566 ) ) ( not ( = ?auto_530565 ?auto_530567 ) ) ( not ( = ?auto_530565 ?auto_530568 ) ) ( not ( = ?auto_530565 ?auto_530569 ) ) ( not ( = ?auto_530565 ?auto_530570 ) ) ( not ( = ?auto_530566 ?auto_530567 ) ) ( not ( = ?auto_530566 ?auto_530568 ) ) ( not ( = ?auto_530566 ?auto_530569 ) ) ( not ( = ?auto_530566 ?auto_530570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530567 ?auto_530568 ?auto_530569 )
      ( MAKE-9CRATE-VERIFY ?auto_530560 ?auto_530561 ?auto_530562 ?auto_530564 ?auto_530563 ?auto_530565 ?auto_530566 ?auto_530567 ?auto_530568 ?auto_530569 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530669 - SURFACE
      ?auto_530670 - SURFACE
      ?auto_530671 - SURFACE
      ?auto_530673 - SURFACE
      ?auto_530672 - SURFACE
      ?auto_530674 - SURFACE
      ?auto_530675 - SURFACE
      ?auto_530676 - SURFACE
      ?auto_530677 - SURFACE
      ?auto_530678 - SURFACE
    )
    :vars
    (
      ?auto_530682 - HOIST
      ?auto_530680 - PLACE
      ?auto_530683 - PLACE
      ?auto_530684 - HOIST
      ?auto_530679 - SURFACE
      ?auto_530681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530682 ?auto_530680 ) ( SURFACE-AT ?auto_530677 ?auto_530680 ) ( CLEAR ?auto_530677 ) ( IS-CRATE ?auto_530678 ) ( not ( = ?auto_530677 ?auto_530678 ) ) ( AVAILABLE ?auto_530682 ) ( ON ?auto_530677 ?auto_530676 ) ( not ( = ?auto_530676 ?auto_530677 ) ) ( not ( = ?auto_530676 ?auto_530678 ) ) ( not ( = ?auto_530683 ?auto_530680 ) ) ( HOIST-AT ?auto_530684 ?auto_530683 ) ( not ( = ?auto_530682 ?auto_530684 ) ) ( AVAILABLE ?auto_530684 ) ( SURFACE-AT ?auto_530678 ?auto_530683 ) ( ON ?auto_530678 ?auto_530679 ) ( CLEAR ?auto_530678 ) ( not ( = ?auto_530677 ?auto_530679 ) ) ( not ( = ?auto_530678 ?auto_530679 ) ) ( not ( = ?auto_530676 ?auto_530679 ) ) ( TRUCK-AT ?auto_530681 ?auto_530680 ) ( ON ?auto_530670 ?auto_530669 ) ( ON ?auto_530671 ?auto_530670 ) ( ON ?auto_530673 ?auto_530671 ) ( ON ?auto_530672 ?auto_530673 ) ( ON ?auto_530674 ?auto_530672 ) ( ON ?auto_530675 ?auto_530674 ) ( ON ?auto_530676 ?auto_530675 ) ( not ( = ?auto_530669 ?auto_530670 ) ) ( not ( = ?auto_530669 ?auto_530671 ) ) ( not ( = ?auto_530669 ?auto_530673 ) ) ( not ( = ?auto_530669 ?auto_530672 ) ) ( not ( = ?auto_530669 ?auto_530674 ) ) ( not ( = ?auto_530669 ?auto_530675 ) ) ( not ( = ?auto_530669 ?auto_530676 ) ) ( not ( = ?auto_530669 ?auto_530677 ) ) ( not ( = ?auto_530669 ?auto_530678 ) ) ( not ( = ?auto_530669 ?auto_530679 ) ) ( not ( = ?auto_530670 ?auto_530671 ) ) ( not ( = ?auto_530670 ?auto_530673 ) ) ( not ( = ?auto_530670 ?auto_530672 ) ) ( not ( = ?auto_530670 ?auto_530674 ) ) ( not ( = ?auto_530670 ?auto_530675 ) ) ( not ( = ?auto_530670 ?auto_530676 ) ) ( not ( = ?auto_530670 ?auto_530677 ) ) ( not ( = ?auto_530670 ?auto_530678 ) ) ( not ( = ?auto_530670 ?auto_530679 ) ) ( not ( = ?auto_530671 ?auto_530673 ) ) ( not ( = ?auto_530671 ?auto_530672 ) ) ( not ( = ?auto_530671 ?auto_530674 ) ) ( not ( = ?auto_530671 ?auto_530675 ) ) ( not ( = ?auto_530671 ?auto_530676 ) ) ( not ( = ?auto_530671 ?auto_530677 ) ) ( not ( = ?auto_530671 ?auto_530678 ) ) ( not ( = ?auto_530671 ?auto_530679 ) ) ( not ( = ?auto_530673 ?auto_530672 ) ) ( not ( = ?auto_530673 ?auto_530674 ) ) ( not ( = ?auto_530673 ?auto_530675 ) ) ( not ( = ?auto_530673 ?auto_530676 ) ) ( not ( = ?auto_530673 ?auto_530677 ) ) ( not ( = ?auto_530673 ?auto_530678 ) ) ( not ( = ?auto_530673 ?auto_530679 ) ) ( not ( = ?auto_530672 ?auto_530674 ) ) ( not ( = ?auto_530672 ?auto_530675 ) ) ( not ( = ?auto_530672 ?auto_530676 ) ) ( not ( = ?auto_530672 ?auto_530677 ) ) ( not ( = ?auto_530672 ?auto_530678 ) ) ( not ( = ?auto_530672 ?auto_530679 ) ) ( not ( = ?auto_530674 ?auto_530675 ) ) ( not ( = ?auto_530674 ?auto_530676 ) ) ( not ( = ?auto_530674 ?auto_530677 ) ) ( not ( = ?auto_530674 ?auto_530678 ) ) ( not ( = ?auto_530674 ?auto_530679 ) ) ( not ( = ?auto_530675 ?auto_530676 ) ) ( not ( = ?auto_530675 ?auto_530677 ) ) ( not ( = ?auto_530675 ?auto_530678 ) ) ( not ( = ?auto_530675 ?auto_530679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530676 ?auto_530677 ?auto_530678 )
      ( MAKE-9CRATE-VERIFY ?auto_530669 ?auto_530670 ?auto_530671 ?auto_530673 ?auto_530672 ?auto_530674 ?auto_530675 ?auto_530676 ?auto_530677 ?auto_530678 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530778 - SURFACE
      ?auto_530779 - SURFACE
      ?auto_530780 - SURFACE
      ?auto_530782 - SURFACE
      ?auto_530781 - SURFACE
      ?auto_530783 - SURFACE
      ?auto_530784 - SURFACE
      ?auto_530785 - SURFACE
      ?auto_530786 - SURFACE
      ?auto_530787 - SURFACE
    )
    :vars
    (
      ?auto_530789 - HOIST
      ?auto_530791 - PLACE
      ?auto_530793 - PLACE
      ?auto_530792 - HOIST
      ?auto_530788 - SURFACE
      ?auto_530790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530789 ?auto_530791 ) ( IS-CRATE ?auto_530787 ) ( not ( = ?auto_530786 ?auto_530787 ) ) ( not ( = ?auto_530785 ?auto_530786 ) ) ( not ( = ?auto_530785 ?auto_530787 ) ) ( not ( = ?auto_530793 ?auto_530791 ) ) ( HOIST-AT ?auto_530792 ?auto_530793 ) ( not ( = ?auto_530789 ?auto_530792 ) ) ( AVAILABLE ?auto_530792 ) ( SURFACE-AT ?auto_530787 ?auto_530793 ) ( ON ?auto_530787 ?auto_530788 ) ( CLEAR ?auto_530787 ) ( not ( = ?auto_530786 ?auto_530788 ) ) ( not ( = ?auto_530787 ?auto_530788 ) ) ( not ( = ?auto_530785 ?auto_530788 ) ) ( TRUCK-AT ?auto_530790 ?auto_530791 ) ( SURFACE-AT ?auto_530785 ?auto_530791 ) ( CLEAR ?auto_530785 ) ( LIFTING ?auto_530789 ?auto_530786 ) ( IS-CRATE ?auto_530786 ) ( ON ?auto_530779 ?auto_530778 ) ( ON ?auto_530780 ?auto_530779 ) ( ON ?auto_530782 ?auto_530780 ) ( ON ?auto_530781 ?auto_530782 ) ( ON ?auto_530783 ?auto_530781 ) ( ON ?auto_530784 ?auto_530783 ) ( ON ?auto_530785 ?auto_530784 ) ( not ( = ?auto_530778 ?auto_530779 ) ) ( not ( = ?auto_530778 ?auto_530780 ) ) ( not ( = ?auto_530778 ?auto_530782 ) ) ( not ( = ?auto_530778 ?auto_530781 ) ) ( not ( = ?auto_530778 ?auto_530783 ) ) ( not ( = ?auto_530778 ?auto_530784 ) ) ( not ( = ?auto_530778 ?auto_530785 ) ) ( not ( = ?auto_530778 ?auto_530786 ) ) ( not ( = ?auto_530778 ?auto_530787 ) ) ( not ( = ?auto_530778 ?auto_530788 ) ) ( not ( = ?auto_530779 ?auto_530780 ) ) ( not ( = ?auto_530779 ?auto_530782 ) ) ( not ( = ?auto_530779 ?auto_530781 ) ) ( not ( = ?auto_530779 ?auto_530783 ) ) ( not ( = ?auto_530779 ?auto_530784 ) ) ( not ( = ?auto_530779 ?auto_530785 ) ) ( not ( = ?auto_530779 ?auto_530786 ) ) ( not ( = ?auto_530779 ?auto_530787 ) ) ( not ( = ?auto_530779 ?auto_530788 ) ) ( not ( = ?auto_530780 ?auto_530782 ) ) ( not ( = ?auto_530780 ?auto_530781 ) ) ( not ( = ?auto_530780 ?auto_530783 ) ) ( not ( = ?auto_530780 ?auto_530784 ) ) ( not ( = ?auto_530780 ?auto_530785 ) ) ( not ( = ?auto_530780 ?auto_530786 ) ) ( not ( = ?auto_530780 ?auto_530787 ) ) ( not ( = ?auto_530780 ?auto_530788 ) ) ( not ( = ?auto_530782 ?auto_530781 ) ) ( not ( = ?auto_530782 ?auto_530783 ) ) ( not ( = ?auto_530782 ?auto_530784 ) ) ( not ( = ?auto_530782 ?auto_530785 ) ) ( not ( = ?auto_530782 ?auto_530786 ) ) ( not ( = ?auto_530782 ?auto_530787 ) ) ( not ( = ?auto_530782 ?auto_530788 ) ) ( not ( = ?auto_530781 ?auto_530783 ) ) ( not ( = ?auto_530781 ?auto_530784 ) ) ( not ( = ?auto_530781 ?auto_530785 ) ) ( not ( = ?auto_530781 ?auto_530786 ) ) ( not ( = ?auto_530781 ?auto_530787 ) ) ( not ( = ?auto_530781 ?auto_530788 ) ) ( not ( = ?auto_530783 ?auto_530784 ) ) ( not ( = ?auto_530783 ?auto_530785 ) ) ( not ( = ?auto_530783 ?auto_530786 ) ) ( not ( = ?auto_530783 ?auto_530787 ) ) ( not ( = ?auto_530783 ?auto_530788 ) ) ( not ( = ?auto_530784 ?auto_530785 ) ) ( not ( = ?auto_530784 ?auto_530786 ) ) ( not ( = ?auto_530784 ?auto_530787 ) ) ( not ( = ?auto_530784 ?auto_530788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530785 ?auto_530786 ?auto_530787 )
      ( MAKE-9CRATE-VERIFY ?auto_530778 ?auto_530779 ?auto_530780 ?auto_530782 ?auto_530781 ?auto_530783 ?auto_530784 ?auto_530785 ?auto_530786 ?auto_530787 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530887 - SURFACE
      ?auto_530888 - SURFACE
      ?auto_530889 - SURFACE
      ?auto_530891 - SURFACE
      ?auto_530890 - SURFACE
      ?auto_530892 - SURFACE
      ?auto_530893 - SURFACE
      ?auto_530894 - SURFACE
      ?auto_530895 - SURFACE
      ?auto_530896 - SURFACE
    )
    :vars
    (
      ?auto_530899 - HOIST
      ?auto_530898 - PLACE
      ?auto_530900 - PLACE
      ?auto_530901 - HOIST
      ?auto_530902 - SURFACE
      ?auto_530897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530899 ?auto_530898 ) ( IS-CRATE ?auto_530896 ) ( not ( = ?auto_530895 ?auto_530896 ) ) ( not ( = ?auto_530894 ?auto_530895 ) ) ( not ( = ?auto_530894 ?auto_530896 ) ) ( not ( = ?auto_530900 ?auto_530898 ) ) ( HOIST-AT ?auto_530901 ?auto_530900 ) ( not ( = ?auto_530899 ?auto_530901 ) ) ( AVAILABLE ?auto_530901 ) ( SURFACE-AT ?auto_530896 ?auto_530900 ) ( ON ?auto_530896 ?auto_530902 ) ( CLEAR ?auto_530896 ) ( not ( = ?auto_530895 ?auto_530902 ) ) ( not ( = ?auto_530896 ?auto_530902 ) ) ( not ( = ?auto_530894 ?auto_530902 ) ) ( TRUCK-AT ?auto_530897 ?auto_530898 ) ( SURFACE-AT ?auto_530894 ?auto_530898 ) ( CLEAR ?auto_530894 ) ( IS-CRATE ?auto_530895 ) ( AVAILABLE ?auto_530899 ) ( IN ?auto_530895 ?auto_530897 ) ( ON ?auto_530888 ?auto_530887 ) ( ON ?auto_530889 ?auto_530888 ) ( ON ?auto_530891 ?auto_530889 ) ( ON ?auto_530890 ?auto_530891 ) ( ON ?auto_530892 ?auto_530890 ) ( ON ?auto_530893 ?auto_530892 ) ( ON ?auto_530894 ?auto_530893 ) ( not ( = ?auto_530887 ?auto_530888 ) ) ( not ( = ?auto_530887 ?auto_530889 ) ) ( not ( = ?auto_530887 ?auto_530891 ) ) ( not ( = ?auto_530887 ?auto_530890 ) ) ( not ( = ?auto_530887 ?auto_530892 ) ) ( not ( = ?auto_530887 ?auto_530893 ) ) ( not ( = ?auto_530887 ?auto_530894 ) ) ( not ( = ?auto_530887 ?auto_530895 ) ) ( not ( = ?auto_530887 ?auto_530896 ) ) ( not ( = ?auto_530887 ?auto_530902 ) ) ( not ( = ?auto_530888 ?auto_530889 ) ) ( not ( = ?auto_530888 ?auto_530891 ) ) ( not ( = ?auto_530888 ?auto_530890 ) ) ( not ( = ?auto_530888 ?auto_530892 ) ) ( not ( = ?auto_530888 ?auto_530893 ) ) ( not ( = ?auto_530888 ?auto_530894 ) ) ( not ( = ?auto_530888 ?auto_530895 ) ) ( not ( = ?auto_530888 ?auto_530896 ) ) ( not ( = ?auto_530888 ?auto_530902 ) ) ( not ( = ?auto_530889 ?auto_530891 ) ) ( not ( = ?auto_530889 ?auto_530890 ) ) ( not ( = ?auto_530889 ?auto_530892 ) ) ( not ( = ?auto_530889 ?auto_530893 ) ) ( not ( = ?auto_530889 ?auto_530894 ) ) ( not ( = ?auto_530889 ?auto_530895 ) ) ( not ( = ?auto_530889 ?auto_530896 ) ) ( not ( = ?auto_530889 ?auto_530902 ) ) ( not ( = ?auto_530891 ?auto_530890 ) ) ( not ( = ?auto_530891 ?auto_530892 ) ) ( not ( = ?auto_530891 ?auto_530893 ) ) ( not ( = ?auto_530891 ?auto_530894 ) ) ( not ( = ?auto_530891 ?auto_530895 ) ) ( not ( = ?auto_530891 ?auto_530896 ) ) ( not ( = ?auto_530891 ?auto_530902 ) ) ( not ( = ?auto_530890 ?auto_530892 ) ) ( not ( = ?auto_530890 ?auto_530893 ) ) ( not ( = ?auto_530890 ?auto_530894 ) ) ( not ( = ?auto_530890 ?auto_530895 ) ) ( not ( = ?auto_530890 ?auto_530896 ) ) ( not ( = ?auto_530890 ?auto_530902 ) ) ( not ( = ?auto_530892 ?auto_530893 ) ) ( not ( = ?auto_530892 ?auto_530894 ) ) ( not ( = ?auto_530892 ?auto_530895 ) ) ( not ( = ?auto_530892 ?auto_530896 ) ) ( not ( = ?auto_530892 ?auto_530902 ) ) ( not ( = ?auto_530893 ?auto_530894 ) ) ( not ( = ?auto_530893 ?auto_530895 ) ) ( not ( = ?auto_530893 ?auto_530896 ) ) ( not ( = ?auto_530893 ?auto_530902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530894 ?auto_530895 ?auto_530896 )
      ( MAKE-9CRATE-VERIFY ?auto_530887 ?auto_530888 ?auto_530889 ?auto_530891 ?auto_530890 ?auto_530892 ?auto_530893 ?auto_530894 ?auto_530895 ?auto_530896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_532413 - SURFACE
      ?auto_532414 - SURFACE
    )
    :vars
    (
      ?auto_532418 - HOIST
      ?auto_532421 - PLACE
      ?auto_532416 - SURFACE
      ?auto_532415 - PLACE
      ?auto_532420 - HOIST
      ?auto_532417 - SURFACE
      ?auto_532419 - TRUCK
      ?auto_532422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_532418 ?auto_532421 ) ( SURFACE-AT ?auto_532413 ?auto_532421 ) ( CLEAR ?auto_532413 ) ( IS-CRATE ?auto_532414 ) ( not ( = ?auto_532413 ?auto_532414 ) ) ( ON ?auto_532413 ?auto_532416 ) ( not ( = ?auto_532416 ?auto_532413 ) ) ( not ( = ?auto_532416 ?auto_532414 ) ) ( not ( = ?auto_532415 ?auto_532421 ) ) ( HOIST-AT ?auto_532420 ?auto_532415 ) ( not ( = ?auto_532418 ?auto_532420 ) ) ( AVAILABLE ?auto_532420 ) ( SURFACE-AT ?auto_532414 ?auto_532415 ) ( ON ?auto_532414 ?auto_532417 ) ( CLEAR ?auto_532414 ) ( not ( = ?auto_532413 ?auto_532417 ) ) ( not ( = ?auto_532414 ?auto_532417 ) ) ( not ( = ?auto_532416 ?auto_532417 ) ) ( TRUCK-AT ?auto_532419 ?auto_532421 ) ( LIFTING ?auto_532418 ?auto_532422 ) ( IS-CRATE ?auto_532422 ) ( not ( = ?auto_532413 ?auto_532422 ) ) ( not ( = ?auto_532414 ?auto_532422 ) ) ( not ( = ?auto_532416 ?auto_532422 ) ) ( not ( = ?auto_532417 ?auto_532422 ) ) )
    :subtasks
    ( ( !LOAD ?auto_532418 ?auto_532422 ?auto_532419 ?auto_532421 )
      ( MAKE-1CRATE ?auto_532413 ?auto_532414 )
      ( MAKE-1CRATE-VERIFY ?auto_532413 ?auto_532414 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536437 - SURFACE
      ?auto_536438 - SURFACE
      ?auto_536439 - SURFACE
      ?auto_536441 - SURFACE
      ?auto_536440 - SURFACE
      ?auto_536442 - SURFACE
      ?auto_536443 - SURFACE
      ?auto_536444 - SURFACE
      ?auto_536445 - SURFACE
      ?auto_536446 - SURFACE
      ?auto_536447 - SURFACE
    )
    :vars
    (
      ?auto_536449 - HOIST
      ?auto_536448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_536449 ?auto_536448 ) ( SURFACE-AT ?auto_536446 ?auto_536448 ) ( CLEAR ?auto_536446 ) ( LIFTING ?auto_536449 ?auto_536447 ) ( IS-CRATE ?auto_536447 ) ( not ( = ?auto_536446 ?auto_536447 ) ) ( ON ?auto_536438 ?auto_536437 ) ( ON ?auto_536439 ?auto_536438 ) ( ON ?auto_536441 ?auto_536439 ) ( ON ?auto_536440 ?auto_536441 ) ( ON ?auto_536442 ?auto_536440 ) ( ON ?auto_536443 ?auto_536442 ) ( ON ?auto_536444 ?auto_536443 ) ( ON ?auto_536445 ?auto_536444 ) ( ON ?auto_536446 ?auto_536445 ) ( not ( = ?auto_536437 ?auto_536438 ) ) ( not ( = ?auto_536437 ?auto_536439 ) ) ( not ( = ?auto_536437 ?auto_536441 ) ) ( not ( = ?auto_536437 ?auto_536440 ) ) ( not ( = ?auto_536437 ?auto_536442 ) ) ( not ( = ?auto_536437 ?auto_536443 ) ) ( not ( = ?auto_536437 ?auto_536444 ) ) ( not ( = ?auto_536437 ?auto_536445 ) ) ( not ( = ?auto_536437 ?auto_536446 ) ) ( not ( = ?auto_536437 ?auto_536447 ) ) ( not ( = ?auto_536438 ?auto_536439 ) ) ( not ( = ?auto_536438 ?auto_536441 ) ) ( not ( = ?auto_536438 ?auto_536440 ) ) ( not ( = ?auto_536438 ?auto_536442 ) ) ( not ( = ?auto_536438 ?auto_536443 ) ) ( not ( = ?auto_536438 ?auto_536444 ) ) ( not ( = ?auto_536438 ?auto_536445 ) ) ( not ( = ?auto_536438 ?auto_536446 ) ) ( not ( = ?auto_536438 ?auto_536447 ) ) ( not ( = ?auto_536439 ?auto_536441 ) ) ( not ( = ?auto_536439 ?auto_536440 ) ) ( not ( = ?auto_536439 ?auto_536442 ) ) ( not ( = ?auto_536439 ?auto_536443 ) ) ( not ( = ?auto_536439 ?auto_536444 ) ) ( not ( = ?auto_536439 ?auto_536445 ) ) ( not ( = ?auto_536439 ?auto_536446 ) ) ( not ( = ?auto_536439 ?auto_536447 ) ) ( not ( = ?auto_536441 ?auto_536440 ) ) ( not ( = ?auto_536441 ?auto_536442 ) ) ( not ( = ?auto_536441 ?auto_536443 ) ) ( not ( = ?auto_536441 ?auto_536444 ) ) ( not ( = ?auto_536441 ?auto_536445 ) ) ( not ( = ?auto_536441 ?auto_536446 ) ) ( not ( = ?auto_536441 ?auto_536447 ) ) ( not ( = ?auto_536440 ?auto_536442 ) ) ( not ( = ?auto_536440 ?auto_536443 ) ) ( not ( = ?auto_536440 ?auto_536444 ) ) ( not ( = ?auto_536440 ?auto_536445 ) ) ( not ( = ?auto_536440 ?auto_536446 ) ) ( not ( = ?auto_536440 ?auto_536447 ) ) ( not ( = ?auto_536442 ?auto_536443 ) ) ( not ( = ?auto_536442 ?auto_536444 ) ) ( not ( = ?auto_536442 ?auto_536445 ) ) ( not ( = ?auto_536442 ?auto_536446 ) ) ( not ( = ?auto_536442 ?auto_536447 ) ) ( not ( = ?auto_536443 ?auto_536444 ) ) ( not ( = ?auto_536443 ?auto_536445 ) ) ( not ( = ?auto_536443 ?auto_536446 ) ) ( not ( = ?auto_536443 ?auto_536447 ) ) ( not ( = ?auto_536444 ?auto_536445 ) ) ( not ( = ?auto_536444 ?auto_536446 ) ) ( not ( = ?auto_536444 ?auto_536447 ) ) ( not ( = ?auto_536445 ?auto_536446 ) ) ( not ( = ?auto_536445 ?auto_536447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_536446 ?auto_536447 )
      ( MAKE-10CRATE-VERIFY ?auto_536437 ?auto_536438 ?auto_536439 ?auto_536441 ?auto_536440 ?auto_536442 ?auto_536443 ?auto_536444 ?auto_536445 ?auto_536446 ?auto_536447 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536531 - SURFACE
      ?auto_536532 - SURFACE
      ?auto_536533 - SURFACE
      ?auto_536535 - SURFACE
      ?auto_536534 - SURFACE
      ?auto_536536 - SURFACE
      ?auto_536537 - SURFACE
      ?auto_536538 - SURFACE
      ?auto_536539 - SURFACE
      ?auto_536540 - SURFACE
      ?auto_536541 - SURFACE
    )
    :vars
    (
      ?auto_536544 - HOIST
      ?auto_536543 - PLACE
      ?auto_536542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_536544 ?auto_536543 ) ( SURFACE-AT ?auto_536540 ?auto_536543 ) ( CLEAR ?auto_536540 ) ( IS-CRATE ?auto_536541 ) ( not ( = ?auto_536540 ?auto_536541 ) ) ( TRUCK-AT ?auto_536542 ?auto_536543 ) ( AVAILABLE ?auto_536544 ) ( IN ?auto_536541 ?auto_536542 ) ( ON ?auto_536540 ?auto_536539 ) ( not ( = ?auto_536539 ?auto_536540 ) ) ( not ( = ?auto_536539 ?auto_536541 ) ) ( ON ?auto_536532 ?auto_536531 ) ( ON ?auto_536533 ?auto_536532 ) ( ON ?auto_536535 ?auto_536533 ) ( ON ?auto_536534 ?auto_536535 ) ( ON ?auto_536536 ?auto_536534 ) ( ON ?auto_536537 ?auto_536536 ) ( ON ?auto_536538 ?auto_536537 ) ( ON ?auto_536539 ?auto_536538 ) ( not ( = ?auto_536531 ?auto_536532 ) ) ( not ( = ?auto_536531 ?auto_536533 ) ) ( not ( = ?auto_536531 ?auto_536535 ) ) ( not ( = ?auto_536531 ?auto_536534 ) ) ( not ( = ?auto_536531 ?auto_536536 ) ) ( not ( = ?auto_536531 ?auto_536537 ) ) ( not ( = ?auto_536531 ?auto_536538 ) ) ( not ( = ?auto_536531 ?auto_536539 ) ) ( not ( = ?auto_536531 ?auto_536540 ) ) ( not ( = ?auto_536531 ?auto_536541 ) ) ( not ( = ?auto_536532 ?auto_536533 ) ) ( not ( = ?auto_536532 ?auto_536535 ) ) ( not ( = ?auto_536532 ?auto_536534 ) ) ( not ( = ?auto_536532 ?auto_536536 ) ) ( not ( = ?auto_536532 ?auto_536537 ) ) ( not ( = ?auto_536532 ?auto_536538 ) ) ( not ( = ?auto_536532 ?auto_536539 ) ) ( not ( = ?auto_536532 ?auto_536540 ) ) ( not ( = ?auto_536532 ?auto_536541 ) ) ( not ( = ?auto_536533 ?auto_536535 ) ) ( not ( = ?auto_536533 ?auto_536534 ) ) ( not ( = ?auto_536533 ?auto_536536 ) ) ( not ( = ?auto_536533 ?auto_536537 ) ) ( not ( = ?auto_536533 ?auto_536538 ) ) ( not ( = ?auto_536533 ?auto_536539 ) ) ( not ( = ?auto_536533 ?auto_536540 ) ) ( not ( = ?auto_536533 ?auto_536541 ) ) ( not ( = ?auto_536535 ?auto_536534 ) ) ( not ( = ?auto_536535 ?auto_536536 ) ) ( not ( = ?auto_536535 ?auto_536537 ) ) ( not ( = ?auto_536535 ?auto_536538 ) ) ( not ( = ?auto_536535 ?auto_536539 ) ) ( not ( = ?auto_536535 ?auto_536540 ) ) ( not ( = ?auto_536535 ?auto_536541 ) ) ( not ( = ?auto_536534 ?auto_536536 ) ) ( not ( = ?auto_536534 ?auto_536537 ) ) ( not ( = ?auto_536534 ?auto_536538 ) ) ( not ( = ?auto_536534 ?auto_536539 ) ) ( not ( = ?auto_536534 ?auto_536540 ) ) ( not ( = ?auto_536534 ?auto_536541 ) ) ( not ( = ?auto_536536 ?auto_536537 ) ) ( not ( = ?auto_536536 ?auto_536538 ) ) ( not ( = ?auto_536536 ?auto_536539 ) ) ( not ( = ?auto_536536 ?auto_536540 ) ) ( not ( = ?auto_536536 ?auto_536541 ) ) ( not ( = ?auto_536537 ?auto_536538 ) ) ( not ( = ?auto_536537 ?auto_536539 ) ) ( not ( = ?auto_536537 ?auto_536540 ) ) ( not ( = ?auto_536537 ?auto_536541 ) ) ( not ( = ?auto_536538 ?auto_536539 ) ) ( not ( = ?auto_536538 ?auto_536540 ) ) ( not ( = ?auto_536538 ?auto_536541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_536539 ?auto_536540 ?auto_536541 )
      ( MAKE-10CRATE-VERIFY ?auto_536531 ?auto_536532 ?auto_536533 ?auto_536535 ?auto_536534 ?auto_536536 ?auto_536537 ?auto_536538 ?auto_536539 ?auto_536540 ?auto_536541 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536636 - SURFACE
      ?auto_536637 - SURFACE
      ?auto_536638 - SURFACE
      ?auto_536640 - SURFACE
      ?auto_536639 - SURFACE
      ?auto_536641 - SURFACE
      ?auto_536642 - SURFACE
      ?auto_536643 - SURFACE
      ?auto_536644 - SURFACE
      ?auto_536645 - SURFACE
      ?auto_536646 - SURFACE
    )
    :vars
    (
      ?auto_536649 - HOIST
      ?auto_536647 - PLACE
      ?auto_536648 - TRUCK
      ?auto_536650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_536649 ?auto_536647 ) ( SURFACE-AT ?auto_536645 ?auto_536647 ) ( CLEAR ?auto_536645 ) ( IS-CRATE ?auto_536646 ) ( not ( = ?auto_536645 ?auto_536646 ) ) ( AVAILABLE ?auto_536649 ) ( IN ?auto_536646 ?auto_536648 ) ( ON ?auto_536645 ?auto_536644 ) ( not ( = ?auto_536644 ?auto_536645 ) ) ( not ( = ?auto_536644 ?auto_536646 ) ) ( TRUCK-AT ?auto_536648 ?auto_536650 ) ( not ( = ?auto_536650 ?auto_536647 ) ) ( ON ?auto_536637 ?auto_536636 ) ( ON ?auto_536638 ?auto_536637 ) ( ON ?auto_536640 ?auto_536638 ) ( ON ?auto_536639 ?auto_536640 ) ( ON ?auto_536641 ?auto_536639 ) ( ON ?auto_536642 ?auto_536641 ) ( ON ?auto_536643 ?auto_536642 ) ( ON ?auto_536644 ?auto_536643 ) ( not ( = ?auto_536636 ?auto_536637 ) ) ( not ( = ?auto_536636 ?auto_536638 ) ) ( not ( = ?auto_536636 ?auto_536640 ) ) ( not ( = ?auto_536636 ?auto_536639 ) ) ( not ( = ?auto_536636 ?auto_536641 ) ) ( not ( = ?auto_536636 ?auto_536642 ) ) ( not ( = ?auto_536636 ?auto_536643 ) ) ( not ( = ?auto_536636 ?auto_536644 ) ) ( not ( = ?auto_536636 ?auto_536645 ) ) ( not ( = ?auto_536636 ?auto_536646 ) ) ( not ( = ?auto_536637 ?auto_536638 ) ) ( not ( = ?auto_536637 ?auto_536640 ) ) ( not ( = ?auto_536637 ?auto_536639 ) ) ( not ( = ?auto_536637 ?auto_536641 ) ) ( not ( = ?auto_536637 ?auto_536642 ) ) ( not ( = ?auto_536637 ?auto_536643 ) ) ( not ( = ?auto_536637 ?auto_536644 ) ) ( not ( = ?auto_536637 ?auto_536645 ) ) ( not ( = ?auto_536637 ?auto_536646 ) ) ( not ( = ?auto_536638 ?auto_536640 ) ) ( not ( = ?auto_536638 ?auto_536639 ) ) ( not ( = ?auto_536638 ?auto_536641 ) ) ( not ( = ?auto_536638 ?auto_536642 ) ) ( not ( = ?auto_536638 ?auto_536643 ) ) ( not ( = ?auto_536638 ?auto_536644 ) ) ( not ( = ?auto_536638 ?auto_536645 ) ) ( not ( = ?auto_536638 ?auto_536646 ) ) ( not ( = ?auto_536640 ?auto_536639 ) ) ( not ( = ?auto_536640 ?auto_536641 ) ) ( not ( = ?auto_536640 ?auto_536642 ) ) ( not ( = ?auto_536640 ?auto_536643 ) ) ( not ( = ?auto_536640 ?auto_536644 ) ) ( not ( = ?auto_536640 ?auto_536645 ) ) ( not ( = ?auto_536640 ?auto_536646 ) ) ( not ( = ?auto_536639 ?auto_536641 ) ) ( not ( = ?auto_536639 ?auto_536642 ) ) ( not ( = ?auto_536639 ?auto_536643 ) ) ( not ( = ?auto_536639 ?auto_536644 ) ) ( not ( = ?auto_536639 ?auto_536645 ) ) ( not ( = ?auto_536639 ?auto_536646 ) ) ( not ( = ?auto_536641 ?auto_536642 ) ) ( not ( = ?auto_536641 ?auto_536643 ) ) ( not ( = ?auto_536641 ?auto_536644 ) ) ( not ( = ?auto_536641 ?auto_536645 ) ) ( not ( = ?auto_536641 ?auto_536646 ) ) ( not ( = ?auto_536642 ?auto_536643 ) ) ( not ( = ?auto_536642 ?auto_536644 ) ) ( not ( = ?auto_536642 ?auto_536645 ) ) ( not ( = ?auto_536642 ?auto_536646 ) ) ( not ( = ?auto_536643 ?auto_536644 ) ) ( not ( = ?auto_536643 ?auto_536645 ) ) ( not ( = ?auto_536643 ?auto_536646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_536644 ?auto_536645 ?auto_536646 )
      ( MAKE-10CRATE-VERIFY ?auto_536636 ?auto_536637 ?auto_536638 ?auto_536640 ?auto_536639 ?auto_536641 ?auto_536642 ?auto_536643 ?auto_536644 ?auto_536645 ?auto_536646 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536751 - SURFACE
      ?auto_536752 - SURFACE
      ?auto_536753 - SURFACE
      ?auto_536755 - SURFACE
      ?auto_536754 - SURFACE
      ?auto_536756 - SURFACE
      ?auto_536757 - SURFACE
      ?auto_536758 - SURFACE
      ?auto_536759 - SURFACE
      ?auto_536760 - SURFACE
      ?auto_536761 - SURFACE
    )
    :vars
    (
      ?auto_536764 - HOIST
      ?auto_536763 - PLACE
      ?auto_536766 - TRUCK
      ?auto_536765 - PLACE
      ?auto_536762 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_536764 ?auto_536763 ) ( SURFACE-AT ?auto_536760 ?auto_536763 ) ( CLEAR ?auto_536760 ) ( IS-CRATE ?auto_536761 ) ( not ( = ?auto_536760 ?auto_536761 ) ) ( AVAILABLE ?auto_536764 ) ( ON ?auto_536760 ?auto_536759 ) ( not ( = ?auto_536759 ?auto_536760 ) ) ( not ( = ?auto_536759 ?auto_536761 ) ) ( TRUCK-AT ?auto_536766 ?auto_536765 ) ( not ( = ?auto_536765 ?auto_536763 ) ) ( HOIST-AT ?auto_536762 ?auto_536765 ) ( LIFTING ?auto_536762 ?auto_536761 ) ( not ( = ?auto_536764 ?auto_536762 ) ) ( ON ?auto_536752 ?auto_536751 ) ( ON ?auto_536753 ?auto_536752 ) ( ON ?auto_536755 ?auto_536753 ) ( ON ?auto_536754 ?auto_536755 ) ( ON ?auto_536756 ?auto_536754 ) ( ON ?auto_536757 ?auto_536756 ) ( ON ?auto_536758 ?auto_536757 ) ( ON ?auto_536759 ?auto_536758 ) ( not ( = ?auto_536751 ?auto_536752 ) ) ( not ( = ?auto_536751 ?auto_536753 ) ) ( not ( = ?auto_536751 ?auto_536755 ) ) ( not ( = ?auto_536751 ?auto_536754 ) ) ( not ( = ?auto_536751 ?auto_536756 ) ) ( not ( = ?auto_536751 ?auto_536757 ) ) ( not ( = ?auto_536751 ?auto_536758 ) ) ( not ( = ?auto_536751 ?auto_536759 ) ) ( not ( = ?auto_536751 ?auto_536760 ) ) ( not ( = ?auto_536751 ?auto_536761 ) ) ( not ( = ?auto_536752 ?auto_536753 ) ) ( not ( = ?auto_536752 ?auto_536755 ) ) ( not ( = ?auto_536752 ?auto_536754 ) ) ( not ( = ?auto_536752 ?auto_536756 ) ) ( not ( = ?auto_536752 ?auto_536757 ) ) ( not ( = ?auto_536752 ?auto_536758 ) ) ( not ( = ?auto_536752 ?auto_536759 ) ) ( not ( = ?auto_536752 ?auto_536760 ) ) ( not ( = ?auto_536752 ?auto_536761 ) ) ( not ( = ?auto_536753 ?auto_536755 ) ) ( not ( = ?auto_536753 ?auto_536754 ) ) ( not ( = ?auto_536753 ?auto_536756 ) ) ( not ( = ?auto_536753 ?auto_536757 ) ) ( not ( = ?auto_536753 ?auto_536758 ) ) ( not ( = ?auto_536753 ?auto_536759 ) ) ( not ( = ?auto_536753 ?auto_536760 ) ) ( not ( = ?auto_536753 ?auto_536761 ) ) ( not ( = ?auto_536755 ?auto_536754 ) ) ( not ( = ?auto_536755 ?auto_536756 ) ) ( not ( = ?auto_536755 ?auto_536757 ) ) ( not ( = ?auto_536755 ?auto_536758 ) ) ( not ( = ?auto_536755 ?auto_536759 ) ) ( not ( = ?auto_536755 ?auto_536760 ) ) ( not ( = ?auto_536755 ?auto_536761 ) ) ( not ( = ?auto_536754 ?auto_536756 ) ) ( not ( = ?auto_536754 ?auto_536757 ) ) ( not ( = ?auto_536754 ?auto_536758 ) ) ( not ( = ?auto_536754 ?auto_536759 ) ) ( not ( = ?auto_536754 ?auto_536760 ) ) ( not ( = ?auto_536754 ?auto_536761 ) ) ( not ( = ?auto_536756 ?auto_536757 ) ) ( not ( = ?auto_536756 ?auto_536758 ) ) ( not ( = ?auto_536756 ?auto_536759 ) ) ( not ( = ?auto_536756 ?auto_536760 ) ) ( not ( = ?auto_536756 ?auto_536761 ) ) ( not ( = ?auto_536757 ?auto_536758 ) ) ( not ( = ?auto_536757 ?auto_536759 ) ) ( not ( = ?auto_536757 ?auto_536760 ) ) ( not ( = ?auto_536757 ?auto_536761 ) ) ( not ( = ?auto_536758 ?auto_536759 ) ) ( not ( = ?auto_536758 ?auto_536760 ) ) ( not ( = ?auto_536758 ?auto_536761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_536759 ?auto_536760 ?auto_536761 )
      ( MAKE-10CRATE-VERIFY ?auto_536751 ?auto_536752 ?auto_536753 ?auto_536755 ?auto_536754 ?auto_536756 ?auto_536757 ?auto_536758 ?auto_536759 ?auto_536760 ?auto_536761 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536876 - SURFACE
      ?auto_536877 - SURFACE
      ?auto_536878 - SURFACE
      ?auto_536880 - SURFACE
      ?auto_536879 - SURFACE
      ?auto_536881 - SURFACE
      ?auto_536882 - SURFACE
      ?auto_536883 - SURFACE
      ?auto_536884 - SURFACE
      ?auto_536885 - SURFACE
      ?auto_536886 - SURFACE
    )
    :vars
    (
      ?auto_536892 - HOIST
      ?auto_536887 - PLACE
      ?auto_536888 - TRUCK
      ?auto_536889 - PLACE
      ?auto_536891 - HOIST
      ?auto_536890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_536892 ?auto_536887 ) ( SURFACE-AT ?auto_536885 ?auto_536887 ) ( CLEAR ?auto_536885 ) ( IS-CRATE ?auto_536886 ) ( not ( = ?auto_536885 ?auto_536886 ) ) ( AVAILABLE ?auto_536892 ) ( ON ?auto_536885 ?auto_536884 ) ( not ( = ?auto_536884 ?auto_536885 ) ) ( not ( = ?auto_536884 ?auto_536886 ) ) ( TRUCK-AT ?auto_536888 ?auto_536889 ) ( not ( = ?auto_536889 ?auto_536887 ) ) ( HOIST-AT ?auto_536891 ?auto_536889 ) ( not ( = ?auto_536892 ?auto_536891 ) ) ( AVAILABLE ?auto_536891 ) ( SURFACE-AT ?auto_536886 ?auto_536889 ) ( ON ?auto_536886 ?auto_536890 ) ( CLEAR ?auto_536886 ) ( not ( = ?auto_536885 ?auto_536890 ) ) ( not ( = ?auto_536886 ?auto_536890 ) ) ( not ( = ?auto_536884 ?auto_536890 ) ) ( ON ?auto_536877 ?auto_536876 ) ( ON ?auto_536878 ?auto_536877 ) ( ON ?auto_536880 ?auto_536878 ) ( ON ?auto_536879 ?auto_536880 ) ( ON ?auto_536881 ?auto_536879 ) ( ON ?auto_536882 ?auto_536881 ) ( ON ?auto_536883 ?auto_536882 ) ( ON ?auto_536884 ?auto_536883 ) ( not ( = ?auto_536876 ?auto_536877 ) ) ( not ( = ?auto_536876 ?auto_536878 ) ) ( not ( = ?auto_536876 ?auto_536880 ) ) ( not ( = ?auto_536876 ?auto_536879 ) ) ( not ( = ?auto_536876 ?auto_536881 ) ) ( not ( = ?auto_536876 ?auto_536882 ) ) ( not ( = ?auto_536876 ?auto_536883 ) ) ( not ( = ?auto_536876 ?auto_536884 ) ) ( not ( = ?auto_536876 ?auto_536885 ) ) ( not ( = ?auto_536876 ?auto_536886 ) ) ( not ( = ?auto_536876 ?auto_536890 ) ) ( not ( = ?auto_536877 ?auto_536878 ) ) ( not ( = ?auto_536877 ?auto_536880 ) ) ( not ( = ?auto_536877 ?auto_536879 ) ) ( not ( = ?auto_536877 ?auto_536881 ) ) ( not ( = ?auto_536877 ?auto_536882 ) ) ( not ( = ?auto_536877 ?auto_536883 ) ) ( not ( = ?auto_536877 ?auto_536884 ) ) ( not ( = ?auto_536877 ?auto_536885 ) ) ( not ( = ?auto_536877 ?auto_536886 ) ) ( not ( = ?auto_536877 ?auto_536890 ) ) ( not ( = ?auto_536878 ?auto_536880 ) ) ( not ( = ?auto_536878 ?auto_536879 ) ) ( not ( = ?auto_536878 ?auto_536881 ) ) ( not ( = ?auto_536878 ?auto_536882 ) ) ( not ( = ?auto_536878 ?auto_536883 ) ) ( not ( = ?auto_536878 ?auto_536884 ) ) ( not ( = ?auto_536878 ?auto_536885 ) ) ( not ( = ?auto_536878 ?auto_536886 ) ) ( not ( = ?auto_536878 ?auto_536890 ) ) ( not ( = ?auto_536880 ?auto_536879 ) ) ( not ( = ?auto_536880 ?auto_536881 ) ) ( not ( = ?auto_536880 ?auto_536882 ) ) ( not ( = ?auto_536880 ?auto_536883 ) ) ( not ( = ?auto_536880 ?auto_536884 ) ) ( not ( = ?auto_536880 ?auto_536885 ) ) ( not ( = ?auto_536880 ?auto_536886 ) ) ( not ( = ?auto_536880 ?auto_536890 ) ) ( not ( = ?auto_536879 ?auto_536881 ) ) ( not ( = ?auto_536879 ?auto_536882 ) ) ( not ( = ?auto_536879 ?auto_536883 ) ) ( not ( = ?auto_536879 ?auto_536884 ) ) ( not ( = ?auto_536879 ?auto_536885 ) ) ( not ( = ?auto_536879 ?auto_536886 ) ) ( not ( = ?auto_536879 ?auto_536890 ) ) ( not ( = ?auto_536881 ?auto_536882 ) ) ( not ( = ?auto_536881 ?auto_536883 ) ) ( not ( = ?auto_536881 ?auto_536884 ) ) ( not ( = ?auto_536881 ?auto_536885 ) ) ( not ( = ?auto_536881 ?auto_536886 ) ) ( not ( = ?auto_536881 ?auto_536890 ) ) ( not ( = ?auto_536882 ?auto_536883 ) ) ( not ( = ?auto_536882 ?auto_536884 ) ) ( not ( = ?auto_536882 ?auto_536885 ) ) ( not ( = ?auto_536882 ?auto_536886 ) ) ( not ( = ?auto_536882 ?auto_536890 ) ) ( not ( = ?auto_536883 ?auto_536884 ) ) ( not ( = ?auto_536883 ?auto_536885 ) ) ( not ( = ?auto_536883 ?auto_536886 ) ) ( not ( = ?auto_536883 ?auto_536890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_536884 ?auto_536885 ?auto_536886 )
      ( MAKE-10CRATE-VERIFY ?auto_536876 ?auto_536877 ?auto_536878 ?auto_536880 ?auto_536879 ?auto_536881 ?auto_536882 ?auto_536883 ?auto_536884 ?auto_536885 ?auto_536886 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537002 - SURFACE
      ?auto_537003 - SURFACE
      ?auto_537004 - SURFACE
      ?auto_537006 - SURFACE
      ?auto_537005 - SURFACE
      ?auto_537007 - SURFACE
      ?auto_537008 - SURFACE
      ?auto_537009 - SURFACE
      ?auto_537010 - SURFACE
      ?auto_537011 - SURFACE
      ?auto_537012 - SURFACE
    )
    :vars
    (
      ?auto_537017 - HOIST
      ?auto_537016 - PLACE
      ?auto_537014 - PLACE
      ?auto_537018 - HOIST
      ?auto_537015 - SURFACE
      ?auto_537013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537017 ?auto_537016 ) ( SURFACE-AT ?auto_537011 ?auto_537016 ) ( CLEAR ?auto_537011 ) ( IS-CRATE ?auto_537012 ) ( not ( = ?auto_537011 ?auto_537012 ) ) ( AVAILABLE ?auto_537017 ) ( ON ?auto_537011 ?auto_537010 ) ( not ( = ?auto_537010 ?auto_537011 ) ) ( not ( = ?auto_537010 ?auto_537012 ) ) ( not ( = ?auto_537014 ?auto_537016 ) ) ( HOIST-AT ?auto_537018 ?auto_537014 ) ( not ( = ?auto_537017 ?auto_537018 ) ) ( AVAILABLE ?auto_537018 ) ( SURFACE-AT ?auto_537012 ?auto_537014 ) ( ON ?auto_537012 ?auto_537015 ) ( CLEAR ?auto_537012 ) ( not ( = ?auto_537011 ?auto_537015 ) ) ( not ( = ?auto_537012 ?auto_537015 ) ) ( not ( = ?auto_537010 ?auto_537015 ) ) ( TRUCK-AT ?auto_537013 ?auto_537016 ) ( ON ?auto_537003 ?auto_537002 ) ( ON ?auto_537004 ?auto_537003 ) ( ON ?auto_537006 ?auto_537004 ) ( ON ?auto_537005 ?auto_537006 ) ( ON ?auto_537007 ?auto_537005 ) ( ON ?auto_537008 ?auto_537007 ) ( ON ?auto_537009 ?auto_537008 ) ( ON ?auto_537010 ?auto_537009 ) ( not ( = ?auto_537002 ?auto_537003 ) ) ( not ( = ?auto_537002 ?auto_537004 ) ) ( not ( = ?auto_537002 ?auto_537006 ) ) ( not ( = ?auto_537002 ?auto_537005 ) ) ( not ( = ?auto_537002 ?auto_537007 ) ) ( not ( = ?auto_537002 ?auto_537008 ) ) ( not ( = ?auto_537002 ?auto_537009 ) ) ( not ( = ?auto_537002 ?auto_537010 ) ) ( not ( = ?auto_537002 ?auto_537011 ) ) ( not ( = ?auto_537002 ?auto_537012 ) ) ( not ( = ?auto_537002 ?auto_537015 ) ) ( not ( = ?auto_537003 ?auto_537004 ) ) ( not ( = ?auto_537003 ?auto_537006 ) ) ( not ( = ?auto_537003 ?auto_537005 ) ) ( not ( = ?auto_537003 ?auto_537007 ) ) ( not ( = ?auto_537003 ?auto_537008 ) ) ( not ( = ?auto_537003 ?auto_537009 ) ) ( not ( = ?auto_537003 ?auto_537010 ) ) ( not ( = ?auto_537003 ?auto_537011 ) ) ( not ( = ?auto_537003 ?auto_537012 ) ) ( not ( = ?auto_537003 ?auto_537015 ) ) ( not ( = ?auto_537004 ?auto_537006 ) ) ( not ( = ?auto_537004 ?auto_537005 ) ) ( not ( = ?auto_537004 ?auto_537007 ) ) ( not ( = ?auto_537004 ?auto_537008 ) ) ( not ( = ?auto_537004 ?auto_537009 ) ) ( not ( = ?auto_537004 ?auto_537010 ) ) ( not ( = ?auto_537004 ?auto_537011 ) ) ( not ( = ?auto_537004 ?auto_537012 ) ) ( not ( = ?auto_537004 ?auto_537015 ) ) ( not ( = ?auto_537006 ?auto_537005 ) ) ( not ( = ?auto_537006 ?auto_537007 ) ) ( not ( = ?auto_537006 ?auto_537008 ) ) ( not ( = ?auto_537006 ?auto_537009 ) ) ( not ( = ?auto_537006 ?auto_537010 ) ) ( not ( = ?auto_537006 ?auto_537011 ) ) ( not ( = ?auto_537006 ?auto_537012 ) ) ( not ( = ?auto_537006 ?auto_537015 ) ) ( not ( = ?auto_537005 ?auto_537007 ) ) ( not ( = ?auto_537005 ?auto_537008 ) ) ( not ( = ?auto_537005 ?auto_537009 ) ) ( not ( = ?auto_537005 ?auto_537010 ) ) ( not ( = ?auto_537005 ?auto_537011 ) ) ( not ( = ?auto_537005 ?auto_537012 ) ) ( not ( = ?auto_537005 ?auto_537015 ) ) ( not ( = ?auto_537007 ?auto_537008 ) ) ( not ( = ?auto_537007 ?auto_537009 ) ) ( not ( = ?auto_537007 ?auto_537010 ) ) ( not ( = ?auto_537007 ?auto_537011 ) ) ( not ( = ?auto_537007 ?auto_537012 ) ) ( not ( = ?auto_537007 ?auto_537015 ) ) ( not ( = ?auto_537008 ?auto_537009 ) ) ( not ( = ?auto_537008 ?auto_537010 ) ) ( not ( = ?auto_537008 ?auto_537011 ) ) ( not ( = ?auto_537008 ?auto_537012 ) ) ( not ( = ?auto_537008 ?auto_537015 ) ) ( not ( = ?auto_537009 ?auto_537010 ) ) ( not ( = ?auto_537009 ?auto_537011 ) ) ( not ( = ?auto_537009 ?auto_537012 ) ) ( not ( = ?auto_537009 ?auto_537015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537010 ?auto_537011 ?auto_537012 )
      ( MAKE-10CRATE-VERIFY ?auto_537002 ?auto_537003 ?auto_537004 ?auto_537006 ?auto_537005 ?auto_537007 ?auto_537008 ?auto_537009 ?auto_537010 ?auto_537011 ?auto_537012 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537128 - SURFACE
      ?auto_537129 - SURFACE
      ?auto_537130 - SURFACE
      ?auto_537132 - SURFACE
      ?auto_537131 - SURFACE
      ?auto_537133 - SURFACE
      ?auto_537134 - SURFACE
      ?auto_537135 - SURFACE
      ?auto_537136 - SURFACE
      ?auto_537137 - SURFACE
      ?auto_537138 - SURFACE
    )
    :vars
    (
      ?auto_537144 - HOIST
      ?auto_537140 - PLACE
      ?auto_537141 - PLACE
      ?auto_537142 - HOIST
      ?auto_537143 - SURFACE
      ?auto_537139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537144 ?auto_537140 ) ( IS-CRATE ?auto_537138 ) ( not ( = ?auto_537137 ?auto_537138 ) ) ( not ( = ?auto_537136 ?auto_537137 ) ) ( not ( = ?auto_537136 ?auto_537138 ) ) ( not ( = ?auto_537141 ?auto_537140 ) ) ( HOIST-AT ?auto_537142 ?auto_537141 ) ( not ( = ?auto_537144 ?auto_537142 ) ) ( AVAILABLE ?auto_537142 ) ( SURFACE-AT ?auto_537138 ?auto_537141 ) ( ON ?auto_537138 ?auto_537143 ) ( CLEAR ?auto_537138 ) ( not ( = ?auto_537137 ?auto_537143 ) ) ( not ( = ?auto_537138 ?auto_537143 ) ) ( not ( = ?auto_537136 ?auto_537143 ) ) ( TRUCK-AT ?auto_537139 ?auto_537140 ) ( SURFACE-AT ?auto_537136 ?auto_537140 ) ( CLEAR ?auto_537136 ) ( LIFTING ?auto_537144 ?auto_537137 ) ( IS-CRATE ?auto_537137 ) ( ON ?auto_537129 ?auto_537128 ) ( ON ?auto_537130 ?auto_537129 ) ( ON ?auto_537132 ?auto_537130 ) ( ON ?auto_537131 ?auto_537132 ) ( ON ?auto_537133 ?auto_537131 ) ( ON ?auto_537134 ?auto_537133 ) ( ON ?auto_537135 ?auto_537134 ) ( ON ?auto_537136 ?auto_537135 ) ( not ( = ?auto_537128 ?auto_537129 ) ) ( not ( = ?auto_537128 ?auto_537130 ) ) ( not ( = ?auto_537128 ?auto_537132 ) ) ( not ( = ?auto_537128 ?auto_537131 ) ) ( not ( = ?auto_537128 ?auto_537133 ) ) ( not ( = ?auto_537128 ?auto_537134 ) ) ( not ( = ?auto_537128 ?auto_537135 ) ) ( not ( = ?auto_537128 ?auto_537136 ) ) ( not ( = ?auto_537128 ?auto_537137 ) ) ( not ( = ?auto_537128 ?auto_537138 ) ) ( not ( = ?auto_537128 ?auto_537143 ) ) ( not ( = ?auto_537129 ?auto_537130 ) ) ( not ( = ?auto_537129 ?auto_537132 ) ) ( not ( = ?auto_537129 ?auto_537131 ) ) ( not ( = ?auto_537129 ?auto_537133 ) ) ( not ( = ?auto_537129 ?auto_537134 ) ) ( not ( = ?auto_537129 ?auto_537135 ) ) ( not ( = ?auto_537129 ?auto_537136 ) ) ( not ( = ?auto_537129 ?auto_537137 ) ) ( not ( = ?auto_537129 ?auto_537138 ) ) ( not ( = ?auto_537129 ?auto_537143 ) ) ( not ( = ?auto_537130 ?auto_537132 ) ) ( not ( = ?auto_537130 ?auto_537131 ) ) ( not ( = ?auto_537130 ?auto_537133 ) ) ( not ( = ?auto_537130 ?auto_537134 ) ) ( not ( = ?auto_537130 ?auto_537135 ) ) ( not ( = ?auto_537130 ?auto_537136 ) ) ( not ( = ?auto_537130 ?auto_537137 ) ) ( not ( = ?auto_537130 ?auto_537138 ) ) ( not ( = ?auto_537130 ?auto_537143 ) ) ( not ( = ?auto_537132 ?auto_537131 ) ) ( not ( = ?auto_537132 ?auto_537133 ) ) ( not ( = ?auto_537132 ?auto_537134 ) ) ( not ( = ?auto_537132 ?auto_537135 ) ) ( not ( = ?auto_537132 ?auto_537136 ) ) ( not ( = ?auto_537132 ?auto_537137 ) ) ( not ( = ?auto_537132 ?auto_537138 ) ) ( not ( = ?auto_537132 ?auto_537143 ) ) ( not ( = ?auto_537131 ?auto_537133 ) ) ( not ( = ?auto_537131 ?auto_537134 ) ) ( not ( = ?auto_537131 ?auto_537135 ) ) ( not ( = ?auto_537131 ?auto_537136 ) ) ( not ( = ?auto_537131 ?auto_537137 ) ) ( not ( = ?auto_537131 ?auto_537138 ) ) ( not ( = ?auto_537131 ?auto_537143 ) ) ( not ( = ?auto_537133 ?auto_537134 ) ) ( not ( = ?auto_537133 ?auto_537135 ) ) ( not ( = ?auto_537133 ?auto_537136 ) ) ( not ( = ?auto_537133 ?auto_537137 ) ) ( not ( = ?auto_537133 ?auto_537138 ) ) ( not ( = ?auto_537133 ?auto_537143 ) ) ( not ( = ?auto_537134 ?auto_537135 ) ) ( not ( = ?auto_537134 ?auto_537136 ) ) ( not ( = ?auto_537134 ?auto_537137 ) ) ( not ( = ?auto_537134 ?auto_537138 ) ) ( not ( = ?auto_537134 ?auto_537143 ) ) ( not ( = ?auto_537135 ?auto_537136 ) ) ( not ( = ?auto_537135 ?auto_537137 ) ) ( not ( = ?auto_537135 ?auto_537138 ) ) ( not ( = ?auto_537135 ?auto_537143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537136 ?auto_537137 ?auto_537138 )
      ( MAKE-10CRATE-VERIFY ?auto_537128 ?auto_537129 ?auto_537130 ?auto_537132 ?auto_537131 ?auto_537133 ?auto_537134 ?auto_537135 ?auto_537136 ?auto_537137 ?auto_537138 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537254 - SURFACE
      ?auto_537255 - SURFACE
      ?auto_537256 - SURFACE
      ?auto_537258 - SURFACE
      ?auto_537257 - SURFACE
      ?auto_537259 - SURFACE
      ?auto_537260 - SURFACE
      ?auto_537261 - SURFACE
      ?auto_537262 - SURFACE
      ?auto_537263 - SURFACE
      ?auto_537264 - SURFACE
    )
    :vars
    (
      ?auto_537269 - HOIST
      ?auto_537266 - PLACE
      ?auto_537267 - PLACE
      ?auto_537270 - HOIST
      ?auto_537265 - SURFACE
      ?auto_537268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537269 ?auto_537266 ) ( IS-CRATE ?auto_537264 ) ( not ( = ?auto_537263 ?auto_537264 ) ) ( not ( = ?auto_537262 ?auto_537263 ) ) ( not ( = ?auto_537262 ?auto_537264 ) ) ( not ( = ?auto_537267 ?auto_537266 ) ) ( HOIST-AT ?auto_537270 ?auto_537267 ) ( not ( = ?auto_537269 ?auto_537270 ) ) ( AVAILABLE ?auto_537270 ) ( SURFACE-AT ?auto_537264 ?auto_537267 ) ( ON ?auto_537264 ?auto_537265 ) ( CLEAR ?auto_537264 ) ( not ( = ?auto_537263 ?auto_537265 ) ) ( not ( = ?auto_537264 ?auto_537265 ) ) ( not ( = ?auto_537262 ?auto_537265 ) ) ( TRUCK-AT ?auto_537268 ?auto_537266 ) ( SURFACE-AT ?auto_537262 ?auto_537266 ) ( CLEAR ?auto_537262 ) ( IS-CRATE ?auto_537263 ) ( AVAILABLE ?auto_537269 ) ( IN ?auto_537263 ?auto_537268 ) ( ON ?auto_537255 ?auto_537254 ) ( ON ?auto_537256 ?auto_537255 ) ( ON ?auto_537258 ?auto_537256 ) ( ON ?auto_537257 ?auto_537258 ) ( ON ?auto_537259 ?auto_537257 ) ( ON ?auto_537260 ?auto_537259 ) ( ON ?auto_537261 ?auto_537260 ) ( ON ?auto_537262 ?auto_537261 ) ( not ( = ?auto_537254 ?auto_537255 ) ) ( not ( = ?auto_537254 ?auto_537256 ) ) ( not ( = ?auto_537254 ?auto_537258 ) ) ( not ( = ?auto_537254 ?auto_537257 ) ) ( not ( = ?auto_537254 ?auto_537259 ) ) ( not ( = ?auto_537254 ?auto_537260 ) ) ( not ( = ?auto_537254 ?auto_537261 ) ) ( not ( = ?auto_537254 ?auto_537262 ) ) ( not ( = ?auto_537254 ?auto_537263 ) ) ( not ( = ?auto_537254 ?auto_537264 ) ) ( not ( = ?auto_537254 ?auto_537265 ) ) ( not ( = ?auto_537255 ?auto_537256 ) ) ( not ( = ?auto_537255 ?auto_537258 ) ) ( not ( = ?auto_537255 ?auto_537257 ) ) ( not ( = ?auto_537255 ?auto_537259 ) ) ( not ( = ?auto_537255 ?auto_537260 ) ) ( not ( = ?auto_537255 ?auto_537261 ) ) ( not ( = ?auto_537255 ?auto_537262 ) ) ( not ( = ?auto_537255 ?auto_537263 ) ) ( not ( = ?auto_537255 ?auto_537264 ) ) ( not ( = ?auto_537255 ?auto_537265 ) ) ( not ( = ?auto_537256 ?auto_537258 ) ) ( not ( = ?auto_537256 ?auto_537257 ) ) ( not ( = ?auto_537256 ?auto_537259 ) ) ( not ( = ?auto_537256 ?auto_537260 ) ) ( not ( = ?auto_537256 ?auto_537261 ) ) ( not ( = ?auto_537256 ?auto_537262 ) ) ( not ( = ?auto_537256 ?auto_537263 ) ) ( not ( = ?auto_537256 ?auto_537264 ) ) ( not ( = ?auto_537256 ?auto_537265 ) ) ( not ( = ?auto_537258 ?auto_537257 ) ) ( not ( = ?auto_537258 ?auto_537259 ) ) ( not ( = ?auto_537258 ?auto_537260 ) ) ( not ( = ?auto_537258 ?auto_537261 ) ) ( not ( = ?auto_537258 ?auto_537262 ) ) ( not ( = ?auto_537258 ?auto_537263 ) ) ( not ( = ?auto_537258 ?auto_537264 ) ) ( not ( = ?auto_537258 ?auto_537265 ) ) ( not ( = ?auto_537257 ?auto_537259 ) ) ( not ( = ?auto_537257 ?auto_537260 ) ) ( not ( = ?auto_537257 ?auto_537261 ) ) ( not ( = ?auto_537257 ?auto_537262 ) ) ( not ( = ?auto_537257 ?auto_537263 ) ) ( not ( = ?auto_537257 ?auto_537264 ) ) ( not ( = ?auto_537257 ?auto_537265 ) ) ( not ( = ?auto_537259 ?auto_537260 ) ) ( not ( = ?auto_537259 ?auto_537261 ) ) ( not ( = ?auto_537259 ?auto_537262 ) ) ( not ( = ?auto_537259 ?auto_537263 ) ) ( not ( = ?auto_537259 ?auto_537264 ) ) ( not ( = ?auto_537259 ?auto_537265 ) ) ( not ( = ?auto_537260 ?auto_537261 ) ) ( not ( = ?auto_537260 ?auto_537262 ) ) ( not ( = ?auto_537260 ?auto_537263 ) ) ( not ( = ?auto_537260 ?auto_537264 ) ) ( not ( = ?auto_537260 ?auto_537265 ) ) ( not ( = ?auto_537261 ?auto_537262 ) ) ( not ( = ?auto_537261 ?auto_537263 ) ) ( not ( = ?auto_537261 ?auto_537264 ) ) ( not ( = ?auto_537261 ?auto_537265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537262 ?auto_537263 ?auto_537264 )
      ( MAKE-10CRATE-VERIFY ?auto_537254 ?auto_537255 ?auto_537256 ?auto_537258 ?auto_537257 ?auto_537259 ?auto_537260 ?auto_537261 ?auto_537262 ?auto_537263 ?auto_537264 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_544517 - SURFACE
      ?auto_544518 - SURFACE
      ?auto_544519 - SURFACE
      ?auto_544521 - SURFACE
      ?auto_544520 - SURFACE
      ?auto_544522 - SURFACE
      ?auto_544523 - SURFACE
      ?auto_544524 - SURFACE
      ?auto_544525 - SURFACE
      ?auto_544526 - SURFACE
      ?auto_544527 - SURFACE
      ?auto_544528 - SURFACE
    )
    :vars
    (
      ?auto_544529 - HOIST
      ?auto_544530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_544529 ?auto_544530 ) ( SURFACE-AT ?auto_544527 ?auto_544530 ) ( CLEAR ?auto_544527 ) ( LIFTING ?auto_544529 ?auto_544528 ) ( IS-CRATE ?auto_544528 ) ( not ( = ?auto_544527 ?auto_544528 ) ) ( ON ?auto_544518 ?auto_544517 ) ( ON ?auto_544519 ?auto_544518 ) ( ON ?auto_544521 ?auto_544519 ) ( ON ?auto_544520 ?auto_544521 ) ( ON ?auto_544522 ?auto_544520 ) ( ON ?auto_544523 ?auto_544522 ) ( ON ?auto_544524 ?auto_544523 ) ( ON ?auto_544525 ?auto_544524 ) ( ON ?auto_544526 ?auto_544525 ) ( ON ?auto_544527 ?auto_544526 ) ( not ( = ?auto_544517 ?auto_544518 ) ) ( not ( = ?auto_544517 ?auto_544519 ) ) ( not ( = ?auto_544517 ?auto_544521 ) ) ( not ( = ?auto_544517 ?auto_544520 ) ) ( not ( = ?auto_544517 ?auto_544522 ) ) ( not ( = ?auto_544517 ?auto_544523 ) ) ( not ( = ?auto_544517 ?auto_544524 ) ) ( not ( = ?auto_544517 ?auto_544525 ) ) ( not ( = ?auto_544517 ?auto_544526 ) ) ( not ( = ?auto_544517 ?auto_544527 ) ) ( not ( = ?auto_544517 ?auto_544528 ) ) ( not ( = ?auto_544518 ?auto_544519 ) ) ( not ( = ?auto_544518 ?auto_544521 ) ) ( not ( = ?auto_544518 ?auto_544520 ) ) ( not ( = ?auto_544518 ?auto_544522 ) ) ( not ( = ?auto_544518 ?auto_544523 ) ) ( not ( = ?auto_544518 ?auto_544524 ) ) ( not ( = ?auto_544518 ?auto_544525 ) ) ( not ( = ?auto_544518 ?auto_544526 ) ) ( not ( = ?auto_544518 ?auto_544527 ) ) ( not ( = ?auto_544518 ?auto_544528 ) ) ( not ( = ?auto_544519 ?auto_544521 ) ) ( not ( = ?auto_544519 ?auto_544520 ) ) ( not ( = ?auto_544519 ?auto_544522 ) ) ( not ( = ?auto_544519 ?auto_544523 ) ) ( not ( = ?auto_544519 ?auto_544524 ) ) ( not ( = ?auto_544519 ?auto_544525 ) ) ( not ( = ?auto_544519 ?auto_544526 ) ) ( not ( = ?auto_544519 ?auto_544527 ) ) ( not ( = ?auto_544519 ?auto_544528 ) ) ( not ( = ?auto_544521 ?auto_544520 ) ) ( not ( = ?auto_544521 ?auto_544522 ) ) ( not ( = ?auto_544521 ?auto_544523 ) ) ( not ( = ?auto_544521 ?auto_544524 ) ) ( not ( = ?auto_544521 ?auto_544525 ) ) ( not ( = ?auto_544521 ?auto_544526 ) ) ( not ( = ?auto_544521 ?auto_544527 ) ) ( not ( = ?auto_544521 ?auto_544528 ) ) ( not ( = ?auto_544520 ?auto_544522 ) ) ( not ( = ?auto_544520 ?auto_544523 ) ) ( not ( = ?auto_544520 ?auto_544524 ) ) ( not ( = ?auto_544520 ?auto_544525 ) ) ( not ( = ?auto_544520 ?auto_544526 ) ) ( not ( = ?auto_544520 ?auto_544527 ) ) ( not ( = ?auto_544520 ?auto_544528 ) ) ( not ( = ?auto_544522 ?auto_544523 ) ) ( not ( = ?auto_544522 ?auto_544524 ) ) ( not ( = ?auto_544522 ?auto_544525 ) ) ( not ( = ?auto_544522 ?auto_544526 ) ) ( not ( = ?auto_544522 ?auto_544527 ) ) ( not ( = ?auto_544522 ?auto_544528 ) ) ( not ( = ?auto_544523 ?auto_544524 ) ) ( not ( = ?auto_544523 ?auto_544525 ) ) ( not ( = ?auto_544523 ?auto_544526 ) ) ( not ( = ?auto_544523 ?auto_544527 ) ) ( not ( = ?auto_544523 ?auto_544528 ) ) ( not ( = ?auto_544524 ?auto_544525 ) ) ( not ( = ?auto_544524 ?auto_544526 ) ) ( not ( = ?auto_544524 ?auto_544527 ) ) ( not ( = ?auto_544524 ?auto_544528 ) ) ( not ( = ?auto_544525 ?auto_544526 ) ) ( not ( = ?auto_544525 ?auto_544527 ) ) ( not ( = ?auto_544525 ?auto_544528 ) ) ( not ( = ?auto_544526 ?auto_544527 ) ) ( not ( = ?auto_544526 ?auto_544528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_544527 ?auto_544528 )
      ( MAKE-11CRATE-VERIFY ?auto_544517 ?auto_544518 ?auto_544519 ?auto_544521 ?auto_544520 ?auto_544522 ?auto_544523 ?auto_544524 ?auto_544525 ?auto_544526 ?auto_544527 ?auto_544528 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_544626 - SURFACE
      ?auto_544627 - SURFACE
      ?auto_544628 - SURFACE
      ?auto_544630 - SURFACE
      ?auto_544629 - SURFACE
      ?auto_544631 - SURFACE
      ?auto_544632 - SURFACE
      ?auto_544633 - SURFACE
      ?auto_544634 - SURFACE
      ?auto_544635 - SURFACE
      ?auto_544636 - SURFACE
      ?auto_544637 - SURFACE
    )
    :vars
    (
      ?auto_544640 - HOIST
      ?auto_544639 - PLACE
      ?auto_544638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_544640 ?auto_544639 ) ( SURFACE-AT ?auto_544636 ?auto_544639 ) ( CLEAR ?auto_544636 ) ( IS-CRATE ?auto_544637 ) ( not ( = ?auto_544636 ?auto_544637 ) ) ( TRUCK-AT ?auto_544638 ?auto_544639 ) ( AVAILABLE ?auto_544640 ) ( IN ?auto_544637 ?auto_544638 ) ( ON ?auto_544636 ?auto_544635 ) ( not ( = ?auto_544635 ?auto_544636 ) ) ( not ( = ?auto_544635 ?auto_544637 ) ) ( ON ?auto_544627 ?auto_544626 ) ( ON ?auto_544628 ?auto_544627 ) ( ON ?auto_544630 ?auto_544628 ) ( ON ?auto_544629 ?auto_544630 ) ( ON ?auto_544631 ?auto_544629 ) ( ON ?auto_544632 ?auto_544631 ) ( ON ?auto_544633 ?auto_544632 ) ( ON ?auto_544634 ?auto_544633 ) ( ON ?auto_544635 ?auto_544634 ) ( not ( = ?auto_544626 ?auto_544627 ) ) ( not ( = ?auto_544626 ?auto_544628 ) ) ( not ( = ?auto_544626 ?auto_544630 ) ) ( not ( = ?auto_544626 ?auto_544629 ) ) ( not ( = ?auto_544626 ?auto_544631 ) ) ( not ( = ?auto_544626 ?auto_544632 ) ) ( not ( = ?auto_544626 ?auto_544633 ) ) ( not ( = ?auto_544626 ?auto_544634 ) ) ( not ( = ?auto_544626 ?auto_544635 ) ) ( not ( = ?auto_544626 ?auto_544636 ) ) ( not ( = ?auto_544626 ?auto_544637 ) ) ( not ( = ?auto_544627 ?auto_544628 ) ) ( not ( = ?auto_544627 ?auto_544630 ) ) ( not ( = ?auto_544627 ?auto_544629 ) ) ( not ( = ?auto_544627 ?auto_544631 ) ) ( not ( = ?auto_544627 ?auto_544632 ) ) ( not ( = ?auto_544627 ?auto_544633 ) ) ( not ( = ?auto_544627 ?auto_544634 ) ) ( not ( = ?auto_544627 ?auto_544635 ) ) ( not ( = ?auto_544627 ?auto_544636 ) ) ( not ( = ?auto_544627 ?auto_544637 ) ) ( not ( = ?auto_544628 ?auto_544630 ) ) ( not ( = ?auto_544628 ?auto_544629 ) ) ( not ( = ?auto_544628 ?auto_544631 ) ) ( not ( = ?auto_544628 ?auto_544632 ) ) ( not ( = ?auto_544628 ?auto_544633 ) ) ( not ( = ?auto_544628 ?auto_544634 ) ) ( not ( = ?auto_544628 ?auto_544635 ) ) ( not ( = ?auto_544628 ?auto_544636 ) ) ( not ( = ?auto_544628 ?auto_544637 ) ) ( not ( = ?auto_544630 ?auto_544629 ) ) ( not ( = ?auto_544630 ?auto_544631 ) ) ( not ( = ?auto_544630 ?auto_544632 ) ) ( not ( = ?auto_544630 ?auto_544633 ) ) ( not ( = ?auto_544630 ?auto_544634 ) ) ( not ( = ?auto_544630 ?auto_544635 ) ) ( not ( = ?auto_544630 ?auto_544636 ) ) ( not ( = ?auto_544630 ?auto_544637 ) ) ( not ( = ?auto_544629 ?auto_544631 ) ) ( not ( = ?auto_544629 ?auto_544632 ) ) ( not ( = ?auto_544629 ?auto_544633 ) ) ( not ( = ?auto_544629 ?auto_544634 ) ) ( not ( = ?auto_544629 ?auto_544635 ) ) ( not ( = ?auto_544629 ?auto_544636 ) ) ( not ( = ?auto_544629 ?auto_544637 ) ) ( not ( = ?auto_544631 ?auto_544632 ) ) ( not ( = ?auto_544631 ?auto_544633 ) ) ( not ( = ?auto_544631 ?auto_544634 ) ) ( not ( = ?auto_544631 ?auto_544635 ) ) ( not ( = ?auto_544631 ?auto_544636 ) ) ( not ( = ?auto_544631 ?auto_544637 ) ) ( not ( = ?auto_544632 ?auto_544633 ) ) ( not ( = ?auto_544632 ?auto_544634 ) ) ( not ( = ?auto_544632 ?auto_544635 ) ) ( not ( = ?auto_544632 ?auto_544636 ) ) ( not ( = ?auto_544632 ?auto_544637 ) ) ( not ( = ?auto_544633 ?auto_544634 ) ) ( not ( = ?auto_544633 ?auto_544635 ) ) ( not ( = ?auto_544633 ?auto_544636 ) ) ( not ( = ?auto_544633 ?auto_544637 ) ) ( not ( = ?auto_544634 ?auto_544635 ) ) ( not ( = ?auto_544634 ?auto_544636 ) ) ( not ( = ?auto_544634 ?auto_544637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_544635 ?auto_544636 ?auto_544637 )
      ( MAKE-11CRATE-VERIFY ?auto_544626 ?auto_544627 ?auto_544628 ?auto_544630 ?auto_544629 ?auto_544631 ?auto_544632 ?auto_544633 ?auto_544634 ?auto_544635 ?auto_544636 ?auto_544637 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_544747 - SURFACE
      ?auto_544748 - SURFACE
      ?auto_544749 - SURFACE
      ?auto_544751 - SURFACE
      ?auto_544750 - SURFACE
      ?auto_544752 - SURFACE
      ?auto_544753 - SURFACE
      ?auto_544754 - SURFACE
      ?auto_544755 - SURFACE
      ?auto_544756 - SURFACE
      ?auto_544757 - SURFACE
      ?auto_544758 - SURFACE
    )
    :vars
    (
      ?auto_544760 - HOIST
      ?auto_544762 - PLACE
      ?auto_544761 - TRUCK
      ?auto_544759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_544760 ?auto_544762 ) ( SURFACE-AT ?auto_544757 ?auto_544762 ) ( CLEAR ?auto_544757 ) ( IS-CRATE ?auto_544758 ) ( not ( = ?auto_544757 ?auto_544758 ) ) ( AVAILABLE ?auto_544760 ) ( IN ?auto_544758 ?auto_544761 ) ( ON ?auto_544757 ?auto_544756 ) ( not ( = ?auto_544756 ?auto_544757 ) ) ( not ( = ?auto_544756 ?auto_544758 ) ) ( TRUCK-AT ?auto_544761 ?auto_544759 ) ( not ( = ?auto_544759 ?auto_544762 ) ) ( ON ?auto_544748 ?auto_544747 ) ( ON ?auto_544749 ?auto_544748 ) ( ON ?auto_544751 ?auto_544749 ) ( ON ?auto_544750 ?auto_544751 ) ( ON ?auto_544752 ?auto_544750 ) ( ON ?auto_544753 ?auto_544752 ) ( ON ?auto_544754 ?auto_544753 ) ( ON ?auto_544755 ?auto_544754 ) ( ON ?auto_544756 ?auto_544755 ) ( not ( = ?auto_544747 ?auto_544748 ) ) ( not ( = ?auto_544747 ?auto_544749 ) ) ( not ( = ?auto_544747 ?auto_544751 ) ) ( not ( = ?auto_544747 ?auto_544750 ) ) ( not ( = ?auto_544747 ?auto_544752 ) ) ( not ( = ?auto_544747 ?auto_544753 ) ) ( not ( = ?auto_544747 ?auto_544754 ) ) ( not ( = ?auto_544747 ?auto_544755 ) ) ( not ( = ?auto_544747 ?auto_544756 ) ) ( not ( = ?auto_544747 ?auto_544757 ) ) ( not ( = ?auto_544747 ?auto_544758 ) ) ( not ( = ?auto_544748 ?auto_544749 ) ) ( not ( = ?auto_544748 ?auto_544751 ) ) ( not ( = ?auto_544748 ?auto_544750 ) ) ( not ( = ?auto_544748 ?auto_544752 ) ) ( not ( = ?auto_544748 ?auto_544753 ) ) ( not ( = ?auto_544748 ?auto_544754 ) ) ( not ( = ?auto_544748 ?auto_544755 ) ) ( not ( = ?auto_544748 ?auto_544756 ) ) ( not ( = ?auto_544748 ?auto_544757 ) ) ( not ( = ?auto_544748 ?auto_544758 ) ) ( not ( = ?auto_544749 ?auto_544751 ) ) ( not ( = ?auto_544749 ?auto_544750 ) ) ( not ( = ?auto_544749 ?auto_544752 ) ) ( not ( = ?auto_544749 ?auto_544753 ) ) ( not ( = ?auto_544749 ?auto_544754 ) ) ( not ( = ?auto_544749 ?auto_544755 ) ) ( not ( = ?auto_544749 ?auto_544756 ) ) ( not ( = ?auto_544749 ?auto_544757 ) ) ( not ( = ?auto_544749 ?auto_544758 ) ) ( not ( = ?auto_544751 ?auto_544750 ) ) ( not ( = ?auto_544751 ?auto_544752 ) ) ( not ( = ?auto_544751 ?auto_544753 ) ) ( not ( = ?auto_544751 ?auto_544754 ) ) ( not ( = ?auto_544751 ?auto_544755 ) ) ( not ( = ?auto_544751 ?auto_544756 ) ) ( not ( = ?auto_544751 ?auto_544757 ) ) ( not ( = ?auto_544751 ?auto_544758 ) ) ( not ( = ?auto_544750 ?auto_544752 ) ) ( not ( = ?auto_544750 ?auto_544753 ) ) ( not ( = ?auto_544750 ?auto_544754 ) ) ( not ( = ?auto_544750 ?auto_544755 ) ) ( not ( = ?auto_544750 ?auto_544756 ) ) ( not ( = ?auto_544750 ?auto_544757 ) ) ( not ( = ?auto_544750 ?auto_544758 ) ) ( not ( = ?auto_544752 ?auto_544753 ) ) ( not ( = ?auto_544752 ?auto_544754 ) ) ( not ( = ?auto_544752 ?auto_544755 ) ) ( not ( = ?auto_544752 ?auto_544756 ) ) ( not ( = ?auto_544752 ?auto_544757 ) ) ( not ( = ?auto_544752 ?auto_544758 ) ) ( not ( = ?auto_544753 ?auto_544754 ) ) ( not ( = ?auto_544753 ?auto_544755 ) ) ( not ( = ?auto_544753 ?auto_544756 ) ) ( not ( = ?auto_544753 ?auto_544757 ) ) ( not ( = ?auto_544753 ?auto_544758 ) ) ( not ( = ?auto_544754 ?auto_544755 ) ) ( not ( = ?auto_544754 ?auto_544756 ) ) ( not ( = ?auto_544754 ?auto_544757 ) ) ( not ( = ?auto_544754 ?auto_544758 ) ) ( not ( = ?auto_544755 ?auto_544756 ) ) ( not ( = ?auto_544755 ?auto_544757 ) ) ( not ( = ?auto_544755 ?auto_544758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_544756 ?auto_544757 ?auto_544758 )
      ( MAKE-11CRATE-VERIFY ?auto_544747 ?auto_544748 ?auto_544749 ?auto_544751 ?auto_544750 ?auto_544752 ?auto_544753 ?auto_544754 ?auto_544755 ?auto_544756 ?auto_544757 ?auto_544758 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_544879 - SURFACE
      ?auto_544880 - SURFACE
      ?auto_544881 - SURFACE
      ?auto_544883 - SURFACE
      ?auto_544882 - SURFACE
      ?auto_544884 - SURFACE
      ?auto_544885 - SURFACE
      ?auto_544886 - SURFACE
      ?auto_544887 - SURFACE
      ?auto_544888 - SURFACE
      ?auto_544889 - SURFACE
      ?auto_544890 - SURFACE
    )
    :vars
    (
      ?auto_544895 - HOIST
      ?auto_544894 - PLACE
      ?auto_544891 - TRUCK
      ?auto_544892 - PLACE
      ?auto_544893 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_544895 ?auto_544894 ) ( SURFACE-AT ?auto_544889 ?auto_544894 ) ( CLEAR ?auto_544889 ) ( IS-CRATE ?auto_544890 ) ( not ( = ?auto_544889 ?auto_544890 ) ) ( AVAILABLE ?auto_544895 ) ( ON ?auto_544889 ?auto_544888 ) ( not ( = ?auto_544888 ?auto_544889 ) ) ( not ( = ?auto_544888 ?auto_544890 ) ) ( TRUCK-AT ?auto_544891 ?auto_544892 ) ( not ( = ?auto_544892 ?auto_544894 ) ) ( HOIST-AT ?auto_544893 ?auto_544892 ) ( LIFTING ?auto_544893 ?auto_544890 ) ( not ( = ?auto_544895 ?auto_544893 ) ) ( ON ?auto_544880 ?auto_544879 ) ( ON ?auto_544881 ?auto_544880 ) ( ON ?auto_544883 ?auto_544881 ) ( ON ?auto_544882 ?auto_544883 ) ( ON ?auto_544884 ?auto_544882 ) ( ON ?auto_544885 ?auto_544884 ) ( ON ?auto_544886 ?auto_544885 ) ( ON ?auto_544887 ?auto_544886 ) ( ON ?auto_544888 ?auto_544887 ) ( not ( = ?auto_544879 ?auto_544880 ) ) ( not ( = ?auto_544879 ?auto_544881 ) ) ( not ( = ?auto_544879 ?auto_544883 ) ) ( not ( = ?auto_544879 ?auto_544882 ) ) ( not ( = ?auto_544879 ?auto_544884 ) ) ( not ( = ?auto_544879 ?auto_544885 ) ) ( not ( = ?auto_544879 ?auto_544886 ) ) ( not ( = ?auto_544879 ?auto_544887 ) ) ( not ( = ?auto_544879 ?auto_544888 ) ) ( not ( = ?auto_544879 ?auto_544889 ) ) ( not ( = ?auto_544879 ?auto_544890 ) ) ( not ( = ?auto_544880 ?auto_544881 ) ) ( not ( = ?auto_544880 ?auto_544883 ) ) ( not ( = ?auto_544880 ?auto_544882 ) ) ( not ( = ?auto_544880 ?auto_544884 ) ) ( not ( = ?auto_544880 ?auto_544885 ) ) ( not ( = ?auto_544880 ?auto_544886 ) ) ( not ( = ?auto_544880 ?auto_544887 ) ) ( not ( = ?auto_544880 ?auto_544888 ) ) ( not ( = ?auto_544880 ?auto_544889 ) ) ( not ( = ?auto_544880 ?auto_544890 ) ) ( not ( = ?auto_544881 ?auto_544883 ) ) ( not ( = ?auto_544881 ?auto_544882 ) ) ( not ( = ?auto_544881 ?auto_544884 ) ) ( not ( = ?auto_544881 ?auto_544885 ) ) ( not ( = ?auto_544881 ?auto_544886 ) ) ( not ( = ?auto_544881 ?auto_544887 ) ) ( not ( = ?auto_544881 ?auto_544888 ) ) ( not ( = ?auto_544881 ?auto_544889 ) ) ( not ( = ?auto_544881 ?auto_544890 ) ) ( not ( = ?auto_544883 ?auto_544882 ) ) ( not ( = ?auto_544883 ?auto_544884 ) ) ( not ( = ?auto_544883 ?auto_544885 ) ) ( not ( = ?auto_544883 ?auto_544886 ) ) ( not ( = ?auto_544883 ?auto_544887 ) ) ( not ( = ?auto_544883 ?auto_544888 ) ) ( not ( = ?auto_544883 ?auto_544889 ) ) ( not ( = ?auto_544883 ?auto_544890 ) ) ( not ( = ?auto_544882 ?auto_544884 ) ) ( not ( = ?auto_544882 ?auto_544885 ) ) ( not ( = ?auto_544882 ?auto_544886 ) ) ( not ( = ?auto_544882 ?auto_544887 ) ) ( not ( = ?auto_544882 ?auto_544888 ) ) ( not ( = ?auto_544882 ?auto_544889 ) ) ( not ( = ?auto_544882 ?auto_544890 ) ) ( not ( = ?auto_544884 ?auto_544885 ) ) ( not ( = ?auto_544884 ?auto_544886 ) ) ( not ( = ?auto_544884 ?auto_544887 ) ) ( not ( = ?auto_544884 ?auto_544888 ) ) ( not ( = ?auto_544884 ?auto_544889 ) ) ( not ( = ?auto_544884 ?auto_544890 ) ) ( not ( = ?auto_544885 ?auto_544886 ) ) ( not ( = ?auto_544885 ?auto_544887 ) ) ( not ( = ?auto_544885 ?auto_544888 ) ) ( not ( = ?auto_544885 ?auto_544889 ) ) ( not ( = ?auto_544885 ?auto_544890 ) ) ( not ( = ?auto_544886 ?auto_544887 ) ) ( not ( = ?auto_544886 ?auto_544888 ) ) ( not ( = ?auto_544886 ?auto_544889 ) ) ( not ( = ?auto_544886 ?auto_544890 ) ) ( not ( = ?auto_544887 ?auto_544888 ) ) ( not ( = ?auto_544887 ?auto_544889 ) ) ( not ( = ?auto_544887 ?auto_544890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_544888 ?auto_544889 ?auto_544890 )
      ( MAKE-11CRATE-VERIFY ?auto_544879 ?auto_544880 ?auto_544881 ?auto_544883 ?auto_544882 ?auto_544884 ?auto_544885 ?auto_544886 ?auto_544887 ?auto_544888 ?auto_544889 ?auto_544890 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545022 - SURFACE
      ?auto_545023 - SURFACE
      ?auto_545024 - SURFACE
      ?auto_545026 - SURFACE
      ?auto_545025 - SURFACE
      ?auto_545027 - SURFACE
      ?auto_545028 - SURFACE
      ?auto_545029 - SURFACE
      ?auto_545030 - SURFACE
      ?auto_545031 - SURFACE
      ?auto_545032 - SURFACE
      ?auto_545033 - SURFACE
    )
    :vars
    (
      ?auto_545038 - HOIST
      ?auto_545039 - PLACE
      ?auto_545036 - TRUCK
      ?auto_545034 - PLACE
      ?auto_545035 - HOIST
      ?auto_545037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545038 ?auto_545039 ) ( SURFACE-AT ?auto_545032 ?auto_545039 ) ( CLEAR ?auto_545032 ) ( IS-CRATE ?auto_545033 ) ( not ( = ?auto_545032 ?auto_545033 ) ) ( AVAILABLE ?auto_545038 ) ( ON ?auto_545032 ?auto_545031 ) ( not ( = ?auto_545031 ?auto_545032 ) ) ( not ( = ?auto_545031 ?auto_545033 ) ) ( TRUCK-AT ?auto_545036 ?auto_545034 ) ( not ( = ?auto_545034 ?auto_545039 ) ) ( HOIST-AT ?auto_545035 ?auto_545034 ) ( not ( = ?auto_545038 ?auto_545035 ) ) ( AVAILABLE ?auto_545035 ) ( SURFACE-AT ?auto_545033 ?auto_545034 ) ( ON ?auto_545033 ?auto_545037 ) ( CLEAR ?auto_545033 ) ( not ( = ?auto_545032 ?auto_545037 ) ) ( not ( = ?auto_545033 ?auto_545037 ) ) ( not ( = ?auto_545031 ?auto_545037 ) ) ( ON ?auto_545023 ?auto_545022 ) ( ON ?auto_545024 ?auto_545023 ) ( ON ?auto_545026 ?auto_545024 ) ( ON ?auto_545025 ?auto_545026 ) ( ON ?auto_545027 ?auto_545025 ) ( ON ?auto_545028 ?auto_545027 ) ( ON ?auto_545029 ?auto_545028 ) ( ON ?auto_545030 ?auto_545029 ) ( ON ?auto_545031 ?auto_545030 ) ( not ( = ?auto_545022 ?auto_545023 ) ) ( not ( = ?auto_545022 ?auto_545024 ) ) ( not ( = ?auto_545022 ?auto_545026 ) ) ( not ( = ?auto_545022 ?auto_545025 ) ) ( not ( = ?auto_545022 ?auto_545027 ) ) ( not ( = ?auto_545022 ?auto_545028 ) ) ( not ( = ?auto_545022 ?auto_545029 ) ) ( not ( = ?auto_545022 ?auto_545030 ) ) ( not ( = ?auto_545022 ?auto_545031 ) ) ( not ( = ?auto_545022 ?auto_545032 ) ) ( not ( = ?auto_545022 ?auto_545033 ) ) ( not ( = ?auto_545022 ?auto_545037 ) ) ( not ( = ?auto_545023 ?auto_545024 ) ) ( not ( = ?auto_545023 ?auto_545026 ) ) ( not ( = ?auto_545023 ?auto_545025 ) ) ( not ( = ?auto_545023 ?auto_545027 ) ) ( not ( = ?auto_545023 ?auto_545028 ) ) ( not ( = ?auto_545023 ?auto_545029 ) ) ( not ( = ?auto_545023 ?auto_545030 ) ) ( not ( = ?auto_545023 ?auto_545031 ) ) ( not ( = ?auto_545023 ?auto_545032 ) ) ( not ( = ?auto_545023 ?auto_545033 ) ) ( not ( = ?auto_545023 ?auto_545037 ) ) ( not ( = ?auto_545024 ?auto_545026 ) ) ( not ( = ?auto_545024 ?auto_545025 ) ) ( not ( = ?auto_545024 ?auto_545027 ) ) ( not ( = ?auto_545024 ?auto_545028 ) ) ( not ( = ?auto_545024 ?auto_545029 ) ) ( not ( = ?auto_545024 ?auto_545030 ) ) ( not ( = ?auto_545024 ?auto_545031 ) ) ( not ( = ?auto_545024 ?auto_545032 ) ) ( not ( = ?auto_545024 ?auto_545033 ) ) ( not ( = ?auto_545024 ?auto_545037 ) ) ( not ( = ?auto_545026 ?auto_545025 ) ) ( not ( = ?auto_545026 ?auto_545027 ) ) ( not ( = ?auto_545026 ?auto_545028 ) ) ( not ( = ?auto_545026 ?auto_545029 ) ) ( not ( = ?auto_545026 ?auto_545030 ) ) ( not ( = ?auto_545026 ?auto_545031 ) ) ( not ( = ?auto_545026 ?auto_545032 ) ) ( not ( = ?auto_545026 ?auto_545033 ) ) ( not ( = ?auto_545026 ?auto_545037 ) ) ( not ( = ?auto_545025 ?auto_545027 ) ) ( not ( = ?auto_545025 ?auto_545028 ) ) ( not ( = ?auto_545025 ?auto_545029 ) ) ( not ( = ?auto_545025 ?auto_545030 ) ) ( not ( = ?auto_545025 ?auto_545031 ) ) ( not ( = ?auto_545025 ?auto_545032 ) ) ( not ( = ?auto_545025 ?auto_545033 ) ) ( not ( = ?auto_545025 ?auto_545037 ) ) ( not ( = ?auto_545027 ?auto_545028 ) ) ( not ( = ?auto_545027 ?auto_545029 ) ) ( not ( = ?auto_545027 ?auto_545030 ) ) ( not ( = ?auto_545027 ?auto_545031 ) ) ( not ( = ?auto_545027 ?auto_545032 ) ) ( not ( = ?auto_545027 ?auto_545033 ) ) ( not ( = ?auto_545027 ?auto_545037 ) ) ( not ( = ?auto_545028 ?auto_545029 ) ) ( not ( = ?auto_545028 ?auto_545030 ) ) ( not ( = ?auto_545028 ?auto_545031 ) ) ( not ( = ?auto_545028 ?auto_545032 ) ) ( not ( = ?auto_545028 ?auto_545033 ) ) ( not ( = ?auto_545028 ?auto_545037 ) ) ( not ( = ?auto_545029 ?auto_545030 ) ) ( not ( = ?auto_545029 ?auto_545031 ) ) ( not ( = ?auto_545029 ?auto_545032 ) ) ( not ( = ?auto_545029 ?auto_545033 ) ) ( not ( = ?auto_545029 ?auto_545037 ) ) ( not ( = ?auto_545030 ?auto_545031 ) ) ( not ( = ?auto_545030 ?auto_545032 ) ) ( not ( = ?auto_545030 ?auto_545033 ) ) ( not ( = ?auto_545030 ?auto_545037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545031 ?auto_545032 ?auto_545033 )
      ( MAKE-11CRATE-VERIFY ?auto_545022 ?auto_545023 ?auto_545024 ?auto_545026 ?auto_545025 ?auto_545027 ?auto_545028 ?auto_545029 ?auto_545030 ?auto_545031 ?auto_545032 ?auto_545033 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545166 - SURFACE
      ?auto_545167 - SURFACE
      ?auto_545168 - SURFACE
      ?auto_545170 - SURFACE
      ?auto_545169 - SURFACE
      ?auto_545171 - SURFACE
      ?auto_545172 - SURFACE
      ?auto_545173 - SURFACE
      ?auto_545174 - SURFACE
      ?auto_545175 - SURFACE
      ?auto_545176 - SURFACE
      ?auto_545177 - SURFACE
    )
    :vars
    (
      ?auto_545183 - HOIST
      ?auto_545179 - PLACE
      ?auto_545182 - PLACE
      ?auto_545181 - HOIST
      ?auto_545180 - SURFACE
      ?auto_545178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545183 ?auto_545179 ) ( SURFACE-AT ?auto_545176 ?auto_545179 ) ( CLEAR ?auto_545176 ) ( IS-CRATE ?auto_545177 ) ( not ( = ?auto_545176 ?auto_545177 ) ) ( AVAILABLE ?auto_545183 ) ( ON ?auto_545176 ?auto_545175 ) ( not ( = ?auto_545175 ?auto_545176 ) ) ( not ( = ?auto_545175 ?auto_545177 ) ) ( not ( = ?auto_545182 ?auto_545179 ) ) ( HOIST-AT ?auto_545181 ?auto_545182 ) ( not ( = ?auto_545183 ?auto_545181 ) ) ( AVAILABLE ?auto_545181 ) ( SURFACE-AT ?auto_545177 ?auto_545182 ) ( ON ?auto_545177 ?auto_545180 ) ( CLEAR ?auto_545177 ) ( not ( = ?auto_545176 ?auto_545180 ) ) ( not ( = ?auto_545177 ?auto_545180 ) ) ( not ( = ?auto_545175 ?auto_545180 ) ) ( TRUCK-AT ?auto_545178 ?auto_545179 ) ( ON ?auto_545167 ?auto_545166 ) ( ON ?auto_545168 ?auto_545167 ) ( ON ?auto_545170 ?auto_545168 ) ( ON ?auto_545169 ?auto_545170 ) ( ON ?auto_545171 ?auto_545169 ) ( ON ?auto_545172 ?auto_545171 ) ( ON ?auto_545173 ?auto_545172 ) ( ON ?auto_545174 ?auto_545173 ) ( ON ?auto_545175 ?auto_545174 ) ( not ( = ?auto_545166 ?auto_545167 ) ) ( not ( = ?auto_545166 ?auto_545168 ) ) ( not ( = ?auto_545166 ?auto_545170 ) ) ( not ( = ?auto_545166 ?auto_545169 ) ) ( not ( = ?auto_545166 ?auto_545171 ) ) ( not ( = ?auto_545166 ?auto_545172 ) ) ( not ( = ?auto_545166 ?auto_545173 ) ) ( not ( = ?auto_545166 ?auto_545174 ) ) ( not ( = ?auto_545166 ?auto_545175 ) ) ( not ( = ?auto_545166 ?auto_545176 ) ) ( not ( = ?auto_545166 ?auto_545177 ) ) ( not ( = ?auto_545166 ?auto_545180 ) ) ( not ( = ?auto_545167 ?auto_545168 ) ) ( not ( = ?auto_545167 ?auto_545170 ) ) ( not ( = ?auto_545167 ?auto_545169 ) ) ( not ( = ?auto_545167 ?auto_545171 ) ) ( not ( = ?auto_545167 ?auto_545172 ) ) ( not ( = ?auto_545167 ?auto_545173 ) ) ( not ( = ?auto_545167 ?auto_545174 ) ) ( not ( = ?auto_545167 ?auto_545175 ) ) ( not ( = ?auto_545167 ?auto_545176 ) ) ( not ( = ?auto_545167 ?auto_545177 ) ) ( not ( = ?auto_545167 ?auto_545180 ) ) ( not ( = ?auto_545168 ?auto_545170 ) ) ( not ( = ?auto_545168 ?auto_545169 ) ) ( not ( = ?auto_545168 ?auto_545171 ) ) ( not ( = ?auto_545168 ?auto_545172 ) ) ( not ( = ?auto_545168 ?auto_545173 ) ) ( not ( = ?auto_545168 ?auto_545174 ) ) ( not ( = ?auto_545168 ?auto_545175 ) ) ( not ( = ?auto_545168 ?auto_545176 ) ) ( not ( = ?auto_545168 ?auto_545177 ) ) ( not ( = ?auto_545168 ?auto_545180 ) ) ( not ( = ?auto_545170 ?auto_545169 ) ) ( not ( = ?auto_545170 ?auto_545171 ) ) ( not ( = ?auto_545170 ?auto_545172 ) ) ( not ( = ?auto_545170 ?auto_545173 ) ) ( not ( = ?auto_545170 ?auto_545174 ) ) ( not ( = ?auto_545170 ?auto_545175 ) ) ( not ( = ?auto_545170 ?auto_545176 ) ) ( not ( = ?auto_545170 ?auto_545177 ) ) ( not ( = ?auto_545170 ?auto_545180 ) ) ( not ( = ?auto_545169 ?auto_545171 ) ) ( not ( = ?auto_545169 ?auto_545172 ) ) ( not ( = ?auto_545169 ?auto_545173 ) ) ( not ( = ?auto_545169 ?auto_545174 ) ) ( not ( = ?auto_545169 ?auto_545175 ) ) ( not ( = ?auto_545169 ?auto_545176 ) ) ( not ( = ?auto_545169 ?auto_545177 ) ) ( not ( = ?auto_545169 ?auto_545180 ) ) ( not ( = ?auto_545171 ?auto_545172 ) ) ( not ( = ?auto_545171 ?auto_545173 ) ) ( not ( = ?auto_545171 ?auto_545174 ) ) ( not ( = ?auto_545171 ?auto_545175 ) ) ( not ( = ?auto_545171 ?auto_545176 ) ) ( not ( = ?auto_545171 ?auto_545177 ) ) ( not ( = ?auto_545171 ?auto_545180 ) ) ( not ( = ?auto_545172 ?auto_545173 ) ) ( not ( = ?auto_545172 ?auto_545174 ) ) ( not ( = ?auto_545172 ?auto_545175 ) ) ( not ( = ?auto_545172 ?auto_545176 ) ) ( not ( = ?auto_545172 ?auto_545177 ) ) ( not ( = ?auto_545172 ?auto_545180 ) ) ( not ( = ?auto_545173 ?auto_545174 ) ) ( not ( = ?auto_545173 ?auto_545175 ) ) ( not ( = ?auto_545173 ?auto_545176 ) ) ( not ( = ?auto_545173 ?auto_545177 ) ) ( not ( = ?auto_545173 ?auto_545180 ) ) ( not ( = ?auto_545174 ?auto_545175 ) ) ( not ( = ?auto_545174 ?auto_545176 ) ) ( not ( = ?auto_545174 ?auto_545177 ) ) ( not ( = ?auto_545174 ?auto_545180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545175 ?auto_545176 ?auto_545177 )
      ( MAKE-11CRATE-VERIFY ?auto_545166 ?auto_545167 ?auto_545168 ?auto_545170 ?auto_545169 ?auto_545171 ?auto_545172 ?auto_545173 ?auto_545174 ?auto_545175 ?auto_545176 ?auto_545177 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545310 - SURFACE
      ?auto_545311 - SURFACE
      ?auto_545312 - SURFACE
      ?auto_545314 - SURFACE
      ?auto_545313 - SURFACE
      ?auto_545315 - SURFACE
      ?auto_545316 - SURFACE
      ?auto_545317 - SURFACE
      ?auto_545318 - SURFACE
      ?auto_545319 - SURFACE
      ?auto_545320 - SURFACE
      ?auto_545321 - SURFACE
    )
    :vars
    (
      ?auto_545322 - HOIST
      ?auto_545323 - PLACE
      ?auto_545326 - PLACE
      ?auto_545325 - HOIST
      ?auto_545327 - SURFACE
      ?auto_545324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545322 ?auto_545323 ) ( IS-CRATE ?auto_545321 ) ( not ( = ?auto_545320 ?auto_545321 ) ) ( not ( = ?auto_545319 ?auto_545320 ) ) ( not ( = ?auto_545319 ?auto_545321 ) ) ( not ( = ?auto_545326 ?auto_545323 ) ) ( HOIST-AT ?auto_545325 ?auto_545326 ) ( not ( = ?auto_545322 ?auto_545325 ) ) ( AVAILABLE ?auto_545325 ) ( SURFACE-AT ?auto_545321 ?auto_545326 ) ( ON ?auto_545321 ?auto_545327 ) ( CLEAR ?auto_545321 ) ( not ( = ?auto_545320 ?auto_545327 ) ) ( not ( = ?auto_545321 ?auto_545327 ) ) ( not ( = ?auto_545319 ?auto_545327 ) ) ( TRUCK-AT ?auto_545324 ?auto_545323 ) ( SURFACE-AT ?auto_545319 ?auto_545323 ) ( CLEAR ?auto_545319 ) ( LIFTING ?auto_545322 ?auto_545320 ) ( IS-CRATE ?auto_545320 ) ( ON ?auto_545311 ?auto_545310 ) ( ON ?auto_545312 ?auto_545311 ) ( ON ?auto_545314 ?auto_545312 ) ( ON ?auto_545313 ?auto_545314 ) ( ON ?auto_545315 ?auto_545313 ) ( ON ?auto_545316 ?auto_545315 ) ( ON ?auto_545317 ?auto_545316 ) ( ON ?auto_545318 ?auto_545317 ) ( ON ?auto_545319 ?auto_545318 ) ( not ( = ?auto_545310 ?auto_545311 ) ) ( not ( = ?auto_545310 ?auto_545312 ) ) ( not ( = ?auto_545310 ?auto_545314 ) ) ( not ( = ?auto_545310 ?auto_545313 ) ) ( not ( = ?auto_545310 ?auto_545315 ) ) ( not ( = ?auto_545310 ?auto_545316 ) ) ( not ( = ?auto_545310 ?auto_545317 ) ) ( not ( = ?auto_545310 ?auto_545318 ) ) ( not ( = ?auto_545310 ?auto_545319 ) ) ( not ( = ?auto_545310 ?auto_545320 ) ) ( not ( = ?auto_545310 ?auto_545321 ) ) ( not ( = ?auto_545310 ?auto_545327 ) ) ( not ( = ?auto_545311 ?auto_545312 ) ) ( not ( = ?auto_545311 ?auto_545314 ) ) ( not ( = ?auto_545311 ?auto_545313 ) ) ( not ( = ?auto_545311 ?auto_545315 ) ) ( not ( = ?auto_545311 ?auto_545316 ) ) ( not ( = ?auto_545311 ?auto_545317 ) ) ( not ( = ?auto_545311 ?auto_545318 ) ) ( not ( = ?auto_545311 ?auto_545319 ) ) ( not ( = ?auto_545311 ?auto_545320 ) ) ( not ( = ?auto_545311 ?auto_545321 ) ) ( not ( = ?auto_545311 ?auto_545327 ) ) ( not ( = ?auto_545312 ?auto_545314 ) ) ( not ( = ?auto_545312 ?auto_545313 ) ) ( not ( = ?auto_545312 ?auto_545315 ) ) ( not ( = ?auto_545312 ?auto_545316 ) ) ( not ( = ?auto_545312 ?auto_545317 ) ) ( not ( = ?auto_545312 ?auto_545318 ) ) ( not ( = ?auto_545312 ?auto_545319 ) ) ( not ( = ?auto_545312 ?auto_545320 ) ) ( not ( = ?auto_545312 ?auto_545321 ) ) ( not ( = ?auto_545312 ?auto_545327 ) ) ( not ( = ?auto_545314 ?auto_545313 ) ) ( not ( = ?auto_545314 ?auto_545315 ) ) ( not ( = ?auto_545314 ?auto_545316 ) ) ( not ( = ?auto_545314 ?auto_545317 ) ) ( not ( = ?auto_545314 ?auto_545318 ) ) ( not ( = ?auto_545314 ?auto_545319 ) ) ( not ( = ?auto_545314 ?auto_545320 ) ) ( not ( = ?auto_545314 ?auto_545321 ) ) ( not ( = ?auto_545314 ?auto_545327 ) ) ( not ( = ?auto_545313 ?auto_545315 ) ) ( not ( = ?auto_545313 ?auto_545316 ) ) ( not ( = ?auto_545313 ?auto_545317 ) ) ( not ( = ?auto_545313 ?auto_545318 ) ) ( not ( = ?auto_545313 ?auto_545319 ) ) ( not ( = ?auto_545313 ?auto_545320 ) ) ( not ( = ?auto_545313 ?auto_545321 ) ) ( not ( = ?auto_545313 ?auto_545327 ) ) ( not ( = ?auto_545315 ?auto_545316 ) ) ( not ( = ?auto_545315 ?auto_545317 ) ) ( not ( = ?auto_545315 ?auto_545318 ) ) ( not ( = ?auto_545315 ?auto_545319 ) ) ( not ( = ?auto_545315 ?auto_545320 ) ) ( not ( = ?auto_545315 ?auto_545321 ) ) ( not ( = ?auto_545315 ?auto_545327 ) ) ( not ( = ?auto_545316 ?auto_545317 ) ) ( not ( = ?auto_545316 ?auto_545318 ) ) ( not ( = ?auto_545316 ?auto_545319 ) ) ( not ( = ?auto_545316 ?auto_545320 ) ) ( not ( = ?auto_545316 ?auto_545321 ) ) ( not ( = ?auto_545316 ?auto_545327 ) ) ( not ( = ?auto_545317 ?auto_545318 ) ) ( not ( = ?auto_545317 ?auto_545319 ) ) ( not ( = ?auto_545317 ?auto_545320 ) ) ( not ( = ?auto_545317 ?auto_545321 ) ) ( not ( = ?auto_545317 ?auto_545327 ) ) ( not ( = ?auto_545318 ?auto_545319 ) ) ( not ( = ?auto_545318 ?auto_545320 ) ) ( not ( = ?auto_545318 ?auto_545321 ) ) ( not ( = ?auto_545318 ?auto_545327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545319 ?auto_545320 ?auto_545321 )
      ( MAKE-11CRATE-VERIFY ?auto_545310 ?auto_545311 ?auto_545312 ?auto_545314 ?auto_545313 ?auto_545315 ?auto_545316 ?auto_545317 ?auto_545318 ?auto_545319 ?auto_545320 ?auto_545321 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545454 - SURFACE
      ?auto_545455 - SURFACE
      ?auto_545456 - SURFACE
      ?auto_545458 - SURFACE
      ?auto_545457 - SURFACE
      ?auto_545459 - SURFACE
      ?auto_545460 - SURFACE
      ?auto_545461 - SURFACE
      ?auto_545462 - SURFACE
      ?auto_545463 - SURFACE
      ?auto_545464 - SURFACE
      ?auto_545465 - SURFACE
    )
    :vars
    (
      ?auto_545468 - HOIST
      ?auto_545466 - PLACE
      ?auto_545471 - PLACE
      ?auto_545469 - HOIST
      ?auto_545467 - SURFACE
      ?auto_545470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545468 ?auto_545466 ) ( IS-CRATE ?auto_545465 ) ( not ( = ?auto_545464 ?auto_545465 ) ) ( not ( = ?auto_545463 ?auto_545464 ) ) ( not ( = ?auto_545463 ?auto_545465 ) ) ( not ( = ?auto_545471 ?auto_545466 ) ) ( HOIST-AT ?auto_545469 ?auto_545471 ) ( not ( = ?auto_545468 ?auto_545469 ) ) ( AVAILABLE ?auto_545469 ) ( SURFACE-AT ?auto_545465 ?auto_545471 ) ( ON ?auto_545465 ?auto_545467 ) ( CLEAR ?auto_545465 ) ( not ( = ?auto_545464 ?auto_545467 ) ) ( not ( = ?auto_545465 ?auto_545467 ) ) ( not ( = ?auto_545463 ?auto_545467 ) ) ( TRUCK-AT ?auto_545470 ?auto_545466 ) ( SURFACE-AT ?auto_545463 ?auto_545466 ) ( CLEAR ?auto_545463 ) ( IS-CRATE ?auto_545464 ) ( AVAILABLE ?auto_545468 ) ( IN ?auto_545464 ?auto_545470 ) ( ON ?auto_545455 ?auto_545454 ) ( ON ?auto_545456 ?auto_545455 ) ( ON ?auto_545458 ?auto_545456 ) ( ON ?auto_545457 ?auto_545458 ) ( ON ?auto_545459 ?auto_545457 ) ( ON ?auto_545460 ?auto_545459 ) ( ON ?auto_545461 ?auto_545460 ) ( ON ?auto_545462 ?auto_545461 ) ( ON ?auto_545463 ?auto_545462 ) ( not ( = ?auto_545454 ?auto_545455 ) ) ( not ( = ?auto_545454 ?auto_545456 ) ) ( not ( = ?auto_545454 ?auto_545458 ) ) ( not ( = ?auto_545454 ?auto_545457 ) ) ( not ( = ?auto_545454 ?auto_545459 ) ) ( not ( = ?auto_545454 ?auto_545460 ) ) ( not ( = ?auto_545454 ?auto_545461 ) ) ( not ( = ?auto_545454 ?auto_545462 ) ) ( not ( = ?auto_545454 ?auto_545463 ) ) ( not ( = ?auto_545454 ?auto_545464 ) ) ( not ( = ?auto_545454 ?auto_545465 ) ) ( not ( = ?auto_545454 ?auto_545467 ) ) ( not ( = ?auto_545455 ?auto_545456 ) ) ( not ( = ?auto_545455 ?auto_545458 ) ) ( not ( = ?auto_545455 ?auto_545457 ) ) ( not ( = ?auto_545455 ?auto_545459 ) ) ( not ( = ?auto_545455 ?auto_545460 ) ) ( not ( = ?auto_545455 ?auto_545461 ) ) ( not ( = ?auto_545455 ?auto_545462 ) ) ( not ( = ?auto_545455 ?auto_545463 ) ) ( not ( = ?auto_545455 ?auto_545464 ) ) ( not ( = ?auto_545455 ?auto_545465 ) ) ( not ( = ?auto_545455 ?auto_545467 ) ) ( not ( = ?auto_545456 ?auto_545458 ) ) ( not ( = ?auto_545456 ?auto_545457 ) ) ( not ( = ?auto_545456 ?auto_545459 ) ) ( not ( = ?auto_545456 ?auto_545460 ) ) ( not ( = ?auto_545456 ?auto_545461 ) ) ( not ( = ?auto_545456 ?auto_545462 ) ) ( not ( = ?auto_545456 ?auto_545463 ) ) ( not ( = ?auto_545456 ?auto_545464 ) ) ( not ( = ?auto_545456 ?auto_545465 ) ) ( not ( = ?auto_545456 ?auto_545467 ) ) ( not ( = ?auto_545458 ?auto_545457 ) ) ( not ( = ?auto_545458 ?auto_545459 ) ) ( not ( = ?auto_545458 ?auto_545460 ) ) ( not ( = ?auto_545458 ?auto_545461 ) ) ( not ( = ?auto_545458 ?auto_545462 ) ) ( not ( = ?auto_545458 ?auto_545463 ) ) ( not ( = ?auto_545458 ?auto_545464 ) ) ( not ( = ?auto_545458 ?auto_545465 ) ) ( not ( = ?auto_545458 ?auto_545467 ) ) ( not ( = ?auto_545457 ?auto_545459 ) ) ( not ( = ?auto_545457 ?auto_545460 ) ) ( not ( = ?auto_545457 ?auto_545461 ) ) ( not ( = ?auto_545457 ?auto_545462 ) ) ( not ( = ?auto_545457 ?auto_545463 ) ) ( not ( = ?auto_545457 ?auto_545464 ) ) ( not ( = ?auto_545457 ?auto_545465 ) ) ( not ( = ?auto_545457 ?auto_545467 ) ) ( not ( = ?auto_545459 ?auto_545460 ) ) ( not ( = ?auto_545459 ?auto_545461 ) ) ( not ( = ?auto_545459 ?auto_545462 ) ) ( not ( = ?auto_545459 ?auto_545463 ) ) ( not ( = ?auto_545459 ?auto_545464 ) ) ( not ( = ?auto_545459 ?auto_545465 ) ) ( not ( = ?auto_545459 ?auto_545467 ) ) ( not ( = ?auto_545460 ?auto_545461 ) ) ( not ( = ?auto_545460 ?auto_545462 ) ) ( not ( = ?auto_545460 ?auto_545463 ) ) ( not ( = ?auto_545460 ?auto_545464 ) ) ( not ( = ?auto_545460 ?auto_545465 ) ) ( not ( = ?auto_545460 ?auto_545467 ) ) ( not ( = ?auto_545461 ?auto_545462 ) ) ( not ( = ?auto_545461 ?auto_545463 ) ) ( not ( = ?auto_545461 ?auto_545464 ) ) ( not ( = ?auto_545461 ?auto_545465 ) ) ( not ( = ?auto_545461 ?auto_545467 ) ) ( not ( = ?auto_545462 ?auto_545463 ) ) ( not ( = ?auto_545462 ?auto_545464 ) ) ( not ( = ?auto_545462 ?auto_545465 ) ) ( not ( = ?auto_545462 ?auto_545467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545463 ?auto_545464 ?auto_545465 )
      ( MAKE-11CRATE-VERIFY ?auto_545454 ?auto_545455 ?auto_545456 ?auto_545458 ?auto_545457 ?auto_545459 ?auto_545460 ?auto_545461 ?auto_545462 ?auto_545463 ?auto_545464 ?auto_545465 ) )
  )

)

