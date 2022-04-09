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
      ?auto_580 - SURFACE
      ?auto_581 - SURFACE
    )
    :vars
    (
      ?auto_582 - HOIST
      ?auto_583 - PLACE
      ?auto_585 - PLACE
      ?auto_586 - HOIST
      ?auto_587 - SURFACE
      ?auto_584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_582 ?auto_583 ) ( SURFACE-AT ?auto_580 ?auto_583 ) ( CLEAR ?auto_580 ) ( IS-CRATE ?auto_581 ) ( AVAILABLE ?auto_582 ) ( not ( = ?auto_585 ?auto_583 ) ) ( HOIST-AT ?auto_586 ?auto_585 ) ( AVAILABLE ?auto_586 ) ( SURFACE-AT ?auto_581 ?auto_585 ) ( ON ?auto_581 ?auto_587 ) ( CLEAR ?auto_581 ) ( TRUCK-AT ?auto_584 ?auto_583 ) ( not ( = ?auto_580 ?auto_581 ) ) ( not ( = ?auto_580 ?auto_587 ) ) ( not ( = ?auto_581 ?auto_587 ) ) ( not ( = ?auto_582 ?auto_586 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_584 ?auto_583 ?auto_585 )
      ( !LIFT ?auto_586 ?auto_581 ?auto_587 ?auto_585 )
      ( !LOAD ?auto_586 ?auto_581 ?auto_584 ?auto_585 )
      ( !DRIVE ?auto_584 ?auto_585 ?auto_583 )
      ( !UNLOAD ?auto_582 ?auto_581 ?auto_584 ?auto_583 )
      ( !DROP ?auto_582 ?auto_581 ?auto_580 ?auto_583 )
      ( MAKE-1CRATE-VERIFY ?auto_580 ?auto_581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_590 - SURFACE
      ?auto_591 - SURFACE
    )
    :vars
    (
      ?auto_592 - HOIST
      ?auto_593 - PLACE
      ?auto_595 - PLACE
      ?auto_596 - HOIST
      ?auto_597 - SURFACE
      ?auto_594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592 ?auto_593 ) ( SURFACE-AT ?auto_590 ?auto_593 ) ( CLEAR ?auto_590 ) ( IS-CRATE ?auto_591 ) ( AVAILABLE ?auto_592 ) ( not ( = ?auto_595 ?auto_593 ) ) ( HOIST-AT ?auto_596 ?auto_595 ) ( AVAILABLE ?auto_596 ) ( SURFACE-AT ?auto_591 ?auto_595 ) ( ON ?auto_591 ?auto_597 ) ( CLEAR ?auto_591 ) ( TRUCK-AT ?auto_594 ?auto_593 ) ( not ( = ?auto_590 ?auto_591 ) ) ( not ( = ?auto_590 ?auto_597 ) ) ( not ( = ?auto_591 ?auto_597 ) ) ( not ( = ?auto_592 ?auto_596 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_594 ?auto_593 ?auto_595 )
      ( !LIFT ?auto_596 ?auto_591 ?auto_597 ?auto_595 )
      ( !LOAD ?auto_596 ?auto_591 ?auto_594 ?auto_595 )
      ( !DRIVE ?auto_594 ?auto_595 ?auto_593 )
      ( !UNLOAD ?auto_592 ?auto_591 ?auto_594 ?auto_593 )
      ( !DROP ?auto_592 ?auto_591 ?auto_590 ?auto_593 )
      ( MAKE-1CRATE-VERIFY ?auto_590 ?auto_591 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_601 - SURFACE
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_606 - HOIST
      ?auto_604 - PLACE
      ?auto_607 - PLACE
      ?auto_605 - HOIST
      ?auto_609 - SURFACE
      ?auto_612 - PLACE
      ?auto_611 - HOIST
      ?auto_610 - SURFACE
      ?auto_608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606 ?auto_604 ) ( IS-CRATE ?auto_603 ) ( not ( = ?auto_607 ?auto_604 ) ) ( HOIST-AT ?auto_605 ?auto_607 ) ( AVAILABLE ?auto_605 ) ( SURFACE-AT ?auto_603 ?auto_607 ) ( ON ?auto_603 ?auto_609 ) ( CLEAR ?auto_603 ) ( not ( = ?auto_602 ?auto_603 ) ) ( not ( = ?auto_602 ?auto_609 ) ) ( not ( = ?auto_603 ?auto_609 ) ) ( not ( = ?auto_606 ?auto_605 ) ) ( SURFACE-AT ?auto_601 ?auto_604 ) ( CLEAR ?auto_601 ) ( IS-CRATE ?auto_602 ) ( AVAILABLE ?auto_606 ) ( not ( = ?auto_612 ?auto_604 ) ) ( HOIST-AT ?auto_611 ?auto_612 ) ( AVAILABLE ?auto_611 ) ( SURFACE-AT ?auto_602 ?auto_612 ) ( ON ?auto_602 ?auto_610 ) ( CLEAR ?auto_602 ) ( TRUCK-AT ?auto_608 ?auto_604 ) ( not ( = ?auto_601 ?auto_602 ) ) ( not ( = ?auto_601 ?auto_610 ) ) ( not ( = ?auto_602 ?auto_610 ) ) ( not ( = ?auto_606 ?auto_611 ) ) ( not ( = ?auto_601 ?auto_603 ) ) ( not ( = ?auto_601 ?auto_609 ) ) ( not ( = ?auto_603 ?auto_610 ) ) ( not ( = ?auto_607 ?auto_612 ) ) ( not ( = ?auto_605 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_601 ?auto_602 )
      ( MAKE-1CRATE ?auto_602 ?auto_603 )
      ( MAKE-2CRATE-VERIFY ?auto_601 ?auto_602 ?auto_603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_615 - SURFACE
      ?auto_616 - SURFACE
    )
    :vars
    (
      ?auto_617 - HOIST
      ?auto_618 - PLACE
      ?auto_620 - PLACE
      ?auto_621 - HOIST
      ?auto_622 - SURFACE
      ?auto_619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_617 ?auto_618 ) ( SURFACE-AT ?auto_615 ?auto_618 ) ( CLEAR ?auto_615 ) ( IS-CRATE ?auto_616 ) ( AVAILABLE ?auto_617 ) ( not ( = ?auto_620 ?auto_618 ) ) ( HOIST-AT ?auto_621 ?auto_620 ) ( AVAILABLE ?auto_621 ) ( SURFACE-AT ?auto_616 ?auto_620 ) ( ON ?auto_616 ?auto_622 ) ( CLEAR ?auto_616 ) ( TRUCK-AT ?auto_619 ?auto_618 ) ( not ( = ?auto_615 ?auto_616 ) ) ( not ( = ?auto_615 ?auto_622 ) ) ( not ( = ?auto_616 ?auto_622 ) ) ( not ( = ?auto_617 ?auto_621 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_619 ?auto_618 ?auto_620 )
      ( !LIFT ?auto_621 ?auto_616 ?auto_622 ?auto_620 )
      ( !LOAD ?auto_621 ?auto_616 ?auto_619 ?auto_620 )
      ( !DRIVE ?auto_619 ?auto_620 ?auto_618 )
      ( !UNLOAD ?auto_617 ?auto_616 ?auto_619 ?auto_618 )
      ( !DROP ?auto_617 ?auto_616 ?auto_615 ?auto_618 )
      ( MAKE-1CRATE-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_627 - SURFACE
      ?auto_628 - SURFACE
      ?auto_629 - SURFACE
      ?auto_630 - SURFACE
    )
    :vars
    (
      ?auto_633 - HOIST
      ?auto_636 - PLACE
      ?auto_632 - PLACE
      ?auto_635 - HOIST
      ?auto_634 - SURFACE
      ?auto_637 - SURFACE
      ?auto_640 - PLACE
      ?auto_639 - HOIST
      ?auto_638 - SURFACE
      ?auto_631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_633 ?auto_636 ) ( IS-CRATE ?auto_630 ) ( not ( = ?auto_632 ?auto_636 ) ) ( HOIST-AT ?auto_635 ?auto_632 ) ( SURFACE-AT ?auto_630 ?auto_632 ) ( ON ?auto_630 ?auto_634 ) ( CLEAR ?auto_630 ) ( not ( = ?auto_629 ?auto_630 ) ) ( not ( = ?auto_629 ?auto_634 ) ) ( not ( = ?auto_630 ?auto_634 ) ) ( not ( = ?auto_633 ?auto_635 ) ) ( IS-CRATE ?auto_629 ) ( AVAILABLE ?auto_635 ) ( SURFACE-AT ?auto_629 ?auto_632 ) ( ON ?auto_629 ?auto_637 ) ( CLEAR ?auto_629 ) ( not ( = ?auto_628 ?auto_629 ) ) ( not ( = ?auto_628 ?auto_637 ) ) ( not ( = ?auto_629 ?auto_637 ) ) ( SURFACE-AT ?auto_627 ?auto_636 ) ( CLEAR ?auto_627 ) ( IS-CRATE ?auto_628 ) ( AVAILABLE ?auto_633 ) ( not ( = ?auto_640 ?auto_636 ) ) ( HOIST-AT ?auto_639 ?auto_640 ) ( AVAILABLE ?auto_639 ) ( SURFACE-AT ?auto_628 ?auto_640 ) ( ON ?auto_628 ?auto_638 ) ( CLEAR ?auto_628 ) ( TRUCK-AT ?auto_631 ?auto_636 ) ( not ( = ?auto_627 ?auto_628 ) ) ( not ( = ?auto_627 ?auto_638 ) ) ( not ( = ?auto_628 ?auto_638 ) ) ( not ( = ?auto_633 ?auto_639 ) ) ( not ( = ?auto_627 ?auto_629 ) ) ( not ( = ?auto_627 ?auto_637 ) ) ( not ( = ?auto_629 ?auto_638 ) ) ( not ( = ?auto_632 ?auto_640 ) ) ( not ( = ?auto_635 ?auto_639 ) ) ( not ( = ?auto_637 ?auto_638 ) ) ( not ( = ?auto_627 ?auto_630 ) ) ( not ( = ?auto_627 ?auto_634 ) ) ( not ( = ?auto_628 ?auto_630 ) ) ( not ( = ?auto_628 ?auto_634 ) ) ( not ( = ?auto_630 ?auto_637 ) ) ( not ( = ?auto_630 ?auto_638 ) ) ( not ( = ?auto_634 ?auto_637 ) ) ( not ( = ?auto_634 ?auto_638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_627 ?auto_628 ?auto_629 )
      ( MAKE-1CRATE ?auto_629 ?auto_630 )
      ( MAKE-3CRATE-VERIFY ?auto_627 ?auto_628 ?auto_629 ?auto_630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643 - SURFACE
      ?auto_644 - SURFACE
    )
    :vars
    (
      ?auto_645 - HOIST
      ?auto_646 - PLACE
      ?auto_648 - PLACE
      ?auto_649 - HOIST
      ?auto_650 - SURFACE
      ?auto_647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645 ?auto_646 ) ( SURFACE-AT ?auto_643 ?auto_646 ) ( CLEAR ?auto_643 ) ( IS-CRATE ?auto_644 ) ( AVAILABLE ?auto_645 ) ( not ( = ?auto_648 ?auto_646 ) ) ( HOIST-AT ?auto_649 ?auto_648 ) ( AVAILABLE ?auto_649 ) ( SURFACE-AT ?auto_644 ?auto_648 ) ( ON ?auto_644 ?auto_650 ) ( CLEAR ?auto_644 ) ( TRUCK-AT ?auto_647 ?auto_646 ) ( not ( = ?auto_643 ?auto_644 ) ) ( not ( = ?auto_643 ?auto_650 ) ) ( not ( = ?auto_644 ?auto_650 ) ) ( not ( = ?auto_645 ?auto_649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_647 ?auto_646 ?auto_648 )
      ( !LIFT ?auto_649 ?auto_644 ?auto_650 ?auto_648 )
      ( !LOAD ?auto_649 ?auto_644 ?auto_647 ?auto_648 )
      ( !DRIVE ?auto_647 ?auto_648 ?auto_646 )
      ( !UNLOAD ?auto_645 ?auto_644 ?auto_647 ?auto_646 )
      ( !DROP ?auto_645 ?auto_644 ?auto_643 ?auto_646 )
      ( MAKE-1CRATE-VERIFY ?auto_643 ?auto_644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_656 - SURFACE
      ?auto_657 - SURFACE
      ?auto_658 - SURFACE
      ?auto_659 - SURFACE
      ?auto_660 - SURFACE
    )
    :vars
    (
      ?auto_661 - HOIST
      ?auto_664 - PLACE
      ?auto_665 - PLACE
      ?auto_663 - HOIST
      ?auto_662 - SURFACE
      ?auto_669 - SURFACE
      ?auto_667 - SURFACE
      ?auto_668 - PLACE
      ?auto_670 - HOIST
      ?auto_671 - SURFACE
      ?auto_666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_661 ?auto_664 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_665 ?auto_664 ) ) ( HOIST-AT ?auto_663 ?auto_665 ) ( SURFACE-AT ?auto_660 ?auto_665 ) ( ON ?auto_660 ?auto_662 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_659 ?auto_662 ) ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( IS-CRATE ?auto_659 ) ( SURFACE-AT ?auto_659 ?auto_665 ) ( ON ?auto_659 ?auto_669 ) ( CLEAR ?auto_659 ) ( not ( = ?auto_658 ?auto_659 ) ) ( not ( = ?auto_658 ?auto_669 ) ) ( not ( = ?auto_659 ?auto_669 ) ) ( IS-CRATE ?auto_658 ) ( AVAILABLE ?auto_663 ) ( SURFACE-AT ?auto_658 ?auto_665 ) ( ON ?auto_658 ?auto_667 ) ( CLEAR ?auto_658 ) ( not ( = ?auto_657 ?auto_658 ) ) ( not ( = ?auto_657 ?auto_667 ) ) ( not ( = ?auto_658 ?auto_667 ) ) ( SURFACE-AT ?auto_656 ?auto_664 ) ( CLEAR ?auto_656 ) ( IS-CRATE ?auto_657 ) ( AVAILABLE ?auto_661 ) ( not ( = ?auto_668 ?auto_664 ) ) ( HOIST-AT ?auto_670 ?auto_668 ) ( AVAILABLE ?auto_670 ) ( SURFACE-AT ?auto_657 ?auto_668 ) ( ON ?auto_657 ?auto_671 ) ( CLEAR ?auto_657 ) ( TRUCK-AT ?auto_666 ?auto_664 ) ( not ( = ?auto_656 ?auto_657 ) ) ( not ( = ?auto_656 ?auto_671 ) ) ( not ( = ?auto_657 ?auto_671 ) ) ( not ( = ?auto_661 ?auto_670 ) ) ( not ( = ?auto_656 ?auto_658 ) ) ( not ( = ?auto_656 ?auto_667 ) ) ( not ( = ?auto_658 ?auto_671 ) ) ( not ( = ?auto_665 ?auto_668 ) ) ( not ( = ?auto_663 ?auto_670 ) ) ( not ( = ?auto_667 ?auto_671 ) ) ( not ( = ?auto_656 ?auto_659 ) ) ( not ( = ?auto_656 ?auto_669 ) ) ( not ( = ?auto_657 ?auto_659 ) ) ( not ( = ?auto_657 ?auto_669 ) ) ( not ( = ?auto_659 ?auto_667 ) ) ( not ( = ?auto_659 ?auto_671 ) ) ( not ( = ?auto_669 ?auto_667 ) ) ( not ( = ?auto_669 ?auto_671 ) ) ( not ( = ?auto_656 ?auto_660 ) ) ( not ( = ?auto_656 ?auto_662 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_657 ?auto_662 ) ) ( not ( = ?auto_658 ?auto_660 ) ) ( not ( = ?auto_658 ?auto_662 ) ) ( not ( = ?auto_660 ?auto_669 ) ) ( not ( = ?auto_660 ?auto_667 ) ) ( not ( = ?auto_660 ?auto_671 ) ) ( not ( = ?auto_662 ?auto_669 ) ) ( not ( = ?auto_662 ?auto_667 ) ) ( not ( = ?auto_662 ?auto_671 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_656 ?auto_657 ?auto_658 ?auto_659 )
      ( MAKE-1CRATE ?auto_659 ?auto_660 )
      ( MAKE-4CRATE-VERIFY ?auto_656 ?auto_657 ?auto_658 ?auto_659 ?auto_660 ) )
  )

)

