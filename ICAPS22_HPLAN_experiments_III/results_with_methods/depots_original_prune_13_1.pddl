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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910612 - SURFACE
      ?auto_910613 - SURFACE
    )
    :vars
    (
      ?auto_910614 - HOIST
      ?auto_910615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910614 ?auto_910615 ) ( SURFACE-AT ?auto_910612 ?auto_910615 ) ( CLEAR ?auto_910612 ) ( LIFTING ?auto_910614 ?auto_910613 ) ( IS-CRATE ?auto_910613 ) ( not ( = ?auto_910612 ?auto_910613 ) ) )
    :subtasks
    ( ( !DROP ?auto_910614 ?auto_910613 ?auto_910612 ?auto_910615 )
      ( MAKE-1CRATE-VERIFY ?auto_910612 ?auto_910613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910616 - SURFACE
      ?auto_910617 - SURFACE
    )
    :vars
    (
      ?auto_910618 - HOIST
      ?auto_910619 - PLACE
      ?auto_910620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910618 ?auto_910619 ) ( SURFACE-AT ?auto_910616 ?auto_910619 ) ( CLEAR ?auto_910616 ) ( IS-CRATE ?auto_910617 ) ( not ( = ?auto_910616 ?auto_910617 ) ) ( TRUCK-AT ?auto_910620 ?auto_910619 ) ( AVAILABLE ?auto_910618 ) ( IN ?auto_910617 ?auto_910620 ) )
    :subtasks
    ( ( !UNLOAD ?auto_910618 ?auto_910617 ?auto_910620 ?auto_910619 )
      ( MAKE-1CRATE ?auto_910616 ?auto_910617 )
      ( MAKE-1CRATE-VERIFY ?auto_910616 ?auto_910617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910621 - SURFACE
      ?auto_910622 - SURFACE
    )
    :vars
    (
      ?auto_910624 - HOIST
      ?auto_910625 - PLACE
      ?auto_910623 - TRUCK
      ?auto_910626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910624 ?auto_910625 ) ( SURFACE-AT ?auto_910621 ?auto_910625 ) ( CLEAR ?auto_910621 ) ( IS-CRATE ?auto_910622 ) ( not ( = ?auto_910621 ?auto_910622 ) ) ( AVAILABLE ?auto_910624 ) ( IN ?auto_910622 ?auto_910623 ) ( TRUCK-AT ?auto_910623 ?auto_910626 ) ( not ( = ?auto_910626 ?auto_910625 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_910623 ?auto_910626 ?auto_910625 )
      ( MAKE-1CRATE ?auto_910621 ?auto_910622 )
      ( MAKE-1CRATE-VERIFY ?auto_910621 ?auto_910622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910627 - SURFACE
      ?auto_910628 - SURFACE
    )
    :vars
    (
      ?auto_910630 - HOIST
      ?auto_910632 - PLACE
      ?auto_910629 - TRUCK
      ?auto_910631 - PLACE
      ?auto_910633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_910630 ?auto_910632 ) ( SURFACE-AT ?auto_910627 ?auto_910632 ) ( CLEAR ?auto_910627 ) ( IS-CRATE ?auto_910628 ) ( not ( = ?auto_910627 ?auto_910628 ) ) ( AVAILABLE ?auto_910630 ) ( TRUCK-AT ?auto_910629 ?auto_910631 ) ( not ( = ?auto_910631 ?auto_910632 ) ) ( HOIST-AT ?auto_910633 ?auto_910631 ) ( LIFTING ?auto_910633 ?auto_910628 ) ( not ( = ?auto_910630 ?auto_910633 ) ) )
    :subtasks
    ( ( !LOAD ?auto_910633 ?auto_910628 ?auto_910629 ?auto_910631 )
      ( MAKE-1CRATE ?auto_910627 ?auto_910628 )
      ( MAKE-1CRATE-VERIFY ?auto_910627 ?auto_910628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910634 - SURFACE
      ?auto_910635 - SURFACE
    )
    :vars
    (
      ?auto_910640 - HOIST
      ?auto_910639 - PLACE
      ?auto_910638 - TRUCK
      ?auto_910636 - PLACE
      ?auto_910637 - HOIST
      ?auto_910641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910640 ?auto_910639 ) ( SURFACE-AT ?auto_910634 ?auto_910639 ) ( CLEAR ?auto_910634 ) ( IS-CRATE ?auto_910635 ) ( not ( = ?auto_910634 ?auto_910635 ) ) ( AVAILABLE ?auto_910640 ) ( TRUCK-AT ?auto_910638 ?auto_910636 ) ( not ( = ?auto_910636 ?auto_910639 ) ) ( HOIST-AT ?auto_910637 ?auto_910636 ) ( not ( = ?auto_910640 ?auto_910637 ) ) ( AVAILABLE ?auto_910637 ) ( SURFACE-AT ?auto_910635 ?auto_910636 ) ( ON ?auto_910635 ?auto_910641 ) ( CLEAR ?auto_910635 ) ( not ( = ?auto_910634 ?auto_910641 ) ) ( not ( = ?auto_910635 ?auto_910641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_910637 ?auto_910635 ?auto_910641 ?auto_910636 )
      ( MAKE-1CRATE ?auto_910634 ?auto_910635 )
      ( MAKE-1CRATE-VERIFY ?auto_910634 ?auto_910635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910642 - SURFACE
      ?auto_910643 - SURFACE
    )
    :vars
    (
      ?auto_910645 - HOIST
      ?auto_910647 - PLACE
      ?auto_910646 - PLACE
      ?auto_910648 - HOIST
      ?auto_910644 - SURFACE
      ?auto_910649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910645 ?auto_910647 ) ( SURFACE-AT ?auto_910642 ?auto_910647 ) ( CLEAR ?auto_910642 ) ( IS-CRATE ?auto_910643 ) ( not ( = ?auto_910642 ?auto_910643 ) ) ( AVAILABLE ?auto_910645 ) ( not ( = ?auto_910646 ?auto_910647 ) ) ( HOIST-AT ?auto_910648 ?auto_910646 ) ( not ( = ?auto_910645 ?auto_910648 ) ) ( AVAILABLE ?auto_910648 ) ( SURFACE-AT ?auto_910643 ?auto_910646 ) ( ON ?auto_910643 ?auto_910644 ) ( CLEAR ?auto_910643 ) ( not ( = ?auto_910642 ?auto_910644 ) ) ( not ( = ?auto_910643 ?auto_910644 ) ) ( TRUCK-AT ?auto_910649 ?auto_910647 ) )
    :subtasks
    ( ( !DRIVE ?auto_910649 ?auto_910647 ?auto_910646 )
      ( MAKE-1CRATE ?auto_910642 ?auto_910643 )
      ( MAKE-1CRATE-VERIFY ?auto_910642 ?auto_910643 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910659 - SURFACE
      ?auto_910660 - SURFACE
      ?auto_910661 - SURFACE
    )
    :vars
    (
      ?auto_910662 - HOIST
      ?auto_910663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910662 ?auto_910663 ) ( SURFACE-AT ?auto_910660 ?auto_910663 ) ( CLEAR ?auto_910660 ) ( LIFTING ?auto_910662 ?auto_910661 ) ( IS-CRATE ?auto_910661 ) ( not ( = ?auto_910660 ?auto_910661 ) ) ( ON ?auto_910660 ?auto_910659 ) ( not ( = ?auto_910659 ?auto_910660 ) ) ( not ( = ?auto_910659 ?auto_910661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910660 ?auto_910661 )
      ( MAKE-2CRATE-VERIFY ?auto_910659 ?auto_910660 ?auto_910661 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910669 - SURFACE
      ?auto_910670 - SURFACE
      ?auto_910671 - SURFACE
    )
    :vars
    (
      ?auto_910673 - HOIST
      ?auto_910672 - PLACE
      ?auto_910674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910673 ?auto_910672 ) ( SURFACE-AT ?auto_910670 ?auto_910672 ) ( CLEAR ?auto_910670 ) ( IS-CRATE ?auto_910671 ) ( not ( = ?auto_910670 ?auto_910671 ) ) ( TRUCK-AT ?auto_910674 ?auto_910672 ) ( AVAILABLE ?auto_910673 ) ( IN ?auto_910671 ?auto_910674 ) ( ON ?auto_910670 ?auto_910669 ) ( not ( = ?auto_910669 ?auto_910670 ) ) ( not ( = ?auto_910669 ?auto_910671 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910670 ?auto_910671 )
      ( MAKE-2CRATE-VERIFY ?auto_910669 ?auto_910670 ?auto_910671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910675 - SURFACE
      ?auto_910676 - SURFACE
    )
    :vars
    (
      ?auto_910677 - HOIST
      ?auto_910680 - PLACE
      ?auto_910679 - TRUCK
      ?auto_910678 - SURFACE
      ?auto_910681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910677 ?auto_910680 ) ( SURFACE-AT ?auto_910675 ?auto_910680 ) ( CLEAR ?auto_910675 ) ( IS-CRATE ?auto_910676 ) ( not ( = ?auto_910675 ?auto_910676 ) ) ( AVAILABLE ?auto_910677 ) ( IN ?auto_910676 ?auto_910679 ) ( ON ?auto_910675 ?auto_910678 ) ( not ( = ?auto_910678 ?auto_910675 ) ) ( not ( = ?auto_910678 ?auto_910676 ) ) ( TRUCK-AT ?auto_910679 ?auto_910681 ) ( not ( = ?auto_910681 ?auto_910680 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_910679 ?auto_910681 ?auto_910680 )
      ( MAKE-2CRATE ?auto_910678 ?auto_910675 ?auto_910676 )
      ( MAKE-1CRATE-VERIFY ?auto_910675 ?auto_910676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910682 - SURFACE
      ?auto_910683 - SURFACE
      ?auto_910684 - SURFACE
    )
    :vars
    (
      ?auto_910686 - HOIST
      ?auto_910688 - PLACE
      ?auto_910685 - TRUCK
      ?auto_910687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910686 ?auto_910688 ) ( SURFACE-AT ?auto_910683 ?auto_910688 ) ( CLEAR ?auto_910683 ) ( IS-CRATE ?auto_910684 ) ( not ( = ?auto_910683 ?auto_910684 ) ) ( AVAILABLE ?auto_910686 ) ( IN ?auto_910684 ?auto_910685 ) ( ON ?auto_910683 ?auto_910682 ) ( not ( = ?auto_910682 ?auto_910683 ) ) ( not ( = ?auto_910682 ?auto_910684 ) ) ( TRUCK-AT ?auto_910685 ?auto_910687 ) ( not ( = ?auto_910687 ?auto_910688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910683 ?auto_910684 )
      ( MAKE-2CRATE-VERIFY ?auto_910682 ?auto_910683 ?auto_910684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910689 - SURFACE
      ?auto_910690 - SURFACE
    )
    :vars
    (
      ?auto_910692 - HOIST
      ?auto_910694 - PLACE
      ?auto_910691 - SURFACE
      ?auto_910693 - TRUCK
      ?auto_910695 - PLACE
      ?auto_910696 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_910692 ?auto_910694 ) ( SURFACE-AT ?auto_910689 ?auto_910694 ) ( CLEAR ?auto_910689 ) ( IS-CRATE ?auto_910690 ) ( not ( = ?auto_910689 ?auto_910690 ) ) ( AVAILABLE ?auto_910692 ) ( ON ?auto_910689 ?auto_910691 ) ( not ( = ?auto_910691 ?auto_910689 ) ) ( not ( = ?auto_910691 ?auto_910690 ) ) ( TRUCK-AT ?auto_910693 ?auto_910695 ) ( not ( = ?auto_910695 ?auto_910694 ) ) ( HOIST-AT ?auto_910696 ?auto_910695 ) ( LIFTING ?auto_910696 ?auto_910690 ) ( not ( = ?auto_910692 ?auto_910696 ) ) )
    :subtasks
    ( ( !LOAD ?auto_910696 ?auto_910690 ?auto_910693 ?auto_910695 )
      ( MAKE-2CRATE ?auto_910691 ?auto_910689 ?auto_910690 )
      ( MAKE-1CRATE-VERIFY ?auto_910689 ?auto_910690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910697 - SURFACE
      ?auto_910698 - SURFACE
      ?auto_910699 - SURFACE
    )
    :vars
    (
      ?auto_910701 - HOIST
      ?auto_910702 - PLACE
      ?auto_910703 - TRUCK
      ?auto_910704 - PLACE
      ?auto_910700 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_910701 ?auto_910702 ) ( SURFACE-AT ?auto_910698 ?auto_910702 ) ( CLEAR ?auto_910698 ) ( IS-CRATE ?auto_910699 ) ( not ( = ?auto_910698 ?auto_910699 ) ) ( AVAILABLE ?auto_910701 ) ( ON ?auto_910698 ?auto_910697 ) ( not ( = ?auto_910697 ?auto_910698 ) ) ( not ( = ?auto_910697 ?auto_910699 ) ) ( TRUCK-AT ?auto_910703 ?auto_910704 ) ( not ( = ?auto_910704 ?auto_910702 ) ) ( HOIST-AT ?auto_910700 ?auto_910704 ) ( LIFTING ?auto_910700 ?auto_910699 ) ( not ( = ?auto_910701 ?auto_910700 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910698 ?auto_910699 )
      ( MAKE-2CRATE-VERIFY ?auto_910697 ?auto_910698 ?auto_910699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910705 - SURFACE
      ?auto_910706 - SURFACE
    )
    :vars
    (
      ?auto_910712 - HOIST
      ?auto_910707 - PLACE
      ?auto_910708 - SURFACE
      ?auto_910711 - TRUCK
      ?auto_910709 - PLACE
      ?auto_910710 - HOIST
      ?auto_910713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910712 ?auto_910707 ) ( SURFACE-AT ?auto_910705 ?auto_910707 ) ( CLEAR ?auto_910705 ) ( IS-CRATE ?auto_910706 ) ( not ( = ?auto_910705 ?auto_910706 ) ) ( AVAILABLE ?auto_910712 ) ( ON ?auto_910705 ?auto_910708 ) ( not ( = ?auto_910708 ?auto_910705 ) ) ( not ( = ?auto_910708 ?auto_910706 ) ) ( TRUCK-AT ?auto_910711 ?auto_910709 ) ( not ( = ?auto_910709 ?auto_910707 ) ) ( HOIST-AT ?auto_910710 ?auto_910709 ) ( not ( = ?auto_910712 ?auto_910710 ) ) ( AVAILABLE ?auto_910710 ) ( SURFACE-AT ?auto_910706 ?auto_910709 ) ( ON ?auto_910706 ?auto_910713 ) ( CLEAR ?auto_910706 ) ( not ( = ?auto_910705 ?auto_910713 ) ) ( not ( = ?auto_910706 ?auto_910713 ) ) ( not ( = ?auto_910708 ?auto_910713 ) ) )
    :subtasks
    ( ( !LIFT ?auto_910710 ?auto_910706 ?auto_910713 ?auto_910709 )
      ( MAKE-2CRATE ?auto_910708 ?auto_910705 ?auto_910706 )
      ( MAKE-1CRATE-VERIFY ?auto_910705 ?auto_910706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910714 - SURFACE
      ?auto_910715 - SURFACE
      ?auto_910716 - SURFACE
    )
    :vars
    (
      ?auto_910721 - HOIST
      ?auto_910719 - PLACE
      ?auto_910722 - TRUCK
      ?auto_910717 - PLACE
      ?auto_910718 - HOIST
      ?auto_910720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910721 ?auto_910719 ) ( SURFACE-AT ?auto_910715 ?auto_910719 ) ( CLEAR ?auto_910715 ) ( IS-CRATE ?auto_910716 ) ( not ( = ?auto_910715 ?auto_910716 ) ) ( AVAILABLE ?auto_910721 ) ( ON ?auto_910715 ?auto_910714 ) ( not ( = ?auto_910714 ?auto_910715 ) ) ( not ( = ?auto_910714 ?auto_910716 ) ) ( TRUCK-AT ?auto_910722 ?auto_910717 ) ( not ( = ?auto_910717 ?auto_910719 ) ) ( HOIST-AT ?auto_910718 ?auto_910717 ) ( not ( = ?auto_910721 ?auto_910718 ) ) ( AVAILABLE ?auto_910718 ) ( SURFACE-AT ?auto_910716 ?auto_910717 ) ( ON ?auto_910716 ?auto_910720 ) ( CLEAR ?auto_910716 ) ( not ( = ?auto_910715 ?auto_910720 ) ) ( not ( = ?auto_910716 ?auto_910720 ) ) ( not ( = ?auto_910714 ?auto_910720 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910715 ?auto_910716 )
      ( MAKE-2CRATE-VERIFY ?auto_910714 ?auto_910715 ?auto_910716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910723 - SURFACE
      ?auto_910724 - SURFACE
    )
    :vars
    (
      ?auto_910725 - HOIST
      ?auto_910729 - PLACE
      ?auto_910726 - SURFACE
      ?auto_910728 - PLACE
      ?auto_910731 - HOIST
      ?auto_910727 - SURFACE
      ?auto_910730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910725 ?auto_910729 ) ( SURFACE-AT ?auto_910723 ?auto_910729 ) ( CLEAR ?auto_910723 ) ( IS-CRATE ?auto_910724 ) ( not ( = ?auto_910723 ?auto_910724 ) ) ( AVAILABLE ?auto_910725 ) ( ON ?auto_910723 ?auto_910726 ) ( not ( = ?auto_910726 ?auto_910723 ) ) ( not ( = ?auto_910726 ?auto_910724 ) ) ( not ( = ?auto_910728 ?auto_910729 ) ) ( HOIST-AT ?auto_910731 ?auto_910728 ) ( not ( = ?auto_910725 ?auto_910731 ) ) ( AVAILABLE ?auto_910731 ) ( SURFACE-AT ?auto_910724 ?auto_910728 ) ( ON ?auto_910724 ?auto_910727 ) ( CLEAR ?auto_910724 ) ( not ( = ?auto_910723 ?auto_910727 ) ) ( not ( = ?auto_910724 ?auto_910727 ) ) ( not ( = ?auto_910726 ?auto_910727 ) ) ( TRUCK-AT ?auto_910730 ?auto_910729 ) )
    :subtasks
    ( ( !DRIVE ?auto_910730 ?auto_910729 ?auto_910728 )
      ( MAKE-2CRATE ?auto_910726 ?auto_910723 ?auto_910724 )
      ( MAKE-1CRATE-VERIFY ?auto_910723 ?auto_910724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910732 - SURFACE
      ?auto_910733 - SURFACE
      ?auto_910734 - SURFACE
    )
    :vars
    (
      ?auto_910736 - HOIST
      ?auto_910735 - PLACE
      ?auto_910740 - PLACE
      ?auto_910737 - HOIST
      ?auto_910739 - SURFACE
      ?auto_910738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910736 ?auto_910735 ) ( SURFACE-AT ?auto_910733 ?auto_910735 ) ( CLEAR ?auto_910733 ) ( IS-CRATE ?auto_910734 ) ( not ( = ?auto_910733 ?auto_910734 ) ) ( AVAILABLE ?auto_910736 ) ( ON ?auto_910733 ?auto_910732 ) ( not ( = ?auto_910732 ?auto_910733 ) ) ( not ( = ?auto_910732 ?auto_910734 ) ) ( not ( = ?auto_910740 ?auto_910735 ) ) ( HOIST-AT ?auto_910737 ?auto_910740 ) ( not ( = ?auto_910736 ?auto_910737 ) ) ( AVAILABLE ?auto_910737 ) ( SURFACE-AT ?auto_910734 ?auto_910740 ) ( ON ?auto_910734 ?auto_910739 ) ( CLEAR ?auto_910734 ) ( not ( = ?auto_910733 ?auto_910739 ) ) ( not ( = ?auto_910734 ?auto_910739 ) ) ( not ( = ?auto_910732 ?auto_910739 ) ) ( TRUCK-AT ?auto_910738 ?auto_910735 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910733 ?auto_910734 )
      ( MAKE-2CRATE-VERIFY ?auto_910732 ?auto_910733 ?auto_910734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910741 - SURFACE
      ?auto_910742 - SURFACE
    )
    :vars
    (
      ?auto_910747 - HOIST
      ?auto_910743 - PLACE
      ?auto_910744 - SURFACE
      ?auto_910746 - PLACE
      ?auto_910745 - HOIST
      ?auto_910748 - SURFACE
      ?auto_910749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910747 ?auto_910743 ) ( IS-CRATE ?auto_910742 ) ( not ( = ?auto_910741 ?auto_910742 ) ) ( not ( = ?auto_910744 ?auto_910741 ) ) ( not ( = ?auto_910744 ?auto_910742 ) ) ( not ( = ?auto_910746 ?auto_910743 ) ) ( HOIST-AT ?auto_910745 ?auto_910746 ) ( not ( = ?auto_910747 ?auto_910745 ) ) ( AVAILABLE ?auto_910745 ) ( SURFACE-AT ?auto_910742 ?auto_910746 ) ( ON ?auto_910742 ?auto_910748 ) ( CLEAR ?auto_910742 ) ( not ( = ?auto_910741 ?auto_910748 ) ) ( not ( = ?auto_910742 ?auto_910748 ) ) ( not ( = ?auto_910744 ?auto_910748 ) ) ( TRUCK-AT ?auto_910749 ?auto_910743 ) ( SURFACE-AT ?auto_910744 ?auto_910743 ) ( CLEAR ?auto_910744 ) ( LIFTING ?auto_910747 ?auto_910741 ) ( IS-CRATE ?auto_910741 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910744 ?auto_910741 )
      ( MAKE-2CRATE ?auto_910744 ?auto_910741 ?auto_910742 )
      ( MAKE-1CRATE-VERIFY ?auto_910741 ?auto_910742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910750 - SURFACE
      ?auto_910751 - SURFACE
      ?auto_910752 - SURFACE
    )
    :vars
    (
      ?auto_910756 - HOIST
      ?auto_910757 - PLACE
      ?auto_910758 - PLACE
      ?auto_910754 - HOIST
      ?auto_910755 - SURFACE
      ?auto_910753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910756 ?auto_910757 ) ( IS-CRATE ?auto_910752 ) ( not ( = ?auto_910751 ?auto_910752 ) ) ( not ( = ?auto_910750 ?auto_910751 ) ) ( not ( = ?auto_910750 ?auto_910752 ) ) ( not ( = ?auto_910758 ?auto_910757 ) ) ( HOIST-AT ?auto_910754 ?auto_910758 ) ( not ( = ?auto_910756 ?auto_910754 ) ) ( AVAILABLE ?auto_910754 ) ( SURFACE-AT ?auto_910752 ?auto_910758 ) ( ON ?auto_910752 ?auto_910755 ) ( CLEAR ?auto_910752 ) ( not ( = ?auto_910751 ?auto_910755 ) ) ( not ( = ?auto_910752 ?auto_910755 ) ) ( not ( = ?auto_910750 ?auto_910755 ) ) ( TRUCK-AT ?auto_910753 ?auto_910757 ) ( SURFACE-AT ?auto_910750 ?auto_910757 ) ( CLEAR ?auto_910750 ) ( LIFTING ?auto_910756 ?auto_910751 ) ( IS-CRATE ?auto_910751 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910751 ?auto_910752 )
      ( MAKE-2CRATE-VERIFY ?auto_910750 ?auto_910751 ?auto_910752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910759 - SURFACE
      ?auto_910760 - SURFACE
    )
    :vars
    (
      ?auto_910765 - HOIST
      ?auto_910763 - PLACE
      ?auto_910766 - SURFACE
      ?auto_910762 - PLACE
      ?auto_910767 - HOIST
      ?auto_910764 - SURFACE
      ?auto_910761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910765 ?auto_910763 ) ( IS-CRATE ?auto_910760 ) ( not ( = ?auto_910759 ?auto_910760 ) ) ( not ( = ?auto_910766 ?auto_910759 ) ) ( not ( = ?auto_910766 ?auto_910760 ) ) ( not ( = ?auto_910762 ?auto_910763 ) ) ( HOIST-AT ?auto_910767 ?auto_910762 ) ( not ( = ?auto_910765 ?auto_910767 ) ) ( AVAILABLE ?auto_910767 ) ( SURFACE-AT ?auto_910760 ?auto_910762 ) ( ON ?auto_910760 ?auto_910764 ) ( CLEAR ?auto_910760 ) ( not ( = ?auto_910759 ?auto_910764 ) ) ( not ( = ?auto_910760 ?auto_910764 ) ) ( not ( = ?auto_910766 ?auto_910764 ) ) ( TRUCK-AT ?auto_910761 ?auto_910763 ) ( SURFACE-AT ?auto_910766 ?auto_910763 ) ( CLEAR ?auto_910766 ) ( IS-CRATE ?auto_910759 ) ( AVAILABLE ?auto_910765 ) ( IN ?auto_910759 ?auto_910761 ) )
    :subtasks
    ( ( !UNLOAD ?auto_910765 ?auto_910759 ?auto_910761 ?auto_910763 )
      ( MAKE-2CRATE ?auto_910766 ?auto_910759 ?auto_910760 )
      ( MAKE-1CRATE-VERIFY ?auto_910759 ?auto_910760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910768 - SURFACE
      ?auto_910769 - SURFACE
      ?auto_910770 - SURFACE
    )
    :vars
    (
      ?auto_910771 - HOIST
      ?auto_910776 - PLACE
      ?auto_910772 - PLACE
      ?auto_910773 - HOIST
      ?auto_910774 - SURFACE
      ?auto_910775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910771 ?auto_910776 ) ( IS-CRATE ?auto_910770 ) ( not ( = ?auto_910769 ?auto_910770 ) ) ( not ( = ?auto_910768 ?auto_910769 ) ) ( not ( = ?auto_910768 ?auto_910770 ) ) ( not ( = ?auto_910772 ?auto_910776 ) ) ( HOIST-AT ?auto_910773 ?auto_910772 ) ( not ( = ?auto_910771 ?auto_910773 ) ) ( AVAILABLE ?auto_910773 ) ( SURFACE-AT ?auto_910770 ?auto_910772 ) ( ON ?auto_910770 ?auto_910774 ) ( CLEAR ?auto_910770 ) ( not ( = ?auto_910769 ?auto_910774 ) ) ( not ( = ?auto_910770 ?auto_910774 ) ) ( not ( = ?auto_910768 ?auto_910774 ) ) ( TRUCK-AT ?auto_910775 ?auto_910776 ) ( SURFACE-AT ?auto_910768 ?auto_910776 ) ( CLEAR ?auto_910768 ) ( IS-CRATE ?auto_910769 ) ( AVAILABLE ?auto_910771 ) ( IN ?auto_910769 ?auto_910775 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910769 ?auto_910770 )
      ( MAKE-2CRATE-VERIFY ?auto_910768 ?auto_910769 ?auto_910770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910777 - SURFACE
      ?auto_910778 - SURFACE
    )
    :vars
    (
      ?auto_910781 - HOIST
      ?auto_910784 - PLACE
      ?auto_910780 - SURFACE
      ?auto_910782 - PLACE
      ?auto_910783 - HOIST
      ?auto_910779 - SURFACE
      ?auto_910785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910781 ?auto_910784 ) ( IS-CRATE ?auto_910778 ) ( not ( = ?auto_910777 ?auto_910778 ) ) ( not ( = ?auto_910780 ?auto_910777 ) ) ( not ( = ?auto_910780 ?auto_910778 ) ) ( not ( = ?auto_910782 ?auto_910784 ) ) ( HOIST-AT ?auto_910783 ?auto_910782 ) ( not ( = ?auto_910781 ?auto_910783 ) ) ( AVAILABLE ?auto_910783 ) ( SURFACE-AT ?auto_910778 ?auto_910782 ) ( ON ?auto_910778 ?auto_910779 ) ( CLEAR ?auto_910778 ) ( not ( = ?auto_910777 ?auto_910779 ) ) ( not ( = ?auto_910778 ?auto_910779 ) ) ( not ( = ?auto_910780 ?auto_910779 ) ) ( SURFACE-AT ?auto_910780 ?auto_910784 ) ( CLEAR ?auto_910780 ) ( IS-CRATE ?auto_910777 ) ( AVAILABLE ?auto_910781 ) ( IN ?auto_910777 ?auto_910785 ) ( TRUCK-AT ?auto_910785 ?auto_910782 ) )
    :subtasks
    ( ( !DRIVE ?auto_910785 ?auto_910782 ?auto_910784 )
      ( MAKE-2CRATE ?auto_910780 ?auto_910777 ?auto_910778 )
      ( MAKE-1CRATE-VERIFY ?auto_910777 ?auto_910778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910786 - SURFACE
      ?auto_910787 - SURFACE
      ?auto_910788 - SURFACE
    )
    :vars
    (
      ?auto_910792 - HOIST
      ?auto_910794 - PLACE
      ?auto_910789 - PLACE
      ?auto_910790 - HOIST
      ?auto_910793 - SURFACE
      ?auto_910791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910792 ?auto_910794 ) ( IS-CRATE ?auto_910788 ) ( not ( = ?auto_910787 ?auto_910788 ) ) ( not ( = ?auto_910786 ?auto_910787 ) ) ( not ( = ?auto_910786 ?auto_910788 ) ) ( not ( = ?auto_910789 ?auto_910794 ) ) ( HOIST-AT ?auto_910790 ?auto_910789 ) ( not ( = ?auto_910792 ?auto_910790 ) ) ( AVAILABLE ?auto_910790 ) ( SURFACE-AT ?auto_910788 ?auto_910789 ) ( ON ?auto_910788 ?auto_910793 ) ( CLEAR ?auto_910788 ) ( not ( = ?auto_910787 ?auto_910793 ) ) ( not ( = ?auto_910788 ?auto_910793 ) ) ( not ( = ?auto_910786 ?auto_910793 ) ) ( SURFACE-AT ?auto_910786 ?auto_910794 ) ( CLEAR ?auto_910786 ) ( IS-CRATE ?auto_910787 ) ( AVAILABLE ?auto_910792 ) ( IN ?auto_910787 ?auto_910791 ) ( TRUCK-AT ?auto_910791 ?auto_910789 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910787 ?auto_910788 )
      ( MAKE-2CRATE-VERIFY ?auto_910786 ?auto_910787 ?auto_910788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910795 - SURFACE
      ?auto_910796 - SURFACE
    )
    :vars
    (
      ?auto_910798 - HOIST
      ?auto_910801 - PLACE
      ?auto_910799 - SURFACE
      ?auto_910803 - PLACE
      ?auto_910800 - HOIST
      ?auto_910797 - SURFACE
      ?auto_910802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910798 ?auto_910801 ) ( IS-CRATE ?auto_910796 ) ( not ( = ?auto_910795 ?auto_910796 ) ) ( not ( = ?auto_910799 ?auto_910795 ) ) ( not ( = ?auto_910799 ?auto_910796 ) ) ( not ( = ?auto_910803 ?auto_910801 ) ) ( HOIST-AT ?auto_910800 ?auto_910803 ) ( not ( = ?auto_910798 ?auto_910800 ) ) ( SURFACE-AT ?auto_910796 ?auto_910803 ) ( ON ?auto_910796 ?auto_910797 ) ( CLEAR ?auto_910796 ) ( not ( = ?auto_910795 ?auto_910797 ) ) ( not ( = ?auto_910796 ?auto_910797 ) ) ( not ( = ?auto_910799 ?auto_910797 ) ) ( SURFACE-AT ?auto_910799 ?auto_910801 ) ( CLEAR ?auto_910799 ) ( IS-CRATE ?auto_910795 ) ( AVAILABLE ?auto_910798 ) ( TRUCK-AT ?auto_910802 ?auto_910803 ) ( LIFTING ?auto_910800 ?auto_910795 ) )
    :subtasks
    ( ( !LOAD ?auto_910800 ?auto_910795 ?auto_910802 ?auto_910803 )
      ( MAKE-2CRATE ?auto_910799 ?auto_910795 ?auto_910796 )
      ( MAKE-1CRATE-VERIFY ?auto_910795 ?auto_910796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910804 - SURFACE
      ?auto_910805 - SURFACE
      ?auto_910806 - SURFACE
    )
    :vars
    (
      ?auto_910811 - HOIST
      ?auto_910810 - PLACE
      ?auto_910807 - PLACE
      ?auto_910808 - HOIST
      ?auto_910809 - SURFACE
      ?auto_910812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910811 ?auto_910810 ) ( IS-CRATE ?auto_910806 ) ( not ( = ?auto_910805 ?auto_910806 ) ) ( not ( = ?auto_910804 ?auto_910805 ) ) ( not ( = ?auto_910804 ?auto_910806 ) ) ( not ( = ?auto_910807 ?auto_910810 ) ) ( HOIST-AT ?auto_910808 ?auto_910807 ) ( not ( = ?auto_910811 ?auto_910808 ) ) ( SURFACE-AT ?auto_910806 ?auto_910807 ) ( ON ?auto_910806 ?auto_910809 ) ( CLEAR ?auto_910806 ) ( not ( = ?auto_910805 ?auto_910809 ) ) ( not ( = ?auto_910806 ?auto_910809 ) ) ( not ( = ?auto_910804 ?auto_910809 ) ) ( SURFACE-AT ?auto_910804 ?auto_910810 ) ( CLEAR ?auto_910804 ) ( IS-CRATE ?auto_910805 ) ( AVAILABLE ?auto_910811 ) ( TRUCK-AT ?auto_910812 ?auto_910807 ) ( LIFTING ?auto_910808 ?auto_910805 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910805 ?auto_910806 )
      ( MAKE-2CRATE-VERIFY ?auto_910804 ?auto_910805 ?auto_910806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910813 - SURFACE
      ?auto_910814 - SURFACE
    )
    :vars
    (
      ?auto_910816 - HOIST
      ?auto_910820 - PLACE
      ?auto_910815 - SURFACE
      ?auto_910818 - PLACE
      ?auto_910817 - HOIST
      ?auto_910821 - SURFACE
      ?auto_910819 - TRUCK
      ?auto_910822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910816 ?auto_910820 ) ( IS-CRATE ?auto_910814 ) ( not ( = ?auto_910813 ?auto_910814 ) ) ( not ( = ?auto_910815 ?auto_910813 ) ) ( not ( = ?auto_910815 ?auto_910814 ) ) ( not ( = ?auto_910818 ?auto_910820 ) ) ( HOIST-AT ?auto_910817 ?auto_910818 ) ( not ( = ?auto_910816 ?auto_910817 ) ) ( SURFACE-AT ?auto_910814 ?auto_910818 ) ( ON ?auto_910814 ?auto_910821 ) ( CLEAR ?auto_910814 ) ( not ( = ?auto_910813 ?auto_910821 ) ) ( not ( = ?auto_910814 ?auto_910821 ) ) ( not ( = ?auto_910815 ?auto_910821 ) ) ( SURFACE-AT ?auto_910815 ?auto_910820 ) ( CLEAR ?auto_910815 ) ( IS-CRATE ?auto_910813 ) ( AVAILABLE ?auto_910816 ) ( TRUCK-AT ?auto_910819 ?auto_910818 ) ( AVAILABLE ?auto_910817 ) ( SURFACE-AT ?auto_910813 ?auto_910818 ) ( ON ?auto_910813 ?auto_910822 ) ( CLEAR ?auto_910813 ) ( not ( = ?auto_910813 ?auto_910822 ) ) ( not ( = ?auto_910814 ?auto_910822 ) ) ( not ( = ?auto_910815 ?auto_910822 ) ) ( not ( = ?auto_910821 ?auto_910822 ) ) )
    :subtasks
    ( ( !LIFT ?auto_910817 ?auto_910813 ?auto_910822 ?auto_910818 )
      ( MAKE-2CRATE ?auto_910815 ?auto_910813 ?auto_910814 )
      ( MAKE-1CRATE-VERIFY ?auto_910813 ?auto_910814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910823 - SURFACE
      ?auto_910824 - SURFACE
      ?auto_910825 - SURFACE
    )
    :vars
    (
      ?auto_910832 - HOIST
      ?auto_910826 - PLACE
      ?auto_910828 - PLACE
      ?auto_910829 - HOIST
      ?auto_910831 - SURFACE
      ?auto_910827 - TRUCK
      ?auto_910830 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910832 ?auto_910826 ) ( IS-CRATE ?auto_910825 ) ( not ( = ?auto_910824 ?auto_910825 ) ) ( not ( = ?auto_910823 ?auto_910824 ) ) ( not ( = ?auto_910823 ?auto_910825 ) ) ( not ( = ?auto_910828 ?auto_910826 ) ) ( HOIST-AT ?auto_910829 ?auto_910828 ) ( not ( = ?auto_910832 ?auto_910829 ) ) ( SURFACE-AT ?auto_910825 ?auto_910828 ) ( ON ?auto_910825 ?auto_910831 ) ( CLEAR ?auto_910825 ) ( not ( = ?auto_910824 ?auto_910831 ) ) ( not ( = ?auto_910825 ?auto_910831 ) ) ( not ( = ?auto_910823 ?auto_910831 ) ) ( SURFACE-AT ?auto_910823 ?auto_910826 ) ( CLEAR ?auto_910823 ) ( IS-CRATE ?auto_910824 ) ( AVAILABLE ?auto_910832 ) ( TRUCK-AT ?auto_910827 ?auto_910828 ) ( AVAILABLE ?auto_910829 ) ( SURFACE-AT ?auto_910824 ?auto_910828 ) ( ON ?auto_910824 ?auto_910830 ) ( CLEAR ?auto_910824 ) ( not ( = ?auto_910824 ?auto_910830 ) ) ( not ( = ?auto_910825 ?auto_910830 ) ) ( not ( = ?auto_910823 ?auto_910830 ) ) ( not ( = ?auto_910831 ?auto_910830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910824 ?auto_910825 )
      ( MAKE-2CRATE-VERIFY ?auto_910823 ?auto_910824 ?auto_910825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910833 - SURFACE
      ?auto_910834 - SURFACE
    )
    :vars
    (
      ?auto_910835 - HOIST
      ?auto_910840 - PLACE
      ?auto_910839 - SURFACE
      ?auto_910836 - PLACE
      ?auto_910841 - HOIST
      ?auto_910838 - SURFACE
      ?auto_910842 - SURFACE
      ?auto_910837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910835 ?auto_910840 ) ( IS-CRATE ?auto_910834 ) ( not ( = ?auto_910833 ?auto_910834 ) ) ( not ( = ?auto_910839 ?auto_910833 ) ) ( not ( = ?auto_910839 ?auto_910834 ) ) ( not ( = ?auto_910836 ?auto_910840 ) ) ( HOIST-AT ?auto_910841 ?auto_910836 ) ( not ( = ?auto_910835 ?auto_910841 ) ) ( SURFACE-AT ?auto_910834 ?auto_910836 ) ( ON ?auto_910834 ?auto_910838 ) ( CLEAR ?auto_910834 ) ( not ( = ?auto_910833 ?auto_910838 ) ) ( not ( = ?auto_910834 ?auto_910838 ) ) ( not ( = ?auto_910839 ?auto_910838 ) ) ( SURFACE-AT ?auto_910839 ?auto_910840 ) ( CLEAR ?auto_910839 ) ( IS-CRATE ?auto_910833 ) ( AVAILABLE ?auto_910835 ) ( AVAILABLE ?auto_910841 ) ( SURFACE-AT ?auto_910833 ?auto_910836 ) ( ON ?auto_910833 ?auto_910842 ) ( CLEAR ?auto_910833 ) ( not ( = ?auto_910833 ?auto_910842 ) ) ( not ( = ?auto_910834 ?auto_910842 ) ) ( not ( = ?auto_910839 ?auto_910842 ) ) ( not ( = ?auto_910838 ?auto_910842 ) ) ( TRUCK-AT ?auto_910837 ?auto_910840 ) )
    :subtasks
    ( ( !DRIVE ?auto_910837 ?auto_910840 ?auto_910836 )
      ( MAKE-2CRATE ?auto_910839 ?auto_910833 ?auto_910834 )
      ( MAKE-1CRATE-VERIFY ?auto_910833 ?auto_910834 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_910843 - SURFACE
      ?auto_910844 - SURFACE
      ?auto_910845 - SURFACE
    )
    :vars
    (
      ?auto_910850 - HOIST
      ?auto_910847 - PLACE
      ?auto_910851 - PLACE
      ?auto_910848 - HOIST
      ?auto_910846 - SURFACE
      ?auto_910849 - SURFACE
      ?auto_910852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910850 ?auto_910847 ) ( IS-CRATE ?auto_910845 ) ( not ( = ?auto_910844 ?auto_910845 ) ) ( not ( = ?auto_910843 ?auto_910844 ) ) ( not ( = ?auto_910843 ?auto_910845 ) ) ( not ( = ?auto_910851 ?auto_910847 ) ) ( HOIST-AT ?auto_910848 ?auto_910851 ) ( not ( = ?auto_910850 ?auto_910848 ) ) ( SURFACE-AT ?auto_910845 ?auto_910851 ) ( ON ?auto_910845 ?auto_910846 ) ( CLEAR ?auto_910845 ) ( not ( = ?auto_910844 ?auto_910846 ) ) ( not ( = ?auto_910845 ?auto_910846 ) ) ( not ( = ?auto_910843 ?auto_910846 ) ) ( SURFACE-AT ?auto_910843 ?auto_910847 ) ( CLEAR ?auto_910843 ) ( IS-CRATE ?auto_910844 ) ( AVAILABLE ?auto_910850 ) ( AVAILABLE ?auto_910848 ) ( SURFACE-AT ?auto_910844 ?auto_910851 ) ( ON ?auto_910844 ?auto_910849 ) ( CLEAR ?auto_910844 ) ( not ( = ?auto_910844 ?auto_910849 ) ) ( not ( = ?auto_910845 ?auto_910849 ) ) ( not ( = ?auto_910843 ?auto_910849 ) ) ( not ( = ?auto_910846 ?auto_910849 ) ) ( TRUCK-AT ?auto_910852 ?auto_910847 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910844 ?auto_910845 )
      ( MAKE-2CRATE-VERIFY ?auto_910843 ?auto_910844 ?auto_910845 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910871 - SURFACE
      ?auto_910872 - SURFACE
      ?auto_910873 - SURFACE
      ?auto_910874 - SURFACE
    )
    :vars
    (
      ?auto_910875 - HOIST
      ?auto_910876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910875 ?auto_910876 ) ( SURFACE-AT ?auto_910873 ?auto_910876 ) ( CLEAR ?auto_910873 ) ( LIFTING ?auto_910875 ?auto_910874 ) ( IS-CRATE ?auto_910874 ) ( not ( = ?auto_910873 ?auto_910874 ) ) ( ON ?auto_910872 ?auto_910871 ) ( ON ?auto_910873 ?auto_910872 ) ( not ( = ?auto_910871 ?auto_910872 ) ) ( not ( = ?auto_910871 ?auto_910873 ) ) ( not ( = ?auto_910871 ?auto_910874 ) ) ( not ( = ?auto_910872 ?auto_910873 ) ) ( not ( = ?auto_910872 ?auto_910874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_910873 ?auto_910874 )
      ( MAKE-3CRATE-VERIFY ?auto_910871 ?auto_910872 ?auto_910873 ?auto_910874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910888 - SURFACE
      ?auto_910889 - SURFACE
      ?auto_910890 - SURFACE
      ?auto_910891 - SURFACE
    )
    :vars
    (
      ?auto_910893 - HOIST
      ?auto_910892 - PLACE
      ?auto_910894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910893 ?auto_910892 ) ( SURFACE-AT ?auto_910890 ?auto_910892 ) ( CLEAR ?auto_910890 ) ( IS-CRATE ?auto_910891 ) ( not ( = ?auto_910890 ?auto_910891 ) ) ( TRUCK-AT ?auto_910894 ?auto_910892 ) ( AVAILABLE ?auto_910893 ) ( IN ?auto_910891 ?auto_910894 ) ( ON ?auto_910890 ?auto_910889 ) ( not ( = ?auto_910889 ?auto_910890 ) ) ( not ( = ?auto_910889 ?auto_910891 ) ) ( ON ?auto_910889 ?auto_910888 ) ( not ( = ?auto_910888 ?auto_910889 ) ) ( not ( = ?auto_910888 ?auto_910890 ) ) ( not ( = ?auto_910888 ?auto_910891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_910889 ?auto_910890 ?auto_910891 )
      ( MAKE-3CRATE-VERIFY ?auto_910888 ?auto_910889 ?auto_910890 ?auto_910891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910909 - SURFACE
      ?auto_910910 - SURFACE
      ?auto_910911 - SURFACE
      ?auto_910912 - SURFACE
    )
    :vars
    (
      ?auto_910916 - HOIST
      ?auto_910913 - PLACE
      ?auto_910914 - TRUCK
      ?auto_910915 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910916 ?auto_910913 ) ( SURFACE-AT ?auto_910911 ?auto_910913 ) ( CLEAR ?auto_910911 ) ( IS-CRATE ?auto_910912 ) ( not ( = ?auto_910911 ?auto_910912 ) ) ( AVAILABLE ?auto_910916 ) ( IN ?auto_910912 ?auto_910914 ) ( ON ?auto_910911 ?auto_910910 ) ( not ( = ?auto_910910 ?auto_910911 ) ) ( not ( = ?auto_910910 ?auto_910912 ) ) ( TRUCK-AT ?auto_910914 ?auto_910915 ) ( not ( = ?auto_910915 ?auto_910913 ) ) ( ON ?auto_910910 ?auto_910909 ) ( not ( = ?auto_910909 ?auto_910910 ) ) ( not ( = ?auto_910909 ?auto_910911 ) ) ( not ( = ?auto_910909 ?auto_910912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_910910 ?auto_910911 ?auto_910912 )
      ( MAKE-3CRATE-VERIFY ?auto_910909 ?auto_910910 ?auto_910911 ?auto_910912 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910933 - SURFACE
      ?auto_910934 - SURFACE
      ?auto_910935 - SURFACE
      ?auto_910936 - SURFACE
    )
    :vars
    (
      ?auto_910940 - HOIST
      ?auto_910941 - PLACE
      ?auto_910937 - TRUCK
      ?auto_910939 - PLACE
      ?auto_910938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_910940 ?auto_910941 ) ( SURFACE-AT ?auto_910935 ?auto_910941 ) ( CLEAR ?auto_910935 ) ( IS-CRATE ?auto_910936 ) ( not ( = ?auto_910935 ?auto_910936 ) ) ( AVAILABLE ?auto_910940 ) ( ON ?auto_910935 ?auto_910934 ) ( not ( = ?auto_910934 ?auto_910935 ) ) ( not ( = ?auto_910934 ?auto_910936 ) ) ( TRUCK-AT ?auto_910937 ?auto_910939 ) ( not ( = ?auto_910939 ?auto_910941 ) ) ( HOIST-AT ?auto_910938 ?auto_910939 ) ( LIFTING ?auto_910938 ?auto_910936 ) ( not ( = ?auto_910940 ?auto_910938 ) ) ( ON ?auto_910934 ?auto_910933 ) ( not ( = ?auto_910933 ?auto_910934 ) ) ( not ( = ?auto_910933 ?auto_910935 ) ) ( not ( = ?auto_910933 ?auto_910936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_910934 ?auto_910935 ?auto_910936 )
      ( MAKE-3CRATE-VERIFY ?auto_910933 ?auto_910934 ?auto_910935 ?auto_910936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910960 - SURFACE
      ?auto_910961 - SURFACE
      ?auto_910962 - SURFACE
      ?auto_910963 - SURFACE
    )
    :vars
    (
      ?auto_910966 - HOIST
      ?auto_910969 - PLACE
      ?auto_910968 - TRUCK
      ?auto_910967 - PLACE
      ?auto_910965 - HOIST
      ?auto_910964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910966 ?auto_910969 ) ( SURFACE-AT ?auto_910962 ?auto_910969 ) ( CLEAR ?auto_910962 ) ( IS-CRATE ?auto_910963 ) ( not ( = ?auto_910962 ?auto_910963 ) ) ( AVAILABLE ?auto_910966 ) ( ON ?auto_910962 ?auto_910961 ) ( not ( = ?auto_910961 ?auto_910962 ) ) ( not ( = ?auto_910961 ?auto_910963 ) ) ( TRUCK-AT ?auto_910968 ?auto_910967 ) ( not ( = ?auto_910967 ?auto_910969 ) ) ( HOIST-AT ?auto_910965 ?auto_910967 ) ( not ( = ?auto_910966 ?auto_910965 ) ) ( AVAILABLE ?auto_910965 ) ( SURFACE-AT ?auto_910963 ?auto_910967 ) ( ON ?auto_910963 ?auto_910964 ) ( CLEAR ?auto_910963 ) ( not ( = ?auto_910962 ?auto_910964 ) ) ( not ( = ?auto_910963 ?auto_910964 ) ) ( not ( = ?auto_910961 ?auto_910964 ) ) ( ON ?auto_910961 ?auto_910960 ) ( not ( = ?auto_910960 ?auto_910961 ) ) ( not ( = ?auto_910960 ?auto_910962 ) ) ( not ( = ?auto_910960 ?auto_910963 ) ) ( not ( = ?auto_910960 ?auto_910964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_910961 ?auto_910962 ?auto_910963 )
      ( MAKE-3CRATE-VERIFY ?auto_910960 ?auto_910961 ?auto_910962 ?auto_910963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_910988 - SURFACE
      ?auto_910989 - SURFACE
      ?auto_910990 - SURFACE
      ?auto_910991 - SURFACE
    )
    :vars
    (
      ?auto_910997 - HOIST
      ?auto_910996 - PLACE
      ?auto_910992 - PLACE
      ?auto_910995 - HOIST
      ?auto_910993 - SURFACE
      ?auto_910994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_910997 ?auto_910996 ) ( SURFACE-AT ?auto_910990 ?auto_910996 ) ( CLEAR ?auto_910990 ) ( IS-CRATE ?auto_910991 ) ( not ( = ?auto_910990 ?auto_910991 ) ) ( AVAILABLE ?auto_910997 ) ( ON ?auto_910990 ?auto_910989 ) ( not ( = ?auto_910989 ?auto_910990 ) ) ( not ( = ?auto_910989 ?auto_910991 ) ) ( not ( = ?auto_910992 ?auto_910996 ) ) ( HOIST-AT ?auto_910995 ?auto_910992 ) ( not ( = ?auto_910997 ?auto_910995 ) ) ( AVAILABLE ?auto_910995 ) ( SURFACE-AT ?auto_910991 ?auto_910992 ) ( ON ?auto_910991 ?auto_910993 ) ( CLEAR ?auto_910991 ) ( not ( = ?auto_910990 ?auto_910993 ) ) ( not ( = ?auto_910991 ?auto_910993 ) ) ( not ( = ?auto_910989 ?auto_910993 ) ) ( TRUCK-AT ?auto_910994 ?auto_910996 ) ( ON ?auto_910989 ?auto_910988 ) ( not ( = ?auto_910988 ?auto_910989 ) ) ( not ( = ?auto_910988 ?auto_910990 ) ) ( not ( = ?auto_910988 ?auto_910991 ) ) ( not ( = ?auto_910988 ?auto_910993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_910989 ?auto_910990 ?auto_910991 )
      ( MAKE-3CRATE-VERIFY ?auto_910988 ?auto_910989 ?auto_910990 ?auto_910991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911016 - SURFACE
      ?auto_911017 - SURFACE
      ?auto_911018 - SURFACE
      ?auto_911019 - SURFACE
    )
    :vars
    (
      ?auto_911020 - HOIST
      ?auto_911023 - PLACE
      ?auto_911022 - PLACE
      ?auto_911025 - HOIST
      ?auto_911024 - SURFACE
      ?auto_911021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911020 ?auto_911023 ) ( IS-CRATE ?auto_911019 ) ( not ( = ?auto_911018 ?auto_911019 ) ) ( not ( = ?auto_911017 ?auto_911018 ) ) ( not ( = ?auto_911017 ?auto_911019 ) ) ( not ( = ?auto_911022 ?auto_911023 ) ) ( HOIST-AT ?auto_911025 ?auto_911022 ) ( not ( = ?auto_911020 ?auto_911025 ) ) ( AVAILABLE ?auto_911025 ) ( SURFACE-AT ?auto_911019 ?auto_911022 ) ( ON ?auto_911019 ?auto_911024 ) ( CLEAR ?auto_911019 ) ( not ( = ?auto_911018 ?auto_911024 ) ) ( not ( = ?auto_911019 ?auto_911024 ) ) ( not ( = ?auto_911017 ?auto_911024 ) ) ( TRUCK-AT ?auto_911021 ?auto_911023 ) ( SURFACE-AT ?auto_911017 ?auto_911023 ) ( CLEAR ?auto_911017 ) ( LIFTING ?auto_911020 ?auto_911018 ) ( IS-CRATE ?auto_911018 ) ( ON ?auto_911017 ?auto_911016 ) ( not ( = ?auto_911016 ?auto_911017 ) ) ( not ( = ?auto_911016 ?auto_911018 ) ) ( not ( = ?auto_911016 ?auto_911019 ) ) ( not ( = ?auto_911016 ?auto_911024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911017 ?auto_911018 ?auto_911019 )
      ( MAKE-3CRATE-VERIFY ?auto_911016 ?auto_911017 ?auto_911018 ?auto_911019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911044 - SURFACE
      ?auto_911045 - SURFACE
      ?auto_911046 - SURFACE
      ?auto_911047 - SURFACE
    )
    :vars
    (
      ?auto_911051 - HOIST
      ?auto_911050 - PLACE
      ?auto_911053 - PLACE
      ?auto_911049 - HOIST
      ?auto_911048 - SURFACE
      ?auto_911052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911051 ?auto_911050 ) ( IS-CRATE ?auto_911047 ) ( not ( = ?auto_911046 ?auto_911047 ) ) ( not ( = ?auto_911045 ?auto_911046 ) ) ( not ( = ?auto_911045 ?auto_911047 ) ) ( not ( = ?auto_911053 ?auto_911050 ) ) ( HOIST-AT ?auto_911049 ?auto_911053 ) ( not ( = ?auto_911051 ?auto_911049 ) ) ( AVAILABLE ?auto_911049 ) ( SURFACE-AT ?auto_911047 ?auto_911053 ) ( ON ?auto_911047 ?auto_911048 ) ( CLEAR ?auto_911047 ) ( not ( = ?auto_911046 ?auto_911048 ) ) ( not ( = ?auto_911047 ?auto_911048 ) ) ( not ( = ?auto_911045 ?auto_911048 ) ) ( TRUCK-AT ?auto_911052 ?auto_911050 ) ( SURFACE-AT ?auto_911045 ?auto_911050 ) ( CLEAR ?auto_911045 ) ( IS-CRATE ?auto_911046 ) ( AVAILABLE ?auto_911051 ) ( IN ?auto_911046 ?auto_911052 ) ( ON ?auto_911045 ?auto_911044 ) ( not ( = ?auto_911044 ?auto_911045 ) ) ( not ( = ?auto_911044 ?auto_911046 ) ) ( not ( = ?auto_911044 ?auto_911047 ) ) ( not ( = ?auto_911044 ?auto_911048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911045 ?auto_911046 ?auto_911047 )
      ( MAKE-3CRATE-VERIFY ?auto_911044 ?auto_911045 ?auto_911046 ?auto_911047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911123 - SURFACE
      ?auto_911124 - SURFACE
    )
    :vars
    (
      ?auto_911126 - HOIST
      ?auto_911125 - PLACE
      ?auto_911127 - SURFACE
      ?auto_911131 - PLACE
      ?auto_911130 - HOIST
      ?auto_911129 - SURFACE
      ?auto_911128 - TRUCK
      ?auto_911132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911126 ?auto_911125 ) ( SURFACE-AT ?auto_911123 ?auto_911125 ) ( CLEAR ?auto_911123 ) ( IS-CRATE ?auto_911124 ) ( not ( = ?auto_911123 ?auto_911124 ) ) ( AVAILABLE ?auto_911126 ) ( ON ?auto_911123 ?auto_911127 ) ( not ( = ?auto_911127 ?auto_911123 ) ) ( not ( = ?auto_911127 ?auto_911124 ) ) ( not ( = ?auto_911131 ?auto_911125 ) ) ( HOIST-AT ?auto_911130 ?auto_911131 ) ( not ( = ?auto_911126 ?auto_911130 ) ) ( AVAILABLE ?auto_911130 ) ( SURFACE-AT ?auto_911124 ?auto_911131 ) ( ON ?auto_911124 ?auto_911129 ) ( CLEAR ?auto_911124 ) ( not ( = ?auto_911123 ?auto_911129 ) ) ( not ( = ?auto_911124 ?auto_911129 ) ) ( not ( = ?auto_911127 ?auto_911129 ) ) ( TRUCK-AT ?auto_911128 ?auto_911132 ) ( not ( = ?auto_911132 ?auto_911125 ) ) ( not ( = ?auto_911131 ?auto_911132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911128 ?auto_911132 ?auto_911125 )
      ( MAKE-1CRATE ?auto_911123 ?auto_911124 )
      ( MAKE-1CRATE-VERIFY ?auto_911123 ?auto_911124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911229 - SURFACE
      ?auto_911230 - SURFACE
    )
    :vars
    (
      ?auto_911234 - HOIST
      ?auto_911231 - PLACE
      ?auto_911232 - SURFACE
      ?auto_911237 - PLACE
      ?auto_911236 - HOIST
      ?auto_911235 - SURFACE
      ?auto_911233 - TRUCK
      ?auto_911238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911234 ?auto_911231 ) ( SURFACE-AT ?auto_911229 ?auto_911231 ) ( CLEAR ?auto_911229 ) ( IS-CRATE ?auto_911230 ) ( not ( = ?auto_911229 ?auto_911230 ) ) ( ON ?auto_911229 ?auto_911232 ) ( not ( = ?auto_911232 ?auto_911229 ) ) ( not ( = ?auto_911232 ?auto_911230 ) ) ( not ( = ?auto_911237 ?auto_911231 ) ) ( HOIST-AT ?auto_911236 ?auto_911237 ) ( not ( = ?auto_911234 ?auto_911236 ) ) ( AVAILABLE ?auto_911236 ) ( SURFACE-AT ?auto_911230 ?auto_911237 ) ( ON ?auto_911230 ?auto_911235 ) ( CLEAR ?auto_911230 ) ( not ( = ?auto_911229 ?auto_911235 ) ) ( not ( = ?auto_911230 ?auto_911235 ) ) ( not ( = ?auto_911232 ?auto_911235 ) ) ( TRUCK-AT ?auto_911233 ?auto_911231 ) ( LIFTING ?auto_911234 ?auto_911238 ) ( IS-CRATE ?auto_911238 ) ( not ( = ?auto_911229 ?auto_911238 ) ) ( not ( = ?auto_911230 ?auto_911238 ) ) ( not ( = ?auto_911232 ?auto_911238 ) ) ( not ( = ?auto_911235 ?auto_911238 ) ) )
    :subtasks
    ( ( !LOAD ?auto_911234 ?auto_911238 ?auto_911233 ?auto_911231 )
      ( MAKE-1CRATE ?auto_911229 ?auto_911230 )
      ( MAKE-1CRATE-VERIFY ?auto_911229 ?auto_911230 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911337 - SURFACE
      ?auto_911338 - SURFACE
      ?auto_911339 - SURFACE
      ?auto_911341 - SURFACE
      ?auto_911340 - SURFACE
    )
    :vars
    (
      ?auto_911343 - HOIST
      ?auto_911342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911343 ?auto_911342 ) ( SURFACE-AT ?auto_911341 ?auto_911342 ) ( CLEAR ?auto_911341 ) ( LIFTING ?auto_911343 ?auto_911340 ) ( IS-CRATE ?auto_911340 ) ( not ( = ?auto_911341 ?auto_911340 ) ) ( ON ?auto_911338 ?auto_911337 ) ( ON ?auto_911339 ?auto_911338 ) ( ON ?auto_911341 ?auto_911339 ) ( not ( = ?auto_911337 ?auto_911338 ) ) ( not ( = ?auto_911337 ?auto_911339 ) ) ( not ( = ?auto_911337 ?auto_911341 ) ) ( not ( = ?auto_911337 ?auto_911340 ) ) ( not ( = ?auto_911338 ?auto_911339 ) ) ( not ( = ?auto_911338 ?auto_911341 ) ) ( not ( = ?auto_911338 ?auto_911340 ) ) ( not ( = ?auto_911339 ?auto_911341 ) ) ( not ( = ?auto_911339 ?auto_911340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911341 ?auto_911340 )
      ( MAKE-4CRATE-VERIFY ?auto_911337 ?auto_911338 ?auto_911339 ?auto_911341 ?auto_911340 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911362 - SURFACE
      ?auto_911363 - SURFACE
      ?auto_911364 - SURFACE
      ?auto_911366 - SURFACE
      ?auto_911365 - SURFACE
    )
    :vars
    (
      ?auto_911367 - HOIST
      ?auto_911369 - PLACE
      ?auto_911368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911367 ?auto_911369 ) ( SURFACE-AT ?auto_911366 ?auto_911369 ) ( CLEAR ?auto_911366 ) ( IS-CRATE ?auto_911365 ) ( not ( = ?auto_911366 ?auto_911365 ) ) ( TRUCK-AT ?auto_911368 ?auto_911369 ) ( AVAILABLE ?auto_911367 ) ( IN ?auto_911365 ?auto_911368 ) ( ON ?auto_911366 ?auto_911364 ) ( not ( = ?auto_911364 ?auto_911366 ) ) ( not ( = ?auto_911364 ?auto_911365 ) ) ( ON ?auto_911363 ?auto_911362 ) ( ON ?auto_911364 ?auto_911363 ) ( not ( = ?auto_911362 ?auto_911363 ) ) ( not ( = ?auto_911362 ?auto_911364 ) ) ( not ( = ?auto_911362 ?auto_911366 ) ) ( not ( = ?auto_911362 ?auto_911365 ) ) ( not ( = ?auto_911363 ?auto_911364 ) ) ( not ( = ?auto_911363 ?auto_911366 ) ) ( not ( = ?auto_911363 ?auto_911365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911364 ?auto_911366 ?auto_911365 )
      ( MAKE-4CRATE-VERIFY ?auto_911362 ?auto_911363 ?auto_911364 ?auto_911366 ?auto_911365 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911392 - SURFACE
      ?auto_911393 - SURFACE
      ?auto_911394 - SURFACE
      ?auto_911396 - SURFACE
      ?auto_911395 - SURFACE
    )
    :vars
    (
      ?auto_911398 - HOIST
      ?auto_911400 - PLACE
      ?auto_911397 - TRUCK
      ?auto_911399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911398 ?auto_911400 ) ( SURFACE-AT ?auto_911396 ?auto_911400 ) ( CLEAR ?auto_911396 ) ( IS-CRATE ?auto_911395 ) ( not ( = ?auto_911396 ?auto_911395 ) ) ( AVAILABLE ?auto_911398 ) ( IN ?auto_911395 ?auto_911397 ) ( ON ?auto_911396 ?auto_911394 ) ( not ( = ?auto_911394 ?auto_911396 ) ) ( not ( = ?auto_911394 ?auto_911395 ) ) ( TRUCK-AT ?auto_911397 ?auto_911399 ) ( not ( = ?auto_911399 ?auto_911400 ) ) ( ON ?auto_911393 ?auto_911392 ) ( ON ?auto_911394 ?auto_911393 ) ( not ( = ?auto_911392 ?auto_911393 ) ) ( not ( = ?auto_911392 ?auto_911394 ) ) ( not ( = ?auto_911392 ?auto_911396 ) ) ( not ( = ?auto_911392 ?auto_911395 ) ) ( not ( = ?auto_911393 ?auto_911394 ) ) ( not ( = ?auto_911393 ?auto_911396 ) ) ( not ( = ?auto_911393 ?auto_911395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911394 ?auto_911396 ?auto_911395 )
      ( MAKE-4CRATE-VERIFY ?auto_911392 ?auto_911393 ?auto_911394 ?auto_911396 ?auto_911395 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911426 - SURFACE
      ?auto_911427 - SURFACE
      ?auto_911428 - SURFACE
      ?auto_911430 - SURFACE
      ?auto_911429 - SURFACE
    )
    :vars
    (
      ?auto_911432 - HOIST
      ?auto_911431 - PLACE
      ?auto_911434 - TRUCK
      ?auto_911435 - PLACE
      ?auto_911433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911432 ?auto_911431 ) ( SURFACE-AT ?auto_911430 ?auto_911431 ) ( CLEAR ?auto_911430 ) ( IS-CRATE ?auto_911429 ) ( not ( = ?auto_911430 ?auto_911429 ) ) ( AVAILABLE ?auto_911432 ) ( ON ?auto_911430 ?auto_911428 ) ( not ( = ?auto_911428 ?auto_911430 ) ) ( not ( = ?auto_911428 ?auto_911429 ) ) ( TRUCK-AT ?auto_911434 ?auto_911435 ) ( not ( = ?auto_911435 ?auto_911431 ) ) ( HOIST-AT ?auto_911433 ?auto_911435 ) ( LIFTING ?auto_911433 ?auto_911429 ) ( not ( = ?auto_911432 ?auto_911433 ) ) ( ON ?auto_911427 ?auto_911426 ) ( ON ?auto_911428 ?auto_911427 ) ( not ( = ?auto_911426 ?auto_911427 ) ) ( not ( = ?auto_911426 ?auto_911428 ) ) ( not ( = ?auto_911426 ?auto_911430 ) ) ( not ( = ?auto_911426 ?auto_911429 ) ) ( not ( = ?auto_911427 ?auto_911428 ) ) ( not ( = ?auto_911427 ?auto_911430 ) ) ( not ( = ?auto_911427 ?auto_911429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911428 ?auto_911430 ?auto_911429 )
      ( MAKE-4CRATE-VERIFY ?auto_911426 ?auto_911427 ?auto_911428 ?auto_911430 ?auto_911429 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911464 - SURFACE
      ?auto_911465 - SURFACE
      ?auto_911466 - SURFACE
      ?auto_911468 - SURFACE
      ?auto_911467 - SURFACE
    )
    :vars
    (
      ?auto_911469 - HOIST
      ?auto_911474 - PLACE
      ?auto_911470 - TRUCK
      ?auto_911472 - PLACE
      ?auto_911473 - HOIST
      ?auto_911471 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911469 ?auto_911474 ) ( SURFACE-AT ?auto_911468 ?auto_911474 ) ( CLEAR ?auto_911468 ) ( IS-CRATE ?auto_911467 ) ( not ( = ?auto_911468 ?auto_911467 ) ) ( AVAILABLE ?auto_911469 ) ( ON ?auto_911468 ?auto_911466 ) ( not ( = ?auto_911466 ?auto_911468 ) ) ( not ( = ?auto_911466 ?auto_911467 ) ) ( TRUCK-AT ?auto_911470 ?auto_911472 ) ( not ( = ?auto_911472 ?auto_911474 ) ) ( HOIST-AT ?auto_911473 ?auto_911472 ) ( not ( = ?auto_911469 ?auto_911473 ) ) ( AVAILABLE ?auto_911473 ) ( SURFACE-AT ?auto_911467 ?auto_911472 ) ( ON ?auto_911467 ?auto_911471 ) ( CLEAR ?auto_911467 ) ( not ( = ?auto_911468 ?auto_911471 ) ) ( not ( = ?auto_911467 ?auto_911471 ) ) ( not ( = ?auto_911466 ?auto_911471 ) ) ( ON ?auto_911465 ?auto_911464 ) ( ON ?auto_911466 ?auto_911465 ) ( not ( = ?auto_911464 ?auto_911465 ) ) ( not ( = ?auto_911464 ?auto_911466 ) ) ( not ( = ?auto_911464 ?auto_911468 ) ) ( not ( = ?auto_911464 ?auto_911467 ) ) ( not ( = ?auto_911464 ?auto_911471 ) ) ( not ( = ?auto_911465 ?auto_911466 ) ) ( not ( = ?auto_911465 ?auto_911468 ) ) ( not ( = ?auto_911465 ?auto_911467 ) ) ( not ( = ?auto_911465 ?auto_911471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911466 ?auto_911468 ?auto_911467 )
      ( MAKE-4CRATE-VERIFY ?auto_911464 ?auto_911465 ?auto_911466 ?auto_911468 ?auto_911467 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911503 - SURFACE
      ?auto_911504 - SURFACE
      ?auto_911505 - SURFACE
      ?auto_911507 - SURFACE
      ?auto_911506 - SURFACE
    )
    :vars
    (
      ?auto_911511 - HOIST
      ?auto_911508 - PLACE
      ?auto_911512 - PLACE
      ?auto_911510 - HOIST
      ?auto_911509 - SURFACE
      ?auto_911513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911511 ?auto_911508 ) ( SURFACE-AT ?auto_911507 ?auto_911508 ) ( CLEAR ?auto_911507 ) ( IS-CRATE ?auto_911506 ) ( not ( = ?auto_911507 ?auto_911506 ) ) ( AVAILABLE ?auto_911511 ) ( ON ?auto_911507 ?auto_911505 ) ( not ( = ?auto_911505 ?auto_911507 ) ) ( not ( = ?auto_911505 ?auto_911506 ) ) ( not ( = ?auto_911512 ?auto_911508 ) ) ( HOIST-AT ?auto_911510 ?auto_911512 ) ( not ( = ?auto_911511 ?auto_911510 ) ) ( AVAILABLE ?auto_911510 ) ( SURFACE-AT ?auto_911506 ?auto_911512 ) ( ON ?auto_911506 ?auto_911509 ) ( CLEAR ?auto_911506 ) ( not ( = ?auto_911507 ?auto_911509 ) ) ( not ( = ?auto_911506 ?auto_911509 ) ) ( not ( = ?auto_911505 ?auto_911509 ) ) ( TRUCK-AT ?auto_911513 ?auto_911508 ) ( ON ?auto_911504 ?auto_911503 ) ( ON ?auto_911505 ?auto_911504 ) ( not ( = ?auto_911503 ?auto_911504 ) ) ( not ( = ?auto_911503 ?auto_911505 ) ) ( not ( = ?auto_911503 ?auto_911507 ) ) ( not ( = ?auto_911503 ?auto_911506 ) ) ( not ( = ?auto_911503 ?auto_911509 ) ) ( not ( = ?auto_911504 ?auto_911505 ) ) ( not ( = ?auto_911504 ?auto_911507 ) ) ( not ( = ?auto_911504 ?auto_911506 ) ) ( not ( = ?auto_911504 ?auto_911509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911505 ?auto_911507 ?auto_911506 )
      ( MAKE-4CRATE-VERIFY ?auto_911503 ?auto_911504 ?auto_911505 ?auto_911507 ?auto_911506 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911542 - SURFACE
      ?auto_911543 - SURFACE
      ?auto_911544 - SURFACE
      ?auto_911546 - SURFACE
      ?auto_911545 - SURFACE
    )
    :vars
    (
      ?auto_911549 - HOIST
      ?auto_911551 - PLACE
      ?auto_911548 - PLACE
      ?auto_911550 - HOIST
      ?auto_911547 - SURFACE
      ?auto_911552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911549 ?auto_911551 ) ( IS-CRATE ?auto_911545 ) ( not ( = ?auto_911546 ?auto_911545 ) ) ( not ( = ?auto_911544 ?auto_911546 ) ) ( not ( = ?auto_911544 ?auto_911545 ) ) ( not ( = ?auto_911548 ?auto_911551 ) ) ( HOIST-AT ?auto_911550 ?auto_911548 ) ( not ( = ?auto_911549 ?auto_911550 ) ) ( AVAILABLE ?auto_911550 ) ( SURFACE-AT ?auto_911545 ?auto_911548 ) ( ON ?auto_911545 ?auto_911547 ) ( CLEAR ?auto_911545 ) ( not ( = ?auto_911546 ?auto_911547 ) ) ( not ( = ?auto_911545 ?auto_911547 ) ) ( not ( = ?auto_911544 ?auto_911547 ) ) ( TRUCK-AT ?auto_911552 ?auto_911551 ) ( SURFACE-AT ?auto_911544 ?auto_911551 ) ( CLEAR ?auto_911544 ) ( LIFTING ?auto_911549 ?auto_911546 ) ( IS-CRATE ?auto_911546 ) ( ON ?auto_911543 ?auto_911542 ) ( ON ?auto_911544 ?auto_911543 ) ( not ( = ?auto_911542 ?auto_911543 ) ) ( not ( = ?auto_911542 ?auto_911544 ) ) ( not ( = ?auto_911542 ?auto_911546 ) ) ( not ( = ?auto_911542 ?auto_911545 ) ) ( not ( = ?auto_911542 ?auto_911547 ) ) ( not ( = ?auto_911543 ?auto_911544 ) ) ( not ( = ?auto_911543 ?auto_911546 ) ) ( not ( = ?auto_911543 ?auto_911545 ) ) ( not ( = ?auto_911543 ?auto_911547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911544 ?auto_911546 ?auto_911545 )
      ( MAKE-4CRATE-VERIFY ?auto_911542 ?auto_911543 ?auto_911544 ?auto_911546 ?auto_911545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_911581 - SURFACE
      ?auto_911582 - SURFACE
      ?auto_911583 - SURFACE
      ?auto_911585 - SURFACE
      ?auto_911584 - SURFACE
    )
    :vars
    (
      ?auto_911590 - HOIST
      ?auto_911591 - PLACE
      ?auto_911587 - PLACE
      ?auto_911588 - HOIST
      ?auto_911586 - SURFACE
      ?auto_911589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911590 ?auto_911591 ) ( IS-CRATE ?auto_911584 ) ( not ( = ?auto_911585 ?auto_911584 ) ) ( not ( = ?auto_911583 ?auto_911585 ) ) ( not ( = ?auto_911583 ?auto_911584 ) ) ( not ( = ?auto_911587 ?auto_911591 ) ) ( HOIST-AT ?auto_911588 ?auto_911587 ) ( not ( = ?auto_911590 ?auto_911588 ) ) ( AVAILABLE ?auto_911588 ) ( SURFACE-AT ?auto_911584 ?auto_911587 ) ( ON ?auto_911584 ?auto_911586 ) ( CLEAR ?auto_911584 ) ( not ( = ?auto_911585 ?auto_911586 ) ) ( not ( = ?auto_911584 ?auto_911586 ) ) ( not ( = ?auto_911583 ?auto_911586 ) ) ( TRUCK-AT ?auto_911589 ?auto_911591 ) ( SURFACE-AT ?auto_911583 ?auto_911591 ) ( CLEAR ?auto_911583 ) ( IS-CRATE ?auto_911585 ) ( AVAILABLE ?auto_911590 ) ( IN ?auto_911585 ?auto_911589 ) ( ON ?auto_911582 ?auto_911581 ) ( ON ?auto_911583 ?auto_911582 ) ( not ( = ?auto_911581 ?auto_911582 ) ) ( not ( = ?auto_911581 ?auto_911583 ) ) ( not ( = ?auto_911581 ?auto_911585 ) ) ( not ( = ?auto_911581 ?auto_911584 ) ) ( not ( = ?auto_911581 ?auto_911586 ) ) ( not ( = ?auto_911582 ?auto_911583 ) ) ( not ( = ?auto_911582 ?auto_911585 ) ) ( not ( = ?auto_911582 ?auto_911584 ) ) ( not ( = ?auto_911582 ?auto_911586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911583 ?auto_911585 ?auto_911584 )
      ( MAKE-4CRATE-VERIFY ?auto_911581 ?auto_911582 ?auto_911583 ?auto_911585 ?auto_911584 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912241 - SURFACE
      ?auto_912242 - SURFACE
      ?auto_912243 - SURFACE
      ?auto_912245 - SURFACE
      ?auto_912244 - SURFACE
      ?auto_912246 - SURFACE
    )
    :vars
    (
      ?auto_912247 - HOIST
      ?auto_912248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912247 ?auto_912248 ) ( SURFACE-AT ?auto_912244 ?auto_912248 ) ( CLEAR ?auto_912244 ) ( LIFTING ?auto_912247 ?auto_912246 ) ( IS-CRATE ?auto_912246 ) ( not ( = ?auto_912244 ?auto_912246 ) ) ( ON ?auto_912242 ?auto_912241 ) ( ON ?auto_912243 ?auto_912242 ) ( ON ?auto_912245 ?auto_912243 ) ( ON ?auto_912244 ?auto_912245 ) ( not ( = ?auto_912241 ?auto_912242 ) ) ( not ( = ?auto_912241 ?auto_912243 ) ) ( not ( = ?auto_912241 ?auto_912245 ) ) ( not ( = ?auto_912241 ?auto_912244 ) ) ( not ( = ?auto_912241 ?auto_912246 ) ) ( not ( = ?auto_912242 ?auto_912243 ) ) ( not ( = ?auto_912242 ?auto_912245 ) ) ( not ( = ?auto_912242 ?auto_912244 ) ) ( not ( = ?auto_912242 ?auto_912246 ) ) ( not ( = ?auto_912243 ?auto_912245 ) ) ( not ( = ?auto_912243 ?auto_912244 ) ) ( not ( = ?auto_912243 ?auto_912246 ) ) ( not ( = ?auto_912245 ?auto_912244 ) ) ( not ( = ?auto_912245 ?auto_912246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_912244 ?auto_912246 )
      ( MAKE-5CRATE-VERIFY ?auto_912241 ?auto_912242 ?auto_912243 ?auto_912245 ?auto_912244 ?auto_912246 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912275 - SURFACE
      ?auto_912276 - SURFACE
      ?auto_912277 - SURFACE
      ?auto_912279 - SURFACE
      ?auto_912278 - SURFACE
      ?auto_912280 - SURFACE
    )
    :vars
    (
      ?auto_912281 - HOIST
      ?auto_912283 - PLACE
      ?auto_912282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912281 ?auto_912283 ) ( SURFACE-AT ?auto_912278 ?auto_912283 ) ( CLEAR ?auto_912278 ) ( IS-CRATE ?auto_912280 ) ( not ( = ?auto_912278 ?auto_912280 ) ) ( TRUCK-AT ?auto_912282 ?auto_912283 ) ( AVAILABLE ?auto_912281 ) ( IN ?auto_912280 ?auto_912282 ) ( ON ?auto_912278 ?auto_912279 ) ( not ( = ?auto_912279 ?auto_912278 ) ) ( not ( = ?auto_912279 ?auto_912280 ) ) ( ON ?auto_912276 ?auto_912275 ) ( ON ?auto_912277 ?auto_912276 ) ( ON ?auto_912279 ?auto_912277 ) ( not ( = ?auto_912275 ?auto_912276 ) ) ( not ( = ?auto_912275 ?auto_912277 ) ) ( not ( = ?auto_912275 ?auto_912279 ) ) ( not ( = ?auto_912275 ?auto_912278 ) ) ( not ( = ?auto_912275 ?auto_912280 ) ) ( not ( = ?auto_912276 ?auto_912277 ) ) ( not ( = ?auto_912276 ?auto_912279 ) ) ( not ( = ?auto_912276 ?auto_912278 ) ) ( not ( = ?auto_912276 ?auto_912280 ) ) ( not ( = ?auto_912277 ?auto_912279 ) ) ( not ( = ?auto_912277 ?auto_912278 ) ) ( not ( = ?auto_912277 ?auto_912280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912279 ?auto_912278 ?auto_912280 )
      ( MAKE-5CRATE-VERIFY ?auto_912275 ?auto_912276 ?auto_912277 ?auto_912279 ?auto_912278 ?auto_912280 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912315 - SURFACE
      ?auto_912316 - SURFACE
      ?auto_912317 - SURFACE
      ?auto_912319 - SURFACE
      ?auto_912318 - SURFACE
      ?auto_912320 - SURFACE
    )
    :vars
    (
      ?auto_912323 - HOIST
      ?auto_912322 - PLACE
      ?auto_912324 - TRUCK
      ?auto_912321 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912323 ?auto_912322 ) ( SURFACE-AT ?auto_912318 ?auto_912322 ) ( CLEAR ?auto_912318 ) ( IS-CRATE ?auto_912320 ) ( not ( = ?auto_912318 ?auto_912320 ) ) ( AVAILABLE ?auto_912323 ) ( IN ?auto_912320 ?auto_912324 ) ( ON ?auto_912318 ?auto_912319 ) ( not ( = ?auto_912319 ?auto_912318 ) ) ( not ( = ?auto_912319 ?auto_912320 ) ) ( TRUCK-AT ?auto_912324 ?auto_912321 ) ( not ( = ?auto_912321 ?auto_912322 ) ) ( ON ?auto_912316 ?auto_912315 ) ( ON ?auto_912317 ?auto_912316 ) ( ON ?auto_912319 ?auto_912317 ) ( not ( = ?auto_912315 ?auto_912316 ) ) ( not ( = ?auto_912315 ?auto_912317 ) ) ( not ( = ?auto_912315 ?auto_912319 ) ) ( not ( = ?auto_912315 ?auto_912318 ) ) ( not ( = ?auto_912315 ?auto_912320 ) ) ( not ( = ?auto_912316 ?auto_912317 ) ) ( not ( = ?auto_912316 ?auto_912319 ) ) ( not ( = ?auto_912316 ?auto_912318 ) ) ( not ( = ?auto_912316 ?auto_912320 ) ) ( not ( = ?auto_912317 ?auto_912319 ) ) ( not ( = ?auto_912317 ?auto_912318 ) ) ( not ( = ?auto_912317 ?auto_912320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912319 ?auto_912318 ?auto_912320 )
      ( MAKE-5CRATE-VERIFY ?auto_912315 ?auto_912316 ?auto_912317 ?auto_912319 ?auto_912318 ?auto_912320 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912360 - SURFACE
      ?auto_912361 - SURFACE
      ?auto_912362 - SURFACE
      ?auto_912364 - SURFACE
      ?auto_912363 - SURFACE
      ?auto_912365 - SURFACE
    )
    :vars
    (
      ?auto_912367 - HOIST
      ?auto_912370 - PLACE
      ?auto_912369 - TRUCK
      ?auto_912366 - PLACE
      ?auto_912368 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_912367 ?auto_912370 ) ( SURFACE-AT ?auto_912363 ?auto_912370 ) ( CLEAR ?auto_912363 ) ( IS-CRATE ?auto_912365 ) ( not ( = ?auto_912363 ?auto_912365 ) ) ( AVAILABLE ?auto_912367 ) ( ON ?auto_912363 ?auto_912364 ) ( not ( = ?auto_912364 ?auto_912363 ) ) ( not ( = ?auto_912364 ?auto_912365 ) ) ( TRUCK-AT ?auto_912369 ?auto_912366 ) ( not ( = ?auto_912366 ?auto_912370 ) ) ( HOIST-AT ?auto_912368 ?auto_912366 ) ( LIFTING ?auto_912368 ?auto_912365 ) ( not ( = ?auto_912367 ?auto_912368 ) ) ( ON ?auto_912361 ?auto_912360 ) ( ON ?auto_912362 ?auto_912361 ) ( ON ?auto_912364 ?auto_912362 ) ( not ( = ?auto_912360 ?auto_912361 ) ) ( not ( = ?auto_912360 ?auto_912362 ) ) ( not ( = ?auto_912360 ?auto_912364 ) ) ( not ( = ?auto_912360 ?auto_912363 ) ) ( not ( = ?auto_912360 ?auto_912365 ) ) ( not ( = ?auto_912361 ?auto_912362 ) ) ( not ( = ?auto_912361 ?auto_912364 ) ) ( not ( = ?auto_912361 ?auto_912363 ) ) ( not ( = ?auto_912361 ?auto_912365 ) ) ( not ( = ?auto_912362 ?auto_912364 ) ) ( not ( = ?auto_912362 ?auto_912363 ) ) ( not ( = ?auto_912362 ?auto_912365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912364 ?auto_912363 ?auto_912365 )
      ( MAKE-5CRATE-VERIFY ?auto_912360 ?auto_912361 ?auto_912362 ?auto_912364 ?auto_912363 ?auto_912365 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912410 - SURFACE
      ?auto_912411 - SURFACE
      ?auto_912412 - SURFACE
      ?auto_912414 - SURFACE
      ?auto_912413 - SURFACE
      ?auto_912415 - SURFACE
    )
    :vars
    (
      ?auto_912416 - HOIST
      ?auto_912421 - PLACE
      ?auto_912417 - TRUCK
      ?auto_912420 - PLACE
      ?auto_912419 - HOIST
      ?auto_912418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912416 ?auto_912421 ) ( SURFACE-AT ?auto_912413 ?auto_912421 ) ( CLEAR ?auto_912413 ) ( IS-CRATE ?auto_912415 ) ( not ( = ?auto_912413 ?auto_912415 ) ) ( AVAILABLE ?auto_912416 ) ( ON ?auto_912413 ?auto_912414 ) ( not ( = ?auto_912414 ?auto_912413 ) ) ( not ( = ?auto_912414 ?auto_912415 ) ) ( TRUCK-AT ?auto_912417 ?auto_912420 ) ( not ( = ?auto_912420 ?auto_912421 ) ) ( HOIST-AT ?auto_912419 ?auto_912420 ) ( not ( = ?auto_912416 ?auto_912419 ) ) ( AVAILABLE ?auto_912419 ) ( SURFACE-AT ?auto_912415 ?auto_912420 ) ( ON ?auto_912415 ?auto_912418 ) ( CLEAR ?auto_912415 ) ( not ( = ?auto_912413 ?auto_912418 ) ) ( not ( = ?auto_912415 ?auto_912418 ) ) ( not ( = ?auto_912414 ?auto_912418 ) ) ( ON ?auto_912411 ?auto_912410 ) ( ON ?auto_912412 ?auto_912411 ) ( ON ?auto_912414 ?auto_912412 ) ( not ( = ?auto_912410 ?auto_912411 ) ) ( not ( = ?auto_912410 ?auto_912412 ) ) ( not ( = ?auto_912410 ?auto_912414 ) ) ( not ( = ?auto_912410 ?auto_912413 ) ) ( not ( = ?auto_912410 ?auto_912415 ) ) ( not ( = ?auto_912410 ?auto_912418 ) ) ( not ( = ?auto_912411 ?auto_912412 ) ) ( not ( = ?auto_912411 ?auto_912414 ) ) ( not ( = ?auto_912411 ?auto_912413 ) ) ( not ( = ?auto_912411 ?auto_912415 ) ) ( not ( = ?auto_912411 ?auto_912418 ) ) ( not ( = ?auto_912412 ?auto_912414 ) ) ( not ( = ?auto_912412 ?auto_912413 ) ) ( not ( = ?auto_912412 ?auto_912415 ) ) ( not ( = ?auto_912412 ?auto_912418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912414 ?auto_912413 ?auto_912415 )
      ( MAKE-5CRATE-VERIFY ?auto_912410 ?auto_912411 ?auto_912412 ?auto_912414 ?auto_912413 ?auto_912415 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912461 - SURFACE
      ?auto_912462 - SURFACE
      ?auto_912463 - SURFACE
      ?auto_912465 - SURFACE
      ?auto_912464 - SURFACE
      ?auto_912466 - SURFACE
    )
    :vars
    (
      ?auto_912467 - HOIST
      ?auto_912471 - PLACE
      ?auto_912469 - PLACE
      ?auto_912468 - HOIST
      ?auto_912470 - SURFACE
      ?auto_912472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912467 ?auto_912471 ) ( SURFACE-AT ?auto_912464 ?auto_912471 ) ( CLEAR ?auto_912464 ) ( IS-CRATE ?auto_912466 ) ( not ( = ?auto_912464 ?auto_912466 ) ) ( AVAILABLE ?auto_912467 ) ( ON ?auto_912464 ?auto_912465 ) ( not ( = ?auto_912465 ?auto_912464 ) ) ( not ( = ?auto_912465 ?auto_912466 ) ) ( not ( = ?auto_912469 ?auto_912471 ) ) ( HOIST-AT ?auto_912468 ?auto_912469 ) ( not ( = ?auto_912467 ?auto_912468 ) ) ( AVAILABLE ?auto_912468 ) ( SURFACE-AT ?auto_912466 ?auto_912469 ) ( ON ?auto_912466 ?auto_912470 ) ( CLEAR ?auto_912466 ) ( not ( = ?auto_912464 ?auto_912470 ) ) ( not ( = ?auto_912466 ?auto_912470 ) ) ( not ( = ?auto_912465 ?auto_912470 ) ) ( TRUCK-AT ?auto_912472 ?auto_912471 ) ( ON ?auto_912462 ?auto_912461 ) ( ON ?auto_912463 ?auto_912462 ) ( ON ?auto_912465 ?auto_912463 ) ( not ( = ?auto_912461 ?auto_912462 ) ) ( not ( = ?auto_912461 ?auto_912463 ) ) ( not ( = ?auto_912461 ?auto_912465 ) ) ( not ( = ?auto_912461 ?auto_912464 ) ) ( not ( = ?auto_912461 ?auto_912466 ) ) ( not ( = ?auto_912461 ?auto_912470 ) ) ( not ( = ?auto_912462 ?auto_912463 ) ) ( not ( = ?auto_912462 ?auto_912465 ) ) ( not ( = ?auto_912462 ?auto_912464 ) ) ( not ( = ?auto_912462 ?auto_912466 ) ) ( not ( = ?auto_912462 ?auto_912470 ) ) ( not ( = ?auto_912463 ?auto_912465 ) ) ( not ( = ?auto_912463 ?auto_912464 ) ) ( not ( = ?auto_912463 ?auto_912466 ) ) ( not ( = ?auto_912463 ?auto_912470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912465 ?auto_912464 ?auto_912466 )
      ( MAKE-5CRATE-VERIFY ?auto_912461 ?auto_912462 ?auto_912463 ?auto_912465 ?auto_912464 ?auto_912466 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912512 - SURFACE
      ?auto_912513 - SURFACE
      ?auto_912514 - SURFACE
      ?auto_912516 - SURFACE
      ?auto_912515 - SURFACE
      ?auto_912517 - SURFACE
    )
    :vars
    (
      ?auto_912523 - HOIST
      ?auto_912520 - PLACE
      ?auto_912521 - PLACE
      ?auto_912518 - HOIST
      ?auto_912519 - SURFACE
      ?auto_912522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912523 ?auto_912520 ) ( IS-CRATE ?auto_912517 ) ( not ( = ?auto_912515 ?auto_912517 ) ) ( not ( = ?auto_912516 ?auto_912515 ) ) ( not ( = ?auto_912516 ?auto_912517 ) ) ( not ( = ?auto_912521 ?auto_912520 ) ) ( HOIST-AT ?auto_912518 ?auto_912521 ) ( not ( = ?auto_912523 ?auto_912518 ) ) ( AVAILABLE ?auto_912518 ) ( SURFACE-AT ?auto_912517 ?auto_912521 ) ( ON ?auto_912517 ?auto_912519 ) ( CLEAR ?auto_912517 ) ( not ( = ?auto_912515 ?auto_912519 ) ) ( not ( = ?auto_912517 ?auto_912519 ) ) ( not ( = ?auto_912516 ?auto_912519 ) ) ( TRUCK-AT ?auto_912522 ?auto_912520 ) ( SURFACE-AT ?auto_912516 ?auto_912520 ) ( CLEAR ?auto_912516 ) ( LIFTING ?auto_912523 ?auto_912515 ) ( IS-CRATE ?auto_912515 ) ( ON ?auto_912513 ?auto_912512 ) ( ON ?auto_912514 ?auto_912513 ) ( ON ?auto_912516 ?auto_912514 ) ( not ( = ?auto_912512 ?auto_912513 ) ) ( not ( = ?auto_912512 ?auto_912514 ) ) ( not ( = ?auto_912512 ?auto_912516 ) ) ( not ( = ?auto_912512 ?auto_912515 ) ) ( not ( = ?auto_912512 ?auto_912517 ) ) ( not ( = ?auto_912512 ?auto_912519 ) ) ( not ( = ?auto_912513 ?auto_912514 ) ) ( not ( = ?auto_912513 ?auto_912516 ) ) ( not ( = ?auto_912513 ?auto_912515 ) ) ( not ( = ?auto_912513 ?auto_912517 ) ) ( not ( = ?auto_912513 ?auto_912519 ) ) ( not ( = ?auto_912514 ?auto_912516 ) ) ( not ( = ?auto_912514 ?auto_912515 ) ) ( not ( = ?auto_912514 ?auto_912517 ) ) ( not ( = ?auto_912514 ?auto_912519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912516 ?auto_912515 ?auto_912517 )
      ( MAKE-5CRATE-VERIFY ?auto_912512 ?auto_912513 ?auto_912514 ?auto_912516 ?auto_912515 ?auto_912517 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912563 - SURFACE
      ?auto_912564 - SURFACE
      ?auto_912565 - SURFACE
      ?auto_912567 - SURFACE
      ?auto_912566 - SURFACE
      ?auto_912568 - SURFACE
    )
    :vars
    (
      ?auto_912574 - HOIST
      ?auto_912572 - PLACE
      ?auto_912573 - PLACE
      ?auto_912570 - HOIST
      ?auto_912571 - SURFACE
      ?auto_912569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912574 ?auto_912572 ) ( IS-CRATE ?auto_912568 ) ( not ( = ?auto_912566 ?auto_912568 ) ) ( not ( = ?auto_912567 ?auto_912566 ) ) ( not ( = ?auto_912567 ?auto_912568 ) ) ( not ( = ?auto_912573 ?auto_912572 ) ) ( HOIST-AT ?auto_912570 ?auto_912573 ) ( not ( = ?auto_912574 ?auto_912570 ) ) ( AVAILABLE ?auto_912570 ) ( SURFACE-AT ?auto_912568 ?auto_912573 ) ( ON ?auto_912568 ?auto_912571 ) ( CLEAR ?auto_912568 ) ( not ( = ?auto_912566 ?auto_912571 ) ) ( not ( = ?auto_912568 ?auto_912571 ) ) ( not ( = ?auto_912567 ?auto_912571 ) ) ( TRUCK-AT ?auto_912569 ?auto_912572 ) ( SURFACE-AT ?auto_912567 ?auto_912572 ) ( CLEAR ?auto_912567 ) ( IS-CRATE ?auto_912566 ) ( AVAILABLE ?auto_912574 ) ( IN ?auto_912566 ?auto_912569 ) ( ON ?auto_912564 ?auto_912563 ) ( ON ?auto_912565 ?auto_912564 ) ( ON ?auto_912567 ?auto_912565 ) ( not ( = ?auto_912563 ?auto_912564 ) ) ( not ( = ?auto_912563 ?auto_912565 ) ) ( not ( = ?auto_912563 ?auto_912567 ) ) ( not ( = ?auto_912563 ?auto_912566 ) ) ( not ( = ?auto_912563 ?auto_912568 ) ) ( not ( = ?auto_912563 ?auto_912571 ) ) ( not ( = ?auto_912564 ?auto_912565 ) ) ( not ( = ?auto_912564 ?auto_912567 ) ) ( not ( = ?auto_912564 ?auto_912566 ) ) ( not ( = ?auto_912564 ?auto_912568 ) ) ( not ( = ?auto_912564 ?auto_912571 ) ) ( not ( = ?auto_912565 ?auto_912567 ) ) ( not ( = ?auto_912565 ?auto_912566 ) ) ( not ( = ?auto_912565 ?auto_912568 ) ) ( not ( = ?auto_912565 ?auto_912571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912567 ?auto_912566 ?auto_912568 )
      ( MAKE-5CRATE-VERIFY ?auto_912563 ?auto_912564 ?auto_912565 ?auto_912567 ?auto_912566 ?auto_912568 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_913772 - SURFACE
      ?auto_913773 - SURFACE
      ?auto_913774 - SURFACE
      ?auto_913776 - SURFACE
      ?auto_913775 - SURFACE
      ?auto_913777 - SURFACE
      ?auto_913778 - SURFACE
    )
    :vars
    (
      ?auto_913780 - HOIST
      ?auto_913779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913780 ?auto_913779 ) ( SURFACE-AT ?auto_913777 ?auto_913779 ) ( CLEAR ?auto_913777 ) ( LIFTING ?auto_913780 ?auto_913778 ) ( IS-CRATE ?auto_913778 ) ( not ( = ?auto_913777 ?auto_913778 ) ) ( ON ?auto_913773 ?auto_913772 ) ( ON ?auto_913774 ?auto_913773 ) ( ON ?auto_913776 ?auto_913774 ) ( ON ?auto_913775 ?auto_913776 ) ( ON ?auto_913777 ?auto_913775 ) ( not ( = ?auto_913772 ?auto_913773 ) ) ( not ( = ?auto_913772 ?auto_913774 ) ) ( not ( = ?auto_913772 ?auto_913776 ) ) ( not ( = ?auto_913772 ?auto_913775 ) ) ( not ( = ?auto_913772 ?auto_913777 ) ) ( not ( = ?auto_913772 ?auto_913778 ) ) ( not ( = ?auto_913773 ?auto_913774 ) ) ( not ( = ?auto_913773 ?auto_913776 ) ) ( not ( = ?auto_913773 ?auto_913775 ) ) ( not ( = ?auto_913773 ?auto_913777 ) ) ( not ( = ?auto_913773 ?auto_913778 ) ) ( not ( = ?auto_913774 ?auto_913776 ) ) ( not ( = ?auto_913774 ?auto_913775 ) ) ( not ( = ?auto_913774 ?auto_913777 ) ) ( not ( = ?auto_913774 ?auto_913778 ) ) ( not ( = ?auto_913776 ?auto_913775 ) ) ( not ( = ?auto_913776 ?auto_913777 ) ) ( not ( = ?auto_913776 ?auto_913778 ) ) ( not ( = ?auto_913775 ?auto_913777 ) ) ( not ( = ?auto_913775 ?auto_913778 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_913777 ?auto_913778 )
      ( MAKE-6CRATE-VERIFY ?auto_913772 ?auto_913773 ?auto_913774 ?auto_913776 ?auto_913775 ?auto_913777 ?auto_913778 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_913816 - SURFACE
      ?auto_913817 - SURFACE
      ?auto_913818 - SURFACE
      ?auto_913820 - SURFACE
      ?auto_913819 - SURFACE
      ?auto_913821 - SURFACE
      ?auto_913822 - SURFACE
    )
    :vars
    (
      ?auto_913823 - HOIST
      ?auto_913824 - PLACE
      ?auto_913825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913823 ?auto_913824 ) ( SURFACE-AT ?auto_913821 ?auto_913824 ) ( CLEAR ?auto_913821 ) ( IS-CRATE ?auto_913822 ) ( not ( = ?auto_913821 ?auto_913822 ) ) ( TRUCK-AT ?auto_913825 ?auto_913824 ) ( AVAILABLE ?auto_913823 ) ( IN ?auto_913822 ?auto_913825 ) ( ON ?auto_913821 ?auto_913819 ) ( not ( = ?auto_913819 ?auto_913821 ) ) ( not ( = ?auto_913819 ?auto_913822 ) ) ( ON ?auto_913817 ?auto_913816 ) ( ON ?auto_913818 ?auto_913817 ) ( ON ?auto_913820 ?auto_913818 ) ( ON ?auto_913819 ?auto_913820 ) ( not ( = ?auto_913816 ?auto_913817 ) ) ( not ( = ?auto_913816 ?auto_913818 ) ) ( not ( = ?auto_913816 ?auto_913820 ) ) ( not ( = ?auto_913816 ?auto_913819 ) ) ( not ( = ?auto_913816 ?auto_913821 ) ) ( not ( = ?auto_913816 ?auto_913822 ) ) ( not ( = ?auto_913817 ?auto_913818 ) ) ( not ( = ?auto_913817 ?auto_913820 ) ) ( not ( = ?auto_913817 ?auto_913819 ) ) ( not ( = ?auto_913817 ?auto_913821 ) ) ( not ( = ?auto_913817 ?auto_913822 ) ) ( not ( = ?auto_913818 ?auto_913820 ) ) ( not ( = ?auto_913818 ?auto_913819 ) ) ( not ( = ?auto_913818 ?auto_913821 ) ) ( not ( = ?auto_913818 ?auto_913822 ) ) ( not ( = ?auto_913820 ?auto_913819 ) ) ( not ( = ?auto_913820 ?auto_913821 ) ) ( not ( = ?auto_913820 ?auto_913822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913819 ?auto_913821 ?auto_913822 )
      ( MAKE-6CRATE-VERIFY ?auto_913816 ?auto_913817 ?auto_913818 ?auto_913820 ?auto_913819 ?auto_913821 ?auto_913822 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_913867 - SURFACE
      ?auto_913868 - SURFACE
      ?auto_913869 - SURFACE
      ?auto_913871 - SURFACE
      ?auto_913870 - SURFACE
      ?auto_913872 - SURFACE
      ?auto_913873 - SURFACE
    )
    :vars
    (
      ?auto_913877 - HOIST
      ?auto_913876 - PLACE
      ?auto_913875 - TRUCK
      ?auto_913874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913877 ?auto_913876 ) ( SURFACE-AT ?auto_913872 ?auto_913876 ) ( CLEAR ?auto_913872 ) ( IS-CRATE ?auto_913873 ) ( not ( = ?auto_913872 ?auto_913873 ) ) ( AVAILABLE ?auto_913877 ) ( IN ?auto_913873 ?auto_913875 ) ( ON ?auto_913872 ?auto_913870 ) ( not ( = ?auto_913870 ?auto_913872 ) ) ( not ( = ?auto_913870 ?auto_913873 ) ) ( TRUCK-AT ?auto_913875 ?auto_913874 ) ( not ( = ?auto_913874 ?auto_913876 ) ) ( ON ?auto_913868 ?auto_913867 ) ( ON ?auto_913869 ?auto_913868 ) ( ON ?auto_913871 ?auto_913869 ) ( ON ?auto_913870 ?auto_913871 ) ( not ( = ?auto_913867 ?auto_913868 ) ) ( not ( = ?auto_913867 ?auto_913869 ) ) ( not ( = ?auto_913867 ?auto_913871 ) ) ( not ( = ?auto_913867 ?auto_913870 ) ) ( not ( = ?auto_913867 ?auto_913872 ) ) ( not ( = ?auto_913867 ?auto_913873 ) ) ( not ( = ?auto_913868 ?auto_913869 ) ) ( not ( = ?auto_913868 ?auto_913871 ) ) ( not ( = ?auto_913868 ?auto_913870 ) ) ( not ( = ?auto_913868 ?auto_913872 ) ) ( not ( = ?auto_913868 ?auto_913873 ) ) ( not ( = ?auto_913869 ?auto_913871 ) ) ( not ( = ?auto_913869 ?auto_913870 ) ) ( not ( = ?auto_913869 ?auto_913872 ) ) ( not ( = ?auto_913869 ?auto_913873 ) ) ( not ( = ?auto_913871 ?auto_913870 ) ) ( not ( = ?auto_913871 ?auto_913872 ) ) ( not ( = ?auto_913871 ?auto_913873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913870 ?auto_913872 ?auto_913873 )
      ( MAKE-6CRATE-VERIFY ?auto_913867 ?auto_913868 ?auto_913869 ?auto_913871 ?auto_913870 ?auto_913872 ?auto_913873 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_913924 - SURFACE
      ?auto_913925 - SURFACE
      ?auto_913926 - SURFACE
      ?auto_913928 - SURFACE
      ?auto_913927 - SURFACE
      ?auto_913929 - SURFACE
      ?auto_913930 - SURFACE
    )
    :vars
    (
      ?auto_913935 - HOIST
      ?auto_913934 - PLACE
      ?auto_913931 - TRUCK
      ?auto_913933 - PLACE
      ?auto_913932 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_913935 ?auto_913934 ) ( SURFACE-AT ?auto_913929 ?auto_913934 ) ( CLEAR ?auto_913929 ) ( IS-CRATE ?auto_913930 ) ( not ( = ?auto_913929 ?auto_913930 ) ) ( AVAILABLE ?auto_913935 ) ( ON ?auto_913929 ?auto_913927 ) ( not ( = ?auto_913927 ?auto_913929 ) ) ( not ( = ?auto_913927 ?auto_913930 ) ) ( TRUCK-AT ?auto_913931 ?auto_913933 ) ( not ( = ?auto_913933 ?auto_913934 ) ) ( HOIST-AT ?auto_913932 ?auto_913933 ) ( LIFTING ?auto_913932 ?auto_913930 ) ( not ( = ?auto_913935 ?auto_913932 ) ) ( ON ?auto_913925 ?auto_913924 ) ( ON ?auto_913926 ?auto_913925 ) ( ON ?auto_913928 ?auto_913926 ) ( ON ?auto_913927 ?auto_913928 ) ( not ( = ?auto_913924 ?auto_913925 ) ) ( not ( = ?auto_913924 ?auto_913926 ) ) ( not ( = ?auto_913924 ?auto_913928 ) ) ( not ( = ?auto_913924 ?auto_913927 ) ) ( not ( = ?auto_913924 ?auto_913929 ) ) ( not ( = ?auto_913924 ?auto_913930 ) ) ( not ( = ?auto_913925 ?auto_913926 ) ) ( not ( = ?auto_913925 ?auto_913928 ) ) ( not ( = ?auto_913925 ?auto_913927 ) ) ( not ( = ?auto_913925 ?auto_913929 ) ) ( not ( = ?auto_913925 ?auto_913930 ) ) ( not ( = ?auto_913926 ?auto_913928 ) ) ( not ( = ?auto_913926 ?auto_913927 ) ) ( not ( = ?auto_913926 ?auto_913929 ) ) ( not ( = ?auto_913926 ?auto_913930 ) ) ( not ( = ?auto_913928 ?auto_913927 ) ) ( not ( = ?auto_913928 ?auto_913929 ) ) ( not ( = ?auto_913928 ?auto_913930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913927 ?auto_913929 ?auto_913930 )
      ( MAKE-6CRATE-VERIFY ?auto_913924 ?auto_913925 ?auto_913926 ?auto_913928 ?auto_913927 ?auto_913929 ?auto_913930 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_913987 - SURFACE
      ?auto_913988 - SURFACE
      ?auto_913989 - SURFACE
      ?auto_913991 - SURFACE
      ?auto_913990 - SURFACE
      ?auto_913992 - SURFACE
      ?auto_913993 - SURFACE
    )
    :vars
    (
      ?auto_913994 - HOIST
      ?auto_913995 - PLACE
      ?auto_913998 - TRUCK
      ?auto_913999 - PLACE
      ?auto_913997 - HOIST
      ?auto_913996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913994 ?auto_913995 ) ( SURFACE-AT ?auto_913992 ?auto_913995 ) ( CLEAR ?auto_913992 ) ( IS-CRATE ?auto_913993 ) ( not ( = ?auto_913992 ?auto_913993 ) ) ( AVAILABLE ?auto_913994 ) ( ON ?auto_913992 ?auto_913990 ) ( not ( = ?auto_913990 ?auto_913992 ) ) ( not ( = ?auto_913990 ?auto_913993 ) ) ( TRUCK-AT ?auto_913998 ?auto_913999 ) ( not ( = ?auto_913999 ?auto_913995 ) ) ( HOIST-AT ?auto_913997 ?auto_913999 ) ( not ( = ?auto_913994 ?auto_913997 ) ) ( AVAILABLE ?auto_913997 ) ( SURFACE-AT ?auto_913993 ?auto_913999 ) ( ON ?auto_913993 ?auto_913996 ) ( CLEAR ?auto_913993 ) ( not ( = ?auto_913992 ?auto_913996 ) ) ( not ( = ?auto_913993 ?auto_913996 ) ) ( not ( = ?auto_913990 ?auto_913996 ) ) ( ON ?auto_913988 ?auto_913987 ) ( ON ?auto_913989 ?auto_913988 ) ( ON ?auto_913991 ?auto_913989 ) ( ON ?auto_913990 ?auto_913991 ) ( not ( = ?auto_913987 ?auto_913988 ) ) ( not ( = ?auto_913987 ?auto_913989 ) ) ( not ( = ?auto_913987 ?auto_913991 ) ) ( not ( = ?auto_913987 ?auto_913990 ) ) ( not ( = ?auto_913987 ?auto_913992 ) ) ( not ( = ?auto_913987 ?auto_913993 ) ) ( not ( = ?auto_913987 ?auto_913996 ) ) ( not ( = ?auto_913988 ?auto_913989 ) ) ( not ( = ?auto_913988 ?auto_913991 ) ) ( not ( = ?auto_913988 ?auto_913990 ) ) ( not ( = ?auto_913988 ?auto_913992 ) ) ( not ( = ?auto_913988 ?auto_913993 ) ) ( not ( = ?auto_913988 ?auto_913996 ) ) ( not ( = ?auto_913989 ?auto_913991 ) ) ( not ( = ?auto_913989 ?auto_913990 ) ) ( not ( = ?auto_913989 ?auto_913992 ) ) ( not ( = ?auto_913989 ?auto_913993 ) ) ( not ( = ?auto_913989 ?auto_913996 ) ) ( not ( = ?auto_913991 ?auto_913990 ) ) ( not ( = ?auto_913991 ?auto_913992 ) ) ( not ( = ?auto_913991 ?auto_913993 ) ) ( not ( = ?auto_913991 ?auto_913996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913990 ?auto_913992 ?auto_913993 )
      ( MAKE-6CRATE-VERIFY ?auto_913987 ?auto_913988 ?auto_913989 ?auto_913991 ?auto_913990 ?auto_913992 ?auto_913993 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914051 - SURFACE
      ?auto_914052 - SURFACE
      ?auto_914053 - SURFACE
      ?auto_914055 - SURFACE
      ?auto_914054 - SURFACE
      ?auto_914056 - SURFACE
      ?auto_914057 - SURFACE
    )
    :vars
    (
      ?auto_914060 - HOIST
      ?auto_914058 - PLACE
      ?auto_914063 - PLACE
      ?auto_914061 - HOIST
      ?auto_914062 - SURFACE
      ?auto_914059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914060 ?auto_914058 ) ( SURFACE-AT ?auto_914056 ?auto_914058 ) ( CLEAR ?auto_914056 ) ( IS-CRATE ?auto_914057 ) ( not ( = ?auto_914056 ?auto_914057 ) ) ( AVAILABLE ?auto_914060 ) ( ON ?auto_914056 ?auto_914054 ) ( not ( = ?auto_914054 ?auto_914056 ) ) ( not ( = ?auto_914054 ?auto_914057 ) ) ( not ( = ?auto_914063 ?auto_914058 ) ) ( HOIST-AT ?auto_914061 ?auto_914063 ) ( not ( = ?auto_914060 ?auto_914061 ) ) ( AVAILABLE ?auto_914061 ) ( SURFACE-AT ?auto_914057 ?auto_914063 ) ( ON ?auto_914057 ?auto_914062 ) ( CLEAR ?auto_914057 ) ( not ( = ?auto_914056 ?auto_914062 ) ) ( not ( = ?auto_914057 ?auto_914062 ) ) ( not ( = ?auto_914054 ?auto_914062 ) ) ( TRUCK-AT ?auto_914059 ?auto_914058 ) ( ON ?auto_914052 ?auto_914051 ) ( ON ?auto_914053 ?auto_914052 ) ( ON ?auto_914055 ?auto_914053 ) ( ON ?auto_914054 ?auto_914055 ) ( not ( = ?auto_914051 ?auto_914052 ) ) ( not ( = ?auto_914051 ?auto_914053 ) ) ( not ( = ?auto_914051 ?auto_914055 ) ) ( not ( = ?auto_914051 ?auto_914054 ) ) ( not ( = ?auto_914051 ?auto_914056 ) ) ( not ( = ?auto_914051 ?auto_914057 ) ) ( not ( = ?auto_914051 ?auto_914062 ) ) ( not ( = ?auto_914052 ?auto_914053 ) ) ( not ( = ?auto_914052 ?auto_914055 ) ) ( not ( = ?auto_914052 ?auto_914054 ) ) ( not ( = ?auto_914052 ?auto_914056 ) ) ( not ( = ?auto_914052 ?auto_914057 ) ) ( not ( = ?auto_914052 ?auto_914062 ) ) ( not ( = ?auto_914053 ?auto_914055 ) ) ( not ( = ?auto_914053 ?auto_914054 ) ) ( not ( = ?auto_914053 ?auto_914056 ) ) ( not ( = ?auto_914053 ?auto_914057 ) ) ( not ( = ?auto_914053 ?auto_914062 ) ) ( not ( = ?auto_914055 ?auto_914054 ) ) ( not ( = ?auto_914055 ?auto_914056 ) ) ( not ( = ?auto_914055 ?auto_914057 ) ) ( not ( = ?auto_914055 ?auto_914062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914054 ?auto_914056 ?auto_914057 )
      ( MAKE-6CRATE-VERIFY ?auto_914051 ?auto_914052 ?auto_914053 ?auto_914055 ?auto_914054 ?auto_914056 ?auto_914057 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914115 - SURFACE
      ?auto_914116 - SURFACE
      ?auto_914117 - SURFACE
      ?auto_914119 - SURFACE
      ?auto_914118 - SURFACE
      ?auto_914120 - SURFACE
      ?auto_914121 - SURFACE
    )
    :vars
    (
      ?auto_914126 - HOIST
      ?auto_914123 - PLACE
      ?auto_914122 - PLACE
      ?auto_914125 - HOIST
      ?auto_914124 - SURFACE
      ?auto_914127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914126 ?auto_914123 ) ( IS-CRATE ?auto_914121 ) ( not ( = ?auto_914120 ?auto_914121 ) ) ( not ( = ?auto_914118 ?auto_914120 ) ) ( not ( = ?auto_914118 ?auto_914121 ) ) ( not ( = ?auto_914122 ?auto_914123 ) ) ( HOIST-AT ?auto_914125 ?auto_914122 ) ( not ( = ?auto_914126 ?auto_914125 ) ) ( AVAILABLE ?auto_914125 ) ( SURFACE-AT ?auto_914121 ?auto_914122 ) ( ON ?auto_914121 ?auto_914124 ) ( CLEAR ?auto_914121 ) ( not ( = ?auto_914120 ?auto_914124 ) ) ( not ( = ?auto_914121 ?auto_914124 ) ) ( not ( = ?auto_914118 ?auto_914124 ) ) ( TRUCK-AT ?auto_914127 ?auto_914123 ) ( SURFACE-AT ?auto_914118 ?auto_914123 ) ( CLEAR ?auto_914118 ) ( LIFTING ?auto_914126 ?auto_914120 ) ( IS-CRATE ?auto_914120 ) ( ON ?auto_914116 ?auto_914115 ) ( ON ?auto_914117 ?auto_914116 ) ( ON ?auto_914119 ?auto_914117 ) ( ON ?auto_914118 ?auto_914119 ) ( not ( = ?auto_914115 ?auto_914116 ) ) ( not ( = ?auto_914115 ?auto_914117 ) ) ( not ( = ?auto_914115 ?auto_914119 ) ) ( not ( = ?auto_914115 ?auto_914118 ) ) ( not ( = ?auto_914115 ?auto_914120 ) ) ( not ( = ?auto_914115 ?auto_914121 ) ) ( not ( = ?auto_914115 ?auto_914124 ) ) ( not ( = ?auto_914116 ?auto_914117 ) ) ( not ( = ?auto_914116 ?auto_914119 ) ) ( not ( = ?auto_914116 ?auto_914118 ) ) ( not ( = ?auto_914116 ?auto_914120 ) ) ( not ( = ?auto_914116 ?auto_914121 ) ) ( not ( = ?auto_914116 ?auto_914124 ) ) ( not ( = ?auto_914117 ?auto_914119 ) ) ( not ( = ?auto_914117 ?auto_914118 ) ) ( not ( = ?auto_914117 ?auto_914120 ) ) ( not ( = ?auto_914117 ?auto_914121 ) ) ( not ( = ?auto_914117 ?auto_914124 ) ) ( not ( = ?auto_914119 ?auto_914118 ) ) ( not ( = ?auto_914119 ?auto_914120 ) ) ( not ( = ?auto_914119 ?auto_914121 ) ) ( not ( = ?auto_914119 ?auto_914124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914118 ?auto_914120 ?auto_914121 )
      ( MAKE-6CRATE-VERIFY ?auto_914115 ?auto_914116 ?auto_914117 ?auto_914119 ?auto_914118 ?auto_914120 ?auto_914121 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914179 - SURFACE
      ?auto_914180 - SURFACE
      ?auto_914181 - SURFACE
      ?auto_914183 - SURFACE
      ?auto_914182 - SURFACE
      ?auto_914184 - SURFACE
      ?auto_914185 - SURFACE
    )
    :vars
    (
      ?auto_914186 - HOIST
      ?auto_914191 - PLACE
      ?auto_914187 - PLACE
      ?auto_914190 - HOIST
      ?auto_914189 - SURFACE
      ?auto_914188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914186 ?auto_914191 ) ( IS-CRATE ?auto_914185 ) ( not ( = ?auto_914184 ?auto_914185 ) ) ( not ( = ?auto_914182 ?auto_914184 ) ) ( not ( = ?auto_914182 ?auto_914185 ) ) ( not ( = ?auto_914187 ?auto_914191 ) ) ( HOIST-AT ?auto_914190 ?auto_914187 ) ( not ( = ?auto_914186 ?auto_914190 ) ) ( AVAILABLE ?auto_914190 ) ( SURFACE-AT ?auto_914185 ?auto_914187 ) ( ON ?auto_914185 ?auto_914189 ) ( CLEAR ?auto_914185 ) ( not ( = ?auto_914184 ?auto_914189 ) ) ( not ( = ?auto_914185 ?auto_914189 ) ) ( not ( = ?auto_914182 ?auto_914189 ) ) ( TRUCK-AT ?auto_914188 ?auto_914191 ) ( SURFACE-AT ?auto_914182 ?auto_914191 ) ( CLEAR ?auto_914182 ) ( IS-CRATE ?auto_914184 ) ( AVAILABLE ?auto_914186 ) ( IN ?auto_914184 ?auto_914188 ) ( ON ?auto_914180 ?auto_914179 ) ( ON ?auto_914181 ?auto_914180 ) ( ON ?auto_914183 ?auto_914181 ) ( ON ?auto_914182 ?auto_914183 ) ( not ( = ?auto_914179 ?auto_914180 ) ) ( not ( = ?auto_914179 ?auto_914181 ) ) ( not ( = ?auto_914179 ?auto_914183 ) ) ( not ( = ?auto_914179 ?auto_914182 ) ) ( not ( = ?auto_914179 ?auto_914184 ) ) ( not ( = ?auto_914179 ?auto_914185 ) ) ( not ( = ?auto_914179 ?auto_914189 ) ) ( not ( = ?auto_914180 ?auto_914181 ) ) ( not ( = ?auto_914180 ?auto_914183 ) ) ( not ( = ?auto_914180 ?auto_914182 ) ) ( not ( = ?auto_914180 ?auto_914184 ) ) ( not ( = ?auto_914180 ?auto_914185 ) ) ( not ( = ?auto_914180 ?auto_914189 ) ) ( not ( = ?auto_914181 ?auto_914183 ) ) ( not ( = ?auto_914181 ?auto_914182 ) ) ( not ( = ?auto_914181 ?auto_914184 ) ) ( not ( = ?auto_914181 ?auto_914185 ) ) ( not ( = ?auto_914181 ?auto_914189 ) ) ( not ( = ?auto_914183 ?auto_914182 ) ) ( not ( = ?auto_914183 ?auto_914184 ) ) ( not ( = ?auto_914183 ?auto_914185 ) ) ( not ( = ?auto_914183 ?auto_914189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914182 ?auto_914184 ?auto_914185 )
      ( MAKE-6CRATE-VERIFY ?auto_914179 ?auto_914180 ?auto_914181 ?auto_914183 ?auto_914182 ?auto_914184 ?auto_914185 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916135 - SURFACE
      ?auto_916136 - SURFACE
      ?auto_916137 - SURFACE
      ?auto_916139 - SURFACE
      ?auto_916138 - SURFACE
      ?auto_916140 - SURFACE
      ?auto_916141 - SURFACE
      ?auto_916142 - SURFACE
    )
    :vars
    (
      ?auto_916144 - HOIST
      ?auto_916143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916144 ?auto_916143 ) ( SURFACE-AT ?auto_916141 ?auto_916143 ) ( CLEAR ?auto_916141 ) ( LIFTING ?auto_916144 ?auto_916142 ) ( IS-CRATE ?auto_916142 ) ( not ( = ?auto_916141 ?auto_916142 ) ) ( ON ?auto_916136 ?auto_916135 ) ( ON ?auto_916137 ?auto_916136 ) ( ON ?auto_916139 ?auto_916137 ) ( ON ?auto_916138 ?auto_916139 ) ( ON ?auto_916140 ?auto_916138 ) ( ON ?auto_916141 ?auto_916140 ) ( not ( = ?auto_916135 ?auto_916136 ) ) ( not ( = ?auto_916135 ?auto_916137 ) ) ( not ( = ?auto_916135 ?auto_916139 ) ) ( not ( = ?auto_916135 ?auto_916138 ) ) ( not ( = ?auto_916135 ?auto_916140 ) ) ( not ( = ?auto_916135 ?auto_916141 ) ) ( not ( = ?auto_916135 ?auto_916142 ) ) ( not ( = ?auto_916136 ?auto_916137 ) ) ( not ( = ?auto_916136 ?auto_916139 ) ) ( not ( = ?auto_916136 ?auto_916138 ) ) ( not ( = ?auto_916136 ?auto_916140 ) ) ( not ( = ?auto_916136 ?auto_916141 ) ) ( not ( = ?auto_916136 ?auto_916142 ) ) ( not ( = ?auto_916137 ?auto_916139 ) ) ( not ( = ?auto_916137 ?auto_916138 ) ) ( not ( = ?auto_916137 ?auto_916140 ) ) ( not ( = ?auto_916137 ?auto_916141 ) ) ( not ( = ?auto_916137 ?auto_916142 ) ) ( not ( = ?auto_916139 ?auto_916138 ) ) ( not ( = ?auto_916139 ?auto_916140 ) ) ( not ( = ?auto_916139 ?auto_916141 ) ) ( not ( = ?auto_916139 ?auto_916142 ) ) ( not ( = ?auto_916138 ?auto_916140 ) ) ( not ( = ?auto_916138 ?auto_916141 ) ) ( not ( = ?auto_916138 ?auto_916142 ) ) ( not ( = ?auto_916140 ?auto_916141 ) ) ( not ( = ?auto_916140 ?auto_916142 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_916141 ?auto_916142 )
      ( MAKE-7CRATE-VERIFY ?auto_916135 ?auto_916136 ?auto_916137 ?auto_916139 ?auto_916138 ?auto_916140 ?auto_916141 ?auto_916142 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916190 - SURFACE
      ?auto_916191 - SURFACE
      ?auto_916192 - SURFACE
      ?auto_916194 - SURFACE
      ?auto_916193 - SURFACE
      ?auto_916195 - SURFACE
      ?auto_916196 - SURFACE
      ?auto_916197 - SURFACE
    )
    :vars
    (
      ?auto_916199 - HOIST
      ?auto_916198 - PLACE
      ?auto_916200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_916199 ?auto_916198 ) ( SURFACE-AT ?auto_916196 ?auto_916198 ) ( CLEAR ?auto_916196 ) ( IS-CRATE ?auto_916197 ) ( not ( = ?auto_916196 ?auto_916197 ) ) ( TRUCK-AT ?auto_916200 ?auto_916198 ) ( AVAILABLE ?auto_916199 ) ( IN ?auto_916197 ?auto_916200 ) ( ON ?auto_916196 ?auto_916195 ) ( not ( = ?auto_916195 ?auto_916196 ) ) ( not ( = ?auto_916195 ?auto_916197 ) ) ( ON ?auto_916191 ?auto_916190 ) ( ON ?auto_916192 ?auto_916191 ) ( ON ?auto_916194 ?auto_916192 ) ( ON ?auto_916193 ?auto_916194 ) ( ON ?auto_916195 ?auto_916193 ) ( not ( = ?auto_916190 ?auto_916191 ) ) ( not ( = ?auto_916190 ?auto_916192 ) ) ( not ( = ?auto_916190 ?auto_916194 ) ) ( not ( = ?auto_916190 ?auto_916193 ) ) ( not ( = ?auto_916190 ?auto_916195 ) ) ( not ( = ?auto_916190 ?auto_916196 ) ) ( not ( = ?auto_916190 ?auto_916197 ) ) ( not ( = ?auto_916191 ?auto_916192 ) ) ( not ( = ?auto_916191 ?auto_916194 ) ) ( not ( = ?auto_916191 ?auto_916193 ) ) ( not ( = ?auto_916191 ?auto_916195 ) ) ( not ( = ?auto_916191 ?auto_916196 ) ) ( not ( = ?auto_916191 ?auto_916197 ) ) ( not ( = ?auto_916192 ?auto_916194 ) ) ( not ( = ?auto_916192 ?auto_916193 ) ) ( not ( = ?auto_916192 ?auto_916195 ) ) ( not ( = ?auto_916192 ?auto_916196 ) ) ( not ( = ?auto_916192 ?auto_916197 ) ) ( not ( = ?auto_916194 ?auto_916193 ) ) ( not ( = ?auto_916194 ?auto_916195 ) ) ( not ( = ?auto_916194 ?auto_916196 ) ) ( not ( = ?auto_916194 ?auto_916197 ) ) ( not ( = ?auto_916193 ?auto_916195 ) ) ( not ( = ?auto_916193 ?auto_916196 ) ) ( not ( = ?auto_916193 ?auto_916197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916195 ?auto_916196 ?auto_916197 )
      ( MAKE-7CRATE-VERIFY ?auto_916190 ?auto_916191 ?auto_916192 ?auto_916194 ?auto_916193 ?auto_916195 ?auto_916196 ?auto_916197 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916253 - SURFACE
      ?auto_916254 - SURFACE
      ?auto_916255 - SURFACE
      ?auto_916257 - SURFACE
      ?auto_916256 - SURFACE
      ?auto_916258 - SURFACE
      ?auto_916259 - SURFACE
      ?auto_916260 - SURFACE
    )
    :vars
    (
      ?auto_916263 - HOIST
      ?auto_916262 - PLACE
      ?auto_916264 - TRUCK
      ?auto_916261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916263 ?auto_916262 ) ( SURFACE-AT ?auto_916259 ?auto_916262 ) ( CLEAR ?auto_916259 ) ( IS-CRATE ?auto_916260 ) ( not ( = ?auto_916259 ?auto_916260 ) ) ( AVAILABLE ?auto_916263 ) ( IN ?auto_916260 ?auto_916264 ) ( ON ?auto_916259 ?auto_916258 ) ( not ( = ?auto_916258 ?auto_916259 ) ) ( not ( = ?auto_916258 ?auto_916260 ) ) ( TRUCK-AT ?auto_916264 ?auto_916261 ) ( not ( = ?auto_916261 ?auto_916262 ) ) ( ON ?auto_916254 ?auto_916253 ) ( ON ?auto_916255 ?auto_916254 ) ( ON ?auto_916257 ?auto_916255 ) ( ON ?auto_916256 ?auto_916257 ) ( ON ?auto_916258 ?auto_916256 ) ( not ( = ?auto_916253 ?auto_916254 ) ) ( not ( = ?auto_916253 ?auto_916255 ) ) ( not ( = ?auto_916253 ?auto_916257 ) ) ( not ( = ?auto_916253 ?auto_916256 ) ) ( not ( = ?auto_916253 ?auto_916258 ) ) ( not ( = ?auto_916253 ?auto_916259 ) ) ( not ( = ?auto_916253 ?auto_916260 ) ) ( not ( = ?auto_916254 ?auto_916255 ) ) ( not ( = ?auto_916254 ?auto_916257 ) ) ( not ( = ?auto_916254 ?auto_916256 ) ) ( not ( = ?auto_916254 ?auto_916258 ) ) ( not ( = ?auto_916254 ?auto_916259 ) ) ( not ( = ?auto_916254 ?auto_916260 ) ) ( not ( = ?auto_916255 ?auto_916257 ) ) ( not ( = ?auto_916255 ?auto_916256 ) ) ( not ( = ?auto_916255 ?auto_916258 ) ) ( not ( = ?auto_916255 ?auto_916259 ) ) ( not ( = ?auto_916255 ?auto_916260 ) ) ( not ( = ?auto_916257 ?auto_916256 ) ) ( not ( = ?auto_916257 ?auto_916258 ) ) ( not ( = ?auto_916257 ?auto_916259 ) ) ( not ( = ?auto_916257 ?auto_916260 ) ) ( not ( = ?auto_916256 ?auto_916258 ) ) ( not ( = ?auto_916256 ?auto_916259 ) ) ( not ( = ?auto_916256 ?auto_916260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916258 ?auto_916259 ?auto_916260 )
      ( MAKE-7CRATE-VERIFY ?auto_916253 ?auto_916254 ?auto_916255 ?auto_916257 ?auto_916256 ?auto_916258 ?auto_916259 ?auto_916260 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916323 - SURFACE
      ?auto_916324 - SURFACE
      ?auto_916325 - SURFACE
      ?auto_916327 - SURFACE
      ?auto_916326 - SURFACE
      ?auto_916328 - SURFACE
      ?auto_916329 - SURFACE
      ?auto_916330 - SURFACE
    )
    :vars
    (
      ?auto_916332 - HOIST
      ?auto_916331 - PLACE
      ?auto_916334 - TRUCK
      ?auto_916335 - PLACE
      ?auto_916333 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_916332 ?auto_916331 ) ( SURFACE-AT ?auto_916329 ?auto_916331 ) ( CLEAR ?auto_916329 ) ( IS-CRATE ?auto_916330 ) ( not ( = ?auto_916329 ?auto_916330 ) ) ( AVAILABLE ?auto_916332 ) ( ON ?auto_916329 ?auto_916328 ) ( not ( = ?auto_916328 ?auto_916329 ) ) ( not ( = ?auto_916328 ?auto_916330 ) ) ( TRUCK-AT ?auto_916334 ?auto_916335 ) ( not ( = ?auto_916335 ?auto_916331 ) ) ( HOIST-AT ?auto_916333 ?auto_916335 ) ( LIFTING ?auto_916333 ?auto_916330 ) ( not ( = ?auto_916332 ?auto_916333 ) ) ( ON ?auto_916324 ?auto_916323 ) ( ON ?auto_916325 ?auto_916324 ) ( ON ?auto_916327 ?auto_916325 ) ( ON ?auto_916326 ?auto_916327 ) ( ON ?auto_916328 ?auto_916326 ) ( not ( = ?auto_916323 ?auto_916324 ) ) ( not ( = ?auto_916323 ?auto_916325 ) ) ( not ( = ?auto_916323 ?auto_916327 ) ) ( not ( = ?auto_916323 ?auto_916326 ) ) ( not ( = ?auto_916323 ?auto_916328 ) ) ( not ( = ?auto_916323 ?auto_916329 ) ) ( not ( = ?auto_916323 ?auto_916330 ) ) ( not ( = ?auto_916324 ?auto_916325 ) ) ( not ( = ?auto_916324 ?auto_916327 ) ) ( not ( = ?auto_916324 ?auto_916326 ) ) ( not ( = ?auto_916324 ?auto_916328 ) ) ( not ( = ?auto_916324 ?auto_916329 ) ) ( not ( = ?auto_916324 ?auto_916330 ) ) ( not ( = ?auto_916325 ?auto_916327 ) ) ( not ( = ?auto_916325 ?auto_916326 ) ) ( not ( = ?auto_916325 ?auto_916328 ) ) ( not ( = ?auto_916325 ?auto_916329 ) ) ( not ( = ?auto_916325 ?auto_916330 ) ) ( not ( = ?auto_916327 ?auto_916326 ) ) ( not ( = ?auto_916327 ?auto_916328 ) ) ( not ( = ?auto_916327 ?auto_916329 ) ) ( not ( = ?auto_916327 ?auto_916330 ) ) ( not ( = ?auto_916326 ?auto_916328 ) ) ( not ( = ?auto_916326 ?auto_916329 ) ) ( not ( = ?auto_916326 ?auto_916330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916328 ?auto_916329 ?auto_916330 )
      ( MAKE-7CRATE-VERIFY ?auto_916323 ?auto_916324 ?auto_916325 ?auto_916327 ?auto_916326 ?auto_916328 ?auto_916329 ?auto_916330 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916400 - SURFACE
      ?auto_916401 - SURFACE
      ?auto_916402 - SURFACE
      ?auto_916404 - SURFACE
      ?auto_916403 - SURFACE
      ?auto_916405 - SURFACE
      ?auto_916406 - SURFACE
      ?auto_916407 - SURFACE
    )
    :vars
    (
      ?auto_916410 - HOIST
      ?auto_916412 - PLACE
      ?auto_916408 - TRUCK
      ?auto_916411 - PLACE
      ?auto_916413 - HOIST
      ?auto_916409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916410 ?auto_916412 ) ( SURFACE-AT ?auto_916406 ?auto_916412 ) ( CLEAR ?auto_916406 ) ( IS-CRATE ?auto_916407 ) ( not ( = ?auto_916406 ?auto_916407 ) ) ( AVAILABLE ?auto_916410 ) ( ON ?auto_916406 ?auto_916405 ) ( not ( = ?auto_916405 ?auto_916406 ) ) ( not ( = ?auto_916405 ?auto_916407 ) ) ( TRUCK-AT ?auto_916408 ?auto_916411 ) ( not ( = ?auto_916411 ?auto_916412 ) ) ( HOIST-AT ?auto_916413 ?auto_916411 ) ( not ( = ?auto_916410 ?auto_916413 ) ) ( AVAILABLE ?auto_916413 ) ( SURFACE-AT ?auto_916407 ?auto_916411 ) ( ON ?auto_916407 ?auto_916409 ) ( CLEAR ?auto_916407 ) ( not ( = ?auto_916406 ?auto_916409 ) ) ( not ( = ?auto_916407 ?auto_916409 ) ) ( not ( = ?auto_916405 ?auto_916409 ) ) ( ON ?auto_916401 ?auto_916400 ) ( ON ?auto_916402 ?auto_916401 ) ( ON ?auto_916404 ?auto_916402 ) ( ON ?auto_916403 ?auto_916404 ) ( ON ?auto_916405 ?auto_916403 ) ( not ( = ?auto_916400 ?auto_916401 ) ) ( not ( = ?auto_916400 ?auto_916402 ) ) ( not ( = ?auto_916400 ?auto_916404 ) ) ( not ( = ?auto_916400 ?auto_916403 ) ) ( not ( = ?auto_916400 ?auto_916405 ) ) ( not ( = ?auto_916400 ?auto_916406 ) ) ( not ( = ?auto_916400 ?auto_916407 ) ) ( not ( = ?auto_916400 ?auto_916409 ) ) ( not ( = ?auto_916401 ?auto_916402 ) ) ( not ( = ?auto_916401 ?auto_916404 ) ) ( not ( = ?auto_916401 ?auto_916403 ) ) ( not ( = ?auto_916401 ?auto_916405 ) ) ( not ( = ?auto_916401 ?auto_916406 ) ) ( not ( = ?auto_916401 ?auto_916407 ) ) ( not ( = ?auto_916401 ?auto_916409 ) ) ( not ( = ?auto_916402 ?auto_916404 ) ) ( not ( = ?auto_916402 ?auto_916403 ) ) ( not ( = ?auto_916402 ?auto_916405 ) ) ( not ( = ?auto_916402 ?auto_916406 ) ) ( not ( = ?auto_916402 ?auto_916407 ) ) ( not ( = ?auto_916402 ?auto_916409 ) ) ( not ( = ?auto_916404 ?auto_916403 ) ) ( not ( = ?auto_916404 ?auto_916405 ) ) ( not ( = ?auto_916404 ?auto_916406 ) ) ( not ( = ?auto_916404 ?auto_916407 ) ) ( not ( = ?auto_916404 ?auto_916409 ) ) ( not ( = ?auto_916403 ?auto_916405 ) ) ( not ( = ?auto_916403 ?auto_916406 ) ) ( not ( = ?auto_916403 ?auto_916407 ) ) ( not ( = ?auto_916403 ?auto_916409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916405 ?auto_916406 ?auto_916407 )
      ( MAKE-7CRATE-VERIFY ?auto_916400 ?auto_916401 ?auto_916402 ?auto_916404 ?auto_916403 ?auto_916405 ?auto_916406 ?auto_916407 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916478 - SURFACE
      ?auto_916479 - SURFACE
      ?auto_916480 - SURFACE
      ?auto_916482 - SURFACE
      ?auto_916481 - SURFACE
      ?auto_916483 - SURFACE
      ?auto_916484 - SURFACE
      ?auto_916485 - SURFACE
    )
    :vars
    (
      ?auto_916490 - HOIST
      ?auto_916487 - PLACE
      ?auto_916488 - PLACE
      ?auto_916486 - HOIST
      ?auto_916489 - SURFACE
      ?auto_916491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_916490 ?auto_916487 ) ( SURFACE-AT ?auto_916484 ?auto_916487 ) ( CLEAR ?auto_916484 ) ( IS-CRATE ?auto_916485 ) ( not ( = ?auto_916484 ?auto_916485 ) ) ( AVAILABLE ?auto_916490 ) ( ON ?auto_916484 ?auto_916483 ) ( not ( = ?auto_916483 ?auto_916484 ) ) ( not ( = ?auto_916483 ?auto_916485 ) ) ( not ( = ?auto_916488 ?auto_916487 ) ) ( HOIST-AT ?auto_916486 ?auto_916488 ) ( not ( = ?auto_916490 ?auto_916486 ) ) ( AVAILABLE ?auto_916486 ) ( SURFACE-AT ?auto_916485 ?auto_916488 ) ( ON ?auto_916485 ?auto_916489 ) ( CLEAR ?auto_916485 ) ( not ( = ?auto_916484 ?auto_916489 ) ) ( not ( = ?auto_916485 ?auto_916489 ) ) ( not ( = ?auto_916483 ?auto_916489 ) ) ( TRUCK-AT ?auto_916491 ?auto_916487 ) ( ON ?auto_916479 ?auto_916478 ) ( ON ?auto_916480 ?auto_916479 ) ( ON ?auto_916482 ?auto_916480 ) ( ON ?auto_916481 ?auto_916482 ) ( ON ?auto_916483 ?auto_916481 ) ( not ( = ?auto_916478 ?auto_916479 ) ) ( not ( = ?auto_916478 ?auto_916480 ) ) ( not ( = ?auto_916478 ?auto_916482 ) ) ( not ( = ?auto_916478 ?auto_916481 ) ) ( not ( = ?auto_916478 ?auto_916483 ) ) ( not ( = ?auto_916478 ?auto_916484 ) ) ( not ( = ?auto_916478 ?auto_916485 ) ) ( not ( = ?auto_916478 ?auto_916489 ) ) ( not ( = ?auto_916479 ?auto_916480 ) ) ( not ( = ?auto_916479 ?auto_916482 ) ) ( not ( = ?auto_916479 ?auto_916481 ) ) ( not ( = ?auto_916479 ?auto_916483 ) ) ( not ( = ?auto_916479 ?auto_916484 ) ) ( not ( = ?auto_916479 ?auto_916485 ) ) ( not ( = ?auto_916479 ?auto_916489 ) ) ( not ( = ?auto_916480 ?auto_916482 ) ) ( not ( = ?auto_916480 ?auto_916481 ) ) ( not ( = ?auto_916480 ?auto_916483 ) ) ( not ( = ?auto_916480 ?auto_916484 ) ) ( not ( = ?auto_916480 ?auto_916485 ) ) ( not ( = ?auto_916480 ?auto_916489 ) ) ( not ( = ?auto_916482 ?auto_916481 ) ) ( not ( = ?auto_916482 ?auto_916483 ) ) ( not ( = ?auto_916482 ?auto_916484 ) ) ( not ( = ?auto_916482 ?auto_916485 ) ) ( not ( = ?auto_916482 ?auto_916489 ) ) ( not ( = ?auto_916481 ?auto_916483 ) ) ( not ( = ?auto_916481 ?auto_916484 ) ) ( not ( = ?auto_916481 ?auto_916485 ) ) ( not ( = ?auto_916481 ?auto_916489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916483 ?auto_916484 ?auto_916485 )
      ( MAKE-7CRATE-VERIFY ?auto_916478 ?auto_916479 ?auto_916480 ?auto_916482 ?auto_916481 ?auto_916483 ?auto_916484 ?auto_916485 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916556 - SURFACE
      ?auto_916557 - SURFACE
      ?auto_916558 - SURFACE
      ?auto_916560 - SURFACE
      ?auto_916559 - SURFACE
      ?auto_916561 - SURFACE
      ?auto_916562 - SURFACE
      ?auto_916563 - SURFACE
    )
    :vars
    (
      ?auto_916569 - HOIST
      ?auto_916567 - PLACE
      ?auto_916564 - PLACE
      ?auto_916566 - HOIST
      ?auto_916565 - SURFACE
      ?auto_916568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_916569 ?auto_916567 ) ( IS-CRATE ?auto_916563 ) ( not ( = ?auto_916562 ?auto_916563 ) ) ( not ( = ?auto_916561 ?auto_916562 ) ) ( not ( = ?auto_916561 ?auto_916563 ) ) ( not ( = ?auto_916564 ?auto_916567 ) ) ( HOIST-AT ?auto_916566 ?auto_916564 ) ( not ( = ?auto_916569 ?auto_916566 ) ) ( AVAILABLE ?auto_916566 ) ( SURFACE-AT ?auto_916563 ?auto_916564 ) ( ON ?auto_916563 ?auto_916565 ) ( CLEAR ?auto_916563 ) ( not ( = ?auto_916562 ?auto_916565 ) ) ( not ( = ?auto_916563 ?auto_916565 ) ) ( not ( = ?auto_916561 ?auto_916565 ) ) ( TRUCK-AT ?auto_916568 ?auto_916567 ) ( SURFACE-AT ?auto_916561 ?auto_916567 ) ( CLEAR ?auto_916561 ) ( LIFTING ?auto_916569 ?auto_916562 ) ( IS-CRATE ?auto_916562 ) ( ON ?auto_916557 ?auto_916556 ) ( ON ?auto_916558 ?auto_916557 ) ( ON ?auto_916560 ?auto_916558 ) ( ON ?auto_916559 ?auto_916560 ) ( ON ?auto_916561 ?auto_916559 ) ( not ( = ?auto_916556 ?auto_916557 ) ) ( not ( = ?auto_916556 ?auto_916558 ) ) ( not ( = ?auto_916556 ?auto_916560 ) ) ( not ( = ?auto_916556 ?auto_916559 ) ) ( not ( = ?auto_916556 ?auto_916561 ) ) ( not ( = ?auto_916556 ?auto_916562 ) ) ( not ( = ?auto_916556 ?auto_916563 ) ) ( not ( = ?auto_916556 ?auto_916565 ) ) ( not ( = ?auto_916557 ?auto_916558 ) ) ( not ( = ?auto_916557 ?auto_916560 ) ) ( not ( = ?auto_916557 ?auto_916559 ) ) ( not ( = ?auto_916557 ?auto_916561 ) ) ( not ( = ?auto_916557 ?auto_916562 ) ) ( not ( = ?auto_916557 ?auto_916563 ) ) ( not ( = ?auto_916557 ?auto_916565 ) ) ( not ( = ?auto_916558 ?auto_916560 ) ) ( not ( = ?auto_916558 ?auto_916559 ) ) ( not ( = ?auto_916558 ?auto_916561 ) ) ( not ( = ?auto_916558 ?auto_916562 ) ) ( not ( = ?auto_916558 ?auto_916563 ) ) ( not ( = ?auto_916558 ?auto_916565 ) ) ( not ( = ?auto_916560 ?auto_916559 ) ) ( not ( = ?auto_916560 ?auto_916561 ) ) ( not ( = ?auto_916560 ?auto_916562 ) ) ( not ( = ?auto_916560 ?auto_916563 ) ) ( not ( = ?auto_916560 ?auto_916565 ) ) ( not ( = ?auto_916559 ?auto_916561 ) ) ( not ( = ?auto_916559 ?auto_916562 ) ) ( not ( = ?auto_916559 ?auto_916563 ) ) ( not ( = ?auto_916559 ?auto_916565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916561 ?auto_916562 ?auto_916563 )
      ( MAKE-7CRATE-VERIFY ?auto_916556 ?auto_916557 ?auto_916558 ?auto_916560 ?auto_916559 ?auto_916561 ?auto_916562 ?auto_916563 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916634 - SURFACE
      ?auto_916635 - SURFACE
      ?auto_916636 - SURFACE
      ?auto_916638 - SURFACE
      ?auto_916637 - SURFACE
      ?auto_916639 - SURFACE
      ?auto_916640 - SURFACE
      ?auto_916641 - SURFACE
    )
    :vars
    (
      ?auto_916645 - HOIST
      ?auto_916644 - PLACE
      ?auto_916647 - PLACE
      ?auto_916642 - HOIST
      ?auto_916646 - SURFACE
      ?auto_916643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_916645 ?auto_916644 ) ( IS-CRATE ?auto_916641 ) ( not ( = ?auto_916640 ?auto_916641 ) ) ( not ( = ?auto_916639 ?auto_916640 ) ) ( not ( = ?auto_916639 ?auto_916641 ) ) ( not ( = ?auto_916647 ?auto_916644 ) ) ( HOIST-AT ?auto_916642 ?auto_916647 ) ( not ( = ?auto_916645 ?auto_916642 ) ) ( AVAILABLE ?auto_916642 ) ( SURFACE-AT ?auto_916641 ?auto_916647 ) ( ON ?auto_916641 ?auto_916646 ) ( CLEAR ?auto_916641 ) ( not ( = ?auto_916640 ?auto_916646 ) ) ( not ( = ?auto_916641 ?auto_916646 ) ) ( not ( = ?auto_916639 ?auto_916646 ) ) ( TRUCK-AT ?auto_916643 ?auto_916644 ) ( SURFACE-AT ?auto_916639 ?auto_916644 ) ( CLEAR ?auto_916639 ) ( IS-CRATE ?auto_916640 ) ( AVAILABLE ?auto_916645 ) ( IN ?auto_916640 ?auto_916643 ) ( ON ?auto_916635 ?auto_916634 ) ( ON ?auto_916636 ?auto_916635 ) ( ON ?auto_916638 ?auto_916636 ) ( ON ?auto_916637 ?auto_916638 ) ( ON ?auto_916639 ?auto_916637 ) ( not ( = ?auto_916634 ?auto_916635 ) ) ( not ( = ?auto_916634 ?auto_916636 ) ) ( not ( = ?auto_916634 ?auto_916638 ) ) ( not ( = ?auto_916634 ?auto_916637 ) ) ( not ( = ?auto_916634 ?auto_916639 ) ) ( not ( = ?auto_916634 ?auto_916640 ) ) ( not ( = ?auto_916634 ?auto_916641 ) ) ( not ( = ?auto_916634 ?auto_916646 ) ) ( not ( = ?auto_916635 ?auto_916636 ) ) ( not ( = ?auto_916635 ?auto_916638 ) ) ( not ( = ?auto_916635 ?auto_916637 ) ) ( not ( = ?auto_916635 ?auto_916639 ) ) ( not ( = ?auto_916635 ?auto_916640 ) ) ( not ( = ?auto_916635 ?auto_916641 ) ) ( not ( = ?auto_916635 ?auto_916646 ) ) ( not ( = ?auto_916636 ?auto_916638 ) ) ( not ( = ?auto_916636 ?auto_916637 ) ) ( not ( = ?auto_916636 ?auto_916639 ) ) ( not ( = ?auto_916636 ?auto_916640 ) ) ( not ( = ?auto_916636 ?auto_916641 ) ) ( not ( = ?auto_916636 ?auto_916646 ) ) ( not ( = ?auto_916638 ?auto_916637 ) ) ( not ( = ?auto_916638 ?auto_916639 ) ) ( not ( = ?auto_916638 ?auto_916640 ) ) ( not ( = ?auto_916638 ?auto_916641 ) ) ( not ( = ?auto_916638 ?auto_916646 ) ) ( not ( = ?auto_916637 ?auto_916639 ) ) ( not ( = ?auto_916637 ?auto_916640 ) ) ( not ( = ?auto_916637 ?auto_916641 ) ) ( not ( = ?auto_916637 ?auto_916646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916639 ?auto_916640 ?auto_916641 )
      ( MAKE-7CRATE-VERIFY ?auto_916634 ?auto_916635 ?auto_916636 ?auto_916638 ?auto_916637 ?auto_916639 ?auto_916640 ?auto_916641 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919553 - SURFACE
      ?auto_919554 - SURFACE
      ?auto_919555 - SURFACE
      ?auto_919557 - SURFACE
      ?auto_919556 - SURFACE
      ?auto_919558 - SURFACE
      ?auto_919559 - SURFACE
      ?auto_919560 - SURFACE
      ?auto_919561 - SURFACE
    )
    :vars
    (
      ?auto_919562 - HOIST
      ?auto_919563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_919562 ?auto_919563 ) ( SURFACE-AT ?auto_919560 ?auto_919563 ) ( CLEAR ?auto_919560 ) ( LIFTING ?auto_919562 ?auto_919561 ) ( IS-CRATE ?auto_919561 ) ( not ( = ?auto_919560 ?auto_919561 ) ) ( ON ?auto_919554 ?auto_919553 ) ( ON ?auto_919555 ?auto_919554 ) ( ON ?auto_919557 ?auto_919555 ) ( ON ?auto_919556 ?auto_919557 ) ( ON ?auto_919558 ?auto_919556 ) ( ON ?auto_919559 ?auto_919558 ) ( ON ?auto_919560 ?auto_919559 ) ( not ( = ?auto_919553 ?auto_919554 ) ) ( not ( = ?auto_919553 ?auto_919555 ) ) ( not ( = ?auto_919553 ?auto_919557 ) ) ( not ( = ?auto_919553 ?auto_919556 ) ) ( not ( = ?auto_919553 ?auto_919558 ) ) ( not ( = ?auto_919553 ?auto_919559 ) ) ( not ( = ?auto_919553 ?auto_919560 ) ) ( not ( = ?auto_919553 ?auto_919561 ) ) ( not ( = ?auto_919554 ?auto_919555 ) ) ( not ( = ?auto_919554 ?auto_919557 ) ) ( not ( = ?auto_919554 ?auto_919556 ) ) ( not ( = ?auto_919554 ?auto_919558 ) ) ( not ( = ?auto_919554 ?auto_919559 ) ) ( not ( = ?auto_919554 ?auto_919560 ) ) ( not ( = ?auto_919554 ?auto_919561 ) ) ( not ( = ?auto_919555 ?auto_919557 ) ) ( not ( = ?auto_919555 ?auto_919556 ) ) ( not ( = ?auto_919555 ?auto_919558 ) ) ( not ( = ?auto_919555 ?auto_919559 ) ) ( not ( = ?auto_919555 ?auto_919560 ) ) ( not ( = ?auto_919555 ?auto_919561 ) ) ( not ( = ?auto_919557 ?auto_919556 ) ) ( not ( = ?auto_919557 ?auto_919558 ) ) ( not ( = ?auto_919557 ?auto_919559 ) ) ( not ( = ?auto_919557 ?auto_919560 ) ) ( not ( = ?auto_919557 ?auto_919561 ) ) ( not ( = ?auto_919556 ?auto_919558 ) ) ( not ( = ?auto_919556 ?auto_919559 ) ) ( not ( = ?auto_919556 ?auto_919560 ) ) ( not ( = ?auto_919556 ?auto_919561 ) ) ( not ( = ?auto_919558 ?auto_919559 ) ) ( not ( = ?auto_919558 ?auto_919560 ) ) ( not ( = ?auto_919558 ?auto_919561 ) ) ( not ( = ?auto_919559 ?auto_919560 ) ) ( not ( = ?auto_919559 ?auto_919561 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_919560 ?auto_919561 )
      ( MAKE-8CRATE-VERIFY ?auto_919553 ?auto_919554 ?auto_919555 ?auto_919557 ?auto_919556 ?auto_919558 ?auto_919559 ?auto_919560 ?auto_919561 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919620 - SURFACE
      ?auto_919621 - SURFACE
      ?auto_919622 - SURFACE
      ?auto_919624 - SURFACE
      ?auto_919623 - SURFACE
      ?auto_919625 - SURFACE
      ?auto_919626 - SURFACE
      ?auto_919627 - SURFACE
      ?auto_919628 - SURFACE
    )
    :vars
    (
      ?auto_919631 - HOIST
      ?auto_919629 - PLACE
      ?auto_919630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_919631 ?auto_919629 ) ( SURFACE-AT ?auto_919627 ?auto_919629 ) ( CLEAR ?auto_919627 ) ( IS-CRATE ?auto_919628 ) ( not ( = ?auto_919627 ?auto_919628 ) ) ( TRUCK-AT ?auto_919630 ?auto_919629 ) ( AVAILABLE ?auto_919631 ) ( IN ?auto_919628 ?auto_919630 ) ( ON ?auto_919627 ?auto_919626 ) ( not ( = ?auto_919626 ?auto_919627 ) ) ( not ( = ?auto_919626 ?auto_919628 ) ) ( ON ?auto_919621 ?auto_919620 ) ( ON ?auto_919622 ?auto_919621 ) ( ON ?auto_919624 ?auto_919622 ) ( ON ?auto_919623 ?auto_919624 ) ( ON ?auto_919625 ?auto_919623 ) ( ON ?auto_919626 ?auto_919625 ) ( not ( = ?auto_919620 ?auto_919621 ) ) ( not ( = ?auto_919620 ?auto_919622 ) ) ( not ( = ?auto_919620 ?auto_919624 ) ) ( not ( = ?auto_919620 ?auto_919623 ) ) ( not ( = ?auto_919620 ?auto_919625 ) ) ( not ( = ?auto_919620 ?auto_919626 ) ) ( not ( = ?auto_919620 ?auto_919627 ) ) ( not ( = ?auto_919620 ?auto_919628 ) ) ( not ( = ?auto_919621 ?auto_919622 ) ) ( not ( = ?auto_919621 ?auto_919624 ) ) ( not ( = ?auto_919621 ?auto_919623 ) ) ( not ( = ?auto_919621 ?auto_919625 ) ) ( not ( = ?auto_919621 ?auto_919626 ) ) ( not ( = ?auto_919621 ?auto_919627 ) ) ( not ( = ?auto_919621 ?auto_919628 ) ) ( not ( = ?auto_919622 ?auto_919624 ) ) ( not ( = ?auto_919622 ?auto_919623 ) ) ( not ( = ?auto_919622 ?auto_919625 ) ) ( not ( = ?auto_919622 ?auto_919626 ) ) ( not ( = ?auto_919622 ?auto_919627 ) ) ( not ( = ?auto_919622 ?auto_919628 ) ) ( not ( = ?auto_919624 ?auto_919623 ) ) ( not ( = ?auto_919624 ?auto_919625 ) ) ( not ( = ?auto_919624 ?auto_919626 ) ) ( not ( = ?auto_919624 ?auto_919627 ) ) ( not ( = ?auto_919624 ?auto_919628 ) ) ( not ( = ?auto_919623 ?auto_919625 ) ) ( not ( = ?auto_919623 ?auto_919626 ) ) ( not ( = ?auto_919623 ?auto_919627 ) ) ( not ( = ?auto_919623 ?auto_919628 ) ) ( not ( = ?auto_919625 ?auto_919626 ) ) ( not ( = ?auto_919625 ?auto_919627 ) ) ( not ( = ?auto_919625 ?auto_919628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919626 ?auto_919627 ?auto_919628 )
      ( MAKE-8CRATE-VERIFY ?auto_919620 ?auto_919621 ?auto_919622 ?auto_919624 ?auto_919623 ?auto_919625 ?auto_919626 ?auto_919627 ?auto_919628 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919696 - SURFACE
      ?auto_919697 - SURFACE
      ?auto_919698 - SURFACE
      ?auto_919700 - SURFACE
      ?auto_919699 - SURFACE
      ?auto_919701 - SURFACE
      ?auto_919702 - SURFACE
      ?auto_919703 - SURFACE
      ?auto_919704 - SURFACE
    )
    :vars
    (
      ?auto_919705 - HOIST
      ?auto_919707 - PLACE
      ?auto_919706 - TRUCK
      ?auto_919708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_919705 ?auto_919707 ) ( SURFACE-AT ?auto_919703 ?auto_919707 ) ( CLEAR ?auto_919703 ) ( IS-CRATE ?auto_919704 ) ( not ( = ?auto_919703 ?auto_919704 ) ) ( AVAILABLE ?auto_919705 ) ( IN ?auto_919704 ?auto_919706 ) ( ON ?auto_919703 ?auto_919702 ) ( not ( = ?auto_919702 ?auto_919703 ) ) ( not ( = ?auto_919702 ?auto_919704 ) ) ( TRUCK-AT ?auto_919706 ?auto_919708 ) ( not ( = ?auto_919708 ?auto_919707 ) ) ( ON ?auto_919697 ?auto_919696 ) ( ON ?auto_919698 ?auto_919697 ) ( ON ?auto_919700 ?auto_919698 ) ( ON ?auto_919699 ?auto_919700 ) ( ON ?auto_919701 ?auto_919699 ) ( ON ?auto_919702 ?auto_919701 ) ( not ( = ?auto_919696 ?auto_919697 ) ) ( not ( = ?auto_919696 ?auto_919698 ) ) ( not ( = ?auto_919696 ?auto_919700 ) ) ( not ( = ?auto_919696 ?auto_919699 ) ) ( not ( = ?auto_919696 ?auto_919701 ) ) ( not ( = ?auto_919696 ?auto_919702 ) ) ( not ( = ?auto_919696 ?auto_919703 ) ) ( not ( = ?auto_919696 ?auto_919704 ) ) ( not ( = ?auto_919697 ?auto_919698 ) ) ( not ( = ?auto_919697 ?auto_919700 ) ) ( not ( = ?auto_919697 ?auto_919699 ) ) ( not ( = ?auto_919697 ?auto_919701 ) ) ( not ( = ?auto_919697 ?auto_919702 ) ) ( not ( = ?auto_919697 ?auto_919703 ) ) ( not ( = ?auto_919697 ?auto_919704 ) ) ( not ( = ?auto_919698 ?auto_919700 ) ) ( not ( = ?auto_919698 ?auto_919699 ) ) ( not ( = ?auto_919698 ?auto_919701 ) ) ( not ( = ?auto_919698 ?auto_919702 ) ) ( not ( = ?auto_919698 ?auto_919703 ) ) ( not ( = ?auto_919698 ?auto_919704 ) ) ( not ( = ?auto_919700 ?auto_919699 ) ) ( not ( = ?auto_919700 ?auto_919701 ) ) ( not ( = ?auto_919700 ?auto_919702 ) ) ( not ( = ?auto_919700 ?auto_919703 ) ) ( not ( = ?auto_919700 ?auto_919704 ) ) ( not ( = ?auto_919699 ?auto_919701 ) ) ( not ( = ?auto_919699 ?auto_919702 ) ) ( not ( = ?auto_919699 ?auto_919703 ) ) ( not ( = ?auto_919699 ?auto_919704 ) ) ( not ( = ?auto_919701 ?auto_919702 ) ) ( not ( = ?auto_919701 ?auto_919703 ) ) ( not ( = ?auto_919701 ?auto_919704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919702 ?auto_919703 ?auto_919704 )
      ( MAKE-8CRATE-VERIFY ?auto_919696 ?auto_919697 ?auto_919698 ?auto_919700 ?auto_919699 ?auto_919701 ?auto_919702 ?auto_919703 ?auto_919704 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919780 - SURFACE
      ?auto_919781 - SURFACE
      ?auto_919782 - SURFACE
      ?auto_919784 - SURFACE
      ?auto_919783 - SURFACE
      ?auto_919785 - SURFACE
      ?auto_919786 - SURFACE
      ?auto_919787 - SURFACE
      ?auto_919788 - SURFACE
    )
    :vars
    (
      ?auto_919791 - HOIST
      ?auto_919793 - PLACE
      ?auto_919789 - TRUCK
      ?auto_919792 - PLACE
      ?auto_919790 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_919791 ?auto_919793 ) ( SURFACE-AT ?auto_919787 ?auto_919793 ) ( CLEAR ?auto_919787 ) ( IS-CRATE ?auto_919788 ) ( not ( = ?auto_919787 ?auto_919788 ) ) ( AVAILABLE ?auto_919791 ) ( ON ?auto_919787 ?auto_919786 ) ( not ( = ?auto_919786 ?auto_919787 ) ) ( not ( = ?auto_919786 ?auto_919788 ) ) ( TRUCK-AT ?auto_919789 ?auto_919792 ) ( not ( = ?auto_919792 ?auto_919793 ) ) ( HOIST-AT ?auto_919790 ?auto_919792 ) ( LIFTING ?auto_919790 ?auto_919788 ) ( not ( = ?auto_919791 ?auto_919790 ) ) ( ON ?auto_919781 ?auto_919780 ) ( ON ?auto_919782 ?auto_919781 ) ( ON ?auto_919784 ?auto_919782 ) ( ON ?auto_919783 ?auto_919784 ) ( ON ?auto_919785 ?auto_919783 ) ( ON ?auto_919786 ?auto_919785 ) ( not ( = ?auto_919780 ?auto_919781 ) ) ( not ( = ?auto_919780 ?auto_919782 ) ) ( not ( = ?auto_919780 ?auto_919784 ) ) ( not ( = ?auto_919780 ?auto_919783 ) ) ( not ( = ?auto_919780 ?auto_919785 ) ) ( not ( = ?auto_919780 ?auto_919786 ) ) ( not ( = ?auto_919780 ?auto_919787 ) ) ( not ( = ?auto_919780 ?auto_919788 ) ) ( not ( = ?auto_919781 ?auto_919782 ) ) ( not ( = ?auto_919781 ?auto_919784 ) ) ( not ( = ?auto_919781 ?auto_919783 ) ) ( not ( = ?auto_919781 ?auto_919785 ) ) ( not ( = ?auto_919781 ?auto_919786 ) ) ( not ( = ?auto_919781 ?auto_919787 ) ) ( not ( = ?auto_919781 ?auto_919788 ) ) ( not ( = ?auto_919782 ?auto_919784 ) ) ( not ( = ?auto_919782 ?auto_919783 ) ) ( not ( = ?auto_919782 ?auto_919785 ) ) ( not ( = ?auto_919782 ?auto_919786 ) ) ( not ( = ?auto_919782 ?auto_919787 ) ) ( not ( = ?auto_919782 ?auto_919788 ) ) ( not ( = ?auto_919784 ?auto_919783 ) ) ( not ( = ?auto_919784 ?auto_919785 ) ) ( not ( = ?auto_919784 ?auto_919786 ) ) ( not ( = ?auto_919784 ?auto_919787 ) ) ( not ( = ?auto_919784 ?auto_919788 ) ) ( not ( = ?auto_919783 ?auto_919785 ) ) ( not ( = ?auto_919783 ?auto_919786 ) ) ( not ( = ?auto_919783 ?auto_919787 ) ) ( not ( = ?auto_919783 ?auto_919788 ) ) ( not ( = ?auto_919785 ?auto_919786 ) ) ( not ( = ?auto_919785 ?auto_919787 ) ) ( not ( = ?auto_919785 ?auto_919788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919786 ?auto_919787 ?auto_919788 )
      ( MAKE-8CRATE-VERIFY ?auto_919780 ?auto_919781 ?auto_919782 ?auto_919784 ?auto_919783 ?auto_919785 ?auto_919786 ?auto_919787 ?auto_919788 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919872 - SURFACE
      ?auto_919873 - SURFACE
      ?auto_919874 - SURFACE
      ?auto_919876 - SURFACE
      ?auto_919875 - SURFACE
      ?auto_919877 - SURFACE
      ?auto_919878 - SURFACE
      ?auto_919879 - SURFACE
      ?auto_919880 - SURFACE
    )
    :vars
    (
      ?auto_919885 - HOIST
      ?auto_919881 - PLACE
      ?auto_919886 - TRUCK
      ?auto_919884 - PLACE
      ?auto_919883 - HOIST
      ?auto_919882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_919885 ?auto_919881 ) ( SURFACE-AT ?auto_919879 ?auto_919881 ) ( CLEAR ?auto_919879 ) ( IS-CRATE ?auto_919880 ) ( not ( = ?auto_919879 ?auto_919880 ) ) ( AVAILABLE ?auto_919885 ) ( ON ?auto_919879 ?auto_919878 ) ( not ( = ?auto_919878 ?auto_919879 ) ) ( not ( = ?auto_919878 ?auto_919880 ) ) ( TRUCK-AT ?auto_919886 ?auto_919884 ) ( not ( = ?auto_919884 ?auto_919881 ) ) ( HOIST-AT ?auto_919883 ?auto_919884 ) ( not ( = ?auto_919885 ?auto_919883 ) ) ( AVAILABLE ?auto_919883 ) ( SURFACE-AT ?auto_919880 ?auto_919884 ) ( ON ?auto_919880 ?auto_919882 ) ( CLEAR ?auto_919880 ) ( not ( = ?auto_919879 ?auto_919882 ) ) ( not ( = ?auto_919880 ?auto_919882 ) ) ( not ( = ?auto_919878 ?auto_919882 ) ) ( ON ?auto_919873 ?auto_919872 ) ( ON ?auto_919874 ?auto_919873 ) ( ON ?auto_919876 ?auto_919874 ) ( ON ?auto_919875 ?auto_919876 ) ( ON ?auto_919877 ?auto_919875 ) ( ON ?auto_919878 ?auto_919877 ) ( not ( = ?auto_919872 ?auto_919873 ) ) ( not ( = ?auto_919872 ?auto_919874 ) ) ( not ( = ?auto_919872 ?auto_919876 ) ) ( not ( = ?auto_919872 ?auto_919875 ) ) ( not ( = ?auto_919872 ?auto_919877 ) ) ( not ( = ?auto_919872 ?auto_919878 ) ) ( not ( = ?auto_919872 ?auto_919879 ) ) ( not ( = ?auto_919872 ?auto_919880 ) ) ( not ( = ?auto_919872 ?auto_919882 ) ) ( not ( = ?auto_919873 ?auto_919874 ) ) ( not ( = ?auto_919873 ?auto_919876 ) ) ( not ( = ?auto_919873 ?auto_919875 ) ) ( not ( = ?auto_919873 ?auto_919877 ) ) ( not ( = ?auto_919873 ?auto_919878 ) ) ( not ( = ?auto_919873 ?auto_919879 ) ) ( not ( = ?auto_919873 ?auto_919880 ) ) ( not ( = ?auto_919873 ?auto_919882 ) ) ( not ( = ?auto_919874 ?auto_919876 ) ) ( not ( = ?auto_919874 ?auto_919875 ) ) ( not ( = ?auto_919874 ?auto_919877 ) ) ( not ( = ?auto_919874 ?auto_919878 ) ) ( not ( = ?auto_919874 ?auto_919879 ) ) ( not ( = ?auto_919874 ?auto_919880 ) ) ( not ( = ?auto_919874 ?auto_919882 ) ) ( not ( = ?auto_919876 ?auto_919875 ) ) ( not ( = ?auto_919876 ?auto_919877 ) ) ( not ( = ?auto_919876 ?auto_919878 ) ) ( not ( = ?auto_919876 ?auto_919879 ) ) ( not ( = ?auto_919876 ?auto_919880 ) ) ( not ( = ?auto_919876 ?auto_919882 ) ) ( not ( = ?auto_919875 ?auto_919877 ) ) ( not ( = ?auto_919875 ?auto_919878 ) ) ( not ( = ?auto_919875 ?auto_919879 ) ) ( not ( = ?auto_919875 ?auto_919880 ) ) ( not ( = ?auto_919875 ?auto_919882 ) ) ( not ( = ?auto_919877 ?auto_919878 ) ) ( not ( = ?auto_919877 ?auto_919879 ) ) ( not ( = ?auto_919877 ?auto_919880 ) ) ( not ( = ?auto_919877 ?auto_919882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919878 ?auto_919879 ?auto_919880 )
      ( MAKE-8CRATE-VERIFY ?auto_919872 ?auto_919873 ?auto_919874 ?auto_919876 ?auto_919875 ?auto_919877 ?auto_919878 ?auto_919879 ?auto_919880 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_919965 - SURFACE
      ?auto_919966 - SURFACE
      ?auto_919967 - SURFACE
      ?auto_919969 - SURFACE
      ?auto_919968 - SURFACE
      ?auto_919970 - SURFACE
      ?auto_919971 - SURFACE
      ?auto_919972 - SURFACE
      ?auto_919973 - SURFACE
    )
    :vars
    (
      ?auto_919974 - HOIST
      ?auto_919978 - PLACE
      ?auto_919979 - PLACE
      ?auto_919976 - HOIST
      ?auto_919975 - SURFACE
      ?auto_919977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_919974 ?auto_919978 ) ( SURFACE-AT ?auto_919972 ?auto_919978 ) ( CLEAR ?auto_919972 ) ( IS-CRATE ?auto_919973 ) ( not ( = ?auto_919972 ?auto_919973 ) ) ( AVAILABLE ?auto_919974 ) ( ON ?auto_919972 ?auto_919971 ) ( not ( = ?auto_919971 ?auto_919972 ) ) ( not ( = ?auto_919971 ?auto_919973 ) ) ( not ( = ?auto_919979 ?auto_919978 ) ) ( HOIST-AT ?auto_919976 ?auto_919979 ) ( not ( = ?auto_919974 ?auto_919976 ) ) ( AVAILABLE ?auto_919976 ) ( SURFACE-AT ?auto_919973 ?auto_919979 ) ( ON ?auto_919973 ?auto_919975 ) ( CLEAR ?auto_919973 ) ( not ( = ?auto_919972 ?auto_919975 ) ) ( not ( = ?auto_919973 ?auto_919975 ) ) ( not ( = ?auto_919971 ?auto_919975 ) ) ( TRUCK-AT ?auto_919977 ?auto_919978 ) ( ON ?auto_919966 ?auto_919965 ) ( ON ?auto_919967 ?auto_919966 ) ( ON ?auto_919969 ?auto_919967 ) ( ON ?auto_919968 ?auto_919969 ) ( ON ?auto_919970 ?auto_919968 ) ( ON ?auto_919971 ?auto_919970 ) ( not ( = ?auto_919965 ?auto_919966 ) ) ( not ( = ?auto_919965 ?auto_919967 ) ) ( not ( = ?auto_919965 ?auto_919969 ) ) ( not ( = ?auto_919965 ?auto_919968 ) ) ( not ( = ?auto_919965 ?auto_919970 ) ) ( not ( = ?auto_919965 ?auto_919971 ) ) ( not ( = ?auto_919965 ?auto_919972 ) ) ( not ( = ?auto_919965 ?auto_919973 ) ) ( not ( = ?auto_919965 ?auto_919975 ) ) ( not ( = ?auto_919966 ?auto_919967 ) ) ( not ( = ?auto_919966 ?auto_919969 ) ) ( not ( = ?auto_919966 ?auto_919968 ) ) ( not ( = ?auto_919966 ?auto_919970 ) ) ( not ( = ?auto_919966 ?auto_919971 ) ) ( not ( = ?auto_919966 ?auto_919972 ) ) ( not ( = ?auto_919966 ?auto_919973 ) ) ( not ( = ?auto_919966 ?auto_919975 ) ) ( not ( = ?auto_919967 ?auto_919969 ) ) ( not ( = ?auto_919967 ?auto_919968 ) ) ( not ( = ?auto_919967 ?auto_919970 ) ) ( not ( = ?auto_919967 ?auto_919971 ) ) ( not ( = ?auto_919967 ?auto_919972 ) ) ( not ( = ?auto_919967 ?auto_919973 ) ) ( not ( = ?auto_919967 ?auto_919975 ) ) ( not ( = ?auto_919969 ?auto_919968 ) ) ( not ( = ?auto_919969 ?auto_919970 ) ) ( not ( = ?auto_919969 ?auto_919971 ) ) ( not ( = ?auto_919969 ?auto_919972 ) ) ( not ( = ?auto_919969 ?auto_919973 ) ) ( not ( = ?auto_919969 ?auto_919975 ) ) ( not ( = ?auto_919968 ?auto_919970 ) ) ( not ( = ?auto_919968 ?auto_919971 ) ) ( not ( = ?auto_919968 ?auto_919972 ) ) ( not ( = ?auto_919968 ?auto_919973 ) ) ( not ( = ?auto_919968 ?auto_919975 ) ) ( not ( = ?auto_919970 ?auto_919971 ) ) ( not ( = ?auto_919970 ?auto_919972 ) ) ( not ( = ?auto_919970 ?auto_919973 ) ) ( not ( = ?auto_919970 ?auto_919975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919971 ?auto_919972 ?auto_919973 )
      ( MAKE-8CRATE-VERIFY ?auto_919965 ?auto_919966 ?auto_919967 ?auto_919969 ?auto_919968 ?auto_919970 ?auto_919971 ?auto_919972 ?auto_919973 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920058 - SURFACE
      ?auto_920059 - SURFACE
      ?auto_920060 - SURFACE
      ?auto_920062 - SURFACE
      ?auto_920061 - SURFACE
      ?auto_920063 - SURFACE
      ?auto_920064 - SURFACE
      ?auto_920065 - SURFACE
      ?auto_920066 - SURFACE
    )
    :vars
    (
      ?auto_920071 - HOIST
      ?auto_920069 - PLACE
      ?auto_920070 - PLACE
      ?auto_920068 - HOIST
      ?auto_920072 - SURFACE
      ?auto_920067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920071 ?auto_920069 ) ( IS-CRATE ?auto_920066 ) ( not ( = ?auto_920065 ?auto_920066 ) ) ( not ( = ?auto_920064 ?auto_920065 ) ) ( not ( = ?auto_920064 ?auto_920066 ) ) ( not ( = ?auto_920070 ?auto_920069 ) ) ( HOIST-AT ?auto_920068 ?auto_920070 ) ( not ( = ?auto_920071 ?auto_920068 ) ) ( AVAILABLE ?auto_920068 ) ( SURFACE-AT ?auto_920066 ?auto_920070 ) ( ON ?auto_920066 ?auto_920072 ) ( CLEAR ?auto_920066 ) ( not ( = ?auto_920065 ?auto_920072 ) ) ( not ( = ?auto_920066 ?auto_920072 ) ) ( not ( = ?auto_920064 ?auto_920072 ) ) ( TRUCK-AT ?auto_920067 ?auto_920069 ) ( SURFACE-AT ?auto_920064 ?auto_920069 ) ( CLEAR ?auto_920064 ) ( LIFTING ?auto_920071 ?auto_920065 ) ( IS-CRATE ?auto_920065 ) ( ON ?auto_920059 ?auto_920058 ) ( ON ?auto_920060 ?auto_920059 ) ( ON ?auto_920062 ?auto_920060 ) ( ON ?auto_920061 ?auto_920062 ) ( ON ?auto_920063 ?auto_920061 ) ( ON ?auto_920064 ?auto_920063 ) ( not ( = ?auto_920058 ?auto_920059 ) ) ( not ( = ?auto_920058 ?auto_920060 ) ) ( not ( = ?auto_920058 ?auto_920062 ) ) ( not ( = ?auto_920058 ?auto_920061 ) ) ( not ( = ?auto_920058 ?auto_920063 ) ) ( not ( = ?auto_920058 ?auto_920064 ) ) ( not ( = ?auto_920058 ?auto_920065 ) ) ( not ( = ?auto_920058 ?auto_920066 ) ) ( not ( = ?auto_920058 ?auto_920072 ) ) ( not ( = ?auto_920059 ?auto_920060 ) ) ( not ( = ?auto_920059 ?auto_920062 ) ) ( not ( = ?auto_920059 ?auto_920061 ) ) ( not ( = ?auto_920059 ?auto_920063 ) ) ( not ( = ?auto_920059 ?auto_920064 ) ) ( not ( = ?auto_920059 ?auto_920065 ) ) ( not ( = ?auto_920059 ?auto_920066 ) ) ( not ( = ?auto_920059 ?auto_920072 ) ) ( not ( = ?auto_920060 ?auto_920062 ) ) ( not ( = ?auto_920060 ?auto_920061 ) ) ( not ( = ?auto_920060 ?auto_920063 ) ) ( not ( = ?auto_920060 ?auto_920064 ) ) ( not ( = ?auto_920060 ?auto_920065 ) ) ( not ( = ?auto_920060 ?auto_920066 ) ) ( not ( = ?auto_920060 ?auto_920072 ) ) ( not ( = ?auto_920062 ?auto_920061 ) ) ( not ( = ?auto_920062 ?auto_920063 ) ) ( not ( = ?auto_920062 ?auto_920064 ) ) ( not ( = ?auto_920062 ?auto_920065 ) ) ( not ( = ?auto_920062 ?auto_920066 ) ) ( not ( = ?auto_920062 ?auto_920072 ) ) ( not ( = ?auto_920061 ?auto_920063 ) ) ( not ( = ?auto_920061 ?auto_920064 ) ) ( not ( = ?auto_920061 ?auto_920065 ) ) ( not ( = ?auto_920061 ?auto_920066 ) ) ( not ( = ?auto_920061 ?auto_920072 ) ) ( not ( = ?auto_920063 ?auto_920064 ) ) ( not ( = ?auto_920063 ?auto_920065 ) ) ( not ( = ?auto_920063 ?auto_920066 ) ) ( not ( = ?auto_920063 ?auto_920072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920064 ?auto_920065 ?auto_920066 )
      ( MAKE-8CRATE-VERIFY ?auto_920058 ?auto_920059 ?auto_920060 ?auto_920062 ?auto_920061 ?auto_920063 ?auto_920064 ?auto_920065 ?auto_920066 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920151 - SURFACE
      ?auto_920152 - SURFACE
      ?auto_920153 - SURFACE
      ?auto_920155 - SURFACE
      ?auto_920154 - SURFACE
      ?auto_920156 - SURFACE
      ?auto_920157 - SURFACE
      ?auto_920158 - SURFACE
      ?auto_920159 - SURFACE
    )
    :vars
    (
      ?auto_920160 - HOIST
      ?auto_920162 - PLACE
      ?auto_920161 - PLACE
      ?auto_920165 - HOIST
      ?auto_920164 - SURFACE
      ?auto_920163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920160 ?auto_920162 ) ( IS-CRATE ?auto_920159 ) ( not ( = ?auto_920158 ?auto_920159 ) ) ( not ( = ?auto_920157 ?auto_920158 ) ) ( not ( = ?auto_920157 ?auto_920159 ) ) ( not ( = ?auto_920161 ?auto_920162 ) ) ( HOIST-AT ?auto_920165 ?auto_920161 ) ( not ( = ?auto_920160 ?auto_920165 ) ) ( AVAILABLE ?auto_920165 ) ( SURFACE-AT ?auto_920159 ?auto_920161 ) ( ON ?auto_920159 ?auto_920164 ) ( CLEAR ?auto_920159 ) ( not ( = ?auto_920158 ?auto_920164 ) ) ( not ( = ?auto_920159 ?auto_920164 ) ) ( not ( = ?auto_920157 ?auto_920164 ) ) ( TRUCK-AT ?auto_920163 ?auto_920162 ) ( SURFACE-AT ?auto_920157 ?auto_920162 ) ( CLEAR ?auto_920157 ) ( IS-CRATE ?auto_920158 ) ( AVAILABLE ?auto_920160 ) ( IN ?auto_920158 ?auto_920163 ) ( ON ?auto_920152 ?auto_920151 ) ( ON ?auto_920153 ?auto_920152 ) ( ON ?auto_920155 ?auto_920153 ) ( ON ?auto_920154 ?auto_920155 ) ( ON ?auto_920156 ?auto_920154 ) ( ON ?auto_920157 ?auto_920156 ) ( not ( = ?auto_920151 ?auto_920152 ) ) ( not ( = ?auto_920151 ?auto_920153 ) ) ( not ( = ?auto_920151 ?auto_920155 ) ) ( not ( = ?auto_920151 ?auto_920154 ) ) ( not ( = ?auto_920151 ?auto_920156 ) ) ( not ( = ?auto_920151 ?auto_920157 ) ) ( not ( = ?auto_920151 ?auto_920158 ) ) ( not ( = ?auto_920151 ?auto_920159 ) ) ( not ( = ?auto_920151 ?auto_920164 ) ) ( not ( = ?auto_920152 ?auto_920153 ) ) ( not ( = ?auto_920152 ?auto_920155 ) ) ( not ( = ?auto_920152 ?auto_920154 ) ) ( not ( = ?auto_920152 ?auto_920156 ) ) ( not ( = ?auto_920152 ?auto_920157 ) ) ( not ( = ?auto_920152 ?auto_920158 ) ) ( not ( = ?auto_920152 ?auto_920159 ) ) ( not ( = ?auto_920152 ?auto_920164 ) ) ( not ( = ?auto_920153 ?auto_920155 ) ) ( not ( = ?auto_920153 ?auto_920154 ) ) ( not ( = ?auto_920153 ?auto_920156 ) ) ( not ( = ?auto_920153 ?auto_920157 ) ) ( not ( = ?auto_920153 ?auto_920158 ) ) ( not ( = ?auto_920153 ?auto_920159 ) ) ( not ( = ?auto_920153 ?auto_920164 ) ) ( not ( = ?auto_920155 ?auto_920154 ) ) ( not ( = ?auto_920155 ?auto_920156 ) ) ( not ( = ?auto_920155 ?auto_920157 ) ) ( not ( = ?auto_920155 ?auto_920158 ) ) ( not ( = ?auto_920155 ?auto_920159 ) ) ( not ( = ?auto_920155 ?auto_920164 ) ) ( not ( = ?auto_920154 ?auto_920156 ) ) ( not ( = ?auto_920154 ?auto_920157 ) ) ( not ( = ?auto_920154 ?auto_920158 ) ) ( not ( = ?auto_920154 ?auto_920159 ) ) ( not ( = ?auto_920154 ?auto_920164 ) ) ( not ( = ?auto_920156 ?auto_920157 ) ) ( not ( = ?auto_920156 ?auto_920158 ) ) ( not ( = ?auto_920156 ?auto_920159 ) ) ( not ( = ?auto_920156 ?auto_920164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920157 ?auto_920158 ?auto_920159 )
      ( MAKE-8CRATE-VERIFY ?auto_920151 ?auto_920152 ?auto_920153 ?auto_920155 ?auto_920154 ?auto_920156 ?auto_920157 ?auto_920158 ?auto_920159 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924267 - SURFACE
      ?auto_924268 - SURFACE
      ?auto_924269 - SURFACE
      ?auto_924271 - SURFACE
      ?auto_924270 - SURFACE
      ?auto_924272 - SURFACE
      ?auto_924273 - SURFACE
      ?auto_924274 - SURFACE
      ?auto_924275 - SURFACE
      ?auto_924276 - SURFACE
    )
    :vars
    (
      ?auto_924277 - HOIST
      ?auto_924278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_924277 ?auto_924278 ) ( SURFACE-AT ?auto_924275 ?auto_924278 ) ( CLEAR ?auto_924275 ) ( LIFTING ?auto_924277 ?auto_924276 ) ( IS-CRATE ?auto_924276 ) ( not ( = ?auto_924275 ?auto_924276 ) ) ( ON ?auto_924268 ?auto_924267 ) ( ON ?auto_924269 ?auto_924268 ) ( ON ?auto_924271 ?auto_924269 ) ( ON ?auto_924270 ?auto_924271 ) ( ON ?auto_924272 ?auto_924270 ) ( ON ?auto_924273 ?auto_924272 ) ( ON ?auto_924274 ?auto_924273 ) ( ON ?auto_924275 ?auto_924274 ) ( not ( = ?auto_924267 ?auto_924268 ) ) ( not ( = ?auto_924267 ?auto_924269 ) ) ( not ( = ?auto_924267 ?auto_924271 ) ) ( not ( = ?auto_924267 ?auto_924270 ) ) ( not ( = ?auto_924267 ?auto_924272 ) ) ( not ( = ?auto_924267 ?auto_924273 ) ) ( not ( = ?auto_924267 ?auto_924274 ) ) ( not ( = ?auto_924267 ?auto_924275 ) ) ( not ( = ?auto_924267 ?auto_924276 ) ) ( not ( = ?auto_924268 ?auto_924269 ) ) ( not ( = ?auto_924268 ?auto_924271 ) ) ( not ( = ?auto_924268 ?auto_924270 ) ) ( not ( = ?auto_924268 ?auto_924272 ) ) ( not ( = ?auto_924268 ?auto_924273 ) ) ( not ( = ?auto_924268 ?auto_924274 ) ) ( not ( = ?auto_924268 ?auto_924275 ) ) ( not ( = ?auto_924268 ?auto_924276 ) ) ( not ( = ?auto_924269 ?auto_924271 ) ) ( not ( = ?auto_924269 ?auto_924270 ) ) ( not ( = ?auto_924269 ?auto_924272 ) ) ( not ( = ?auto_924269 ?auto_924273 ) ) ( not ( = ?auto_924269 ?auto_924274 ) ) ( not ( = ?auto_924269 ?auto_924275 ) ) ( not ( = ?auto_924269 ?auto_924276 ) ) ( not ( = ?auto_924271 ?auto_924270 ) ) ( not ( = ?auto_924271 ?auto_924272 ) ) ( not ( = ?auto_924271 ?auto_924273 ) ) ( not ( = ?auto_924271 ?auto_924274 ) ) ( not ( = ?auto_924271 ?auto_924275 ) ) ( not ( = ?auto_924271 ?auto_924276 ) ) ( not ( = ?auto_924270 ?auto_924272 ) ) ( not ( = ?auto_924270 ?auto_924273 ) ) ( not ( = ?auto_924270 ?auto_924274 ) ) ( not ( = ?auto_924270 ?auto_924275 ) ) ( not ( = ?auto_924270 ?auto_924276 ) ) ( not ( = ?auto_924272 ?auto_924273 ) ) ( not ( = ?auto_924272 ?auto_924274 ) ) ( not ( = ?auto_924272 ?auto_924275 ) ) ( not ( = ?auto_924272 ?auto_924276 ) ) ( not ( = ?auto_924273 ?auto_924274 ) ) ( not ( = ?auto_924273 ?auto_924275 ) ) ( not ( = ?auto_924273 ?auto_924276 ) ) ( not ( = ?auto_924274 ?auto_924275 ) ) ( not ( = ?auto_924274 ?auto_924276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_924275 ?auto_924276 )
      ( MAKE-9CRATE-VERIFY ?auto_924267 ?auto_924268 ?auto_924269 ?auto_924271 ?auto_924270 ?auto_924272 ?auto_924273 ?auto_924274 ?auto_924275 ?auto_924276 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924347 - SURFACE
      ?auto_924348 - SURFACE
      ?auto_924349 - SURFACE
      ?auto_924351 - SURFACE
      ?auto_924350 - SURFACE
      ?auto_924352 - SURFACE
      ?auto_924353 - SURFACE
      ?auto_924354 - SURFACE
      ?auto_924355 - SURFACE
      ?auto_924356 - SURFACE
    )
    :vars
    (
      ?auto_924359 - HOIST
      ?auto_924357 - PLACE
      ?auto_924358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924359 ?auto_924357 ) ( SURFACE-AT ?auto_924355 ?auto_924357 ) ( CLEAR ?auto_924355 ) ( IS-CRATE ?auto_924356 ) ( not ( = ?auto_924355 ?auto_924356 ) ) ( TRUCK-AT ?auto_924358 ?auto_924357 ) ( AVAILABLE ?auto_924359 ) ( IN ?auto_924356 ?auto_924358 ) ( ON ?auto_924355 ?auto_924354 ) ( not ( = ?auto_924354 ?auto_924355 ) ) ( not ( = ?auto_924354 ?auto_924356 ) ) ( ON ?auto_924348 ?auto_924347 ) ( ON ?auto_924349 ?auto_924348 ) ( ON ?auto_924351 ?auto_924349 ) ( ON ?auto_924350 ?auto_924351 ) ( ON ?auto_924352 ?auto_924350 ) ( ON ?auto_924353 ?auto_924352 ) ( ON ?auto_924354 ?auto_924353 ) ( not ( = ?auto_924347 ?auto_924348 ) ) ( not ( = ?auto_924347 ?auto_924349 ) ) ( not ( = ?auto_924347 ?auto_924351 ) ) ( not ( = ?auto_924347 ?auto_924350 ) ) ( not ( = ?auto_924347 ?auto_924352 ) ) ( not ( = ?auto_924347 ?auto_924353 ) ) ( not ( = ?auto_924347 ?auto_924354 ) ) ( not ( = ?auto_924347 ?auto_924355 ) ) ( not ( = ?auto_924347 ?auto_924356 ) ) ( not ( = ?auto_924348 ?auto_924349 ) ) ( not ( = ?auto_924348 ?auto_924351 ) ) ( not ( = ?auto_924348 ?auto_924350 ) ) ( not ( = ?auto_924348 ?auto_924352 ) ) ( not ( = ?auto_924348 ?auto_924353 ) ) ( not ( = ?auto_924348 ?auto_924354 ) ) ( not ( = ?auto_924348 ?auto_924355 ) ) ( not ( = ?auto_924348 ?auto_924356 ) ) ( not ( = ?auto_924349 ?auto_924351 ) ) ( not ( = ?auto_924349 ?auto_924350 ) ) ( not ( = ?auto_924349 ?auto_924352 ) ) ( not ( = ?auto_924349 ?auto_924353 ) ) ( not ( = ?auto_924349 ?auto_924354 ) ) ( not ( = ?auto_924349 ?auto_924355 ) ) ( not ( = ?auto_924349 ?auto_924356 ) ) ( not ( = ?auto_924351 ?auto_924350 ) ) ( not ( = ?auto_924351 ?auto_924352 ) ) ( not ( = ?auto_924351 ?auto_924353 ) ) ( not ( = ?auto_924351 ?auto_924354 ) ) ( not ( = ?auto_924351 ?auto_924355 ) ) ( not ( = ?auto_924351 ?auto_924356 ) ) ( not ( = ?auto_924350 ?auto_924352 ) ) ( not ( = ?auto_924350 ?auto_924353 ) ) ( not ( = ?auto_924350 ?auto_924354 ) ) ( not ( = ?auto_924350 ?auto_924355 ) ) ( not ( = ?auto_924350 ?auto_924356 ) ) ( not ( = ?auto_924352 ?auto_924353 ) ) ( not ( = ?auto_924352 ?auto_924354 ) ) ( not ( = ?auto_924352 ?auto_924355 ) ) ( not ( = ?auto_924352 ?auto_924356 ) ) ( not ( = ?auto_924353 ?auto_924354 ) ) ( not ( = ?auto_924353 ?auto_924355 ) ) ( not ( = ?auto_924353 ?auto_924356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924354 ?auto_924355 ?auto_924356 )
      ( MAKE-9CRATE-VERIFY ?auto_924347 ?auto_924348 ?auto_924349 ?auto_924351 ?auto_924350 ?auto_924352 ?auto_924353 ?auto_924354 ?auto_924355 ?auto_924356 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924437 - SURFACE
      ?auto_924438 - SURFACE
      ?auto_924439 - SURFACE
      ?auto_924441 - SURFACE
      ?auto_924440 - SURFACE
      ?auto_924442 - SURFACE
      ?auto_924443 - SURFACE
      ?auto_924444 - SURFACE
      ?auto_924445 - SURFACE
      ?auto_924446 - SURFACE
    )
    :vars
    (
      ?auto_924449 - HOIST
      ?auto_924447 - PLACE
      ?auto_924450 - TRUCK
      ?auto_924448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_924449 ?auto_924447 ) ( SURFACE-AT ?auto_924445 ?auto_924447 ) ( CLEAR ?auto_924445 ) ( IS-CRATE ?auto_924446 ) ( not ( = ?auto_924445 ?auto_924446 ) ) ( AVAILABLE ?auto_924449 ) ( IN ?auto_924446 ?auto_924450 ) ( ON ?auto_924445 ?auto_924444 ) ( not ( = ?auto_924444 ?auto_924445 ) ) ( not ( = ?auto_924444 ?auto_924446 ) ) ( TRUCK-AT ?auto_924450 ?auto_924448 ) ( not ( = ?auto_924448 ?auto_924447 ) ) ( ON ?auto_924438 ?auto_924437 ) ( ON ?auto_924439 ?auto_924438 ) ( ON ?auto_924441 ?auto_924439 ) ( ON ?auto_924440 ?auto_924441 ) ( ON ?auto_924442 ?auto_924440 ) ( ON ?auto_924443 ?auto_924442 ) ( ON ?auto_924444 ?auto_924443 ) ( not ( = ?auto_924437 ?auto_924438 ) ) ( not ( = ?auto_924437 ?auto_924439 ) ) ( not ( = ?auto_924437 ?auto_924441 ) ) ( not ( = ?auto_924437 ?auto_924440 ) ) ( not ( = ?auto_924437 ?auto_924442 ) ) ( not ( = ?auto_924437 ?auto_924443 ) ) ( not ( = ?auto_924437 ?auto_924444 ) ) ( not ( = ?auto_924437 ?auto_924445 ) ) ( not ( = ?auto_924437 ?auto_924446 ) ) ( not ( = ?auto_924438 ?auto_924439 ) ) ( not ( = ?auto_924438 ?auto_924441 ) ) ( not ( = ?auto_924438 ?auto_924440 ) ) ( not ( = ?auto_924438 ?auto_924442 ) ) ( not ( = ?auto_924438 ?auto_924443 ) ) ( not ( = ?auto_924438 ?auto_924444 ) ) ( not ( = ?auto_924438 ?auto_924445 ) ) ( not ( = ?auto_924438 ?auto_924446 ) ) ( not ( = ?auto_924439 ?auto_924441 ) ) ( not ( = ?auto_924439 ?auto_924440 ) ) ( not ( = ?auto_924439 ?auto_924442 ) ) ( not ( = ?auto_924439 ?auto_924443 ) ) ( not ( = ?auto_924439 ?auto_924444 ) ) ( not ( = ?auto_924439 ?auto_924445 ) ) ( not ( = ?auto_924439 ?auto_924446 ) ) ( not ( = ?auto_924441 ?auto_924440 ) ) ( not ( = ?auto_924441 ?auto_924442 ) ) ( not ( = ?auto_924441 ?auto_924443 ) ) ( not ( = ?auto_924441 ?auto_924444 ) ) ( not ( = ?auto_924441 ?auto_924445 ) ) ( not ( = ?auto_924441 ?auto_924446 ) ) ( not ( = ?auto_924440 ?auto_924442 ) ) ( not ( = ?auto_924440 ?auto_924443 ) ) ( not ( = ?auto_924440 ?auto_924444 ) ) ( not ( = ?auto_924440 ?auto_924445 ) ) ( not ( = ?auto_924440 ?auto_924446 ) ) ( not ( = ?auto_924442 ?auto_924443 ) ) ( not ( = ?auto_924442 ?auto_924444 ) ) ( not ( = ?auto_924442 ?auto_924445 ) ) ( not ( = ?auto_924442 ?auto_924446 ) ) ( not ( = ?auto_924443 ?auto_924444 ) ) ( not ( = ?auto_924443 ?auto_924445 ) ) ( not ( = ?auto_924443 ?auto_924446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924444 ?auto_924445 ?auto_924446 )
      ( MAKE-9CRATE-VERIFY ?auto_924437 ?auto_924438 ?auto_924439 ?auto_924441 ?auto_924440 ?auto_924442 ?auto_924443 ?auto_924444 ?auto_924445 ?auto_924446 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924536 - SURFACE
      ?auto_924537 - SURFACE
      ?auto_924538 - SURFACE
      ?auto_924540 - SURFACE
      ?auto_924539 - SURFACE
      ?auto_924541 - SURFACE
      ?auto_924542 - SURFACE
      ?auto_924543 - SURFACE
      ?auto_924544 - SURFACE
      ?auto_924545 - SURFACE
    )
    :vars
    (
      ?auto_924547 - HOIST
      ?auto_924546 - PLACE
      ?auto_924548 - TRUCK
      ?auto_924549 - PLACE
      ?auto_924550 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_924547 ?auto_924546 ) ( SURFACE-AT ?auto_924544 ?auto_924546 ) ( CLEAR ?auto_924544 ) ( IS-CRATE ?auto_924545 ) ( not ( = ?auto_924544 ?auto_924545 ) ) ( AVAILABLE ?auto_924547 ) ( ON ?auto_924544 ?auto_924543 ) ( not ( = ?auto_924543 ?auto_924544 ) ) ( not ( = ?auto_924543 ?auto_924545 ) ) ( TRUCK-AT ?auto_924548 ?auto_924549 ) ( not ( = ?auto_924549 ?auto_924546 ) ) ( HOIST-AT ?auto_924550 ?auto_924549 ) ( LIFTING ?auto_924550 ?auto_924545 ) ( not ( = ?auto_924547 ?auto_924550 ) ) ( ON ?auto_924537 ?auto_924536 ) ( ON ?auto_924538 ?auto_924537 ) ( ON ?auto_924540 ?auto_924538 ) ( ON ?auto_924539 ?auto_924540 ) ( ON ?auto_924541 ?auto_924539 ) ( ON ?auto_924542 ?auto_924541 ) ( ON ?auto_924543 ?auto_924542 ) ( not ( = ?auto_924536 ?auto_924537 ) ) ( not ( = ?auto_924536 ?auto_924538 ) ) ( not ( = ?auto_924536 ?auto_924540 ) ) ( not ( = ?auto_924536 ?auto_924539 ) ) ( not ( = ?auto_924536 ?auto_924541 ) ) ( not ( = ?auto_924536 ?auto_924542 ) ) ( not ( = ?auto_924536 ?auto_924543 ) ) ( not ( = ?auto_924536 ?auto_924544 ) ) ( not ( = ?auto_924536 ?auto_924545 ) ) ( not ( = ?auto_924537 ?auto_924538 ) ) ( not ( = ?auto_924537 ?auto_924540 ) ) ( not ( = ?auto_924537 ?auto_924539 ) ) ( not ( = ?auto_924537 ?auto_924541 ) ) ( not ( = ?auto_924537 ?auto_924542 ) ) ( not ( = ?auto_924537 ?auto_924543 ) ) ( not ( = ?auto_924537 ?auto_924544 ) ) ( not ( = ?auto_924537 ?auto_924545 ) ) ( not ( = ?auto_924538 ?auto_924540 ) ) ( not ( = ?auto_924538 ?auto_924539 ) ) ( not ( = ?auto_924538 ?auto_924541 ) ) ( not ( = ?auto_924538 ?auto_924542 ) ) ( not ( = ?auto_924538 ?auto_924543 ) ) ( not ( = ?auto_924538 ?auto_924544 ) ) ( not ( = ?auto_924538 ?auto_924545 ) ) ( not ( = ?auto_924540 ?auto_924539 ) ) ( not ( = ?auto_924540 ?auto_924541 ) ) ( not ( = ?auto_924540 ?auto_924542 ) ) ( not ( = ?auto_924540 ?auto_924543 ) ) ( not ( = ?auto_924540 ?auto_924544 ) ) ( not ( = ?auto_924540 ?auto_924545 ) ) ( not ( = ?auto_924539 ?auto_924541 ) ) ( not ( = ?auto_924539 ?auto_924542 ) ) ( not ( = ?auto_924539 ?auto_924543 ) ) ( not ( = ?auto_924539 ?auto_924544 ) ) ( not ( = ?auto_924539 ?auto_924545 ) ) ( not ( = ?auto_924541 ?auto_924542 ) ) ( not ( = ?auto_924541 ?auto_924543 ) ) ( not ( = ?auto_924541 ?auto_924544 ) ) ( not ( = ?auto_924541 ?auto_924545 ) ) ( not ( = ?auto_924542 ?auto_924543 ) ) ( not ( = ?auto_924542 ?auto_924544 ) ) ( not ( = ?auto_924542 ?auto_924545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924543 ?auto_924544 ?auto_924545 )
      ( MAKE-9CRATE-VERIFY ?auto_924536 ?auto_924537 ?auto_924538 ?auto_924540 ?auto_924539 ?auto_924541 ?auto_924542 ?auto_924543 ?auto_924544 ?auto_924545 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924644 - SURFACE
      ?auto_924645 - SURFACE
      ?auto_924646 - SURFACE
      ?auto_924648 - SURFACE
      ?auto_924647 - SURFACE
      ?auto_924649 - SURFACE
      ?auto_924650 - SURFACE
      ?auto_924651 - SURFACE
      ?auto_924652 - SURFACE
      ?auto_924653 - SURFACE
    )
    :vars
    (
      ?auto_924654 - HOIST
      ?auto_924659 - PLACE
      ?auto_924658 - TRUCK
      ?auto_924655 - PLACE
      ?auto_924657 - HOIST
      ?auto_924656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_924654 ?auto_924659 ) ( SURFACE-AT ?auto_924652 ?auto_924659 ) ( CLEAR ?auto_924652 ) ( IS-CRATE ?auto_924653 ) ( not ( = ?auto_924652 ?auto_924653 ) ) ( AVAILABLE ?auto_924654 ) ( ON ?auto_924652 ?auto_924651 ) ( not ( = ?auto_924651 ?auto_924652 ) ) ( not ( = ?auto_924651 ?auto_924653 ) ) ( TRUCK-AT ?auto_924658 ?auto_924655 ) ( not ( = ?auto_924655 ?auto_924659 ) ) ( HOIST-AT ?auto_924657 ?auto_924655 ) ( not ( = ?auto_924654 ?auto_924657 ) ) ( AVAILABLE ?auto_924657 ) ( SURFACE-AT ?auto_924653 ?auto_924655 ) ( ON ?auto_924653 ?auto_924656 ) ( CLEAR ?auto_924653 ) ( not ( = ?auto_924652 ?auto_924656 ) ) ( not ( = ?auto_924653 ?auto_924656 ) ) ( not ( = ?auto_924651 ?auto_924656 ) ) ( ON ?auto_924645 ?auto_924644 ) ( ON ?auto_924646 ?auto_924645 ) ( ON ?auto_924648 ?auto_924646 ) ( ON ?auto_924647 ?auto_924648 ) ( ON ?auto_924649 ?auto_924647 ) ( ON ?auto_924650 ?auto_924649 ) ( ON ?auto_924651 ?auto_924650 ) ( not ( = ?auto_924644 ?auto_924645 ) ) ( not ( = ?auto_924644 ?auto_924646 ) ) ( not ( = ?auto_924644 ?auto_924648 ) ) ( not ( = ?auto_924644 ?auto_924647 ) ) ( not ( = ?auto_924644 ?auto_924649 ) ) ( not ( = ?auto_924644 ?auto_924650 ) ) ( not ( = ?auto_924644 ?auto_924651 ) ) ( not ( = ?auto_924644 ?auto_924652 ) ) ( not ( = ?auto_924644 ?auto_924653 ) ) ( not ( = ?auto_924644 ?auto_924656 ) ) ( not ( = ?auto_924645 ?auto_924646 ) ) ( not ( = ?auto_924645 ?auto_924648 ) ) ( not ( = ?auto_924645 ?auto_924647 ) ) ( not ( = ?auto_924645 ?auto_924649 ) ) ( not ( = ?auto_924645 ?auto_924650 ) ) ( not ( = ?auto_924645 ?auto_924651 ) ) ( not ( = ?auto_924645 ?auto_924652 ) ) ( not ( = ?auto_924645 ?auto_924653 ) ) ( not ( = ?auto_924645 ?auto_924656 ) ) ( not ( = ?auto_924646 ?auto_924648 ) ) ( not ( = ?auto_924646 ?auto_924647 ) ) ( not ( = ?auto_924646 ?auto_924649 ) ) ( not ( = ?auto_924646 ?auto_924650 ) ) ( not ( = ?auto_924646 ?auto_924651 ) ) ( not ( = ?auto_924646 ?auto_924652 ) ) ( not ( = ?auto_924646 ?auto_924653 ) ) ( not ( = ?auto_924646 ?auto_924656 ) ) ( not ( = ?auto_924648 ?auto_924647 ) ) ( not ( = ?auto_924648 ?auto_924649 ) ) ( not ( = ?auto_924648 ?auto_924650 ) ) ( not ( = ?auto_924648 ?auto_924651 ) ) ( not ( = ?auto_924648 ?auto_924652 ) ) ( not ( = ?auto_924648 ?auto_924653 ) ) ( not ( = ?auto_924648 ?auto_924656 ) ) ( not ( = ?auto_924647 ?auto_924649 ) ) ( not ( = ?auto_924647 ?auto_924650 ) ) ( not ( = ?auto_924647 ?auto_924651 ) ) ( not ( = ?auto_924647 ?auto_924652 ) ) ( not ( = ?auto_924647 ?auto_924653 ) ) ( not ( = ?auto_924647 ?auto_924656 ) ) ( not ( = ?auto_924649 ?auto_924650 ) ) ( not ( = ?auto_924649 ?auto_924651 ) ) ( not ( = ?auto_924649 ?auto_924652 ) ) ( not ( = ?auto_924649 ?auto_924653 ) ) ( not ( = ?auto_924649 ?auto_924656 ) ) ( not ( = ?auto_924650 ?auto_924651 ) ) ( not ( = ?auto_924650 ?auto_924652 ) ) ( not ( = ?auto_924650 ?auto_924653 ) ) ( not ( = ?auto_924650 ?auto_924656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924651 ?auto_924652 ?auto_924653 )
      ( MAKE-9CRATE-VERIFY ?auto_924644 ?auto_924645 ?auto_924646 ?auto_924648 ?auto_924647 ?auto_924649 ?auto_924650 ?auto_924651 ?auto_924652 ?auto_924653 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924753 - SURFACE
      ?auto_924754 - SURFACE
      ?auto_924755 - SURFACE
      ?auto_924757 - SURFACE
      ?auto_924756 - SURFACE
      ?auto_924758 - SURFACE
      ?auto_924759 - SURFACE
      ?auto_924760 - SURFACE
      ?auto_924761 - SURFACE
      ?auto_924762 - SURFACE
    )
    :vars
    (
      ?auto_924767 - HOIST
      ?auto_924764 - PLACE
      ?auto_924765 - PLACE
      ?auto_924768 - HOIST
      ?auto_924766 - SURFACE
      ?auto_924763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924767 ?auto_924764 ) ( SURFACE-AT ?auto_924761 ?auto_924764 ) ( CLEAR ?auto_924761 ) ( IS-CRATE ?auto_924762 ) ( not ( = ?auto_924761 ?auto_924762 ) ) ( AVAILABLE ?auto_924767 ) ( ON ?auto_924761 ?auto_924760 ) ( not ( = ?auto_924760 ?auto_924761 ) ) ( not ( = ?auto_924760 ?auto_924762 ) ) ( not ( = ?auto_924765 ?auto_924764 ) ) ( HOIST-AT ?auto_924768 ?auto_924765 ) ( not ( = ?auto_924767 ?auto_924768 ) ) ( AVAILABLE ?auto_924768 ) ( SURFACE-AT ?auto_924762 ?auto_924765 ) ( ON ?auto_924762 ?auto_924766 ) ( CLEAR ?auto_924762 ) ( not ( = ?auto_924761 ?auto_924766 ) ) ( not ( = ?auto_924762 ?auto_924766 ) ) ( not ( = ?auto_924760 ?auto_924766 ) ) ( TRUCK-AT ?auto_924763 ?auto_924764 ) ( ON ?auto_924754 ?auto_924753 ) ( ON ?auto_924755 ?auto_924754 ) ( ON ?auto_924757 ?auto_924755 ) ( ON ?auto_924756 ?auto_924757 ) ( ON ?auto_924758 ?auto_924756 ) ( ON ?auto_924759 ?auto_924758 ) ( ON ?auto_924760 ?auto_924759 ) ( not ( = ?auto_924753 ?auto_924754 ) ) ( not ( = ?auto_924753 ?auto_924755 ) ) ( not ( = ?auto_924753 ?auto_924757 ) ) ( not ( = ?auto_924753 ?auto_924756 ) ) ( not ( = ?auto_924753 ?auto_924758 ) ) ( not ( = ?auto_924753 ?auto_924759 ) ) ( not ( = ?auto_924753 ?auto_924760 ) ) ( not ( = ?auto_924753 ?auto_924761 ) ) ( not ( = ?auto_924753 ?auto_924762 ) ) ( not ( = ?auto_924753 ?auto_924766 ) ) ( not ( = ?auto_924754 ?auto_924755 ) ) ( not ( = ?auto_924754 ?auto_924757 ) ) ( not ( = ?auto_924754 ?auto_924756 ) ) ( not ( = ?auto_924754 ?auto_924758 ) ) ( not ( = ?auto_924754 ?auto_924759 ) ) ( not ( = ?auto_924754 ?auto_924760 ) ) ( not ( = ?auto_924754 ?auto_924761 ) ) ( not ( = ?auto_924754 ?auto_924762 ) ) ( not ( = ?auto_924754 ?auto_924766 ) ) ( not ( = ?auto_924755 ?auto_924757 ) ) ( not ( = ?auto_924755 ?auto_924756 ) ) ( not ( = ?auto_924755 ?auto_924758 ) ) ( not ( = ?auto_924755 ?auto_924759 ) ) ( not ( = ?auto_924755 ?auto_924760 ) ) ( not ( = ?auto_924755 ?auto_924761 ) ) ( not ( = ?auto_924755 ?auto_924762 ) ) ( not ( = ?auto_924755 ?auto_924766 ) ) ( not ( = ?auto_924757 ?auto_924756 ) ) ( not ( = ?auto_924757 ?auto_924758 ) ) ( not ( = ?auto_924757 ?auto_924759 ) ) ( not ( = ?auto_924757 ?auto_924760 ) ) ( not ( = ?auto_924757 ?auto_924761 ) ) ( not ( = ?auto_924757 ?auto_924762 ) ) ( not ( = ?auto_924757 ?auto_924766 ) ) ( not ( = ?auto_924756 ?auto_924758 ) ) ( not ( = ?auto_924756 ?auto_924759 ) ) ( not ( = ?auto_924756 ?auto_924760 ) ) ( not ( = ?auto_924756 ?auto_924761 ) ) ( not ( = ?auto_924756 ?auto_924762 ) ) ( not ( = ?auto_924756 ?auto_924766 ) ) ( not ( = ?auto_924758 ?auto_924759 ) ) ( not ( = ?auto_924758 ?auto_924760 ) ) ( not ( = ?auto_924758 ?auto_924761 ) ) ( not ( = ?auto_924758 ?auto_924762 ) ) ( not ( = ?auto_924758 ?auto_924766 ) ) ( not ( = ?auto_924759 ?auto_924760 ) ) ( not ( = ?auto_924759 ?auto_924761 ) ) ( not ( = ?auto_924759 ?auto_924762 ) ) ( not ( = ?auto_924759 ?auto_924766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924760 ?auto_924761 ?auto_924762 )
      ( MAKE-9CRATE-VERIFY ?auto_924753 ?auto_924754 ?auto_924755 ?auto_924757 ?auto_924756 ?auto_924758 ?auto_924759 ?auto_924760 ?auto_924761 ?auto_924762 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924862 - SURFACE
      ?auto_924863 - SURFACE
      ?auto_924864 - SURFACE
      ?auto_924866 - SURFACE
      ?auto_924865 - SURFACE
      ?auto_924867 - SURFACE
      ?auto_924868 - SURFACE
      ?auto_924869 - SURFACE
      ?auto_924870 - SURFACE
      ?auto_924871 - SURFACE
    )
    :vars
    (
      ?auto_924873 - HOIST
      ?auto_924874 - PLACE
      ?auto_924876 - PLACE
      ?auto_924872 - HOIST
      ?auto_924875 - SURFACE
      ?auto_924877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924873 ?auto_924874 ) ( IS-CRATE ?auto_924871 ) ( not ( = ?auto_924870 ?auto_924871 ) ) ( not ( = ?auto_924869 ?auto_924870 ) ) ( not ( = ?auto_924869 ?auto_924871 ) ) ( not ( = ?auto_924876 ?auto_924874 ) ) ( HOIST-AT ?auto_924872 ?auto_924876 ) ( not ( = ?auto_924873 ?auto_924872 ) ) ( AVAILABLE ?auto_924872 ) ( SURFACE-AT ?auto_924871 ?auto_924876 ) ( ON ?auto_924871 ?auto_924875 ) ( CLEAR ?auto_924871 ) ( not ( = ?auto_924870 ?auto_924875 ) ) ( not ( = ?auto_924871 ?auto_924875 ) ) ( not ( = ?auto_924869 ?auto_924875 ) ) ( TRUCK-AT ?auto_924877 ?auto_924874 ) ( SURFACE-AT ?auto_924869 ?auto_924874 ) ( CLEAR ?auto_924869 ) ( LIFTING ?auto_924873 ?auto_924870 ) ( IS-CRATE ?auto_924870 ) ( ON ?auto_924863 ?auto_924862 ) ( ON ?auto_924864 ?auto_924863 ) ( ON ?auto_924866 ?auto_924864 ) ( ON ?auto_924865 ?auto_924866 ) ( ON ?auto_924867 ?auto_924865 ) ( ON ?auto_924868 ?auto_924867 ) ( ON ?auto_924869 ?auto_924868 ) ( not ( = ?auto_924862 ?auto_924863 ) ) ( not ( = ?auto_924862 ?auto_924864 ) ) ( not ( = ?auto_924862 ?auto_924866 ) ) ( not ( = ?auto_924862 ?auto_924865 ) ) ( not ( = ?auto_924862 ?auto_924867 ) ) ( not ( = ?auto_924862 ?auto_924868 ) ) ( not ( = ?auto_924862 ?auto_924869 ) ) ( not ( = ?auto_924862 ?auto_924870 ) ) ( not ( = ?auto_924862 ?auto_924871 ) ) ( not ( = ?auto_924862 ?auto_924875 ) ) ( not ( = ?auto_924863 ?auto_924864 ) ) ( not ( = ?auto_924863 ?auto_924866 ) ) ( not ( = ?auto_924863 ?auto_924865 ) ) ( not ( = ?auto_924863 ?auto_924867 ) ) ( not ( = ?auto_924863 ?auto_924868 ) ) ( not ( = ?auto_924863 ?auto_924869 ) ) ( not ( = ?auto_924863 ?auto_924870 ) ) ( not ( = ?auto_924863 ?auto_924871 ) ) ( not ( = ?auto_924863 ?auto_924875 ) ) ( not ( = ?auto_924864 ?auto_924866 ) ) ( not ( = ?auto_924864 ?auto_924865 ) ) ( not ( = ?auto_924864 ?auto_924867 ) ) ( not ( = ?auto_924864 ?auto_924868 ) ) ( not ( = ?auto_924864 ?auto_924869 ) ) ( not ( = ?auto_924864 ?auto_924870 ) ) ( not ( = ?auto_924864 ?auto_924871 ) ) ( not ( = ?auto_924864 ?auto_924875 ) ) ( not ( = ?auto_924866 ?auto_924865 ) ) ( not ( = ?auto_924866 ?auto_924867 ) ) ( not ( = ?auto_924866 ?auto_924868 ) ) ( not ( = ?auto_924866 ?auto_924869 ) ) ( not ( = ?auto_924866 ?auto_924870 ) ) ( not ( = ?auto_924866 ?auto_924871 ) ) ( not ( = ?auto_924866 ?auto_924875 ) ) ( not ( = ?auto_924865 ?auto_924867 ) ) ( not ( = ?auto_924865 ?auto_924868 ) ) ( not ( = ?auto_924865 ?auto_924869 ) ) ( not ( = ?auto_924865 ?auto_924870 ) ) ( not ( = ?auto_924865 ?auto_924871 ) ) ( not ( = ?auto_924865 ?auto_924875 ) ) ( not ( = ?auto_924867 ?auto_924868 ) ) ( not ( = ?auto_924867 ?auto_924869 ) ) ( not ( = ?auto_924867 ?auto_924870 ) ) ( not ( = ?auto_924867 ?auto_924871 ) ) ( not ( = ?auto_924867 ?auto_924875 ) ) ( not ( = ?auto_924868 ?auto_924869 ) ) ( not ( = ?auto_924868 ?auto_924870 ) ) ( not ( = ?auto_924868 ?auto_924871 ) ) ( not ( = ?auto_924868 ?auto_924875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924869 ?auto_924870 ?auto_924871 )
      ( MAKE-9CRATE-VERIFY ?auto_924862 ?auto_924863 ?auto_924864 ?auto_924866 ?auto_924865 ?auto_924867 ?auto_924868 ?auto_924869 ?auto_924870 ?auto_924871 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924971 - SURFACE
      ?auto_924972 - SURFACE
      ?auto_924973 - SURFACE
      ?auto_924975 - SURFACE
      ?auto_924974 - SURFACE
      ?auto_924976 - SURFACE
      ?auto_924977 - SURFACE
      ?auto_924978 - SURFACE
      ?auto_924979 - SURFACE
      ?auto_924980 - SURFACE
    )
    :vars
    (
      ?auto_924986 - HOIST
      ?auto_924981 - PLACE
      ?auto_924985 - PLACE
      ?auto_924984 - HOIST
      ?auto_924982 - SURFACE
      ?auto_924983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924986 ?auto_924981 ) ( IS-CRATE ?auto_924980 ) ( not ( = ?auto_924979 ?auto_924980 ) ) ( not ( = ?auto_924978 ?auto_924979 ) ) ( not ( = ?auto_924978 ?auto_924980 ) ) ( not ( = ?auto_924985 ?auto_924981 ) ) ( HOIST-AT ?auto_924984 ?auto_924985 ) ( not ( = ?auto_924986 ?auto_924984 ) ) ( AVAILABLE ?auto_924984 ) ( SURFACE-AT ?auto_924980 ?auto_924985 ) ( ON ?auto_924980 ?auto_924982 ) ( CLEAR ?auto_924980 ) ( not ( = ?auto_924979 ?auto_924982 ) ) ( not ( = ?auto_924980 ?auto_924982 ) ) ( not ( = ?auto_924978 ?auto_924982 ) ) ( TRUCK-AT ?auto_924983 ?auto_924981 ) ( SURFACE-AT ?auto_924978 ?auto_924981 ) ( CLEAR ?auto_924978 ) ( IS-CRATE ?auto_924979 ) ( AVAILABLE ?auto_924986 ) ( IN ?auto_924979 ?auto_924983 ) ( ON ?auto_924972 ?auto_924971 ) ( ON ?auto_924973 ?auto_924972 ) ( ON ?auto_924975 ?auto_924973 ) ( ON ?auto_924974 ?auto_924975 ) ( ON ?auto_924976 ?auto_924974 ) ( ON ?auto_924977 ?auto_924976 ) ( ON ?auto_924978 ?auto_924977 ) ( not ( = ?auto_924971 ?auto_924972 ) ) ( not ( = ?auto_924971 ?auto_924973 ) ) ( not ( = ?auto_924971 ?auto_924975 ) ) ( not ( = ?auto_924971 ?auto_924974 ) ) ( not ( = ?auto_924971 ?auto_924976 ) ) ( not ( = ?auto_924971 ?auto_924977 ) ) ( not ( = ?auto_924971 ?auto_924978 ) ) ( not ( = ?auto_924971 ?auto_924979 ) ) ( not ( = ?auto_924971 ?auto_924980 ) ) ( not ( = ?auto_924971 ?auto_924982 ) ) ( not ( = ?auto_924972 ?auto_924973 ) ) ( not ( = ?auto_924972 ?auto_924975 ) ) ( not ( = ?auto_924972 ?auto_924974 ) ) ( not ( = ?auto_924972 ?auto_924976 ) ) ( not ( = ?auto_924972 ?auto_924977 ) ) ( not ( = ?auto_924972 ?auto_924978 ) ) ( not ( = ?auto_924972 ?auto_924979 ) ) ( not ( = ?auto_924972 ?auto_924980 ) ) ( not ( = ?auto_924972 ?auto_924982 ) ) ( not ( = ?auto_924973 ?auto_924975 ) ) ( not ( = ?auto_924973 ?auto_924974 ) ) ( not ( = ?auto_924973 ?auto_924976 ) ) ( not ( = ?auto_924973 ?auto_924977 ) ) ( not ( = ?auto_924973 ?auto_924978 ) ) ( not ( = ?auto_924973 ?auto_924979 ) ) ( not ( = ?auto_924973 ?auto_924980 ) ) ( not ( = ?auto_924973 ?auto_924982 ) ) ( not ( = ?auto_924975 ?auto_924974 ) ) ( not ( = ?auto_924975 ?auto_924976 ) ) ( not ( = ?auto_924975 ?auto_924977 ) ) ( not ( = ?auto_924975 ?auto_924978 ) ) ( not ( = ?auto_924975 ?auto_924979 ) ) ( not ( = ?auto_924975 ?auto_924980 ) ) ( not ( = ?auto_924975 ?auto_924982 ) ) ( not ( = ?auto_924974 ?auto_924976 ) ) ( not ( = ?auto_924974 ?auto_924977 ) ) ( not ( = ?auto_924974 ?auto_924978 ) ) ( not ( = ?auto_924974 ?auto_924979 ) ) ( not ( = ?auto_924974 ?auto_924980 ) ) ( not ( = ?auto_924974 ?auto_924982 ) ) ( not ( = ?auto_924976 ?auto_924977 ) ) ( not ( = ?auto_924976 ?auto_924978 ) ) ( not ( = ?auto_924976 ?auto_924979 ) ) ( not ( = ?auto_924976 ?auto_924980 ) ) ( not ( = ?auto_924976 ?auto_924982 ) ) ( not ( = ?auto_924977 ?auto_924978 ) ) ( not ( = ?auto_924977 ?auto_924979 ) ) ( not ( = ?auto_924977 ?auto_924980 ) ) ( not ( = ?auto_924977 ?auto_924982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924978 ?auto_924979 ?auto_924980 )
      ( MAKE-9CRATE-VERIFY ?auto_924971 ?auto_924972 ?auto_924973 ?auto_924975 ?auto_924974 ?auto_924976 ?auto_924977 ?auto_924978 ?auto_924979 ?auto_924980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_927205 - SURFACE
      ?auto_927206 - SURFACE
    )
    :vars
    (
      ?auto_927213 - HOIST
      ?auto_927208 - PLACE
      ?auto_927207 - SURFACE
      ?auto_927212 - TRUCK
      ?auto_927210 - PLACE
      ?auto_927211 - HOIST
      ?auto_927209 - SURFACE
      ?auto_927214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_927213 ?auto_927208 ) ( SURFACE-AT ?auto_927205 ?auto_927208 ) ( CLEAR ?auto_927205 ) ( IS-CRATE ?auto_927206 ) ( not ( = ?auto_927205 ?auto_927206 ) ) ( AVAILABLE ?auto_927213 ) ( ON ?auto_927205 ?auto_927207 ) ( not ( = ?auto_927207 ?auto_927205 ) ) ( not ( = ?auto_927207 ?auto_927206 ) ) ( TRUCK-AT ?auto_927212 ?auto_927210 ) ( not ( = ?auto_927210 ?auto_927208 ) ) ( HOIST-AT ?auto_927211 ?auto_927210 ) ( not ( = ?auto_927213 ?auto_927211 ) ) ( SURFACE-AT ?auto_927206 ?auto_927210 ) ( ON ?auto_927206 ?auto_927209 ) ( CLEAR ?auto_927206 ) ( not ( = ?auto_927205 ?auto_927209 ) ) ( not ( = ?auto_927206 ?auto_927209 ) ) ( not ( = ?auto_927207 ?auto_927209 ) ) ( LIFTING ?auto_927211 ?auto_927214 ) ( IS-CRATE ?auto_927214 ) ( not ( = ?auto_927205 ?auto_927214 ) ) ( not ( = ?auto_927206 ?auto_927214 ) ) ( not ( = ?auto_927207 ?auto_927214 ) ) ( not ( = ?auto_927209 ?auto_927214 ) ) )
    :subtasks
    ( ( !LOAD ?auto_927211 ?auto_927214 ?auto_927212 ?auto_927210 )
      ( MAKE-1CRATE ?auto_927205 ?auto_927206 )
      ( MAKE-1CRATE-VERIFY ?auto_927205 ?auto_927206 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_930522 - SURFACE
      ?auto_930523 - SURFACE
      ?auto_930524 - SURFACE
      ?auto_930526 - SURFACE
      ?auto_930525 - SURFACE
      ?auto_930527 - SURFACE
      ?auto_930528 - SURFACE
      ?auto_930529 - SURFACE
      ?auto_930530 - SURFACE
      ?auto_930531 - SURFACE
      ?auto_930532 - SURFACE
    )
    :vars
    (
      ?auto_930534 - HOIST
      ?auto_930533 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930534 ?auto_930533 ) ( SURFACE-AT ?auto_930531 ?auto_930533 ) ( CLEAR ?auto_930531 ) ( LIFTING ?auto_930534 ?auto_930532 ) ( IS-CRATE ?auto_930532 ) ( not ( = ?auto_930531 ?auto_930532 ) ) ( ON ?auto_930523 ?auto_930522 ) ( ON ?auto_930524 ?auto_930523 ) ( ON ?auto_930526 ?auto_930524 ) ( ON ?auto_930525 ?auto_930526 ) ( ON ?auto_930527 ?auto_930525 ) ( ON ?auto_930528 ?auto_930527 ) ( ON ?auto_930529 ?auto_930528 ) ( ON ?auto_930530 ?auto_930529 ) ( ON ?auto_930531 ?auto_930530 ) ( not ( = ?auto_930522 ?auto_930523 ) ) ( not ( = ?auto_930522 ?auto_930524 ) ) ( not ( = ?auto_930522 ?auto_930526 ) ) ( not ( = ?auto_930522 ?auto_930525 ) ) ( not ( = ?auto_930522 ?auto_930527 ) ) ( not ( = ?auto_930522 ?auto_930528 ) ) ( not ( = ?auto_930522 ?auto_930529 ) ) ( not ( = ?auto_930522 ?auto_930530 ) ) ( not ( = ?auto_930522 ?auto_930531 ) ) ( not ( = ?auto_930522 ?auto_930532 ) ) ( not ( = ?auto_930523 ?auto_930524 ) ) ( not ( = ?auto_930523 ?auto_930526 ) ) ( not ( = ?auto_930523 ?auto_930525 ) ) ( not ( = ?auto_930523 ?auto_930527 ) ) ( not ( = ?auto_930523 ?auto_930528 ) ) ( not ( = ?auto_930523 ?auto_930529 ) ) ( not ( = ?auto_930523 ?auto_930530 ) ) ( not ( = ?auto_930523 ?auto_930531 ) ) ( not ( = ?auto_930523 ?auto_930532 ) ) ( not ( = ?auto_930524 ?auto_930526 ) ) ( not ( = ?auto_930524 ?auto_930525 ) ) ( not ( = ?auto_930524 ?auto_930527 ) ) ( not ( = ?auto_930524 ?auto_930528 ) ) ( not ( = ?auto_930524 ?auto_930529 ) ) ( not ( = ?auto_930524 ?auto_930530 ) ) ( not ( = ?auto_930524 ?auto_930531 ) ) ( not ( = ?auto_930524 ?auto_930532 ) ) ( not ( = ?auto_930526 ?auto_930525 ) ) ( not ( = ?auto_930526 ?auto_930527 ) ) ( not ( = ?auto_930526 ?auto_930528 ) ) ( not ( = ?auto_930526 ?auto_930529 ) ) ( not ( = ?auto_930526 ?auto_930530 ) ) ( not ( = ?auto_930526 ?auto_930531 ) ) ( not ( = ?auto_930526 ?auto_930532 ) ) ( not ( = ?auto_930525 ?auto_930527 ) ) ( not ( = ?auto_930525 ?auto_930528 ) ) ( not ( = ?auto_930525 ?auto_930529 ) ) ( not ( = ?auto_930525 ?auto_930530 ) ) ( not ( = ?auto_930525 ?auto_930531 ) ) ( not ( = ?auto_930525 ?auto_930532 ) ) ( not ( = ?auto_930527 ?auto_930528 ) ) ( not ( = ?auto_930527 ?auto_930529 ) ) ( not ( = ?auto_930527 ?auto_930530 ) ) ( not ( = ?auto_930527 ?auto_930531 ) ) ( not ( = ?auto_930527 ?auto_930532 ) ) ( not ( = ?auto_930528 ?auto_930529 ) ) ( not ( = ?auto_930528 ?auto_930530 ) ) ( not ( = ?auto_930528 ?auto_930531 ) ) ( not ( = ?auto_930528 ?auto_930532 ) ) ( not ( = ?auto_930529 ?auto_930530 ) ) ( not ( = ?auto_930529 ?auto_930531 ) ) ( not ( = ?auto_930529 ?auto_930532 ) ) ( not ( = ?auto_930530 ?auto_930531 ) ) ( not ( = ?auto_930530 ?auto_930532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_930531 ?auto_930532 )
      ( MAKE-10CRATE-VERIFY ?auto_930522 ?auto_930523 ?auto_930524 ?auto_930526 ?auto_930525 ?auto_930527 ?auto_930528 ?auto_930529 ?auto_930530 ?auto_930531 ?auto_930532 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_930616 - SURFACE
      ?auto_930617 - SURFACE
      ?auto_930618 - SURFACE
      ?auto_930620 - SURFACE
      ?auto_930619 - SURFACE
      ?auto_930621 - SURFACE
      ?auto_930622 - SURFACE
      ?auto_930623 - SURFACE
      ?auto_930624 - SURFACE
      ?auto_930625 - SURFACE
      ?auto_930626 - SURFACE
    )
    :vars
    (
      ?auto_930628 - HOIST
      ?auto_930627 - PLACE
      ?auto_930629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_930628 ?auto_930627 ) ( SURFACE-AT ?auto_930625 ?auto_930627 ) ( CLEAR ?auto_930625 ) ( IS-CRATE ?auto_930626 ) ( not ( = ?auto_930625 ?auto_930626 ) ) ( TRUCK-AT ?auto_930629 ?auto_930627 ) ( AVAILABLE ?auto_930628 ) ( IN ?auto_930626 ?auto_930629 ) ( ON ?auto_930625 ?auto_930624 ) ( not ( = ?auto_930624 ?auto_930625 ) ) ( not ( = ?auto_930624 ?auto_930626 ) ) ( ON ?auto_930617 ?auto_930616 ) ( ON ?auto_930618 ?auto_930617 ) ( ON ?auto_930620 ?auto_930618 ) ( ON ?auto_930619 ?auto_930620 ) ( ON ?auto_930621 ?auto_930619 ) ( ON ?auto_930622 ?auto_930621 ) ( ON ?auto_930623 ?auto_930622 ) ( ON ?auto_930624 ?auto_930623 ) ( not ( = ?auto_930616 ?auto_930617 ) ) ( not ( = ?auto_930616 ?auto_930618 ) ) ( not ( = ?auto_930616 ?auto_930620 ) ) ( not ( = ?auto_930616 ?auto_930619 ) ) ( not ( = ?auto_930616 ?auto_930621 ) ) ( not ( = ?auto_930616 ?auto_930622 ) ) ( not ( = ?auto_930616 ?auto_930623 ) ) ( not ( = ?auto_930616 ?auto_930624 ) ) ( not ( = ?auto_930616 ?auto_930625 ) ) ( not ( = ?auto_930616 ?auto_930626 ) ) ( not ( = ?auto_930617 ?auto_930618 ) ) ( not ( = ?auto_930617 ?auto_930620 ) ) ( not ( = ?auto_930617 ?auto_930619 ) ) ( not ( = ?auto_930617 ?auto_930621 ) ) ( not ( = ?auto_930617 ?auto_930622 ) ) ( not ( = ?auto_930617 ?auto_930623 ) ) ( not ( = ?auto_930617 ?auto_930624 ) ) ( not ( = ?auto_930617 ?auto_930625 ) ) ( not ( = ?auto_930617 ?auto_930626 ) ) ( not ( = ?auto_930618 ?auto_930620 ) ) ( not ( = ?auto_930618 ?auto_930619 ) ) ( not ( = ?auto_930618 ?auto_930621 ) ) ( not ( = ?auto_930618 ?auto_930622 ) ) ( not ( = ?auto_930618 ?auto_930623 ) ) ( not ( = ?auto_930618 ?auto_930624 ) ) ( not ( = ?auto_930618 ?auto_930625 ) ) ( not ( = ?auto_930618 ?auto_930626 ) ) ( not ( = ?auto_930620 ?auto_930619 ) ) ( not ( = ?auto_930620 ?auto_930621 ) ) ( not ( = ?auto_930620 ?auto_930622 ) ) ( not ( = ?auto_930620 ?auto_930623 ) ) ( not ( = ?auto_930620 ?auto_930624 ) ) ( not ( = ?auto_930620 ?auto_930625 ) ) ( not ( = ?auto_930620 ?auto_930626 ) ) ( not ( = ?auto_930619 ?auto_930621 ) ) ( not ( = ?auto_930619 ?auto_930622 ) ) ( not ( = ?auto_930619 ?auto_930623 ) ) ( not ( = ?auto_930619 ?auto_930624 ) ) ( not ( = ?auto_930619 ?auto_930625 ) ) ( not ( = ?auto_930619 ?auto_930626 ) ) ( not ( = ?auto_930621 ?auto_930622 ) ) ( not ( = ?auto_930621 ?auto_930623 ) ) ( not ( = ?auto_930621 ?auto_930624 ) ) ( not ( = ?auto_930621 ?auto_930625 ) ) ( not ( = ?auto_930621 ?auto_930626 ) ) ( not ( = ?auto_930622 ?auto_930623 ) ) ( not ( = ?auto_930622 ?auto_930624 ) ) ( not ( = ?auto_930622 ?auto_930625 ) ) ( not ( = ?auto_930622 ?auto_930626 ) ) ( not ( = ?auto_930623 ?auto_930624 ) ) ( not ( = ?auto_930623 ?auto_930625 ) ) ( not ( = ?auto_930623 ?auto_930626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_930624 ?auto_930625 ?auto_930626 )
      ( MAKE-10CRATE-VERIFY ?auto_930616 ?auto_930617 ?auto_930618 ?auto_930620 ?auto_930619 ?auto_930621 ?auto_930622 ?auto_930623 ?auto_930624 ?auto_930625 ?auto_930626 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_930721 - SURFACE
      ?auto_930722 - SURFACE
      ?auto_930723 - SURFACE
      ?auto_930725 - SURFACE
      ?auto_930724 - SURFACE
      ?auto_930726 - SURFACE
      ?auto_930727 - SURFACE
      ?auto_930728 - SURFACE
      ?auto_930729 - SURFACE
      ?auto_930730 - SURFACE
      ?auto_930731 - SURFACE
    )
    :vars
    (
      ?auto_930735 - HOIST
      ?auto_930734 - PLACE
      ?auto_930732 - TRUCK
      ?auto_930733 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930735 ?auto_930734 ) ( SURFACE-AT ?auto_930730 ?auto_930734 ) ( CLEAR ?auto_930730 ) ( IS-CRATE ?auto_930731 ) ( not ( = ?auto_930730 ?auto_930731 ) ) ( AVAILABLE ?auto_930735 ) ( IN ?auto_930731 ?auto_930732 ) ( ON ?auto_930730 ?auto_930729 ) ( not ( = ?auto_930729 ?auto_930730 ) ) ( not ( = ?auto_930729 ?auto_930731 ) ) ( TRUCK-AT ?auto_930732 ?auto_930733 ) ( not ( = ?auto_930733 ?auto_930734 ) ) ( ON ?auto_930722 ?auto_930721 ) ( ON ?auto_930723 ?auto_930722 ) ( ON ?auto_930725 ?auto_930723 ) ( ON ?auto_930724 ?auto_930725 ) ( ON ?auto_930726 ?auto_930724 ) ( ON ?auto_930727 ?auto_930726 ) ( ON ?auto_930728 ?auto_930727 ) ( ON ?auto_930729 ?auto_930728 ) ( not ( = ?auto_930721 ?auto_930722 ) ) ( not ( = ?auto_930721 ?auto_930723 ) ) ( not ( = ?auto_930721 ?auto_930725 ) ) ( not ( = ?auto_930721 ?auto_930724 ) ) ( not ( = ?auto_930721 ?auto_930726 ) ) ( not ( = ?auto_930721 ?auto_930727 ) ) ( not ( = ?auto_930721 ?auto_930728 ) ) ( not ( = ?auto_930721 ?auto_930729 ) ) ( not ( = ?auto_930721 ?auto_930730 ) ) ( not ( = ?auto_930721 ?auto_930731 ) ) ( not ( = ?auto_930722 ?auto_930723 ) ) ( not ( = ?auto_930722 ?auto_930725 ) ) ( not ( = ?auto_930722 ?auto_930724 ) ) ( not ( = ?auto_930722 ?auto_930726 ) ) ( not ( = ?auto_930722 ?auto_930727 ) ) ( not ( = ?auto_930722 ?auto_930728 ) ) ( not ( = ?auto_930722 ?auto_930729 ) ) ( not ( = ?auto_930722 ?auto_930730 ) ) ( not ( = ?auto_930722 ?auto_930731 ) ) ( not ( = ?auto_930723 ?auto_930725 ) ) ( not ( = ?auto_930723 ?auto_930724 ) ) ( not ( = ?auto_930723 ?auto_930726 ) ) ( not ( = ?auto_930723 ?auto_930727 ) ) ( not ( = ?auto_930723 ?auto_930728 ) ) ( not ( = ?auto_930723 ?auto_930729 ) ) ( not ( = ?auto_930723 ?auto_930730 ) ) ( not ( = ?auto_930723 ?auto_930731 ) ) ( not ( = ?auto_930725 ?auto_930724 ) ) ( not ( = ?auto_930725 ?auto_930726 ) ) ( not ( = ?auto_930725 ?auto_930727 ) ) ( not ( = ?auto_930725 ?auto_930728 ) ) ( not ( = ?auto_930725 ?auto_930729 ) ) ( not ( = ?auto_930725 ?auto_930730 ) ) ( not ( = ?auto_930725 ?auto_930731 ) ) ( not ( = ?auto_930724 ?auto_930726 ) ) ( not ( = ?auto_930724 ?auto_930727 ) ) ( not ( = ?auto_930724 ?auto_930728 ) ) ( not ( = ?auto_930724 ?auto_930729 ) ) ( not ( = ?auto_930724 ?auto_930730 ) ) ( not ( = ?auto_930724 ?auto_930731 ) ) ( not ( = ?auto_930726 ?auto_930727 ) ) ( not ( = ?auto_930726 ?auto_930728 ) ) ( not ( = ?auto_930726 ?auto_930729 ) ) ( not ( = ?auto_930726 ?auto_930730 ) ) ( not ( = ?auto_930726 ?auto_930731 ) ) ( not ( = ?auto_930727 ?auto_930728 ) ) ( not ( = ?auto_930727 ?auto_930729 ) ) ( not ( = ?auto_930727 ?auto_930730 ) ) ( not ( = ?auto_930727 ?auto_930731 ) ) ( not ( = ?auto_930728 ?auto_930729 ) ) ( not ( = ?auto_930728 ?auto_930730 ) ) ( not ( = ?auto_930728 ?auto_930731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_930729 ?auto_930730 ?auto_930731 )
      ( MAKE-10CRATE-VERIFY ?auto_930721 ?auto_930722 ?auto_930723 ?auto_930725 ?auto_930724 ?auto_930726 ?auto_930727 ?auto_930728 ?auto_930729 ?auto_930730 ?auto_930731 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_930836 - SURFACE
      ?auto_930837 - SURFACE
      ?auto_930838 - SURFACE
      ?auto_930840 - SURFACE
      ?auto_930839 - SURFACE
      ?auto_930841 - SURFACE
      ?auto_930842 - SURFACE
      ?auto_930843 - SURFACE
      ?auto_930844 - SURFACE
      ?auto_930845 - SURFACE
      ?auto_930846 - SURFACE
    )
    :vars
    (
      ?auto_930848 - HOIST
      ?auto_930849 - PLACE
      ?auto_930850 - TRUCK
      ?auto_930847 - PLACE
      ?auto_930851 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_930848 ?auto_930849 ) ( SURFACE-AT ?auto_930845 ?auto_930849 ) ( CLEAR ?auto_930845 ) ( IS-CRATE ?auto_930846 ) ( not ( = ?auto_930845 ?auto_930846 ) ) ( AVAILABLE ?auto_930848 ) ( ON ?auto_930845 ?auto_930844 ) ( not ( = ?auto_930844 ?auto_930845 ) ) ( not ( = ?auto_930844 ?auto_930846 ) ) ( TRUCK-AT ?auto_930850 ?auto_930847 ) ( not ( = ?auto_930847 ?auto_930849 ) ) ( HOIST-AT ?auto_930851 ?auto_930847 ) ( LIFTING ?auto_930851 ?auto_930846 ) ( not ( = ?auto_930848 ?auto_930851 ) ) ( ON ?auto_930837 ?auto_930836 ) ( ON ?auto_930838 ?auto_930837 ) ( ON ?auto_930840 ?auto_930838 ) ( ON ?auto_930839 ?auto_930840 ) ( ON ?auto_930841 ?auto_930839 ) ( ON ?auto_930842 ?auto_930841 ) ( ON ?auto_930843 ?auto_930842 ) ( ON ?auto_930844 ?auto_930843 ) ( not ( = ?auto_930836 ?auto_930837 ) ) ( not ( = ?auto_930836 ?auto_930838 ) ) ( not ( = ?auto_930836 ?auto_930840 ) ) ( not ( = ?auto_930836 ?auto_930839 ) ) ( not ( = ?auto_930836 ?auto_930841 ) ) ( not ( = ?auto_930836 ?auto_930842 ) ) ( not ( = ?auto_930836 ?auto_930843 ) ) ( not ( = ?auto_930836 ?auto_930844 ) ) ( not ( = ?auto_930836 ?auto_930845 ) ) ( not ( = ?auto_930836 ?auto_930846 ) ) ( not ( = ?auto_930837 ?auto_930838 ) ) ( not ( = ?auto_930837 ?auto_930840 ) ) ( not ( = ?auto_930837 ?auto_930839 ) ) ( not ( = ?auto_930837 ?auto_930841 ) ) ( not ( = ?auto_930837 ?auto_930842 ) ) ( not ( = ?auto_930837 ?auto_930843 ) ) ( not ( = ?auto_930837 ?auto_930844 ) ) ( not ( = ?auto_930837 ?auto_930845 ) ) ( not ( = ?auto_930837 ?auto_930846 ) ) ( not ( = ?auto_930838 ?auto_930840 ) ) ( not ( = ?auto_930838 ?auto_930839 ) ) ( not ( = ?auto_930838 ?auto_930841 ) ) ( not ( = ?auto_930838 ?auto_930842 ) ) ( not ( = ?auto_930838 ?auto_930843 ) ) ( not ( = ?auto_930838 ?auto_930844 ) ) ( not ( = ?auto_930838 ?auto_930845 ) ) ( not ( = ?auto_930838 ?auto_930846 ) ) ( not ( = ?auto_930840 ?auto_930839 ) ) ( not ( = ?auto_930840 ?auto_930841 ) ) ( not ( = ?auto_930840 ?auto_930842 ) ) ( not ( = ?auto_930840 ?auto_930843 ) ) ( not ( = ?auto_930840 ?auto_930844 ) ) ( not ( = ?auto_930840 ?auto_930845 ) ) ( not ( = ?auto_930840 ?auto_930846 ) ) ( not ( = ?auto_930839 ?auto_930841 ) ) ( not ( = ?auto_930839 ?auto_930842 ) ) ( not ( = ?auto_930839 ?auto_930843 ) ) ( not ( = ?auto_930839 ?auto_930844 ) ) ( not ( = ?auto_930839 ?auto_930845 ) ) ( not ( = ?auto_930839 ?auto_930846 ) ) ( not ( = ?auto_930841 ?auto_930842 ) ) ( not ( = ?auto_930841 ?auto_930843 ) ) ( not ( = ?auto_930841 ?auto_930844 ) ) ( not ( = ?auto_930841 ?auto_930845 ) ) ( not ( = ?auto_930841 ?auto_930846 ) ) ( not ( = ?auto_930842 ?auto_930843 ) ) ( not ( = ?auto_930842 ?auto_930844 ) ) ( not ( = ?auto_930842 ?auto_930845 ) ) ( not ( = ?auto_930842 ?auto_930846 ) ) ( not ( = ?auto_930843 ?auto_930844 ) ) ( not ( = ?auto_930843 ?auto_930845 ) ) ( not ( = ?auto_930843 ?auto_930846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_930844 ?auto_930845 ?auto_930846 )
      ( MAKE-10CRATE-VERIFY ?auto_930836 ?auto_930837 ?auto_930838 ?auto_930840 ?auto_930839 ?auto_930841 ?auto_930842 ?auto_930843 ?auto_930844 ?auto_930845 ?auto_930846 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_930961 - SURFACE
      ?auto_930962 - SURFACE
      ?auto_930963 - SURFACE
      ?auto_930965 - SURFACE
      ?auto_930964 - SURFACE
      ?auto_930966 - SURFACE
      ?auto_930967 - SURFACE
      ?auto_930968 - SURFACE
      ?auto_930969 - SURFACE
      ?auto_930970 - SURFACE
      ?auto_930971 - SURFACE
    )
    :vars
    (
      ?auto_930977 - HOIST
      ?auto_930973 - PLACE
      ?auto_930976 - TRUCK
      ?auto_930975 - PLACE
      ?auto_930974 - HOIST
      ?auto_930972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930977 ?auto_930973 ) ( SURFACE-AT ?auto_930970 ?auto_930973 ) ( CLEAR ?auto_930970 ) ( IS-CRATE ?auto_930971 ) ( not ( = ?auto_930970 ?auto_930971 ) ) ( AVAILABLE ?auto_930977 ) ( ON ?auto_930970 ?auto_930969 ) ( not ( = ?auto_930969 ?auto_930970 ) ) ( not ( = ?auto_930969 ?auto_930971 ) ) ( TRUCK-AT ?auto_930976 ?auto_930975 ) ( not ( = ?auto_930975 ?auto_930973 ) ) ( HOIST-AT ?auto_930974 ?auto_930975 ) ( not ( = ?auto_930977 ?auto_930974 ) ) ( AVAILABLE ?auto_930974 ) ( SURFACE-AT ?auto_930971 ?auto_930975 ) ( ON ?auto_930971 ?auto_930972 ) ( CLEAR ?auto_930971 ) ( not ( = ?auto_930970 ?auto_930972 ) ) ( not ( = ?auto_930971 ?auto_930972 ) ) ( not ( = ?auto_930969 ?auto_930972 ) ) ( ON ?auto_930962 ?auto_930961 ) ( ON ?auto_930963 ?auto_930962 ) ( ON ?auto_930965 ?auto_930963 ) ( ON ?auto_930964 ?auto_930965 ) ( ON ?auto_930966 ?auto_930964 ) ( ON ?auto_930967 ?auto_930966 ) ( ON ?auto_930968 ?auto_930967 ) ( ON ?auto_930969 ?auto_930968 ) ( not ( = ?auto_930961 ?auto_930962 ) ) ( not ( = ?auto_930961 ?auto_930963 ) ) ( not ( = ?auto_930961 ?auto_930965 ) ) ( not ( = ?auto_930961 ?auto_930964 ) ) ( not ( = ?auto_930961 ?auto_930966 ) ) ( not ( = ?auto_930961 ?auto_930967 ) ) ( not ( = ?auto_930961 ?auto_930968 ) ) ( not ( = ?auto_930961 ?auto_930969 ) ) ( not ( = ?auto_930961 ?auto_930970 ) ) ( not ( = ?auto_930961 ?auto_930971 ) ) ( not ( = ?auto_930961 ?auto_930972 ) ) ( not ( = ?auto_930962 ?auto_930963 ) ) ( not ( = ?auto_930962 ?auto_930965 ) ) ( not ( = ?auto_930962 ?auto_930964 ) ) ( not ( = ?auto_930962 ?auto_930966 ) ) ( not ( = ?auto_930962 ?auto_930967 ) ) ( not ( = ?auto_930962 ?auto_930968 ) ) ( not ( = ?auto_930962 ?auto_930969 ) ) ( not ( = ?auto_930962 ?auto_930970 ) ) ( not ( = ?auto_930962 ?auto_930971 ) ) ( not ( = ?auto_930962 ?auto_930972 ) ) ( not ( = ?auto_930963 ?auto_930965 ) ) ( not ( = ?auto_930963 ?auto_930964 ) ) ( not ( = ?auto_930963 ?auto_930966 ) ) ( not ( = ?auto_930963 ?auto_930967 ) ) ( not ( = ?auto_930963 ?auto_930968 ) ) ( not ( = ?auto_930963 ?auto_930969 ) ) ( not ( = ?auto_930963 ?auto_930970 ) ) ( not ( = ?auto_930963 ?auto_930971 ) ) ( not ( = ?auto_930963 ?auto_930972 ) ) ( not ( = ?auto_930965 ?auto_930964 ) ) ( not ( = ?auto_930965 ?auto_930966 ) ) ( not ( = ?auto_930965 ?auto_930967 ) ) ( not ( = ?auto_930965 ?auto_930968 ) ) ( not ( = ?auto_930965 ?auto_930969 ) ) ( not ( = ?auto_930965 ?auto_930970 ) ) ( not ( = ?auto_930965 ?auto_930971 ) ) ( not ( = ?auto_930965 ?auto_930972 ) ) ( not ( = ?auto_930964 ?auto_930966 ) ) ( not ( = ?auto_930964 ?auto_930967 ) ) ( not ( = ?auto_930964 ?auto_930968 ) ) ( not ( = ?auto_930964 ?auto_930969 ) ) ( not ( = ?auto_930964 ?auto_930970 ) ) ( not ( = ?auto_930964 ?auto_930971 ) ) ( not ( = ?auto_930964 ?auto_930972 ) ) ( not ( = ?auto_930966 ?auto_930967 ) ) ( not ( = ?auto_930966 ?auto_930968 ) ) ( not ( = ?auto_930966 ?auto_930969 ) ) ( not ( = ?auto_930966 ?auto_930970 ) ) ( not ( = ?auto_930966 ?auto_930971 ) ) ( not ( = ?auto_930966 ?auto_930972 ) ) ( not ( = ?auto_930967 ?auto_930968 ) ) ( not ( = ?auto_930967 ?auto_930969 ) ) ( not ( = ?auto_930967 ?auto_930970 ) ) ( not ( = ?auto_930967 ?auto_930971 ) ) ( not ( = ?auto_930967 ?auto_930972 ) ) ( not ( = ?auto_930968 ?auto_930969 ) ) ( not ( = ?auto_930968 ?auto_930970 ) ) ( not ( = ?auto_930968 ?auto_930971 ) ) ( not ( = ?auto_930968 ?auto_930972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_930969 ?auto_930970 ?auto_930971 )
      ( MAKE-10CRATE-VERIFY ?auto_930961 ?auto_930962 ?auto_930963 ?auto_930965 ?auto_930964 ?auto_930966 ?auto_930967 ?auto_930968 ?auto_930969 ?auto_930970 ?auto_930971 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931087 - SURFACE
      ?auto_931088 - SURFACE
      ?auto_931089 - SURFACE
      ?auto_931091 - SURFACE
      ?auto_931090 - SURFACE
      ?auto_931092 - SURFACE
      ?auto_931093 - SURFACE
      ?auto_931094 - SURFACE
      ?auto_931095 - SURFACE
      ?auto_931096 - SURFACE
      ?auto_931097 - SURFACE
    )
    :vars
    (
      ?auto_931098 - HOIST
      ?auto_931103 - PLACE
      ?auto_931100 - PLACE
      ?auto_931099 - HOIST
      ?auto_931101 - SURFACE
      ?auto_931102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931098 ?auto_931103 ) ( SURFACE-AT ?auto_931096 ?auto_931103 ) ( CLEAR ?auto_931096 ) ( IS-CRATE ?auto_931097 ) ( not ( = ?auto_931096 ?auto_931097 ) ) ( AVAILABLE ?auto_931098 ) ( ON ?auto_931096 ?auto_931095 ) ( not ( = ?auto_931095 ?auto_931096 ) ) ( not ( = ?auto_931095 ?auto_931097 ) ) ( not ( = ?auto_931100 ?auto_931103 ) ) ( HOIST-AT ?auto_931099 ?auto_931100 ) ( not ( = ?auto_931098 ?auto_931099 ) ) ( AVAILABLE ?auto_931099 ) ( SURFACE-AT ?auto_931097 ?auto_931100 ) ( ON ?auto_931097 ?auto_931101 ) ( CLEAR ?auto_931097 ) ( not ( = ?auto_931096 ?auto_931101 ) ) ( not ( = ?auto_931097 ?auto_931101 ) ) ( not ( = ?auto_931095 ?auto_931101 ) ) ( TRUCK-AT ?auto_931102 ?auto_931103 ) ( ON ?auto_931088 ?auto_931087 ) ( ON ?auto_931089 ?auto_931088 ) ( ON ?auto_931091 ?auto_931089 ) ( ON ?auto_931090 ?auto_931091 ) ( ON ?auto_931092 ?auto_931090 ) ( ON ?auto_931093 ?auto_931092 ) ( ON ?auto_931094 ?auto_931093 ) ( ON ?auto_931095 ?auto_931094 ) ( not ( = ?auto_931087 ?auto_931088 ) ) ( not ( = ?auto_931087 ?auto_931089 ) ) ( not ( = ?auto_931087 ?auto_931091 ) ) ( not ( = ?auto_931087 ?auto_931090 ) ) ( not ( = ?auto_931087 ?auto_931092 ) ) ( not ( = ?auto_931087 ?auto_931093 ) ) ( not ( = ?auto_931087 ?auto_931094 ) ) ( not ( = ?auto_931087 ?auto_931095 ) ) ( not ( = ?auto_931087 ?auto_931096 ) ) ( not ( = ?auto_931087 ?auto_931097 ) ) ( not ( = ?auto_931087 ?auto_931101 ) ) ( not ( = ?auto_931088 ?auto_931089 ) ) ( not ( = ?auto_931088 ?auto_931091 ) ) ( not ( = ?auto_931088 ?auto_931090 ) ) ( not ( = ?auto_931088 ?auto_931092 ) ) ( not ( = ?auto_931088 ?auto_931093 ) ) ( not ( = ?auto_931088 ?auto_931094 ) ) ( not ( = ?auto_931088 ?auto_931095 ) ) ( not ( = ?auto_931088 ?auto_931096 ) ) ( not ( = ?auto_931088 ?auto_931097 ) ) ( not ( = ?auto_931088 ?auto_931101 ) ) ( not ( = ?auto_931089 ?auto_931091 ) ) ( not ( = ?auto_931089 ?auto_931090 ) ) ( not ( = ?auto_931089 ?auto_931092 ) ) ( not ( = ?auto_931089 ?auto_931093 ) ) ( not ( = ?auto_931089 ?auto_931094 ) ) ( not ( = ?auto_931089 ?auto_931095 ) ) ( not ( = ?auto_931089 ?auto_931096 ) ) ( not ( = ?auto_931089 ?auto_931097 ) ) ( not ( = ?auto_931089 ?auto_931101 ) ) ( not ( = ?auto_931091 ?auto_931090 ) ) ( not ( = ?auto_931091 ?auto_931092 ) ) ( not ( = ?auto_931091 ?auto_931093 ) ) ( not ( = ?auto_931091 ?auto_931094 ) ) ( not ( = ?auto_931091 ?auto_931095 ) ) ( not ( = ?auto_931091 ?auto_931096 ) ) ( not ( = ?auto_931091 ?auto_931097 ) ) ( not ( = ?auto_931091 ?auto_931101 ) ) ( not ( = ?auto_931090 ?auto_931092 ) ) ( not ( = ?auto_931090 ?auto_931093 ) ) ( not ( = ?auto_931090 ?auto_931094 ) ) ( not ( = ?auto_931090 ?auto_931095 ) ) ( not ( = ?auto_931090 ?auto_931096 ) ) ( not ( = ?auto_931090 ?auto_931097 ) ) ( not ( = ?auto_931090 ?auto_931101 ) ) ( not ( = ?auto_931092 ?auto_931093 ) ) ( not ( = ?auto_931092 ?auto_931094 ) ) ( not ( = ?auto_931092 ?auto_931095 ) ) ( not ( = ?auto_931092 ?auto_931096 ) ) ( not ( = ?auto_931092 ?auto_931097 ) ) ( not ( = ?auto_931092 ?auto_931101 ) ) ( not ( = ?auto_931093 ?auto_931094 ) ) ( not ( = ?auto_931093 ?auto_931095 ) ) ( not ( = ?auto_931093 ?auto_931096 ) ) ( not ( = ?auto_931093 ?auto_931097 ) ) ( not ( = ?auto_931093 ?auto_931101 ) ) ( not ( = ?auto_931094 ?auto_931095 ) ) ( not ( = ?auto_931094 ?auto_931096 ) ) ( not ( = ?auto_931094 ?auto_931097 ) ) ( not ( = ?auto_931094 ?auto_931101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931095 ?auto_931096 ?auto_931097 )
      ( MAKE-10CRATE-VERIFY ?auto_931087 ?auto_931088 ?auto_931089 ?auto_931091 ?auto_931090 ?auto_931092 ?auto_931093 ?auto_931094 ?auto_931095 ?auto_931096 ?auto_931097 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931213 - SURFACE
      ?auto_931214 - SURFACE
      ?auto_931215 - SURFACE
      ?auto_931217 - SURFACE
      ?auto_931216 - SURFACE
      ?auto_931218 - SURFACE
      ?auto_931219 - SURFACE
      ?auto_931220 - SURFACE
      ?auto_931221 - SURFACE
      ?auto_931222 - SURFACE
      ?auto_931223 - SURFACE
    )
    :vars
    (
      ?auto_931227 - HOIST
      ?auto_931228 - PLACE
      ?auto_931225 - PLACE
      ?auto_931224 - HOIST
      ?auto_931226 - SURFACE
      ?auto_931229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931227 ?auto_931228 ) ( IS-CRATE ?auto_931223 ) ( not ( = ?auto_931222 ?auto_931223 ) ) ( not ( = ?auto_931221 ?auto_931222 ) ) ( not ( = ?auto_931221 ?auto_931223 ) ) ( not ( = ?auto_931225 ?auto_931228 ) ) ( HOIST-AT ?auto_931224 ?auto_931225 ) ( not ( = ?auto_931227 ?auto_931224 ) ) ( AVAILABLE ?auto_931224 ) ( SURFACE-AT ?auto_931223 ?auto_931225 ) ( ON ?auto_931223 ?auto_931226 ) ( CLEAR ?auto_931223 ) ( not ( = ?auto_931222 ?auto_931226 ) ) ( not ( = ?auto_931223 ?auto_931226 ) ) ( not ( = ?auto_931221 ?auto_931226 ) ) ( TRUCK-AT ?auto_931229 ?auto_931228 ) ( SURFACE-AT ?auto_931221 ?auto_931228 ) ( CLEAR ?auto_931221 ) ( LIFTING ?auto_931227 ?auto_931222 ) ( IS-CRATE ?auto_931222 ) ( ON ?auto_931214 ?auto_931213 ) ( ON ?auto_931215 ?auto_931214 ) ( ON ?auto_931217 ?auto_931215 ) ( ON ?auto_931216 ?auto_931217 ) ( ON ?auto_931218 ?auto_931216 ) ( ON ?auto_931219 ?auto_931218 ) ( ON ?auto_931220 ?auto_931219 ) ( ON ?auto_931221 ?auto_931220 ) ( not ( = ?auto_931213 ?auto_931214 ) ) ( not ( = ?auto_931213 ?auto_931215 ) ) ( not ( = ?auto_931213 ?auto_931217 ) ) ( not ( = ?auto_931213 ?auto_931216 ) ) ( not ( = ?auto_931213 ?auto_931218 ) ) ( not ( = ?auto_931213 ?auto_931219 ) ) ( not ( = ?auto_931213 ?auto_931220 ) ) ( not ( = ?auto_931213 ?auto_931221 ) ) ( not ( = ?auto_931213 ?auto_931222 ) ) ( not ( = ?auto_931213 ?auto_931223 ) ) ( not ( = ?auto_931213 ?auto_931226 ) ) ( not ( = ?auto_931214 ?auto_931215 ) ) ( not ( = ?auto_931214 ?auto_931217 ) ) ( not ( = ?auto_931214 ?auto_931216 ) ) ( not ( = ?auto_931214 ?auto_931218 ) ) ( not ( = ?auto_931214 ?auto_931219 ) ) ( not ( = ?auto_931214 ?auto_931220 ) ) ( not ( = ?auto_931214 ?auto_931221 ) ) ( not ( = ?auto_931214 ?auto_931222 ) ) ( not ( = ?auto_931214 ?auto_931223 ) ) ( not ( = ?auto_931214 ?auto_931226 ) ) ( not ( = ?auto_931215 ?auto_931217 ) ) ( not ( = ?auto_931215 ?auto_931216 ) ) ( not ( = ?auto_931215 ?auto_931218 ) ) ( not ( = ?auto_931215 ?auto_931219 ) ) ( not ( = ?auto_931215 ?auto_931220 ) ) ( not ( = ?auto_931215 ?auto_931221 ) ) ( not ( = ?auto_931215 ?auto_931222 ) ) ( not ( = ?auto_931215 ?auto_931223 ) ) ( not ( = ?auto_931215 ?auto_931226 ) ) ( not ( = ?auto_931217 ?auto_931216 ) ) ( not ( = ?auto_931217 ?auto_931218 ) ) ( not ( = ?auto_931217 ?auto_931219 ) ) ( not ( = ?auto_931217 ?auto_931220 ) ) ( not ( = ?auto_931217 ?auto_931221 ) ) ( not ( = ?auto_931217 ?auto_931222 ) ) ( not ( = ?auto_931217 ?auto_931223 ) ) ( not ( = ?auto_931217 ?auto_931226 ) ) ( not ( = ?auto_931216 ?auto_931218 ) ) ( not ( = ?auto_931216 ?auto_931219 ) ) ( not ( = ?auto_931216 ?auto_931220 ) ) ( not ( = ?auto_931216 ?auto_931221 ) ) ( not ( = ?auto_931216 ?auto_931222 ) ) ( not ( = ?auto_931216 ?auto_931223 ) ) ( not ( = ?auto_931216 ?auto_931226 ) ) ( not ( = ?auto_931218 ?auto_931219 ) ) ( not ( = ?auto_931218 ?auto_931220 ) ) ( not ( = ?auto_931218 ?auto_931221 ) ) ( not ( = ?auto_931218 ?auto_931222 ) ) ( not ( = ?auto_931218 ?auto_931223 ) ) ( not ( = ?auto_931218 ?auto_931226 ) ) ( not ( = ?auto_931219 ?auto_931220 ) ) ( not ( = ?auto_931219 ?auto_931221 ) ) ( not ( = ?auto_931219 ?auto_931222 ) ) ( not ( = ?auto_931219 ?auto_931223 ) ) ( not ( = ?auto_931219 ?auto_931226 ) ) ( not ( = ?auto_931220 ?auto_931221 ) ) ( not ( = ?auto_931220 ?auto_931222 ) ) ( not ( = ?auto_931220 ?auto_931223 ) ) ( not ( = ?auto_931220 ?auto_931226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931221 ?auto_931222 ?auto_931223 )
      ( MAKE-10CRATE-VERIFY ?auto_931213 ?auto_931214 ?auto_931215 ?auto_931217 ?auto_931216 ?auto_931218 ?auto_931219 ?auto_931220 ?auto_931221 ?auto_931222 ?auto_931223 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931339 - SURFACE
      ?auto_931340 - SURFACE
      ?auto_931341 - SURFACE
      ?auto_931343 - SURFACE
      ?auto_931342 - SURFACE
      ?auto_931344 - SURFACE
      ?auto_931345 - SURFACE
      ?auto_931346 - SURFACE
      ?auto_931347 - SURFACE
      ?auto_931348 - SURFACE
      ?auto_931349 - SURFACE
    )
    :vars
    (
      ?auto_931351 - HOIST
      ?auto_931353 - PLACE
      ?auto_931354 - PLACE
      ?auto_931350 - HOIST
      ?auto_931352 - SURFACE
      ?auto_931355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931351 ?auto_931353 ) ( IS-CRATE ?auto_931349 ) ( not ( = ?auto_931348 ?auto_931349 ) ) ( not ( = ?auto_931347 ?auto_931348 ) ) ( not ( = ?auto_931347 ?auto_931349 ) ) ( not ( = ?auto_931354 ?auto_931353 ) ) ( HOIST-AT ?auto_931350 ?auto_931354 ) ( not ( = ?auto_931351 ?auto_931350 ) ) ( AVAILABLE ?auto_931350 ) ( SURFACE-AT ?auto_931349 ?auto_931354 ) ( ON ?auto_931349 ?auto_931352 ) ( CLEAR ?auto_931349 ) ( not ( = ?auto_931348 ?auto_931352 ) ) ( not ( = ?auto_931349 ?auto_931352 ) ) ( not ( = ?auto_931347 ?auto_931352 ) ) ( TRUCK-AT ?auto_931355 ?auto_931353 ) ( SURFACE-AT ?auto_931347 ?auto_931353 ) ( CLEAR ?auto_931347 ) ( IS-CRATE ?auto_931348 ) ( AVAILABLE ?auto_931351 ) ( IN ?auto_931348 ?auto_931355 ) ( ON ?auto_931340 ?auto_931339 ) ( ON ?auto_931341 ?auto_931340 ) ( ON ?auto_931343 ?auto_931341 ) ( ON ?auto_931342 ?auto_931343 ) ( ON ?auto_931344 ?auto_931342 ) ( ON ?auto_931345 ?auto_931344 ) ( ON ?auto_931346 ?auto_931345 ) ( ON ?auto_931347 ?auto_931346 ) ( not ( = ?auto_931339 ?auto_931340 ) ) ( not ( = ?auto_931339 ?auto_931341 ) ) ( not ( = ?auto_931339 ?auto_931343 ) ) ( not ( = ?auto_931339 ?auto_931342 ) ) ( not ( = ?auto_931339 ?auto_931344 ) ) ( not ( = ?auto_931339 ?auto_931345 ) ) ( not ( = ?auto_931339 ?auto_931346 ) ) ( not ( = ?auto_931339 ?auto_931347 ) ) ( not ( = ?auto_931339 ?auto_931348 ) ) ( not ( = ?auto_931339 ?auto_931349 ) ) ( not ( = ?auto_931339 ?auto_931352 ) ) ( not ( = ?auto_931340 ?auto_931341 ) ) ( not ( = ?auto_931340 ?auto_931343 ) ) ( not ( = ?auto_931340 ?auto_931342 ) ) ( not ( = ?auto_931340 ?auto_931344 ) ) ( not ( = ?auto_931340 ?auto_931345 ) ) ( not ( = ?auto_931340 ?auto_931346 ) ) ( not ( = ?auto_931340 ?auto_931347 ) ) ( not ( = ?auto_931340 ?auto_931348 ) ) ( not ( = ?auto_931340 ?auto_931349 ) ) ( not ( = ?auto_931340 ?auto_931352 ) ) ( not ( = ?auto_931341 ?auto_931343 ) ) ( not ( = ?auto_931341 ?auto_931342 ) ) ( not ( = ?auto_931341 ?auto_931344 ) ) ( not ( = ?auto_931341 ?auto_931345 ) ) ( not ( = ?auto_931341 ?auto_931346 ) ) ( not ( = ?auto_931341 ?auto_931347 ) ) ( not ( = ?auto_931341 ?auto_931348 ) ) ( not ( = ?auto_931341 ?auto_931349 ) ) ( not ( = ?auto_931341 ?auto_931352 ) ) ( not ( = ?auto_931343 ?auto_931342 ) ) ( not ( = ?auto_931343 ?auto_931344 ) ) ( not ( = ?auto_931343 ?auto_931345 ) ) ( not ( = ?auto_931343 ?auto_931346 ) ) ( not ( = ?auto_931343 ?auto_931347 ) ) ( not ( = ?auto_931343 ?auto_931348 ) ) ( not ( = ?auto_931343 ?auto_931349 ) ) ( not ( = ?auto_931343 ?auto_931352 ) ) ( not ( = ?auto_931342 ?auto_931344 ) ) ( not ( = ?auto_931342 ?auto_931345 ) ) ( not ( = ?auto_931342 ?auto_931346 ) ) ( not ( = ?auto_931342 ?auto_931347 ) ) ( not ( = ?auto_931342 ?auto_931348 ) ) ( not ( = ?auto_931342 ?auto_931349 ) ) ( not ( = ?auto_931342 ?auto_931352 ) ) ( not ( = ?auto_931344 ?auto_931345 ) ) ( not ( = ?auto_931344 ?auto_931346 ) ) ( not ( = ?auto_931344 ?auto_931347 ) ) ( not ( = ?auto_931344 ?auto_931348 ) ) ( not ( = ?auto_931344 ?auto_931349 ) ) ( not ( = ?auto_931344 ?auto_931352 ) ) ( not ( = ?auto_931345 ?auto_931346 ) ) ( not ( = ?auto_931345 ?auto_931347 ) ) ( not ( = ?auto_931345 ?auto_931348 ) ) ( not ( = ?auto_931345 ?auto_931349 ) ) ( not ( = ?auto_931345 ?auto_931352 ) ) ( not ( = ?auto_931346 ?auto_931347 ) ) ( not ( = ?auto_931346 ?auto_931348 ) ) ( not ( = ?auto_931346 ?auto_931349 ) ) ( not ( = ?auto_931346 ?auto_931352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931347 ?auto_931348 ?auto_931349 )
      ( MAKE-10CRATE-VERIFY ?auto_931339 ?auto_931340 ?auto_931341 ?auto_931343 ?auto_931342 ?auto_931344 ?auto_931345 ?auto_931346 ?auto_931347 ?auto_931348 ?auto_931349 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_938607 - SURFACE
      ?auto_938608 - SURFACE
      ?auto_938609 - SURFACE
      ?auto_938611 - SURFACE
      ?auto_938610 - SURFACE
      ?auto_938612 - SURFACE
      ?auto_938613 - SURFACE
      ?auto_938614 - SURFACE
      ?auto_938615 - SURFACE
      ?auto_938616 - SURFACE
      ?auto_938617 - SURFACE
      ?auto_938618 - SURFACE
    )
    :vars
    (
      ?auto_938619 - HOIST
      ?auto_938620 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_938619 ?auto_938620 ) ( SURFACE-AT ?auto_938617 ?auto_938620 ) ( CLEAR ?auto_938617 ) ( LIFTING ?auto_938619 ?auto_938618 ) ( IS-CRATE ?auto_938618 ) ( not ( = ?auto_938617 ?auto_938618 ) ) ( ON ?auto_938608 ?auto_938607 ) ( ON ?auto_938609 ?auto_938608 ) ( ON ?auto_938611 ?auto_938609 ) ( ON ?auto_938610 ?auto_938611 ) ( ON ?auto_938612 ?auto_938610 ) ( ON ?auto_938613 ?auto_938612 ) ( ON ?auto_938614 ?auto_938613 ) ( ON ?auto_938615 ?auto_938614 ) ( ON ?auto_938616 ?auto_938615 ) ( ON ?auto_938617 ?auto_938616 ) ( not ( = ?auto_938607 ?auto_938608 ) ) ( not ( = ?auto_938607 ?auto_938609 ) ) ( not ( = ?auto_938607 ?auto_938611 ) ) ( not ( = ?auto_938607 ?auto_938610 ) ) ( not ( = ?auto_938607 ?auto_938612 ) ) ( not ( = ?auto_938607 ?auto_938613 ) ) ( not ( = ?auto_938607 ?auto_938614 ) ) ( not ( = ?auto_938607 ?auto_938615 ) ) ( not ( = ?auto_938607 ?auto_938616 ) ) ( not ( = ?auto_938607 ?auto_938617 ) ) ( not ( = ?auto_938607 ?auto_938618 ) ) ( not ( = ?auto_938608 ?auto_938609 ) ) ( not ( = ?auto_938608 ?auto_938611 ) ) ( not ( = ?auto_938608 ?auto_938610 ) ) ( not ( = ?auto_938608 ?auto_938612 ) ) ( not ( = ?auto_938608 ?auto_938613 ) ) ( not ( = ?auto_938608 ?auto_938614 ) ) ( not ( = ?auto_938608 ?auto_938615 ) ) ( not ( = ?auto_938608 ?auto_938616 ) ) ( not ( = ?auto_938608 ?auto_938617 ) ) ( not ( = ?auto_938608 ?auto_938618 ) ) ( not ( = ?auto_938609 ?auto_938611 ) ) ( not ( = ?auto_938609 ?auto_938610 ) ) ( not ( = ?auto_938609 ?auto_938612 ) ) ( not ( = ?auto_938609 ?auto_938613 ) ) ( not ( = ?auto_938609 ?auto_938614 ) ) ( not ( = ?auto_938609 ?auto_938615 ) ) ( not ( = ?auto_938609 ?auto_938616 ) ) ( not ( = ?auto_938609 ?auto_938617 ) ) ( not ( = ?auto_938609 ?auto_938618 ) ) ( not ( = ?auto_938611 ?auto_938610 ) ) ( not ( = ?auto_938611 ?auto_938612 ) ) ( not ( = ?auto_938611 ?auto_938613 ) ) ( not ( = ?auto_938611 ?auto_938614 ) ) ( not ( = ?auto_938611 ?auto_938615 ) ) ( not ( = ?auto_938611 ?auto_938616 ) ) ( not ( = ?auto_938611 ?auto_938617 ) ) ( not ( = ?auto_938611 ?auto_938618 ) ) ( not ( = ?auto_938610 ?auto_938612 ) ) ( not ( = ?auto_938610 ?auto_938613 ) ) ( not ( = ?auto_938610 ?auto_938614 ) ) ( not ( = ?auto_938610 ?auto_938615 ) ) ( not ( = ?auto_938610 ?auto_938616 ) ) ( not ( = ?auto_938610 ?auto_938617 ) ) ( not ( = ?auto_938610 ?auto_938618 ) ) ( not ( = ?auto_938612 ?auto_938613 ) ) ( not ( = ?auto_938612 ?auto_938614 ) ) ( not ( = ?auto_938612 ?auto_938615 ) ) ( not ( = ?auto_938612 ?auto_938616 ) ) ( not ( = ?auto_938612 ?auto_938617 ) ) ( not ( = ?auto_938612 ?auto_938618 ) ) ( not ( = ?auto_938613 ?auto_938614 ) ) ( not ( = ?auto_938613 ?auto_938615 ) ) ( not ( = ?auto_938613 ?auto_938616 ) ) ( not ( = ?auto_938613 ?auto_938617 ) ) ( not ( = ?auto_938613 ?auto_938618 ) ) ( not ( = ?auto_938614 ?auto_938615 ) ) ( not ( = ?auto_938614 ?auto_938616 ) ) ( not ( = ?auto_938614 ?auto_938617 ) ) ( not ( = ?auto_938614 ?auto_938618 ) ) ( not ( = ?auto_938615 ?auto_938616 ) ) ( not ( = ?auto_938615 ?auto_938617 ) ) ( not ( = ?auto_938615 ?auto_938618 ) ) ( not ( = ?auto_938616 ?auto_938617 ) ) ( not ( = ?auto_938616 ?auto_938618 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_938617 ?auto_938618 )
      ( MAKE-11CRATE-VERIFY ?auto_938607 ?auto_938608 ?auto_938609 ?auto_938611 ?auto_938610 ?auto_938612 ?auto_938613 ?auto_938614 ?auto_938615 ?auto_938616 ?auto_938617 ?auto_938618 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_938716 - SURFACE
      ?auto_938717 - SURFACE
      ?auto_938718 - SURFACE
      ?auto_938720 - SURFACE
      ?auto_938719 - SURFACE
      ?auto_938721 - SURFACE
      ?auto_938722 - SURFACE
      ?auto_938723 - SURFACE
      ?auto_938724 - SURFACE
      ?auto_938725 - SURFACE
      ?auto_938726 - SURFACE
      ?auto_938727 - SURFACE
    )
    :vars
    (
      ?auto_938728 - HOIST
      ?auto_938730 - PLACE
      ?auto_938729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_938728 ?auto_938730 ) ( SURFACE-AT ?auto_938726 ?auto_938730 ) ( CLEAR ?auto_938726 ) ( IS-CRATE ?auto_938727 ) ( not ( = ?auto_938726 ?auto_938727 ) ) ( TRUCK-AT ?auto_938729 ?auto_938730 ) ( AVAILABLE ?auto_938728 ) ( IN ?auto_938727 ?auto_938729 ) ( ON ?auto_938726 ?auto_938725 ) ( not ( = ?auto_938725 ?auto_938726 ) ) ( not ( = ?auto_938725 ?auto_938727 ) ) ( ON ?auto_938717 ?auto_938716 ) ( ON ?auto_938718 ?auto_938717 ) ( ON ?auto_938720 ?auto_938718 ) ( ON ?auto_938719 ?auto_938720 ) ( ON ?auto_938721 ?auto_938719 ) ( ON ?auto_938722 ?auto_938721 ) ( ON ?auto_938723 ?auto_938722 ) ( ON ?auto_938724 ?auto_938723 ) ( ON ?auto_938725 ?auto_938724 ) ( not ( = ?auto_938716 ?auto_938717 ) ) ( not ( = ?auto_938716 ?auto_938718 ) ) ( not ( = ?auto_938716 ?auto_938720 ) ) ( not ( = ?auto_938716 ?auto_938719 ) ) ( not ( = ?auto_938716 ?auto_938721 ) ) ( not ( = ?auto_938716 ?auto_938722 ) ) ( not ( = ?auto_938716 ?auto_938723 ) ) ( not ( = ?auto_938716 ?auto_938724 ) ) ( not ( = ?auto_938716 ?auto_938725 ) ) ( not ( = ?auto_938716 ?auto_938726 ) ) ( not ( = ?auto_938716 ?auto_938727 ) ) ( not ( = ?auto_938717 ?auto_938718 ) ) ( not ( = ?auto_938717 ?auto_938720 ) ) ( not ( = ?auto_938717 ?auto_938719 ) ) ( not ( = ?auto_938717 ?auto_938721 ) ) ( not ( = ?auto_938717 ?auto_938722 ) ) ( not ( = ?auto_938717 ?auto_938723 ) ) ( not ( = ?auto_938717 ?auto_938724 ) ) ( not ( = ?auto_938717 ?auto_938725 ) ) ( not ( = ?auto_938717 ?auto_938726 ) ) ( not ( = ?auto_938717 ?auto_938727 ) ) ( not ( = ?auto_938718 ?auto_938720 ) ) ( not ( = ?auto_938718 ?auto_938719 ) ) ( not ( = ?auto_938718 ?auto_938721 ) ) ( not ( = ?auto_938718 ?auto_938722 ) ) ( not ( = ?auto_938718 ?auto_938723 ) ) ( not ( = ?auto_938718 ?auto_938724 ) ) ( not ( = ?auto_938718 ?auto_938725 ) ) ( not ( = ?auto_938718 ?auto_938726 ) ) ( not ( = ?auto_938718 ?auto_938727 ) ) ( not ( = ?auto_938720 ?auto_938719 ) ) ( not ( = ?auto_938720 ?auto_938721 ) ) ( not ( = ?auto_938720 ?auto_938722 ) ) ( not ( = ?auto_938720 ?auto_938723 ) ) ( not ( = ?auto_938720 ?auto_938724 ) ) ( not ( = ?auto_938720 ?auto_938725 ) ) ( not ( = ?auto_938720 ?auto_938726 ) ) ( not ( = ?auto_938720 ?auto_938727 ) ) ( not ( = ?auto_938719 ?auto_938721 ) ) ( not ( = ?auto_938719 ?auto_938722 ) ) ( not ( = ?auto_938719 ?auto_938723 ) ) ( not ( = ?auto_938719 ?auto_938724 ) ) ( not ( = ?auto_938719 ?auto_938725 ) ) ( not ( = ?auto_938719 ?auto_938726 ) ) ( not ( = ?auto_938719 ?auto_938727 ) ) ( not ( = ?auto_938721 ?auto_938722 ) ) ( not ( = ?auto_938721 ?auto_938723 ) ) ( not ( = ?auto_938721 ?auto_938724 ) ) ( not ( = ?auto_938721 ?auto_938725 ) ) ( not ( = ?auto_938721 ?auto_938726 ) ) ( not ( = ?auto_938721 ?auto_938727 ) ) ( not ( = ?auto_938722 ?auto_938723 ) ) ( not ( = ?auto_938722 ?auto_938724 ) ) ( not ( = ?auto_938722 ?auto_938725 ) ) ( not ( = ?auto_938722 ?auto_938726 ) ) ( not ( = ?auto_938722 ?auto_938727 ) ) ( not ( = ?auto_938723 ?auto_938724 ) ) ( not ( = ?auto_938723 ?auto_938725 ) ) ( not ( = ?auto_938723 ?auto_938726 ) ) ( not ( = ?auto_938723 ?auto_938727 ) ) ( not ( = ?auto_938724 ?auto_938725 ) ) ( not ( = ?auto_938724 ?auto_938726 ) ) ( not ( = ?auto_938724 ?auto_938727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_938725 ?auto_938726 ?auto_938727 )
      ( MAKE-11CRATE-VERIFY ?auto_938716 ?auto_938717 ?auto_938718 ?auto_938720 ?auto_938719 ?auto_938721 ?auto_938722 ?auto_938723 ?auto_938724 ?auto_938725 ?auto_938726 ?auto_938727 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_938837 - SURFACE
      ?auto_938838 - SURFACE
      ?auto_938839 - SURFACE
      ?auto_938841 - SURFACE
      ?auto_938840 - SURFACE
      ?auto_938842 - SURFACE
      ?auto_938843 - SURFACE
      ?auto_938844 - SURFACE
      ?auto_938845 - SURFACE
      ?auto_938846 - SURFACE
      ?auto_938847 - SURFACE
      ?auto_938848 - SURFACE
    )
    :vars
    (
      ?auto_938849 - HOIST
      ?auto_938850 - PLACE
      ?auto_938851 - TRUCK
      ?auto_938852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_938849 ?auto_938850 ) ( SURFACE-AT ?auto_938847 ?auto_938850 ) ( CLEAR ?auto_938847 ) ( IS-CRATE ?auto_938848 ) ( not ( = ?auto_938847 ?auto_938848 ) ) ( AVAILABLE ?auto_938849 ) ( IN ?auto_938848 ?auto_938851 ) ( ON ?auto_938847 ?auto_938846 ) ( not ( = ?auto_938846 ?auto_938847 ) ) ( not ( = ?auto_938846 ?auto_938848 ) ) ( TRUCK-AT ?auto_938851 ?auto_938852 ) ( not ( = ?auto_938852 ?auto_938850 ) ) ( ON ?auto_938838 ?auto_938837 ) ( ON ?auto_938839 ?auto_938838 ) ( ON ?auto_938841 ?auto_938839 ) ( ON ?auto_938840 ?auto_938841 ) ( ON ?auto_938842 ?auto_938840 ) ( ON ?auto_938843 ?auto_938842 ) ( ON ?auto_938844 ?auto_938843 ) ( ON ?auto_938845 ?auto_938844 ) ( ON ?auto_938846 ?auto_938845 ) ( not ( = ?auto_938837 ?auto_938838 ) ) ( not ( = ?auto_938837 ?auto_938839 ) ) ( not ( = ?auto_938837 ?auto_938841 ) ) ( not ( = ?auto_938837 ?auto_938840 ) ) ( not ( = ?auto_938837 ?auto_938842 ) ) ( not ( = ?auto_938837 ?auto_938843 ) ) ( not ( = ?auto_938837 ?auto_938844 ) ) ( not ( = ?auto_938837 ?auto_938845 ) ) ( not ( = ?auto_938837 ?auto_938846 ) ) ( not ( = ?auto_938837 ?auto_938847 ) ) ( not ( = ?auto_938837 ?auto_938848 ) ) ( not ( = ?auto_938838 ?auto_938839 ) ) ( not ( = ?auto_938838 ?auto_938841 ) ) ( not ( = ?auto_938838 ?auto_938840 ) ) ( not ( = ?auto_938838 ?auto_938842 ) ) ( not ( = ?auto_938838 ?auto_938843 ) ) ( not ( = ?auto_938838 ?auto_938844 ) ) ( not ( = ?auto_938838 ?auto_938845 ) ) ( not ( = ?auto_938838 ?auto_938846 ) ) ( not ( = ?auto_938838 ?auto_938847 ) ) ( not ( = ?auto_938838 ?auto_938848 ) ) ( not ( = ?auto_938839 ?auto_938841 ) ) ( not ( = ?auto_938839 ?auto_938840 ) ) ( not ( = ?auto_938839 ?auto_938842 ) ) ( not ( = ?auto_938839 ?auto_938843 ) ) ( not ( = ?auto_938839 ?auto_938844 ) ) ( not ( = ?auto_938839 ?auto_938845 ) ) ( not ( = ?auto_938839 ?auto_938846 ) ) ( not ( = ?auto_938839 ?auto_938847 ) ) ( not ( = ?auto_938839 ?auto_938848 ) ) ( not ( = ?auto_938841 ?auto_938840 ) ) ( not ( = ?auto_938841 ?auto_938842 ) ) ( not ( = ?auto_938841 ?auto_938843 ) ) ( not ( = ?auto_938841 ?auto_938844 ) ) ( not ( = ?auto_938841 ?auto_938845 ) ) ( not ( = ?auto_938841 ?auto_938846 ) ) ( not ( = ?auto_938841 ?auto_938847 ) ) ( not ( = ?auto_938841 ?auto_938848 ) ) ( not ( = ?auto_938840 ?auto_938842 ) ) ( not ( = ?auto_938840 ?auto_938843 ) ) ( not ( = ?auto_938840 ?auto_938844 ) ) ( not ( = ?auto_938840 ?auto_938845 ) ) ( not ( = ?auto_938840 ?auto_938846 ) ) ( not ( = ?auto_938840 ?auto_938847 ) ) ( not ( = ?auto_938840 ?auto_938848 ) ) ( not ( = ?auto_938842 ?auto_938843 ) ) ( not ( = ?auto_938842 ?auto_938844 ) ) ( not ( = ?auto_938842 ?auto_938845 ) ) ( not ( = ?auto_938842 ?auto_938846 ) ) ( not ( = ?auto_938842 ?auto_938847 ) ) ( not ( = ?auto_938842 ?auto_938848 ) ) ( not ( = ?auto_938843 ?auto_938844 ) ) ( not ( = ?auto_938843 ?auto_938845 ) ) ( not ( = ?auto_938843 ?auto_938846 ) ) ( not ( = ?auto_938843 ?auto_938847 ) ) ( not ( = ?auto_938843 ?auto_938848 ) ) ( not ( = ?auto_938844 ?auto_938845 ) ) ( not ( = ?auto_938844 ?auto_938846 ) ) ( not ( = ?auto_938844 ?auto_938847 ) ) ( not ( = ?auto_938844 ?auto_938848 ) ) ( not ( = ?auto_938845 ?auto_938846 ) ) ( not ( = ?auto_938845 ?auto_938847 ) ) ( not ( = ?auto_938845 ?auto_938848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_938846 ?auto_938847 ?auto_938848 )
      ( MAKE-11CRATE-VERIFY ?auto_938837 ?auto_938838 ?auto_938839 ?auto_938841 ?auto_938840 ?auto_938842 ?auto_938843 ?auto_938844 ?auto_938845 ?auto_938846 ?auto_938847 ?auto_938848 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_938969 - SURFACE
      ?auto_938970 - SURFACE
      ?auto_938971 - SURFACE
      ?auto_938973 - SURFACE
      ?auto_938972 - SURFACE
      ?auto_938974 - SURFACE
      ?auto_938975 - SURFACE
      ?auto_938976 - SURFACE
      ?auto_938977 - SURFACE
      ?auto_938978 - SURFACE
      ?auto_938979 - SURFACE
      ?auto_938980 - SURFACE
    )
    :vars
    (
      ?auto_938982 - HOIST
      ?auto_938984 - PLACE
      ?auto_938983 - TRUCK
      ?auto_938981 - PLACE
      ?auto_938985 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_938982 ?auto_938984 ) ( SURFACE-AT ?auto_938979 ?auto_938984 ) ( CLEAR ?auto_938979 ) ( IS-CRATE ?auto_938980 ) ( not ( = ?auto_938979 ?auto_938980 ) ) ( AVAILABLE ?auto_938982 ) ( ON ?auto_938979 ?auto_938978 ) ( not ( = ?auto_938978 ?auto_938979 ) ) ( not ( = ?auto_938978 ?auto_938980 ) ) ( TRUCK-AT ?auto_938983 ?auto_938981 ) ( not ( = ?auto_938981 ?auto_938984 ) ) ( HOIST-AT ?auto_938985 ?auto_938981 ) ( LIFTING ?auto_938985 ?auto_938980 ) ( not ( = ?auto_938982 ?auto_938985 ) ) ( ON ?auto_938970 ?auto_938969 ) ( ON ?auto_938971 ?auto_938970 ) ( ON ?auto_938973 ?auto_938971 ) ( ON ?auto_938972 ?auto_938973 ) ( ON ?auto_938974 ?auto_938972 ) ( ON ?auto_938975 ?auto_938974 ) ( ON ?auto_938976 ?auto_938975 ) ( ON ?auto_938977 ?auto_938976 ) ( ON ?auto_938978 ?auto_938977 ) ( not ( = ?auto_938969 ?auto_938970 ) ) ( not ( = ?auto_938969 ?auto_938971 ) ) ( not ( = ?auto_938969 ?auto_938973 ) ) ( not ( = ?auto_938969 ?auto_938972 ) ) ( not ( = ?auto_938969 ?auto_938974 ) ) ( not ( = ?auto_938969 ?auto_938975 ) ) ( not ( = ?auto_938969 ?auto_938976 ) ) ( not ( = ?auto_938969 ?auto_938977 ) ) ( not ( = ?auto_938969 ?auto_938978 ) ) ( not ( = ?auto_938969 ?auto_938979 ) ) ( not ( = ?auto_938969 ?auto_938980 ) ) ( not ( = ?auto_938970 ?auto_938971 ) ) ( not ( = ?auto_938970 ?auto_938973 ) ) ( not ( = ?auto_938970 ?auto_938972 ) ) ( not ( = ?auto_938970 ?auto_938974 ) ) ( not ( = ?auto_938970 ?auto_938975 ) ) ( not ( = ?auto_938970 ?auto_938976 ) ) ( not ( = ?auto_938970 ?auto_938977 ) ) ( not ( = ?auto_938970 ?auto_938978 ) ) ( not ( = ?auto_938970 ?auto_938979 ) ) ( not ( = ?auto_938970 ?auto_938980 ) ) ( not ( = ?auto_938971 ?auto_938973 ) ) ( not ( = ?auto_938971 ?auto_938972 ) ) ( not ( = ?auto_938971 ?auto_938974 ) ) ( not ( = ?auto_938971 ?auto_938975 ) ) ( not ( = ?auto_938971 ?auto_938976 ) ) ( not ( = ?auto_938971 ?auto_938977 ) ) ( not ( = ?auto_938971 ?auto_938978 ) ) ( not ( = ?auto_938971 ?auto_938979 ) ) ( not ( = ?auto_938971 ?auto_938980 ) ) ( not ( = ?auto_938973 ?auto_938972 ) ) ( not ( = ?auto_938973 ?auto_938974 ) ) ( not ( = ?auto_938973 ?auto_938975 ) ) ( not ( = ?auto_938973 ?auto_938976 ) ) ( not ( = ?auto_938973 ?auto_938977 ) ) ( not ( = ?auto_938973 ?auto_938978 ) ) ( not ( = ?auto_938973 ?auto_938979 ) ) ( not ( = ?auto_938973 ?auto_938980 ) ) ( not ( = ?auto_938972 ?auto_938974 ) ) ( not ( = ?auto_938972 ?auto_938975 ) ) ( not ( = ?auto_938972 ?auto_938976 ) ) ( not ( = ?auto_938972 ?auto_938977 ) ) ( not ( = ?auto_938972 ?auto_938978 ) ) ( not ( = ?auto_938972 ?auto_938979 ) ) ( not ( = ?auto_938972 ?auto_938980 ) ) ( not ( = ?auto_938974 ?auto_938975 ) ) ( not ( = ?auto_938974 ?auto_938976 ) ) ( not ( = ?auto_938974 ?auto_938977 ) ) ( not ( = ?auto_938974 ?auto_938978 ) ) ( not ( = ?auto_938974 ?auto_938979 ) ) ( not ( = ?auto_938974 ?auto_938980 ) ) ( not ( = ?auto_938975 ?auto_938976 ) ) ( not ( = ?auto_938975 ?auto_938977 ) ) ( not ( = ?auto_938975 ?auto_938978 ) ) ( not ( = ?auto_938975 ?auto_938979 ) ) ( not ( = ?auto_938975 ?auto_938980 ) ) ( not ( = ?auto_938976 ?auto_938977 ) ) ( not ( = ?auto_938976 ?auto_938978 ) ) ( not ( = ?auto_938976 ?auto_938979 ) ) ( not ( = ?auto_938976 ?auto_938980 ) ) ( not ( = ?auto_938977 ?auto_938978 ) ) ( not ( = ?auto_938977 ?auto_938979 ) ) ( not ( = ?auto_938977 ?auto_938980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_938978 ?auto_938979 ?auto_938980 )
      ( MAKE-11CRATE-VERIFY ?auto_938969 ?auto_938970 ?auto_938971 ?auto_938973 ?auto_938972 ?auto_938974 ?auto_938975 ?auto_938976 ?auto_938977 ?auto_938978 ?auto_938979 ?auto_938980 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939112 - SURFACE
      ?auto_939113 - SURFACE
      ?auto_939114 - SURFACE
      ?auto_939116 - SURFACE
      ?auto_939115 - SURFACE
      ?auto_939117 - SURFACE
      ?auto_939118 - SURFACE
      ?auto_939119 - SURFACE
      ?auto_939120 - SURFACE
      ?auto_939121 - SURFACE
      ?auto_939122 - SURFACE
      ?auto_939123 - SURFACE
    )
    :vars
    (
      ?auto_939125 - HOIST
      ?auto_939124 - PLACE
      ?auto_939128 - TRUCK
      ?auto_939127 - PLACE
      ?auto_939129 - HOIST
      ?auto_939126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939125 ?auto_939124 ) ( SURFACE-AT ?auto_939122 ?auto_939124 ) ( CLEAR ?auto_939122 ) ( IS-CRATE ?auto_939123 ) ( not ( = ?auto_939122 ?auto_939123 ) ) ( AVAILABLE ?auto_939125 ) ( ON ?auto_939122 ?auto_939121 ) ( not ( = ?auto_939121 ?auto_939122 ) ) ( not ( = ?auto_939121 ?auto_939123 ) ) ( TRUCK-AT ?auto_939128 ?auto_939127 ) ( not ( = ?auto_939127 ?auto_939124 ) ) ( HOIST-AT ?auto_939129 ?auto_939127 ) ( not ( = ?auto_939125 ?auto_939129 ) ) ( AVAILABLE ?auto_939129 ) ( SURFACE-AT ?auto_939123 ?auto_939127 ) ( ON ?auto_939123 ?auto_939126 ) ( CLEAR ?auto_939123 ) ( not ( = ?auto_939122 ?auto_939126 ) ) ( not ( = ?auto_939123 ?auto_939126 ) ) ( not ( = ?auto_939121 ?auto_939126 ) ) ( ON ?auto_939113 ?auto_939112 ) ( ON ?auto_939114 ?auto_939113 ) ( ON ?auto_939116 ?auto_939114 ) ( ON ?auto_939115 ?auto_939116 ) ( ON ?auto_939117 ?auto_939115 ) ( ON ?auto_939118 ?auto_939117 ) ( ON ?auto_939119 ?auto_939118 ) ( ON ?auto_939120 ?auto_939119 ) ( ON ?auto_939121 ?auto_939120 ) ( not ( = ?auto_939112 ?auto_939113 ) ) ( not ( = ?auto_939112 ?auto_939114 ) ) ( not ( = ?auto_939112 ?auto_939116 ) ) ( not ( = ?auto_939112 ?auto_939115 ) ) ( not ( = ?auto_939112 ?auto_939117 ) ) ( not ( = ?auto_939112 ?auto_939118 ) ) ( not ( = ?auto_939112 ?auto_939119 ) ) ( not ( = ?auto_939112 ?auto_939120 ) ) ( not ( = ?auto_939112 ?auto_939121 ) ) ( not ( = ?auto_939112 ?auto_939122 ) ) ( not ( = ?auto_939112 ?auto_939123 ) ) ( not ( = ?auto_939112 ?auto_939126 ) ) ( not ( = ?auto_939113 ?auto_939114 ) ) ( not ( = ?auto_939113 ?auto_939116 ) ) ( not ( = ?auto_939113 ?auto_939115 ) ) ( not ( = ?auto_939113 ?auto_939117 ) ) ( not ( = ?auto_939113 ?auto_939118 ) ) ( not ( = ?auto_939113 ?auto_939119 ) ) ( not ( = ?auto_939113 ?auto_939120 ) ) ( not ( = ?auto_939113 ?auto_939121 ) ) ( not ( = ?auto_939113 ?auto_939122 ) ) ( not ( = ?auto_939113 ?auto_939123 ) ) ( not ( = ?auto_939113 ?auto_939126 ) ) ( not ( = ?auto_939114 ?auto_939116 ) ) ( not ( = ?auto_939114 ?auto_939115 ) ) ( not ( = ?auto_939114 ?auto_939117 ) ) ( not ( = ?auto_939114 ?auto_939118 ) ) ( not ( = ?auto_939114 ?auto_939119 ) ) ( not ( = ?auto_939114 ?auto_939120 ) ) ( not ( = ?auto_939114 ?auto_939121 ) ) ( not ( = ?auto_939114 ?auto_939122 ) ) ( not ( = ?auto_939114 ?auto_939123 ) ) ( not ( = ?auto_939114 ?auto_939126 ) ) ( not ( = ?auto_939116 ?auto_939115 ) ) ( not ( = ?auto_939116 ?auto_939117 ) ) ( not ( = ?auto_939116 ?auto_939118 ) ) ( not ( = ?auto_939116 ?auto_939119 ) ) ( not ( = ?auto_939116 ?auto_939120 ) ) ( not ( = ?auto_939116 ?auto_939121 ) ) ( not ( = ?auto_939116 ?auto_939122 ) ) ( not ( = ?auto_939116 ?auto_939123 ) ) ( not ( = ?auto_939116 ?auto_939126 ) ) ( not ( = ?auto_939115 ?auto_939117 ) ) ( not ( = ?auto_939115 ?auto_939118 ) ) ( not ( = ?auto_939115 ?auto_939119 ) ) ( not ( = ?auto_939115 ?auto_939120 ) ) ( not ( = ?auto_939115 ?auto_939121 ) ) ( not ( = ?auto_939115 ?auto_939122 ) ) ( not ( = ?auto_939115 ?auto_939123 ) ) ( not ( = ?auto_939115 ?auto_939126 ) ) ( not ( = ?auto_939117 ?auto_939118 ) ) ( not ( = ?auto_939117 ?auto_939119 ) ) ( not ( = ?auto_939117 ?auto_939120 ) ) ( not ( = ?auto_939117 ?auto_939121 ) ) ( not ( = ?auto_939117 ?auto_939122 ) ) ( not ( = ?auto_939117 ?auto_939123 ) ) ( not ( = ?auto_939117 ?auto_939126 ) ) ( not ( = ?auto_939118 ?auto_939119 ) ) ( not ( = ?auto_939118 ?auto_939120 ) ) ( not ( = ?auto_939118 ?auto_939121 ) ) ( not ( = ?auto_939118 ?auto_939122 ) ) ( not ( = ?auto_939118 ?auto_939123 ) ) ( not ( = ?auto_939118 ?auto_939126 ) ) ( not ( = ?auto_939119 ?auto_939120 ) ) ( not ( = ?auto_939119 ?auto_939121 ) ) ( not ( = ?auto_939119 ?auto_939122 ) ) ( not ( = ?auto_939119 ?auto_939123 ) ) ( not ( = ?auto_939119 ?auto_939126 ) ) ( not ( = ?auto_939120 ?auto_939121 ) ) ( not ( = ?auto_939120 ?auto_939122 ) ) ( not ( = ?auto_939120 ?auto_939123 ) ) ( not ( = ?auto_939120 ?auto_939126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939121 ?auto_939122 ?auto_939123 )
      ( MAKE-11CRATE-VERIFY ?auto_939112 ?auto_939113 ?auto_939114 ?auto_939116 ?auto_939115 ?auto_939117 ?auto_939118 ?auto_939119 ?auto_939120 ?auto_939121 ?auto_939122 ?auto_939123 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939256 - SURFACE
      ?auto_939257 - SURFACE
      ?auto_939258 - SURFACE
      ?auto_939260 - SURFACE
      ?auto_939259 - SURFACE
      ?auto_939261 - SURFACE
      ?auto_939262 - SURFACE
      ?auto_939263 - SURFACE
      ?auto_939264 - SURFACE
      ?auto_939265 - SURFACE
      ?auto_939266 - SURFACE
      ?auto_939267 - SURFACE
    )
    :vars
    (
      ?auto_939272 - HOIST
      ?auto_939273 - PLACE
      ?auto_939269 - PLACE
      ?auto_939271 - HOIST
      ?auto_939270 - SURFACE
      ?auto_939268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939272 ?auto_939273 ) ( SURFACE-AT ?auto_939266 ?auto_939273 ) ( CLEAR ?auto_939266 ) ( IS-CRATE ?auto_939267 ) ( not ( = ?auto_939266 ?auto_939267 ) ) ( AVAILABLE ?auto_939272 ) ( ON ?auto_939266 ?auto_939265 ) ( not ( = ?auto_939265 ?auto_939266 ) ) ( not ( = ?auto_939265 ?auto_939267 ) ) ( not ( = ?auto_939269 ?auto_939273 ) ) ( HOIST-AT ?auto_939271 ?auto_939269 ) ( not ( = ?auto_939272 ?auto_939271 ) ) ( AVAILABLE ?auto_939271 ) ( SURFACE-AT ?auto_939267 ?auto_939269 ) ( ON ?auto_939267 ?auto_939270 ) ( CLEAR ?auto_939267 ) ( not ( = ?auto_939266 ?auto_939270 ) ) ( not ( = ?auto_939267 ?auto_939270 ) ) ( not ( = ?auto_939265 ?auto_939270 ) ) ( TRUCK-AT ?auto_939268 ?auto_939273 ) ( ON ?auto_939257 ?auto_939256 ) ( ON ?auto_939258 ?auto_939257 ) ( ON ?auto_939260 ?auto_939258 ) ( ON ?auto_939259 ?auto_939260 ) ( ON ?auto_939261 ?auto_939259 ) ( ON ?auto_939262 ?auto_939261 ) ( ON ?auto_939263 ?auto_939262 ) ( ON ?auto_939264 ?auto_939263 ) ( ON ?auto_939265 ?auto_939264 ) ( not ( = ?auto_939256 ?auto_939257 ) ) ( not ( = ?auto_939256 ?auto_939258 ) ) ( not ( = ?auto_939256 ?auto_939260 ) ) ( not ( = ?auto_939256 ?auto_939259 ) ) ( not ( = ?auto_939256 ?auto_939261 ) ) ( not ( = ?auto_939256 ?auto_939262 ) ) ( not ( = ?auto_939256 ?auto_939263 ) ) ( not ( = ?auto_939256 ?auto_939264 ) ) ( not ( = ?auto_939256 ?auto_939265 ) ) ( not ( = ?auto_939256 ?auto_939266 ) ) ( not ( = ?auto_939256 ?auto_939267 ) ) ( not ( = ?auto_939256 ?auto_939270 ) ) ( not ( = ?auto_939257 ?auto_939258 ) ) ( not ( = ?auto_939257 ?auto_939260 ) ) ( not ( = ?auto_939257 ?auto_939259 ) ) ( not ( = ?auto_939257 ?auto_939261 ) ) ( not ( = ?auto_939257 ?auto_939262 ) ) ( not ( = ?auto_939257 ?auto_939263 ) ) ( not ( = ?auto_939257 ?auto_939264 ) ) ( not ( = ?auto_939257 ?auto_939265 ) ) ( not ( = ?auto_939257 ?auto_939266 ) ) ( not ( = ?auto_939257 ?auto_939267 ) ) ( not ( = ?auto_939257 ?auto_939270 ) ) ( not ( = ?auto_939258 ?auto_939260 ) ) ( not ( = ?auto_939258 ?auto_939259 ) ) ( not ( = ?auto_939258 ?auto_939261 ) ) ( not ( = ?auto_939258 ?auto_939262 ) ) ( not ( = ?auto_939258 ?auto_939263 ) ) ( not ( = ?auto_939258 ?auto_939264 ) ) ( not ( = ?auto_939258 ?auto_939265 ) ) ( not ( = ?auto_939258 ?auto_939266 ) ) ( not ( = ?auto_939258 ?auto_939267 ) ) ( not ( = ?auto_939258 ?auto_939270 ) ) ( not ( = ?auto_939260 ?auto_939259 ) ) ( not ( = ?auto_939260 ?auto_939261 ) ) ( not ( = ?auto_939260 ?auto_939262 ) ) ( not ( = ?auto_939260 ?auto_939263 ) ) ( not ( = ?auto_939260 ?auto_939264 ) ) ( not ( = ?auto_939260 ?auto_939265 ) ) ( not ( = ?auto_939260 ?auto_939266 ) ) ( not ( = ?auto_939260 ?auto_939267 ) ) ( not ( = ?auto_939260 ?auto_939270 ) ) ( not ( = ?auto_939259 ?auto_939261 ) ) ( not ( = ?auto_939259 ?auto_939262 ) ) ( not ( = ?auto_939259 ?auto_939263 ) ) ( not ( = ?auto_939259 ?auto_939264 ) ) ( not ( = ?auto_939259 ?auto_939265 ) ) ( not ( = ?auto_939259 ?auto_939266 ) ) ( not ( = ?auto_939259 ?auto_939267 ) ) ( not ( = ?auto_939259 ?auto_939270 ) ) ( not ( = ?auto_939261 ?auto_939262 ) ) ( not ( = ?auto_939261 ?auto_939263 ) ) ( not ( = ?auto_939261 ?auto_939264 ) ) ( not ( = ?auto_939261 ?auto_939265 ) ) ( not ( = ?auto_939261 ?auto_939266 ) ) ( not ( = ?auto_939261 ?auto_939267 ) ) ( not ( = ?auto_939261 ?auto_939270 ) ) ( not ( = ?auto_939262 ?auto_939263 ) ) ( not ( = ?auto_939262 ?auto_939264 ) ) ( not ( = ?auto_939262 ?auto_939265 ) ) ( not ( = ?auto_939262 ?auto_939266 ) ) ( not ( = ?auto_939262 ?auto_939267 ) ) ( not ( = ?auto_939262 ?auto_939270 ) ) ( not ( = ?auto_939263 ?auto_939264 ) ) ( not ( = ?auto_939263 ?auto_939265 ) ) ( not ( = ?auto_939263 ?auto_939266 ) ) ( not ( = ?auto_939263 ?auto_939267 ) ) ( not ( = ?auto_939263 ?auto_939270 ) ) ( not ( = ?auto_939264 ?auto_939265 ) ) ( not ( = ?auto_939264 ?auto_939266 ) ) ( not ( = ?auto_939264 ?auto_939267 ) ) ( not ( = ?auto_939264 ?auto_939270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939265 ?auto_939266 ?auto_939267 )
      ( MAKE-11CRATE-VERIFY ?auto_939256 ?auto_939257 ?auto_939258 ?auto_939260 ?auto_939259 ?auto_939261 ?auto_939262 ?auto_939263 ?auto_939264 ?auto_939265 ?auto_939266 ?auto_939267 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939400 - SURFACE
      ?auto_939401 - SURFACE
      ?auto_939402 - SURFACE
      ?auto_939404 - SURFACE
      ?auto_939403 - SURFACE
      ?auto_939405 - SURFACE
      ?auto_939406 - SURFACE
      ?auto_939407 - SURFACE
      ?auto_939408 - SURFACE
      ?auto_939409 - SURFACE
      ?auto_939410 - SURFACE
      ?auto_939411 - SURFACE
    )
    :vars
    (
      ?auto_939413 - HOIST
      ?auto_939417 - PLACE
      ?auto_939412 - PLACE
      ?auto_939414 - HOIST
      ?auto_939416 - SURFACE
      ?auto_939415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939413 ?auto_939417 ) ( IS-CRATE ?auto_939411 ) ( not ( = ?auto_939410 ?auto_939411 ) ) ( not ( = ?auto_939409 ?auto_939410 ) ) ( not ( = ?auto_939409 ?auto_939411 ) ) ( not ( = ?auto_939412 ?auto_939417 ) ) ( HOIST-AT ?auto_939414 ?auto_939412 ) ( not ( = ?auto_939413 ?auto_939414 ) ) ( AVAILABLE ?auto_939414 ) ( SURFACE-AT ?auto_939411 ?auto_939412 ) ( ON ?auto_939411 ?auto_939416 ) ( CLEAR ?auto_939411 ) ( not ( = ?auto_939410 ?auto_939416 ) ) ( not ( = ?auto_939411 ?auto_939416 ) ) ( not ( = ?auto_939409 ?auto_939416 ) ) ( TRUCK-AT ?auto_939415 ?auto_939417 ) ( SURFACE-AT ?auto_939409 ?auto_939417 ) ( CLEAR ?auto_939409 ) ( LIFTING ?auto_939413 ?auto_939410 ) ( IS-CRATE ?auto_939410 ) ( ON ?auto_939401 ?auto_939400 ) ( ON ?auto_939402 ?auto_939401 ) ( ON ?auto_939404 ?auto_939402 ) ( ON ?auto_939403 ?auto_939404 ) ( ON ?auto_939405 ?auto_939403 ) ( ON ?auto_939406 ?auto_939405 ) ( ON ?auto_939407 ?auto_939406 ) ( ON ?auto_939408 ?auto_939407 ) ( ON ?auto_939409 ?auto_939408 ) ( not ( = ?auto_939400 ?auto_939401 ) ) ( not ( = ?auto_939400 ?auto_939402 ) ) ( not ( = ?auto_939400 ?auto_939404 ) ) ( not ( = ?auto_939400 ?auto_939403 ) ) ( not ( = ?auto_939400 ?auto_939405 ) ) ( not ( = ?auto_939400 ?auto_939406 ) ) ( not ( = ?auto_939400 ?auto_939407 ) ) ( not ( = ?auto_939400 ?auto_939408 ) ) ( not ( = ?auto_939400 ?auto_939409 ) ) ( not ( = ?auto_939400 ?auto_939410 ) ) ( not ( = ?auto_939400 ?auto_939411 ) ) ( not ( = ?auto_939400 ?auto_939416 ) ) ( not ( = ?auto_939401 ?auto_939402 ) ) ( not ( = ?auto_939401 ?auto_939404 ) ) ( not ( = ?auto_939401 ?auto_939403 ) ) ( not ( = ?auto_939401 ?auto_939405 ) ) ( not ( = ?auto_939401 ?auto_939406 ) ) ( not ( = ?auto_939401 ?auto_939407 ) ) ( not ( = ?auto_939401 ?auto_939408 ) ) ( not ( = ?auto_939401 ?auto_939409 ) ) ( not ( = ?auto_939401 ?auto_939410 ) ) ( not ( = ?auto_939401 ?auto_939411 ) ) ( not ( = ?auto_939401 ?auto_939416 ) ) ( not ( = ?auto_939402 ?auto_939404 ) ) ( not ( = ?auto_939402 ?auto_939403 ) ) ( not ( = ?auto_939402 ?auto_939405 ) ) ( not ( = ?auto_939402 ?auto_939406 ) ) ( not ( = ?auto_939402 ?auto_939407 ) ) ( not ( = ?auto_939402 ?auto_939408 ) ) ( not ( = ?auto_939402 ?auto_939409 ) ) ( not ( = ?auto_939402 ?auto_939410 ) ) ( not ( = ?auto_939402 ?auto_939411 ) ) ( not ( = ?auto_939402 ?auto_939416 ) ) ( not ( = ?auto_939404 ?auto_939403 ) ) ( not ( = ?auto_939404 ?auto_939405 ) ) ( not ( = ?auto_939404 ?auto_939406 ) ) ( not ( = ?auto_939404 ?auto_939407 ) ) ( not ( = ?auto_939404 ?auto_939408 ) ) ( not ( = ?auto_939404 ?auto_939409 ) ) ( not ( = ?auto_939404 ?auto_939410 ) ) ( not ( = ?auto_939404 ?auto_939411 ) ) ( not ( = ?auto_939404 ?auto_939416 ) ) ( not ( = ?auto_939403 ?auto_939405 ) ) ( not ( = ?auto_939403 ?auto_939406 ) ) ( not ( = ?auto_939403 ?auto_939407 ) ) ( not ( = ?auto_939403 ?auto_939408 ) ) ( not ( = ?auto_939403 ?auto_939409 ) ) ( not ( = ?auto_939403 ?auto_939410 ) ) ( not ( = ?auto_939403 ?auto_939411 ) ) ( not ( = ?auto_939403 ?auto_939416 ) ) ( not ( = ?auto_939405 ?auto_939406 ) ) ( not ( = ?auto_939405 ?auto_939407 ) ) ( not ( = ?auto_939405 ?auto_939408 ) ) ( not ( = ?auto_939405 ?auto_939409 ) ) ( not ( = ?auto_939405 ?auto_939410 ) ) ( not ( = ?auto_939405 ?auto_939411 ) ) ( not ( = ?auto_939405 ?auto_939416 ) ) ( not ( = ?auto_939406 ?auto_939407 ) ) ( not ( = ?auto_939406 ?auto_939408 ) ) ( not ( = ?auto_939406 ?auto_939409 ) ) ( not ( = ?auto_939406 ?auto_939410 ) ) ( not ( = ?auto_939406 ?auto_939411 ) ) ( not ( = ?auto_939406 ?auto_939416 ) ) ( not ( = ?auto_939407 ?auto_939408 ) ) ( not ( = ?auto_939407 ?auto_939409 ) ) ( not ( = ?auto_939407 ?auto_939410 ) ) ( not ( = ?auto_939407 ?auto_939411 ) ) ( not ( = ?auto_939407 ?auto_939416 ) ) ( not ( = ?auto_939408 ?auto_939409 ) ) ( not ( = ?auto_939408 ?auto_939410 ) ) ( not ( = ?auto_939408 ?auto_939411 ) ) ( not ( = ?auto_939408 ?auto_939416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939409 ?auto_939410 ?auto_939411 )
      ( MAKE-11CRATE-VERIFY ?auto_939400 ?auto_939401 ?auto_939402 ?auto_939404 ?auto_939403 ?auto_939405 ?auto_939406 ?auto_939407 ?auto_939408 ?auto_939409 ?auto_939410 ?auto_939411 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939544 - SURFACE
      ?auto_939545 - SURFACE
      ?auto_939546 - SURFACE
      ?auto_939548 - SURFACE
      ?auto_939547 - SURFACE
      ?auto_939549 - SURFACE
      ?auto_939550 - SURFACE
      ?auto_939551 - SURFACE
      ?auto_939552 - SURFACE
      ?auto_939553 - SURFACE
      ?auto_939554 - SURFACE
      ?auto_939555 - SURFACE
    )
    :vars
    (
      ?auto_939557 - HOIST
      ?auto_939556 - PLACE
      ?auto_939559 - PLACE
      ?auto_939558 - HOIST
      ?auto_939561 - SURFACE
      ?auto_939560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939557 ?auto_939556 ) ( IS-CRATE ?auto_939555 ) ( not ( = ?auto_939554 ?auto_939555 ) ) ( not ( = ?auto_939553 ?auto_939554 ) ) ( not ( = ?auto_939553 ?auto_939555 ) ) ( not ( = ?auto_939559 ?auto_939556 ) ) ( HOIST-AT ?auto_939558 ?auto_939559 ) ( not ( = ?auto_939557 ?auto_939558 ) ) ( AVAILABLE ?auto_939558 ) ( SURFACE-AT ?auto_939555 ?auto_939559 ) ( ON ?auto_939555 ?auto_939561 ) ( CLEAR ?auto_939555 ) ( not ( = ?auto_939554 ?auto_939561 ) ) ( not ( = ?auto_939555 ?auto_939561 ) ) ( not ( = ?auto_939553 ?auto_939561 ) ) ( TRUCK-AT ?auto_939560 ?auto_939556 ) ( SURFACE-AT ?auto_939553 ?auto_939556 ) ( CLEAR ?auto_939553 ) ( IS-CRATE ?auto_939554 ) ( AVAILABLE ?auto_939557 ) ( IN ?auto_939554 ?auto_939560 ) ( ON ?auto_939545 ?auto_939544 ) ( ON ?auto_939546 ?auto_939545 ) ( ON ?auto_939548 ?auto_939546 ) ( ON ?auto_939547 ?auto_939548 ) ( ON ?auto_939549 ?auto_939547 ) ( ON ?auto_939550 ?auto_939549 ) ( ON ?auto_939551 ?auto_939550 ) ( ON ?auto_939552 ?auto_939551 ) ( ON ?auto_939553 ?auto_939552 ) ( not ( = ?auto_939544 ?auto_939545 ) ) ( not ( = ?auto_939544 ?auto_939546 ) ) ( not ( = ?auto_939544 ?auto_939548 ) ) ( not ( = ?auto_939544 ?auto_939547 ) ) ( not ( = ?auto_939544 ?auto_939549 ) ) ( not ( = ?auto_939544 ?auto_939550 ) ) ( not ( = ?auto_939544 ?auto_939551 ) ) ( not ( = ?auto_939544 ?auto_939552 ) ) ( not ( = ?auto_939544 ?auto_939553 ) ) ( not ( = ?auto_939544 ?auto_939554 ) ) ( not ( = ?auto_939544 ?auto_939555 ) ) ( not ( = ?auto_939544 ?auto_939561 ) ) ( not ( = ?auto_939545 ?auto_939546 ) ) ( not ( = ?auto_939545 ?auto_939548 ) ) ( not ( = ?auto_939545 ?auto_939547 ) ) ( not ( = ?auto_939545 ?auto_939549 ) ) ( not ( = ?auto_939545 ?auto_939550 ) ) ( not ( = ?auto_939545 ?auto_939551 ) ) ( not ( = ?auto_939545 ?auto_939552 ) ) ( not ( = ?auto_939545 ?auto_939553 ) ) ( not ( = ?auto_939545 ?auto_939554 ) ) ( not ( = ?auto_939545 ?auto_939555 ) ) ( not ( = ?auto_939545 ?auto_939561 ) ) ( not ( = ?auto_939546 ?auto_939548 ) ) ( not ( = ?auto_939546 ?auto_939547 ) ) ( not ( = ?auto_939546 ?auto_939549 ) ) ( not ( = ?auto_939546 ?auto_939550 ) ) ( not ( = ?auto_939546 ?auto_939551 ) ) ( not ( = ?auto_939546 ?auto_939552 ) ) ( not ( = ?auto_939546 ?auto_939553 ) ) ( not ( = ?auto_939546 ?auto_939554 ) ) ( not ( = ?auto_939546 ?auto_939555 ) ) ( not ( = ?auto_939546 ?auto_939561 ) ) ( not ( = ?auto_939548 ?auto_939547 ) ) ( not ( = ?auto_939548 ?auto_939549 ) ) ( not ( = ?auto_939548 ?auto_939550 ) ) ( not ( = ?auto_939548 ?auto_939551 ) ) ( not ( = ?auto_939548 ?auto_939552 ) ) ( not ( = ?auto_939548 ?auto_939553 ) ) ( not ( = ?auto_939548 ?auto_939554 ) ) ( not ( = ?auto_939548 ?auto_939555 ) ) ( not ( = ?auto_939548 ?auto_939561 ) ) ( not ( = ?auto_939547 ?auto_939549 ) ) ( not ( = ?auto_939547 ?auto_939550 ) ) ( not ( = ?auto_939547 ?auto_939551 ) ) ( not ( = ?auto_939547 ?auto_939552 ) ) ( not ( = ?auto_939547 ?auto_939553 ) ) ( not ( = ?auto_939547 ?auto_939554 ) ) ( not ( = ?auto_939547 ?auto_939555 ) ) ( not ( = ?auto_939547 ?auto_939561 ) ) ( not ( = ?auto_939549 ?auto_939550 ) ) ( not ( = ?auto_939549 ?auto_939551 ) ) ( not ( = ?auto_939549 ?auto_939552 ) ) ( not ( = ?auto_939549 ?auto_939553 ) ) ( not ( = ?auto_939549 ?auto_939554 ) ) ( not ( = ?auto_939549 ?auto_939555 ) ) ( not ( = ?auto_939549 ?auto_939561 ) ) ( not ( = ?auto_939550 ?auto_939551 ) ) ( not ( = ?auto_939550 ?auto_939552 ) ) ( not ( = ?auto_939550 ?auto_939553 ) ) ( not ( = ?auto_939550 ?auto_939554 ) ) ( not ( = ?auto_939550 ?auto_939555 ) ) ( not ( = ?auto_939550 ?auto_939561 ) ) ( not ( = ?auto_939551 ?auto_939552 ) ) ( not ( = ?auto_939551 ?auto_939553 ) ) ( not ( = ?auto_939551 ?auto_939554 ) ) ( not ( = ?auto_939551 ?auto_939555 ) ) ( not ( = ?auto_939551 ?auto_939561 ) ) ( not ( = ?auto_939552 ?auto_939553 ) ) ( not ( = ?auto_939552 ?auto_939554 ) ) ( not ( = ?auto_939552 ?auto_939555 ) ) ( not ( = ?auto_939552 ?auto_939561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939553 ?auto_939554 ?auto_939555 )
      ( MAKE-11CRATE-VERIFY ?auto_939544 ?auto_939545 ?auto_939546 ?auto_939548 ?auto_939547 ?auto_939549 ?auto_939550 ?auto_939551 ?auto_939552 ?auto_939553 ?auto_939554 ?auto_939555 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_948816 - SURFACE
      ?auto_948817 - SURFACE
      ?auto_948818 - SURFACE
      ?auto_948820 - SURFACE
      ?auto_948819 - SURFACE
      ?auto_948821 - SURFACE
      ?auto_948822 - SURFACE
      ?auto_948823 - SURFACE
      ?auto_948824 - SURFACE
      ?auto_948825 - SURFACE
      ?auto_948826 - SURFACE
      ?auto_948827 - SURFACE
      ?auto_948828 - SURFACE
    )
    :vars
    (
      ?auto_948830 - HOIST
      ?auto_948829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_948830 ?auto_948829 ) ( SURFACE-AT ?auto_948827 ?auto_948829 ) ( CLEAR ?auto_948827 ) ( LIFTING ?auto_948830 ?auto_948828 ) ( IS-CRATE ?auto_948828 ) ( not ( = ?auto_948827 ?auto_948828 ) ) ( ON ?auto_948817 ?auto_948816 ) ( ON ?auto_948818 ?auto_948817 ) ( ON ?auto_948820 ?auto_948818 ) ( ON ?auto_948819 ?auto_948820 ) ( ON ?auto_948821 ?auto_948819 ) ( ON ?auto_948822 ?auto_948821 ) ( ON ?auto_948823 ?auto_948822 ) ( ON ?auto_948824 ?auto_948823 ) ( ON ?auto_948825 ?auto_948824 ) ( ON ?auto_948826 ?auto_948825 ) ( ON ?auto_948827 ?auto_948826 ) ( not ( = ?auto_948816 ?auto_948817 ) ) ( not ( = ?auto_948816 ?auto_948818 ) ) ( not ( = ?auto_948816 ?auto_948820 ) ) ( not ( = ?auto_948816 ?auto_948819 ) ) ( not ( = ?auto_948816 ?auto_948821 ) ) ( not ( = ?auto_948816 ?auto_948822 ) ) ( not ( = ?auto_948816 ?auto_948823 ) ) ( not ( = ?auto_948816 ?auto_948824 ) ) ( not ( = ?auto_948816 ?auto_948825 ) ) ( not ( = ?auto_948816 ?auto_948826 ) ) ( not ( = ?auto_948816 ?auto_948827 ) ) ( not ( = ?auto_948816 ?auto_948828 ) ) ( not ( = ?auto_948817 ?auto_948818 ) ) ( not ( = ?auto_948817 ?auto_948820 ) ) ( not ( = ?auto_948817 ?auto_948819 ) ) ( not ( = ?auto_948817 ?auto_948821 ) ) ( not ( = ?auto_948817 ?auto_948822 ) ) ( not ( = ?auto_948817 ?auto_948823 ) ) ( not ( = ?auto_948817 ?auto_948824 ) ) ( not ( = ?auto_948817 ?auto_948825 ) ) ( not ( = ?auto_948817 ?auto_948826 ) ) ( not ( = ?auto_948817 ?auto_948827 ) ) ( not ( = ?auto_948817 ?auto_948828 ) ) ( not ( = ?auto_948818 ?auto_948820 ) ) ( not ( = ?auto_948818 ?auto_948819 ) ) ( not ( = ?auto_948818 ?auto_948821 ) ) ( not ( = ?auto_948818 ?auto_948822 ) ) ( not ( = ?auto_948818 ?auto_948823 ) ) ( not ( = ?auto_948818 ?auto_948824 ) ) ( not ( = ?auto_948818 ?auto_948825 ) ) ( not ( = ?auto_948818 ?auto_948826 ) ) ( not ( = ?auto_948818 ?auto_948827 ) ) ( not ( = ?auto_948818 ?auto_948828 ) ) ( not ( = ?auto_948820 ?auto_948819 ) ) ( not ( = ?auto_948820 ?auto_948821 ) ) ( not ( = ?auto_948820 ?auto_948822 ) ) ( not ( = ?auto_948820 ?auto_948823 ) ) ( not ( = ?auto_948820 ?auto_948824 ) ) ( not ( = ?auto_948820 ?auto_948825 ) ) ( not ( = ?auto_948820 ?auto_948826 ) ) ( not ( = ?auto_948820 ?auto_948827 ) ) ( not ( = ?auto_948820 ?auto_948828 ) ) ( not ( = ?auto_948819 ?auto_948821 ) ) ( not ( = ?auto_948819 ?auto_948822 ) ) ( not ( = ?auto_948819 ?auto_948823 ) ) ( not ( = ?auto_948819 ?auto_948824 ) ) ( not ( = ?auto_948819 ?auto_948825 ) ) ( not ( = ?auto_948819 ?auto_948826 ) ) ( not ( = ?auto_948819 ?auto_948827 ) ) ( not ( = ?auto_948819 ?auto_948828 ) ) ( not ( = ?auto_948821 ?auto_948822 ) ) ( not ( = ?auto_948821 ?auto_948823 ) ) ( not ( = ?auto_948821 ?auto_948824 ) ) ( not ( = ?auto_948821 ?auto_948825 ) ) ( not ( = ?auto_948821 ?auto_948826 ) ) ( not ( = ?auto_948821 ?auto_948827 ) ) ( not ( = ?auto_948821 ?auto_948828 ) ) ( not ( = ?auto_948822 ?auto_948823 ) ) ( not ( = ?auto_948822 ?auto_948824 ) ) ( not ( = ?auto_948822 ?auto_948825 ) ) ( not ( = ?auto_948822 ?auto_948826 ) ) ( not ( = ?auto_948822 ?auto_948827 ) ) ( not ( = ?auto_948822 ?auto_948828 ) ) ( not ( = ?auto_948823 ?auto_948824 ) ) ( not ( = ?auto_948823 ?auto_948825 ) ) ( not ( = ?auto_948823 ?auto_948826 ) ) ( not ( = ?auto_948823 ?auto_948827 ) ) ( not ( = ?auto_948823 ?auto_948828 ) ) ( not ( = ?auto_948824 ?auto_948825 ) ) ( not ( = ?auto_948824 ?auto_948826 ) ) ( not ( = ?auto_948824 ?auto_948827 ) ) ( not ( = ?auto_948824 ?auto_948828 ) ) ( not ( = ?auto_948825 ?auto_948826 ) ) ( not ( = ?auto_948825 ?auto_948827 ) ) ( not ( = ?auto_948825 ?auto_948828 ) ) ( not ( = ?auto_948826 ?auto_948827 ) ) ( not ( = ?auto_948826 ?auto_948828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_948827 ?auto_948828 )
      ( MAKE-12CRATE-VERIFY ?auto_948816 ?auto_948817 ?auto_948818 ?auto_948820 ?auto_948819 ?auto_948821 ?auto_948822 ?auto_948823 ?auto_948824 ?auto_948825 ?auto_948826 ?auto_948827 ?auto_948828 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_948941 - SURFACE
      ?auto_948942 - SURFACE
      ?auto_948943 - SURFACE
      ?auto_948945 - SURFACE
      ?auto_948944 - SURFACE
      ?auto_948946 - SURFACE
      ?auto_948947 - SURFACE
      ?auto_948948 - SURFACE
      ?auto_948949 - SURFACE
      ?auto_948950 - SURFACE
      ?auto_948951 - SURFACE
      ?auto_948952 - SURFACE
      ?auto_948953 - SURFACE
    )
    :vars
    (
      ?auto_948954 - HOIST
      ?auto_948956 - PLACE
      ?auto_948955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_948954 ?auto_948956 ) ( SURFACE-AT ?auto_948952 ?auto_948956 ) ( CLEAR ?auto_948952 ) ( IS-CRATE ?auto_948953 ) ( not ( = ?auto_948952 ?auto_948953 ) ) ( TRUCK-AT ?auto_948955 ?auto_948956 ) ( AVAILABLE ?auto_948954 ) ( IN ?auto_948953 ?auto_948955 ) ( ON ?auto_948952 ?auto_948951 ) ( not ( = ?auto_948951 ?auto_948952 ) ) ( not ( = ?auto_948951 ?auto_948953 ) ) ( ON ?auto_948942 ?auto_948941 ) ( ON ?auto_948943 ?auto_948942 ) ( ON ?auto_948945 ?auto_948943 ) ( ON ?auto_948944 ?auto_948945 ) ( ON ?auto_948946 ?auto_948944 ) ( ON ?auto_948947 ?auto_948946 ) ( ON ?auto_948948 ?auto_948947 ) ( ON ?auto_948949 ?auto_948948 ) ( ON ?auto_948950 ?auto_948949 ) ( ON ?auto_948951 ?auto_948950 ) ( not ( = ?auto_948941 ?auto_948942 ) ) ( not ( = ?auto_948941 ?auto_948943 ) ) ( not ( = ?auto_948941 ?auto_948945 ) ) ( not ( = ?auto_948941 ?auto_948944 ) ) ( not ( = ?auto_948941 ?auto_948946 ) ) ( not ( = ?auto_948941 ?auto_948947 ) ) ( not ( = ?auto_948941 ?auto_948948 ) ) ( not ( = ?auto_948941 ?auto_948949 ) ) ( not ( = ?auto_948941 ?auto_948950 ) ) ( not ( = ?auto_948941 ?auto_948951 ) ) ( not ( = ?auto_948941 ?auto_948952 ) ) ( not ( = ?auto_948941 ?auto_948953 ) ) ( not ( = ?auto_948942 ?auto_948943 ) ) ( not ( = ?auto_948942 ?auto_948945 ) ) ( not ( = ?auto_948942 ?auto_948944 ) ) ( not ( = ?auto_948942 ?auto_948946 ) ) ( not ( = ?auto_948942 ?auto_948947 ) ) ( not ( = ?auto_948942 ?auto_948948 ) ) ( not ( = ?auto_948942 ?auto_948949 ) ) ( not ( = ?auto_948942 ?auto_948950 ) ) ( not ( = ?auto_948942 ?auto_948951 ) ) ( not ( = ?auto_948942 ?auto_948952 ) ) ( not ( = ?auto_948942 ?auto_948953 ) ) ( not ( = ?auto_948943 ?auto_948945 ) ) ( not ( = ?auto_948943 ?auto_948944 ) ) ( not ( = ?auto_948943 ?auto_948946 ) ) ( not ( = ?auto_948943 ?auto_948947 ) ) ( not ( = ?auto_948943 ?auto_948948 ) ) ( not ( = ?auto_948943 ?auto_948949 ) ) ( not ( = ?auto_948943 ?auto_948950 ) ) ( not ( = ?auto_948943 ?auto_948951 ) ) ( not ( = ?auto_948943 ?auto_948952 ) ) ( not ( = ?auto_948943 ?auto_948953 ) ) ( not ( = ?auto_948945 ?auto_948944 ) ) ( not ( = ?auto_948945 ?auto_948946 ) ) ( not ( = ?auto_948945 ?auto_948947 ) ) ( not ( = ?auto_948945 ?auto_948948 ) ) ( not ( = ?auto_948945 ?auto_948949 ) ) ( not ( = ?auto_948945 ?auto_948950 ) ) ( not ( = ?auto_948945 ?auto_948951 ) ) ( not ( = ?auto_948945 ?auto_948952 ) ) ( not ( = ?auto_948945 ?auto_948953 ) ) ( not ( = ?auto_948944 ?auto_948946 ) ) ( not ( = ?auto_948944 ?auto_948947 ) ) ( not ( = ?auto_948944 ?auto_948948 ) ) ( not ( = ?auto_948944 ?auto_948949 ) ) ( not ( = ?auto_948944 ?auto_948950 ) ) ( not ( = ?auto_948944 ?auto_948951 ) ) ( not ( = ?auto_948944 ?auto_948952 ) ) ( not ( = ?auto_948944 ?auto_948953 ) ) ( not ( = ?auto_948946 ?auto_948947 ) ) ( not ( = ?auto_948946 ?auto_948948 ) ) ( not ( = ?auto_948946 ?auto_948949 ) ) ( not ( = ?auto_948946 ?auto_948950 ) ) ( not ( = ?auto_948946 ?auto_948951 ) ) ( not ( = ?auto_948946 ?auto_948952 ) ) ( not ( = ?auto_948946 ?auto_948953 ) ) ( not ( = ?auto_948947 ?auto_948948 ) ) ( not ( = ?auto_948947 ?auto_948949 ) ) ( not ( = ?auto_948947 ?auto_948950 ) ) ( not ( = ?auto_948947 ?auto_948951 ) ) ( not ( = ?auto_948947 ?auto_948952 ) ) ( not ( = ?auto_948947 ?auto_948953 ) ) ( not ( = ?auto_948948 ?auto_948949 ) ) ( not ( = ?auto_948948 ?auto_948950 ) ) ( not ( = ?auto_948948 ?auto_948951 ) ) ( not ( = ?auto_948948 ?auto_948952 ) ) ( not ( = ?auto_948948 ?auto_948953 ) ) ( not ( = ?auto_948949 ?auto_948950 ) ) ( not ( = ?auto_948949 ?auto_948951 ) ) ( not ( = ?auto_948949 ?auto_948952 ) ) ( not ( = ?auto_948949 ?auto_948953 ) ) ( not ( = ?auto_948950 ?auto_948951 ) ) ( not ( = ?auto_948950 ?auto_948952 ) ) ( not ( = ?auto_948950 ?auto_948953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_948951 ?auto_948952 ?auto_948953 )
      ( MAKE-12CRATE-VERIFY ?auto_948941 ?auto_948942 ?auto_948943 ?auto_948945 ?auto_948944 ?auto_948946 ?auto_948947 ?auto_948948 ?auto_948949 ?auto_948950 ?auto_948951 ?auto_948952 ?auto_948953 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949079 - SURFACE
      ?auto_949080 - SURFACE
      ?auto_949081 - SURFACE
      ?auto_949083 - SURFACE
      ?auto_949082 - SURFACE
      ?auto_949084 - SURFACE
      ?auto_949085 - SURFACE
      ?auto_949086 - SURFACE
      ?auto_949087 - SURFACE
      ?auto_949088 - SURFACE
      ?auto_949089 - SURFACE
      ?auto_949090 - SURFACE
      ?auto_949091 - SURFACE
    )
    :vars
    (
      ?auto_949092 - HOIST
      ?auto_949093 - PLACE
      ?auto_949095 - TRUCK
      ?auto_949094 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949092 ?auto_949093 ) ( SURFACE-AT ?auto_949090 ?auto_949093 ) ( CLEAR ?auto_949090 ) ( IS-CRATE ?auto_949091 ) ( not ( = ?auto_949090 ?auto_949091 ) ) ( AVAILABLE ?auto_949092 ) ( IN ?auto_949091 ?auto_949095 ) ( ON ?auto_949090 ?auto_949089 ) ( not ( = ?auto_949089 ?auto_949090 ) ) ( not ( = ?auto_949089 ?auto_949091 ) ) ( TRUCK-AT ?auto_949095 ?auto_949094 ) ( not ( = ?auto_949094 ?auto_949093 ) ) ( ON ?auto_949080 ?auto_949079 ) ( ON ?auto_949081 ?auto_949080 ) ( ON ?auto_949083 ?auto_949081 ) ( ON ?auto_949082 ?auto_949083 ) ( ON ?auto_949084 ?auto_949082 ) ( ON ?auto_949085 ?auto_949084 ) ( ON ?auto_949086 ?auto_949085 ) ( ON ?auto_949087 ?auto_949086 ) ( ON ?auto_949088 ?auto_949087 ) ( ON ?auto_949089 ?auto_949088 ) ( not ( = ?auto_949079 ?auto_949080 ) ) ( not ( = ?auto_949079 ?auto_949081 ) ) ( not ( = ?auto_949079 ?auto_949083 ) ) ( not ( = ?auto_949079 ?auto_949082 ) ) ( not ( = ?auto_949079 ?auto_949084 ) ) ( not ( = ?auto_949079 ?auto_949085 ) ) ( not ( = ?auto_949079 ?auto_949086 ) ) ( not ( = ?auto_949079 ?auto_949087 ) ) ( not ( = ?auto_949079 ?auto_949088 ) ) ( not ( = ?auto_949079 ?auto_949089 ) ) ( not ( = ?auto_949079 ?auto_949090 ) ) ( not ( = ?auto_949079 ?auto_949091 ) ) ( not ( = ?auto_949080 ?auto_949081 ) ) ( not ( = ?auto_949080 ?auto_949083 ) ) ( not ( = ?auto_949080 ?auto_949082 ) ) ( not ( = ?auto_949080 ?auto_949084 ) ) ( not ( = ?auto_949080 ?auto_949085 ) ) ( not ( = ?auto_949080 ?auto_949086 ) ) ( not ( = ?auto_949080 ?auto_949087 ) ) ( not ( = ?auto_949080 ?auto_949088 ) ) ( not ( = ?auto_949080 ?auto_949089 ) ) ( not ( = ?auto_949080 ?auto_949090 ) ) ( not ( = ?auto_949080 ?auto_949091 ) ) ( not ( = ?auto_949081 ?auto_949083 ) ) ( not ( = ?auto_949081 ?auto_949082 ) ) ( not ( = ?auto_949081 ?auto_949084 ) ) ( not ( = ?auto_949081 ?auto_949085 ) ) ( not ( = ?auto_949081 ?auto_949086 ) ) ( not ( = ?auto_949081 ?auto_949087 ) ) ( not ( = ?auto_949081 ?auto_949088 ) ) ( not ( = ?auto_949081 ?auto_949089 ) ) ( not ( = ?auto_949081 ?auto_949090 ) ) ( not ( = ?auto_949081 ?auto_949091 ) ) ( not ( = ?auto_949083 ?auto_949082 ) ) ( not ( = ?auto_949083 ?auto_949084 ) ) ( not ( = ?auto_949083 ?auto_949085 ) ) ( not ( = ?auto_949083 ?auto_949086 ) ) ( not ( = ?auto_949083 ?auto_949087 ) ) ( not ( = ?auto_949083 ?auto_949088 ) ) ( not ( = ?auto_949083 ?auto_949089 ) ) ( not ( = ?auto_949083 ?auto_949090 ) ) ( not ( = ?auto_949083 ?auto_949091 ) ) ( not ( = ?auto_949082 ?auto_949084 ) ) ( not ( = ?auto_949082 ?auto_949085 ) ) ( not ( = ?auto_949082 ?auto_949086 ) ) ( not ( = ?auto_949082 ?auto_949087 ) ) ( not ( = ?auto_949082 ?auto_949088 ) ) ( not ( = ?auto_949082 ?auto_949089 ) ) ( not ( = ?auto_949082 ?auto_949090 ) ) ( not ( = ?auto_949082 ?auto_949091 ) ) ( not ( = ?auto_949084 ?auto_949085 ) ) ( not ( = ?auto_949084 ?auto_949086 ) ) ( not ( = ?auto_949084 ?auto_949087 ) ) ( not ( = ?auto_949084 ?auto_949088 ) ) ( not ( = ?auto_949084 ?auto_949089 ) ) ( not ( = ?auto_949084 ?auto_949090 ) ) ( not ( = ?auto_949084 ?auto_949091 ) ) ( not ( = ?auto_949085 ?auto_949086 ) ) ( not ( = ?auto_949085 ?auto_949087 ) ) ( not ( = ?auto_949085 ?auto_949088 ) ) ( not ( = ?auto_949085 ?auto_949089 ) ) ( not ( = ?auto_949085 ?auto_949090 ) ) ( not ( = ?auto_949085 ?auto_949091 ) ) ( not ( = ?auto_949086 ?auto_949087 ) ) ( not ( = ?auto_949086 ?auto_949088 ) ) ( not ( = ?auto_949086 ?auto_949089 ) ) ( not ( = ?auto_949086 ?auto_949090 ) ) ( not ( = ?auto_949086 ?auto_949091 ) ) ( not ( = ?auto_949087 ?auto_949088 ) ) ( not ( = ?auto_949087 ?auto_949089 ) ) ( not ( = ?auto_949087 ?auto_949090 ) ) ( not ( = ?auto_949087 ?auto_949091 ) ) ( not ( = ?auto_949088 ?auto_949089 ) ) ( not ( = ?auto_949088 ?auto_949090 ) ) ( not ( = ?auto_949088 ?auto_949091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949089 ?auto_949090 ?auto_949091 )
      ( MAKE-12CRATE-VERIFY ?auto_949079 ?auto_949080 ?auto_949081 ?auto_949083 ?auto_949082 ?auto_949084 ?auto_949085 ?auto_949086 ?auto_949087 ?auto_949088 ?auto_949089 ?auto_949090 ?auto_949091 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949229 - SURFACE
      ?auto_949230 - SURFACE
      ?auto_949231 - SURFACE
      ?auto_949233 - SURFACE
      ?auto_949232 - SURFACE
      ?auto_949234 - SURFACE
      ?auto_949235 - SURFACE
      ?auto_949236 - SURFACE
      ?auto_949237 - SURFACE
      ?auto_949238 - SURFACE
      ?auto_949239 - SURFACE
      ?auto_949240 - SURFACE
      ?auto_949241 - SURFACE
    )
    :vars
    (
      ?auto_949246 - HOIST
      ?auto_949242 - PLACE
      ?auto_949245 - TRUCK
      ?auto_949243 - PLACE
      ?auto_949244 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_949246 ?auto_949242 ) ( SURFACE-AT ?auto_949240 ?auto_949242 ) ( CLEAR ?auto_949240 ) ( IS-CRATE ?auto_949241 ) ( not ( = ?auto_949240 ?auto_949241 ) ) ( AVAILABLE ?auto_949246 ) ( ON ?auto_949240 ?auto_949239 ) ( not ( = ?auto_949239 ?auto_949240 ) ) ( not ( = ?auto_949239 ?auto_949241 ) ) ( TRUCK-AT ?auto_949245 ?auto_949243 ) ( not ( = ?auto_949243 ?auto_949242 ) ) ( HOIST-AT ?auto_949244 ?auto_949243 ) ( LIFTING ?auto_949244 ?auto_949241 ) ( not ( = ?auto_949246 ?auto_949244 ) ) ( ON ?auto_949230 ?auto_949229 ) ( ON ?auto_949231 ?auto_949230 ) ( ON ?auto_949233 ?auto_949231 ) ( ON ?auto_949232 ?auto_949233 ) ( ON ?auto_949234 ?auto_949232 ) ( ON ?auto_949235 ?auto_949234 ) ( ON ?auto_949236 ?auto_949235 ) ( ON ?auto_949237 ?auto_949236 ) ( ON ?auto_949238 ?auto_949237 ) ( ON ?auto_949239 ?auto_949238 ) ( not ( = ?auto_949229 ?auto_949230 ) ) ( not ( = ?auto_949229 ?auto_949231 ) ) ( not ( = ?auto_949229 ?auto_949233 ) ) ( not ( = ?auto_949229 ?auto_949232 ) ) ( not ( = ?auto_949229 ?auto_949234 ) ) ( not ( = ?auto_949229 ?auto_949235 ) ) ( not ( = ?auto_949229 ?auto_949236 ) ) ( not ( = ?auto_949229 ?auto_949237 ) ) ( not ( = ?auto_949229 ?auto_949238 ) ) ( not ( = ?auto_949229 ?auto_949239 ) ) ( not ( = ?auto_949229 ?auto_949240 ) ) ( not ( = ?auto_949229 ?auto_949241 ) ) ( not ( = ?auto_949230 ?auto_949231 ) ) ( not ( = ?auto_949230 ?auto_949233 ) ) ( not ( = ?auto_949230 ?auto_949232 ) ) ( not ( = ?auto_949230 ?auto_949234 ) ) ( not ( = ?auto_949230 ?auto_949235 ) ) ( not ( = ?auto_949230 ?auto_949236 ) ) ( not ( = ?auto_949230 ?auto_949237 ) ) ( not ( = ?auto_949230 ?auto_949238 ) ) ( not ( = ?auto_949230 ?auto_949239 ) ) ( not ( = ?auto_949230 ?auto_949240 ) ) ( not ( = ?auto_949230 ?auto_949241 ) ) ( not ( = ?auto_949231 ?auto_949233 ) ) ( not ( = ?auto_949231 ?auto_949232 ) ) ( not ( = ?auto_949231 ?auto_949234 ) ) ( not ( = ?auto_949231 ?auto_949235 ) ) ( not ( = ?auto_949231 ?auto_949236 ) ) ( not ( = ?auto_949231 ?auto_949237 ) ) ( not ( = ?auto_949231 ?auto_949238 ) ) ( not ( = ?auto_949231 ?auto_949239 ) ) ( not ( = ?auto_949231 ?auto_949240 ) ) ( not ( = ?auto_949231 ?auto_949241 ) ) ( not ( = ?auto_949233 ?auto_949232 ) ) ( not ( = ?auto_949233 ?auto_949234 ) ) ( not ( = ?auto_949233 ?auto_949235 ) ) ( not ( = ?auto_949233 ?auto_949236 ) ) ( not ( = ?auto_949233 ?auto_949237 ) ) ( not ( = ?auto_949233 ?auto_949238 ) ) ( not ( = ?auto_949233 ?auto_949239 ) ) ( not ( = ?auto_949233 ?auto_949240 ) ) ( not ( = ?auto_949233 ?auto_949241 ) ) ( not ( = ?auto_949232 ?auto_949234 ) ) ( not ( = ?auto_949232 ?auto_949235 ) ) ( not ( = ?auto_949232 ?auto_949236 ) ) ( not ( = ?auto_949232 ?auto_949237 ) ) ( not ( = ?auto_949232 ?auto_949238 ) ) ( not ( = ?auto_949232 ?auto_949239 ) ) ( not ( = ?auto_949232 ?auto_949240 ) ) ( not ( = ?auto_949232 ?auto_949241 ) ) ( not ( = ?auto_949234 ?auto_949235 ) ) ( not ( = ?auto_949234 ?auto_949236 ) ) ( not ( = ?auto_949234 ?auto_949237 ) ) ( not ( = ?auto_949234 ?auto_949238 ) ) ( not ( = ?auto_949234 ?auto_949239 ) ) ( not ( = ?auto_949234 ?auto_949240 ) ) ( not ( = ?auto_949234 ?auto_949241 ) ) ( not ( = ?auto_949235 ?auto_949236 ) ) ( not ( = ?auto_949235 ?auto_949237 ) ) ( not ( = ?auto_949235 ?auto_949238 ) ) ( not ( = ?auto_949235 ?auto_949239 ) ) ( not ( = ?auto_949235 ?auto_949240 ) ) ( not ( = ?auto_949235 ?auto_949241 ) ) ( not ( = ?auto_949236 ?auto_949237 ) ) ( not ( = ?auto_949236 ?auto_949238 ) ) ( not ( = ?auto_949236 ?auto_949239 ) ) ( not ( = ?auto_949236 ?auto_949240 ) ) ( not ( = ?auto_949236 ?auto_949241 ) ) ( not ( = ?auto_949237 ?auto_949238 ) ) ( not ( = ?auto_949237 ?auto_949239 ) ) ( not ( = ?auto_949237 ?auto_949240 ) ) ( not ( = ?auto_949237 ?auto_949241 ) ) ( not ( = ?auto_949238 ?auto_949239 ) ) ( not ( = ?auto_949238 ?auto_949240 ) ) ( not ( = ?auto_949238 ?auto_949241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949239 ?auto_949240 ?auto_949241 )
      ( MAKE-12CRATE-VERIFY ?auto_949229 ?auto_949230 ?auto_949231 ?auto_949233 ?auto_949232 ?auto_949234 ?auto_949235 ?auto_949236 ?auto_949237 ?auto_949238 ?auto_949239 ?auto_949240 ?auto_949241 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949391 - SURFACE
      ?auto_949392 - SURFACE
      ?auto_949393 - SURFACE
      ?auto_949395 - SURFACE
      ?auto_949394 - SURFACE
      ?auto_949396 - SURFACE
      ?auto_949397 - SURFACE
      ?auto_949398 - SURFACE
      ?auto_949399 - SURFACE
      ?auto_949400 - SURFACE
      ?auto_949401 - SURFACE
      ?auto_949402 - SURFACE
      ?auto_949403 - SURFACE
    )
    :vars
    (
      ?auto_949407 - HOIST
      ?auto_949408 - PLACE
      ?auto_949405 - TRUCK
      ?auto_949404 - PLACE
      ?auto_949406 - HOIST
      ?auto_949409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949407 ?auto_949408 ) ( SURFACE-AT ?auto_949402 ?auto_949408 ) ( CLEAR ?auto_949402 ) ( IS-CRATE ?auto_949403 ) ( not ( = ?auto_949402 ?auto_949403 ) ) ( AVAILABLE ?auto_949407 ) ( ON ?auto_949402 ?auto_949401 ) ( not ( = ?auto_949401 ?auto_949402 ) ) ( not ( = ?auto_949401 ?auto_949403 ) ) ( TRUCK-AT ?auto_949405 ?auto_949404 ) ( not ( = ?auto_949404 ?auto_949408 ) ) ( HOIST-AT ?auto_949406 ?auto_949404 ) ( not ( = ?auto_949407 ?auto_949406 ) ) ( AVAILABLE ?auto_949406 ) ( SURFACE-AT ?auto_949403 ?auto_949404 ) ( ON ?auto_949403 ?auto_949409 ) ( CLEAR ?auto_949403 ) ( not ( = ?auto_949402 ?auto_949409 ) ) ( not ( = ?auto_949403 ?auto_949409 ) ) ( not ( = ?auto_949401 ?auto_949409 ) ) ( ON ?auto_949392 ?auto_949391 ) ( ON ?auto_949393 ?auto_949392 ) ( ON ?auto_949395 ?auto_949393 ) ( ON ?auto_949394 ?auto_949395 ) ( ON ?auto_949396 ?auto_949394 ) ( ON ?auto_949397 ?auto_949396 ) ( ON ?auto_949398 ?auto_949397 ) ( ON ?auto_949399 ?auto_949398 ) ( ON ?auto_949400 ?auto_949399 ) ( ON ?auto_949401 ?auto_949400 ) ( not ( = ?auto_949391 ?auto_949392 ) ) ( not ( = ?auto_949391 ?auto_949393 ) ) ( not ( = ?auto_949391 ?auto_949395 ) ) ( not ( = ?auto_949391 ?auto_949394 ) ) ( not ( = ?auto_949391 ?auto_949396 ) ) ( not ( = ?auto_949391 ?auto_949397 ) ) ( not ( = ?auto_949391 ?auto_949398 ) ) ( not ( = ?auto_949391 ?auto_949399 ) ) ( not ( = ?auto_949391 ?auto_949400 ) ) ( not ( = ?auto_949391 ?auto_949401 ) ) ( not ( = ?auto_949391 ?auto_949402 ) ) ( not ( = ?auto_949391 ?auto_949403 ) ) ( not ( = ?auto_949391 ?auto_949409 ) ) ( not ( = ?auto_949392 ?auto_949393 ) ) ( not ( = ?auto_949392 ?auto_949395 ) ) ( not ( = ?auto_949392 ?auto_949394 ) ) ( not ( = ?auto_949392 ?auto_949396 ) ) ( not ( = ?auto_949392 ?auto_949397 ) ) ( not ( = ?auto_949392 ?auto_949398 ) ) ( not ( = ?auto_949392 ?auto_949399 ) ) ( not ( = ?auto_949392 ?auto_949400 ) ) ( not ( = ?auto_949392 ?auto_949401 ) ) ( not ( = ?auto_949392 ?auto_949402 ) ) ( not ( = ?auto_949392 ?auto_949403 ) ) ( not ( = ?auto_949392 ?auto_949409 ) ) ( not ( = ?auto_949393 ?auto_949395 ) ) ( not ( = ?auto_949393 ?auto_949394 ) ) ( not ( = ?auto_949393 ?auto_949396 ) ) ( not ( = ?auto_949393 ?auto_949397 ) ) ( not ( = ?auto_949393 ?auto_949398 ) ) ( not ( = ?auto_949393 ?auto_949399 ) ) ( not ( = ?auto_949393 ?auto_949400 ) ) ( not ( = ?auto_949393 ?auto_949401 ) ) ( not ( = ?auto_949393 ?auto_949402 ) ) ( not ( = ?auto_949393 ?auto_949403 ) ) ( not ( = ?auto_949393 ?auto_949409 ) ) ( not ( = ?auto_949395 ?auto_949394 ) ) ( not ( = ?auto_949395 ?auto_949396 ) ) ( not ( = ?auto_949395 ?auto_949397 ) ) ( not ( = ?auto_949395 ?auto_949398 ) ) ( not ( = ?auto_949395 ?auto_949399 ) ) ( not ( = ?auto_949395 ?auto_949400 ) ) ( not ( = ?auto_949395 ?auto_949401 ) ) ( not ( = ?auto_949395 ?auto_949402 ) ) ( not ( = ?auto_949395 ?auto_949403 ) ) ( not ( = ?auto_949395 ?auto_949409 ) ) ( not ( = ?auto_949394 ?auto_949396 ) ) ( not ( = ?auto_949394 ?auto_949397 ) ) ( not ( = ?auto_949394 ?auto_949398 ) ) ( not ( = ?auto_949394 ?auto_949399 ) ) ( not ( = ?auto_949394 ?auto_949400 ) ) ( not ( = ?auto_949394 ?auto_949401 ) ) ( not ( = ?auto_949394 ?auto_949402 ) ) ( not ( = ?auto_949394 ?auto_949403 ) ) ( not ( = ?auto_949394 ?auto_949409 ) ) ( not ( = ?auto_949396 ?auto_949397 ) ) ( not ( = ?auto_949396 ?auto_949398 ) ) ( not ( = ?auto_949396 ?auto_949399 ) ) ( not ( = ?auto_949396 ?auto_949400 ) ) ( not ( = ?auto_949396 ?auto_949401 ) ) ( not ( = ?auto_949396 ?auto_949402 ) ) ( not ( = ?auto_949396 ?auto_949403 ) ) ( not ( = ?auto_949396 ?auto_949409 ) ) ( not ( = ?auto_949397 ?auto_949398 ) ) ( not ( = ?auto_949397 ?auto_949399 ) ) ( not ( = ?auto_949397 ?auto_949400 ) ) ( not ( = ?auto_949397 ?auto_949401 ) ) ( not ( = ?auto_949397 ?auto_949402 ) ) ( not ( = ?auto_949397 ?auto_949403 ) ) ( not ( = ?auto_949397 ?auto_949409 ) ) ( not ( = ?auto_949398 ?auto_949399 ) ) ( not ( = ?auto_949398 ?auto_949400 ) ) ( not ( = ?auto_949398 ?auto_949401 ) ) ( not ( = ?auto_949398 ?auto_949402 ) ) ( not ( = ?auto_949398 ?auto_949403 ) ) ( not ( = ?auto_949398 ?auto_949409 ) ) ( not ( = ?auto_949399 ?auto_949400 ) ) ( not ( = ?auto_949399 ?auto_949401 ) ) ( not ( = ?auto_949399 ?auto_949402 ) ) ( not ( = ?auto_949399 ?auto_949403 ) ) ( not ( = ?auto_949399 ?auto_949409 ) ) ( not ( = ?auto_949400 ?auto_949401 ) ) ( not ( = ?auto_949400 ?auto_949402 ) ) ( not ( = ?auto_949400 ?auto_949403 ) ) ( not ( = ?auto_949400 ?auto_949409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949401 ?auto_949402 ?auto_949403 )
      ( MAKE-12CRATE-VERIFY ?auto_949391 ?auto_949392 ?auto_949393 ?auto_949395 ?auto_949394 ?auto_949396 ?auto_949397 ?auto_949398 ?auto_949399 ?auto_949400 ?auto_949401 ?auto_949402 ?auto_949403 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949554 - SURFACE
      ?auto_949555 - SURFACE
      ?auto_949556 - SURFACE
      ?auto_949558 - SURFACE
      ?auto_949557 - SURFACE
      ?auto_949559 - SURFACE
      ?auto_949560 - SURFACE
      ?auto_949561 - SURFACE
      ?auto_949562 - SURFACE
      ?auto_949563 - SURFACE
      ?auto_949564 - SURFACE
      ?auto_949565 - SURFACE
      ?auto_949566 - SURFACE
    )
    :vars
    (
      ?auto_949570 - HOIST
      ?auto_949569 - PLACE
      ?auto_949568 - PLACE
      ?auto_949571 - HOIST
      ?auto_949572 - SURFACE
      ?auto_949567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949570 ?auto_949569 ) ( SURFACE-AT ?auto_949565 ?auto_949569 ) ( CLEAR ?auto_949565 ) ( IS-CRATE ?auto_949566 ) ( not ( = ?auto_949565 ?auto_949566 ) ) ( AVAILABLE ?auto_949570 ) ( ON ?auto_949565 ?auto_949564 ) ( not ( = ?auto_949564 ?auto_949565 ) ) ( not ( = ?auto_949564 ?auto_949566 ) ) ( not ( = ?auto_949568 ?auto_949569 ) ) ( HOIST-AT ?auto_949571 ?auto_949568 ) ( not ( = ?auto_949570 ?auto_949571 ) ) ( AVAILABLE ?auto_949571 ) ( SURFACE-AT ?auto_949566 ?auto_949568 ) ( ON ?auto_949566 ?auto_949572 ) ( CLEAR ?auto_949566 ) ( not ( = ?auto_949565 ?auto_949572 ) ) ( not ( = ?auto_949566 ?auto_949572 ) ) ( not ( = ?auto_949564 ?auto_949572 ) ) ( TRUCK-AT ?auto_949567 ?auto_949569 ) ( ON ?auto_949555 ?auto_949554 ) ( ON ?auto_949556 ?auto_949555 ) ( ON ?auto_949558 ?auto_949556 ) ( ON ?auto_949557 ?auto_949558 ) ( ON ?auto_949559 ?auto_949557 ) ( ON ?auto_949560 ?auto_949559 ) ( ON ?auto_949561 ?auto_949560 ) ( ON ?auto_949562 ?auto_949561 ) ( ON ?auto_949563 ?auto_949562 ) ( ON ?auto_949564 ?auto_949563 ) ( not ( = ?auto_949554 ?auto_949555 ) ) ( not ( = ?auto_949554 ?auto_949556 ) ) ( not ( = ?auto_949554 ?auto_949558 ) ) ( not ( = ?auto_949554 ?auto_949557 ) ) ( not ( = ?auto_949554 ?auto_949559 ) ) ( not ( = ?auto_949554 ?auto_949560 ) ) ( not ( = ?auto_949554 ?auto_949561 ) ) ( not ( = ?auto_949554 ?auto_949562 ) ) ( not ( = ?auto_949554 ?auto_949563 ) ) ( not ( = ?auto_949554 ?auto_949564 ) ) ( not ( = ?auto_949554 ?auto_949565 ) ) ( not ( = ?auto_949554 ?auto_949566 ) ) ( not ( = ?auto_949554 ?auto_949572 ) ) ( not ( = ?auto_949555 ?auto_949556 ) ) ( not ( = ?auto_949555 ?auto_949558 ) ) ( not ( = ?auto_949555 ?auto_949557 ) ) ( not ( = ?auto_949555 ?auto_949559 ) ) ( not ( = ?auto_949555 ?auto_949560 ) ) ( not ( = ?auto_949555 ?auto_949561 ) ) ( not ( = ?auto_949555 ?auto_949562 ) ) ( not ( = ?auto_949555 ?auto_949563 ) ) ( not ( = ?auto_949555 ?auto_949564 ) ) ( not ( = ?auto_949555 ?auto_949565 ) ) ( not ( = ?auto_949555 ?auto_949566 ) ) ( not ( = ?auto_949555 ?auto_949572 ) ) ( not ( = ?auto_949556 ?auto_949558 ) ) ( not ( = ?auto_949556 ?auto_949557 ) ) ( not ( = ?auto_949556 ?auto_949559 ) ) ( not ( = ?auto_949556 ?auto_949560 ) ) ( not ( = ?auto_949556 ?auto_949561 ) ) ( not ( = ?auto_949556 ?auto_949562 ) ) ( not ( = ?auto_949556 ?auto_949563 ) ) ( not ( = ?auto_949556 ?auto_949564 ) ) ( not ( = ?auto_949556 ?auto_949565 ) ) ( not ( = ?auto_949556 ?auto_949566 ) ) ( not ( = ?auto_949556 ?auto_949572 ) ) ( not ( = ?auto_949558 ?auto_949557 ) ) ( not ( = ?auto_949558 ?auto_949559 ) ) ( not ( = ?auto_949558 ?auto_949560 ) ) ( not ( = ?auto_949558 ?auto_949561 ) ) ( not ( = ?auto_949558 ?auto_949562 ) ) ( not ( = ?auto_949558 ?auto_949563 ) ) ( not ( = ?auto_949558 ?auto_949564 ) ) ( not ( = ?auto_949558 ?auto_949565 ) ) ( not ( = ?auto_949558 ?auto_949566 ) ) ( not ( = ?auto_949558 ?auto_949572 ) ) ( not ( = ?auto_949557 ?auto_949559 ) ) ( not ( = ?auto_949557 ?auto_949560 ) ) ( not ( = ?auto_949557 ?auto_949561 ) ) ( not ( = ?auto_949557 ?auto_949562 ) ) ( not ( = ?auto_949557 ?auto_949563 ) ) ( not ( = ?auto_949557 ?auto_949564 ) ) ( not ( = ?auto_949557 ?auto_949565 ) ) ( not ( = ?auto_949557 ?auto_949566 ) ) ( not ( = ?auto_949557 ?auto_949572 ) ) ( not ( = ?auto_949559 ?auto_949560 ) ) ( not ( = ?auto_949559 ?auto_949561 ) ) ( not ( = ?auto_949559 ?auto_949562 ) ) ( not ( = ?auto_949559 ?auto_949563 ) ) ( not ( = ?auto_949559 ?auto_949564 ) ) ( not ( = ?auto_949559 ?auto_949565 ) ) ( not ( = ?auto_949559 ?auto_949566 ) ) ( not ( = ?auto_949559 ?auto_949572 ) ) ( not ( = ?auto_949560 ?auto_949561 ) ) ( not ( = ?auto_949560 ?auto_949562 ) ) ( not ( = ?auto_949560 ?auto_949563 ) ) ( not ( = ?auto_949560 ?auto_949564 ) ) ( not ( = ?auto_949560 ?auto_949565 ) ) ( not ( = ?auto_949560 ?auto_949566 ) ) ( not ( = ?auto_949560 ?auto_949572 ) ) ( not ( = ?auto_949561 ?auto_949562 ) ) ( not ( = ?auto_949561 ?auto_949563 ) ) ( not ( = ?auto_949561 ?auto_949564 ) ) ( not ( = ?auto_949561 ?auto_949565 ) ) ( not ( = ?auto_949561 ?auto_949566 ) ) ( not ( = ?auto_949561 ?auto_949572 ) ) ( not ( = ?auto_949562 ?auto_949563 ) ) ( not ( = ?auto_949562 ?auto_949564 ) ) ( not ( = ?auto_949562 ?auto_949565 ) ) ( not ( = ?auto_949562 ?auto_949566 ) ) ( not ( = ?auto_949562 ?auto_949572 ) ) ( not ( = ?auto_949563 ?auto_949564 ) ) ( not ( = ?auto_949563 ?auto_949565 ) ) ( not ( = ?auto_949563 ?auto_949566 ) ) ( not ( = ?auto_949563 ?auto_949572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949564 ?auto_949565 ?auto_949566 )
      ( MAKE-12CRATE-VERIFY ?auto_949554 ?auto_949555 ?auto_949556 ?auto_949558 ?auto_949557 ?auto_949559 ?auto_949560 ?auto_949561 ?auto_949562 ?auto_949563 ?auto_949564 ?auto_949565 ?auto_949566 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949717 - SURFACE
      ?auto_949718 - SURFACE
      ?auto_949719 - SURFACE
      ?auto_949721 - SURFACE
      ?auto_949720 - SURFACE
      ?auto_949722 - SURFACE
      ?auto_949723 - SURFACE
      ?auto_949724 - SURFACE
      ?auto_949725 - SURFACE
      ?auto_949726 - SURFACE
      ?auto_949727 - SURFACE
      ?auto_949728 - SURFACE
      ?auto_949729 - SURFACE
    )
    :vars
    (
      ?auto_949731 - HOIST
      ?auto_949735 - PLACE
      ?auto_949734 - PLACE
      ?auto_949732 - HOIST
      ?auto_949733 - SURFACE
      ?auto_949730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949731 ?auto_949735 ) ( IS-CRATE ?auto_949729 ) ( not ( = ?auto_949728 ?auto_949729 ) ) ( not ( = ?auto_949727 ?auto_949728 ) ) ( not ( = ?auto_949727 ?auto_949729 ) ) ( not ( = ?auto_949734 ?auto_949735 ) ) ( HOIST-AT ?auto_949732 ?auto_949734 ) ( not ( = ?auto_949731 ?auto_949732 ) ) ( AVAILABLE ?auto_949732 ) ( SURFACE-AT ?auto_949729 ?auto_949734 ) ( ON ?auto_949729 ?auto_949733 ) ( CLEAR ?auto_949729 ) ( not ( = ?auto_949728 ?auto_949733 ) ) ( not ( = ?auto_949729 ?auto_949733 ) ) ( not ( = ?auto_949727 ?auto_949733 ) ) ( TRUCK-AT ?auto_949730 ?auto_949735 ) ( SURFACE-AT ?auto_949727 ?auto_949735 ) ( CLEAR ?auto_949727 ) ( LIFTING ?auto_949731 ?auto_949728 ) ( IS-CRATE ?auto_949728 ) ( ON ?auto_949718 ?auto_949717 ) ( ON ?auto_949719 ?auto_949718 ) ( ON ?auto_949721 ?auto_949719 ) ( ON ?auto_949720 ?auto_949721 ) ( ON ?auto_949722 ?auto_949720 ) ( ON ?auto_949723 ?auto_949722 ) ( ON ?auto_949724 ?auto_949723 ) ( ON ?auto_949725 ?auto_949724 ) ( ON ?auto_949726 ?auto_949725 ) ( ON ?auto_949727 ?auto_949726 ) ( not ( = ?auto_949717 ?auto_949718 ) ) ( not ( = ?auto_949717 ?auto_949719 ) ) ( not ( = ?auto_949717 ?auto_949721 ) ) ( not ( = ?auto_949717 ?auto_949720 ) ) ( not ( = ?auto_949717 ?auto_949722 ) ) ( not ( = ?auto_949717 ?auto_949723 ) ) ( not ( = ?auto_949717 ?auto_949724 ) ) ( not ( = ?auto_949717 ?auto_949725 ) ) ( not ( = ?auto_949717 ?auto_949726 ) ) ( not ( = ?auto_949717 ?auto_949727 ) ) ( not ( = ?auto_949717 ?auto_949728 ) ) ( not ( = ?auto_949717 ?auto_949729 ) ) ( not ( = ?auto_949717 ?auto_949733 ) ) ( not ( = ?auto_949718 ?auto_949719 ) ) ( not ( = ?auto_949718 ?auto_949721 ) ) ( not ( = ?auto_949718 ?auto_949720 ) ) ( not ( = ?auto_949718 ?auto_949722 ) ) ( not ( = ?auto_949718 ?auto_949723 ) ) ( not ( = ?auto_949718 ?auto_949724 ) ) ( not ( = ?auto_949718 ?auto_949725 ) ) ( not ( = ?auto_949718 ?auto_949726 ) ) ( not ( = ?auto_949718 ?auto_949727 ) ) ( not ( = ?auto_949718 ?auto_949728 ) ) ( not ( = ?auto_949718 ?auto_949729 ) ) ( not ( = ?auto_949718 ?auto_949733 ) ) ( not ( = ?auto_949719 ?auto_949721 ) ) ( not ( = ?auto_949719 ?auto_949720 ) ) ( not ( = ?auto_949719 ?auto_949722 ) ) ( not ( = ?auto_949719 ?auto_949723 ) ) ( not ( = ?auto_949719 ?auto_949724 ) ) ( not ( = ?auto_949719 ?auto_949725 ) ) ( not ( = ?auto_949719 ?auto_949726 ) ) ( not ( = ?auto_949719 ?auto_949727 ) ) ( not ( = ?auto_949719 ?auto_949728 ) ) ( not ( = ?auto_949719 ?auto_949729 ) ) ( not ( = ?auto_949719 ?auto_949733 ) ) ( not ( = ?auto_949721 ?auto_949720 ) ) ( not ( = ?auto_949721 ?auto_949722 ) ) ( not ( = ?auto_949721 ?auto_949723 ) ) ( not ( = ?auto_949721 ?auto_949724 ) ) ( not ( = ?auto_949721 ?auto_949725 ) ) ( not ( = ?auto_949721 ?auto_949726 ) ) ( not ( = ?auto_949721 ?auto_949727 ) ) ( not ( = ?auto_949721 ?auto_949728 ) ) ( not ( = ?auto_949721 ?auto_949729 ) ) ( not ( = ?auto_949721 ?auto_949733 ) ) ( not ( = ?auto_949720 ?auto_949722 ) ) ( not ( = ?auto_949720 ?auto_949723 ) ) ( not ( = ?auto_949720 ?auto_949724 ) ) ( not ( = ?auto_949720 ?auto_949725 ) ) ( not ( = ?auto_949720 ?auto_949726 ) ) ( not ( = ?auto_949720 ?auto_949727 ) ) ( not ( = ?auto_949720 ?auto_949728 ) ) ( not ( = ?auto_949720 ?auto_949729 ) ) ( not ( = ?auto_949720 ?auto_949733 ) ) ( not ( = ?auto_949722 ?auto_949723 ) ) ( not ( = ?auto_949722 ?auto_949724 ) ) ( not ( = ?auto_949722 ?auto_949725 ) ) ( not ( = ?auto_949722 ?auto_949726 ) ) ( not ( = ?auto_949722 ?auto_949727 ) ) ( not ( = ?auto_949722 ?auto_949728 ) ) ( not ( = ?auto_949722 ?auto_949729 ) ) ( not ( = ?auto_949722 ?auto_949733 ) ) ( not ( = ?auto_949723 ?auto_949724 ) ) ( not ( = ?auto_949723 ?auto_949725 ) ) ( not ( = ?auto_949723 ?auto_949726 ) ) ( not ( = ?auto_949723 ?auto_949727 ) ) ( not ( = ?auto_949723 ?auto_949728 ) ) ( not ( = ?auto_949723 ?auto_949729 ) ) ( not ( = ?auto_949723 ?auto_949733 ) ) ( not ( = ?auto_949724 ?auto_949725 ) ) ( not ( = ?auto_949724 ?auto_949726 ) ) ( not ( = ?auto_949724 ?auto_949727 ) ) ( not ( = ?auto_949724 ?auto_949728 ) ) ( not ( = ?auto_949724 ?auto_949729 ) ) ( not ( = ?auto_949724 ?auto_949733 ) ) ( not ( = ?auto_949725 ?auto_949726 ) ) ( not ( = ?auto_949725 ?auto_949727 ) ) ( not ( = ?auto_949725 ?auto_949728 ) ) ( not ( = ?auto_949725 ?auto_949729 ) ) ( not ( = ?auto_949725 ?auto_949733 ) ) ( not ( = ?auto_949726 ?auto_949727 ) ) ( not ( = ?auto_949726 ?auto_949728 ) ) ( not ( = ?auto_949726 ?auto_949729 ) ) ( not ( = ?auto_949726 ?auto_949733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949727 ?auto_949728 ?auto_949729 )
      ( MAKE-12CRATE-VERIFY ?auto_949717 ?auto_949718 ?auto_949719 ?auto_949721 ?auto_949720 ?auto_949722 ?auto_949723 ?auto_949724 ?auto_949725 ?auto_949726 ?auto_949727 ?auto_949728 ?auto_949729 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949880 - SURFACE
      ?auto_949881 - SURFACE
      ?auto_949882 - SURFACE
      ?auto_949884 - SURFACE
      ?auto_949883 - SURFACE
      ?auto_949885 - SURFACE
      ?auto_949886 - SURFACE
      ?auto_949887 - SURFACE
      ?auto_949888 - SURFACE
      ?auto_949889 - SURFACE
      ?auto_949890 - SURFACE
      ?auto_949891 - SURFACE
      ?auto_949892 - SURFACE
    )
    :vars
    (
      ?auto_949897 - HOIST
      ?auto_949893 - PLACE
      ?auto_949894 - PLACE
      ?auto_949895 - HOIST
      ?auto_949896 - SURFACE
      ?auto_949898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949897 ?auto_949893 ) ( IS-CRATE ?auto_949892 ) ( not ( = ?auto_949891 ?auto_949892 ) ) ( not ( = ?auto_949890 ?auto_949891 ) ) ( not ( = ?auto_949890 ?auto_949892 ) ) ( not ( = ?auto_949894 ?auto_949893 ) ) ( HOIST-AT ?auto_949895 ?auto_949894 ) ( not ( = ?auto_949897 ?auto_949895 ) ) ( AVAILABLE ?auto_949895 ) ( SURFACE-AT ?auto_949892 ?auto_949894 ) ( ON ?auto_949892 ?auto_949896 ) ( CLEAR ?auto_949892 ) ( not ( = ?auto_949891 ?auto_949896 ) ) ( not ( = ?auto_949892 ?auto_949896 ) ) ( not ( = ?auto_949890 ?auto_949896 ) ) ( TRUCK-AT ?auto_949898 ?auto_949893 ) ( SURFACE-AT ?auto_949890 ?auto_949893 ) ( CLEAR ?auto_949890 ) ( IS-CRATE ?auto_949891 ) ( AVAILABLE ?auto_949897 ) ( IN ?auto_949891 ?auto_949898 ) ( ON ?auto_949881 ?auto_949880 ) ( ON ?auto_949882 ?auto_949881 ) ( ON ?auto_949884 ?auto_949882 ) ( ON ?auto_949883 ?auto_949884 ) ( ON ?auto_949885 ?auto_949883 ) ( ON ?auto_949886 ?auto_949885 ) ( ON ?auto_949887 ?auto_949886 ) ( ON ?auto_949888 ?auto_949887 ) ( ON ?auto_949889 ?auto_949888 ) ( ON ?auto_949890 ?auto_949889 ) ( not ( = ?auto_949880 ?auto_949881 ) ) ( not ( = ?auto_949880 ?auto_949882 ) ) ( not ( = ?auto_949880 ?auto_949884 ) ) ( not ( = ?auto_949880 ?auto_949883 ) ) ( not ( = ?auto_949880 ?auto_949885 ) ) ( not ( = ?auto_949880 ?auto_949886 ) ) ( not ( = ?auto_949880 ?auto_949887 ) ) ( not ( = ?auto_949880 ?auto_949888 ) ) ( not ( = ?auto_949880 ?auto_949889 ) ) ( not ( = ?auto_949880 ?auto_949890 ) ) ( not ( = ?auto_949880 ?auto_949891 ) ) ( not ( = ?auto_949880 ?auto_949892 ) ) ( not ( = ?auto_949880 ?auto_949896 ) ) ( not ( = ?auto_949881 ?auto_949882 ) ) ( not ( = ?auto_949881 ?auto_949884 ) ) ( not ( = ?auto_949881 ?auto_949883 ) ) ( not ( = ?auto_949881 ?auto_949885 ) ) ( not ( = ?auto_949881 ?auto_949886 ) ) ( not ( = ?auto_949881 ?auto_949887 ) ) ( not ( = ?auto_949881 ?auto_949888 ) ) ( not ( = ?auto_949881 ?auto_949889 ) ) ( not ( = ?auto_949881 ?auto_949890 ) ) ( not ( = ?auto_949881 ?auto_949891 ) ) ( not ( = ?auto_949881 ?auto_949892 ) ) ( not ( = ?auto_949881 ?auto_949896 ) ) ( not ( = ?auto_949882 ?auto_949884 ) ) ( not ( = ?auto_949882 ?auto_949883 ) ) ( not ( = ?auto_949882 ?auto_949885 ) ) ( not ( = ?auto_949882 ?auto_949886 ) ) ( not ( = ?auto_949882 ?auto_949887 ) ) ( not ( = ?auto_949882 ?auto_949888 ) ) ( not ( = ?auto_949882 ?auto_949889 ) ) ( not ( = ?auto_949882 ?auto_949890 ) ) ( not ( = ?auto_949882 ?auto_949891 ) ) ( not ( = ?auto_949882 ?auto_949892 ) ) ( not ( = ?auto_949882 ?auto_949896 ) ) ( not ( = ?auto_949884 ?auto_949883 ) ) ( not ( = ?auto_949884 ?auto_949885 ) ) ( not ( = ?auto_949884 ?auto_949886 ) ) ( not ( = ?auto_949884 ?auto_949887 ) ) ( not ( = ?auto_949884 ?auto_949888 ) ) ( not ( = ?auto_949884 ?auto_949889 ) ) ( not ( = ?auto_949884 ?auto_949890 ) ) ( not ( = ?auto_949884 ?auto_949891 ) ) ( not ( = ?auto_949884 ?auto_949892 ) ) ( not ( = ?auto_949884 ?auto_949896 ) ) ( not ( = ?auto_949883 ?auto_949885 ) ) ( not ( = ?auto_949883 ?auto_949886 ) ) ( not ( = ?auto_949883 ?auto_949887 ) ) ( not ( = ?auto_949883 ?auto_949888 ) ) ( not ( = ?auto_949883 ?auto_949889 ) ) ( not ( = ?auto_949883 ?auto_949890 ) ) ( not ( = ?auto_949883 ?auto_949891 ) ) ( not ( = ?auto_949883 ?auto_949892 ) ) ( not ( = ?auto_949883 ?auto_949896 ) ) ( not ( = ?auto_949885 ?auto_949886 ) ) ( not ( = ?auto_949885 ?auto_949887 ) ) ( not ( = ?auto_949885 ?auto_949888 ) ) ( not ( = ?auto_949885 ?auto_949889 ) ) ( not ( = ?auto_949885 ?auto_949890 ) ) ( not ( = ?auto_949885 ?auto_949891 ) ) ( not ( = ?auto_949885 ?auto_949892 ) ) ( not ( = ?auto_949885 ?auto_949896 ) ) ( not ( = ?auto_949886 ?auto_949887 ) ) ( not ( = ?auto_949886 ?auto_949888 ) ) ( not ( = ?auto_949886 ?auto_949889 ) ) ( not ( = ?auto_949886 ?auto_949890 ) ) ( not ( = ?auto_949886 ?auto_949891 ) ) ( not ( = ?auto_949886 ?auto_949892 ) ) ( not ( = ?auto_949886 ?auto_949896 ) ) ( not ( = ?auto_949887 ?auto_949888 ) ) ( not ( = ?auto_949887 ?auto_949889 ) ) ( not ( = ?auto_949887 ?auto_949890 ) ) ( not ( = ?auto_949887 ?auto_949891 ) ) ( not ( = ?auto_949887 ?auto_949892 ) ) ( not ( = ?auto_949887 ?auto_949896 ) ) ( not ( = ?auto_949888 ?auto_949889 ) ) ( not ( = ?auto_949888 ?auto_949890 ) ) ( not ( = ?auto_949888 ?auto_949891 ) ) ( not ( = ?auto_949888 ?auto_949892 ) ) ( not ( = ?auto_949888 ?auto_949896 ) ) ( not ( = ?auto_949889 ?auto_949890 ) ) ( not ( = ?auto_949889 ?auto_949891 ) ) ( not ( = ?auto_949889 ?auto_949892 ) ) ( not ( = ?auto_949889 ?auto_949896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949890 ?auto_949891 ?auto_949892 )
      ( MAKE-12CRATE-VERIFY ?auto_949880 ?auto_949881 ?auto_949882 ?auto_949884 ?auto_949883 ?auto_949885 ?auto_949886 ?auto_949887 ?auto_949888 ?auto_949889 ?auto_949890 ?auto_949891 ?auto_949892 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_961438 - SURFACE
      ?auto_961439 - SURFACE
      ?auto_961440 - SURFACE
      ?auto_961442 - SURFACE
      ?auto_961441 - SURFACE
      ?auto_961443 - SURFACE
      ?auto_961444 - SURFACE
      ?auto_961445 - SURFACE
      ?auto_961446 - SURFACE
      ?auto_961447 - SURFACE
      ?auto_961448 - SURFACE
      ?auto_961449 - SURFACE
      ?auto_961450 - SURFACE
      ?auto_961451 - SURFACE
    )
    :vars
    (
      ?auto_961452 - HOIST
      ?auto_961453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_961452 ?auto_961453 ) ( SURFACE-AT ?auto_961450 ?auto_961453 ) ( CLEAR ?auto_961450 ) ( LIFTING ?auto_961452 ?auto_961451 ) ( IS-CRATE ?auto_961451 ) ( not ( = ?auto_961450 ?auto_961451 ) ) ( ON ?auto_961439 ?auto_961438 ) ( ON ?auto_961440 ?auto_961439 ) ( ON ?auto_961442 ?auto_961440 ) ( ON ?auto_961441 ?auto_961442 ) ( ON ?auto_961443 ?auto_961441 ) ( ON ?auto_961444 ?auto_961443 ) ( ON ?auto_961445 ?auto_961444 ) ( ON ?auto_961446 ?auto_961445 ) ( ON ?auto_961447 ?auto_961446 ) ( ON ?auto_961448 ?auto_961447 ) ( ON ?auto_961449 ?auto_961448 ) ( ON ?auto_961450 ?auto_961449 ) ( not ( = ?auto_961438 ?auto_961439 ) ) ( not ( = ?auto_961438 ?auto_961440 ) ) ( not ( = ?auto_961438 ?auto_961442 ) ) ( not ( = ?auto_961438 ?auto_961441 ) ) ( not ( = ?auto_961438 ?auto_961443 ) ) ( not ( = ?auto_961438 ?auto_961444 ) ) ( not ( = ?auto_961438 ?auto_961445 ) ) ( not ( = ?auto_961438 ?auto_961446 ) ) ( not ( = ?auto_961438 ?auto_961447 ) ) ( not ( = ?auto_961438 ?auto_961448 ) ) ( not ( = ?auto_961438 ?auto_961449 ) ) ( not ( = ?auto_961438 ?auto_961450 ) ) ( not ( = ?auto_961438 ?auto_961451 ) ) ( not ( = ?auto_961439 ?auto_961440 ) ) ( not ( = ?auto_961439 ?auto_961442 ) ) ( not ( = ?auto_961439 ?auto_961441 ) ) ( not ( = ?auto_961439 ?auto_961443 ) ) ( not ( = ?auto_961439 ?auto_961444 ) ) ( not ( = ?auto_961439 ?auto_961445 ) ) ( not ( = ?auto_961439 ?auto_961446 ) ) ( not ( = ?auto_961439 ?auto_961447 ) ) ( not ( = ?auto_961439 ?auto_961448 ) ) ( not ( = ?auto_961439 ?auto_961449 ) ) ( not ( = ?auto_961439 ?auto_961450 ) ) ( not ( = ?auto_961439 ?auto_961451 ) ) ( not ( = ?auto_961440 ?auto_961442 ) ) ( not ( = ?auto_961440 ?auto_961441 ) ) ( not ( = ?auto_961440 ?auto_961443 ) ) ( not ( = ?auto_961440 ?auto_961444 ) ) ( not ( = ?auto_961440 ?auto_961445 ) ) ( not ( = ?auto_961440 ?auto_961446 ) ) ( not ( = ?auto_961440 ?auto_961447 ) ) ( not ( = ?auto_961440 ?auto_961448 ) ) ( not ( = ?auto_961440 ?auto_961449 ) ) ( not ( = ?auto_961440 ?auto_961450 ) ) ( not ( = ?auto_961440 ?auto_961451 ) ) ( not ( = ?auto_961442 ?auto_961441 ) ) ( not ( = ?auto_961442 ?auto_961443 ) ) ( not ( = ?auto_961442 ?auto_961444 ) ) ( not ( = ?auto_961442 ?auto_961445 ) ) ( not ( = ?auto_961442 ?auto_961446 ) ) ( not ( = ?auto_961442 ?auto_961447 ) ) ( not ( = ?auto_961442 ?auto_961448 ) ) ( not ( = ?auto_961442 ?auto_961449 ) ) ( not ( = ?auto_961442 ?auto_961450 ) ) ( not ( = ?auto_961442 ?auto_961451 ) ) ( not ( = ?auto_961441 ?auto_961443 ) ) ( not ( = ?auto_961441 ?auto_961444 ) ) ( not ( = ?auto_961441 ?auto_961445 ) ) ( not ( = ?auto_961441 ?auto_961446 ) ) ( not ( = ?auto_961441 ?auto_961447 ) ) ( not ( = ?auto_961441 ?auto_961448 ) ) ( not ( = ?auto_961441 ?auto_961449 ) ) ( not ( = ?auto_961441 ?auto_961450 ) ) ( not ( = ?auto_961441 ?auto_961451 ) ) ( not ( = ?auto_961443 ?auto_961444 ) ) ( not ( = ?auto_961443 ?auto_961445 ) ) ( not ( = ?auto_961443 ?auto_961446 ) ) ( not ( = ?auto_961443 ?auto_961447 ) ) ( not ( = ?auto_961443 ?auto_961448 ) ) ( not ( = ?auto_961443 ?auto_961449 ) ) ( not ( = ?auto_961443 ?auto_961450 ) ) ( not ( = ?auto_961443 ?auto_961451 ) ) ( not ( = ?auto_961444 ?auto_961445 ) ) ( not ( = ?auto_961444 ?auto_961446 ) ) ( not ( = ?auto_961444 ?auto_961447 ) ) ( not ( = ?auto_961444 ?auto_961448 ) ) ( not ( = ?auto_961444 ?auto_961449 ) ) ( not ( = ?auto_961444 ?auto_961450 ) ) ( not ( = ?auto_961444 ?auto_961451 ) ) ( not ( = ?auto_961445 ?auto_961446 ) ) ( not ( = ?auto_961445 ?auto_961447 ) ) ( not ( = ?auto_961445 ?auto_961448 ) ) ( not ( = ?auto_961445 ?auto_961449 ) ) ( not ( = ?auto_961445 ?auto_961450 ) ) ( not ( = ?auto_961445 ?auto_961451 ) ) ( not ( = ?auto_961446 ?auto_961447 ) ) ( not ( = ?auto_961446 ?auto_961448 ) ) ( not ( = ?auto_961446 ?auto_961449 ) ) ( not ( = ?auto_961446 ?auto_961450 ) ) ( not ( = ?auto_961446 ?auto_961451 ) ) ( not ( = ?auto_961447 ?auto_961448 ) ) ( not ( = ?auto_961447 ?auto_961449 ) ) ( not ( = ?auto_961447 ?auto_961450 ) ) ( not ( = ?auto_961447 ?auto_961451 ) ) ( not ( = ?auto_961448 ?auto_961449 ) ) ( not ( = ?auto_961448 ?auto_961450 ) ) ( not ( = ?auto_961448 ?auto_961451 ) ) ( not ( = ?auto_961449 ?auto_961450 ) ) ( not ( = ?auto_961449 ?auto_961451 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_961450 ?auto_961451 )
      ( MAKE-13CRATE-VERIFY ?auto_961438 ?auto_961439 ?auto_961440 ?auto_961442 ?auto_961441 ?auto_961443 ?auto_961444 ?auto_961445 ?auto_961446 ?auto_961447 ?auto_961448 ?auto_961449 ?auto_961450 ?auto_961451 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_961580 - SURFACE
      ?auto_961581 - SURFACE
      ?auto_961582 - SURFACE
      ?auto_961584 - SURFACE
      ?auto_961583 - SURFACE
      ?auto_961585 - SURFACE
      ?auto_961586 - SURFACE
      ?auto_961587 - SURFACE
      ?auto_961588 - SURFACE
      ?auto_961589 - SURFACE
      ?auto_961590 - SURFACE
      ?auto_961591 - SURFACE
      ?auto_961592 - SURFACE
      ?auto_961593 - SURFACE
    )
    :vars
    (
      ?auto_961595 - HOIST
      ?auto_961596 - PLACE
      ?auto_961594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_961595 ?auto_961596 ) ( SURFACE-AT ?auto_961592 ?auto_961596 ) ( CLEAR ?auto_961592 ) ( IS-CRATE ?auto_961593 ) ( not ( = ?auto_961592 ?auto_961593 ) ) ( TRUCK-AT ?auto_961594 ?auto_961596 ) ( AVAILABLE ?auto_961595 ) ( IN ?auto_961593 ?auto_961594 ) ( ON ?auto_961592 ?auto_961591 ) ( not ( = ?auto_961591 ?auto_961592 ) ) ( not ( = ?auto_961591 ?auto_961593 ) ) ( ON ?auto_961581 ?auto_961580 ) ( ON ?auto_961582 ?auto_961581 ) ( ON ?auto_961584 ?auto_961582 ) ( ON ?auto_961583 ?auto_961584 ) ( ON ?auto_961585 ?auto_961583 ) ( ON ?auto_961586 ?auto_961585 ) ( ON ?auto_961587 ?auto_961586 ) ( ON ?auto_961588 ?auto_961587 ) ( ON ?auto_961589 ?auto_961588 ) ( ON ?auto_961590 ?auto_961589 ) ( ON ?auto_961591 ?auto_961590 ) ( not ( = ?auto_961580 ?auto_961581 ) ) ( not ( = ?auto_961580 ?auto_961582 ) ) ( not ( = ?auto_961580 ?auto_961584 ) ) ( not ( = ?auto_961580 ?auto_961583 ) ) ( not ( = ?auto_961580 ?auto_961585 ) ) ( not ( = ?auto_961580 ?auto_961586 ) ) ( not ( = ?auto_961580 ?auto_961587 ) ) ( not ( = ?auto_961580 ?auto_961588 ) ) ( not ( = ?auto_961580 ?auto_961589 ) ) ( not ( = ?auto_961580 ?auto_961590 ) ) ( not ( = ?auto_961580 ?auto_961591 ) ) ( not ( = ?auto_961580 ?auto_961592 ) ) ( not ( = ?auto_961580 ?auto_961593 ) ) ( not ( = ?auto_961581 ?auto_961582 ) ) ( not ( = ?auto_961581 ?auto_961584 ) ) ( not ( = ?auto_961581 ?auto_961583 ) ) ( not ( = ?auto_961581 ?auto_961585 ) ) ( not ( = ?auto_961581 ?auto_961586 ) ) ( not ( = ?auto_961581 ?auto_961587 ) ) ( not ( = ?auto_961581 ?auto_961588 ) ) ( not ( = ?auto_961581 ?auto_961589 ) ) ( not ( = ?auto_961581 ?auto_961590 ) ) ( not ( = ?auto_961581 ?auto_961591 ) ) ( not ( = ?auto_961581 ?auto_961592 ) ) ( not ( = ?auto_961581 ?auto_961593 ) ) ( not ( = ?auto_961582 ?auto_961584 ) ) ( not ( = ?auto_961582 ?auto_961583 ) ) ( not ( = ?auto_961582 ?auto_961585 ) ) ( not ( = ?auto_961582 ?auto_961586 ) ) ( not ( = ?auto_961582 ?auto_961587 ) ) ( not ( = ?auto_961582 ?auto_961588 ) ) ( not ( = ?auto_961582 ?auto_961589 ) ) ( not ( = ?auto_961582 ?auto_961590 ) ) ( not ( = ?auto_961582 ?auto_961591 ) ) ( not ( = ?auto_961582 ?auto_961592 ) ) ( not ( = ?auto_961582 ?auto_961593 ) ) ( not ( = ?auto_961584 ?auto_961583 ) ) ( not ( = ?auto_961584 ?auto_961585 ) ) ( not ( = ?auto_961584 ?auto_961586 ) ) ( not ( = ?auto_961584 ?auto_961587 ) ) ( not ( = ?auto_961584 ?auto_961588 ) ) ( not ( = ?auto_961584 ?auto_961589 ) ) ( not ( = ?auto_961584 ?auto_961590 ) ) ( not ( = ?auto_961584 ?auto_961591 ) ) ( not ( = ?auto_961584 ?auto_961592 ) ) ( not ( = ?auto_961584 ?auto_961593 ) ) ( not ( = ?auto_961583 ?auto_961585 ) ) ( not ( = ?auto_961583 ?auto_961586 ) ) ( not ( = ?auto_961583 ?auto_961587 ) ) ( not ( = ?auto_961583 ?auto_961588 ) ) ( not ( = ?auto_961583 ?auto_961589 ) ) ( not ( = ?auto_961583 ?auto_961590 ) ) ( not ( = ?auto_961583 ?auto_961591 ) ) ( not ( = ?auto_961583 ?auto_961592 ) ) ( not ( = ?auto_961583 ?auto_961593 ) ) ( not ( = ?auto_961585 ?auto_961586 ) ) ( not ( = ?auto_961585 ?auto_961587 ) ) ( not ( = ?auto_961585 ?auto_961588 ) ) ( not ( = ?auto_961585 ?auto_961589 ) ) ( not ( = ?auto_961585 ?auto_961590 ) ) ( not ( = ?auto_961585 ?auto_961591 ) ) ( not ( = ?auto_961585 ?auto_961592 ) ) ( not ( = ?auto_961585 ?auto_961593 ) ) ( not ( = ?auto_961586 ?auto_961587 ) ) ( not ( = ?auto_961586 ?auto_961588 ) ) ( not ( = ?auto_961586 ?auto_961589 ) ) ( not ( = ?auto_961586 ?auto_961590 ) ) ( not ( = ?auto_961586 ?auto_961591 ) ) ( not ( = ?auto_961586 ?auto_961592 ) ) ( not ( = ?auto_961586 ?auto_961593 ) ) ( not ( = ?auto_961587 ?auto_961588 ) ) ( not ( = ?auto_961587 ?auto_961589 ) ) ( not ( = ?auto_961587 ?auto_961590 ) ) ( not ( = ?auto_961587 ?auto_961591 ) ) ( not ( = ?auto_961587 ?auto_961592 ) ) ( not ( = ?auto_961587 ?auto_961593 ) ) ( not ( = ?auto_961588 ?auto_961589 ) ) ( not ( = ?auto_961588 ?auto_961590 ) ) ( not ( = ?auto_961588 ?auto_961591 ) ) ( not ( = ?auto_961588 ?auto_961592 ) ) ( not ( = ?auto_961588 ?auto_961593 ) ) ( not ( = ?auto_961589 ?auto_961590 ) ) ( not ( = ?auto_961589 ?auto_961591 ) ) ( not ( = ?auto_961589 ?auto_961592 ) ) ( not ( = ?auto_961589 ?auto_961593 ) ) ( not ( = ?auto_961590 ?auto_961591 ) ) ( not ( = ?auto_961590 ?auto_961592 ) ) ( not ( = ?auto_961590 ?auto_961593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_961591 ?auto_961592 ?auto_961593 )
      ( MAKE-13CRATE-VERIFY ?auto_961580 ?auto_961581 ?auto_961582 ?auto_961584 ?auto_961583 ?auto_961585 ?auto_961586 ?auto_961587 ?auto_961588 ?auto_961589 ?auto_961590 ?auto_961591 ?auto_961592 ?auto_961593 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_961736 - SURFACE
      ?auto_961737 - SURFACE
      ?auto_961738 - SURFACE
      ?auto_961740 - SURFACE
      ?auto_961739 - SURFACE
      ?auto_961741 - SURFACE
      ?auto_961742 - SURFACE
      ?auto_961743 - SURFACE
      ?auto_961744 - SURFACE
      ?auto_961745 - SURFACE
      ?auto_961746 - SURFACE
      ?auto_961747 - SURFACE
      ?auto_961748 - SURFACE
      ?auto_961749 - SURFACE
    )
    :vars
    (
      ?auto_961752 - HOIST
      ?auto_961750 - PLACE
      ?auto_961751 - TRUCK
      ?auto_961753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_961752 ?auto_961750 ) ( SURFACE-AT ?auto_961748 ?auto_961750 ) ( CLEAR ?auto_961748 ) ( IS-CRATE ?auto_961749 ) ( not ( = ?auto_961748 ?auto_961749 ) ) ( AVAILABLE ?auto_961752 ) ( IN ?auto_961749 ?auto_961751 ) ( ON ?auto_961748 ?auto_961747 ) ( not ( = ?auto_961747 ?auto_961748 ) ) ( not ( = ?auto_961747 ?auto_961749 ) ) ( TRUCK-AT ?auto_961751 ?auto_961753 ) ( not ( = ?auto_961753 ?auto_961750 ) ) ( ON ?auto_961737 ?auto_961736 ) ( ON ?auto_961738 ?auto_961737 ) ( ON ?auto_961740 ?auto_961738 ) ( ON ?auto_961739 ?auto_961740 ) ( ON ?auto_961741 ?auto_961739 ) ( ON ?auto_961742 ?auto_961741 ) ( ON ?auto_961743 ?auto_961742 ) ( ON ?auto_961744 ?auto_961743 ) ( ON ?auto_961745 ?auto_961744 ) ( ON ?auto_961746 ?auto_961745 ) ( ON ?auto_961747 ?auto_961746 ) ( not ( = ?auto_961736 ?auto_961737 ) ) ( not ( = ?auto_961736 ?auto_961738 ) ) ( not ( = ?auto_961736 ?auto_961740 ) ) ( not ( = ?auto_961736 ?auto_961739 ) ) ( not ( = ?auto_961736 ?auto_961741 ) ) ( not ( = ?auto_961736 ?auto_961742 ) ) ( not ( = ?auto_961736 ?auto_961743 ) ) ( not ( = ?auto_961736 ?auto_961744 ) ) ( not ( = ?auto_961736 ?auto_961745 ) ) ( not ( = ?auto_961736 ?auto_961746 ) ) ( not ( = ?auto_961736 ?auto_961747 ) ) ( not ( = ?auto_961736 ?auto_961748 ) ) ( not ( = ?auto_961736 ?auto_961749 ) ) ( not ( = ?auto_961737 ?auto_961738 ) ) ( not ( = ?auto_961737 ?auto_961740 ) ) ( not ( = ?auto_961737 ?auto_961739 ) ) ( not ( = ?auto_961737 ?auto_961741 ) ) ( not ( = ?auto_961737 ?auto_961742 ) ) ( not ( = ?auto_961737 ?auto_961743 ) ) ( not ( = ?auto_961737 ?auto_961744 ) ) ( not ( = ?auto_961737 ?auto_961745 ) ) ( not ( = ?auto_961737 ?auto_961746 ) ) ( not ( = ?auto_961737 ?auto_961747 ) ) ( not ( = ?auto_961737 ?auto_961748 ) ) ( not ( = ?auto_961737 ?auto_961749 ) ) ( not ( = ?auto_961738 ?auto_961740 ) ) ( not ( = ?auto_961738 ?auto_961739 ) ) ( not ( = ?auto_961738 ?auto_961741 ) ) ( not ( = ?auto_961738 ?auto_961742 ) ) ( not ( = ?auto_961738 ?auto_961743 ) ) ( not ( = ?auto_961738 ?auto_961744 ) ) ( not ( = ?auto_961738 ?auto_961745 ) ) ( not ( = ?auto_961738 ?auto_961746 ) ) ( not ( = ?auto_961738 ?auto_961747 ) ) ( not ( = ?auto_961738 ?auto_961748 ) ) ( not ( = ?auto_961738 ?auto_961749 ) ) ( not ( = ?auto_961740 ?auto_961739 ) ) ( not ( = ?auto_961740 ?auto_961741 ) ) ( not ( = ?auto_961740 ?auto_961742 ) ) ( not ( = ?auto_961740 ?auto_961743 ) ) ( not ( = ?auto_961740 ?auto_961744 ) ) ( not ( = ?auto_961740 ?auto_961745 ) ) ( not ( = ?auto_961740 ?auto_961746 ) ) ( not ( = ?auto_961740 ?auto_961747 ) ) ( not ( = ?auto_961740 ?auto_961748 ) ) ( not ( = ?auto_961740 ?auto_961749 ) ) ( not ( = ?auto_961739 ?auto_961741 ) ) ( not ( = ?auto_961739 ?auto_961742 ) ) ( not ( = ?auto_961739 ?auto_961743 ) ) ( not ( = ?auto_961739 ?auto_961744 ) ) ( not ( = ?auto_961739 ?auto_961745 ) ) ( not ( = ?auto_961739 ?auto_961746 ) ) ( not ( = ?auto_961739 ?auto_961747 ) ) ( not ( = ?auto_961739 ?auto_961748 ) ) ( not ( = ?auto_961739 ?auto_961749 ) ) ( not ( = ?auto_961741 ?auto_961742 ) ) ( not ( = ?auto_961741 ?auto_961743 ) ) ( not ( = ?auto_961741 ?auto_961744 ) ) ( not ( = ?auto_961741 ?auto_961745 ) ) ( not ( = ?auto_961741 ?auto_961746 ) ) ( not ( = ?auto_961741 ?auto_961747 ) ) ( not ( = ?auto_961741 ?auto_961748 ) ) ( not ( = ?auto_961741 ?auto_961749 ) ) ( not ( = ?auto_961742 ?auto_961743 ) ) ( not ( = ?auto_961742 ?auto_961744 ) ) ( not ( = ?auto_961742 ?auto_961745 ) ) ( not ( = ?auto_961742 ?auto_961746 ) ) ( not ( = ?auto_961742 ?auto_961747 ) ) ( not ( = ?auto_961742 ?auto_961748 ) ) ( not ( = ?auto_961742 ?auto_961749 ) ) ( not ( = ?auto_961743 ?auto_961744 ) ) ( not ( = ?auto_961743 ?auto_961745 ) ) ( not ( = ?auto_961743 ?auto_961746 ) ) ( not ( = ?auto_961743 ?auto_961747 ) ) ( not ( = ?auto_961743 ?auto_961748 ) ) ( not ( = ?auto_961743 ?auto_961749 ) ) ( not ( = ?auto_961744 ?auto_961745 ) ) ( not ( = ?auto_961744 ?auto_961746 ) ) ( not ( = ?auto_961744 ?auto_961747 ) ) ( not ( = ?auto_961744 ?auto_961748 ) ) ( not ( = ?auto_961744 ?auto_961749 ) ) ( not ( = ?auto_961745 ?auto_961746 ) ) ( not ( = ?auto_961745 ?auto_961747 ) ) ( not ( = ?auto_961745 ?auto_961748 ) ) ( not ( = ?auto_961745 ?auto_961749 ) ) ( not ( = ?auto_961746 ?auto_961747 ) ) ( not ( = ?auto_961746 ?auto_961748 ) ) ( not ( = ?auto_961746 ?auto_961749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_961747 ?auto_961748 ?auto_961749 )
      ( MAKE-13CRATE-VERIFY ?auto_961736 ?auto_961737 ?auto_961738 ?auto_961740 ?auto_961739 ?auto_961741 ?auto_961742 ?auto_961743 ?auto_961744 ?auto_961745 ?auto_961746 ?auto_961747 ?auto_961748 ?auto_961749 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_961905 - SURFACE
      ?auto_961906 - SURFACE
      ?auto_961907 - SURFACE
      ?auto_961909 - SURFACE
      ?auto_961908 - SURFACE
      ?auto_961910 - SURFACE
      ?auto_961911 - SURFACE
      ?auto_961912 - SURFACE
      ?auto_961913 - SURFACE
      ?auto_961914 - SURFACE
      ?auto_961915 - SURFACE
      ?auto_961916 - SURFACE
      ?auto_961917 - SURFACE
      ?auto_961918 - SURFACE
    )
    :vars
    (
      ?auto_961922 - HOIST
      ?auto_961919 - PLACE
      ?auto_961920 - TRUCK
      ?auto_961923 - PLACE
      ?auto_961921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_961922 ?auto_961919 ) ( SURFACE-AT ?auto_961917 ?auto_961919 ) ( CLEAR ?auto_961917 ) ( IS-CRATE ?auto_961918 ) ( not ( = ?auto_961917 ?auto_961918 ) ) ( AVAILABLE ?auto_961922 ) ( ON ?auto_961917 ?auto_961916 ) ( not ( = ?auto_961916 ?auto_961917 ) ) ( not ( = ?auto_961916 ?auto_961918 ) ) ( TRUCK-AT ?auto_961920 ?auto_961923 ) ( not ( = ?auto_961923 ?auto_961919 ) ) ( HOIST-AT ?auto_961921 ?auto_961923 ) ( LIFTING ?auto_961921 ?auto_961918 ) ( not ( = ?auto_961922 ?auto_961921 ) ) ( ON ?auto_961906 ?auto_961905 ) ( ON ?auto_961907 ?auto_961906 ) ( ON ?auto_961909 ?auto_961907 ) ( ON ?auto_961908 ?auto_961909 ) ( ON ?auto_961910 ?auto_961908 ) ( ON ?auto_961911 ?auto_961910 ) ( ON ?auto_961912 ?auto_961911 ) ( ON ?auto_961913 ?auto_961912 ) ( ON ?auto_961914 ?auto_961913 ) ( ON ?auto_961915 ?auto_961914 ) ( ON ?auto_961916 ?auto_961915 ) ( not ( = ?auto_961905 ?auto_961906 ) ) ( not ( = ?auto_961905 ?auto_961907 ) ) ( not ( = ?auto_961905 ?auto_961909 ) ) ( not ( = ?auto_961905 ?auto_961908 ) ) ( not ( = ?auto_961905 ?auto_961910 ) ) ( not ( = ?auto_961905 ?auto_961911 ) ) ( not ( = ?auto_961905 ?auto_961912 ) ) ( not ( = ?auto_961905 ?auto_961913 ) ) ( not ( = ?auto_961905 ?auto_961914 ) ) ( not ( = ?auto_961905 ?auto_961915 ) ) ( not ( = ?auto_961905 ?auto_961916 ) ) ( not ( = ?auto_961905 ?auto_961917 ) ) ( not ( = ?auto_961905 ?auto_961918 ) ) ( not ( = ?auto_961906 ?auto_961907 ) ) ( not ( = ?auto_961906 ?auto_961909 ) ) ( not ( = ?auto_961906 ?auto_961908 ) ) ( not ( = ?auto_961906 ?auto_961910 ) ) ( not ( = ?auto_961906 ?auto_961911 ) ) ( not ( = ?auto_961906 ?auto_961912 ) ) ( not ( = ?auto_961906 ?auto_961913 ) ) ( not ( = ?auto_961906 ?auto_961914 ) ) ( not ( = ?auto_961906 ?auto_961915 ) ) ( not ( = ?auto_961906 ?auto_961916 ) ) ( not ( = ?auto_961906 ?auto_961917 ) ) ( not ( = ?auto_961906 ?auto_961918 ) ) ( not ( = ?auto_961907 ?auto_961909 ) ) ( not ( = ?auto_961907 ?auto_961908 ) ) ( not ( = ?auto_961907 ?auto_961910 ) ) ( not ( = ?auto_961907 ?auto_961911 ) ) ( not ( = ?auto_961907 ?auto_961912 ) ) ( not ( = ?auto_961907 ?auto_961913 ) ) ( not ( = ?auto_961907 ?auto_961914 ) ) ( not ( = ?auto_961907 ?auto_961915 ) ) ( not ( = ?auto_961907 ?auto_961916 ) ) ( not ( = ?auto_961907 ?auto_961917 ) ) ( not ( = ?auto_961907 ?auto_961918 ) ) ( not ( = ?auto_961909 ?auto_961908 ) ) ( not ( = ?auto_961909 ?auto_961910 ) ) ( not ( = ?auto_961909 ?auto_961911 ) ) ( not ( = ?auto_961909 ?auto_961912 ) ) ( not ( = ?auto_961909 ?auto_961913 ) ) ( not ( = ?auto_961909 ?auto_961914 ) ) ( not ( = ?auto_961909 ?auto_961915 ) ) ( not ( = ?auto_961909 ?auto_961916 ) ) ( not ( = ?auto_961909 ?auto_961917 ) ) ( not ( = ?auto_961909 ?auto_961918 ) ) ( not ( = ?auto_961908 ?auto_961910 ) ) ( not ( = ?auto_961908 ?auto_961911 ) ) ( not ( = ?auto_961908 ?auto_961912 ) ) ( not ( = ?auto_961908 ?auto_961913 ) ) ( not ( = ?auto_961908 ?auto_961914 ) ) ( not ( = ?auto_961908 ?auto_961915 ) ) ( not ( = ?auto_961908 ?auto_961916 ) ) ( not ( = ?auto_961908 ?auto_961917 ) ) ( not ( = ?auto_961908 ?auto_961918 ) ) ( not ( = ?auto_961910 ?auto_961911 ) ) ( not ( = ?auto_961910 ?auto_961912 ) ) ( not ( = ?auto_961910 ?auto_961913 ) ) ( not ( = ?auto_961910 ?auto_961914 ) ) ( not ( = ?auto_961910 ?auto_961915 ) ) ( not ( = ?auto_961910 ?auto_961916 ) ) ( not ( = ?auto_961910 ?auto_961917 ) ) ( not ( = ?auto_961910 ?auto_961918 ) ) ( not ( = ?auto_961911 ?auto_961912 ) ) ( not ( = ?auto_961911 ?auto_961913 ) ) ( not ( = ?auto_961911 ?auto_961914 ) ) ( not ( = ?auto_961911 ?auto_961915 ) ) ( not ( = ?auto_961911 ?auto_961916 ) ) ( not ( = ?auto_961911 ?auto_961917 ) ) ( not ( = ?auto_961911 ?auto_961918 ) ) ( not ( = ?auto_961912 ?auto_961913 ) ) ( not ( = ?auto_961912 ?auto_961914 ) ) ( not ( = ?auto_961912 ?auto_961915 ) ) ( not ( = ?auto_961912 ?auto_961916 ) ) ( not ( = ?auto_961912 ?auto_961917 ) ) ( not ( = ?auto_961912 ?auto_961918 ) ) ( not ( = ?auto_961913 ?auto_961914 ) ) ( not ( = ?auto_961913 ?auto_961915 ) ) ( not ( = ?auto_961913 ?auto_961916 ) ) ( not ( = ?auto_961913 ?auto_961917 ) ) ( not ( = ?auto_961913 ?auto_961918 ) ) ( not ( = ?auto_961914 ?auto_961915 ) ) ( not ( = ?auto_961914 ?auto_961916 ) ) ( not ( = ?auto_961914 ?auto_961917 ) ) ( not ( = ?auto_961914 ?auto_961918 ) ) ( not ( = ?auto_961915 ?auto_961916 ) ) ( not ( = ?auto_961915 ?auto_961917 ) ) ( not ( = ?auto_961915 ?auto_961918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_961916 ?auto_961917 ?auto_961918 )
      ( MAKE-13CRATE-VERIFY ?auto_961905 ?auto_961906 ?auto_961907 ?auto_961909 ?auto_961908 ?auto_961910 ?auto_961911 ?auto_961912 ?auto_961913 ?auto_961914 ?auto_961915 ?auto_961916 ?auto_961917 ?auto_961918 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962087 - SURFACE
      ?auto_962088 - SURFACE
      ?auto_962089 - SURFACE
      ?auto_962091 - SURFACE
      ?auto_962090 - SURFACE
      ?auto_962092 - SURFACE
      ?auto_962093 - SURFACE
      ?auto_962094 - SURFACE
      ?auto_962095 - SURFACE
      ?auto_962096 - SURFACE
      ?auto_962097 - SURFACE
      ?auto_962098 - SURFACE
      ?auto_962099 - SURFACE
      ?auto_962100 - SURFACE
    )
    :vars
    (
      ?auto_962104 - HOIST
      ?auto_962105 - PLACE
      ?auto_962101 - TRUCK
      ?auto_962103 - PLACE
      ?auto_962106 - HOIST
      ?auto_962102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962104 ?auto_962105 ) ( SURFACE-AT ?auto_962099 ?auto_962105 ) ( CLEAR ?auto_962099 ) ( IS-CRATE ?auto_962100 ) ( not ( = ?auto_962099 ?auto_962100 ) ) ( AVAILABLE ?auto_962104 ) ( ON ?auto_962099 ?auto_962098 ) ( not ( = ?auto_962098 ?auto_962099 ) ) ( not ( = ?auto_962098 ?auto_962100 ) ) ( TRUCK-AT ?auto_962101 ?auto_962103 ) ( not ( = ?auto_962103 ?auto_962105 ) ) ( HOIST-AT ?auto_962106 ?auto_962103 ) ( not ( = ?auto_962104 ?auto_962106 ) ) ( AVAILABLE ?auto_962106 ) ( SURFACE-AT ?auto_962100 ?auto_962103 ) ( ON ?auto_962100 ?auto_962102 ) ( CLEAR ?auto_962100 ) ( not ( = ?auto_962099 ?auto_962102 ) ) ( not ( = ?auto_962100 ?auto_962102 ) ) ( not ( = ?auto_962098 ?auto_962102 ) ) ( ON ?auto_962088 ?auto_962087 ) ( ON ?auto_962089 ?auto_962088 ) ( ON ?auto_962091 ?auto_962089 ) ( ON ?auto_962090 ?auto_962091 ) ( ON ?auto_962092 ?auto_962090 ) ( ON ?auto_962093 ?auto_962092 ) ( ON ?auto_962094 ?auto_962093 ) ( ON ?auto_962095 ?auto_962094 ) ( ON ?auto_962096 ?auto_962095 ) ( ON ?auto_962097 ?auto_962096 ) ( ON ?auto_962098 ?auto_962097 ) ( not ( = ?auto_962087 ?auto_962088 ) ) ( not ( = ?auto_962087 ?auto_962089 ) ) ( not ( = ?auto_962087 ?auto_962091 ) ) ( not ( = ?auto_962087 ?auto_962090 ) ) ( not ( = ?auto_962087 ?auto_962092 ) ) ( not ( = ?auto_962087 ?auto_962093 ) ) ( not ( = ?auto_962087 ?auto_962094 ) ) ( not ( = ?auto_962087 ?auto_962095 ) ) ( not ( = ?auto_962087 ?auto_962096 ) ) ( not ( = ?auto_962087 ?auto_962097 ) ) ( not ( = ?auto_962087 ?auto_962098 ) ) ( not ( = ?auto_962087 ?auto_962099 ) ) ( not ( = ?auto_962087 ?auto_962100 ) ) ( not ( = ?auto_962087 ?auto_962102 ) ) ( not ( = ?auto_962088 ?auto_962089 ) ) ( not ( = ?auto_962088 ?auto_962091 ) ) ( not ( = ?auto_962088 ?auto_962090 ) ) ( not ( = ?auto_962088 ?auto_962092 ) ) ( not ( = ?auto_962088 ?auto_962093 ) ) ( not ( = ?auto_962088 ?auto_962094 ) ) ( not ( = ?auto_962088 ?auto_962095 ) ) ( not ( = ?auto_962088 ?auto_962096 ) ) ( not ( = ?auto_962088 ?auto_962097 ) ) ( not ( = ?auto_962088 ?auto_962098 ) ) ( not ( = ?auto_962088 ?auto_962099 ) ) ( not ( = ?auto_962088 ?auto_962100 ) ) ( not ( = ?auto_962088 ?auto_962102 ) ) ( not ( = ?auto_962089 ?auto_962091 ) ) ( not ( = ?auto_962089 ?auto_962090 ) ) ( not ( = ?auto_962089 ?auto_962092 ) ) ( not ( = ?auto_962089 ?auto_962093 ) ) ( not ( = ?auto_962089 ?auto_962094 ) ) ( not ( = ?auto_962089 ?auto_962095 ) ) ( not ( = ?auto_962089 ?auto_962096 ) ) ( not ( = ?auto_962089 ?auto_962097 ) ) ( not ( = ?auto_962089 ?auto_962098 ) ) ( not ( = ?auto_962089 ?auto_962099 ) ) ( not ( = ?auto_962089 ?auto_962100 ) ) ( not ( = ?auto_962089 ?auto_962102 ) ) ( not ( = ?auto_962091 ?auto_962090 ) ) ( not ( = ?auto_962091 ?auto_962092 ) ) ( not ( = ?auto_962091 ?auto_962093 ) ) ( not ( = ?auto_962091 ?auto_962094 ) ) ( not ( = ?auto_962091 ?auto_962095 ) ) ( not ( = ?auto_962091 ?auto_962096 ) ) ( not ( = ?auto_962091 ?auto_962097 ) ) ( not ( = ?auto_962091 ?auto_962098 ) ) ( not ( = ?auto_962091 ?auto_962099 ) ) ( not ( = ?auto_962091 ?auto_962100 ) ) ( not ( = ?auto_962091 ?auto_962102 ) ) ( not ( = ?auto_962090 ?auto_962092 ) ) ( not ( = ?auto_962090 ?auto_962093 ) ) ( not ( = ?auto_962090 ?auto_962094 ) ) ( not ( = ?auto_962090 ?auto_962095 ) ) ( not ( = ?auto_962090 ?auto_962096 ) ) ( not ( = ?auto_962090 ?auto_962097 ) ) ( not ( = ?auto_962090 ?auto_962098 ) ) ( not ( = ?auto_962090 ?auto_962099 ) ) ( not ( = ?auto_962090 ?auto_962100 ) ) ( not ( = ?auto_962090 ?auto_962102 ) ) ( not ( = ?auto_962092 ?auto_962093 ) ) ( not ( = ?auto_962092 ?auto_962094 ) ) ( not ( = ?auto_962092 ?auto_962095 ) ) ( not ( = ?auto_962092 ?auto_962096 ) ) ( not ( = ?auto_962092 ?auto_962097 ) ) ( not ( = ?auto_962092 ?auto_962098 ) ) ( not ( = ?auto_962092 ?auto_962099 ) ) ( not ( = ?auto_962092 ?auto_962100 ) ) ( not ( = ?auto_962092 ?auto_962102 ) ) ( not ( = ?auto_962093 ?auto_962094 ) ) ( not ( = ?auto_962093 ?auto_962095 ) ) ( not ( = ?auto_962093 ?auto_962096 ) ) ( not ( = ?auto_962093 ?auto_962097 ) ) ( not ( = ?auto_962093 ?auto_962098 ) ) ( not ( = ?auto_962093 ?auto_962099 ) ) ( not ( = ?auto_962093 ?auto_962100 ) ) ( not ( = ?auto_962093 ?auto_962102 ) ) ( not ( = ?auto_962094 ?auto_962095 ) ) ( not ( = ?auto_962094 ?auto_962096 ) ) ( not ( = ?auto_962094 ?auto_962097 ) ) ( not ( = ?auto_962094 ?auto_962098 ) ) ( not ( = ?auto_962094 ?auto_962099 ) ) ( not ( = ?auto_962094 ?auto_962100 ) ) ( not ( = ?auto_962094 ?auto_962102 ) ) ( not ( = ?auto_962095 ?auto_962096 ) ) ( not ( = ?auto_962095 ?auto_962097 ) ) ( not ( = ?auto_962095 ?auto_962098 ) ) ( not ( = ?auto_962095 ?auto_962099 ) ) ( not ( = ?auto_962095 ?auto_962100 ) ) ( not ( = ?auto_962095 ?auto_962102 ) ) ( not ( = ?auto_962096 ?auto_962097 ) ) ( not ( = ?auto_962096 ?auto_962098 ) ) ( not ( = ?auto_962096 ?auto_962099 ) ) ( not ( = ?auto_962096 ?auto_962100 ) ) ( not ( = ?auto_962096 ?auto_962102 ) ) ( not ( = ?auto_962097 ?auto_962098 ) ) ( not ( = ?auto_962097 ?auto_962099 ) ) ( not ( = ?auto_962097 ?auto_962100 ) ) ( not ( = ?auto_962097 ?auto_962102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962098 ?auto_962099 ?auto_962100 )
      ( MAKE-13CRATE-VERIFY ?auto_962087 ?auto_962088 ?auto_962089 ?auto_962091 ?auto_962090 ?auto_962092 ?auto_962093 ?auto_962094 ?auto_962095 ?auto_962096 ?auto_962097 ?auto_962098 ?auto_962099 ?auto_962100 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962270 - SURFACE
      ?auto_962271 - SURFACE
      ?auto_962272 - SURFACE
      ?auto_962274 - SURFACE
      ?auto_962273 - SURFACE
      ?auto_962275 - SURFACE
      ?auto_962276 - SURFACE
      ?auto_962277 - SURFACE
      ?auto_962278 - SURFACE
      ?auto_962279 - SURFACE
      ?auto_962280 - SURFACE
      ?auto_962281 - SURFACE
      ?auto_962282 - SURFACE
      ?auto_962283 - SURFACE
    )
    :vars
    (
      ?auto_962286 - HOIST
      ?auto_962285 - PLACE
      ?auto_962287 - PLACE
      ?auto_962288 - HOIST
      ?auto_962289 - SURFACE
      ?auto_962284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962286 ?auto_962285 ) ( SURFACE-AT ?auto_962282 ?auto_962285 ) ( CLEAR ?auto_962282 ) ( IS-CRATE ?auto_962283 ) ( not ( = ?auto_962282 ?auto_962283 ) ) ( AVAILABLE ?auto_962286 ) ( ON ?auto_962282 ?auto_962281 ) ( not ( = ?auto_962281 ?auto_962282 ) ) ( not ( = ?auto_962281 ?auto_962283 ) ) ( not ( = ?auto_962287 ?auto_962285 ) ) ( HOIST-AT ?auto_962288 ?auto_962287 ) ( not ( = ?auto_962286 ?auto_962288 ) ) ( AVAILABLE ?auto_962288 ) ( SURFACE-AT ?auto_962283 ?auto_962287 ) ( ON ?auto_962283 ?auto_962289 ) ( CLEAR ?auto_962283 ) ( not ( = ?auto_962282 ?auto_962289 ) ) ( not ( = ?auto_962283 ?auto_962289 ) ) ( not ( = ?auto_962281 ?auto_962289 ) ) ( TRUCK-AT ?auto_962284 ?auto_962285 ) ( ON ?auto_962271 ?auto_962270 ) ( ON ?auto_962272 ?auto_962271 ) ( ON ?auto_962274 ?auto_962272 ) ( ON ?auto_962273 ?auto_962274 ) ( ON ?auto_962275 ?auto_962273 ) ( ON ?auto_962276 ?auto_962275 ) ( ON ?auto_962277 ?auto_962276 ) ( ON ?auto_962278 ?auto_962277 ) ( ON ?auto_962279 ?auto_962278 ) ( ON ?auto_962280 ?auto_962279 ) ( ON ?auto_962281 ?auto_962280 ) ( not ( = ?auto_962270 ?auto_962271 ) ) ( not ( = ?auto_962270 ?auto_962272 ) ) ( not ( = ?auto_962270 ?auto_962274 ) ) ( not ( = ?auto_962270 ?auto_962273 ) ) ( not ( = ?auto_962270 ?auto_962275 ) ) ( not ( = ?auto_962270 ?auto_962276 ) ) ( not ( = ?auto_962270 ?auto_962277 ) ) ( not ( = ?auto_962270 ?auto_962278 ) ) ( not ( = ?auto_962270 ?auto_962279 ) ) ( not ( = ?auto_962270 ?auto_962280 ) ) ( not ( = ?auto_962270 ?auto_962281 ) ) ( not ( = ?auto_962270 ?auto_962282 ) ) ( not ( = ?auto_962270 ?auto_962283 ) ) ( not ( = ?auto_962270 ?auto_962289 ) ) ( not ( = ?auto_962271 ?auto_962272 ) ) ( not ( = ?auto_962271 ?auto_962274 ) ) ( not ( = ?auto_962271 ?auto_962273 ) ) ( not ( = ?auto_962271 ?auto_962275 ) ) ( not ( = ?auto_962271 ?auto_962276 ) ) ( not ( = ?auto_962271 ?auto_962277 ) ) ( not ( = ?auto_962271 ?auto_962278 ) ) ( not ( = ?auto_962271 ?auto_962279 ) ) ( not ( = ?auto_962271 ?auto_962280 ) ) ( not ( = ?auto_962271 ?auto_962281 ) ) ( not ( = ?auto_962271 ?auto_962282 ) ) ( not ( = ?auto_962271 ?auto_962283 ) ) ( not ( = ?auto_962271 ?auto_962289 ) ) ( not ( = ?auto_962272 ?auto_962274 ) ) ( not ( = ?auto_962272 ?auto_962273 ) ) ( not ( = ?auto_962272 ?auto_962275 ) ) ( not ( = ?auto_962272 ?auto_962276 ) ) ( not ( = ?auto_962272 ?auto_962277 ) ) ( not ( = ?auto_962272 ?auto_962278 ) ) ( not ( = ?auto_962272 ?auto_962279 ) ) ( not ( = ?auto_962272 ?auto_962280 ) ) ( not ( = ?auto_962272 ?auto_962281 ) ) ( not ( = ?auto_962272 ?auto_962282 ) ) ( not ( = ?auto_962272 ?auto_962283 ) ) ( not ( = ?auto_962272 ?auto_962289 ) ) ( not ( = ?auto_962274 ?auto_962273 ) ) ( not ( = ?auto_962274 ?auto_962275 ) ) ( not ( = ?auto_962274 ?auto_962276 ) ) ( not ( = ?auto_962274 ?auto_962277 ) ) ( not ( = ?auto_962274 ?auto_962278 ) ) ( not ( = ?auto_962274 ?auto_962279 ) ) ( not ( = ?auto_962274 ?auto_962280 ) ) ( not ( = ?auto_962274 ?auto_962281 ) ) ( not ( = ?auto_962274 ?auto_962282 ) ) ( not ( = ?auto_962274 ?auto_962283 ) ) ( not ( = ?auto_962274 ?auto_962289 ) ) ( not ( = ?auto_962273 ?auto_962275 ) ) ( not ( = ?auto_962273 ?auto_962276 ) ) ( not ( = ?auto_962273 ?auto_962277 ) ) ( not ( = ?auto_962273 ?auto_962278 ) ) ( not ( = ?auto_962273 ?auto_962279 ) ) ( not ( = ?auto_962273 ?auto_962280 ) ) ( not ( = ?auto_962273 ?auto_962281 ) ) ( not ( = ?auto_962273 ?auto_962282 ) ) ( not ( = ?auto_962273 ?auto_962283 ) ) ( not ( = ?auto_962273 ?auto_962289 ) ) ( not ( = ?auto_962275 ?auto_962276 ) ) ( not ( = ?auto_962275 ?auto_962277 ) ) ( not ( = ?auto_962275 ?auto_962278 ) ) ( not ( = ?auto_962275 ?auto_962279 ) ) ( not ( = ?auto_962275 ?auto_962280 ) ) ( not ( = ?auto_962275 ?auto_962281 ) ) ( not ( = ?auto_962275 ?auto_962282 ) ) ( not ( = ?auto_962275 ?auto_962283 ) ) ( not ( = ?auto_962275 ?auto_962289 ) ) ( not ( = ?auto_962276 ?auto_962277 ) ) ( not ( = ?auto_962276 ?auto_962278 ) ) ( not ( = ?auto_962276 ?auto_962279 ) ) ( not ( = ?auto_962276 ?auto_962280 ) ) ( not ( = ?auto_962276 ?auto_962281 ) ) ( not ( = ?auto_962276 ?auto_962282 ) ) ( not ( = ?auto_962276 ?auto_962283 ) ) ( not ( = ?auto_962276 ?auto_962289 ) ) ( not ( = ?auto_962277 ?auto_962278 ) ) ( not ( = ?auto_962277 ?auto_962279 ) ) ( not ( = ?auto_962277 ?auto_962280 ) ) ( not ( = ?auto_962277 ?auto_962281 ) ) ( not ( = ?auto_962277 ?auto_962282 ) ) ( not ( = ?auto_962277 ?auto_962283 ) ) ( not ( = ?auto_962277 ?auto_962289 ) ) ( not ( = ?auto_962278 ?auto_962279 ) ) ( not ( = ?auto_962278 ?auto_962280 ) ) ( not ( = ?auto_962278 ?auto_962281 ) ) ( not ( = ?auto_962278 ?auto_962282 ) ) ( not ( = ?auto_962278 ?auto_962283 ) ) ( not ( = ?auto_962278 ?auto_962289 ) ) ( not ( = ?auto_962279 ?auto_962280 ) ) ( not ( = ?auto_962279 ?auto_962281 ) ) ( not ( = ?auto_962279 ?auto_962282 ) ) ( not ( = ?auto_962279 ?auto_962283 ) ) ( not ( = ?auto_962279 ?auto_962289 ) ) ( not ( = ?auto_962280 ?auto_962281 ) ) ( not ( = ?auto_962280 ?auto_962282 ) ) ( not ( = ?auto_962280 ?auto_962283 ) ) ( not ( = ?auto_962280 ?auto_962289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962281 ?auto_962282 ?auto_962283 )
      ( MAKE-13CRATE-VERIFY ?auto_962270 ?auto_962271 ?auto_962272 ?auto_962274 ?auto_962273 ?auto_962275 ?auto_962276 ?auto_962277 ?auto_962278 ?auto_962279 ?auto_962280 ?auto_962281 ?auto_962282 ?auto_962283 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962453 - SURFACE
      ?auto_962454 - SURFACE
      ?auto_962455 - SURFACE
      ?auto_962457 - SURFACE
      ?auto_962456 - SURFACE
      ?auto_962458 - SURFACE
      ?auto_962459 - SURFACE
      ?auto_962460 - SURFACE
      ?auto_962461 - SURFACE
      ?auto_962462 - SURFACE
      ?auto_962463 - SURFACE
      ?auto_962464 - SURFACE
      ?auto_962465 - SURFACE
      ?auto_962466 - SURFACE
    )
    :vars
    (
      ?auto_962472 - HOIST
      ?auto_962467 - PLACE
      ?auto_962470 - PLACE
      ?auto_962469 - HOIST
      ?auto_962471 - SURFACE
      ?auto_962468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962472 ?auto_962467 ) ( IS-CRATE ?auto_962466 ) ( not ( = ?auto_962465 ?auto_962466 ) ) ( not ( = ?auto_962464 ?auto_962465 ) ) ( not ( = ?auto_962464 ?auto_962466 ) ) ( not ( = ?auto_962470 ?auto_962467 ) ) ( HOIST-AT ?auto_962469 ?auto_962470 ) ( not ( = ?auto_962472 ?auto_962469 ) ) ( AVAILABLE ?auto_962469 ) ( SURFACE-AT ?auto_962466 ?auto_962470 ) ( ON ?auto_962466 ?auto_962471 ) ( CLEAR ?auto_962466 ) ( not ( = ?auto_962465 ?auto_962471 ) ) ( not ( = ?auto_962466 ?auto_962471 ) ) ( not ( = ?auto_962464 ?auto_962471 ) ) ( TRUCK-AT ?auto_962468 ?auto_962467 ) ( SURFACE-AT ?auto_962464 ?auto_962467 ) ( CLEAR ?auto_962464 ) ( LIFTING ?auto_962472 ?auto_962465 ) ( IS-CRATE ?auto_962465 ) ( ON ?auto_962454 ?auto_962453 ) ( ON ?auto_962455 ?auto_962454 ) ( ON ?auto_962457 ?auto_962455 ) ( ON ?auto_962456 ?auto_962457 ) ( ON ?auto_962458 ?auto_962456 ) ( ON ?auto_962459 ?auto_962458 ) ( ON ?auto_962460 ?auto_962459 ) ( ON ?auto_962461 ?auto_962460 ) ( ON ?auto_962462 ?auto_962461 ) ( ON ?auto_962463 ?auto_962462 ) ( ON ?auto_962464 ?auto_962463 ) ( not ( = ?auto_962453 ?auto_962454 ) ) ( not ( = ?auto_962453 ?auto_962455 ) ) ( not ( = ?auto_962453 ?auto_962457 ) ) ( not ( = ?auto_962453 ?auto_962456 ) ) ( not ( = ?auto_962453 ?auto_962458 ) ) ( not ( = ?auto_962453 ?auto_962459 ) ) ( not ( = ?auto_962453 ?auto_962460 ) ) ( not ( = ?auto_962453 ?auto_962461 ) ) ( not ( = ?auto_962453 ?auto_962462 ) ) ( not ( = ?auto_962453 ?auto_962463 ) ) ( not ( = ?auto_962453 ?auto_962464 ) ) ( not ( = ?auto_962453 ?auto_962465 ) ) ( not ( = ?auto_962453 ?auto_962466 ) ) ( not ( = ?auto_962453 ?auto_962471 ) ) ( not ( = ?auto_962454 ?auto_962455 ) ) ( not ( = ?auto_962454 ?auto_962457 ) ) ( not ( = ?auto_962454 ?auto_962456 ) ) ( not ( = ?auto_962454 ?auto_962458 ) ) ( not ( = ?auto_962454 ?auto_962459 ) ) ( not ( = ?auto_962454 ?auto_962460 ) ) ( not ( = ?auto_962454 ?auto_962461 ) ) ( not ( = ?auto_962454 ?auto_962462 ) ) ( not ( = ?auto_962454 ?auto_962463 ) ) ( not ( = ?auto_962454 ?auto_962464 ) ) ( not ( = ?auto_962454 ?auto_962465 ) ) ( not ( = ?auto_962454 ?auto_962466 ) ) ( not ( = ?auto_962454 ?auto_962471 ) ) ( not ( = ?auto_962455 ?auto_962457 ) ) ( not ( = ?auto_962455 ?auto_962456 ) ) ( not ( = ?auto_962455 ?auto_962458 ) ) ( not ( = ?auto_962455 ?auto_962459 ) ) ( not ( = ?auto_962455 ?auto_962460 ) ) ( not ( = ?auto_962455 ?auto_962461 ) ) ( not ( = ?auto_962455 ?auto_962462 ) ) ( not ( = ?auto_962455 ?auto_962463 ) ) ( not ( = ?auto_962455 ?auto_962464 ) ) ( not ( = ?auto_962455 ?auto_962465 ) ) ( not ( = ?auto_962455 ?auto_962466 ) ) ( not ( = ?auto_962455 ?auto_962471 ) ) ( not ( = ?auto_962457 ?auto_962456 ) ) ( not ( = ?auto_962457 ?auto_962458 ) ) ( not ( = ?auto_962457 ?auto_962459 ) ) ( not ( = ?auto_962457 ?auto_962460 ) ) ( not ( = ?auto_962457 ?auto_962461 ) ) ( not ( = ?auto_962457 ?auto_962462 ) ) ( not ( = ?auto_962457 ?auto_962463 ) ) ( not ( = ?auto_962457 ?auto_962464 ) ) ( not ( = ?auto_962457 ?auto_962465 ) ) ( not ( = ?auto_962457 ?auto_962466 ) ) ( not ( = ?auto_962457 ?auto_962471 ) ) ( not ( = ?auto_962456 ?auto_962458 ) ) ( not ( = ?auto_962456 ?auto_962459 ) ) ( not ( = ?auto_962456 ?auto_962460 ) ) ( not ( = ?auto_962456 ?auto_962461 ) ) ( not ( = ?auto_962456 ?auto_962462 ) ) ( not ( = ?auto_962456 ?auto_962463 ) ) ( not ( = ?auto_962456 ?auto_962464 ) ) ( not ( = ?auto_962456 ?auto_962465 ) ) ( not ( = ?auto_962456 ?auto_962466 ) ) ( not ( = ?auto_962456 ?auto_962471 ) ) ( not ( = ?auto_962458 ?auto_962459 ) ) ( not ( = ?auto_962458 ?auto_962460 ) ) ( not ( = ?auto_962458 ?auto_962461 ) ) ( not ( = ?auto_962458 ?auto_962462 ) ) ( not ( = ?auto_962458 ?auto_962463 ) ) ( not ( = ?auto_962458 ?auto_962464 ) ) ( not ( = ?auto_962458 ?auto_962465 ) ) ( not ( = ?auto_962458 ?auto_962466 ) ) ( not ( = ?auto_962458 ?auto_962471 ) ) ( not ( = ?auto_962459 ?auto_962460 ) ) ( not ( = ?auto_962459 ?auto_962461 ) ) ( not ( = ?auto_962459 ?auto_962462 ) ) ( not ( = ?auto_962459 ?auto_962463 ) ) ( not ( = ?auto_962459 ?auto_962464 ) ) ( not ( = ?auto_962459 ?auto_962465 ) ) ( not ( = ?auto_962459 ?auto_962466 ) ) ( not ( = ?auto_962459 ?auto_962471 ) ) ( not ( = ?auto_962460 ?auto_962461 ) ) ( not ( = ?auto_962460 ?auto_962462 ) ) ( not ( = ?auto_962460 ?auto_962463 ) ) ( not ( = ?auto_962460 ?auto_962464 ) ) ( not ( = ?auto_962460 ?auto_962465 ) ) ( not ( = ?auto_962460 ?auto_962466 ) ) ( not ( = ?auto_962460 ?auto_962471 ) ) ( not ( = ?auto_962461 ?auto_962462 ) ) ( not ( = ?auto_962461 ?auto_962463 ) ) ( not ( = ?auto_962461 ?auto_962464 ) ) ( not ( = ?auto_962461 ?auto_962465 ) ) ( not ( = ?auto_962461 ?auto_962466 ) ) ( not ( = ?auto_962461 ?auto_962471 ) ) ( not ( = ?auto_962462 ?auto_962463 ) ) ( not ( = ?auto_962462 ?auto_962464 ) ) ( not ( = ?auto_962462 ?auto_962465 ) ) ( not ( = ?auto_962462 ?auto_962466 ) ) ( not ( = ?auto_962462 ?auto_962471 ) ) ( not ( = ?auto_962463 ?auto_962464 ) ) ( not ( = ?auto_962463 ?auto_962465 ) ) ( not ( = ?auto_962463 ?auto_962466 ) ) ( not ( = ?auto_962463 ?auto_962471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962464 ?auto_962465 ?auto_962466 )
      ( MAKE-13CRATE-VERIFY ?auto_962453 ?auto_962454 ?auto_962455 ?auto_962457 ?auto_962456 ?auto_962458 ?auto_962459 ?auto_962460 ?auto_962461 ?auto_962462 ?auto_962463 ?auto_962464 ?auto_962465 ?auto_962466 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962636 - SURFACE
      ?auto_962637 - SURFACE
      ?auto_962638 - SURFACE
      ?auto_962640 - SURFACE
      ?auto_962639 - SURFACE
      ?auto_962641 - SURFACE
      ?auto_962642 - SURFACE
      ?auto_962643 - SURFACE
      ?auto_962644 - SURFACE
      ?auto_962645 - SURFACE
      ?auto_962646 - SURFACE
      ?auto_962647 - SURFACE
      ?auto_962648 - SURFACE
      ?auto_962649 - SURFACE
    )
    :vars
    (
      ?auto_962650 - HOIST
      ?auto_962655 - PLACE
      ?auto_962652 - PLACE
      ?auto_962654 - HOIST
      ?auto_962653 - SURFACE
      ?auto_962651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962650 ?auto_962655 ) ( IS-CRATE ?auto_962649 ) ( not ( = ?auto_962648 ?auto_962649 ) ) ( not ( = ?auto_962647 ?auto_962648 ) ) ( not ( = ?auto_962647 ?auto_962649 ) ) ( not ( = ?auto_962652 ?auto_962655 ) ) ( HOIST-AT ?auto_962654 ?auto_962652 ) ( not ( = ?auto_962650 ?auto_962654 ) ) ( AVAILABLE ?auto_962654 ) ( SURFACE-AT ?auto_962649 ?auto_962652 ) ( ON ?auto_962649 ?auto_962653 ) ( CLEAR ?auto_962649 ) ( not ( = ?auto_962648 ?auto_962653 ) ) ( not ( = ?auto_962649 ?auto_962653 ) ) ( not ( = ?auto_962647 ?auto_962653 ) ) ( TRUCK-AT ?auto_962651 ?auto_962655 ) ( SURFACE-AT ?auto_962647 ?auto_962655 ) ( CLEAR ?auto_962647 ) ( IS-CRATE ?auto_962648 ) ( AVAILABLE ?auto_962650 ) ( IN ?auto_962648 ?auto_962651 ) ( ON ?auto_962637 ?auto_962636 ) ( ON ?auto_962638 ?auto_962637 ) ( ON ?auto_962640 ?auto_962638 ) ( ON ?auto_962639 ?auto_962640 ) ( ON ?auto_962641 ?auto_962639 ) ( ON ?auto_962642 ?auto_962641 ) ( ON ?auto_962643 ?auto_962642 ) ( ON ?auto_962644 ?auto_962643 ) ( ON ?auto_962645 ?auto_962644 ) ( ON ?auto_962646 ?auto_962645 ) ( ON ?auto_962647 ?auto_962646 ) ( not ( = ?auto_962636 ?auto_962637 ) ) ( not ( = ?auto_962636 ?auto_962638 ) ) ( not ( = ?auto_962636 ?auto_962640 ) ) ( not ( = ?auto_962636 ?auto_962639 ) ) ( not ( = ?auto_962636 ?auto_962641 ) ) ( not ( = ?auto_962636 ?auto_962642 ) ) ( not ( = ?auto_962636 ?auto_962643 ) ) ( not ( = ?auto_962636 ?auto_962644 ) ) ( not ( = ?auto_962636 ?auto_962645 ) ) ( not ( = ?auto_962636 ?auto_962646 ) ) ( not ( = ?auto_962636 ?auto_962647 ) ) ( not ( = ?auto_962636 ?auto_962648 ) ) ( not ( = ?auto_962636 ?auto_962649 ) ) ( not ( = ?auto_962636 ?auto_962653 ) ) ( not ( = ?auto_962637 ?auto_962638 ) ) ( not ( = ?auto_962637 ?auto_962640 ) ) ( not ( = ?auto_962637 ?auto_962639 ) ) ( not ( = ?auto_962637 ?auto_962641 ) ) ( not ( = ?auto_962637 ?auto_962642 ) ) ( not ( = ?auto_962637 ?auto_962643 ) ) ( not ( = ?auto_962637 ?auto_962644 ) ) ( not ( = ?auto_962637 ?auto_962645 ) ) ( not ( = ?auto_962637 ?auto_962646 ) ) ( not ( = ?auto_962637 ?auto_962647 ) ) ( not ( = ?auto_962637 ?auto_962648 ) ) ( not ( = ?auto_962637 ?auto_962649 ) ) ( not ( = ?auto_962637 ?auto_962653 ) ) ( not ( = ?auto_962638 ?auto_962640 ) ) ( not ( = ?auto_962638 ?auto_962639 ) ) ( not ( = ?auto_962638 ?auto_962641 ) ) ( not ( = ?auto_962638 ?auto_962642 ) ) ( not ( = ?auto_962638 ?auto_962643 ) ) ( not ( = ?auto_962638 ?auto_962644 ) ) ( not ( = ?auto_962638 ?auto_962645 ) ) ( not ( = ?auto_962638 ?auto_962646 ) ) ( not ( = ?auto_962638 ?auto_962647 ) ) ( not ( = ?auto_962638 ?auto_962648 ) ) ( not ( = ?auto_962638 ?auto_962649 ) ) ( not ( = ?auto_962638 ?auto_962653 ) ) ( not ( = ?auto_962640 ?auto_962639 ) ) ( not ( = ?auto_962640 ?auto_962641 ) ) ( not ( = ?auto_962640 ?auto_962642 ) ) ( not ( = ?auto_962640 ?auto_962643 ) ) ( not ( = ?auto_962640 ?auto_962644 ) ) ( not ( = ?auto_962640 ?auto_962645 ) ) ( not ( = ?auto_962640 ?auto_962646 ) ) ( not ( = ?auto_962640 ?auto_962647 ) ) ( not ( = ?auto_962640 ?auto_962648 ) ) ( not ( = ?auto_962640 ?auto_962649 ) ) ( not ( = ?auto_962640 ?auto_962653 ) ) ( not ( = ?auto_962639 ?auto_962641 ) ) ( not ( = ?auto_962639 ?auto_962642 ) ) ( not ( = ?auto_962639 ?auto_962643 ) ) ( not ( = ?auto_962639 ?auto_962644 ) ) ( not ( = ?auto_962639 ?auto_962645 ) ) ( not ( = ?auto_962639 ?auto_962646 ) ) ( not ( = ?auto_962639 ?auto_962647 ) ) ( not ( = ?auto_962639 ?auto_962648 ) ) ( not ( = ?auto_962639 ?auto_962649 ) ) ( not ( = ?auto_962639 ?auto_962653 ) ) ( not ( = ?auto_962641 ?auto_962642 ) ) ( not ( = ?auto_962641 ?auto_962643 ) ) ( not ( = ?auto_962641 ?auto_962644 ) ) ( not ( = ?auto_962641 ?auto_962645 ) ) ( not ( = ?auto_962641 ?auto_962646 ) ) ( not ( = ?auto_962641 ?auto_962647 ) ) ( not ( = ?auto_962641 ?auto_962648 ) ) ( not ( = ?auto_962641 ?auto_962649 ) ) ( not ( = ?auto_962641 ?auto_962653 ) ) ( not ( = ?auto_962642 ?auto_962643 ) ) ( not ( = ?auto_962642 ?auto_962644 ) ) ( not ( = ?auto_962642 ?auto_962645 ) ) ( not ( = ?auto_962642 ?auto_962646 ) ) ( not ( = ?auto_962642 ?auto_962647 ) ) ( not ( = ?auto_962642 ?auto_962648 ) ) ( not ( = ?auto_962642 ?auto_962649 ) ) ( not ( = ?auto_962642 ?auto_962653 ) ) ( not ( = ?auto_962643 ?auto_962644 ) ) ( not ( = ?auto_962643 ?auto_962645 ) ) ( not ( = ?auto_962643 ?auto_962646 ) ) ( not ( = ?auto_962643 ?auto_962647 ) ) ( not ( = ?auto_962643 ?auto_962648 ) ) ( not ( = ?auto_962643 ?auto_962649 ) ) ( not ( = ?auto_962643 ?auto_962653 ) ) ( not ( = ?auto_962644 ?auto_962645 ) ) ( not ( = ?auto_962644 ?auto_962646 ) ) ( not ( = ?auto_962644 ?auto_962647 ) ) ( not ( = ?auto_962644 ?auto_962648 ) ) ( not ( = ?auto_962644 ?auto_962649 ) ) ( not ( = ?auto_962644 ?auto_962653 ) ) ( not ( = ?auto_962645 ?auto_962646 ) ) ( not ( = ?auto_962645 ?auto_962647 ) ) ( not ( = ?auto_962645 ?auto_962648 ) ) ( not ( = ?auto_962645 ?auto_962649 ) ) ( not ( = ?auto_962645 ?auto_962653 ) ) ( not ( = ?auto_962646 ?auto_962647 ) ) ( not ( = ?auto_962646 ?auto_962648 ) ) ( not ( = ?auto_962646 ?auto_962649 ) ) ( not ( = ?auto_962646 ?auto_962653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962647 ?auto_962648 ?auto_962649 )
      ( MAKE-13CRATE-VERIFY ?auto_962636 ?auto_962637 ?auto_962638 ?auto_962640 ?auto_962639 ?auto_962641 ?auto_962642 ?auto_962643 ?auto_962644 ?auto_962645 ?auto_962646 ?auto_962647 ?auto_962648 ?auto_962649 ) )
  )

)

