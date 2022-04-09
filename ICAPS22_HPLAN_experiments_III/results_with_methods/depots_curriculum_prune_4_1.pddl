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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_601 - SURFACE
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_605 - HOIST
      ?auto_608 - PLACE
      ?auto_609 - PLACE
      ?auto_607 - HOIST
      ?auto_604 - SURFACE
      ?auto_610 - PLACE
      ?auto_612 - HOIST
      ?auto_611 - SURFACE
      ?auto_606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_605 ?auto_608 ) ( IS-CRATE ?auto_603 ) ( not ( = ?auto_609 ?auto_608 ) ) ( HOIST-AT ?auto_607 ?auto_609 ) ( AVAILABLE ?auto_607 ) ( SURFACE-AT ?auto_603 ?auto_609 ) ( ON ?auto_603 ?auto_604 ) ( CLEAR ?auto_603 ) ( not ( = ?auto_602 ?auto_603 ) ) ( not ( = ?auto_602 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_604 ) ) ( not ( = ?auto_605 ?auto_607 ) ) ( SURFACE-AT ?auto_601 ?auto_608 ) ( CLEAR ?auto_601 ) ( IS-CRATE ?auto_602 ) ( AVAILABLE ?auto_605 ) ( not ( = ?auto_610 ?auto_608 ) ) ( HOIST-AT ?auto_612 ?auto_610 ) ( AVAILABLE ?auto_612 ) ( SURFACE-AT ?auto_602 ?auto_610 ) ( ON ?auto_602 ?auto_611 ) ( CLEAR ?auto_602 ) ( TRUCK-AT ?auto_606 ?auto_608 ) ( not ( = ?auto_601 ?auto_602 ) ) ( not ( = ?auto_601 ?auto_611 ) ) ( not ( = ?auto_602 ?auto_611 ) ) ( not ( = ?auto_605 ?auto_612 ) ) ( not ( = ?auto_601 ?auto_603 ) ) ( not ( = ?auto_601 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_610 ) ) ( not ( = ?auto_607 ?auto_612 ) ) ( not ( = ?auto_604 ?auto_611 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_601 ?auto_602 )
      ( MAKE-1CRATE ?auto_602 ?auto_603 )
      ( MAKE-2CRATE-VERIFY ?auto_601 ?auto_602 ?auto_603 ) )
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
      ?auto_632 - HOIST
      ?auto_635 - PLACE
      ?auto_633 - PLACE
      ?auto_636 - HOIST
      ?auto_631 - SURFACE
      ?auto_640 - SURFACE
      ?auto_639 - PLACE
      ?auto_638 - HOIST
      ?auto_637 - SURFACE
      ?auto_634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_632 ?auto_635 ) ( IS-CRATE ?auto_630 ) ( not ( = ?auto_633 ?auto_635 ) ) ( HOIST-AT ?auto_636 ?auto_633 ) ( SURFACE-AT ?auto_630 ?auto_633 ) ( ON ?auto_630 ?auto_631 ) ( CLEAR ?auto_630 ) ( not ( = ?auto_629 ?auto_630 ) ) ( not ( = ?auto_629 ?auto_631 ) ) ( not ( = ?auto_630 ?auto_631 ) ) ( not ( = ?auto_632 ?auto_636 ) ) ( IS-CRATE ?auto_629 ) ( AVAILABLE ?auto_636 ) ( SURFACE-AT ?auto_629 ?auto_633 ) ( ON ?auto_629 ?auto_640 ) ( CLEAR ?auto_629 ) ( not ( = ?auto_628 ?auto_629 ) ) ( not ( = ?auto_628 ?auto_640 ) ) ( not ( = ?auto_629 ?auto_640 ) ) ( SURFACE-AT ?auto_627 ?auto_635 ) ( CLEAR ?auto_627 ) ( IS-CRATE ?auto_628 ) ( AVAILABLE ?auto_632 ) ( not ( = ?auto_639 ?auto_635 ) ) ( HOIST-AT ?auto_638 ?auto_639 ) ( AVAILABLE ?auto_638 ) ( SURFACE-AT ?auto_628 ?auto_639 ) ( ON ?auto_628 ?auto_637 ) ( CLEAR ?auto_628 ) ( TRUCK-AT ?auto_634 ?auto_635 ) ( not ( = ?auto_627 ?auto_628 ) ) ( not ( = ?auto_627 ?auto_637 ) ) ( not ( = ?auto_628 ?auto_637 ) ) ( not ( = ?auto_632 ?auto_638 ) ) ( not ( = ?auto_627 ?auto_629 ) ) ( not ( = ?auto_627 ?auto_640 ) ) ( not ( = ?auto_629 ?auto_637 ) ) ( not ( = ?auto_633 ?auto_639 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_640 ?auto_637 ) ) ( not ( = ?auto_627 ?auto_630 ) ) ( not ( = ?auto_627 ?auto_631 ) ) ( not ( = ?auto_628 ?auto_630 ) ) ( not ( = ?auto_628 ?auto_631 ) ) ( not ( = ?auto_630 ?auto_640 ) ) ( not ( = ?auto_630 ?auto_637 ) ) ( not ( = ?auto_631 ?auto_640 ) ) ( not ( = ?auto_631 ?auto_637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_627 ?auto_628 ?auto_629 )
      ( MAKE-1CRATE ?auto_629 ?auto_630 )
      ( MAKE-3CRATE-VERIFY ?auto_627 ?auto_628 ?auto_629 ?auto_630 ) )
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
      ?auto_662 - HOIST
      ?auto_665 - PLACE
      ?auto_663 - PLACE
      ?auto_666 - HOIST
      ?auto_664 - SURFACE
      ?auto_668 - SURFACE
      ?auto_670 - SURFACE
      ?auto_669 - PLACE
      ?auto_671 - HOIST
      ?auto_667 - SURFACE
      ?auto_661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_662 ?auto_665 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_663 ?auto_665 ) ) ( HOIST-AT ?auto_666 ?auto_663 ) ( SURFACE-AT ?auto_660 ?auto_663 ) ( ON ?auto_660 ?auto_664 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_659 ?auto_664 ) ) ( not ( = ?auto_660 ?auto_664 ) ) ( not ( = ?auto_662 ?auto_666 ) ) ( IS-CRATE ?auto_659 ) ( SURFACE-AT ?auto_659 ?auto_663 ) ( ON ?auto_659 ?auto_668 ) ( CLEAR ?auto_659 ) ( not ( = ?auto_658 ?auto_659 ) ) ( not ( = ?auto_658 ?auto_668 ) ) ( not ( = ?auto_659 ?auto_668 ) ) ( IS-CRATE ?auto_658 ) ( AVAILABLE ?auto_666 ) ( SURFACE-AT ?auto_658 ?auto_663 ) ( ON ?auto_658 ?auto_670 ) ( CLEAR ?auto_658 ) ( not ( = ?auto_657 ?auto_658 ) ) ( not ( = ?auto_657 ?auto_670 ) ) ( not ( = ?auto_658 ?auto_670 ) ) ( SURFACE-AT ?auto_656 ?auto_665 ) ( CLEAR ?auto_656 ) ( IS-CRATE ?auto_657 ) ( AVAILABLE ?auto_662 ) ( not ( = ?auto_669 ?auto_665 ) ) ( HOIST-AT ?auto_671 ?auto_669 ) ( AVAILABLE ?auto_671 ) ( SURFACE-AT ?auto_657 ?auto_669 ) ( ON ?auto_657 ?auto_667 ) ( CLEAR ?auto_657 ) ( TRUCK-AT ?auto_661 ?auto_665 ) ( not ( = ?auto_656 ?auto_657 ) ) ( not ( = ?auto_656 ?auto_667 ) ) ( not ( = ?auto_657 ?auto_667 ) ) ( not ( = ?auto_662 ?auto_671 ) ) ( not ( = ?auto_656 ?auto_658 ) ) ( not ( = ?auto_656 ?auto_670 ) ) ( not ( = ?auto_658 ?auto_667 ) ) ( not ( = ?auto_663 ?auto_669 ) ) ( not ( = ?auto_666 ?auto_671 ) ) ( not ( = ?auto_670 ?auto_667 ) ) ( not ( = ?auto_656 ?auto_659 ) ) ( not ( = ?auto_656 ?auto_668 ) ) ( not ( = ?auto_657 ?auto_659 ) ) ( not ( = ?auto_657 ?auto_668 ) ) ( not ( = ?auto_659 ?auto_670 ) ) ( not ( = ?auto_659 ?auto_667 ) ) ( not ( = ?auto_668 ?auto_670 ) ) ( not ( = ?auto_668 ?auto_667 ) ) ( not ( = ?auto_656 ?auto_660 ) ) ( not ( = ?auto_656 ?auto_664 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_657 ?auto_664 ) ) ( not ( = ?auto_658 ?auto_660 ) ) ( not ( = ?auto_658 ?auto_664 ) ) ( not ( = ?auto_660 ?auto_668 ) ) ( not ( = ?auto_660 ?auto_670 ) ) ( not ( = ?auto_660 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_668 ) ) ( not ( = ?auto_664 ?auto_670 ) ) ( not ( = ?auto_664 ?auto_667 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_656 ?auto_657 ?auto_658 ?auto_659 )
      ( MAKE-1CRATE ?auto_659 ?auto_660 )
      ( MAKE-4CRATE-VERIFY ?auto_656 ?auto_657 ?auto_658 ?auto_659 ?auto_660 ) )
  )

)

