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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_598 - SURFACE
      ?auto_599 - SURFACE
    )
    :vars
    (
      ?auto_600 - HOIST
      ?auto_601 - PLACE
      ?auto_603 - PLACE
      ?auto_604 - HOIST
      ?auto_605 - SURFACE
      ?auto_602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_600 ?auto_601 ) ( SURFACE-AT ?auto_598 ?auto_601 ) ( CLEAR ?auto_598 ) ( IS-CRATE ?auto_599 ) ( AVAILABLE ?auto_600 ) ( not ( = ?auto_603 ?auto_601 ) ) ( HOIST-AT ?auto_604 ?auto_603 ) ( AVAILABLE ?auto_604 ) ( SURFACE-AT ?auto_599 ?auto_603 ) ( ON ?auto_599 ?auto_605 ) ( CLEAR ?auto_599 ) ( TRUCK-AT ?auto_602 ?auto_601 ) ( not ( = ?auto_598 ?auto_599 ) ) ( not ( = ?auto_598 ?auto_605 ) ) ( not ( = ?auto_599 ?auto_605 ) ) ( not ( = ?auto_600 ?auto_604 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_602 ?auto_601 ?auto_603 )
      ( !LIFT ?auto_604 ?auto_599 ?auto_605 ?auto_603 )
      ( !LOAD ?auto_604 ?auto_599 ?auto_602 ?auto_603 )
      ( !DRIVE ?auto_602 ?auto_603 ?auto_601 )
      ( !UNLOAD ?auto_600 ?auto_599 ?auto_602 ?auto_601 )
      ( !DROP ?auto_600 ?auto_599 ?auto_598 ?auto_601 )
      ( MAKE-1CRATE-VERIFY ?auto_598 ?auto_599 ) )
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
      ?auto_616 - PLACE
      ?auto_617 - PLACE
      ?auto_614 - HOIST
      ?auto_613 - SURFACE
      ?auto_620 - PLACE
      ?auto_618 - HOIST
      ?auto_619 - SURFACE
      ?auto_615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612 ?auto_616 ) ( IS-CRATE ?auto_611 ) ( not ( = ?auto_617 ?auto_616 ) ) ( HOIST-AT ?auto_614 ?auto_617 ) ( AVAILABLE ?auto_614 ) ( SURFACE-AT ?auto_611 ?auto_617 ) ( ON ?auto_611 ?auto_613 ) ( CLEAR ?auto_611 ) ( not ( = ?auto_610 ?auto_611 ) ) ( not ( = ?auto_610 ?auto_613 ) ) ( not ( = ?auto_611 ?auto_613 ) ) ( not ( = ?auto_612 ?auto_614 ) ) ( SURFACE-AT ?auto_609 ?auto_616 ) ( CLEAR ?auto_609 ) ( IS-CRATE ?auto_610 ) ( AVAILABLE ?auto_612 ) ( not ( = ?auto_620 ?auto_616 ) ) ( HOIST-AT ?auto_618 ?auto_620 ) ( AVAILABLE ?auto_618 ) ( SURFACE-AT ?auto_610 ?auto_620 ) ( ON ?auto_610 ?auto_619 ) ( CLEAR ?auto_610 ) ( TRUCK-AT ?auto_615 ?auto_616 ) ( not ( = ?auto_609 ?auto_610 ) ) ( not ( = ?auto_609 ?auto_619 ) ) ( not ( = ?auto_610 ?auto_619 ) ) ( not ( = ?auto_612 ?auto_618 ) ) ( not ( = ?auto_609 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_613 ) ) ( not ( = ?auto_611 ?auto_619 ) ) ( not ( = ?auto_617 ?auto_620 ) ) ( not ( = ?auto_614 ?auto_618 ) ) ( not ( = ?auto_613 ?auto_619 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_609 ?auto_610 )
      ( MAKE-1CRATE ?auto_610 ?auto_611 )
      ( MAKE-2CRATE-VERIFY ?auto_609 ?auto_610 ?auto_611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_623 - SURFACE
      ?auto_624 - SURFACE
    )
    :vars
    (
      ?auto_625 - HOIST
      ?auto_626 - PLACE
      ?auto_628 - PLACE
      ?auto_629 - HOIST
      ?auto_630 - SURFACE
      ?auto_627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_625 ?auto_626 ) ( SURFACE-AT ?auto_623 ?auto_626 ) ( CLEAR ?auto_623 ) ( IS-CRATE ?auto_624 ) ( AVAILABLE ?auto_625 ) ( not ( = ?auto_628 ?auto_626 ) ) ( HOIST-AT ?auto_629 ?auto_628 ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_624 ?auto_628 ) ( ON ?auto_624 ?auto_630 ) ( CLEAR ?auto_624 ) ( TRUCK-AT ?auto_627 ?auto_626 ) ( not ( = ?auto_623 ?auto_624 ) ) ( not ( = ?auto_623 ?auto_630 ) ) ( not ( = ?auto_624 ?auto_630 ) ) ( not ( = ?auto_625 ?auto_629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_627 ?auto_626 ?auto_628 )
      ( !LIFT ?auto_629 ?auto_624 ?auto_630 ?auto_628 )
      ( !LOAD ?auto_629 ?auto_624 ?auto_627 ?auto_628 )
      ( !DRIVE ?auto_627 ?auto_628 ?auto_626 )
      ( !UNLOAD ?auto_625 ?auto_624 ?auto_627 ?auto_626 )
      ( !DROP ?auto_625 ?auto_624 ?auto_623 ?auto_626 )
      ( MAKE-1CRATE-VERIFY ?auto_623 ?auto_624 ) )
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
      ?auto_640 - HOIST
      ?auto_643 - PLACE
      ?auto_642 - PLACE
      ?auto_639 - HOIST
      ?auto_641 - SURFACE
      ?auto_648 - SURFACE
      ?auto_647 - PLACE
      ?auto_646 - HOIST
      ?auto_645 - SURFACE
      ?auto_644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_640 ?auto_643 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_642 ?auto_643 ) ) ( HOIST-AT ?auto_639 ?auto_642 ) ( SURFACE-AT ?auto_638 ?auto_642 ) ( ON ?auto_638 ?auto_641 ) ( CLEAR ?auto_638 ) ( not ( = ?auto_637 ?auto_638 ) ) ( not ( = ?auto_637 ?auto_641 ) ) ( not ( = ?auto_638 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_639 ) ) ( IS-CRATE ?auto_637 ) ( AVAILABLE ?auto_639 ) ( SURFACE-AT ?auto_637 ?auto_642 ) ( ON ?auto_637 ?auto_648 ) ( CLEAR ?auto_637 ) ( not ( = ?auto_636 ?auto_637 ) ) ( not ( = ?auto_636 ?auto_648 ) ) ( not ( = ?auto_637 ?auto_648 ) ) ( SURFACE-AT ?auto_635 ?auto_643 ) ( CLEAR ?auto_635 ) ( IS-CRATE ?auto_636 ) ( AVAILABLE ?auto_640 ) ( not ( = ?auto_647 ?auto_643 ) ) ( HOIST-AT ?auto_646 ?auto_647 ) ( AVAILABLE ?auto_646 ) ( SURFACE-AT ?auto_636 ?auto_647 ) ( ON ?auto_636 ?auto_645 ) ( CLEAR ?auto_636 ) ( TRUCK-AT ?auto_644 ?auto_643 ) ( not ( = ?auto_635 ?auto_636 ) ) ( not ( = ?auto_635 ?auto_645 ) ) ( not ( = ?auto_636 ?auto_645 ) ) ( not ( = ?auto_640 ?auto_646 ) ) ( not ( = ?auto_635 ?auto_637 ) ) ( not ( = ?auto_635 ?auto_648 ) ) ( not ( = ?auto_637 ?auto_645 ) ) ( not ( = ?auto_642 ?auto_647 ) ) ( not ( = ?auto_639 ?auto_646 ) ) ( not ( = ?auto_648 ?auto_645 ) ) ( not ( = ?auto_635 ?auto_638 ) ) ( not ( = ?auto_635 ?auto_641 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_636 ?auto_641 ) ) ( not ( = ?auto_638 ?auto_648 ) ) ( not ( = ?auto_638 ?auto_645 ) ) ( not ( = ?auto_641 ?auto_648 ) ) ( not ( = ?auto_641 ?auto_645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_635 ?auto_636 ?auto_637 )
      ( MAKE-1CRATE ?auto_637 ?auto_638 )
      ( MAKE-3CRATE-VERIFY ?auto_635 ?auto_636 ?auto_637 ?auto_638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_651 - SURFACE
      ?auto_652 - SURFACE
    )
    :vars
    (
      ?auto_653 - HOIST
      ?auto_654 - PLACE
      ?auto_656 - PLACE
      ?auto_657 - HOIST
      ?auto_658 - SURFACE
      ?auto_655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_653 ?auto_654 ) ( SURFACE-AT ?auto_651 ?auto_654 ) ( CLEAR ?auto_651 ) ( IS-CRATE ?auto_652 ) ( AVAILABLE ?auto_653 ) ( not ( = ?auto_656 ?auto_654 ) ) ( HOIST-AT ?auto_657 ?auto_656 ) ( AVAILABLE ?auto_657 ) ( SURFACE-AT ?auto_652 ?auto_656 ) ( ON ?auto_652 ?auto_658 ) ( CLEAR ?auto_652 ) ( TRUCK-AT ?auto_655 ?auto_654 ) ( not ( = ?auto_651 ?auto_652 ) ) ( not ( = ?auto_651 ?auto_658 ) ) ( not ( = ?auto_652 ?auto_658 ) ) ( not ( = ?auto_653 ?auto_657 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_655 ?auto_654 ?auto_656 )
      ( !LIFT ?auto_657 ?auto_652 ?auto_658 ?auto_656 )
      ( !LOAD ?auto_657 ?auto_652 ?auto_655 ?auto_656 )
      ( !DRIVE ?auto_655 ?auto_656 ?auto_654 )
      ( !UNLOAD ?auto_653 ?auto_652 ?auto_655 ?auto_654 )
      ( !DROP ?auto_653 ?auto_652 ?auto_651 ?auto_654 )
      ( MAKE-1CRATE-VERIFY ?auto_651 ?auto_652 ) )
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
      ?auto_674 - HOIST
      ?auto_669 - PLACE
      ?auto_673 - PLACE
      ?auto_672 - HOIST
      ?auto_671 - SURFACE
      ?auto_677 - PLACE
      ?auto_679 - HOIST
      ?auto_678 - SURFACE
      ?auto_676 - SURFACE
      ?auto_675 - PLACE
      ?auto_680 - HOIST
      ?auto_681 - SURFACE
      ?auto_670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_674 ?auto_669 ) ( IS-CRATE ?auto_668 ) ( not ( = ?auto_673 ?auto_669 ) ) ( HOIST-AT ?auto_672 ?auto_673 ) ( AVAILABLE ?auto_672 ) ( SURFACE-AT ?auto_668 ?auto_673 ) ( ON ?auto_668 ?auto_671 ) ( CLEAR ?auto_668 ) ( not ( = ?auto_667 ?auto_668 ) ) ( not ( = ?auto_667 ?auto_671 ) ) ( not ( = ?auto_668 ?auto_671 ) ) ( not ( = ?auto_674 ?auto_672 ) ) ( IS-CRATE ?auto_667 ) ( not ( = ?auto_677 ?auto_669 ) ) ( HOIST-AT ?auto_679 ?auto_677 ) ( SURFACE-AT ?auto_667 ?auto_677 ) ( ON ?auto_667 ?auto_678 ) ( CLEAR ?auto_667 ) ( not ( = ?auto_666 ?auto_667 ) ) ( not ( = ?auto_666 ?auto_678 ) ) ( not ( = ?auto_667 ?auto_678 ) ) ( not ( = ?auto_674 ?auto_679 ) ) ( IS-CRATE ?auto_666 ) ( AVAILABLE ?auto_679 ) ( SURFACE-AT ?auto_666 ?auto_677 ) ( ON ?auto_666 ?auto_676 ) ( CLEAR ?auto_666 ) ( not ( = ?auto_665 ?auto_666 ) ) ( not ( = ?auto_665 ?auto_676 ) ) ( not ( = ?auto_666 ?auto_676 ) ) ( SURFACE-AT ?auto_664 ?auto_669 ) ( CLEAR ?auto_664 ) ( IS-CRATE ?auto_665 ) ( AVAILABLE ?auto_674 ) ( not ( = ?auto_675 ?auto_669 ) ) ( HOIST-AT ?auto_680 ?auto_675 ) ( AVAILABLE ?auto_680 ) ( SURFACE-AT ?auto_665 ?auto_675 ) ( ON ?auto_665 ?auto_681 ) ( CLEAR ?auto_665 ) ( TRUCK-AT ?auto_670 ?auto_669 ) ( not ( = ?auto_664 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_681 ) ) ( not ( = ?auto_665 ?auto_681 ) ) ( not ( = ?auto_674 ?auto_680 ) ) ( not ( = ?auto_664 ?auto_666 ) ) ( not ( = ?auto_664 ?auto_676 ) ) ( not ( = ?auto_666 ?auto_681 ) ) ( not ( = ?auto_677 ?auto_675 ) ) ( not ( = ?auto_679 ?auto_680 ) ) ( not ( = ?auto_676 ?auto_681 ) ) ( not ( = ?auto_664 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_678 ) ) ( not ( = ?auto_665 ?auto_667 ) ) ( not ( = ?auto_665 ?auto_678 ) ) ( not ( = ?auto_667 ?auto_676 ) ) ( not ( = ?auto_667 ?auto_681 ) ) ( not ( = ?auto_678 ?auto_676 ) ) ( not ( = ?auto_678 ?auto_681 ) ) ( not ( = ?auto_664 ?auto_668 ) ) ( not ( = ?auto_664 ?auto_671 ) ) ( not ( = ?auto_665 ?auto_668 ) ) ( not ( = ?auto_665 ?auto_671 ) ) ( not ( = ?auto_666 ?auto_668 ) ) ( not ( = ?auto_666 ?auto_671 ) ) ( not ( = ?auto_668 ?auto_678 ) ) ( not ( = ?auto_668 ?auto_676 ) ) ( not ( = ?auto_668 ?auto_681 ) ) ( not ( = ?auto_673 ?auto_677 ) ) ( not ( = ?auto_673 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_679 ) ) ( not ( = ?auto_672 ?auto_680 ) ) ( not ( = ?auto_671 ?auto_678 ) ) ( not ( = ?auto_671 ?auto_676 ) ) ( not ( = ?auto_671 ?auto_681 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_664 ?auto_665 ?auto_666 ?auto_667 )
      ( MAKE-1CRATE ?auto_667 ?auto_668 )
      ( MAKE-4CRATE-VERIFY ?auto_664 ?auto_665 ?auto_666 ?auto_667 ?auto_668 ) )
  )

)

