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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_588 - SURFACE
      ?auto_589 - SURFACE
    )
    :vars
    (
      ?auto_590 - HOIST
      ?auto_591 - PLACE
      ?auto_593 - PLACE
      ?auto_594 - HOIST
      ?auto_595 - SURFACE
      ?auto_592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_590 ?auto_591 ) ( SURFACE-AT ?auto_588 ?auto_591 ) ( CLEAR ?auto_588 ) ( IS-CRATE ?auto_589 ) ( AVAILABLE ?auto_590 ) ( not ( = ?auto_593 ?auto_591 ) ) ( HOIST-AT ?auto_594 ?auto_593 ) ( AVAILABLE ?auto_594 ) ( SURFACE-AT ?auto_589 ?auto_593 ) ( ON ?auto_589 ?auto_595 ) ( CLEAR ?auto_589 ) ( TRUCK-AT ?auto_592 ?auto_591 ) ( not ( = ?auto_588 ?auto_589 ) ) ( not ( = ?auto_588 ?auto_595 ) ) ( not ( = ?auto_589 ?auto_595 ) ) ( not ( = ?auto_590 ?auto_594 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592 ?auto_591 ?auto_593 )
      ( !LIFT ?auto_594 ?auto_589 ?auto_595 ?auto_593 )
      ( !LOAD ?auto_594 ?auto_589 ?auto_592 ?auto_593 )
      ( !DRIVE ?auto_592 ?auto_593 ?auto_591 )
      ( !UNLOAD ?auto_590 ?auto_589 ?auto_592 ?auto_591 )
      ( !DROP ?auto_590 ?auto_589 ?auto_588 ?auto_591 )
      ( MAKE-1CRATE-VERIFY ?auto_588 ?auto_589 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_609 - SURFACE
      ?auto_610 - SURFACE
      ?auto_611 - SURFACE
    )
    :vars
    (
      ?auto_612 - HOIST
      ?auto_617 - PLACE
      ?auto_615 - PLACE
      ?auto_613 - HOIST
      ?auto_614 - SURFACE
      ?auto_618 - PLACE
      ?auto_619 - HOIST
      ?auto_620 - SURFACE
      ?auto_616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612 ?auto_617 ) ( IS-CRATE ?auto_611 ) ( not ( = ?auto_615 ?auto_617 ) ) ( HOIST-AT ?auto_613 ?auto_615 ) ( AVAILABLE ?auto_613 ) ( SURFACE-AT ?auto_611 ?auto_615 ) ( ON ?auto_611 ?auto_614 ) ( CLEAR ?auto_611 ) ( not ( = ?auto_610 ?auto_611 ) ) ( not ( = ?auto_610 ?auto_614 ) ) ( not ( = ?auto_611 ?auto_614 ) ) ( not ( = ?auto_612 ?auto_613 ) ) ( SURFACE-AT ?auto_609 ?auto_617 ) ( CLEAR ?auto_609 ) ( IS-CRATE ?auto_610 ) ( AVAILABLE ?auto_612 ) ( not ( = ?auto_618 ?auto_617 ) ) ( HOIST-AT ?auto_619 ?auto_618 ) ( AVAILABLE ?auto_619 ) ( SURFACE-AT ?auto_610 ?auto_618 ) ( ON ?auto_610 ?auto_620 ) ( CLEAR ?auto_610 ) ( TRUCK-AT ?auto_616 ?auto_617 ) ( not ( = ?auto_609 ?auto_610 ) ) ( not ( = ?auto_609 ?auto_620 ) ) ( not ( = ?auto_610 ?auto_620 ) ) ( not ( = ?auto_612 ?auto_619 ) ) ( not ( = ?auto_609 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_614 ) ) ( not ( = ?auto_611 ?auto_620 ) ) ( not ( = ?auto_615 ?auto_618 ) ) ( not ( = ?auto_613 ?auto_619 ) ) ( not ( = ?auto_614 ?auto_620 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_609 ?auto_610 )
      ( MAKE-1CRATE ?auto_610 ?auto_611 )
      ( MAKE-2CRATE-VERIFY ?auto_609 ?auto_610 ?auto_611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_635 - SURFACE
      ?auto_636 - SURFACE
      ?auto_637 - SURFACE
      ?auto_638 - SURFACE
    )
    :vars
    (
      ?auto_639 - HOIST
      ?auto_642 - PLACE
      ?auto_643 - PLACE
      ?auto_644 - HOIST
      ?auto_640 - SURFACE
      ?auto_648 - SURFACE
      ?auto_645 - PLACE
      ?auto_646 - HOIST
      ?auto_647 - SURFACE
      ?auto_641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_639 ?auto_642 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_643 ?auto_642 ) ) ( HOIST-AT ?auto_644 ?auto_643 ) ( SURFACE-AT ?auto_638 ?auto_643 ) ( ON ?auto_638 ?auto_640 ) ( CLEAR ?auto_638 ) ( not ( = ?auto_637 ?auto_638 ) ) ( not ( = ?auto_637 ?auto_640 ) ) ( not ( = ?auto_638 ?auto_640 ) ) ( not ( = ?auto_639 ?auto_644 ) ) ( IS-CRATE ?auto_637 ) ( AVAILABLE ?auto_644 ) ( SURFACE-AT ?auto_637 ?auto_643 ) ( ON ?auto_637 ?auto_648 ) ( CLEAR ?auto_637 ) ( not ( = ?auto_636 ?auto_637 ) ) ( not ( = ?auto_636 ?auto_648 ) ) ( not ( = ?auto_637 ?auto_648 ) ) ( SURFACE-AT ?auto_635 ?auto_642 ) ( CLEAR ?auto_635 ) ( IS-CRATE ?auto_636 ) ( AVAILABLE ?auto_639 ) ( not ( = ?auto_645 ?auto_642 ) ) ( HOIST-AT ?auto_646 ?auto_645 ) ( AVAILABLE ?auto_646 ) ( SURFACE-AT ?auto_636 ?auto_645 ) ( ON ?auto_636 ?auto_647 ) ( CLEAR ?auto_636 ) ( TRUCK-AT ?auto_641 ?auto_642 ) ( not ( = ?auto_635 ?auto_636 ) ) ( not ( = ?auto_635 ?auto_647 ) ) ( not ( = ?auto_636 ?auto_647 ) ) ( not ( = ?auto_639 ?auto_646 ) ) ( not ( = ?auto_635 ?auto_637 ) ) ( not ( = ?auto_635 ?auto_648 ) ) ( not ( = ?auto_637 ?auto_647 ) ) ( not ( = ?auto_643 ?auto_645 ) ) ( not ( = ?auto_644 ?auto_646 ) ) ( not ( = ?auto_648 ?auto_647 ) ) ( not ( = ?auto_635 ?auto_638 ) ) ( not ( = ?auto_635 ?auto_640 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_636 ?auto_640 ) ) ( not ( = ?auto_638 ?auto_648 ) ) ( not ( = ?auto_638 ?auto_647 ) ) ( not ( = ?auto_640 ?auto_648 ) ) ( not ( = ?auto_640 ?auto_647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_635 ?auto_636 ?auto_637 )
      ( MAKE-1CRATE ?auto_637 ?auto_638 )
      ( MAKE-3CRATE-VERIFY ?auto_635 ?auto_636 ?auto_637 ?auto_638 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_664 - SURFACE
      ?auto_665 - SURFACE
      ?auto_666 - SURFACE
      ?auto_667 - SURFACE
      ?auto_668 - SURFACE
    )
    :vars
    (
      ?auto_673 - HOIST
      ?auto_669 - PLACE
      ?auto_670 - PLACE
      ?auto_672 - HOIST
      ?auto_671 - SURFACE
      ?auto_676 - PLACE
      ?auto_678 - HOIST
      ?auto_675 - SURFACE
      ?auto_679 - SURFACE
      ?auto_677 - PLACE
      ?auto_681 - HOIST
      ?auto_680 - SURFACE
      ?auto_674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_673 ?auto_669 ) ( IS-CRATE ?auto_668 ) ( not ( = ?auto_670 ?auto_669 ) ) ( HOIST-AT ?auto_672 ?auto_670 ) ( AVAILABLE ?auto_672 ) ( SURFACE-AT ?auto_668 ?auto_670 ) ( ON ?auto_668 ?auto_671 ) ( CLEAR ?auto_668 ) ( not ( = ?auto_667 ?auto_668 ) ) ( not ( = ?auto_667 ?auto_671 ) ) ( not ( = ?auto_668 ?auto_671 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( IS-CRATE ?auto_667 ) ( not ( = ?auto_676 ?auto_669 ) ) ( HOIST-AT ?auto_678 ?auto_676 ) ( SURFACE-AT ?auto_667 ?auto_676 ) ( ON ?auto_667 ?auto_675 ) ( CLEAR ?auto_667 ) ( not ( = ?auto_666 ?auto_667 ) ) ( not ( = ?auto_666 ?auto_675 ) ) ( not ( = ?auto_667 ?auto_675 ) ) ( not ( = ?auto_673 ?auto_678 ) ) ( IS-CRATE ?auto_666 ) ( AVAILABLE ?auto_678 ) ( SURFACE-AT ?auto_666 ?auto_676 ) ( ON ?auto_666 ?auto_679 ) ( CLEAR ?auto_666 ) ( not ( = ?auto_665 ?auto_666 ) ) ( not ( = ?auto_665 ?auto_679 ) ) ( not ( = ?auto_666 ?auto_679 ) ) ( SURFACE-AT ?auto_664 ?auto_669 ) ( CLEAR ?auto_664 ) ( IS-CRATE ?auto_665 ) ( AVAILABLE ?auto_673 ) ( not ( = ?auto_677 ?auto_669 ) ) ( HOIST-AT ?auto_681 ?auto_677 ) ( AVAILABLE ?auto_681 ) ( SURFACE-AT ?auto_665 ?auto_677 ) ( ON ?auto_665 ?auto_680 ) ( CLEAR ?auto_665 ) ( TRUCK-AT ?auto_674 ?auto_669 ) ( not ( = ?auto_664 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_680 ) ) ( not ( = ?auto_665 ?auto_680 ) ) ( not ( = ?auto_673 ?auto_681 ) ) ( not ( = ?auto_664 ?auto_666 ) ) ( not ( = ?auto_664 ?auto_679 ) ) ( not ( = ?auto_666 ?auto_680 ) ) ( not ( = ?auto_676 ?auto_677 ) ) ( not ( = ?auto_678 ?auto_681 ) ) ( not ( = ?auto_679 ?auto_680 ) ) ( not ( = ?auto_664 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_675 ) ) ( not ( = ?auto_665 ?auto_667 ) ) ( not ( = ?auto_665 ?auto_675 ) ) ( not ( = ?auto_667 ?auto_679 ) ) ( not ( = ?auto_667 ?auto_680 ) ) ( not ( = ?auto_675 ?auto_679 ) ) ( not ( = ?auto_675 ?auto_680 ) ) ( not ( = ?auto_664 ?auto_668 ) ) ( not ( = ?auto_664 ?auto_671 ) ) ( not ( = ?auto_665 ?auto_668 ) ) ( not ( = ?auto_665 ?auto_671 ) ) ( not ( = ?auto_666 ?auto_668 ) ) ( not ( = ?auto_666 ?auto_671 ) ) ( not ( = ?auto_668 ?auto_675 ) ) ( not ( = ?auto_668 ?auto_679 ) ) ( not ( = ?auto_668 ?auto_680 ) ) ( not ( = ?auto_670 ?auto_676 ) ) ( not ( = ?auto_670 ?auto_677 ) ) ( not ( = ?auto_672 ?auto_678 ) ) ( not ( = ?auto_672 ?auto_681 ) ) ( not ( = ?auto_671 ?auto_675 ) ) ( not ( = ?auto_671 ?auto_679 ) ) ( not ( = ?auto_671 ?auto_680 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_664 ?auto_665 ?auto_666 ?auto_667 )
      ( MAKE-1CRATE ?auto_667 ?auto_668 )
      ( MAKE-4CRATE-VERIFY ?auto_664 ?auto_665 ?auto_666 ?auto_667 ?auto_668 ) )
  )

)

